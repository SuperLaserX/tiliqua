// 7A12_mod_factory_one_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7A12_mod_factory_one_dsp3 (ucode_7A12_ROM3_05074.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  ushort uVar9;
  
  uVar9 = 0x8f;
  do {
    *(undefined2 *)(uVar9 & 0xff) = 0;
    uVar2 = uVar9 & 0x1ff;
    uVar9 = uVar9 - 1;
  } while (uVar2 != 0);
  DAT_data_000a = 1;
  DAT_data_000c = 0x400;
  DAT_data_0001 = 0;
  DAT_data_0002 = 0x7fff;
  DAT_data_0025 = 0x3f;
  DAT_data_0026 = 0xc18;
  DAT_data_002b = 0x100;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  DAT_data_0010 = 0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
    DAT_data_002f = DAT_data_002b;
  } while (cVar3 == '\0');
  do {
    wVar4 = PA5;
    if ((wVar4 & DAT_data_000c) != 0) {
      wVar5 = PA6;
      *(word *)(wVar4 & 0xff) = wVar5;
    }
    DAT_data_0010 = DAT_data_0010 + 0x15;
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
  } while (0 < DAT_data_0010);
  DAT_data_0010 = 0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar4 = PA5;
    if ((wVar4 & DAT_data_000c) != 0) {
      wVar5 = PA6;
      *(word *)(wVar4 & 0xff) = wVar5;
    }
    iVar8 = CONCAT22(DAT_data_0008,DAT_data_0009);
    iVar7 = CONCAT22(DAT_data_0006,DAT_data_0007);
    DAT_data_0010 = DAT_data_0010 + 0x15;
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
  } while (0 < DAT_data_0010);
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
    uVar9 = 0;
  } while (cVar3 == '\0');
  do {
    DAT_data_0008 = (ushort)((uint)iVar8 >> 0x10);
    DAT_data_0009 = (ushort)iVar8;
    DAT_data_0006 = (ushort)((uint)iVar7 >> 0x10);
    DAT_data_0007 = (ushort)iVar7;
    wVar4 = PA5;
    wVar4 = PA6;
    *(word *)(uVar9 & 0xff) = wVar4;
    iVar8 = CONCAT22(DAT_data_0008,DAT_data_0009);
    iVar7 = CONCAT22(DAT_data_0006,DAT_data_0007);
    if ((uint)DAT_data_004f == (int)(short)DAT_data_000a) {
      PA3 = DAT_data_007c;
    }
    iVar6 = (uint)DAT_data_007a * 0x10000 + (uint)DAT_data_0006 * -0x10000;
    if (iVar6 < 1) {
      if (iVar6 < 0) {
        iVar7 = (uint)DAT_data_0006 * 0x10000 + (uint)DAT_data_0007 + (int)DAT_data_007b * -0x100;
        if ((int)(iVar7 + (uint)DAT_data_007a * -0x10000) < 0) {
          iVar7 = CONCAT22(DAT_data_007a,(short)iVar7);
        }
      }
    }
    else {
      iVar7 = (uint)DAT_data_0006 * 0x10000 + (uint)DAT_data_0007 + (int)DAT_data_007b * 0x100;
      if (0 < (int)(iVar7 + (uint)DAT_data_007a * -0x10000)) {
        iVar7 = CONCAT22(DAT_data_007a,(short)iVar7);
      }
    }
    DAT_data_0006 = (ushort)((uint)iVar7 >> 0x10);
    DAT_data_007c = (word)((uint)DAT_data_007c * 0x10000 + (uint)DAT_data_000a * 0x10000 >> 0x10);
    PA1 = *(word *)(DAT_data_0063 & 0xff);
    PA1 = *(word *)(DAT_data_0067 & 0xff);
    PA1 = DAT_data_0006;
    if ((int)((uint)DAT_data_002e * 0x10000 + (int)(short)DAT_data_0079 * -0x8000) < 0) {
      DAT_data_000f = DAT_data_0079;
    }
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    if ((uint)DAT_data_004f + (int)(short)DAT_data_000a * -4 == 0) {
      PA3 = DAT_data_004c;
    }
    if ((uint)DAT_data_004f + (int)(short)DAT_data_000a * -2 == 0) {
      PA3 = DAT_data_007f;
    }
    iVar6 = (uint)DAT_data_007d * 0x10000 + (uint)DAT_data_0008 * -0x10000;
    if (iVar6 < 1) {
      if (iVar6 < 0) {
        iVar8 = (uint)DAT_data_0008 * 0x10000 + (uint)DAT_data_0009 + (int)DAT_data_007e * -0x100;
        if ((int)(iVar8 + (uint)DAT_data_007d * -0x10000) < 0) {
          iVar8 = CONCAT22(DAT_data_007d,(short)iVar8);
        }
      }
    }
    else {
      iVar8 = (uint)DAT_data_0008 * 0x10000 + (uint)DAT_data_0009 + (int)DAT_data_007e * 0x100;
      if (0 < (int)(iVar8 + (uint)DAT_data_007d * -0x10000)) {
        iVar8 = CONCAT22(DAT_data_007d,(short)iVar8);
      }
    }
    DAT_data_0008 = (ushort)((uint)iVar8 >> 0x10);
    DAT_data_007f = (word)((uint)DAT_data_007f * 0x10000 + (uint)DAT_data_000a * 0x10000 >> 0x10);
    PA1 = *(word *)(DAT_data_0063 & 0xff);
    PA1 = *(word *)(DAT_data_0067 & 0xff);
    PA1 = DAT_data_0008;
    DAT_data_004c = (word)((uint)DAT_data_004c * 0x10000 + (uint)DAT_data_000a * 0x10000 >> 0x10);
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    if (DAT_data_0073 == 0) {
      iVar6 = (int)(short)DAT_data_0011 * 0x8000 + (uint)DAT_data_0012 + (int)DAT_data_0070 * 0x10 +
              (int)(short)((uint)((int)(short)wVar4 * (int)DAT_data_0072 * 2) >> 0x10) * 0x10;
      DAT_data_0011 = (ushort)((uint)(iVar6 * 2) >> 0x10);
      DAT_data_0012 = (ushort)iVar6 & DAT_data_0002;
      uVar9 = (DAT_data_0011 & DAT_data_0025) + DAT_data_0026 + DAT_data_0071;
      sVar1 = *(short *)(uVar9 & 0xfff);
      DAT_data_0004 =
           (word)((uint)((((int)sVar1 * 0x8000 - (int)(short)DAT_data_0012 * (int)sVar1) +
                         (int)(short)DAT_data_0012 * (int)*(short *)(uVar9 + DAT_data_000a & 0xfff))
                        * 2) >> 0x10);
    }
    else if ((int)((uint)DAT_data_002a * 0x10000 + (uint)DAT_data_000e * -0x10000) < 1) {
      if ((uint)DAT_data_0028 == 0) {
LAB_prog_0a57:
        iVar6 = (int)(short)DAT_data_0011 * 0x8000 + (uint)DAT_data_0012 + (int)DAT_data_0070 * 0x10
        ;
        DAT_data_0011 = (ushort)((uint)(iVar6 * 2) >> 0x10);
        DAT_data_0012 = (ushort)iVar6 & DAT_data_0002;
        if ((int)((uint)DAT_data_0011 - (uint)DAT_data_0025) < 0) {
LAB_prog_0af0:
          uVar9 = DAT_data_0011 + DAT_data_0026 + DAT_data_0071;
          sVar1 = *(short *)(uVar9 & 0xfff);
          DAT_data_0004 =
               (word)((uint)((((int)sVar1 * 0x8000 - (int)(short)DAT_data_0012 * (int)sVar1) +
                             (int)(short)DAT_data_0012 *
                             (int)*(short *)(uVar9 + DAT_data_000a & 0xfff)) * 2) >> 0x10);
        }
        else {
          DAT_data_0011 = DAT_data_0025;
          DAT_data_0004 = *(word *)(DAT_data_0025 + DAT_data_0026 + DAT_data_0071 & 0xfff);
          DAT_data_0028 = 2;
        }
      }
      else {
        iVar6 = (uint)DAT_data_0028 * 0x10000 + (uint)DAT_data_000a * -0x10000;
        if (iVar6 == 0) {
          iVar6 = (int)(short)DAT_data_0011 * 0x8000 + (uint)DAT_data_0012 +
                  (int)DAT_data_0070 * -0x10;
          DAT_data_0011 = (ushort)((uint)(iVar6 * 2) >> 0x10);
          DAT_data_0012 = (ushort)iVar6 & DAT_data_0002;
          if (DAT_data_0011 != 0) goto LAB_prog_0af0;
          DAT_data_0011 = 0;
          DAT_data_0004 = *(word *)(DAT_data_0026 + DAT_data_0071 & 0xfff);
          DAT_data_0028 = 2;
        }
        else if (iVar6 + (uint)DAT_data_000a * -0x10000 != 0) goto LAB_prog_0a57;
      }
    }
    else {
      if ((int)((uint)DAT_data_0073 - (uint)DAT_data_000a) < 1) {
        DAT_data_0028 = 0;
        DAT_data_0011 = 0;
        DAT_data_0012 = 0;
      }
      else if (DAT_data_0029 == 0) {
        DAT_data_0028 = 1;
        DAT_data_0029 = 1;
      }
      else {
        DAT_data_0028 = 0;
        DAT_data_0029 = 0;
      }
      DAT_data_000e = DAT_data_0002;
    }
    PA1 = *(word *)(DAT_data_0063 & 0xff);
    PA1 = *(word *)(DAT_data_0067 & 0xff);
    PA1 = DAT_data_0004;
    iVar6 = (uint)wVar4 * 0x10000;
    if (iVar6 < 0) {
      iVar6 = (uint)wVar4 * -0x10000;
    }
    iVar6 = iVar6 + (uint)DAT_data_002a * -0x10000;
    if (iVar6 < 0) {
      iVar6 = (uint)DAT_data_002a * 0x10000 + (int)DAT_data_002b * (int)(short)((uint)iVar6 >> 0x10)
      ;
      DAT_data_002a = (ushort)((uint)iVar6 >> 0x10);
    }
    else {
      iVar6 = (uint)wVar4 * 0x10000;
      if (iVar6 < 0) {
        iVar6 = (uint)wVar4 * -0x10000;
      }
      DAT_data_002a = (ushort)((uint)iVar6 >> 0x10);
    }
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    if (iVar6 + (int)(short)DAT_data_0078 * -0x8000 < 0) {
      DAT_data_000e = DAT_data_0078;
    }
    if (DAT_data_0077 == 0) {
      iVar6 = (int)(short)DAT_data_0013 * 0x8000 + (uint)DAT_data_0014 + (int)DAT_data_0074 * 0x10 +
              (int)(short)((uint)((int)(short)wVar4 * (int)DAT_data_0076 * 2) >> 0x10) * 0x10;
      DAT_data_0013 = (ushort)((uint)(iVar6 * 2) >> 0x10);
      DAT_data_0014 = (ushort)iVar6 & DAT_data_0002;
      uVar9 = (DAT_data_0013 & DAT_data_0025) + DAT_data_0026 + DAT_data_0075;
      sVar1 = *(short *)(uVar9 & 0xfff);
      DAT_data_0005 =
           (word)((uint)((((int)sVar1 * 0x8000 - (int)(short)DAT_data_0014 * (int)sVar1) +
                         (int)(short)DAT_data_0014 * (int)*(short *)(uVar9 + DAT_data_000a & 0xfff))
                        * 2) >> 0x10);
    }
    else if ((int)((uint)DAT_data_002e * 0x10000 + (uint)DAT_data_000f * -0x10000) < 1) {
      if ((uint)DAT_data_002c == 0) {
LAB_prog_0b52:
        iVar6 = (int)(short)DAT_data_0013 * 0x8000 + (uint)DAT_data_0014 + (int)DAT_data_0074 * 0x10
        ;
        DAT_data_0013 = (ushort)((uint)(iVar6 * 2) >> 0x10);
        DAT_data_0014 = (ushort)iVar6 & DAT_data_0002;
        if ((int)((uint)DAT_data_0013 - (uint)DAT_data_0025) < 0) {
LAB_prog_0beb:
          uVar9 = DAT_data_0013 + DAT_data_0026 + DAT_data_0075;
          sVar1 = *(short *)(uVar9 & 0xfff);
          DAT_data_0005 =
               (word)((uint)((((int)sVar1 * 0x8000 - (int)(short)DAT_data_0014 * (int)sVar1) +
                             (int)(short)DAT_data_0014 *
                             (int)*(short *)(uVar9 + DAT_data_000a & 0xfff)) * 2) >> 0x10);
        }
        else {
          DAT_data_0013 = DAT_data_0025;
          DAT_data_0005 = *(word *)(DAT_data_0025 + DAT_data_0026 + DAT_data_0075 & 0xfff);
          DAT_data_002c = 2;
        }
      }
      else {
        iVar6 = (uint)DAT_data_002c * 0x10000 + (uint)DAT_data_000a * -0x10000;
        if (iVar6 == 0) {
          iVar6 = (int)(short)DAT_data_0013 * 0x8000 + (uint)DAT_data_0014 +
                  (int)DAT_data_0074 * -0x10;
          DAT_data_0013 = (ushort)((uint)(iVar6 * 2) >> 0x10);
          DAT_data_0014 = (ushort)iVar6 & DAT_data_0002;
          if (DAT_data_0013 != 0) goto LAB_prog_0beb;
          DAT_data_0013 = 0;
          DAT_data_0005 = *(word *)(DAT_data_0026 + DAT_data_0075 & 0xfff);
          DAT_data_002c = 2;
        }
        else if (iVar6 + (uint)DAT_data_000a * -0x10000 != 0) goto LAB_prog_0b52;
      }
    }
    else {
      if ((int)((uint)DAT_data_0077 - (uint)DAT_data_000a) < 1) {
        DAT_data_002c = 0;
        DAT_data_0013 = 0;
        DAT_data_0014 = 0;
      }
      else if (DAT_data_002d == 0) {
        DAT_data_002c = 1;
        DAT_data_002d = 1;
      }
      else {
        DAT_data_002c = 0;
        DAT_data_002d = 0;
      }
      DAT_data_000f = DAT_data_0002;
    }
    PA1 = *(word *)(DAT_data_0063 & 0xff);
    PA1 = *(word *)(DAT_data_0067 & 0xff);
    PA1 = DAT_data_0005;
    iVar6 = (uint)wVar4 * 0x10000;
    if (iVar6 < 0) {
      iVar6 = (uint)wVar4 * -0x10000;
    }
    iVar6 = iVar6 + (uint)DAT_data_002e * -0x10000;
    if (iVar6 < 0) {
      DAT_data_002e =
           (ushort)((uint)DAT_data_002e * 0x10000 +
                    (int)DAT_data_002f * (int)(short)((uint)iVar6 >> 0x10) >> 0x10);
    }
    else {
      iVar6 = (uint)wVar4 * 0x10000;
      if (iVar6 < 0) {
        iVar6 = (uint)wVar4 * -0x10000;
      }
      DAT_data_002e = (ushort)((uint)iVar6 >> 0x10);
    }
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    uVar9 = DAT_data_0067;
  } while( true );
}


