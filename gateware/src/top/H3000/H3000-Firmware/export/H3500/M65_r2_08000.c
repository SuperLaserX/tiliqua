// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M65_r2_08000 M65_r2_08000::0000-M65_r2_08000::3fff, 271 functions
// Bank r2_08000 (module id 65, sub 02)

// ===== MODULE_65_02_entry @ M65_r2_08000::0010 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 MODULE_65_02_entry(void)

{
  short sVar1;
  undefined2 in_D;
  
  sVar1 = g_moduleBase + 0x5e;
  API_FD08((char)((ushort)sVar1 >> 8),(char)sVar1,g_moduleBase + 0x2f,&LAB_6600,sVar1);
  return in_D;
}


// ===== FUN_M65_r2_08000__002f @ M65_r2_08000::002f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x004f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M65_r2_08000__002f(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_710a == 0) {
                    /* inline[API_FC62]: $6013 */
    ModuleStorePtr(0);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x004f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
    return (code *)((ushort)in_D & 0xff);
  }
  API_FD76();
  Io80A7_Set();
  if (in_stack_00000000 < '\0') {
    in_D = UNRECOVERED_JUMPTABLE;
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__005e @ M65_r2_08000::005e =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M65_r2_08000__005e(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7120 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7122 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7124 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7126 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7128 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_713c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_712e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7130 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7136 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7138 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_713a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70c4 >> 8));
  if (_DAT_7154 == 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7132 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7134 >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70c6 >> 8));
  }
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0xf);
  DAT_710a = 0xffff;
  API_FD76();
  return in_D;
}


// ===== FUN_M65_r2_08000__01a5 @ M65_r2_08000::01a5 =====

undefined2 __h3000 FUN_M65_r2_08000__01a5(void)

{
  undefined2 in_D;
  
  DAT_7048 = 0;
  DAT_7050 = 0;
  DAT_7058 = 0;
  DAT_7060 = 0;
  DAT_7068 = 0;
  DAT_7070 = 0;
  DAT_7078 = 0;
  DAT_7098 = 0;
  DAT_70a0 = 0;
  DAT_70a8 = 0;
  DAT_70b0 = 0;
  DAT_70b8 = 0;
  DAT_7080 = 0;
  DAT_7086 = 0;
  DAT_708c = 0;
  DAT_7092 = 0;
  return in_D;
}


// ===== FUN_M65_r2_08000__01dd @ M65_r2_08000::01dd =====

undefined2 __h3000 FUN_M65_r2_08000__01dd(void)

{
  undefined2 in_D;
  
  DAT_7008 = 0;
  DAT_70c4 = 100;
  DAT_70f4 = 0xffff;
  DAT_70ca = 0xffff;
  DAT_7134 = 3;
  DAT_7144 = 0x79c;
  DAT_7146 = 0x78d0;
  LoadParamsSigned();
  LoadParamsScaled();
  LoadParamsScaled();
  LoadParamsScaled();
  LoadParamsScaled();
  LoadParamsSigned();
  return in_D;
}


// ===== FUN_M65_r2_08000__01fc @ M65_r2_08000::01fc =====

short __h3000 FUN_M65_r2_08000__01fc(void)

{
  short in_D;
  undefined2 uStack_6;
  
  uStack_6 = in_D << 8;
                    /* WARNING: Read-only address (RAM,0x009c) is written */
  uRAM009c = 0x10;
  DAT_7146 = 0x78d0;
  DAT_7144 = in_D;
                    /* inline[API_FE04]: 19:7E 1A:84 1B:8A 1C:90 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 45:46 47:4C 31:4E 33:54 49:56 4B:5C 35:5E 37:64 49:AE 35:B6
                       4B:B4 59:06 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 51:6E 53:74 3D:76 3F:7C 4D:9E 4F:A4 39:A6 3B:AC 3D:66 3F:6C
                       39:96 3B:9C 37:BC */
  LoadParamsScaled();
                    /* inline[API_FE08]: 5B:16 5D:18 5F:1A 61:1C 63:1E 65:20 67:22 69:24 6B:26 6D:28
                       6F:2A 71:2C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 73:2E 75:30 77:32 79:34 7B:36 7D:38 7F:3A 81:3C 83:3E 85:40
                       87:42 89:44 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 41:BE 42:C0 43:C8 44:C2 31:00 32:02 33:04 8B:CC */
  LoadParamsSigned();
  return uStack_6;
}


// ===== FUN_M65_r2_08000__02a4 @ M65_r2_08000::02a4 =====

undefined2 __h3000 FUN_M65_r2_08000__02a4(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M65_r2_08000__2751();
  FUN_M65_r2_08000__27cc();
  FUN_M65_r2_08000__2847();
  FUN_M65_r2_08000__28c2();
  FUN_M65_r2_08000__260d();
  FUN_M65_r2_08000__26bb();
  FUN_M65_r2_08000__2405();
  FUN_M65_r2_08000__24b0();
  return uStack_8;
}


// ===== FUN_M65_r2_08000__02c1 @ M65_r2_08000::02c1 =====

undefined2 __h3000 FUN_M65_r2_08000__02c1(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  byte extraout_CC;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  stack0xfff9 = CONCAT12(param_2,param_3);
  _auStack_8 = CONCAT13(param_1,stack0xfff9);
  FUN_M65_r2_08000__039f();
  DspLoadProgram(extraout_A,3,0x312);
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M65_r2_08000__03cb();
    return auStack_8;
  }
  LcdSetCursor(extraout_A_00,0);
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M65_r2_08000__02d9 @ M65_r2_08000::02d9 =====

undefined2 __h3000 FUN_M65_r2_08000__02d9(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  byte extraout_CC;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  stack0xfff9 = CONCAT12(param_2,param_3);
  _auStack_8 = CONCAT13(param_1,stack0xfff9);
  FUN_M65_r2_08000__039f();
  DspLoadProgram(extraout_A,3,0x412);
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M65_r2_08000__03cb();
    return auStack_8;
  }
  LcdSetCursor(extraout_A_00,0);
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M65_r2_08000__02f1 @ M65_r2_08000::02f1 =====

undefined2 __h3000 FUN_M65_r2_08000__02f1(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  byte extraout_CC;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  stack0xfff9 = CONCAT12(param_2,param_3);
  _auStack_8 = CONCAT13(param_1,stack0xfff9);
  FUN_M65_r2_08000__039f();
  DspLoadProgram(extraout_A,3,0x412);
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M65_r2_08000__03cb();
    return auStack_8;
  }
  LcdSetCursor(extraout_A_00,0);
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M65_r2_08000__0309 @ M65_r2_08000::0309 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x031d */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M65_r2_08000__0309(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  uVar2 = (undefined1)in_D;
  stack0xfff9 = CONCAT12(uVar2,param_1);
  uVar1 = (undefined1)((ushort)in_D >> 8);
  _auStack_8 = CONCAT13(uVar1,stack0xfff9);
  DspLoadProgram();
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar2,0x411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar2,0x812);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        API_FD76();
        API_FD7C();
        API_FD20(0);
        API_FD2E((char)((ushort)_DAT_7154 >> 8));
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_714e >> 8));
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_714a >> 8));
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_7150 >> 8));
        return auStack_8;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M65_r2_08000__0387 @ M65_r2_08000::0387 =====

undefined2 __h3000 FUN_M65_r2_08000__0387(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  byte extraout_CC;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  stack0xfff9 = CONCAT12(param_2,param_3);
  _auStack_8 = CONCAT13(param_1,stack0xfff9);
  FUN_M65_r2_08000__039f();
  DspLoadProgram(extraout_A,3,&BYTE_M65_r2_08000__0212);
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M65_r2_08000__03cb();
    return auStack_8;
  }
  LcdSetCursor(extraout_A_00,0);
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M65_r2_08000__039f @ M65_r2_08000::039f =====

