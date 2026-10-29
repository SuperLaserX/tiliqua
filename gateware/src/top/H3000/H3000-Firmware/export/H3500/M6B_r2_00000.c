// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M6B_r2_00000 M6B_r2_00000::0000-M6B_r2_00000::3fff, 181 functions
// Bank r2_00000 (module id 6B, sub 00)

// ===== MODULE_6B_01_entry @ M6B_r2_00000::00b0 =====

undefined2 __h3000 MODULE_6B_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $00B4 */
  uVar1 = ModuleSetBase();
  FUN_M6B_r2_00000__01a5();
  FUN_M6B_r2_00000__015b();
  FUN_M6B_r2_00000__01fd();
  DAT_60da = 3;
  API_FE38();
  FUN_M6B_r2_00000__0102();
  if (DAT_600a != 'k') {
    FUN_a2f1();
    FUN_M6B_r2_00000__012b();
  }
  FUN_M6B_r2_00000__021c();
  FUN_M6B_r2_00000__0280();
  DAT_6105 = 1;
  DAT_6106 = 0x60;
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M6B_r2_00000__047f();
  API_FE10();
  return uVar1;
}


// ===== FUN_M6B_r2_00000__0102 @ M6B_r2_00000::0102 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__0102(void)

{
  code *pcVar1;
  undefined2 in_D;
  
  pcVar1 = FUN_M6B_r2_00000__1792 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M6B_r2_00000__175f + g_moduleBase,&LAB_6600,
           pcVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M6B_r2_00000__012b @ M6B_r2_00000::012b =====

undefined2 __h3000 FUN_M6B_r2_00000__012b(undefined1 param_1,undefined1 param_2,undefined2 param_3)

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
  DspLoadProgram(param_1,1,0x2810);
  uVar1 = extraout_A;
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A,2,0x2811);
    uVar1 = extraout_A_00;
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_00,3,0x2812);
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


// ===== FUN_M6B_r2_00000__015b @ M6B_r2_00000::015b =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M6B_r2_00000__015b(void)

{
  undefined2 in_D;
  
  DAT_7002 = 0;
  DAT_7022 = 0;
  DAT_702a = 0;
  DAT_7032 = 0;
  DAT_703a = 0;
  DAT_7062 = 0;
  DAT_7064 = 0;
  DAT_7066 = 0;
  DAT_7068 = 0;
  DAT_706a = 0;
  DAT_706c = 0;
  _DAT_706e = 0;
  DAT_7070 = 0;
  DAT_7072 = 0;
  DAT_7074 = 0;
  DAT_7076 = 0;
  DAT_700a = 0;
  DAT_7010 = 0;
  DAT_7016 = 0;
  DAT_701c = 0;
  DAT_7020 = 0;
  DAT_7028 = 0;
  return in_D;
}


// ===== FUN_M6B_r2_00000__01a5 @ M6B_r2_00000::01a5 =====

undefined2 __h3000 FUN_M6B_r2_00000__01a5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FE04]: 19:08 1A:0E 1B:14 1C:1A */
  LoadParamsSigned();
                    /* inline[API_FE04]: 49:40 4A:42 4B:44 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 58:52 59:54 5A:56 5B:58 5C:5A 5D:5C 5E:5E 5F:60 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 3B:30 3D:38 4C:46 4E:48 50:4A 52:4C 54:4E 56:50 35:00 3F:06
                        */
  LoadParamsScaled();
                    /* inline[API_FE08]: 41:26 43:2E 47:3E 45:36 */
  LoadParamsScaled();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__01fd @ M6B_r2_00000::01fd =====

undefined2 __h3000 FUN_M6B_r2_00000__01fd(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M6B_r2_00000__123e();
  FUN_M6B_r2_00000__12b9();
  FUN_M6B_r2_00000__1334();
  FUN_M6B_r2_00000__13af();
  FUN_M6B_r2_00000__11a4();
  return in_D;
}


// ===== FUN_M6B_r2_00000__021c @ M6B_r2_00000::021c =====

