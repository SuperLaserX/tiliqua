// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M72_r4_00000 M72_r4_00000::0000-M72_r4_00000::3fff, 277 functions
// Bank r4_00000 (module id 72, sub 00)

// ===== MODULE_72_01_entry @ M72_r4_00000::0101 =====

undefined2 __h3000 MODULE_72_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $0105 */
  uVar1 = ModuleSetBase();
  FUN_M72_r4_00000__01f3();
  FUN_M72_r4_00000__018e();
  FUN_M72_r4_00000__029e();
  DAT_60da = 3;
  API_FE38();
  if (DAT_600a != 'r') {
    FUN_a2f1();
    FUN_M72_r4_00000__015e();
  }
  FUN_M72_r4_00000__02bd();
  FUN_M72_r4_00000__030a();
  DAT_6105 = 1;
  DAT_6106 = 0xb1;
  if (DAT_600a != 'r') {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M72_r4_00000__05d1();
  API_FE10();
  return uVar1;
}


// ===== FUN_M72_r4_00000__015e @ M72_r4_00000::015e =====

undefined2 __h3000 FUN_M72_r4_00000__015e(undefined1 param_1,undefined1 param_2,undefined2 param_3)

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
  DspLoadProgram(param_1,1,0x7210);
  uVar1 = extraout_A;
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A,2,0x7211);
    uVar1 = extraout_A_00;
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_00,3,&DAT_7212);
      uVar1 = extraout_A_01;
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        API_FD7C();
        return auStack_8;
      }
    }
  }
  LcdSetCursor(uVar1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M72_r4_00000__018e @ M72_r4_00000::018e =====

undefined2 __h3000 FUN_M72_r4_00000__018e(void)

{
  undefined2 in_D;
  
  DAT_7002 = 0;
  DAT_7022 = 0;
  DAT_702a = 0;
  DAT_7032 = 0;
  DAT_7066 = 0;
  DAT_703a = 0;
  DAT_7046 = 0;
  DAT_7052 = 0;
  DAT_7082 = 0;
  DAT_700a = 0;
  DAT_7010 = 0;
  DAT_7016 = 0;
  DAT_701c = 0;
  DAT_708a = 0;
  DAT_708c = 0;
  DAT_708e = 0;
  DAT_709c = 0;
  DAT_709e = 0;
  DAT_70a0 = 0;
  DAT_70d8 = 0;
  DAT_70da = 0;
  DAT_70dc = 0;
  DAT_70de = 0;
  DAT_70e0 = 0;
  DAT_70e2 = 0;
  DAT_70e4 = 0;
  DAT_70e6 = 0;
  DAT_70e8 = 0;
  DAT_70ea = 0;
  DAT_70ec = 0;
  DAT_70ee = 0;
  return in_D;
}


// ===== FUN_M72_r4_00000__01f3 @ M72_r4_00000::01f3 =====

undefined2 __h3000 FUN_M72_r4_00000__01f3(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FE04]: 19:08 1A:0E 1B:14 1C:1A */
  LoadParamsSigned();
                    /* inline[API_FE08]: 51:30 65:6E 67:70 69:72 6B:74 6D:76 6F:78 45:00 47:06 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 4B:26 4F:2E 53:36 49:20 4D:28 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 71:7A 73:7C 75:7E 77:96 79:98 7B:9A */
  LoadParamsScaled();
                    /* inline[API_FE08]: 7D:A8 7F:AA 81:AC 83:AE 85:B0 87:B2 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 89:B4 8B:B6 8D:B8 8F:BA 91:BC 93:BE */
  LoadParamsScaled();
                    /* inline[API_FE08]: 95:C0 97:C2 99:C4 9B:C6 9D:C8 9F:CA */
  LoadParamsScaled();
                    /* inline[API_FE08]: A1:CC A3:CE A5:D0 A7:D2 A9:D4 AB:D6 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 55:38 59:44 5D:50 61:64 AD:80 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 57:3E 5B:4A 5F:56 63:6A AF:86 */
  LoadParamsScaled();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__029e @ M72_r4_00000::029e =====

undefined2 __h3000 FUN_M72_r4_00000__029e(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M72_r4_00000__230c();
  FUN_M72_r4_00000__2387();
  FUN_M72_r4_00000__2402();
  FUN_M72_r4_00000__247d();
  FUN_M72_r4_00000__2272();
  return in_D;
}


// ===== FUN_M72_r4_00000__02bd @ M72_r4_00000::02bd =====

undefined2 __h3000 FUN_M72_r4_00000__02bd(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M72_r4_00000__24af();
  FUN_M72_r4_00000__1ac8();
  FUN_M72_r4_00000__1d0d();
  FUN_M72_r4_00000__1da9();
  FUN_M72_r4_00000__1e45();
  FUN_M72_r4_00000__1979();
  FUN_M72_r4_00000__0984();
  FUN_M72_r4_00000__0c7c();
  FUN_M72_r4_00000__0d53();
  FUN_M72_r4_00000__1a1f();
  FUN_M72_r4_00000__1b81();
  FUN_M72_r4_00000__1c13();
  FUN_M72_r4_00000__108d();
  FUN_M72_r4_00000__111b();
  FUN_M72_r4_00000__11a9();
  FUN_M72_r4_00000__1237();
  FUN_M72_r4_00000__12c5();
  FUN_M72_r4_00000__1353();
  FUN_M72_r4_00000__13e5();
  FUN_M72_r4_00000__14d3();
  FUN_M72_r4_00000__15c1();
  FUN_M72_r4_00000__16af();
  FUN_M72_r4_00000__179d();
  FUN_M72_r4_00000__188b();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__030a @ M72_r4_00000::030a =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M72_r4_00000__030a(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 "rev time" 21 $1B54 $1B60 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "high cut" 25 $1BE6 $1BF2 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "predelay" 29 $1A9B $1AA7 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "frnt/bck" 2D $0948 $0954 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "imagepan" 31 $0D2A $0D36 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "earlymix" 35 $0C4F $0C5B */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "diffusor" 39 $194C $1958 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "  mix   " 3D $2245 $2251 */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M72_r4_00000__03b5;
  _DAT_60f7 = 0x25;
  return in_D;
}


// ===== FUN_M72_r4_00000__03ff @ M72_r4_00000::03ff =====

void __h3000 FUN_M72_r4_00000__03ff(void)

{
  FUN_M72_r4_00000__1a77();
  FUN_M72_r4_00000__05d1();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__040a @ M72_r4_00000::040a =====

void __h3000 FUN_M72_r4_00000__040a(void)

{
  FUN_M72_r4_00000__1b30();
  FUN_M72_r4_00000__05d1();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__0415 @ M72_r4_00000::0415 =====

void __h3000 FUN_M72_r4_00000__0415(void)

{
  FUN_M72_r4_00000__1bc2();
  FUN_M72_r4_00000__05d1();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__0420 @ M72_r4_00000::0420 =====

void __h3000 FUN_M72_r4_00000__0420(void)

{
  FUN_M72_r4_00000__19ce();
  FUN_M72_r4_00000__05d1();
  API_FE16();
  return;
}


// ===== FUN_M72_r4_00000__042b @ M72_r4_00000::042b =====

void __h3000 FUN_M72_r4_00000__042b(void)

{
  FUN_M72_r4_00000__0924();
  FUN_M72_r4_00000__060a();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__0436 @ M72_r4_00000::0436 =====

void __h3000 FUN_M72_r4_00000__0436(void)

{
  FUN_M72_r4_00000__0d06();
  FUN_M72_r4_00000__060a();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__0441 @ M72_r4_00000::0441 =====

void __h3000 FUN_M72_r4_00000__0441(void)

{
  FUN_M72_r4_00000__0c2b();
  FUN_M72_r4_00000__060a();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__044c @ M72_r4_00000::044c =====

void __h3000 FUN_M72_r4_00000__044c(void)

{
  FUN_M72_r4_00000__1928();
  FUN_M72_r4_00000__060a();
  API_FE16();
  return;
}


// ===== FUN_M72_r4_00000__0457 @ M72_r4_00000::0457 =====

void __h3000 FUN_M72_r4_00000__0457(void)

{
  FUN_M72_r4_00000__2221();
  FUN_M72_r4_00000__0643();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__0462 @ M72_r4_00000::0462 =====

void __h3000 FUN_M72_r4_00000__0462(void)

{
  FUN_M72_r4_00000__22d3();
  FUN_M72_r4_00000__0876();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__046d @ M72_r4_00000::046d =====

void __h3000 FUN_M72_r4_00000__046d(void)

{
  FUN_M72_r4_00000__234e();
  FUN_M72_r4_00000__0876();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__0478 @ M72_r4_00000::0478 =====

void __h3000 FUN_M72_r4_00000__0478(void)

{
  FUN_M72_r4_00000__23c9();
  FUN_M72_r4_00000__08a8();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__0483 @ M72_r4_00000::0483 =====

void __h3000 FUN_M72_r4_00000__0483(void)

{
  FUN_M72_r4_00000__2444();
  FUN_M72_r4_00000__08a8();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__048e @ M72_r4_00000::048e =====

void __h3000 FUN_M72_r4_00000__048e(void)

{
  FUN_M72_r4_00000__209b();
  FUN_M72_r4_00000__0804();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__0499 @ M72_r4_00000::0499 =====

void __h3000 FUN_M72_r4_00000__0499(void)

{
  FUN_M72_r4_00000__20a2();
  FUN_M72_r4_00000__0804();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__04a4 @ M72_r4_00000::04a4 =====

void __h3000 FUN_M72_r4_00000__04a4(void)

{
  FUN_M72_r4_00000__20a9();
  FUN_M72_r4_00000__0804();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__04af @ M72_r4_00000::04af =====

void __h3000 FUN_M72_r4_00000__04af(void)

{
  FUN_M72_r4_00000__20b0();
  FUN_M72_r4_00000__083d();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__04ba @ M72_r4_00000::04ba =====

void __h3000 FUN_M72_r4_00000__04ba(void)

{
  FUN_M72_r4_00000__20b7();
  FUN_M72_r4_00000__083d();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__04c5 @ M72_r4_00000::04c5 =====

void __h3000 FUN_M72_r4_00000__04c5(void)

{
  FUN_M72_r4_00000__20be();
  FUN_M72_r4_00000__083d();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__04d0 @ M72_r4_00000::04d0 =====

void __h3000 FUN_M72_r4_00000__04d0(void)

{
  FUN_M72_r4_00000__1cd4();
  FUN_M72_r4_00000__0792();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__04db @ M72_r4_00000::04db =====

void __h3000 FUN_M72_r4_00000__04db(void)

{
  FUN_M72_r4_00000__1d70();
  FUN_M72_r4_00000__0792();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__04e6 @ M72_r4_00000::04e6 =====

void __h3000 FUN_M72_r4_00000__04e6(void)

{
  FUN_M72_r4_00000__1e0c();
  FUN_M72_r4_00000__0792();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__04f1 @ M72_r4_00000::04f1 =====

void __h3000 FUN_M72_r4_00000__04f1(void)

{
  FUN_M72_r4_00000__1ea8();
  FUN_M72_r4_00000__07cb();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__04fc @ M72_r4_00000::04fc =====

void __h3000 FUN_M72_r4_00000__04fc(void)

{
  FUN_M72_r4_00000__1f5f();
  FUN_M72_r4_00000__07cb();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__0507 @ M72_r4_00000::0507 =====

void __h3000 FUN_M72_r4_00000__0507(void)

{
  FUN_M72_r4_00000__2016();
  FUN_M72_r4_00000__07cb();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__0512 @ M72_r4_00000::0512 =====

void __h3000 FUN_M72_r4_00000__0512(void)

{
  FUN_M72_r4_00000__1040();
  FUN_M72_r4_00000__06ae();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__051d @ M72_r4_00000::051d =====

void __h3000 FUN_M72_r4_00000__051d(void)

{
  FUN_M72_r4_00000__10ce();
  FUN_M72_r4_00000__06ae();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__0528 @ M72_r4_00000::0528 =====

void __h3000 FUN_M72_r4_00000__0528(void)

{
  FUN_M72_r4_00000__115c();
  FUN_M72_r4_00000__06ae();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__0533 @ M72_r4_00000::0533 =====

void __h3000 FUN_M72_r4_00000__0533(void)

{
  FUN_M72_r4_00000__11ea();
  FUN_M72_r4_00000__06e7();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__053e @ M72_r4_00000::053e =====

void __h3000 FUN_M72_r4_00000__053e(void)

{
  FUN_M72_r4_00000__1278();
  FUN_M72_r4_00000__06e7();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__0549 @ M72_r4_00000::0549 =====

void __h3000 FUN_M72_r4_00000__0549(void)

{
  FUN_M72_r4_00000__1306();
  FUN_M72_r4_00000__06e7();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__0554 @ M72_r4_00000::0554 =====

void __h3000 FUN_M72_r4_00000__0554(void)

{
  FUN_M72_r4_00000__1394();
  FUN_M72_r4_00000__0720();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__055f @ M72_r4_00000::055f =====

void __h3000 FUN_M72_r4_00000__055f(void)

{
  FUN_M72_r4_00000__1482();
  FUN_M72_r4_00000__0720();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__056a @ M72_r4_00000::056a =====

void __h3000 FUN_M72_r4_00000__056a(void)

{
  FUN_M72_r4_00000__1570();
  FUN_M72_r4_00000__0720();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__0575 @ M72_r4_00000::0575 =====

void __h3000 FUN_M72_r4_00000__0575(void)

{
  FUN_M72_r4_00000__165e();
  FUN_M72_r4_00000__0759();
  API_FE10();
  return;
}


// ===== FUN_M72_r4_00000__0580 @ M72_r4_00000::0580 =====

void __h3000 FUN_M72_r4_00000__0580(void)

{
  FUN_M72_r4_00000__174c();
  FUN_M72_r4_00000__0759();
  API_FE12();
  return;
}


// ===== FUN_M72_r4_00000__058b @ M72_r4_00000::058b =====

void __h3000 FUN_M72_r4_00000__058b(void)

{
  FUN_M72_r4_00000__183a();
  FUN_M72_r4_00000__0759();
  API_FE14();
  return;
}


// ===== FUN_M72_r4_00000__0596 @ M72_r4_00000::0596 =====

void __h3000 FUN_M72_r4_00000__0596(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M72_r4_00000__05d1 @ M72_r4_00000::05d1 =====

void __h3000 FUN_M72_r4_00000__05d1(void)

{
                    /* inline[API_FE02]: "predelay" "rev time" "high cut" "  size  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1A6B ->$1B24 ->$1BB6 ->$19C2 ->$060A ->$0643 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__060a @ M72_r4_00000::060a =====

void __h3000 FUN_M72_r4_00000__060a(void)

{
                    /* inline[API_FE02]: "position" "  pan   " "earlymix" "diffusor" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0918 ->$0CFA ->$0C1F ->$191C ->$0643 ->$05D1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0643 @ M72_r4_00000::0643 =====

void __h3000 FUN_M72_r4_00000__0643(void)

{
                    /* inline[API_FE02]: "  mix   " [*] " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2215 ->$08DA ->$0876 ->$0675 ->$05D1 ->$060A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0675 @ M72_r4_00000::0675 =====

void __h3000 FUN_M72_r4_00000__0675(void)

{
                    /* inline[API_FE02]: " delays " "allpass " "  taps  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0804 ->$0792 ->$06AE ->$05D1 ->$08DA ->$08DA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__06ae @ M72_r4_00000::06ae =====

void __h3000 FUN_M72_r4_00000__06ae(void)

{
                    /* inline[API_FE02]: "  pan 1 " "  pan 2 " "  pan 3 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1034 ->$10C2 ->$1150 ->$0675 ->$06E7 ->$0759 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__06e7 @ M72_r4_00000::06e7 =====

void __h3000 FUN_M72_r4_00000__06e7(void)

{
                    /* inline[API_FE02]: "  pan 4 " "  pan 5 " "  pan 6 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$11DE ->$126C ->$12FA ->$0675 ->$0720 ->$06AE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0720 @ M72_r4_00000::0720 =====

void __h3000 FUN_M72_r4_00000__0720(void)

{
                    /* inline[API_FE02]: "level 1 " "level 2 " "level 3 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1388 ->$1476 ->$1564 ->$0675 ->$0759 ->$06E7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0759 @ M72_r4_00000::0759 =====

void __h3000 FUN_M72_r4_00000__0759(void)

{
                    /* inline[API_FE02]: "level 4 " "level 5 " "level 6 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1652 ->$1740 ->$182E ->$0675 ->$06AE ->$0720 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0792 @ M72_r4_00000::0792 =====

void __h3000 FUN_M72_r4_00000__0792(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1CC8 ->$1D64 ->$1E00 ->$0675 ->$07CB ->$07CB */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__07cb @ M72_r4_00000::07cb =====

void __h3000 FUN_M72_r4_00000__07cb(void)

{
                    /* inline[API_FE02]: "   g1   " "   g2   " "   g3   " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1E9C ->$1F53 ->$200A ->$0675 ->$0792 ->$0792 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0804 @ M72_r4_00000::0804 =====

void __h3000 FUN_M72_r4_00000__0804(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$20F1 ->$20FB ->$2105 ->$0675 ->$083D ->$083D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__083d @ M72_r4_00000::083d =====

void __h3000 FUN_M72_r4_00000__083d(void)

{
                    /* inline[API_FE02]: "delay 4 " "delay 5 " "delay 6 " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$210F ->$2119 ->$2123 ->$0675 ->$0804 ->$0804 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__0876 @ M72_r4_00000::0876 =====

void __h3000 FUN_M72_r4_00000__0876(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$22C7 ->$2342 ->$08DA ->$060A ->$08A8 ->$08A8 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__08a8 @ M72_r4_00000::08a8 =====

void __h3000 FUN_M72_r4_00000__08a8(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$23BD ->$2438 ->$08DA ->$060A ->$0876 ->$0876 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M72_r4_00000__08da @ M72_r4_00000::08da =====

void __h3000 FUN_M72_r4_00000__08da(void)

{
  return;
}


// ===== FUN_M72_r4_00000__08db @ M72_r4_00000::08db =====

undefined2 __h3000 FUN_M72_r4_00000__08db(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M72_r4_00000__13e5();
  FUN_M72_r4_00000__14d3();
  FUN_M72_r4_00000__15c1();
  FUN_M72_r4_00000__16af();
  FUN_M72_r4_00000__179d();
  FUN_M72_r4_00000__188b();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__0918 @ M72_r4_00000::0918 =====

void __h3000 FUN_M72_r4_00000__0918(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2);
  return;
}


// ===== FUN_M72_r4_00000__0924 @ M72_r4_00000::0924 =====

void __h3000 FUN_M72_r4_00000__0924(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0984 ->$093C */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2);
  return;
}


// ===== FUN_M72_r4_00000__0930 @ M72_r4_00000::0930 =====

void __h3000 FUN_M72_r4_00000__0930(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0984 ->$093C */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2);
  return;
}


// ===== FUN_M72_r4_00000__093c @ M72_r4_00000::093c =====

void __h3000 FUN_M72_r4_00000__093c(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2);
  return;
}


// ===== FUN_M72_r4_00000__0948 @ M72_r4_00000::0948 =====

void __h3000 FUN_M72_r4_00000__0948(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0984 ->$093C */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2);
  return;
}


// ===== FUN_M72_r4_00000__0954 @ M72_r4_00000::0954 =====

void __h3000 FUN_M72_r4_00000__0954(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0984 ->$093C $0930 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2);
  return;
}


// ===== FUN_M72_r4_00000__0984 @ M72_r4_00000::0984 =====

undefined2 __h3000 FUN_M72_r4_00000__0984(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  API_FE76();
  *(short *)(in_U + -2) = DAT_703c + 2;
  *(undefined1 *)(in_U + -3) = 4;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEE();
  FUN_c0cd();
  DAT_7042 = *psVar1;
  DAT_7040 = 0x7fff - DAT_7042;
  FUN_M72_r4_00000__0d53();
  FUN_M72_r4_00000__08db();
  return in_D;
}


// ===== FUN_M72_r4_00000__0c1f @ M72_r4_00000::0c1f =====

void __h3000 FUN_M72_r4_00000__0c1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0C7C ->$0C43 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9);
  return;
}


// ===== FUN_M72_r4_00000__0c2b @ M72_r4_00000::0c2b =====

void __h3000 FUN_M72_r4_00000__0c2b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0C7C ->$0C43 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9);
  return;
}


// ===== FUN_M72_r4_00000__0c37 @ M72_r4_00000::0c37 =====

void __h3000 FUN_M72_r4_00000__0c37(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0C7C ->$0C43 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9);
  return;
}


// ===== FUN_M72_r4_00000__0c43 @ M72_r4_00000::0c43 =====

void __h3000 FUN_M72_r4_00000__0c43(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0C7C ->$0C43 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9);
  return;
}


// ===== FUN_M72_r4_00000__0c4f @ M72_r4_00000::0c4f =====

void __h3000 FUN_M72_r4_00000__0c4f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0C7C ->$0C43 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9);
  return;
}


// ===== FUN_M72_r4_00000__0c5b @ M72_r4_00000::0c5b =====

void __h3000 FUN_M72_r4_00000__0c5b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0C7C ->$0C43 $0C37 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9);
  return;
}


// ===== FUN_M72_r4_00000__0c7c @ M72_r4_00000::0c7c =====

undefined2 __h3000 FUN_M72_r4_00000__0c7c(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  undefined2 in_D;
  undefined1 uVar4;
  short in_U;
  short *psVar5;
  
  API_FE76();
  uVar2 = DAT_7054;
  *(char *)(in_U + -1) = (char)DAT_7054;
  psVar5 = (short *)(in_U + -2);
  *(char *)psVar5 = (char)((ushort)uVar2 >> 8);
  FUN_c0cd();
  sVar1 = *psVar5;
  DAT_7118 = 0x7fff - sVar1;
  DAT_7116 = sVar1;
  *(char *)((short)psVar5 + 1) = (char)sVar1;
  uVar3 = (undefined1)((ushort)sVar1 >> 8);
  *(undefined1 *)psVar5 = uVar3;
  *(char *)((short)psVar5 + -1) = (char)sVar1;
  psVar5 = psVar5 + -1;
  *(undefined1 *)psVar5 = uVar3;
  API_FCF2();
  sVar1 = DAT_7118;
  DAT_7116 = *psVar5;
  DAT_705a = 0x7fff - DAT_7116;
  uVar4 = (undefined1)DAT_7118;
  *(undefined1 *)((short)psVar5 + 1) = uVar4;
  uVar3 = (undefined1)((ushort)sVar1 >> 8);
  *(undefined1 *)psVar5 = uVar3;
  *(undefined1 *)((short)psVar5 + -1) = uVar4;
  psVar5 = psVar5 + -1;
  *(undefined1 *)psVar5 = uVar3;
  API_FCF2();
  DAT_7118 = *psVar5;
  DAT_7058 = 0x7fff - DAT_7118;
  FUN_M72_r4_00000__0d53();
  return in_D;
}


// ===== FUN_M72_r4_00000__0cfa @ M72_r4_00000::0cfa =====

void __h3000 FUN_M72_r4_00000__0cfa(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4);
  return;
}


// ===== FUN_M72_r4_00000__0d06 @ M72_r4_00000::0d06 =====

void __h3000 FUN_M72_r4_00000__0d06(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0D53 ->$0D1E */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4);
  return;
}


// ===== FUN_M72_r4_00000__0d12 @ M72_r4_00000::0d12 =====

void __h3000 FUN_M72_r4_00000__0d12(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0D53 ->$0D1E */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4);
  return;
}


// ===== FUN_M72_r4_00000__0d1e @ M72_r4_00000::0d1e =====

void __h3000 FUN_M72_r4_00000__0d1e(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4);
  return;
}


// ===== FUN_M72_r4_00000__0d2a @ M72_r4_00000::0d2a =====

void __h3000 FUN_M72_r4_00000__0d2a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0D53 ->$0D1E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4);
  return;
}


// ===== FUN_M72_r4_00000__0d36 @ M72_r4_00000::0d36 =====

void __h3000 FUN_M72_r4_00000__0d36(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0D53 ->$0D1E $0D12 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4);
  return;
}


// ===== FUN_M72_r4_00000__0d53 @ M72_r4_00000::0d53 =====

undefined2 __h3000 FUN_M72_r4_00000__0d53(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  undefined2 in_D;
  undefined1 uVar4;
  short in_U;
  short *psVar5;
  
  API_FE76();
  uVar2 = DAT_7048;
  *(char *)(in_U + -1) = (char)DAT_7048;
  *(char *)(in_U + -2) = (char)((ushort)uVar2 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  psVar5 = (short *)(in_U + -4);
  *(undefined1 *)psVar5 = 0;
  API_FCEE();
  FUN_c0cd();
  sVar1 = *psVar5;
  DAT_7118 = 0x7fff - sVar1;
  DAT_7116 = sVar1;
  *(char *)((short)psVar5 + 1) = (char)sVar1;
  uVar3 = (undefined1)((ushort)sVar1 >> 8);
  *(undefined1 *)psVar5 = uVar3;
  *(char *)((short)psVar5 + -1) = (char)sVar1;
  psVar5 = psVar5 + -1;
  *(undefined1 *)psVar5 = uVar3;
  API_FCF2();
  sVar1 = DAT_7118;
  DAT_7116 = *psVar5;
  DAT_704e = 0x7fff - DAT_7116;
  uVar4 = (undefined1)DAT_7118;
  *(undefined1 *)((short)psVar5 + 1) = uVar4;
  uVar3 = (undefined1)((ushort)sVar1 >> 8);
  *(undefined1 *)psVar5 = uVar3;
  *(undefined1 *)((short)psVar5 + -1) = uVar4;
  psVar5 = psVar5 + -1;
  *(undefined1 *)psVar5 = uVar3;
  API_FCF2();
  uVar2 = DAT_705a;
  DAT_7118 = *psVar5;
  DAT_704c = 0x7fff - DAT_7118;
  *(char *)((short)psVar5 + 1) = (char)DAT_705a;
  *(char *)psVar5 = (char)((ushort)uVar2 >> 8);
  uVar2 = DAT_7040;
  *(char *)((short)psVar5 + -1) = (char)DAT_7040;
  psVar5 = psVar5 + -1;
  *(char *)psVar5 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  *(char *)((short)psVar5 + -1) = (char)*psVar5;
  *(char *)(psVar5 + -1) = (char)((ushort)*psVar5 >> 8);
  sVar1 = DAT_704c;
  *(char *)((short)psVar5 + -3) = (char)DAT_704c;
  psVar5 = psVar5 + -2;
  *(char *)psVar5 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  sVar1 = DAT_704e;
  DAT_705c = *psVar5;
  *(char *)((short)psVar5 + 1) = (char)DAT_704e;
  *(char *)psVar5 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  uVar2 = DAT_7058;
  DAT_705e = *psVar5;
  *(char *)((short)psVar5 + 1) = (char)DAT_7058;
  *(char *)psVar5 = (char)((ushort)uVar2 >> 8);
  uVar2 = DAT_7040;
  *(char *)((short)psVar5 + -1) = (char)DAT_7040;
  psVar5 = psVar5 + -1;
  *(char *)psVar5 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  *(char *)((short)psVar5 + -1) = (char)*psVar5;
  *(char *)(psVar5 + -1) = (char)((ushort)*psVar5 >> 8);
  sVar1 = DAT_704c;
  *(char *)((short)psVar5 + -3) = (char)DAT_704c;
  psVar5 = psVar5 + -2;
  *(char *)psVar5 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  sVar1 = DAT_704e;
  DAT_7060 = *psVar5;
  *(char *)((short)psVar5 + 1) = (char)DAT_704e;
  *(char *)psVar5 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  DAT_7062 = *psVar5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_705c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_705e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7060 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7062 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1034 @ M72_r4_00000::1034 =====

void __h3000 FUN_M72_r4_00000__1034(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  return;
}


// ===== FUN_M72_r4_00000__1040 @ M72_r4_00000::1040 =====

void __h3000 FUN_M72_r4_00000__1040(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$108D ->$1058 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  return;
}


// ===== FUN_M72_r4_00000__104c @ M72_r4_00000::104c =====

void __h3000 FUN_M72_r4_00000__104c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$108D ->$1058 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  return;
}


// ===== FUN_M72_r4_00000__1058 @ M72_r4_00000::1058 =====

void __h3000 FUN_M72_r4_00000__1058(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  return;
}


// ===== FUN_M72_r4_00000__1064 @ M72_r4_00000::1064 =====

void __h3000 FUN_M72_r4_00000__1064(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$108D ->$1058 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  return;
}


// ===== FUN_M72_r4_00000__1070 @ M72_r4_00000::1070 =====

void __h3000 FUN_M72_r4_00000__1070(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$108D ->$1058 $104C */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  return;
}


// ===== FUN_M72_r4_00000__108d @ M72_r4_00000::108d =====

undefined2 __h3000 FUN_M72_r4_00000__108d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e);
  FUN_M72_r4_00000__13e5();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__10c2 @ M72_r4_00000::10c2 =====

void __h3000 FUN_M72_r4_00000__10c2(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  return;
}


// ===== FUN_M72_r4_00000__10ce @ M72_r4_00000::10ce =====

void __h3000 FUN_M72_r4_00000__10ce(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$111B ->$10E6 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  return;
}


// ===== FUN_M72_r4_00000__10da @ M72_r4_00000::10da =====

void __h3000 FUN_M72_r4_00000__10da(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$111B ->$10E6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  return;
}


// ===== FUN_M72_r4_00000__10e6 @ M72_r4_00000::10e6 =====

void __h3000 FUN_M72_r4_00000__10e6(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  return;
}


// ===== FUN_M72_r4_00000__10f2 @ M72_r4_00000::10f2 =====

void __h3000 FUN_M72_r4_00000__10f2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$111B ->$10E6 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  return;
}


// ===== FUN_M72_r4_00000__10fe @ M72_r4_00000::10fe =====

void __h3000 FUN_M72_r4_00000__10fe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$111B ->$10E6 $10DA */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  return;
}


// ===== FUN_M72_r4_00000__111b @ M72_r4_00000::111b =====

undefined2 __h3000 FUN_M72_r4_00000__111b(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c);
  FUN_M72_r4_00000__14d3();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__1150 @ M72_r4_00000::1150 =====

void __h3000 FUN_M72_r4_00000__1150(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  return;
}


// ===== FUN_M72_r4_00000__115c @ M72_r4_00000::115c =====

void __h3000 FUN_M72_r4_00000__115c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$11A9 ->$1174 */
                    /* inline[API_FDBC]: "5.94...*" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  return;
}


// ===== FUN_M72_r4_00000__1168 @ M72_r4_00000::1168 =====

void __h3000 FUN_M72_r4_00000__1168(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$11A9 ->$1174 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  return;
}


// ===== FUN_M72_r4_00000__1174 @ M72_r4_00000::1174 =====

void __h3000 FUN_M72_r4_00000__1174(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  return;
}


// ===== FUN_M72_r4_00000__1180 @ M72_r4_00000::1180 =====

void __h3000 FUN_M72_r4_00000__1180(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$11A9 ->$1174 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  return;
}


// ===== FUN_M72_r4_00000__118c @ M72_r4_00000::118c =====

void __h3000 FUN_M72_r4_00000__118c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$11A9 ->$1174 $1168 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  return;
}


// ===== FUN_M72_r4_00000__11a9 @ M72_r4_00000::11a9 =====

undefined2 __h3000 FUN_M72_r4_00000__11a9(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a);
  FUN_M72_r4_00000__15c1();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__11de @ M72_r4_00000::11de =====

void __h3000 FUN_M72_r4_00000__11de(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  return;
}


// ===== FUN_M72_r4_00000__11ea @ M72_r4_00000::11ea =====

void __h3000 FUN_M72_r4_00000__11ea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1237 ->$1202 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  return;
}


// ===== FUN_M72_r4_00000__11f6 @ M72_r4_00000::11f6 =====

void __h3000 FUN_M72_r4_00000__11f6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1237 ->$1202 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  return;
}


// ===== FUN_M72_r4_00000__1202 @ M72_r4_00000::1202 =====

void __h3000 FUN_M72_r4_00000__1202(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  return;
}


// ===== FUN_M72_r4_00000__120e @ M72_r4_00000::120e =====

void __h3000 FUN_M72_r4_00000__120e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1237 ->$1202 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  return;
}


// ===== FUN_M72_r4_00000__121a @ M72_r4_00000::121a =====

void __h3000 FUN_M72_r4_00000__121a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1237 ->$1202 $11F6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  return;
}


// ===== FUN_M72_r4_00000__1237 @ M72_r4_00000::1237 =====

undefined2 __h3000 FUN_M72_r4_00000__1237(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8);
  FUN_M72_r4_00000__16af();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__126c @ M72_r4_00000::126c =====

void __h3000 FUN_M72_r4_00000__126c(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  return;
}


// ===== FUN_M72_r4_00000__1278 @ M72_r4_00000::1278 =====

void __h3000 FUN_M72_r4_00000__1278(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$12C5 ->$1290 */
                    /* inline[API_FDBC]: "5.94...F" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  return;
}


// ===== FUN_M72_r4_00000__1284 @ M72_r4_00000::1284 =====

void __h3000 FUN_M72_r4_00000__1284(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$12C5 ->$1290 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  return;
}


// ===== FUN_M72_r4_00000__1290 @ M72_r4_00000::1290 =====

void __h3000 FUN_M72_r4_00000__1290(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  return;
}


// ===== FUN_M72_r4_00000__129c @ M72_r4_00000::129c =====

void __h3000 FUN_M72_r4_00000__129c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$12C5 ->$1290 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  return;
}


// ===== FUN_M72_r4_00000__12a8 @ M72_r4_00000::12a8 =====

void __h3000 FUN_M72_r4_00000__12a8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$12C5 ->$1290 $1284 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  return;
}


// ===== FUN_M72_r4_00000__12c5 @ M72_r4_00000::12c5 =====

undefined2 __h3000 FUN_M72_r4_00000__12c5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246);
  FUN_M72_r4_00000__179d();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__12fa @ M72_r4_00000::12fa =====

void __h3000 FUN_M72_r4_00000__12fa(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  return;
}


// ===== FUN_M72_r4_00000__1306 @ M72_r4_00000::1306 =====

void __h3000 FUN_M72_r4_00000__1306(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1353 ->$131E */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  return;
}


// ===== FUN_M72_r4_00000__1312 @ M72_r4_00000::1312 =====

void __h3000 FUN_M72_r4_00000__1312(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1353 ->$131E */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  return;
}


// ===== FUN_M72_r4_00000__131e @ M72_r4_00000::131e =====

void __h3000 FUN_M72_r4_00000__131e(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  return;
}


// ===== FUN_M72_r4_00000__132a @ M72_r4_00000::132a =====

void __h3000 FUN_M72_r4_00000__132a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1353 ->$131E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  return;
}


// ===== FUN_M72_r4_00000__1336 @ M72_r4_00000::1336 =====

void __h3000 FUN_M72_r4_00000__1336(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1353 ->$131E $1312 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  return;
}


// ===== FUN_M72_r4_00000__1353 @ M72_r4_00000::1353 =====

undefined2 __h3000 FUN_M72_r4_00000__1353(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4);
  FUN_M72_r4_00000__188b();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__1388 @ M72_r4_00000::1388 =====

void __h3000 FUN_M72_r4_00000__1388(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$13E5 ->$13AC */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362);
  return;
}


// ===== FUN_M72_r4_00000__1394 @ M72_r4_00000::1394 =====

void __h3000 FUN_M72_r4_00000__1394(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$13E5 ->$13AC */
                    /* inline[API_FDBC]: "5.94...b" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362);
  return;
}


// ===== FUN_M72_r4_00000__13a0 @ M72_r4_00000::13a0 =====

void __h3000 FUN_M72_r4_00000__13a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$13E5 ->$13AC */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362);
  return;
}


// ===== FUN_M72_r4_00000__13ac @ M72_r4_00000::13ac =====

void __h3000 FUN_M72_r4_00000__13ac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$13E5 ->$13AC */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362);
  return;
}


// ===== FUN_M72_r4_00000__13b8 @ M72_r4_00000::13b8 =====

void __h3000 FUN_M72_r4_00000__13b8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$13E5 ->$13AC */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362);
  return;
}


// ===== FUN_M72_r4_00000__13c4 @ M72_r4_00000::13c4 =====

void __h3000 FUN_M72_r4_00000__13c4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$13E5 ->$13AC $13A0 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362);
  return;
}


// ===== FUN_M72_r4_00000__13e5 @ M72_r4_00000::13e5 =====

undefined2 __h3000 FUN_M72_r4_00000__13e5(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  uVar1 = DAT_70f0;
  *(char *)(in_U + -1) = (char)DAT_70f0;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  FUN_c0cd();
  uVar1 = DAT_70fc;
  puVar2[-1] = (char)DAT_70fc;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_7042;
  puVar2[-1] = (char)DAT_7042;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7118 = *psVar3;
  API_FCF2();
  DAT_7116 = *psVar3;
  DAT_7118 = DAT_7118 - DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1476 @ M72_r4_00000::1476 =====

void __h3000 FUN_M72_r4_00000__1476(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$14D3 ->$149A */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450);
  return;
}


// ===== FUN_M72_r4_00000__1482 @ M72_r4_00000::1482 =====

void __h3000 FUN_M72_r4_00000__1482(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$14D3 ->$149A */
                    /* inline[API_FDBC]: "5.94...P" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450);
  return;
}


// ===== FUN_M72_r4_00000__148e @ M72_r4_00000::148e =====

void __h3000 FUN_M72_r4_00000__148e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$14D3 ->$149A */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450);
  return;
}


// ===== FUN_M72_r4_00000__149a @ M72_r4_00000::149a =====

void __h3000 FUN_M72_r4_00000__149a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$14D3 ->$149A */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450);
  return;
}