undefined2 __h3000 FUN_M65_r2_08000__039f(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  stack0xfff9 = CONCAT12(param_2,param_3);
  _auStack_8 = CONCAT13(param_1,stack0xfff9);
  DspLoadProgram(param_1,1,0x410);
  uVar1 = extraout_A;
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A,2,0x411);
    uVar1 = extraout_A_00;
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_00,3,0x12);
      uVar1 = extraout_A_01;
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        return auStack_8;
      }
    }
  }
  LcdSetCursor(uVar1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M65_r2_08000__03cb @ M65_r2_08000::03cb =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M65_r2_08000__03cb(void)

{
  undefined2 in_D;
  
  FUN_M65_r2_08000__29d2();
  FUN_M65_r2_08000__2a9a();
  FUN_M65_r2_08000__2cb3();
  API_FD76();
  API_FD7C();
  API_FD20(0);
  API_FD2E((char)((ushort)_DAT_7154 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_714e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_714a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7150 >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__042b @ M65_r2_08000::042b =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M65_r2_08000__042b(void)

{
                    /* inline[API_FD84]: 00 80 "l pitch " 21 $11C6 $11D2 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r pitch " 25 $12B5 $12C1 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l delay " 29 $13AD $13B9 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r delay " 2D $14AC $14B8 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "left mix" 55 $25E0 $25EC */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "rightmix" 59 $268E $269A */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "l fdback" 5D $23D8 $23E4 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "r fdback" 61 $2483 $248F */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M65_r2_08000__04d8;
  _DAT_60f7 = 0x28;
  DAT_7164 = FUN_M65_r2_08000__0ad7;
  return;
}


// ===== FUN_M65_r2_08000__0533 @ M65_r2_08000::0533 =====

void __h3000 FUN_M65_r2_08000__0533(void)

{
  FUN_M65_r2_08000__266a();
  FUN_M65_r2_08000__0ad7();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__053e @ M65_r2_08000::053e =====

void __h3000 FUN_M65_r2_08000__053e(void)

{
  FUN_M65_r2_08000__23b4();
  FUN_M65_r2_08000__0a65();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__0549 @ M65_r2_08000::0549 =====

void __h3000 FUN_M65_r2_08000__0549(void)

{
  FUN_M65_r2_08000__245f();
  FUN_M65_r2_08000__0a9e();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__0554 @ M65_r2_08000::0554 =====

void __h3000 FUN_M65_r2_08000__0554(void)

{
  FUN_M65_r2_08000__11a2();
  FUN_M65_r2_08000__0a65();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__055f @ M65_r2_08000::055f =====

void __h3000 FUN_M65_r2_08000__055f(void)

{
  FUN_M65_r2_08000__1389();
  FUN_M65_r2_08000__0a65();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__056a @ M65_r2_08000::056a =====

void __h3000 FUN_M65_r2_08000__056a(void)

{
  FUN_M65_r2_08000__1291();
  FUN_M65_r2_08000__0a9e();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0575 @ M65_r2_08000::0575 =====

void __h3000 FUN_M65_r2_08000__0575(void)

{
  FUN_M65_r2_08000__1488();
  FUN_M65_r2_08000__0a9e();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__0580 @ M65_r2_08000::0580 =====

void __h3000 FUN_M65_r2_08000__0580(void)

{
  FUN_M65_r2_08000__29d6();
  FUN_M65_r2_08000__0b3c();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__058b @ M65_r2_08000::058b =====

void __h3000 FUN_M65_r2_08000__058b(void)

{
  FUN_M65_r2_08000__28d2();
  FUN_M65_r2_08000__0b3c();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0596 @ M65_r2_08000::0596 =====

void __h3000 FUN_M65_r2_08000__0596(void)

{
  FUN_M65_r2_08000__2bcf();
  FUN_M65_r2_08000__0b3c();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__05a1 @ M65_r2_08000::05a1 =====

void __h3000 FUN_M65_r2_08000__05a1(void)

{
  FUN_M65_r2_08000__0f0d();
  FUN_M65_r2_08000__0f36();
  FUN_M65_r2_08000__0ad7();
  API_FDEC();
  return;
}


// ===== FUN_M65_r2_08000__05af @ M65_r2_08000::05af =====

void __h3000 FUN_M65_r2_08000__05af(void)

{
  FUN_M65_r2_08000__2718();
  FUN_M65_r2_08000__0e96();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__05ba @ M65_r2_08000::05ba =====

void __h3000 FUN_M65_r2_08000__05ba(void)

{
  FUN_M65_r2_08000__2793();
  FUN_M65_r2_08000__0e96();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__05c5 @ M65_r2_08000::05c5 =====

void __h3000 FUN_M65_r2_08000__05c5(void)

{
  FUN_M65_r2_08000__280e();
  FUN_M65_r2_08000__0ed1();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__05d0 @ M65_r2_08000::05d0 =====

void __h3000 FUN_M65_r2_08000__05d0(void)

{
  FUN_M65_r2_08000__2889();
  FUN_M65_r2_08000__0ed1();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__05db @ M65_r2_08000::05db =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M65_r2_08000__05db(void)

{
                    /* inline[API_FD84]: 00 80 " pitch  " 21 $12B5 $12C1 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " delay  " 25 $14AC $14B8 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "  mix   " 29 $252E $253A */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "feedback" 2D $2329 $2335 */
  DefineParameter();
  _DAT_60f5 = &UNK_M65_r2_08000__063c;
  _DAT_60f7 = 0x28;
  DAT_7164 = FUN_M65_r2_08000__0bb7;
  return;
}


// ===== FUN_M65_r2_08000__0714 @ M65_r2_08000::0714 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M65_r2_08000__0714(void)

{
                    /* inline[API_FD84]: 00 80 "l pitch " 21 $11C6 $11D2 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r pitch " 25 $12B5 $12C1 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l length" 29 $15E5 $15F1 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r length" 2D $16EA $16F6 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "left mix" 55 $25E0 $25EC */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "rightmix" 59 $268E $269A */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "l fdback" 5D $23D8 $23E4 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "r fdback" 61 $2483 $248F */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M65_r2_08000__07bb;
  _DAT_60f7 = 0x28;
  return;
}


// ===== FUN_M65_r2_08000__080b @ M65_r2_08000::080b =====

void __h3000 FUN_M65_r2_08000__080b(void)

{
  FUN_M65_r2_08000__25bc();
  FUN_M65_r2_08000__0cd7();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__0816 @ M65_r2_08000::0816 =====

void __h3000 FUN_M65_r2_08000__0816(void)

{
  FUN_M65_r2_08000__266a();
  FUN_M65_r2_08000__0cd7();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0821 @ M65_r2_08000::0821 =====

void __h3000 FUN_M65_r2_08000__0821(void)

{
  FUN_M65_r2_08000__23b4();
  FUN_M65_r2_08000__0c65();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__082c @ M65_r2_08000::082c =====

void __h3000 FUN_M65_r2_08000__082c(void)

{
  FUN_M65_r2_08000__245f();
  FUN_M65_r2_08000__0c9e();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__0837 @ M65_r2_08000::0837 =====

void __h3000 FUN_M65_r2_08000__0837(void)

{
  FUN_M65_r2_08000__11a2();
  FUN_M65_r2_08000__0c65();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0842 @ M65_r2_08000::0842 =====

void __h3000 FUN_M65_r2_08000__0842(void)

{
  FUN_M65_r2_08000__15c1();
  FUN_M65_r2_08000__0c65();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__084d @ M65_r2_08000::084d =====

void __h3000 FUN_M65_r2_08000__084d(void)

{
  FUN_M65_r2_08000__1291();
  FUN_M65_r2_08000__0c9e();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0858 @ M65_r2_08000::0858 =====

void __h3000 FUN_M65_r2_08000__0858(void)

{
  FUN_M65_r2_08000__16c6();
  FUN_M65_r2_08000__0c9e();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__0863 @ M65_r2_08000::0863 =====

void __h3000 FUN_M65_r2_08000__0863(void)

{
  FUN_M65_r2_08000__0f0d();
  FUN_M65_r2_08000__0f36();
  FUN_M65_r2_08000__0cd7();
  API_FDEC();
  return;
}


// ===== FUN_M65_r2_08000__0871 @ M65_r2_08000::0871 =====

void __h3000 FUN_M65_r2_08000__0871(void)

{
  FUN_M65_r2_08000__2718();
  FUN_M65_r2_08000__0e96();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__087c @ M65_r2_08000::087c =====

void __h3000 FUN_M65_r2_08000__087c(void)

{
  FUN_M65_r2_08000__2793();
  FUN_M65_r2_08000__0e96();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0887 @ M65_r2_08000::0887 =====

void __h3000 FUN_M65_r2_08000__0887(void)

{
  FUN_M65_r2_08000__280e();
  FUN_M65_r2_08000__0ed1();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__0892 @ M65_r2_08000::0892 =====

void __h3000 FUN_M65_r2_08000__0892(void)

{
  FUN_M65_r2_08000__2889();
  FUN_M65_r2_08000__0ed1();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__089d @ M65_r2_08000::089d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M65_r2_08000__089d(void)

{
                    /* inline[API_FD84]: 00 80 " delay  " 21 $14AC $14B8 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "left mix" 25 $25E0 $25EC */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "rightmix" 29 $268E $269A */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "l fdback" 2D $23D8 $23E4 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "r fdback" 55 $2483 $248F */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M65_r2_08000__0911;
  _DAT_60f7 = 0x28;
  DAT_7164 = FUN_M65_r2_08000__0d80;
  return;
}


// ===== FUN_M65_r2_08000__096c @ M65_r2_08000::096c =====

void __h3000 FUN_M65_r2_08000__096c(void)

{
  FUN_M65_r2_08000__266a();
  FUN_M65_r2_08000__0d47();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0977 @ M65_r2_08000::0977 =====

void __h3000 FUN_M65_r2_08000__0977(void)

{
  FUN_M65_r2_08000__23b4();
  FUN_M65_r2_08000__0d47();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__0982 @ M65_r2_08000::0982 =====

void __h3000 FUN_M65_r2_08000__0982(void)

{
  FUN_M65_r2_08000__245f();
  FUN_M65_r2_08000__0d47();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__098d @ M65_r2_08000::098d =====

void __h3000 FUN_M65_r2_08000__098d(void)

{
  FUN_M65_r2_08000__1799();
  FUN_M65_r2_08000__0d12();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__0998 @ M65_r2_08000::0998 =====

void __h3000 FUN_M65_r2_08000__0998(void)

{
  FUN_M65_r2_08000__19ea();
  FUN_M65_r2_08000__0d12();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__09a3 @ M65_r2_08000::09a3 =====

void __h3000 FUN_M65_r2_08000__09a3(void)

{
  FUN_M65_r2_08000__1ad5();
  FUN_M65_r2_08000__0d12();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__09ae @ M65_r2_08000::09ae =====

void __h3000 FUN_M65_r2_08000__09ae(void)

{
  FUN_M65_r2_08000__1488();
  FUN_M65_r2_08000__0d80();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__09b9 @ M65_r2_08000::09b9 =====

void __h3000 FUN_M65_r2_08000__09b9(void)

{
  FUN_M65_r2_08000__29d6();
  FUN_M65_r2_08000__0de9();
  API_FE14();
  return;
}


// ===== FUN_M65_r2_08000__09c4 @ M65_r2_08000::09c4 =====

void __h3000 FUN_M65_r2_08000__09c4(void)

{
  FUN_M65_r2_08000__28d2();
  FUN_M65_r2_08000__0de9();
  API_FE16();
  return;
}


// ===== FUN_M65_r2_08000__09cf @ M65_r2_08000::09cf =====

void __h3000 FUN_M65_r2_08000__09cf(void)

{
  FUN_M65_r2_08000__2bcf();
  FUN_M65_r2_08000__0e22();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__09da @ M65_r2_08000::09da =====

void __h3000 FUN_M65_r2_08000__09da(void)

{
  FUN_M65_r2_08000__0e56();
  FUN_M65_r2_08000__1908();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__09e5 @ M65_r2_08000::09e5 =====

void __h3000 FUN_M65_r2_08000__09e5(void)

{
  FUN_M65_r2_08000__0e5e();
  FUN_M65_r2_08000__1908();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__09f0 @ M65_r2_08000::09f0 =====

void __h3000 FUN_M65_r2_08000__09f0(void)

{
  FUN_M65_r2_08000__1036();
  FUN_M65_r2_08000__106e();
  FUN_M65_r2_08000__0d12();
  API_FDEC();
  return;
}


// ===== FUN_M65_r2_08000__09fe @ M65_r2_08000::09fe =====

void __h3000 FUN_M65_r2_08000__09fe(void)

{
  FUN_M65_r2_08000__2718();
  FUN_M65_r2_08000__0e96();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__0a09 @ M65_r2_08000::0a09 =====

void __h3000 FUN_M65_r2_08000__0a09(void)

{
  FUN_M65_r2_08000__2793();
  FUN_M65_r2_08000__0e96();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0a14 @ M65_r2_08000::0a14 =====

void __h3000 FUN_M65_r2_08000__0a14(void)

{
  FUN_M65_r2_08000__280e();
  FUN_M65_r2_08000__0ed1();
  API_FE10();
  return;
}


// ===== FUN_M65_r2_08000__0a1f @ M65_r2_08000::0a1f =====

void __h3000 FUN_M65_r2_08000__0a1f(void)

{
  FUN_M65_r2_08000__2889();
  FUN_M65_r2_08000__0ed1();
  API_FE12();
  return;
}


// ===== FUN_M65_r2_08000__0a2a @ M65_r2_08000::0a2a =====

void __h3000 FUN_M65_r2_08000__0a2a(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M65_r2_08000__0a65 @ M65_r2_08000::0a65 =====

void __h3000 FUN_M65_r2_08000__0a65(void)

{
                    /* inline[API_FE02]: "l coarse" "l fine  " "l delay " "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1147 ->$11AE ->$13C5 ->$23A8 ->$0A9E ->$0AD7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0a9e @ M65_r2_08000::0a9e =====

void __h3000 FUN_M65_r2_08000__0a9e(void)

{
                    /* inline[API_FE02]: "r coarse" "r fine  " "r delay " "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1236 ->$129D ->$14C4 ->$2453 ->$0AD7 ->$0A65 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0ad7 @ M65_r2_08000::0ad7 =====

void __h3000 FUN_M65_r2_08000__0ad7(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" [-] " levels " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M65_r2_08000__0f70();
                    /* inline[API_FE00]: ->$25B0 ->$265E ->$0F22 ->$0E96 ->$0B12 ->$0A9E */
  SetModuleHandlers();
  DAT_7164 = FUN_M65_r2_08000__0ad7;
  return;
}


// ===== FUN_M65_r2_08000__0b12 @ M65_r2_08000::0b12 =====

void __h3000 FUN_M65_r2_08000__0b12(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F0C ->$0F0C ->$0F0C ->$0B3C ->$0A65 ->$0AD7 */
  SetModuleHandlers();
  DAT_7164 = FUN_M65_r2_08000__0b12;
  return;
}


// ===== FUN_M65_r2_08000__0b3c @ M65_r2_08000::0b3c =====

void __h3000 FUN_M65_r2_08000__0b3c(void)

{
                    /* inline[API_FE02]: "low note" "highnote" " source " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$29FA ->$28F6 ->$2BF3 ->$0F0C ->$0F0C ->$0F0C */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7164 >> 8));
  return;
}


// ===== FUN_M65_r2_08000__0b7e @ M65_r2_08000::0b7e =====

void __h3000 FUN_M65_r2_08000__0b7e(void)

{
                    /* inline[API_FE02]: " coarse " "  fine  " " delay  " "feedback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$12E5 ->$12CD ->$14C4 ->$22F9 ->$0BB7 ->$0BB7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0bb7 @ M65_r2_08000::0bb7 =====

void __h3000 FUN_M65_r2_08000__0bb7(void)

{
                    /* inline[API_FE02]: "  mix   " [*] " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$24FE ->$0F0C ->$0E96 ->$0BEF ->$0B7E ->$0B7E */
  SetModuleHandlers();
  DAT_7164 = FUN_M65_r2_08000__0bb7;
  return;
}


// ===== FUN_M65_r2_08000__0bef @ M65_r2_08000::0bef =====

void __h3000 FUN_M65_r2_08000__0bef(void)

{
                    /* inline[API_FE02]: "low note" "highnote" " source " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$29FA ->$28F6 ->$2BF3 ->$0F0C ->$0C31 ->$0C31 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7164 >> 8));
  return;
}


// ===== FUN_M65_r2_08000__0c31 @ M65_r2_08000::0c31 =====

void __h3000 FUN_M65_r2_08000__0c31(void)

{
                    /* inline[API_FE02]: "deg mode" [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2AE5 ->$0F0C ->$0F0C ->$0F0C ->$0BEF ->$0BEF */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7164 >> 8));
  return;
}


// ===== FUN_M65_r2_08000__0c65 @ M65_r2_08000::0c65 =====

void __h3000 FUN_M65_r2_08000__0c65(void)

{
                    /* inline[API_FE02]: "l coarse" "l fine  " "l length" "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1147 ->$11AE ->$15B5 ->$23A8 ->$0C9E ->$0CD7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0c9e @ M65_r2_08000::0c9e =====

void __h3000 FUN_M65_r2_08000__0c9e(void)

{
                    /* inline[API_FE02]: "r coarse" "r fine  " "r length" "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1236 ->$129D ->$16BA ->$2453 ->$0CD7 ->$0C65 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0cd7 @ M65_r2_08000::0cd7 =====

void __h3000 FUN_M65_r2_08000__0cd7(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" [-] " levels " */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_7164 = FUN_M65_r2_08000__0cd7;
  FUN_M65_r2_08000__0f70();
                    /* inline[API_FE00]: ->$25B0 ->$265E ->$0F22 ->$0E96 ->$0C65 ->$0C9E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0d12 @ M65_r2_08000::0d12 =====

void __h3000 FUN_M65_r2_08000__0d12(void)

{
                    /* inline[API_FE02]: "l voice " "r voice " [-] "  key   " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M65_r2_08000__110e();
                    /* inline[API_FE00]: ->$1A0E ->$1AF9 ->$105A ->$17BD ->$0D47 ->$0D80 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0d47 @ M65_r2_08000::0d47 =====

void __h3000 FUN_M65_r2_08000__0d47(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" "l fdback" "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$25B0 ->$265E ->$23A8 ->$2453 ->$0D80 ->$0D12 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0d80 @ M65_r2_08000::0d80 =====

void __h3000 FUN_M65_r2_08000__0d80(void)

{
                    /* inline[API_FE02]: "  tune  " "shownote" "  delay " " levels " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1CBB ->$1E04 ->$14C4 ->$0E96 ->$0DBF ->$0D47 */
  SetModuleHandlers();
  DAT_7164 = FUN_M65_r2_08000__0d80;
  return;
}


// ===== FUN_M65_r2_08000__0dbf @ M65_r2_08000::0dbf =====

void __h3000 FUN_M65_r2_08000__0dbf(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F0C ->$0F0C ->$0F0C ->$0DE9 ->$0D12 ->$0D80 */
  SetModuleHandlers();
  DAT_7164 = FUN_M65_r2_08000__0dbf;
  return;
}


// ===== FUN_M65_r2_08000__0de9 @ M65_r2_08000::0de9 =====

void __h3000 FUN_M65_r2_08000__0de9(void)

{
                    /* inline[API_FE02]: " scale1 " "scale2  " "lownote " "highnote" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0E56 ->$0E5E ->$29FA ->$28F6 ->$0E22 ->$0E22 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0e22 @ M65_r2_08000::0e22 =====

void __h3000 FUN_M65_r2_08000__0e22(void)

{
                    /* inline[API_FE02]: " source " [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2BF3 ->$0F0C ->$0F0C ->$0F0C ->$0DE9 ->$0DE9 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7164 >> 8));
  return;
}


// ===== FUN_M65_r2_08000__0e56 @ M65_r2_08000::0e56 =====

void __h3000 FUN_M65_r2_08000__0e56(void)

{
  DAT_7014 = &DAT_7016;
  SoftKeyLabels4Inline();
  API_FDF2();
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0e5e @ M65_r2_08000::0e5e =====

void __h3000 FUN_M65_r2_08000__0e5e(void)

{
  DAT_7014 = &DAT_702e;
                    /* inline[API_FE02]: "  note  " "interval" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$186B ->$193F ->$0F0C ->$0DE9 ->$0F0C ->$0F0C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_r2_08000__0e96 @ M65_r2_08000::0e96 =====

void __h3000 FUN_M65_r2_08000__0e96(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$270C ->$2787 ->$0F0C ->$0F0C ->$0ED1 ->$0ED1 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7164 >> 8));
  return;
}


// ===== FUN_M65_r2_08000__0ed1 @ M65_r2_08000::0ed1 =====

void __h3000 FUN_M65_r2_08000__0ed1(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2802 ->$287D ->$0F0C ->$0F0C ->$0E96 ->$0E96 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7164 >> 8));
  return;
}


// ===== FUN_M65_r2_08000__0f0c @ M65_r2_08000::0f0c =====

void __h3000 FUN_M65_r2_08000__0f0c(void)

{
  return;
}


// ===== FUN_M65_r2_08000__0f0d @ M65_r2_08000::0f0d =====

undefined2 __h3000 FUN_M65_r2_08000__0f0d(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70ca = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__1000();
  return in_D;
}


// ===== FUN_M65_r2_08000__0f22 @ M65_r2_08000::0f22 =====

undefined2 __h3000 FUN_M65_r2_08000__0f22(void)

{
  undefined2 in_D;
  
  DAT_70ca = DAT_70ca ^ 0xffff;
  FUN_M65_r2_08000__0f36();
  FUN_M65_r2_08000__0f53();
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__0fa8();
  ModuleStorePtr(0xf);
  ModuleStorePtr(0xf);
  return in_D;
}


// ===== FUN_M65_r2_08000__0f36 @ M65_r2_08000::0f36 =====

undefined2 __h3000 FUN_M65_r2_08000__0f36(void)

{
  undefined2 in_D;
  
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__0fa8();
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xf);
  return in_D;
}


// ===== FUN_M65_r2_08000__0f53 @ M65_r2_08000::0f53 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__0f53(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FE40((char)((ushort)DAT_70ca >> 8),(char)DAT_70ca,param_1,0xb);
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__0fa8();
  FUN_M65_r2_08000__0f70();
  API_FDEC();
  return in_D;
}


// ===== FUN_M65_r2_08000__0f70 @ M65_r2_08000::0f70 =====

undefined2 __h3000 FUN_M65_r2_08000__0f70(void)

{
  undefined2 in_D;
  
  if (DAT_70ca == 0) {
                    /* inline[API_FE02]: [-] [-] "sust=on " [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  else {
                    /* inline[API_FE02]: [-] [-] "sust=off" [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__0fa8 @ M65_r2_08000::0fa8 =====

undefined2 __h3000 FUN_M65_r2_08000__0fa8(void)

{
  undefined2 in_D;
  
  if (DAT_70ca == 0) {
    FUN_M65_r2_08000__0a2a();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                        --sustain looping--" */
    LcdPrintInline();
  }
  else {
    FUN_M65_r2_08000__0a2a();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                        --normal operation-" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1000 @ M65_r2_08000::1000 =====

undefined2 __h3000 FUN_M65_r2_08000__1000(void)

{
  undefined2 in_D;
  
  if (DAT_70ca == 0) {
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0);
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1036 @ M65_r2_08000::1036 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1036(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70cc = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__1146();
  API_FC80((char)((ushort)DAT_70cc >> 8),(char)DAT_70cc,param_1,0x8b);
  return in_D;
}


// ===== FUN_M65_r2_08000__105a @ M65_r2_08000::105a =====

undefined2 __h3000 FUN_M65_r2_08000__105a(void)

{
  undefined2 in_D;
  
  DAT_70cc = DAT_70cc ^ 0xffff;
  FUN_M65_r2_08000__106e();
  FUN_M65_r2_08000__108b();
  FUN_M65_r2_08000__1146();
  FUN_M65_r2_08000__10b6();
  ModuleStorePtr(0x10);
  ModuleStorePtr(0x11);
  return in_D;
}


// ===== FUN_M65_r2_08000__106e @ M65_r2_08000::106e =====

undefined2 __h3000 FUN_M65_r2_08000__106e(void)

{
  undefined2 in_D;
  
  FUN_M65_r2_08000__1146();
  FUN_M65_r2_08000__10b6();
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x10);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x11);
  return in_D;
}


// ===== FUN_M65_r2_08000__108b @ M65_r2_08000::108b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__108b(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC80((char)((ushort)DAT_70cc >> 8),(char)DAT_70cc,param_1,0x8b);
  API_FE40((char)((ushort)DAT_70cc >> 8),(char)DAT_70cc,param_1,0x23);
  FUN_M65_r2_08000__1146();
  FUN_M65_r2_08000__10b6();
  FUN_M65_r2_08000__110e();
  API_FDEC();
  return in_D;
}


// ===== FUN_M65_r2_08000__10b6 @ M65_r2_08000::10b6 =====

undefined2 __h3000 FUN_M65_r2_08000__10b6(void)

{
  undefined2 in_D;
  
  if (DAT_70cc == 0) {
    FUN_M65_r2_08000__0a2a();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       --pitch quantizing--" */
    LcdPrintInline();
  }
  else {
    FUN_M65_r2_08000__0a2a();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       ---normal output----" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__110e @ M65_r2_08000::110e =====

undefined2 __h3000 FUN_M65_r2_08000__110e(void)

{
  undefined2 in_D;
  
  if (DAT_70cc == 0) {
                    /* inline[API_FE02]: [-] [-] "quan=on " [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  else {
                    /* inline[API_FE02]: [-] [-] "quan=off" [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1146 @ M65_r2_08000::1146 =====

void __h3000 FUN_M65_r2_08000__1146(void)

{
  return;
}


// ===== FUN_M65_r2_08000__1147 @ M65_r2_08000::1147 =====

undefined2 __h3000 FUN_M65_r2_08000__1147(void)

{
  undefined2 in_D;
  
  FUN_M65_r2_08000__11ae();
  DAT_60dc = 100;
  DAT_60de = 100;
  return in_D;
}


// ===== FUN_M65_r2_08000__11a2 @ M65_r2_08000::11a2 =====

void __h3000 FUN_M65_r2_08000__11a2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1209 ->$11DE */
                    /* inline[API_FDBC]: "5.94...X" */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__1209_M65_r2_08000__1158);
  return;
}


// ===== FUN_M65_r2_08000__11ae @ M65_r2_08000::11ae =====

void __h3000 FUN_M65_r2_08000__11ae(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1209 ->$11DE */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__1209_M65_r2_08000__1158);
  return;
}


// ===== FUN_M65_r2_08000__11ba @ M65_r2_08000::11ba =====

void __h3000 FUN_M65_r2_08000__11ba(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1209 ->$11DE */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__1209_M65_r2_08000__1158);
  return;
}


// ===== FUN_M65_r2_08000__11c6 @ M65_r2_08000::11c6 =====

void __h3000 FUN_M65_r2_08000__11c6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1209 ->$11DE */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__1209_M65_r2_08000__1158);
  return;
}


// ===== FUN_M65_r2_08000__11d2 @ M65_r2_08000::11d2 =====

void __h3000 FUN_M65_r2_08000__11d2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1209 ->$11DE $11BA */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__1209_M65_r2_08000__1158);
  return;
}


// ===== FUN_M65_r2_08000__11de @ M65_r2_08000::11de =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__11de(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$1209 ->$11DE */
  API_FE6E();
  uVar1 = DAT_70ce;
  *(char *)(in_U + -1) = (char)DAT_70ce;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_716a);
  return in_D;
}


// ===== FUN_M65_r2_08000__1209 @ M65_r2_08000::1209 =====

undefined2 __h3000 FUN_M65_r2_08000__1209(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_704a;
  *(char *)(in_U + -1) = (char)DAT_704a;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCE6();
  puVar3 = (undefined2 *)(puVar2 + -2);
  FUN_M65_r2_08000__2f21();
  DAT_7106 = *puVar3;
  puVar3 = puVar3 + 1;
  API_FD52();
  DAT_70ce = *puVar3;
  return in_D;
}


// ===== FUN_M65_r2_08000__1236 @ M65_r2_08000::1236 =====

undefined2 __h3000 FUN_M65_r2_08000__1236(void)

{
  undefined2 in_D;
  
  FUN_M65_r2_08000__129d();
  DAT_60dc = 100;
  DAT_60de = 100;
  return in_D;
}


// ===== FUN_M65_r2_08000__1291 @ M65_r2_08000::1291 =====

void __h3000 FUN_M65_r2_08000__1291(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1321 ->$12F6 */
                    /* inline[API_FDBC]: "5.94...G" */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__1321_M65_r2_08000__1247);
  return;
}


// ===== FUN_M65_r2_08000__129d @ M65_r2_08000::129d =====

void __h3000 FUN_M65_r2_08000__129d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1321 ->$12F6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__1321_M65_r2_08000__1247);
  return;
}


// ===== FUN_M65_r2_08000__12a9 @ M65_r2_08000::12a9 =====

void __h3000 FUN_M65_r2_08000__12a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1321 ->$12F6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__1321_M65_r2_08000__1247);
  return;
}


// ===== FUN_M65_r2_08000__12b5 @ M65_r2_08000::12b5 =====

void __h3000 FUN_M65_r2_08000__12b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1321 ->$12F6 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__1321_M65_r2_08000__1247);
  return;
}


// ===== FUN_M65_r2_08000__12c1 @ M65_r2_08000::12c1 =====

void __h3000 FUN_M65_r2_08000__12c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1321 ->$12F6 $12A9 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__1321_M65_r2_08000__1247);
  return;
}


// ===== FUN_M65_r2_08000__12cd @ M65_r2_08000::12cd =====

undefined2 __h3000 FUN_M65_r2_08000__12cd(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M65_r2_08000__129d();
  LcdSetCursor(extraout_A,5);
                    /* inline[API_FC38]: "l & r" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M65_r2_08000__12e5 @ M65_r2_08000::12e5 =====

undefined2 __h3000 FUN_M65_r2_08000__12e5(void)

{
  undefined2 in_D;
  
  FUN_M65_r2_08000__12cd();
  DAT_60dc = 100;
  DAT_60de = 100;
  return in_D;
}


// ===== FUN_M65_r2_08000__12f6 @ M65_r2_08000::12f6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__12f6(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$1321 ->$12F6 */
  API_FE6E();
  uVar1 = DAT_70d0;
  *(char *)(in_U + -1) = (char)DAT_70d0;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_716a);
  return in_D;
}


// ===== FUN_M65_r2_08000__1321 @ M65_r2_08000::1321 =====

undefined2 __h3000 FUN_M65_r2_08000__1321(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_7052;
  *(char *)(in_U + -1) = (char)DAT_7052;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCE6();
  puVar3 = (undefined2 *)(puVar2 + -2);
  FUN_M65_r2_08000__2f21();
  DAT_7108 = *puVar3;
  puVar3 = puVar3 + 1;
  API_FD54();
  DAT_70d0 = *puVar3;
  return in_D;
}


// ===== FUN_M65_r2_08000__1389 @ M65_r2_08000::1389 =====

void __h3000 FUN_M65_r2_08000__1389(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1403 ->$13A1 */
                    /* inline[API_FDBC]: "5.94...N" */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e);
  return;
}


// ===== FUN_M65_r2_08000__1395 @ M65_r2_08000::1395 =====

void __h3000 FUN_M65_r2_08000__1395(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1403 ->$13A1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e);
  return;
}


// ===== FUN_M65_r2_08000__13a1 @ M65_r2_08000::13a1 =====

void __h3000 FUN_M65_r2_08000__13a1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1403 ->$13A1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e);
  return;
}


// ===== FUN_M65_r2_08000__13ad @ M65_r2_08000::13ad =====

void __h3000 FUN_M65_r2_08000__13ad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1403 ->$13A1 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e);
  return;
}


// ===== FUN_M65_r2_08000__13b9 @ M65_r2_08000::13b9 =====

void __h3000 FUN_M65_r2_08000__13b9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1403 ->$13A1 $1395 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e);
  return;
}


// ===== FUN_M65_r2_08000__13c5 @ M65_r2_08000::13c5 =====

undefined2 __h3000 FUN_M65_r2_08000__13c5(void)

{
  undefined2 in_D;
  
                    /* desc[API_FE6A]: ->$1403 ->$13A1 */
  API_FE6A();
  if (DAT_714c == -1) {
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $01F4 $0000 $0000 ->$13A1 ->$1395
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M65_r2_08000__13a1();
    DAT_606c = 500;
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1403 @ M65_r2_08000::1403 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1403(void)

{
  short sVar1;
  undefined2 in_D;
  short *in_U;
  
  if (DAT_714c == 0) {
    API_FE76(0,0,&PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e);
  }
  else {
    *(undefined1 *)((short)in_U + -1) = 0;
    *(undefined1 *)(in_U + -1) = 0;
    *(undefined1 *)((short)in_U + -3) = 0xf4;
    *(undefined1 *)(in_U + -2) = 1;
    in_U = in_U + -3;
    *in_U = DAT_7056 + DAT_7058;
    API_FCD8();
    DAT_705a = *in_U;
    in_U = in_U + 1;
  }
  *(undefined1 *)((short)in_U + -1) = 0x2c;
  *(undefined1 *)(in_U + -1) = 0;
  sVar1 = DAT_705a;
  *(char *)((short)in_U + -3) = (char)DAT_705a;
  in_U = in_U + -2;
  *(char *)in_U = (char)((ushort)sVar1 >> 8);
  API_FCEE();
  DAT_70d2 = *in_U;
  FUN_M65_r2_08000__2cd1();
  return in_D;
}


// ===== FUN_M65_r2_08000__1488 @ M65_r2_08000::1488 =====

void __h3000 FUN_M65_r2_08000__1488(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1516 ->$14A0 */
                    /* inline[API_FDBC]: "5.94...M" */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d);
  return;
}


// ===== FUN_M65_r2_08000__1494 @ M65_r2_08000::1494 =====

void __h3000 FUN_M65_r2_08000__1494(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1516 ->$14A0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d);
  return;
}


// ===== FUN_M65_r2_08000__14a0 @ M65_r2_08000::14a0 =====

void __h3000 FUN_M65_r2_08000__14a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1516 ->$14A0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d);
  return;
}


// ===== FUN_M65_r2_08000__14ac @ M65_r2_08000::14ac =====

void __h3000 FUN_M65_r2_08000__14ac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1516 ->$14A0 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d);
  return;
}


// ===== FUN_M65_r2_08000__14b8 @ M65_r2_08000::14b8 =====

void __h3000 FUN_M65_r2_08000__14b8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1516 ->$14A0 $1494 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d);
  return;
}


// ===== FUN_M65_r2_08000__14c4 @ M65_r2_08000::14c4 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M65_r2_08000__14c4(void)

{
  undefined2 in_D;
  
                    /* desc[API_FE6A]: ->$1516 ->$14A0 */
  API_FE6A();
  if ((DAT_714a == 0) || (_DAT_7154 == 0)) {
    LcdSetCursor();
                    /* inline[API_FC38]: "l & r" */
    LcdPrintInline();
  }
  if ((DAT_714c != 0) && (_DAT_7154 != 0)) {
    DAT_606c = 500;
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1516 @ M65_r2_08000::1516 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x154e */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M65_r2_08000__1516(void)

{
  short sVar1;
  undefined2 in_D;
  short *in_U;
  
  if ((DAT_714c == 0) || (_DAT_7154 == 0)) {
    API_FE76(0,0,&PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d);
    if (_DAT_7154 != -1) {
      DAT_705a = DAT_7062;
      *(undefined1 *)((short)in_U + -1) = 0x2c;
      *(undefined1 *)(in_U + -1) = 0;
      sVar1 = DAT_705a;
      *(char *)((short)in_U + -3) = (char)DAT_705a;
      in_U = in_U + -2;
      *(char *)in_U = (char)((ushort)sVar1 >> 8);
      API_FCEE();
      DAT_70d2 = *in_U;
      in_U = in_U + 1;
    }
  }
  else {
    *(undefined1 *)((short)in_U + -1) = 0;
    *(undefined1 *)(in_U + -1) = 0;
    *(undefined1 *)((short)in_U + -3) = 0xf4;
    *(undefined1 *)(in_U + -2) = 1;
    in_U = in_U + -3;
    *in_U = DAT_705e + DAT_7060;
    API_FCD8();
    DAT_7062 = *in_U;
    in_U = in_U + 1;
  }
  *(undefined1 *)((short)in_U + -1) = 0x2c;
  *(undefined1 *)(in_U + -1) = 0;
  sVar1 = DAT_7062;
  *(char *)((short)in_U + -3) = (char)DAT_7062;
  in_U = in_U + -2;
  *(char *)in_U = (char)((ushort)sVar1 >> 8);
  API_FCEE();
  DAT_70d4 = *in_U;
  FUN_M65_r2_08000__2cd1();
  return in_D;
}


// ===== FUN_M65_r2_08000__15b5 @ M65_r2_08000::15b5 =====

void __h3000 FUN_M65_r2_08000__15b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1612 ->$15D9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f);
  return;
}


// ===== FUN_M65_r2_08000__15c1 @ M65_r2_08000::15c1 =====

void __h3000 FUN_M65_r2_08000__15c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1612 ->$15D9 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f);
  return;
}


// ===== FUN_M65_r2_08000__15cd @ M65_r2_08000::15cd =====

void __h3000 FUN_M65_r2_08000__15cd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1612 ->$15D9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f);
  return;
}


// ===== FUN_M65_r2_08000__15d9 @ M65_r2_08000::15d9 =====

void __h3000 FUN_M65_r2_08000__15d9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1612 ->$15D9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f);
  return;
}


// ===== FUN_M65_r2_08000__15e5 @ M65_r2_08000::15e5 =====

void __h3000 FUN_M65_r2_08000__15e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1612 ->$15D9 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f);
  return;
}


