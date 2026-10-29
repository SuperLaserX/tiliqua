// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block MF8_r1_08000 MF8_r1_08000::0000-MF8_r1_08000::3fff, 136 functions
// Bank r1_08000 (module id F8, sub 03)

// ===== MODULE_F8_03_entry @ MF8_r1_08000::0010 =====

void __h3000 MODULE_F8_03_entry(void)

{
  FUN_MF8_r1_08000__0012 = -FUN_MF8_r1_08000__0012;
  uRAM0017 = 0xe3;
                    /* WARNING: Read-only address (RAM,0x001a) is written */
  uRAM001a = 0;
                    /* WARNING: Read-only address (RAM,0x001d) is written */
  uRAM001d = 0;
                    /* WARNING: Read-only address (RAM,0x0020) is written */
  UNK_MF8_r1_08000__0020 = 0;
                    /* WARNING: Read-only address (RAM,0x0023) is written */
  UNK_MF8_r1_08000__0023 = 0xf3;
  MODULE_F8_04_entry();
  return;
}


// ===== FUN_MF8_r1_08000__0012 @ MF8_r1_08000::0012 =====

void __h3000 FUN_MF8_r1_08000__0012(void)

{
  uRAM0017 = 0xe3;
                    /* WARNING: Read-only address (RAM,0x001a) is written */
  uRAM001a = 0;
                    /* WARNING: Read-only address (RAM,0x001d) is written */
  uRAM001d = 0;
                    /* WARNING: Read-only address (RAM,0x0020) is written */
  UNK_MF8_r1_08000__0020 = 0;
                    /* WARNING: Read-only address (RAM,0x0023) is written */
  UNK_MF8_r1_08000__0023 = 0xf3;
  MODULE_F8_04_entry();
  return;
}


// ===== MODULE_F8_04_entry @ MF8_r1_08000::0036 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0047 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 MODULE_F8_04_entry(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC8C();
  API_FC88();
  API_FDC0(0x69);
                    /* WARNING: Could not recover jumptable at 0x0047. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_MF8_r1_08000__0049 @ MF8_r1_08000::0049 =====

void __h3000 FUN_MF8_r1_08000__0049(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0x90;
  API_FC88();
                    /* inline[API_FC38]: "{1}{2:13}| Soft Functions     " */
  LcdPrintInline();
  API_FDFC();
  FUN_MF8_r1_08000__0119();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
                    /* WARNING: Could not recover jumptable at 0x0084. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0086 @ MF8_r1_08000::0086 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x009c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0086(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$009E(rel) */
  uVar1 = FUN_9cdd();
  API_FDA6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1,0x6980);
                    /* WARNING: Could not recover jumptable at 0x009c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0119 @ MF8_r1_08000::0119 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0148 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0119(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
  bVar1 = 0x3f - (char)in_D;
  DAT_6074 = (ushort)bVar1;
                    /* inline[API_FC16]: 01 08 02 0A 00 00 03 00 $003F $0000 $0000 ->$0000 ->$000A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
                    /* WARNING: Could not recover jumptable at 0x0148. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__014a @ MF8_r1_08000::014a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0159 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__014a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC4A();
                    /* WARNING: Could not recover jumptable at 0x0159. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__015b @ MF8_r1_08000::015b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x01d3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__015b(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0x91;
  API_FC88();
  FUN_MF8_r1_08000__08dd();
  if ((extraout_CC >> 2 & 1) == 0) {
                    /* inline[API_FC38]: "{1}Parameter Modulation not Available." */
    LcdPrintInline();
    DAT_698c = 0;
    DAT_698e = 0;
    DAT_6990 = 0;
    DAT_6992 = 0;
  }
  else {
                    /* inline[API_FC38]: "{1} Modulation of Parameters " */
    LcdPrintInline();
  }
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
  FUN_MF8_r1_08000__0119();
                    /* WARNING: Could not recover jumptable at 0x01d3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__01d5 @ MF8_r1_08000::01d5 =====

void __h3000 FUN_MF8_r1_08000__01d5(void)

{
                    /* inline[API_FC8A]: ->$01E6(rel) "( Patch  )" */
  SoftKeyDefine();
  return;
}


// ===== thunk_FUN_de7e @ MF8_r1_08000::01e6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0xde98 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 thunk_FUN_de7e(undefined2 param_1)

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


// ===== FUN_MF8_r1_08000__01ea @ MF8_r1_08000::01ea =====

void __h3000
FUN_MF8_r1_08000__01ea(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0210(rel) "(Mod=    )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_60fc);
                    /* WARNING: Could not recover jumptable at 0x020e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__01ff @ MF8_r1_08000::01ff =====

void __h3000 FUN_MF8_r1_08000__01ff(void)

{
  char extraout_B;
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_60fc);
                    /* WARNING: Could not recover jumptable at 0x020e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,in_stack_00000002,in_stack_00000004);
  return;
}


// ===== FUN_MF8_r1_08000__0210 @ MF8_r1_08000::0210 =====

void __h3000
FUN_MF8_r1_08000__0210(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  char extraout_B_00;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE7E(param_1,DAT_60fc);
  DAT_60fc = extraout_B_00;
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}Parameter Modulation {6}" */
  LcdPrintInline();
  if (DAT_60fc != '\0') {
    FUN_MF8_r1_08000__100a();
    FUN_MF8_r1_08000__01ff();
    return;
  }
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_60fc);
                    /* WARNING: Could not recover jumptable at 0x020e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0249 @ MF8_r1_08000::0249 =====

void __h3000 FUN_MF8_r1_08000__0249(void)

{
                    /* inline[API_FC8A]: ->$025A(rel) "(ModReset)" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__025a @ MF8_r1_08000::025a =====

void __h3000 FUN_MF8_r1_08000__025a(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE48();
  FUN_MF8_r1_08000__100a();
                    /* inline[API_FC38]: "{2:00}{5:28}Parameter Modulation has been Reset " */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0290. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0292 @ MF8_r1_08000::0292 =====

void __h3000 FUN_MF8_r1_08000__0292(void)

{
                    /* inline[API_FC8A]: ->$02A3(rel) "(Control )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__02a3 @ MF8_r1_08000::02a3 =====

void __h3000
FUN_MF8_r1_08000__02a3(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_6105 == '\0') {
    func_0xfe8a();
  }
  else {
                    /* inline[addr:9CDD]: ->$02EB(rel) */
    FUN_9cdd();
    API_FDC8();
  }
                    /* WARNING: Could not recover jumptable at 0x02b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__02bb @ MF8_r1_08000::02bb =====

void __h3000 FUN_MF8_r1_08000__02bb(void)

{
                    /* inline[API_FC38]: "{1}Control of Parameter Modulation " */
  LcdPrintInline();
  DAT_6030 = API_FDCA;
  DAT_6036 = API_FDCA;
  return;
}


// ===== FUN_MF8_r1_08000__0313 @ MF8_r1_08000::0313 =====

