// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M77_r4_38000 M77_r4_38000::0000-M77_r4_38000::3fff, 190 functions
// Bank r4_38000 (module id 77, sub 00)

// ===== MODULE_77_01_entry @ M77_r4_38000::00f5 =====

undefined2 __h3000 MODULE_77_01_entry(void)

{
  undefined2 uVar1;
  byte extraout_CC;
  
                    /* inline[API_FC60]: $00F9 */
  uVar1 = ModuleSetBase();
  FUN_M77_r4_38000__0272();
  FUN_M77_r4_38000__020f();
  FUN_M77_r4_38000__0256();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  FUN_M77_r4_38000__0189();
  if (DAT_600a != 'w') {
    FUN_a2f1();
    FUN_M77_r4_38000__01b2();
    if ((extraout_CC >> 2 & 1) == 0) {
      LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
      LcdPrintInline();
      return uVar1;
    }
  }
  FUN_M77_r4_38000__030a();
  FUN_M77_r4_38000__0342();
  if (DAT_600a != 'w') {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M77_r4_38000__0583();
  API_FE10();
  return uVar1;
}


// ===== FUN_M77_r4_38000__0189 @ M77_r4_38000::0189 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M77_r4_38000__0189(void)

{
  byte *pbVar1;
  undefined2 in_D;
  
  pbVar1 = MODULE_77_02_CODE_hdr.extra + g_moduleBase + -4;
  API_FD08((char)((ushort)pbVar1 >> 8),(char)pbVar1,FUN_M77_r4_38000__1764 + g_moduleBase,&LAB_6600,
           pbVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M77_r4_38000__01b2 @ M77_r4_38000::01b2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x01c6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M77_r4_38000__01b2(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DspLoadProgram();
  if ((((extraout_CC >> 2 & 1) != 0) &&
      (DspLoadProgram(uVar1,(char)in_D,0x7711), (extraout_CC_00 >> 2 & 1) != 0)) &&
     (DspLoadProgram(uVar1,(char)in_D,0x7712), (extraout_CC_01 >> 2 & 1) != 0)) {
    API_FD3C(0);
    API_FD40();
    API_FD44();
    API_FD3A();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70c2 >> 8));
    API_FD7C();
  }
  return in_D;
}


// ===== FUN_M77_r4_38000__020f @ M77_r4_38000::020f =====

undefined2 __h3000 FUN_M77_r4_38000__020f(void)

{
  undefined2 in_D;
  
  DAT_701a = 0;
  DAT_7022 = 0;
  DAT_702a = 0;
  DAT_7032 = 0;
  DAT_703a = 0;
  DAT_70a2 = 0;
  DAT_709a = 0;
  DAT_7062 = 0;
  DAT_706a = 0;
  DAT_7072 = 0;
  DAT_707a = 0;
  DAT_7082 = 0;
  DAT_708a = 0;
  DAT_70aa = 0;
  DAT_7052 = 0;
  DAT_705a = 0;
  DAT_7042 = 0;
  DAT_7002 = 0;
  DAT_7008 = 0;
  DAT_700e = 0;
  DAT_7014 = 0;
  return in_D;
}


// ===== FUN_M77_r4_38000__0256 @ M77_r4_38000::0256 =====

undefined2 __h3000 FUN_M77_r4_38000__0256(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M77_r4_38000__15e3();
  FUN_M77_r4_38000__165e();
  FUN_M77_r4_38000__16d9();
  FUN_M77_r4_38000__1754();
  return in_D;
}


// ===== FUN_M77_r4_38000__0272 @ M77_r4_38000::0272 =====

undefined2 __h3000 FUN_M77_r4_38000__0272(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FE08]: 61:18 63:20 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 6B:40 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 65:28 67:30 69:38 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 6D:60 6F:68 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 71:70 73:78 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 75:80 77:88 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 79:98 7B:A0 81:A8 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 83:1E 85:26 9F:46 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 87:2E 89:36 8B:3E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 91:66 93:6E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 95:76 97:7E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 99:86 9B:8E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 8D:9E 8F:A6 9D:AE */
  LoadParamsScaled();
                    /* inline[API_FE08]: 7D:50 7F:58 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 19:00 1A:06 1B:0C 1C:12 */
  LoadParamsSigned();
  return uStack_8;
}


// ===== FUN_M77_r4_38000__030a @ M77_r4_38000::030a =====

undefined2 __h3000 FUN_M77_r4_38000__030a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M77_r4_38000__07cf();
  FUN_M77_r4_38000__087b();
  FUN_M77_r4_38000__0960();
  FUN_M77_r4_38000__0a0c();
  FUN_M77_r4_38000__0ac2();
  FUN_M77_r4_38000__0bb0();
  FUN_M77_r4_38000__0f2b();
  FUN_M77_r4_38000__0ff7();
  FUN_M77_r4_38000__10b0();
  FUN_M77_r4_38000__116f();
  FUN_M77_r4_38000__1228();
  FUN_M77_r4_38000__12de();
  FUN_M77_r4_38000__0ce1();
  FUN_M77_r4_38000__0ce1();
  FUN_M77_r4_38000__1346();
  FUN_M77_r4_38000__1422();
  FUN_M77_r4_38000__1501();
  return uStack_8;
}


// ===== FUN_M77_r4_38000__0342 @ M77_r4_38000::0342 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M77_r4_38000__0342(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 "  mix   " 21 $07A2 $07AE */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "feedback" 25 $084E $085A */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "swp rate" 29 $0920 $092C */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "env rate" 2D $09DF $09EB */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "adsrrate" 31 $0A95 $0AA1 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "botmfreq" 39 $0C30 $0C3C */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "top freq" 3D $0CB4 $0CC0 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 "adsr att" 41 $0EEB $0EF7 */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 "adsr dec" 45 $0FB7 $0FC3 */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "adsr sus" 49 $1083 $108F */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 "adsr rel" 4D $112F $113B */
  DefineParameter();
                    /* inline[API_FD84]: 0C 80 "a thresh" 51 $11FB $1207 */
  DefineParameter();
                    /* inline[API_FD84]: 0D 80 "r thresh" 55 $12B1 $12BD */
  DefineParameter();
                    /* inline[API_FE78]: 0E 80 "adsrtrig" 59 $1339 $074B */
  DefineParameterAlt();
  _DAT_60f5 = PTR_ARRAY_M77_r4_38000__046a;
  _DAT_60f7 = 0x15;
  DAT_6105 = 1;
  DAT_6106 = 0xa5;
  return in_D;
}


// ===== FUN_M77_r4_38000__0494 @ M77_r4_38000::0494 =====

void __h3000 FUN_M77_r4_38000__0494(void)

{
  FUN_M77_r4_38000__077e();
  FUN_M77_r4_38000__0583();
  API_FE10();
  return;
}


// ===== FUN_M77_r4_38000__049f @ M77_r4_38000::049f =====

void __h3000 FUN_M77_r4_38000__049f(void)

{
  FUN_M77_r4_38000__082a();
  FUN_M77_r4_38000__0583();
  API_FE12();
  return;
}


// ===== FUN_M77_r4_38000__04aa @ M77_r4_38000::04aa =====

void __h3000 FUN_M77_r4_38000__04aa(void)

{
  FUN_M77_r4_38000__08fc();
  FUN_M77_r4_38000__0583();
  FUN_M77_r4_38000__06af();
  API_FE14();
  return;
}


// ===== FUN_M77_r4_38000__04b8 @ M77_r4_38000::04b8 =====

void __h3000 FUN_M77_r4_38000__04b8(void)

{
  FUN_M77_r4_38000__09bb();
  FUN_M77_r4_38000__0583();
  FUN_M77_r4_38000__06d0();
  API_FE14();
  return;
}


// ===== FUN_M77_r4_38000__04c6 @ M77_r4_38000::04c6 =====

void __h3000 FUN_M77_r4_38000__04c6(void)

{
  FUN_M77_r4_38000__0a71();
  FUN_M77_r4_38000__0583();
  FUN_M77_r4_38000__06f1();
  API_FE14();
  return;
}


// ===== FUN_M77_r4_38000__04d4 @ M77_r4_38000::04d4 =====

void __h3000 FUN_M77_r4_38000__04d4(void)

{
  FUN_M77_r4_38000__0b74();
  FUN_M77_r4_38000__0583();
  API_FE16();
  return;
}


// ===== FUN_M77_r4_38000__04df @ M77_r4_38000::04df =====

