// 0410_program_04_dsp1 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0410_program_04_dsp1 (ucode_0410_ROM2_0BAAF.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  int iVar1;
  uint uVar2;
  undefined2 uVar3;
  int iVar4;
  int iVar5;
  char cVar6;
  word wVar7;
  word wVar8;
  word wVar9;
  word wVar10;
  word wVar11;
  bool bVar12;
  uint uVar13;
  int iVar14;
  uint uVar15;
  int iVar16;
  int iVar17;
  int iVar18;
  int iVar19;
  word wVar22;
  uint uVar20;
  uint uVar21;
  ushort uVar23;
  byte in_OV;
  byte bVar24;
  byte bVar25;
  
  DAT_data_0006 = 1;
  DAT_data_0047 = 1;
  DAT_data_0004 = 0x100;
  DAT_data_0005 = 8;
  DAT_data_0013 = 0xff;
  DAT_data_0041 = 0xff;
  DAT_data_0042 = 0xff;
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  wVar22 = PA0;
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  uVar13 = 0;
  DAT_data_0008 = 0;
  DAT_data_0003 = 0;
  DAT_data_000f = 0;
  DAT_data_0016 = 0;
  PA5 = 0;
  PA6 = 0;
  do {
    PA7 = DAT_data_0003;
    PA4 = DAT_data_0008;
    iVar14 = (int)DAT_data_0006;
    DAT_data_0003 = (short)uVar13 + DAT_data_0006;
    wVar22 = PA5;
    if ((wVar22 & DAT_data_0004) != 0) {
      wVar11 = PA6;
      *(word *)(wVar22 & 0xff) = wVar11;
    }
    PA7 = DAT_data_0003;
    PA4 = DAT_data_0008;
    in_OV = in_OV | SCARRY4(uVar13,iVar14) | SCARRY4((uint)DAT_data_0003,(int)DAT_data_0006);
    DAT_data_0003 = DAT_data_0003 + DAT_data_0006;
    uVar13 = (uint)DAT_data_0003;
  } while (uVar13 != 0);
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  wVar22 = PA0;
  uVar23 = 0;
  bVar24 = in_OV | SBORROW4((uint)DAT_data_0043 * 0x10000,(uint)DAT_data_0008 * 0x10000);
  if ((uint)DAT_data_0043 * 0x10000 + (uint)DAT_data_0008 * -0x10000 != 0) {
    bVar24 = bVar24 | SBORROW4((uint)DAT_data_0045 * 0x10000,(uint)DAT_data_0008 * 0x10000);
  }
  bVar24 = bVar24 | SBORROW4((uint)DAT_data_0044 * 0x10000,(uint)DAT_data_0008 * 0x10000);
  if (((uint)DAT_data_0044 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) ||
     (bVar24 = bVar24 | SBORROW4((uint)DAT_data_0045 * 0x10000,(uint)DAT_data_0008 * 0x10000),
     (uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0)) {
    uVar3 = *(undefined2 *)(DAT_data_0006 * 0x884 & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x942 & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x994 & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0xa04 & 0xfff) = uVar3;
  }
  if ((uint)DAT_data_0045 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) {
    *(undefined2 *)(DAT_data_0006 * 0x8f9 & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x89b & 0xfff);
  }
  bVar24 = bVar24 | SBORROW4((uint)DAT_data_0045 * 0x10000,(uint)DAT_data_0008 * 0x10000) |
           SBORROW4((uint)DAT_data_0046 * 0x10000,(uint)DAT_data_0008 * 0x10000);
  if ((uint)DAT_data_0046 * 0x10000 + (uint)DAT_data_0008 * -0x10000 == 0) {
    uVar3 = *(undefined2 *)(DAT_data_0006 * 0x8aa & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x90d & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x963 & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x9d0 & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x9dc & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8ab & 0xfff);
    uVar3 = *(undefined2 *)(DAT_data_0006 * 0x8ac & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x916 & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x9d9 & 0xfff) = uVar3;
    uVar3 = *(undefined2 *)(DAT_data_0006 * 0x8ad & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x917 & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x9da & 0xfff) = uVar3;
    *(undefined2 *)(DAT_data_0006 * 0x96c & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8ae & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x96d & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8af & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x96f & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8b0 & 0xfff);
    *(undefined2 *)(DAT_data_0006 * 0x970 & 0xfff) = *(undefined2 *)(DAT_data_0006 * 0x8b1 & 0xfff);
    DAT_data_0041 = 0;
  }
  do {
    cVar6 = bio_pin();
  } while (cVar6 != '\0');
  do {
    cVar6 = bio_pin();
  } while (cVar6 == '\0');
  do {
    DAT_data_0017 = PA7;
    bVar24 = bVar24 | SBORROW4((uint)DAT_data_0013,(uint)DAT_data_0041);
    iVar14 = (uint)DAT_data_0013 - (uint)DAT_data_0041;
    if (iVar14 < 0) {
      wVar22 = PA1;
      bVar24 = bVar24 | SBORROW4(0,(uint)wVar22 * 0x10000);
      DAT_data_000e = (word)((uint)wVar22 * -0x10000 >> 0x10);
LAB_prog_09c6:
      wVar22 = PA0;
      if ((DAT_data_0005 & wVar22) != 0) {
        PA5 = *(word *)(uVar23 & 0xff);
        uVar23 = uVar23 + 1;
      }
      uVar20 = (uint)DAT_data_0013;
      uVar2 = (uint)uVar23;
      iVar14 = uVar20 - uVar2;
      uVar15 = iVar14 + (uint)DAT_data_0047;
      uVar13 = (uint)DAT_data_000f;
      PA7 = (short)uVar15 + DAT_data_000f;
      wVar22 = PA4;
      wVar22 = PA4;
      DAT_data_0013 = (short)uVar15 - DAT_data_000e;
      wVar22 = PA0;
      uVar23 = DAT_data_0008;
      if ((DAT_data_0005 & wVar22) != 0) {
        PA5 = *(word *)(DAT_data_0008 & 0xff);
        uVar23 = DAT_data_0008 + 1;
      }
      iVar16 = (int)(short)DAT_data_0016;
      PA2 = DAT_data_000f;
      PA7 = DAT_data_000f;
      PA4 = (word)((uint)(iVar16 * 0x8000 + (int)(short)DAT_data_0017 * 0x8000) >> 0x10);
      wVar22 = PA0;
      if ((DAT_data_0005 & wVar22) != 0) {
        PA5 = *(word *)(uVar23 & 0xff);
        uVar23 = uVar23 + 1;
      }
      uVar21 = (uint)DAT_data_000f;
      DAT_data_000f = DAT_data_000f - DAT_data_0047;
      DAT_data_0016 = PA7;
      DAT_data_0015 = 0;
      bVar25 = bVar24 | SBORROW4(uVar20,uVar2) | SCARRY4(iVar14,(uint)DAT_data_0047) |
               SCARRY4(uVar15,uVar13) | SBORROW4(uVar15 & 0xffff,(int)(short)DAT_data_000e) |
               SCARRY4(iVar16 * 0x8000,(int)(short)DAT_data_0017 * 0x8000) |
               SBORROW4(uVar21,(uint)DAT_data_0047);
      do {
        wVar11 = PA7;
        wVar22 = PA0;
        if ((DAT_data_0005 & wVar22) != 0) {
          PA5 = *(word *)(uVar23 & 0xff);
          uVar23 = uVar23 + 1;
        }
        uVar20 = (uint)DAT_data_0013;
        uVar2 = (uint)uVar23;
        iVar17 = uVar20 - uVar2;
        iVar18 = iVar17 + (uint)DAT_data_0047;
        DAT_data_0013 = (ushort)iVar18;
        uVar13 = (uint)DAT_data_000f;
        iVar19 = iVar18 + uVar13;
        wVar22 = (word)iVar19;
        PA7 = wVar22;
        wVar7 = PA4;
        wVar8 = PA4;
        PA7 = wVar22 + DAT_data_000e;
        wVar9 = PA4;
        wVar10 = PA4;
        iVar14 = (int)(short)DAT_data_0015;
        iVar16 = (int)(short)DAT_data_0015;
        wVar22 = PA0;
        uVar23 = DAT_data_0008;
        if ((DAT_data_0005 & wVar22) != 0) {
          PA5 = *(word *)(DAT_data_0008 & 0xff);
          uVar23 = DAT_data_0008 + 1;
        }
        iVar4 = (int)(short)DAT_data_0015;
        iVar5 = (int)(short)DAT_data_0015;
        iVar1 = (int)(short)DAT_data_0016;
        PA2 = DAT_data_000f;
        PA7 = DAT_data_000f;
        PA4 = (word)((uint)(iVar1 * 0x8000 + (int)(short)wVar11 * 0x8000) >> 0x10);
        wVar22 = PA0;
        if ((DAT_data_0005 & wVar22) != 0) {
          PA5 = *(word *)(uVar23 & 0xff);
          uVar23 = uVar23 + 1;
        }
        uVar21 = (uint)DAT_data_000f;
        DAT_data_000f = DAT_data_000f - DAT_data_0047;
        DAT_data_0016 = PA7;
        uVar15 = (uint)DAT_data_0015;
        DAT_data_0015 = (ushort)(uVar15 * 0x10000 + (uint)DAT_data_0042 * 0x10000 >> 0x10);
        bVar24 = 0;
        bVar12 = bVar25 == 0;
        bVar25 = bVar24;
      } while (((((((((bVar12 && !SBORROW4(uVar20,uVar2)) && !SCARRY4(iVar17,(uint)DAT_data_0047))
                    && !SCARRY4(iVar18,uVar13)) && !SCARRY4(iVar19,(int)(short)DAT_data_000e)) &&
                  !SCARRY4(iVar14 * (short)wVar8 - iVar16 * (short)wVar10,
                           (int)(short)wVar10 * 0x8000)) &&
                 !SCARRY4(iVar4 * (short)wVar7 - iVar5 * (short)wVar9,(int)(short)wVar9 * 0x8000))
                && !SCARRY4(iVar1 * 0x8000,(int)(short)wVar11 * 0x8000)) &&
               !SBORROW4(uVar21,(uint)DAT_data_0047)) &&
               !SCARRY4(uVar15 * 0x10000,(uint)DAT_data_0042 * 0x10000));
      DAT_data_0017 = PA7;
    }
    else {
      DAT_data_000e = PA1;
      bVar24 = bVar24 | SBORROW4(iVar14,(uint)DAT_data_000e);
      if (0 < (int)(iVar14 - (uint)DAT_data_000e)) goto LAB_prog_09c6;
    }
    wVar22 = PA0;
    if ((DAT_data_0005 & wVar22) != 0) {
      PA5 = *(word *)(uVar23 & 0xff);
      uVar23 = uVar23 + 1;
    }
    uVar15 = (uint)DAT_data_0013;
    uVar20 = (uint)uVar23;
    iVar14 = uVar15 - uVar20;
    uVar13 = (uint)DAT_data_0047;
    iVar16 = iVar14 + uVar13;
    DAT_data_0013 = (ushort)iVar16;
    uVar2 = (uint)DAT_data_000f;
    PA7 = DAT_data_0013 + DAT_data_000f;
    wVar22 = PA4;
    wVar22 = PA4;
    wVar22 = PA0;
    uVar23 = DAT_data_0008;
    if ((DAT_data_0005 & wVar22) != 0) {
      PA5 = *(word *)(DAT_data_0008 & 0xff);
      uVar23 = DAT_data_0008 + 1;
    }
    wVar22 = PA5;
    if ((wVar22 & DAT_data_0004) != 0) {
      wVar11 = PA6;
      *(word *)(wVar22 & 0xff) = wVar11;
    }
    PA2 = DAT_data_000f;
    PA7 = DAT_data_000f;
    PA4 = (word)((uint)((int)(short)DAT_data_0016 * 0x8000 + (int)(short)DAT_data_0017 * 0x8000) >>
                0x10);
    wVar22 = PA0;
    if ((DAT_data_0005 & wVar22) != 0) {
      PA5 = *(word *)(uVar23 & 0xff);
      uVar23 = uVar23 + 1;
    }
    bVar24 = bVar24 | SBORROW4(uVar15,uVar20) | SCARRY4(iVar14,uVar13) | SCARRY4(iVar16,uVar2) |
             SCARRY4((int)(short)DAT_data_0016 * 0x8000,(int)(short)DAT_data_0017 * 0x8000) |
             SBORROW4((uint)DAT_data_000f,(uint)DAT_data_0047);
    DAT_data_000f = DAT_data_000f - DAT_data_0047;
    DAT_data_0016 = PA7;
  } while( true );
}


