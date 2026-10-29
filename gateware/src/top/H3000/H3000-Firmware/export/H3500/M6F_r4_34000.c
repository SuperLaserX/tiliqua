// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M6F_r4_34000 M6F_r4_34000::0000-M6F_r4_34000::3fff, 262 functions
// Bank r4_34000 (module id 6F, sub 00)

// ===== MODULE_6F_01_entry @ M6F_r4_34000::00e9 =====

undefined2 __h3000 MODULE_6F_01_entry(void)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  undefined2 uStack_8;
  
                    /* inline[API_FC60]: $00ED */
  ModuleSetBase();
  uStack_8 = CONCAT11(extraout_A,extraout_B);
  FUN_M6F_r4_34000__0132();
  FUN_M6F_r4_34000__01cb();
  FUN_M6F_r4_34000__022a();
  DAT_60da = 3;
  API_FE38();
  FUN_M6F_r4_34000__05a1();
  FUN_a2f1();
  FUN_M6F_r4_34000__024c();
  FUN_M6F_r4_34000__02a9();
  FUN_M6F_r4_34000__02f3();
  FUN_M6F_r4_34000__0f0a();
  FUN_M6F_r4_34000__1052();
  API_FE36();
  FUN_M6F_r4_34000__02ff();
  API_FDF6();
  API_FE18();
  FUN_M6F_r4_34000__072b();
  API_FE10();
  return uStack_8;
}


// ===== FUN_M6F_r4_34000__0132 @ M6F_r4_34000::0132 =====

undefined2 __h3000 FUN_M6F_r4_34000__0132(void)

{
  undefined2 in_D;
  
                    /* inline[API_FE08]: 61:00 63:08 69:10 6B:18 71:20 73:28 79:30 7B:38 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 65:06 67:0E 6D:16 6F:1E 75:26 77:2E 7D:36 7F:3E */
  LoadParamsScaled();
                    /* inline[API_FE04]: 81:40 82:42 83:44 84:46 85:48 86:4A 87:4C 88:4E 89:50 8A:52
                        */
  LoadParamsSigned();
                    /* inline[API_FE04]: 8B:54 8C:56 8D:58 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 91:8E 93:94 95:96 97:9C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 51:BE 53:C4 55:C6 57:CC 59:CE 5B:D4 5D:D6 5F:DC */
  LoadParamsScaled();
                    /* inline[API_FE04]: 8E:DE 8F:E0 90:E2 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 19:9E 1A:A6 1B:AE 1C:B6 */
  LoadParamsSigned();
  DAT_70ea = 0xffff;
  DAT_70e8 = 0;
  return in_D;
}


// ===== FUN_M6F_r4_34000__01cb @ M6F_r4_34000::01cb =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M6F_r4_34000__01cb(void)

{
  undefined2 in_D;
  
  DAT_7002 = 0;
  DAT_700a = 0;
  DAT_7012 = 0;
  DAT_701a = 0;
  DAT_7022 = 0;
  DAT_702a = 0;
  DAT_7032 = 0;
  DAT_703a = 0;
  DAT_705a = 0;
  DAT_705c = 0;
  DAT_705e = 0;
  DAT_7060 = 0;
  DAT_7062 = 0;
  DAT_7064 = 0;
  DAT_7066 = 0;
  DAT_7068 = 0;
  DAT_706a = 0;
  DAT_706c = 0;
  _DAT_706e = 0;
  DAT_7070 = 0;
  DAT_7072 = 0;
  DAT_7090 = 0;
  DAT_7098 = 0;
  DAT_70c0 = 0;
  DAT_70c8 = 0;
  DAT_70a0 = 0;
  DAT_70a8 = 0;
  DAT_70b0 = 0;
  DAT_70b8 = 0;
  return in_D;
}


// ===== FUN_M6F_r4_34000__022a @ M6F_r4_34000::022a =====

undefined2 __h3000 FUN_M6F_r4_34000__022a(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M6F_r4_34000__1f5f();
  FUN_M6F_r4_34000__1fda();
  FUN_M6F_r4_34000__2055();
  FUN_M6F_r4_34000__20d0();
  FUN_M6F_r4_34000__1e1b();
  FUN_M6F_r4_34000__1ec9();
  return in_D;
}


// ===== FUN_M6F_r4_34000__024c @ M6F_r4_34000::024c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0260 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6F_r4_34000__024c(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  uVar2 = (undefined1)in_D;
  stack0xfff9 = CONCAT12(uVar2,param_1);
  uVar1 = (undefined1)((ushort)in_D >> 8);
  _auStack_8 = CONCAT13(uVar1,stack0xfff9);
  DspLoadProgram();
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar2,0x6f11);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar2,0x12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DspLoadProgram(uVar1,uVar2,0x6f12);
        if ((extraout_CC_02 >> 2 & 1) != 0) {
          DAT_70e4 = 100;
          DAT_7128 = "tput";
          API_FC6C(0);
          API_FC74();
          FUN_M6F_r4_34000__21e0();
          FUN_M6F_r4_34000__22a8();
          FUN_M6F_r4_34000__239b();
          API_FD7C();
          return auStack_8;
        }
      }
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M6F_r4_34000__02a9 @ M6F_r4_34000::02a9 =====

undefined2 __h3000 FUN_M6F_r4_34000__02a9(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M6F_r4_34000__1c92();
  FUN_M6F_r4_34000__1d76();
  FUN_M6F_r4_34000__1496();
  FUN_M6F_r4_34000__15cf();
  FUN_M6F_r4_34000__1658();
  FUN_M6F_r4_34000__16e1();
  FUN_M6F_r4_34000__176a();
  FUN_M6F_r4_34000__17f3();
  FUN_M6F_r4_34000__187c();
  FUN_M6F_r4_34000__1905();
  FUN_M6F_r4_34000__198e();
  FUN_M6F_r4_34000__1a17();
  FUN_M6F_r4_34000__1b29();
  FUN_M6F_r4_34000__1bb2();
  FUN_M6F_r4_34000__1aa0();
  FUN_M6F_r4_34000__0d36();
  FUN_M6F_r4_34000__0e0f();
  FUN_M6F_r4_34000__0f0a();
  FUN_M6F_r4_34000__1052();
  FUN_M6F_r4_34000__1178();
  FUN_M6F_r4_34000__1242();
  FUN_M6F_r4_34000__130f();
  FUN_M6F_r4_34000__13e8();
  return uStack_8;
}


// ===== FUN_M6F_r4_34000__02f3 @ M6F_r4_34000::02f3 =====

undefined2 __h3000 FUN_M6F_r4_34000__02f3(void)

{
  undefined2 in_D;
  
  API_FD20(0x4e);
  return in_D;
}


// ===== FUN_M6F_r4_34000__02ff @ M6F_r4_34000::02ff =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M6F_r4_34000__02ff(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 " ratio  " 21 $1C4F $1C5B */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "p delay " 25 $1D49 $1D55 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 " delay 1" 29 $1138 $1144 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 " delay 2" 2D $1202 $120E */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "cutoff 1" 31 $0CF6 $0D02 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "cutoff 2" 35 $0DCF $0DDB */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "q fact 1" 39 $0E9C $0EA8 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "q fact 2" 3D $0FE4 $0FF0 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 " scale 1" 41 $12CF $12DB */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 " scale 2" 45 $13A8 $13B4 */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "left mix" 49 $1DEE $1DFA */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 "rightmix" 4D $1E9C $1EA8 */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M6F_r4_34000__0401;
  _DAT_60f7 = 0x20;
  DAT_6105 = 1;
  DAT_6106 = 0x99;
  return in_D;
}


// ===== FUN_M6F_r4_34000__0441 @ M6F_r4_34000::0441 =====

void __h3000 FUN_M6F_r4_34000__0441(void)