void __h3000 FUN_M77_r4_38000__04df(void)

{
  FUN_M77_r4_38000__0c0c();
  FUN_M77_r4_38000__05c3();
  API_FE10();
  return;
}


// ===== FUN_M77_r4_38000__04ea @ M77_r4_38000::04ea =====

void __h3000 FUN_M77_r4_38000__04ea(void)

{
  FUN_M77_r4_38000__0c90();
  FUN_M77_r4_38000__05c3();
  API_FE12();
  return;
}


// ===== FUN_M77_r4_38000__04f5 @ M77_r4_38000::04f5 =====

void __h3000 FUN_M77_r4_38000__04f5(void)

{
  FUN_M77_r4_38000__0ec7();
  FUN_M77_r4_38000__0600();
  API_FE10();
  return;
}


// ===== FUN_M77_r4_38000__0500 @ M77_r4_38000::0500 =====

void __h3000 FUN_M77_r4_38000__0500(void)

{
  FUN_M77_r4_38000__0f93();
  FUN_M77_r4_38000__0600();
  API_FE12();
  return;
}


// ===== FUN_M77_r4_38000__050b @ M77_r4_38000::050b =====

void __h3000 FUN_M77_r4_38000__050b(void)

{
  FUN_M77_r4_38000__105f();
  FUN_M77_r4_38000__0600();
  API_FE14();
  return;
}


// ===== FUN_M77_r4_38000__0516 @ M77_r4_38000::0516 =====

void __h3000 FUN_M77_r4_38000__0516(void)

{
  FUN_M77_r4_38000__110b();
  FUN_M77_r4_38000__0600();
  API_FE16();
  return;
}


// ===== FUN_M77_r4_38000__0521 @ M77_r4_38000::0521 =====

void __h3000 FUN_M77_r4_38000__0521(void)

{
  FUN_M77_r4_38000__11d7();
  FUN_M77_r4_38000__063d();
  API_FE10();
  return;
}


// ===== FUN_M77_r4_38000__052c @ M77_r4_38000::052c =====

void __h3000 FUN_M77_r4_38000__052c(void)

{
  FUN_M77_r4_38000__128d();
  FUN_M77_r4_38000__063d();
  API_FE16();
  return;
}


// ===== FUN_M77_r4_38000__0537 @ M77_r4_38000::0537 =====

void __h3000 FUN_M77_r4_38000__0537(void)

{
  FUN_M77_r4_38000__1347();
  return;
}


// ===== FUN_M77_r4_38000__053b @ M77_r4_38000::053b =====

void __h3000 FUN_M77_r4_38000__053b(void)

{
  FUN_M77_r4_38000__13b0();
  FUN_M77_r4_38000__066c();
  API_FE14();
  return;
}


// ===== FUN_M77_r4_38000__0546 @ M77_r4_38000::0546 =====

void __h3000 FUN_M77_r4_38000__0546(void)

{
  FUN_M77_r4_38000__148f();
  FUN_M77_r4_38000__066c();
  API_FE12();
  return;
}


// ===== FUN_M77_r4_38000__0551 @ M77_r4_38000::0551 =====

void __h3000 FUN_M77_r4_38000__0551(void)

{
  FUN_M77_r4_38000__15aa();
  FUN_M77_r4_38000__0712();
  API_FE10();
  return;
}


// ===== FUN_M77_r4_38000__055c @ M77_r4_38000::055c =====

void __h3000 FUN_M77_r4_38000__055c(void)

{
  FUN_M77_r4_38000__1625();
  FUN_M77_r4_38000__0712();
  API_FE12();
  return;
}


// ===== FUN_M77_r4_38000__0567 @ M77_r4_38000::0567 =====

void __h3000 FUN_M77_r4_38000__0567(void)

{
  FUN_M77_r4_38000__16a0();
  FUN_M77_r4_38000__0712();
  API_FE14();
  return;
}


// ===== FUN_M77_r4_38000__0572 @ M77_r4_38000::0572 =====

void __h3000 FUN_M77_r4_38000__0572(void)

{
  FUN_M77_r4_38000__171b();
  FUN_M77_r4_38000__0712();
  API_FE16();
  return;
}


// ===== FUN_M77_r4_38000__0583 @ M77_r4_38000::0583 =====

void __h3000 FUN_M77_r4_38000__0583(void)

{
                    /* inline[API_FE02]: "  mix   " "feedback" "  rate  " "  mode  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0772 ->$081E ->$094D ->$0B68 ->$05C3 ->$05C3 */
  SetModuleHandlers();
  FUN_M77_r4_38000__1554();
  API_FDF2();
  return;
}


// ===== FUN_M77_r4_38000__05c3 @ M77_r4_38000::05c3 =====

void __h3000 FUN_M77_r4_38000__05c3(void)

{
                    /* inline[API_FE02]: "botmfreq" "top freq" " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C00 ->$0C84 ->$0712 ->$0600 ->$0583 ->$0583 */
  SetModuleHandlers();
  API_FDF2();
  return;
}


// ===== FUN_M77_r4_38000__0600 @ M77_r4_38000::0600 =====

void __h3000 FUN_M77_r4_38000__0600(void)

{
                    /* inline[API_FE02]: " attack " " decay  " "sustain " "release " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F18 ->$0FE4 ->$1053 ->$115C ->$063D ->$066C */
  SetModuleHandlers();
  API_FDF2();
  return;
}


// ===== FUN_M77_r4_38000__063d @ M77_r4_38000::063d =====

void __h3000 FUN_M77_r4_38000__063d(void)

{
                    /* inline[API_FE02]: "a thresh" [*] [*] "r thresh" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$11CB ->$074B ->$074B ->$1281 ->$066C ->$0600 */
  SetModuleHandlers();
  API_FDF2();
  return;
}


// ===== FUN_M77_r4_38000__066c @ M77_r4_38000::066c =====

void __h3000 FUN_M77_r4_38000__066c(void)

{
                    /* inline[API_FE02]: "env rate" "env type" "env chan" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$09AF ->$1477 ->$1398 ->$05C3 ->$0600 ->$063D */
  SetModuleHandlers();
  FUN_M77_r4_38000__14b6();
  FUN_M77_r4_38000__13d7();
  API_FDF2();
  return;
}


// ===== FUN_M77_r4_38000__06af @ M77_r4_38000::06af =====

void __h3000 FUN_M77_r4_38000__06af(void)

{
                    /* inline[API_FE02]: [-] [-] "swp rate" [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
  API_FDEE();
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(9);
  return;
}


// ===== FUN_M77_r4_38000__06d0 @ M77_r4_38000::06d0 =====

void __h3000 FUN_M77_r4_38000__06d0(void)

{
                    /* inline[API_FE02]: [-] [-] "env rate" [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
  API_FDEE();
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(9);
  return;
}


// ===== FUN_M77_r4_38000__06f1 @ M77_r4_38000::06f1 =====

void __h3000 FUN_M77_r4_38000__06f1(void)

{
                    /* inline[API_FE02]: [-] [-] "adsrrate" [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
  API_FDEE();
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(10);
  return;
}


// ===== FUN_M77_r4_38000__0712 @ M77_r4_38000::0712 =====

void __h3000 FUN_M77_r4_38000__0712(void)

{
                    /* inline[API_FE02]: "left in " "right in" "left out" "rightout" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$159E ->$1619 ->$1694 ->$170F ->$05C3 ->$05C3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M77_r4_38000__074b @ M77_r4_38000::074b =====

void __h3000 FUN_M77_r4_38000__074b(void)

{
  return;
}


// ===== FUN_M77_r4_38000__0772 @ M77_r4_38000::0772 =====

void __h3000 FUN_M77_r4_38000__0772(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$07CF ->$0796 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c);
  return;
}


// ===== FUN_M77_r4_38000__077e @ M77_r4_38000::077e =====

void __h3000 FUN_M77_r4_38000__077e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$07CF ->$0796 */
                    /* inline[API_FDBC]: "5.94...L" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c);
  return;
}


// ===== FUN_M77_r4_38000__078a @ M77_r4_38000::078a =====

void __h3000 FUN_M77_r4_38000__078a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$07CF ->$0796 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c);
  return;
}


// ===== FUN_M77_r4_38000__0796 @ M77_r4_38000::0796 =====

void __h3000 FUN_M77_r4_38000__0796(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$07CF ->$0796 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c);
  return;
}


// ===== FUN_M77_r4_38000__07a2 @ M77_r4_38000::07a2 =====

void __h3000 FUN_M77_r4_38000__07a2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$07CF ->$0796 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c);
  return;
}


// ===== FUN_M77_r4_38000__07ae @ M77_r4_38000::07ae =====

void __h3000 FUN_M77_r4_38000__07ae(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$07CF ->$0796 $078A */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c);
  return;
}


