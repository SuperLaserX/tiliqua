// Import every extracted TMS32010 microcode image as its own Ghidra program.
//
// Requires the TMS320C1x processor extension (ghidra/TMS320C1x) to be installed and Ghidra
// restarted. Images come from tools/romfs.py --extract: ucode_<key>_<rom>_<offset>.bin, whose
// first word is the load address ($0800) followed by the program words.
//
// Args: <images-dir> <project folder name, e.g. dsp_h3500>
//@category H3000

import ghidra.app.cmd.disassemble.DisassembleCommand;
import ghidra.app.cmd.function.CreateFunctionCmd;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.data.WordDataType;
import ghidra.program.model.lang.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.SourceType;

import java.io.File;
import java.nio.file.Files;
import java.util.*;

public class H3000ImportDsp extends GhidraScript {

	@Override
	public void run() throws Exception {
		File dir = new File(getScriptArgs()[0]);
		String folder = getScriptArgs()[1];
		Language lang = getLanguage(new LanguageID("TMS32010:BE:16:default"));
		CompilerSpec cspec = lang.getDefaultCompilerSpec();
		File[] files = dir.listFiles((d, n) -> n.startsWith("ucode_") && n.endsWith(".bin"));
		Arrays.sort(files);
		// optional names.txt (written by tools/dsp_listings.py): "<image file> <program name>"
		Map<String, String> names = new HashMap<>();
		File nameFile = new File(dir, "names.txt");
		if (nameFile.exists()) {
			for (String line : Files.readAllLines(nameFile.toPath())) {
				String[] parts = line.trim().split("\\s+");
				if (parts.length == 2) {
					names.put(parts[0], parts[1]);
				}
			}
		}
		int done = 0;
		for (File f : files) {
			monitor.checkCancelled();
			byte[] all = Files.readAllBytes(f.toPath());
			int org = (((all[0] & 0xff) << 8) | (all[1] & 0xff)) & 0xFFF;
			File body = File.createTempFile("h3000dsp", ".bin");
			body.deleteOnExit();
			Files.write(body.toPath(), Arrays.copyOfRange(all, 2, all.length));
			Program p = importFileAsBinary(body, lang, cspec);
			String name = names.getOrDefault(f.getName(), f.getName().replace(".bin", ""));
			int tx = p.startTransaction("H3000 DSP setup");
			try {
				p.setName(name);
				AddressSpace prog = p.getAddressFactory().getDefaultAddressSpace();
				// address offsets are byte offsets; the program space is word addressed
				Address start = prog.getAddress((long) org * prog.getAddressableUnitSize());
				p.setImageBase(start, true);
				// type the I/O ports so the decompiler uses the PA0-PA7 labels
				AddressSpace io = p.getAddressFactory().getAddressSpace("io");
				for (int port = 0; port < 8; port++) {
					p.getListing().createData(io.getAddress((long) port * io.getAddressableUnitSize()),
						new WordDataType());
				}
				new DisassembleCommand(start, null, true).applyTo(p, monitor);
				new CreateFunctionCmd(start).applyTo(p, monitor);
				Function fn = p.getFunctionManager().getFunctionAt(start);
				if (fn != null) {
					fn.setName("dsp_main", SourceType.USER_DEFINED);
				}
				p.getListing().setComment(start, CodeUnit.PLATE_COMMENT,
					"Eventide H3000/H3500 DSP program " + name + " (" + f.getName() + ")\nLoaded at $" +
						Integer.toHexString(org) + " by DspLoadProgram (6809 API $FD30)");
			}
			finally {
				p.endTransaction(tx, true);
			}
			int atx = p.startTransaction("H3000 DSP analysis");
			try {
				analyzeAll(p);
			}
			finally {
				p.endTransaction(atx, true);
			}
			saveProgram(p, List.of(folder));
			p.release(this);
			done++;
		}
		println("imported " + done + " DSP programs into /" + folder);
	}
}
