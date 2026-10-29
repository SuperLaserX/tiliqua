// 7A13_mod_factory_one_dsp4 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7A13_mod_factory_one_dsp4 (ucode_7A13_ROM3_0C15F.bin)
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
  DAT_data_0020 = 1;
  DAT_data_0022 = 0x800;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar4 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  DAT_data_0024 = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar4 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar4 = PA5;
    if ((wVar4 & DAT_data_0022) != 0) {
      wVar3 = PA6;
      *(word *)(wVar4 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0024;
    PA7 = DAT_data_0024 + DAT_data_0020;
    wVar4 = DAT_data_0024 + DAT_data_0020 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    DAT_data_0024 = wVar4 + DAT_data_0020;
  } while (-1 < (short)DAT_data_0024);
  DAT_data_0024 = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar4 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar4 = PA5;
    if ((wVar4 & DAT_data_0022) != 0) {
      wVar3 = PA6;
      *(word *)(wVar4 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0024;
    PA7 = DAT_data_0024 + DAT_data_0020;
    wVar4 = DAT_data_0024 + DAT_data_0020 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    DAT_data_0024 = wVar4 + DAT_data_0020;
  } while (-1 < (short)DAT_data_0024);
  DAT_data_0024 = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar4 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar4 = PA5;
    if ((wVar4 & DAT_data_0022) != 0) {
      wVar3 = PA6;
      *(word *)(wVar4 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0024;
    PA7 = DAT_data_0024 + DAT_data_0020;
    wVar4 = DAT_data_0024 + DAT_data_0020 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    wVar4 = wVar4 + DAT_data_0020;
    PA7 = wVar4;
    DAT_data_0024 = wVar4 + DAT_data_0020;
  } while (-1 < (short)DAT_data_0024);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar4 = PA0;
  do {
    cVar2 = bio_pin();
    uVar5 = 0;
  } while (cVar2 == '\0');
  do {
    wVar4 = PA5;
    wVar4 = PA6;
    *(word *)(uVar5 & 0xff) = wVar4;
    wVar4 = PA7;
    PA5 = *(word *)(DAT_data_002c & 0xff);
    PA6 = *(word *)(DAT_data_002d & 0xff);
    wVar4 = PA7;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    PA1 = *(word *)(DAT_data_003a & 0xff);
    PA1 = *(word *)(DAT_data_003d & 0xff);
    PA1 = *(word *)(DAT_data_003e & 0xff);
    PA1 = *(word *)(DAT_data_0040 & 0xff);
    PA1 = *(word *)(DAT_data_0042 & 0xff);
    PA1 = *(word *)(DAT_data_0041 & 0xff);
    wVar4 = PA7;
    PA5 = *(word *)(DAT_data_002c & 0xff);
    PA6 = *(word *)(DAT_data_002d & 0xff);
    wVar4 = PA7;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    PA1 = *(word *)(DAT_data_003a & 0xff);
    PA1 = *(word *)(DAT_data_003d & 0xff);
    PA1 = *(word *)(DAT_data_0044 & 0xff);
    PA1 = *(word *)(DAT_data_0040 & 0xff);
    PA1 = *(word *)(DAT_data_0042 & 0xff);
    PA1 = *(word *)(DAT_data_0041 & 0xff);
    wVar4 = PA7;
    PA5 = *(word *)(DAT_data_002c & 0xff);
    PA6 = *(word *)(DAT_data_002d & 0xff);
    wVar4 = PA7;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    PA1 = *(word *)(DAT_data_003a & 0xff);
    PA1 = *(word *)(DAT_data_003d & 0xff);
    PA1 = *(word *)(DAT_data_003c & 0xff);
    PA1 = *(word *)(DAT_data_0040 & 0xff);
    PA1 = *(word *)(DAT_data_0042 & 0xff);
    PA1 = *(word *)(DAT_data_0045 & 0xff);
    wVar4 = PA7;
    PA5 = *(word *)(DAT_data_002c & 0xff);
    PA6 = *(word *)(DAT_data_002d & 0xff);
    wVar4 = PA7;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    wVar4 = PA1;
    PA1 = *(word *)(DAT_data_003a & 0xff);
    PA1 = *(word *)(DAT_data_003d & 0xff);
    PA1 = *(word *)(DAT_data_003b & 0xff);
    PA1 = *(word *)(DAT_data_0040 & 0xff);
    PA1 = *(word *)(DAT_data_0042 & 0xff);
    PA1 = *(word *)(DAT_data_003f & 0xff);
    uVar5 = DAT_data_002d;
  } while( true );
}