// ===== FUN_M77_r4_38000__07cf @ M77_r4_38000::07cf =====

undefined2 __h3000 FUN_M77_r4_38000__07cf(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 in_Y;
  short in_U;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_701c;
  *(char *)(in_U + -1) = (char)DAT_701c;
  puVar3 = (undefined2 *)(in_U + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar2 = *(undefined1 *)puVar3;
  DAT_70c2 = *puVar3;
  *puVar3 = in_Y;
  *(undefined1 *)((short)puVar3 + -1) = *(undefined1 *)((short)puVar3 + 1);
  *(undefined1 *)(puVar3 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__081e @ M77_r4_38000::081e =====

void __h3000 FUN_M77_r4_38000__081e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$087B ->$0842 */
  API_FE6A(param_1,param_2,0x7f8);
  return;
}


// ===== FUN_M77_r4_38000__082a @ M77_r4_38000::082a =====

void __h3000 FUN_M77_r4_38000__082a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$087B ->$0842 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,0x7f8);
  return;
}


// ===== FUN_M77_r4_38000__0836 @ M77_r4_38000::0836 =====

void __h3000 FUN_M77_r4_38000__0836(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$087B ->$0842 */
  API_FE6C(param_1,param_2,0x7f8);
  return;
}


// ===== FUN_M77_r4_38000__0842 @ M77_r4_38000::0842 =====

void __h3000 FUN_M77_r4_38000__0842(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$087B ->$0842 */
  API_FE6E(param_1,param_2,0x7f8);
  return;
}


// ===== FUN_M77_r4_38000__084e @ M77_r4_38000::084e =====

void __h3000 FUN_M77_r4_38000__084e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$087B ->$0842 */
  ParamDescriptorCall(param_1,param_2,0x7f8);
  return;
}


// ===== FUN_M77_r4_38000__085a @ M77_r4_38000::085a =====

void __h3000 FUN_M77_r4_38000__085a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$087B ->$0842 $0836 */
  API_FE1A(param_1,param_2,0x7f8);
  return;
}


// ===== FUN_M77_r4_38000__087b @ M77_r4_38000::087b =====

undefined2 __h3000 FUN_M77_r4_38000__087b(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_Y;
  short in_U;
  undefined2 *puVar3;
  short *psVar4;
  
  API_FE76();
  uVar2 = DAT_7024;
  *(char *)(in_U + -1) = (char)DAT_7024;
  puVar3 = (undefined2 *)(in_U + -2);
  *(char *)puVar3 = (char)((ushort)uVar2 >> 8);
  FUN_c0cd();
  DAT_70c2 = *puVar3;
  *(undefined1 *)((short)puVar3 + 1) = *(undefined1 *)((short)puVar3 + 1);
  *(undefined1 *)puVar3 = *(undefined1 *)puVar3;
  *(undefined1 *)((short)puVar3 + -1) = 0;
  psVar4 = puVar3 + -1;
  *(undefined1 *)psVar4 = 0x60;
  API_FCF2();
  API_FCC8();
  sVar1 = *psVar4;
  DAT_70c4 = 0x7fff - sVar1;
  *psVar4 = in_Y;
  psVar4 = psVar4 + -1;
  *psVar4 = 0x7fff - sVar1;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  psVar4[1] = psVar4[1];
  *(char *)((short)psVar4 + 1) = (char)*psVar4;
  *(undefined1 *)psVar4 = *(undefined1 *)psVar4;
  API_FD2E((char)((ushort)DAT_70c4 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__08f0 @ M77_r4_38000::08f0 =====

void __h3000 FUN_M77_r4_38000__08f0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0960 ->$0914 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca);
  return;
}


// ===== FUN_M77_r4_38000__08fc @ M77_r4_38000::08fc =====

void __h3000 FUN_M77_r4_38000__08fc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0960 ->$0914 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca);
  return;
}


// ===== FUN_M77_r4_38000__0908 @ M77_r4_38000::0908 =====

void __h3000 FUN_M77_r4_38000__0908(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0960 ->$0914 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca);
  return;
}


// ===== FUN_M77_r4_38000__0914 @ M77_r4_38000::0914 =====

void __h3000 FUN_M77_r4_38000__0914(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0960 ->$0914 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca);
  return;
}


// ===== FUN_M77_r4_38000__0920 @ M77_r4_38000::0920 =====

void __h3000 FUN_M77_r4_38000__0920(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0960 ->$0914 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca);
  return;
}


// ===== FUN_M77_r4_38000__092c @ M77_r4_38000::092c =====

void __h3000 FUN_M77_r4_38000__092c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0960 ->$0914 $0908 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca);
  return;
}


// ===== FUN_M77_r4_38000__094d @ M77_r4_38000::094d =====

undefined2 __h3000 FUN_M77_r4_38000__094d(void)

{
  undefined2 in_D;
  
  FUN_M77_r4_38000__08f0();
  DAT_6066 = 5;
  DAT_60dc = 0x32;
  return in_D;
}


// ===== FUN_M77_r4_38000__0960 @ M77_r4_38000::0960 =====

undefined2 __h3000 FUN_M77_r4_38000__0960(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 in_Y;
  short in_U;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_702c;
  *(char *)(in_U + -1) = (char)DAT_702c;
  puVar3 = (undefined2 *)(in_U + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c111();
  uVar2 = *(undefined1 *)puVar3;
  DAT_70c2 = *puVar3;
  *puVar3 = in_Y;
  *(undefined1 *)((short)puVar3 + -1) = *(undefined1 *)((short)puVar3 + 1);
  *(undefined1 *)(puVar3 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__09af @ M77_r4_38000::09af =====

void __h3000 FUN_M77_r4_38000__09af(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0A0C ->$09D3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989);
  return;
}


// ===== FUN_M77_r4_38000__09bb @ M77_r4_38000::09bb =====

void __h3000 FUN_M77_r4_38000__09bb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0A0C ->$09D3 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989);
  return;
}


// ===== FUN_M77_r4_38000__09c7 @ M77_r4_38000::09c7 =====

void __h3000 FUN_M77_r4_38000__09c7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0A0C ->$09D3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989);
  return;
}


// ===== FUN_M77_r4_38000__09d3 @ M77_r4_38000::09d3 =====

void __h3000 FUN_M77_r4_38000__09d3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0A0C ->$09D3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989);
  return;
}


// ===== FUN_M77_r4_38000__09df @ M77_r4_38000::09df =====

void __h3000 FUN_M77_r4_38000__09df(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0A0C ->$09D3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989);
  return;
}


// ===== FUN_M77_r4_38000__09eb @ M77_r4_38000::09eb =====

void __h3000 FUN_M77_r4_38000__09eb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0A0C ->$09D3 $09C7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989);
  return;
}


// ===== FUN_M77_r4_38000__0a0c @ M77_r4_38000::0a0c =====

undefined2 __h3000 FUN_M77_r4_38000__0a0c(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar4;
  undefined2 *puVar5;
  
  API_FE76();
  uVar1 = DAT_7034;
  *(char *)(in_U + -1) = (char)DAT_7034;
  puVar4 = (undefined1 *)(in_U + -2);
  *puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar2 = *puVar4;
  uVar3 = puVar4[1];
  puVar4[1] = uVar3;
  *puVar4 = uVar2;
  puVar4[-1] = uVar3;
  puVar5 = (undefined2 *)(puVar4 + -2);
  *(undefined1 *)puVar5 = uVar2;
  API_FCF2();
  uVar2 = *(undefined1 *)puVar5;
  DAT_70c2 = *puVar5;
  *puVar5 = in_Y;
  *(undefined1 *)((short)puVar5 + -1) = *(undefined1 *)((short)puVar5 + 1);
  *(undefined1 *)(puVar5 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__0a65 @ M77_r4_38000::0a65 =====

void __h3000 FUN_M77_r4_38000__0a65(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0AC2 ->$0A89 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f);
  return;
}


// ===== FUN_M77_r4_38000__0a71 @ M77_r4_38000::0a71 =====

void __h3000 FUN_M77_r4_38000__0a71(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0AC2 ->$0A89 */
                    /* inline[API_FDBC]: "5.94...?" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f);
  return;
}


// ===== FUN_M77_r4_38000__0a7d @ M77_r4_38000::0a7d =====

void __h3000 FUN_M77_r4_38000__0a7d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0AC2 ->$0A89 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f);
  return;
}


// ===== FUN_M77_r4_38000__0a89 @ M77_r4_38000::0a89 =====

void __h3000 FUN_M77_r4_38000__0a89(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0AC2 ->$0A89 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f);
  return;
}


// ===== FUN_M77_r4_38000__0a95 @ M77_r4_38000::0a95 =====

void __h3000 FUN_M77_r4_38000__0a95(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0AC2 ->$0A89 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f);
  return;
}


// ===== FUN_M77_r4_38000__0aa1 @ M77_r4_38000::0aa1 =====

void __h3000 FUN_M77_r4_38000__0aa1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0AC2 ->$0A89 $0A7D */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f);
  return;
}