// ===== FUN_M72_r4_00000__14a6 @ M72_r4_00000::14a6 =====

void __h3000 FUN_M72_r4_00000__14a6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$14D3 ->$149A */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450);
  return;
}


// ===== FUN_M72_r4_00000__14b2 @ M72_r4_00000::14b2 =====

void __h3000 FUN_M72_r4_00000__14b2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$14D3 ->$149A $148E */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450);
  return;
}


// ===== FUN_M72_r4_00000__14d3 @ M72_r4_00000::14d3 =====

undefined2 __h3000 FUN_M72_r4_00000__14d3(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  uVar1 = DAT_70f2;
  *(char *)(in_U + -1) = (char)DAT_70f2;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  FUN_c0cd();
  uVar1 = DAT_70fe;
  puVar2[-1] = (char)DAT_70fe;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_7042;
  puVar2[-1] = (char)DAT_7042;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7118 = *psVar3;
  API_FCF2();
  DAT_7116 = *psVar3;
  DAT_7118 = DAT_7118 - DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1564 @ M72_r4_00000::1564 =====

void __h3000 FUN_M72_r4_00000__1564(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$15C1 ->$1588 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e);
  return;
}


// ===== FUN_M72_r4_00000__1570 @ M72_r4_00000::1570 =====

void __h3000 FUN_M72_r4_00000__1570(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$15C1 ->$1588 */
                    /* inline[API_FDBC]: "5.94...>" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e);
  return;
}


// ===== FUN_M72_r4_00000__157c @ M72_r4_00000::157c =====

void __h3000 FUN_M72_r4_00000__157c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$15C1 ->$1588 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e);
  return;
}


// ===== FUN_M72_r4_00000__1588 @ M72_r4_00000::1588 =====

void __h3000 FUN_M72_r4_00000__1588(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$15C1 ->$1588 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e);
  return;
}


// ===== FUN_M72_r4_00000__1594 @ M72_r4_00000::1594 =====

void __h3000 FUN_M72_r4_00000__1594(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$15C1 ->$1588 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e);
  return;
}


// ===== FUN_M72_r4_00000__15a0 @ M72_r4_00000::15a0 =====

void __h3000 FUN_M72_r4_00000__15a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$15C1 ->$1588 $157C */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e);
  return;
}


