// Install the "__h3000" calling convention and apply it to every function.
//
// The stock 6809 prototype treats CC as preserved across calls, but this firmware returns
// status in the Z flag (e.g. "JSR [$FD30] / LBNE error"), so the decompiler printed tests of
// stale flags. __h3000 kills CC at calls (callers then see extraout_CC), takes A/B/X/Y/U as
// register inputs and returns B or D.
//
// BankPushSelect/BankPop leave/remove one byte of the caller's stack; their stack purge is set
// so stack tracking stays correct across them.
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.program.database.SpecExtension;
import ghidra.program.model.listing.*;

import java.util.List;

public class H3000Proto extends GhidraScript {

	private static final String PROTO =
		"<prototype name=\"__h3000\" extrapop=\"2\" stackshift=\"2\">\n" +
			"  <input>\n" +
			"    <pentry minsize=\"1\" maxsize=\"1\"><register name=\"A\"/></pentry>\n" +
			"    <pentry minsize=\"1\" maxsize=\"1\"><register name=\"B\"/></pentry>\n" +
			"    <pentry minsize=\"2\" maxsize=\"2\"><register name=\"X\"/></pentry>\n" +
			"    <pentry minsize=\"2\" maxsize=\"2\"><register name=\"Y\"/></pentry>\n" +
			"    <pentry minsize=\"2\" maxsize=\"2\"><register name=\"U\"/></pentry>\n" +
			"  </input>\n" +
			"  <output>\n" +
			"    <pentry minsize=\"1\" maxsize=\"1\"><register name=\"B\"/></pentry>\n" +
			"    <pentry minsize=\"2\" maxsize=\"2\"><register name=\"D\"/></pentry>\n" +
			"  </output>\n" +
			"  <unaffected>\n" +
			"    <register name=\"S\"/>\n" +
			"    <register name=\"DP\"/>\n" +
			"  </unaffected>\n" +
			"  <killedbycall>\n" +
			"    <register name=\"CC\"/>\n" +
			"  </killedbycall>\n" +
			"</prototype>\n";

	@Override
	public void run() throws Exception {
		new SpecExtension(currentProgram).addReplaceCompilerSpecExtension(PROTO, monitor);
		int n = 0;
		for (Function f : currentProgram.getListing().getFunctions(true)) {
			f.setCallingConvention("__h3000");
			n++;
		}
		setPurge("BankPushSelect", 1);
		setPurge("BankPop", 3);
		println("__h3000 applied to " + n + " functions");
	}

	private void setPurge(String name, int purge) {
		List<Function> fs = getGlobalFunctions(name);
		if (!fs.isEmpty()) {
			fs.get(0).setStackPurgeSize(purge);
		}
	}
}
