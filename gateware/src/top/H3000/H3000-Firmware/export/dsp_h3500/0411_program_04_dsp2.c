// 0411_program_04_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0411_program_04_dsp2 (ucode_0411_ROM2_0ED66.bin)
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
  DAT_data_0047 = 1;
  DAT_data_0004 = 0x200;
  DAT_data_0005 = 4;
  DAT_data_0008 = 0;
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
  DAT_data_0015 = 0x100;
  sVar5 = 0;
  do {
    DAT_data_0003 = sVar5 + DAT_data_0006;
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0004) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    sVar5 = DAT_data_0003 + DAT_data_0006;
  } while (sVar5 != 0);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  wVar3 = PA0;
  if (((uint)DAT_data_0043 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) ||
     ((uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0)) {
    uVar1 = *(undefined2 *)(DAT_data_0006 * 0x86e & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x900 & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9c5 & 0xfff) = uVar1;
  }
  if (((uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) ||
     ((uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0)) {
    DAT_data_0011 = DAT_data_0006 << 0xf;
    uVar1 = *(undefined2 *)(DAT_data_0006 * 0x885 & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x910 & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x964 & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9d5 & 0xfff) = uVar1;
  }
  else {
    DAT_data_0011 = 0;
  }
  if ((uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) {
    *(undefined2 *)(DAT_data_0006 * 0x8fc & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x89c & 0xfff);
  }
  if ((uint)DAT_data_0046 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) {
    uVar1 = *(undefined2 *)(DAT_data_0006 * 0x8ab & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x92b & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x97f & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9f0 & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9fd & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8ac & 0xfff);
    uVar1 = *(undefined2 *)(DAT_data_0006 * 0x8ad & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x93c & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9fa & 0xfff) = uVar1;
    uVar1 = *(undefined2 *)(DAT_data_0006 * 0x8ae & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x93d & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x9fb & 0xfff) = uVar1;
    *(undefined2 *)(DAT_data_0006 * 0x989 & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8af & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x98a & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8b0 & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x98c & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8b1 & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x98d & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8b2 & 0xfff);
    DAT_data_0041 = 0;
  }
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  do {
    cVar2 = bio_pin();
    uVar6 = 0;
  } while (cVar2 == '\0');
  do {
    wVar3 = PA3;
    if ((int)((uint)DAT_data_0015 - (uint)DAT_data_0041) < 0) {
      wVar3 = PA3;
      DAT_data_000e = -wVar3;
LAB_prog_09ca:
      wVar3 = PA0;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA6 = *(word *)(uVar6 & 0xff);
        uVar6 = uVar6 + 1;
      }
      wVar3 = PA7;
      wVar3 = PA2;
      PA7 = DAT_data_0010;
      wVar4 = PA7;
      DAT_data_0010 = wVar3 + DAT_data_0011;
      DAT_data_0017 = 0;
      wVar3 = PA0;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA6 = *(word *)(uVar6 & 0xff);
        uVar6 = uVar6 + 1;
      }
      sVar5 = (DAT_data_0015 - uVar6) + DAT_data_0047;
      PA7 = sVar5 + DAT_data_0010;
      wVar3 = PA4;
      wVar3 = PA4;
      DAT_data_0015 = sVar5 - DAT_data_000e;
      wVar3 = PA0;
      uVar6 = DAT_data_0008;
      if ((DAT_data_0005 & wVar3) != 0) {
        PA6 = *(word *)(DAT_data_0008 & 0xff);
        uVar6 = DAT_data_0008 + 1;
      }
      do {
        wVar3 = PA0;
        if ((DAT_data_0005 & wVar3) != 0) {
          PA6 = *(word *)(uVar6 & 0xff);
          uVar6 = uVar6 + 1;
        }
        wVar3 = PA7;
        wVar3 = PA2;
        PA7 = DAT_data_0010;
        wVar4 = PA7;
        DAT_data_0010 = wVar3 + DAT_data_0011;
        DAT_data_0017 =
             (ushort)((uint)DAT_data_0017 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
        wVar3 = PA0;
        if ((DAT_data_0005 & wVar3) != 0) {
          PA6 = *(word *)(uVar6 & 0xff);
          uVar6 = uVar6 + 1;
        }
        DAT_data_0015 = (DAT_data_0015 - uVar6) + DAT_data_0047;
        PA7 = DAT_data_0015 + DAT_data_0010;
        wVar3 = PA4;
        wVar3 = PA4;
        PA7 = DAT_data_0015 + DAT_data_0010 + DAT_data_000e;
        wVar3 = PA4;
        wVar3 = PA4;
        wVar3 = PA0;
        uVar6 = DAT_data_0008;
        if ((DAT_data_0005 & wVar3) != 0) {
          PA6 = *(word *)(DAT_data_0008 & 0xff);
          uVar6 = DAT_data_0008 + 1;
        }
      } while ((uint)DAT_data_0017 * 0x10000 + (uint)DAT_data_000a * -0x10000 != 0);
    }
    else {
      DAT_data_000e = PA3;
      if (0 < (int)(((uint)DAT_data_0015 - (uint)DAT_data_0041) - (uint)DAT_data_000e))
      goto LAB_prog_09ca;
    }
    wVar3 = PA0;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA6 = *(word *)(uVar6 & 0xff);
      uVar6 = uVar6 + 1;
    }
    wVar3 = PA7;
    wVar3 = PA2;
    PA7 = DAT_data_0010;
    wVar4 = PA7;
    DAT_data_0010 = wVar3 + DAT_data_0011;
    wVar3 = PA0;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA6 = *(word *)(uVar6 & 0xff);
      uVar6 = uVar6 + 1;
    }
    DAT_data_0012 = (DAT_data_0015 - uVar6) + DAT_data_0047 + DAT_data_0010;
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0004) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    PA7 = DAT_data_0012;
    wVar3 = PA4;
    wVar3 = PA4;
    DAT_data_0015 = DAT_data_0012 - DAT_data_0010;
    wVar3 = PA0;
    uVar6 = DAT_data_0008;
    if ((DAT_data_0005 & wVar3) != 0) {
      PA6 = *(word *)(DAT_data_0008 & 0xff);
      uVar6 = DAT_data_0008 + 1;
    }
  } while( true );
}


