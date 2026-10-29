// 7811_STUDIO_SAMPLER_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Eventide H3000/H3500 DSP program 7811_STUDIO_SAMPLER_dsp2 (ucode_7811_ROM3_2CE82.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  word wVar1;
  ushort uVar2;
  uint uVar3;
  uint uVar4;
  ushort uVar5;
  char cVar6;
  word wVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  ushort uVar16;
  
  uVar16 = 0x8f;
  do {
    *(undefined2 *)(uVar16 & 0xff) = 0;
    iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
    uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
    uVar5 = uVar16 & 0x1ff;
    uVar16 = uVar16 - 1;
  } while (uVar5 != 0);
  _DAT_data_00fd = 0x7efe;
  DAT_data_0001 = 1;
  DAT_data_0005 = 0x200;
  DAT_data_0004 = 0x8000;
  wData0000 = 0;
  uData0002 = 0xffff;
  DAT_data_0003 = 0x7fff;
  DAT_data_0023 = 0xfff;
  uVar8 = 0x7fbf8000;
  DAT_data_0053 = 0x400;
  DAT_data_0052 = 0x800;
  DAT_data_007f = 0x1000;
  DAT_data_007e = 8;
  DAT_data_002d = 0x1000;
  DAT_data_002e = 0xfffc;
  DAT_data_002f = 0xff;
  DAT_data_0054 = 0x4000;
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  wVar7 = PA0;
  do {
    cVar6 = bio_pin();
    DAT_data_0062 = DAT_data_0003;
    DAT_data_0063 = DAT_data_0004;
    DAT_data_0068 = DAT_data_0003;
  } while (cVar6 == '\0');
LAB_prog_084e:
  do {
    DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
    DAT_data_0037 = (undefined2)iVar11;
    DAT_data_000a = (ushort)(uVar10 >> 0x10);
    DAT_data_000b = (word)uVar10;
    DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
    DAT_data_0035 = (undefined2)uVar8;
    wVar7 = PA5;
    if ((wVar7 & DAT_data_0005) != 0) {
      wVar1 = PA6;
      *(word *)(wVar7 & 0xff) = wVar1;
      iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
      uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
      uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
    }
    DAT_data_000a = (ushort)(uVar10 >> 0x10);
    DAT_data_000b = (word)uVar10;
    DAT_data_0019 = PA7;
    iVar9 = (uint)DAT_data_0019 * 0x10000;
    if (iVar9 < 0) {
      iVar9 = (uint)DAT_data_0019 * -0x10000;
    }
    DAT_data_003a = (word)((uint)iVar9 >> 0x10);
    iVar9 = (int)(short)DAT_data_0033;
    DAT_data_0033 = DAT_data_003a;
    if (-1 < iVar9 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
      DAT_data_0033 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
    }
    DAT_data_0030 = 0xf1;
    DAT_data_0031 = 0xfb;
    if (DAT_data_005c == 0) {
      PA1 = DAT_data_0033;
      PA2 = 0;
    }
    else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
      PA1 = DAT_data_000a;
      PA2 = DAT_data_000b;
    }
    if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
      iVar9 = (uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005d * -0x10000;
      if (iVar9 < 1) goto LAB_prog_08a5;
      DAT_data_0039 = (ushort)((uint)iVar9 >> 0x10);
      DAT_data_003b = PA3;
      PA3 = DAT_data_0001;
      if ((DAT_data_0058 != 0) && (0 < (int)((uint)DAT_data_003b << 0x10))) goto LAB_prog_0ab3;
      if (DAT_data_0059 != 0) goto code_p0x0ae7;
    }
    else {
      iVar9 = (uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005e * -0x10000;
LAB_prog_08a5:
      DAT_data_0039 = (ushort)((uint)iVar9 >> 0x10);
      DAT_data_003b = PA3;
      PA3 = wData0000;
      if ((DAT_data_0058 != 0) && (0 < (int)((uint)DAT_data_003b << 0x10))) goto LAB_prog_0ab3;
    }
    if (DAT_data_004b != 0) goto LAB_prog_0ab3;
    if (DAT_data_004c != 0) {
code_p0x0ae7:
      DAT_data_0039 = DAT_data_0003;
      DAT_data_0076 = 0;
LAB_prog_0aeb:
      DAT_data_003e = DAT_data_0066;
      DAT_data_003f = DAT_data_0067;
      uVar15 = (uint)DAT_data_003d;
      DAT_data_0078 = 0;
      DAT_data_0079 = 0;
      uVar10 = (uint)DAT_data_0046 * 0x10000 + (uint)DAT_data_0047;
      uVar12 = (uint)DAT_data_0048 * 0x10000 + (uint)DAT_data_0049;
      uVar13 = (uint)DAT_data_006d * 0x10000 + (uint)DAT_data_006e;
      DAT_data_0038 = 1;
      uVar16 = 0x6f;
      uVar14 = uVar10;
LAB_prog_0b1b:
      while( true ) {
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
        DAT_data_0037 = (undefined2)iVar11;
        DAT_data_007a = (ushort)(uVar13 >> 0x10);
        DAT_data_007b = (undefined2)uVar13;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
        DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
        DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
        uVar10 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        uVar14 = (uVar14 & 0xffff0000) + (uVar14 & 0xffff) + (int)*(short *)(uVar16 + 1 & 0xff);
        DAT_data_0016 = (word)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0033;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = DAT_data_0016;
          PA2 = DAT_data_0017;
        }
        PA0 = DAT_data_0010;
        PA7 = DAT_data_0011;
        DAT_data_001c = PA4;
        DAT_data_001d = PA4;
        DAT_data_001a =
             (word)((uint)((int)(short)((uint)((((int)(short)DAT_data_0014 *
                                                 (int)(short)DAT_data_001d -
                                                (int)(short)DAT_data_0014 *
                                                (int)(short)DAT_data_001c) +
                                               (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10) *
                           (int)(short)DAT_data_003c * 2) >> 0x10);
        PA6 = DAT_data_001a;
        uVar4 = (uint)DAT_data_003c;
        uVar3 = uVar15 & 0xffff;
        iVar9 = uVar4 * 0x10000 + uVar3;
        uVar15 = iVar9 + (int)DAT_data_003e * 0x800;
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        if (SCARRY4(uVar4 * 0x10000,uVar3) || SCARRY4(iVar9,(int)DAT_data_003e * 0x800)) break;
        if (DAT_data_004f != 0) goto LAB_prog_0b9a;
        if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
          if (0 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                        (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff))) {
            iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                    (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
            if (iVar9 < 0) {
              iVar9 = -iVar9;
            }
            iVar9 = iVar9 + (int)DAT_data_0052 * -0x200;
            goto joined_p0x0b81;
          }
          goto LAB_prog_0b9a;
        }
        if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                       (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff))) goto LAB_prog_0b9a;
        iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) + (uint)DAT_data_000a * -0x10000)
                - (uVar10 & 0xffff);
        if (iVar9 < 0) {
          iVar9 = -iVar9;
        }
        iVar9 = iVar9 + (int)DAT_data_0052 * -0x200;
joined_p0x0b81:
        if (-1 < iVar9) {
          FUN_prog_0d58();
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
        DAT_data_0037 = (undefined2)iVar11;
        DAT_data_007a = (ushort)(uVar13 >> 0x10);
        DAT_data_007b = (undefined2)uVar13;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        DAT_data_0016 = (word)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        wVar7 = PA5;
        if ((wVar7 & DAT_data_0005) != 0) {
          wVar1 = PA6;
          *(word *)(wVar7 & 0xff) = wVar1;
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
        }
      }
      while( true ) {
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
        DAT_data_0037 = (undefined2)iVar11;
        DAT_data_0016 = (word)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        DAT_data_007a = (ushort)(uVar13 >> 0x10);
        DAT_data_007b = (undefined2)uVar13;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        if (DAT_data_004f != 0) break;
        if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
          if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                    (uint)DAT_data_007a * -0x10000) - (uVar13 & 0xffff)) < 1) break;
          iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
          if (iVar9 < 0) {
            iVar9 = -iVar9;
          }
          if (iVar9 + (int)DAT_data_0052 * -0x200 < 0) goto LAB_prog_0cce;
