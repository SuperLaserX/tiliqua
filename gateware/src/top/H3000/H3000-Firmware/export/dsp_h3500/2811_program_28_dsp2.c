// 2811_program_28_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 2811_program_28_dsp2 (ucode_2811_ROM2_01CC8.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  ushort uVar2;
  char cVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar10;
  word wVar14;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar15;
  int iVar16;
  int iVar17;
  ushort uVar18;
  short *psVar19;
  
  uVar18 = 0x8f;
  do {
    *(undefined2 *)(uVar18 & 0xff) = 0;
    uVar2 = uVar18 & 0x1ff;
    uVar18 = uVar18 - 1;
  } while (uVar2 != 0);
  psVar19 = (short *)0x0;
  sData0000 = 1;
  DAT_data_0003 = 0x200;
  DAT_data_0004 = 0xc000;
  DAT_data_0002 = 0x7fff;
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  wVar14 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
  do {
    wVar14 = PA5;
    if ((wVar14 & DAT_data_0003) != 0) {
      wVar4 = PA6;
      *(word *)(wVar14 & 0xff) = wVar4;
    }
    PA7 = DAT_data_0002 + sData0000;
    wVar14 = DAT_data_0002 + sData0000 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    wVar14 = wVar14 + sData0000;
    PA7 = wVar14;
    DAT_data_0002 = wVar14 + sData0000;
    PA7 = DAT_data_0002;
  } while ((short)DAT_data_0002 < 0);
  do {
    cVar3 = bio_pin();
  } while (cVar3 != '\0');
  DAT_data_0001 = PA0;
  do {
    cVar3 = bio_pin();
  } while (cVar3 == '\0');
