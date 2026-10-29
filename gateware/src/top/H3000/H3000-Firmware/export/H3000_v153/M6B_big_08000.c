// H3000_v153 - decompiled by Ghidra (6809, __h3000 convention)
// block M6B_big_08000 M6B_big_08000::0000-M6B_big_08000::3fff, 149 functions
// Bank big_08000 (module id 6B)

// ===== MODULE_6B_01_entry @ M6B_big_08000::0070 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 MODULE_6B_01_entry(void)

{
  code *pcVar1;
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined2 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $0074 */
  uVar2 = ModuleSetBase();
  pcVar1 = FUN_M6B_big_08000__18cb + DAT_600d;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M6B_big_08000__1898 + DAT_600d,&LAB_6600,
           pcVar1);
  API_FC58();
  DspLoadProgram(extraout_A,1,0x2810);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A_00,2,0x2811);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_01,3,0x2812);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DAT_7002 = 0;
        DAT_700a = 0;
        DAT_7012 = 0;
        DAT_701a = 0;
        DAT_7022 = 0;
        DAT_7008 = 0;
        DAT_7010 = 0;
        API_FC6C(0);
        API_FC74();
                    /* inline[API_FE04]: 49:28 4A:2A 4B:2C */
        LoadParamsSigned();
                    /* inline[API_FE04]: 58:3A 59:3C 5A:3E 5B:40 5C:42 5D:44 5E:46 5F:48 */
        LoadParamsSigned();
                    /* inline[API_FE08]: 3B:18 3D:20 4C:2E 4E:30 50:32 52:34 54:36 56:38 35:00 3F:06
                        */
        LoadParamsScaled();
                    /* inline[API_FE08]: 41:0E 43:16 47:26 45:1E */
        LoadParamsScaled();
        API_FD7C();
        FUN_M6B_big_08000__1845();
        FUN_M6B_big_08000__14d0();
        FUN_M6B_big_08000__0871();
        FUN_M6B_big_08000__09b2();
        FUN_M6B_big_08000__0be4();
        FUN_M6B_big_08000__0cc8();
        FUN_M6B_big_08000__0756();
        FUN_M6B_big_08000__0633();
        FUN_M6B_big_08000__0da4();
        FUN_M6B_big_08000__0e61();
        FUN_M6B_big_08000__0f14();
        FUN_M6B_big_08000__0fc7();
        FUN_M6B_big_08000__1087();
        FUN_M6B_big_08000__1144();
        FUN_M6B_big_08000__11f7();
        FUN_M6B_big_08000__12aa();
        FUN_M6B_big_08000__0ae3();
        LoadParamsScaled();
        FUN_M6B_big_08000__0871();
        FUN_M6B_big_08000__09b2();
        DefineParameter();
        DefineParameter();
        DefineParameter();
        DefineParameter();
        DefineParameter();
        DAT_60f5 = 0x1fe;
        DAT_60f7 = 0x16;
        API_FD20(0x4e);
        API_FD76();
        API_FDF6();
        FUN_e568();
        FUN_M6B_big_08000__0357();
        FUN_e585();
        return uVar2;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== FUN_M6B_big_08000__022a @ M6B_big_08000::022a =====

void __h3000 FUN_M6B_big_08000__022a(void)

