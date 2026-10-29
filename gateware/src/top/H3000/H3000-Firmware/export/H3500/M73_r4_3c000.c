// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M73_r4_3c000 M73_r4_3c000::0000-M73_r4_3c000::3fff, 116 functions
// Bank r4_3c000 (module id 73, sub 00)

// ===== MODULE_73_01_entry @ M73_r4_3c000::00a6 =====

undefined2 __h3000 MODULE_73_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $00AA */
  uVar1 = ModuleSetBase();
  FUN_M73_r4_3c000__01f2();
  FUN_M73_r4_3c000__01a1();
  FUN_M73_r4_3c000__01d3();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  FUN_M73_r4_3c000__0101();
  if (DAT_600a != 's') {
    FUN_a2f1();
    FUN_M73_r4_3c000__012a();
  }
  FUN_M73_r4_3c000__0237();
  FUN_M73_r4_3c000__0254();
  if (DAT_600a != 's') {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M73_r4_3c000__036c();
  API_FE10();
  return uVar1;
}


// ===== FUN_M73_r4_3c000__0101 @ M73_r4_3c000::0101 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M73_r4_3c000__0101(void)

{
  code *pcVar1;
  undefined2 in_D;
  
  pcVar1 = FUN_M73_r4_3c000__0d46 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M73_r4_3c000__0d17 + g_moduleBase,&LAB_6600,
           pcVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M73_r4_3c000__012a @ M73_r4_3c000::012a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x013e */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M73_r4_3c000__012a(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DspLoadProgram();
  if ((((extraout_CC >> 2 & 1) != 0) &&
      (DspLoadProgram(uVar1,(char)in_D,0x7311), (extraout_CC_00 >> 2 & 1) != 0)) &&
     (DspLoadProgram(uVar1,(char)in_D,0x7312), (extraout_CC_01 >> 2 & 1) != 0)) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7076 >> 8));
    API_FD7C();
    return in_D;
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M73_r4_3c000__01a1 @ M73_r4_3c000::01a1 =====

undefined2 __h3000 FUN_M73_r4_3c000__01a1(void)

{
  undefined2 in_D;
  
  DAT_7002 = 0;
  DAT_700a = 0;
  DAT_7042 = 0;
  DAT_7012 = 0;
  DAT_701a = 0;
  DAT_7024 = 0;
  DAT_702e = 0;
  DAT_7038 = 0;
  DAT_704a = 0;
  DAT_7052 = 0;
  DAT_7060 = 0;
  DAT_706c = 0;
  DAT_7066 = 0;
  DAT_7072 = 0;
  return in_D;
}


// ===== FUN_M73_r4_3c000__01d3 @ M73_r4_3c000::01d3 =====

undefined2 __h3000 FUN_M73_r4_3c000__01d3(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M73_r4_3c000__0b96();
  FUN_M73_r4_3c000__0c11();
  FUN_M73_r4_3c000__0c8c();
  FUN_M73_r4_3c000__0d07();
  FUN_M73_r4_3c000__0afc();
  return in_D;
}


// ===== FUN_M73_r4_3c000__01f2 @ M73_r4_3c000::01f2 =====

undefined2 __h3000 FUN_M73_r4_3c000__01f2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FE08]: 33:08 35:40 52:0E 54:46 31:00 50:06 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 38:10 3A:16 40:22 42:28 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 3C:18 4C:2C 4E:36 44:48 46:4E 48:50 4A:56 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 37:58 19:5E 1A:6A 1B:64 1C:70 */
  LoadParamsSigned();
  return uStack_8;
}


// ===== FUN_M73_r4_3c000__0237 @ M73_r4_3c000::0237 =====

undefined2 __h3000 FUN_M73_r4_3c000__0237(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M73_r4_3c000__04ff();
  FUN_M73_r4_3c000__05c9();
  FUN_M73_r4_3c000__0693();
  FUN_M73_r4_3c000__0744();
  FUN_M73_r4_3c000__09ce();
  FUN_M73_r4_3c000__0a59();
  FUN_M73_r4_3c000__07eb();
  FUN_M73_r4_3c000__089a();
  return uStack_8;
}


