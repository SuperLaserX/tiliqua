// 0110_program_01_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0110_program_01_dsp1 (ucode_0110_BigROM_0AF01.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  word wVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar10;
  word wVar11;
  word wVar12;
  word wVar13;
  uint uVar14;
  uint uVar15;
  ushort in_AR0;
  
  sData0000 = 1;
  DAT_data_0005 = 0x100;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  DAT_data_0007 = 0;
  DAT_data_0004 = 0;
  do {
    PA7 = DAT_data_0004;
    PA4 = DAT_data_0007;
    DAT_data_0004 = DAT_data_0004 + sData0000;
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0005) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    PA7 = DAT_data_0004;
    PA4 = DAT_data_0007;
    DAT_data_0004 = DAT_data_0004 + sData0000;
  } while (DAT_data_0004 != 0);
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0005) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    iVar1 = (int)(short)DAT_data_000a;
    DAT_data_000a = PA4;
    wVar3 = PA4;
    wVar4 = PA4;
    wVar5 = PA4;
    wVar6 = PA4;
    wVar7 = PA4;
    wVar8 = PA4;
    wVar9 = PA4;
    wVar10 = PA4;
    wVar11 = PA4;
    wVar12 = PA4;
    wVar13 = PA4;
    uVar14 = DAT_data_001e * iVar1 + (int)(short)wVar3 * (int)DAT_data_001f +
             (int)(short)wVar4 * (int)DAT_data_0020 + (int)(short)wVar5 * (int)DAT_data_0021 +
             (int)(short)wVar6 * (int)DAT_data_0022 + (int)(short)wVar7 * (int)DAT_data_0023 +
             (int)(short)wVar8 * (int)DAT_data_0024 + (int)(short)wVar9 * (int)DAT_data_0025 +
             (int)(short)wVar10 * (int)DAT_data_0026 + (int)(short)wVar11 * (int)DAT_data_0027 +
             (int)(short)wVar12 * (int)DAT_data_0028 + (int)(short)wVar13 * (int)DAT_data_0029;
    uVar15 = (int)(short)DAT_data_000a * (int)DAT_data_0032 + (int)(short)wVar3 * (int)DAT_data_0033
             + (int)(short)wVar4 * (int)DAT_data_0034 + (int)(short)wVar5 * (int)DAT_data_0035 +
             (int)(short)wVar6 * (int)DAT_data_0036 + (int)(short)wVar7 * (int)DAT_data_0037 +
             (int)(short)wVar8 * (int)DAT_data_0038 + (int)(short)wVar9 * (int)DAT_data_0039 +
             (int)(short)wVar10 * (int)DAT_data_003a + (int)(short)wVar11 * (int)DAT_data_003b +
             (int)(short)wVar12 * (int)DAT_data_003c + (int)(short)wVar13 * (int)DAT_data_003d;
    PA3 = *(word *)(in_AR0 & 0xff);
    PA1 = (word)(uVar14 + (uVar14 & 0xffff0000) + (uVar14 & 0xffff) >> 0x10);
    PA2 = (word)(uVar15 + (uVar15 & 0xffff0000) + (uVar15 & 0xffff) >> 0x10);
    in_AR0 = DAT_data_0040;
  } while( true );
}


