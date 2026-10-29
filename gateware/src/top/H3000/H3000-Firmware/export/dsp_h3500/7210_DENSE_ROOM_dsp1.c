// 7210_DENSE_ROOM_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7210_DENSE_ROOM_dsp1 (ucode_7210_ROM4_02679.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  uint uVar7;
  uint uVar8;
  
  sData0000 = 1;
  DAT_data_0003 = 0x100;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  DAT_data_0007 = 0;
  DAT_data_0002 = 0;
  DAT_data_0018 = 0;
  DAT_data_001b = 0;
  do {
    PA7 = DAT_data_0002;
    PA4 = DAT_data_0007;
    DAT_data_0002 = DAT_data_0002 + sData0000;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0002;
    PA4 = DAT_data_0007;
    DAT_data_0002 = DAT_data_0002 + sData0000;
  } while (DAT_data_0002 != 0);
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
    wVar2 = PA4;
    DAT_data_0018 =
         (word)((uint)(((int)(short)DAT_data_0018 * (int)DAT_data_0040 +
                       (int)(short)DAT_data_0016 * (int)DAT_data_0041) * 2) >> 0x10);
    wVar3 = PA4;
    DAT_data_001b =
         (word)((uint)(((int)(short)DAT_data_001b * (int)DAT_data_0040 +
                       (int)(short)DAT_data_0019 * (int)DAT_data_0041) * 2) >> 0x10);
    wVar4 = PA4;
    wVar5 = PA4;
    DAT_data_0016 = PA4;
    DAT_data_0019 = PA4;
    PA4 = DAT_data_0008;
    wVar6 = PA4;
    uVar7 = (int)(short)DAT_data_0009 * (int)DAT_data_0043 + (int)(short)wVar2 * (int)DAT_data_0044
            + (int)(short)wVar3 * (int)DAT_data_0045 + (int)(short)wVar4 * (int)DAT_data_0046 +
            (int)(short)wVar5 * (int)DAT_data_0047 + (int)(short)DAT_data_0016 * (int)DAT_data_0048
            + (int)(short)DAT_data_0019 * (int)DAT_data_0049 +
            (int)(short)wVar6 * (int)DAT_data_0042;
    uVar8 = (int)(short)DAT_data_0009 * (int)DAT_data_004b + (int)(short)wVar6 * (int)DAT_data_004a
            + (int)(short)wVar2 * (int)DAT_data_004c + (int)(short)wVar3 * (int)DAT_data_004d +
            (int)(short)wVar4 * (int)DAT_data_004e + (int)(short)wVar5 * (int)DAT_data_004f +
            (int)(short)DAT_data_0016 * (int)DAT_data_0050 +
            (int)(short)DAT_data_0019 * (int)DAT_data_0051;
    DAT_data_0008 = PA7;
    PA6 = (word)(uVar7 + (uVar7 & 0xffff0000) + (uVar7 & 0xffff) >> 0x10);
    PA5 = (word)(uVar8 + (uVar8 & 0xffff0000) + (uVar8 & 0xffff) >> 0x10);
    PA1 = DAT_data_0018;
    PA1 = DAT_data_001b;
    DAT_data_0009 = PA2;
  } while( true );
}