undefined2 __h3000 FUN_M6B_r2_00000__021c(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 extraout_A_03;
  undefined1 extraout_A_04;
  undefined1 extraout_A_05;
  undefined1 extraout_A_06;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined1 extraout_B_03;
  undefined1 extraout_B_04;
  undefined1 extraout_B_05;
  undefined1 extraout_B_06;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M6B_r2_00000__170c();
  FUN_M6B_r2_00000__0b3a();
  FUN_M6B_r2_00000__0be3();
  FUN_M6B_r2_00000__0829();
  FUN_M6B_r2_00000__0770();
  API_FE76(extraout_A,extraout_B,PTR_ARRAY_M6B_r2_00000__0c0a);
  API_FE76(extraout_A_00,extraout_B_00,PTR_ARRAY_M6B_r2_00000__0c84);
  API_FE76(extraout_A_01,extraout_B_01,&PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe);
  API_FE76(extraout_A_02,extraout_B_02,&PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78);
  FUN_M6B_r2_00000__08cb();
  API_FE76(extraout_A_03,extraout_B_03,PTR_ARRAY_M6B_r2_00000__0df2);
  API_FE76(extraout_A_04,extraout_B_04,PTR_ARRAY_M6B_r2_00000__0e6c);
  API_FE76(extraout_A_05,extraout_B_05,&PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6);
  API_FE76(extraout_A_06,extraout_B_06,&PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60);
  FUN_M6B_r2_00000__0993();
  FUN_M6B_r2_00000__0a74();
                    /* inline[API_FE08]: 37:20 39:28 */
  LoadParamsScaled();
  FUN_M6B_r2_00000__08cb();
  FUN_M6B_r2_00000__0993();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0280 @ M6B_r2_00000::0280 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M6B_r2_00000__0280(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 " decay  " 21 $089E $08AA */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "gate dec" 25 $0966 $0972 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "gatetime" 29 $07FC $0808 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "predelay" 2D $0743 $074F */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "  mix   " 31 $1177 $1183 */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M6B_r2_00000__02f2;
  _DAT_60f7 = 0x1a;
  return in_D;
}


// ===== FUN_M6B_r2_00000__0331 @ M6B_r2_00000::0331 =====

void __h3000 FUN_M6B_r2_00000__0331(void)

{
  FUN_M6B_r2_00000__071f();
  FUN_M6B_r2_00000__047f();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__033c @ M6B_r2_00000::033c =====

void __h3000 FUN_M6B_r2_00000__033c(void)

{
  FUN_M6B_r2_00000__087a();
  FUN_M6B_r2_00000__047f();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__0347 @ M6B_r2_00000::0347 =====

void __h3000 FUN_M6B_r2_00000__0347(void)

{
  FUN_M6B_r2_00000__0942();
  FUN_M6B_r2_00000__047f();
  API_FE14();
  return;
}


// ===== FUN_M6B_r2_00000__0352 @ M6B_r2_00000::0352 =====

void __h3000 FUN_M6B_r2_00000__0352(void)

{
  FUN_M6B_r2_00000__07d8();
  FUN_M6B_r2_00000__047f();
  API_FE16();
  return;
}


// ===== FUN_M6B_r2_00000__035d @ M6B_r2_00000::035d =====

void __h3000 FUN_M6B_r2_00000__035d(void)

{
  FUN_M6B_r2_00000__0c3c();
  FUN_M6B_r2_00000__055c();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__0368 @ M6B_r2_00000::0368 =====

void __h3000 FUN_M6B_r2_00000__0368(void)

{
  FUN_M6B_r2_00000__0d30();
  FUN_M6B_r2_00000__055c();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__0373 @ M6B_r2_00000::0373 =====

void __h3000 FUN_M6B_r2_00000__0373(void)

{
  FUN_M6B_r2_00000__0cb6();
  FUN_M6B_r2_00000__055c();
  API_FE14();
  return;
}


// ===== FUN_M6B_r2_00000__037e @ M6B_r2_00000::037e =====

void __h3000 FUN_M6B_r2_00000__037e(void)

{
  FUN_M6B_r2_00000__0daa();
  FUN_M6B_r2_00000__055c();
  API_FE16();
  return;
}


// ===== FUN_M6B_r2_00000__0389 @ M6B_r2_00000::0389 =====

void __h3000 FUN_M6B_r2_00000__0389(void)

{
  FUN_M6B_r2_00000__0e24();
  FUN_M6B_r2_00000__0595();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__0394 @ M6B_r2_00000::0394 =====

void __h3000 FUN_M6B_r2_00000__0394(void)

{
  FUN_M6B_r2_00000__0f18();
  FUN_M6B_r2_00000__0595();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__039f @ M6B_r2_00000::039f =====

void __h3000 FUN_M6B_r2_00000__039f(void)

{
  FUN_M6B_r2_00000__0e9e();
  FUN_M6B_r2_00000__0595();
  API_FE14();
  return;
}


// ===== FUN_M6B_r2_00000__03aa @ M6B_r2_00000::03aa =====

void __h3000 FUN_M6B_r2_00000__03aa(void)

{
  FUN_M6B_r2_00000__0f92();
  FUN_M6B_r2_00000__0595();
  API_FE16();
  return;
}


// ===== FUN_M6B_r2_00000__03b5 @ M6B_r2_00000::03b5 =====

void __h3000 FUN_M6B_r2_00000__03b5(void)

{
  FUN_M6B_r2_00000__0baa();
  FUN_M6B_r2_00000__0523();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__03c0 @ M6B_r2_00000::03c0 =====

void __h3000 FUN_M6B_r2_00000__03c0(void)

{
  FUN_M6B_r2_00000__0b01();
  FUN_M6B_r2_00000__0523();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__03cb @ M6B_r2_00000::03cb =====

void __h3000 FUN_M6B_r2_00000__03cb(void)

{
  FUN_M6B_r2_00000__0a0c();
  FUN_M6B_r2_00000__0523();
  API_FE14();
  return;
}


// ===== FUN_M6B_r2_00000__03d6 @ M6B_r2_00000::03d6 =====

void __h3000 FUN_M6B_r2_00000__03d6(void)

{
  FUN_M6B_r2_00000__0fda();
  FUN_M6B_r2_00000__05f2();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__03e1 @ M6B_r2_00000::03e1 =====

void __h3000 FUN_M6B_r2_00000__03e1(void)

{
  FUN_M6B_r2_00000__0fe1();
  FUN_M6B_r2_00000__05f2();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__03ec @ M6B_r2_00000::03ec =====

void __h3000 FUN_M6B_r2_00000__03ec(void)

{
  FUN_M6B_r2_00000__0fe8();
  FUN_M6B_r2_00000__05f2();
  API_FE14();
  return;
}


// ===== FUN_M6B_r2_00000__03f7 @ M6B_r2_00000::03f7 =====

void __h3000 FUN_M6B_r2_00000__03f7(void)

{
  FUN_M6B_r2_00000__0fef();
  FUN_M6B_r2_00000__05f2();
  API_FE16();
  return;
}


// ===== FUN_M6B_r2_00000__0402 @ M6B_r2_00000::0402 =====

void __h3000 FUN_M6B_r2_00000__0402(void)

{
  FUN_M6B_r2_00000__0ff6();
  FUN_M6B_r2_00000__062b();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__040d @ M6B_r2_00000::040d =====

void __h3000 FUN_M6B_r2_00000__040d(void)

{
  FUN_M6B_r2_00000__0ffd();
  FUN_M6B_r2_00000__062b();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__0418 @ M6B_r2_00000::0418 =====

void __h3000 FUN_M6B_r2_00000__0418(void)

{
  FUN_M6B_r2_00000__1205();
  FUN_M6B_r2_00000__0688();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__0423 @ M6B_r2_00000::0423 =====

void __h3000 FUN_M6B_r2_00000__0423(void)

{
  FUN_M6B_r2_00000__1280();
  FUN_M6B_r2_00000__0688();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__042e @ M6B_r2_00000::042e =====

void __h3000 FUN_M6B_r2_00000__042e(void)

{
  FUN_M6B_r2_00000__12fb();
  FUN_M6B_r2_00000__06ba();
  API_FE10();
  return;
}


// ===== FUN_M6B_r2_00000__0439 @ M6B_r2_00000::0439 =====

void __h3000 FUN_M6B_r2_00000__0439(void)

{
  FUN_M6B_r2_00000__1376();
  FUN_M6B_r2_00000__06ba();
  API_FE12();
  return;
}


// ===== FUN_M6B_r2_00000__0444 @ M6B_r2_00000::0444 =====

void __h3000 FUN_M6B_r2_00000__0444(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M6B_r2_00000__047f @ M6B_r2_00000::047f =====

void __h3000 FUN_M6B_r2_00000__047f(void)

{
                    /* inline[API_FE02]: "predelay" "on decay" "offdecay" "gatetime" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0713 ->$086E ->$0936 ->$07CC ->$04B8 ->$04B8 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__04b8 @ M6B_r2_00000::04b8 =====

void __h3000 FUN_M6B_r2_00000__04b8(void)

{
                    /* inline[API_FE02]: "  mix   " [*] " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1147 ->$06EC ->$0688 ->$04EA ->$047F ->$047F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__04ea @ M6B_r2_00000::04ea =====

void __h3000 FUN_M6B_r2_00000__04ea(void)

{
                    /* inline[API_FE02]: "   eq   " " gate   " " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$055C ->$0523 ->$05F2 ->$04B8 ->$04EA ->$04EA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__0523 @ M6B_r2_00000::0523 =====

void __h3000 FUN_M6B_r2_00000__0523(void)

{
                    /* inline[API_FE02]: " speed  " " thresh " " enable " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0B9E ->$0AF5 ->$0A00 ->$04EA ->$0523 ->$0523 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__055c @ M6B_r2_00000::055c =====

void __h3000 FUN_M6B_r2_00000__055c(void)

{
                    /* inline[API_FE02]: "on lfreq" "on lowdB" "on hfreq" "on  hidB" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C30 ->$0D24 ->$0CAA ->$0D9E ->$0595 ->$05CE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__0595 @ M6B_r2_00000::0595 =====

void __h3000 FUN_M6B_r2_00000__0595(void)

{
                    /* inline[API_FE02]: "offlfreq" "offlowdB" "offhfreq" "off hidB" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0E18 ->$0F0C ->$0E92 ->$0F86 ->$05CE ->$055C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__05ce @ M6B_r2_00000::05ce =====

void __h3000 FUN_M6B_r2_00000__05ce(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$06EC ->$06EC ->$06EC ->$04EA ->$055C ->$0595 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__05f2 @ M6B_r2_00000::05f2 =====

void __h3000 FUN_M6B_r2_00000__05f2(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1030 ->$103A ->$1044 ->$104E ->$062B ->$062B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__062b @ M6B_r2_00000::062b =====

void __h3000 FUN_M6B_r2_00000__062b(void)

{
                    /* inline[API_FE02]: "delay 5 " "delay 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1058 ->$1062 ->$06EC ->$04EA ->$05F2 ->$05F2 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__065d @ M6B_r2_00000::065d =====

void __h3000 FUN_M6B_r2_00000__065d(undefined1 param_1)

{
  undefined1 extraout_A;
  
  LcdSetCursor(param_1,0x33);
                    /* inline[API_FC38]: " range  " */
  LcdPrintInline();
  LcdSetCursor(extraout_A,0x3d);
                    /* inline[API_FC38]: "perclick" */
  LcdPrintInline();
  API_FDF2();
  return;
}


// ===== FUN_M6B_r2_00000__0688 @ M6B_r2_00000::0688 =====

void __h3000 FUN_M6B_r2_00000__0688(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$11F9 ->$1274 ->$06EC ->$04B8 ->$06BA ->$06BA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__06ba @ M6B_r2_00000::06ba =====

void __h3000 FUN_M6B_r2_00000__06ba(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$12EF ->$136A ->$06EC ->$04B8 ->$0688 ->$0688 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_r2_00000__06ec @ M6B_r2_00000::06ec =====

void __h3000 FUN_M6B_r2_00000__06ec(void)

{
  return;
}


// ===== FUN_M6B_r2_00000__0713 @ M6B_r2_00000::0713 =====

void __h3000 FUN_M6B_r2_00000__0713(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0770 ->$0737 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed);
  return;
}


// ===== FUN_M6B_r2_00000__071f @ M6B_r2_00000::071f =====

void __h3000 FUN_M6B_r2_00000__071f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0770 ->$0737 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed);
  return;
}


// ===== FUN_M6B_r2_00000__072b @ M6B_r2_00000::072b =====

void __h3000 FUN_M6B_r2_00000__072b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0770 ->$0737 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed);
  return;
}


// ===== FUN_M6B_r2_00000__0737 @ M6B_r2_00000::0737 =====

void __h3000 FUN_M6B_r2_00000__0737(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0770 ->$0737 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed);
  return;
}


// ===== FUN_M6B_r2_00000__0743 @ M6B_r2_00000::0743 =====

void __h3000 FUN_M6B_r2_00000__0743(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0770 ->$0737 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed);
  return;
}


// ===== FUN_M6B_r2_00000__074f @ M6B_r2_00000::074f =====

void __h3000 FUN_M6B_r2_00000__074f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0770 ->$0737 $072B */
  API_FE1A(param_1,param_2,&PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed);
  return;
}


// ===== FUN_M6B_r2_00000__0770 @ M6B_r2_00000::0770 =====

undefined2 __h3000 FUN_M6B_r2_00000__0770(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  
  API_FE76();
  uVar1 = DAT_703c;
  *(char *)(in_U + -1) = (char)DAT_703c;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x2c;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCF0();
  DAT_70c4 = *(short *)(puVar2 + 2) + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70c4 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__07cc @ M6B_r2_00000::07cc =====

void __h3000 FUN_M6B_r2_00000__07cc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0829 ->$07F0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6);
  return;
}


// ===== FUN_M6B_r2_00000__07d8 @ M6B_r2_00000::07d8 =====

void __h3000 FUN_M6B_r2_00000__07d8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0829 ->$07F0 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6);
  return;
}


// ===== FUN_M6B_r2_00000__07e4 @ M6B_r2_00000::07e4 =====

void __h3000 FUN_M6B_r2_00000__07e4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0829 ->$07F0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6);
  return;
}


// ===== FUN_M6B_r2_00000__07f0 @ M6B_r2_00000::07f0 =====

void __h3000 FUN_M6B_r2_00000__07f0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0829 ->$07F0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6);
  return;
}


// ===== FUN_M6B_r2_00000__07fc @ M6B_r2_00000::07fc =====

void __h3000 FUN_M6B_r2_00000__07fc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0829 ->$07F0 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6);
  return;
}


// ===== FUN_M6B_r2_00000__0808 @ M6B_r2_00000::0808 =====

void __h3000 FUN_M6B_r2_00000__0808(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0829 ->$07F0 $07E4 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6);
  return;
}


