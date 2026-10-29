// 7810_STUDIO_SAMPLER_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Eventide H3000/H3500 DSP program 7810_STUDIO_SAMPLER_dsp1 (ucode_7810_ROM3_2C008.bin)
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
  int iVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  ushort uVar16;
  
  uVar16 = 0x8f;
  do {
    *(undefined2 *)(uVar16 & 0xff) = 0;
    iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
    uVar11 = CONCAT22(DAT_data_000a,DAT_data_000b);
    uVar5 = uVar16 & 0x1ff;
    uVar16 = uVar16 - 1;
  } while (uVar5 != 0);
  _DAT_data_00fd = 0x7efe;
  DAT_data_0001 = 1;
  DAT_data_0005 = 0x100;
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
  wVar1 = PA0;
  do {
    cVar6 = bio_pin();
    DAT_data_0062 = DAT_data_0003;
    DAT_data_0063 = DAT_data_0004;
    DAT_data_0068 = DAT_data_0003;
  } while (cVar6 == '\0');
LAB_prog_084e:
  do {
    DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
    DAT_data_0037 = (undefined2)iVar10;
    DAT_data_000a = (ushort)(uVar11 >> 0x10);
    DAT_data_000b = (word)uVar11;
    DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
    DAT_data_0035 = (undefined2)uVar8;
    wVar1 = PA5;
    if ((wVar1 & DAT_data_0005) != 0) {
      wVar7 = PA6;
      *(word *)(wVar1 & 0xff) = wVar7;
      iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
      uVar11 = CONCAT22(DAT_data_000a,DAT_data_000b);
      uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
    }
    DAT_data_000a = (ushort)(uVar11 >> 0x10);
    DAT_data_000b = (word)uVar11;
    DAT_data_0038 = 0;
    iVar9 = (uint)DAT_data_0018 * 0x10000;
    if (iVar9 < 0) {
      iVar9 = (uint)DAT_data_0018 * -0x10000;
    }
    DAT_data_003a = (word)((uint)iVar9 >> 0x10);
    iVar9 = (int)(short)DAT_data_0032;
    DAT_data_0032 = DAT_data_003a;
    if (-1 < iVar9 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
      DAT_data_0032 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
    }
    if (DAT_data_005c == 0) {
      PA1 = DAT_data_0032;
      PA2 = 0;
    }
    else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
      PA1 = DAT_data_000a;
      PA2 = DAT_data_000b;
    }
    DAT_data_0030 = 0xf1;
    DAT_data_0031 = 0xfb;
    if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
      iVar9 = (uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005d * -0x10000;
      DAT_data_0039 = (ushort)((uint)iVar9 >> 0x10);
      if (iVar9 < 0) goto LAB_prog_089d;
      PA3 = DAT_data_0001;
      DAT_data_003b = PA3;
      if (DAT_data_0058 != 0) goto LAB_prog_0b30;
    }
    else {
      DAT_data_0039 =
           (ushort)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005e * -0x10000 >> 0x10);
LAB_prog_089d:
      PA3 = wData0000;
      DAT_data_003b = PA3;
    }
    if ((DAT_data_0059 != 0) && (0 < (int)((uint)DAT_data_003b << 0x10))) {
code_p0x0b5f:
      DAT_data_0039 = DAT_data_0003;
LAB_prog_0b61:
      DAT_data_003e = DAT_data_0066;
      DAT_data_003f = DAT_data_0067;
      DAT_data_0078 = 0;
      DAT_data_0079 = 0;
      uVar15 = (uint)DAT_data_003d;
      DAT_data_0077 = 0;
      uVar11 = (uint)DAT_data_006d * 0x10000 + (uint)DAT_data_006e;
      uVar12 = (uint)DAT_data_0048 * 0x10000 + (uint)DAT_data_0049;
      uVar13 = (uint)DAT_data_0046 * 0x10000 + (uint)DAT_data_0047;
      iVar9 = (int)(short)(uVar13 >> 0x10) << 7;
      DAT_data_0010 = (word)((uint)iVar9 >> 0x10);
      DAT_data_0011 = ((ushort)((uint)((int)(short)uVar13 << 7) >> 0x10) & 0x7f) + (short)iVar9;
      uVar16 = 0x6f;
      uVar14 = uVar13;
LAB_prog_0b91:
      while( true ) {
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
        DAT_data_0037 = (undefined2)iVar10;
        DAT_data_0016 = (ushort)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        DAT_data_007b = (ushort)(uVar11 >> 0x10);
        DAT_data_007c = (undefined2)uVar11;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
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
        PA5 = DAT_data_001a;
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0032;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = DAT_data_0016;
          PA2 = DAT_data_0017;
        }
        uVar13 = (uVar13 & 0xffff0000) + (uVar13 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
        DAT_data_000a = (ushort)(uVar13 >> 0x10);
        DAT_data_000b = (word)uVar13;
        DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
        DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
        DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
        uVar14 = (uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                 (int)*(short *)(uVar16 + 1 & 0xff);
        DAT_data_0016 = (ushort)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        uVar4 = (uint)DAT_data_003c;
        uVar3 = uVar15 & 0xffff;
        iVar9 = uVar4 * 0x10000 + uVar3;
        uVar15 = iVar9 + (int)DAT_data_003e * 0x800;
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        if (SCARRY4(uVar4 * 0x10000,uVar3) || SCARRY4(iVar9,(int)DAT_data_003e * 0x800)) break;
        if (DAT_data_004f != 0) goto LAB_prog_0c24;
        if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
          if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                    (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff)) < 1) goto LAB_prog_0c24;
          DAT_data_0018 = PA7;
          iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar13 & 0xffff);
          if (iVar9 < 0) {
            iVar9 = -iVar9;
          }
          if (iVar9 + (int)DAT_data_0052 * -0x200 < 0) goto LAB_prog_0b83;
LAB_prog_0c12:
          FUN_prog_0ded();
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar7 = PA6;
            *(word *)(wVar1 & 0xff) = wVar7;
          }
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
        }
        else {
          if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                         (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff))) goto LAB_prog_0c24;
          DAT_data_0018 = PA7;
          iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar13 & 0xffff);
          if (iVar9 < 0) {
            iVar9 = -iVar9;
          }
          if (-1 < iVar9 + (int)DAT_data_0052 * -0x200) goto LAB_prog_0c12;
LAB_prog_0b83:
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar7 = PA6;
            *(word *)(wVar1 & 0xff) = wVar7;
            iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
            uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
            uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
            uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_0038 = 1;
        }
      }
      while( true ) {
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
        DAT_data_0037 = (undefined2)iVar10;
        DAT_data_0016 = (ushort)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        DAT_data_000a = (ushort)(uVar13 >> 0x10);
        DAT_data_000b = (word)uVar13;
        DAT_data_007b = (ushort)(uVar11 >> 0x10);
        DAT_data_007c = (undefined2)uVar11;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        if (DAT_data_004f != 0) break;
        if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
          if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                    (uint)DAT_data_007b * -0x10000) - (uVar11 & 0xffff)) < 1) break;
          DAT_data_0018 = PA7;
          iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar13 & 0xffff);
          if (iVar9 < 0) {
            iVar9 = -iVar9;
          }
          if (iVar9 + (int)DAT_data_0052 * -0x200 < 0) goto LAB_prog_0d60;
LAB_prog_0cc3:
          DAT_data_003c = (ushort)(uVar15 >> 0x10);
          DAT_data_003d = (ushort)uVar15;
          DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
          DAT_data_0037 = (undefined2)iVar10;
          DAT_data_007b = (ushort)(uVar11 >> 0x10);
          DAT_data_007c = (undefined2)uVar11;
          DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
          DAT_data_0035 = (undefined2)uVar8;
          DAT_data_0016 = (ushort)(uVar14 >> 0x10);
          DAT_data_0017 = (word)uVar14;
          DAT_data_000e = (ushort)(uVar12 >> 0x10);
          DAT_data_000f = (undefined2)uVar12;
          DAT_data_000a = (ushort)(uVar13 >> 0x10);
          DAT_data_000b = (word)uVar13;
          FUN_prog_0ded();
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        else {
          if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                         (uint)DAT_data_007b * -0x10000) - (uVar11 & 0xffff))) break;
          DAT_data_0018 = PA7;
          iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar13 & 0xffff);
          if (iVar9 < 0) {
            iVar9 = -iVar9;
          }
          if (-1 < iVar9 + (int)DAT_data_0052 * -0x200) goto LAB_prog_0cc3;
