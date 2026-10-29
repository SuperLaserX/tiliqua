// Build the Eventide H3000/H3500 6809 memory map on a freshly imported kernel image.
//
// Expects the program to be a raw import of modules/<set>/kernel.bin (32 KB at $0000).
// Args: <set-dir> <bank files...>   (bank_<tag>.bin files inside set-dir)
//
// Result:
//   $0000-$3FFF  BANKWIN (uninitialized) + one overlay block per ROM bank (M<id>_<tag>)
//   $4000-$5FFF  UNK_4000 (unidentified, volatile)
//   $6000-$7FFF  RAM
//   $8000-$83FF  IO (volatile)
//   $8400-$FFFF  KERNEL ROM, vectors at $FFF0, API tables at $FC00/$FE00
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.data.*;
import ghidra.program.model.lang.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.*;
import ghidra.program.model.symbol.*;

import java.io.*;
import java.math.BigInteger;
import java.nio.file.Files;

public class H3000Setup extends GhidraScript {

	@Override
	public void run() throws Exception {
		String[] a = getScriptArgs();
		File dir = new File(a[0]);
		Memory mem = currentProgram.getMemory();
		AddressSpace ram = currentProgram.getAddressFactory().getDefaultAddressSpace();
		SymbolTable st = currentProgram.getSymbolTable();

		MemoryBlock k = mem.getBlock(ram.getAddress(0));
		if (k != null && k.getStart().getOffset() == 0 && !k.isOverlay() && k.isInitialized()) {
			k.setName("KERNEL");
			mem.moveBlock(k, ram.getAddress(0x8000), monitor);
			k = mem.getBlock(ram.getAddress(0x8000));
			mem.split(k, ram.getAddress(0x8400));
			mem.removeBlock(mem.getBlock(ram.getAddress(0x8000)), monitor);
			MemoryBlock io = mem.createUninitializedBlock("IO", ram.getAddress(0x8000), 0x400, false);
			io.setVolatile(true);
			io.setRead(true);
			io.setWrite(true);
			io.setExecute(false);
			io.setComment("Memory-mapped I/O (hides kernel ROM $8000-$83FF)");
			MemoryBlock kr = mem.getBlock(ram.getAddress(0x8400));
			kr.setName("KERNEL");
			kr.setRead(true);
			kr.setWrite(false);
			kr.setExecute(true);
			kr.setComment("Kernel ROM " + a[0]);
			MemoryBlock r = mem.createUninitializedBlock("RAM", ram.getAddress(0x6000), 0x2000, false);
			r.setRead(true);
			r.setWrite(true);
			r.setExecute(true);
			r.setComment("System RAM (SWI/SWI2/SWI3 trampolines at $6700/$6780/$67C0)");
			MemoryBlock u = mem.createUninitializedBlock("UNK_4000", ram.getAddress(0x4000), 0x2000, false);
			u.setRead(true);
			u.setWrite(true);
			u.setExecute(false);
			u.setVolatile(true);
			u.setComment("Unidentified region $4000-$5FFF");
			MemoryBlock w = mem.createUninitializedBlock("BANKWIN", ram.getAddress(0), 0x4000, false);
			w.setRead(true);
			w.setWrite(false);
			w.setExecute(true);
			w.setComment("Banked ROM window; contents depend on bank latch ($8052). See M* overlay blocks.");
			println("kernel/IO/RAM/BANKWIN blocks created");
		}

		for (int i = 1; i < a.length; i++) {
			File f = new File(dir, a[i]);
			byte[] data = Files.readAllBytes(f.toPath());
			String tag = a[i].replace("bank_", "").replace(".bin", "");
			String id = (data[0] == (byte) 0xAA && data[1] == 0x55) ? String.format("%02X", data[8] & 0xff) : "XX";
			String name = "M" + id + "_" + tag;
			if (mem.getBlock(name) != null) {
				continue;
			}
			MemoryBlock b = mem.createInitializedBlock(name, ram.getAddress(0), new ByteArrayInputStream(data),
				data.length, monitor, true);
			int modId = data[8] & 0xff;
			int sub = data[9] & 0xff;
			// 6809 code lives in code modules (sub 01/02), algorithm modules (sub 00, id < C8)
			// and the F8 kernel extension; preset banks, DSP microcode and tables are data
			boolean code = !id.equals("XX") && ((modId < 0xC8 && sub <= 0x02) || modId == 0xF8);
			b.setRead(true);
			b.setWrite(false);
			b.setExecute(code);
			b.setComment("Bank " + tag + " (module id " + id + ", sub " + String.format("%02X", sub) + ")" +
				(code ? "" : " - data only"));
		}

		// vectors
		String[] vnames = { "VEC_RESERVED", "VEC_SWI3", "VEC_SWI2", "VEC_FIRQ", "VEC_IRQ", "VEC_SWI", "VEC_NMI",
			"VEC_RESET" };
		String[] hnames = { null, "SWI3_trampoline", "SWI2_trampoline", "FIRQ_Handler", "IRQ_Handler",
			"SWI_trampoline", "NMI_Handler", "Reset" };
		for (int i = 0; i < 8; i++) {
			Address va = ram.getAddress(0xFFF0 + 2 * i);
			clearListing(va, va.add(1));
			createData(va, new Pointer16DataType());
			st.createLabel(va, vnames[i], SourceType.USER_DEFINED);
			int t = ((mem.getByte(va) & 0xff) << 8) | (mem.getByte(va.add(1)) & 0xff);
			if (hnames[i] == null || t == 0) {
				continue;
			}
			Address ta = ram.getAddress(t);
			st.createLabel(ta, hnames[i], SourceType.USER_DEFINED);
			if (mem.getBlock(ta) != null && mem.getBlock(ta).isInitialized()) {
				disassemble(ta);
				if (getFunctionAt(ta) == null) {
					createFunction(ta, hnames[i]);
				}
			}
		}

		// API tables
		Address fc = ram.getAddress(0xFC00);
		clearListing(fc, fc.add(0x1FF));
		createData(fc, new ArrayDataType(new Pointer16DataType(), 256, 2));
		st.createLabel(fc, "KernelApiTable", SourceType.USER_DEFINED);
		int fe = 0;
		while (fe < 64) {
			Address e = ram.getAddress(0xFE00 + 2 * fe);
			int v = ((mem.getByte(e) & 0xff) << 8) | (mem.getByte(e.add(1)) & 0xff);
			if (v == 0xFFFF || v < 0x8400) {
				break;
			}
			fe++;
		}
		Address fea = ram.getAddress(0xFE00);
		clearListing(fea, fea.add(2 * fe - 1));
		createData(fea, new ArrayDataType(new Pointer16DataType(), fe, 2));
		st.createLabel(fea, "KernelApiTable2", SourceType.USER_DEFINED);
		for (int base : new int[] { 0xFC00, 0xFE00 }) {
			int n = base == 0xFC00 ? 256 : fe;
			for (int i = 0; i < n; i++) {
				Address e = ram.getAddress(base + 2 * i);
				int v = ((mem.getByte(e) & 0xff) << 8) | (mem.getByte(e.add(1)) & 0xff);
				Address ta = ram.getAddress(v);
				String nm = String.format("API_%04X", base + 2 * i);
				st.createLabel(ta, nm, SourceType.USER_DEFINED);
			}
		}
		println("API tables: $FC00 x256, $FE00 x" + fe);

		// DP register = 0 everywhere (reset value; kernel never reloads it)
		Register dp = currentProgram.getRegister("DP");
		ProgramContext pc = currentProgram.getProgramContext();
		for (MemoryBlock b : mem.getBlocks()) {
			if (b.isInitialized()) {
				pc.setValue(dp, b.getStart(), b.getEnd(), BigInteger.ZERO);
			}
		}
		st.createLabel(ram.getAddress(0x8052), "BANK_LATCH", SourceType.USER_DEFINED);
		st.createLabel(ram.getAddress(0x600B), "g_curBank", SourceType.USER_DEFINED);
		st.createLabel(ram.getAddress(0x600D), "g_moduleBase", SourceType.USER_DEFINED);

		// inline-arg helpers return past their data; keep this analyzer from undoing that
		currentProgram.getOptions("Analyzers").setBoolean("Non-Returning Functions - Discovered", false);
		println("setup done");
	}
}