LAB_prog_0c34:
          DAT_data_003c = (ushort)(uVar15 >> 0x10);
          DAT_data_003d = (ushort)uVar15;
          DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
          DAT_data_0037 = (undefined2)iVar11;
          DAT_data_007a = (ushort)(uVar13 >> 0x10);
          DAT_data_007b = (undefined2)uVar13;
          DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
          DAT_data_0035 = (undefined2)uVar8;
          DAT_data_0016 = (word)(uVar14 >> 0x10);
          DAT_data_0017 = (word)uVar14;
          DAT_data_000e = (ushort)(uVar12 >> 0x10);
          DAT_data_000f = (undefined2)uVar12;
          DAT_data_000a = (ushort)(uVar10 >> 0x10);
          DAT_data_000b = (word)uVar10;
          FUN_prog_0d58();
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        else {
          if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                         (uint)DAT_data_007a * -0x10000) - (uVar13 & 0xffff))) break;
          iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
          if (iVar9 < 0) {
            iVar9 = -iVar9;
          }
          if (-1 < iVar9 + (int)DAT_data_0052 * -0x200) goto LAB_prog_0c34;
LAB_prog_0cce:
          wVar7 = PA5;
          if ((wVar7 & DAT_data_0005) != 0) {
            wVar1 = PA6;
            *(word *)(wVar7 & 0xff) = wVar1;
            uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
            iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
            uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
            uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_003d = (ushort)uVar15;
          DAT_data_007a = (ushort)(uVar13 >> 0x10);
          DAT_data_000a = (ushort)(uVar10 >> 0x10);
          DAT_data_000b = (word)uVar10;
          DAT_data_0019 = PA7;
          iVar9 = (uint)DAT_data_0019 * 0x10000;
          if (iVar9 < 0) {
            iVar9 = (uint)DAT_data_0019 * -0x10000;
          }
          DAT_data_003a = (word)((uint)iVar9 >> 0x10);
          DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
          DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
          DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
          DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
          uVar10 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff) +
                   (int)*(short *)(uVar16 & 0xff);
          uVar5 = (ushort)(uVar10 >> 0x10);
          uVar14 = (uVar14 & 0xffff0000) + (uVar14 & 0xffff) + (int)*(short *)(uVar16 + 1 & 0xff);
          uVar2 = (ushort)(uVar14 >> 0x10);
          DAT_data_003b = PA3;
          PA3 = DAT_data_0076;
          iVar9 = (int)(short)DAT_data_0033;
          DAT_data_0033 = DAT_data_003a;
          if (-1 < iVar9 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
            DAT_data_0033 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
          }
          PA0 = DAT_data_0010;
          PA7 = DAT_data_0011;
          DAT_data_001c = PA4;
          DAT_data_001d = PA4;
          DAT_data_001a =
               (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                              (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                             (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
          PA6 = DAT_data_001a;
          if ((DAT_data_0058 & DAT_data_003b) != 0) goto LAB_prog_0ab3;
          if ((DAT_data_0059 & DAT_data_0076) != 0) goto code_p0x0ae7;
          if (DAT_data_004f != 0) break;
          if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
            if ((int)(((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) + (uint)DAT_data_007a * -0x10000) -
                     (uVar13 & 0xffff)) < 1) break;
            iVar9 = ((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) + (uint)uVar5 * -0x10000) -
                    (uVar10 & 0xffff);
            if (iVar9 < 0) {
              iVar9 = -iVar9;
            }
            iVar9 = iVar9 + (int)DAT_data_0052 * -0x200;
          }
          else {
            if (-1 < (int)(((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) +
                           (uint)DAT_data_007a * -0x10000) - (uVar13 & 0xffff))) break;
            iVar9 = ((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) + (uint)uVar5 * -0x10000) -
                    (uVar10 & 0xffff);
            if (iVar9 < 0) {
              iVar9 = -iVar9;
            }
            iVar9 = iVar9 + (int)DAT_data_0052 * -0x200;
          }
          if (-1 < iVar9) goto LAB_prog_0c34;
        }
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
        DAT_data_0037 = (undefined2)iVar11;
        DAT_data_007a = (ushort)(uVar13 >> 0x10);
        DAT_data_007b = (undefined2)uVar13;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        DAT_data_0016 = (word)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        wVar7 = PA5;
        if ((wVar7 & DAT_data_0005) != 0) {
          wVar1 = PA6;
          *(word *)(wVar7 & 0xff) = wVar1;
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        DAT_data_0019 = PA7;
        iVar9 = (uint)DAT_data_0019 * 0x10000;
        if (iVar9 < 0) {
          iVar9 = (uint)DAT_data_0019 * -0x10000;
        }
        DAT_data_003a = (word)((uint)iVar9 >> 0x10);
        DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
        DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
        DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
        uVar10 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
        uVar14 = (uVar14 & 0xffff0000) + (uVar14 & 0xffff) + (int)*(short *)(uVar16 + 1 & 0xff);
        iVar9 = (int)(short)DAT_data_0033;
        DAT_data_0033 = DAT_data_003a;
        if (-1 < iVar9 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
          DAT_data_0033 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
        }
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0033;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = (word)(uVar14 >> 0x10);
          PA2 = (word)uVar14;
        }
        PA0 = DAT_data_0010;
        PA7 = DAT_data_0011;
        DAT_data_001c = PA4;
        DAT_data_001d = PA4;
        DAT_data_001a =
             (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                            (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                           (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
        PA6 = DAT_data_001a;
        if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
          iVar9 = (uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005d * -0x10000;
          if (iVar9 < 1) {
            DAT_data_0076 = 0;
          }
          else {
            DAT_data_0039 = (ushort)((uint)iVar9 >> 0x10);
            DAT_data_0076 = 1;
          }
        }
        else {
          DAT_data_0039 =
               (ushort)((uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005e * -0x10000 >> 0x10);
          DAT_data_0076 = 0;
        }
      }
LAB_prog_0b9a:
      DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
      DAT_data_0037 = (undefined2)iVar11;
      DAT_data_007a = (ushort)(uVar13 >> 0x10);
      DAT_data_007b = (undefined2)uVar13;
      DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
      DAT_data_0035 = (undefined2)uVar8;
      DAT_data_000e = (ushort)(uVar12 >> 0x10);
      DAT_data_000f = (undefined2)uVar12;
      DAT_data_003c = (ushort)(uVar15 >> 0x10);
      DAT_data_003d = (ushort)uVar15;
      DAT_data_0016 = (word)(uVar14 >> 0x10);
      DAT_data_0017 = (word)uVar14;
      DAT_data_000a = (ushort)(uVar10 >> 0x10);
      DAT_data_000b = (word)uVar10;
      wVar7 = PA5;
      if ((wVar7 & DAT_data_0005) != 0) {
        wVar1 = PA6;
        *(word *)(wVar7 & 0xff) = wVar1;
        iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
        uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
        uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
        uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
        uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
        uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
        uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
      }
      DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
      DAT_data_0037 = (undefined2)iVar11;
      DAT_data_007a = (ushort)(uVar13 >> 0x10);
      DAT_data_007b = (undefined2)uVar13;
      DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
      DAT_data_0035 = (undefined2)uVar8;
      DAT_data_000e = (ushort)(uVar12 >> 0x10);
      DAT_data_000f = (undefined2)uVar12;
      DAT_data_003c = (ushort)(uVar15 >> 0x10);
      DAT_data_003d = (ushort)uVar15;
      DAT_data_000a = (ushort)(uVar10 >> 0x10);
      DAT_data_000b = (word)uVar10;
      DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
      DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
      DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
      DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
      uVar10 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
      DAT_data_000a = (ushort)(uVar10 >> 0x10);
      DAT_data_000b = (word)uVar10;
      uVar14 = (uVar14 & 0xffff0000) + (uVar14 & 0xffff) + (int)*(short *)(uVar16 + 1 & 0xff);
      DAT_data_0016 = (word)(uVar14 >> 0x10);
      DAT_data_0017 = (word)uVar14;
      if (DAT_data_004b == 0) {
        if (DAT_data_004c == 0) {
          DAT_data_0077 = DAT_data_003f;
        }
        else {
          DAT_data_0079 = DAT_data_004c;
          DAT_data_0077 = DAT_data_0068;
        }
      }
      else {
        DAT_data_0078 = DAT_data_004b;
        DAT_data_0077 = DAT_data_0068;
      }
      if (DAT_data_005c == 0) {
        PA1 = DAT_data_0033;
        PA2 = DAT_data_0038;
      }
      else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
        PA1 = DAT_data_0016;
        PA2 = DAT_data_0017;
      }
      PA0 = DAT_data_0010;
      PA7 = DAT_data_0011;
      DAT_data_001c = PA4;
      DAT_data_001d = PA4;
      DAT_data_001a =
           (word)((uint)((int)(short)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d
                                              - (int)(short)DAT_data_0014 *
                                                (int)(short)DAT_data_001c) +
                                             (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10) *
                         (int)(short)DAT_data_003c * 2) >> 0x10);
      PA6 = DAT_data_001a;
      uVar15 = (uint)DAT_data_003c * 0x10000 + (uVar15 & 0xffff) +
               (int)(short)DAT_data_003f * -0x800;
      if (0 < (int)uVar15) {
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        DAT_data_003f = DAT_data_0077;
        if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
          if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                    (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff)) < 1) goto LAB_prog_0c0d;
        }
        else if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                            (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff))) {
LAB_prog_0c0d:
          DAT_data_003f = DAT_data_0068;
        }
        iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) + (uint)DAT_data_000a * -0x10000)
                - (uVar10 & 0xffff);
        if (iVar9 < 0) {
          iVar9 = -iVar9;
        }
        if (-1 < iVar9 + (int)DAT_data_0052 * -0x200) {
          FUN_prog_0d58();
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar13 = CONCAT22(DAT_data_007a,DAT_data_007b);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        goto LAB_prog_0b9a;
      }
      if (DAT_data_0078 == 0) {
        if (DAT_data_0079 != 0) goto code_p0x0ae7;
        if (DAT_data_0069 == 0) goto code_p0x0c22;
      }
      else {
LAB_prog_0ab3:
        DAT_data_0039 = DAT_data_0003;
        DAT_data_0076 = 0;
      }
      uVar16 = 0x40;
      DAT_data_0078 = 0;
      DAT_data_0079 = 0;
      uVar15 = (uint)DAT_data_003d;
      DAT_data_003e = DAT_data_0064;
      DAT_data_003f = DAT_data_0065;
      uVar10 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
      uVar12 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
      uVar13 = (uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006c;
      DAT_data_0038 = 1;
      uVar14 = uVar10;
      goto LAB_prog_0b1b;
    }
    if (DAT_data_0050 != 0) {
      DAT_data_0038 = 4;
      DAT_data_0026 = 0;
      uVar10 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
      while( true ) {
        DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
        DAT_data_0037 = (undefined2)iVar11;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        wVar7 = PA5;
        if ((wVar7 & DAT_data_0005) != 0) {
          wVar1 = PA6;
          *(word *)(wVar7 & 0xff) = wVar1;
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        uVar16 = DAT_data_000b << 6 & DAT_data_0003;
        iVar9 = ((int)DAT_data_0040 * 0x8000 - (int)DAT_data_0051 * (int)DAT_data_0040) +
                (int)DAT_data_0051 * (int)DAT_data_0026;
        if (iVar9 < 0) {
          iVar9 = iVar9 + (short)DAT_data_0003;
        }
        DAT_data_0026 = (short)((uint)(iVar9 << 1) >> 0x10);
        PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
              (short)((int)(short)DAT_data_000a << 7);
        wVar7 = PA4;
        wVar1 = PA4;
        PA6 = (word)((uint)((((int)(short)uVar16 * (int)(short)wVar1 -
                             (int)(short)uVar16 * (int)(short)wVar7) + (int)(short)wVar7 * 0x8000) *
                           2) >> 0x10);
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0032;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = DAT_data_000a;
          PA2 = DAT_data_000b;
        }
        uVar10 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff) + (int)DAT_data_0026;
        uVar16 = (ushort)(uVar10 >> 0x10);
        if (DAT_data_0050 == 0) break;
        if ((int)(((uint)uVar16 * 0x10000 + (uVar10 & 0xffff) + (uint)DAT_data_0060 * -0x10000) -
                 (uint)DAT_data_0061) < 1) {
          uVar10 = (uint)DAT_data_0060 * 0x10000 + (uint)DAT_data_0061;
        }
        else if (-1 < (int)(((uint)uVar16 * 0x10000 + (uVar10 & 0xffff) +
                            (uint)DAT_data_0062 * -0x10000) - (uint)DAT_data_0063)) {
          uVar10 = (uint)DAT_data_0062 * 0x10000 + (uint)DAT_data_0063;
        }
      }
      uVar10 = 0;
      goto LAB_prog_084e;
    }
  } while (DAT_data_004d == 0);
  DAT_data_0038 = 2;
  uVar10 = (uVar8 & 0xffff0000) + (uVar8 & 0xffff);