LAB_prog_0d60:
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar7 = PA6;
            *(word *)(wVar1 & 0xff) = wVar7;
            uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
            iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
            uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
            uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_003d = (ushort)uVar15;
          DAT_data_007b = (ushort)(uVar11 >> 0x10);
          iVar9 = (uint)DAT_data_0018 * 0x10000;
          if (iVar9 < 0) {
            iVar9 = (uint)DAT_data_0018 * -0x10000;
          }
          DAT_data_003a = (word)((uint)iVar9 >> 0x10);
          PA0 = DAT_data_0010;
          PA7 = DAT_data_0011;
          DAT_data_001c = PA4;
          DAT_data_001d = PA4;
          DAT_data_001a =
               (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                              (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                             (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
          PA5 = DAT_data_001a;
          uVar13 = (uVar13 & 0xffff0000) + (uVar13 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
          uVar5 = (ushort)(uVar13 >> 0x10);
          PA3 = DAT_data_0077;
          DAT_data_003b = PA3;
          DAT_data_0010 = (word)((uint)((int)(short)uVar5 << 7) >> 0x10);
          DAT_data_0006 = (ushort)((uint)((int)(short)uVar13 << 7) >> 0x10);
          DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)uVar5 << 7);
          DAT_data_0014 = (short)uVar13 << 6 & DAT_data_0003;
          uVar14 = (uVar14 & 0xffff0000) + (uVar14 & 0xffff) + (int)*(short *)(uVar16 + 1 & 0xff);
          uVar2 = (ushort)(uVar14 >> 0x10);
          iVar9 = (int)(short)DAT_data_0032;
          DAT_data_0032 = DAT_data_003a;
          if (-1 < iVar9 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
            DAT_data_0032 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
          }
          if ((DAT_data_0058 & DAT_data_0077) != 0) goto LAB_prog_0b30;
          if ((DAT_data_0059 & DAT_data_003b) != 0) goto code_p0x0b5f;
          if (DAT_data_004f != 0) break;
          if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
            if ((int)(((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) + (uint)DAT_data_007b * -0x10000) -
                     (uVar11 & 0xffff)) < 1) break;
            DAT_data_0018 = PA7;
            iVar9 = ((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) + (uint)uVar5 * -0x10000) -
                    (uVar13 & 0xffff);
            if (iVar9 < 0) {
              iVar9 = -iVar9;
            }
            iVar9 = iVar9 + (int)DAT_data_0052 * -0x200;
          }
          else {
            if (-1 < (int)(((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) +
                           (uint)DAT_data_007b * -0x10000) - (uVar11 & 0xffff))) break;
            DAT_data_0018 = PA7;
            iVar9 = ((uint)uVar2 * 0x10000 + (uVar14 & 0xffff) + (uint)uVar5 * -0x10000) -
                    (uVar13 & 0xffff);
            if (iVar9 < 0) {
              iVar9 = -iVar9;
            }
            iVar9 = iVar9 + (int)DAT_data_0052 * -0x200;
          }
          if (-1 < iVar9) goto LAB_prog_0cc3;
        }
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
        DAT_data_0037 = (undefined2)iVar10;
        DAT_data_007b = (ushort)(uVar11 >> 0x10);
        DAT_data_007c = (undefined2)uVar11;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000e = (ushort)(uVar12 >> 0x10);
        DAT_data_000f = (undefined2)uVar12;
        DAT_data_0016 = (ushort)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        DAT_data_000a = (ushort)(uVar13 >> 0x10);
        DAT_data_000b = (word)uVar13;
        wVar1 = PA5;
        if ((wVar1 & DAT_data_0005) != 0) {
          wVar7 = PA6;
          *(word *)(wVar1 & 0xff) = wVar7;
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        DAT_data_0016 = (ushort)(uVar14 >> 0x10);
        DAT_data_0017 = (word)uVar14;
        iVar9 = (uint)DAT_data_0018 * 0x10000;
        if (iVar9 < 0) {
          iVar9 = (uint)DAT_data_0018 * -0x10000;
        }
        DAT_data_003a = (word)((uint)iVar9 >> 0x10);
        PA0 = DAT_data_0010;
        PA7 = DAT_data_0011;
        DAT_data_001c = PA4;
        DAT_data_001d = PA4;
        DAT_data_001a =
             (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                            (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                           (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
        PA5 = DAT_data_001a;
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0032;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = DAT_data_0016;
          PA2 = DAT_data_0017;
        }
        uVar13 = (uVar13 & 0xffff0000) + (uVar13 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
        iVar9 = (int)(short)(uVar13 >> 0x10) << 7;
        DAT_data_0010 = (word)((uint)iVar9 >> 0x10);
        DAT_data_0006 = (ushort)((uint)((int)(short)uVar13 << 7) >> 0x10);
        DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)iVar9;
        DAT_data_0014 = (short)uVar13 << 6 & DAT_data_0003;
        uVar14 = (uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                 (int)*(short *)(uVar16 + 1 & 0xff);
        iVar9 = (int)(short)DAT_data_0032;
        DAT_data_0032 = DAT_data_003a;
        if (-1 < iVar9 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
          DAT_data_0032 = (ushort)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
        }
        if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
          iVar9 = (uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005d * -0x10000;
          if (iVar9 < 1) {
            DAT_data_0077 = 0;
          }
          else {
            DAT_data_0039 = (ushort)((uint)iVar9 >> 0x10);
            DAT_data_0077 = 1;
          }
        }
        else {
          DAT_data_0039 =
               (ushort)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005e * -0x10000 >> 0x10);
          DAT_data_0077 = 0;
        }
      }
LAB_prog_0c24:
      DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
      DAT_data_0037 = (undefined2)iVar10;
      DAT_data_007b = (ushort)(uVar11 >> 0x10);
      DAT_data_007c = (undefined2)uVar11;
      DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
      DAT_data_0035 = (undefined2)uVar8;
      DAT_data_000e = (ushort)(uVar12 >> 0x10);
      DAT_data_000f = (undefined2)uVar12;
      DAT_data_003c = (ushort)(uVar15 >> 0x10);
      DAT_data_003d = (ushort)uVar15;
      DAT_data_0016 = (ushort)(uVar14 >> 0x10);
      DAT_data_0017 = (word)uVar14;
      DAT_data_000a = (ushort)(uVar13 >> 0x10);
      DAT_data_000b = (word)uVar13;
      wVar1 = PA5;
      if ((wVar1 & DAT_data_0005) != 0) {
        wVar7 = PA6;
        *(word *)(wVar1 & 0xff) = wVar7;
        iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
        uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
        uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
        uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
        uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
        uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
        uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
      }
      DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
      DAT_data_0037 = (undefined2)iVar10;
      DAT_data_007b = (ushort)(uVar11 >> 0x10);
      DAT_data_007c = (undefined2)uVar11;
      DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
      DAT_data_0035 = (undefined2)uVar8;
      DAT_data_000e = (ushort)(uVar12 >> 0x10);
      DAT_data_000f = (undefined2)uVar12;
      DAT_data_003c = (ushort)(uVar15 >> 0x10);
      DAT_data_003d = (ushort)uVar15;
      DAT_data_0016 = (ushort)(uVar14 >> 0x10);
      DAT_data_0017 = (word)uVar14;
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
      PA5 = DAT_data_001a;
      if (DAT_data_005c == 0) {
        PA1 = DAT_data_0032;
        PA2 = DAT_data_0038;
      }
      else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
        PA1 = DAT_data_0016;
        PA2 = DAT_data_0017;
      }
      uVar13 = (uVar13 & 0xffff0000) + (uVar13 & 0xffff) + (int)*(short *)(uVar16 & 0xff);
      DAT_data_000a = (ushort)(uVar13 >> 0x10);
      DAT_data_000b = (word)uVar13;
      DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
      DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
      DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
      DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
      uVar14 = (uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
               (int)*(short *)(uVar16 + 1 & 0xff);
      DAT_data_0016 = (ushort)(uVar14 >> 0x10);
      DAT_data_0017 = (word)uVar14;
      uVar15 = (uint)DAT_data_003c * 0x10000 + (uVar15 & 0xffff) +
               (int)(short)DAT_data_003f * -0x800;
      if (0 < (int)uVar15) {
        DAT_data_003c = (ushort)(uVar15 >> 0x10);
        DAT_data_003d = (ushort)uVar15;
        if (DAT_data_004b == 0) {
          if (DAT_data_004c != 0) {
            DAT_data_0079 = DAT_data_004c;
            DAT_data_003f = DAT_data_0068;
          }
        }
        else {
          DAT_data_0078 = DAT_data_004b;
          DAT_data_003f = DAT_data_0068;
        }
        if ((int)((uint)*(ushort *)(uVar16 & 0xff) << 0x10) < 0) {
          if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                    (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff)) < 1) goto LAB_prog_0c95;
        }
        else if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) +
                            (uint)DAT_data_000e * -0x10000) - (uVar12 & 0xffff))) {
LAB_prog_0c95:
          DAT_data_003f = DAT_data_0068;
        }
        iVar9 = ((uint)DAT_data_0016 * 0x10000 + (uVar14 & 0xffff) + (uint)DAT_data_000a * -0x10000)
                - (uVar13 & 0xffff);
        if (iVar9 < 0) {
          iVar9 = -iVar9;
        }
        if (-1 < iVar9 + (int)DAT_data_0052 * -0x200) {
          FUN_prog_0ded();
          iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar11 = CONCAT22(DAT_data_007b,DAT_data_007c);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar12 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar15 = CONCAT22(DAT_data_003c,DAT_data_003d);
          uVar14 = CONCAT22(DAT_data_0016,DAT_data_0017);
          uVar13 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        goto LAB_prog_0c24;
      }
      if (DAT_data_0078 == 0) {
        if (DAT_data_0079 != 0) goto code_p0x0b5f;
        if (DAT_data_0069 == 0) break;
      }