// ===== FUN_M6B_r2_00000__0829 @ M6B_r2_00000::0829 =====

undefined2 __h3000 FUN_M6B_r2_00000__0829(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7034;
  *(char *)(in_U + -1) = (char)DAT_7034;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x44;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 0;
  API_FCEE();
  DAT_70a6 = *puVar2;
  return in_D;
}


// ===== FUN_M6B_r2_00000__086e @ M6B_r2_00000::086e =====

void __h3000 FUN_M6B_r2_00000__086e(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848);
  return;
}


// ===== FUN_M6B_r2_00000__087a @ M6B_r2_00000::087a =====

void __h3000 FUN_M6B_r2_00000__087a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$08CB ->$0892 */
                    /* inline[API_FDBC]: "5.94...H" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848);
  return;
}


// ===== FUN_M6B_r2_00000__0886 @ M6B_r2_00000::0886 =====

void __h3000 FUN_M6B_r2_00000__0886(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$08CB ->$0892 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848);
  return;
}


// ===== FUN_M6B_r2_00000__0892 @ M6B_r2_00000::0892 =====

void __h3000 FUN_M6B_r2_00000__0892(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848);
  return;
}


// ===== FUN_M6B_r2_00000__089e @ M6B_r2_00000::089e =====

void __h3000 FUN_M6B_r2_00000__089e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$08CB ->$0892 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848);
  return;
}


// ===== FUN_M6B_r2_00000__08aa @ M6B_r2_00000::08aa =====

void __h3000 FUN_M6B_r2_00000__08aa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$08CB ->$0892 $0886 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848);
  return;
}


// ===== FUN_M6B_r2_00000__08cb @ M6B_r2_00000::08cb =====

undefined2 __h3000 FUN_M6B_r2_00000__08cb(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_70a2 = *(ushort *)(&UNK_M6B_r2_00000__19bc + g_moduleBase + DAT_7024 * 2);
  FUN_M6B_r2_00000__13bf();
  if (DAT_70a2 < DAT_70a4 == (DAT_70a2 == DAT_70a4)) {
    DAT_70c4 = 0x727b;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70c4 >> 8));
  }
  return in_D;
}


// ===== FUN_M6B_r2_00000__0936 @ M6B_r2_00000::0936 =====

void __h3000 FUN_M6B_r2_00000__0936(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910);
  return;
}


// ===== FUN_M6B_r2_00000__0942 @ M6B_r2_00000::0942 =====

void __h3000 FUN_M6B_r2_00000__0942(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0993 ->$095A */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910);
  return;
}