// ===== FUN_M65_r2_08000__15f1 @ M65_r2_08000::15f1 =====

void __h3000 FUN_M65_r2_08000__15f1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1612 ->$15D9 $15CD */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f);
  return;
}


// ===== FUN_M65_r2_08000__1612 @ M65_r2_08000::1612 =====

undefined2 __h3000 FUN_M65_r2_08000__1612(void)

{
  undefined2 uVar1;
  byte bVar2;
  undefined2 in_D;
  short in_U;
  short *psVar4;
  byte *pbVar5;
  short sVar3;
  
  API_FE76();
  uVar1 = DAT_70b2;
  *(char *)(in_U + -1) = (char)DAT_70b2;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x2c;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEE();
  DAT_70f6 = *psVar4;
  *(undefined1 *)((short)psVar4 + 1) = 0xff;
  *(undefined1 *)psVar4 = 0x7f;
  sVar3 = DAT_70f6;
  if (DAT_70f6 < 0) {
    *(char *)((short)psVar4 + -1) = (char)DAT_70f6;
    psVar4 = psVar4 + -1;
    *(char *)psVar4 = (char)((ushort)sVar3 >> 8);
    API_FCC8();
    sVar3 = *psVar4;
    psVar4 = psVar4 + 1;
  }
  bVar2 = (byte)((ushort)sVar3 >> 8);
  *(byte *)((short)psVar4 + -1) =
       (char)((char)((char)sVar3 >> 1 | bVar2 << 7) >> 1 | (bVar2 >> 1) << 7) >> 1 |
       (bVar2 >> 2) << 7;
  pbVar5 = (byte *)(psVar4 + -1);
  *pbVar5 = bVar2 >> 3;
  API_FCEA();
  DAT_70f8 = *(short *)pbVar5 + 1;
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD3C((char)((ushort)DAT_70f6 >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__16ba @ M65_r2_08000::16ba =====

void __h3000 FUN_M65_r2_08000__16ba(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1717 ->$16DE */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694);
  return;
}


// ===== FUN_M65_r2_08000__16c6 @ M65_r2_08000::16c6 =====

void __h3000 FUN_M65_r2_08000__16c6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1717 ->$16DE */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694);
  return;
}


