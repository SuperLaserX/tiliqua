// H3000_v153 - decompiled by Ghidra (6809, __h3000 convention)
// block M6C_small_04000 M6C_small_04000::0000-M6C_small_04000::3fff, 255 functions
// Bank small_04000 (module id 6C)

// ===== MODULE_6C_01_entry @ M6C_small_04000::00b0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x00c5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_6C_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $00B4 */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  API_FC58();
  DspLoadProgram(uVar1,uVar3,0x110);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x111);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x112);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DAT_7030 = 0;
        DAT_7038 = 0;
        DAT_70b0 = 0;
        DAT_7050 = 0;
        DAT_7058 = 0;
        DAT_7040 = 0;
        DAT_7046 = 0;
        DAT_7048 = 0;
        DAT_704a = 0;
        DAT_70b8 = 200;
        DAT_70be = &BYTE_M6C_small_04000__012c;
        DAT_70ba = 0xffff;
        DAT_70bc = 0;
                    /* inline[API_FE08]: 45:3E 3D:2E 3F:36 49:56 47:4E 53:44 4B:34 4D:3C 57:5C */
        LoadParamsScaled();
                    /* inline[API_FE08]: 55:54 88:A4 */
        LoadParamsScaled();
                    /* inline[API_FE04]: 8A:5E 8B:60 8C:62 8D:64 8E:66 8F:68 90:6A 91:6C 92:6E 93:70
                       94:72 95:74 59:4C */
        LoadParamsSigned();
                    /* inline[API_FE08]: 5A:76 5C:78 5E:7A 60:7C 62:7E 64:80 66:82 68:84 6A:86 */
        LoadParamsScaled();
                    /* inline[API_FE08]: 6C:88 6E:8A 70:8C 96:A6 98:A8 9A:AA 9C:AC 72:8E 74:90 */
        LoadParamsScaled();
                    /* inline[API_FE08]: 76:92 78:94 7A:96 7C:98 7E:9A 80:9C 82:9E 84:A0 86:A2 */
        LoadParamsScaled();
                    /* inline[API_FE08]: 41:AE 9E:B6 */
        LoadParamsScaled();
        API_FD7C();
        FUN_M6C_small_04000__1bfe();
        FUN_M6C_small_04000__2517();
        FUN_M6C_small_04000__2631();
        FUN_M6C_small_04000__0afd();
        FUN_M6C_small_04000__0fa1();
        FUN_M6C_small_04000__0e19();
        FUN_M6C_small_04000__0d2d();
        FUN_M6C_small_04000__0c25();
        FUN_M6C_small_04000__26c7();
        FUN_M6C_small_04000__2769();
        FUN_M6C_small_04000__270f();
                    /* inline[API_FC62]: $6011 */
        ModuleStorePtr(9);
        API_FC6C(0);
        API_FC74();
                    /* inline[API_FD84]: 00 80 "diffusor" 21 $1B36 $1B42 */
        DefineParameter();
                    /* inline[API_FD84]: 01 80 " delay  " 25 $0A32 $0A3E */
        DefineParameter();
                    /* inline[API_FD84]: 02 80 "panning " 29 $0E81 $0E8D */
        DefineParameter();
                    /* inline[API_FD84]: 03 80 "feedback" 2D $0B5A $0B66 */
        DefineParameter();
                    /* inline[API_FD84]: 04 80 " mix 1  " 31 $244A $2456 */
        DefineParameter();
                    /* inline[API_FD84]: 05 80 " mix 2  " 35 $2564 $2570 */
        DefineParameter();
        DAT_60f5 = PTR_ARRAY_M6C_small_04000__027c;
        DAT_60f7 = 0x33;
        API_FDF6();
        FUN_e568();
        FUN_M6C_small_04000__054e();
        FUN_e585();
        API_FD20(0x4e);
        return uVar2;
      }
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return uVar2;
}


// ===== FUN_M6C_small_04000__02e2 @ M6C_small_04000::02e2 =====

void __h3000 FUN_M6C_small_04000__02e2(void)