LAB_prog_0b30:
      DAT_data_0077 = 0;
      uVar15 = (uint)DAT_data_003d;
      DAT_data_0078 = 0;
      DAT_data_0079 = 0;
      DAT_data_0039 = DAT_data_0003;
      DAT_data_003e = DAT_data_0064;
      DAT_data_003f = DAT_data_0065;
      uVar11 = (uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006c;
      uVar12 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
      uVar13 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
      iVar9 = (int)(short)(uVar13 >> 0x10) << 7;
      DAT_data_0010 = (word)((uint)iVar9 >> 0x10);
      DAT_data_0011 = ((ushort)((uint)((int)(short)uVar13 << 7) >> 0x10) & 0x7f) + (short)iVar9;
      uVar16 = 0x40;
      uVar14 = uVar13;
      goto LAB_prog_0b91;
    }
    if (DAT_data_004b != 0) goto LAB_prog_0b30;
    if (DAT_data_004c != 0) goto code_p0x0b5f;
    if (DAT_data_005f == 0) {
      if (DAT_data_0050 != 0) {
        DAT_data_0038 = 4;
        DAT_data_0026 = 0;
        uVar11 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
        DAT_data_0018 = PA7;
        while( true ) {
          DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
          DAT_data_0037 = (undefined2)iVar10;
          DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
          DAT_data_0035 = (undefined2)uVar8;
          DAT_data_000a = (ushort)(uVar11 >> 0x10);
          DAT_data_000b = (word)uVar11;
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar7 = PA6;
            *(word *)(wVar1 & 0xff) = wVar7;
            iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
            uVar11 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_000a = (ushort)(uVar11 >> 0x10);
          DAT_data_000b = (word)uVar11;
          DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
          PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
          PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
                (short)((int)(short)DAT_data_000a << 7);
          wVar1 = PA4;
          wVar7 = PA4;
          PA5 = (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)wVar7 -
                               (int)(short)DAT_data_0014 * (int)(short)wVar1) +
                              (int)(short)wVar1 * 0x8000) * 2) >> 0x10);
          if (DAT_data_005c == 0) {
            PA1 = DAT_data_0032;
            PA2 = DAT_data_0038;
          }
          else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
            PA1 = DAT_data_000a;
            PA2 = DAT_data_000b;
          }
          uVar11 = (uint)DAT_data_000a * 0x10000 + (uVar11 & 0xffff) + (int)DAT_data_0026;
          uVar16 = (ushort)(uVar11 >> 0x10);
          iVar9 = ((int)DAT_data_0040 * 0x8000 - (int)DAT_data_0051 * (int)DAT_data_0040) +
                  (int)DAT_data_0051 * (int)DAT_data_0026;
          if (iVar9 < 0) {
            iVar9 = iVar9 + (short)DAT_data_0003;
          }
          DAT_data_0026 = (short)((uint)(iVar9 << 1) >> 0x10);
          if (DAT_data_0050 == 0) break;
          if ((int)(((uint)uVar16 * 0x10000 + (uVar11 & 0xffff) + (uint)DAT_data_0060 * -0x10000) -
                   (uint)DAT_data_0061) < 1) {
            uVar11 = (uint)DAT_data_0060 * 0x10000 + (uint)DAT_data_0061;
          }
          else if (-1 < (int)(((uint)uVar16 * 0x10000 + (uVar11 & 0xffff) +
                              (uint)DAT_data_0062 * -0x10000) - (uint)DAT_data_0063)) {
            uVar11 = (uint)DAT_data_0062 * 0x10000 + (uint)DAT_data_0063;
          }
        }
        uVar11 = 0;
        goto LAB_prog_084e;
      }
      if (DAT_data_004d != 0) {
        DAT_data_0038 = 2;
        uVar11 = (uVar8 & 0xffff0000) + (uVar8 & 0xffff);
        DAT_data_0018 = PA7;
LAB_prog_08de:
        DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
        DAT_data_0037 = (undefined2)iVar10;
        DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
        DAT_data_0035 = (undefined2)uVar8;
        DAT_data_000a = (ushort)(uVar11 >> 0x10);
        DAT_data_000b = (word)uVar11;
        wVar1 = PA5;
        if ((wVar1 & DAT_data_0005) != 0) {
          wVar7 = PA6;
          *(word *)(wVar1 & 0xff) = wVar7;
          iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
          uVar11 = CONCAT22(DAT_data_000a,DAT_data_000b);
        }
        DAT_data_000a = (ushort)(uVar11 >> 0x10);
        DAT_data_000b = (word)uVar11;
        iVar9 = (uint)DAT_data_0018 * 0x10000;
        if (iVar9 < 0) {
          iVar9 = (uint)DAT_data_0018 * -0x10000;
        }
        wVar1 = (word)((uint)iVar9 >> 0x10);
        PA5 = DAT_data_0018;
        iVar9 = (int)(short)DAT_data_0032;
        DAT_data_0032 = wVar1;
        if (-1 < iVar9 * DAT_data_0055 + (int)(short)wVar1 * -0x8000) {
          DAT_data_0032 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
        }
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0032;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = DAT_data_000a;
          PA2 = DAT_data_000b;
        }
        uVar11 = (uint)DAT_data_000a * 0x10000 + (uVar11 & 0xffff) +
                 (int)(short)DAT_data_0001 * 0x200;
        if (0 < (int)uVar11) {
          uVar11 = (uVar8 & 0xffff0000) + (uVar8 & 0xffff);
        }
        DAT_data_000a = (ushort)(uVar11 >> 0x10);
        DAT_data_000b = (word)uVar11;
        PA3 = (word)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_0056 * -0x10000 >> 0x10);
        wVar1 = PA3;
        DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        DAT_data_0011 =
             ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
             (short)((int)(short)DAT_data_000a << 7);
        if ((int)((uint)DAT_data_005a << 0x10) < 1) {
          if (((int)((uint)DAT_data_005a << 0x10) < 0) &&
             (0 < (int)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_0056 * -0x10000))) {
code_p0x0962:
            iVar10 = (uint)DAT_data_000a * 0x10000 + (uVar11 & 0xffff);
            DAT_data_0018 = PA7;
            uVar11 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 +
                     (int)DAT_data_0057 * 0x200;
LAB_prog_098e:
            do {
              DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
              DAT_data_0035 = (undefined2)uVar8;
              DAT_data_000a = (ushort)(uVar11 >> 0x10);
              DAT_data_000b = (word)uVar11;
              DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
              DAT_data_0037 = (undefined2)iVar10;
              wVar1 = PA5;
              if ((wVar1 & DAT_data_0005) != 0) {
                wVar7 = PA6;
                *(word *)(wVar1 & 0xff) = wVar7;
                uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
                iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
                uVar11 = CONCAT22(DAT_data_000a,DAT_data_000b);
              }
              DAT_data_000a = (ushort)(uVar11 >> 0x10);
              DAT_data_000b = (word)uVar11;
              PA0 = DAT_data_0010;
              PA7 = DAT_data_0011;
              PA4 = DAT_data_0018;
              PA5 = DAT_data_0018;
              PA6 = DAT_data_0018;
              if (DAT_data_005c == 0) {
                PA1 = DAT_data_0032;
                PA2 = 3;
              }
              else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
                PA1 = DAT_data_000a;
                PA2 = DAT_data_000b;
              }
              uVar11 = (uint)DAT_data_000a * 0x10000 + (uVar11 & 0xffff) +
                       (int)(short)DAT_data_0001 * 0x200;
              uVar16 = (ushort)(uVar11 >> 0x10);
              iVar9 = (int)(short)uVar16 << 7;
              DAT_data_0010 = (word)((uint)iVar9 >> 0x10);
              DAT_data_0011 =
                   ((ushort)((uint)((int)(short)uVar11 << 7) >> 0x10) & 0x7f) + (short)iVar9;
              iVar9 = (uint)DAT_data_0018 * 0x10000;
              if (iVar9 < 0) {
                iVar9 = (uint)DAT_data_0018 * -0x10000;
              }
              wVar1 = (word)((uint)iVar9 >> 0x10);
              iVar9 = (int)(short)DAT_data_0032;
              DAT_data_0032 = wVar1;
              if (-1 < iVar9 * DAT_data_0055 + (int)(short)wVar1 * -0x8000) {
                DAT_data_0032 = (word)((uint)(iVar9 * DAT_data_0055 * 2) >> 0x10);
              }
              DAT_data_0018 = PA7;
            } while ((DAT_data_004f == 0) &&
                    ((int)(((uint)uVar16 * 0x10000 + (uVar11 & 0xffff) +
                           (uint)DAT_data_0044 * -0x10000) - (uint)DAT_data_0045) < 0));
            goto LAB_prog_084e;
          }
        }
        else {
          if (0 < (int)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_0056 * -0x10000))
          goto code_p0x0962;
          if (0 < (int)((uint)wVar1 << 0x10)) {
            iVar10 = (uint)DAT_data_000a * 0x10000 + (uVar11 & 0xffff);
            DAT_data_0018 = PA7;
            uVar11 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 +
                     (int)DAT_data_0057 * 0x200;
            goto LAB_prog_098e;
          }
        }
        if (DAT_data_004e != 0) {
          DAT_data_0018 = PA7;
          uVar11 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
          goto LAB_prog_098e;
        }
        DAT_data_0018 = PA7;
        if (DAT_data_004f != 0) goto LAB_prog_084e;
        goto LAB_prog_08de;
      }
      DAT_data_0018 = PA7;
      goto LAB_prog_084e;
    }
    DAT_data_0038 = 5;
    uVar11 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
    iVar9 = (int)(short)(uVar11 >> 0x10) << 7;
    DAT_data_0010 = (word)((uint)iVar9 >> 0x10);
    DAT_data_0011 = ((ushort)((uint)((int)(short)uVar11 << 7) >> 0x10) & 0x7f) + (short)iVar9;
    do {
      DAT_data_0036 = (undefined2)((uint)iVar10 >> 0x10);
      DAT_data_0037 = (undefined2)iVar10;
      DAT_data_0034 = (undefined2)(uVar8 >> 0x10);
      DAT_data_0035 = (undefined2)uVar8;
      DAT_data_000a = (ushort)(uVar11 >> 0x10);
      DAT_data_000b = (word)uVar11;
      wVar1 = PA5;
      if ((wVar1 & DAT_data_0005) != 0) {
        wVar7 = PA6;
        *(word *)(wVar1 & 0xff) = wVar7;
        iVar10 = CONCAT22(DAT_data_0036,DAT_data_0037);
        uVar8 = CONCAT22(DAT_data_0034,DAT_data_0035);
        uVar11 = CONCAT22(DAT_data_000a,DAT_data_000b);
      }
      DAT_data_000a = (ushort)(uVar11 >> 0x10);
      DAT_data_000b = (word)uVar11;
      PA0 = DAT_data_0010;
      PA7 = DAT_data_0011;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      wVar1 = PA4;
      PA4 = wData0000;
      if (DAT_data_005c == 0) {
        PA1 = wData0000;
        PA2 = DAT_data_0038;
      }
      else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
        PA1 = DAT_data_000a;
        PA2 = DAT_data_000b;
      }
      uVar11 = (uint)DAT_data_000a * 0x10000 + (uVar11 & 0xffff) +
               (int)(short)DAT_data_0001 * 0x1000;
      uVar16 = (ushort)(uVar11 >> 0x10);
      iVar9 = (int)(short)uVar16 << 7;
      DAT_data_0010 = (word)((uint)iVar9 >> 0x10);
      DAT_data_0011 = ((ushort)((uint)((int)(short)uVar11 << 7) >> 0x10) & 0x7f) + (short)iVar9;
    } while ((DAT_data_004f == 0) &&
            ((int)(((uint)uVar16 * 0x10000 + (uVar11 & 0xffff) + (uint)DAT_data_0044 * -0x10000) -
                  (uint)DAT_data_0045) < 0));
  } while( true );
  if (DAT_data_006a == 0) {
    uVar11 = (uint)DAT_data_000e * 0x10000 + (uVar12 & 0xffff);
    goto LAB_prog_084e;
  }
  goto LAB_prog_0b61;
}