// ===== FUN_M65_r2_08000__16d2 @ M65_r2_08000::16d2 =====

void __h3000 FUN_M65_r2_08000__16d2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1717 ->$16DE */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694);
  return;
}


// ===== FUN_M65_r2_08000__16de @ M65_r2_08000::16de =====

void __h3000 FUN_M65_r2_08000__16de(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1717 ->$16DE */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694);
  return;
}


// ===== FUN_M65_r2_08000__16ea @ M65_r2_08000::16ea =====

void __h3000 FUN_M65_r2_08000__16ea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1717 ->$16DE */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694);
  return;
}


// ===== FUN_M65_r2_08000__16f6 @ M65_r2_08000::16f6 =====

void __h3000 FUN_M65_r2_08000__16f6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1717 ->$16DE $16D2 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694);
  return;
}


// ===== FUN_M65_r2_08000__1717 @ M65_r2_08000::1717 =====

undefined2 __h3000 FUN_M65_r2_08000__1717(void)

{
  undefined2 uVar1;
  byte bVar2;
  undefined2 in_D;
  short in_U;
  short *psVar4;
  byte *pbVar5;
  short sVar3;
  
  API_FE76();
  uVar1 = DAT_70ba;
  *(char *)(in_U + -1) = (char)DAT_70ba;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x2c;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEE();
  DAT_70f6 = *psVar4;
  *(undefined1 *)((short)psVar4 + 1) = 0xff;
  *(undefined1 *)psVar4 = 0x7f;
  sVar3 = DAT_70f6;
  if (DAT_70f6 < 0) {
    *(char *)((short)psVar4 + -1) = (char)DAT_70f6;
    psVar4 = psVar4 + -1;
    *(char *)psVar4 = (char)((ushort)sVar3 >> 8);
    API_FCC8();
    sVar3 = *psVar4;
    psVar4 = psVar4 + 1;
  }
  bVar2 = (byte)((ushort)sVar3 >> 8);
  *(byte *)((short)psVar4 + -1) =
       (char)((char)((char)sVar3 >> 1 | bVar2 << 7) >> 1 | (bVar2 >> 1) << 7) >> 1 |
       (bVar2 >> 2) << 7;
  pbVar5 = (byte *)(psVar4 + -1);
  *pbVar5 = bVar2 >> 3;
  API_FCEA();
  DAT_70f8 = *(short *)pbVar5 + 1;
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD44((char)((ushort)DAT_70f6 >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__171c @ M65_r2_08000::171c =====

undefined2 __h3000 FUN_M65_r2_08000__171c(void)

{
  undefined2 uVar1;
  byte bVar2;
  short in_U;
  short *psVar4;
  byte *pbVar5;
  undefined2 in_stack_00000000;
  short sVar3;
  
  API_FE76();
  uVar1 = DAT_70ba;
  *(char *)(in_U + -1) = (char)DAT_70ba;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x2c;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEE();
  DAT_70f6 = *psVar4;
  *(undefined1 *)((short)psVar4 + 1) = 0xff;
  *(undefined1 *)psVar4 = 0x7f;
  sVar3 = DAT_70f6;
  if (DAT_70f6 < 0) {
    *(char *)((short)psVar4 + -1) = (char)DAT_70f6;
    psVar4 = psVar4 + -1;
    *(char *)psVar4 = (char)((ushort)sVar3 >> 8);
    API_FCC8();
    sVar3 = *psVar4;
    psVar4 = psVar4 + 1;
  }
  bVar2 = (byte)((ushort)sVar3 >> 8);
  *(byte *)((short)psVar4 + -1) =
       (char)((char)((char)sVar3 >> 1 | bVar2 << 7) >> 1 | (bVar2 >> 1) << 7) >> 1 |
       (bVar2 >> 2) << 7;
  pbVar5 = (byte *)(psVar4 + -1);
  *pbVar5 = bVar2 >> 3;
  API_FCEA();
  DAT_70f8 = *(short *)pbVar5 + 1;
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD44((char)((ushort)DAT_70f6 >> 8));
  return in_stack_00000000;
}


// ===== FUN_M65_r2_08000__1720 @ M65_r2_08000::1720 =====

undefined2 __h3000 FUN_M65_r2_08000__1720(void)

{
  undefined2 uVar1;
  byte bVar2;
  short in_U;
  short *psVar4;
  byte *pbVar5;
  undefined2 in_stack_00000000;
  short sVar3;
  
  uVar1 = DAT_70ba;
  *(char *)(in_U + -1) = (char)DAT_70ba;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x2c;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEE();
  DAT_70f6 = *psVar4;
  *(undefined1 *)((short)psVar4 + 1) = 0xff;
  *(undefined1 *)psVar4 = 0x7f;
  sVar3 = DAT_70f6;
  if (DAT_70f6 < 0) {
    *(char *)((short)psVar4 + -1) = (char)DAT_70f6;
    psVar4 = psVar4 + -1;
    *(char *)psVar4 = (char)((ushort)sVar3 >> 8);
    API_FCC8();
    sVar3 = *psVar4;
    psVar4 = psVar4 + 1;
  }
  bVar2 = (byte)((ushort)sVar3 >> 8);
  *(byte *)((short)psVar4 + -1) =
       (char)((char)((char)sVar3 >> 1 | bVar2 << 7) >> 1 | (bVar2 >> 1) << 7) >> 1 |
       (bVar2 >> 2) << 7;
  pbVar5 = (byte *)(psVar4 + -1);
  *pbVar5 = bVar2 >> 3;
  API_FCEA();
  DAT_70f8 = *(short *)pbVar5 + 1;
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f8 >> 8));
  API_FD44((char)((ushort)DAT_70f6 >> 8));
  return in_stack_00000000;
}


// ===== FUN_M65_r2_08000__1799 @ M65_r2_08000::1799 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1799(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7004 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__184e();
  API_FC80((char)((ushort)DAT_7004 >> 8),(char)DAT_7004,param_1,0x33);
  return in_D;
}


// ===== FUN_M65_r2_08000__17bd @ M65_r2_08000::17bd =====

undefined2 __h3000 FUN_M65_r2_08000__17bd(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7004;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       major key:          " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $000B $0000 $0000 ->$1833 ->$180A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__1833();
  return in_D;
}


