// 1412_program_14_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 1412_program_14_dsp3 (ucode_1412_ROM2_0E956.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  int iVar7;
  ushort uVar8;
  
  uVar8 = 0x8f;
  do {
    *(undefined2 *)(uVar8 & 0xff) = 0;
    uVar1 = uVar8 & 0x1ff;
    uVar8 = uVar8 - 1;
  } while (uVar1 != 0);
  sData0000 = 1;
  DAT_data_0004 = 0x400;
  DAT_data_0001 = 0x7fff;
  DAT_data_0024 = 0x11;
  DAT_data_0025 = 0xd;
  DAT_data_0003 = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0004) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    DAT_data_0003 = DAT_data_0003 + 0x15;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
    PA4 = DAT_data_0026;
  } while (0 < DAT_data_0003);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0004) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    PA7 = DAT_data_000f;
    PA7 = DAT_data_0010;
    PA7 = DAT_data_0011;
    PA7 = DAT_data_0009;
    PA1 = DAT_data_0022;
    PA7 = DAT_data_000a;
    PA7 = DAT_data_000b;
    wVar3 = DAT_data_0005 + DAT_data_0049 + DAT_data_005b;
    PA7 = DAT_data_0005;
    PA7 = DAT_data_000d;
    PA7 = DAT_data_000e;
    PA7 = DAT_data_0006;
    PA7 = DAT_data_0007;
    PA7 = DAT_data_0008;
    PA1 = DAT_data_001f;
    wVar4 = DAT_data_0005 + DAT_data_0058;
    wVar5 = DAT_data_0005 - sData0000;
    if ((int)((uint)DAT_data_005e - (uint)DAT_data_0058) < 1) {
      if ((int)((uint)DAT_data_005e - (uint)DAT_data_0058) < 0) {
        iVar7 = ((int)(short)DAT_data_0058 * 0x8000 + (uint)DAT_data_001e) - (int)DAT_data_0040;
        DAT_data_0058 = (ushort)((uint)(iVar7 * 2) >> 0x10);
        DAT_data_001e = (ushort)iVar7 & DAT_data_0001;
      }
      else {
        DAT_data_001e = (word)((uint)DAT_data_005e - (uint)DAT_data_0058 >> 0x10);
        iVar7 = (int)DAT_data_0024 * (int)DAT_data_0052;
        if (iVar7 < 0) {
          iVar7 = -iVar7;
        }
        DAT_data_005e = (ushort)((uint)((iVar7 + (int)DAT_data_004c * 0x8000) * 2) >> 0x10);
      }
    }
    else {
      iVar7 = (int)(short)DAT_data_0058 * 0x8000 + (uint)DAT_data_001e + (int)DAT_data_0040;
      DAT_data_0058 = (ushort)((uint)(iVar7 * 2) >> 0x10);
      DAT_data_001e = (ushort)iVar7 & DAT_data_0001;
      DAT_data_0025 = DAT_data_0024 + DAT_data_0025;
      DAT_data_0024 = DAT_data_0025 + DAT_data_0024;
    }
    if ((int)((uint)DAT_data_0061 - (uint)DAT_data_005b) < 1) {
      if ((int)((uint)DAT_data_0061 - (uint)DAT_data_005b) < 0) {
        iVar7 = ((int)(short)DAT_data_005b * 0x8000 + (uint)DAT_data_0021) - (int)DAT_data_0043;
        DAT_data_005b = (ushort)((uint)(iVar7 * 2) >> 0x10);
        DAT_data_0021 = (ushort)iVar7 & DAT_data_0001;
      }
      else {
        DAT_data_0021 = (word)((uint)DAT_data_0061 - (uint)DAT_data_005b >> 0x10);
        iVar7 = (int)DAT_data_0025 * (int)DAT_data_0055;
        if (iVar7 < 0) {
          iVar7 = -iVar7;
        }
        DAT_data_0061 = (ushort)((uint)((iVar7 + (int)DAT_data_004f * 0x8000) * 2) >> 0x10);
      }
    }
    else {
      iVar7 = (int)(short)DAT_data_005b * 0x8000 + (uint)DAT_data_0021 + (int)DAT_data_0043;
      DAT_data_005b = (ushort)((uint)(iVar7 * 2) >> 0x10);
      DAT_data_0021 = (ushort)iVar7 & DAT_data_0001;
      DAT_data_0025 = DAT_data_0024 + DAT_data_0025;
      DAT_data_0024 = DAT_data_0025 + DAT_data_0024;
    }
    DAT_data_0025 = DAT_data_0024 + DAT_data_0025;
    DAT_data_0024 = DAT_data_0025 + DAT_data_0024;
    PA7 = DAT_data_0005 + DAT_data_0049;
    PA7 = DAT_data_0005 + DAT_data_004a;
    PA7 = DAT_data_0005 + DAT_data_004b;
    PA7 = wVar3;
    PA1 = DAT_data_0023;
    PA7 = DAT_data_0005 + DAT_data_004a + DAT_data_005c;
    PA7 = DAT_data_0005 + DAT_data_004b + DAT_data_005d;
    wVar3 = wVar5 + DAT_data_004a + DAT_data_005c;
    PA7 = wVar5;
    PA7 = DAT_data_0005 + DAT_data_0047;
    PA7 = DAT_data_0005 + DAT_data_0048;
    PA7 = wVar4;
    PA7 = DAT_data_0005 + DAT_data_0047 + DAT_data_0059;
    PA7 = DAT_data_0005 + DAT_data_0048 + DAT_data_005a;
    PA1 = DAT_data_0020;
    wVar4 = wVar5 + DAT_data_0047 + DAT_data_0059;
    wVar6 = wVar5 - sData0000;
    if ((int)((uint)DAT_data_005f - (uint)DAT_data_0059) < 1) {
      if ((int)((uint)DAT_data_005f - (uint)DAT_data_0059) < 0) {
        iVar7 = ((int)(short)DAT_data_0059 * 0x8000 + (uint)DAT_data_001f) - (int)DAT_data_0041;
        DAT_data_0059 = (ushort)((uint)(iVar7 * 2) >> 0x10);
        DAT_data_001f = (ushort)iVar7 & DAT_data_0001;
      }
      else {
        DAT_data_001f = (word)((uint)DAT_data_005f - (uint)DAT_data_0059 >> 0x10);
        iVar7 = (int)DAT_data_0024 * (int)DAT_data_0053;
        if (iVar7 < 0) {
          iVar7 = -iVar7;
        }
        DAT_data_005f = (ushort)((uint)((iVar7 + (int)DAT_data_004d * 0x8000) * 2) >> 0x10);
      }
    }
    else {
      iVar7 = (int)(short)DAT_data_0059 * 0x8000 + (uint)DAT_data_001f + (int)DAT_data_0041;
      DAT_data_0059 = (ushort)((uint)(iVar7 * 2) >> 0x10);
      DAT_data_001f = (ushort)iVar7 & DAT_data_0001;
      DAT_data_0025 = DAT_data_0024 + DAT_data_0025;
      DAT_data_0024 = DAT_data_0025 + DAT_data_0024;
    }
    if ((int)((uint)DAT_data_0062 - (uint)DAT_data_005c) < 1) {
      if ((int)((uint)DAT_data_0062 - (uint)DAT_data_005c) < 0) {
        iVar7 = ((int)(short)DAT_data_005c * 0x8000 + (uint)DAT_data_0022) - (int)DAT_data_0044;
        DAT_data_005c = (ushort)((uint)(iVar7 * 2) >> 0x10);
        DAT_data_0022 = (ushort)iVar7 & DAT_data_0001;
      }
      else {
        DAT_data_0022 = (word)((uint)DAT_data_0062 - (uint)DAT_data_005c >> 0x10);
        iVar7 = (int)DAT_data_0025 * (int)DAT_data_0056;
        if (iVar7 < 0) {
          iVar7 = -iVar7;
        }
        DAT_data_0062 = (ushort)((uint)((iVar7 + (int)DAT_data_0050 * 0x8000) * 2) >> 0x10);
      }
    }
    else {
      iVar7 = (int)(short)DAT_data_005c * 0x8000 + (uint)DAT_data_0022 + (int)DAT_data_0044;
      DAT_data_005c = (ushort)((uint)(iVar7 * 2) >> 0x10);
      DAT_data_0022 = (ushort)iVar7 & DAT_data_0001;
      DAT_data_0025 = DAT_data_0024 + DAT_data_0025;
      DAT_data_0024 = DAT_data_0025 + DAT_data_0024;
    }
    DAT_data_0025 = DAT_data_0024 + DAT_data_0025;
    DAT_data_0024 = DAT_data_0025 + DAT_data_0024;
    PA7 = wVar5 + DAT_data_0049;
    PA7 = wVar5 + DAT_data_004a;
    PA7 = wVar5 + DAT_data_004b;
    PA7 = wVar5 + DAT_data_0049 + DAT_data_005b;
    PA1 = DAT_data_0021;
    PA7 = wVar3;
    DAT_data_000f = wVar6 + DAT_data_0049;
    PA7 = wVar5 + DAT_data_004b + DAT_data_005d;
    DAT_data_0009 = DAT_data_000f + DAT_data_005b;
    DAT_data_0010 = wVar6 + DAT_data_004a;
    DAT_data_000a = DAT_data_0010 + DAT_data_005c;
    PA7 = wVar6;
    PA7 = wVar5 + DAT_data_0047;
    PA7 = wVar5 + DAT_data_0048;
    PA7 = wVar5 + DAT_data_0058;
    PA7 = wVar4;
    DAT_data_0011 = wVar6 + DAT_data_004b;
    PA7 = wVar5 + DAT_data_0048 + DAT_data_005a;
    PA1 = DAT_data_001e;
    DAT_data_000b = DAT_data_0011 + DAT_data_005d;
    DAT_data_0006 = wVar6 + DAT_data_0058;
    DAT_data_000d = wVar6 + DAT_data_0047;
    DAT_data_0007 = DAT_data_000d + DAT_data_0059;
    DAT_data_000e = wVar6 + DAT_data_0048;
    DAT_data_0008 = DAT_data_000e + DAT_data_005a;
    DAT_data_0005 = wVar6 - sData0000;
    if ((int)((uint)DAT_data_0060 - (uint)DAT_data_005a) < 1) {
      if ((int)((uint)DAT_data_0060 - (uint)DAT_data_005a) < 0) {
        iVar7 = ((int)(short)DAT_data_005a * 0x8000 + (uint)DAT_data_0020) - (int)DAT_data_0042;
        DAT_data_005a = (ushort)((uint)(iVar7 * 2) >> 0x10);
        DAT_data_0020 = (ushort)iVar7 & DAT_data_0001;
      }
      else {
        DAT_data_0020 = (word)((uint)DAT_data_0060 - (uint)DAT_data_005a >> 0x10);
        iVar7 = (int)DAT_data_0024 * (int)DAT_data_0054;
        if (iVar7 < 0) {
          iVar7 = -iVar7;
        }
        DAT_data_0060 = (ushort)((uint)((iVar7 + (int)DAT_data_004e * 0x8000) * 2) >> 0x10);
      }
    }
    else {
      iVar7 = (int)(short)DAT_data_005a * 0x8000 + (uint)DAT_data_0020 + (int)DAT_data_0042;
      DAT_data_005a = (ushort)((uint)(iVar7 * 2) >> 0x10);
      DAT_data_0020 = (ushort)iVar7 & DAT_data_0001;
    }
    if ((int)((uint)DAT_data_0063 - (uint)DAT_data_005d) < 1) {
      if ((int)((uint)DAT_data_0063 - (uint)DAT_data_005d) < 0) {
        iVar7 = ((int)(short)DAT_data_005d * 0x8000 + (uint)DAT_data_0023) - (int)DAT_data_0045;
        DAT_data_005d = (ushort)((uint)(iVar7 * 2) >> 0x10);
        DAT_data_0023 = (ushort)iVar7 & DAT_data_0001;
      }
      else {
        DAT_data_0023 = (word)((uint)DAT_data_0063 - (uint)DAT_data_005d >> 0x10);
        iVar7 = (int)DAT_data_0024 * (int)DAT_data_0057;
        if (iVar7 < 0) {
          iVar7 = -iVar7;
        }
        DAT_data_0063 = (ushort)((uint)((iVar7 + (int)DAT_data_0051 * 0x8000) * 2) >> 0x10);
      }
    }
    else {
      iVar7 = (int)(short)DAT_data_005d * 0x8000 + (uint)DAT_data_0023 + (int)DAT_data_0045;
      DAT_data_005d = (ushort)((uint)(iVar7 * 2) >> 0x10);
      DAT_data_0023 = (ushort)iVar7 & DAT_data_0001;
    }
  } while( true );
}


