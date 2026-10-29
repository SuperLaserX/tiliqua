// 0111_program_01_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0111_program_01_dsp2 (ucode_0111_BigROM_0B043.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  char cVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  short sVar9;
  
  sData0000 = 1;
  DAT_data_0005 = 0x200;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  sVar9 = 0;
  DAT_data_0008 = 0;
  DAT_data_001e = 0;
  DAT_data_000e = 0;
  DAT_data_000f = 0;
  DAT_data_000c = 0;
  DAT_data_000d = 0;
  do {
    DAT_data_0004 = sVar9 + sData0000;
    wVar6 = PA5;
    if ((wVar6 & DAT_data_0005) != 0) {
      wVar7 = PA6;
      *(word *)(wVar6 & 0xff) = wVar7;
    }
    sVar9 = DAT_data_0004 + sData0000;
  } while (sVar9 != 0);
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    wVar6 = PA5;
    if ((wVar6 & DAT_data_0005) != 0) {
      wVar7 = PA6;
      *(word *)(wVar6 & 0xff) = wVar7;
    }
    wVar8 = PA7;
    uVar1 = (ushort)((uint)((int)(short)DAT_data_0008 * (int)DAT_data_0016 * 2 +
                           (int)(short)DAT_data_000e * (int)DAT_data_001a * 2) >> 0x10);
    uVar2 = (ushort)((uint)((int)(short)uVar1 * (int)DAT_data_0017 * 2 +
                           (int)(short)DAT_data_000f * (int)DAT_data_001b * 2) >> 0x10);
    PA4 = (word)((uint)DAT_data_0008 * 0x10000 + (int)(short)DAT_data_000e * (int)DAT_data_0012 * 2
                >> 0x10);
    DAT_data_000e = PA4;
    PA4 = (word)((uint)uVar1 * 0x10000 + (int)(short)DAT_data_000f * (int)DAT_data_0013 * 2 >> 0x10)
    ;
    DAT_data_000f = PA4;
    PA4 = DAT_data_000c;
    iVar3 = (int)(short)DAT_data_0007;
    wVar6 = PA4;
    PA4 = DAT_data_000d;
    wVar7 = PA4;
    PA4 = DAT_data_001e;
    DAT_data_000c =
         (word)((uint)uVar2 * 0x10000 + (int)(short)wVar6 * (int)DAT_data_0014 * 2 >> 0x10);
    uVar1 = (ushort)((uint)((int)(short)uVar2 * (int)DAT_data_0018 * 2 +
                           (int)(short)wVar6 * (int)DAT_data_001c * 2) >> 0x10);
    DAT_data_000d =
         (word)((uint)uVar1 * 0x10000 + (int)(short)wVar7 * (int)DAT_data_0015 * 2 >> 0x10);
    DAT_data_001e =
         (word)((uint)((int)(short)uVar1 * (int)DAT_data_0019 * 2 +
                      (int)(short)wVar7 * (int)DAT_data_001d * 2) >> 0x10);
    DAT_data_0007 = PA7;
    iVar4 = (int)(short)DAT_data_001f;
    DAT_data_001f = PA3;
    DAT_data_0008 =
         (ushort)(((int)(short)wVar8 * (int)DAT_data_0040 * 2 + iVar3 * DAT_data_0041 * 2 &
                  0xffff0000U) + iVar4 * DAT_data_0042 * 2 >> 0x10);
  } while( true );
}


