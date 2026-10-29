// 1410_program_14_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 1410_program_14_dsp1 (ucode_1410_BigROM_0BD2F.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  ushort uVar6;
  char cVar7;
  word wVar8;
  word wVar9;
  short sVar10;
  ushort uVar11;
  
  DAT_data_0008 = 1;
  DAT_data_0003 = 0x100;
  do {
    cVar7 = bio_pin();
  } while (cVar7 != '\0');
  wVar8 = PA0;
  do {
    cVar7 = bio_pin();
  } while (cVar7 == '\0');
  sVar10 = 0;
  DAT_data_0004 = 0;
  DAT_data_0005 = 0;
  DAT_data_0006 = 0;
  DAT_data_0007 = 0;
  do {
    DAT_data_000a = sVar10 + DAT_data_0008;
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0003) != 0) {
      wVar9 = PA6;
      *(word *)(wVar8 & 0xff) = wVar9;
    }
    sVar10 = DAT_data_000a + DAT_data_0008;
  } while (sVar10 != 0);
  uVar11 = 2;
  do {
    cVar7 = bio_pin();
  } while (cVar7 != '\0');
  wVar8 = PA0;
  do {
    cVar7 = bio_pin();
  } while (cVar7 == '\0');
  do {
    wVar8 = PA5;
    if ((wVar8 & DAT_data_0003) != 0) {
      wVar9 = PA6;
      *(word *)(wVar8 & 0xff) = wVar9;
    }
    while( true ) {
      DAT_data_000b =
           (word)((uint)((((int)sData0000 * (int)(short)DAT_data_0011 -
                          (int)sData0000 * (int)(short)DAT_data_000e) +
                         (int)(short)DAT_data_000e * 0x8000) * 2) >> 0x10);
      DAT_data_000c =
           (word)((uint)((((int)DAT_data_0002 * (int)(short)DAT_data_0012 -
                          (int)DAT_data_0002 * (int)(short)DAT_data_000f) +
                         (int)(short)DAT_data_000f * 0x8000) * 2) >> 0x10);
      DAT_data_000d =
           (word)((uint)((((int)DAT_data_0001 * (int)(short)DAT_data_0013 -
                          (int)DAT_data_0001 * (int)(short)DAT_data_0010) +
                         (int)(short)DAT_data_0010 * 0x8000) * 2) >> 0x10);
      uVar1 = (uint)DAT_data_0014;
      PA4 = DAT_data_0005;
      PA4 = DAT_data_0006;
      PA4 = DAT_data_0007;
      iVar4 = (int)(short)DAT_data_000b;
      iVar5 = (int)DAT_data_0040;
      DAT_data_000e = PA4;
      DAT_data_0011 = PA4;
      DAT_data_000f = PA4;
      DAT_data_0012 = PA4;
      DAT_data_0010 = PA4;
      DAT_data_0013 = PA4;
      wVar8 = PA1;
      *(word *)(uVar11 & 0xff) = wVar8;
      uVar2 = (uint)DAT_data_0015;
      DAT_data_0005 =
           (word)((uint)DAT_data_0004 * 0x10000 + (int)(short)DAT_data_000b * (int)DAT_data_0046 * 2
                 >> 0x10);
      DAT_data_0006 =
           (word)((uint)DAT_data_0004 * 0x10000 + (int)(short)DAT_data_000c * (int)DAT_data_0047 * 2
                 >> 0x10);
      uVar3 = (uint)DAT_data_0004;
      DAT_data_0014 = PA1;
      DAT_data_0015 = PA1;
      PA6 = (word)(uVar1 * 0x10000 + iVar4 * iVar5 * 2 +
                   (int)(short)DAT_data_000c * (int)DAT_data_0041 * 2 +
                   (int)(short)DAT_data_000d * (int)DAT_data_0042 * 2 >> 0x10);
      PA5 = (word)(uVar2 * 0x10000 + (int)(short)DAT_data_000b * (int)DAT_data_0043 * 2 +
                   (int)(short)DAT_data_000c * (int)DAT_data_0044 * 2 +
                   (int)(short)DAT_data_000d * (int)DAT_data_0045 * 2 >> 0x10);
      DAT_data_0004 = PA7;
      DAT_data_0007 =
           (word)(uVar3 * 0x10000 + (int)(short)DAT_data_000d * (int)DAT_data_0048 * 2 >> 0x10);
      uVar6 = uVar11 & 0x1ff;
      uVar11 = uVar11 - 1;
      if (uVar6 != 0) break;
      while (uVar11 = 2, DAT_data_004a == 0) {
        uVar11 = 2;
        while( true ) {
          DAT_data_000b =
               (word)((uint)((((int)sData0000 * (int)(short)DAT_data_0011 -
                              (int)sData0000 * (int)(short)DAT_data_000e) +
                             (int)(short)DAT_data_000e * 0x8000) * 2) >> 0x10);
          DAT_data_000c =
               (word)((uint)((((int)DAT_data_0002 * (int)(short)DAT_data_0012 -
                              (int)DAT_data_0002 * (int)(short)DAT_data_000f) +
                             (int)(short)DAT_data_000f * 0x8000) * 2) >> 0x10);
          DAT_data_000d =
               (word)((uint)((((int)DAT_data_0001 * (int)(short)DAT_data_0013 -
                              (int)DAT_data_0001 * (int)(short)DAT_data_0010) +
                             (int)(short)DAT_data_0010 * 0x8000) * 2) >> 0x10);
          uVar1 = (uint)DAT_data_0014;
          PA4 = DAT_data_0005;
          PA4 = DAT_data_0006;
          PA4 = DAT_data_0007;
          iVar4 = (int)(short)DAT_data_000b;
          iVar5 = (int)DAT_data_0040;
          DAT_data_000e = PA4;
          DAT_data_0011 = PA4;
          DAT_data_000f = PA4;
          DAT_data_0012 = PA4;
          DAT_data_0010 = PA4;
          DAT_data_0013 = PA4;
          wVar8 = PA1;
          *(word *)(uVar11 & 0xff) = wVar8;
          uVar2 = (uint)DAT_data_0015;
          DAT_data_0005 = DAT_data_000b;
          DAT_data_0006 = DAT_data_000c;
          DAT_data_0007 = DAT_data_000d;
          DAT_data_0014 = PA1;
          DAT_data_0015 = PA1;
          PA6 = (word)(uVar1 * 0x10000 + iVar4 * iVar5 * 2 +
                       (int)(short)DAT_data_000c * (int)DAT_data_0041 * 2 +
                       (int)(short)DAT_data_000d * (int)DAT_data_0042 * 2 >> 0x10);
          PA5 = (word)(uVar2 * 0x10000 + (int)(short)DAT_data_000b * (int)DAT_data_0043 * 2 +
                       (int)(short)DAT_data_000c * (int)DAT_data_0044 * 2 +
                       (int)(short)DAT_data_000d * (int)DAT_data_0045 * 2 >> 0x10);
          DAT_data_0004 = PA7;
          uVar6 = uVar11 & 0x1ff;
          uVar11 = uVar11 - 1;
          if (uVar6 == 0) break;
          wVar8 = PA5;
          if ((wVar8 & DAT_data_0003) != 0) {
            wVar9 = PA6;
            *(word *)(wVar8 & 0xff) = wVar9;
          }
        }
      }
    }
  } while( true );
}