{
  FUN_M6F_r4_34000__0cd2();
  FUN_M6F_r4_34000__072b();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__044c @ M6F_r4_34000::044c =====

void __h3000 FUN_M6F_r4_34000__044c(void)

{
  FUN_M6F_r4_34000__0dab();
  FUN_M6F_r4_34000__072b();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__0457 @ M6F_r4_34000::0457 =====

void __h3000 FUN_M6F_r4_34000__0457(void)

{
  FUN_M6F_r4_34000__0e84();
  FUN_M6F_r4_34000__072b();
  API_FE14();
  return;
}


// ===== FUN_M6F_r4_34000__0462 @ M6F_r4_34000::0462 =====

void __h3000 FUN_M6F_r4_34000__0462(void)

{
  FUN_M6F_r4_34000__0fcc();
  FUN_M6F_r4_34000__072b();
  API_FE16();
  return;
}


// ===== FUN_M6F_r4_34000__046d @ M6F_r4_34000::046d =====

void __h3000 FUN_M6F_r4_34000__046d(void)

{
  FUN_M6F_r4_34000__1114();
  FUN_M6F_r4_34000__0764();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__0478 @ M6F_r4_34000::0478 =====

void __h3000 FUN_M6F_r4_34000__0478(void)

{
  FUN_M6F_r4_34000__11de();
  FUN_M6F_r4_34000__0764();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__0483 @ M6F_r4_34000::0483 =====

void __h3000 FUN_M6F_r4_34000__0483(void)

{
  FUN_M6F_r4_34000__12ab();
  FUN_M6F_r4_34000__0764();
  API_FE14();
  return;
}


// ===== FUN_M6F_r4_34000__048e @ M6F_r4_34000::048e =====

void __h3000 FUN_M6F_r4_34000__048e(void)

{
  FUN_M6F_r4_34000__1384();
  FUN_M6F_r4_34000__0764();
  API_FE16();
  return;
}


// ===== FUN_M6F_r4_34000__0499 @ M6F_r4_34000::0499 =====

void __h3000 FUN_M6F_r4_34000__0499(void)

{
  FUN_M6F_r4_34000__1c2b();
  FUN_M6F_r4_34000__079d();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__04a4 @ M6F_r4_34000::04a4 =====

void __h3000 FUN_M6F_r4_34000__04a4(void)

{
  FUN_M6F_r4_34000__1d25();
  FUN_M6F_r4_34000__079d();
  API_FE14();
  return;
}


// ===== FUN_M6F_r4_34000__04af @ M6F_r4_34000::04af =====

void __h3000 FUN_M6F_r4_34000__04af(void)

{
  FUN_M6F_r4_34000__1dca();
  FUN_M6F_r4_34000__07cf();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__04ba @ M6F_r4_34000::04ba =====

void __h3000 FUN_M6F_r4_34000__04ba(void)

{
  FUN_M6F_r4_34000__1e78();
  FUN_M6F_r4_34000__07cf();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__04c5 @ M6F_r4_34000::04c5 =====

void __h3000 FUN_M6F_r4_34000__04c5(void)

{
  FUN_M6F_r4_34000__1f26();
  FUN_M6F_r4_34000__0c29();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__04d0 @ M6F_r4_34000::04d0 =====

void __h3000 FUN_M6F_r4_34000__04d0(void)

{
  FUN_M6F_r4_34000__1fa1();
  FUN_M6F_r4_34000__0c29();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__04db @ M6F_r4_34000::04db =====

void __h3000 FUN_M6F_r4_34000__04db(void)

{
  FUN_M6F_r4_34000__201c();
  FUN_M6F_r4_34000__0c64();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__04e6 @ M6F_r4_34000::04e6 =====

void __h3000 FUN_M6F_r4_34000__04e6(void)

{
  FUN_M6F_r4_34000__2097();
  FUN_M6F_r4_34000__0c64();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__04f1 @ M6F_r4_34000::04f1 =====

void __h3000 FUN_M6F_r4_34000__04f1(void)

{
  FUN_M6F_r4_34000__21e4();
  FUN_M6F_r4_34000__0be7();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__04fc @ M6F_r4_34000::04fc =====

void __h3000 FUN_M6F_r4_34000__04fc(void)

{
  FUN_M6F_r4_34000__20e0();
  FUN_M6F_r4_34000__0be7();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__0507 @ M6F_r4_34000::0507 =====

void __h3000 FUN_M6F_r4_34000__0507(void)

{
  FUN_M6F_r4_34000__22b7();
  FUN_M6F_r4_34000__0be7();
  API_FE14();
  return;
}


// ===== FUN_M6F_r4_34000__0512 @ M6F_r4_34000::0512 =====

void __h3000 FUN_M6F_r4_34000__0512(void)

{
  FUN_M6F_r4_34000__145d();
  FUN_M6F_r4_34000__0a25();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__051d @ M6F_r4_34000::051d =====

void __h3000 FUN_M6F_r4_34000__051d(void)

{
  FUN_M6F_r4_34000__1596();
  FUN_M6F_r4_34000__0a25();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__0528 @ M6F_r4_34000::0528 =====

void __h3000 FUN_M6F_r4_34000__0528(void)

{
  FUN_M6F_r4_34000__161f();
  FUN_M6F_r4_34000__0a74();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__0533 @ M6F_r4_34000::0533 =====

void __h3000 FUN_M6F_r4_34000__0533(void)

{
  FUN_M6F_r4_34000__16a8();
  FUN_M6F_r4_34000__0a74();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__053e @ M6F_r4_34000::053e =====

void __h3000 FUN_M6F_r4_34000__053e(void)

{
  FUN_M6F_r4_34000__1731();
  FUN_M6F_r4_34000__0ab3();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__0549 @ M6F_r4_34000::0549 =====

void __h3000 FUN_M6F_r4_34000__0549(void)

{
  FUN_M6F_r4_34000__17ba();
  FUN_M6F_r4_34000__0ab3();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__0554 @ M6F_r4_34000::0554 =====

void __h3000 FUN_M6F_r4_34000__0554(void)

{
  FUN_M6F_r4_34000__1843();
  FUN_M6F_r4_34000__0af2();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__055f @ M6F_r4_34000::055f =====

void __h3000 FUN_M6F_r4_34000__055f(void)

{
  FUN_M6F_r4_34000__18cc();
  FUN_M6F_r4_34000__0af2();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__056a @ M6F_r4_34000::056a =====

void __h3000 FUN_M6F_r4_34000__056a(void)

{
  FUN_M6F_r4_34000__1955();
  FUN_M6F_r4_34000__0b31();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__0575 @ M6F_r4_34000::0575 =====

void __h3000 FUN_M6F_r4_34000__0575(void)

{
  FUN_M6F_r4_34000__19de();
  FUN_M6F_r4_34000__0b31();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__0580 @ M6F_r4_34000::0580 =====

void __h3000 FUN_M6F_r4_34000__0580(void)

{
  FUN_M6F_r4_34000__1a67();
  FUN_M6F_r4_34000__0b70();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__058b @ M6F_r4_34000::058b =====

void __h3000 FUN_M6F_r4_34000__058b(void)

{
  FUN_M6F_r4_34000__1af0();
  FUN_M6F_r4_34000__0ba8();
  API_FE10();
  return;
}


// ===== FUN_M6F_r4_34000__0596 @ M6F_r4_34000::0596 =====

void __h3000 FUN_M6F_r4_34000__0596(void)

{
  FUN_M6F_r4_34000__1b79();
  FUN_M6F_r4_34000__0ba8();
  API_FE12();
  return;
}


// ===== FUN_M6F_r4_34000__05a1 @ M6F_r4_34000::05a1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__05a1(void)

{
  code *pcVar1;
  undefined2 in_D;
  
  pcVar1 = FUN_M6F_r4_34000__05f5 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M6F_r4_34000__05c6 + g_moduleBase,&LAB_6600,
           pcVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M6F_r4_34000__05c6 @ M6F_r4_34000::05c6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x05e6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M6F_r4_34000__05c6(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_7106 == 0) {
                    /* inline[API_FC62]: $6013 */
    ModuleStorePtr(5);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x05e6. Too many branches */
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


// ===== FUN_M6F_r4_34000__05f5 @ M6F_r4_34000::05f5 =====

undefined2 __h3000 FUN_M6F_r4_34000__05f5(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_712e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7122 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7124 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7126 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7128 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_712a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70e4 >> 8));
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0xc);
  DAT_7106 = 0xffff;
  API_FD76();
  return in_D;
}


// ===== FUN_M6F_r4_34000__06e7 @ M6F_r4_34000::06e7 =====

void __h3000 FUN_M6F_r4_34000__06e7(void)

{
  API_FE18();
  API_FD7C();
  return;
}


// ===== FUN_M6F_r4_34000__06f0 @ M6F_r4_34000::06f0 =====

void __h3000 FUN_M6F_r4_34000__06f0(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M6F_r4_34000__072b @ M6F_r4_34000::072b =====

void __h3000 FUN_M6F_r4_34000__072b(void)

{
                    /* inline[API_FE02]: "cutoff 1" "cutoff 2" "q fact 1" "q fact 2" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D23 ->$0DFC ->$0E78 ->$0FC0 ->$0764 ->$07CF */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6F_r4_34000__0764 @ M6F_r4_34000::0764 =====

void __h3000 FUN_M6F_r4_34000__0764(void)

{
                    /* inline[API_FE02]: " delay 1" " delay 2" "scale 1 " "scale 2 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1165 ->$122F ->$12FC ->$13D5 ->$079D ->$072B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6F_r4_34000__079d @ M6F_r4_34000::079d =====

void __h3000 FUN_M6F_r4_34000__079d(void)

{
                    /* inline[API_FE02]: " coarse " "  fine  " "p delay " [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1BD0 ->$1C37 ->$1D19 ->$0C9F ->$07CF ->$0764 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6F_r4_34000__07cf @ M6F_r4_34000::07cf =====

void __h3000 FUN_M6F_r4_34000__07cf(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1DBE ->$1E6C ->$0C29 ->$080E ->$072B ->$079D */
  SetModuleHandlers();
  DAT_7140 = FUN_M6F_r4_34000__07cf;
  return;
}


// ===== FUN_M6F_r4_34000__080e @ M6F_r4_34000::080e =====

void __h3000 FUN_M6F_r4_34000__080e(void)

{
                    /* inline[API_FE02]: "patching" "deglitch" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A17 ->$0BE7 ->$0C9F ->$07CF ->$080E ->$080E */
  SetModuleHandlers();
  DAT_7140 = FUN_M6F_r4_34000__080e;
  return;
}


// ===== FUN_M6F_r4_34000__0846 @ M6F_r4_34000::0846 =====

undefined2 __h3000 FUN_M6F_r4_34000__0846(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__06f0();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       Output level is now    dB lower    " */
  LcdPrintInline();
  DAT_70ea = 0;
  FUN_M6F_r4_34000__08a0();
  return in_D;
}


// ===== FUN_M6F_r4_34000__0886 @ M6F_r4_34000::0886 =====

undefined2 __h3000 FUN_M6F_r4_34000__0886(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  
  LcdSetCursor();
  uVar1 = DAT_70e8;
  *(char *)(in_U + -1) = (char)DAT_70e8;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCC8();
  API_FC44(*puVar2);
  return in_D;
}


// ===== FUN_M6F_r4_34000__08a0 @ M6F_r4_34000::08a0 =====

undefined2 __h3000 FUN_M6F_r4_34000__08a0(void)

{
  undefined2 in_D;
  
  while (-0xf < DAT_70e8) {
    DAT_70e8 = DAT_70e8 + -1;
    DAT_70ae = DAT_70ae + -1;
    API_FC80((char)((ushort)DAT_70ae >> 8));
    API_FE56();
    DAT_70b6 = DAT_70b6 + -1;
    API_FC80((char)((ushort)DAT_70b6 >> 8));
    API_FE58();
    FUN_M6F_r4_34000__0886();
    API_FD20(3);
  }
  FUN_M6F_r4_34000__0886();
                    /* inline[API_FE02]: [-] [-] "--loud--" [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(9);
  return in_D;
}


// ===== FUN_M6F_r4_34000__0917 @ M6F_r4_34000::0917 =====

undefined2 __h3000 FUN_M6F_r4_34000__0917(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__06f0();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       Output level is now    dB lower    " */
  LcdPrintInline();
  DAT_70ea = 0xffff;
  FUN_M6F_r4_34000__0971();
  return in_D;
}


// ===== FUN_M6F_r4_34000__0957 @ M6F_r4_34000::0957 =====

undefined2 __h3000 FUN_M6F_r4_34000__0957(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  
  LcdSetCursor();
  uVar1 = DAT_70e8;
  *(char *)(in_U + -1) = (char)DAT_70e8;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCC8();
  API_FC44(*puVar2);
  return in_D;
}


// ===== FUN_M6F_r4_34000__0971 @ M6F_r4_34000::0971 =====

undefined2 __h3000 FUN_M6F_r4_34000__0971(void)

{
  undefined2 in_D;
  
  while (DAT_70e8 < 0) {
    DAT_70e8 = DAT_70e8 + 1;
    DAT_70ae = DAT_70ae + 1;
    API_FC80((char)((ushort)DAT_70ae >> 8));
    API_FE56();
    DAT_70b6 = DAT_70b6 + 1;
    API_FC80((char)((ushort)DAT_70b6 >> 8));
    API_FE58();
    FUN_M6F_r4_34000__0957();
    API_FD20(3);
  }
  FUN_M6F_r4_34000__06f0();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       Output level is now normal         " */
  LcdPrintInline();
                    /* inline[API_FE02]: [-] [-] "--soft--" [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(8);
  return in_D;
}


// ===== FUN_M6F_r4_34000__0a17 @ M6F_r4_34000::0a17 =====

void __h3000 FUN_M6F_r4_34000__0a17(void)

{
  FUN_M6F_r4_34000__0846();
  FUN_M6F_r4_34000__0a25();
  return;
}


// ===== FUN_M6F_r4_34000__0a1e @ M6F_r4_34000::0a1e =====

void __h3000 FUN_M6F_r4_34000__0a1e(void)

{
  FUN_M6F_r4_34000__0917();
  FUN_M6F_r4_34000__080e();
  return;
}


// ===== FUN_M6F_r4_34000__0a25 @ M6F_r4_34000::0a25 =====

void __h3000 FUN_M6F_r4_34000__0a25(void)

{
                    /* inline[API_FE02]: "filt1 in" "filt2 in" [-] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x14);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0x15);
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr(10);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(10);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(0xb);
  return;
}


// ===== FUN_M6F_r4_34000__0a74 @ M6F_r4_34000::0a74 =====

void __h3000 FUN_M6F_r4_34000__0a74(void)

{
                    /* inline[API_FE02]: "delay1in" "delay2in" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x16);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0x16);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(10);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(10);
  return;
}


// ===== FUN_M6F_r4_34000__0ab3 @ M6F_r4_34000::0ab3 =====

void __h3000 FUN_M6F_r4_34000__0ab3(void)

{
                    /* inline[API_FE02]: "scale1in" "scale2in" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x17);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0x17);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(10);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(10);
  return;
}


// ===== FUN_M6F_r4_34000__0af2 @ M6F_r4_34000::0af2 =====

void __h3000 FUN_M6F_r4_34000__0af2(void)

{
                    /* inline[API_FE02]: "sum1a in" "sum1b in" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x18);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0x18);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(10);
  return;
}


// ===== FUN_M6F_r4_34000__0b31 @ M6F_r4_34000::0b31 =====

void __h3000 FUN_M6F_r4_34000__0b31(void)

{
                    /* inline[API_FE02]: "sum2a in" "sum2b in" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x19);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0x19);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(10);
  return;
}


// ===== FUN_M6F_r4_34000__0b70 @ M6F_r4_34000::0b70 =====

void __h3000 FUN_M6F_r4_34000__0b70(void)

{
                    /* inline[API_FE02]: "shift in" [*] [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x1a);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0xc);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(0xb);
  return;
}


// ===== FUN_M6F_r4_34000__0ba8 @ M6F_r4_34000::0ba8 =====

void __h3000 FUN_M6F_r4_34000__0ba8(void)

{
                    /* inline[API_FE02]: "l output" "r output" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x1a);
                    /* inline[API_FC62]: $60E5 */
  ModuleStorePtr(0x1b);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(10);
                    /* inline[API_FC62]: $6036 */
  ModuleStorePtr(0xb);
  return;
}


// ===== FUN_M6F_r4_34000__0be7 @ M6F_r4_34000::0be7 =====

void __h3000 FUN_M6F_r4_34000__0be7(void)

{
                    /* inline[API_FE02]: "low note" "highnote" " source " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2208 ->$2104 ->$22DB ->$0C9F ->$0BE7 ->$0BE7 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7140 >> 8));
  return;
}


// ===== FUN_M6F_r4_34000__0c29 @ M6F_r4_34000::0c29 =====

void __h3000 FUN_M6F_r4_34000__0c29(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1F1A ->$1F95 ->$0C9F ->$0C9F ->$0C64 ->$0C64 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7140 >> 8));
  return;
}


// ===== FUN_M6F_r4_34000__0c64 @ M6F_r4_34000::0c64 =====

void __h3000 FUN_M6F_r4_34000__0c64(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2010 ->$208B ->$0C9F ->$0C9F ->$0C29 ->$0C29 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7140 >> 8));
  return;
}


// ===== FUN_M6F_r4_34000__0c9f @ M6F_r4_34000::0c9f =====

void __h3000 FUN_M6F_r4_34000__0c9f(void)

{
  return;
}


// ===== FUN_M6F_r4_34000__0cc6 @ M6F_r4_34000::0cc6 =====

void __h3000 FUN_M6F_r4_34000__0cc6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0D36 ->$0CEA */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0);
  return;
}


// ===== FUN_M6F_r4_34000__0cd2 @ M6F_r4_34000::0cd2 =====

void __h3000 FUN_M6F_r4_34000__0cd2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0D36 ->$0CEA */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0);
  return;
}


// ===== FUN_M6F_r4_34000__0cde @ M6F_r4_34000::0cde =====

void __h3000 FUN_M6F_r4_34000__0cde(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0D36 ->$0CEA */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0);
  return;
}


// ===== FUN_M6F_r4_34000__0cea @ M6F_r4_34000::0cea =====

void __h3000 FUN_M6F_r4_34000__0cea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0D36 ->$0CEA */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0);
  return;
}


// ===== FUN_M6F_r4_34000__0cf6 @ M6F_r4_34000::0cf6 =====

void __h3000 FUN_M6F_r4_34000__0cf6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0D36 ->$0CEA */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0);
  return;
}


// ===== FUN_M6F_r4_34000__0d02 @ M6F_r4_34000::0d02 =====

void __h3000 FUN_M6F_r4_34000__0d02(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0D36 ->$0CEA $0CDE */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0);
  return;
}


// ===== FUN_M6F_r4_34000__0d23 @ M6F_r4_34000::0d23 =====

undefined2 __h3000 FUN_M6F_r4_34000__0d23(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__0cc6();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M6F_r4_34000__0d36 @ M6F_r4_34000::0d36 =====

undefined2 __h3000 FUN_M6F_r4_34000__0d36(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_7004;
  *(char *)(in_U + -1) = (char)DAT_7004;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 4;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  uVar1 = DAT_7004;
  puVar2[-1] = (char)DAT_7004;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x91;
  puVar3 = (undefined2 *)(puVar2 + -4);
  *(undefined1 *)puVar3 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_70f2 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__0d9f @ M6F_r4_34000::0d9f =====

void __h3000 FUN_M6F_r4_34000__0d9f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0E0F ->$0DC3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79);
  return;
}


// ===== FUN_M6F_r4_34000__0dab @ M6F_r4_34000::0dab =====

void __h3000 FUN_M6F_r4_34000__0dab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0E0F ->$0DC3 */
                    /* inline[API_FDBC]: "5.94...y" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79);
  return;
}


// ===== FUN_M6F_r4_34000__0db7 @ M6F_r4_34000::0db7 =====

void __h3000 FUN_M6F_r4_34000__0db7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0E0F ->$0DC3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79);
  return;
}


// ===== FUN_M6F_r4_34000__0dc3 @ M6F_r4_34000::0dc3 =====

void __h3000 FUN_M6F_r4_34000__0dc3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0E0F ->$0DC3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79);
  return;
}


// ===== FUN_M6F_r4_34000__0dcf @ M6F_r4_34000::0dcf =====

void __h3000 FUN_M6F_r4_34000__0dcf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0E0F ->$0DC3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79);
  return;
}


// ===== FUN_M6F_r4_34000__0ddb @ M6F_r4_34000::0ddb =====

void __h3000 FUN_M6F_r4_34000__0ddb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0E0F ->$0DC3 $0DB7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79);
  return;
}


// ===== FUN_M6F_r4_34000__0dfc @ M6F_r4_34000::0dfc =====

undefined2 __h3000 FUN_M6F_r4_34000__0dfc(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__0d9f();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M6F_r4_34000__0e0f @ M6F_r4_34000::0e0f =====

undefined2 __h3000 FUN_M6F_r4_34000__0e0f(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_700c;
  *(char *)(in_U + -1) = (char)DAT_700c;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 4;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  uVar1 = DAT_700c;
  puVar2[-1] = (char)DAT_700c;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x91;
  puVar3 = (undefined2 *)(puVar2 + -4);
  *(undefined1 *)puVar3 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_70f2 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__0e78 @ M6F_r4_34000::0e78 =====

void __h3000 FUN_M6F_r4_34000__0e78(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F0A ->$0EC9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52);
  return;
}


// ===== FUN_M6F_r4_34000__0e84 @ M6F_r4_34000::0e84 =====

void __h3000 FUN_M6F_r4_34000__0e84(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F0A ->$0EC9 */
                    /* inline[API_FDBC]: "5.94...R" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52);
  return;
}


// ===== FUN_M6F_r4_34000__0e90 @ M6F_r4_34000::0e90 =====

void __h3000 FUN_M6F_r4_34000__0e90(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F0A ->$0EC9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52);
  return;
}


// ===== FUN_M6F_r4_34000__0e9c @ M6F_r4_34000::0e9c =====

void __h3000 FUN_M6F_r4_34000__0e9c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F0A ->$0EC9 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52);
  return;
}


// ===== FUN_M6F_r4_34000__0ea8 @ M6F_r4_34000::0ea8 =====

void __h3000 FUN_M6F_r4_34000__0ea8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F0A ->$0EC9 $0E90 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52);
  return;
}


// ===== FUN_M6F_r4_34000__0ec9 @ M6F_r4_34000::0ec9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__0ec9(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  if (DAT_7014 == 1000) {
    LcdSetCursor();
                    /* inline[API_FC38]: "oscillate" */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "         " */
    uVar1 = LcdPrintInline();
                    /* desc[API_FE6E]: ->$0F0A ->$0EC9 */
    API_FE6E((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52);
  }
  return in_D;
}


// ===== FUN_M6F_r4_34000__0f0a @ M6F_r4_34000::0f0a =====

undefined2 __h3000 FUN_M6F_r4_34000__0f0a(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = DAT_7014;
  *(char *)(in_U + -1) = (char)DAT_7014;
  *(char *)(in_U + -2) = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  sVar1 = DAT_7014;
  DAT_70f2 = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_7014;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x2c;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x62;
  API_FCF2();
  DAT_70f2 = *psVar2 + DAT_70f2 + -0x7fff;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  if (DAT_7014 == 1000) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    FUN_M6F_r4_34000__1496();
  }
  return in_D;
}


// ===== FUN_M6F_r4_34000__0fc0 @ M6F_r4_34000::0fc0 =====

void __h3000 FUN_M6F_r4_34000__0fc0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1052 ->$1011 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a);
  return;
}


// ===== FUN_M6F_r4_34000__0fcc @ M6F_r4_34000::0fcc =====

void __h3000 FUN_M6F_r4_34000__0fcc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1052 ->$1011 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a);
  return;
}


// ===== FUN_M6F_r4_34000__0fd8 @ M6F_r4_34000::0fd8 =====

void __h3000 FUN_M6F_r4_34000__0fd8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1052 ->$1011 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a);
  return;
}


// ===== FUN_M6F_r4_34000__0fe4 @ M6F_r4_34000::0fe4 =====

void __h3000 FUN_M6F_r4_34000__0fe4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1052 ->$1011 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a);
  return;
}


// ===== FUN_M6F_r4_34000__0ff0 @ M6F_r4_34000::0ff0 =====

void __h3000 FUN_M6F_r4_34000__0ff0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1052 ->$1011 $0FD8 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a);
  return;
}


// ===== FUN_M6F_r4_34000__1011 @ M6F_r4_34000::1011 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__1011(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  if (DAT_701c == 1000) {
    LcdSetCursor();
                    /* inline[API_FC38]: "oscillate" */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "         " */
    uVar1 = LcdPrintInline();
                    /* desc[API_FE6E]: ->$1052 ->$1011 */
    API_FE6E((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a);
  }
  return in_D;
}


// ===== FUN_M6F_r4_34000__1052 @ M6F_r4_34000::1052 =====

undefined2 __h3000 FUN_M6F_r4_34000__1052(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = DAT_701c;
  *(char *)(in_U + -1) = (char)DAT_701c;
  *(char *)(in_U + -2) = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  sVar1 = DAT_701c;
  DAT_70f2 = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_701c;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x2c;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x62;
  API_FCF2();
  DAT_70f2 = *psVar2 + DAT_70f2 + -0x7fff;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  if (DAT_701c == 1000) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    FUN_M6F_r4_34000__15cf();
  }
  return in_D;
}


// ===== FUN_M6F_r4_34000__1108 @ M6F_r4_34000::1108 =====

void __h3000 FUN_M6F_r4_34000__1108(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1178 ->$112C */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2);
  return;
}


// ===== FUN_M6F_r4_34000__1114 @ M6F_r4_34000::1114 =====

void __h3000 FUN_M6F_r4_34000__1114(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1178 ->$112C */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2);
  return;
}