// ===== FUN_M73_r4_3c000__0254 @ M73_r4_3c000::0254 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M73_r4_3c000__0254(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 "  mix   " 21 $0ACF $0ADB */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "formants" 25 $0666 $0672 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 " width  " 29 $086D $0879 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 " depth  " 2D $07BE $07CA */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M73_r4_3c000__02be;
  _DAT_60f7 = 0xd;
  DAT_6105 = 1;
  DAT_6106 = 0x56;
  return in_D;
}


// ===== FUN_M73_r4_3c000__02d8 @ M73_r4_3c000::02d8 =====

void __h3000 FUN_M73_r4_3c000__02d8(void)

{
  FUN_M73_r4_3c000__04ae();
  FUN_M73_r4_3c000__036c();
  API_FE10();
  return;
}


// ===== FUN_M73_r4_3c000__02e3 @ M73_r4_3c000::02e3 =====

void __h3000 FUN_M73_r4_3c000__02e3(void)

{
  FUN_M73_r4_3c000__0578();
  FUN_M73_r4_3c000__036c();
  API_FE12();
  return;
}


// ===== FUN_M73_r4_3c000__02ee @ M73_r4_3c000::02ee =====

void __h3000 FUN_M73_r4_3c000__02ee(void)

{
  FUN_M73_r4_3c000__0642();
  FUN_M73_r4_3c000__036c();
  API_FE14();
  return;
}


// ===== FUN_M73_r4_3c000__02f9 @ M73_r4_3c000::02f9 =====

void __h3000 FUN_M73_r4_3c000__02f9(void)

{
  FUN_M73_r4_3c000__079a();
  FUN_M73_r4_3c000__036c();
  API_FE16();
  return;
}


// ===== FUN_M73_r4_3c000__0304 @ M73_r4_3c000::0304 =====

void __h3000 FUN_M73_r4_3c000__0304(void)

{
  FUN_M73_r4_3c000__0849();
  FUN_M73_r4_3c000__03a5();
  API_FE10();
  return;
}


// ===== FUN_M73_r4_3c000__030f @ M73_r4_3c000::030f =====

void __h3000 FUN_M73_r4_3c000__030f(void)

{
  FUN_M73_r4_3c000__0aab();
  FUN_M73_r4_3c000__03a5();
  API_FE12();
  return;
}


// ===== FUN_M73_r4_3c000__031a @ M73_r4_3c000::031a =====

void __h3000 FUN_M73_r4_3c000__031a(void)

{
  FUN_M73_r4_3c000__0b5d();
  FUN_M73_r4_3c000__03de();
  API_FE10();
  return;
}


// ===== FUN_M73_r4_3c000__0325 @ M73_r4_3c000::0325 =====

void __h3000 FUN_M73_r4_3c000__0325(void)

{
  FUN_M73_r4_3c000__0bd8();
  FUN_M73_r4_3c000__03de();
  API_FE12();
  return;
}


// ===== FUN_M73_r4_3c000__0330 @ M73_r4_3c000::0330 =====

void __h3000 FUN_M73_r4_3c000__0330(void)

{
  FUN_M73_r4_3c000__0c53();
  FUN_M73_r4_3c000__0410();
  API_FE10();
  return;
}


// ===== FUN_M73_r4_3c000__033b @ M73_r4_3c000::033b =====

void __h3000 FUN_M73_r4_3c000__033b(void)

{
  FUN_M73_r4_3c000__0cce();
  FUN_M73_r4_3c000__0410();
  API_FE12();
  return;
}


// ===== FUN_M73_r4_3c000__0346 @ M73_r4_3c000::0346 =====

void __h3000 FUN_M73_r4_3c000__0346(void)

{
  FUN_M73_r4_3c000__0995();
  FUN_M73_r4_3c000__0442();
  API_FE10();
  return;
}


// ===== FUN_M73_r4_3c000__0351 @ M73_r4_3c000::0351 =====

void __h3000 FUN_M73_r4_3c000__0351(void)

