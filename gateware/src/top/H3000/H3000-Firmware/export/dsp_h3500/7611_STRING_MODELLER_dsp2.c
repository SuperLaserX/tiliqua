// 7611_STRING_MODELLER_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7611_STRING_MODELLER_dsp2 (ucode_7611_ROM4_0F536.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  ushort uVar2;
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
  word wVar13;
  word wVar14;
  word wVar15;
  word in_T;
  ushort uVar16;
  
  uVar16 = 0x8f;
  do {
    *(undefined2 *)(uVar16 & 0xff) = 0;
    uVar2 = uVar16 & 0x1ff;
    uVar16 = uVar16 - 1;
  } while (uVar2 != 0);
  DAT_data_0065 = 1;
  DAT_data_0069 = 0x200;
  DAT_data_0068 = 0x8000;
  DAT_data_0064 = 0;
  DAT_data_0066 = 0xffff;
  DAT_data_006a = 0xff;
  DAT_data_0067 = 0x7fff;
  FUN_prog_0a3d();
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar4 = PA5;
    wVar5 = PA6;
    *(word *)(wVar4 & 0xff) = wVar5;
    iVar1 = (int)DAT_data_000e;
    wVar4 = PA1;
    PA7 = DAT_data_0044 + DAT_data_0015 + DAT_data_000f;
    wVar9 = PA4;
    PA7 = DAT_data_0044 + DAT_data_0015;
    PA4 = DAT_data_004e;
    PA7 = DAT_data_0058;
    wVar10 = PA4;
    PA7 = DAT_data_0059;
    PA4 = DAT_data_0057;
    PA7 = DAT_data_0062;
    PA4 = DAT_data_0060;
    PA7 = DAT_data_0061;
    wVar11 = PA4;
    PA2 = DAT_data_0048;
    wVar5 = PA1;
    wVar7 = PA3;
    if (DAT_data_000e < 1) {
      DAT_data_000e = 0;
    }
    else {
      DAT_data_000e = DAT_data_000e - DAT_data_0016;
    }
    wVar6 = PA1;
    PA7 = wVar4 + DAT_data_0015 + DAT_data_000f;
    wVar12 = PA4;
    PA7 = wVar4 + DAT_data_0015;
    PA4 = (word)((uint)DAT_data_0046 + (short)in_T * iVar1 +
                 (int)(short)DAT_data_004d * (int)DAT_data_0014 +
                 (int)(short)DAT_data_004c * (int)DAT_data_0013 +
                 (int)(short)DAT_data_004b * (int)DAT_data_0012 +
                 (int)(short)DAT_data_004a * (int)DAT_data_0011 +
                 (int)(short)wVar9 * (int)DAT_data_0010 >> 0x10);
    PA7 = wVar4 + DAT_data_001e + DAT_data_0018;
    wVar13 = PA4;
    PA7 = wVar4 + DAT_data_001e;
    PA4 = (word)((uint)wVar7 + (int)(short)wVar5 * (int)DAT_data_0017 +
                 (int)(short)DAT_data_0056 * (int)DAT_data_001d +
                 (int)(short)DAT_data_0055 * (int)DAT_data_001c +
                 (int)(short)DAT_data_0054 * (int)DAT_data_001b +
                 (int)(short)DAT_data_0053 * (int)DAT_data_001a +
                 (int)(short)wVar10 * (int)DAT_data_0019 >> 0x10);
    PA7 = wVar4 + DAT_data_0027;
    PA4 = (word)((uint)wVar7 + (int)(short)wVar5 * (int)DAT_data_0020 +
                 (int)(short)DAT_data_005f * (int)DAT_data_0026 +
                 (int)(short)DAT_data_005e * (int)DAT_data_0025 +
                 (int)(short)DAT_data_005d * (int)DAT_data_0024 +
                 (int)(short)DAT_data_005c * (int)DAT_data_0023 +
                 (int)(short)wVar11 * (int)DAT_data_0022 >> 0x10);
    PA7 = wVar4 + DAT_data_0027 + DAT_data_0021;
    wVar14 = PA4;
    PA2 = (word)((uint)wVar9 * 0x10000 + (uint)wVar10 * 0x10000 + (uint)wVar11 * 0x10000 >> 0x10);
    wVar4 = PA1;
    wVar8 = PA3;
    iVar1 = (int)DAT_data_0017;
    if (DAT_data_0017 < 1) {
      DAT_data_0017 = 0;
    }
    else {
      DAT_data_0017 = DAT_data_0017 - DAT_data_001f;
    }
    DAT_data_0044 = PA1;
    PA7 = wVar6 + DAT_data_0015 + DAT_data_000f;
    wVar15 = PA4;
    PA7 = wVar6 + DAT_data_0015;
    PA4 = (word)((uint)wVar7 + (int)(short)wVar5 * (int)DAT_data_000e +
                 (int)(short)DAT_data_004c * (int)DAT_data_0014 +
                 (int)(short)DAT_data_004b * (int)DAT_data_0013 +
                 (int)(short)DAT_data_004a * (int)DAT_data_0012 +
                 (int)(short)wVar9 * (int)DAT_data_0011 + (int)(short)wVar12 * (int)DAT_data_0010 >>
                0x10);
    PA7 = wVar6 + DAT_data_001e + DAT_data_0018;
    wVar7 = PA4;
    PA7 = wVar6 + DAT_data_001e;
    PA4 = (word)((uint)wVar8 + (short)wVar4 * iVar1 + (int)(short)DAT_data_0055 * (int)DAT_data_001d
                 + (int)(short)DAT_data_0054 * (int)DAT_data_001c +
                 (int)(short)DAT_data_0053 * (int)DAT_data_001b +
                 (int)(short)wVar10 * (int)DAT_data_001a + (int)(short)wVar13 * (int)DAT_data_0019
                >> 0x10);
    PA7 = wVar6 + DAT_data_0027;
    PA4 = (word)((uint)wVar8 + (int)(short)wVar4 * (int)DAT_data_0020 +
                 (int)(short)DAT_data_005e * (int)DAT_data_0026 +
                 (int)(short)DAT_data_005d * (int)DAT_data_0025 +
                 (int)(short)DAT_data_005c * (int)DAT_data_0024 +
                 (int)(short)wVar11 * (int)DAT_data_0023 + (int)(short)wVar14 * (int)DAT_data_0022
                >> 0x10);
    PA7 = wVar6 + DAT_data_0027 + DAT_data_0021;
    wVar6 = PA4;
    PA2 = (word)((uint)wVar12 * 0x10000 + (uint)wVar13 * 0x10000 + (uint)wVar14 * 0x10000 >> 0x10);
    wVar5 = PA1;
    DAT_data_0046 = PA3;
    DAT_data_004d = DAT_data_004a;
    DAT_data_004e =
         (word)((uint)wVar8 + (int)(short)wVar4 * (int)DAT_data_000e +
                (int)(short)DAT_data_004b * (int)DAT_data_0014 +
                (int)(short)DAT_data_004a * (int)DAT_data_0013 +
                (int)(short)wVar9 * (int)DAT_data_0012 + (int)(short)wVar12 * (int)DAT_data_0011 +
                (int)(short)wVar15 * (int)DAT_data_0010 >> 0x10);
    DAT_data_0059 = DAT_data_0044 + DAT_data_001e;
    DAT_data_0058 = DAT_data_0059 + DAT_data_0018;
    DAT_data_0056 = DAT_data_0053;
    DAT_data_0057 =
         (word)((uint)DAT_data_0046 + (int)(short)wVar5 * (int)DAT_data_0017 +
                (int)(short)DAT_data_0054 * (int)DAT_data_001d +
                (int)(short)DAT_data_0053 * (int)DAT_data_001c +
                (int)(short)wVar10 * (int)DAT_data_001b + (int)(short)wVar13 * (int)DAT_data_001a +
                (int)(short)wVar7 * (int)DAT_data_0019 >> 0x10);
    DAT_data_0062 = DAT_data_0044 + DAT_data_0027;
    DAT_data_0061 = DAT_data_0062 + DAT_data_0021;
    DAT_data_005f = DAT_data_005c;
    DAT_data_0060 =
         (word)((uint)DAT_data_0046 + (int)(short)wVar5 * (int)DAT_data_0020 +
                (int)(short)DAT_data_005d * (int)DAT_data_0026 +
                (int)(short)DAT_data_005c * (int)DAT_data_0025 +
                (int)(short)wVar11 * (int)DAT_data_0024 + (int)(short)wVar14 * (int)DAT_data_0023 +
                (int)(short)wVar6 * (int)DAT_data_0022 >> 0x10);
    DAT_data_0048 =
         (word)((uint)wVar15 * 0x10000 + (uint)wVar7 * 0x10000 + (uint)wVar6 * 0x10000 >> 0x10);
    wVar4 = PA5;
    wVar8 = PA6;
    DAT_data_004a = wVar15;
    DAT_data_004b = wVar12;
    DAT_data_004c = wVar9;
    DAT_data_0053 = wVar7;
    DAT_data_0054 = wVar13;
    DAT_data_0055 = wVar10;
    DAT_data_005c = wVar6;
    DAT_data_005d = wVar14;
    DAT_data_005e = wVar11;
    *(word *)(wVar4 & 0xff) = wVar8;
    wVar4 = PA1;
    PA7 = DAT_data_0044 + DAT_data_0015 + DAT_data_000f;
    wVar10 = PA4;
    PA7 = DAT_data_0044 + DAT_data_0015;
    PA4 = DAT_data_004e;
    PA7 = DAT_data_0058;
    wVar11 = PA4;
    PA7 = DAT_data_0059;
    PA4 = DAT_data_0057;
    PA7 = DAT_data_0062;
    PA4 = DAT_data_0060;
    PA7 = DAT_data_0061;
    wVar6 = PA4;
    PA2 = DAT_data_0048;
    wVar7 = PA1;
    wVar9 = PA3;
    iVar1 = (int)DAT_data_0020;
    if (DAT_data_0020 < 1) {
      DAT_data_0020 = 0;
    }
    else {
      DAT_data_0020 = DAT_data_0020 - DAT_data_0028;
    }
    wVar8 = PA1;
    PA7 = wVar4 + DAT_data_0015 + DAT_data_000f;
    wVar12 = PA4;
    PA7 = wVar4 + DAT_data_0015;
    PA4 = (word)((uint)DAT_data_0046 + (int)(short)wVar5 * (int)DAT_data_000e +
                 (int)(short)DAT_data_004d * (int)DAT_data_0014 +
                 (int)(short)DAT_data_004c * (int)DAT_data_0013 +
                 (int)(short)DAT_data_004b * (int)DAT_data_0012 +
                 (int)(short)DAT_data_004a * (int)DAT_data_0011 +
                 (int)(short)wVar10 * (int)DAT_data_0010 >> 0x10);
    PA7 = wVar4 + DAT_data_001e + DAT_data_0018;
    wVar13 = PA4;
    PA7 = wVar4 + DAT_data_001e;
    PA4 = (word)((uint)wVar9 + (int)(short)wVar7 * (int)DAT_data_0017 +
                 (int)(short)DAT_data_0056 * (int)DAT_data_001d +
                 (int)(short)DAT_data_0055 * (int)DAT_data_001c +
                 (int)(short)DAT_data_0054 * (int)DAT_data_001b +
                 (int)(short)DAT_data_0053 * (int)DAT_data_001a +
                 (int)(short)wVar11 * (int)DAT_data_0019 >> 0x10);
    PA7 = wVar4 + DAT_data_0027;
    PA4 = (word)((uint)wVar9 + (short)wVar7 * iVar1 + (int)(short)DAT_data_005f * (int)DAT_data_0026
                 + (int)(short)DAT_data_005e * (int)DAT_data_0025 +
                 (int)(short)DAT_data_005d * (int)DAT_data_0024 +
                 (int)(short)DAT_data_005c * (int)DAT_data_0023 +
                 (int)(short)wVar6 * (int)DAT_data_0022 >> 0x10);
    PA7 = wVar4 + DAT_data_0027 + DAT_data_0021;
    wVar14 = PA4;
    PA2 = (word)((uint)wVar10 * 0x10000 + (uint)wVar11 * 0x10000 + (uint)wVar6 * 0x10000 >> 0x10);
    wVar4 = PA1;
    wVar5 = PA3;
    DAT_data_0044 = PA1;
    PA7 = wVar8 + DAT_data_0015 + DAT_data_000f;
    wVar15 = PA4;
    PA7 = wVar8 + DAT_data_0015;
    PA4 = (word)((uint)wVar9 + (int)(short)wVar7 * (int)DAT_data_000e +
                 (int)(short)DAT_data_004c * (int)DAT_data_0014 +
                 (int)(short)DAT_data_004b * (int)DAT_data_0013 +
                 (int)(short)DAT_data_004a * (int)DAT_data_0012 +
                 (int)(short)wVar10 * (int)DAT_data_0011 + (int)(short)wVar12 * (int)DAT_data_0010
                >> 0x10);
    PA7 = wVar8 + DAT_data_001e + DAT_data_0018;
    wVar7 = PA4;
    PA7 = wVar8 + DAT_data_001e;
    PA4 = (word)((uint)wVar5 + (int)(short)wVar4 * (int)DAT_data_0017 +
                 (int)(short)DAT_data_0055 * (int)DAT_data_001d +
                 (int)(short)DAT_data_0054 * (int)DAT_data_001c +
                 (int)(short)DAT_data_0053 * (int)DAT_data_001b +
                 (int)(short)wVar11 * (int)DAT_data_001a + (int)(short)wVar13 * (int)DAT_data_0019
                >> 0x10);
    PA7 = wVar8 + DAT_data_0027;
    PA4 = (word)((uint)wVar5 + (int)(short)wVar4 * (int)DAT_data_0020 +
                 (int)(short)DAT_data_005e * (int)DAT_data_0026 +
                 (int)(short)DAT_data_005d * (int)DAT_data_0025 +
                 (int)(short)DAT_data_005c * (int)DAT_data_0024 +
                 (int)(short)wVar6 * (int)DAT_data_0023 + (int)(short)wVar14 * (int)DAT_data_0022 >>
                0x10);
    PA7 = wVar8 + DAT_data_0027 + DAT_data_0021;
    wVar9 = PA4;
    PA2 = (word)((uint)wVar12 * 0x10000 + (uint)wVar13 * 0x10000 + (uint)wVar14 * 0x10000 >> 0x10);
    in_T = PA1;
    DAT_data_0046 = PA3;
    DAT_data_004d = DAT_data_004a;
    DAT_data_004e =
         (word)((uint)wVar5 + (int)(short)wVar4 * (int)DAT_data_000e +
                (int)(short)DAT_data_004b * (int)DAT_data_0014 +
                (int)(short)DAT_data_004a * (int)DAT_data_0013 +
                (int)(short)wVar10 * (int)DAT_data_0012 + (int)(short)wVar12 * (int)DAT_data_0011 +
                (int)(short)wVar15 * (int)DAT_data_0010 >> 0x10);
    DAT_data_0059 = DAT_data_0044 + DAT_data_001e;
    DAT_data_0058 = DAT_data_0059 + DAT_data_0018;
    DAT_data_0056 = DAT_data_0053;
    DAT_data_0057 =
         (word)((uint)DAT_data_0046 + (int)(short)in_T * (int)DAT_data_0017 +
                (int)(short)DAT_data_0054 * (int)DAT_data_001d +
                (int)(short)DAT_data_0053 * (int)DAT_data_001c +
                (int)(short)wVar11 * (int)DAT_data_001b + (int)(short)wVar13 * (int)DAT_data_001a +
                (int)(short)wVar7 * (int)DAT_data_0019 >> 0x10);
    DAT_data_0062 = DAT_data_0044 + DAT_data_0027;
    DAT_data_0061 = DAT_data_0062 + DAT_data_0021;
    DAT_data_005f = DAT_data_005c;
    DAT_data_0060 =
         (word)((uint)DAT_data_0046 + (int)(short)in_T * (int)DAT_data_0020 +
                (int)(short)DAT_data_005d * (int)DAT_data_0026 +
                (int)(short)DAT_data_005c * (int)DAT_data_0025 +
                (int)(short)wVar6 * (int)DAT_data_0024 + (int)(short)wVar14 * (int)DAT_data_0023 +
                (int)(short)wVar9 * (int)DAT_data_0022 >> 0x10);
    DAT_data_0048 =
         (word)((uint)wVar15 * 0x10000 + (uint)wVar7 * 0x10000 + (uint)wVar9 * 0x10000 >> 0x10);
    DAT_data_004a = wVar15;
    DAT_data_004b = wVar12;
    DAT_data_004c = wVar10;
    DAT_data_0053 = wVar7;
    DAT_data_0054 = wVar13;
    DAT_data_0055 = wVar11;
    DAT_data_005c = wVar9;
    DAT_data_005d = wVar14;
    DAT_data_005e = wVar6;
  } while( true );
}


// ===== FUN_prog_0a3d @ prog:0a3d =====

void FUN_prog_0a3d(void)

{
  char cVar1;
  word wVar2;
  ushort in_AR0;
  
  DAT_data_006b = DAT_data_0067;
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
    PA7 = DAT_data_006b + DAT_data_0065;
    wVar2 = DAT_data_006b + DAT_data_0065 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    DAT_data_006b = wVar2 + DAT_data_0065;
    PA7 = DAT_data_006b;
  } while ((short)DAT_data_006b < 0);
  return;
}


