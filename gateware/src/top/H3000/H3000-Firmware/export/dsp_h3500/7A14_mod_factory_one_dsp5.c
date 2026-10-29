// 7A14_mod_factory_one_dsp5 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7A14_mod_factory_one_dsp5 (ucode_7A14_ROM3_0C793.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  word wVar1;
  word wVar2;
  word wVar3;
  short sVar4;
  char cVar5;
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
  word wVar19;
  uint uVar16;
  int iVar17;
  uint uVar18;
  ushort uVar20;
  ushort uVar21;
  
  uVar21 = 0x8f;
  do {
    *(undefined2 *)(uVar21 & 0xff) = 0;
    uVar20 = uVar21 & 0x1ff;
    uVar21 = uVar21 - 1;
  } while (uVar20 != 0);
  DAT_data_0006 = 1;
  DAT_data_0002 = 0x7fff;
  DAT_data_0025 = 0xb36;
  DAT_data_0026 = 0xc37;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar19 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  DAT_data_0009 = 3;
  PA0 = 0x10;
  PA7 = 0;
  PA4 = 3;
  PA0 = 0;
  PA7 = 0;
  PA4 = 2;
  PA0 = 0x1000;
  PA7 = 0;
  PA4 = 1;
  PA0 = 0x10;
  PA7 = 0;
  wVar19 = PA4;
  PA0 = 0;
  PA7 = 0;
  wVar1 = PA4;
  PA0 = 0x1000;
  PA7 = 0;
  wVar2 = PA4;
  if (wVar19 == 3) {
    DAT_data_002b = 0x3f;
    DAT_data_002a = 0x20;
    DAT_data_0028 = 0;
    DAT_data_0029 = 0;
    wVar19 = 2;
  }
  else if (wVar1 == 2) {
    DAT_data_002b = 0xf;
    DAT_data_002a = 8;
    DAT_data_0028 = 0;
    DAT_data_0029 = 0;
    wVar19 = 1;
  }
  else if (wVar2 == 1) {
    DAT_data_0028 = 0x2000;
    DAT_data_0029 = 0xa000;
    wVar19 = 0;
    DAT_data_002b = 0;
    DAT_data_002a = 0;
  }
  else {
    wVar19 = 0xff;
  }
  PA2 = wVar19;
  PA0 = 0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar19 = PA0;
  do {
    cVar5 = bio_pin();
    DAT_data_000b = DAT_data_0002;
  } while (cVar5 == '\0');
  do {
    wVar19 = PA5;
    if ((wVar19 & DAT_data_0009) != 0) {
      wVar1 = PA6;
      *(word *)(wVar19 & 0xff) = wVar1;
    }
    PA7 = DAT_data_000b + DAT_data_0006;
    wVar19 = DAT_data_000b + DAT_data_0006 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    DAT_data_000b = wVar19 + DAT_data_0006;
    PA7 = DAT_data_000b;
  } while ((short)DAT_data_000b < 0);
  PA0 = DAT_data_002a;
  DAT_data_000b = DAT_data_0002;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar19 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    wVar19 = PA5;
    if ((wVar19 & DAT_data_0009) != 0) {
      wVar1 = PA6;
      *(word *)(wVar19 & 0xff) = wVar1;
    }
    PA7 = DAT_data_000b + DAT_data_0006;
    wVar19 = DAT_data_000b + DAT_data_0006 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    DAT_data_000b = wVar19 + DAT_data_0006;
    PA7 = DAT_data_000b;
  } while ((short)DAT_data_000b < 0);
  PA0 = DAT_data_0006 << 0xc;
  DAT_data_000b = DAT_data_0002;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar19 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    wVar19 = PA5;
    if ((wVar19 & DAT_data_0009) != 0) {
      wVar1 = PA6;
      *(word *)(wVar19 & 0xff) = wVar1;
    }
    uVar18 = CONCAT22(DAT_data_0005,DAT_data_0023);
    PA7 = DAT_data_000b + DAT_data_0006;
    wVar19 = DAT_data_000b + DAT_data_0006 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    wVar19 = wVar19 + DAT_data_0006;
    PA7 = wVar19;
    DAT_data_000b = wVar19 + DAT_data_0006;
    PA7 = DAT_data_000b;
  } while ((short)DAT_data_000b < 0);
  DAT_data_000b = 0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar19 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    DAT_data_0005 = (ushort)(uVar18 >> 0x10);
    wVar19 = PA5;
    wVar19 = PA6;
    uVar16 = (uint)DAT_data_0027 * 0x10000 + (uint)DAT_data_000e + (int)(short)DAT_data_0006 * -4;
    DAT_data_000e = (ushort)uVar16;
    DAT_data_0027 = DAT_data_002b & (ushort)(uVar16 >> 0x10);
    iVar17 = (int)DAT_data_0058 * 0x40 + (int)(short)DAT_data_000b;
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    iVar17 = iVar17 + (uint)DAT_data_0027 * 0x10000 + (uVar16 & 0xffff) + (uint)DAT_data_0028;
    PA0 = DAT_data_0027;
    PA7 = DAT_data_000e + DAT_data_0028;
    PA4 = DAT_data_0080;
    wVar19 = PA4;
    PA4 = DAT_data_0081;
    wVar19 = PA4;
    PA4 = DAT_data_0082;
    wVar19 = PA4;
    PA4 = DAT_data_0083;
    PA0 = DAT_data_002b & (ushort)((uint)iVar17 >> 0x10);
    PA7 = (word)iVar17;
    wVar8 = PA4;
    wVar9 = PA4;
    wVar2 = PA4;
    wVar1 = PA4;
    wVar19 = PA4;
    iVar17 = ((int)(short)wVar1 * 0x8000 - (int)(short)DAT_data_0022 * (int)(short)wVar1) +
             (int)(short)DAT_data_0022 * (int)(short)wVar19;
    PA1 = DAT_data_0016;
    PA1 = DAT_data_001c;
    PA1 = DAT_data_0024;
    wVar19 = (word)((uint)(((iVar17 - (int)DAT_data_0007 * (int)(short)((uint)(iVar17 * 2) >> 0x10))
                           + (int)DAT_data_0007 * (int)(short)DAT_data_0016) * 2) >> 0x10);
    wVar6 = PA1;
    wVar7 = PA1;
    wVar3 = PA1;
    iVar17 = ((int)(short)wVar2 * 0x8000 - (int)(short)DAT_data_0022 * (int)(short)wVar2) +
             (int)(short)DAT_data_0022 * (int)(short)wVar1;
    wVar1 = (word)((uint)(((iVar17 - (int)DAT_data_0007 * (int)(short)((uint)(iVar17 * 2) >> 0x10))
                          + (int)DAT_data_0007 * (int)(short)wVar19) * 2) >> 0x10);
    iVar17 = ((int)(short)wVar9 * 0x8000 - (int)(short)DAT_data_0022 * (int)(short)wVar9) +
             (int)(short)DAT_data_0022 * (int)(short)wVar2;
    wVar2 = (word)((uint)(((iVar17 - (int)DAT_data_0007 * (int)(short)((uint)(iVar17 * 2) >> 0x10))
                          + (int)DAT_data_0007 * (int)(short)wVar1) * 2) >> 0x10);
    iVar17 = ((int)(short)wVar8 * 0x8000 - (int)(short)DAT_data_0022 * (int)(short)wVar8) +
             (int)(short)DAT_data_0022 * (int)(short)wVar9;
    DAT_data_0016 =
         (word)((uint)(((iVar17 - (int)DAT_data_0007 * (int)(short)((uint)(iVar17 * 2) >> 0x10)) +
                       (int)DAT_data_0007 * (int)(short)wVar2) * 2) >> 0x10);
    iVar17 = (uint)DAT_data_0021 * 0x10000;
    if (iVar17 < 0) {
      iVar17 = (uint)DAT_data_0021 * -0x10000;
    }
    iVar17 = iVar17 + (uint)DAT_data_0005 * -0x10000;
    sVar4 = (short)((uint)iVar17 >> 0x10);
    if (iVar17 < 0) {
      uVar18 = (uint)DAT_data_0005 * 0x10000 + (uVar18 & 0xffff) + (int)DAT_data_006d * (int)sVar4;
    }
    else {
      uVar18 = (uint)DAT_data_0005 * 0x10000 + (uVar18 & 0xffff) + (int)DAT_data_006c * (int)sVar4;
    }
    DAT_data_0005 = (ushort)(uVar18 >> 0x10);
    uVar21 = (ushort)((int)(short)DAT_data_0005 << 8) & DAT_data_0002;
    uVar20 = (short)((uint)((int)(short)DAT_data_0005 << 9) >> 0x10) + DAT_data_0025;
    sVar4 = *(short *)(uVar20 & 0xfff);
    iVar17 = ((((int)sVar4 * 0x8000 - (int)(short)uVar21 * (int)sVar4) +
               (int)(short)uVar21 * (int)*(short *)(uVar20 + DAT_data_0006 & 0xfff) & 0x7fffffffU)
             >> 0xf) * 0x10000 + (uint)DAT_data_006e * -0x10000;
    if (iVar17 < 1) {
      DAT_data_000b = 0;
    }
    else {
      DAT_data_000b =
           (ushort)((uint)((int)(short)((uint)iVar17 >> 0x10) * (int)DAT_data_006f * 2) >> 0x10);
    }
    iVar17 = (int)(short)DAT_data_000b * 0x100 + (int)(short)DAT_data_0002 * 0x100;
    PA1 = wVar19;
    PA1 = DAT_data_001d;
    PA1 = DAT_data_0005;
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    uVar21 = (ushort)iVar17 & DAT_data_0002;
    uVar20 = (short)((uint)(iVar17 << 1) >> 0x10) + DAT_data_0026;
    sVar4 = *(short *)(uVar20 & 0xfff);
    wVar8 = PA1;
    wVar9 = PA1;
    DAT_data_0021 = PA1;
    DAT_data_0024 =
         (word)((uint)((((int)sVar4 * 0x8000 - (int)(short)uVar21 * (int)sVar4) +
                       (int)(short)uVar21 * (int)*(short *)(uVar20 + DAT_data_0006 & 0xfff)) * 2) >>
               0x10);
    uVar21 = (ushort)((int)(short)wVar3 * (int)DAT_data_005d) & DAT_data_0002;
    iVar17 = (int)DAT_data_005c * 0x40 +
             (int)(short)((uint)((int)(short)wVar3 * (int)DAT_data_005d * 2) >> 0x10);
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    iVar17 = iVar17 + (uint)DAT_data_0027 * 0x10000 + (uVar16 & 0xffff) + (uint)DAT_data_0029;
    PA0 = DAT_data_0027 + DAT_data_002a & DAT_data_002b;
    PA7 = DAT_data_000e + DAT_data_0029;
    PA4 = DAT_data_0084;
    wVar3 = PA4;
    PA4 = DAT_data_0085;
    wVar3 = PA4;
    PA4 = DAT_data_0086;
    wVar3 = PA4;
    PA4 = DAT_data_0087;
    PA0 = (short)((uint)iVar17 >> 0x10) + DAT_data_002a & DAT_data_002b;
    PA7 = (word)iVar17;
    wVar13 = PA4;
    wVar14 = PA4;
    wVar15 = PA4;
    wVar10 = PA4;
    wVar3 = PA4;
    iVar17 = ((int)(short)wVar10 * 0x8000 - (int)(short)uVar21 * (int)(short)wVar10) +
             (int)(short)uVar21 * (int)(short)wVar3;
    PA1 = wVar1;
    PA1 = DAT_data_001e;
    wVar3 = (word)((uint)(((iVar17 - (int)DAT_data_0008 * (int)(short)((uint)(iVar17 * 2) >> 0x10))
                          + (int)DAT_data_0008 * (int)(short)DAT_data_001e) * 2) >> 0x10);
    iVar17 = ((int)(short)wVar15 * 0x8000 - (int)(short)uVar21 * (int)(short)wVar15) +
             (int)(short)uVar21 * (int)(short)wVar10;
    wVar10 = PA1;
    wVar11 = PA1;
    wVar12 = PA1;
    DAT_data_001c =
         (word)((uint)(((iVar17 - (int)DAT_data_0008 * (int)(short)((uint)(iVar17 * 2) >> 0x10)) +
                       (int)DAT_data_0008 * (int)(short)wVar3) * 2) >> 0x10);
    iVar17 = (uint)DAT_data_005b * 0x10000 + (int)DAT_data_0048 * (int)(short)wVar12 * 2;
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    DAT_data_0007 = (short)((uint)iVar17 >> 0x10);
    if ((uint)DAT_data_004b + (int)(short)DAT_data_0006 * -4 == 0) {
      PA3 = DAT_data_004a;
    }
    DAT_data_004a = (word)((uint)DAT_data_004a * 0x10000 + (uint)DAT_data_0006 * 0x10000 >> 0x10);
    iVar17 = ((int)(short)wVar14 * 0x8000 - (int)(short)uVar21 * (int)(short)wVar14) +
             (int)(short)uVar21 * (int)(short)wVar15;
    DAT_data_001d =
         (word)((uint)(((iVar17 - (int)DAT_data_0008 * (int)(short)((uint)(iVar17 * 2) >> 0x10)) +
                       (int)DAT_data_0008 * (int)(short)DAT_data_001c) * 2) >> 0x10);
    iVar17 = ((int)(short)wVar13 * 0x8000 - (int)(short)uVar21 * (int)(short)wVar13) +
             (int)(short)uVar21 * (int)(short)wVar14;
    DAT_data_001e =
         (word)((uint)(((iVar17 - (int)DAT_data_0008 * (int)(short)((uint)(iVar17 * 2) >> 0x10)) +
                       (int)DAT_data_0008 * (int)(short)DAT_data_001d) * 2) >> 0x10);
    DAT_data_0084 =
         (word)((uint)wVar11 * 0x10000 + (int)DAT_data_005e * (int)(short)DAT_data_001e * 2 >> 0x10)
    ;
    DAT_data_0085 =
         (word)((uint)wVar9 * 0x10000 + (int)DAT_data_005e * (int)(short)DAT_data_001d * 2 >> 0x10);
    DAT_data_0086 =
         (word)((uint)wVar7 * 0x10000 + (int)DAT_data_005e * (int)(short)DAT_data_001c * 2 >> 0x10);
    DAT_data_0087 =
         (word)((uint)DAT_data_0017 * 0x10000 + (int)DAT_data_005e * (int)(short)wVar3 * 2 >> 0x10);
    DAT_data_0080 =
         (word)((uint)wVar10 * 0x10000 + (int)DAT_data_005a * (int)(short)DAT_data_0016 * 2 >> 0x10)
    ;
    DAT_data_0081 =
         (word)((uint)wVar8 * 0x10000 + (int)DAT_data_005a * (int)(short)wVar2 * 2 >> 0x10);
    PA1 = wVar2;
    PA1 = wVar3;
    DAT_data_0082 =
         (word)((uint)wVar6 * 0x10000 + (int)DAT_data_005a * (int)(short)wVar1 * 2 >> 0x10);
    DAT_data_0083 =
         (word)((uint)DAT_data_000f * 0x10000 + (int)DAT_data_005a * (int)(short)wVar19 * 2 >> 0x10)
    ;
    DAT_data_000f = PA1;
    DAT_data_0017 = PA1;
    iVar17 = (uint)DAT_data_005f * 0x10000 + (int)DAT_data_0049 * (int)(short)DAT_data_008d * 2;
    wVar19 = PA1;
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    DAT_data_0008 = (short)((uint)iVar17 >> 0x10);
    DAT_data_000b = (ushort)((uint)((int)(short)wVar19 * (int)DAT_data_0059 * 2) >> 0x10);
    DAT_data_008d = PA1;
    DAT_data_0022 = (ushort)((int)(short)wVar19 * (int)DAT_data_0059) & DAT_data_0002;
  } while( true );
}