{
  FUN_M73_r4_3c000__0a20();
  FUN_M73_r4_3c000__0442();
  API_FE12();
  return;
}


// ===== FUN_M73_r4_3c000__035c @ M73_r4_3c000::035c =====

void __h3000 FUN_M73_r4_3c000__035c(void)

{
  FUN_M73_r4_3c000__06f3();
  FUN_M73_r4_3c000__0442();
  API_FE14();
  return;
}


// ===== FUN_M73_r4_3c000__0367 @ M73_r4_3c000::0367 =====

void __h3000 FUN_M73_r4_3c000__0367(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M73_r4_3c000__036c @ M73_r4_3c000::036c =====

void __h3000 FUN_M73_r4_3c000__036c(void)

{
                    /* inline[API_FE02]: "f speed " "envspeed" "f shift " " depth  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$04A2 ->$056C ->$0636 ->$078E ->$03A5 ->$03A5 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M73_r4_3c000__03a5 @ M73_r4_3c000::03a5 =====

void __h3000 FUN_M73_r4_3c000__03a5(void)

{
                    /* inline[API_FE02]: " width  " "  mix   " " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$083D ->$0A9F ->$03DE ->$0442 ->$036C ->$036C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M73_r4_3c000__03de @ M73_r4_3c000::03de =====

void __h3000 FUN_M73_r4_3c000__03de(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0B51 ->$0BCC ->$047B ->$036C ->$0410 ->$0410 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M73_r4_3c000__0410 @ M73_r4_3c000::0410 =====

void __h3000 FUN_M73_r4_3c000__0410(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C47 ->$0CC2 ->$047B ->$036C ->$03DE ->$03DE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M73_r4_3c000__0442 @ M73_r4_3c000::0442 =====

void __h3000 FUN_M73_r4_3c000__0442(void)

{
                    /* inline[API_FE02]: "max res " "min err " "  gate  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0989 ->$0A14 ->$06E7 ->$036C ->$0442 ->$0442 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M73_r4_3c000__047b @ M73_r4_3c000::047b =====

void __h3000 FUN_M73_r4_3c000__047b(void)

{
  return;
}


// ===== FUN_M73_r4_3c000__04a2 @ M73_r4_3c000::04a2 =====

void __h3000 FUN_M73_r4_3c000__04a2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$04FF ->$04C6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c);
  return;
}


// ===== FUN_M73_r4_3c000__04ae @ M73_r4_3c000::04ae =====

void __h3000 FUN_M73_r4_3c000__04ae(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$04FF ->$04C6 */
                    /* inline[API_FDBC]: "5.94...|" */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c);
  return;
}


// ===== FUN_M73_r4_3c000__04ba @ M73_r4_3c000::04ba =====

void __h3000 FUN_M73_r4_3c000__04ba(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$04FF ->$04C6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c);
  return;
}


// ===== FUN_M73_r4_3c000__04c6 @ M73_r4_3c000::04c6 =====

void __h3000 FUN_M73_r4_3c000__04c6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$04FF ->$04C6 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c);
  return;
}


// ===== FUN_M73_r4_3c000__04d2 @ M73_r4_3c000::04d2 =====

void __h3000 FUN_M73_r4_3c000__04d2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$04FF ->$04C6 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c);
  return;
}


// ===== FUN_M73_r4_3c000__04de @ M73_r4_3c000::04de =====

void __h3000 FUN_M73_r4_3c000__04de(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$04FF ->$04C6 $04BA */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c);
  return;
}


// ===== FUN_M73_r4_3c000__04ff @ M73_r4_3c000::04ff =====

undefined2 __h3000 FUN_M73_r4_3c000__04ff(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_700c;
  *(char *)(in_U + -1) = (char)DAT_700c;
  psVar2 = (short *)(in_U + -2);
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_7076 = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  DAT_7076 = 0x7fff - DAT_7076;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  return in_D;
}


// ===== FUN_M73_r4_3c000__056c @ M73_r4_3c000::056c =====

void __h3000 FUN_M73_r4_3c000__056c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$05C9 ->$0590 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546);
  return;
}


