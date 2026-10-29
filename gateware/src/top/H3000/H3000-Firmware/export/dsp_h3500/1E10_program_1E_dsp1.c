// 1E10_program_1E_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 1E10_program_1E_dsp1 (ucode_1E10_ROM2_02214.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  ushort uVar5;
  char cVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar10;
  word wVar11;
  word wVar12;
  word wVar13;
  word wVar14;
  word wVar15;
  word wVar16;
  word wVar17;
  word wVar18;
  word wVar19;
  word wVar20;
  word wVar21;
  word wVar22;
  word wVar23;
  word wVar24;
  word wVar25;
  word wVar26;
  word wVar27;
  word wVar28;
  word wVar29;
  word wVar30;
  word wVar31;
  ushort uVar32;
  
  uVar32 = 0x8f;
  do {
    *(undefined2 *)(uVar32 & 0xff) = 0;
    uVar5 = uVar32 & 0x1ff;
    uVar32 = uVar32 - 1;
  } while (uVar5 != 0);
  sData0000 = 1;
  DAT_data_0003 = 0x100;
  DAT_data_0002 = 0;
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  wVar31 = PA0;
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  do {
    wVar31 = PA5;
    if ((wVar31 & DAT_data_0003) != 0) {
      wVar7 = PA6;
      *(word *)(wVar31 & 0xff) = wVar7;
    }
    PA7 = DAT_data_0002;
    PA7 = DAT_data_0002 + sData0000;
    wVar31 = DAT_data_0002 + sData0000 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    wVar31 = wVar31 + sData0000;
    PA7 = wVar31;
    DAT_data_0002 = wVar31 + sData0000;
  } while (-1 < (short)DAT_data_0002);
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  wVar31 = PA0;
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  do {
    wVar31 = PA1;
    wVar7 = PA2;
    wVar9 = PA4;
    wVar10 = PA4;
    wVar8 = PA4;
    wVar11 = PA4;
    wVar12 = PA4;
    wVar13 = PA4;
    wVar14 = PA4;
    wVar15 = PA4;
    wVar16 = PA4;
    wVar17 = PA4;
    wVar18 = PA4;
    wVar19 = PA4;
    iVar1 = (int)(short)DAT_data_0007;
    iVar2 = (int)(short)DAT_data_0007;
    iVar3 = (int)(short)DAT_data_000a;
    iVar4 = (int)(short)DAT_data_000a;
    PA3 = DAT_data_000b;
    PA3 = (word)((uint)((((int)(short)wVar31 * (int)(short)wVar11 -
                         (int)(short)wVar31 * (int)(short)wVar8) + (int)(short)wVar8 * 0x8000) * 2)
                >> 0x10);
    PA3 = (word)((uint)((int)(short)DAT_data_0023 * (int)DAT_data_000d * 2) >> 0x10);
    PA3 = (word)((uint)((int)(short)DAT_data_0023 * (int)DAT_data_000e * 2) >> 0x10);
    PA3 = (word)((uint)((int)(short)DAT_data_0023 * (int)DAT_data_000f * 2) >> 0x10);
    PA3 = (word)((uint)((int)(short)DAT_data_0023 * (int)DAT_data_0010 * 2) >> 0x10);
    wVar8 = PA3;
    DAT_data_0007 = PA1;
    DAT_data_000a = PA2;
    wVar11 = PA4;
    wVar20 = PA4;
    wVar21 = PA4;
    wVar22 = PA4;
    wVar23 = PA4;
    wVar24 = PA4;
    wVar25 = PA4;
    wVar26 = PA4;
    wVar27 = PA4;
    wVar28 = PA4;
    wVar29 = PA4;
    wVar30 = PA4;
    PA3 = (word)((uint)((((int)(short)DAT_data_0005 * (int)(short)wVar10 -
                         (int)(short)DAT_data_0005 * (int)(short)wVar9) + (int)(short)wVar9 * 0x8000
                        ) * 2) >> 0x10);
    PA3 = (word)((uint)((((int)(short)wVar31 * (int)(short)wVar22 -
                         (int)(short)wVar31 * (int)(short)wVar21) + (int)(short)wVar21 * 0x8000) * 2
                       ) >> 0x10);
    PA3 = (word)((uint)((int)(short)wVar8 *
                        (int)(short)((uint)(((iVar1 * (short)wVar13 - iVar2 * (short)wVar12) +
                                            (int)(short)wVar12 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    PA3 = (word)((uint)((int)(short)wVar8 *
                        (int)(short)((uint)((((int)(short)DAT_data_0008 * (int)(short)wVar15 -
                                             (int)(short)DAT_data_0008 * (int)(short)wVar14) +
                                            (int)(short)wVar14 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    PA3 = (word)((uint)((int)(short)wVar8 *
                        (int)(short)((uint)((((int)(short)wVar7 * (int)(short)wVar17 -
                                             (int)(short)wVar7 * (int)(short)wVar16) +
                                            (int)(short)wVar16 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    PA3 = (word)((uint)((int)(short)wVar8 *
                        (int)(short)((uint)(((iVar3 * (short)wVar19 - iVar4 * (short)wVar18) +
                                            (int)(short)wVar18 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    iVar1 = (int)(short)DAT_data_0005;
    iVar2 = (int)(short)DAT_data_0005;
    DAT_data_0023 = PA3;
    iVar3 = (int)(short)DAT_data_0008;
    iVar4 = (int)(short)DAT_data_0008;
    DAT_data_0005 = PA1;
    DAT_data_0008 = PA2;
    wVar8 = PA4;
    wVar9 = PA4;
    wVar10 = PA4;
    wVar12 = PA4;
    wVar13 = PA4;
    wVar14 = PA4;
    wVar15 = PA4;
    wVar16 = PA4;
    wVar17 = PA4;
    wVar18 = PA4;
    wVar19 = PA4;
    wVar21 = PA4;
    DAT_data_000d =
         (short)((uint)((((int)(short)DAT_data_0007 * (int)(short)wVar14 -
                         (int)(short)DAT_data_0007 * (int)(short)wVar13) +
                        (int)(short)wVar13 * 0x8000) * 2) >> 0x10);
    DAT_data_0010 =
         (short)((uint)((((int)(short)DAT_data_000a * (int)(short)wVar21 -
                         (int)(short)DAT_data_000a * (int)(short)wVar19) +
                        (int)(short)wVar19 * 0x8000) * 2) >> 0x10);
    DAT_data_000f =
         (short)((uint)((((int)(short)wVar7 * (int)(short)wVar18 -
                         (int)(short)wVar7 * (int)(short)wVar17) + (int)(short)wVar17 * 0x8000) * 2)
                >> 0x10);
    PA3 = (word)((uint)(((iVar1 * (short)wVar20 - iVar2 * (short)wVar11) +
                        (int)(short)wVar11 * 0x8000) * 2) >> 0x10);
    PA3 = (word)((uint)((((int)(short)wVar31 * (int)(short)wVar12 -
                         (int)(short)wVar31 * (int)(short)wVar10) + (int)(short)wVar10 * 0x8000) * 2
                       ) >> 0x10);
    PA3 = (word)((uint)((int)(short)DAT_data_0023 *
                        (int)(short)((uint)((((int)(short)DAT_data_0007 * (int)(short)wVar24 -
                                             (int)(short)DAT_data_0007 * (int)(short)wVar23) +
                                            (int)(short)wVar23 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    PA3 = (word)((uint)((int)(short)DAT_data_0023 *
                        (int)(short)((uint)(((iVar3 * (short)wVar26 - iVar4 * (short)wVar25) +
                                            (int)(short)wVar25 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    PA3 = (word)((uint)((int)(short)DAT_data_0023 *
                        (int)(short)((uint)((((int)(short)wVar7 * (int)(short)wVar28 -
                                             (int)(short)wVar7 * (int)(short)wVar27) +
                                            (int)(short)wVar27 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    PA3 = (word)((uint)((int)(short)DAT_data_0023 *
                        (int)(short)((uint)((((int)(short)DAT_data_000a * (int)(short)wVar30 -
                                             (int)(short)DAT_data_000a * (int)(short)wVar29) +
                                            (int)(short)wVar29 * 0x8000) * 2) >> 0x10) * 2) >> 0x10)
    ;
    DAT_data_000b =
         (word)((uint)((((int)(short)DAT_data_0005 * (int)(short)wVar9 -
                        (int)(short)DAT_data_0005 * (int)(short)wVar8) + (int)(short)wVar8 * 0x8000)
                      * 2) >> 0x10);
    DAT_data_000e =
         (short)((uint)((((int)(short)DAT_data_0008 * (int)(short)wVar16 -
                         (int)(short)DAT_data_0008 * (int)(short)wVar15) +
                        (int)(short)wVar15 * 0x8000) * 2) >> 0x10);
  } while( true );
}


