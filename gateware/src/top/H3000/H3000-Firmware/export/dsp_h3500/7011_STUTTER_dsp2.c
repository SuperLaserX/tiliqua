// 7011_STUTTER_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7011_STUTTER_dsp2 (ucode_7011_ROM4_37B41.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  bool bVar2;
  bool bVar3;
  uint uVar4;
  char cVar5;
  word wVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  uint uVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  ushort uVar21;
  byte in_OV;
  byte bVar22;
  
  DAT_data_0008 = 1;
  DAT_data_0047 = 1;
  DAT_data_0006 = 0x200;
  DAT_data_0007 = 8;
  DAT_data_000b = 0x4000;
  DAT_data_000d = 0x8000;
  DAT_data_000a = 0;
  DAT_data_0011 = 0;
  DAT_data_0022 = 0;
  DAT_data_0049 = 0;
  DAT_data_0009 = 0xffff;
  DAT_data_0014 = 0xff;
  DAT_data_0041 = 0xff;
  DAT_data_0042 = 0xff;
  DAT_data_000f = 0xff;
  DAT_data_0002 = 0xff;
  DAT_data_000c = 0x7fff;
  uVar21 = 0;
  DAT_data_0015 = DAT_data_000c;
  DAT_data_0016 = DAT_data_000c;
  DAT_data_0021 = DAT_data_0009;
  FUN_prog_099e();
  do {
    cVar5 = bio_pin();
  } while (cVar5 != '\0');
  wVar6 = PA0;
  do {
    cVar5 = bio_pin();
  } while (cVar5 == '\0');