// ===== FUN_M73_r4_3c000__0578 @ M73_r4_3c000::0578 =====

void __h3000 FUN_M73_r4_3c000__0578(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$05C9 ->$0590 */
                    /* inline[API_FDBC]: "5.94...F" */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546);
  return;
}


// ===== FUN_M73_r4_3c000__0584 @ M73_r4_3c000::0584 =====

void __h3000 FUN_M73_r4_3c000__0584(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$05C9 ->$0590 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546);
  return;
}


// ===== FUN_M73_r4_3c000__0590 @ M73_r4_3c000::0590 =====

void __h3000 FUN_M73_r4_3c000__0590(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$05C9 ->$0590 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546);
  return;
}


// ===== FUN_M73_r4_3c000__059c @ M73_r4_3c000::059c =====

void __h3000 FUN_M73_r4_3c000__059c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$05C9 ->$0590 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546);
  return;
}


// ===== FUN_M73_r4_3c000__05a8 @ M73_r4_3c000::05a8 =====

void __h3000 FUN_M73_r4_3c000__05a8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$05C9 ->$0590 $0584 */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546);
  return;
}


// ===== FUN_M73_r4_3c000__05c9 @ M73_r4_3c000::05c9 =====

undefined2 __h3000 FUN_M73_r4_3c000__05c9(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_7014;
  *(char *)(in_U + -1) = (char)DAT_7014;
  psVar2 = (short *)(in_U + -2);
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_7076 = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  DAT_7076 = 0x7fff - DAT_7076;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  return in_D;
}


// ===== FUN_M73_r4_3c000__0636 @ M73_r4_3c000::0636 =====

void __h3000 FUN_M73_r4_3c000__0636(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0693 ->$065A */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610);
  return;
}


// ===== FUN_M73_r4_3c000__0642 @ M73_r4_3c000::0642 =====

void __h3000 FUN_M73_r4_3c000__0642(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0693 ->$065A */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610);
  return;
}


// ===== FUN_M73_r4_3c000__064e @ M73_r4_3c000::064e =====

void __h3000 FUN_M73_r4_3c000__064e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0693 ->$065A */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610);
  return;
}


// ===== FUN_M73_r4_3c000__065a @ M73_r4_3c000::065a =====

void __h3000 FUN_M73_r4_3c000__065a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0693 ->$065A */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610);
  return;
}


// ===== FUN_M73_r4_3c000__0666 @ M73_r4_3c000::0666 =====

void __h3000 FUN_M73_r4_3c000__0666(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0693 ->$065A */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610);
  return;
}


// ===== FUN_M73_r4_3c000__0672 @ M73_r4_3c000::0672 =====

void __h3000 FUN_M73_r4_3c000__0672(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0693 ->$065A $064E */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610);
  return;
}


// ===== FUN_M73_r4_3c000__0693 @ M73_r4_3c000::0693 =====

undefined2 __h3000 FUN_M73_r4_3c000__0693(void)

{
  char cVar1;
  undefined2 in_D;
  short in_U;
  char *pcVar2;
  
  API_FE76();
  cVar1 = (char)((ushort)DAT_7026 >> 8);
  *(char *)(in_U + -1) = (char)DAT_7026 >> 1 | cVar1 << 7;
  pcVar2 = (char *)(in_U + -2);
  *pcVar2 = cVar1 >> 1;
  FUN_c0ef();
  DAT_702a = *(undefined2 *)pcVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_702a >> 8));
  return in_D;
}


// ===== FUN_M73_r4_3c000__06e7 @ M73_r4_3c000::06e7 =====

void __h3000 FUN_M73_r4_3c000__06e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0744 ->$070B */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1);
  return;
}


// ===== FUN_M73_r4_3c000__06f3 @ M73_r4_3c000::06f3 =====

void __h3000 FUN_M73_r4_3c000__06f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0744 ->$070B */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1);
  return;
}


// ===== FUN_M73_r4_3c000__06ff @ M73_r4_3c000::06ff =====

