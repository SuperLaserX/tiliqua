// 0412_program_04_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 0412_program_04_dsp3 (ucode_0412_SmallROM_03EBE.bin)
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
  DAT_data_001b = 0;
  sData0000 = 0;
  DAT_data_0019 = 0;
  do {
    uVar3 = 10;
    do {
      uVar1 = uVar3 & 0x1ff;
      uVar3 = uVar3 - 1;
    } while (uVar1 != 0);
    sData0000 = sData0000 + 1;
  } while (sData0000 != 0);
  do {
    func_0x08cd();
    DAT_data_001b = DAT_data_001b ^ DAT_data_0032;
    if (DAT_data_001b == 0) {
LAB_prog_0840:
      func_0x0b4e();
      func_0x0900();
    }
    else {
      func_0x0b46();
      if (uData0027 == 0) {
        DAT_data_001b = uData0027;
        goto LAB_prog_0840;
      }
      func_0x0910();
    }
    if ((int)((uint)uData0023 - (int)DAT_data_002e) < 1) {
      func_0x0920();
    }
    else {
      iVar2 = ((uint)uData0023 - (int)DAT_data_002e) + (int)DAT_data_002e * -2;
      if (iVar2 < 1) {
        func_0x0935();
      }
      else {
        iVar2 = iVar2 + (int)DAT_data_002e * -4;
        if (iVar2 < 1) {
          func_0x094f();
        }
        else if (iVar2 + (int)DAT_data_002e * -8 < 1) {
          func_0x096d();
        }
        else {
          func_0x0993();
        }
      }
    }
    func_0x0a21();
    iVar2 = func_0x0a48();
    if (iVar2 == 0) {
      func_0x0a65();
      func_0x0a80();
      iVar2 = func_0x0880();
      if (iVar2 == 0) {
        func_0x0a93();
        func_0x0b34();
      }
    }
  } while( true );
}


