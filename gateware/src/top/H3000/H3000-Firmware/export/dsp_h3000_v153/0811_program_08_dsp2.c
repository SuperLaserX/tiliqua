// 0811_program_08_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0811_program_08_dsp2 (ucode_0811_BigROM_0ACA7.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  short sVar4;
  ushort uVar5;
  
  DAT_data_0006 = 1;
  DAT_data_0004 = 0x200;
  DAT_data_0005 = 4;
  DAT_data_0008 = 0;
  DAT_data_0015 = 0xff;
  DAT_data_000d = 0xff;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  sVar4 = 0;
  do {
    DAT_data_0003 = sVar4 + DAT_data_0006;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0004) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    sVar4 = DAT_data_0003 + DAT_data_0006;
  } while (sVar4 != 0);
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  do {
    cVar1 = bio_pin();
    uVar5 = 0;
  } while (cVar1 == '\0');
  do {
    while (DAT_data_000e = PA3, 0 < (int)((uint)DAT_data_0015 - (uint)DAT_data_000e)) {
      wVar2 = PA0;
      if ((DAT_data_0005 & wVar2) != 0) {
        PA6 = *(word *)(uVar5 & 0xff);
        uVar5 = uVar5 + 1;
      }
      DAT_data_000f = PA2;
      wVar2 = PA5;
      if ((wVar2 & DAT_data_0004) != 0) {
        wVar3 = PA6;
        *(word *)(wVar2 & 0xff) = wVar3;
      }
      wVar2 = PA0;
      if ((DAT_data_0005 & wVar2) != 0) {
        PA6 = *(word *)(uVar5 & 0xff);
        uVar5 = uVar5 + 1;
      }
      DAT_data_0015 = (DAT_data_0015 - DAT_data_000e) + uVar5 + DAT_data_0006;
      PA7 = DAT_data_0015 + DAT_data_000f + DAT_data_000e;
      wVar2 = PA4;
      wVar2 = PA4;
      DAT_data_000d = DAT_data_000e;
      wVar2 = PA0;
      uVar5 = DAT_data_0008;
      if ((DAT_data_0005 & wVar2) != 0) {
        PA6 = *(word *)(DAT_data_0008 & 0xff);
        uVar5 = DAT_data_0008 + 1;
      }
    }
    wVar2 = PA0;
    if ((DAT_data_0005 & wVar2) != 0) {
      PA6 = *(word *)(uVar5 & 0xff);
      uVar5 = uVar5 + 1;
    }
    DAT_data_000f = PA2;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0004) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    wVar2 = PA0;
    if ((DAT_data_0005 & wVar2) != 0) {
      PA6 = *(word *)(uVar5 & 0xff);
      uVar5 = uVar5 + 1;
    }
    DAT_data_0015 = DAT_data_0015 + uVar5 + DAT_data_0006;
    PA7 = DAT_data_0015 + DAT_data_000f;
    wVar2 = PA4;
    wVar2 = PA4;
    PA7 = DAT_data_0015 + DAT_data_000f + DAT_data_000d;
    wVar2 = PA4;
    wVar2 = PA4;
    wVar2 = PA0;
    uVar5 = DAT_data_0008;
    if ((DAT_data_0005 & wVar2) != 0) {
      PA6 = *(word *)(DAT_data_0008 & 0xff);
      uVar5 = DAT_data_0008 + 1;
    }
  } while( true );
}


