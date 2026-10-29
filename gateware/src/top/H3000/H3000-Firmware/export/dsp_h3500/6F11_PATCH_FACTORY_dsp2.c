// 6F11_PATCH_FACTORY_dsp2 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 6F11_PATCH_FACTORY_dsp2 (ucode_6F11_ROM4_36BA9.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  word wVar1;
  uint uVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  int iVar7;
  ushort uVar8;
  char cVar9;
  word wVar10;
  bool bVar11;
  uint uVar12;
  int iVar13;
  int iVar14;
  word wVar29;
  uint uVar15;
  int iVar16;
  int iVar17;
  int iVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  int iVar22;
  int iVar23;
  int iVar24;
  uint uVar25;
  int iVar26;
  word wVar30;
  uint uVar27;
  int iVar28;
  ushort uVar31;
  byte in_OV;
  byte bVar32;
  
  uVar31 = 0x8f;
  do {
    *(undefined2 *)(uVar31 & 0xff) = 0;
    uVar8 = uVar31 & 0x1ff;
    uVar31 = uVar31 - 1;
  } while (uVar8 != 0);
  DAT_data_0001 = 1;
  DAT_data_0010 = 1;
  DAT_data_0005 = 0x200;
  DAT_data_0004 = 0x8000;
  uData0000 = 0;
  uData0002 = 0xffff;
  DAT_data_0028 = 0xd;
  DAT_data_0029 = 0x11;
  DAT_data_0003 = 0x7fff;
  DAT_data_0006 = 0xff;
  DAT_data_0022 = 0x3fc;
  DAT_data_0023 = 0x946;
  FUN_prog_0d46();
  do {
    cVar9 = bio_pin();
  } while (cVar9 != '\0');
  wVar30 = PA0;
  do {
    cVar9 = bio_pin();
  } while (cVar9 == '\0');