// ===== FUN_M6F_r4_34000__1120 @ M6F_r4_34000::1120 =====

void __h3000 FUN_M6F_r4_34000__1120(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1178 ->$112C */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2);
  return;
}


// ===== FUN_M6F_r4_34000__112c @ M6F_r4_34000::112c =====

void __h3000 FUN_M6F_r4_34000__112c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1178 ->$112C */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2);
  return;
}


// ===== FUN_M6F_r4_34000__1138 @ M6F_r4_34000::1138 =====

void __h3000 FUN_M6F_r4_34000__1138(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1178 ->$112C */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2);
  return;
}


// ===== FUN_M6F_r4_34000__1144 @ M6F_r4_34000::1144 =====

void __h3000 FUN_M6F_r4_34000__1144(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1178 ->$112C $1120 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2);
  return;
}


// ===== FUN_M6F_r4_34000__1165 @ M6F_r4_34000::1165 =====

undefined2 __h3000 FUN_M6F_r4_34000__1165(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__1108();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M6F_r4_34000__1178 @ M6F_r4_34000::1178 =====

undefined2 __h3000 FUN_M6F_r4_34000__1178(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_7024;
  *(char *)(in_U + -1) = (char)DAT_7024;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x72;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x38;
  API_FCF2();
  DAT_70f2 = *psVar2 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__11d2 @ M6F_r4_34000::11d2 =====

void __h3000 FUN_M6F_r4_34000__11d2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1242 ->$11F6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac);
  return;
}


