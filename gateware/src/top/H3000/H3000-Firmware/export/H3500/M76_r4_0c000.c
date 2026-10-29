// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M76_r4_0c000 M76_r4_0c000::0000-M76_r4_0c000::3fff, 337 functions
// Bank r4_0c000 (module id 76, sub 00)

// ===== MODULE_76_01_entry @ M76_r4_0c000::0113 =====

undefined2 __h3000 MODULE_76_01_entry(void)

{
  undefined2 uVar1;
  byte extraout_CC;
  undefined2 *puVar2;
  
                    /* inline[API_FC60]: $0117 */
  uVar1 = ModuleSetBase();
  puVar2 = &DAT_7000;
  do {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  } while ((bool)(extraout_CC & 1));
  FUN_M76_r4_0c000__01d9();
  FUN_M76_r4_0c000__01af();
  FUN_M76_r4_0c000__01ba();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  if (DAT_600a != 'v') {
    FUN_M76_r4_0c000__0177();
  }
  FUN_M76_r4_0c000__02c7();
  FUN_M76_r4_0c000__039c();
  if (DAT_600a != 'v') {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M76_r4_0c000__0751();
  API_FE10();
  return uVar1;
}


// ===== FUN_M76_r4_0c000__0177 @ M76_r4_0c000::0177 =====

undefined2 __h3000 FUN_M76_r4_0c000__0177(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FDFA();
  FUN_a2f1();
  DspLoadProgram(extraout_A,1,0x7610);
  uVar1 = extraout_A_00;
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A_00,2,0x7611);
    uVar1 = extraout_A_01;
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_01,3,0x7612);
      uVar1 = extraout_A_02;
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        API_FD7C();
        return uStack_8;
      }
    }
  }
  LcdSetCursor(uVar1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__01af @ M76_r4_0c000::01af =====

undefined2 __h3000 FUN_M76_r4_0c000__01af(void)

{
  undefined2 in_D;
  
  DAT_7126 = 0;
  return in_D;
}


// ===== FUN_M76_r4_0c000__01ba @ M76_r4_0c000::01ba =====

undefined2 __h3000 FUN_M76_r4_0c000__01ba(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M76_r4_0c000__2036();
  FUN_M76_r4_0c000__20b1();
  FUN_M76_r4_0c000__212c();
  FUN_M76_r4_0c000__21a7();
  FUN_M76_r4_0c000__1f9c();
  return in_D;
}


// ===== FUN_M76_r4_0c000__01d9 @ M76_r4_0c000::01d9 =====

undefined2 __h3000 FUN_M76_r4_0c000__01d9(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FE08]: 61:00 63:06 65:0A 67:14 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 69:1E 6B:24 6D:28 6F:32 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 75:5A 77:60 79:64 7B:6E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 85:A6 87:A8 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 89:AA 8B:AC */
  LoadParamsScaled();
                    /* inline[API_FE08]: 8D:AE 8F:B0 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 91:B6 93:B8 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 95:B2 97:B4 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 5D:96 5F:98 */
  LoadParamsScaled();
                    /* inline[API_FE08]: AD:9A AF:9C */
  LoadParamsScaled();
                    /* inline[API_FE08]: B1:A2 B3:A4 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 71:9E 73:A0 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 7D:3C 7F:42 81:46 83:50 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 99:BA 9B:BC */
  LoadParamsScaled();
                    /* inline[API_FE08]: A9:BE AB:C0 */
  LoadParamsScaled();
                    /* inline[API_FE08]: A3:CC */
  LoadParamsScaled();
                    /* inline[API_FE08]: 9F:D0 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 9D:CE */
  LoadParamsScaled();
                    /* inline[API_FE04]: B5:CA */
  LoadParamsSigned();
                    /* inline[API_FE08]: A5:82 */
  LoadParamsScaled();
                    /* inline[API_FE04]: B7:D2 B9:D6 BB:DA BD:DE BF:E2 C1:E6 */
  LoadParamsSigned();
                    /* inline[API_FE04]: B8:D4 BA:D8 BC:DC BE:E0 C0:E4 C2:E8 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 19:C2 1A:C4 1B:C6 1C:C8 */
  LoadParamsSigned();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__02c7 @ M76_r4_0c000::02c7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M76_r4_0c000__02c7(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  DAT_713e._1_1_ = 0;
  API_FD2E();
  API_FD2E();
  API_FD2E();
  API_FD2E();
  FUN_M76_r4_0c000__26fa();
  uVar1 = FUN_M76_r4_0c000__2275();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  FUN_M76_r4_0c000__0b90();
  uVar1 = FUN_M76_r4_0c000__0ea1();
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  FUN_M76_r4_0c000__0ce8();
  FUN_M76_r4_0c000__0f30();
  FUN_M76_r4_0c000__104e();
  uVar1 = FUN_M76_r4_0c000__10e0();
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337);
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b);
  FUN_M76_r4_0c000__141c();
  FUN_M76_r4_0c000__0e09();
  FUN_M76_r4_0c000__1786();
  FUN_M76_r4_0c000__1900();
  FUN_M76_r4_0c000__1804();
  FUN_M76_r4_0c000__1708();
  FUN_M76_r4_0c000__1882();
  FUN_M76_r4_0c000__158e();
  FUN_M76_r4_0c000__160c();
  FUN_M76_r4_0c000__1510();
  uVar1 = FUN_M76_r4_0c000__168a();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1987_M76_r4_0c000__1913);
  uVar1 = FUN_M76_r4_0c000__1a03();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1a88_M76_r4_0c000__1a14);
  uVar1 = FUN_M76_r4_0c000__1b04();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1b89_M76_r4_0c000__1b15);
  uVar1 = FUN_M76_r4_0c000__1c05();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1c8a_M76_r4_0c000__1c16);
  uVar1 = FUN_M76_r4_0c000__1d06();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1d8b_M76_r4_0c000__1d17);
  uVar1 = FUN_M76_r4_0c000__1e07();
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M76_r4_0c000__1e8c_M76_r4_0c000__1e18);
  FUN_M76_r4_0c000__1f08();
  FUN_M76_r4_0c000__1172();
  FUN_M76_r4_0c000__1204();
  FUN_M76_r4_0c000__1296();
  FUN_M76_r4_0c000__1328();
  FUN_M76_r4_0c000__0fa7();
  MODULE_7A_02_entry();
  return in_D;
}


// ===== FUN_M76_r4_0c000__039c @ M76_r4_0c000::039c =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M76_r4_0c000__039c(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 " pitch  " 21 $0ACE $0ADA */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " offset " 25 $0B63 $0B6F */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "  gate  " 29 $0F03 $0F0F */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 " decay  " 2D $0C29 $0C35 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "release " 31 $0D4A $0D56 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "high amt" 35 $1145 $1151 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "band amt" 39 $11D7 $11E3 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 " low amt" 3D $1269 $1275 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 " in amt " 41 $12FB $1307 */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 "fil freq" 45 $1021 $102D */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "filter q" 49 $10B3 $10BF */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 " bright " 4D $0CBB $0CC7 */
  DefineParameter();
                    /* inline[API_FD84]: 0C 80 " sustain" 51 $0DDC $0DE8 */
  DefineParameter();
                    /* inline[API_FD84]: 0D 80 "  hold  " 55 $0E74 $0E80 */
  DefineParameter();
                    /* inline[API_FD84]: 0E 80 "  mix   " 59 $1F6F $1F7B */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M76_r4_0c000__04d7;
  _DAT_60f7 = 0x2d;
  DAT_6105 = 1;
  DAT_6106 = 0xc3;
  return in_D;
}


// ===== FUN_M76_r4_0c000__0531 @ M76_r4_0c000::0531 =====

void __h3000 FUN_M76_r4_0c000__0531(void)

{
  FUN_M76_r4_0c000__0aaa();
  FUN_M76_r4_0c000__0751();
  API_FE10();
  return;
}


// ===== FUN_M76_r4_0c000__053c @ M76_r4_0c000::053c =====

void __h3000 FUN_M76_r4_0c000__053c(void)

{
  FUN_M76_r4_0c000__0c05();
  FUN_M76_r4_0c000__0751();
  API_FE12();
  return;
}


// ===== FUN_M76_r4_0c000__0547 @ M76_r4_0c000::0547 =====

void __h3000 FUN_M76_r4_0c000__0547(void)

{
  FUN_M76_r4_0c000__0d26();
  FUN_M76_r4_0c000__0751();
  API_FE14();
  return;
}


// ===== FUN_M76_r4_0c000__0552 @ M76_r4_0c000::0552 =====

void __h3000 FUN_M76_r4_0c000__0552(void)

{
  FUN_M76_r4_0c000__0db8();
  FUN_M76_r4_0c000__0751();
  API_FE16();
  return;
}


// ===== FUN_M76_r4_0c000__055d @ M76_r4_0c000::055d =====

void __h3000 FUN_M76_r4_0c000__055d(void)

{
  FUN_M76_r4_0c000__0edf();
  FUN_M76_r4_0c000__078a();
  API_FE10();
  return;
}


// ===== FUN_M76_r4_0c000__0568 @ M76_r4_0c000::0568 =====

void __h3000 FUN_M76_r4_0c000__0568(void)

{
  FUN_M76_r4_0c000__0f6e();
  FUN_M76_r4_0c000__078a();
  API_FE12();
  return;
}


// ===== FUN_M76_r4_0c000__0573 @ M76_r4_0c000::0573 =====

void __h3000 FUN_M76_r4_0c000__0573(void)

{
  FUN_M76_r4_0c000__0e50();
  FUN_M76_r4_0c000__078a();
  API_FE14();
  return;
}


// ===== FUN_M76_r4_0c000__057e @ M76_r4_0c000::057e =====

void __h3000 FUN_M76_r4_0c000__057e(void)

{
  FUN_M76_r4_0c000__0b3f();
  FUN_M76_r4_0c000__078a();
  API_FE16();
  return;
}


// ===== FUN_M76_r4_0c000__0589 @ M76_r4_0c000::0589 =====

void __h3000 FUN_M76_r4_0c000__0589(void)

{
  FUN_M76_r4_0c000__0ffd();
  FUN_M76_r4_0c000__07c3();
  API_FE10();
  return;
}


// ===== FUN_M76_r4_0c000__0594 @ M76_r4_0c000::0594 =====

void __h3000 FUN_M76_r4_0c000__0594(void)

{
  FUN_M76_r4_0c000__108f();
  FUN_M76_r4_0c000__07c3();
  API_FE12();
  return;
}


// ===== FUN_M76_r4_0c000__059f @ M76_r4_0c000::059f =====

void __h3000 FUN_M76_r4_0c000__059f(void)

{
  FUN_M76_r4_0c000__0c97();
  FUN_M76_r4_0c000__07c3();
  API_FE16();
  return;
}


// ===== FUN_M76_r4_0c000__05aa @ M76_r4_0c000::05aa =====

void __h3000 FUN_M76_r4_0c000__05aa(void)

{
  FUN_M76_r4_0c000__1121();
  FUN_M76_r4_0c000__07f5();
  API_FE10();
  return;
}


// ===== FUN_M76_r4_0c000__05b5 @ M76_r4_0c000::05b5 =====

void __h3000 FUN_M76_r4_0c000__05b5(void)

{
  FUN_M76_r4_0c000__11b3();
  FUN_M76_r4_0c000__07f5();
  API_FE12();
  return;
}


// ===== FUN_M76_r4_0c000__05c0 @ M76_r4_0c000::05c0 =====

void __h3000 FUN_M76_r4_0c000__05c0(void)

{
  FUN_M76_r4_0c000__1245();
  FUN_M76_r4_0c000__07f5();
  API_FE14();
  return;
}


// ===== FUN_M76_r4_0c000__05cb @ M76_r4_0c000::05cb =====

void __h3000 FUN_M76_r4_0c000__05cb(void)

{
  FUN_M76_r4_0c000__12d7();
  FUN_M76_r4_0c000__07f5();
  API_FE16();
  return;
}


// ===== FUN_M76_r4_0c000__05d6 @ M76_r4_0c000::05d6 =====

void __h3000 FUN_M76_r4_0c000__05d6(void)

{
  FUN_M76_r4_0c000__1369();
  FUN_M76_r4_0c000__082e();
  API_FE10();
  return;
}


// ===== FUN_M76_r4_0c000__05e1 @ M76_r4_0c000::05e1 =====

void __h3000 FUN_M76_r4_0c000__05e1(void)

{
  FUN_M76_r4_0c000__13e3();
  FUN_M76_r4_0c000__082e();
  API_FE12();
  return;
}


// ===== FUN_M76_r4_0c000__05ec @ M76_r4_0c000::05ec =====

void __h3000 FUN_M76_r4_0c000__05ec(void)

{
  FUN_M76_r4_0c000__145d();
  FUN_M76_r4_0c000__082e();
  API_FE14();
  return;
}


// ===== FUN_M76_r4_0c000__0751 @ M76_r4_0c000::0751 =====

void __h3000 FUN_M76_r4_0c000__0751(void)