// ===== FUN_M65_r2_08000__180a @ M65_r2_08000::180a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__180a(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7004 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x33);
  API_FE40((char)((ushort)DAT_7004 >> 8),(char)DAT_7004,param_1,4);
  FUN_M65_r2_08000__1833();
  FUN_M65_r2_08000__184e();
  return in_D;
}


// ===== FUN_M65_r2_08000__1833 @ M65_r2_08000::1833 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__1833(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_r2_08000__1853 + g_moduleBase + (DAT_7004 & 0xff) * 2) >> 8),2,
           &UNK_M65_r2_08000__1853 + g_moduleBase + (DAT_7004 & 0xff) * 2);
  return;
}


// ===== FUN_M65_r2_08000__184e @ M65_r2_08000::184e =====

undefined2 __h3000 FUN_M65_r2_08000__184e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  return uStack_4;
}


// ===== FUN_M65_r2_08000__186b @ M65_r2_08000::186b =====

undefined2 __h3000 FUN_M65_r2_08000__186b(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7008;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       note    :      cents" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0016 $0000 $0000 ->$18C7 ->$18B8
                       $0002 $0002 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__18c7();
  return in_D;
}


// ===== FUN_M65_r2_08000__18b8 @ M65_r2_08000::18b8 =====

undefined2 __h3000 FUN_M65_r2_08000__18b8(void)

{
  undefined2 in_D;
  
  DAT_7008 = DAT_6074;
  FUN_M65_r2_08000__18c7();
  FUN_M65_r2_08000__1907();
  return in_D;
}


// ===== FUN_M65_r2_08000__18c7 @ M65_r2_08000::18c7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__18c7(void)

{
  undefined2 uVar1;
  undefined2 *puVar2;
  undefined1 extraout_A;
  undefined1 uVar3;
  short in_U;
  
  LcdSetCursor();
  DAT_70f6 = DAT_7008;
  API_FC3A((char)((ushort)(&UNK_M65_r2_08000__1853 + g_moduleBase + DAT_7008) >> 8),2,
           &UNK_M65_r2_08000__1853 + g_moduleBase + DAT_7008);
  puVar2 = (undefined2 *)(DAT_7008 + DAT_7014);
  uVar1 = *puVar2;
  uVar3 = (undefined1)uVar1;
  *(undefined1 *)(in_U + -1) = uVar3;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0,uVar3,puVar2,&DAT_7112);
  LcdSetCursor();
  API_FC3A(extraout_A,5,&DAT_7116);
  return;
}


// ===== FUN_M65_r2_08000__1907 @ M65_r2_08000::1907 =====

void __h3000 FUN_M65_r2_08000__1907(void)

{
  return;
}


// ===== FUN_M65_r2_08000__1908 @ M65_r2_08000::1908 =====

undefined2 __h3000 FUN_M65_r2_08000__1908(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7008 = (DAT_6103 + -0xb) * 2;
  if (0x17 < DAT_7008) {
    DAT_7008 = DAT_7008 + -0x18;
  }
  DAT_7014 = &DAT_7016;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__198f();
  return in_D;
}


// ===== FUN_M65_r2_08000__193f @ M65_r2_08000::193f =====

undefined2 __h3000 FUN_M65_r2_08000__193f(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_700e;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       note    :      cents" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$19D4 ->$198F
                       $0064 $0064 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__19d4();
  FUN_M65_r2_08000__18c7();
  return in_D;
}


// ===== FUN_M65_r2_08000__198f @ M65_r2_08000::198f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__198f(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  
  DAT_700e = DAT_6074;
  puVar1 = (undefined2 *)(DAT_7008 + DAT_7014);
  *puVar1 = DAT_6074;
  API_FC82((char)((ushort)*puVar1 >> 8),(char)*puVar1,puVar1,FUN_9045 + (short)puVar1);
  API_FE40((char)((ushort)*puVar1 >> 8));
  FUN_M65_r2_08000__19d4();
  FUN_M65_r2_08000__19e9();
  return in_D;
}


// ===== FUN_M65_r2_08000__19d4 @ M65_r2_08000::19d4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__19d4(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  return in_D;
}


// ===== FUN_M65_r2_08000__19e9 @ M65_r2_08000::19e9 =====

void __h3000 FUN_M65_r2_08000__19e9(void)

{
  return;
}


// ===== FUN_M65_r2_08000__19ea @ M65_r2_08000::19ea =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__19ea(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7000 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__1a9f();
  API_FC80((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0x31);
  return in_D;
}


// ===== FUN_M65_r2_08000__1a0e @ M65_r2_08000::1a0e =====

undefined2 __h3000 FUN_M65_r2_08000__1a0e(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7000;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       l voice:            " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1A84 ->$1A5B
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__1a84();
  return in_D;
}


// ===== FUN_M65_r2_08000__1a5b @ M65_r2_08000::1a5b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1a5b(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7000 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x31);
  API_FE40((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,5);
  FUN_M65_r2_08000__1a84();
  FUN_M65_r2_08000__1a9f();
  return in_D;
}


// ===== FUN_M65_r2_08000__1a84 @ M65_r2_08000::1a84 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__1a84(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_r2_08000__1be9 + g_moduleBase + (DAT_7000 & 0xff) * 10) >> 8),10
           ,&UNK_M65_r2_08000__1be9 + g_moduleBase + (DAT_7000 & 0xff) * 10);
  return;
}


// ===== FUN_M65_r2_08000__1a9f @ M65_r2_08000::1a9f =====

undefined2 __h3000 FUN_M65_r2_08000__1a9f(void)

{
  undefined2 in_D;
  
  if (DAT_7000 < 0x13) {
    DAT_70f0 = (undefined2 *)
               (*(short *)(&UNK_M65_r2_08000__1bc3 +
                          g_moduleBase +
                          CONCAT11((char)((ushort)DAT_7000 >> 8) << 1 | (byte)DAT_7000 >> 7,
                                   (byte)DAT_7000 << 1)) + g_moduleBase);
  }
  else if (DAT_7000 == 0x14) {
    DAT_70f0 = &DAT_702e;
  }
  else {
    DAT_70f0 = &DAT_7016;
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1ad5 @ M65_r2_08000::1ad5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1ad5(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7002 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__1b8a();
  API_FC80((char)((ushort)DAT_7002 >> 8),(char)DAT_7002,param_1,0x32);
  return in_D;
}


// ===== FUN_M65_r2_08000__1af9 @ M65_r2_08000::1af9 =====

undefined2 __h3000 FUN_M65_r2_08000__1af9(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7002;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       r voice:            " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1B6F ->$1B46
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__1b6f();
  return in_D;
}


// ===== FUN_M65_r2_08000__1b46 @ M65_r2_08000::1b46 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1b46(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7002 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x32);
  API_FE40((char)((ushort)DAT_7002 >> 8),(char)DAT_7002,param_1,6);
  FUN_M65_r2_08000__1b6f();
  FUN_M65_r2_08000__1b8a();
  return in_D;
}


// ===== FUN_M65_r2_08000__1b6f @ M65_r2_08000::1b6f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__1b6f(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_r2_08000__1be9 + g_moduleBase + (DAT_7002 & 0xff) * 10) >> 8),10
           ,&UNK_M65_r2_08000__1be9 + g_moduleBase + (DAT_7002 & 0xff) * 10);
  return;
}


// ===== FUN_M65_r2_08000__1b8a @ M65_r2_08000::1b8a =====

undefined2 __h3000 FUN_M65_r2_08000__1b8a(void)

{
  undefined2 in_D;
  
  if (DAT_7002 < 0x13) {
    DAT_70f2 = (undefined2 *)
               (*(short *)(&UNK_M65_r2_08000__1bc3 +
                          g_moduleBase +
                          CONCAT11((char)((ushort)DAT_7002 >> 8) << 1 | (byte)DAT_7002 >> 7,
                                   (byte)DAT_7002 << 1)) + g_moduleBase);
  }
  else if (DAT_7002 == 0x14) {
    DAT_70f2 = &DAT_702e;
  }
  else {
    DAT_70f2 = &DAT_7016;
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1cbb @ M65_r2_08000::1cbb =====

undefined2 __h3000 FUN_M65_r2_08000__1cbb(void)

{
  undefined2 in_D;
  
  DAT_70f4 = 0;
  LcdSetCursor();
                    /* inline[API_FC38]: "Play note - enter retunes:         cents" */
  LcdPrintInline();
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1e);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x1d);
  return in_D;
}


// ===== FUN_M65_r2_08000__1d1d @ M65_r2_08000::1d1d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__1d1d(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  FUN_M65_r2_08000__1d89();
  FUN_M65_r2_08000__1d33();
  API_FC82((char)((ushort)DAT_7006 >> 8),(char)DAT_7006,param_3,0x59);
  return;
}


// ===== FUN_M65_r2_08000__1d33 @ M65_r2_08000::1d33 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1d33(void)

{
  undefined2 uVar1;
  undefined1 extraout_A;
  undefined2 in_D;
  short in_U;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "You are now tuned     cents from A440   " */
  LcdPrintInline();
  LcdSetCursor();
  uVar1 = DAT_7110;
  *(char *)(in_U + -1) = (char)DAT_7110;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0);
  API_FC3A(extraout_A,3,&DAT_7118);
  return in_D;
}


// ===== FUN_M65_r2_08000__1d89 @ M65_r2_08000::1d89 =====

undefined2 __h3000 FUN_M65_r2_08000__1d89(void)

{
  undefined2 in_D;
  short in_U;
  char *pcVar1;
  
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1e);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0xf);
  *(short *)(in_U + -2) = DAT_7110 + 0x32;
  *(undefined1 *)(in_U + -3) = 5;
  pcVar1 = (char *)(in_U + -4);
  *pcVar1 = '\0';
  API_FCEA();
  DAT_7006 = *(undefined2 *)
              (FUN_M65_r2_08000__1dda +
              g_moduleBase + CONCAT11(*pcVar1 << 1 | (byte)pcVar1[1] >> 7,pcVar1[1] << 1));
  DAT_70f4 = 0xffff;
  return in_D;
}


// ===== FUN_M65_r2_08000__1dda @ M65_r2_08000::1dda =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FUN_M65_r2_08000__1dda(void)

{
  undefined2 uVar1;
  undefined2 in_U;
  
  uVar1 = DAT_40fc;
  DAT_M65_r2_08000__06c6 = ~DAT_M65_r2_08000__06c6;
  do {
  } while ((bool)((DAT_M65_r2_08000__06c6 == 0) + '\x01'));
  RAM42ff = in_U;
                    /* WARNING: Read-only address (RAM,0x0000) is written */
  BANK_HEADER_hdr.key._0_1_ = 0x56;
                    /* WARNING: Read-only address (RAM,0x00be) is written */
  uRAM00be = 0x61;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_M65_r2_08000__1e04 @ M65_r2_08000::1e04 =====

void __h3000 FUN_M65_r2_08000__1e04(void)

{
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
  DAT_70f4 = 0xffff;
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1e);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xf);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xf);
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       pitch:         cents" */
  LcdPrintInline();
  FUN_M65_r2_08000__1e5d();
  return;
}


// ===== FUN_M65_r2_08000__1e5d @ M65_r2_08000::1e5d =====

undefined2 __h3000 FUN_M65_r2_08000__1e5d(void)