// ===== FUN_M77_r4_38000__0ac2 @ M77_r4_38000::0ac2 =====

undefined2 __h3000 FUN_M77_r4_38000__0ac2(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  undefined2 in_Y;
  undefined2 uVar4;
  short in_U;
  undefined1 *puVar5;
  undefined2 *puVar6;
  
  API_FE76();
  uVar1 = DAT_703c;
  *(char *)(in_U + -1) = (char)DAT_703c;
  puVar5 = (undefined1 *)(in_U + -2);
  *puVar5 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  uVar2 = *puVar5;
  uVar3 = puVar5[1];
  puVar5[1] = uVar3;
  *puVar5 = uVar2;
  puVar5[-1] = uVar3;
  puVar5[-2] = uVar2;
  puVar5[-3] = uVar3;
  puVar5[-4] = uVar2;
  uVar1 = DAT_7064;
  puVar5[-5] = (char)DAT_7064;
  puVar6 = (undefined2 *)(puVar5 + -6);
  *(char *)puVar6 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  API_FCF2();
  uVar2 = *(undefined1 *)puVar6;
  DAT_70c2 = *puVar6;
  *puVar6 = in_Y;
  *(undefined1 *)((short)puVar6 + -1) = *(undefined1 *)((short)puVar6 + 1);
  puVar6 = puVar6 + -1;
  *(undefined1 *)puVar6 = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  uVar1 = DAT_706c;
  uVar4 = puVar6[1];
  *(char *)((short)puVar6 + 3) = (char)DAT_706c;
  puVar6 = puVar6 + 1;
  *(char *)puVar6 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  API_FCF2();
  uVar2 = *(undefined1 *)puVar6;
  DAT_70c2 = *puVar6;
  *puVar6 = uVar4;
  *(undefined1 *)((short)puVar6 + -1) = *(undefined1 *)((short)puVar6 + 1);
  puVar6 = puVar6 + -1;
  *(undefined1 *)puVar6 = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  uVar1 = DAT_707c;
  uVar4 = puVar6[1];
  *(char *)((short)puVar6 + 3) = (char)DAT_707c;
  puVar6 = puVar6 + 1;
  *(char *)puVar6 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  API_FCF2();
  uVar2 = *(undefined1 *)puVar6;
  DAT_70c2 = *puVar6;
  *puVar6 = uVar4;
  *(undefined1 *)((short)puVar6 + -1) = *(undefined1 *)((short)puVar6 + 1);
  *(undefined1 *)(puVar6 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__0b68 @ M77_r4_38000::0b68 =====

void __h3000 FUN_M77_r4_38000__0b68(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M77_r4_38000__0b42);
  return;
}


// ===== FUN_M77_r4_38000__0b74 @ M77_r4_38000::0b74 =====

void __h3000 FUN_M77_r4_38000__0b74(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M77_r4_38000__0b42);
  return;
}


// ===== FUN_M77_r4_38000__0b80 @ M77_r4_38000::0b80 =====

void __h3000 FUN_M77_r4_38000__0b80(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M77_r4_38000__0b42);
  return;
}


// ===== FUN_M77_r4_38000__0b8c @ M77_r4_38000::0b8c =====

void __h3000 FUN_M77_r4_38000__0b8c(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M77_r4_38000__0b42);
  FUN_M77_r4_38000__1554();
  return;
}


// ===== FUN_M77_r4_38000__0bb0 @ M77_r4_38000::0bb0 =====

undefined2 __h3000 FUN_M77_r4_38000__0bb0(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  undefined2 in_Y;
  short in_U;
  
  uVar1 = API_FE76();
  *(undefined2 *)(in_U + -2) = in_Y;
  *(char *)(in_U + -3) = (char)uVar1;
  *(char *)(in_U + -4) = (char)((ushort)uVar1 >> 8);
  API_FD2E((char)((ushort)DAT_7044 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__0c00 @ M77_r4_38000::0c00 =====

void __h3000 FUN_M77_r4_38000__0c00(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0CE1 ->$0C24 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda);
  return;
}


// ===== FUN_M77_r4_38000__0c0c @ M77_r4_38000::0c0c =====

void __h3000 FUN_M77_r4_38000__0c0c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0CE1 ->$0C24 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda);
  return;
}


// ===== FUN_M77_r4_38000__0c18 @ M77_r4_38000::0c18 =====

void __h3000 FUN_M77_r4_38000__0c18(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0CE1 ->$0C24 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda);
  return;
}


// ===== FUN_M77_r4_38000__0c24 @ M77_r4_38000::0c24 =====

void __h3000 FUN_M77_r4_38000__0c24(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0CE1 ->$0C24 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda);
  return;
}


// ===== FUN_M77_r4_38000__0c30 @ M77_r4_38000::0c30 =====

void __h3000 FUN_M77_r4_38000__0c30(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0CE1 ->$0C24 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda);
  return;
}


// ===== FUN_M77_r4_38000__0c3c @ M77_r4_38000::0c3c =====

void __h3000 FUN_M77_r4_38000__0c3c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0CE1 ->$0C24 $0C18 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda);
  return;
}


// ===== FUN_M77_r4_38000__0c84 @ M77_r4_38000::0c84 =====

void __h3000 FUN_M77_r4_38000__0c84(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0CE1 ->$0CA8 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  return;
}


// ===== FUN_M77_r4_38000__0c90 @ M77_r4_38000::0c90 =====

void __h3000 FUN_M77_r4_38000__0c90(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0CE1 ->$0CA8 */
                    /* inline[API_FDBC]: "5.94...^" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  return;
}


// ===== FUN_M77_r4_38000__0c9c @ M77_r4_38000::0c9c =====

void __h3000 FUN_M77_r4_38000__0c9c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0CE1 ->$0CA8 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  return;
}


// ===== FUN_M77_r4_38000__0ca8 @ M77_r4_38000::0ca8 =====

void __h3000 FUN_M77_r4_38000__0ca8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0CE1 ->$0CA8 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  return;
}


// ===== FUN_M77_r4_38000__0cb4 @ M77_r4_38000::0cb4 =====

void __h3000 FUN_M77_r4_38000__0cb4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0CE1 ->$0CA8 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  return;
}


// ===== FUN_M77_r4_38000__0cc0 @ M77_r4_38000::0cc0 =====

void __h3000 FUN_M77_r4_38000__0cc0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0CE1 ->$0CA8 $0C9C */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  return;
}


// ===== FUN_M77_r4_38000__0ce1 @ M77_r4_38000::0ce1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M77_r4_38000__0ce1(void)

