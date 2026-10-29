// 7311_VOCODER_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7311_VOCODER_dsp2 (ucode_7311_ROM4_3D3D2.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  char cVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar12;
  ushort uVar13;
  uint uVar10;
  int iVar11;
  ushort uVar14;
  
  uVar14 = 0x8f;
  do {
    *(undefined2 *)(uVar14 & 0xff) = 0;
    uVar13 = uVar14 & 0x1ff;
    uVar14 = uVar14 - 1;
  } while (uVar13 != 0);
  DAT_data_0001 = 1;
  DAT_data_0005 = 0x200;
  DAT_data_0003 = 0x7fff;
  DAT_data_0023 = DAT_prog_09c3;
  DAT_data_0024 = DAT_prog_09c4;
  DAT_data_0027 = DAT_prog_09c7;
  DAT_data_0028 = DAT_prog_09c8;
  DAT_data_0029 = DAT_prog_09c9;
  DAT_data_0031 = 0x9cc;
  DAT_data_0033 = 0x3ff;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar12 = PA0;
  do {
    cVar5 = bio_pin();
    DAT_data_0007 = DAT_data_0003;
  } while (cVar5 == '\0');
  do {
    wVar12 = PA5;
    if ((wVar12 & DAT_data_0005) != 0) {
      wVar6 = PA6;
      *(word *)(wVar12 & 0xff) = wVar6;
    }
    PA7 = DAT_data_0007 + DAT_data_0001;
    wVar12 = DAT_data_0007 + DAT_data_0001 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    wVar12 = wVar12 + DAT_data_0001;
    PA7 = wVar12;
    DAT_data_0007 = wVar12 + DAT_data_0001;
    PA7 = DAT_data_0007;
  } while ((short)DAT_data_0007 < 0);
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar12 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    sVar1 = (short)((uint)((int)(short)DAT_data_0010 * 0x8000 +
                           (int)DAT_data_0016 * (int)DAT_data_0024 * 2 +
                          (int)DAT_data_0015 * (int)DAT_data_0023 * 2) >> 0x10);
    PA1 = DAT_data_000d;
    wVar9 = PA7;
    wVar12 = PA1;
    wVar6 = PA1;
    wVar7 = PA1;
    wVar8 = PA1;
    PA7 = DAT_data_0013;
    PA4 = DAT_data_000c;
    PA1 = DAT_data_0013;
    PA5 = DAT_data_0036;
    PA6 = DAT_data_0037;
    uVar13 = DAT_data_0032 + DAT_data_0001 & DAT_data_0033;
    *(short *)(uVar13 + DAT_data_0031 & 0xfff) = DAT_data_0012;
    uVar14 = *(ushort *)((uVar13 - wVar7 & DAT_data_0033) + DAT_data_0031 & 0xfff);
    uVar10 = (int)DAT_data_0012 * (int)(short)wVar8 -
             (int)*(short *)((uVar13 + wVar7 * -2 & DAT_data_0033) + DAT_data_0031 & 0xfff) *
             (int)(short)wVar8;
    sVar2 = (short)((uint)((int)(short)wVar9 * 0x8000 + (int)DAT_data_001b * (int)DAT_data_0024 * 2
                          + (int)DAT_data_001a * (int)DAT_data_0023 * 2) >> 0x10);
    sVar3 = (short)((uint)((int)(short)wVar12 * 0x8000 + (int)DAT_data_0020 * (int)DAT_data_0024 * 2
                          + (int)DAT_data_001f * (int)DAT_data_0023 * 2) >> 0x10);
    wVar9 = PA7;
    sVar4 = (short)((uint)((int)DAT_data_001f * (int)DAT_data_0029 * 2 +
                           (int)DAT_data_001f * (int)DAT_data_0028 * 2 +
                          (int)sVar3 * (int)DAT_data_0027 * 2) >> 0x10);
    if ((uint)DAT_data_002f == 0) {
      DAT_data_000c =
           (word)((uint)((((int)(short)DAT_data_0030 * (int)DAT_data_002e -
                          (int)(short)DAT_data_0030 * (int)DAT_data_002d) +
                         (int)DAT_data_002d * 0x8000) * 2) >> 0x10);
      iVar11 = (uint)DAT_data_0030 + (int)(short)wVar6 * 2;
      DAT_data_002f = (ushort)((uint)(iVar11 * 2) >> 0x10);
      DAT_data_0030 = (ushort)iVar11 & DAT_data_0003;
      DAT_data_0013 = DAT_data_0013 + DAT_data_0001;
    }
    else {
      DAT_data_002f =
           (ushort)((uint)DAT_data_002f * 0x10000 + (uint)DAT_data_0001 * -0x10000 >> 0x10);
    }
    wVar6 = PA7;
    PA5 = (word)(uVar10 + (uint)uVar14 * 0x10000 >> 0x10);
    PA6 = (word)((uint)uVar14 * 0x10000 + (uVar10 >> 0x10) * -0x10000 >> 0x10);
    uVar13 = uVar13 + DAT_data_0001 & DAT_data_0033;
    *(short *)(uVar13 + DAT_data_0031 & 0xfff) = sVar4;
    uVar14 = *(ushort *)((uVar13 - wVar7 & DAT_data_0033) + DAT_data_0031 & 0xfff);
    uVar10 = (int)sVar4 * (int)(short)wVar8 -
             (int)*(short *)((uVar13 + wVar7 * -2 & DAT_data_0033) + DAT_data_0031 & 0xfff) *
             (int)(short)wVar8;
    DAT_data_0016 =
         (short)((uint)((int)(short)wVar9 * 0x8000 + (int)DAT_data_0015 * (int)DAT_data_0024 * 2 +
                       (int)sVar1 * (int)DAT_data_0023 * 2) >> 0x10);
    DAT_data_000d =
         (word)((uint)((int)DAT_data_0015 * (int)DAT_data_0029 * 2 +
                       (int)sVar1 * (int)DAT_data_0028 * 2 +
                      (int)DAT_data_0016 * (int)DAT_data_0027 * 2) >> 0x10);
    DAT_data_001b =
         (short)((uint)((int)(short)wVar6 * 0x8000 + (int)DAT_data_001a * (int)DAT_data_0024 * 2 +
                       (int)sVar2 * (int)DAT_data_0023 * 2) >> 0x10);
    DAT_data_0020 =
         (short)((uint)((int)(short)wVar12 * 0x8000 + (int)DAT_data_001f * (int)DAT_data_0024 * 2 +
                       (int)sVar3 * (int)DAT_data_0023 * 2) >> 0x10);
    wVar6 = PA7;
    sVar4 = (short)((uint)((int)sVar3 * (int)DAT_data_0029 * 2 + (int)sVar3 * (int)DAT_data_0028 * 2
                          + (int)DAT_data_0020 * (int)DAT_data_0027 * 2) >> 0x10);
    DAT_data_002e = DAT_data_002d;
    DAT_data_0015 =
         (short)((uint)((int)(short)wVar6 * 0x8000 + (int)sVar1 * (int)DAT_data_0024 * 2 +
                       (int)DAT_data_0016 * (int)DAT_data_0023 * 2) >> 0x10);
    wVar6 = PA7;
    PA5 = (word)(uVar10 + (uint)uVar14 * 0x10000 >> 0x10);
    PA6 = (word)((uint)uVar14 * 0x10000 + (uVar10 >> 0x10) * -0x10000 >> 0x10);
    DAT_data_0032 = uVar13 + DAT_data_0001 & DAT_data_0033;
    *(short *)(DAT_data_0032 + DAT_data_0031 & 0xfff) = sVar4;
    uVar14 = *(ushort *)((DAT_data_0032 - wVar7 & DAT_data_0033) + DAT_data_0031 & 0xfff);
    uVar10 = (int)sVar4 * (int)(short)wVar8 -
             (int)*(short *)((DAT_data_0032 + wVar7 * -2 & DAT_data_0033) + DAT_data_0031 & 0xfff) *
             (int)(short)wVar8;
    DAT_data_0036 = (word)(uVar10 + (uint)uVar14 * 0x10000 >> 0x10);
    DAT_data_0037 = (word)((uint)uVar14 * 0x10000 + (uVar10 >> 0x10) * -0x10000 >> 0x10);
    DAT_data_001a =
         (short)((uint)((int)(short)wVar6 * 0x8000 + (int)sVar2 * (int)DAT_data_0024 * 2 +
                       (int)DAT_data_001b * (int)DAT_data_0023 * 2) >> 0x10);
    uVar14 = (ushort)((uint)((int)DAT_data_001b * (int)DAT_data_0029 * 2 +
                             (int)DAT_data_001b * (int)DAT_data_0028 * 2 +
                            (int)DAT_data_001a * (int)DAT_data_0027 * 2) >> 0x10);
    DAT_data_001f =
         (short)((uint)((int)(short)wVar12 * 0x8000 + (int)sVar3 * (int)DAT_data_0024 * 2 +
                       (int)DAT_data_0020 * (int)DAT_data_0023 * 2) >> 0x10);
    DAT_data_0012 =
         (short)((uint)((int)DAT_data_0020 * (int)DAT_data_0029 * 2 +
                        (int)DAT_data_0020 * (int)DAT_data_0028 * 2 +
                       (int)DAT_data_001f * (int)DAT_data_0027 * 2) >> 0x10);
    DAT_data_0010 = PA7;
    DAT_data_002d = (short)((uint)DAT_data_000f * 0x10000 + (uint)uVar14 * -0x10000 >> 0x10);
    DAT_data_000f = uVar14;
  } while( true );
}


