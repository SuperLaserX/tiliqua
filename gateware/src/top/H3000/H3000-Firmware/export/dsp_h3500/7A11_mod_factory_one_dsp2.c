// 7A11_mod_factory_one_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7A11_mod_factory_one_dsp2 (ucode_7A11_ROM3_046BE.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  word wVar1;
  word wVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  short sVar7;
  char cVar8;
  word wVar9;
  word wVar10;
  word wVar11;
  word wVar12;
  word wVar13;
  word wVar14;
  word wVar15;
  word wVar21;
  uint uVar16;
  int iVar17;
  int iVar18;
  uint uVar19;
  ushort uVar22;
  uint uVar20;
  ushort uVar23;
  
  uVar23 = 0x8f;
  do {
    *(undefined2 *)(uVar23 & 0xff) = 0;
    uVar22 = uVar23 & 0x1ff;
    uVar23 = uVar23 - 1;
  } while (uVar22 != 0);
  DAT_data_0008 = 1;
  DAT_data_000a = 0x200;
  DAT_data_0002 = 0x7fff;
  DAT_data_0029 = 0xad4;
  DAT_data_002a = 0xbd5;
  do {
    cVar8 = bio_pin();
  } while (cVar8 != '\0');
  wVar21 = PA0;
  do {
    cVar8 = bio_pin();
  } while (cVar8 == '\0');
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
  wVar21 = PA4;
  PA0 = 0;
  PA7 = 0;
  wVar1 = PA4;
  PA0 = 0x1000;
  PA7 = 0;
  wVar2 = PA4;
  if (wVar21 == 3) {
    DAT_data_002e = 0x3f;
    DAT_data_002d = 0x20;
    DAT_data_002c = 0;
    wVar21 = 2;
  }
  else if (wVar1 == 2) {
    DAT_data_002e = 0xf;
    DAT_data_002d = 8;
    DAT_data_002c = 0;
    wVar21 = 1;
  }
  else if (wVar2 == 1) {
    DAT_data_002e = 0;
    DAT_data_002d = 0;
    wVar21 = 0;
    DAT_data_002c = 0x8000;
  }
  else {
    wVar21 = 0xff;
  }
  PA2 = wVar21;
  PA0 = 0;
  do {
    cVar8 = bio_pin();
  } while (cVar8 != '\0');
  wVar21 = PA0;
  do {
    cVar8 = bio_pin();
    DAT_data_000c = DAT_data_0002;
  } while (cVar8 == '\0');
  do {
    wVar21 = PA5;
    if ((wVar21 & DAT_data_000a) != 0) {
      wVar1 = PA6;
      *(word *)(wVar21 & 0xff) = wVar1;
    }
    PA7 = DAT_data_000c + DAT_data_0008;
    wVar21 = DAT_data_000c + DAT_data_0008 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    DAT_data_000c = wVar21 + DAT_data_0008;
    PA7 = DAT_data_000c;
  } while ((short)DAT_data_000c < 0);
  PA0 = DAT_data_002d;
  DAT_data_000c = DAT_data_0002;
  do {
    cVar8 = bio_pin();
  } while (cVar8 != '\0');
  wVar21 = PA0;
  do {
    cVar8 = bio_pin();
  } while (cVar8 == '\0');
  do {
    wVar21 = PA5;
    if ((wVar21 & DAT_data_000a) != 0) {
      wVar1 = PA6;
      *(word *)(wVar21 & 0xff) = wVar1;
    }
    uVar20 = CONCAT22(DAT_data_0007,DAT_data_0026);
    uVar19 = CONCAT22(DAT_data_0006,DAT_data_0025);
    PA7 = DAT_data_000c + DAT_data_0008;
    wVar21 = DAT_data_000c + DAT_data_0008 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    wVar21 = wVar21 + DAT_data_0008;
    PA7 = wVar21;
    DAT_data_000c = wVar21 + DAT_data_0008;
    PA7 = DAT_data_000c;
  } while ((short)DAT_data_000c < 0);
  do {
    cVar8 = bio_pin();
  } while (cVar8 != '\0');
  wVar21 = PA0;
  do {
    cVar8 = bio_pin();
  } while (cVar8 == '\0');
  do {
    DAT_data_0007 = (ushort)(uVar20 >> 0x10);
    DAT_data_0006 = (word)(uVar19 >> 0x10);
    wVar21 = PA5;
    wVar21 = PA6;
    uVar23 = (ushort)((int)(short)DAT_data_0021 * (int)DAT_data_005d) & DAT_data_0002;
    uVar16 = (uint)DAT_data_002b * 0x10000 + (uint)DAT_data_0010 + (int)DAT_data_0008 * -4;
    DAT_data_0010 = (ushort)uVar16;
    iVar17 = uVar16 + (int)DAT_data_005c * 0x40 +
             (int)(short)((uint)((int)(short)DAT_data_0021 * (int)DAT_data_005d * 2) >> 0x10);
    DAT_data_002b = DAT_data_002e & (ushort)(uVar16 >> 0x10);
    PA0 = DAT_data_002b;
    PA7 = DAT_data_0010;
    PA4 = DAT_data_0080;
    wVar21 = PA4;
    PA4 = DAT_data_0081;
    wVar21 = PA4;
    PA4 = DAT_data_0082;
    wVar21 = PA4;
    PA4 = DAT_data_0083;
    PA0 = DAT_data_002e & (ushort)((uint)iVar17 >> 0x10);
    PA7 = (word)iVar17;
    wVar3 = PA4;
    wVar5 = PA4;
    wVar2 = PA4;
    wVar1 = PA4;
    wVar21 = PA4;
    wVar21 = (word)((uint)((((int)(short)wVar1 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar1) +
                           (int)(short)uVar23 * (int)(short)wVar21) * 2) >> 0x10);
    PA1 = wVar21;
    PA1 = DAT_data_0020;
    PA1 = DAT_data_0027;
    wVar1 = (word)((uint)((((int)(short)wVar2 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar2) +
                          (int)(short)uVar23 * (int)(short)wVar1) * 2) >> 0x10);
    wVar9 = PA1;
    wVar10 = PA1;
    wVar4 = PA1;
    wVar2 = (word)((uint)((((int)(short)wVar5 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar5) +
                          (int)(short)uVar23 * (int)(short)wVar2) * 2) >> 0x10);
    wVar3 = (word)((uint)((((int)(short)wVar3 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar3) +
                          (int)(short)uVar23 * (int)(short)wVar5) * 2) >> 0x10);
    uVar23 = (ushort)((int)(short)wVar4 * (int)DAT_data_005f) & DAT_data_0002;
    iVar17 = (uint)DAT_data_002b * 0x10000 + (uVar16 & 0xffff) + (uint)DAT_data_002c;
    iVar18 = iVar17 + (int)DAT_data_005e * 0x40 +
             (int)(short)((uint)((int)(short)wVar4 * (int)DAT_data_005f * 2) >> 0x10);
    PA0 = DAT_data_002b + DAT_data_002d & DAT_data_002e;
    PA7 = (word)iVar17;
    PA4 = DAT_data_0084;
    wVar4 = PA4;
    PA4 = DAT_data_0085;
    wVar4 = PA4;
    PA4 = DAT_data_0086;
    wVar4 = PA4;
    PA4 = DAT_data_0087;
    PA0 = (short)((uint)iVar18 >> 0x10) + DAT_data_002d & DAT_data_002e;
    PA7 = (word)iVar18;
    wVar14 = PA4;
    wVar15 = PA4;
    wVar6 = PA4;
    wVar5 = PA4;
    wVar4 = PA4;
    wVar4 = (word)((uint)((((int)(short)wVar5 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar5) +
                          (int)(short)uVar23 * (int)(short)wVar4) * 2) >> 0x10);
    PA1 = wVar1;
    PA1 = wVar4;
    PA1 = DAT_data_0006;
    wVar5 = (word)((uint)((((int)(short)wVar6 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar6) +
                          (int)(short)uVar23 * (int)(short)wVar5) * 2) >> 0x10);
    wVar11 = PA1;
    wVar12 = PA1;
    wVar13 = PA1;
    wVar6 = (word)((uint)((((int)(short)wVar15 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar15) +
                          (int)(short)uVar23 * (int)(short)wVar6) * 2) >> 0x10);
    DAT_data_0020 =
         (word)((uint)((((int)(short)wVar14 * 0x8000 - (int)(short)uVar23 * (int)(short)wVar14) +
                       (int)(short)uVar23 * (int)(short)wVar15) * 2) >> 0x10);
    DAT_data_0080 =
         (word)((uint)wVar11 * 0x10000 + (int)DAT_data_004d * (int)(short)wVar3 * 2 >> 0x10);
    DAT_data_0081 =
         (word)((uint)wVar9 * 0x10000 + (int)DAT_data_004d * (int)(short)wVar2 * 2 >> 0x10);
    DAT_data_0082 =
         (word)((uint)DAT_data_0012 * 0x10000 + (int)DAT_data_004d * (int)(short)wVar1 * 2 >> 0x10);
    DAT_data_0083 =
         (word)((uint)DAT_data_0011 * 0x10000 + (int)DAT_data_004d * (int)(short)wVar21 * 2 >> 0x10)
    ;
    iVar17 = (uint)wVar13 * 0x10000;
    if (iVar17 < 0) {
      iVar17 = (uint)wVar13 * -0x10000;
    }
    iVar17 = iVar17 + (uint)DAT_data_0006 * -0x10000;
    sVar7 = (short)((uint)iVar17 >> 0x10);
    if (iVar17 < 0) {
      uVar19 = (uint)DAT_data_0006 * 0x10000 + (uVar19 & 0xffff) + (int)DAT_data_0069 * (int)sVar7;
    }
    else {
      uVar19 = (uint)DAT_data_0006 * 0x10000 + (uVar19 & 0xffff) + (int)DAT_data_0068 * (int)sVar7;
    }
    DAT_data_0006 = (word)(uVar19 >> 0x10);
    uVar23 = (ushort)((int)(short)DAT_data_0006 << 8) & DAT_data_0002;
    uVar22 = (short)((uint)((int)(short)DAT_data_0006 << 9) >> 0x10) + DAT_data_0029;
    sVar7 = *(short *)(uVar22 & 0xfff);
    iVar17 = ((((int)sVar7 * 0x8000 - (int)(short)uVar23 * (int)sVar7) +
               (int)(short)uVar23 * (int)*(short *)(uVar22 + DAT_data_0008 & 0xfff) & 0x7fffffffU)
             >> 0xf) * 0x10000 + (uint)DAT_data_006a * -0x10000;
    if (iVar17 < 1) {
      DAT_data_000c = 0;
    }
    else {
      DAT_data_000c =
           (ushort)((uint)((int)(short)((uint)iVar17 >> 0x10) * (int)DAT_data_006b * 2) >> 0x10);
    }
    iVar17 = (int)(short)DAT_data_000c * 0x100 + (int)(short)DAT_data_0002 * 0x100;
    PA1 = wVar2;
    PA1 = wVar5;
    PA1 = DAT_data_0028;
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    uVar23 = (ushort)iVar17 & DAT_data_0002;
    uVar22 = (short)((uint)(iVar17 << 1) >> 0x10) + DAT_data_002a;
    sVar7 = *(short *)(uVar22 & 0xfff);
    DAT_data_0011 = PA1;
    wVar21 = PA1;
    wVar1 = PA1;
    DAT_data_0027 =
         (word)((uint)((((int)sVar7 * 0x8000 - (int)(short)uVar23 * (int)sVar7) +
                       (int)(short)uVar23 * (int)*(short *)(uVar22 + DAT_data_0008 & 0xfff)) * 2) >>
               0x10);
    DAT_data_0084 =
         (word)((uint)wVar21 * 0x10000 + (int)DAT_data_004e * (int)(short)DAT_data_0020 * 2 >> 0x10)
    ;
    DAT_data_0085 =
         (word)((uint)wVar12 * 0x10000 + (int)DAT_data_004e * (int)(short)wVar6 * 2 >> 0x10);
    DAT_data_0086 =
         (word)((uint)wVar10 * 0x10000 + (int)DAT_data_004e * (int)(short)wVar5 * 2 >> 0x10);
    DAT_data_0087 =
         (word)((uint)DAT_data_0019 * 0x10000 + (int)DAT_data_004e * (int)(short)wVar4 * 2 >> 0x10);
    iVar17 = (uint)wVar1 * 0x10000;
    if (iVar17 < 0) {
      iVar17 = (uint)wVar1 * -0x10000;
    }
    iVar17 = iVar17 + (uint)DAT_data_0007 * -0x10000;
    sVar7 = (short)((uint)iVar17 >> 0x10);
    if (iVar17 < 0) {
      uVar20 = (uint)DAT_data_0007 * 0x10000 + (uVar20 & 0xffff) + (int)DAT_data_006d * (int)sVar7;
    }
    else {
      uVar20 = (uint)DAT_data_0007 * 0x10000 + (uVar20 & 0xffff) + (int)DAT_data_006c * (int)sVar7;
    }
    DAT_data_0007 = (ushort)(uVar20 >> 0x10);
    uVar23 = (ushort)((int)(short)DAT_data_0007 << 8) & DAT_data_0002;
    uVar22 = (short)((uint)((int)(short)DAT_data_0007 << 9) >> 0x10) + DAT_data_0029;
    sVar7 = *(short *)(uVar22 & 0xfff);
    iVar17 = ((((int)sVar7 * 0x8000 - (int)(short)uVar23 * (int)sVar7) +
               (int)(short)uVar23 * (int)*(short *)(uVar22 + DAT_data_0008 & 0xfff) & 0x7fffffffU)
             >> 0xf) * 0x10000 + (uint)DAT_data_006e * -0x10000;
    if (iVar17 < 1) {
      DAT_data_000c = 0;
    }
    else {
      DAT_data_000c =
           (ushort)((uint)((int)(short)((uint)iVar17 >> 0x10) * (int)DAT_data_006f * 2) >> 0x10);
    }
    iVar17 = (int)(short)DAT_data_000c * 0x100 + (int)(short)DAT_data_0002 * 0x100;
    PA1 = wVar3;
    PA1 = wVar6;
    PA1 = DAT_data_0007;
    if (iVar17 < 0) {
      iVar17 = -iVar17;
    }
    uVar23 = (ushort)iVar17 & DAT_data_0002;
    uVar22 = (short)((uint)(iVar17 << 1) >> 0x10) + DAT_data_002a;
    sVar7 = *(short *)(uVar22 & 0xfff);
    DAT_data_0012 = PA1;
    DAT_data_0019 = PA1;
    DAT_data_0021 = PA1;
    DAT_data_0028 =
         (word)((uint)((((int)sVar7 * 0x8000 - (int)(short)uVar23 * (int)sVar7) +
                       (int)(short)uVar23 * (int)*(short *)(uVar22 + DAT_data_0008 & 0xfff)) * 2) >>
               0x10);
  } while( true );
}