{
  short sVar1;
  undefined1 uVar2;
  undefined2 uVar3;
  undefined1 uVar4;
  short in_U;
  undefined2 *puVar5;
  
  uVar3 = API_FE76();
  API_FE76((char)((ushort)uVar3 >> 8),(char)uVar3,&PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e);
  sVar1 = DAT_70a4;
  *(char *)(in_U + -1) = (char)DAT_70a4;
  puVar5 = (undefined2 *)(in_U + -2);
  *(char *)puVar5 = (char)((ushort)sVar1 >> 8);
  FUN_c0ef();
  uVar4 = (undefined1)*puVar5;
  *(undefined1 *)((short)puVar5 + 1) = uVar4;
  uVar2 = (undefined1)((ushort)*puVar5 >> 8);
  *(undefined1 *)puVar5 = uVar2;
  *(undefined1 *)((short)puVar5 + -1) = uVar4;
  *(undefined1 *)(puVar5 + -1) = uVar2;
  *(undefined1 *)((short)puVar5 + -3) = uVar4;
  puVar5 = puVar5 + -2;
  *(undefined1 *)puVar5 = uVar2;
  MODULE_77_02_entry();
  DAT_70b0 = *puVar5;
  puVar5 = puVar5 + 1;
  FUN_M77_r4_38000__1979();
  DAT_70b2 = *puVar5;
  puVar5 = puVar5 + 1;
  FUN_M77_r4_38000__1b81();
  sVar1 = DAT_709c;
  DAT_70b4 = *puVar5;
  *(char *)((short)puVar5 + 1) = (char)DAT_709c;
  *(char *)puVar5 = (char)((ushort)sVar1 >> 8);
  FUN_c0ef();
  uVar4 = (undefined1)*puVar5;
  *(undefined1 *)((short)puVar5 + 1) = uVar4;
  uVar2 = (undefined1)((ushort)*puVar5 >> 8);
  *(undefined1 *)puVar5 = uVar2;
  *(undefined1 *)((short)puVar5 + -1) = uVar4;
  *(undefined1 *)(puVar5 + -1) = uVar2;
  *(undefined1 *)((short)puVar5 + -3) = uVar4;
  puVar5 = puVar5 + -2;
  *(undefined1 *)puVar5 = uVar2;
  MODULE_77_02_entry();
  DAT_70b6 = *puVar5;
  puVar5 = puVar5 + 1;
  FUN_M77_r4_38000__1979();
  DAT_70b8 = *puVar5;
  puVar5 = puVar5 + 1;
  FUN_M77_r4_38000__1b81();
  DAT_70ba = *puVar5;
  if (-1 < DAT_70a4 - DAT_709c) {
    FUN_M77_r4_38000__0dda((char)((ushort)(DAT_70a4 - DAT_709c) >> 8));
    return;
  }
  FUN_M77_r4_38000__0d53();
  return;
}


// ===== FUN_M77_r4_38000__0d53 @ M77_r4_38000::0d53 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M77_r4_38000__0d53
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5
          )

{
  short sVar1;
  short *psVar2;
  
  DAT_70bc = DAT_70b0 - DAT_70b6;
  DAT_70be = DAT_70b2 - DAT_70b8;
  sVar1 = DAT_70b4 - DAT_70ba;
  DAT_70c0 = sVar1;
  *(undefined2 *)(param_5 + -2) = param_4;
  psVar2 = (short *)(param_5 + -4);
  *psVar2 = sVar1;
  API_FD2E((char)((ushort)DAT_70b6 >> 8),(char)DAT_70b6,param_3,0x6e);
  psVar2[1] = psVar2[1];
  *(char *)((short)psVar2 + 1) = (char)*psVar2;
  *(char *)psVar2 = (char)((ushort)*psVar2 >> 8);
  API_FD2E((char)((ushort)DAT_70b8 >> 8),(char)DAT_70b8,param_3,0x6f);
  psVar2[1] = psVar2[1];
  *(char *)((short)psVar2 + 1) = (char)*psVar2;
  *(char *)psVar2 = (char)((ushort)*psVar2 >> 8);
  API_FD2E((char)((ushort)DAT_70ba >> 8),(char)DAT_70ba,param_3,0x70);
  psVar2[1] = psVar2[1];
  *(char *)((short)psVar2 + 1) = (char)*psVar2;
  *(char *)psVar2 = (char)((ushort)*psVar2 >> 8);
  API_FD2E((char)((ushort)DAT_70bc >> 8),(char)DAT_70bc,param_3,0x71);
  psVar2[1] = psVar2[1];
  *(char *)((short)psVar2 + 1) = (char)*psVar2;
  *(char *)psVar2 = (char)((ushort)*psVar2 >> 8);
  API_FD2E((char)((ushort)DAT_70be >> 8),(char)DAT_70be,param_3,0x72);
  psVar2[1] = psVar2[1];
  *(char *)((short)psVar2 + 1) = (char)*psVar2;
  *(char *)psVar2 = (char)((ushort)*psVar2 >> 8);
  API_FD2E((char)((ushort)DAT_70c0 >> 8),(char)DAT_70c0,param_3,0x73);
  psVar2[1] = psVar2[1];
  *(char *)((short)psVar2 + 1) = (char)*psVar2;
  *(char *)psVar2 = (char)((ushort)*psVar2 >> 8);
  API_FD2E(0,10,param_3,0x7e);
  FUN_M77_r4_38000__0e92((char)((ushort)*psVar2 >> 8),(char)*psVar2,param_3,psVar2[1],psVar2 + 2);
  return;
}


// ===== FUN_M77_r4_38000__0dda @ M77_r4_38000::0dda =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M77_r4_38000__0dda
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5
          )

{
  undefined1 uVar1;
  undefined1 uVar2;
  short sVar3;
  short *psVar4;
  
  DAT_70bc = DAT_70b6 - DAT_70b0;
  DAT_70be = DAT_70b8 - DAT_70b2;
  sVar3 = DAT_70ba - DAT_70b4;
  DAT_70c0 = sVar3;
  *(undefined2 *)(param_5 + -2) = param_4;
  psVar4 = (short *)(param_5 + -4);
  *psVar4 = sVar3;
  API_FD2E((char)((ushort)DAT_70b0 >> 8),(char)DAT_70b0,param_3,0x6e);
  psVar4[1] = psVar4[1];
  *(char *)((short)psVar4 + 1) = (char)*psVar4;
  *(char *)psVar4 = (char)((ushort)*psVar4 >> 8);
  API_FD2E((char)((ushort)DAT_70b2 >> 8),(char)DAT_70b2,param_3,0x6f);
  psVar4[1] = psVar4[1];
  *(char *)((short)psVar4 + 1) = (char)*psVar4;
  *(char *)psVar4 = (char)((ushort)*psVar4 >> 8);
  API_FD2E((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_3,0x70);
  psVar4[1] = psVar4[1];
  *(char *)((short)psVar4 + 1) = (char)*psVar4;
  *(char *)psVar4 = (char)((ushort)*psVar4 >> 8);
  API_FD2E((char)((ushort)DAT_70bc >> 8),(char)DAT_70bc,param_3,0x71);
  psVar4[1] = psVar4[1];
  *(char *)((short)psVar4 + 1) = (char)*psVar4;
  *(char *)psVar4 = (char)((ushort)*psVar4 >> 8);
  API_FD2E((char)((ushort)DAT_70be >> 8),(char)DAT_70be,param_3,0x72);
  psVar4[1] = psVar4[1];
  *(char *)((short)psVar4 + 1) = (char)*psVar4;
  *(char *)psVar4 = (char)((ushort)*psVar4 >> 8);
  API_FD2E((char)((ushort)DAT_70c0 >> 8),(char)DAT_70c0,param_3,0x73);
  sVar3 = psVar4[1];
  uVar2 = (undefined1)DAT_7044;
  uVar1 = (undefined1)((ushort)DAT_7044 >> 8);
  if (DAT_7044 + -1 < 0) {
    psVar4[1] = sVar3;
    *(undefined1 *)((short)psVar4 + 1) = uVar2;
    *(undefined1 *)psVar4 = uVar1;
    API_FD2E(0,0x16,param_3,0x7e);
    FUN_M77_r4_38000__0e92((char)((ushort)*psVar4 >> 8),(char)*psVar4,param_3,psVar4[1],psVar4 + 2);
    return;
  }
  if (DAT_7044 != 1) {
    psVar4[1] = sVar3;
    *(undefined1 *)((short)psVar4 + 1) = uVar2;
    *(undefined1 *)psVar4 = uVar1;
    API_FD2E(0,0x1c,param_3,0x7e);
    FUN_M77_r4_38000__0e92((char)((ushort)*psVar4 >> 8),(char)*psVar4,param_3,psVar4[1],psVar4 + 2);
    return;
  }
  psVar4[1] = sVar3;
  *(undefined1 *)((short)psVar4 + 1) = 1;
  *(undefined1 *)psVar4 = 0;
  API_FD2E(0,0x1a,param_3,0x7e);
  FUN_M77_r4_38000__0e92((char)((ushort)*psVar4 >> 8),(char)*psVar4,param_3,psVar4[1],psVar4 + 2);
  return;
}


// ===== FUN_M77_r4_38000__0e92 @ M77_r4_38000::0e92 =====

undefined2 __h3000 FUN_M77_r4_38000__0e92(void)

{
  undefined2 in_stack_00000000;
  
  return in_stack_00000000;
}


// ===== FUN_M77_r4_38000__0ebb @ M77_r4_38000::0ebb =====

void __h3000 FUN_M77_r4_38000__0ebb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F2B ->$0EDF */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95);
  return;
}


