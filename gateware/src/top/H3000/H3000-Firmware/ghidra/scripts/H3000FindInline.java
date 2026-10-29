// List functions that read their own return address (candidate inline-argument helpers).
// Prints the API slot(s) ($FC00/$FE00 tables) that point at each candidate.
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import java.util.*;

public class H3000FindInline extends GhidraScript {

	private int pushSize(String ops) {
		int n = 0;
		for (String r : ops.split("[ ,]+")) {
			r = r.trim().toUpperCase();
			if (r.isEmpty()) {
				continue;
			}
			n += (r.equals("X") || r.equals("Y") || r.equals("U") || r.equals("S") || r.equals("PC")) ? 2 : 1;
		}
		return n;
	}

	@Override
	public void run() throws Exception {
		Listing l = currentProgram.getListing();
		Map<Address, List<String>> slots = new HashMap<>();
		for (int base : new int[] { 0xFC00, 0xFE00 }) {
			int n = base == 0xFC00 ? 256 : 64;
			for (int i = 0; i < n; i++) {
				Address e = toAddr(base + 2 * i);
				int v = ((getByte(e) & 0xff) << 8) | (getByte(e.add(1)) & 0xff);
				if (v == 0xFFFF) {
					continue;
				}
				slots.computeIfAbsent(toAddr(v), k -> new ArrayList<>()).add(String.format("%04X", base + 2 * i));
			}
		}
		// optional arg: rules file; helpers already covered by it are skipped
		Set<Address> known = new HashSet<>();
		if (getScriptArgs().length > 0) {
			for (String line : java.nio.file.Files.readAllLines(java.nio.file.Paths.get(getScriptArgs()[0]))) {
				line = line.replaceAll("#.*", "").trim();
				if (line.isEmpty()) {
					continue;
				}
				String w = line.split("\s+")[0];
				int v = Integer.parseInt(w.substring(5), 16);
				if (w.startsWith("slot:")) {
					Address e = toAddr(v);
					v = ((getByte(e) & 0xff) << 8) | (getByte(e.add(1)) & 0xff);
				}
				known.add(toAddr(v));
			}
		}
		for (Function f : l.getFunctions(true)) {
			if (known.contains(f.getEntryPoint())) {
				continue;
			}
			Instruction ins = l.getInstructionAt(f.getEntryPoint());
			int push = 0;
			int k = 0;
			boolean hit = false;
			StringBuilder sb = new StringBuilder();
			while (ins != null && k < 24) {
				String m = ins.getMnemonicString().toUpperCase();
				String ops = ins.toString().substring(ins.getMnemonicString().length()).trim();
				String o = ops.replace(" ", "").toUpperCase();
				sb.append("    ").append(ins.getAddress()).append(": ").append(ins).append("\n");
				if (k == 0 && m.equals("PSHS")) {
					push = pushSize(ops);
				}
				else if (k <= 3 && m.equals("PSHS")) {
					push += pushSize(ops);
				}
				else if (k <= 3 && m.equals("LEAS") && o.startsWith("-0X") && o.endsWith(",S")) {
					push += Integer.parseInt(o.substring(3, o.length() - 2), 16);
				}
				String want1 = "0X" + Integer.toHexString(push).toUpperCase() + ",S";
				if ((m.startsWith("LD") || m.startsWith("ST")) && push > 0 && o.endsWith(want1) &&
					!o.startsWith("[")) {
					hit = true;
				}
				if (k == 0 && m.equals("PULS") && (o.contains("X") || o.contains("Y") || o.contains("U"))) {
					hit = true;
				}
				if (k == 0 && m.startsWith("LD") && o.equals(",S")) {
					hit = true;
				}
				if (ins.getFlowType().isTerminal()) {
					break;
				}
				ins = ins.getNext();
				k++;
			}
			if (hit) {
				List<String> s = slots.get(f.getEntryPoint());
				println(f.getName() + " @" + f.getEntryPoint() + " slots=" + (s == null ? "-" : s) + " push=" +
					push + "\n" + sb);
			}
		}
	}
}
