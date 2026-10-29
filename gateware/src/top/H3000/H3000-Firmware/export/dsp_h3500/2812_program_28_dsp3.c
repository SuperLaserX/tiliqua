// 2812_program_28_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 2812_program_28_dsp3 (ucode_2812_ROM2_02028.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  uint uVar2;
  uint uVar3;
  ushort uVar4;
  char cVar5;
  word wVar6;
  word wVar7;
  int iVar8;
  ushort uVar9;
  
  uVar9 = 0x8f;
  do {
    *(undefined2 *)(uVar9 & 0xff) = 0;
    uVar4 = uVar9 & 0x1ff;
    uVar9 = uVar9 - 1;
  } while (uVar4 != 0);
  sData0000 = 1;
  DAT_data_0004 = 0x400;
  DAT_data_0020 = 0;
  DAT_data_0003 = 0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    wVar6 = PA5;
    if ((wVar6 & DAT_data_0004) != 0) {
      wVar7 = PA6;
      *(word *)(wVar6 & 0xff) = wVar7;
    }
    DAT_data_0003 = DAT_data_0003 + 0x15;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
    PA4 = DAT_data_0020;
  } while (0 < DAT_data_0003);
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    wVar6 = PA5;
    if ((wVar6 & DAT_data_0004) != 0) {
      wVar7 = PA6;
      *(word *)(wVar6 & 0xff) = wVar7;
    }
    uVar2 = (uint)DAT_data_000d;
    PA7 = DAT_data_0005;
    iVar8 = (int)(short)DAT_data_0017;
    PA7 = DAT_data_0006;
    DAT_data_0017 = PA4;
    PA7 = DAT_data_0007;
    uVar3 = (uint)DAT_data_0012;
    PA7 = DAT_data_0008;
    PA7 = DAT_data_0009;
    DAT_data_0005 = DAT_data_0005 - sData0000;
    PA7 = DAT_data_000a;
    DAT_data_000d = PA4;
    DAT_data_0006 = DAT_data_0005 + DAT_data_004b;
    PA7 = DAT_data_000b;
    DAT_data_0012 = PA4;
    PA7 = DAT_data_000c;
    PA1 = DAT_data_000f;
    PA2 = DAT_data_0014;
    DAT_data_0007 = DAT_data_0006 + DAT_data_004c;
    DAT_data_0008 = DAT_data_0007 + DAT_data_004d;
    DAT_data_0009 = DAT_data_0008 + DAT_data_004e;
    DAT_data_000a = DAT_data_0009 + DAT_data_004f;
    DAT_data_000b = DAT_data_000a + DAT_data_0050;
    DAT_data_000c = DAT_data_000b + DAT_data_0051;
    PA6 = (word)(uVar2 * 0x10000 + iVar8 * 0x8000 >> 0x10);
    PA5 = (word)(uVar3 * 0x10000 + (int)(short)DAT_data_0017 * 0x8000 >> 0x10);
    if (DAT_data_004a == 0) {
      iVar8 = (int)DAT_data_000e * (int)DAT_data_0041 * 2 +
              (int)(short)DAT_data_000d * (int)DAT_data_0040;
      DAT_data_000e = (short)((uint)iVar8 >> 0x10);
      iVar8 = (iVar8 + (uint)DAT_data_000d * 0x10000) -
              (int)(short)DAT_data_000d * (int)DAT_data_0040;
      sVar1 = (short)((uint)iVar8 >> 0x10);
      iVar8 = iVar8 + (int)DAT_data_0010 * (int)DAT_data_0043 * 2 +
              (int)sVar1 * (int)DAT_data_0042 * 2;
      DAT_data_0010 = (short)((uint)iVar8 >> 0x10);
      DAT_data_000f = (word)((uint)(iVar8 + (int)sVar1 * (int)DAT_data_0044 * 2) >> 0x10);
      iVar8 = (uint)DAT_data_0012 * 0x10000 + (int)DAT_data_0015 * (int)DAT_data_0043 * 2 +
              (int)(short)DAT_data_0012 * (int)DAT_data_0042 * 2;
      DAT_data_0015 = (short)((uint)iVar8 >> 0x10);
      DAT_data_0014 =
           (word)((uint)(iVar8 + (int)(short)DAT_data_0012 * (int)DAT_data_0044 * 2) >> 0x10);
    }
    else {
      iVar8 = (int)DAT_data_000e * (int)DAT_data_0046 * 2 +
              (int)(short)DAT_data_000d * (int)DAT_data_0045;
      DAT_data_000e = (short)((uint)iVar8 >> 0x10);
      iVar8 = (iVar8 + (uint)DAT_data_000d * 0x10000) -
              (int)(short)DAT_data_000d * (int)DAT_data_0045;
      sVar1 = (short)((uint)iVar8 >> 0x10);
      iVar8 = iVar8 + (int)DAT_data_0010 * (int)DAT_data_0048 * 2 +
              (int)sVar1 * (int)DAT_data_0047 * 2;
      DAT_data_0010 = (short)((uint)iVar8 >> 0x10);
      DAT_data_000f = (word)((uint)(iVar8 + (int)sVar1 * (int)DAT_data_0049 * 2) >> 0x10);
      iVar8 = (uint)DAT_data_0012 * 0x10000 + (int)DAT_data_0015 * (int)DAT_data_0048 * 2 +
              (int)(short)DAT_data_0012 * (int)DAT_data_0047 * 2;
      DAT_data_0015 = (short)((uint)iVar8 >> 0x10);
      DAT_data_0014 =
           (word)((uint)(iVar8 + (int)(short)DAT_data_0012 * (int)DAT_data_0049 * 2) >> 0x10);
    }
  } while( true );
}