{
  FUN_M6B_big_08000__141b();
  FUN_M6B_big_08000__0390();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__0235 @ M6B_big_08000::0235 =====

void __h3000 FUN_M6B_big_08000__0235(void)

{
  FUN_M6B_big_08000__0580();
  FUN_M6B_big_08000__0357();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__0240 @ M6B_big_08000::0240 =====

void __h3000 FUN_M6B_big_08000__0240(void)

{
  FUN_M6B_big_08000__07af();
  FUN_M6B_big_08000__0357();
  FUN_e58d();
  return;
}


// ===== FUN_M6B_big_08000__024b @ M6B_big_08000::024b =====

void __h3000 FUN_M6B_big_08000__024b(void)

{
  FUN_M6B_big_08000__08f0();
  FUN_M6B_big_08000__0357();
  FUN_e595();
  return;
}


// ===== FUN_M6B_big_08000__0256 @ M6B_big_08000::0256 =====

void __h3000 FUN_M6B_big_08000__0256(void)

{
  FUN_M6B_big_08000__06a3();
  FUN_M6B_big_08000__0357();
  FUN_e59d();
  return;
}


// ===== FUN_M6B_big_08000__0261 @ M6B_big_08000::0261 =====

void __h3000 FUN_M6B_big_08000__0261(void)

{
  FUN_M6B_big_08000__0ce8();
  FUN_M6B_big_08000__042d();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__026c @ M6B_big_08000::026c =====

void __h3000 FUN_M6B_big_08000__026c(void)

{
  FUN_M6B_big_08000__0e65();
  FUN_M6B_big_08000__042d();
  FUN_e58d();
  return;
}


// ===== FUN_M6B_big_08000__0277 @ M6B_big_08000::0277 =====

void __h3000 FUN_M6B_big_08000__0277(void)

{
  FUN_M6B_big_08000__0da8();
  FUN_M6B_big_08000__042d();
  FUN_e595();
  return;
}


// ===== FUN_M6B_big_08000__0282 @ M6B_big_08000::0282 =====

void __h3000 FUN_M6B_big_08000__0282(void)

{
  FUN_M6B_big_08000__0f18();
  FUN_M6B_big_08000__042d();
  FUN_e59d();
  return;
}


// ===== FUN_M6B_big_08000__028d @ M6B_big_08000::028d =====

void __h3000 FUN_M6B_big_08000__028d(void)

{
  FUN_M6B_big_08000__0fcb();
  FUN_M6B_big_08000__0466();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__0298 @ M6B_big_08000::0298 =====

void __h3000 FUN_M6B_big_08000__0298(void)

{
  FUN_M6B_big_08000__1148();
  FUN_M6B_big_08000__0466();
  FUN_e58d();
  return;
}


// ===== FUN_M6B_big_08000__02a3 @ M6B_big_08000::02a3 =====

void __h3000 FUN_M6B_big_08000__02a3(void)

{
  FUN_M6B_big_08000__108b();
  FUN_M6B_big_08000__0466();
  FUN_e595();
  return;
}


// ===== FUN_M6B_big_08000__02ae @ M6B_big_08000::02ae =====

void __h3000 FUN_M6B_big_08000__02ae(void)

{
  FUN_M6B_big_08000__11fb();
  FUN_M6B_big_08000__0466();
  FUN_e59d();
  return;
}


// ===== FUN_M6B_big_08000__02b9 @ M6B_big_08000::02b9 =====

void __h3000 FUN_M6B_big_08000__02b9(void)

{
  FUN_M6B_big_08000__0c1b();
  FUN_M6B_big_08000__03f4();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__02c4 @ M6B_big_08000::02c4 =====

void __h3000 FUN_M6B_big_08000__02c4(void)

{
  FUN_M6B_big_08000__0b37();
  FUN_M6B_big_08000__03f4();
  FUN_e58d();
  return;
}


// ===== FUN_M6B_big_08000__02cf @ M6B_big_08000::02cf =====

void __h3000 FUN_M6B_big_08000__02cf(void)

{
  FUN_M6B_big_08000__0a0b();
  FUN_M6B_big_08000__03f4();
  FUN_e595();
  return;
}


// ===== FUN_M6B_big_08000__02da @ M6B_big_08000::02da =====

void __h3000 FUN_M6B_big_08000__02da(void)

{
  FUN_M6B_big_08000__12ae();
  FUN_M6B_big_08000__04c3();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__02e5 @ M6B_big_08000::02e5 =====

void __h3000 FUN_M6B_big_08000__02e5(void)

{
  FUN_M6B_big_08000__12b5();
  FUN_M6B_big_08000__04c3();
  FUN_e58d();
  return;
}


// ===== FUN_M6B_big_08000__02f0 @ M6B_big_08000::02f0 =====

void __h3000 FUN_M6B_big_08000__02f0(void)

{
  FUN_M6B_big_08000__12bc();
  FUN_M6B_big_08000__04c3();
  FUN_e595();
  return;
}


// ===== FUN_M6B_big_08000__02fb @ M6B_big_08000::02fb =====

void __h3000 FUN_M6B_big_08000__02fb(void)

{
  FUN_M6B_big_08000__12c3();
  FUN_M6B_big_08000__04c3();
  FUN_e59d();
  return;
}


// ===== FUN_M6B_big_08000__0306 @ M6B_big_08000::0306 =====

void __h3000 FUN_M6B_big_08000__0306(void)

{
  FUN_M6B_big_08000__12ca();
  FUN_M6B_big_08000__04fc();
  FUN_e585();
  return;
}


// ===== FUN_M6B_big_08000__0311 @ M6B_big_08000::0311 =====

void __h3000 FUN_M6B_big_08000__0311(void)

{
  FUN_M6B_big_08000__12d1();
  FUN_M6B_big_08000__04fc();
  FUN_e58d();
  return;
}


// ===== FUN_M6B_big_08000__031c @ M6B_big_08000::031c =====

void __h3000 FUN_M6B_big_08000__031c(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M6B_big_08000__0321 @ M6B_big_08000::0321 =====

undefined2 __h3000 FUN_M6B_big_08000__0321(undefined1 param_1)

{
  undefined2 in_stack_00000001;
  
  LcdSetCursor(param_1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return in_stack_00000001;
}


// ===== FUN_M6B_big_08000__0357 @ M6B_big_08000::0357 =====

void __h3000 FUN_M6B_big_08000__0357(void)

{
                    /* inline[API_FE02]: "predelay" "on decay" "offdecay" "gatetime" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$05A7 ->$07D6 ->$0917 ->$06CA ->$0390 ->$0390 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__0390 @ M6B_big_08000::0390 =====

void __h3000 FUN_M6B_big_08000__0390(void)

{
                    /* inline[API_FE02]: "  mix   " [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1442 ->$0559 ->$0559 ->$03BB ->$0357 ->$0357 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__03bb @ M6B_big_08000::03bb =====

void __h3000 FUN_M6B_big_08000__03bb(void)

{
                    /* inline[API_FE02]: "   eq   " " gate   " " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$042D ->$03F4 ->$04C3 ->$0390 ->$03BB ->$03BB */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__03f4 @ M6B_big_08000::03f4 =====

void __h3000 FUN_M6B_big_08000__03f4(void)

{
                    /* inline[API_FE02]: " speed  " " thresh " " enable " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C3F ->$0B5B ->$0A2F ->$03BB ->$03F4 ->$03F4 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__042d @ M6B_big_08000::042d =====

void __h3000 FUN_M6B_big_08000__042d(void)

{
                    /* inline[API_FE02]: "on lfreq" "on lowdB" "on hfreq" "on  hidB" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D0C ->$0E89 ->$0DCC ->$0F3C ->$0466 ->$049F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__0466 @ M6B_big_08000::0466 =====

void __h3000 FUN_M6B_big_08000__0466(void)

{
                    /* inline[API_FE02]: "offlfreq" "offlowdB" "offhfreq" "off hidB" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0FEF ->$116C ->$10AF ->$121F ->$049F ->$042D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__049f @ M6B_big_08000::049f =====

void __h3000 FUN_M6B_big_08000__049f(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0559 ->$0559 ->$0559 ->$03BB ->$042D ->$0466 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__04c3 @ M6B_big_08000::04c3 =====

void __h3000 FUN_M6B_big_08000__04c3(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1304 ->$130E ->$1318 ->$1322 ->$04FC ->$04FC */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__04fc @ M6B_big_08000::04fc =====

void __h3000 FUN_M6B_big_08000__04fc(void)

{
                    /* inline[API_FE02]: "delay 5 " "delay 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$132C ->$1336 ->$0559 ->$03BB ->$04C3 ->$04C3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6B_big_08000__052e @ M6B_big_08000::052e =====

void __h3000 FUN_M6B_big_08000__052e(undefined1 param_1)

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


// ===== FUN_M6B_big_08000__0559 @ M6B_big_08000::0559 =====

void __h3000 FUN_M6B_big_08000__0559(void)

{
  return;
}


// ===== FUN_M6B_big_08000__0568 @ M6B_big_08000::0568 =====

void __h3000 FUN_M6B_big_08000__0568(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$061E ->$0633 $7020 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_big_08000__061e_M6B_big_08000__055a);
  return;
}


// ===== FUN_M6B_big_08000__0574 @ M6B_big_08000::0574 =====

void __h3000 FUN_M6B_big_08000__0574(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$061E ->$0633 $7020 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6B_big_08000__061e_M6B_big_08000__055a);
  return;
}


// ===== FUN_M6B_big_08000__0580 @ M6B_big_08000::0580 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0580(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7020 = DAT_60f9 - DAT_7022;
  FUN_M6B_big_08000__0633();
  API_FC82((char)((ushort)DAT_7020 >> 8),(char)DAT_7020,param_1,0x3d);
  return in_D;
}


// ===== FUN_M6B_big_08000__05a7 @ M6B_big_08000::05a7 =====

undefined2 __h3000 FUN_M6B_big_08000__05a7(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7024;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       predelay =        mS" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $01F4 $0000 $0000 ->$061E ->$05F4
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__061e();
  return in_D;
}


// ===== FUN_M6B_big_08000__05f4 @ M6B_big_08000::05f4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__05f4(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7020 = DAT_6074 - DAT_7022;
  API_FC82((char)((ushort)DAT_7020 >> 8),(char)DAT_7020,param_1,0x3d);
  FUN_eb1d((char)((ushort)DAT_7020 >> 8),(char)DAT_7020,param_1,1);
  FUN_M6B_big_08000__0633();
  return in_D;
}


// ===== FUN_M6B_big_08000__061e @ M6B_big_08000::061e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__061e(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6B_big_08000__0633 @ M6B_big_08000::0633 =====

undefined2 __h3000 FUN_M6B_big_08000__0633(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0xf4;
  *(undefined1 *)(in_U + -4) = 1;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_7020 + DAT_7022;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7024 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x2c;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCF0();
  DAT_707e = psVar2[1] + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707e >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__068b @ M6B_big_08000::068b =====

void __h3000 FUN_M6B_big_08000__068b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0741 ->$0756 $7018 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_big_08000__0741_M6B_big_08000__067d);
  return;
}


// ===== FUN_M6B_big_08000__0697 @ M6B_big_08000::0697 =====

void __h3000 FUN_M6B_big_08000__0697(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0741 ->$0756 $7018 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6B_big_08000__0741_M6B_big_08000__067d);
  return;
}


// ===== FUN_M6B_big_08000__06a3 @ M6B_big_08000::06a3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__06a3(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7018 = DAT_60f9 - DAT_701a;
  FUN_M6B_big_08000__0756();
  API_FC82((char)((ushort)DAT_7018 >> 8),(char)DAT_7018,param_1,0x3b);
  return in_D;
}


// ===== FUN_M6B_big_08000__06ca @ M6B_big_08000::06ca =====

undefined2 __h3000 FUN_M6B_big_08000__06ca(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_701c;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       gate time:       sec" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 01 04 80 $00FA $0000 $0000 ->$0741 ->$0717
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0741();
  return in_D;
}


// ===== FUN_M6B_big_08000__0717 @ M6B_big_08000::0717 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0717(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7018 = DAT_6074 - DAT_701a;
  API_FC82((char)((ushort)DAT_7018 >> 8),(char)DAT_7018,param_1,0x3b);
  FUN_eb1d((char)((ushort)DAT_7018 >> 8),(char)DAT_7018,param_1,4);
  FUN_M6B_big_08000__0756();
  return in_D;
}


// ===== FUN_M6B_big_08000__0741 @ M6B_big_08000::0741 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0741(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M6B_big_08000__0756 @ M6B_big_08000::0756 =====

undefined2 __h3000 FUN_M6B_big_08000__0756(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0xfa;
  *(undefined1 *)(in_U + -4) = 0;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_7018 + DAT_701a;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_701c = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x44;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_7062 = *psVar2;
  return in_D;
}


// ===== FUN_M6B_big_08000__0797 @ M6B_big_08000::0797 =====

void __h3000 FUN_M6B_big_08000__0797(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$084F ->$0871 $7008 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_big_08000__084f_M6B_big_08000__0789);
  return;
}


// ===== FUN_M6B_big_08000__07a3 @ M6B_big_08000::07a3 =====

void __h3000 FUN_M6B_big_08000__07a3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$084F ->$0871 $7008 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6B_big_08000__084f_M6B_big_08000__0789);
  return;
}


// ===== FUN_M6B_big_08000__07af @ M6B_big_08000::07af =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__07af(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7008 = DAT_60f9 - DAT_700a;
  FUN_M6B_big_08000__0871();
  API_FC82((char)((ushort)DAT_7008 >> 8),(char)DAT_7008,param_1,0x37);
  return in_D;
}


// ===== FUN_M6B_big_08000__07d6 @ M6B_big_08000::07d6 =====

undefined2 __h3000 FUN_M6B_big_08000__07d6(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_700c;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       decay open:     sec " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $004A $0000 $0000 ->$084F ->$0823
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__084f();
  return in_D;
}


// ===== FUN_M6B_big_08000__0823 @ M6B_big_08000::0823 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0823(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7008 = DAT_6074 - DAT_700a;
  API_FC82((char)((ushort)DAT_7008 >> 8),(char)DAT_7008,param_1,0x37);
  FUN_eb1d((char)((ushort)DAT_7008 >> 8),(char)DAT_7008,param_1,2);
  FUN_M6B_big_08000__0871();
  FUN_M6B_big_08000__084f();
  return in_D;
}


// ===== FUN_M6B_big_08000__084f @ M6B_big_08000::084f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__084f(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6B_big_08000__1a5c + DAT_600d + DAT_700c * 3) >> 8),3,
           &UNK_M6B_big_08000__1a5c + DAT_600d + DAT_700c * 3);
  return in_D;
}


// ===== FUN_M6B_big_08000__0871 @ M6B_big_08000::0871 =====

undefined2 __h3000 FUN_M6B_big_08000__0871(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x4a;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_7008 + DAT_700a;
  API_FCD8();
  DAT_700c = *psVar1;
  DAT_705e = *(ushort *)(&UNK_M6B_big_08000__1b3d + DAT_600d + DAT_700c * 2);
  FUN_M6B_big_08000__1513();
  if (DAT_705e < DAT_7060 == (DAT_705e == DAT_7060)) {
    DAT_707e = 0x727b;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_707e >> 8));
  }
  return in_D;
}


// ===== FUN_M6B_big_08000__08d8 @ M6B_big_08000::08d8 =====

void __h3000 FUN_M6B_big_08000__08d8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0990 ->$09B2 $7010 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_big_08000__0990_M6B_big_08000__08ca);
  return;
}


// ===== FUN_M6B_big_08000__08e4 @ M6B_big_08000::08e4 =====

void __h3000 FUN_M6B_big_08000__08e4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0990 ->$09B2 $7010 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6B_big_08000__0990_M6B_big_08000__08ca);
  return;
}


// ===== FUN_M6B_big_08000__08f0 @ M6B_big_08000::08f0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__08f0(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7010 = DAT_60f9 - DAT_7012;
  FUN_M6B_big_08000__09b2();
  API_FC82((char)((ushort)DAT_7010 >> 8),(char)DAT_7010,param_1,0x39);
  return in_D;
}


// ===== FUN_M6B_big_08000__0917 @ M6B_big_08000::0917 =====

undefined2 __h3000 FUN_M6B_big_08000__0917(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7014;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       decay close:     sec" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $004A $0000 $0000 ->$0990 ->$0964
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0990();
  return in_D;
}


// ===== FUN_M6B_big_08000__0964 @ M6B_big_08000::0964 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0964(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7010 = DAT_6074 - DAT_7012;
  API_FC82((char)((ushort)DAT_7010 >> 8),(char)DAT_7010,param_1,0x39);
  FUN_eb1d((char)((ushort)DAT_7010 >> 8),(char)DAT_7010,param_1,3);
  FUN_M6B_big_08000__09b2();
  FUN_M6B_big_08000__0990();
  return in_D;
}


// ===== FUN_M6B_big_08000__0990 @ M6B_big_08000::0990 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0990(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6B_big_08000__1a5c + DAT_600d + DAT_7014 * 3) >> 8),3,
           &UNK_M6B_big_08000__1a5c + DAT_600d + DAT_7014 * 3);
  return in_D;
}


// ===== FUN_M6B_big_08000__09b2 @ M6B_big_08000::09b2 =====

undefined2 __h3000 FUN_M6B_big_08000__09b2(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x4a;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_7010 + DAT_7012;
  API_FCD8();
  DAT_7014 = *psVar1;
  DAT_7060 = *(ushort *)(&UNK_M6B_big_08000__1b3d + DAT_600d + DAT_7014 * 2);
  FUN_M6B_big_08000__167c();
  if (DAT_7060 < DAT_705e == (DAT_7060 == DAT_705e)) {
    DAT_707e = 0x727b;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_707e >> 8));
  }
  return in_D;
}


// ===== FUN_M6B_big_08000__0a0b @ M6B_big_08000::0a0b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0a0b(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_702c = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0ae3();
  API_FC80((char)((ushort)DAT_702c >> 8),(char)DAT_702c,param_1,0x4b);
  return in_D;
}


// ===== FUN_M6B_big_08000__0a2f @ M6B_big_08000::0a2f =====

undefined2 __h3000 FUN_M6B_big_08000__0a2f(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_702c;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                           " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$0A93 ->$0A6C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0a93();
  return in_D;
}


// ===== FUN_M6B_big_08000__0a6c @ M6B_big_08000::0a6c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0a6c(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_702c = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x4b);
  FUN_eb1d((char)((ushort)DAT_702c >> 8),(char)DAT_702c,param_1,0xf);
  FUN_M6B_big_08000__0ae3();
  return in_D;
}


// ===== FUN_M6B_big_08000__0a93 @ M6B_big_08000::0a93 =====

undefined2 __h3000 FUN_M6B_big_08000__0a93(void)

{
  undefined2 in_D;
  
  if (DAT_702c == 0) {
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


// ===== FUN_M6B_big_08000__0ae3 @ M6B_big_08000::0ae3 =====

undefined2 __h3000 FUN_M6B_big_08000__0ae3(void)

{
  undefined2 in_D;
  
  if (DAT_702c == 0) {
                    /* inline[API_FC62]: $6097 */
    ModuleStorePtr(0x18);
    API_FD20(0);
    API_FD2E(0xff);
    DAT_7094 = 0xffff;
  }
  else {
                    /* inline[API_FC62]: $6097 */
    ModuleStorePtr(5);
    API_FD20(0);
    API_FD2E(0);
    DAT_7094 = 0;
  }
  return in_D;
}


// ===== FUN_M6B_big_08000__0b37 @ M6B_big_08000::0b37 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0b37(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7028 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0be4();
  API_FC80((char)((ushort)DAT_7028 >> 8),(char)DAT_7028,param_1,0x49);
  return in_D;
}


// ===== FUN_M6B_big_08000__0b5b @ M6B_big_08000::0b5b =====

undefined2 __h3000 FUN_M6B_big_08000__0b5b(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7028;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       gate threshold:    %" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0001 $0000 ->$0BCF ->$0BA8
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0bcf();
  return in_D;
}


// ===== FUN_M6B_big_08000__0ba8 @ M6B_big_08000::0ba8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0ba8(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7028 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x49);
  FUN_eb1d((char)((ushort)DAT_7028 >> 8),(char)DAT_7028,param_1,0xe);
  FUN_M6B_big_08000__0be4();
  return in_D;
}


// ===== FUN_M6B_big_08000__0bcf @ M6B_big_08000::0bcf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0bcf(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6B_big_08000__0be4 @ M6B_big_08000::0be4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M6B_big_08000__0be4
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,short param_5
          )

{
  short sVar1;
  short *psVar2;
  
  *(short *)(param_5 + -2) = DAT_7028;
  *(undefined1 *)(param_5 + -3) = 0xad;
  psVar2 = (short *)(param_5 + -4);
  *(undefined1 *)psVar2 = 0x67;
  API_FCF2();
  sVar1 = *psVar2 + DAT_7028;
  *psVar2 = sVar1;
  psVar2 = psVar2 + -1;
  *psVar2 = sVar1;
  API_FCEE();
  DAT_707e = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_3,FUN_M6B_big_08000__0240);
  return;
}


// ===== FUN_M6B_big_08000__0c1b @ M6B_big_08000::0c1b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0c1b(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_702a = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0cc8();
  API_FC80((char)((ushort)DAT_702a >> 8),(char)DAT_702a,param_1,0x4a);
  return in_D;
}


// ===== FUN_M6B_big_08000__0c3f @ M6B_big_08000::0c3f =====

undefined2 __h3000 FUN_M6B_big_08000__0c3f(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_702a;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       gate speed:         " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$0CB3 ->$0C8C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0cb3();
  return in_D;
}


// ===== FUN_M6B_big_08000__0c8c @ M6B_big_08000::0c8c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0c8c(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_702a = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x4a);
  FUN_eb1d((char)((ushort)DAT_702a >> 8),(char)DAT_702a,param_1,0xd);
  FUN_M6B_big_08000__0cc8();
  return in_D;
}


// ===== FUN_M6B_big_08000__0cb3 @ M6B_big_08000::0cb3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0cb3(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6B_big_08000__0cc8 @ M6B_big_08000::0cc8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M6B_big_08000__0cc8(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_707e = 0x7fff - DAT_702a;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_3,0x241);
  return;
}


// ===== FUN_M6B_big_08000__0ce8 @ M6B_big_08000::0ce8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0ce8(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_703a = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0da4();
  API_FC80((char)((ushort)DAT_703a >> 8),(char)DAT_703a,param_1,0x58);
  return in_D;
}


// ===== FUN_M6B_big_08000__0d0c @ M6B_big_08000::0d0c =====

undefined2 __h3000 FUN_M6B_big_08000__0d0c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_703a;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       on low freq:     Hz " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$0D82 ->$0D59
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0d82();
  return in_D;
}


