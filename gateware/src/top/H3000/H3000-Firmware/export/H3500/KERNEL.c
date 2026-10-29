// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block KERNEL 8400-ffff, 866 functions
// Kernel ROM D:/midi/Firmware/H3000/modules/h3500

// ===== Reset @ 8400 =====

/* WARNING: Removing unreachable block (RAM,0xc931) */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 Reset(void)

{
  undefined2 uVar1;
  char cVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined1 *puVar3;
  short sVar4;
  
  DAT_80a7 = 0;
  BANK_LATCH = 0;
  DAT_80a1 = 0;
  sVar4 = 0x1fff;
  puVar3 = &DAT_6000;
  do {
    *puVar3 = 0;
    sVar4 = sVar4 + -1;
    puVar3 = puVar3 + 1;
  } while (sVar4 != 0);
  DAT_6000 = 0x5a;
  DAT_64fe = (undefined **)0x8432;
  Io80A7_Clear();
  DAT_64fe = (undefined **)0x8438;
  API_FD50(0x10);
  LAB_6600 = 0xb7;
  DAT_6601 = &DAT_8055;
  DAT_6603 = 0x3b;
  SWI_trampoline = 0x3b;
  SWI2_trampoline = 0x3b;
  SWI3_trampoline = 0x3b;
                    /* inline[API_FD18]: [$600F]=$FFE8 [$6011]=$FFE8 [$6013]=$FFE8 [$6015]=$FFE8
                       [$6006]=$FFE8 [$6004]=$FFE8 [$6002]=$FFE8 [$608B]=$FFE8 [$60F2]=$85E3
                       [$608D]=$FFE8 */
  DAT_64fe = &PTR_DAT_8454;
  StoreWordsInline(0x3b,0x55,0x6604);
  DAT_613c = 5;
  DAT_6019 = 0xff;
  DAT_64fe = (undefined **)0x848b;
  API_FD76();
  DAT_64fe = (undefined **)0x848e;
  API_FC78();
  DAT_64fe = (undefined **)0x8491;
  FUN_90ab();
  DAT_64fe = (undefined **)0x8494;
  API_FCA4();
  DAT_64fe = (undefined **)0x8497;
  API_FC34();
                    /* inline[API_FC38]: "{1}* THE H3500 DYNAMIC ULTRA-HARMONIZER *" */
  DAT_64fe = (undefined **)s___THE_H3500_DYNAMIC_ULTRA_HARMON_849a;
  LcdPrintInline();
  DAT_64fe = (undefined **)0x84c5;
  API_FC22();
  DAT_64fe = (undefined **)0x84c8;
  uVar1 = Io80A7_Set();
  DAT_64fe = (undefined **)0x84ce;
  API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0283);
  DAT_64fe = (undefined **)0x84d1;
  API_FC4A();
  DAT_64fe = (undefined **)0x84d4;
  API_FDD8();
  DAT_64fe = (undefined **)0x84d7;
  FUN_cb9c();
  DAT_64fe = (undefined **)0x84da;
  FUN_fbf3();
  DAT_64fe = (undefined **)0x84dd;
  FUN_f948();
  DAT_64fe = (undefined **)0x84e0;
  API_FDF6();
  DAT_64fe = (undefined **)0x84ea;
  API_FD22(0xf8);
  DAT_64fe = (undefined **)0x84ed;
  API_FC84();
  DAT_64fe = (undefined **)0x84f0;
  FUN_d08b();
  DAT_64fe = (undefined **)0x84f9;
  API_FC80();
  DAT_64fe = (undefined **)0x8502;
  API_FC80();
  DAT_61dc._0_1_ = 0x75;
  DAT_61dc._1_1_ = 0x1f;
  DAT_61de = 0x11;
  DAT_64fe = (undefined **)0x8514;
  API_FDAE();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_64fe = (undefined **)0x8519;
    FUN_c93c();
  }
  DAT_64fe = (undefined **)0x851c;
  cVar2 = API_FC1A();
  if (cVar2 == '\x15') {
    DAT_64fe = (undefined **)0x852c;
    FUN_c73e();
  }
  else {
    if (cVar2 == '\x06') {
      DAT_64fe = (undefined **)0x8527;
      FUN_c967();
    }
    DAT_64fe = (undefined **)0x8532;
    FUN_c953();
    if (!(bool)(extraout_CC_00 >> 2 & 1)) {
                    /* inline[API_FC38]: "{1}NV" */
      DAT_64fe = (undefined **)s_NV_8537;
      LcdPrintInline();
    }
    DAT_64fe = (undefined **)0x8540;
    FUN_c953();
    DAT_64fe = (undefined **)0x8543;
    API_FDFA();
    DAT_64fe = (undefined **)0x8546;
    FUN_8c50();
    DAT_64fe = (undefined **)0x8549;
    FUN_b00d();
    DAT_64fe = (undefined **)0x854c;
    API_FDCE();
    DAT_64fe = (undefined **)0x8552;
    API_FD20(0xf);
    DAT_64fe = (undefined **)0x8555;
    API_FC5E();
    DAT_64fe = (undefined **)0x8558;
    API_FC64();
    DAT_6019 = 0;
  }
  do {
    g_curBank = DAT_6102;
    BANK_LATCH = DAT_6102;
    DAT_64fe = (undefined **)0x8567;
    API_FCAE();
    if ((extraout_CC_01 >> 2 & 1) != 0) {
      DAT_64fe = (undefined **)0x856f;
      API_FCAC(0);
      DAT_64fe = (undefined **)0x8572;
      API_FC1C();
      DAT_64fe = (undefined **)0x8575;
      FUN_9515();
    }
    DAT_64fe = (undefined **)0x8577;
    API_FE2A();
  } while( true );
}


// ===== API_FE2A @ 8579 =====

void __h3000 API_FE2A(undefined1 param_1)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect(param_1,DAT_6102);
  API_FCA6();
  if (DAT_60f1 == '\0') {
    FUN_cae6();
    (*DAT_600f)();
    (*DAT_6011)();
    (*DAT_6013)();
    (*DAT_6015)();
  }
  API_FCF6();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x85a2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,in_stack_00000002);
  return;
}


// ===== IRQ_Handler @ 85a4 =====

undefined2 __h3000 IRQ_Handler(void)

{
  byte bVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 extraout_B;
  undefined2 uVar4;
  char in_stack_00000000;
  undefined2 in_stack_00000001;
  
  bVar1 = DAT_8053;
  if ((bVar1 & 0x80) != 0) {
    (*DAT_6006)();
    API_FD72();
  }
  while (bVar1 = DAT_8300, (bVar1 & 1) != 0) {
    if ((bVar1 & 0x20) == 0) {
      cVar2 = DAT_8301;
      if (DAT_6116 != '\0') {
        if (cVar2 < '\0') {
          (*DAT_60f2)();
        }
        else {
          (*DAT_608b)();
        }
      }
    }
    else {
      uVar3 = DAT_8301;
      FUN_861c();
    }
  }
  uVar3 = (*DAT_6004)();
  uVar4 = CONCAT11(uVar3,extraout_B);
  if (in_stack_00000000 < '\0') {
    uVar4 = in_stack_00000001;
  }
  return uVar4;
}


// ===== FUN_85e3 @ 85e3 =====

void __h3000 FUN_85e3(undefined1 param_1,byte param_2)

{
  ushort uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = CONCAT11(param_2,param_2) & 0xf0ff;
  if ((char)(uVar1 >> 8) != -0x10) {
    DAT_608b = FUN_85f4;
    FUN_85f4();
    return;
  }
  if ((char)uVar1 == -0x10) {
    DAT_608b = FUN_8646;
  }
  else if ((param_2 & 0xf8) == 0xf8) {
    FUN_8723();
  }
  else {
    FUN_8690();
  }
  (*DAT_608d)();
                    /* WARNING: Could not recover jumptable at 0x8637. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(0xf0);
  return;
}


// ===== FUN_85f4 @ 85f4 =====

void __h3000 FUN_85f4(undefined1 param_1,undefined1 param_2)

{
  DAT_6139 = param_2;
  if (DAT_6081 == '\0') {
    *(undefined1 *)(DAT_6083 + 0x7800) = param_2;
    DAT_6083 = DAT_6083 + 1 & 0x3ff;
    if (DAT_6083 == DAT_6085) {
      DAT_6081 = -1;
    }
    DAT_6082 = 0;
    return;
  }
  DAT_6087 = 0xff;
  return;
}


// ===== FUN_861c @ 861c =====

void __h3000 FUN_861c(void)

{
  DAT_6087 = 0xff;
  return;
}


// ===== FUN_8622 @ 8622 =====

void __h3000 FUN_8622(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((byte)in_D == 0xf0) {
    DAT_608b = FUN_8646;
  }
  else if (((byte)in_D & 0xf8) == 0xf8) {
    FUN_8723();
  }
  else {
    FUN_8690();
  }
  (*DAT_608d)();
                    /* WARNING: Could not recover jumptable at 0x8637. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8646 @ 8646 =====

void __h3000 FUN_8646(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)in_D == '\x7f') {
    FUN_85f4();
    FUN_85f4();
    DAT_608b = FUN_85f4;
  }
  else if ((char)in_D == '\x1c') {
    DAT_608b = FUN_8657;
  }
  else {
    DAT_608b = API_FD80;
  }
                    /* WARNING: Could not recover jumptable at 0x8698. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8657 @ 8657 =====

void __h3000 FUN_8657(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)in_D == '`') {
    DAT_608b = FUN_8662;
  }
  else {
    DAT_608b = API_FD80;
  }
                    /* WARNING: Could not recover jumptable at 0x8698. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8662 @ 8662 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8698 */
/* WARNING: Removing unreachable block (RAM,0x8692) */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8662(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
  DAT_608b = &UNK_867c;
                    /* WARNING: Could not recover jumptable at 0x8698. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),0x7c,param_1);
  return;
}


// ===== FUN_8690 @ 8690 =====

void __h3000 FUN_8690(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_608b = 0xffe8;
                    /* WARNING: Could not recover jumptable at 0x8698. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_869a @ 869a =====

undefined2 __h3000 FUN_869a(void)

{
  byte bVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 extraout_B;
  undefined2 uVar4;
  short sVar5;
  undefined *puVar6;
  undefined2 uStack0004;
  char in_stack_00000006;
  undefined2 in_stack_00000007;
  
  puVar6 = &DAT_68c0;
  Io80A7_Clear();
  BankPushSelect();
  *(undefined1 **)(puVar6 + 2) = &SUB_f472;
  sVar5 = 32000;
LAB_86c6:
  while( true ) {
    bVar1 = DAT_8300;
    if ((bVar1 & 1) == 0) goto LAB_86e7;
    if ((bVar1 & 0x20) != 0) break;
    bVar1 = DAT_8301;
    sVar5 = 32000;
    if ((char)bVar1 < '\0') {
      if ((bVar1 & 0xf8) != 0xf8) {
        *(undefined1 **)(puVar6 + 2) = &SUB_f472;
        Io80A7_Set();
        BankPop(bVar1 & 0xf8);
        do {
          cVar2 = DAT_8301;
          if (DAT_6116 != '\0') {
            if (cVar2 < '\0') {
              uStack0004 = 0x85e1;
              (*DAT_60f2)();
            }
            else {
              uStack0004 = 0x85d3;
              (*DAT_608b)();
            }
          }
          while( true ) {
            bVar1 = DAT_8300;
            if ((bVar1 & 1) == 0) {
              uStack0004 = 0x8722;
              uVar3 = (*DAT_6004)();
              uVar4 = CONCAT11(uVar3,extraout_B);
              if (in_stack_00000006 < '\0') {
                uVar4 = in_stack_00000007;
              }
              return uVar4;
            }
            if ((bVar1 & 0x20) == 0) break;
            uVar3 = DAT_8301;
            uStack0004 = 0x85db;
            FUN_861c();
          }
        } while( true );
      }
      FUN_8723();
    }
    else {
      (**(code **)(puVar6 + 2))();
      g_curBank = puVar6[0xb];
      BANK_LATCH = g_curBank;
    }
  }
  goto LAB_86eb;
LAB_86e7:
  sVar5 = sVar5 + -1;
  if (sVar5 == 0) {
LAB_86eb:
    uVar3 = DAT_8301;
  }
  goto LAB_86c6;
}


// ===== FUN_8708 @ 8708 =====

void __h3000 FUN_8708(void)

{
  Io80A7_Set();
  return;
}


// ===== FUN_8723 @ 8723 =====

void __h3000 FUN_8723(undefined1 param_1,char param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((param_2 == -8) && (DAT_613c = DAT_613c + '\x01', DAT_613c == '\0')) {
    DAT_613c = -1;
  }
                    /* WARNING: Could not recover jumptable at 0x8735. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_8737 @ 8737 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x87f4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8737(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  char cVar2;
  ushort uVar3;
  ushort in_D;
  ushort uVar4;
  short sVar5;
  ushort uVar6;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar4 = in_D;
  if (DAT_613d != DAT_614e) {
    DAT_614e = DAT_613d;
    bVar1 = (&DAT_613e)[DAT_613d];
    uVar4 = CONCAT11(bVar1,DAT_613d + -1) & 0xff0f;
    cVar2 = (char)(uVar4 >> 8) - (&DAT_613e)[(char)uVar4];
    if ((cVar2 == '\0' && (short)((ushort)(byte)(cVar2 - 1) << 8) < 0 == SBORROW1(cVar2,'\x01')) ||
       ((cVar2 != -1) != (cVar2 == -1))) {
      DAT_613e = bVar1;
      DAT_613f = bVar1;
      DAT_6140 = bVar1;
      DAT_6141 = bVar1;
      DAT_6142 = bVar1;
      DAT_6143 = bVar1;
      DAT_6144 = bVar1;
      DAT_6145 = bVar1;
      DAT_6146 = bVar1;
      DAT_6147 = bVar1;
      DAT_6148 = bVar1;
      DAT_6149 = bVar1;
      DAT_614a = bVar1;
      DAT_614b = bVar1;
      DAT_614c = bVar1;
      DAT_614d = bVar1;
    }
    uVar6 = (ushort)DAT_613e + (ushort)DAT_613f + (ushort)DAT_6140 + (ushort)DAT_6141 +
            (ushort)DAT_6142 + (ushort)DAT_6143 + (ushort)DAT_6144 + (ushort)DAT_6145 +
            (ushort)DAT_6146 + (ushort)DAT_6147 + (ushort)DAT_6148 + (ushort)DAT_6149 +
            (ushort)DAT_614a + (ushort)DAT_614b + (ushort)DAT_614c + (ushort)DAT_614d;
    if (((bVar1 != 0) && (uVar3 = uVar6 - DAT_60eb, !(bool)((uVar6 == DAT_60eb) + (uVar3 == 1)))) &&
       (uVar3 != 0xffff)) {
      if ((bool)((uVar3 < 2) + (uVar3 == 2))) {
        sVar5 = -1;
      }
      else {
        DAT_60eb = uVar6;
        uVar4 = uVar6;
        if ((short)uVar3 < -2) goto LAB_87f2;
        sVar5 = 1;
      }
      DAT_60eb = sVar5 + uVar6;
      uVar4 = sVar5 + uVar6;
    }
  }
LAB_87f2:
                    /* WARNING: Could not recover jumptable at 0x87f4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8),(char)uVar4,param_1,param_2);
  return;
}


// ===== NMI_Handler @ 87f6 =====

/* WARNING: Removing unreachable block (RAM,0xc931) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 NMI_Handler(void)

{
  undefined2 uVar1;
  char cVar3;
  undefined1 uVar4;
  ushort uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined1 *puVar5;
  short sVar6;
  char in_stack_00000000;
  undefined2 in_stack_00000001;
  
  if ((char)((ushort)&stack0x0000 >> 8) != 'd') {
    DAT_80a7 = 0;
    BANK_LATCH = 0;
    DAT_80a1 = 0;
    sVar6 = 0x1fff;
    puVar5 = &DAT_6000;
    do {
      *puVar5 = 0;
      sVar6 = sVar6 + -1;
      puVar5 = puVar5 + 1;
    } while (sVar6 != 0);
    DAT_6000 = 0x5a;
    DAT_64fe = (undefined **)0x8432;
    Io80A7_Clear();
    DAT_64fe = (undefined **)0x8438;
    API_FD50(0x10);
    LAB_6600 = 0xb7;
    DAT_6601 = &DAT_8055;
    DAT_6603 = 0x3b;
    SWI_trampoline = 0x3b;
    SWI2_trampoline = 0x3b;
    SWI3_trampoline = 0x3b;
    DAT_64fe = &PTR_DAT_8454;
    StoreWordsInline(0x3b,0x55,0x6604);
    DAT_613c = '\x05';
    DAT_6019 = 0xff;
    DAT_64fe = (undefined **)0x848b;
    API_FD76();
    DAT_64fe = (undefined **)0x848e;
    API_FC78();
    DAT_64fe = (undefined **)0x8491;
    FUN_90ab();
    DAT_64fe = (undefined **)0x8494;
    API_FCA4();
    DAT_64fe = (undefined **)0x8497;
    API_FC34();
    DAT_64fe = (undefined **)s___THE_H3500_DYNAMIC_ULTRA_HARMON_849a;
    LcdPrintInline();
    DAT_64fe = (undefined **)0x84c5;
    API_FC22();
    DAT_64fe = (undefined **)0x84c8;
    uVar1 = Io80A7_Set();
    DAT_64fe = (undefined **)0x84ce;
    API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0283);
    DAT_64fe = (undefined **)0x84d1;
    API_FC4A();
    DAT_64fe = (undefined **)0x84d4;
    API_FDD8();
    DAT_64fe = (undefined **)0x84d7;
    FUN_cb9c();
    DAT_64fe = (undefined **)0x84da;
    FUN_fbf3();
    DAT_64fe = (undefined **)0x84dd;
    FUN_f948();
    DAT_64fe = (undefined **)0x84e0;
    API_FDF6();
    DAT_64fe = (undefined **)0x84ea;
    API_FD22(0xf8);
    DAT_64fe = (undefined **)0x84ed;
    API_FC84();
    DAT_64fe = (undefined **)0x84f0;
    FUN_d08b();
    DAT_64fe = (undefined **)0x84f9;
    API_FC80();
    DAT_64fe = (undefined **)0x8502;
    API_FC80();
    DAT_61dc._0_1_ = 0x75;
    DAT_61dc._1_1_ = 0x1f;
    DAT_61de = 0x11;
    DAT_64fe = (undefined **)0x8514;
    API_FDAE();
    if ((extraout_CC >> 2 & 1) != 0) {
      DAT_64fe = (undefined **)0x8519;
      FUN_c93c();
    }
    DAT_64fe = (undefined **)0x851c;
    cVar3 = API_FC1A();
    if (cVar3 == '\x15') {
      DAT_64fe = (undefined **)0x852c;
      FUN_c73e();
    }
    else {
      if (cVar3 == '\x06') {
        DAT_64fe = (undefined **)0x8527;
        FUN_c967();
      }
      DAT_64fe = (undefined **)0x8532;
      FUN_c953();
      if (!(bool)(extraout_CC_00 >> 2 & 1)) {
        DAT_64fe = (undefined **)s_NV_8537;
        LcdPrintInline();
      }
      DAT_64fe = (undefined **)0x8540;
      FUN_c953();
      DAT_64fe = (undefined **)0x8543;
      API_FDFA();
      DAT_64fe = (undefined **)0x8546;
      FUN_8c50();
      DAT_64fe = (undefined **)0x8549;
      FUN_b00d();
      DAT_64fe = (undefined **)0x854c;
      API_FDCE();
      DAT_64fe = (undefined **)0x8552;
      API_FD20(0xf);
      DAT_64fe = (undefined **)0x8555;
      API_FC5E();
      DAT_64fe = (undefined **)0x8558;
      API_FC64();
      DAT_6019 = 0;
    }
    do {
      g_curBank = DAT_6102;
      BANK_LATCH = DAT_6102;
      DAT_64fe = (undefined **)0x8567;
      API_FCAE();
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DAT_64fe = (undefined **)0x856f;
        API_FCAC(0);
        DAT_64fe = (undefined **)0x8572;
        API_FC1C();
        DAT_64fe = (undefined **)0x8575;
        FUN_9515();
      }
      DAT_64fe = (undefined **)0x8577;
      API_FE2A();
    } while( true );
  }
  (*_DAT_6002)();
  uVar4 = API_FC24();
  cVar3 = DAT_614f;
  DAT_61b8 = DAT_61b8 + '\x01';
  DAT_613a = DAT_613a + '\x01';
  if (DAT_613a == '\0') {
    uVar2 = CONCAT11(DAT_613c,uVar4);
    if (DAT_613c == '\0') {
      uVar2 = 2;
      DAT_6150 = '\x02';
    }
    else if (DAT_6150 == '\0') {
      DAT_614f = DAT_613c;
      uVar2 = CONCAT11(DAT_613d + '\x01',cVar3) & 0xfff;
      DAT_613d = (char)(uVar2 >> 8);
      (&DAT_613e)[DAT_613d] = (char)uVar2;
    }
    else {
      DAT_614f = DAT_613c;
      DAT_6150 = DAT_6150 + -1;
    }
    uVar4 = (undefined1)uVar2;
    DAT_613c = '\0';
  }
  DAT_80a7 = 0;
  DAT_80a7 = 1;
  uVar1 = CONCAT11(1,uVar4);
  if (in_stack_00000000 < '\0') {
    uVar1 = in_stack_00000001;
  }
  return uVar1;
}


// ===== FIRQ_Handler @ 8848 =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FIRQ_Handler(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== RomFindRecord @ 885d =====

/* Kernel API slot $FC02: D = record key; scans the bank chains, leaves bank/ptr/len in
   $6079/$607A/$607D */

void __h3000 RomFindRecord(void)

{
  short in_D;
  short sVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 local_2;
  
  sVar1 = RomFirstRecord();
  bVar2 = extraout_CC;
  while (((bVar2 >> 2 & 1) != 0 && (sVar1 != in_D))) {
    sVar1 = RomNextRecord();
    bVar2 = extraout_CC_00;
  }
  local_2 = (undefined1)((ushort)in_D >> 8);
                    /* WARNING: Could not recover jumptable at 0x886e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(local_2);
  return;
}


// ===== RomStreamReadByte @ 8870 =====

/* Kernel API slot $FC04: next byte of the current record (crosses bank boundaries) */

void __h3000 RomStreamReadByte(void)

{
  short sVar1;
  ushort uVar2;
  byte extraout_CC;
  
  if (DAT_607c != '\0') {
    return;
  }
  BankPushSelect();
  DAT_607a = DAT_607a + 1;
  sVar1 = DAT_607d + -1;
  if (sVar1 != 0) {
    uVar2 = DAT_607a;
    DAT_607d = sVar1;
    if ((((char)DAT_607a != '\0') || ((DAT_607a & 0x3f00) != 0)) ||
       (uVar2 = FUN_8996(), (extraout_CC >> 2 & 1) != 0)) goto LAB_88a4;
    DAT_6076 = 0xff;
  }
  DAT_607c = -1;
  uVar2 = DAT_607a;
LAB_88a4:
  DAT_607a = uVar2;
  BankPop();
  return;
}


// ===== API_FD9E @ 88bf =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x88d4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FD9E(undefined1 param_1,undefined1 param_2)

{
  undefined1 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x88d4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_Y,param_2,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== RomFirstRecord @ 88d6 =====

/* Kernel API slot $FDA0 */

short __h3000 RomFirstRecord(void)

{
  short *psVar1;
  short sVar2;
  byte extraout_CC;
  
  BankPushSelect();
  DAT_607f = 0xff52;
  do {
    psVar1 = (short *)FUN_8996();
    if ((extraout_CC >> 2 & 1) == 0) {
      DAT_607a = (short *)0x0;
      DAT_6077 = 0;
      DAT_607d = 0;
      DAT_6076 = (undefined1)((ushort)psVar1 >> 8);
      sVar2 = BankPop();
      return sVar2;
    }
  } while (*psVar1 != -0x55ab);
  DAT_607c = 0;
  DAT_6076 = 0;
  DAT_607d = psVar1[1];
  DAT_6077 = *psVar1;
  DAT_607a = psVar1;
  BankPop();
  return DAT_6077;
}


// ===== FUN_88f5 @ 88f5 =====

short __h3000 FUN_88f5(void)

{
  short *psVar1;
  short sVar2;
  byte extraout_CC;
  
  BankPushSelect();
  do {
    psVar1 = (short *)FUN_8996();
    if ((extraout_CC >> 2 & 1) == 0) {
      DAT_607a = (short *)0x0;
      DAT_6077 = 0;
      DAT_607d = 0;
      DAT_6076 = (undefined1)((ushort)psVar1 >> 8);
      sVar2 = BankPop();
      return sVar2;
    }
  } while (*psVar1 != -0x55ab);
  DAT_607c = 0;
  DAT_6076 = 0;
  DAT_607d = psVar1[1];
  DAT_6077 = *psVar1;
  DAT_607a = psVar1;
  BankPop();
  return DAT_6077;
}


// ===== FUN_8917 @ 8917 =====

void __h3000 FUN_8917(void)

{
  return;
}


// ===== FUN_891a @ 891a =====

undefined2 __h3000 FUN_891a(void)

{
  undefined2 in_D;
  short in_Y;
  
  DAT_607c = 0;
  DAT_6076 = 0;
  DAT_607d = *(undefined2 *)(in_Y + 2);
  DAT_6077 = in_D;
  DAT_607a = in_Y;
  BankPop();
  return DAT_6077;
}


// ===== RomNextRecord @ 893a =====

/* Kernel API slot $FDA2 */

short __h3000 RomNextRecord(void)

{
  short sVar1;
  short *psVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  
  psVar2 = (short *)BankPushSelect();
  if (DAT_6076 == '\0') {
    if (DAT_6077 == -1) {
LAB_88e4:
      while (psVar2 = (short *)FUN_8996(), (extraout_CC >> 2 & 1) != 0) {
        if (*psVar2 == -0x55ab) {
          DAT_607c = 0;
          DAT_6076 = 0;
          DAT_607d = psVar2[1];
          DAT_6077 = *psVar2;
          DAT_607a = psVar2;
          BankPop();
          return DAT_6077;
        }
      }
    }
    else {
      do {
        if ((char)((8 < DAT_607d) + (DAT_607d == 8)) == '\0') goto LAB_88e4;
        if ((((ushort)DAT_607a & 0x3fff) + DAT_607d & 0xc000) == 0) {
          DAT_607a = (short *)((short)DAT_607a + DAT_607d);
          sVar1 = FUN_891a((char)((ushort)*DAT_607a >> 8));
          return sVar1;
        }
        DAT_607d = DAT_607d - (0x4000 - ((ushort)DAT_607a & 0x3fff));
        psVar2 = (short *)FUN_8996();
        DAT_607a = psVar2;
      } while ((extraout_CC_00 >> 2 & 1) != 0);
    }
  }
  DAT_607a = (short *)0x0;
  DAT_6077 = 0;
  DAT_607d = 0;
  DAT_6076 = (char)((ushort)psVar2 >> 8);
  sVar1 = BankPop();
  return sVar1;
}


// ===== FUN_8996 @ 8996 =====

short __h3000 FUN_8996(void)

{
  short sVar1;
  
  sVar1 = *DAT_607f;
  DAT_607f = DAT_607f + 1;
  if (sVar1 != -1) {
    DAT_6079 = (undefined1)((ushort)sVar1 >> 8);
    g_curBank = DAT_6079;
    BANK_LATCH = DAT_6079;
    return sVar1 << 8;
  }
  return -1;
}


// ===== API_FDA4 @ 89b4 =====

short __h3000 API_FDA4(void)

{
  ushort uVar1;
  short in_D;
  short sVar2;
  byte extraout_CC;
  
  DAT_607d = DAT_607d - in_D;
  uVar1 = (DAT_607a & 0x3fff) + in_D;
  if ((uVar1 & 0xc000) == 0) {
    DAT_607a = DAT_607a + in_D;
  }
  else {
    DAT_607a = uVar1 & 0xc0ff;
    sVar2 = FUN_8996();
    if ((extraout_CC >> 2 & 1) == 0) {
      return in_D;
    }
    DAT_607a = sVar2 + DAT_607a;
  }
  return in_D;
}


// ===== FUN_89ed @ 89ed =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x89f8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_89ed(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FD04(0,0xb,&DAT_6076);
                    /* WARNING: Could not recover jumptable at 0x89f8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FE1E @ 89fa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8a06 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE1E(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FD04(0,0xb,param_1,&DAT_6076);
                    /* WARNING: Could not recover jumptable at 0x8a06. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FC06 @ 8a08 =====

undefined1 __h3000 API_FC06(void)

{
  undefined1 extraout_B;
  undefined1 uVar1;
  byte extraout_CC;
  
  RomFindRecord();
  uVar1 = extraout_B;
  if ((extraout_CC >> 2 & 1) != 0) {
    uVar1 = DAT_6079;
  }
  return uVar1;
}


// ===== API_FC08 @ 8a16 =====

void __h3000 API_FC08(void)

{
  short in_D;
  byte extraout_CC;
  undefined1 uStack0000;
  
  if ((in_D != -1) && (RomFindRecord(), (extraout_CC >> 2 & 1) != 0)) {
    API_FDA4(0);
    BankPushSelect();
    uStack0000 = 0x31;
    (*DAT_607a)();
    uStack0000 = 0x34;
    BankPop();
  }
  return;
}


// ===== API_FD22 @ 8a3c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8a57 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FD22(undefined2 param_1,undefined2 *param_2)

{
  undefined2 in_D;
  byte extraout_CC;
  undefined2 *puVar1;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar1 = param_2;
  puVar2 = param_2;
  API_FC06();
  if ((extraout_CC >> 2 & 1) == 0) {
    *puVar1 = 0;
  }
  else {
    *puVar1 = puVar2;
    *(char *)(puVar1 + 1) = (char)in_D;
    *(undefined1 *)((short)puVar1 + 3) = 0;
  }
                    /* WARNING: Could not recover jumptable at 0x8a57. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FD24 @ 8a59 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8a7a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FD24(undefined1 param_1,undefined1 param_2,short param_3,short *param_4)

{
  short **ppsVar1;
  undefined1 uStack_6;
  undefined1 local_5;
  short sStack_4;
  short *psStack_2;
  
  psStack_2 = param_4;
  sStack_4 = param_3;
  local_5 = param_2;
  ppsVar1 = (short **)&uStack_6;
  if (*param_4 != 0) {
    BankPushSelect();
    (*(code *)(*param_4 + *(short *)(*param_4 + sStack_4)))();
    BankPop();
    ppsVar1 = &psStack_2;
  }
                    /* WARNING: Could not recover jumptable at 0x8a7a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)ppsVar1[3])((char)((ushort)*ppsVar1 >> 8),param_2,ppsVar1[1],ppsVar1[2]);
  return;
}


// ===== FarCallInline @ 8a7c =====

/* Kernel API slot $FD26: inline (key, descriptor) */

ushort __h3000 FarCallInline(void)

{
  short *psVar1;
  undefined1 uVar2;
  ushort in_D;
  byte extraout_B;
  short *local_res0;
  ushort local_d;
  
  uVar2 = g_curBank;
  psVar1 = (short *)local_res0[1];
  local_d = in_D;
  if (*psVar1 != 0) {
    g_curBank = *(undefined1 *)(psVar1 + 1);
    BANK_LATCH = g_curBank;
    (*(code *)(*psVar1 + *(short *)(*psVar1 + *local_res0)))((char)(in_D >> 8));
    local_d = (ushort)extraout_B;
    BANK_LATCH = uVar2;
  }
  g_curBank = uVar2;
  return local_d;
}


// ===== API_FC0C @ 8adb =====

void __h3000 API_FC0C(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  byte extraout_CC;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)param_2 >> 8);
  RomFindRecord((char)((ushort)param_1 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDA4(0);
    API_FDA4(uVar1);
    RomStreamReadByte();
  }
                    /* WARNING: Could not recover jumptable at 0x8af6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FC0E @ 8af8 =====

void __h3000 API_FC0E(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 uVar1;
  byte extraout_CC;
  
  RomFindRecord((char)((ushort)param_3 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDA4(0);
    API_FDA4((char)((ushort)param_4 >> 8) << 1 | (byte)param_4 >> 7);
    uVar1 = RomStreamReadByte();
    RomStreamReadByte(uVar1);
  }
  return;
}


// ===== API_FC0A @ 8b19 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8b2d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC0A(undefined2 param_1,undefined1 *param_2)

{
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  code *UNRECOVERED_JUMPTABLE;
  
  RomFindRecord((char)((ushort)param_1 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    while (RomStreamReadByte(), (extraout_CC_00 >> 2 & 1) != 0) {
      *param_2 = (char)in_D;
      param_2 = param_2 + 1;
    }
  }
                    /* WARNING: Could not recover jumptable at 0x8b2d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== API_FC10 @ 8b2f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8b48 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC10(undefined2 param_1,undefined1 *param_2,undefined2 *param_3)

{
  ushort uVar1;
  short in_D;
  undefined1 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  uVar2 = (undefined1)in_D;
  RomFindRecord((char)((ushort)param_1 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDA4((char)((ushort)*param_3 >> 8));
    do {
      RomStreamReadByte();
      if ((extraout_CC_00 >> 2 & 1) == 0) break;
      *param_2 = uVar2;
      in_D = in_D + -1;
      param_2 = param_2 + 1;
    } while (in_D != 0);
  }
                    /* WARNING: Could not recover jumptable at 0x8b48. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,uVar2,param_1);
  return;
}


// ===== KernelHelper_FC12 @ 8b4a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8b62 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC12: inline: 2 words */

void __h3000 KernelHelper_FC12(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  short local_res0;
  
  uVar1 = (undefined1)*(undefined2 *)(local_res0 + 2);
  API_FC10((char)((ushort)*(undefined2 *)(local_res0 + 2) >> 8),uVar1,in_D);
                    /* WARNING: Could not recover jumptable at 0x8b62. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 4))((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== API_FDA8 @ 8b64 =====

void __h3000 API_FDA8(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  byte extraout_B;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  RomFindRecord();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_600c = DAT_6079;
    API_FCA0(extraout_A,DAT_6079,DAT_607a + 5);
    if ((extraout_B & 1) != 0) {
      API_FCA2(extraout_A_00,0xff);
      FUN_8c50();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x8b91. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDAC @ 8b93 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8ba6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDAC(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = param_2;
  FUN_8c1c();
  DAT_6159 = 0;
  DAT_6155 = uVar1;
  DAT_6157 = uVar1;
                    /* WARNING: Could not recover jumptable at 0x8ba6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_8ba8 @ 8ba8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8bc7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8ba8(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 in_X;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  *DAT_6155 = in_X;
  DAT_6159 = DAT_6159 + 1;
  DAT_6155 = DAT_6155 + 1;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8bc7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_3 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_8bc9 @ 8bc9 =====

void __h3000 FUN_8bc9(void)

{
  ushort uVar1;
  short in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  do {
    FUN_8ba8();
    in_D = in_D + -1;
  } while (in_D != 0);
                    /* WARNING: Could not recover jumptable at 0x8bd5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1);
  return;
}


// ===== FUN_8bd7 @ 8bd7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8c1a */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_8bd7(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,undefined2 param_5)

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  _DAT_6017 = DAT_6155;
  sVar2 = DAT_6155;
  API_FDDE(0);
  pcVar3 = DAT_6157;
  DAT_60bd = (short)&UNK_1ffa - sVar2;
  DAT_6157[5] = DAT_6157[5] | 1;
  sVar2 = DAT_6159;
  *(short *)(pcVar3 + 2) = DAT_6159;
  pcVar3[4] = '\0';
  do {
    cVar1 = *pcVar3;
    sVar2 = sVar2 + -1;
    pcVar3 = pcVar3 + 1;
  } while (sVar2 != 0);
  DAT_6157[4] = -(param_2 + cVar1);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8c1a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)param_4 >> 8),param_2,param_5,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_8c1c @ 8c1c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8c4e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8c1c(undefined1 param_1,undefined1 param_2)

{
  short *psVar1;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  psVar1 = &DAT_0300;
  while( true ) {
    if (*psVar1 == -1) break;
    if ((char)*psVar1 == -1) {
      psVar1 = (short *)((short)psVar1 + psVar1[1]);
    }
    else {
      API_FD04((char)((ushort)psVar1[1] >> 8));
    }
  }
  API_FDDE(0);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8c4e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_stack_00000000 >> 8),param_2,in_stack_00000002);
  return;
}


// ===== FUN_8c50 @ 8c50 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8c64 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_8c50(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,undefined2 param_5)

{
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_4;
  FUN_8c1c();
  DAT_60bd = (short)&UNK_1ffa - (sVar1 + 8);
  _DAT_6017 = sVar1;
                    /* WARNING: Could not recover jumptable at 0x8c64. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)DAT_60bd >> 8),param_2,param_3,param_4,param_5);
  return;
}


// ===== API_FC18 @ 8c66 =====

void __h3000 API_FC18(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FDD6]: $6022 */
  API_FDD6();
  DAT_6032 = FUN_8c7b;
  DAT_6034 = FUN_8cfd;
                    /* WARNING: Could not recover jumptable at 0x8c79. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8c7b @ 8c7b =====

void __h3000 FUN_8c7b(undefined1 param_1)

{
  BankPushSelect(param_1,DAT_6022);
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->8CAB 1->8CB6 2->8CB0 3->8CAB 4->8CAB
                       5->8CA4 6->8C9C 7->8CAB */
  JumpTableDispatch(0,DAT_6058 & 7);
}


// ===== FUN_8c9c @ 8c9c =====

void __h3000 FUN_8c9c(void)

{
  byte extraout_CC;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_8ccc();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_8ce6();
    (*DAT_605a)((char)((ushort)DAT_60de >> 8));
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8cae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8ca4 @ 8ca4 =====

void __h3000 FUN_8ca4(void)

{
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  (*DAT_605a)((char)((ushort)DAT_60de >> 8));
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8cae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8cab @ 8cab =====

void __h3000 FUN_8cab(void)

{
  undefined1 in_stack_00000003;
  undefined1 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8cae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003,in_stack_00000004);
  return;
}


// ===== FUN_8cb0 @ 8cb0 =====

void __h3000 FUN_8cb0(void)

{
  ushort uVar1;
  byte extraout_CC;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_8ccc();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_8ce6();
    uVar1 = DAT_6054 + DAT_60de;
    if ((CARRY2(DAT_6054,DAT_60de)) ||
       (DAT_6054 = uVar1, !(bool)((uVar1 < DAT_6056) + (uVar1 == DAT_6056)))) {
      DAT_6054 = DAT_6056;
    }
    (*DAT_605a)();
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8cae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8cb6 @ 8cb6 =====

void __h3000 FUN_8cb6(void)

{
  ushort uVar1;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_6054 + DAT_60de;
  if ((CARRY2(DAT_6054,DAT_60de)) ||
     (DAT_6054 = uVar1, !(bool)((uVar1 < DAT_6056) + (uVar1 == DAT_6056)))) {
    DAT_6054 = DAT_6056;
  }
  (*DAT_605a)();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8cae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8ccc @ 8ccc =====

void __h3000 FUN_8ccc(void)

{
  undefined2 in_D;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_604c == '\0') || (API_FCAA(), (extraout_CC >> 2 & 1) != 0)) {
    API_FCA8((char)((ushort)DAT_60e0 >> 8));
  }
                    /* WARNING: Could not recover jumptable at 0x8ce4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8ce6 @ 8ce6 =====

void __h3000 FUN_8ce6(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_604c == '\0') {
    API_FCA8((char)((ushort)(DAT_60e0 + 100) >> 8));
  }
  DAT_604c = 0xff;
                    /* WARNING: Could not recover jumptable at 0x8cfb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8cfd @ 8cfd =====

void __h3000 FUN_8cfd(undefined1 param_1)

{
  BankPushSelect(param_1,DAT_6022);
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->8D30 1->8D3D 2->8D35 3->8D30 4->8D30
                       5->8D26 6->8D1E 7->8D30 */
  JumpTableDispatch(0,DAT_6058 & 7);
}


// ===== FUN_8d1e @ 8d1e =====

void __h3000 FUN_8d1e(void)

{
  byte extraout_CC;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_8ccc();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_8ce6();
    (*DAT_605a)((char)((ushort)-DAT_60de >> 8));
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8d33. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8d26 @ 8d26 =====

void __h3000 FUN_8d26(void)

{
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  (*DAT_605a)((char)((ushort)-DAT_60de >> 8));
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8d33. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8d30 @ 8d30 =====

void __h3000 FUN_8d30(void)

{
  undefined1 in_stack_00000003;
  undefined1 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8d33. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003,in_stack_00000004);
  return;
}


// ===== FUN_8d35 @ 8d35 =====

void __h3000 FUN_8d35(void)

{
  ushort uVar1;
  byte extraout_CC;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_8ccc();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_8ce6();
    uVar1 = DAT_6054 - DAT_60de;
    if (!(bool)((uVar1 < DAT_6054) + (uVar1 == DAT_6054))) {
      uVar1 = 0;
    }
    DAT_6054 = uVar1;
    (*DAT_605a)();
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8d33. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== FUN_8d3d @ 8d3d =====

void __h3000 FUN_8d3d(void)

{
  ushort uVar1;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_6054 - DAT_60de;
  if (!(bool)((uVar1 < DAT_6054) + (uVar1 == DAT_6054))) {
    uVar1 = 0;
  }
  DAT_6054 = uVar1;
  (*DAT_605a)();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8d33. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000003);
  return;
}


// ===== API_FC14 @ 8d51 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8db3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC14(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FDD6]: $6022 */
  API_FDD6();
  DAT_60db = 0;
  DAT_601f = -DAT_606e;
  DAT_615b = DAT_601f + DAT_606c;
  DAT_615d = DAT_601f;
  if (DAT_6066 != '\0') {
    DAT_615f = DAT_6074;
    DAT_6062 = DAT_6074 + DAT_601f;
    DAT_605c = FUN_8dd7;
    DAT_6064 = DAT_615b;
    API_FC28();
  }
  if (DAT_6058 != '\0') {
    DAT_6056 = DAT_615b;
    DAT_6054 = DAT_6074 + DAT_615d;
    DAT_605a = FUN_8e11;
    API_FC18();
  }
  DAT_606a = FUN_8e23;
  API_FC1E();
                    /* WARNING: Could not recover jumptable at 0x8db3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_8db5 @ 8db5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8db5(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short *psVar3;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = DAT_606e;
  *(char *)(param_3 + -1) = (char)DAT_606e;
  *(char *)(param_3 + -2) = (char)((ushort)uVar2 >> 8);
  uVar2 = DAT_606c;
  *(char *)(param_3 + -3) = (char)DAT_606c;
  *(char *)(param_3 + -4) = (char)((ushort)uVar2 >> 8);
  *(char *)(param_3 + -5) = (char)in_D;
  psVar3 = (short *)(param_3 + -6);
  *(char *)psVar3 = (char)((ushort)in_D >> 8);
  API_FCD8();
  DAT_6054 = *psVar3 + DAT_615d;
  sVar1 = *psVar3;
  DAT_604d = 0;
  DAT_6062 = DAT_6054;
  DAT_6074 = sVar1;
  *(char *)((short)psVar3 + 1) = (char)sVar1;
  *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
  API_FC40(0x10,(char)sVar1,param_1,&DAT_609a);
  FUN_8f1a();
  BankPushSelect();
  (*DAT_6070)((char)((ushort)DAT_6074 >> 8));
  (*DAT_6072)();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8e0f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_stack_00000002 >> 8));
  return;
}


// ===== FUN_8dd7 @ 8dd7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_8dd7(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 uVar1;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60db = 1;
  DAT_6054 = DAT_6062;
  DAT_6074 = DAT_6062 - DAT_615d;
  DAT_604d = 0;
  uVar1 = (undefined1)DAT_6074;
  *(short *)(param_5 + -2) = DAT_6074;
  API_FC40(0x10,uVar1,param_3,&DAT_609a);
  FUN_8f1a();
  BankPushSelect();
  (*DAT_6070)((char)((ushort)DAT_6074 >> 8));
  (*DAT_6072)();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8e0f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_stack_00000002 >> 8));
  return;
}


// ===== FUN_8e11 @ 8e11 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_8e11(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 uVar1;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60db = 2;
  DAT_6062 = DAT_6054;
  DAT_6074 = DAT_6054 - DAT_615d;
  DAT_604d = 0;
  uVar1 = (undefined1)DAT_6074;
  *(short *)(param_5 + -2) = DAT_6074;
  API_FC40(0x10,uVar1,param_3,&DAT_609a);
  FUN_8f1a();
  BankPushSelect();
  (*DAT_6070)((char)((ushort)DAT_6074 >> 8));
  (*DAT_6072)();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x8e0f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_stack_00000002 >> 8));
  return;
}


// ===== FUN_8e23 @ 8e23 =====

undefined2 __h3000 FUN_8e23(void)

{
  undefined2 in_stack_00000002;
  
  DAT_60db = 3;
  DAT_6054 = DAT_6074 + DAT_615d;
  DAT_6062 = DAT_6054;
  FUN_8f1a();
  BankPushSelect();
  (*DAT_6072)((char)((ushort)DAT_6074 >> 8));
  BankPop();
  return in_stack_00000002;
}


// ===== FUN_8e4c @ 8e4c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8f18 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8e4c(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte bVar1;
  undefined1 extraout_A;
  code *pcVar2;
  short *psVar3;
  undefined1 *in_stack_00000000;
  short sStack_b;
  
                    /* inline[API_FC16]: 00 00 00 00 00 00 00 00 $0000 $0000 $0000 ->$0000 ->$0000
                       $0000 $0000 $0000 */
  SetupParamEditPage();
  DAT_6066 = *in_stack_00000000;
  DAT_6067 = in_stack_00000000[1];
  DAT_6058 = in_stack_00000000[2];
  DAT_60e0 = (code *)(ushort)(byte)in_stack_00000000[3];
  DAT_6068 = in_stack_00000000[4];
  DAT_6099 = in_stack_00000000[5];
  DAT_6069 = in_stack_00000000[6];
  sStack_b = 0;
  bVar1 = in_stack_00000000[7];
  if ((char)bVar1 < '\0') {
    sStack_b = g_moduleBase;
  }
  if ((bVar1 & 0x40) == 0) {
    DAT_606c = *(undefined2 *)(in_stack_00000000 + 8);
    DAT_606e = *(undefined2 *)(in_stack_00000000 + 10);
  }
  else {
    DAT_606c = **(undefined2 **)(in_stack_00000000 + 8);
    DAT_606e = **(undefined2 **)(in_stack_00000000 + 10);
  }
  psVar3 = (short *)(in_stack_00000000 + 0xe);
  if ((char)bVar1 < '\0') {
    DAT_6070 = (code *)(*psVar3 + sStack_b);
    DAT_6072 = (code *)(*(short *)(in_stack_00000000 + 0x10) + sStack_b);
    pcVar2 = DAT_60e0;
  }
  else {
    if (*psVar3 == 0) {
      DAT_6070 = API_FD80;
    }
    else {
      DAT_6070 = (code *)((short)psVar3 + *psVar3);
    }
    psVar3 = (short *)(in_stack_00000000 + 0x10);
    if (*psVar3 == 0) {
      DAT_6072 = API_FD80;
      pcVar2 = DAT_6072;
    }
    else {
      DAT_6072 = (code *)((short)psVar3 + *psVar3);
      pcVar2 = DAT_6072;
    }
  }
  DAT_60dc = *(undefined2 *)(in_stack_00000000 + 0x12);
  DAT_60de = *(undefined2 *)(in_stack_00000000 + 0x14);
  API_FC14((char)((ushort)*(undefined2 *)(in_stack_00000000 + 0x16) >> 8));
                    /* WARNING: Could not recover jumptable at 0x8f18. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(in_stack_00000000 + 0x18))(extraout_A,(char)pcVar2,param_3,param_4);
  return;
}


// ===== SetupParamEditPage @ 8e67 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8f18 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC16: inline 24-byte record: limits + display/adjust callbacks */

void __h3000 SetupParamEditPage(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  code *pcVar2;
  short *psVar3;
  undefined1 *local_res0;
  short local_b;
  
  DAT_6066 = *local_res0;
  DAT_6067 = local_res0[1];
  DAT_6058 = local_res0[2];
  DAT_60e0 = (code *)(ushort)(byte)local_res0[3];
  DAT_6068 = local_res0[4];
  DAT_6099 = local_res0[5];
  DAT_6069 = local_res0[6];
  local_b = 0;
  bVar1 = local_res0[7];
  if ((char)bVar1 < '\0') {
    local_b = g_moduleBase;
  }
  if ((bVar1 & 0x40) == 0) {
    DAT_606c = *(undefined2 *)(local_res0 + 8);
    DAT_606e = *(undefined2 *)(local_res0 + 10);
  }
  else {
    DAT_606c = **(undefined2 **)(local_res0 + 8);
    DAT_606e = **(undefined2 **)(local_res0 + 10);
  }
  psVar3 = (short *)(local_res0 + 0xe);
  if ((char)bVar1 < '\0') {
    DAT_6070 = (code *)(*psVar3 + local_b);
    DAT_6072 = (code *)(*(short *)(local_res0 + 0x10) + local_b);
    pcVar2 = DAT_60e0;
  }
  else {
    if (*psVar3 == 0) {
      DAT_6070 = API_FD80;
    }
    else {
      DAT_6070 = (code *)((short)psVar3 + *psVar3);
    }
    psVar3 = (short *)(local_res0 + 0x10);
    if (*psVar3 == 0) {
      DAT_6072 = API_FD80;
      pcVar2 = DAT_6072;
    }
    else {
      DAT_6072 = (code *)((short)psVar3 + *psVar3);
      pcVar2 = DAT_6072;
    }
  }
  DAT_60dc = *(undefined2 *)(local_res0 + 0x12);
  DAT_60de = *(undefined2 *)(local_res0 + 0x14);
  API_FC14((char)((ushort)*(undefined2 *)(local_res0 + 0x16) >> 8));
                    /* WARNING: Could not recover jumptable at 0x8f18. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 0x18))((char)((ushort)in_D >> 8),(char)pcVar2,param_1,param_2);
  return;
}


// ===== FUN_8f1a @ 8f1a =====

void __h3000 FUN_8f1a(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)((DAT_6074 < DAT_615f) + (DAT_6074 == DAT_615f)) == '\0') {
    DAT_60e2 = 1;
  }
  else if (DAT_6074 < DAT_615f) {
    DAT_60e2 = 0xff;
  }
  else {
    DAT_60e2 = 0;
  }
  DAT_615f = DAT_6074;
                    /* WARNING: Could not recover jumptable at 0x8f39. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_8f3b @ 8f3b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x8f4f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_8f3b(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_605c = 0xffe8;
  DAT_605a = 0xffe8;
  DAT_606a = 0xffe8;
  DAT_6072 = 0xffe8;
  DAT_6070 = 0xffe8;
                    /* WARNING: Could not recover jumptable at 0x8f4f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FC1A @ 8f6a =====

void __h3000 API_FC1A(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  char extraout_B;
  char extraout_B_00;
  char extraout_B_01;
  char extraout_B_02;
  char extraout_B_03;
  char extraout_B_04;
  undefined1 uVar1;
  char cVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  byte extraout_CC_03;
  byte extraout_CC_04;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_8faf(1,param_2,&DAT_604e);
  FUN_8faf();
  FUN_8faf();
  FUN_8faf();
  FUN_8faf();
  FUN_8faf();
  FUN_8fb9(extraout_A,0,&DAT_604e);
  cVar2 = extraout_B;
  if (!(bool)(extraout_CC >> 2 & 1)) {
    FUN_8fb9();
    cVar2 = extraout_B_00;
    if (!(bool)(extraout_CC_00 >> 2 & 1)) {
      FUN_8fb9();
      cVar2 = extraout_B_01;
      if (!(bool)(extraout_CC_01 >> 2 & 1)) {
        FUN_8fb9();
        cVar2 = extraout_B_02;
        if (!(bool)(extraout_CC_02 >> 2 & 1)) {
          FUN_8fb9();
          cVar2 = extraout_B_03;
          if (!(bool)(extraout_CC_03 >> 2 & 1)) {
            FUN_8fb9();
            cVar2 = extraout_B_04;
            if ((!(bool)(extraout_CC_04 >> 2 & 1)) && ((DAT_604e & 4) != 0)) {
              uVar1 = 0;
              goto LAB_8fad;
            }
          }
        }
      }
    }
  }
  uVar1 = (&DAT_8f51)[cVar2];
LAB_8fad:
                    /* WARNING: Could not recover jumptable at 0x8fad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,uVar1,param_3);
  return;
}


// ===== FUN_8faf @ 8faf =====

void __h3000 FUN_8faf(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  undefined1 uVar1;
  
  DAT_8057 = param_1;
  uVar1 = DAT_8056;
  *param_3 = uVar1;
  return;
}


// ===== FUN_8fb9 @ 8fb9 =====

void __h3000 FUN_8fb9(undefined1 param_1,char param_2,byte *param_3)

{
  byte bVar1;
  char cVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = 0;
  cVar2 = param_2;
  if ((*param_3 & 1) != 0) {
    cVar2 = param_2 + '\x01';
    bVar1 = 0;
    if ((*param_3 & 2) != 0) {
      cVar2 = param_2 + '\x02';
      bVar1 = 0;
      if ((*param_3 & 0x10) != 0) {
        cVar2 = param_2 + '\x03';
        bVar1 = *param_3 & 0x20;
        if (bVar1 != 0) {
          cVar2 = param_2 + '\x04';
        }
      }
    }
  }
                    /* WARNING: Could not recover jumptable at 0x8fd9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar1,cVar2,param_3 + 1);
  return;
}


// ===== API_FC1C @ 8fdb =====

void __h3000 API_FC1C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC1A();
  FUN_8fe4();
                    /* WARNING: Could not recover jumptable at 0x8fe2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_8fe4 @ 8fe4 =====

undefined2 __h3000 FUN_8fe4(undefined1 param_1)

{
  undefined1 extraout_A;
  byte extraout_B;
  byte in_X;
  undefined2 in_stack_00000000;
  
  BankPushSelect(param_1,DAT_6021);
  if (in_X == DAT_60fd) {
    if (DAT_604c == '\0') goto LAB_8ff8;
  }
  else {
    DAT_604c = '\0';
  }
  DAT_60fd = in_X;
  if ((in_X & 0x10) == 0) {
    FUN_912c();
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9033 1->9039 2->903F 3->9045 4->904B
                       5->9051 6->9057 7->905D 8->9063 9->9069 10->906F 11->9075 12->907B 13->9086
                       14->9091 15->9094 */
    JumpTableDispatch(0,extraout_B & 0xf);
  }
  (*DAT_6044)(extraout_A,in_X);
  (*DAT_6046)();
LAB_8ff8:
  BankPop();
  return in_stack_00000000;
}


// ===== FUN_9033 @ 9033 =====

undefined2 __h3000 FUN_9033(void)

{
  undefined2 in_stack_00000004;
  
  (*DAT_6048)();
  BankPop();
  return in_stack_00000004;
}


// ===== FUN_9039 @ 9039 =====

void __h3000 FUN_9039(void)

{
  (*DAT_603c)();
  FUN_90a5();
  return;
}


// ===== FUN_903f @ 903f =====

void __h3000 FUN_903f(void)

{
  (*DAT_603e)();
  FUN_90a5();
  return;
}


// ===== FUN_9045 @ 9045 =====

void __h3000 FUN_9045(void)

{
  (*DAT_6040)();
  FUN_90a5();
  return;
}


// ===== FUN_904b @ 904b =====

void __h3000 FUN_904b(void)

{
  (*DAT_6042)();
  FUN_90a5();
  return;
}


// ===== FUN_9051 @ 9051 =====

void __h3000 FUN_9051(void)

{
  (*DAT_603a)();
  FUN_90a5();
  return;
}


// ===== FUN_9057 @ 9057 =====

void __h3000 FUN_9057(void)

{
  (*DAT_6030)();
  FUN_90a5();
  return;
}


// ===== FUN_905d @ 905d =====

void __h3000 FUN_905d(void)

{
  (*DAT_602e)();
  FUN_90a5();
  return;
}


// ===== FUN_9063 @ 9063 =====

void __h3000 FUN_9063(void)

{
  (*DAT_602a)();
  FUN_90a5();
  return;
}


// ===== FUN_9069 @ 9069 =====

void __h3000 FUN_9069(void)

{
  (*DAT_602c)();
  FUN_90a5();
  return;
}


// ===== FUN_906f @ 906f =====

void __h3000 FUN_906f(void)

{
  (*DAT_6032)();
  FUN_90a5();
  return;
}


// ===== FUN_9075 @ 9075 =====

void __h3000 FUN_9075(void)

{
  (*DAT_6034)();
  FUN_90a5();
  return;
}


// ===== FUN_907b @ 907b =====

void __h3000 FUN_907b(void)

{
  if (DAT_604d == '\0') {
    (*DAT_6038)();
  }
  FUN_9097();
  return;
}


// ===== FUN_9086 @ 9086 =====

void __h3000 FUN_9086(void)

{
  if (DAT_604d == '\0') {
    (*DAT_6036)();
  }
  FUN_9097();
  return;
}


// ===== FUN_9091 @ 9091 =====

undefined2 __h3000 FUN_9091(void)

{
  undefined2 in_stack_00000004;
  
  BankPop();
  return in_stack_00000004;
}


// ===== FUN_9094 @ 9094 =====

undefined2 __h3000 FUN_9094(void)

{
  undefined2 in_stack_00000004;
  
  BankPop();
  return in_stack_00000004;
}


// ===== FUN_9097 @ 9097 =====

undefined2 __h3000 FUN_9097(undefined1 param_1)

{
  undefined2 in_stack_00000004;
  
  (*DAT_6044)(param_1,DAT_60fd);
  (*DAT_6046)();
  BankPop();
  return in_stack_00000004;
}


// ===== FUN_90a5 @ 90a5 =====

undefined2 __h3000 FUN_90a5(void)

{
  undefined2 in_stack_00000004;
  
  DAT_604d = 0;
  BankPop();
  return in_stack_00000004;
}


// ===== FUN_90ab @ 90ab =====

void __h3000 FUN_90ab(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD18]: [$602A]=$FFE8 [$602C]=$FFE8 [$602E]=$FFE8 [$6030]=$FFE8
                       [$6032]=$FFE8 [$6034]=$FFE8 [$6036]=$FFE8 [$6038]=$FFE8 [$603A]=$FFE8
                       [$603C]=$FFE8 [$603E]=$FFE8 [$6040]=$FFE8 [$6042]=$FFE8 [$6044]=$FFE8
                       [$6046]=$FFE8 [$6048]=$FFE8 [$604A]=$FFE8 */
  StoreWordsInline();
  DAT_604c = 0;
  DAT_604d = 0;
  DAT_60fd = 0;
                    /* WARNING: Could not recover jumptable at 0x90ff. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_9101 @ 9101 =====

void __h3000 FUN_9101(undefined1 param_1,undefined1 param_2,char *param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  char *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  char *pcVar2;
  
  pcVar2 = param_3;
  while (pcVar1 = pcVar2 + 1, *pcVar2 != '\0') {
    FUN_8fe4();
    FUN_8fe4(extraout_A,0);
    pcVar2 = pcVar1;
  }
                    /* WARNING: Could not recover jumptable at 0x9110. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FE4A @ 9112 =====

void __h3000 API_FE4A(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  while( true ) {
    API_FC1A();
    if (extraout_B != DAT_60fd) break;
    API_FE2A();
  }
                    /* WARNING: Could not recover jumptable at 0x9121. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDAE @ 9123 =====

void __h3000 API_FDAE(undefined1 param_1)

{
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_8056;
                    /* WARNING: Could not recover jumptable at 0x912a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== FUN_912c @ 912c =====

void __h3000 FUN_912c(undefined1 param_1,byte param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)((param_2 < 4) + (param_2 == 4)) != '\0') {
    DAT_60b9 = param_2 - 1;
  }
                    /* WARNING: Could not recover jumptable at 0x9136. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC1E @ 9138 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x919a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC1E(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined ***pppuVar1;
  code *UNRECOVERED_JUMPTABLE;
  undefined **ppuStack_b;
  undefined1 uStack_8;
  undefined1 uStack_7;
  undefined2 uStack_6;
  undefined2 uStack_4;
  undefined2 uStack_2;
  
  uStack_8 = (undefined1)((ushort)in_D >> 8);
                    /* inline[API_FDD6]: $6022 */
  ppuStack_b = &PTR_DAT_913d;
  uStack_6 = param_1;
  uStack_4 = param_2;
  uStack_2 = param_3;
  uStack_7 = (char)in_D;
  API_FDD6();
  pppuVar1 = &ppuStack_b;
  ppuStack_b = DAT_6074;
  API_FC40(0x10);
  DAT_60a3 = 0;
  DAT_6044 = FUN_919c;
  DAT_604d = 0;
  pppuVar1[-1] = (undefined **)(DAT_606c - DAT_606e);
  *(undefined1 *)((short)pppuVar1 + -3) = 9;
  pppuVar1 = pppuVar1 + -2;
  *(undefined1 *)pppuVar1 = 0;
  API_FCE6();
  DAT_6165 = *pppuVar1;
  DAT_6161 = DAT_6069 + -1;
  DAT_6168 = 0xff;
  DAT_6167 = 0xff;
  if (DAT_6099 == '\0') {
    DAT_6168 = 0;
  }
  if (-1 < DAT_606e) {
    DAT_6167 = 0;
    DAT_6161 = DAT_6069;
  }
                    /* WARNING: Could not recover jumptable at 0x919a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uStack_8,(char)in_D,uStack_6,uStack_4,uStack_2);
  return;
}


// ===== FUN_919c @ 919c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_919c(void)

{
  ushort in_D;
  ushort uVar1;
  undefined2 in_Y;
  short in_U;
  short sVar2;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = in_U;
  BankPushSelect();
  if (DAT_604d == '\0') {
    DAT_6163 = 0;
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->91E8 1->9221 2->91CB 3->91ED 4->9218
                       5->91E8 6->91E8 7->91E8 */
    JumpTableDispatch();
  }
  SwitchInline(0);
  if (DAT_604d == '\0') {
    FUN_933a();
  }
  if (DAT_6162 != '\0') {
    FUN_9359();
    DAT_6162 = DAT_6162 + -1;
    API_FD12();
    uVar1 = API_FD04(0,8,&DAT_6580,&DAT_609b);
    in_D = uVar1 & 0xff;
    if (DAT_6169 == '\0') {
      (*DAT_6070)();
    }
    else {
      in_D = API_FC20((char)(uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = in_D;
      *(char *)(sVar2 + -1) = (char)in_D;
      *(char *)(sVar2 + -2) = (char)(in_D >> 8);
      API_FC40(0x10);
      (*DAT_6070)();
      (*DAT_606a)((char)(DAT_6074 >> 8));
    }
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_Y >> 8),(char)in_D,in_U,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_91cb @ 91cb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_91cb(undefined2 param_1,undefined2 param_2,short param_3)

{
  ushort in_D;
  byte in_stack_00000000;
  undefined2 uStack0009;
  undefined2 in_stack_0000000f;
  undefined2 in_stack_00000011;
  undefined2 in_stack_00000013;
  undefined2 in_stack_00000015;
  code *UNRECOVERED_JUMPTABLE;
  
  if (0xf < in_stack_00000000) {
    if ((char)((in_stack_00000000 < 0x19) + (in_stack_00000000 == 0x19)) != '\0') {
      in_D = (ushort)(byte)(in_stack_00000000 - 0x10);
      if (!(bool)((in_D < DAT_606c) + (in_D == DAT_606c))) {
        in_D = DAT_606c;
      }
      DAT_6074 = in_D;
      *(char *)(param_3 + -1) = (char)in_D;
      *(char *)(param_3 + -2) = (char)(in_D >> 8);
      API_FC40(0x10,(char)in_D,param_1,&DAT_609a);
      (*DAT_6070)();
      (*DAT_606a)((char)(DAT_6074 >> 8));
    }
  }
  uStack0009 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000f >> 8),(char)in_D,in_stack_00000011,in_stack_00000013,
             in_stack_00000015);
  return;
}


// ===== FUN_91e8 @ 91e8 =====

void __h3000 FUN_91e8(undefined1 param_1)

{
  undefined1 in_stack_00000000;
  undefined2 uStack0009;
  undefined1 in_stack_0000000f;
  undefined1 in_stack_00000010;
  undefined2 in_stack_00000011;
  undefined2 in_stack_00000013;
  undefined2 in_stack_00000015;
  code *UNRECOVERED_JUMPTABLE;
  
  uStack0009 = 0x9338;
  BankPop(param_1,in_stack_00000000);
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            (in_stack_0000000f,in_stack_00000010,in_stack_00000011,in_stack_00000013,
             in_stack_00000015);
  return;
}


// ===== FUN_91ed @ 91ed =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_91ed(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short *param_5)

{
  undefined2 uVar1;
  short sVar2;
  short *psVar3;
  byte in_stack_00000000;
  undefined2 uStack0009;
  undefined2 in_stack_0000000f;
  undefined2 in_stack_00000011;
  undefined2 in_stack_00000013;
  undefined2 in_stack_00000015;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((0xf < in_stack_00000000) &&
     ((char)((in_stack_00000000 < 0x19) + (in_stack_00000000 == 0x19)) != '\0')) {
    sVar2 = DAT_606c;
    if (in_stack_00000000 != 0x19) {
      *(byte *)((short)param_5 + -1) = in_stack_00000000 - 0x10;
      *(undefined1 *)(param_5 + -1) = 0;
      uVar1 = DAT_6165;
      *(char *)((short)param_5 + -3) = (char)DAT_6165;
      psVar3 = param_5 + -2;
      *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
      API_FCEE();
      param_5 = psVar3 + 1;
      sVar2 = DAT_606e + *psVar3;
    }
    param_2 = (undefined1)sVar2;
    DAT_6074 = sVar2;
    *(undefined1 *)((short)param_5 + -1) = param_2;
    *(char *)(param_5 + -1) = (char)((ushort)sVar2 >> 8);
    API_FC40(0x10);
    (*DAT_6070)();
    (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
  }
  uStack0009 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000f >> 8),param_2,in_stack_00000011,in_stack_00000013,
             in_stack_00000015);
  return;
}


// ===== FUN_9218 @ 9218 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9218(void)

{
  ushort in_D;
  ushort uVar1;
  undefined2 in_U;
  short sVar2;
  undefined1 uStack0000;
  undefined2 uStack0009;
  undefined2 in_stack_0000000f;
  undefined2 in_stack_00000011;
  undefined2 in_stack_00000013;
  undefined2 in_stack_00000015;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 uStack_1;
  
  DAT_6169 = -1;
  uStack0000 = 0x2a;
  SwitchInline(0);
  if (DAT_604d == '\0') {
    uStack0000 = 0x48;
    FUN_933a();
  }
  if (DAT_6162 != '\0') {
    uStack0000 = 0x52;
    FUN_9359();
    DAT_6162 = DAT_6162 + -1;
    uStack0000 = (undefined1)in_U;
    API_FD12();
    sVar2 = CONCAT11((char)((ushort)in_U >> 8),uStack0000);
    uStack0000 = 0x70;
    uVar1 = API_FD04(0,8,&DAT_6580,&DAT_609b);
    in_D = uVar1 & 0xff;
    if (DAT_6169 == '\0') {
      uStack0000 = 0x7b;
      (*DAT_6070)();
    }
    else {
      uStack0000 = 0x1a;
      in_D = API_FC20((char)(uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = in_D;
      *(char *)(sVar2 + -1) = (char)in_D;
      *(char *)(sVar2 + -2) = (char)(in_D >> 8);
      uStack0000 = 0x28;
      API_FC40(0x10);
      uStack0000 = 0x2c;
      (*DAT_6070)();
      uStack0000 = 0x33;
      (*DAT_606a)((char)(DAT_6074 >> 8));
    }
  }
  uStack0009 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000f >> 8),(char)in_D,in_stack_00000011,in_stack_00000013,
             in_stack_00000015);
  return;
}


// ===== FUN_9221 @ 9221 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9221(void)

{
  ushort in_D;
  ushort uVar1;
  undefined2 in_U;
  short sVar2;
  undefined1 uStack0000;
  undefined2 uStack0009;
  undefined2 in_stack_0000000f;
  undefined2 in_stack_00000011;
  undefined2 in_stack_00000013;
  undefined2 in_stack_00000015;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 uStack_1;
  
  DAT_6169 = '\0';
  uStack0000 = 0x2a;
                    /* inline[API_FD16]: switch(D) 000C->930E 000D->92C9 001A->927E 001B->929D */
  SwitchInline(0);
  if (DAT_604d == '\0') {
    uStack0000 = 0x48;
    FUN_933a();
  }
  if (DAT_6162 != '\0') {
    uStack0000 = 0x52;
    FUN_9359();
    DAT_6162 = DAT_6162 + -1;
    uStack0000 = (undefined1)in_U;
    API_FD12();
    sVar2 = CONCAT11((char)((ushort)in_U >> 8),uStack0000);
    uStack0000 = 0x70;
    uVar1 = API_FD04(0,8,&DAT_6580,&DAT_609b);
    in_D = uVar1 & 0xff;
    if (DAT_6169 == '\0') {
      uStack0000 = 0x7b;
      (*DAT_6070)();
    }
    else {
      uStack0000 = 0x1a;
      in_D = API_FC20((char)(uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = in_D;
      *(char *)(sVar2 + -1) = (char)in_D;
      *(char *)(sVar2 + -2) = (char)(in_D >> 8);
      uStack0000 = 0x28;
      API_FC40(0x10);
      uStack0000 = 0x2c;
      (*DAT_6070)();
      uStack0000 = 0x33;
      (*DAT_606a)((char)(DAT_6074 >> 8));
    }
  }
  uStack0009 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000f >> 8),(char)in_D,in_stack_00000011,in_stack_00000013,
             in_stack_00000015);
  return;
}


// ===== FUN_927e @ 927e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_927e(void)

{
  ushort uVar1;
  ushort in_D;
  short in_U;
  undefined2 uStack0008;
  undefined2 in_stack_0000000e;
  undefined2 in_stack_00000010;
  undefined2 in_stack_00000012;
  undefined2 in_stack_00000014;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6168 != '\0') {
    if (DAT_604d == '\0') {
      FUN_933a();
    }
    if (DAT_6163 == '\0') {
      DAT_6163 = -1;
      if (DAT_604d == '\0') {
        FUN_933a();
      }
      if (DAT_6162 != '\0') {
        FUN_9359();
        DAT_6162 = DAT_6162 + -1;
        API_FD12();
        uVar1 = API_FD04(0,8,&DAT_6580,&DAT_609b);
        in_D = uVar1 & 0xff;
        if (DAT_6169 == '\0') {
          (*DAT_6070)();
        }
        else {
          in_D = API_FC20((char)(uVar1 >> 8),(char)uVar1,&DAT_609a);
          DAT_6074 = in_D;
          *(char *)(in_U + -1) = (char)in_D;
          *(char *)(in_U + -2) = (char)(in_D >> 8);
          API_FC40(0x10);
          (*DAT_6070)();
          (*DAT_606a)((char)(DAT_6074 >> 8));
        }
      }
    }
  }
  uStack0008 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000e >> 8),(char)in_D,in_stack_00000010,in_stack_00000012,
             in_stack_00000014);
  return;
}


// ===== FUN_929d @ 929d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_929d(void)

{
  ushort uVar1;
  ushort in_D;
  char *pcVar2;
  short in_U;
  undefined2 uStack0008;
  undefined2 in_stack_0000000e;
  undefined2 in_stack_00000010;
  undefined2 in_stack_00000012;
  undefined2 in_stack_00000014;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6167 != '\0') {
    if (DAT_604d == '\0') {
      FUN_933a();
    }
    FUN_9359();
    pcVar2 = (char *)0x6589;
    do {
      pcVar2 = pcVar2 + -1;
      if (*pcVar2 == ' ') break;
    } while (*pcVar2 != '-');
    *pcVar2 = (char)(in_D >> 8);
    uVar1 = API_FD04(0,8,&DAT_6580,&DAT_609b);
    in_D = uVar1 & 0xff;
    if (DAT_6169 == '\0') {
      (*DAT_6070)();
    }
    else {
      in_D = API_FC20((char)(uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = in_D;
      *(char *)(in_U + -1) = (char)in_D;
      *(char *)(in_U + -2) = (char)(in_D >> 8);
      API_FC40(0x10);
      (*DAT_6070)();
      (*DAT_606a)((char)(DAT_6074 >> 8));
    }
  }
  uStack0008 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000e >> 8),(char)in_D,in_stack_00000010,in_stack_00000012,
             in_stack_00000014);
  return;
}


// ===== FUN_92c9 @ 92c9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_92c9(void)

{
  ushort uVar1;
  ushort in_D;
  byte extraout_CC;
  short in_U;
  undefined2 uStack0008;
  undefined2 in_stack_0000000e;
  undefined2 in_stack_00000010;
  undefined2 in_stack_00000012;
  undefined2 in_stack_00000014;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6164 != '\0') {
    API_FD04(0,0x78,&DAT_6588);
    DAT_6164 = DAT_6164 + -1;
    if (DAT_6164 == '\0') {
      DAT_604d = 0;
      in_D = DAT_616a;
    }
    else {
      DAT_6163 = 0;
      API_FD0E((char)(in_D >> 8),0x2e,&DAT_6580);
      if ((extraout_CC >> 2 & 1) != 0) {
        DAT_6163 = 0xff;
      }
      DAT_6162 = DAT_6580;
      DAT_6580 = 0x20;
      uVar1 = API_FD04(0,8,&DAT_6580,&DAT_609b);
      in_D = uVar1 & 0xff;
      if (DAT_6169 == '\0') {
        (*DAT_6070)();
        goto LAB_9333;
      }
      in_D = API_FC20((char)(uVar1 >> 8),(char)uVar1,&DAT_609a);
    }
    DAT_6074 = in_D;
    *(char *)(in_U + -1) = (char)in_D;
    *(char *)(in_U + -2) = (char)(in_D >> 8);
    API_FC40(0x10);
    (*DAT_6070)();
    (*DAT_606a)((char)(DAT_6074 >> 8));
  }
LAB_9333:
  uStack0008 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000e >> 8),(char)in_D,in_stack_00000010,in_stack_00000012,
             in_stack_00000014);
  return;
}


// ===== FUN_930e @ 930e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9338 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_930e(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 uStack0008;
  undefined2 in_stack_0000000e;
  undefined2 in_stack_00000010;
  undefined2 in_stack_00000012;
  undefined2 in_stack_00000014;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_604d = 0;
  DAT_6164 = 0;
  uVar1 = API_FC20();
  DAT_6074 = uVar1;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0x10);
  (*DAT_6070)();
  (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
  uStack0008 = 0x9338;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_0000000e >> 8),(char)uVar1,in_stack_00000010,in_stack_00000012,
             in_stack_00000014);
  return;
}


// ===== FUN_933a @ 933a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9357 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_933a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6162 = DAT_6161;
  DAT_604d = 0xff;
                    /* inline[API_FD0C]: $0008 20 */
  MemsetInline();
  DAT_616a = DAT_6074;
                    /* WARNING: Could not recover jumptable at 0x9357. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_9359 @ 9359 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x938c */
/* WARNING: Removing unreachable block (RAM,0x937a) */
/* WARNING: Removing unreachable block (RAM,0x9384) */
/* WARNING: Removing unreachable block (RAM,0x9387) */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9359(void)

{
  short sVar1;
  short sVar2;
  
  DAT_6580 = DAT_6162;
  sVar1 = 0x65f0;
  sVar2 = 0x65f8;
  do {
    API_FD04(0,8,sVar1);
    sVar1 = sVar2 + -0x18;
    sVar2 = sVar2 + -0x10;
  } while( true );
}


// ===== API_FC20 @ 938e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9468 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC20(undefined2 param_1,undefined2 param_2,short param_3)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  byte *pbVar3;
  short sVar5;
  short *psVar6;
  short *psVar7;
  code *UNRECOVERED_JUMPTABLE;
  char local_d;
  char local_a;
  char local_9;
  byte *pbVar4;
  
  *(undefined1 *)(param_3 + -1) = 0;
  psVar6 = (short *)(param_3 + -2);
  *(char *)psVar6 = '\0';
  local_a = '\0';
  local_9 = '\0';
  local_d = '\0';
  pbVar4 = &DAT_609a;
  do {
    while( true ) {
      while( true ) {
        do {
          pbVar3 = pbVar4 + 1;
          bVar1 = *pbVar4;
          if (bVar1 == 0) goto LAB_9401;
          pbVar4 = pbVar3;
        } while (bVar1 == 0x20);
        if (bVar1 != 0x2d) break;
        local_d = -1;
      }
      if (bVar1 == 0x2e) break;
      if ((bVar1 < 0x30) || ((char)((bVar1 < 0x39) + (bVar1 == 0x39)) == '\0')) goto LAB_945a;
      psVar6 = psVar6 + -1;
      *psVar6 = 10;
      API_FCF0();
      if (*psVar6 != 0) goto LAB_945a;
      *(char *)((short)psVar6 + 1) = (char)in_D + -0x30;
      *(char *)psVar6 = '\0';
      API_FCE2();
      if (*(char *)psVar6 < '\0') goto LAB_945a;
      pbVar4 = pbVar3;
      if ((local_9 != '\0') && (local_a = local_a + '\x01', local_a == DAT_6099)) goto LAB_9401;
    }
    local_9 = -1;
  } while (DAT_6099 != '\0');
LAB_9401:
  if ((pbVar3[-1] != 0) &&
     (((bVar1 = *pbVar3, bVar1 != 0 && (0x34 < bVar1)) &&
      ((char)((bVar1 < 0x39) + (bVar1 == 0x39)) != '\0')))) {
    *(char *)((short)psVar6 + -1) = '\x01';
    psVar6 = psVar6 + -1;
    *(char *)psVar6 = '\0';
    API_FCE2();
    if (*(char *)psVar6 < '\0') {
LAB_945a:
      sVar2 = DAT_606c;
      if (local_d != '\0') {
        sVar2 = DAT_606e;
      }
      goto LAB_9466;
    }
  }
  while (local_a != DAT_6099) {
    psVar7 = psVar6 + -1;
    *psVar7 = 10;
    API_FCF0();
    psVar6 = psVar7 + 1;
    if ((*psVar7 != 0) || (*(char *)psVar6 < '\0')) goto LAB_945a;
    local_a = (char)((ushort)in_D >> 8) + '\x01';
  }
  if (local_d != '\0') {
    API_FCE0();
  }
  sVar2 = DAT_606e;
  sVar5 = *psVar6;
  *(char *)((short)psVar6 + 1) = (char)DAT_606e;
  *(char *)psVar6 = (char)((ushort)sVar2 >> 8);
  sVar2 = DAT_606c;
  *(char *)((short)psVar6 + -1) = (char)DAT_606c;
  *(char *)(psVar6 + -1) = (char)((ushort)sVar2 >> 8);
  psVar6 = psVar6 + -2;
  *psVar6 = sVar5;
  API_FCD8();
  sVar2 = *psVar6;
LAB_9466:
                    /* WARNING: Could not recover jumptable at 0x9468. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)sVar2 >> 8),(char)sVar2,param_1,param_2,param_3);
  return;
}


// ===== API_FC22 @ 946a =====

void __h3000 API_FC22(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6170 = 8;
                    /* WARNING: Could not recover jumptable at 0x9471. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC24 @ 9473 =====

void __h3000 API_FC24(void)

{
  char cVar1;
  byte bVar2;
  byte bVar3;
  
  bVar3 = DAT_616e;
  cVar1 = DAT_616c;
  DAT_616c = DAT_616c + '\x01';
  if (DAT_616c == '\0') {
    DAT_616c = cVar1;
  }
  bVar2 = DAT_8056;
  bVar2 = (bVar2 & 0xc0) >> 2;
  DAT_616e = (bVar2 | DAT_616e) >> 2;
  cVar1 = (&DAT_94c2)[(char)DAT_616e];
  if (cVar1 == '\0') {
    bVar3 = (bVar2 | bVar3 & 0x30) >> 2;
    if ((bVar3 != 0) && (bVar3 != 0xc)) {
      if (bVar3 == DAT_6170) {
        DAT_6171 = '\0';
      }
      else {
        DAT_616d = DAT_616f + DAT_616d;
        DAT_6170 = bVar3;
      }
    }
  }
  else if (DAT_6171 == '\0') {
    DAT_616f = cVar1;
    DAT_6171 = cVar1;
  }
  if (DAT_6172 == '\0') {
    return;
  }
  DAT_605e = DAT_616d;
  DAT_6060 = DAT_616c;
  DAT_616d = 0;
  DAT_616c = 0;
  DAT_6172 = 0;
  return;
}


// ===== API_FC26 @ 94e9 =====

/* WARNING: Removing unreachable block (RAM,0x94fc) */
/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9502 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC26(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6172 = 0xff;
  puVar1 = &UNK_07d0;
  do {
    puVar1 = puVar1 + -1;
  } while (puVar1 != (undefined *)0x0);
                    /* WARNING: Could not recover jumptable at 0x9502. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(0,param_2,param_3);
  return;
}


// ===== API_FC28 @ 9509 =====

void __h3000 API_FC28(void)

{
                    /* inline[API_FDD6]: $6022 */
  API_FDD6();
  API_FC26();
  FUN_9621();
  return;
}


// ===== FUN_9515 @ 9515 =====

void __h3000 FUN_9515(undefined1 param_1)

{
  BankPushSelect(param_1,DAT_6022);
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9573 1->9579 2->9561 3->9563 4->9573
                       5->9536 6->9573 7->9573 */
  JumpTableDispatch(0,DAT_6066 & 7);
}


// ===== FUN_9536 @ 9536 =====

undefined2 __h3000 FUN_9536(void)

{
  ushort uVar1;
  undefined2 uVar2;
  char extraout_A;
  ushort uVar3;
  short in_U;
  short *psVar4;
  ushort *puVar5;
  undefined2 in_stack_00000003;
  
  API_FC26();
  FUN_95b8();
  if (extraout_A != '\0') {
    *(char *)(in_U + -1) = extraout_A;
    *(char *)(in_U + -2) = extraout_A >> 7;
    psVar4 = (short *)(in_U + -4);
    *psVar4 = DAT_6062 - DAT_601f;
    API_FCC8();
    uVar2 = DAT_60dc;
    *(char *)((short)psVar4 + -1) = (char)DAT_60dc;
    psVar4 = psVar4 + -1;
    *(char *)psVar4 = (char)((ushort)uVar2 >> 8);
    API_FCE6();
    *(undefined1 *)((short)psVar4 + -1) = 1;
    puVar5 = (ushort *)(psVar4 + -1);
    *(undefined1 *)puVar5 = 0;
    API_FCE2();
    API_FCEC();
    uVar1 = *puVar5;
    if ((short)uVar1 < 0) {
      uVar3 = uVar1 + DAT_6062;
      if (!(bool)((uVar3 < DAT_6062) + (uVar3 == DAT_6062))) {
        uVar3 = 0;
      }
    }
    else {
      uVar3 = uVar1 + DAT_6062;
      if ((CARRY2(uVar1,DAT_6062)) || (!(bool)((uVar3 < DAT_6064) + (uVar3 == DAT_6064)))) {
        uVar3 = DAT_6064;
      }
    }
    DAT_6062 = uVar3;
    (*DAT_605c)();
  }
  BankPop();
  return in_stack_00000003;
}


// ===== thunk_FUN_9579 @ 9561 =====

undefined2 __h3000 thunk_FUN_9579(void)

{
  ushort uVar1;
  undefined2 uVar2;
  char extraout_A;
  ushort uVar3;
  short in_U;
  ushort *puVar4;
  undefined2 in_stack_00000003;
  
  API_FC26();
  FUN_95b8();
  if (extraout_A != '\0') {
    *(char *)(in_U + -1) = extraout_A;
    *(char *)(in_U + -2) = extraout_A >> 7;
    uVar2 = DAT_60dc;
    *(char *)(in_U + -3) = (char)DAT_60dc;
    puVar4 = (ushort *)(in_U + -4);
    *(char *)puVar4 = (char)((ushort)uVar2 >> 8);
    API_FCEC();
    uVar1 = *puVar4;
    if ((short)uVar1 < 0) {
      uVar3 = uVar1 + DAT_6062;
      if (!(bool)((uVar3 < DAT_6062) + (uVar3 == DAT_6062))) {
        uVar3 = 0;
      }
    }
    else {
      uVar3 = uVar1 + DAT_6062;
      if ((CARRY2(uVar1,DAT_6062)) || (!(bool)((uVar3 < DAT_6064) + (uVar3 == DAT_6064)))) {
        uVar3 = DAT_6064;
      }
    }
    DAT_6062 = uVar3;
    (*DAT_605c)();
  }
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_9563 @ 9563 =====

undefined2 __h3000 FUN_9563(void)

{
  char extraout_A;
  undefined2 in_stack_00000003;
  
  API_FC26();
  FUN_95b8();
  if (extraout_A != '\0') {
    (*DAT_605c)(extraout_A >> 7);
  }
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_9573 @ 9573 =====

undefined2 __h3000 FUN_9573(void)

{
  undefined2 in_stack_00000003;
  
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_9579 @ 9579 =====

undefined2 __h3000 FUN_9579(void)

{
  ushort uVar1;
  undefined2 uVar2;
  char extraout_A;
  ushort uVar3;
  short in_U;
  ushort *puVar4;
  undefined2 in_stack_00000003;
  
  API_FC26();
  FUN_95b8();
  if (extraout_A != '\0') {
    *(char *)(in_U + -1) = extraout_A;
    *(char *)(in_U + -2) = extraout_A >> 7;
    uVar2 = DAT_60dc;
    *(char *)(in_U + -3) = (char)DAT_60dc;
    puVar4 = (ushort *)(in_U + -4);
    *(char *)puVar4 = (char)((ushort)uVar2 >> 8);
    API_FCEC();
    uVar1 = *puVar4;
    if ((short)uVar1 < 0) {
      uVar3 = uVar1 + DAT_6062;
      if (!(bool)((uVar3 < DAT_6062) + (uVar3 == DAT_6062))) {
        uVar3 = 0;
      }
    }
    else {
      uVar3 = uVar1 + DAT_6062;
      if ((CARRY2(uVar1,DAT_6062)) || (!(bool)((uVar3 < DAT_6064) + (uVar3 == DAT_6064)))) {
        uVar3 = DAT_6064;
      }
    }
    DAT_6062 = uVar3;
    (*DAT_605c)();
  }
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_95b8 @ 95b8 =====

void __h3000 FUN_95b8(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)((ushort)in_D >> 8) != '\0') {
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->95F4 1->95D0 2->95DB 3->95E7 */
    JumpTableDispatch(0);
  }
                    /* WARNING: Could not recover jumptable at 0x95f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


// ===== FUN_95d0 @ 95d0 =====

void __h3000 FUN_95d0(void)

{
  char extraout_A;
  undefined1 extraout_A_00;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_95f8();
  FUN_9609(extraout_A >> 1);
                    /* WARNING: Could not recover jumptable at 0x95f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,in_stack_00000001);
  return;
}


// ===== FUN_95db @ 95db =====

void __h3000 FUN_95db(void)

{
  char extraout_A;
  undefined1 extraout_A_00;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_95f8();
  FUN_9609(extraout_A >> 2);
                    /* WARNING: Could not recover jumptable at 0x95f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,in_stack_00000001);
  return;
}


// ===== FUN_95e7 @ 95e7 =====

void __h3000 FUN_95e7(void)

{
  char extraout_A;
  undefined1 extraout_A_00;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_95f8();
  FUN_9609(extraout_A >> 3);
                    /* WARNING: Could not recover jumptable at 0x95f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,in_stack_00000001);
  return;
}


// ===== FUN_95f4 @ 95f4 =====

void __h3000 FUN_95f4(void)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x95f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001);
  return;
}


// ===== FUN_95f8 @ 95f8 =====

void __h3000 FUN_95f8(void)

{
  char in_stack_00000002;
  
  DAT_6176 = in_stack_00000002 + DAT_6174;
  if (-1 < DAT_6176) {
    DAT_6176 = '\0';
  }
  return;
}


// ===== FUN_9609 @ 9609 =====

void __h3000 FUN_9609(char param_1)

{
  char in_stack_00000002;
  
  if (param_1 == '\0') {
    DAT_6174 = in_stack_00000002 + DAT_6174;
  }
  else {
    DAT_6174 = '\0';
  }
  return;
}


// ===== FUN_9621 @ 9621 =====

void __h3000 FUN_9621(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_6067 & 0xf0) != 0) {
    if ((DAT_6067 & 0xc0) != 0) {
      DAT_6173 = 3;
      goto LAB_9644;
    }
    if ((DAT_6067 & 0x20) != 0) {
      DAT_6173 = 2;
      goto LAB_9644;
    }
    if ((DAT_6067 & 0x10) != 0) {
      DAT_6173 = 1;
      goto LAB_9644;
    }
  }
  DAT_6173 = 0;
LAB_9644:
  DAT_6174 = 0;
                    /* WARNING: Could not recover jumptable at 0x964a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC90 @ 964c =====

void __h3000 API_FC90(undefined1 param_1,undefined1 param_2)

{
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_8300 = 3;
  DAT_8300 = 0x15;
  uVar1 = DAT_8301;
                    /* WARNING: Could not recover jumptable at 0x965b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC92 @ 965d =====

void __h3000 API_FC92(undefined1 param_1)

{
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_8300 = 0x95;
  uVar1 = DAT_8301;
                    /* WARNING: Could not recover jumptable at 0x9667. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== API_FC94 @ 9669 =====

void __h3000 API_FC94(undefined1 param_1)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_8300 = 0x15;
                    /* WARNING: Could not recover jumptable at 0x9670. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== API_FDD8 @ 9672 =====

void __h3000 API_FDD8(void)

{
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC90();
  DAT_6083 = 0;
  DAT_6085 = 0;
  DAT_6081 = 0;
  DAT_6082 = 0xff;
  DAT_6087 = 0;
                    /* inline[API_FE30]: $68A0 */
  API_FE30(0x97);
                    /* inline[API_FE2E]: $68A0 */
  API_FE2E();
                    /* inline[API_FE2E]: $68C0 */
  API_FE2E();
  DAT_60f2 = FUN_85e3;
  DAT_608b = 0xffe8;
  BankPushSelect();
  DAT_6116 = DAT_0296;
  DAT_6136 = DAT_028f;
  DAT_6117 = DAT_0297;
  DAT_6177 = 1;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x96c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000002);
  return;
}


// ===== API_FDDA @ 96ca =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x96f6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDDA(undefined2 param_1)

{
  ushort uVar1;
  ushort in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = in_D >> 8;
  if (DAT_6082 == '\0') {
    DAT_6085 = DAT_6085 + 1 & 0x3ff;
    if (DAT_6085 == DAT_6083) {
      DAT_6082 = -1;
    }
    DAT_6081 = 0;
    in_D = DAT_6085;
  }
                    /* WARNING: Could not recover jumptable at 0x96f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1);
  return;
}


// ===== API_FC96 @ 96f8 =====

void __h3000 API_FC96(undefined1 param_1)

{
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_8300;
                    /* WARNING: Could not recover jumptable at 0x96ff. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== API_FC98 @ 9701 =====

void __h3000 API_FC98(undefined1 param_1,undefined1 param_2)

{
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  do {
    bVar1 = DAT_8300;
  } while ((bVar1 & 2) == 0);
  DAT_8301 = param_2;
                    /* WARNING: Could not recover jumptable at 0x970f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC9A @ 9711 =====

void __h3000 API_FC9A(undefined1 param_1,undefined1 param_2,char *param_3)

{
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  while( true ) {
    if (*param_3 == -1) break;
    do {
      bVar1 = DAT_8300;
    } while ((bVar1 & 2) == 0);
    DAT_8301 = *param_3;
    param_3 = param_3 + 1;
  }
                    /* WARNING: Could not recover jumptable at 0x9725. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC2A @ 9727 =====

void __h3000 API_FC2A(void)

{
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = API_FC32();
  DAT_8062 = CONCAT11((char)uVar1,(char)uVar1);
                    /* WARNING: Could not recover jumptable at 0x9731. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)uVar1 >> 8));
  return;
}


// ===== API_FC2C @ 9733 =====

void __h3000 API_FC2C(void)

{
  undefined2 uVar1;
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC32();
  uVar1 = DAT_8062;
                    /* WARNING: Could not recover jumptable at 0x973b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A);
  return;
}


// ===== API_FC2E @ 973d =====

void __h3000 API_FC2E(void)

{
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = API_FC32();
  DAT_8060 = CONCAT11((char)uVar1,(char)uVar1);
                    /* WARNING: Could not recover jumptable at 0x9747. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)uVar1 >> 8));
  return;
}


// ===== FUN_9740 @ 9740 =====

void __h3000 FUN_9740(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_8060 = CONCAT11((char)in_D,(char)in_D);
                    /* WARNING: Could not recover jumptable at 0x9747. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FC30 @ 9749 =====

void __h3000 API_FC30(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_8060;
                    /* WARNING: Could not recover jumptable at 0x974e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FC32 @ 9750 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9760 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC32(undefined2 param_1)

{
  ushort uVar1;
  undefined2 in_D;
  undefined *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar2 = &UNK_03e8;
  do {
    puVar2 = puVar2 + -1;
    if (puVar2 == (undefined *)0x0) break;
    uVar1 = DAT_8060;
  } while ((uVar1 & 0x80) != 0);
                    /* WARNING: Could not recover jumptable at 0x9760. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== API_FC34 @ 9762 =====

void __h3000 API_FC34(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FD20(5);
  FUN_9740();
  API_FD20(1);
  FUN_9740();
  API_FD20(0);
  FUN_9740();
  API_FC2E();
  API_FC2E();
  API_FC2E();
  API_FC2E();
                    /* WARNING: Could not recover jumptable at 0x9799. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FDB2 @ 979b =====

void __h3000 API_FDB2(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC2E(param_1,DAT_60c1 & 3 | 0xc);
                    /* WARNING: Could not recover jumptable at 0x97a7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== API_FDB0 @ 97a9 =====

void __h3000 API_FDB0(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC2E(param_1,0xc);
                    /* WARNING: Could not recover jumptable at 0x97b0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== API_FDB8 @ 97b2 =====

void __h3000 API_FDB8(undefined1 param_1,undefined1 param_2)

{
  DAT_60c0 = param_2;
  LcdSetCursor();
  return;
}


// ===== API_FDB4 @ 97b8 =====

void __h3000 API_FDB4(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60c0 = API_FC30();
  if (!(bool)((DAT_60c0 < 0x29) + (DAT_60c0 == 0x29))) {
    DAT_60c0 = DAT_60c0 - 0x18;
  }
                    /* WARNING: Could not recover jumptable at 0x97c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== API_FDB6 @ 97ca =====

void __h3000 API_FDB6(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor(param_1,DAT_60c0);
                    /* WARNING: Could not recover jumptable at 0x97d1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== LcdSetCursor @ 97d3 =====

/* Kernel API slot $FC36: B = position 0-79 (2 x 40 LCD) */

void __h3000 LcdSetCursor(undefined1 param_1,byte param_2)

{
  undefined1 extraout_A;
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = param_2 & 0x7f;
  if (bVar1 < 0x28 == (bVar1 == 0x28)) {
    bVar1 = bVar1 + 0x18;
  }
  API_FC2E(param_1,bVar1 | 0x80);
                    /* WARNING: Could not recover jumptable at 0x97e2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== LcdPrintInline @ 97e4 =====

/* Kernel API slot $FC38: inline text with control codes 0-7 */

void __h3000 LcdPrintInline(void)

{
  byte *pbVar1;
  byte *local_res0;
  
  while( true ) {
    pbVar1 = local_res0 + 1;
    if ((*local_res0 & 0xf8) == 0) break;
    API_FC2A();
    local_res0 = pbVar1;
  }
                    /* WARNING: Subroutine does not return */
  JumpTableDispatch(0,*local_res0 & 7);
}


// ===== FUN_97e8 @ 97e8 =====

void __h3000 FUN_97e8(undefined1 param_1,undefined1 param_2,byte *param_3)

{
  byte *pbVar1;
  
  while( true ) {
    pbVar1 = param_3 + 1;
    if ((*param_3 & 0xf8) == 0) break;
    API_FC2A();
    param_3 = pbVar1;
  }
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->984F 1->9809 2->9810 3->981B 4->9828
                       5->9835 6->9817 7->97E8 */
  JumpTableDispatch(0,*param_3 & 7);
}


// ===== FUN_9809 @ 9809 =====

void __h3000 FUN_9809(undefined1 param_1)

{
  API_FC2E(param_1,1);
  FUN_97e8();
  return;
}


// ===== FUN_9810 @ 9810 =====

void __h3000 FUN_9810(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  LcdSetCursor(param_1,*param_3,param_3 + 1);
  FUN_97e8();
  return;
}


// ===== FUN_9817 @ 9817 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_9817(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
        undefined2 *param_5)

{
  undefined2 uVar1;
  
  uVar1 = *param_5;
  uVar1 = API_FC3E((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1,param_4,param_5 + 1);
  FUN_97e8((char)((ushort)uVar1 >> 8),(char)uVar1,param_3);
  return;
}


// ===== FUN_981b @ 981b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_981b(undefined1 param_1,undefined1 param_2,undefined2 *param_3)

{
  undefined2 uVar1;
  
  uVar1 = *param_3;
  uVar1 = API_FC3E((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  FUN_97e8((char)((ushort)uVar1 >> 8),(char)uVar1,param_3 + 1);
  return;
}


// ===== FUN_9828 @ 9828 =====

void __h3000 FUN_9828(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  API_FC40(*param_3,param_3[1],param_3 + 2,0x60a4);
  FUN_97e8();
  return;
}


// ===== FUN_9835 @ 9835 =====

void __h3000 FUN_9835(undefined1 param_1,undefined1 param_2,char *param_3)

{
  char extraout_A;
  char cVar1;
  byte extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  
  API_FC30();
  cVar1 = *param_3;
  uVar2 = 0x20;
  do {
    API_FC2A(cVar1,uVar2);
    cVar1 = extraout_A + -1;
    uVar2 = extraout_B_00;
  } while (cVar1 != '\0');
  API_FC2E(0,extraout_B & 0x7f | 0x80);
  FUN_97e8();
  return;
}


// ===== FUN_984f @ 984f =====

void __h3000 FUN_984f(undefined1 param_1,undefined1 param_2,code *UNRECOVERED_JUMPTABLE)

{
  undefined1 in_stack_00000001;
  undefined1 in_stack_00000002;
  undefined2 in_stack_00000003;
  undefined2 in_stack_00000005;
  code *pcStack0007;
  
  pcStack0007 = UNRECOVERED_JUMPTABLE;
                    /* WARNING: Could not recover jumptable at 0x9851. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000001,in_stack_00000002,in_stack_00000003,in_stack_00000005);
  return;
}


// ===== API_FC3A @ 9853 =====

void __h3000 API_FC3A(undefined1 param_1,char param_2,undefined1 *param_3)

{
  char extraout_A;
  char cVar1;
  undefined1 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = param_2;
  do {
    puVar2 = param_3 + 1;
    API_FC2A(cVar1,*param_3);
    cVar1 = extraout_A + -1;
    param_3 = puVar2;
  } while (cVar1 != '\0');
                    /* WARNING: Could not recover jumptable at 0x985f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC3C @ 9861 =====

void __h3000 API_FC3C(undefined1 param_1,char param_2,undefined2 param_3,undefined1 *param_4)

{
  char extraout_A;
  char cVar1;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = param_2;
  do {
    API_FC2C(cVar1);
    *param_4 = extraout_B;
    cVar1 = extraout_A + -1;
    param_4 = param_4 + 1;
  } while (cVar1 != '\0');
                    /* WARNING: Could not recover jumptable at 0x986d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC3E @ 986f =====

void __h3000 API_FC3E(undefined1 param_1,undefined1 param_2,char *param_3)

{
  undefined1 extraout_A;
  char *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  while (pcVar1 = param_3 + 1, *param_3 != '\0') {
    API_FC2A();
    param_3 = pcVar1;
    param_1 = extraout_A;
  }
                    /* WARNING: Could not recover jumptable at 0x987a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC40 @ 987c =====

void __h3000 API_FC40(byte param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  char cVar1;
  
  *(undefined1 *)(param_4 + 9) = 0;
  cVar1 = '\b';
  do {
    *(undefined1 *)(param_4 + cVar1) = 0x20;
    cVar1 = cVar1 + -1;
  } while (-1 < cVar1);
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->98A6 1->98A1 2->9908 3->994A */
  JumpTableDispatch(0,param_1 >> 4);
}


// ===== FUN_98a1 @ 98a1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_98a1(void)

{
  char cVar1;
  short in_Y;
  char *pcVar2;
  char *in_U;
  char local_res0;
  undefined1 uStack0001;
  char cStack0002;
  
  local_res0 = DAT_6099;
  if (DAT_6099 == '\0') {
    in_Y = in_Y + 1;
  }
  uStack0001 = 0xff;
  pcVar2 = (char *)(in_Y + 3);
  cStack0002 = '\0';
  cVar1 = DAT_6099;
  if (*in_U < '\0') {
    cStack0002 = -1;
    cVar1 = API_FCC8();
  }
  FUN_98f9('\x05' - local_res0,cVar1,pcVar2 + (char)('\x05' - local_res0));
  FUN_992c(0x27);
  FUN_98f9();
  FUN_992c(3);
  FUN_98f9();
  FUN_992c(0);
  FUN_98f9();
  FUN_992c(0);
  FUN_98f9();
  uStack0001 = 0;
  FUN_992c(0);
  if (cStack0002 != '\0') {
    do {
      pcVar2 = pcVar2 + -1;
    } while (*pcVar2 != ' ');
    *pcVar2 = '-';
  }
  FUN_9968();
  return;
}


// ===== FUN_98a6 @ 98a6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_98a6(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,char *param_5)

{
  char *pcVar1;
  char local_res0;
  undefined1 local_res1;
  char cStack0002;
  
  if (local_res0 == '\0') {
    param_4 = param_4 + 1;
  }
  local_res1 = 0xff;
  pcVar1 = (char *)(param_4 + 3);
  cStack0002 = '\0';
  if (*param_5 < '\0') {
    cStack0002 = -1;
    param_2 = API_FCC8();
  }
  FUN_98f9('\x05' - local_res0,param_2,pcVar1 + (char)('\x05' - local_res0));
  FUN_992c(0x27);
  FUN_98f9();
  FUN_992c(3);
  FUN_98f9();
  FUN_992c(0);
  FUN_98f9();
  FUN_992c(0);
  FUN_98f9();
  local_res1 = 0;
  FUN_992c(0);
  if (cStack0002 != '\0') {
    do {
      pcVar1 = pcVar1 + -1;
    } while (*pcVar1 != ' ');
    *pcVar1 = '-';
  }
  FUN_9968();
  return;
}


// ===== FUN_98f9 @ 98f9 =====

void __h3000 FUN_98f9(undefined1 param_1,undefined1 param_2,undefined1 *param_3,undefined1 *param_4)

{
  if (param_3 == param_4) {
    *param_4 = 0x2e;
  }
  return;
}


// ===== FUN_9908 @ 9908 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9908(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 local_res1;
  
  local_res1 = 0xff;
  FUN_992c(0x27,0x10,param_3,param_4 + 4);
  FUN_992c(3);
  FUN_992c(0);
  FUN_992c(0);
  local_res1 = 0;
  FUN_992c(0);
  FUN_9968();
  return;
}


// ===== FUN_992c @ 992c =====

void __h3000 FUN_992c(void)

{
  undefined2 in_D;
  undefined1 uVar1;
  undefined1 *in_Y;
  short in_U;
  short *psVar2;
  char in_stack_00000003;
  
  *(char *)(in_U + -1) = (char)in_D;
  psVar2 = (short *)(in_U + -2);
  *(char *)psVar2 = (char)((ushort)in_D >> 8);
  API_FCEA();
  if ((in_stack_00000003 == '\0') || (*psVar2 != 0)) {
    uVar1 = FUN_9970();
  }
  else {
    uVar1 = 0x20;
  }
  *in_Y = uVar1;
  return;
}


// ===== FUN_994a @ 994a =====

void __h3000 FUN_994a(void)

{
  short in_Y;
  undefined1 *puVar1;
  undefined1 local_res1;
  
  local_res1 = 0;
  puVar1 = (undefined1 *)(in_Y + 4);
  FUN_992c(0x10);
  FUN_992c(1);
  FUN_992c(0);
  FUN_992c(0);
  *puVar1 = 0x48;
  FUN_9968();
  return;
}


// ===== FUN_9968 @ 9968 =====

void __h3000 FUN_9968(void)

{
  short in_U;
  undefined1 in_stack_00000003;
  undefined1 in_stack_00000004;
  undefined2 in_stack_00000005;
  undefined2 in_stack_00000007;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x996e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            (in_stack_00000003,in_stack_00000004,in_stack_00000005,in_stack_00000007,in_U + 2);
  return;
}


// ===== FUN_9970 @ 9970 =====

char __h3000 FUN_9970(undefined1 param_1,byte param_2)

{
  char cVar1;
  
  param_2 = param_2 & 0xf;
  if ((char)((param_2 < 9) + (param_2 == 9)) == '\0') {
    cVar1 = param_2 + 0x37;
  }
  else {
    cVar1 = param_2 + 0x30;
  }
  return cVar1;
}


// ===== API_FC42 @ 997d =====

void __h3000 API_FC42(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC40();
  uVar1 = API_FC3A(extraout_A,8,&DAT_609a);
                    /* WARNING: Could not recover jumptable at 0x998e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,uVar1,param_3,param_4);
  return;
}


// ===== API_FDF8 @ 9990 =====

void __h3000 API_FDF8(undefined1 param_1,char param_2)

{
  byte extraout_A;
  char cVar1;
  undefined1 uVar2;
  byte in_CC;
  byte bVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 local_3;
  
  bVar3 = in_CC & 0xf1;
  local_3 = '\b';
  cVar1 = param_2;
  do {
    uVar2 = 0x31;
    if (!(bool)(bVar3 & 1 ^ cVar1 == '\0')) {
      uVar2 = 0x30;
    }
    API_FC2A(cVar1,uVar2);
    bVar3 = extraout_A >> 7;
    cVar1 = extraout_A << 1;
    local_3 = local_3 + -1;
  } while (local_3 != '\0');
                    /* WARNING: Could not recover jumptable at 0x99ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC44 @ 99ad =====

void __h3000 API_FC44(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_99ce();
  FUN_99ce();
  FUN_99ce();
                    /* WARNING: Could not recover jumptable at 0x99cc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_99ce @ 99ce =====

undefined2 __h3000 FUN_99ce(undefined1 param_1,byte param_2)

{
  char cVar1;
  undefined1 extraout_A;
  undefined1 extraout_B;
  char in_stack_00000002;
  byte in_stack_00000003;
  
  cVar1 = '\0';
  for (; in_stack_00000003 <= param_2; param_2 = param_2 - in_stack_00000003) {
    cVar1 = cVar1 + '\x01';
  }
  cVar1 = cVar1 + '0';
  if ((in_stack_00000002 == '\0') && (cVar1 == '0')) {
    cVar1 = ' ';
  }
  API_FC2A(param_2,cVar1);
  return CONCAT11(extraout_B,extraout_A);
}


// ===== API_FC46 @ 99f0 =====

void __h3000 API_FC46(undefined1 param_1,undefined1 param_2)

{
  char extraout_A;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_9970(param_2);
  FUN_9970(extraout_A,extraout_A >> 4);
                    /* WARNING: Could not recover jumptable at 0x9a02. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_B_00,extraout_B);
  return;
}


// ===== LcdPrintAt8Inline @ 9a04 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9a20 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC48: inline: position byte + 8 chars */

void __h3000 LcdPrintAt8Inline(undefined2 param_1)

{
  char cVar1;
  undefined2 in_D;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  char *local_res0;
  
  UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 1);
  sVar2 = (CONCAT11(8,*local_res0 - 8U) >> 8) * (ushort)(byte)(*local_res0 - 8U);
  cVar1 = (char)((ushort)sVar2 >> 8);
  API_FC2E(cVar1);
  do {
    UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE + 1;
    API_FC2A();
  } while (cVar1 != '\x01');
                    /* WARNING: Could not recover jumptable at 0x9a20. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar2,param_1);
  return;
}


// ===== API_FDBA @ 9a22 =====

void __h3000 API_FDBA(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC2A(param_1,0x20);
                    /* WARNING: Could not recover jumptable at 0x9a29. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== API_FC4A @ 9a2b =====

void __h3000 API_FC4A(undefined1 param_1,byte param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_8054 = param_2 & 0x3f;
  API_FC80(param_1,param_2 & 0x3f,param_3,&DAT_0283);
                    /* WARNING: Could not recover jumptable at 0x9a39. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2,param_3);
  return;
}


// ===== Io80A7_Clear @ 9a55 =====

/* Kernel API slot $FC54: $80A7 = 0 */

void __h3000 Io80A7_Clear(undefined1 param_1)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a7 = 0;
                    /* WARNING: Could not recover jumptable at 0x9a5c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== Io80A7_Set @ 9a5e =====

/* Kernel API slot $FC56: $80A7 = $FF */

void __h3000 Io80A7_Set(undefined1 param_1)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a7 = 0xff;
                    /* WARNING: Could not recover jumptable at 0x9a65. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== API_FC58 @ 9a67 =====

void __h3000 API_FC58(undefined1 param_1,byte param_2)

{
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9A77 1->9A83 2->9A8A 3->9A91 */
  JumpTableDispatch(0,param_2 & 3);
}


// ===== FUN_9a77 @ 9a77 =====

void __h3000 FUN_9a77(void)

{
  undefined1 in_stack_00000001;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a4 = 0;
  DAT_80a5 = 0;
                    /* WARNING: Could not recover jumptable at 0x9a9b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000001,in_stack_00000002);
  return;
}


// ===== FUN_9a83 @ 9a83 =====

void __h3000 FUN_9a83(void)

{
  undefined1 in_stack_00000001;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a4 = 0;
  DAT_80a5 = 0xff;
                    /* WARNING: Could not recover jumptable at 0x9a9b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000001,in_stack_00000002);
  return;
}


// ===== FUN_9a8a @ 9a8a =====

void __h3000 FUN_9a8a(void)

{
  undefined1 in_stack_00000001;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a4 = 0xff;
  DAT_80a5 = 0;
                    /* WARNING: Could not recover jumptable at 0x9a9b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000001,in_stack_00000002);
  return;
}


// ===== FUN_9a91 @ 9a91 =====

void __h3000 FUN_9a91(void)

{
  undefined1 in_stack_00000001;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a4 = 0xff;
  DAT_80a5 = 0xff;
                    /* WARNING: Could not recover jumptable at 0x9a9b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000001,in_stack_00000002);
  return;
}


// ===== API_FC5A @ 9a9d =====

void __h3000 API_FC5A(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a1 = 0xff;
  API_FC80(param_1,0xff,param_3,&DAT_0282);
                    /* WARNING: Could not recover jumptable at 0x9aab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2,param_3,param_4);
  return;
}


// ===== API_FC5C @ 9aad =====

void __h3000 API_FC5C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80a1 = 0;
  API_FC80(param_1,0,param_3,&DAT_0282);
                    /* WARNING: Could not recover jumptable at 0x9abb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2,param_3,param_4);
  return;
}


// ===== API_FC5E @ 9abd =====

void __h3000 API_FC5E(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = API_FC7C(param_1,param_2,&DAT_0282);
  DAT_80a1 = uVar1;
                    /* WARNING: Could not recover jumptable at 0x9ac8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2,param_3);
  return;
}


// ===== API_FDBE @ 9aca =====

void __h3000 API_FDBE(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  byte extraout_B;
  undefined1 extraout_B_00;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,&DAT_0282);
  API_FC80(extraout_A,~extraout_B);
  FUN_f5b1(0);
  DAT_80a1 = extraout_B_00;
                    /* WARNING: Could not recover jumptable at 0x9ae3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_9ae5 @ 9ae5 =====

void __h3000 FUN_9ae5(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
  DAT_80a1 = extraout_B;
                    /* WARNING: Could not recover jumptable at 0x9af1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_9af3 @ 9af3 =====

void __h3000
FUN_9af3(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puVar1;
  undefined2 *local_res0;
  
  *(undefined2 *)(param_5 + -2) = *local_res0;
  UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 2);
  *(undefined2 *)(param_5 + -4) = local_res0[1];
  *(undefined1 *)(param_5 + -5) = param_2;
  puVar1 = (undefined1 *)(param_5 + -6);
  *puVar1 = param_1;
  API_FCD8();
                    /* WARNING: Could not recover jumptable at 0x9b0a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(*puVar1,puVar1[1],param_3,param_4,puVar1 + 2);
  return;
}


// ===== ModuleSetBase @ 9b0c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9b19 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC60: inline word: $600D = return address - word (position-independent modules)
    */

void __h3000 ModuleSetBase(undefined2 param_1)

{
  undefined2 in_D;
  short *local_res0;
  
  g_moduleBase = (short)local_res0 - *local_res0;
                    /* WARNING: Could not recover jumptable at 0x9b19. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== ModuleStorePtr @ 9b1b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9b29 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC62: inline ptr: [ptr] = D + module base */

void __h3000 ModuleStorePtr(undefined2 param_1,undefined2 param_2)

{
  short in_D;
  undefined2 *local_res0;
  
  *(short *)*local_res0 = in_D + g_moduleBase;
                    /* WARNING: Could not recover jumptable at 0x9b29. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FDAA @ 9b2b =====

void __h3000 API_FDAA(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_80e4 = param_2 << 4;
                    /* WARNING: Could not recover jumptable at 0x9b34. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDC0 @ 9b36 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9b55 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDC0(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_9b57();
                    /* inline[API_FD8E]: $6178 */
  uVar1 = API_FD8E();
  DAT_60ba = 0;
  _DAT_60bb = uVar1;
                    /* inline[API_FDD6]: $6023 */
  API_FDD6();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
                    /* WARNING: Could not recover jumptable at 0x9b55. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1);
  return;
}


// ===== FUN_9b57 @ 9b57 =====

void __h3000 FUN_9b57(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xff;
                    /* WARNING: Could not recover jumptable at 0x9b5e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FDC2 @ 9b60 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9bbc */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDC2(void)

{
  undefined2 in_D;
  short *psVar1;
  short *psVar2;
  undefined2 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDD4();
  BankPushSelect();
  psVar2 = (short *)(_DAT_60bb + DAT_60ba);
  psVar1 = psVar2 + 1;
  if (*psVar2 != 0) {
    if ((char)((ushort)in_D >> 8) == '\0') {
      (*(code *)((short)psVar2 + *psVar2))();
    }
  }
  DAT_60b9 = '\0';
  do {
    psVar2 = psVar1 + 1;
    if (*psVar1 != 0) {
      (*(code *)((short)psVar1 + *psVar1))();
    }
    DAT_60b9 = DAT_60b9 + '\x01';
    psVar1 = psVar2;
  } while (DAT_60b9 != '\x04');
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9bbc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_Y >> 8),(char)in_D,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_9bbe @ 9bbe =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9bbc */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9bbe(void)

{
  undefined2 in_D;
  short *psVar1;
  short *psVar2;
  undefined2 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDD4();
  BankPushSelect();
  psVar2 = (short *)(_DAT_60bb + DAT_60ba);
  psVar1 = psVar2 + 1;
  if (*psVar2 != 0) {
    if ((char)((ushort)in_D >> 8) == '\0') {
      (*(code *)((short)psVar2 + *psVar2))();
    }
  }
  DAT_60b9 = '\0';
  do {
    psVar2 = psVar1 + 1;
    if (*psVar1 != 0) {
      (*(code *)((short)psVar1 + *psVar1))();
    }
    DAT_60b9 = DAT_60b9 + '\x01';
    psVar1 = psVar2;
  } while (DAT_60b9 != '\x04');
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9bbc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_Y >> 8),(char)in_D,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== API_FDC4 @ 9bc8 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 API_FDC4(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_9b57();
  do {
    cVar1 = '\0';
    if (DAT_60ba == '\0') {
      do {
        cVar1 = cVar1 + '\n';
        DAT_60ba = cVar1;
      } while (*(short *)(_DAT_60bb + cVar1) != -1);
    }
    DAT_60ba = DAT_60ba + -10;
    API_FDC2();
  } while ((extraout_CC >> 2 & 1) == 0);
                    /* WARNING: Could not recover jumptable at 0x9bea. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDC6 @ 9bec =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 API_FDC6(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_9b57();
  do {
    DAT_60ba = DAT_60ba + '\n';
    if (*(short *)(_DAT_60bb + DAT_60ba) == -1) {
      DAT_60ba = '\0';
    }
    API_FDC2();
  } while ((extraout_CC >> 2 & 1) == 0);
                    /* WARNING: Could not recover jumptable at 0x9c0b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDC8 @ 9c0d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9c2c */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDC8(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  FUN_9b57();
  FUN_9c74();
  DAT_60ba = 0;
  DAT_60bc = (char)in_D;
  DAT_60bb = uVar1;
                    /* inline[API_FDD6]: $6023 */
  API_FDD6();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
                    /* WARNING: Could not recover jumptable at 0x9c2c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1);
  return;
}


// ===== API_FDCA @ 9c2e =====

void __h3000 API_FDCA(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_9b57();
  FUN_9c98();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
                    /* WARNING: Could not recover jumptable at 0x9c40. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== API_FE34 @ 9c42 =====

void __h3000 API_FE34(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
                    /* WARNING: Could not recover jumptable at 0x9c40. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== API_FDA6 @ 9c46 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9c71 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDA6(short *param_1,short *param_2)

{
  short sVar1;
  undefined2 in_D;
  short *psVar2;
  short *psVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  psVar2 = param_1;
  psVar3 = param_2;
LAB_9c53:
  do {
    sVar1 = *psVar2;
    if (sVar1 != 0) {
      if (sVar1 != -1) {
        *psVar3 = (short)param_1 + (sVar1 - (short)param_2);
        psVar2 = psVar2 + 1;
        psVar3 = psVar3 + 1;
        goto LAB_9c53;
      }
    }
    *psVar3 = sVar1;
    psVar2 = psVar2 + 1;
    psVar3 = psVar3 + 1;
    if (sVar1 == -1) {
                    /* WARNING: Could not recover jumptable at 0x9c71. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
      return;
    }
  } while( true );
}


// ===== API_FDCC @ 9c73 =====

void __h3000 API_FDCC(void)

{
  return;
}


// ===== FUN_9c74 @ 9c74 =====

void __h3000 FUN_9c74(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD90]: $6178 */
  API_FD90(param_1,DAT_60bb);
                    /* inline[API_FD90]: $6178 */
  API_FD90(extraout_A,DAT_60bc);
                    /* inline[API_FD90]: $6178 */
  API_FD90(extraout_A_00,DAT_60ba);
                    /* inline[API_FD90]: $6178 */
  API_FD90(extraout_A_01,DAT_6023);
                    /* WARNING: Could not recover jumptable at 0x9c96. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_02,param_2);
  return;
}


// ===== FUN_9c98 @ 9c98 =====

void __h3000 FUN_9c98(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD92]: $6178 */
  DAT_6023 = API_FD92();
                    /* inline[API_FD92]: $6178 */
  DAT_60ba = API_FD92();
                    /* inline[API_FD92]: $6178 */
  DAT_60bc = API_FD92();
                    /* inline[API_FD92]: $6178 */
  DAT_60bb = API_FD92();
                    /* WARNING: Could not recover jumptable at 0x9cba. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== API_FDD6 @ 9cbc =====

void __h3000 API_FDD6(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 *local_res0;
  
  *(undefined1 *)*local_res0 = g_curBank;
                    /* WARNING: Could not recover jumptable at 0x9cca. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_9ccc @ 9ccc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9cdb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9ccc(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short *local_res0;
  
  *(short *)local_res0[1] = (short)local_res0 + *local_res0;
                    /* WARNING: Could not recover jumptable at 0x9cdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 2))((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_9cdd @ 9cdd =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9ce7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9cdd(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  short *local_res0;
  
                    /* WARNING: Could not recover jumptable at 0x9ce7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))
            ((char)((ushort)((short)local_res0 + *local_res0) >> 8),param_2,param_3,param_4);
  return;
}


// ===== FUN_9ce9 @ 9ce9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9cff */
/* WARNING: Restarted to delay deadcode elimination for space: register */

ushort __h3000 FUN_9ce9(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  ushort in_D;
  short *psVar1;
  
  psVar1 = (short *)*param_3;
  if (*psVar1 != 0) {
    (*(code *)((short)psVar1 + *psVar1))((char)(in_D >> 8),(char)in_D,param_1,param_2,param_3 + 1);
    return in_D & 0xff;
  }
  return in_D;
}


// ===== API_FE5C @ 9d09 =====

void __h3000 API_FE5C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 uVar2;
  short local_res0;
  
  FUN_9d6b();
  if (DAT_60e2 < '\0') {
    FUN_9d4b();
    uVar1 = extraout_A;
    uVar2 = extraout_B;
  }
  else {
    FUN_9d2d();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B_00;
  }
                    /* WARNING: Could not recover jumptable at 0x9d2b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 4))(uVar1,uVar2,param_3,param_4);
  return;
}


// ===== API_FE5A @ 9d15 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9d2b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE5A(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4)

{
  short sVar1;
  short local_res0;
  
  sVar1 = FUN_9d6b();
  if (sVar1 < param_3) {
    FUN_9d4b();
  }
  else {
    FUN_9d2d();
  }
                    /* WARNING: Could not recover jumptable at 0x9d2b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 4))((char)((ushort)sVar1 >> 8),(char)sVar1,param_3,param_4);
  return;
}


// ===== FUN_9d2d @ 9d2d =====

void __h3000 FUN_9d2d(ushort *param_1,code *param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  byte in_CC;
  byte bVar3;
  ushort uVar2;
  
  uVar1 = (*param_2)();
  uVar2 = CONCAT11(uVar1,extraout_B);
  if (!(bool)(in_CC >> 2 & 1)) {
    if (uVar2 != *param_1) {
      do {
        bVar3 = (uVar2 + 1 == 0) << 2;
        uVar1 = (*param_2)((char)(uVar2 + 1 >> 8));
        uVar2 = CONCAT11(uVar1,extraout_B_00);
        if ((bool)(bVar3 >> 2 & 1)) {
          return;
        }
      } while (uVar2 < *param_1);
    }
    FUN_9d4b((char)((ushort)in_D >> 8));
  }
  return;
}


// ===== FUN_9d4b @ 9d4b =====

void __h3000 FUN_9d4b(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  byte in_CC;
  code *in_Y;
  short sVar2;
  
  uVar1 = (*in_Y)();
  sVar2 = CONCAT11(uVar1,extraout_B);
  while( true ) {
    if ((bool)(in_CC >> 2 & 1)) {
      return;
    }
    if (sVar2 == 0) break;
    in_CC = (sVar2 + -1 == 0) << 2;
    uVar1 = (*in_Y)((char)((ushort)(sVar2 + -1) >> 8));
    sVar2 = CONCAT11(uVar1,extraout_B_00);
  }
  FUN_9d2d((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_9d6b @ 9d6b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9d76 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9d6b(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x9d76. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_D >> 8),(char)in_D,param_1,param_1 + 2 + *(short *)(param_1 + 2));
  return;
}


// ===== API_FC64 @ 9d78 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9dbe */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC64(undefined2 param_1,undefined2 param_2)

{
  char *in_D;
  char *pcVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  byte extraout_CC_01;
  char *pcVar3;
  short sVar4;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD0C]: $0080 FF */
  MemsetInline();
  DAT_618a = 0xff;
  RomFirstRecord();
  bVar2 = extraout_CC;
  pcVar1 = in_D;
  while ((bVar2 >> 2 & 1) != 0) {
    pcVar1 = (char *)FUN_9dcd();
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      pcVar3 = pcVar1;
      API_FE60();
      *pcVar3 = *pcVar3 + -1;
      DAT_618a = 0;
    }
    RomNextRecord();
    bVar2 = extraout_CC_01;
  }
  pcVar3 = &UNK_03e8;
  sVar4 = 0;
  do {
    pcVar3 = pcVar3 + -1;
    API_FE62();
    *pcVar3 = *pcVar3 + -1;
    if (*pcVar3 == '\0') {
      sVar4 = sVar4 + 1;
    }
  } while (pcVar3 != (char *)0x0);
  DAT_6188 = sVar4;
                    /* WARNING: Could not recover jumptable at 0x9dbe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)pcVar1,param_1,param_2);
  return;
}


// ===== FUN_9dc0 @ 9dc0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9dcb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9dc0(undefined2 param_1,undefined2 param_2)

{
  ushort in_D;
  char *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  pcVar1 = (char *)(in_D & 0x3ff);
  API_FE62();
  *pcVar1 = *pcVar1 + -1;
                    /* WARNING: Could not recover jumptable at 0x9dcb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8),(char)(char *)(in_D & 0x3ff),param_1,param_2);
  return;
}


// ===== FUN_9dcd @ 9dcd =====

ushort __h3000 FUN_9dcd(void)

{
  short sVar1;
  byte bVar2;
  undefined2 in_D;
  byte bVar4;
  ushort uVar3;
  
  bVar2 = (byte)((ushort)in_D >> 8);
  bVar4 = (byte)in_D;
  if (bVar2 < 200) {
    if (bVar4 != 0) {
      return 0xffff;
    }
    uVar3 = (ushort)bVar2;
  }
  else {
    if ((199 < bVar4) || (0xcb < bVar2)) {
      return 0xffff;
    }
    sVar1 = (ushort)(bVar2 & 3) * 200 + 200;
    bVar2 = (byte)sVar1;
    uVar3 = CONCAT11((char)((ushort)sVar1 >> 8) + CARRY1(bVar2,bVar4),bVar2 + bVar4);
  }
  return uVar3;
}


// ===== FUN_9df5 @ 9df5 =====

undefined2 __h3000 FUN_9df5(void)

{
  ushort in_D;
  char cVar2;
  undefined2 uVar1;
  
  if (in_D < 200) {
    uVar1 = CONCAT11((char)in_D,(char)(in_D >> 8));
  }
  else if (in_D - 200 < 200) {
    uVar1 = CONCAT11(200,(char)(in_D - 200));
  }
  else if (in_D - 400 < 200) {
    uVar1 = CONCAT11(0xc9,(char)(in_D - 400));
  }
  else {
    cVar2 = (char)(in_D - 600);
    if (in_D - 600 < 200) {
      uVar1 = CONCAT11(0xca,cVar2);
    }
    else {
      uVar1 = CONCAT11(0xcb,cVar2 + '8');
    }
  }
  return uVar1;
}


// ===== API_FC66 @ 9e2c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FC66(void)

{
  undefined1 extraout_A;
  undefined1 uVar1;
  undefined2 uVar2;
  ushort uVar3;
  byte extraout_CC;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar4;
  
  BankPushSelect();
  if ((*(byte *)(DAT_607a + 5) & 2) == 0) {
    uVar2 = FUN_a7d2((char)((ushort)DAT_607d >> 8),(char)DAT_607d,DAT_607a,0);
    uVar3 = API_FC7C((char)((ushort)uVar2 >> 8),(char)uVar2,5);
    if ((uVar3 & 1) == 0) {
      API_FC7E((char)(uVar3 >> 8),(char)uVar3,0);
      uVar1 = extraout_A;
    }
    else {
      uVar1 = 0xff;
    }
    API_FC82(uVar1);
    uVar2 = FUN_9f02();
    return uVar2;
  }
  FUN_9f12();
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FD04(0,8,DAT_618f,0);
    DAT_618f = DAT_618f + 2;
    DAT_618d = 0;
                    /* inline[addr:9CDD]: ->$9EC6(rel) */
    uVar2 = FUN_9cdd();
    *(char *)(in_U + -1) = (char)uVar2;
    puVar4 = (undefined1 *)(in_U + -2);
    *puVar4 = (char)((ushort)uVar2 >> 8);
                    /* inline[addr:9CDD]: ->$9EEE(rel) */
    uVar2 = FUN_9cdd();
    puVar4[-1] = (char)uVar2;
    puVar4 = puVar4 + -2;
    *puVar4 = (char)((ushort)uVar2 >> 8);
                    /* inline[addr:9CDD]: ->$9ED9(rel) */
    uVar2 = FUN_9cdd();
    puVar4[-1] = (char)uVar2;
    puVar4[-2] = (char)((ushort)uVar2 >> 8);
    FUN_fb8b();
    DAT_0002 = DAT_618d + 8;
    DAT_0005 = DAT_0005 & 0xfd;
    API_FC82((char)((ushort)DAT_6137 >> 8));
    uVar2 = FUN_9f02();
    return uVar2;
  }
  BankPop();
  return in_Y;
}


// ===== FUN_9ec6 @ 9ec6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9ed7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9ec6(short param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 8) = (char)in_D;
  DAT_618d = DAT_618d + 1;
                    /* WARNING: Could not recover jumptable at 0x9ed7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_9ed9 @ 9ed9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9eec */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9ed9(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x9eec. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_9eee @ 9eee =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9f00 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9eee(undefined1 param_1,undefined1 param_2)

{
  undefined1 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9f00. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_Y,param_2,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_9f02 @ 9f02 =====

undefined2 __h3000 FUN_9f02(void)

{
  undefined2 in_stack_00000003;
  
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_9f12 @ 9f12 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9f46 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9f12(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  byte extraout_CC;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6191 = DAT_6079;
  DAT_6192 = DAT_607d + -10;
  DAT_618f = DAT_607a;
  DAT_6137 = *(undefined2 *)(DAT_607a + 8);
  sVar1 = param_2;
  API_FC06();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_6194 = sVar1 + 8;
    DAT_6196 = (char)in_D;
  }
                    /* WARNING: Could not recover jumptable at 0x9f46. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_9f48 @ 9f48 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9fbf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9f48(void)

{
  ushort uVar1;
  undefined2 uVar2;
  short sVar3;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar4;
  short *psVar5;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  DAT_0005 = DAT_0005 | 1;
  uVar1 = FUN_a055();
  if (DAT_0002 < uVar1) {
    API_FDAC();
    uVar1 = DAT_0002 & 0xff;
    FUN_8bc9((char)(DAT_0002 >> 8),(char)DAT_0002,0);
  }
  else {
    API_FDAC();
    sVar3 = 0;
    FUN_8bc9(0);
    FUN_8ba8();
    FUN_8bc9(0,2,sVar3 + 1);
    FUN_8bc9(0,2,0x1d);
                    /* inline[addr:9CDD]: ->$A0CB(rel) */
    uVar2 = FUN_9cdd();
    *(char *)(in_U + -1) = (char)uVar2;
    puVar4 = (undefined1 *)(in_U + -2);
    *puVar4 = (char)((ushort)uVar2 >> 8);
                    /* inline[addr:9CDD]: ->$A0B9(rel) */
    uVar2 = FUN_9cdd();
    puVar4[-1] = (char)uVar2;
    puVar4[-2] = (char)((ushort)uVar2 >> 8);
    psVar5 = (short *)(puVar4 + -4);
    *psVar5 = DAT_0002 - 8;
                    /* inline[addr:9CDD]: ->$9FC1(rel) */
    uVar1 = FUN_9cdd();
    *(char *)((short)psVar5 + -1) = (char)uVar1;
    *(char *)(psVar5 + -1) = (char)(uVar1 >> 8);
    FUN_fb0e();
  }
  FUN_8bd7();
  API_FC64();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0x9fbf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_Y >> 8),(char)uVar1,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_9fc1 @ 9fc1 =====

void __h3000
FUN_9fc1(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
        undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_8ba8();
                    /* WARNING: Could not recover jumptable at 0x9fc6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_9fc8 @ 9fc8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9fd5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9fc8(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6197 = FUN_9fd7();
  DAT_6199 = FUN_9fef();
                    /* WARNING: Could not recover jumptable at 0x9fd5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)DAT_6199,param_1,param_2);
  return;
}


// ===== FUN_9fd7 @ 9fd7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9fed */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9fd7(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  ushort uVar1;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_a055();
  uVar2 = API_FC7E((char)(uVar1 >> 8),(char)uVar1,2);
  if (uVar1 <= uVar2) {
    uVar2 = uVar1;
  }
                    /* WARNING: Could not recover jumptable at 0x9fed. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(uVar2 >> 8),(char)uVar2,param_3,param_4);
  return;
}


// ===== FUN_9fef @ 9fef =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa026 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9fef(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  short sVar1;
  undefined1 uVar3;
  ushort uVar2;
  byte extraout_CC;
  short sVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7E();
  sVar1 = API_FC06();
  if ((extraout_CC >> 2 & 1) != 0) {
    sVar4 = 2;
    uVar3 = (undefined1)sVar1;
    API_FD9E((char)((ushort)sVar1 >> 8),uVar3,2);
    sVar1 = API_FD9E(uVar3,uVar3,sVar4 + 1);
    sVar1 = DAT_6197 - sVar1;
    uVar2 = API_FD9E((char)((ushort)sVar1 >> 8),(char)sVar1,5);
    if ((uVar2 & 1) == 0) {
      DAT_619b = 0xff;
    }
    else {
      DAT_619b = 0;
    }
  }
                    /* WARNING: Could not recover jumptable at 0xa026. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)sVar1 >> 8),(char)sVar1,param_3,param_4);
  return;
}


// ===== FUN_a028 @ a028 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa040 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a028(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xa040. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_a042 @ a042 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa053 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a042(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xa053. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_a055 @ a055 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa0b7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_a055(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,short param_5)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  undefined1 uVar2;
  ushort uVar3;
  undefined2 uVar4;
  short sVar5;
  undefined1 extraout_B;
  byte extraout_CC;
  short sVar6;
  undefined1 *puVar7;
  short *psVar8;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar5 = param_4;
  sVar6 = param_5;
  uVar3 = API_FC7E();
  if (uVar3 != 0xffff) {
    API_FC06();
    if ((extraout_CC >> 2 & 1) != 0) {
      uVar3 = API_FD9E((char)uVar3,(char)uVar3,5);
      if ((uVar3 & 1) == 0) {
        DAT_6194 = sVar5 + 8;
        DAT_618b = 0;
        DAT_6196 = (char)(uVar3 >> 8);
                    /* inline[addr:9CDD]: ->$A0CB(rel) */
        uVar4 = FUN_9cdd();
        *(char *)(sVar6 + -1) = (char)uVar4;
        puVar7 = (undefined1 *)(sVar6 + -2);
        *puVar7 = (char)((ushort)uVar4 >> 8);
                    /* inline[addr:9CDD]: ->$A0B9(rel) */
        uVar4 = FUN_9cdd();
        puVar7[-1] = (char)uVar4;
        puVar7 = puVar7 + -2;
        uVar1 = (undefined1)((ushort)uVar4 >> 8);
        *puVar7 = uVar1;
        sVar5 = API_FC7E(uVar1,(char)uVar4,2);
        psVar8 = (short *)(puVar7 + -2);
        *psVar8 = sVar5 + -8;
                    /* inline[addr:9CDD]: ->$A0D4(rel) */
        FUN_9cdd();
        *(undefined1 *)((short)psVar8 + -1) = extraout_B;
        *(undefined1 *)(psVar8 + -1) = extraout_A;
        FUN_fb0e();
        uVar1 = extraout_B;
        uVar2 = extraout_A;
        goto LAB_a0b7;
      }
    }
  }
  uVar1 = (undefined1)uVar3;
  uVar2 = 0xff;
LAB_a0b7:
                    /* WARNING: Could not recover jumptable at 0xa0b7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar2,uVar1,param_3,param_4,param_5);
  return;
}


// ===== FUN_a0b9 @ a0b9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa0c9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a0b9(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xa0c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_a0cb @ a0cb =====

void __h3000 FUN_a0cb(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,param_3 + 8);
                    /* WARNING: Could not recover jumptable at 0xa0d2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,extraout_B,param_3,param_4);
  return;
}


// ===== FUN_a0d4 @ a0d4 =====

void __h3000 FUN_a0d4(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_618b = DAT_618b + 1;
                    /* WARNING: Could not recover jumptable at 0xa0df. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FE3A @ a0e1 =====

void __h3000 API_FE3A(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7E(param_1,param_2,0);
  API_FDA8();
  FUN_9f48();
                    /* WARNING: Could not recover jumptable at 0xa0ef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDFC @ a0f1 =====

void __h3000 API_FDFC(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 uStack_2;
  undefined1 uStack_1;
  
  BankPushSelect(param_1,0xa0);
  LcdSetCursor(extraout_A,0);
  FUN_a11a();
  FUN_a123();
  FUN_a13d();
  BankPop();
  uStack_2 = (undefined1)((ushort)param_4 >> 8);
  uStack_1 = (undefined1)param_4;
                    /* WARNING: Could not recover jumptable at 0xa106. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uStack_2,uStack_1,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_a108 @ a108 =====

void __h3000 FUN_a108(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 uStack_2;
  undefined1 uStack_1;
  
  BankPushSelect(param_1,0xa0);
  FUN_a11a();
  FUN_a12f();
  FUN_a13d();
  BankPop();
  uStack_2 = (undefined1)((ushort)param_4 >> 8);
  uStack_1 = (undefined1)param_4;
                    /* WARNING: Could not recover jumptable at 0xa118. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uStack_2,uStack_1,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_a11a @ a11a =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_a11a(void)

{
  undefined2 uVar1;
  short in_U;
  
  uVar1 = FUN_9dcd((char)((ushort)_DAT_0000 >> 8));
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  return;
}


// ===== FUN_a123 @ a123 =====

void __h3000 FUN_a123(void)

{
                    /* inline[API_FC38]: "{4:2000}{3:60AA} " */
  LcdPrintInline();
  return;
}


// ===== FUN_a12f @ a12f =====

void __h3000 FUN_a12f(void)

{
                    /* inline[API_FC38]: "[{4:2000}{3:60AA}] " */
  LcdPrintInline();
  return;
}


// ===== FUN_a13d @ a13d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a13d(void)

{
  API_FC3A(0,0xf,10);
  return;
}


// ===== FUN_a147 @ a147 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa16d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_a147(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  uVar2 = FUN_9dcd((char)((ushort)*DAT_607a >> 8));
  *(char *)(param_5 + -1) = (char)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  *(undefined1 *)(param_5 + -2) = uVar1;
  FUN_a12f();
  FUN_a16f((char)((ushort)param_3 >> 8));
  API_FC3A(uVar1,0xf,0x60c8);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xa16d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_stack_00000000 >> 8),(char)uVar2,in_stack_00000002);
  return;
}


// ===== FUN_a16f @ a16f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa1da */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a16f(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined2 uVar2;
  byte extraout_CC;
  short sVar3;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar4;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = DAT_607a;
  BankPushSelect((char)((ushort)in_D >> 8));
  if ((*(byte *)(sVar3 + 5) & 2) == 0) {
    uVar1 = (undefined1)((ushort)(sVar3 + 8) >> 8);
    in_D = CONCAT11(uVar1,(char)in_D);
    FUN_a1dc(uVar1);
  }
  else {
    FUN_9f12();
    if ((extraout_CC >> 2 & 1) == 0) {
      API_FE1E();
                    /* inline[addr:9CDD]: ->$A1BE(rel) */
      FUN_9cdd();
      FUN_a1dc();
    }
    else {
      DAT_618f = DAT_618f + 10;
      DAT_618d = 0;
                    /* inline[addr:9CDD]: ->$A1EC(rel) */
      uVar2 = FUN_9cdd();
      *(char *)(in_U + -1) = (char)uVar2;
      puVar4 = (undefined1 *)(in_U + -2);
      *puVar4 = (char)((ushort)uVar2 >> 8);
                    /* inline[addr:9CDD]: ->$9EEE(rel) */
      uVar2 = FUN_9cdd();
      puVar4[-1] = (char)uVar2;
      puVar4 = puVar4 + -2;
      *puVar4 = (char)((ushort)uVar2 >> 8);
                    /* inline[addr:9CDD]: ->$9ED9(rel) */
      in_D = FUN_9cdd();
      puVar4[-1] = (char)in_D;
      puVar4[-2] = (char)((ushort)in_D >> 8);
      FUN_fb8b();
    }
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xa1da. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_Y >> 8),(char)in_D,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_a1dc @ a1dc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa1ea */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a1dc(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FD04(0);
                    /* WARNING: Could not recover jumptable at 0xa1ea. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_a1ec @ a1ec =====

void __h3000 FUN_a1ec(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = DAT_618d._0_1_;
  *(undefined1 *)((short)&DAT_60c6 + (short)DAT_618d._0_1_) = param_2;
  if ((char)(cVar1 + '\x01') != '\x12') {
    DAT_618d._0_1_ = cVar1 + '\x01';
  }
                    /* WARNING: Could not recover jumptable at 0xa204. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDCE @ a206 =====

undefined1 __h3000
API_FDCE(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
        undefined2 param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined1 extraout_B_03;
  byte extraout_CC;
  
  DAT_60fb = 0xff;
  DAT_60fc = 0xff;
  DAT_60da = 1;
  API_FC88();
  DAT_60b8 = 0;
  API_FDD0();
  FUN_e075();
  FUN_e7fe();
  FUN_cb9c();
  API_FC7E(extraout_A,extraout_B,8);
  API_FC06();
  g_curBank = extraout_B_01;
  DAT_6021 = extraout_B_01;
  DAT_6022 = extraout_B_01;
  DAT_6023 = extraout_B_01;
  DAT_6102 = extraout_B_01;
  API_FC08(extraout_A_00,extraout_B_00);
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_a30c();
    FUN_e07e();
    FUN_e804();
    API_FC92();
    API_FC7E(extraout_A_01,extraout_B_02,8);
    DAT_600a = extraout_A_02;
    FUN_e064(param_1,param_2,param_3,param_4,param_5);
    return extraout_B_03;
  }
  return param_2;
}


// ===== API_FDD0 @ a273 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FDD0(void)

{
  DAT_6009 = 0;
  DAT_6008 = 0;
  API_FC88();
  API_FC86();
  LAB_6600 = 0xb7;
  DAT_6601 = &DAT_8055;
  DAT_6603 = 0x3b;
  SWI_trampoline = 0x3b;
  SWI2_trampoline = 0x3b;
  SWI3_trampoline = 0x3b;
                    /* inline[API_FD18]: [$600F]=$FFE8 [$6011]=$FFE8 [$6013]=$FFE8 [$6015]=$FFE8
                       [$6006]=$FFE8 [$6004]=$FFE8 [$6002]=$FFE8 [$608F]=$FFE8 [$6091]=$FFE8
                       [$6093]=$FFE8 [$6095]=$FFE8 [$6097]=$FFE8 [$603A]=$FFE8 [$6038]=$FFE8
                       [$6036]=$FFE8 [$608D]=$FFE8 [$60ED]=$FFE8 [$60EF]=$8D51 */
  StoreWordsInline(0x3b,0x55,0x6604);
  API_FC58();
  FUN_a61a();
  FUN_f937();
  return;
}


// ===== FUN_a2f1 @ a2f1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa30a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a2f1(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = API_FC7C();
  if ((bVar1 & 8) == 0) {
    bVar1 = FUN_c912();
  }
  if ((bVar1 & 4) == 0) {
    API_FD50(0x10);
  }
                    /* WARNING: Could not recover jumptable at 0xa30a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1,param_2);
  return;
}


// ===== FUN_a30c @ a30c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa346 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a30c(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  ushort uVar1;
  short sVar2;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  if (DAT_6105 != '\0') {
    uVar1 = DAT_6106 + 0x40;
    if (!(bool)((uVar1 < DAT_0002) + (uVar1 == DAT_0002))) {
      sVar2 = uVar1 - DAT_0002;
      param_2 = (undefined1)sVar2;
      API_FD04((char)((ushort)sVar2 >> 8),param_2,(short)&UNK_a388 - sVar2,DAT_6106);
      DAT_0002 = uVar1;
    }
  }
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xa346. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_4 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== API_FC68 @ a40c =====

void __h3000 API_FC68(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  UNK_8022 = param_2;
  DAT_80a6 = 1;
  DAT_80a6 = 0;
  DAT_8020 = param_2;
                    /* WARNING: Could not recover jumptable at 0xa513. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FC6A @ a414 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa440 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC6A(undefined2 param_1,undefined2 param_2)

{
  ushort uVar1;
  undefined1 uVar2;
  ushort in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61a1 = (byte)in_D;
  uVar1 = in_D >> 8;
  if (DAT_60f4 == '\0') {
    uVar2 = (undefined1)((in_D & 0xff) * (ushort)DAT_619d >> 8);
    DAT_619c = DAT_61a1;
    API_FC7A(uVar2,uVar2,&UNK_8026);
    in_D = (ushort)(byte)~DAT_619c * (ushort)DAT_619d;
    uVar2 = (undefined1)(in_D >> 8);
    API_FC7A(uVar2,uVar2,&UNK_8036);
  }
                    /* WARNING: Could not recover jumptable at 0xa440. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_a421 @ a421 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa440 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a421(void)

{
  ushort uVar1;
  undefined1 uVar2;
  byte bVar3;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = (undefined1)((ushort)DAT_619c * (ushort)DAT_619d >> 8);
  API_FC7A(uVar2,uVar2,&UNK_8026);
  bVar3 = ~DAT_619c;
  uVar1 = (ushort)DAT_619d;
  uVar2 = (undefined1)(bVar3 * uVar1 >> 8);
  API_FC7A(uVar2,uVar2,&UNK_8036);
                    /* WARNING: Could not recover jumptable at 0xa440. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000000 >> 8),(char)(bVar3 * uVar1),in_stack_00000002,
             in_stack_00000004);
  return;
}


// ===== API_FC6C @ a442 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa513 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC6C(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  ushort uVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = API_FC7C();
  sVar3 = (uVar2 >> 8) * (uVar2 & 0xff);
  uVar1 = (undefined1)((ushort)sVar3 >> 8);
  UNK_8025 = uVar1;
  DAT_80a6 = 1;
  DAT_80a6 = 0;
  DAT_8020 = uVar1;
                    /* WARNING: Could not recover jumptable at 0xa513. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
}


// ===== API_FC6E @ a455 =====

void __h3000 API_FC6E(undefined1 param_1,undefined1 param_2)

{
  DAT_619d = param_2;
  FUN_a421();
  return;
}


// ===== API_FC70 @ a45c =====

void __h3000 API_FC70(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  UNK_8024 = param_2;
  DAT_80a6 = 1;
  DAT_80a6 = 0;
  DAT_8020 = param_2;
                    /* WARNING: Could not recover jumptable at 0xa513. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FC72 @ a464 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa48e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC72(undefined2 param_1,undefined2 param_2)

{
  ushort uVar1;
  undefined1 uVar2;
  ushort in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61a0 = (byte)in_D;
  uVar1 = in_D >> 8;
  if (DAT_60f4 == '\0') {
    uVar2 = (undefined1)((in_D & 0xff) * (ushort)DAT_619f >> 8);
    DAT_619e = DAT_61a0;
    API_FC7A(uVar2,uVar2,&UNK_8033);
    in_D = (ushort)(byte)~DAT_619e * (ushort)DAT_619f;
    uVar2 = (undefined1)(in_D >> 8);
    API_FC7A(uVar2,uVar2,&UNK_8023);
  }
                    /* WARNING: Could not recover jumptable at 0xa48e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_a471 @ a471 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa48e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a471(void)

{
  ushort uVar1;
  undefined1 uVar2;
  byte bVar3;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = (undefined1)((ushort)DAT_619e * (ushort)DAT_619f >> 8);
  API_FC7A(uVar2,uVar2,&UNK_8033);
  bVar3 = ~DAT_619e;
  uVar1 = (ushort)DAT_619f;
  uVar2 = (undefined1)(bVar3 * uVar1 >> 8);
  API_FC7A(uVar2,uVar2,&UNK_8023);
                    /* WARNING: Could not recover jumptable at 0xa48e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000000 >> 8),(char)(bVar3 * uVar1),in_stack_00000002,
             in_stack_00000004);
  return;
}


// ===== API_FC74 @ a490 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa513 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC74(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  ushort uVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = API_FC7C();
  sVar3 = (uVar2 >> 8) * (uVar2 & 0xff);
  uVar1 = (undefined1)((ushort)sVar3 >> 8);
  UNK_8027 = uVar1;
  DAT_80a6 = 1;
  DAT_80a6 = 0;
  DAT_8020 = uVar1;
                    /* WARNING: Could not recover jumptable at 0xa513. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
}


// ===== API_FC76 @ a4a2 =====

void __h3000 API_FC76(undefined1 param_1,undefined1 param_2)

{
  DAT_619f = param_2;
  FUN_a471();
  return;
}


// ===== API_FC78 @ a4a9 =====

void __h3000 API_FC78(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_8020 = 0;
  DAT_80a6 = 0;
  API_FC6C(0,0);
  API_FC74();
  API_FC6A(0xff);
  API_FC72();
  API_FC7C(extraout_A,extraout_B,&DAT_0284);
  API_FDD2();
  API_FC68();
  API_FC7C(extraout_A_00,extraout_B_00,&DAT_0285);
  API_FDD2();
  API_FC70();
  API_FC7C(extraout_A_01,extraout_B_01,&DAT_0286);
  API_FDD2();
  API_FC6E();
  API_FC7C(extraout_A_02,extraout_B_02,&DAT_0287);
  API_FDD2();
  API_FC76();
  DAT_60f4 = 0;
  DAT_601a = 0x7f;
                    /* WARNING: Could not recover jumptable at 0xa4fb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC7A @ a4fd =====

void __h3000 API_FC7A(undefined1 param_1,undefined1 param_2,undefined1 *param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  *param_3 = param_2;
  DAT_80a6 = 1;
  DAT_80a6 = 0;
  DAT_8020 = param_2;
                    /* WARNING: Could not recover jumptable at 0xa513. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FDD2 @ a515 =====

void __h3000 API_FDD2(undefined1 param_1,byte param_2,undefined2 param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)param_2 < '\0') {
    param_2 = -param_2;
  }
  if (param_2 < 0x30 == (param_2 == 0x30)) {
    param_2 = 0x30;
  }
                    /* WARNING: Could not recover jumptable at 0xa528. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,(&DAT_a52a)[(char)param_2],param_3);
  return;
}


// ===== FUN_a55b @ a55b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa56a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a55b(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xa56a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FD94 @ a590 =====

void __h3000 API_FD94(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
  FUN_a5a4();
                    /* WARNING: Could not recover jumptable at 0xa5a2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_a5a4 @ a5a4 =====

void __h3000 FUN_a5a4(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 uVar1;
  char extraout_B;
  char extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 uVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_4;
  API_FC7C(param_1,param_2,*(undefined2 *)(param_4 + 2));
  if (extraout_B == -0x30) {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  else {
    API_FC7C(extraout_A,extraout_B,*(undefined2 *)(sVar3 + 4));
    API_FD9C(extraout_A_00,extraout_B_00 + extraout_B);
    if (*(char *)(sVar3 + 8) != '\0') {
      FUN_a55b();
    }
    API_FDD2();
    uVar1 = extraout_A_01;
    uVar2 = extraout_B_01;
  }
  (**(code **)(sVar3 + 6))(uVar1,uVar2);
                    /* WARNING: Could not recover jumptable at 0xa5cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD96 @ a5cd =====

void __h3000 API_FD96(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
  FUN_a5a4();
                    /* WARNING: Could not recover jumptable at 0xa5a2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD98 @ a5d5 =====

void __h3000 API_FD98(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
  FUN_a5a4();
                    /* WARNING: Could not recover jumptable at 0xa5a2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD9A @ a5dd =====

void __h3000 API_FD9A(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
  FUN_a5a4();
                    /* WARNING: Could not recover jumptable at 0xa5a2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FE52 @ a5e5 =====

void __h3000 API_FE52(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 uVar1;
  char extraout_B;
  char extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 uVar2;
  undefined *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar3 = &UNK_a56c;
  API_FC7C(param_1,param_2,&DAT_0284);
  if (extraout_B == -0x30) {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  else {
    API_FC7C(extraout_A,extraout_B,*(undefined2 *)(puVar3 + 4));
    API_FD9C(extraout_A_00,extraout_B_00 + extraout_B);
    if (puVar3[8] != '\0') {
      FUN_a55b();
    }
    API_FDD2();
    uVar1 = extraout_A_01;
    uVar2 = extraout_B_01;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
                    /* WARNING: Could not recover jumptable at 0xa5cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FE54 @ a5ed =====

void __h3000 API_FE54(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 uVar1;
  char extraout_B;
  char extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 uVar2;
  undefined *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar3 = &UNK_a575;
  API_FC7C(param_1,param_2,&DAT_0285);
  if (extraout_B == -0x30) {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  else {
    API_FC7C(extraout_A,extraout_B,*(undefined2 *)(puVar3 + 4));
    API_FD9C(extraout_A_00,extraout_B_00 + extraout_B);
    if (puVar3[8] != '\0') {
      FUN_a55b();
    }
    API_FDD2();
    uVar1 = extraout_A_01;
    uVar2 = extraout_B_01;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
                    /* WARNING: Could not recover jumptable at 0xa5cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FE56 @ a5f5 =====

void __h3000 API_FE56(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 uVar1;
  char extraout_B;
  char extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 uVar2;
  undefined *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar3 = &UNK_a57e;
  API_FC7C(param_1,param_2,&DAT_0286);
  if (extraout_B == -0x30) {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  else {
    API_FC7C(extraout_A,extraout_B,*(undefined2 *)(puVar3 + 4));
    API_FD9C(extraout_A_00,extraout_B_00 + extraout_B);
    if (puVar3[8] != '\0') {
      FUN_a55b();
    }
    API_FDD2();
    uVar1 = extraout_A_01;
    uVar2 = extraout_B_01;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
                    /* WARNING: Could not recover jumptable at 0xa5cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FE58 @ a5fd =====

void __h3000 API_FE58(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 uVar1;
  char extraout_B;
  char extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 uVar2;
  undefined *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar3 = &UNK_a587;
  API_FC7C(param_1,param_2,&DAT_0287);
  if (extraout_B == -0x30) {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  else {
    API_FC7C(extraout_A,extraout_B,*(undefined2 *)(puVar3 + 4));
    API_FD9C(extraout_A_00,extraout_B_00 + extraout_B);
    if (puVar3[8] != '\0') {
      FUN_a55b();
    }
    API_FDD2();
    uVar1 = extraout_A_01;
    uVar2 = extraout_B_01;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
                    /* WARNING: Could not recover jumptable at 0xa5cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_a605 @ a605 =====

void __h3000 FUN_a605(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_601a = param_2;
  FUN_a5a4();
  FUN_a5a4();
                    /* WARNING: Could not recover jumptable at 0xa618. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_a61a @ a61a =====

void __h3000 FUN_a61a(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a5a4();
  FUN_a5a4();
  FUN_a5a4();
  FUN_a5a4();
                    /* WARNING: Could not recover jumptable at 0xa638. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD9C @ a63a =====

short __h3000 API_FD9C(undefined1 param_1,char param_2)

{
  if ('\0' < param_2) {
    param_2 = '\0';
  }
  if (param_2 < -0x30) {
    param_2 = -0x30;
  }
  return (short)param_2;
}


// ===== API_FDE2 @ a647 =====

void __h3000 API_FDE2(void)

{
  undefined2 in_D;
  char cVar1;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor();
  cVar1 = API_FC7C();
  if (cVar1 == -0x30) {
                    /* inline[API_FC38]: "  Off " */
    LcdPrintInline();
  }
  else {
    *(char *)(in_U + -1) = cVar1;
    *(char *)(in_U + -2) = cVar1 >> 7;
                    /* inline[API_FC38]: "{4:0000}{3:60AA} dB" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0xa66f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FE38 @ a671 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa6a0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE38(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  do {
    do {
      cVar1 = (char)in_D;
      if (DAT_619e != -1) {
        FUN_a6ac();
        DAT_619e = cVar1;
        FUN_a6a2();
      }
      if (DAT_619c != -1) {
        FUN_a6ac();
        DAT_619c = cVar1;
        FUN_a6a7();
      }
    } while (DAT_619e != -1);
  } while (DAT_619c != -1);
                    /* WARNING: Could not recover jumptable at 0xa6a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2);
  return;
}


// ===== FUN_a6a2 @ a6a2 =====

void __h3000 FUN_a6a2(void)

{
  FUN_a471();
  return;
}


// ===== FUN_a6a7 @ a6a7 =====

void __h3000 FUN_a6a7(void)

{
  FUN_a421();
  return;
}


// ===== FUN_a6ac @ a6ac =====

char __h3000 FUN_a6ac(undefined1 param_1,byte param_2)

{
  char cVar1;
  
  cVar1 = param_2 + DAT_60da;
  if (CARRY1(param_2,DAT_60da)) {
    cVar1 = -1;
  }
  return cVar1;
}


// ===== API_FE36 @ a6b4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa703 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE36(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  do {
    cVar1 = (char)in_D;
    if (DAT_619e != DAT_61a0) {
      DAT_619e = cVar1;
      FUN_a6a2();
    }
    if (DAT_619c != DAT_61a1) {
      DAT_619c = cVar1;
      FUN_a6a7();
    }
  } while ((DAT_61a0 != DAT_619e) || (DAT_61a1 != DAT_619c));
                    /* WARNING: Could not recover jumptable at 0xa703. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2);
  return;
}


// ===== API_FC7C @ a705 =====

void __h3000 API_FC7C(undefined1 param_1)

{
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  API_FCA0();
  DAT_600c = uVar1;
                    /* WARNING: Could not recover jumptable at 0xa719. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1);
  return;
}


// ===== API_FC7E @ a71b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa73a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC7E(short param_1,undefined2 param_2,undefined2 param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 extraout_B;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  sVar2 = param_1;
  API_FCA0();
  extraout_B = (undefined1)in_D;
  API_FCA0(extraout_B,extraout_B,sVar2 + 1);
  DAT_600c = uVar1;
                    /* WARNING: Could not recover jumptable at 0xa73a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),extraout_B,param_1,param_2,param_3);
  return;
}


// ===== API_FC80 @ a73c =====

void __h3000 API_FC80(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 uVar1;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  API_FCA2();
  DAT_600c = uVar1;
                    /* WARNING: Could not recover jumptable at 0xa750. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,extraout_B,param_3,param_4);
  return;
}


// ===== API_FC82 @ a752 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa773 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC82(undefined2 param_1,short param_2,undefined2 param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined2 uVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  sVar3 = param_2;
  uVar2 = API_FCA2();
  API_FCA2((char)uVar2,(char)((ushort)uVar2 >> 8),param_1,sVar3 + 1);
  DAT_600c = uVar1;
                    /* WARNING: Could not recover jumptable at 0xa773. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== API_FD88 @ a775 =====

void __h3000 API_FD88(undefined1 param_1)

{
  byte extraout_A;
  byte extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a7a7();
  API_FC7C();
                    /* WARNING: Could not recover jumptable at 0xa780. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,extraout_B & extraout_A);
  return;
}


// ===== API_FD8A @ a782 =====

void __h3000 API_FD8A(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  byte extraout_B_00;
  undefined1 extraout_B_01;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a7a7();
  API_FC7C(extraout_A,extraout_B,param_4);
  API_FC80(extraout_A_00,extraout_B_00 | extraout_A);
                    /* WARNING: Could not recover jumptable at 0xa792. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,extraout_B_01,param_3);
  return;
}


// ===== API_FD8C @ a794 =====

void __h3000 API_FD8C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  byte extraout_B_00;
  undefined1 extraout_B_01;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a7a7();
  API_FC7C(~extraout_A,extraout_B,param_4);
  API_FC80(extraout_A_00,extraout_B_00 & ~extraout_A);
                    /* WARNING: Could not recover jumptable at 0xa7a5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,extraout_B_01,param_3);
  return;
}


// ===== FUN_a7a7 @ a7a7 =====

void __h3000 FUN_a7a7(undefined1 param_1,byte param_2,undefined2 param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xa7b0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((&DAT_a7b2)[(char)(param_2 & 7)],param_2 & 7,param_3);
  return;
}


// ===== FUN_a7ba @ a7ba =====

void __h3000 FUN_a7ba(void)

{
  ushort uVar1;
  short in_D;
  undefined1 uVar2;
  undefined1 *in_Y;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  do {
    uVar2 = API_FC7C();
    *in_Y = uVar2;
    in_D = in_D + -1;
    in_Y = in_Y + 1;
  } while (in_D != 0);
                    /* WARNING: Could not recover jumptable at 0xa7d0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1);
  return;
}


// ===== FUN_a7d2 @ a7d2 =====

void __h3000 FUN_a7d2(void)

{
  ushort uVar1;
  short in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  do {
    API_FC80();
    in_D = in_D + -1;
  } while (in_D != 0);
                    /* WARNING: Could not recover jumptable at 0xa7e8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1);
  return;
}


// ===== API_FC84 @ a7ea =====

void __h3000 API_FC84(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC88();
  API_FC86();
  DAT_60b8 = 0xff;
                    /* WARNING: Could not recover jumptable at 0xa7f7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_a7f9 @ a7f9 =====

void __h3000 FUN_a7f9(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xff;
  FUN_a807();
  FUN_a88d();
                    /* WARNING: Could not recover jumptable at 0xa805. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_a807 @ a807 =====

void __h3000 FUN_a807(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_60fb & 0xf8) != 0x80) {
    DAT_61a6 = g_curBank;
    API_FC8C();
    API_FC88();
                    /* inline[API_FC38]: "{1} Left In   Right In  Left Out  Right Out(        )(
                       )(        )(        )" */
    LcdPrintInline();
    FUN_a9fa();
                    /* inline[API_FD18]: [$603C]=$AA39 [$603E]=$AA73 [$6040]=$AA98 [$6042]=$AABD */
    StoreWordsInline();
  }
                    /* WARNING: Could not recover jumptable at 0xa88b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_a88d @ a88d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa8cc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a88d(undefined2 param_1)

{
  ushort uVar1;
  short in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  if (DAT_60fb != -0x80) {
    DAT_60fb = -0x80;
    API_FC7C();
    in_D = (short)(char)in_D;
    DAT_6074 = in_D;
    FUN_aa1a();
                    /* inline[API_FD18]: [$602A]=$A93B [$6070]=$A8CE [$6072]=$A8E6 [$605C]=$A903
                       [$605A]=$A903 */
    StoreWordsInline();
    API_FDF2();
    API_FE32();
    API_FE32();
  }
                    /* WARNING: Could not recover jumptable at 0xa8cc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1);
  return;
}


// ===== FUN_a8ce @ a8ce =====

void __h3000 FUN_a8ce(void)

{
  if (DAT_604d != '\0') {
                    /* inline[API_FC38]: "{2:2A}{5:06}{3:60A0}{2:34}{5:06}{3:60A0}" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_a8e6 @ a8e6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa921 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a8e6(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar1 = &DAT_ab88;
  FUN_ab6a((char)((ushort)DAT_6074 >> 8));
  (*(code *)*puVar1)();
  puVar1 = &DAT_ab95;
  FUN_ab6a();
  (*(code *)*puVar1)();
  FUN_a9d1();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xa921. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_a903 @ a903 =====

void __h3000 FUN_a903(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a923();
  FUN_a923();
  FUN_a9d1();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xa921. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_a923 @ a923 =====

void __h3000 FUN_a923(void)

{
  short in_D;
  char cVar1;
  undefined2 *in_Y;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = API_FC7C();
  API_FD9C((char)((ushort)(cVar1 + in_D) >> 8));
  FUN_ab6a();
  (*(code *)*in_Y)();
                    /* WARNING: Could not recover jumptable at 0xa939. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_a93b @ a93b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa97a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a93b(undefined2 param_1)

{
  ushort uVar1;
  short in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  if (DAT_60fb != -0x7f) {
    DAT_60fb = -0x7f;
    API_FC7C();
    in_D = (short)(char)in_D;
    DAT_6074 = in_D;
    FUN_aa1a();
                    /* inline[API_FD18]: [$602A]=$A88D [$6070]=$A97C [$6072]=$A994 [$605C]=$A9B1
                       [$605A]=$A9B1 */
    StoreWordsInline();
    API_FDF2();
    API_FE32();
    API_FE32();
  }
                    /* WARNING: Could not recover jumptable at 0xa97a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1);
  return;
}


// ===== FUN_a97c @ a97c =====

void __h3000 FUN_a97c(void)

{
  if (DAT_604d != '\0') {
                    /* inline[API_FC38]: "{2:3E}{5:06}{3:60A0}{2:48}{5:06}{3:60A0}" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_a994 @ a994 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xa9cf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a994(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar1 = &DAT_aba2;
  FUN_ab6a((char)((ushort)DAT_6074 >> 8));
  (*(code *)*puVar1)();
  puVar1 = &DAT_abaf;
  FUN_ab6a();
  (*(code *)*puVar1)();
  FUN_a9d1();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xa9cf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_a9b1 @ a9b1 =====

void __h3000 FUN_a9b1(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a923();
  FUN_a923();
  FUN_a9d1();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xa9cf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_a9d1 @ a9d1 =====

void __h3000 FUN_a9d1(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  char extraout_B;
  undefined1 extraout_B_00;
  char extraout_B_01;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDE2(param_1,*(undefined1 *)(param_4 + 6),*(undefined2 *)(param_4 + 2));
  LcdSetCursor(extraout_A,extraout_B + '\x06');
  API_FC7C(extraout_A_00,extraout_B_00,*(undefined2 *)(param_4 + 0xb));
  if (extraout_B_01 != '\0') {
    if (extraout_B_01 < '\0') {
      uVar1 = 0x2d;
    }
    else {
      uVar1 = 0x2b;
    }
    API_FC2A(extraout_A_01,uVar1);
  }
                    /* WARNING: Could not recover jumptable at 0xa9f8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_a9fa @ a9fa =====

void __h3000 FUN_a9fa(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a9d1();
  FUN_a9d1();
  FUN_a9d1();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xaa18. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_aa1a @ aa1a =====

void __h3000 FUN_aa1a(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC16]: 03 10 06 32 01 00 03 00 $0000 $FFD0 $0000 ->$0000 ->$0000
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xaa37. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_aa39 @ aa39 =====

void __h3000 FUN_aa39(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_60fb != -0x7e) {
    DAT_60fb = -0x7e;
    FUN_ab15();
    FUN_ab40();
  }
                    /* WARNING: Could not recover jumptable at 0xaa4f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_aa51 @ aa51 =====

void __h3000 FUN_aa51(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_ab52();
  FUN_aa5e();
                    /* WARNING: Could not recover jumptable at 0xaa5c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_aa5e @ aa5e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xaa71 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_aa5e(undefined2 param_1,undefined2 *param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6074 = DAT_60f9;
  DAT_60c2 = param_2;
  (*(code *)*param_2)();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xaa71. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_aa73 @ aa73 =====

void __h3000 FUN_aa73(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_60fb != -0x7d) {
    DAT_60fb = -0x7d;
    FUN_ab15();
    FUN_ab40();
  }
                    /* WARNING: Could not recover jumptable at 0xaa89. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_aa8b @ aa8b =====

void __h3000 FUN_aa8b(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_ab52();
  FUN_aa5e();
                    /* WARNING: Could not recover jumptable at 0xaa96. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_aa98 @ aa98 =====

void __h3000 FUN_aa98(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_60fb != -0x7c) {
    DAT_60fb = -0x7c;
    FUN_ab15();
    FUN_ab40();
  }
                    /* WARNING: Could not recover jumptable at 0xaaae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_aab0 @ aab0 =====

void __h3000 FUN_aab0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_ab52();
  FUN_aa5e();
                    /* WARNING: Could not recover jumptable at 0xaabb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_aabd @ aabd =====

void __h3000 FUN_aabd(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_60fb != -0x7b) {
    DAT_60fb = -0x7b;
    FUN_ab15();
    FUN_ab40();
  }
                    /* WARNING: Could not recover jumptable at 0xaad3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_aad5 @ aad5 =====

void __h3000 FUN_aad5(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_ab52();
  FUN_aa5e();
                    /* WARNING: Could not recover jumptable at 0xaae1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_aae3 @ aae3 =====

void __h3000 FUN_aae3(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor(param_1,*(undefined1 *)(DAT_60c2 + 6));
  if (DAT_604d != '\0') {
                    /* inline[API_FC38]: "{5:06}{3:60A0}" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0xaafe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_ab00 @ ab00 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xab13 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ab00(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar1 = DAT_60c2;
  FUN_ab6a((char)((ushort)DAT_6074 >> 8));
  (*(code *)*puVar1)();
  FUN_a9d1();
                    /* WARNING: Could not recover jumptable at 0xab13. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_ab15 @ ab15 =====

void __h3000 FUN_ab15(void)

{
  char cVar1;
  undefined2 in_Y;
  
  DAT_60c2 = in_Y;
  cVar1 = API_FC7C();
  DAT_6074 = (short)cVar1;
                    /* inline[API_FC16]: 01 10 02 32 01 00 03 00 $0000 $FFD0 $0000 ->$FFAE ->$FFC9
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return;
}


// ===== FUN_ab40 @ ab40 =====

void __h3000 FUN_ab40(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2(param_1,*(undefined1 *)(param_4 + 6));
  API_FE32(extraout_A,*(undefined1 *)(param_4 + 7));
                    /* WARNING: Could not recover jumptable at 0xab50. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,param_2);
  return;
}


// ===== FUN_ab52 @ ab52 =====

void __h3000 FUN_ab52(void)

{
  short in_Y;
  
  if (*(char *)(in_Y + 10) != DAT_60fb) {
    FUN_a807();
    DAT_60b9 = *(undefined1 *)(in_Y + 7);
    (**(code **)(in_Y + 8))();
  }
  return;
}


// ===== FUN_ab6a @ ab6a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xab86 */
/* WARNING: Removing unreachable block (RAM,0xab79) */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ab6a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
                    /* WARNING: Could not recover jumptable at 0xab86. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_abc0 @ abc0 =====

void __h3000 FUN_abc0(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xff;
  API_FC88();
  API_FC8E();
                    /* WARNING: Could not recover jumptable at 0xabcd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC88 @ abcf =====

void __h3000 API_FC88(void)

{
  API_FDB0();
                    /* inline[API_FD18]: [$602A]=$A7F9 [$602E]=$AD71 [$6030]=$FBDA [$602C]=$ABBC
                       [$603C]=$FFE8 [$603E]=$FFE8 [$6040]=$FFE8 [$6042]=$FFE8 [$6038]=$FFE8
                       [$6036]=$FFE8 [$603A]=$ABC0 [$605C]=$FFE8 [$605A]=$FFE8 [$606A]=$FFE8
                       [$6072]=$FFE8 [$6070]=$FFE8 */
  StoreWordsInline();
  return;
}


// ===== API_FDD4 @ ac18 =====

void __h3000 API_FDD4(void)

{
                    /* inline[API_FC38]: "{2:28}{5:28}" */
  LcdPrintInline();
                    /* inline[API_FD18]: [$603C]=$FFE8 [$603E]=$FFE8 [$6040]=$FFE8 [$6042]=$FFE8 */
  StoreWordsInline();
  return;
}


// ===== API_FE3C @ ac36 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xac68 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE3C(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 *local_res0;
  
  DAT_61a2 = *local_res0;
  DAT_61a4 = local_res0[1];
                    /* inline[API_FC8A]: ->$AC6A(rel) "(  Yes   )" */
  SoftKeyDefine();
                    /* inline[API_FC8A]: ->$AC6E(rel) "(   No   )" */
  SoftKeyDefine();
                    /* WARNING: Could not recover jumptable at 0xac68. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 2))((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_ac6a @ ac6a =====

void __h3000 FUN_ac6a(void)

{
                    /* WARNING: Could not recover jumptable at 0xac6a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*DAT_61a2)();
  return;
}


// ===== FUN_ac6e @ ac6e =====

void __h3000 FUN_ac6e(void)

{
                    /* WARNING: Could not recover jumptable at 0xac6e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*DAT_61a4)();
  return;
}


// ===== SoftKeyDefine @ ac72 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xac9f */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC8A: B = key 0-3; inline handler + 10-char label */

void __h3000 SoftKeyDefine(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  byte bVar2;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  byte *pbVar3;
  short *local_res0;
  
  bVar2 = (byte)in_D & 3;
  pbVar3 = (byte *)(param_3 + -1);
  *pbVar3 = bVar2;
  UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 1);
  *(short *)((short)&DAT_603c + (short)(char)(bVar2 << 1)) = (short)local_res0 + *local_res0;
  sVar1 = (CONCAT11(10,*pbVar3) >> 8) * (ushort)*pbVar3;
  LcdSetCursor((char)((ushort)sVar1 >> 8));
  API_FC3A();
                    /* inline[API_FDD6]: $6021 */
  API_FDD6();
                    /* WARNING: Could not recover jumptable at 0xac9f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,pbVar3 + 1);
  return;
}


// ===== API_FC8C @ aca2 =====

void __h3000 API_FC8C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 uStack_2;
  undefined1 uStack_1;
  
  BankPushSelect(param_1,DAT_61a6);
  if (DAT_60b8 == '\0') {
    DAT_60b8 = -1;
    API_FD1C(0xff,extraout_B,&UNK_acf5,0x6800);
    LcdSetCursor(extraout_A,0);
    API_FC3C(extraout_A_00,0x50);
    (*DAT_60ed)();
  }
  BankPop();
  uStack_2 = (undefined1)((ushort)param_4 >> 8);
  uStack_1 = (undefined1)param_4;
                    /* WARNING: Could not recover jumptable at 0xaccf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uStack_2,uStack_1,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== API_FC8E @ acd1 =====

void __h3000 API_FC8E(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_60b8 != '\0') {
    DAT_60b8 = '\0';
    API_FD1E(param_1,param_2,0x6800,&UNK_acf5);
    LcdSetCursor(extraout_A,0);
    API_FC3A(extraout_A_00,0x50);
    (*DAT_60ef)();
  }
                    /* WARNING: Could not recover jumptable at 0xacf3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_af1f @ af1f =====

void __h3000 FUN_af1f(void)

{
  undefined2 in_D;
  undefined *puVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  puVar1 = (undefined *)FUN_af5f();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    if (puVar1 != &UNK_03e8) {
      do {
        puVar1 = (undefined *)FUN_af5f((char)((ushort)(puVar1 + 1) >> 8));
        if ((bool)(extraout_CC_00 >> 2 & 1)) {
          return;
        }
      } while (puVar1 < &UNK_03e8);
    }
    FUN_af3f((char)((ushort)in_D >> 8));
  }
  return;
}


// ===== FUN_af3f @ af3f =====

void __h3000 FUN_af3f(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  
  sVar1 = FUN_af5f();
  bVar2 = extraout_CC;
  while( true ) {
    if ((bool)(bVar2 >> 2 & 1)) {
      return;
    }
    if (sVar1 == 0) break;
    sVar1 = FUN_af5f((char)((ushort)(sVar1 + -1) >> 8));
    bVar2 = extraout_CC_00;
  }
  FUN_af1f((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_af5f @ af5f =====

void __h3000 FUN_af5f(void)

{
  FUN_9dc0();
  return;
}


// ===== FUN_af69 @ af69 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xaf83 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_af69(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$AF85(rel) "(  Load  )" */
  SoftKeyDefine();
  DAT_6038 = FUN_af85;
                    /* WARNING: Could not recover jumptable at 0xaf83. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_af85 @ af85 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xafc9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_af85(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Loading Program ..." */
  LcdPrintInline();
  uVar1 = (undefined1)((ushort)DAT_61a7 >> 8);
  if (DAT_61ab == '\0') {
    FUN_f730(uVar1);
    FUN_b00d();
    DAT_6079 = DAT_61ac;
    DAT_607d = DAT_61af;
    DAT_607a = DAT_61ad;
    API_FC66();
    if ((extraout_CC >> 2 & 1) == 0) {
                    /* inline[API_FC38]: "{1}rom preset missing" */
      LcdPrintInline();
      API_FC88();
      goto LAB_afc9;
    }
  }
  else {
    FUN_f730(uVar1);
    FUN_b026();
  }
  API_FDCE();
  if ((extraout_CC_00 >> 2 & 1) == 0) {
                    /* inline[API_FC38]: "{1}algorithm missing" */
    LcdPrintInline();
    API_FC88();
  }
LAB_afc9:
                    /* WARNING: Could not recover jumptable at 0xafc9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_b00d @ b00d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb024 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b00d(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  API_FD04(1,0x80,0,0x7c00);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xb024. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_4 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_b026 @ b026 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb03d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b026(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  FUN_c23f(1,0x80,0,0x7c00);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xb03d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_4 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_b03f @ b03f =====

void __h3000 FUN_b03f(void)

{
                    /* inline[API_FC8A]: ->$B04F(rel) "( Origin )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_b04f @ b04f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb09d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b04f(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_60c6;
  if (DAT_61a7 == &UNK_03e8) {
    uVar1 = CONCAT11(DAT_7c00,DAT_7c00);
  }
                    /* inline[API_FC38]: "{1}Original Program :" */
  LcdPrintInline((char)((ushort)uVar1 >> 8));
  RomFindRecord();
  if ((extraout_CC >> 2 & 1) == 0) {
                    /* inline[API_FC38]: "{1}No Original Program" */
    LcdPrintInline();
  }
  else {
    FUN_a147();
  }
  API_FE4A();
  API_FDC2();
                    /* WARNING: Could not recover jumptable at 0xb09d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1);
  return;
}


// ===== FUN_b0a6 @ b0a6 =====

void __h3000 FUN_b0a6(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect(param_1,DAT_61ac);
  if ((*(byte *)(DAT_61ad + 5) & 1) == 0) {
    BankPop();
  }
  else {
    BankPop();
                    /* inline[API_FC8A]: ->$B0D3(rel) "( Remove )" */
    SoftKeyDefine(extraout_A,DAT_60b9);
  }
                    /* WARNING: Could not recover jumptable at 0xb0d1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,in_stack_00000002);
  return;
}


// ===== FUN_b0d3 @ b0d3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb100 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b0d3(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Remove Preset " */
  LcdPrintInline();
  FUN_9df5((char)((ushort)DAT_61a7 >> 8));
  RomFindRecord();
  FUN_a147();
  API_FC2A();
                    /* inline[API_FE3C]: $B102 $B118 */
  API_FE3C();
                    /* WARNING: Could not recover jumptable at 0xb100. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_b102 @ b102 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb116 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b102(undefined2 param_1)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)DAT_61a7;
  FUN_9df5((char)((ushort)DAT_61a7 >> 8),uVar1,0x6a00);
  API_FDA8();
  API_FC64();
  API_FE34();
                    /* WARNING: Could not recover jumptable at 0xb116. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1);
  return;
}


// ===== FUN_b118 @ b118 =====

void __h3000 FUN_b118(void)

{
  API_FE34();
  return;
}


// ===== FUN_b11c @ b11c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb154 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b11c(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xa2;
  API_FC88();
  DAT_6036 = API_FDC4;
  DAT_605c = API_FDC4;
  DAT_6032 = API_FDC4;
  DAT_6034 = API_FDC4;
  DAT_602e = API_FDC6;
                    /* inline[API_FC38]: "{1}Current Edit :" */
  LcdPrintInline();
  FUN_9fc8();
  FUN_a108();
                    /* WARNING: Could not recover jumptable at 0xb154. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_b156 @ b156 =====

void __h3000 FUN_b156(void)

{
                    /* inline[API_FC8A]: ->$B166(rel) "(  Save  )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_b166 @ b166 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b166(void)

{
  undefined2 uVar1;
  undefined *puVar2;
  short sVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  
  uVar1 = FUN_a042();
  if (!(bool)(extraout_CC >> 2 & 1)) {
                    /* inline[API_FC38]: "{1}Memory Full" */
    LcdPrintInline();
    API_FE4A();
    uVar1 = API_FDC2();
    return uVar1;
  }
  if ((char)((DAT_6188 < &DAT_03e7) + (DAT_6188 == &DAT_03e7)) != '\0') {
    puVar2 = (undefined *)0x0;
    do {
      sVar3 = FUN_9dc0((char)((ushort)puVar2 >> 8));
      if ((extraout_CC_00 >> 2 & 1) == 0) {
        DAT_60c4 = 0;
        DAT_61b2 = sVar3;
        MemsetInline();
        DAT_600c = 0xa0;
        API_FDDC(0,0xf,10,&DAT_60c6);
        API_FDC8(0xb7);
        DAT_602e = API_FDCA;
        return uVar1;
      }
      puVar2 = (undefined *)(sVar3 + 1);
    } while (puVar2 != &UNK_03e8);
  }
  LcdPrintInline();
  API_FE4A();
  API_FDC2();
  return uVar1;
}


// ===== FUN_b203 @ b203 =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FUN_b203(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_b276 @ b276 =====

void __h3000 FUN_b276(void)

{
                    /* inline[API_FC8A]: ->$B286(rel) "(  Map   )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_b286 @ b286 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb2ab */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b286(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xa3;
  DAT_6036 = API_FDC4;
  DAT_61b1 = 200;
  DAT_6074 = 200;
  API_FDC8(0xb2);
  DAT_60b9 = 0;
  FUN_b3f7();
                    /* WARNING: Could not recover jumptable at 0xb2ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_b304 @ b304 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb368 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b304(undefined1 param_1,undefined1 param_2)

{
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6064 = &UNK_03e8;
  DAT_6056 = &UNK_03e8;
  DAT_6074 = DAT_61a7;
                    /* inline[API_FD18]: [$606C]=$03E7 [$606E]=$0000 [$60DE]=$0001 [$60DC]=$0001
                       [$60E0]=$0096 */
  StoreWordsInline();
                    /* inline[addr:C2B8]: [$6070]=default [$6072]=default [$606A]=->$B36A(rel)
                       [$605C]=->$B3B5(rel) [$605A]=->$B392(rel) */
  FUN_c2b8();
                    /* inline[API_FD1A]: [$6066]=$01 [$6067]=$20 [$6058]=$02 [$6068]=$04 [$6099]=$00
                       [$6069]=$03 */
  StoreBytesInline();
  API_FC1E();
  API_FC28();
  API_FC18();
  FUN_b45e();
                    /* WARNING: Could not recover jumptable at 0xb368. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000000 >> 8),param_2,in_stack_00000002,in_stack_00000004);
  return;
}


// ===== FUN_b36a @ b36a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb3e5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b36a(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined *puVar3;
  undefined *puVar4;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar2 = (undefined1)((ushort)in_D >> 8);
  puVar3 = (undefined *)FUN_9dc0((char)((ushort)DAT_6074 >> 8));
  uVar1 = DAT_6074;
  if (!(bool)(extraout_CC >> 2 & 1)) {
    *(char *)(param_3 + -1) = (char)DAT_6074;
    *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FC38]: "{2:28}{5:28}{2:13}{5:15}[{4:2000}{3:60AA}]" */
    LcdPrintInline();
    API_FDD4();
                    /* WARNING: Could not recover jumptable at 0xb390. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar2,(char)puVar3,param_1,param_2);
    return;
  }
  puVar4 = puVar3;
  if (puVar3 == &UNK_03e8) {
    puVar4 = (undefined *)((short)&VEC_RESET + 1);
  }
  DAT_6054 = puVar3;
  DAT_6062 = puVar3;
  DAT_61a7 = puVar3;
  FUN_b507((char)((ushort)puVar4 >> 8));
  FUN_b45e();
  FUN_9bbe();
  API_FE32();
                    /* WARNING: Could not recover jumptable at 0xb3e5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar2,(char)puVar4,param_1,param_2);
  return;
}


// ===== FUN_b392 @ b392 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb3e5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b392(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6054 = (undefined *)FUN_b39b((char)((ushort)DAT_6054 >> 8));
  puVar1 = DAT_6054;
  if (DAT_6054 == &UNK_03e8) {
    puVar1 = (undefined *)((short)&VEC_RESET + 1);
  }
  DAT_6062 = DAT_6054;
  DAT_61a7 = DAT_6054;
  FUN_b507((char)((ushort)puVar1 >> 8));
  FUN_b45e();
  FUN_9bbe();
  API_FE32();
                    /* WARNING: Could not recover jumptable at 0xb3e5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)puVar1,param_1,param_2);
  return;
}


// ===== FUN_b39b @ b39b =====

void __h3000 FUN_b39b(void)

{
  ushort uVar1;
  byte extraout_CC;
  
  uVar1 = FUN_9dc0();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    if ((bool)((uVar1 < DAT_61a7) + (uVar1 == DAT_61a7))) {
      uVar1 = FUN_af3f();
    }
    else {
      uVar1 = FUN_af1f();
    }
  }
  DAT_6074 = uVar1;
  API_FC1E();
  return;
}


// ===== FUN_b3b5 @ b3b5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb3e5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b3b5(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6054 = (undefined *)FUN_b39b((char)((ushort)DAT_6062 >> 8));
  puVar1 = DAT_6054;
  if (DAT_6054 == &UNK_03e8) {
    puVar1 = (undefined *)((short)&VEC_RESET + 1);
  }
  DAT_6062 = DAT_6054;
  DAT_61a7 = DAT_6054;
  FUN_b507((char)((ushort)puVar1 >> 8));
  FUN_b45e();
  FUN_9bbe();
  API_FE32();
                    /* WARNING: Could not recover jumptable at 0xb3e5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)puVar1,param_1,param_2);
  return;
}


// ===== FUN_b3e7 @ b3e7 =====

void __h3000 FUN_b3e7(void)

{
                    /* inline[API_FC8A]: ->$B3F7(rel) "( Number )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_b3f7 @ b3f7 =====

void __h3000 FUN_b3f7(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xa5;
  DAT_6036 = API_FDC4;
  API_FDF2();
  API_FE32();
  DAT_6074 = (ushort)DAT_61b1;
                    /* inline[API_FC16]: 01 01 02 32 01 00 03 00 $007F $0000 $0000 ->$000E ->$0023
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_b44a();
                    /* WARNING: Could not recover jumptable at 0xb431. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_b433 @ b433 =====

void __h3000 FUN_b433(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:0A}{3:60A0}{5:1B}" */
  LcdPrintInline();
  if (DAT_604d != '\0') {
    API_FDD4();
  }
                    /* WARNING: Could not recover jumptable at 0xb448. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_b44a @ b44a =====

void __h3000 FUN_b44a(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61b1 = (undefined1)DAT_6074;
  FUN_b45e();
  FUN_9bbe();
  API_FE32();
                    /* WARNING: Could not recover jumptable at 0xb45c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_b45e @ b45e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb4e6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b45e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  undefined1 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:00}MIDI Pgm #    Loads" */
  LcdPrintInline();
  *(undefined1 *)(param_3 + -1) = DAT_61b1;
  puVar3 = (undefined1 *)(param_3 + -2);
  *puVar3 = 0;
                    /* inline[API_FC38]: "{2:0A}{4:2000}{3:60AA}{2:13}" */
  LcdPrintInline();
  sVar1 = FUN_b4e8();
  if (sVar1 == 0xfff) {
                    /* inline[API_FC38]: " Nothing, Unpatched  " */
    LcdPrintInline();
    uVar2 = 0xfff;
  }
  else {
    uVar2 = FUN_9dc0();
    if ((extraout_CC >> 2 & 1) == 0) {
      puVar3[-1] = (char)uVar2;
      puVar3[-2] = (char)((ushort)uVar2 >> 8);
                    /* inline[API_FC38]: " Missing Program     {2:24}{4:2000}{3:60AA}" */
      LcdPrintInline();
    }
    else {
      FUN_9df5();
      RomFindRecord();
      if ((extraout_CC_00 >> 2 & 1) != 0) {
        FUN_a147();
      }
    }
  }
                    /* WARNING: Could not recover jumptable at 0xb4e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1);
  return;
}


// ===== FUN_b4e8 @ b4e8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb4f3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b4e8(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_b4f5(0,DAT_61b1,DAT_61b1);
                    /* WARNING: Could not recover jumptable at 0xb4f3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_b4f5 @ b4f5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb505 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b4f5(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  byte bVar1;
  byte bVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = (byte)param_3 >> 7;
  bVar2 = (char)((ushort)param_3 >> 8) << 1;
  sVar3 = CONCAT11(bVar2 | bVar1,(byte)param_3 << 1) + 0x180;
  API_FC7E((char)((ushort)sVar3 >> 8),(char)sVar3,sVar3);
                    /* WARNING: Could not recover jumptable at 0xb505. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar2 & 0xf | bVar1,(char)sVar3,param_3);
  return;
}


// ===== FUN_b507 @ b507 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb524 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b507(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  short sVar2;
  byte bVar3;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar3 = (byte)((ushort)in_D >> 8);
  bVar1 = (char)((ushort)param_2 >> 8) << 1;
  sVar2 = CONCAT11(bVar1 | (byte)param_2 >> 7,(byte)param_2 << 1) + 0x180;
  API_FC7E((char)((ushort)sVar2 >> 8),(char)sVar2,sVar2,sVar2);
  API_FC82(bVar3 & 0xf | bVar1 & 0xf0);
                    /* WARNING: Could not recover jumptable at 0xb524. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar3,(char)sVar2,param_1,param_2);
  return;
}


// ===== FUN_b526 @ b526 =====

void __h3000 FUN_b526(void)

{
                    /* inline[API_FC8A]: ->$B536(rel) "( Clear  )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_b536 @ b536 =====

void __h3000 FUN_b536(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDD4();
                    /* inline[API_FC38]: "{1}Clear the entire MIDI Map Table ?" */
  LcdPrintInline();
                    /* inline[API_FE3C]: $B56E $B56A */
  API_FE3C();
                    /* WARNING: Could not recover jumptable at 0xb568. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_b56a @ b56a =====

void __h3000 FUN_b56a(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE34();
  DAT_60b9 = 0;
  FUN_b3f7();
                    /* WARNING: Could not recover jumptable at 0xb58d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_b56e @ b56e =====

void __h3000 FUN_b56e(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect(param_1,0xa0);
                    /* inline[API_FD0C]: $0100 FF */
  MemsetInline();
  BankPop();
  API_FE34();
  DAT_60b9 = 0;
  FUN_b3f7();
                    /* WARNING: Could not recover jumptable at 0xb58d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,param_3,in_stack_00000002);
  return;
}


// ===== API_FE46 @ b58f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb5d3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE46(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  API_FD20(0);
  DAT_6116 = 0xff;
  FUN_b669();
  API_FC98();
  FUN_b693();
                    /* inline[API_FE24]: $68A0 */
  API_FE24((char)((ushort)DAT_0002 >> 8),(char)DAT_0002,0);
                    /* inline[API_FE28]: $68A0 */
  API_FE28(0xfd);
  FUN_b68a();
  uVar1 = API_FD20(0);
  uVar2 = (undefined1)uVar1;
  API_FC7C((char)((ushort)uVar1 >> 8),uVar2,&DAT_0296);
  DAT_6116 = uVar2;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xb5d3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_Y >> 8),uVar2,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== API_FE42 @ b5d5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb629 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE42(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  short *psVar3;
  undefined2 in_Y;
  short sVar4;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  FUN_8c50();
  DAT_6116 = 0xff;
  FUN_b669();
  API_FC98();
  FUN_b6a6();
  psVar3 = &DAT_0300;
  do {
    sVar4 = *psVar3;
                    /* inline[API_FE24]: $68A0 */
    API_FE24((char)((ushort)psVar3[1] >> 8));
  } while (sVar4 != -1);
  FUN_b68a();
  FUN_b669();
  API_FC98();
                    /* inline[API_FE28]: $68A0 */
  API_FE28(0xfc);
  FUN_b68a();
  uVar1 = API_FD20(0);
  uVar2 = (undefined1)uVar1;
  API_FC7C((char)((ushort)uVar1 >> 8),uVar2,&DAT_0296);
  DAT_6116 = uVar2;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xb629. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_Y >> 8),uVar2,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== API_FE44 @ b62b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb667 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE44(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  API_FD20(0);
  DAT_6116 = 0xff;
  FUN_b669();
  API_FC98();
  FUN_b693();
                    /* inline[API_FE24]: $68A0 */
  API_FE24(1,0,0x180);
  FUN_b68a();
  uVar1 = API_FD20(0);
  uVar2 = (undefined1)uVar1;
  API_FC7C((char)((ushort)uVar1 >> 8),uVar2,&DAT_0296);
  DAT_6116 = uVar2;
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xb667. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_Y >> 8),uVar2,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_b669 @ b669 =====

void __h3000 FUN_b669(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 extraout_A_03;
  undefined1 in_stack_00000003;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect(param_1,0xa0);
  API_FC98(extraout_A,0xf0);
  API_FC98(extraout_A_00,0x1c);
  API_FC98(extraout_A_01,0x60);
  API_FC98(extraout_A_02,DAT_0290);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xb688. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_03,in_stack_00000003);
  return;
}


// ===== FUN_b68a @ b68a =====

void __h3000 FUN_b68a(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC98(param_1,0xf7);
                    /* WARNING: Could not recover jumptable at 0xb691. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== FUN_b693 @ b693 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb6a4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b693(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_68ab = 0xa0;
                    /* inline[API_FE24]: $68A0 */
  API_FE24(0);
                    /* WARNING: Could not recover jumptable at 0xb6a4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_b6a6 @ b6a6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb6a4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b6a6(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_68cb = 0xa0;
  API_FE24(0);
                    /* WARNING: Could not recover jumptable at 0xb6a4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_b6ad @ b6ad =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b6ad(void)

{
  undefined2 in_D;
  undefined *puVar1;
  short sVar2;
  byte extraout_CC;
  
  if ((char)((DAT_6188 < &DAT_03e7) + (DAT_6188 == &DAT_03e7)) != '\0') {
    puVar1 = (undefined *)0x0;
    do {
      sVar2 = FUN_9dc0((char)((ushort)puVar1 >> 8));
      if ((extraout_CC >> 2 & 1) == 0) {
        DAT_60c4 = 0;
        DAT_61b2 = sVar2;
                    /* inline[API_FD0C]: $0014 20 */
        MemsetInline();
        DAT_600c = 0xa0;
        API_FDDC(0,0xf,10,&DAT_60c6);
        API_FDC8(0xb7);
        DAT_602e = API_FDCA;
        return in_D;
      }
      puVar1 = (undefined *)(sVar2 + 1);
    } while (puVar1 != &UNK_03e8);
  }
                    /* inline[API_FC38]: "{1}No more ID numbers available" */
  LcdPrintInline();
  API_FE4A();
  API_FDC2();
  return in_D;
}


// ===== API_FE66 @ b82a =====

void __h3000 API_FE66(void)

{
  API_FDB0();
  return;
}


// ===== API_FE64 @ b82e =====

void __h3000 API_FE64(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61b5 = 0;
  DAT_61b4 = DAT_60c6._0_1_;
  DAT_60c1 = 2;
  DAT_61b6 = param_1;
  DAT_61b7 = param_2;
  API_FDB2();
                    /* inline[API_FC8A]: ->$B8F8(rel) "(  .---  )" */
  SoftKeyDefine(extraout_A,1);
                    /* inline[API_FC8A]: ->$B90C(rel) "(  ---~  )" */
  SoftKeyDefine(extraout_A_00,2);
  FUN_b86f();
                    /* WARNING: Could not recover jumptable at 0xb86d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_b86f @ b86f =====

undefined2 __h3000 FUN_b86f(void)

{
  undefined2 in_D;
  byte bVar1;
  
  bVar1 = FUN_b8c8();
  DAT_6074 = (ushort)bVar1;
                    /* inline[API_FC16]: 01 10 02 4B 02 00 06 00 $00BC $0000 $0000 ->$0000 ->$0011
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_b8db();
  FUN_b8ee();
  return in_D;
}


// ===== FUN_b8ab @ b8ab =====

undefined2 __h3000 FUN_b8ab(void)

{
  undefined2 in_D;
  
  DAT_61b4 = (&DAT_b9f8)[DAT_6074];
  *(undefined1 *)((short)&DAT_60c6 + (short)DAT_61b5) = DAT_61b4;
  FUN_b8db();
  FUN_b8ee();
  return in_D;
}


// ===== FUN_b8c8 @ b8c8 =====

char __h3000 FUN_b8c8(void)

{
  char cVar1;
  
  cVar1 = -8;
  API_FD0E();
  return cVar1 + '\b';
}


// ===== FUN_b8db @ b8db =====

void __h3000 FUN_b8db(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor(param_1,DAT_61b6,&DAT_60c6);
  API_FC3A(extraout_A,DAT_61b7);
                    /* WARNING: Could not recover jumptable at 0xb8ec. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_b8ee @ b8ee =====

void __h3000 FUN_b8ee(undefined1 param_1)

{
  API_FDB8(param_1,DAT_61b6 + DAT_61b5);
  return;
}


// ===== FUN_b8f8 @ b8f8 =====

undefined2 __h3000 FUN_b8f8(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_61b5 != '\0') {
    DAT_61b5 = DAT_61b5 + -1;
  }
  FUN_b86f();
  FUN_b8ee();
  return uStack_2;
}


// ===== FUN_b90c @ b90c =====

undefined2 __h3000 FUN_b90c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if ((char)(DAT_61b7 + -1) != DAT_61b5) {
    DAT_61b5 = DAT_61b5 + '\x01';
  }
  FUN_b86f();
  FUN_b8ee();
  return uStack_2;
}


// ===== FUN_b927 @ b927 =====

undefined1 __h3000 FUN_b927(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B94B(rel) "(Save It )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_b93e @ b93e =====

void __h3000 FUN_b93e(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_b927();
  API_FE64(0xe,0xf);
                    /* WARNING: Could not recover jumptable at 0xb949. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_b94b @ b94b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b94b(void)

{
  undefined2 in_D;
  
  API_FE66();
                    /* inline[API_FC38]: "{1}Saving Program ... " */
  LcdPrintInline();
  DAT_61a7 = DAT_61b2;
  FUN_9df5();
  API_FC82();
  FUN_a7d2(0,0xf,&DAT_60c6,10);
  FUN_9f48();
  API_FC64();
  API_FDCA();
  return in_D;
}


// ===== FUN_b991 @ b991 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b991(void)

{
  undefined1 extraout_A;
  undefined2 in_D;
  
  DAT_60d9 = (undefined1)DAT_61b2;
  DAT_60d8 = (undefined1)((ushort)DAT_61b2 >> 8);
                    /* inline[API_FC38]: "{2:09}{4:2000}{3:60AA}{2:0E}" */
  LcdPrintInline();
  API_FC3A(extraout_A,0xf,&DAT_60c6);
  return in_D;
}


// ===== FUN_b9b4 @ b9b4 =====

void __h3000 FUN_b9b4(void)

{
  undefined2 in_D;
  undefined1 *puVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  puVar1 = (undefined1 *)FUN_b9f4();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (puVar1 != &DAT_03e7) {
      do {
        puVar1 = (undefined1 *)FUN_b9f4((char)((ushort)(puVar1 + 1) >> 8));
        if ((extraout_CC_00 >> 2 & 1) == 0) {
          return;
        }
      } while (puVar1 < &DAT_03e7);
    }
    FUN_b9d4((char)((ushort)in_D >> 8));
  }
  return;
}


// ===== FUN_b9d4 @ b9d4 =====

void __h3000 FUN_b9d4(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  
  sVar1 = FUN_b9f4();
  bVar2 = extraout_CC;
  while( true ) {
    if ((bVar2 >> 2 & 1) == 0) {
      return;
    }
    if (sVar1 == 0) break;
    sVar1 = FUN_b9f4((char)((ushort)(sVar1 + -1) >> 8));
    bVar2 = extraout_CC_00;
  }
  FUN_b9b4((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_b9f4 @ b9f4 =====

void __h3000 FUN_b9f4(void)

{
  FUN_9dc0();
  return;
}


// ===== API_FCA4 @ bab5 =====

void __h3000 API_FCA4(void)

{
                    /* inline[API_FD18]: [$608F]=$FFE8 [$6091]=$FFE8 [$6093]=$FFE8 [$6095]=$FFE8
                       [$6097]=$FFE8 */
  StoreWordsInline();
  DAT_61bb = 0;
  DAT_61be = 0;
  DAT_61c1 = 0;
  DAT_61c4 = 0;
  DAT_61c7 = 0;
  DAT_61ca = 0;
  DAT_61cd = 0;
  DAT_61d0 = 0;
  DAT_61d3 = 0;
  DAT_61d6 = 0;
  return;
}


// ===== API_FCA6 @ baed =====

undefined2 __h3000 API_FCA6(void)

{
  byte bVar1;
  undefined1 uVar2;
  ushort uVar3;
  ushort uVar4;
  ushort uVar5;
  ushort uVar6;
  undefined1 extraout_B;
  ushort uVar7;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined2 in_stack_00000000;
  ushort uStack_6;
  undefined1 extraout_B_00;
  
  BankPushSelect();
  bVar1 = DAT_61b8;
  uVar3 = (ushort)DAT_61b8;
  DAT_61b8 = 0;
  uStack_6 = (ushort)bVar1;
  if ((DAT_61bb != '\0') &&
     (uVar3 = DAT_61b9 - uStack_6, uStack_6 <= DAT_61b9 || (short)DAT_61b9 < (short)uStack_6)) {
    DAT_61bb = '\0';
  }
  uVar4 = uVar3;
  if ((DAT_61be != '\0') &&
     (uVar4 = DAT_61bc - uStack_6, uStack_6 <= DAT_61bc || (short)DAT_61bc < (short)uStack_6)) {
    DAT_61be = '\0';
  }
  uVar5 = uVar4;
  if ((DAT_61c1 != '\0') &&
     (uVar5 = DAT_61bf - uStack_6, uStack_6 <= DAT_61bf || (short)DAT_61bf < (short)uStack_6)) {
    DAT_61c1 = '\0';
  }
  uVar6 = uVar5;
  if ((DAT_61c4 != '\0') &&
     (uVar6 = DAT_61c2 - uStack_6, uStack_6 <= DAT_61c2 || (short)DAT_61c2 < (short)uStack_6)) {
    DAT_61c4 = '\0';
  }
  uVar7 = uVar6;
  if ((DAT_61c7 != '\0') &&
     (uVar7 = DAT_61c5 - uStack_6, uStack_6 <= DAT_61c5 || (short)DAT_61c5 < (short)uStack_6)) {
    DAT_61c7 = '\0';
  }
  DAT_61b9 = uVar3;
  DAT_61bc = uVar4;
  DAT_61bf = uVar5;
  DAT_61c2 = uVar6;
  DAT_61c5 = uVar7;
  uVar3 = uVar7;
  if ((DAT_61ca != '\0') &&
     (uVar7 = DAT_61c8 - uStack_6, uVar3 = uVar7,
     uStack_6 <= DAT_61c8 || (short)DAT_61c8 < (short)uStack_6)) {
    DAT_61ca = '\0';
    uVar2 = (*DAT_608f)();
    uVar7 = CONCAT11(uVar2,extraout_B);
    uVar3 = DAT_61c8;
  }
  DAT_61c8 = uVar3;
  uVar3 = uVar7;
  if ((DAT_61cd != '\0') &&
     (uVar7 = DAT_61cb - uStack_6, uVar3 = uVar7,
     uStack_6 <= DAT_61cb || (short)DAT_61cb < (short)uStack_6)) {
    DAT_61cd = '\0';
    uVar2 = (*DAT_6091)();
    uVar7 = CONCAT11(uVar2,extraout_B_00);
    uVar3 = DAT_61cb;
  }
  DAT_61cb = uVar3;
  uVar3 = uVar7;
  if ((DAT_61d0 != '\0') &&
     (uVar7 = DAT_61ce - uStack_6, uVar3 = uVar7,
     uStack_6 <= DAT_61ce || (short)DAT_61ce < (short)uStack_6)) {
    DAT_61d0 = '\0';
    uVar2 = (*DAT_6093)();
    uVar7 = CONCAT11(uVar2,extraout_B_01);
    uVar3 = DAT_61ce;
  }
  DAT_61ce = uVar3;
  uVar3 = uVar7;
  if ((DAT_61d3 != '\0') &&
     (uVar7 = DAT_61d1 - uStack_6, uVar3 = uVar7,
     uStack_6 <= DAT_61d1 || (short)DAT_61d1 < (short)uStack_6)) {
    DAT_61d3 = '\0';
    uVar2 = (*DAT_6095)();
    uVar7 = CONCAT11(uVar2,extraout_B_02);
    uVar3 = DAT_61d1;
  }
  DAT_61d1 = uVar3;
  if ((DAT_61d6 != '\0') &&
     (uVar7 = DAT_61d4 - uStack_6, uStack_6 <= DAT_61d4 || (short)DAT_61d4 < (short)uStack_6)) {
    DAT_61d6 = '\0';
    (*DAT_6097)();
    uVar7 = DAT_61d4;
  }
  DAT_61d4 = uVar7;
  DAT_61fe = DAT_61fe + uStack_6;
  BankPop(0);
  return in_stack_00000000;
}


// ===== API_FCA8 @ bbe1 =====

void __h3000 API_FCA8(void)

{
  undefined2 in_D;
  
  DAT_61b9 = in_D;
  DAT_61bb = 1;
  return;
}


// ===== API_FCAA @ bbeb =====

void __h3000 API_FCAA(void)

{
  API_FCA6();
  return;
}


// ===== API_FCAC @ bbf2 =====

void __h3000 API_FCAC(void)

{
  undefined2 in_D;
  
  DAT_61bc = in_D;
  DAT_61be = 1;
  return;
}


// ===== API_FCAE @ bbfc =====

void __h3000 API_FCAE(void)

{
  API_FCA6();
  return;
}


// ===== API_FCB0 @ bc03 =====

void __h3000 API_FCB0(void)

{
  undefined2 in_D;
  
  DAT_61bf = in_D;
  DAT_61c1 = 1;
  return;
}


// ===== API_FCB2 @ bc0d =====

void __h3000 API_FCB2(void)

{
  API_FCA6();
  return;
}


// ===== API_FCB4 @ bc14 =====

void __h3000 API_FCB4(void)

{
  undefined2 in_D;
  
  DAT_61c2 = in_D;
  DAT_61c4 = 1;
  return;
}


// ===== API_FCB6 @ bc1e =====

void __h3000 API_FCB6(void)

{
  API_FCA6();
  return;
}


// ===== API_FCB8 @ bc25 =====

void __h3000 API_FCB8(void)

{
  undefined2 in_D;
  
  DAT_61c5 = in_D;
  DAT_61c7 = 1;
  return;
}


// ===== API_FCBA @ bc2f =====

void __h3000 API_FCBA(void)

{
  API_FCA6();
  return;
}


// ===== API_FCBC @ bc36 =====

void __h3000 API_FCBC(void)

{
  undefined2 in_D;
  
  DAT_61c8 = in_D;
  DAT_61ca = 1;
  return;
}


// ===== API_FCBE @ bc40 =====

void __h3000 API_FCBE(void)

{
  undefined2 in_D;
  
  DAT_61cb = in_D;
  DAT_61cd = 1;
  return;
}


// ===== API_FCC0 @ bc4a =====

void __h3000 API_FCC0(void)

{
  undefined2 in_D;
  
  DAT_61ce = in_D;
  DAT_61d0 = 1;
  return;
}


// ===== API_FCC2 @ bc54 =====

void __h3000 API_FCC2(void)

{
  undefined2 in_D;
  
  DAT_61d1 = in_D;
  DAT_61d3 = 1;
  return;
}


// ===== API_FCC4 @ bc5e =====

void __h3000 API_FCC4(void)

{
  undefined2 in_D;
  
  DAT_61d4 = in_D;
  DAT_61d6 = 1;
  return;
}


// ===== API_FCC8 @ bc68 =====

undefined2 __h3000 API_FCC8(void)

{
  undefined2 in_D;
  short *in_U;
  
  if (*(char *)in_U < '\0') {
    *in_U = -*in_U;
  }
  return in_D;
}


// ===== API_FCCA @ bc79 =====

undefined2 __h3000 API_FCCA(void)

{
  undefined2 in_D;
  short *in_U;
  
  *in_U = *in_U + 1;
  return in_D;
}


// ===== API_FCCC @ bc85 =====

undefined2 __h3000 API_FCCC(void)

{
  undefined2 in_D;
  short *in_U;
  
  *in_U = *in_U + -1;
  return in_D;
}


// ===== API_FCCE @ bc91 =====

undefined2 __h3000
API_FCCE(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  param_5[2] = *param_5 ^ param_5[2];
  param_5[3] = param_5[1] ^ param_5[3];
  return uStack_2;
}


// ===== API_FCD0 @ bca0 =====

undefined2 __h3000
API_FCD0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  param_5[2] = *param_5 & param_5[2];
  param_5[3] = param_5[1] & param_5[3];
  return uStack_2;
}


// ===== API_FCD2 @ bcaf =====

undefined2 __h3000
API_FCD2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  param_5[2] = *param_5 | param_5[2];
  param_5[3] = param_5[1] | param_5[3];
  return uStack_2;
}


// ===== API_FCD4 @ bcbe =====

void __h3000 API_FCD4(void)

{
  short *in_U;
  
  if (*in_U < in_U[1]) {
    in_U[1] = *in_U;
  }
  return;
}


// ===== API_FCD6 @ bccb =====

void __h3000 API_FCD6(void)

{
  short *in_U;
  
  if (in_U[1] < *in_U) {
    in_U[1] = *in_U;
  }
  return;
}


// ===== API_FCD8 @ bcd8 =====

void __h3000 API_FCD8(void)

{
  short *in_U;
  short *psVar1;
  
  psVar1 = in_U + 1;
  if (*in_U < *psVar1) {
    *psVar1 = *in_U;
  }
  if (in_U[2] < *psVar1) {
    in_U[2] = *psVar1;
  }
  return;
}


// ===== API_FCDA @ bced =====

void __h3000 API_FCDA(void)

{
  ushort uVar1;
  ushort uVar2;
  ushort *in_U;
  ushort *puVar3;
  
  puVar3 = in_U + 1;
  if (*in_U < *puVar3) {
    *puVar3 = *in_U;
  }
  uVar2 = *puVar3;
  uVar1 = in_U[2];
  if (!(bool)((uVar2 < uVar1) + (uVar2 == uVar1))) {
    in_U[2] = uVar2;
  }
  return;
}


// ===== API_FCDC @ bd02 =====

undefined2 __h3000 API_FCDC(void)

{
  byte bVar1;
  byte bVar2;
  undefined2 in_D;
  ushort uVar3;
  byte bVar4;
  short sVar5;
  short *in_U;
  
  sVar5 = *in_U;
  if (sVar5 != 0) {
    if (sVar5 < 0) {
      uVar3 = (ushort)(-(char)sVar5 & 0xf);
      bVar4 = *(byte *)((short)in_U + 3);
      bVar2 = *(byte *)(in_U + 1);
      do {
        bVar1 = (char)bVar2 >> 1;
        bVar4 = (char)bVar4 >> 1 | bVar2 << 7;
        uVar3 = uVar3 - 1;
        bVar2 = bVar1;
      } while (uVar3 != 0);
      *(byte *)((short)in_U + 3) = bVar4;
      *(byte *)(in_U + 1) = bVar1;
    }
    else {
      bVar2 = *(byte *)(in_U + 1);
      bVar4 = *(byte *)((short)in_U + 3);
      do {
        bVar1 = bVar4 >> 7;
        bVar4 = bVar4 << 1;
        if ((bool)(bVar2 >> 7)) {
          bVar2 = bVar2 << 1 | bVar1 | 0x80;
        }
        else {
          bVar2 = bVar2 << 1 & 0x7f | bVar1;
        }
        sVar5 = sVar5 + -1;
      } while (sVar5 != 0);
      *(byte *)((short)in_U + 3) = bVar4;
      *(byte *)(in_U + 1) = bVar2;
    }
  }
  return in_D;
}


// ===== API_FCDE @ bd33 =====

undefined2 __h3000 API_FCDE(void)

{
  byte bVar1;
  byte bVar2;
  undefined2 in_D;
  ushort uVar3;
  byte bVar4;
  short sVar5;
  short *in_U;
  
  sVar5 = *in_U;
  if (sVar5 != 0) {
    if (sVar5 < 0) {
      uVar3 = (ushort)(-(char)sVar5 & 0xf);
      bVar4 = *(byte *)((short)in_U + 3);
      bVar2 = *(byte *)(in_U + 1);
      do {
        bVar1 = bVar2 >> 1;
        bVar4 = (char)bVar4 >> 1 | bVar2 << 7;
        uVar3 = uVar3 - 1;
        bVar2 = bVar1;
      } while (uVar3 != 0);
      *(byte *)((short)in_U + 3) = bVar4;
      *(byte *)(in_U + 1) = bVar1;
    }
    else {
      bVar2 = *(byte *)(in_U + 1);
      bVar4 = *(byte *)((short)in_U + 3);
      do {
        bVar1 = bVar4 >> 7;
        bVar4 = bVar4 << 1;
        bVar2 = bVar2 << 1 | bVar1;
        sVar5 = sVar5 + -1;
      } while (sVar5 != 0);
      *(byte *)((short)in_U + 3) = bVar4;
      *(byte *)(in_U + 1) = bVar2;
    }
  }
  return in_D;
}


// ===== API_FCE0 @ bd5c =====

undefined2 __h3000 API_FCE0(void)

{
  undefined2 in_D;
  short *in_U;
  
  *in_U = -*in_U;
  return in_D;
}


// ===== API_FCE2 @ bd67 =====

undefined2 __h3000 API_FCE2(void)

{
  undefined2 in_D;
  short *in_U;
  
  in_U[1] = *in_U + in_U[1];
  return in_D;
}


// ===== API_FCE4 @ bd72 =====

undefined2 __h3000 API_FCE4(void)

{
  undefined2 in_D;
  short *in_U;
  
  in_U[1] = in_U[1] - *in_U;
  return in_D;
}


// ===== API_FCE6 @ bd7f =====

void __h3000 API_FCE6(void)

{
  FUN_bd8f();
  return;
}


// ===== API_FCE8 @ bd84 =====

undefined2 __h3000 API_FCE8(void)

{
  undefined2 in_D;
  undefined2 *in_U;
  
  FUN_bd8f();
  in_U[1] = *in_U;
  return in_D;
}


// ===== FUN_bd8f @ bd8f =====

void __h3000 FUN_bd8f(void)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  ushort uVar4;
  ushort uVar5;
  byte extraout_CC;
  byte extraout_CC_00;
  bool bVar6;
  short sVar7;
  ushort *in_U;
  ushort *puVar8;
  
  DAT_61db = 0;
  API_FCC8();
  if ((extraout_CC >> 3 & 1) != 0) {
    DAT_61db = ~DAT_61db;
  }
  DAT_61d7 = *in_U;
  in_U = in_U + 1;
  API_FCC8();
  if ((extraout_CC_00 >> 3 & 1) != 0) {
    DAT_61db = ~DAT_61db;
  }
  DAT_61d9 = *in_U;
  uVar4 = 0;
  sVar7 = 0x10;
  bVar6 = false;
  do {
    bVar3 = (byte)DAT_61d9;
    bVar1 = (byte)DAT_61d9 >> 7;
    DAT_61d9._1_1_ = (byte)DAT_61d9 << 1 | bVar6;
    bVar2 = DAT_61d9._0_1_ >> 7;
    DAT_61d9._0_1_ = DAT_61d9._0_1_ << 1 | bVar1;
    uVar5 = CONCAT11((char)(uVar4 >> 8) << 1 | (byte)uVar4 >> 7,(byte)uVar4 << 1 | bVar2);
    uVar4 = uVar5;
    if (DAT_61d7 <= uVar5) {
      uVar4 = uVar5 - DAT_61d7;
    }
    bVar6 = uVar5 < DAT_61d7;
    sVar7 = sVar7 + -1;
  } while (sVar7 != 0);
  bVar1 = DAT_61d9._0_1_ << 1;
  *(byte *)((short)in_U + 1) = ~((byte)DAT_61d9 << 1 | bVar6);
  *(byte *)in_U = ~(bVar1 | (bVar3 & 0x7f) >> 6);
  puVar8 = in_U + -1;
  *puVar8 = uVar4;
  if ((char)DAT_61db < '\0') {
    *puVar8 = -*puVar8;
    *in_U = -*in_U;
  }
  return;
}


// ===== API_FCEA @ bde5 =====

undefined2 __h3000 API_FCEA(void)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  undefined2 in_D;
  ushort uVar4;
  ushort uVar5;
  bool bVar6;
  short sVar7;
  ushort *in_U;
  
  DAT_61d7 = *in_U;
  DAT_61d9 = in_U[1];
  uVar4 = 0;
  sVar7 = 0x10;
  bVar6 = false;
  do {
    bVar3 = (byte)DAT_61d9;
    bVar1 = (byte)DAT_61d9 >> 7;
    DAT_61d9._1_1_ = (byte)DAT_61d9 << 1 | bVar6;
    bVar2 = DAT_61d9._0_1_ >> 7;
    DAT_61d9._0_1_ = DAT_61d9._0_1_ << 1 | bVar1;
    uVar5 = CONCAT11((char)(uVar4 >> 8) << 1 | (byte)uVar4 >> 7,(byte)uVar4 << 1 | bVar2);
    uVar4 = uVar5;
    if (DAT_61d7 <= uVar5) {
      uVar4 = uVar5 - DAT_61d7;
    }
    bVar6 = uVar5 < DAT_61d7;
    sVar7 = sVar7 + -1;
  } while (sVar7 != 0);
  bVar1 = (byte)DAT_61d9 << 1;
  bVar2 = DAT_61d9._0_1_ << 1;
  in_U[1] = uVar4;
  *(byte *)((short)in_U + 1) = ~(bVar1 | bVar6);
  *(byte *)in_U = ~(bVar2 | (bVar3 & 0x7f) >> 6);
  return in_D;
}


// ===== API_FCEC @ be1b =====

void __h3000 API_FCEC(void)

{
  API_FDE4();
  return;
}


// ===== API_FCEE @ be21 =====

void __h3000 API_FCEE(void)

{
  API_FCF0();
  return;
}


// ===== API_FCF0 @ be26 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 API_FCF0(void)

{
  ushort uVar1;
  undefined2 in_D;
  ushort uVar2;
  byte *in_U;
  
  uVar2 = (ushort)in_U[1] * (ushort)in_U[3];
  _DAT_61d7 = (uint)uVar2;
  uVar1 = (ushort)*in_U * (ushort)in_U[3] + (uVar2 >> 8);
  if (CARRY2((ushort)*in_U * (ushort)in_U[3],uVar2 >> 8)) {
    RAM0x61d8 = (uint3)uVar2;
    _DAT_61d7 = CONCAT13(1,RAM0x61d8);
  }
  if (CARRY2((ushort)in_U[1] * (ushort)in_U[2],uVar1)) {
    DAT_61d7._0_1_ = DAT_61d7._0_1_ + '\x01';
  }
  RAM0x61d8 = CONCAT21((ushort)in_U[1] * (ushort)in_U[2] + uVar1,(undefined1)DAT_61d9);
  *(ushort *)in_U = (ushort)*in_U * (ushort)in_U[2] + DAT_61d7;
  *(undefined2 *)(in_U + 2) = DAT_61d9;
  return in_D;
}


// ===== API_FCF2 @ be6b =====

undefined2 __h3000 API_FCF2(void)

{
  ushort uVar1;
  undefined2 in_D;
  short sVar2;
  short *in_U;
  
  API_FDE4();
  DAT_61d7 = *in_U;
  sVar2 = DAT_61d7;
  if (*(char *)in_U < '\0') {
    if (0x7fff < (ushort)in_U[1]) {
      sVar2 = DAT_61d7 + -1;
    }
  }
  else {
    uVar1 = in_U[1];
    if (uVar1 < 0x4000 == (uVar1 == 0x4000)) {
      sVar2 = DAT_61d7 + 1;
    }
  }
  *(char *)((short)in_U + 3) = (char)sVar2;
  *(char *)(in_U + 1) = (char)((ushort)sVar2 >> 8);
  return in_D;
}


// ===== API_FDE4 @ be9e =====

void __h3000 API_FDE4(void)

{
  ushort *puVar1;
  ushort uVar2;
  byte bVar3;
  ushort uVar4;
  byte bVar5;
  byte extraout_CC;
  byte extraout_CC_00;
  ushort *in_U;
  
  DAT_61db = 0;
  API_FCC8();
  if ((extraout_CC >> 3 & 1) != 0) {
    DAT_61db = ~DAT_61db;
  }
  DAT_61d7 = *in_U;
  in_U = in_U + 1;
  API_FCC8();
  if ((extraout_CC_00 >> 3 & 1) != 0) {
    DAT_61db = ~DAT_61db;
  }
  DAT_61d9 = *in_U;
  puVar1 = in_U + -1;
  *(byte *)puVar1 = 0;
  *(undefined1 *)((short)in_U + -1) = 0;
  *in_U = (DAT_61d7 & 0xff) * (DAT_61d9 & 0xff);
  uVar4 = (DAT_61d7 >> 8) * (DAT_61d9 & 0xff);
  uVar2 = *(ushort *)((short)in_U + -1);
  *(ushort *)((short)in_U + -1) = uVar4 + uVar2;
  if (CARRY2(uVar4,uVar2)) {
    *(byte *)puVar1 = *(byte *)puVar1 + 1;
  }
  uVar4 = (DAT_61d7 & 0xff) * (DAT_61d9 >> 8);
  uVar2 = *(ushort *)((short)in_U + -1);
  *(ushort *)((short)in_U + -1) = uVar4 + uVar2;
  if (CARRY2(uVar4,uVar2)) {
    *(byte *)puVar1 = *(byte *)puVar1 + 1;
  }
  *puVar1 = (DAT_61d7 >> 8) * (DAT_61d9 >> 8) + *puVar1;
  bVar5 = (byte)*(undefined2 *)((short)in_U + -1);
  bVar3 = (byte)((ushort)*(undefined2 *)((short)in_U + -1) >> 8);
  *(byte *)puVar1 = *(byte *)puVar1 << 1 | bVar3 >> 7;
  *(byte *)((short)in_U + -1) = bVar3 << 1 | bVar5 >> 7;
  *(byte *)in_U = bVar5 & 0x7f;
  if ((char)DAT_61db < '\0') {
    *in_U = -*in_U;
    *puVar1 = -*puVar1;
  }
  return;
}


// ===== API_FCF4 @ bf12 =====

undefined2 __h3000 API_FCF4(void)

{
  byte bVar1;
  undefined2 in_D;
  ushort uVar2;
  ushort uVar3;
  byte extraout_CC;
  short sVar4;
  short in_U;
  ushort *puVar5;
  
  DAT_61db = 0;
  puVar5 = (ushort *)(in_U + 2);
  sVar4 = *(byte *)(in_U + 1) + 0x10;
  API_FCC8();
  if ((extraout_CC >> 3 & 1) != 0) {
    DAT_61db = ~DAT_61db;
  }
  DAT_61d7 = *puVar5;
  uVar3 = 0;
  do {
    uVar2 = uVar3;
    if (DAT_61d7 <= uVar3) {
      uVar2 = uVar3 - DAT_61d7;
    }
    bVar1 = (byte)DAT_61d9 >> 7;
    DAT_61d9._1_1_ = (byte)DAT_61d9 << 1 | uVar3 < DAT_61d7;
    DAT_61d9._0_1_ = DAT_61d9._0_1_ << 1 | bVar1;
    uVar3 = CONCAT11((char)(uVar2 >> 8) << 1 | (byte)uVar2 >> 7,(byte)uVar2 << 1) | 1;
    sVar4 = sVar4 + -1;
  } while (sVar4 != 0);
  uVar3 = CONCAT11(~DAT_61d9._0_1_,~(byte)DAT_61d9) & 0x7fff;
  if (DAT_61db != 0) {
    uVar3 = CONCAT11(~(byte)(uVar3 >> 8),~(byte)uVar3) + 1;
  }
  *(char *)((short)puVar5 + 1) = (char)uVar3;
  *(char *)puVar5 = (char)(uVar3 >> 8);
  return in_D;
}


// ===== API_FCF6 @ bf59 =====

void __h3000 API_FCF6(void)

{
  byte bVar1;
  byte bVar2;
  
  bVar1 = DAT_61dc._0_1_ >> 7;
  DAT_61dc._0_1_ = DAT_61dc._0_1_ << 1 | (DAT_61de >> 3 ^ DAT_61de) & 1;
  bVar2 = (byte)DAT_61dc >> 7;
  DAT_61dc._1_1_ = (byte)DAT_61dc << 1 | bVar1;
  DAT_61de = DAT_61de << 1 | bVar2;
  return;
}


// ===== API_FCF8 @ bf71 =====

undefined2 __h3000 API_FCF8(void)

{
  char cVar1;
  char cVar2;
  undefined2 in_D;
  ushort uVar3;
  short sVar4;
  byte bVar6;
  ushort uVar5;
  ushort *in_U;
  ushort *puVar7;
  
  cVar1 = '\0';
  puVar7 = in_U + 1;
  uVar3 = *in_U;
  uVar5 = DAT_61dc;
  if (uVar3 != 0) {
    if ((short)uVar3 < 0) {
      uVar3 = CONCAT11(~(byte)(uVar3 >> 8),~(byte)uVar3) + 1;
      cVar1 = -1;
    }
    if (uVar3 == 1) {
      uVar5 = DAT_61dc >> 8 & 1;
    }
    else {
      if (uVar3 < 0x7fff) {
        uVar3 = uVar3 + 1;
      }
      cVar2 = (char)(uVar3 >> 8);
      if (cVar2 == '\0') {
        sVar4 = (DAT_61dc & 0xff) * (uVar3 & 0xff);
        bVar6 = (byte)((ushort)sVar4 >> 8);
        if (0x7f < (byte)sVar4) {
          bVar6 = bVar6 + 1;
        }
        uVar5 = (ushort)bVar6;
      }
      else {
        *(char *)((short)in_U + 1) = (char)uVar3;
        *(char *)in_U = cVar2;
        uVar3 = DAT_61dc & 0x7fff;
        *(char *)((short)in_U + -1) = (char)uVar3;
        in_U = in_U + -1;
        *(char *)in_U = (char)(uVar3 >> 8);
        API_FDE4();
        puVar7 = in_U + 2;
        uVar5 = *in_U;
      }
    }
  }
  if (cVar1 != '\0') {
    uVar5 = CONCAT11(~(byte)(uVar5 >> 8),~(byte)uVar5) + 1;
  }
  *(char *)((short)puVar7 + -1) = (char)uVar5;
  *(char *)(puVar7 + -1) = (char)(uVar5 >> 8);
  API_FCF6();
  return in_D;
}


// ===== API_FCFA @ bfd0 =====

void __h3000 API_FCFA(void)

{
  short sVar1;
  short *in_U;
  
  sVar1 = *in_U;
  if (sVar1 == 0) {
    sVar1 = 1;
  }
  *in_U = sVar1 + -0x8000;
  return;
}


// ===== API_FCFC @ bfdd =====

undefined2 __h3000 API_FCFC(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *in_U;
  
  uVar1 = in_U[1];
  in_U[1] = *in_U;
  *in_U = uVar1;
  return in_D;
}


// ===== API_FCC6 @ bfea =====

undefined2 __h3000 API_FCC6(void)

{
  undefined2 in_D;
  undefined2 *in_U;
  
  *(char *)((short)in_U + -1) = (char)*in_U;
  *(char *)(in_U + -1) = (char)((ushort)*in_U >> 8);
  return in_D;
}


// ===== InterpTableLookup @ bff3 =====

/* Kernel API slot $FE20: inline n + 2^n+1 point table */

undefined2 __h3000 InterpTableLookup(void)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  undefined2 in_D;
  byte bVar4;
  short *psVar6;
  ushort *in_U;
  char *local_res0;
  char local_b;
  byte local_8;
  byte bStack_7;
  byte bVar5;
  
  local_b = *local_res0;
  FUN_c043();
  bStack_7 = 0;
  local_8 = 0;
  bVar5 = (byte)(*in_U & 0x7fff);
  bVar4 = bVar5 << 1;
  bVar2 = (char)((*in_U & 0x7fff) >> 8) << 1 | bVar5 >> 7;
  bVar5 = bStack_7;
  do {
    bStack_7 = bVar5;
    bVar3 = bVar2;
    bVar1 = bVar4 >> 7;
    bVar4 = bVar4 << 1;
    bVar5 = bStack_7 << 1 | bVar3 >> 7;
    local_8 = local_8 << 1 | bStack_7 >> 7;
    local_b = local_b + -1;
    bVar2 = bVar3 << 1 | bVar1;
  } while (local_b != '\0');
  *in_U = CONCAT11(bVar3,(char)bVar4 >> 1 | bVar1 << 7) & 0x7fff;
  psVar6 = (short *)(local_res0 + CONCAT11(local_8 << 1 | (bStack_7 & 0x7f) >> 6,bVar5 << 1) + 1);
  in_U = in_U + -1;
  *in_U = psVar6[1] - *psVar6;
  API_FCF2();
  *in_U = *in_U + *psVar6;
  return in_D;
}


// ===== FUN_c043 @ c043 =====

void __h3000 FUN_c043(undefined1 param_1,char param_2)

{
  undefined1 local_1;
  
  for (local_1 = param_2; local_1 != '\0'; local_1 = local_1 + -1) {
  }
  return;
}


// ===== API_FE68 @ c055 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc08e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE68(undefined2 param_1,undefined2 param_2,ushort *param_3)

{
  ushort uVar1;
  undefined2 in_D;
  ushort uVar2;
  byte bVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = *param_3;
  uVar2 = uVar1 & 0x7fff;
  if ((uVar1 & 0x4000) != 0) {
    uVar2 = 0x3fff - (uVar1 & 0x3fff);
  }
  bVar3 = (byte)uVar2;
  *(byte *)((short)param_3 + -1) = bVar3 << 1;
  param_3 = param_3 + -1;
  *(byte *)param_3 = (char)(uVar2 >> 8) << 1 | bVar3 >> 7;
                    /* inline[API_FE20]: interp table, 9 points */
  InterpTableLookup();
  if (*(char *)(param_3 + 1) < '\0') {
    API_FCE0();
  }
  API_FCFC();
                    /* WARNING: Could not recover jumptable at 0xc08e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar3,param_1,param_2,param_3 + 1);
  return;
}


// ===== FUN_c090 @ c090 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc0cb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_c090(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  undefined2 in_D;
  undefined2 *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)((short)param_3 + -1) = (char)*param_3;
  puVar1 = param_3 + -1;
  *(char *)puVar1 = (char)((ushort)*param_3 >> 8);
  API_FCC8();
                    /* inline[API_FE20]: interp table, 17 points */
  InterpTableLookup();
  if (*(char *)(puVar1 + 1) < '\0') {
    API_FCE0();
  }
  API_FCFC();
                    /* WARNING: Could not recover jumptable at 0xc0cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,puVar1 + 1);
  return;
}


// ===== FUN_c0cd @ c0cd =====

undefined2 __h3000 FUN_c0cd(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *in_U;
  
  uVar1 = *in_U;
  uVar2 = in_U[1];
  in_U[1] = uVar2;
  *in_U = uVar1;
  in_U[-1] = 0x47;
  in_U = in_U + -2;
  *in_U = 1;
  API_FCEC();
  in_U[-1] = uVar2;
  in_U[-2] = uVar1;
  in_U[-3] = 0xc2;
  in_U[-4] = 0x55;
  API_FCF2();
  API_FCE2();
  return in_D;
}


// ===== FUN_c0ef @ c0ef =====

undefined2 __h3000 FUN_c0ef(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *in_U;
  
  uVar1 = *in_U;
  uVar2 = in_U[1];
  in_U[1] = uVar2;
  *in_U = uVar1;
  in_U[-1] = 0x20;
  in_U = in_U + -2;
  *in_U = 0;
  API_FCEC();
  in_U[-1] = uVar2;
  in_U[-2] = uVar1;
  in_U[-3] = 0x2c;
  in_U[-4] = 0x62;
  API_FCF2();
  API_FCE2();
  return in_D;
}


// ===== FUN_c111 @ c111 =====

undefined2 __h3000 FUN_c111(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *in_U;
  
  uVar1 = *in_U;
  uVar2 = in_U[1];
  in_U[1] = uVar2;
  *in_U = uVar1;
  in_U[-1] = 3;
  in_U = in_U + -2;
  *in_U = 0;
  API_FCEC();
  in_U[-1] = uVar2;
  in_U[-2] = uVar1;
  in_U[-3] = 0x6b;
  in_U[-4] = 0x23;
  API_FCF2();
  API_FCE2();
  return in_D;
}


// ===== FUN_c133 @ c133 =====

undefined2 __h3000 FUN_c133(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *in_U;
  
  uVar1 = *in_U;
  uVar2 = in_U[1];
  in_U[1] = uVar2;
  *in_U = uVar1;
  in_U[-1] = 0x2c;
  in_U = in_U + -2;
  *in_U = 0;
  API_FCEE();
  in_U[-1] = uVar2;
  in_U[-2] = uVar1;
  in_U[-3] = 0xcd;
  in_U[-4] = 0xc;
  API_FCF2();
  API_FCE2();
  return in_D;
}


// ===== FUN_c155 @ c155 =====

undefined2 __h3000 FUN_c155(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *in_U;
  
  uVar1 = *in_U;
  uVar2 = in_U[1];
  in_U[1] = uVar2;
  *in_U = uVar1;
  in_U[-1] = 4;
  in_U = in_U + -2;
  *in_U = 0;
  API_FCEE();
  in_U[-1] = uVar2;
  in_U[-2] = uVar1;
  in_U[-3] = 0x7a;
  in_U[-4] = 0x34;
  API_FCF2();
  API_FCE2();
  return in_D;
}


// ===== FUN_c177 @ c177 =====

undefined2 __h3000 FUN_c177(void)

{
  undefined2 in_D;
  undefined1 *in_U;
  
  in_U[1] = in_U[1];
  *in_U = *in_U;
  in_U[-1] = 0x72;
  in_U[-2] = 0x38;
  API_FCF2();
  return in_D;
}


// ===== API_FD04 @ c188 =====

short __h3000 API_FD04(undefined1 *param_1,undefined1 *param_2)

{
  short in_D;
  short sVar1;
  
  sVar1 = in_D;
  do {
    *param_2 = *param_1;
    sVar1 = sVar1 + -1;
    param_2 = param_2 + 1;
    param_1 = param_1 + 1;
  } while (sVar1 != 0);
  return in_D;
}


// ===== API_FD06 @ c19b =====

short __h3000 API_FD06(undefined1 *param_1,undefined1 *param_2)

{
  short in_D;
  short sVar1;
  
  sVar1 = in_D;
  do {
    *param_2 = *param_1;
    param_1 = param_1 + -1;
    param_2 = param_2 + -1;
    sVar1 = sVar1 + -1;
  } while (sVar1 != 0);
  return in_D;
}


// ===== API_FD08 @ c1b2 =====

void __h3000
API_FD08(undefined1 param_1,undefined1 param_2,undefined1 *param_3,undefined1 *param_4,
        undefined1 *param_5)

{
  undefined1 *puVar1;
  
  do {
    puVar1 = param_3 + 1;
    *param_4 = *param_3;
    param_3 = puVar1;
    param_4 = param_4 + 1;
  } while (puVar1 != param_5);
  return;
}


// ===== API_FD0A @ c1c3 =====

void __h3000 API_FD0A(undefined1 param_1,undefined1 param_2,char *param_3,char *param_4)

{
  while( true ) {
    if (*param_3 == '\0') break;
    *param_4 = *param_3;
    param_3 = param_3 + 1;
    param_4 = param_4 + 1;
  }
  return;
}


// ===== MemsetInline @ c1d2 =====

/* Kernel API slot $FD0C: inline count word + fill byte; Y = destination */

undefined2 __h3000
MemsetInline(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined1 *param_4)

{
  undefined1 uVar1;
  short sVar2;
  short *local_res0;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  sVar2 = *local_res0;
  uVar1 = *(undefined1 *)(local_res0 + 1);
  do {
    *param_4 = uVar1;
    sVar2 = sVar2 + -1;
    param_4 = param_4 + 1;
  } while (sVar2 != 0);
  return uStack_8;
}


// ===== API_FD0E @ c1e5 =====

undefined2 __h3000
API_FD0E(undefined1 param_1,char param_2,char *param_3,undefined2 param_4,short param_5)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  do {
    if (param_2 == *param_3) {
      return uStack_6;
    }
    param_5 = param_5 + -1;
    param_3 = param_3 + 1;
  } while (param_5 != 0);
  return uStack_6;
}


// ===== API_FD10 @ c1fd =====

undefined1 __h3000
API_FD10(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,short param_5)

{
  undefined1 uVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  
  uVar1 = *(undefined1 *)(param_4 + param_5);
  puVar3 = (undefined1 *)(param_4 + param_5);
  do {
    puVar2 = puVar3 + -1;
    *puVar3 = *puVar2;
    param_5 = param_5 + -1;
    puVar3 = puVar2;
  } while (param_5 != 0);
  *puVar2 = param_2;
  return uVar1;
}


// ===== API_FD12 @ c21e =====

undefined2 __h3000
API_FD12(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined1 *param_4,short param_5)

{
  undefined1 uVar1;
  
  uVar1 = *param_4;
  while( true ) {
    param_5 = param_5 + -1;
    if (param_5 == 0) break;
    *param_4 = param_4[1];
    param_4 = param_4 + 1;
  }
  *param_4 = param_2;
  return CONCAT11(param_1,uVar1);
}


// ===== FUN_c23f @ c23f =====

short __h3000 FUN_c23f(undefined1 *param_1,undefined1 *param_2)

{
  undefined1 uVar1;
  short in_D;
  short sVar2;
  
  sVar2 = in_D;
  do {
    uVar1 = *param_2;
    *param_2 = *param_1;
    *param_1 = uVar1;
    sVar2 = sVar2 + -1;
    param_2 = param_2 + 1;
    param_1 = param_1 + 1;
  } while (sVar2 != 0);
  return in_D;
}


// ===== JumpTableDispatch @ c256 =====

/* Kernel API slot $FD14: D = index into inline table of code pointers (never returns here) */

void __h3000 JumpTableDispatch(void)

{
  char cVar1;
  undefined2 in_D;
  short local_res0;
  
  cVar1 = (char)((ushort)in_D >> 8);
                    /* WARNING: Could not recover jumptable at 0xc263. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(CONCAT11(cVar1 << 1 | (byte)in_D >> 7,(byte)in_D << 1) + local_res0))(cVar1);
  return;
}


// ===== SwitchInline @ c265 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc287 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FD16: inline (value, target)* list, compared with D */

void __h3000 SwitchInline(undefined2 param_1,undefined2 param_2)

{
  short in_D;
  short *psVar1;
  code *local_res0;
  
  do {
    psVar1 = (short *)local_res0;
    if (in_D == *psVar1) {
      local_res0 = (code *)psVar1[1];
      if (local_res0 != (code *)((short)&VEC_RESET + 1)) goto LAB_c287;
      break;
    }
    local_res0 = (code *)(psVar1 + 2);
  } while (psVar1[1] != -1);
  local_res0 = (code *)(psVar1 + 2);
LAB_c287:
                    /* WARNING: Could not recover jumptable at 0xc287. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*local_res0)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== StoreWordsInline @ c289 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc29e */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FD18: inline ([addr] = word)* until $FFFF */

void __h3000 StoreWordsInline(undefined2 param_1,undefined2 param_2)

{
  undefined2 *puVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  short *local_res0;
  
  while( true ) {
    UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 1);
    puVar1 = (undefined2 *)*local_res0;
    if (puVar1 == (undefined2 *)((short)&VEC_RESET + 1)) break;
    local_res0 = local_res0 + 2;
    *puVar1 = *(undefined2 *)UNRECOVERED_JUMPTABLE;
  }
                    /* WARNING: Could not recover jumptable at 0xc29e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== StoreBytesInline @ c2a0 =====

/* Kernel API slot $FD1A: inline ([addr] = byte)* until $FFFF */

void __h3000
StoreBytesInline(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  undefined2 *local_res0;
  
  while( true ) {
    UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 1);
    pcVar1 = (code *)*local_res0;
    if (pcVar1 == (code *)((short)&VEC_RESET + 1)) break;
    local_res0 = (undefined2 *)((short)local_res0 + 3);
    *pcVar1 = *UNRECOVERED_JUMPTABLE;
  }
                    /* WARNING: Could not recover jumptable at 0xc2b5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_c2b8 @ c2b8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc2e0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_c2b8(undefined2 param_1,undefined2 param_2)

{
  short *psVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  undefined2 *local_res0;
  
  while( true ) {
    UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 1);
    psVar1 = (short *)*local_res0;
    if (psVar1 == (short *)((short)&VEC_RESET + 1)) break;
    if (*(short *)UNRECOVERED_JUMPTABLE == 0) {
      local_res0 = local_res0 + 2;
      *psVar1 = (short)&UNK_c2b7;
    }
    else {
      local_res0 = local_res0 + 2;
      *psVar1 = (short)(UNRECOVERED_JUMPTABLE + *(short *)UNRECOVERED_JUMPTABLE);
    }
  }
                    /* WARNING: Could not recover jumptable at 0xc2e0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== API_FD1C @ c2e2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc30e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FD1C(undefined2 *param_1,undefined2 *param_2)

{
  char cVar1;
  undefined2 *puVar2;
  undefined2 in_D;
  char *pcVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar4 = param_1;
  while( true ) {
    pcVar3 = (char *)(puVar4 + 1);
    puVar2 = (undefined2 *)*puVar4;
    if (puVar2 == (undefined2 *)((short)&VEC_RESET + 1)) break;
    puVar4 = (undefined2 *)((short)puVar4 + 3);
    cVar1 = *pcVar3;
    if (cVar1 != '\0') {
      if (cVar1 == '\x01') {
        *(undefined1 *)param_2 = *(undefined1 *)puVar2;
        param_2 = (undefined2 *)((short)param_2 + 1);
      }
      else if (cVar1 == '\x02') {
        *param_2 = *puVar2;
        param_2 = param_2 + 1;
      }
      else {
        API_FD04(0);
      }
    }
  }
                    /* WARNING: Could not recover jumptable at 0xc30e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== API_FD1E @ c310 =====

void __h3000 API_FD1E(undefined2 *param_1,undefined2 *param_2)

{
  char cVar1;
  undefined2 *puVar2;
  undefined2 in_D;
  char *pcVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  while( true ) {
    pcVar3 = (char *)(param_2 + 1);
    puVar2 = (undefined2 *)*param_2;
    if (puVar2 == (undefined2 *)((short)&VEC_RESET + 1)) break;
    param_2 = (undefined2 *)((short)param_2 + 3);
    cVar1 = *pcVar3;
    if (cVar1 != '\0') {
      if (cVar1 == '\x01') {
        *(undefined1 *)puVar2 = *(undefined1 *)param_1;
        param_1 = (undefined2 *)((short)param_1 + 1);
      }
      else if (cVar1 == '\x02') {
        *puVar2 = *param_1;
        param_1 = param_1 + 1;
      }
      else {
        API_FD04(0);
      }
    }
  }
                    /* WARNING: Could not recover jumptable at 0xc33c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== API_FD20 @ c33e =====

void __h3000 API_FD20(void)

{
  short in_D;
  
  do {
    in_D = in_D + -1;
  } while (in_D != 0);
  return;
}


// ===== API_FD8E @ c34d =====

void __h3000 API_FD8E(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 *local_res0;
  
  *(short *)*local_res0 = (short)((short *)*local_res0 + 1);
                    /* WARNING: Could not recover jumptable at 0xc35a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD90 @ c35c =====

void __h3000 API_FD90(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  short *psVar1;
  undefined1 *puVar2;
  undefined2 *local_res0;
  
  psVar1 = (short *)*local_res0;
  puVar2 = (undefined1 *)*psVar1;
  *puVar2 = param_2;
  *psVar1 = (short)(puVar2 + 1);
                    /* WARNING: Could not recover jumptable at 0xc36b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD92 @ c36d =====

void __h3000 API_FD92(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  short *psVar1;
  undefined2 *local_res0;
  
  psVar1 = (short *)*local_res0;
  if ((code *)(local_res0 + 1) != (code *)*psVar1) {
    param_2 = *(undefined1 *)(*psVar1 + -1);
    *psVar1 = *psVar1 + -1;
  }
                    /* WARNING: Could not recover jumptable at 0xc386. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 1))(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FD28 @ c388 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc395 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FD28(short param_1,undefined2 param_2)

{
  short in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = in_D;
  do {
    param_1 = param_1 + 1;
    sVar1 = sVar1 + -1;
  } while (sVar1 != 0);
                    /* WARNING: Could not recover jumptable at 0xc395. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(0,(char)in_D,param_1,param_2);
  return;
}


// ===== ClampMaxInline @ c397 =====

/* Kernel API slot $FE0C: D = min(D, inline word) */

void __h3000 ClampMaxInline(void)

{
  short local_res0;
  
                    /* WARNING: Could not recover jumptable at 0xc3ae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 2))();
  return;
}


// ===== API_FE60 @ c3b1 =====

void __h3000 API_FE60(undefined1 param_1,char param_2,undefined2 param_3,byte *param_4)

{
  byte extraout_B;
  byte bVar1;
  byte *pbVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  pbVar2 = param_4;
  FUN_c3c4();
  if (param_2 == '\0') {
    bVar1 = ~extraout_B & *pbVar2;
  }
  else {
    bVar1 = extraout_B | *pbVar2;
  }
  *pbVar2 = bVar1;
                    /* WARNING: Could not recover jumptable at 0xc3c2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_c3c4 @ c3c4 =====

ushort __h3000 FUN_c3c4(void)

{
  byte in_stack_00000005;
  
  return CONCAT11(in_stack_00000005,(&DAT_c3df)[(char)(in_stack_00000005 & 7)]) & 0x7ff;
}


// ===== API_FE62 @ c3e7 =====

short __h3000 API_FE62(byte param_1,undefined1 param_2,undefined2 param_3,byte *param_4)

{
  byte extraout_B;
  
  FUN_c3c4();
  if ((extraout_B & *param_4) == 0) {
    return (ushort)param_1 << 8;
  }
  return CONCAT11(param_1,0xff);
}


// ===== API_FD2A @ c3f8 =====

undefined2 __h3000 API_FD2A(void)

{
  byte bVar1;
  undefined2 in_D;
  undefined2 in_Y;
  
  bVar1 = (byte)((ushort)in_Y >> 8);
  BANK_LATCH = bVar1 >> 4 | 0x80;
  *(undefined2 *)CONCAT11((bVar1 & 0xf) << 1 | (byte)in_Y >> 7,(byte)in_Y << 1) = in_D;
  BANK_LATCH = g_curBank;
  return in_D;
}


// ===== API_FD2C @ c424 =====

void __h3000 API_FD2C(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_8053;
  return;
}


// ===== API_FD2E @ c430 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 API_FD2E(void)

{
  undefined1 uVar1;
  byte bVar2;
  undefined2 in_D;
  ushort uVar3;
  char cVar4;
  undefined2 in_Y;
  
  cVar4 = -1;
  do {
    uVar1 = DAT_8053;
    uVar3 = CONCAT11(uVar1,cVar4) & 0x41ff;
    if ((char)(uVar3 >> 8) == 'A') break;
    cVar4 = (char)uVar3 + -1;
  } while (cVar4 != '\0');
  BANK_LATCH = 0x80;
  _DAT_0000 = DAT_61df;
  bVar2 = (byte)((ushort)in_Y >> 8);
  BANK_LATCH = bVar2 >> 4 | 0x80;
  DAT_61df = in_D;
  *(undefined2 *)CONCAT11((bVar2 & 0xf) << 1 | (byte)in_Y >> 7,(byte)in_Y << 1) = in_D;
  BANK_LATCH = g_curBank;
  return in_D;
}


// ===== DspLoadProgram @ c47f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FD30: B = DSP 1-3, X = record key of TMS32010 image; writes via bank $80|B */

undefined2 __h3000
DspLoadProgram(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 uVar3;
  ushort uVar1;
  undefined2 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  byte extraout_CC_03;
  byte extraout_CC_04;
  byte extraout_CC_05;
  byte extraout_CC_06;
  byte extraout_CC_07;
  
  uVar3 = (undefined1)((ushort)param_3 >> 8);
  API_FD7E();
  API_FD34();
  BankPushSelect();
  RomFindRecord(uVar3);
  if (((((extraout_CC >> 2 & 1) != 0) && (API_FDA4(0), (extraout_CC_00 >> 2 & 1) != 0)) &&
      (uVar3 = RomStreamReadByte(), (extraout_CC_01 >> 2 & 1) != 0)) &&
     (RomStreamReadByte(uVar3), (extraout_CC_02 >> 2 & 1) != 0)) {
    do {
      uVar1 = 0x3fff - (DAT_607a & 0x3fff);
      if (DAT_607d <= uVar1) {
        FUN_c525((char)(DAT_607d >> 8),(char)DAT_607d,DAT_607a);
        uVar2 = FUN_c557();
        return uVar2;
      }
      uVar1 = uVar1 & 0xfffe;
      FUN_c525((char)(uVar1 >> 8),(char)uVar1,DAT_607a);
      DAT_607d = DAT_607d - uVar1;
      DAT_607a = DAT_607a + uVar1;
      FUN_c506();
    } while ((((extraout_CC_03 >> 2 & 1) != 0) && (FUN_c506(), (extraout_CC_04 >> 2 & 1) != 0)) &&
            ((FUN_c506(), (extraout_CC_05 >> 2 & 1) != 0 &&
             ((FUN_c506(), (extraout_CC_06 >> 2 & 1) != 0 &&
              (FUN_c506(), (extraout_CC_07 >> 2 & 1) != 0))))));
    BankPop();
    return param_4;
  }
  BankPop();
  return param_4;
}


// ===== FUN_c506 @ c506 =====

void __h3000 FUN_c506(void)

{
  undefined1 uVar2;
  undefined2 uVar1;
  byte extraout_CC;
  undefined2 *in_Y;
  
  uVar2 = RomStreamReadByte();
  if (((extraout_CC >> 2 & 1) != 0) && ((extraout_CC >> 2 & 1) != 0)) {
    uVar1 = RomStreamReadByte(uVar2);
    DAT_80a2 = 0;
    *in_Y = uVar1;
    DAT_80a2 = 0xff;
    return;
  }
  return;
}


// ===== FUN_c525 @ c525 =====

undefined2 * __h3000 FUN_c525(undefined2 *param_1,undefined2 *param_2)

{
  undefined2 *puVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  short in_D;
  undefined2 *puVar4;
  
  uVar3 = DAT_6079;
  uVar2 = g_curBank;
  puVar1 = (undefined2 *)(in_D + DAT_607a);
  do {
    BANK_LATCH = uVar3;
    puVar4 = param_1 + 1;
    BANK_LATCH = uVar2;
    DAT_80a2 = 0;
    g_curBank = uVar2;
    *param_2 = *param_1;
    DAT_80a2 = 0xff;
    param_1 = puVar4;
    param_2 = param_2 + 1;
  } while (puVar4 < puVar1);
  return puVar1;
}


// ===== FUN_c557 @ c557 =====

undefined2 __h3000 FUN_c557(void)

{
  undefined2 in_stack_00000004;
  
  BankPop();
  return in_stack_00000004;
}


// ===== API_FD32 @ c56b =====

void __h3000 API_FD32(void)

{
  API_FD7A();
  API_FD2A();
  API_FD78();
  return;
}


// ===== API_FD34 @ c577 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD34(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FD7A();
  API_FD2A(0,0,param_1,0);
  API_FD78();
  return in_D;
}


// ===== API_FD36 @ c58c =====

undefined2 __h3000 API_FD36(void)

{
  bool bVar1;
  short *in_D;
  short sVar2;
  undefined2 uVar3;
  byte extraout_CC;
  short *psVar4;
  
  sVar2 = 0x32;
  do {
    bVar1 = sVar2 == 1;
    sVar2 = 0;
    if (bVar1) break;
    sVar2 = API_FD2C();
  } while ((extraout_CC >> 2 & 1) == 0);
  uVar3 = API_FD7A((char)((ushort)sVar2 >> 8));
  while (psVar4 = in_D + 1, *in_D != -1) {
    in_D = in_D + 2;
    API_FD32((char)((ushort)*psVar4 >> 8));
  }
  return uVar3;
}


// ===== StoreWordsInline2 @ c59e =====

/* Kernel API slot $FD38: inline ([addr] = word)* until $FFFF, through helper */

undefined2 __h3000 StoreWordsInline2(void)

{
  undefined2 in_D;
  short *psVar1;
  short *local_res0;
  
  while (psVar1 = local_res0 + 1, *local_res0 != -1) {
    local_res0 = local_res0 + 2;
    API_FD32((char)((ushort)*psVar1 >> 8));
  }
  return in_D;
}


// ===== API_FD3A @ c5b6 =====

void __h3000 API_FD3A(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8002);
  return;
}


// ===== API_FD3C @ c5c0 =====

void __h3000 API_FD3C(void)

{
  API_FDE0();
  return;
}


// ===== API_FD3E @ c5cb =====

void __h3000 API_FD3E(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8004);
  return;
}


// ===== API_FD40 @ c5d5 =====

void __h3000 API_FD40(void)

{
  API_FDE0();
  return;
}


// ===== API_FD42 @ c5e0 =====

void __h3000 API_FD42(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8006);
  return;
}


// ===== API_FD44 @ c5ea =====

void __h3000 API_FD44(void)

{
  API_FDE0();
  return;
}


// ===== API_FD46 @ c5f5 =====

void __h3000 API_FD46(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8008);
  return;
}


// ===== API_FD48 @ c5ff =====

void __h3000 API_FD48(void)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  
  sVar2 = 0x32;
  do {
    bVar1 = DAT_8053;
    if ((bVar1 & 0x20) == 0) break;
    sVar2 = sVar2 + -1;
  } while (sVar2 != 0);
  RAM8008 = in_D;
  return;
}


// ===== API_FD4A @ c605 =====

void __h3000 API_FD4A(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,0x8000);
  return;
}


// ===== API_FD4C @ c60f =====

void __h3000 API_FD4C(void)

{
  API_FDE0();
  return;
}


// ===== API_FD4E @ c61a =====

undefined2 __h3000 API_FD4E(void)

{
  undefined2 uVar1;
  byte bVar2;
  short sVar3;
  
  sVar3 = 0x32;
  do {
    bVar2 = DAT_8053;
    if ((bVar2 & 0x20) == 0) {
      sVar3 = 0x32;
      goto LAB_c633;
    }
    sVar3 = sVar3 + -1;
  } while (sVar3 != 0);
  goto LAB_c63e;
  while (sVar3 = sVar3 + -1, sVar3 != 0) {
LAB_c633:
    bVar2 = DAT_8053;
    if ((bVar2 & 0x20) == 0) break;
  }
LAB_c63e:
  uVar1 = DAT_8050;
  return uVar1;
}


// ===== API_FDE0 @ c644 =====

void __h3000 API_FDE0(void)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *in_Y;
  
  sVar2 = 0x32;
  do {
    bVar1 = DAT_8053;
    if ((bVar1 & 0x20) == 0) break;
    sVar2 = sVar2 + -1;
  } while (sVar2 != 0);
  *in_Y = in_D;
  return;
}


// ===== API_FD50 @ c661 =====

undefined2 __h3000 API_FD50(byte param_1,undefined1 param_2,undefined2 param_3)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FDE0(param_1 & 0x1f,param_2,param_3,0x8000);
  return uStack_4;
}


// ===== API_FD52 @ c66e =====

undefined2 __h3000 API_FD52(byte param_1,undefined1 param_2,undefined2 param_3)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FDE0(param_1 & 0xf | 0x20,param_2,param_3,0x8000);
  return uStack_4;
}


// ===== API_FD54 @ c676 =====

undefined2 __h3000 API_FD54(byte param_1,undefined1 param_2,undefined2 param_3)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FDE0(param_1 & 0xf | 0x30,param_2,param_3,0x8000);
  return uStack_4;
}


// ===== API_FD56 @ c685 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD56(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x98,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD58 @ c68c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD58(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x98,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD5A @ c693 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD5A(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x84,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD5C @ c69a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD5C(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x84,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD5E @ c6a1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD5E(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x88,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD60 @ c6a8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD60(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x88,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD62 @ c6af =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD62(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x8c,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD64 @ c6b6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD64(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x8c,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD66 @ c6bd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD66(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x90,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD68 @ c6c4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD68(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x90,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD6A @ c6cb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD6A(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x94,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD6C @ c6d2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD6C(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x94,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD6E @ c6d9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD6E(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x9c,1,param_1,0x8000);
  return in_D;
}


// ===== API_FD70 @ c6e0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD70(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x9c,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD72 @ c6e7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD72(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FDE0(0x80,0,param_1,0x8000);
  return in_D;
}


// ===== API_FD74 @ c6ee =====

undefined1 __h3000 API_FD74(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_8053;
  return uVar1;
}


// ===== API_FD76 @ c6f2 =====

void __h3000 API_FD76(undefined1 param_1)

{
  DAT_8055 = param_1;
  return;
}


// ===== API_FD78 @ c6f6 =====

undefined2 __h3000 API_FD78(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a2 = 0xff;
  return uStack_2;
}


// ===== API_FD7A @ c700 =====

undefined2 __h3000 API_FD7A(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a2 = 0;
  return uStack_2;
}


// ===== API_FD7C @ c70a =====

undefined2 __h3000 API_FD7C(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a3 = 0;
  return uStack_2;
}


// ===== API_FD7E @ c714 =====

undefined2 __h3000 API_FD7E(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a3 = 0xff;
  return uStack_2;
}


// ===== FUN_c73e @ c73e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xc776 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_c73e(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61e6 = g_curBank;
  DAT_61e5 = 0xf0;
  API_FD22();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_61e5 = 0;
    API_FDD0();
  }
  API_FDC0(199);
                    /* inline[API_FD18]: [$602A]=$C778 [$6030]=$C778 [$602E]=$C778 [$603A]=$C778 */
  StoreWordsInline();
                    /* WARNING: Could not recover jumptable at 0xc776. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== Reset @ c778 =====

void __h3000 Reset(void)

{
  Reset();
  return;
}


// ===== FUN_c8fa @ c8fa =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_c8fa(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  byte extraout_CC;
  
  API_FD22(0xf0,0xf0,param_3,0x61e1);
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* inline[API_FD26]: $000C $61E1 */
    FarCallInline();
  }
  Reset();
  return;
}


// ===== FUN_c912 @ c912 =====

undefined2 __h3000 FUN_c912(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  char cVar2;
  char extraout_B;
  byte extraout_CC;
  undefined2 uStack_4;
  undefined1 uVar1;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FD7E();
  cVar2 = '\x04';
  uVar1 = extraout_A;
  do {
    DspLoadProgram(uVar1,cVar2);
    if ((extraout_CC >> 2 & 1) == 0) {
      return uStack_4;
    }
    cVar2 = extraout_B + '\x01';
    uVar1 = extraout_A_00;
  } while (cVar2 != '\b');
  return uStack_4;
}


// ===== API_FDFA @ c91b =====

undefined2 __h3000 API_FDFA(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  char cVar2;
  char extraout_B;
  byte extraout_CC;
  undefined2 uStack_4;
  undefined1 uVar1;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FD7E();
  cVar2 = '\0';
  uVar1 = extraout_A;
  do {
    DspLoadProgram(uVar1,cVar2);
    if ((extraout_CC >> 2 & 1) == 0) {
      return uStack_4;
    }
    cVar2 = extraout_B + '\x01';
    uVar1 = extraout_A_00;
  } while (cVar2 != '\b');
  return uStack_4;
}


// ===== FUN_c93c @ c93c =====

void __h3000 FUN_c93c(void)

{
  undefined1 uVar1;
  char extraout_B;
  char cVar2;
  char extraout_B_00;
  
                    /* inline[API_FC38]: "{1}" */
  LcdPrintInline();
  cVar2 = extraout_B;
  do {
    cVar2 = cVar2 + '\x01';
    BANK_LATCH = cVar2;
    DAT_8054 = cVar2;
    DAT_8057 = cVar2;
    uVar1 = DAT_8056;
    API_FC2A(uVar1,cVar2);
    cVar2 = extraout_B_00;
  } while( true );
}


// ===== FUN_c953 @ c953 =====

undefined2 __h3000 FUN_c953(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  API_FC80(param_1,0x5a,&UNK_028b,&UNK_028b);
  API_FC7C();
  return uStack_6;
}


// ===== FUN_c967 @ c967 =====

void __h3000 FUN_c967(void)

{
  char cVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
  API_FC88();
                    /* inline[API_FC38]: "{1}Remove all presets ?" */
  LcdPrintInline();
                    /* inline[API_FE3C]: $FFE8 $FFE8 */
  API_FE3C();
  do {
    API_FC1A();
  } while ((extraout_CC >> 2 & 1) == 0);
  do {
    cVar1 = API_FC1A();
  } while ((bool)(extraout_CC_00 >> 2 & 1));
  if (cVar1 == '\x02') {
    FUN_c9da();
  }
  API_FC88();
                    /* inline[API_FC38]: "{1}Reset the Operating System ?" */
  LcdPrintInline();
                    /* inline[API_FE3C]: $FFE8 $FFE8 */
  API_FE3C();
  do {
    API_FC1A();
  } while ((extraout_CC_01 >> 2 & 1) == 0);
  do {
    cVar1 = API_FC1A();
  } while ((bool)(extraout_CC_02 >> 2 & 1));
  if (cVar1 == '\x02') {
    FUN_ca0c();
  }
  Reset();
  return;
}


// ===== FUN_c9da @ c9da =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xca0a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_c9da(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
                    /* inline[API_FD0C]: $1D00 FF */
  MemsetInline();
                    /* inline[API_FD0C]: $0100 FF */
  MemsetInline();
  DAT_600c = 0xa0;
  API_FDDE(0,0x10,&UNK_884d,0x300);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xca0a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_4 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== FUN_ca0c @ ca0c =====

void __h3000 FUN_ca0c(void)

{
  byte extraout_CC;
  short sVar1;
  undefined1 uStack0000;
  
  BankPushSelect();
  uStack0000 = 0x18;
                    /* inline[API_FD0C]: $0180 00 */
  MemsetInline();
  uStack0000 = 0x22;
                    /* inline[API_FD0C]: $0080 00 */
  MemsetInline();
  uStack0000 = 0x28;
                    /* inline[API_FD1A]: [$028F]=$FF [$0290]=$00 [$0283]=$0A [$028C]=$80 [$028D]=$00
                       [$028E]=$00 [$0296]=$FF [$0284]=$F8 [$0285]=$F8 [$0286]=$F8 [$0287]=$F8
                       [$0292]=$FF [$0293]=$FF [$0294]=$FF [$0295]=$FF [$0297]=$03 [$029A]=$00
                       [$029B]=$00 [$029C]=$00 [$0288]=$00 [$0282]=$FF [$0280]=$00 [$0281]=$00
                       [$0289]=$00 [$028A]=$00 */
  StoreBytesInline();
  sVar1 = 0x6400;
  do {
    uStack0000 = 0x7d;
    RomFindRecord((char)((ushort)sVar1 >> 8));
    if ((bool)(extraout_CC >> 2 & 1)) {
      uStack0000 = 0x8d;
      API_FC66();
      DAT_0283 = 0;
      uStack0000 = 0x93;
      BankPop();
      return;
    }
    sVar1 = sVar1 + 0x100;
  } while (sVar1 != -0x3700);
  uStack0000 = 0x97;
                    /* inline[API_FC38]: "{1}NO PROGRAMS" */
  LcdPrintInline();
  do {
                    /* WARNING: Do nothing block with infinite loop */
  } while( true );
}


// ===== FUN_caa6 @ caa6 =====

undefined2 __h3000 FUN_caa6(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FC88();
                    /* inline[API_FC38]: "{1}memory still the same {2:28}Press something to escape "
                        */
  LcdPrintInline();
  return uStack_2;
}


// ===== FUN_cae5 @ cae5 =====

void __h3000 FUN_cae5(void)

{
  return;
}


// ===== FUN_cae6 @ cae6 =====

void __h3000 FUN_cae6(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  char extraout_B;
  byte extraout_CC;
  undefined1 *puVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  do {
    while( true ) {
      do {
        API_FDDA();
        if ((extraout_CC >> 2 & 1) == 0) {
          FUN_e99c();
          FUN_dd5e();
          API_FE0E();
                    /* WARNING: Could not recover jumptable at 0xcb25. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
          return;
        }
        FUN_f767();
      } while (extraout_B == -1);
      puVar2 = &DAT_6b00;
      if (extraout_B < '\0') break;
      if (DAT_61e7 == '\0') {
        cVar1 = '\x03';
LAB_cb0c:
        sVar3 = 0x13;
        do {
          cVar1 = (**(code **)(puVar2 + cVar1))();
          puVar2 = puVar2 + 0x30;
          sVar3 = sVar3 + -1;
        } while (sVar3 != 0);
      }
    }
    if (extraout_B != -0x10) {
      DAT_61e7 = '\0';
      cVar1 = '\x01';
      goto LAB_cb0c;
    }
    DAT_61e7 = -1;
  } while( true );
}


// ===== API_FE0E @ cb2f =====

void __h3000 API_FE0E(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_60fc != '\0') {
    FUN_d9cb();
    FUN_cb3e();
  }
                    /* WARNING: Could not recover jumptable at 0xcb3c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_cb3e @ cb3e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcb73 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_cb3e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte *pbVar1;
  short sVar2;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect();
  sVar2 = 0x13;
  pbVar1 = &DAT_6b00;
  do {
    if ((*pbVar1 & 0xc0) == 0) {
      if (*(short *)(pbVar1 + 0x16) != *(short *)(pbVar1 + 0x14)) {
        *(short *)(pbVar1 + 0x14) = *(short *)(pbVar1 + 0x16);
        (**(code **)(pbVar1 + 0x11))();
      }
    }
    pbVar1 = pbVar1 + 0x30;
    sVar2 = sVar2 + -1;
  } while (sVar2 != 0);
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xcb73. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_4 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== API_FE48 @ cb75 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcb9a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE48(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  undefined1 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar2 = &DAT_6b00;
  sVar1 = 0x13;
  do {
    *(undefined2 *)(puVar2 + 0x16) = 0;
    puVar2[0x1f] = 0;
    puVar2 = puVar2 + 0x30;
    sVar1 = sVar1 + -1;
  } while (sVar1 != 0);
  FUN_cb3e();
  FUN_e07e();
  FUN_e804();
                    /* WARNING: Could not recover jumptable at 0xcb9a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_cb9c @ cb9c =====

void __h3000 FUN_cb9c(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  undefined1 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD0C]: $0390 00 */
  MemsetInline();
  cVar1 = '\x13';
  puVar2 = &DAT_6b00;
  do {
    *(code **)(puVar2 + 1) = FUN_cae5;
    *(code **)(puVar2 + 3) = FUN_cae5;
    *(code **)(puVar2 + 5) = FUN_cae5;
    *(code **)(puVar2 + 7) = FUN_cae5;
    *puVar2 = 0xff;
    puVar2 = puVar2 + 0x30;
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  API_FE48();
  FUN_ddc3();
                    /* WARNING: Could not recover jumptable at 0xcbd7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== DefineParameterAlt @ cbd9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcc4c */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FE78: as DefineParameter with flags |= $40 */

void __h3000 DefineParameterAlt(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  short sVar3;
  byte *pbVar4;
  byte *in_stack_00000000;
  
  sVar2 = (CONCAT11(0x30,*in_stack_00000000) >> 8) * (ushort)*in_stack_00000000;
  (&DAT_6b00)[sVar2] = 0x40;
  pbVar4 = in_stack_00000000 + 2;
  bVar1 = in_stack_00000000[1];
  API_FD04(0,8,pbVar4,sVar2 + 0x6b09);
  (&DAT_6b13)[sVar2] = (char)sVar2;
  sVar3 = 0;
  if ((char)bVar1 < '\0') {
    sVar3 = g_moduleBase;
  }
  *(short *)((short)&DAT_6b11 + sVar2) = *(short *)(pbVar4 + 1) + sVar3;
  *(short *)((short)&DAT_6b07 + sVar2) = *(short *)(pbVar4 + 3) + sVar3;
  *(code **)((short)&DAT_6b05 + sVar2) = FUN_cc4e;
  API_FD86(0xcc,0x4e,&DAT_6b00 + sVar2);
  FUN_d452();
                    /* WARNING: Could not recover jumptable at 0xcc4c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(pbVar4 + 5))((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
}


// ===== DefineParameter @ cbe3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcc4c */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FD84: inline 15-byte record: index, flags, 8-char name, ?, 2 pointers */

void __h3000 DefineParameter(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  short sVar3;
  byte *pbVar4;
  byte *local_res0;
  
  sVar2 = (CONCAT11(0x30,*local_res0) >> 8) * (ushort)*local_res0;
  (&DAT_6b00)[sVar2] = 0;
  pbVar4 = local_res0 + 2;
  bVar1 = local_res0[1];
  API_FD04(0,8,pbVar4,sVar2 + 0x6b09);
  (&DAT_6b13)[sVar2] = (char)sVar2;
  sVar3 = 0;
  if ((char)bVar1 < '\0') {
    sVar3 = g_moduleBase;
  }
  *(short *)((short)&DAT_6b11 + sVar2) = *(short *)(pbVar4 + 1) + sVar3;
  *(short *)((short)&DAT_6b07 + sVar2) = *(short *)(pbVar4 + 3) + sVar3;
  *(code **)((short)&DAT_6b05 + sVar2) = FUN_cc4e;
  API_FD86(0xcc,0x4e,&DAT_6b00 + sVar2);
  FUN_d452();
                    /* WARNING: Could not recover jumptable at 0xcc4c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(pbVar4 + 5))((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
}


// ===== FUN_cc4e @ cc4e =====

void __h3000 FUN_cc4e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d0a9(param_1,param_2,DAT_61f4);
                    /* inline[API_FC8A]: ->$CC69(rel) "( Source )" */
  SoftKeyDefine(extraout_A,1);
                    /* WARNING: Could not recover jumptable at 0xcc67. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_cc69 @ cc69 =====

void __h3000 FUN_cc69(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDD4(param_1,param_2,DAT_61f4);
  FUN_df5e();
  LcdSetCursor(extraout_A,0);
  FUN_df4d();
  FUN_d0a9();
                    /* inline[API_FC8A]: ->$CCAA(rel) "( Source )" */
  SoftKeyDefine(extraout_A_00,0);
                    /* inline[API_FC8A]: ->$DE9A(rel) "(  Done  )" */
  SoftKeyDefine(extraout_A_01,3);
  DAT_60b9 = 0;
  FUN_ccaa();
                    /* WARNING: Could not recover jumptable at 0xcca8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_ccaa @ ccaa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xccf4 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ccaa(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  if ((*DAT_61f4 & 0xc0) == 0) {
    uVar1 = 0x36;
  }
  else {
    uVar1 = 0x12;
  }
  _DAT_61e8 = uVar1;
  FUN_dd35(0);
  DAT_6074 = uVar1;
                    /* inline[API_FC16]: 01 20 02 96 03 00 03 40 $61E8 $FFF0 $0000 ->$0000 ->$000D
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_ccf6();
                    /* WARNING: Could not recover jumptable at 0xccf4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1);
  return;
}


// ===== FUN_ccf6 @ ccf6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcd52 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ccf6(undefined2 param_1,short param_2)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_2;
                    /* inline[API_FE5C]: $0036 $0051 */
  DAT_6074 = API_FE5C((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,DAT_61f4);
  bVar1 = (byte)DAT_6074;
  *DAT_61f4 = *DAT_61f4 & 0xc0 | bVar1;
  API_FC14();
  FUN_dd48(0);
                    /* inline[API_FC8A]: ->$CAE5(rel) "          " */
  SoftKeyDefine();
                    /* inline[API_FC8A]: ->$CAE5(rel) "          " */
  SoftKeyDefine();
  FUN_d0a9();
  FUN_dcdd();
  (**(code **)(sVar2 + 5))();
  FUN_d4a7();
                    /* WARNING: Could not recover jumptable at 0xcd52. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1,param_2);
  return;
}


// ===== FUN_cd54 @ cd54 =====

void __h3000 FUN_cd54(undefined1 param_1,byte param_2,undefined2 param_3,short param_4)

{
  undefined1 extraout_A;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  *DAT_61f4 = *DAT_61f4 & 0xc0 | param_2;
  sVar1 = param_4;
  FUN_dcdd();
  (**(code **)(sVar1 + 9))(extraout_A,param_2);
                    /* WARNING: Could not recover jumptable at 0xcd70. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_cd72 @ cd72 =====

void __h3000 FUN_cd72(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$CD87(rel) "( Channel)" */
  SoftKeyDefine(param_1,2);
                    /* WARNING: Could not recover jumptable at 0xcd85. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_cd87 @ cd87 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcdb9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_cd87(undefined2 param_1)

{
  undefined2 in_D;
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  bVar1 = FUN_dd35(1,(char)in_D,DAT_61f4);
  DAT_6074 = (ushort)bVar1;
                    /* inline[API_FC16]: 01 10 02 64 01 00 03 00 $000F $0000 $0000 ->$000C ->$0014
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xcdb9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1);
  return;
}


// ===== FUN_cdbb @ cdbb =====

void __h3000 FUN_cdbb(void)

{
                    /* inline[API_FC38]: "{2:26}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cdc5 @ cdc5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcdd5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_cdc5(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd48(1,(char)DAT_6074,DAT_61f4);
  FUN_d4a7();
                    /* WARNING: Could not recover jumptable at 0xcdd5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_cdd7 @ cdd7 =====

void __h3000
FUN_cdd7(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  byte extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(1);
  *(byte *)(param_5 + -1) = extraout_B & 0xf;
  *(undefined1 *)(param_5 + -2) = 0;
                    /* inline[API_FC38]: "{2:23}Ch+{4:2000}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xcdf2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_cdf4 @ cdf4 =====

void __h3000 FUN_cdf4(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$CE09(rel) "(  Note  )" */
  SoftKeyDefine(param_1,1);
                    /* WARNING: Could not recover jumptable at 0xce07. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_ce09 @ ce09 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xce3b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ce09(undefined2 param_1)

{
  undefined2 in_D;
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  bVar1 = FUN_dd35(2,(char)in_D,DAT_61f4);
  DAT_6074 = (ushort)bVar1;
                    /* inline[API_FC16]: 01 10 02 64 00 00 03 00 $007F $0000 $0000 ->$000C ->$001A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xce3b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1);
  return;
}


// ===== FUN_ce3d @ ce3d =====

void __h3000 FUN_ce3d(void)

{
  API_FE0A((char)((ushort)DAT_6074 >> 8));
                    /* inline[API_FC38]: "{2:10}{3:60A5}" */
  LcdPrintInline();
  return;
}


// ===== FUN_ce4d @ ce4d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xce5d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ce4d(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd48(2,(char)DAT_6074,DAT_61f4);
  FUN_d4a7();
                    /* WARNING: Could not recover jumptable at 0xce5d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_ce5f @ ce5f =====

void __h3000 FUN_ce5f(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  byte extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
  API_FE0A(extraout_A,extraout_B & 0x7f);
                    /* inline[API_FC38]: "{2:10}{3:60A5}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xce74. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_ce76 @ ce76 =====

void __h3000 FUN_ce76(void)

{
  FUN_cdd7();
  FUN_ce5f();
  return;
}


// ===== FUN_ce7d @ ce7d =====

void __h3000 FUN_ce7d(void)

{
  FUN_cd72();
  FUN_cdf4();
  return;
}


// ===== FUN_ce84 @ ce84 =====

void __h3000 FUN_ce84(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$CE99(rel) "( PW Sens)" */
  SoftKeyDefine(param_1,1);
                    /* WARNING: Could not recover jumptable at 0xce97. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_ce99 @ ce99 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xced0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ce99(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  FUN_dd35(2,(char)in_D,DAT_61f4);
                    /* inline[API_FE0C]: $00F0 */
  uVar1 = ClampMaxInline(0);
  DAT_6074 = uVar1;
                    /* inline[API_FC16]: 01 10 02 1E 01 01 03 00 $00F0 $0000 $0000 ->$000C ->$FF85
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xced0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1);
  return;
}


// ===== FUN_ced2 @ ced2 =====

void __h3000 FUN_ced2(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:609E}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cedc @ cedc =====

void __h3000
FUN_cedc(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
                    /* inline[API_FE0C]: $00F0 */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:0100}{3:60A8}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xcef7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_cef9 @ cef9 =====

void __h3000 FUN_cef9(void)

{
  FUN_cdd7();
  FUN_cedc();
  return;
}


// ===== FUN_cf00 @ cf00 =====

void __h3000 FUN_cf00(void)

{
  FUN_cd72();
  FUN_ce84();
  return;
}


// ===== FUN_cf07 @ cf07 =====

void __h3000 FUN_cf07(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$CF1C(rel) "( Cntlr. )" */
  SoftKeyDefine(param_1,1);
                    /* WARNING: Could not recover jumptable at 0xcf1a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_cf1c @ cf1c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcf53 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_cf1c(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  FUN_dd35(2,(char)in_D,DAT_61f4);
                    /* inline[API_FE0C]: $0079 */
  uVar1 = ClampMaxInline(0);
  DAT_6074 = uVar1;
                    /* inline[API_FC16]: 01 10 02 32 01 00 03 00 $0079 $0000 $0000 ->$000C ->$FF02
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xcf53. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1);
  return;
}


// ===== FUN_cf55 @ cf55 =====

void __h3000 FUN_cf55(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cf5f @ cf5f =====

void __h3000
FUN_cf5f(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
                    /* inline[API_FE0C]: $0079 */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xcf7a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_cf7c @ cf7c =====

void __h3000 FUN_cf7c(void)

{
  FUN_cdd7();
  FUN_cf5f();
  return;
}


// ===== FUN_cf83 @ cf83 =====

void __h3000 FUN_cf83(void)

{
  FUN_cd72();
  FUN_cf07();
  return;
}


// ===== FUN_cf8a @ cf8a =====

void __h3000 FUN_cf8a(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$CF9F(rel) "( Cntlr. )" */
  SoftKeyDefine(param_1,1);
                    /* WARNING: Could not recover jumptable at 0xcf9d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_cf9f @ cf9f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcfd6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_cf9f(undefined2 param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  FUN_dd35(2,(char)in_D,DAT_61f4);
                    /* inline[API_FE0C]: $001F */
  uVar1 = ClampMaxInline(0);
  DAT_6074 = uVar1;
                    /* inline[API_FC16]: 01 10 02 4B 01 00 03 00 $001F $0000 $0000 ->$000C ->$FE7F
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xcfd6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1);
  return;
}


// ===== FUN_cfd8 @ cfd8 =====

void __h3000 FUN_cfd8(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cfe2 @ cfe2 =====

void __h3000
FUN_cfe2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
                    /* inline[API_FE0C]: $001F */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xcffd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_cfff @ cfff =====

void __h3000 FUN_cfff(void)

{
  FUN_cdd7();
  FUN_cfe2();
  return;
}


// ===== FUN_d006 @ d006 =====

void __h3000 FUN_d006(void)

{
  FUN_cd72();
  FUN_cf8a();
  return;
}


// ===== FUN_d00d @ d00d =====

void __h3000 FUN_d00d(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$D022(rel) "(Threshld)" */
  SoftKeyDefine(param_1,1);
                    /* WARNING: Could not recover jumptable at 0xd020. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d022 @ d022 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xd054 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_d022(undefined2 param_1)

{
  undefined2 in_D;
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  bVar1 = FUN_dd35(2,(char)in_D,DAT_61f4);
  DAT_6074 = (ushort)bVar1;
                    /* inline[API_FC16]: 01 10 02 32 01 00 03 00 $007F $0000 $0000 ->$000C ->$FE01
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0xd054. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1);
  return;
}


// ===== FUN_d056 @ d056 =====

void __h3000 FUN_d056(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_d060 @ d060 =====

void __h3000
FUN_d060(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
                    /* inline[API_FE0C]: $007F */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xd07b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_d07d @ d07d =====

void __h3000 FUN_d07d(void)

{
  FUN_cdd7();
  FUN_d060();
  return;
}


// ===== FUN_d084 @ d084 =====

void __h3000 FUN_d084(void)

{
  FUN_cd72();
  FUN_d00d();
  return;
}


// ===== FUN_d08b @ d08b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xd0a7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_d08b(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined1 extraout_B;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = param_2;
  API_FC06(0xff);
  extraout_B = (undefined1)in_D;
  DAT_61ea = uVar1;
  DAT_61ec = extraout_B;
  API_FC06(0xff);
  DAT_61ed = uVar1;
  DAT_61ef = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd0a7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),extraout_B,param_1,param_2);
  return;
}


// ===== FUN_d0a9 @ d0a9 =====

void __h3000 FUN_d0a9(undefined1 param_1,undefined1 param_2,undefined2 param_3,byte *param_4)

{
  byte *pbVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  pbVar1 = param_4;
  FUN_dcdd();
  if ((*pbVar1 & UNK_0010) == 0) {
    FUN_d0c3();
  }
  else {
    FUN_de01();
  }
  (**(code **)(pbVar1 + 3))();
                    /* WARNING: Could not recover jumptable at 0xd0c1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d0c3 @ d0c3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xd0ed */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_d0c3(void)

{
  short sVar1;
  ushort uVar2;
  short sVar3;
  undefined2 in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor();
  FUN_dd35(0);
  uVar2 = FUN_dd2c();
  sVar3 = (uVar2 & 0xff) * 0x1c;
  sVar1 = sVar3 + 8;
  BankPushSelect((char)((ushort)sVar1 >> 8),DAT_61f2,DAT_61f0 + sVar1);
  API_FC3A();
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xd0ed. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_Y >> 8),(char)sVar3,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_d452 @ d452 =====

/* WARNING: Removing unreachable block (RAM,0xd459) */
/* WARNING: Removing unreachable block (RAM,0xd461) */
/* WARNING: Removing unreachable block (RAM,0xd465) */
/* WARNING: Removing unreachable block (RAM,0xd467) */
/* WARNING: Heritage AFTER dead removal. Example location: B : 0xd4a5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_d452(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xd4a5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_d4a7 @ d4a7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xd4e4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_d4a7(byte *param_1,short param_2)

{
  byte bVar1;
  undefined2 in_D;
  byte *pbVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  pbVar2 = param_1;
                    /* inline[API_FD0C]: $0016 00 */
  MemsetInline();
  *(code **)(pbVar2 + 0x1b) = FUN_dcd4;
                    /* inline[addr:DC68]: $CAE5 $0000 */
  FUN_dc68();
  FUN_dd35(0);
  bVar1 = *pbVar2;
  *pbVar2 = bVar1 & 0xc0 | (byte)in_D & 0x3f;
  sVar3 = param_2;
  FUN_dcdd();
  (**(code **)(sVar3 + 1))();
                    /* WARNING: Could not recover jumptable at 0xd4e4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1 & 0xc0,param_1,param_2);
  return;
}


// ===== FUN_d4e6 @ d4e6 =====

void __h3000 FUN_d4e6(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D4F1 $0000 */
  FUN_dc68();
                    /* WARNING: Could not recover jumptable at 0xd4ef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d4f1 @ d4f1 =====

void __h3000 FUN_d4f1(short param_1)

{
  undefined2 in_D;
  char cVar2;
  short sVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = FUN_dcb3();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x20)) {
    do {
      sVar1 = FUN_db91();
      *(short *)(param_1 + 0x16) = (sVar1 + -0x2000) * 2;
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d50e @ d50e =====

void __h3000 FUN_d50e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D519 $0000 */
  FUN_dc68();
                    /* WARNING: Could not recover jumptable at 0xd517. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d519 @ d519 =====

void __h3000 FUN_d519(short param_1)

{
  undefined2 in_D;
  char cVar2;
  ushort uVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = FUN_dcb3();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x20)) {
    do {
      uVar1 = FUN_db91();
      if (uVar1 < 0x2000) {
        uVar1 = 0x4000 - uVar1;
      }
      *(ushort *)(param_1 + 0x16) = (uVar1 + 0xe000) * 2;
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d543 @ d543 =====

void __h3000 FUN_d543(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D557 $0000 */
  FUN_dc68();
  FUN_dc44();
  *(undefined1 *)(param_3 + 0x22) = 0;
                    /* WARNING: Could not recover jumptable at 0xd555. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d557 @ d557 =====

void __h3000 FUN_d557(short param_1)

{
  undefined2 in_D;
  char cVar2;
  undefined2 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = FUN_dcb3();
  if ((extraout_CC >> 2 & 1) == 0) {
    *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
    return;
  }
  if (cVar2 != -0x20) {
    do {
      do {
        FUN_db0c();
        FUN_dab5();
      } while ((extraout_CC_00 >> 2 & 1) == 0);
      uVar1 = FUN_dbc7();
      *(undefined2 *)(param_1 + 0x16) = uVar1;
    } while( true );
  }
  do {
    FUN_db91();
    uVar1 = FUN_dbff();
    *(undefined2 *)(param_1 + 0x16) = uVar1;
  } while( true );
}


// ===== FUN_d585 @ d585 =====

void __h3000 FUN_d585(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D557 $0000 */
  FUN_dc68();
  FUN_dc44();
  *(undefined1 *)(param_3 + 0x22) = 2;
                    /* WARNING: Could not recover jumptable at 0xd597. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d599 @ d599 =====

void __h3000 FUN_d599(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D557 $0000 */
  FUN_dc68();
  FUN_dc44();
  *(undefined1 *)(param_3 + 0x22) = 4;
                    /* WARNING: Could not recover jumptable at 0xd5ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d5ad @ d5ad =====

void __h3000 FUN_d5ad(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D557 $0000 */
  FUN_dc68();
  FUN_dc44();
  *(undefined1 *)(param_3 + 0x22) = 6;
                    /* WARNING: Could not recover jumptable at 0xd5bf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d5c1 @ d5c1 =====

void __h3000 FUN_d5c1(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D5D5 $0000 */
  FUN_dc68();
  FUN_dc44();
  *(undefined1 *)(param_3 + 0x22) = 0x80;
                    /* WARNING: Could not recover jumptable at 0xd5d3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d5d5 @ d5d5 =====

void __h3000 FUN_d5d5(short param_1)

{
  undefined2 in_D;
  char cVar2;
  undefined2 uVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = FUN_dcb3();
  if ((extraout_CC >> 2 & 1) == 0) {
    *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
    return;
  }
  if (cVar2 != -0x20) {
    do {
      do {
        do {
          uVar1 = FUN_db0c();
        } while ((char)uVar1 == -0x80);
      } while ((char)((ushort)uVar1 >> 8) == '\0');
      if (*(char *)(param_1 + 0x1f) == '\x01') {
        *(undefined1 *)(param_1 + 0x21) = *(undefined1 *)(param_1 + 0x20);
      }
      *(char *)(param_1 + 0x1e) = *(char *)(param_1 + 0x20) - *(char *)(param_1 + 0x21);
      uVar1 = FUN_dbc7();
      *(undefined2 *)(param_1 + 0x16) = uVar1;
    } while( true );
  }
  do {
    FUN_db91();
    uVar1 = FUN_dbff();
    *(undefined2 *)(param_1 + 0x16) = uVar1;
  } while( true );
}


// ===== FUN_d621 @ d621 =====

void __h3000 FUN_d621(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D62C $0000 */
  FUN_dc68();
                    /* WARNING: Could not recover jumptable at 0xd62a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d62c @ d62c =====

void __h3000 FUN_d62c(short param_1)

{
  undefined2 in_D;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dcb3();
  if ((extraout_CC >> 2 & 1) != 0) {
    do {
      FUN_db0c();
      FUN_da39();
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d645 @ d645 =====

void __h3000 FUN_d645(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d621();
  *(undefined1 *)(param_3 + 0x25) = 0x10;
  FUN_dd35(2);
  *(undefined1 *)(param_3 + 0x1a) = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd659. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d65b @ d65b =====

void __h3000 FUN_d65b(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D66C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 0;
                    /* WARNING: Could not recover jumptable at 0xd66a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d66c @ d66c =====

void __h3000 FUN_d66c(short param_1)

{
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dcb3();
  if ((extraout_CC >> 2 & 1) != 0) {
    do {
      do {
        do {
          FUN_db0c();
          FUN_dab5();
        } while ((extraout_CC_00 >> 2 & 1) == 0);
      } while (*(char *)(param_1 + 0x21) == '\0');
      FUN_da39();
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d688 @ d688 =====

void __h3000 FUN_d688(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d65b();
  *(undefined1 *)(param_3 + 0x25) = 0x10;
  FUN_dd35(2);
  *(undefined1 *)(param_3 + 0x1a) = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd659. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d68f @ d68f =====

void __h3000 FUN_d68f(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D66C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 2;
                    /* WARNING: Could not recover jumptable at 0xd69e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d6a0 @ d6a0 =====

void __h3000 FUN_d6a0(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D66C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 4;
                    /* WARNING: Could not recover jumptable at 0xd6af. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d6b1 @ d6b1 =====

void __h3000 FUN_d6b1(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D66C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 6;
                    /* WARNING: Could not recover jumptable at 0xd6c0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d6c2 @ d6c2 =====

void __h3000 FUN_d6c2(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D6D6 $0000 */
  FUN_dc68();
  FUN_dd35(2);
  *(undefined1 *)(param_3 + 0x1e) = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd6d4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d6d6 @ d6d6 =====

void __h3000 FUN_d6d6(short param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dcb3();
  if ((extraout_CC >> 2 & 1) != 0) {
    do {
      do {
        uVar1 = FUN_db0c();
      } while ((char)uVar1 == -0x80);
      if (((char)((ushort)uVar1 >> 8) != '\0') &&
         (*(char *)(param_1 + 0x20) == *(char *)(param_1 + 0x1e))) {
        FUN_da39(0);
      }
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d6fb @ d6fb =====

void __h3000 FUN_d6fb(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D70C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 0;
                    /* WARNING: Could not recover jumptable at 0xd70a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d70c @ d70c =====

void __h3000 FUN_d70c(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  char cVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  cVar2 = FUN_dcb3();
  if ((extraout_CC >> 2 & 1) == 0) {
    *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  if (cVar2 != -0x60) {
    do {
      FUN_db0c();
      FUN_dab5();
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_d735;
                    /* WARNING: Could not recover jumptable at 0xd733. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d721 @ d721 =====

void __h3000 FUN_d721(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_3 + 3) = FUN_d72a;
                    /* WARNING: Could not recover jumptable at 0xd728. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000);
  return;
}


// ===== FUN_d72a @ d72a =====

void __h3000 FUN_d72a(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d735;
                    /* WARNING: Could not recover jumptable at 0xd733. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d735 @ d735 =====

void __h3000 FUN_d735(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1e)) {
    *(code **)(param_1 + 3) = FUN_d746;
                    /* WARNING: Could not recover jumptable at 0xd744. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d72a;
                    /* WARNING: Could not recover jumptable at 0xd728. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d746 @ d746 =====

void __h3000 FUN_d746(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_da39();
  *(code **)(param_1 + 3) = FUN_d735;
                    /* WARNING: Could not recover jumptable at 0xd733. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d74d @ d74d =====

void __h3000 FUN_d74d(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D70C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 2;
                    /* WARNING: Could not recover jumptable at 0xd75c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d75e @ d75e =====

void __h3000 FUN_d75e(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D70C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 4;
                    /* WARNING: Could not recover jumptable at 0xd76d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d76f @ d76f =====

void __h3000 FUN_d76f(undefined1 param_1,undefined1 param_2,short param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D70C $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x22) = 6;
                    /* WARNING: Could not recover jumptable at 0xd77e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d780 @ d780 =====

void __h3000 FUN_d780(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D794 $0000 */
  FUN_dc68();
  FUN_dd35(extraout_A,2);
  *(undefined1 *)(param_3 + 0x1e) = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd792. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d794 @ d794 =====

void __h3000 FUN_d794(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  char cVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  cVar2 = FUN_dcb3();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x60)) {
    *(code **)(param_1 + 3) = FUN_d7b9;
                    /* WARNING: Could not recover jumptable at 0xd7b7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d7a5 @ d7a5 =====

void __h3000 FUN_d7a5(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_3 + 3) = FUN_d7ae;
                    /* WARNING: Could not recover jumptable at 0xd7ac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000);
  return;
}


// ===== FUN_d7ae @ d7ae =====

void __h3000 FUN_d7ae(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d7b9;
                    /* WARNING: Could not recover jumptable at 0xd7b7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d7b9 @ d7b9 =====

void __h3000 FUN_d7b9(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1e)) {
    *(code **)(param_1 + 3) = FUN_d7ca;
                    /* WARNING: Could not recover jumptable at 0xd7c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d7ae;
                    /* WARNING: Could not recover jumptable at 0xd7ac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d7ca @ d7ca =====

void __h3000 FUN_d7ca(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_da39();
  *(code **)(param_1 + 3) = FUN_d7b9;
                    /* WARNING: Could not recover jumptable at 0xd7b7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d7d1 @ d7d1 =====

void __h3000 FUN_d7d1(undefined1 param_1,undefined1 param_2,short param_3,short param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + 0x1e) = *(undefined1 *)(param_4 + 7);
                    /* inline[addr:DC68]: $D7F1 $0000 */
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x26) = 1;
                    /* WARNING: Could not recover jumptable at 0xd7e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d7e8 @ d7e8 =====

void __h3000 FUN_d7e8(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
  *(undefined1 *)(param_3 + 0x1e) = extraout_B;
  FUN_dc68();
  *(undefined1 *)(param_3 + 0x26) = 1;
                    /* WARNING: Could not recover jumptable at 0xd7e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d7f1 @ d7f1 =====

void __h3000 FUN_d7f1(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  char cVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  cVar2 = FUN_dcb3();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x50)) {
    *(code **)(param_1 + 3) = FUN_d809;
                    /* WARNING: Could not recover jumptable at 0xd807. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d809 @ d809 =====

void __h3000 FUN_d809(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1e)) {
    *(code **)(param_1 + 3) = FUN_d81a;
                    /* WARNING: Could not recover jumptable at 0xd818. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d82a;
                    /* WARNING: Could not recover jumptable at 0xd828. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d81a @ d81a =====

void __h3000 FUN_d81a(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_da39();
  *(code **)(param_1 + 3) = FUN_d809;
                    /* WARNING: Could not recover jumptable at 0xd807. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d82a @ d82a =====

void __h3000 FUN_d82a(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d809;
                    /* WARNING: Could not recover jumptable at 0xd807. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d82e @ d82e =====

void __h3000 FUN_d82e(undefined1 param_1,undefined1 param_2,short param_3,short param_4)

{
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = *(char *)(param_4 + 7);
  *(char *)(param_3 + 0x1e) = cVar1;
  *(char *)(param_3 + 0x1f) = cVar1 + ' ';
                    /* inline[addr:DC68]: $D84E $0000 */
  FUN_dc68();
                    /* WARNING: Could not recover jumptable at 0xd843. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d845 @ d845 =====

void __h3000 FUN_d845(undefined1 param_1,undefined1 param_2,short param_3)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_dd35(2);
  *(char *)(param_3 + 0x1e) = extraout_B;
  *(char *)(param_3 + 0x1f) = extraout_B + ' ';
  FUN_dc68();
                    /* WARNING: Could not recover jumptable at 0xd843. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d84e @ d84e =====

void __h3000 FUN_d84e(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  char cVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  cVar2 = FUN_dcb3();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x50)) {
    *(code **)(param_1 + 3) = FUN_d866;
                    /* WARNING: Could not recover jumptable at 0xd864. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d866 @ d866 =====

void __h3000 FUN_d866(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1e)) {
    *(code **)(param_1 + 3) = FUN_d877;
                    /* WARNING: Could not recover jumptable at 0xd875. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(uVar1);
    return;
  }
  if ((char)in_D == *(char *)(param_1 + 0x1f)) {
    *(code **)(param_1 + 3) = FUN_d89d;
                    /* WARNING: Could not recover jumptable at 0xd89b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d8ae;
                    /* WARNING: Could not recover jumptable at 0xd8ac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1);
  return;
}


// ===== FUN_d877 @ d877 =====

void __h3000 FUN_d877(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x20) = (char)in_D;
  *(ushort *)(param_1 + 0x16) =
       CONCAT11(*(byte *)(param_1 + 0x20) >> 1,
                (char)(*(char *)(param_1 + 0x1d) << 1) >> 1 | *(byte *)(param_1 + 0x20) << 7);
  *(code **)(param_1 + 3) = FUN_d866;
                    /* WARNING: Could not recover jumptable at 0xd864. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d89d @ d89d =====

void __h3000 FUN_d89d(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1d) = (char)in_D;
  *(ushort *)(param_1 + 0x16) =
       CONCAT11(*(byte *)(param_1 + 0x20) >> 1,
                (char)(*(char *)(param_1 + 0x1d) << 1) >> 1 | *(byte *)(param_1 + 0x20) << 7);
  *(code **)(param_1 + 3) = FUN_d866;
                    /* WARNING: Could not recover jumptable at 0xd864. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8ae @ d8ae =====

void __h3000 FUN_d8ae(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d866;
                    /* WARNING: Could not recover jumptable at 0xd864. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8b2 @ d8b2 =====

void __h3000 FUN_d8b2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $D8C5 $0000 */
  FUN_dc68();
                    /* WARNING: Could not recover jumptable at 0xd8bb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d8bd @ d8bd =====

void __h3000 FUN_d8bd(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d8b2();
  *(undefined1 *)(param_3 + 0x25) = 0x10;
  FUN_dd35(2);
  *(undefined1 *)(param_3 + 0x1a) = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd659. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_d8c5 @ d8c5 =====

void __h3000 FUN_d8c5(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  char cVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  cVar2 = FUN_dcb3();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x30)) {
    *(code **)(param_1 + 3) = FUN_d8dd;
                    /* WARNING: Could not recover jumptable at 0xd8db. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d8dd @ d8dd =====

void __h3000 FUN_d8dd(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_da39();
  *(code **)(param_1 + 3) = FUN_d8dd;
                    /* WARNING: Could not recover jumptable at 0xd8db. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8e4 @ d8e4 =====

void __h3000 FUN_d8e4(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4)

{
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_3;
                    /* inline[addr:DC68]: $D920 $0000 */
  FUN_dc68();
  *(undefined1 *)(sVar1 + 0x22) = 0;
                    /* WARNING: Could not recover jumptable at 0xd8f3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d8f5 @ d8f5 =====

void __h3000 FUN_d8f5(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4)

{
  undefined1 extraout_B;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_3;
                    /* inline[addr:DC68]: $D920 $0000 */
  FUN_dc68();
  *(undefined1 *)(sVar1 + 0x22) = 1;
  FUN_dd35(2);
  *(undefined1 *)(sVar1 + 0x1e) = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xd90d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d90f @ d90f =====

void __h3000 FUN_d90f(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4)

{
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_3;
                    /* inline[addr:DC68]: $D920 $0000 */
  FUN_dc68();
  *(undefined1 *)(sVar1 + 0x22) = 2;
                    /* WARNING: Could not recover jumptable at 0xd91e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_d920 @ d920 =====

void __h3000 FUN_d920(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  char cVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  cVar2 = FUN_dcb3();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (cVar2 == -0x70) {
      if (*(char *)(param_1 + 0x22) == '\x02') {
        *(code **)(param_1 + 3) = FUN_d97a;
                    /* WARNING: Could not recover jumptable at 0xd978. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*UNRECOVERED_JUMPTABLE_00)(uVar1);
        return;
      }
      *(code **)(param_1 + 3) = FUN_d998;
                    /* WARNING: Could not recover jumptable at 0xd996. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE_00)(uVar1);
      return;
    }
    if (cVar2 == -0x80) {
      *(code **)(param_1 + 3) = FUN_d93c;
                    /* WARNING: Could not recover jumptable at 0xd93a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE_00)(uVar1);
      return;
    }
  }
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d93c @ d93c =====

void __h3000 FUN_d93c(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((*(char *)(param_1 + 0x22) == '\x01') && ((char)in_D != *(char *)(param_1 + 0x1e))) {
    *(code **)(param_1 + 3) = FUN_d965;
                    /* WARNING: Could not recover jumptable at 0xd963. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d955;
                    /* WARNING: Could not recover jumptable at 0xd953. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d955 @ d955 =====

void __h3000 FUN_d955(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_da39();
  *(code **)(param_1 + 3) = FUN_d93c;
                    /* WARNING: Could not recover jumptable at 0xd93a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d965 @ d965 =====

void __h3000 FUN_d965(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d93c;
                    /* WARNING: Could not recover jumptable at 0xd93a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d969 @ d969 =====

void __h3000 FUN_d969(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE_00;
  
  if (*(char *)(param_3 + 0x22) == '\x02') {
    *(code **)(param_3 + 3) = FUN_d97a;
                    /* WARNING: Could not recover jumptable at 0xd978. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000000);
    return;
  }
  *(code **)(param_3 + 3) = FUN_d998;
                    /* WARNING: Could not recover jumptable at 0xd996. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000000);
  return;
}


// ===== FUN_d97a @ d97a =====

void __h3000 FUN_d97a(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d985;
                    /* WARNING: Could not recover jumptable at 0xd983. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d985 @ d985 =====

void __h3000 FUN_d985(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D != '\0') {
    FUN_da39();
    FUN_d969();
    return;
  }
  if (*(char *)(param_1 + 0x22) == '\x02') {
    *(code **)(param_1 + 3) = FUN_d97a;
                    /* WARNING: Could not recover jumptable at 0xd978. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d998;
                    /* WARNING: Could not recover jumptable at 0xd996. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d998 @ d998 =====

void __h3000 FUN_d998(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d9a3;
                    /* WARNING: Could not recover jumptable at 0xd9a1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d9a3 @ d9a3 =====

void __h3000 FUN_d9a3(void)

{
  FUN_d969();
  return;
}


// ===== FUN_d9a7 @ d9a7 =====

void __h3000 FUN_d9a7(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $CAE5 $0000 */
  FUN_dc68();
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xd9b7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d9b9 @ d9b9 =====

void __h3000 FUN_d9b9(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:DC68]: $CAE5 $0000 */
  FUN_dc68();
  *(code **)(param_1 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xd9c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d9cb @ d9cb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xda2f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_d9cb(undefined2 param_1,undefined2 param_2,short param_3)

{
  ushort uVar1;
  undefined2 in_D;
  byte bVar4;
  undefined2 uVar2;
  undefined2 uVar3;
  char *pcVar5;
  short sVar6;
  undefined2 *puVar7;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar6 = param_3;
  FUN_8737();
  bVar4 = (byte)DAT_60eb;
  uVar1 = (ushort)DAT_60eb >> 8;
  *(byte *)(sVar6 + -1) = bVar4 << 3;
  *(byte *)(sVar6 + -2) =
       (((char)uVar1 << 1 | bVar4 >> 7) << 1 | (bVar4 & 0x7f) >> 6) << 1 | (bVar4 & 0x3f) >> 5;
  *(undefined1 *)(sVar6 + -3) = 0xc0;
  puVar7 = (undefined2 *)(sVar6 + -4);
  *(undefined1 *)puVar7 = 0x50;
  API_FCF2();
  DAT_60fe = *puVar7;
  puVar7 = puVar7 + 1;
  FUN_da31();
  uVar3 = DAT_60eb;
  *(char *)((short)puVar7 + -1) = (char)DAT_60eb;
  *(char *)(puVar7 + -1) = (char)((ushort)uVar3 >> 8);
  *(undefined1 *)((short)puVar7 + -3) = 6;
  puVar7 = puVar7 + -2;
  *(undefined1 *)puVar7 = 0;
  API_FCF4();
  *(undefined1 *)((short)puVar7 + -1) = 0xa9;
  puVar7 = puVar7 + -1;
  *(undefined1 *)puVar7 = 0x45;
  API_FCF2();
  DAT_6100 = FUN_da31((char)((ushort)*puVar7 >> 8));
  sVar6 = 0x13;
  pcVar5 = &DAT_6b00;
  uVar3 = DAT_6100;
  do {
    uVar2 = DAT_60fe;
    if ((*pcVar5 == '(') || (uVar2 = DAT_6100, *pcVar5 == ')')) {
      *(undefined2 *)(pcVar5 + 0x16) = uVar2;
      uVar3 = uVar2;
    }
    pcVar5 = pcVar5 + 0x30;
    sVar6 = sVar6 + -1;
  } while (sVar6 != 0);
                    /* WARNING: Could not recover jumptable at 0xda2f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_da31 @ da31 =====

void __h3000 FUN_da31(void)

{
  return;
}


// ===== FUN_da39 @ da39 =====

void __h3000 FUN_da39(undefined1 param_1,byte param_2,short param_3)

{
  byte bVar2;
  undefined2 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  if (*(char *)(param_3 + 0x25) == '\0') {
    bVar2 = FUN_da95();
    if ((extraout_CC >> 2 & 1) == 0) {
      if (0x3f < bVar2) goto LAB_da83;
      goto LAB_da6c;
    }
    uVar1 = CONCAT11(bVar2 >> 1,(char)(bVar2 << 1) >> 1 | bVar2 << 7);
    goto LAB_da48;
  }
  if (*(char *)(param_3 + 0x26) == '\0') {
    if (*(byte *)(param_3 + 0x1a) <= param_2) goto LAB_da7c;
  }
  else if ((char)((param_2 < 0x40) + (param_2 == 0x40)) == '\0') {
LAB_da7c:
    uVar1 = FUN_da95(0x3f);
    if (!(bool)(extraout_CC_01 >> 2 & 1)) {
LAB_da83:
      if ((*(byte *)(param_3 + 0x25) & 1) != 0) {
        return;
      }
      *(byte *)(param_3 + 0x25) = *(byte *)(param_3 + 0x25) | 1;
      FUN_da9f();
      return;
    }
    goto LAB_da48;
  }
  uVar1 = FUN_da95(0);
  if (!(bool)(extraout_CC_00 >> 2 & 1)) {
LAB_da6c:
    if ((*(byte *)(param_3 + 0x25) & 1) == 0) {
      return;
    }
    *(byte *)(param_3 + 0x25) = *(byte *)(param_3 + 0x25) & 0xfe;
    return;
  }
LAB_da48:
  *(undefined2 *)(param_3 + 0x16) = uVar1;
  return;
}


// ===== FUN_da95 @ da95 =====

void __h3000 FUN_da95(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xda9d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_da9f @ da9f =====

void __h3000
FUN_da9f(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4,undefined2 param_5)

{
  undefined2 *puVar1;
  undefined1 uStack_8;
  undefined1 uStack_7;
  short sStack_6;
  undefined2 uStack_4;
  undefined2 uStack_2;
  
  uStack_2 = param_5;
  uStack_4 = param_4;
  sStack_6 = param_3;
  uStack_7 = param_2;
  puVar1 = (undefined2 *)&uStack_8;
  if (DAT_60fc != '\0') {
    BankPushSelect(param_1,DAT_6024);
    (**(code **)(param_3 + 0x11))();
    BankPop();
    puVar1 = &uStack_4;
  }
                    /* WARNING: Could not recover jumptable at 0xdab3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)((short)puVar1 + 8))
            (*(undefined1 *)puVar1,*(undefined1 *)((short)puVar1 + 1),
             *(undefined2 *)((short)puVar1 + 2),*(undefined2 *)((short)puVar1 + 4),
             *(undefined2 *)((short)puVar1 + 6));
  return;
}


// ===== FUN_dab5 @ dab5 =====

void __h3000 FUN_dab5(char param_1,char param_2,short param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((param_2 == -0x80) || (param_1 == '\0')) goto LAB_db06;
  *(char *)(param_3 + 0x1d) = param_1;
  switch(*(byte *)(param_3 + 0x22) & 6) {
  case 2:
code_r0xdaec:
    if (*(char *)(param_3 + 0x1f) != '\x01') goto LAB_db06;
    break;
  case 4:
    if (*(byte *)(param_3 + 0x20) <= *(byte *)(param_3 + 0x1e)) {
      switchD_dacc::caseD_2();
      return;
    }
    break;
  case 6:
    if ((char)((*(byte *)(param_3 + 0x1e) < *(byte *)(param_3 + 0x20)) +
              (*(byte *)(param_3 + 0x1e) == *(byte *)(param_3 + 0x20))) != '\0') goto code_r0xdaec;
  }
  *(undefined1 *)(param_3 + 0x1e) = *(undefined1 *)(param_3 + 0x20);
  *(undefined1 *)(param_3 + 0x21) = *(undefined1 *)(param_3 + 0x1d);
LAB_db06:
                    /* WARNING: Could not recover jumptable at 0xdb06. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== caseD_6 @ dae2 =====

void __h3000 switchD_dacc::caseD_6(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  if (((char)((*(byte *)(param_3 + 0x1e) < *(byte *)(param_3 + 0x20)) +
             (*(byte *)(param_3 + 0x1e) == *(byte *)(param_3 + 0x20))) == '\0') ||
     (*(char *)(param_3 + 0x1f) == '\x01')) {
    *(undefined1 *)(param_3 + 0x1e) = *(undefined1 *)(param_3 + 0x20);
    *(undefined1 *)(param_3 + 0x21) = *(undefined1 *)(param_3 + 0x1d);
  }
                    /* WARNING: Could not recover jumptable at 0xdb06. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,param_3,in_stack_00000002);
  return;
}


// ===== caseD_2 @ daec =====

void __h3000 switchD_dacc::caseD_2(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  if (*(char *)(param_3 + 0x1f) == '\x01') {
    *(undefined1 *)(param_3 + 0x1e) = *(undefined1 *)(param_3 + 0x20);
    *(undefined1 *)(param_3 + 0x21) = *(undefined1 *)(param_3 + 0x1d);
  }
                    /* WARNING: Could not recover jumptable at 0xdb06. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,param_3,in_stack_00000002);
  return;
}


// ===== FUN_db0c @ db0c =====

void __h3000 FUN_db0c(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE_00;
  
  *(undefined1 *)(param_3 + 0x1d) = param_2;
  *(undefined2 *)(param_3 + 0x1b) = in_stack_00000000;
  if (*(char *)(param_3 + 0x1d) == -0x80) {
    *(code **)(param_3 + 3) = FUN_db6a;
                    /* WARNING: Could not recover jumptable at 0xdb68. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000002);
    return;
  }
  if (*(char *)(param_3 + 0x1d) != -0x70) {
    FUN_dcd4();
    return;
  }
  *(code **)(param_3 + 3) = FUN_db2e;
                    /* WARNING: Could not recover jumptable at 0xdb2c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000002);
  return;
}


// ===== FUN_db2e @ db2e =====

void __h3000 FUN_db2e(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1d) = (char)in_D;
  *(code **)(param_1 + 3) = FUN_db3d;
                    /* WARNING: Could not recover jumptable at 0xdb3b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_db3d @ db3d =====

void __h3000 FUN_db3d(undefined1 param_1,char param_2,short param_3)

{
  char extraout_A;
  
  if (param_2 == '\0') {
    if ((DAT_6117 & 2) != 0) {
      FUN_db86(0);
      param_2 = extraout_A;
    }
  }
  else {
    *(char *)(param_3 + 0x1f) = *(char *)(param_3 + 0x1f) + '\x01';
    *(undefined1 *)(param_3 + 0x20) = *(undefined1 *)(param_3 + 0x1d);
  }
                    /* WARNING: Could not recover jumptable at 0xdb52. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(param_3 + 0x1b))(param_2,0x90);
  return;
}


// ===== FUN_db6a @ db6a =====

void __h3000 FUN_db6a(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_db75;
                    /* WARNING: Could not recover jumptable at 0xdb73. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_db75 @ db75 =====

void __h3000 FUN_db75(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_A;
  
  if ((DAT_6117 & 1) != 0) {
    FUN_db86();
    param_1 = extraout_A;
  }
                    /* WARNING: Could not recover jumptable at 0xdb82. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(param_3 + 0x1b))(param_1,0x80);
  return;
}


// ===== FUN_db86 @ db86 =====

void __h3000 FUN_db86(undefined1 param_1,undefined1 param_2,short param_3)

{
  if (*(char *)(param_3 + 0x1f) != '\0') {
    *(char *)(param_3 + 0x1f) = *(char *)(param_3 + 0x1f) + -1;
  }
  return;
}


// ===== FUN_db91 @ db91 =====

void __h3000 FUN_db91(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined2 *)(param_3 + 0x1b) = in_stack_00000000;
  *(code **)(param_3 + 3) = FUN_dba0;
                    /* WARNING: Could not recover jumptable at 0xdb9e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000002);
  return;
}


// ===== FUN_dba0 @ dba0 =====

void __h3000 FUN_dba0(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1d) = (char)in_D;
  *(code **)(param_1 + 3) = FUN_dbaf;
                    /* WARNING: Could not recover jumptable at 0xdbad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_dbaf @ dbaf =====

void __h3000 FUN_dbaf(undefined1 param_1,byte param_2,short param_3)

{
  short sVar1;
  
  sVar1 = CONCAT11(param_2 >> 1,(char)(*(char *)(param_3 + 0x1d) << 1) >> 1 | param_2 << 7);
  if (sVar1 == 0) {
    sVar1 = 0;
  }
                    /* WARNING: Could not recover jumptable at 0xdbc3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(param_3 + 0x1b))((char)((ushort)sVar1 >> 8));
  return;
}


// ===== FUN_dbc7 @ dbc7 =====

ushort __h3000 FUN_dbc7(undefined1 param_1,undefined1 param_2,char *param_3)

{
  byte bVar1;
  char cVar2;
  ushort uVar3;
  short sVar4;
  byte extraout_CC;
  
  FUN_da95();
  if ((bool)(extraout_CC >> 2 & 1)) {
    sVar4 = CONCAT11((byte)param_3[0x1e] >> 1,param_3[0x1e] << 7);
    if (param_3[0x22] < '\0') {
      return sVar4 + *(short *)(param_3 + 0x23);
    }
    uVar3 = sVar4 + *(short *)(param_3 + 0x23);
    if ((short)uVar3 < 0) {
      uVar3 = 0;
    }
    if ((uVar3 & 0x4000) != 0) {
      uVar3 = 0x3fff;
    }
  }
  else {
    bVar1 = param_3[0x1e];
    cVar2 = *param_3;
    uVar3 = CONCAT11(bVar1,cVar2);
    if (cVar2 == 'C') {
      if (bVar1 != param_3[0x1a]) {
        return uVar3;
      }
    }
    else if (cVar2 == 'D') {
      if (bVar1 < (byte)param_3[0x1a]) {
        return uVar3;
      }
    }
    else if ((cVar2 == 'E') &&
            ((char)((bVar1 < (byte)param_3[0x1a]) + (bVar1 == param_3[0x1a])) == '\0')) {
      return uVar3;
    }
    uVar3 = FUN_da9f();
  }
  return uVar3;
}


// ===== FUN_dbff @ dbff =====

ushort __h3000
FUN_dbff(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4,short param_5)

{
  undefined2 uVar1;
  ushort uVar2;
  short sVar3;
  byte extraout_CC;
  undefined2 *puVar4;
  
  uVar2 = FUN_da95();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (uVar2 == 0) {
      uVar2 = 1;
    }
    *(ushort *)(param_5 + -2) = uVar2 + 0xe000;
    uVar1 = *(undefined2 *)(param_3 + 0x25);
    *(char *)(param_5 + -3) = (char)uVar1;
    puVar4 = (undefined2 *)(param_5 + -4);
    *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
    API_FCF2();
    *(undefined2 *)(param_3 + 0x23) = *puVar4;
    sVar3 = CONCAT11(*(byte *)(param_3 + 0x1e) >> 1,*(byte *)(param_3 + 0x1e) << 7);
    if (*(char *)(param_3 + 0x22) < '\0') {
      return sVar3 + *(short *)(param_3 + 0x23);
    }
    uVar2 = sVar3 + *(short *)(param_3 + 0x23);
    if ((short)uVar2 < 0) {
      uVar2 = 0;
    }
    if ((uVar2 & 0x4000) != 0) {
      uVar2 = 0x3fff;
    }
  }
  return uVar2;
}


// ===== FUN_dc44 @ dc44 =====

void __h3000 FUN_dc44(short param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  byte bVar1;
  byte *pbVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = FUN_dd35(2);
  *(byte *)(param_3 + -1) = bVar1 << 7;
  pbVar2 = (byte *)(param_3 + -2);
  *pbVar2 = bVar1 >> 1;
                    /* inline[API_FE20]: interp table, 5 points */
  InterpTableLookup();
  *(undefined2 *)(param_1 + 0x25) = *(undefined2 *)pbVar2;
                    /* WARNING: Could not recover jumptable at 0xdc66. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_dc68 @ dc68 =====

void __h3000 FUN_dc68(byte *param_1)

{
  undefined2 in_D;
  byte bVar1;
  undefined2 *local_res0;
  
  *(undefined2 *)(param_1 + 1) = *local_res0;
  *(undefined2 *)(param_1 + 0x16) = local_res0[1];
  bVar1 = FUN_dd35(1);
  param_1[0x19] = bVar1 & 0xf;
  bVar1 = FUN_dd35(0);
  *param_1 = *param_1 & 0xc0 | bVar1 & 0x3f;
  bVar1 = FUN_dd35(2);
  param_1[0x1a] = bVar1;
  param_1[0x22] = 0;
  param_1[0x25] = 0;
  param_1[0x26] = 0;
                    /* WARNING: Could not recover jumptable at 0xdcb1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(local_res0 + 2))((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_dcb3 @ dcb3 =====

void __h3000 FUN_dcb3(void)

{
  return;
}


// ===== FUN_dcd4 @ dcd4 =====

void __h3000 FUN_dcd4(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_3 + 3) = FUN_cae5;
                    /* WARNING: Could not recover jumptable at 0xdcdb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000);
  return;
}


// ===== FUN_dcdd @ dcdd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_dcdd(byte *param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((*param_1 & 0xc0) == 0) {
    DAT_61f0 = DAT_61ea;
    DAT_61f2 = DAT_61ec;
                    /* inline[addr:9AF3]: $0000 $0036 */
    FUN_9af3(0,*param_1 & 0x3f,param_1,&UNK_d0ef);
  }
  else {
    DAT_61f0 = DAT_61ed;
    DAT_61f2 = DAT_61ef;
                    /* inline[addr:9AF3]: $0000 $0012 */
    FUN_9af3(0,*param_1 & 0x3f,param_1,&UNK_d34c);
  }
                    /* WARNING: Could not recover jumptable at 0xdd2a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_dd2c @ dd2c =====

byte __h3000 FUN_dd2c(undefined1 param_1,byte param_2)

{
  param_2 = param_2 & 0x3f;
  if (!(bool)((param_2 < 0x36) + (param_2 == 0x36))) {
    param_2 = 0x36;
  }
  return param_2;
}


// ===== FUN_dd35 @ dd35 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdd46 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_dd35(short param_1)

{
  char cVar1;
  char cVar2;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = (char)((ushort)in_D >> 8);
  cVar1 = cVar2 + *(char *)(param_1 + 0x13);
  API_FC7C(0,cVar1,cVar1);
                    /* WARNING: Could not recover jumptable at 0xdd46. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(cVar2,(char)in_D,param_1);
  return;
}


// ===== FUN_dd48 @ dd48 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdd5c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_dd48(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
                    /* WARNING: Could not recover jumptable at 0xdd5c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_dd5e @ dd5e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdd99 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_dd5e(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  char cVar3;
  char cVar4;
  undefined2 uVar2;
  char *pcVar5;
  char *pcVar6;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = 0x13;
  pcVar5 = &DAT_6b00;
  do {
    cVar3 = (char)uVar2;
    uVar2 = 6;
    pcVar6 = "1a\ba\x1da&2a\na\x1ea(3a\fa\x1fa*4a\x0ea a,5a\x10a!a.6a\x12a\"a0K";
    do {
      cVar4 = (char)uVar2;
      if (*pcVar5 == *pcVar6) {
        bVar1 = (byte)((ushort)**(undefined2 **)(pcVar6 + 1) >> 8);
        uVar2 = CONCAT11(bVar1 >> 1,(char)**(undefined2 **)(pcVar6 + 1) >> 1 | bVar1 << 7);
        *(undefined2 *)(pcVar5 + 0x16) = uVar2;
      }
      pcVar6 = pcVar6 + 7;
    } while (cVar4 != '\x01');
    pcVar5 = pcVar5 + 0x30;
  } while (cVar3 != '\x01');
                    /* WARNING: Could not recover jumptable at 0xdd99. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2);
  return;
}


// ===== FUN_dd9b @ dd9b =====

void __h3000 FUN_dd9b(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  char extraout_A;
  char cVar2;
  char extraout_B;
  char *pcVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = 'K';
  cVar2 = '\x13';
  pcVar3 = &DAT_6b00;
  do {
    if (cVar1 == *pcVar3) {
      FUN_da9f();
      cVar1 = extraout_A;
      cVar2 = extraout_B;
    }
    pcVar3 = pcVar3 + 0x30;
    cVar2 = cVar2 + -1;
  } while (cVar2 != '\0');
                    /* WARNING: Could not recover jumptable at 0xddb4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_ddb6 @ ddb6 =====

void __h3000 FUN_ddb6(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined4 uVar1;
  char extraout_A;
  char cVar2;
  char cVar3;
  char extraout_B;
  char *pcVar4;
  undefined1 in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 auStack_4 [2];
  undefined2 uStack_2;
  
  _auStack_4 = CONCAT22(param_3,param_4);
  uVar1 = _auStack_4;
  BankPushSelect(param_1,DAT_6024);
  cVar2 = 'L';
  cVar3 = '\x13';
  pcVar4 = &DAT_6b00;
  do {
    if (cVar2 == *pcVar4) {
      FUN_da9f();
      cVar2 = extraout_A;
      cVar3 = extraout_B;
    }
    pcVar4 = pcVar4 + 0x30;
    cVar3 = cVar3 + -1;
  } while (cVar3 != '\0');
  auStack_4[0] = (undefined1)((ushort)param_3 >> 8);
  stack0xfffd = SUB42(uVar1,1);
                    /* WARNING: Could not recover jumptable at 0xddb4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            (param_2,auStack_4[0],stack0xfffd,CONCAT11((char)param_4,in_stack_00000000));
  return;
}


// ===== FUN_ddc3 @ ddc3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xddf0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ddc3(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined1 *puVar1;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar1 = &DAT_de1f;
  sVar2 = 6;
  do {
    **(undefined2 **)(puVar1 + 1) = 0;
    puVar1 = puVar1 + 7;
    sVar2 = sVar2 + -1;
  } while (sVar2 != 0);
  puVar1 = &DAT_de1f;
  sVar2 = 8;
  do {
    **(undefined1 **)(puVar1 + 3) = 0xff;
    puVar1 = puVar1 + 7;
    sVar2 = sVar2 + -1;
  } while (sVar2 != 0);
                    /* WARNING: Could not recover jumptable at 0xddf0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_ddf2 @ ddf2 =====

void __h3000 FUN_ddf2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0xddff. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_de01 @ de01 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xde1d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_de01(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  short sVar1;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_4;
  BankPushSelect();
  API_FC3A(0,0x1c,**(undefined2 **)(&DAT_de24 + *(char *)(sVar1 + 7)));
  BankPop();
                    /* WARNING: Could not recover jumptable at 0xde1d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)param_4 >> 8),param_2,in_stack_00000000,in_stack_00000002)
  ;
  return;
}


// ===== API_FD86 @ de57 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xde7c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FD86(short param_1)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_1;
                    /* inline[API_FDD6]: $6024 */
  API_FDD6();
  API_FC7C(0,*(undefined1 *)(sVar1 + 0x13),*(undefined1 *)(sVar1 + 0x13));
  *(code **)(param_1 + 1) = FUN_cae5;
  *(code **)(param_1 + 3) = FUN_cae5;
  FUN_d4a7();
                    /* WARNING: Could not recover jumptable at 0xde7c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_de7e @ de7e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xde98 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_de7e(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDD4();
  DAT_6030 = API_FE34;
  DAT_61f3 = 0;
  DAT_61f4 = 0;
  DAT_6074 = 0;
  FUN_de9a();
                    /* WARNING: Could not recover jumptable at 0xde98. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_de9a @ de9a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xded7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_de9a(undefined2 param_1)

{
  byte bVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDD4();
  bVar1 = DAT_61f3;
  DAT_6074 = (ushort)DAT_61f3;
                    /* inline[API_FC16]: 01 20 02 96 01 00 03 00 $0012 $0000 $0000 ->$0000 ->$0020
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_df5e();
                    /* inline[API_FC8A]: ->$DE9A(rel) "( Parmtr )" */
  SoftKeyDefine();
  FUN_ded9();
                    /* WARNING: Could not recover jumptable at 0xded7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1);
  return;
}


// ===== FUN_ded9 @ ded9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdf16 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ded9(undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4)

{
  undefined2 uVar1;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_df2d((char)((ushort)DAT_6074 >> 8));
  DAT_6074 = uVar1;
  API_FC14();
  FUN_df70();
  FUN_df18();
  DAT_61f3 = (char)uVar1;
  DAT_61f4 = param_3;
  LcdSetCursor();
  FUN_df4d();
  BankPushSelect();
  (**(code **)(param_3 + 5))();
  (**(code **)(param_3 + 7))();
  BankPop();
  API_FDF2();
  API_FE32();
                    /* WARNING: Could not recover jumptable at 0xdf16. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)param_4 >> 8),(char)uVar1,in_stack_00000000,in_stack_00000002);
  return;
}


// ===== FUN_df18 @ df18 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdf2b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_df18(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6040 = FUN_cae5;
  DAT_6042 = FUN_cae5;
                    /* inline[API_FC38]: "{2:3C}{5:14}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xdf2b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_df2d @ df2d =====

void __h3000 FUN_df2d(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FE5C]: $0012 $0004 */
  API_FE5C(0);
                    /* WARNING: Could not recover jumptable at 0xdf37. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,extraout_B,param_3);
  return;
}


// ===== FUN_df39 @ df39 =====

void __h3000 FUN_df39(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_df70();
                    /* WARNING: Could not recover jumptable at 0xdf4b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_df4d @ df4d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdf5c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_df4d(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC3A(0,8,DAT_61f4 + 9);
                    /* WARNING: Could not recover jumptable at 0xdf5c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_df5e @ df5e =====

void __h3000 FUN_df5e(void)

{
                    /* inline[API_FC38]: "{1}         -> " */
  LcdPrintInline();
  return;
}


// ===== FUN_df70 @ df70 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdf7a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_df70(void)

{
  ushort in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = (in_D & 0xff) * 0x30;
                    /* WARNING: Could not recover jumptable at 0xdf7a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8),(char)sVar1,&DAT_6b00 + sVar1);
  return;
}


// ===== API_FE0A @ df7c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xdfd1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FE0A(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  char cVar2;
  short sVar1;
  char *pcVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD0C]: $0009 20 */
  cVar2 = MemsetInline();
  pcVar3 = 
  "<Mid. EA440 QA880 ]A1760iA3520uA70409A220 -A110 !A55  \x15A27.5\tA13.70TenorHTreb.7Fidl.0Gamt.";
  do {
    if (cVar2 == *pcVar3) {
      API_FD04(0,5,pcVar3 + 1,0x60a6);
      break;
    }
    pcVar3 = pcVar3 + 6;
  } while (pcVar3 != &DAT_e039);
  *(char *)(param_3 + -1) = cVar2;
  *(undefined1 *)(param_3 + -2) = 0;
  *(undefined1 *)(param_3 + -3) = 0xc;
  psVar4 = (short *)(param_3 + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEA();
  DAT_60ad = (&DAT_e039)[*psVar4];
  cVar2 = (char)psVar4[1] << 1;
  sVar1 = CONCAT11((char)((ushort)psVar4[1] >> 8),cVar2);
  DAT_60ab = (&DAT_e044)[sVar1];
  DAT_60ac = (&DAT_e045)[sVar1];
                    /* WARNING: Could not recover jumptable at 0xdfd1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar2,param_1,param_2,psVar4 + 2);
  return;
}


// ===== FUN_e064 @ e064 =====

void __h3000 FUN_e064(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61a6 = g_curBank;
                    /* inline[API_FD26]: $000E $6151 */
  FarCallInline();
                    /* WARNING: Could not recover jumptable at 0xe073. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e075 @ e075 =====

void __h3000 FUN_e075(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_e07e();
  DAT_6105 = 0;
                    /* WARNING: Could not recover jumptable at 0xe07c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e07e @ e07e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe086 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e07e(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = 0;
                    /* WARNING: Could not recover jumptable at 0xe086. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e088 @ e088 =====

void __h3000 FUN_e088(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6105 != '\0') {
    DAT_611c = *(undefined1 *)(param_4 + 7);
                    /* inline[API_FD26]: $0010 $6151 */
    FarCallInline();
  }
                    /* WARNING: Could not recover jumptable at 0xe09d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e09f @ e09f =====

void __h3000 FUN_e09f(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6105 != '\0') {
                    /* inline[API_FD26]: $0012 $6151 */
    FarCallInline();
  }
                    /* WARNING: Could not recover jumptable at 0xe0ad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e143 @ e143 =====

void __h3000 FUN_e143(void)

{
  if (DAT_6105 != '\0') {
                    /* inline[API_FC8A]: ->$E15D(rel) "(FuncGen )" */
    SoftKeyDefine();
  }
  return;
}


// ===== FUN_e15d @ e15d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe198 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e15d(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0x98;
                    /* inline[API_FC38]: "{1}Function Generator Parameters" */
  LcdPrintInline();
  API_FDC8(0xe1);
  DAT_6030 = API_FDCA;
  DAT_6036 = API_FDCA;
                    /* WARNING: Could not recover jumptable at 0xe198. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e42a @ e42a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe455 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e42a(undefined2 param_1,undefined2 param_2)

{
  ushort in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = (in_D & 0xff) * 0x17;
  DAT_61f8 = "Turned Off          "[sVar1 + 0x15];
  DAT_61f9 = (&DAT_e274)[sVar1] & 7;
  DAT_6203 = (&DAT_e274)[sVar1] & 0x10;
  DAT_6200 = 0;
  DAT_6204 = 0xff;
                    /* WARNING: Could not recover jumptable at 0xe455. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8),DAT_61f9,param_1,param_2);
  return;
}


// ===== FUN_e457 @ e457 =====

void __h3000 FUN_e457(void)

{
                    /* inline[API_FC8A]: ->$E467(rel) "( Amount )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_e467 @ e467 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe4cf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e467(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined2 uStack_8;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_60fb = 0x9a;
  API_FDF2();
  API_FE32();
                    /* inline[API_FC38]: "{2:00}{5:28}Amount of Modulation =" */
  LcdPrintInline();
  API_FC7C(uVar1,5,DAT_6106 + 5);
  uStack_8 = (short)(char)in_D;
  sVar2 = FUN_e52d();
                    /* inline[addr:9AF3]: $0000 $0064 */
  uVar3 = FUN_9af3((char)((ushort)(sVar2 + uStack_8) >> 8));
  DAT_6074 = uVar3;
                    /* inline[API_FC16]: 01 28 02 64 01 00 03 00 $0064 $0000 $0000 ->$000F ->$001A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_e4d1();
                    /* WARNING: Could not recover jumptable at 0xe4cf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)uVar3,param_1,param_2);
  return;
}


// ===== FUN_e4d1 @ e4d1 =====

void __h3000 FUN_e4d1(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:16}{3:609F}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xe4dc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e4de @ e4de =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe50c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e4de(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE40((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,&UNK_201a);
  sVar1 = FUN_e52d();
                    /* inline[addr:9AF3]: $0000 $0064 */
  FUN_9af3((char)((ushort)(DAT_6074 - sVar1) >> 8));
  API_FC80();
  FUN_e5c3((char)((ushort)DAT_6074 >> 8));
                    /* WARNING: Could not recover jumptable at 0xe50c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_e50e @ e50e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe525 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e50e(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  ushort in_D;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)(in_D >> 8);
  if (DAT_60fb != -0x66) {
    uVar2 = API_FC88();
    in_D = uVar2 & 0xff;
    FUN_9101((char)(uVar2 >> 8),(char)uVar2,&UNK_e527);
  }
  FUN_8db5(uVar1);
                    /* WARNING: Could not recover jumptable at 0xe525. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e52d @ e52d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe548 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_e52d(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  ushort uVar1;
  byte bVar2;
  byte *pbVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
  *(char *)(param_5 + -1) = param_2;
  *(char *)(param_5 + -2) = param_2 >> 7;
  bVar2 = (byte)DAT_6e14;
  uVar1 = (ushort)DAT_6e14 >> 8;
  *(byte *)(param_5 + -3) = bVar2 << 1;
  pbVar3 = (byte *)(param_5 + -4);
  *pbVar3 = (char)uVar1 << 1 | bVar2 >> 7;
  API_FCF2();
                    /* WARNING: Could not recover jumptable at 0xe548. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)*(undefined2 *)pbVar3 >> 8),param_2,param_3,param_4,pbVar3 + 2);
  return;
}


// ===== FUN_e54a @ e54a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe578 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e54a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = FUN_e52d();
  API_FC7C((char)((ushort)sVar1 >> 8),5,DAT_6106 + 5);
  extraout_B = (char)sVar1;
                    /* inline[addr:9AF3]: $0000 $0064 */
  FUN_9af3((char)((ushort)(extraout_B + sVar1) >> 8));
  FUN_e5c3();
  if (DAT_60fb == -0x66) {
    DAT_6074 = (short)extraout_B;
    API_FC14();
    FUN_e4d1();
  }
                    /* WARNING: Could not recover jumptable at 0xe578. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),extraout_B,param_1,param_2);
  return;
}


// ===== FUN_e57a @ e57a =====

void __h3000 FUN_e57a(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$E58F(rel) "( Amount )" */
  SoftKeyDefine(param_1,2);
                    /* WARNING: Could not recover jumptable at 0xe58d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_e58f @ e58f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe5af */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e58f(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
  DAT_6074 = (short)(char)in_D;
  FUN_e76c();
  DAT_6072 = FUN_e5b1;
                    /* inline[addr:9CCC]: ->$E5B1(rel) $6072 */
  FUN_9ccc();
                    /* WARNING: Could not recover jumptable at 0xe5af. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e5b1 @ e5b1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe5c1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e5b1(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),uVar1,param_1,DAT_6106 + 0x28);
                    /* WARNING: Could not recover jumptable at 0xe5c1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2);
  return;
}


// ===== FUN_e5c3 @ e5c3 =====

void __h3000 FUN_e5c3(void)

{
  ushort in_D;
  short in_U;
  undefined2 *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  *(ushort *)(in_U + -2) = (in_D & 0xff) * 200;
  *(undefined1 *)(in_U + -3) = 0xda;
  puVar1 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar1 = 0x68;
  API_FCF2();
  DAT_61fa = *puVar1;
                    /* WARNING: Could not recover jumptable at 0xe5d7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
  return;
}


// ===== FUN_e5d9 @ e5d9 =====

void __h3000 FUN_e5d9(void)

{
                    /* inline[API_FC8A]: ->$E5E9(rel) "(  Rate  )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_e5e9 @ e5e9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe653 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e5e9(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  short sVar2;
  undefined2 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  DAT_60fb = 0x9b;
                    /* inline[API_FC38]: "{2:00}{5:28}Rate of Modulation ={2:1A} Hz" */
  LcdPrintInline();
  sVar1 = FUN_e6b1();
  sVar2 = API_FC7E((char)((ushort)sVar1 >> 8),6,DAT_6106 + 6);
                    /* inline[addr:9AF3]: $0000 $07D0 */
  uVar3 = FUN_9af3((char)((ushort)(sVar2 + sVar1) >> 8));
  DAT_6074 = uVar3;
                    /* inline[API_FC16]: 05 01 02 0A 01 02 04 00 $07D0 $0000 $0000 ->$000F ->$001A
                       $000A $0001 $0000 */
  SetupParamEditPage();
  FUN_e655();
                    /* WARNING: Could not recover jumptable at 0xe653. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar3,param_1,param_2);
  return;
}


// ===== FUN_e655 @ e655 =====

void __h3000 FUN_e655(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:15}{3:609E}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xe660. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e662 @ e662 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe690 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e662(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE40((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,&UNK_2019);
  sVar1 = FUN_e6b1();
                    /* inline[addr:9AF3]: $0000 $07D0 */
  FUN_9af3((char)((ushort)(DAT_6074 - sVar1) >> 8));
  API_FC82();
  FUN_e759((char)((ushort)DAT_6074 >> 8));
                    /* WARNING: Could not recover jumptable at 0xe690. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_e692 @ e692 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe6a9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e692(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  ushort in_D;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)(in_D >> 8);
  if (DAT_60fb != -0x65) {
    uVar2 = API_FC88();
    in_D = uVar2 & 0xff;
    FUN_9101((char)(uVar2 >> 8),(char)uVar2,&UNK_e6ab);
  }
  FUN_8db5(uVar1);
                    /* WARNING: Could not recover jumptable at 0xe6a9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e6b1 @ e6b1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe6d4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_e6b1(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  ushort uVar1;
  byte bVar2;
  undefined1 *puVar3;
  byte *pbVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
  *(char *)(param_5 + -1) = param_2;
  *(char *)(param_5 + -2) = param_2 >> 7;
  *(undefined1 *)(param_5 + -3) = 0x14;
  puVar3 = (undefined1 *)(param_5 + -4);
  *puVar3 = 0;
  API_FCEC();
  bVar2 = (byte)DAT_6e44;
  uVar1 = (ushort)DAT_6e44 >> 8;
  puVar3[-1] = bVar2 << 1;
  pbVar4 = puVar3 + -2;
  *pbVar4 = (char)uVar1 << 1 | bVar2 >> 7;
  API_FCF2();
                    /* WARNING: Could not recover jumptable at 0xe6d4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)*(undefined2 *)pbVar4 >> 8),param_2,param_3,param_4,pbVar4 + 2);
  return;
}


// ===== FUN_e6d6 @ e6d6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe706 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e6d6(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  short sVar2;
  undefined2 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = FUN_e6b1();
  sVar2 = API_FC7E((char)((ushort)sVar1 >> 8),6,DAT_6106 + 6);
                    /* inline[addr:9AF3]: $0000 $07D0 */
  FUN_9af3((char)((ushort)(sVar2 + sVar1) >> 8));
  uVar3 = FUN_e759();
  if (DAT_60fb == -0x65) {
    DAT_6074 = uVar3;
    API_FC14();
    FUN_e655();
  }
                    /* WARNING: Could not recover jumptable at 0xe706. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar3,param_1,param_2);
  return;
}


// ===== FUN_e708 @ e708 =====

void __h3000 FUN_e708(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$E71D(rel) "( Amount )" */
  SoftKeyDefine(param_1,2);
                    /* WARNING: Could not recover jumptable at 0xe71b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_e71d @ e71d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe745 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e71d(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  API_FDF2();
  API_FE32();
  API_FC7C(uVar1,0x29,DAT_6106 + 0x29);
  DAT_6074 = (short)(char)in_D;
  FUN_e76c();
  DAT_6072 = FUN_e747;
                    /* inline[addr:9CCC]: ->$E747(rel) $6072 */
  FUN_9ccc();
                    /* WARNING: Could not recover jumptable at 0xe745. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e747 @ e747 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe757 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e747(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),uVar1,param_1,DAT_6106 + 0x29);
                    /* WARNING: Could not recover jumptable at 0xe757. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2);
  return;
}


// ===== FUN_e759 @ e759 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe76a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e759(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  *(char *)(param_3 + -1) = (char)in_D;
  *(undefined1 *)(param_3 + -2) = uVar1;
  *(undefined1 *)(param_3 + -3) = 0xbd;
  puVar2 = (undefined2 *)(param_3 + -4);
  *(undefined1 *)puVar2 = 0x79;
  API_FCF2();
  DAT_61fc = *puVar2;
                    /* WARNING: Could not recover jumptable at 0xe76a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2,puVar2 + 1);
  return;
}


// ===== FUN_e76c @ e76c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe7b1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e76c(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6074 = in_D;
                    /* inline[API_FC38]: "{2:0B}{5:1D}Amount of Modulation = {2:27}%" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 0A 01 32 01 00 04 00 $0064 $FF9C $0000 ->$000F ->$0000
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_e7b3();
                    /* WARNING: Could not recover jumptable at 0xe7b1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e7b3 @ e7b3 =====

void __h3000 FUN_e7b3(void)

{
                    /* inline[API_FC38]: "{2:22}{3:609F}" */
  LcdPrintInline();
  return;
}


// ===== FUN_e7bd @ e7bd =====

void __h3000 FUN_e7bd(void)

{
                    /* inline[API_FC8A]: ->$E7CD(rel) "(Trigger )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_e7cd @ e7cd =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe7dc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e7cd(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE40(0,0,param_1,&UNK_201b);
  FUN_e874();
                    /* WARNING: Could not recover jumptable at 0xe7dc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e7de @ e7de =====

void __h3000 FUN_e7de(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = param_1;
  if ((DAT_60fb & 0xfc) != 0x98) {
    API_FC88();
    FUN_9101(extraout_A,extraout_B,&UNK_e7f9);
    uVar1 = extraout_A_00;
  }
  FUN_8fe4(uVar1,4);
                    /* WARNING: Could not recover jumptable at 0xe7f7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e7fe @ e7fe =====

void __h3000 FUN_e7fe(undefined1 param_1)

{
  FUN_e42a(param_1,0);
  return;
}


// ===== FUN_e804 @ e804 =====

void __h3000 FUN_e804(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_6024;
  if (DAT_6105 != '\0') {
    sVar2 = DAT_6106;
    API_FC7C(param_1,4,DAT_6106 + 4);
    FUN_e42a();
    API_FC7C(extraout_A,5,sVar2 + 5);
    FUN_e5c3();
    API_FC7E(extraout_A_00,6,sVar2 + 6);
    FUN_e759();
                    /* inline[API_FD84]: 10 01 "Func Amp" 2C $E54A $E57A */
    DefineParameter();
                    /* inline[API_FD84]: 11 01 "FuncFreq" 30 $E6D6 $E708 */
    DefineParameter();
                    /* inline[API_FE78]: 12 01 "FuncTrig" 34 $E874 $FFE8 */
    DefineParameterAlt();
  }
  DAT_6024 = uVar1;
                    /* WARNING: Could not recover jumptable at 0xe872. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_e874 @ e874 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe891 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e874(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_61f9 & 7) != 4) {
    DAT_6200 = 0x7fff;
    DAT_6202 = 0xff;
  }
  API_FE7E();
  DAT_6204 = (char)in_D;
                    /* WARNING: Could not recover jumptable at 0xe891. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e893 @ e893 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe8d6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e893(undefined2 param_1,undefined2 param_2,short param_3)

{
  ushort uVar1;
  undefined2 in_D;
  char *pcVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  if (*DAT_61f4 != '0') {
    if (*DAT_61f4 == 'J') {
      pcVar2 = DAT_61f4;
      FUN_dd35(2);
                    /* inline[addr:9AF3]: $FF9C $0064 */
      in_D = FUN_9af3((char)in_D >> 7);
      *(char *)(param_3 + -1) = (char)in_D;
      *(char *)(param_3 + -2) = (char)((ushort)in_D >> 8);
      *(undefined1 *)(param_3 + -3) = 200;
      puVar3 = (undefined1 *)(param_3 + -4);
      *puVar3 = 0;
      API_FCEC();
      puVar3[-1] = 0xda;
      puVar4 = (undefined2 *)(puVar3 + -2);
      *(undefined1 *)puVar4 = 0x68;
      API_FCF2();
      *(undefined2 *)(pcVar2 + 0x1b) = *puVar4;
      FUN_dd35(1);
      pcVar2[0x19] = (char)in_D;
      pcVar2[0x1e] = '\0';
    }
  }
                    /* WARNING: Could not recover jumptable at 0xe8d6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_e8d8 @ e8d8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xe902 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e8d8(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  undefined *puVar1;
  undefined1 uVar2;
  undefined1 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  puVar1 = &UNK_e904;
  if (*(char *)(DAT_61f4 + 0x19) != '\0') {
    puVar1 = &UNK_e909;
  }
  uVar2 = SUB21(puVar1,0);
  *(undefined1 *)(param_3 + -1) = uVar2;
  puVar3 = (undefined1 *)(param_3 + -2);
  *puVar3 = (char)((ushort)puVar1 >> 8);
  FUN_dd35(2);
  puVar3[-1] = uVar2;
  puVar3[-2] = 0;
                    /* inline[API_FC38]: "{2:1E}{4:0000}{3:60A9}{2:24}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xe902. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2);
  return;
}


// ===== FUN_e99c @ e99c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xeb1f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e99c(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_61fe;
  if (DAT_61f8 == '\0') {
                    /* WARNING: Could not recover jumptable at 0xeb1f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
    return;
  }
  DAT_61fe = 0;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_61fc;
  *(char *)(param_3 + -3) = (char)DAT_61fc;
  *(char *)(param_3 + -4) = (char)((ushort)uVar1 >> 8);
  API_FCEC();
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->E9DA 1->EA3C 2->EA04 3->E9EF 4->EA1F
                       5->E9DA 6->E9DA 7->E9DA */
  JumpTableDispatch(0);
}


// ===== FUN_e9da @ e9da =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xeb1f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_e9da(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,ushort *param_5
        )

{
  ushort uVar1;
  char *pcVar2;
  char cStack0000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  undefined2 in_stack_00000006;
  undefined2 in_stack_00000008;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_61f8 == '\x05') {
    *param_5 = 0;
                    /* WARNING: Subroutine does not return */
    JumpTableDispatch(0);
  }
  *param_5 = 0;
  pcVar2 = &DAT_6b00;
  cStack0000 = '\x13';
  do {
    if (*pcVar2 == '0') {
      *(ushort *)(pcVar2 + 0x16) = *param_5;
    }
    else if (*pcVar2 == 'J') {
      uVar1 = *param_5;
      if (pcVar2[0x19] == '\0') {
        if (uVar1 < *(ushort *)(pcVar2 + 0x1b) == (uVar1 == *(ushort *)(pcVar2 + 0x1b)))
        goto LAB_eaf8;
      }
      else if (*(ushort *)(pcVar2 + 0x1b) <= uVar1 ||
               (short)uVar1 < (short)*(ushort *)(pcVar2 + 0x1b)) {
LAB_eaf8:
        if (pcVar2[0x1e] == '\0') {
          pcVar2[0x1e] = -1;
          FUN_da9f();
        }
        goto LAB_eb15;
      }
      pcVar2[0x1e] = '\0';
    }
LAB_eb15:
    pcVar2 = pcVar2 + 0x30;
    cStack0000 = cStack0000 + -1;
    if (cStack0000 == '\0') {
                    /* WARNING: Could not recover jumptable at 0xeb1f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)
                ((char)((ushort)in_stack_00000002 >> 8),param_2,in_stack_00000004,in_stack_00000006,
                 in_stack_00000008);
      return;
    }
  } while( true );
}


// ===== FUN_e9ef @ e9ef =====

void __h3000 FUN_e9ef(void)

{
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  psVar1 = (short *)(in_U + -2);
  *(undefined1 *)psVar1 = 0;
  API_FCF8();
  API_FCF2();
  DAT_6200 = DAT_6200 - *psVar1;
  *psVar1 = DAT_6200;
                    /* WARNING: Subroutine does not return */
  JumpTableDispatch(0);
}


// ===== FUN_ea04 @ ea04 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xeb1f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_ea04(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,ushort *param_5
        )

{
  ushort uVar1;
  char *pcVar2;
  char cStack0000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  undefined2 in_stack_00000006;
  undefined2 in_stack_00000008;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_6202 == '\0') || (uVar1 = DAT_6200 - *param_5, SBORROW2(DAT_6200,*param_5))) {
    if (DAT_61f8 != '\x05') {
      *param_5 = 0;
      pcVar2 = &DAT_6b00;
      cStack0000 = '\x13';
      do {
        if (*pcVar2 == '0') {
          *(ushort *)(pcVar2 + 0x16) = *param_5;
        }
        else if (*pcVar2 == 'J') {
          uVar1 = *param_5;
          if (pcVar2[0x19] == '\0') {
            if (uVar1 < *(ushort *)(pcVar2 + 0x1b) == (uVar1 == *(ushort *)(pcVar2 + 0x1b)))
            goto LAB_eaf8;
          }
          else if (*(ushort *)(pcVar2 + 0x1b) <= uVar1 ||
                   (short)uVar1 < (short)*(ushort *)(pcVar2 + 0x1b)) {
LAB_eaf8:
            if (pcVar2[0x1e] == '\0') {
              pcVar2[0x1e] = -1;
              FUN_da9f();
            }
            goto LAB_eb15;
          }
          pcVar2[0x1e] = '\0';
        }
LAB_eb15:
        pcVar2 = pcVar2 + 0x30;
        cStack0000 = cStack0000 + -1;
        if (cStack0000 == '\0') {
                    /* WARNING: Could not recover jumptable at 0xeb1f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          (*UNRECOVERED_JUMPTABLE)
                    ((char)((ushort)in_stack_00000002 >> 8),param_2,in_stack_00000004,
                     in_stack_00000006,in_stack_00000008);
          return;
        }
      } while( true );
    }
    uVar1 = 0;
  }
  else {
    DAT_6200 = uVar1;
    if (((short)uVar1 < 0) && (DAT_6203 == '\0')) {
      DAT_6202 = '\0';
      FUN_e9da();
      return;
    }
  }
  *param_5 = uVar1;
                    /* WARNING: Subroutine does not return */
  JumpTableDispatch(0);
}


// ===== FUN_ea1f @ ea1f =====

void __h3000 FUN_ea1f(void)

{
  bool bVar1;
  short *in_U;
  
  if (DAT_6204 == '\0') {
    bVar1 = SCARRY2(DAT_6200,*in_U);
    DAT_6200 = DAT_6200 + *in_U;
    if (bVar1) {
      DAT_6200 = 0x7fff;
    }
  }
  else {
    DAT_6200 = DAT_6200 - *in_U;
    if (DAT_6200 < 0) {
      DAT_6200 = 0;
    }
  }
  *in_U = DAT_6200;
                    /* WARNING: Subroutine does not return */
  JumpTableDispatch(0);
}


// ===== FUN_ea3c @ ea3c =====

void __h3000 FUN_ea3c(void)

{
  short *in_U;
  
  DAT_6200 = DAT_6200 - *in_U;
  *in_U = DAT_6200;
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->EA83 1->EAB9 2->EAB6 3->EA9A 4->EA8A
                       5->EA5F 6->EAB9 7->EAB9 */
  JumpTableDispatch(0);
}


// ===== FUN_ea5f @ ea5f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xeb1f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_ea5f(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,char *param_5)

{
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  undefined2 in_stack_00000006;
  undefined2 in_stack_00000008;
  code *UNRECOVERED_JUMPTABLE;
  
  if (*param_5 < '\0') {
    DAT_6202 = -1;
  }
  else if (DAT_6202 != '\0') {
    param_5[-1] = '\0';
    param_5 = param_5 + -2;
    *param_5 = '\0';
    API_FCF8();
    *(undefined2 *)(param_5 + 2) = *(undefined2 *)param_5;
    DAT_6202 = '\0';
    FUN_eab9();
    return;
  }
                    /* WARNING: Could not recover jumptable at 0xeb1f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000002 >> 8),param_2,in_stack_00000004,in_stack_00000006,
             in_stack_00000008);
  return;
}


// ===== FUN_ea83 @ ea83 =====

void __h3000 FUN_ea83(void)

{
  undefined2 *in_U;
  
  *in_U = 0;
  FUN_eab9();
  return;
}


// ===== FUN_ea8a @ ea8a =====

void __h3000 FUN_ea8a(void)

{
  undefined2 uVar1;
  char *in_U;
  
  if (*in_U < '\0') {
    uVar1 = 0x8001;
  }
  else {
    uVar1 = 0x7fff;
  }
  *(undefined2 *)in_U = uVar1;
  FUN_eab9();
  return;
}


// ===== FUN_ea9a @ ea9a =====

void __h3000 FUN_ea9a(void)

{
  byte bVar1;
  char cVar2;
  short *in_U;
  undefined2 uStack_2;
  
  bVar1 = (byte)*in_U;
  cVar2 = bVar1 << 1;
  bVar1 = (char)((ushort)*in_U >> 8) << 1 | bVar1 >> 7;
  uStack_2 = CONCAT11(bVar1,cVar2);
  if ((char)bVar1 < '\0') {
    if (*(char *)in_U < '\0') goto LAB_eab2;
  }
  else if (-1 < *(char *)in_U) goto LAB_eab2;
  uStack_2 = CONCAT11(bVar1,cVar2);
  uStack_2 = -uStack_2;
LAB_eab2:
  *in_U = uStack_2;
  FUN_eab9();
  return;
}


// ===== FUN_eab6 @ eab6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xeb1f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_eab6(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  ushort uVar1;
  undefined2 uVar2;
  char *pcVar3;
  ushort *puVar4;
  char cStack0000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  undefined2 in_stack_00000006;
  undefined2 in_stack_00000008;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE68();
  if ((DAT_61f8 & 0x10) != 0) {
    FUN_c090();
  }
  uVar2 = DAT_61fa;
  *(char *)(param_5 + -1) = (char)DAT_61fa;
  puVar4 = (ushort *)(param_5 + -2);
  *(char *)puVar4 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  pcVar3 = &DAT_6b00;
  cStack0000 = '\x13';
  do {
    if (*pcVar3 == '0') {
      *(ushort *)(pcVar3 + 0x16) = *puVar4;
    }
    else if (*pcVar3 == 'J') {
      uVar1 = *puVar4;
      if (pcVar3[0x19] == '\0') {
        if (uVar1 < *(ushort *)(pcVar3 + 0x1b) == (uVar1 == *(ushort *)(pcVar3 + 0x1b)))
        goto LAB_eaf8;
      }
      else if (*(ushort *)(pcVar3 + 0x1b) <= uVar1 ||
               (short)uVar1 < (short)*(ushort *)(pcVar3 + 0x1b)) {
LAB_eaf8:
        if (pcVar3[0x1e] == '\0') {
          pcVar3[0x1e] = -1;
          FUN_da9f();
        }
        goto LAB_eb15;
      }
      pcVar3[0x1e] = '\0';
    }
LAB_eb15:
    pcVar3 = pcVar3 + 0x30;
    cStack0000 = cStack0000 + -1;
    if (cStack0000 == '\0') {
                    /* WARNING: Could not recover jumptable at 0xeb1f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)
                ((char)((ushort)in_stack_00000002 >> 8),param_2,in_stack_00000004,in_stack_00000006,
                 in_stack_00000008);
      return;
    }
  } while( true );
}


// ===== FUN_eab9 @ eab9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xeb1f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_eab9(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  ushort uVar1;
  undefined2 uVar2;
  char *pcVar3;
  ushort *puVar4;
  char local_res0;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  undefined2 in_stack_00000006;
  undefined2 in_stack_00000008;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_61f8 & 0x10) != 0) {
    FUN_c090();
  }
  uVar2 = DAT_61fa;
  *(char *)(param_5 + -1) = (char)DAT_61fa;
  puVar4 = (ushort *)(param_5 + -2);
  *(char *)puVar4 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  pcVar3 = &DAT_6b00;
  local_res0 = '\x13';
  do {
    if (*pcVar3 == '0') {
      *(ushort *)(pcVar3 + 0x16) = *puVar4;
    }
    else if (*pcVar3 == 'J') {
      uVar1 = *puVar4;
      if (pcVar3[0x19] == '\0') {
        if (uVar1 < *(ushort *)(pcVar3 + 0x1b) == (uVar1 == *(ushort *)(pcVar3 + 0x1b)))
        goto LAB_eaf8;
      }
      else if (*(ushort *)(pcVar3 + 0x1b) <= uVar1 ||
               (short)uVar1 < (short)*(ushort *)(pcVar3 + 0x1b)) {
LAB_eaf8:
        if (pcVar3[0x1e] == '\0') {
          pcVar3[0x1e] = -1;
          FUN_da9f();
        }
        goto LAB_eb15;
      }
      pcVar3[0x1e] = '\0';
    }
LAB_eb15:
    pcVar3 = pcVar3 + 0x30;
    local_res0 = local_res0 + -1;
    if (local_res0 == '\0') {
                    /* WARNING: Could not recover jumptable at 0xeb1f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)
                ((char)((ushort)in_stack_00000002 >> 8),param_2,in_stack_00000004,in_stack_00000006,
                 in_stack_00000008);
      return;
    }
  } while( true );
}


// ===== FUN_eb21 @ eb21 =====

undefined1 __h3000 FUN_eb21(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$EB38(rel) "(MIDI-Mon)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_eb38 @ eb38 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_eb38(undefined2 param_1,undefined2 param_2,undefined1 *param_3)

{
  undefined1 extraout_A;
  undefined2 in_D;
  undefined2 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "{1}MIDI Input in Hex, Bypass to Esc " */
  LcdPrintInline();
  API_FDD8();
                    /* inline[API_FD0C]: $0050 20 */
  MemsetInline();
  DAT_608b = FUN_ebd8;
  DAT_60f2 = FUN_ebd8;
  API_FC92();
  while( true ) {
    API_FDAE();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDDA();
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      API_FD04(0,0x25,0x6a83,0x6a80);
      uVar1 = API_FC46();
      DAT_6aa7 = (undefined1)uVar1;
      DAT_6aa6 = (undefined1)((ushort)uVar1 >> 8);
      DAT_6aa5 = 0x20;
      LcdSetCursor();
      API_FC3A(extraout_A,0x28,0x6a80);
      FUN_8737();
      uVar1 = DAT_60eb;
      param_3[-1] = (char)DAT_60eb;
      param_3 = param_3 + -2;
      *param_3 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FC38]: "{2:21}{4:2000}{3:60A7}" */
      LcdPrintInline();
    }
  }
  DAT_60f2 = FUN_85e3;
  API_FDC2((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_ebd8 @ ebd8 =====

void __h3000 FUN_ebd8(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  
  FUN_85f4();
  FUN_8723(extraout_A,param_2);
  return;
}


// ===== SetModuleHandlers @ ebe3 =====

/* Kernel API slot $FE00: inline 6 module-relative handlers -> $60E3..$60E9, $603A, $6036 */

undefined2 __h3000 SetModuleHandlers(void)

{
  undefined2 in_D;
  short *local_res0;
  
  DAT_60e3 = *local_res0 + g_moduleBase;
  DAT_60e5 = local_res0[1] + g_moduleBase;
  DAT_60e7 = local_res0[2] + g_moduleBase;
  DAT_60e9 = local_res0[3] + g_moduleBase;
  DAT_603a = local_res0[4] + g_moduleBase;
  DAT_6036 = local_res0[5] + g_moduleBase;
  return in_D;
}


// ===== SoftKeyLabels4Inline @ ec1c =====

/* Kernel API slot $FE02: inline 4 labels (00/01 or 8 chars) */

undefined2 __h3000 SoftKeyLabels4Inline(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_ec3c(param_1,0x29);
  FUN_ec3c(extraout_A,0x33);
  FUN_ec3c(extraout_A_00,0x3d);
  FUN_ec3c(extraout_A_01,0x47);
  API_FDF2();
  return uStack_4;
}


// ===== FUN_ec3c @ ec3c =====

undefined2 __h3000 FUN_ec3c(undefined1 param_1,undefined1 param_2,char *param_3)

{
  char cVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  LcdSetCursor();
  cVar1 = *param_3;
  if (cVar1 != '\0') {
    if (cVar1 == '\x01') {
                    /* inline[API_FC38]: "        " */
      LcdPrintInline();
    }
    else {
      API_FC3A(cVar1,8);
    }
  }
  return uStack_2;
}


// ===== API_FE18 @ ec67 =====

undefined2 __h3000 API_FE18(void)

{
  undefined2 in_D;
  
  DAT_603c = API_FE10;
  DAT_603e = API_FE12;
  DAT_6040 = API_FE14;
  DAT_6042 = API_FE16;
  return in_D;
}


// ===== API_FE10 @ ec84 =====

void __h3000 API_FE10(void)

{
  API_FDE8();
  (*DAT_60e3)();
  return;
}


// ===== API_FE12 @ ec8c =====

void __h3000 API_FE12(void)

{
  API_FDEA();
  (*DAT_60e5)();
  return;
}


// ===== API_FE14 @ ec94 =====

void __h3000 API_FE14(void)

{
  API_FDEC();
  (*DAT_60e7)();
  return;
}


// ===== API_FE16 @ ec9c =====

void __h3000 API_FE16(void)

{
  API_FDEE();
  (*DAT_60e9)();
  return;
}


// ===== API_FDE8 @ eca4 =====

undefined2 __h3000 API_FDE8(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x28);
  return uStack_2;
}


// ===== API_FDEA @ ecae =====

undefined2 __h3000 API_FDEA(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x32);
  return uStack_2;
}


// ===== API_FDEC @ ecb8 =====

undefined2 __h3000 API_FDEC(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x3c);
  return uStack_2;
}


// ===== API_FDEE @ ecc2 =====

undefined2 __h3000 API_FDEE(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x46);
  return uStack_2;
}


// ===== API_FDE6 @ eccc =====

undefined2 __h3000 API_FDE6(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  char extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  byte extraout_CC;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDF4();
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDF2();
    LcdSetCursor(extraout_B);
    API_FC2A(extraout_A,8);
    LcdSetCursor(extraout_A_00,extraout_A_00 + '\t');
    API_FC2A(extraout_A_01,9);
  }
  return uStack_2;
}


// ===== API_FE32 @ ecef =====

byte __h3000 API_FE32(undefined1 param_1,byte param_2)

{
  LcdSetCursor((param_2 & 3) * '\n' + '(');
  API_FC2A();
  LcdSetCursor();
  API_FC2A();
  return param_2;
}


// ===== API_FDF0 @ ecfa =====

undefined2 __h3000 API_FDF0(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  char extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  char extraout_A_03;
  undefined1 extraout_A_04;
  undefined1 extraout_B;
  byte extraout_CC;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDF4();
  if ((extraout_CC >> 2 & 1) == 0) {
    LcdSetCursor(extraout_B);
    API_FC2A(extraout_A_02,0x20);
    LcdSetCursor(extraout_A_03,extraout_A_03 + '\t');
    API_FC2A(extraout_A_04,0x14);
  }
  else {
    LcdSetCursor(extraout_B);
    API_FC2A(extraout_A,0x28);
    LcdSetCursor(extraout_A_00,extraout_A_00 + '\t');
    API_FC2A(extraout_A_01,0x29);
  }
  return uStack_2;
}


// ===== API_FDF2 @ ed32 =====

undefined2 __h3000 API_FDF2(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDF0(param_1,0x28);
  API_FDF0(extraout_A,0x32);
  API_FDF0(extraout_A_00,0x3c);
  API_FDF0(extraout_A_01,0x46);
  return uStack_2;
}


// ===== API_FDF4 @ ed4b =====

undefined2 __h3000 API_FDF4(void)

{
  byte bVar1;
  undefined2 in_D;
  undefined2 uVar2;
  
  LcdSetCursor();
  uVar2 = 0;
  do {
    uVar2 = API_FC2C((char)((ushort)uVar2 >> 8) + '\x01');
    if ((char)uVar2 != ' ') {
      return in_D;
    }
    bVar1 = (byte)((ushort)uVar2 >> 8);
  } while (bVar1 < 8 != (bVar1 == 8));
  return in_D;
}


// ===== API_FDF6 @ ed6b =====

void __h3000 API_FDF6(void)

{
                    /* inline[API_FC48]: 08 "........" */
  LcdPrintAt8Inline();
                    /* inline[API_FC48]: 09 "........" */
  LcdPrintAt8Inline();
                    /* inline[API_FC48]: 0A "........" */
  LcdPrintAt8Inline();
                    /* inline[API_FC48]: 0B "........" */
  LcdPrintAt8Inline();
                    /* inline[API_FC48]: 0C "........" */
  LcdPrintAt8Inline();
  return;
}


// ===== LoadParamsSigned @ eda8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FE04: inline (param, $70xx offset) pairs */

undefined2 __h3000 LoadParamsSigned(void)

{
  undefined2 in_D;
  char cVar1;
  short *psVar2;
  byte *pbVar3;
  char *local_res0;
  
  while( true ) {
    pbVar3 = (byte *)(local_res0 + 1);
    cVar1 = *local_res0;
    if (cVar1 == '\0') break;
    local_res0 = local_res0 + 2;
    psVar2 = (short *)(*pbVar3 + 0x7000);
    cVar1 = API_FC7C((char)((ushort)psVar2 >> 8),(char)psVar2,cVar1);
    *psVar2 = (short)cVar1;
  }
  return in_D;
}


// ===== LoadParamsUnsigned @ edc7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FE06: inline (param, $70xx offset) pairs */

undefined2 __h3000 LoadParamsUnsigned(void)

{
  char cVar1;
  undefined2 in_D;
  ushort uVar2;
  ushort *puVar3;
  byte *pbVar4;
  char *local_res0;
  
  while( true ) {
    pbVar4 = (byte *)(local_res0 + 1);
    cVar1 = *local_res0;
    if (cVar1 == '\0') break;
    local_res0 = local_res0 + 2;
    puVar3 = (ushort *)(*pbVar4 + 0x7000);
    uVar2 = API_FC7C((char)((ushort)puVar3 >> 8),(char)puVar3,cVar1);
    *puVar3 = uVar2 & 0xff;
  }
  return in_D;
}


// ===== LoadParamsScaled @ ede6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FE08: inline (param, $70xx offset) pairs */

undefined2 __h3000 LoadParamsScaled(void)

{
  char cVar1;
  undefined2 in_D;
  undefined2 uVar2;
  undefined2 *puVar3;
  byte *pbVar4;
  char *local_res0;
  
  while( true ) {
    pbVar4 = (byte *)(local_res0 + 1);
    cVar1 = *local_res0;
    if (cVar1 == '\0') break;
    local_res0 = local_res0 + 2;
    puVar3 = (undefined2 *)(*pbVar4 + 0x7000);
    uVar2 = API_FC7E((char)((ushort)puVar3 >> 8),(char)puVar3,cVar1);
    *puVar3 = uVar2;
  }
  return in_D;
}


// ===== API_FDFE @ ee04 =====

void __h3000 API_FDFE(void)

{
  return;
}


// ===== API_FE1A @ ee05 =====

void __h3000 API_FE1A(undefined1 param_1,undefined1 param_2,short param_3)

{
                    /* inline[API_FE02]: [-] [-] " range  " "per note" */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_60e7 = FUN_ee3e;
  DAT_60e9 = FUN_ee4e;
  DAT_6040 = API_FE14;
  DAT_6042 = API_FE16;
  DAT_6205 = param_3 + g_moduleBase;
  return;
}


// ===== FUN_ee3e @ ee3e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ee3e(void)

{
  DAT_60dc = 1;
  DAT_60de = 1;
  FUN_ee5e(0,1,DAT_6205);
  return;
}


// ===== FUN_ee4e @ ee4e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ee4e(void)

{
  DAT_60dc = 0x80;
  DAT_60de = 0x80;
  FUN_ee5e(0,0x80,DAT_6205);
  return;
}


// ===== FUN_ee5e @ ee5e =====

undefined2 __h3000 FUN_ee5e(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  
  DAT_6074 = **(undefined2 **)(param_3 + 0x22);
  DAT_6066 = 1;
  DAT_6067 = 1;
  DAT_60e0._0_1_ = 1;
  DAT_6068 = 1;
  DAT_6058 = 2;
  DAT_6099 = *(undefined1 *)(param_3 + 0x19);
  DAT_6069 = 6;
  DAT_606c = 0x7fff;
  DAT_606e = 0x8000;
  DAT_6070 = FUN_eeeb;
  DAT_6072 = FUN_eeca;
  API_FC14();
  LcdSetCursor();
                    /* inline[API_FC38]: "mod range:       [     /note]" */
  LcdPrintInline();
  FUN_eeeb();
  return in_stack_00000000;
}


// ===== FUN_eeca @ eeca =====

undefined2 __h3000 FUN_eeca(void)

{
  short sVar1;
  undefined2 in_D;
  
  sVar1 = DAT_6205;
  **(undefined2 **)(DAT_6205 + 0x22) = DAT_6074;
  **(undefined2 **)(sVar1 + 0x22) = DAT_6074;
  API_FC82();
  FUN_eeeb();
  return in_D;
}


// ===== FUN_eeeb @ eeeb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_eeeb(void)

{
  char cVar1;
  undefined1 extraout_A;
  undefined2 in_D;
  short sVar2;
  short in_U;
  
  sVar2 = DAT_6205;
  LcdSetCursor();
  API_FC3A(0,7,&DAT_609c);
  LcdSetCursor();
  cVar1 = (char)((ushort)**(undefined2 **)(sVar2 + 0x22) >> 8);
  *(char *)(in_U + -1) =
       (char)((char)((char)((char)((char)((char)((char)**(undefined2 **)(sVar2 + 0x22) >> 1 |
                                                cVar1 << 7) >> 1 | (cVar1 >> 1) << 7) >> 1 |
                                  (cVar1 >> 2) << 7) >> 1 | (cVar1 >> 3) << 7) >> 1 |
                    (cVar1 >> 4) << 7) >> 1 | (cVar1 >> 5) << 7) >> 1 | (cVar1 >> 6) << 7;
  *(char *)(in_U + -2) = cVar1 >> 7;
  API_FC40(*(undefined1 *)(sVar2 + 0x19));
  API_FC3A(extraout_A,5,0x620b);
  return in_D;
}


// ===== ParamDescriptorCall @ ef3b =====

/* Kernel API slot $FE1C: X = module-relative parameter descriptor */

undefined2 __h3000 ParamDescriptorCall(short param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  undefined2 *puVar3;
  
  *(byte *)(param_3 + -1) = (byte)in_D << 1;
  *(byte *)(param_3 + -2) = (char)((ushort)in_D >> 8) << 1 | (byte)in_D >> 7;
  psVar2 = (short *)(param_1 + g_moduleBase);
  uVar1 = *(undefined2 *)psVar2[0x11];
  *(char *)(param_3 + -3) = (char)uVar1;
  puVar3 = (undefined2 *)(param_3 + -4);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  *(undefined2 *)psVar2[4] = *puVar3;
  (*(code *)(*psVar2 + g_moduleBase))();
  if (psVar2[1] + g_moduleBase == DAT_6070) {
    FUN_ef8d();
  }
  return in_D;
}


// ===== FUN_ef6c @ ef6c =====

undefined2 __h3000 FUN_ef6c(short param_1)

{
  undefined2 in_D;
  
  param_1 = param_1 + g_moduleBase;
  (*(code *)(*(short *)(param_1 + 0x26) + g_moduleBase))();
  if (*(short *)(param_1 + 2) + g_moduleBase == DAT_6070) {
    FUN_ef8d();
  }
  return in_D;
}


// ===== FUN_ef8d @ ef8d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_ef8d(short param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  
  DAT_6074 = **(short **)(param_1 + 0xc);
  DAT_6054 = DAT_6074 + DAT_615d;
  uVar1 = **(undefined2 **)(param_1 + 0xc);
  uVar2 = (undefined1)uVar1;
  DAT_6062 = DAT_6054;
  *(undefined1 *)(param_3 + -1) = uVar2;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(*(undefined1 *)(param_1 + 0x19),uVar2,param_1,&DAT_609a);
  (*(code *)(*(short *)(param_1 + 2) + g_moduleBase))();
  return in_D;
}


// ===== FUN_efb9 @ efb9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_efb9(short param_1)

{
  short sVar1;
  undefined2 in_D;
  
  param_1 = param_1 + g_moduleBase;
  LcdSetCursor();
  sVar1 = (ushort)(byte)(*(char *)(param_1 + 0x1a) + 8) * (**(ushort **)(param_1 + 0xc) & 0xff) +
          g_moduleBase + *(short *)(param_1 + 0x20) + 8;
  API_FC3A((char)((ushort)sVar1 >> 8),*(undefined1 *)(param_1 + 0x1a),sVar1);
  return in_D;
}


// ===== FUN_efe5 @ efe5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_efe5(short param_1)

{
  short sVar1;
  undefined2 in_D;
  undefined1 uVar2;
  
  param_1 = param_1 + g_moduleBase;
  uVar2 = 0x29;
  sVar1 = *(short *)(param_1 + 0x1e);
  if ((((sVar1 != DAT_60e3) && (uVar2 = 0x33, sVar1 != DAT_60e5)) &&
      (uVar2 = 0x3d, sVar1 != DAT_60e7)) && (uVar2 = 0x47, sVar1 != DAT_60e9)) {
    return in_D;
  }
  LcdSetCursor();
  sVar1 = (ushort)(byte)(*(char *)(param_1 + 0x1a) + 8) * (**(ushort **)(param_1 + 0xc) & 0xff) +
          g_moduleBase + *(short *)(param_1 + 0x20);
  FUN_ec3c((char)((ushort)sVar1 >> 8),uVar2,sVar1);
  return in_D;
}


// ===== FUN_f02e @ f02e =====

undefined2 __h3000 FUN_f02e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f039();
  FUN_f223();
  return uStack_8;
}


// ===== FUN_f039 @ f039 =====

undefined2 __h3000 FUN_f039(short *param_1)

{
  short sVar1;
  undefined2 in_D;
  short sVar2;
  
  sVar1 = g_moduleBase;
  **(short **)((short)param_1 + g_moduleBase + 6) =
       **(short **)((short)param_1 + g_moduleBase + 0xc) -
       **(short **)((short)param_1 + g_moduleBase + 8);
  sVar2 = **(short **)((short)param_1 + sVar1 + 6) + 1;
  **(short **)((short)param_1 + sVar1 + 6) = sVar2;
  if (*(short *)((short)param_1 + sVar1 + 0x15) < sVar2 + **(short **)((short)param_1 + sVar1 + 8))
  {
    **(short **)((short)param_1 + sVar1 + 6) = -**(short **)((short)param_1 + sVar1 + 8);
  }
  API_FE76();
  (*(code *)(*param_1 + g_moduleBase))();
  sVar2 = (short)param_1 + g_moduleBase;
  FUN_f1c5();
  API_FC82((char)((ushort)**(undefined2 **)(sVar2 + 6) >> 8));
  return in_D;
}


// ===== API_FC4C @ f08c =====

undefined2 __h3000 API_FC4C(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f125();
  API_FC80();
  return uStack_8;
}


// ===== API_FC50 @ f097 =====

undefined2 __h3000 API_FC50(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f193();
  API_FC80();
  return uStack_8;
}


// ===== API_FC52 @ f0a2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FC52(short param_1)

{
  short sVar1;
  undefined2 in_D;
  
  param_1 = param_1 + g_moduleBase;
  LcdSetCursor();
  sVar1 = (ushort)*(byte *)(param_1 + 0x1a) * (**(ushort **)(param_1 + 0xc) & 0xff) + g_moduleBase +
          *(short *)(param_1 + 0x20);
  API_FC3A((char)((ushort)sVar1 >> 8),*(undefined1 *)(param_1 + 0x1a),sVar1);
  return in_D;
}


// ===== API_FC4E @ f0c9 =====

undefined2 __h3000 API_FC4E(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f223();
  DAT_6067 = 0x10;
  API_FC28();
  return uStack_8;
}


// ===== API_FDBC @ f0d9 =====

undefined2 __h3000 API_FDBC(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f125();
  API_FC82();
  return uStack_8;
}


// ===== API_FE6C @ f0e4 =====

undefined2 __h3000 API_FE6C(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f193();
  API_FC82();
  return uStack_8;
}


// ===== API_FE6E @ f0ef =====

undefined2 __h3000 API_FE6E(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f201();
  return uStack_8;
}


// ===== API_FE6A @ f0f7 =====

undefined2 __h3000 API_FE6A(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f223();
  return uStack_8;
}


// ===== API_FE22 @ f0ff =====

undefined2 __h3000 API_FE22(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f125();
  API_FC80();
  return uStack_8;
}


// ===== API_FE70 @ f10a =====

undefined2 __h3000 API_FE70(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f193();
  API_FC80();
  return uStack_8;
}


// ===== API_FE72 @ f115 =====

undefined2 __h3000 API_FE72(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f201();
  return uStack_8;
}


// ===== API_FE74 @ f11d =====

undefined2 __h3000 API_FE74(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_f223();
  return uStack_8;
}


// ===== FUN_f125 @ f125 =====

undefined2 __h3000 FUN_f125(undefined1 param_1,undefined1 param_2,short param_3)

{
  char cVar1;
  byte bVar2;
  short *psVar3;
  
  psVar3 = (short *)(param_3 + g_moduleBase);
  API_FDB0();
                    /* inline[API_FD18]: [$602A]=$A7F9 [$602E]=$AD71 [$6030]=$FBDA [$603A]=$ABC0 */
  StoreWordsInline();
  API_FC8E();
  DAT_6074 = DAT_60f9;
  if (*(short *)((short)psVar3 + 0x13) < -0x2000) {
    bVar2 = (byte)DAT_60f9;
    cVar1 = (char)(DAT_60f9 >> 8);
    if (*(short *)((short)psVar3 + 0x13) < 0) {
      DAT_6074 = CONCAT11((cVar1 << 1 | bVar2 >> 7) << 1 | (bVar2 & 0x7f) >> 6,bVar2 << 2);
    }
    else {
      DAT_6074 = CONCAT11(cVar1 << 1 | bVar2 >> 7,bVar2 << 1) & 0x7fff;
    }
  }
  *(ushort *)psVar3[3] = DAT_6074;
  (*(code *)(*psVar3 + g_moduleBase))();
  return *(undefined2 *)psVar3[3];
}


// ===== FUN_f193 @ f193 =====

undefined2 __h3000 FUN_f193(undefined1 param_1,undefined1 param_2,short param_3)

{
  short *psVar1;
  
  psVar1 = (short *)(param_3 + g_moduleBase);
  *(short *)psVar1[3] = DAT_6074 - *(short *)psVar1[4];
  FUN_f1c5();
  (*(code *)(*psVar1 + g_moduleBase))();
  (*(code *)(psVar1[1] + g_moduleBase))();
  return *(undefined2 *)psVar1[3];
}


// ===== FUN_f1c5 @ f1c5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_f1c5(short param_1)

{
  char cVar1;
  undefined2 in_D;
  undefined2 uVar2;
  
  if (*(short *)(param_1 + 0x13) < -0x2000) {
    if (*(short *)(param_1 + 0x13) < 0) {
      cVar1 = (char)((ushort)**(undefined2 **)(param_1 + 6) >> 8);
      uVar2 = CONCAT11(cVar1 >> 2,
                       (char)((char)**(undefined2 **)(param_1 + 6) >> 1 | cVar1 << 7) >> 1 |
                       (cVar1 >> 1) << 7);
    }
    else {
      cVar1 = (char)((ushort)**(undefined2 **)(param_1 + 6) >> 8);
      uVar2 = CONCAT11(cVar1 >> 1,(char)**(undefined2 **)(param_1 + 6) >> 1 | cVar1 << 7);
    }
  }
  else {
    uVar2 = **(undefined2 **)(param_1 + 6);
  }
  API_FE40((char)((ushort)uVar2 >> 8),(char)uVar2,param_1,*(undefined1 *)(param_1 + 0x12));
  return in_D;
}


// ===== FUN_f201 @ f201 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_f201(short param_1)

{
  undefined2 in_D;
  
  param_1 = param_1 + g_moduleBase;
  LcdSetCursor();
  API_FC3A((char)((ushort)(&DAT_60a3 + -*(char *)(param_1 + 0x1a)) >> 8),
           *(undefined1 *)(param_1 + 0x1a),&DAT_60a3 + -*(char *)(param_1 + 0x1a));
  return in_D;
}


// ===== FUN_f223 @ f223 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_f223(short param_1)

{
  undefined1 extraout_A;
  undefined2 in_D;
  char *pcVar1;
  
  param_1 = param_1 + g_moduleBase;
  DAT_6074 = **(undefined2 **)(param_1 + 0xc);
  API_FDFC();
  pcVar1 = (char *)(*(short *)(param_1 + 0x1c) + g_moduleBase);
  LcdSetCursor();
  API_FC2A();
  API_FC3A(extraout_A,'(' - *pcVar1,pcVar1 + 1);
  DAT_6066 = 1;
  DAT_6068 = 1;
  DAT_60e0 = 1;
  DAT_6067 = 1;
  DAT_6058 = 2;
  DAT_606e = *(undefined2 *)(param_1 + 0x13);
  DAT_606c = *(undefined2 *)(param_1 + 0x15);
  DAT_60dc = *(undefined2 *)(param_1 + 0x17);
  DAT_6099 = *(undefined1 *)(param_1 + 0x19);
  DAT_6069 = *(undefined1 *)(param_1 + 0x1a);
  DAT_6070 = *(short *)(param_1 + 2) + g_moduleBase;
  DAT_6072 = *(short *)(param_1 + 4) + g_moduleBase;
  DAT_60de = DAT_60dc;
  API_FC14();
  (*(code *)(*(short *)(param_1 + 2) + g_moduleBase))();
  return in_D;
}


// ===== API_FE76 @ f2a8 =====

undefined2 __h3000 API_FE76(short param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  
  param_1 = param_1 + g_moduleBase;
  uVar1 = *(undefined2 *)(param_1 + 0x13);
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(param_1 + 0x15);
  *(char *)(param_3 + -3) = (char)uVar1;
  *(char *)(param_3 + -4) = (char)((ushort)uVar1 >> 8);
  psVar2 = (short *)(param_3 + -6);
  *psVar2 = **(short **)(param_1 + 6) + **(short **)(param_1 + 8);
  API_FCD8();
  **(short **)(param_1 + 0xc) = *psVar2;
  return in_D;
}


// ===== API_FE4C @ f2cc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FE4C(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FD20(0);
  DAT_6116 = 0xff;
  FUN_b669();
  API_FC98();
                    /* inline[API_FE24]: $68A0 */
  API_FE24();
  FUN_b68a();
  uVar1 = API_FD20(0);
  DAT_6116 = API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0296);
  return in_D;
}


// ===== FUN_f2fe @ f2fe =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_f2fe(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FD20(0);
  DAT_6116 = 0xff;
  FUN_b669();
  API_FC98();
                    /* inline[API_FE24]: $68A0 */
  API_FE24(0,10,&DAT_68ab);
  FUN_b68a();
  uVar1 = API_FD20(0);
  DAT_6116 = API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0296);
  return in_D;
}


// ===== API_FE24 @ f336 =====

ushort __h3000 API_FE24(short param_1)

{
  ushort in_D;
  ushort uVar1;
  undefined1 uVar2;
  undefined2 local_a;
  undefined1 local_8;
  
  local_a = in_D;
  do {
    FUN_f3d5();
    uVar1 = local_a;
    if (!(bool)((local_a < 0x20) + (local_a == 0x20))) {
      uVar1 = 0x20;
    }
    local_8 = (char)uVar1;
    local_a = local_a - uVar1;
    FUN_f3a0();
    uVar2 = FUN_f3a0((char)param_1);
    FUN_f3a0(uVar2);
    FUN_f3a0();
    do {
      param_1 = param_1 + 1;
      FUN_f3a0();
      local_8 = local_8 + -1;
    } while (local_8 != '\0');
    FUN_f3a0();
    FUN_f3d5();
    FUN_f3d5();
  } while (local_a != 0);
  return in_D;
}


// ===== FUN_f3a0 @ f3a0 =====

byte __h3000 FUN_f3a0(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 *param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  byte bVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  bVar2 = param_2 >> 4;
  while( true ) {
    FUN_9970(param_1,bVar2);
    bVar2 = extraout_CC;
    uVar1 = (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    bVar2 = API_FE2A();
    param_1 = extraout_A;
  }
  FUN_9970(uVar1,param_2 & 0xf);
  bVar2 = extraout_CC_00;
  while( true ) {
    (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    API_FE2A();
    bVar2 = extraout_CC_01;
  }
  return param_2;
}


// ===== FUN_f3ac @ f3ac =====

byte __h3000 FUN_f3ac(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 *param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  byte bVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  bVar2 = param_2 >> 4;
  while( true ) {
    FUN_9970(param_1,bVar2);
    bVar2 = extraout_CC;
    uVar1 = (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    bVar2 = API_FE2A();
    param_1 = extraout_A;
  }
  FUN_9970(uVar1,param_2 & 0xf);
  bVar2 = extraout_CC_00;
  while( true ) {
    (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    API_FE2A();
    bVar2 = extraout_CC_01;
  }
  return param_2;
}


// ===== FUN_f3d5 @ f3d5 =====

undefined1 __h3000
FUN_f3d5(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 *param_4)

{
  byte extraout_CC;
  byte in_CC;
  
  while( true ) {
    (*(code *)*param_4)();
    if ((bool)(in_CC >> 2 & 1)) break;
    API_FE2A();
    in_CC = extraout_CC;
  }
  return param_2;
}


// ===== API_FE26 @ f3d9 =====

undefined2 __h3000 API_FE26(void)

{
  undefined2 in_D;
  
  FUN_f3d5();
  FUN_f3ac();
  FUN_f3ac();
  FUN_f3ac();
  FUN_f3d5();
  FUN_f3d5();
  return in_D;
}


// ===== API_FE28 @ f40e =====

undefined2 __h3000 API_FE28(void)

{
  undefined2 in_D;
  
  FUN_f3d5();
  FUN_f3ac();
  FUN_f3ac();
  FUN_f3ac();
  FUN_f3d5();
  FUN_f3d5();
  return in_D;
}


// ===== API_FE2C @ f424 =====

undefined2 __h3000
API_FE2C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  short sVar1;
  short *local_res0;
  
  sVar1 = *local_res0;
  BankPushSelect(param_2,*(undefined1 *)(sVar1 + 0xb));
  (**(code **)(sVar1 + 2))(extraout_A,extraout_A);
  BankPop();
  return param_4;
}


// ===== FUN_f43f @ f43f =====

void __h3000 FUN_f43f(undefined1 param_1,undefined1 param_2)

{
  char extraout_A;
  undefined1 extraout_A_00;
  char extraout_B;
  char cVar1;
  byte extraout_CC;
  short sVar2;
  short *local_res0;
  
  sVar2 = *local_res0;
  BankPushSelect(param_2,*(undefined1 *)(sVar2 + 0xb));
  cVar1 = extraout_A;
  while( true ) {
    (**(code **)(sVar2 + 2))(cVar1,cVar1);
    API_FDDA();
    if ((extraout_CC >> 2 & 1) == 0) break;
    cVar1 = extraout_B;
    if (extraout_B < '\0') goto LAB_f46c;
    g_curBank = *(undefined1 *)(sVar2 + 0xb);
    BANK_LATCH = g_curBank;
  }
  cVar1 = -1;
LAB_f46c:
  BankPop(extraout_A_00,cVar1);
  return;
}


// ===== FUN_f4d4 @ f4d4 =====

code * __h3000 FUN_f4d4(void)

{
  undefined1 uVar1;
  code *in_D;
  undefined1 extraout_B;
  byte in_CC;
  byte bVar2;
  undefined2 uVar3;
  short in_Y;
  short sVar4;
  undefined2 uVar5;
  
  uVar3 = *(undefined2 *)(in_Y + 0xe);
  uVar5 = *(undefined2 *)(in_Y + 0x12);
  sVar4 = *(short *)(in_Y + 0x10);
  bVar2 = in_CC & 0xf1 | (sVar4 == 0) << 2 | (sVar4 < 0) << 3;
  uVar1 = (*in_D)();
  *(undefined2 *)(in_Y + 0x12) = uVar5;
  *(undefined2 *)(in_Y + 0xe) = uVar3;
  *(ushort *)(in_Y + 0xc) = CONCAT11(uVar1,extraout_B);
  *(byte *)(in_Y + 0x14) = bVar2;
  *(short *)(in_Y + 0x10) = sVar4;
  return in_D;
}


// ===== FUN_f505 @ f505 =====

void __h3000 FUN_f505(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  *(char *)(param_2 + 6) = (char)((ushort)in_D >> 8);
  *(undefined2 *)(param_2 + 4) = in_stack_00000000;
  *(undefined2 *)(param_2 + 8) = param_1;
  *(undefined **)(param_2 + 2) = &UNK_f513;
  return;
}


// ===== API_FE30 @ f584 =====

undefined2 __h3000 API_FE30(void)

{
  undefined2 *puVar1;
  undefined2 in_D;
  short *local_res0;
  
  puVar1 = (undefined2 *)*local_res0;
  *puVar1 = in_D;
  puVar1[9] = (short)puVar1 + 0x15;
  return in_D;
}


// ===== API_FE2E @ f598 =====

undefined2 __h3000 API_FE2E(void)

{
  undefined2 in_D;
  short *local_res0;
  
  *(undefined1 **)(*local_res0 + 2) = &SUB_f472;
  return in_D;
}


// ===== API_FE40 @ f5a9 =====

void __h3000 API_FE40(void)

{
  if (DAT_6118 != '\0') {
    API_FE3E();
  }
  return;
}


// ===== FUN_f5b1 @ f5b1 =====

void __h3000 FUN_f5b1(void)

{
  if (DAT_6119 != '\0') {
    API_FE3E();
  }
  return;
}


// ===== API_FE3E @ f5b9 =====

void __h3000 API_FE3E(void)

{
  if (DAT_6019 == '\0') {
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
  }
  return;
}


// ===== FUN_f62c @ f62c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xf69e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_f62c(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined1 uVar1;
  char cVar2;
  undefined2 in_D;
  ushort uVar3;
  ushort uVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  *(char *)(param_3 + -1) = (char)in_D;
  *(undefined1 *)(param_3 + -2) = uVar1;
  *(undefined1 *)(param_3 + -3) = 100;
  puVar5 = (undefined2 *)(param_3 + -4);
  *(undefined1 *)puVar5 = 0;
  uVar3 = API_FCEA();
  uVar4 = uVar3 & 0xff;
  API_FC7C((char)(uVar3 >> 8),(char)uVar3,&DAT_0288);
  if ((char)uVar3 == '\0') {
    API_FC98();
    uVar4 = API_FC98();
    cVar2 = (char)(uVar4 >> 8);
    API_FC7C(cVar2,(char)uVar4,&DAT_0290);
    API_FC98();
    API_FC98();
    API_FC98();
    API_FC98();
    do {
      API_FC98();
    } while (cVar2 != '\x01');
    puVar6 = puVar5 + 1;
    API_FC98((char)((ushort)*puVar5 >> 8) << 1 | (byte)*puVar5 >> 7);
    API_FC98();
    API_FC98();
  }
  else {
    puVar6 = puVar5 + 1;
    API_FE3E((char)((ushort)*puVar5 >> 8));
  }
  API_FC98();
  API_FC98((char)((ushort)*puVar6 >> 8));
                    /* WARNING: Could not recover jumptable at 0xf69e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)uVar4,param_1,param_2);
  return;
}


// ===== FUN_f6a0 @ f6a0 =====

void __h3000 FUN_f6a0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC82();
                    /* WARNING: Could not recover jumptable at 0xf6a9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_f730 @ f730 =====

undefined2 __h3000 FUN_f730(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_6118 != '\0') {
    FUN_f62c();
  }
  return uStack_2;
}


// ===== FUN_f760 @ f760 =====

undefined2 __h3000 FUN_f760(void)

{
  ushort uVar1;
  undefined2 uStack0000;
  byte in_stack_00000002;
  undefined1 in_stack_00000003;
  
  if ((char)in_stack_00000002 < '\0') {
    if (in_stack_00000002 != 0xff) {
      if (in_stack_00000002 == 0xf0) {
        DAT_6212 = (undefined **)&UNK_f6b4;
      }
      else {
        if ((in_stack_00000002 & 0xf0) == 0xc0) {
          if (((char)DAT_608a < '\0') || ((in_stack_00000002 & 0xf) == DAT_608a)) {
            DAT_6212 = PTR_ARRAY_f856;
            goto LAB_f7ad;
          }
        }
        else if (((in_stack_00000002 & 0xf0) == 0xb0) &&
                (((char)DAT_608a < '\0' ||
                 (uVar1 = CONCAT11(in_stack_00000002,DAT_608a) & 0xf0f,
                 (char)uVar1 == (char)(uVar1 >> 8))))) {
          DAT_6212 = (undefined **)&UNK_f7b9;
          goto LAB_f7ad;
        }
        DAT_6212 = (undefined **)API_FD80;
      }
    }
  }
  else {
    uStack0000 = 0xf772;
    (*(code *)DAT_6212)();
  }
LAB_f7ad:
  return CONCAT11(in_stack_00000003,in_stack_00000002);
}


// ===== FUN_f767 @ f767 =====

byte __h3000 FUN_f767(undefined1 param_1,byte param_2)

{
  ushort uVar1;
  
  if ((char)param_2 < '\0') {
    if (param_2 != 0xff) {
      if (param_2 == 0xf0) {
        DAT_6212 = (undefined **)&UNK_f6b4;
      }
      else {
        if ((param_2 & 0xf0) == 0xc0) {
          if (((char)DAT_608a < '\0') || ((param_2 & 0xf) == DAT_608a)) {
            DAT_6212 = PTR_ARRAY_f856;
            return param_2;
          }
        }
        else if (((param_2 & 0xf0) == 0xb0) &&
                (((char)DAT_608a < '\0' ||
                 (uVar1 = CONCAT11(param_2,DAT_608a) & 0xf0f, (char)uVar1 == (char)(uVar1 >> 8)))))
        {
          DAT_6212 = (undefined **)&UNK_f7b9;
          return param_2;
        }
        DAT_6212 = (undefined **)API_FD80;
      }
    }
  }
  else {
    (*(code *)DAT_6212)();
  }
  return param_2;
}


// ===== FUN_f7b2 @ f7b2 =====

void __h3000 FUN_f7b2(void)

{
  DAT_6212 = 0xffe8;
  return;
}


// ===== FUN_f937 @ f937 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_f937(void)

{
  undefined2 in_D;
  
  DAT_6214 = 0;
  _DAT_60f5 = 0;
  _DAT_60f7 = 0;
  return in_D;
}


// ===== FUN_f948 @ f948 =====

void __h3000 FUN_f948(void)

{
  API_FE50();
  return;
}


// ===== API_FE50 @ f94b =====

undefined2 __h3000
API_FE50(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  BankPushSelect(param_1,0xa0);
  if (DAT_029a == '\0') {
    DAT_6119 = 0;
    DAT_6118 = 0;
    DAT_611a = 0;
  }
  else {
    DAT_6119 = DAT_0293;
    DAT_6118 = DAT_0292;
    DAT_611b = DAT_0295;
    DAT_611a = DAT_0294;
  }
  BankPop();
  return param_4;
}


// ===== API_FE7A @ f985 =====

undefined2 __h3000 API_FE7A(undefined1 param_1,char param_2)

{
  undefined1 extraout_A;
  undefined1 uVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,param_1);
  if (param_2 == '\0') {
    uVar1 = 0x4e;
  }
  else {
    uVar1 = 0x59;
  }
  API_FC2A(extraout_A,uVar1);
  return uStack_2;
}


// ===== FUN_f99c @ f99c =====

undefined2 __h3000 FUN_f99c(undefined1 param_1,char param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,param_1);
  if (param_2 == '\0') {
                    /* inline[API_FC38]: "Off" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "On " */
    LcdPrintInline();
  }
  return uStack_2;
}


// ===== API_FE7C @ f9ba =====

void __h3000 API_FE7C(void)

{
                    /* inline[API_FE5E]: $F9D3 $F9C1 */
  API_FE5E();
  return;
}


// ===== API_FE7E @ f9e5 =====

undefined1 __h3000 API_FE7E(undefined1 param_1,char param_2)

{
  undefined1 uVar1;
  
  if (param_2 == '\0') {
    uVar1 = 0xff;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


// ===== FUN_f9f5 @ f9f5 =====

void __h3000 FUN_f9f5(undefined1 param_1,undefined1 param_2,code *UNRECOVERED_JUMPTABLE)

{
                    /* WARNING: Could not recover jumptable at 0xf9f6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(0);
  return;
}


// ===== FUN_f9f8 @ f9f8 =====

undefined2 __h3000
FUN_f9f8(undefined1 param_1,char param_2,undefined2 *param_3,short param_4,short param_5)

{
  bool bVar1;
  undefined2 uVar2;
  undefined2 in_stack_00000000;
  
                    /* WARNING: Read-only address (RAM,0x0034) is written */
  bVar1 = UNK_0034 != '\0';
  UNK_0034 = -UNK_0034;
  *(undefined2 *)(param_5 + -2) = 63999;
  *(short *)(param_5 + -4) = param_4;
  *(undefined1 *)(param_5 + -5) = 0;
  *(char *)(param_5 + -6) = param_2;
  *(undefined1 *)(param_5 + -7) = 0;
  *(byte *)(param_4 + -0xf) = (char)*(byte *)(param_4 + -0xf) >> 1 | bVar1 << 7;
                    /* WARNING: Read-only address (RAM,0x0010) is written */
  UNK_0010 = UNK_0010 >> 1;
  if (param_2 == '\0') {
    uVar2 = param_3[1];
  }
  else {
    uVar2 = *param_3;
  }
  *(char *)(param_5 + -8) = (char)uVar2;
  *(char *)(param_5 + -9) = (char)((ushort)uVar2 >> 8);
  return in_stack_00000000;
}


// ===== API_FE5E @ f9fc =====

char __h3000
API_FE5E(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined2 uVar1;
  undefined2 *local_res0;
  
  if (param_2 == '\0') {
    uVar1 = local_res0[1];
  }
  else {
    uVar1 = *local_res0;
  }
  *(char *)(param_5 + -1) = (char)uVar1;
  *(char *)(param_5 + -2) = (char)((ushort)uVar1 >> 8);
  return param_2;
}


// ===== FUN_fa13 @ fa13 =====

char __h3000 FUN_fa13(void)

{
  return DAT_60b9 * '\n' + '(';
}


// ===== BankPushSelect @ fa20 =====

/* Kernel API slot $FC9C: push current bank on caller stack, select bank B */

void __h3000 BankPushSelect(undefined1 param_1,undefined1 param_2)

{
  g_curBank = param_2;
  BANK_LATCH = param_2;
  return;
}


// ===== BankPop @ fa3a =====

/* Kernel API slot $FC9E: pop bank pushed by BankPushSelect */

void __h3000 BankPop(void)

{
  undefined1 in_stack_00000002;
  
  g_curBank = in_stack_00000002;
  BANK_LATCH = in_stack_00000002;
  return;
}


// ===== API_FCA0 @ fa4f =====

undefined2 __h3000 API_FCA0(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  BANK_LATCH = DAT_600c;
  BANK_LATCH = g_curBank;
  return CONCAT11(param_1,*param_3);
}


// ===== API_FCA2 @ fa6c =====

void __h3000 API_FCA2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined1 *param_4)

{
  BANK_LATCH = DAT_600c;
  *param_4 = param_2;
  BANK_LATCH = g_curBank;
  return;
}


// ===== API_FDDC @ fa89 =====

short __h3000 API_FDDC(undefined1 *param_1,undefined1 *param_2)

{
  undefined1 uVar1;
  short in_D;
  short sVar2;
  
  uVar1 = g_curBank;
  sVar2 = in_D;
  do {
    BANK_LATCH = DAT_600c;
    BANK_LATCH = uVar1;
    g_curBank = uVar1;
    *param_2 = *param_1;
    sVar2 = sVar2 + -1;
    param_1 = param_1 + 1;
    param_2 = param_2 + 1;
  } while (sVar2 != 0);
  return in_D;
}


// ===== API_FDDE @ fab6 =====

short __h3000 API_FDDE(undefined1 *param_1,undefined1 *param_2)

{
  short in_D;
  short sVar1;
  
  sVar1 = in_D;
  do {
    BANK_LATCH = g_curBank;
    BANK_LATCH = DAT_600c;
    *param_2 = *param_1;
    sVar1 = sVar1 + -1;
    param_1 = param_1 + 1;
    param_2 = param_2 + 1;
  } while (sVar1 != 0);
  BANK_LATCH = g_curBank;
  return in_D;
}


// ===== API_FE4E @ faeb =====

void __h3000 API_FE4E(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 local_res1;
  undefined1 in_stack_00000002;
  undefined1 in_stack_00000004;
  undefined1 uStack0005;
  code *UNRECOVERED_JUMPTABLE;
  
  BankPushSelect(param_1,in_stack_00000002);
  (*_uStack0005)(extraout_A,local_res1);
  uVar1 = BankPop();
  UNRECOVERED_JUMPTABLE = (code *)CONCAT11(in_stack_00000004,uStack0005);
                    /* WARNING: Could not recover jumptable at 0xfb0c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,uVar1);
  return;
}


// ===== FUN_fb0e @ fb0e =====

void __h3000
FUN_fb0e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  byte extraout_CC;
  byte extraout_CC_00;
  short sVar1;
  short *psVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  psVar2 = (short *)(param_5 + -5);
  sVar1 = 0;
  do {
    *(undefined1 *)(psVar2 + 1) = 0;
    *(undefined1 *)((short)psVar2 + 3) = 0;
    do {
      while( true ) {
        if (sVar1 == *(short *)((short)psVar2 + 7)) goto LAB_fb4f;
        FUN_fb59();
        if ((extraout_CC >> 2 & 1) != 0) break;
        *psVar2 = sVar1;
        do {
          *(char *)((short)psVar2 + 3) = *(char *)((short)psVar2 + 3) + '\x01';
          if ((*(char *)((short)psVar2 + 3) == '\a') || (sVar1 == *(short *)((short)psVar2 + 7)))
          goto LAB_fb4f;
          FUN_fb59();
        } while ((extraout_CC_00 >> 2 & 1) == 0);
        FUN_fb66();
        if (sVar1 == *(short *)((short)psVar2 + 7)) goto LAB_fb55;
        *(undefined1 *)((short)psVar2 + 3) = 0;
        *(undefined1 *)(psVar2 + 1) = 1;
      }
      *(char *)(psVar2 + 1) = *(char *)(psVar2 + 1) + '\x01';
    } while (*(char *)(psVar2 + 1) != '\x1f');
LAB_fb4f:
    FUN_fb66();
    if (sVar1 == *(short *)((short)psVar2 + 7)) {
LAB_fb55:
                    /* WARNING: Could not recover jumptable at 0xfb57. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,(short)psVar2 + 0xd);
      return;
    }
  } while( true );
}


// ===== FUN_fb59 @ fb59 =====

void __h3000
FUN_fb59(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  (**(code **)(param_5 + 9))();
  *(undefined1 *)(param_5 + 4) = param_2;
  (**(code **)(param_5 + 0xb))();
  return;
}


// ===== FUN_fb66 @ fb66 =====

void __h3000 FUN_fb66(void)

{
  char cVar1;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
  (**(code **)(in_U + 5))();
  for (cVar1 = *(char *)(in_U + 3); cVar1 != '\0'; cVar1 = cVar1 + -1) {
    (**(code **)(in_U + 0xb))();
    cVar1 = (**(code **)(in_U + 5))();
  }
                    /* WARNING: Could not recover jumptable at 0xfb89. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


// ===== FUN_fb8b @ fb8b =====

void __h3000
FUN_fb8b(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  byte bVar1;
  short sVar2;
  char *pcVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  pcVar3 = (char *)(param_5 + -2);
  sVar2 = 0;
  bVar1 = 4;
  while( true ) {
    (**(code **)(pcVar3 + 2))();
    if ((bVar1 >> 2 & 1) == 0) break;
    sVar2 = sVar2 + 1;
    FUN_fbcb();
    while (bVar1 = (*pcVar3 == '\0') << 2, *pcVar3 != '\0') {
      (**(code **)(pcVar3 + 4))();
      (**(code **)(pcVar3 + 6))();
      if ((bVar1 >> 2 & 1) == 0) goto LAB_fbc7;
      *pcVar3 = *pcVar3 + -1;
    }
    while (bVar1 = (pcVar3[1] == '\0') << 2, pcVar3[1] != '\0') {
      (**(code **)(pcVar3 + 2))();
      if ((bVar1 >> 2 & 1) == 0) goto LAB_fbc7;
      sVar2 = sVar2 + 1;
      bVar1 = (sVar2 == 0) << 2;
      (**(code **)(pcVar3 + 6))();
      if ((bVar1 >> 2 & 1) == 0) goto LAB_fbc7;
      pcVar3[1] = pcVar3[1] + -1;
    }
  }
LAB_fbc7:
                    /* WARNING: Could not recover jumptable at 0xfbc9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,pcVar3 + 8);
  return;
}


// ===== FUN_fbcb @ fbcb =====

void __h3000
FUN_fbcb(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  param_5[1] = param_2 & 7;
  *param_5 = param_2 >> 3;
                    /* WARNING: Could not recover jumptable at 0xfbd8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_fbda @ fbda =====

void __h3000 FUN_fbda(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_61a6 = g_curBank;
                    /* inline[API_FD26]: $0008 $6151 */
  FarCallInline();
                    /* WARNING: Could not recover jumptable at 0xfbe9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== API_FC86 @ fbeb =====

void __h3000 API_FC86(void)

{
                    /* inline[API_FD26]: $000A $6151 */
  FarCallInline();
  return;
}


// ===== FUN_fbf3 @ fbf3 =====

void __h3000 FUN_fbf3(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,&DAT_028c);
  DAT_608a = extraout_B;
                    /* WARNING: Could not recover jumptable at 0xfbfe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== RingBufInit @ fed2 =====

/* Kernel API slot $FCFE: inline ptr to ring buffer descriptor */

undefined2 __h3000 RingBufInit(void)

{
  undefined2 *puVar1;
  undefined2 in_D;
  short *local_res0;
  
  puVar1 = (undefined2 *)*local_res0;
  *puVar1 = in_D;
  puVar1[1] = puVar1 + 4;
  puVar1[2] = puVar1 + 4;
  *(undefined1 *)((short)puVar1 + 7) = 0;
  *(undefined1 *)(puVar1 + 3) = 0xff;
  return in_D;
}


// ===== RingBufPut @ feec =====

/* Kernel API slot $FD00: inline descriptor; B = byte */

undefined1 __h3000 RingBufPut(undefined1 param_1,undefined1 param_2)

{
  short *psVar1;
  short *psVar2;
  short *local_res0;
  
  psVar1 = (short *)*local_res0;
  if (*(char *)((short)psVar1 + 7) == '\0') {
    psVar2 = (short *)((undefined1 *)psVar1[1] + 1);
    *(undefined1 *)psVar1[1] = param_2;
    psVar1[1] = (short)psVar2;
    if ((short)psVar1 + *psVar1 == psVar1[1]) {
      psVar2 = psVar1 + 4;
      psVar1[1] = (short)psVar2;
    }
    if (psVar2 == (short *)psVar1[2]) {
      *(undefined1 *)((short)psVar1 + 7) = 0xff;
    }
    *(undefined1 *)(psVar1 + 3) = 0;
  }
  return param_2;
}


// ===== RingBufGet @ ff1f =====

/* Kernel API slot $FD02: inline descriptor; B = byte */

undefined1 __h3000 RingBufGet(undefined1 param_1,undefined1 param_2)

{
  short *psVar1;
  short *psVar2;
  short *local_res0;
  
  psVar1 = (short *)*local_res0;
  if (*(char *)(psVar1 + 3) == '\0') {
    psVar2 = (short *)((undefined1 *)psVar1[2] + 1);
    param_2 = *(undefined1 *)psVar1[2];
    psVar1[2] = (short)psVar2;
    if ((short)psVar1 + *psVar1 == psVar1[2]) {
      psVar2 = psVar1 + 4;
      psVar1[2] = (short)psVar2;
    }
    if (psVar2 == (short *)psVar1[1]) {
      *(undefined1 *)(psVar1 + 3) = 0xff;
    }
    *(undefined1 *)((short)psVar1 + 7) = 0;
  }
  return param_2;
}


// ===== FUN_ff85 @ ff85 =====
// decompilation failed: 
Low-level Error: Trying to construct memory range beyond end of address space: RAM

// ===== FUN_ffae @ ffae =====
// decompilation failed: 
Low-level Error: Trying to construct memory range beyond end of address space: RAM

// ===== FUN_ffc9 @ ffc9 =====
// decompilation failed: 
Low-level Error: Trying to construct memory range beyond end of address space: RAM

// ===== API_FD80 @ ffe8 =====

void __h3000 API_FD80(void)

{
  return;
}


// ===== API_FC00 @ ffe9 =====

void __h3000 API_FC00(void)

{
  do {
                    /* WARNING: Do nothing block with infinite loop */
  } while( true );
}


