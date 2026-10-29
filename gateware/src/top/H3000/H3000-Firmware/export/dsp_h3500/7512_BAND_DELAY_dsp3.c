// 7512_BAND_DELAY_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7512_BAND_DELAY_dsp3 (ucode_7512_ROM4_0BABF.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  uint uVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  short in_T;
  ushort uVar6;
  
  uVar6 = 0x8f;
  do {
    *(undefined2 *)(uVar6 & 0xff) = 0;
    uVar2 = uVar6 & 0x1ff;
    uVar6 = uVar6 - 1;
  } while (uVar2 != 0);
  DAT_data_0065 = 1;
  DAT_data_0069 = 0x400;
  DAT_data_0068 = 0x8000;
  DAT_data_0064 = 0;
  DAT_data_0066 = 0xffff;
  DAT_data_006a = 0xff;
  DAT_data_0067 = 0x7fff;
  FUN_prog_0888();
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar4 = PA5;
    wVar5 = PA6;
    *(word *)(wVar4 & 0xff) = wVar5;
    DAT_data_0051 =
         (ushort)((uint)DAT_data_0051 * 0x10000 + (int)in_T * (int)(short)DAT_data_0050 * 2 >> 0x10)
    ;
    DAT_data_0050 =
         (ushort)((int)DAT_data_0019 *
                  (int)(short)((uint)DAT_data_0053 * 0x10000 +
                               (int)(short)DAT_data_0050 * (int)DAT_data_001a * 2 +
                               (uint)DAT_data_0051 * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_0050 * 0x10000 >> 0x10);
    DAT_data_0055 =
         (ushort)((uint)DAT_data_0055 * 0x10000 + (int)DAT_data_001f * (int)(short)DAT_data_0054 * 2
                 >> 0x10);
    DAT_data_0054 =
         (ushort)((int)DAT_data_001f *
                  (int)(short)((uint)DAT_data_0057 * 0x10000 +
                               (int)(short)DAT_data_0054 * (int)DAT_data_0020 * 2 +
                               (uint)DAT_data_0055 * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_0054 * 0x10000 >> 0x10);
    DAT_data_0053 = PA4;
    DAT_data_0057 = PA4;
    DAT_data_0059 =
         (ushort)((uint)DAT_data_0059 * 0x10000 + (int)DAT_data_0025 * (int)(short)DAT_data_0058 * 2
                 >> 0x10);
    uVar1 = (uint)DAT_data_005b;
    DAT_data_005b = PA4;
    wVar4 = PA4;
    PA1 = DAT_data_0060;
    DAT_data_0058 =
         (ushort)((int)DAT_data_0025 *
                  (int)(short)(uVar1 * 0x10000 + (int)(short)DAT_data_0058 * (int)DAT_data_0026 * 2
                               + (uint)DAT_data_0059 * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_0058 * 0x10000 >> 0x10);
    PA1 = DAT_data_0061;
    DAT_data_005d =
         (ushort)((uint)DAT_data_005d * 0x10000 + (int)DAT_data_002b * (int)(short)DAT_data_005c * 2
                 >> 0x10);
    DAT_data_005c =
         (ushort)((int)DAT_data_002b *
                  (int)(short)((uint)wVar4 * 0x10000 +
                               (int)(short)DAT_data_005c * (int)DAT_data_002c * 2 +
                               (uint)DAT_data_005d * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_005c * 0x10000 >> 0x10);
    DAT_data_0060 =
         (word)((uint)((int)DAT_data_001b * (int)(short)DAT_data_0050 +
                       (int)DAT_data_0021 * (int)(short)DAT_data_0054 +
                       (int)DAT_data_0027 * (int)(short)DAT_data_0058 +
                      (int)DAT_data_002d * (int)(short)DAT_data_005c) >> 0x10);
    DAT_data_0061 =
         (word)((uint)((int)DAT_data_001c * (int)(short)DAT_data_0050 +
                       (int)DAT_data_0022 * (int)(short)DAT_data_0054 +
                       (int)DAT_data_0028 * (int)(short)DAT_data_0058 +
                      (int)DAT_data_002e * (int)(short)DAT_data_005c) >> 0x10);
    in_T = DAT_data_0019;
  } while( true );
}


// ===== FUN_prog_0888 @ prog:0888 =====

void FUN_prog_0888(void)

{
  char cVar1;
  word wVar2;
  ushort in_AR0;
  
  DAT_data_006b = 0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    DAT_data_006a = PA5;
    wVar2 = PA6;
    *(word *)(in_AR0 & 0xff) = wVar2;
    DAT_data_006b = DAT_data_006b + 0x15;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
    PA4 = DAT_data_0064;
  } while (0 < DAT_data_006b);
  return;
}


