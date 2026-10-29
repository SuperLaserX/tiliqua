// Export decompiled C and an assembly listing for every memory block of the current program.
//
// Args: <output-dir>
// Writes <output-dir>/<block>.c (all functions of the block, address order) and
// <output-dir>/<block>.asm (code units with labels, comments and inline-data annotations;
// runs of undefined bytes are condensed into 16-byte .db rows).
//@category H3000

import ghidra.app.decompiler.*;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.*;
import ghidra.program.model.symbol.*;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class H3000Export extends GhidraScript {

	@Override
	public void run() throws Exception {
		File out = new File(getScriptArgs()[0]);
		out.mkdirs();
		DecompInterface dec = new DecompInterface();
		DecompileOptions opts = new DecompileOptions();
		opts.grabFromProgram(currentProgram);
		opts.setEOLCommentIncluded(true);   // inline-argument annotations live in EOL comments
		opts.setPRECommentIncluded(true);
		opts.setPLATECommentIncluded(true);
		dec.setOptions(opts);
		dec.toggleCCode(true);
		dec.toggleSyntaxTree(false);
		dec.setSimplificationStyle("decompile");
		if (!dec.openProgram(currentProgram)) {
			throw new IllegalStateException("decompiler failed to open program: " + dec.getLastMessage());
		}
		Listing listing = currentProgram.getListing();
		int total = 0, failed = 0;
		for (MemoryBlock b : currentProgram.getMemory().getBlocks()) {
			if (!b.isInitialized()) {
				continue;
			}
			AddressSet set = new AddressSet(b.getStart(), b.getEnd());
			String base = b.getName();
			// ---- C
			List<Function> funcs = new ArrayList<>();
			for (Function f : currentProgram.getFunctionManager().getFunctions(set, true)) {
				funcs.add(f);
			}
			if (!funcs.isEmpty()) {
				try (PrintWriter w = writer(new File(out, base + ".c"))) {
					w.printf("// %s - %s%n// block %s %s-%s, %d functions%n// %s%n%n", currentProgram.getName(),
						"decompiled by Ghidra (6809, __h3000 convention)", base, b.getStart(), b.getEnd(),
						funcs.size(), b.getComment() == null ? "" : b.getComment());
					for (Function f : funcs) {
						monitor.checkCancelled();
						total++;
						w.printf("// ===== %s @ %s =====%n", f.getName(), f.getEntryPoint());
						DecompileResults r = dec.decompileFunction(f, 30, monitor);
						if (r != null && r.decompileCompleted() && r.getDecompiledFunction() != null) {
							w.println(r.getDecompiledFunction().getC());
						}
						else {
							failed++;
							w.printf("// decompilation failed: %s%n%n", r == null ? "null" : r.getErrorMessage());
						}
					}
				}
			}
			// ---- ASM
			try (PrintWriter w = writer(new File(out, base + ".asm"))) {
				w.printf("; %s  block %s  %s-%s%n; %s%n%n", currentProgram.getName(), base, b.getStart(), b.getEnd(),
					b.getComment() == null ? "" : b.getComment());
				CodeUnitIterator it = listing.getCodeUnits(set, true);
				List<Byte> pending = new ArrayList<>();
				Address pendingStart = null;
				while (it.hasNext()) {
					monitor.checkCancelled();
					CodeUnit cu = it.next();
					boolean undefined = cu instanceof Data && !((Data) cu).isDefined();
					Symbol[] syms = currentProgram.getSymbolTable().getSymbols(cu.getMinAddress());
					String plate = cu.getComment(CodeUnit.PLATE_COMMENT);
					if (undefined && syms.length == 0 && plate == null) {
						if (pendingStart == null) {
							pendingStart = cu.getMinAddress();
						}
						pending.add(cu.getBytes()[0]);
						if (pending.size() == 16) {
							flush(w, pendingStart, pending);
							pendingStart = null;
						}
						continue;
					}
					if (pendingStart != null) {
						flush(w, pendingStart, pending);
						pendingStart = null;
					}
					if (plate != null) {
						w.println();
						for (String line : plate.split("\n")) {
							w.println(";; " + line);
						}
					}
					Function f = currentProgram.getFunctionManager().getFunctionAt(cu.getMinAddress());
					if (f != null) {
						w.printf("%n; ---- function %s%n", f.getName());
					}
					for (Symbol s : syms) {
						w.printf("%s:%n", s.getName());
					}
					String eol = cu.getComment(CodeUnit.EOL_COMMENT);
					StringBuilder hex = new StringBuilder();
					byte[] bytes = cu.getBytes();
					for (int i = 0; i < Math.min(bytes.length, 6); i++) {
						hex.append(String.format("%02X", bytes[i] & 0xff));
					}
					if (bytes.length > 6) {
						hex.append("..");
					}
					w.printf("  %s  %-14s %-34s%s%n", cu.getMinAddress().toString(false), hex, cu.toString(),
						eol == null ? "" : " ; " + eol.replace("\n", " "));
				}
				if (pendingStart != null) {
					flush(w, pendingStart, pending);
				}
			}
			println(String.format("%-18s functions=%d", base, funcs.size()));
		}
		dec.dispose();
		println(String.format("exported %d functions (%d failed) to %s", total, failed, out));
	}

	private static PrintWriter writer(File f) throws IOException {
		return new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(f),
			StandardCharsets.UTF_8)));
	}

	private static void flush(PrintWriter w, Address start, List<Byte> bytes) {
		StringBuilder hex = new StringBuilder();
		StringBuilder txt = new StringBuilder();
		for (byte x : bytes) {
			int v = x & 0xff;
			hex.append(String.format("%02X ", v));
			txt.append(v >= 0x20 && v < 0x7f ? (char) v : '.');
		}
		w.printf("  %s  .db %-48s ; %s%n", start.toString(false), hex.toString().trim(), txt);
		bytes.clear();
	}
}
