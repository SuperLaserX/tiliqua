// 7A15_mod_factory_one_dsp6 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7A15_mod_factory_one_dsp6 (ucode_7A15_ROM3_0D20D.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  ushort uVar9;
  char cVar10;
  word wVar11;
  word wVar12;
  word wVar13;
  word wVar14;
  word wVar15;
  word wVar16;
  word wVar17;
  word wVar18;
  word wVar19;
  word wVar20;
  word wVar21;
  word wVar22;
  word wVar23;
  int iVar24;
  int iVar25;
  int iVar26;
  word wVar27;
  ushort uVar28;
  word *pwVar29;
  
  uVar28 = 0x8f;
  do {
    *(undefined2 *)(uVar28 & 0xff) = 0;
    uVar9 = uVar28 & 0x1ff;
    uVar28 = uVar28 - 1;
  } while (uVar9 != 0);
  pwVar29 = (word *)0x0;
  DAT_data_0007 = 1;
  DAT_data_0009 = 0x2000;
  DAT_data_0003 = -0x8000;
  DAT_data_0001 = 0;
  DAT_data_0002 = 0x7fff;
  DAT_data_007a = 0x3f;
  DAT_data_007b = 0xba9;
  DAT_data_007f = 0x100;
  do {
    cVar10 = bio_pin();
  } while (cVar10 != '\0');
  wVar11 = PA0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 == '\0');
  DAT_data_0029 = 0x1000;
  DAT_data_000d = 0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 != '\0');
  wVar11 = PA0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 == '\0');
  do {
    wVar11 = PA5;
    if ((wVar11 & DAT_data_0009) != 0) {
      wVar12 = PA6;
      *(word *)(wVar11 & 0xff) = wVar12;
    }
    DAT_data_000d = DAT_data_000d + 0x15;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
  } while (0 < DAT_data_000d);
  DAT_data_000d = 0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 != '\0');
  wVar11 = PA0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 == '\0');
  do {
    wVar11 = PA5;
    if ((wVar11 & DAT_data_0009) != 0) {
      wVar12 = PA6;
      *(word *)(wVar11 & 0xff) = wVar12;
    }
    DAT_data_000d = DAT_data_000d + 0x15;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
  } while (0 < DAT_data_000d);
  DAT_data_000d = 0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 != '\0');
  wVar11 = PA0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 == '\0');
  do {
    wVar11 = PA5;
    if ((wVar11 & DAT_data_0009) != 0) {
      wVar12 = PA6;
      *(word *)(wVar11 & 0xff) = wVar12;
    }
    iVar25 = CONCAT22(DAT_data_0005,DAT_data_0006);
    DAT_data_000d = DAT_data_000d + 0x15;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
    PA4 = DAT_data_0001;
  } while (0 < DAT_data_000d);
  DAT_data_000d = 0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 != '\0');
  wVar11 = PA0;
  do {
    cVar10 = bio_pin();
  } while (cVar10 == '\0');
  do {
    DAT_data_0005 = (word)((uint)iVar25 >> 0x10);
    DAT_data_0006 = (ushort)iVar25;
    wVar11 = PA5;
    wVar11 = PA6;
    *pwVar29 = wVar11;
    iVar25 = CONCAT22(DAT_data_0005,DAT_data_0006);
    if ((uint)DAT_data_004b == (int)(short)DAT_data_0007) {
      PA3 = DAT_data_0077;
    }
    iVar3 = (int)(short)DAT_data_0081;
    iVar5 = (int)(short)DAT_data_000b;
    iVar4 = (int)(short)DAT_data_0080;
    iVar6 = (int)(short)DAT_data_000c;
    iVar7 = (int)DAT_data_000d;
    iVar8 = (int)(short)DAT_data_0009;
    if (DAT_data_0073 == 0) {
      iVar24 = (int)(short)DAT_data_0078 * 0x8000 + (uint)DAT_data_0079 + (int)DAT_data_0070 * 0x10
               + (int)(short)((uint)((int)(short)DAT_data_002a * (int)DAT_data_0072 * 2) >> 0x10) *
                 0x10;
      DAT_data_0078 = (ushort)((uint)(iVar24 * 2) >> 0x10);
      DAT_data_0079 = (ushort)iVar24 & DAT_data_0002;
      uVar28 = (DAT_data_0078 & DAT_data_007a) + DAT_data_007b + DAT_data_0071;
      sVar2 = *(short *)(uVar28 & 0xfff);
      DAT_data_0004 =
           (word)((uint)((((int)sVar2 * 0x8000 - (int)(short)DAT_data_0079 * (int)sVar2) +
                         (int)(short)DAT_data_0079 * (int)*(short *)(uVar28 + DAT_data_0007 & 0xfff)
                         ) * 2) >> 0x10);
    }
    else if ((int)((uint)DAT_data_007e * 0x10000 + (uint)DAT_data_002b * -0x10000) < 1) {
      if ((uint)DAT_data_007c == 0) {
LAB_prog_09a8:
        iVar24 = (int)(short)DAT_data_0078 * 0x8000 + (uint)DAT_data_0079 +
                 (int)DAT_data_0070 * 0x10;
        DAT_data_0078 = (ushort)((uint)(iVar24 * 2) >> 0x10);
        DAT_data_0079 = (ushort)iVar24 & DAT_data_0002;
        if ((int)((uint)DAT_data_0078 - (uint)DAT_data_007a) < 0) {
LAB_prog_0a41:
          uVar28 = DAT_data_0078 + DAT_data_007b + DAT_data_0071;
          sVar2 = *(short *)(uVar28 & 0xfff);
          DAT_data_0004 =
               (word)((uint)((((int)sVar2 * 0x8000 - (int)(short)DAT_data_0079 * (int)sVar2) +
                             (int)(short)DAT_data_0079 *
                             (int)*(short *)(uVar28 + DAT_data_0007 & 0xfff)) * 2) >> 0x10);
        }
        else {
          DAT_data_0078 = DAT_data_007a;
          DAT_data_0004 = *(word *)(DAT_data_007a + DAT_data_007b + DAT_data_0071 & 0xfff);
          DAT_data_007c = 2;
        }
      }
      else {
        iVar24 = (uint)DAT_data_007c * 0x10000 + (uint)DAT_data_0007 * -0x10000;
        if (iVar24 == 0) {
          iVar24 = (int)(short)DAT_data_0078 * 0x8000 + (uint)DAT_data_0079 +
                   (int)DAT_data_0070 * -0x10;
          DAT_data_0078 = (ushort)((uint)(iVar24 * 2) >> 0x10);
          DAT_data_0079 = (ushort)iVar24 & DAT_data_0002;
          if (DAT_data_0078 != 0) goto LAB_prog_0a41;
          DAT_data_0078 = 0;
          DAT_data_0004 = *(word *)(DAT_data_007b + DAT_data_0071 & 0xfff);
          DAT_data_007c = 2;
        }
        else if (iVar24 + (uint)DAT_data_0007 * -0x10000 != 0) goto LAB_prog_09a8;
      }
    }
    else {
      if ((int)((uint)DAT_data_0073 - (uint)DAT_data_0007) < 1) {
        DAT_data_007c = 0;
        DAT_data_0078 = 0;
        DAT_data_0079 = 0;
      }
      else if (DAT_data_007d == 0) {
        DAT_data_007c = 1;
        DAT_data_007d = 1;
      }
      else {
        DAT_data_007c = 0;
        DAT_data_007d = 0;
      }
      DAT_data_002b = DAT_data_0002;
    }
    PA1 = DAT_data_0011;
    PA1 = DAT_data_001c;
    PA1 = DAT_data_0005;
    iVar24 = (uint)DAT_data_002a * 0x10000;
    if (iVar24 < 0) {
      iVar24 = (uint)DAT_data_002a * -0x10000;
    }
    iVar24 = iVar24 + (uint)DAT_data_007e * -0x10000;
    if (iVar24 < 0) {
      iVar24 = (uint)DAT_data_007e * 0x10000 +
               (int)DAT_data_007f * (int)(short)((uint)iVar24 >> 0x10);
      DAT_data_007e = (ushort)((uint)iVar24 >> 0x10);
    }
    else {
      iVar24 = (uint)DAT_data_002a * 0x10000;
      if (iVar24 < 0) {
        iVar24 = (uint)DAT_data_002a * -0x10000;
      }
      DAT_data_007e = (ushort)((uint)iVar24 >> 0x10);
    }
    wVar11 = PA1;
    wVar12 = PA1;
    wVar13 = PA1;
    if (iVar24 + (int)(short)DAT_data_0074 * -0x8000 < 0) {
      DAT_data_002b = DAT_data_0074;
    }
    DAT_data_0028 = DAT_data_0028 + DAT_data_0007 * -4;
    PA0 = DAT_data_0029;
    PA7 = DAT_data_0028;
    PA4 = wVar11;
    wVar11 = PA4;
    PA4 = DAT_data_0015;
    wVar11 = PA4;
    PA4 = DAT_data_0014;
    wVar11 = PA4;
    PA4 = DAT_data_0013;
    PA7 = DAT_data_0028 + DAT_data_0018;
    wVar14 = PA4;
    wVar15 = PA4;
    wVar16 = PA4;
    wVar17 = PA4;
    wVar18 = PA4;
    PA7 = DAT_data_0028 + DAT_data_0018 + DAT_data_001a;
    wVar19 = PA4;
    wVar20 = PA4;
    wVar21 = PA4;
    wVar22 = PA4;
    wVar23 = PA4;
    uVar28 = (ushort)((uint)((int)(short)DAT_data_0017 * (int)(short)DAT_data_0019 * 2) >> 0x10);
    uVar9 = (ushort)((uint)DAT_data_0019 * 0x10000 + (uint)uVar28 * -0x10000 >> 0x10);
    sVar2 = (short)((uint)DAT_data_0017 * 0x10000 + (uint)uVar28 * -0x10000 >> 0x10);
    sVar1 = (short)((uint)DAT_data_0002 * 0x10000 + (uint)DAT_data_0017 * -0x10000 +
                    (uint)uVar9 * -0x10000 >> 0x10);
    PA1 = DAT_data_0012;
    PA1 = DAT_data_001d;
    PA1 = DAT_data_0004;
    DAT_data_0013 = PA1;
    wVar11 = PA1;
    wVar27 = PA1;
    iVar24 = (uint)DAT_data_0075 * 0x10000 + (uint)DAT_data_0005 * -0x10000;
    if (iVar24 < 1) {
      if (iVar24 < 0) {
        iVar25 = (uint)DAT_data_0005 * 0x10000 + (uint)DAT_data_0006 + (int)DAT_data_0076 * -0x100;
        if ((int)(iVar25 + (uint)DAT_data_0075 * -0x10000) < 0) {
          iVar25 = CONCAT22(DAT_data_0075,(short)iVar25);
        }
      }
    }
    else {
      iVar25 = (uint)DAT_data_0005 * 0x10000 + (uint)DAT_data_0006 + (int)DAT_data_0076 * 0x100;
      if (0 < (int)(iVar25 + (uint)DAT_data_0075 * -0x10000)) {
        iVar25 = CONCAT22(DAT_data_0075,(short)iVar25);
      }
    }
    DAT_data_0077 = (word)((uint)DAT_data_0077 * 0x10000 + (uint)DAT_data_0007 * 0x10000 >> 0x10);
    DAT_data_0011 =
         (word)((uint)(((int)(short)wVar16 * (int)(short)uVar28 +
                        (int)(short)wVar15 * (int)(short)uVar9 + (int)(short)wVar21 * (int)sVar2 +
                       (int)(short)wVar20 * (int)sVar1) * 2) >> 0x10);
    DAT_data_0012 =
         (word)((uint)(((int)(short)wVar15 * (int)(short)uVar28 +
                        (int)(short)wVar14 * (int)(short)uVar9 + (int)(short)wVar20 * (int)sVar2 +
                       (int)(short)wVar19 * (int)sVar1) * 2) >> 0x10);
    if ((int)((uint)DAT_data_0025 * 0x10000 + (uint)DAT_data_0067 * -0x10000) < 1) {
      iVar24 = (uint)DAT_data_0025 * 0x10000 + (uint)DAT_data_006a * 0x10000;
      DAT_data_0027 = -DAT_data_006a;
    }
    else if ((int)((uint)DAT_data_0025 * 0x10000 + (uint)DAT_data_0068 * -0x10000) < 1) {
      iVar24 = CONCAT22(DAT_data_0025,
                        (short)((uint)DAT_data_0026 * 0x10000 + (uint)DAT_data_0069 * 0x10000 >>
                               0x10));
    }
    else {
      iVar24 = (uint)DAT_data_0025 * 0x10000 + (uint)DAT_data_006a * -0x10000;
      DAT_data_0027 = DAT_data_006a;
    }
    DAT_data_0025 = (word)((uint)iVar24 >> 0x10);
    DAT_data_0026 = (ushort)iVar24;
    if ((int)((uint)DAT_data_0018 * 0x10000 + (uint)DAT_data_0061 * -0x10000) < 1) {
      iVar26 = (uint)DAT_data_0018 * 0x10000 + (uint)DAT_data_0064 * 0x10000;
      DAT_data_001a = -DAT_data_0064;
    }
    else if ((int)((uint)DAT_data_0018 * 0x10000 + (uint)DAT_data_0062 * -0x10000) < 1) {
      iVar26 = CONCAT22(DAT_data_0018,
                        (short)((uint)DAT_data_0019 * 0x10000 + (uint)DAT_data_0063 * 0x10000 >>
                               0x10));
    }
    else {
      iVar26 = (uint)DAT_data_0018 * 0x10000 + (uint)DAT_data_0064 * -0x10000;
      DAT_data_001a = DAT_data_0064;
    }
    DAT_data_0018 = (ushort)((uint)iVar26 >> 0x10);
    DAT_data_0019 = (ushort)iVar26;
    PA1 = (word)((uint)(((int)(short)wVar18 * (int)(short)uVar28 +
                         (int)(short)wVar17 * (int)(short)uVar9 + (int)(short)wVar23 * (int)sVar2 +
                        (int)(short)wVar22 * (int)sVar1) * 2) >> 0x10);
    PA1 = (word)((uint)(((int)(short)DAT_data_0082 * (int)(short)DAT_data_000b +
                         (int)(short)DAT_data_0081 * (int)(short)DAT_data_000c +
                         (int)(short)*pwVar29 * (int)DAT_data_000d +
                        (int)*(short *)((ushort)(pwVar29 + -1) & 0xff) * (int)(short)DAT_data_0009)
                       * 2) >> 0x10);
    PA1 = DAT_data_0026;
    iVar26 = (uint)DAT_data_0017 +
             (int)(short)((uint)(((int)DAT_data_0060 * 0x8000 +
                                 (int)(short)wVar13 * (int)DAT_data_0065) * 2) >> 0x10) * 0x20 +
             (int)(short)DAT_data_0018 * 0x8000;
    DAT_data_0018 = (ushort)((uint)(iVar26 * 2) >> 0x10);
    DAT_data_0017 = (ushort)iVar26 & DAT_data_0002;
    DAT_data_0014 = PA1;
    wVar13 = PA1;
    DAT_data_002a = PA1;
    iVar26 = (uint)DAT_data_0024 +
             (int)(short)((uint)(((int)DAT_data_0066 * 0x8000 +
                                 (int)(short)wVar27 * (int)DAT_data_006b) * 2) >> 0x10) * 0x20 +
             (int)(short)DAT_data_0025 * 0x8000;
    DAT_data_0025 = (word)((uint)(iVar26 * 2) >> 0x10);
    DAT_data_0024 = (ushort)iVar26 & DAT_data_0002;
    wVar27 = DAT_data_0028 + DAT_data_0003 + DAT_data_0025;
    PA0 = DAT_data_0029;
    PA7 = DAT_data_0028 + DAT_data_0003;
    PA4 = wVar13;
    wVar13 = PA4;
    PA4 = wVar11;
    wVar11 = PA4;
    PA4 = wVar12;
    wVar11 = PA4;
    PA4 = DAT_data_0020;
    PA7 = wVar27;
    DAT_data_0080 = PA4;
    DAT_data_0081 = PA4;
    DAT_data_0082 = PA4;
    wVar11 = PA4;
    wVar12 = PA4;
    PA7 = wVar27 + DAT_data_0027;
    wVar13 = PA4;
    wVar13 = PA4;
    wVar13 = PA4;
    wVar27 = PA4;
    wVar14 = PA4;
    DAT_data_000b =
         (ushort)((uint)((int)(short)DAT_data_0024 * (int)(short)DAT_data_0026 * 2) >> 0x10);
    DAT_data_000c = (ushort)(iVar24 * 0x10000 + (uint)DAT_data_000b * -0x10000 >> 0x10);
    DAT_data_000d = (short)((uint)DAT_data_0024 * 0x10000 + (uint)DAT_data_000b * -0x10000 >> 0x10);
    DAT_data_0009 =
         (ushort)((uint)DAT_data_0002 * 0x10000 + (uint)DAT_data_0024 * -0x10000 +
                  (uint)DAT_data_000c * -0x10000 >> 0x10);
    PA1 = (word)((uint)(((int)(short)wVar17 * (int)(short)uVar28 +
                         (int)(short)wVar16 * (int)(short)uVar9 + (int)(short)wVar22 * (int)sVar2 +
                        (int)(short)wVar21 * (int)sVar1) * 2) >> 0x10);
    PA1 = (word)((uint)((iVar3 * iVar5 + iVar4 * iVar6 +
                         *(short *)((ushort)(pwVar29 + -1) & 0xff) * iVar7 +
                        *(short *)((ushort)(pwVar29 + -2) & 0xff) * iVar8) * 2) >> 0x10);
    PA1 = DAT_data_0025;
    DAT_data_001c =
         (word)((uint)(((int)(short)wVar12 * (int)(short)DAT_data_000b +
                        (int)(short)wVar11 * (int)(short)DAT_data_000c +
                        (int)(short)wVar14 * (int)DAT_data_000d +
                       (int)(short)wVar27 * (int)(short)DAT_data_0009) * 2) >> 0x10);
    pwVar29 = &DAT_data_0087;
    DAT_data_0015 = PA1;
    DAT_data_0020 = PA1;
    DAT_data_001d =
         (word)((uint)(((int)(short)wVar11 * (int)(short)DAT_data_000b +
                        (int)(short)DAT_data_0082 * (int)(short)DAT_data_000c +
                        (int)(short)wVar27 * (int)DAT_data_000d +
                       (int)(short)wVar13 * (int)(short)DAT_data_0009) * 2) >> 0x10);
  } while( true );
}


