// Dump the instructions of every program in a project folder to text files
// ("<word address>\t<instruction>"), for cross-checking the TMS32010 SLEIGH module against
// tools/tms32010_dis.py (see tools/check_dsp_sleigh.py).
// Args: <project folder, e.g. /dsp_h3500> <output dir>
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.framework.model.*;
import ghidra.program.model.listing.*;

import java.io.*;

public class H3000DspDump extends GhidraScript {

	@Override
	public void run() throws Exception {
		DomainFolder folder = state.getProject().getProjectData().getFolder(getScriptArgs()[0]);
		File out = new File(getScriptArgs()[1]);
		out.mkdirs();
		int n = 0;
		for (DomainFile df : folder.getFiles()) {
			Program p = (Program) df.getReadOnlyDomainObject(this, DomainFile.DEFAULT_VERSION, monitor);
			try (PrintWriter w = new PrintWriter(new FileWriter(new File(out, df.getName() + ".txt")))) {
				int count = 0;
				for (Instruction ins : p.getListing().getInstructions(true)) {
					w.println(ins.getAddress().toString(false) + "\t" + ins);
					count++;
				}
				println(df.getName() + ": " + count + " instructions, " +
					p.getFunctionManager().getFunctionCount() + " functions");
			}
			finally {
				p.release(this);
			}
			n++;
		}
		println("dumped " + n + " programs");
	}
}
