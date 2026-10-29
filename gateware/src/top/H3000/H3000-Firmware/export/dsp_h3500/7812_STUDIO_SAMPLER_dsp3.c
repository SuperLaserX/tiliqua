// 7812_STUDIO_SAMPLER_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7812_STUDIO_SAMPLER_dsp3 (ucode_7812_ROM3_2DBC2.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  ushort uVar2;
  uint uVar3;
  uint uVar4;
  ushort uVar5;
  
  uVar5 = 0x8f;
  do {
    *(undefined2 *)(uVar5 & 0xff) = 0;
    uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
    uVar2 = uVar5 & 0x1ff;
    uVar5 = uVar5 - 1;
  } while (uVar2 != 0);
  DAT_data_0070 = 1;
  DAT_data_0074 = 0x400;
  DAT_data_0073 = 0x8000;
  DAT_data_006f = 0;
  DAT_data_0056 = 0xffff;
  DAT_data_0072 = 0x7fff;
  DAT_data_0067 = 0xd6a;
  DAT_data_0068 = 0xcde;
  DAT_data_0055 = 0x3f;
  DAT_data_0069 = 0;
  DAT_data_0075 = 0xbb;
  DAT_data_006e = 0xbb0;
  DAT_data_0049 = 0x400;
  DAT_data_004a = 0x200;
  DAT_data_0048 = 0x200;
  DAT_data_0054 = 0x1000;
  DAT_data_0051 = 0x100;
  DAT_data_0071 = DAT_data_0056;