// ===== FUN_M72_r4_00000__15c1 @ M72_r4_00000::15c1 =====

undefined2 __h3000 FUN_M72_r4_00000__15c1(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  uVar1 = DAT_70f4;
  *(char *)(in_U + -1) = (char)DAT_70f4;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  FUN_c0cd();
  uVar1 = DAT_7100;
  puVar2[-1] = (char)DAT_7100;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_7042;
  puVar2[-1] = (char)DAT_7042;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7118 = *psVar3;
  API_FCF2();
  DAT_7116 = *psVar3;
  DAT_7118 = DAT_7118 - DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1652 @ M72_r4_00000::1652 =====

void __h3000 FUN_M72_r4_00000__1652(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$16AF ->$1676 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c);
  return;
}


// ===== FUN_M72_r4_00000__165e @ M72_r4_00000::165e =====

void __h3000 FUN_M72_r4_00000__165e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$16AF ->$1676 */
                    /* inline[API_FDBC]: "5.94...," */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c);
  return;
}


// ===== FUN_M72_r4_00000__166a @ M72_r4_00000::166a =====

void __h3000 FUN_M72_r4_00000__166a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$16AF ->$1676 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c);
  return;
}


// ===== FUN_M72_r4_00000__1676 @ M72_r4_00000::1676 =====