{
                    /* inline[API_FE02]: " pitch  " " decay  " "release " "sustain " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A9E ->$0BF9 ->$0D1A ->$0DAC ->$078A ->$0860 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__078a @ M76_r4_0c000::078a =====

void __h3000 FUN_M76_r4_0c000__078a(void)

{
                    /* inline[API_FE02]: "  gate  " "gatemode" "  hold  " " offset " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ED3 ->$0F62 ->$0E44 ->$0B33 ->$07C3 ->$0751 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__07c3 @ M76_r4_0c000::07c3 =====

void __h3000 FUN_M76_r4_0c000__07c3(void)

{
                    /* inline[API_FE02]: "fil freq" "filter q" [*] " bright " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0FF1 ->$1083 ->$0A77 ->$0C8B ->$07F5 ->$078A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__07f5 @ M76_r4_0c000::07f5 =====

void __h3000 FUN_M76_r4_0c000__07f5(void)

{
                    /* inline[API_FE02]: "high amt" "band amt" "low amt " " in amt " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1115 ->$11A7 ->$1239 ->$12CB ->$082E ->$07C3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__082e @ M76_r4_0c000::082e =====

void __h3000 FUN_M76_r4_0c000__082e(void)

{
                    /* inline[API_FE02]: " chorus " " speed  " " depth  " [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$135D ->$13D7 ->$1451 ->$0A77 ->$0860 ->$07F5 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0860 @ M76_r4_0c000::0860 =====

void __h3000 FUN_M76_r4_0c000__0860(void)

{
                    /* inline[API_FE02]: " levels " "  mix   " [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A13 ->$1F3F ->$0A77 ->$08CB ->$0751 ->$082E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0892 @ M76_r4_0c000::0892 =====

void __h3000 FUN_M76_r4_0c000__0892(void)

{
                    /* inline[API_FE02]: "decay KS" "gate  KS" "level KS" "brightKS" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1741 ->$16C3 ->$183D ->$17BF ->$0904 ->$08CB */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__08cb @ M76_r4_0c000::08cb =====

void __h3000 FUN_M76_r4_0c000__08cb(void)

{
                    /* inline[API_FE02]: "decay VS" "gate  VS" "level VS" "brightVS" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1549 ->$14CB ->$1645 ->$15C7 ->$0892 ->$0904 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0904 @ M76_r4_0c000::0904 =====

void __h3000 FUN_M76_r4_0c000__0904(void)

{
                    /* inline[API_FE02]: "rel KS  " " notes  " "starts  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$18BB ->$093D ->$09A8 ->$0860 ->$08CB ->$0892 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__093d @ M76_r4_0c000::093d =====

void __h3000 FUN_M76_r4_0c000__093d(void)

{
                    /* inline[API_FE02]: " note 1 " " note 2 " " note 3 " " note 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1939 ->$1A3A ->$1B3B ->$1C3C ->$0976 ->$0976 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0976 @ M76_r4_0c000::0976 =====

void __h3000 FUN_M76_r4_0c000__0976(void)

{
                    /* inline[API_FE02]: " note 5 " " note 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D3D ->$1E3E ->$0A77 ->$0904 ->$093D ->$093D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__09a8 @ M76_r4_0c000::09a8 =====

void __h3000 FUN_M76_r4_0c000__09a8(void)

{
                    /* inline[API_FE02]: "start 1 " "start 2 " "start 3 " "start 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$19BE ->$1ABF ->$1BC0 ->$1CC1 ->$09E1 ->$09E1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__09e1 @ M76_r4_0c000::09e1 =====

void __h3000 FUN_M76_r4_0c000__09e1(void)

{
                    /* inline[API_FE02]: "start 5 " "start 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1DC2 ->$1EC3 ->$0A77 ->$0904 ->$09A8 ->$09A8 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0a13 @ M76_r4_0c000::0a13 =====

void __h3000 FUN_M76_r4_0c000__0a13(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FF1 ->$206C ->$0A77 ->$0860 ->$0A45 ->$0A45 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0a45 @ M76_r4_0c000::0a45 =====

void __h3000 FUN_M76_r4_0c000__0a45(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$20E7 ->$2162 ->$0A77 ->$0860 ->$0A13 ->$0A13 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M76_r4_0c000__0a77 @ M76_r4_0c000::0a77 =====

void __h3000 FUN_M76_r4_0c000__0a77(void)

{
  return;
}


// ===== FUN_M76_r4_0c000__0a9e @ M76_r4_0c000::0a9e =====

void __h3000 FUN_M76_r4_0c000__0a9e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0AFB ->$0AC2 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  return;
}


// ===== FUN_M76_r4_0c000__0aaa @ M76_r4_0c000::0aaa =====

void __h3000 FUN_M76_r4_0c000__0aaa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0AFB ->$0AC2 */
                    /* inline[API_FDBC]: "5.94...x" */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  return;
}


// ===== FUN_M76_r4_0c000__0ab6 @ M76_r4_0c000::0ab6 =====

void __h3000 FUN_M76_r4_0c000__0ab6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0AFB ->$0AC2 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  return;
}


// ===== FUN_M76_r4_0c000__0ac2 @ M76_r4_0c000::0ac2 =====

void __h3000 FUN_M76_r4_0c000__0ac2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0AFB ->$0AC2 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  return;
}


// ===== FUN_M76_r4_0c000__0ace @ M76_r4_0c000::0ace =====

void __h3000 FUN_M76_r4_0c000__0ace(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0AFB ->$0AC2 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  return;
}


// ===== FUN_M76_r4_0c000__0ada @ M76_r4_0c000::0ada =====

void __h3000 FUN_M76_r4_0c000__0ada(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0AFB ->$0AC2 $0AB6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  return;
}


// ===== FUN_M76_r4_0c000__0afb @ M76_r4_0c000::0afb =====

undefined2 __h3000 FUN_M76_r4_0c000__0afb(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78);
  FUN_M76_r4_0c000__0b9f();
  FUN_M76_r4_0c000__24d5();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0b33 @ M76_r4_0c000::0b33 =====

void __h3000 FUN_M76_r4_0c000__0b33(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0B90 ->$0B57 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  return;
}


// ===== FUN_M76_r4_0c000__0b3f @ M76_r4_0c000::0b3f =====

void __h3000 FUN_M76_r4_0c000__0b3f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0B90 ->$0B57 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  return;
}


// ===== FUN_M76_r4_0c000__0b4b @ M76_r4_0c000::0b4b =====

void __h3000 FUN_M76_r4_0c000__0b4b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0B90 ->$0B57 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  return;
}


// ===== FUN_M76_r4_0c000__0b57 @ M76_r4_0c000::0b57 =====

void __h3000 FUN_M76_r4_0c000__0b57(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0B90 ->$0B57 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  return;
}


// ===== FUN_M76_r4_0c000__0b63 @ M76_r4_0c000::0b63 =====

void __h3000 FUN_M76_r4_0c000__0b63(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0B90 ->$0B57 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  return;
}


// ===== FUN_M76_r4_0c000__0b6f @ M76_r4_0c000::0b6f =====

void __h3000 FUN_M76_r4_0c000__0b6f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0B90 ->$0B57 $0B4B */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  return;
}


// ===== FUN_M76_r4_0c000__0b90 @ M76_r4_0c000::0b90 =====

undefined2 __h3000 FUN_M76_r4_0c000__0b90(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d);
  FUN_M76_r4_0c000__0b9f();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0b9f @ M76_r4_0c000::0b9f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0bd1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__0b9f(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  ushort uVar1;
  char cVar2;
  short *psVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_70ec + DAT_70f2;
  if (uVar1 < 10000 == (uVar1 == 10000)) {
    uVar1 = 10000;
  }
  if (0x7fff < uVar1) {
    uVar1 = 0xd8f0;
  }
  DAT_717c = uVar1;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)(uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0xad;
  psVar3 = (short *)(param_3 + -4);
  *(undefined1 *)psVar3 = 0x47;
  API_FCF2();
  cVar2 = (byte)DAT_717c << 1;
  DAT_70ee = CONCAT11((char)(DAT_717c >> 8) << 1 | (byte)DAT_717c >> 7,cVar2) + *psVar3;
                    /* WARNING: Could not recover jumptable at 0x0bd1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar2,param_1,param_2,psVar3 + 1);
  return;
}


// ===== FUN_M76_r4_0c000__0bf9 @ M76_r4_0c000::0bf9 =====

void __h3000 FUN_M76_r4_0c000__0bf9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0C56 ->$0C1D */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  return;
}


// ===== FUN_M76_r4_0c000__0c05 @ M76_r4_0c000::0c05 =====

void __h3000 FUN_M76_r4_0c000__0c05(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0C56 ->$0C1D */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  return;
}


// ===== FUN_M76_r4_0c000__0c11 @ M76_r4_0c000::0c11 =====

void __h3000 FUN_M76_r4_0c000__0c11(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0C56 ->$0C1D */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  return;
}


// ===== FUN_M76_r4_0c000__0c1d @ M76_r4_0c000::0c1d =====

void __h3000 FUN_M76_r4_0c000__0c1d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0C56 ->$0C1D */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  return;
}


// ===== FUN_M76_r4_0c000__0c29 @ M76_r4_0c000::0c29 =====

void __h3000 FUN_M76_r4_0c000__0c29(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0C56 ->$0C1D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  return;
}


// ===== FUN_M76_r4_0c000__0c35 @ M76_r4_0c000::0c35 =====

void __h3000 FUN_M76_r4_0c000__0c35(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0C56 ->$0C1D $0C11 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  return;
}


// ===== FUN_M76_r4_0c000__0c56 @ M76_r4_0c000::0c56 =====

undefined2 __h3000 FUN_M76_r4_0c000__0c56(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3);
  FUN_M76_r4_0c000__24c4();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0c8b @ M76_r4_0c000::0c8b =====

void __h3000 FUN_M76_r4_0c000__0c8b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0CE8 ->$0CAF */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return;
}


// ===== FUN_M76_r4_0c000__0c97 @ M76_r4_0c000::0c97 =====

void __h3000 FUN_M76_r4_0c000__0c97(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0CE8 ->$0CAF */
                    /* inline[API_FDBC]: "5.94...e" */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return;
}


// ===== FUN_M76_r4_0c000__0ca3 @ M76_r4_0c000::0ca3 =====

void __h3000 FUN_M76_r4_0c000__0ca3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0CE8 ->$0CAF */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return;
}


// ===== FUN_M76_r4_0c000__0caf @ M76_r4_0c000::0caf =====

void __h3000 FUN_M76_r4_0c000__0caf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0CE8 ->$0CAF */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return;
}


// ===== FUN_M76_r4_0c000__0cbb @ M76_r4_0c000::0cbb =====

void __h3000 FUN_M76_r4_0c000__0cbb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0CE8 ->$0CAF */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return;
}


// ===== FUN_M76_r4_0c000__0cc7 @ M76_r4_0c000::0cc7 =====

void __h3000 FUN_M76_r4_0c000__0cc7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0CE8 ->$0CAF $0CA3 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return;
}


// ===== FUN_M76_r4_0c000__0ce8 @ M76_r4_0c000::0ce8 =====

undefined2 __h3000 FUN_M76_r4_0c000__0ce8(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0d1a @ M76_r4_0c000::0d1a =====

void __h3000 FUN_M76_r4_0c000__0d1a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0D77 ->$0D3E */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  return;
}


// ===== FUN_M76_r4_0c000__0d26 @ M76_r4_0c000::0d26 =====

void __h3000 FUN_M76_r4_0c000__0d26(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0D77 ->$0D3E */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  return;
}


// ===== FUN_M76_r4_0c000__0d32 @ M76_r4_0c000::0d32 =====

void __h3000 FUN_M76_r4_0c000__0d32(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0D77 ->$0D3E */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  return;
}


// ===== FUN_M76_r4_0c000__0d3e @ M76_r4_0c000::0d3e =====

void __h3000 FUN_M76_r4_0c000__0d3e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0D77 ->$0D3E */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  return;
}


// ===== FUN_M76_r4_0c000__0d4a @ M76_r4_0c000::0d4a =====

void __h3000 FUN_M76_r4_0c000__0d4a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0D77 ->$0D3E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  return;
}


// ===== FUN_M76_r4_0c000__0d56 @ M76_r4_0c000::0d56 =====

void __h3000 FUN_M76_r4_0c000__0d56(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0D77 ->$0D3E $0D32 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  return;
}


// ===== FUN_M76_r4_0c000__0d77 @ M76_r4_0c000::0d77 =====

undefined2 __h3000 FUN_M76_r4_0c000__0d77(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4);
  FUN_M76_r4_0c000__24c4();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0dac @ M76_r4_0c000::0dac =====

void __h3000 FUN_M76_r4_0c000__0dac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0E09 ->$0DD0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  return;
}


// ===== FUN_M76_r4_0c000__0db8 @ M76_r4_0c000::0db8 =====

void __h3000 FUN_M76_r4_0c000__0db8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0E09 ->$0DD0 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  return;
}


// ===== FUN_M76_r4_0c000__0dc4 @ M76_r4_0c000::0dc4 =====

void __h3000 FUN_M76_r4_0c000__0dc4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0E09 ->$0DD0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  return;
}


// ===== FUN_M76_r4_0c000__0dd0 @ M76_r4_0c000::0dd0 =====

void __h3000 FUN_M76_r4_0c000__0dd0(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  return;
}


// ===== FUN_M76_r4_0c000__0ddc @ M76_r4_0c000::0ddc =====

void __h3000 FUN_M76_r4_0c000__0ddc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0E09 ->$0DD0 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  return;
}


// ===== FUN_M76_r4_0c000__0de8 @ M76_r4_0c000::0de8 =====