void __h3000 FUN_M73_r4_3c000__06ff(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0744 ->$070B */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1);
  return;
}


// ===== FUN_M73_r4_3c000__070b @ M73_r4_3c000::070b =====

void __h3000 FUN_M73_r4_3c000__070b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0744 ->$070B */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1);
  return;
}


// ===== FUN_M73_r4_3c000__0717 @ M73_r4_3c000::0717 =====

void __h3000 FUN_M73_r4_3c000__0717(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0744 ->$070B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1);
  return;
}


// ===== FUN_M73_r4_3c000__0723 @ M73_r4_3c000::0723 =====

void __h3000 FUN_M73_r4_3c000__0723(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0744 ->$070B $06FF */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1);
  return;
}


// ===== FUN_M73_r4_3c000__0744 @ M73_r4_3c000::0744 =====

undefined2 __h3000 FUN_M73_r4_3c000__0744(void)

{
  char cVar1;
  undefined2 in_D;
  short in_U;
  char *pcVar2;
  
  API_FE76();
  cVar1 = (char)((ushort)DAT_701c >> 8);
  *(char *)(in_U + -1) = (char)((char)DAT_701c >> 1 | cVar1 << 7) >> 1 | (cVar1 >> 1) << 7;
  pcVar2 = (char *)(in_U + -2);
  *pcVar2 = cVar1 >> 2;
  FUN_c0cd();
  DAT_7020 = *(undefined2 *)pcVar2;
  DAT_7086 = 1;
  return in_D;
}


// ===== FUN_M73_r4_3c000__078e @ M73_r4_3c000::078e =====

void __h3000 FUN_M73_r4_3c000__078e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$07EB ->$07B2 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768);
  return;
}


// ===== FUN_M73_r4_3c000__079a @ M73_r4_3c000::079a =====

void __h3000 FUN_M73_r4_3c000__079a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$07EB ->$07B2 */
                    /* inline[API_FDBC]: "5.94...h" */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768);
  return;
}


// ===== FUN_M73_r4_3c000__07a6 @ M73_r4_3c000::07a6 =====

void __h3000 FUN_M73_r4_3c000__07a6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$07EB ->$07B2 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768);
  return;
}


// ===== FUN_M73_r4_3c000__07b2 @ M73_r4_3c000::07b2 =====

void __h3000 FUN_M73_r4_3c000__07b2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$07EB ->$07B2 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768);
  return;
}


// ===== FUN_M73_r4_3c000__07be @ M73_r4_3c000::07be =====

void __h3000 FUN_M73_r4_3c000__07be(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$07EB ->$07B2 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768);
  return;
}


// ===== FUN_M73_r4_3c000__07ca @ M73_r4_3c000::07ca =====

void __h3000 FUN_M73_r4_3c000__07ca(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$07EB ->$07B2 $07A6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768);
  return;
}


// ===== FUN_M73_r4_3c000__07eb @ M73_r4_3c000::07eb =====

undefined2 __h3000 FUN_M73_r4_3c000__07eb(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7054;
  *(char *)(in_U + -1) = (char)DAT_7054;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7076 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  return in_D;
}


// ===== FUN_M73_r4_3c000__083d @ M73_r4_3c000::083d =====

void __h3000 FUN_M73_r4_3c000__083d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$089A ->$0861 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817);
  return;
}


// ===== FUN_M73_r4_3c000__0849 @ M73_r4_3c000::0849 =====

void __h3000 FUN_M73_r4_3c000__0849(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$089A ->$0861 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817);
  return;
}


// ===== FUN_M73_r4_3c000__0855 @ M73_r4_3c000::0855 =====

void __h3000 FUN_M73_r4_3c000__0855(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$089A ->$0861 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817);
  return;
}


// ===== FUN_M73_r4_3c000__0861 @ M73_r4_3c000::0861 =====

void __h3000 FUN_M73_r4_3c000__0861(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$089A ->$0861 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817);
  return;
}


// ===== FUN_M73_r4_3c000__086d @ M73_r4_3c000::086d =====

