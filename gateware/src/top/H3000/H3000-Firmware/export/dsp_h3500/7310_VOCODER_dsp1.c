// 7310_VOCODER_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7310_VOCODER_dsp1 (ucode_7310_ROM4_3CDA8.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  short sVar4;
  word wVar8;
  int iVar5;
  int iVar6;
  uint uVar7;
  ushort uVar9;
  
  uVar9 = 0x8f;
  do {
    *(undefined2 *)(uVar9 & 0xff) = 0;
    uVar1 = uVar9 & 0x1ff;
    uVar9 = uVar9 - 1;
  } while (uVar1 != 0);
  DAT_data_006d = 1;
  DAT_data_0071 = 0x100;
  DAT_data_0073 = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar8 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0071) != 0) {
      wVar3 = PA6;
      *(word *)(wVar8 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0073;
    PA7 = DAT_data_0073 + DAT_data_006d;
    wVar8 = DAT_data_0073 + DAT_data_006d + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    wVar8 = wVar8 + DAT_data_006d;
    PA7 = wVar8;
    DAT_data_0073 = wVar8 + DAT_data_006d;
  } while (-1 < (short)DAT_data_0073);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar8 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0071) != 0) {
      wVar3 = PA6;
      *(word *)(wVar8 & 0xff) = wVar3;
    }
    wVar8 = PA2;
    wVar3 = PA3;
    *(word *)(wVar8 & 0xff) = wVar3;
    wVar8 = PA1;
    PA1 = DAT_data_007f;
    PA1 = DAT_data_0044;
    PA1 = DAT_data_0045;
    PA1 = DAT_data_0046;
    iVar5 = (int)(short)wVar8 * (int)DAT_data_0016 + (int)DAT_data_003e * (int)DAT_data_0029 * -2 +
            (int)(short)DAT_data_003d * (int)DAT_data_0028 * -2 +
            (int)(short)DAT_data_003c * (int)DAT_data_0027 * -2;
    iVar6 = iVar5 + (int)(short)DAT_data_003b * (int)DAT_data_0026 * -2;
    DAT_data_0067 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_003a * (int)DAT_data_0025 * -2;
    DAT_data_0066 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0039 * (int)DAT_data_0024 * -2;
    DAT_data_0065 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0038 * (int)DAT_data_0023 * -2;
    DAT_data_0064 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0037 * (int)DAT_data_0022 * -2;
    DAT_data_0063 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0036 * (int)DAT_data_0021 * -2;
    DAT_data_0062 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0035 * (int)DAT_data_0020 * -2;
    DAT_data_0061 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0034 * (int)DAT_data_001f * -2;
    DAT_data_0060 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0033 * (int)DAT_data_001e * -2;
    DAT_data_005f = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0032 * (int)DAT_data_001d * -2;
    DAT_data_005e = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0031 * (int)DAT_data_001c * -2;
    DAT_data_005d = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0030 * (int)DAT_data_001b * -2;
    DAT_data_005c = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_002f * (int)DAT_data_001a * -2;
    DAT_data_005b = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_002e * (int)DAT_data_0019 * -2;
    DAT_data_005a = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_002d * (int)DAT_data_0018 * -2;
    DAT_data_0059 = (short)((uint)iVar6 >> 0x10);
    DAT_data_0058 =
         (ushort)((uint)(iVar6 + (int)(short)DAT_data_002c * (int)DAT_data_0017 * -2) >> 0x10);
    DAT_data_007f =
         (word)((uint)((int)(short)DAT_data_0058 * 0x8000 + (int)(short)DAT_data_002c * 0x8000) >>
               0x10);
    DAT_data_003e =
         (short)((uint)DAT_data_003d * 0x10000 + (int)DAT_data_0066 * (int)DAT_data_0028 * 2 >> 0x10
                );
    iVar6 = (int)DAT_data_0027;
    wVar8 = PA2;
    wVar3 = PA3;
    *(word *)(wVar8 & 0xff) = wVar3;
    sVar4 = sData0001;
    DAT_data_003d =
         (ushort)((uint)DAT_data_003c * 0x10000 + (short)((uint)iVar5 >> 0x10) * iVar6 * 2 >> 0x10);
    DAT_data_003c =
         (ushort)((uint)DAT_data_003b * 0x10000 + (int)DAT_data_0067 * (int)DAT_data_0026 * 2 >>
                 0x10);
    DAT_data_003b =
         (ushort)((uint)DAT_data_003a * 0x10000 + (int)DAT_data_0066 * (int)DAT_data_0025 * 2 >>
                 0x10);
    DAT_data_003a =
         (ushort)((uint)DAT_data_0039 * 0x10000 + (int)DAT_data_0065 * (int)DAT_data_0024 * 2 >>
                 0x10);
    DAT_data_0039 =
         (ushort)((uint)DAT_data_0038 * 0x10000 + (int)DAT_data_0064 * (int)DAT_data_0023 * 2 >>
                 0x10);
    DAT_data_0038 =
         (ushort)((uint)DAT_data_0037 * 0x10000 + (int)DAT_data_0063 * (int)DAT_data_0022 * 2 >>
                 0x10);
    DAT_data_0037 =
         (ushort)((uint)DAT_data_0036 * 0x10000 + (int)DAT_data_0062 * (int)DAT_data_0021 * 2 >>
                 0x10);
    DAT_data_0036 =
         (ushort)((uint)DAT_data_0035 * 0x10000 + (int)DAT_data_0061 * (int)DAT_data_0020 * 2 >>
                 0x10);
    DAT_data_0035 =
         (ushort)((uint)DAT_data_0034 * 0x10000 + (int)DAT_data_0060 * (int)DAT_data_001f * 2 >>
                 0x10);
    DAT_data_0034 =
         (ushort)((uint)DAT_data_0033 * 0x10000 + (int)DAT_data_005f * (int)DAT_data_001e * 2 >>
                 0x10);
    DAT_data_0033 =
         (ushort)((uint)DAT_data_0032 * 0x10000 + (int)DAT_data_005e * (int)DAT_data_001d * 2 >>
                 0x10);
    DAT_data_0032 =
         (ushort)((uint)DAT_data_0031 * 0x10000 + (int)DAT_data_005d * (int)DAT_data_001c * 2 >>
                 0x10);
    DAT_data_0031 =
         (ushort)((uint)DAT_data_0030 * 0x10000 + (int)DAT_data_005c * (int)DAT_data_001b * 2 >>
                 0x10);
    DAT_data_0030 =
         (ushort)((uint)DAT_data_002f * 0x10000 + (int)DAT_data_005b * (int)DAT_data_001a * 2 >>
                 0x10);
    DAT_data_002f =
         (ushort)((uint)DAT_data_002e * 0x10000 + (int)DAT_data_005a * (int)DAT_data_0019 * 2 >>
                 0x10);
    DAT_data_002e =
         (ushort)((uint)DAT_data_002d * 0x10000 + (int)DAT_data_0059 * (int)DAT_data_0018 * 2 >>
                 0x10);
    DAT_data_002d =
         (ushort)((uint)DAT_data_002c * 0x10000 + (int)(short)DAT_data_0058 * (int)DAT_data_0017 * 2
                 >> 0x10);
    DAT_data_002c = DAT_data_0058;
    uVar7 = (int)sData0000 * (int)DAT_data_0042 + (int)DAT_data_0016 * (int)DAT_data_0043;
    DAT_data_0016 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    wVar8 = PA2;
    wVar3 = PA3;
    *(word *)(wVar8 & 0xff) = wVar3;
    uVar7 = (int)sVar4 * (int)DAT_data_0040 + (int)DAT_data_0017 * (int)DAT_data_0041;
    DAT_data_0017 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)sData0002 * (int)DAT_data_0040 + (int)DAT_data_0018 * (int)DAT_data_0041;
    DAT_data_0018 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)sData0003 * (int)DAT_data_0040 + (int)DAT_data_0019 * (int)DAT_data_0041;
    DAT_data_0019 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0004 * (int)DAT_data_0040 + (int)DAT_data_001a * (int)DAT_data_0041;
    DAT_data_001a = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0005 * (int)DAT_data_0040 + (int)DAT_data_001b * (int)DAT_data_0041;
    DAT_data_001b = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0006 * (int)DAT_data_0040 + (int)DAT_data_001c * (int)DAT_data_0041;
    DAT_data_001c = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0007 * (int)DAT_data_0040 + (int)DAT_data_001d * (int)DAT_data_0041;
    DAT_data_001d = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0008 * (int)DAT_data_0040 + (int)DAT_data_001e * (int)DAT_data_0041;
    DAT_data_001e = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0009 * (int)DAT_data_0040 + (int)DAT_data_001f * (int)DAT_data_0041;
    DAT_data_001f = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0071) != 0) {
      wVar3 = PA6;
      *(word *)(wVar8 & 0xff) = wVar3;
    }
    wVar8 = PA2;
    wVar3 = PA3;
    *(word *)(wVar8 & 0xff) = wVar3;
    wVar8 = PA1;
    PA1 = DAT_data_007f;
    PA1 = DAT_data_0044;
    PA1 = DAT_data_0045;
    PA1 = DAT_data_0046;
    iVar5 = (int)(short)wVar8 * (int)DAT_data_0016 + (int)DAT_data_003e * (int)DAT_data_0029 * -2 +
            (int)(short)DAT_data_003d * (int)DAT_data_0028 * -2 +
            (int)(short)DAT_data_003c * (int)DAT_data_0027 * -2;
    iVar6 = iVar5 + (int)(short)DAT_data_003b * (int)DAT_data_0026 * -2;
    DAT_data_0067 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_003a * (int)DAT_data_0025 * -2;
    DAT_data_0066 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0039 * (int)DAT_data_0024 * -2;
    DAT_data_0065 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0038 * (int)DAT_data_0023 * -2;
    DAT_data_0064 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0037 * (int)DAT_data_0022 * -2;
    DAT_data_0063 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0036 * (int)DAT_data_0021 * -2;
    DAT_data_0062 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0035 * (int)DAT_data_0020 * -2;
    DAT_data_0061 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0034 * (int)DAT_data_001f * -2;
    DAT_data_0060 = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0033 * (int)DAT_data_001e * -2;
    DAT_data_005f = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0032 * (int)DAT_data_001d * -2;
    DAT_data_005e = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0031 * (int)DAT_data_001c * -2;
    DAT_data_005d = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_0030 * (int)DAT_data_001b * -2;
    DAT_data_005c = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_002f * (int)DAT_data_001a * -2;
    DAT_data_005b = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_002e * (int)DAT_data_0019 * -2;
    DAT_data_005a = (short)((uint)iVar6 >> 0x10);
    iVar6 = iVar6 + (int)(short)DAT_data_002d * (int)DAT_data_0018 * -2;
    DAT_data_0059 = (short)((uint)iVar6 >> 0x10);
    DAT_data_0058 =
         (ushort)((uint)(iVar6 + (int)(short)DAT_data_002c * (int)DAT_data_0017 * -2) >> 0x10);
    DAT_data_007f =
         (word)((uint)((int)(short)DAT_data_0058 * 0x8000 + (int)(short)DAT_data_002c * 0x8000) >>
               0x10);
    DAT_data_003e =
         (short)((uint)DAT_data_003d * 0x10000 + (int)DAT_data_0066 * (int)DAT_data_0028 * 2 >> 0x10
                );
    iVar6 = (int)DAT_data_0027;
    wVar8 = PA2;
    wVar3 = PA3;
    *(word *)(wVar8 & 0xff) = wVar3;
    sVar4 = DAT_data_000b;
    DAT_data_003d =
         (ushort)((uint)DAT_data_003c * 0x10000 + (short)((uint)iVar5 >> 0x10) * iVar6 * 2 >> 0x10);
    DAT_data_003c =
         (ushort)((uint)DAT_data_003b * 0x10000 + (int)DAT_data_0067 * (int)DAT_data_0026 * 2 >>
                 0x10);
    DAT_data_003b =
         (ushort)((uint)DAT_data_003a * 0x10000 + (int)DAT_data_0066 * (int)DAT_data_0025 * 2 >>
                 0x10);
    DAT_data_003a =
         (ushort)((uint)DAT_data_0039 * 0x10000 + (int)DAT_data_0065 * (int)DAT_data_0024 * 2 >>
                 0x10);
    DAT_data_0039 =
         (ushort)((uint)DAT_data_0038 * 0x10000 + (int)DAT_data_0064 * (int)DAT_data_0023 * 2 >>
                 0x10);
    DAT_data_0038 =
         (ushort)((uint)DAT_data_0037 * 0x10000 + (int)DAT_data_0063 * (int)DAT_data_0022 * 2 >>
                 0x10);
    DAT_data_0037 =
         (ushort)((uint)DAT_data_0036 * 0x10000 + (int)DAT_data_0062 * (int)DAT_data_0021 * 2 >>
                 0x10);
    DAT_data_0036 =
         (ushort)((uint)DAT_data_0035 * 0x10000 + (int)DAT_data_0061 * (int)DAT_data_0020 * 2 >>
                 0x10);
    DAT_data_0035 =
         (ushort)((uint)DAT_data_0034 * 0x10000 + (int)DAT_data_0060 * (int)DAT_data_001f * 2 >>
                 0x10);
    DAT_data_0034 =
         (ushort)((uint)DAT_data_0033 * 0x10000 + (int)DAT_data_005f * (int)DAT_data_001e * 2 >>
                 0x10);
    DAT_data_0033 =
         (ushort)((uint)DAT_data_0032 * 0x10000 + (int)DAT_data_005e * (int)DAT_data_001d * 2 >>
                 0x10);
    DAT_data_0032 =
         (ushort)((uint)DAT_data_0031 * 0x10000 + (int)DAT_data_005d * (int)DAT_data_001c * 2 >>
                 0x10);
    DAT_data_0031 =
         (ushort)((uint)DAT_data_0030 * 0x10000 + (int)DAT_data_005c * (int)DAT_data_001b * 2 >>
                 0x10);
    DAT_data_0030 =
         (ushort)((uint)DAT_data_002f * 0x10000 + (int)DAT_data_005b * (int)DAT_data_001a * 2 >>
                 0x10);
    DAT_data_002f =
         (ushort)((uint)DAT_data_002e * 0x10000 + (int)DAT_data_005a * (int)DAT_data_0019 * 2 >>
                 0x10);
    DAT_data_002e =
         (ushort)((uint)DAT_data_002d * 0x10000 + (int)DAT_data_0059 * (int)DAT_data_0018 * 2 >>
                 0x10);
    DAT_data_002d =
         (ushort)((uint)DAT_data_002c * 0x10000 + (int)(short)DAT_data_0058 * (int)DAT_data_0017 * 2
                 >> 0x10);
    DAT_data_002c = DAT_data_0058;
    uVar7 = (int)DAT_data_000a * (int)DAT_data_0040 + (int)DAT_data_0020 * (int)DAT_data_0041;
    DAT_data_0020 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    wVar8 = PA2;
    wVar3 = PA3;
    *(word *)(wVar8 & 0xff) = wVar3;
    uVar7 = (int)sVar4 * (int)DAT_data_0040 + (int)DAT_data_0021 * (int)DAT_data_0041;
    DAT_data_0021 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_000c * (int)DAT_data_0040 + (int)DAT_data_0022 * (int)DAT_data_0041;
    DAT_data_0022 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_000d * (int)DAT_data_0040 + (int)DAT_data_0023 * (int)DAT_data_0041;
    DAT_data_0023 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_000e * (int)DAT_data_0040 + (int)DAT_data_0024 * (int)DAT_data_0041;
    DAT_data_0024 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_000f * (int)DAT_data_0040 + (int)DAT_data_0025 * (int)DAT_data_0041;
    DAT_data_0025 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0010 * (int)DAT_data_0040 + (int)DAT_data_0026 * (int)DAT_data_0041;
    DAT_data_0026 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0011 * (int)DAT_data_0040 + (int)DAT_data_0027 * (int)DAT_data_0041;
    DAT_data_0027 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0012 * (int)DAT_data_0040 + (int)DAT_data_0028 * (int)DAT_data_0041;
    DAT_data_0028 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
    uVar7 = (int)DAT_data_0013 * (int)DAT_data_0040 + (int)DAT_data_0029 * (int)DAT_data_0041;
    DAT_data_0029 = (short)(uVar7 + (uVar7 & 0xffff0000) >> 0x10);
  } while( true );
}