void __h3000 FUN_M76_r4_0c000__0de8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0E09 ->$0DD0 $0DC4 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  return;
}


// ===== FUN_M76_r4_0c000__0e09 @ M76_r4_0c000::0e09 =====

undefined2 __h3000 FUN_M76_r4_0c000__0e09(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86);
  FUN_M76_r4_0c000__249c();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0e44 @ M76_r4_0c000::0e44 =====

void __h3000 FUN_M76_r4_0c000__0e44(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0EA1 ->$0E68 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return;
}


// ===== FUN_M76_r4_0c000__0e50 @ M76_r4_0c000::0e50 =====

void __h3000 FUN_M76_r4_0c000__0e50(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0EA1 ->$0E68 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return;
}


// ===== FUN_M76_r4_0c000__0e5c @ M76_r4_0c000::0e5c =====

void __h3000 FUN_M76_r4_0c000__0e5c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0EA1 ->$0E68 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return;
}


// ===== FUN_M76_r4_0c000__0e68 @ M76_r4_0c000::0e68 =====

void __h3000 FUN_M76_r4_0c000__0e68(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return;
}


// ===== FUN_M76_r4_0c000__0e74 @ M76_r4_0c000::0e74 =====

void __h3000 FUN_M76_r4_0c000__0e74(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0EA1 ->$0E68 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return;
}


// ===== FUN_M76_r4_0c000__0e80 @ M76_r4_0c000::0e80 =====

void __h3000 FUN_M76_r4_0c000__0e80(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0EA1 ->$0E68 $0E5C */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return;
}


// ===== FUN_M76_r4_0c000__0ea1 @ M76_r4_0c000::0ea1 =====

undefined2 __h3000 FUN_M76_r4_0c000__0ea1(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0ed3 @ M76_r4_0c000::0ed3 =====

void __h3000 FUN_M76_r4_0c000__0ed3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F30 ->$0EF7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return;
}


// ===== FUN_M76_r4_0c000__0edf @ M76_r4_0c000::0edf =====

void __h3000 FUN_M76_r4_0c000__0edf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F30 ->$0EF7 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return;
}


// ===== FUN_M76_r4_0c000__0eeb @ M76_r4_0c000::0eeb =====

void __h3000 FUN_M76_r4_0c000__0eeb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F30 ->$0EF7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return;
}


// ===== FUN_M76_r4_0c000__0ef7 @ M76_r4_0c000::0ef7 =====

void __h3000 FUN_M76_r4_0c000__0ef7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0F30 ->$0EF7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return;
}


// ===== FUN_M76_r4_0c000__0f03 @ M76_r4_0c000::0f03 =====

void __h3000 FUN_M76_r4_0c000__0f03(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F30 ->$0EF7 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return;
}


// ===== FUN_M76_r4_0c000__0f0f @ M76_r4_0c000::0f0f =====

void __h3000 FUN_M76_r4_0c000__0f0f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F30 ->$0EF7 $0EEB */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return;
}


// ===== FUN_M76_r4_0c000__0f30 @ M76_r4_0c000::0f30 =====

undefined2 __h3000 FUN_M76_r4_0c000__0f30(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0f62 @ M76_r4_0c000::0f62 =====

void __h3000 FUN_M76_r4_0c000__0f62(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M76_r4_0c000__0f3c);
  return;
}


// ===== FUN_M76_r4_0c000__0f6e @ M76_r4_0c000::0f6e =====

void __h3000 FUN_M76_r4_0c000__0f6e(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M76_r4_0c000__0f3c);
  return;
}


// ===== FUN_M76_r4_0c000__0f7a @ M76_r4_0c000::0f7a =====

void __h3000 FUN_M76_r4_0c000__0f7a(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M76_r4_0c000__0f3c);
  return;
}


// ===== FUN_M76_r4_0c000__0f86 @ M76_r4_0c000::0f86 =====

void __h3000 FUN_M76_r4_0c000__0f86(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M76_r4_0c000__0f3c);
  return;
}


// ===== FUN_M76_r4_0c000__0fa7 @ M76_r4_0c000::0fa7 =====

undefined2 __h3000 FUN_M76_r4_0c000__0fa7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,PTR_ARRAY_M76_r4_0c000__0f3c);
  FUN_M76_r4_0c000__2762();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__0ff1 @ M76_r4_0c000::0ff1 =====

void __h3000 FUN_M76_r4_0c000__0ff1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$104E ->$1015 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  return;
}


// ===== FUN_M76_r4_0c000__0ffd @ M76_r4_0c000::0ffd =====

void __h3000 FUN_M76_r4_0c000__0ffd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$104E ->$1015 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  return;
}


// ===== FUN_M76_r4_0c000__1009 @ M76_r4_0c000::1009 =====

void __h3000 FUN_M76_r4_0c000__1009(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$104E ->$1015 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  return;
}


// ===== FUN_M76_r4_0c000__1015 @ M76_r4_0c000::1015 =====

void __h3000 FUN_M76_r4_0c000__1015(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$104E ->$1015 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  return;
}


// ===== FUN_M76_r4_0c000__1021 @ M76_r4_0c000::1021 =====

void __h3000 FUN_M76_r4_0c000__1021(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$104E ->$1015 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  return;
}


// ===== FUN_M76_r4_0c000__102d @ M76_r4_0c000::102d =====

void __h3000 FUN_M76_r4_0c000__102d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$104E ->$1015 $1009 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  return;
}


// ===== FUN_M76_r4_0c000__104e @ M76_r4_0c000::104e =====

undefined2 __h3000 FUN_M76_r4_0c000__104e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb);
  FUN_M76_r4_0c000__272e();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1083 @ M76_r4_0c000::1083 =====

void __h3000 FUN_M76_r4_0c000__1083(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$10E0 ->$10A7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  return;
}


// ===== FUN_M76_r4_0c000__108f @ M76_r4_0c000::108f =====

void __h3000 FUN_M76_r4_0c000__108f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$10E0 ->$10A7 */
                    /* inline[API_FDBC]: "5.94...]" */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  return;
}


// ===== FUN_M76_r4_0c000__109b @ M76_r4_0c000::109b =====

void __h3000 FUN_M76_r4_0c000__109b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$10E0 ->$10A7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  return;
}


// ===== FUN_M76_r4_0c000__10a7 @ M76_r4_0c000::10a7 =====

void __h3000 FUN_M76_r4_0c000__10a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$10E0 ->$10A7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  return;
}


// ===== FUN_M76_r4_0c000__10b3 @ M76_r4_0c000::10b3 =====

void __h3000 FUN_M76_r4_0c000__10b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$10E0 ->$10A7 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  return;
}


// ===== FUN_M76_r4_0c000__10bf @ M76_r4_0c000::10bf =====

void __h3000 FUN_M76_r4_0c000__10bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$10E0 ->$10A7 $109B */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  return;
}


// ===== FUN_M76_r4_0c000__10e0 @ M76_r4_0c000::10e0 =====

undefined2 __h3000 FUN_M76_r4_0c000__10e0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d);
  FUN_M76_r4_0c000__2747();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1115 @ M76_r4_0c000::1115 =====

void __h3000 FUN_M76_r4_0c000__1115(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1172 ->$1139 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  return;
}


// ===== FUN_M76_r4_0c000__1121 @ M76_r4_0c000::1121 =====

void __h3000 FUN_M76_r4_0c000__1121(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1172 ->$1139 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  return;
}


// ===== FUN_M76_r4_0c000__112d @ M76_r4_0c000::112d =====

void __h3000 FUN_M76_r4_0c000__112d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1172 ->$1139 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  return;
}


// ===== FUN_M76_r4_0c000__1139 @ M76_r4_0c000::1139 =====

void __h3000 FUN_M76_r4_0c000__1139(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1172 ->$1139 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  return;
}


// ===== FUN_M76_r4_0c000__1145 @ M76_r4_0c000::1145 =====

void __h3000 FUN_M76_r4_0c000__1145(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1172 ->$1139 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  return;
}


// ===== FUN_M76_r4_0c000__1151 @ M76_r4_0c000::1151 =====

void __h3000 FUN_M76_r4_0c000__1151(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1172 ->$1139 $112D */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  return;
}


// ===== FUN_M76_r4_0c000__1172 @ M76_r4_0c000::1172 =====

undefined2 __h3000 FUN_M76_r4_0c000__1172(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef);
  FUN_M76_r4_0c000__2787();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__11a7 @ M76_r4_0c000::11a7 =====

void __h3000 FUN_M76_r4_0c000__11a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1204 ->$11CB */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  return;
}


// ===== FUN_M76_r4_0c000__11b3 @ M76_r4_0c000::11b3 =====

void __h3000 FUN_M76_r4_0c000__11b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1204 ->$11CB */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  return;
}


// ===== FUN_M76_r4_0c000__11bf @ M76_r4_0c000::11bf =====

void __h3000 FUN_M76_r4_0c000__11bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1204 ->$11CB */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  return;
}


// ===== FUN_M76_r4_0c000__11cb @ M76_r4_0c000::11cb =====

void __h3000 FUN_M76_r4_0c000__11cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1204 ->$11CB */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  return;
}


// ===== FUN_M76_r4_0c000__11d7 @ M76_r4_0c000::11d7 =====

void __h3000 FUN_M76_r4_0c000__11d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1204 ->$11CB */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  return;
}


// ===== FUN_M76_r4_0c000__11e3 @ M76_r4_0c000::11e3 =====

void __h3000 FUN_M76_r4_0c000__11e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1204 ->$11CB $11BF */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  return;
}


// ===== FUN_M76_r4_0c000__1204 @ M76_r4_0c000::1204 =====

undefined2 __h3000 FUN_M76_r4_0c000__1204(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181);
  FUN_M76_r4_0c000__27a4();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1239 @ M76_r4_0c000::1239 =====

void __h3000 FUN_M76_r4_0c000__1239(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1296 ->$125D */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  return;
}


// ===== FUN_M76_r4_0c000__1245 @ M76_r4_0c000::1245 =====

void __h3000 FUN_M76_r4_0c000__1245(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1296 ->$125D */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  return;
}


// ===== FUN_M76_r4_0c000__1251 @ M76_r4_0c000::1251 =====

void __h3000 FUN_M76_r4_0c000__1251(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1296 ->$125D */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  return;
}


// ===== FUN_M76_r4_0c000__125d @ M76_r4_0c000::125d =====

void __h3000 FUN_M76_r4_0c000__125d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1296 ->$125D */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  return;
}


// ===== FUN_M76_r4_0c000__1269 @ M76_r4_0c000::1269 =====

void __h3000 FUN_M76_r4_0c000__1269(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1296 ->$125D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  return;
}


// ===== FUN_M76_r4_0c000__1275 @ M76_r4_0c000::1275 =====

void __h3000 FUN_M76_r4_0c000__1275(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1296 ->$125D $1251 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  return;
}


// ===== FUN_M76_r4_0c000__1296 @ M76_r4_0c000::1296 =====

undefined2 __h3000 FUN_M76_r4_0c000__1296(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213);
  FUN_M76_r4_0c000__27c1();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__12cb @ M76_r4_0c000::12cb =====

void __h3000 FUN_M76_r4_0c000__12cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1328 ->$12EF */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  return;
}


// ===== FUN_M76_r4_0c000__12d7 @ M76_r4_0c000::12d7 =====

void __h3000 FUN_M76_r4_0c000__12d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1328 ->$12EF */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  return;
}


// ===== FUN_M76_r4_0c000__12e3 @ M76_r4_0c000::12e3 =====

void __h3000 FUN_M76_r4_0c000__12e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1328 ->$12EF */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  return;
}


// ===== FUN_M76_r4_0c000__12ef @ M76_r4_0c000::12ef =====

void __h3000 FUN_M76_r4_0c000__12ef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1328 ->$12EF */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  return;
}


// ===== FUN_M76_r4_0c000__12fb @ M76_r4_0c000::12fb =====

void __h3000 FUN_M76_r4_0c000__12fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1328 ->$12EF */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  return;
}


// ===== FUN_M76_r4_0c000__1307 @ M76_r4_0c000::1307 =====

void __h3000 FUN_M76_r4_0c000__1307(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1328 ->$12EF $12E3 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  return;
}


// ===== FUN_M76_r4_0c000__1328 @ M76_r4_0c000::1328 =====

undefined2 __h3000 FUN_M76_r4_0c000__1328(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5);
  FUN_M76_r4_0c000__27de();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__135d @ M76_r4_0c000::135d =====

void __h3000 FUN_M76_r4_0c000__135d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$13A2 ->$1381 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337);
  return;
}


// ===== FUN_M76_r4_0c000__1369 @ M76_r4_0c000::1369 =====

void __h3000 FUN_M76_r4_0c000__1369(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$13A2 ->$1381 */
                    /* inline[API_FDBC]: "5.94...7" */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337);
  return;
}


// ===== FUN_M76_r4_0c000__1375 @ M76_r4_0c000::1375 =====

void __h3000 FUN_M76_r4_0c000__1375(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$13A2 ->$1381 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337);
  return;
}


// ===== FUN_M76_r4_0c000__1381 @ M76_r4_0c000::1381 =====

void __h3000 FUN_M76_r4_0c000__1381(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$13A2 ->$1381 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337);
  return;
}


// ===== FUN_M76_r4_0c000__13a2 @ M76_r4_0c000::13a2 =====