// ===== FUN_M6B_big_08000__0d59 @ M6B_big_08000::0d59 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0d59(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_703a = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x58);
  FUN_eb1d((char)((ushort)DAT_703a >> 8),(char)DAT_703a,param_1,5);
  FUN_M6B_big_08000__0da4();
  FUN_M6B_big_08000__0d82();
  return in_D;
}


// ===== FUN_M6B_big_08000__0d82 @ M6B_big_08000::0d82 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0d82(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6B_big_08000__18e8 + DAT_600d + DAT_703a * 3) >> 8),3,
           &UNK_M6B_big_08000__18e8 + DAT_600d + DAT_703a * 3);
  return in_D;
}


// ===== FUN_M6B_big_08000__0da4 @ M6B_big_08000::0da4 =====

void __h3000 FUN_M6B_big_08000__0da4(void)

{
  FUN_M6B_big_08000__1513();
  return;
}


// ===== FUN_M6B_big_08000__0da8 @ M6B_big_08000::0da8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0da8(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_703c = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0e61();
  API_FC80((char)((ushort)DAT_703c >> 8),(char)DAT_703c,param_1,0x59);
  return in_D;
}


// ===== FUN_M6B_big_08000__0dcc @ M6B_big_08000::0dcc =====

undefined2 __h3000 FUN_M6B_big_08000__0dcc(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_703c;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       on hi freq:     kHz " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$0E42 ->$0E19
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0e42();
  return in_D;
}


