// 0112_program_01_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0112_program_01_dsp3 (ucode_0112_BigROM_0B193.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  short sVar6;
  
  DAT_data_0009 = 1;
  DAT_data_0006 = 0x400;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  sVar6 = 0;
  DAT_data_0008 = 0;
  DAT_data_0001 = 0;
  DAT_data_0002 = 0;
  DAT_data_0040 = 0;
  do {
    DAT_data_0005 = sVar6 + DAT_data_0009;
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0006) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    sVar6 = DAT_data_0005 + DAT_data_0009;
  } while (sVar6 != 0);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
    sVar6 = 0;
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0006) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    PA7 = DAT_data_000a;
    PA7 = DAT_data_000b;
    PA7 = DAT_data_000c;
    PA7 = DAT_data_000d;
    PA7 = DAT_data_000e;
    PA7 = DAT_data_000f;
    PA7 = DAT_data_0010;
    PA7 = DAT_data_0011;
    PA7 = DAT_data_0012;
    PA7 = DAT_data_0013;
    PA7 = DAT_data_0014;
    PA7 = DAT_data_0015;
    PA7 = DAT_data_0008;
    wVar3 = DAT_data_0008 + DAT_data_003c + DAT_data_003d;
    PA7 = DAT_data_0008 + DAT_data_003c;
    wVar4 = wVar3 + DAT_data_003e;
    wVar5 = wVar4 + DAT_data_003f;
    PA7 = wVar3;
    DAT_data_000a = wVar5 + DAT_data_001e;
    DAT_data_000b = DAT_data_000a + DAT_data_001f;
    PA7 = wVar4;
    DAT_data_000c = DAT_data_000b + DAT_data_0020;
    DAT_data_000d = DAT_data_000c + DAT_data_0021;
    PA7 = wVar5;
    DAT_data_000e = DAT_data_000d + DAT_data_0022;
    DAT_data_000f = DAT_data_000e + DAT_data_0023;
    DAT_data_0010 = DAT_data_000f + DAT_data_0024;
    DAT_data_0011 = DAT_data_0010 + DAT_data_0025;
    DAT_data_0012 = DAT_data_0011 + DAT_data_0026;
    DAT_data_0013 = DAT_data_0012 + DAT_data_0027;
    DAT_data_0014 = DAT_data_0013 + DAT_data_0028;
    DAT_data_0015 = DAT_data_0014 + DAT_data_0029;
    DAT_data_0008 = DAT_data_0008 - DAT_data_0009;
    iVar1 = (int)(short)DAT_data_0001;
    wVar3 = PA1;
    DAT_data_0001 = PA2;
    PA5 = DAT_data_0002;
    PA6 = (word)((uint)(sVar6 * iVar1 * 2) >> 0x10);
    DAT_data_0002 = (word)((uint)((int)DAT_data_0040 * (int)(short)wVar3 * 2) >> 0x10);
    sVar6 = DAT_data_0040;
  } while( true );
}