{
  FUN_M6C_small_04000__2462();
  FUN_M6C_small_04000__0587();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__02ed @ M6C_small_04000::02ed =====

void __h3000 FUN_M6C_small_04000__02ed(void)

{
  FUN_M6C_small_04000__257c();
  FUN_M6C_small_04000__0587();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__02f8 @ M6C_small_04000::02f8 =====

void __h3000 FUN_M6C_small_04000__02f8(void)

{
  FUN_M6C_small_04000__0a4a();
  FUN_M6C_small_04000__054e();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__0303 @ M6C_small_04000::0303 =====

void __h3000 FUN_M6C_small_04000__0303(void)

{
  FUN_M6C_small_04000__1b4e();
  FUN_M6C_small_04000__054e();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__030e @ M6C_small_04000::030e =====

void __h3000 FUN_M6C_small_04000__030e(void)

{
  FUN_M6C_small_04000__0e99();
  FUN_M6C_small_04000__054e();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__0319 @ M6C_small_04000::0319 =====

void __h3000 FUN_M6C_small_04000__0319(void)

{
  FUN_M6C_small_04000__0d4d();
  FUN_M6C_small_04000__05b9();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__0324 @ M6C_small_04000::0324 =====

void __h3000 FUN_M6C_small_04000__0324(void)

{
  FUN_M6C_small_04000__0fed();
  FUN_M6C_small_04000__061d();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__032f @ M6C_small_04000::032f =====

void __h3000 FUN_M6C_small_04000__032f(void)

{
  FUN_M6C_small_04000__13ae();
  FUN_M6C_small_04000__061d();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__033a @ M6C_small_04000::033a =====

void __h3000 FUN_M6C_small_04000__033a(void)

{
  FUN_M6C_small_04000__16ef();
  FUN_M6C_small_04000__061d();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__0345 @ M6C_small_04000::0345 =====

void __h3000 FUN_M6C_small_04000__0345(void)

{
  FUN_M6C_small_04000__1d2d();
  FUN_M6C_small_04000__06b3();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__0350 @ M6C_small_04000::0350 =====

void __h3000 FUN_M6C_small_04000__0350(void)

{
  FUN_M6C_small_04000__1d34();
  FUN_M6C_small_04000__06b3();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__035b @ M6C_small_04000::035b =====

void __h3000 FUN_M6C_small_04000__035b(void)

{
  FUN_M6C_small_04000__1d3b();
  FUN_M6C_small_04000__06b3();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__0366 @ M6C_small_04000::0366 =====

void __h3000 FUN_M6C_small_04000__0366(void)

{
  FUN_M6C_small_04000__1d42();
  FUN_M6C_small_04000__06b3();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__0371 @ M6C_small_04000::0371 =====

void __h3000 FUN_M6C_small_04000__0371(void)

{
  FUN_M6C_small_04000__1d49();
  FUN_M6C_small_04000__06ec();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__037c @ M6C_small_04000::037c =====

void __h3000 FUN_M6C_small_04000__037c(void)

{
  FUN_M6C_small_04000__1d50();
  FUN_M6C_small_04000__06ec();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__0387 @ M6C_small_04000::0387 =====

void __h3000 FUN_M6C_small_04000__0387(void)

{
  FUN_M6C_small_04000__1d57();
  FUN_M6C_small_04000__06ec();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__0392 @ M6C_small_04000::0392 =====

void __h3000 FUN_M6C_small_04000__0392(void)

{
  FUN_M6C_small_04000__1d5e();
  FUN_M6C_small_04000__06ec();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__039d @ M6C_small_04000::039d =====

void __h3000 FUN_M6C_small_04000__039d(void)

{
  FUN_M6C_small_04000__1d65();
  FUN_M6C_small_04000__0725();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__03a8 @ M6C_small_04000::03a8 =====

void __h3000 FUN_M6C_small_04000__03a8(void)

{
  FUN_M6C_small_04000__1d6c();
  FUN_M6C_small_04000__0725();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__03b3 @ M6C_small_04000::03b3 =====

void __h3000 FUN_M6C_small_04000__03b3(void)

{
  FUN_M6C_small_04000__1d73();
  FUN_M6C_small_04000__0725();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__03be @ M6C_small_04000::03be =====

void __h3000 FUN_M6C_small_04000__03be(void)

{
  FUN_M6C_small_04000__1d7a();
  FUN_M6C_small_04000__0725();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__03c9 @ M6C_small_04000::03c9 =====

void __h3000 FUN_M6C_small_04000__03c9(void)

{
  FUN_M6C_small_04000__1f2d();
  FUN_M6C_small_04000__0782();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__03d4 @ M6C_small_04000::03d4 =====

void __h3000 FUN_M6C_small_04000__03d4(void)

{
  FUN_M6C_small_04000__1f34();
  FUN_M6C_small_04000__0782();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__03df @ M6C_small_04000::03df =====

void __h3000 FUN_M6C_small_04000__03df(void)

{
  FUN_M6C_small_04000__1f3b();
  FUN_M6C_small_04000__0782();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__03ea @ M6C_small_04000::03ea =====

void __h3000 FUN_M6C_small_04000__03ea(void)

{
  FUN_M6C_small_04000__1f42();
  FUN_M6C_small_04000__0782();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__03f5 @ M6C_small_04000::03f5 =====

void __h3000 FUN_M6C_small_04000__03f5(void)

{
  FUN_M6C_small_04000__1f49();
  FUN_M6C_small_04000__07bb();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__0400 @ M6C_small_04000::0400 =====

void __h3000 FUN_M6C_small_04000__0400(void)

{
  FUN_M6C_small_04000__1f50();
  FUN_M6C_small_04000__07bb();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__040b @ M6C_small_04000::040b =====

void __h3000 FUN_M6C_small_04000__040b(void)

{
  FUN_M6C_small_04000__1f57();
  FUN_M6C_small_04000__07bb();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__0416 @ M6C_small_04000::0416 =====

void __h3000 FUN_M6C_small_04000__0416(void)

{
  FUN_M6C_small_04000__1f5e();
  FUN_M6C_small_04000__07bb();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__0421 @ M6C_small_04000::0421 =====

void __h3000 FUN_M6C_small_04000__0421(void)

{
  FUN_M6C_small_04000__1f65();
  FUN_M6C_small_04000__07f4();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__042c @ M6C_small_04000::042c =====

void __h3000 FUN_M6C_small_04000__042c(void)

{
  FUN_M6C_small_04000__1f6c();
  FUN_M6C_small_04000__07f4();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__0437 @ M6C_small_04000::0437 =====

void __h3000 FUN_M6C_small_04000__0437(void)

{
  FUN_M6C_small_04000__1f73();
  FUN_M6C_small_04000__07f4();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__0442 @ M6C_small_04000::0442 =====

void __h3000 FUN_M6C_small_04000__0442(void)

{
  FUN_M6C_small_04000__1f7a();
  FUN_M6C_small_04000__07f4();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__044d @ M6C_small_04000::044d =====

void __h3000 FUN_M6C_small_04000__044d(void)

{
  FUN_M6C_small_04000__2113();
  FUN_M6C_small_04000__0851();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__0458 @ M6C_small_04000::0458 =====

void __h3000 FUN_M6C_small_04000__0458(void)

{
  FUN_M6C_small_04000__211a();
  FUN_M6C_small_04000__0851();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__0463 @ M6C_small_04000::0463 =====

void __h3000 FUN_M6C_small_04000__0463(void)

{
  FUN_M6C_small_04000__2121();
  FUN_M6C_small_04000__0851();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__046e @ M6C_small_04000::046e =====

void __h3000 FUN_M6C_small_04000__046e(void)

{
  FUN_M6C_small_04000__2128();
  FUN_M6C_small_04000__0851();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__0479 @ M6C_small_04000::0479 =====

void __h3000 FUN_M6C_small_04000__0479(void)

{
  FUN_M6C_small_04000__212f();
  FUN_M6C_small_04000__088a();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__0484 @ M6C_small_04000::0484 =====

void __h3000 FUN_M6C_small_04000__0484(void)

{
  FUN_M6C_small_04000__2136();
  FUN_M6C_small_04000__088a();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__048f @ M6C_small_04000::048f =====

void __h3000 FUN_M6C_small_04000__048f(void)

{
  FUN_M6C_small_04000__213d();
  FUN_M6C_small_04000__088a();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__049a @ M6C_small_04000::049a =====

void __h3000 FUN_M6C_small_04000__049a(void)

{
  FUN_M6C_small_04000__2144();
  FUN_M6C_small_04000__088a();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__04a5 @ M6C_small_04000::04a5 =====

void __h3000 FUN_M6C_small_04000__04a5(void)

{
  FUN_M6C_small_04000__214b();
  FUN_M6C_small_04000__08c3();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__04b0 @ M6C_small_04000::04b0 =====

void __h3000 FUN_M6C_small_04000__04b0(void)

{
  FUN_M6C_small_04000__2152();
  FUN_M6C_small_04000__08c3();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__04bb @ M6C_small_04000::04bb =====

void __h3000 FUN_M6C_small_04000__04bb(void)

{
  FUN_M6C_small_04000__2159();
  FUN_M6C_small_04000__08c3();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__04c6 @ M6C_small_04000::04c6 =====

void __h3000 FUN_M6C_small_04000__04c6(void)

{
  FUN_M6C_small_04000__2160();
  FUN_M6C_small_04000__08c3();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__04d1 @ M6C_small_04000::04d1 =====

void __h3000 FUN_M6C_small_04000__04d1(void)

{
  FUN_M6C_small_04000__22c2();
  FUN_M6C_small_04000__0920();
  FUN_e585();
  return;
}


// ===== FUN_M6C_small_04000__04dc @ M6C_small_04000::04dc =====

void __h3000 FUN_M6C_small_04000__04dc(void)

{
  FUN_M6C_small_04000__22c9();
  FUN_M6C_small_04000__0920();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__04e7 @ M6C_small_04000::04e7 =====

void __h3000 FUN_M6C_small_04000__04e7(void)

{
  FUN_M6C_small_04000__22d0();
  FUN_M6C_small_04000__0920();
  FUN_e595();
  return;
}


// ===== FUN_M6C_small_04000__04f2 @ M6C_small_04000::04f2 =====

void __h3000 FUN_M6C_small_04000__04f2(void)

{
  FUN_M6C_small_04000__22d7();
  FUN_M6C_small_04000__0920();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__04fd @ M6C_small_04000::04fd =====

void __h3000 FUN_M6C_small_04000__04fd(void)

{
  FUN_M6C_small_04000__0b72();
  FUN_M6C_small_04000__054e();
  FUN_e59d();
  return;
}


// ===== FUN_M6C_small_04000__0508 @ M6C_small_04000::0508 =====

void __h3000 FUN_M6C_small_04000__0508(void)

{
  FUN_M6C_small_04000__0c80();
  FUN_M6C_small_04000__05b9();
  FUN_e58d();
  return;
}


// ===== FUN_M6C_small_04000__0513 @ M6C_small_04000::0513 =====

void __h3000 FUN_M6C_small_04000__0513(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M6C_small_04000__054e @ M6C_small_04000::054e =====

void __h3000 FUN_M6C_small_04000__054e(void)

{
                    /* inline[API_FE02]: "m delay " "diffusor" " width  " "feedback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A71 ->$1B72 ->$0EC0 ->$0B99 ->$0587 ->$0587 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0587 @ M6C_small_04000::0587 =====

void __h3000 FUN_M6C_small_04000__0587(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2489 ->$25A3 ->$097D ->$05B9 ->$054E ->$054E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__05b9 @ M6C_small_04000::05b9 =====

void __h3000 FUN_M6C_small_04000__05b9(void)

{
                    /* inline[API_FE02]: "st/mono " " fb tap " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D71 ->$0CA4 ->$097D ->$0587 ->$05EB ->$05EB */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__05eb @ M6C_small_04000::05eb =====

void __h3000 FUN_M6C_small_04000__05eb(void)

{
                    /* inline[API_FE02]: "quickset" " tedium " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$061D ->$0656 ->$097D ->$0587 ->$05B9 ->$05B9 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__061d @ M6C_small_04000::061d =====

void __h3000 FUN_M6C_small_04000__061d(void)

{
                    /* inline[API_FE02]: "spacing " "weights " " pans   " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1002 ->$13C3 ->$1704 ->$05EB ->$061D ->$061D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0656 @ M6C_small_04000::0656 =====

void __h3000 FUN_M6C_small_04000__0656(void)

{
                    /* inline[API_FE02]: "tapdelay" "taplevel" "pan taps" "apdelays" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$06B3 ->$0782 ->$0851 ->$0920 ->$068F ->$068F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__068f @ M6C_small_04000::068f =====

void __h3000 FUN_M6C_small_04000__068f(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$097D ->$097D ->$097D ->$05EB ->$0656 ->$0656 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__06b3 @ M6C_small_04000::06b3 =====

void __h3000 FUN_M6C_small_04000__06b3(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1DAF ->$1DB6 ->$1DBD ->$1DC4 ->$06EC ->$075E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__06ec @ M6C_small_04000::06ec =====

void __h3000 FUN_M6C_small_04000__06ec(void)

{
                    /* inline[API_FE02]: "delay 5 " "delay 6 " "delay 7 " "delay 8 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1DCB ->$1DD2 ->$1DD9 ->$1DE0 ->$0725 ->$06B3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0725 @ M6C_small_04000::0725 =====

void __h3000 FUN_M6C_small_04000__0725(void)

{
                    /* inline[API_FE02]: "delay 9 " "delay 10" "delay 11" "delay 12" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1DE7 ->$1DEE ->$1DF5 ->$1DFC ->$075E ->$06EC */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__075e @ M6C_small_04000::075e =====

void __h3000 FUN_M6C_small_04000__075e(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$06B3 ->$0725 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0782 @ M6C_small_04000::0782 =====

void __h3000 FUN_M6C_small_04000__0782(void)

{
                    /* inline[API_FE02]: " tap 1  " " tap 2  " " tap 3  " " tap 4  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FAF ->$1FB6 ->$1FBD ->$1FC4 ->$07BB ->$082D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__07bb @ M6C_small_04000::07bb =====

void __h3000 FUN_M6C_small_04000__07bb(void)

{
                    /* inline[API_FE02]: " tap 5  " " tap 6  " " tap 7  " " tap 8  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FCB ->$1FD2 ->$1FD9 ->$1FE0 ->$07F4 ->$0782 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__07f4 @ M6C_small_04000::07f4 =====

void __h3000 FUN_M6C_small_04000__07f4(void)

{
                    /* inline[API_FE02]: " tap 9  " " tap 10 " " tap 11 " " tap 12 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FE7 ->$1FEE ->$1FF5 ->$1FFC ->$082D ->$07BB */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__082d @ M6C_small_04000::082d =====

void __h3000 FUN_M6C_small_04000__082d(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$0782 ->$07F4 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0851 @ M6C_small_04000::0851 =====

void __h3000 FUN_M6C_small_04000__0851(void)

{
                    /* inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2195 ->$219C ->$21A3 ->$21AA ->$088A ->$08FC */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__088a @ M6C_small_04000::088a =====

void __h3000 FUN_M6C_small_04000__088a(void)

{
                    /* inline[API_FE02]: " pan 5  " " pan 6  " " pan 7  " " pan 8  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$21B1 ->$21B8 ->$21BF ->$21C6 ->$08C3 ->$0851 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__08c3 @ M6C_small_04000::08c3 =====

void __h3000 FUN_M6C_small_04000__08c3(void)

{
                    /* inline[API_FE02]: " pan 9  " " pan 10 " " pan 11 " " pan 12 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$21CD ->$21D4 ->$21DB ->$21E2 ->$08FC ->$088A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__08fc @ M6C_small_04000::08fc =====

void __h3000 FUN_M6C_small_04000__08fc(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$0851 ->$08C3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0920 @ M6C_small_04000::0920 =====

void __h3000 FUN_M6C_small_04000__0920(void)

{
                    /* inline[API_FE02]: "apdelay1" "apdelay2" "apdelay3" "apdelay4" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$230C ->$2313 ->$231A ->$2321 ->$0959 ->$0959 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__0959 @ M6C_small_04000::0959 =====

void __h3000 FUN_M6C_small_04000__0959(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$0920 ->$0920 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_small_04000__097d @ M6C_small_04000::097d =====

void __h3000 FUN_M6C_small_04000__097d(void)

{
  return;
}


// ===== FUN_M6C_small_04000__097e @ M6C_small_04000::097e =====

undefined2 __h3000 FUN_M6C_small_04000__097e(void)

{
  bool bVar1;
  undefined2 in_D;
  
  if (DAT_70bc == 0) {
    DAT_70b8 = DAT_70b8 - DAT_70be;
    if (DAT_70b8 < 1) {
      DAT_70b8 = 0;
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70b8 >> 8));
      FUN_M6C_small_04000__26c7();
      DAT_70bc = -1;
      DAT_70ba = 0;
    }
    else {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70b8 >> 8));
    }
  }
  else if (DAT_70ba == 0) {
    bVar1 = SCARRY2(DAT_70b8,DAT_70be);
    DAT_70b8 = DAT_70b8 + DAT_70be;
    if (bVar1) {
      DAT_70b8 = 0x7fff;
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70b8 >> 8));
      DAT_70ba = -1;
    }
    else {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70b8 >> 8));
    }
  }
  return in_D;
}


// ===== FUN_M6C_small_04000__0a32 @ M6C_small_04000::0a32 =====

void __h3000 FUN_M6C_small_04000__0a32(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0AE8 ->$0AFD $704E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_small_04000__0ae8_M6C_small_04000__0a24);
  return;
}


// ===== FUN_M6C_small_04000__0a3e @ M6C_small_04000::0a3e =====

void __h3000 FUN_M6C_small_04000__0a3e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0AE8 ->$0AFD $704E */
  FUN_e736(param_1,param_2,&PTR_FUN_M6C_small_04000__0ae8_M6C_small_04000__0a24);
  return;
}


// ===== FUN_M6C_small_04000__0a4a @ M6C_small_04000::0a4a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0a4a(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_704e = DAT_60f9 - DAT_7050;
  FUN_M6C_small_04000__0afd();
  API_FC82((char)((ushort)DAT_704e >> 8),(char)DAT_704e,param_1,0x47);
  return in_D;
}


// ===== FUN_M6C_small_04000__0a71 @ M6C_small_04000::0a71 =====

undefined2 __h3000 FUN_M6C_small_04000__0a71(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7052;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       master delay:     % " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0001 $0000 ->$0AE8 ->$0ABE
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__0ae8();
  return in_D;
}


// ===== FUN_M6C_small_04000__0abe @ M6C_small_04000::0abe =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0abe(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_704e = DAT_6074 - DAT_7050;
  API_FC82((char)((ushort)DAT_704e >> 8),(char)DAT_704e,param_1,0x47);
  FUN_M6C_small_04000__0afd();
  FUN_eb1d((char)((ushort)DAT_704e >> 8),(char)DAT_704e,param_1,2);
  return in_D;
}


// ===== FUN_M6C_small_04000__0ae8 @ M6C_small_04000::0ae8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0ae8(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6C_small_04000__0afd @ M6C_small_04000::0afd =====

undefined2 __h3000 FUN_M6C_small_04000__0afd(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 1;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_704e + DAT_7050;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7052 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEE();
  sVar1 = DAT_7052;
  DAT_701c = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_7052;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_70c2 = *psVar2 + DAT_701c;
  DAT_70bc = 0;
  return in_D;
}


// ===== FUN_M6C_small_04000__0b5a @ M6C_small_04000::0b5a =====

void __h3000 FUN_M6C_small_04000__0b5a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0C10 ->$0C25 $70AE */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_small_04000__0c10_M6C_small_04000__0b4c);
  return;
}


// ===== FUN_M6C_small_04000__0b66 @ M6C_small_04000::0b66 =====

void __h3000 FUN_M6C_small_04000__0b66(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0C10 ->$0C25 $70AE */
  FUN_e736(param_1,param_2,&PTR_FUN_M6C_small_04000__0c10_M6C_small_04000__0b4c);
  return;
}


// ===== FUN_M6C_small_04000__0b72 @ M6C_small_04000::0b72 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0b72(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70ae = DAT_60f9 - DAT_70b0;
  FUN_M6C_small_04000__0c25();
  API_FC82((char)((ushort)DAT_70ae >> 8),(char)DAT_70ae,param_1,0x41);
  return in_D;
}


// ===== FUN_M6C_small_04000__0b99 @ M6C_small_04000::0b99 =====

undefined2 __h3000 FUN_M6C_small_04000__0b99(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70b2;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       feedback:     %     " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$0C10 ->$0BE6
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__0c10();
  return in_D;
}


// ===== FUN_M6C_small_04000__0be6 @ M6C_small_04000::0be6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0be6(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70ae = DAT_6074 - DAT_70b0;
  API_FC82((char)((ushort)DAT_70ae >> 8),(char)DAT_70ae,param_1,0x41);
  FUN_M6C_small_04000__0c25();
  FUN_eb1d((char)((ushort)DAT_70ae >> 8),(char)DAT_70ae,param_1,0x31);
  return in_D;
}


// ===== FUN_M6C_small_04000__0c10 @ M6C_small_04000::0c10 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0c10(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M6C_small_04000__0c25 @ M6C_small_04000::0c25 =====

undefined2 __h3000 FUN_M6C_small_04000__0c25(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0x9c;
  *(undefined1 *)(in_U + -2) = 0xff;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_70ae + DAT_70b0;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_70b2 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  sVar1 = DAT_70b2;
  DAT_701c = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_70b2;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_701c = *psVar2 + DAT_701c;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8));
  return in_D;
}


// ===== FUN_M6C_small_04000__0c80 @ M6C_small_04000::0c80 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0c80(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70b6 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6C_small_04000__0d2d();
  API_FC82((char)((ushort)DAT_70b6 >> 8),(char)DAT_70b6,param_1,0x9e);
  return in_D;
}


// ===== FUN_M6C_small_04000__0ca4 @ M6C_small_04000::0ca4 =====

undefined2 __h3000 FUN_M6C_small_04000__0ca4(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70b6;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       feedback from tap:  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $000C $0001 $0000 ->$0D18 ->$0CF1
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__0d18();
  return in_D;
}


// ===== FUN_M6C_small_04000__0cf1 @ M6C_small_04000::0cf1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0cf1(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70b6 = DAT_6074;
  API_FC82((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x9e);
  FUN_M6C_small_04000__0d2d();
  FUN_eb1d((char)((ushort)DAT_70b6 >> 8),(char)DAT_70b6,param_1,0x32);
  return in_D;
}


// ===== FUN_M6C_small_04000__0d18 @ M6C_small_04000::0d18 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0d18(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M6C_small_04000__0d2d @ M6C_small_04000::0d2d =====

undefined2 __h3000 FUN_M6C_small_04000__0d2d(void)

{
  undefined2 in_D;
  
  DAT_701c = DAT_70b6 + 9;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8));
  return in_D;
}


// ===== FUN_M6C_small_04000__0d4d @ M6C_small_04000::0d4d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0d4d(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_704c = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6C_small_04000__0e19();
  API_FC80((char)((ushort)DAT_704c >> 8),(char)DAT_704c,param_1,0x59);
  return in_D;
}


// ===== FUN_M6C_small_04000__0d71 @ M6C_small_04000::0d71 =====

undefined2 __h3000 FUN_M6C_small_04000__0d71(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_704c;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       input mode:         " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$0DE5 ->$0DBE
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__0de5();
  return in_D;
}


// ===== FUN_M6C_small_04000__0dbe @ M6C_small_04000::0dbe =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0dbe(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_704c = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x59);
  FUN_M6C_small_04000__0e19();
  FUN_eb1d((char)((ushort)DAT_704c >> 8),(char)DAT_704c,param_1,5);
  return in_D;
}


// ===== FUN_M6C_small_04000__0de5 @ M6C_small_04000::0de5 =====

undefined2 __h3000 FUN_M6C_small_04000__0de5(void)

{
  undefined2 in_D;
  
  if (DAT_704c == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "stereo" */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "mono  " */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M6C_small_04000__0e19 @ M6C_small_04000::0e19 =====

undefined2 __h3000 FUN_M6C_small_04000__0e19(void)

{
  undefined2 in_D;
  
  if (DAT_704c == 0) {
    API_FD20(0);
    API_FD2E(0x40);
    API_FD20(0);
    API_FD2E(0x40);
  }
  else {
    API_FD20(0);
    API_FD2E(0x7f);
    API_FD20(0);
    API_FD2E(0);
  }
  return in_D;
}


// ===== FUN_M6C_small_04000__0e81 @ M6C_small_04000::0e81 =====

void __h3000 FUN_M6C_small_04000__0e81(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F46 ->$0FA1 $7056 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_small_04000__0f46_M6C_small_04000__0e73);
  return;
}


// ===== FUN_M6C_small_04000__0e8d @ M6C_small_04000::0e8d =====

void __h3000 FUN_M6C_small_04000__0e8d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F46 ->$0FA1 $7056 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6C_small_04000__0f46_M6C_small_04000__0e73);
  return;
}


// ===== FUN_M6C_small_04000__0e99 @ M6C_small_04000::0e99 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0e99(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7056 = DAT_60f9 - DAT_7058;
  FUN_M6C_small_04000__0fa1();
  API_FC82((char)((ushort)DAT_7056 >> 8),(char)DAT_7056,param_1,0x49);
  return in_D;
}


// ===== FUN_M6C_small_04000__0ec0 @ M6C_small_04000::0ec0 =====

undefined2 __h3000 FUN_M6C_small_04000__0ec0(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_705a;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       image width:-                     -" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$0F46 ->$0F1C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__0f46();
  return in_D;
}


// ===== FUN_M6C_small_04000__0f1c @ M6C_small_04000::0f1c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__0f1c(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7056 = DAT_6074 - DAT_7058;
  API_FC82((char)((ushort)DAT_7056 >> 8),(char)DAT_7056,param_1,0x49);
  FUN_M6C_small_04000__0fa1();
  FUN_eb1d((char)((ushort)DAT_7056 >> 8),(char)DAT_7056,param_1,4);
  return in_D;
}


// ===== FUN_M6C_small_04000__0f46 @ M6C_small_04000::0f46 =====

undefined2 __h3000 FUN_M6C_small_04000__0f46(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                     " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_705a + 100;
  *(undefined1 *)(in_U + -3) = 10;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  DAT_701c = *psVar1;
  LcdSetCursor((char)((ushort)(DAT_701c + 0x12) >> 8));
  API_FC2A();
  LcdSetCursor((char)((ushort)(0x26 - DAT_701c) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M6C_small_04000__0fa1 @ M6C_small_04000::0fa1 =====

undefined2 __h3000 FUN_M6C_small_04000__0fa1(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0x9c;
  *(undefined1 *)(in_U + -2) = 0xff;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_7056 + DAT_7058;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_705a = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  sVar1 = DAT_705a;
  DAT_701c = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_705a;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_70c0 = *psVar2 + DAT_701c;
  FUN_M6C_small_04000__270f();
  return in_D;
}


// ===== FUN_M6C_small_04000__0fed @ M6C_small_04000::0fed =====

undefined2 __h3000 FUN_M6C_small_04000__0fed(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_60f9;
  DAT_7046 = DAT_60f9;
  FUN_M6C_small_04000__1002();
  FUN_M6C_small_04000__104b();
  FUN_M6C_small_04000__11dd();
  return in_D;
}


// ===== FUN_M6C_small_04000__1002 @ M6C_small_04000::1002 =====

undefined2 __h3000 FUN_M6C_small_04000__1002(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7046;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$104B ->$103E
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__104b();
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x11);
  return in_D;
}


// ===== FUN_M6C_small_04000__103e @ M6C_small_04000::103e =====

undefined2 __h3000 FUN_M6C_small_04000__103e(void)

{
  undefined2 in_D;
  
  DAT_7046 = DAT_6074;
  FUN_M6C_small_04000__104b();
  return in_D;
}


// ===== FUN_M6C_small_04000__104b @ M6C_small_04000::104b =====

undefined2 __h3000 FUN_M6C_small_04000__104b(void)

{
  undefined2 in_D;
  
  if (DAT_7046 != 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "hit enter for:         " */
    LcdPrintInline();
    if (DAT_7046 == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "constant spacing         " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7046 == 2) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear increasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7046 == 3) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear decreasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7046 == 4) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al increasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7046 == 5) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al decreasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7046 == 6) {
      LcdSetCursor();
                    /* inline[API_FC38]: "random spacing           " */
      LcdPrintInline();
      return in_D;
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "spacing control - use knob for options  " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_small_04000__11dd @ M6C_small_04000::11dd =====

/* WARNING: Removing unreachable block (RAM,0x1321) */
/* WARNING: Removing unreachable block (RAM,0x1311) */
/* WARNING: Removing unreachable block (RAM,0x12c4) */
/* WARNING: Removing unreachable block (RAM,0x12cc) */
/* WARNING: Removing unreachable block (RAM,0x1319) */
/* WARNING: Removing unreachable block (RAM,0x1327) */
/* WARNING: Removing unreachable block (RAM,0x132c) */
/* WARNING: Removing unreachable block (RAM,0x1346) */
/* WARNING: Removing unreachable block (RAM,0x12bc) */
/* WARNING: Removing unreachable block (RAM,0x12d2) */
/* WARNING: Removing unreachable block (RAM,0x12d7) */
/* WARNING: Removing unreachable block (RAM,0x12f1) */
/* WARNING: Heritage AFTER dead removal. Example location: B : 0x11e6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6C_small_04000__11dd(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  short *psVar4;
  undefined2 *puVar5;
  short *psVar6;
  short *psVar7;
  
  FUN_eb1d((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,param_1,6);
  if (DAT_7046 != 0) {
    if (DAT_7046 == 1) {
      FUN_M6C_small_04000__27b1();
      *(undefined1 *)(param_3 + -1) = 0xc;
      puVar5 = (undefined2 *)(param_3 + -2);
      *(undefined1 *)puVar5 = 0;
      API_FCEA();
      uVar1 = *puVar5;
      puVar5 = &DAT_7076;
      do {
        puVar3 = puVar5 + 1;
        *puVar5 = uVar1;
        puVar5 = puVar3;
      } while ((short)puVar3 < 0x708d);
    }
    else if (DAT_7046 == 2) {
      FUN_M6C_small_04000__27b1();
      *(undefined1 *)(param_3 + -1) = 0x4e;
      psVar6 = (short *)(param_3 + -2);
      *(undefined1 *)psVar6 = 0;
      API_FCEA();
      DAT_701c = *psVar6;
      sVar2 = 0;
      psVar6 = &DAT_7076;
      do {
        sVar2 = sVar2 + DAT_701c;
        psVar7 = psVar6 + 1;
        *psVar6 = sVar2;
        psVar6 = psVar7;
      } while ((short)psVar7 < 0x708d);
    }
    else if (DAT_7046 == 3) {
      FUN_M6C_small_04000__27b1();
      *(undefined1 *)(param_3 + -1) = 0x4e;
      psVar6 = (short *)(param_3 + -2);
      *(undefined1 *)psVar6 = 0;
      API_FCEA();
      DAT_701c = *psVar6;
      DAT_708c = DAT_701c;
    }
    else {
      if (DAT_7046 == 4) {
        FUN_M6C_small_04000__27b1();
        FUN_M6C_small_04000__2815();
        return in_D;
      }
      if (DAT_7046 == 5) {
        FUN_M6C_small_04000__27b1();
        FUN_M6C_small_04000__2815();
        return in_D;
      }
      if (DAT_7046 == 6) {
        FUN_M6C_small_04000__27b1();
        *(undefined1 *)(param_3 + -1) = 0xc;
        psVar7 = (short *)(param_3 + -2);
        *(undefined1 *)psVar7 = 0;
        API_FCEA();
        DAT_701c = *psVar7;
        psVar6 = &DAT_7076;
        do {
          sVar2 = DAT_701c;
          *(char *)((short)psVar7 + 1) = (char)DAT_701c;
          *(char *)psVar7 = (char)((ushort)sVar2 >> 8);
          API_FCF8();
          psVar4 = psVar6 + 1;
          *psVar6 = *psVar7;
          psVar6 = psVar4;
        } while ((short)psVar4 < 0x708d);
      }
    }
  }
  FUN_M6C_small_04000__26c7();
  FUN_M6C_small_04000__2670();
  LcdSetCursor();
                    /* inline[API_FC38]: "spacing was set - use knob for options  " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_small_04000__13ae @ M6C_small_04000::13ae =====

undefined2 __h3000 FUN_M6C_small_04000__13ae(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_60f9;
  DAT_7048 = DAT_60f9;
  FUN_M6C_small_04000__13c3();
  FUN_M6C_small_04000__140c();
  FUN_M6C_small_04000__159f();
  return in_D;
}


// ===== FUN_M6C_small_04000__13c3 @ M6C_small_04000::13c3 =====

undefined2 __h3000 FUN_M6C_small_04000__13c3(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7048;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$140C ->$13FF
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__140c();
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x15);
  return in_D;
}


// ===== FUN_M6C_small_04000__13ff @ M6C_small_04000::13ff =====

undefined2 __h3000 FUN_M6C_small_04000__13ff(void)

{
  undefined2 in_D;
  
  DAT_7048 = DAT_6074;
  FUN_M6C_small_04000__140c();
  return in_D;
}


// ===== FUN_M6C_small_04000__140c @ M6C_small_04000::140c =====

undefined2 __h3000 FUN_M6C_small_04000__140c(void)

{
  undefined2 in_D;
  
  if (DAT_7048 != 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "hit enter for:          " */
    LcdPrintInline();
    if (DAT_7048 == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "constant weight          " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7048 == 2) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear increasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7048 == 3) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear decreasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7048 == 4) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al increasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7048 == 5) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al decreasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7048 == 6) {
      LcdSetCursor();
                    /* inline[API_FC38]: "random weights           " */
      LcdPrintInline();
      return in_D;
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "weighting control - use knob for options" */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_small_04000__159f @ M6C_small_04000::159f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x15a8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6C_small_04000__159f(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  short sVar1;
  undefined2 *puVar2;
  short *psVar3;
  undefined2 *puVar4;
  short *psVar5;
  short *psVar6;
  
  FUN_eb1d((char)((ushort)DAT_7048 >> 8),(char)DAT_7048,param_1,7);
  if (DAT_7048 != 0) {
    if (DAT_7048 == 1) {
      puVar4 = &DAT_708e;
      do {
        puVar2 = puVar4 + 1;
        *puVar4 = &BYTE_M6C_small_04000__0190;
        puVar4 = puVar2;
      } while ((short)puVar2 < 0x70a5);
    }
    else if (DAT_7048 == 2) {
      DAT_701c = 0x50;
      sVar1 = 0;
      psVar5 = &DAT_708e;
      do {
        sVar1 = sVar1 + DAT_701c;
        psVar3 = psVar5 + 1;
        *psVar5 = sVar1;
        psVar5 = psVar3;
      } while ((short)psVar3 < 0x70a5);
    }
    else if (DAT_7048 == 3) {
      DAT_701c = 0x50;
      DAT_70a4 = 0x50;
    }
    else if (DAT_7048 == 4) {
      DAT_701c = 1;
      DAT_708e = 1;
      psVar5 = &DAT_7090;
      do {
        psVar3 = psVar5;
        sVar1 = DAT_701c;
        *(char *)((short)param_3 + -1) = (char)DAT_701c;
        *(char *)(param_3 + -1) = (char)((ushort)sVar1 >> 8);
        *(undefined1 *)((short)param_3 + -3) = 2;
        param_3 = param_3 + -2;
        *(undefined1 *)param_3 = 0;
        API_FCEE();
        DAT_701c = *param_3;
        param_3 = param_3 + 1;
        psVar5 = psVar3 + 1;
        *psVar3 = DAT_701c;
      } while ((short)psVar5 < 0x70a1);
      *psVar5 = 1000;
      psVar3[2] = 1000;
    }
    else if (DAT_7048 == 5) {
      DAT_701c = 1;
      DAT_70a4 = 1;
      puVar4 = &DAT_70a4;
      *(undefined1 *)((short)param_3 + -1) = 1;
      *(undefined1 *)(param_3 + -1) = 0;
      *(undefined1 *)((short)param_3 + -3) = 2;
      param_3 = param_3 + -2;
      *(undefined1 *)param_3 = 0;
      API_FCEE();
      sVar1 = *param_3;
      DAT_701c = sVar1;
      puVar4[-1] = sVar1;
      puVar4[-2] = sVar1;
      puVar4[-3] = sVar1;
    }
    else if (DAT_7048 == 6) {
      psVar5 = &DAT_708e;
      do {
        *(undefined1 *)((short)param_3 + -1) = 0xe8;
        psVar6 = param_3 + -1;
        *(undefined1 *)psVar6 = 3;
        API_FCF8();
        param_3 = psVar6 + 1;
        psVar3 = psVar5 + 1;
        *psVar5 = *psVar6;
        psVar5 = psVar3;
      } while ((short)psVar3 < 0x70a5);
    }
  }
  FUN_M6C_small_04000__270f();
  FUN_M6C_small_04000__268d();
  LcdSetCursor();
                    /* inline[API_FC38]: "weights set - use knob for options      " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_small_04000__16ef @ M6C_small_04000::16ef =====

undefined2 __h3000 FUN_M6C_small_04000__16ef(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_60f9;
  DAT_704a = DAT_60f9;
  FUN_M6C_small_04000__1704();
  FUN_M6C_small_04000__174d();
  FUN_M6C_small_04000__1976();
  return in_D;
}


// ===== FUN_M6C_small_04000__1704 @ M6C_small_04000::1704 =====

undefined2 __h3000 FUN_M6C_small_04000__1704(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_704a;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0009 $0001 $0000 ->$174D ->$1740
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__174d();
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x19);
  return in_D;
}


// ===== FUN_M6C_small_04000__1740 @ M6C_small_04000::1740 =====

undefined2 __h3000 FUN_M6C_small_04000__1740(void)

{
  undefined2 in_D;
  
  DAT_704a = DAT_6074;
  FUN_M6C_small_04000__174d();
  return in_D;
}


// ===== FUN_M6C_small_04000__174d @ M6C_small_04000::174d =====

undefined2 __h3000 FUN_M6C_small_04000__174d(void)

{
  undefined2 in_D;
  
  if (DAT_704a != 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "hit enter for:          " */
    LcdPrintInline();
    if (DAT_704a == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "panned center            " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 2) {
      LcdSetCursor();
                    /* inline[API_FC38]: "panned left              " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 3) {
      LcdSetCursor();
                    /* inline[API_FC38]: "panned right             " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 4) {
      LcdSetCursor();
                    /* inline[API_FC38]: "alternating left & right " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 5) {
      LcdSetCursor();
                    /* inline[API_FC38]: "left to right sweep      " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 6) {
      LcdSetCursor();
                    /* inline[API_FC38]: "right to left sweep      " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 7) {
      LcdSetCursor();
                    /* inline[API_FC38]: "spread from center       " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 8) {
      LcdSetCursor();
                    /* inline[API_FC38]: "merge to center          " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_704a == 9) {
      LcdSetCursor();
                    /* inline[API_FC38]: "random panning           " */
      LcdPrintInline();
      return in_D;
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "panning control - use knob for options  " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_small_04000__1976 @ M6C_small_04000::1976 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x197f */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6C_small_04000__1976(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  short sVar2;
  undefined2 *puVar3;
  short *psVar5;
  short *psVar6;
  short *psVar7;
  undefined2 *puVar4;
  
  FUN_eb1d((char)((ushort)DAT_704a >> 8),(char)DAT_704a,param_1,8);
  if (DAT_704a != 0) {
    if (DAT_704a == 1) {
      uVar1 = 0;
    }
    else if (DAT_704a == 2) {
      uVar1 = 0xfff5;
    }
    else {
      if (DAT_704a != 3) {
        if (DAT_704a == 4) {
          sVar2 = -0xb;
          psVar6 = &DAT_705e;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            *(char *)((short)param_3 + -1) = (char)sVar2;
            *(char *)(param_3 + -1) = (char)((ushort)sVar2 >> 8);
            *(undefined1 *)((short)param_3 + -3) = 0xff;
            param_3 = param_3 + -2;
            *(undefined1 *)param_3 = 0xff;
            API_FCEC();
            sVar2 = *param_3;
            param_3 = param_3 + 1;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7075);
        }
        else if (DAT_704a == 5) {
          sVar2 = -0xb;
          psVar6 = &DAT_705e;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            sVar2 = sVar2 + 2;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7075);
        }
        else if (DAT_704a == 6) {
          sVar2 = 0xb;
          psVar6 = &DAT_705e;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            sVar2 = sVar2 + -2;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7075);
        }
        else if (DAT_704a == 7) {
          DAT_701e = 1;
          sVar2 = 0;
          DAT_701c = 0;
          psVar6 = &DAT_705e;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            sVar2 = DAT_701e;
            DAT_701c._1_1_ = (char)DAT_701c + '\x01';
            *(char *)((short)param_3 + -1) = (char)DAT_701e;
            *(char *)(param_3 + -1) = (char)((ushort)sVar2 >> 8);
            *(undefined1 *)((short)param_3 + -3) = 0xff;
            param_3 = param_3 + -2;
            *(undefined1 *)param_3 = 0xff;
            API_FCEC();
            sVar2 = *param_3;
            DAT_701e = sVar2;
            *(char *)((short)param_3 + 1) = (char)sVar2;
            *(char *)param_3 = (char)((ushort)sVar2 >> 8);
            uVar1 = DAT_701c;
            *(char *)((short)param_3 + -1) = (char)DAT_701c;
            param_3 = param_3 + -1;
            *(char *)param_3 = (char)((ushort)uVar1 >> 8);
            API_FCEC();
            sVar2 = *param_3;
            param_3 = param_3 + 1;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7075);
        }
        else if (DAT_704a == 8) {
          DAT_701e = 1;
          sVar2 = 0xb;
          DAT_701c = 0xb;
          psVar6 = &DAT_705e;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            sVar2 = DAT_701e;
            DAT_701c._1_1_ = (char)DAT_701c + -1;
            *(char *)((short)param_3 + -1) = (char)DAT_701e;
            *(char *)(param_3 + -1) = (char)((ushort)sVar2 >> 8);
            *(undefined1 *)((short)param_3 + -3) = 0xff;
            param_3 = param_3 + -2;
            *(undefined1 *)param_3 = 0xff;
            API_FCEC();
            sVar2 = *param_3;
            DAT_701e = sVar2;
            *(char *)((short)param_3 + 1) = (char)sVar2;
            *(char *)param_3 = (char)((ushort)sVar2 >> 8);
            uVar1 = DAT_701c;
            *(char *)((short)param_3 + -1) = (char)DAT_701c;
            param_3 = param_3 + -1;
            *(char *)param_3 = (char)((ushort)uVar1 >> 8);
            API_FCEC();
            sVar2 = *param_3;
            param_3 = param_3 + 1;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7075);
        }
        else if (DAT_704a == 9) {
          psVar6 = &DAT_705e;
          do {
            *(undefined1 *)((short)param_3 + -1) = 0x16;
            psVar7 = param_3 + -1;
            *(undefined1 *)psVar7 = 0;
            API_FCF8();
            param_3 = psVar7 + 1;
            psVar5 = psVar6 + 1;
            *psVar6 = *psVar7 + -0xb;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7075);
        }
        goto LAB_M6C_small_04000__1aec;
      }
      uVar1 = 0xb;
    }
    puVar3 = &DAT_705e;
    do {
      puVar4 = puVar3 + 1;
      *puVar3 = uVar1;
      puVar3 = puVar4;
    } while ((short)puVar4 < 0x7075);
  }
LAB_M6C_small_04000__1aec:
  FUN_M6C_small_04000__270f();
  FUN_M6C_small_04000__26aa();
  LcdSetCursor();
                    /* inline[API_FC38]: "pans set - use knob for options         " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_small_04000__1b36 @ M6C_small_04000::1b36 =====

void __h3000 FUN_M6C_small_04000__1b36(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1BE9 ->$1BFE $703E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_small_04000__1be9_M6C_small_04000__1b28);
  return;
}


// ===== FUN_M6C_small_04000__1b42 @ M6C_small_04000::1b42 =====

void __h3000 FUN_M6C_small_04000__1b42(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1BE9 ->$1BFE $703E */
  FUN_e736(param_1,param_2,&PTR_FUN_M6C_small_04000__1be9_M6C_small_04000__1b28);
  return;
}


// ===== FUN_M6C_small_04000__1b4e @ M6C_small_04000::1b4e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__1b4e(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_703e = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M6C_small_04000__1bfe();
  API_FC82((char)((ushort)DAT_703e >> 8),(char)DAT_703e,param_1,0x45);
  return in_D;
}


// ===== FUN_M6C_small_04000__1b72 @ M6C_small_04000::1b72 =====

undefined2 __h3000 FUN_M6C_small_04000__1b72(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7042;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       diffusion:    %     " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1BE9 ->$1BBF
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__1be9();
  return in_D;
}


// ===== FUN_M6C_small_04000__1bbf @ M6C_small_04000::1bbf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__1bbf(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_703e = DAT_6074 - DAT_7040;
  API_FC82((char)((ushort)DAT_703e >> 8),(char)DAT_703e,param_1,0x45);
  FUN_M6C_small_04000__1bfe();
  FUN_eb1d((char)((ushort)DAT_703e >> 8),(char)DAT_703e,param_1,3);
  return in_D;
}


// ===== FUN_M6C_small_04000__1be9 @ M6C_small_04000::1be9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__1be9(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6C_small_04000__1bfe @ M6C_small_04000::1bfe =====

undefined2 __h3000 FUN_M6C_small_04000__1bfe(void)

{
  short sVar1;
  undefined1 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  short in_U;
  short *psVar4;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar4 = (short *)(in_U + -6);
  *psVar4 = DAT_703e + DAT_7040;
  API_FCD8();
  sVar1 = *psVar4;
  DAT_7042 = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x40;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 1;
  API_FCF0();
  DAT_7000 = psVar4[1];
  psVar4 = psVar4 + 2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7000 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7000 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7000 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7000 >> 8));
  DAT_7002 = -DAT_7000;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7002 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7002 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7002 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7002 >> 8));
  sVar1 = DAT_7000;
  uVar3 = (undefined1)DAT_7000;
  *(undefined1 *)((short)psVar4 + -1) = uVar3;
  uVar2 = (undefined1)((ushort)sVar1 >> 8);
  *(undefined1 *)(psVar4 + -1) = uVar2;
  *(undefined1 *)((short)psVar4 + -3) = uVar3;
  psVar4 = psVar4 + -2;
  *(undefined1 *)psVar4 = uVar2;
  API_FCF2();
  DAT_701e = *psVar4;
  DAT_7004 = 0x7fff - DAT_701e;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7004 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7004 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7004 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7004 >> 8));
  return in_D;
}


// ===== FUN_M6C_small_04000__1d2d @ M6C_small_04000::1d2d =====

void __h3000 FUN_M6C_small_04000__1d2d(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d34 @ M6C_small_04000::1d34 =====

void __h3000 FUN_M6C_small_04000__1d34(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d3b @ M6C_small_04000::1d3b =====

void __h3000 FUN_M6C_small_04000__1d3b(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d42 @ M6C_small_04000::1d42 =====

void __h3000 FUN_M6C_small_04000__1d42(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d49 @ M6C_small_04000::1d49 =====

void __h3000 FUN_M6C_small_04000__1d49(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d50 @ M6C_small_04000::1d50 =====

void __h3000 FUN_M6C_small_04000__1d50(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d57 @ M6C_small_04000::1d57 =====

void __h3000 FUN_M6C_small_04000__1d57(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d5e @ M6C_small_04000::1d5e =====

void __h3000 FUN_M6C_small_04000__1d5e(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d65 @ M6C_small_04000::1d65 =====

void __h3000 FUN_M6C_small_04000__1d65(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d6c @ M6C_small_04000::1d6c =====

void __h3000 FUN_M6C_small_04000__1d6c(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d73 @ M6C_small_04000::1d73 =====

void __h3000 FUN_M6C_small_04000__1d73(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d7a @ M6C_small_04000::1d7a =====

void __h3000 FUN_M6C_small_04000__1d7a(void)

{
  FUN_M6C_small_04000__1d81(0);
  return;
}


// ===== FUN_M6C_small_04000__1d81 @ M6C_small_04000::1d81 =====

undefined2 __h3000 FUN_M6C_small_04000__1d81(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__26dd();
  DAT_6074 = DAT_60f9;
  *DAT_7008 = DAT_60f9;
  API_FC82();
  (*(FUN_M6C_small_04000__1daf + DAT_600d + (DAT_701a & 0xff) * 7))();
  FUN_M6C_small_04000__1e8f();
  FUN_M6C_small_04000__1ed7();
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__1daf @ M6C_small_04000::1daf =====

void __h3000 FUN_M6C_small_04000__1daf(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1db6 @ M6C_small_04000::1db6 =====

void __h3000 FUN_M6C_small_04000__1db6(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dbd @ M6C_small_04000::1dbd =====

void __h3000 FUN_M6C_small_04000__1dbd(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dc4 @ M6C_small_04000::1dc4 =====

void __h3000 FUN_M6C_small_04000__1dc4(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dcb @ M6C_small_04000::1dcb =====

void __h3000 FUN_M6C_small_04000__1dcb(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dd2 @ M6C_small_04000::1dd2 =====

void __h3000 FUN_M6C_small_04000__1dd2(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dd9 @ M6C_small_04000::1dd9 =====

void __h3000 FUN_M6C_small_04000__1dd9(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1de0 @ M6C_small_04000::1de0 =====

void __h3000 FUN_M6C_small_04000__1de0(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1de7 @ M6C_small_04000::1de7 =====

void __h3000 FUN_M6C_small_04000__1de7(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dee @ M6C_small_04000::1dee =====

void __h3000 FUN_M6C_small_04000__1dee(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1df5 @ M6C_small_04000::1df5 =====

void __h3000 FUN_M6C_small_04000__1df5(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1dfc @ M6C_small_04000::1dfc =====

void __h3000 FUN_M6C_small_04000__1dfc(void)

{
  FUN_M6C_small_04000__1e03(0);
  return;
}


// ===== FUN_M6C_small_04000__1e03 @ M6C_small_04000::1e03 =====

undefined2 __h3000 FUN_M6C_small_04000__1e03(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__26dd();
  DAT_6074 = *DAT_7008;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1E8F ->$1E2F
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__1e8f();
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__1e2f @ M6C_small_04000::1e2f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__1e2f(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  byte extraout_CC;
  
  *DAT_7008 = DAT_6074;
  FUN_M6C_small_04000__27ca();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    DAT_6074 = *param_3 + *DAT_7008;
    *DAT_7008 = DAT_6074;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1E8F ->$1E2F
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M6C_small_04000__1e8f();
    FUN_M6C_small_04000__2815();
  }
  API_FC82();
  FUN_M6C_small_04000__1ed7();
  FUN_eb1d((char)((ushort)*DAT_7008 >> 8),(char)*DAT_7008,param_1,DAT_701a + 9);
  DAT_7046 = 0;
  return in_D;
}


// ===== FUN_M6C_small_04000__1e8f @ M6C_small_04000::1e8f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__1e8f(void)

{
  undefined2 in_D;
  
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay   :        mS " */
  LcdPrintInline();
  LcdSetCursor();
  API_FC44((char)((ushort)(DAT_701a + 1) >> 8));
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  return in_D;
}


// ===== FUN_M6C_small_04000__1ed7 @ M6C_small_04000::1ed7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__1ed7(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  
  uVar1 = *DAT_7008;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 4;
  psVar2 = (short *)(param_3 + -4);
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_701c = *psVar2;
  uVar1 = *DAT_7008;
  *(char *)((short)psVar2 + 1) = (char)uVar1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x7a;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x34;
  API_FCF2();
  *psVar2 = *psVar2 + DAT_701c + *DAT_7012;
  uVar1 = DAT_70c2;
  *(char *)((short)psVar2 + -1) = (char)DAT_70c2;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_701c = *psVar2 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8),(char)DAT_701c,param_1,DAT_7014);
  return in_D;
}


// ===== FUN_M6C_small_04000__1f2d @ M6C_small_04000::1f2d =====

void __h3000 FUN_M6C_small_04000__1f2d(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f34 @ M6C_small_04000::1f34 =====

void __h3000 FUN_M6C_small_04000__1f34(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f3b @ M6C_small_04000::1f3b =====

void __h3000 FUN_M6C_small_04000__1f3b(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f42 @ M6C_small_04000::1f42 =====

void __h3000 FUN_M6C_small_04000__1f42(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f49 @ M6C_small_04000::1f49 =====

void __h3000 FUN_M6C_small_04000__1f49(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f50 @ M6C_small_04000::1f50 =====

void __h3000 FUN_M6C_small_04000__1f50(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f57 @ M6C_small_04000::1f57 =====

void __h3000 FUN_M6C_small_04000__1f57(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f5e @ M6C_small_04000::1f5e =====

void __h3000 FUN_M6C_small_04000__1f5e(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f65 @ M6C_small_04000::1f65 =====

void __h3000 FUN_M6C_small_04000__1f65(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f6c @ M6C_small_04000::1f6c =====

void __h3000 FUN_M6C_small_04000__1f6c(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f73 @ M6C_small_04000::1f73 =====

void __h3000 FUN_M6C_small_04000__1f73(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f7a @ M6C_small_04000::1f7a =====

void __h3000 FUN_M6C_small_04000__1f7a(void)

{
  FUN_M6C_small_04000__1f81(0);
  return;
}


// ===== FUN_M6C_small_04000__1f81 @ M6C_small_04000::1f81 =====

undefined2 __h3000 FUN_M6C_small_04000__1f81(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__2725();
  DAT_6074 = DAT_60f9;
  *DAT_7006 = DAT_60f9;
  API_FC82();
  (*(FUN_M6C_small_04000__1faf + DAT_600d + (DAT_701a & 0xff) * 7))();
  FUN_M6C_small_04000__208e();
  FUN_M6C_small_04000__20a3();
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__1faf @ M6C_small_04000::1faf =====

void __h3000 FUN_M6C_small_04000__1faf(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fb6 @ M6C_small_04000::1fb6 =====

void __h3000 FUN_M6C_small_04000__1fb6(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fbd @ M6C_small_04000::1fbd =====

void __h3000 FUN_M6C_small_04000__1fbd(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fc4 @ M6C_small_04000::1fc4 =====

void __h3000 FUN_M6C_small_04000__1fc4(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fcb @ M6C_small_04000::1fcb =====

void __h3000 FUN_M6C_small_04000__1fcb(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fd2 @ M6C_small_04000::1fd2 =====

void __h3000 FUN_M6C_small_04000__1fd2(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fd9 @ M6C_small_04000::1fd9 =====

void __h3000 FUN_M6C_small_04000__1fd9(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fe0 @ M6C_small_04000::1fe0 =====

void __h3000 FUN_M6C_small_04000__1fe0(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fe7 @ M6C_small_04000::1fe7 =====

void __h3000 FUN_M6C_small_04000__1fe7(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1fee @ M6C_small_04000::1fee =====

void __h3000 FUN_M6C_small_04000__1fee(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1ff5 @ M6C_small_04000::1ff5 =====

void __h3000 FUN_M6C_small_04000__1ff5(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__1ffc @ M6C_small_04000::1ffc =====

void __h3000 FUN_M6C_small_04000__1ffc(void)

{
  FUN_M6C_small_04000__2003(0);
  return;
}


// ===== FUN_M6C_small_04000__2003 @ M6C_small_04000::2003 =====

undefined2 __h3000 FUN_M6C_small_04000__2003(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__2725();
  DAT_6074 = *DAT_7006;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       level   :      %    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 01 04 80 $03E8 $0000 $0000 ->$208E ->$2062
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__208e();
  LcdSetCursor();
  API_FC44((char)((ushort)(DAT_701a + 1) >> 8));
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__2062 @ M6C_small_04000::2062 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__2062(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_7006 = DAT_6074;
  API_FC82();
  FUN_M6C_small_04000__20a3();
  FUN_eb1d((char)((ushort)*DAT_7006 >> 8),(char)*DAT_7006,param_1,DAT_701a + 0x15);
  DAT_7048 = 0;
  return in_D;
}


// ===== FUN_M6C_small_04000__208e @ M6C_small_04000::208e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__208e(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  return in_D;
}


// ===== FUN_M6C_small_04000__20a3 @ M6C_small_04000::20a3 =====

undefined2 __h3000 FUN_M6C_small_04000__20a3(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  DAT_701c = *DAT_7006;
  uVar1 = *DAT_700a;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70c0;
  *(char *)(in_U + -3) = (char)DAT_70c0;
  psVar2 = (short *)(in_U + -4);
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_701e = *psVar2;
  *psVar2 = DAT_701e + 0xb;
  uVar1 = DAT_701c;
  *(char *)((short)psVar2 + -1) = (char)DAT_701c;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_7020 = *psVar2;
  psVar2 = psVar2 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7020 >> 8));
  psVar2[-1] = 0xb - DAT_701e;
  uVar1 = DAT_701c;
  *(char *)((short)psVar2 + -3) = (char)DAT_701c;
  psVar2 = psVar2 + -2;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_7020 = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7020 >> 8));
  return in_D;
}


// ===== FUN_M6C_small_04000__2113 @ M6C_small_04000::2113 =====

void __h3000 FUN_M6C_small_04000__2113(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__211a @ M6C_small_04000::211a =====

void __h3000 FUN_M6C_small_04000__211a(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2121 @ M6C_small_04000::2121 =====

void __h3000 FUN_M6C_small_04000__2121(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2128 @ M6C_small_04000::2128 =====

void __h3000 FUN_M6C_small_04000__2128(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__212f @ M6C_small_04000::212f =====

void __h3000 FUN_M6C_small_04000__212f(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2136 @ M6C_small_04000::2136 =====

void __h3000 FUN_M6C_small_04000__2136(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__213d @ M6C_small_04000::213d =====

void __h3000 FUN_M6C_small_04000__213d(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2144 @ M6C_small_04000::2144 =====

void __h3000 FUN_M6C_small_04000__2144(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__214b @ M6C_small_04000::214b =====

void __h3000 FUN_M6C_small_04000__214b(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2152 @ M6C_small_04000::2152 =====

void __h3000 FUN_M6C_small_04000__2152(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2159 @ M6C_small_04000::2159 =====

void __h3000 FUN_M6C_small_04000__2159(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2160 @ M6C_small_04000::2160 =====

void __h3000 FUN_M6C_small_04000__2160(void)

{
  FUN_M6C_small_04000__2167(0);
  return;
}


// ===== FUN_M6C_small_04000__2167 @ M6C_small_04000::2167 =====

undefined2 __h3000 FUN_M6C_small_04000__2167(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__2725();
  DAT_6074 = DAT_60f9;
  *DAT_700a = DAT_60f9;
  API_FC80();
  (*(FUN_M6C_small_04000__2195 + DAT_600d + (DAT_701a & 0xff) * 7))();
  FUN_M6C_small_04000__2287();
  FUN_M6C_small_04000__2284();
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__2195 @ M6C_small_04000::2195 =====

void __h3000 FUN_M6C_small_04000__2195(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__219c @ M6C_small_04000::219c =====

void __h3000 FUN_M6C_small_04000__219c(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21a3 @ M6C_small_04000::21a3 =====

void __h3000 FUN_M6C_small_04000__21a3(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21aa @ M6C_small_04000::21aa =====

void __h3000 FUN_M6C_small_04000__21aa(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21b1 @ M6C_small_04000::21b1 =====

void __h3000 FUN_M6C_small_04000__21b1(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21b8 @ M6C_small_04000::21b8 =====

void __h3000 FUN_M6C_small_04000__21b8(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21bf @ M6C_small_04000::21bf =====

void __h3000 FUN_M6C_small_04000__21bf(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21c6 @ M6C_small_04000::21c6 =====

void __h3000 FUN_M6C_small_04000__21c6(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21cd @ M6C_small_04000::21cd =====

void __h3000 FUN_M6C_small_04000__21cd(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21d4 @ M6C_small_04000::21d4 =====

void __h3000 FUN_M6C_small_04000__21d4(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21db @ M6C_small_04000::21db =====

void __h3000 FUN_M6C_small_04000__21db(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21e2 @ M6C_small_04000::21e2 =====

void __h3000 FUN_M6C_small_04000__21e2(void)

{
  FUN_M6C_small_04000__21e9(0);
  return;
}


// ===== FUN_M6C_small_04000__21e9 @ M6C_small_04000::21e9 =====

undefined2 __h3000 FUN_M6C_small_04000__21e9(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__2725();
  DAT_6074 = *DAT_700a;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       pan   : L-           C           -R" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$2287 ->$2257
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__2287();
  LcdSetCursor();
  API_FC44((char)((ushort)(DAT_701a + 1) >> 8));
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__2257 @ M6C_small_04000::2257 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__2257(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_700a = DAT_6074;
  API_FC80();
  FUN_M6C_small_04000__2284();
  FUN_eb1d((char)((ushort)*DAT_700a >> 8),(char)*DAT_700a,param_1,DAT_701a + 0x21);
  DAT_704a = 0;
  return in_D;
}


// ===== FUN_M6C_small_04000__2284 @ M6C_small_04000::2284 =====

undefined2 __h3000 FUN_M6C_small_04000__2284(void)

{
  undefined2 uVar1;
  
  uVar1 = FUN_M6C_small_04000__20a3();
  LcdSetCursor();
  LcdPrintInline();
  LcdSetCursor((char)((ushort)(*DAT_700a + 0x1a) >> 8));
  API_FC2A();
  return uVar1;
}


// ===== FUN_M6C_small_04000__2287 @ M6C_small_04000::2287 =====

undefined2 __h3000 FUN_M6C_small_04000__2287(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "           C           " */
  LcdPrintInline();
  LcdSetCursor((char)((ushort)(*DAT_700a + 0x1a) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M6C_small_04000__22c2 @ M6C_small_04000::22c2 =====

void __h3000 FUN_M6C_small_04000__22c2(void)

{
  FUN_M6C_small_04000__22de(0);
  return;
}


// ===== FUN_M6C_small_04000__22c9 @ M6C_small_04000::22c9 =====

void __h3000 FUN_M6C_small_04000__22c9(void)

{
  FUN_M6C_small_04000__22de(0);
  return;
}


// ===== FUN_M6C_small_04000__22d0 @ M6C_small_04000::22d0 =====

void __h3000 FUN_M6C_small_04000__22d0(void)

{
  FUN_M6C_small_04000__22de(0);
  return;
}


// ===== FUN_M6C_small_04000__22d7 @ M6C_small_04000::22d7 =====

void __h3000 FUN_M6C_small_04000__22d7(void)

{
  FUN_M6C_small_04000__22de(0);
  return;
}


// ===== FUN_M6C_small_04000__22de @ M6C_small_04000::22de =====

undefined2 __h3000 FUN_M6C_small_04000__22de(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__277f();
  DAT_6074 = DAT_60f9;
  *DAT_7008 = DAT_60f9;
  API_FC82();
  (*(FUN_M6C_small_04000__230c + DAT_600d + (DAT_701a & 0xff) * 7))();
  FUN_M6C_small_04000__23ae();
  FUN_M6C_small_04000__23f6();
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__230c @ M6C_small_04000::230c =====

void __h3000 FUN_M6C_small_04000__230c(void)

{
  FUN_M6C_small_04000__2328(0);
  return;
}


// ===== FUN_M6C_small_04000__2313 @ M6C_small_04000::2313 =====

void __h3000 FUN_M6C_small_04000__2313(void)

{
  FUN_M6C_small_04000__2328(0);
  return;
}


// ===== FUN_M6C_small_04000__231a @ M6C_small_04000::231a =====

void __h3000 FUN_M6C_small_04000__231a(void)

{
  FUN_M6C_small_04000__2328(0);
  return;
}


// ===== FUN_M6C_small_04000__2321 @ M6C_small_04000::2321 =====

void __h3000 FUN_M6C_small_04000__2321(void)

{
  FUN_M6C_small_04000__2328(0);
  return;
}


// ===== FUN_M6C_small_04000__2328 @ M6C_small_04000::2328 =====

undefined2 __h3000 FUN_M6C_small_04000__2328(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_small_04000__277f();
  DAT_6074 = *DAT_7008;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$23AE ->$2354
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__23ae();
  return in_stack_00000000;
}


// ===== FUN_M6C_small_04000__2354 @ M6C_small_04000::2354 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__2354(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  byte extraout_CC;
  
  *DAT_7008 = DAT_6074;
  FUN_M6C_small_04000__27ca();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    DAT_6074 = *param_3 + *DAT_7008;
    *DAT_7008 = DAT_6074;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$23AE ->$2354
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M6C_small_04000__23ae();
    FUN_M6C_small_04000__2815();
  }
  API_FC82();
  FUN_eb1d((char)((ushort)*DAT_7008 >> 8),(char)*DAT_7008,param_1,DAT_701a + 0x2d);
  FUN_M6C_small_04000__23f6();
  return in_D;
}


// ===== FUN_M6C_small_04000__23ae @ M6C_small_04000::23ae =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__23ae(void)

{
  undefined2 in_D;
  
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       ap delay   :      mS" */
  LcdPrintInline();
  LcdSetCursor();
  API_FC44((char)((ushort)(DAT_701a + 1) >> 8));
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  return in_D;
}


// ===== FUN_M6C_small_04000__23f6 @ M6C_small_04000::23f6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__23f6(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  
  uVar1 = *DAT_7008;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 4;
  psVar2 = (short *)(param_3 + -4);
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_701c = *psVar2;
  uVar1 = *DAT_7008;
  *(char *)((short)psVar2 + 1) = (char)uVar1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x7a;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x34;
  API_FCF2();
  DAT_701c = *psVar2 + DAT_701c + *DAT_7012;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8),(char)DAT_701c,param_1,DAT_7014);
  return in_D;
}


// ===== FUN_M6C_small_04000__244a @ M6C_small_04000::244a =====

void __h3000 FUN_M6C_small_04000__244a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2502 ->$2517 $702E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_small_04000__2502_M6C_small_04000__243c);
  return;
}


// ===== FUN_M6C_small_04000__2456 @ M6C_small_04000::2456 =====

void __h3000 FUN_M6C_small_04000__2456(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2502 ->$2517 $702E */
  FUN_e736(param_1,param_2,&PTR_FUN_M6C_small_04000__2502_M6C_small_04000__243c);
  return;
}


// ===== FUN_M6C_small_04000__2462 @ M6C_small_04000::2462 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__2462(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_702e = DAT_60f9 - DAT_7030;
  FUN_M6C_small_04000__2517();
  API_FC82((char)((ushort)DAT_702e >> 8),(char)DAT_702e,param_1,0x3d);
  return in_D;
}


// ===== FUN_M6C_small_04000__2489 @ M6C_small_04000::2489 =====

undefined2 __h3000 FUN_M6C_small_04000__2489(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7032;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left mix:     % wet " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2502 ->$24D6
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__2502();
  return in_D;
}


// ===== FUN_M6C_small_04000__24d6 @ M6C_small_04000::24d6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__24d6(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_702e = DAT_6074 - DAT_7030;
  API_FC82((char)((ushort)DAT_702e >> 8),(char)DAT_702e,param_1,0x3d);
  FUN_eb1d((char)((ushort)DAT_702e >> 8),(char)DAT_702e,param_1,0);
  FUN_M6C_small_04000__2517();
  FUN_M6C_small_04000__2502();
  return in_D;
}


// ===== FUN_M6C_small_04000__2502 @ M6C_small_04000::2502 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__2502(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6C_small_04000__2517 @ M6C_small_04000::2517 =====

undefined2 __h3000 FUN_M6C_small_04000__2517(void)

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
  *psVar2 = DAT_702e + DAT_7030;
  API_FCD8();
  DAT_7032 = *psVar2;
  sVar1 = 100 - DAT_7032;
  *psVar2 = sVar1;
  DAT_701c = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_701c) >> 8));
  return in_D;
}


// ===== FUN_M6C_small_04000__2564 @ M6C_small_04000::2564 =====

void __h3000 FUN_M6C_small_04000__2564(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$261C ->$2631 $7036 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_small_04000__261c_M6C_small_04000__2556);
  return;
}


// ===== FUN_M6C_small_04000__2570 @ M6C_small_04000::2570 =====

void __h3000 FUN_M6C_small_04000__2570(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$261C ->$2631 $7036 */
  FUN_e736(param_1,param_2,&PTR_FUN_M6C_small_04000__261c_M6C_small_04000__2556);
  return;
}


// ===== FUN_M6C_small_04000__257c @ M6C_small_04000::257c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__257c(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7036 = DAT_60f9 - DAT_7038;
  FUN_M6C_small_04000__2631();
  API_FC82((char)((ushort)DAT_7036 >> 8),(char)DAT_7036,param_1,0x3f);
  return in_D;
}


// ===== FUN_M6C_small_04000__25a3 @ M6C_small_04000::25a3 =====

undefined2 __h3000 FUN_M6C_small_04000__25a3(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_703a;
  FUN_M6C_small_04000__0513();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right mix:    % wet " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$261C ->$25F0
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_small_04000__261c();
  return in_D;
}


// ===== FUN_M6C_small_04000__25f0 @ M6C_small_04000::25f0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__25f0(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7036 = DAT_6074 - DAT_7038;
  API_FC82((char)((ushort)DAT_7036 >> 8),(char)DAT_7036,param_1,0x3f);
  FUN_eb1d((char)((ushort)DAT_7036 >> 8),(char)DAT_7036,param_1,1);
  FUN_M6C_small_04000__2631();
  FUN_M6C_small_04000__261c();
  return in_D;
}


// ===== FUN_M6C_small_04000__261c @ M6C_small_04000::261c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_small_04000__261c(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M6C_small_04000__2631 @ M6C_small_04000::2631 =====

undefined2 __h3000 FUN_M6C_small_04000__2631(void)

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
  *psVar2 = DAT_7036 + DAT_7038;
  API_FCD8();
  DAT_703a = *psVar2;
  sVar1 = 100 - DAT_703a;
  *psVar2 = sVar1;
  DAT_701c = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_701c) >> 8));
  return in_D;
}


// ===== FUN_M6C_small_04000__2670 @ M6C_small_04000::2670 =====

undefined2 __h3000 FUN_M6C_small_04000__2670(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  puVar1 = &DAT_7076;
  do {
    puVar2 = puVar1 + 1;
    API_FC82((char)((ushort)*puVar1 >> 8));
    puVar1 = puVar2;
  } while ((short)puVar2 < 0x708d);
  return in_D;
}


// ===== FUN_M6C_small_04000__268d @ M6C_small_04000::268d =====

undefined2 __h3000 FUN_M6C_small_04000__268d(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  puVar1 = &DAT_708e;
  do {
    puVar2 = puVar1 + 1;
    API_FC82((char)((ushort)*puVar1 >> 8));
    puVar1 = puVar2;
  } while ((short)puVar2 < 0x70a5);
  return in_D;
}


// ===== FUN_M6C_small_04000__26aa @ M6C_small_04000::26aa =====

undefined2 __h3000 FUN_M6C_small_04000__26aa(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  puVar1 = &DAT_705e;
  do {
    puVar2 = puVar1 + 1;
    API_FC80((char)((ushort)*puVar1 >> 8));
    puVar1 = puVar2;
  } while ((short)puVar2 < 0x7075);
  return in_D;
}


// ===== FUN_M6C_small_04000__26c7 @ M6C_small_04000::26c7 =====

undefined2 __h3000 FUN_M6C_small_04000__26c7(void)

{
  undefined2 in_D;
  short sVar1;
  
  do {
    FUN_M6C_small_04000__26dd();
    sVar1 = FUN_M6C_small_04000__1ed7();
  } while (sVar1 + 1 < 0xc);
  return in_D;
}


// ===== FUN_M6C_small_04000__26dd @ M6C_small_04000::26dd =====

short __h3000 FUN_M6C_small_04000__26dd(void)

{
  undefined1 uVar1;
  short in_D;
  char cVar2;
  
  cVar2 = (char)in_D;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_701a = in_D;
  DAT_7014 = in_D + 0x41e;
  DAT_7008 = (short)&DAT_7076 + CONCAT11(uVar1,cVar2 << 1);
  DAT_700e = CONCAT11(uVar1,cVar2 << 1) + 0x5a;
  DAT_7012 = &UNK_M6C_small_04000__2839 + DAT_600d + CONCAT11(uVar1,cVar2 << 1);
  return in_D;
}


// ===== FUN_M6C_small_04000__270f @ M6C_small_04000::270f =====

undefined2 __h3000 FUN_M6C_small_04000__270f(void)

{
  undefined2 in_D;
  short sVar1;
  
  do {
    FUN_M6C_small_04000__2725();
    sVar1 = FUN_M6C_small_04000__20a3();
  } while (sVar1 + 1 < 0xc);
  return in_D;
}


// ===== FUN_M6C_small_04000__2725 @ M6C_small_04000::2725 =====

short __h3000 FUN_M6C_small_04000__2725(void)

{
  undefined1 uVar1;
  short in_D;
  char cVar2;
  
  cVar2 = (char)in_D;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_701a = in_D;
  DAT_7016 = in_D + 0x11e;
  DAT_7018 = &BYTE_M6C_small_04000__0132 + in_D;
  DAT_7006 = (short)&DAT_708e + CONCAT11(uVar1,cVar2 << 1);
  DAT_700a = (short)&DAT_705e + CONCAT11(uVar1,cVar2 << 1);
  DAT_700c = CONCAT11(uVar1,cVar2 << 1) + 0x72;
  DAT_7010 = in_D + 0x8a;
  return in_D;
}


// ===== FUN_M6C_small_04000__2769 @ M6C_small_04000::2769 =====

undefined2 __h3000 FUN_M6C_small_04000__2769(void)

{
  undefined2 in_D;
  short sVar1;
  
  do {
    FUN_M6C_small_04000__277f();
    sVar1 = FUN_M6C_small_04000__23f6();
  } while (sVar1 + 1 < 4);
  return in_D;
}


// ===== FUN_M6C_small_04000__277f @ M6C_small_04000::277f =====

short __h3000 FUN_M6C_small_04000__277f(void)

{
  undefined1 uVar1;
  short in_D;
  char cVar2;
  
  cVar2 = (char)in_D;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_701a = in_D;
  DAT_7014 = in_D + 0x43c;
  DAT_7008 = (short)&DAT_70a6 + CONCAT11(uVar1,cVar2 << 1);
  DAT_700e = CONCAT11(uVar1,cVar2 << 1) + 0x96;
  DAT_7012 = &UNK_M6C_small_04000__2839 + DAT_600d + CONCAT11(uVar1,cVar2 << 1);
  return in_D;
}


// ===== FUN_M6C_small_04000__27b1 @ M6C_small_04000::27b1 =====

undefined2 __h3000 FUN_M6C_small_04000__27b1(void)

{
  undefined2 in_D;
  short in_U;
  
  *(undefined **)(in_U + -2) =
       &UNK_M6C_small_04000__38a4 + (((-DAT_70a8 - DAT_70a6) - DAT_70aa) - DAT_70ac);
  return in_D;
}


// ===== FUN_M6C_small_04000__27ca @ M6C_small_04000::27ca =====

undefined2 __h3000 FUN_M6C_small_04000__27ca(void)

{
  undefined2 in_D;
  short in_U;
  
  *(undefined **)(in_U + -2) =
       &UNK_M6C_small_04000__38a4 +
       (((((((((((((((-DAT_7078 - DAT_7076) - DAT_707a) - DAT_707c) - DAT_707e) - DAT_7080) -
                DAT_7082) - DAT_7084) - DAT_7086) - DAT_7088) - DAT_708a) - DAT_708c) - DAT_70a6) -
         DAT_70a8) - DAT_70aa) - DAT_70ac);
  return in_D;
}


// ===== FUN_M6C_small_04000__2815 @ M6C_small_04000::2815 =====

undefined2 __h3000 FUN_M6C_small_04000__2815(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,0x14);
                    /* inline[API_FC38]: "OOPS, no delay left " */
  LcdPrintInline();
  return uStack_2;
}


