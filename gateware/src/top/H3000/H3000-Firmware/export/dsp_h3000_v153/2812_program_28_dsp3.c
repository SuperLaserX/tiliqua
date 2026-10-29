// 2812_program_28_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 2812_program_28_dsp3 (ucode_2812_BigROM_0A0CF.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  char cVar4;
  word wVar5;
  word wVar6;
  short sVar8;
  uint uVar7;
  
  sData0000 = 1;
  DAT_data_0004 = 0x400;
  DAT_data_0040 = 0;
  DAT_data_0041 = 0x7fff;
  do {
    cVar4 = bio_pin();
  } while (cVar4 != '\0');
  wVar5 = PA0;
  do {
    cVar4 = bio_pin();
  } while (cVar4 == '\0');
  sVar8 = 0;
  DAT_data_000e = 0;
  DAT_data_000f = 0;
  DAT_data_0010 = 0;
  DAT_data_0011 = 0;
  DAT_data_0013 = 0;
  DAT_data_0014 = 0;
  DAT_data_0015 = 0;
  DAT_data_0016 = 0;
  DAT_data_0017 = 0;
  DAT_data_000d = 0;
  DAT_data_0012 = 0;
  DAT_data_0042 = DAT_data_0040;
  DAT_data_0045 = DAT_data_0040;
  DAT_data_0046 = DAT_data_0041;
  DAT_data_0047 = DAT_data_0040;
  do {
    DAT_data_0003 = sVar8 + sData0000;
    wVar5 = PA5;
    if ((wVar5 & DAT_data_0004) != 0) {
      wVar6 = PA6;
      *(word *)(wVar5 & 0xff) = wVar6;
    }
    sVar8 = DAT_data_0003 + sData0000;
  } while (sVar8 != 0);
  do {
    cVar4 = bio_pin();
  } while (cVar4 != '\0');
  wVar5 = PA0;
  do {
    cVar4 = bio_pin();
  } while (cVar4 == '\0');
  do {
    wVar5 = PA5;
    if ((wVar5 & DAT_data_0004) != 0) {
      wVar6 = PA6;
      *(word *)(wVar5 & 0xff) = wVar6;
    }
    uVar7 = (uint)DAT_data_000d;
    PA7 = DAT_data_0005;
    iVar1 = (int)(short)DAT_data_0017;
    PA7 = DAT_data_0006;
    DAT_data_0017 = PA4;
    PA7 = DAT_data_0007;
    uVar2 = (uint)DAT_data_0012;
    PA7 = DAT_data_0008;
    PA7 = DAT_data_0009;
    DAT_data_0005 = DAT_data_0005 - sData0000;
    PA7 = DAT_data_000a;
    DAT_data_000d = PA4;
    DAT_data_0006 = DAT_data_0005 + DAT_data_004b;
    PA7 = DAT_data_000b;
    DAT_data_0012 = PA4;
    PA7 = DAT_data_000c;
    PA1 = DAT_data_0010;
    PA2 = DAT_data_0015;
    DAT_data_0007 = DAT_data_0006 + DAT_data_004c;
    DAT_data_0008 = DAT_data_0007 + DAT_data_004d;
    DAT_data_0009 = DAT_data_0008 + DAT_data_004e;
    DAT_data_000a = DAT_data_0009 + DAT_data_004f;
    DAT_data_000b = DAT_data_000a + DAT_data_0050;
    DAT_data_000c = DAT_data_000b + DAT_data_0051;
    PA6 = (word)(uVar7 * 0x10000 + iVar1 * 0x8000 >> 0x10);
    PA5 = (word)(uVar2 * 0x10000 + (int)(short)DAT_data_0017 * 0x8000 >> 0x10);
    if (DAT_data_004a == 0) {
      iVar1 = (int)(short)DAT_data_000f;
      DAT_data_000f = DAT_data_000e;
      iVar3 = (int)(short)DAT_data_0011;
      DAT_data_0011 = DAT_data_0010;
      uVar7 = (int)(short)DAT_data_0010 * 0x8000 + iVar1 * DAT_data_0042 +
              (int)(short)DAT_data_000e * -0x8000 + (int)(short)DAT_data_000e * (int)DAT_data_0041 +
              (int)(short)DAT_data_000d * (int)DAT_data_0040 + iVar3 * DAT_data_0044 +
              (int)(short)DAT_data_0010 * (int)DAT_data_0043;
      DAT_data_0010 = (word)(uVar7 + (uVar7 & 0xffff0000) + (uVar7 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_0014;
      DAT_data_0014 = DAT_data_0013;
      iVar3 = (int)(short)DAT_data_0016;
      DAT_data_0016 = DAT_data_0015;
      uVar7 = (int)(short)DAT_data_0015 * 0x8000 + iVar1 * DAT_data_0042 +
              (int)(short)DAT_data_0013 * -0x8000 + (int)(short)DAT_data_0013 * (int)DAT_data_0041 +
              (int)(short)DAT_data_0012 * (int)DAT_data_0040 + iVar3 * DAT_data_0044 +
              (int)(short)DAT_data_0015 * (int)DAT_data_0043;
      DAT_data_0015 = (word)(uVar7 + (uVar7 & 0xffff0000) + (uVar7 & 0xffff) >> 0x10);
      DAT_data_000e = DAT_data_000d;
      DAT_data_0013 = DAT_data_0012;
    }
    else {
      iVar1 = (int)(short)DAT_data_000f;
      DAT_data_000f = DAT_data_000e;
      iVar3 = (int)(short)DAT_data_0011;
      DAT_data_0011 = DAT_data_0010;
      uVar7 = (int)(short)DAT_data_0010 * 0x8000 + iVar1 * DAT_data_0047 +
              (int)(short)DAT_data_000e * -0x8000 + (int)(short)DAT_data_000e * (int)DAT_data_0046 +
              (int)(short)DAT_data_000d * (int)DAT_data_0045 + iVar3 * DAT_data_0049 +
              (int)(short)DAT_data_0010 * (int)DAT_data_0048;
      DAT_data_0010 = (word)(uVar7 + (uVar7 & 0xffff0000) + (uVar7 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_0014;
      DAT_data_0014 = DAT_data_0013;
      iVar3 = (int)(short)DAT_data_0016;
      DAT_data_0016 = DAT_data_0015;
      uVar7 = (int)(short)DAT_data_0015 * 0x8000 + iVar1 * DAT_data_0047 +
              (int)(short)DAT_data_0013 * -0x8000 + (int)(short)DAT_data_0013 * (int)DAT_data_0046 +
              (int)(short)DAT_data_0012 * (int)DAT_data_0045 + iVar3 * DAT_data_0049 +
              (int)(short)DAT_data_0015 * (int)DAT_data_0048;
      DAT_data_0015 = (word)(uVar7 + (uVar7 & 0xffff0000) + (uVar7 & 0xffff) >> 0x10);
      DAT_data_000e = DAT_data_000d;
      DAT_data_0013 = DAT_data_0012;
    }
  } while( true );
}


