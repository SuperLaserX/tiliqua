// 7211_DENSE_ROOM_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7211_DENSE_ROOM_dsp2 (ucode_7211_ROM4_027E1.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  short sVar7;
  int iVar6;
  int iVar8;
  
  sData0000 = 1;
  DAT_data_0003 = 0x200;
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  sVar7 = 0;
  DAT_data_0009 = 0;
  DAT_data_000a = 0;
  DAT_data_000b = 0;
  DAT_data_000c = 0;
  DAT_data_000d = 0;
  DAT_data_000e = 0;
  do {
    DAT_data_0002 = sVar7 + sData0000;
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    sVar7 = DAT_data_0002 + sData0000;
  } while (sVar7 != 0);
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    wVar2 = PA5;
    if ((wVar2 & DAT_data_0003) != 0) {
      wVar3 = PA6;
      *(word *)(wVar2 & 0xff) = wVar3;
    }
    iVar8 = (int)(short)DAT_data_001f * (int)DAT_data_004d;
    PA4 = DAT_data_0009;
    wVar2 = PA4;
    PA4 = DAT_data_000a;
    wVar3 = PA4;
    PA4 = DAT_data_000b;
    wVar4 = PA4;
    PA4 = DAT_data_000c;
    iVar6 = iVar8 + (int)(short)DAT_data_000f * 0x4000 + (int)(short)DAT_data_0010 * 0x4000 +
            (int)(short)DAT_data_0011 * 0x8000 + (int)(short)DAT_data_0012 * 0x8000 +
            (int)(short)DAT_data_0013 * 0x8000 + (int)(short)DAT_data_0014 * 0x8000;
    DAT_data_0009 = (word)((uint)iVar6 >> 0x10);
    wVar5 = PA4;
    PA4 = DAT_data_000d;
    DAT_data_000b =
         (word)(iVar6 + (int)(short)DAT_data_000f * -0x8000 + (uint)DAT_data_0012 * -0x10000 +
                (uint)DAT_data_0014 * -0x10000 >> 0x10);
    PA4 = DAT_data_000e;
    iVar6 = iVar8 + (int)(short)DAT_data_000f * 0x8000 + (int)(short)DAT_data_0010 * 0x8000 +
            (int)(short)DAT_data_0011 * 0x4000 + (int)(short)DAT_data_0012 * 0x4000 +
            (int)(short)DAT_data_0013 * -0x8000 + (int)(short)DAT_data_0014 * -0x8000;
    DAT_data_000a = (word)((uint)iVar6 >> 0x10);
    DAT_data_000c =
         (word)(iVar6 + (uint)DAT_data_000f * -0x10000 + (int)(short)DAT_data_0012 * -0x8000 +
                (uint)DAT_data_0014 * 0x10000 >> 0x10);
    iVar6 = iVar8 + (int)(short)DAT_data_000f * -0x8000 + (int)(short)DAT_data_0010 * 0x8000 +
            (int)(short)DAT_data_0011 * -0x8000 + (int)(short)DAT_data_0012 * 0x8000 +
            (int)(short)DAT_data_0013 * 0x4000 + (int)(short)DAT_data_0014 * -0x4000;
    DAT_data_000d = (word)((uint)iVar6 >> 0x10);
    DAT_data_000e =
         (word)(iVar6 + (uint)DAT_data_0010 * -0x10000 + (uint)DAT_data_0011 * 0x10000 +
                (int)(short)DAT_data_0013 * -0x8000 >> 0x10);
    DAT_data_000f =
         (ushort)((uint)(((int)(short)DAT_data_000f * (int)DAT_data_0040 +
                         (int)(short)wVar2 * (int)DAT_data_0041) * 2) >> 0x10);
    DAT_data_0010 =
         (ushort)((uint)(((int)(short)DAT_data_0010 * (int)DAT_data_0040 +
                         (int)(short)wVar3 * (int)DAT_data_0041) * 2) >> 0x10);
    DAT_data_0011 =
         (ushort)((uint)(((int)(short)DAT_data_0011 * (int)DAT_data_0040 +
                         (int)(short)wVar4 * (int)DAT_data_0041) * 2) >> 0x10);
    DAT_data_0012 =
         (ushort)((uint)(((int)(short)DAT_data_0012 * (int)DAT_data_0040 +
                         (int)(short)wVar5 * (int)DAT_data_0041) * 2) >> 0x10);
    DAT_data_0013 = PA1;
    DAT_data_0014 = PA1;
    DAT_data_001f = PA2;
  } while( true );
}