// ===== FUN_M6B_r2_00000__094e @ M6B_r2_00000::094e =====

void __h3000 FUN_M6B_r2_00000__094e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0993 ->$095A */
  API_FE6C(param_1,param_2,&PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910);
  return;
}


// ===== FUN_M6B_r2_00000__095a @ M6B_r2_00000::095a =====

void __h3000 FUN_M6B_r2_00000__095a(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910);
  return;
}


// ===== FUN_M6B_r2_00000__0966 @ M6B_r2_00000::0966 =====

void __h3000 FUN_M6B_r2_00000__0966(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0993 ->$095A */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910);
  return;
}


// ===== FUN_M6B_r2_00000__0972 @ M6B_r2_00000::0972 =====

void __h3000 FUN_M6B_r2_00000__0972(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0993 ->$095A $094E */
  API_FE1A(param_1,param_2,&PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910);
  return;
}


// ===== FUN_M6B_r2_00000__0993 @ M6B_r2_00000::0993 =====

undefined2 __h3000 FUN_M6B_r2_00000__0993(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_70a4 = *(ushort *)(&UNK_M6B_r2_00000__19bc + g_moduleBase + DAT_702c * 2);
  FUN_M6B_r2_00000__1518();
  if (DAT_70a4 < DAT_70a2 == (DAT_70a4 == DAT_70a2)) {
    DAT_70c4 = 0x727b;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70c4 >> 8));
  }
  return in_D;
}


// ===== FUN_M6B_r2_00000__0a00 @ M6B_r2_00000::0a00 =====

void __h3000 FUN_M6B_r2_00000__0a00(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0a74_M6B_r2_00000__09d8);
  return;
}


// ===== FUN_M6B_r2_00000__0a0c @ M6B_r2_00000::0a0c =====

void __h3000 FUN_M6B_r2_00000__0a0c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0A74 ->$0A24 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0a74_M6B_r2_00000__09d8);
  return;
}


// ===== FUN_M6B_r2_00000__0a18 @ M6B_r2_00000::0a18 =====

void __h3000 FUN_M6B_r2_00000__0a18(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0a74_M6B_r2_00000__09d8);
  return;
}


// ===== FUN_M6B_r2_00000__0a24 @ M6B_r2_00000::0a24 =====

undefined2 __h3000 FUN_M6B_r2_00000__0a24(void)

{
  undefined2 in_D;
  
  if (DAT_7044 == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "gate is enabled     " */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "gate is disabled    " */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M6B_r2_00000__0a74 @ M6B_r2_00000::0a74 =====

undefined2 __h3000 FUN_M6B_r2_00000__0a74(void)

{
  undefined2 in_D;
  
  API_FE76();
  if (DAT_707c == 0) {
                    /* inline[API_FC62]: $6097 */
    ModuleStorePtr(0x17);
    API_FD20(0);
    API_FD2E(0xff);
    DAT_70da = 0xffff;
  }
  else {
                    /* inline[API_FC62]: $6097 */
    ModuleStorePtr(6);
    API_FD20(0);
    API_FD2E(0);
    DAT_70da = 0;
  }
  return in_D;
}


// ===== FUN_M6B_r2_00000__0af5 @ M6B_r2_00000::0af5 =====

void __h3000 FUN_M6B_r2_00000__0af5(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0b3a_M6B_r2_00000__0acf);
  return;
}


// ===== FUN_M6B_r2_00000__0b01 @ M6B_r2_00000::0b01 =====

void __h3000 FUN_M6B_r2_00000__0b01(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0B3A ->$0B19 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0b3a_M6B_r2_00000__0acf);
  return;
}


// ===== FUN_M6B_r2_00000__0b0d @ M6B_r2_00000::0b0d =====

void __h3000 FUN_M6B_r2_00000__0b0d(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0b3a_M6B_r2_00000__0acf);
  return;
}


// ===== FUN_M6B_r2_00000__0b19 @ M6B_r2_00000::0b19 =====

void __h3000 FUN_M6B_r2_00000__0b19(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__0b3a_M6B_r2_00000__0acf);
  return;
}


// ===== FUN_M6B_r2_00000__0b3a @ M6B_r2_00000::0b3a =====

void __h3000 FUN_M6B_r2_00000__0b3a(void)

