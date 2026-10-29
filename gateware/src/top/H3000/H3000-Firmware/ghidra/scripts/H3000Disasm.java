// Controlled 6809 disassembly for Eventide H3000/H3500 firmware.
//
// The kernel and the banked modules call many helper routines that take
// arguments stored inline after the call instruction (the helper reads its
// return address, consumes the bytes, and returns past them). Ghidra's normal
// flow following runs straight into that data, so this script performs its own
// worklist disassembly:
//   * every call to a helper listed in the rules file gets its inline bytes
//     typed as data, a fall-through override past them, and an EOL comment
//     describing the arguments;
//   * jump-table / switch helpers have their targets followed;
//   * all call targets become functions.
//
// Args: <rules-file> [clear]
//   clear  - clear all instructions in initialized, executable memory first
//
// Rules file lines:   <where> <kind> [spec]
//   where : slot:FCxx (kernel API table entry) or addr:XXXX (base-space address)
//   kind  : fixed <spec>   spec chars: B byte, W word, P pointer, F code pointer,
//                                      C char (consecutive C's form one string)
//           addrword       (addr,word)* terminated by addr == $FFFF
//           addrbyte       (addr,byte)* terminated by addr == $FFFF
//           switch         (value,target)* ; an entry with target $FFFF ends it
//           jumptable      code pointers indexed by D, no fall-through
//           dispstr        display string with control codes (see below)
//           counted        word N followed by N bytes
//   dispstr control codes: 0 end, 1 -, 2 +1 byte, 3 +2 (string ptr), 4 +2, 5 +1, 6 -, 7 -
//
//@category H3000

