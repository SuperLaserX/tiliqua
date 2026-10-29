// 2810_program_28_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 2810_program_28_dsp1 (ucode_2810_BigROM_09BD3.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  int iVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  word wVar7;
  uint uVar8;
  
  sData0000 = 1;
  DAT_data_0003 = 0x100;
  DAT_data_0040 = 0;
  DAT_data_0042 = 0;
  DAT_data_0041 = 0x7fff;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  DAT_data_0007 = 0;
  DAT_data_0002 = 0;
  DAT_data_000b = 0;
  DAT_data_000c = 0;
  DAT_data_000d = 0;
  DAT_data_000e = 0;
  DAT_data_0010 = 0;
  DAT_data_0011 = 0;
  DAT_data_0012 = 0;
  DAT_data_0013 = 0;
  DAT_data_0015 = 0;
  DAT_data_0016 = 0;
  DAT_data_0017 = 0;
  DAT_data_0018 = 0;
  DAT_data_001a = 0;
  DAT_data_001b = 0;
  DAT_data_001c = 0;
  DAT_data_001d = 0;
  DAT_data_0045 = DAT_data_0040;
  DAT_data_0046 = DAT_data_0041;
  DAT_data_0047 = DAT_data_0042;
  do {
    PA7 = DAT_data_0002;
    PA4 = DAT_data_0007;
    DAT_data_0002 = DAT_data_0002 + sData0000;
    wVar4 = PA5;
    if ((wVar4 & DAT_data_0003) != 0) {
      wVar5 = PA6;
      *(word *)(wVar4 & 0xff) = wVar5;
    }
    PA7 = DAT_data_0002;
    PA4 = DAT_data_0007;
    DAT_data_0002 = DAT_data_0002 + sData0000;
  } while (DAT_data_0002 != 0);
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar4 = PA5;
    if ((wVar4 & DAT_data_0003) != 0) {
      wVar5 = PA6;
      *(word *)(wVar4 & 0xff) = wVar5;
    }
    PA1 = DAT_data_000d;
    PA2 = DAT_data_0012;
    wVar4 = PA4;
    if (DAT_data_004a == 0) {
      wVar5 = PA4;
      wVar6 = PA4;
      iVar1 = (int)(short)DAT_data_000c;
      DAT_data_000c = DAT_data_000b;
      wVar7 = PA4;
      PA1 = DAT_data_0017;
      PA2 = DAT_data_001c;
      iVar2 = (int)(short)DAT_data_000e;
      DAT_data_000e = DAT_data_000d;
      uVar8 = (int)(short)DAT_data_000d * 0x8000 + iVar1 * DAT_data_0042 +
              (int)(short)DAT_data_000b * -0x8000 + (int)(short)DAT_data_000b * (int)DAT_data_0041 +
              (int)(short)wVar4 * (int)DAT_data_0040 + iVar2 * DAT_data_0044 +
              (int)(short)DAT_data_000d * (int)DAT_data_0043;
      DAT_data_000d = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_0011;
      DAT_data_0011 = DAT_data_0010;
      iVar2 = (int)(short)DAT_data_0013;
      DAT_data_0013 = DAT_data_0012;
      uVar8 = (int)(short)DAT_data_0012 * 0x8000 + iVar1 * DAT_data_0042 +
              (int)(short)DAT_data_0010 * -0x8000 + (int)(short)DAT_data_0010 * (int)DAT_data_0041 +
              (int)(short)wVar5 * (int)DAT_data_0040 + iVar2 * DAT_data_0044 +
              (int)(short)DAT_data_0012 * (int)DAT_data_0043;
      DAT_data_0012 = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_0016;
      DAT_data_0016 = DAT_data_0015;
      iVar2 = (int)(short)DAT_data_0018;
      DAT_data_0018 = DAT_data_0017;
      uVar8 = (int)(short)DAT_data_0017 * 0x8000 + iVar1 * DAT_data_0042 +
              (int)(short)DAT_data_0015 * -0x8000 + (int)(short)DAT_data_0015 * (int)DAT_data_0041 +
              (int)(short)wVar6 * (int)DAT_data_0040 + iVar2 * DAT_data_0044 +
              (int)(short)DAT_data_0017 * (int)DAT_data_0043;
      DAT_data_0017 = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_001b;
      DAT_data_001b = DAT_data_001a;
      iVar2 = (int)(short)DAT_data_001d;
      DAT_data_001d = DAT_data_001c;
      uVar8 = (int)(short)DAT_data_001c * 0x8000 + iVar1 * DAT_data_0042 +
              (int)(short)DAT_data_001a * -0x8000 + (int)(short)DAT_data_001a * (int)DAT_data_0041 +
              (int)(short)wVar7 * (int)DAT_data_0040 + iVar2 * DAT_data_0044 +
              (int)(short)DAT_data_001c * (int)DAT_data_0043;
      DAT_data_001c = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      DAT_data_000b = wVar4;
      DAT_data_0010 = wVar5;
      DAT_data_0015 = wVar6;
      DAT_data_001a = wVar7;
    }
    else {
      wVar5 = PA4;
      wVar6 = PA4;
      iVar1 = (int)(short)DAT_data_000c;
      DAT_data_000c = DAT_data_000b;
      wVar7 = PA4;
      PA1 = DAT_data_0017;
      PA2 = DAT_data_001c;
      iVar2 = (int)(short)DAT_data_000e;
      DAT_data_000e = DAT_data_000d;
      uVar8 = (int)(short)DAT_data_000d * 0x8000 + iVar1 * DAT_data_0047 +
              (int)(short)DAT_data_000b * -0x8000 + (int)(short)DAT_data_000b * (int)DAT_data_0046 +
              (int)(short)wVar4 * (int)DAT_data_0045 + iVar2 * DAT_data_0049 +
              (int)(short)DAT_data_000d * (int)DAT_data_0048;
      DAT_data_000d = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_0011;
      DAT_data_0011 = DAT_data_0010;
      iVar2 = (int)(short)DAT_data_0013;
      DAT_data_0013 = DAT_data_0012;
      uVar8 = (int)(short)DAT_data_0012 * 0x8000 + iVar1 * DAT_data_0047 +
              (int)(short)DAT_data_0010 * -0x8000 + (int)(short)DAT_data_0010 * (int)DAT_data_0046 +
              (int)(short)wVar5 * (int)DAT_data_0045 + iVar2 * DAT_data_0049 +
              (int)(short)DAT_data_0012 * (int)DAT_data_0048;
      DAT_data_0012 = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_0016;
      DAT_data_0016 = DAT_data_0015;
      iVar2 = (int)(short)DAT_data_0018;
      DAT_data_0018 = DAT_data_0017;
      uVar8 = (int)(short)DAT_data_0017 * 0x8000 + iVar1 * DAT_data_0047 +
              (int)(short)DAT_data_0015 * -0x8000 + (int)(short)DAT_data_0015 * (int)DAT_data_0046 +
              (int)(short)wVar6 * (int)DAT_data_0045 + iVar2 * DAT_data_0049 +
              (int)(short)DAT_data_0017 * (int)DAT_data_0048;
      DAT_data_0017 = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      iVar1 = (int)(short)DAT_data_001b;
      DAT_data_001b = DAT_data_001a;
      iVar2 = (int)(short)DAT_data_001d;
      DAT_data_001d = DAT_data_001c;
      uVar8 = (int)(short)DAT_data_001c * 0x8000 + iVar1 * DAT_data_0047 +
              (int)(short)DAT_data_001a * -0x8000 + (int)(short)DAT_data_001a * (int)DAT_data_0046 +
              (int)(short)wVar7 * (int)DAT_data_0045 + iVar2 * DAT_data_0049 +
              (int)(short)DAT_data_001c * (int)DAT_data_0048;
      DAT_data_001c = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
      DAT_data_000b = wVar4;
      DAT_data_0010 = wVar5;
      DAT_data_0015 = wVar6;
      DAT_data_001a = wVar7;
    }
  } while( true );
}