{
  undefined2 in_D;
  
  if (FUN_M65_r2_08000__0f0c + g_moduleBase == DAT_6072) {
    FUN_M65_r2_08000__1eb7();
    FUN_M65_r2_08000__1e85();
  }
  else {
    DAT_70f4 = 0xffff;
                    /* inline[API_FC62]: $6038 */
    ModuleStorePtr(0xf);
    FUN_M65_r2_08000__1eb7();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__1e85 @ M65_r2_08000::1e85 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__1e85(void)

{
  undefined2 uVar1;
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined2 in_D;
  short in_U;
  
  LcdSetCursor();
  uVar1 = DAT_7110;
  *(char *)(in_U + -1) = (char)DAT_7110;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0);
  API_FC3A(extraout_A,3,&DAT_7118);
  LcdSetCursor();
  API_FC3A(extraout_A_00,4,DAT_70ee);
  return in_D;
}


// ===== FUN_M65_r2_08000__1eb7 @ M65_r2_08000::1eb7 =====

undefined2 __h3000 FUN_M65_r2_08000__1eb7(void)

{
  ushort uVar1;
  undefined2 uVar2;
  char cVar3;
  undefined2 in_D;
  short sVar4;
  ushort *puVar5;
  ushort *puVar6;
  short *psVar7;
  short in_U;
  ushort *puVar8;
  
  DAT_70e2 = API_FD42();
  DAT_70e4 = API_FD3A();
  cVar3 = (char)((ushort)DAT_70e2 >> 8);
  if (DAT_70e2 < DAT_70e4) {
    DAT_70fc = CONCAT11(cVar3 >> 2,(char)((char)DAT_70e2 >> 1 | cVar3 << 7) >> 1 | (cVar3 >> 1) << 7
                       );
    *(short *)(in_U + -2) = DAT_70fc + DAT_70e4;
    sVar4 = DAT_70e2;
    *(char *)(in_U + -3) = (char)DAT_70e2;
    puVar8 = (ushort *)(in_U + -4);
    *(char *)puVar8 = (char)((ushort)sVar4 >> 8);
    API_FCEA();
    sVar4 = DAT_70e4;
    DAT_70fa = *puVar8;
    *(char *)((short)puVar8 + 1) = (char)DAT_70e4;
    *(char *)puVar8 = (char)((ushort)sVar4 >> 8);
    *(undefined1 *)((short)puVar8 + -1) = 10;
    puVar8 = puVar8 + -1;
    *(undefined1 *)puVar8 = 0;
    API_FCEE();
    uVar1 = DAT_70fa;
    *(char *)((short)puVar8 + -1) = (char)DAT_70fa;
    puVar8 = puVar8 + -1;
    *(char *)puVar8 = (char)(uVar1 >> 8);
    API_FCEA();
    DAT_70e6 = *puVar8;
    DAT_70fa = DAT_70e6;
  }
  else {
    *(char *)(in_U + -1) = (char)DAT_70e2;
    *(char *)(in_U + -2) = cVar3;
    *(undefined1 *)(in_U + -3) = 10;
    puVar8 = (ushort *)(in_U + -4);
    *(undefined1 *)puVar8 = 0;
    API_FCEE();
    DAT_70e6 = *puVar8;
  }
  uVar1 = DAT_70e6;
  if (DAT_70f4 == -1) {
    *(char *)((short)puVar8 + 1) = (char)DAT_70e6;
    *(char *)puVar8 = (char)(uVar1 >> 8);
    uVar2 = DAT_7006;
    *(char *)((short)puVar8 + -1) = (char)DAT_7006;
    puVar8 = puVar8 + -1;
    *(char *)puVar8 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    DAT_710e = *puVar8 + DAT_70e6;
  }
  else {
    DAT_710e = DAT_70e6;
  }
  puVar6 = (ushort *)(&DAT_M65_r2_08000__2229 + g_moduleBase);
  do {
    puVar5 = puVar6;
    puVar6 = puVar5 + 1;
  } while (*puVar5 < DAT_710e == (*puVar5 == DAT_710e));
  DAT_7110 = 0x32;
  DAT_70f8 = -5;
  uVar1 = *puVar5;
  *(char *)((short)puVar8 + 1) = (char)uVar1;
  *(char *)puVar8 = (char)(uVar1 >> 8);
  if (DAT_710e - *puVar5 != 0) {
    puVar8 = puVar8 + -1;
    *puVar8 = DAT_710e - *puVar5;
    API_FCEA();
    DAT_70f6 = *puVar8;
    DAT_7110 = -0x32;
    DAT_70f8 = 5;
    uVar1 = puVar5[-1];
    *(char *)((short)puVar8 + 1) = (char)uVar1;
    *(char *)puVar8 = (char)(uVar1 >> 8);
    if (uVar1 - DAT_710e != 0) {
      puVar8 = puVar8 + -1;
      *puVar8 = uVar1 - DAT_710e;
      API_FCEA();
      DAT_70f6 = *puVar8;
      puVar8 = puVar8 + 1;
      puVar6 = (ushort *)(&DAT_M65_r2_08000__2211 + g_moduleBase);
      while (*puVar6 < DAT_70f6 == (*puVar6 == DAT_70f6)) {
        DAT_7110 = DAT_7110 + DAT_70f8;
        puVar6 = puVar6 + 1;
      }
    }
  }
  DAT_70ee = &UNK_M65_r2_08000__3255 + ((short)((short)puVar5 + -0x2229) * 2 - g_moduleBase);
  puVar8[-1] = (ushort)((short)puVar5 + (DAT_7004 * -2 - g_moduleBase) + -0x2211);
  *(undefined1 *)((short)puVar8 + -3) = 0x18;
  puVar8 = puVar8 + -2;
  *(undefined1 *)puVar8 = 0;
  API_FCE8();
  psVar7 = (short *)(*puVar8 + DAT_70f0);
  sVar4 = DAT_70cc;
  if (DAT_70cc != -1) {
    sVar4 = DAT_70cc - DAT_7110;
  }
  if (sVar4 + *psVar7 != DAT_7046) {
    DAT_7046 = sVar4 + *psVar7;
    FUN_M65_r2_08000__1209();
  }
  sVar4 = DAT_70cc;
  if (DAT_70cc != -1) {
    sVar4 = DAT_70cc - DAT_7110;
  }
  sVar4 = sVar4 + *(short *)((short)psVar7 + (DAT_70f2 - DAT_70f0));
  if (sVar4 != DAT_704e) {
    DAT_704e = sVar4;
    FUN_M65_r2_08000__1321();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__22f9 @ M65_r2_08000::22f9 =====

void __h3000 FUN_M65_r2_08000__22f9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2356 ->$231D */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3);
  return;
}


// ===== FUN_M65_r2_08000__2305 @ M65_r2_08000::2305 =====

void __h3000 FUN_M65_r2_08000__2305(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2356 ->$231D */
                    /* inline[API_FDBC]: "5.94.."." */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3);
  return;
}


// ===== FUN_M65_r2_08000__2311 @ M65_r2_08000::2311 =====

void __h3000 FUN_M65_r2_08000__2311(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2356 ->$231D */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3);
  return;
}


// ===== FUN_M65_r2_08000__231d @ M65_r2_08000::231d =====

void __h3000 FUN_M65_r2_08000__231d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2356 ->$231D */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3);
  return;
}


// ===== FUN_M65_r2_08000__2329 @ M65_r2_08000::2329 =====

void __h3000 FUN_M65_r2_08000__2329(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2356 ->$231D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3);
  return;
}


// ===== FUN_M65_r2_08000__2335 @ M65_r2_08000::2335 =====

void __h3000 FUN_M65_r2_08000__2335(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2356 ->$231D $2311 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3);
  return;
}


// ===== FUN_M65_r2_08000__2356 @ M65_r2_08000::2356 =====

undefined2 __h3000 FUN_M65_r2_08000__2356(void)

{
  undefined2 uVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  API_FE76();
  uVar1 = DAT_709a;
  bVar3 = (byte)DAT_709a;
  *(byte *)(in_U + -1) = bVar3;
  cVar2 = (char)((ushort)uVar1 >> 8);
  *(char *)(in_U + -2) = cVar2;
  DAT_70f6 = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6C((char)((ushort)(*psVar4 + DAT_70f6) >> 8));
  API_FC74();
  return in_D;
}


// ===== FUN_M65_r2_08000__23a8 @ M65_r2_08000::23a8 =====

void __h3000 FUN_M65_r2_08000__23a8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2405 ->$23CC */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382);
  return;
}


// ===== FUN_M65_r2_08000__23b4 @ M65_r2_08000::23b4 =====

void __h3000 FUN_M65_r2_08000__23b4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2405 ->$23CC */
                    /* inline[API_FDBC]: "5.94..#." */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382);
  return;
}


// ===== FUN_M65_r2_08000__23c0 @ M65_r2_08000::23c0 =====

void __h3000 FUN_M65_r2_08000__23c0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2405 ->$23CC */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382);
  return;
}


// ===== FUN_M65_r2_08000__23cc @ M65_r2_08000::23cc =====

void __h3000 FUN_M65_r2_08000__23cc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2405 ->$23CC */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382);
  return;
}


// ===== FUN_M65_r2_08000__23d8 @ M65_r2_08000::23d8 =====

void __h3000 FUN_M65_r2_08000__23d8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2405 ->$23CC */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382);
  return;
}


// ===== FUN_M65_r2_08000__23e4 @ M65_r2_08000::23e4 =====

void __h3000 FUN_M65_r2_08000__23e4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2405 ->$23CC $23C0 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382);
  return;
}


// ===== FUN_M65_r2_08000__2405 @ M65_r2_08000::2405 =====

undefined2 __h3000 FUN_M65_r2_08000__2405(void)

{
  undefined2 uVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  API_FE76();
  uVar1 = DAT_70a2;
  bVar3 = (byte)DAT_70a2;
  *(byte *)(in_U + -1) = bVar3;
  cVar2 = (char)((ushort)uVar1 >> 8);
  *(char *)(in_U + -2) = cVar2;
  DAT_70f6 = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6C((char)((ushort)(*psVar4 + DAT_70f6) >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__2453 @ M65_r2_08000::2453 =====

void __h3000 FUN_M65_r2_08000__2453(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$24B0 ->$2477 */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d);
  return;
}


// ===== FUN_M65_r2_08000__245f @ M65_r2_08000::245f =====

void __h3000 FUN_M65_r2_08000__245f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$24B0 ->$2477 */
                    /* inline[API_FDBC]: "5.94..$-" */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d);
  return;
}


// ===== FUN_M65_r2_08000__246b @ M65_r2_08000::246b =====

void __h3000 FUN_M65_r2_08000__246b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$24B0 ->$2477 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d);
  return;
}


// ===== FUN_M65_r2_08000__2477 @ M65_r2_08000::2477 =====

void __h3000 FUN_M65_r2_08000__2477(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$24B0 ->$2477 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d);
  return;
}


// ===== FUN_M65_r2_08000__2483 @ M65_r2_08000::2483 =====

void __h3000 FUN_M65_r2_08000__2483(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$24B0 ->$2477 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d);
  return;
}


// ===== FUN_M65_r2_08000__248f @ M65_r2_08000::248f =====

void __h3000 FUN_M65_r2_08000__248f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$24B0 ->$2477 $246B */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d);
  return;
}


// ===== FUN_M65_r2_08000__24b0 @ M65_r2_08000::24b0 =====

undefined2 __h3000 FUN_M65_r2_08000__24b0(void)

{
  undefined2 uVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  API_FE76();
  uVar1 = DAT_70aa;
  bVar3 = (byte)DAT_70aa;
  *(byte *)(in_U + -1) = bVar3;
  cVar2 = (char)((ushort)uVar1 >> 8);
  *(char *)(in_U + -2) = cVar2;
  DAT_70f6 = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC74((char)((ushort)(*psVar4 + DAT_70f6) >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__24fe @ M65_r2_08000::24fe =====

void __h3000 FUN_M65_r2_08000__24fe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$255B ->$2522 */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8);
  return;
}


// ===== FUN_M65_r2_08000__250a @ M65_r2_08000::250a =====

void __h3000 FUN_M65_r2_08000__250a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$255B ->$2522 */
                    /* inline[API_FDBC]: "5.94..$." */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8);
  return;
}


// ===== FUN_M65_r2_08000__2516 @ M65_r2_08000::2516 =====

void __h3000 FUN_M65_r2_08000__2516(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$255B ->$2522 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8);
  return;
}


// ===== FUN_M65_r2_08000__2522 @ M65_r2_08000::2522 =====

void __h3000 FUN_M65_r2_08000__2522(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$255B ->$2522 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8);
  return;
}


// ===== FUN_M65_r2_08000__252e @ M65_r2_08000::252e =====

void __h3000 FUN_M65_r2_08000__252e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$255B ->$2522 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8);
  return;
}


// ===== FUN_M65_r2_08000__253a @ M65_r2_08000::253a =====

void __h3000 FUN_M65_r2_08000__253a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$255B ->$2522 $2516 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8);
  return;
}


// ===== FUN_M65_r2_08000__255b @ M65_r2_08000::255b =====

undefined2 __h3000 FUN_M65_r2_08000__255b(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_706a;
  *(short *)(in_U + -2) = sVar1;
  DAT_70f6 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70f6) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M65_r2_08000__25b0 @ M65_r2_08000::25b0 =====

void __h3000 FUN_M65_r2_08000__25b0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$260D ->$25D4 */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a);
  return;
}


// ===== FUN_M65_r2_08000__25bc @ M65_r2_08000::25bc =====

void __h3000 FUN_M65_r2_08000__25bc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$260D ->$25D4 */
                    /* inline[API_FDBC]: "5.94..%." */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a);
  return;
}


// ===== FUN_M65_r2_08000__25c8 @ M65_r2_08000::25c8 =====

void __h3000 FUN_M65_r2_08000__25c8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$260D ->$25D4 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a);
  return;
}


// ===== FUN_M65_r2_08000__25d4 @ M65_r2_08000::25d4 =====

void __h3000 FUN_M65_r2_08000__25d4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$260D ->$25D4 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a);
  return;
}


// ===== FUN_M65_r2_08000__25e0 @ M65_r2_08000::25e0 =====

void __h3000 FUN_M65_r2_08000__25e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$260D ->$25D4 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a);
  return;
}


// ===== FUN_M65_r2_08000__25ec @ M65_r2_08000::25ec =====

void __h3000 FUN_M65_r2_08000__25ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$260D ->$25D4 $25C8 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a);
  return;
}


// ===== FUN_M65_r2_08000__260d @ M65_r2_08000::260d =====

undefined2 __h3000 FUN_M65_r2_08000__260d(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7072;
  *(short *)(in_U + -2) = sVar1;
  DAT_70f6 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70f6) >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__265e @ M65_r2_08000::265e =====

void __h3000 FUN_M65_r2_08000__265e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$26BB ->$2682 */
  API_FE6A(param_1,param_2,&PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638);
  return;
}


// ===== FUN_M65_r2_08000__266a @ M65_r2_08000::266a =====

void __h3000 FUN_M65_r2_08000__266a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$26BB ->$2682 */
                    /* inline[API_FDBC]: "5.94..&8" */
  API_FDBC(param_1,param_2,&PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638);
  return;
}


// ===== FUN_M65_r2_08000__2676 @ M65_r2_08000::2676 =====

void __h3000 FUN_M65_r2_08000__2676(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$26BB ->$2682 */
  API_FE6C(param_1,param_2,&PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638);
  return;
}


// ===== FUN_M65_r2_08000__2682 @ M65_r2_08000::2682 =====

void __h3000 FUN_M65_r2_08000__2682(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$26BB ->$2682 */
  API_FE6E(param_1,param_2,&PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638);
  return;
}


// ===== FUN_M65_r2_08000__268e @ M65_r2_08000::268e =====

void __h3000 FUN_M65_r2_08000__268e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$26BB ->$2682 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638);
  return;
}