undefined2 __h3000 FUN_M76_r4_0c000__13a2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337);
  FUN_M76_r4_0c000__27fd();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__13d7 @ M76_r4_0c000::13d7 =====

void __h3000 FUN_M76_r4_0c000__13d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$141C ->$13FB */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__141c_M76_r4_0c000__13b1);
  return;
}


// ===== FUN_M76_r4_0c000__13e3 @ M76_r4_0c000::13e3 =====

void __h3000 FUN_M76_r4_0c000__13e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$141C ->$13FB */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__141c_M76_r4_0c000__13b1);
  return;
}


// ===== FUN_M76_r4_0c000__13ef @ M76_r4_0c000::13ef =====

void __h3000 FUN_M76_r4_0c000__13ef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$141C ->$13FB */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__141c_M76_r4_0c000__13b1);
  return;
}


// ===== FUN_M76_r4_0c000__13fb @ M76_r4_0c000::13fb =====

void __h3000 FUN_M76_r4_0c000__13fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$141C ->$13FB */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__141c_M76_r4_0c000__13b1);
  return;
}


// ===== FUN_M76_r4_0c000__141c @ M76_r4_0c000::141c =====

undefined2 __h3000 FUN_M76_r4_0c000__141c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__141c_M76_r4_0c000__13b1);
  FUN_M76_r4_0c000__27fd();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1451 @ M76_r4_0c000::1451 =====

void __h3000 FUN_M76_r4_0c000__1451(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1496 ->$1475 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b);
  return;
}


// ===== FUN_M76_r4_0c000__145d @ M76_r4_0c000::145d =====

void __h3000 FUN_M76_r4_0c000__145d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1496 ->$1475 */
                    /* inline[API_FDBC]: "5.94...+" */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b);
  return;
}


// ===== FUN_M76_r4_0c000__1469 @ M76_r4_0c000::1469 =====

void __h3000 FUN_M76_r4_0c000__1469(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1496 ->$1475 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b);
  return;
}


// ===== FUN_M76_r4_0c000__1475 @ M76_r4_0c000::1475 =====

void __h3000 FUN_M76_r4_0c000__1475(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1496 ->$1475 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b);
  return;
}


// ===== FUN_M76_r4_0c000__1496 @ M76_r4_0c000::1496 =====

undefined2 __h3000 FUN_M76_r4_0c000__1496(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b);
  FUN_M76_r4_0c000__27fd();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__14cb @ M76_r4_0c000::14cb =====

void __h3000 FUN_M76_r4_0c000__14cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1510 ->$14EF */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1510_M76_r4_0c000__14a5);
  return;
}


// ===== FUN_M76_r4_0c000__14d7 @ M76_r4_0c000::14d7 =====

void __h3000 FUN_M76_r4_0c000__14d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1510 ->$14EF */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1510_M76_r4_0c000__14a5);
  return;
}


// ===== FUN_M76_r4_0c000__14e3 @ M76_r4_0c000::14e3 =====

void __h3000 FUN_M76_r4_0c000__14e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1510 ->$14EF */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1510_M76_r4_0c000__14a5);
  return;
}


// ===== FUN_M76_r4_0c000__14ef @ M76_r4_0c000::14ef =====

void __h3000 FUN_M76_r4_0c000__14ef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1510 ->$14EF */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1510_M76_r4_0c000__14a5);
  return;
}


// ===== FUN_M76_r4_0c000__1510 @ M76_r4_0c000::1510 =====

undefined2 __h3000 FUN_M76_r4_0c000__1510(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1510_M76_r4_0c000__14a5);
  FUN_M76_r4_0c000__21f3();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1549 @ M76_r4_0c000::1549 =====

void __h3000 FUN_M76_r4_0c000__1549(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$158E ->$156D */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__158e_M76_r4_0c000__1523);
  return;
}


// ===== FUN_M76_r4_0c000__1555 @ M76_r4_0c000::1555 =====

void __h3000 FUN_M76_r4_0c000__1555(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$158E ->$156D */
                    /* inline[API_FDBC]: "5.94...#" */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__158e_M76_r4_0c000__1523);
  return;
}


// ===== FUN_M76_r4_0c000__1561 @ M76_r4_0c000::1561 =====

void __h3000 FUN_M76_r4_0c000__1561(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$158E ->$156D */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__158e_M76_r4_0c000__1523);
  return;
}


// ===== FUN_M76_r4_0c000__156d @ M76_r4_0c000::156d =====

void __h3000 FUN_M76_r4_0c000__156d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$158E ->$156D */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__158e_M76_r4_0c000__1523);
  return;
}


// ===== FUN_M76_r4_0c000__158e @ M76_r4_0c000::158e =====

undefined2 __h3000 FUN_M76_r4_0c000__158e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__158e_M76_r4_0c000__1523);
  FUN_M76_r4_0c000__21f3();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__15c7 @ M76_r4_0c000::15c7 =====

void __h3000 FUN_M76_r4_0c000__15c7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$160C ->$15EB */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__160c_M76_r4_0c000__15a1);
  return;
}


// ===== FUN_M76_r4_0c000__15d3 @ M76_r4_0c000::15d3 =====

void __h3000 FUN_M76_r4_0c000__15d3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$160C ->$15EB */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__160c_M76_r4_0c000__15a1);
  return;
}


// ===== FUN_M76_r4_0c000__15df @ M76_r4_0c000::15df =====

void __h3000 FUN_M76_r4_0c000__15df(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$160C ->$15EB */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__160c_M76_r4_0c000__15a1);
  return;
}


// ===== FUN_M76_r4_0c000__15eb @ M76_r4_0c000::15eb =====

void __h3000 FUN_M76_r4_0c000__15eb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$160C ->$15EB */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__160c_M76_r4_0c000__15a1);
  return;
}


// ===== FUN_M76_r4_0c000__160c @ M76_r4_0c000::160c =====

undefined2 __h3000 FUN_M76_r4_0c000__160c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__160c_M76_r4_0c000__15a1);
  FUN_M76_r4_0c000__21f3();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1645 @ M76_r4_0c000::1645 =====

void __h3000 FUN_M76_r4_0c000__1645(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$168A ->$1669 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__168a_M76_r4_0c000__161f);
  return;
}


// ===== FUN_M76_r4_0c000__1651 @ M76_r4_0c000::1651 =====

void __h3000 FUN_M76_r4_0c000__1651(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$168A ->$1669 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__168a_M76_r4_0c000__161f);
  return;
}


// ===== FUN_M76_r4_0c000__165d @ M76_r4_0c000::165d =====

void __h3000 FUN_M76_r4_0c000__165d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$168A ->$1669 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__168a_M76_r4_0c000__161f);
  return;
}


// ===== FUN_M76_r4_0c000__1669 @ M76_r4_0c000::1669 =====

void __h3000 FUN_M76_r4_0c000__1669(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$168A ->$1669 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__168a_M76_r4_0c000__161f);
  return;
}


// ===== FUN_M76_r4_0c000__168a @ M76_r4_0c000::168a =====

undefined2 __h3000 FUN_M76_r4_0c000__168a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__168a_M76_r4_0c000__161f);
  FUN_M76_r4_0c000__21f3();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__16c3 @ M76_r4_0c000::16c3 =====

void __h3000 FUN_M76_r4_0c000__16c3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1708 ->$16E7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1708_M76_r4_0c000__169d);
  return;
}


// ===== FUN_M76_r4_0c000__16cf @ M76_r4_0c000::16cf =====

void __h3000 FUN_M76_r4_0c000__16cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1708 ->$16E7 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1708_M76_r4_0c000__169d);
  return;
}


// ===== FUN_M76_r4_0c000__16db @ M76_r4_0c000::16db =====

void __h3000 FUN_M76_r4_0c000__16db(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1708 ->$16E7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1708_M76_r4_0c000__169d);
  return;
}


// ===== FUN_M76_r4_0c000__16e7 @ M76_r4_0c000::16e7 =====

void __h3000 FUN_M76_r4_0c000__16e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1708 ->$16E7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1708_M76_r4_0c000__169d);
  return;
}


// ===== FUN_M76_r4_0c000__1708 @ M76_r4_0c000::1708 =====

undefined2 __h3000 FUN_M76_r4_0c000__1708(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1708_M76_r4_0c000__169d);
  FUN_M76_r4_0c000__21db();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1741 @ M76_r4_0c000::1741 =====

void __h3000 FUN_M76_r4_0c000__1741(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1786 ->$1765 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1786_M76_r4_0c000__171b);
  return;
}


// ===== FUN_M76_r4_0c000__174d @ M76_r4_0c000::174d =====

void __h3000 FUN_M76_r4_0c000__174d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1786 ->$1765 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1786_M76_r4_0c000__171b);
  return;
}


// ===== FUN_M76_r4_0c000__1759 @ M76_r4_0c000::1759 =====

void __h3000 FUN_M76_r4_0c000__1759(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1786 ->$1765 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1786_M76_r4_0c000__171b);
  return;
}


// ===== FUN_M76_r4_0c000__1765 @ M76_r4_0c000::1765 =====

void __h3000 FUN_M76_r4_0c000__1765(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1786 ->$1765 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1786_M76_r4_0c000__171b);
  return;
}


// ===== FUN_M76_r4_0c000__1786 @ M76_r4_0c000::1786 =====

undefined2 __h3000 FUN_M76_r4_0c000__1786(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1786_M76_r4_0c000__171b);
  FUN_M76_r4_0c000__21db();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__17bf @ M76_r4_0c000::17bf =====

void __h3000 FUN_M76_r4_0c000__17bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1804 ->$17E3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1804_M76_r4_0c000__1799);
  return;
}


// ===== FUN_M76_r4_0c000__17cb @ M76_r4_0c000::17cb =====

void __h3000 FUN_M76_r4_0c000__17cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1804 ->$17E3 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1804_M76_r4_0c000__1799);
  return;
}


// ===== FUN_M76_r4_0c000__17d7 @ M76_r4_0c000::17d7 =====

void __h3000 FUN_M76_r4_0c000__17d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1804 ->$17E3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1804_M76_r4_0c000__1799);
  return;
}


// ===== FUN_M76_r4_0c000__17e3 @ M76_r4_0c000::17e3 =====

void __h3000 FUN_M76_r4_0c000__17e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1804 ->$17E3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1804_M76_r4_0c000__1799);
  return;
}


// ===== FUN_M76_r4_0c000__1804 @ M76_r4_0c000::1804 =====

undefined2 __h3000 FUN_M76_r4_0c000__1804(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1804_M76_r4_0c000__1799);
  FUN_M76_r4_0c000__21db();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__183d @ M76_r4_0c000::183d =====

void __h3000 FUN_M76_r4_0c000__183d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1882 ->$1861 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1882_M76_r4_0c000__1817);
  return;
}


// ===== FUN_M76_r4_0c000__1849 @ M76_r4_0c000::1849 =====

void __h3000 FUN_M76_r4_0c000__1849(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1882 ->$1861 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1882_M76_r4_0c000__1817);
  return;
}


// ===== FUN_M76_r4_0c000__1855 @ M76_r4_0c000::1855 =====

void __h3000 FUN_M76_r4_0c000__1855(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1882 ->$1861 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1882_M76_r4_0c000__1817);
  return;
}


// ===== FUN_M76_r4_0c000__1861 @ M76_r4_0c000::1861 =====

void __h3000 FUN_M76_r4_0c000__1861(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1882 ->$1861 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1882_M76_r4_0c000__1817);
  return;
}


// ===== FUN_M76_r4_0c000__1882 @ M76_r4_0c000::1882 =====

undefined2 __h3000 FUN_M76_r4_0c000__1882(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1882_M76_r4_0c000__1817);
  FUN_M76_r4_0c000__21db();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__18bb @ M76_r4_0c000::18bb =====

void __h3000 FUN_M76_r4_0c000__18bb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1900 ->$18DF */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1900_M76_r4_0c000__1895);
  return;
}


// ===== FUN_M76_r4_0c000__18c7 @ M76_r4_0c000::18c7 =====

void __h3000 FUN_M76_r4_0c000__18c7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1900 ->$18DF */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1900_M76_r4_0c000__1895);
  return;
}


// ===== FUN_M76_r4_0c000__18d3 @ M76_r4_0c000::18d3 =====

void __h3000 FUN_M76_r4_0c000__18d3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1900 ->$18DF */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1900_M76_r4_0c000__1895);
  return;
}


// ===== FUN_M76_r4_0c000__18df @ M76_r4_0c000::18df =====

void __h3000 FUN_M76_r4_0c000__18df(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1900 ->$18DF */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1900_M76_r4_0c000__1895);
  return;
}


// ===== FUN_M76_r4_0c000__1900 @ M76_r4_0c000::1900 =====

undefined2 __h3000 FUN_M76_r4_0c000__1900(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1900_M76_r4_0c000__1895);
  FUN_M76_r4_0c000__21db();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1939 @ M76_r4_0c000::1939 =====

void __h3000 FUN_M76_r4_0c000__1939(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1987_M76_r4_0c000__1913);
  return;
}


// ===== FUN_M76_r4_0c000__1945 @ M76_r4_0c000::1945 =====

void __h3000 FUN_M76_r4_0c000__1945(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1987 ->$1972 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1987_M76_r4_0c000__1913);
  return;
}


// ===== FUN_M76_r4_0c000__1951 @ M76_r4_0c000::1951 =====

void __h3000 FUN_M76_r4_0c000__1951(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1987_M76_r4_0c000__1913);
  return;
}