// ===== FUN_M77_r4_38000__0ec7 @ M77_r4_38000::0ec7 =====

void __h3000 FUN_M77_r4_38000__0ec7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F2B ->$0EDF */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95);
  return;
}


// ===== FUN_M77_r4_38000__0ed3 @ M77_r4_38000::0ed3 =====

void __h3000 FUN_M77_r4_38000__0ed3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F2B ->$0EDF */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95);
  return;
}


// ===== FUN_M77_r4_38000__0edf @ M77_r4_38000::0edf =====

void __h3000 FUN_M77_r4_38000__0edf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0F2B ->$0EDF */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95);
  return;
}


// ===== FUN_M77_r4_38000__0eeb @ M77_r4_38000::0eeb =====

void __h3000 FUN_M77_r4_38000__0eeb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F2B ->$0EDF */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95);
  return;
}


// ===== FUN_M77_r4_38000__0ef7 @ M77_r4_38000::0ef7 =====

void __h3000 FUN_M77_r4_38000__0ef7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F2B ->$0EDF $0ED3 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95);
  return;
}


// ===== FUN_M77_r4_38000__0f18 @ M77_r4_38000::0f18 =====

undefined2 __h3000 FUN_M77_r4_38000__0f18(void)

{
  undefined2 in_D;
  
  FUN_M77_r4_38000__0ebb();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M77_r4_38000__0f2b @ M77_r4_38000::0f2b =====

undefined2 __h3000 FUN_M77_r4_38000__0f2b(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar3;
  undefined2 *puVar4;
  
  API_FE76();
  uVar1 = DAT_7064;
  *(char *)(in_U + -1) = (char)DAT_7064;
  puVar3 = (undefined1 *)(in_U + -2);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c111();
  uVar1 = DAT_703c;
  puVar3[-1] = (char)DAT_703c;
  puVar4 = (undefined2 *)(puVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  API_FCF2();
  uVar2 = *(undefined1 *)puVar4;
  DAT_70c2 = *puVar4;
  *puVar4 = in_Y;
  *(undefined1 *)((short)puVar4 + -1) = *(undefined1 *)((short)puVar4 + 1);
  *(undefined1 *)(puVar4 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__0f87 @ M77_r4_38000::0f87 =====

void __h3000 FUN_M77_r4_38000__0f87(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0FF7 ->$0FAB */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61);
  return;
}


// ===== FUN_M77_r4_38000__0f93 @ M77_r4_38000::0f93 =====

void __h3000 FUN_M77_r4_38000__0f93(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0FF7 ->$0FAB */
                    /* inline[API_FDBC]: "5.94...a" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61);
  return;
}


// ===== FUN_M77_r4_38000__0f9f @ M77_r4_38000::0f9f =====

void __h3000 FUN_M77_r4_38000__0f9f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0FF7 ->$0FAB */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61);
  return;
}


// ===== FUN_M77_r4_38000__0fab @ M77_r4_38000::0fab =====

void __h3000 FUN_M77_r4_38000__0fab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0FF7 ->$0FAB */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61);
  return;
}


// ===== FUN_M77_r4_38000__0fb7 @ M77_r4_38000::0fb7 =====

void __h3000 FUN_M77_r4_38000__0fb7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0FF7 ->$0FAB */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61);
  return;
}


// ===== FUN_M77_r4_38000__0fc3 @ M77_r4_38000::0fc3 =====

void __h3000 FUN_M77_r4_38000__0fc3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0FF7 ->$0FAB $0F9F */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61);
  return;
}


// ===== FUN_M77_r4_38000__0fe4 @ M77_r4_38000::0fe4 =====

undefined2 __h3000 FUN_M77_r4_38000__0fe4(void)

{
  undefined2 in_D;
  
  FUN_M77_r4_38000__0f87();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M77_r4_38000__0ff7 @ M77_r4_38000::0ff7 =====

undefined2 __h3000 FUN_M77_r4_38000__0ff7(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar3;
  undefined2 *puVar4;
  
  API_FE76();
  uVar1 = DAT_706c;
  *(char *)(in_U + -1) = (char)DAT_706c;
  puVar3 = (undefined1 *)(in_U + -2);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c111();
  uVar1 = DAT_703c;
  puVar3[-1] = (char)DAT_703c;
  puVar4 = (undefined2 *)(puVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  API_FCF2();
  uVar2 = *(undefined1 *)puVar4;
  DAT_70c2 = *puVar4;
  *puVar4 = in_Y;
  *(undefined1 *)((short)puVar4 + -1) = *(undefined1 *)((short)puVar4 + 1);
  *(undefined1 *)(puVar4 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__1053 @ M77_r4_38000::1053 =====

void __h3000 FUN_M77_r4_38000__1053(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$10B0 ->$1077 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d);
  return;
}


// ===== FUN_M77_r4_38000__105f @ M77_r4_38000::105f =====

void __h3000 FUN_M77_r4_38000__105f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$10B0 ->$1077 */
                    /* inline[API_FDBC]: "5.94...-" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d);
  return;
}


// ===== FUN_M77_r4_38000__106b @ M77_r4_38000::106b =====

void __h3000 FUN_M77_r4_38000__106b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$10B0 ->$1077 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d);
  return;
}


// ===== FUN_M77_r4_38000__1077 @ M77_r4_38000::1077 =====

void __h3000 FUN_M77_r4_38000__1077(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$10B0 ->$1077 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d);
  return;
}


// ===== FUN_M77_r4_38000__1083 @ M77_r4_38000::1083 =====

void __h3000 FUN_M77_r4_38000__1083(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$10B0 ->$1077 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d);
  return;
}


// ===== FUN_M77_r4_38000__108f @ M77_r4_38000::108f =====

void __h3000 FUN_M77_r4_38000__108f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$10B0 ->$1077 $106B */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d);
  return;
}


// ===== FUN_M77_r4_38000__10b0 @ M77_r4_38000::10b0 =====

undefined2 __h3000 FUN_M77_r4_38000__10b0(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 in_Y;
  short in_U;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_7074;
  *(char *)(in_U + -1) = (char)DAT_7074;
  puVar3 = (undefined2 *)(in_U + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  uVar2 = *(undefined1 *)puVar3;
  DAT_70c2 = *puVar3;
  *puVar3 = in_Y;
  *(undefined1 *)((short)puVar3 + -1) = *(undefined1 *)((short)puVar3 + 1);
  *(undefined1 *)(puVar3 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__10ff @ M77_r4_38000::10ff =====

void __h3000 FUN_M77_r4_38000__10ff(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$116F ->$1123 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9);
  return;
}


// ===== FUN_M77_r4_38000__110b @ M77_r4_38000::110b =====

void __h3000 FUN_M77_r4_38000__110b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$116F ->$1123 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9);
  return;
}


// ===== FUN_M77_r4_38000__1117 @ M77_r4_38000::1117 =====

void __h3000 FUN_M77_r4_38000__1117(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$116F ->$1123 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9);
  return;
}


// ===== FUN_M77_r4_38000__1123 @ M77_r4_38000::1123 =====

void __h3000 FUN_M77_r4_38000__1123(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$116F ->$1123 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9);
  return;
}


// ===== FUN_M77_r4_38000__112f @ M77_r4_38000::112f =====

void __h3000 FUN_M77_r4_38000__112f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$116F ->$1123 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9);
  return;
}


// ===== FUN_M77_r4_38000__113b @ M77_r4_38000::113b =====

void __h3000 FUN_M77_r4_38000__113b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$116F ->$1123 $1117 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9);
  return;
}


// ===== FUN_M77_r4_38000__115c @ M77_r4_38000::115c =====

undefined2 __h3000 FUN_M77_r4_38000__115c(void)

