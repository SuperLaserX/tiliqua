// 7711_PHASER_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7711_PHASER_dsp2 (ucode_7711_ROM4_39EEB.bin)
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
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    wVar3 = PA7;
    wVar3 = PA2;
    DAT_data_0012 =
         (ushort)((uint)DAT_data_0011 * -0x10000 + (int)(short)DAT_data_007a * (int)(short)wVar3 * 2
                  + (int)(short)DAT_data_007a * (int)(short)DAT_data_0012 * 2 >> 0x10);
    DAT_data_0014 =
         (ushort)((uint)DAT_data_0013 * -0x10000 +
                  (int)(short)DAT_data_007a * (int)(short)DAT_data_0012 * 2 +
                  (int)(short)DAT_data_007a * (int)(short)DAT_data_0014 * 2 >> 0x10);
    DAT_data_0016 =
         (ushort)((uint)DAT_data_0015 * -0x10000 +
                  (int)(short)DAT_data_0079 * (int)(short)DAT_data_0014 * 2 +
                  (int)(short)DAT_data_0079 * (int)(short)DAT_data_0016 * 2 >> 0x10);
    DAT_data_0018 =
         (ushort)((uint)DAT_data_0017 * -0x10000 +
                  (int)(short)DAT_data_0079 * (int)(short)DAT_data_0016 * 2 +
                  (int)(short)DAT_data_0079 * (int)(short)DAT_data_0018 * 2 >> 0x10);
    DAT_data_001a =
         (ushort)((uint)DAT_data_0019 * -0x10000 +
                  (int)(short)DAT_data_007a * (int)(short)DAT_data_0018 * 2 +
                  (int)(short)DAT_data_007a * (int)(short)DAT_data_001a * 2 >> 0x10);
    DAT_data_001c =
         (word)((uint)DAT_data_001b * -0x10000 +
                (int)(short)DAT_data_007a * (int)(short)DAT_data_001a * 2 +
                (int)(short)DAT_data_007a * (int)(short)DAT_data_001c * 2 >> 0x10);
    PA6 = (word)((uint)DAT_data_0051 * 0x10000 + (int)(short)DAT_data_0014 * 0x7fff >> 0x10);
    PA5 = (word)((uint)DAT_data_0051 * 0x10000 + (int)(short)DAT_data_001c * 0x7fff >> 0x10);
    wVar4 = PA5;
    wVar4 = PA6;
    PA3 = DAT_data_001c;
    DAT_data_0079 = PA1;
    DAT_data_007a = PA1;
    DAT_data_0051 = 0;
    DAT_data_0011 = wVar3;
    DAT_data_0013 = DAT_data_0012;
    DAT_data_0015 = DAT_data_0014;
    DAT_data_0017 = DAT_data_0016;
    DAT_data_0019 = DAT_data_0018;
    DAT_data_001b = DAT_data_001a;
  } while( true );
}