void __h3000 FUN_M72_r4_00000__1676(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$16AF ->$1676 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c);
  return;
}


// ===== FUN_M72_r4_00000__1682 @ M72_r4_00000::1682 =====

void __h3000 FUN_M72_r4_00000__1682(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$16AF ->$1676 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c);
  return;
}


// ===== FUN_M72_r4_00000__168e @ M72_r4_00000::168e =====

void __h3000 FUN_M72_r4_00000__168e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$16AF ->$1676 $166A */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c);
  return;
}


// ===== FUN_M72_r4_00000__16af @ M72_r4_00000::16af =====

undefined2 __h3000 FUN_M72_r4_00000__16af(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  uVar1 = DAT_70f6;
  *(char *)(in_U + -1) = (char)DAT_70f6;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  FUN_c0cd();
  uVar1 = DAT_7102;
  puVar2[-1] = (char)DAT_7102;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_7042;
  puVar2[-1] = (char)DAT_7042;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7118 = *psVar3;
  API_FCF2();
  DAT_7116 = *psVar3;
  DAT_7118 = DAT_7118 - DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1740 @ M72_r4_00000::1740 =====

void __h3000 FUN_M72_r4_00000__1740(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$179D ->$1764 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a);
  return;
}


// ===== FUN_M72_r4_00000__174c @ M72_r4_00000::174c =====