import ghidra.app.cmd.function.CreateFunctionCmd;
import ghidra.app.script.GhidraScript;
import ghidra.app.util.PseudoInstruction;
import ghidra.program.model.address.*;
import ghidra.program.model.data.*;
import ghidra.program.model.lang.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.util.CodeUnitInsertionException;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public class H3000Disasm extends GhidraScript {

	static class Rule {
		String kind;
		String spec;
		String label;
	}

	private Memory mem;
	private Listing listing;
	private AddressSpace ram;
	private Language lang;
	private final Map<Address, Rule> rules = new HashMap<>();
	private final Set<Address> callTargets = new TreeSet<>();
	private final Deque<Address> work = new ArrayDeque<>();
	private int inlineSites = 0;
	private int badDecodes = 0;
	private boolean scan = false;
	private final Set<Address> scanTried = new HashSet<>();

	@Override
	public void run() throws Exception {
		String[] args = getScriptArgs();
		mem = currentProgram.getMemory();
		listing = currentProgram.getListing();
		ram = currentProgram.getAddressFactory().getDefaultAddressSpace();
		lang = currentProgram.getLanguage();
		loadRules(args[0]);
		boolean clear = false;
		for (int i = 1; i < args.length; i++) {
			clear |= args[i].equals("clear");
			scan |= args[i].equals("scan");
		}

		if (clear) {
			// start from scratch: functions from earlier runs may sit on data
			List<Function> fs = new ArrayList<>();
			for (Function f : listing.getFunctions(true)) {
				fs.add(f);
			}
			for (Function f : fs) {
				currentProgram.getFunctionManager().removeFunction(f.getEntryPoint());
			}
			for (MemoryBlock b : mem.getBlocks()) {
				if (b.isInitialized() && b.isExecute()) {
					listing.clearCodeUnits(b.getStart(), b.getEnd(), false);
				}
			}
			// restore vector table / API table data cleared above
			for (int i = 0; i < 8; i++) {
				createData(ram.getAddress(0xFFF0 + 2 * i), new Pointer16DataType());
			}
			createData(ram.getAddress(0xFC00), new ArrayDataType(new Pointer16DataType(), 256, 2));
			createData(ram.getAddress(0xFE00), new ArrayDataType(new Pointer16DataType(), feEntries(), 2));
		}
		for (int i = 0; i < feEntries(); i++) {
			addRoot(readPtr(ram.getAddress(0xFE00 + 2 * i)), true);
		}

		// roots: vectors, API table targets, existing functions, module entry points
		for (int i = 1; i < 8; i++) {
			addRoot(readPtr(ram.getAddress(0xFFF0 + 2 * i)), true);
		}
		for (int i = 0; i < 256; i++) {
			addRoot(readPtr(ram.getAddress(0xFC00 + 2 * i)), true);
		}
		for (Function f : listing.getFunctions(true)) {
			addRoot(f.getEntryPoint(), true);
		}
		for (MemoryBlock b : mem.getBlocks()) {
			if (b.isOverlay() && b.isInitialized()) {
				int sub = mem.getByte(b.getStart().add(9)) & 0xff;
				boolean sig = (mem.getByte(b.getStart()) & 0xff) == 0xAA;
				int modId = mem.getByte(b.getStart().add(8)) & 0xff;
				if (sig && modId < 0xC8 && (sub == 0x01 || sub == 0x02)) {
					addRoot(b.getStart().add(0x10), true);
				}
			}
		}

		for (int pass = 0; pass < 100; pass++) {
			while (!work.isEmpty()) {
				monitor.checkCancelled();
				follow(work.pop());
			}
			int repaired = repairInlineSites();
			int modPtrs = moduleRelativePointers();
			int scanned = scan ? scanGaps() + scanCallbacks() : 0;
			if (repaired == 0 && modPtrs == 0 && scanned == 0) {
				break;
			}
			println(String.format("pass %d: repaired %d call sites, %d module-relative pointers, %d gap roots",
				pass, repaired, modPtrs, scanned));
		}

		int made = 0;
		for (Address a : callTargets) {
			if (listing.getInstructionAt(a) != null && getFunctionAt(a) == null) {
				if (createFunction(a, null) != null) {
					made++;
				}
			}
		}
		// inline helpers do return (past their data); only the jump-table dispatcher does not
		for (Map.Entry<Address, Rule> e : rules.entrySet()) {
			Function hf = getFunctionAt(e.getKey());
			if (hf != null) {
				hf.setNoReturn(e.getValue().kind.equals("jumptable"));
			}
		}
		// undo "non-returning" flow damage repairs on calls to returning helpers
		int unflow = 0;
		for (Instruction ins : listing.getInstructions(true)) {
			if (ins.getFlowOverride() == FlowOverride.NONE || !ins.getFlowType().isCall() &&
				ins.getFlowOverride() != FlowOverride.CALL_RETURN) {
				continue;
			}
			Address t = callTarget(ins);
			Rule r = t == null ? null : rules.get(t);
			if (r != null && !r.kind.equals("jumptable")) {
				ins.setFlowOverride(FlowOverride.NONE);
				unflow++;
			}
		}
		if (unflow > 0) {
			println("cleared flow overrides on " + unflow + " helper calls");
		}
		// functions that are only reached by falling through from the previous instruction
		// (e.g. code after an inline-argument call) are not real entry points: remove them
		int merged = 0;
		List<Function> fallInto = new ArrayList<>();
		for (Function f : listing.getFunctions(true)) {
			Address e = f.getEntryPoint();
			Instruction prev = listing.getInstructionBefore(e);
			if (prev == null || !e.equals(prev.getFallThrough())) {
				continue;
			}
			boolean called = false;
			for (Reference ref : currentProgram.getReferenceManager().getReferencesTo(e)) {
				if (ref.getReferenceType().isCall() || ref.getReferenceType().isData()) {
					called = true;
					break;
				}
			}
			if (!called) {
				fallInto.add(f);
			}
		}
		for (Function f : fallInto) {
			currentProgram.getFunctionManager().removeFunction(f.getEntryPoint());
			merged++;
		}
		if (merged > 0) {
			println("removed " + merged + " fall-through-only functions");
		}
		// bodies created before fall-through overrides existed are stale: recompute all
		int fixed = 0;
		for (Function f : listing.getFunctions(true)) {
			AddressSetView before = f.getBody();
			if (CreateFunctionCmd.fixupFunctionBody(currentProgram, f, monitor) &&
				!before.equals(f.getBody())) {
				fixed++;
			}
		}
		println(String.format("inline sites: %d, call targets: %d, new functions: %d, bad decodes: %d, bodies fixed: %d",
			inlineSites, callTargets.size(), made, badDecodes, fixed));
	}

	// ---------------------------------------------------------------------

	private void loadRules(String path) throws Exception {
		for (String line : Files.readAllLines(Paths.get(path))) {
			line = line.replaceAll("#.*", "").trim();
			if (line.isEmpty()) {
				continue;
			}
			String[] p = line.split("\\s+");
			Address helper;
			if (p[0].startsWith("slot:")) {
				int slot = Integer.parseInt(p[0].substring(5), 16);
				helper = readPtr(ram.getAddress(slot));
			}
			else if (p[0].startsWith("at:")) {
				helper = currentProgram.getAddressFactory().getAddress(p[0].substring(3));
			}
			else {
				helper = ram.getAddress(Integer.parseInt(p[0].substring(5), 16));
			}
			Rule r = new Rule();
			r.kind = p[1];
			r.spec = p.length > 2 ? p[2] : "";
			r.label = p[0];
			rules.put(helper, r);
		}
		println("rules loaded: " + rules.size());
	}

	/** Number of entries in the $FE00 extended API table (ends at the first $FFFF). */
	private int feEntries() throws MemoryAccessException {
		int n = 0;
		while (n < 64 && u16(ram.getAddress(0xFE00 + 2 * n)) != 0xFFFF &&
			u16(ram.getAddress(0xFE00 + 2 * n)) >= 0x8400) {
			n++;
		}
		return n;
	}

	private Address readPtr(Address a) throws MemoryAccessException {
		int v = ((mem.getByte(a) & 0xff) << 8) | (mem.getByte(a.add(1)) & 0xff);
		return ram.getAddress(v);
	}

	private int u8(Address a) throws MemoryAccessException {
		return mem.getByte(a) & 0xff;
	}

	private int u16(Address a) throws MemoryAccessException {
		return (u8(a) << 8) | u8(a.add(1));
	}

	/** Address in the same space as 'base' (overlay-aware) for a 16-bit value. */
	private Address sameSpace(Address base, int value) {
		Address a = base.getAddressSpace().getAddress(value);
		MemoryBlock b = mem.getBlock(a);
		if (b == null || !b.isInitialized()) {
			Address r = ram.getAddress(value);
			return r;
		}
		return a;
	}

	private boolean isCode(Address a) {
		MemoryBlock b = mem.getBlock(a);
		return b != null && b.isInitialized() && b.isExecute();
	}

	private void addRoot(Address a, boolean isCall) {
		if (a == null || !isCode(a)) {
			return;
		}
		if (isCall) {
			callTargets.add(a);
		}
		work.push(a);
	}

	private Instruction decodeAt(Address a) {
		Instruction ins = listing.getInstructionAt(a);
		if (ins != null) {
			return null; // already done
		}
		if (listing.getInstructionContaining(a) != null || listing.getDefinedDataContaining(a) != null) {
			CodeUnit cu = listing.getCodeUnitContaining(a);
			if (cu instanceof Data && !((Data) cu).isDefined()) {
				// undefined is fine
			}
			else {
				noteBad(a, "inside " + (cu instanceof Data ? "data" : "instruction") + " at " + cu.getMinAddress());
				return null;
			}
		}
		try {
			MemoryBufferImpl buf = new MemoryBufferImpl(mem, a);
			ProgramProcessorContext ctx = new ProgramProcessorContext(currentProgram.getProgramContext(), a);
			InstructionPrototype proto = lang.parse(buf, ctx, false);
			Address end = a.add(proto.getLength() - 1);
			if (listing.getInstructions(new AddressSet(a, end), true).hasNext() ||
				listing.getDefinedData(new AddressSet(a, end), true).hasNext()) {
				noteBad(a, "overlaps existing code/data");
				return null;
			}
			return listing.createInstruction(a, proto, buf, ctx, proto.getLength());
		}
		catch (Exception e) {
			noteBad(a, "invalid opcode");
			return null;
		}
	}

	private Address flowFrom = null;

	private void noteBad(Address a, String why) {
		badDecodes++;
		if (badDecodes <= 40) {
			println("  bad decode at " + a + " (" + why + ") from flow starting " + flowFrom);
		}
	}

	private Address callTarget(Instruction ins) throws MemoryAccessException {
		byte[] b = ins.getBytes();
		if (b.length == 4 && (b[0] & 0xff) == 0xAD && (b[1] & 0xff) == 0x9F) {
			Address ptr = ram.getAddress(((b[2] & 0xff) << 8) | (b[3] & 0xff));
			MemoryBlock blk = mem.getBlock(ptr);
			if (blk != null && blk.isInitialized() && !blk.isOverlay()) {
				return readPtr(ptr);
			}
			return null;
		}
		// flows may include an overridden fall-through, so prefer the call reference
		for (Reference ref : ins.getReferencesFrom()) {
			if (ref.getReferenceType().isCall()) {
				return ref.getToAddress();
			}
		}
		Address ft = ins.isFallThroughOverridden() ? ins.getFallThrough() : null;
		for (Address f : ins.getFlows()) {
			if (!f.equals(ft)) {
				return f;
			}
		}
		return null;
	}

	private void follow(Address start) throws Exception {
		Address a = start;
		flowFrom = start;
		while (a != null) {
			if (!isCode(a)) {
				return;
			}
			Instruction ins = decodeAt(a);
			if (ins == null) {
				return;
			}
			FlowType ft = ins.getFlowType();
			Address next = ins.getMaxAddress().next();

			if (ft.isCall()) {
				Address t = callTarget(ins);
				if (t != null) {
					addRoot(t, true);
					Rule r = rules.get(t);
					if (r != null && r.kind.equals("xdesc")) {
						applyXDesc(ins, r);
						r = null;
					}
					if (r != null) {
						Address after = applyRule(ins, next, r);
						ins.setFallThrough(after);
						a = after;
						continue;
					}
				}
			}
			else if (ft.isJump()) {
				for (Address t : ins.getFlows()) {
					addRoot(t, false);
				}
			}
			if (ft.isTerminal() || (ft.isJump() && !ft.isConditional()) || !ft.hasFallthrough()) {
				return;
			}
			a = next;
		}
	}

	/**
	 * Helper takes a descriptor in X: if the preceding instruction is "LDX #imm", type the
	 * descriptor at imm (same address space as the caller) with the rule's fixed spec.
	 */
	private void applyXDesc(Instruction call, Rule r) throws Exception {
		Instruction prev = listing.getInstructionBefore(call.getAddress());
		if (prev == null || !prev.getMaxAddress().next().equals(call.getAddress())) {
			return;
		}
		byte[] b = prev.getBytes();
		if (b.length != 3 || (b[0] & 0xff) != 0x8E) {
			return;
		}
		int imm = ((b[1] & 0xff) << 8) | (b[2] & 0xff);
		Address d = sameSpace(call.getAddress(), imm);
		MemoryBlock blk = mem.getBlock(d);
		if (blk == null || !blk.isInitialized() || listing.getInstructionContaining(d) != null) {
			return;
		}
		StringBuilder c = new StringBuilder("desc[" + r.label.replace("slot:", "API_") + "]: ");
		parseFixed(d, r.spec, c);
		if (prev.getReferencesFrom().length == 0) {
			prev.addOperandReference(0, d, RefType.DATA, SourceType.ANALYSIS);
		}
		prev.setComment(CodeUnit.EOL_COMMENT, c.toString().trim());
		inlineSites++;
	}

	/**
	 * Calls to rule helpers that were disassembled by something else (Ghidra auto-analysis)
	 * and still fall through into their inline data: clear the data range and re-apply.
	 */
	private int repairInlineSites() throws Exception {
		int n = 0;
		List<Instruction> todo = new ArrayList<>();
		for (Instruction ins : listing.getInstructions(true)) {
			if (!ins.getFlowType().isCall() || ins.isFallThroughOverridden()) {
				continue;
			}
			Address t = callTarget(ins);
			if (t != null && rules.containsKey(t) && !rules.get(t).kind.equals("xdesc")) {
				todo.add(ins);
			}
		}
		for (Instruction ins : todo) {
			Address next = ins.getMaxAddress().next();
			Rule r = rules.get(callTarget(ins));
			Address after = applyRuleSafely(ins, next, r);
			ins.setFallThrough(after);
			if (after != null) {
				Instruction at = listing.getInstructionAt(after);
				if (at == null) {
					work.push(after);
				}
			}
			n++;
		}
		return n;
	}

	private Address applyRuleSafely(Instruction ins, Address next, Rule r) throws Exception {
		// first compute the extent without touching the listing, by parsing into a scratch pass
		Address after = applyRule(ins, next, r);
		Address end = after != null ? after : next.add(2);
		// remove stale instructions that started inside the inline data
		AddressSet span = new AddressSet(next, end.subtract(1));
		List<Instruction> stale = new ArrayList<>();
		for (Instruction x : listing.getInstructions(span, true)) {
			stale.add(x);
		}
		for (Instruction x : stale) {
			listing.clearCodeUnits(x.getAddress(), x.getMaxAddress(), false);
		}
		if (!stale.isEmpty()) {
			after = applyRule(ins, next, r); // re-type now that the range is clear
		}
		return after;
	}

	/**
	 * Module code forms absolute pointers as "LDD #off ; ADDD $600D" (module base) or passes
	 * "LDD #off" to API_FC62 (store D + base). Follow such offsets when they land on a PSHS
	 * prologue inside the same overlay.
	 */
	private int moduleRelativePointers() throws Exception {
		int n = 0;
		for (MemoryBlock b : mem.getBlocks()) {
			if (!b.isOverlay() || !b.isInitialized()) {
				continue;
			}
			for (Instruction ins : listing.getInstructions(new AddressSet(b.getStart(), b.getEnd()), true)) {
				byte[] by = ins.getBytes();
				if (by.length != 3 || (by[0] & 0xff) != 0xCC) {
					continue;
				}
				Instruction nx = ins.getNext();
				if (nx == null) {
					continue;
				}
				byte[] nb = nx.getBytes();
				boolean addBase = nb.length == 3 && (nb[0] & 0xff) == 0xF3 && (nb[1] & 0xff) == 0x60 &&
					(nb[2] & 0xff) == 0x0D;
				boolean storeBase = nb.length == 4 && (nb[0] & 0xff) == 0xAD && (nb[1] & 0xff) == 0x9F &&
					(nb[2] & 0xff) == 0xFC && (nb[3] & 0xff) == 0x62;
				if (!addBase && !storeBase) {
					continue;
				}
				int off = ((by[1] & 0xff) << 8) | (by[2] & 0xff);
				if (off < 0x10 || off >= 0x4000) {
					continue;
				}
				Address t = b.getStart().add(off);
				if (ins.getReferencesFrom().length == 0) {
					ins.addOperandReference(0, t, RefType.DATA, SourceType.ANALYSIS);
				}
				if (u8(t) == 0x34 && listing.getInstructionAt(t) == null &&
					listing.getDefinedDataContaining(t) == null) {
					addRoot(t, true);
					n++;
				}
			}
		}
		return n;
	}

	private AddressSetView gaps(MemoryBlock b) {
		AddressSet all = new AddressSet(b.getStart(), b.getEnd());
		AddressSet used = new AddressSet();
		for (CodeUnit cu : listing.getCodeUnits(all, true)) {
			if (cu instanceof Instruction || (cu instanceof Data && ((Data) cu).isDefined())) {
				used.add(cu.getMinAddress(), cu.getMaxAddress());
			}
		}
		return all.subtract(used);
	}

	private boolean plausibleStart(Address t) throws MemoryAccessException {
		if (!isCode(t) || listing.getDefinedDataContaining(t) != null) {
			return false;
		}
		if (listing.getInstructionAt(t) != null) {
			return true;
		}
		return listing.getInstructionContaining(t) == null && u8(t) != 0xFF;
	}

	/**
	 * First bytes that commonly open a routine and rarely open ASCII text or tables:
	 * PSHS, LBSR, BSR, JSR [API table], and non-ASCII immediate/extended loads.
	 */
	private boolean prologueByte(Address a) throws MemoryAccessException {
		int b0 = u8(a);
		int b1 = u8(a.add(1));
		switch (b0) {
			case 0x34: // PSHS
				return b1 != 0;
			case 0x17: // LBSR
			case 0x8D: // BSR
			case 0x86: // LDA #
			case 0xC6: // LDB #
			case 0xCC: // LDD #
			case 0x8E: // LDX #
			case 0xCE: // LDU #
			case 0x7F: // CLR ext
			case 0xB6: // LDA ext
			case 0xF6: // LDB ext
			case 0xFC: // LDD ext
				return true;
			case 0x10:
				return b1 == 0x8E; // LDY #
			case 0xAD:
				return b1 == 0x9F && u8(a.add(2)) >= 0xFC; // JSR [$FCxx-$FExx]
			default:
				return false;
		}
	}

	/**
	 * Decode (without creating) up to 6 instructions from a; true if one of them is
	 * JSR [$FC00-$FEFF] before any invalid opcode or flow break.
	 */
	private boolean probeApiCall(Address a) {
		Address p = a;
		try {
			for (int i = 0; i < 6; i++) {
				if (listing.getInstructionContaining(p) != null || listing.getDefinedDataContaining(p) != null) {
					return false;
				}
				MemoryBufferImpl buf = new MemoryBufferImpl(mem, p);
				ProgramProcessorContext ctx = new ProgramProcessorContext(currentProgram.getProgramContext(), p);
				InstructionPrototype proto = lang.parse(buf, ctx, false);
				int len = proto.getLength();
				if (len == 4 && u8(p) == 0xAD && u8(p.add(1)) == 0x9F && u8(p.add(2)) >= 0xFC) {
					return true;
				}
				FlowType ft = new PseudoInstruction(p, proto, buf, ctx).getFlowType();
				if (ft.isTerminal() || ft.isJump()) {
					return false;
				}
				p = p.add(len);
			}
		}
		catch (Exception e) {
			return false;
		}
		return false;
	}

	/** Does a function plausibly start at t (previous code ends with a flow break)? */
	private boolean atBoundary(Address t) throws MemoryAccessException {
		if (!plausibleStart(t) || listing.getInstructionAt(t) != null) {
			return false;
		}
		MemoryBlock b = mem.getBlock(t);
		if (t.equals(b.getStart())) {
			return true;
		}
		CodeUnit prev = listing.getCodeUnitContaining(t.subtract(1));
		if (prev instanceof Instruction) {
			Instruction pi = (Instruction) prev;
			FlowType ft = pi.getFlowType();
			return !ft.hasFallthrough() || ft.isTerminal() || (ft.isJump() && !ft.isConditional()) ||
				(pi.isFallThroughOverridden() && pi.getFallThrough() == null);
		}
		if (prev instanceof Data && ((Data) prev).isDefined()) {
			return true;
		}
		int b1 = u8(t.subtract(1));
		int b2 = t.getOffset() >= 2 ? u8(t.subtract(2)) : 0;
		int b3 = t.getOffset() >= 3 ? u8(t.subtract(3)) : 0;
		return b1 == 0x39 || b1 == 0x3B || (b2 == 0x35 && (b1 & 0x80) != 0) || b2 == 0x20 || b3 == 0x16 ||
			b3 == 0x7E;
	}

	/**
	 * Code pointers stored into RAM: "LDD/LDX/LDY/LDU #imm" followed by a store, and the
	 * values of inline [addr]=word lists, when they point at a function boundary in the kernel.
	 */
	private int scanCallbacks() throws Exception {
		int n = 0;
		for (Instruction ins : listing.getInstructions(true)) {
			byte[] by = ins.getBytes();
			int imm = -1;
			if (by.length == 3 && ((by[0] & 0xff) == 0xCC || (by[0] & 0xff) == 0x8E || (by[0] & 0xff) == 0xCE)) {
				imm = ((by[1] & 0xff) << 8) | (by[2] & 0xff);
			}
			else if (by.length == 4 && (by[0] & 0xff) == 0x10 && (by[1] & 0xff) == 0x8E) {
				imm = ((by[2] & 0xff) << 8) | (by[3] & 0xff);
			}
			if (imm < 0x8400) {
				continue;
			}
			Instruction nx = ins.getNext();
			if (nx == null || !nx.getMnemonicString().toUpperCase().startsWith("ST")) {
				continue;
			}
			Address t = ram.getAddress(imm);
			if (atBoundary(t) && prologueByte(t) && scanTried.add(t)) {
				ins.addOperandReference(0, t, RefType.DATA, SourceType.ANALYSIS);
				addRoot(t, true);
				n++;
			}
		}
		for (Data d : listing.getDefinedData(true)) {
			if (!(d.getDataType() instanceof WordDataType)) {
				continue;
			}
			Data prev = listing.getDefinedDataBefore(d.getAddress());
			if (prev == null || !(prev.getDataType() instanceof Pointer)) {
				continue;
			}
			int v = u16(d.getAddress());
			int dst = u16(prev.getAddress());
			if (v < 0x8400 || dst < 0x6000 || dst >= 0x8000) {
				continue;
			}
			Address t = ram.getAddress(v);
			if (atBoundary(t) && scanTried.add(t)) {
				addRoot(t, true);
				n++;
			}
		}
		return n;
	}

	/**
	 * Gap scan (kernel only for pointer tables):
	 *  - runs of >= 3 big-endian words pointing at plausible code in $8400-$FFFF
	 *  - PSHS prologues directly after a terminal instruction
	 */
	private int scanGaps() throws Exception {
		int n = 0;
		MemoryBlock k = mem.getBlock("KERNEL");
		for (MemoryBlock b : mem.getBlocks()) {
			if (!b.isInitialized() || !b.isExecute()) {
				continue;
			}
			for (AddressRange r : gaps(b)) {
				Address a = r.getMinAddress();
				// pointer tables (kernel addresses only, so small-number data is not mistaken)
				if (b == k) {
					Address p = a;
					int run = 0;
					while (p.add(1).compareTo(r.getMaxAddress()) <= 0) {
						int v = u16(p);
						if (v >= 0x8400 && plausibleStart(ram.getAddress(v))) {
							run++;
							p = p.add(2);
						}
						else {
							break;
						}
					}
					if (run >= 3 && scanTried.add(a)) {
						listing.clearCodeUnits(a, a.add(2 * run - 1), false);
						listing.createData(a, new ArrayDataType(new Pointer16DataType(), run, 2));
						for (int i = 0; i < run; i++) {
							addRoot(ram.getAddress(u16(a.add(2 * i))), true);
						}
						n++;
						continue;
					}
				}
				// module pointer tables: >= 3 words pointing at code-like starts in the same overlay
				if (b.isOverlay()) {
					Address p = a;
					int run = 0;
					while (p.add(1).compareTo(r.getMaxAddress()) <= 0) {
						int v = u16(p);
						Address t = b.getStart().add(v & 0x3FFF);
						if (v >= 0x10 && v < 0x4000 && (listing.getInstructionAt(t) != null ||
							(plausibleStart(t) && prologueByte(t)))) {
							run++;
							p = p.add(2);
						}
						else {
							break;
						}
					}
					if (run >= 3 && scanTried.add(a)) {
						listing.clearCodeUnits(a, a.add(2 * run - 1), false);
						listing.createData(a, new ArrayDataType(new Pointer16DataType(), run, 2));
						for (int i = 0; i < run; i++) {
							addRoot(b.getStart().add(u16(a.add(2 * i))), true);
						}
						n++;
						continue;
					}
				}
				// overlays: any PSHS inside the gap that decodes cleanly into a JSR [API] call
				if (b.isOverlay()) {
					for (Address q = a; q.compareTo(r.getMaxAddress()) < 0; q = q.add(1)) {
						if (u8(q) == 0x34 && probeApiCall(q) && scanTried.add(q)) {
							addRoot(q, true);
							n++;
							break; // re-scan after this region is disassembled
						}
					}
				}
				// prologue after a terminal instruction
				Instruction prev = listing.getInstructionBefore(a);
				if (prev != null && prev.getMaxAddress().next().equals(a) && prologueByte(a) &&
					(!prev.getFlowType().hasFallthrough() || prev.getFlowType().isTerminal() ||
						(prev.getFlowType().isJump() && !prev.getFlowType().isConditional()) ||
						prev.isFallThroughOverridden() && prev.getFallThrough() == null) && scanTried.add(a)) {
					addRoot(a, true);
					n++;
				}
			}
		}
		return n;
	}

	// ---------------------------------------------------------------------
	// Inline argument parsing

	private void typed(Address a, DataType dt) {
		try {
			listing.clearCodeUnits(a, a.add(dt.getLength() - 1), false);
			listing.createData(a, dt);
		}
		catch (Exception e) {
			// overlapping instruction etc. - leave untyped
		}
	}

	private void codePtr(Address p) throws MemoryAccessException {
		typed(p, new Pointer16DataType());
		Address t = sameSpace(p, u16(p));
		addRoot(t, true);
	}

	/** Type a fixed-layout record at p (see rules spec chars); returns the address after it. */
	private Address parseFixed(Address p, String spec, StringBuilder c) throws Exception {
		Address end = p;
		int i = 0;
		while (i < spec.length()) {
			char k = spec.charAt(i);
			if (k == 'B') {
				typed(end, new ByteDataType());
				c.append(String.format("%02X ", u8(end)));
				end = end.add(1);
				i++;
			}
			else if (k == 'W' || k == 'P') {
				typed(end, k == 'W' ? new WordDataType() : new Pointer16DataType());
				c.append(String.format("$%04X ", u16(end)));
				end = end.add(2);
				i++;
			}
			else if (k == 'F') {
				codePtr(end);
				c.append(String.format("->$%04X ", u16(end)));
				end = end.add(2);
				i++;
			}
			else if (k == 'R' || k == 'r') {
				// self-relative pointer: target = address of the word + word (mod 64K);
				// 'R' = code (followed), 'r' = data (reference only)
				Address t = end.getAddressSpace().getAddress((end.getOffset() + u16(end)) & 0xFFFF);
				typed(end, new WordDataType());
				Data d = listing.getDataAt(end);
				if (d != null) {
					d.addOperandReference(0, t, RefType.DATA, SourceType.ANALYSIS);
				}
				if (k == 'R') {
					addRoot(t, true);
				}
				c.append(String.format("->$%04X(rel) ", t.getOffset()));
				end = end.add(2);
				i++;
			}
			else if (k == 'C') {
				int n = 0;
				while (i + n < spec.length() && spec.charAt(i + n) == 'C') {
					n++;
				}
				listing.clearCodeUnits(end, end.add(n - 1), false);
				try {
					listing.createData(end, new StringDataType(), n);
				}
				catch (CodeUnitInsertionException e) {
					// ignore
				}
				byte[] s = new byte[n];
				mem.getBytes(end, s);
				c.append('"').append(printable(s)).append("\" ");
				end = end.add(n);
				i += n;
			}
			else {
				throw new IllegalArgumentException("bad spec " + spec);
			}
		}
		return end;
	}

	private Address applyRule(Instruction ins, Address p, Rule r) throws Exception {
		inlineSites++;
		StringBuilder c = new StringBuilder("inline[" + r.label.replace("slot:", "API_") + "]: ");
		Address end = p;
		switch (r.kind) {
			case "fixed": {
				end = parseFixed(end, r.spec, c);
				break;
			}
			case "addrword":
			case "addrbyte": {
				boolean w = r.kind.equals("addrword");
				int n = 0;
				while (u16(end) != 0xFFFF && n < 256) {
					typed(end, new Pointer16DataType());
					int dst = u16(end);
					end = end.add(2);
					if (w) {
						typed(end, new WordDataType());
						c.append(String.format("[$%04X]=$%04X ", dst, u16(end)));
						end = end.add(2);
					}
					else {
						typed(end, new ByteDataType());
						c.append(String.format("[$%04X]=$%02X ", dst, u8(end)));
						end = end.add(1);
					}
					n++;
				}
				typed(end, new WordDataType());
				end = end.add(2);
				break;
			}
			case "addrrel": {
				// (addr, self-relative code pointer | 0)* terminated by addr == $FFFF
				int n = 0;
				while (u16(end) != 0xFFFF && n < 256) {
					typed(end, new Pointer16DataType());
					int dst = u16(end);
					end = end.add(2);
					if (u16(end) == 0) {
						typed(end, new WordDataType());
						c.append(String.format("[$%04X]=default ", dst));
					}
					else {
						StringBuilder tmp = new StringBuilder();
						parseFixed(end, "R", tmp);
						c.append(String.format("[$%04X]=%s", dst, tmp));
					}
					end = end.add(2);
					n++;
				}
				typed(end, new WordDataType());
				end = end.add(2);
				break;
			}
			case "switch": {
				int n = 0;
				c.append("switch(D) ");
				while (n < 256) {
					int val = u16(end);
					typed(end, new WordDataType());
					Address tp = end.add(2);
					int tgt = u16(tp);
					end = end.add(4);
					if (tgt == 0xFFFF) {
						typed(tp, new WordDataType());
						break;
					}
					codePtr(tp);
					Address t = sameSpace(tp, tgt);
					ins.addMnemonicReference(t, RefType.COMPUTED_JUMP, SourceType.USER_DEFINED);
					c.append(String.format("%04X->%04X ", val, tgt));
					n++;
				}
				break;
			}
			case "jumptable": {
				Address lowest = null;
				int n = 0;
				c.append("jump table[D]: ");
				while (n < 128) {
					if (lowest != null && end.compareTo(lowest) >= 0) {
						break;
					}
					int tgt = u16(end);
					Address t = sameSpace(end, tgt);
					// stop at the first word that is not a plausible code pointer
					if (!isCode(t) || (n > 0 && listing.getDefinedDataContaining(t) != null)) {
						break;
					}
					codePtr(end);
					ins.addMnemonicReference(t, RefType.COMPUTED_JUMP, SourceType.USER_DEFINED);
					if (t.getAddressSpace().equals(p.getAddressSpace()) && t.compareTo(p) > 0 &&
						(lowest == null || t.compareTo(lowest) < 0)) {
						lowest = t;
					}
					c.append(String.format("%d->%04X ", n, tgt));
					end = end.add(2);
					n++;
				}
				ins.setComment(CodeUnit.EOL_COMMENT, c.toString().trim());
				ins.setFallThrough(null);
				return null;
			}
			case "dispstr": {
				StringBuilder s = new StringBuilder();
				Address st = end;
				int guard = 0;
				while (guard++ < 512) {
					int b = u8(end);
					end = end.add(1);
					if (b >= 8) {
						s.append((char) b);
						continue;
					}
					if (b == 0) {
						break;
					}
					if (b == 2 || b == 5) {
						s.append(String.format("{%d:%02X}", b, u8(end)));
						end = end.add(1);
					}
					else if (b == 3 || b == 4) {
						s.append(String.format("{%d:%04X}", b, u16(end)));
						end = end.add(2);
					}
					else {
						s.append(String.format("{%d}", b));
					}
				}
				listing.clearCodeUnits(st, end.subtract(1), false);
				try {
					listing.createData(st, new ArrayDataType(new CharDataType(), (int) end.subtract(st), 1));
				}
				catch (CodeUnitInsertionException e) {
					// ignore
				}
				c.append('"').append(s).append('"');
				break;
			}
			case "bytepairs0": {
				// (b1, b2)* terminated by b1 == 0
				int n = 0;
				while (u8(end) != 0 && n < 128) {
					typed(end, new ByteDataType());
					typed(end.add(1), new ByteDataType());
					c.append(String.format("%02X:%02X ", u8(end), u8(end.add(1))));
					end = end.add(2);
					n++;
				}
				typed(end, new ByteDataType());
				end = end.add(1);
				break;
			}
			case "interp": {
				// byte n, then 2^n + 1 words (piecewise-linear lookup table)
				int sh = u8(end);
				typed(end, new ByteDataType());
				end = end.add(1);
				int cnt = (1 << Math.min(sh, 10)) + 1;
				listing.clearCodeUnits(end, end.add(2 * cnt - 1), false);
				try {
					listing.createData(end, new ArrayDataType(new WordDataType(), cnt, 2));
				}
				catch (CodeUnitInsertionException e) {
					// ignore
				}
				c.append(String.format("interp table, %d points", cnt));
				end = end.add(2 * cnt);
				break;
			}
			case "softlabels4": {
				// four fields: 00 / 01 single byte, otherwise an 8-char label
				for (int i = 0; i < 4; i++) {
					int b = u8(end);
					if (b == 0 || b == 1) {
						typed(end, new ByteDataType());
						c.append(b == 0 ? "[-] " : "[*] ");
						end = end.add(1);
					}
					else {
						listing.clearCodeUnits(end, end.add(7), false);
						try {
							listing.createData(end, new StringDataType(), 8);
						}
						catch (CodeUnitInsertionException e) {
							// ignore
						}
						byte[] s = new byte[8];
						mem.getBytes(end, s);
						c.append('"').append(printable(s)).append("\" ");
						end = end.add(8);
					}
				}
				break;
			}
			case "counted": {
				int n = u16(end);
				typed(end, new WordDataType());
				end = end.add(2);
				if (n > 0 && n < 0x4000) {
					listing.clearCodeUnits(end, end.add(n - 1), false);
					try {
						listing.createData(end, new ArrayDataType(new ByteDataType(), n, 1));
					}
					catch (CodeUnitInsertionException e) {
						// ignore
					}
					end = end.add(n);
				}
				c.append(String.format("%d bytes", n));
				break;
			}
			default:
				throw new IllegalArgumentException("unknown rule kind " + r.kind);
		}
		String old = ins.getComment(CodeUnit.EOL_COMMENT);
		if (old == null || old.startsWith("inline[")) {
			ins.setComment(CodeUnit.EOL_COMMENT, c.toString().trim());
		}
		return end;
	}

	private static String printable(byte[] s) {
		StringBuilder b = new StringBuilder();
		for (byte x : s) {
			int v = x & 0xff;
			b.append(v >= 0x20 && v < 0x7f ? (char) v : '.');
		}
		return b.toString();
	}
}