void __h3000 FUN_MF8_r1_08000__0313(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,"et ");
  DAT_608a = extraout_B;
                    /* WARNING: Could not recover jumptable at 0x031f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3);
  return;
}


// ===== FUN_MF8_r1_08000__0321 @ MF8_r1_08000::0321 =====

void __h3000 FUN_MF8_r1_08000__0321(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0x92;
  API_FC88();
                    /* inline[API_FC38]: "{1}MIDI Functions " */
  LcdPrintInline();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
  FUN_MF8_r1_08000__0119();
                    /* WARNING: Could not recover jumptable at 0x0350. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0352 @ MF8_r1_08000::0352 =====

void __h3000 FUN_MF8_r1_08000__0352(void)

{
  undefined2 in_D;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$037E(rel) "(Base=   )" */
  SoftKeyDefine();
  *(ushort *)(in_U + -2) = (DAT_608a & 0xf) + 1;
                    /* inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x037c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__037e @ MF8_r1_08000::037e =====

void __h3000 FUN_MF8_r1_08000__037e(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0x92;
  API_FDF2();
  API_FE32();
  DAT_6074 = (DAT_608a & 0xf) + 1;
                    /* inline[API_FC16]: 01 10 02 64 01 00 02 00 $0010 $0001 $0000 ->$000E ->$0034
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_MF8_r1_08000__03bc();
                    /* WARNING: Could not recover jumptable at 0x03ba. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__03bc @ MF8_r1_08000::03bc =====

void __h3000 FUN_MF8_r1_08000__03bc(void)

{
                    /* inline[API_FC38]: "{2:00}MIDI Base Channel =
                       {5:14}{2:14}{3:60A1}{2:2F}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_MF8_r1_08000__03e4 @ MF8_r1_08000::03e4 =====

void __h3000
FUN_MF8_r1_08000__03e4(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_608a = (char)DAT_6074 - 1U & 0xf | DAT_608a & 0xf0;
  API_FC80();
                    /* WARNING: Could not recover jumptable at 0x0400. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0402 @ MF8_r1_08000::0402 =====

void __h3000 FUN_MF8_r1_08000__0402(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0428(rel) "( Rcv=   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_6116);
                    /* WARNING: Could not recover jumptable at 0x0426. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0428 @ MF8_r1_08000::0428 =====

void __h3000
FUN_MF8_r1_08000__0428(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE7E(param_1,DAT_6116);
  DAT_6116 = extraout_B;
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}All MIDI input {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_MF8_r1_08000__0402();
                    /* WARNING: Could not recover jumptable at 0x045b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__045d @ MF8_r1_08000::045d =====

void __h3000
FUN_MF8_r1_08000__045d(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0484(rel) "(Omni=   )" */
  SoftKeyDefine();
  (*(code *)PTR_ARRAY_f9ee)(extraout_A,DAT_608a & 0x80);
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0482. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__046f @ MF8_r1_08000::046f =====

void __h3000 FUN_MF8_r1_08000__046f(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  code *UNRECOVERED_JUMPTABLE;
  
  (*(code *)PTR_ARRAY_f9ee)(param_1,DAT_608a & 0x80);
                    /* inline[API_FC38]: "{2:38}{5:03}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0482. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,param_3,in_stack_00000002);
  return;
}


// ===== FUN_MF8_r1_08000__0484 @ MF8_r1_08000::0484 =====

void __h3000 FUN_MF8_r1_08000__0484(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  byte bVar1;
  
  bVar1 = DAT_608a ^ 0x80;
  DAT_608a = bVar1;
  (*(code *)PTR_ARRAY_f9ee)(param_1,bVar1 & 0x80);
                    /* inline[API_FC38]: "{2:00}{5:28}We are now in Omni {6} Mode " */
  LcdPrintInline();
  API_FC80(extraout_A,bVar1,param_3,"et ");
  FUN_MF8_r1_08000__046f();
  return;
}


// ===== FUN_MF8_r1_08000__04c5 @ MF8_r1_08000::04c5 =====

void __h3000 FUN_MF8_r1_08000__04c5(void)

{
                    /* inline[API_FC8A]: ->$04D6(rel) "( Expert )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__04d6 @ MF8_r1_08000::04d6 =====

void __h3000 FUN_MF8_r1_08000__04d6(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$04E4(rel) */
  FUN_9cdd();
  API_FDC8();
                    /* WARNING: Could not recover jumptable at 0x04e2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0508 @ MF8_r1_08000::0508 =====

void __h3000 FUN_MF8_r1_08000__0508(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}System Exclusive Functions " */
  LcdPrintInline();
  DAT_6030 = API_FDCA;
  FUN_8f3b();
                    /* WARNING: Could not recover jumptable at 0x0535. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0537 @ MF8_r1_08000::0537 =====

void __h3000
FUN_MF8_r1_08000__0537
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5
          )

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0567(rel) "(Dev =   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  API_FC7C(extraout_A,extraout_B,0x290);
  *(undefined1 *)(param_5 + -1) = extraout_B_00;
  *(undefined1 *)(param_5 + -2) = 0;
                    /* inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0565. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0567 @ MF8_r1_08000::0567 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0567(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  byte bVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0x93;
  API_FDF2();
  uVar1 = API_FE32();
  bVar2 = API_FC7C((char)((ushort)uVar1 >> 8),(char)uVar1,0x290);
  DAT_6074 = (ushort)(bVar2 & 0x7f);
                    /* inline[API_FC16]: 01 01 02 1E 01 00 02 00 $0063 $0000 $0000 ->$000E ->$0046
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_MF8_r1_08000__05a6();
                    /* WARNING: Could not recover jumptable at 0x05a4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__05a6 @ MF8_r1_08000::05a6 =====

void __h3000 FUN_MF8_r1_08000__05a6(void)

{
                    /* inline[API_FC38]: "{2:00}Device Number =    ( System Exclusive )
                       {2:10}{3:60A1}{2:2F}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_MF8_r1_08000__05e0 @ MF8_r1_08000::05e0 =====

void __h3000
FUN_MF8_r1_08000__05e0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80(param_1,(undefined1)DAT_6074,param_3,0x290);
                    /* WARNING: Could not recover jumptable at 0x05ed. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__05ef @ MF8_r1_08000::05ef =====

void __h3000
FUN_MF8_r1_08000__05ef(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0612(rel) "(SysX=   )" */
  SoftKeyDefine();
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_6136);
                    /* WARNING: Could not recover jumptable at 0x0610. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0601 @ MF8_r1_08000::0601 =====

void __h3000 FUN_MF8_r1_08000__0601(void)

{
  char extraout_B;
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_6136);
                    /* WARNING: Could not recover jumptable at 0x0610. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,in_stack_00000002,in_stack_00000004);
  return;
}


// ===== FUN_MF8_r1_08000__0612 @ MF8_r1_08000::0612 =====

void __h3000 FUN_MF8_r1_08000__0612(undefined1 param_1)

{
  undefined1 extraout_B;
  
  API_FE7E(param_1,DAT_6136);
  DAT_6136 = extraout_B;
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}System Exclusive Input {6}" */
  LcdPrintInline();
  API_FC80();
  FUN_MF8_r1_08000__0601();
  return;
}


// ===== FUN_MF8_r1_08000__064d @ MF8_r1_08000::064d =====

void __h3000 FUN_MF8_r1_08000__064d(void)

{
                    /* inline[API_FC8A]: ->$065E(rel) "(  more  )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__065e @ MF8_r1_08000::065e =====

void __h3000 FUN_MF8_r1_08000__065e(void)

{
  API_FDC6();
  return;
}


// ===== FUN_MF8_r1_08000__0663 @ MF8_r1_08000::0663 =====

void __h3000 FUN_MF8_r1_08000__0663(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Expert MIDI Functions " */
  LcdPrintInline();
  DAT_6030 = API_FDCA;
  FUN_8f3b();
                    /* WARNING: Could not recover jumptable at 0x068b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__068d @ MF8_r1_08000::068d =====

void __h3000 FUN_MF8_r1_08000__068d(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$06B3(rel) "(Err=    )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  FUN_f99c(extraout_B + '\x06',DAT_6087);
                    /* WARNING: Could not recover jumptable at 0x06b1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__06b3 @ MF8_r1_08000::06b3 =====

void __h3000 FUN_MF8_r1_08000__06b3(void)

{
  DAT_6087 = 0;
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Overrun Catcher Has been Reset" */
  LcdPrintInline();
  FUN_MF8_r1_08000__068d();
  return;
}