// ===== FUN_M65_r2_08000__269a @ M65_r2_08000::269a =====

void __h3000 FUN_M65_r2_08000__269a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$26BB ->$2682 $2676 */
  API_FE1A(param_1,param_2,&PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638);
  return;
}


// ===== FUN_M65_r2_08000__26bb @ M65_r2_08000::26bb =====

undefined2 __h3000 FUN_M65_r2_08000__26bb(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_707a;
  *(short *)(in_U + -2) = sVar1;
  DAT_70f6 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_70f6) >> 8));
  return in_D;
}


// ===== FUN_M65_r2_08000__270c @ M65_r2_08000::270c =====

void __h3000 FUN_M65_r2_08000__270c(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M65_r2_08000__2751_M65_r2_08000__26e6);
  return;
}


// ===== FUN_M65_r2_08000__2718 @ M65_r2_08000::2718 =====

void __h3000 FUN_M65_r2_08000__2718(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2751 ->$2730 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M65_r2_08000__2751_M65_r2_08000__26e6);
  return;
}


// ===== FUN_M65_r2_08000__2724 @ M65_r2_08000::2724 =====

void __h3000 FUN_M65_r2_08000__2724(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M65_r2_08000__2751_M65_r2_08000__26e6);
  return;
}


// ===== FUN_M65_r2_08000__2730 @ M65_r2_08000::2730 =====

void __h3000 FUN_M65_r2_08000__2730(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M65_r2_08000__2751_M65_r2_08000__26e6);
  return;
}


// ===== FUN_M65_r2_08000__2751 @ M65_r2_08000::2751 =====

undefined2 __h3000 FUN_M65_r2_08000__2751(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M65_r2_08000__2751_M65_r2_08000__26e6);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M65_r2_08000__2787 @ M65_r2_08000::2787 =====

void __h3000 FUN_M65_r2_08000__2787(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M65_r2_08000__27cc_M65_r2_08000__2761);
  return;
}


// ===== FUN_M65_r2_08000__2793 @ M65_r2_08000::2793 =====

void __h3000 FUN_M65_r2_08000__2793(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$27CC ->$27AB */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M65_r2_08000__27cc_M65_r2_08000__2761);
  return;
}


// ===== FUN_M65_r2_08000__279f @ M65_r2_08000::279f =====

void __h3000 FUN_M65_r2_08000__279f(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M65_r2_08000__27cc_M65_r2_08000__2761);
  return;
}


// ===== FUN_M65_r2_08000__27ab @ M65_r2_08000::27ab =====

void __h3000 FUN_M65_r2_08000__27ab(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M65_r2_08000__27cc_M65_r2_08000__2761);
  return;
}


// ===== FUN_M65_r2_08000__27cc @ M65_r2_08000::27cc =====

undefined2 __h3000 FUN_M65_r2_08000__27cc(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M65_r2_08000__27cc_M65_r2_08000__2761);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M65_r2_08000__2802 @ M65_r2_08000::2802 =====

void __h3000 FUN_M65_r2_08000__2802(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M65_r2_08000__2847_M65_r2_08000__27dc);
  return;
}


// ===== FUN_M65_r2_08000__280e @ M65_r2_08000::280e =====

void __h3000 FUN_M65_r2_08000__280e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2847 ->$2826 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M65_r2_08000__2847_M65_r2_08000__27dc);
  return;
}


// ===== FUN_M65_r2_08000__281a @ M65_r2_08000::281a =====

void __h3000 FUN_M65_r2_08000__281a(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M65_r2_08000__2847_M65_r2_08000__27dc);
  return;
}


// ===== FUN_M65_r2_08000__2826 @ M65_r2_08000::2826 =====

void __h3000 FUN_M65_r2_08000__2826(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M65_r2_08000__2847_M65_r2_08000__27dc);
  return;
}


// ===== FUN_M65_r2_08000__2847 @ M65_r2_08000::2847 =====

undefined2 __h3000 FUN_M65_r2_08000__2847(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M65_r2_08000__2847_M65_r2_08000__27dc);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M65_r2_08000__287d @ M65_r2_08000::287d =====

void __h3000 FUN_M65_r2_08000__287d(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M65_r2_08000__28c2_M65_r2_08000__2857);
  return;
}


// ===== FUN_M65_r2_08000__2889 @ M65_r2_08000::2889 =====

void __h3000 FUN_M65_r2_08000__2889(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$28C2 ->$28A1 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M65_r2_08000__28c2_M65_r2_08000__2857);
  return;
}


// ===== FUN_M65_r2_08000__2895 @ M65_r2_08000::2895 =====

void __h3000 FUN_M65_r2_08000__2895(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M65_r2_08000__28c2_M65_r2_08000__2857);
  return;
}


// ===== FUN_M65_r2_08000__28a1 @ M65_r2_08000::28a1 =====

void __h3000 FUN_M65_r2_08000__28a1(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M65_r2_08000__28c2_M65_r2_08000__2857);
  return;
}


// ===== FUN_M65_r2_08000__28c2 @ M65_r2_08000::28c2 =====

undefined2 __h3000 FUN_M65_r2_08000__28c2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M65_r2_08000__28c2_M65_r2_08000__2857);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M65_r2_08000__28d2 @ M65_r2_08000::28d2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__28d2(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70c0 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__29d2();
  API_FC80((char)((ushort)DAT_70c0 >> 8),(char)DAT_70c0,param_1,0x42);
  return in_D;
}


// ===== FUN_M65_r2_08000__28f6 @ M65_r2_08000::28f6 =====

undefined2 __h3000 FUN_M65_r2_08000__28f6(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70c0;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$2972 ->$2946
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__2972();
  FUN_M65_r2_08000__2a76();
  return in_D;
}


// ===== FUN_M65_r2_08000__2946 @ M65_r2_08000::2946 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__2946(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70c0 = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x42);
  API_FE40((char)((ushort)DAT_70c0 >> 8),(char)DAT_70c0,param_1,9);
  FUN_M65_r2_08000__2972();
  FUN_M65_r2_08000__2a76();
  FUN_M65_r2_08000__29d2();
  return in_D;
}


// ===== FUN_M65_r2_08000__2972 @ M65_r2_08000::2972 =====

void __h3000 FUN_M65_r2_08000__2972(void)

{
  LcdSetCursor();
  if (DAT_70c0 == 0) {
                    /* inline[API_FC38]: "C4" */
    LcdPrintInline();
  }
  else if (DAT_70c0 == 1) {
                    /* inline[API_FC38]: "C5" */
    LcdPrintInline();
  }
  else if (DAT_70c0 == 2) {
                    /* inline[API_FC38]: "C6" */
    LcdPrintInline();
  }
  else if (DAT_70c0 == 3) {
                    /* inline[API_FC38]: "C7" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "C8" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_M65_r2_08000__29d2 @ M65_r2_08000::29d2 =====

void __h3000 FUN_M65_r2_08000__29d2(void)

{
  FUN_M65_r2_08000__2a9a();
  return;
}


// ===== FUN_M65_r2_08000__29d6 @ M65_r2_08000::29d6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__29d6(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70be = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__2a9a();
  API_FC80((char)((ushort)DAT_70be >> 8),(char)DAT_70be,param_1,0x41);
  return in_D;
}


// ===== FUN_M65_r2_08000__29fa @ M65_r2_08000::29fa =====

undefined2 __h3000 FUN_M65_r2_08000__29fa(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70be;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$2A76 ->$2A4A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__2a76();
  FUN_M65_r2_08000__2972();
  return in_D;
}


// ===== FUN_M65_r2_08000__2a4a @ M65_r2_08000::2a4a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__2a4a(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70be = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x41);
  API_FE40((char)((ushort)DAT_70be >> 8),(char)DAT_70be,param_1,8);
  FUN_M65_r2_08000__2a76();
  FUN_M65_r2_08000__2972();
  FUN_M65_r2_08000__2a9a();
  return in_D;
}


// ===== FUN_M65_r2_08000__2a76 @ M65_r2_08000::2a76 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__2a76(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_r2_08000__31f5 +
                          g_moduleBase + ((DAT_70c0 & 0xff) * 0xc + 2 + DAT_70be & 0xff) * 4) >> 8),
           4,&UNK_M65_r2_08000__31f5 +
             g_moduleBase + ((DAT_70c0 & 0xff) * 0xc + 2 + DAT_70be & 0xff) * 4);
  return;
}


// ===== FUN_M65_r2_08000__2a9a @ M65_r2_08000::2a9a =====

undefined2 __h3000 FUN_M65_r2_08000__2a9a(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  FUN_M65_r2_08000__2cd1();
  uVar1 = (undefined1)((ushort)DAT_7162 >> 8);
  if (DAT_714a == 0) {
    API_FD3C(uVar1);
  }
  else {
    API_FD3C(uVar1);
    API_FD44();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__2ac1 @ M65_r2_08000::2ac1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__2ac1(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70c8 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__2bbe();
  API_FC80((char)((ushort)DAT_70c8 >> 8),(char)DAT_70c8,param_1,0x43);
  return in_D;
}


// ===== FUN_M65_r2_08000__2ae5 @ M65_r2_08000::2ae5 =====

undefined2 __h3000 FUN_M65_r2_08000__2ae5(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70c8;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       deglitch:                          " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$2B68 ->$2B41
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__2b68();
  return in_D;
}


// ===== FUN_M65_r2_08000__2b41 @ M65_r2_08000::2b41 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__2b41(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70c8 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x43);
  API_FE40((char)((ushort)DAT_70c8 >> 8),(char)DAT_70c8,param_1,0xb);
  FUN_M65_r2_08000__2bbe();
  return in_D;
}


// ===== FUN_M65_r2_08000__2b68 @ M65_r2_08000::2b68 =====

undefined2 __h3000 FUN_M65_r2_08000__2b68(void)

{
  undefined2 in_D;
  
  if (DAT_70c8 == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "lock to channel 1      " */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "channel 1 and channel 2" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M65_r2_08000__2bbe @ M65_r2_08000::2bbe =====

undefined2 __h3000 FUN_M65_r2_08000__2bbe(void)

{
  undefined2 in_D;
  
  DAT_70c6 = DAT_70c8;
  DAT_710a = 0;
  return in_D;
}


// ===== FUN_M65_r2_08000__2bcf @ M65_r2_08000::2bcf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_r2_08000__2bcf(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70c2 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_r2_08000__2cb3();
  API_FC80((char)((ushort)DAT_70c2 >> 8),(char)DAT_70c2,param_1,0x44);
  return in_D;
}


// ===== FUN_M65_r2_08000__2bf3 @ M65_r2_08000::2bf3 =====

void __h3000 FUN_M65_r2_08000__2bf3(void)

{
  DAT_6074 = DAT_70c2;
  FUN_M65_r2_08000__0a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       polyphonic-                   -solo" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$2C70 ->$2C4B
                       $0005 $0005 $0000 */
  SetupParamEditPage();
  FUN_M65_r2_08000__2c70();
  return;
}


// ===== FUN_M65_r2_08000__2c4b @ M65_r2_08000::2c4b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_r2_08000__2c4b(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_70c2 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_3,0x44);
  API_FE40((char)((ushort)DAT_70c2 >> 8),(char)DAT_70c2,param_3,10);
  FUN_M65_r2_08000__2cb3();
  FUN_M65_r2_08000__2c70();
  return;
}


// ===== FUN_M65_r2_08000__2c70 @ M65_r2_08000::2c70 =====

