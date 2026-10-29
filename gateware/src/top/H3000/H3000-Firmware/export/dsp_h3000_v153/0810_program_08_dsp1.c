// 0810_program_08_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0810_program_08_dsp1 (ucode_0810_BigROM_0AA73.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  ushort uVar4;
  
  DAT_data_0006 = 1;
  DAT_data_0004 = 0x100;
  DAT_data_0005 = 8;
  DAT_data_0013 = 0xff;
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
  DAT_data_0008 = 0;
  DAT_data_0003 = 0;
  DAT_data_000f = 0;
  DAT_data_0016 = 0;
  PA5 = 0;
  PA6 = 0;
  do {
    PA7 = DAT_data_0003;
    PA4 = DAT_data_0008;
    DAT_data_0003 = DAT_data_0003 + DAT_data_0006;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0004) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0003;
    PA4 = DAT_data_0008;
    DAT_data_0003 = DAT_data_0003 + DAT_data_0006;
  } while (DAT_data_0003 != 0);
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  wVar2 = PA0;
  uVar4 = 0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    while( true ) {
      DAT_data_0017 = PA7;
      wVar2 = PA1;
      if (0 < (int)((uint)DAT_data_0013 - (uint)wVar2)) break;
      wVar2 = PA0;
      if ((DAT_data_0005 & wVar2) != 0) {
        PA5 = *(word *)(uVar4 & 0xff);
        uVar4 = uVar4 + 1;
      }
      DAT_data_0013 = DAT_data_0013 + uVar4 + DAT_data_0006;
      PA7 = DAT_data_0013 + DAT_data_000f;
      wVar2 = PA4;
      wVar2 = PA4;
      PA7 = DAT_data_0013 + DAT_data_000f + DAT_data_000d;
      wVar2 = PA4;
      wVar2 = PA4;
      wVar2 = PA0;
      uVar4 = DAT_data_0008;
      if ((DAT_data_0005 & wVar2) != 0) {
        PA5 = *(word *)(DAT_data_0008 & 0xff);
        uVar4 = DAT_data_0008 + 1;
      }
      wVar2 = PA5;
      if ((wVar2 & DAT_data_0004) != 0) {
        wVar3 = PA6;
        *(word *)(wVar2 & 0xff) = wVar3;
      }
      PA2 = DAT_data_000f;
      PA7 = DAT_data_000f;
      PA4 = (word)((uint)((int)(short)DAT_data_0016 * 0x8000 + (int)(short)DAT_data_0017 * 0x8000)
                  >> 0x10);
      wVar2 = PA0;
      if ((DAT_data_0005 & wVar2) != 0) {
        PA5 = *(word *)(uVar4 & 0xff);
        uVar4 = uVar4 + 1;
      }
      DAT_data_000f = DAT_data_000f - DAT_data_0006;
      DAT_data_0016 = PA7;
    }
    wVar3 = PA0;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA5 = *(word *)(uVar4 & 0xff);
      uVar4 = uVar4 + 1;
    }
    DAT_data_0013 = (DAT_data_0013 - wVar2) + uVar4 + DAT_data_0006;
    PA7 = DAT_data_0013 + DAT_data_000f + wVar2;
    wVar3 = PA4;
    wVar3 = PA4;
    wVar3 = PA0;
    uVar4 = DAT_data_0008;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA5 = *(word *)(DAT_data_0008 & 0xff);
      uVar4 = DAT_data_0008 + 1;
    }
    wVar3 = PA5;
    DAT_data_000d = wVar2;
    if ((wVar3 & DAT_data_0004) != 0) {
      wVar2 = PA6;
      *(word *)(wVar3 & 0xff) = wVar2;
    }
    PA2 = DAT_data_000f;
    PA7 = DAT_data_000f;
    PA4 = (word)((uint)((int)(short)DAT_data_0016 * 0x8000 + (int)(short)DAT_data_0017 * 0x8000) >>
                0x10);
    wVar2 = PA0;
    if ((DAT_data_0005 & wVar2) != 0) {
      PA5 = *(word *)(uVar4 & 0xff);
      uVar4 = uVar4 + 1;
    }
    DAT_data_000f = DAT_data_000f - DAT_data_0006;
    DAT_data_0016 = PA7;
  } while( true );
}


