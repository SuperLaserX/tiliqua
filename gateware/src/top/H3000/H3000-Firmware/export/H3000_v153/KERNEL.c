// H3000_v153 - decompiled by Ghidra (6809, __h3000 convention)
// block KERNEL 8400-ffff, 824 functions
// Kernel ROM D:/midi/Firmware/H3000/modules/h3000_v153

// ===== Reset @ 8400 =====

/* WARNING: Removing unreachable block (RAM,0xc6cc) */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 Reset(void)

{
  undefined2 uVar1;
  char cVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  undefined1 *puVar3;
  short sVar4;
  
  DAT_80a7 = 0;
  BANK_LATCH = 0;
  DAT_80a1 = 0xff;
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
  DAT_64fe = (undefined **)0x8435;
  API_FD22();
  LAB_6600 = 0xb7;
  DAT_6601 = &DAT_8055;
  DAT_6603 = 0x3b;
  SWI_trampoline = 0x3b;
  SWI2_trampoline = 0x3b;
  SWI3_trampoline = 0x3b;
                    /* inline[API_FD18]: [$600F]=$8877 [$6011]=$8877 [$6013]=$8877 [$6015]=$8877
                       [$6006]=$8877 [$6004]=$8877 [$6002]=$8877 [$608B]=$8877 [$60F2]=$8601
                       [$608D]=$8877 */
  DAT_64fe = &PTR_DAT_8451;
  StoreWordsInline(0x3b,0x55,0x6604);
  DAT_6109 = 5;
  DAT_64fe = (undefined **)0x8483;
  API_FD76();
  DAT_64fe = (undefined **)0x8486;
  API_FC78();
  DAT_64fe = (undefined **)0x8489;
  FUN_8fea();
  DAT_64fe = (undefined **)0x848c;
  API_FCA4();
  DAT_64fe = (undefined **)0x848f;
  API_FC34();
                    /* inline[API_FC38]: "{1}Welcome to the H3000 ULTRA HARMONIZER " */
  DAT_64fe = (undefined **)s_Welcome_to_the_H3000_ULTRA_HARMO_8492;
  LcdPrintInline();
  DAT_64fe = (undefined **)0x84bd;
  API_FC22();
  DAT_64fe = (undefined **)0x84c0;
  uVar1 = Io80A7_Set();
  DAT_64fe = (undefined **)0x84c6;
  API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0103);
  DAT_64fe = (undefined **)0x84c9;
  API_FC4A();
  DAT_64fe = (undefined **)0x84cc;
  API_FDD8();
  DAT_64fe = (undefined **)0x84cf;
  FUN_c91b();
  DAT_64fe = (undefined **)0x84d2;
  FUN_e0c6();
  DAT_64fe = (undefined **)0x84d5;
  FUN_ecff();
  DAT_64fe = (undefined **)0x84d8;
  API_FDF6();
  DAT_64fe = (undefined **)0x84db;
  API_FC84();
  DAT_64fe = (undefined **)0x84e4;
  API_FC80();
  DAT_64fe = (undefined **)0x84ed;
  API_FC80();
  DAT_6189._0_1_ = 0x75;
  DAT_6189._1_1_ = 0x1f;
  DAT_618b = 0x11;
  DAT_64fe = (undefined **)0x84ff;
  API_FDAE();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_64fe = (undefined **)0x8504;
    FUN_c6d7();
  }
  DAT_64fe = (undefined **)0x8507;
  cVar2 = API_FC1A();
  if (cVar2 == '\x06') {
    DAT_64fe = (undefined **)0x850e;
    FUN_c702();
    do {
      do {
        DAT_64fe = (undefined **)0x8511;
        cVar2 = API_FC1A();
      } while ((bool)(extraout_CC_00 >> 2 & 1));
    } while (cVar2 == '\x06');
    if (cVar2 == '\x02') {
      DAT_64fe = (undefined **)0x851e;
      FUN_c73c();
    }
  }
  DAT_64fe = (undefined **)0x8521;
  FUN_c6ee();
  if (!(bool)(extraout_CC_01 >> 2 & 1)) {
                    /* inline[API_FC38]: "{1}non-volatile memory  not working {2:28}can not load
                       programs " */
    DAT_64fe = (undefined **)s_non_volatile_memory_not_working___8526;
    LcdPrintInline();
  }
  DAT_64fe = (undefined **)0x8566;
  FUN_c6ee();
  DAT_64fe = (undefined **)0x8569;
  FUN_aaa7();
  DAT_64fe = (undefined **)0x856c;
  API_FDCE();
  DAT_64fe = (undefined **)0x8574;
  API_FD20(3);
  DAT_64fe = (undefined **)0x8577;
  API_FC5E();
  DAT_64fe = (undefined **)0x857a;
  API_FC64();
  do {
    g_curBank = DAT_6102;
    BANK_LATCH = DAT_6102;
    DAT_64fe = (undefined **)0x8586;
    API_FCAE();
    if ((extraout_CC_02 >> 2 & 1) != 0) {
      DAT_64fe = (undefined **)0x858e;
      API_FCAC(0);
      DAT_64fe = (undefined **)0x8591;
      API_FC1C();
      DAT_64fe = (undefined **)0x8594;
      FUN_943b();
      DAT_64fe = (undefined **)0x8597;
      FUN_9e72();
    }
    DAT_64fe = (undefined **)0x8599;
    FUN_859b();
  } while( true );
}


// ===== FUN_859b @ 859b =====

undefined2 __h3000 FUN_859b(undefined1 param_1)

{
  undefined2 in_stack_00000000;
  
  BankPushSelect(param_1,DAT_6102);
  API_FCA6();
  FUN_c868();
  (*DAT_600f)();
  (*DAT_6011)();
  (*DAT_6013)();
  (*DAT_6015)();
  API_FCF6();
  BankPop();
  return in_stack_00000000;
}


// ===== IRQ_Handler @ 85c2 =====

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
      if (DAT_619c != '\0') {
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
      FUN_8640();
    }
  }
  uVar3 = (*DAT_6004)();
  uVar4 = CONCAT11(uVar3,extraout_B);
  if (in_stack_00000000 < '\0') {
    uVar4 = in_stack_00000001;
  }
  return uVar4;
}


// ===== FUN_8601 @ 8601 =====

ushort __h3000 FUN_8601(undefined1 param_1,byte param_2)

{
  char cVar1;
  ushort uVar2;
  
  uVar2 = CONCAT11(param_2,param_2) & 0xf0ff;
  cVar1 = (char)(uVar2 >> 8);
  if (cVar1 == -0x10) {
    if ((byte)uVar2 == 0xf0) {
      DAT_608b = FUN_8666;
    }
    else if ((param_2 & 0xf8) == 0xf8) {
      FUN_874e();
    }
    (*DAT_608d)();
    return uVar2;
  }
  if (cVar1 != -0x40) {
    DAT_608b = FUN_8618;
    uVar2 = FUN_8618();
    return uVar2;
  }
  if ((-1 < (char)DAT_608a) && (((byte)uVar2 & 0xf) != DAT_608a)) {
    DAT_608b = API_FD80;
    return uVar2;
  }
  DAT_608b = FUN_8740;
  return uVar2;
}


// ===== FUN_8618 @ 8618 =====

void __h3000 FUN_8618(undefined1 param_1,undefined1 param_2)

{
  DAT_6105 = param_2;
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


// ===== FUN_8640 @ 8640 =====

void __h3000 FUN_8640(void)

{
  DAT_6087 = 0xff;
  return;
}


// ===== FUN_8646 @ 8646 =====

byte __h3000 FUN_8646(undefined1 param_1,byte param_2)

{
  if (param_2 == 0xf0) {
    DAT_608b = FUN_8666;
  }
  else if ((param_2 & 0xf8) == 0xf8) {
    FUN_874e();
  }
  (*DAT_608d)();
  return param_2;
}


// ===== FUN_8666 @ 8666 =====

char __h3000 FUN_8666(undefined1 param_1,char param_2)

{
  if (param_2 == '\x1c') {
    DAT_608b = FUN_8671;
  }
  else {
    DAT_608b = API_FD80;
  }
  return param_2;
}


// ===== FUN_8671 @ 8671 =====

char __h3000 FUN_8671(undefined1 param_1,char param_2)

{
  if (param_2 == '`') {
    DAT_608b = FUN_867c;
  }
  else {
    DAT_608b = API_FD80;
  }
  return param_2;
}


// ===== FUN_867c @ 867c =====

char __h3000 FUN_867c(undefined1 param_1,char param_2)

{
  char cVar1;
  
  cVar1 = API_FC7C();
  if (cVar1 == param_2) {
    DAT_608b = FUN_8696;
  }
  else {
    DAT_608b = API_FD80;
  }
  return param_2;
}


// ===== FUN_8696 @ 8696 =====

undefined2 __h3000 FUN_8696(undefined1 param_1,char param_2)

{
  byte bVar1;
  char cVar2;
  undefined1 uVar3;
  undefined2 uVar4;
  undefined1 extraout_B;
  short sVar5;
  undefined *puVar6;
  undefined2 uStack0004;
  char in_stack_00000006;
  undefined2 in_stack_00000007;
  
  if (param_2 == '\0') {
    DAT_608b = FUN_8618;
    uVar4 = FUN_8618();
    return uVar4;
  }
  puVar6 = &DAT_68c0;
  Io80A7_Clear();
  BankPushSelect();
  *(code **)(puVar6 + 2) = FUN_e9eb;
  sVar5 = 32000;
LAB_86da:
  while( true ) {
    bVar1 = DAT_8300;
    if ((bVar1 & 1) == 0) goto LAB_86fb;
    if ((bVar1 & 0x20) != 0) break;
    bVar1 = DAT_8301;
    sVar5 = 32000;
    if ((char)bVar1 < '\0') {
      if ((bVar1 & 0xf8) != 0xf8) {
        *(code **)(puVar6 + 2) = FUN_e9eb;
        Io80A7_Set();
        BankPop(bVar1 & 0xf8);
        do {
          cVar2 = DAT_8301;
          if (DAT_619c != '\0') {
            if (cVar2 < '\0') {
              uStack0004 = 0x85ff;
              (*DAT_60f2)();
            }
            else {
              uStack0004 = 0x85f1;
              (*DAT_608b)();
            }
          }
          while( true ) {
            bVar1 = DAT_8300;
            if ((bVar1 & 1) == 0) {
              uStack0004 = 0x874d;
              uVar3 = (*DAT_6004)();
              uVar4 = CONCAT11(uVar3,extraout_B);
              if (in_stack_00000006 < '\0') {
                uVar4 = in_stack_00000007;
              }
              return uVar4;
            }
            if ((bVar1 & 0x20) == 0) break;
            uVar3 = DAT_8301;
            uStack0004 = 0x85f9;
            FUN_8640();
          }
        } while( true );
      }
      FUN_874e();
    }
    else {
      (**(code **)(puVar6 + 2))();
      g_curBank = puVar6[0xb];
      BANK_LATCH = g_curBank;
    }
  }
  goto LAB_86ff;
LAB_86fb:
  sVar5 = sVar5 + -1;
  if (sVar5 == 0) {
LAB_86ff:
    uVar3 = DAT_8301;
  }
  goto LAB_86da;
}


// ===== FUN_86ae @ 86ae =====

undefined2 __h3000 FUN_86ae(void)

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
  *(code **)(puVar6 + 2) = FUN_e9eb;
  sVar5 = 32000;
LAB_86da:
  while( true ) {
    bVar1 = DAT_8300;
    if ((bVar1 & 1) == 0) goto LAB_86fb;
    if ((bVar1 & 0x20) != 0) break;
    bVar1 = DAT_8301;
    sVar5 = 32000;
    if ((char)bVar1 < '\0') {
      if ((bVar1 & 0xf8) != 0xf8) {
        *(code **)(puVar6 + 2) = FUN_e9eb;
        Io80A7_Set();
        BankPop(bVar1 & 0xf8);
        do {
          cVar2 = DAT_8301;
          if (DAT_619c != '\0') {
            if (cVar2 < '\0') {
              uStack0004 = 0x85ff;
              (*DAT_60f2)();
            }
            else {
              uStack0004 = 0x85f1;
              (*DAT_608b)();
            }
          }
          while( true ) {
            bVar1 = DAT_8300;
            if ((bVar1 & 1) == 0) {
              uStack0004 = 0x874d;
              uVar3 = (*DAT_6004)();
              uVar4 = CONCAT11(uVar3,extraout_B);
              if (in_stack_00000006 < '\0') {
                uVar4 = in_stack_00000007;
              }
              return uVar4;
            }
            if ((bVar1 & 0x20) == 0) break;
            uVar3 = DAT_8301;
            uStack0004 = 0x85f9;
            FUN_8640();
          }
        } while( true );
      }
      FUN_874e();
    }
    else {
      (**(code **)(puVar6 + 2))();
      g_curBank = puVar6[0xb];
      BANK_LATCH = g_curBank;
    }
  }
  goto LAB_86ff;
LAB_86fb:
  sVar5 = sVar5 + -1;
  if (sVar5 == 0) {
LAB_86ff:
    uVar3 = DAT_8301;
  }
  goto LAB_86da;
}


// ===== FUN_871c @ 871c =====

void __h3000 FUN_871c(void)

{
  Io80A7_Set();
  return;
}


// ===== FUN_8740 @ 8740 =====

void __h3000 FUN_8740(undefined1 param_1,undefined1 param_2)

{
  DAT_60f1 = param_2;
  DAT_6106 = 0xff;
  return;
}


// ===== FUN_874e @ 874e =====

undefined2 __h3000 FUN_874e(undefined1 param_1,char param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if ((param_2 == -8) && (DAT_6109 = DAT_6109 + '\x01', DAT_6109 == '\0')) {
    DAT_6109 = -1;
  }
  return uStack_2;
}


// ===== FUN_8763 @ 8763 =====

undefined2 __h3000 FUN_8763(void)

{
  byte bVar1;
  char cVar2;
  undefined2 in_D;
  ushort uVar3;
  short sVar4;
  short sVar5;
  
  if (DAT_610a != DAT_611b) {
    DAT_611b = DAT_610a;
    bVar1 = (&DAT_610b)[DAT_610a];
    uVar3 = CONCAT11(bVar1,DAT_610a + -1) & 0xff0f;
    cVar2 = (char)(uVar3 >> 8) - (&DAT_610b)[(char)uVar3];
    if ((cVar2 == '\0' && (short)((ushort)(byte)(cVar2 - 1) << 8) < 0 == SBORROW1(cVar2,'\x01')) ||
       ((cVar2 != -1) != (cVar2 == -1))) {
      DAT_610b = bVar1;
      DAT_610c = bVar1;
      DAT_610d = bVar1;
      DAT_610e = bVar1;
      DAT_610f = bVar1;
      DAT_6110 = bVar1;
      DAT_6111 = bVar1;
      DAT_6112 = bVar1;
      DAT_6113 = bVar1;
      DAT_6114 = bVar1;
      DAT_6115 = bVar1;
      DAT_6116 = bVar1;
      DAT_6117 = bVar1;
      DAT_6118 = bVar1;
      DAT_6119 = bVar1;
      DAT_611a = bVar1;
    }
    sVar5 = (ushort)DAT_610b + (ushort)DAT_610c + (ushort)DAT_610d + (ushort)DAT_610e +
            (ushort)DAT_610f + (ushort)DAT_6110 + (ushort)DAT_6111 + (ushort)DAT_6112 +
            (ushort)DAT_6113 + (ushort)DAT_6114 + (ushort)DAT_6115 + (ushort)DAT_6116 +
            (ushort)DAT_6117 + (ushort)DAT_6118 + (ushort)DAT_6119 + (ushort)DAT_611a;
    if (((bVar1 != 0) && (uVar3 = sVar5 - DAT_60eb, !(bool)((sVar5 == DAT_60eb) + (uVar3 == 1)))) &&
       (uVar3 != 0xffff)) {
      if ((bool)((uVar3 < 2) + (uVar3 == 2))) {
        sVar4 = -1;
      }
      else {
        if ((short)uVar3 < -2) {
          DAT_60eb = sVar5;
          DAT_611b = DAT_610a;
          return in_D;
        }
        sVar4 = 1;
      }
      DAT_60eb = sVar4 + sVar5;
    }
  }
  return in_D;
}


// ===== NMI_Handler @ 8823 =====

/* WARNING: Removing unreachable block (RAM,0xc6cc) */
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
  byte extraout_CC_02;
  undefined1 *puVar5;
  short sVar6;
  char in_stack_00000000;
  undefined2 in_stack_00000001;
  
  if ((char)((ushort)&stack0x0000 >> 8) != 'd') {
    DAT_80a7 = 0;
    BANK_LATCH = 0;
    DAT_80a1 = 0xff;
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
    DAT_64fe = (undefined **)0x8435;
    API_FD22();
    LAB_6600 = 0xb7;
    DAT_6601 = &DAT_8055;
    DAT_6603 = 0x3b;
    SWI_trampoline = 0x3b;
    SWI2_trampoline = 0x3b;
    SWI3_trampoline = 0x3b;
    DAT_64fe = &PTR_DAT_8451;
    StoreWordsInline(0x3b,0x55,0x6604);
    DAT_6109 = '\x05';
    DAT_64fe = (undefined **)0x8483;
    API_FD76();
    DAT_64fe = (undefined **)0x8486;
    API_FC78();
    DAT_64fe = (undefined **)0x8489;
    FUN_8fea();
    DAT_64fe = (undefined **)0x848c;
    API_FCA4();
    DAT_64fe = (undefined **)0x848f;
    API_FC34();
    DAT_64fe = (undefined **)s_Welcome_to_the_H3000_ULTRA_HARMO_8492;
    LcdPrintInline();
    DAT_64fe = (undefined **)0x84bd;
    API_FC22();
    DAT_64fe = (undefined **)0x84c0;
    uVar1 = Io80A7_Set();
    DAT_64fe = (undefined **)0x84c6;
    API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0103);
    DAT_64fe = (undefined **)0x84c9;
    API_FC4A();
    DAT_64fe = (undefined **)0x84cc;
    API_FDD8();
    DAT_64fe = (undefined **)0x84cf;
    FUN_c91b();
    DAT_64fe = (undefined **)0x84d2;
    FUN_e0c6();
    DAT_64fe = (undefined **)0x84d5;
    FUN_ecff();
    DAT_64fe = (undefined **)0x84d8;
    API_FDF6();
    DAT_64fe = (undefined **)0x84db;
    API_FC84();
    DAT_64fe = (undefined **)0x84e4;
    API_FC80();
    DAT_64fe = (undefined **)0x84ed;
    API_FC80();
    DAT_6189._0_1_ = 0x75;
    DAT_6189._1_1_ = 0x1f;
    DAT_618b = 0x11;
    DAT_64fe = (undefined **)0x84ff;
    API_FDAE();
    if ((extraout_CC >> 2 & 1) != 0) {
      DAT_64fe = (undefined **)0x8504;
      FUN_c6d7();
    }
    DAT_64fe = (undefined **)0x8507;
    cVar3 = API_FC1A();
    if (cVar3 == '\x06') {
      DAT_64fe = (undefined **)0x850e;
      FUN_c702();
      do {
        do {
          DAT_64fe = (undefined **)0x8511;
          cVar3 = API_FC1A();
        } while ((bool)(extraout_CC_00 >> 2 & 1));
      } while (cVar3 == '\x06');
      if (cVar3 == '\x02') {
        DAT_64fe = (undefined **)0x851e;
        FUN_c73c();
      }
    }
    DAT_64fe = (undefined **)0x8521;
    FUN_c6ee();
    if (!(bool)(extraout_CC_01 >> 2 & 1)) {
      DAT_64fe = (undefined **)s_non_volatile_memory_not_working___8526;
      LcdPrintInline();
    }
    DAT_64fe = (undefined **)0x8566;
    FUN_c6ee();
    DAT_64fe = (undefined **)0x8569;
    FUN_aaa7();
    DAT_64fe = (undefined **)0x856c;
    API_FDCE();
    DAT_64fe = (undefined **)0x8574;
    API_FD20(3);
    DAT_64fe = (undefined **)0x8577;
    API_FC5E();
    DAT_64fe = (undefined **)0x857a;
    API_FC64();
    do {
      g_curBank = DAT_6102;
      BANK_LATCH = DAT_6102;
      DAT_64fe = (undefined **)0x8586;
      API_FCAE();
      if ((extraout_CC_02 >> 2 & 1) != 0) {
        DAT_64fe = (undefined **)0x858e;
        API_FCAC(0);
        DAT_64fe = (undefined **)0x8591;
        API_FC1C();
        DAT_64fe = (undefined **)0x8594;
        FUN_943b();
        DAT_64fe = (undefined **)0x8597;
        FUN_9e72();
      }
      DAT_64fe = (undefined **)0x8599;
      FUN_859b();
    } while( true );
  }
  (*_DAT_6002)();
  uVar4 = API_FC24();
  cVar3 = DAT_611c;
  DAT_6165 = DAT_6165 + '\x01';
  DAT_6107 = DAT_6107 + '\x01';
  if (DAT_6107 == '\0') {
    uVar2 = CONCAT11(DAT_6109,uVar4);
    if (DAT_6109 == '\0') {
      uVar2 = 2;
      DAT_611d = '\x02';
    }
    else if (DAT_611d == '\0') {
      DAT_611c = DAT_6109;
      uVar2 = CONCAT11(DAT_610a + '\x01',cVar3) & 0xfff;
      DAT_610a = (char)(uVar2 >> 8);
      (&DAT_610b)[DAT_610a] = (char)uVar2;
    }
    else {
      DAT_611c = DAT_6109;
      DAT_611d = DAT_611d + -1;
    }
    uVar4 = (undefined1)uVar2;
    DAT_6109 = '\0';
  }
  DAT_80a7 = 0;
  DAT_80a7 = 1;
  uVar1 = CONCAT11(1,uVar4);
  if (in_stack_00000000 < '\0') {
    uVar1 = in_stack_00000001;
  }
  return uVar1;
}


// ===== API_FC00 @ 8875 =====

void __h3000 API_FC00(void)

{
  do {
                    /* WARNING: Do nothing block with infinite loop */
  } while( true );
}


// ===== API_FD80 @ 8877 =====

void __h3000 API_FD80(void)

{
  return;
}


// ===== FIRQ_Handler @ 8878 =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FIRQ_Handler(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== RomFindRecord @ 88bb =====

/* Kernel API slot $FC02: D = record key; scans the bank chains, leaves bank/ptr/len in
   $6079/$607A/$607D */

short __h3000 RomFindRecord(void)

{
  short in_D;
  short sVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  
  sVar1 = RomFirstRecord();
  bVar2 = extraout_CC;
  while (((bVar2 >> 2 & 1) != 0 && (sVar1 != in_D))) {
    sVar1 = RomNextRecord();
    bVar2 = extraout_CC_00;
  }
  return in_D;
}


// ===== RomStreamReadByte @ 88cf =====

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
       (uVar2 = FUN_89f6(), (extraout_CC >> 2 & 1) != 0)) goto LAB_8903;
    DAT_6076 = 0xff;
  }
  DAT_607c = -1;
  uVar2 = DAT_607a;
LAB_8903:
  DAT_607a = uVar2;
  BankPop();
  return;
}


// ===== API_FD9E @ 891e =====

void __h3000 API_FD9E(void)

{
  BankPushSelect(DAT_6079);
  BankPop();
  return;
}


// ===== RomFirstRecord @ 8936 =====

/* Kernel API slot $FDA0 */

char * __h3000 RomFirstRecord(void)

{
  short *psVar1;
  char *pcVar2;
  byte extraout_CC;
  
  BankPushSelect();
  DAT_607f = &UNK_888d;
  do {
    psVar1 = (short *)FUN_89f6();
    if ((extraout_CC >> 2 & 1) == 0) {
      DAT_607a = (short *)0x0;
      DAT_6077 = (char *)0x0;
      DAT_607d = 0;
      DAT_6076 = (undefined1)((ushort)psVar1 >> 8);
      pcVar2 = (char *)BankPop();
      return pcVar2;
    }
  } while ((char *)*psVar1 !=
           "this is not allowed because     Program Sequence Transmission is Enabled");
  DAT_607c = 0;
  DAT_6076 = 0;
  DAT_607d = psVar1[1];
  DAT_6077 = (char *)*psVar1;
  DAT_607a = psVar1;
  BankPop();
  return DAT_6077;
}


// ===== FUN_8955 @ 8955 =====

char * __h3000 FUN_8955(void)

{
  short *psVar1;
  char *pcVar2;
  byte extraout_CC;
  
  BankPushSelect();
  do {
    psVar1 = (short *)FUN_89f6();
    if ((extraout_CC >> 2 & 1) == 0) {
      DAT_607a = (short *)0x0;
      DAT_6077 = (char *)0x0;
      DAT_607d = 0;
      DAT_6076 = (undefined1)((ushort)psVar1 >> 8);
      pcVar2 = (char *)BankPop();
      return pcVar2;
    }
  } while ((char *)*psVar1 !=
           "this is not allowed because     Program Sequence Transmission is Enabled");
  DAT_607c = 0;
  DAT_6076 = 0;
  DAT_607d = psVar1[1];
  DAT_6077 = (char *)*psVar1;
  DAT_607a = psVar1;
  BankPop();
  return DAT_6077;
}


// ===== FUN_897a @ 897a =====

undefined2 __h3000 FUN_897a(void)

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


// ===== RomNextRecord @ 899a =====

/* Kernel API slot $FDA2 */

char * __h3000 RomNextRecord(void)

{
  char *pcVar1;
  short *psVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  
  psVar2 = (short *)BankPushSelect();
  if (DAT_6076 == '\0') {
    if (DAT_6077 == "") {
LAB_8944:
      while (psVar2 = (short *)FUN_89f6(), (extraout_CC >> 2 & 1) != 0) {
        if ((char *)*psVar2 ==
            "this is not allowed because     Program Sequence Transmission is Enabled") {
          DAT_607c = 0;
          DAT_6076 = 0;
          DAT_607d = psVar2[1];
          DAT_6077 = (char *)*psVar2;
          DAT_607a = psVar2;
          BankPop();
          return DAT_6077;
        }
      }
    }
    else {
      do {
        if ((char)((8 < DAT_607d) + (DAT_607d == 8)) == '\0') goto LAB_8944;
        if ((((ushort)DAT_607a & 0x3fff) + DAT_607d & 0xc000) == 0) {
          DAT_607a = (short *)((short)DAT_607a + DAT_607d);
          pcVar1 = (char *)FUN_897a((char)((ushort)*DAT_607a >> 8));
          return pcVar1;
        }
        DAT_607d = DAT_607d - (0x4000 - ((ushort)DAT_607a & 0x3fff));
        psVar2 = (short *)FUN_89f6();
        DAT_607a = psVar2;
      } while ((extraout_CC_00 >> 2 & 1) != 0);
    }
  }
  DAT_607a = (short *)0x0;
  DAT_6077 = (char *)0x0;
  DAT_607d = 0;
  DAT_6076 = (char)((ushort)psVar2 >> 8);
  pcVar1 = (char *)BankPop();
  return pcVar1;
}


// ===== FUN_89f6 @ 89f6 =====

short __h3000 FUN_89f6(void)

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


// ===== API_FDA4 @ 8a14 =====

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
    sVar2 = FUN_89f6();
    if ((extraout_CC >> 2 & 1) == 0) {
      return in_D;
    }
    DAT_607a = sVar2 + DAT_607a;
  }
  return in_D;
}


// ===== API_FC06 @ 8a4d =====

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


// ===== API_FC08 @ 8a5b =====

void __h3000 API_FC08(void)

{
  short in_D;
  byte extraout_CC;
  undefined1 uStack0000;
  
  if ((in_D != -1) && (RomFindRecord(), (extraout_CC >> 2 & 1) != 0)) {
    API_FDA4(0);
    BankPushSelect();
    uStack0000 = 0x76;
    (*DAT_607a)();
    uStack0000 = 0x79;
    BankPop();
  }
  return;
}


// ===== FarCallModuleInline @ 8a80 =====

/* Kernel API slot $FC0A: inline word = record key; switch bank, JSR [$607A], restore */

undefined2 __h3000 FarCallModuleInline(undefined2 param_1)

{
  undefined2 in_D;
  undefined1 uVar1;
  byte extraout_CC;
  undefined2 *puVar2;
  undefined2 *puVar3;
  undefined2 *local_res0;
  undefined2 *puStack0002;
  undefined1 uStack0004;
  undefined1 uStack0005;
  undefined1 auStack_4 [2];
  undefined2 uStack_2;
  
  stack0xfffd = CONCAT12((char)in_D,param_1);
  puVar3 = (undefined2 *)auStack_4;
  _auStack_4 = CONCAT13((char)((ushort)in_D >> 8),stack0xfffd);
  puVar2 = local_res0 + 1;
  RomFindRecord((char)((ushort)*local_res0 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDA4(0);
    BankPushSelect();
    _auStack_4 = CONCAT22(0x8a9e,uStack_2);
    API_FD24();
    _auStack_4 = CONCAT22(0x8aa3,uStack_2);
    API_FD24();
    _auStack_4 = CONCAT22(0x8aa8,uStack_2);
    API_FD24();
    puStack0002 = (undefined2 *)0x8ab0;
    (*DAT_607a)(uStack_2._0_1_);
    uStack_2 = 0x8ab5;
    puStack0002 = puVar2;
    uStack0005 = API_FD26();
    uStack_2 = 0x8aba;
    uStack0004 = API_FD26();
    _auStack_4 = CONCAT22(auStack_4,0x8abf);
    uVar1 = API_FD26();
    stack0xfffd = CONCAT21(0x8ac4,uVar1);
    BankPop();
    puVar3 = &stack0x0002;
  }
  return *puVar3;
}


// ===== API_FC0C @ 8ac9 =====

void __h3000 API_FC0C(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte extraout_CC;
  undefined1 uVar1;
  
  uVar1 = (undefined1)((ushort)param_4 >> 8);
  RomFindRecord((char)((ushort)param_3 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDA4(0);
    API_FDA4(uVar1);
    RomStreamReadByte();
  }
  return;
}


// ===== API_FC0E @ 8ae7 =====

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


// ===== API_FDA6 @ 8b08 =====

undefined2 __h3000 API_FDA6(undefined2 param_1,undefined1 *param_2)

{
  undefined2 in_D;
  undefined1 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  RomFindRecord((char)((ushort)param_1 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    while (uVar1 = RomStreamReadByte(), (extraout_CC_00 >> 2 & 1) != 0) {
      *param_2 = uVar1;
      param_2 = param_2 + 1;
    }
  }
  return in_D;
}


// ===== API_FC10 @ 8b1f =====

short __h3000 API_FC10(undefined2 param_1,undefined1 *param_2,undefined1 *param_3)

{
  short in_D;
  undefined1 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  short sVar2;
  
  sVar2 = in_D;
  RomFindRecord((char)((ushort)param_1 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDA4(*param_3);
    do {
      uVar1 = RomStreamReadByte();
      if ((extraout_CC_00 >> 2 & 1) == 0) {
        return in_D;
      }
      *param_2 = uVar1;
      sVar2 = sVar2 + -1;
      param_2 = param_2 + 1;
    } while (sVar2 != 0);
  }
  return in_D;
}


// ===== KernelHelper_FC12 @ 8b3b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FC12: inline: 2 words */

undefined2 __h3000 KernelHelper_FC12(void)

{
  undefined2 in_D;
  short local_res0;
  
  API_FC10((char)((ushort)*(undefined2 *)(local_res0 + 2) >> 8),
           (char)*(undefined2 *)(local_res0 + 2),in_D);
  return in_D;
}


// ===== API_FDA8 @ 8b56 =====

undefined2 __h3000 API_FDA8(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  byte extraout_B;
  undefined1 extraout_B_00;
  byte extraout_CC;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  RomFindRecord();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_600c = DAT_6079;
    API_FCA0(extraout_A,DAT_6079,DAT_607a + 5);
    if ((extraout_B & 1) != 0) {
      DAT_60be = extraout_A_00;
      API_FCA0();
      DAT_60bd = 0xff;
      DAT_60bf = extraout_B_00;
      API_FCA2();
    }
  }
  return uStack_6;
}


// ===== API_FDAA @ 8b90 =====

undefined2 __h3000 API_FDAA(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  byte extraout_CC;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  if (DAT_60bd == '\0') {
    RomFindRecord(DAT_60be,0xff);
    if ((extraout_CC >> 2 & 1) != 0) {
      DAT_600c = DAT_6079;
      API_FCA2(extraout_A,DAT_60bf,param_3,DAT_607a + 1);
    }
  }
  return uStack_4;
}


// ===== API_FDAC @ 8bbe =====

short __h3000 API_FDAC(undefined1 param_1,undefined1 param_2,short param_3,short param_4)

{
  short sVar1;
  undefined *puVar2;
  
  puVar2 = &UNK_8bb8;
  sVar1 = param_4;
  FUN_8c15();
  BankPushSelect();
  if ((ushort)(*(short *)(puVar2 + 4) - (sVar1 + 8)) < *(ushort *)(param_3 + 2)) {
    BankPop();
  }
  else {
    DAT_600c = puVar2[1];
    API_FDDE((char)((ushort)*(undefined2 *)(param_3 + 2) >> 8));
    API_FDDE(0);
    g_curBank = DAT_600c;
    BANK_LATCH = DAT_600c;
    *(byte *)(sVar1 + 5) = *(byte *)(sVar1 + 5) | 1;
    BankPop();
  }
  return param_4;
}


// ===== FUN_8c0b @ 8c0b =====

void __h3000 FUN_8c0b(void)

{
  FUN_8c15();
  return;
}


// ===== FUN_8c15 @ 8c15 =====

undefined2 __h3000 FUN_8c15(void)

{
  short *psVar1;
  short in_U;
  undefined2 in_stack_00000000;
  
  DAT_60bd = 0;
  BankPushSelect();
  psVar1 = *(short **)(in_U + 2);
  while (*psVar1 != -1) {
    if ((char)*psVar1 == -1) {
      psVar1 = (short *)((short)psVar1 + psVar1[1]);
    }
    else {
      API_FD04((char)((ushort)psVar1[1] >> 8));
    }
  }
  API_FDDE(0);
  BankPop();
  return in_stack_00000000;
}


// ===== API_FC18 @ 8c4c =====

undefined2 __h3000 API_FC18(void)

{
  undefined2 in_D;
  
  DAT_6032 = FUN_8c5d;
  DAT_6034 = FUN_8cd7;
  return in_D;
}


// ===== FUN_8c5d @ 8c5d =====

void __h3000 FUN_8c5d(void)

{
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->8C87 1->8C90 2->8C8A 3->8C87 4->8C87
                       5->8C80 6->8C78 7->8C87 */
  JumpTableDispatch(0,DAT_6058 & 7);
}


// ===== FUN_8c78 @ 8c78 =====

undefined2 __h3000 FUN_8c78(void)

{
  byte extraout_CC;
  undefined2 in_stack_00000000;
  
  FUN_8ca4();
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* WARNING: Subroutine does not return */
    FUN_8cbf();
  }
  return in_stack_00000000;
}


// ===== FUN_8c80 @ 8c80 =====

undefined2 __h3000 FUN_8c80(void)

{
  undefined2 in_stack_00000000;
  
  (*DAT_605a)((char)((ushort)DAT_60de >> 8));
  return in_stack_00000000;
}


// ===== FUN_8c87 @ 8c87 =====

undefined2 __h3000 FUN_8c87(void)

{
  undefined2 in_stack_00000000;
  
  return in_stack_00000000;
}


// ===== FUN_8c8a @ 8c8a =====

undefined2 __h3000 FUN_8c8a(void)

{
  byte extraout_CC;
  undefined2 in_stack_00000000;
  
  FUN_8ca4();
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* WARNING: Subroutine does not return */
    FUN_8cbf();
  }
  return in_stack_00000000;
}


// ===== FUN_8c90 @ 8c90 =====

undefined2 __h3000 FUN_8c90(void)

{
  undefined2 in_stack_00000000;
  
  DAT_6054 = DAT_6054 + DAT_60de;
  if (!(bool)((DAT_6054 < DAT_6056) + (DAT_6054 == DAT_6056))) {
    DAT_6054 = DAT_6056;
  }
  (*DAT_605a)();
  return in_stack_00000000;
}


// ===== FUN_8ca4 @ 8ca4 =====

undefined2 __h3000 FUN_8ca4(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  if ((DAT_604c == '\0') || (API_FCAA(), (extraout_CC >> 2 & 1) != 0)) {
    API_FCA8((char)((ushort)DAT_60e0 >> 8));
  }
  return in_D;
}


// ===== FUN_8cbf @ 8cbf =====

undefined2 __h3000 FUN_8cbf(void)

{
  undefined2 in_D;
  
  if (DAT_604c == '\0') {
    API_FCA8((char)((ushort)(DAT_60e0 + 100) >> 8));
  }
  DAT_604c = 0xff;
  return in_D;
}


// ===== FUN_8cd7 @ 8cd7 =====

void __h3000 FUN_8cd7(void)

{
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->8D04 1->8D0F 2->8D07 3->8D04 4->8D04
                       5->8CFA 6->8CF2 7->8D04 */
  JumpTableDispatch(0,DAT_6058 & 7);
}


// ===== FUN_8cf2 @ 8cf2 =====

undefined2 __h3000 FUN_8cf2(void)

{
  byte extraout_CC;
  undefined2 in_stack_00000000;
  
  FUN_8ca4();
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* WARNING: Subroutine does not return */
    FUN_8cbf();
  }
  return in_stack_00000000;
}


// ===== FUN_8cfa @ 8cfa =====

undefined2 __h3000 FUN_8cfa(void)

{
  undefined2 in_stack_00000000;
  
  (*DAT_605a)((char)((ushort)-DAT_60de >> 8));
  return in_stack_00000000;
}


// ===== FUN_8d04 @ 8d04 =====

undefined2 __h3000 FUN_8d04(void)

{
  undefined2 in_stack_00000000;
  
  return in_stack_00000000;
}


// ===== FUN_8d07 @ 8d07 =====

undefined2 __h3000 FUN_8d07(void)

{
  byte extraout_CC;
  undefined2 in_stack_00000000;
  
  FUN_8ca4();
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* WARNING: Subroutine does not return */
    FUN_8cbf();
  }
  return in_stack_00000000;
}


// ===== FUN_8d0f @ 8d0f =====

undefined2 __h3000 FUN_8d0f(void)

{
  ushort uVar1;
  undefined2 in_stack_00000000;
  
  uVar1 = DAT_6054 - DAT_60de;
  if (!(bool)((uVar1 < DAT_6054) + (uVar1 == DAT_6054))) {
    uVar1 = 0;
  }
  DAT_6054 = uVar1;
  (*DAT_605a)();
  return in_stack_00000000;
}


// ===== API_FC14 @ 8d23 =====

undefined2 __h3000 API_FC14(void)

{
  undefined2 in_D;
  
  DAT_60db = 0;
  DAT_6120 = -DAT_606e;
  DAT_611e = DAT_6120 + DAT_606c;
  if (DAT_6066 != '\0') {
    DAT_6062 = DAT_6074 + DAT_6120;
    DAT_605c = FUN_8d7d;
    DAT_6064 = DAT_611e;
    API_FC28();
  }
  if (DAT_6058 != '\0') {
    DAT_6056 = DAT_611e;
    DAT_6054 = DAT_6074 + DAT_6120;
    DAT_605a = FUN_8daf;
    API_FC18();
  }
  DAT_606a = FUN_8dc1;
  API_FC1E();
  return in_D;
}


// ===== FUN_8d7d @ 8d7d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_8d7d(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  
  DAT_60db = 1;
  DAT_6054 = DAT_6062;
  DAT_6074 = DAT_6062 - DAT_6120;
  DAT_604d = 0;
  uVar1 = (undefined1)DAT_6074;
  *(short *)(param_3 + -2) = DAT_6074;
  API_FC40(0x10,uVar1,param_1,&DAT_609a);
  FUN_8e7e();
  (*DAT_6070)((char)((ushort)DAT_6074 >> 8));
  (*DAT_6072)();
  return in_D;
}


// ===== FUN_8daf @ 8daf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_8daf(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  DAT_60db = 2;
  DAT_6062 = DAT_6054;
  DAT_6074 = DAT_6054 - DAT_6120;
  DAT_604d = 0;
  uVar1 = (undefined1)DAT_6074;
  *(short *)(param_3 + -2) = DAT_6074;
  API_FC40(0x10,uVar1,param_1,&DAT_609a);
  FUN_8e7e();
  (*DAT_6070)((char)((ushort)DAT_6074 >> 8));
  (*DAT_6072)();
  return in_D;
}


// ===== FUN_8dc1 @ 8dc1 =====

undefined2 __h3000 FUN_8dc1(void)

{
  undefined2 in_D;
  
  DAT_60db = 3;
  DAT_6054 = DAT_6074 + DAT_6120;
  DAT_6062 = DAT_6054;
  FUN_8e7e();
  (*DAT_6072)((char)((ushort)DAT_6074 >> 8));
  return in_D;
}


// ===== FUN_8de1 @ 8de1 =====

undefined2 __h3000 FUN_8de1(void)

{
  undefined2 uVar1;
  undefined1 *in_stack_00000000;
  short sStack_b;
  
                    /* inline[API_FC16]: 00 00 00 00 00 00 00 00 $0000 $0000 $0000 ->$0000 ->$0000
                       $0000 $0000 $0000 */
  uVar1 = SetupParamEditPage();
  DAT_6066 = *in_stack_00000000;
  DAT_6067 = in_stack_00000000[1];
  DAT_6058 = in_stack_00000000[2];
  DAT_60e0 = (ushort)(byte)in_stack_00000000[3];
  DAT_6068 = in_stack_00000000[4];
  DAT_6099 = in_stack_00000000[5];
  DAT_6069 = in_stack_00000000[6];
  sStack_b = 0;
  if ((char)in_stack_00000000[7] < '\0') {
    sStack_b = DAT_600d;
  }
  if ((in_stack_00000000[7] & 0x40) == 0) {
    DAT_606c = *(undefined2 *)(in_stack_00000000 + 8);
    DAT_606e = *(undefined2 *)(in_stack_00000000 + 10);
  }
  else {
    DAT_606c = **(undefined2 **)(in_stack_00000000 + 8);
    DAT_606e = **(undefined2 **)(in_stack_00000000 + 10);
  }
  DAT_6070 = *(short *)(in_stack_00000000 + 0xe) + sStack_b;
  DAT_6072 = *(short *)(in_stack_00000000 + 0x10) + sStack_b;
  DAT_60dc = *(undefined2 *)(in_stack_00000000 + 0x12);
  DAT_60de = *(undefined2 *)(in_stack_00000000 + 0x14);
  API_FC14((char)((ushort)*(undefined2 *)(in_stack_00000000 + 0x16) >> 8));
  return uVar1;
}


// ===== SetupParamEditPage @ 8dfc =====

/* Kernel API slot $FC16: inline 24-byte record: limits + display/adjust callbacks */

undefined2 __h3000 SetupParamEditPage(void)

{
  undefined2 in_D;
  undefined1 *local_res0;
  short local_b;
  
  DAT_6066 = *local_res0;
  DAT_6067 = local_res0[1];
  DAT_6058 = local_res0[2];
  DAT_60e0 = (ushort)(byte)local_res0[3];
  DAT_6068 = local_res0[4];
  DAT_6099 = local_res0[5];
  DAT_6069 = local_res0[6];
  local_b = 0;
  if ((char)local_res0[7] < '\0') {
    local_b = DAT_600d;
  }
  if ((local_res0[7] & 0x40) == 0) {
    DAT_606c = *(undefined2 *)(local_res0 + 8);
    DAT_606e = *(undefined2 *)(local_res0 + 10);
  }
  else {
    DAT_606c = **(undefined2 **)(local_res0 + 8);
    DAT_606e = **(undefined2 **)(local_res0 + 10);
  }
  DAT_6070 = *(short *)(local_res0 + 0xe) + local_b;
  DAT_6072 = *(short *)(local_res0 + 0x10) + local_b;
  DAT_60dc = *(undefined2 *)(local_res0 + 0x12);
  DAT_60de = *(undefined2 *)(local_res0 + 0x14);
  API_FC14((char)((ushort)*(undefined2 *)(local_res0 + 0x16) >> 8));
  return in_D;
}


// ===== FUN_8e7e @ 8e7e =====

undefined2 __h3000 FUN_8e7e(void)

{
  undefined2 in_D;
  
  if ((char)((DAT_6074 < DAT_6122) + (DAT_6074 == DAT_6122)) == '\0') {
    DAT_60e2 = 1;
  }
  else if (DAT_6074 < DAT_6122) {
    DAT_60e2 = 0xff;
  }
  else {
    DAT_60e2 = 0;
  }
  DAT_6122 = DAT_6074;
  return in_D;
}


// ===== API_FC1A @ 8eb9 =====

undefined2 __h3000 API_FC1A(undefined1 param_1,undefined1 param_2)

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
  
  FUN_8eff(1,param_2,&DAT_604e);
  FUN_8eff();
  FUN_8eff();
  FUN_8eff();
  FUN_8eff();
  FUN_8eff();
  FUN_8f09(extraout_A,0,&DAT_604e);
  cVar2 = extraout_B;
  if (!(bool)(extraout_CC >> 2 & 1)) {
    FUN_8f09();
    cVar2 = extraout_B_00;
    if (!(bool)(extraout_CC_00 >> 2 & 1)) {
      FUN_8f09();
      cVar2 = extraout_B_01;
      if (!(bool)(extraout_CC_01 >> 2 & 1)) {
        FUN_8f09();
        cVar2 = extraout_B_02;
        if (!(bool)(extraout_CC_02 >> 2 & 1)) {
          FUN_8f09();
          cVar2 = extraout_B_03;
          if (!(bool)(extraout_CC_03 >> 2 & 1)) {
            FUN_8f09();
            cVar2 = extraout_B_04;
            if ((!(bool)(extraout_CC_04 >> 2 & 1)) && ((DAT_604e & 4) != 0)) {
              uVar1 = 0;
              goto LAB_8efc;
            }
          }
        }
      }
    }
  }
  uVar1 = (&DAT_8ea0)[cVar2];
LAB_8efc:
  return CONCAT11(param_1,uVar1);
}


// ===== FUN_8eff @ 8eff =====

void __h3000 FUN_8eff(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  undefined1 uVar1;
  
  DAT_8057 = param_1;
  uVar1 = DAT_8056;
  *param_3 = uVar1;
  return;
}


// ===== FUN_8f09 @ 8f09 =====

void __h3000 FUN_8f09(void)

{
  return;
}


// ===== API_FC1C @ 8f2c =====

undefined2 __h3000 API_FC1C(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  byte extraout_B;
  byte extraout_B_00;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC1A();
  if (extraout_B == DAT_60fd) {
    if (DAT_604c == '\0') {
      return uStack_4;
    }
  }
  else {
    DAT_604c = '\0';
  }
  DAT_60fd = extraout_B;
  if ((extraout_B & 0x10) != 0) {
    (*DAT_6044)(extraout_A,extraout_B);
    (*DAT_6046)();
    return uStack_4;
  }
  FUN_905d();
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->8F72 1->8F78 2->8F7E 3->8F84 4->8F8A
                       5->8F90 6->8F96 7->8F9C 8->8FA2 9->8FA8 10->8FAE 11->8FB4 12->8FBA 13->8FC5
                       14->8FD0 15->8FD3 */
  JumpTableDispatch(0,extraout_B_00 & 0xf);
}


// ===== FUN_8f72 @ 8f72 =====

undefined2 __h3000 FUN_8f72(void)

{
  undefined2 in_stack_00000001;
  
  (*DAT_6048)();
  return in_stack_00000001;
}


// ===== FUN_8f78 @ 8f78 =====

void __h3000 FUN_8f78(void)

{
  (*DAT_603c)();
  FUN_8fe4();
  return;
}


// ===== FUN_8f7e @ 8f7e =====

void __h3000 FUN_8f7e(void)

{
  (*DAT_603e)();
  FUN_8fe4();
  return;
}


// ===== FUN_8f84 @ 8f84 =====

void __h3000 FUN_8f84(void)

{
  (*DAT_6040)();
  FUN_8fe4();
  return;
}


// ===== FUN_8f8a @ 8f8a =====

void __h3000 FUN_8f8a(void)

{
  (*DAT_6042)();
  FUN_8fe4();
  return;
}


// ===== FUN_8f90 @ 8f90 =====

void __h3000 FUN_8f90(void)

{
  (*DAT_603a)();
  FUN_8fe4();
  return;
}


// ===== FUN_8f96 @ 8f96 =====

void __h3000 FUN_8f96(void)

{
  (*DAT_6030)();
  FUN_8fe4();
  return;
}


// ===== FUN_8f9c @ 8f9c =====

void __h3000 FUN_8f9c(void)

{
  (*DAT_602e)();
  FUN_8fe4();
  return;
}


// ===== FUN_8fa2 @ 8fa2 =====

void __h3000 FUN_8fa2(void)

{
  (*DAT_602a)();
  FUN_8fe4();
  return;
}


// ===== FUN_8fa8 @ 8fa8 =====

void __h3000 FUN_8fa8(void)

{
  (*DAT_602c)();
  FUN_8fe4();
  return;
}


// ===== FUN_8fae @ 8fae =====

void __h3000 FUN_8fae(void)

{
  (*DAT_6032)();
  FUN_8fe4();
  return;
}


// ===== FUN_8fb4 @ 8fb4 =====

void __h3000 FUN_8fb4(void)

{
  (*DAT_6034)();
  FUN_8fe4();
  return;
}


// ===== FUN_8fba @ 8fba =====

void __h3000 FUN_8fba(void)

{
  if (DAT_604d == '\0') {
    (*DAT_6038)();
  }
  FUN_8fd6();
  return;
}


// ===== FUN_8fc5 @ 8fc5 =====

void __h3000 FUN_8fc5(void)

{
  if (DAT_604d == '\0') {
    (*DAT_6036)();
  }
  FUN_8fd6();
  return;
}


// ===== FUN_8fd0 @ 8fd0 =====

undefined2 __h3000 FUN_8fd0(void)

{
  undefined2 in_stack_00000001;
  
  return in_stack_00000001;
}


// ===== FUN_8fd3 @ 8fd3 =====

undefined2 __h3000 FUN_8fd3(void)

{
  undefined2 in_stack_00000001;
  
  return in_stack_00000001;
}


// ===== FUN_8fd6 @ 8fd6 =====

undefined2 __h3000 FUN_8fd6(undefined1 param_1)

{
  undefined2 in_stack_00000001;
  
  (*DAT_6044)(param_1,DAT_60fd);
  (*DAT_6046)();
  return in_stack_00000001;
}


// ===== FUN_8fe4 @ 8fe4 =====

undefined2 __h3000 FUN_8fe4(void)

{
  undefined2 in_stack_00000001;
  
  DAT_604d = 0;
  return in_stack_00000001;
}


// ===== FUN_8fea @ 8fea =====

undefined2 __h3000 FUN_8fea(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FD18]: [$602A]=$8877 [$602C]=$8877 [$602E]=$8877 [$6030]=$8877
                       [$6032]=$8877 [$6034]=$8877 [$6036]=$8877 [$6038]=$8877 [$603A]=$8877
                       [$603C]=$8877 [$603E]=$8877 [$6040]=$8877 [$6042]=$8877 [$6044]=$8877
                       [$6046]=$8877 [$6048]=$8877 [$604A]=$8877 */
  StoreWordsInline();
  DAT_604c = 0;
  DAT_604d = 0;
  DAT_60fd = 0;
  return uStack_2;
}


// ===== FUN_9041 @ 9041 =====

undefined2 __h3000 FUN_9041(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  while( true ) {
    API_FC1A();
    if (extraout_B != DAT_60fd) break;
    FUN_859b();
  }
  return uStack_6;
}


// ===== API_FDAE @ 9053 =====

void __h3000 API_FDAE(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_8056;
  return;
}


// ===== FUN_905d @ 905d =====

byte __h3000 FUN_905d(undefined1 param_1,byte param_2)

{
  if ((char)((param_2 < 4) + (param_2 == 4)) != '\0') {
    DAT_60b9 = param_2 - 1;
  }
  return param_2;
}


// ===== API_FC1E @ 906a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FC1E(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 *puVar1;
  undefined2 *puVar2;
  undefined1 uStack_b;
  undefined1 uStack_a;
  undefined2 uStack_8;
  undefined2 uStack_6;
  undefined2 uStack_4;
  undefined2 uStack_2;
  
  uStack_a = (undefined1)DAT_6074;
  puVar1 = &uStack_b;
  uStack_b = (undefined1)((ushort)DAT_6074 >> 8);
  uStack_8 = in_D;
  uStack_6 = param_1;
  uStack_4 = param_2;
  uStack_2 = param_3;
  API_FC40(0x10,uStack_a,param_1,&DAT_609a);
  DAT_60a3 = 0;
  DAT_6044 = FUN_90ca;
  DAT_604d = 0;
  *(short *)(puVar1 + -2) = DAT_606c - DAT_606e;
  puVar1[-3] = 9;
  puVar2 = (undefined2 *)(puVar1 + -4);
  *(undefined1 *)puVar2 = 0;
  API_FCE6();
  DAT_6128 = *puVar2;
  DAT_6124 = DAT_6069 + -1;
  DAT_612b = 0xff;
  DAT_612a = 0xff;
  if (DAT_6099 == '\0') {
    DAT_612b = 0;
  }
  if (-1 < DAT_606e) {
    DAT_612a = 0;
    DAT_6124 = DAT_6069;
  }
  return uStack_8;
}


// ===== FUN_90ca @ 90ca =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_90ca(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  undefined2 *puVar2;
  undefined2 uStack_8;
  undefined2 uStack_6;
  undefined2 uStack_4;
  undefined2 uStack_2;
  
  puVar2 = &uStack_8;
  uStack_6 = param_1;
  uStack_4 = param_2;
  uStack_2 = param_3;
  if (DAT_604d == '\0') {
    DAT_6126 = 0;
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9110 1->9149 2->90F3 3->9115 4->9140
                       5->9110 6->9110 7->9110 */
    JumpTableDispatch();
  }
  uStack_8 = in_D;
  SwitchInline(0);
  if (DAT_604d == '\0') {
    FUN_9260();
  }
  if (DAT_6125 != '\0') {
    FUN_9280();
    DAT_6125 = DAT_6125 + -1;
    API_FD12();
    uVar1 = API_FD04(0,8,&DAT_6900,&DAT_609b);
    if (DAT_612c == '\0') {
      (*DAT_6070)();
    }
    else {
      uVar1 = API_FC20((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = uVar1;
      *(char *)((short)puVar2 + -1) = (char)uVar1;
      *(char *)((short)puVar2 + -2) = (char)((ushort)uVar1 >> 8);
      API_FC40(0x10);
      (*DAT_6070)();
      (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
    }
  }
  return uStack_8;
}


// ===== FUN_90f3 @ 90f3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000
FUN_90f3(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  ushort uVar1;
  byte in_stack_00000000;
  undefined2 in_stack_0000000c;
  
  if (0xf < in_stack_00000000) {
    if ((char)((in_stack_00000000 < 0x19) + (in_stack_00000000 == 0x19)) != '\0') {
      uVar1 = (ushort)(byte)(in_stack_00000000 - 0x10);
      if (!(bool)((uVar1 < DAT_606c) + (uVar1 == DAT_606c))) {
        uVar1 = DAT_606c;
      }
      DAT_6074 = uVar1;
      *(char *)(param_5 + -1) = (char)uVar1;
      *(char *)(param_5 + -2) = (char)(uVar1 >> 8);
      API_FC40(0x10,(char)uVar1,param_3,&DAT_609a);
      (*DAT_6070)();
      (*DAT_606a)((char)(DAT_6074 >> 8));
    }
  }
  return in_stack_0000000c;
}


// ===== FUN_9110 @ 9110 =====

undefined2 __h3000 FUN_9110(void)

{
  undefined2 in_stack_0000000c;
  
  return in_stack_0000000c;
}


// ===== FUN_9115 @ 9115 =====

undefined2 __h3000 FUN_9115(void)

{
  undefined2 uVar1;
  short sVar2;
  short *in_U;
  short *psVar3;
  byte in_stack_00000000;
  undefined2 in_stack_0000000c;
  
  if ((0xf < in_stack_00000000) &&
     ((char)((in_stack_00000000 < 0x19) + (in_stack_00000000 == 0x19)) != '\0')) {
    sVar2 = DAT_606c;
    if (in_stack_00000000 != 0x19) {
      *(byte *)((short)in_U + -1) = in_stack_00000000 - 0x10;
      *(undefined1 *)(in_U + -1) = 0;
      uVar1 = DAT_6128;
      *(char *)((short)in_U + -3) = (char)DAT_6128;
      psVar3 = in_U + -2;
      *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
      API_FCEE();
      in_U = psVar3 + 1;
      sVar2 = DAT_606e + *psVar3;
    }
    DAT_6074 = sVar2;
    *(char *)((short)in_U + -1) = (char)sVar2;
    *(char *)(in_U + -1) = (char)((ushort)sVar2 >> 8);
    API_FC40(0x10);
    (*DAT_6070)();
    (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
  }
  return in_stack_0000000c;
}


// ===== FUN_9140 @ 9140 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_9140(void)

{
  undefined2 uVar1;
  undefined2 in_U;
  short sVar2;
  undefined1 uStack0000;
  undefined2 in_stack_0000000c;
  undefined1 uStack_1;
  
  DAT_612c = -1;
  uStack0000 = 0x52;
  SwitchInline(0);
  if (DAT_604d == '\0') {
    uStack0000 = 0x70;
    FUN_9260();
  }
  if (DAT_6125 != '\0') {
    uStack0000 = 0x7a;
    FUN_9280();
    DAT_6125 = DAT_6125 + -1;
    uStack0000 = (undefined1)in_U;
    API_FD12();
    sVar2 = CONCAT11((char)((ushort)in_U >> 8),uStack0000);
    uStack0000 = 0x98;
    uVar1 = API_FD04(0,8,&DAT_6900,&DAT_609b);
    if (DAT_612c == '\0') {
      uStack0000 = 0xa3;
      (*DAT_6070)();
    }
    else {
      uStack0000 = 0x42;
      uVar1 = API_FC20((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = uVar1;
      *(char *)(sVar2 + -1) = (char)uVar1;
      *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
      uStack0000 = 0x50;
      API_FC40(0x10);
      uStack0000 = 0x54;
      (*DAT_6070)();
      uStack0000 = 0x5b;
      (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
    }
  }
  return in_stack_0000000c;
}


// ===== FUN_9149 @ 9149 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_9149(void)

{
  undefined2 uVar1;
  undefined2 in_U;
  short sVar2;
  undefined1 uStack0000;
  undefined2 in_stack_0000000c;
  undefined1 uStack_1;
  
  DAT_612c = '\0';
  uStack0000 = 0x52;
                    /* inline[API_FD16]: switch(D) 000C->9236 000D->91F1 001A->91A6 001B->91C5 */
  SwitchInline(0);
  if (DAT_604d == '\0') {
    uStack0000 = 0x70;
    FUN_9260();
  }
  if (DAT_6125 != '\0') {
    uStack0000 = 0x7a;
    FUN_9280();
    DAT_6125 = DAT_6125 + -1;
    uStack0000 = (undefined1)in_U;
    API_FD12();
    sVar2 = CONCAT11((char)((ushort)in_U >> 8),uStack0000);
    uStack0000 = 0x98;
    uVar1 = API_FD04(0,8,&DAT_6900,&DAT_609b);
    if (DAT_612c == '\0') {
      uStack0000 = 0xa3;
      (*DAT_6070)();
    }
    else {
      uStack0000 = 0x42;
      uVar1 = API_FC20((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_609a);
      DAT_6074 = uVar1;
      *(char *)(sVar2 + -1) = (char)uVar1;
      *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
      uStack0000 = 0x50;
      API_FC40(0x10);
      uStack0000 = 0x54;
      (*DAT_6070)();
      uStack0000 = 0x5b;
      (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
    }
  }
  return in_stack_0000000c;
}


// ===== FUN_91a6 @ 91a6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_91a6(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 in_stack_0000000b;
  
  if (DAT_612b != '\0') {
    if (DAT_604d == '\0') {
      FUN_9260();
    }
    if (DAT_6126 == '\0') {
      DAT_6126 = -1;
      if (DAT_604d == '\0') {
        FUN_9260();
      }
      if (DAT_6125 != '\0') {
        FUN_9280();
        DAT_6125 = DAT_6125 + -1;
        API_FD12();
        uVar1 = API_FD04(0,8,&DAT_6900,&DAT_609b);
        if (DAT_612c == '\0') {
          (*DAT_6070)();
        }
        else {
          uVar1 = API_FC20((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_609a);
          DAT_6074 = uVar1;
          *(char *)(in_U + -1) = (char)uVar1;
          *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
          API_FC40(0x10);
          (*DAT_6070)();
          (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
        }
      }
    }
  }
  return in_stack_0000000b;
}


// ===== FUN_91c5 @ 91c5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_91c5(void)

{
  char cVar1;
  undefined2 uVar2;
  char *pcVar3;
  short in_U;
  undefined2 in_stack_0000000b;
  
  if (DAT_612a != '\0') {
    if (DAT_604d == '\0') {
      FUN_9260();
    }
    FUN_9280();
    pcVar3 = (char *)0x6909;
    do {
      pcVar3 = pcVar3 + -1;
      if (*pcVar3 == ' ') {
        cVar1 = '-';
        goto LAB_918b;
      }
    } while (*pcVar3 != '-');
    cVar1 = ' ';
LAB_918b:
    *pcVar3 = cVar1;
    uVar2 = API_FD04(0,8,&DAT_6900,&DAT_609b);
    if (DAT_612c == '\0') {
      (*DAT_6070)();
    }
    else {
      uVar2 = API_FC20((char)((ushort)uVar2 >> 8),(char)uVar2,&DAT_609a);
      DAT_6074 = uVar2;
      *(char *)(in_U + -1) = (char)uVar2;
      *(char *)(in_U + -2) = (char)((ushort)uVar2 >> 8);
      API_FC40(0x10);
      (*DAT_6070)();
      (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
    }
  }
  return in_stack_0000000b;
}


// ===== FUN_91f1 @ 91f1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_91f1(void)

{
  undefined1 extraout_A;
  undefined2 uVar1;
  byte extraout_CC;
  short in_U;
  undefined2 in_stack_0000000b;
  
  if (DAT_6127 != '\0') {
    API_FD04(0,0x78,&DAT_6908);
    DAT_6127 = DAT_6127 + -1;
    if (DAT_6127 == '\0') {
      DAT_604d = 0;
      uVar1 = DAT_612d;
    }
    else {
      DAT_6126 = 0;
      API_FD0E(extraout_A,0x2e,&DAT_6900);
      if ((extraout_CC >> 2 & 1) != 0) {
        DAT_6126 = 0xff;
      }
      DAT_6125 = DAT_6900;
      DAT_6900 = 0x20;
      uVar1 = API_FD04(0,8,&DAT_6900,&DAT_609b);
      if (DAT_612c == '\0') {
        (*DAT_6070)();
        return in_stack_0000000b;
      }
      uVar1 = API_FC20((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_609a);
    }
    DAT_6074 = uVar1;
    *(char *)(in_U + -1) = (char)uVar1;
    *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
    API_FC40(0x10);
    (*DAT_6070)();
    (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
  }
  return in_stack_0000000b;
}


// ===== FUN_9236 @ 9236 =====

undefined2 __h3000 FUN_9236(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 in_stack_0000000b;
  
  DAT_604d = 0;
  DAT_6127 = 0;
  uVar1 = API_FC20();
  DAT_6074 = uVar1;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0x10);
  (*DAT_6070)();
  (*DAT_606a)((char)((ushort)DAT_6074 >> 8));
  return in_stack_0000000b;
}


// ===== FUN_9260 @ 9260 =====

undefined2 __h3000 FUN_9260(void)

{
  undefined2 in_D;
  
  DAT_6125 = DAT_6124;
  DAT_604d = 0xff;
                    /* inline[API_FD0C]: $0008 20 */
  MemsetInline();
  DAT_612d = DAT_6074;
  return in_D;
}


// ===== FUN_9280 @ 9280 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_9280(void)

{
  undefined2 in_D;
  char cVar1;
  short sVar2;
  short sVar3;
  
  DAT_6900 = DAT_6125;
  sVar2 = 0x6970;
  cVar1 = '\x0f';
  sVar3 = 27000;
  do {
    API_FD04(0,8,sVar2);
    sVar2 = sVar3 + -0x18;
    cVar1 = cVar1 + -1;
    sVar3 = sVar3 + -0x10;
  } while (cVar1 != '\0');
  DAT_6127 = DAT_6127 + 1;
  if (0xf < DAT_6127) {
    DAT_6127 = 0xf;
  }
  DAT_6900 = 0x20;
  return in_D;
}


// ===== API_FC20 @ 92b6 =====

short __h3000 API_FC20(void)

{
  byte bVar1;
  short sVar2;
  char extraout_A;
  char cVar3;
  byte *pbVar4;
  short sVar6;
  short in_U;
  short *psVar7;
  short *psVar8;
  char local_d;
  char local_a;
  char local_9;
  byte *pbVar5;
  
  *(undefined1 *)(in_U + -1) = 0;
  psVar7 = (short *)(in_U + -2);
  *(char *)psVar7 = '\0';
  local_a = '\0';
  local_9 = '\0';
  local_d = '\0';
  pbVar5 = &DAT_609a;
  do {
    while( true ) {
      while( true ) {
        do {
          pbVar4 = pbVar5 + 1;
          bVar1 = *pbVar5;
          if (bVar1 == 0) goto LAB_9329;
          pbVar5 = pbVar4;
        } while (bVar1 == 0x20);
        if (bVar1 != 0x2d) break;
        local_d = -1;
      }
      if (bVar1 == 0x2e) break;
      if ((bVar1 < 0x30) || ((char)((bVar1 < 0x39) + (bVar1 == 0x39)) == '\0')) goto LAB_9382;
      psVar7 = psVar7 + -1;
      *psVar7 = 10;
      cVar3 = API_FCF0();
      if (*psVar7 != 0) goto LAB_9382;
      *(char *)((short)psVar7 + 1) = cVar3 + -0x30;
      *(char *)psVar7 = '\0';
      API_FCE2();
      if (*(char *)psVar7 < '\0') goto LAB_9382;
      pbVar5 = pbVar4;
      if ((local_9 != '\0') && (local_a = local_a + '\x01', local_a == DAT_6099)) goto LAB_9329;
    }
    local_9 = -1;
  } while (DAT_6099 != '\0');
LAB_9329:
  if ((pbVar4[-1] != 0) &&
     (((bVar1 = *pbVar4, bVar1 != 0 && (0x34 < bVar1)) &&
      ((char)((bVar1 < 0x39) + (bVar1 == 0x39)) != '\0')))) {
    *(char *)((short)psVar7 + -1) = '\x01';
    psVar7 = psVar7 + -1;
    *(char *)psVar7 = '\0';
    API_FCE2();
    if (*(char *)psVar7 < '\0') goto LAB_9382;
  }
  while( true ) {
    if (local_a == DAT_6099) {
      if (local_d != '\0') {
        API_FCE0();
      }
      sVar2 = DAT_606e;
      sVar6 = *psVar7;
      *(char *)((short)psVar7 + 1) = (char)DAT_606e;
      *(char *)psVar7 = (char)((ushort)sVar2 >> 8);
      sVar2 = DAT_606c;
      *(char *)((short)psVar7 + -1) = (char)DAT_606c;
      *(char *)(psVar7 + -1) = (char)((ushort)sVar2 >> 8);
      psVar7 = psVar7 + -2;
      *psVar7 = sVar6;
      API_FCD8();
      return *psVar7;
    }
    psVar8 = psVar7 + -1;
    *psVar8 = 10;
    API_FCF0();
    psVar7 = psVar8 + 1;
    if ((*psVar8 != 0) || (*(char *)psVar7 < '\0')) break;
    local_a = extraout_A + '\x01';
  }
LAB_9382:
  if (local_d == '\0') {
    return DAT_606c;
  }
  return DAT_606e;
}


// ===== API_FC22 @ 9393 =====

undefined2 __h3000 API_FC22(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_6133 = 8;
  return uStack_2;
}


// ===== API_FC24 @ 939d =====

void __h3000 API_FC24(void)

{
  char cVar1;
  byte bVar2;
  byte bVar3;
  
  bVar3 = DAT_6131;
  cVar1 = DAT_612f;
  DAT_612f = DAT_612f + '\x01';
  if (DAT_612f == '\0') {
    DAT_612f = cVar1;
  }
  bVar2 = DAT_8056;
  bVar2 = (bVar2 & 0xc0) >> 2;
  DAT_6131 = (bVar2 | DAT_6131) >> 2;
  cVar1 = (&DAT_93ec)[(char)DAT_6131];
  if (cVar1 == '\0') {
    bVar3 = (bVar2 | bVar3 & 0x30) >> 2;
    if ((bVar3 != 0) && (bVar3 != 0xc)) {
      if (bVar3 == DAT_6133) {
        DAT_6134 = '\0';
      }
      else {
        DAT_6130 = DAT_6132 + DAT_6130;
        DAT_6133 = bVar3;
      }
    }
  }
  else if (DAT_6134 == '\0') {
    DAT_6132 = cVar1;
    DAT_6134 = cVar1;
  }
  if (DAT_6135 == '\0') {
    return;
  }
  DAT_605e = DAT_6130;
  DAT_6060 = DAT_612f;
  DAT_6130 = 0;
  DAT_612f = 0;
  DAT_6135 = 0;
  return;
}


// ===== API_FC26 @ 9413 =====

/* WARNING: Removing unreachable block (RAM,0x9426) */

undefined2 __h3000 API_FC26(void)

{
  undefined *puVar1;
  
  DAT_6135 = 0xff;
  puVar1 = &UNK_07d0;
  do {
    puVar1 = puVar1 + -1;
  } while (puVar1 != (undefined *)0x0);
  return 0;
}


// ===== API_FC28 @ 9434 =====

void __h3000 API_FC28(void)

{
  API_FC26();
  FUN_9511();
  return;
}


// ===== FUN_943b @ 943b =====

void __h3000 FUN_943b(void)

{
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9468 1->946B 2->9456 3->9458 4->9468
                       5->9468 6->9468 7->9468 */
  JumpTableDispatch(0,DAT_6066 & 7);
}


// ===== thunk_FUN_946b @ 9456 =====

undefined2 __h3000 thunk_FUN_946b(void)

{
  short sVar1;
  char extraout_A;
  ushort uVar2;
  undefined2 uVar3;
  short in_U;
  short *psVar4;
  undefined2 in_stack_00000000;
  
  API_FC26();
  FUN_94a8();
  if (extraout_A != '\0') {
    *(char *)(in_U + -1) = extraout_A;
    *(char *)(in_U + -2) = extraout_A >> 7;
    uVar3 = DAT_60dc;
    *(char *)(in_U + -3) = (char)DAT_60dc;
    psVar4 = (short *)(in_U + -4);
    *(char *)psVar4 = (char)((ushort)uVar3 >> 8);
    API_FCEC();
    sVar1 = *psVar4;
    if (sVar1 < 0) {
      uVar2 = sVar1 + DAT_6062;
      if (!(bool)((uVar2 < DAT_6062) + (uVar2 == DAT_6062))) {
        uVar2 = 0;
      }
    }
    else {
      uVar2 = sVar1 + DAT_6062;
      if (!(bool)((uVar2 < DAT_6064) + (uVar2 == DAT_6064))) {
        uVar2 = DAT_6064;
      }
    }
    DAT_6062 = uVar2;
    uVar3 = FUN_9464();
    return uVar3;
  }
  return in_stack_00000000;
}


// ===== FUN_9458 @ 9458 =====

undefined2 __h3000 FUN_9458(void)

{
  char extraout_A;
  undefined2 in_stack_00000000;
  
  API_FC26();
  FUN_94a8();
  if (extraout_A != '\0') {
    (*DAT_605c)(extraout_A >> 7);
  }
  return in_stack_00000000;
}


// ===== FUN_9464 @ 9464 =====

undefined2 __h3000 FUN_9464(void)

{
  undefined2 in_stack_00000000;
  
  (*DAT_605c)();
  return in_stack_00000000;
}


// ===== FUN_9468 @ 9468 =====

undefined2 __h3000 FUN_9468(void)

{
  undefined2 in_stack_00000000;
  
  return in_stack_00000000;
}


// ===== FUN_946b @ 946b =====

undefined2 __h3000 FUN_946b(void)

{
  short sVar1;
  char extraout_A;
  ushort uVar2;
  undefined2 uVar3;
  short in_U;
  short *psVar4;
  undefined2 in_stack_00000000;
  
  API_FC26();
  FUN_94a8();
  if (extraout_A != '\0') {
    *(char *)(in_U + -1) = extraout_A;
    *(char *)(in_U + -2) = extraout_A >> 7;
    uVar3 = DAT_60dc;
    *(char *)(in_U + -3) = (char)DAT_60dc;
    psVar4 = (short *)(in_U + -4);
    *(char *)psVar4 = (char)((ushort)uVar3 >> 8);
    API_FCEC();
    sVar1 = *psVar4;
    if (sVar1 < 0) {
      uVar2 = sVar1 + DAT_6062;
      if (!(bool)((uVar2 < DAT_6062) + (uVar2 == DAT_6062))) {
        uVar2 = 0;
      }
    }
    else {
      uVar2 = sVar1 + DAT_6062;
      if (!(bool)((uVar2 < DAT_6064) + (uVar2 == DAT_6064))) {
        uVar2 = DAT_6064;
      }
    }
    DAT_6062 = uVar2;
    uVar3 = FUN_9464();
    return uVar3;
  }
  return in_stack_00000000;
}


// ===== FUN_94a8 @ 94a8 =====

void __h3000 FUN_94a8(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)((ushort)in_D >> 8) != '\0') {
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->94E4 1->94C0 2->94CB 3->94D7 */
    JumpTableDispatch(0);
  }
                    /* WARNING: Could not recover jumptable at 0x94e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


// ===== FUN_94c0 @ 94c0 =====

void __h3000 FUN_94c0(void)

{
  char extraout_A;
  undefined1 extraout_A_00;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_94e8();
  FUN_94f9(extraout_A >> 1);
                    /* WARNING: Could not recover jumptable at 0x94e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,in_stack_00000001);
  return;
}


// ===== FUN_94cb @ 94cb =====

void __h3000 FUN_94cb(void)

{
  char extraout_A;
  undefined1 extraout_A_00;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_94e8();
  FUN_94f9(extraout_A >> 2);
                    /* WARNING: Could not recover jumptable at 0x94e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,in_stack_00000001);
  return;
}


// ===== FUN_94d7 @ 94d7 =====

void __h3000 FUN_94d7(void)

{
  char extraout_A;
  undefined1 extraout_A_00;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_94e8();
  FUN_94f9(extraout_A >> 3);
                    /* WARNING: Could not recover jumptable at 0x94e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A_00,in_stack_00000001);
  return;
}


// ===== FUN_94e4 @ 94e4 =====

void __h3000 FUN_94e4(void)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x94e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001);
  return;
}


// ===== FUN_94e8 @ 94e8 =====

void __h3000 FUN_94e8(void)

{
  char in_stack_00000002;
  
  DAT_6139 = in_stack_00000002 + DAT_6137;
  if (-1 < DAT_6139) {
    DAT_6139 = '\0';
  }
  return;
}


// ===== FUN_94f9 @ 94f9 =====

void __h3000 FUN_94f9(char param_1)

{
  char in_stack_00000002;
  
  if (param_1 == '\0') {
    DAT_6137 = in_stack_00000002 + DAT_6137;
  }
  else {
    DAT_6137 = '\0';
  }
  return;
}


// ===== FUN_9511 @ 9511 =====

void __h3000 FUN_9511(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_6067 & 0xf0) != 0) {
    if ((DAT_6067 & 0xc0) != 0) {
      DAT_6136 = 3;
      goto LAB_9534;
    }
    if ((DAT_6067 & 0x20) != 0) {
      DAT_6136 = 2;
      goto LAB_9534;
    }
    if ((DAT_6067 & 0x10) != 0) {
      DAT_6136 = 1;
      goto LAB_9534;
    }
  }
  DAT_6136 = 0;
LAB_9534:
  DAT_6137 = 0;
                    /* WARNING: Could not recover jumptable at 0x953a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== API_FC90 @ 953c =====

undefined2 __h3000 API_FC90(undefined1 param_1,undefined1 param_2)

{
  undefined1 uVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_8300 = 3;
  DAT_8300 = 0x15;
  uVar1 = DAT_8301;
  return uStack_2;
}


// ===== API_FC92 @ 954e =====

void __h3000 API_FC92(void)

{
  undefined1 uVar1;
  
  DAT_8300 = 0x95;
  uVar1 = DAT_8301;
  return;
}


// ===== API_FC94 @ 955b =====

void __h3000 API_FC94(void)

{
  DAT_8300 = 0x15;
  return;
}


// ===== API_FDD8 @ 9565 =====

undefined2 __h3000 API_FDD8(void)

{
  undefined2 in_stack_00000002;
  
  API_FC90();
  DAT_6083 = 0;
  DAT_6085 = 0;
  DAT_6081 = 0;
  DAT_6082 = 0xff;
  DAT_6087 = 0;
                    /* inline[API_FE30]: $68A0 */
  FUN_eaf8(0x95);
                    /* inline[API_FE2E]: $68A0 */
  FUN_eb0c();
                    /* inline[API_FE2E]: $68C0 */
  FUN_eb0c();
  DAT_60f2 = FUN_8601;
  DAT_608b = API_FD80;
  BankPushSelect();
  DAT_619c = DAT_0116;
  DAT_6161 = DAT_010f;
  DAT_60fc = DAT_0111;
  DAT_619d = DAT_0117;
  DAT_613a = 1;
  BankPop();
  return in_stack_00000002;
}


// ===== API_FDDA @ 95c4 =====

undefined1 __h3000 API_FDDA(undefined1 param_1,undefined1 param_2)

{
  if (DAT_6082 == '\0') {
    param_2 = *(undefined1 *)(DAT_6085 + 0x7800);
    DAT_6085 = DAT_6085 + 1 & 0x3ff;
    if (DAT_6085 == DAT_6083) {
      DAT_6082 = -1;
    }
    DAT_6081 = 0;
  }
  return param_2;
}


// ===== API_FC96 @ 95f3 =====

void __h3000 API_FC96(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_8300;
  return;
}


// ===== API_FC98 @ 95fd =====

undefined2 __h3000 API_FC98(undefined1 param_1,undefined1 param_2)

{
  byte bVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  do {
    bVar1 = DAT_8300;
  } while ((bVar1 & 2) == 0);
  DAT_8301 = param_2;
  return uStack_2;
}


// ===== API_FC9A @ 960e =====

undefined2 __h3000 API_FC9A(undefined1 param_1,undefined1 param_2,char *param_3)

{
  byte bVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  while( true ) {
    if (*param_3 == -1) break;
    do {
      bVar1 = DAT_8300;
    } while ((bVar1 & 2) == 0);
    DAT_8301 = *param_3;
    param_3 = param_3 + 1;
  }
  return uStack_2;
}


// ===== API_FC2A @ 9625 =====

undefined2 __h3000 API_FC2A(void)

{
  undefined2 uVar1;
  
  uVar1 = API_FC32();
  DAT_8062 = CONCAT11((char)uVar1,(char)uVar1);
  return uVar1;
}


// ===== API_FC2C @ 9632 =====

ushort __h3000 API_FC2C(void)

{
  ushort uVar1;
  
  API_FC32();
  uVar1 = DAT_8062;
  return uVar1 & 0xff;
}


// ===== API_FC2E @ 963d =====

undefined2 __h3000 API_FC2E(void)

{
  undefined2 uVar1;
  
  uVar1 = API_FC32();
  DAT_8060 = CONCAT11((char)uVar1,(char)uVar1);
  return uVar1;
}


// ===== FUN_9640 @ 9640 =====

undefined1 __h3000 FUN_9640(undefined1 param_1,undefined1 param_2)

{
  DAT_8060 = CONCAT11(param_2,param_2);
  return param_2;
}


// ===== API_FC30 @ 964a =====

ushort __h3000 API_FC30(void)

{
  ushort uVar1;
  
  uVar1 = DAT_8060;
  return uVar1 & 0xff;
}


// ===== API_FC32 @ 9652 =====

undefined2 __h3000 API_FC32(void)

{
  ushort uVar1;
  undefined2 in_D;
  undefined *puVar2;
  
  puVar2 = &UNK_03e8;
  do {
    puVar2 = puVar2 + -1;
    if (puVar2 == (undefined *)0x0) {
      return in_D;
    }
    uVar1 = DAT_8060;
  } while ((uVar1 & 0x80) != 0);
  return in_D;
}


// ===== API_FC34 @ 9665 =====

undefined2 __h3000 API_FC34(void)

{
  undefined2 in_D;
  
  API_FD20(5);
  FUN_9640();
  API_FD20(1);
  FUN_9640();
  API_FD20(0);
  FUN_9640();
  API_FC2E();
  API_FC2E();
  API_FC2E();
  API_FC2E();
  return in_D;
}


// ===== API_FDB2 @ 969f =====

undefined1 __h3000 API_FDB2(undefined1 param_1,undefined1 param_2)

{
  API_FC2E(param_1,DAT_60c1 & 3 | 0xc);
  return param_2;
}


// ===== API_FDB0 @ 96ae =====

undefined1 __h3000 API_FDB0(undefined1 param_1,undefined1 param_2)

{
  API_FC2E(param_1,0xc);
  return param_2;
}


// ===== API_FDB8 @ 96b8 =====

void __h3000 API_FDB8(undefined1 param_1,undefined1 param_2)

{
  DAT_60c0 = param_2;
  LcdSetCursor();
  return;
}


// ===== API_FDB4 @ 96be =====

undefined1 __h3000 API_FDB4(undefined1 param_1,undefined1 param_2)

{
  DAT_60c0 = API_FC30();
  if (!(bool)((DAT_60c0 < 0x29) + (DAT_60c0 == 0x29))) {
    DAT_60c0 = DAT_60c0 - 0x18;
  }
  return param_2;
}


// ===== API_FDB6 @ 96d1 =====

undefined1 __h3000 API_FDB6(undefined1 param_1,undefined1 param_2)

{
  LcdSetCursor(param_1,DAT_60c0);
  return param_2;
}


// ===== LcdSetCursor @ 96db =====

/* Kernel API slot $FC36: B = position 0-79 (2 x 40 LCD) */

byte __h3000 LcdSetCursor(undefined1 param_1,byte param_2)

{
  byte bVar1;
  
  bVar1 = param_2 & 0x7f;
  if (bVar1 < 0x28 == (bVar1 == 0x28)) {
    bVar1 = bVar1 + 0x18;
  }
  API_FC2E(param_1,bVar1 | 0x80);
  return param_2;
}


// ===== LcdPrintInline @ 96ed =====

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


// ===== FUN_96f1 @ 96f1 =====

void __h3000 FUN_96f1(undefined1 param_1,undefined1 param_2,byte *param_3)

{
  byte *pbVar1;
  
  while( true ) {
    pbVar1 = param_3 + 1;
    if ((*param_3 & 0xf8) == 0) break;
    API_FC2A();
    param_3 = pbVar1;
  }
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9758 1->9712 2->9719 3->9724 4->9731
                       5->973E 6->9720 7->96F1 */
  JumpTableDispatch(0,*param_3 & 7);
}


// ===== FUN_9712 @ 9712 =====

void __h3000 FUN_9712(undefined1 param_1)

{
  API_FC2E(param_1,1);
  FUN_96f1();
  return;
}


// ===== FUN_9719 @ 9719 =====

void __h3000 FUN_9719(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  LcdSetCursor(param_1,*param_3,param_3 + 1);
  FUN_96f1();
  return;
}


// ===== FUN_9720 @ 9720 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_9720(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
        undefined2 *param_5)

{
  undefined2 uVar1;
  
  uVar1 = *param_5;
  uVar1 = API_FC3E((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1,param_4,param_5 + 1);
  FUN_96f1((char)((ushort)uVar1 >> 8),(char)uVar1,param_3);
  return;
}


// ===== FUN_9724 @ 9724 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9724(undefined1 param_1,undefined1 param_2,undefined2 *param_3)

{
  undefined2 uVar1;
  
  uVar1 = *param_3;
  uVar1 = API_FC3E((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  FUN_96f1((char)((ushort)uVar1 >> 8),(char)uVar1,param_3 + 1);
  return;
}


// ===== FUN_9731 @ 9731 =====

void __h3000 FUN_9731(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  API_FC40(*param_3,param_3[1],param_3 + 2,0x60a4);
  FUN_96f1();
  return;
}


// ===== FUN_973e @ 973e =====

void __h3000 FUN_973e(undefined1 param_1,undefined1 param_2,char *param_3)

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
  FUN_96f1();
  return;
}


// ===== FUN_9758 @ 9758 =====

undefined2 __h3000 FUN_9758(void)

{
  undefined2 in_stack_00000001;
  
  return in_stack_00000001;
}


// ===== API_FC3A @ 975d =====

undefined2 __h3000 API_FC3A(undefined1 param_1,char param_2,undefined1 *param_3)

{
  char extraout_A;
  undefined1 *puVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  do {
    puVar1 = param_3 + 1;
    API_FC2A(param_2,*param_3);
    param_2 = extraout_A + -1;
    param_3 = puVar1;
  } while (param_2 != '\0');
  return uStack_2;
}


// ===== API_FC3C @ 976c =====

undefined2 __h3000 API_FC3C(undefined1 param_1,char param_2,undefined2 param_3,undefined1 *param_4)

{
  char extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  do {
    API_FC2C(param_2);
    *param_4 = extraout_B;
    param_2 = extraout_A + -1;
    param_4 = param_4 + 1;
  } while (param_2 != '\0');
  return uStack_2;
}


// ===== API_FC3E @ 977b =====

undefined1 __h3000 API_FC3E(undefined1 param_1,undefined1 param_2,char *param_3)

{
  char *pcVar1;
  
  while (pcVar1 = param_3 + 1, *param_3 != '\0') {
    API_FC2A();
    param_3 = pcVar1;
  }
  return param_2;
}


// ===== API_FC40 @ 9789 =====

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
                    /* inline[API_FD14]: jump table[D]: 0->97B3 1->97AE 2->9815 3->9857 */
  JumpTableDispatch(0,param_1 >> 4);
}


// ===== FUN_97ae @ 97ae =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_97ae(void)

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
  FUN_9806('\x05' - local_res0,cVar1,pcVar2 + (char)('\x05' - local_res0));
  FUN_9839(0x27);
  FUN_9806();
  FUN_9839(3);
  FUN_9806();
  FUN_9839(0);
  FUN_9806();
  FUN_9839(0);
  FUN_9806();
  uStack0001 = 0;
  FUN_9839(0);
  if (cStack0002 != '\0') {
    do {
      pcVar2 = pcVar2 + -1;
    } while (*pcVar2 != ' ');
    *pcVar2 = '-';
  }
  FUN_9875();
  return;
}


// ===== FUN_97b3 @ 97b3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_97b3(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,char *param_5)

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
  FUN_9806('\x05' - local_res0,param_2,pcVar1 + (char)('\x05' - local_res0));
  FUN_9839(0x27);
  FUN_9806();
  FUN_9839(3);
  FUN_9806();
  FUN_9839(0);
  FUN_9806();
  FUN_9839(0);
  FUN_9806();
  local_res1 = 0;
  FUN_9839(0);
  if (cStack0002 != '\0') {
    do {
      pcVar1 = pcVar1 + -1;
    } while (*pcVar1 != ' ');
    *pcVar1 = '-';
  }
  FUN_9875();
  return;
}


// ===== FUN_9806 @ 9806 =====

void __h3000 FUN_9806(undefined1 param_1,undefined1 param_2,undefined1 *param_3,undefined1 *param_4)

{
  if (param_3 == param_4) {
    *param_4 = 0x2e;
  }
  return;
}


// ===== FUN_9815 @ 9815 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9815(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 local_res1;
  
  local_res1 = 0xff;
  FUN_9839(0x27,0x10,param_3,param_4 + 4);
  FUN_9839(3);
  FUN_9839(0);
  FUN_9839(0);
  local_res1 = 0;
  FUN_9839(0);
  FUN_9875();
  return;
}


// ===== FUN_9839 @ 9839 =====

void __h3000 FUN_9839(void)

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
    uVar1 = FUN_987e();
  }
  else {
    uVar1 = 0x20;
  }
  *in_Y = uVar1;
  return;
}


// ===== FUN_9857 @ 9857 =====

void __h3000 FUN_9857(void)

{
  short in_Y;
  undefined1 *puVar1;
  undefined1 local_res1;
  
  local_res1 = 0;
  puVar1 = (undefined1 *)(in_Y + 4);
  FUN_9839(0x10);
  FUN_9839(1);
  FUN_9839(0);
  FUN_9839(0);
  *puVar1 = 0x48;
  FUN_9875();
  return;
}


// ===== FUN_9875 @ 9875 =====

undefined2 __h3000 FUN_9875(void)

{
  undefined2 in_stack_00000003;
  
  return in_stack_00000003;
}


// ===== FUN_987e @ 987e =====

char __h3000 FUN_987e(undefined1 param_1,byte param_2)

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


// ===== API_FC42 @ 988b =====

void __h3000 API_FC42(void)

{
  undefined1 extraout_A;
  
  API_FC40();
  API_FC3A(extraout_A,8,&DAT_609a);
  return;
}


// ===== API_FDF8 @ 989f =====

undefined2 __h3000 API_FDF8(undefined1 param_1,char param_2)

{
  byte extraout_A;
  undefined1 uVar1;
  byte in_CC;
  byte bVar2;
  undefined1 local_3;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  bVar2 = in_CC & 0xf1;
  local_3 = '\b';
  do {
    uVar1 = 0x31;
    if (!(bool)(bVar2 & 1 ^ param_2 == '\0')) {
      uVar1 = 0x30;
    }
    API_FC2A(param_2,uVar1);
    bVar2 = extraout_A >> 7;
    param_2 = extraout_A << 1;
    local_3 = local_3 + -1;
  } while (local_3 != '\0');
  return uStack_2;
}


// ===== API_FC44 @ 98bd =====

undefined2 __h3000 API_FC44(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_98df();
  FUN_98df();
  FUN_98df();
  return uStack_2;
}


// ===== FUN_98df @ 98df =====

undefined2 __h3000 FUN_98df(undefined1 param_1,byte param_2)

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


// ===== API_FC46 @ 9901 =====

undefined2 __h3000 API_FC46(undefined1 param_1,undefined1 param_2)

{
  char extraout_A;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  
  FUN_987e(param_2);
  FUN_987e(extraout_A,extraout_A >> 4);
  return CONCAT11(extraout_B_00,extraout_B);
}


// ===== LcdPrintAt8Inline @ 9916 =====

/* Kernel API slot $FC48: inline: position byte + 8 chars */

undefined2 __h3000 LcdPrintAt8Inline(void)

{
  char extraout_A;
  undefined2 in_D;
  char *local_res0;
  
  API_FC2E((char)((CONCAT11(8,*local_res0 - 8U) >> 8) * (ushort)(byte)(*local_res0 - 8U) >> 8));
  do {
    API_FC2A();
  } while (extraout_A != '\x01');
  return in_D;
}


// ===== API_FDBA @ 9935 =====

undefined1 __h3000 API_FDBA(undefined1 param_1,undefined1 param_2)

{
  API_FC2A(param_1,0x20);
  return param_2;
}


// ===== API_FC4A @ 993f =====

byte __h3000 API_FC4A(undefined1 param_1,byte param_2,undefined2 param_3)

{
  DAT_8054 = param_2 & 0x3f;
  API_FC80(param_1,param_2 & 0x3f,param_3,&DAT_0103);
  return param_2;
}


// ===== API_FC4C @ 9950 =====

undefined2 __h3000 API_FC4C(undefined1 param_1,char param_2,char *param_3)

{
  char *pcVar1;
  char *pcVar2;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  pcVar2 = param_3 + param_2;
  for (pcVar1 = pcVar2; (pcVar1 != param_3 && (*pcVar1 == ' ')); pcVar1 = pcVar1 + -1) {
  }
  for (; *pcVar2 = *pcVar1, pcVar1 != param_3; pcVar1 = pcVar1 + -1) {
    pcVar2 = pcVar2 + -1;
  }
  while (pcVar2 != param_3) {
    pcVar2 = pcVar2 + -1;
    *pcVar2 = ' ';
  }
  return uStack_4;
}


// ===== API_FC4E @ 998e =====

undefined2 __h3000 API_FC4E(undefined1 param_1,char param_2,char *param_3)

{
  char *pcVar1;
  char *pcVar2;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  pcVar1 = param_3 + (char)(param_2 + -1);
  for (pcVar2 = param_3; (pcVar2 != pcVar1 && (*pcVar2 == ' ')); pcVar2 = pcVar2 + 1) {
  }
  for (; *param_3 = *pcVar2, pcVar2 != pcVar1; pcVar2 = pcVar2 + 1) {
    param_3 = param_3 + 1;
  }
  while (param_3 != pcVar1) {
    param_3 = param_3 + 1;
    *param_3 = ' ';
  }
  return uStack_4;
}


// ===== API_FC50 @ 99cf =====

undefined2 __h3000 API_FC50(undefined1 param_1,char param_2,char *param_3)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  pcVar1 = param_3 + param_2;
  pcVar3 = param_3;
  while (param_3 != pcVar1) {
    if (*param_3 == ' ') {
      param_3 = param_3 + 1;
    }
    else {
      do {
        if (param_3 == pcVar1) goto LAB_99fd;
        cVar2 = *param_3;
        *pcVar3 = cVar2;
        param_3 = param_3 + 1;
        pcVar3 = pcVar3 + 1;
      } while (cVar2 != ' ');
    }
  }
LAB_99fd:
  for (; pcVar3 != pcVar1; pcVar3 = pcVar3 + 1) {
    *pcVar3 = ' ';
  }
  *pcVar3 = ' ';
  return uStack_4;
}


// ===== API_FC52 @ 9a15 =====

undefined2 __h3000 API_FC52(undefined1 param_1,char param_2,char *param_3)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  pcVar2 = param_3 + param_2;
  pcVar3 = pcVar2;
  while (pcVar2 != param_3) {
    if (*pcVar2 == ' ') {
      pcVar2 = pcVar2 + -1;
    }
    else {
      do {
        cVar1 = *pcVar2;
        *pcVar3 = cVar1;
        if (pcVar2 == param_3) goto LAB_9a43;
        pcVar2 = pcVar2 + -1;
        pcVar3 = pcVar3 + -1;
      } while (cVar1 != ' ');
    }
  }
LAB_9a43:
  for (; pcVar3 != param_3; pcVar3 = pcVar3 + -1) {
    *pcVar3 = ' ';
  }
  *pcVar3 = ' ';
  return uStack_4;
}


// ===== API_FDBC @ 9a5b =====

undefined2 __h3000 API_FDBC(undefined1 param_1,undefined1 param_2)

{
  char cVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  undefined1 *local_res0;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  puVar2 = DAT_60ae + 1;
  *DAT_60ae = 0x20;
  cVar1 = '\b';
  do {
    puVar3 = puVar2 + 1;
    *puVar2 = *local_res0;
    cVar1 = cVar1 + -1;
    local_res0 = local_res0 + 1;
    puVar2 = puVar3;
  } while (cVar1 != '\0');
  *puVar3 = 0;
  return uStack_6;
}


// ===== API_FDFC @ 9a78 =====

void __h3000 API_FDFC(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6079 = 0xa0;
  DAT_607a = 0;
  LcdSetCursor();
  FUN_ae65();
                    /* WARNING: Could not recover jumptable at 0x9a8d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== Io80A7_Clear @ 9aa9 =====

/* Kernel API slot $FC54: $80A7 = 0 */

void __h3000 Io80A7_Clear(void)

{
  DAT_80a7 = 0;
  return;
}


// ===== Io80A7_Set @ 9ab3 =====

/* Kernel API slot $FC56: $80A7 = $FF */

void __h3000 Io80A7_Set(void)

{
  DAT_80a7 = 0xff;
  return;
}


// ===== API_FC58 @ 9abd =====

void __h3000 API_FC58(undefined1 param_1,byte param_2)

{
                    /* WARNING: Subroutine does not return */
                    /* inline[API_FD14]: jump table[D]: 0->9ACD 1->9AD9 2->9AE0 3->9AE7 */
  JumpTableDispatch(0,param_2 & 3);
}


// ===== FUN_9acd @ 9acd =====

undefined2 __h3000 FUN_9acd(void)

{
  undefined2 in_stack_00000001;
  
  DAT_80a4 = 0;
  DAT_80a5 = 0;
  return in_stack_00000001;
}


// ===== FUN_9ad9 @ 9ad9 =====

undefined2 __h3000 FUN_9ad9(void)

{
  undefined2 in_stack_00000001;
  
  DAT_80a4 = 0;
  DAT_80a5 = 0xff;
  return in_stack_00000001;
}


// ===== FUN_9ae0 @ 9ae0 =====

undefined2 __h3000 FUN_9ae0(void)

{
  undefined2 in_stack_00000001;
  
  DAT_80a4 = 0xff;
  DAT_80a5 = 0;
  return in_stack_00000001;
}


// ===== FUN_9ae7 @ 9ae7 =====

undefined2 __h3000 FUN_9ae7(void)

{
  undefined2 in_stack_00000001;
  
  DAT_80a4 = 0xff;
  DAT_80a5 = 0xff;
  return in_stack_00000001;
}


// ===== API_FC5A @ 9af4 =====

undefined1 __h3000 API_FC5A(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_80a1 = 0xff;
  API_FC80(param_1,0xff,param_3,&UNK_0102);
  return param_2;
}


// ===== API_FC5C @ 9b05 =====

undefined1 __h3000 API_FC5C(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_80a1 = 0;
  API_FC80(param_1,0,param_3,&UNK_0102);
  return param_2;
}


// ===== API_FC5E @ 9b16 =====

undefined1 __h3000 API_FC5E(undefined1 param_1,undefined1 param_2)

{
  undefined1 uVar1;
  
  uVar1 = API_FC7C(param_1,param_2,&UNK_0102);
  DAT_80a1 = uVar1;
  return param_2;
}


// ===== API_FDBE @ 9b24 =====

undefined2 __h3000 API_FDBE(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  byte extraout_B;
  undefined1 extraout_B_00;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC7C(param_1,param_2,&UNK_0102);
  API_FC80(extraout_A,~extraout_B);
  FUN_eb25(0);
  DAT_80a1 = extraout_B_00;
  return uStack_4;
}


// ===== FUN_9b40 @ 9b40 =====

undefined2 __h3000 FUN_9b40(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC80();
  DAT_80a1 = extraout_B;
  return uStack_4;
}


// ===== ModuleSetBase @ 9b4f =====

/* Kernel API slot $FC60: inline word: $600D = return address - word (position-independent modules)
    */

undefined2 __h3000 ModuleSetBase(void)

{
  undefined2 in_D;
  short *local_res0;
  
  DAT_600d = (short)local_res0 - *local_res0;
  return in_D;
}


// ===== ModuleStorePtr @ 9b5f =====

/* Kernel API slot $FC62: inline ptr: [ptr] = D + module base */

short __h3000 ModuleStorePtr(void)

{
  short in_D;
  undefined2 *local_res0;
  
  *(short *)*local_res0 = in_D + DAT_600d;
  return in_D;
}


// ===== API_FDC0 @ 9b70 =====

undefined2 __h3000 API_FDC0(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
                    /* inline[API_FD8E]: $613B */
  DAT_60bb = (undefined2 *)API_FD8E();
  DAT_60ba = 0;
  (*(code *)*DAT_60bb)();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
  return in_D;
}


// ===== API_FDC2 @ 9b8f =====

void __h3000 API_FDC2(void)

{
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  API_FDD4();
  puVar2 = (undefined2 *)(DAT_60bb + 2 + (short)DAT_60ba);
  puVar1 = puVar2 + 1;
  (*(code *)*puVar2)();
  DAT_60b9 = '\0';
  do {
    puVar2 = puVar1 + 1;
    (*(code *)*puVar1)();
    DAT_60b9 = DAT_60b9 + '\x01';
    puVar1 = puVar2;
  } while (DAT_60b9 != '\x04');
  return;
}


// ===== FUN_9bd8 @ 9bd8 =====

/* WARNING: Removing unreachable block (RAM,0x9bb5) */

void __h3000 FUN_9bd8(void)

{
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  API_FDD4();
  DAT_60b9 = '\0';
  puVar1 = (undefined2 *)(DAT_60bb + DAT_60ba + 4);
  do {
    puVar2 = puVar1 + 1;
    (*(code *)*puVar1)();
    DAT_60b9 = DAT_60b9 + '\x01';
    puVar1 = puVar2;
  } while (DAT_60b9 != '\x04');
  return;
}


// ===== API_FDC4 @ 9be2 =====

undefined2 __h3000 API_FDC4(undefined1 param_1,undefined1 param_2)

{
  char cVar1;
  byte extraout_CC;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  do {
    cVar1 = '\0';
    if (DAT_60ba == '\0') {
      do {
        cVar1 = cVar1 + '\n';
        DAT_60ba = cVar1;
      } while (*(short *)(DAT_60bb + 2 + (short)cVar1) != -1);
    }
    DAT_60ba = DAT_60ba + -10;
    API_FDC2();
  } while ((extraout_CC >> 2 & 1) == 0);
  return uStack_6;
}


// ===== API_FDC6 @ 9c05 =====

undefined2 __h3000 API_FDC6(undefined1 param_1,undefined1 param_2)

{
  byte extraout_CC;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  do {
    DAT_60ba = DAT_60ba + '\n';
    if (*(short *)(DAT_60bb + 2 + (short)DAT_60ba) == -1) {
      DAT_60ba = '\0';
    }
    API_FDC2();
  } while ((extraout_CC >> 2 & 1) == 0);
  return uStack_6;
}


// ===== API_FDC8 @ 9c26 =====

undefined2 * __h3000 API_FDC8(void)

{
  undefined2 *in_D;
  byte extraout_CC;
  
                    /* inline[API_FD90]: $613B */
  API_FD90((char)((ushort)DAT_60bb >> 8));
                    /* inline[API_FD90]: $613B */
  API_FD90();
  DAT_60ba = 0;
  DAT_60bb = in_D;
  (*(code *)*in_D)();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
  return in_D;
}


// ===== API_FDCA @ 9c52 =====

undefined2 __h3000 API_FDCA(void)

{
  undefined2 in_D;
  undefined1 uVar2;
  undefined2 *puVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FD92]: $613B */
  uVar2 = API_FD92();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_60ba = uVar2;
                    /* inline[API_FD92]: $613B */
    puVar1 = (undefined2 *)API_FD92();
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DAT_60bb = puVar1;
    }
  }
  (*(code *)*DAT_60bb)();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC_01 >> 2 & 1)) break;
    API_FDC6();
  }
  return in_D;
}


// ===== FUN_9c7a @ 9c7a =====

undefined2 __h3000 FUN_9c7a(undefined1 param_1,undefined1 param_2)

{
  byte extraout_CC;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  (*(code *)*DAT_60bb)();
  while( true ) {
    API_FDC2();
    if ((bool)(extraout_CC >> 2 & 1)) break;
    API_FDC6();
  }
  return uStack_4;
}


// ===== API_FDCC @ 9c7e =====

undefined2 __h3000 API_FDCC(undefined1 param_1,undefined1 param_2)

{
  code *pcVar1;
  undefined2 *local_res0;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  API_FDD4();
  DAT_60b9 = '\0';
  do {
    pcVar1 = (code *)*local_res0;
    local_res0 = local_res0 + 1;
    (*pcVar1)();
    DAT_60b9 = DAT_60b9 + '\x01';
  } while (DAT_60b9 != '\x04');
  return uStack_6;
}


// ===== API_FC64 @ 9cba =====

undefined2 __h3000 API_FC64(void)

{
  undefined2 in_D;
  char *pcVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  byte extraout_CC_01;
  short sVar3;
  
                    /* inline[API_FD0C]: $0080 FF */
  MemsetInline();
  DAT_614d = 0xff;
  RomFirstRecord();
  bVar2 = extraout_CC;
  while ((bVar2 >> 2 & 1) != 0) {
    pcVar1 = (char *)FUN_9d10();
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      FUN_c171();
      *pcVar1 = *pcVar1 + -1;
      DAT_614d = 0;
    }
    RomNextRecord();
    bVar2 = extraout_CC_01;
  }
  pcVar1 = &UNK_03e8;
  sVar3 = 0;
  do {
    pcVar1 = pcVar1 + -1;
    FUN_c1a7();
    *pcVar1 = *pcVar1 + -1;
    if (*pcVar1 == '\0') {
      sVar3 = sVar3 + 1;
    }
  } while (pcVar1 != (char *)0x0);
  DAT_614b = sVar3;
  return in_D;
}


// ===== FUN_9d03 @ 9d03 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x9d0e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_9d03(undefined2 param_1,undefined2 param_2)

{
  ushort in_D;
  char *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  pcVar1 = (char *)(in_D & 0x3ff);
  FUN_c1a7();
  *pcVar1 = *pcVar1 + -1;
                    /* WARNING: Could not recover jumptable at 0x9d0e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8),(char)(char *)(in_D & 0x3ff),param_1,param_2);
  return;
}


// ===== FUN_9d10 @ 9d10 =====

ushort __h3000 FUN_9d10(void)

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


// ===== FUN_9d38 @ 9d38 =====

undefined2 __h3000 FUN_9d38(void)

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
  else if (&UNK_fe70 + in_D < (undefined *)0xc8) {
    uVar1 = CONCAT11(0xc9,(char)(&UNK_fe70 + in_D));
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


// ===== API_FC66 @ 9d6f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000
API_FC66(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined2 uVar1;
  undefined1 uVar2;
  byte extraout_CC;
  undefined2 uVar3;
  
  uVar3 = param_4;
  BankPushSelect();
  uVar1 = API_FC06((char)((ushort)param_3 >> 8));
  uVar2 = (undefined1)uVar1;
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_60da = 0;
    BANK_LATCH = uVar2;
    g_curBank = uVar2;
    API_FC7E((char)((ushort)uVar1 >> 8),uVar2,8);
    DAT_600c = 0xa0;
    DAT_600a = extraout_A;
    API_FDDE((char)((ushort)DAT_607d >> 8),(char)DAT_607d,uVar3,0);
    BankPop();
    return param_4;
  }
  BankPop();
  return param_4;
}


// ===== API_FDCE @ 9db5 =====

undefined2 __h3000 API_FDCE(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  DAT_60fb = 0xff;
  DAT_60f4 = 0xff;
  FUN_a120();
  API_FC88();
  DAT_60b8 = 0;
  API_FDD0();
  FUN_c91b();
  API_FC7E(extraout_A,extraout_B,8);
  API_FC06();
  g_curBank = extraout_B_01;
  DAT_6102 = extraout_B_01;
  API_FC08(extraout_A_00,extraout_B_00);
  API_FC92();
  FUN_a15d();
  DAT_60f4 = 0;
  return uStack_4;
}


// ===== API_FDD0 @ 9df4 =====

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
                    /* inline[API_FD18]: [$600F]=$8877 [$6011]=$8877 [$6013]=$8877 [$6015]=$8877
                       [$6006]=$8877 [$6004]=$8877 [$6002]=$8877 [$608F]=$8877 [$6091]=$8877
                       [$6093]=$8877 [$6095]=$8877 [$6097]=$8877 [$603A]=$8877 [$6038]=$8877
                       [$6036]=$8877 [$608D]=$8877 [$60ED]=$8877 [$60EF]=$8D23 */
  StoreWordsInline(0x3b,0x55,0x6604);
  API_FC58();
  FUN_a0c7();
  FUN_ece8();
  return;
}


// ===== FUN_9e72 @ 9e72 =====

undefined2 __h3000 FUN_9e72(void)

{
  byte bVar1;
  byte extraout_A;
  byte extraout_CC;
  byte extraout_CC_00;
  undefined2 in_Y;
  
  BankPushSelect();
  bVar1 = 0;
  if (DAT_6106 != '\0') {
    DAT_6106 = '\0';
    DAT_6089 = DAT_60f1;
    if ((DAT_0114 != '\0') ||
       ((DAT_010e == '\0' &&
        ((DAT_010d == '\0' ||
         ((*(short *)(CONCAT11(DAT_60f1 >> 7,DAT_60f1 << 1) + 0x180) != -1 &&
          (FUN_9d03(), bVar1 = extraout_A, (extraout_CC >> 2 & 1) != 0)))))))) {
      BankPop(bVar1 & 0xf);
      FUN_9d38();
      API_FC66();
      if ((extraout_CC_00 >> 2 & 1) == 0) {
        return in_Y;
      }
      API_FDCE();
      return in_Y;
    }
  }
  BankPop();
                    /* WARNING: Read-only address (RAM,0x0114) is written */
  return in_Y;
}


// ===== API_FC68 @ 9ec5 =====

undefined2 __h3000 API_FC68(undefined1 param_1,undefined1 param_2)

{
  char cVar1;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  UNK_8022 = param_2;
  cVar1 = '\x05';
  do {
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  DAT_80a6 = 1;
  cVar1 = '\x05';
  do {
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  DAT_80a6 = 0;
  DAT_8020 = param_2;
  return uStack_6;
}


// ===== API_FC6A @ 9ecd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

byte __h3000 API_FC6A(undefined1 param_1,byte param_2)

{
  undefined1 uVar1;
  
  DAT_6153 = param_2;
  if (DAT_60f4 == '\0') {
    uVar1 = (undefined1)((ushort)param_2 * (ushort)DAT_614f >> 8);
    DAT_614e = param_2;
    API_FC7A(uVar1,uVar1,&UNK_8026);
    uVar1 = (undefined1)((ushort)(byte)~DAT_614e * (ushort)DAT_614f >> 8);
    API_FC7A(uVar1,uVar1,&UNK_8036);
  }
  return param_2;
}


// ===== API_FC6C @ 9efc =====

undefined2 __h3000 API_FC6C(void)

{
  undefined1 uVar1;
  char cVar2;
  undefined2 in_D;
  ushort uVar3;
  
  uVar3 = API_FC7C();
  uVar1 = (undefined1)((uVar3 >> 8) * (uVar3 & 0xff) >> 8);
  UNK_8025 = uVar1;
  cVar2 = '\x05';
  do {
    cVar2 = cVar2 + -1;
  } while (cVar2 != '\0');
  DAT_80a6 = 1;
  cVar2 = '\x05';
  do {
    cVar2 = cVar2 + -1;
  } while (cVar2 != '\0');
  DAT_80a6 = 0;
  DAT_8020 = uVar1;
  return in_D;
}


// ===== API_FC6E @ 9f0f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

byte __h3000 API_FC6E(undefined1 param_1,byte param_2)

{
  undefined1 uVar1;
  
  uVar1 = (undefined1)((ushort)DAT_614e * (ushort)param_2 >> 8);
  DAT_614f = param_2;
  API_FC7A(uVar1,uVar1,&UNK_8026);
  uVar1 = (undefined1)((ushort)(byte)~DAT_614e * (ushort)DAT_614f >> 8);
  API_FC7A(uVar1,uVar1,&UNK_8036);
  return param_2;
}


// ===== API_FC70 @ 9f16 =====

undefined2 __h3000 API_FC70(undefined1 param_1,undefined1 param_2)

{
  char cVar1;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  UNK_8024 = param_2;
  cVar1 = '\x05';
  do {
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  DAT_80a6 = 1;
  cVar1 = '\x05';
  do {
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  DAT_80a6 = 0;
  DAT_8020 = param_2;
  return uStack_6;
}


// ===== API_FC72 @ 9f1e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

byte __h3000 API_FC72(undefined1 param_1,byte param_2)

{
  undefined1 uVar1;
  
  DAT_6152 = param_2;
  if (DAT_60f4 == '\0') {
    uVar1 = (undefined1)((ushort)param_2 * (ushort)DAT_6151 >> 8);
    DAT_6150 = param_2;
    API_FC7A(uVar1,uVar1,&UNK_8033);
    uVar1 = (undefined1)((ushort)(byte)~DAT_6150 * (ushort)DAT_6151 >> 8);
    API_FC7A(uVar1,uVar1,&UNK_8023);
  }
  return param_2;
}


// ===== API_FC74 @ 9f4b =====

undefined2 __h3000 API_FC74(void)

{
  undefined1 uVar1;
  char cVar2;
  undefined2 in_D;
  ushort uVar3;
  
  uVar3 = API_FC7C();
  uVar1 = (undefined1)((uVar3 >> 8) * (uVar3 & 0xff) >> 8);
  UNK_8027 = uVar1;
  cVar2 = '\x05';
  do {
    cVar2 = cVar2 + -1;
  } while (cVar2 != '\0');
  DAT_80a6 = 1;
  cVar2 = '\x05';
  do {
    cVar2 = cVar2 + -1;
  } while (cVar2 != '\0');
  DAT_80a6 = 0;
  DAT_8020 = uVar1;
  return in_D;
}


// ===== API_FC76 @ 9f5d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

byte __h3000 API_FC76(undefined1 param_1,byte param_2)

{
  undefined1 uVar1;
  
  uVar1 = (undefined1)((ushort)DAT_6150 * (ushort)param_2 >> 8);
  DAT_6151 = param_2;
  API_FC7A(uVar1,uVar1,&UNK_8033);
  uVar1 = (undefined1)((ushort)(byte)~DAT_6150 * (ushort)DAT_6151 >> 8);
  API_FC7A(uVar1,uVar1,&UNK_8023);
  return param_2;
}


// ===== API_FC78 @ 9f64 =====

undefined2 __h3000 API_FC78(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_8020 = 0;
  DAT_80a6 = 0;
  API_FC6C(0,0);
  API_FC74();
  API_FC6A(0xff);
  API_FC72();
  API_FC7C(extraout_A,extraout_B,&DAT_0104);
  API_FDD2();
  API_FC68();
  API_FC7C(extraout_A_00,extraout_B_00,&DAT_0105);
  API_FDD2();
  API_FC70();
  API_FC7C(extraout_A_01,extraout_B_01,&DAT_0106);
  API_FDD2();
  API_FC6E();
  API_FC7C(extraout_A_02,extraout_B_02,&DAT_0107);
  API_FDD2();
  API_FC76();
  DAT_60f4 = 0;
  return uStack_2;
}


// ===== API_FC7A @ 9fb4 =====

undefined2 __h3000 API_FC7A(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  char cVar1;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  *param_3 = param_2;
  cVar1 = '\x05';
  do {
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  DAT_80a6 = 1;
  cVar1 = '\x05';
  do {
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  DAT_80a6 = 0;
  DAT_8020 = param_2;
  return uStack_6;
}


// ===== API_FDD2 @ 9fd2 =====

undefined2 __h3000 API_FDD2(undefined1 param_1,byte param_2)

{
  if ((char)param_2 < '\0') {
    param_2 = -param_2;
  }
  if (param_2 < 0x30 == (param_2 == 0x30)) {
    param_2 = 0x30;
  }
  return CONCAT11(param_1,(&DAT_9fe8)[(char)param_2]);
}


// ===== API_FD94 @ a039 =====

undefined2 __h3000 API_FD94(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC80();
  puVar3 = &UNK_a019;
  if (DAT_6154 == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== API_FD96 @ a05a =====

undefined2 __h3000 API_FD96(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC80();
  puVar3 = &UNK_a021;
  if (cRAM6155 == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== API_FD98 @ a062 =====

undefined2 __h3000 API_FD98(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC80();
  puVar3 = &UNK_a029;
  if (cRAM6156 == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== API_FD9A @ a06a =====

undefined2 __h3000 API_FD9A(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC80();
  puVar3 = &UNK_a031;
  if (cRAM6157 == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== FUN_a072 @ a072 =====

undefined2 __h3000 FUN_a072(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  puVar3 = &UNK_a019;
  DAT_6154 = 0;
  API_FC7C(param_1,param_2,&DAT_0104);
  API_FC80(extraout_A_01,extraout_B_00,param_3,*(undefined2 *)(puVar3 + 2));
  if (**(char **)(puVar3 + 4) == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== FUN_a078 @ a078 =====

undefined2 __h3000 FUN_a078(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  undefined2 in_stack_00000000;
  
  **(undefined1 **)(param_4 + 4) = 0;
  API_FC7C(param_1,param_2,*(undefined2 *)(param_4 + 2));
  API_FC80(extraout_A_01,extraout_B_00,param_3,*(undefined2 *)(param_4 + 2));
  if (**(char **)(param_4 + 4) == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(param_4 + 6))(uVar1,uVar2);
  return in_stack_00000000;
}


// ===== FUN_a086 @ a086 =====

void __h3000 FUN_a086(void)

{
  FUN_a078();
  return;
}


// ===== FUN_a08a @ a08a =====

void __h3000 FUN_a08a(void)

{
  FUN_a078();
  return;
}


// ===== FUN_a092 @ a092 =====

void __h3000 FUN_a092(void)

{
  FUN_a078();
  return;
}


// ===== FUN_a09a @ a09a =====

void __h3000 FUN_a09a(void)

{
  FUN_a078();
  return;
}


// ===== FUN_a0a2 @ a0a2 =====

undefined2 __h3000 FUN_a0a2(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  puVar3 = &UNK_a019;
  DAT_6154 = 0xff;
  API_FC7C(param_1,0xff,&DAT_0104);
  API_FC80(extraout_A_01,extraout_B_00,param_3,*(undefined2 *)(puVar3 + 2));
  if (**(char **)(puVar3 + 4) == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== FUN_a0af @ a0af =====

undefined2 __h3000 FUN_a0af(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  puVar3 = &UNK_a021;
  uRAM6155 = 0xff;
  API_FC7C(param_1,0xff,&DAT_0105);
  API_FC80(extraout_A_01,extraout_B_00,param_3,*(undefined2 *)(puVar3 + 2));
  if (**(char **)(puVar3 + 4) == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== FUN_a0b7 @ a0b7 =====

undefined2 __h3000 FUN_a0b7(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  puVar3 = &UNK_a029;
  uRAM6156 = 0xff;
  API_FC7C(param_1,0xff,&DAT_0106);
  API_FC80(extraout_A_01,extraout_B_00,param_3,*(undefined2 *)(puVar3 + 2));
  if (**(char **)(puVar3 + 4) == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== FUN_a0bf @ a0bf =====

undefined2 __h3000 FUN_a0bf(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 uVar2;
  undefined1 extraout_B_00;
  undefined *puVar3;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  puVar3 = &UNK_a031;
  uRAM6157 = 0xff;
  API_FC7C(param_1,0xff,&DAT_0107);
  API_FC80(extraout_A_01,extraout_B_00,param_3,*(undefined2 *)(puVar3 + 2));
  if (**(char **)(puVar3 + 4) == '\0') {
    API_FDD2();
    uVar1 = extraout_A_00;
    uVar2 = extraout_B;
  }
  else {
    uVar2 = 0;
    uVar1 = extraout_A;
  }
  (**(code **)(puVar3 + 6))(uVar1,uVar2);
  return uStack_4;
}


// ===== FUN_a0c7 @ a0c7 =====

undefined2 __h3000 FUN_a0c7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_a086();
  FUN_a086();
  FUN_a086();
  FUN_a086();
  return uStack_4;
}


// ===== API_FD9C @ a0e8 =====

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


// ===== API_FDE2 @ a0f5 =====

undefined2 __h3000 API_FDE2(void)

{
  undefined2 in_D;
  char cVar1;
  short in_U;
  
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
  return in_D;
}


// ===== FUN_a120 @ a120 =====

undefined2 __h3000 FUN_a120(void)

{
  undefined2 in_D;
  
  do {
    if (DAT_6150 != -1) {
      DAT_6150 = DAT_6150 + '\x01';
      FUN_a153();
    }
    if (DAT_614e != -1) {
      DAT_614e = DAT_614e + '\x01';
      FUN_a158();
    }
    API_FD20(0);
  } while ((DAT_6150 != -1) || (DAT_614e != -1));
  return in_D;
}


// ===== FUN_a153 @ a153 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_a153(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  uVar1 = (undefined1)((ushort)DAT_6150 * (ushort)DAT_6151 >> 8);
  API_FC7A(uVar1,uVar1,&UNK_8033);
  uVar1 = (undefined1)((ushort)(byte)~DAT_6150 * (ushort)DAT_6151 >> 8);
  API_FC7A(uVar1,uVar1,&UNK_8023);
  return in_D;
}


// ===== FUN_a158 @ a158 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_a158(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  uVar1 = (undefined1)((ushort)DAT_614e * (ushort)DAT_614f >> 8);
  API_FC7A(uVar1,uVar1,&UNK_8026);
  uVar1 = (undefined1)((ushort)(byte)~DAT_614e * (ushort)DAT_614f >> 8);
  API_FC7A(uVar1,uVar1,&UNK_8036);
  return in_D;
}


// ===== FUN_a15d @ a15d =====

undefined2 __h3000 FUN_a15d(void)

{
  undefined2 in_D;
  
  do {
    if (DAT_6150 != DAT_6152) {
      DAT_6150 = DAT_6150 + -1;
      FUN_a153();
    }
    if (DAT_614e != DAT_6153) {
      DAT_614e = DAT_614e + -1;
      FUN_a158();
    }
    API_FD20(0);
  } while ((DAT_6152 != DAT_6150) || (DAT_6153 != DAT_614e));
  return in_D;
}


// ===== API_FC7C @ a196 =====

void __h3000 API_FC7C(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  API_FCA0();
  DAT_600c = uVar1;
  return;
}


// ===== API_FC7E @ a1ad =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FC7E(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 uVar1;
  undefined1 uVar3;
  undefined2 uVar2;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  uVar3 = API_FCA0();
  uVar2 = API_FCA0(uVar3,uVar3,param_3 + 1);
  DAT_600c = uVar1;
  return uVar2;
}


// ===== API_FC80 @ a1cf =====

void __h3000 API_FC80(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  API_FCA2();
  DAT_600c = uVar1;
  return;
}


// ===== API_FC82 @ a1e6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 API_FC82(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 uVar1;
  undefined2 uVar2;
  
  uVar1 = DAT_600c;
  DAT_600c = 0xa0;
  uVar2 = API_FCA2();
  API_FCA2((char)uVar2,(char)((ushort)uVar2 >> 8),param_3,param_4 + 1);
  DAT_600c = uVar1;
  return;
}


// ===== API_FD88 @ a20a =====

undefined2 __h3000 API_FD88(undefined1 param_1)

{
  byte extraout_A;
  byte extraout_B;
  
  FUN_a23f();
  API_FC7C();
  return CONCAT11(param_1,extraout_B & extraout_A);
}


// ===== API_FD8A @ a218 =====

void __h3000 API_FD8A(void)

{
  byte extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  byte extraout_B_00;
  undefined2 in_Y;
  
  FUN_a23f();
  API_FC7C(extraout_A,extraout_B,in_Y);
  API_FC80(extraout_A_00,extraout_B_00 | extraout_A);
  return;
}


// ===== API_FD8C @ a22b =====

void __h3000 API_FD8C(void)

{
  byte extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  byte extraout_B_00;
  undefined2 in_Y;
  
  FUN_a23f();
  API_FC7C(~extraout_A,extraout_B,in_Y);
  API_FC80(extraout_A_00,extraout_B_00 & ~extraout_A);
  return;
}


// ===== FUN_a23f @ a23f =====

void __h3000 FUN_a23f(void)

{
  return;
}


// ===== API_FC84 @ a253 =====

undefined2 __h3000 API_FC84(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FC88();
  API_FC86();
  DAT_60b8 = 0xff;
  return uStack_2;
}


// ===== FUN_a263 @ a263 =====

undefined2 __h3000 FUN_a263(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_60fb = 0xff;
  FUN_a272();
  FUN_a2f3();
  return uStack_2;
}


// ===== FUN_a272 @ a272 =====

undefined2 __h3000 FUN_a272(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if ((DAT_60fb & 0xf8) != 0x80) {
    API_FC8C();
    API_FC88();
                    /* inline[API_FC38]: "{1} Left In   Right In  Left Out  Right Out(        )(
                       )(        )(        )" */
    LcdPrintInline();
    FUN_a44c();
                    /* inline[API_FD18]: [$603C]=$A48D [$603E]=$A4CA [$6040]=$A4F1 [$6042]=$A518 */
    StoreWordsInline();
  }
  return uStack_2;
}


// ===== FUN_a2f3 @ a2f3 =====

undefined2 __h3000 FUN_a2f3(void)

{
  undefined2 in_D;
  char cVar1;
  
  if (DAT_60fb != -0x80) {
    DAT_60fb = -0x80;
    cVar1 = API_FC7C();
    DAT_6074 = (short)cVar1;
    FUN_a46d();
                    /* inline[API_FD18]: [$602A]=$A3A4 [$6070]=$A335 [$6072]=$A34D [$605C]=$A36A
                       [$605A]=$A36A */
    StoreWordsInline();
    API_FDF2();
    FUN_e5f0();
    FUN_e5f0();
  }
  return in_D;
}


// ===== FUN_a335 @ a335 =====

void __h3000 FUN_a335(void)

{
  if (DAT_604d != '\0') {
                    /* inline[API_FC38]: "{2:2A}{5:06}{3:60A0}{2:34}{5:06}{3:60A0}" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_a34d @ a34d =====

undefined2 __h3000 FUN_a34d(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  
  puVar1 = &DAT_a5e9;
  FUN_a5ca((char)((ushort)DAT_6074 >> 8));
  (*(code *)*puVar1)();
  puVar1 = &DAT_a5f4;
  FUN_a5ca();
  (*(code *)*puVar1)();
  FUN_a43c();
  FUN_a43c();
  return in_D;
}


// ===== FUN_a36a @ a36a =====

undefined2 __h3000 FUN_a36a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_a38b();
  FUN_a38b();
  FUN_a43c();
  FUN_a43c();
  return uStack_6;
}


// ===== FUN_a38b @ a38b =====

short __h3000 FUN_a38b(void)

{
  short in_D;
  char cVar1;
  undefined2 *in_Y;
  
  cVar1 = API_FC7C();
  API_FD9C((char)((ushort)(cVar1 + in_D) >> 8));
  FUN_a5ca();
  (*(code *)*in_Y)();
  return in_D;
}


// ===== FUN_a3a4 @ a3a4 =====

undefined2 __h3000 FUN_a3a4(void)

{
  undefined2 in_D;
  char cVar1;
  
  if (DAT_60fb != -0x7f) {
    DAT_60fb = -0x7f;
    cVar1 = API_FC7C();
    DAT_6074 = (short)cVar1;
    FUN_a46d();
                    /* inline[API_FD18]: [$602A]=$A2F3 [$6070]=$A3E6 [$6072]=$A3FE [$605C]=$A41B
                       [$605A]=$A41B */
    StoreWordsInline();
    API_FDF2();
    FUN_e5f0();
    FUN_e5f0();
  }
  return in_D;
}


// ===== FUN_a3e6 @ a3e6 =====

void __h3000 FUN_a3e6(void)

{
  if (DAT_604d != '\0') {
                    /* inline[API_FC38]: "{2:3E}{5:06}{3:60A0}{2:48}{5:06}{3:60A0}" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_a3fe @ a3fe =====

undefined2 __h3000 FUN_a3fe(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  
  puVar1 = &DAT_a5ff;
  FUN_a5ca((char)((ushort)DAT_6074 >> 8));
  (*(code *)*puVar1)();
  puVar1 = &DAT_a60a;
  FUN_a5ca();
  (*(code *)*puVar1)();
  FUN_a43c();
  FUN_a43c();
  return in_D;
}


// ===== FUN_a41b @ a41b =====

undefined2 __h3000 FUN_a41b(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_a38b();
  FUN_a38b();
  FUN_a43c();
  FUN_a43c();
  return uStack_6;
}


// ===== FUN_a43c @ a43c =====

undefined2 __h3000 FUN_a43c(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FDE2(param_1,*(undefined1 *)(param_4 + 6),*(undefined2 *)(param_4 + 2));
  return uStack_4;
}


// ===== FUN_a44c @ a44c =====

undefined2 __h3000 FUN_a44c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_a43c();
  FUN_a43c();
  FUN_a43c();
  FUN_a43c();
  return uStack_4;
}


// ===== FUN_a46d @ a46d =====

undefined2 __h3000 FUN_a46d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC16]: 03 10 06 32 01 00 03 00 $0000 $FFD0 $0000 ->$8877 ->$8877
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return uStack_2;
}


// ===== FUN_a48d @ a48d =====

undefined2 __h3000 FUN_a48d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_60fb != -0x7e) {
    DAT_60fb = -0x7e;
    FUN_a574();
    FUN_a59f();
  }
  return uStack_2;
}


// ===== FUN_a4a6 @ a4a6 =====

undefined2 __h3000 FUN_a4a6(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_a5b2();
  FUN_a4b4();
  return uStack_6;
}


// ===== FUN_a4b4 @ a4b4 =====

undefined2 __h3000 FUN_a4b4(void)

{
  undefined2 in_D;
  undefined2 *in_Y;
  
  DAT_6074 = DAT_60f9;
  DAT_60c2 = in_Y;
  (*(code *)*in_Y)();
  FUN_a43c();
  return in_D;
}


// ===== FUN_a4ca @ a4ca =====

undefined2 __h3000 FUN_a4ca(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_60fb != -0x7d) {
    DAT_60fb = -0x7d;
    FUN_a574();
    FUN_a59f();
  }
  return uStack_2;
}


// ===== FUN_a4e3 @ a4e3 =====

undefined2 __h3000 FUN_a4e3(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_a5b2();
  FUN_a4b4();
  return uStack_6;
}


// ===== FUN_a4f1 @ a4f1 =====

undefined2 __h3000 FUN_a4f1(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_60fb != -0x7c) {
    DAT_60fb = -0x7c;
    FUN_a574();
    FUN_a59f();
  }
  return uStack_2;
}


// ===== FUN_a50a @ a50a =====

undefined2 __h3000 FUN_a50a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_a5b2();
  FUN_a4b4();
  return uStack_6;
}


// ===== FUN_a518 @ a518 =====

undefined2 __h3000 FUN_a518(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_60fb != -0x7b) {
    DAT_60fb = -0x7b;
    FUN_a574();
    FUN_a59f();
  }
  return uStack_2;
}


// ===== FUN_a531 @ a531 =====

undefined2 __h3000 FUN_a531(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_a5b2();
  FUN_a4b4();
  return uStack_6;
}


// ===== FUN_a540 @ a540 =====

undefined2 __h3000 FUN_a540(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,*(undefined1 *)(DAT_60c2 + 6));
  if (DAT_604d != '\0') {
                    /* inline[API_FC38]: "{5:06}{3:60A0}" */
    LcdPrintInline();
  }
  return uStack_2;
}


// ===== FUN_a55e @ a55e =====

undefined2 __h3000 FUN_a55e(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  
  puVar1 = DAT_60c2;
  FUN_a5ca((char)((ushort)DAT_6074 >> 8));
  (*(code *)*puVar1)();
  FUN_a43c();
  return in_D;
}


// ===== FUN_a574 @ a574 =====

void __h3000 FUN_a574(void)

{
  char cVar1;
  undefined2 in_Y;
  
  DAT_60c2 = in_Y;
  cVar1 = API_FC7C();
  DAT_6074 = (short)cVar1;
                    /* inline[API_FC16]: 01 10 02 32 01 00 03 00 $0000 $FFD0 $0000 ->$A540 ->$A55E
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return;
}


// ===== FUN_a59f @ a59f =====

undefined1 __h3000 FUN_a59f(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 extraout_A;
  
  API_FDF2(param_1,*(undefined1 *)(param_4 + 6));
  FUN_e5f0(extraout_A,*(undefined1 *)(param_4 + 7));
  return param_2;
}


// ===== FUN_a5b2 @ a5b2 =====

void __h3000 FUN_a5b2(void)

{
  short in_Y;
  
  if (*(char *)(in_Y + 10) != DAT_60fb) {
    FUN_a272();
    DAT_60b9 = *(undefined1 *)(in_Y + 7);
    (**(code **)(in_Y + 8))();
  }
  return;
}


// ===== FUN_a5ca @ a5ca =====

char __h3000 FUN_a5ca(undefined1 param_1,char param_2)

{
  char cVar1;
  
  cVar1 = API_FC7C();
  if (cVar1 != param_2) {
    FUN_eb25(param_2 >> 7);
  }
  return param_2;
}


// ===== FUN_a619 @ a619 =====

undefined2 __h3000 FUN_a619(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_60fb = 0xff;
  API_FC88();
  API_FC8E();
  return uStack_2;
}


// ===== API_FC88 @ a629 =====

void __h3000 API_FC88(void)

{
  API_FDB0();
                    /* inline[API_FD18]: [$602A]=$A263 [$602E]=$A7DE [$6030]=$DE80 [$602C]=$A615
                       [$603C]=$8877 [$603E]=$8877 [$6040]=$8877 [$6042]=$8877 [$6038]=$8877
                       [$6036]=$8877 [$603A]=$A619 [$605C]=$8877 [$605A]=$8877 [$606A]=$8877
                       [$6072]=$8877 [$6070]=$8877 */
  StoreWordsInline();
  return;
}


// ===== API_FDD4 @ a672 =====

void __h3000 API_FDD4(void)

{
                    /* inline[API_FC38]: "{2:28}{5:28}" */
  LcdPrintInline();
                    /* inline[API_FD18]: [$603C]=$8877 [$603E]=$8877 [$6040]=$8877 [$6042]=$8877 */
  StoreWordsInline();
  return;
}


// ===== FUN_a690 @ a690 =====

undefined2 __h3000 FUN_a690(void)

{
  undefined2 in_D;
  undefined2 *local_res0;
  
  DAT_6158 = *local_res0;
  DAT_615a = local_res0[1];
                    /* inline[API_FC8A]: ->$A6C5 "(  Yes   )" */
  SoftKeyDefine();
                    /* inline[API_FC8A]: ->$A6C9 "(   No   )" */
  SoftKeyDefine();
  return in_D;
}


// ===== FUN_a6c5 @ a6c5 =====

void __h3000 FUN_a6c5(void)

{
                    /* WARNING: Could not recover jumptable at 0xa6c5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*DAT_6158)();
  return;
}


// ===== FUN_a6c9 @ a6c9 =====

void __h3000 FUN_a6c9(void)

{
                    /* WARNING: Could not recover jumptable at 0xa6c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*DAT_615a)();
  return;
}


// ===== SoftKeyDefine @ a6cd =====

/* Kernel API slot $FC8A: B = key 0-3; inline handler + 10-char label */

byte __h3000
SoftKeyDefine(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  byte bVar1;
  undefined2 *local_res0;
  
  *(byte *)(param_5 + -1) = param_2 & 3;
  *(undefined2 *)((short)&DAT_603c + (short)(char)((param_2 & 3) << 1)) = *local_res0;
  bVar1 = *(byte *)(param_5 + -1);
  LcdSetCursor((char)((CONCAT11(10,bVar1) >> 8) * (ushort)bVar1 >> 8));
  API_FC3A();
  return param_2;
}


// ===== API_FDD6 @ a6f6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

byte __h3000
API_FDD6(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 param_4,undefined2 *param_5)

{
  undefined1 extraout_A;
  
  *(undefined2 *)((short)&DAT_603c + (short)(char)((param_2 & 3) << 1)) = *param_5;
  LcdSetCursor(0);
  API_FC3A(extraout_A,8,param_3);
  if (DAT_60b8 == '\0') {
    DAT_60b8 = -1;
    API_FD1C(0xff,param_2,&UNK_a768,0x6800);
    LcdSetCursor();
    API_FC3C();
    (*DAT_60ed)();
  }
  return param_2;
}


// ===== API_FC8C @ a71c =====

undefined2 __h3000 API_FC8C(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  if (DAT_60b8 == '\0') {
    DAT_60b8 = -1;
    API_FD1C(0xff,param_2,&UNK_a768,0x6800);
    LcdSetCursor(extraout_A,0);
    API_FC3C(extraout_A_00,0x50);
    (*DAT_60ed)();
  }
  return uStack_6;
}


// ===== API_FC8E @ a743 =====

undefined2 __h3000 API_FC8E(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  if (DAT_60b8 != '\0') {
    DAT_60b8 = '\0';
    API_FD1E(param_1,param_2,0x6800,&UNK_a768);
    LcdSetCursor(extraout_A,0);
    API_FC3A(extraout_A_00,0x50);
    (*DAT_60ef)();
  }
  return uStack_6;
}


// ===== FUN_a7de @ a7de =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_a7de(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  uVar1 = API_FC8C();
  API_FC7E((char)((ushort)uVar1 >> 8),(char)uVar1,0);
  FUN_9d10();
  DAT_615c = FUN_a95f();
  API_FDC0(0xa7);
  return in_D;
}


// ===== FUN_a827 @ a827 =====

undefined2 __h3000 FUN_a827(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  return uStack_4;
}


// ===== FUN_a82c @ a82c =====

undefined2 __h3000 FUN_a82c(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0xa0;
  API_FC88();
  DAT_6036 = API_FDC4;
  DAT_602e = API_FDC6;
  API_FDD4();
                    /* inline[API_FC38]: "{2:00}Selected Program : " */
  LcdPrintInline();
  DAT_6054 = FUN_a95f((char)((ushort)DAT_615c >> 8));
  DAT_6064 = &UNK_03e8;
  DAT_6056 = &UNK_03e8;
  DAT_6062 = DAT_6054;
  DAT_6074 = DAT_6054;
  DAT_615c = DAT_6054;
                    /* inline[API_FD18]: [$606C]=$03E7 [$606E]=$0000 [$6070]=$8877 [$6072]=$8877
                       [$606A]=$A918 [$605C]=$A97C [$605A]=$A956 [$60DE]=$0001 [$60DC]=$0001
                       [$60E0]=$0096 */
  StoreWordsInline();
                    /* inline[API_FD1A]: [$6066]=$01 [$6067]=$20 [$6058]=$02 [$6068]=$04 [$6099]=$00
                       [$6069]=$03 */
  StoreBytesInline();
  API_FC1E();
  API_FC28();
  API_FC18();
  FUN_a8cf();
  return in_D;
}


// ===== FUN_a8cf @ a8cf =====

undefined2 __h3000 FUN_a8cf(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  if (DAT_615c == &UNK_03e8) {
                    /* inline[API_FC38]: "Last Edit            " */
    LcdPrintInline();
    if (DAT_61ad != '\0') {
                    /* inline[API_FC38]: "{2:1E}<SEQUENCE>" */
      LcdPrintInline();
    }
  }
  else {
    FUN_ae5e();
    FUN_ae6d();
  }
  return in_D;
}


// ===== FUN_a918 @ a918 =====

undefined2 __h3000 FUN_a918(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  short in_U;
  
  uVar2 = (undefined1)((ushort)DAT_6074 >> 8);
  if (DAT_60fd == '\f') {
    FUN_9d03(uVar2);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      FUN_aa1d();
    }
    return in_D;
  }
  uVar3 = FUN_9d03(uVar2);
  uVar1 = DAT_6074;
  if (!(bool)(extraout_CC >> 2 & 1)) {
    *(char *)(in_U + -1) = (char)DAT_6074;
    *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FC38]: "{2:28}{5:28}{2:13}{5:15}[{4:2000}{3:60AA}]" */
    LcdPrintInline();
    API_FDD4();
    return in_D;
  }
  DAT_6054 = uVar3;
  DAT_6062 = uVar3;
  DAT_615c = uVar3;
  FUN_a8cf();
  FUN_9bd8();
  return in_D;
}


// ===== FUN_a956 @ a956 =====

undefined2 __h3000 FUN_a956(void)

{
  undefined2 in_D;
  
  DAT_6054 = FUN_a973((char)((ushort)DAT_6054 >> 8));
  DAT_6062 = DAT_6054;
  DAT_615c = DAT_6054;
  FUN_a8cf();
  FUN_9bd8();
  return in_D;
}


// ===== FUN_a95f @ a95f =====

void __h3000 FUN_a95f(void)

{
  ushort uVar1;
  byte extraout_CC;
  
  uVar1 = FUN_9d03();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    if (uVar1 < DAT_615c) {
      FUN_a9b5();
    }
    else {
      FUN_a995();
    }
  }
  return;
}


// ===== FUN_a973 @ a973 =====

void __h3000 FUN_a973(void)

{
  DAT_6074 = FUN_a95f();
  API_FC1E();
  return;
}


// ===== FUN_a97c @ a97c =====

undefined2 __h3000 FUN_a97c(void)

{
  undefined2 in_D;
  
  DAT_6054 = FUN_a973((char)((ushort)DAT_6062 >> 8));
  DAT_6062 = DAT_6054;
  DAT_615c = DAT_6054;
  FUN_a8cf();
  FUN_9bd8();
  return in_D;
}


// ===== FUN_a995 @ a995 =====

void __h3000 FUN_a995(void)

{
  undefined2 in_D;
  undefined *puVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  puVar1 = (undefined *)FUN_a9d5();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    if (puVar1 != &UNK_03e8) {
      do {
        puVar1 = (undefined *)FUN_a9d5((char)((ushort)(puVar1 + 1) >> 8));
        if ((bool)(extraout_CC_00 >> 2 & 1)) {
          return;
        }
      } while (puVar1 < &UNK_03e8);
    }
    FUN_a9b5((char)((ushort)in_D >> 8));
  }
  return;
}


// ===== FUN_a9b5 @ a9b5 =====

void __h3000 FUN_a9b5(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  
  sVar1 = FUN_a9d5();
  bVar2 = extraout_CC;
  while( true ) {
    if ((bool)(bVar2 >> 2 & 1)) {
      return;
    }
    if (sVar1 == 0) break;
    sVar1 = FUN_a9d5((char)((ushort)(sVar1 + -1) >> 8));
    bVar2 = extraout_CC_00;
  }
  FUN_a995((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_a9d5 @ a9d5 =====

void __h3000 FUN_a9d5(void)

{
  FUN_9d03();
  return;
}


// ===== FUN_a9df @ a9df =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xaa1b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_a9df(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_615c == &UNK_03e8) {
LAB_a9f0:
    if (DAT_61ad != '\0') {
                    /* inline[API_FC8A]: ->$AA47 "---SEQ--- " */
      SoftKeyDefine();
      goto LAB_aa1b;
    }
  }
  else if (&UNK_007f < DAT_615c) goto LAB_a9f0;
                    /* inline[API_FC8A]: ->$AA1D "(  Load  )" */
  SoftKeyDefine();
LAB_aa1b:
                    /* WARNING: Could not recover jumptable at 0xaa1b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return;
}


// ===== FUN_aa1d @ aa1d =====

undefined2 __h3000 FUN_aa1d(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  if (DAT_615c == &UNK_03e8) {
    FUN_aac1();
  }
  else {
    if ((char)((DAT_615c < (undefined *)0x7f) + (DAT_615c == (undefined *)0x7f)) != '\0') {
      FUN_ebb5();
    }
    FUN_aaa7();
    FUN_9d38();
    API_FC66();
    if ((extraout_CC >> 2 & 1) == 0) {
      return in_D;
    }
  }
  API_FDCE();
  return in_D;
}


// ===== FUN_aa47 @ aa47 =====

undefined2 __h3000 FUN_aa47(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "{1}Loading this is not allowed because     Program
                       Sequence Transmission is Enabled" */
  LcdPrintInline();
  FUN_9041();
  API_FDC2();
  return uStack_2;
}


// ===== FUN_aaa7 @ aaa7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_aaa7(void)

{
  undefined2 in_Y;
  
  BankPushSelect();
  API_FD04(1,0,0,&DAT_6e00);
  BankPop();
  return in_Y;
}


// ===== FUN_aac1 @ aac1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_aac1(void)

{
  undefined2 in_Y;
  
  BankPushSelect();
  FUN_bfc9(1,0,0,&DAT_6e00);
  BankPop();
  return in_Y;
}


// ===== FUN_aadb @ aadb =====

undefined2 __h3000 FUN_aadb(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$AAF2 "( Origin )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_2;
}


// ===== FUN_aaf2 @ aaf2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_aaf2(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  undefined1 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  
  uVar2 = DAT_6e00;
  if (DAT_615c != &UNK_03e8) {
    FUN_9d38();
    uVar1 = API_FC06();
    if ((extraout_CC >> 2 & 1) == 0) {
      return in_D;
    }
    uVar2 = API_FD9E((char)((ushort)uVar1 >> 8),(char)uVar1,8);
  }
  API_FC06(uVar2);
  if ((extraout_CC_00 >> 2 & 1) != 0) {
                    /* inline[API_FC38]: "{1}Original Program :" */
    LcdPrintInline();
    FUN_ae6d();
    FUN_9041();
    API_FDC2();
  }
  return in_D;
}


// ===== FUN_ab3b @ ab3b =====

undefined2 __h3000 FUN_ab3b(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined2 in_stack_00000000;
  
  BankPushSelect(param_1,DAT_6079);
  if ((*(byte *)(DAT_607a + 5) & 1) != 0) {
                    /* inline[API_FC8A]: ->$AB64 "( Remove )" */
    SoftKeyDefine(extraout_A,DAT_60b9);
  }
  BankPop();
  return in_stack_00000000;
}


// ===== FUN_ab64 @ ab64 =====

undefined2 __h3000 FUN_ab64(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC38]: "{1}Remove Preset " */
  LcdPrintInline();
  FUN_ae5e((char)((ushort)DAT_615c >> 8));
  FUN_ae6d();
  API_FC2A();
                    /* inline[API_FE3C]: $AB91 $ABAB */
  FUN_a690();
  return in_D;
}


// ===== FUN_ab91 @ ab91 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_ab91(void)

{
  undefined2 in_D;
  
  FUN_9d38((char)((ushort)DAT_615c >> 8),(char)DAT_615c,0x6a00);
  API_FDA8();
  API_FC64();
  FUN_a827();
  FUN_9c7a();
  return in_D;
}


// ===== FUN_abab @ abab =====

void __h3000 FUN_abab(void)

{
  FUN_9c7a();
  return;
}


// ===== FUN_abaf @ abaf =====

undefined2 __h3000 FUN_abaf(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0xa2;
  API_FC88();
  DAT_6036 = API_FDC4;
  DAT_602e = API_FDC6;
                    /* inline[API_FC38]: "{1}Current Edit :" */
  LcdPrintInline();
  DAT_6079 = 0xa0;
  DAT_607a = 0;
  FUN_ae6d();
  return in_D;
}


// ===== FUN_abe9 @ abe9 =====

undefined2 __h3000 FUN_abe9(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$B4ED "(  Save  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_2;
}


// ===== FUN_ac00 @ ac00 =====

undefined2 __h3000 FUN_ac00(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  byte extraout_CC;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_b7f8();
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* inline[API_FC8A]: ->$AC1C "( Update )" */
    SoftKeyDefine(extraout_A,DAT_60b9);
  }
  return uStack_2;
}


// ===== FUN_ac1c @ ac1c =====

undefined2 __h3000 FUN_ac1c(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "{1}Overwrite Program " */
  LcdPrintInline();
  API_FC7C(extraout_A,extraout_B,0);
  API_FC06(extraout_B_00,0);
  FUN_ae6d();
                    /* inline[API_FE3C]: $AC4E $AC54 */
  FUN_a690();
  return uStack_4;
}


// ===== FUN_ac4e @ ac4e =====

void __h3000 FUN_ac4e(void)

{
  FUN_b82e();
  API_FC64();
  FUN_9c7a();
  return;
}


// ===== FUN_ac58 @ ac58 =====

undefined2 __h3000 FUN_ac58(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0xa2;
  API_FC88();
  DAT_6036 = API_FDC4;
  DAT_602e = API_FDC6;
                    /* inline[API_FC38]: "{1}MIDI Program Load Functions " */
  LcdPrintInline();
  if (DAT_61af != '\0') {
                    /* inline[API_FC38]: "{2:1C}<SEQUENCED>" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_aca8 @ aca8 =====

undefined2 __h3000 FUN_aca8(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined2 in_stack_00000002;
  
  BankPushSelect(param_1,0xa0);
                    /* inline[API_FC8A]: ->$ACCA "(Load=   )" */
  SoftKeyDefine(extraout_A,DAT_60b9);
  FUN_ada6();
  BankPop();
  return in_stack_00000002;
}


// ===== FUN_acca @ acca =====

undefined1 __h3000
FUN_acca(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 *puVar1;
  undefined1 uStack_3;
  undefined2 uStack_2;
  
  puVar1 = &uStack_3;
  uStack_2 = param_4;
  if (DAT_61af == '\0') {
    BankPushSelect(param_1,0xa0);
    DAT_010d = DAT_010d ^ 1;
                    /* inline[API_FE5E]: $AD80 $AD57 */
    FUN_ef6e();
                    /* inline[API_FC38]: "{2:00}{5:28}{6}" */
    LcdPrintInline();
    FUN_ada6();
    BankPop();
    puVar1 = &stack0x0001;
  }
  else {
    FUN_acfb();
  }
  return *puVar1;
}


// ===== FUN_acfb @ acfb =====

void __h3000 FUN_acfb(void)

{
                    /* inline[API_FC38]: "{1}Changing this is not allowed because    Program
                       Sequencing Reception is Enabled " */
  LcdPrintInline();
  FUN_9041();
  API_FDC2();
  return;
}


// ===== FUN_ada6 @ ada6 =====

undefined1 __h3000 FUN_ada6(undefined1 param_1,undefined1 param_2)

{
  LcdSetCursor(param_1,0x38);
  if ((DAT_61af == '\0') && (DAT_010d != '\0')) {
    DAT_010d = '\x01';
                    /* inline[API_FC38]: "Map" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "ID " */
    LcdPrintInline();
  }
  return param_2;
}


// ===== FUN_adcf @ adcf =====

void __h3000 FUN_adcf(undefined1 param_1)

{
  undefined1 extraout_A;
  
  BankPushSelect(param_1,0xa0);
                    /* inline[API_FC8A]: ->$ADEA "(        )" */
  SoftKeyDefine(extraout_A,DAT_60b9);
  FUN_ae22();
  return;
}


// ===== FUN_adea @ adea =====

undefined2 __h3000 FUN_adea(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined2 in_stack_00000000;
  
  BankPushSelect(param_1,0xa0);
  if (DAT_61af == '\0') {
    DAT_010e = DAT_010e ^ 1;
    FUN_ef2c(extraout_A,~DAT_010e & 1);
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Program Loading {6}" */
    LcdPrintInline();
    if ((DAT_010e == 0) || (DAT_61af != '\0')) {
      LcdPrintInline();
    }
    else {
      DAT_010e = 1;
      LcdPrintInline();
    }
  }
  else {
    FUN_acfb();
  }
  BankPop();
  return in_stack_00000000;
}


// ===== FUN_ae22 @ ae22 =====

undefined2 __h3000 FUN_ae22(void)

{
  undefined2 in_stack_00000003;
  
  if ((DAT_010e == '\0') || (DAT_61af != '\0')) {
                    /* inline[API_FC38]: "{2:3C}( Enabled)" */
    LcdPrintInline();
  }
  else {
    DAT_010e = '\x01';
                    /* inline[API_FC38]: "{2:3C}(Disabled)" */
    LcdPrintInline();
  }
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_ae5e @ ae5e =====

void __h3000 FUN_ae5e(void)

{
  FUN_9d38();
  API_FC06();
  return;
}


// ===== FUN_ae65 @ ae65 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000
FUN_ae65(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined2 uVar2;
  undefined2 *puVar3;
  undefined2 in_stack_00000000;
  
  BankPushSelect();
  puVar3 = DAT_607a;
  uVar2 = FUN_9d10((char)((ushort)*DAT_607a >> 8));
  *(char *)(param_5 + -1) = (char)uVar2;
  *(char *)(param_5 + -2) = (char)((ushort)uVar2 >> 8);
  if (param_2 == '\0') {
    LcdPrintInline();
    uVar1 = extraout_A;
  }
  else {
    LcdPrintInline();
    uVar1 = extraout_A_00;
  }
  API_FC3A(uVar1,0xf,puVar3 + 5);
  BankPop();
  return in_stack_00000000;
}


// ===== FUN_ae6d @ ae6d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000
FUN_ae6d(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 uVar1;
  undefined2 uVar2;
  undefined2 *puVar3;
  undefined2 in_stack_00000000;
  
  BankPushSelect();
  puVar3 = DAT_607a;
  uVar2 = FUN_9d10((char)((ushort)*DAT_607a >> 8));
  *(char *)(param_5 + -1) = (char)uVar2;
  *(char *)(param_5 + -2) = (char)((ushort)uVar2 >> 8);
  if (param_2 == '\0') {
                    /* inline[API_FC38]: "[{4:2000}{3:60AA}] " */
    LcdPrintInline();
    uVar1 = extraout_A;
  }
  else {
                    /* inline[API_FC38]: "{4:2000}{3:60AA} " */
    LcdPrintInline();
    uVar1 = extraout_A_00;
  }
  API_FC3A(uVar1,0xf,puVar3 + 5);
  BankPop();
  return in_stack_00000000;
}


// ===== FUN_aeb1 @ aeb1 =====

undefined1 __h3000 FUN_aeb1(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$AEC8 "(  Map   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_aec8 @ aec8 =====

undefined2 __h3000 FUN_aec8(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0xa3;
  DAT_6036 = API_FDC4;
  DAT_6160 = 0xe2;
  DAT_6074 = 0xe2;
  API_FDC8(0xae);
  DAT_60b9 = 0;
  FUN_b049();
  return in_D;
}


// ===== FUN_aefe @ aefe =====

undefined2 __h3000 FUN_aefe(void)

{
  undefined2 in_D;
  
  DAT_6160 = 0;
  DAT_602e = API_FDCA;
  return in_D;
}


// ===== FUN_af0c @ af0c =====

undefined2 __h3000 FUN_af0c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$AF23 "(  Name  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_4;
}


// ===== FUN_af23 @ af23 =====

undefined2 __h3000 FUN_af23(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0xa4;
  DAT_6036 = API_FDC4;
  API_FDF2();
  FUN_e5f0();
  DAT_6054 = (undefined *)FUN_b13a();
  if (DAT_6054 == (undefined *)0xfff) {
    DAT_6054 = &UNK_03e8;
  }
  DAT_6064 = &UNK_03e8;
  DAT_6056 = &UNK_03e8;
  DAT_6062 = DAT_6054;
  DAT_6074 = DAT_6054;
  DAT_615c = DAT_6054;
                    /* inline[API_FD18]: [$606C]=$03E7 [$606E]=$0000 [$6070]=$8877 [$6072]=$8877
                       [$606A]=$AFB3 [$605C]=$AFFF [$605A]=$AFDC [$60DE]=$0001 [$60DC]=$0001
                       [$60E0]=$0096 */
  StoreWordsInline();
                    /* inline[API_FD1A]: [$6066]=$01 [$6067]=$20 [$6058]=$02 [$6068]=$04 [$6099]=$00
                       [$6069]=$03 */
  StoreBytesInline();
  API_FC1E();
  API_FC28();
  API_FC18();
  FUN_b0b2();
  return in_D;
}


// ===== FUN_afb3 @ afb3 =====

undefined2 __h3000 FUN_afb3(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined *puVar2;
  undefined *puVar3;
  byte extraout_CC;
  short in_U;
  
  puVar2 = (undefined *)FUN_9d03((char)((ushort)DAT_6074 >> 8));
  uVar1 = DAT_6074;
  if (!(bool)(extraout_CC >> 2 & 1)) {
    *(char *)(in_U + -1) = (char)DAT_6074;
    *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FC38]: "{2:28}{5:28}{2:13}{5:15}[{4:2000}{3:60AA}]" */
    LcdPrintInline();
    API_FDD4();
    return in_D;
  }
  puVar3 = puVar2;
  if (puVar2 == &UNK_03e8) {
    puVar3 = (undefined *)0xffff;
  }
  DAT_6054 = puVar2;
  DAT_6062 = puVar2;
  DAT_615c = puVar2;
  FUN_b15b((char)((ushort)puVar3 >> 8));
  FUN_b0b2();
  FUN_9bd8();
  FUN_e5f0();
  return in_D;
}


// ===== FUN_afdc @ afdc =====

undefined2 __h3000 FUN_afdc(void)

{
  undefined2 in_D;
  undefined *puVar1;
  
  DAT_6054 = (undefined *)FUN_afe5((char)((ushort)DAT_6054 >> 8));
  puVar1 = DAT_6054;
  if (DAT_6054 == &UNK_03e8) {
    puVar1 = (undefined *)0xffff;
  }
  DAT_6062 = DAT_6054;
  DAT_615c = DAT_6054;
  FUN_b15b((char)((ushort)puVar1 >> 8));
  FUN_b0b2();
  FUN_9bd8();
  FUN_e5f0();
  return in_D;
}


// ===== FUN_afe5 @ afe5 =====

void __h3000 FUN_afe5(void)

{
  ushort uVar1;
  byte extraout_CC;
  
  uVar1 = FUN_9d03();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    if ((bool)((uVar1 < DAT_615c) + (uVar1 == DAT_615c))) {
      uVar1 = FUN_a9b5();
    }
    else {
      uVar1 = FUN_a995();
    }
  }
  DAT_6074 = uVar1;
  API_FC1E();
  return;
}


// ===== FUN_afff @ afff =====

undefined2 __h3000 FUN_afff(void)

{
  undefined2 in_D;
  undefined *puVar1;
  
  DAT_6054 = (undefined *)FUN_afe5((char)((ushort)DAT_6062 >> 8));
  puVar1 = DAT_6054;
  if (DAT_6054 == &UNK_03e8) {
    puVar1 = (undefined *)0xffff;
  }
  DAT_6062 = DAT_6054;
  DAT_615c = DAT_6054;
  FUN_b15b((char)((ushort)puVar1 >> 8));
  FUN_b0b2();
  FUN_9bd8();
  FUN_e5f0();
  return in_D;
}


// ===== FUN_b032 @ b032 =====

undefined2 __h3000 FUN_b032(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$B049 "( Number )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_2;
}


// ===== FUN_b049 @ b049 =====

undefined2 __h3000 FUN_b049(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0xa5;
  DAT_6036 = API_FDC4;
  API_FDF2();
  FUN_e5f0();
  DAT_6074 = (ushort)DAT_6160;
                    /* inline[API_FC16]: 01 01 02 32 01 00 03 00 $007F $0000 $0000 ->$B086 ->$B09D
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_b09d();
  return in_D;
}


// ===== FUN_b086 @ b086 =====

void __h3000 FUN_b086(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:0A}{3:60A0}{5:1B}" */
  LcdPrintInline();
  if (DAT_604d != '\0') {
    API_FDD4();
  }
                    /* WARNING: Could not recover jumptable at 0xb09b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_b09d @ b09d =====

undefined2 __h3000 FUN_b09d(void)

{
  undefined2 in_D;
  
  DAT_6160 = (undefined1)DAT_6074;
  FUN_b0b2();
  FUN_9bd8();
  FUN_e5f0();
  return in_D;
}


// ===== FUN_b0b2 @ b0b2 =====

undefined2 __h3000 FUN_b0b2(void)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  short in_U;
  undefined1 *puVar3;
  
                    /* inline[API_FC38]: "{2:00}MIDI Pgm #    Loads" */
  LcdPrintInline();
  *(undefined1 *)(in_U + -1) = DAT_6160;
  puVar3 = (undefined1 *)(in_U + -2);
  *puVar3 = 0;
                    /* inline[API_FC38]: "{2:0A}{4:2000}{3:60AA}{2:13}" */
  LcdPrintInline();
  sVar1 = FUN_b13a();
  if (sVar1 == 0xfff) {
                    /* inline[API_FC38]: " Nothing, Unpatched  " */
    LcdPrintInline();
  }
  else {
    uVar2 = FUN_9d03();
    if ((extraout_CC >> 2 & 1) == 0) {
      puVar3[-1] = (char)uVar2;
      puVar3[-2] = (char)((ushort)uVar2 >> 8);
                    /* inline[API_FC38]: " Missing Program     {2:24}{4:2000}{3:60AA}" */
      LcdPrintInline();
    }
    else {
      FUN_ae5e();
      if ((extraout_CC_00 >> 2 & 1) != 0) {
        FUN_ae6d();
      }
    }
  }
  return in_D;
}


// ===== FUN_b13a @ b13a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b13a(void)

{
  FUN_b148(0,DAT_6160,DAT_6160);
  return;
}


// ===== FUN_b148 @ b148 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b148(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  short sVar1;
  
  sVar1 = CONCAT11((char)((ushort)param_3 >> 8) << 1 | (byte)param_3 >> 7,(byte)param_3 << 1) +
          0x180;
  API_FC7E((char)((ushort)sVar1 >> 8),(char)sVar1,sVar1);
  return;
}


// ===== FUN_b15b @ b15b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xb178 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_b15b(undefined2 param_1,undefined2 param_2)

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
                    /* WARNING: Could not recover jumptable at 0xb178. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar3,(char)sVar2,param_1,param_2);
  return;
}


// ===== FUN_b17a @ b17a =====

undefined2 __h3000 FUN_b17a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$B191 "( Clear  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_2;
}


// ===== FUN_b191 @ b191 =====

undefined2 __h3000 FUN_b191(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDD4();
                    /* inline[API_FC38]: "{1}Clear the entire MIDI Map Table ?" */
  LcdPrintInline();
                    /* inline[API_FE3C]: $B1CA $B1C6 */
  FUN_a690();
  return uStack_2;
}


// ===== FUN_b1c6 @ b1c6 =====

undefined2 __h3000 FUN_b1c6(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_9c7a();
  DAT_60b9 = 0;
  FUN_b049();
  return uStack_4;
}


// ===== FUN_b1ca @ b1ca =====

undefined2 __h3000 FUN_b1ca(undefined1 param_1)

{
  undefined2 in_stack_00000000;
  
  BankPushSelect(param_1,0xa0);
                    /* inline[API_FD0C]: $0100 FF */
  MemsetInline();
  BankPop();
  FUN_9c7a();
  DAT_60b9 = 0;
  FUN_b049();
  return in_stack_00000000;
}


// ===== FUN_b1ec @ b1ec =====

undefined1 __h3000 FUN_b1ec(undefined1 param_1,undefined1 param_2)

{
  DAT_60fb = 0xa6;
  API_FC88();
  DAT_6036 = API_FDC4;
  DAT_602e = API_FDC6;
                    /* inline[API_FC38]: "{1}Dump Data Functions " */
  LcdPrintInline();
  SoftKeyDefine();
  return param_2;
}


// ===== FUN_b21d @ b21d =====

undefined1 __h3000 FUN_b21d(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B234 "(DumpEdit)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_b234 @ b234 =====

undefined2 __h3000 FUN_b234(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "{1}Sending Current Edited Program to MIDI " */
  LcdPrintInline();
  FUN_b299();
  API_FDC2();
                    /* inline[API_FC38]: "{2:00}Current Edit has been sent to MIDI      " */
  LcdPrintInline();
  return uStack_6;
}


// ===== FUN_b299 @ b299 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b299(void)

{
  undefined2 uVar1;
  undefined2 in_Y;
  
  BankPushSelect();
  API_FD20(0);
  DAT_619c = 0xff;
  FUN_b4a6();
  API_FC98();
  FUN_b4d2();
                    /* inline[API_FE24]: $68A0 */
  FUN_e8af((char)((ushort)DAT_0002 >> 8),(char)DAT_0002,0);
                    /* inline[API_FE28]: $68A0 */
  FUN_e987(0xfd);
  FUN_b4c8();
  uVar1 = API_FD20(0);
  DAT_619c = API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0116);
  BankPop();
  return in_Y;
}


// ===== FUN_b2e0 @ b2e0 =====

undefined1 __h3000 FUN_b2e0(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B2F7 "(Dump Pre)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_b2f7 @ b2f7 =====

undefined2 __h3000 FUN_b2f7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "{1}Sending Presets to MIDI " */
  LcdPrintInline();
  FUN_b34d();
  API_FDC2();
                    /* inline[API_FC38]: "{2:00}The Presets have been sent to MIDI      " */
  LcdPrintInline();
  return uStack_6;
}


// ===== FUN_b34d @ b34d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b34d(void)

{
  undefined2 uVar1;
  short *psVar2;
  undefined2 in_Y;
  short sVar3;
  
  BankPushSelect();
  FUN_8c0b();
  DAT_619c = 0xff;
  FUN_b4a6();
  API_FC98();
  FUN_b4e6();
  psVar2 = &DAT_0300;
  do {
    sVar3 = *psVar2;
                    /* inline[API_FE24]: $68A0 */
    FUN_e8af((char)((ushort)psVar2[1] >> 8));
  } while (sVar3 != -1);
  FUN_b4c8();
  FUN_b4a6();
  API_FC98();
                    /* inline[API_FE28]: $68A0 */
  FUN_e987(0xfc);
  FUN_b4c8();
  uVar1 = API_FD20(0);
  DAT_619c = API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0116);
  BankPop();
  return in_Y;
}


// ===== FUN_b3a4 @ b3a4 =====

undefined1 __h3000 FUN_b3a4(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B3BB "(Dump Map)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_b3bb @ b3bb =====

undefined2 __h3000 FUN_b3bb(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "{1}Sending Map Table to MIDI " */
  LcdPrintInline();
  FUN_b413();
  API_FDC2();
                    /* inline[API_FC38]: "{2:00}The Map Table has been sent to MIDI     " */
  LcdPrintInline();
  return uStack_6;
}


// ===== FUN_b413 @ b413 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b413(void)

{
  undefined2 uVar1;
  undefined2 in_Y;
  
  BankPushSelect();
  API_FD20(0);
  DAT_619c = 0xff;
  FUN_b4a6();
  API_FC98();
  FUN_b4d2();
                    /* inline[API_FE24]: $68A0 */
  FUN_e8af(1,0,0x180);
  FUN_b4c8();
  uVar1 = API_FD20(0);
  DAT_619c = API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,&DAT_0116);
  BankPop();
  return in_Y;
}


// ===== FUN_b452 @ b452 =====

undefined2 __h3000 FUN_b452(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$B476 "( Load=  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\a',DAT_6161);
  return uStack_6;
}


// ===== FUN_b466 @ b466 =====

undefined2 __h3000 FUN_b466(void)

{
  char extraout_B;
  undefined2 in_stack_00000000;
  
  FUN_ef85();
  FUN_ef15(extraout_B + '\a',DAT_6161);
  return in_stack_00000000;
}


// ===== FUN_b476 @ b476 =====

void __h3000 FUN_b476(undefined1 param_1)

{
  undefined1 extraout_B;
  
  FUN_ef57(param_1,DAT_6161);
  DAT_6161 = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}Receiving Dumps {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_b466();
  return;
}


// ===== FUN_b4a6 @ b4a6 =====

undefined1 __h3000 FUN_b4a6(undefined1 param_1)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 in_stack_00000003;
  
  BankPushSelect(param_1,0xa0);
  API_FC98(extraout_A,0xf0);
  API_FC98(extraout_A_00,0x1c);
  API_FC98(extraout_A_01,0x60);
  API_FC98(extraout_A_02,DAT_0110);
  BankPop();
  return in_stack_00000003;
}


// ===== FUN_b4c8 @ b4c8 =====

undefined1 __h3000 FUN_b4c8(undefined1 param_1,undefined1 param_2)

{
  API_FC98(param_1,0xf7);
  return param_2;
}


// ===== FUN_b4d2 @ b4d2 =====

void __h3000 FUN_b4d2(void)

{
  DAT_68ab = 0xa0;
                    /* inline[API_FE24]: $68A0 */
  FUN_e8af(0);
  return;
}


// ===== FUN_b4e6 @ b4e6 =====

void __h3000 FUN_b4e6(void)

{
  DAT_68cb = 0xa0;
  FUN_e8af(0);
  return;
}


// ===== FUN_b4ed @ b4ed =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b4ed(void)

{
  undefined2 in_D;
  undefined *puVar1;
  short sVar2;
  byte extraout_CC;
  
  if ((char)((DAT_614b < &DAT_03e7) + (DAT_614b == &DAT_03e7)) != '\0') {
    puVar1 = (undefined *)0x0;
    do {
      sVar2 = FUN_9d03((char)((ushort)puVar1 >> 8));
      if ((extraout_CC >> 2 & 1) == 0) {
        DAT_60c4 = 0;
        DAT_6162 = sVar2;
                    /* inline[API_FD0C]: $0014 20 */
        MemsetInline();
        DAT_600c = 0xa0;
        API_FDDC(0,0xf,10,&DAT_60c6);
        API_FDC8(0xb5);
        DAT_602e = API_FDCA;
        return in_D;
      }
      puVar1 = (undefined *)(sVar2 + 1);
    } while (puVar1 != &UNK_03e8);
  }
                    /* inline[API_FC38]: "{1}No more ID numbers available" */
  LcdPrintInline();
  FUN_9041();
  API_FDC2();
  return in_D;
}


// ===== FUN_b57d @ b57d =====

undefined2 __h3000 FUN_b57d(void)

{
  undefined2 in_D;
  
  API_FC88();
  DAT_60fb = 0xa8;
  DAT_6036 = API_FDC4;
                    /* inline[API_FC38]: "{1}Save as [   ]{2:1F}Adj Num ~" */
  LcdPrintInline();
  DAT_6074 = DAT_6162;
                    /* inline[API_FC16]: 01 10 02 1E 01 00 03 00 $03E7 $0000 $0000 ->$B5D1 ->$B5DB
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_b86b();
  return in_D;
}


// ===== FUN_b5d1 @ b5d1 =====

void __h3000 FUN_b5d1(void)

{
                    /* inline[API_FC38]: "{2:09}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_b5db @ b5db =====

undefined2 __h3000 FUN_b5db(void)

{
  undefined2 in_D;
  
  if ((bool)((DAT_6074 < DAT_6162) + (DAT_6074 == DAT_6162))) {
    DAT_6162 = FUN_b8ae();
  }
  else {
    DAT_6162 = FUN_b88e();
  }
  API_FDC2();
  return in_D;
}


// ===== FUN_b5f7 @ b5f7 =====

undefined2 __h3000 FUN_b5f7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$B60E "( Number )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_2;
}


// ===== FUN_b60e @ b60e =====

void __h3000 FUN_b60e(void)

{
  API_FDB0();
  API_FDC4();
  return;
}


// ===== FUN_b615 @ b615 =====

undefined2 __h3000 FUN_b615(void)

{
  undefined2 in_D;
  
  API_FC88();
  DAT_60fb = 0xa9;
  DAT_6036 = API_FDC4;
  if (DAT_60da == '\0') {
                    /* inline[API_FD0C]: $000F 20 */
    MemsetInline();
  }
  DAT_60c2._1_1_ = 0;
  DAT_6164 = DAT_60c6;
                    /* inline[API_FC38]: "{2:1F}Adj Name~" */
  LcdPrintInline();
  DAT_60da = 0xff;
  FUN_b65b();
  return in_D;
}


// ===== FUN_b65b @ b65b =====

undefined2 __h3000 FUN_b65b(void)

{
  undefined2 in_D;
  byte bVar1;
  
  bVar1 = FUN_b6d3();
  DAT_6074 = (ushort)bVar1;
                    /* inline[API_FC16]: 01 10 02 4B 02 00 06 00 $00BC $0000 $0000 ->$8877 ->$B6B6
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_b86b();
  FUN_b6e6();
  DAT_60c1 = 2;
  API_FDB2();
  return in_D;
}


// ===== FUN_b69f @ b69f =====

undefined2 __h3000 FUN_b69f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$9C05 "(  Name  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_2;
}


// ===== FUN_b6b6 @ b6b6 =====

undefined2 __h3000 FUN_b6b6(void)

{
  undefined2 in_D;
  
  DAT_6164 = (&DAT_b8d2)[DAT_6074];
  (&DAT_60c6)[(char)DAT_60c2] = DAT_6164;
  FUN_b86b();
  FUN_b6e6();
  return in_D;
}


// ===== FUN_b6d3 @ b6d3 =====

char __h3000 FUN_b6d3(void)

{
  char cVar1;
  
  cVar1 = -0x2e;
  API_FD0E();
  return cVar1 + '.';
}


// ===== FUN_b6e6 @ b6e6 =====

void __h3000 FUN_b6e6(undefined1 param_1)

{
  API_FDB8(param_1,(char)DAT_60c2 + '\x0e');
  return;
}


// ===== FUN_b6ef @ b6ef =====

undefined1 __h3000 FUN_b6ef(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B706 "(  .---  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_b706 @ b706 =====

undefined2 __h3000 FUN_b706(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if ((char)DAT_60c2 != '\0') {
    DAT_60c2._1_1_ = (char)DAT_60c2 + -1;
  }
  FUN_b65b();
  FUN_b6e6();
  return uStack_2;
}


// ===== FUN_b71a @ b71a =====

undefined1 __h3000 FUN_b71a(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B731 "(  ---~  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_b731 @ b731 =====

undefined2 __h3000 FUN_b731(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if ((char)DAT_60c2 != '\x0e') {
    DAT_60c2._1_1_ = (char)DAT_60c2 + '\x01';
  }
  FUN_b65b();
  FUN_b6e6();
  return uStack_2;
}


// ===== FUN_b747 @ b747 =====

undefined1 __h3000 FUN_b747(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$B761 "(Save It )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_b6e6();
  return param_2;
}


// ===== FUN_b761 @ b761 =====

/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b761(void)

{
  undefined1 extraout_A;
  undefined2 in_D;
  byte extraout_CC;
  
  API_FDB0();
  DAT_615c = DAT_6162;
  FUN_9d38();
  API_FC82();
  DAT_600c = 0xa0;
  API_FDDE(0,0xf,&DAT_60c6,10);
  API_FDAC(extraout_A,0xa0,0);
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_60da = 0;
    API_FC64();
    API_FDCA();
    return in_D;
  }
  API_FC88();
  LcdPrintInline();
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_b77c @ b77c =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FUN_b77c(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_b7f8 @ b7f8 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b7f8(void)

{
  undefined2 uVar1;
  ushort uVar2;
  byte extraout_CC;
  undefined2 in_stack_00000000;
  
  BankPushSelect();
  uVar1 = API_FC06((char)((ushort)_DAT_0000 >> 8));
  if ((extraout_CC >> 2 & 1) != 0) {
    uVar2 = API_FD9E((char)((ushort)uVar1 >> 8),(char)uVar1,5);
    if ((uVar2 & 1) != 0) {
      if (DAT_607d == DAT_0002) {
        BankPop();
        return in_stack_00000000;
      }
    }
  }
  BankPop();
  return in_stack_00000000;
}


// ===== FUN_b82e @ b82e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000
FUN_b82e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  undefined2 *puVar3;
  undefined1 uStack_6;
  undefined1 uStack_5;
  undefined2 uStack_4;
  undefined2 uStack_2;
  
  puVar3 = (undefined2 *)&uStack_6;
  uStack_5 = param_2;
  uStack_4 = param_3;
  uStack_2 = param_4;
  FUN_b7f8();
  if ((extraout_CC >> 2 & 1) != 0) {
    BankPushSelect();
    sVar1 = DAT_607a;
    DAT_600c = DAT_6079;
    uVar2 = API_FDDE((char)((ushort)DAT_607d >> 8),(char)DAT_607d,0);
    API_FCA0((char)((ushort)uVar2 >> 8),(char)uVar2,sVar1 + 5);
    API_FCA2();
    BankPop();
    puVar3 = &uStack_2;
  }
  return *puVar3;
}


// ===== FUN_b86b @ b86b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_b86b(void)

{
  undefined1 extraout_A;
  undefined2 in_D;
  
  DAT_60d9 = (undefined1)DAT_6162;
  DAT_60d8 = (undefined1)((ushort)DAT_6162 >> 8);
                    /* inline[API_FC38]: "{2:09}{4:2000}{3:60AA}{2:0E}" */
  LcdPrintInline();
  API_FC3A(extraout_A,0xf,&DAT_60c6);
  return in_D;
}


// ===== FUN_b88e @ b88e =====

void __h3000 FUN_b88e(void)

{
  undefined2 in_D;
  undefined1 *puVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  puVar1 = (undefined1 *)FUN_b8ce();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (puVar1 != &DAT_03e7) {
      do {
        puVar1 = (undefined1 *)FUN_b8ce((char)((ushort)(puVar1 + 1) >> 8));
        if ((extraout_CC_00 >> 2 & 1) == 0) {
          return;
        }
      } while (puVar1 < &DAT_03e7);
    }
    FUN_b8ae((char)((ushort)in_D >> 8));
  }
  return;
}


// ===== FUN_b8ae @ b8ae =====

void __h3000 FUN_b8ae(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte bVar2;
  byte extraout_CC_00;
  
  sVar1 = FUN_b8ce();
  bVar2 = extraout_CC;
  while( true ) {
    if ((bVar2 >> 2 & 1) == 0) {
      return;
    }
    if (sVar1 == 0) break;
    sVar1 = FUN_b8ce((char)((ushort)(sVar1 + -1) >> 8));
    bVar2 = extraout_CC_00;
  }
  FUN_b88e((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_b8ce @ b8ce =====

void __h3000 FUN_b8ce(void)

{
  FUN_9d03();
  return;
}


// ===== API_FCA4 @ b98f =====

void __h3000 API_FCA4(void)

{
                    /* inline[API_FD18]: [$608F]=$8877 [$6091]=$8877 [$6093]=$8877 [$6095]=$8877
                       [$6097]=$8877 */
  StoreWordsInline();
  DAT_6168 = 0;
  DAT_616b = 0;
  DAT_616e = 0;
  DAT_6171 = 0;
  DAT_6174 = 0;
  DAT_6177 = 0;
  DAT_617a = 0;
  DAT_617d = 0;
  DAT_6180 = 0;
  DAT_6183 = 0;
  return;
}


// ===== API_FCA6 @ b9c7 =====

undefined2 __h3000 API_FCA6(void)

{
  byte bVar1;
  undefined1 uVar2;
  undefined2 in_D;
  ushort uVar3;
  ushort uVar4;
  ushort uVar5;
  ushort uVar6;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined1 extraout_B_03;
  undefined2 local_7;
  ushort uVar7;
  
  bVar1 = DAT_6165;
  uVar3 = (ushort)DAT_6165;
  DAT_6165 = 0;
  local_7 = (ushort)bVar1;
  if (DAT_6168 != '\0') {
    uVar3 = DAT_6166 - local_7;
    if (local_7 <= DAT_6166 || (short)DAT_6166 < (short)local_7) {
      DAT_6168 = '\0';
    }
  }
  uVar4 = uVar3;
  if (DAT_616b != '\0') {
    uVar4 = DAT_6169 - local_7;
    if (local_7 <= DAT_6169 || (short)DAT_6169 < (short)local_7) {
      DAT_616b = '\0';
    }
  }
  uVar5 = uVar4;
  if (DAT_616e != '\0') {
    uVar5 = DAT_616c - local_7;
    if (local_7 <= DAT_616c || (short)DAT_616c < (short)local_7) {
      DAT_616e = '\0';
    }
  }
  uVar6 = uVar5;
  if (DAT_6171 != '\0') {
    uVar6 = DAT_616f - local_7;
    if (local_7 <= DAT_616f || (short)DAT_616f < (short)local_7) {
      DAT_6171 = '\0';
    }
  }
  uVar7 = uVar6;
  if (DAT_6174 != '\0') {
    uVar7 = DAT_6172 - local_7;
    if (local_7 <= DAT_6172 || (short)DAT_6172 < (short)local_7) {
      DAT_6174 = '\0';
    }
  }
  DAT_6166 = uVar3;
  DAT_6169 = uVar4;
  DAT_616c = uVar5;
  DAT_616f = uVar6;
  DAT_6172 = uVar7;
  if (DAT_6177 != '\0') {
    uVar7 = DAT_6175 - local_7;
    if (local_7 <= DAT_6175 || (short)DAT_6175 < (short)local_7) {
      DAT_6177 = '\0';
      uVar2 = (*DAT_608f)();
      uVar7 = CONCAT11(uVar2,extraout_B);
    }
  }
  DAT_6175 = uVar7;
  if (DAT_617a != '\0') {
    uVar7 = DAT_6178 - local_7;
    if (local_7 <= DAT_6178 || (short)DAT_6178 < (short)local_7) {
      DAT_617a = '\0';
      uVar2 = (*DAT_6091)();
      uVar7 = CONCAT11(uVar2,extraout_B_00);
    }
  }
  DAT_6178 = uVar7;
  if (DAT_617d != '\0') {
    uVar7 = DAT_617b - local_7;
    if (local_7 <= DAT_617b || (short)DAT_617b < (short)local_7) {
      DAT_617d = '\0';
      uVar2 = (*DAT_6093)();
      uVar7 = CONCAT11(uVar2,extraout_B_01);
    }
  }
  DAT_617b = uVar7;
  if (DAT_6180 != '\0') {
    uVar7 = DAT_617e - local_7;
    if (local_7 <= DAT_617e || (short)DAT_617e < (short)local_7) {
      DAT_6180 = '\0';
      uVar2 = (*DAT_6095)();
      uVar7 = CONCAT11(uVar2,extraout_B_02);
    }
  }
  DAT_617e = uVar7;
  if (DAT_6183 != '\0') {
    uVar7 = DAT_6181 - local_7;
    if (local_7 <= DAT_6181 || (short)DAT_6181 < (short)local_7) {
      DAT_6183 = '\0';
      uVar2 = (*DAT_6097)();
      uVar7 = CONCAT11(uVar2,extraout_B_03);
    }
  }
  DAT_6181 = uVar7;
  return in_D;
}


// ===== API_FCA8 @ baa0 =====

void __h3000 API_FCA8(void)

{
  undefined2 in_D;
  
  DAT_6166 = in_D;
  DAT_6168 = 1;
  return;
}


// ===== API_FCAA @ baaa =====

void __h3000 API_FCAA(void)

{
  API_FCA6();
  return;
}


// ===== API_FCAC @ bab1 =====

void __h3000 API_FCAC(void)

{
  undefined2 in_D;
  
  DAT_6169 = in_D;
  DAT_616b = 1;
  return;
}


// ===== API_FCAE @ babb =====

void __h3000 API_FCAE(void)

{
  API_FCA6();
  return;
}


// ===== API_FCB0 @ bac2 =====

void __h3000 API_FCB0(void)

{
  undefined2 in_D;
  
  DAT_616c = in_D;
  DAT_616e = 1;
  return;
}


// ===== API_FCB2 @ bacc =====

void __h3000 API_FCB2(void)

{
  API_FCA6();
  return;
}


// ===== API_FCB4 @ bad3 =====

void __h3000 API_FCB4(void)

{
  undefined2 in_D;
  
  DAT_616f = in_D;
  DAT_6171 = 1;
  return;
}


// ===== API_FCB6 @ badd =====

void __h3000 API_FCB6(void)

{
  API_FCA6();
  return;
}


// ===== API_FCB8 @ bae4 =====

void __h3000 API_FCB8(void)

{
  undefined2 in_D;
  
  DAT_6172 = in_D;
  DAT_6174 = 1;
  return;
}


// ===== API_FCBA @ baee =====

void __h3000 API_FCBA(void)

{
  API_FCA6();
  return;
}


// ===== API_FCBC @ baf5 =====

void __h3000 API_FCBC(void)

{
  undefined2 in_D;
  
  DAT_6175 = in_D;
  DAT_6177 = 1;
  return;
}


// ===== API_FCBE @ baff =====

void __h3000 API_FCBE(void)

{
  undefined2 in_D;
  
  DAT_6178 = in_D;
  DAT_617a = 1;
  return;
}


// ===== API_FCC0 @ bb09 =====

void __h3000 API_FCC0(void)

{
  undefined2 in_D;
  
  DAT_617b = in_D;
  DAT_617d = 1;
  return;
}


// ===== API_FCC2 @ bb13 =====

void __h3000 API_FCC2(void)

{
  undefined2 in_D;
  
  DAT_617e = in_D;
  DAT_6180 = 1;
  return;
}


// ===== API_FCC4 @ bb1d =====

void __h3000 API_FCC4(void)

{
  undefined2 in_D;
  
  DAT_6181 = in_D;
  DAT_6183 = 1;
  return;
}


// ===== API_FCC8 @ bb27 =====

undefined2 __h3000 API_FCC8(void)

{
  undefined2 in_D;
  short *in_U;
  
  if (*(char *)in_U < '\0') {
    *in_U = -*in_U;
  }
  return in_D;
}


// ===== API_FCCA @ bb38 =====

undefined2 __h3000 API_FCCA(void)

{
  undefined2 in_D;
  short *in_U;
  
  *in_U = *in_U + 1;
  return in_D;
}


// ===== API_FCCC @ bb44 =====

undefined2 __h3000 API_FCCC(void)

{
  undefined2 in_D;
  short *in_U;
  
  *in_U = *in_U + -1;
  return in_D;
}


// ===== API_FCCE @ bb50 =====

undefined2 __h3000
API_FCCE(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  param_5[2] = *param_5 ^ param_5[2];
  param_5[3] = param_5[1] ^ param_5[3];
  return uStack_2;
}


// ===== API_FCD0 @ bb5f =====

undefined2 __h3000
API_FCD0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  param_5[2] = *param_5 & param_5[2];
  param_5[3] = param_5[1] & param_5[3];
  return uStack_2;
}


// ===== API_FCD2 @ bb6e =====

undefined2 __h3000
API_FCD2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,byte *param_5)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  param_5[2] = *param_5 | param_5[2];
  param_5[3] = param_5[1] | param_5[3];
  return uStack_2;
}


// ===== API_FCD4 @ bb7d =====

void __h3000 API_FCD4(void)

{
  short *in_U;
  
  if (*in_U < in_U[1]) {
    in_U[1] = *in_U;
  }
  return;
}


// ===== API_FCD6 @ bb8a =====

void __h3000 API_FCD6(void)

{
  short *in_U;
  
  if (in_U[1] < *in_U) {
    in_U[1] = *in_U;
  }
  return;
}


// ===== API_FCD8 @ bb97 =====

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


// ===== API_FCDA @ bbac =====

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


// ===== API_FCDC @ bbc1 =====

void __h3000 API_FCDC(void)

{
  byte bVar1;
  byte bVar2;
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
  return;
}


// ===== API_FCDE @ bbf2 =====

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


// ===== API_FCE0 @ bc1b =====

undefined2 __h3000 API_FCE0(void)

{
  undefined2 in_D;
  short *in_U;
  
  *in_U = -*in_U;
  return in_D;
}


// ===== API_FCE2 @ bc26 =====

undefined2 __h3000 API_FCE2(void)

{
  undefined2 in_D;
  short *in_U;
  
  in_U[1] = *in_U + in_U[1];
  return in_D;
}


// ===== API_FCE4 @ bc31 =====

undefined2 __h3000 API_FCE4(void)

{
  undefined2 in_D;
  short *in_U;
  
  in_U[1] = in_U[1] - *in_U;
  return in_D;
}


// ===== API_FCE6 @ bc3e =====

void __h3000 API_FCE6(void)

{
  FUN_bc4e();
  return;
}


// ===== API_FCE8 @ bc43 =====

undefined2 __h3000 API_FCE8(void)

{
  undefined2 in_D;
  undefined2 *in_U;
  
  FUN_bc4e();
  in_U[1] = *in_U;
  return in_D;
}


// ===== FUN_bc4e @ bc4e =====

void __h3000 FUN_bc4e(void)

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
  
  DAT_6188 = 0;
  API_FCC8();
  if ((extraout_CC >> 3 & 1) != 0) {
    DAT_6188 = ~DAT_6188;
  }
  DAT_6184 = *in_U;
  in_U = in_U + 1;
  API_FCC8();
  if ((extraout_CC_00 >> 3 & 1) != 0) {
    DAT_6188 = ~DAT_6188;
  }
  DAT_6186 = *in_U;
  uVar4 = 0;
  sVar7 = 0x10;
  bVar6 = false;
  do {
    bVar3 = (byte)DAT_6186;
    bVar1 = (byte)DAT_6186 >> 7;
    DAT_6186._1_1_ = (byte)DAT_6186 << 1 | bVar6;
    bVar2 = DAT_6186._0_1_ >> 7;
    DAT_6186._0_1_ = DAT_6186._0_1_ << 1 | bVar1;
    uVar5 = CONCAT11((char)(uVar4 >> 8) << 1 | (byte)uVar4 >> 7,(byte)uVar4 << 1 | bVar2);
    uVar4 = uVar5;
    if (DAT_6184 <= uVar5) {
      uVar4 = uVar5 - DAT_6184;
    }
    bVar6 = uVar5 < DAT_6184;
    sVar7 = sVar7 + -1;
  } while (sVar7 != 0);
  bVar1 = DAT_6186._0_1_ << 1;
  *(byte *)((short)in_U + 1) = ~((byte)DAT_6186 << 1 | bVar6);
  *(byte *)in_U = ~(bVar1 | (bVar3 & 0x7f) >> 6);
  puVar8 = in_U + -1;
  *puVar8 = uVar4;
  if ((char)DAT_6188 < '\0') {
    *puVar8 = -*puVar8;
    *in_U = -*in_U;
  }
  return;
}


// ===== API_FCEA @ bca4 =====

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
  
  DAT_6184 = *in_U;
  DAT_6186 = in_U[1];
  uVar4 = 0;
  sVar7 = 0x10;
  bVar6 = false;
  do {
    bVar3 = (byte)DAT_6186;
    bVar1 = (byte)DAT_6186 >> 7;
    DAT_6186._1_1_ = (byte)DAT_6186 << 1 | bVar6;
    bVar2 = DAT_6186._0_1_ >> 7;
    DAT_6186._0_1_ = DAT_6186._0_1_ << 1 | bVar1;
    uVar5 = CONCAT11((char)(uVar4 >> 8) << 1 | (byte)uVar4 >> 7,(byte)uVar4 << 1 | bVar2);
    uVar4 = uVar5;
    if (DAT_6184 <= uVar5) {
      uVar4 = uVar5 - DAT_6184;
    }
    bVar6 = uVar5 < DAT_6184;
    sVar7 = sVar7 + -1;
  } while (sVar7 != 0);
  bVar1 = (byte)DAT_6186 << 1;
  bVar2 = DAT_6186._0_1_ << 1;
  in_U[1] = uVar4;
  *(byte *)((short)in_U + 1) = ~(bVar1 | bVar6);
  *(byte *)in_U = ~(bVar2 | (bVar3 & 0x7f) >> 6);
  return in_D;
}


// ===== API_FCEC @ bcda =====

void __h3000 API_FCEC(void)

{
  API_FDE4();
  return;
}


// ===== API_FCEE @ bce0 =====

void __h3000 API_FCEE(void)

{
  API_FCF0();
  return;
}


// ===== API_FCF0 @ bce5 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 API_FCF0(void)

{
  ushort uVar1;
  undefined2 in_D;
  ushort uVar2;
  byte *in_U;
  
  uVar2 = (ushort)in_U[1] * (ushort)in_U[3];
  _DAT_6184 = (uint)uVar2;
  uVar1 = (ushort)*in_U * (ushort)in_U[3] + (uVar2 >> 8);
  if (CARRY2((ushort)*in_U * (ushort)in_U[3],uVar2 >> 8)) {
    RAM0x6185 = (uint3)uVar2;
    _DAT_6184 = CONCAT13(1,RAM0x6185);
  }
  if (CARRY2((ushort)in_U[1] * (ushort)in_U[2],uVar1)) {
    DAT_6184._0_1_ = DAT_6184._0_1_ + '\x01';
  }
  RAM0x6185 = CONCAT21((ushort)in_U[1] * (ushort)in_U[2] + uVar1,(undefined1)DAT_6186);
  *(ushort *)in_U = (ushort)*in_U * (ushort)in_U[2] + DAT_6184;
  *(undefined2 *)(in_U + 2) = DAT_6186;
  return in_D;
}


// ===== API_FCF2 @ bd2a =====

undefined2 __h3000 API_FCF2(void)

{
  ushort uVar1;
  undefined2 in_D;
  short sVar2;
  short *in_U;
  
  API_FDE4();
  DAT_6184 = *in_U;
  sVar2 = DAT_6184;
  if (*(char *)in_U < '\0') {
    if (0x7fff < (ushort)in_U[1]) {
      sVar2 = DAT_6184 + -1;
    }
  }
  else {
    uVar1 = in_U[1];
    if (uVar1 < 0x4000 == (uVar1 == 0x4000)) {
      sVar2 = DAT_6184 + 1;
    }
  }
  *(char *)((short)in_U + 3) = (char)sVar2;
  *(char *)(in_U + 1) = (char)((ushort)sVar2 >> 8);
  return in_D;
}


// ===== API_FDE4 @ bd5d =====

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
  
  DAT_6188 = 0;
  API_FCC8();
  if ((extraout_CC >> 3 & 1) != 0) {
    DAT_6188 = ~DAT_6188;
  }
  DAT_6184 = *in_U;
  in_U = in_U + 1;
  API_FCC8();
  if ((extraout_CC_00 >> 3 & 1) != 0) {
    DAT_6188 = ~DAT_6188;
  }
  DAT_6186 = *in_U;
  puVar1 = in_U + -1;
  *(byte *)puVar1 = 0;
  *(undefined1 *)((short)in_U + -1) = 0;
  *in_U = (DAT_6184 & 0xff) * (DAT_6186 & 0xff);
  uVar4 = (DAT_6184 >> 8) * (DAT_6186 & 0xff);
  uVar2 = *(ushort *)((short)in_U + -1);
  *(ushort *)((short)in_U + -1) = uVar4 + uVar2;
  if (CARRY2(uVar4,uVar2)) {
    *(byte *)puVar1 = *(byte *)puVar1 + 1;
  }
  uVar4 = (DAT_6184 & 0xff) * (DAT_6186 >> 8);
  uVar2 = *(ushort *)((short)in_U + -1);
  *(ushort *)((short)in_U + -1) = uVar4 + uVar2;
  if (CARRY2(uVar4,uVar2)) {
    *(byte *)puVar1 = *(byte *)puVar1 + 1;
  }
  *puVar1 = (DAT_6184 >> 8) * (DAT_6186 >> 8) + *puVar1;
  bVar5 = (byte)*(undefined2 *)((short)in_U + -1);
  bVar3 = (byte)((ushort)*(undefined2 *)((short)in_U + -1) >> 8);
  *(byte *)puVar1 = *(byte *)puVar1 << 1 | bVar3 >> 7;
  *(byte *)((short)in_U + -1) = bVar3 << 1 | bVar5 >> 7;
  *(byte *)in_U = bVar5 & 0x7f;
  if ((char)DAT_6188 < '\0') {
    *in_U = -*in_U;
    *puVar1 = -*puVar1;
  }
  return;
}


// ===== API_FCF4 @ bdd1 =====

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
  
  DAT_6188 = 0;
  puVar5 = (ushort *)(in_U + 2);
  sVar4 = *(byte *)(in_U + 1) + 0x10;
  API_FCC8();
  if ((extraout_CC >> 3 & 1) != 0) {
    DAT_6188 = ~DAT_6188;
  }
  DAT_6184 = *puVar5;
  uVar3 = 0;
  do {
    uVar2 = uVar3;
    if (DAT_6184 <= uVar3) {
      uVar2 = uVar3 - DAT_6184;
    }
    bVar1 = (byte)DAT_6186 >> 7;
    DAT_6186._1_1_ = (byte)DAT_6186 << 1 | uVar3 < DAT_6184;
    DAT_6186._0_1_ = DAT_6186._0_1_ << 1 | bVar1;
    uVar3 = CONCAT11((char)(uVar2 >> 8) << 1 | (byte)uVar2 >> 7,(byte)uVar2 << 1) | 1;
    sVar4 = sVar4 + -1;
  } while (sVar4 != 0);
  uVar3 = CONCAT11(~DAT_6186._0_1_,~(byte)DAT_6186) & 0x7fff;
  if (DAT_6188 != 0) {
    uVar3 = CONCAT11(~(byte)(uVar3 >> 8),~(byte)uVar3) + 1;
  }
  *(char *)((short)puVar5 + 1) = (char)uVar3;
  *(char *)puVar5 = (char)(uVar3 >> 8);
  return in_D;
}


// ===== API_FCF6 @ be18 =====

void __h3000 API_FCF6(void)

{
  byte bVar1;
  byte bVar2;
  
  bVar1 = DAT_6189._0_1_ >> 7;
  DAT_6189._0_1_ = DAT_6189._0_1_ << 1 | (DAT_618b >> 3 ^ DAT_618b) & 1;
  bVar2 = (byte)DAT_6189 >> 7;
  DAT_6189._1_1_ = (byte)DAT_6189 << 1 | bVar1;
  DAT_618b = DAT_618b << 1 | bVar2;
  return;
}


// ===== API_FCF8 @ be30 =====

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
  uVar5 = DAT_6189;
  if (uVar3 != 0) {
    if ((short)uVar3 < 0) {
      uVar3 = CONCAT11(~(byte)(uVar3 >> 8),~(byte)uVar3) + 1;
      cVar1 = -1;
    }
    if (uVar3 == 1) {
      uVar5 = DAT_6189 >> 8 & 1;
    }
    else {
      if (uVar3 < 0x7fff) {
        uVar3 = uVar3 + 1;
      }
      cVar2 = (char)(uVar3 >> 8);
      if (cVar2 == '\0') {
        sVar4 = (DAT_6189 & 0xff) * (uVar3 & 0xff);
        bVar6 = (byte)((ushort)sVar4 >> 8);
        if (0x7f < (byte)sVar4) {
          bVar6 = bVar6 + 1;
        }
        uVar5 = (ushort)bVar6;
      }
      else {
        *(char *)((short)in_U + 1) = (char)uVar3;
        *(char *)in_U = cVar2;
        uVar3 = DAT_6189 & 0x7fff;
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


// ===== API_FCFA @ be8f =====

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


// ===== API_FCFC @ be9c =====

undefined2 __h3000 API_FCFC(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *in_U;
  
  uVar1 = in_U[1];
  in_U[1] = in_D;
  *in_U = uVar1;
  return in_D;
}


// ===== API_FCC6 @ bea7 =====

undefined2 __h3000 API_FCC6(void)

{
  undefined2 in_D;
  undefined2 *in_U;
  
  *(char *)((short)in_U + -1) = (char)*in_U;
  *(char *)(in_U + -1) = (char)((ushort)*in_U >> 8);
  return in_D;
}


// ===== InterpTableLookup @ beb0 =====

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
  FUN_bf00();
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


// ===== FUN_bf00 @ bf00 =====

void __h3000 FUN_bf00(undefined1 param_1,char param_2)

{
  undefined1 local_1;
  
  for (local_1 = param_2; local_1 != '\0'; local_1 = local_1 + -1) {
  }
  return;
}


// ===== API_FD04 @ bf12 =====

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


// ===== API_FD06 @ bf25 =====

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


// ===== API_FD08 @ bf3c =====

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


// ===== API_FD0A @ bf4d =====

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


// ===== MemsetInline @ bf5c =====

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


// ===== API_FD0E @ bf6f =====

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


// ===== API_FD10 @ bf87 =====

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


// ===== API_FD12 @ bfa8 =====

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


// ===== FUN_bfc9 @ bfc9 =====

short __h3000 FUN_bfc9(undefined1 *param_1,undefined1 *param_2)

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


// ===== JumpTableDispatch @ bfe0 =====

/* Kernel API slot $FD14: D = index into inline table of code pointers (never returns here) */

undefined2 __h3000 JumpTableDispatch(void)

{
  undefined2 in_D;
  
  return in_D;
}


// ===== SwitchInline @ bff0 =====

/* Kernel API slot $FD16: inline (value, target)* list, compared with D */

short __h3000 SwitchInline(void)

{
  short in_D;
  short *psVar1;
  short *local_res0;
  
  do {
    psVar1 = local_res0 + 1;
    if (in_D == *local_res0) {
      return in_D;
    }
    local_res0 = local_res0 + 2;
  } while (*psVar1 != -1);
  return in_D;
}


// ===== StoreWordsInline @ c015 =====

/* Kernel API slot $FD18: inline ([addr] = word)* until $FFFF */

undefined2 __h3000 StoreWordsInline(void)

{
  short *psVar1;
  undefined2 in_D;
  short *psVar2;
  short *local_res0;
  
  while( true ) {
    psVar2 = local_res0 + 1;
    psVar1 = (short *)*local_res0;
    if (psVar1 == (short *)0xffff) break;
    local_res0 = local_res0 + 2;
    *psVar1 = *psVar2;
  }
  return in_D;
}


// ===== StoreBytesInline @ c02d =====

/* Kernel API slot $FD1A: inline ([addr] = byte)* until $FFFF */

undefined2 __h3000 StoreBytesInline(undefined1 param_1,undefined1 param_2)

{
  undefined1 *puVar1;
  undefined2 *puVar2;
  undefined2 *local_res0;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  while( true ) {
    puVar2 = local_res0 + 1;
    puVar1 = (undefined1 *)*local_res0;
    if (puVar1 == (undefined1 *)((short)&VEC_RESET + 1)) break;
    local_res0 = (undefined2 *)((short)local_res0 + 3);
    *puVar1 = *(undefined1 *)puVar2;
  }
  return uStack_6;
}


// ===== API_FD1C @ c045 =====

undefined2 __h3000 API_FD1C(undefined2 *param_1,undefined2 *param_2)

{
  char cVar1;
  undefined2 *puVar2;
  undefined2 in_D;
  char *pcVar3;
  
  while( true ) {
    pcVar3 = (char *)(param_1 + 1);
    puVar2 = (undefined2 *)*param_1;
    if (puVar2 == (undefined2 *)((short)&VEC_RESET + 1)) break;
    param_1 = (undefined2 *)((short)param_1 + 3);
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
  return in_D;
}


// ===== API_FD1E @ c074 =====

undefined2 __h3000 API_FD1E(undefined2 *param_1,undefined2 *param_2)

{
  char cVar1;
  undefined2 *puVar2;
  undefined2 in_D;
  char *pcVar3;
  
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
  return in_D;
}


// ===== API_FD20 @ c0a3 =====

void __h3000 API_FD20(void)

{
  short in_D;
  
  do {
    in_D = in_D + -1;
  } while (in_D != 0);
  return;
}


// ===== API_FD22 @ c0af =====

undefined2 __h3000 API_FD22(void)

{
  undefined2 in_D;
  
  DAT_618c = 0x6300;
  return in_D;
}


// ===== API_FD24 @ c0ba =====

void __h3000 API_FD24(undefined1 param_1,undefined1 param_2)

{
  *(undefined1 *)((short)DAT_618c + -1) = param_2;
  DAT_618c = (undefined1 *)((short)DAT_618c + -1);
  return;
}


// ===== API_FD26 @ c0c7 =====

undefined1 __h3000 API_FD26(void)

{
  undefined1 uVar1;
  
  uVar1 = *DAT_618c;
  DAT_618c = DAT_618c + 1;
  return uVar1;
}


// ===== API_FD8E @ c0d4 =====

undefined2 __h3000 API_FD8E(undefined1 param_1,undefined1 param_2)

{
  undefined2 *local_res0;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  *(short *)*local_res0 = (short)((short *)*local_res0 + 1);
  return uStack_6;
}


// ===== API_FD90 @ c0e4 =====

undefined2 __h3000 API_FD90(void)

{
  short *psVar1;
  undefined2 *puVar2;
  undefined2 in_D;
  undefined2 *local_res0;
  
  psVar1 = (short *)*local_res0;
  puVar2 = (undefined2 *)*psVar1;
  *puVar2 = in_D;
  *psVar1 = (short)(puVar2 + 1);
  return in_D;
}


// ===== API_FD92 @ c0f6 =====

void __h3000 API_FD92(void)

{
  short *psVar1;
  undefined2 *local_res0;
  
  psVar1 = (short *)*local_res0;
  if (local_res0 + 1 != (undefined2 *)*psVar1) {
    *psVar1 = *psVar1 + -2;
  }
  return;
}


// ===== API_FD28 @ c112 =====

void __h3000 API_FD28(void)

{
  short in_D;
  
  do {
    in_D = in_D + -1;
  } while (in_D != 0);
  return;
}


// ===== ClampMaxInline @ c122 =====

/* Kernel API slot $FE0C: D = min(D, inline word) */

void __h3000 ClampMaxInline(void)

{
  return;
}


// ===== FUN_c13c @ c13c =====

undefined2 __h3000 FUN_c13c(void)

{
  byte bVar1;
  undefined2 in_D;
  byte *pbVar2;
  undefined2 *local_res0;
  
  pbVar2 = (byte *)*local_res0;
  if (*(char *)(local_res0 + 1) != '\x01') {
    do {
      bVar1 = *pbVar2;
      if (pbVar2[1] <= bVar1) {
        *pbVar2 = pbVar2[1];
        pbVar2[1] = bVar1;
      }
      pbVar2 = pbVar2 + 1;
    } while( true );
  }
  return in_D;
}


// ===== FUN_c171 @ c171 =====

void __h3000 FUN_c171(undefined1 param_1,char param_2,undefined2 param_3,byte *param_4)

{
  byte extraout_B;
  byte bVar1;
  byte *pbVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  pbVar2 = param_4;
  FUN_c184();
  if (param_2 == '\0') {
    bVar1 = ~extraout_B & *pbVar2;
  }
  else {
    bVar1 = extraout_B | *pbVar2;
  }
  *pbVar2 = bVar1;
                    /* WARNING: Could not recover jumptable at 0xc182. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_c184 @ c184 =====

ushort __h3000 FUN_c184(void)

{
  byte in_stack_00000005;
  
  return CONCAT11(in_stack_00000005,(&DAT_c19f)[(char)(in_stack_00000005 & 7)]) & 0x7ff;
}


// ===== FUN_c1a7 @ c1a7 =====

short __h3000 FUN_c1a7(byte param_1,undefined1 param_2,undefined2 param_3,byte *param_4)

{
  byte extraout_B;
  
  FUN_c184();
  if ((extraout_B & *param_4) == 0) {
    return (ushort)param_1 << 8;
  }
  return CONCAT11(param_1,0xff);
}


// ===== API_FD2A @ c1b8 =====

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


// ===== API_FD2C @ c1e4 =====

void __h3000 API_FD2C(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_8053;
  return;
}


// ===== API_FD2E @ c1f0 =====

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
  _DAT_0000 = DAT_618e;
  bVar2 = (byte)((ushort)in_Y >> 8);
  BANK_LATCH = bVar2 >> 4 | 0x80;
  DAT_618e = in_D;
  *(undefined2 *)CONCAT11((bVar2 & 0xf) << 1 | (byte)in_Y >> 7,(byte)in_Y << 1) = in_D;
  BANK_LATCH = g_curBank;
  return in_D;
}


// ===== DspLoadProgram @ c23f =====

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
        FUN_c2e5((char)(DAT_607d >> 8),(char)DAT_607d,DAT_607a);
        uVar2 = FUN_c317();
        return uVar2;
      }
      uVar1 = uVar1 & 0xfffe;
      FUN_c2e5((char)(uVar1 >> 8),(char)uVar1,DAT_607a);
      DAT_607d = DAT_607d - uVar1;
      DAT_607a = DAT_607a + uVar1;
      FUN_c2c6();
    } while ((((extraout_CC_03 >> 2 & 1) != 0) && (FUN_c2c6(), (extraout_CC_04 >> 2 & 1) != 0)) &&
            ((FUN_c2c6(), (extraout_CC_05 >> 2 & 1) != 0 &&
             ((FUN_c2c6(), (extraout_CC_06 >> 2 & 1) != 0 &&
              (FUN_c2c6(), (extraout_CC_07 >> 2 & 1) != 0))))));
    BankPop();
    return param_4;
  }
  BankPop();
  return param_4;
}


// ===== FUN_c2c6 @ c2c6 =====

void __h3000 FUN_c2c6(void)

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


// ===== FUN_c2e5 @ c2e5 =====

undefined2 * __h3000 FUN_c2e5(undefined2 *param_1,undefined2 *param_2)

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


// ===== FUN_c317 @ c317 =====

undefined2 __h3000 FUN_c317(void)

{
  undefined2 in_stack_00000004;
  
  BankPop();
  return in_stack_00000004;
}


// ===== API_FD32 @ c32b =====

void __h3000 API_FD32(void)

{
  API_FD7A();
  API_FD2A();
  API_FD78();
  return;
}


// ===== API_FD34 @ c337 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD34(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FD7A();
  API_FD2A(0,0,param_1,0);
  API_FD78();
  return in_D;
}


// ===== API_FD36 @ c34c =====

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


// ===== StoreWordsInline2 @ c35e =====

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


// ===== API_FD3A @ c376 =====

void __h3000 API_FD3A(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8002);
  return;
}


// ===== API_FD3C @ c380 =====

void __h3000 API_FD3C(void)

{
  API_FDE0();
  return;
}


// ===== API_FD3E @ c38b =====

void __h3000 API_FD3E(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8004);
  return;
}


// ===== API_FD40 @ c395 =====

void __h3000 API_FD40(void)

{
  API_FDE0();
  return;
}


// ===== API_FD42 @ c3a0 =====

void __h3000 API_FD42(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8006);
  return;
}


// ===== API_FD44 @ c3aa =====

void __h3000 API_FD44(void)

{
  API_FDE0();
  return;
}


// ===== API_FD46 @ c3b5 =====

void __h3000 API_FD46(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,&UNK_8008);
  return;
}


// ===== API_FD48 @ c3bf =====

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


// ===== API_FD4A @ c3c5 =====

void __h3000 API_FD4A(undefined1 param_1,undefined1 param_2)

{
  API_FD4E(param_1,param_2,0x8000);
  return;
}


// ===== API_FD4C @ c3cf =====

void __h3000 API_FD4C(void)

{
  API_FDE0();
  return;
}


// ===== API_FD4E @ c3da =====

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
      goto LAB_c3f3;
    }
    sVar3 = sVar3 + -1;
  } while (sVar3 != 0);
  goto LAB_c3fe;
  while (sVar3 = sVar3 + -1, sVar3 != 0) {
LAB_c3f3:
    bVar2 = DAT_8053;
    if ((bVar2 & 0x20) == 0) break;
  }
LAB_c3fe:
  uVar1 = DAT_8050;
  return uVar1;
}


// ===== API_FDE0 @ c404 =====

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


// ===== API_FD50 @ c421 =====

undefined2 __h3000 API_FD50(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FDE0(0,param_2,param_3,0x8000);
  return uStack_4;
}


// ===== API_FD52 @ c42e =====

void __h3000 API_FD52(byte param_1)

{
  FUN_c43c(param_1 & 0xf | 0x20);
  return;
}


// ===== API_FD54 @ c436 =====

undefined2 __h3000 API_FD54(byte param_1,undefined1 param_2,undefined2 param_3)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FDE0(param_1 & 0xf | 0x30,param_2,param_3,0x8000);
  return uStack_4;
}


// ===== FUN_c43c @ c43c =====

undefined2 __h3000 FUN_c43c(void)

{
  undefined2 in_stack_00000000;
  
  API_FDE0();
  return in_stack_00000000;
}


// ===== API_FD56 @ c445 =====

void __h3000 API_FD56(void)

{
  FUN_c43c(0x98);
  return;
}


// ===== API_FD58 @ c44c =====

void __h3000 API_FD58(void)

{
  FUN_c43c(0x98);
  return;
}


// ===== API_FD5A @ c453 =====

void __h3000 API_FD5A(void)

{
  FUN_c43c(0x84);
  return;
}


// ===== API_FD5C @ c45a =====

void __h3000 API_FD5C(void)

{
  FUN_c43c(0x84);
  return;
}


// ===== API_FD5E @ c461 =====

void __h3000 API_FD5E(void)

{
  FUN_c43c(0x88);
  return;
}


// ===== API_FD60 @ c468 =====

void __h3000 API_FD60(void)

{
  FUN_c43c(0x88);
  return;
}


// ===== API_FD62 @ c46f =====

void __h3000 API_FD62(void)

{
  FUN_c43c(0x8c);
  return;
}


// ===== API_FD64 @ c476 =====

void __h3000 API_FD64(void)

{
  FUN_c43c(0x8c);
  return;
}


// ===== API_FD66 @ c47d =====

void __h3000 API_FD66(void)

{
  FUN_c43c(0x90);
  return;
}


// ===== API_FD68 @ c484 =====

void __h3000 API_FD68(void)

{
  FUN_c43c(0x90);
  return;
}


// ===== API_FD6A @ c48b =====

void __h3000 API_FD6A(void)

{
  FUN_c43c(0x94);
  return;
}


// ===== API_FD6C @ c492 =====

void __h3000 API_FD6C(void)

{
  FUN_c43c(0x94);
  return;
}


// ===== API_FD6E @ c499 =====

void __h3000 API_FD6E(void)

{
  FUN_c43c(0x9c);
  return;
}


// ===== API_FD70 @ c4a0 =====

void __h3000 API_FD70(void)

{
  FUN_c43c(0x9c);
  return;
}


// ===== API_FD72 @ c4a7 =====

void __h3000 API_FD72(void)

{
  FUN_c43c(0x80);
  return;
}


// ===== API_FD74 @ c4ae =====

undefined1 __h3000 API_FD74(void)

{
  undefined1 uVar1;
  
  uVar1 = DAT_8053;
  return uVar1;
}


// ===== API_FD76 @ c4b2 =====

void __h3000 API_FD76(undefined1 param_1)

{
  DAT_8055 = param_1;
  return;
}


// ===== API_FD78 @ c4b6 =====

undefined2 __h3000 API_FD78(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a2 = 0xff;
  return uStack_2;
}


// ===== API_FD7A @ c4c0 =====

undefined2 __h3000 API_FD7A(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a2 = 0;
  return uStack_2;
}


// ===== API_FD7C @ c4ca =====

undefined2 __h3000 API_FD7C(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a3 = 0;
  return uStack_2;
}


// ===== API_FD7E @ c4d4 =====

undefined2 __h3000 API_FD7E(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_80a3 = 0xff;
  return uStack_2;
}


// ===== FUN_c4fe @ c4fe =====

undefined2 __h3000 FUN_c4fe(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_6191 = g_curBank;
  DAT_6190 = 0xf0;
  API_FC06();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_6190 = 0;
    API_FDD0();
    DAT_6192 = DAT_6079;
    g_curBank = DAT_6079;
    DAT_6102 = DAT_6079;
    BANK_LATCH = DAT_6079;
  }
  API_FDC0(0xc5);
                    /* inline[API_FD18]: [$602A]=$C544 [$6030]=$C54A [$602E]=$C553 [$603A]=$C55C */
  StoreWordsInline();
  return in_D;
}


// ===== FUN_c544 @ c544 =====

void __h3000 FUN_c544(void)

{
  FUN_c565();
  FUN_a263();
  return;
}


// ===== FUN_c54a @ c54a =====

void __h3000 FUN_c54a(void)

{
  FUN_c565();
  API_FDCE();
  FUN_de80();
  return;
}


// ===== FUN_c553 @ c553 =====

void __h3000 FUN_c553(void)

{
  FUN_c565();
  API_FDCE();
  FUN_a7de();
  return;
}


// ===== FUN_c55c @ c55c =====

void __h3000 FUN_c55c(void)

{
  FUN_c565();
  API_FDCE();
  FUN_a619();
  return;
}


// ===== FUN_c565 @ c565 =====

undefined2 __h3000 FUN_c565(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  DAT_6102 = DAT_6191;
  g_curBank = DAT_6191;
  BANK_LATCH = DAT_6191;
  return uStack_2;
}


// ===== FUN_c58e @ c58e =====

undefined1 __h3000 FUN_c58e(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$9C05 "(  More  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_c5a5 @ c5a5 =====

void __h3000 FUN_c5a5(void)

{
                    /* inline[API_FC38]: "{1}Factory Functions; Service People only !" */
  LcdPrintInline();
  return;
}


// ===== FUN_c5d3 @ c5d3 =====

undefined1 __h3000 FUN_c5d3(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$9B8F "(Factory )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_c5ea @ c5ea =====

undefined1 __h3000 FUN_c5ea(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$C601 "(  Info  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_c601 @ c601 =====

void __h3000 FUN_c601(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FE5E]: $C641 $C633 */
  FUN_ef6e(param_1,DAT_6190);
                    /* inline[API_FC38]: "{2:00}{5:28}Operating System Rev 1.53 ,{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xc631. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_c64b @ c64b =====

undefined1 __h3000 FUN_c64b(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$C702 "( Virgin )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_c662 @ c662 =====

undefined1 __h3000 FUN_c662(undefined1 param_1,undefined1 param_2)

{
  if (DAT_6190 == '\0') {
                    /* inline[API_FC8A]: ->$0010 "(Exercise)" */
    SoftKeyDefine(param_1,DAT_60b9);
  }
  return param_2;
}


// ===== FUN_c67e @ c67e =====

undefined1 __h3000 FUN_c67e(undefined1 param_1,undefined1 param_2)

{
  if (DAT_6190 == '\0') {
                    /* inline[API_FC8A]: ->$0985 "(Selftest)" */
    SoftKeyDefine(param_1,DAT_60b9);
  }
  return param_2;
}


// ===== FUN_c69a @ c69a =====

undefined1 __h3000 FUN_c69a(undefined1 param_1,undefined1 param_2)

{
  if (DAT_6190 == '\0') {
                    /* inline[API_FC8A]: ->$0B81 "(Test all)" */
    SoftKeyDefine(param_1,DAT_60b9);
  }
  return param_2;
}


// ===== API_FDFA @ c6b6 =====

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


// ===== FUN_c6d7 @ c6d7 =====

void __h3000 FUN_c6d7(void)

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


// ===== FUN_c6ee @ c6ee =====

undefined2 __h3000 FUN_c6ee(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  API_FC80(param_1,0x5a,&UNK_010b,&UNK_010b);
  API_FC7C();
  return uStack_6;
}


// ===== FUN_c702 @ c702 =====

undefined2 __h3000 FUN_c702(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  API_FC88();
                    /* inline[API_FC38]: "{1}clear all memory, remove all presets ?" */
  LcdPrintInline();
                    /* inline[API_FE3C]: $C73C $C7A4 */
  FUN_a690();
  return uStack_6;
}


// ===== FUN_c73c @ c73c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_c73c(void)

{
  undefined1 uStack0000;
  
  API_FC88();
  BankPushSelect();
  uStack0000 = 0x4b;
                    /* inline[API_FD0C]: $3FFF FF */
  MemsetInline();
  DAT_600c = 0xa0;
  uStack0000 = 0x60;
  API_FDDE(0,0x10,&UNK_887d,0x300);
  uStack0000 = 99;
                    /* inline[API_FD1A]: [$0110]=$00 [$0103]=$00 [$010C]=$80 [$010D]=$00 [$010E]=$00
                       [$0111]=$00 [$0116]=$FF [$0104]=$00 [$0105]=$00 [$0106]=$00 [$0107]=$00
                       [$0112]=$00 [$0113]=$00 [$0114]=$00 [$0115]=$00 [$0117]=$03 */
  StoreBytesInline();
  uStack0000 = 0x9b;
  API_FC66(100);
  DAT_0103 = 0;
  uStack0000 = 0xa1;
  BankPop();
  Reset();
  return;
}


// ===== FUN_c7a4 @ c7a4 =====

undefined2 __h3000 FUN_c7a4(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FC88();
                    /* inline[API_FC38]: "{1}memory still the same {2:28}Press something to escape "
                        */
  LcdPrintInline();
  return uStack_2;
}


// ===== FUN_c7e3 @ c7e3 =====

undefined1 __h3000 FUN_c7e3(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$C7FD "          " */
  SoftKeyDefine(param_1,DAT_60b9);
  DAT_6193 = 0;
  return param_2;
}


// ===== FUN_c7fd @ c7fd =====

void __h3000 FUN_c7fd(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6193 == '\x04') {
                    /* inline[API_FC38]: "{1}This Engineering Effort is Dedicated to Tony Agnello, A
                       Constant Inspiration    " */
    LcdPrintInline();
    FUN_9041();
    API_FDC2();
  }
  else {
    DAT_6193 = DAT_6193 + '\x01';
  }
                    /* WARNING: Could not recover jumptable at 0xc866. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_c868 @ c868 =====

undefined2 __h3000 FUN_c868(undefined1 param_1,undefined1 param_2)

{
  char cVar1;
  char extraout_B;
  byte extraout_CC;
  byte bVar2;
  undefined1 *puVar3;
  short sVar4;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
LAB_c86a:
  do {
    API_FDDA();
    bVar2 = extraout_CC;
    while( true ) {
      if ((bVar2 >> 2 & 1) == 0) {
        FUN_c8c2();
        return uStack_6;
      }
      FUN_ebc1();
      puVar3 = &DAT_6b00;
      if (extraout_B < '\0') break;
      if (DAT_6194 == '\0') {
        cVar1 = '\x03';
        goto LAB_c88a;
      }
      if (DAT_6194 < '\0') goto LAB_c86a;
                    /* inline[addr:E9B8]: $68A0 */
      FUN_e9b8();
      g_curBank = DAT_6102;
      BANK_LATCH = DAT_6102;
      bVar2 = (DAT_6102 == '\0') << 2;
    }
    if (extraout_B == -0x10) {
      if (DAT_6161 == '\0') {
        DAT_6194 = -1;
      }
      else {
        DAT_6194 = '\x01';
      }
    }
    else {
      DAT_6194 = '\0';
      cVar1 = '\x01';
LAB_c88a:
      sVar4 = 0x10;
      do {
        cVar1 = (**(code **)(puVar3 + cVar1))();
        puVar3 = puVar3 + 0x28;
        sVar4 = sVar4 + -1;
      } while (sVar4 != 0);
    }
  } while( true );
}


// ===== FUN_c8c2 @ c8c2 =====

undefined2 __h3000 FUN_c8c2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_60fc != '\0') {
    FUN_d928();
    FUN_c8d2();
  }
  return uStack_2;
}


// ===== FUN_c8d2 @ c8d2 =====

undefined2 __h3000 FUN_c8d2(void)

{
  undefined2 in_D;
  undefined1 *puVar1;
  short sVar2;
  
  sVar2 = 0x10;
  puVar1 = &DAT_6b00;
  do {
    if (*(short *)(puVar1 + 0x16) != *(short *)(puVar1 + 0x14)) {
      *(short *)(puVar1 + 0x14) = *(short *)(puVar1 + 0x16);
      (**(code **)(puVar1 + 0x11))();
    }
    puVar1 = puVar1 + 0x28;
    sVar2 = sVar2 + -1;
  } while (sVar2 != 0);
  return in_D;
}


// ===== FUN_c8f9 @ c8f9 =====

undefined2 __h3000 FUN_c8f9(void)

{
  undefined2 in_D;
  short sVar1;
  undefined1 *puVar2;
  
  puVar2 = &DAT_6b00;
  sVar1 = 0x10;
  do {
    *(undefined2 *)(puVar2 + 0x16) = 0;
    puVar2[0x1e] = 0;
    puVar2 = puVar2 + 0x28;
    sVar1 = sVar1 + -1;
  } while (sVar1 != 0);
  FUN_c8d2();
  return in_D;
}


// ===== FUN_c91b @ c91b =====

undefined2 __h3000 FUN_c91b(undefined1 param_1,undefined1 param_2)

{
  char cVar1;
  undefined1 *puVar2;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[API_FD0C]: $0200 00 */
  MemsetInline();
  cVar1 = '\x10';
  puVar2 = &DAT_6b00;
  do {
    *puVar2 = 0;
    *(code **)(puVar2 + 1) = API_FD80;
    *(code **)(puVar2 + 3) = API_FD80;
    *(code **)(puVar2 + 5) = API_FD80;
    *(code **)(puVar2 + 7) = API_FD80;
    puVar2 = puVar2 + 0x28;
    cVar1 = cVar1 + -1;
  } while (cVar1 != '\0');
  FUN_c8f9();
  return uStack_6;
}


// ===== DefineParameter @ c956 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */
/* Kernel API slot $FD84: inline 15-byte record: index, flags, 8-char name, ?, 2 pointers */

undefined2 __h3000 DefineParameter(void)

{
  byte bVar1;
  undefined2 in_D;
  short sVar2;
  short sVar3;
  byte *pbVar4;
  byte *local_res0;
  
  sVar2 = (CONCAT11(0x28,*local_res0) >> 8) * (ushort)*local_res0;
  pbVar4 = local_res0 + 2;
  bVar1 = local_res0[1];
  API_FD04(0,8,pbVar4,sVar2 + 0x6b09);
  (&DAT_6b13)[sVar2] = *pbVar4;
  sVar3 = 0;
  if ((char)bVar1 < '\0') {
    sVar3 = DAT_600d;
  }
  *(short *)((short)&DAT_6b11 + sVar2) = *(short *)(pbVar4 + 1) + sVar3;
  *(short *)((short)&DAT_6b07 + sVar2) = *(short *)(pbVar4 + 3) + sVar3;
  *(code **)((short)&DAT_6b05 + sVar2) = FUN_c9b3;
  (&DAT_6b00)[sVar2] = 1;
  API_FD86();
  return in_D;
}


// ===== FUN_c9b3 @ c9b3 =====

undefined2 __h3000 FUN_c9b3(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_cdb5(param_1,param_2,DAT_6196);
                    /* inline[API_FC8A]: ->$C9CF "( Source )" */
  SoftKeyDefine(extraout_A,1);
  return uStack_6;
}


// ===== FUN_c9cf @ c9cf =====

undefined2 __h3000 FUN_c9cf(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  API_FDD4(param_1,param_2,DAT_6196);
  FUN_dcbe();
  LcdSetCursor(extraout_A,0);
  FUN_dcac();
  FUN_cdb5();
                    /* inline[API_FC8A]: ->$CA11 "( Algorm )" */
  SoftKeyDefine(extraout_A_00,0);
                    /* inline[API_FC8A]: ->$DC0E "(  Done  )" */
  SoftKeyDefine(extraout_A_01,3);
  DAT_60b9 = 0;
  FUN_ca11();
  return uStack_6;
}


// ===== FUN_ca11 @ ca11 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_ca11(void)

{
  undefined2 in_D;
  undefined1 uVar2;
  ushort uVar1;
  
  API_FDF2();
  uVar2 = FUN_e5f0();
  uVar1 = FUN_dba7(0,uVar2,DAT_6196);
  DAT_6074 = uVar1 & 0xff;
                    /* inline[API_FC16]: 01 20 02 96 01 00 03 00 $002B $0000 $0000 ->$8877 ->$CA49
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_ca49();
  return in_D;
}


// ===== FUN_ca49 @ ca49 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_ca49(void)

{
  undefined2 in_D;
  short in_Y;
  
  FUN_dbb8(0,(char)DAT_6074,DAT_6196);
                    /* inline[API_FC8A]: ->$8877 "          " */
  SoftKeyDefine();
                    /* inline[API_FC8A]: ->$8877 "          " */
  SoftKeyDefine();
  FUN_cdb5();
  FUN_db88();
  (**(code **)(in_Y + 0x20))();
  FUN_d406();
  return in_D;
}


// ===== FUN_ca88 @ ca88 =====

undefined2 __h3000 FUN_ca88(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$CA9E "( Channel)" */
  SoftKeyDefine(param_1,2);
  return uStack_2;
}


// ===== FUN_ca9e @ ca9e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_ca9e(void)

{
  undefined2 in_D;
  undefined1 uVar2;
  ushort uVar1;
  
  API_FDF2();
  uVar2 = FUN_e5f0();
  uVar1 = FUN_dba7(1,uVar2,DAT_6196);
  DAT_6074 = uVar1 & 0xff;
                    /* inline[API_FC16]: 01 10 02 64 01 00 03 00 $000F $0000 $0000 ->$CAD3 ->$CADD
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_cad3 @ cad3 =====

void __h3000 FUN_cad3(void)

{
                    /* inline[API_FC38]: "{2:26}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cadd @ cadd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cadd(void)

{
  undefined2 in_D;
  
  FUN_dbb8(1,(char)DAT_6074,DAT_6196);
  FUN_d406();
  return in_D;
}


// ===== FUN_caf0 @ caf0 =====

undefined2 __h3000
FUN_caf0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  byte extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_dba7(1);
  *(byte *)(param_5 + -1) = extraout_B & 0xf;
  *(undefined1 *)(param_5 + -2) = 0;
                    /* inline[API_FC38]: "{2:23}Ch+{4:2000}{3:60AB}" */
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_cb0e @ cb0e =====

undefined2 __h3000 FUN_cb0e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$CB24 "(  Note  )" */
  SoftKeyDefine(param_1,1);
  return uStack_2;
}


// ===== FUN_cb24 @ cb24 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cb24(void)

{
  undefined2 in_D;
  undefined1 uVar2;
  ushort uVar1;
  
  API_FDF2();
  uVar2 = FUN_e5f0();
  uVar1 = FUN_dba7(2,uVar2,DAT_6196);
  DAT_6074 = uVar1 & 0xff;
                    /* inline[API_FC16]: 01 10 02 64 00 00 03 00 $007F $0000 $0000 ->$CB59 ->$CB69
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_cb59 @ cb59 =====

void __h3000 FUN_cb59(void)

{
  FUN_dcdd((char)((ushort)DAT_6074 >> 8));
                    /* inline[API_FC38]: "{2:10}{3:60A5}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cb69 @ cb69 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cb69(void)

{
  undefined2 in_D;
  
  FUN_dbb8(2,(char)DAT_6074,DAT_6196);
  FUN_d406();
  return in_D;
}


// ===== FUN_cb7c @ cb7c =====

undefined2 __h3000 FUN_cb7c(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  byte extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
  FUN_dcdd(extraout_A,extraout_B & 0x7f);
                    /* inline[API_FC38]: "{2:10}{3:60A5}" */
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_cb94 @ cb94 =====

void __h3000 FUN_cb94(void)

{
  FUN_caf0();
  FUN_cb7c();
  return;
}


// ===== FUN_cb9b @ cb9b =====

void __h3000 FUN_cb9b(void)

{
  FUN_ca88();
  FUN_cb0e();
  return;
}


// ===== FUN_cba2 @ cba2 =====

undefined2 __h3000 FUN_cba2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$CBB8 "( PW Sens)" */
  SoftKeyDefine(param_1,1);
  return uStack_2;
}


// ===== FUN_cbb8 @ cbb8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cbb8(void)

{
  undefined2 in_D;
  undefined1 uVar1;
  
  API_FDF2();
  uVar1 = FUN_e5f0();
  FUN_dba7(2,uVar1,DAT_6196);
                    /* inline[API_FE0C]: $00F0 */
  DAT_6074 = ClampMaxInline(0);
                    /* inline[API_FC16]: 01 10 02 1E 01 01 03 00 $00F0 $0000 $0000 ->$CBF2 ->$CB69
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_cbf2 @ cbf2 =====

void __h3000 FUN_cbf2(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:609E}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cbfc @ cbfc =====

undefined2 __h3000
FUN_cbfc(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
                    /* inline[API_FE0C]: $00F0 */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:0100}{3:60A8}" */
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_cc1a @ cc1a =====

void __h3000 FUN_cc1a(void)

{
  FUN_caf0();
  FUN_cbfc();
  return;
}


// ===== FUN_cc21 @ cc21 =====

void __h3000 FUN_cc21(void)

{
  FUN_ca88();
  FUN_cba2();
  return;
}


// ===== FUN_cc28 @ cc28 =====

undefined2 __h3000 FUN_cc28(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$CC3E "( Cntlr. )" */
  SoftKeyDefine(param_1,1);
  return uStack_2;
}


// ===== FUN_cc3e @ cc3e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cc3e(void)

{
  undefined2 in_D;
  undefined1 uVar1;
  
  API_FDF2();
  uVar1 = FUN_e5f0();
  FUN_dba7(2,uVar1,DAT_6196);
                    /* inline[API_FE0C]: $0079 */
  DAT_6074 = ClampMaxInline(0);
                    /* inline[API_FC16]: 01 10 02 32 01 00 03 00 $0079 $0000 $0000 ->$CC78 ->$CB69
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_cc78 @ cc78 =====

void __h3000 FUN_cc78(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cc82 @ cc82 =====

undefined2 __h3000
FUN_cc82(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
                    /* inline[API_FE0C]: $0079 */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}" */
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_cca0 @ cca0 =====

void __h3000 FUN_cca0(void)

{
  FUN_caf0();
  FUN_cc82();
  return;
}


// ===== FUN_cca7 @ cca7 =====

void __h3000 FUN_cca7(void)

{
  FUN_ca88();
  FUN_cc28();
  return;
}


// ===== FUN_ccae @ ccae =====

undefined2 __h3000 FUN_ccae(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$CCC4 "( Cntlr. )" */
  SoftKeyDefine(param_1,1);
  return uStack_2;
}


// ===== FUN_ccc4 @ ccc4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_ccc4(void)

{
  undefined2 in_D;
  undefined1 uVar1;
  
  API_FDF2();
  uVar1 = FUN_e5f0();
  FUN_dba7(2,uVar1,DAT_6196);
                    /* inline[API_FE0C]: $001F */
  DAT_6074 = ClampMaxInline(0);
                    /* inline[API_FC16]: 01 10 02 4B 01 00 03 00 $001F $0000 $0000 ->$CCFE ->$CB69
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_ccfe @ ccfe =====

void __h3000 FUN_ccfe(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cd08 @ cd08 =====

undefined2 __h3000
FUN_cd08(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
                    /* inline[API_FE0C]: $001F */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}" */
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_cd26 @ cd26 =====

void __h3000 FUN_cd26(void)

{
  FUN_caf0();
  FUN_cd08();
  return;
}


// ===== FUN_cd2d @ cd2d =====

void __h3000 FUN_cd2d(void)

{
  FUN_ca88();
  FUN_ccae();
  return;
}


// ===== FUN_cd34 @ cd34 =====

undefined2 __h3000 FUN_cd34(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$CD4A "(Threshld)" */
  SoftKeyDefine(param_1,1);
  return uStack_2;
}


// ===== FUN_cd4a @ cd4a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cd4a(void)

{
  undefined2 in_D;
  undefined1 uVar2;
  ushort uVar1;
  
  API_FDF2();
  uVar2 = FUN_e5f0();
  uVar1 = FUN_dba7(2,uVar2,DAT_6196);
  DAT_6074 = uVar1 & 0xff;
                    /* inline[API_FC16]: 01 10 02 32 01 00 03 00 $007F $0000 $0000 ->$CD7F ->$CB69
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_cd7f @ cd7f =====

void __h3000 FUN_cd7f(void)

{
                    /* inline[API_FC38]: "{2:1D}{3:60A0}" */
  LcdPrintInline();
  return;
}


// ===== FUN_cd89 @ cd89 =====

undefined2 __h3000
FUN_cd89(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
                    /* inline[API_FE0C]: $007F */
  ClampMaxInline(0);
  *(undefined1 *)(param_5 + -1) = extraout_B;
  *(undefined1 *)(param_5 + -2) = extraout_A;
                    /* inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}" */
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_cda7 @ cda7 =====

void __h3000 FUN_cda7(void)

{
  FUN_caf0();
  FUN_cd89();
  return;
}


// ===== FUN_cdae @ cdae =====

void __h3000 FUN_cdae(void)

{
  FUN_ca88();
  FUN_cd34();
  return;
}


// ===== FUN_cdb5 @ cdb5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xcdcf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_cdb5(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  
  FUN_db88();
  LcdSetCursor();
  API_FC3A(0,0x1c,param_2);
  (**(code **)(param_2 + 0x1e))((char)((ushort)in_D >> 8),(char)in_D,param_1);
  return in_D;
}


// ===== FUN_d406 @ d406 =====

undefined2 __h3000 FUN_d406(short param_1,short param_2)

{
  undefined2 in_D;
  
                    /* inline[API_FD0C]: $000E 00 */
  MemsetInline();
  *(code **)(param_1 + 0x1a) = FUN_db7e;
  FUN_db88();
  (**(code **)(param_2 + 0x1c))();
  return in_D;
}


// ===== FUN_d42a @ d42a =====

undefined2 __h3000 FUN_d42a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D436 $0000 */
  FUN_db33();
  return uStack_6;
}


// ===== FUN_d436 @ d436 =====

undefined2 __h3000 FUN_d436(short param_1)

{
  undefined2 in_D;
  char cVar2;
  short sVar1;
  byte extraout_CC;
  
  cVar2 = FUN_db5d();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x20)) {
    do {
      sVar1 = FUN_da98();
      *(short *)(param_1 + 0x16) = (sVar1 + -0x2000) * 2;
    } while( true );
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d453 @ d453 =====

undefined2 __h3000 FUN_d453(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D45F $0000 */
  FUN_db33();
  return uStack_6;
}


// ===== FUN_d45f @ d45f =====

undefined2 __h3000 FUN_d45f(short param_1)

{
  undefined2 in_D;
  char cVar2;
  ushort uVar1;
  byte extraout_CC;
  
  cVar2 = FUN_db5d();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar2 == -0x20)) {
    do {
      uVar1 = FUN_da98();
      if (uVar1 < 0x2000) {
        uVar1 = 0x4000 - uVar1;
      }
      *(ushort *)(param_1 + 0x16) = (uVar1 + 0xe000) * 2;
    } while( true );
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d489 @ d489 =====

undefined2 __h3000 FUN_d489(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D49E $0000 */
  FUN_db33();
  FUN_db0e();
  *(undefined1 *)(param_3 + 0x21) = 0;
  return uStack_2;
}


// ===== FUN_d49e @ d49e =====

undefined2 __h3000 FUN_d49e(short param_1)

{
  undefined2 in_D;
  char cVar2;
  undefined2 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  cVar2 = FUN_db5d();
  if ((extraout_CC >> 2 & 1) == 0) {
    *(code **)(param_1 + 3) = API_FD80;
    return in_D;
  }
  if (cVar2 != -0x20) {
    do {
      do {
        FUN_da13();
        FUN_d9bb();
      } while ((extraout_CC_00 >> 2 & 1) == 0);
      uVar1 = FUN_daeb();
      *(undefined2 *)(param_1 + 0x16) = uVar1;
    } while( true );
  }
  do {
    FUN_da98();
    uVar1 = FUN_dace();
    *(undefined2 *)(param_1 + 0x16) = uVar1;
  } while( true );
}


// ===== FUN_d4cc @ d4cc =====

undefined2 __h3000 FUN_d4cc(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D49E $0000 */
  FUN_db33();
  FUN_db0e();
  *(undefined1 *)(param_3 + 0x21) = 2;
  return uStack_2;
}


// ===== FUN_d4e1 @ d4e1 =====

undefined2 __h3000 FUN_d4e1(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D49E $0000 */
  FUN_db33();
  FUN_db0e();
  *(undefined1 *)(param_3 + 0x21) = 4;
  return uStack_2;
}


// ===== FUN_d4f6 @ d4f6 =====

undefined2 __h3000 FUN_d4f6(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D49E $0000 */
  FUN_db33();
  FUN_db0e();
  *(undefined1 *)(param_3 + 0x21) = 6;
  return uStack_2;
}


// ===== FUN_d50b @ d50b =====

undefined2 __h3000 FUN_d50b(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D520 $0000 */
  FUN_db33();
  FUN_db0e();
  *(undefined1 *)(param_3 + 0x21) = 0x80;
  return uStack_2;
}


// ===== FUN_d520 @ d520 =====

undefined2 __h3000 FUN_d520(short param_1)

{
  undefined2 in_D;
  char cVar2;
  undefined2 uVar1;
  byte extraout_CC;
  
  cVar2 = FUN_db5d();
  if ((extraout_CC >> 2 & 1) == 0) {
    *(code **)(param_1 + 3) = API_FD80;
    return in_D;
  }
  if (cVar2 != -0x20) {
    do {
      do {
        do {
          uVar1 = FUN_da13();
        } while ((char)uVar1 == -0x80);
      } while ((char)((ushort)uVar1 >> 8) == '\0');
      if (*(char *)(param_1 + 0x1e) == '\x01') {
        *(undefined1 *)(param_1 + 0x20) = *(undefined1 *)(param_1 + 0x1f);
      }
      *(char *)(param_1 + 0x1d) = *(char *)(param_1 + 0x1f) - *(char *)(param_1 + 0x20);
      uVar1 = FUN_daeb();
      *(undefined2 *)(param_1 + 0x16) = uVar1;
    } while( true );
  }
  do {
    FUN_da98();
    uVar1 = FUN_dace();
    *(undefined2 *)(param_1 + 0x16) = uVar1;
  } while( true );
}


// ===== FUN_d56c @ d56c =====

undefined2 __h3000 FUN_d56c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D578 $0000 */
  FUN_db33();
  return uStack_2;
}


// ===== FUN_d578 @ d578 =====

undefined2 __h3000 FUN_d578(short param_1)

{
  undefined2 in_D;
  byte extraout_CC;
  
  FUN_db5d();
  if ((extraout_CC >> 2 & 1) != 0) {
    do {
      FUN_da13();
      FUN_d99b();
    } while( true );
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d591 @ d591 =====

undefined2 __h3000 FUN_d591(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_d56c();
  *(undefined1 *)(param_3 + 0x24) = extraout_B;
  FUN_dba7(2);
  *(undefined1 *)(param_3 + 0x19) = extraout_B_00;
  return uStack_2;
}


// ===== FUN_d5a8 @ d5a8 =====

undefined2 __h3000 FUN_d5a8(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D5BA $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 0;
  return uStack_2;
}


// ===== FUN_d5ba @ d5ba =====

undefined2 __h3000 FUN_d5ba(short param_1)

{
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  
  FUN_db5d();
  if ((extraout_CC >> 2 & 1) != 0) {
    do {
      do {
        do {
          FUN_da13();
          FUN_d9bb();
        } while ((extraout_CC_00 >> 2 & 1) == 0);
      } while (*(char *)(param_1 + 0x20) == '\0');
      FUN_d99b();
    } while( true );
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d5d6 @ d5d6 =====

undefined2 __h3000 FUN_d5d6(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_d5a8();
  *(undefined1 *)(param_3 + 0x24) = extraout_B_00;
  FUN_dba7(2);
  *(undefined1 *)(param_3 + 0x19) = extraout_B;
  return uStack_2;
}


// ===== FUN_d5dd @ d5dd =====

undefined2 __h3000 FUN_d5dd(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D5BA $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 2;
  return uStack_2;
}


// ===== FUN_d5ef @ d5ef =====

undefined2 __h3000 FUN_d5ef(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D5BA $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 4;
  return uStack_2;
}


// ===== FUN_d601 @ d601 =====

undefined2 __h3000 FUN_d601(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D5BA $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 6;
  return uStack_2;
}


// ===== FUN_d613 @ d613 =====

undefined2 __h3000 FUN_d613(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D628 $0000 */
  FUN_db33();
  FUN_dba7(2);
  *(undefined1 *)(param_3 + 0x1d) = extraout_B;
  return uStack_2;
}


// ===== FUN_d628 @ d628 =====

undefined2 __h3000 FUN_d628(short param_1)

{
  undefined2 in_D;
  undefined2 uVar1;
  byte extraout_CC;
  
  FUN_db5d();
  if ((extraout_CC >> 2 & 1) != 0) {
    do {
      do {
        uVar1 = FUN_da13();
      } while ((char)uVar1 == -0x80);
      if (((char)((ushort)uVar1 >> 8) != '\0') &&
         (*(char *)(param_1 + 0x1f) == *(char *)(param_1 + 0x1d))) {
        FUN_d99b(0);
      }
    } while( true );
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d64d @ d64d =====

undefined2 __h3000 FUN_d64d(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D65F $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 0;
  return uStack_2;
}


// ===== FUN_d65f @ d65f =====

ushort __h3000 FUN_d65f(short param_1)

{
  ushort in_D;
  char cVar1;
  byte extraout_B;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = FUN_db5d();
  if ((extraout_CC >> 2 & 1) == 0) {
    *(code **)(param_1 + 3) = API_FD80;
    return in_D;
  }
  if (cVar1 != -0x60) {
    do {
      FUN_da13();
      FUN_d9bb();
    } while( true );
  }
  *(code **)(param_1 + 3) = FUN_d688;
                    /* WARNING: Could not recover jumptable at 0xd686. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
  return (ushort)extraout_B;
}


// ===== FUN_d67d @ d67d =====

void __h3000 FUN_d67d(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d688;
                    /* WARNING: Could not recover jumptable at 0xd686. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d688 @ d688 =====

void __h3000 FUN_d688(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1d)) {
    *(code **)(param_1 + 3) = FUN_d699;
                    /* WARNING: Could not recover jumptable at 0xd697. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d67d;
                    /* WARNING: Could not recover jumptable at 0xd67b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d699 @ d699 =====

void __h3000 FUN_d699(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d99b();
  *(code **)(param_1 + 3) = FUN_d688;
                    /* WARNING: Could not recover jumptable at 0xd686. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d6a0 @ d6a0 =====

undefined2 __h3000 FUN_d6a0(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D65F $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 2;
  return uStack_2;
}


// ===== FUN_d6b2 @ d6b2 =====

undefined2 __h3000 FUN_d6b2(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D65F $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 4;
  return uStack_2;
}


// ===== FUN_d6c4 @ d6c4 =====

undefined2 __h3000 FUN_d6c4(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D65F $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 6;
  return uStack_2;
}


// ===== FUN_d6d6 @ d6d6 =====

undefined2 __h3000 FUN_d6d6(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D6EB $0000 */
  FUN_db33();
  FUN_dba7(extraout_A,2);
  *(undefined1 *)(param_3 + 0x1d) = extraout_B;
  return uStack_2;
}


// ===== FUN_d6eb @ d6eb =====

ushort __h3000 FUN_d6eb(short param_1)

{
  ushort in_D;
  char cVar1;
  byte extraout_B;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = FUN_db5d();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar1 == -0x60)) {
    *(code **)(param_1 + 3) = FUN_d710;
                    /* WARNING: Could not recover jumptable at 0xd70e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
    return (ushort)extraout_B;
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d705 @ d705 =====

void __h3000 FUN_d705(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d710;
                    /* WARNING: Could not recover jumptable at 0xd70e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d710 @ d710 =====

void __h3000 FUN_d710(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1d)) {
    *(code **)(param_1 + 3) = FUN_d721;
                    /* WARNING: Could not recover jumptable at 0xd71f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d705;
                    /* WARNING: Could not recover jumptable at 0xd703. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d721 @ d721 =====

void __h3000 FUN_d721(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d99b();
  *(code **)(param_1 + 3) = FUN_d710;
                    /* WARNING: Could not recover jumptable at 0xd70e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d728 @ d728 =====

undefined2 __h3000 FUN_d728(undefined1 param_1,undefined1 param_2,short param_3,short param_4)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  *(undefined1 *)(param_3 + 0x1d) = *(undefined1 *)(param_4 + 0x22);
                    /* inline[addr:DB33]: $D744 $0000 */
  FUN_db33();
  return uStack_2;
}


// ===== FUN_d73b @ d73b =====

undefined2 __h3000 FUN_d73b(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
  *(undefined1 *)(param_3 + 0x1d) = extraout_B;
  FUN_db33();
  return uStack_2;
}


// ===== FUN_d744 @ d744 =====

ushort __h3000 FUN_d744(short param_1)

{
  ushort in_D;
  char cVar1;
  byte extraout_B;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = FUN_db5d();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar1 == -0x50)) {
    *(code **)(param_1 + 3) = FUN_d75c;
                    /* WARNING: Could not recover jumptable at 0xd75a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
    return (ushort)extraout_B;
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d75c @ d75c =====

void __h3000 FUN_d75c(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1d)) {
    *(code **)(param_1 + 3) = FUN_d76d;
                    /* WARNING: Could not recover jumptable at 0xd76b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d77d;
                    /* WARNING: Could not recover jumptable at 0xd77b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d76d @ d76d =====

void __h3000 FUN_d76d(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d99b();
  *(code **)(param_1 + 3) = FUN_d75c;
                    /* WARNING: Could not recover jumptable at 0xd75a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d77d @ d77d =====

void __h3000 FUN_d77d(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d75c;
                    /* WARNING: Could not recover jumptable at 0xd75a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d781 @ d781 =====

undefined2 __h3000 FUN_d781(undefined1 param_1,undefined1 param_2,short param_3,short param_4)

{
  char cVar1;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  cVar1 = *(char *)(param_4 + 0x22);
  *(char *)(param_3 + 0x1d) = cVar1;
  *(char *)(param_3 + 0x1e) = cVar1 + ' ';
                    /* inline[addr:DB33]: $D7A3 $0000 */
  FUN_db33();
  return uStack_2;
}


// ===== FUN_d79a @ d79a =====

undefined2 __h3000 FUN_d79a(undefined1 param_1,undefined1 param_2,short param_3)

{
  char extraout_B;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_dba7(2);
  *(char *)(param_3 + 0x1d) = extraout_B;
  *(char *)(param_3 + 0x1e) = extraout_B + ' ';
  FUN_db33();
  return uStack_2;
}


// ===== FUN_d7a3 @ d7a3 =====

ushort __h3000 FUN_d7a3(short param_1)

{
  ushort in_D;
  char cVar1;
  byte extraout_B;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = FUN_db5d();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar1 == -0x50)) {
    *(code **)(param_1 + 3) = FUN_d7bb;
                    /* WARNING: Could not recover jumptable at 0xd7b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
    return (ushort)extraout_B;
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d7bb @ d7bb =====

void __h3000 FUN_d7bb(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D == *(char *)(param_1 + 0x1d)) {
    *(code **)(param_1 + 3) = FUN_d7cc;
                    /* WARNING: Could not recover jumptable at 0xd7ca. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(uVar1);
    return;
  }
  if ((char)in_D == *(char *)(param_1 + 0x1e)) {
    *(code **)(param_1 + 3) = FUN_d7f2;
                    /* WARNING: Could not recover jumptable at 0xd7f0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d803;
                    /* WARNING: Could not recover jumptable at 0xd801. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1);
  return;
}


// ===== FUN_d7cc @ d7cc =====

void __h3000 FUN_d7cc(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1f) = (char)in_D;
  *(ushort *)(param_1 + 0x16) =
       CONCAT11(*(byte *)(param_1 + 0x1f) >> 1,
                (char)(*(char *)(param_1 + 0x1c) << 1) >> 1 | *(byte *)(param_1 + 0x1f) << 7);
  *(code **)(param_1 + 3) = FUN_d7bb;
                    /* WARNING: Could not recover jumptable at 0xd7b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d7f2 @ d7f2 =====

void __h3000 FUN_d7f2(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1c) = (char)in_D;
  *(ushort *)(param_1 + 0x16) =
       CONCAT11(*(byte *)(param_1 + 0x1f) >> 1,
                (char)(*(char *)(param_1 + 0x1c) << 1) >> 1 | *(byte *)(param_1 + 0x1f) << 7);
  *(code **)(param_1 + 3) = FUN_d7bb;
                    /* WARNING: Could not recover jumptable at 0xd7b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d803 @ d803 =====

void __h3000 FUN_d803(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d7bb;
                    /* WARNING: Could not recover jumptable at 0xd7b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d807 @ d807 =====

undefined2 __h3000 FUN_d807(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D81B $0000 */
  FUN_db33();
  return uStack_6;
}


// ===== FUN_d813 @ d813 =====

undefined2 __h3000 FUN_d813(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_d807();
  *(undefined1 *)(param_3 + 0x24) = extraout_B_00;
  FUN_dba7(2);
  *(undefined1 *)(param_3 + 0x19) = extraout_B;
  return uStack_2;
}


// ===== FUN_d81b @ d81b =====

ushort __h3000 FUN_d81b(short param_1)

{
  ushort in_D;
  char cVar1;
  byte extraout_B;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = FUN_db5d();
  if (((extraout_CC >> 2 & 1) != 0) && (cVar1 == -0x20)) {
    *(code **)(param_1 + 3) = FUN_d833;
                    /* WARNING: Could not recover jumptable at 0xd831. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
    return (ushort)extraout_B;
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d833 @ d833 =====

void __h3000 FUN_d833(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d99b();
  *(code **)(param_1 + 3) = FUN_d833;
                    /* WARNING: Could not recover jumptable at 0xd831. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d83a @ d83a =====

undefined2 __h3000 FUN_d83a(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D879 $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 0;
  return uStack_6;
}


// ===== FUN_d84c @ d84c =====

undefined2 __h3000 FUN_d84c(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D879 $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 1;
  FUN_dba7(2);
  *(undefined1 *)(param_3 + 0x1d) = extraout_B;
  return uStack_6;
}


// ===== FUN_d867 @ d867 =====

undefined2 __h3000 FUN_d867(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[addr:DB33]: $D879 $0000 */
  FUN_db33();
  *(undefined1 *)(param_3 + 0x21) = 2;
  return uStack_6;
}


// ===== FUN_d879 @ d879 =====

ushort __h3000 FUN_d879(short param_1)

{
  undefined1 uVar1;
  ushort in_D;
  char cVar2;
  byte extraout_B;
  byte extraout_B_00;
  byte extraout_B_01;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)(in_D >> 8);
  cVar2 = FUN_db5d();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (cVar2 == -0x70) {
      if (*(char *)(param_1 + 0x21) == '\x02') {
        *(code **)(param_1 + 3) = FUN_d8d3;
                    /* WARNING: Could not recover jumptable at 0xd8d1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*UNRECOVERED_JUMPTABLE)(uVar1);
        return (ushort)extraout_B_00;
      }
      *(code **)(param_1 + 3) = FUN_d8f1;
                    /* WARNING: Could not recover jumptable at 0xd8ef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(uVar1);
      return (ushort)extraout_B_01;
    }
    if (cVar2 == -0x80) {
      *(code **)(param_1 + 3) = FUN_d895;
                    /* WARNING: Could not recover jumptable at 0xd893. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(uVar1);
      return (ushort)extraout_B;
    }
  }
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d895 @ d895 =====

void __h3000 FUN_d895(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((*(char *)(param_1 + 0x21) == '\x01') && ((char)in_D != *(char *)(param_1 + 0x1d))) {
    *(code **)(param_1 + 3) = FUN_d8be;
                    /* WARNING: Could not recover jumptable at 0xd8bc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d8ae;
                    /* WARNING: Could not recover jumptable at 0xd8ac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d8ae @ d8ae =====

void __h3000 FUN_d8ae(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_d99b();
  *(code **)(param_1 + 3) = FUN_d895;
                    /* WARNING: Could not recover jumptable at 0xd893. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8be @ d8be =====

void __h3000 FUN_d8be(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d895;
                    /* WARNING: Could not recover jumptable at 0xd893. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8c2 @ d8c2 =====

void __h3000 FUN_d8c2(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE_00;
  
  if (*(char *)(param_3 + 0x21) == '\x02') {
    *(code **)(param_3 + 3) = FUN_d8d3;
                    /* WARNING: Could not recover jumptable at 0xd8d1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000000);
    return;
  }
  *(code **)(param_3 + 3) = FUN_d8f1;
                    /* WARNING: Could not recover jumptable at 0xd8ef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000000);
  return;
}


// ===== FUN_d8d3 @ d8d3 =====

void __h3000 FUN_d8d3(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d8de;
                    /* WARNING: Could not recover jumptable at 0xd8dc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8de @ d8de =====

void __h3000 FUN_d8de(short param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE_00;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  if ((char)in_D != '\0') {
    FUN_d99b();
    FUN_d8c2();
    return;
  }
  if (*(char *)(param_1 + 0x21) == '\x02') {
    *(code **)(param_1 + 3) = FUN_d8d3;
                    /* WARNING: Could not recover jumptable at 0xd8d1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(uVar1);
    return;
  }
  *(code **)(param_1 + 3) = FUN_d8f1;
                    /* WARNING: Could not recover jumptable at 0xd8ef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(uVar1);
  return;
}


// ===== FUN_d8f1 @ d8f1 =====

void __h3000 FUN_d8f1(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_d8fc;
                    /* WARNING: Could not recover jumptable at 0xd8fa. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_d8fc @ d8fc =====

void __h3000 FUN_d8fc(void)

{
  FUN_d8c2();
  return;
}


// ===== FUN_d900 @ d900 =====

undefined2 __h3000 FUN_d900(short param_1)

{
  undefined2 in_D;
  
                    /* inline[addr:DB33]: $D913 $0000 */
  FUN_db33();
  *(code **)(param_1 + 3) = API_FD80;
  return in_D;
}


// ===== FUN_d928 @ d928 =====

undefined2 __h3000 FUN_d928(void)

{
  ushort uVar1;
  undefined2 in_D;
  byte bVar3;
  undefined2 uVar2;
  undefined1 *puVar4;
  short sVar5;
  short in_U;
  undefined2 *puVar6;
  
  FUN_8763();
  bVar3 = (byte)DAT_60eb;
  uVar1 = (ushort)DAT_60eb >> 8;
  *(byte *)(in_U + -1) = bVar3 << 3;
  *(byte *)(in_U + -2) =
       (((char)uVar1 << 1 | bVar3 >> 7) << 1 | (bVar3 & 0x7f) >> 6) << 1 | (bVar3 & 0x3f) >> 5;
  *(undefined1 *)(in_U + -3) = 0xc0;
  puVar6 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar6 = 0x50;
  API_FCF2();
  DAT_60fe = *puVar6;
  puVar6 = puVar6 + 1;
  FUN_d993();
  uVar2 = DAT_60eb;
  *(char *)((short)puVar6 + -1) = (char)DAT_60eb;
  *(char *)(puVar6 + -1) = (char)((ushort)uVar2 >> 8);
  *(undefined1 *)((short)puVar6 + -3) = 6;
  puVar6 = puVar6 + -2;
  *(undefined1 *)puVar6 = 0;
  API_FCF4();
  *(undefined1 *)((short)puVar6 + -1) = 0xa9;
  puVar6 = puVar6 + -1;
  *(undefined1 *)puVar6 = 0x45;
  API_FCF2();
  DAT_6100 = FUN_d993(*(undefined1 *)puVar6);
  sVar5 = 0x10;
  puVar4 = &DAT_6b00;
  do {
    uVar2 = DAT_60fe;
    if ((*(undefined **)(puVar4 + 1) == &UNK_d913) ||
       (uVar2 = DAT_6100, *(undefined **)(puVar4 + 1) == &UNK_d927)) {
      *(undefined2 *)(puVar4 + 0x16) = uVar2;
    }
    puVar4 = puVar4 + 0x28;
    sVar5 = sVar5 + -1;
  } while (sVar5 != 0);
  return in_D;
}


// ===== FUN_d993 @ d993 =====

void __h3000 FUN_d993(void)

{
  return;
}


// ===== FUN_d99b @ d99b =====

void __h3000 FUN_d99b(undefined1 param_1,byte param_2,short param_3)

{
  undefined2 uVar1;
  
  if (*(char *)(param_3 + 0x24) == '\0') {
    uVar1 = CONCAT11(param_2 >> 1,param_2 << 7);
  }
  else if (param_2 < *(byte *)(param_3 + 0x19)) {
    uVar1 = 0;
  }
  else {
    uVar1 = 0x3fff;
  }
  *(undefined2 *)(param_3 + 0x16) = uVar1;
  return;
}


// ===== FUN_d9bb @ d9bb =====

undefined2 __h3000 FUN_d9bb(char param_1,char param_2,short param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  if (param_2 == -0x80) {
    return uStack_4;
  }
  if (param_1 == '\0') {
    return uStack_4;
  }
  *(char *)(param_3 + 0x1c) = param_1;
  switch(*(byte *)(param_3 + 0x21) & 6) {
  case 4:
    if (*(byte *)(param_3 + 0x1f) <= *(byte *)(param_3 + 0x1d)) {
      switchD_d9d2::caseD_2();
      return CONCAT11(extraout_A,extraout_B);
    }
    break;
  case 6:
    if ((char)((*(byte *)(param_3 + 0x1d) < *(byte *)(param_3 + 0x1f)) +
              (*(byte *)(param_3 + 0x1d) == *(byte *)(param_3 + 0x1f))) == '\0') break;
  case 2:
    if (*(char *)(param_3 + 0x1e) != '\x01') {
      return uStack_4;
    }
  }
  *(undefined1 *)(param_3 + 0x1d) = *(undefined1 *)(param_3 + 0x1f);
  *(undefined1 *)(param_3 + 0x20) = *(undefined1 *)(param_3 + 0x1c);
  return uStack_4;
}


// ===== caseD_4 @ d9dc =====

undefined1 __h3000 switchD_d9d2::caseD_4(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_B;
  undefined1 in_stack_00000001;
  
  if (*(byte *)(param_3 + 0x1f) <= *(byte *)(param_3 + 0x1d)) {
    caseD_2();
    return extraout_B;
  }
  *(undefined1 *)(param_3 + 0x1d) = *(undefined1 *)(param_3 + 0x1f);
  *(undefined1 *)(param_3 + 0x20) = *(undefined1 *)(param_3 + 0x1c);
  return in_stack_00000001;
}


// ===== caseD_6 @ d9e8 =====

undefined2 __h3000 switchD_d9d2::caseD_6(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  
  if (((char)((*(byte *)(param_3 + 0x1d) < *(byte *)(param_3 + 0x1f)) +
             (*(byte *)(param_3 + 0x1d) == *(byte *)(param_3 + 0x1f))) == '\0') ||
     (*(char *)(param_3 + 0x1e) == '\x01')) {
    *(undefined1 *)(param_3 + 0x1d) = *(undefined1 *)(param_3 + 0x1f);
    *(undefined1 *)(param_3 + 0x20) = *(undefined1 *)(param_3 + 0x1c);
  }
  return in_stack_00000000;
}


// ===== caseD_2 @ d9f2 =====

undefined2 __h3000 switchD_d9d2::caseD_2(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  
  if (*(char *)(param_3 + 0x1e) == '\x01') {
    *(undefined1 *)(param_3 + 0x1d) = *(undefined1 *)(param_3 + 0x1f);
    *(undefined1 *)(param_3 + 0x20) = *(undefined1 *)(param_3 + 0x1c);
  }
  return in_stack_00000000;
}


// ===== FUN_da13 @ da13 =====

void __h3000 FUN_da13(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE_00;
  
  *(undefined1 *)(param_3 + 0x1c) = param_2;
  *(undefined2 *)(param_3 + 0x1a) = in_stack_00000000;
  if (*(char *)(param_3 + 0x1c) == -0x80) {
    *(code **)(param_3 + 3) = FUN_da71;
                    /* WARNING: Could not recover jumptable at 0xda6f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000002);
    return;
  }
  if (*(char *)(param_3 + 0x1c) != -0x70) {
    FUN_db7e();
    return;
  }
  *(code **)(param_3 + 3) = FUN_da35;
                    /* WARNING: Could not recover jumptable at 0xda33. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(in_stack_00000002);
  return;
}


// ===== FUN_da35 @ da35 =====

void __h3000 FUN_da35(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1c) = (char)in_D;
  *(code **)(param_1 + 3) = FUN_da44;
                    /* WARNING: Could not recover jumptable at 0xda42. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_da44 @ da44 =====

void __h3000 FUN_da44(undefined1 param_1,char param_2,short param_3)

{
  char extraout_A;
  
  if (param_2 == '\0') {
    if ((DAT_619d & 2) != 0) {
      FUN_da8d(0);
      param_2 = extraout_A;
    }
  }
  else {
    *(char *)(param_3 + 0x1e) = *(char *)(param_3 + 0x1e) + '\x01';
    *(undefined1 *)(param_3 + 0x1f) = *(undefined1 *)(param_3 + 0x1c);
  }
                    /* WARNING: Could not recover jumptable at 0xda59. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(param_3 + 0x1a))(param_2,0x90);
  return;
}


// ===== FUN_da71 @ da71 =====

void __h3000 FUN_da71(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(code **)(param_1 + 3) = FUN_da7c;
                    /* WARNING: Could not recover jumptable at 0xda7a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_da7c @ da7c =====

void __h3000 FUN_da7c(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined1 extraout_A;
  
  if ((DAT_619d & 1) != 0) {
    FUN_da8d();
    param_1 = extraout_A;
  }
                    /* WARNING: Could not recover jumptable at 0xda89. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(param_3 + 0x1a))(param_1,0x80);
  return;
}


// ===== FUN_da8d @ da8d =====

void __h3000 FUN_da8d(undefined1 param_1,undefined1 param_2,short param_3)

{
  if (*(char *)(param_3 + 0x1e) != '\0') {
    *(char *)(param_3 + 0x1e) = *(char *)(param_3 + 0x1e) + -1;
  }
  return;
}


// ===== FUN_da98 @ da98 =====

void __h3000 FUN_da98(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  undefined1 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined2 *)(param_3 + 0x1a) = in_stack_00000000;
  *(code **)(param_3 + 3) = FUN_daa7;
                    /* WARNING: Could not recover jumptable at 0xdaa5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000002);
  return;
}


// ===== FUN_daa7 @ daa7 =====

void __h3000 FUN_daa7(short param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  *(char *)(param_1 + 0x1c) = (char)in_D;
  *(code **)(param_1 + 3) = FUN_dab6;
                    /* WARNING: Could not recover jumptable at 0xdab4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_dab6 @ dab6 =====

void __h3000 FUN_dab6(undefined1 param_1,byte param_2,short param_3)

{
  short sVar1;
  
  sVar1 = CONCAT11(param_2 >> 1,(char)(*(char *)(param_3 + 0x1c) << 1) >> 1 | param_2 << 7);
  if (sVar1 == 0) {
    sVar1 = 0;
  }
                    /* WARNING: Could not recover jumptable at 0xdaca. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(param_3 + 0x1a))((char)((ushort)sVar1 >> 8));
  return;
}


// ===== FUN_dace @ dace =====

ushort __h3000 FUN_dace(short param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  short in_D;
  short sVar2;
  ushort uVar3;
  undefined2 *puVar4;
  
  if (in_D == 0) {
    in_D = 1;
  }
  *(short *)(param_3 + -2) = in_D + -0x2000;
  uVar1 = *(undefined2 *)(param_1 + 0x24);
  *(char *)(param_3 + -3) = (char)uVar1;
  puVar4 = (undefined2 *)(param_3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  *(undefined2 *)(param_1 + 0x22) = *puVar4;
  sVar2 = CONCAT11(*(byte *)(param_1 + 0x1d) >> 1,*(byte *)(param_1 + 0x1d) << 7);
  if (-1 < *(char *)(param_1 + 0x21)) {
    uVar3 = sVar2 + *(short *)(param_1 + 0x22);
    if ((short)uVar3 < 0) {
      uVar3 = 0;
    }
    if ((uVar3 & 0x4000) != 0) {
      uVar3 = 0x3fff;
    }
    return uVar3;
  }
  return sVar2 + *(short *)(param_1 + 0x22);
}


// ===== FUN_daeb @ daeb =====

ushort __h3000 FUN_daeb(undefined1 param_1,undefined1 param_2,short param_3)

{
  short sVar1;
  ushort uVar2;
  
  sVar1 = CONCAT11(*(byte *)(param_3 + 0x1d) >> 1,*(byte *)(param_3 + 0x1d) << 7);
  if (-1 < *(char *)(param_3 + 0x21)) {
    uVar2 = sVar1 + *(short *)(param_3 + 0x22);
    if ((short)uVar2 < 0) {
      uVar2 = 0;
    }
    if ((uVar2 & 0x4000) != 0) {
      uVar2 = 0x3fff;
    }
    return uVar2;
  }
  return sVar1 + *(short *)(param_3 + 0x22);
}


// ===== FUN_db0e @ db0e =====

undefined2 __h3000 FUN_db0e(short param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  byte bVar1;
  byte *pbVar2;
  
  bVar1 = FUN_dba7(2);
  *(byte *)(param_3 + -1) = bVar1 << 7;
  pbVar2 = (byte *)(param_3 + -2);
  *pbVar2 = bVar1 >> 1;
                    /* inline[API_FE20]: interp table, 5 points */
  InterpTableLookup();
  *(undefined2 *)(param_1 + 0x24) = *(undefined2 *)pbVar2;
  return in_D;
}


// ===== FUN_db33 @ db33 =====

undefined2 __h3000 FUN_db33(short param_1)

{
  undefined2 in_D;
  byte bVar1;
  undefined2 *local_res0;
  
  *(undefined2 *)(param_1 + 1) = *local_res0;
  *(undefined2 *)(param_1 + 0x16) = local_res0[1];
  bVar1 = FUN_dba7(1);
  *(byte *)(param_1 + 0x18) = bVar1 & 0xf;
  *(undefined1 *)(param_1 + 0x21) = 0;
  *(undefined1 *)(param_1 + 0x24) = 0;
  return in_D;
}


// ===== FUN_db5d @ db5d =====

void __h3000 FUN_db5d(void)

{
  return;
}


// ===== FUN_db7e @ db7e =====

undefined2 __h3000 FUN_db7e(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  
  *(code **)(param_3 + 3) = API_FD80;
  return in_stack_00000000;
}


// ===== FUN_db88 @ db88 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined1 __h3000 FUN_db88(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  FUN_dba7(0,param_2,param_3,&UNK_cdd6);
  FUN_db9e();
  return param_2;
}


// ===== FUN_db9e @ db9e =====

byte __h3000 FUN_db9e(undefined1 param_1,byte param_2)

{
  param_2 = param_2 & 0x3f;
  if (!(bool)((param_2 < 0x2b) + (param_2 == 0x2b))) {
    param_2 = 0x2b;
  }
  return param_2;
}


// ===== FUN_dba7 @ dba7 =====

void __h3000 FUN_dba7(char param_1,undefined1 param_2,short param_3)

{
  param_1 = param_1 + *(char *)(param_3 + 0x13);
  API_FC7C(param_1,param_2,(short)param_1);
  return;
}


// ===== FUN_dbb8 @ dbb8 =====

void __h3000 FUN_dbb8(void)

{
  API_FC80();
  return;
}


// ===== API_FD86 @ dbce =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FD86(short param_1)

{
  undefined2 in_D;
  
  API_FC7C(0,*(undefined1 *)(param_1 + 0x13),*(undefined1 *)(param_1 + 0x13));
  *(code **)(param_1 + 1) = API_FD80;
  *(code **)(param_1 + 3) = API_FD80;
  FUN_d406();
  return in_D;
}


// ===== FUN_dbf1 @ dbf1 =====

undefined2 __h3000 FUN_dbf1(void)

{
  undefined2 in_D;
  
  API_FDD4();
  DAT_6030 = FUN_9c7a;
  DAT_6195 = 0;
  DAT_6196 = 0;
  DAT_6074 = 0;
  FUN_dc0e();
  return in_D;
}


// ===== FUN_dc0e @ dc0e =====

undefined2 __h3000 FUN_dc0e(void)

{
  undefined2 in_D;
  
  API_FDD4();
  DAT_6074 = (ushort)DAT_6195;
                    /* inline[API_FC16]: 01 20 02 96 01 00 03 00 $000F $0000 $0000 ->$8877 ->$DC4E
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_dcbe();
                    /* inline[API_FC8A]: ->$DC0E "( Parmtr )" */
  SoftKeyDefine();
  FUN_dc4e();
  return in_D;
}


// ===== FUN_dc4e @ dc4e =====

undefined2 __h3000 FUN_dc4e(short param_1)

{
  undefined2 in_D;
  
  DAT_6074 = FUN_dc82((char)((ushort)DAT_6074 >> 8));
  API_FC14();
  DAT_6195 = FUN_dcd0();
  DAT_6196 = param_1;
  LcdSetCursor();
  FUN_dcac();
  (**(code **)(param_1 + 5))();
  (**(code **)(param_1 + 7))();
  API_FDF2();
  FUN_e5f0();
  return in_D;
}


// ===== FUN_dc82 @ dc82 =====

void __h3000 FUN_dc82(undefined1 param_1,byte param_2,char *param_3)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  char extraout_B;
  byte extraout_CC;
  
  uVar1 = 0xf;
  while( true ) {
    FUN_dcd0(uVar1,param_2 & 0xf);
    if (*param_3 != '\0') break;
    uVar1 = extraout_A;
    if ((bool)(extraout_CC & 1)) {
      param_2 = extraout_B - 1;
    }
    else {
      param_2 = extraout_B + 1;
      if (param_2 == 0x10) {
        param_2 = 0xf;
      }
    }
  }
  return;
}


// ===== FUN_dcac @ dcac =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_dcac(void)

{
  undefined2 in_D;
  
  API_FC3A(0,8,DAT_6196 + 9);
  return in_D;
}


// ===== FUN_dcbe @ dcbe =====

void __h3000 FUN_dcbe(void)

{
                    /* inline[API_FC38]: "{1}         -> " */
  LcdPrintInline();
  return;
}


// ===== FUN_dcd0 @ dcd0 =====

undefined2 __h3000 FUN_dcd0(void)

{
  undefined2 in_D;
  
  return in_D;
}


// ===== FUN_dcdd @ dcdd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_dcdd(void)

{
  undefined2 in_D;
  char cVar2;
  short sVar1;
  char *pcVar3;
  short in_U;
  short *psVar4;
  
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
  } while (pcVar3 != &DAT_dd9b);
  *(char *)(in_U + -1) = cVar2;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0xc;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEA();
  DAT_60ad = (&DAT_dd9b)[*psVar4];
  sVar1 = CONCAT11((char)((ushort)psVar4[1] >> 8),(char)psVar4[1] << 1);
  DAT_60ab = (&DAT_dda6)[sVar1];
  DAT_60ac = (&DAT_dda7)[sVar1];
  return in_D;
}


// ===== FUN_ddbe @ ddbe =====

undefined1 __h3000 FUN_ddbe(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$DDD5 "(MIDI-Mon)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_ddd5 @ ddd5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_ddd5(undefined2 param_1,undefined2 param_2,undefined1 *param_3)

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
  DAT_608b = FUN_de75;
  DAT_60f2 = FUN_de75;
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
      FUN_8763();
      uVar1 = DAT_60eb;
      param_3[-1] = (char)DAT_60eb;
      param_3 = param_3 + -2;
      *param_3 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FC38]: "{2:21}{4:2000}{3:60A7}" */
      LcdPrintInline();
    }
  }
  DAT_60f2 = FUN_8601;
  API_FDC2((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_de75 @ de75 =====

void __h3000 FUN_de75(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  
  FUN_8618();
  FUN_874e(extraout_A,param_2);
  return;
}


// ===== FUN_de80 @ de80 =====

undefined2 __h3000 FUN_de80(void)

{
  undefined2 in_D;
  
  API_FC8C();
  API_FC88();
  API_FDC0(0x69);
  return in_D;
}


// ===== FUN_de91 @ de91 =====

undefined2 __h3000 FUN_de91(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0x90;
  API_FC88();
                    /* inline[API_FC38]: "{1}{2:06} Adjust Contrast With Knob. " */
  LcdPrintInline();
  FUN_df40();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
  return in_D;
}


// ===== API_FC86 @ ded0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 API_FC86(void)

{
  undefined2 in_D;
  
  API_FD04(0,0x5e,PTR_ARRAY_dee2,0x6980);
  return in_D;
}


// ===== FUN_df40 @ df40 =====

undefined2 __h3000 FUN_df40(void)

{
  undefined2 in_D;
  char cVar1;
  
  cVar1 = API_FC7C();
  DAT_6074 = (ushort)(byte)(0x3f - cVar1);
                    /* inline[API_FC16]: 01 08 02 0A 00 00 03 00 $003F $0000 $0000 ->$8877 ->$DF70
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_df70 @ df70 =====

undefined2 __h3000 FUN_df70(void)

{
  undefined2 in_D;
  
  API_FC4A();
                    /* inline[API_FC38]:
                       "{2:00}[{(<-{2:22}-~>)}]{2:28}[{(<-:**************************:-~>)}]" */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_dfbf @ dfbf =====

undefined2 __h3000 FUN_dfbf(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0x91;
  API_FC88();
                    /* inline[API_FC38]: "{1}MIDI Modulation of Parameters " */
  LcdPrintInline();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
  return in_D;
}


// ===== FUN_dffb @ dffb =====

undefined1 __h3000 FUN_dffb(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$DBF1 "(MIDI-Mod)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_e012 @ e012 =====

undefined2 __h3000 FUN_e012(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$E036 "( Mod=   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\x06',DAT_60fc);
  return uStack_6;
}


// ===== FUN_e026 @ e026 =====

undefined2 __h3000 FUN_e026(void)

{
  char extraout_B;
  undefined2 in_stack_00000000;
  
  FUN_ef85();
  FUN_ef15(extraout_B + '\x06',DAT_60fc);
  return in_stack_00000000;
}


// ===== FUN_e036 @ e036 =====

void __h3000 FUN_e036(undefined1 param_1)

{
  undefined1 extraout_B;
  
  FUN_ef57(param_1,DAT_60fc);
  DAT_60fc = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}Modulation by MIDI {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_e026();
  return;
}


// ===== FUN_e069 @ e069 =====

undefined1 __h3000 FUN_e069(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$E080 "(ModReset)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_e080 @ e080 =====

undefined2 __h3000 FUN_e080(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_c8f9();
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Modulation has been Reset " */
  LcdPrintInline();
  return uStack_2;
}


// ===== FUN_e0af @ e0af =====

undefined1 __h3000 FUN_e0af(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$C4FE "          " */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_e0c6 @ e0c6 =====

undefined2 __h3000 FUN_e0c6(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC7C(param_1,param_2,&DAT_010c);
  DAT_608a = extraout_B;
  return uStack_4;
}


// ===== FUN_e0d4 @ e0d4 =====

undefined2 __h3000 FUN_e0d4(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0x92;
  API_FC88();
                    /* inline[API_FC38]: "{1}MIDI System Functions " */
  LcdPrintInline();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
  return in_D;
}


// ===== FUN_e108 @ e108 =====

undefined2 __h3000 FUN_e108(void)

{
  undefined2 in_D;
  short in_U;
  
                    /* inline[API_FC8A]: ->$E136 "(Base=   )" */
  SoftKeyDefine();
  *(ushort *)(in_U + -2) = (DAT_608a & 0xf) + 1;
                    /* inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}" */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_e136 @ e136 =====

undefined2 __h3000 FUN_e136(void)

{
  undefined2 in_D;
  
  DAT_60fb = 0x92;
  API_FDF2();
  FUN_e5f0();
  DAT_6074 = (DAT_608a & 0xf) + 1;
                    /* inline[API_FC16]: 01 10 02 64 01 00 02 00 $0010 $0001 $0000 ->$E172 ->$E199
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_e172();
  return in_D;
}


// ===== FUN_e172 @ e172 =====

void __h3000 FUN_e172(void)

{
                    /* inline[API_FC38]: "{2:00}MIDI Base Channel =
                       {5:14}{2:14}{3:60A1}{2:2F}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_e199 @ e199 =====

undefined2 __h3000 FUN_e199(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  DAT_608a = (char)DAT_6074 - 1U & 0xf | DAT_608a & 0xf0;
  API_FC80();
  return uStack_4;
}


// ===== FUN_e1b7 @ e1b7 =====

undefined1 __h3000 FUN_e1b7(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  
                    /* inline[API_FC8A]: ->$E1DB "( MIDI=  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\a',DAT_619c);
  return param_2;
}


// ===== FUN_e1db @ e1db =====

undefined2 __h3000 FUN_e1db(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_ef57(param_1,DAT_619c);
  DAT_619c = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}All MIDI input {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_e1b7();
  return uStack_6;
}


// ===== FUN_e20d @ e20d =====

undefined2 __h3000 FUN_e20d(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$E235 "(Omni=   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef60(extraout_A,DAT_608a & 0x80);
  LcdPrintInline();
  return uStack_4;
}


// ===== FUN_e221 @ e221 =====

undefined2 __h3000 FUN_e221(undefined1 param_1)

{
  undefined2 in_stack_00000000;
  
  FUN_ef60(param_1,DAT_608a & 0x80);
                    /* inline[API_FC38]: "{2:38}{5:03}{6}" */
  LcdPrintInline();
  return in_stack_00000000;
}


// ===== FUN_e235 @ e235 =====

void __h3000 FUN_e235(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  byte bVar1;
  
  bVar1 = DAT_608a ^ 0x80;
  DAT_608a = bVar1;
  FUN_ef60(param_1,bVar1 & 0x80);
  LcdPrintInline();
  API_FC80(extraout_A,bVar1,param_3,&DAT_010c);
  FUN_e221();
  return;
}


// ===== FUN_e242 @ e242 =====

void __h3000 FUN_e242(char param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 in_stack_00000000;
  
                    /* inline[API_FC38]: "{2:00}{5:28}We are now in Omni {6} Mode " */
  LcdPrintInline(param_1 + -0x17);
  API_FC80(extraout_A,in_stack_00000000,param_3,&DAT_010c);
  FUN_e221();
  return;
}


// ===== FUN_e273 @ e273 =====

undefined1 __h3000 FUN_e273(undefined1 param_1,undefined1 param_2)

{
                    /* inline[API_FC8A]: ->$E28A "( Expert )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return param_2;
}


// ===== FUN_e28a @ e28a =====

undefined2 __h3000 FUN_e28a(void)

{
  undefined2 in_D;
  
  API_FDC8(0xe2);
  return in_D;
}


// ===== FUN_e2a3 @ e2a3 =====

undefined2 __h3000 FUN_e2a3(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC38]: "{1}Expert MIDI Functions " */
  LcdPrintInline();
  DAT_6030 = API_FDCA;
  return in_D;
}


// ===== FUN_e2c9 @ e2c9 =====

undefined2 __h3000 FUN_e2c9(undefined1 param_1)

{
  undefined1 extraout_A;
  short in_U;
  undefined2 in_stack_00000002;
  
  BankPushSelect(param_1,0xa0);
                    /* inline[API_FC8A]: ->$E2FC "(Dev =   )" */
  SoftKeyDefine(extraout_A,DAT_60b9);
  *(undefined1 *)(in_U + -1) = DAT_0110;
  *(undefined1 *)(in_U + -2) = 0;
                    /* inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}" */
  LcdPrintInline();
  BankPop();
  return in_stack_00000002;
}


// ===== FUN_e2fc @ e2fc =====

undefined2 __h3000 FUN_e2fc(void)

{
  undefined2 in_stack_00000002;
  
  DAT_60fb = 0x93;
  API_FDF2();
  FUN_e5f0();
  BankPushSelect();
  DAT_6074 = (ushort)(DAT_0110 & 0x7f);
                    /* inline[API_FC16]: 01 01 02 1E 01 00 02 00 $0063 $0000 $0000 ->$E33D ->$E376
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_e33d();
  BankPop();
  return in_stack_00000002;
}


// ===== FUN_e33d @ e33d =====

void __h3000 FUN_e33d(void)

{
                    /* inline[API_FC38]: "{2:00}Device Number =    ( System Exclusive )
                       {2:10}{3:60A1}{2:2F}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_e376 @ e376 =====

undefined2 __h3000 FUN_e376(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  API_FC80(param_1,(undefined1)DAT_6074,param_3,&DAT_0110);
  return uStack_4;
}


// ===== FUN_e385 @ e385 =====

undefined2 __h3000 FUN_e385(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$E3A9 "(Error=  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\a',DAT_6087);
  return uStack_2;
}


// ===== FUN_e3a9 @ e3a9 =====

void __h3000 FUN_e3a9(void)

{
  DAT_6087 = 0;
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Overrun Catcher Has been Reset" */
  LcdPrintInline();
  FUN_e385();
  return;
}


// ===== FUN_e3da @ e3da =====

void __h3000 FUN_e3da(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$E41E "(Off=    )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_e3f2();
                    /* WARNING: Could not recover jumptable at 0xe3f0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_e3f2 @ e3f2 =====

void __h3000 FUN_e3f2(void)

{
  undefined2 in_D;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined **)(in_U + -2) = &UNK_e40a + (CONCAT11(5,DAT_619d & 3) >> 8) * (ushort)(DAT_619d & 3);
                    /* inline[API_FC38]: "{2:4B}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xe408. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_e41e @ e41e =====

undefined2 __h3000 FUN_e41e(void)

{
  undefined2 in_D;
  
  API_FDF2();
  FUN_e5f0();
  DAT_6074 = (ushort)(DAT_619d - 1U & 3);
                    /* inline[API_FC16]: 01 40 01 1E 00 00 01 00 $0002 $0000 $0000 ->$8877 ->$E457
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_e470();
  FUN_e3f2();
  return in_D;
}


// ===== FUN_e457 @ e457 =====

undefined2 __h3000 FUN_e457(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  DAT_619d = (char)DAT_6074 + '\x01';
  API_FC80();
  FUN_e470();
  FUN_e3f2();
  return uStack_4;
}


// ===== FUN_e470 @ e470 =====

void __h3000 FUN_e470(void)

{
  undefined2 in_D;
  byte bVar1;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Note Off is " */
  LcdPrintInline();
  bVar1 = DAT_619d - 1U & 3;
  *(char **)(in_U + -2) = "Note Off Command     " + (CONCAT11(0x16,bVar1) >> 8) * (ushort)bVar1;
                    /* inline[API_FC38]: "{2:11}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0xe4a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== SetModuleHandlers @ e4e4 =====

/* Kernel API slot $FE00: inline 6 module-relative handlers -> $60E3..$60E9, $603A, $6036 */

undefined2 __h3000 SetModuleHandlers(void)

{
  undefined2 in_D;
  short *local_res0;
  
  DAT_60e3 = *local_res0 + DAT_600d;
  DAT_60e5 = local_res0[1] + DAT_600d;
  DAT_60e7 = local_res0[2] + DAT_600d;
  DAT_60e9 = local_res0[3] + DAT_600d;
  DAT_603a = local_res0[4] + DAT_600d;
  DAT_6036 = local_res0[5] + DAT_600d;
  return in_D;
}


// ===== SoftKeyLabels4Inline @ e51d =====

/* Kernel API slot $FE02: inline 4 labels (00/01 or 8 chars) */

undefined2 __h3000 SoftKeyLabels4Inline(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  FUN_e53d(param_1,0x29);
  FUN_e53d(extraout_A,0x33);
  FUN_e53d(extraout_A_00,0x3d);
  FUN_e53d(extraout_A_01,0x47);
  API_FDF2();
  return uStack_4;
}


// ===== FUN_e53d @ e53d =====

undefined2 __h3000 FUN_e53d(undefined1 param_1,undefined1 param_2,char *param_3)

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


// ===== FUN_e568 @ e568 =====

undefined2 __h3000 FUN_e568(void)

{
  undefined2 in_D;
  
  DAT_603c = FUN_e585;
  DAT_603e = FUN_e58d;
  DAT_6040 = FUN_e595;
  DAT_6042 = FUN_e59d;
  return in_D;
}


// ===== FUN_e585 @ e585 =====

void __h3000 FUN_e585(void)

{
  API_FDE8();
  (*DAT_60e3)();
  return;
}


// ===== FUN_e58d @ e58d =====

void __h3000 FUN_e58d(void)

{
  API_FDEA();
  (*DAT_60e5)();
  return;
}


// ===== FUN_e595 @ e595 =====

void __h3000 FUN_e595(void)

{
  API_FDEC();
  (*DAT_60e7)();
  return;
}


// ===== FUN_e59d @ e59d =====

void __h3000 FUN_e59d(void)

{
  API_FDEE();
  (*DAT_60e9)();
  return;
}


// ===== API_FDE8 @ e5a5 =====

undefined2 __h3000 API_FDE8(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x28);
  return uStack_2;
}


// ===== API_FDEA @ e5af =====

undefined2 __h3000 API_FDEA(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x32);
  return uStack_2;
}


// ===== API_FDEC @ e5b9 =====

undefined2 __h3000 API_FDEC(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x3c);
  return uStack_2;
}


// ===== API_FDEE @ e5c3 =====

undefined2 __h3000 API_FDEE(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  API_FDE6(param_1,0x46);
  return uStack_2;
}


// ===== API_FDE6 @ e5cd =====

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


// ===== FUN_e5f0 @ e5f0 =====

byte __h3000 FUN_e5f0(undefined1 param_1,byte param_2)

{
  LcdSetCursor((param_2 & 3) * '\n' + '(');
  API_FC2A();
  LcdSetCursor();
  API_FC2A();
  return param_2;
}


// ===== API_FDF0 @ e5fb =====

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


// ===== API_FDF2 @ e633 =====

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


// ===== API_FDF4 @ e64c =====

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


// ===== API_FDF6 @ e66c =====

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
  return;
}


// ===== LoadParamsSigned @ e69d =====

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


// ===== LoadParamsUnsigned @ e6bc =====

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


// ===== LoadParamsScaled @ e6db =====

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


// ===== API_FDFE @ e6f9 =====

ushort __h3000 API_FDFE(ushort *param_1,undefined2 param_2,short param_3)

{
  ushort uVar1;
  ushort in_D;
  
  uVar1 = *param_1;
  if (in_D < uVar1 && (short)uVar1 <= (short)in_D) {
    *param_1 = param_3 + *param_1;
    if ((short)in_D < (short)*param_1) {
      *param_1 = in_D;
    }
  }
  else {
    if (in_D < uVar1 == (in_D == uVar1)) {
      return in_D;
    }
    *param_1 = *param_1 - param_3;
    if ((short)*param_1 < (short)in_D) {
      *param_1 = in_D;
    }
  }
  API_FD2E((char)(*param_1 >> 8));
  return in_D;
}


// ===== FUN_e736 @ e736 =====

void __h3000 FUN_e736(undefined1 param_1,undefined1 param_2,short param_3)

{
                    /* inline[API_FE02]: [-] [-] " range  " "perclick" */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_60e7 = FUN_e76f;
  DAT_60e9 = FUN_e77f;
  DAT_6040 = FUN_e595;
  DAT_6042 = FUN_e59d;
  DAT_619e = param_3 + DAT_600d;
  return;
}


// ===== FUN_e76f @ e76f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e76f(void)

{
  DAT_60dc = 1;
  DAT_60de = 1;
  FUN_e78f(0,1,DAT_619e);
  return;
}


// ===== FUN_e77f @ e77f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_e77f(void)

{
  DAT_60dc = 0x80;
  DAT_60de = 0x80;
  FUN_e78f(0,0x80,DAT_619e);
  return;
}


// ===== FUN_e78f @ e78f =====

undefined2 __h3000 FUN_e78f(undefined1 param_1,undefined1 param_2,short param_3)

{
  undefined2 in_stack_00000000;
  
  DAT_6074 = *(undefined2 *)(*(short *)(param_3 + 4) + 6);
  DAT_6066 = 1;
  DAT_6067 = 1;
  DAT_60e0._0_1_ = 1;
  DAT_6068 = 1;
  DAT_6058 = 2;
  DAT_6099 = *(undefined1 *)(param_3 + 0xc);
  DAT_6069 = *(undefined1 *)(param_3 + 0xd);
  DAT_606c = *(undefined2 *)(param_3 + 10);
  DAT_606e = *(undefined2 *)(param_3 + 8);
  DAT_6070 = FUN_e813;
  DAT_6072 = FUN_e7fa;
  API_FC14();
  LcdSetCursor();
                    /* inline[API_FC38]: "midi range:      [    /click]" */
  LcdPrintInline();
  FUN_e813();
  return in_stack_00000000;
}


// ===== FUN_e7fa @ e7fa =====

undefined2 __h3000 FUN_e7fa(void)

{
  undefined2 in_D;
  
  *(undefined2 *)(*(short *)(DAT_619e + 4) + 6) = DAT_6074;
  API_FC82();
  FUN_e813();
  return in_D;
}


// ===== FUN_e813 @ e813 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_e813(void)

{
  undefined2 uVar1;
  byte bVar2;
  undefined1 extraout_A;
  undefined2 in_D;
  short sVar3;
  short sVar4;
  short in_U;
  ushort local_c;
  
  sVar4 = DAT_619e;
  sVar3 = DAT_619e;
  LcdSetCursor();
  local_c = (ushort)*(byte *)(sVar3 + 0xd);
  API_FC3A(0,*(byte *)(sVar3 + 0xd),(short)&DAT_60a3 - local_c);
  LcdSetCursor();
  uVar1 = *(undefined2 *)(*(short *)(sVar4 + 4) + 6);
  bVar2 = (char)((ushort)uVar1 >> 8) << 1 | (byte)uVar1 >> 7;
  *(byte *)(in_U + -1) = bVar2;
  *(char *)(in_U + -2) = (char)bVar2 >> 7;
  API_FC40(0);
  API_FC3A(extraout_A,4,0x61a5);
  return in_D;
}


// ===== ParamDescriptorCall @ e85a =====

/* Kernel API slot $FE1C: X = module-relative parameter descriptor */

undefined2 __h3000 ParamDescriptorCall(short param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  short sVar3;
  undefined2 *puVar4;
  
  *(byte *)(param_3 + -1) = (byte)in_D << 1;
  *(byte *)(param_3 + -2) = (char)((ushort)in_D >> 8) << 1 | (byte)in_D >> 7;
  psVar2 = (short *)(param_1 + DAT_600d);
  sVar3 = psVar2[2];
  uVar1 = *(undefined2 *)(sVar3 + 6);
  *(char *)(param_3 + -3) = (char)uVar1;
  puVar4 = (undefined2 *)(param_3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  *(undefined2 *)(sVar3 + 2) = *puVar4;
  (*(code *)(psVar2[1] + DAT_600d))();
  if (*psVar2 + DAT_600d == DAT_6070) {
    FUN_e88c();
  }
  return in_D;
}


// ===== FUN_e88c @ e88c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_e88c(short *param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  
  uVar1 = *(undefined2 *)(param_1[2] + 4);
  uVar2 = (undefined1)uVar1;
  *(undefined1 *)(param_3 + -1) = uVar2;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(*(undefined1 *)(param_1 + 6),uVar2,param_1,&DAT_609a);
  (*(code *)(*param_1 + DAT_600d))();
  return in_D;
}


// ===== FUN_e8aa @ e8aa =====

void __h3000 FUN_e8aa(void)

{
                    /* inline[API_FE24]: $68A0 */
  FUN_e8af();
  return;
}


// ===== FUN_e8af @ e8af =====

ushort __h3000 FUN_e8af(short param_1)

{
  ushort in_D;
  ushort uVar1;
  undefined1 uVar2;
  undefined2 local_a;
  undefined1 local_8;
  
  local_a = in_D;
  do {
    FUN_e94e();
    uVar1 = local_a;
    if (!(bool)((local_a < 0x20) + (local_a == 0x20))) {
      uVar1 = 0x20;
    }
    local_8 = (char)uVar1;
    local_a = local_a - uVar1;
    FUN_e919();
    uVar2 = FUN_e919((char)param_1);
    FUN_e919(uVar2);
    FUN_e919();
    do {
      param_1 = param_1 + 1;
      FUN_e919();
      local_8 = local_8 + -1;
    } while (local_8 != '\0');
    FUN_e919();
    FUN_e94e();
    FUN_e94e();
  } while (local_a != 0);
  return in_D;
}


// ===== FUN_e919 @ e919 =====

byte __h3000 FUN_e919(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 *param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  byte bVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  bVar2 = param_2 >> 4;
  while( true ) {
    FUN_987e(param_1,bVar2);
    bVar2 = extraout_CC;
    uVar1 = (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    bVar2 = FUN_859b();
    param_1 = extraout_A;
  }
  FUN_987e(uVar1,param_2 & 0xf);
  bVar2 = extraout_CC_00;
  while( true ) {
    (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    FUN_859b();
    bVar2 = extraout_CC_01;
  }
  return param_2;
}


// ===== FUN_e925 @ e925 =====

byte __h3000 FUN_e925(undefined1 param_1,byte param_2,undefined2 param_3,undefined2 *param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  byte bVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  bVar2 = param_2 >> 4;
  while( true ) {
    FUN_987e(param_1,bVar2);
    bVar2 = extraout_CC;
    uVar1 = (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    bVar2 = FUN_859b();
    param_1 = extraout_A;
  }
  FUN_987e(uVar1,param_2 & 0xf);
  bVar2 = extraout_CC_00;
  while( true ) {
    (*(code *)*param_4)();
    if ((bool)(bVar2 >> 2 & 1)) break;
    FUN_859b();
    bVar2 = extraout_CC_01;
  }
  return param_2;
}


// ===== FUN_e94e @ e94e =====

undefined1 __h3000
FUN_e94e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 *param_4)

{
  byte extraout_CC;
  byte in_CC;
  
  while( true ) {
    (*(code *)*param_4)();
    if ((bool)(in_CC >> 2 & 1)) break;
    FUN_859b();
    in_CC = extraout_CC;
  }
  return param_2;
}


// ===== FUN_e952 @ e952 =====

undefined2 __h3000 FUN_e952(void)

{
  undefined2 in_D;
  
  FUN_e94e();
  FUN_e925();
  FUN_e925();
  FUN_e925();
  FUN_e94e();
  FUN_e94e();
  return in_D;
}


// ===== FUN_e987 @ e987 =====

undefined2 __h3000 FUN_e987(void)

{
  undefined2 in_D;
  
  FUN_e94e();
  FUN_e925();
  FUN_e925();
  FUN_e925();
  FUN_e94e();
  FUN_e94e();
  return in_D;
}


// ===== FUN_e99d @ e99d =====

undefined2 __h3000
FUN_e99d(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

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


// ===== FUN_e9b8 @ e9b8 =====

void __h3000 FUN_e9b8(undefined1 param_1,undefined1 param_2)

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
    if (extraout_B < '\0') goto LAB_e9e5;
    g_curBank = *(undefined1 *)(sVar2 + 0xb);
    BANK_LATCH = g_curBank;
  }
  cVar1 = -0x10;
LAB_e9e5:
  BankPop(extraout_A_00,cVar1);
  return;
}


// ===== FUN_e9eb @ e9eb =====

void __h3000 FUN_e9eb(undefined2 *param_1,short param_2)

{
  char *pcVar1;
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined2 in_D;
  char cVar4;
  undefined1 uVar5;
  undefined2 uVar2;
  undefined1 *puVar3;
  byte extraout_CC;
  undefined1 *puVar6;
  
  cVar4 = (char)in_D;
  if (cVar4 == ':') {
    uVar5 = FUN_ea79();
    *(undefined1 *)(param_2 + 10) = uVar5;
    uVar5 = FUN_ea79();
    puVar3 = (undefined1 *)FUN_ea79(uVar5);
    FUN_ea79();
    puVar6 = puVar3;
    if ((extraout_CC >> 2 & 1) == 0) {
      do {
        FUN_ea79();
        pcVar1 = (char *)(param_2 + 10);
        *pcVar1 = *pcVar1 + -1;
        uVar5 = extraout_A_02;
      } while (*pcVar1 != '\0');
    }
    else {
      do {
        uVar5 = FUN_ea79();
        puVar3 = puVar6 + 1;
        *puVar6 = uVar5;
        pcVar1 = (char *)(param_2 + 10);
        *pcVar1 = *pcVar1 + -1;
        puVar6 = puVar3;
      } while (*pcVar1 != '\0');
      FUN_ea79();
      uVar5 = extraout_A_01;
    }
    *(undefined1 *)(param_2 + 6) = uVar5;
    *(undefined1 **)(param_2 + 8) = puVar3;
    *(code **)(param_2 + 2) = FUN_ead4;
    return;
  }
  if (cVar4 == '\\') {
    uVar5 = FUN_ea79();
    uVar2 = FUN_ea79(uVar5);
    *(undefined2 *)(param_2 + 0x14) = uVar2;
    uVar2 = FUN_ea79();
    uVar5 = (undefined1)((ushort)uVar2 >> 8);
    if ((char)((char)uVar2 + *(char *)(param_2 + 0x14) + *(char *)(param_2 + 0x15)) == '\0') {
      FUN_ea4d((char)((ushort)*(undefined2 *)(param_2 + 0x14) >> 8));
      uVar5 = extraout_A;
    }
  }
  else {
    if (cVar4 != '|') {
      *(char *)(param_2 + 6) = (char)((ushort)in_D >> 8);
      *(undefined2 **)(param_2 + 8) = param_1;
      *(code **)(param_2 + 2) = FUN_ea03;
      return;
    }
    uVar5 = FUN_ea79();
    uVar2 = FUN_ea79(uVar5);
    *(undefined2 *)(param_2 + 0x14) = uVar2;
    uVar2 = FUN_ea79();
    uVar5 = (undefined1)((ushort)uVar2 >> 8);
    if ((char)((char)uVar2 + *(char *)(param_2 + 0x14) + *(char *)(param_2 + 0x15)) == '\0') {
      param_1 = *(undefined2 **)(param_2 + 0x14);
      FUN_ea4d((char)((ushort)*param_1 >> 8));
      uVar5 = extraout_A_00;
    }
  }
  *(undefined1 *)(param_2 + 6) = uVar5;
  *(undefined2 **)(param_2 + 8) = param_1;
  *(code **)(param_2 + 2) = FUN_ea2b;
  return;
}


// ===== FUN_ea03 @ ea03 =====

void __h3000 FUN_ea03(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  FUN_e9eb(*(undefined1 *)(param_4 + 6),param_2,*(undefined2 *)(param_4 + 8));
  return;
}


// ===== FUN_ea2b @ ea2b =====

void __h3000 FUN_ea2b(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  FUN_e9eb(*(undefined1 *)(param_4 + 6),param_2,*(undefined2 *)(param_4 + 8));
  return;
}


// ===== FUN_ea4d @ ea4d =====

code * __h3000 FUN_ea4d(void)

{
  undefined1 uVar1;
  code *in_D;
  undefined1 extraout_B;
  undefined2 uVar2;
  short in_Y;
  undefined2 uVar3;
  undefined2 uVar4;
  
  uVar2 = *(undefined2 *)(in_Y + 0xe);
  uVar4 = *(undefined2 *)(in_Y + 0x12);
  uVar3 = *(undefined2 *)(in_Y + 0x10);
  uVar1 = (*in_D)((char)((ushort)*(undefined2 *)(in_Y + 0xc) >> 8));
  *(undefined2 *)(in_Y + 0x12) = uVar4;
  *(undefined2 *)(in_Y + 0xe) = uVar2;
  *(ushort *)(in_Y + 0xc) = CONCAT11(uVar1,extraout_B);
  *(undefined2 *)(in_Y + 0x10) = uVar3;
  return in_D;
}


// ===== FUN_ea79 @ ea79 =====

void __h3000 FUN_ea79(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  *(char *)(param_2 + 6) = (char)((ushort)in_D >> 8);
  *(undefined2 *)(param_2 + 4) = in_stack_00000000;
  *(undefined2 *)(param_2 + 8) = param_1;
  *(code **)(param_2 + 2) = FUN_ea87;
  return;
}


// ===== FUN_ea87 @ ea87 =====

void __h3000 FUN_ea87(void)

{
  char cVar1;
  byte extraout_CC;
  undefined2 uVar2;
  short in_Y;
  
  uVar2 = *(undefined2 *)(in_Y + 8);
  cVar1 = FUN_eadb();
  if ((extraout_CC >> 2 & 1) != 0) {
    *(char *)(in_Y + 7) = cVar1 << 4;
    *(undefined2 *)(in_Y + 8) = uVar2;
    *(code **)(in_Y + 2) = FUN_ea9b;
    return;
  }
  *(undefined2 *)(in_Y + 8) = uVar2;
  *(code **)(in_Y + 2) = FUN_ea87;
  return;
}


// ===== FUN_ea9b @ ea9b =====

void __h3000 FUN_ea9b(void)

{
  byte extraout_CC;
  undefined2 uVar1;
  short in_Y;
  
  uVar1 = *(undefined2 *)(in_Y + 8);
  FUN_eadb(*(undefined1 *)(in_Y + 6));
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* WARNING: Could not recover jumptable at 0xeaa5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (**(code **)(in_Y + 4))();
    return;
  }
  *(undefined2 *)(in_Y + 8) = uVar1;
  *(code **)(in_Y + 2) = FUN_ea9b;
  return;
}


// ===== FUN_ead4 @ ead4 =====

void __h3000 FUN_ead4(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  FUN_e9eb(*(undefined1 *)(param_4 + 6),param_2,*(undefined2 *)(param_4 + 8));
  return;
}


// ===== FUN_eadb @ eadb =====

char __h3000 FUN_eadb(undefined1 param_1,byte param_2)

{
  char cVar1;
  
  if (param_2 < 0x30) {
    return '\0';
  }
  if ((char)((param_2 < 0x39) + (param_2 == 0x39)) == '\0') {
    if (param_2 < 0x41) {
      return '\0';
    }
    if ((char)((param_2 < 0x46) + (param_2 == 0x46)) == '\0') {
      return '\0';
    }
    cVar1 = param_2 - 0x37;
  }
  else {
    cVar1 = param_2 - 0x30;
  }
  return cVar1;
}


// ===== FUN_eaf8 @ eaf8 =====

undefined2 __h3000 FUN_eaf8(void)

{
  undefined2 *puVar1;
  undefined2 in_D;
  short *local_res0;
  
  puVar1 = (undefined2 *)*local_res0;
  *puVar1 = in_D;
  puVar1[9] = puVar1 + 0xb;
  return in_D;
}


// ===== FUN_eb0c @ eb0c =====

undefined2 __h3000 FUN_eb0c(void)

{
  undefined2 in_D;
  short *local_res0;
  
  *(code **)(*local_res0 + 2) = FUN_e9eb;
  return in_D;
}


// ===== FUN_eb1d @ eb1d =====

void __h3000 FUN_eb1d(void)

{
  if (DAT_61ad != '\0') {
    FUN_eb2d();
  }
  return;
}


// ===== FUN_eb25 @ eb25 =====

void __h3000 FUN_eb25(void)

{
  if (DAT_61ae != '\0') {
    FUN_eb2d();
  }
  return;
}


// ===== FUN_eb2d @ eb2d =====

undefined2 __h3000 FUN_eb2d(void)

{
  undefined2 in_D;
  
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
  return in_D;
}


// ===== FUN_eb9b @ eb9b =====

ushort __h3000 FUN_eb9b(void)

{
  ushort in_D;
  
  if ((char)((in_D < 0x7f) + (in_D == 0x7f)) != '\0') {
    API_FC98();
    API_FC98();
  }
  return in_D;
}


// ===== FUN_ebb5 @ ebb5 =====

undefined2 __h3000 FUN_ebb5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  if (DAT_61ad != '\0') {
    FUN_eb9b();
  }
  return uStack_2;
}


// ===== FUN_ebc1 @ ebc1 =====

byte __h3000 FUN_ebc1(undefined1 param_1,byte param_2)

{
  ushort uVar1;
  
  if ((char)param_2 < '\0') {
    if (((param_2 & 0xf0) == 0xb0) &&
       ((DAT_608a < '\0' ||
        (uVar1 = CONCAT11(param_2,DAT_608a) & 0xf0f, (char)uVar1 == (char)(uVar1 >> 8))))) {
      DAT_61aa = FUN_ebfa;
    }
    else {
      DAT_61aa = API_FD80;
    }
  }
  else {
    (*DAT_61aa)();
  }
  return param_2;
}


// ===== FUN_ebfa @ ebfa =====

void __h3000 FUN_ebfa(undefined1 param_1,char param_2)

{
  if (param_2 == 'c') {
    DAT_61aa = FUN_ec28;
  }
  else if (param_2 == 'b') {
    DAT_61aa = FUN_ec3f;
  }
  else {
    if ((param_2 == 'e') || (param_2 == 'd')) {
      DAT_61ac = '\0';
    }
    else if (param_2 == '\x06') {
      if (DAT_61ac != '\0') {
        DAT_61aa = FUN_ec52;
        return;
      }
    }
    else if ((param_2 == '&') && (DAT_61ac != '\0')) {
      DAT_61aa = FUN_ec69;
      return;
    }
    DAT_61aa = FUN_ec1c;
  }
  return;
}


// ===== FUN_ec1c @ ec1c =====

void __h3000 FUN_ec1c(void)

{
  DAT_61aa = FUN_ebfa;
  return;
}


// ===== FUN_ec28 @ ec28 =====

void __h3000 FUN_ec28(void)

{
  byte in_stack_00000002;
  
  DAT_6103 = CONCAT11(in_stack_00000002 >> 1,
                      (char)((char)DAT_6103 << 1) >> 1 | in_stack_00000002 << 7);
  DAT_61ac = 0xff;
  FUN_ec1c();
  return;
}


// ===== FUN_ec3f @ ec3f =====

void __h3000 FUN_ec3f(void)

{
  byte in_stack_00000002;
  
  DAT_6103 = CONCAT11((char)((DAT_6103 & 0xff80) >> 8),(byte)(DAT_6103 & 0xff80) | in_stack_00000002
                     );
  DAT_61ac = 0xff;
  FUN_ec1c();
  return;
}


// ===== FUN_ec52 @ ec52 =====

void __h3000 FUN_ec52(void)

{
  byte in_stack_00000002;
  
  DAT_60f9 = CONCAT11(in_stack_00000002 >> 1,
                      (char)((char)DAT_60f9 << 1) >> 1 | in_stack_00000002 << 7);
  FUN_ec1c();
  return;
}


// ===== FUN_ec69 @ ec69 =====

void __h3000 FUN_ec69(void)

{
  byte in_stack_00000002;
  
  DAT_60f9 = CONCAT11((char)((DAT_60f9 & 0xff80) >> 8),(byte)(DAT_60f9 & 0xff80) | in_stack_00000002
                     );
  FUN_ec78();
  FUN_ec1c();
  return;
}


// ===== FUN_ec78 @ ec78 =====

undefined2 __h3000 FUN_ec78(void)

{
  short sVar1;
  undefined1 uVar2;
  undefined2 in_D;
  byte bVar3;
  undefined2 *puVar4;
  code *pcVar5;
  
  bVar3 = (byte)DAT_6103;
  uVar2 = (undefined1)((ushort)DAT_60f9 >> 8);
  if ((DAT_6103 & 0x2000) == 0) {
    if (((DAT_61af != '\0') && (DAT_6103 < DAT_60f7)) &&
       (sVar1 = CONCAT11((char)(DAT_6103 >> 8) << 1 | bVar3 >> 7,bVar3 << 1) + DAT_60f5, sVar1 != 0)
       ) {
      pcVar5 = (code *)(*(short *)(sVar1 + DAT_600d) + DAT_600d);
      DAT_60f9 = FUN_ece1(uVar2);
      (*pcVar5)();
    }
  }
  else if (((DAT_6103 & 0x1f00) == 0) && (DAT_61b0 != '\0')) {
    puVar4 = (undefined2 *)((short)PTR_ARRAY_eca0 + (short)(char)((bVar3 & 7) << 1));
    DAT_60f9 = FUN_ece1(uVar2);
    (*(code *)*puVar4)();
  }
  return in_D;
}


// ===== FUN_ece1 @ ece1 =====

void __h3000 FUN_ece1(void)

{
  return;
}


// ===== FUN_ece8 @ ece8 =====

undefined2 __h3000 FUN_ece8(void)

{
  undefined2 in_D;
  
  DAT_61aa = API_FD80;
  DAT_61ac = 0;
  DAT_60f5 = 0;
  DAT_60f7 = 0;
  return in_D;
}


// ===== FUN_ecff @ ecff =====

undefined2 __h3000 FUN_ecff(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  API_FC7C(param_1,param_2,&DAT_0113);
  DAT_61ae = extraout_B;
  API_FC7C(extraout_A,extraout_B,&DAT_0112);
  DAT_61ad = extraout_B_00;
  API_FC7C(extraout_A_00,extraout_B_00,&DAT_0115);
  DAT_61b0 = extraout_B_01;
  API_FC7C(extraout_A_01,extraout_B_01,&DAT_0114);
  DAT_61af = extraout_B_02;
  return uStack_6;
}


// ===== FUN_ed28 @ ed28 =====

void __h3000 FUN_ed28(void)

{
  API_FC88();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
                    /* inline[API_FC38]: "{1}Enables for Transmitting MIDI Sequences " */
  LcdPrintInline();
  return;
}


// ===== FUN_ed65 @ ed65 =====

undefined1 __h3000 FUN_ed65(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  
                    /* inline[API_FC8A]: ->$ED89 "(Levels=#)" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\b',DAT_61ae);
  return param_2;
}


// ===== FUN_ed89 @ ed89 =====

undefined2 __h3000 FUN_ed89(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_ef57(param_1,DAT_61ae);
  DAT_61ae = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}Outputing Levels Info {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_ed65();
  return uStack_6;
}


// ===== FUN_edc2 @ edc2 =====

undefined1 __h3000 FUN_edc2(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  
                    /* inline[API_FC8A]: ->$EDE6 "( Pgm=#  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\x06',DAT_61ad);
  return param_2;
}


// ===== FUN_ede6 @ ede6 =====

undefined2 __h3000 FUN_ede6(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_ef57(param_1,DAT_61ad);
  DAT_61ad = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}Program Info Output {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_edc2();
  return uStack_6;
}


// ===== FUN_ee1d @ ee1d =====

void __h3000 FUN_ee1d(void)

{
  return;
}


// ===== FUN_ee1e @ ee1e =====

void __h3000 FUN_ee1e(void)

{
  return;
}


// ===== FUN_ee1f @ ee1f =====

void __h3000 FUN_ee1f(void)

{
  API_FC88();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
                    /* inline[API_FC38]: "{1}Enables for Receiving MIDI Sequences" */
  LcdPrintInline();
  return;
}


// ===== FUN_ee58 @ ee58 =====

undefined1 __h3000 FUN_ee58(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  
                    /* inline[API_FC8A]: ->$EE7C "(Levels=#)" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\b',DAT_61b0);
  return param_2;
}


// ===== FUN_ee7c @ ee7c =====

undefined2 __h3000 FUN_ee7c(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_ef57(param_1,DAT_61b0);
  DAT_61b0 = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}Receiving Levels Info {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_ee58();
  return uStack_6;
}


// ===== FUN_eeb5 @ eeb5 =====

undefined1 __h3000 FUN_eeb5(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  
                    /* inline[API_FC8A]: ->$EED9 "( Pgm=#  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_ef85();
  FUN_ef15(extraout_B + '\x06',DAT_61af);
  return param_2;
}


// ===== FUN_eed9 @ eed9 =====

undefined2 __h3000 FUN_eed9(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_B;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  FUN_ef57(param_1,DAT_61af);
  DAT_61af = extraout_B;
  FUN_ef2c();
                    /* inline[API_FC38]: "{2:00}{5:28}Program Info Receiving {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_eeb5();
  return uStack_6;
}


// ===== FUN_ef13 @ ef13 =====

void __h3000 FUN_ef13(void)

{
  return;
}


// ===== FUN_ef14 @ ef14 =====

void __h3000 FUN_ef14(void)

{
  return;
}


// ===== FUN_ef15 @ ef15 =====

undefined2 __h3000 FUN_ef15(undefined1 param_1,char param_2)

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


// ===== FUN_ef2c @ ef2c =====

void __h3000 FUN_ef2c(void)

{
                    /* inline[API_FE5E]: $EF45 $EF33 */
  FUN_ef6e();
  return;
}


// ===== FUN_ef57 @ ef57 =====

undefined1 __h3000 FUN_ef57(undefined1 param_1,char param_2)

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


// ===== FUN_ef60 @ ef60 =====

void __h3000 FUN_ef60(void)

{
                    /* inline[API_FE5E]: $EF67 $EF6A */
  FUN_ef6e();
  return;
}


// ===== FUN_ef6e @ ef6e =====

char __h3000
FUN_ef6e(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4,short param_5)

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


// ===== FUN_ef85 @ ef85 =====

char __h3000 FUN_ef85(void)

{
  return DAT_60b9 * '\n' + '(';
}


// ===== BankPushSelect @ fe80 =====

/* Kernel API slot $FC9C: push current bank on caller stack, select bank B */

void __h3000 BankPushSelect(undefined1 param_1,undefined1 param_2)

{
  g_curBank = param_2;
  BANK_LATCH = param_2;
  return;
}


// ===== BankPop @ fe9a =====

/* Kernel API slot $FC9E: pop bank pushed by BankPushSelect */

void __h3000 BankPop(void)

{
  undefined1 in_stack_00000002;
  
  g_curBank = in_stack_00000002;
  BANK_LATCH = in_stack_00000002;
  return;
}


// ===== API_FCA0 @ feaf =====

undefined2 __h3000 API_FCA0(undefined1 param_1,undefined1 param_2,undefined1 *param_3)

{
  BANK_LATCH = DAT_600c;
  BANK_LATCH = g_curBank;
  return CONCAT11(param_1,*param_3);
}


// ===== API_FCA2 @ fecc =====

void __h3000 API_FCA2(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined1 *param_4)

{
  BANK_LATCH = DAT_600c;
  *param_4 = param_2;
  BANK_LATCH = g_curBank;
  return;
}


// ===== API_FDDC @ fee9 =====

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


// ===== API_FDDE @ ff16 =====

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


// ===== RingBufInit @ ff4b =====

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


// ===== RingBufPut @ ff65 =====

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


// ===== RingBufGet @ ff98 =====

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