void __h3000 FUN_M73_r4_3c000__086d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$089A ->$0861 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817);
  return;
}


// ===== FUN_M73_r4_3c000__0879 @ M73_r4_3c000::0879 =====

void __h3000 FUN_M73_r4_3c000__0879(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$089A ->$0861 $0855 */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817);
  return;
}


// ===== FUN_M73_r4_3c000__089a @ M73_r4_3c000::089a =====

undefined2 __h3000 FUN_M73_r4_3c000__089a(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_704c;
  *(char *)(in_U + -1) = (char)DAT_704c;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c155();
  DAT_7076 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7076 >> 8));
  return in_D;
}


// ===== FUN_M73_r4_3c000__08ec @ M73_r4_3c000::08ec =====

void __h3000 FUN_M73_r4_3c000__08ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0949 ->$0910 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6);
  return;
}


// ===== FUN_M73_r4_3c000__08f8 @ M73_r4_3c000::08f8 =====

void __h3000 FUN_M73_r4_3c000__08f8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0949 ->$0910 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6);
  return;
}


// ===== FUN_M73_r4_3c000__0904 @ M73_r4_3c000::0904 =====

void __h3000 FUN_M73_r4_3c000__0904(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0949 ->$0910 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6);
  return;
}


// ===== FUN_M73_r4_3c000__0910 @ M73_r4_3c000::0910 =====

void __h3000 FUN_M73_r4_3c000__0910(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0949 ->$0910 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6);
  return;
}


// ===== FUN_M73_r4_3c000__091c @ M73_r4_3c000::091c =====

void __h3000 FUN_M73_r4_3c000__091c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0949 ->$0910 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6);
  return;
}


// ===== FUN_M73_r4_3c000__0928 @ M73_r4_3c000::0928 =====

void __h3000 FUN_M73_r4_3c000__0928(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0949 ->$0910 $0904 */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6);
  return;
}


// ===== FUN_M73_r4_3c000__0949 @ M73_r4_3c000::0949 =====

undefined2 __h3000 FUN_M73_r4_3c000__0949(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7044;
  *(char *)(in_U + -1) = (char)DAT_7044;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7076 = *puVar2;
  return in_D;
}


// ===== FUN_M73_r4_3c000__0989 @ M73_r4_3c000::0989 =====

void __h3000 FUN_M73_r4_3c000__0989(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$09CE ->$09AD */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__09ce_M73_r4_3c000__0963);
  return;
}


// ===== FUN_M73_r4_3c000__0995 @ M73_r4_3c000::0995 =====

void __h3000 FUN_M73_r4_3c000__0995(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$09CE ->$09AD */
                    /* inline[API_FDBC]: "5.94...c" */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__09ce_M73_r4_3c000__0963);
  return;
}


// ===== FUN_M73_r4_3c000__09a1 @ M73_r4_3c000::09a1 =====

void __h3000 FUN_M73_r4_3c000__09a1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$09CE ->$09AD */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__09ce_M73_r4_3c000__0963);
  return;
}


// ===== FUN_M73_r4_3c000__09ad @ M73_r4_3c000::09ad =====

void __h3000 FUN_M73_r4_3c000__09ad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$09CE ->$09AD */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__09ce_M73_r4_3c000__0963);
  return;
}


// ===== FUN_M73_r4_3c000__09ce @ M73_r4_3c000::09ce =====

undefined2 __h3000 FUN_M73_r4_3c000__09ce(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7030;
  *(char *)(in_U + -1) = (char)DAT_7030;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_7034 = *puVar2;
  DAT_7086 = 1;
  return in_D;
}


// ===== FUN_M73_r4_3c000__0a14 @ M73_r4_3c000::0a14 =====

void __h3000 FUN_M73_r4_3c000__0a14(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0A59 ->$0A38 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0a59_M73_r4_3c000__09ee);
  return;
}


// ===== FUN_M73_r4_3c000__0a20 @ M73_r4_3c000::0a20 =====

void __h3000 FUN_M73_r4_3c000__0a20(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0A59 ->$0A38 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__0a59_M73_r4_3c000__09ee);
  return;
}