// ===== FUN_M76_r4_0c000__1972 @ M76_r4_0c000::1972 =====

void __h3000
FUN_M76_r4_0c000__1972(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A(param_1,(undefined1)DAT_714e);
                    /* inline[API_FC38]: "{2:24}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1985. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__1987 @ M76_r4_0c000::1987 =====

undefined2 __h3000 FUN_M76_r4_0c000__1987(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1987_M76_r4_0c000__1913);
  FUN_M76_r4_0c000__2479(extraout_A,0);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__19be @ M76_r4_0c000::19be =====

void __h3000 FUN_M76_r4_0c000__19be(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a03_M76_r4_0c000__1998);
  return;
}


// ===== FUN_M76_r4_0c000__19ca @ M76_r4_0c000::19ca =====

void __h3000 FUN_M76_r4_0c000__19ca(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1A03 ->$19E2 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a03_M76_r4_0c000__1998);
  return;
}


// ===== FUN_M76_r4_0c000__19d6 @ M76_r4_0c000::19d6 =====

void __h3000 FUN_M76_r4_0c000__19d6(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a03_M76_r4_0c000__1998);
  return;
}


// ===== FUN_M76_r4_0c000__19e2 @ M76_r4_0c000::19e2 =====

void __h3000 FUN_M76_r4_0c000__19e2(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a03_M76_r4_0c000__1998);
  return;
}


// ===== FUN_M76_r4_0c000__1a03 @ M76_r4_0c000::1a03 =====

undefined2 __h3000 FUN_M76_r4_0c000__1a03(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a03_M76_r4_0c000__1998);
  FUN_M76_r4_0c000__2479(extraout_A,0);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1a3a @ M76_r4_0c000::1a3a =====

void __h3000 FUN_M76_r4_0c000__1a3a(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a88_M76_r4_0c000__1a14);
  return;
}


// ===== FUN_M76_r4_0c000__1a46 @ M76_r4_0c000::1a46 =====

void __h3000 FUN_M76_r4_0c000__1a46(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1A88 ->$1A73 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a88_M76_r4_0c000__1a14);
  return;
}


// ===== FUN_M76_r4_0c000__1a52 @ M76_r4_0c000::1a52 =====

void __h3000 FUN_M76_r4_0c000__1a52(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a88_M76_r4_0c000__1a14);
  return;
}


// ===== FUN_M76_r4_0c000__1a73 @ M76_r4_0c000::1a73 =====

void __h3000
FUN_M76_r4_0c000__1a73(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A(param_1,(undefined1)DAT_7156);
                    /* inline[API_FC38]: "{2:24}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1a86. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__1a88 @ M76_r4_0c000::1a88 =====

undefined2 __h3000 FUN_M76_r4_0c000__1a88(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1a88_M76_r4_0c000__1a14);
  FUN_M76_r4_0c000__2479(extraout_A,1);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1abf @ M76_r4_0c000::1abf =====

void __h3000 FUN_M76_r4_0c000__1abf(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b04_M76_r4_0c000__1a99);
  return;
}


// ===== FUN_M76_r4_0c000__1acb @ M76_r4_0c000::1acb =====

void __h3000 FUN_M76_r4_0c000__1acb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1B04 ->$1AE3 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b04_M76_r4_0c000__1a99);
  return;
}


// ===== FUN_M76_r4_0c000__1ad7 @ M76_r4_0c000::1ad7 =====

void __h3000 FUN_M76_r4_0c000__1ad7(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b04_M76_r4_0c000__1a99);
  return;
}


// ===== FUN_M76_r4_0c000__1ae3 @ M76_r4_0c000::1ae3 =====

void __h3000 FUN_M76_r4_0c000__1ae3(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b04_M76_r4_0c000__1a99);
  return;
}


// ===== FUN_M76_r4_0c000__1b04 @ M76_r4_0c000::1b04 =====

undefined2 __h3000 FUN_M76_r4_0c000__1b04(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b04_M76_r4_0c000__1a99);
  FUN_M76_r4_0c000__2479(extraout_A,1);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1b3b @ M76_r4_0c000::1b3b =====

void __h3000 FUN_M76_r4_0c000__1b3b(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b89_M76_r4_0c000__1b15);
  return;
}


// ===== FUN_M76_r4_0c000__1b47 @ M76_r4_0c000::1b47 =====

void __h3000 FUN_M76_r4_0c000__1b47(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1B89 ->$1B74 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b89_M76_r4_0c000__1b15);
  return;
}


// ===== FUN_M76_r4_0c000__1b53 @ M76_r4_0c000::1b53 =====

void __h3000 FUN_M76_r4_0c000__1b53(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b89_M76_r4_0c000__1b15);
  return;
}


// ===== FUN_M76_r4_0c000__1b74 @ M76_r4_0c000::1b74 =====

void __h3000
FUN_M76_r4_0c000__1b74(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A(param_1,(undefined1)DAT_715e);
                    /* inline[API_FC38]: "{2:24}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1b87. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__1b89 @ M76_r4_0c000::1b89 =====

undefined2 __h3000 FUN_M76_r4_0c000__1b89(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1b89_M76_r4_0c000__1b15);
  FUN_M76_r4_0c000__2479(extraout_A,2);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1bc0 @ M76_r4_0c000::1bc0 =====

void __h3000 FUN_M76_r4_0c000__1bc0(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c05_M76_r4_0c000__1b9a);
  return;
}


// ===== FUN_M76_r4_0c000__1bcc @ M76_r4_0c000::1bcc =====

void __h3000 FUN_M76_r4_0c000__1bcc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1C05 ->$1BE4 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c05_M76_r4_0c000__1b9a);
  return;
}


// ===== FUN_M76_r4_0c000__1bd8 @ M76_r4_0c000::1bd8 =====

void __h3000 FUN_M76_r4_0c000__1bd8(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c05_M76_r4_0c000__1b9a);
  return;
}


// ===== FUN_M76_r4_0c000__1be4 @ M76_r4_0c000::1be4 =====

void __h3000 FUN_M76_r4_0c000__1be4(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c05_M76_r4_0c000__1b9a);
  return;
}


// ===== FUN_M76_r4_0c000__1c05 @ M76_r4_0c000::1c05 =====

undefined2 __h3000 FUN_M76_r4_0c000__1c05(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c05_M76_r4_0c000__1b9a);
  FUN_M76_r4_0c000__2479(extraout_A,2);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1c3c @ M76_r4_0c000::1c3c =====

void __h3000 FUN_M76_r4_0c000__1c3c(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c8a_M76_r4_0c000__1c16);
  return;
}


// ===== FUN_M76_r4_0c000__1c48 @ M76_r4_0c000::1c48 =====

void __h3000 FUN_M76_r4_0c000__1c48(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1C8A ->$1C75 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c8a_M76_r4_0c000__1c16);
  return;
}


// ===== FUN_M76_r4_0c000__1c54 @ M76_r4_0c000::1c54 =====

void __h3000 FUN_M76_r4_0c000__1c54(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c8a_M76_r4_0c000__1c16);
  return;
}


// ===== FUN_M76_r4_0c000__1c75 @ M76_r4_0c000::1c75 =====

void __h3000
FUN_M76_r4_0c000__1c75(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A(param_1,(undefined1)DAT_7166);
                    /* inline[API_FC38]: "{2:24}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1c88. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__1c8a @ M76_r4_0c000::1c8a =====

undefined2 __h3000 FUN_M76_r4_0c000__1c8a(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1c8a_M76_r4_0c000__1c16);
  FUN_M76_r4_0c000__2479(extraout_A,3);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1cc1 @ M76_r4_0c000::1cc1 =====

void __h3000 FUN_M76_r4_0c000__1cc1(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d06_M76_r4_0c000__1c9b);
  return;
}


// ===== FUN_M76_r4_0c000__1ccd @ M76_r4_0c000::1ccd =====

void __h3000 FUN_M76_r4_0c000__1ccd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1D06 ->$1CE5 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d06_M76_r4_0c000__1c9b);
  return;
}


// ===== FUN_M76_r4_0c000__1cd9 @ M76_r4_0c000::1cd9 =====

void __h3000 FUN_M76_r4_0c000__1cd9(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d06_M76_r4_0c000__1c9b);
  return;
}


// ===== FUN_M76_r4_0c000__1ce5 @ M76_r4_0c000::1ce5 =====

void __h3000 FUN_M76_r4_0c000__1ce5(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d06_M76_r4_0c000__1c9b);
  return;
}


// ===== FUN_M76_r4_0c000__1d06 @ M76_r4_0c000::1d06 =====

undefined2 __h3000 FUN_M76_r4_0c000__1d06(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d06_M76_r4_0c000__1c9b);
  FUN_M76_r4_0c000__2479(extraout_A,3);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1d3d @ M76_r4_0c000::1d3d =====

void __h3000 FUN_M76_r4_0c000__1d3d(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d8b_M76_r4_0c000__1d17);
  return;
}


// ===== FUN_M76_r4_0c000__1d49 @ M76_r4_0c000::1d49 =====

void __h3000 FUN_M76_r4_0c000__1d49(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1D8B ->$1D76 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d8b_M76_r4_0c000__1d17);
  return;
}


// ===== FUN_M76_r4_0c000__1d55 @ M76_r4_0c000::1d55 =====

void __h3000 FUN_M76_r4_0c000__1d55(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d8b_M76_r4_0c000__1d17);
  return;
}


// ===== FUN_M76_r4_0c000__1d76 @ M76_r4_0c000::1d76 =====

void __h3000
FUN_M76_r4_0c000__1d76(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A(param_1,(undefined1)DAT_716e);
                    /* inline[API_FC38]: "{2:24}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1d89. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__1d8b @ M76_r4_0c000::1d8b =====

undefined2 __h3000 FUN_M76_r4_0c000__1d8b(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1d8b_M76_r4_0c000__1d17);
  FUN_M76_r4_0c000__2479(extraout_A,4);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1dc2 @ M76_r4_0c000::1dc2 =====

void __h3000 FUN_M76_r4_0c000__1dc2(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e07_M76_r4_0c000__1d9c);
  return;
}


// ===== FUN_M76_r4_0c000__1dce @ M76_r4_0c000::1dce =====

void __h3000 FUN_M76_r4_0c000__1dce(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1E07 ->$1DE6 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e07_M76_r4_0c000__1d9c);
  return;
}


// ===== FUN_M76_r4_0c000__1dda @ M76_r4_0c000::1dda =====

void __h3000 FUN_M76_r4_0c000__1dda(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e07_M76_r4_0c000__1d9c);
  return;
}


// ===== FUN_M76_r4_0c000__1de6 @ M76_r4_0c000::1de6 =====

void __h3000 FUN_M76_r4_0c000__1de6(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e07_M76_r4_0c000__1d9c);
  return;
}


// ===== FUN_M76_r4_0c000__1e07 @ M76_r4_0c000::1e07 =====

undefined2 __h3000 FUN_M76_r4_0c000__1e07(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e07_M76_r4_0c000__1d9c);
  FUN_M76_r4_0c000__2479(extraout_A,4);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1e3e @ M76_r4_0c000::1e3e =====

void __h3000 FUN_M76_r4_0c000__1e3e(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e8c_M76_r4_0c000__1e18);
  return;
}


// ===== FUN_M76_r4_0c000__1e4a @ M76_r4_0c000::1e4a =====

void __h3000 FUN_M76_r4_0c000__1e4a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1E8C ->$1E77 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e8c_M76_r4_0c000__1e18);
  return;
}


// ===== FUN_M76_r4_0c000__1e56 @ M76_r4_0c000::1e56 =====

void __h3000 FUN_M76_r4_0c000__1e56(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e8c_M76_r4_0c000__1e18);
  return;
}


// ===== FUN_M76_r4_0c000__1e77 @ M76_r4_0c000::1e77 =====

void __h3000
FUN_M76_r4_0c000__1e77(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A(param_1,(undefined1)DAT_7176);
                    /* inline[API_FC38]: "{2:24}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1e8a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__1e8c @ M76_r4_0c000::1e8c =====

undefined2 __h3000 FUN_M76_r4_0c000__1e8c(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1e8c_M76_r4_0c000__1e18);
  FUN_M76_r4_0c000__2479(extraout_A,5);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1ec3 @ M76_r4_0c000::1ec3 =====

void __h3000 FUN_M76_r4_0c000__1ec3(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f08_M76_r4_0c000__1e9d);
  return;
}


// ===== FUN_M76_r4_0c000__1ecf @ M76_r4_0c000::1ecf =====

void __h3000 FUN_M76_r4_0c000__1ecf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1F08 ->$1EE7 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f08_M76_r4_0c000__1e9d);
  return;
}


// ===== FUN_M76_r4_0c000__1edb @ M76_r4_0c000::1edb =====

void __h3000 FUN_M76_r4_0c000__1edb(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f08_M76_r4_0c000__1e9d);
  return;
}


// ===== FUN_M76_r4_0c000__1ee7 @ M76_r4_0c000::1ee7 =====

void __h3000 FUN_M76_r4_0c000__1ee7(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f08_M76_r4_0c000__1e9d);
  return;
}


// ===== FUN_M76_r4_0c000__1f08 @ M76_r4_0c000::1f08 =====

undefined2 __h3000 FUN_M76_r4_0c000__1f08(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f08_M76_r4_0c000__1e9d);
  FUN_M76_r4_0c000__2479(extraout_A,5);
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__1f3f @ M76_r4_0c000::1f3f =====

void __h3000 FUN_M76_r4_0c000__1f3f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1F9C ->$1F63 */
  API_FE6A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19);
  return;
}