// ===== FUN_M6B_big_08000__0e19 @ M6B_big_08000::0e19 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0e19(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_703c = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x59);
  FUN_eb1d((char)((ushort)DAT_703c >> 8),(char)DAT_703c,param_1,7);
  FUN_M6B_big_08000__0e61();
  FUN_M6B_big_08000__0e42();
  return in_D;
}


// ===== FUN_M6B_big_08000__0e42 @ M6B_big_08000::0e42 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0e42(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6B_big_08000__18f4 + DAT_600d + DAT_703c * 2) >> 8),2,
           &UNK_M6B_big_08000__18f4 + DAT_600d + DAT_703c * 2);
  return in_D;
}


// ===== FUN_M6B_big_08000__0e61 @ M6B_big_08000::0e61 =====

void __h3000 FUN_M6B_big_08000__0e61(void)

{
  FUN_M6B_big_08000__1513();
  return;
}


// ===== FUN_M6B_big_08000__0e65 @ M6B_big_08000::0e65 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0e65(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_703e = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0f14();
  API_FC80((char)((ushort)DAT_703e >> 8),(char)DAT_703e,param_1,0x5a);
  return in_D;
}


// ===== FUN_M6B_big_08000__0e89 @ M6B_big_08000::0e89 =====

undefined2 __h3000 FUN_M6B_big_08000__0e89(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_703e;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       on lf atten:    dB  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$0EFF ->$0ED6
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0eff();
  return in_D;
}


