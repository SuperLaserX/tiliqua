// Report code/data coverage per memory block, and optionally list undefined gaps.
// Args: [gaps <blockname>]
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.*;

public class H3000Coverage extends GhidraScript {

	@Override
	public void run() throws Exception {
		Listing l = currentProgram.getListing();
		String[] args = getScriptArgs();
		for (MemoryBlock b : currentProgram.getMemory().getBlocks()) {
			if (!b.isInitialized()) {
				continue;
			}
			AddressSet s = new AddressSet(b.getStart(), b.getEnd());
			long ins = 0, insBytes = 0, dataBytes = 0;
			for (Instruction i : l.getInstructions(s, true)) {
				ins++;
				insBytes += i.getLength();
			}
			for (Data d : l.getDefinedData(s, true)) {
				dataBytes += d.getLength();
			}
			byte[] buf = new byte[(int) b.getSize()];
			b.getBytes(b.getStart(), buf);
			long ff = 0;
			for (byte x : buf) {
				if (x == (byte) 0xff) {
					ff++;
				}
			}
			int funcs = 0;
			for (Function f : currentProgram.getFunctionManager().getFunctions(s, true)) {
				funcs++;
			}
			println(String.format("%-18s size=%5x funcs=%4d instr=%5d code=%5x data=%5x undefined=%5x (FF %x)",
				b.getName(), b.getSize(), funcs, ins, insBytes, dataBytes, b.getSize() - insBytes - dataBytes, ff));
		}
		if (args.length >= 2 && args[0].equals("gaps")) {
			MemoryBlock b = currentProgram.getMemory().getBlock(args[1]);
			AddressSet all = new AddressSet(b.getStart(), b.getEnd());
			AddressSet used = new AddressSet();
			for (CodeUnit cu : l.getCodeUnits(all, true)) {
				if (cu instanceof Instruction || (cu instanceof Data && ((Data) cu).isDefined())) {
					used.add(cu.getMinAddress(), cu.getMaxAddress());
				}
			}
			for (AddressRange r : all.subtract(used)) {
				long n = r.getLength();
				byte[] buf = new byte[(int) Math.min(n, 24)];
				currentProgram.getMemory().getBytes(r.getMinAddress(), buf);
				int ff = 0;
				for (byte x : buf) {
					if (x == (byte) 0xff) {
						ff++;
					}
				}
				if (n < 8 || ff == buf.length) {
					continue;
				}
				StringBuilder hex = new StringBuilder();
				StringBuilder txt = new StringBuilder();
				for (byte x : buf) {
					int v = x & 0xff;
					hex.append(String.format("%02x", v));
					txt.append(v >= 0x20 && v < 0x7f ? (char) v : '.');
				}
				CodeUnit prev = l.getCodeUnitBefore(r.getMinAddress());
				println(String.format("%s len=%4x after[%s] %s |%s|", r.getMinAddress(), n,
					prev == null ? "-" : prev.toString(), hex, txt));
			}
		}
	}
}
