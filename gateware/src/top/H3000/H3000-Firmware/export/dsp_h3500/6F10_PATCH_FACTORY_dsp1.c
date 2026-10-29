// 6F10_PATCH_FACTORY_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 6F10_PATCH_FACTORY_dsp1 (ucode_6F10_ROM4_36A0F.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  ushort uVar5;
  
  uVar5 = 0x8f;
  do {
    *(undefined2 *)(uVar5 & 0xff) = 0;
    uVar1 = uVar5 & 0x1ff;
    uVar5 = uVar5 - 1;
  } while (uVar1 != 0);
  uVar5 = 0;
  DAT_data_0021 = 1;
  DAT_data_0025 = 0x100;
  DAT_data_0024 = 0x8000;
  DAT_data_0020 = 0;
  DAT_data_0022 = 0xffff;
  DAT_data_0026 = 0xff;
  DAT_data_0010 = 0x7fff;
  DAT_data_0032 = 0x8000;
  DAT_data_000f = 0;
  FUN_prog_0890();
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    PA5 = *(word *)(uVar5 & 0xff);
    PA3 = *(word *)(DAT_data_0054 & 0xff);
    PA6 = *(word *)(DAT_data_0053 & 0xff);
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0025) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    wVar3 = PA3;
    wVar3 = PA3;
    wVar3 = PA7;
    DAT_data_0032 = DAT_data_0032 - DAT_data_0021;
    PA7 = DAT_data_0032;
    PA4 = *(word *)(DAT_data_004a & 0xff);
    PA7 = DAT_data_0032 + DAT_data_0044;
    wVar3 = PA4;
    PA4 = *(word *)(DAT_data_004b & 0xff);
    PA7 = DAT_data_0032 + DAT_data_0044 + DAT_data_0045;
    wVar3 = PA4;
    uVar5 = DAT_data_0052;
  } while( true );
}


// ===== FUN_prog_0890 @ prog:0890 =====

void FUN_prog_0890(void)

{
  char cVar1;
  word wVar2;
  
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  DAT_data_0028 = 0;
  DAT_data_0029 = 0;
  do {
    PA7 = DAT_data_0028;
    PA4 = DAT_data_0029;
    DAT_data_0028 = DAT_data_0028 + DAT_data_0021;
    DAT_data_0026 = PA5;
    if ((DAT_data_0026 & DAT_data_0025) != 0) {
      wVar2 = PA6;
      *(word *)(DAT_data_0026 & 0xff) = wVar2;
    }
    PA7 = DAT_data_0028;
    PA4 = DAT_data_0029;
    DAT_data_0028 = DAT_data_0028 + DAT_data_0021;
  } while (DAT_data_0028 != 0);
  return;
}