{
  short sVar1;
  undefined2 uVar2;
  short in_U;
  short *psVar3;
  
  API_FE76();
  uVar2 = DAT_7078;
  *(char *)(in_U + -1) = (char)DAT_7078;
  *(char *)(in_U + -2) = (char)((ushort)uVar2 >> 8);
  *(undefined1 *)(in_U + -3) = 0xad;
  psVar3 = (short *)(in_U + -4);
  *(undefined1 *)psVar3 = 0x67;
  API_FCF2();
  sVar1 = *psVar3 + DAT_7040;
  *psVar3 = sVar1;
  psVar3 = psVar3 + -1;
  *psVar3 = sVar1;
  API_FCEE();
  DAT_70c4 = *psVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70c4 >> 8));
  return;
}


// ===== FUN_M6B_r2_00000__0b9e @ M6B_r2_00000::0b9e =====

void __h3000 FUN_M6B_r2_00000__0b9e(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0be3_M6B_r2_00000__0b78);
  return;
}


// ===== FUN_M6B_r2_00000__0baa @ M6B_r2_00000::0baa =====

void __h3000 FUN_M6B_r2_00000__0baa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0BE3 ->$0BC2 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0be3_M6B_r2_00000__0b78);
  return;
}


// ===== FUN_M6B_r2_00000__0bb6 @ M6B_r2_00000::0bb6 =====

void __h3000 FUN_M6B_r2_00000__0bb6(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0be3_M6B_r2_00000__0b78);
  return;
}


// ===== FUN_M6B_r2_00000__0bc2 @ M6B_r2_00000::0bc2 =====

void __h3000 FUN_M6B_r2_00000__0bc2(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__0be3_M6B_r2_00000__0b78);
  return;
}


// ===== FUN_M6B_r2_00000__0be3 @ M6B_r2_00000::0be3 =====

void __h3000 FUN_M6B_r2_00000__0be3(void)

{
  API_FE76();
  DAT_70c4 = 0x7fff - DAT_707a;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70c4 >> 8));
  return;
}


// ===== FUN_M6B_r2_00000__0c30 @ M6B_r2_00000::0c30 =====

void __h3000 FUN_M6B_r2_00000__0c30(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c0a);
  return;
}


// ===== FUN_M6B_r2_00000__0c3c @ M6B_r2_00000::0c3c =====

void __h3000 FUN_M6B_r2_00000__0c3c(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c0a);
  return;
}


// ===== FUN_M6B_r2_00000__0c48 @ M6B_r2_00000::0c48 =====

void __h3000 FUN_M6B_r2_00000__0c48(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c0a);
  return;
}


// ===== FUN_M6B_r2_00000__0c54 @ M6B_r2_00000::0c54 =====

void __h3000 FUN_M6B_r2_00000__0c54(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c0a);
  return;
}


// ===== FUN_M6B_r2_00000__0c75 @ M6B_r2_00000::0c75 =====

undefined2 __h3000 FUN_M6B_r2_00000__0c75(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c0a);
  FUN_M6B_r2_00000__13bf();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0caa @ M6B_r2_00000::0caa =====

void __h3000 FUN_M6B_r2_00000__0caa(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c84);
  return;
}


// ===== FUN_M6B_r2_00000__0cb6 @ M6B_r2_00000::0cb6 =====

void __h3000 FUN_M6B_r2_00000__0cb6(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c84);
  return;
}


// ===== FUN_M6B_r2_00000__0cc2 @ M6B_r2_00000::0cc2 =====

void __h3000 FUN_M6B_r2_00000__0cc2(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c84);
  return;
}


// ===== FUN_M6B_r2_00000__0cce @ M6B_r2_00000::0cce =====

void __h3000 FUN_M6B_r2_00000__0cce(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c84);
  return;
}


// ===== FUN_M6B_r2_00000__0cef @ M6B_r2_00000::0cef =====

undefined2 __h3000 FUN_M6B_r2_00000__0cef(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0c84);
  FUN_M6B_r2_00000__13bf();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0d24 @ M6B_r2_00000::0d24 =====

void __h3000 FUN_M6B_r2_00000__0d24(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe);
  return;
}


// ===== FUN_M6B_r2_00000__0d30 @ M6B_r2_00000::0d30 =====

void __h3000 FUN_M6B_r2_00000__0d30(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0D69 ->$0D48 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe);
  return;
}


// ===== FUN_M6B_r2_00000__0d3c @ M6B_r2_00000::0d3c =====

void __h3000 FUN_M6B_r2_00000__0d3c(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe);
  return;
}


// ===== FUN_M6B_r2_00000__0d48 @ M6B_r2_00000::0d48 =====

void __h3000 FUN_M6B_r2_00000__0d48(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe);
  return;
}


// ===== FUN_M6B_r2_00000__0d69 @ M6B_r2_00000::0d69 =====

undefined2 __h3000 FUN_M6B_r2_00000__0d69(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe);
  FUN_M6B_r2_00000__13bf();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0d9e @ M6B_r2_00000::0d9e =====

void __h3000 FUN_M6B_r2_00000__0d9e(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78);
  return;
}


// ===== FUN_M6B_r2_00000__0daa @ M6B_r2_00000::0daa =====

void __h3000 FUN_M6B_r2_00000__0daa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0DE3 ->$0DC2 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78);
  return;
}


// ===== FUN_M6B_r2_00000__0db6 @ M6B_r2_00000::0db6 =====

void __h3000 FUN_M6B_r2_00000__0db6(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78);
  return;
}


// ===== FUN_M6B_r2_00000__0dc2 @ M6B_r2_00000::0dc2 =====

void __h3000 FUN_M6B_r2_00000__0dc2(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78);
  return;
}


// ===== FUN_M6B_r2_00000__0de3 @ M6B_r2_00000::0de3 =====

undefined2 __h3000 FUN_M6B_r2_00000__0de3(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78);
  FUN_M6B_r2_00000__13bf();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0e18 @ M6B_r2_00000::0e18 =====

void __h3000 FUN_M6B_r2_00000__0e18(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0df2);
  return;
}


// ===== FUN_M6B_r2_00000__0e24 @ M6B_r2_00000::0e24 =====

void __h3000 FUN_M6B_r2_00000__0e24(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0df2);
  return;
}


// ===== FUN_M6B_r2_00000__0e30 @ M6B_r2_00000::0e30 =====

void __h3000 FUN_M6B_r2_00000__0e30(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0df2);
  return;
}


