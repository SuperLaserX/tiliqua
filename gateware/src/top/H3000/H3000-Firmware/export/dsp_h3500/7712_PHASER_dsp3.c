// 7712_PHASER_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* WARNING: Removing unreachable block (prog,0x08d8) */
/* WARNING: Removing unreachable block (prog,0x08d1) */
/* WARNING: Removing unreachable block (prog,0x0913) */
/* Eventide H3000/H3500 DSP program 7712_PHASER_dsp3 (ucode_7712_ROM4_3A04B.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  short sVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  ushort uVar9;
  
  uVar9 = 0x8f;
  do {
    *(undefined2 *)(uVar9 & 0xff) = 0;
    uVar8 = CONCAT22(DAT_data_001c,DAT_data_001d);
    uVar2 = uVar9 & 0x1ff;
    uVar9 = uVar9 - 1;
  } while (uVar2 != 0);
  DAT_data_0035 = 0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  wVar4 = PA0;
  do {
    cVar3 = bio_pin();
    uVar5 = CONCAT22(DAT_data_001a,DAT_data_001b);
  } while (cVar3 != '\0');
  do {
    wVar4 = PA7;
    DAT_data_001c = (ushort)(uVar8 >> 0x10);
    DAT_data_001a = (ushort)(uVar5 >> 0x10);
    uVar6 = (uint)wVar4 * 0x10000;
    if ((int)uVar6 < 0) {
      uVar6 = (uint)wVar4 * -0x10000;
    }
    if ((int)(uVar6 + (uint)DAT_data_001a * -0x10000) < 0) {
      if (DAT_data_002c == 0) {
        uVar6 = ((uint)DAT_data_001a * 0x10000 + (uVar5 & 0xffff)) - 0x3fff8;
      }
      else {
        uVar6 = (uint)DAT_data_001a * 0x10000 + (uVar5 & 0xffff) +
                (int)(short)((uint)((int)(short)DAT_data_001a * 0x7fff) >> 0x10) * -0x10;
      }
    }
    DAT_data_001a = (ushort)(uVar6 >> 0x10);
    iVar7 = (int)DAT_data_0035;
    if (iVar7 == 0) {
      uVar8 = ((uint)DAT_data_001c * 0x10000 + (uVar8 & 0xffff)) - 0xfffc0;
      if ((int)uVar8 < 0) {
        uVar8 = 0;
      }
      if (-1 < (int)((uint)DAT_data_001a * 0x10000 + (uVar6 & 0xffff) + -0x3fff0000)) {
        DAT_data_0035 = 1;
      }
    }
    else if (iVar7 == 2) {
      iVar7 = (uint)DAT_data_001c * 0x10000 + (uVar8 & 0xffff);
      uVar8 = iVar7 - 0x1fc0;
      if (iVar7 + -0x1fff1fc0 < 1) {
        DAT_data_0035 = 3;
      }
    }
    else if (iVar7 + -2 < 0) {
      iVar7 = (uint)DAT_data_001c * 0x10000 + (uVar8 & 0xffff);
      uVar8 = iVar7 + 0x1fc0;
      if (-1 < iVar7 + -0x7ffee040) {
        DAT_data_0035 = 2;
      }
    }
    else {
      uVar8 = 0x1fff0000;
      if ((int)((uint)DAT_data_001a * 0x10000 + (uVar6 & 0xffff) + -0x7ff0000) < 1) {
        DAT_data_0035 = 0;
        uVar8 = 0x1fff0000;
      }
    }
    sVar1 = (short)(((uint)wData0000 * 0x10000 -
                    (int)(short)DAT_data_001a * (int)(short)DAT_data_001a) * 2 >> 0x10);
    if (DAT_data_007d < 1) {
      wVar4 = PA5;
      wData0000 = PA6;
    }
    else {
      wVar4 = PA5;
      wData0000 = PA6;
      DAT_data_0035 = 1;
      DAT_data_007d = 0;
    }
    PA1 = (word)((uint)DAT_prog_0915 * 0x10000 + (int)sVar1 * (int)DAT_prog_0918 * 2 >> 0x10);
    PA1 = (word)((uint)DAT_prog_0916 * 0x10000 + (int)sVar1 * (int)DAT_prog_0919 * 2 >> 0x10);
    PA1 = (word)((uint)DAT_prog_0917 * 0x10000 + (int)sVar1 * (int)DAT_prog_091a * 2 >> 0x10);
    wVar4 = PA7;
    uVar5 = uVar6;
  } while( true );
}