// ===== FUN_M76_r4_0c000__1f4b @ M76_r4_0c000::1f4b =====

void __h3000 FUN_M76_r4_0c000__1f4b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1F9C ->$1F63 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19);
  return;
}


// ===== FUN_M76_r4_0c000__1f57 @ M76_r4_0c000::1f57 =====

void __h3000 FUN_M76_r4_0c000__1f57(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1F9C ->$1F63 */
  API_FE6C(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19);
  return;
}


// ===== FUN_M76_r4_0c000__1f63 @ M76_r4_0c000::1f63 =====

void __h3000 FUN_M76_r4_0c000__1f63(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1F9C ->$1F63 */
  API_FE6E(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19);
  return;
}


// ===== FUN_M76_r4_0c000__1f6f @ M76_r4_0c000::1f6f =====

void __h3000 FUN_M76_r4_0c000__1f6f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1F9C ->$1F63 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19);
  return;
}


// ===== FUN_M76_r4_0c000__1f7b @ M76_r4_0c000::1f7b =====

void __h3000 FUN_M76_r4_0c000__1f7b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1F9C ->$1F63 $1F57 */
  API_FE1A(param_1,param_2,&PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19);
  return;
}


// ===== FUN_M76_r4_0c000__1f9c @ M76_r4_0c000::1f9c =====

undefined2 __h3000 FUN_M76_r4_0c000__1f9c(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7128;
  *(short *)(in_U + -2) = sVar1;
  DAT_717c = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_717c) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M76_r4_0c000__1ff1 @ M76_r4_0c000::1ff1 =====

void __h3000 FUN_M76_r4_0c000__1ff1(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__2036_M76_r4_0c000__1fcb);
  return;
}


// ===== FUN_M76_r4_0c000__1ffd @ M76_r4_0c000::1ffd =====

void __h3000 FUN_M76_r4_0c000__1ffd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2036 ->$2015 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__2036_M76_r4_0c000__1fcb);
  return;
}


// ===== FUN_M76_r4_0c000__2009 @ M76_r4_0c000::2009 =====

void __h3000 FUN_M76_r4_0c000__2009(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__2036_M76_r4_0c000__1fcb);
  return;
}


// ===== FUN_M76_r4_0c000__2015 @ M76_r4_0c000::2015 =====

void __h3000 FUN_M76_r4_0c000__2015(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__2036_M76_r4_0c000__1fcb);
  return;
}


// ===== FUN_M76_r4_0c000__2036 @ M76_r4_0c000::2036 =====

undefined2 __h3000 FUN_M76_r4_0c000__2036(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__2036_M76_r4_0c000__1fcb);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__206c @ M76_r4_0c000::206c =====

void __h3000 FUN_M76_r4_0c000__206c(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__20b1_M76_r4_0c000__2046);
  return;
}


// ===== FUN_M76_r4_0c000__2078 @ M76_r4_0c000::2078 =====

void __h3000 FUN_M76_r4_0c000__2078(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$20B1 ->$2090 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__20b1_M76_r4_0c000__2046);
  return;
}


// ===== FUN_M76_r4_0c000__2084 @ M76_r4_0c000::2084 =====

void __h3000 FUN_M76_r4_0c000__2084(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__20b1_M76_r4_0c000__2046);
  return;
}


// ===== FUN_M76_r4_0c000__2090 @ M76_r4_0c000::2090 =====

void __h3000 FUN_M76_r4_0c000__2090(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__20b1_M76_r4_0c000__2046);
  return;
}


// ===== FUN_M76_r4_0c000__20b1 @ M76_r4_0c000::20b1 =====

undefined2 __h3000 FUN_M76_r4_0c000__20b1(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__20b1_M76_r4_0c000__2046);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__20e7 @ M76_r4_0c000::20e7 =====

void __h3000 FUN_M76_r4_0c000__20e7(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__212c_M76_r4_0c000__20c1);
  return;
}


// ===== FUN_M76_r4_0c000__20f3 @ M76_r4_0c000::20f3 =====

void __h3000 FUN_M76_r4_0c000__20f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$212C ->$210B */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__212c_M76_r4_0c000__20c1);
  return;
}


// ===== FUN_M76_r4_0c000__20ff @ M76_r4_0c000::20ff =====

void __h3000 FUN_M76_r4_0c000__20ff(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__212c_M76_r4_0c000__20c1);
  return;
}


// ===== FUN_M76_r4_0c000__210b @ M76_r4_0c000::210b =====

void __h3000 FUN_M76_r4_0c000__210b(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__212c_M76_r4_0c000__20c1);
  return;
}


// ===== FUN_M76_r4_0c000__212c @ M76_r4_0c000::212c =====

undefined2 __h3000 FUN_M76_r4_0c000__212c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__212c_M76_r4_0c000__20c1);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__2162 @ M76_r4_0c000::2162 =====

void __h3000 FUN_M76_r4_0c000__2162(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M76_r4_0c000__21a7_M76_r4_0c000__213c);
  return;
}


// ===== FUN_M76_r4_0c000__216e @ M76_r4_0c000::216e =====

void __h3000 FUN_M76_r4_0c000__216e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$21A7 ->$2186 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M76_r4_0c000__21a7_M76_r4_0c000__213c);
  return;
}


// ===== FUN_M76_r4_0c000__217a @ M76_r4_0c000::217a =====

void __h3000 FUN_M76_r4_0c000__217a(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M76_r4_0c000__21a7_M76_r4_0c000__213c);
  return;
}


// ===== FUN_M76_r4_0c000__2186 @ M76_r4_0c000::2186 =====

void __h3000 FUN_M76_r4_0c000__2186(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M76_r4_0c000__21a7_M76_r4_0c000__213c);
  return;
}


// ===== FUN_M76_r4_0c000__21a7 @ M76_r4_0c000::21a7 =====

undefined2 __h3000 FUN_M76_r4_0c000__21a7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M76_r4_0c000__21a7_M76_r4_0c000__213c);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M76_r4_0c000__21b7 @ M76_r4_0c000::21b7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x21d9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__21b7(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = (undefined1)in_D;
  *(undefined1 *)(param_3 + -1) = uVar2;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  *(undefined1 *)(param_3 + -2) = uVar1;
  *(undefined1 *)(param_3 + -3) = uVar2;
  *(undefined1 *)(param_3 + -4) = uVar1;
  *(undefined1 *)(param_3 + -5) = 3;
  puVar3 = (undefined1 *)(param_3 + -6);
  *puVar3 = 0;
  API_FCEC();
  API_FCFC();
  puVar3[-1] = 0x6b;
  puVar4 = (undefined2 *)(puVar3 + -2);
  *(undefined1 *)puVar4 = 0x23;
  API_FCF2();
  API_FCE2();
                    /* WARNING: Could not recover jumptable at 0x21d9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)*puVar4 >> 8),uVar2,param_1,param_2,puVar4 + 1);
  return;
}


// ===== FUN_M76_r4_0c000__21db @ M76_r4_0c000::21db =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x21f1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M76_r4_0c000__21db
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,short param_5)

{
  undefined2 uVar1;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = *(undefined2 *)(param_4 + 0xe);
  *(char *)(param_5 + -1) = (char)uVar1;
  *(char *)(param_5 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_5 + -3) = 100;
  puVar4 = (undefined2 *)(param_5 + -4);
  *(undefined1 *)puVar4 = 0;
  sVar3 = param_4;
  API_FCEC();
  uVar2 = (undefined1)((ushort)*puVar4 >> 8);
  FUN_M76_r4_0c000__21b7(uVar2);
  *(undefined1 *)(sVar3 + 0x12) = uVar2;
                    /* WARNING: Could not recover jumptable at 0x21f1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar2,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__21f3 @ M76_r4_0c000::21f3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x220a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M76_r4_0c000__21f3
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4,short param_5)

{
  undefined2 uVar1;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = *(undefined2 *)(param_4 + 0x18);
  *(char *)(param_5 + -1) = (char)uVar1;
  *(char *)(param_5 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_5 + -3) = 100;
  puVar4 = (undefined2 *)(param_5 + -4);
  *(undefined1 *)puVar4 = 0;
  sVar3 = param_4;
  API_FCEC();
  uVar2 = (undefined1)((ushort)*puVar4 >> 8);
  FUN_M76_r4_0c000__21b7(uVar2);
  *(undefined1 *)(sVar3 + 0x1c) = uVar2;
                    /* WARNING: Could not recover jumptable at 0x220a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar2,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__220c @ M76_r4_0c000::220c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x222c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__220c(undefined2 param_1,undefined2 param_2,short param_3)

{
  char cVar1;
  undefined2 in_D;
  byte bVar2;
  byte *pbVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar2 = (byte)in_D;
  *(byte *)(param_3 + -1) = bVar2;
  cVar1 = (char)((ushort)in_D >> 8);
  *(char *)(param_3 + -2) = cVar1;
  *(byte *)(param_3 + -3) = bVar2 << 2;
  pbVar3 = (byte *)(param_3 + -4);
  *pbVar3 = (cVar1 << 1 | bVar2 >> 7) << 1 | (bVar2 & 0x7f) >> 6;
  API_FCFC();
  pbVar3[-1] = 0x7f;
  pbVar3 = pbVar3 + -2;
  *pbVar3 = 0x34;
  API_FCF2();
  API_FCE2();
                    /* WARNING: Could not recover jumptable at 0x222c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)(*(short *)pbVar3 + 1) >> 8),bVar2,param_1,param_2,pbVar3 + 2);
  return;
}


// ===== FUN_M76_r4_0c000__222e @ M76_r4_0c000::222e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2263 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__222e(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  byte bVar1;
  byte bVar2;
  char cVar3;
  undefined2 in_D;
  ushort uVar4;
  ushort uVar5;
  short sVar6;
  code *UNRECOVERED_JUMPTABLE;
  byte local_6;
  byte bStack_5;
  
  bStack_5 = 0;
  local_6 = 0;
  cVar3 = (char)((ushort)*param_3 >> 8);
  uVar4 = CONCAT11(cVar3 >> 1,(char)*param_3 >> 1 | cVar3 << 7);
  uVar5 = param_3[1];
  sVar6 = 0xf;
  do {
    if (uVar5 < uVar4) {
      bVar1 = bStack_5 >> 7;
      bStack_5 = bStack_5 << 1;
      bVar2 = local_6 >> 7;
      local_6 = local_6 << 1 | bVar1;
      uVar5 = CONCAT11((char)(uVar5 >> 8) << 1 | (byte)uVar5 >> 7,(byte)uVar5 << 1 | bVar2);
    }
    else {
      uVar5 = uVar5 - uVar4;
      bVar1 = local_6 >> 7;
      local_6 = local_6 << 1 | bStack_5 >> 7;
      uVar5 = CONCAT11((char)(uVar5 >> 7),(char)uVar5 << 1 | bVar1);
      bStack_5 = bStack_5 * '\x02' + 1;
    }
    sVar6 = sVar6 + -1;
  } while (sVar6 != 0);
  *(byte *)((short)param_3 + 3) = bStack_5;
  *(byte *)(param_3 + 1) = local_6;
                    /* WARNING: Could not recover jumptable at 0x2263. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar5,param_1);
  return;
}


// ===== MODULE_7A_02_entry @ M76_r4_0c000::226e =====

void __h3000
MODULE_7A_02_entry(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M76_r4_0c000__230b();
                    /* WARNING: Could not recover jumptable at 0x2273. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__2275 @ M76_r4_0c000::2275 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2309 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__2275(short param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  short sVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 local_a;
  undefined2 local_8;
  
  local_a = '\0';
  sVar3 = 0x6e28;
  local_8 = 0x6e28;
  sVar2 = param_1;
  do {
    FUN_M76_r4_0c000__28e5();
    *(undefined1 *)(sVar3 + 5) = 0xff;
    API_FD2E(0);
    API_FD2E(0);
    API_FD2E(0);
    API_FD2E(0);
    API_FD2E(0);
    API_FD2E(0);
    API_FD2E((char)((ushort)local_8 >> 8));
    sVar3 = *(short *)(sVar2 + 2);
    sVar1 = API_FD2E((char)((ushort)(local_8 + 100) >> 8));
    local_8 = sVar1 + 6000;
    local_a = local_a + '\x01';
  } while (local_a != '\x06');
  DAT_74cc = 0;
  FUN_M76_r4_0c000__28d8();
                    /* WARNING: Could not recover jumptable at 0x2309. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__230b @ M76_r4_0c000::230b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x232a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__230b(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_2;
  FUN_M76_r4_0c000__23b4();
                    /* inline[addr:9CDD]: ->$23B3(rel) */
  uVar1 = FUN_9cdd();
  *(undefined2 *)(sVar2 + 3) = uVar1;
                    /* inline[addr:9CDD]: ->$232C(rel) */
  uVar1 = FUN_9cdd();
  *(undefined2 *)(sVar2 + 1) = uVar1;
  DAT_74cc = 0;
                    /* WARNING: Could not recover jumptable at 0x232a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__232c @ M76_r4_0c000::232c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2357 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__232c(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 local_5;
  
  local_5 = (byte)in_D;
  if (-1 < (char)DAT_608a) {
    if ((local_5 & 0xf) != DAT_608a) goto LAB_M76_r4_0c000__234a;
  }
  if ((local_5 & 0xf0) == 0x90) {
                    /* inline[addr:9CDD]: ->$2361(rel) */
    FUN_9cdd();
    FUN_M76_r4_0c000__2350();
    return;
  }
  if ((local_5 & 0xf0) == 0x80) {
                    /* inline[addr:9CDD]: ->$2392(rel) */
    FUN_9cdd();
    FUN_M76_r4_0c000__2350();
    return;
  }