// ===== FUN_M6B_r2_00000__0e3c @ M6B_r2_00000::0e3c =====

void __h3000 FUN_M6B_r2_00000__0e3c(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0df2);
  return;
}


// ===== FUN_M6B_r2_00000__0e5d @ M6B_r2_00000::0e5d =====

undefined2 __h3000 FUN_M6B_r2_00000__0e5d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0df2);
  FUN_M6B_r2_00000__1518();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0e92 @ M6B_r2_00000::0e92 =====

void __h3000 FUN_M6B_r2_00000__0e92(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0e6c);
  return;
}


// ===== FUN_M6B_r2_00000__0e9e @ M6B_r2_00000::0e9e =====

void __h3000 FUN_M6B_r2_00000__0e9e(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0e6c);
  return;
}


// ===== FUN_M6B_r2_00000__0eaa @ M6B_r2_00000::0eaa =====

void __h3000 FUN_M6B_r2_00000__0eaa(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0e6c);
  return;
}


// ===== FUN_M6B_r2_00000__0eb6 @ M6B_r2_00000::0eb6 =====

void __h3000 FUN_M6B_r2_00000__0eb6(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0e6c);
  return;
}


// ===== FUN_M6B_r2_00000__0ed7 @ M6B_r2_00000::0ed7 =====

undefined2 __h3000 FUN_M6B_r2_00000__0ed7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,PTR_ARRAY_M6B_r2_00000__0e6c);
  FUN_M6B_r2_00000__1518();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0f0c @ M6B_r2_00000::0f0c =====

void __h3000 FUN_M6B_r2_00000__0f0c(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6);
  return;
}


// ===== FUN_M6B_r2_00000__0f18 @ M6B_r2_00000::0f18 =====

void __h3000 FUN_M6B_r2_00000__0f18(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0F51 ->$0F30 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6);
  return;
}


// ===== FUN_M6B_r2_00000__0f24 @ M6B_r2_00000::0f24 =====

void __h3000 FUN_M6B_r2_00000__0f24(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6);
  return;
}


// ===== FUN_M6B_r2_00000__0f30 @ M6B_r2_00000::0f30 =====

void __h3000 FUN_M6B_r2_00000__0f30(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6);
  return;
}


// ===== FUN_M6B_r2_00000__0f51 @ M6B_r2_00000::0f51 =====

undefined2 __h3000 FUN_M6B_r2_00000__0f51(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6);
  FUN_M6B_r2_00000__1518();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0f86 @ M6B_r2_00000::0f86 =====

void __h3000 FUN_M6B_r2_00000__0f86(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60);
  return;
}


// ===== FUN_M6B_r2_00000__0f92 @ M6B_r2_00000::0f92 =====

void __h3000 FUN_M6B_r2_00000__0f92(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0FCB ->$0FAA */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60);
  return;
}


// ===== FUN_M6B_r2_00000__0f9e @ M6B_r2_00000::0f9e =====

void __h3000 FUN_M6B_r2_00000__0f9e(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60);
  return;
}


// ===== FUN_M6B_r2_00000__0faa @ M6B_r2_00000::0faa =====

void __h3000 FUN_M6B_r2_00000__0faa(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60);
  return;
}


// ===== FUN_M6B_r2_00000__0fcb @ M6B_r2_00000::0fcb =====

undefined2 __h3000 FUN_M6B_r2_00000__0fcb(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60);
  FUN_M6B_r2_00000__1518();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__0fda @ M6B_r2_00000::0fda =====

undefined2 __h3000 FUN_M6B_r2_00000__0fda(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ba = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_r2_00000__1030 + g_moduleBase + (DAT_70c2 & 0xff) * 10))();
  FUN_M6B_r2_00000__10ee();
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__0fe1 @ M6B_r2_00000::0fe1 =====

undefined2 __h3000 FUN_M6B_r2_00000__0fe1(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ba = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_r2_00000__1030 + g_moduleBase + (DAT_70c2 & 0xff) * 10))();
  FUN_M6B_r2_00000__10ee();
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__0fe8 @ M6B_r2_00000::0fe8 =====

undefined2 __h3000 FUN_M6B_r2_00000__0fe8(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ba = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_r2_00000__1030 + g_moduleBase + (DAT_70c2 & 0xff) * 10))();
  FUN_M6B_r2_00000__10ee();
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__0fef @ M6B_r2_00000::0fef =====

undefined2 __h3000 FUN_M6B_r2_00000__0fef(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ba = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_r2_00000__1030 + g_moduleBase + (DAT_70c2 & 0xff) * 10))();
  FUN_M6B_r2_00000__10ee();
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__0ff6 @ M6B_r2_00000::0ff6 =====

undefined2 __h3000 FUN_M6B_r2_00000__0ff6(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ba = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_r2_00000__1030 + g_moduleBase + (DAT_70c2 & 0xff) * 10))();
  FUN_M6B_r2_00000__10ee();
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__0ffd @ M6B_r2_00000::0ffd =====