LAB_prog_08e8:
  DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
  DAT_data_0037 = (undefined2)iVar11;
  DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
  DAT_data_0035 = (undefined2)uVar8;
  DAT_data_000a = (ushort)(uVar10 >> 0x10);
  DAT_data_000b = (word)uVar10;
  wVar7 = PA5;
  if ((wVar7 & DAT_data_0005) != 0) {
    wVar1 = PA6;
    *(word *)(wVar7 & 0xff) = wVar1;
    iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
    uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
    uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
  }
  wVar7 = PA7;
  iVar9 = (uint)wVar7 * 0x10000;
  if (iVar9 < 0) {
    iVar9 = (uint)wVar7 * -0x10000;
  }
  uVar16 = (ushort)((uint)iVar9 >> 0x10);
  iVar9 = (int)(short)DAT_data_0033;
  DAT_data_0033 = uVar16;
  if (-1 < iVar9 * DAT_data_0055 + (int)(short)uVar16 * -0x8000) {
    DAT_data_0033 = (ushort)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
  }
  if (DAT_data_005c == 0) {
    PA1 = DAT_data_0033;
    PA2 = DAT_data_0038;
  }
  PA6 = wVar7;
  wVar7 = PA3;
  PA3 = (word)((uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_0056 * -0x10000 >> 0x10);
  uVar10 = (uVar10 & 0xffff0000) + (uVar10 & 0xffff) + (int)(short)DAT_data_0001 * 0x200;
  if (0 < (int)((uVar10 + (uint)DAT_data_0062 * -0x10000) - (uint)DAT_data_0063)) {
    uVar10 = (uVar8 & 0xffff0000) + (uVar8 & 0xffff);
  }
  DAT_data_000a = (ushort)(uVar10 >> 0x10);
  if (DAT_data_005a != 0) {
    if (0 < (int)((uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_0056 * -0x10000)) {
      uVar12 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
      iVar11 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff);
      uVar10 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 + (int)DAT_data_0057 * 0x200;
LAB_prog_098b:
      do {
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        DAT_data_0036 = (undefined2)((uint)iVar11 >> 0x10);
        DAT_data_0037 = (undefined2)iVar11;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        wVar7 = PA5;
        if ((wVar7 & DAT_data_0005) != 0) {
          wVar1 = PA6;
          *(word *)(wVar7 & 0xff) = wVar1;
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          iVar11 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (word)uVar10;
        wVar7 = PA7;
        iVar9 = (uint)wVar7 * 0x10000;
        if (iVar9 < 0) {
          iVar9 = (uint)wVar7 * -0x10000;
        }
        wVar1 = (word)((uint)iVar9 >> 0x10);
        iVar9 = (int)(short)DAT_data_0033;
        DAT_data_0033 = wVar1;
        if (-1 < iVar9 * DAT_data_0055 + (int)(short)wVar1 * -0x8000) {
          DAT_data_0033 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
        }
        uVar10 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff) +
                 (int)(short)DAT_data_0001 * 0x200;
        wVar1 = (word)(uVar10 >> 0x10);
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0032;
          PA2 = 3;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = wVar1;
          PA2 = (word)uVar10;
        }
        PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
              (short)((int)(short)DAT_data_000a << 7);
        PA4 = wVar7;
        PA6 = wVar7;
      } while ((DAT_data_004f == 0) &&
              ((int)(((uint)wVar1 * 0x10000 + (uVar10 & 0xffff) + (uVar12 >> 0x10) * -0x10000) -
                    (uVar12 & 0xffff)) < 0));
      goto LAB_prog_084e;
    }
    if (0 < (int)((uint)wVar7 << 0x10)) {
      uVar12 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
      iVar11 = (uint)DAT_data_000a * 0x10000 + (uVar10 & 0xffff);
      uVar10 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 + (int)DAT_data_0057 * 0x200;
      goto LAB_prog_098b;
    }
  }
  if (DAT_data_004e != 0) {
    uVar12 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
    uVar10 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
    goto LAB_prog_098b;
  }
  if (DAT_data_004f != 0) goto LAB_prog_084e;
  goto LAB_prog_08e8;
code_p0x0c22:
  if (DAT_data_006a == 0) {
    uVar10 = (uint)DAT_data_000e * 0x10000 + (uVar12 & 0xffff);
    goto LAB_prog_084e;
  }
  goto LAB_prog_0aeb;
}


// ===== FUN_prog_0d58 @ prog:0d58 =====

void FUN_prog_0d58(void)