LAB_prog_0834:
  do {
    do {
      uVar12 = (uint)DAT_data_0010;
      iVar13 = uVar12 - DAT_data_0001;
      DAT_data_0010 = (ushort)iVar13;
      uVar27 = (uint)DAT_data_0012;
      iVar14 = iVar13 + uVar27;
      wVar29 = (word)iVar14;
      uVar15 = (int)(short)((uint)((int)(short)DAT_data_0013 << 10) >> 0x10) & (uint)DAT_data_0022;
      iVar16 = uVar15 + (int)DAT_data_0023;
      sVar3 = *(short *)((ushort)iVar16 & 0xfff);
      iVar17 = iVar16 + (short)DAT_data_0001;
      sVar4 = *(short *)((ushort)iVar17 & 0xfff);
      iVar18 = iVar17 + (short)DAT_data_0001;
      uVar31 = (ushort)iVar18;
      sVar5 = *(short *)(uVar31 & 0xfff);
      sVar6 = *(short *)(uVar31 + DAT_data_0001 & 0xfff);
      PA7 = wVar29;
      wVar30 = PA4;
      wVar1 = PA4;
      PA7 = wVar29 + DAT_data_0035;
      wVar29 = PA4;
      wVar10 = PA4;
      uVar19 = (uint)DAT_data_0013;
      uVar20 = uVar19 + (int)DAT_data_0040 * 2;
      DAT_data_0013 = (ushort)uVar20;
      uVar25 = (uint)DAT_data_0012;
      DAT_data_0012 = (ushort)(uVar20 + uVar25 * 0x10000 >> 0x10);
      uVar21 = (uint)DAT_data_0028;
      iVar26 = (int)DAT_data_0029;
      iVar22 = uVar21 + iVar26;
      DAT_data_0029 = (short)iVar22;
      iVar28 = (int)(short)DAT_data_0028;
      DAT_data_0028 = DAT_data_0029 + DAT_data_0028;
      iVar23 = (int)(short)DAT_data_0027 * (int)(short)wVar30 -
               (int)(short)DAT_data_0027 * (int)(short)wVar29;
      wVar30 = PA3;
      PA3 = DAT_data_0026;
      PA3 = DAT_data_0028;
      PA2 = DAT_data_0010;
      PA7 = DAT_data_0010;
      PA4 = wVar30;
      wVar30 = (word)((uint)((iVar23 + (int)(short)wVar29 * 0x8000) * 2) >> 0x10);
      iVar24 = (int)(short)DAT_data_0027 * (int)(short)wVar1 -
               (int)(short)DAT_data_0027 * (int)(short)wVar10;
      wVar1 = (word)((uint)((iVar24 + (int)(short)wVar10 * 0x8000) * 2) >> 0x10);
      if ((int)(uVar20 & 0xffff0000) < 0) {
        DAT_data_0026 =
             (word)((uint)(((int)(short)DAT_data_0039 * (int)sVar6 +
                            (int)(short)DAT_data_0038 * (int)sVar5 + (int)(short)wVar1 * (int)sVar4
                           + (int)(short)wVar30 * (int)sVar3) * 2) >> 0x10);
        DAT_data_0038 = wVar30;
        DAT_data_0039 = wVar1;
      }
      else if ((int)(uVar20 & 0xffff0000) < 1) {
        iVar7 = (int)(short)DAT_data_0039;
        DAT_data_0039 = DAT_data_0038;
        DAT_data_0026 =
             (word)((uint)((iVar7 * sVar6 + (int)(short)DAT_data_0038 * (int)sVar5 +
                            (int)(short)wVar1 * (int)sVar4 + (int)(short)wVar30 * (int)sVar3) * 2)
                   >> 0x10);
        DAT_data_0038 = wVar1;
      }
      else {
        DAT_data_0026 =
             (word)((uint)(((int)(short)DAT_data_0039 * (int)sVar6 +
                            (int)(short)DAT_data_0038 * (int)sVar5 + (int)(short)wVar1 * (int)sVar4
                           + (int)(short)wVar30 * (int)sVar3) * 2) >> 0x10);
      }
      uVar2 = (uint)DAT_data_0027;
      DAT_data_0027 = (ushort)(uVar2 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
      bVar32 = 0;
      bVar11 = in_OV == 0;
      in_OV = bVar32;
    } while ((((((((((((((bVar11 && !SBORROW4(uVar12,(uint)DAT_data_0001)) &&
                        !SCARRY4(iVar13,uVar27)) && !SCARRY4(iVar14,(int)DAT_data_0035)) &&
                      !SCARRY4(uVar15,(int)DAT_data_0023)) &&
                     !SCARRY4(iVar16,(int)(short)DAT_data_0001)) &&
                    !SCARRY4(iVar17,(int)(short)DAT_data_0001)) &&
                   !SCARRY4(iVar18,(int)(short)DAT_data_0001)) &&
                  !SCARRY4(uVar19,(int)DAT_data_0040 * 2)) && !SCARRY4(uVar20,uVar25 * 0x10000)) &&
                !SCARRY4(uVar21,iVar26)) && !SCARRY4(iVar22,iVar28)) &&
              !SCARRY4(iVar23,(int)(short)wVar29 * 0x8000)) &&
             !SCARRY4(iVar24,(int)(short)wVar10 * 0x8000)) &&
             !SCARRY4(uVar2 * 0x10000,(uint)DAT_data_0042 * 0x10000));
    do {
      uVar25 = (uint)DAT_data_0010;
      iVar26 = uVar25 - DAT_data_0001;
      DAT_data_0010 = (ushort)iVar26;
      wVar30 = DAT_data_0010 + DAT_data_0012;
      uVar27 = (int)(short)((uint)((int)(short)DAT_data_0013 << 10) >> 0x10) & (uint)DAT_data_0022;
      iVar28 = uVar27 + (int)DAT_data_0023;
      sVar3 = *(short *)((ushort)iVar28 & 0xfff);
      iVar13 = iVar28 + (short)DAT_data_0001;
      sVar4 = *(short *)((ushort)iVar13 & 0xfff);
      iVar14 = iVar13 + (short)DAT_data_0001;
      uVar31 = (ushort)iVar14;
      sVar5 = *(short *)(uVar31 & 0xfff);
      sVar6 = *(short *)(uVar31 + DAT_data_0001 & 0xfff);
      uVar12 = (uint)DAT_data_0013;
      uVar15 = uVar12 + (int)DAT_data_0040 * 2;
      DAT_data_0013 = (ushort)uVar15;
      bVar32 = bVar32 | SBORROW4(uVar25,(uint)DAT_data_0001) | SCARRY4(iVar26,(uint)DAT_data_0012) |
               SCARRY4(uVar27,(int)DAT_data_0023) | SCARRY4(iVar28,(int)(short)DAT_data_0001) |
               SCARRY4(iVar13,(int)(short)DAT_data_0001) | SCARRY4(iVar14,(int)(short)DAT_data_0001)
               | SCARRY4(uVar12,(int)DAT_data_0040 * 2) |
               SCARRY4(uVar15,(uint)DAT_data_0012 * 0x10000);
      DAT_data_0012 = (ushort)(uVar15 + (uint)DAT_data_0012 * 0x10000 >> 0x10);
      PA7 = wVar30;
      wVar30 = PA4;
      wVar1 = PA4;
      if ((int)(uVar15 & 0xffff0000) < 0) {
        DAT_data_0025 =
             (word)((uint)(((int)(short)DAT_data_0039 * (int)sVar6 +
                            (int)(short)DAT_data_0038 * (int)sVar5 + (int)(short)wVar1 * (int)sVar4
                           + (int)(short)wVar30 * (int)sVar3) * 2) >> 0x10);
        iVar26 = (int)DAT_data_0029;
        iVar28 = (uint)DAT_data_0028 + iVar26;
        DAT_data_0029 = (short)iVar28;
        bVar32 = bVar32 | SCARRY4((uint)DAT_data_0028,iVar26) |
                 SCARRY4(iVar28,(int)(short)DAT_data_0028);
        DAT_data_0028 = DAT_data_0029 + DAT_data_0028;
        wVar29 = PA3;
        PA3 = DAT_data_0026;
        PA3 = DAT_data_0028;
        PA2 = DAT_data_0010;
        PA7 = DAT_data_0010;
        PA4 = wVar29;
        DAT_data_0038 = wVar30;
        DAT_data_0039 = wVar1;
      }
      else if ((int)(uVar15 & 0xffff0000) < 1) {
        iVar26 = (int)(short)DAT_data_0039;
        DAT_data_0039 = DAT_data_0038;
        DAT_data_0025 =
             (word)((uint)((iVar26 * sVar6 + (int)(short)DAT_data_0038 * (int)sVar5 +
                            (int)(short)wVar1 * (int)sVar4 + (int)(short)wVar30 * (int)sVar3) * 2)
                   >> 0x10);
        iVar26 = (int)DAT_data_0029;
        iVar28 = (uint)DAT_data_0028 + iVar26;
        DAT_data_0029 = (short)iVar28;
        bVar32 = bVar32 | SCARRY4((uint)DAT_data_0028,iVar26) |
                 SCARRY4(iVar28,(int)(short)DAT_data_0028);
        DAT_data_0028 = DAT_data_0029 + DAT_data_0028;
        wVar30 = PA3;
        PA3 = DAT_data_0026;
        PA3 = DAT_data_0028;
        PA2 = DAT_data_0010;
        PA7 = DAT_data_0010;
        PA4 = wVar30;
        DAT_data_0038 = wVar1;
      }
      else {
        DAT_data_0025 =
             (word)((uint)(((int)(short)DAT_data_0039 * (int)sVar6 +
                            (int)(short)DAT_data_0038 * (int)sVar5 + (int)(short)wVar1 * (int)sVar4
                           + (int)(short)wVar30 * (int)sVar3) * 2) >> 0x10);
        iVar26 = (int)DAT_data_0029;
        iVar28 = (uint)DAT_data_0028 + iVar26;
        DAT_data_0029 = (short)iVar28;
        bVar32 = bVar32 | SCARRY4((uint)DAT_data_0028,iVar26) |
                 SCARRY4(iVar28,(int)(short)DAT_data_0028);
        DAT_data_0028 = DAT_data_0029 + DAT_data_0028;
        wVar30 = PA3;
        PA3 = DAT_data_0026;
        PA3 = DAT_data_0028;
        PA2 = DAT_data_0010;
        PA7 = DAT_data_0010;
        PA4 = wVar30;
      }
      DAT_data_0026 = DAT_data_0025;
      wVar30 = PA5;
      if ((wVar30 & DAT_data_0005) != 0) {
        wVar1 = PA6;
        *(word *)(wVar30 & 0xff) = wVar1;
      }
      wVar30 = PA1;
      bVar32 = bVar32 | SBORROW4((uint)DAT_data_0012,(uint)DAT_data_0041);
      iVar26 = (uint)DAT_data_0012 - (uint)DAT_data_0041;
      if (iVar26 < 1) {
        uVar25 = (uint)wVar30 * 0x10000;
        if ((int)uVar25 < 0) {
          uVar25 = (uint)wVar30 * -0x10000;
        }
        DAT_data_0035 = (short)((uVar25 >> 0x10) * -0x10000 >> 0x10);
        DAT_data_0027 = 0;
        uVar27 = (uint)DAT_data_0012;
        DAT_data_0012 = DAT_data_0012 - DAT_data_0035;
        in_OV = bVar32 | SBORROW4(0,(uVar25 >> 0x10) * 0x10000) |
                SBORROW4(uVar27,(int)DAT_data_0035);
        goto LAB_prog_0834;
      }
      bVar32 = bVar32 | SBORROW4(iVar26,(uint)wVar30);
    } while ((int)(iVar26 - (uint)wVar30) < 0);
    iVar26 = (uint)wVar30 * 0x10000;
    if (iVar26 < 0) {
      iVar26 = (uint)wVar30 * -0x10000;
    }
    DAT_data_0035 = (short)((uint)iVar26 >> 0x10);
    DAT_data_0027 = 0;
    uVar25 = (uint)DAT_data_0012;
    DAT_data_0012 = DAT_data_0012 - DAT_data_0035;
    in_OV = bVar32 | SBORROW4(uVar25,(int)DAT_data_0035);
  } while( true );
}


// ===== FUN_prog_0d46 @ prog:0d46 =====

void FUN_prog_0d46(void)

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
  DAT_data_0008 = 0;
  DAT_data_0009 = 0;
  do {
    DAT_data_0008 = DAT_data_0008 + DAT_data_0001;
    DAT_data_0006 = PA5;
    if ((DAT_data_0006 & DAT_data_0005) != 0) {
      wVar2 = PA6;
      *(word *)(DAT_data_0006 & 0xff) = wVar2;
    }
    DAT_data_0008 = DAT_data_0008 + DAT_data_0001;
  } while (DAT_data_0008 != 0);
  return;
}