undefined2 __h3000 FUN_M6B_r2_00000__0ffd(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ba = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_r2_00000__1030 + g_moduleBase + (DAT_70c2 & 0xff) * 10))();
  FUN_M6B_r2_00000__10ee();
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__1030 @ M6B_r2_00000::1030 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__1030(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0,0,1099);
  DAT_6074 = *DAT_70ba;
  FUN_M6B_r2_00000__0444();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_r2_00000__10ee();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__103a @ M6B_r2_00000::103a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__103a(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0,1,0x44f);
  DAT_6074 = *DAT_70ba;
  FUN_M6B_r2_00000__0444();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_r2_00000__10ee();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__1044 @ M6B_r2_00000::1044 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__1044(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0,2,0x450);
  DAT_6074 = *DAT_70ba;
  FUN_M6B_r2_00000__0444();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_r2_00000__10ee();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__104e @ M6B_r2_00000::104e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__104e(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0,3,0x44c);
  DAT_6074 = *DAT_70ba;
  FUN_M6B_r2_00000__0444();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_r2_00000__10ee();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__1058 @ M6B_r2_00000::1058 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__1058(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0,4,0x44d);
  DAT_6074 = *DAT_70ba;
  FUN_M6B_r2_00000__0444();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_r2_00000__10ee();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__1062 @ M6B_r2_00000::1062 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__1062(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__16ea(0,5,0x44e);
  DAT_6074 = *DAT_70ba;
  FUN_M6B_r2_00000__0444();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay  :     samples" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $1388 $0000 $0000 ->$10EE ->$10C8
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_r2_00000__10ee();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__10c8 @ M6B_r2_00000::10c8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__10c8(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70ba = DAT_6074;
  API_FC82();
  API_FE40((char)((ushort)*DAT_70ba >> 8),(char)*DAT_70ba,param_1,DAT_70c2 + 0x10);
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__10ee @ M6B_r2_00000::10ee =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__10ee(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M6B_r2_00000__1103 @ M6B_r2_00000::1103 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M6B_r2_00000__1103(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_70c4 = *DAT_70ba;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70c4 >> 8),(char)DAT_70c4,param_3,DAT_70c0);
  return;
}


// ===== FUN_M6B_r2_00000__1147 @ M6B_r2_00000::1147 =====

void __h3000 FUN_M6B_r2_00000__1147(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$11A4 ->$116B */
  API_FE6A(param_1,param_2,&PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121);
  return;
}


// ===== FUN_M6B_r2_00000__1153 @ M6B_r2_00000::1153 =====

void __h3000 FUN_M6B_r2_00000__1153(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$11A4 ->$116B */
                    /* inline[API_FDBC]: "5.94...!" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121);
  return;
}


// ===== FUN_M6B_r2_00000__115f @ M6B_r2_00000::115f =====

void __h3000 FUN_M6B_r2_00000__115f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$11A4 ->$116B */
  API_FE6C(param_1,param_2,&PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121);
  return;
}


// ===== FUN_M6B_r2_00000__116b @ M6B_r2_00000::116b =====

void __h3000 FUN_M6B_r2_00000__116b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$11A4 ->$116B */
  API_FE6E(param_1,param_2,&PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121);
  return;
}


// ===== FUN_M6B_r2_00000__1177 @ M6B_r2_00000::1177 =====

void __h3000 FUN_M6B_r2_00000__1177(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$11A4 ->$116B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121);
  return;
}


// ===== FUN_M6B_r2_00000__1183 @ M6B_r2_00000::1183 =====

void __h3000 FUN_M6B_r2_00000__1183(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$11A4 ->$116B $115F */
  API_FE1A(param_1,param_2,&PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121);
  return;
}


// ===== FUN_M6B_r2_00000__11a4 @ M6B_r2_00000::11a4 =====

undefined2 __h3000 FUN_M6B_r2_00000__11a4(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7004;
  *(short *)(in_U + -2) = sVar1;
  DAT_70c4 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70c4) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M6B_r2_00000__11f9 @ M6B_r2_00000::11f9 =====

void __h3000 FUN_M6B_r2_00000__11f9(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__123e_M6B_r2_00000__11d3);
  return;
}


// ===== FUN_M6B_r2_00000__1205 @ M6B_r2_00000::1205 =====

void __h3000 FUN_M6B_r2_00000__1205(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$123E ->$121D */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__123e_M6B_r2_00000__11d3);
  return;
}


// ===== FUN_M6B_r2_00000__1211 @ M6B_r2_00000::1211 =====

void __h3000 FUN_M6B_r2_00000__1211(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__123e_M6B_r2_00000__11d3);
  return;
}


// ===== FUN_M6B_r2_00000__121d @ M6B_r2_00000::121d =====

void __h3000 FUN_M6B_r2_00000__121d(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__123e_M6B_r2_00000__11d3);
  return;
}


// ===== FUN_M6B_r2_00000__123e @ M6B_r2_00000::123e =====

undefined2 __h3000 FUN_M6B_r2_00000__123e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__123e_M6B_r2_00000__11d3);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__1274 @ M6B_r2_00000::1274 =====

void __h3000 FUN_M6B_r2_00000__1274(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__12b9_M6B_r2_00000__124e);
  return;
}


// ===== FUN_M6B_r2_00000__1280 @ M6B_r2_00000::1280 =====

void __h3000 FUN_M6B_r2_00000__1280(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$12B9 ->$1298 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__12b9_M6B_r2_00000__124e);
  return;
}


// ===== FUN_M6B_r2_00000__128c @ M6B_r2_00000::128c =====

void __h3000 FUN_M6B_r2_00000__128c(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__12b9_M6B_r2_00000__124e);
  return;
}


// ===== FUN_M6B_r2_00000__1298 @ M6B_r2_00000::1298 =====

void __h3000 FUN_M6B_r2_00000__1298(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__12b9_M6B_r2_00000__124e);
  return;
}


// ===== FUN_M6B_r2_00000__12b9 @ M6B_r2_00000::12b9 =====

undefined2 __h3000 FUN_M6B_r2_00000__12b9(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__12b9_M6B_r2_00000__124e);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__12ef @ M6B_r2_00000::12ef =====

void __h3000 FUN_M6B_r2_00000__12ef(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__1334_M6B_r2_00000__12c9);
  return;
}


// ===== FUN_M6B_r2_00000__12fb @ M6B_r2_00000::12fb =====

void __h3000 FUN_M6B_r2_00000__12fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1334 ->$1313 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__1334_M6B_r2_00000__12c9);
  return;
}


// ===== FUN_M6B_r2_00000__1307 @ M6B_r2_00000::1307 =====

void __h3000 FUN_M6B_r2_00000__1307(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__1334_M6B_r2_00000__12c9);
  return;
}


// ===== FUN_M6B_r2_00000__1313 @ M6B_r2_00000::1313 =====

void __h3000 FUN_M6B_r2_00000__1313(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__1334_M6B_r2_00000__12c9);
  return;
}


// ===== FUN_M6B_r2_00000__1334 @ M6B_r2_00000::1334 =====

undefined2 __h3000 FUN_M6B_r2_00000__1334(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__1334_M6B_r2_00000__12c9);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__136a @ M6B_r2_00000::136a =====

void __h3000 FUN_M6B_r2_00000__136a(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6B_r2_00000__13af_M6B_r2_00000__1344);
  return;
}


// ===== FUN_M6B_r2_00000__1376 @ M6B_r2_00000::1376 =====

void __h3000 FUN_M6B_r2_00000__1376(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$13AF ->$138E */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6B_r2_00000__13af_M6B_r2_00000__1344);
  return;
}


// ===== FUN_M6B_r2_00000__1382 @ M6B_r2_00000::1382 =====

void __h3000 FUN_M6B_r2_00000__1382(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6B_r2_00000__13af_M6B_r2_00000__1344);
  return;
}


// ===== FUN_M6B_r2_00000__138e @ M6B_r2_00000::138e =====