// ===== FUN_M6F_r4_34000__11de @ M6F_r4_34000::11de =====

void __h3000 FUN_M6F_r4_34000__11de(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1242 ->$11F6 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac);
  return;
}


// ===== FUN_M6F_r4_34000__11ea @ M6F_r4_34000::11ea =====

void __h3000 FUN_M6F_r4_34000__11ea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1242 ->$11F6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac);
  return;
}


// ===== FUN_M6F_r4_34000__11f6 @ M6F_r4_34000::11f6 =====

void __h3000 FUN_M6F_r4_34000__11f6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1242 ->$11F6 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac);
  return;
}


// ===== FUN_M6F_r4_34000__1202 @ M6F_r4_34000::1202 =====

void __h3000 FUN_M6F_r4_34000__1202(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1242 ->$11F6 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac);
  return;
}


// ===== FUN_M6F_r4_34000__120e @ M6F_r4_34000::120e =====

void __h3000 FUN_M6F_r4_34000__120e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1242 ->$11F6 $11EA */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac);
  return;
}


// ===== FUN_M6F_r4_34000__122f @ M6F_r4_34000::122f =====

undefined2 __h3000 FUN_M6F_r4_34000__122f(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__11d2();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M6F_r4_34000__1242 @ M6F_r4_34000::1242 =====

undefined2 __h3000 FUN_M6F_r4_34000__1242(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_702c;
  *(char *)(in_U + -1) = (char)DAT_702c;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x72;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x38;
  API_FCF2();
  DAT_70f2 = *psVar2 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__129f @ M6F_r4_34000::129f =====

void __h3000 FUN_M6F_r4_34000__129f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$130F ->$12C3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279);
  return;
}


// ===== FUN_M6F_r4_34000__12ab @ M6F_r4_34000::12ab =====

void __h3000 FUN_M6F_r4_34000__12ab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$130F ->$12C3 */
                    /* inline[API_FDBC]: "5.94...y" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279);
  return;
}


// ===== FUN_M6F_r4_34000__12b7 @ M6F_r4_34000::12b7 =====

void __h3000 FUN_M6F_r4_34000__12b7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$130F ->$12C3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279);
  return;
}


// ===== FUN_M6F_r4_34000__12c3 @ M6F_r4_34000::12c3 =====

void __h3000 FUN_M6F_r4_34000__12c3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$130F ->$12C3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279);
  return;
}


// ===== FUN_M6F_r4_34000__12cf @ M6F_r4_34000::12cf =====

void __h3000 FUN_M6F_r4_34000__12cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$130F ->$12C3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279);
  return;
}


// ===== FUN_M6F_r4_34000__12db @ M6F_r4_34000::12db =====

void __h3000 FUN_M6F_r4_34000__12db(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$130F ->$12C3 $12B7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279);
  return;
}


// ===== FUN_M6F_r4_34000__12fc @ M6F_r4_34000::12fc =====

undefined2 __h3000 FUN_M6F_r4_34000__12fc(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__129f();
  DAT_6066 = 5;
  DAT_60dc = 10;
  return in_D;
}


// ===== FUN_M6F_r4_34000__130f @ M6F_r4_34000::130f =====

undefined2 __h3000 FUN_M6F_r4_34000__130f(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_7034;
  *(char *)(in_U + -1) = (char)DAT_7034;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  uVar1 = DAT_7034;
  puVar2[-1] = (char)DAT_7034;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x2c;
  puVar3 = (undefined2 *)(puVar2 + -4);
  *(undefined1 *)puVar3 = 0x62;
  API_FCF2();
  API_FCE2();
  DAT_70f2 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1378 @ M6F_r4_34000::1378 =====

void __h3000 FUN_M6F_r4_34000__1378(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$13E8 ->$139C */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352);
  return;
}