void __h3000 FUN_M72_r4_00000__174c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$179D ->$1764 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a);
  return;
}


// ===== FUN_M72_r4_00000__1758 @ M72_r4_00000::1758 =====

void __h3000 FUN_M72_r4_00000__1758(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$179D ->$1764 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a);
  return;
}


// ===== FUN_M72_r4_00000__1764 @ M72_r4_00000::1764 =====

void __h3000 FUN_M72_r4_00000__1764(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$179D ->$1764 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a);
  return;
}


// ===== FUN_M72_r4_00000__1770 @ M72_r4_00000::1770 =====

void __h3000 FUN_M72_r4_00000__1770(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$179D ->$1764 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a);
  return;
}


// ===== FUN_M72_r4_00000__177c @ M72_r4_00000::177c =====

void __h3000 FUN_M72_r4_00000__177c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$179D ->$1764 $1758 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a);
  return;
}


// ===== FUN_M72_r4_00000__179d @ M72_r4_00000::179d =====

undefined2 __h3000 FUN_M72_r4_00000__179d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  uVar1 = DAT_70f8;
  *(char *)(in_U + -1) = (char)DAT_70f8;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  FUN_c0cd();
  uVar1 = DAT_7104;
  puVar2[-1] = (char)DAT_7104;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_7042;
  puVar2[-1] = (char)DAT_7042;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7118 = *psVar3;
  API_FCF2();
  DAT_7116 = *psVar3;
  DAT_7118 = DAT_7118 - DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__182e @ M72_r4_00000::182e =====

void __h3000 FUN_M72_r4_00000__182e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$188B ->$1852 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808);
  return;
}


// ===== FUN_M72_r4_00000__183a @ M72_r4_00000::183a =====

void __h3000 FUN_M72_r4_00000__183a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$188B ->$1852 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808);
  return;
}


// ===== FUN_M72_r4_00000__1846 @ M72_r4_00000::1846 =====

void __h3000 FUN_M72_r4_00000__1846(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$188B ->$1852 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808);
  return;
}


// ===== FUN_M72_r4_00000__1852 @ M72_r4_00000::1852 =====

void __h3000 FUN_M72_r4_00000__1852(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$188B ->$1852 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808);
  return;
}


// ===== FUN_M72_r4_00000__185e @ M72_r4_00000::185e =====

void __h3000 FUN_M72_r4_00000__185e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$188B ->$1852 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808);
  return;
}


// ===== FUN_M72_r4_00000__186a @ M72_r4_00000::186a =====

void __h3000 FUN_M72_r4_00000__186a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$188B ->$1852 $1846 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808);
  return;
}


// ===== FUN_M72_r4_00000__188b @ M72_r4_00000::188b =====

undefined2 __h3000 FUN_M72_r4_00000__188b(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  uVar1 = DAT_70fa;
  *(char *)(in_U + -1) = (char)DAT_70fa;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEE();
  FUN_c0cd();
  uVar1 = DAT_7106;
  puVar2[-1] = (char)DAT_7106;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_7042;
  puVar2[-1] = (char)DAT_7042;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7118 = *psVar3;
  API_FCF2();
  DAT_7116 = *psVar3;
  DAT_7118 = DAT_7118 - DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__191c @ M72_r4_00000::191c =====

void __h3000 FUN_M72_r4_00000__191c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1979 ->$1940 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6);
  return;
}


// ===== FUN_M72_r4_00000__1928 @ M72_r4_00000::1928 =====

void __h3000 FUN_M72_r4_00000__1928(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1979 ->$1940 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6);
  return;
}


// ===== FUN_M72_r4_00000__1934 @ M72_r4_00000::1934 =====

void __h3000 FUN_M72_r4_00000__1934(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1979 ->$1940 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6);
  return;
}


// ===== FUN_M72_r4_00000__1940 @ M72_r4_00000::1940 =====

void __h3000 FUN_M72_r4_00000__1940(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1979 ->$1940 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6);
  return;
}


// ===== FUN_M72_r4_00000__194c @ M72_r4_00000::194c =====

void __h3000 FUN_M72_r4_00000__194c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1979 ->$1940 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6);
  return;
}


// ===== FUN_M72_r4_00000__1958 @ M72_r4_00000::1958 =====