LAB_M76_r4_0c000__234a:
  sVar2 = param_2;
                    /* inline[addr:9CDD]: ->$23B3(rel) */
  FUN_9cdd();
  uVar1 = FUN_M76_r4_0c000__23b4();
  *(undefined2 *)(sVar2 + 3) = uVar1;
                    /* WARNING: Could not recover jumptable at 0x2357. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__2350 @ M76_r4_0c000::2350 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2357 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__2350(void)

{
  undefined2 uVar1;
  short in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_M76_r4_0c000__23b4();
  *(undefined2 *)(in_Y + 3) = uVar1;
                    /* WARNING: Could not recover jumptable at 0x2357. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000000 >> 8),(char)uVar1,in_stack_00000002,in_stack_00000004)
  ;
  return;
}


// ===== FUN_M76_r4_0c000__2361 @ M76_r4_0c000::2361 =====

void __h3000 FUN_M76_r4_0c000__2361(undefined1 param_1,undefined1 param_2)

{
  DAT_7214._0_1_ = param_2;
                    /* inline[addr:9CDD]: ->$236E(rel) */
  FUN_9cdd();
  FUN_M76_r4_0c000__2350();
  return;
}


// ===== FUN_M76_r4_0c000__236e @ M76_r4_0c000::236e =====

void __h3000 FUN_M76_r4_0c000__236e(undefined1 param_1,char param_2)

{
  if (param_2 == '\0') {
    if ((DAT_6117 & 2) != 0) {
      FUN_M76_r4_0c000__2448();
    }
  }
  else {
    FUN_M76_r4_0c000__23c2();
  }
                    /* inline[addr:9CDD]: ->$2361(rel) */
  FUN_9cdd();
  FUN_M76_r4_0c000__2350();
  return;
}


// ===== FUN_M76_r4_0c000__2392 @ M76_r4_0c000::2392 =====

void __h3000 FUN_M76_r4_0c000__2392(undefined1 param_1,undefined1 param_2)

{
  DAT_7214._0_1_ = param_2;
                    /* inline[addr:9CDD]: ->$239F(rel) */
  FUN_9cdd();
  FUN_M76_r4_0c000__2350();
  return;
}


// ===== FUN_M76_r4_0c000__239f @ M76_r4_0c000::239f =====

void __h3000 FUN_M76_r4_0c000__239f(void)

{
  if ((DAT_6117 & 1) != 0) {
    FUN_M76_r4_0c000__2448();
  }
                    /* inline[addr:9CDD]: ->$2392(rel) */
  FUN_9cdd();
  FUN_M76_r4_0c000__2350();
  return;
}


// ===== FUN_M76_r4_0c000__23b4 @ M76_r4_0c000::23b4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x23c0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__23b4(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x23c0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,0x6dd0);
  return;
}


// ===== FUN_M76_r4_0c000__23c2 @ M76_r4_0c000::23c2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2420 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__23c2(short param_1,short param_2)