LAB_prog_0839:
  do {
    DAT_data_004e = (ushort)(uVar3 >> 0x10);
    DAT_data_004f = (ushort)uVar3;
    FUN_prog_0a38();
    do {
      FUN_prog_09fb();
      FUN_prog_0a0a();
    } while (DAT_data_0040 == 0);
    FUN_prog_0a2c();
    FUN_prog_0a87();
    uVar3 = CONCAT22(DAT_data_0042,DAT_data_0071 << 8 & DAT_data_0043);
    DAT_data_0052 =
         DAT_data_0071 << 2 &
         ((DAT_data_0071 << 10 ^ DAT_data_0071) &
         (ushort)((uint)((int)(short)DAT_data_0043 << 10) >> 0x10)) + DAT_data_0042 * 0x400;
    DAT_data_0066 = (undefined2)((int)DAT_data_0047 << 10);
    DAT_data_0065 =
         ((DAT_data_0071 << 10 ^ DAT_data_0071) & (ushort)((uint)((int)DAT_data_0047 << 10) >> 0x10)
         ) + DAT_data_0046 * 0x400;
    DAT_data_0053 = DAT_data_0071 << 2 & DAT_data_0065;
    DAT_data_0051 = DAT_data_0070 << 10;
    do {
      DAT_data_004e = (ushort)(uVar3 >> 0x10);
      DAT_data_004f = (ushort)uVar3;
      if ((int)(((uint)DAT_data_004e * 0x10000 + (uVar3 & 0xffff) + (uint)DAT_data_0050 +
                (uint)DAT_data_0055 * -0x10000) - (uint)DAT_data_0056) < 0) {
        FUN_prog_0a8b();
        FUN_prog_0bb1();
        FUN_prog_0bf0();
        FUN_prog_0c0d();
        FUN_prog_0b8d();
        DAT_data_004c = DAT_data_006c;
        if ((int)((uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006a * -0x10000) < 0) {
          DAT_data_0075 =
               (ushort)((uint)((int)(short)DAT_data_006b * (int)(short)DAT_data_006a) >> 0x10);
          DAT_data_0076 = DAT_data_006a;
          if ((short)DAT_data_006a < 0) {
            DAT_data_0076 = -DAT_data_006a;
          }
          DAT_data_0077 = DAT_data_006b;
          if ((short)DAT_data_006b < 0) {
            DAT_data_0077 = -DAT_data_006b;
          }
          uVar4 = (uint)DAT_data_0077 << 0x10;
          uVar5 = 0xe;
          do {
            iVar1 = uVar4 + (uint)DAT_data_0076 * -0x8000;
            if (iVar1 < 0) {
              uVar4 = uVar4 << 1;
            }
            else {
              uVar4 = iVar1 * 2 + 1;
            }
            uVar2 = uVar5 & 0x1ff;
            uVar5 = uVar5 - 1;
          } while (uVar2 != 0);
          DAT_data_004d = (undefined2)uVar4;
          uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
          if ((int)((uint)DAT_data_0075 << 0x10) < 0) {
            DAT_data_004d = (undefined2)((uVar4 & 0xffff) * -0x10000 >> 0x10);
            uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
          }
        }
        else {
          DAT_data_004d = DAT_data_0072;
          uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
        }
      }
      else {
        DAT_data_004d = 0;
        DAT_data_004c = DAT_data_0049;
      }
      DAT_data_004e = (ushort)(uVar3 >> 0x10);
      DAT_data_004f = (ushort)uVar3;
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * -0xc;
      if (DAT_data_004b != 0) {
        DAT_data_0052 = DAT_data_0052 + DAT_data_0053 + DAT_data_0070 * -2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
        FUN_prog_0a73();
        DAT_data_0052 = (DAT_data_0052 + DAT_data_0070 * -0xc) - DAT_data_0053;
      }
      if ((int)(((uint)DAT_data_004e * 0x10000 + (uint)DAT_data_004f) - (uint)DAT_data_0050) < 1) {
        DAT_data_004d = 0;
        DAT_data_004c = DAT_data_0049;
      }
      else {
        FUN_prog_0ae8();
        FUN_prog_0bb1();
        FUN_prog_0bf0();
        FUN_prog_0c0d();
        FUN_prog_0b8d();
        DAT_data_004c = DAT_data_006c;
        if ((int)((uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006a * -0x10000) < 0) {
          DAT_data_0075 =
               (ushort)((uint)((int)(short)DAT_data_006b * (int)(short)DAT_data_006a) >> 0x10);
          DAT_data_0076 = DAT_data_006a;
          if ((short)DAT_data_006a < 0) {
            DAT_data_0076 = -DAT_data_006a;
          }
          DAT_data_0077 = DAT_data_006b;
          if ((short)DAT_data_006b < 0) {
            DAT_data_0077 = -DAT_data_006b;
          }
          uVar3 = (uint)DAT_data_0077 << 0x10;
          uVar5 = 0xe;
          do {
            iVar1 = uVar3 + (uint)DAT_data_0076 * -0x8000;
            if (iVar1 < 0) {
              uVar3 = uVar3 << 1;
            }
            else {
              uVar3 = iVar1 * 2 + 1;
            }
            uVar2 = uVar5 & 0x1ff;
            uVar5 = uVar5 - 1;
          } while (uVar2 != 0);
          DAT_data_004d = (undefined2)uVar3;
          if ((int)((uint)DAT_data_0075 << 0x10) < 0) {
            DAT_data_004d = (undefined2)((uVar3 & 0xffff) * -0x10000 >> 0x10);
          }
        }
        else {
          DAT_data_004d = DAT_data_0072;
        }
      }
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
      FUN_prog_0a73();
      DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
      FUN_prog_0a73();
      if (DAT_data_004b != 0) {
        DAT_data_0052 = DAT_data_0052 + DAT_data_0053 + DAT_data_0070 * -0xe;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 + DAT_data_0070 * 2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 - DAT_data_0053;
      }
      FUN_prog_0a0a();
      uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
      if (DAT_data_0041 != 0) goto LAB_prog_0839;
      uVar3 = (uint)DAT_data_004e * 0x10000 + (uint)DAT_data_004f + (int)DAT_data_0051;
      DAT_data_004e = (ushort)(uVar3 >> 0x10);
      DAT_data_004f = (ushort)uVar3;
    } while ((int)((uVar3 + (uint)DAT_data_0044 * -0x10000) - (uint)DAT_data_0045) < 0);
    FUN_prog_0a87();
    uVar3 = CONCAT22(DAT_data_0042,DAT_data_0071 << 8 & DAT_data_0043);
    DAT_data_0052 =
         DAT_data_0071 << 2 &
         ((DAT_data_0071 << 10 ^ DAT_data_0071) &
         (ushort)((uint)((int)(short)DAT_data_0043 << 10) >> 0x10)) + DAT_data_0042 * 0x400;
    DAT_data_0066 = (undefined2)((int)DAT_data_0047 << 10);
    DAT_data_0065 =
         ((DAT_data_0071 << 10 ^ DAT_data_0071) & (ushort)((uint)((int)DAT_data_0047 << 10) >> 0x10)
         ) + DAT_data_0046 * 0x400;
    DAT_data_0053 = DAT_data_0071 << 2 & DAT_data_0065;
    DAT_data_0051 = DAT_data_0070 << 8;
    do {
      DAT_data_004e = (ushort)(uVar3 >> 0x10);
      DAT_data_004f = (ushort)uVar3;
      if ((int)(((uint)DAT_data_004e * 0x10000 + (uVar3 & 0xffff) + (uint)DAT_data_0050 +
                (uint)DAT_data_0055 * -0x10000) - (uint)DAT_data_0056) < 0) {
        FUN_prog_0a8b();
        FUN_prog_0bb1();
        FUN_prog_0bf0();
        FUN_prog_0c0d();
        FUN_prog_0b8d();
        DAT_data_004c = DAT_data_006c;
        if ((int)((uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006a * -0x10000) < 0) {
          DAT_data_0075 =
               (ushort)((uint)((int)(short)DAT_data_006b * (int)(short)DAT_data_006a) >> 0x10);
          DAT_data_0076 = DAT_data_006a;
          if ((short)DAT_data_006a < 0) {
            DAT_data_0076 = -DAT_data_006a;
          }
          DAT_data_0077 = DAT_data_006b;
          if ((short)DAT_data_006b < 0) {
            DAT_data_0077 = -DAT_data_006b;
          }
          uVar4 = (uint)DAT_data_0077 << 0x10;
          uVar5 = 0xe;
          do {
            iVar1 = uVar4 + (uint)DAT_data_0076 * -0x8000;
            if (iVar1 < 0) {
              uVar4 = uVar4 << 1;
            }
            else {
              uVar4 = iVar1 * 2 + 1;
            }
            uVar2 = uVar5 & 0x1ff;
            uVar5 = uVar5 - 1;
          } while (uVar2 != 0);
          DAT_data_004d = (undefined2)uVar4;
          uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
          if ((int)((uint)DAT_data_0075 << 0x10) < 0) {
            DAT_data_004d = (undefined2)((uVar4 & 0xffff) * -0x10000 >> 0x10);
            uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
          }
        }
        else {
          DAT_data_004d = DAT_data_0072;
          uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
        }
      }
      else {
        DAT_data_004d = 0;
        DAT_data_004c = DAT_data_0049;
      }
      DAT_data_004e = (ushort)(uVar3 >> 0x10);
      DAT_data_004f = (ushort)uVar3;
      FUN_prog_0a73();
      if (DAT_data_004b != 0) {
        DAT_data_0052 = DAT_data_0052 + DAT_data_0053 + DAT_data_0070 * -2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 - DAT_data_0053;
      }
      if ((int)(((uint)DAT_data_004e * 0x10000 + (uint)DAT_data_004f) - (uint)DAT_data_0050) < 1) {
        DAT_data_004d = 0;
        DAT_data_004c = DAT_data_0049;
      }
      else {
        FUN_prog_0ae8();
        FUN_prog_0bb1();
        FUN_prog_0bf0();
        FUN_prog_0c0d();
        FUN_prog_0b8d();
        DAT_data_004c = DAT_data_006c;
        if ((int)((uint)DAT_data_006b * 0x10000 + (uint)DAT_data_006a * -0x10000) < 0) {
          DAT_data_0075 =
               (ushort)((uint)((int)(short)DAT_data_006b * (int)(short)DAT_data_006a) >> 0x10);
          DAT_data_0076 = DAT_data_006a;
          if ((short)DAT_data_006a < 0) {
            DAT_data_0076 = -DAT_data_006a;
          }
          DAT_data_0077 = DAT_data_006b;
          if ((short)DAT_data_006b < 0) {
            DAT_data_0077 = -DAT_data_006b;
          }
          uVar3 = (uint)DAT_data_0077 << 0x10;
          uVar5 = 0xe;
          do {
            iVar1 = uVar3 + (uint)DAT_data_0076 * -0x8000;
            if (iVar1 < 0) {
              uVar3 = uVar3 << 1;
            }
            else {
              uVar3 = iVar1 * 2 + 1;
            }
            uVar2 = uVar5 & 0x1ff;
            uVar5 = uVar5 - 1;
          } while (uVar2 != 0);
          DAT_data_004d = (undefined2)uVar3;
          if ((int)((uint)DAT_data_0075 << 0x10) < 0) {
            DAT_data_004d = (undefined2)((uVar3 & 0xffff) * -0x10000 >> 0x10);
          }
        }
        else {
          DAT_data_004d = DAT_data_0072;
        }
      }
      FUN_prog_0a73();
      if (DAT_data_004b != 0) {
        DAT_data_0052 = DAT_data_0052 + DAT_data_0053 + DAT_data_0070 * -2;
        FUN_prog_0a73();
        DAT_data_0052 = DAT_data_0052 - DAT_data_0053;
      }
      FUN_prog_0a0a();
      uVar3 = CONCAT22(DAT_data_004e,DAT_data_004f);
    } while ((DAT_data_0041 == 0) &&
            (uVar3 = (uint)DAT_data_004e * 0x10000 + (uint)DAT_data_004f + (int)DAT_data_0051,
            (int)((uVar3 + (uint)DAT_data_0044 * -0x10000) - (uint)DAT_data_0045) < 0));
  } while( true );
}


// ===== FUN_prog_09fb @ prog:09fb =====

void FUN_prog_09fb(void)

{
  ushort uVar1;
  int in_ACC;
  ushort uVar2;
  ushort uVar3;
  
  for (; in_ACC != 0; in_ACC = in_ACC - (uint)DAT_data_0070) {
    uVar2 = 0x2b;
    do {
      uVar3 = 0x30;
      do {
        uVar1 = uVar3 & 0x1ff;
        uVar3 = uVar3 - 1;
      } while (uVar1 != 0);
      uVar3 = uVar2 & 0x1ff;
      uVar2 = uVar2 - 1;
    } while (uVar3 != 0);
  }
  return;
}


// ===== FUN_prog_0a0a @ prog:0a0a =====

void FUN_prog_0a0a(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  ushort uVar5;
  
  FUN_prog_0a5c();
  uVar5 = 0x23;
  do {
    uVar1 = uVar5 & 0x1ff;
    uVar5 = uVar5 - 1;
  } while (uVar1 != 0);
  PA0 = 0xc000;
  do {
    do {
      cVar2 = bio_pin();
    } while (cVar2 == '\0');
    uVar5 = 0x23;
    do {
      uVar1 = uVar5 & 0x1ff;
      uVar5 = uVar5 - 1;
    } while (uVar1 != 0);
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0074) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    DAT_data_0075 = PA0;
  } while ((DAT_data_0070 << 1 & DAT_data_0075) != 0);
  return;
}


// ===== FUN_prog_0a2c @ prog:0a2c =====

void FUN_prog_0a2c(void)

{
  ushort uVar1;
  ushort uVar2;
  
  DAT_data_0076 = *(word *)(DAT_data_0070 * 0xcd2 & 0xfff);
  FUN_prog_0a5c();
  uVar2 = 0x23;
  do {
    uVar1 = uVar2 & 0x1ff;
    uVar2 = uVar2 - 1;
  } while (uVar1 != 0);
  PA0 = DAT_data_0076;
  return;
}


// ===== FUN_prog_0a38 @ prog:0a38 =====

void FUN_prog_0a38(void)

{
  ushort uVar1;
  ushort uVar2;
  
  DAT_data_0076 = *(word *)(DAT_data_0070 * 0xcd8 & 0xfff);
  FUN_prog_0a5c();
  uVar2 = 0x23;
  do {
    uVar1 = uVar2 & 0x1ff;
    uVar2 = uVar2 - 1;
  } while (uVar1 != 0);
  PA0 = DAT_data_0076;
  return;
}


// ===== FUN_prog_0a5c @ prog:0a5c =====

void FUN_prog_0a5c(void)

{
  ushort uVar1;
  char cVar2;
  ushort uVar3;
  
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  uVar3 = 0x23;
  do {
    uVar1 = uVar3 & 0x1ff;
    uVar3 = uVar3 - 1;
  } while (uVar1 != 0);
  DAT_data_0075 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  uVar3 = 0x31;
  do {
    uVar1 = uVar3 & 0x1ff;
    uVar3 = uVar3 - 1;
  } while (uVar1 != 0);
  return;
}


// ===== FUN_prog_0a73 @ prog:0a73 =====

void FUN_prog_0a73(void)

{
  ushort uVar1;
  ushort uVar2;
  
  FUN_prog_0a5c();
  uVar2 = 0x23;
  do {
    uVar1 = uVar2 & 0x1ff;
    uVar2 = uVar2 - 1;
  } while (uVar1 != 0);
  PA0 = DAT_data_0054;
  PA7 = DAT_data_0052;
  PA4 = DAT_data_004c;
  PA7 = DAT_data_0052 + DAT_data_0070;
  PA4 = DAT_data_004d;
  DAT_data_0052 = DAT_data_0052 + DAT_data_0070 + DAT_data_0070;
  return;
}


// ===== FUN_prog_0a87 @ prog:0a87 =====

void FUN_prog_0a87(void)

{
  DAT_data_0050 = DAT_data_0049 + DAT_data_004a;
  return;
}


// ===== FUN_prog_0a8b @ prog:0a8b =====

void FUN_prog_0a8b(void)

{
  ushort uVar1;
  int iVar2;
  uint uVar3;
  ushort uVar4;
  
  DAT_data_0078 = (ushort)((uint)DAT_data_0067 * 0x10000 >> 0x10);
  DAT_data_0079 = (ushort)((uint)DAT_data_0067 * 0x10000 + (int)DAT_data_0050 * 0x4000 >> 0x10);
  iVar2 = (uint)DAT_data_004e * 0x10000 + (uint)DAT_data_004f;
  DAT_data_007a = (word)((uint)iVar2 >> 0x10);
  DAT_data_007b = (word)iVar2;
  FUN_prog_0a5c();
  uVar3 = CONCAT22(DAT_data_007a,DAT_data_007b);
  uVar4 = 0x1d;
  do {
    uVar1 = uVar4 & 0x1ff;
    uVar4 = uVar4 - 1;
  } while (uVar1 != 0);
  do {
    DAT_data_007a = (word)(uVar3 >> 0x10);
    DAT_data_007b = (word)uVar3;
    PA0 = DAT_data_007a;
    PA7 = DAT_data_007b;
    wData0000 = PA4;
    wData0001 = PA4;
    wData0002 = PA4;
    wData0003 = PA4;
    DAT_data_0004 = PA4;
    DAT_data_0005 = PA4;
    DAT_data_0006 = PA4;
    DAT_data_0007 = PA4;
    DAT_data_0008 = PA4;
    DAT_data_0009 = PA4;
    DAT_data_000a = PA4;
    DAT_data_000b = PA4;
    DAT_data_000c = PA4;
    DAT_data_000d = PA4;
    DAT_data_000e = PA4;
    DAT_data_000f = PA4;
    DAT_data_007c =
         (undefined2)
         ((uint)((int)(short)wData0000 * 0x4000 + (int)(short)wData0001 * 0x4000 +
                 (int)(short)wData0002 * 0x4000 + (int)(short)wData0003 * 0x4000) >> 0x10);
    DAT_data_007d =
         (undefined2)
         ((uint)((int)(short)DAT_data_0004 * 0x4000 + (int)(short)DAT_data_0005 * 0x4000 +
                 (int)(short)DAT_data_0006 * 0x4000 + (int)(short)DAT_data_0007 * 0x4000) >> 0x10);
    uData007e = (undefined2)
                ((uint)((int)(short)DAT_data_0008 * 0x4000 + (int)(short)DAT_data_0009 * 0x4000 +
                        (int)(short)DAT_data_000a * 0x4000 + (int)(short)DAT_data_000b * 0x4000) >>
                0x10);
    uData007f = (undefined2)
                ((uint)((int)(short)DAT_data_000c * 0x4000 + (int)(short)DAT_data_000d * 0x4000 +
                        (int)(short)DAT_data_000e * 0x4000 + (int)(short)DAT_data_000f * 0x4000) >>
                0x10);
    *(undefined2 *)(DAT_data_0078 & 0xfff) = DAT_data_007c;
    *(undefined2 *)(DAT_data_0078 + DAT_data_0070 & 0xfff) = DAT_data_007d;
    uVar4 = DAT_data_0078 + DAT_data_0070 + DAT_data_0070;
    *(undefined2 *)(uVar4 & 0xfff) = uData007e;
    uVar4 = uVar4 + DAT_data_0070;
    *(undefined2 *)(uVar4 & 0xfff) = uData007f;
    DAT_data_0078 = uVar4 + DAT_data_0070;
    uVar3 = (uint)DAT_data_007a * 0x10000 + (uVar3 & 0xffff) + (int)DAT_data_0070 * 0x10;
    DAT_data_007a = (short)(uVar3 >> 0x10);
    DAT_data_007b = (short)uVar3;
  } while ((int)((uint)DAT_data_0078 * 0x10000 + (uint)DAT_data_0079 * -0x10000) < 0);
  return;
}


// ===== FUN_prog_0ae8 @ prog:0ae8 =====

void FUN_prog_0ae8(void)

{
  ushort uVar1;
  int iVar2;
  uint uVar3;
  ushort uVar4;
  
  DAT_data_0078 = (ushort)((uint)DAT_data_0067 * 0x10000 >> 0x10);
  DAT_data_0079 = (ushort)((uint)DAT_data_0067 * 0x10000 + (int)DAT_data_0050 * 0x4000 >> 0x10);
  iVar2 = (uint)DAT_data_004e * 0x10000 + (uint)DAT_data_004f + (uint)DAT_data_004a +
          (int)DAT_data_0070 * -0x10;
  DAT_data_007a = (word)((uint)iVar2 >> 0x10);
  DAT_data_007b = (word)iVar2;
  FUN_prog_0a5c();
  uVar3 = CONCAT22(DAT_data_007a,DAT_data_007b);
  uVar4 = 0x1d;
  do {
    uVar1 = uVar4 & 0x1ff;
    uVar4 = uVar4 - 1;
  } while (uVar1 != 0);
  do {
    DAT_data_007a = (word)(uVar3 >> 0x10);
    DAT_data_007b = (word)uVar3;
    PA0 = DAT_data_007a;
    PA7 = DAT_data_007b;
    wData0000 = PA4;
    wData0001 = PA4;
    wData0002 = PA4;
    wData0003 = PA4;
    DAT_data_0004 = PA4;
    DAT_data_0005 = PA4;
    DAT_data_0006 = PA4;
    DAT_data_0007 = PA4;
    DAT_data_0008 = PA4;
    DAT_data_0009 = PA4;
    DAT_data_000a = PA4;
    DAT_data_000b = PA4;
    DAT_data_000c = PA4;
    DAT_data_000d = PA4;
    DAT_data_000e = PA4;
    DAT_data_000f = PA4;
    uData007f = (undefined2)
                ((uint)((int)(short)wData0000 * 0x4000 + (int)(short)wData0001 * 0x4000 +
                        (int)(short)wData0002 * 0x4000 + (int)(short)wData0003 * 0x4000) >> 0x10);
    uData007e = (undefined2)
                ((uint)((int)(short)DAT_data_0004 * 0x4000 + (int)(short)DAT_data_0005 * 0x4000 +
                        (int)(short)DAT_data_0006 * 0x4000 + (int)(short)DAT_data_0007 * 0x4000) >>
                0x10);
    DAT_data_007d =
         (undefined2)
         ((uint)((int)(short)DAT_data_0008 * 0x4000 + (int)(short)DAT_data_0009 * 0x4000 +
                 (int)(short)DAT_data_000a * 0x4000 + (int)(short)DAT_data_000b * 0x4000) >> 0x10);
    DAT_data_007c =
         (undefined2)
         ((uint)((int)(short)DAT_data_000c * 0x4000 + (int)(short)DAT_data_000d * 0x4000 +
                 (int)(short)DAT_data_000e * 0x4000 + (int)(short)DAT_data_000f * 0x4000) >> 0x10);
    *(undefined2 *)(DAT_data_0078 & 0xfff) = DAT_data_007c;
    *(undefined2 *)(DAT_data_0078 + DAT_data_0070 & 0xfff) = DAT_data_007d;
    uVar4 = DAT_data_0078 + DAT_data_0070 + DAT_data_0070;
    *(undefined2 *)(uVar4 & 0xfff) = uData007e;
    uVar4 = uVar4 + DAT_data_0070;
    *(undefined2 *)(uVar4 & 0xfff) = uData007f;
    DAT_data_0078 = uVar4 + DAT_data_0070;
    uVar3 = (uint)DAT_data_007a * 0x10000 + (uVar3 & 0xffff) + (int)DAT_data_0070 * -0x10;
    DAT_data_007a = (short)(uVar3 >> 0x10);
    DAT_data_007b = (short)uVar3;
  } while ((int)((uint)DAT_data_0078 * 0x10000 + (uint)DAT_data_0079 * -0x10000) < 0);
  return;
}


// ===== FUN_prog_0b8d @ prog:0b8d =====

void FUN_prog_0b8d(void)

{
  DAT_data_006b = 0;
  DAT_data_007b = DAT_data_0068;
  DAT_data_007d = DAT_data_0068;
  DAT_data_006c = DAT_data_0049;
  DAT_data_007c =
       (ushort)((uint)DAT_data_0068 * 0x10000 + (int)DAT_data_0049 * 0x4000 +
                (int)DAT_data_0048 * -0x4000 >> 0x10);
  do {
    DAT_data_0079 = *(ushort *)(DAT_data_007b & 0xfff);
    if (-1 < (int)((uint)DAT_data_0079 * 0x10000 + (uint)DAT_data_006b * -0x10000)) {
      DAT_data_007d = DAT_data_007b;
      DAT_data_006c = (DAT_data_007b - DAT_data_0068) * 4 + DAT_data_0048;
      DAT_data_006b = DAT_data_0079;
    }
    DAT_data_007b = DAT_data_007b + 1;
  } while (0 < (int)((uint)DAT_data_007c * 0x10000 + (uint)DAT_data_007b * -0x10000));
  *(undefined2 *)(DAT_data_007d & 0xfff) = DAT_data_0072;
  return;
}


// ===== FUN_prog_0bb1 @ prog:0bb1 =====

void FUN_prog_0bb1(void)

{
  int iVar1;
  ushort uVar2;
  int iVar3;
  ushort uVar4;
  
  DAT_data_0078 = DAT_data_0067;
  DAT_data_0075 = (short)((uint)((int)DAT_data_0049 * 0x4000 + (int)DAT_data_004a * 0x4000) >> 0x10)
  ;
  DAT_data_007b = DAT_data_0072;
  DAT_data_007a = DAT_data_0073;
  do {
    DAT_data_0075 = DAT_data_0075 - DAT_data_0070;
    DAT_data_0079 = *(ushort *)(DAT_data_0078 & 0xfff);
    uVar4 = DAT_data_0079;
    if ((0 < (int)((uint)DAT_data_0079 * 0x10000 + (uint)DAT_data_007b * -0x10000)) &&
       (uVar4 = DAT_data_007b,
       -1 < (int)((uint)DAT_data_0079 * 0x10000 + (uint)DAT_data_007a * -0x10000))) {
      DAT_data_007a = DAT_data_0079;
    }
    DAT_data_007b = uVar4;
    DAT_data_0078 = DAT_data_0078 + 1;
  } while (DAT_data_0075 != 0);
  DAT_data_007c =
       (short)((uint)((int)(short)DAT_data_007a * 0x8000 + (int)(short)DAT_data_007b * 0x8000) >>
              0x10);
  DAT_data_007d =
       (ushort)((uint)((int)(short)DAT_data_007a * 0x8000 + (int)(short)DAT_data_007b * -0x8000) >>
               0x10);
  if ((uint)DAT_data_007d * 0x10000 + (uint)DAT_data_006f * -0x10000 == 0) {
    DAT_data_006d = DAT_data_0072;
    DAT_data_0075 = 0;
  }
  else {
    DAT_data_0075 = (short)((uint)((int)(short)DAT_data_0072 << 0xf) >> 0x10);
    uVar4 = 0xf;
    iVar3 = (int)DAT_data_0075;
    do {
      iVar1 = iVar3 + (uint)DAT_data_007d * -0x8000;
      if (iVar1 < 0) {
        iVar3 = iVar3 << 1;
      }
      else {
        iVar3 = iVar1 * 2 + 1;
      }
      uVar2 = uVar4 & 0x1ff;
      uVar4 = uVar4 - 1;
    } while (uVar2 != 0);
    DAT_data_006d = (ushort)iVar3;
    if (DAT_data_006d == 0) {
      DAT_data_006d = DAT_data_0070;
    }
  }
  return;
}


// ===== FUN_prog_0bf0 @ prog:0bf0 =====

void FUN_prog_0bf0(void)

{
  DAT_data_0078 = 0;
  do {
    DAT_data_0079 =
         (undefined2)
         ((uint)((int)((short)((uint)*(ushort *)(DAT_data_0078 + DAT_data_0067 & 0xfff) * 0x10000 +
                               (uint)DAT_data_007c * -0x10000 >> 0x10) * DAT_data_006d) *
                 (int)DAT_data_006e * 2) >> 0x10);
    *(undefined2 *)(DAT_data_0078 + DAT_data_0067 & 0xfff) = DAT_data_0079;
    DAT_data_0078 = DAT_data_0078 + DAT_data_0070;
  } while ((int)((uint)DAT_data_0078 * 0x10000 + (int)DAT_data_0049 * -0x4000 +
                 (int)DAT_data_004a * -0x4000 + (int)DAT_data_0072 * -0x10) < 0);
  return;
}


// ===== FUN_prog_0c0d @ prog:0c0d =====

void FUN_prog_0c0d(void)

{
  DAT_data_0078 = 1;
  DAT_data_0079 = 0;
  FUN_prog_0c1d();
  DAT_data_006a = *(undefined2 *)(DAT_data_0068 & 0xfff);
  DAT_data_0078 =
       (undefined2)((uint)((int)DAT_data_0049 * 0x4000 + (int)DAT_data_0048 * -0x4000) >> 0x10);
  DAT_data_0079 = (undefined2)((uint)((int)DAT_data_0048 << 0xe) >> 0x10);
  FUN_prog_0c1d();
  return;
}


// ===== FUN_prog_0c1d @ prog:0c1d =====

void FUN_prog_0c1d(void)

{
  DAT_data_007a = DAT_data_0067;
  FUN_prog_0c7c();
  DAT_data_007a = DAT_data_0067 + DAT_data_0079;
  FUN_prog_0c85();
  DAT_data_007a = DAT_data_0067 + 0x20 + DAT_data_0079;
  DAT_data_007b = DAT_data_0068;
  if (DAT_data_0069 == 0) {
    FUN_prog_0c55();
  }
  else {
    FUN_prog_0c66();
  }
  DAT_data_007c = 0x20;
  do {
    DAT_data_007a = DAT_data_007c + DAT_data_0067;
    FUN_prog_0c7c();
    DAT_data_007a = DAT_data_007c + DAT_data_0079 + DAT_data_0067;
    FUN_prog_0c85();
    DAT_data_007b = DAT_data_0068;
    DAT_data_007a = DAT_data_007a + 0x20;
    FUN_prog_0c66();
    DAT_data_007c = DAT_data_007c + 0x20;
  } while ((int)((uint)DAT_data_007c * 0x10000 + (int)DAT_data_004a * -0x4000) < 0);
  return;
}


// ===== FUN_prog_0c55 @ prog:0c55 =====

void FUN_prog_0c55(void)

{
  ushort in_AR0;
  
  while( true ) {
    in_AR0 = in_AR0 - 1;
    FUN_prog_0c8e();
    *(undefined2 *)(DAT_data_007b & 0xfff) = DAT_data_0075;
    DAT_data_007b = DAT_data_007b + 1;
    if ((in_AR0 & 0x1ff) == 0) break;
    DAT_data_0020 = *(undefined2 *)(DAT_data_007a & 0xfff);
    DAT_data_007a = DAT_data_007a + DAT_data_0070;
  }
  return;
}


// ===== FUN_prog_0c66 @ prog:0c66 =====

void FUN_prog_0c66(void)

{
  ushort in_AR0;
  
  while( true ) {
    in_AR0 = in_AR0 - 1;
    FUN_prog_0c8e();
    DAT_data_0076 = *(ushort *)(DAT_data_007b & 0xfff);
    DAT_data_0075 = (ushort)((uint)DAT_data_0076 * 0x10000 + (uint)DAT_data_0075 * 0x10000 >> 0x10);
    *(ushort *)(DAT_data_007b & 0xfff) = DAT_data_0075;
    DAT_data_007b = DAT_data_007b + 1;
    if ((in_AR0 & 0x1ff) == 0) break;
    DAT_data_0020 = *(undefined2 *)(DAT_data_007a & 0xfff);
    DAT_data_007a = DAT_data_007a + DAT_data_0070;
  }
  return;
}


// ===== FUN_prog_0c7c @ prog:0c7c =====

void FUN_prog_0c7c(void)

{
  ushort uVar1;
  short sVar2;
  ushort uVar3;
  
  sVar2 = 0x1f;
  uVar1 = DAT_data_007a;
  do {
    DAT_data_001f = *(undefined2 *)(uVar1 & 0xfff);
    uVar3 = sVar2 - 1;
    uVar1 = uVar1 + DAT_data_0070;
    sVar2 = sVar2 + -2;
  } while ((uVar3 & 0x1ff) != 0);
  return;
}


// ===== FUN_prog_0c85 @ prog:0c85 =====

void FUN_prog_0c85(void)

{
  ushort uVar1;
  short sVar2;
  ushort uVar3;
  
  sVar2 = 0x1f;
  uVar1 = DAT_data_007a;
  do {
    DAT_data_003f = *(undefined2 *)(uVar1 & 0xfff);
    uVar3 = sVar2 - 1;
    uVar1 = uVar1 + DAT_data_0070;
    sVar2 = sVar2 + -2;
  } while ((uVar3 & 0x1ff) != 0);
  return;
}


// ===== FUN_prog_0c8e @ prog:0c8e =====

void FUN_prog_0c8e(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  int iVar16;
  int iVar17;
  int iVar18;
  int iVar19;
  int iVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  int iVar24;
  int iVar25;
  int iVar26;
  int iVar27;
  int iVar28;
  int iVar29;
  int iVar30;
  int iVar31;
  
  iVar1 = (int)DAT_data_003f;
  DAT_data_003f = DAT_data_003e;
  iVar2 = (int)DAT_data_003e;
  DAT_data_003e = DAT_data_003d;
  iVar3 = (int)DAT_data_003d;
  DAT_data_003d = DAT_data_003c;
  iVar4 = (int)DAT_data_003c;
  DAT_data_003c = DAT_data_003b;
  iVar5 = (int)DAT_data_003b;
  DAT_data_003b = DAT_data_003a;
  iVar6 = (int)DAT_data_003a;
  DAT_data_003a = DAT_data_0039;
  iVar7 = (int)DAT_data_0039;
  DAT_data_0039 = DAT_data_0038;
  iVar8 = (int)DAT_data_0038;
  DAT_data_0038 = DAT_data_0037;
  iVar9 = (int)DAT_data_0037;
  DAT_data_0037 = DAT_data_0036;
  iVar10 = (int)DAT_data_0036;
  DAT_data_0036 = DAT_data_0035;
  iVar11 = (int)DAT_data_0035;
  DAT_data_0035 = DAT_data_0034;
  iVar12 = (int)DAT_data_0034;
  DAT_data_0034 = DAT_data_0033;
  iVar13 = (int)DAT_data_0033;
  DAT_data_0033 = DAT_data_0032;
  iVar14 = (int)DAT_data_0032;
  DAT_data_0032 = DAT_data_0031;
  iVar15 = (int)DAT_data_0031;
  DAT_data_0031 = DAT_data_0030;
  iVar16 = (int)DAT_data_0030;
  DAT_data_0030 = DAT_data_002f;
  iVar17 = (int)DAT_data_002f;
  DAT_data_002f = DAT_data_002e;
  iVar18 = (int)DAT_data_002e;
  DAT_data_002e = DAT_data_002d;
  iVar19 = (int)DAT_data_002d;
  DAT_data_002d = DAT_data_002c;
  iVar20 = (int)DAT_data_002c;
  DAT_data_002c = DAT_data_002b;
  iVar21 = (int)DAT_data_002b;
  DAT_data_002b = DAT_data_002a;
  iVar22 = (int)DAT_data_002a;
  DAT_data_002a = DAT_data_0029;
  iVar23 = (int)DAT_data_0029;
  DAT_data_0029 = DAT_data_0028;
  iVar24 = (int)DAT_data_0028;
  DAT_data_0028 = DAT_data_0027;
  iVar25 = (int)DAT_data_0027;
  DAT_data_0027 = DAT_data_0026;
  iVar26 = (int)DAT_data_0026;
  DAT_data_0026 = DAT_data_0025;
  iVar27 = (int)DAT_data_0025;
  DAT_data_0025 = DAT_data_0024;
  iVar28 = (int)DAT_data_0024;
  DAT_data_0024 = DAT_data_0023;
  iVar29 = (int)DAT_data_0023;
  DAT_data_0023 = DAT_data_0022;
  iVar30 = (int)DAT_data_0022;
  DAT_data_0022 = DAT_data_0021;
  iVar31 = (int)DAT_data_0021;
  DAT_data_0021 = DAT_data_0020;
  DAT_data_0075 =
       (short)((uint)((iVar1 * DAT_data_001f + iVar2 * DAT_data_001e + iVar3 * DAT_data_001d +
                       iVar4 * DAT_data_001c + iVar5 * DAT_data_001b + iVar6 * DAT_data_001a +
                       iVar7 * DAT_data_0019 + iVar8 * DAT_data_0018 + iVar9 * DAT_data_0017 +
                       iVar10 * DAT_data_0016 + iVar11 * DAT_data_0015 + iVar12 * DAT_data_0014 +
                       iVar13 * DAT_data_0013 + iVar14 * DAT_data_0012 + iVar15 * DAT_data_0011 +
                       iVar16 * DAT_data_0010 + iVar17 * DAT_data_000f + iVar18 * DAT_data_000e +
                       iVar19 * DAT_data_000d + iVar20 * DAT_data_000c + iVar21 * DAT_data_000b +
                       iVar22 * DAT_data_000a + iVar23 * DAT_data_0009 + iVar24 * DAT_data_0008 +
                       iVar25 * DAT_data_0007 + iVar26 * DAT_data_0006 + iVar27 * DAT_data_0005 +
                       iVar28 * DAT_data_0004 + iVar29 * sData0003 + iVar30 * sData0002 +
                       iVar31 * sData0001 + (int)DAT_data_0020 * (int)sData0000) * 2) >> 0x10);
  return;
}


