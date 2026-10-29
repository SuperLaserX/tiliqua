// 2810_program_28_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 2810_program_28_dsp1 (ucode_2810_ROM2_01A52.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  word wVar8;
  int iVar7;
  ushort uVar9;
  
  uVar9 = 0x8f;
  do {
    *(undefined2 *)(uVar9 & 0xff) = 0;
    uVar2 = uVar9 & 0x1ff;
    uVar9 = uVar9 - 1;
  } while (uVar2 != 0);
  sData0000 = 1;
  DAT_data_0003 = 0x100;
  DAT_data_0002 = 0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar8 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0003) != 0) {
      wVar4 = PA6;
      *(word *)(wVar8 & 0xff) = wVar4;
    }
    PA7 = DAT_data_0002;
    PA7 = DAT_data_0002 + sData0000;
    wVar8 = DAT_data_0002 + sData0000 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    wVar8 = wVar8 + sData0000;
    PA7 = wVar8;
    DAT_data_0002 = wVar8 + sData0000;
  } while (-1 < (short)DAT_data_0002);
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar8 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0003) != 0) {
      wVar4 = PA6;
      *(word *)(wVar8 & 0xff) = wVar4;
    }
    PA1 = DAT_data_000c;
    PA2 = DAT_data_0011;
    wVar8 = PA4;
    if (DAT_data_004a == 0) {
      wVar4 = PA4;
      wVar5 = PA4;
      wVar6 = PA4;
      iVar7 = (int)DAT_data_000b * (int)DAT_data_0041 * 2 + (int)(short)wVar8 * (int)DAT_data_0040;
      DAT_data_000b = (short)((uint)iVar7 >> 0x10);
      PA1 = DAT_data_0016;
      PA2 = DAT_data_001b;
      iVar7 = (iVar7 + (uint)wVar8 * 0x10000) - (int)(short)wVar8 * (int)DAT_data_0040;
      sVar1 = (short)((uint)iVar7 >> 0x10);
      iVar7 = iVar7 + (int)DAT_data_000d * (int)DAT_data_0043 * 2 +
              (int)sVar1 * (int)DAT_data_0042 * 2;
      DAT_data_000d = (short)((uint)iVar7 >> 0x10);
      DAT_data_000c = (word)((uint)(iVar7 + (int)sVar1 * (int)DAT_data_0044 * 2) >> 0x10);
      iVar7 = (int)DAT_data_0010 * (int)DAT_data_0041 * 2 + (int)(short)wVar4 * (int)DAT_data_0040;
      DAT_data_0010 = (short)((uint)iVar7 >> 0x10);
      iVar7 = (iVar7 + (uint)wVar4 * 0x10000) - (int)(short)wVar4 * (int)DAT_data_0040;
      sVar1 = (short)((uint)iVar7 >> 0x10);
      iVar7 = iVar7 + (int)DAT_data_0012 * (int)DAT_data_0043 * 2 +
              (int)sVar1 * (int)DAT_data_0042 * 2;
      DAT_data_0012 = (short)((uint)iVar7 >> 0x10);
      DAT_data_0011 = (word)((uint)(iVar7 + (int)sVar1 * (int)DAT_data_0044 * 2) >> 0x10);
      iVar7 = (int)DAT_data_0015 * (int)DAT_data_0041 * 2 + (int)(short)wVar5 * (int)DAT_data_0040;
      DAT_data_0015 = (short)((uint)iVar7 >> 0x10);
      iVar7 = (iVar7 + (uint)wVar5 * 0x10000) - (int)(short)wVar5 * (int)DAT_data_0040;
      sVar1 = (short)((uint)iVar7 >> 0x10);
      iVar7 = iVar7 + (int)DAT_data_0017 * (int)DAT_data_0043 * 2 +
              (int)sVar1 * (int)DAT_data_0042 * 2;
      DAT_data_0017 = (short)((uint)iVar7 >> 0x10);
      DAT_data_0016 = (word)((uint)(iVar7 + (int)sVar1 * (int)DAT_data_0044 * 2) >> 0x10);
      iVar7 = (uint)wVar6 * 0x10000 + (int)DAT_data_001c * (int)DAT_data_0043 * 2 +
              (int)(short)wVar6 * (int)DAT_data_0042 * 2;
      DAT_data_001c = (short)((uint)iVar7 >> 0x10);
      DAT_data_001b = (word)((uint)(iVar7 + (int)(short)wVar6 * (int)DAT_data_0044 * 2) >> 0x10);
    }
    else {
      wVar4 = PA4;
      wVar5 = PA4;
      wVar6 = PA4;
      iVar7 = (int)DAT_data_000b * (int)DAT_data_0046 * 2 + (int)(short)wVar8 * (int)DAT_data_0045;
      DAT_data_000b = (short)((uint)iVar7 >> 0x10);
      PA1 = DAT_data_0016;
      PA2 = DAT_data_001b;
      iVar7 = (iVar7 + (uint)wVar8 * 0x10000) - (int)(short)wVar8 * (int)DAT_data_0045;
      sVar1 = (short)((uint)iVar7 >> 0x10);
      iVar7 = iVar7 + (int)DAT_data_000d * (int)DAT_data_0048 * 2 +
              (int)sVar1 * (int)DAT_data_0047 * 2;
      DAT_data_000d = (short)((uint)iVar7 >> 0x10);
      DAT_data_000c = (word)((uint)(iVar7 + (int)sVar1 * (int)DAT_data_0049 * 2) >> 0x10);
      iVar7 = (int)DAT_data_0010 * (int)DAT_data_0046 * 2 + (int)(short)wVar4 * (int)DAT_data_0045;
      DAT_data_0010 = (short)((uint)iVar7 >> 0x10);
      iVar7 = (iVar7 + (uint)wVar4 * 0x10000) - (int)(short)wVar4 * (int)DAT_data_0045;
      sVar1 = (short)((uint)iVar7 >> 0x10);
      iVar7 = iVar7 + (int)DAT_data_0012 * (int)DAT_data_0048 * 2 +
              (int)sVar1 * (int)DAT_data_0047 * 2;
      DAT_data_0012 = (short)((uint)iVar7 >> 0x10);
      DAT_data_0011 = (word)((uint)(iVar7 + (int)sVar1 * (int)DAT_data_0049 * 2) >> 0x10);
      iVar7 = (int)DAT_data_0015 * (int)DAT_data_0046 * 2 + (int)(short)wVar5 * (int)DAT_data_0045;
      DAT_data_0015 = (short)((uint)iVar7 >> 0x10);
      iVar7 = (iVar7 + (uint)wVar5 * 0x10000) - (int)(short)wVar5 * (int)DAT_data_0045;
      sVar1 = (short)((uint)iVar7 >> 0x10);
      iVar7 = iVar7 + (int)DAT_data_0017 * (int)DAT_data_0048 * 2 +
              (int)sVar1 * (int)DAT_data_0047 * 2;
      DAT_data_0017 = (short)((uint)iVar7 >> 0x10);
      DAT_data_0016 = (word)((uint)(iVar7 + (int)sVar1 * (int)DAT_data_0049 * 2) >> 0x10);
      iVar7 = (uint)wVar6 * 0x10000 + (int)DAT_data_001c * (int)DAT_data_0048 * 2 +
              (int)(short)wVar6 * (int)DAT_data_0047 * 2;
      DAT_data_001c = (short)((uint)iVar7 >> 0x10);
      DAT_data_001b = (word)((uint)(iVar7 + (int)(short)wVar6 * (int)DAT_data_0049 * 2) >> 0x10);
    }
  } while( true );
}


