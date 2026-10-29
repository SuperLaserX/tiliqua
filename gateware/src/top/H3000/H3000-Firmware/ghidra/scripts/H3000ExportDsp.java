// Decompile every function of every DSP program in a project folder.
// Args: <project folder, e.g. /dsp_h3500> <output dir>
// Writes <output dir>/<program>.c, one file per DSP program.
//@category H3000

import ghidra.app.decompiler.*;
import ghidra.app.script.GhidraScript;
import ghidra.framework.model.*;
import ghidra.program.model.listing.*;

import java.io.*;
import java.nio.charset.StandardCharsets;

public class H3000ExportDsp extends GhidraScript {

	@Override
	public void run() throws Exception {
		DomainFolder folder = state.getProject().getProjectData().getFolder(getScriptArgs()[0]);
		File out = new File(getScriptArgs()[1]);
		out.mkdirs();
		int programs = 0, funcs = 0, failed = 0;
		for (DomainFile df : folder.getFiles()) {
			monitor.checkCancelled();
			Program p = (Program) df.getReadOnlyDomainObject(this, DomainFile.DEFAULT_VERSION, monitor);
			DecompInterface dec = new DecompInterface();
			try {
				DecompileOptions opts = new DecompileOptions();
				opts.grabFromProgram(p);
				opts.setEOLCommentIncluded(true);
				opts.setPLATECommentIncluded(true);
				dec.setOptions(opts);
				dec.openProgram(p);
				try (PrintWriter w = new PrintWriter(new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(new File(out, df.getName() + ".c")), StandardCharsets.UTF_8)))) {
					w.printf("// %s - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)%n", df.getName());
					w.printf("// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()%n");
					w.printf("// accumulator saturation (SOVM) is not modelled%n%n");
					for (Function f : p.getFunctionManager().getFunctions(true)) {
						funcs++;
						w.printf("// ===== %s @ %s =====%n", f.getName(), f.getEntryPoint());
						DecompileResults r = dec.decompileFunction(f, 60, monitor);
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
			finally {
				dec.dispose();
				p.release(this);
			}
			programs++;
		}
		println(String.format("%d programs, %d functions (%d failed) -> %s", programs, funcs, failed, out));
	}
}
