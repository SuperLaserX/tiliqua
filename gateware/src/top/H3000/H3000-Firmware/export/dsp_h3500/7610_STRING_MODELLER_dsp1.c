// 7610_STRING_MODELLER_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7610_STRING_MODELLER_dsp1 (ucode_7610_ROM4_0EFBE.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  ushort uVar5;
  word wVar6;
  ushort uVar7;
  char cVar8;
  word wVar9;
  ushort uVar14;
  word wVar15;
  int iVar10;
  int iVar11;
  uint uVar12;
  ushort uVar16;
  short sVar17;
  word wVar18;
  ushort uVar19;
  ushort uVar20;
  word wVar21;
  uint uVar13;
  short sVar22;
  int iVar23;
  short in_T;
  ushort uVar24;
  
  uVar24 = 0x8f;
  do {
    *(undefined2 *)(uVar24 & 0xff) = 0;
    uVar7 = uVar24 & 0x1ff;
    uVar24 = uVar24 - 1;
  } while (uVar7 != 0);
  DAT_data_0061 = 1;
  DAT_data_0065 = 0x100;
  DAT_data_0064 = 0x8000;
  DAT_data_0060 = 0;
  DAT_data_0062 = 0xffff;
  DAT_data_0066 = 0xff;
  DAT_data_0063 = 0x7fff;
  FUN_prog_0a58();
  iVar10 = CONCAT22(DAT_data_005b,DAT_data_005c);
  uVar12 = CONCAT22(DAT_data_005d,DAT_data_005e);
  DAT_data_004a = 0x53;
  DAT_data_004b = 0x43;
  do {
    cVar8 = bio_pin();
  } while (cVar8 != '\0');
  wVar6 = PA0;
  do {
    cVar8 = bio_pin();
  } while (cVar8 == '\0');
  do {
    DAT_data_005b = (ushort)((uint)iVar10 >> 0x10);
    DAT_data_005c = (ushort)iVar10;
    DAT_data_005d = (ushort)(uVar12 >> 0x10);
    DAT_data_005e = (ushort)uVar12;
    wVar6 = PA5;
    wVar9 = PA6;
    *(word *)(wVar6 & 0xff) = wVar9;
    sVar22 = sData0002;
    PA1 = DAT_data_0044;
    uVar14 = DAT_data_004a + DAT_data_004b + DAT_data_004a;
    wVar15 = DAT_data_0044 - DAT_data_0061;
    uVar24 = (ushort)((uint)DAT_data_0047 * 0x10000 + (int)in_T * (int)(short)DAT_data_0048 * 2 >>
                     0x10);
    sVar1 = (short)((uint)uVar14 * 0x10000 + (int)(short)DAT_data_0048 * (int)sData0001 * 2 +
                    (uint)uVar24 * -0x10000 >> 0x10);
    uVar7 = (ushort)((int)sData0002 * (int)sVar1 * 2 + (uint)DAT_data_0048 * 0x10000 >> 0x10);
    PA1 = DAT_data_0045;
    wVar6 = PA2;
    PA3 = uVar14;
    iVar10 = (uint)wVar6 * 0x10000 + (uint)DAT_data_004e * 0x10000;
    PA7 = wVar15;
    PA4 = DAT_data_004f;
    PA7 = DAT_data_0053;
    uVar2 = (ushort)((uint)iVar10 >> 0x10);
    wVar6 = PA4;
    wVar9 = PA4;
    iVar11 = (int)(short)wVar6 * (int)DAT_data_0057 + (int)(short)wVar9 * (int)(short)DAT_data_0058;
    uVar19 = (ushort)((uint)iVar11 >> 0x10);
    uVar12 = (uint)DAT_data_005c + (uint)DAT_data_005b * 0x10000 + (int)DAT_data_0059;
    uVar3 = (ushort)(uVar12 >> 0x10);
    uVar16 = (ushort)((uint)((int)(short)uVar12 << 0xf) >> 0x10) & DAT_data_0063;
    PA5 = (word)((uint)(iVar10 - (int)DAT_data_0054 * (int)DAT_data_000d) >> 0x10);
    PA6 = (word)((uint)uVar2 * 0x10000 + (int)DAT_data_0054 * (int)DAT_data_000d >> 0x10);
    wVar6 = PA2;
    wVar9 = PA7;
    if (-1 < (int)(short)uVar3 - (int)DAT_data_000b) {
      DAT_data_0059 = DAT_data_000a;
    }
    PA1 = wVar15;
    sVar17 = uVar14 + DAT_data_004a + DAT_data_004b;
    uVar14 = sVar17 + uVar14;
    wVar18 = wVar15 - DAT_data_0061;
    uVar20 = (ushort)((uint)uVar24 * 0x10000 + (int)sData0002 * (int)(short)uVar7 * 2 >> 0x10);
    sVar4 = (short)((uint)uVar14 * 0x10000 + (int)(short)uVar7 * (int)sData0001 * 2 +
                    (uint)uVar20 * -0x10000 >> 0x10);
    uVar5 = (ushort)((int)sData0002 * (int)sVar4 * 2 + (uint)uVar7 * 0x10000 >> 0x10);
    PA1 = (word)((uint)DAT_data_005e + (uint)DAT_data_005d * 0x10000 +
                 (int)(short)DAT_data_004c * (int)DAT_data_0007 +
                 (int)(short)uVar24 * (int)DAT_data_0005 + (int)(short)uVar7 * (int)DAT_data_0004 +
                 (int)sVar1 * (int)sData0003 >> 0x10);
    wVar21 = PA2;
    PA3 = uVar14;
    iVar10 = (uint)wVar21 * 0x10000 + (uint)wVar6 * 0x10000;
    PA7 = wVar18;
    PA4 = uVar2;
    PA7 = wVar15 + uVar3;
    uVar24 = (ushort)((uint)iVar10 >> 0x10);
    wVar6 = PA4;
    wVar15 = PA4;
    iVar23 = (int)(short)(iVar11 + (uint)uVar19 * 0x10000 + (uint)uVar19 * 0x10000 >> 0x10) *
             (int)DAT_data_000d;
    iVar11 = (int)(short)wVar6 * (int)(short)(DAT_data_0063 - uVar16) +
             (int)(short)wVar15 * (int)(short)uVar16;
    uVar7 = (ushort)((uint)iVar11 >> 0x10);
    uVar12 = (uVar12 & 0xffff) + (uint)uVar3 * 0x10000 + (int)DAT_data_0059;
    uVar2 = (ushort)(uVar12 >> 0x10);
    uVar19 = (ushort)((uint)((int)(short)uVar12 << 0xf) >> 0x10) & DAT_data_0063;
    PA5 = (word)((uint)(iVar10 - iVar23) >> 0x10);
    PA6 = (word)((uint)uVar24 * 0x10000 + iVar23 >> 0x10);
    wVar6 = PA2;
    wVar15 = PA7;
    if ((int)(short)uVar2 - (int)DAT_data_000c < 1) {
      DAT_data_0059 = DAT_data_0009;
    }
    PA1 = wVar18;
    DAT_data_004b = uVar14 + sVar17;
    DAT_data_004a = DAT_data_004b + uVar14;
    DAT_data_0044 = wVar18 - DAT_data_0061;
    DAT_data_0047 =
         (ushort)((uint)uVar20 * 0x10000 + (int)sData0002 * (int)(short)uVar5 * 2 >> 0x10);
    sVar1 = (short)((uint)DAT_data_004a * 0x10000 + (int)(short)uVar5 * (int)sData0001 * 2 +
                    (uint)DAT_data_0047 * -0x10000 >> 0x10);
    DAT_data_0048 = (ushort)((int)sData0002 * (int)sVar1 * 2 + (uint)uVar5 * 0x10000 >> 0x10);
    PA1 = (word)((uint)DAT_data_005e + (uint)DAT_data_005d * 0x10000 +
                 (int)(short)wVar9 * (int)DAT_data_0007 + (int)(short)uVar20 * (int)DAT_data_0005 +
                 (int)(short)uVar5 * (int)DAT_data_0004 + (int)sVar4 * (int)sData0003 >> 0x10);
    wVar9 = PA2;
    PA3 = DAT_data_004a;
    DAT_data_0045 =
         (word)((uint)DAT_data_005e + (uint)DAT_data_005d * 0x10000 +
                (int)(short)wVar15 * (int)DAT_data_0007 +
                (int)(short)DAT_data_0047 * (int)DAT_data_0005 +
                (int)(short)DAT_data_0048 * (int)DAT_data_0004 + (int)sVar1 * (int)sData0003 >> 0x10
               );
    iVar10 = (uint)wVar9 * 0x10000 + (uint)wVar6 * 0x10000;
    PA7 = DAT_data_0044;
    PA4 = uVar24;
    PA7 = wVar18 + uVar2;
    DAT_data_004f = (ushort)((uint)iVar10 >> 0x10);
    wVar6 = PA4;
    wVar9 = PA4;
    iVar23 = (int)(short)(iVar11 + (uint)uVar7 * 0x10000 + (uint)uVar7 * 0x10000 >> 0x10) *
             (int)DAT_data_000d;
    iVar11 = (int)(short)wVar6 * (int)(short)(DAT_data_0063 - uVar19) +
             (int)(short)wVar9 * (int)(short)uVar19;
    uVar24 = (ushort)((uint)iVar11 >> 0x10);
    DAT_data_0054 = (short)(iVar11 + (uint)uVar24 * 0x10000 + (uint)uVar24 * 0x10000 >> 0x10);
    iVar11 = (uVar12 & 0xffff) + (uint)uVar2 * 0x10000 + (int)DAT_data_0059;
    DAT_data_005c = (ushort)iVar11;
    DAT_data_005b = (ushort)((uint)iVar11 >> 0x10);
    DAT_data_0058 = (ushort)((uint)((int)(short)DAT_data_005c << 0xf) >> 0x10) & DAT_data_0063;
    DAT_data_0057 = DAT_data_0063 - DAT_data_0058;
    PA5 = (word)((uint)(iVar10 - iVar23) >> 0x10);
    PA6 = (word)((uint)DAT_data_004f * 0x10000 + iVar23 >> 0x10);
    DAT_data_004e = PA2;
    DAT_data_004c = PA7;
    DAT_data_0053 = DAT_data_0044 + DAT_data_005b;
    wVar6 = PA5;
    wVar9 = PA6;
    *(word *)(wVar6 & 0xff) = wVar9;
    PA1 = DAT_data_0044;
    uVar20 = DAT_data_004a + DAT_data_004b + DAT_data_004a;
    wVar21 = DAT_data_0044 - DAT_data_0061;
    uVar24 = (ushort)((uint)DAT_data_0047 * 0x10000 + (int)sVar22 * (int)(short)DAT_data_0048 * 2 >>
                     0x10);
    sVar1 = (short)((uint)uVar20 * 0x10000 + (int)(short)DAT_data_0048 * (int)sData0001 * 2 +
                    (uint)uVar24 * -0x10000 >> 0x10);
    uVar7 = (ushort)((int)sData0002 * (int)sVar1 * 2 + (uint)DAT_data_0048 * 0x10000 >> 0x10);
    PA1 = DAT_data_0045;
    wVar9 = PA2;
    PA3 = uVar20;
    wVar6 = (word)((uint)DAT_data_005e + (uint)DAT_data_005d * 0x10000 +
                   (int)(short)DAT_data_004c * (int)DAT_data_0007 +
                   (int)(short)uVar24 * (int)DAT_data_0005 + (int)(short)uVar7 * (int)DAT_data_0004
                   + (int)sVar1 * (int)sData0003 >> 0x10);
    iVar10 = (uint)wVar9 * 0x10000 + (uint)DAT_data_004e * 0x10000;
    PA7 = wVar21;
    PA4 = DAT_data_004f;
    PA7 = DAT_data_0053;
    uVar2 = (ushort)((uint)iVar10 >> 0x10);
    wVar9 = PA4;
    wVar15 = PA4;
    iVar11 = (int)(short)wVar9 * (int)DAT_data_0057 + (int)(short)wVar15 * (int)(short)DAT_data_0058
    ;
    uVar19 = (ushort)((uint)iVar11 >> 0x10);
    uVar13 = (uint)DAT_data_005c + (uint)DAT_data_005b * 0x10000 + (int)DAT_data_0059;
    uVar3 = (ushort)(uVar13 >> 0x10);
    uVar14 = (ushort)((uint)((int)(short)uVar13 << 0xf) >> 0x10) & DAT_data_0063;
    PA5 = (word)((uint)(iVar10 - (int)DAT_data_0054 * (int)DAT_data_000d) >> 0x10);
    PA6 = (word)((uint)uVar2 * 0x10000 + (int)DAT_data_0054 * (int)DAT_data_000d >> 0x10);
    wVar9 = PA2;
    wVar15 = PA7;
    uVar12 = ((uint)DAT_data_005e + (uint)DAT_data_005d * 0x10000 + (int)(short)wVar6 * -0x400) -
             (int)(short)DAT_data_005d;
    uVar16 = (ushort)(uVar12 >> 0x10);
    PA1 = wVar21;
    sVar22 = uVar20 + DAT_data_004a + DAT_data_004b;
    uVar20 = sVar22 + uVar20;
    wVar18 = wVar21 - DAT_data_0061;
    uVar24 = (ushort)((uint)uVar24 * 0x10000 + (int)sData0002 * (int)(short)uVar7 * 2 >> 0x10);
    sVar1 = (short)((uint)uVar20 * 0x10000 + (int)(short)uVar7 * (int)sData0001 * 2 +
                    (uint)uVar24 * -0x10000 >> 0x10);
    uVar7 = (ushort)((int)sData0002 * (int)sVar1 * 2 + (uint)uVar7 * 0x10000 >> 0x10);
    PA1 = wVar6;
    wVar6 = PA2;
    PA3 = uVar20;
    iVar10 = (uint)wVar6 * 0x10000 + (uint)wVar9 * 0x10000;
    PA7 = wVar18;
    PA4 = uVar2;
    PA7 = wVar21 + uVar3;
    uVar2 = (ushort)((uint)iVar10 >> 0x10);
    wVar6 = PA4;
    wVar9 = PA4;
    iVar23 = (int)(short)(iVar11 + (uint)uVar19 * 0x10000 + (uint)uVar19 * 0x10000 >> 0x10) *
             (int)DAT_data_000d;
    iVar11 = (int)(short)wVar6 * (int)(short)(DAT_data_0063 - uVar14) +
             (int)(short)wVar9 * (int)(short)uVar14;
    uVar19 = (ushort)((uint)iVar11 >> 0x10);
    uVar13 = (uVar13 & 0xffff) + (uint)uVar3 * 0x10000 + (int)DAT_data_0059;
    uVar3 = (ushort)(uVar13 >> 0x10);
    uVar14 = (ushort)((uint)((int)(short)uVar13 << 0xf) >> 0x10) & DAT_data_0063;
    PA5 = (word)((uint)(iVar10 - iVar23) >> 0x10);
    PA6 = (word)((uint)uVar2 * 0x10000 + iVar23 >> 0x10);
    wVar6 = PA2;
    wVar9 = PA7;
    if (DAT_data_0059 < 0) {
      DAT_data_0059 = DAT_data_000a;
    }
    else {
      DAT_data_0059 = DAT_data_0009;
    }
    PA1 = wVar18;
    DAT_data_004b = uVar20 + sVar22;
    DAT_data_004a = DAT_data_004b + uVar20;
    DAT_data_0044 = wVar18 - DAT_data_0061;
    DAT_data_0047 =
         (ushort)((uint)uVar24 * 0x10000 + (int)sData0002 * (int)(short)uVar7 * 2 >> 0x10);
    sVar22 = (short)((uint)DAT_data_004a * 0x10000 + (int)(short)uVar7 * (int)sData0001 * 2 +
                     (uint)DAT_data_0047 * -0x10000 >> 0x10);
    DAT_data_0048 = (ushort)((int)sData0002 * (int)sVar22 * 2 + (uint)uVar7 * 0x10000 >> 0x10);
    PA1 = (word)((uVar12 & 0xffff) + (uint)uVar16 * 0x10000 +
                 (int)(short)wVar15 * (int)DAT_data_0007 + (int)(short)uVar24 * (int)DAT_data_0005 +
                 (int)(short)uVar7 * (int)DAT_data_0004 + (int)sVar1 * (int)sData0003 >> 0x10);
    wVar15 = PA2;
    PA3 = DAT_data_004a;
    DAT_data_0045 =
         (word)((uVar12 & 0xffff) + (uint)uVar16 * 0x10000 + (int)(short)wVar9 * (int)DAT_data_0007
                + (int)(short)DAT_data_0047 * (int)DAT_data_0005 +
                (int)(short)DAT_data_0048 * (int)DAT_data_0004 + (int)sVar22 * (int)sData0003 >>
               0x10);
    iVar23 = (uint)wVar15 * 0x10000 + (uint)wVar6 * 0x10000;
    PA7 = DAT_data_0044;
    PA4 = uVar2;
    PA7 = wVar18 + uVar3;
    DAT_data_004f = (ushort)((uint)iVar23 >> 0x10);
    wVar6 = PA4;
    wVar9 = PA4;
    iVar11 = (int)(short)(iVar11 + (uint)uVar19 * 0x10000 + (uint)uVar19 * 0x10000 >> 0x10) *
             (int)DAT_data_000d;
    iVar10 = (int)(short)wVar6 * (int)(short)(DAT_data_0063 - uVar14) +
             (int)(short)wVar9 * (int)(short)uVar14;
    uVar24 = (ushort)((uint)iVar10 >> 0x10);
    DAT_data_0054 = (short)(iVar10 + (uint)uVar24 * 0x10000 + (uint)uVar24 * 0x10000 >> 0x10);
    iVar10 = (uVar13 & 0xffff) + (uint)uVar3 * 0x10000 + (int)DAT_data_0059;
    DAT_data_0058 = (ushort)((uint)((int)(short)iVar10 << 0xf) >> 0x10) & DAT_data_0063;
    DAT_data_0057 = DAT_data_0063 - DAT_data_0058;
    PA5 = (word)((uint)(iVar23 - iVar11) >> 0x10);
    PA6 = (word)((uint)DAT_data_004f * 0x10000 + iVar11 >> 0x10);
    DAT_data_004e = PA2;
    DAT_data_004c = PA7;
    DAT_data_0053 = DAT_data_0044 + (short)((uint)iVar10 >> 0x10);
    in_T = sData0002;
  } while( true );
}


// ===== FUN_prog_0a58 @ prog:0a58 =====

void FUN_prog_0a58(void)

{
  char cVar1;
  word wVar2;
  ushort in_AR0;
  
  DAT_data_0067 = 0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    DAT_data_0066 = PA5;
    wVar2 = PA6;
    *(word *)(in_AR0 & 0xff) = wVar2;
    PA7 = DAT_data_0067;
    PA7 = DAT_data_0067 + DAT_data_0061;
    wVar2 = DAT_data_0067 + DAT_data_0061 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0061;
    PA7 = wVar2;
    DAT_data_0067 = wVar2 + DAT_data_0061;
  } while (-1 < (short)DAT_data_0067);
  return;
}


