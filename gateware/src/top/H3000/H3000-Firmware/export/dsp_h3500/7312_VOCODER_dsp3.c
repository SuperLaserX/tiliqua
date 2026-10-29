// 7312_VOCODER_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7312_VOCODER_dsp3 (ucode_7312_ROM4_3D774.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  int iVar5;
  ushort uVar6;
  
  uVar6 = 0x8f;
  do {
    *(undefined2 *)(uVar6 & 0xff) = 0;
    uVar1 = uVar6 & 0x1ff;
    uVar6 = uVar6 - 1;
  } while (uVar1 != 0);
  DAT_data_0047 = 1;
  DAT_data_004b = 0x400;
  DAT_data_004a = 0x8000;
  DAT_data_0046 = 0;
  DAT_data_0048 = 0xffff;
  DAT_data_0049 = 0x7fff;
  DAT_data_0061 = 0xd97;
  DAT_data_0062 = 0xdd7;
  DAT_data_0063 = 0xc90;
  DAT_data_0064 = 0xdd7;
  DAT_data_0065 = 0xe57;
  DAT_data_0066 = 0xe97;
  DAT_data_0067 = 0xfd7;
  DAT_data_0068 = 0x200;
  DAT_data_0069 = 0x13;
  DAT_data_006a = 0;
  DAT_data_007a = 0x7f00;
  DAT_data_007b = 0x100;
  DAT_data_004d = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    if ((wVar3 & DAT_data_004b) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    DAT_data_004d = DAT_data_004d + 0x15;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
    PA4 = DAT_data_0046;
  } while (0 < DAT_data_004d);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  DAT_data_004c = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    do {
      FUN_prog_08b3();
      FUN_prog_08e5();
      FUN_prog_093d();
      FUN_prog_0962();
      FUN_prog_0995();
      FUN_prog_099e();
      iVar5 = FUN_prog_09ed();
    } while (iVar5 < 0);
    FUN_prog_0b1e();
  } while( true );
}


// ===== FUN_prog_08b3 @ prog:08b3 =====

void FUN_prog_08b3(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  
  FUN_prog_0b0c();
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  PA0 = 0xc000;
  do {
    do {
      cVar1 = bio_pin();
    } while (cVar1 == '\0');
    do {
      cVar1 = bio_pin();
    } while (cVar1 != '\0');
    wVar2 = PA5;
    if ((wVar2 & DAT_data_004b) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    DAT_data_004c = PA0;
  } while ((DAT_data_0047 << 1 & DAT_data_004c) != 0);
  return;
}


// ===== FUN_prog_08e5 @ prog:08e5 =====

void FUN_prog_08e5(void)

{
  ushort uVar1;
  char cVar2;
  ushort uVar3;
  ushort uVar4;
  
  DAT_data_0050 = DAT_data_0062;
  DAT_data_0051 = DAT_data_0062 + DAT_data_0068;
  FUN_prog_0b0c();
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  DAT_data_0060 = PA1;
  DAT_data_0052 = (DAT_data_0060 - DAT_data_0068) + DAT_data_0047 * -0x30;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    PA7 = DAT_data_0052;
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
    *(word *)(DAT_data_0050 & 0xfff) = wData0000;
    *(word *)(DAT_data_0050 + DAT_data_0047 & 0xfff) = wData0001;
    uVar3 = DAT_data_0050 + DAT_data_0047 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = wData0002;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = wData0003;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_0004;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_0005;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_0006;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_0007;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_0008;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_0009;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_000a;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_000b;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_000c;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_000d;
    uVar3 = uVar3 + DAT_data_0047;
    *(word *)(uVar3 & 0xfff) = DAT_data_000e;
    DAT_data_0050 = uVar3 + DAT_data_0047;
    DAT_data_0052 = DAT_data_0052 + DAT_data_0047 * 0x10;
  } while ((int)((uint)DAT_data_0050 * 0x10000 + (uint)DAT_data_0051 * -0x10000) < 0);
  uVar4 = 0x14;
  uVar3 = DAT_data_0067;
  do {
    *(undefined2 *)(uVar3 & 0xfff) = DAT_data_0046;
    uVar3 = uVar3 + DAT_data_0047;
    uVar1 = uVar4 & 0x1ff;
    uVar4 = uVar4 - 1;
  } while (uVar1 != 0);
  return;
}