// ===== FUN_M6F_r4_34000__1384 @ M6F_r4_34000::1384 =====

void __h3000 FUN_M6F_r4_34000__1384(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$13E8 ->$139C */
                    /* inline[API_FDBC]: "5.94...R" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352);
  return;
}


// ===== FUN_M6F_r4_34000__1390 @ M6F_r4_34000::1390 =====

void __h3000 FUN_M6F_r4_34000__1390(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$13E8 ->$139C */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352);
  return;
}


// ===== FUN_M6F_r4_34000__139c @ M6F_r4_34000::139c =====

void __h3000 FUN_M6F_r4_34000__139c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$13E8 ->$139C */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352);
  return;
}


// ===== FUN_M6F_r4_34000__13a8 @ M6F_r4_34000::13a8 =====

void __h3000 FUN_M6F_r4_34000__13a8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$13E8 ->$139C */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352);
  return;
}


// ===== FUN_M6F_r4_34000__13b4 @ M6F_r4_34000::13b4 =====

void __h3000 FUN_M6F_r4_34000__13b4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$13E8 ->$139C $1390 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352);
  return;
}


// ===== FUN_M6F_r4_34000__13d5 @ M6F_r4_34000::13d5 =====

undefined2 __h3000 FUN_M6F_r4_34000__13d5(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__1378();
  DAT_6066 = 5;
  DAT_60dc = 10;
  return in_D;
}


// ===== FUN_M6F_r4_34000__13e8 @ M6F_r4_34000::13e8 =====

undefined2 __h3000 FUN_M6F_r4_34000__13e8(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_703c;
  *(char *)(in_U + -1) = (char)DAT_703c;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  uVar1 = DAT_703c;
  puVar2[-1] = (char)DAT_703c;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x2c;
  puVar3 = (undefined2 *)(puVar2 + -4);
  *(undefined1 *)puVar3 = 0x62;
  API_FCF2();
  API_FCE2();
  DAT_70f2 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f2 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1451 @ M6F_r4_34000::1451 =====

void __h3000 FUN_M6F_r4_34000__1451(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__142b);
  return;
}


// ===== FUN_M6F_r4_34000__145d @ M6F_r4_34000::145d =====

void __h3000 FUN_M6F_r4_34000__145d(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__142b);
  return;
}


// ===== FUN_M6F_r4_34000__1469 @ M6F_r4_34000::1469 =====

void __h3000 FUN_M6F_r4_34000__1469(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__142b);
  return;
}


// ===== FUN_M6F_r4_34000__1475 @ M6F_r4_34000::1475 =====

void __h3000 FUN_M6F_r4_34000__1475(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__142b);
  return;
}


// ===== FUN_M6F_r4_34000__1496 @ M6F_r4_34000::1496 =====

undefined2 __h3000 FUN_M6F_r4_34000__1496(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7074 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__158a @ M6F_r4_34000::158a =====

void __h3000 FUN_M6F_r4_34000__158a(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&UNK_M6F_r4_34000__1564);
  return;
}


// ===== FUN_M6F_r4_34000__1596 @ M6F_r4_34000::1596 =====

void __h3000 FUN_M6F_r4_34000__1596(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,&UNK_M6F_r4_34000__1564);
  return;
}


// ===== FUN_M6F_r4_34000__15a2 @ M6F_r4_34000::15a2 =====

void __h3000 FUN_M6F_r4_34000__15a2(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,&UNK_M6F_r4_34000__1564);
  return;
}


// ===== FUN_M6F_r4_34000__15ae @ M6F_r4_34000::15ae =====

void __h3000 FUN_M6F_r4_34000__15ae(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&UNK_M6F_r4_34000__1564);
  return;
}


// ===== FUN_M6F_r4_34000__15cf @ M6F_r4_34000::15cf =====

undefined2 __h3000 FUN_M6F_r4_34000__15cf(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1613 @ M6F_r4_34000::1613 =====

void __h3000 FUN_M6F_r4_34000__1613(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__15ed);
  return;
}


// ===== FUN_M6F_r4_34000__161f @ M6F_r4_34000::161f =====

void __h3000 FUN_M6F_r4_34000__161f(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__15ed);
  return;
}


// ===== FUN_M6F_r4_34000__162b @ M6F_r4_34000::162b =====

void __h3000 FUN_M6F_r4_34000__162b(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__15ed);
  return;
}


// ===== FUN_M6F_r4_34000__1637 @ M6F_r4_34000::1637 =====

void __h3000 FUN_M6F_r4_34000__1637(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__15ed);
  return;
}


// ===== FUN_M6F_r4_34000__1658 @ M6F_r4_34000::1658 =====

undefined2 __h3000 FUN_M6F_r4_34000__1658(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7078 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__169c @ M6F_r4_34000::169c =====

void __h3000 FUN_M6F_r4_34000__169c(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1676);
  return;
}


// ===== FUN_M6F_r4_34000__16a8 @ M6F_r4_34000::16a8 =====

void __h3000 FUN_M6F_r4_34000__16a8(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1676);
  return;
}


// ===== FUN_M6F_r4_34000__16b4 @ M6F_r4_34000::16b4 =====

void __h3000 FUN_M6F_r4_34000__16b4(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1676);
  return;
}


// ===== FUN_M6F_r4_34000__16c0 @ M6F_r4_34000::16c0 =====

void __h3000 FUN_M6F_r4_34000__16c0(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1676);
  return;
}


// ===== FUN_M6F_r4_34000__16e1 @ M6F_r4_34000::16e1 =====

undefined2 __h3000 FUN_M6F_r4_34000__16e1(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707a >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1725 @ M6F_r4_34000::1725 =====

void __h3000 FUN_M6F_r4_34000__1725(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__16ff);
  return;
}


// ===== FUN_M6F_r4_34000__1731 @ M6F_r4_34000::1731 =====

void __h3000 FUN_M6F_r4_34000__1731(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__16ff);
  return;
}


// ===== FUN_M6F_r4_34000__173d @ M6F_r4_34000::173d =====

void __h3000 FUN_M6F_r4_34000__173d(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__16ff);
  return;
}


// ===== FUN_M6F_r4_34000__1749 @ M6F_r4_34000::1749 =====

void __h3000 FUN_M6F_r4_34000__1749(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__16ff);
  return;
}


// ===== FUN_M6F_r4_34000__176a @ M6F_r4_34000::176a =====

undefined2 __h3000 FUN_M6F_r4_34000__176a(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__17ae @ M6F_r4_34000::17ae =====

void __h3000 FUN_M6F_r4_34000__17ae(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1788);
  return;
}


// ===== FUN_M6F_r4_34000__17ba @ M6F_r4_34000::17ba =====

void __h3000 FUN_M6F_r4_34000__17ba(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1788);
  return;
}


// ===== FUN_M6F_r4_34000__17c6 @ M6F_r4_34000::17c6 =====

void __h3000 FUN_M6F_r4_34000__17c6(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1788);
  return;
}


// ===== FUN_M6F_r4_34000__17d2 @ M6F_r4_34000::17d2 =====

void __h3000 FUN_M6F_r4_34000__17d2(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1788);
  return;
}


// ===== FUN_M6F_r4_34000__17f3 @ M6F_r4_34000::17f3 =====

undefined2 __h3000 FUN_M6F_r4_34000__17f3(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707e >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1837 @ M6F_r4_34000::1837 =====

void __h3000 FUN_M6F_r4_34000__1837(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1811);
  return;
}


// ===== FUN_M6F_r4_34000__1843 @ M6F_r4_34000::1843 =====

void __h3000 FUN_M6F_r4_34000__1843(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1811);
  return;
}


// ===== FUN_M6F_r4_34000__184f @ M6F_r4_34000::184f =====

void __h3000 FUN_M6F_r4_34000__184f(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1811);
  return;
}


// ===== FUN_M6F_r4_34000__185b @ M6F_r4_34000::185b =====

void __h3000 FUN_M6F_r4_34000__185b(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1811);
  return;
}


// ===== FUN_M6F_r4_34000__187c @ M6F_r4_34000::187c =====

undefined2 __h3000 FUN_M6F_r4_34000__187c(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7080 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__18c0 @ M6F_r4_34000::18c0 =====

void __h3000 FUN_M6F_r4_34000__18c0(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__189a);
  return;
}


// ===== FUN_M6F_r4_34000__18cc @ M6F_r4_34000::18cc =====

void __h3000 FUN_M6F_r4_34000__18cc(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__189a);
  return;
}


// ===== FUN_M6F_r4_34000__18d8 @ M6F_r4_34000::18d8 =====

void __h3000 FUN_M6F_r4_34000__18d8(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__189a);
  return;
}


// ===== FUN_M6F_r4_34000__18e4 @ M6F_r4_34000::18e4 =====

void __h3000 FUN_M6F_r4_34000__18e4(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__189a);
  return;
}


// ===== FUN_M6F_r4_34000__1905 @ M6F_r4_34000::1905 =====