// ===== FUN_M6B_big_08000__0ed6 @ M6B_big_08000::0ed6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0ed6(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_703e = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x5a);
  FUN_eb1d((char)((ushort)DAT_703e >> 8),(char)DAT_703e,param_1,6);
  FUN_M6B_big_08000__0f14();
  FUN_M6B_big_08000__0eff();
  return in_D;
}


// ===== FUN_M6B_big_08000__0eff @ M6B_big_08000::0eff =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0eff(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M6B_big_08000__0f14 @ M6B_big_08000::0f14 =====

void __h3000 FUN_M6B_big_08000__0f14(void)

{
  FUN_M6B_big_08000__1513();
  return;
}


// ===== FUN_M6B_big_08000__0f18 @ M6B_big_08000::0f18 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0f18(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7040 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__0fc7();
  API_FC80((char)((ushort)DAT_7040 >> 8),(char)DAT_7040,param_1,0x5b);
  return in_D;
}


// ===== FUN_M6B_big_08000__0f3c @ M6B_big_08000::0f3c =====

undefined2 __h3000 FUN_M6B_big_08000__0f3c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7040;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       on hf atten:    dB  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$0FB2 ->$0F89
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__0fb2();
  return in_D;
}


// ===== FUN_M6B_big_08000__0f89 @ M6B_big_08000::0f89 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0f89(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7040 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x5b);
  FUN_eb1d((char)((ushort)DAT_7040 >> 8),(char)DAT_7040,param_1,8);
  FUN_M6B_big_08000__0fc7();
  FUN_M6B_big_08000__0fb2();
  return in_D;
}


// ===== FUN_M6B_big_08000__0fb2 @ M6B_big_08000::0fb2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0fb2(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M6B_big_08000__0fc7 @ M6B_big_08000::0fc7 =====

void __h3000 FUN_M6B_big_08000__0fc7(void)

{
  FUN_M6B_big_08000__1513();
  return;
}


// ===== FUN_M6B_big_08000__0fcb @ M6B_big_08000::0fcb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__0fcb(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7042 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__1087();
  API_FC80((char)((ushort)DAT_7042 >> 8),(char)DAT_7042,param_1,0x5c);
  return in_D;
}


// ===== FUN_M6B_big_08000__0fef @ M6B_big_08000::0fef =====

undefined2 __h3000 FUN_M6B_big_08000__0fef(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7042;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       off low freq:     Hz" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$1065 ->$103C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__1065();
  return in_D;
}


// ===== FUN_M6B_big_08000__103c @ M6B_big_08000::103c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__103c(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7042 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x5c);
  FUN_eb1d((char)((ushort)DAT_7042 >> 8),(char)DAT_7042,param_1,9);
  FUN_M6B_big_08000__1087();
  FUN_M6B_big_08000__1065();
  return in_D;
}


