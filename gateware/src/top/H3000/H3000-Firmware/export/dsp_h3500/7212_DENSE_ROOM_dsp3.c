// 7212_DENSE_ROOM_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7212_DENSE_ROOM_dsp3 (ucode_7212_ROM4_02953.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  word wVar2;
  word wVar3;
  word wVar4;
  char cVar5;
  short sVar6;
  
  sData0000 = 1;
  DAT_data_0004 = 0x400;
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar2 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  sVar6 = 0;
  do {
    DAT_data_0003 = sVar6 + sData0000;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0004) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    sVar6 = DAT_data_0003 + sData0000;
  } while (sVar6 != 0);
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar2 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
  do {
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0004) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    PA7 = DAT_data_0005;
    PA7 = DAT_data_0006;
    wVar2 = (word)((uint)DAT_data_001c * 0x10000 +
                   (int)DAT_data_0055 * (int)(short)DAT_data_0017 * 2 >> 0x10);
    PA7 = DAT_data_0007;
    PA7 = DAT_data_0008;
    PA7 = DAT_data_0009;
    wVar3 = (word)((uint)DAT_data_0017 * 0x10000 + (int)DAT_data_0055 * (int)(short)wVar2 * -2 +
                   (int)DAT_data_0056 * (int)(short)DAT_data_0019 * 2 >> 0x10);
    PA7 = DAT_data_000a;
    PA7 = DAT_data_000b;
    wVar4 = (word)((uint)DAT_data_0019 * 0x10000 + (int)DAT_data_0056 * (int)(short)wVar3 * -2 +
                   (int)DAT_data_0057 * (int)(short)DAT_data_001b * 2 >> 0x10);
    iVar1 = (int)(short)DAT_data_001b;
    PA7 = DAT_data_000f;
    DAT_data_001c = PA4;
    PA4 = wVar2;
    PA7 = DAT_data_000c;
    DAT_data_0017 = PA4;
    PA4 = wVar3;
    PA7 = DAT_data_000d;
    DAT_data_0019 = PA4;
    PA4 = wVar4;
    PA7 = DAT_data_000e;
    DAT_data_001b = PA4;
    DAT_data_001d =
         (word)((uint)((iVar1 * 0x8000 - (int)DAT_data_0057 * (int)(short)wVar4) +
                      (int)(short)DAT_data_001d * 0x8000) >> 0x10);
    DAT_data_0005 = DAT_data_0005 - sData0000;
    DAT_data_0006 = DAT_data_0005 + DAT_data_004b;
    DAT_data_0007 = DAT_data_0006 + DAT_data_004c;
    DAT_data_0008 = DAT_data_0007 + DAT_data_004d;
    DAT_data_0009 = DAT_data_0008 + DAT_data_004e;
    DAT_data_000a = DAT_data_0009 + DAT_data_004f;
    DAT_data_000b = DAT_data_000a + DAT_data_0050;
    DAT_data_000f = DAT_data_000b + DAT_data_0051;
    DAT_data_000c = DAT_data_000f + DAT_data_0052;
    DAT_data_000d = DAT_data_000c + DAT_data_0053;
    DAT_data_000e = DAT_data_000d + DAT_data_0054;
    PA2 = DAT_data_001d;
  } while( true );
}