{
  word wVar1;
  uint uVar2;
  bool bVar3;
  ushort uVar26;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  word wVar27;
  int iVar14;
  uint uVar15;
  int iVar16;
  int iVar17;
  uint uVar18;
  int iVar19;
  int iVar20;
  uint uVar21;
  uint uVar22;
  uint uVar23;
  uint uVar24;
  uint uVar25;
  ushort in_AR0;
  ushort uVar28;
  bool bVar29;
  undefined2 uStackfe;
  
  wVar1 = PA5;
  if ((wVar1 & DAT_data_0005) != 0) {
    wVar27 = PA6;
    *(word *)(wVar1 & 0xff) = wVar27;
  }
  uVar26 = DAT_data_000b << 6 & DAT_data_0003;
  iVar6 = (uint)*(ushort *)(in_AR0 & 0xff) * 0x10000;
  uVar28 = in_AR0 + 1;
  if (iVar6 < 0) {
    iVar6 = (uint)*(ushort *)(in_AR0 & 0xff) * -0x10000;
  }
  iVar7 = (uint)*(ushort *)(uVar28 & 0xff) * 0x10000;
  if (iVar7 < 0) {
    iVar7 = (uint)*(ushort *)(uVar28 & 0xff) * -0x10000;
  }
  iVar6 = (int)(short)((uint)(iVar7 + iVar6) >> 0x10) * (int)DAT_data_007f;
  DAT_data_004a = (ushort)((uint)(iVar6 * 2) >> 0x10);
  if ((int)(iVar6 + (uint)DAT_data_007e * -0x10000) < 0) {
    DAT_data_004a = DAT_data_007e;
  }
  PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
  PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
        (short)((int)(short)DAT_data_000a << 7);
  wVar1 = PA4;
  wVar27 = PA4;
  PA6 = (word)((uint)((int)(short)((uint)((((int)(short)uVar26 * (int)(short)wVar27 -
                                           (int)(short)uVar26 * (int)(short)wVar1) +
                                          (int)(short)wVar1 * 0x8000) * 2) >> 0x10) *
                      (int)(short)DAT_data_003c * 2) >> 0x10);
  uVar8 = (uint)DAT_data_000a * 0x10000 + (uint)DAT_data_000b + (int)*(short *)(in_AR0 & 0xff);
  DAT_data_000a = (ushort)(uVar8 >> 0x10);
  DAT_data_000b = (ushort)uVar8;
  uVar9 = (uint)DAT_data_0016 * 0x10000 + (uint)DAT_data_0017 + (int)*(short *)(uVar28 & 0xff);
  DAT_data_0016 = (word)(uVar9 >> 0x10);
  DAT_data_0017 = (ushort)uVar9;
  DAT_data_007c = 0;
  if (DAT_data_004f != 0) {
    DAT_data_007c = DAT_data_004f;
  }
  uVar10 = (uint)DAT_data_0030;
  iVar6 = (int)DAT_data_0031;
  iVar11 = uVar10 + iVar6;
  DAT_data_0031 = (short)iVar11;
  iVar7 = (int)(short)DAT_data_0030;
  DAT_data_0030 = DAT_data_0031 + DAT_data_0030;
  wVar1 = PA5;
  if ((wVar1 & DAT_data_0005) != 0) {
    wVar27 = PA6;
    *(word *)(wVar1 & 0xff) = wVar27;
    uVar9 = CONCAT22(DAT_data_0016,DAT_data_0017);
    uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
  }
  DAT_data_000a = (ushort)(uVar8 >> 0x10);
  DAT_data_000b = (ushort)uVar8;
  uVar12 = (int)(short)DAT_data_000a << 7;
  wVar1 = (word)(uVar12 >> 0x10);
  uVar13 = ((int)(short)DAT_data_000b & 0x1ffffffU) >> 9 & 0x7f;
  wVar27 = (short)uVar13 + (short)uVar12;
  uVar26 = DAT_data_000b << 6 & DAT_data_0003;
  iVar14 = (int)(short)wVar1 << 10;
  DAT_data_002b = (undefined2)((uint)iVar14 >> 0x10);
  DAT_data_002c =
       ((ushort)iVar14 |
       (uData0002 << 10 ^ uData0002) & (ushort)((uint)((int)(short)wVar27 << 10) >> 0x10)) &
       DAT_data_002e;
  DAT_data_0021 = 0;
  iVar14 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff);
  uVar15 = iVar14 + *(short *)(in_AR0 & 0xff);
  PA0 = wVar1;
  PA7 = wVar27;
  wVar27 = PA4;
  wVar1 = PA4;
  PA0 = DAT_data_002d;
  PA7 = DAT_data_002c;
  DAT_data_0027 = PA4;
  DAT_data_0028 = PA4;
  DAT_data_0029 = PA4;
  DAT_data_002a = PA4;
  iVar16 = (int)(short)uVar26 * (int)(short)wVar1 - (int)(short)uVar26 * (int)(short)wVar27;
  wVar1 = (word)((uint)((int)(short)((uint)((iVar16 + (int)(short)wVar27 * 0x8000) * 2) >> 0x10) *
                        (int)(short)DAT_data_003c * 2) >> 0x10);
  iVar17 = (uVar9 & 0xffff0000) + (uVar9 & 0xffff);
  uVar18 = iVar17 + *(short *)(uVar28 & 0xff);
  iVar19 = (uVar18 & 0xffff0000) + (uVar18 & 0xffff);
  iVar20 = iVar19 + (uint)DAT_data_000a * -0x10000;
  bVar29 = (((((((((SCARRY4(uVar10,iVar6) || SCARRY4(iVar11,iVar7)) ||
                  SCARRY4(uVar13,uVar12 & 0xffff)) ||
                 SCARRY4((uint)DAT_data_000a * 0x10000,uVar8 & 0xffff)) ||
                SCARRY4(iVar14,(int)*(short *)(in_AR0 & 0xff))) ||
               SCARRY4(iVar16,(int)(short)wVar27 * 0x8000)) ||
              SCARRY4(uVar9 & 0xffff0000,uVar9 & 0xffff)) ||
             SCARRY4(iVar17,(int)*(short *)(uVar28 & 0xff))) ||
            SCARRY4(uVar18 & 0xffff0000,uVar18 & 0xffff)) ||
           SBORROW4(iVar19,(uint)DAT_data_000a * 0x10000)) || SBORROW4(iVar20,uVar8 & 0xffff);
  if ((int)(iVar20 - (uVar8 & 0xffff)) < 0) {
    bVar29 = bVar29 || SBORROW4((uint)DAT_data_002a * 0x10000,(uint)DAT_data_0054 * 0x10000);
    if ((int)((uint)DAT_data_002a * 0x10000 + (uint)DAT_data_0054 * -0x10000) < 0) {
      iVar6 = (int)(short)DAT_data_0030 * (int)DAT_data_0053;
      if (iVar6 < 0) {
        iVar6 = -iVar6;
      }
      PA6 = wVar1;
      bVar29 = bVar29 || SCARRY4(iVar6,(int)DAT_data_0053 * 0x8000);
      DAT_data_0015 = (word)((uint)(iVar6 + (int)DAT_data_0053 * 0x8000) >> 0x10);
    }
    else {
      PA6 = wVar1;
      DAT_data_0015 = DAT_data_0029;
    }
  }
  else {
    bVar29 = bVar29 || SBORROW4(0,(int)(short)DAT_data_0027);
    PA6 = wVar1;
    DAT_data_0015 = -DAT_data_0027;
  }
  iVar6 = (uVar15 & 0xffff0000) + (uVar15 & 0xffff);
  uVar8 = iVar6 + (int)(short)DAT_data_0015 * -0x200;
  bVar29 = (bool)(bVar29 | SCARRY4(uVar15 & 0xffff0000,uVar15 & 0xffff) |
                 SBORROW4(iVar6,(int)(short)DAT_data_0015 * 0x200));
  do {
    DAT_data_000a = (ushort)(uVar8 >> 0x10);
    DAT_data_000b = (ushort)uVar8;
    DAT_data_0016 = (word)(uVar18 >> 0x10);
    DAT_data_0017 = (ushort)uVar18;
    DAT_data_000c = (short)(uVar15 >> 0x10);
    DAT_data_000d = (short)uVar15;
    wVar1 = PA5;
    if ((wVar1 & DAT_data_0005) != 0) {
      wVar27 = PA6;
      *(word *)(wVar1 & 0xff) = wVar27;
      uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
      uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
      uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
    }
    iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
    uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
    uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
    DAT_data_000c = (short)(uVar15 >> 0x10);
    DAT_data_000d = (short)uVar15;
    DAT_data_000a = (ushort)(uVar8 >> 0x10);
    DAT_data_000b = (ushort)uVar8;
    uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
    uVar21 = (int)(short)DAT_data_000a << 7;
    DAT_data_0010 = (word)(uVar21 >> 0x10);
    uVar22 = ((int)(short)DAT_data_000b & 0x1ffffffU) >> 9 & 0x7f;
    DAT_data_0011 = (short)uVar22 + (short)uVar21;
    uVar23 = (int)DAT_data_000c << 7;
    DAT_data_0012 = (word)(uVar23 >> 0x10);
    DAT_data_0006 = (ushort)((uint)((int)DAT_data_000d << 7) >> 0x10);
    uVar24 = (uint)DAT_data_0006 & 0x7f;
    DAT_data_0013 = (short)uVar24 + (short)uVar23;
    DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
    uVar12 = (uint)DAT_data_000a;
    uVar9 = uVar8 & 0xffff;
    iVar11 = uVar12 * 0x10000 + uVar9;
    uVar8 = iVar11 + *(short *)(in_AR0 & 0xff);
    DAT_data_000a = (short)(uVar8 >> 0x10);
    DAT_data_000b = (short)uVar8;
    uVar15 = uVar8 + (int)(short)DAT_data_0015 * 0x200;
    DAT_data_000c = (short)(uVar15 >> 0x10);
    DAT_data_000d = (short)uVar15;
    uVar25 = uVar18 & 0xffff0000;
    uVar10 = uVar18 & 0xffff;
    iVar14 = uVar25 + uVar10;
    iVar6 = (int)*(short *)(in_AR0 + 1 & 0xff);
    uVar18 = iVar14 + iVar6;
    DAT_data_0016 = (short)(uVar18 >> 0x10);
    DAT_data_0017 = (short)uVar18;
    PA0 = DAT_data_0010;
    PA7 = DAT_data_0011;
    DAT_data_001c = PA4;
    DAT_data_001d = PA4;
    PA0 = DAT_data_0012;
    PA7 = DAT_data_0013;
    DAT_data_001f = PA4;
    DAT_data_0020 = PA4;
    iVar16 = (int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
             (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c;
    DAT_data_001b = (short)((uint)((iVar16 + (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
    iVar17 = (int)(short)DAT_data_0014 * (int)(short)DAT_data_0020 -
             (int)(short)DAT_data_0014 * (int)(short)DAT_data_001f;
    DAT_data_001e = (short)((uint)((iVar17 + (int)(short)DAT_data_001f * 0x8000) * 2) >> 0x10);
    iVar19 = (int)(short)DAT_data_0021 * (int)DAT_data_001b -
             (int)(short)DAT_data_0021 * (int)DAT_data_001e;
    DAT_data_001a =
         (word)((uint)((int)(short)((uint)((iVar19 + (int)DAT_data_001e * 0x8000) * 2) >> 0x10) *
                       (int)(short)DAT_data_003c * 2) >> 0x10);
    if (DAT_data_004f != 0) {
      DAT_data_007c = DAT_data_004f;
    }
    PA6 = DAT_data_001a;
    uVar2 = (uint)DAT_data_0021;
    DAT_data_0021 = (ushort)(uVar2 * 0x10000 + (uint)DAT_data_004a * 0x10000 >> 0x10);
    bVar3 = !bVar29;
    bVar29 = false;
  } while (((((((((((bVar3 && !SCARRY4(uVar22,uVar21 & 0xffff)) && !SCARRY4(uVar24,uVar23 & 0xffff))
                  && !SCARRY4(uVar12 * 0x10000,uVar9)) &&
                 !SCARRY4(iVar11,(int)*(short *)(in_AR0 & 0xff))) &&
                !SCARRY4(uVar8,(int)(short)DAT_data_0015 * 0x200)) && !SCARRY4(uVar25,uVar10)) &&
              !SCARRY4(iVar14,iVar6)) && !SCARRY4(iVar16,(int)(short)DAT_data_001c * 0x8000)) &&
            !SCARRY4(iVar17,(int)(short)DAT_data_001f * 0x8000)) &&
           !SCARRY4(iVar19,(int)DAT_data_001e * 0x8000)) &&
           !SCARRY4(uVar2 * 0x10000,(uint)DAT_data_004a * 0x10000));
  if (DAT_data_007c == 0) {
    return;
  }
LAB_prog_0b9a:
  do {
    DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
    DAT_data_0037 = (undefined2)iVar7;
    DAT_data_007a = (ushort)(uVar4 >> 0x10);
    DAT_data_007b = (undefined2)uVar4;
    DAT_data_000e = (ushort)(uVar13 >> 0x10);
    DAT_data_000f = (undefined2)uVar13;
    DAT_data_000c = (short)(uVar15 >> 0x10);
    DAT_data_000d = (short)uVar15;
    DAT_data_003c = (ushort)(uVar5 >> 0x10);
    DAT_data_003d = (ushort)uVar5;
    DAT_data_0016 = (word)(uVar18 >> 0x10);
    DAT_data_0017 = (ushort)uVar18;
    DAT_data_000a = (ushort)(uVar8 >> 0x10);
    DAT_data_000b = (ushort)uVar8;
    wVar1 = PA5;
    if ((wVar1 & DAT_data_0005) != 0) {
      wVar27 = PA6;
      *(word *)(wVar1 & 0xff) = wVar27;
      iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
      uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
      uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
      uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
      uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
      uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
      uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
    }
    DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
    DAT_data_0037 = (undefined2)iVar7;
    DAT_data_007a = (ushort)(uVar4 >> 0x10);
    DAT_data_007b = (undefined2)uVar4;
    DAT_data_000e = (ushort)(uVar13 >> 0x10);
    DAT_data_000f = (undefined2)uVar13;
    DAT_data_003c = (ushort)(uVar5 >> 0x10);
    DAT_data_003d = (ushort)uVar5;
    DAT_data_000c = (short)(uVar15 >> 0x10);
    DAT_data_000d = (short)uVar15;
    DAT_data_000a = (ushort)(uVar8 >> 0x10);
    DAT_data_000b = (ushort)uVar8;
    DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
    DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
    DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
    DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
    uVar8 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff) + (int)*(short *)(in_AR0 & 0xff);
    DAT_data_000a = (ushort)(uVar8 >> 0x10);
    DAT_data_000b = (ushort)uVar8;
    uVar18 = (uVar18 & 0xffff0000) + (uVar18 & 0xffff) + (int)*(short *)(in_AR0 + 1 & 0xff);
    DAT_data_0016 = (word)(uVar18 >> 0x10);
    DAT_data_0017 = (ushort)uVar18;
    if (DAT_data_004b == 0) {
      if (DAT_data_004c == 0) {
        DAT_data_0077 = DAT_data_003f;
      }
      else {
        DAT_data_0079 = DAT_data_004c;
        DAT_data_0077 = DAT_data_0068;
      }
    }
    else {
      DAT_data_0078 = DAT_data_004b;
      DAT_data_0077 = DAT_data_0068;
    }
    if (DAT_data_005c == 0) {
      PA1 = DAT_data_0033;
      PA2 = DAT_data_0038;
    }
    else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
      PA1 = DAT_data_0016;
      PA2 = DAT_data_0017;
    }
    PA0 = DAT_data_0010;
    PA7 = DAT_data_0011;
    DAT_data_001c = PA4;
    DAT_data_001d = PA4;
    DAT_data_001a =
         (word)((uint)((int)(short)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                                            (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                                           (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10) *
                       (int)(short)DAT_data_003c * 2) >> 0x10);
    PA6 = DAT_data_001a;
    uVar5 = (uint)DAT_data_003c * 0x10000 + (uVar5 & 0xffff) + (int)DAT_data_003f * -0x800;
    if ((int)uVar5 < 1) {
      if (DAT_data_0078 != 0) break;
      if (DAT_data_0079 != 0) {
code_p0x0ae7:
        DAT_data_0039 = DAT_data_0003;
        DAT_data_0076 = 0;
LAB_prog_0aeb:
        DAT_data_003e = DAT_data_0066;
        DAT_data_003f = DAT_data_0067;
        uVar5 = (uint)DAT_data_003d;
        DAT_data_0078 = 0;
        DAT_data_0079 = 0;
        uVar8 = (uint)DAT_data_0046 * 0x10000 + (uint)DAT_data_0047;
        uVar13 = (uint)DAT_data_0048 * 0x10000 + (uint)DAT_data_0049;
        uVar4 = (uint)DAT_data_006d * 0x10000 + (uint)DAT_data_006e;
        DAT_data_0038 = 1;
        in_AR0 = 0x6f;
        uVar18 = uVar8;
LAB_prog_0b1b:
        do {
          DAT_data_000c = (short)(uVar15 >> 0x10);
          DAT_data_000d = (short)uVar15;
          DAT_data_003c = (ushort)(uVar5 >> 0x10);
          DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
          DAT_data_0037 = (undefined2)iVar7;
          DAT_data_007a = (ushort)(uVar4 >> 0x10);
          DAT_data_007b = (undefined2)uVar4;
          DAT_data_000e = (ushort)(uVar13 >> 0x10);
          DAT_data_000f = (undefined2)uVar13;
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          DAT_data_000b = (ushort)uVar8;
          DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
          DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
          DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
          DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
          uVar8 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff) + (int)*(short *)(in_AR0 & 0xff);
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          DAT_data_000b = (ushort)uVar8;
          uVar18 = (uVar18 & 0xffff0000) + (uVar18 & 0xffff) + (int)*(short *)(in_AR0 + 1 & 0xff);
          DAT_data_0016 = (word)(uVar18 >> 0x10);
          DAT_data_0017 = (ushort)uVar18;
          if (DAT_data_005c == 0) {
            PA1 = DAT_data_0033;
            PA2 = DAT_data_0038;
          }
          else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
            PA1 = DAT_data_0016;
            PA2 = DAT_data_0017;
          }
          PA0 = DAT_data_0010;
          PA7 = DAT_data_0011;
          DAT_data_001c = PA4;
          DAT_data_001d = PA4;
          DAT_data_001a =
               (word)((uint)((int)(short)((uint)((((int)(short)DAT_data_0014 *
                                                   (int)(short)DAT_data_001d -
                                                  (int)(short)DAT_data_0014 *
                                                  (int)(short)DAT_data_001c) +
                                                 (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10) *
                             (int)(short)DAT_data_003c * 2) >> 0x10);
          PA6 = DAT_data_001a;
          uVar10 = (uint)DAT_data_003c;
          uVar9 = uVar5 & 0xffff;
          iVar6 = uVar10 * 0x10000 + uVar9;
          uVar5 = iVar6 + (int)DAT_data_003e * 0x800;
          DAT_data_003c = (ushort)(uVar5 >> 0x10);
          DAT_data_003d = (ushort)uVar5;
          if (SCARRY4(uVar10 * 0x10000,uVar9) || SCARRY4(iVar6,(int)DAT_data_003e * 0x800)) {
LAB_prog_0c95:
            DAT_data_000c = (short)(uVar15 >> 0x10);
            DAT_data_000d = (short)uVar15;
            DAT_data_003c = (ushort)(uVar5 >> 0x10);
            DAT_data_003d = (ushort)uVar5;
            DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
            DAT_data_0037 = (undefined2)iVar7;
            DAT_data_0016 = (word)(uVar18 >> 0x10);
            DAT_data_0017 = (ushort)uVar18;
            DAT_data_000a = (ushort)(uVar8 >> 0x10);
            DAT_data_000b = (ushort)uVar8;
            DAT_data_007a = (ushort)(uVar4 >> 0x10);
            DAT_data_007b = (undefined2)uVar4;
            DAT_data_000e = (ushort)(uVar13 >> 0x10);
            DAT_data_000f = (undefined2)uVar13;
            if (DAT_data_004f != 0) goto LAB_prog_0b9a;
            if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
              if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                        (uint)DAT_data_007a * -0x10000) - (uVar4 & 0xffff)) < 1) goto LAB_prog_0b9a;
              iVar6 = ((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                      (uint)DAT_data_000a * -0x10000) - (uVar8 & 0xffff);
              if (iVar6 < 0) {
                iVar6 = -iVar6;
              }
              if (iVar6 + (int)DAT_data_0052 * -0x200 < 0) goto LAB_prog_0cce;
LAB_prog_0c34:
              DAT_data_000c = (short)(uVar15 >> 0x10);
              DAT_data_000d = (short)uVar15;
              DAT_data_003c = (ushort)(uVar5 >> 0x10);
              DAT_data_003d = (ushort)uVar5;
              DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
              DAT_data_0037 = (undefined2)iVar7;
              DAT_data_007a = (ushort)(uVar4 >> 0x10);
              DAT_data_007b = (undefined2)uVar4;
              DAT_data_0016 = (word)(uVar18 >> 0x10);
              DAT_data_0017 = (ushort)uVar18;
              DAT_data_000e = (ushort)(uVar13 >> 0x10);
              DAT_data_000f = (undefined2)uVar13;
              DAT_data_000a = (ushort)(uVar8 >> 0x10);
              DAT_data_000b = (ushort)uVar8;
              uStackfe = 0x186c;
              FUN_prog_0d58();
              uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
              uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
              iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
              uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
              uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
              uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
              uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
            }
            else {
              if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                             (uint)DAT_data_007a * -0x10000) - (uVar4 & 0xffff)))
              goto LAB_prog_0b9a;
              iVar6 = ((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                      (uint)DAT_data_000a * -0x10000) - (uVar8 & 0xffff);
              if (iVar6 < 0) {
                iVar6 = -iVar6;
              }
              if (-1 < iVar6 + (int)DAT_data_0052 * -0x200) goto LAB_prog_0c34;
LAB_prog_0cce:
              wVar1 = PA5;
              if ((wVar1 & DAT_data_0005) != 0) {
                wVar27 = PA6;
                *(word *)(wVar1 & 0xff) = wVar27;
                uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
                uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
                iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
                uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
                uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
                uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
                uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
              }
              DAT_data_003d = (ushort)uVar5;
              DAT_data_007a = (ushort)(uVar4 >> 0x10);
              DAT_data_000a = (ushort)(uVar8 >> 0x10);
              DAT_data_000b = (ushort)uVar8;
              DAT_data_0019 = PA7;
              iVar6 = (uint)DAT_data_0019 * 0x10000;
              if (iVar6 < 0) {
                iVar6 = (uint)DAT_data_0019 * -0x10000;
              }
              DAT_data_003a = (word)((uint)iVar6 >> 0x10);
              DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
              DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
              DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
              DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
              uVar8 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff) +
                      (int)*(short *)(in_AR0 & 0xff);
              uVar26 = (ushort)(uVar8 >> 0x10);
              uVar18 = (uVar18 & 0xffff0000) + (uVar18 & 0xffff) +
                       (int)*(short *)(in_AR0 + 1 & 0xff);
              uVar28 = (ushort)(uVar18 >> 0x10);
              DAT_data_003b = PA3;
              PA3 = DAT_data_0076;
              iVar6 = (int)(short)DAT_data_0033;
              DAT_data_0033 = DAT_data_003a;
              if (-1 < iVar6 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
                DAT_data_0033 = (word)((uint)(iVar6 * DAT_data_0055 * 2) >> 0x10);
              }
              PA0 = DAT_data_0010;
              PA7 = DAT_data_0011;
              DAT_data_001c = PA4;
              DAT_data_001d = PA4;
              DAT_data_001a =
                   (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                                  (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                                 (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
              PA6 = DAT_data_001a;
              if ((DAT_data_0058 & DAT_data_003b) != 0) goto LAB_prog_0ab3;
              if ((DAT_data_0059 & DAT_data_0076) != 0) goto code_p0x0ae7;
              if (DAT_data_004f != 0) goto LAB_prog_0b9a;
              if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
                if ((int)(((uint)uVar28 * 0x10000 + (uVar18 & 0xffff) +
                          (uint)DAT_data_007a * -0x10000) - (uVar4 & 0xffff)) < 1)
                goto LAB_prog_0b9a;
                iVar6 = ((uint)uVar28 * 0x10000 + (uVar18 & 0xffff) + (uint)uVar26 * -0x10000) -
                        (uVar8 & 0xffff);
                if (iVar6 < 0) {
                  iVar6 = -iVar6;
                }
                iVar6 = iVar6 + (int)DAT_data_0052 * -0x200;
              }
              else {
                if (-1 < (int)(((uint)uVar28 * 0x10000 + (uVar18 & 0xffff) +
                               (uint)DAT_data_007a * -0x10000) - (uVar4 & 0xffff)))
                goto LAB_prog_0b9a;
                iVar6 = ((uint)uVar28 * 0x10000 + (uVar18 & 0xffff) + (uint)uVar26 * -0x10000) -
                        (uVar8 & 0xffff);
                if (iVar6 < 0) {
                  iVar6 = -iVar6;
                }
                iVar6 = iVar6 + (int)DAT_data_0052 * -0x200;
              }
              if (-1 < iVar6) goto LAB_prog_0c34;
            }
            DAT_data_000c = (short)(uVar15 >> 0x10);
            DAT_data_000d = (short)uVar15;
            DAT_data_003c = (ushort)(uVar5 >> 0x10);
            DAT_data_003d = (ushort)uVar5;
            DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
            DAT_data_0037 = (undefined2)iVar7;
            DAT_data_007a = (ushort)(uVar4 >> 0x10);
            DAT_data_007b = (undefined2)uVar4;
            DAT_data_000e = (ushort)(uVar13 >> 0x10);
            DAT_data_000f = (undefined2)uVar13;
            DAT_data_0016 = (word)(uVar18 >> 0x10);
            DAT_data_0017 = (ushort)uVar18;
            DAT_data_000a = (ushort)(uVar8 >> 0x10);
            DAT_data_000b = (ushort)uVar8;
            wVar1 = PA5;
            if ((wVar1 & DAT_data_0005) != 0) {
              wVar27 = PA6;
              *(word *)(wVar1 & 0xff) = wVar27;
              uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
              uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
              iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
              uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
              uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
              uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
              uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
            }
            DAT_data_000a = (ushort)(uVar8 >> 0x10);
            DAT_data_000b = (ushort)uVar8;
            DAT_data_0019 = PA7;
            iVar6 = (uint)DAT_data_0019 * 0x10000;
            if (iVar6 < 0) {
              iVar6 = (uint)DAT_data_0019 * -0x10000;
            }
            DAT_data_003a = (word)((uint)iVar6 >> 0x10);
            DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
            DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
            DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
            DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
            uVar8 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff) +
                    (int)*(short *)(in_AR0 & 0xff);
            uVar18 = (uVar18 & 0xffff0000) + (uVar18 & 0xffff) + (int)*(short *)(in_AR0 + 1 & 0xff);
            iVar6 = (int)(short)DAT_data_0033;
            DAT_data_0033 = DAT_data_003a;
            if (-1 < iVar6 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
              DAT_data_0033 = (word)((uint)(iVar6 * DAT_data_0055 * 2) >> 0x10);
            }
            if (DAT_data_005c == 0) {
              PA1 = DAT_data_0033;
              PA2 = DAT_data_0038;
            }
            else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
              PA1 = (word)(uVar18 >> 0x10);
              PA2 = (word)uVar18;
            }
            PA0 = DAT_data_0010;
            PA7 = DAT_data_0011;
            DAT_data_001c = PA4;
            DAT_data_001d = PA4;
            DAT_data_001a =
                 (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                                (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                               (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
            PA6 = DAT_data_001a;
            if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
              iVar6 = (uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005d * -0x10000;
              if (iVar6 < 1) {
                DAT_data_0076 = 0;
              }
              else {
                DAT_data_0039 = (ushort)((uint)iVar6 >> 0x10);
                DAT_data_0076 = 1;
              }
            }
            else {
              DAT_data_0039 =
                   (ushort)((uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005e * -0x10000 >> 0x10);
              DAT_data_0076 = 0;
            }
            goto LAB_prog_0c95;
          }
          if (DAT_data_004f != 0) goto LAB_prog_0b9a;
          if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
            if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                      (uint)DAT_data_000e * -0x10000) - (uVar13 & 0xffff)) < 1) goto LAB_prog_0b9a;
            iVar6 = ((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                    (uint)DAT_data_000a * -0x10000) - (uVar8 & 0xffff);
            if (iVar6 < 0) {
              iVar6 = -iVar6;
            }
            iVar6 = iVar6 + (int)DAT_data_0052 * -0x200;
          }
          else {
            if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                           (uint)DAT_data_000e * -0x10000) - (uVar13 & 0xffff))) goto LAB_prog_0b9a;
            iVar6 = ((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                    (uint)DAT_data_000a * -0x10000) - (uVar8 & 0xffff);
            if (iVar6 < 0) {
              iVar6 = -iVar6;
            }
            iVar6 = iVar6 + (int)DAT_data_0052 * -0x200;
          }
          if (-1 < iVar6) {
            uStackfe = 0x1616;
            FUN_prog_0d58();
            uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
            iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
            uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
            uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_000c = (short)(uVar15 >> 0x10);
          DAT_data_000d = (short)uVar15;
          DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
          DAT_data_0037 = (undefined2)iVar7;
          DAT_data_007a = (ushort)(uVar4 >> 0x10);
          DAT_data_007b = (undefined2)uVar4;
          DAT_data_000e = (ushort)(uVar13 >> 0x10);
          DAT_data_000f = (undefined2)uVar13;
          DAT_data_003c = (ushort)(uVar5 >> 0x10);
          DAT_data_003d = (ushort)uVar5;
          DAT_data_0016 = (word)(uVar18 >> 0x10);
          DAT_data_0017 = (ushort)uVar18;
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          DAT_data_000b = (ushort)uVar8;
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar27 = PA6;
            *(word *)(wVar1 & 0xff) = wVar27;
            uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
            uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
            iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
            uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
            uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
          }
        } while( true );
      }
      if (DAT_data_0069 != 0) goto code_p0x0abd;
      if (DAT_data_006a != 0) goto LAB_prog_0aeb;
      uVar8 = (uint)DAT_data_000e * 0x10000 + (uVar13 & 0xffff);
LAB_prog_084e:
      DAT_data_000c = (short)(uVar15 >> 0x10);
      DAT_data_000d = (short)uVar15;
      DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
      DAT_data_0037 = (undefined2)iVar7;
      DAT_data_000a = (ushort)(uVar8 >> 0x10);
      DAT_data_000b = (ushort)uVar8;
      wVar1 = PA5;
      if ((wVar1 & DAT_data_0005) != 0) {
        wVar27 = PA6;
        *(word *)(wVar1 & 0xff) = wVar27;
        uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
        iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
        uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
      }
      DAT_data_000a = (ushort)(uVar8 >> 0x10);
      DAT_data_000b = (ushort)uVar8;
      DAT_data_0019 = PA7;
      iVar6 = (uint)DAT_data_0019 * 0x10000;
      if (iVar6 < 0) {
        iVar6 = (uint)DAT_data_0019 * -0x10000;
      }
      DAT_data_003a = (word)((uint)iVar6 >> 0x10);
      iVar6 = (int)(short)DAT_data_0033;
      DAT_data_0033 = DAT_data_003a;
      if (-1 < iVar6 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
        DAT_data_0033 = (word)((uint)(iVar6 * DAT_data_0055 * 2) >> 0x10);
      }
      DAT_data_0030 = 0xf1;
      DAT_data_0031 = 0xfb;
      if (DAT_data_005c == 0) {
        PA1 = DAT_data_0033;
        PA2 = 0;
      }
      else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
        PA1 = DAT_data_000a;
        PA2 = DAT_data_000b;
      }
      if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
        iVar6 = (uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005d * -0x10000;
        if (iVar6 < 1) goto LAB_prog_08a5;
        DAT_data_0039 = (ushort)((uint)iVar6 >> 0x10);
        DAT_data_003b = PA3;
        PA3 = DAT_data_0001;
        if ((DAT_data_0058 != 0) && (0 < (int)((uint)DAT_data_003b << 0x10))) break;
        if (DAT_data_0059 != 0) goto code_p0x0ae7;
      }
      else {
        iVar6 = (uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_005e * -0x10000;
LAB_prog_08a5:
        DAT_data_0039 = (ushort)((uint)iVar6 >> 0x10);
        DAT_data_003b = PA3;
        PA3 = wData0000;
        if ((DAT_data_0058 != 0) && (0 < (int)((uint)DAT_data_003b << 0x10))) break;
      }
      if (DAT_data_004b != 0) break;
      if (DAT_data_004c != 0) goto code_p0x0ae7;
      if (DAT_data_0050 == 0) {
        if (DAT_data_004d != 0) {
          DAT_data_0038 = 2;
          uVar8 = (uint)DAT_data_0034 * 0x10000 + (uint)DAT_data_0035;
LAB_prog_08e8:
          DAT_data_000c = (short)(uVar15 >> 0x10);
          DAT_data_000d = (short)uVar15;
          DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
          DAT_data_0037 = (undefined2)iVar7;
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          DAT_data_000b = (ushort)uVar8;
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar27 = PA6;
            *(word *)(wVar1 & 0xff) = wVar27;
            uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
            iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          wVar1 = PA7;
          iVar6 = (uint)wVar1 * 0x10000;
          if (iVar6 < 0) {
            iVar6 = (uint)wVar1 * -0x10000;
          }
          uVar26 = (ushort)((uint)iVar6 >> 0x10);
          iVar6 = (int)(short)DAT_data_0033;
          DAT_data_0033 = uVar26;
          if (-1 < iVar6 * DAT_data_0055 + (int)(short)uVar26 * -0x8000) {
            DAT_data_0033 = (ushort)((uint)(iVar6 * DAT_data_0055 * 2) >> 0x10);
          }
          if (DAT_data_005c == 0) {
            PA1 = DAT_data_0033;
            PA2 = DAT_data_0038;
          }
          PA6 = wVar1;
          wVar1 = PA3;
          PA3 = (word)((uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_0056 * -0x10000 >> 0x10);
          uVar8 = (uVar8 & 0xffff0000) + (uVar8 & 0xffff) + (int)(short)DAT_data_0001 * 0x200;
          if (0 < (int)((uVar8 + (uint)DAT_data_0062 * -0x10000) - (uint)DAT_data_0063)) {
            uVar8 = (uint)DAT_data_0034 * 0x10000 + (uint)DAT_data_0035;
          }
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          if (DAT_data_005a != 0) {
            if (0 < (int)((uint)DAT_data_0033 * 0x10000 + (uint)DAT_data_0056 * -0x10000)) {
              uVar9 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
              iVar7 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff);
              uVar8 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 +
                      (int)DAT_data_0057 * 0x200;
LAB_prog_098b:
              do {
                DAT_data_000c = (short)(uVar15 >> 0x10);
                DAT_data_000d = (short)uVar15;
                DAT_data_000a = (ushort)(uVar8 >> 0x10);
                DAT_data_000b = (ushort)uVar8;
                DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
                DAT_data_0037 = (undefined2)iVar7;
                DAT_data_000e = (ushort)(uVar9 >> 0x10);
                DAT_data_000f = (undefined2)uVar9;
                wVar1 = PA5;
                if ((wVar1 & DAT_data_0005) != 0) {
                  wVar27 = PA6;
                  *(word *)(wVar1 & 0xff) = wVar27;
                  uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
                  iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
                  uVar9 = CONCAT22(DAT_data_000e,DAT_data_000f);
                  uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
                }
                DAT_data_000a = (ushort)(uVar8 >> 0x10);
                DAT_data_000b = (ushort)uVar8;
                wVar1 = PA7;
                iVar6 = (uint)wVar1 * 0x10000;
                if (iVar6 < 0) {
                  iVar6 = (uint)wVar1 * -0x10000;
                }
                wVar27 = (word)((uint)iVar6 >> 0x10);
                iVar6 = (int)(short)DAT_data_0033;
                DAT_data_0033 = wVar27;
                if (-1 < iVar6 * DAT_data_0055 + (int)(short)wVar27 * -0x8000) {
                  DAT_data_0033 = (word)((uint)(iVar6 * DAT_data_0055 * 2) >> 0x10);
                }
                uVar8 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff) +
                        (int)(short)DAT_data_0001 * 0x200;
                wVar27 = (word)(uVar8 >> 0x10);
                if (DAT_data_005c == 0) {
                  PA1 = DAT_data_0032;
                  PA2 = 3;
                }
                else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
                  PA1 = wVar27;
                  PA2 = (word)uVar8;
                }
                PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
                PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
                      (short)((int)(short)DAT_data_000a << 7);
                PA4 = wVar1;
                PA6 = wVar1;
              } while ((DAT_data_004f == 0) &&
                      ((int)(((uint)wVar27 * 0x10000 + (uVar8 & 0xffff) + (uVar9 >> 0x10) * -0x10000
                             ) - (uVar9 & 0xffff)) < 0));
              goto LAB_prog_084e;
            }
            if (0 < (int)((uint)wVar1 << 0x10)) {
              uVar9 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
              iVar7 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff);
              uVar8 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 +
                      (int)DAT_data_0057 * 0x200;
              goto LAB_prog_098b;
            }
          }
          if (DAT_data_004e != 0) {
            uVar9 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
            uVar8 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
            goto LAB_prog_098b;
          }
          if (DAT_data_004f != 0) goto LAB_prog_084e;
          goto LAB_prog_08e8;
        }
      }
      else {
        DAT_data_0038 = 4;
        DAT_data_0026 = 0;
        uVar8 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
        while( true ) {
          DAT_data_000c = (short)(uVar15 >> 0x10);
          DAT_data_000d = (short)uVar15;
          DAT_data_0036 = (undefined2)((uint)iVar7 >> 0x10);
          DAT_data_0037 = (undefined2)iVar7;
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          DAT_data_000b = (ushort)uVar8;
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar27 = PA6;
            *(word *)(wVar1 & 0xff) = wVar27;
            uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
            iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_000a = (ushort)(uVar8 >> 0x10);
          DAT_data_000b = (ushort)uVar8;
          uVar26 = DAT_data_000b << 6 & DAT_data_0003;
          iVar6 = ((int)DAT_data_0040 * 0x8000 - (int)DAT_data_0051 * (int)DAT_data_0040) +
                  (int)DAT_data_0051 * (int)DAT_data_0026;
          if (iVar6 < 0) {
            iVar6 = iVar6 + (short)DAT_data_0003;
          }
          DAT_data_0026 = (short)((uint)(iVar6 << 1) >> 0x10);
          PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
          PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
                (short)((int)(short)DAT_data_000a << 7);
          wVar1 = PA4;
          wVar27 = PA4;
          PA6 = (word)((uint)((((int)(short)uVar26 * (int)(short)wVar27 -
                               (int)(short)uVar26 * (int)(short)wVar1) + (int)(short)wVar1 * 0x8000)
                             * 2) >> 0x10);
          if (DAT_data_005c == 0) {
            PA1 = DAT_data_0032;
            PA2 = DAT_data_0038;
          }
          else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
            PA1 = DAT_data_000a;
            PA2 = DAT_data_000b;
          }
          uVar8 = (uint)DAT_data_000a * 0x10000 + (uVar8 & 0xffff) + (int)DAT_data_0026;
          uVar26 = (ushort)(uVar8 >> 0x10);
          if (DAT_data_0050 == 0) break;
          if ((int)(((uint)uVar26 * 0x10000 + (uVar8 & 0xffff) + (uint)DAT_data_0060 * -0x10000) -
                   (uint)DAT_data_0061) < 1) {
            uVar8 = (uint)DAT_data_0060 * 0x10000 + (uint)DAT_data_0061;
          }
          else if (-1 < (int)(((uint)uVar26 * 0x10000 + (uVar8 & 0xffff) +
                              (uint)DAT_data_0062 * -0x10000) - (uint)DAT_data_0063)) {
            uVar8 = (uint)DAT_data_0062 * 0x10000 + (uint)DAT_data_0063;
          }
        }
        uVar8 = 0;
      }
      goto LAB_prog_084e;
    }
    DAT_data_003c = (ushort)(uVar5 >> 0x10);
    DAT_data_003d = (ushort)uVar5;
    DAT_data_003f = DAT_data_0077;
    if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
      if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) + (uint)DAT_data_000e * -0x10000)
               - (uVar13 & 0xffff)) < 1) goto LAB_prog_0c0d;
    }
    else if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) +
                        (uint)DAT_data_000e * -0x10000) - (uVar13 & 0xffff))) {
LAB_prog_0c0d:
      DAT_data_003f = DAT_data_0068;
    }
    iVar6 = ((uint)DAT_data_0016 * 0x10000 + (uVar18 & 0xffff) + (uint)DAT_data_000a * -0x10000) -
            (uVar8 & 0xffff);
    if (iVar6 < 0) {
      iVar6 = -iVar6;
    }
    if (-1 < iVar6 + (int)DAT_data_0052 * -0x200) {
      uStackfe = 0x1734;
      FUN_prog_0d58();
      iVar7 = CONCAT22(DAT_data_0036,DAT_data_0037);
      uVar4 = CONCAT22(DAT_data_007a,DAT_data_007b);
      uVar13 = CONCAT22(DAT_data_000e,DAT_data_000f);
      uVar15 = CONCAT22(DAT_data_000c,DAT_data_000d);
      uVar5 = CONCAT22(DAT_data_003c,DAT_data_003d);
      uVar18 = CONCAT22(DAT_data_0016,DAT_data_0017);
      uVar8 = CONCAT22(DAT_data_000a,DAT_data_000b);
    }
  } while( true );
LAB_prog_0ab3:
  DAT_data_0039 = DAT_data_0003;
  DAT_data_0076 = 0;
code_p0x0abd:
  in_AR0 = 0x40;
  DAT_data_0078 = 0;
  DAT_data_0079 = 0;
  uVar5 = (uint)DAT_data_003d;
  DAT_data_003e = DAT_data_0064;
  DAT_data_003f = DAT_data_0065;
  uVar8 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
  uVar13 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
  uVar4 = (uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006c;
  DAT_data_0038 = 1;
  uVar18 = uVar8;
  goto LAB_prog_0b1b;
}