// ===== FUN_M6B_big_08000__1065 @ M6B_big_08000::1065 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1065(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6B_big_08000__18e8 + DAT_600d + DAT_7042 * 3) >> 8),3,
           &UNK_M6B_big_08000__18e8 + DAT_600d + DAT_7042 * 3);
  return in_D;
}


// ===== FUN_M6B_big_08000__1087 @ M6B_big_08000::1087 =====

void __h3000 FUN_M6B_big_08000__1087(void)

{
  FUN_M6B_big_08000__167c();
  return;
}


// ===== FUN_M6B_big_08000__108b @ M6B_big_08000::108b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__108b(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7044 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__1144();
  API_FC80((char)((ushort)DAT_7044 >> 8),(char)DAT_7044,param_1,0x5d);
  return in_D;
}


// ===== FUN_M6B_big_08000__10af @ M6B_big_08000::10af =====

undefined2 __h3000 FUN_M6B_big_08000__10af(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7044;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       off hi freq:    kHz " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$1125 ->$10FC
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__1125();
  return in_D;
}


// ===== FUN_M6B_big_08000__10fc @ M6B_big_08000::10fc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__10fc(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7044 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x5d);
  FUN_eb1d((char)((ushort)DAT_7044 >> 8),(char)DAT_7044,param_1,0xb);
  FUN_M6B_big_08000__1144();
  FUN_M6B_big_08000__1125();
  return in_D;
}


// ===== FUN_M6B_big_08000__1125 @ M6B_big_08000::1125 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1125(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M6B_big_08000__18f4 + DAT_600d + DAT_7044 * 2) >> 8),2,
           &UNK_M6B_big_08000__18f4 + DAT_600d + DAT_7044 * 2);
  return in_D;
}


// ===== FUN_M6B_big_08000__1144 @ M6B_big_08000::1144 =====

void __h3000 FUN_M6B_big_08000__1144(void)

{
  FUN_M6B_big_08000__167c();
  return;
}


// ===== FUN_M6B_big_08000__1148 @ M6B_big_08000::1148 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1148(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7046 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__11f7();
  API_FC80((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,param_1,0x5e);
  return in_D;
}


// ===== FUN_M6B_big_08000__116c @ M6B_big_08000::116c =====

undefined2 __h3000 FUN_M6B_big_08000__116c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7046;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       off low atten:    dB" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$11E2 ->$11B9
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__11e2();
  return in_D;
}


// ===== FUN_M6B_big_08000__11b9 @ M6B_big_08000::11b9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__11b9(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7046 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x5e);
  FUN_eb1d((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,param_1,10);
  FUN_M6B_big_08000__11f7();
  FUN_M6B_big_08000__11e2();
  return in_D;
}


// ===== FUN_M6B_big_08000__11e2 @ M6B_big_08000::11e2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__11e2(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M6B_big_08000__11f7 @ M6B_big_08000::11f7 =====

void __h3000 FUN_M6B_big_08000__11f7(void)

{
  FUN_M6B_big_08000__167c();
  return;
}


// ===== FUN_M6B_big_08000__11fb @ M6B_big_08000::11fb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__11fb(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7048 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6B_big_08000__12aa();
  API_FC80((char)((ushort)DAT_7048 >> 8),(char)DAT_7048,param_1,0x5f);
  return in_D;
}


// ===== FUN_M6B_big_08000__121f @ M6B_big_08000::121f =====

undefined2 __h3000 FUN_M6B_big_08000__121f(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7048;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       off hi atten:    dB " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$1295 ->$126C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__1295();
  return in_D;
}


// ===== FUN_M6B_big_08000__126c @ M6B_big_08000::126c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__126c(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7048 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x5f);
  FUN_eb1d((char)((ushort)DAT_7048 >> 8),(char)DAT_7048,param_1,0xc);
  FUN_M6B_big_08000__12aa();
  FUN_M6B_big_08000__1295();
  return in_D;
}


// ===== FUN_M6B_big_08000__1295 @ M6B_big_08000::1295 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1295(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M6B_big_08000__12aa @ M6B_big_08000::12aa =====

void __h3000 FUN_M6B_big_08000__12aa(void)

{
  FUN_M6B_big_08000__167c();
  return;
}


// ===== FUN_M6B_big_08000__12ae @ M6B_big_08000::12ae =====

undefined2 __h3000 FUN_M6B_big_08000__12ae(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0);
  DAT_6074 = DAT_60f9;
  *DAT_7074 = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_big_08000__1304 + DAT_600d + (DAT_707c & 0xff) * 10))();
  FUN_M6B_big_08000__13c2();
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__12b5 @ M6B_big_08000::12b5 =====

undefined2 __h3000 FUN_M6B_big_08000__12b5(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0);
  DAT_6074 = DAT_60f9;
  *DAT_7074 = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_big_08000__1304 + DAT_600d + (DAT_707c & 0xff) * 10))();
  FUN_M6B_big_08000__13c2();
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__12bc @ M6B_big_08000::12bc =====

undefined2 __h3000 FUN_M6B_big_08000__12bc(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0);
  DAT_6074 = DAT_60f9;
  *DAT_7074 = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_big_08000__1304 + DAT_600d + (DAT_707c & 0xff) * 10))();
  FUN_M6B_big_08000__13c2();
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__12c3 @ M6B_big_08000::12c3 =====

undefined2 __h3000 FUN_M6B_big_08000__12c3(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0);
  DAT_6074 = DAT_60f9;
  *DAT_7074 = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_big_08000__1304 + DAT_600d + (DAT_707c & 0xff) * 10))();
  FUN_M6B_big_08000__13c2();
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__12ca @ M6B_big_08000::12ca =====

undefined2 __h3000 FUN_M6B_big_08000__12ca(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0);
  DAT_6074 = DAT_60f9;
  *DAT_7074 = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_big_08000__1304 + DAT_600d + (DAT_707c & 0xff) * 10))();
  FUN_M6B_big_08000__13c2();
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__12d1 @ M6B_big_08000::12d1 =====

