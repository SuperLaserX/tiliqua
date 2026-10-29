// Apply descriptive names to kernel API functions by table slot (see ghidra/api_names.txt).
// Args: <names-file> <kernel tag: v153 | h3500>
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;

import java.nio.file.*;

public class H3000Names extends GhidraScript {

	@Override
	public void run() throws Exception {
		String[] args = getScriptArgs();
		String tag = args[1];
		int n = 0;
		for (String line : Files.readAllLines(Paths.get(args[0]))) {
			String comment = line.contains("#") ? line.substring(line.indexOf('#') + 1).trim() : "";
			line = line.replaceAll("#.*", "").trim();
			if (line.isEmpty()) {
				continue;
			}
			String[] p = line.split("\\s+");
			String which = p.length > 2 ? p[2] : "both";
			if (!which.equals("both") && !which.equals(tag)) {
				continue;
			}
			Address slot = toAddr(Integer.parseInt(p[0], 16));
			Address target = toAddr(((getByte(slot) & 0xff) << 8) | (getByte(slot.add(1)) & 0xff));
			Function f = getFunctionAt(target);
			if (f == null) {
				f = createFunction(target, null);
			}
			if (f == null) {
				println("no function for " + p[0]);
				continue;
			}
			f.setName(p[1], SourceType.USER_DEFINED);
			String plate = "Kernel API slot $" + p[0] + (comment.isEmpty() ? "" : ": " + comment);
			f.setComment(plate);
			n++;
		}
		println("named " + n + " API functions");
	}
}
