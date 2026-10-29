// 2811_program_28_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 2811_program_28_dsp2 (ucode_2811_BigROM_09DE5.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  word wVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar10;
  word wVar11;
  word wVar12;
  short sVar14;
  int iVar13;
  int iVar15;
  
  sData0000 = 1;
  DAT_data_0003 = 0x200;
  DAT_data_0004 = 0xc000;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar2 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  sVar14 = 0;
  DAT_data_0009 = 0;
  DAT_data_000a = 0;
  DAT_data_000b = 0;
  DAT_data_000c = 0;
  DAT_data_000d = 0;
  DAT_data_000e = 0;
  DAT_data_001d = 0;
  do {
    DAT_data_0002 = sVar14 + sData0000;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar4 = PA6;
      *(word *)(wVar2 & 0xff) = wVar4;
    }
    sVar14 = DAT_data_0002 + sData0000;
  } while (sVar14 != 0);
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar2 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    iVar13 = (uint)DAT_data_001d * 0x10000;
    if (iVar13 < 0) {
      iVar13 = (uint)DAT_data_001d * -0x10000;
    }
    uVar1 = (ushort)((uint)iVar13 >> 0x10);
    iVar13 = (int)(short)DAT_data_0006;
    DAT_data_0006 = uVar1;
    if (-1 < iVar13 * DAT_data_0041 + (int)(short)uVar1 * -0x8000) {
      DAT_data_0006 = (ushort)((uint)(iVar13 * DAT_data_0041 * 2) >> 0x10);
    }
    PA4 = DAT_data_0009;
    PA4 = DAT_data_000a;
    wVar5 = PA1;
    PA4 = DAT_data_000b;
    wVar8 = PA2;
    PA4 = DAT_data_000c;
    wVar2 = (word)((uint)DAT_data_0006 * 0x10000 + (uint)DAT_data_0040 * -0x10000 >> 0x10);
    PA4 = DAT_data_000d;
    wVar4 = PA0;
    PA4 = DAT_data_000e;
    wVar6 = PA1;
    PA4 = DAT_data_0005;
    wVar9 = PA2;
    iVar13 = (int)(short)DAT_data_0008;
    wVar12 = PA4;
    wVar7 = PA1;
    wVar10 = PA2;
    iVar15 = (int)(short)wVar12 * (int)DAT_data_0042;
    wVar12 = PA7;
    if (((sData0000 << 1 & wVar4) == 0) &&
       (DAT_data_0008 = wVar2, (int)((short)wVar2 * iVar13 & 0xffff0000U) < 1)) {
      PA0 = DAT_data_0004;
      PA3 = wVar2;
    }
    PA4 = (word)((uint)(iVar15 + (int)(short)wVar5 * 0x4000 + (int)(short)wVar8 * 0x4000 +
                        (int)(short)wVar6 * 0x8000 + (int)(short)wVar9 * 0x8000 +
                        (int)(short)wVar7 * 0x8000 + (int)(short)wVar10 * 0x8000) >> 0x10);
    PA4 = (word)((uint)(iVar15 + (int)(short)wVar5 * 0x8000 + (int)(short)wVar8 * 0x8000 +
                        (int)(short)wVar6 * 0x4000 + (int)(short)wVar9 * 0x4000 +
                        (int)(short)wVar7 * -0x8000 + (int)(short)wVar10 * -0x8000) >> 0x10);
    wVar2 = PA1;
    PA4 = (word)((uint)(iVar15 + (int)(short)wVar5 * -0x4000 + (int)(short)wVar8 * 0x4000 +
                        (int)(short)wVar6 * 0x8000 + (int)(short)wVar9 * -0x8000 +
                        (int)(short)wVar7 * 0x8000 + (int)(short)wVar10 * -0x8000) >> 0x10);
    wVar11 = PA2;
    PA4 = (word)((uint)(iVar15 + (int)(short)wVar5 * -0x8000 + (int)(short)wVar8 * 0x8000 +
                        (int)(short)wVar6 * 0x4000 + (int)(short)wVar9 * -0x4000 +
                        (int)(short)wVar7 * -0x8000 + (int)(short)wVar10 * 0x8000) >> 0x10);
    PA4 = (word)((uint)(iVar15 + (int)(short)wVar5 * -0x8000 + (int)(short)wVar8 * 0x8000 +
                        (int)(short)wVar6 * -0x8000 + (int)(short)wVar9 * 0x8000 +
                        (int)(short)wVar7 * 0x4000 + (int)(short)wVar10 * -0x4000) >> 0x10);
    PA4 = (word)((uint)(iVar15 + (int)(short)wVar5 * -0x8000 + (int)(short)wVar8 * -0x8000 +
                        (int)(short)wVar6 * 0x8000 + (int)(short)wVar9 * 0x8000 +
                        (int)(short)wVar7 * -0x4000 + (int)(short)wVar10 * -0x4000) >> 0x10);
    wVar4 = PA1;
    PA4 = wVar12;
    wVar6 = PA2;
    wVar8 = PA4;
    wVar5 = PA1;
    wVar7 = PA2;
    iVar13 = (int)(short)wVar8 * (int)DAT_data_0042;
    DAT_data_0009 =
         (word)((uint)(iVar13 + (int)(short)wVar2 * 0x4000 + (int)(short)wVar11 * 0x4000 +
                       (int)(short)wVar4 * 0x8000 + (int)(short)wVar6 * 0x8000 +
                       (int)(short)wVar5 * 0x8000 + (int)(short)wVar7 * 0x8000) >> 0x10);
    DAT_data_000a =
         (word)((uint)(iVar13 + (int)(short)wVar2 * 0x8000 + (int)(short)wVar11 * 0x8000 +
                       (int)(short)wVar4 * 0x4000 + (int)(short)wVar6 * 0x4000 +
                       (int)(short)wVar5 * -0x8000 + (int)(short)wVar7 * -0x8000) >> 0x10);
    DAT_data_000b =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x4000 + (int)(short)wVar11 * 0x4000 +
                       (int)(short)wVar4 * 0x8000 + (int)(short)wVar6 * -0x8000 +
                       (int)(short)wVar5 * 0x8000 + (int)(short)wVar7 * -0x8000) >> 0x10);
    DAT_data_000c =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x8000 + (int)(short)wVar11 * 0x8000 +
                       (int)(short)wVar4 * 0x4000 + (int)(short)wVar6 * -0x4000 +
                       (int)(short)wVar5 * -0x8000 + (int)(short)wVar7 * 0x8000) >> 0x10);
    DAT_data_000d =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x8000 + (int)(short)wVar11 * 0x8000 +
                       (int)(short)wVar4 * -0x8000 + (int)(short)wVar6 * 0x8000 +
                       (int)(short)wVar5 * 0x4000 + (int)(short)wVar7 * -0x4000) >> 0x10);
    DAT_data_0005 = PA7;
    DAT_data_000e =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x8000 + (int)(short)wVar11 * -0x8000 +
                       (int)(short)wVar4 * 0x8000 + (int)(short)wVar6 * 0x8000 +
                       (int)(short)wVar5 * -0x4000 + (int)(short)wVar7 * -0x4000) >> 0x10);
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar4 = PA6;
      *(word *)(wVar2 & 0xff) = wVar4;
    }
    PA4 = DAT_data_0009;
    PA4 = DAT_data_000a;
    wVar2 = PA1;
    PA4 = DAT_data_000b;
    wVar6 = PA2;
    PA4 = DAT_data_000c;
    PA4 = DAT_data_000d;
    PA4 = DAT_data_000e;
    wVar4 = PA1;
    PA4 = DAT_data_0005;
    wVar7 = PA2;
    DAT_data_001d = PA4;
    wVar5 = PA1;
    wVar8 = PA2;
    iVar13 = (int)(short)DAT_data_001d * (int)DAT_data_0042;
    DAT_data_0009 =
         (word)((uint)(iVar13 + (int)(short)wVar2 * 0x4000 + (int)(short)wVar6 * 0x4000 +
                       (int)(short)wVar4 * 0x8000 + (int)(short)wVar7 * 0x8000 +
                       (int)(short)wVar5 * 0x8000 + (int)(short)wVar8 * 0x8000) >> 0x10);
    DAT_data_000a =
         (word)((uint)(iVar13 + (int)(short)wVar2 * 0x8000 + (int)(short)wVar6 * 0x8000 +
                       (int)(short)wVar4 * 0x4000 + (int)(short)wVar7 * 0x4000 +
                       (int)(short)wVar5 * -0x8000 + (int)(short)wVar8 * -0x8000) >> 0x10);
    DAT_data_000b =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x4000 + (int)(short)wVar6 * 0x4000 +
                       (int)(short)wVar4 * 0x8000 + (int)(short)wVar7 * -0x8000 +
                       (int)(short)wVar5 * 0x8000 + (int)(short)wVar8 * -0x8000) >> 0x10);
    DAT_data_000c =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x8000 + (int)(short)wVar6 * 0x8000 +
                       (int)(short)wVar4 * 0x4000 + (int)(short)wVar7 * -0x4000 +
                       (int)(short)wVar5 * -0x8000 + (int)(short)wVar8 * 0x8000) >> 0x10);
    DAT_data_000d =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x8000 + (int)(short)wVar6 * 0x8000 +
                       (int)(short)wVar4 * -0x8000 + (int)(short)wVar7 * 0x8000 +
                       (int)(short)wVar5 * 0x4000 + (int)(short)wVar8 * -0x4000) >> 0x10);
    DAT_data_0005 = PA7;
    DAT_data_000e =
         (word)((uint)(iVar13 + (int)(short)wVar2 * -0x8000 + (int)(short)wVar6 * -0x8000 +
                       (int)(short)wVar4 * 0x8000 + (int)(short)wVar7 * 0x8000 +
                       (int)(short)wVar5 * -0x4000 + (int)(short)wVar8 * -0x4000) >> 0x10);
  } while( true );
}