{
  ushort uVar1;
  byte bVar2;
  ushort in_D;
  char cVar3;
  short sVar4;
  short sVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar3 = (char)in_D;
  uVar1 = in_D >> 8;
  if ((char)DAT_70fe == '\0') {
    sVar4 = param_1;
    sVar5 = param_2;
    FUN_M76_r4_0c000__2422();
    if (cVar3 != -1) {
      FUN_M76_r4_0c000__28e5();
      FUN_M76_r4_0c000__271e();
      DAT_74cd = cVar3;
      *(char *)(sVar5 + 0x21) = cVar3;
      **(ushort **)(sVar4 + 0x20) = in_D & 0xff;
      **(ushort **)(sVar4 + 0x1e) = in_D & 0xff;
      API_FC80();
      sVar5 = DAT_74d0;
      bVar2 = DAT_7214._0_1_;
      in_D = (ushort)DAT_7214._0_1_;
      *(byte *)(DAT_74d0 + 5) = DAT_7214._0_1_;
      *(byte *)(sVar5 + 4) = bVar2;
      **(ushort **)(sVar4 + 0x1a) = in_D;
      **(ushort **)(sVar4 + 0x18) = in_D;
      API_FC80();
      FUN_M76_r4_0c000__24f0();
      FUN_M76_r4_0c000__26bc();
      FUN_M76_r4_0c000__268e();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x2420. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__2422 @ M76_r4_0c000::2422 =====

void __h3000
FUN_M76_r4_0c000__2422(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  char cVar1;
  undefined1 uVar2;
  char cVar3;
  char extraout_B;
  short sVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = param_1;
  cVar3 = DAT_74cc;
  sVar4 = param_4;
  do {
    cVar3 = cVar3 + '\x01';
    if (cVar3 == '\x06') {
      cVar3 = '\0';
    }
    FUN_M76_r4_0c000__28e5(uVar2,cVar3);
    uVar2 = 0xff;
    cVar3 = extraout_B;
    cVar1 = extraout_B;
    if (*(char *)(sVar4 + 5) == -1) goto LAB_M76_r4_0c000__2446;
  } while (extraout_B != DAT_74cc);
  cVar3 = -1;
  cVar1 = DAT_74cc;
LAB_M76_r4_0c000__2446:
  DAT_74cc = cVar1;
                    /* WARNING: Could not recover jumptable at 0x2446. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,cVar3,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__2448 @ M76_r4_0c000::2448 =====

void __h3000
FUN_M76_r4_0c000__2448(char param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  char cVar1;
  char cVar2;
  char extraout_B;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = '\0';
  cVar1 = param_1;
  sVar3 = param_4;
  do {
    FUN_M76_r4_0c000__28e5(cVar1,cVar2);
    cVar1 = *(char *)(sVar3 + 5);
    if (cVar1 == DAT_7214._0_1_) {
      *(undefined1 *)(sVar3 + 5) = 0xff;
      if (((char)DAT_70f8 == '\0') && (FUN_M76_r4_0c000__2597(), (char)DAT_713e != '\x02')) {
        FUN_M76_r4_0c000__271e();
      }
      break;
    }
    cVar2 = extraout_B + '\x01';
  } while (cVar2 != '\x06');
                    /* WARNING: Could not recover jumptable at 0x2477. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__2479 @ M76_r4_0c000::2479 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x249a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__2479(short param_1,short param_2)

{
  undefined2 in_D;
  short sVar1;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_1;
  sVar2 = param_2;
  FUN_M76_r4_0c000__28e5();
  DAT_74cd = (undefined1)**(undefined2 **)(sVar1 + 0x20);
  *(undefined1 *)(sVar2 + 0x21) = DAT_74cd;
  DAT_7214._0_1_ = (undefined1)**(undefined2 **)(sVar1 + 0x1a);
  *(undefined1 *)(sVar2 + 4) = DAT_7214._0_1_;
  FUN_M76_r4_0c000__24f0();
  FUN_M76_r4_0c000__26bc();
                    /* WARNING: Could not recover jumptable at 0x249a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__249c @ M76_r4_0c000::249c =====

void __h3000
FUN_M76_r4_0c000__249c(char param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  char extraout_A;
  char cVar1;
  char cVar2;
  char extraout_B;
  char extraout_B_00;
  char extraout_B_01;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((char)DAT_70f8 == '\0') {
    cVar2 = '\0';
    cVar1 = param_1;
    sVar3 = param_4;
    do {
      FUN_M76_r4_0c000__28e5(cVar1,cVar2);
      cVar1 = *(char *)(sVar3 + 5);
      cVar2 = extraout_B;
      if (*(char *)(sVar3 + 5) == -1) {
        FUN_M76_r4_0c000__2597();
        cVar1 = (char)DAT_713e;
        cVar2 = extraout_B_00;
        if ((char)DAT_713e != '\x02') {
          FUN_M76_r4_0c000__271e();
          cVar1 = extraout_A;
          cVar2 = extraout_B_01;
        }
      }
      cVar2 = cVar2 + '\x01';
    } while (cVar2 != '\x06');
  }
                    /* WARNING: Could not recover jumptable at 0x24c2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__24c4 @ M76_r4_0c000::24c4 =====

void __h3000
FUN_M76_r4_0c000__24c4(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  char cVar2;
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = '\0';
  uVar1 = param_1;
  do {
    FUN_M76_r4_0c000__28e5(uVar1,cVar2);
    FUN_M76_r4_0c000__2597();
    cVar2 = extraout_B + '\x01';
    uVar1 = extraout_A;
  } while (cVar2 != '\x06');
                    /* WARNING: Could not recover jumptable at 0x24d3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__24d5 @ M76_r4_0c000::24d5 =====

void __h3000
FUN_M76_r4_0c000__24d5(undefined1 param_1,undefined1 param_2,undefined2 param_3,short param_4)

{
  undefined1 uVar1;
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 local_7;
  
  local_7 = '\x06';
  uVar1 = param_1;
  sVar2 = param_4;
  do {
    FUN_M76_r4_0c000__28e5(uVar1,local_7 + -1);
    FUN_M76_r4_0c000__24f0(extraout_A,*(undefined1 *)(sVar2 + 4));
    local_7 = local_7 + -1;
    uVar1 = extraout_A_00;
  } while (local_7 != '\0');
                    /* WARNING: Could not recover jumptable at 0x24ee. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__24f0 @ M76_r4_0c000::24f0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2595 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__24f0(undefined2 param_1,ushort *param_2,short param_3)

{
  byte *pbVar1;
  ushort uVar2;
  byte bVar3;
  byte bVar4;
  undefined2 in_D;
  byte bVar5;
  ushort *puVar6;
  byte *pbVar7;
  byte *pbVar8;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar3 = (byte)((ushort)in_D >> 8);
  puVar6 = param_2;
  FUN_M76_r4_0c000__266e();
  do {
  } while (0xb < bVar3);
  *(char *)(param_3 + -1) = (char)in_D;
  *(undefined1 *)(param_3 + -2) = 0;
  *(undefined1 *)(param_3 + -3) = *(undefined1 *)((short)puVar6 + 3);
  *(byte *)(param_3 + -4) = bVar3;
  *(undefined1 *)(param_3 + -5) = 3;
  pbVar7 = (byte *)(param_3 + -6);
  *pbVar7 = 0;
  API_FCDE();
  FUN_M76_r4_0c000__29d2();
  API_FCFC();
  pbVar8 = pbVar7 + 1;
  *pbVar8 = 0;
  *pbVar7 = 0;
  do {
    pbVar1 = pbVar7 + 2;
    bVar4 = *pbVar1;
    *pbVar1 = *pbVar1 >> 1;
    pbVar1 = pbVar7 + 3;
    bVar5 = *pbVar1;
    *pbVar1 = (char)*pbVar1 >> 1 | bVar4 << 7;
    bVar4 = *pbVar7;
    *pbVar7 = (char)*pbVar7 >> 1 | bVar5 << 7;
    *pbVar8 = (char)*pbVar8 >> 1 | bVar4 << 7;
  } while ((char)in_D != '\x01');
  bVar4 = (byte)((ushort)*(undefined2 *)pbVar7 >> 8);
  bVar5 = (char)*(undefined2 *)pbVar7 >> 1 | bVar4 << 7;
  *param_2 = CONCAT11(bVar4 >> 1,bVar5);
  param_2[4] = *(ushort *)(pbVar7 + 2);
  uVar2 = *param_2;
  if (uVar2 < 0x3fff) {
    *param_2 = uVar2 + 0x3fff;
    param_2[4] = param_2[4] - 3;
  }
  else {
    *param_2 = uVar2 + 0xc001;
    param_2[4] = param_2[4] - 2;
  }
  API_FD2E(0);
  FUN_M76_r4_0c000__2597();
                    /* WARNING: Could not recover jumptable at 0x2595. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar3,bVar5,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__2597 @ M76_r4_0c000::2597 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x266c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__2597(undefined2 param_1,undefined2 *param_2,short param_3)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short sVar3;
  undefined1 uVar5;
  short sVar4;
  undefined2 *puVar6;
  short *psVar7;
  short *psVar8;
  undefined1 *puVar9;
  undefined2 *puVar10;
  short *psVar11;
  short *psVar12;
  code *UNRECOVERED_JUMPTABLE;
  char local_9;
  short *local_8;
  
                    /* inline[addr:9CDD]: ->$2C96(rel) */
  sVar3 = FUN_9cdd();
  sVar4 = sVar3;
  FUN_M76_r4_0c000__284c();
  uVar1 = *(undefined2 *)(sVar4 + (ushort)(byte)((char)sVar3 * '\x02'));
  uVar5 = (undefined1)uVar1;
  *(undefined1 *)(param_3 + -1) = uVar5;
  uVar2 = (undefined1)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -2) = uVar2;
  *(undefined1 *)(param_3 + -3) = uVar5;
  puVar9 = (undefined1 *)(param_3 + -4);
  *puVar9 = uVar2;
  FUN_M76_r4_0c000__284c();
  param_2[3] = (ushort)(byte)(((char)sVar3 * -2 + 'd') * '\x02');
  param_2[10] = 0;
  param_2[5] = 0;
  puVar6 = param_2;
                    /* inline[addr:9CDD]: ->$2E2A(rel) */
  sVar4 = FUN_9cdd();
  uVar1 = *(undefined2 *)(sVar4 + puVar6[3]);
  puVar9[-1] = (char)uVar1;
  puVar10 = (undefined2 *)(puVar9 + -2);
  *(char *)puVar10 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  uVar1 = *puVar10;
  puVar10 = puVar10 + 1;
  puVar6[6] = uVar1;
  puVar6[9] = uVar1;
                    /* inline[addr:9CDD]: ->$2EF4(rel) */
  sVar4 = FUN_9cdd();
  uVar1 = *(undefined2 *)(sVar4 + puVar6[3]);
  *(char *)((short)puVar10 + -1) = (char)uVar1;
  puVar10 = puVar10 + -1;
  *(char *)puVar10 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  uVar1 = *puVar10;
  puVar6[7] = uVar1;
  puVar6[8] = uVar1;
  uVar1 = *puVar6;
  uVar5 = (undefined1)uVar1;
  *(undefined1 *)((short)puVar10 + 1) = uVar5;
  uVar2 = (undefined1)((ushort)uVar1 >> 8);
  *(undefined1 *)puVar10 = uVar2;
  *(undefined1 *)((short)puVar10 + -1) = uVar5;
  *(undefined1 *)(puVar10 + -1) = uVar2;
  *(undefined1 *)((short)puVar10 + -3) = uVar5;
  *(undefined1 *)(puVar10 + -2) = uVar2;
  *(undefined1 *)((short)puVar10 + -5) = uVar5;
  *(undefined1 *)(puVar10 + -3) = uVar2;
  *(undefined1 *)((short)puVar10 + -7) = uVar5;
  psVar12 = puVar10 + -4;
  *(undefined1 *)psVar12 = uVar2;
  local_9 = '\x05';
  psVar7 = param_2 + 5;
  local_8 = param_2 + 0xb;
  do {
    psVar8 = psVar7 + 1;
    psVar11 = psVar12 + -1;
    *psVar11 = *psVar7 - *psVar8;
    API_FCF2();
    psVar12 = psVar11 + 1;
    *local_8 = *psVar11 + *psVar8;
    API_FD2E();
    local_9 = local_9 + -1;
    psVar7 = psVar8;
    local_8 = local_8 + 1;
  } while (local_9 != '\0');
                    /* WARNING: Could not recover jumptable at 0x266c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar4,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__266e @ M76_r4_0c000::266e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x268c */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__266e(undefined2 param_1,short param_2)

{
  short in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = in_D * 0x100 + DAT_70ee;
  if (sVar1 < 0 != SCARRY2(in_D * 0x100,DAT_70ee)) {
    if (DAT_70ee < 0) {
      sVar1 = 0;
    }
    else {
      sVar1 = 0x7f00;
    }
  }
  _DAT_722e = sVar1;
  *(short *)(param_2 + 2) = sVar1;
                    /* WARNING: Could not recover jumptable at 0x268c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__268e @ M76_r4_0c000::268e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x26ba */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__268e(undefined2 param_1,short param_2)

{
  byte bVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = (*(char *)(param_2 + 0x20) >> 1) + *(char *)(param_2 + 0x20) + 0x19;
  DAT_707c = (ushort)bVar1;
  FUN_M76_r4_0c000__284c();
  FUN_M76_r4_0c000__28c4();
  API_FD2E();
  API_FD2E();
                    /* WARNING: Could not recover jumptable at 0x26ba. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__26bc @ M76_r4_0c000::26bc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x26f8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__26bc(short param_1,short param_2)

{
  char cVar1;
  undefined2 in_D;
  short sVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = 0;
  if (DAT_713e == 0) {
                    /* inline[addr:9CDD]: ->$2BCC(rel) */
    sVar3 = FUN_9cdd();
    sVar2 = sVar3;
    FUN_M76_r4_0c000__284c();
    cVar1 = 'e' - (char)sVar3;
    *(char *)(param_2 + 0x20) = cVar1;
    sVar2 = *(short *)(sVar2 + (ushort)(byte)(cVar1 * '\x02'));
    if (sVar2 == 0) {
      sVar2 = 1;
    }
  }
  API_FD2E((char)((ushort)sVar2 >> 8),(char)sVar2,param_1,*(undefined2 *)(param_1 + 0x12));
                    /* WARNING: Could not recover jumptable at 0x26f8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar2,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__26fa @ M76_r4_0c000::26fa =====

void __h3000
FUN_M76_r4_0c000__26fa(char param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char extraout_A;
  char cVar1;
  char extraout_A_00;
  char cVar2;
  char extraout_B;
  char extraout_B_00;
  char extraout_B_01;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar2 = '\0';
  cVar1 = param_1;
  do {
    FUN_M76_r4_0c000__28e5(cVar1,cVar2);
    FUN_M76_r4_0c000__26bc();
    if ((char)DAT_713e == '\x01') {
      FUN_M76_r4_0c000__271e();
      cVar1 = extraout_A_00;
      cVar2 = extraout_B_01;
    }
    else {
      cVar1 = (char)DAT_713e;
      cVar2 = extraout_B;
      if ((char)DAT_713e == '\x02') {
        FUN_M76_r4_0c000__268e();
        cVar1 = extraout_A;
        cVar2 = extraout_B_00;
      }
    }
    cVar2 = cVar2 + '\x01';
  } while (cVar2 != '\x06');
                    /* WARNING: Could not recover jumptable at 0x2717. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__271e @ M76_r4_0c000::271e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x272c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__271e(undefined2 *param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FD2E(0,0,param_1,*param_1);
                    /* WARNING: Could not recover jumptable at 0x272c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__272e @ M76_r4_0c000::272e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2745 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__272e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_M76_r4_0c000__21b7((char)((ushort)DAT_7104 >> 8));
  *(char *)(param_3 + -1) = (char)uVar1;
  puVar2 = (undefined2 *)(param_3 + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_M76_r4_0c000__29fa();
  API_FD2E((char)((ushort)*puVar2 >> 8));
                    /* WARNING: Could not recover jumptable at 0x2745. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__2747 @ M76_r4_0c000::2747 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2760 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__2747(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  short sVar1;
  byte bVar2;
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$2B02(rel) */
  sVar1 = FUN_9cdd();
  bVar2 = (byte)DAT_710a << 1 | extraout_CC & 1;
  API_FD2E((char)((ushort)*(undefined2 *)
                           (sVar1 + CONCAT11((char)((ushort)DAT_710a >> 8) << 1 |
                                             (byte)DAT_710a >> 7,bVar2)) >> 8));
                    /* WARNING: Could not recover jumptable at 0x2760. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar2,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__2762 @ M76_r4_0c000::2762 =====

void __h3000
FUN_M76_r4_0c000__2762(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M76_r4_0c000__2787();
  FUN_M76_r4_0c000__27a4();
  FUN_M76_r4_0c000__27c1();
  FUN_M76_r4_0c000__27de();
  FUN_M76_r4_0c000__26fa();
                    /* WARNING: Could not recover jumptable at 0x2773. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__2775 @ M76_r4_0c000::2775 =====

void __h3000 FUN_M76_r4_0c000__2775(void)

{
  undefined1 uVar1;
  short in_U;
  
  if ((char)DAT_713e == '\x02') {
    uVar1 = 10;
  }
  else {
    uVar1 = 100;
  }
  *(undefined1 *)(in_U + -1) = uVar1;
  *(undefined1 *)(in_U + -2) = 0;
  return;
}


// ===== FUN_M76_r4_0c000__2787 @ M76_r4_0c000::2787 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x27a2 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__2787(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_7110;
  *(char *)(param_3 + -1) = (char)DAT_7110;
  puVar2 = (undefined2 *)(param_3 + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_M76_r4_0c000__2775();
  API_FCEC();
  FUN_M76_r4_0c000__21b7((char)((ushort)*puVar2 >> 8));
  API_FD2E();
                    /* WARNING: Could not recover jumptable at 0x27a2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__27a4 @ M76_r4_0c000::27a4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x27bf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__27a4(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_7116;
  *(char *)(param_3 + -1) = (char)DAT_7116;
  puVar2 = (undefined2 *)(param_3 + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_M76_r4_0c000__2775();
  API_FCEC();
  FUN_M76_r4_0c000__21b7((char)((ushort)*puVar2 >> 8));
  API_FD2E();
                    /* WARNING: Could not recover jumptable at 0x27bf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__27c1 @ M76_r4_0c000::27c1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x27dc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__27c1(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_711c;
  *(char *)(param_3 + -1) = (char)DAT_711c;
  puVar2 = (undefined2 *)(param_3 + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_M76_r4_0c000__2775();
  API_FCEC();
  FUN_M76_r4_0c000__21b7((char)((ushort)*puVar2 >> 8));
  API_FD2E();
                    /* WARNING: Could not recover jumptable at 0x27dc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__27de @ M76_r4_0c000::27de =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x27fb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__27de(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *puVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = DAT_7122;
  *(char *)(param_3 + -1) = (char)DAT_7122;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 100;
  puVar2 = (undefined2 *)(param_3 + -4);
  *(undefined1 *)puVar2 = 0;
  API_FCEC();
  FUN_M76_r4_0c000__21b7((char)((ushort)*puVar2 >> 8));
  API_FD2E();
                    /* WARNING: Could not recover jumptable at 0x27fb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__27fd @ M76_r4_0c000::27fd =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x284a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__27fd(undefined2 param_1,undefined2 param_2)

{
  ushort uVar1;
  undefined2 in_D;
  short sVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M76_r4_0c000__21b7((char)((DAT_7142 & 0xff) * 100 >> 8));
  API_FD2E();
  uVar1 = DAT_714a & 0xff;
  API_FD2E();
  API_FD2E((char)(uVar1 * -10 >> 8));
  sVar2 = API_FD2E(0);
  sVar3 = (DAT_7146 & 0xff) * 0x8c;
  API_FD2E((char)((ushort)(sVar3 + sVar2) >> 8));
                    /* WARNING: Could not recover jumptable at 0x284a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__284c @ M76_r4_0c000::284c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x289f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__284c(undefined2 param_1,short param_2)

{
  char cVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = (char)((ushort)in_D >> 8);
  FUN_M76_r4_0c000__28a1(*(undefined1 *)(param_2 + 0x1c));
  FUN_M76_r4_0c000__28a1();
                    /* WARNING: Could not recover jumptable at 0x289f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(cVar1,(cVar1 >> 7) << 2,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__28a1 @ M76_r4_0c000::28a1 =====

short __h3000 FUN_M76_r4_0c000__28a1(void)

{
  ushort in_D;
  char cVar3;
  ushort uVar1;
  short sVar2;
  
  cVar3 = (char)in_D;
  uVar1 = in_D;
  if ((short)in_D < 0) {
    uVar1 = CONCAT11(-(char)(in_D >> 8),cVar3);
  }
  if ((char)uVar1 < '\0') {
    uVar1 = CONCAT11((char)(uVar1 >> 8),-(char)uVar1);
  }
  sVar2 = (uVar1 >> 8) * (uVar1 & 0xff);
  if ((short)in_D < 0) {
    if (cVar3 < '\0') {
      return sVar2;
    }
  }
  else if (-1 < cVar3) {
    return sVar2;
  }
  return -sVar2;
}


// ===== FUN_M76_r4_0c000__28c4 @ M76_r4_0c000::28c4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x28d6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M76_r4_0c000__28c4(undefined1 param_1,char param_2,undefined2 param_3,undefined2 param_4)

{
  byte bVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = ('d' - param_2) * '\x02';
                    /* WARNING: Could not recover jumptable at 0x28d6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)-*(short *)(DAT_74d2 + (ushort)bVar1) >> 8),bVar1,param_3,param_4);
  return;
}


// ===== FUN_M76_r4_0c000__28d8 @ M76_r4_0c000::28d8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x28e3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M76_r4_0c000__28d8(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$2B02(rel) */
  DAT_74d2 = FUN_9cdd();
                    /* WARNING: Could not recover jumptable at 0x28e3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)DAT_74d2,param_1,param_2);
  return;
}


// ===== FUN_M76_r4_0c000__28e5 @ M76_r4_0c000::28e5 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M76_r4_0c000__28e5(void)

{
  ushort in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = (in_D & 0xff) * 0x22;
                    /* inline[addr:9CDD]: ->$2906(rel) */
  _DAT_74ce = FUN_9cdd();
  _DAT_74ce = sVar1 + _DAT_74ce;
  DAT_74d0 = *(short *)(_DAT_74ce + 0x10) + 0x7400;
                    /* WARNING: Could not recover jumptable at 0x2904. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)(in_D >> 8));
  return;
}


// ===== FUN_M76_r4_0c000__29d2 @ M76_r4_0c000::29d2 =====

void __h3000 FUN_M76_r4_0c000__29d2(void)

{
                    /* inline[API_FE20]: interp table, 17 points */
  InterpTableLookup();
  return;
}


// ===== FUN_M76_r4_0c000__29fa @ M76_r4_0c000::29fa =====

void __h3000 FUN_M76_r4_0c000__29fa(void)

{
                    /* inline[API_FE20]: interp table, 129 points */
  InterpTableLookup();
  return;
}