LAB_prog_0832:
  do {
    DAT_data_0017 = PA7;
    in_OV = in_OV | SBORROW4((uint)DAT_data_0014,(uint)DAT_data_0022);
    iVar10 = (uint)DAT_data_0014 - (uint)DAT_data_0022;
    if (iVar10 < 0) {
      wVar6 = PA1;
      in_OV = in_OV | SBORROW4(0,(uint)wVar6 * 0x10000);
      DAT_data_0010 = (word)((uint)wVar6 * -0x10000 >> 0x10);
LAB_prog_0949:
      wVar6 = PA0;
      if ((DAT_data_0007 & wVar6) != 0) {
        PA5 = *(word *)(uVar21 & 0xff);
        uVar21 = uVar21 + 1;
      }
      uVar19 = (uint)DAT_data_0014;
      uVar14 = (uint)uVar21;
      iVar10 = uVar19 - uVar14;
      uVar20 = iVar10 + (uint)DAT_data_0047;
      PA7 = (short)uVar20 + DAT_data_0011;
      wVar6 = PA4;
      wVar6 = PA4;
      DAT_data_0014 = (short)uVar20 - DAT_data_0010;
      wVar6 = PA0;
      uVar21 = DAT_data_000a;
      if ((DAT_data_0007 & wVar6) != 0) {
        PA5 = *(word *)(DAT_data_000a & 0xff);
        uVar21 = DAT_data_000a + 1;
      }
      iVar12 = (int)(short)DAT_data_0018;
      DAT_data_0018 = PA7;
      in_OV = in_OV | SBORROW4(uVar19,uVar14) | SCARRY4(iVar10,(uint)DAT_data_0047) |
              SCARRY4(uVar20,(uint)DAT_data_0011) |
              SBORROW4(uVar20 & 0xffff,(int)(short)DAT_data_0010) |
              SCARRY4((int)(short)DAT_data_0017 * 0x8000,iVar12 * 0x8000) |
              SBORROW4((uint)DAT_data_0011,(uint)DAT_data_0047);
      DAT_data_0011 = DAT_data_0011 - DAT_data_0047;
      PA2 = DAT_data_0011;
      PA7 = DAT_data_0011;
      PA4 = (word)((uint)((int)(short)DAT_data_0017 * 0x8000 + iVar12 * 0x8000) >> 0x10);
      wVar6 = PA0;
      if ((DAT_data_0007 & wVar6) != 0) {
        PA5 = *(word *)(uVar21 & 0xff);
        uVar21 = uVar21 + 1;
      }
      DAT_data_0016 = 0;
      do {
        DAT_data_0017 = PA7;
        bVar22 = in_OV;
        while( true ) {
          wVar6 = PA0;
          if ((DAT_data_0007 & wVar6) != 0) {
            PA5 = *(word *)(uVar21 & 0xff);
            uVar21 = uVar21 + 1;
          }
          uVar11 = (uint)DAT_data_0014;
          uVar20 = (uint)uVar21;
          iVar10 = uVar11 - uVar20;
          uVar14 = (uint)DAT_data_0047;
          iVar12 = iVar10 + uVar14;
          DAT_data_0014 = (ushort)iVar12;
          uVar19 = (uint)DAT_data_0011;
          iVar13 = iVar12 + uVar19;
          PA7 = (word)iVar13;
          wVar7 = PA4;
          wVar6 = PA4;
          PA7 = (word)iVar13 + DAT_data_0010;
          wVar8 = PA4;
          wVar9 = PA4;
          bVar2 = SCARRY4((int)(short)DAT_data_0016 * (int)(short)wVar6 -
                          (int)(short)DAT_data_0016 * (int)(short)wVar9,(int)(short)wVar9 * 0x8000);
          wVar6 = PA0;
          uVar21 = DAT_data_000a;
          if ((DAT_data_0007 & wVar6) != 0) {
            PA5 = *(word *)(DAT_data_000a & 0xff);
            uVar21 = DAT_data_000a + 1;
          }
          bVar3 = SCARRY4((int)(short)DAT_data_0016 * (int)(short)wVar7 -
                          (int)(short)DAT_data_0016 * (int)(short)wVar8,(int)(short)wVar8 * 0x8000);
          iVar15 = (int)(short)DAT_data_0017 * 0x8000;
          iVar1 = (int)(short)DAT_data_0018 * 0x8000;
          DAT_data_0018 = PA7;
          uVar16 = (uint)DAT_data_0011;
          DAT_data_0011 = DAT_data_0011 - DAT_data_0047;
          PA2 = DAT_data_0011;
          PA7 = DAT_data_0011;
          PA4 = (word)((uint)(iVar15 + iVar1) >> 0x10);
          if (-1 < (int)((uint)DAT_data_0021 << 0x10)) break;
          wVar6 = PA0;
          if ((DAT_data_0007 & wVar6) != 0) {
            PA5 = *(word *)(uVar21 & 0xff);
            uVar21 = uVar21 + 1;
          }
          uVar4 = (uint)DAT_data_0016;
          DAT_data_0016 = (ushort)(uVar4 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
          in_OV = 0;
          if (((((((((bVar22 != 0 || SBORROW4(uVar11,uVar20)) || SCARRY4(iVar10,uVar14)) ||
                   SCARRY4(iVar12,uVar19)) || SCARRY4(iVar13,(int)(short)DAT_data_0010)) || bVar2)
                || bVar3) || SCARRY4(iVar15,iVar1)) || SBORROW4(uVar16,(uint)DAT_data_0047)) ||
              SCARRY4(uVar4 * 0x10000,(uint)DAT_data_0042 * 0x10000)) goto LAB_prog_0832;
          DAT_data_0017 = PA7;
          bVar22 = in_OV;
        }
        wVar6 = PA0;
        if ((DAT_data_0007 & wVar6) != 0) {
          PA5 = *(word *)(uVar21 & 0xff);
          uVar21 = uVar21 + 1;
        }
        iVar17 = (uint)DAT_data_0011 + (uint)DAT_data_0048;
        uVar18 = iVar17 - (uint)DAT_data_0023 & (uint)DAT_data_0009;
        DAT_data_0021 = (ushort)(uVar18 + (int)(short)DAT_data_0008 * -0x20 >> 0x10);
        uVar4 = (uint)DAT_data_0016;
        DAT_data_0016 = (ushort)(uVar4 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
        in_OV = 0;
      } while ((((((((((((bVar22 == 0 && !SBORROW4(uVar11,uVar20)) && !SCARRY4(iVar10,uVar14)) &&
                       !SCARRY4(iVar12,uVar19)) && !SCARRY4(iVar13,(int)(short)DAT_data_0010)) &&
                     !bVar2) && !bVar3) && !SCARRY4(iVar15,iVar1)) &&
                  !SBORROW4(uVar16,(uint)DAT_data_0047)) &&
                 !SCARRY4((uint)DAT_data_0011,(uint)DAT_data_0048)) &&
                !SBORROW4(iVar17,(uint)DAT_data_0023)) &&
               !SBORROW4(uVar18,(int)(short)DAT_data_0008 * 0x20)) &&
               !SCARRY4(uVar4 * 0x10000,(uint)DAT_data_0042 * 0x10000));
      goto LAB_prog_0832;
    }
    DAT_data_0010 = PA1;
    in_OV = in_OV | SBORROW4(iVar10,(uint)DAT_data_0010);
    if (0 < (int)(iVar10 - (uint)DAT_data_0010)) goto LAB_prog_0949;
    wVar6 = PA0;
    if ((DAT_data_0007 & wVar6) != 0) {
      PA5 = *(word *)(uVar21 & 0xff);
      uVar21 = uVar21 + 1;
    }
    uVar11 = (uint)DAT_data_0014;
    uVar20 = (uint)uVar21;
    iVar12 = uVar11 - uVar20;
    uVar14 = (uint)DAT_data_0047;
    iVar13 = iVar12 + uVar14;
    DAT_data_0014 = (ushort)iVar13;
    uVar19 = (uint)DAT_data_0011;
    PA7 = DAT_data_0014 + DAT_data_0011;
    wVar6 = PA4;
    wVar6 = PA4;
    iVar10 = (int)(short)DAT_data_0018;
    DAT_data_000e = (word)((uint)((int)(short)DAT_data_0017 * 0x8000 + iVar10 * 0x8000) >> 0x10);
    wVar6 = PA0;
    uVar21 = DAT_data_000a;
    if ((DAT_data_0007 & wVar6) != 0) {
      PA5 = *(word *)(DAT_data_000a & 0xff);
      uVar21 = DAT_data_000a + 1;
    }
    wVar6 = PA5;
    if ((wVar6 & DAT_data_0006) != 0) {
      wVar7 = PA6;
      *(word *)(wVar6 & 0xff) = wVar7;
    }
    DAT_data_0018 = PA7;
    in_OV = in_OV | SBORROW4(uVar11,uVar20) | SCARRY4(iVar12,uVar14) | SCARRY4(iVar13,uVar19) |
            SCARRY4((int)(short)DAT_data_0017 * 0x8000,iVar10 * 0x8000) |
            SBORROW4((uint)DAT_data_0011,(uint)DAT_data_0047);
    DAT_data_0011 = DAT_data_0011 - DAT_data_0047;
    PA2 = DAT_data_0011;
    PA7 = DAT_data_0011;
    PA4 = DAT_data_000e;
    if ((int)((uint)DAT_data_0049 << 0x10) < 1) {
      wVar6 = PA0;
      if ((DAT_data_0007 & wVar6) != 0) {
        PA5 = *(word *)(uVar21 & 0xff);
        uVar21 = uVar21 + 1;
      }
      if ((int)((uint)DAT_data_0021 << 0x10) < 0) {
        in_OV = in_OV | SBORROW4((uint)DAT_data_0022,(uint)DAT_data_0041);
        if ((int)((uint)DAT_data_0022 - (uint)DAT_data_0041) < 1) {
          DAT_data_0022 = DAT_data_0041;
        }
        else {
          in_OV = in_OV | SBORROW4((uint)DAT_data_0022,(int)DAT_data_004a);
          DAT_data_0022 = DAT_data_0022 - DAT_data_004a;
        }
      }
      else {
        iVar10 = (uint)DAT_data_0011 + (uint)DAT_data_0048;
        uVar14 = iVar10 - (uint)DAT_data_0023 & (uint)DAT_data_0009;
        in_OV = in_OV | SCARRY4((uint)DAT_data_0011,(uint)DAT_data_0048) |
                SBORROW4(iVar10,(uint)DAT_data_0023) |
                SBORROW4(uVar14,(int)(short)DAT_data_0008 * 0x20);
        DAT_data_0021 = (ushort)(uVar14 + (int)(short)DAT_data_0008 * -0x20 >> 0x10);
      }
    }
    else {
      wVar6 = PA0;
      if ((DAT_data_0007 & wVar6) != 0) {
        PA5 = *(word *)(uVar21 & 0xff);
        uVar21 = uVar21 + 1;
      }
      if ((int)((uint)DAT_data_0021 << 0x10) < 0) {
        uVar14 = (uint)DAT_data_0049;
        DAT_data_0049 = (ushort)(uVar14 * 0x10000 + (uint)DAT_data_0008 * -0x10000 >> 0x10);
        DAT_data_0010 = (word)((uint)DAT_data_0048 * -0x10000 >> 0x10);
        in_OV = in_OV | SBORROW4(uVar14 * 0x10000,(uint)DAT_data_0008 * 0x10000) |
                SBORROW4(0,(uint)DAT_data_0048 * 0x10000) |
                SCARRY4((uint)DAT_data_0048,(uint)DAT_data_0022);
        DAT_data_0022 = DAT_data_0048 + DAT_data_0022;
        DAT_data_0017 = PA7;
        DAT_data_0021 = DAT_data_0008;
        DAT_data_0023 = DAT_data_0011;
        goto LAB_prog_0949;
      }
      iVar10 = (uint)DAT_data_0011 + (uint)DAT_data_0048;
      uVar14 = iVar10 - (uint)DAT_data_0023 & (uint)DAT_data_0009;
      in_OV = in_OV | SCARRY4((uint)DAT_data_0011,(uint)DAT_data_0048) |
              SBORROW4(iVar10,(uint)DAT_data_0023) |
              SBORROW4(uVar14,(int)(short)DAT_data_0008 * 0x20);
      DAT_data_0021 = (ushort)(uVar14 + (int)(short)DAT_data_0008 * -0x20 >> 0x10);
    }
  } while( true );
}


// ===== FUN_prog_099e @ prog:099e =====

void FUN_prog_099e(void)

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