void __h3000 FUN_M72_r4_00000__1958(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1979 ->$1940 $1934 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6);
  return;
}


// ===== FUN_M72_r4_00000__1979 @ M72_r4_00000::1979 =====

undefined2 __h3000 FUN_M72_r4_00000__1979(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7068;
  *(char *)(in_U + -1) = (char)DAT_7068;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_706c = *puVar2;
  FUN_M72_r4_00000__1ee1();
  FUN_M72_r4_00000__1f98();
  FUN_M72_r4_00000__204f();
  return in_D;
}


// ===== FUN_M72_r4_00000__19c2 @ M72_r4_00000::19c2 =====

void __h3000 FUN_M72_r4_00000__19c2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1A1F ->$19E6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c);
  return;
}


// ===== FUN_M72_r4_00000__19ce @ M72_r4_00000::19ce =====

void __h3000 FUN_M72_r4_00000__19ce(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1A1F ->$19E6 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c);
  return;
}


// ===== FUN_M72_r4_00000__19da @ M72_r4_00000::19da =====

void __h3000 FUN_M72_r4_00000__19da(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1A1F ->$19E6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c);
  return;
}


// ===== FUN_M72_r4_00000__19e6 @ M72_r4_00000::19e6 =====

void __h3000 FUN_M72_r4_00000__19e6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1A1F ->$19E6 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c);
  return;
}


// ===== FUN_M72_r4_00000__19f2 @ M72_r4_00000::19f2 =====

void __h3000 FUN_M72_r4_00000__19f2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1A1F ->$19E6 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c);
  return;
}


// ===== FUN_M72_r4_00000__19fe @ M72_r4_00000::19fe =====

void __h3000 FUN_M72_r4_00000__19fe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1A1F ->$19E6 $19DA */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c);
  return;
}


// ===== FUN_M72_r4_00000__1a1f @ M72_r4_00000::1a1f =====

undefined2 __h3000 FUN_M72_r4_00000__1a1f(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7084;
  *(char *)(in_U + -1) = (char)DAT_7084;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_7088 = *puVar2;
  FUN_M72_r4_00000__24af();
  FUN_M72_r4_00000__1d0d();
  FUN_M72_r4_00000__1da9();
  FUN_M72_r4_00000__1e45();
  return in_D;
}


// ===== FUN_M72_r4_00000__1a6b @ M72_r4_00000::1a6b =====

void __h3000 FUN_M72_r4_00000__1a6b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1AC8 ->$1A8F */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45);
  return;
}


// ===== FUN_M72_r4_00000__1a77 @ M72_r4_00000::1a77 =====

void __h3000 FUN_M72_r4_00000__1a77(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1AC8 ->$1A8F */
                    /* inline[API_FDBC]: "5.94...E" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45);
  return;
}


// ===== FUN_M72_r4_00000__1a83 @ M72_r4_00000::1a83 =====

void __h3000 FUN_M72_r4_00000__1a83(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1AC8 ->$1A8F */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45);
  return;
}


// ===== FUN_M72_r4_00000__1a8f @ M72_r4_00000::1a8f =====

void __h3000 FUN_M72_r4_00000__1a8f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1AC8 ->$1A8F */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45);
  return;
}


// ===== FUN_M72_r4_00000__1a9b @ M72_r4_00000::1a9b =====

void __h3000 FUN_M72_r4_00000__1a9b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1AC8 ->$1A8F */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45);
  return;
}


// ===== FUN_M72_r4_00000__1aa7 @ M72_r4_00000::1aa7 =====

void __h3000 FUN_M72_r4_00000__1aa7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1AC8 ->$1A8F $1A83 */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45);
  return;
}


// ===== FUN_M72_r4_00000__1ac8 @ M72_r4_00000::1ac8 =====

undefined2 __h3000 FUN_M72_r4_00000__1ac8(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7034;
  *(char *)(in_U + -1) = (char)DAT_7034;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x2c;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCF0();
  DAT_7116 = *(short *)(puVar2 + 2) + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1b24 @ M72_r4_00000::1b24 =====

void __h3000 FUN_M72_r4_00000__1b24(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  return;
}


// ===== FUN_M72_r4_00000__1b30 @ M72_r4_00000::1b30 =====

void __h3000 FUN_M72_r4_00000__1b30(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1B81 ->$1B48 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  return;
}


// ===== FUN_M72_r4_00000__1b3c @ M72_r4_00000::1b3c =====

void __h3000 FUN_M72_r4_00000__1b3c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1B81 ->$1B48 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  return;
}


// ===== FUN_M72_r4_00000__1b48 @ M72_r4_00000::1b48 =====

void __h3000 FUN_M72_r4_00000__1b48(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  return;
}


// ===== FUN_M72_r4_00000__1b54 @ M72_r4_00000::1b54 =====

void __h3000 FUN_M72_r4_00000__1b54(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1B81 ->$1B48 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  return;
}


// ===== FUN_M72_r4_00000__1b60 @ M72_r4_00000::1b60 =====

void __h3000 FUN_M72_r4_00000__1b60(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1B81 ->$1B48 $1B3C */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  return;
}


// ===== FUN_M72_r4_00000__1b81 @ M72_r4_00000::1b81 =====

undefined2 __h3000 FUN_M72_r4_00000__1b81(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe);
  FUN_M72_r4_00000__1c22();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__1bb6 @ M72_r4_00000::1bb6 =====

void __h3000 FUN_M72_r4_00000__1bb6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1C13 ->$1BDA */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  return;
}


// ===== FUN_M72_r4_00000__1bc2 @ M72_r4_00000::1bc2 =====

void __h3000 FUN_M72_r4_00000__1bc2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1C13 ->$1BDA */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  return;
}


// ===== FUN_M72_r4_00000__1bce @ M72_r4_00000::1bce =====

void __h3000 FUN_M72_r4_00000__1bce(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1C13 ->$1BDA */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  return;
}


// ===== FUN_M72_r4_00000__1bda @ M72_r4_00000::1bda =====

void __h3000 FUN_M72_r4_00000__1bda(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1C13 ->$1BDA */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  return;
}


// ===== FUN_M72_r4_00000__1be6 @ M72_r4_00000::1be6 =====

void __h3000 FUN_M72_r4_00000__1be6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1C13 ->$1BDA */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  return;
}


// ===== FUN_M72_r4_00000__1bf2 @ M72_r4_00000::1bf2 =====

void __h3000 FUN_M72_r4_00000__1bf2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1C13 ->$1BDA $1BCE */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  return;
}


// ===== FUN_M72_r4_00000__1c13 @ M72_r4_00000::1c13 =====

undefined2 __h3000 FUN_M72_r4_00000__1c13(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90);
  FUN_M72_r4_00000__1c22();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__1c22 @ M72_r4_00000::1c22 =====

undefined2 __h3000 FUN_M72_r4_00000__1c22(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  uVar1 = DAT_702c;
  *(char *)(in_U + -1) = (char)DAT_702c;
  psVar2 = (short *)(in_U + -2);
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7116 = (undefined *)CONCAT11(*(char *)psVar2 >> 1,(char)*psVar2 >> 1 | *(char *)psVar2 << 7);
  DAT_7118 = *(undefined2 *)(&UNK_M72_r4_00000__25e3 + g_moduleBase + DAT_7024 * 2);
  *psVar2 = 0x7fff - (short)DAT_7116;
  uVar1 = DAT_7118;
  *(char *)((short)psVar2 + -1) = (char)DAT_7118;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_710a = *psVar2;
  DAT_7108 = (short)DAT_7116;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7108 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_710a >> 8));
  DAT_7116 = &UNK_4e20;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1cc8 @ M72_r4_00000::1cc8 =====

void __h3000 FUN_M72_r4_00000__1cc8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1D0D ->$1CEC */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1d0d_M72_r4_00000__1ca2);
  return;
}


// ===== FUN_M72_r4_00000__1cd4 @ M72_r4_00000::1cd4 =====

void __h3000 FUN_M72_r4_00000__1cd4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1D0D ->$1CEC */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1d0d_M72_r4_00000__1ca2);
  return;
}


// ===== FUN_M72_r4_00000__1ce0 @ M72_r4_00000::1ce0 =====

void __h3000 FUN_M72_r4_00000__1ce0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1D0D ->$1CEC */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1d0d_M72_r4_00000__1ca2);
  return;
}


// ===== FUN_M72_r4_00000__1cec @ M72_r4_00000::1cec =====

void __h3000 FUN_M72_r4_00000__1cec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1D0D ->$1CEC */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1d0d_M72_r4_00000__1ca2);
  return;
}


// ===== FUN_M72_r4_00000__1d0d @ M72_r4_00000::1d0d =====

undefined2 __h3000 FUN_M72_r4_00000__1d0d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7090;
  *(char *)(in_U + -1) = (char)DAT_7090;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7088;
  *(char *)(in_U + -3) = (char)DAT_7088;
  puVar2 = (undefined2 *)(in_U + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1d64 @ M72_r4_00000::1d64 =====

void __h3000 FUN_M72_r4_00000__1d64(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1DA9 ->$1D88 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1da9_M72_r4_00000__1d3e);
  return;
}


// ===== FUN_M72_r4_00000__1d70 @ M72_r4_00000::1d70 =====

