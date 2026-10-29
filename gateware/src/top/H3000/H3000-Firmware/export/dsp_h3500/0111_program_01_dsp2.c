// 0111_program_01_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0111_program_01_dsp2 (ucode_0111_ROM2_02CA8.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  int iVar2;
  ushort uVar3;
  char cVar4;
  word wVar5;
  word wVar6;
  word wVar7;
  ushort uVar8;
  
  uVar8 = 0x8f;
  do {
    *(undefined2 *)(uVar8 & 0xff) = 0;
    uVar3 = uVar8 & 0x1ff;
    uVar8 = uVar8 - 1;
  } while (uVar3 != 0);
  sData0000 = 1;
  DAT_data_0005 = 0x200;
  DAT_data_0004 = 0x7fff;
  do {
    cVar4 = bio_pin();
  } while (cVar4 != '\0');
  wVar7 = PA0;
  do {
    cVar4 = bio_pin();
  } while (cVar4 == '\0');
  do {
    wVar7 = PA5;
    if ((wVar7 & DAT_data_0005) != 0) {
      wVar5 = PA6;
      *(word *)(wVar7 & 0xff) = wVar5;
    }
    PA7 = DAT_data_0004 + sData0000;
    wVar7 = DAT_data_0004 + sData0000 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    wVar7 = wVar7 + sData0000;
    PA7 = wVar7;
    DAT_data_0004 = wVar7 + sData0000;
    PA7 = DAT_data_0004;
  } while ((short)DAT_data_0004 < 0);
  do {
    cVar4 = bio_pin();
  } while (cVar4 != '\0');
  wVar7 = PA0;
  do {
    cVar4 = bio_pin();
  } while (cVar4 == '\0');
  do {
    wVar7 = PA5;
    if ((wVar7 & DAT_data_0005) != 0) {
      wVar5 = PA6;
      *(word *)(wVar7 & 0xff) = wVar5;
    }
    wVar6 = PA7;
    uVar8 = (ushort)((uint)((int)(short)DAT_data_0008 * (int)DAT_data_0016 * 2 +
                           (int)(short)DAT_data_000e * (int)DAT_data_001a * 2) >> 0x10);
    uVar3 = (ushort)((uint)((int)(short)uVar8 * (int)DAT_data_0017 * 2 +
                           (int)(short)DAT_data_000f * (int)DAT_data_001b * 2) >> 0x10);
    PA4 = (word)((uint)DAT_data_0008 * 0x10000 + (int)(short)DAT_data_000e * (int)DAT_data_0012 * 2
                >> 0x10);
    DAT_data_000e = PA4;
    PA4 = (word)((uint)uVar8 * 0x10000 + (int)(short)DAT_data_000f * (int)DAT_data_0013 * 2 >> 0x10)
    ;
    DAT_data_000f = PA4;
    PA4 = DAT_data_000c;
    iVar1 = (int)(short)DAT_data_0007;
    wVar7 = PA4;
    PA4 = DAT_data_000d;
    wVar5 = PA4;
    PA4 = DAT_data_001e;
    DAT_data_000c =
         (word)((uint)uVar3 * 0x10000 + (int)(short)wVar7 * (int)DAT_data_0014 * 2 >> 0x10);
    uVar8 = (ushort)((uint)((int)(short)uVar3 * (int)DAT_data_0018 * 2 +
                           (int)(short)wVar7 * (int)DAT_data_001c * 2) >> 0x10);
    DAT_data_000d =
         (word)((uint)uVar8 * 0x10000 + (int)(short)wVar5 * (int)DAT_data_0015 * 2 >> 0x10);
    DAT_data_001e =
         (word)((uint)((int)(short)uVar8 * (int)DAT_data_0019 * 2 +
                      (int)(short)wVar5 * (int)DAT_data_001d * 2) >> 0x10);
    DAT_data_0007 = PA7;
    iVar2 = (int)(short)DAT_data_001f;
    DAT_data_001f = PA3;
    DAT_data_0008 =
         (ushort)(((int)(short)wVar6 * (int)DAT_data_0040 * 2 + iVar1 * DAT_data_0041 * 2 &
                  0xffff0000U) + iVar2 * DAT_data_0042 * 2 >> 0x10);
  } while( true );
}


