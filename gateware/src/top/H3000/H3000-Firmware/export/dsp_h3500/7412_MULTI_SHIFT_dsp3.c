// 7412_MULTI_SHIFT_dsp3 - TMS32010 program decompiled by Ghidra (TMS320C1x SLEIGH module)
// data RAM words appear as DAT_data_xxxx, I/O ports as PA0-PA7, BIOZ as bio_pin()
// accumulator saturation (SOVM) is not modelled

// ===== dsp_main @ prog:0800 =====

/* Eventide H3000/H3500 DSP program 7412_MULTI_SHIFT_dsp3 (ucode_7412_ROM4_0754E.bin)
   Loaded at $800 by DspLoadProgram (6809 API $FD30) */

void dsp_main(void)

{
  ushort uVar1;
  char cVar2;
  word wVar3;
  word wVar4;
  int iVar5;
  ushort uVar6;
  
  uVar6 = 0x8f;
  do {
    *(undefined2 *)(uVar6 & 0xff) = 0;
    uVar1 = uVar6 & 0x1ff;
    uVar6 = uVar6 - 1;
  } while (uVar1 != 0);
  DAT_data_004d = 1;
  DAT_data_0051 = 0x400;
  DAT_data_0050 = -0x8000;
  DAT_data_004c = 0;
  DAT_data_004e = 0xffff;
  DAT_data_004f = 0x7fff;
  DAT_data_0067 = 0xd80;
  DAT_data_0068 = 0xc90;
  DAT_data_0053 = 0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 != '\0');
  wVar3 = PA0;
  do {
    cVar2 = bio_pin();
  } while (cVar2 == '\0');
  do {
    wVar3 = PA5;
    if ((wVar3 & DAT_data_0051) != 0) {
      wVar4 = PA6;
      *(word *)(wVar3 & 0xff) = wVar4;
    }
    DAT_data_0053 = DAT_data_0053 + 0x15;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
    PA4 = DAT_data_004c;
  } while (0 < DAT_data_0053);
  uData0066 = 0;
  uData006f = 0;
  DAT_data_0052 = 0xbb;
  uData0074 = 0xbb0;
  uData0042 = 100;
  uData0043 = 100;
  uData0044 = 800;
  uData0045 = uData0044;
  func_0x0a67();
  func_0x0921();
  sData0057 = sData0048;
  sData0058 = sData0049;
  func_0x097d();
  func_0x098d();
code_p0x088a:
  do {
    do {
      do {
        func_0x0a67();
        iVar5 = func_0x0955();
        if (iVar5 != 0) {
          func_0x0921();
        }
        func_0x099d();
        if ((uint)uData004a * 0x10000 + (uint)DAT_data_004c * -0x10000 != 0) {
          func_0x0907();
          func_0x09c5();
          if ((uData0062 == 0) && ((int)((uint)uData0063 + (int)DAT_data_004d * -0x1000) < 1)) {
            DAT_data_0052 = 0x1f;
            sData0065 = (DAT_data_004f - 0x1fU & (ushort)((uint)((int)sData0048 << 0xe) >> 0x10)) +
                        DAT_data_004d * 0x20;
            func_0x09fe();
            func_0x0a40();
            do {
              func_0x0a67();
              if ((int)((uint)uData0062 << 0x10) < 0) goto code_p0x08ca;
              iVar5 = func_0x0a5c();
            } while (iVar5 != 0);
            func_0x0a99();
            func_0x0b6f();
            func_0x0bae();
            func_0x0bcb();
            func_0x0b4b();
            sData0057 = sData0072;
            func_0x097d();
          }
        }
code_p0x08ca:
        func_0x099d();
      } while ((uint)uData004b * 0x10000 + (uint)DAT_data_004c * -0x10000 == 0);
      func_0x0914();
      func_0x09c5();
    } while ((uData0062 != 0) || (0 < (int)((uint)uData0063 + (int)DAT_data_004d * -0x1000)));
    DAT_data_0052 = 0x1f;
    sData0065 = (DAT_data_004f - 0x1fU & (ushort)((uint)((int)sData0049 << 0xe) >> 0x10)) +
                DAT_data_004d * 0x20;
    func_0x09fe();
    func_0x0a40();
    do {
      func_0x0a67();
      if ((int)((uint)uData0062 << 0x10) < 0) goto code_p0x088a;
      iVar5 = func_0x0a5c();
    } while (iVar5 != 0);
    sData005d = sData005d + DAT_data_0050;
    func_0x0a99();
    func_0x0b6f();
    func_0x0bae();
    func_0x0bcb();
    func_0x0b4b();
    sData0058 = sData0072;
    func_0x098d();
  } while( true );
}