// ===== FUN_prog_0ded @ prog:0ded =====

void FUN_prog_0ded(void)

{
  word wVar1;
  ushort uVar2;
  uint uVar3;
  word wVar4;
  bool bVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  int iVar20;
  uint uVar21;
  uint uVar22;
  uint uVar23;
  uint uVar24;
  uint uVar25;
  int iVar26;
  ushort in_AR0;
  ushort uVar27;
  bool bVar28;
  undefined2 uStackfe;
  
  wVar1 = PA5;
  if ((wVar1 & DAT_data_0005) != 0) {
    wVar4 = PA6;
    *(word *)(wVar1 & 0xff) = wVar4;
  }
  PA0 = DAT_data_0010;
  PA7 = DAT_data_0011;
  wVar1 = PA4;
  wVar4 = PA4;
  PA5 = (word)((uint)((int)(short)((uint)((((int)(short)DAT_data_0014 * (int)(short)wVar4 -
                                           (int)(short)DAT_data_0014 * (int)(short)wVar1) +
                                          (int)(short)wVar1 * 0x8000) * 2) >> 0x10) *
                      (int)(short)DAT_data_003c * 2) >> 0x10);
  uVar6 = (uint)DAT_data_000a * 0x10000 + (uint)DAT_data_000b + (int)*(short *)(in_AR0 & 0xff);
  uVar27 = in_AR0 + 1;
  DAT_data_000a = (ushort)(uVar6 >> 0x10);
  DAT_data_000b = (ushort)uVar6;
  DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
  DAT_data_0011 =
       ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
       (short)((int)(short)DAT_data_000a << 7);
  DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
  uVar7 = (uint)DAT_data_0016 * 0x10000 + (uint)DAT_data_0017 + (int)*(short *)(uVar27 & 0xff);
  DAT_data_0016 = (ushort)(uVar7 >> 0x10);
  DAT_data_0017 = (ushort)uVar7;
  DAT_data_002b = (undefined2)((uint)((int)(short)DAT_data_0010 << 10) >> 0x10);
  DAT_data_002c =
       ((ushort)((int)(short)DAT_data_0010 << 10) |
       (uData0002 << 10 ^ uData0002) & (ushort)((uint)((int)(short)DAT_data_0011 << 10) >> 0x10)) &
       DAT_data_002e;
  iVar8 = (uint)*(ushort *)(in_AR0 & 0xff) * 0x10000;
  if (iVar8 < 0) {
    iVar8 = (uint)*(ushort *)(in_AR0 & 0xff) * -0x10000;
  }
  iVar9 = (uint)*(ushort *)(uVar27 & 0xff) * 0x10000;
  if (iVar9 < 0) {
    iVar9 = (uint)*(ushort *)(uVar27 & 0xff) * -0x10000;
  }
  iVar8 = (int)(short)((uint)(iVar9 + iVar8) >> 0x10) * (int)DAT_data_007f;
  DAT_data_004a = (ushort)((uint)(iVar8 * 2) >> 0x10);
  if ((int)(iVar8 + (uint)DAT_data_007e * -0x10000) < 0) {
    DAT_data_004a = DAT_data_007e;
  }
  DAT_data_007a = 0;
  if (DAT_data_004f != 0) {
    DAT_data_007a = DAT_data_004f;
  }
  uVar10 = (uint)DAT_data_0030;
  iVar8 = (int)DAT_data_0031;
  iVar11 = uVar10 + iVar8;
  DAT_data_0031 = (short)iVar11;
  iVar9 = (int)(short)DAT_data_0030;
  DAT_data_0030 = DAT_data_0031 + DAT_data_0030;
  wVar1 = PA5;
  if ((wVar1 & DAT_data_0005) != 0) {
    wVar4 = PA6;
    *(word *)(wVar1 & 0xff) = wVar4;
    uVar7 = CONCAT22(DAT_data_0016,DAT_data_0017);
    uVar6 = CONCAT22(DAT_data_000a,DAT_data_000b);
  }
  DAT_data_0016 = (ushort)(uVar7 >> 0x10);
  DAT_data_000a = (ushort)(uVar6 >> 0x10);
  PA0 = DAT_data_0010;
  PA7 = DAT_data_0011;
  wVar1 = PA4;
  wVar4 = PA4;
  iVar12 = (int)(short)DAT_data_0014 * (int)(short)wVar4 -
           (int)(short)DAT_data_0014 * (int)(short)wVar1;
  PA0 = DAT_data_002d;
  PA7 = DAT_data_002c;
  DAT_data_0027 = PA4;
  DAT_data_0028 = PA4;
  DAT_data_0029 = PA4;
  DAT_data_002a = PA4;
  PA5 = (word)((uint)((int)(short)((uint)((iVar12 + (int)(short)wVar1 * 0x8000) * 2) >> 0x10) *
                      (int)(short)DAT_data_003c * 2) >> 0x10);
  if (DAT_data_004f != 0) {
    DAT_data_007a = DAT_data_004f;
  }
  iVar13 = (uint)DAT_data_0016 * 0x10000 + (uVar7 & 0xffff);
  iVar14 = iVar13 + (uint)DAT_data_000a * -0x10000;
  bVar28 = ((((SCARRY4(uVar10,iVar8) || SCARRY4(iVar11,iVar9)) ||
             SCARRY4(iVar12,(int)(short)wVar1 * 0x8000)) ||
            SCARRY4((uint)DAT_data_0016 * 0x10000,uVar7 & 0xffff)) ||
           SBORROW4(iVar13,(uint)DAT_data_000a * 0x10000)) || SBORROW4(iVar14,uVar6 & 0xffff);
  if ((int)(iVar14 - (uVar6 & 0xffff)) < 1) {
    bVar28 = bVar28 || SBORROW4((uint)DAT_data_002a * 0x10000,(uint)DAT_data_0054 * 0x10000);
    DAT_data_0015 = DAT_data_0029;
    if ((int)((uint)DAT_data_002a * 0x10000 + (uint)DAT_data_0054 * -0x10000) < 0) {
      iVar8 = (int)(short)DAT_data_0030 * (int)DAT_data_0053;
      if (iVar8 < 0) {
        iVar8 = -iVar8;
      }
      bVar28 = bVar28 || SCARRY4(iVar8,(int)DAT_data_0053 * 0x8000);
      DAT_data_0015 = (word)((uint)(iVar8 + (int)DAT_data_0053 * 0x8000) >> 0x10);
    }
  }
  else {
    bVar28 = bVar28 || SBORROW4(0,(int)(short)DAT_data_0027);
    DAT_data_0015 = -DAT_data_0027;
  }
  iVar8 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff);
  iVar9 = iVar8 + *(short *)(in_AR0 & 0xff);
  uVar10 = iVar9 + (int)(short)DAT_data_0015 * -0x200;
  uVar15 = (int)(short)(uVar10 >> 0x10) << 7;
  DAT_data_0010 = (word)(uVar15 >> 0x10);
  uVar16 = ((int)(short)uVar10 & 0x1ffffffU) >> 9 & 0x7f;
  DAT_data_0011 = (short)uVar16 + (short)uVar15;
  uVar17 = (int)(short)((uint)iVar9 >> 0x10) << 7;
  DAT_data_0012 = (word)(uVar17 >> 0x10);
  uVar18 = ((int)(short)iVar9 & 0x1ffffffU) >> 9 & 0x7f;
  DAT_data_0013 = (short)uVar18 + (short)uVar17;
  DAT_data_0014 = (short)uVar10 << 6 & DAT_data_0003;
  DAT_data_0021 = 0;
  iVar11 = (uint)DAT_data_0016 * 0x10000 + (uVar7 & 0xffff);
  uVar19 = iVar11 + *(short *)(uVar27 & 0xff);
  bVar28 = (bool)(bVar28 | SCARRY4((uint)DAT_data_000a * 0x10000,uVar6 & 0xffff) |
                  SCARRY4(iVar8,(int)*(short *)(in_AR0 & 0xff)) |
                  SBORROW4(iVar9,(int)(short)DAT_data_0015 * 0x200) |
                  SCARRY4(uVar16,uVar15 & 0xffff) | SCARRY4(uVar18,uVar17 & 0xffff) |
                  SCARRY4((uint)DAT_data_0016 * 0x10000,uVar7 & 0xffff) |
                 SCARRY4(iVar11,(int)*(short *)(uVar27 & 0xff)));
  do {
    DAT_data_0016 = (ushort)(uVar19 >> 0x10);
    DAT_data_0017 = (ushort)uVar19;
    DAT_data_000a = (ushort)(uVar10 >> 0x10);
    DAT_data_000b = (ushort)uVar10;
    wVar1 = PA5;
    if ((wVar1 & DAT_data_0005) != 0) {
      wVar4 = PA6;
      *(word *)(wVar1 & 0xff) = wVar4;
      uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
      uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
    }
    iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
    uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
    uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
    uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
    PA0 = DAT_data_0010;
    PA7 = DAT_data_0011;
    DAT_data_001c = PA4;
    DAT_data_001d = PA4;
    PA0 = DAT_data_0012;
    PA7 = DAT_data_0013;
    DAT_data_001f = PA4;
    DAT_data_0020 = PA4;
    iVar12 = (int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
             (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c;
    DAT_data_001b = (short)((uint)((iVar12 + (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
    iVar13 = (int)(short)DAT_data_0014 * (int)(short)DAT_data_0020 -
             (int)(short)DAT_data_0014 * (int)(short)DAT_data_001f;
    DAT_data_001e = (short)((uint)((iVar13 + (int)(short)DAT_data_001f * 0x8000) * 2) >> 0x10);
    iVar14 = (int)(short)DAT_data_0021 * (int)DAT_data_001b -
             (int)(short)DAT_data_0021 * (int)DAT_data_001e;
    DAT_data_001a =
         (word)((uint)((int)(short)DAT_data_003c *
                       (int)(short)((uint)((iVar14 + (int)DAT_data_001e * 0x8000) * 2) >> 0x10) * 2)
               >> 0x10);
    PA5 = DAT_data_001a;
    uVar18 = uVar10 & 0xffff0000;
    uVar6 = uVar10 & 0xffff;
    iVar20 = uVar18 + uVar6;
    uVar10 = iVar20 + *(short *)(in_AR0 & 0xff);
    DAT_data_000a = (ushort)(uVar10 >> 0x10);
    DAT_data_000b = (ushort)uVar10;
    iVar11 = uVar10 + (int)(short)DAT_data_0015 * 0x200;
    DAT_data_000c = (short)((uint)iVar11 >> 0x10);
    DAT_data_000d = (short)iVar11;
    uVar21 = (int)(short)DAT_data_000a << 7;
    DAT_data_0010 = (word)(uVar21 >> 0x10);
    uVar22 = ((int)(short)DAT_data_000b & 0x1ffffffU) >> 9 & 0x7f;
    DAT_data_0011 = (short)uVar22 + (short)uVar21;
    uVar23 = (int)DAT_data_000c << 7;
    DAT_data_0012 = (word)(uVar23 >> 0x10);
    DAT_data_0006 = (ushort)((uint)((int)(short)iVar11 << 7) >> 0x10);
    uVar24 = (uint)DAT_data_0006 & 0x7f;
    DAT_data_0013 = (short)uVar24 + (short)uVar23;
    DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
    uVar25 = uVar19 & 0xffff0000;
    uVar7 = uVar19 & 0xffff;
    iVar26 = uVar25 + uVar7;
    iVar8 = (int)*(short *)(in_AR0 + 1 & 0xff);
    uVar19 = iVar26 + iVar8;
    DAT_data_0016 = (short)(uVar19 >> 0x10);
    DAT_data_0017 = (short)uVar19;
    if (DAT_data_004f != 0) {
      DAT_data_007a = DAT_data_004f;
    }
    uVar3 = (uint)DAT_data_0021;
    DAT_data_0021 = (ushort)(uVar3 * 0x10000 + (uint)DAT_data_004a * 0x10000 >> 0x10);
    bVar5 = !bVar28;
    bVar28 = false;
  } while (((((((((((bVar5 && !SCARRY4(iVar12,(int)(short)DAT_data_001c * 0x8000)) &&
                   !SCARRY4(iVar13,(int)(short)DAT_data_001f * 0x8000)) &&
                  !SCARRY4(iVar14,(int)DAT_data_001e * 0x8000)) && !SCARRY4(uVar18,uVar6)) &&
                !SCARRY4(iVar20,(int)*(short *)(in_AR0 & 0xff))) &&
               !SCARRY4(uVar10,(int)(short)DAT_data_0015 * 0x200)) &&
              !SCARRY4(uVar22,uVar21 & 0xffff)) && !SCARRY4(uVar24,uVar23 & 0xffff)) &&
            !SCARRY4(uVar25,uVar7)) && !SCARRY4(iVar26,iVar8)) &&
           !SCARRY4(uVar3 * 0x10000,(uint)DAT_data_004a * 0x10000));
  if (DAT_data_007a == 0) {
    return;
  }
LAB_prog_0c24:
  do {
    DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
    DAT_data_0037 = (undefined2)iVar9;
    DAT_data_007b = (ushort)(uVar15 >> 0x10);
    DAT_data_007c = (undefined2)uVar15;
    DAT_data_000e = (ushort)(uVar16 >> 0x10);
    DAT_data_000f = (undefined2)uVar16;
    DAT_data_000c = (short)((uint)iVar11 >> 0x10);
    DAT_data_000d = (short)iVar11;
    DAT_data_003c = (ushort)(uVar17 >> 0x10);
    DAT_data_003d = (ushort)uVar17;
    DAT_data_0016 = (ushort)(uVar19 >> 0x10);
    DAT_data_0017 = (ushort)uVar19;
    DAT_data_000a = (ushort)(uVar10 >> 0x10);
    DAT_data_000b = (ushort)uVar10;
    wVar1 = PA5;
    if ((wVar1 & DAT_data_0005) != 0) {
      wVar4 = PA6;
      *(word *)(wVar1 & 0xff) = wVar4;
      iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
      uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
      uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
      uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
      uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
      iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
      uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
    }
    DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
    DAT_data_0037 = (undefined2)iVar9;
    DAT_data_007b = (ushort)(uVar15 >> 0x10);
    DAT_data_007c = (undefined2)uVar15;
    DAT_data_000e = (ushort)(uVar16 >> 0x10);
    DAT_data_000f = (undefined2)uVar16;
    DAT_data_003c = (ushort)(uVar17 >> 0x10);
    DAT_data_003d = (ushort)uVar17;
    DAT_data_0016 = (ushort)(uVar19 >> 0x10);
    DAT_data_0017 = (ushort)uVar19;
    DAT_data_000c = (short)((uint)iVar11 >> 0x10);
    DAT_data_000d = (short)iVar11;
    PA0 = DAT_data_0010;
    PA7 = DAT_data_0011;
    DAT_data_001c = PA4;
    DAT_data_001d = PA4;
    DAT_data_001a =
         (word)((uint)((int)(short)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                                            (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                                           (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10) *
                       (int)(short)DAT_data_003c * 2) >> 0x10);
    PA5 = DAT_data_001a;
    if (DAT_data_005c == 0) {
      PA1 = DAT_data_0032;
      PA2 = DAT_data_0038;
    }
    else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
      PA1 = DAT_data_0016;
      PA2 = DAT_data_0017;
    }
    uVar10 = (uVar10 & 0xffff0000) + (uVar10 & 0xffff) + (int)*(short *)(in_AR0 & 0xff);
    DAT_data_000a = (ushort)(uVar10 >> 0x10);
    DAT_data_000b = (ushort)uVar10;
    DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
    DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
    DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
    DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
    uVar19 = (uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) + (int)*(short *)(in_AR0 + 1 & 0xff);
    DAT_data_0016 = (ushort)(uVar19 >> 0x10);
    DAT_data_0017 = (ushort)uVar19;
    uVar17 = (uint)DAT_data_003c * 0x10000 + (uVar17 & 0xffff) + (int)DAT_data_003f * -0x800;
    if ((int)uVar17 < 1) {
      if (DAT_data_0078 == 0) {
        if (DAT_data_0079 != 0) break;
        if (DAT_data_0069 == 0) {
          if (DAT_data_006a != 0) goto LAB_prog_0b61;
          uVar6 = (uint)DAT_data_000e * 0x10000 + (uVar16 & 0xffff);
LAB_prog_084e:
          DAT_data_000c = (short)((uint)iVar11 >> 0x10);
          DAT_data_000d = (short)iVar11;
          DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
          DAT_data_0037 = (undefined2)iVar9;
          DAT_data_000a = (ushort)(uVar6 >> 0x10);
          DAT_data_000b = (ushort)uVar6;
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar4 = PA6;
            *(word *)(wVar1 & 0xff) = wVar4;
            iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
            iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar6 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_000a = (ushort)(uVar6 >> 0x10);
          DAT_data_000b = (ushort)uVar6;
          DAT_data_0038 = 0;
          iVar8 = (uint)DAT_data_0018 * 0x10000;
          if (iVar8 < 0) {
            iVar8 = (uint)DAT_data_0018 * -0x10000;
          }
          DAT_data_003a = (word)((uint)iVar8 >> 0x10);
          iVar8 = (int)(short)DAT_data_0032;
          DAT_data_0032 = DAT_data_003a;
          if (-1 < iVar8 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
            DAT_data_0032 = (word)((uint)(iVar8 * DAT_data_0055 * 2) >> 0x10);
          }
          if (DAT_data_005c == 0) {
            PA1 = DAT_data_0032;
            PA2 = 0;
          }
          else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
            PA1 = DAT_data_000a;
            PA2 = DAT_data_000b;
          }
          DAT_data_0030 = 0xf1;
          DAT_data_0031 = 0xfb;
          if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
            iVar8 = (uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005d * -0x10000;
            DAT_data_0039 = (ushort)((uint)iVar8 >> 0x10);
            if (iVar8 < 0) goto LAB_prog_089d;
            PA3 = DAT_data_0001;
            DAT_data_003b = PA3;
            if (DAT_data_0058 != 0) goto LAB_prog_0b30;
          }
          else {
            DAT_data_0039 =
                 (ushort)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005e * -0x10000 >> 0x10);
LAB_prog_089d:
            PA3 = wData0000;
            DAT_data_003b = PA3;
          }
          if ((DAT_data_0059 != 0) && (0 < (int)((uint)DAT_data_003b << 0x10))) break;
          if (DAT_data_004b != 0) goto LAB_prog_0b30;
          if (DAT_data_004c != 0) break;
          if (DAT_data_005f == 0) {
            if (DAT_data_0050 == 0) {
              if (DAT_data_004d == 0) {
                DAT_data_0018 = PA7;
                goto LAB_prog_084e;
              }
              DAT_data_0038 = 2;
              uVar6 = (uint)DAT_data_0034 * 0x10000 + (uint)DAT_data_0035;
              DAT_data_0018 = PA7;
LAB_prog_08de:
              DAT_data_000c = (short)((uint)iVar11 >> 0x10);
              DAT_data_000d = (short)iVar11;
              DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
              DAT_data_0037 = (undefined2)iVar9;
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              wVar1 = PA5;
              if ((wVar1 & DAT_data_0005) != 0) {
                wVar4 = PA6;
                *(word *)(wVar1 & 0xff) = wVar4;
                iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
                iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
                uVar6 = CONCAT22(DAT_data_000a,DAT_data_000b);
              }
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              iVar8 = (uint)DAT_data_0018 * 0x10000;
              if (iVar8 < 0) {
                iVar8 = (uint)DAT_data_0018 * -0x10000;
              }
              wVar1 = (word)((uint)iVar8 >> 0x10);
              PA5 = DAT_data_0018;
              iVar8 = (int)(short)DAT_data_0032;
              DAT_data_0032 = wVar1;
              if (-1 < iVar8 * DAT_data_0055 + (int)(short)wVar1 * -0x8000) {
                DAT_data_0032 = (word)((uint)(iVar8 * DAT_data_0055 * 2) >> 0x10);
              }
              if (DAT_data_005c == 0) {
                PA1 = DAT_data_0032;
                PA2 = DAT_data_0038;
              }
              else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
                PA1 = DAT_data_000a;
                PA2 = DAT_data_000b;
              }
              uVar6 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff) +
                      (int)(short)DAT_data_0001 * 0x200;
              if (0 < (int)uVar6) {
                uVar6 = (uint)DAT_data_0034 * 0x10000 + (uint)DAT_data_0035;
              }
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              PA3 = (word)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_0056 * -0x10000 >> 0x10);
              wVar1 = PA3;
              DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
              DAT_data_0011 =
                   ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
                   (short)((int)(short)DAT_data_000a << 7);
              if ((int)((uint)DAT_data_005a << 0x10) < 1) {
                if (((int)((uint)DAT_data_005a << 0x10) < 0) &&
                   (0 < (int)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_0056 * -0x10000))) {
code_p0x0962:
                  iVar9 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff);
                  DAT_data_0018 = PA7;
                  uVar6 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 +
                          (int)DAT_data_0057 * 0x200;
LAB_prog_098e:
                  do {
                    DAT_data_000c = (short)((uint)iVar11 >> 0x10);
                    DAT_data_000d = (short)iVar11;
                    DAT_data_000a = (ushort)(uVar6 >> 0x10);
                    DAT_data_000b = (ushort)uVar6;
                    DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
                    DAT_data_0037 = (undefined2)iVar9;
                    wVar1 = PA5;
                    if ((wVar1 & DAT_data_0005) != 0) {
                      wVar4 = PA6;
                      *(word *)(wVar1 & 0xff) = wVar4;
                      iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
                      iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
                      uVar6 = CONCAT22(DAT_data_000a,DAT_data_000b);
                    }
                    DAT_data_000a = (ushort)(uVar6 >> 0x10);
                    DAT_data_000b = (ushort)uVar6;
                    PA0 = DAT_data_0010;
                    PA7 = DAT_data_0011;
                    PA4 = DAT_data_0018;
                    PA5 = DAT_data_0018;
                    PA6 = DAT_data_0018;
                    if (DAT_data_005c == 0) {
                      PA1 = DAT_data_0032;
                      PA2 = 3;
                    }
                    else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
                      PA1 = DAT_data_000a;
                      PA2 = DAT_data_000b;
                    }
                    uVar6 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff) +
                            (int)(short)DAT_data_0001 * 0x200;
                    uVar27 = (ushort)(uVar6 >> 0x10);
                    iVar8 = (int)(short)uVar27 << 7;
                    DAT_data_0010 = (word)((uint)iVar8 >> 0x10);
                    DAT_data_0011 =
                         ((ushort)((uint)((int)(short)uVar6 << 7) >> 0x10) & 0x7f) + (short)iVar8;
                    iVar8 = (uint)DAT_data_0018 * 0x10000;
                    if (iVar8 < 0) {
                      iVar8 = (uint)DAT_data_0018 * -0x10000;
                    }
                    wVar1 = (word)((uint)iVar8 >> 0x10);
                    iVar8 = (int)(short)DAT_data_0032;
                    DAT_data_0032 = wVar1;
                    if (-1 < iVar8 * DAT_data_0055 + (int)(short)wVar1 * -0x8000) {
                      DAT_data_0032 = (word)((uint)(iVar8 * DAT_data_0055 * 2) >> 0x10);
                    }
                    DAT_data_0018 = PA7;
                  } while ((DAT_data_004f == 0) &&
                          ((int)(((uint)uVar27 * 0x10000 + (uVar6 & 0xffff) +
                                 (uint)DAT_data_0044 * -0x10000) - (uint)DAT_data_0045) < 0));
                  goto LAB_prog_084e;
                }
              }
              else {
                if (0 < (int)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_0056 * -0x10000))
                goto code_p0x0962;
                if (0 < (int)((uint)wVar1 << 0x10)) {
                  iVar9 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff);
                  DAT_data_0018 = PA7;
                  uVar6 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043 +
                          (int)DAT_data_0057 * 0x200;
                  goto LAB_prog_098e;
                }
              }
              if (DAT_data_004e != 0) {
                DAT_data_0018 = PA7;
                uVar6 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
                goto LAB_prog_098e;
              }
              DAT_data_0018 = PA7;
              if (DAT_data_004f != 0) goto LAB_prog_084e;
              goto LAB_prog_08de;
            }
            DAT_data_0038 = 4;
            DAT_data_0026 = 0;
            uVar6 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
            DAT_data_0018 = PA7;
            while( true ) {
              DAT_data_000c = (short)((uint)iVar11 >> 0x10);
              DAT_data_000d = (short)iVar11;
              DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
              DAT_data_0037 = (undefined2)iVar9;
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              wVar1 = PA5;
              if ((wVar1 & DAT_data_0005) != 0) {
                wVar4 = PA6;
                *(word *)(wVar1 & 0xff) = wVar4;
                iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
                iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
                uVar6 = CONCAT22(DAT_data_000a,DAT_data_000b);
              }
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
              PA0 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
              PA7 = ((ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10) & 0x7f) +
                    (short)((int)(short)DAT_data_000a << 7);
              wVar1 = PA4;
              wVar4 = PA4;
              PA5 = (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)wVar4 -
                                   (int)(short)DAT_data_0014 * (int)(short)wVar1) +
                                  (int)(short)wVar1 * 0x8000) * 2) >> 0x10);
              if (DAT_data_005c == 0) {
                PA1 = DAT_data_0032;
                PA2 = DAT_data_0038;
              }
              else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
                PA1 = DAT_data_000a;
                PA2 = DAT_data_000b;
              }
              uVar6 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff) + (int)DAT_data_0026;
              uVar27 = (ushort)(uVar6 >> 0x10);
              iVar8 = ((int)DAT_data_0040 * 0x8000 - (int)DAT_data_0051 * (int)DAT_data_0040) +
                      (int)DAT_data_0051 * (int)DAT_data_0026;
              if (iVar8 < 0) {
                iVar8 = iVar8 + (short)DAT_data_0003;
              }
              DAT_data_0026 = (short)((uint)(iVar8 << 1) >> 0x10);
              if (DAT_data_0050 == 0) break;
              if ((int)(((uint)uVar27 * 0x10000 + (uVar6 & 0xffff) + (uint)DAT_data_0060 * -0x10000)
                       - (uint)DAT_data_0061) < 1) {
                uVar6 = (uint)DAT_data_0060 * 0x10000 + (uint)DAT_data_0061;
              }
              else if (-1 < (int)(((uint)uVar27 * 0x10000 + (uVar6 & 0xffff) +
                                  (uint)DAT_data_0062 * -0x10000) - (uint)DAT_data_0063)) {
                uVar6 = (uint)DAT_data_0062 * 0x10000 + (uint)DAT_data_0063;
              }
            }
            uVar6 = 0;
          }
          else {
            DAT_data_0038 = 5;
            uVar6 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
            iVar8 = (int)(short)(uVar6 >> 0x10) << 7;
            DAT_data_0010 = (word)((uint)iVar8 >> 0x10);
            DAT_data_0011 = ((ushort)((uint)((int)(short)uVar6 << 7) >> 0x10) & 0x7f) + (short)iVar8
            ;
            do {
              DAT_data_000c = (short)((uint)iVar11 >> 0x10);
              DAT_data_000d = (short)iVar11;
              DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
              DAT_data_0037 = (undefined2)iVar9;
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              wVar1 = PA5;
              if ((wVar1 & DAT_data_0005) != 0) {
                wVar4 = PA6;
                *(word *)(wVar1 & 0xff) = wVar4;
                iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
                iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
                uVar6 = CONCAT22(DAT_data_000a,DAT_data_000b);
              }
              DAT_data_000a = (ushort)(uVar6 >> 0x10);
              DAT_data_000b = (ushort)uVar6;
              PA0 = DAT_data_0010;
              PA7 = DAT_data_0011;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              wVar1 = PA4;
              PA4 = wData0000;
              if (DAT_data_005c == 0) {
                PA1 = wData0000;
                PA2 = DAT_data_0038;
              }
              else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
                PA1 = DAT_data_000a;
                PA2 = DAT_data_000b;
              }
              uVar6 = (uint)DAT_data_000a * 0x10000 + (uVar6 & 0xffff) +
                      (int)(short)DAT_data_0001 * 0x1000;
              uVar27 = (ushort)(uVar6 >> 0x10);
              iVar8 = (int)(short)uVar27 << 7;
              DAT_data_0010 = (word)((uint)iVar8 >> 0x10);
              DAT_data_0011 =
                   ((ushort)((uint)((int)(short)uVar6 << 7) >> 0x10) & 0x7f) + (short)iVar8;
            } while ((DAT_data_004f == 0) &&
                    ((int)(((uint)uVar27 * 0x10000 + (uVar6 & 0xffff) +
                           (uint)DAT_data_0044 * -0x10000) - (uint)DAT_data_0045) < 0));
          }
          goto LAB_prog_084e;
        }
      }