{
  undefined2 in_D;
  
  FUN_M77_r4_38000__10ff();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M77_r4_38000__116f @ M77_r4_38000::116f =====

undefined2 __h3000 FUN_M77_r4_38000__116f(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar3;
  undefined2 *puVar4;
  
  API_FE76();
  uVar1 = DAT_707c;
  *(char *)(in_U + -1) = (char)DAT_707c;
  puVar3 = (undefined1 *)(in_U + -2);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c111();
  uVar1 = DAT_703c;
  puVar3[-1] = (char)DAT_703c;
  puVar4 = (undefined2 *)(puVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  API_FCF2();
  uVar2 = *(undefined1 *)puVar4;
  DAT_70c2 = *puVar4;
  *puVar4 = in_Y;
  *(undefined1 *)((short)puVar4 + -1) = *(undefined1 *)((short)puVar4 + 1);
  *(undefined1 *)(puVar4 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__11cb @ M77_r4_38000::11cb =====

void __h3000 FUN_M77_r4_38000__11cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1228 ->$11EF */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5);
  return;
}


// ===== FUN_M77_r4_38000__11d7 @ M77_r4_38000::11d7 =====

void __h3000 FUN_M77_r4_38000__11d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1228 ->$11EF */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5);
  return;
}


// ===== FUN_M77_r4_38000__11e3 @ M77_r4_38000::11e3 =====

void __h3000 FUN_M77_r4_38000__11e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1228 ->$11EF */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5);
  return;
}


// ===== FUN_M77_r4_38000__11ef @ M77_r4_38000::11ef =====

void __h3000 FUN_M77_r4_38000__11ef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1228 ->$11EF */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5);
  return;
}


// ===== FUN_M77_r4_38000__11fb @ M77_r4_38000::11fb =====

void __h3000 FUN_M77_r4_38000__11fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1228 ->$11EF */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5);
  return;
}


// ===== FUN_M77_r4_38000__1207 @ M77_r4_38000::1207 =====

void __h3000 FUN_M77_r4_38000__1207(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1228 ->$11EF $11E3 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5);
  return;
}


// ===== FUN_M77_r4_38000__1228 @ M77_r4_38000::1228 =====

undefined2 __h3000 FUN_M77_r4_38000__1228(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar4;
  undefined2 *puVar5;
  
  API_FE76();
  uVar1 = DAT_7084;
  *(char *)(in_U + -1) = (char)DAT_7084;
  puVar4 = (undefined1 *)(in_U + -2);
  *puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar2 = *puVar4;
  uVar3 = puVar4[1];
  puVar4[1] = uVar3;
  *puVar4 = uVar2;
  puVar4[-1] = uVar3;
  puVar5 = (undefined2 *)(puVar4 + -2);
  *(undefined1 *)puVar5 = uVar2;
  API_FCF2();
  uVar2 = *(undefined1 *)puVar5;
  DAT_70c2 = *puVar5;
  *puVar5 = in_Y;
  *(undefined1 *)((short)puVar5 + -1) = *(undefined1 *)((short)puVar5 + 1);
  *(undefined1 *)(puVar5 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__1281 @ M77_r4_38000::1281 =====

void __h3000 FUN_M77_r4_38000__1281(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$12DE ->$12A5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b);
  return;
}


// ===== FUN_M77_r4_38000__128d @ M77_r4_38000::128d =====

void __h3000 FUN_M77_r4_38000__128d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$12DE ->$12A5 */
                    /* inline[API_FDBC]: "5.94...[" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b);
  return;
}


// ===== FUN_M77_r4_38000__1299 @ M77_r4_38000::1299 =====

void __h3000 FUN_M77_r4_38000__1299(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$12DE ->$12A5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b);
  return;
}


// ===== FUN_M77_r4_38000__12a5 @ M77_r4_38000::12a5 =====

void __h3000 FUN_M77_r4_38000__12a5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$12DE ->$12A5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b);
  return;
}


// ===== FUN_M77_r4_38000__12b1 @ M77_r4_38000::12b1 =====

void __h3000 FUN_M77_r4_38000__12b1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$12DE ->$12A5 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b);
  return;
}


// ===== FUN_M77_r4_38000__12bd @ M77_r4_38000::12bd =====

void __h3000 FUN_M77_r4_38000__12bd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$12DE ->$12A5 $1299 */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b);
  return;
}


// ===== FUN_M77_r4_38000__12de @ M77_r4_38000::12de =====

undefined2 __h3000 FUN_M77_r4_38000__12de(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  undefined2 in_Y;
  short in_U;
  undefined1 *puVar4;
  undefined2 *puVar5;
  
  API_FE76();
  uVar1 = DAT_708c;
  *(char *)(in_U + -1) = (char)DAT_708c;
  puVar4 = (undefined1 *)(in_U + -2);
  *puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar2 = *puVar4;
  uVar3 = puVar4[1];
  puVar4[1] = uVar3;
  *puVar4 = uVar2;
  puVar4[-1] = uVar3;
  puVar5 = (undefined2 *)(puVar4 + -2);
  *(undefined1 *)puVar5 = uVar2;
  API_FCF2();
  uVar2 = *(undefined1 *)puVar5;
  DAT_70c2 = *puVar5;
  *puVar5 = in_Y;
  *(undefined1 *)((short)puVar5 + -1) = *(undefined1 *)((short)puVar5 + 1);
  *(undefined1 *)(puVar5 + -1) = uVar2;
  API_FD2E((char)((ushort)DAT_70c2 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__1339 @ M77_r4_38000::1339 =====

void __h3000 FUN_M77_r4_38000__1339(undefined1 param_1,undefined1 param_2)

{
  FUN_ef6c(param_1,param_2,&UNK_M77_r4_38000__1311);
  return;
}


// ===== FUN_M77_r4_38000__1346 @ M77_r4_38000::1346 =====

void __h3000 FUN_M77_r4_38000__1346(void)

{
  return;
}


// ===== FUN_M77_r4_38000__1347 @ M77_r4_38000::1347 =====

void __h3000 FUN_M77_r4_38000__1347(void)

{
  FUN_M77_r4_38000__134b();
  return;
}


// ===== FUN_M77_r4_38000__134b @ M77_r4_38000::134b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1356 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M77_r4_38000__134b(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  byte extraout_CC;
  
  *(undefined2 *)(param_3 + -2) = param_2;
  *(char *)(param_3 + -3) = (char)in_D;
  *(char *)(param_3 + -4) = (char)((ushort)in_D >> 8);
  API_FD2E(0,(char)in_D,param_1,0x7d);
  do {
    API_FD2C();
  } while ((extraout_CC >> 2 & 1) == 0);
  API_FD2A(0);
  return in_D;
}


// ===== FUN_M77_r4_38000__1398 @ M77_r4_38000::1398 =====

void __h3000 FUN_M77_r4_38000__1398(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  return;
}


// ===== FUN_M77_r4_38000__13a4 @ M77_r4_38000::13a4 =====

void __h3000 FUN_M77_r4_38000__13a4(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  return;
}


// ===== FUN_M77_r4_38000__13b0 @ M77_r4_38000::13b0 =====

void __h3000 FUN_M77_r4_38000__13b0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1422 ->$13C8 */
                    /* inline[API_FDBC]: "5.94...p" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  return;
}


// ===== FUN_M77_r4_38000__13bc @ M77_r4_38000::13bc =====

void __h3000 FUN_M77_r4_38000__13bc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1422 ->$13C8 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  return;
}


// ===== FUN_M77_r4_38000__13c8 @ M77_r4_38000::13c8 =====

void __h3000 FUN_M77_r4_38000__13c8(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  FUN_M77_r4_38000__13d7(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M77_r4_38000__13d7 @ M77_r4_38000::13d7 =====

void __h3000 FUN_M77_r4_38000__13d7(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  return;
}


// ===== FUN_M77_r4_38000__13e3 @ M77_r4_38000::13e3 =====

void __h3000 FUN_M77_r4_38000__13e3(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$1422 ->$13C8 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  FUN_M77_r4_38000__13d7(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M77_r4_38000__13f2 @ M77_r4_38000::13f2 =====

void __h3000 FUN_M77_r4_38000__13f2(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  FUN_M77_r4_38000__13d7(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M77_r4_38000__1401 @ M77_r4_38000::1401 =====

void __h3000 FUN_M77_r4_38000__1401(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1422 ->$13C8 $13BC */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370);
  return;
}


// ===== FUN_M77_r4_38000__1422 @ M77_r4_38000::1422 =====