undefined2 __h3000 FUN_M6F_r4_34000__1905(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7082 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1949 @ M6F_r4_34000::1949 =====

void __h3000 FUN_M6F_r4_34000__1949(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1923);
  return;
}


// ===== FUN_M6F_r4_34000__1955 @ M6F_r4_34000::1955 =====

void __h3000 FUN_M6F_r4_34000__1955(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1923);
  return;
}


// ===== FUN_M6F_r4_34000__1961 @ M6F_r4_34000::1961 =====

void __h3000 FUN_M6F_r4_34000__1961(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1923);
  return;
}


// ===== FUN_M6F_r4_34000__196d @ M6F_r4_34000::196d =====

void __h3000 FUN_M6F_r4_34000__196d(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1923);
  return;
}


// ===== FUN_M6F_r4_34000__198e @ M6F_r4_34000::198e =====

undefined2 __h3000 FUN_M6F_r4_34000__198e(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7084 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__19d2 @ M6F_r4_34000::19d2 =====

void __h3000 FUN_M6F_r4_34000__19d2(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__19ac);
  return;
}


// ===== FUN_M6F_r4_34000__19de @ M6F_r4_34000::19de =====

void __h3000 FUN_M6F_r4_34000__19de(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__19ac);
  return;
}


// ===== FUN_M6F_r4_34000__19ea @ M6F_r4_34000::19ea =====

void __h3000 FUN_M6F_r4_34000__19ea(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__19ac);
  return;
}


// ===== FUN_M6F_r4_34000__19f6 @ M6F_r4_34000::19f6 =====

void __h3000 FUN_M6F_r4_34000__19f6(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__19ac);
  return;
}


// ===== FUN_M6F_r4_34000__1a17 @ M6F_r4_34000::1a17 =====

undefined2 __h3000 FUN_M6F_r4_34000__1a17(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7086 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1a5b @ M6F_r4_34000::1a5b =====

void __h3000 FUN_M6F_r4_34000__1a5b(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1a35);
  return;
}


// ===== FUN_M6F_r4_34000__1a67 @ M6F_r4_34000::1a67 =====

void __h3000 FUN_M6F_r4_34000__1a67(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1a35);
  return;
}


// ===== FUN_M6F_r4_34000__1a73 @ M6F_r4_34000::1a73 =====

void __h3000 FUN_M6F_r4_34000__1a73(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1a35);
  return;
}


// ===== FUN_M6F_r4_34000__1a7f @ M6F_r4_34000::1a7f =====

void __h3000 FUN_M6F_r4_34000__1a7f(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1a35);
  return;
}


// ===== FUN_M6F_r4_34000__1aa0 @ M6F_r4_34000::1aa0 =====

undefined2 __h3000 FUN_M6F_r4_34000__1aa0(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_708c >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1ae4 @ M6F_r4_34000::1ae4 =====

void __h3000 FUN_M6F_r4_34000__1ae4(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1abe);
  return;
}


// ===== FUN_M6F_r4_34000__1af0 @ M6F_r4_34000::1af0 =====

void __h3000 FUN_M6F_r4_34000__1af0(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1abe);
  return;
}


// ===== FUN_M6F_r4_34000__1afc @ M6F_r4_34000::1afc =====

void __h3000 FUN_M6F_r4_34000__1afc(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1abe);
  return;
}


// ===== FUN_M6F_r4_34000__1b08 @ M6F_r4_34000::1b08 =====

void __h3000 FUN_M6F_r4_34000__1b08(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1abe);
  return;
}


// ===== FUN_M6F_r4_34000__1b29 @ M6F_r4_34000::1b29 =====

undefined2 __h3000 FUN_M6F_r4_34000__1b29(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7088 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1b6d @ M6F_r4_34000::1b6d =====

void __h3000 FUN_M6F_r4_34000__1b6d(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1b47);
  return;
}


// ===== FUN_M6F_r4_34000__1b79 @ M6F_r4_34000::1b79 =====

void __h3000 FUN_M6F_r4_34000__1b79(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1b47);
  return;
}


// ===== FUN_M6F_r4_34000__1b85 @ M6F_r4_34000::1b85 =====

void __h3000 FUN_M6F_r4_34000__1b85(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1b47);
  return;
}


// ===== FUN_M6F_r4_34000__1b91 @ M6F_r4_34000::1b91 =====

void __h3000 FUN_M6F_r4_34000__1b91(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6F_r4_34000__1b47);
  return;
}


// ===== FUN_M6F_r4_34000__1bb2 @ M6F_r4_34000::1bb2 =====

undefined2 __h3000 FUN_M6F_r4_34000__1bb2(void)

{
  undefined2 in_D;
  
  API_FE76();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_708a >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1bd0 @ M6F_r4_34000::1bd0 =====

undefined2 __h3000 FUN_M6F_r4_34000__1bd0(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__1c37();
  DAT_60dc = 100;
  DAT_60de = 100;
  return in_D;
}


// ===== FUN_M6F_r4_34000__1c2b @ M6F_r4_34000::1c2b =====

void __h3000 FUN_M6F_r4_34000__1c2b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1C92 ->$1C67 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1c92_M6F_r4_34000__1be1);
  return;
}


// ===== FUN_M6F_r4_34000__1c37 @ M6F_r4_34000::1c37 =====

void __h3000 FUN_M6F_r4_34000__1c37(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1C92 ->$1C67 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1c92_M6F_r4_34000__1be1);
  return;
}


// ===== FUN_M6F_r4_34000__1c43 @ M6F_r4_34000::1c43 =====

void __h3000 FUN_M6F_r4_34000__1c43(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1C92 ->$1C67 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1c92_M6F_r4_34000__1be1);
  return;
}


// ===== FUN_M6F_r4_34000__1c4f @ M6F_r4_34000::1c4f =====

void __h3000 FUN_M6F_r4_34000__1c4f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1C92 ->$1C67 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1c92_M6F_r4_34000__1be1);
  return;
}


// ===== FUN_M6F_r4_34000__1c5b @ M6F_r4_34000::1c5b =====

void __h3000 FUN_M6F_r4_34000__1c5b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1C92 ->$1C67 $1C43 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1c92_M6F_r4_34000__1be1);
  return;
}


// ===== FUN_M6F_r4_34000__1c67 @ M6F_r4_34000::1c67 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__1c67(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$1C92 ->$1C67 */
  API_FE6E();
  uVar1 = DAT_70ec;
  *(char *)(in_U + -1) = (char)DAT_70ec;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_7146);
  return in_D;
}


// ===== FUN_M6F_r4_34000__1c92 @ M6F_r4_34000::1c92 =====

undefined2 __h3000 FUN_M6F_r4_34000__1c92(void)

{
  undefined2 uVar1;
  short sVar2;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar3;
  short *psVar4;
  
  API_FE76();
  uVar1 = DAT_7092;
  *(char *)(in_U + -1) = (char)DAT_7092;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar3 = (undefined1 *)(in_U + -4);
  *puVar3 = 0;
  API_FCE6();
  psVar4 = (short *)(puVar3 + -2);
  FUN_M6F_r4_34000__2538();
  DAT_70ec = *psVar4;
  DAT_70f2 = 1000 - DAT_70ec;
  *psVar4 = DAT_70f2;
  *(undefined1 *)((short)psVar4 + -1) = 0x20;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0;
  API_FCEC();
  sVar2 = DAT_70f2;
  *(char *)((short)psVar4 + -1) = (char)DAT_70f2;
  *(char *)(psVar4 + -1) = (char)((ushort)sVar2 >> 8);
  *(undefined1 *)((short)psVar4 + -3) = 0x2c;
  psVar4 = psVar4 + -2;
  *(undefined1 *)psVar4 = 0x62;
  API_FCF2();
  API_FCE2();
  DAT_70e6 = *psVar4;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70e6 >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1d19 @ M6F_r4_34000::1d19 =====

void __h3000 FUN_M6F_r4_34000__1d19(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1D76 ->$1D3D */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3);
  return;
}


// ===== FUN_M6F_r4_34000__1d25 @ M6F_r4_34000::1d25 =====

void __h3000 FUN_M6F_r4_34000__1d25(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1D76 ->$1D3D */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3);
  return;
}


// ===== FUN_M6F_r4_34000__1d31 @ M6F_r4_34000::1d31 =====

void __h3000 FUN_M6F_r4_34000__1d31(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1D76 ->$1D3D */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3);
  return;
}


// ===== FUN_M6F_r4_34000__1d3d @ M6F_r4_34000::1d3d =====

void __h3000 FUN_M6F_r4_34000__1d3d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1D76 ->$1D3D */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3);
  return;
}


// ===== FUN_M6F_r4_34000__1d49 @ M6F_r4_34000::1d49 =====

void __h3000 FUN_M6F_r4_34000__1d49(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1D76 ->$1D3D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3);
  return;
}


// ===== FUN_M6F_r4_34000__1d55 @ M6F_r4_34000::1d55 =====

void __h3000 FUN_M6F_r4_34000__1d55(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1D76 ->$1D3D $1D31 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3);
  return;
}


// ===== FUN_M6F_r4_34000__1d76 @ M6F_r4_34000::1d76 =====

undefined2 __h3000 FUN_M6F_r4_34000__1d76(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  *(undefined1 *)(in_U + -1) = 0x2c;
  *(undefined1 *)(in_U + -2) = 0;
  uVar1 = DAT_709a;
  *(char *)(in_U + -3) = (char)DAT_709a;
  puVar2 = (undefined2 *)(in_U + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_712c = *puVar2;
  FUN_M6F_r4_34000__23b9();
  return in_D;
}


// ===== FUN_M6F_r4_34000__1dbe @ M6F_r4_34000::1dbe =====

void __h3000 FUN_M6F_r4_34000__1dbe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1E1B ->$1DE2 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98);
  return;
}