void __h3000 FUN_M6B_r2_00000__138e(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6B_r2_00000__13af_M6B_r2_00000__1344);
  return;
}


// ===== FUN_M6B_r2_00000__13af @ M6B_r2_00000::13af =====

undefined2 __h3000 FUN_M6B_r2_00000__13af(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6B_r2_00000__13af_M6B_r2_00000__1344);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M6B_r2_00000__13bf @ M6B_r2_00000::13bf =====

undefined2 __h3000 FUN_M6B_r2_00000__13bf(void)

{
  undefined2 in_D;
  
                    /* inline[at:M6B_r2_00000::1671]: $707E $7082 $7080 $7084 $70A2 $708E $7090
                       $7092 $7094 $7096 */
  FUN_M6B_r2_00000__1671();
  if (DAT_70da != -1) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_708e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7090 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7092 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7094 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7096 >> 8));
    API_FD20(0);
    API_FD2E(0xff);
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_708e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7090 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7092 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7094 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7096 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7098 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_709a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_709c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_709e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70a0 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70da >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__1518 @ M6B_r2_00000::1518 =====

undefined2 __h3000 FUN_M6B_r2_00000__1518(void)

{
  undefined2 in_D;
  
                    /* inline[at:M6B_r2_00000::1671]: $7086 $708A $7088 $708C $70A4 $7098 $709A
                       $709C $709E $70A0 */
  FUN_M6B_r2_00000__1671();
  if (DAT_70da != 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7098 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_709a >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_709c >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_709e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70a0 >> 8));
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7098 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_709a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_709c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_709e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70a0 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_708e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7090 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7092 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7094 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7096 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70da >> 8));
  return in_D;
}


// ===== FUN_M6B_r2_00000__1671 @ M6B_r2_00000::1671 =====

undefined2 __h3000 FUN_M6B_r2_00000__1671(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined2 *puVar2;
  undefined2 *puVar3;
  undefined2 *puVar4;
  short in_U;
  short *psVar5;
  undefined2 *local_res0;
  
  puVar2 = local_res0 + 1;
  DAT_70a8 = (short *)(&UNK_M6B_r2_00000__17c3 +
                      g_moduleBase +
                      (((((*(ushort *)*local_res0 & 0xff) * 0x1c - *(short *)*puVar2) -
                        *(short *)*puVar2) - *(short *)*puVar2) - *(short *)*puVar2));
  puVar2 = local_res0 + 3;
  DAT_70aa = (undefined2 *)
             (&UNK_M6B_r2_00000__1833 +
             g_moduleBase +
             (((((((*(ushort *)local_res0[2] & 0xff) * 0x2a - *(short *)*puVar2) - *(short *)*puVar2
                 ) - *(short *)*puVar2) - *(short *)*puVar2) - *(short *)*puVar2) -
             *(short *)*puVar2));
  DAT_70b4 = *(undefined2 *)local_res0[4];
  psVar5 = DAT_70a8 + 1;
  *(short *)local_res0[5] = *DAT_70a8 + *DAT_70a8;
  puVar3 = local_res0 + 7;
  *(short *)local_res0[6] = *psVar5;
  puVar2 = DAT_70aa + 1;
  uVar1 = *DAT_70aa;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70b4;
  *(char *)(in_U + -3) = (char)DAT_70b4;
  psVar5 = (short *)(in_U + -4);
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  *(short *)*puVar3 = *psVar5 + -0x7fff;
  puVar4 = puVar3 + 2;
  *(undefined2 *)puVar3[1] = *puVar2;
  uVar1 = puVar2[1];
  *(char *)((short)psVar5 + 1) = (char)uVar1;
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70b4;
  *(char *)((short)psVar5 + -1) = (char)DAT_70b4;
  psVar5 = psVar5 + -1;
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  *(short *)*puVar4 = *psVar5;
  return in_D;
}


// ===== FUN_M6B_r2_00000__16ea @ M6B_r2_00000::16ea =====

undefined2 __h3000 FUN_M6B_r2_00000__16ea(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_70c2 = in_D;
  DAT_70c0 = param_1;
  DAT_70ba = (short)&DAT_7046 + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70bc = CONCAT11(uVar1,(char)in_D << 1) + 0x4c;
  return in_D;
}


// ===== FUN_M6B_r2_00000__170c @ M6B_r2_00000::170c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__170c(void)

{
  undefined2 in_D;
  
  FUN_M6B_r2_00000__1747(0,0,1099);
  FUN_M6B_r2_00000__1747(0,1,0x44f);
  FUN_M6B_r2_00000__1747(0,2,0x450);
  FUN_M6B_r2_00000__1747(0,3,0x44c);
  FUN_M6B_r2_00000__1747(0,4,0x44d);
  FUN_M6B_r2_00000__1747(0,5,0x44e);
  return in_D;
}


// ===== FUN_M6B_r2_00000__170e @ M6B_r2_00000::170e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_r2_00000__170e(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6B_r2_00000__1747(0,0,1099);
  FUN_M6B_r2_00000__1747(0,1,0x44f);
  FUN_M6B_r2_00000__1747(0,2,0x450);
  FUN_M6B_r2_00000__1747(0,3,0x44c);
  FUN_M6B_r2_00000__1747(0,4,0x44d);
  FUN_M6B_r2_00000__1747(0,5,0x44e);
  return in_stack_00000000;
}


// ===== FUN_M6B_r2_00000__1747 @ M6B_r2_00000::1747 =====

undefined2 __h3000 FUN_M6B_r2_00000__1747(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70ba = (short)&DAT_7046 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70c0 = param_1;
  DAT_70c2 = in_D;
  FUN_M6B_r2_00000__1103();
  return in_D;
}


// ===== FUN_M6B_r2_00000__175f @ M6B_r2_00000::175f =====

undefined2 __h3000 FUN_M6B_r2_00000__175f(void)

{
  undefined2 in_D;
  char in_stack_00000000;
  undefined2 in_stack_00000001;
  
  DAT_70c8 = API_FD42();
  if (DAT_70c8 < 0) {
    API_FCC4((char)((ushort)DAT_70a6 >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E(0);
    DAT_70da = 0;
  }
  API_FD76();
  if (in_stack_00000000 < '\0') {
    in_D = in_stack_00000001;
  }
  return in_D;
}


// ===== FUN_M6B_r2_00000__1792 @ M6B_r2_00000::1792 =====

undefined2 __h3000 FUN_M6B_r2_00000__1792(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E(0xff);
  DAT_70da = 0xffff;
  return in_D;
}