LAB_prog_0886:
  do {
    DAT_data_0006 = DAT_data_0001;
    do {
      while( true ) {
        iVar15 = (int)(short)DAT_data_0014 * (int)*(short *)((ushort)(psVar19 + -1) & 0xff);
        iVar11 = (int)DAT_data_0019 * (int)*psVar19 * 2 + iVar15;
        uVar18 = (ushort)((iVar11 + (uint)DAT_data_0014 * 0x10000) - iVar15 >> 0x10);
        PA4 = DAT_data_0009;
        PA4 = DAT_data_000a;
        wVar4 = PA1;
        PA4 = DAT_data_000b;
        wVar7 = PA2;
        PA4 = DAT_data_000c;
        iVar16 = (int)(short)DAT_data_001d * (int)DAT_data_004d;
        PA4 = DAT_data_000d;
        wVar14 = PA0;
        PA4 = DAT_data_000e;
        wVar5 = PA1;
        PA4 = DAT_data_0005;
        wVar8 = PA2;
        wVar10 = PA4;
        wVar6 = PA1;
        wVar9 = PA2;
        iVar15 = iVar16 + (int)(short)wVar4 * 0x4000 + (int)(short)wVar7 * 0x4000 +
                 (int)(short)wVar5 * 0x8000 + (int)(short)DAT_data_001a * 0x8000 +
                 (int)(short)wVar6 * 0x8000 + (int)(short)uVar18 * 0x8000;
        iVar12 = iVar16 + (int)(short)wVar4 * 0x8000 + (int)(short)wVar7 * 0x8000 +
                 (int)(short)wVar5 * 0x4000 + (int)(short)DAT_data_001a * 0x4000 +
                 (int)(short)wVar6 * -0x8000 + (int)(short)uVar18 * -0x8000;
        iVar16 = iVar16 + (int)(short)wVar4 * -0x8000 + (int)(short)wVar7 * 0x8000 +
                 (int)(short)wVar5 * -0x8000 + (int)(short)DAT_data_001a * 0x8000 +
                 (int)(short)wVar6 * 0x4000 + (int)(short)uVar18 * -0x4000;
        iVar17 = (int)(short)wVar8 * (int)*(short *)((ushort)(psVar19 + -1) & 0xff);
        iVar13 = (int)DAT_data_0018 * (int)*psVar19 * 2 + iVar17;
        uVar2 = (ushort)((iVar13 + (uint)wVar8 * 0x10000) - iVar17 >> 0x10);
        wVar8 = PA7;
        iVar17 = (int)(short)wVar9 * (int)*(short *)((ushort)(psVar19 + -1) & 0xff);
        iVar11 = (int)(short)((uint)iVar11 >> 0x10) * (int)*psVar19 * 2 + iVar17;
        uVar1 = (ushort)((iVar11 + (uint)wVar9 * 0x10000) - iVar17 >> 0x10);
        if ((sData0000 << 1 & wVar14) == 0) {
          if ((int)((uint)DAT_data_001f << 0x10) < 1) {
            PA0 = DAT_data_0004;
            PA3 = DAT_data_0007;
            DAT_data_0008 = DAT_data_0007;
          }
          else {
            DAT_data_0008 = DAT_data_0007;
          }
        }
        PA4 = (word)((uint)iVar15 >> 0x10);
        DAT_data_0007 =
             (word)((uint)DAT_data_0006 * 0x10000 + (uint)DAT_data_004b * -0x10000 >> 0x10);
        PA4 = (word)((uint)iVar12 >> 0x10);
        wVar14 = PA1;
        PA4 = (word)(iVar15 + (int)(short)wVar4 * -0x8000 + (uint)DAT_data_001a * -0x10000 +
                     (uint)uVar18 * -0x10000 >> 0x10);
        wVar9 = PA2;
        PA4 = (word)(iVar12 + (uint)wVar4 * -0x10000 + (int)(short)DAT_data_001a * -0x8000 +
                     (uint)uVar18 * 0x10000 >> 0x10);
        PA4 = (word)((uint)iVar16 >> 0x10);
        DAT_data_001f =
             (ushort)((uint)((int)(short)DAT_data_0007 * (int)(short)DAT_data_0008) >> 0x10);
        PA4 = (word)(iVar16 + (uint)wVar7 * -0x10000 + (uint)wVar5 * 0x10000 +
                     (int)(short)wVar6 * -0x8000 >> 0x10);
        wVar4 = PA1;
        iVar12 = (int)(short)wVar10 * (int)DAT_data_004d;
        PA4 = wVar8;
        wVar6 = PA2;
        DAT_data_001d = PA4;
        wVar5 = PA1;
        wVar7 = PA2;
        iVar15 = iVar12 + (int)(short)wVar14 * 0x4000 + (int)(short)wVar9 * 0x4000 +
                 (int)(short)wVar4 * 0x8000 + (int)(short)uVar2 * 0x8000 +
                 (int)(short)wVar5 * 0x8000 + (int)(short)uVar1 * 0x8000;
        DAT_data_0009 = (word)((uint)iVar15 >> 0x10);
        DAT_data_000b =
             (word)(iVar15 + (int)(short)wVar14 * -0x8000 + (uint)uVar2 * -0x10000 +
                    (uint)uVar1 * -0x10000 >> 0x10);
        iVar15 = iVar12 + (int)(short)wVar14 * 0x8000 + (int)(short)wVar9 * 0x8000 +
                 (int)(short)wVar4 * 0x4000 + (int)(short)uVar2 * 0x4000 +
                 (int)(short)wVar5 * -0x8000 + (int)(short)uVar1 * -0x8000;
        DAT_data_000a = (word)((uint)iVar15 >> 0x10);
        DAT_data_000c =
             (word)(iVar15 + (uint)wVar14 * -0x10000 + (int)(short)uVar2 * -0x8000 +
                    (uint)uVar1 * 0x10000 >> 0x10);
        iVar15 = iVar12 + (int)(short)wVar14 * -0x8000 + (int)(short)wVar9 * 0x8000 +
                 (int)(short)wVar4 * -0x8000 + (int)(short)uVar2 * 0x8000 +
                 (int)(short)wVar5 * 0x4000 + (int)(short)uVar1 * -0x4000;
        DAT_data_000d = (word)((uint)iVar15 >> 0x10);
        DAT_data_000e =
             (word)(iVar15 + (uint)wVar9 * -0x10000 + (uint)wVar4 * 0x10000 +
                    (int)(short)wVar5 * -0x8000 >> 0x10);
        iVar12 = (int)(short)wVar6 * (int)*(short *)((ushort)(psVar19 + -1) & 0xff);
        iVar15 = (int)(short)((uint)iVar13 >> 0x10) * (int)*psVar19 * 2 + iVar12;
        DAT_data_0018 = (short)((uint)iVar15 >> 0x10);
        DAT_data_0005 = PA7;
        DAT_data_001a = (ushort)((iVar15 + (uint)wVar6 * 0x10000) - iVar12 >> 0x10);
        iVar15 = (int)(short)wVar7 * (int)*(short *)((ushort)(psVar19 + -1) & 0xff);
        iVar11 = (int)(short)((uint)iVar11 >> 0x10) * (int)*psVar19 * 2 + iVar15;
        DAT_data_0019 = (short)((uint)iVar11 >> 0x10);
        DAT_data_001b = (ushort)((iVar11 + (uint)wVar7 * 0x10000) - iVar15 >> 0x10);
        wVar14 = PA5;
        if ((wVar14 & DAT_data_0003) != 0) {
          wVar4 = PA6;
          *(word *)(wVar14 & 0xff) = wVar4;
        }
        iVar11 = (uint)DAT_data_001d * 0x10000;
        if (iVar11 < 0) {
          iVar11 = (uint)DAT_data_001d * -0x10000;
        }
        PA4 = DAT_data_0009;
        DAT_data_0001 = (word)((uint)iVar11 >> 0x10);
        PA4 = DAT_data_000a;
        wVar14 = PA1;
        PA4 = DAT_data_000b;
        wVar6 = PA2;
        PA4 = DAT_data_000c;
        iVar15 = (int)(short)DAT_data_001d * (int)DAT_data_004d;
        PA4 = DAT_data_000d;
        PA4 = DAT_data_000e;
        wVar4 = PA1;
        PA4 = DAT_data_0005;
        wVar7 = PA2;
        DAT_data_001d = PA4;
        wVar5 = PA1;
        DAT_data_0014 = PA2;
        iVar11 = iVar15 + (int)(short)wVar14 * 0x4000 + (int)(short)wVar6 * 0x4000 +
                 (int)(short)wVar4 * 0x8000 + (int)(short)DAT_data_001a * 0x8000 +
                 (int)(short)wVar5 * 0x8000 + (int)(short)DAT_data_001b * 0x8000;
        DAT_data_0009 = (word)((uint)iVar11 >> 0x10);
        DAT_data_000b =
             (word)(iVar11 + (int)(short)wVar14 * -0x8000 + (uint)DAT_data_001a * -0x10000 +
                    (uint)DAT_data_001b * -0x10000 >> 0x10);
        iVar11 = iVar15 + (int)(short)wVar14 * 0x8000 + (int)(short)wVar6 * 0x8000 +
                 (int)(short)wVar4 * 0x4000 + (int)(short)DAT_data_001a * 0x4000 +
                 (int)(short)wVar5 * -0x8000 + (int)(short)DAT_data_001b * -0x8000;
        DAT_data_000a = (word)((uint)iVar11 >> 0x10);
        DAT_data_000c =
             (word)(iVar11 + (uint)wVar14 * -0x10000 + (int)(short)DAT_data_001a * -0x8000 +
                    (uint)DAT_data_001b * 0x10000 >> 0x10);
        iVar11 = iVar15 + (int)(short)wVar14 * -0x8000 + (int)(short)wVar6 * 0x8000 +
                 (int)(short)wVar4 * -0x8000 + (int)(short)DAT_data_001a * 0x8000 +
                 (int)(short)wVar5 * 0x4000 + (int)(short)DAT_data_001b * -0x4000;
        DAT_data_000d = (word)((uint)iVar11 >> 0x10);
        DAT_data_000e =
             (word)(iVar11 + (uint)wVar6 * -0x10000 + (uint)wVar4 * 0x10000 +
                    (int)(short)wVar5 * -0x8000 >> 0x10);
        iVar15 = (int)(short)wVar7 * (int)*(short *)((ushort)(psVar19 + -1) & 0xff);
        iVar11 = (int)DAT_data_0018 * (int)*psVar19 * 2 + iVar15;
        DAT_data_0018 = (short)((uint)iVar11 >> 0x10);
        DAT_data_001a = (ushort)((iVar11 + (uint)wVar7 * 0x10000) - iVar15 >> 0x10);
        if (DAT_data_004a != 0) break;
        DAT_data_0005 = PA7;
        psVar19 = &DAT_data_0041;
        DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_0001 * (int)DAT_data_004c * 2) >> 0x10)
        ;
        if ((int)(short)DAT_data_0001 * (int)DAT_data_004c + (int)(short)DAT_data_0001 * -0x8000 < 0
           ) goto LAB_prog_0886;
      }
      DAT_data_0005 = PA7;
      psVar19 = &DAT_data_0046;
      DAT_data_0006 = (ushort)((uint)((int)(short)DAT_data_0001 * (int)DAT_data_004c * 2) >> 0x10);
    } while (-1 < (int)(short)DAT_data_0001 * (int)DAT_data_004c +
                  (int)(short)DAT_data_0001 * -0x8000);
  } while( true );
}