undefined2 __h3000 FUN_M6B_big_08000__12d1(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0);
  DAT_6074 = DAT_60f9;
  *DAT_7074 = DAT_60f9;
  API_FC80();
  (*(FUN_M6B_big_08000__1304 + DAT_600d + (DAT_707c & 0xff) * 10))();
  FUN_M6B_big_08000__13c2();
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__1304 @ M6B_big_08000::1304 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1304(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0,0,"  hidB");
  DAT_6074 = *DAT_7074;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_big_08000__13c2();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__130e @ M6B_big_08000::130e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__130e(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0,1,"dB");
  DAT_6074 = *DAT_7074;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_big_08000__13c2();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__1318 @ M6B_big_08000::1318 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1318(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0,2,"B");
  DAT_6074 = *DAT_7074;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_big_08000__13c2();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__1322 @ M6B_big_08000::1322 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1322(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0,3," hidB");
  DAT_6074 = *DAT_7074;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_big_08000__13c2();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__132c @ M6B_big_08000::132c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__132c(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0,4,"hidB");
  DAT_6074 = *DAT_7074;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M6B_big_08000__13c2();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__1336 @ M6B_big_08000::1336 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1336(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1823(0,5,"idB");
  DAT_6074 = *DAT_7074;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay  :     samples" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $1388 $0000 $0000 ->$13C2 ->$139C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__13c2();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_707c >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__139c @ M6B_big_08000::139c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__139c(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_7074 = DAT_6074;
  API_FC82();
  FUN_eb1d((char)((ushort)*DAT_7074 >> 8),(char)*DAT_7074,param_1,DAT_707c + 0x10);
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__13c2 @ M6B_big_08000::13c2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__13c2(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M6B_big_08000__13d7 @ M6B_big_08000::13d7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M6B_big_08000__13d7(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_707e = *DAT_7074;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_3,DAT_707a);
  return;
}


// ===== FUN_M6B_big_08000__1403 @ M6B_big_08000::1403 =====

void __h3000 FUN_M6B_big_08000__1403(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$14BB ->$14D0 $7000 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6B_big_08000__14bb_M6B_big_08000__13f5);
  return;
}


// ===== FUN_M6B_big_08000__140f @ M6B_big_08000::140f =====

void __h3000 FUN_M6B_big_08000__140f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$14BB ->$14D0 $7000 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6B_big_08000__14bb_M6B_big_08000__13f5);
  return;
}


// ===== FUN_M6B_big_08000__141b @ M6B_big_08000::141b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__141b(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7000 = DAT_60f9 - DAT_7002;
  FUN_M6B_big_08000__14d0();
  API_FC82((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0x35);
  return in_D;
}


// ===== FUN_M6B_big_08000__1442 @ M6B_big_08000::1442 =====

undefined2 __h3000 FUN_M6B_big_08000__1442(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7004;
  FUN_M6B_big_08000__031c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       mix:     % wet      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$14BB ->$148F
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6B_big_08000__14bb();
  return in_D;
}


// ===== FUN_M6B_big_08000__148f @ M6B_big_08000::148f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__148f(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7000 = DAT_6074 - DAT_7002;
  API_FC82((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0x35);
  FUN_M6B_big_08000__14d0();
  FUN_M6B_big_08000__14bb();
  FUN_eb1d((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0);
  return in_D;
}


// ===== FUN_M6B_big_08000__14bb @ M6B_big_08000::14bb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__14bb(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6B_big_08000__14d0 @ M6B_big_08000::14d0 =====

undefined2 __h3000 FUN_M6B_big_08000__14d0(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_7000 + DAT_7002;
  API_FCD8();
  DAT_7004 = *psVar2;
  sVar1 = 100 - DAT_7004;
  *psVar2 = sVar1;
  DAT_707e = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_707e) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M6B_big_08000__1513 @ M6B_big_08000::1513 =====

undefined2 __h3000 FUN_M6B_big_08000__1513(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar3;
  short *psVar4;
  
  DAT_7064 = (undefined2 *)
             (&UNK_M6B_big_08000__18fc + DAT_600d + (DAT_703a & 0xff) * 0x2c + DAT_703e * -4);
  DAT_7066 = (short *)(&UNK_M6B_big_08000__19ac +
                      DAT_600d + (DAT_703c & 0xff) * 0x2c + DAT_7040 * -4);
  DAT_7068 = *DAT_7064;
  DAT_706a = DAT_7064[1];
  DAT_706c = *DAT_7066;
  DAT_706e = DAT_7066[1];
  *(short *)(in_U + -2) = 0x7fff - DAT_706e;
  uVar2 = DAT_705e;
  *(char *)(in_U + -3) = (char)DAT_705e;
  puVar3 = (undefined1 *)(in_U + -4);
  *puVar3 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  psVar4 = (short *)(puVar3 + -2);
  *psVar4 = 0x7fff - DAT_706c;
  FUN_M6B_big_08000__17e5();
  sVar1 = *psVar4;
  DAT_704a = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  sVar1 = DAT_706c;
  *(char *)((short)psVar4 + -1) = (char)DAT_706c;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  sVar1 = DAT_704a;
  *(char *)((short)psVar4 + -1) = (char)DAT_704a;
  *(char *)(psVar4 + -1) = (char)((ushort)sVar1 >> 8);
  uVar2 = DAT_7068;
  *(char *)((short)psVar4 + -3) = (char)DAT_7068;
  psVar4 = psVar4 + -2;
  *(char *)psVar4 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  *(undefined1 *)((short)psVar4 + -1) = 1;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x80;
  API_FCE2();
  API_FCE2();
  uVar2 = DAT_7068;
  DAT_704c = -*psVar4;
  *(char *)((short)psVar4 + 1) = (char)DAT_7068;
  *(char *)psVar4 = (char)((ushort)uVar2 >> 8);
  sVar1 = DAT_706c;
  *(char *)((short)psVar4 + -1) = (char)DAT_706c;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  sVar1 = DAT_704a;
  *(char *)((short)psVar4 + -1) = (char)DAT_704a;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  DAT_704e = *psVar4;
  DAT_7050 = DAT_706a + -0x7fff + DAT_706e;
  *psVar4 = -DAT_706a;
  sVar1 = DAT_706e;
  *(char *)((short)psVar4 + -1) = (char)DAT_706e;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  DAT_7052 = *psVar4;
  API_FD20(0);
  API_FD2E(0xff);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_704a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_704c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_704e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7050 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7052 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7094 >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__167c @ M6B_big_08000::167c =====

undefined2 __h3000 FUN_M6B_big_08000__167c(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar3;
  short *psVar4;
  
  DAT_7064 = (undefined2 *)
             (&UNK_M6B_big_08000__18fc + DAT_600d + (DAT_7042 & 0xff) * 0x2c + DAT_7046 * -4);
  DAT_7066 = (short *)(&UNK_M6B_big_08000__19ac +
                      DAT_600d + (DAT_7044 & 0xff) * 0x2c + DAT_7048 * -4);
  DAT_7068 = *DAT_7064;
  DAT_706a = DAT_7064[1];
  DAT_706c = *DAT_7066;
  DAT_706e = DAT_7066[1];
  *(short *)(in_U + -2) = 0x7fff - DAT_706e;
  uVar2 = DAT_7060;
  *(char *)(in_U + -3) = (char)DAT_7060;
  puVar3 = (undefined1 *)(in_U + -4);
  *puVar3 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  psVar4 = (short *)(puVar3 + -2);
  *psVar4 = 0x7fff - DAT_706c;
  FUN_M6B_big_08000__17e5();
  sVar1 = *psVar4;
  DAT_7054 = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  sVar1 = DAT_706c;
  *(char *)((short)psVar4 + -1) = (char)DAT_706c;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  sVar1 = DAT_7054;
  *(char *)((short)psVar4 + -1) = (char)DAT_7054;
  *(char *)(psVar4 + -1) = (char)((ushort)sVar1 >> 8);
  uVar2 = DAT_7068;
  *(char *)((short)psVar4 + -3) = (char)DAT_7068;
  psVar4 = psVar4 + -2;
  *(char *)psVar4 = (char)((ushort)uVar2 >> 8);
  API_FCF2();
  *(undefined1 *)((short)psVar4 + -1) = 1;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x80;
  API_FCE2();
  API_FCE2();
  uVar2 = DAT_7068;
  DAT_7056 = -*psVar4;
  *(char *)((short)psVar4 + 1) = (char)DAT_7068;
  *(char *)psVar4 = (char)((ushort)uVar2 >> 8);
  sVar1 = DAT_706c;
  *(char *)((short)psVar4 + -1) = (char)DAT_706c;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  sVar1 = DAT_7054;
  *(char *)((short)psVar4 + -1) = (char)DAT_7054;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  DAT_7058 = *psVar4;
  DAT_705a = DAT_706a + -0x7fff + DAT_706e;
  *psVar4 = -DAT_706a;
  sVar1 = DAT_706e;
  *(char *)((short)psVar4 + -1) = (char)DAT_706e;
  psVar4 = psVar4 + -1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  API_FCF2();
  DAT_705c = *psVar4;
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7054 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7056 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7058 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_705a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_705c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7094 >> 8));
  return in_D;
}


