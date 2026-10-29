// 7612_STRING_MODELLER_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7612_STRING_MODELLER_dsp3 (ucode_7612_ROM4_0FA78.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  ushort uVar5;
  char cVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar10;
  word wVar11;
  word wVar12;
  word wVar13;
  word wVar14;
  word wVar15;
  word wVar16;
  word wVar17;
  word wVar18;
  word in_T;
  ushort uVar19;
  
  uVar19 = 0x8f;
  do {
    *(undefined2 *)(uVar19 & 0xff) = 0;
    uVar5 = uVar19 & 0x1ff;
    uVar19 = uVar19 - 1;
  } while (uVar5 != 0);
  DAT_data_0065 = 1;
  DAT_data_0069 = 0x400;
  DAT_data_0068 = 0x8000;
  DAT_data_0064 = 0;
  DAT_data_0066 = 0xffff;
  DAT_data_006a = 0xff;
  DAT_data_0067 = 0x7fff;
  FUN_prog_0a3d();
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  wVar7 = PA0;
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  do {
    wVar7 = PA5;
    wVar8 = PA6;
    *(word *)(wVar7 & 0xff) = wVar8;
    wVar7 = PA1;
    wVar12 = PA3;
    wVar8 = PA1;
    PA7 = DAT_data_0044 + DAT_data_0030 + DAT_data_002a;
    wVar14 = PA4;
    PA7 = DAT_data_0044 + DAT_data_0030;
    PA4 = (word)((uint)DAT_data_0046 + (int)(short)in_T * (int)DAT_data_0029 +
                 (int)(short)DAT_data_004d * (int)DAT_data_002f +
                 (int)(short)DAT_data_004c * (int)DAT_data_002e +
                 (int)(short)DAT_data_004b * (int)DAT_data_002d +
                 (int)(short)DAT_data_004a * (int)DAT_data_002c +
                 (int)(short)DAT_data_0049 * (int)DAT_data_002b >> 0x10);
    PA7 = wVar7 + DAT_data_0039 + DAT_data_0033;
    wVar15 = PA4;
    PA7 = wVar7 + DAT_data_0039;
    PA4 = (word)((uint)DAT_data_0046 + (int)(short)DAT_data_0045 * (int)DAT_data_0032 +
                 (int)(short)DAT_data_0056 * (int)DAT_data_0038 +
                 (int)(short)DAT_data_0055 * (int)DAT_data_0037 +
                 (int)(short)DAT_data_0054 * (int)DAT_data_0036 +
                 (int)(short)DAT_data_0053 * (int)DAT_data_0035 +
                 (int)(short)DAT_data_0052 * (int)DAT_data_0034 >> 0x10);
    PA7 = wVar7 + DAT_data_0042 + DAT_data_003c;
    wVar16 = PA4;
    PA7 = wVar7 + DAT_data_0042;
    PA4 = DAT_data_0060;
    PA2 = (word)((uint)wVar14 * 0x10000 + (uint)wVar15 * 0x10000 + (uint)wVar16 * 0x10000 >> 0x10);
    if (DAT_data_0029 < 1) {
      DAT_data_0029 = 0;
    }
    else {
      DAT_data_0029 = DAT_data_0029 - DAT_data_0031;
    }
    wVar9 = PA1;
    iVar1 = (int)(short)DAT_data_005c;
    wVar13 = PA3;
    wVar10 = PA1;
    PA7 = wVar7 + DAT_data_0030 + DAT_data_002a;
    wVar17 = PA4;
    PA7 = wVar7 + DAT_data_0030;
    PA4 = (word)((uint)wVar12 + (int)(short)wVar8 * (int)DAT_data_0029 +
                 (int)(short)DAT_data_004c * (int)DAT_data_002f +
                 (int)(short)DAT_data_004b * (int)DAT_data_002e +
                 (int)(short)DAT_data_004a * (int)DAT_data_002d +
                 (int)(short)DAT_data_0049 * (int)DAT_data_002c +
                 (int)(short)wVar14 * (int)DAT_data_002b >> 0x10);
    PA7 = wVar9 + DAT_data_0039 + DAT_data_0033;
    wVar7 = PA4;
    PA7 = wVar9 + DAT_data_0039;
    PA4 = (word)((uint)wVar12 + (int)(short)wVar8 * (int)DAT_data_0032 +
                 (int)(short)DAT_data_0055 * (int)DAT_data_0038 +
                 (int)(short)DAT_data_0054 * (int)DAT_data_0037 +
                 (int)(short)DAT_data_0053 * (int)DAT_data_0036 +
                 (int)(short)DAT_data_0052 * (int)DAT_data_0035 +
                 (int)(short)wVar15 * (int)DAT_data_0034 >> 0x10);
    PA7 = wVar9 + DAT_data_0042 + DAT_data_003c;
    wVar18 = PA4;
    PA7 = wVar9 + DAT_data_0042;
    PA4 = (word)((uint)DAT_data_0046 + (int)(short)DAT_data_0045 * (int)DAT_data_003b +
                 (int)(short)DAT_data_005f * (int)DAT_data_0041 +
                 (int)(short)DAT_data_005e * (int)DAT_data_0040 +
                 (int)(short)DAT_data_005d * (int)DAT_data_003f +
                 (int)(short)DAT_data_005c * (int)DAT_data_003e +
                 (int)(short)wVar16 * (int)DAT_data_003d >> 0x10);
    PA2 = (word)((uint)wVar17 * 0x10000 + (uint)wVar7 * 0x10000 + (uint)wVar18 * 0x10000 >> 0x10);
    if (DAT_data_0032 < 1) {
      DAT_data_0032 = 0;
    }
    else {
      DAT_data_0032 = DAT_data_0032 - DAT_data_003a;
    }
    DAT_data_0044 = PA1;
    DAT_data_004d = DAT_data_004a;
    DAT_data_004c = DAT_data_0049;
    iVar2 = (int)(short)DAT_data_0049;
    DAT_data_0056 = DAT_data_0053;
    DAT_data_0055 = DAT_data_0052;
    iVar3 = (int)(short)DAT_data_0052;
    DAT_data_005f = DAT_data_005c;
    iVar4 = (int)(short)DAT_data_005c;
    DAT_data_0046 = PA3;
    wVar11 = PA1;
    PA7 = wVar9 + DAT_data_0030 + DAT_data_002a;
    DAT_data_0049 = PA4;
    PA7 = wVar9 + DAT_data_0030;
    PA4 = (word)((uint)wVar13 + (int)(short)wVar10 * (int)DAT_data_0029 +
                 (int)(short)DAT_data_004b * (int)DAT_data_002f +
                 (int)(short)DAT_data_004a * (int)DAT_data_002e + iVar2 * DAT_data_002d +
                 (int)(short)wVar14 * (int)DAT_data_002c + (int)(short)wVar17 * (int)DAT_data_002b
                >> 0x10);
    PA7 = DAT_data_0044 + DAT_data_0039 + DAT_data_0033;
    DAT_data_0052 = PA4;
    PA7 = DAT_data_0044 + DAT_data_0039;
    PA4 = (word)((uint)wVar13 + (int)(short)wVar10 * (int)DAT_data_0032 +
                 (int)(short)DAT_data_0054 * (int)DAT_data_0038 +
                 (int)(short)DAT_data_0053 * (int)DAT_data_0037 + iVar3 * DAT_data_0036 +
                 (int)(short)wVar15 * (int)DAT_data_0035 + (int)(short)wVar7 * (int)DAT_data_0034 >>
                0x10);
    PA7 = DAT_data_0044 + DAT_data_0042 + DAT_data_003c;
    DAT_data_005c = PA4;
    PA7 = DAT_data_0044 + DAT_data_0042;
    PA4 = (word)((uint)wVar12 + (int)(short)wVar8 * (int)DAT_data_003b +
                 (int)(short)DAT_data_005e * (int)DAT_data_0041 +
                 (int)(short)DAT_data_005d * (int)DAT_data_0040 + iVar1 * DAT_data_003f +
                 (int)(short)wVar16 * (int)DAT_data_003e + (int)(short)wVar18 * (int)DAT_data_003d
                >> 0x10);
    DAT_data_0060 =
         (word)((uint)wVar13 + (int)(short)wVar10 * (int)DAT_data_003b +
                (int)(short)DAT_data_005d * (int)DAT_data_0041 + iVar4 * DAT_data_0040 +
                (int)(short)wVar16 * (int)DAT_data_003f + (int)(short)wVar18 * (int)DAT_data_003e +
                (int)(short)DAT_data_005c * (int)DAT_data_003d >> 0x10);
    PA2 = (word)((uint)DAT_data_0049 * 0x10000 + (uint)DAT_data_0052 * 0x10000 +
                 (uint)DAT_data_005c * 0x10000 >> 0x10);
    wVar8 = PA5;
    wVar12 = PA6;
    DAT_data_0045 = wVar11;
    DAT_data_004a = wVar17;
    DAT_data_004b = wVar14;
    DAT_data_0053 = wVar7;
    DAT_data_0054 = wVar15;
    DAT_data_005d = wVar18;
    DAT_data_005e = wVar16;
    *(word *)(wVar8 & 0xff) = wVar12;
    wVar7 = PA1;
    iVar1 = (int)DAT_data_003b;
    wVar12 = PA3;
    wVar8 = PA1;
    PA7 = DAT_data_0044 + DAT_data_0030 + DAT_data_002a;
    wVar14 = PA4;
    PA7 = DAT_data_0044 + DAT_data_0030;
    PA4 = (word)((uint)DAT_data_0046 + (int)(short)wVar11 * (int)DAT_data_0029 +
                 (int)(short)DAT_data_004d * (int)DAT_data_002f +
                 (int)(short)DAT_data_004c * (int)DAT_data_002e +
                 (int)(short)DAT_data_004b * (int)DAT_data_002d +
                 (int)(short)DAT_data_004a * (int)DAT_data_002c +
                 (int)(short)DAT_data_0049 * (int)DAT_data_002b >> 0x10);
    PA7 = wVar7 + DAT_data_0039 + DAT_data_0033;
    wVar15 = PA4;
    PA7 = wVar7 + DAT_data_0039;
    PA4 = (word)((uint)DAT_data_0046 + (int)(short)DAT_data_0045 * (int)DAT_data_0032 +
                 (int)(short)DAT_data_0056 * (int)DAT_data_0038 +
                 (int)(short)DAT_data_0055 * (int)DAT_data_0037 +
                 (int)(short)DAT_data_0054 * (int)DAT_data_0036 +
                 (int)(short)DAT_data_0053 * (int)DAT_data_0035 +
                 (int)(short)DAT_data_0052 * (int)DAT_data_0034 >> 0x10);
    PA7 = wVar7 + DAT_data_0042 + DAT_data_003c;
    wVar16 = PA4;
    PA7 = wVar7 + DAT_data_0042;
    PA4 = DAT_data_0060;
    PA2 = (word)((uint)wVar14 * 0x10000 + (uint)wVar15 * 0x10000 + (uint)wVar16 * 0x10000 >> 0x10);
    if (DAT_data_003b < 1) {
      DAT_data_003b = 0;
    }
    else {
      DAT_data_003b = DAT_data_003b - DAT_data_0043;
    }
    wVar9 = PA1;
    iVar2 = (int)(short)DAT_data_005c;
    wVar13 = PA3;
    wVar10 = PA1;
    PA7 = wVar7 + DAT_data_0030 + DAT_data_002a;
    wVar17 = PA4;
    PA7 = wVar7 + DAT_data_0030;
    PA4 = (word)((uint)wVar12 + (int)(short)wVar8 * (int)DAT_data_0029 +
                 (int)(short)DAT_data_004c * (int)DAT_data_002f +
                 (int)(short)DAT_data_004b * (int)DAT_data_002e +
                 (int)(short)DAT_data_004a * (int)DAT_data_002d +
                 (int)(short)DAT_data_0049 * (int)DAT_data_002c +
                 (int)(short)wVar14 * (int)DAT_data_002b >> 0x10);
    PA7 = wVar9 + DAT_data_0039 + DAT_data_0033;
    wVar7 = PA4;
    PA7 = wVar9 + DAT_data_0039;
    PA4 = (word)((uint)wVar12 + (int)(short)wVar8 * (int)DAT_data_0032 +
                 (int)(short)DAT_data_0055 * (int)DAT_data_0038 +
                 (int)(short)DAT_data_0054 * (int)DAT_data_0037 +
                 (int)(short)DAT_data_0053 * (int)DAT_data_0036 +
                 (int)(short)DAT_data_0052 * (int)DAT_data_0035 +
                 (int)(short)wVar15 * (int)DAT_data_0034 >> 0x10);
    PA7 = wVar9 + DAT_data_0042 + DAT_data_003c;
    wVar18 = PA4;
    PA7 = wVar9 + DAT_data_0042;
    PA4 = (word)((uint)DAT_data_0046 + (short)DAT_data_0045 * iVar1 +
                 (int)(short)DAT_data_005f * (int)DAT_data_0041 +
                 (int)(short)DAT_data_005e * (int)DAT_data_0040 +
                 (int)(short)DAT_data_005d * (int)DAT_data_003f +
                 (int)(short)DAT_data_005c * (int)DAT_data_003e +
                 (int)(short)wVar16 * (int)DAT_data_003d >> 0x10);
    PA2 = (word)((uint)wVar17 * 0x10000 + (uint)wVar7 * 0x10000 + (uint)wVar18 * 0x10000 >> 0x10);
    DAT_data_0044 = PA1;
    DAT_data_004d = DAT_data_004a;
    DAT_data_004c = DAT_data_0049;
    iVar1 = (int)(short)DAT_data_0049;
    DAT_data_0056 = DAT_data_0053;
    DAT_data_0055 = DAT_data_0052;
    iVar3 = (int)(short)DAT_data_0052;
    DAT_data_005f = DAT_data_005c;
    iVar4 = (int)(short)DAT_data_005c;
    DAT_data_0046 = PA3;
    in_T = PA1;
    PA7 = wVar9 + DAT_data_0030 + DAT_data_002a;
    DAT_data_0049 = PA4;
    PA7 = wVar9 + DAT_data_0030;
    PA4 = (word)((uint)wVar13 + (int)(short)wVar10 * (int)DAT_data_0029 +
                 (int)(short)DAT_data_004b * (int)DAT_data_002f +
                 (int)(short)DAT_data_004a * (int)DAT_data_002e + iVar1 * DAT_data_002d +
                 (int)(short)wVar14 * (int)DAT_data_002c + (int)(short)wVar17 * (int)DAT_data_002b
                >> 0x10);
    PA7 = DAT_data_0044 + DAT_data_0039 + DAT_data_0033;
    DAT_data_0052 = PA4;
    PA7 = DAT_data_0044 + DAT_data_0039;
    PA4 = (word)((uint)wVar13 + (int)(short)wVar10 * (int)DAT_data_0032 +
                 (int)(short)DAT_data_0054 * (int)DAT_data_0038 +
                 (int)(short)DAT_data_0053 * (int)DAT_data_0037 + iVar3 * DAT_data_0036 +
                 (int)(short)wVar15 * (int)DAT_data_0035 + (int)(short)wVar7 * (int)DAT_data_0034 >>
                0x10);
    PA7 = DAT_data_0044 + DAT_data_0042 + DAT_data_003c;
    DAT_data_005c = PA4;
    PA7 = DAT_data_0044 + DAT_data_0042;
    PA4 = (word)((uint)wVar12 + (int)(short)wVar8 * (int)DAT_data_003b +
                 (int)(short)DAT_data_005e * (int)DAT_data_0041 +
                 (int)(short)DAT_data_005d * (int)DAT_data_0040 + iVar2 * DAT_data_003f +
                 (int)(short)wVar16 * (int)DAT_data_003e + (int)(short)wVar18 * (int)DAT_data_003d
                >> 0x10);
    DAT_data_0060 =
         (word)((uint)wVar13 + (int)(short)wVar10 * (int)DAT_data_003b +
                (int)(short)DAT_data_005d * (int)DAT_data_0041 + iVar4 * DAT_data_0040 +
                (int)(short)wVar16 * (int)DAT_data_003f + (int)(short)wVar18 * (int)DAT_data_003e +
                (int)(short)DAT_data_005c * (int)DAT_data_003d >> 0x10);
    PA2 = (word)((uint)DAT_data_0049 * 0x10000 + (uint)DAT_data_0052 * 0x10000 +
                 (uint)DAT_data_005c * 0x10000 >> 0x10);
    DAT_data_0045 = in_T;
    DAT_data_004a = wVar17;
    DAT_data_004b = wVar14;
    DAT_data_0053 = wVar7;
    DAT_data_0054 = wVar15;
    DAT_data_005d = wVar18;
    DAT_data_005e = wVar16;
  } while( true );
}


// ===== FUN_prog_0a3d @ prog:0a3d =====

void FUN_prog_0a3d(void)

{
  char cVar1;
  word wVar2;
  ushort in_AR0;
  
  DAT_data_006b = 0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    DAT_data_006a = PA5;
    wVar2 = PA6;
    *(word *)(in_AR0 & 0xff) = wVar2;
    DAT_data_006b = DAT_data_006b + 0x15;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
  } while (0 < DAT_data_006b);
  return;
}