// ===== FUN_MF8_r1_08000__06e5 @ MF8_r1_08000::06e5 =====

void __h3000 FUN_MF8_r1_08000__06e5(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Fixes for MIDI Problems " */
  LcdPrintInline();
  DAT_6030 = API_FDCA;
  FUN_8f3b();
                    /* WARNING: Could not recover jumptable at 0x070f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0711 @ MF8_r1_08000::0711 =====

void __h3000 FUN_MF8_r1_08000__0711(void)

{
                    /* inline[API_FC8A]: ->$0758(rel) "(Off=    )" */
  SoftKeyDefine();
  FUN_MF8_r1_08000__0724();
  return;
}


// ===== FUN_MF8_r1_08000__0724 @ MF8_r1_08000::0724 =====

void __h3000 FUN_MF8_r1_08000__0724(void)

{
  undefined2 in_D;
  short sVar1;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$0744(rel) */
  sVar1 = FUN_9cdd();
  *(ushort *)(in_U + -2) = (CONCAT11(5,DAT_6117 & 3) >> 8) * (ushort)(DAT_6117 & 3) + sVar1;
                    /* inline[API_FC38]: "{2:2D}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0742. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0758 @ MF8_r1_08000::0758 =====

void __h3000 FUN_MF8_r1_08000__0758(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  API_FE32();
  DAT_6074 = (ushort)(DAT_6117 - 1U & 3);
                    /* inline[API_FC16]: 01 40 01 1E 00 00 01 00 $0002 $0000 $0000 ->$0000 ->$0010
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_MF8_r1_08000__07ac();
  FUN_MF8_r1_08000__0724();
                    /* WARNING: Could not recover jumptable at 0x0791. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0793 @ MF8_r1_08000::0793 =====

void __h3000
FUN_MF8_r1_08000__0793(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6117 = (char)DAT_6074 + '\x01';
  API_FC80();
  FUN_MF8_r1_08000__07ac();
  FUN_MF8_r1_08000__0724();
                    /* WARNING: Could not recover jumptable at 0x07aa. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__07ac @ MF8_r1_08000::07ac =====

void __h3000 FUN_MF8_r1_08000__07ac(void)

{
  undefined2 in_D;
  short sVar1;
  byte bVar2;
  short in_U;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Note Off is " */
  LcdPrintInline();
                    /* inline[addr:9CDD]: ->$07E7(rel) */
  sVar1 = FUN_9cdd();
  bVar2 = DAT_6117 - 1U & 3;
  *(ushort *)(in_U + -2) = (CONCAT11(0x16,bVar2) >> 8) * (ushort)bVar2 + sVar1;
                    /* inline[API_FC38]: "{2:11}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x07e5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__0829 @ MF8_r1_08000::0829 =====

void __h3000
FUN_MF8_r1_08000__0829(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  char extraout_B;
  undefined1 extraout_B_00;
  char extraout_B_01;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0863(rel) "(bank=   )" */
  SoftKeyDefine();
  FUN_fa13();
  LcdSetCursor(extraout_A,extraout_B + '\x06');
  API_FC7C(extraout_A_00,extraout_B_00," Reset ");
  if (extraout_B_01 == '\0') {
    LcdPrintInline();
  }
  else {
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0x0861. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__083b @ MF8_r1_08000::083b =====

void __h3000 FUN_MF8_r1_08000__083b(void)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  char extraout_B;
  undefined1 extraout_B_00;
  char extraout_B_01;
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_fa13();
  LcdSetCursor(extraout_A,extraout_B + '\x06');
  API_FC7C(extraout_A_00,extraout_B_00," Reset ");
  if (extraout_B_01 == '\0') {
                    /* inline[API_FC38]: "SyX" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "Par" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0x0861. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,in_stack_00000002,in_stack_00000004);
  return;
}


// ===== FUN_MF8_r1_08000__0863 @ MF8_r1_08000::0863 =====

void __h3000 FUN_MF8_r1_08000__0863(undefined1 param_1,undefined1 param_2)

{
  char extraout_B;
  
  API_FC7C(param_1,param_2," Reset ");
  API_FE7E();
  API_FC80();
  if (extraout_B == '\0') {
                    /* inline[API_FC38]: "{2:00}Bank Select uses System Exclusive (SyX) " */
    LcdPrintInline();
    FUN_MF8_r1_08000__083b();
    return;
  }
                    /* inline[API_FC38]: "{2:00}Bank Select uses MIDI Parameter   (Par) " */
  LcdPrintInline();
  FUN_MF8_r1_08000__083b();
  return;
}


// ===== FUN_MF8_r1_08000__08dd @ MF8_r1_08000::08dd =====

void __h3000
FUN_MF8_r1_08000__08dd(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  char local_8;
  
  local_8 = '\x13';
  pcVar1 = &DAT_6b00;
  do {
    if (*pcVar1 != -1) break;
    pcVar1 = pcVar1 + 0x30;
    local_8 = local_8 + -1;
  } while (local_8 != '\0');
                    /* WARNING: Could not recover jumptable at 0x0900. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0902 @ MF8_r1_08000::0902 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0945 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0902(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC88();
  DAT_6030 = API_FDC6;
  DAT_6036 = API_FDC4;
  FUN_MF8_r1_08000__0119();
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Computer and Sequencer Functions" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0945. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0947 @ MF8_r1_08000::0947 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0967 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0947(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  char *pcVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C();
  if ((char)in_D == '\0') {
    pcVar1 = "MIDI Sequence mode is now Disabled ";
  }
  else {
    pcVar1 = "MIDI Sequence mode is now Enabled ";
  }
  *(char *)(param_3 + -1) = (char)pcVar1;
  *(char *)(param_3 + -2) = (char)((ushort)pcVar1 >> 8);
                    /* inline[API_FC38]: "{2:00}{5:28}{6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0967. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)pcVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__09b0 @ MF8_r1_08000::09b0 =====

void __h3000
FUN_MF8_r1_08000__09b0(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$09D7(rel) "(Seq=    )" */
  SoftKeyDefine();
  FUN_fa13();
  API_FC7C(extraout_B + '\x06',extraout_B + '\x06',"ontrol )");
  FUN_f99c();
                    /* WARNING: Could not recover jumptable at 0x09d5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__09d7 @ MF8_r1_08000::09d7 =====

void __h3000
FUN_MF8_r1_08000__09d7(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,"ontrol )");
  API_FE7E();
  API_FC80();
  MODULE_F8_05_entry();
  API_FDC2();
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}Sequence Mode {6}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0a0d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== MODULE_F8_05_entry @ MF8_r1_08000::0aa1 =====

void __h3000
MODULE_F8_05_entry(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE50();
                    /* WARNING: Could not recover jumptable at 0x0aa7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0aa9 @ MF8_r1_08000::0aa9 =====

void __h3000
FUN_MF8_r1_08000__0aa9(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$0AB7(rel) */
  FUN_9cdd();
  API_FDC8();
                    /* WARNING: Could not recover jumptable at 0x0ab5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0af4 @ MF8_r1_08000::0af4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0b34 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0af4(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC88();
  DAT_6030 = API_FDCA;
  DAT_6036 = API_FDC4;
                    /* inline[API_FC38]: "{1}Enables for Transmitting MIDI Sequences " */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0b34. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0b36 @ MF8_r1_08000::0b36 =====

void __h3000
FUN_MF8_r1_08000__0b36(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0B60(rel) "(Lvls=   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  API_FC7C(extraout_B + '\x06',extraout_B + '\x06',0x293);
  FUN_f99c();
                    /* WARNING: Could not recover jumptable at 0x0b5e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0b60 @ MF8_r1_08000::0b60 =====

void __h3000
FUN_MF8_r1_08000__0b60(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,0x293);
  API_FE7E();
  API_FC80();
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}Outputing Levels Info {6}" */
  LcdPrintInline();
  API_FE50();
  FUN_MF8_r1_08000__0b36();
                    /* WARNING: Could not recover jumptable at 0x0b9d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0b9f @ MF8_r1_08000::0b9f =====

void __h3000
FUN_MF8_r1_08000__0b9f(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0BC9(rel) "(Pgm=    )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  API_FC7C(extraout_B + '\x06',extraout_B + '\x06',FUN_MF8_r1_08000__0292);
  FUN_f99c();
                    /* WARNING: Could not recover jumptable at 0x0bc7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0bc9 @ MF8_r1_08000::0bc9 =====

void __h3000
FUN_MF8_r1_08000__0bc9(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,FUN_MF8_r1_08000__0292);
  API_FE7E();
  API_FC80();
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}Program Info Output {6}" */
  LcdPrintInline();
  API_FE50();
  FUN_MF8_r1_08000__0b9f();
                    /* WARNING: Could not recover jumptable at 0x0c04. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0c06 @ MF8_r1_08000::0c06 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0c42 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0c06(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC88();
  DAT_6030 = API_FDCA;
  DAT_6036 = API_FDC4;
                    /* inline[API_FC38]: "{1}Enables for Receiving MIDI Sequences" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x0c42. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0c44 @ MF8_r1_08000::0c44 =====

void __h3000
FUN_MF8_r1_08000__0c44(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0C6E(rel) "(Lvls=   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  API_FC7C(extraout_B + '\x06',extraout_B + '\x06',0x295);
  FUN_f99c();
                    /* WARNING: Could not recover jumptable at 0x0c6c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0c6e @ MF8_r1_08000::0c6e =====

void __h3000
FUN_MF8_r1_08000__0c6e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,0x295);
  API_FE7E();
  API_FC80();
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}Receiving Levels Info {6}" */
  LcdPrintInline();
  API_FE50();
  FUN_MF8_r1_08000__0c44();
                    /* WARNING: Could not recover jumptable at 0x0cab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0cad @ MF8_r1_08000::0cad =====

void __h3000
FUN_MF8_r1_08000__0cad(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$0CD7(rel) "(Pgm=    )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_fa13();
  API_FC7C(extraout_B + '\x06',extraout_B + '\x06',0x294);
  FUN_f99c();
                    /* WARNING: Could not recover jumptable at 0x0cd5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0cd7 @ MF8_r1_08000::0cd7 =====

void __h3000
FUN_MF8_r1_08000__0cd7(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2,0x294);
  API_FE7E();
  API_FC80();
  API_FE7C();
                    /* inline[API_FC38]: "{2:00}{5:28}Program Info Receiving {6}" */
  LcdPrintInline();
  API_FE50();
  FUN_MF8_r1_08000__0cad();
                    /* WARNING: Could not recover jumptable at 0x0d15. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0d67 @ MF8_r1_08000::0d67 =====

short __h3000 FUN_MF8_r1_08000__0d67(void)

{
  ushort uVar1;
  short sVar2;
  
  uVar1 = (ushort)DAT_611c;
                    /* inline[addr:9CDD]: ->$0D1F(rel) */
  sVar2 = FUN_9cdd();
  return sVar2 + uVar1 * 0x12;
}


// ===== FUN_MF8_r1_08000__0d78 @ MF8_r1_08000::0d78 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0de9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0d78(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  ushort uVar1;
  byte extraout_CC;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = 0;
  DAT_6125 = 0xff;
  uVar1 = FUN_MF8_r1_08000__0d67();
  uVar2 = uVar1;
  FUN_MF8_r1_08000__103e();
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDD6();
    uVar1 = (ushort)(DAT_611c & 3);
    *(ushort *)((short)&DAT_603c + (short)(char)((DAT_611c & 3) << 1)) =
         uVar2 + 0xc + *(short *)(uVar2 + 0xc);
    if (DAT_6105 != '\0') {
      API_FDB8();
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0de9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0d7e @ MF8_r1_08000::0d7e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0de9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0d7e(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  ushort uVar1;
  byte extraout_CC;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = 1;
  DAT_6125 = 0xff;
  uVar1 = FUN_MF8_r1_08000__0d67();
  uVar2 = uVar1;
  FUN_MF8_r1_08000__103e();
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDD6();
    uVar1 = (ushort)(DAT_611c & 3);
    *(ushort *)((short)&DAT_603c + (short)(char)((DAT_611c & 3) << 1)) =
         uVar2 + 0xc + *(short *)(uVar2 + 0xc);
    if (DAT_6105 != '\0') {
      API_FDB8();
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0de9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0d84 @ MF8_r1_08000::0d84 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0de9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0d84(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  ushort uVar1;
  byte extraout_CC;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = 2;
  DAT_6125 = 0xff;
  uVar1 = FUN_MF8_r1_08000__0d67();
  uVar2 = uVar1;
  FUN_MF8_r1_08000__103e();
  if ((extraout_CC >> 2 & 1) != 0) {
    API_FDD6();
    uVar1 = (ushort)(DAT_611c & 3);
    *(ushort *)((short)&DAT_603c + (short)(char)((DAT_611c & 3) << 1)) =
         uVar2 + 0xc + *(short *)(uVar2 + 0xc);
    if (DAT_6105 != '\0') {
      API_FDB8();
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0de9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0d8a @ MF8_r1_08000::0d8a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0de9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0d8a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  ushort uVar1;
  byte extraout_CC;
  ushort uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = 3;
  DAT_6125 = 0xff;
  uVar1 = FUN_MF8_r1_08000__0d67();
  uVar2 = uVar1;
  FUN_MF8_r1_08000__103e();
  if ((extraout_CC >> 2 & 1) != 0) {
                    /* inline[API_FDD6]: $6021 */
    API_FDD6();
    uVar1 = (ushort)(DAT_611c & 3);
    *(ushort *)((short)&DAT_603c + (short)(char)((DAT_611c & 3) << 1)) =
         uVar2 + 0xc + *(short *)(uVar2 + 0xc);
    if (DAT_6105 != '\0') {
      API_FDB8();
                    /* inline[API_FC38]: "(        )" */
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0de9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0deb @ MF8_r1_08000::0deb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0e0c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0deb(undefined2 param_1,undefined2 param_2)

{
  ushort uVar1;
  short in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  if (DAT_6105 == '\0') {
    in_D = FUN_MF8_r1_08000__0d67();
    API_FC3A((char)((ushort)in_D >> 8),8,in_D + 4);
  }
  else {
    FUN_MF8_r1_08000__1318();
                    /* inline[API_FC38]: "{3:60C6}" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0x0e0c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0e0e @ MF8_r1_08000::0e0e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0eac */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0e0e(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = '\0';
  sVar1 = FUN_MF8_r1_08000__0d67();
  API_FE40(0,0,sVar1,*(undefined2 *)(sVar1 + 0x10));
  FUN_MF8_r1_08000__0f45();
  LcdPrintInline();
  API_FDFC();
  FUN_MF8_r1_08000__1047();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (DAT_611c != -1) {
      DAT_6125 = DAT_611c;
      DAT_60fb = DAT_611c + -0x50;
      uVar2 = FUN_MF8_r1_08000__0d67();
      API_FDF2((char)((ushort)uVar2 >> 8),(char)uVar2,uVar2);
      API_FE32();
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
      sVar1 = FUN_MF8_r1_08000__0f18();
      DAT_6074 = sVar1;
      SetupParamEditPage();
      FUN_MF8_r1_08000__1228();
      FUN_MF8_r1_08000__0eae();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0eac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0e14 @ MF8_r1_08000::0e14 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0eac */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0e14(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = '\x01';
  sVar1 = FUN_MF8_r1_08000__0d67();
  API_FE40(0,0,sVar1,*(undefined2 *)(sVar1 + 0x10));
  FUN_MF8_r1_08000__0f45();
  LcdPrintInline();
  API_FDFC();
  FUN_MF8_r1_08000__1047();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (DAT_611c != -1) {
      DAT_6125 = DAT_611c;
      DAT_60fb = DAT_611c + -0x50;
      uVar2 = FUN_MF8_r1_08000__0d67();
      API_FDF2((char)((ushort)uVar2 >> 8),(char)uVar2,uVar2);
      API_FE32();
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
      sVar1 = FUN_MF8_r1_08000__0f18();
      DAT_6074 = sVar1;
      SetupParamEditPage();
      FUN_MF8_r1_08000__1228();
      FUN_MF8_r1_08000__0eae();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0eac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0e1a @ MF8_r1_08000::0e1a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0eac */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0e1a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = '\x02';
  sVar1 = FUN_MF8_r1_08000__0d67();
  API_FE40(0,0,sVar1,*(undefined2 *)(sVar1 + 0x10));
  FUN_MF8_r1_08000__0f45();
  LcdPrintInline();
  API_FDFC();
  FUN_MF8_r1_08000__1047();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (DAT_611c != -1) {
      DAT_6125 = DAT_611c;
      DAT_60fb = DAT_611c + -0x50;
      uVar2 = FUN_MF8_r1_08000__0d67();
      API_FDF2((char)((ushort)uVar2 >> 8),(char)uVar2,uVar2);
      API_FE32();
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
      sVar1 = FUN_MF8_r1_08000__0f18();
      DAT_6074 = sVar1;
      SetupParamEditPage();
      FUN_MF8_r1_08000__1228();
      FUN_MF8_r1_08000__0eae();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0eac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0e20 @ MF8_r1_08000::0e20 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0eac */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0e20(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = '\x03';
  sVar1 = FUN_MF8_r1_08000__0d67();
  API_FE40(0,0,sVar1,*(undefined2 *)(sVar1 + 0x10));
  FUN_MF8_r1_08000__0f45();
                    /* inline[API_FC38]: "{2:00}{5:28}{2:13}|" */
  LcdPrintInline();
  API_FDFC();
  FUN_MF8_r1_08000__1047();
  if ((extraout_CC >> 2 & 1) != 0) {
    if (DAT_611c != -1) {
      DAT_6125 = DAT_611c;
      DAT_60fb = DAT_611c + -0x50;
      uVar2 = FUN_MF8_r1_08000__0d67();
      API_FDF2((char)((ushort)uVar2 >> 8),(char)uVar2,uVar2);
      API_FE32();
                    /* inline[API_FC38]: "{2:1F}=" */
      LcdPrintInline();
      API_FDB8();
      FUN_MF8_r1_08000__0deb();
      sVar1 = FUN_MF8_r1_08000__0f18();
      DAT_6074 = sVar1;
                    /* inline[API_FC16]: 01 04 02 00 01 02 07 00 $2710 $D8F0 $0000 ->$0012 ->$001B
                       $0064 $0001 $0000 */
      SetupParamEditPage();
      FUN_MF8_r1_08000__1228();
      FUN_MF8_r1_08000__0eae();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0eac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0eae @ MF8_r1_08000::0eae =====

void __h3000 FUN_MF8_r1_08000__0eae(void)

{
                    /* inline[API_FC38]: "{2:21}{3:609C}" */
  LcdPrintInline();
  return;
}


// ===== FUN_MF8_r1_08000__0eb9 @ MF8_r1_08000::0eb9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0ef9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0eb9(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  char cVar1;
  undefined2 in_D;
  char *pcVar2;
  undefined1 uVar3;
  char *pcVar4;
  undefined2 *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  char local_c;
  
  puVar5 = param_3;
  pcVar2 = (char *)FUN_MF8_r1_08000__0d67();
  uVar3 = SUB21(pcVar2,0);
  cVar1 = (char)((ushort)DAT_6074 >> 8);
  FUN_MF8_r1_08000__0f2d(cVar1);
  API_FE40(cVar1 >> 1);
  FUN_MF8_r1_08000__0efb((char)((ushort)DAT_6074 >> 8));
  pcVar4 = &DAT_6b00;
  local_c = '\x13';
  do {
    if (*pcVar2 == *pcVar4) {
      *(undefined2 *)(pcVar4 + 0x16) = *puVar5;
    }
    pcVar4 = pcVar4 + 0x30;
    local_c = local_c + -1;
  } while (local_c != '\0');
                    /* WARNING: Could not recover jumptable at 0x0ef9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_MF8_r1_08000__0efb @ MF8_r1_08000::0efb =====

void __h3000 FUN_MF8_r1_08000__0efb(void)

{
  undefined2 in_D;
  short in_U;
  
  *(byte *)(in_U + -1) = (byte)in_D << 1;
  *(byte *)(in_U + -2) = (char)((ushort)in_D >> 8) << 1 | (byte)in_D >> 7;
  *(undefined1 *)(in_U + -3) = 0xda;
  *(undefined1 *)(in_U + -4) = 0x68;
  API_FCF2();
  return;
}


// ===== FUN_MF8_r1_08000__0f09 @ MF8_r1_08000::0f09 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0f16 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0f09(short param_1,undefined2 param_2,undefined2 *param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_1;
  FUN_MF8_r1_08000__0f18();
  FUN_MF8_r1_08000__0efb();
  *(undefined2 *)(sVar1 + 0x16) = *param_3;
                    /* WARNING: Could not recover jumptable at 0x0f16. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3 + 1);
  return;
}


// ===== FUN_MF8_r1_08000__0f18 @ MF8_r1_08000::0f18 =====

void __h3000
FUN_MF8_r1_08000__0f18(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = API_FC7E(param_1,DAT_611c << 1,DAT_6106 + 0x38 + (short)(char)(DAT_611c << 1));
                    /* WARNING: Could not recover jumptable at 0x0f2b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,uVar1,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__0f2d @ MF8_r1_08000::0f2d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0f43 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0f2d(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  API_FC82(uVar1,(char)in_D,param_1,DAT_6106 + 0x38 + (short)(char)(DAT_611c << 1));
                    /* WARNING: Could not recover jumptable at 0x0f43. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__0f45 @ MF8_r1_08000::0f45 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0fa1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0f45(short param_1,undefined2 param_2)

{
  undefined2 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  char *pcVar2;
  char *pcVar3;
  char *pcVar4;
  undefined2 local_8;
  undefined1 uStack_6;
  undefined1 uStack_5;
  short sStack_4;
  undefined2 uStack_2;
  
  pcVar2 = &uStack_6;
  uStack_6 = (undefined1)((ushort)in_D >> 8);
  local_8 = 0xf4a;
  uStack_5 = (char)in_D;
  sStack_4 = param_1;
  uStack_2 = param_2;
  FUN_MF8_r1_08000__1055();
  if ((extraout_CC >> 2 & 1) != 0) {
    pcVar2 = &DAT_6b00;
    local_8 = CONCAT11(0x13,(undefined1)local_8);
    pcVar3 = (char *)&local_8;
    do {
      pcVar4 = pcVar3;
      if (*(char *)(param_1 + 1) == *pcVar2) {
        uVar1 = *(undefined2 *)(pcVar2 + 0x11);
        *(char *)((short)pcVar3 + -1) = (char)uVar1;
        *(char *)((short)pcVar3 + -2) = (char)((ushort)uVar1 >> 8);
        pcVar4 = (char *)((short)pcVar3 + -3);
        *(undefined1 *)((short)pcVar3 + -3) = DAT_6024;
        *(undefined2 *)((short)pcVar3 + -5) = 0xf6e;
        API_FE4E();
      }
      pcVar2 = pcVar2 + 0x30;
      *pcVar4 = *pcVar4 + -1;
      pcVar3 = pcVar4;
    } while (*pcVar4 != '\0');
    pcVar2 = pcVar4 + 2;
                    /* inline[API_FC38]: "{2:15} --- Triggered --- " */
    *(char **)pcVar4 = "\x02\x15 --- Triggered --- ";
    LcdPrintInline();
    pcVar4[0] = '\x0f';
    pcVar4[1] = -0x6a;
    API_FE4A();
    pcVar4[0] = '\x0f';
    pcVar4[1] = -0x67;
    FUN_MF8_r1_08000__1047();
    if (!(bool)(extraout_CC_00 >> 2 & 1)) {
      DAT_611c = DAT_6125;
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0fa1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(code **)(pcVar2 + 6))
            ((char)((ushort)*(undefined2 *)pcVar2 >> 8),(char)in_D,*(undefined2 *)(pcVar2 + 2),
             *(undefined2 *)(pcVar2 + 4));
  return;
}


// ===== FUN_MF8_r1_08000__0fa3 @ MF8_r1_08000::0fa3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1008 */
/* WARNING: Removing unreachable block (RAM,0x0ffe) */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__0fa3(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  char *pcVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  char *pcVar2;
  char *pcVar3;
  code *UNRECOVERED_JUMPTABLE;
  char local_a;
  char local_9;
  
  local_9 = -1;
  pcVar1 = (char *)0x0;
  do {
    DAT_611c = (char)pcVar1;
    pcVar1 = (char *)FUN_MF8_r1_08000__0d67();
    local_a = '\x13';
    pcVar2 = &DAT_6b00;
    pcVar3 = pcVar1;
    do {
      if (*pcVar2 == pcVar3[1]) {
        local_9 = '\0';
      }
      if (*pcVar2 == *pcVar3) {
        local_9 = '\0';
        FUN_MF8_r1_08000__0f09();
      }
      pcVar2 = pcVar2 + 0x30;
      local_a = local_a + -1;
    } while (local_a != '\0');
  } while (DAT_611c != '\x03');
  if (local_9 == '\0') {
    MODULE_F8_04_entry();
    FUN_8f3b();
    pcVar1 = (char *)0x0;
    do {
      do {
        DAT_611c = '\0';
        FUN_MF8_r1_08000__1047();
      } while ((extraout_CC >> 2 & 1) == 0);
      FUN_MF8_r1_08000__1055();
    } while ((extraout_CC_00 >> 2 & 1) != 0);
    (*DAT_603c)();
  }
                    /* WARNING: Could not recover jumptable at 0x1008. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)pcVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__100a @ MF8_r1_08000::100a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x103c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__100a(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  char *pcVar1;
  char *pcVar2;
  char *pcVar3;
  code *UNRECOVERED_JUMPTABLE;
  char local_8;
  
  pcVar1 = (char *)0x0;
  do {
    DAT_611c = (char)pcVar1;
    pcVar1 = (char *)FUN_MF8_r1_08000__0d67();
    local_8 = '\x13';
    pcVar2 = &DAT_6b00;
    pcVar3 = pcVar1;
    do {
      if (*pcVar2 == *pcVar3) {
        FUN_MF8_r1_08000__0f09();
      }
      pcVar2 = pcVar2 + 0x30;
      local_8 = local_8 + -1;
    } while (local_8 != '\0');
  } while (DAT_611c != '\x03');
                    /* WARNING: Could not recover jumptable at 0x103c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)pcVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__103e @ MF8_r1_08000::103e =====

void __h3000 FUN_MF8_r1_08000__103e(void)

{
  byte extraout_CC;
  
  FUN_MF8_r1_08000__1047();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    FUN_MF8_r1_08000__1055();
  }
  return;
}


// ===== FUN_MF8_r1_08000__1047 @ MF8_r1_08000::1047 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1053 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__1047(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_MF8_r1_08000__0d67();
  FUN_MF8_r1_08000__1063();
                    /* WARNING: Could not recover jumptable at 0x1053. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__1055 @ MF8_r1_08000::1055 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1061 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__1055(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_MF8_r1_08000__0d67();
  FUN_MF8_r1_08000__1063();
                    /* WARNING: Could not recover jumptable at 0x1061. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__1063 @ MF8_r1_08000::1063 =====

undefined2 __h3000 FUN_MF8_r1_08000__1063(undefined1 param_1,char param_2)

{
  char *pcVar1;
  char local_8;
  undefined2 uStack_6;
  
  uStack_6 = CONCAT11(param_1,param_2);
  local_8 = '\x13';
  pcVar1 = &DAT_6b00;
  do {
    if (*pcVar1 == param_2) {
      return uStack_6;
    }
    pcVar1 = pcVar1 + 0x30;
    local_8 = local_8 + -1;
  } while (local_8 != '\0');
  return uStack_6;
}


// ===== FUN_MF8_r1_08000__1085 @ MF8_r1_08000::1085 =====

undefined1 __h3000 FUN_MF8_r1_08000__1085(undefined1 param_1,undefined1 param_2)

{
  if (DAT_6105 != '\0') {
                    /* inline[API_FC8A]: ->$10A2(rel) "(SoftFunc)" */
    SoftKeyDefine(param_1,DAT_60b9);
  }
  return param_2;
}


// ===== FUN_MF8_r1_08000__10a2 @ MF8_r1_08000::10a2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x10cf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__10a2(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6036 = API_FDC4;
  DAT_611c = 0;
  DAT_6074 = 0;
                    /* inline[addr:9CDD]: ->$10D1(rel) */
  FUN_9cdd();
  API_FDC8();
  DAT_60b9 = 0;
  FUN_MF8_r1_08000__10ff();
  DAT_611c = 0;
  DAT_6030 = API_FDCA;
                    /* WARNING: Could not recover jumptable at 0x10cf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__10e7 @ MF8_r1_08000::10e7 =====

undefined2 __h3000 FUN_MF8_r1_08000__10e7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$10FF(rel) "( Select )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_4;
}


// ===== FUN_MF8_r1_08000__10ff @ MF8_r1_08000::10ff =====

undefined2 __h3000 FUN_MF8_r1_08000__10ff(void)

{
  undefined2 in_D;
  
  API_FDF2();
  API_FE32();
  DAT_6074 = (short)(char)(DAT_611c + '\x01');
                    /* inline[API_FC16]: 01 50 01 64 03 00 01 00 $0004 $0001 $0000 ->$0000 ->$000D
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_MF8_r1_08000__1135();
  return in_D;
}


// ===== FUN_MF8_r1_08000__1135 @ MF8_r1_08000::1135 =====

void __h3000 FUN_MF8_r1_08000__1135(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_611c = (char)DAT_6074 + -1;
  FUN_MF8_r1_08000__12b7();
                    /* WARNING: Could not recover jumptable at 0x1141. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__1143 @ MF8_r1_08000::1143 =====

undefined2 __h3000 FUN_MF8_r1_08000__1143(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$115B(rel) "(  Name  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_4;
}


// ===== FUN_MF8_r1_08000__115b @ MF8_r1_08000::115b =====

void __h3000
FUN_MF8_r1_08000__115b(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDC6();
  API_FE64(0xb,8);
                    /* WARNING: Could not recover jumptable at 0x1169. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__116b @ MF8_r1_08000::116b =====

undefined2 __h3000 FUN_MF8_r1_08000__116b(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$1183(rel) "(  Sens  )" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_4;
}


// ===== FUN_MF8_r1_08000__1183 @ MF8_r1_08000::1183 =====

undefined2 __h3000 FUN_MF8_r1_08000__1183(void)

{
  undefined2 in_D;
  byte bVar1;
  
  API_FDF2();
  API_FE32();
  bVar1 = FUN_MF8_r1_08000__1269();
  DAT_6074 = (short)(char)(bVar1 & 7);
                    /* inline[API_FC16]: 01 28 01 64 02 00 01 00 $0007 $0000 $0000 ->$0000 ->$000B
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  return in_D;
}


// ===== FUN_MF8_r1_08000__11b8 @ MF8_r1_08000::11b8 =====

void __h3000
FUN_MF8_r1_08000__11b8(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  byte extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_MF8_r1_08000__1269();
  FUN_MF8_r1_08000__127e(extraout_A,extraout_B & 8 | (byte)DAT_6074);
  FUN_MF8_r1_08000__12b7();
  FUN_MF8_r1_08000__12b6();
                    /* WARNING: Could not recover jumptable at 0x11cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__11cd @ MF8_r1_08000::11cd =====

undefined2 __h3000 FUN_MF8_r1_08000__11cd(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
                    /* inline[API_FC8A]: ->$11E5(rel) "(Polarity)" */
  SoftKeyDefine(param_1,DAT_60b9);
  return uStack_4;
}


// ===== FUN_MF8_r1_08000__11e5 @ MF8_r1_08000::11e5 =====

void __h3000
FUN_MF8_r1_08000__11e5(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  byte extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_MF8_r1_08000__1269();
  FUN_MF8_r1_08000__127e(extraout_A,extraout_B ^ 8);
  FUN_MF8_r1_08000__12b7();
  FUN_MF8_r1_08000__12b6();
                    /* WARNING: Could not recover jumptable at 0x11f5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__11f7 @ MF8_r1_08000::11f7 =====

void __h3000 FUN_MF8_r1_08000__11f7(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$120E(rel) "(  Done  )" */
  SoftKeyDefine(param_1,DAT_60b9);
                    /* WARNING: Could not recover jumptable at 0x120c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(extraout_A,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__120e @ MF8_r1_08000::120e =====

void __h3000
FUN_MF8_r1_08000__120e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE66();
  FUN_MF8_r1_08000__133d();
  FUN_MF8_r1_08000__132c();
  API_FDC6();
  DAT_60b9 = 0;
  FUN_MF8_r1_08000__10ff();
                    /* WARNING: Could not recover jumptable at 0x1226. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__1228 @ MF8_r1_08000::1228 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1267 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__1228(undefined2 param_1,undefined2 param_2)

{
  ushort uVar1;
  byte bVar2;
  ushort in_D;
  ushort uVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined2 local_8;
  
  uVar1 = in_D >> 8;
  if (DAT_6105 != '\0') {
                    /* inline[addr:9CDD]: ->$1296(rel) */
    in_D = FUN_9cdd();
    uVar3 = in_D;
    FUN_MF8_r1_08000__1269();
    local_8 = *(ushort *)(uVar3 + (short)(char)(((byte)in_D & 7) * '\x04' + '\x02'));
    if ((in_D & 8) == 0) {
      DAT_606e = 0;
      bVar2 = (byte)(local_8 >> 8);
      local_8 = CONCAT11(bVar2 >> 1,(char)local_8 >> 1 | bVar2 << 7);
      in_D = local_8;
    }
    DAT_60dc = local_8;
    API_FC14();
  }
                    /* WARNING: Could not recover jumptable at 0x1267. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__1269 @ MF8_r1_08000::1269 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x127c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__1269(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = DAT_611c;
  API_FC7C(0,DAT_611c,DAT_6106 + (ushort)DAT_611c);
                    /* WARNING: Could not recover jumptable at 0x127c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__127e @ MF8_r1_08000::127e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1294 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__127e(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC80();
                    /* WARNING: Could not recover jumptable at 0x1294. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__12b6 @ MF8_r1_08000::12b6 =====

void __h3000 FUN_MF8_r1_08000__12b6(void)

{
  return;
}


// ===== FUN_MF8_r1_08000__12b7 @ MF8_r1_08000::12b7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1316 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__12b7(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  byte bVar3;
  short sVar4;
  undefined1 *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$1296(rel) */
  sVar2 = FUN_9cdd();
  sVar4 = sVar2;
  FUN_MF8_r1_08000__1269();
  uVar1 = *(undefined2 *)(sVar4 + (char)(((byte)sVar2 & 7) << 2));
  *(char *)(param_3 + -1) = (char)uVar1;
  puVar5 = (undefined1 *)(param_3 + -2);
  *puVar5 = (char)((ushort)uVar1 >> 8);
  FUN_MF8_r1_08000__1318();
  puVar5[-1] = DAT_611c + '\x01';
  puVar5[-2] = 0;
                    /* inline[API_FC38]: "{2:00}Soft {4:2000}{3:60AC} is "{2:0B}{3:60C6}" Sens=
                       {4:0000}{3:60A9} Pol= +{5:01}" */
  LcdPrintInline();
  bVar3 = FUN_MF8_r1_08000__1269();
  if ((bVar3 & 8) != 0) {
                    /* inline[API_FC38]: "-" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0x1316. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar3,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__1318 @ MF8_r1_08000::1318 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x132a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__1318(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 *puVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_MF8_r1_08000__133d();
  puVar1 = &DAT_60c6;
  FUN_a7ba(0);
  *(undefined1 *)puVar1 = 0;
                    /* WARNING: Could not recover jumptable at 0x132a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__132c @ MF8_r1_08000::132c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x133b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__132c(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_a7d2(0,8,&DAT_60c6,param_1);
                    /* WARNING: Could not recover jumptable at 0x133b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__133d @ MF8_r1_08000::133d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x134d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__133d(void)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = (CONCAT11(8,DAT_611c) >> 8) * (ushort)DAT_611c;
                    /* WARNING: Could not recover jumptable at 0x134d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,DAT_6106 + sVar1 + 8);
  return;
}


// ===== MODULE_F8_05_entry @ MF8_r1_08000::1357 =====

void __h3000 MODULE_F8_05_entry(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xa2;
  API_FC88();
  DAT_6036 = API_FDC4;
  DAT_6030 = API_FDC6;
  FUN_MF8_r1_08000__0119();
                    /* inline[API_FC38]: "{1}MIDI Program Change Functions" */
  LcdPrintInline();
  if (DAT_611a != '\0') {
                    /* inline[API_FC38]: "{2:1C}<SEQUENCED>" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0x13ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__13ad @ MF8_r1_08000::13ad =====

void __h3000 FUN_MF8_r1_08000__13ad(undefined1 param_1,undefined1 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$13C7(rel) "( Pgm=   )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_MF8_r1_08000__14a9();
                    /* WARNING: Could not recover jumptable at 0x13c5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__13c7 @ MF8_r1_08000::13c7 =====

void __h3000
FUN_MF8_r1_08000__13c7(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_611a == '\0') {
    API_FC7C(param_1,param_2,"t ");
    API_FE7E();
    API_FC80();
                    /* inline[API_FE5E]: $1482 $1459 */
    API_FE5E();
                    /* inline[API_FC38]: "{2:00}{5:28}{6}" */
    LcdPrintInline();
    FUN_MF8_r1_08000__14a9();
  }
  else {
    FUN_MF8_r1_08000__13fa();
  }
                    /* WARNING: Could not recover jumptable at 0x13f4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__13fa @ MF8_r1_08000::13fa =====

void __h3000 FUN_MF8_r1_08000__13fa(void)

{
                    /* inline[API_FC38]: "{1}Changing this is not allowed because    Program
                       Sequencing Reception is Enabled " */
  LcdPrintInline();
  API_FE4A();
  API_FDC2();
  return;
}


// ===== FUN_MF8_r1_08000__14a9 @ MF8_r1_08000::14a9 =====

void __h3000
FUN_MF8_r1_08000__14a9(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  char extraout_B_00;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor(param_1,0x38);
  if (DAT_611a == '\0') {
    API_FC7C(extraout_A,extraout_B,"t ");
    if (extraout_B_00 != '\0') {
                    /* inline[API_FC38]: "Map" */
      LcdPrintInline();
      goto LAB_MF8_r1_08000__14d2;
    }
  }
                    /* inline[API_FC38]: "ID " */
  LcdPrintInline();
LAB_MF8_r1_08000__14d2:
                    /* WARNING: Could not recover jumptable at 0x14d2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__14d4 @ MF8_r1_08000::14d4 =====

void __h3000
FUN_MF8_r1_08000__14d4
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5
          )

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC8A]: ->$14FE(rel) "(Bank=   )" */
  SoftKeyDefine();
  API_FC7E(extraout_A,extraout_B,"ntrol )");
  *(undefined1 *)(param_5 + -1) = extraout_B_00;
  *(undefined1 *)(param_5 + -2) = extraout_A_00;
                    /* inline[API_FC38]: "{2:4D}{4:2000}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x14fc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__14fe @ MF8_r1_08000::14fe =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1533 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__14fe(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FDF2();
  uVar1 = API_FE32();
  uVar1 = API_FC7E((char)((ushort)uVar1 >> 8),(char)uVar1,"ntrol )");
  DAT_6074 = uVar1;
                    /* inline[API_FC16]: 01 10 02 64 01 00 02 00 $000A $0000 $0000 ->$000E ->$0039
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_MF8_r1_08000__1535();
                    /* WARNING: Could not recover jumptable at 0x1533. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__1535 @ MF8_r1_08000::1535 =====

void __h3000 FUN_MF8_r1_08000__1535(void)

{
                    /* inline[API_FC38]: "{2:00}MIDI Program Change Bank =
                       {5:0D}{3:60A1}{2:4D}{3:60A1}" */
  LcdPrintInline();
  return;
}


// ===== FUN_MF8_r1_08000__1562 @ MF8_r1_08000::1562 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x156f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_MF8_r1_08000__1562(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)DAT_6074;
  API_FC82((char)((ushort)DAT_6074 >> 8),uVar1,param_1,"ntrol )");
                    /* WARNING: Could not recover jumptable at 0x156f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2);
  return;
}


// ===== FUN_MF8_r1_08000__1571 @ MF8_r1_08000::1571 =====

void __h3000 FUN_MF8_r1_08000__1571(undefined1 param_1)

{
                    /* inline[API_FC8A]: ->$1588(rel) "(        )" */
  SoftKeyDefine(param_1,DAT_60b9);
  FUN_MF8_r1_08000__15c3();
  return;
}


// ===== FUN_MF8_r1_08000__1588 @ MF8_r1_08000::1588 =====

void __h3000
FUN_MF8_r1_08000__1588(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  byte extraout_B;
  undefined1 extraout_B_00;
  char extraout_B_01;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_611a == '\0') {
    API_FC7C(param_1,param_2," ");
    API_FE7E();
    API_FC80();
    API_FE7C(extraout_A,~extraout_B);
                    /* inline[API_FC38]: "{2:00}{5:28}MIDI Program Change {6}" */
    LcdPrintInline();
    API_FC7C(extraout_A_00,extraout_B_00," ");
    if ((extraout_B_01 == '\0') || (DAT_611a != '\0')) {
      LcdPrintInline();
    }
    else {
      API_FC80(extraout_A_01,1);
      LcdPrintInline();
    }
  }
  else {
    FUN_MF8_r1_08000__13fa();
  }
                    /* WARNING: Could not recover jumptable at 0x15fe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__15c3 @ MF8_r1_08000::15c3 =====

void __h3000 FUN_MF8_r1_08000__15c3(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  char extraout_B;
  undefined1 in_stack_00000000;
  undefined1 in_stack_00000001;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(param_1,param_2," ");
  if ((extraout_B == '\0') || (DAT_611a != '\0')) {
                    /* inline[API_FC38]: "{2:3C}( Pgm=On )" */
    LcdPrintInline();
  }
  else {
    API_FC80(extraout_A,1);
                    /* inline[API_FC38]: "{2:3C}( Pgm=Off)" */
    LcdPrintInline();
  }
                    /* WARNING: Could not recover jumptable at 0x15fe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(in_stack_00000000,in_stack_00000001,in_stack_00000002,in_stack_00000004);
  return;
}


// ===== FUN_MF8_r1_08000__1605 @ MF8_r1_08000::1605 =====

void __h3000 FUN_MF8_r1_08000__1605(void)

{
                    /* inline[API_FC8A]: ->$1616(rel) "( Dumps  )" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__1616 @ MF8_r1_08000::1616 =====

void __h3000
FUN_MF8_r1_08000__1616(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$1624(rel) */
  FUN_9cdd();
  API_FDC8();
                    /* WARNING: Could not recover jumptable at 0x1622. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__1630 @ MF8_r1_08000::1630 =====

void __h3000 FUN_MF8_r1_08000__1630(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_60fb = 0xa6;
  API_FC88();
  DAT_6036 = API_FDCA;
  DAT_6030 = API_FDCA;
                    /* inline[API_FC38]: "{1}Dump Data Functions " */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x165e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_MF8_r1_08000__1660 @ MF8_r1_08000::1660 =====

void __h3000 FUN_MF8_r1_08000__1660(void)

{
                    /* inline[API_FC8A]: ->$1671(rel) "(DumpEdit)" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__1671 @ MF8_r1_08000::1671 =====

void __h3000
FUN_MF8_r1_08000__1671(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Sending Current Edited Program to MIDI " */
  LcdPrintInline();
  API_FE46();
  API_FDC2();
                    /* inline[API_FC38]: "{2:00}Current Edit has been sent to MIDI      " */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x16d7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__16d9 @ MF8_r1_08000::16d9 =====

void __h3000 FUN_MF8_r1_08000__16d9(void)

{
                    /* inline[API_FC8A]: ->$16EA(rel) "(Dump Pre)" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__16ea @ MF8_r1_08000::16ea =====

void __h3000
FUN_MF8_r1_08000__16ea(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Sending Presets to MIDI " */
  LcdPrintInline();
  API_FE42();
  API_FDC2();
                    /* inline[API_FC38]: "{2:00}The Presets have been sent to MIDI      " */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1741. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_MF8_r1_08000__1743 @ MF8_r1_08000::1743 =====

void __h3000 FUN_MF8_r1_08000__1743(void)

{
                    /* inline[API_FC8A]: ->$1754(rel) "(Dump Map)" */
  SoftKeyDefine();
  return;
}


// ===== FUN_MF8_r1_08000__1754 @ MF8_r1_08000::1754 =====

void __h3000
FUN_MF8_r1_08000__1754(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FC38]: "{1}Sending Map Table to MIDI " */
  LcdPrintInline();
  API_FE44();
  API_FDC2();
                    /* inline[API_FC38]: "{2:00}The Map Table has been sent to MIDI     " */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x17ad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