// ===== FUN_M6F_r4_34000__1dca @ M6F_r4_34000::1dca =====

void __h3000 FUN_M6F_r4_34000__1dca(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1E1B ->$1DE2 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98);
  return;
}


// ===== FUN_M6F_r4_34000__1dd6 @ M6F_r4_34000::1dd6 =====

void __h3000 FUN_M6F_r4_34000__1dd6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1E1B ->$1DE2 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98);
  return;
}


// ===== FUN_M6F_r4_34000__1de2 @ M6F_r4_34000::1de2 =====

void __h3000 FUN_M6F_r4_34000__1de2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1E1B ->$1DE2 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98);
  return;
}


// ===== FUN_M6F_r4_34000__1dee @ M6F_r4_34000::1dee =====

void __h3000 FUN_M6F_r4_34000__1dee(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1E1B ->$1DE2 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98);
  return;
}


// ===== FUN_M6F_r4_34000__1dfa @ M6F_r4_34000::1dfa =====

void __h3000 FUN_M6F_r4_34000__1dfa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1E1B ->$1DE2 $1DD6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98);
  return;
}


// ===== FUN_M6F_r4_34000__1e1b @ M6F_r4_34000::1e1b =====

undefined2 __h3000 FUN_M6F_r4_34000__1e1b(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_70c2;
  *(short *)(in_U + -2) = sVar1;
  DAT_70f2 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70f2) >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1e6c @ M6F_r4_34000::1e6c =====

void __h3000 FUN_M6F_r4_34000__1e6c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1EC9 ->$1E90 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46);
  return;
}


// ===== FUN_M6F_r4_34000__1e78 @ M6F_r4_34000::1e78 =====

void __h3000 FUN_M6F_r4_34000__1e78(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1EC9 ->$1E90 */
                    /* inline[API_FDBC]: "5.94...F" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46);
  return;
}


// ===== FUN_M6F_r4_34000__1e84 @ M6F_r4_34000::1e84 =====

void __h3000 FUN_M6F_r4_34000__1e84(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1EC9 ->$1E90 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46);
  return;
}


// ===== FUN_M6F_r4_34000__1e90 @ M6F_r4_34000::1e90 =====

void __h3000 FUN_M6F_r4_34000__1e90(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1EC9 ->$1E90 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46);
  return;
}


// ===== FUN_M6F_r4_34000__1e9c @ M6F_r4_34000::1e9c =====

void __h3000 FUN_M6F_r4_34000__1e9c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1EC9 ->$1E90 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46);
  return;
}


// ===== FUN_M6F_r4_34000__1ea8 @ M6F_r4_34000::1ea8 =====

void __h3000 FUN_M6F_r4_34000__1ea8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1EC9 ->$1E90 $1E84 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46);
  return;
}


// ===== FUN_M6F_r4_34000__1ec9 @ M6F_r4_34000::1ec9 =====

undefined2 __h3000 FUN_M6F_r4_34000__1ec9(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_70ca;
  *(short *)(in_U + -2) = sVar1;
  DAT_70f2 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_70f2) >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__1f1a @ M6F_r4_34000::1f1a =====

void __h3000 FUN_M6F_r4_34000__1f1a(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6F_r4_34000__1f5f_M6F_r4_34000__1ef4);
  return;
}


// ===== FUN_M6F_r4_34000__1f26 @ M6F_r4_34000::1f26 =====

void __h3000 FUN_M6F_r4_34000__1f26(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1F5F ->$1F3E */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6F_r4_34000__1f5f_M6F_r4_34000__1ef4);
  return;
}


// ===== FUN_M6F_r4_34000__1f32 @ M6F_r4_34000::1f32 =====

void __h3000 FUN_M6F_r4_34000__1f32(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6F_r4_34000__1f5f_M6F_r4_34000__1ef4);
  return;
}


// ===== FUN_M6F_r4_34000__1f3e @ M6F_r4_34000::1f3e =====

void __h3000 FUN_M6F_r4_34000__1f3e(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6F_r4_34000__1f5f_M6F_r4_34000__1ef4);
  return;
}


// ===== FUN_M6F_r4_34000__1f5f @ M6F_r4_34000::1f5f =====

undefined2 __h3000 FUN_M6F_r4_34000__1f5f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6F_r4_34000__1f5f_M6F_r4_34000__1ef4);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M6F_r4_34000__1f95 @ M6F_r4_34000::1f95 =====

void __h3000 FUN_M6F_r4_34000__1f95(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6F_r4_34000__1fda_M6F_r4_34000__1f6f);
  return;
}


// ===== FUN_M6F_r4_34000__1fa1 @ M6F_r4_34000::1fa1 =====

void __h3000 FUN_M6F_r4_34000__1fa1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1FDA ->$1FB9 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6F_r4_34000__1fda_M6F_r4_34000__1f6f);
  return;
}


// ===== FUN_M6F_r4_34000__1fad @ M6F_r4_34000::1fad =====

void __h3000 FUN_M6F_r4_34000__1fad(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6F_r4_34000__1fda_M6F_r4_34000__1f6f);
  return;
}


// ===== FUN_M6F_r4_34000__1fb9 @ M6F_r4_34000::1fb9 =====

void __h3000 FUN_M6F_r4_34000__1fb9(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6F_r4_34000__1fda_M6F_r4_34000__1f6f);
  return;
}


// ===== FUN_M6F_r4_34000__1fda @ M6F_r4_34000::1fda =====

undefined2 __h3000 FUN_M6F_r4_34000__1fda(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6F_r4_34000__1fda_M6F_r4_34000__1f6f);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M6F_r4_34000__2010 @ M6F_r4_34000::2010 =====

void __h3000 FUN_M6F_r4_34000__2010(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6F_r4_34000__2055_M6F_r4_34000__1fea);
  return;
}


// ===== FUN_M6F_r4_34000__201c @ M6F_r4_34000::201c =====

void __h3000 FUN_M6F_r4_34000__201c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2055 ->$2034 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6F_r4_34000__2055_M6F_r4_34000__1fea);
  return;
}


// ===== FUN_M6F_r4_34000__2028 @ M6F_r4_34000::2028 =====

void __h3000 FUN_M6F_r4_34000__2028(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6F_r4_34000__2055_M6F_r4_34000__1fea);
  return;
}


// ===== FUN_M6F_r4_34000__2034 @ M6F_r4_34000::2034 =====

void __h3000 FUN_M6F_r4_34000__2034(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6F_r4_34000__2055_M6F_r4_34000__1fea);
  return;
}


// ===== FUN_M6F_r4_34000__2055 @ M6F_r4_34000::2055 =====

undefined2 __h3000 FUN_M6F_r4_34000__2055(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6F_r4_34000__2055_M6F_r4_34000__1fea);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M6F_r4_34000__208b @ M6F_r4_34000::208b =====

void __h3000 FUN_M6F_r4_34000__208b(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6F_r4_34000__20d0_M6F_r4_34000__2065);
  return;
}


// ===== FUN_M6F_r4_34000__2097 @ M6F_r4_34000::2097 =====

void __h3000 FUN_M6F_r4_34000__2097(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$20D0 ->$20AF */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6F_r4_34000__20d0_M6F_r4_34000__2065);
  return;
}


// ===== FUN_M6F_r4_34000__20a3 @ M6F_r4_34000::20a3 =====

void __h3000 FUN_M6F_r4_34000__20a3(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6F_r4_34000__20d0_M6F_r4_34000__2065);
  return;
}


// ===== FUN_M6F_r4_34000__20af @ M6F_r4_34000::20af =====

void __h3000 FUN_M6F_r4_34000__20af(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6F_r4_34000__20d0_M6F_r4_34000__2065);
  return;
}


// ===== FUN_M6F_r4_34000__20d0 @ M6F_r4_34000::20d0 =====

undefined2 __h3000 FUN_M6F_r4_34000__20d0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6F_r4_34000__20d0_M6F_r4_34000__2065);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M6F_r4_34000__20e0 @ M6F_r4_34000::20e0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__20e0(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70e0 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6F_r4_34000__21e0();
  API_FC80((char)((ushort)DAT_70e0 >> 8),(char)DAT_70e0,param_1,0x8f);
  return in_D;
}


// ===== FUN_M6F_r4_34000__2104 @ M6F_r4_34000::2104 =====

undefined2 __h3000 FUN_M6F_r4_34000__2104(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70e0;
  FUN_M6F_r4_34000__06f0();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$2180 ->$2154
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6F_r4_34000__2180();
  FUN_M6F_r4_34000__2284();
  return in_D;
}


// ===== FUN_M6F_r4_34000__2154 @ M6F_r4_34000::2154 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__2154(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70e0 = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x8f);
  API_FE40((char)((ushort)DAT_70e0 >> 8),(char)DAT_70e0,param_1,0x11);
  FUN_M6F_r4_34000__2180();
  FUN_M6F_r4_34000__2284();
  FUN_M6F_r4_34000__21e0();
  return in_D;
}


// ===== FUN_M6F_r4_34000__2180 @ M6F_r4_34000::2180 =====

void __h3000 FUN_M6F_r4_34000__2180(void)

