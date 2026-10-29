// 7411_MULTI_SHIFT_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7411_MULTI_SHIFT_dsp2 (ucode_7411_ROM4_07280.bin)
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
  DAT_data_000a = 0x200;
  DAT_data_0009 = -0x8000;
  DAT_data_0008 = 0x7fff;
  DAT_data_0053 = 100;
  DAT_data_000f = (ushort)in_OV << 0xf | 0x7ffe;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar11 = PA0;
  do {
    cVar3 = bio_pin();
    DAT_data_000c = DAT_data_0008;
  } while (cVar3 == '\0');
  do {
    wVar11 = PA5;
    if ((wVar11 & DAT_data_000a) != 0) {
      wVar4 = PA6;
      *(word *)(wVar11 & 0xff) = wVar4;
    }
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
    PA7 = DAT_data_000c;
  } while ((short)DAT_data_000c < 0);
  DAT_data_0011 = DAT_data_0049;
  DAT_data_001c = DAT_data_0055;
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
      wVar11 = PA2;
      wVar4 = PA2;
      PA2 = DAT_data_0003;
      wVar8 = PA7;
      PA6 = DAT_data_0021;
      PA2 = DAT_data_001c;
      wVar5 = PA4;
      uVar9 = (int)(short)wVar4 * (int)DAT_data_0063 +
              (int)(short)DAT_data_0003 * (int)DAT_data_0065 +
              (int)(short)wVar5 * (int)DAT_data_0067 +
              (int)(short)DAT_data_0004 * (int)DAT_data_0069;
      DAT_data_0021 = (word)(uVar9 + (uVar9 & 0xffff0000) >> 0x10);
      PA7 = DAT_data_0012;
      PA4 = DAT_data_0022;
      PA7 = DAT_data_0026;
      DAT_data_0004 = PA4;
      PA7 = DAT_data_0014;
      wVar4 = PA4;
      wVar5 = PA4;
      PA7 = DAT_data_0013;
      wVar6 = PA4;
      wVar7 = PA4;
      DAT_data_0022 =
           (word)((uint)wVar8 * 0x10000 +
                  (int)*(short *)(DAT_data_005b & 0xff) * (int)DAT_data_005f * 2 +
                  (int)*(short *)(DAT_data_005d & 0xff) * (int)DAT_data_0061 * 2 >> 0x10);
      iVar10 = ((int)(short)wVar7 * 0x8000 - (int)(short)DAT_data_001b * (int)(short)wVar7) +
               (int)(short)DAT_data_001b * (int)(short)wVar6;
      DAT_data_0003 =
           (word)((uint)(((iVar10 - (int)(short)DAT_data_0023 *
                                    (int)(short)((uint)(iVar10 * 2) >> 0x10)) +
                         (int)(short)DAT_data_0023 *
                         (int)(short)((uint)((((int)(short)wVar5 * 0x8000 -
                                              (int)(short)DAT_data_001b * (int)(short)wVar5) +
                                             (int)(short)DAT_data_001b * (int)(short)wVar4) * 2) >>
                                     0x10)) * 2) >> 0x10);
      DAT_data_0012 = wVar11 + DAT_data_0009;
      DAT_data_0026 = DAT_data_0012 - DAT_data_0059;
      iVar10 = (uint)DAT_data_001b + (int)DAT_data_0051 * 0x10 + (int)(short)DAT_data_001c * 0x8000;
      DAT_data_001c = (ushort)((uint)(iVar10 * 2) >> 0x10);
      DAT_data_001b = (ushort)iVar10 & DAT_data_0008;
      DAT_data_0014 = DAT_data_0012 - DAT_data_001c;
      DAT_data_0013 = DAT_data_0014 - DAT_data_0011;
      uVar9 = (uint)DAT_data_0023;
      DAT_data_0023 = (ushort)(uVar9 * 0x10000 + (uint)DAT_data_0057 * 0x10000 >> 0x10);
    } while (-1 < (short)DAT_data_000f && !SCARRY4(uVar9 * 0x10000,(uint)DAT_data_0057 * 0x10000));
    while( true ) {
      wVar11 = PA5;
      wVar4 = PA6;
      *(word *)(wVar11 & 0xff) = wVar4;
      wVar11 = PA2;
      wVar4 = PA2;
      PA2 = DAT_data_0003;
      wVar7 = PA7;
      PA6 = DAT_data_0021;
      PA2 = DAT_data_001c;
      wVar5 = PA4;
      uVar9 = (int)(short)wVar4 * (int)DAT_data_0063 +
              (int)(short)DAT_data_0003 * (int)DAT_data_0065 +
              (int)(short)wVar5 * (int)DAT_data_0067 +
              (int)(short)DAT_data_0004 * (int)DAT_data_0069;
      DAT_data_0021 = (word)(uVar9 + (uVar9 & 0xffff0000) >> 0x10);
      PA7 = DAT_data_0012;
      PA4 = DAT_data_0022;
      PA7 = DAT_data_0026;
      DAT_data_0004 = PA4;
      PA7 = DAT_data_0014;
      wVar5 = PA4;
      wVar6 = PA4;
      wVar4 = PA3;
      DAT_data_0022 =
           (word)((uint)wVar7 * 0x10000 +
                  (int)*(short *)(DAT_data_005b & 0xff) * (int)DAT_data_005f * 2 +
                  (int)*(short *)(DAT_data_005d & 0xff) * (int)DAT_data_0061 * 2 >> 0x10);
      DAT_data_0003 =
           (word)((uint)((((int)(short)DAT_data_001b * (int)(short)wVar5 -
                          (int)(short)DAT_data_001b * (int)(short)wVar6) +
                         (int)(short)wVar6 * 0x8000) * 2) >> 0x10);
      iVar10 = (uint)DAT_data_001b + (int)DAT_data_0051 * 0x10 + (int)(short)DAT_data_001c * 0x8000;
      DAT_data_001c = (ushort)((uint)(iVar10 * 2) >> 0x10);
      DAT_data_001b = (ushort)iVar10 & DAT_data_0008;
      DAT_data_0012 = wVar11 + DAT_data_0009;
      DAT_data_0026 = DAT_data_0012 - DAT_data_0059;
      if ((int)((uint)DAT_data_001c - (uint)DAT_data_0053) < 1) break;
      if (-1 < (int)((uint)DAT_data_001c - (uint)DAT_data_0055)) {
        iVar10 = (uint)wVar4 * 0x10000;
        if (iVar10 < 0) {
          iVar10 = (uint)wVar4 * -0x10000;
        }
        DAT_data_0011 = (short)((uint)iVar10 >> 0x10);
        sVar1 = -DAT_data_0011;
        goto LAB_prog_095b;
      }
      DAT_data_0014 = DAT_data_0012 - DAT_data_001c;
    }
    iVar10 = (uint)wVar4 * 0x10000;
    if (iVar10 < 0) {
      iVar10 = (uint)wVar4 * -0x10000;
    }
    sVar1 = (short)((uint)iVar10 >> 0x10);
    DAT_data_0011 = -sVar1;
LAB_prog_095b:
    DAT_data_001c = DAT_data_001c + sVar1;
    DAT_data_0023 = 0;
    DAT_data_0014 = DAT_data_0012 - DAT_data_001c;
    DAT_data_0013 = DAT_data_0014 - DAT_data_0011;
  } while( true );
}