void __h3000 FUN_M72_r4_00000__1d70(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1DA9 ->$1D88 */
                    /* inline[API_FDBC]: "5.94...>" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1da9_M72_r4_00000__1d3e);
  return;
}


// ===== FUN_M72_r4_00000__1d7c @ M72_r4_00000::1d7c =====

void __h3000 FUN_M72_r4_00000__1d7c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1DA9 ->$1D88 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1da9_M72_r4_00000__1d3e);
  return;
}


// ===== FUN_M72_r4_00000__1d88 @ M72_r4_00000::1d88 =====

void __h3000 FUN_M72_r4_00000__1d88(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1DA9 ->$1D88 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1da9_M72_r4_00000__1d3e);
  return;
}


// ===== FUN_M72_r4_00000__1da9 @ M72_r4_00000::1da9 =====

undefined2 __h3000 FUN_M72_r4_00000__1da9(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7092;
  *(char *)(in_U + -1) = (char)DAT_7092;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7088;
  *(char *)(in_U + -3) = (char)DAT_7088;
  puVar2 = (undefined2 *)(in_U + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1e00 @ M72_r4_00000::1e00 =====

void __h3000 FUN_M72_r4_00000__1e00(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1E45 ->$1E24 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1e45_M72_r4_00000__1dda);
  return;
}


// ===== FUN_M72_r4_00000__1e0c @ M72_r4_00000::1e0c =====

void __h3000 FUN_M72_r4_00000__1e0c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1E45 ->$1E24 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1e45_M72_r4_00000__1dda);
  return;
}


// ===== FUN_M72_r4_00000__1e18 @ M72_r4_00000::1e18 =====

void __h3000 FUN_M72_r4_00000__1e18(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1E45 ->$1E24 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1e45_M72_r4_00000__1dda);
  return;
}


// ===== FUN_M72_r4_00000__1e24 @ M72_r4_00000::1e24 =====

void __h3000 FUN_M72_r4_00000__1e24(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1E45 ->$1E24 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1e45_M72_r4_00000__1dda);
  return;
}


// ===== FUN_M72_r4_00000__1e45 @ M72_r4_00000::1e45 =====

undefined2 __h3000 FUN_M72_r4_00000__1e45(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7094;
  *(char *)(in_U + -1) = (char)DAT_7094;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7088;
  *(char *)(in_U + -3) = (char)DAT_7088;
  puVar2 = (undefined2 *)(in_U + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1e9c @ M72_r4_00000::1e9c =====

void __h3000 FUN_M72_r4_00000__1e9c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1EE1 ->$1EC0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1ee1_M72_r4_00000__1e76);
  return;
}


// ===== FUN_M72_r4_00000__1ea8 @ M72_r4_00000::1ea8 =====

void __h3000 FUN_M72_r4_00000__1ea8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1EE1 ->$1EC0 */
                    /* inline[API_FDBC]: "5.94...v" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1ee1_M72_r4_00000__1e76);
  return;
}


// ===== FUN_M72_r4_00000__1eb4 @ M72_r4_00000::1eb4 =====

void __h3000 FUN_M72_r4_00000__1eb4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1EE1 ->$1EC0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1ee1_M72_r4_00000__1e76);
  return;
}


// ===== FUN_M72_r4_00000__1ec0 @ M72_r4_00000::1ec0 =====

void __h3000 FUN_M72_r4_00000__1ec0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1EE1 ->$1EC0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1ee1_M72_r4_00000__1e76);
  return;
}


// ===== FUN_M72_r4_00000__1ee1 @ M72_r4_00000::1ee1 =====

undefined2 __h3000 FUN_M72_r4_00000__1ee1(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_70a2;
  *(char *)(in_U + -1) = (char)DAT_70a2;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  uVar1 = DAT_70a2;
  puVar2[-1] = (char)DAT_70a2;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x2c;
  puVar2 = puVar2 + -4;
  *puVar2 = 0x62;
  API_FCF2();
  API_FCE2();
  uVar1 = DAT_706c;
  puVar2[-1] = (char)DAT_706c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__1f53 @ M72_r4_00000::1f53 =====

void __h3000 FUN_M72_r4_00000__1f53(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1F98 ->$1F77 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__1f98_M72_r4_00000__1f2d);
  return;
}


// ===== FUN_M72_r4_00000__1f5f @ M72_r4_00000::1f5f =====

void __h3000 FUN_M72_r4_00000__1f5f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1F98 ->$1F77 */
                    /* inline[API_FDBC]: "5.94...-" */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__1f98_M72_r4_00000__1f2d);
  return;
}


// ===== FUN_M72_r4_00000__1f6b @ M72_r4_00000::1f6b =====

void __h3000 FUN_M72_r4_00000__1f6b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1F98 ->$1F77 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__1f98_M72_r4_00000__1f2d);
  return;
}


// ===== FUN_M72_r4_00000__1f77 @ M72_r4_00000::1f77 =====

void __h3000 FUN_M72_r4_00000__1f77(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1F98 ->$1F77 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__1f98_M72_r4_00000__1f2d);
  return;
}


// ===== FUN_M72_r4_00000__1f98 @ M72_r4_00000::1f98 =====

undefined2 __h3000 FUN_M72_r4_00000__1f98(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_70a4;
  *(char *)(in_U + -1) = (char)DAT_70a4;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  uVar1 = DAT_70a4;
  puVar2[-1] = (char)DAT_70a4;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x2c;
  puVar2 = puVar2 + -4;
  *puVar2 = 0x62;
  API_FCF2();
  API_FCE2();
  uVar1 = DAT_706c;
  puVar2[-1] = (char)DAT_706c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__200a @ M72_r4_00000::200a =====

void __h3000 FUN_M72_r4_00000__200a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$204F ->$202E */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__204f_M72_r4_00000__1fe4);
  return;
}


// ===== FUN_M72_r4_00000__2016 @ M72_r4_00000::2016 =====

void __h3000 FUN_M72_r4_00000__2016(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$204F ->$202E */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__204f_M72_r4_00000__1fe4);
  return;
}


// ===== FUN_M72_r4_00000__2022 @ M72_r4_00000::2022 =====

void __h3000 FUN_M72_r4_00000__2022(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$204F ->$202E */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__204f_M72_r4_00000__1fe4);
  return;
}


// ===== FUN_M72_r4_00000__202e @ M72_r4_00000::202e =====

void __h3000 FUN_M72_r4_00000__202e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$204F ->$202E */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__204f_M72_r4_00000__1fe4);
  return;
}


// ===== FUN_M72_r4_00000__204f @ M72_r4_00000::204f =====

undefined2 __h3000 FUN_M72_r4_00000__204f(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_70a6;
  *(char *)(in_U + -1) = (char)DAT_70a6;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x20;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  uVar1 = DAT_70a6;
  puVar2[-1] = (char)DAT_70a6;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0x2c;
  puVar2 = puVar2 + -4;
  *puVar2 = 0x62;
  API_FCF2();
  API_FCE2();
  uVar1 = DAT_706c;
  puVar2[-1] = (char)DAT_706c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__209b @ M72_r4_00000::209b =====

undefined2 __h3000 FUN_M72_r4_00000__209b(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0);
  DAT_6074 = DAT_60f9;
  *DAT_710c = DAT_60f9;
  API_FC80();
  (*(FUN_M72_r4_00000__20f1 + g_moduleBase + (DAT_7114 & 0xff) * 10))();
  FUN_M72_r4_00000__21af();
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__20a2 @ M72_r4_00000::20a2 =====

undefined2 __h3000 FUN_M72_r4_00000__20a2(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0);
  DAT_6074 = DAT_60f9;
  *DAT_710c = DAT_60f9;
  API_FC80();
  (*(FUN_M72_r4_00000__20f1 + g_moduleBase + (DAT_7114 & 0xff) * 10))();
  FUN_M72_r4_00000__21af();
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__20a9 @ M72_r4_00000::20a9 =====

undefined2 __h3000 FUN_M72_r4_00000__20a9(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0);
  DAT_6074 = DAT_60f9;
  *DAT_710c = DAT_60f9;
  API_FC80();
  (*(FUN_M72_r4_00000__20f1 + g_moduleBase + (DAT_7114 & 0xff) * 10))();
  FUN_M72_r4_00000__21af();
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__20b0 @ M72_r4_00000::20b0 =====

undefined2 __h3000 FUN_M72_r4_00000__20b0(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0);
  DAT_6074 = DAT_60f9;
  *DAT_710c = DAT_60f9;
  API_FC80();
  (*(FUN_M72_r4_00000__20f1 + g_moduleBase + (DAT_7114 & 0xff) * 10))();
  FUN_M72_r4_00000__21af();
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__20b7 @ M72_r4_00000::20b7 =====

undefined2 __h3000 FUN_M72_r4_00000__20b7(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0);
  DAT_6074 = DAT_60f9;
  *DAT_710c = DAT_60f9;
  API_FC80();
  (*(FUN_M72_r4_00000__20f1 + g_moduleBase + (DAT_7114 & 0xff) * 10))();
  FUN_M72_r4_00000__21af();
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__20be @ M72_r4_00000::20be =====

undefined2 __h3000 FUN_M72_r4_00000__20be(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0);
  DAT_6074 = DAT_60f9;
  *DAT_710c = DAT_60f9;
  API_FC80();
  (*(FUN_M72_r4_00000__20f1 + g_moduleBase + (DAT_7114 & 0xff) * 10))();
  FUN_M72_r4_00000__21af();
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__20f1 @ M72_r4_00000::20f1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__20f1(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0,0,1099);
  DAT_6074 = *DAT_710c;
  FUN_M72_r4_00000__0596();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M72_r4_00000__21af();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7114 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__20fb @ M72_r4_00000::20fb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__20fb(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0,1,FUN_M72_r4_00000__044c);
  DAT_6074 = *DAT_710c;
  FUN_M72_r4_00000__0596();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M72_r4_00000__21af();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7114 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__2105 @ M72_r4_00000::2105 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__2105(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0,2,0x44d);
  DAT_6074 = *DAT_710c;
  FUN_M72_r4_00000__0596();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M72_r4_00000__21af();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7114 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__210f @ M72_r4_00000::210f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__210f(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0,3,0x44e);
  DAT_6074 = *DAT_710c;
  FUN_M72_r4_00000__0596();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M72_r4_00000__21af();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7114 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__2119 @ M72_r4_00000::2119 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__2119(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0,4,0x44f);
  DAT_6074 = *DAT_710c;
  FUN_M72_r4_00000__0596();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M72_r4_00000__21af();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7114 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__2123 @ M72_r4_00000::2123 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__2123(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__248d(0,5,0x450);
  DAT_6074 = *DAT_710c;
  FUN_M72_r4_00000__0596();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay  :     samples" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $1388 $0000 $0000 ->$21AF ->$2189
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M72_r4_00000__21af();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7114 >> 8));
  return in_D;
}


