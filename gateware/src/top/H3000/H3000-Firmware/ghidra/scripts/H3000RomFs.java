// Annotate the ROM "file system" record chains inside every bank overlay.
//
// Each 16 KB bank is a chain of records: key(2) length(2) extra(4) payload(length-8).
// AA55 = bank header, FFFF = end of chain. This script:
//   * applies a RomRecordHeader structure at every record,
//   * labels records (REC_<key>, MODULE_<id>_<name>, PRESET_<n>_<name>, DSPPROG_<id>_DSP<n>),
//   * creates an entry function at the start of each 6809 code payload (key sub 01-05),
//   * types DSP microcode payloads as word arrays.
//@category H3000

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.data.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.*;
import ghidra.program.model.symbol.*;

public class H3000RomFs extends GhidraScript {

	private Memory mem;
	private Listing listing;
	private StructureDataType header;

	private int u8(Address a) throws Exception {
		return mem.getByte(a) & 0xff;
	}

	private int u16(Address a) throws Exception {
		return (u8(a) << 8) | u8(a.add(1));
	}

	private String text(Address a, int max) throws Exception {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < max; i++) {
			int c = u8(a.add(i));
			if (c == 0) {
				break;
			}
			sb.append(c >= 0x20 && c < 0x7f ? (char) c : '_');
		}
		return sb.toString().trim();
	}

	private static String sym(String s) {
		String r = s.replaceAll("[^A-Za-z0-9]+", "_").replaceAll("^_+|_+$", "");
		return r.isEmpty() ? "unnamed" : r;
	}

	private void apply(Address a, DataType dt) {
		try {
			listing.clearCodeUnits(a, a.add(dt.getLength() - 1), false);
			listing.createData(a, dt);
		}
		catch (Exception e) {
			// leave as is
		}
	}

	@Override
	public void run() throws Exception {
		mem = currentProgram.getMemory();
		listing = currentProgram.getListing();
		SymbolTable st = currentProgram.getSymbolTable();
		DataTypeManager dtm = currentProgram.getDataTypeManager();
		header = new StructureDataType(new CategoryPath("/H3000"), "RomRecordHeader", 0);
		header.add(new WordDataType(), "key", "module id (hi) / sub id (lo); AA55 bank header, FFFF end");
		header.add(new WordDataType(), "length", "record length including this header");
		header.add(new ArrayDataType(new ByteDataType(), 4, 1), "extra", "F9/FA markers, preset flags");
		DataType hdr = dtm.addDataType(header, DataTypeConflictHandler.REPLACE_HANDLER);

		int records = 0, entries = 0;
		for (MemoryBlock b : mem.getBlocks()) {
			if (!b.isOverlay() || !b.isInitialized()) {
				continue;
			}
			Address p = b.getStart();
			if (u16(p) != 0xAA55) {
				continue;
			}
			while (p.compareTo(b.getEnd().subtract(7)) <= 0) {
				int key = u16(p);
				int len = u16(p.add(2));
				int hi = key >> 8, lo = key & 0xff;
				Address pay = p.add(8);
				String label;
				String plate;
				if (key == 0xAA55) {
					label = "BANK_HEADER";
					plate = "Bank header record";
				}
				else if (key == 0xFFFF) {
					label = "END_OF_CHAIN";
					plate = "End of record chain";
				}
				else if (hi >= 0xC8 && hi <= 0xCF) {
					String nm = text(pay.add(2), 16);
					label = String.format("PRESET_%03X_%s", key - 0xC800, sym(nm));
					plate = String.format("Preset %03X \"%s\" (algorithm %02X%02X), %d bytes", key - 0xC800, nm,
						u8(pay), u8(pay.add(1)), len - 8);
				}
				else if (lo == 0x00) {
					String nm = text(pay.add(2), 16);
					label = String.format("MODULE_%02X_TABLE_%s", hi, sym(nm));
					plate = String.format("Module %02X parameter/preset table \"%s\", %d bytes", hi, nm, len - 8);
				}
				else if (lo >= 0x10 && lo <= 0x1f && len > 10 && u16(pay) == 0x0800) {
					label = String.format("DSPPROG_%02X_DSP%d", hi, lo - 0x10 + 1);
					plate = String.format("TMS32010 program %02X for DSP %d: %d words loaded at $800 " +
						"(written via bank latch $%02X)", hi, lo - 0x10 + 1, (len - 10) / 2, 0x80 + lo - 0x10 + 1);
				}
				else if (lo >= 0x01 && lo <= 0x05) {
					label = String.format("MODULE_%02X_%02X_CODE", hi, lo);
					plate = String.format("Module %02X code record %02X, %d bytes, entered at payload start", hi, lo,
						len - 8);
				}
				else {
					label = String.format("REC_%04X", key);
					plate = String.format("Record %04X, %d bytes", key, len - 8);
				}
				apply(p, hdr);
				st.createLabel(p, label + "_hdr", SourceType.USER_DEFINED);
				listing.setComment(p, CodeUnit.PLATE_COMMENT, plate);
				records++;
				if (key == 0xFFFF || len < 8) {
					break;
				}
				if (key != 0xAA55) {
					if (label.startsWith("DSPPROG")) {
						int words = (len - 8) / 2;
						apply(pay, new ArrayDataType(new WordDataType(), words, 2));
						st.createLabel(pay, label, SourceType.USER_DEFINED);
					}
					else if (label.endsWith("_CODE") && b.isExecute()) {
						if (listing.getInstructionAt(pay) == null && listing.getDefinedDataContaining(pay) != null) {
							listing.clearCodeUnits(pay, pay, false);
						}
						if (listing.getInstructionAt(pay) == null) {
							disassemble(pay);
						}
						Function f = getFunctionAt(pay);
						if (f == null) {
							f = createFunction(pay, label.replace("_CODE", "_entry"));
						}
						else if (f.getName().startsWith("FUN_")) {
							f.setName(label.replace("_CODE", "_entry"), SourceType.USER_DEFINED);
						}
						if (f != null) {
							entries++;
						}
					}
					else {
						st.createLabel(pay, label, SourceType.USER_DEFINED);
					}
				}
				p = p.add(len);
			}
		}
		println("records annotated: " + records + ", code entry points: " + entries);
	}
}
