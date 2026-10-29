// 7010_STUTTER_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7010_STUTTER_dsp1 (ucode_7010_ROM4_377A3.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  char cVar1;
  word wVar2;
  word wVar3;
  short sVar4;
  ushort uVar5;
  
  DAT_data_0008 = 1;
  DAT_data_0047 = 1;
  DAT_data_0006 = 0x100;
  DAT_data_000b = 0x4000;
  DAT_data_0007 = 4;
  DAT_data_000d = 0x8000;
  DAT_data_000a = 0;
  DAT_data_0022 = 0;
  DAT_data_0049 = 0;
  DAT_data_0009 = 0xffff;
  DAT_data_0016 = 0xff;
  DAT_data_0041 = 0xff;
  DAT_data_0042 = 0xff;
  DAT_data_000f = 0xff;
  DAT_data_0002 = 0xff;
  DAT_data_000c = 0x7fff;
  uVar5 = 0;
  DAT_data_0013 = DAT_data_000d;
  DAT_data_0018 = DAT_data_000c;
  DAT_data_0020 = DAT_data_0009;
  FUN_prog_0994();
  do {
    cVar1 = bio_pin();
  } while (cVar1 != '\0');
  wVar2 = PA0;
  do {
    cVar1 = bio_pin();
  } while (cVar1 == '\0');
  do {
    while (-1 < (int)((uint)DAT_data_0016 - (uint)DAT_data_0022)) {
      DAT_data_0010 = PA3;
      if (0 < (int)(((uint)DAT_data_0016 - (uint)DAT_data_0022) - (uint)DAT_data_0010))
      goto LAB_prog_093e;
      wVar2 = PA0;
      if ((DAT_data_0007 & wVar2) != 0) {
        PA6 = *(word *)(uVar5 & 0xff);
        uVar5 = uVar5 + 1;
      }
      DAT_data_0011 = PA2;
      wVar2 = PA0;
      if ((DAT_data_0007 & wVar2) != 0) {
        PA6 = *(word *)(uVar5 & 0xff);
        uVar5 = uVar5 + 1;
      }
      DAT_data_0014 = (DAT_data_0016 - uVar5) + DAT_data_0047 + DAT_data_0011;
      wVar2 = PA5;
      if ((wVar2 & DAT_data_0006) != 0) {
        wVar3 = PA6;
        *(word *)(wVar2 & 0xff) = wVar3;
      }
      PA7 = DAT_data_0014;
      wVar2 = PA4;
      wVar2 = PA4;
      DAT_data_0016 = DAT_data_0014 - DAT_data_0011;
      uVar5 = DAT_data_000a;
      if ((int)((uint)DAT_data_0049 << 0x10) < 1) {
        wVar2 = PA0;
        if ((DAT_data_0007 & wVar2) != 0) {
          PA6 = *(word *)(DAT_data_000a & 0xff);
          uVar5 = DAT_data_000a + 1;
        }
        if ((int)((uint)DAT_data_0020 << 0x10) < 0) {
          if ((int)((uint)DAT_data_0022 - (uint)DAT_data_0041) < 1) {
            DAT_data_0022 = DAT_data_0041;
          }
          else {
            DAT_data_0022 = DAT_data_0022 - DAT_data_004a;
          }
        }
        else {
          DAT_data_0020 =
               (ushort)((((uint)DAT_data_0011 + (uint)DAT_data_0048) - (uint)DAT_data_0021 &
                        (uint)DAT_data_0009) + (int)(short)DAT_data_0008 * -0x20 >> 0x10);
        }
      }
      else {
        wVar2 = PA0;
        if ((DAT_data_0007 & wVar2) != 0) {
          PA6 = *(word *)(DAT_data_000a & 0xff);
          uVar5 = DAT_data_000a + 1;
        }
        if ((int)((uint)DAT_data_0020 << 0x10) < 0) {
          DAT_data_0049 =
               (ushort)((uint)DAT_data_0049 * 0x10000 + (uint)DAT_data_0008 * -0x10000 >> 0x10);
          DAT_data_0010 = -DAT_data_0048;
          DAT_data_0022 = DAT_data_0048 + DAT_data_0022;
          DAT_data_0020 = DAT_data_0008;
          DAT_data_0021 = DAT_data_0011;
          goto LAB_prog_093e;
        }
        DAT_data_0020 =
             (ushort)((((uint)DAT_data_0011 + (uint)DAT_data_0048) - (uint)DAT_data_0021 &
                      (uint)DAT_data_0009) + (int)(short)DAT_data_0008 * -0x20 >> 0x10);
      }
    }
    wVar2 = PA3;
    DAT_data_0010 = -wVar2;
LAB_prog_093e:
    wVar2 = PA0;
    if ((DAT_data_0007 & wVar2) != 0) {
      PA6 = *(word *)(uVar5 & 0xff);
      uVar5 = uVar5 + 1;
    }
    DAT_data_0011 = PA2;
    DAT_data_0018 = 0;
    wVar2 = PA0;
    if ((DAT_data_0007 & wVar2) != 0) {
      PA6 = *(word *)(uVar5 & 0xff);
      uVar5 = uVar5 + 1;
    }
    sVar4 = (DAT_data_0016 - uVar5) + DAT_data_0047;
    PA7 = sVar4 + DAT_data_0011;
    wVar2 = PA4;
    wVar2 = PA4;
    DAT_data_0016 = sVar4 - DAT_data_0010;
    wVar2 = PA0;
    uVar5 = DAT_data_000a;
    if ((DAT_data_0007 & wVar2) != 0) {
      PA6 = *(word *)(DAT_data_000a & 0xff);
      uVar5 = DAT_data_000a + 1;
    }
    do {
      if (-1 < (int)((uint)DAT_data_0020 << 0x10)) {
        DAT_data_0020 =
             (ushort)((((uint)DAT_data_0011 + (uint)DAT_data_0048) - (uint)DAT_data_0021 &
                      (uint)DAT_data_0009) + (int)(short)DAT_data_0008 * -0x20 >> 0x10);
      }
      wVar2 = PA0;
      if ((DAT_data_0007 & wVar2) != 0) {
        PA6 = *(word *)(uVar5 & 0xff);
        uVar5 = uVar5 + 1;
      }
      DAT_data_0011 = PA2;
      DAT_data_0018 =
           (ushort)((uint)DAT_data_0018 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
      wVar2 = PA0;
      if ((DAT_data_0007 & wVar2) != 0) {
        PA6 = *(word *)(uVar5 & 0xff);
        uVar5 = uVar5 + 1;
      }
      DAT_data_0016 = (DAT_data_0016 - uVar5) + DAT_data_0047;
      PA7 = DAT_data_0016 + DAT_data_0011;
      wVar2 = PA4;
      wVar2 = PA4;
      PA7 = DAT_data_0016 + DAT_data_0011 + DAT_data_0010;
      wVar2 = PA4;
      wVar2 = PA4;
      wVar2 = PA0;
      uVar5 = DAT_data_000a;
      if ((DAT_data_0007 & wVar2) != 0) {
        PA6 = *(word *)(DAT_data_000a & 0xff);
        uVar5 = DAT_data_000a + 1;
      }
    } while ((short)((uint)DAT_data_0018 * 0x10000 + (uint)DAT_data_000c * -0x10000 >> 0x10) != 0);
  } while( true );
}


// ===== FUN_prog_0994 @ prog:0994 =====

void FUN_prog_0994(void)

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
  DAT_data_0004 = 0;
  DAT_data_0005 = 0;
  do {
    PA7 = DAT_data_0004;
    PA4 = DAT_data_0005;
    DAT_data_0004 = DAT_data_0004 + DAT_data_0008;
    DAT_data_0002 = PA5;
    if ((DAT_data_0002 & DAT_data_0006) != 0) {
      wVar2 = PA6;
      *(word *)(DAT_data_0002 & 0xff) = wVar2;
    }
    PA7 = DAT_data_0004;
    PA4 = DAT_data_0005;
    DAT_data_0004 = DAT_data_0004 + DAT_data_0008;
  } while (DAT_data_0004 != 0);
  return;
}