// ===== FUN_M73_r4_3c000__0a2c @ M73_r4_3c000::0a2c =====

void __h3000 FUN_M73_r4_3c000__0a2c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0A59 ->$0A38 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__0a59_M73_r4_3c000__09ee);
  return;
}


// ===== FUN_M73_r4_3c000__0a38 @ M73_r4_3c000::0a38 =====

void __h3000 FUN_M73_r4_3c000__0a38(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0A59 ->$0A38 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__0a59_M73_r4_3c000__09ee);
  return;
}


// ===== FUN_M73_r4_3c000__0a59 @ M73_r4_3c000::0a59 =====

undefined2 __h3000 FUN_M73_r4_3c000__0a59(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_703a;
  *(char *)(in_U + -1) = (char)DAT_703a;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_703e = *puVar2;
  DAT_7086 = 1;
  return in_D;
}


// ===== FUN_M73_r4_3c000__0a9f @ M73_r4_3c000::0a9f =====

void __h3000 FUN_M73_r4_3c000__0a9f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0AFC ->$0AC3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79);
  return;
}


// ===== FUN_M73_r4_3c000__0aab @ M73_r4_3c000::0aab =====

void __h3000 FUN_M73_r4_3c000__0aab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0AFC ->$0AC3 */
                    /* inline[API_FDBC]: "5.94...y" */
  API_FDBC(param_1,param_2,&PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79);
  return;
}


// ===== FUN_M73_r4_3c000__0ab7 @ M73_r4_3c000::0ab7 =====

void __h3000 FUN_M73_r4_3c000__0ab7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0AFC ->$0AC3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79);
  return;
}


// ===== FUN_M73_r4_3c000__0ac3 @ M73_r4_3c000::0ac3 =====

void __h3000 FUN_M73_r4_3c000__0ac3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0AFC ->$0AC3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79);
  return;
}


// ===== FUN_M73_r4_3c000__0acf @ M73_r4_3c000::0acf =====

void __h3000 FUN_M73_r4_3c000__0acf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0AFC ->$0AC3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79);
  return;
}


// ===== FUN_M73_r4_3c000__0adb @ M73_r4_3c000::0adb =====

void __h3000 FUN_M73_r4_3c000__0adb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0AFC ->$0AC3 $0AB7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79);
  return;
}


// ===== FUN_M73_r4_3c000__0afc @ M73_r4_3c000::0afc =====

undefined2 __h3000 FUN_M73_r4_3c000__0afc(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7004;
  *(short *)(in_U + -2) = sVar1;
  DAT_7076 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_7076) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M73_r4_3c000__0b51 @ M73_r4_3c000::0b51 =====

void __h3000 FUN_M73_r4_3c000__0b51(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M73_r4_3c000__0b96_M73_r4_3c000__0b2b);
  return;
}


// ===== FUN_M73_r4_3c000__0b5d @ M73_r4_3c000::0b5d =====

void __h3000 FUN_M73_r4_3c000__0b5d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0B96 ->$0B75 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M73_r4_3c000__0b96_M73_r4_3c000__0b2b);
  return;
}


// ===== FUN_M73_r4_3c000__0b69 @ M73_r4_3c000::0b69 =====

void __h3000 FUN_M73_r4_3c000__0b69(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M73_r4_3c000__0b96_M73_r4_3c000__0b2b);
  return;
}


// ===== FUN_M73_r4_3c000__0b75 @ M73_r4_3c000::0b75 =====

void __h3000 FUN_M73_r4_3c000__0b75(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M73_r4_3c000__0b96_M73_r4_3c000__0b2b);
  return;
}


// ===== FUN_M73_r4_3c000__0b96 @ M73_r4_3c000::0b96 =====

undefined2 __h3000 FUN_M73_r4_3c000__0b96(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M73_r4_3c000__0b96_M73_r4_3c000__0b2b);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M73_r4_3c000__0bcc @ M73_r4_3c000::0bcc =====

void __h3000 FUN_M73_r4_3c000__0bcc(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c11_M73_r4_3c000__0ba6);
  return;
}