LAB_prog_0b30:
      DAT_data_0077 = 0;
      uVar17 = (uint)DAT_data_003d;
      DAT_data_0078 = 0;
      DAT_data_0079 = 0;
      DAT_data_0039 = DAT_data_0003;
      DAT_data_003e = DAT_data_0064;
      DAT_data_003f = DAT_data_0065;
      uVar15 = (uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006c;
      uVar16 = (uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0045;
      uVar10 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
      iVar8 = (int)(short)(uVar10 >> 0x10) << 7;
      DAT_data_0010 = (word)((uint)iVar8 >> 0x10);
      DAT_data_0011 = ((ushort)((uint)((int)(short)uVar10 << 7) >> 0x10) & 0x7f) + (short)iVar8;
      in_AR0 = 0x40;
      uVar19 = uVar10;
LAB_prog_0b91:
      do {
        DAT_data_000c = (short)((uint)iVar11 >> 0x10);
        DAT_data_000d = (short)iVar11;
        DAT_data_003c = (ushort)(uVar17 >> 0x10);
        DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
        DAT_data_0037 = (undefined2)iVar9;
        DAT_data_0016 = (ushort)(uVar19 >> 0x10);
        DAT_data_0017 = (ushort)uVar19;
        DAT_data_000e = (ushort)(uVar16 >> 0x10);
        DAT_data_000f = (undefined2)uVar16;
        DAT_data_007b = (ushort)(uVar15 >> 0x10);
        DAT_data_007c = (undefined2)uVar15;
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
        PA5 = DAT_data_001a;
        if (DAT_data_005c == 0) {
          PA1 = DAT_data_0032;
          PA2 = DAT_data_0038;
        }
        else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
          PA1 = DAT_data_0016;
          PA2 = DAT_data_0017;
        }
        uVar10 = (uVar10 & 0xffff0000) + (uVar10 & 0xffff) + (int)*(short *)(in_AR0 & 0xff);
        DAT_data_000a = (ushort)(uVar10 >> 0x10);
        DAT_data_000b = (ushort)uVar10;
        DAT_data_0010 = (word)((uint)((int)(short)DAT_data_000a << 7) >> 0x10);
        DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_000b << 7) >> 0x10);
        DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)DAT_data_000a << 7);
        DAT_data_0014 = DAT_data_000b << 6 & DAT_data_0003;
        uVar19 = (uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                 (int)*(short *)(in_AR0 + 1 & 0xff);
        DAT_data_0016 = (ushort)(uVar19 >> 0x10);
        DAT_data_0017 = (ushort)uVar19;
        uVar7 = (uint)DAT_data_003c;
        uVar6 = uVar17 & 0xffff;
        iVar8 = uVar7 * 0x10000 + uVar6;
        uVar17 = iVar8 + (int)DAT_data_003e * 0x800;
        DAT_data_003c = (ushort)(uVar17 >> 0x10);
        DAT_data_003d = (ushort)uVar17;
        if (SCARRY4(uVar7 * 0x10000,uVar6) || SCARRY4(iVar8,(int)DAT_data_003e * 0x800)) {
LAB_prog_0d23:
          DAT_data_000c = (short)((uint)iVar11 >> 0x10);
          DAT_data_000d = (short)iVar11;
          DAT_data_003c = (ushort)(uVar17 >> 0x10);
          DAT_data_003d = (ushort)uVar17;
          DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
          DAT_data_0037 = (undefined2)iVar9;
          DAT_data_0016 = (ushort)(uVar19 >> 0x10);
          DAT_data_0017 = (ushort)uVar19;
          DAT_data_000a = (ushort)(uVar10 >> 0x10);
          DAT_data_000b = (ushort)uVar10;
          DAT_data_007b = (ushort)(uVar15 >> 0x10);
          DAT_data_007c = (undefined2)uVar15;
          DAT_data_000e = (ushort)(uVar16 >> 0x10);
          DAT_data_000f = (undefined2)uVar16;
          if (DAT_data_004f != 0) goto LAB_prog_0c24;
          if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
            if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                      (uint)DAT_data_007b * -0x10000) - (uVar15 & 0xffff)) < 1) goto LAB_prog_0c24;
            DAT_data_0018 = PA7;
            iVar8 = ((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                    (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
            if (iVar8 < 0) {
              iVar8 = -iVar8;
            }
            if (iVar8 + (int)DAT_data_0052 * -0x200 < 0) goto LAB_prog_0d60;
LAB_prog_0cc3:
            DAT_data_000c = (short)((uint)iVar11 >> 0x10);
            DAT_data_000d = (short)iVar11;
            DAT_data_003c = (ushort)(uVar17 >> 0x10);
            DAT_data_003d = (ushort)uVar17;
            DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
            DAT_data_0037 = (undefined2)iVar9;
            DAT_data_007b = (ushort)(uVar15 >> 0x10);
            DAT_data_007c = (undefined2)uVar15;
            DAT_data_0016 = (ushort)(uVar19 >> 0x10);
            DAT_data_0017 = (ushort)uVar19;
            DAT_data_000e = (ushort)(uVar16 >> 0x10);
            DAT_data_000f = (undefined2)uVar16;
            DAT_data_000a = (ushort)(uVar10 >> 0x10);
            DAT_data_000b = (ushort)uVar10;
            uStackfe = 0x198a;
            FUN_prog_0ded();
            iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
            uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
            iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
            uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          else {
            if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                           (uint)DAT_data_007b * -0x10000) - (uVar15 & 0xffff))) goto LAB_prog_0c24;
            DAT_data_0018 = PA7;
            iVar8 = ((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                    (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
            if (iVar8 < 0) {
              iVar8 = -iVar8;
            }
            if (-1 < iVar8 + (int)DAT_data_0052 * -0x200) goto LAB_prog_0cc3;
LAB_prog_0d60:
            wVar1 = PA5;
            if ((wVar1 & DAT_data_0005) != 0) {
              wVar4 = PA6;
              *(word *)(wVar1 & 0xff) = wVar4;
              iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
              uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
              iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
              uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
              uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
              uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
              uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
            }
            DAT_data_003d = (ushort)uVar17;
            DAT_data_007b = (ushort)(uVar15 >> 0x10);
            iVar8 = (uint)DAT_data_0018 * 0x10000;
            if (iVar8 < 0) {
              iVar8 = (uint)DAT_data_0018 * -0x10000;
            }
            DAT_data_003a = (word)((uint)iVar8 >> 0x10);
            PA0 = DAT_data_0010;
            PA7 = DAT_data_0011;
            DAT_data_001c = PA4;
            DAT_data_001d = PA4;
            DAT_data_001a =
                 (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                                (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                               (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
            PA5 = DAT_data_001a;
            uVar10 = (uVar10 & 0xffff0000) + (uVar10 & 0xffff) + (int)*(short *)(in_AR0 & 0xff);
            uVar27 = (ushort)(uVar10 >> 0x10);
            PA3 = DAT_data_0077;
            DAT_data_003b = PA3;
            DAT_data_0010 = (word)((uint)((int)(short)uVar27 << 7) >> 0x10);
            DAT_data_0006 = (ushort)((uint)((int)(short)uVar10 << 7) >> 0x10);
            DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)((int)(short)uVar27 << 7);
            DAT_data_0014 = (short)uVar10 << 6 & DAT_data_0003;
            uVar19 = (uVar19 & 0xffff0000) + (uVar19 & 0xffff) + (int)*(short *)(in_AR0 + 1 & 0xff);
            uVar2 = (ushort)(uVar19 >> 0x10);
            iVar8 = (int)(short)DAT_data_0032;
            DAT_data_0032 = DAT_data_003a;
            if (-1 < iVar8 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
              DAT_data_0032 = (word)((uint)(iVar8 * DAT_data_0055 * 2) >> 0x10);
            }
            if ((DAT_data_0058 & DAT_data_0077) != 0) goto LAB_prog_0b30;
            if ((DAT_data_0059 & DAT_data_003b) != 0) goto code_p0x0b5f;
            if (DAT_data_004f != 0) goto LAB_prog_0c24;
            if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
              if ((int)(((uint)uVar2 * 0x10000 + (uVar19 & 0xffff) + (uint)DAT_data_007b * -0x10000)
                       - (uVar15 & 0xffff)) < 1) goto LAB_prog_0c24;
              DAT_data_0018 = PA7;
              iVar8 = ((uint)uVar2 * 0x10000 + (uVar19 & 0xffff) + (uint)uVar27 * -0x10000) -
                      (uVar10 & 0xffff);
              if (iVar8 < 0) {
                iVar8 = -iVar8;
              }
              iVar8 = iVar8 + (int)DAT_data_0052 * -0x200;
            }
            else {
              if (-1 < (int)(((uint)uVar2 * 0x10000 + (uVar19 & 0xffff) +
                             (uint)DAT_data_007b * -0x10000) - (uVar15 & 0xffff)))
              goto LAB_prog_0c24;
              DAT_data_0018 = PA7;
              iVar8 = ((uint)uVar2 * 0x10000 + (uVar19 & 0xffff) + (uint)uVar27 * -0x10000) -
                      (uVar10 & 0xffff);
              if (iVar8 < 0) {
                iVar8 = -iVar8;
              }
              iVar8 = iVar8 + (int)DAT_data_0052 * -0x200;
            }
            if (-1 < iVar8) goto LAB_prog_0cc3;
          }
          DAT_data_000c = (short)((uint)iVar11 >> 0x10);
          DAT_data_000d = (short)iVar11;
          DAT_data_003c = (ushort)(uVar17 >> 0x10);
          DAT_data_003d = (ushort)uVar17;
          DAT_data_0036 = (undefined2)((uint)iVar9 >> 0x10);
          DAT_data_0037 = (undefined2)iVar9;
          DAT_data_007b = (ushort)(uVar15 >> 0x10);
          DAT_data_007c = (undefined2)uVar15;
          DAT_data_000e = (ushort)(uVar16 >> 0x10);
          DAT_data_000f = (undefined2)uVar16;
          DAT_data_0016 = (ushort)(uVar19 >> 0x10);
          DAT_data_0017 = (ushort)uVar19;
          DAT_data_000a = (ushort)(uVar10 >> 0x10);
          DAT_data_000b = (ushort)uVar10;
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar4 = PA6;
            *(word *)(wVar1 & 0xff) = wVar4;
            iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
            uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
            iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
            uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_0016 = (ushort)(uVar19 >> 0x10);
          DAT_data_0017 = (ushort)uVar19;
          iVar8 = (uint)DAT_data_0018 * 0x10000;
          if (iVar8 < 0) {
            iVar8 = (uint)DAT_data_0018 * -0x10000;
          }
          DAT_data_003a = (word)((uint)iVar8 >> 0x10);
          PA0 = DAT_data_0010;
          PA7 = DAT_data_0011;
          DAT_data_001c = PA4;
          DAT_data_001d = PA4;
          DAT_data_001a =
               (word)((uint)((((int)(short)DAT_data_0014 * (int)(short)DAT_data_001d -
                              (int)(short)DAT_data_0014 * (int)(short)DAT_data_001c) +
                             (int)(short)DAT_data_001c * 0x8000) * 2) >> 0x10);
          PA5 = DAT_data_001a;
          if (DAT_data_005c == 0) {
            PA1 = DAT_data_0032;
            PA2 = DAT_data_0038;
          }
          else if (0 < (int)((uint)DAT_data_005c << 0x10)) {
            PA1 = DAT_data_0016;
            PA2 = DAT_data_0017;
          }
          uVar10 = (uVar10 & 0xffff0000) + (uVar10 & 0xffff) + (int)*(short *)(in_AR0 & 0xff);
          iVar8 = (int)(short)(uVar10 >> 0x10) << 7;
          DAT_data_0010 = (word)((uint)iVar8 >> 0x10);
          DAT_data_0006 = (ushort)((uint)((int)(short)uVar10 << 7) >> 0x10);
          DAT_data_0011 = (DAT_data_0006 & 0x7f) + (short)iVar8;
          DAT_data_0014 = (short)uVar10 << 6 & DAT_data_0003;
          uVar19 = (uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                   (int)*(short *)(in_AR0 + 1 & 0xff);
          iVar8 = (int)(short)DAT_data_0032;
          DAT_data_0032 = DAT_data_003a;
          if (-1 < iVar8 * DAT_data_0055 + (int)(short)DAT_data_003a * -0x8000) {
            DAT_data_0032 = (ushort)((uint)(iVar8 * DAT_data_0055 * 2) >> 0x10);
          }
          if ((int)((uint)DAT_data_0039 << 0x10) < 1) {
            iVar8 = (uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005d * -0x10000;
            if (iVar8 < 1) {
              DAT_data_0077 = 0;
            }
            else {
              DAT_data_0039 = (ushort)((uint)iVar8 >> 0x10);
              DAT_data_0077 = 1;
            }
          }
          else {
            DAT_data_0039 =
                 (ushort)((uint)DAT_data_0032 * 0x10000 + (uint)DAT_data_005e * -0x10000 >> 0x10);
            DAT_data_0077 = 0;
          }
          goto LAB_prog_0d23;
        }
        if (DAT_data_004f != 0) goto LAB_prog_0c24;
        if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
          if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                    (uint)DAT_data_000e * -0x10000) - (uVar16 & 0xffff)) < 1) goto LAB_prog_0c24;
          DAT_data_0018 = PA7;
          iVar8 = ((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
          if (iVar8 < 0) {
            iVar8 = -iVar8;
          }
          iVar8 = iVar8 + (int)DAT_data_0052 * -0x200;
        }
        else {
          if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                         (uint)DAT_data_000e * -0x10000) - (uVar16 & 0xffff))) goto LAB_prog_0c24;
          DAT_data_0018 = PA7;
          iVar8 = ((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                  (uint)DAT_data_000a * -0x10000) - (uVar10 & 0xffff);
          if (iVar8 < 0) {
            iVar8 = -iVar8;
          }
          iVar8 = iVar8 + (int)DAT_data_0052 * -0x200;
        }
        if (iVar8 < 0) {
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar4 = PA6;
            *(word *)(wVar1 & 0xff) = wVar4;
            iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
            iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
            uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
            uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
            uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
            uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
            uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
          }
          DAT_data_0038 = 1;
        }
        else {
          uStackfe = 0x1828;
          FUN_prog_0ded();
          wVar1 = PA5;
          if ((wVar1 & DAT_data_0005) != 0) {
            wVar4 = PA6;
            *(word *)(wVar1 & 0xff) = wVar4;
          }
          iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
          uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
          iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
          uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
          uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
          uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
          uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
        }
      } while( true );
    }
    DAT_data_003c = (ushort)(uVar17 >> 0x10);
    DAT_data_003d = (ushort)uVar17;
    if (DAT_data_004b == 0) {
      if (DAT_data_004c != 0) {
        DAT_data_0079 = DAT_data_004c;
        DAT_data_003f = DAT_data_0068;
      }
    }
    else {
      DAT_data_0078 = DAT_data_004b;
      DAT_data_003f = DAT_data_0068;
    }
    if ((int)((uint)*(ushort *)(in_AR0 & 0xff) << 0x10) < 0) {
      if ((int)(((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) + (uint)DAT_data_000e * -0x10000)
               - (uVar16 & 0xffff)) < 1) goto LAB_prog_0c95;
    }
    else if (-1 < (int)(((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) +
                        (uint)DAT_data_000e * -0x10000) - (uVar16 & 0xffff))) {
LAB_prog_0c95:
      DAT_data_003f = DAT_data_0068;
    }
    iVar8 = ((uint)DAT_data_0016 * 0x10000 + (uVar19 & 0xffff) + (uint)DAT_data_000a * -0x10000) -
            (uVar10 & 0xffff);
    if (iVar8 < 0) {
      iVar8 = -iVar8;
    }
    if (-1 < iVar8 + (int)DAT_data_0052 * -0x200) {
      uStackfe = 0x1848;
      FUN_prog_0ded();
      iVar9 = CONCAT22(DAT_data_0036,DAT_data_0037);
      uVar15 = CONCAT22(DAT_data_007b,DAT_data_007c);
      uVar16 = CONCAT22(DAT_data_000e,DAT_data_000f);
      iVar11 = CONCAT22(DAT_data_000c,DAT_data_000d);
      uVar17 = CONCAT22(DAT_data_003c,DAT_data_003d);
      uVar19 = CONCAT22(DAT_data_0016,DAT_data_0017);
      uVar10 = CONCAT22(DAT_data_000a,DAT_data_000b);
    }
  } while( true );
code_p0x0b5f:
  DAT_data_0039 = DAT_data_0003;
LAB_prog_0b61:
  DAT_data_003e = DAT_data_0066;
  DAT_data_003f = DAT_data_0067;
  DAT_data_0078 = 0;
  DAT_data_0079 = 0;
  uVar17 = (uint)DAT_data_003d;
  DAT_data_0077 = 0;
  uVar15 = (uint)DAT_data_006d * 0x10000 + (uint)DAT_data_006e;
  uVar16 = (uint)DAT_data_0048 * 0x10000 + (uint)DAT_data_0049;
  uVar10 = (uint)DAT_data_0046 * 0x10000 + (uint)DAT_data_0047;
  iVar8 = (int)(short)(uVar10 >> 0x10) << 7;
  DAT_data_0010 = (word)((uint)iVar8 >> 0x10);
  DAT_data_0011 = ((ushort)((uint)((int)(short)uVar10 << 7) >> 0x10) & 0x7f) + (short)iVar8;
  in_AR0 = 0x6f;
  uVar19 = uVar10;
  goto LAB_prog_0b91;
}


