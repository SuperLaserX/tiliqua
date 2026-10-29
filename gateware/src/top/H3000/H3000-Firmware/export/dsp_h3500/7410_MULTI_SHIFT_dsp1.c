// 7410_MULTI_SHIFT_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7410_MULTI_SHIFT_dsp1 (ucode_7410_ROM4_06FAC.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  word wVar11;
  uint uVar9;
  int iVar10;
  ushort uVar12;
  byte in_OV;
  
  uVar12 = 0x8f;
  do {
    *(undefined2 *)(uVar12 & 0xff) = 0;
    uVar2 = uVar12 & 0x1ff;
    uVar12 = uVar12 - 1;
  } while (uVar2 != 0);
  DAT_data_0006 = 1;
  DAT_data_000a = 0x100;
  DAT_data_0008 = 0x7fff;
  DAT_data_0052 = 100;
  DAT_data_000f = (ushort)in_OV << 0xf | 0x7ffe;
  DAT_data_000c = 0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar11 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar11 = PA5;
    if ((wVar11 & DAT_data_000a) != 0) {
      wVar4 = PA6;
      *(word *)(wVar11 & 0xff) = wVar4;
    }
    PA7 = DAT_data_000c;
    PA7 = DAT_data_000c + DAT_data_0006;
    wVar11 = DAT_data_000c + DAT_data_0006 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    wVar11 = wVar11 + DAT_data_0006;
    PA7 = wVar11;
    DAT_data_000c = wVar11 + DAT_data_0006;
  } while (-1 < (short)DAT_data_000c);
  DAT_data_0011 = DAT_data_0048;
  DAT_data_001c = DAT_data_0054;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar11 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    do {
      wVar11 = PA5;
      wVar4 = PA6;
      *(word *)(wVar11 & 0xff) = wVar4;
      PA2 = DAT_data_001d;
      PA2 = DAT_data_0001;
      wVar11 = PA2;
      PA7 = DAT_data_001d;
      PA4 = DAT_data_0022;
      PA7 = DAT_data_0026;
      wVar4 = PA4;
      PA7 = DAT_data_0014;
      wVar5 = PA4;
      wVar6 = PA4;
      PA7 = DAT_data_0013;
      wVar7 = PA4;
      wVar8 = PA4;
      PA5 = DAT_data_0020;
      PA2 = DAT_data_001c;
      DAT_data_0004 = PA4;
      uVar9 = (int)(short)DAT_data_0001 * (int)DAT_data_0062 +
              (int)(short)wVar11 * (int)DAT_data_0064 + (int)(short)wVar4 * (int)DAT_data_0066 +
              (int)(short)DAT_data_0004 * (int)DAT_data_0068;
      DAT_data_0020 = (word)(uVar9 + (uVar9 & 0xffff0000) >> 0x10);
      DAT_data_0022 =
           (word)((uint)DAT_data_001e * 0x10000 +
                  (int)*(short *)(DAT_data_005a & 0xff) * (int)DAT_data_005e * 2 +
                  (int)*(short *)(DAT_data_005c & 0xff) * (int)DAT_data_0060 * 2 >> 0x10);
      iVar10 = ((int)(short)wVar8 * 0x8000 - (int)(short)DAT_data_001b * (int)(short)wVar8) +
               (int)(short)DAT_data_001b * (int)(short)wVar7;
      DAT_data_0001 =
           (word)((uint)(((iVar10 - (int)(short)DAT_data_0023 *
                                    (int)(short)((uint)(iVar10 * 2) >> 0x10)) +
                         (int)(short)DAT_data_0023 *
                         (int)(short)((uint)((((int)(short)wVar6 * 0x8000 -
                                              (int)(short)DAT_data_001b * (int)(short)wVar6) +
                                             (int)(short)DAT_data_001b * (int)(short)wVar5) * 2) >>
                                     0x10)) * 2) >> 0x10);
      iVar10 = (uint)DAT_data_001b + (int)DAT_data_0050 * 0x10 + (int)(short)DAT_data_001c * 0x8000;
      DAT_data_001c = (ushort)((uint)(iVar10 * 2) >> 0x10);
      DAT_data_001b = (ushort)iVar10 & DAT_data_0008;
      DAT_data_001d = DAT_data_001d + DAT_data_0006;
      DAT_data_0014 = DAT_data_001d - DAT_data_001c;
      DAT_data_0013 = DAT_data_0014 - DAT_data_0011;
      DAT_data_0026 = DAT_data_001d - DAT_data_0058;
      DAT_data_001e = PA7;
      uVar9 = (uint)DAT_data_0023;
      DAT_data_0023 = (ushort)(uVar9 * 0x10000 + (uint)DAT_data_0056 * 0x10000 >> 0x10);
    } while (-1 < (short)DAT_data_000f && !SCARRY4(uVar9 * 0x10000,(uint)DAT_data_0056 * 0x10000));
    while( true ) {
      wVar11 = PA5;
      wVar4 = PA6;
      *(word *)(wVar11 & 0xff) = wVar4;
      PA2 = DAT_data_001d;
      PA2 = DAT_data_0001;
      wVar4 = PA2;
      PA7 = DAT_data_001d;
      PA4 = DAT_data_0022;
      PA7 = DAT_data_0026;
      wVar5 = PA4;
      PA7 = DAT_data_0014;
      wVar6 = PA4;
      wVar7 = PA4;
      wVar11 = PA1;
      PA5 = DAT_data_0020;
      PA2 = DAT_data_001c;
      uVar9 = (int)(short)DAT_data_0001 * (int)DAT_data_0062 +
              (int)(short)wVar4 * (int)DAT_data_0064 + (int)(short)wVar5 * (int)DAT_data_0066 +
              (int)(short)DAT_data_0004 * (int)DAT_data_0068;
      DAT_data_0004 = PA4;
      DAT_data_0020 = (word)(uVar9 + (uVar9 & 0xffff0000) >> 0x10);
      DAT_data_0022 =
           (word)((uint)DAT_data_001e * 0x10000 +
                  (int)*(short *)(DAT_data_005a & 0xff) * (int)DAT_data_005e * 2 +
                  (int)*(short *)(DAT_data_005c & 0xff) * (int)DAT_data_0060 * 2 >> 0x10);
      DAT_data_0001 =
           (word)((uint)((((int)(short)DAT_data_001b * (int)(short)wVar6 -
                          (int)(short)DAT_data_001b * (int)(short)wVar7) +
                         (int)(short)wVar7 * 0x8000) * 2) >> 0x10);
      iVar10 = (uint)DAT_data_001b + (int)DAT_data_0050 * 0x10 + (int)(short)DAT_data_001c * 0x8000;
      DAT_data_001c = (ushort)((uint)(iVar10 * 2) >> 0x10);
      DAT_data_001b = (ushort)iVar10 & DAT_data_0008;
      DAT_data_001d = DAT_data_001d + DAT_data_0006;
      DAT_data_0026 = DAT_data_001d - DAT_data_0058;
      if ((int)((uint)DAT_data_001c - (uint)DAT_data_0052) < 1) break;
      if (-1 < (int)((uint)DAT_data_001c - (uint)DAT_data_0054)) {
        iVar10 = (uint)wVar11 * 0x10000;
        if (iVar10 < 0) {
          iVar10 = (uint)wVar11 * -0x10000;
        }
        DAT_data_0011 = (short)((uint)iVar10 >> 0x10);
        sVar1 = -DAT_data_0011;
        goto code_p0x095d;
      }
      DAT_data_001e = PA7;
      DAT_data_0014 = DAT_data_001d - DAT_data_001c;
    }
    iVar10 = (uint)wVar11 * 0x10000;
    if (iVar10 < 0) {
      iVar10 = (uint)wVar11 * -0x10000;
    }
    sVar1 = (short)((uint)iVar10 >> 0x10);
    DAT_data_0011 = -sVar1;
code_p0x095d:
    DAT_data_001c = DAT_data_001c + sVar1;
    DAT_data_0023 = 0;
    DAT_data_001e = PA7;
    DAT_data_0014 = DAT_data_001d - DAT_data_001c;
    DAT_data_0013 = DAT_data_0014 - DAT_data_0011;
  } while( true );
}