// ===== FUN_M73_r4_3c000__0bd8 @ M73_r4_3c000::0bd8 =====

void __h3000 FUN_M73_r4_3c000__0bd8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0C11 ->$0BF0 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c11_M73_r4_3c000__0ba6);
  return;
}


// ===== FUN_M73_r4_3c000__0be4 @ M73_r4_3c000::0be4 =====

void __h3000 FUN_M73_r4_3c000__0be4(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c11_M73_r4_3c000__0ba6);
  return;
}


// ===== FUN_M73_r4_3c000__0bf0 @ M73_r4_3c000::0bf0 =====

void __h3000 FUN_M73_r4_3c000__0bf0(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c11_M73_r4_3c000__0ba6);
  return;
}


// ===== FUN_M73_r4_3c000__0c11 @ M73_r4_3c000::0c11 =====

undefined2 __h3000 FUN_M73_r4_3c000__0c11(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c11_M73_r4_3c000__0ba6);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M73_r4_3c000__0c47 @ M73_r4_3c000::0c47 =====

void __h3000 FUN_M73_r4_3c000__0c47(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c8c_M73_r4_3c000__0c21);
  return;
}


// ===== FUN_M73_r4_3c000__0c53 @ M73_r4_3c000::0c53 =====

void __h3000 FUN_M73_r4_3c000__0c53(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0C8C ->$0C6B */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c8c_M73_r4_3c000__0c21);
  return;
}


// ===== FUN_M73_r4_3c000__0c5f @ M73_r4_3c000::0c5f =====

void __h3000 FUN_M73_r4_3c000__0c5f(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c8c_M73_r4_3c000__0c21);
  return;
}


// ===== FUN_M73_r4_3c000__0c6b @ M73_r4_3c000::0c6b =====

void __h3000 FUN_M73_r4_3c000__0c6b(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c8c_M73_r4_3c000__0c21);
  return;
}


// ===== FUN_M73_r4_3c000__0c8c @ M73_r4_3c000::0c8c =====

undefined2 __h3000 FUN_M73_r4_3c000__0c8c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M73_r4_3c000__0c8c_M73_r4_3c000__0c21);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M73_r4_3c000__0cc2 @ M73_r4_3c000::0cc2 =====

void __h3000 FUN_M73_r4_3c000__0cc2(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M73_r4_3c000__0d07_M73_r4_3c000__0c9c);
  return;
}


// ===== FUN_M73_r4_3c000__0cce @ M73_r4_3c000::0cce =====

void __h3000 FUN_M73_r4_3c000__0cce(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0D07 ->$0CE6 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M73_r4_3c000__0d07_M73_r4_3c000__0c9c);
  return;
}


// ===== FUN_M73_r4_3c000__0cda @ M73_r4_3c000::0cda =====

void __h3000 FUN_M73_r4_3c000__0cda(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M73_r4_3c000__0d07_M73_r4_3c000__0c9c);
  return;
}


// ===== FUN_M73_r4_3c000__0ce6 @ M73_r4_3c000::0ce6 =====

void __h3000 FUN_M73_r4_3c000__0ce6(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M73_r4_3c000__0d07_M73_r4_3c000__0c9c);
  return;
}


// ===== FUN_M73_r4_3c000__0d07 @ M73_r4_3c000::0d07 =====

undefined2 __h3000 FUN_M73_r4_3c000__0d07(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M73_r4_3c000__0d07_M73_r4_3c000__0c9c);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M73_r4_3c000__0d17 @ M73_r4_3c000::0d17 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0d37 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M73_r4_3c000__0d17(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_7086 != 0) {
                    /* inline[API_FC62]: $6013 */
    ModuleStorePtr(0xd);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x0d37. Too many branches */
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


// ===== FUN_M73_r4_3c000__0d46 @ M73_r4_3c000::0d46 =====

undefined2 __h3000 FUN_M73_r4_3c000__0d46(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_702a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7020 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7034 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_703e >> 8));
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(4);
  DAT_7086 = 0;
  API_FD76();
  return in_D;
}