// ===== FUN_M72_r4_00000__2189 @ M72_r4_00000::2189 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__2189(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_710c = DAT_6074;
  API_FC82();
  API_FE40((char)((ushort)*DAT_710c >> 8),(char)*DAT_710c,param_1,DAT_7114 + 0xd);
  FUN_M72_r4_00000__21c4();
  return in_D;
}


// ===== FUN_M72_r4_00000__21af @ M72_r4_00000::21af =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__21af(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M72_r4_00000__21c4 @ M72_r4_00000::21c4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M72_r4_00000__21c4
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5
          )

{
  undefined2 uVar1;
  undefined2 *puVar2;
  
  uVar1 = *DAT_710c;
  *(char *)(param_5 + -1) = (char)uVar1;
  *(char *)(param_5 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7088;
  *(char *)(param_5 + -3) = (char)DAT_7088;
  puVar2 = (undefined2 *)(param_5 + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7116 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8),(char)DAT_7116,param_3,DAT_7112);
  return;
}


// ===== FUN_M72_r4_00000__2215 @ M72_r4_00000::2215 =====

void __h3000 FUN_M72_r4_00000__2215(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2272 ->$2239 */
  API_FE6A(param_1,param_2,&PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef);
  return;
}


// ===== FUN_M72_r4_00000__2221 @ M72_r4_00000::2221 =====

void __h3000 FUN_M72_r4_00000__2221(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2272 ->$2239 */
                    /* inline[API_FDBC]: "5.94..!." */
  API_FDBC(param_1,param_2,&PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef);
  return;
}


// ===== FUN_M72_r4_00000__222d @ M72_r4_00000::222d =====

void __h3000 FUN_M72_r4_00000__222d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2272 ->$2239 */
  API_FE6C(param_1,param_2,&PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef);
  return;
}


// ===== FUN_M72_r4_00000__2239 @ M72_r4_00000::2239 =====

void __h3000 FUN_M72_r4_00000__2239(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2272 ->$2239 */
  API_FE6E(param_1,param_2,&PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef);
  return;
}


// ===== FUN_M72_r4_00000__2245 @ M72_r4_00000::2245 =====

void __h3000 FUN_M72_r4_00000__2245(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2272 ->$2239 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef);
  return;
}


// ===== FUN_M72_r4_00000__2251 @ M72_r4_00000::2251 =====

void __h3000 FUN_M72_r4_00000__2251(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2272 ->$2239 $222D */
  API_FE1A(param_1,param_2,&PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef);
  return;
}


// ===== FUN_M72_r4_00000__2272 @ M72_r4_00000::2272 =====

undefined2 __h3000 FUN_M72_r4_00000__2272(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7004;
  *(short *)(in_U + -2) = sVar1;
  DAT_7116 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_7116) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M72_r4_00000__22c7 @ M72_r4_00000::22c7 =====

void __h3000 FUN_M72_r4_00000__22c7(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M72_r4_00000__230c_M72_r4_00000__22a1);
  return;
}


// ===== FUN_M72_r4_00000__22d3 @ M72_r4_00000::22d3 =====

void __h3000 FUN_M72_r4_00000__22d3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$230C ->$22EB */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M72_r4_00000__230c_M72_r4_00000__22a1);
  return;
}


// ===== FUN_M72_r4_00000__22df @ M72_r4_00000::22df =====

void __h3000 FUN_M72_r4_00000__22df(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M72_r4_00000__230c_M72_r4_00000__22a1);
  return;
}


// ===== FUN_M72_r4_00000__22eb @ M72_r4_00000::22eb =====

void __h3000 FUN_M72_r4_00000__22eb(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M72_r4_00000__230c_M72_r4_00000__22a1);
  return;
}


// ===== FUN_M72_r4_00000__230c @ M72_r4_00000::230c =====

undefined2 __h3000 FUN_M72_r4_00000__230c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__230c_M72_r4_00000__22a1);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__2342 @ M72_r4_00000::2342 =====

void __h3000 FUN_M72_r4_00000__2342(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M72_r4_00000__2387_M72_r4_00000__231c);
  return;
}


// ===== FUN_M72_r4_00000__234e @ M72_r4_00000::234e =====

void __h3000 FUN_M72_r4_00000__234e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2387 ->$2366 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M72_r4_00000__2387_M72_r4_00000__231c);
  return;
}


// ===== FUN_M72_r4_00000__235a @ M72_r4_00000::235a =====

void __h3000 FUN_M72_r4_00000__235a(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M72_r4_00000__2387_M72_r4_00000__231c);
  return;
}


// ===== FUN_M72_r4_00000__2366 @ M72_r4_00000::2366 =====

void __h3000 FUN_M72_r4_00000__2366(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M72_r4_00000__2387_M72_r4_00000__231c);
  return;
}


// ===== FUN_M72_r4_00000__2387 @ M72_r4_00000::2387 =====

undefined2 __h3000 FUN_M72_r4_00000__2387(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__2387_M72_r4_00000__231c);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__23bd @ M72_r4_00000::23bd =====

void __h3000 FUN_M72_r4_00000__23bd(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M72_r4_00000__2402_M72_r4_00000__2397);
  return;
}


// ===== FUN_M72_r4_00000__23c9 @ M72_r4_00000::23c9 =====

void __h3000 FUN_M72_r4_00000__23c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2402 ->$23E1 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M72_r4_00000__2402_M72_r4_00000__2397);
  return;
}


// ===== FUN_M72_r4_00000__23d5 @ M72_r4_00000::23d5 =====

void __h3000 FUN_M72_r4_00000__23d5(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M72_r4_00000__2402_M72_r4_00000__2397);
  return;
}


// ===== FUN_M72_r4_00000__23e1 @ M72_r4_00000::23e1 =====

void __h3000 FUN_M72_r4_00000__23e1(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M72_r4_00000__2402_M72_r4_00000__2397);
  return;
}


// ===== FUN_M72_r4_00000__2402 @ M72_r4_00000::2402 =====

undefined2 __h3000 FUN_M72_r4_00000__2402(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__2402_M72_r4_00000__2397);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__2438 @ M72_r4_00000::2438 =====

void __h3000 FUN_M72_r4_00000__2438(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M72_r4_00000__247d_M72_r4_00000__2412);
  return;
}


// ===== FUN_M72_r4_00000__2444 @ M72_r4_00000::2444 =====

void __h3000 FUN_M72_r4_00000__2444(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$247D ->$245C */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M72_r4_00000__247d_M72_r4_00000__2412);
  return;
}


// ===== FUN_M72_r4_00000__2450 @ M72_r4_00000::2450 =====

void __h3000 FUN_M72_r4_00000__2450(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M72_r4_00000__247d_M72_r4_00000__2412);
  return;
}


// ===== FUN_M72_r4_00000__245c @ M72_r4_00000::245c =====

void __h3000 FUN_M72_r4_00000__245c(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M72_r4_00000__247d_M72_r4_00000__2412);
  return;
}


// ===== FUN_M72_r4_00000__247d @ M72_r4_00000::247d =====

undefined2 __h3000 FUN_M72_r4_00000__247d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M72_r4_00000__247d_M72_r4_00000__2412);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M72_r4_00000__248d @ M72_r4_00000::248d =====

undefined2 __h3000 FUN_M72_r4_00000__248d(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_7114 = in_D;
  DAT_7112 = param_1;
  DAT_710c = &DAT_706e + CONCAT11(uVar1,(char)in_D << 1);
  DAT_710e = CONCAT11(uVar1,(char)in_D << 1) + 0x65;
  return in_D;
}


// ===== FUN_M72_r4_00000__24af @ M72_r4_00000::24af =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M72_r4_00000__24af(void)

{
  undefined2 in_D;
  
  FUN_M72_r4_00000__24ea(0,0,1099);
  FUN_M72_r4_00000__24ea(0,1,FUN_M72_r4_00000__044c);
  FUN_M72_r4_00000__24ea(0,2,0x44d);
  FUN_M72_r4_00000__24ea(0,3,0x44e);
  FUN_M72_r4_00000__24ea(0,4,0x44f);
  FUN_M72_r4_00000__24ea(0,5,0x450);
  return in_D;
}


// ===== FUN_M72_r4_00000__24ea @ M72_r4_00000::24ea =====

undefined2 __h3000 FUN_M72_r4_00000__24ea(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_710c = &DAT_706e + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_7112 = param_1;
  DAT_7114 = in_D;
  FUN_M72_r4_00000__21c4();
  return in_D;
}