// ===== FUN_prog_093d @ prog:093d =====

void FUN_prog_093d(void)

{
  int iVar1;
  ushort uVar2;
  int iVar3;
  ushort uVar4;
  
  DAT_data_0050 = DAT_data_0062;
  uVar4 = DAT_data_0047 * 0x1ff;
  DAT_data_006e = 0;
  do {
    DAT_data_004c = *(ushort *)(DAT_data_0050 & 0xfff);
    DAT_data_0050 = DAT_data_0050 + DAT_data_0047;
    iVar3 = (int)(short)DAT_data_004c;
    if (iVar3 < 0) {
      iVar3 = -iVar3;
    }
    if ((0 < iVar3 - (short)DAT_data_006e) &&
       (DAT_data_006e = DAT_data_004c, (short)DAT_data_004c < 0)) {
      DAT_data_006e = -DAT_data_004c;
    }
    uVar2 = uVar4 & 0x1ff;
    uVar4 = uVar4 - 1;
  } while (uVar2 != 0);
  uVar4 = 0xf;
  iVar3 = (int)DAT_data_0049;
  do {
    iVar1 = iVar3 + (uint)DAT_data_006e * -0x8000;
    if (iVar1 < 0) {
      iVar3 = iVar3 << 1;
    }
    else {
      iVar3 = iVar1 * 2 + 1;
    }
    uVar2 = uVar4 & 0x1ff;
    uVar4 = uVar4 - 1;
  } while (uVar2 != 0);
  DAT_data_006d = (short)iVar3;
  if (iVar3 * 0x10000 + (uint)DAT_data_0046 * -0x10000 == 0) {
    DAT_data_006d = DAT_data_0047;
  }
  return;
}


// ===== FUN_prog_0962 @ prog:0962 =====

void FUN_prog_0962(void)

{
  short *psVar1;
  ushort uVar2;
  ushort uVar3;
  
  DAT_data_0050 = DAT_data_0062;
  DAT_data_0051 = DAT_data_0063;
  uVar3 = 0xff;
  do {
    psVar1 = (short *)(DAT_data_0051 & 0xfff);
    DAT_data_0051 = DAT_data_0051 + DAT_data_0047;
    *(short *)(DAT_data_0050 & 0xfff) =
         (short)((uint)((int)(short)((uint)((int)(*(short *)(DAT_data_0050 & 0xfff) * DAT_data_006d)
                                           << 0xe) >> 0x10) * (int)*psVar1 * 2) >> 0x10);
    DAT_data_0050 = DAT_data_0050 + DAT_data_0047;
    uVar2 = uVar3 & 0x1ff;
    uVar3 = uVar3 - 1;
  } while (uVar2 != 0);
  uVar3 = 0xff;
  do {
    DAT_data_0051 = DAT_data_0051 - DAT_data_0047;
    DAT_data_004d = *(short *)(DAT_data_0051 & 0xfff);
    DAT_data_004c =
         (undefined2)
         ((uint)((int)(short)((uint)((int)(*(short *)(DAT_data_0050 & 0xfff) * DAT_data_006d) << 0xe
                                    ) >> 0x10) * (int)*(short *)(DAT_data_0051 & 0xfff) * 2) >> 0x10
         );
    *(undefined2 *)(DAT_data_0050 & 0xfff) = DAT_data_004c;
    DAT_data_0050 = DAT_data_0050 + DAT_data_0047;
    uVar2 = uVar3 & 0x1ff;
    uVar3 = uVar3 - 1;
  } while (uVar2 != 0);
  return;
}


// ===== FUN_prog_0995 @ prog:0995 =====

void FUN_prog_0995(void)

{
  DAT_data_0050 = DAT_data_0069 + DAT_data_0047;
  DAT_data_0051 = 0;
  DAT_data_0054 = 0;
  FUN_prog_0bcd();
  return;
}


// ===== FUN_prog_099e @ prog:099e =====

void FUN_prog_099e(void)