// ===== FUN_M6B_big_08000__17e5 @ M6B_big_08000::17e5 =====

undefined2 __h3000 FUN_M6B_big_08000__17e5(void)

{
  byte bVar1;
  byte bVar2;
  short sVar3;
  undefined2 in_D;
  ushort uVar4;
  short sVar5;
  char *in_U;
  
  DAT_7072._1_1_ = 0;
  DAT_7072._0_1_ = 0;
  DAT_7070 = CONCAT11(*in_U >> 1,in_U[1] >> 1 | *in_U << 7);
  uVar4 = *(ushort *)(in_U + 2);
  sVar5 = 0xf;
  do {
    if (uVar4 < DAT_7070) {
      bVar1 = (byte)DAT_7072 >> 7;
      DAT_7072._1_1_ = (byte)DAT_7072 << 1;
      bVar2 = DAT_7072._0_1_ >> 7;
      DAT_7072._0_1_ = DAT_7072._0_1_ << 1 | bVar1;
      uVar4 = CONCAT11((char)(uVar4 >> 8) << 1 | (byte)uVar4 >> 7,(byte)uVar4 << 1 | bVar2);
    }
    else {
      bVar1 = (byte)DAT_7072 >> 7;
      DAT_7072._1_1_ = (byte)DAT_7072 * '\x02';
      bVar2 = DAT_7072._0_1_ >> 7;
      DAT_7072._0_1_ = DAT_7072._0_1_ << 1 | bVar1;
      sVar3 = (uVar4 - DAT_7070) * 2;
      uVar4 = CONCAT11((char)((ushort)sVar3 >> 8),(byte)sVar3 | bVar2);
      DAT_7072._1_1_ = (byte)DAT_7072 + 1;
    }
    bVar1 = DAT_7072._0_1_;
    sVar5 = sVar5 + -1;
  } while (sVar5 != 0);
  in_U[3] = (byte)DAT_7072;
  in_U[2] = bVar1;
  return in_D;
}


// ===== FUN_M6B_big_08000__1823 @ M6B_big_08000::1823 =====

undefined2 __h3000 FUN_M6B_big_08000__1823(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_707c = in_D;
  DAT_707a = param_1;
  DAT_7074 = (short)&DAT_702e + CONCAT11(uVar1,(char)in_D << 1);
  DAT_7076 = CONCAT11(uVar1,(char)in_D << 1) + 0x4c;
  return in_D;
}


// ===== FUN_M6B_big_08000__1845 @ M6B_big_08000::1845 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6B_big_08000__1845(void)

{
  undefined2 in_D;
  
  FUN_M6B_big_08000__1880(0,0,"  hidB");
  FUN_M6B_big_08000__1880(0,1,"dB");
  FUN_M6B_big_08000__1880(0,2,"B");
  FUN_M6B_big_08000__1880(0,3," hidB");
  FUN_M6B_big_08000__1880(0,4,"hidB");
  FUN_M6B_big_08000__1880(0,5,"idB");
  return in_D;
}


// ===== FUN_M6B_big_08000__1880 @ M6B_big_08000::1880 =====

undefined2 __h3000 FUN_M6B_big_08000__1880(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7074 = (short)&DAT_702e + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_707a = param_1;
  DAT_707c = in_D;
  FUN_M6B_big_08000__13d7();
  return in_D;
}


// ===== FUN_M6B_big_08000__1898 @ M6B_big_08000::1898 =====

undefined2 __h3000 FUN_M6B_big_08000__1898(void)

{
  undefined2 in_D;
  char in_stack_00000000;
  undefined2 in_stack_00000001;
  
  DAT_7082 = API_FD42();
  if (DAT_7082 < 0) {
    API_FCC4((char)((ushort)DAT_7062 >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E(0);
    DAT_7094 = 0;
  }
  API_FD76();
  if (in_stack_00000000 < '\0') {
    in_D = in_stack_00000001;
  }
  return in_D;
}


// ===== FUN_M6B_big_08000__18cb @ M6B_big_08000::18cb =====

undefined2 __h3000 FUN_M6B_big_08000__18cb(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E(0xff);
  DAT_7094 = 0xffff;
  return in_D;
}


