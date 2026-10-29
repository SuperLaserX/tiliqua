// 7511_BAND_DELAY_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7511_BAND_DELAY_dsp2 (ucode_7511_ROM4_0B8E7.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  uint uVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  short in_T;
  ushort uVar7;
  
  uVar7 = 0x8f;
  do {
    *(undefined2 *)(uVar7 & 0xff) = 0;
    uVar2 = uVar7 & 0x1ff;
    uVar7 = uVar7 - 1;
  } while (uVar2 != 0);
  DAT_data_006d = 1;
  DAT_data_0071 = 0x200;
  DAT_data_0070 = 0x8000;
  DAT_data_006c = 0;
  DAT_data_006e = 0xffff;
  DAT_data_0072 = 0xff;
  DAT_data_006f = 0x7fff;
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
    DAT_data_005b =
         (ushort)((uint)DAT_data_005b * 0x10000 + (int)in_T * (int)(short)DAT_data_005a * 2 >> 0x10)
    ;
    uVar1 = (uint)DAT_data_005d;
    DAT_data_005d = PA4;
    DAT_data_005a =
         (ushort)((int)sData0001 *
                  (int)(short)(uVar1 * 0x10000 + (int)(short)DAT_data_005a * (int)sData0002 * 2 +
                               (uint)DAT_data_005b * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_005a * 0x10000 >> 0x10);
    wVar4 = PA4;
    wVar5 = PA4;
    DAT_data_005f =
         (ushort)((uint)DAT_data_005f * 0x10000 + (int)DAT_data_0007 * (int)(short)DAT_data_005e * 2
                 >> 0x10);
    wVar6 = PA4;
    DAT_data_005e =
         (ushort)((int)DAT_data_0007 *
                  (int)(short)((uint)wVar4 * 0x10000 +
                               (int)(short)DAT_data_005e * (int)DAT_data_0008 * 2 +
                               (uint)DAT_data_005f * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_005e * 0x10000 >> 0x10);
    DAT_data_0063 =
         (ushort)((uint)DAT_data_0063 * 0x10000 + (int)DAT_data_000d * (int)(short)DAT_data_0062 * 2
                 >> 0x10);
    DAT_data_0062 =
         (ushort)((int)DAT_data_000d *
                  (int)(short)((uint)wVar5 * 0x10000 +
                               (int)(short)DAT_data_0062 * (int)DAT_data_000e * 2 +
                               (uint)DAT_data_0063 * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_0062 * 0x10000 >> 0x10);
    PA1 = DAT_data_006a;
    DAT_data_0067 =
         (ushort)((uint)DAT_data_0067 * 0x10000 + (int)DAT_data_0013 * (int)(short)DAT_data_0066 * 2
                 >> 0x10);
    PA1 = DAT_data_006b;
    DAT_data_0066 =
         (ushort)((int)DAT_data_0013 *
                  (int)(short)((uint)wVar6 * 0x10000 +
                               (int)(short)DAT_data_0066 * (int)DAT_data_0014 * 2 +
                               (uint)DAT_data_0067 * -0x10000 >> 0x10) * 2 +
                  (uint)DAT_data_0066 * 0x10000 >> 0x10);
    DAT_data_006a =
         (word)((uint)((int)sData0003 * (int)(short)DAT_data_005a +
                       (int)DAT_data_0009 * (int)(short)DAT_data_005e +
                       (int)DAT_data_000f * (int)(short)DAT_data_0062 +
                      (int)DAT_data_0015 * (int)(short)DAT_data_0066) >> 0x10);
    DAT_data_006b =
         (word)((uint)((int)DAT_data_0004 * (int)(short)DAT_data_005a +
                       (int)DAT_data_000a * (int)(short)DAT_data_005e +
                       (int)DAT_data_0010 * (int)(short)DAT_data_0062 +
                      (int)DAT_data_0016 * (int)(short)DAT_data_0066) >> 0x10);
    in_T = sData0001;
  } while( true );
}


// ===== FUN_prog_0888 @ prog:0888 =====

void FUN_prog_0888(void)

{
  char cVar1;
  word wVar2;
  ushort in_AR0;
  
  DAT_data_0073 = DAT_data_006f;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    DAT_data_0072 = PA5;
    wVar2 = PA6;
    *(word *)(in_AR0 & 0xff) = wVar2;
    PA7 = DAT_data_0073 + DAT_data_006d;
    wVar2 = DAT_data_0073 + DAT_data_006d + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_006d;
    PA7 = wVar2;
    DAT_data_0073 = wVar2 + DAT_data_006d;
    PA7 = DAT_data_0073;
  } while ((short)DAT_data_0073 < 0);
  return;
}


