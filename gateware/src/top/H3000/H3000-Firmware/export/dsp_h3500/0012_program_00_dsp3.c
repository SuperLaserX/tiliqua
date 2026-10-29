// 0012_program_00_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0012_program_00_dsp3 (ucode_0012_ROM2_02FFC.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

int dsp_main(void)

{
  ushort uVar1;
  ushort uVar2;
  
  uData0000 = sData0021 + sData002e * -3;
  sData0016 = 0;
  uData0003 = uData0034 + 1;
  uData0042 = *(ushort *)(uData0034 & 0xfff);
  while( true ) {
    uData0040 = *(ushort *)(uData0003 & 0xfff);
    uData0003 = uData0003 + 1;
    if ((int)((uint)uData0040 * 0x10000 + (uint)uData0042 * -0x10000) < 0) break;
    uData0000 = uData0000 - sData002e;
    sData0016 = sData0016 + 1;
    uData0042 = uData0040;
  }
  uData0043 = (ushort)((uint)((int)(short)uData0042 * (int)sData0026 * 2) >> 0x10);
  uData0000 = uData0000 - sData0022;
  uData0003 = uData0003 + sData0022;
  uVar2 = uData0000;
  while( true ) {
    uData0041 = uData0040;
    uData0040 = *(ushort *)(uData0003 & 0xfff);
    if (((-1 < (int)((uint)uData0041 * 0x10000 + (uint)uData0042 * -0x10000)) &&
        (0 < (int)((uint)uData0041 * 0x10000 + (uint)uData0040 * -0x10000))) &&
       (-1 < (int)((uint)uData0041 * 0x10000 + (uint)uData0043 * -0x10000))) break;
    uData0042 = uData0041;
    uData0003 = uData0003 + 1;
    uVar1 = uVar2 & 0x1ff;
    uVar2 = uVar2 - 1;
    if (uVar1 == 0) {
      uData0041 = uData0040;
      return (uint)uData0032 << 0x10;
    }
  }
  *(ushort *)(uData0003 - sData002e & 0xfff) = uData0032;
  sData001c = ((uData0003 - sData002e) - uData0034) - sData0016;
  return 0;
}