{
  LcdSetCursor();
  if (DAT_70e0 == 0) {
                    /* inline[API_FC38]: "C4" */
    LcdPrintInline();
  }
  else if (DAT_70e0 == 1) {
                    /* inline[API_FC38]: "C5" */
    LcdPrintInline();
  }
  else if (DAT_70e0 == 2) {
                    /* inline[API_FC38]: "C6" */
    LcdPrintInline();
  }
  else if (DAT_70e0 == 3) {
                    /* inline[API_FC38]: "C7" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "C8" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_M6F_r4_34000__21e0 @ M6F_r4_34000::21e0 =====

void __h3000 FUN_M6F_r4_34000__21e0(void)

{
  FUN_M6F_r4_34000__22a8();
  return;
}


// ===== FUN_M6F_r4_34000__21e4 @ M6F_r4_34000::21e4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__21e4(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70de = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6F_r4_34000__22a8();
  API_FC80((char)((ushort)DAT_70de >> 8),(char)DAT_70de,param_1,0x8e);
  return in_D;
}


// ===== FUN_M6F_r4_34000__2208 @ M6F_r4_34000::2208 =====

undefined2 __h3000 FUN_M6F_r4_34000__2208(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70de;
  FUN_M6F_r4_34000__06f0();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$2284 ->$2258
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6F_r4_34000__2284();
  FUN_M6F_r4_34000__2180();
  return in_D;
}


// ===== FUN_M6F_r4_34000__2258 @ M6F_r4_34000::2258 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__2258(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70de = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x8e);
  API_FE40((char)((ushort)DAT_70de >> 8),(char)DAT_70de,param_1,0x10);
  FUN_M6F_r4_34000__2284();
  FUN_M6F_r4_34000__2180();
  FUN_M6F_r4_34000__22a8();
  return in_D;
}


// ===== FUN_M6F_r4_34000__2284 @ M6F_r4_34000::2284 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M6F_r4_34000__2284(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6F_r4_34000__27bf +
                          g_moduleBase + ((DAT_70e0 & 0xff) * 0xc + 2 + DAT_70de & 0xff) * 4) >> 8),
           4,&UNK_M6F_r4_34000__27bf +
             g_moduleBase + ((DAT_70e0 & 0xff) * 0xc + 2 + DAT_70de & 0xff) * 4);
  return;
}


// ===== FUN_M6F_r4_34000__22a8 @ M6F_r4_34000::22a8 =====

undefined2 __h3000 FUN_M6F_r4_34000__22a8(void)

{
  undefined2 in_D;
  
  FUN_M6F_r4_34000__23b9();
  API_FD3C((char)((ushort)DAT_713e >> 8));
  return in_D;
}


// ===== FUN_M6F_r4_34000__22b7 @ M6F_r4_34000::22b7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6F_r4_34000__22b7(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70e2 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6F_r4_34000__239b();
  API_FC80((char)((ushort)DAT_70e2 >> 8),(char)DAT_70e2,param_1,0x90);
  return in_D;
}


// ===== FUN_M6F_r4_34000__22db @ M6F_r4_34000::22db =====

void __h3000 FUN_M6F_r4_34000__22db(void)

{
  DAT_6074 = DAT_70e2;
  FUN_M6F_r4_34000__06f0();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       polyphonic-                   -solo" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$2358 ->$2333
                       $0005 $0005 $0000 */
  SetupParamEditPage();
  FUN_M6F_r4_34000__2358();
  return;
}


// ===== FUN_M6F_r4_34000__2333 @ M6F_r4_34000::2333 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M6F_r4_34000__2333(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_70e2 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_3,0x90);
  API_FE40((char)((ushort)DAT_70e2 >> 8),(char)DAT_70e2,param_3,0x12);
  FUN_M6F_r4_34000__239b();
  FUN_M6F_r4_34000__2358();
  return;
}


// ===== FUN_M6F_r4_34000__2358 @ M6F_r4_34000::2358 =====

undefined2 __h3000 FUN_M6F_r4_34000__2358(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                   " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_70e2 + -5;
  *(undefined1 *)(in_U + -3) = 5;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  LcdSetCursor((char)((ushort)(*psVar1 + 0x10) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M6F_r4_34000__239b @ M6F_r4_34000::239b =====

undefined2 __h3000 FUN_M6F_r4_34000__239b(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_70e2;
  *(char *)(in_U + -1) = (char)DAT_70e2;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEE();
  DAT_712e = *puVar2;
  DAT_7106 = 0;
  return in_D;
}


// ===== FUN_M6F_r4_34000__23b9 @ M6F_r4_34000::23b9 =====

undefined2 __h3000 FUN_M6F_r4_34000__23b9(void)

{
  undefined2 uVar1;
  undefined2 *puVar2;
  ushort uVar3;
  short sVar4;
  undefined2 in_D;
  short in_U;
  short *psVar5;
  ushort *puVar6;
  
  uVar1 = *(undefined2 *)(&UNK_M6F_r4_34000__296f + g_moduleBase + (DAT_70de & 0xff) * 2);
  DAT_7122 = uVar1;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0xff;
  psVar5 = (short *)(in_U + -4);
  *(undefined1 *)psVar5 = 0xff;
  API_FCDE();
  uVar1 = DAT_7122;
  DAT_7124 = *psVar5 + -2;
  if (DAT_70e0 == 0) {
    DAT_7126 = 0x10;
  }
  else if (DAT_70e0 == 1) {
    DAT_7126 = 8;
  }
  else if (DAT_70e0 == 2) {
    DAT_7126 = 4;
  }
  else {
    if (DAT_70e0 != 3) {
      DAT_7126 = 1;
      goto LAB_M6F_r4_34000__245a;
    }
    DAT_7126 = 2;
  }
  puVar2 = (undefined2 *)(&UNK_M6F_r4_34000__29e7 + g_moduleBase + (DAT_70e0 & 0xff) * 10);
  DAT_7116 = *puVar2;
  DAT_7118 = puVar2[1];
  DAT_711a = puVar2[2];
  DAT_711c = puVar2[3];
  DAT_711e = puVar2[4];
LAB_M6F_r4_34000__245a:
  DAT_70f2 = (DAT_70e0 & 0xff) * 0x30;
  DAT_713c = *(short *)(&UNK_M6F_r4_34000__26cf +
                       g_moduleBase + (0x2e - DAT_70de & 0xfffc) + DAT_70f2);
  DAT_713a = *(short *)((short)(&UNK_M6F_r4_34000__26cf +
                               g_moduleBase + (0x2e - DAT_70de & 0xfffc) + DAT_70f2) + 2);
  *(char *)((short)psVar5 + 1) = (char)DAT_7122;
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  uVar3 = (ushort)DAT_7126 >> 8;
  *(char *)((short)psVar5 + -1) = (char)DAT_7126 << 1;
  puVar6 = (ushort *)(psVar5 + -1);
  *(char *)puVar6 = (char)uVar3;
  API_FCF0();
  uVar1 = DAT_709a;
  DAT_70f2 = puVar6[1];
  *(char *)((short)puVar6 + 3) = (char)DAT_709a;
  *(char *)(puVar6 + 1) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)puVar6 + 1) = 0x2c;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  sVar4 = DAT_7124;
  DAT_70f4 = *puVar6;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_70f4 <= (ushort)(DAT_713a - DAT_713c) || DAT_713a - DAT_713c < (short)DAT_70f4)) {
    DAT_712a = (DAT_70f2 + DAT_70f4) - DAT_713a;
  }
  else {
    DAT_712a = DAT_70f2 - DAT_713c;
  }
  *(char *)((short)puVar6 + 1) = (char)DAT_7124;
  *(char *)puVar6 = (char)((ushort)sVar4 >> 8);
  uVar1 = DAT_7126;
  *(char *)((short)puVar6 + -1) = (char)DAT_7126;
  puVar6 = puVar6 + -1;
  *(char *)puVar6 = (char)((ushort)uVar1 >> 8);
  API_FCF0();
  *(undefined1 *)((short)puVar6 + 1) = 0xff;
  *(undefined1 *)puVar6 = 0xff;
  API_FCDE();
  DAT_70f2 = *puVar6;
  DAT_70ee = DAT_70f2 + DAT_712c;
  DAT_713e = DAT_70f2;
  *(undefined1 *)((short)puVar6 + 1) = 0xff;
  *(undefined1 *)puVar6 = 0x7f;
  uVar3 = DAT_70f2;
  *(char *)((short)puVar6 + -1) = (char)DAT_70f2;
  puVar6 = puVar6 + -1;
  *(char *)puVar6 = (char)(uVar3 >> 8);
  API_FCEA();
  DAT_70f0 = *puVar6 + 5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70f0 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70ee >> 8));
  DAT_7106 = 0;
  return in_D;
}


// ===== FUN_M6F_r4_34000__2538 @ M6F_r4_34000::2538 =====

undefined2 __h3000 FUN_M6F_r4_34000__2538(void)

{
  undefined2 uVar1;
  ushort uVar2;
  undefined *puVar3;
  undefined2 in_D;
  short sVar4;
  short *in_U;
  
  DAT_70f4 = *in_U;
  DAT_70f8 = in_U[1];
  uVar2 = (DAT_70f8 + 0x30) * 2 + g_moduleBase;
  puVar3 = &DAT_M6F_r4_34000__2587;
  if (DAT_70f4 < 0 || uVar2 < 0xda79) {
    sVar4 = -DAT_70f4;
  }
  else {
    sVar4 = 100 - DAT_70f4;
    puVar3 = &DAT_M6F_r4_34000__2589;
  }
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) +
          g_moduleBase;
  uVar1 = *(undefined2 *)(puVar3 + uVar2);
  DAT_70f6 = DAT_70f4;
  *(char *)((short)in_U + 3) = (char)uVar1;
  *(char *)(in_U + 1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M6F_r4_34000__2603 + sVar4);
  *(char *)((short)in_U + 1) = (char)uVar1;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  return in_D;
}


