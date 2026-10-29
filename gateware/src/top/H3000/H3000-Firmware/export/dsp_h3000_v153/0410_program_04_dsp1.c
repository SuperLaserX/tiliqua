// 0410_program_04_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0410_program_04_dsp1 (ucode_0410_SmallROM_03B30.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  undefined2 uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  short sVar5;
  ushort uVar6;
  
  DAT_data_0006 = 1;
  DAT_data_0046 = 1;
  DAT_data_0004 = 0x100;
  DAT_data_0005 = 8;
  DAT_data_0013 = 0xff;
  DAT_data_0041 = 0xff;
  DAT_data_0042 = 0xff;
  DAT_data_000a = 0x7fff;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
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
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0004) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    PA7 = DAT_data_0003;
    PA4 = DAT_data_0008;
    DAT_data_0003 = DAT_data_0003 + DAT_data_0006;
  } while (DAT_data_0003 != 0);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  wVar3 = PA0;
  uVar6 = 0;
  if (((uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) ||
     ((uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0)) {
    uVar1 = *(undefined2 *)(DAT_data_0006 * 0x884 & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x8f4 & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x946 & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9ab & 0xfff) = uVar1;
  }
  if ((uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) {
    *(undefined2 *)(DAT_data_0006 * 0x8ab & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x89b & 0xfff);
  }
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    while( true ) {
      DAT_data_0017 = PA7;
      if ((int)((uint)DAT_data_0013 - (uint)DAT_data_0041) < 0) break;
      DAT_data_000e = PA1;
      if (0 < (int)(((uint)DAT_data_0013 - (uint)DAT_data_0041) - (uint)DAT_data_000e))
      goto LAB_prog_096d;
      wVar3 = PA0;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA5 = *(word *)(uVar6 & 0xff);
        uVar6 = uVar6 + 1;
      }
      DAT_data_0013 = (DAT_data_0013 - uVar6) + DAT_data_0046;
      PA7 = DAT_data_0013 + DAT_data_000f;
      wVar3 = PA4;
      wVar3 = PA4;
      wVar3 = PA0;
      uVar6 = DAT_data_0008;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA5 = *(word *)(DAT_data_0008 & 0xff);
        uVar6 = DAT_data_0008 + 1;
      }
      wVar3 = PA5;
      if ((wVar3 & DAT_data_0004) != 0) {
        wVar4 = PA6;
        *(word *)(wVar3 & 0xff) = wVar4;
      }
      PA2 = DAT_data_000f;
      PA7 = DAT_data_000f;
      PA4 = (word)((uint)((int)(short)DAT_data_0016 * 0x8000 + (int)(short)DAT_data_0017 * 0x8000)
                  >> 0x10);
      wVar3 = PA0;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA5 = *(word *)(uVar6 & 0xff);
        uVar6 = uVar6 + 1;
      }
      DAT_data_000f = DAT_data_000f - DAT_data_0046;
      DAT_data_0016 = PA7;
    }
    wVar3 = PA1;
    DAT_data_000e = -wVar3;
LAB_prog_096d:
    wVar3 = PA0;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA5 = *(word *)(uVar6 & 0xff);
      uVar6 = uVar6 + 1;
    }
    sVar5 = (DAT_data_0013 - uVar6) + DAT_data_0046;
    PA7 = sVar5 + DAT_data_000f;
    wVar3 = PA4;
    wVar3 = PA4;
    DAT_data_0013 = sVar5 - DAT_data_000e;
    wVar3 = PA0;
    uVar6 = DAT_data_0008;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA5 = *(word *)(DAT_data_0008 & 0xff);
      uVar6 = DAT_data_0008 + 1;
    }
    PA2 = DAT_data_000f;
    PA7 = DAT_data_000f;
    PA4 = (word)((uint)((int)(short)DAT_data_0016 * 0x8000 + (int)(short)DAT_data_0017 * 0x8000) >>
                0x10);
    wVar3 = PA0;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA5 = *(word *)(uVar6 & 0xff);
      uVar6 = uVar6 + 1;
    }
    DAT_data_000f = DAT_data_000f - DAT_data_0046;
    DAT_data_0016 = PA7;
    DAT_data_0015 = 0;
    do {
      wVar4 = PA7;
      wVar3 = PA0;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA5 = *(word *)(uVar6 & 0xff);
        uVar6 = uVar6 + 1;
      }
      DAT_data_0013 = (DAT_data_0013 - uVar6) + DAT_data_0046;
      PA7 = DAT_data_0013 + DAT_data_000f;
      wVar3 = PA4;
      wVar3 = PA4;
      PA7 = DAT_data_0013 + DAT_data_000f + DAT_data_000e;
      wVar3 = PA4;
      wVar3 = PA4;
      wVar3 = PA0;
      uVar6 = DAT_data_0008;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA5 = *(word *)(DAT_data_0008 & 0xff);
        uVar6 = DAT_data_0008 + 1;
      }
      PA2 = DAT_data_000f;
      PA7 = DAT_data_000f;
      PA4 = (word)((uint)((int)(short)DAT_data_0016 * 0x8000 + (int)(short)wVar4 * 0x8000) >> 0x10);
      wVar3 = PA0;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA5 = *(word *)(uVar6 & 0xff);
        uVar6 = uVar6 + 1;
      }
      DAT_data_000f = DAT_data_000f - DAT_data_0046;
      DAT_data_0016 = PA7;
      DAT_data_0015 =
           (ushort)((uint)DAT_data_0015 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
    } while ((uint)DAT_data_0015 * 0x10000 + (uint)DAT_data_000a * -0x10000 != 0);
  } while( true );
}


