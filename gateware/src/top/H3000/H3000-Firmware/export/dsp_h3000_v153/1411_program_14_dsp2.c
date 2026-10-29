// 1411_program_14_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 1411_program_14_dsp2 (ucode_1411_BigROM_0F5C1.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  ushort uVar4;
  char cVar5;
  word wVar6;
  word wVar7;
  ushort uVar8;
  
  DAT_data_0008 = 1;
  DAT_data_0003 = 0x200;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  DAT_data_0018 = 0;
  DAT_data_000a = 0;
  DAT_data_0004 = 0;
  DAT_data_0005 = 0;
  DAT_data_0006 = 0;
  DAT_data_0007 = 0;
  do {
    PA7 = DAT_data_000a;
    PA4 = DAT_data_0018;
    DAT_data_000a = DAT_data_000a + DAT_data_0008;
    wVar6 = PA5;
    if ((wVar6 & DAT_data_0003) != 0) {
      wVar7 = PA6;
      *(word *)(wVar6 & 0xff) = wVar7;
    }
    PA7 = DAT_data_000a;
    PA4 = DAT_data_0018;
    DAT_data_000a = DAT_data_000a + DAT_data_0008;
  } while (DAT_data_000a != 0);
  uVar8 = 2;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
LAB_prog_0847:
  wVar6 = PA5;
  if ((wVar6 & DAT_data_0003) != 0) {
    wVar7 = PA6;
    *(word *)(wVar6 & 0xff) = wVar7;
  }
LAB_prog_0852:
  do {
    DAT_data_0016 = PA7;
    PA4 = DAT_data_0005;
    PA4 = DAT_data_0006;
    PA4 = DAT_data_0007;
    DAT_data_000e = PA4;
    DAT_data_0011 = PA4;
    DAT_data_000f = PA4;
    DAT_data_0012 = PA4;
    DAT_data_0010 = PA4;
    DAT_data_0013 = PA4;
    wVar6 = PA1;
    *(word *)(uVar8 & 0xff) = wVar6;
    sVar1 = (short)((uint)((((int)sData0000 * (int)(short)DAT_data_0011 -
                            (int)sData0000 * (int)(short)DAT_data_000e) +
                           (int)(short)DAT_data_000e * 0x8000) * 2) >> 0x10);
    sVar2 = (short)((uint)((((int)DAT_data_0002 * (int)(short)DAT_data_0012 -
                            (int)DAT_data_0002 * (int)(short)DAT_data_000f) +
                           (int)(short)DAT_data_000f * 0x8000) * 2) >> 0x10);
    sVar3 = (short)((uint)((((int)DAT_data_0001 * (int)(short)DAT_data_0013 -
                            (int)DAT_data_0001 * (int)(short)DAT_data_0010) +
                           (int)(short)DAT_data_0010 * 0x8000) * 2) >> 0x10);
    DAT_data_0005 =
         (word)((uint)DAT_data_0004 * 0x10000 + (int)sVar1 * (int)DAT_data_0046 * 2 >> 0x10);
    DAT_data_0006 =
         (word)((uint)DAT_data_0004 * 0x10000 + (int)sVar2 * (int)DAT_data_0047 * 2 >> 0x10);
    PA1 = (word)((uint)((int)sVar1 * (int)DAT_data_0040 * 2 + (int)sVar2 * (int)DAT_data_0041 * 2 +
                       (int)sVar3 * (int)DAT_data_0042 * 2) >> 0x10);
    PA1 = (word)((uint)((int)sVar1 * (int)DAT_data_0043 * 2 + (int)sVar2 * (int)DAT_data_0044 * 2 +
                       (int)sVar3 * (int)DAT_data_0045 * 2) >> 0x10);
    DAT_data_0007 =
         (word)((uint)DAT_data_0004 * 0x10000 + (int)sVar3 * (int)DAT_data_0048 * 2 >> 0x10);
    DAT_data_0004 = DAT_data_0016;
    if (DAT_data_0049 != 0) {
      DAT_data_0004 = PA7;
    }
    uVar4 = uVar8 & 0x1ff;
    uVar8 = uVar8 - 1;
    if (uVar4 != 0) goto LAB_prog_0847;
joined_p0x08a9:
    uVar8 = 2;
    if (DAT_data_004a == 0) {
LAB_prog_092d:
      uVar8 = 2;
LAB_prog_08c5:
      DAT_data_0016 = PA7;
      PA4 = DAT_data_0005;
      PA4 = DAT_data_0006;
      PA4 = DAT_data_0007;
      DAT_data_000e = PA4;
      DAT_data_0011 = PA4;
      DAT_data_000f = PA4;
      DAT_data_0012 = PA4;
      DAT_data_0010 = PA4;
      DAT_data_0013 = PA4;
      wVar6 = PA1;
      *(word *)(uVar8 & 0xff) = wVar6;
      DAT_data_0005 =
           (word)((uint)((((int)sData0000 * (int)(short)DAT_data_0011 -
                          (int)sData0000 * (int)(short)DAT_data_000e) +
                         (int)(short)DAT_data_000e * 0x8000) * 2) >> 0x10);
      DAT_data_0006 =
           (word)((uint)((((int)DAT_data_0002 * (int)(short)DAT_data_0012 -
                          (int)DAT_data_0002 * (int)(short)DAT_data_000f) +
                         (int)(short)DAT_data_000f * 0x8000) * 2) >> 0x10);
      DAT_data_0007 =
           (word)((uint)((((int)DAT_data_0001 * (int)(short)DAT_data_0013 -
                          (int)DAT_data_0001 * (int)(short)DAT_data_0010) +
                         (int)(short)DAT_data_0010 * 0x8000) * 2) >> 0x10);
      PA1 = (word)((uint)((int)(short)DAT_data_0005 * (int)DAT_data_0040 * 2 +
                          (int)(short)DAT_data_0006 * (int)DAT_data_0041 * 2 +
                         (int)(short)DAT_data_0007 * (int)DAT_data_0042 * 2) >> 0x10);
      PA1 = (word)((uint)((int)(short)DAT_data_0005 * (int)DAT_data_0043 * 2 +
                          (int)(short)DAT_data_0006 * (int)DAT_data_0044 * 2 +
                         (int)(short)DAT_data_0007 * (int)DAT_data_0045 * 2) >> 0x10);
      if (DAT_data_0049 == 0) {
        DAT_data_0004 = DAT_data_0016;
        if ((uVar8 & 0x1ff) == 0) break;
      }
      else {
        DAT_data_0004 = PA7;
        if ((uVar8 & 0x1ff) == 0) goto joined_p0x08a9;
      }
      uVar8 = uVar8 - 1;
      wVar6 = PA5;
      if ((wVar6 & DAT_data_0003) != 0) {
        wVar7 = PA6;
        *(word *)(wVar6 & 0xff) = wVar7;
      }
      goto LAB_prog_08c5;
    }
  } while( true );
  uVar8 = 2;
  if (DAT_data_004a != 0) goto LAB_prog_0852;
  goto LAB_prog_092d;
}