{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  
  iVar1 = CONCAT22(*(undefined2 *)(DAT_data_0061 & 0xfff),
                   *(undefined2 *)(DAT_data_0061 + DAT_data_0047 & 0xfff));
  DAT_data_0051 = 0;
  while( true ) {
    DAT_data_0040 = (short)((uint)iVar1 >> 0x10);
    DAT_data_0041 = (short)iVar1;
    if ((DAT_data_0040 == 0) && (-1 < iVar1 << 0x10)) break;
    DAT_data_0042 = (ushort)((uint)((int)DAT_data_0040 << 0xf) >> 0x10);
    DAT_data_0043 =
         (ushort)((int)DAT_data_0040 << 0xf) |
         (DAT_data_0048 << 0xf ^ DAT_data_0048) &
         (ushort)((uint)((int)DAT_data_0041 << 0xf) >> 0x10);
    iVar1 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
    DAT_data_0051 = DAT_data_0051 + 1;
  }
  *(undefined2 *)(DAT_data_0061 & 0xfff) = 0;
  *(short *)(DAT_data_0061 + DAT_data_0047 & 0xfff) = DAT_data_0041;
  DAT_data_0050 = DAT_data_0061 + DAT_data_0047 + DAT_data_0047;
  uVar2 = DAT_data_0069;
  do {
    uVar2 = uVar2 - 1;
    iVar1 = CONCAT22(*(undefined2 *)(DAT_data_0050 & 0xfff),
                     *(undefined2 *)(DAT_data_0050 + DAT_data_0047 & 0xfff));
    uVar3 = DAT_data_0051;
    while( true ) {
      DAT_data_0041 = (short)iVar1;
      DAT_data_0040 = (short)((uint)iVar1 >> 0x10);
      if ((uVar3 & 0x1ff) == 0) break;
      uVar3 = uVar3 - 1;
      DAT_data_0042 = (ushort)((uint)((int)DAT_data_0040 << 0xf) >> 0x10);
      DAT_data_0043 =
           (ushort)((int)DAT_data_0040 << 0xf) |
           (DAT_data_0048 << 0xf ^ DAT_data_0048) &
           (ushort)((uint)((int)DAT_data_0041 << 0xf) >> 0x10);
      iVar1 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
    }
    *(short *)(DAT_data_0050 & 0xfff) = DAT_data_0040;
    *(short *)(DAT_data_0050 + DAT_data_0047 & 0xfff) = DAT_data_0041;
    DAT_data_0050 = DAT_data_0050 + DAT_data_0047 + DAT_data_0047;
  } while ((uVar2 & 0x1ff) != 0);
  return;
}


// ===== FUN_prog_09ed @ prog:09ed =====

int FUN_prog_09ed(void)

