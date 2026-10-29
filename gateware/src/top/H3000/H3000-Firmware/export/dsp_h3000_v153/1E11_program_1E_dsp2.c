// 1E11_program_1E_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 1E11_program_1E_dsp2 (ucode_1E11_BigROM_0A537.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  short sVar4;
  int iVar5;
  
  sData0000 = 1;
  DAT_data_0003 = 0x200;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  sVar4 = 0;
  DAT_data_0004 = 0;
  DAT_data_001d = 0;
  DAT_data_001e = 0;
  DAT_data_0005 = 0;
  DAT_data_0006 = 0;
  DAT_data_0007 = 0;
  DAT_data_0008 = 0;
  DAT_data_0009 = 0;
  DAT_data_000a = 0;
  DAT_data_000b = 0;
  DAT_data_000c = 0;
  DAT_data_000d = 0;
  DAT_data_000e = 0;
  DAT_data_000f = 0;
  DAT_data_0010 = 0;
  do {
    DAT_data_0002 = sVar4 + sData0000;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    sVar4 = DAT_data_0002 + sData0000;
  } while (sVar4 != 0);
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    iVar5 = (int)(short)DAT_data_0004 * (int)DAT_data_0041;
    PA4 = DAT_data_0005;
    PA4 = DAT_data_0006;
    PA4 = DAT_data_0007;
    PA4 = DAT_data_0008;
    PA4 = DAT_data_0009;
    PA4 = DAT_data_000a;
    DAT_data_0005 =
         (word)((uint)(iVar5 + (int)DAT_data_000b * -0x4000 + (int)DAT_data_000c * 0x4000 +
                       (int)(short)DAT_data_000d * 0x8000 + (int)(short)DAT_data_000e * 0x8000 +
                       (int)(short)DAT_data_000f * 0x8000 + (int)(short)DAT_data_0010 * 0x8000) >>
               0x10);
    DAT_data_0006 =
         (word)((uint)(iVar5 + (int)DAT_data_000b * -0x8000 + (int)DAT_data_000c * 0x8000 +
                       (int)(short)DAT_data_000d * 0x4000 + (int)(short)DAT_data_000e * 0x4000 +
                       (int)(short)DAT_data_000f * -0x8000 + (int)(short)DAT_data_0010 * -0x8000) >>
               0x10);
    DAT_data_0007 =
         (word)((uint)(iVar5 + (int)DAT_data_000b * 0x4000 + (int)DAT_data_000c * 0x4000 +
                       (int)(short)DAT_data_000d * 0x8000 + (int)(short)DAT_data_000e * -0x8000 +
                       (int)(short)DAT_data_000f * 0x8000 + (int)(short)DAT_data_0010 * -0x8000) >>
               0x10);
    DAT_data_0008 =
         (word)((uint)(iVar5 + (int)DAT_data_000b * 0x8000 + (int)DAT_data_000c * 0x8000 +
                       (int)(short)DAT_data_000d * 0x4000 + (int)(short)DAT_data_000e * -0x4000 +
                       (int)(short)DAT_data_000f * -0x8000 + (int)(short)DAT_data_0010 * 0x8000) >>
               0x10);
    DAT_data_0009 =
         (word)((uint)(iVar5 + (int)DAT_data_000b * 0x8000 + (int)DAT_data_000c * 0x8000 +
                       (int)(short)DAT_data_000d * -0x8000 + (int)(short)DAT_data_000e * 0x8000 +
                       (int)(short)DAT_data_000f * 0x4000 + (int)(short)DAT_data_0010 * -0x4000) >>
               0x10);
    DAT_data_000a =
         (word)((uint)(iVar5 + (int)DAT_data_000b * 0x8000 + (int)DAT_data_000c * -0x8000 +
                       (int)(short)DAT_data_000d * 0x8000 + (int)(short)DAT_data_000e * 0x8000 +
                       (int)(short)DAT_data_000f * -0x4000 + (int)(short)DAT_data_0010 * -0x4000) >>
               0x10);
    DAT_data_0004 = PA7;
    DAT_data_000b =
         (short)((uint)((int)(short)DAT_data_0040 * (int)(short)DAT_data_001d * 2) >> 0x10);
    iVar5 = (int)(short)DAT_data_001e;
    DAT_data_001d = PA3;
    DAT_data_001e = PA3;
    DAT_data_000d = PA3;
    DAT_data_000e = PA3;
    DAT_data_000f = PA3;
    DAT_data_0010 = PA3;
    PA3 = DAT_data_0040;
    PA6 = DAT_data_001d;
    PA5 = DAT_data_001e;
    DAT_data_000c = (short)((uint)((short)DAT_data_0040 * iVar5 * 2) >> 0x10);
  } while( true );
}


