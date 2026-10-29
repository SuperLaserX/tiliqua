// 0212_program_02_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0212_program_02_dsp3 (ucode_0212_ROM2_037C6.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  int iVar2;
  ushort uVar3;
  
  DAT_data_002e = 1;
  DAT_data_0035 = 0x400;
  DAT_data_0036 = 0x4000;
  DAT_data_0037 = 0x140;
  DAT_data_002f = 2;
  DAT_data_0030 = 3;
  DAT_data_0031 = 4;
  DAT_data_0032 = 0x7fff;
  DAT_data_0038 = 0xd48;
  DAT_data_0033 = 0xd68;
  DAT_data_0034 = 0xc08;
  sData0000 = 0;
  DAT_data_001b = 0;
  do {
    uVar3 = 10;
    do {
      uVar1 = uVar3 & 0x1ff;
      uVar3 = uVar3 - 1;
    } while (uVar1 != 0);
    sData0000 = sData0000 + 1;
  } while (sData0000 != 0);
LAB_prog_082c:
  func_0x08cd();
  sData0019 = 0;
  func_0x0900();
  iVar2 = FUN_prog_0856();
  if (iVar2 != 0) goto LAB_prog_083f;
  func_0x0a65();
  func_0x0a80();
  if (sData0027 != 0) {
    sData0019 = DAT_data_0032;
    goto LAB_prog_083f;
  }
  goto LAB_prog_084c;
LAB_prog_083f:
  func_0x0910();
  iVar2 = FUN_prog_0856();
  if ((iVar2 == 0) || (sData0019 != 0)) {
    func_0x0a65();
    func_0x0a80();
LAB_prog_084c:
    FUN_prog_087a();
    func_0x0b34();
    func_0x0a93();
    func_0x0b46();
  }
  goto LAB_prog_082c;
}


// ===== FUN_prog_0856 @ prog:0856 =====

void FUN_prog_0856(void)

{
  int iVar1;
  
  if ((int)((uint)DAT_data_0023 - (int)DAT_data_002e) < 1) {
    func_0x0920();
  }
  else {
    iVar1 = ((uint)DAT_data_0023 - (int)DAT_data_002e) + (int)DAT_data_002e * -2;
    if (iVar1 < 1) {
      func_0x0935();
    }
    else {
      iVar1 = iVar1 + (int)DAT_data_002e * -4;
      if (iVar1 < 1) {
        func_0x094f();
      }
      else if (iVar1 + (int)DAT_data_002e * -8 < 1) {
        func_0x096d();
      }
      else {
        func_0x0993();
      }
    }
  }
  func_0x0a21();
  func_0x0a48();
  return;
}


// ===== FUN_prog_087a @ prog:087a =====

undefined4 FUN_prog_087a(void)

{
  ushort uVar1;
  ushort uVar2;
  
  uData0000 = DAT_data_0021 + DAT_data_002e * -3;
  DAT_data_0016 = 0;
  DAT_data_0044 = 0;
  DAT_data_0003 = DAT_data_0034 + 1;
  DAT_data_0042 = *(ushort *)(DAT_data_0034 & 0xfff);
  while( true ) {
    DAT_data_0041 = *(ushort *)(DAT_data_0003 & 0xfff);
    DAT_data_0003 = DAT_data_0003 + 1;
    if ((int)((uint)DAT_data_0041 * 0x10000 + (uint)DAT_data_0042 * -0x10000) < 0) break;
    uData0000 = uData0000 - DAT_data_002e;
    DAT_data_0016 = DAT_data_0016 + 1;
    DAT_data_0042 = DAT_data_0041;
  }
  DAT_data_0043 = (ushort)((uint)((int)(short)DAT_data_0042 * (int)DAT_data_0026 * 2) >> 0x10);
  uVar2 = uData0000 - DAT_data_0022;
  uData0000 = uVar2;
  DAT_data_0003 = DAT_data_0003 + DAT_data_0022;
  do {
    DAT_data_0040 = *(ushort *)(DAT_data_0003 & 0xfff);
    if ((((-1 < (int)((uint)DAT_data_0041 * 0x10000 + (uint)DAT_data_0042 * -0x10000)) &&
         (0 < (int)((uint)DAT_data_0041 * 0x10000 + (uint)DAT_data_0040 * -0x10000))) &&
        (-1 < (int)((uint)DAT_data_0041 * 0x10000 + (uint)DAT_data_0043 * -0x10000))) &&
       (-1 < (int)((uint)DAT_data_0041 * 0x10000 + (uint)DAT_data_0044 * -0x10000))) {
      *(undefined2 *)(DAT_data_0003 - DAT_data_002e & 0xfff) = DAT_data_0032;
      DAT_data_001c = ((DAT_data_0003 - DAT_data_002e) - DAT_data_0034) - DAT_data_0016;
      DAT_data_0044 = DAT_data_0041;
    }
    DAT_data_0042 = DAT_data_0041;
    DAT_data_0041 = DAT_data_0040;
    DAT_data_0003 = DAT_data_0003 + 1;
    uVar1 = uVar2 & 0x1ff;
    uVar2 = uVar2 - 1;
  } while (uVar1 != 0);
  return 0;
}