{
  short sVar1;
  int iVar2;
  ushort uVar3;
  undefined2 extraout_var;
  int iVar4;
  uint uVar5;
  ushort uVar6;
  ushort uVar7;
  
  DAT_data_0053 = *(ushort *)(DAT_data_0061 + DAT_data_0047 & 0xfff);
  iVar4 = FUN_prog_0b44();
  uVar6 = (ushort)((uint)iVar4 >> 0x10);
  DAT_data_004c =
       (short)(iVar4 + (uint)uVar6 * 0x10000 + (uint)uVar6 * 0x10000 + (uint)uVar6 * 0x10000 >> 0x10
              );
  uVar6 = 0xf;
  iVar4 = (int)DAT_data_004c;
  do {
    iVar2 = iVar4 + (uint)DAT_data_006d * -0x8000;
    if (iVar2 < 0) {
      iVar4 = iVar4 << 1;
    }
    else {
      iVar4 = iVar2 * 2 + 1;
    }
    uVar7 = uVar6 & 0x1ff;
    uVar6 = uVar6 - 1;
  } while (uVar7 != 0);
  DAT_data_006c = (undefined2)iVar4;
  if ((int)((uint)DAT_data_006e * 0x10000 + (uint)DAT_data_0078 * -0x10000) < 0) {
    iVar4 = 0;
    DAT_data_006c = 0;
  }
  else {
    DAT_data_0050 = 0;
    do {
      *(undefined2 *)(DAT_data_0066 + DAT_data_0050 & 0xfff) = DAT_data_0046;
      DAT_data_0050 = DAT_data_0050 + 1;
    } while ((int)((uint)DAT_data_0050 * 0x10000 + -0x140000) < 1);
    DAT_data_0052 = DAT_data_0069;
    uVar6 = DAT_data_0064 + DAT_data_0069 * 2;
    *(short *)(uVar6 & 0xfff) = DAT_data_0049;
    *(undefined2 *)(uVar6 + DAT_data_0047 & 0xfff) = DAT_data_0048;
    DAT_data_0053 = *(ushort *)(DAT_data_0061 + DAT_data_0047 & 0xfff);
    DAT_data_0050 = 1;
    do {
      DAT_data_0054 = *(ushort *)(DAT_data_0061 + DAT_data_0050 * 2 + DAT_data_0047 & 0xfff);
      uVar6 = DAT_data_0053;
      if ((short)DAT_data_0053 < 0) {
        uVar6 = -DAT_data_0053;
      }
      DAT_data_004e = DAT_data_0054;
      if ((short)DAT_data_0054 < 0) {
        DAT_data_004e = -DAT_data_0054;
      }
      uVar5 = (uint)DAT_data_004e << 0x10;
      uVar7 = 0xe;
      do {
        iVar4 = uVar5 + (uint)uVar6 * -0x8000;
        if (iVar4 < 0) {
          uVar5 = uVar5 << 1;
        }
        else {
          uVar5 = iVar4 * 2 + 1;
        }
        uVar3 = uVar7 & 0x1ff;
        uVar7 = uVar7 - 1;
      } while (uVar3 != 0);
      DAT_data_005b = (undefined2)uVar5;
      if ((int)(short)DAT_data_0054 * (int)(short)DAT_data_0053 < 0) {
        DAT_data_005b = (undefined2)((uVar5 & 0xffff) * -0x10000 >> 0x10);
      }
      uVar6 = DAT_data_0064 + DAT_data_0050 * 2 + DAT_data_0069 * 2;
      *(undefined2 *)(uVar6 & 0xfff) = DAT_data_005b;
      *(undefined2 *)(uVar6 + DAT_data_0047 & 0xfff) = DAT_data_0046;
      uVar6 = DAT_data_0064 + DAT_data_0069 * 2 + DAT_data_0050 * -2;
      *(undefined2 *)(uVar6 & 0xfff) = DAT_data_005b;
      *(undefined2 *)(uVar6 + DAT_data_0047 & 0xfff) = DAT_data_0046;
      DAT_data_0050 = DAT_data_0050 + 1;
    } while ((int)((uint)DAT_data_0050 * 0x10000 + (uint)DAT_data_0069 * -0x10000) < 1);
    DAT_data_0055 = DAT_data_0049;
    DAT_data_0050 = 1;
    do {
      DAT_data_005d = *(ushort *)(DAT_data_0064 + DAT_data_0069 * 2 & 0xfff);
      uVar6 = *(ushort *)(DAT_data_0064 + DAT_data_0069 * 2 + DAT_data_0050 * 2 & 0xfff);
      uVar7 = uVar6;
      if ((short)uVar6 < 0) {
        uVar7 = -uVar6;
      }
      DAT_data_004d = DAT_data_005d;
      if ((short)DAT_data_005d < 0) {
        DAT_data_004d = -DAT_data_005d;
      }
      if ((int)((uint)uVar7 * 0x10000 + (uint)DAT_data_004d * -0x10000) < 0) {
        iVar4 = (int)(short)uVar6;
        DAT_data_004d = DAT_data_005d;
        if ((short)DAT_data_005d < 0) {
          DAT_data_004d = -DAT_data_005d;
        }
        if ((short)uVar6 < 0) {
          uVar6 = -uVar6;
        }
        uVar5 = (uint)uVar6 << 0x10;
        uVar7 = 0xe;
        do {
          iVar2 = uVar5 + (uint)DAT_data_004d * -0x8000;
          if (iVar2 < 0) {
            uVar5 = uVar5 << 1;
          }
          else {
            uVar5 = iVar2 * 2 + 1;
          }
          uVar3 = uVar7 & 0x1ff;
          uVar7 = uVar7 - 1;
        } while (uVar3 != 0);
        DAT_data_0056 = (short)uVar5;
        if (iVar4 * (short)DAT_data_005d < 0) {
          DAT_data_0056 = (short)((uVar5 & 0xffff) * -0x10000 >> 0x10);
        }
        DAT_data_0056 = -DAT_data_0056;
        iVar4 = (int)DAT_data_0056;
        if (iVar4 < 0) {
          iVar4 = -iVar4;
        }
        DAT_data_004e = uVar6;
        if (-1 < iVar4 - DAT_data_007a) {
          DAT_data_0056 = (short)((uint)((int)DAT_data_0056 * (int)DAT_data_007a * 2) >> 0x10);
        }
      }
      else if ((int)(short)uVar6 * (int)(short)DAT_data_005d < 1) {
        DAT_data_0056 = DAT_data_007a;
      }
      else {
        DAT_data_0056 = -DAT_data_007a;
      }
      *(short *)(DAT_data_0066 + DAT_data_0050 & 0xfff) = DAT_data_0056;
      sVar1 = (short)((uint)(((int)DAT_data_0049 * 0x8000 - (int)DAT_data_0056 * (int)DAT_data_0056)
                            * 2) >> 0x10);
      iVar4 = CONCAT22(sVar1,DAT_data_005c);
      sVar1 = (short)((uint)((int)sVar1 * (int)DAT_data_0055 * 2) >> 0x10);
      if ((int)sVar1 - (int)DAT_data_007b < 1) {
        *(undefined2 *)(DAT_data_0066 + DAT_data_0050 & 0xfff) = DAT_data_0046;
        DAT_data_0080 = DAT_data_0047;
        DAT_data_004c = sVar1;
        goto LAB_prog_0b01;
      }
      DAT_data_0051 = (ushort)((uint)((int)(short)(DAT_data_0050 + 1) << 0xf) >> 0x10);
      do {
        uVar6 = DAT_data_0064 + DAT_data_0050 * 2 + DAT_data_0069 * 2 + DAT_data_0051 * -2;
        DAT_data_0057 = *(ushort *)(uVar6 & 0xfff);
        DAT_data_0058 = *(ushort *)(uVar6 + DAT_data_0047 & 0xfff);
        iVar4 = (int)DAT_data_0056 *
                (int)*(short *)(DAT_data_0064 + DAT_data_0051 * 2 + DAT_data_0069 * 2 & 0xfff) * 2 +
                (uint)DAT_data_0057 * 0x10000 + (uint)DAT_data_0058;
        uVar6 = DAT_data_0064 + DAT_data_0050 * 2 + DAT_data_0069 * 2 + DAT_data_0051 * -2;
        *(short *)(uVar6 & 0xfff) = (short)((uint)iVar4 >> 0x10);
        *(short *)(uVar6 + DAT_data_0047 & 0xfff) = (short)iVar4;
        uVar6 = DAT_data_0064 + DAT_data_0051 * 2 + DAT_data_0069 * 2;
        iVar4 = (int)DAT_data_0056 * (int)(short)DAT_data_0057 * 2 +
                (uint)*(ushort *)(uVar6 & 0xfff) * 0x10000 +
                (uint)*(ushort *)(uVar6 + DAT_data_0047 & 0xfff);
        DAT_data_005c = (undefined2)iVar4;
        uVar6 = DAT_data_0064 + DAT_data_0051 * 2 + DAT_data_0069 * 2;
        *(short *)(uVar6 & 0xfff) = (short)((uint)iVar4 >> 0x10);
        *(undefined2 *)(uVar6 + DAT_data_0047 & 0xfff) = DAT_data_005c;
        DAT_data_0051 = DAT_data_0051 + 1;
      } while ((int)((uint)DAT_data_0051 * 0x10000 + (uint)DAT_data_0069 * -0x10000) < 1);
      DAT_data_0051 = 1;
      DAT_data_0050 = DAT_data_0050 + 1;
      DAT_data_0055 = sVar1;
    } while ((int)((uint)DAT_data_0050 * 0x10000 + (uint)DAT_data_0069 * -0x10000) < 1);
    DAT_data_0080 = 0;
    DAT_data_004c = (short)((uint)((int)DAT_data_0056 << 0xf) >> 0x10);
LAB_prog_0b01:
    DAT_data_005b = (undefined2)((uint)iVar4 >> 0x10);
    DAT_data_005c = (undefined2)iVar4;
    FUN_prog_0b44();
    iVar4 = (uint)DAT_data_0080 << 0x10;
    DAT_data_006b = extraout_var;
  }
  return iVar4;
}