undefined2 __h3000 FUN_M77_r4_38000__1422(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  undefined2 in_Y;
  short in_U;
  
  uVar1 = API_FE76();
  *(undefined2 *)(in_U + -2) = in_Y;
  *(char *)(in_U + -3) = (char)uVar1;
  *(char *)(in_U + -4) = (char)((ushort)uVar1 >> 8);
  API_FD2E((char)((ushort)DAT_7054 >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__1477 @ M77_r4_38000::1477 =====

void __h3000 FUN_M77_r4_38000__1477(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  return;
}


// ===== FUN_M77_r4_38000__1483 @ M77_r4_38000::1483 =====

void __h3000 FUN_M77_r4_38000__1483(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  return;
}


// ===== FUN_M77_r4_38000__148f @ M77_r4_38000::148f =====

void __h3000 FUN_M77_r4_38000__148f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1501 ->$14A7 */
                    /* inline[API_FDBC]: "5.94...O" */
  API_FDBC(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  return;
}


// ===== FUN_M77_r4_38000__149b @ M77_r4_38000::149b =====

void __h3000 FUN_M77_r4_38000__149b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1501 ->$14A7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  return;
}


// ===== FUN_M77_r4_38000__14a7 @ M77_r4_38000::14a7 =====

void __h3000 FUN_M77_r4_38000__14a7(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  FUN_M77_r4_38000__14b6(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M77_r4_38000__14b6 @ M77_r4_38000::14b6 =====

void __h3000 FUN_M77_r4_38000__14b6(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  return;
}


// ===== FUN_M77_r4_38000__14c2 @ M77_r4_38000::14c2 =====

void __h3000 FUN_M77_r4_38000__14c2(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$1501 ->$14A7 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  FUN_M77_r4_38000__14b6(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M77_r4_38000__14d1 @ M77_r4_38000::14d1 =====

void __h3000 FUN_M77_r4_38000__14d1(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  FUN_M77_r4_38000__14b6(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M77_r4_38000__14e0 @ M77_r4_38000::14e0 =====

void __h3000 FUN_M77_r4_38000__14e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1501 ->$14A7 $149B */
  API_FE1A(param_1,param_2,&PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f);
  return;
}


// ===== FUN_M77_r4_38000__1501 @ M77_r4_38000::1501 =====

undefined2 __h3000 FUN_M77_r4_38000__1501(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  undefined2 in_Y;
  short in_U;
  
  uVar1 = API_FE76();
  *(undefined2 *)(in_U + -2) = in_Y;
  *(char *)(in_U + -3) = (char)uVar1;
  *(char *)(in_U + -4) = (char)((ushort)uVar1 >> 8);
  API_FD2E((char)((ushort)DAT_705c >> 8));
  return in_D;
}


// ===== FUN_M77_r4_38000__1554 @ M77_r4_38000::1554 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M77_r4_38000__1554(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  
  if (1 - DAT_7044 < 0) {
    FUN_M77_r4_38000__06f1();
  }
  else if (DAT_7044 == 1) {
    FUN_M77_r4_38000__06d0();
  }
  else {
    FUN_M77_r4_38000__06af();
  }
  FUN_M77_r4_38000__0ce1((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M77_r4_38000__159e @ M77_r4_38000::159e =====

void __h3000 FUN_M77_r4_38000__159e(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M77_r4_38000__15e3_M77_r4_38000__1578);
  return;
}


// ===== FUN_M77_r4_38000__15aa @ M77_r4_38000::15aa =====

void __h3000 FUN_M77_r4_38000__15aa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$15E3 ->$15C2 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M77_r4_38000__15e3_M77_r4_38000__1578);
  return;
}


// ===== FUN_M77_r4_38000__15b6 @ M77_r4_38000::15b6 =====

void __h3000 FUN_M77_r4_38000__15b6(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M77_r4_38000__15e3_M77_r4_38000__1578);
  return;
}


// ===== FUN_M77_r4_38000__15c2 @ M77_r4_38000::15c2 =====

void __h3000 FUN_M77_r4_38000__15c2(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M77_r4_38000__15e3_M77_r4_38000__1578);
  return;
}


// ===== FUN_M77_r4_38000__15e3 @ M77_r4_38000::15e3 =====

undefined2 __h3000 FUN_M77_r4_38000__15e3(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M77_r4_38000__15e3_M77_r4_38000__1578);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M77_r4_38000__1619 @ M77_r4_38000::1619 =====

void __h3000 FUN_M77_r4_38000__1619(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M77_r4_38000__165e_M77_r4_38000__15f3);
  return;
}


// ===== FUN_M77_r4_38000__1625 @ M77_r4_38000::1625 =====

void __h3000 FUN_M77_r4_38000__1625(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$165E ->$163D */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M77_r4_38000__165e_M77_r4_38000__15f3);
  return;
}


// ===== FUN_M77_r4_38000__1631 @ M77_r4_38000::1631 =====

void __h3000 FUN_M77_r4_38000__1631(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M77_r4_38000__165e_M77_r4_38000__15f3);
  return;
}


// ===== FUN_M77_r4_38000__163d @ M77_r4_38000::163d =====

void __h3000 FUN_M77_r4_38000__163d(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M77_r4_38000__165e_M77_r4_38000__15f3);
  return;
}


// ===== FUN_M77_r4_38000__165e @ M77_r4_38000::165e =====

undefined2 __h3000 FUN_M77_r4_38000__165e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M77_r4_38000__165e_M77_r4_38000__15f3);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M77_r4_38000__1694 @ M77_r4_38000::1694 =====

void __h3000 FUN_M77_r4_38000__1694(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M77_r4_38000__16d9_M77_r4_38000__166e);
  return;
}


// ===== FUN_M77_r4_38000__16a0 @ M77_r4_38000::16a0 =====

void __h3000 FUN_M77_r4_38000__16a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$16D9 ->$16B8 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M77_r4_38000__16d9_M77_r4_38000__166e);
  return;
}


// ===== FUN_M77_r4_38000__16ac @ M77_r4_38000::16ac =====

void __h3000 FUN_M77_r4_38000__16ac(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M77_r4_38000__16d9_M77_r4_38000__166e);
  return;
}


// ===== FUN_M77_r4_38000__16b8 @ M77_r4_38000::16b8 =====

void __h3000 FUN_M77_r4_38000__16b8(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M77_r4_38000__16d9_M77_r4_38000__166e);
  return;
}


// ===== FUN_M77_r4_38000__16d9 @ M77_r4_38000::16d9 =====

undefined2 __h3000 FUN_M77_r4_38000__16d9(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M77_r4_38000__16d9_M77_r4_38000__166e);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M77_r4_38000__170f @ M77_r4_38000::170f =====

void __h3000 FUN_M77_r4_38000__170f(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M77_r4_38000__1754_M77_r4_38000__16e9);
  return;
}


// ===== FUN_M77_r4_38000__171b @ M77_r4_38000::171b =====

void __h3000 FUN_M77_r4_38000__171b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1754 ->$1733 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M77_r4_38000__1754_M77_r4_38000__16e9);
  return;
}


// ===== FUN_M77_r4_38000__1727 @ M77_r4_38000::1727 =====

void __h3000 FUN_M77_r4_38000__1727(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M77_r4_38000__1754_M77_r4_38000__16e9);
  return;
}


// ===== FUN_M77_r4_38000__1733 @ M77_r4_38000::1733 =====

void __h3000 FUN_M77_r4_38000__1733(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M77_r4_38000__1754_M77_r4_38000__16e9);
  return;
}


// ===== FUN_M77_r4_38000__1754 @ M77_r4_38000::1754 =====

undefined2 __h3000 FUN_M77_r4_38000__1754(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M77_r4_38000__1754_M77_r4_38000__16e9);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M77_r4_38000__1764 @ M77_r4_38000::1764 =====

undefined2 __h3000 FUN_M77_r4_38000__1764(void)

{
  undefined2 uVar1;
  char in_stack_00000000;
  undefined2 in_stack_00000001;
  
  uVar1 = API_FD76();
  if (in_stack_00000000 < '\0') {
    uVar1 = in_stack_00000001;
  }
  return uVar1;
}


// ===== MODULE_77_02_entry @ M77_r4_38000::1771 =====

void __h3000 MODULE_77_02_entry(void)

{
                    /* inline[API_FE20]: interp table, 257 points */
  InterpTableLookup();
  return;
}


// ===== FUN_M77_r4_38000__1979 @ M77_r4_38000::1979 =====

void __h3000 FUN_M77_r4_38000__1979(void)

{
                    /* inline[API_FE20]: interp table, 257 points */
  InterpTableLookup();
  return;
}


// ===== FUN_M77_r4_38000__1b81 @ M77_r4_38000::1b81 =====

void __h3000 FUN_M77_r4_38000__1b81(void)

{
                    /* inline[API_FE20]: interp table, 257 points */
  InterpTableLookup();
  return;
}