undefined2 __h3000 FUN_M65_r2_08000__2c70(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                   " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_70c2 + -5;
  *(undefined1 *)(in_U + -3) = 5;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  LcdSetCursor((char)((ushort)(*psVar1 + 0x10) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M65_r2_08000__2cb3 @ M65_r2_08000::2cb3 =====

undefined2 __h3000 FUN_M65_r2_08000__2cb3(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_70c2;
  *(char *)(in_U + -1) = (char)DAT_70c2;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEE();
  DAT_713c = *puVar2;
  DAT_710a = 0;
  return in_D;
}


// ===== FUN_M65_r2_08000__2cd1 @ M65_r2_08000::2cd1 =====

undefined2 __h3000 FUN_M65_r2_08000__2cd1(void)

{
  undefined2 uVar1;
  undefined2 *puVar2;
  ushort uVar3;
  short sVar4;
  undefined2 in_D;
  short in_U;
  short *psVar5;
  ushort *puVar6;
  ushort *puVar7;
  
  uVar1 = *(undefined2 *)(&UNK_M65_r2_08000__33a5 + g_moduleBase + (DAT_70be & 0xff) * 2);
  DAT_712e = uVar1;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0xff;
  psVar5 = (short *)(in_U + -4);
  *(undefined1 *)psVar5 = 0xff;
  API_FCDE();
  uVar1 = DAT_712e;
  DAT_7130 = *psVar5 + -2;
  if (DAT_70c0 == 0) {
    DAT_7136 = 0x10;
  }
  else if (DAT_70c0 == 1) {
    DAT_7136 = 8;
  }
  else if (DAT_70c0 == 2) {
    DAT_7136 = 4;
  }
  else {
    if (DAT_70c0 != 3) {
      DAT_7136 = 1;
      goto LAB_M65_r2_08000__2d75;
    }
    DAT_7136 = 2;
  }
  puVar2 = (undefined2 *)(&UNK_M65_r2_08000__341d + g_moduleBase + (DAT_70c0 & 0xff) * 10);
  DAT_7120 = *puVar2;
  DAT_7122 = puVar2[1];
  DAT_7124 = puVar2[2];
  DAT_7126 = puVar2[3];
  DAT_7128 = puVar2[4];
LAB_M65_r2_08000__2d75:
  DAT_70f6 = (DAT_70c0 & 0xff) * 0x30;
  DAT_7160 = *(short *)(&UNK_M65_r2_08000__3105 +
                       g_moduleBase + (0x2e - DAT_70be & 0xfffc) + DAT_70f6);
  DAT_715e = *(short *)((short)(&UNK_M65_r2_08000__3105 +
                               g_moduleBase + (0x2e - DAT_70be & 0xfffc) + DAT_70f6) + 2);
  DAT_7132 = DAT_7130;
  *(char *)((short)psVar5 + 1) = (char)DAT_712e;
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  uVar3 = (ushort)DAT_7136 >> 8;
  *(char *)((short)psVar5 + -1) = (char)DAT_7136 << 1;
  puVar6 = (ushort *)(psVar5 + -1);
  *(char *)puVar6 = (char)uVar3;
  API_FCF0();
  sVar4 = DAT_705a;
  DAT_70f6 = puVar6[1];
  *(char *)((short)puVar6 + 3) = (char)DAT_705a;
  *(char *)(puVar6 + 1) = (char)((ushort)sVar4 >> 8);
  *(undefined1 *)((short)puVar6 + 1) = 0x2c;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  sVar4 = DAT_7062;
  DAT_70f8 = *puVar6;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_70f8 <= (ushort)(DAT_715e - DAT_7160) || DAT_715e - DAT_7160 < (short)DAT_70f8)) {
    DAT_713a = (DAT_70f6 + DAT_70f8) - DAT_715e;
  }
  else {
    DAT_713a = DAT_70f6 - DAT_7160;
  }
  *(char *)((short)puVar6 + 1) = (char)DAT_7062;
  *(char *)puVar6 = (char)((ushort)sVar4 >> 8);
  *(undefined1 *)((short)puVar6 + -1) = 0x2c;
  puVar6 = puVar6 + -1;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  DAT_70f8 = *puVar6;
  puVar7 = puVar6 + 1;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_70f8 <= (ushort)(DAT_715e - DAT_7160) || DAT_715e - DAT_7160 < (short)DAT_70f8)) {
    DAT_711e = (DAT_70f6 + DAT_70f8 + -0x8000) - DAT_715e;
  }
  else {
    DAT_711e = (DAT_70f6 + 0x8000) - DAT_7160;
  }
  DAT_70c6 = 0xffff;
  if (DAT_714c == -1) {
    if (DAT_714a != -1) {
      DAT_713a = DAT_711e + -0x8000;
    }
  }
  else {
    DAT_711e = DAT_711e + -0x8000;
    *puVar6 = DAT_705a - DAT_7062;
    API_FCC8();
    puVar7 = puVar6 + 1;
    DAT_70c6 = 0;
  }
  sVar4 = DAT_7130;
  *(char *)((short)puVar7 + -1) = (char)DAT_7130;
  *(char *)(puVar7 + -1) = (char)((ushort)sVar4 >> 8);
  uVar1 = DAT_7136;
  *(char *)((short)puVar7 + -3) = (char)DAT_7136;
  puVar7 = puVar7 + -2;
  *(char *)puVar7 = (char)((ushort)uVar1 >> 8);
  API_FCF0();
  *(undefined1 *)((short)puVar7 + 1) = 0xff;
  *(undefined1 *)puVar7 = 0xff;
  API_FCDE();
  DAT_70f6 = *puVar7;
  DAT_70d6 = DAT_70f6 + DAT_70d2;
  DAT_70dc = DAT_70f6 + DAT_70d4;
  DAT_7162 = DAT_70f6;
  *(undefined1 *)((short)puVar7 + 1) = 0xff;
  *(undefined1 *)puVar7 = 0x7f;
  uVar3 = DAT_70f6;
  *(char *)((short)puVar7 + -1) = (char)DAT_70f6;
  puVar7 = puVar7 + -1;
  *(char *)puVar7 = (char)(uVar3 >> 8);
  API_FCEA();
  DAT_713e = *puVar7 + 5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_713e >> 8));
  if (DAT_714a == 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70dc >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70dc >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70d6 >> 8));
  }
  DAT_70c6 = CONCAT11((byte)((ushort)DAT_70c8 >> 8) & DAT_70c6._0_1_,(byte)DAT_70c8 & DAT_70c6._0_1_
                     );
  DAT_710a = 0;
  return in_D;
}


// ===== FUN_M65_r2_08000__2f21 @ M65_r2_08000::2f21 =====

undefined2 __h3000 FUN_M65_r2_08000__2f21(void)

{
  undefined2 uVar1;
  undefined *puVar2;
  undefined2 in_D;
  short sVar3;
  byte extraout_CC;
  code *pcVar4;
  short *in_U;
  
  DAT_70f8 = *in_U;
  DAT_70fc = in_U[1];
  pcVar4 = (code *)((DAT_70fc + 0x18) * 2 + g_moduleBase);
  puVar2 = &DAT_M65_r2_08000__2f9f;
  if (DAT_70f8 < 0 || pcVar4 <= FUN_d060) {
    sVar3 = -DAT_70f8;
  }
  else {
    sVar3 = 100 - DAT_70f8;
    puVar2 = &DAT_M65_r2_08000__2fa1;
  }
  pcVar4 = pcVar4 + (short)puVar2;
  sVar3 = CONCAT11((char)((ushort)sVar3 >> 8) << 1 | (byte)sVar3 >> 7,(byte)sVar3 << 1) +
          g_moduleBase;
  uVar1 = *(undefined2 *)pcVar4;
  DAT_70fa = DAT_70f8;
  *(char *)((short)in_U + 3) = (char)uVar1;
  *(char *)(in_U + 1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M65_r2_08000__3039 + sVar3);
  *(char *)((short)in_U + 1) = (char)uVar1;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  sVar3 = DAT_70f8;
  if (!(bool)(extraout_CC & 1 & -1 < DAT_70f8)) {
    sVar3 = DAT_70f8 + 100;
  }
  sVar3 = CONCAT11((char)((ushort)sVar3 >> 8) << 1 | (byte)sVar3 >> 7,(byte)sVar3 << 1) +
          g_moduleBase;
  uVar1 = *(undefined2 *)(pcVar4 + 0x4c);
  *(char *)((short)in_U + -1) = (char)uVar1;
  *(char *)(in_U + -1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M65_r2_08000__3039 + sVar3);
  *(char *)((short)in_U + -3) = (char)uVar1;
  in_U = in_U + -2;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70f6 = *in_U;
  *in_U = 0x1000 - DAT_70f6;
  return in_D;
}


// ===== MODULE_66_01_entry @ M65_r2_08000::34f2 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 MODULE_66_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $34F6 */
  uVar1 = ModuleSetBase();
  DAT_714e = 0;
  DAT_714a = 0xffff;
  DAT_714c = 0xffff;
  _DAT_7154 = 0xffff;
  DAT_7150 = 0xffff;
  DAT_7138 = 3000;
  FUN_M65_r2_08000__01dd();
  FUN_M65_r2_08000__01a5();
  FUN_M65_r2_08000__02a4();
  MODULE_65_02_entry();
  API_FC58();
  if (DAT_600a != 'f') {
    DAT_60da = 3;
    API_FE38();
    FUN_a2f1();
    FUN_M65_r2_08000__02f1();
  }
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__1209();
  FUN_M65_r2_08000__1321();
  FUN_M65_r2_08000__1403();
  FUN_M65_r2_08000__1516();
  FUN_M65_r2_08000__2a9a();
  FUN_M65_r2_08000__29d2();
  FUN_M65_r2_08000__2cb3();
  FUN_M65_r2_08000__042b();
  DAT_6105 = 1;
  DAT_6106 = 0x65;
  if (DAT_600a != 'f') {
    API_FD20(0x4e);
    API_FE36();
  }
  API_FDF6();
  API_FE18();
  FUN_M65_r2_08000__0a65();
  API_FE10();
  return uVar1;
}


// ===== MODULE_65_01_entry @ M65_r2_08000::3635 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 MODULE_65_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $3639 */
  uVar1 = ModuleSetBase();
  DAT_714c = 0;
  DAT_714a = 0xffff;
  DAT_714e = 0xffff;
  _DAT_7154 = 0xffff;
  DAT_7150 = 0xffff;
  DAT_7138 = 3000;
  FUN_M65_r2_08000__01dd();
  FUN_M65_r2_08000__01a5();
  FUN_M65_r2_08000__02a4();
  MODULE_65_02_entry();
  API_FC58();
  if (DAT_600a != 'e') {
    DAT_60da = 3;
    API_FE38();
    FUN_a2f1();
    FUN_M65_r2_08000__02d9();
  }
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__1209();
  FUN_M65_r2_08000__1321();
  FUN_M65_r2_08000__1403();
  FUN_M65_r2_08000__1516();
  FUN_M65_r2_08000__29d2();
  FUN_M65_r2_08000__2a9a();
  FUN_M65_r2_08000__2cb3();
  FUN_M65_r2_08000__042b();
  DAT_6105 = 1;
  DAT_6106 = 0x65;
  if (DAT_600a != 'e') {
    API_FD20(0x4e);
    API_FE36();
  }
  API_FDF6();
  API_FE18();
  FUN_M65_r2_08000__0a65();
  API_FE10();
  return uVar1;
}


// ===== MODULE_67_01_entry @ M65_r2_08000::3758 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 MODULE_67_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $375C */
  uVar1 = ModuleSetBase();
  DAT_714a = 0;
  DAT_714e = 0xffff;
  DAT_714c = 0xffff;
  _DAT_7154 = 0xffff;
  DAT_7150 = 0xffff;
  DAT_7138 = 0x5dc;
  FUN_M65_r2_08000__01dd();
  FUN_M65_r2_08000__01a5();
  FUN_M65_r2_08000__02a4();
  FUN_M65_r2_08000__255b();
  FUN_M65_r2_08000__2356();
  MODULE_65_02_entry();
  API_FC58();
  if (DAT_600a != 'g') {
    DAT_60da = 3;
    API_FE38();
    FUN_a2f1();
    FUN_M65_r2_08000__0387();
  }
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__1321();
  FUN_M65_r2_08000__1516();
  FUN_M65_r2_08000__2a9a();
  FUN_M65_r2_08000__29d2();
  FUN_M65_r2_08000__2cb3();
  FUN_M65_r2_08000__2bbe();
  FUN_M65_r2_08000__05db();
  DAT_6105 = 1;
  DAT_6106 = 0x45;
  if (DAT_600a != 'g') {
    API_FD20(0x4e);
    API_FE36();
  }
  API_FDF6();
  API_FE18();
  FUN_M65_r2_08000__0b7e();
  API_FE10();
  return uVar1;
}


// ===== MODULE_68_01_entry @ M65_r2_08000::389e =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 MODULE_68_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $38A2 */
  uVar1 = ModuleSetBase();
  DAT_7150 = 0;
  DAT_714e = 0xffff;
  DAT_714a = 0xffff;
  DAT_714c = 0xffff;
  _DAT_7154 = 0xffff;
  DAT_7158 = 0xfff6;
  DAT_715a = &PTR_FUN_M65_r2_08000__1cbb_M65_r2_08000__0dac;
  FUN_M65_r2_08000__01dd();
  FUN_M65_r2_08000__01a5();
  FUN_M65_r2_08000__02a4();
  API_FC58();
  if (DAT_600a != 'h') {
    DAT_60da = 3;
    API_FE38();
    FUN_a2f1();
    FUN_M65_r2_08000__0309();
  }
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__1209();
  FUN_M65_r2_08000__1321();
  FUN_M65_r2_08000__1612();
  FUN_M65_r2_08000__1717();
  FUN_M65_r2_08000__1612();
  FUN_M65_r2_08000__1717();
  FUN_M65_r2_08000__0714();
  DAT_6105 = 1;
  DAT_6106 = 0x65;
  if (DAT_600a != 'h') {
    API_FD20(0x4e);
    API_FE36();
  }
  API_FDF6();
  API_FE18();
  FUN_M65_r2_08000__0c65();
  API_FE10();
  return uVar1;
}


// ===== MODULE_64_01_entry @ M65_r2_08000::3a0a =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 MODULE_64_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $3A0E */
  uVar1 = ModuleSetBase();
  _DAT_7154 = 0;
  DAT_714a = 0xffff;
  DAT_714e = 0xffff;
  DAT_714c = 0xffff;
  DAT_7150 = 0xffff;
  DAT_7138 = 3000;
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1e);
  FUN_M65_r2_08000__01dd();
  FUN_M65_r2_08000__01a5();
  FUN_M65_r2_08000__02a4();
  MODULE_65_02_entry();
  API_FC58();
  if (DAT_600a != 'd') {
    DAT_60da = 3;
    API_FE38();
    FUN_a2f1();
    FUN_M65_r2_08000__02c1();
  }
  FUN_M65_r2_08000__1000();
  FUN_M65_r2_08000__184e();
  FUN_M65_r2_08000__1a9f();
  FUN_M65_r2_08000__1b8a();
  FUN_M65_r2_08000__1146();
  FUN_M65_r2_08000__1516();
  FUN_M65_r2_08000__2a9a();
  FUN_M65_r2_08000__29d2();
  FUN_M65_r2_08000__2cb3();
  FUN_M65_r2_08000__089d();
  DAT_6105 = 1;
  DAT_6106 = 0x8e;
  if (DAT_600a != 'd') {
    API_FD20(0x4e);
    API_FE36();
  }
  API_FDF6();
  API_FE18();
  FUN_M65_r2_08000__0d80();
  API_FE12();
  FUN_M65_r2_08000__0d12();
  return uVar1;
}