// ===== FUN_prog_0b0c @ prog:0b0c =====

void FUN_prog_0b0c(void)

{
  ushort uVar1;
  char cVar2;
  ushort uVar3;
  
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  DAT_data_004c = PA0;
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


// ===== FUN_prog_0b1e @ prog:0b1e =====

void FUN_prog_0b1e(void)

{
  char cVar1;
  
  FUN_prog_0b0c();
  DAT_data_0050 = 1;
  DAT_data_0051 = 0x14;
  do {
    DAT_data_004c = DAT_data_0050;
    do {
      cVar1 = bio_pin();
    } while (cVar1 != '\0');
    PA2 = DAT_data_0050;
    PA3 = *(word *)(DAT_data_0066 + DAT_data_0050 & 0xfff);
    DAT_data_0050 = DAT_data_0050 + 1;
    do {
      cVar1 = bio_pin();
    } while (cVar1 == '\0');
  } while ((int)((uint)DAT_data_0050 * 0x10000 + -0x140000) < 1);
  DAT_data_004d = (word)((uint)((int)DAT_data_006b * (int)DAT_data_006c * 2) >> 0x10);
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  PA2 = DAT_data_0046;
  PA3 = DAT_data_004d;
  return;
}


// ===== FUN_prog_0b44 @ prog:0b44 =====

int FUN_prog_0b44(void)

{
  ushort uVar1;
  int in_ACC;
  int iVar2;
  uint uVar3;
  int iVar4;
  undefined2 in_AR0;
  ushort uVar5;
  
  uVar3 = CONCAT22(DAT_data_0040,DAT_data_0041);
  if (in_ACC < 1) {
    iVar2 = 0;
  }
  else {
    DAT_data_0042 = (ushort)((uint)in_ACC >> 0x10);
    DAT_data_0043 = (ushort)in_ACC;
    DAT_data_0050 = 0;
    DAT_data_0057 = *(short *)(DAT_data_0047 * 0xd90 & 0xfff);
    DAT_data_0058 = *(short *)(DAT_data_0047 * 0xd91 & 0xfff);
    DAT_data_0059 = *(short *)(DAT_data_0047 * 0xd92 & 0xfff);
    DAT_data_005a = *(short *)(DAT_data_0047 * 0xd93 & 0xfff);
    DAT_data_005b = *(short *)(DAT_data_0047 * 0xd94 & 0xfff);
    DAT_data_005c = *(short *)(DAT_data_0047 * 0xd95 & 0xfff);
    DAT_data_005d = *(short *)(DAT_data_0047 * 0xd96 & 0xfff);
    while( true ) {
      DAT_data_0051 = DAT_data_0049;
      iVar2 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
      if (-1 < iVar2 + (int)DAT_data_004a * 0x8000) break;
      uVar3 = (int)(short)iVar2 << 1;
      DAT_data_0043 = (ushort)uVar3;
      DAT_data_0042 =
           ((DAT_data_0048 << 1 ^ DAT_data_0048) & (ushort)(uVar3 >> 0x10)) +
           (short)((uint)iVar2 >> 0x10) * 2;
      iVar2 = (uint)DAT_data_0042 * 0x10000 + (uVar3 & 0xffff);
      DAT_data_0051 = DAT_data_0057;
      if (-1 < iVar2 + (int)DAT_data_004a * 0x8000) break;
      DAT_data_0050 = DAT_data_0050 + 1;
      iVar4 = (int)(short)iVar2 << 1;
      DAT_data_0043 = (ushort)iVar4;
      DAT_data_0042 =
           ((DAT_data_0048 << 1 ^ DAT_data_0048) & (ushort)((uint)iVar4 >> 0x10)) +
           (short)((uint)iVar2 >> 0x10) * 2;
    }
    DAT_data_0052 =
         (short)((uint)(((int)(short)DAT_data_0042 * (int)(short)DAT_data_0042 +
                        (int)DAT_data_0047 * 0x4000) * 2) >> 0x10);
    DAT_data_0053 =
         (short)((uint)(((int)(short)DAT_data_0042 * (int)DAT_data_0052 +
                        (int)DAT_data_0047 * 0x4000) * 2) >> 0x10);
    DAT_data_0054 =
         (short)((uint)(((int)(short)DAT_data_0042 * (int)DAT_data_0053 +
                        (int)DAT_data_0047 * 0x4000) * 2) >> 0x10);
    DAT_data_0055 =
         (short)((uint)(((int)(short)DAT_data_0042 * (int)DAT_data_0054 +
                        (int)DAT_data_0047 * 0x4000) * 2) >> 0x10);
    DAT_data_004c =
         (ushort)((uint)(((int)(short)(((((uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043) -
                                        (int)(short)DAT_data_0042 * (int)(short)DAT_data_0042) +
                                        (int)(short)DAT_data_0042 * (int)DAT_data_0052 +
                                        (int)DAT_data_0052 * (int)DAT_data_005a +
                                        (int)DAT_data_0054 * (int)DAT_data_005c +
                                        (int)(short)DAT_data_0042 * (int)DAT_data_0059 +
                                        (int)DAT_data_0049 * (int)DAT_data_0058 +
                                        (int)DAT_data_0053 * (int)DAT_data_005b +
                                        (int)DAT_data_0055 * (int)DAT_data_005d +
                                       (int)DAT_data_0047 * 0x4000) * 2 >> 0x10) *
                          (int)DAT_data_0051 + (int)DAT_data_0047 * 0x4000) * 2) >> 0x10);
    uVar3 = (uint)DAT_data_004c << 0x10;
    uVar5 = DAT_data_0050;
    while (DAT_data_0040 = (ushort)(uVar3 >> 0x10), DAT_data_0041 = (short)uVar3,
          uVar1 = uVar5 & 0x1ff, uVar5 = uVar5 - 1, uVar1 != 0) {
      DAT_data_0042 = (ushort)((uint)((int)(short)DAT_data_0040 << 0xf) >> 0x10);
      DAT_data_0043 =
           (ushort)((int)(short)DAT_data_0040 << 0xf) |
           (DAT_data_0048 << 0xf ^ DAT_data_0048) &
           (ushort)((uint)((int)DAT_data_0041 << 0xf) >> 0x10);
      uVar3 = (uint)DAT_data_0042 * 0x10000 + (uint)DAT_data_0043;
    }
    iVar2 = (uint)DAT_data_0040 * 0x10000 + (uVar3 & 0xffff);
    DAT_data_004d = in_AR0;
  }
  DAT_data_0040 = (ushort)(uVar3 >> 0x10);
  DAT_data_0041 = (short)uVar3;
  return iVar2;
}


// ===== FUN_prog_0bcd @ prog:0bcd =====

void FUN_prog_0bcd(void)

{
  DAT_data_0052 = DAT_data_0062;
  FUN_prog_0c3a();
  DAT_data_0052 = DAT_data_0062 + DAT_data_0051;
  FUN_prog_0c43();
  DAT_data_0052 = DAT_data_0062 + 0x20 + DAT_data_0051;
  DAT_data_0053 = DAT_data_0051;
  if (DAT_data_0054 == 0) {
    FUN_prog_0c05();
  }
  else {
    FUN_prog_0c1c();
  }
  DAT_data_0055 = 0x20;
  do {
    DAT_data_0052 = DAT_data_0055 + DAT_data_0062;
    FUN_prog_0c3a();
    DAT_data_0052 = DAT_data_0055 + DAT_data_0051 + DAT_data_0062;
    FUN_prog_0c43();
    DAT_data_0053 = DAT_data_0051;
    DAT_data_0052 = DAT_data_0052 + 0x20;
    FUN_prog_0c1c();
    DAT_data_0055 = DAT_data_0055 + 0x20;
  } while ((int)((uint)DAT_data_0055 + (int)DAT_data_0047 * -0x200) < 0);
  return;
}


// ===== FUN_prog_0c05 @ prog:0c05 =====

void FUN_prog_0c05(void)

{
  ushort uVar1;
  ushort in_AR0;
  
  while( true ) {
    in_AR0 = in_AR0 - 1;
    FUN_prog_0c4c();
    DAT_data_0041 = DAT_data_004c;
    DAT_data_0040 = DAT_data_004c >> 0xf;
    uVar1 = DAT_data_0061 + DAT_data_0053 * 2;
    *(short *)(uVar1 & 0xfff) = DAT_data_0040;
    *(short *)(uVar1 + DAT_data_0047 & 0xfff) = DAT_data_004c;
    DAT_data_0053 = DAT_data_0053 + 1;
    if ((in_AR0 & 0x1ff) == 0) break;
    DAT_data_0020 = *(undefined2 *)(DAT_data_0052 & 0xfff);
    DAT_data_0052 = DAT_data_0052 + DAT_data_0047;
  }
  return;
}


// ===== FUN_prog_0c1c @ prog:0c1c =====

void FUN_prog_0c1c(void)

{
  ushort uVar2;
  int iVar1;
  ushort in_AR0;
  
  iVar1 = CONCAT22(DAT_data_0040,DAT_data_0041);
  while( true ) {
    DAT_data_0040 = (undefined2)((uint)iVar1 >> 0x10);
    DAT_data_0041 = (undefined2)iVar1;
    in_AR0 = in_AR0 - 1;
    FUN_prog_0c4c();
    uVar2 = DAT_data_0061 + DAT_data_0053 * 2;
    iVar1 = (uint)*(ushort *)(uVar2 & 0xfff) * 0x10000 +
            (uint)*(ushort *)(uVar2 + DAT_data_0047 & 0xfff) + (int)DAT_data_004c;
    DAT_data_0040 = (undefined2)((uint)iVar1 >> 0x10);
    DAT_data_0041 = (short)iVar1;
    uVar2 = DAT_data_0061 + DAT_data_0053 * 2;
    *(undefined2 *)(uVar2 & 0xfff) = DAT_data_0040;
    *(short *)(uVar2 + DAT_data_0047 & 0xfff) = (short)iVar1;
    DAT_data_0053 = DAT_data_0053 + 1;
    if ((in_AR0 & 0x1ff) == 0) break;
    DAT_data_0020 = *(undefined2 *)(DAT_data_0052 & 0xfff);
    DAT_data_0052 = DAT_data_0052 + DAT_data_0047;
  }
  return;
}


// ===== FUN_prog_0c3a @ prog:0c3a =====

void FUN_prog_0c3a(void)

{
  ushort uVar1;
  short sVar2;
  ushort uVar3;
  
  sVar2 = 0x1f;
  uVar1 = DAT_data_0052;
  do {
    DAT_data_001f = *(undefined2 *)(uVar1 & 0xfff);
    uVar3 = sVar2 - 1;
    uVar1 = uVar1 + DAT_data_0047;
    sVar2 = sVar2 + -2;
  } while ((uVar3 & 0x1ff) != 0);
  return;
}


// ===== FUN_prog_0c43 @ prog:0c43 =====

void FUN_prog_0c43(void)

{
  ushort uVar1;
  short sVar2;
  ushort uVar3;
  
  sVar2 = 0x1f;
  uVar1 = DAT_data_0052;
  do {
    DAT_data_003f = *(undefined2 *)(uVar1 & 0xfff);
    uVar3 = sVar2 - 1;
    uVar1 = uVar1 + DAT_data_0047;
    sVar2 = sVar2 + -2;
  } while ((uVar3 & 0x1ff) != 0);
  return;
}


// ===== FUN_prog_0c4c @ prog:0c4c =====

void FUN_prog_0c4c(void)

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
  DAT_data_004c =
       (short)((uint)(iVar1 * DAT_data_001f + iVar2 * DAT_data_001e + iVar3 * DAT_data_001d +
                      iVar4 * DAT_data_001c + iVar5 * DAT_data_001b + iVar6 * DAT_data_001a +
                      iVar7 * DAT_data_0019 + iVar8 * DAT_data_0018 + iVar9 * DAT_data_0017 +
                      iVar10 * DAT_data_0016 + iVar11 * DAT_data_0015 + iVar12 * DAT_data_0014 +
                      iVar13 * DAT_data_0013 + iVar14 * DAT_data_0012 + iVar15 * DAT_data_0011 +
                      iVar16 * DAT_data_0010 + iVar17 * DAT_data_000f + iVar18 * DAT_data_000e +
                      iVar19 * DAT_data_000d + iVar20 * DAT_data_000c + iVar21 * DAT_data_000b +
                      iVar22 * DAT_data_000a + iVar23 * DAT_data_0009 + iVar24 * DAT_data_0008 +
                      iVar25 * DAT_data_0007 + iVar26 * DAT_data_0006 + iVar27 * DAT_data_0005 +
                      iVar28 * DAT_data_0004 + iVar29 * sData0003 + iVar30 * sData0002 +
                      iVar31 * sData0001 + (int)DAT_data_0020 * (int)sData0000) >> 0x10);
  return;
}


