// 7510_BAND_DELAY_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7510_BAND_DELAY_dsp1 (ucode_7510_ROM4_0B729.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  int iVar7;
  ushort uVar8;
  
  uVar8 = 0x8f;
  do {
    *(undefined2 *)(uVar8 & 0xff) = 0;
    uVar1 = uVar8 & 0x1ff;
    uVar8 = uVar8 - 1;
  } while (uVar1 != 0);
  DAT_data_0065 = 1;
  DAT_data_0069 = 0x100;
  DAT_data_0068 = 0x8000;
  DAT_data_0064 = 0;
  DAT_data_0066 = 0xffff;
  DAT_data_006a = 0xff;
  DAT_data_0067 = 0x7fff;
  FUN_prog_087b();
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    wVar4 = PA6;
    *(word *)(wVar3 & 0xff) = wVar4;
    DAT_data_005a = DAT_data_005a - DAT_data_0065;
    PA7 = DAT_data_005a;
    PA4 = DAT_data_005c;
    PA7 = DAT_data_005a + DAT_data_0005;
    PA7 = DAT_data_005a + DAT_data_000b;
    PA7 = DAT_data_005a + DAT_data_0011;
    PA7 = DAT_data_005a + DAT_data_0017;
    PA7 = DAT_data_005a + DAT_data_001d;
    PA7 = DAT_data_005a + DAT_data_0023;
    PA7 = DAT_data_005a + DAT_data_0029;
    PA7 = DAT_data_005a + DAT_data_002f;
    PA5 = DAT_data_0061;
    PA6 = DAT_data_0062;
    wVar3 = PA1;
    wVar4 = PA1;
    wVar5 = PA1;
    wVar6 = PA1;
    PA7 = DAT_data_005a + DAT_data_0031;
    DAT_data_005c =
         (word)((uint)((int)(short)DAT_data_005b * 0x4000 +
                       (int)(short)DAT_data_0059 * (int)DAT_data_0032 * 2 +
                       (int)(short)DAT_data_0061 * (int)DAT_data_0033 +
                      (int)(short)DAT_data_0062 * (int)DAT_data_0033) >> 0x10);
    DAT_data_0059 = PA4;
    iVar7 = (uint)wVar3 * 0x10000 + (uint)wVar4 * 0x10000;
    uVar8 = (ushort)((uint)iVar7 >> 0x10);
    DAT_data_0061 =
         (word)(iVar7 + (uint)uVar8 * 0x10000 + (uint)uVar8 * 0x10000 + (uint)uVar8 * 0x10000 +
                (uint)uVar8 * 0x10000 + (uint)uVar8 * 0x10000 >> 0x10);
    iVar7 = (uint)wVar5 * 0x10000 + (uint)wVar6 * 0x10000;
    uVar8 = (ushort)((uint)iVar7 >> 0x10);
    DAT_data_005b = PA7;
    DAT_data_0062 =
         (word)(iVar7 + (uint)uVar8 * 0x10000 + (uint)uVar8 * 0x10000 + (uint)uVar8 * 0x10000 +
                (uint)uVar8 * 0x10000 + (uint)uVar8 * 0x10000 >> 0x10);
  } while( true );
}


// ===== FUN_prog_087b @ prog:087b =====

void FUN_prog_087b(void)

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
    PA7 = DAT_data_006b;
    PA7 = DAT_data_006b + DAT_data_0065;
    wVar2 = DAT_data_006b + DAT_data_0065 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    wVar2 = wVar2 + DAT_data_0065;
    PA7 = wVar2;
    DAT_data_006b = wVar2 + DAT_data_0065;
  } while (-1 < (short)DAT_data_006b);
  return;
}


