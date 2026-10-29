// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M78_r3_24000 M78_r3_24000::0000-M78_r3_24000::3fff, 341 functions
// Bank r3_24000 (module id 78, sub 01)

// ===== MODULE_78_01_entry @ M78_r3_24000::0010 =====

undefined2 __h3000 MODULE_78_01_entry(void)

{
  undefined2 uVar1;
  byte extraout_CC;
  
                    /* inline[API_FC60]: $0014 */
  uVar1 = ModuleSetBase();
  API_FD22(0x78);
  FUN_M78_r3_24000__01db();
  FUN_M78_r3_24000__015a();
  FUN_M78_r3_24000__01cb();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  FUN_M78_r3_24000__00d8();
  if ((DAT_600a != 'x') && (FUN_M78_r3_24000__0101(), (extraout_CC >> 2 & 1) == 0)) {
    LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
    LcdPrintInline();
    return uVar1;
  }
  FUN_M78_r3_24000__1fac();
  FUN_M78_r3_24000__26a9();
  FUN_M78_r3_24000__2d78();
  FUN_M78_r3_24000__3724();
  FUN_M78_r3_24000__028c();
  FUN_M78_r3_24000__0332();
  if (DAT_600a != 'x') {
    FUN_M78_r3_24000__3ede();
  }
  API_FE36();
                    /* inline[API_FC62]: $7250 */
  ModuleStorePtr(9);
                    /* inline[API_FC62]: $7252 */
  ModuleStorePtr(9);
                    /* inline[API_FC62]: $6015 */
  ModuleStorePtr(0);
  API_FDF6();
  API_FE18();
  FUN_M78_r3_24000__0547();
  API_FE12();
  return uVar1;
}


// ===== FUN_M78_r3_24000__00d8 @ M78_r3_24000::00d8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__00d8(void)

{
  code *pcVar1;
  undefined2 in_D;
  
  pcVar1 = FUN_M78_r3_24000__1ee7 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M78_r3_24000__1eb8 + g_moduleBase,&LAB_6600,
           pcVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M78_r3_24000__0101 @ M78_r3_24000::0101 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0115 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M78_r3_24000__0101(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DspLoadProgram();
  if ((((extraout_CC >> 2 & 1) != 0) &&
      (DspLoadProgram(uVar1,(char)in_D,0x7811), (extraout_CC_00 >> 2 & 1) != 0)) &&
     (DspLoadProgram(uVar1,(char)in_D,0x7812), (extraout_CC_01 >> 2 & 1) != 0)) {
    API_FD3C(0);
    API_FD40();
    API_FD44();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7110 >> 8));
    API_FD7C();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__015a @ M78_r3_24000::015a =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__015a(void)

{
  undefined2 in_D;
  
  DAT_7002 = 0;
  DAT_700a = 0;
  DAT_7014 = 0;
  DAT_701e = 0;
  DAT_7028 = 0;
  DAT_703a = 0;
  DAT_7046 = 0;
  DAT_703c = 0;
  DAT_7268 = 0;
  DAT_726a = 0;
  DAT_7048 = 0;
  DAT_7052 = 0;
  DAT_705c = 0;
  DAT_7066 = 0;
  _DAT_706e = 0;
  DAT_7076 = 0;
  DAT_707e = 0;
  DAT_7032 = 0;
  DAT_7096 = 0;
  DAT_7086 = 0;
  DAT_70de = 0;
  DAT_70c6 = 0;
  DAT_70ce = 0;
  DAT_70d6 = 0;
  DAT_708e = 0;
  DAT_70a6 = 0;
  DAT_709e = 0;
  DAT_70ae = 0;
  DAT_70b6 = 0;
  DAT_70be = 0;
  DAT_7186 = 0;
  DAT_715e = 0;
  DAT_7160 = 0;
  DAT_7182 = 0;
  DAT_7184 = 0;
  return in_D;
}


// ===== FUN_M78_r3_24000__01cb @ M78_r3_24000::01cb =====

undefined2 __h3000 FUN_M78_r3_24000__01cb(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  return in_D;
}


// ===== FUN_M78_r3_24000__01db @ M78_r3_24000::01db =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__01db(void)

{
  undefined2 in_D;
  
                    /* inline[API_FE08]: B9:00 A9:08 AD:12 B1:1C B5:26 */
  LoadParamsScaled();
                    /* inline[API_FE08]: BB:06 AB:0E AF:18 B3:22 B7:2C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 59:38 5B:40 5D:44 5F:4C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 61:50 63:56 65:5A 67:60 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 55:30 81:CC 85:D4 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 69:64 71:74 6D:6C 75:7C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 6B:6A 73:7A 6F:72 77:82 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 99:A4 95:9C 89:AC 8D:B4 91:BC */
  LoadParamsScaled();
                    /* inline[API_FE08]: 9D:84 A1:8C A5:94 7D:C4 */
  LoadParamsScaled();
  DAT_714a = 0x7fff;
  DAT_714c = 0xfe00;
  DAT_7152 = 0x4000;
  _DAT_7154 = 0;
  DAT_7148 = 1;
  DAT_73b9 = 0;
  DAT_73bb = 0;
  DAT_7254 = 1;
  DAT_7256 = 2;
  return in_D;
}


// ===== FUN_M78_r3_24000__028c @ M78_r3_24000::028c =====

undefined2 __h3000 FUN_M78_r3_24000__028c(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__09bd();
  FUN_M78_r3_24000__0b2b();
  FUN_M78_r3_24000__0a74();
  FUN_M78_r3_24000__0be2();
  FUN_M78_r3_24000__1492();
                    /* inline[API_FD26]: $007E $7188 */
  FarCallInline();
  FUN_M78_r3_24000__179c();
  FUN_M78_r3_24000__1871();
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__1130();
  FUN_M78_r3_24000__12d0();
                    /* inline[API_FD26]: $005E $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0060 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0062 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0064 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0070 $7188 */
  FarCallInline();
  API_FD20(0);
  API_FD2E(0x79);
  API_FD20(0);
  API_FD2E(0x7f);
  FUN_M78_r3_24000__1a36();
  FUN_M78_r3_24000__1aee();
  FUN_M78_r3_24000__1bcd();
  FUN_M78_r3_24000__1650();
                    /* inline[API_FD26]: $004C $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0046 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0048 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $004A $7188 */
  FarCallInline();
  return in_D;
}


// ===== FUN_M78_r3_24000__0332 @ M78_r3_24000::0332 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__0332(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 01 80 "pitch 1 " 25 $0CDD $0CE9 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "pitch 2 " 29 $0F30 $0F3C */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 " time 1 " 2D $1103 $110F */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 " time 2 " 31 $12A3 $12AF */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "start 1 " 35 $098C $0998 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "start 2 " 39 $0A43 $0A4F */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 " stop 1 " 3D $0AFA $0B06 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 " stop 2 " 41 $0BB1 $0BBD */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M78_r3_24000__03e8;
  _DAT_60f7 = 0x1a;
  DAT_6105 = 1;
  DAT_6106 = 0xbd;
  return in_D;
}


// ===== FUN_M78_r3_24000__041c @ M78_r3_24000::041c =====

void __h3000 FUN_M78_r3_24000__041c(void)

{
  FUN_M78_r3_24000__0cb9();
  FUN_M78_r3_24000__0633();
  API_FE10();
  return;
}


// ===== FUN_M78_r3_24000__0427 @ M78_r3_24000::0427 =====

void __h3000 FUN_M78_r3_24000__0427(void)

{
  FUN_M78_r3_24000__0f0c();
  FUN_M78_r3_24000__0633();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__0432 @ M78_r3_24000::0432 =====

void __h3000 FUN_M78_r3_24000__0432(void)

{
  FUN_M78_r3_24000__10df();
  FUN_M78_r3_24000__0633();
  API_FE12();
  return;
}


// ===== FUN_M78_r3_24000__043d @ M78_r3_24000::043d =====

void __h3000 FUN_M78_r3_24000__043d(void)

{
  FUN_M78_r3_24000__127f();
  FUN_M78_r3_24000__0633();
  API_FE16();
  return;
}


// ===== FUN_M78_r3_24000__0448 @ M78_r3_24000::0448 =====

void __h3000 FUN_M78_r3_24000__0448(void)

{
                    /* inline[API_FD26]: $0066 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__0633();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__0458 @ M78_r3_24000::0458 =====

void __h3000 FUN_M78_r3_24000__0458(void)

{
                    /* inline[API_FD26]: $0068 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__066c();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__0468 @ M78_r3_24000::0468 =====

void __h3000 FUN_M78_r3_24000__0468(void)

{
                    /* inline[API_FD26]: $006A $7188 */
  FarCallInline();
  FUN_M78_r3_24000__0633();
  API_FE16();
  return;
}


// ===== FUN_M78_r3_24000__0478 @ M78_r3_24000::0478 =====

void __h3000 FUN_M78_r3_24000__0478(void)

{
                    /* inline[API_FD26]: $006C $7188 */
  FarCallInline();
  FUN_M78_r3_24000__066c();
  API_FE16();
  return;
}


// ===== FUN_M78_r3_24000__0488 @ M78_r3_24000::0488 =====

void __h3000 FUN_M78_r3_24000__0488(void)

{
                    /* inline[API_FD26]: $0072 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__05fa();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__0498 @ M78_r3_24000::0498 =====

void __h3000 FUN_M78_r3_24000__0498(void)

{
  FUN_M78_r3_24000__1447();
  FUN_M78_r3_24000__077b();
  API_FE10();
  return;
}


// ===== FUN_M78_r3_24000__04a3 @ M78_r3_24000::04a3 =====

void __h3000 FUN_M78_r3_24000__04a3(void)

{
  FUN_M78_r3_24000__1ab1();
  FUN_M78_r3_24000__077b();
  API_FE12();
  return;
}


// ===== FUN_M78_r3_24000__04ae @ M78_r3_24000::04ae =====

void __h3000 FUN_M78_r3_24000__04ae(void)

{
  FUN_M78_r3_24000__1b90();
  FUN_M78_r3_24000__077b();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__04b9 @ M78_r3_24000::04b9 =====

void __h3000 FUN_M78_r3_24000__04b9(void)

{
  FUN_M78_r3_24000__1605();
  FUN_M78_r3_24000__080c();
  API_FE10();
  return;
}


// ===== FUN_M78_r3_24000__04c4 @ M78_r3_24000::04c4 =====

void __h3000 FUN_M78_r3_24000__04c4(void)

{
                    /* inline[API_FD26]: $004E $7188 */
  FarCallInline();
  FUN_M78_r3_24000__080c();
  API_FE12();
  return;
}


// ===== FUN_M78_r3_24000__04d4 @ M78_r3_24000::04d4 =====

void __h3000 FUN_M78_r3_24000__04d4(void)

{
                    /* inline[API_FD26]: $0050 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__080c();
  API_FE12();
  return;
}


// ===== FUN_M78_r3_24000__04e4 @ M78_r3_24000::04e4 =====

void __h3000 FUN_M78_r3_24000__04e4(void)

{
                    /* inline[API_FD26]: $0052 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__080c();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__04f4 @ M78_r3_24000::04f4 =====

void __h3000 FUN_M78_r3_24000__04f4(void)

{
                    /* inline[API_FD26]: $0054 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__080c();
  API_FE16();
  return;
}


// ===== FUN_M78_r3_24000__0504 @ M78_r3_24000::0504 =====

void __h3000 FUN_M78_r3_24000__0504(void)

{
                    /* inline[API_FD26]: $007C $7188 */
  FarCallInline();
  FUN_M78_r3_24000__0717();
  API_FE10();
  return;
}


// ===== FUN_M78_r3_24000__0514 @ M78_r3_24000::0514 =====

void __h3000 FUN_M78_r3_24000__0514(void)

{
  FUN_M78_r3_24000__173b();
  FUN_M78_r3_24000__0717();
  API_FE14();
  return;
}


// ===== FUN_M78_r3_24000__051f @ M78_r3_24000::051f =====

void __h3000 FUN_M78_r3_24000__051f(void)

{
  FUN_M78_r3_24000__1810();
  FUN_M78_r3_24000__0717();
  API_FE16();
  return;
}


// ===== FUN_M78_r3_24000__052a @ M78_r3_24000::052a =====

void __h3000 FUN_M78_r3_24000__052a(void)

{
  FUN_M78_r3_24000__19fa();
  return;
}


// ===== FUN_M78_r3_24000__052e @ M78_r3_24000::052e =====

void __h3000 FUN_M78_r3_24000__052e(void)

{
  FUN_M78_r3_24000__0968();
  return;
}


// ===== FUN_M78_r3_24000__0532 @ M78_r3_24000::0532 =====

void __h3000 FUN_M78_r3_24000__0532(void)

{
  FUN_M78_r3_24000__0a1f();
  return;
}


// ===== FUN_M78_r3_24000__0536 @ M78_r3_24000::0536 =====

void __h3000 FUN_M78_r3_24000__0536(void)

{
  FUN_M78_r3_24000__0ad6();
  return;
}


// ===== FUN_M78_r3_24000__053a @ M78_r3_24000::053a =====

void __h3000 FUN_M78_r3_24000__053a(void)

{
  FUN_M78_r3_24000__0b8d();
  return;
}


// ===== FUN_M78_r3_24000__053e @ M78_r3_24000::053e =====

void __h3000 FUN_M78_r3_24000__053e(void)

{
  FUN_M78_r3_24000__1d63();
  return;
}


// ===== FUN_M78_r3_24000__0542 @ M78_r3_24000::0542 =====

void __h3000 FUN_M78_r3_24000__0542(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M78_r3_24000__0547 @ M78_r3_24000::0547 =====

void __h3000 FUN_M78_r3_24000__0547(void)

{
                    /* inline[API_FE02]: " record " "--stop--" "-play 1-" "-play 2-" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2D87 ->$26BC ->$285C ->$289D ->$05FA ->$06DE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__0580 @ M78_r3_24000::0580 =====

void __h3000 FUN_M78_r3_24000__0580(void)

{
                    /* inline[API_FE02]: "-trg en-" "-record-" [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2F98 ->$3032 ->$0941 ->$0941 ->$312D ->$312D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__05ab @ M78_r3_24000::05ab =====

void __h3000 FUN_M78_r3_24000__05ab(void)

{
                    /* inline[API_FE02]: "-trg en-" "-record-" [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2FE5 ->$305B ->$0941 ->$0941 ->$312D ->$312D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__05d6 @ M78_r3_24000::05d6 =====

void __h3000 FUN_M78_r3_24000__05d6(void)

{
                    /* inline[API_FE02]: "--stop--" [*] [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3084 ->$0941 ->$0941 ->$0941 ->$3084 ->$3084 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__05fa @ M78_r3_24000::05fa =====

void __h3000 FUN_M78_r3_24000__05fa(void)

{
                    /* inline[API_FE02]: "-edit 1-" "-edit 2-" "   mix  " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3729 ->$3903 ->$08E7 ->$0717 ->$0633 ->$0547 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__0633 @ M78_r3_24000::0633 =====

void __h3000 FUN_M78_r3_24000__0633(void)

{
                    /* inline[API_FE02]: "pitch 1 " " time 1 " "-play 1-" "-play 2-" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C1E ->$10D3 ->$285C ->$289D ->$066C ->$05FA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__066c @ M78_r3_24000::066c =====

void __h3000 FUN_M78_r3_24000__066c(void)

{
                    /* inline[API_FE02]: "attack 1" "release1" "-play 1-" "-play 2-" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$08F0 ->$0902 ->$285C ->$289D ->$06A5 ->$0633 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__06a5 @ M78_r3_24000::06a5 =====

void __h3000 FUN_M78_r3_24000__06a5(void)

{
                    /* inline[API_FE02]: "pitch 2 " " time 2 " "-play 1-" "-play 2-" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0E71 ->$1273 ->$285C ->$289D ->$06DE ->$066C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__06de @ M78_r3_24000::06de =====

void __h3000 FUN_M78_r3_24000__06de(void)

{
                    /* inline[API_FE02]: "attack 2" "release2" "-play 1-" "-play 2-" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$08F9 ->$090B ->$285C ->$289D ->$0547 ->$06A5 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__0717 @ M78_r3_24000::0717 =====

void __h3000 FUN_M78_r3_24000__0717(void)

{
                    /* inline[API_FE02]: "aud trig" "  midi  " "shftmode" "rec mode" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$077B ->$080C ->$172F ->$1804 ->$0750 ->$0750 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__0750 @ M78_r3_24000::0750 =====

void __h3000 FUN_M78_r3_24000__0750(void)

{
                    /* inline[API_FE02]: "drumtrig" [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0938 ->$0941 ->$0941 ->$05FA ->$0717 ->$0717 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M78_r3_24000__077b @ M78_r3_24000::077b =====

void __h3000 FUN_M78_r3_24000__077b(void)

{
                    /* inline[API_FE02]: "trig en " [*] [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1453 ->$0941 ->$0941 ->$0941 ->$1D1A ->$1D1A */
  SetModuleHandlers();
  FUN_M78_r3_24000__07a5();
  FUN_M78_r3_24000__1453();
  return;
}


// ===== FUN_M78_r3_24000__07a5 @ M78_r3_24000::07a5 =====

undefined2 __h3000 FUN_M78_r3_24000__07a5(void)

{
  undefined2 in_D;
  
  if ((DAT_7034 == 0) || (DAT_7034 != 1)) {
                    /* inline[API_FE02]: [-] [*] [*] [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
                    /* inline[API_FE00]: ->$1453 ->$0941 ->$0941 ->$0941 ->$1D1A ->$1D1A */
    SetModuleHandlers();
  }
  else {
                    /* inline[API_FE02]: [-] "thresh 1" "thresh 2" [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
                    /* inline[API_FE00]: ->$1453 ->$1C24 ->$1C9F ->$0941 ->$1D1A ->$1D1A */
    SetModuleHandlers();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__080c @ M78_r3_24000::080c =====

void __h3000 FUN_M78_r3_24000__080c(void)

{
                    /* inline[API_FE02]: "midimode" [*] [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1611 ->$0941 ->$0941 ->$0941 ->$0717 ->$0717 */
  SetModuleHandlers();
  FUN_M78_r3_24000__0836();
  FUN_M78_r3_24000__1611();
  return;
}


// ===== FUN_M78_r3_24000__0836 @ M78_r3_24000::0836 =====

undefined2 __h3000 FUN_M78_r3_24000__0836(void)

{
  undefined2 in_D;
  
  if (DAT_70a8 != 0) {
    if (DAT_70a8 == 1) {
                    /* inline[API_FE02]: [-] "bs note1" "bs note2" "split pt" */
      SoftKeyLabels4Inline();
      API_FDF2();
                    /* inline[API_FE00]: ->$1611 ->$091D ->$0926 ->$092F ->$0717 ->$0717 */
      SetModuleHandlers();
      goto LAB_M78_r3_24000__08d2;
    }
    if (DAT_70a8 == 2) {
                    /* inline[API_FE02]: [-] "bs note " [*] [*] */
      SoftKeyLabels4Inline();
      API_FDF2();
                    /* inline[API_FE00]: ->$1611 ->$0914 ->$0941 ->$0941 ->$0717 ->$0717 */
      SetModuleHandlers();
      goto LAB_M78_r3_24000__08d2;
    }
  }
                    /* inline[API_FE02]: [-] [*] [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1611 ->$0941 ->$0941 ->$0941 ->$0717 ->$0717 */
  SetModuleHandlers();
LAB_M78_r3_24000__08d2:
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x16);
                    /* inline[API_FC62]: $603A */
  ModuleStorePtr(7);
  return in_D;
}


// ===== FUN_M78_r3_24000__08e7 @ M78_r3_24000::08e7 =====

void __h3000 FUN_M78_r3_24000__08e7(void)

{
                    /* inline[API_FD26]: $006E $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__08f0 @ M78_r3_24000::08f0 =====

void __h3000 FUN_M78_r3_24000__08f0(void)

{
                    /* inline[API_FD26]: $0056 $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__08f9 @ M78_r3_24000::08f9 =====

void __h3000 FUN_M78_r3_24000__08f9(void)

{
                    /* inline[API_FD26]: $0058 $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__0902 @ M78_r3_24000::0902 =====

void __h3000 FUN_M78_r3_24000__0902(void)

{
                    /* inline[API_FD26]: $005A $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__090b @ M78_r3_24000::090b =====

void __h3000 FUN_M78_r3_24000__090b(void)

{
                    /* inline[API_FD26]: $005C $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__0914 @ M78_r3_24000::0914 =====

void __h3000 FUN_M78_r3_24000__0914(void)

{
                    /* inline[API_FD26]: $003E $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__091d @ M78_r3_24000::091d =====

void __h3000 FUN_M78_r3_24000__091d(void)

{
                    /* inline[API_FD26]: $0040 $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__0926 @ M78_r3_24000::0926 =====

void __h3000 FUN_M78_r3_24000__0926(void)

{
                    /* inline[API_FD26]: $0042 $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__092f @ M78_r3_24000::092f =====

void __h3000 FUN_M78_r3_24000__092f(void)

{
                    /* inline[API_FD26]: $0044 $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__0938 @ M78_r3_24000::0938 =====

void __h3000 FUN_M78_r3_24000__0938(void)

{
                    /* inline[API_FD26]: $007A $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__0941 @ M78_r3_24000::0941 =====

void __h3000 FUN_M78_r3_24000__0941(void)

{
  return;
}


// ===== FUN_M78_r3_24000__0968 @ M78_r3_24000::0968 =====

void __h3000 FUN_M78_r3_24000__0968(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$09BD ->$0980 */
                    /* inline[API_FDBC]: "5.94...B" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942);
  return;
}


// ===== FUN_M78_r3_24000__0974 @ M78_r3_24000::0974 =====

void __h3000 FUN_M78_r3_24000__0974(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$09BD ->$0980 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942);
  return;
}


// ===== FUN_M78_r3_24000__0980 @ M78_r3_24000::0980 =====

void __h3000 FUN_M78_r3_24000__0980(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$09BD ->$0980 */
  API_FE6E(param_1,param_2,&PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942);
  return;
}


// ===== FUN_M78_r3_24000__098c @ M78_r3_24000::098c =====

void __h3000 FUN_M78_r3_24000__098c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$09BD ->$0980 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942);
  return;
}


// ===== FUN_M78_r3_24000__0998 @ M78_r3_24000::0998 =====

void __h3000 FUN_M78_r3_24000__0998(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$09BD ->$0980 $0974 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942);
  return;
}


// ===== FUN_M78_r3_24000__09a6 @ M78_r3_24000::09a6 =====

undefined2 __h3000 FUN_M78_r3_24000__09a6(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__1da0(param_1,param_2,&PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942);
  LcdSetCursor(extraout_A,0x1b);
                    /* inline[API_FC38]: " " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__09bd @ M78_r3_24000::09bd =====

undefined2 __h3000 FUN_M78_r3_24000__09bd(void)

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
                    /* inline[API_FD26]: $000A $7188 */
  FarCallInline();
  DAT_70ec = *puVar2;
  DAT_70ee = puVar2[1];
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
  if (DAT_73b9 != 1) {
    FUN_M78_r3_24000__0d46();
    FUN_M78_r3_24000__1130();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__0a1f @ M78_r3_24000::0a1f =====

void __h3000 FUN_M78_r3_24000__0a1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0A74 ->$0A37 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9);
  return;
}


// ===== FUN_M78_r3_24000__0a2b @ M78_r3_24000::0a2b =====

void __h3000 FUN_M78_r3_24000__0a2b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0A74 ->$0A37 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9);
  return;
}


// ===== FUN_M78_r3_24000__0a37 @ M78_r3_24000::0a37 =====

void __h3000 FUN_M78_r3_24000__0a37(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0A74 ->$0A37 */
  API_FE6E(param_1,param_2,&PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9);
  return;
}


// ===== FUN_M78_r3_24000__0a43 @ M78_r3_24000::0a43 =====

void __h3000 FUN_M78_r3_24000__0a43(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0A74 ->$0A37 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9);
  return;
}


// ===== FUN_M78_r3_24000__0a4f @ M78_r3_24000::0a4f =====

void __h3000 FUN_M78_r3_24000__0a4f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0A74 ->$0A37 $0A2B */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9);
  return;
}


// ===== FUN_M78_r3_24000__0a5d @ M78_r3_24000::0a5d =====

undefined2 __h3000 FUN_M78_r3_24000__0a5d(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__1da0(param_1,param_2,&PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9);
  LcdSetCursor(extraout_A,0x1b);
                    /* inline[API_FC38]: " " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__0a74 @ M78_r3_24000::0a74 =====

undefined2 __h3000 FUN_M78_r3_24000__0a74(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7078;
  *(char *)(in_U + -1) = (char)DAT_7078;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $000A $7188 */
  FarCallInline();
  DAT_70f4 = *puVar2;
  DAT_70f6 = puVar2[1];
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  if (DAT_73bb != 1) {
    FUN_M78_r3_24000__0f73();
    FUN_M78_r3_24000__12d0();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__0ad6 @ M78_r3_24000::0ad6 =====

void __h3000 FUN_M78_r3_24000__0ad6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0B2B ->$0AEE */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0);
  return;
}


// ===== FUN_M78_r3_24000__0ae2 @ M78_r3_24000::0ae2 =====

void __h3000 FUN_M78_r3_24000__0ae2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0B2B ->$0AEE */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0);
  return;
}


// ===== FUN_M78_r3_24000__0aee @ M78_r3_24000::0aee =====

void __h3000 FUN_M78_r3_24000__0aee(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0B2B ->$0AEE */
  API_FE6E(param_1,param_2,&PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0);
  return;
}


// ===== FUN_M78_r3_24000__0afa @ M78_r3_24000::0afa =====

void __h3000 FUN_M78_r3_24000__0afa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0B2B ->$0AEE */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0);
  return;
}


// ===== FUN_M78_r3_24000__0b06 @ M78_r3_24000::0b06 =====

void __h3000 FUN_M78_r3_24000__0b06(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0B2B ->$0AEE $0AE2 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0);
  return;
}


// ===== FUN_M78_r3_24000__0b14 @ M78_r3_24000::0b14 =====

undefined2 __h3000 FUN_M78_r3_24000__0b14(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__1da0(param_1,param_2,&PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0);
  LcdSetCursor(extraout_A,0x27);
                    /* inline[API_FC38]: " " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__0b2b @ M78_r3_24000::0b2b =====

undefined2 __h3000 FUN_M78_r3_24000__0b2b(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7070;
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $000A $7188 */
  FarCallInline();
  DAT_70f0 = *puVar2;
  DAT_70f2 = puVar2[1];
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
  if (DAT_73b9 != 1) {
    FUN_M78_r3_24000__0d46();
    FUN_M78_r3_24000__1130();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__0b8d @ M78_r3_24000::0b8d =====

void __h3000 FUN_M78_r3_24000__0b8d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0BE2 ->$0BA5 */
                    /* inline[API_FDBC]: "5.94...g" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67);
  return;
}


// ===== FUN_M78_r3_24000__0b99 @ M78_r3_24000::0b99 =====

void __h3000 FUN_M78_r3_24000__0b99(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0BE2 ->$0BA5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67);
  return;
}


// ===== FUN_M78_r3_24000__0ba5 @ M78_r3_24000::0ba5 =====

void __h3000 FUN_M78_r3_24000__0ba5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0BE2 ->$0BA5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67);
  return;
}


// ===== FUN_M78_r3_24000__0bb1 @ M78_r3_24000::0bb1 =====

void __h3000 FUN_M78_r3_24000__0bb1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0BE2 ->$0BA5 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67);
  return;
}


// ===== FUN_M78_r3_24000__0bbd @ M78_r3_24000::0bbd =====

void __h3000 FUN_M78_r3_24000__0bbd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0BE2 ->$0BA5 $0B99 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67);
  return;
}


// ===== FUN_M78_r3_24000__0bcb @ M78_r3_24000::0bcb =====

undefined2 __h3000 FUN_M78_r3_24000__0bcb(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__1da0(param_1,param_2,&PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67);
  LcdSetCursor(extraout_A,0x27);
                    /* inline[API_FC38]: " " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__0be2 @ M78_r3_24000::0be2 =====

undefined2 __h3000 FUN_M78_r3_24000__0be2(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7080;
  *(char *)(in_U + -1) = (char)DAT_7080;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $000A $7188 */
  FarCallInline();
  DAT_70f8 = *puVar2;
  DAT_70fa = puVar2[1];
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  if (DAT_73b9 != 1) {
    FUN_M78_r3_24000__0f73();
    FUN_M78_r3_24000__12d0();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__0c1e @ M78_r3_24000::0c1e =====

undefined2 __h3000 FUN_M78_r3_24000__0c1e(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__0cc5();
  DAT_60dc = 100;
  DAT_60de = 100;
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0xc);
  LcdSetCursor();
                    /* inline[API_FC38]: "pitch 1 " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M78_r3_24000__0c4b @ M78_r3_24000::0c4b =====

undefined2 __h3000 FUN_M78_r3_24000__0c4b(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__0cc5();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0xc);
  LcdSetCursor();
                    /* inline[API_FC38]: " fine 1 " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M78_r3_24000__0cb9 @ M78_r3_24000::0cb9 =====

void __h3000 FUN_M78_r3_24000__0cb9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0D46 ->$0CF5 */
                    /* inline[API_FDBC]: "5.94...o" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  return;
}


// ===== FUN_M78_r3_24000__0cc5 @ M78_r3_24000::0cc5 =====

void __h3000 FUN_M78_r3_24000__0cc5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0D46 ->$0CF5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  return;
}


// ===== FUN_M78_r3_24000__0cd1 @ M78_r3_24000::0cd1 =====

void __h3000 FUN_M78_r3_24000__0cd1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0D46 ->$0CF5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  return;
}


// ===== FUN_M78_r3_24000__0cdd @ M78_r3_24000::0cdd =====

void __h3000 FUN_M78_r3_24000__0cdd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0D46 ->$0CF5 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  return;
}


// ===== FUN_M78_r3_24000__0ce9 @ M78_r3_24000::0ce9 =====

void __h3000 FUN_M78_r3_24000__0ce9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0D46 ->$0CF5 $0CD1 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  return;
}


// ===== FUN_M78_r3_24000__0cf5 @ M78_r3_24000::0cf5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__0cf5(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$0D46 ->$0CF5 */
  API_FE6E();
  uVar1 = DAT_70e4;
  *(char *)(in_U + -1) = (char)DAT_70e4;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_7128);
  return in_D;
}


// ===== FUN_M78_r3_24000__0d20 @ M78_r3_24000::0d20 =====

undefined2 __h3000 FUN_M78_r3_24000__0d20(void)

{
  undefined2 in_D;
  short in_U;
  undefined1 *puVar1;
  undefined2 *puVar2;
  
  *(char *)(in_U + -1) = (char)in_D;
  *(char *)(in_U + -2) = (char)((ushort)in_D >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar1 = (undefined1 *)(in_U + -4);
  *puVar1 = 0;
  API_FCE6();
  puVar2 = (undefined2 *)(puVar1 + -2);
                    /* inline[API_FD26]: $002A $7188 */
  FarCallInline();
  return *puVar2;
}


// ===== FUN_M78_r3_24000__0d38 @ M78_r3_24000::0d38 =====

undefined2 __h3000 FUN_M78_r3_24000__0d38(void)

{
  undefined2 in_D;
  short in_U;
  undefined2 *puVar1;
  
  *(char *)(in_U + -1) = (char)in_D;
  *(char *)(in_U + -2) = (char)((ushort)in_D >> 8);
  *(undefined1 *)(in_U + -3) = 0x89;
  puVar1 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar1 = 0x41;
  API_FCF2();
  return *puVar1;
}


// ===== FUN_M78_r3_24000__0d46 @ M78_r3_24000::0d46 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__0d46(void)

{
  short sVar1;
  undefined2 in_D;
  undefined2 uVar2;
  
  sVar1 = DAT_703a;
  DAT_703a = DAT_703a + DAT_703c;
  API_FE76((char)((ushort)DAT_703a >> 8),(char)DAT_703a,
           &PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  DAT_703a = sVar1;
  DAT_70e4 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_703e >> 8));
  DAT_70e6 = FUN_M78_r3_24000__0d38();
  if (DAT_7176 != 0) {
    DAT_70e6 = -DAT_70e6;
  }
  if (DAT_7254 == 0) goto LAB_M78_r3_24000__0de1;
  if (DAT_7254 != 1) {
    if (DAT_7254 == 2) {
      FUN_M78_r3_24000__0e02();
      goto LAB_M78_r3_24000__0de1;
    }
    if (DAT_7090 == 1) {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70e6 >> 8));
      goto LAB_M78_r3_24000__0de1;
    }
    FUN_M78_r3_24000__0e02();
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70e6 >> 8));
LAB_M78_r3_24000__0de1:
  uVar2 = 0;
  if (DAT_7088 != 0) {
    uVar2 = FUN_M78_r3_24000__1130();
  }
  API_FE76((char)((ushort)uVar2 >> 8),(char)uVar2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  DAT_70e4 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_703e >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__0e02 @ M78_r3_24000::0e02 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__0e02(void)

{
  short sVar1;
  undefined2 in_D;
  undefined2 uVar2;
  
  sVar1 = DAT_703a;
  DAT_703a = DAT_703a + DAT_7268;
  API_FE76((char)((ushort)DAT_703a >> 8),(char)DAT_703a,
           &PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  DAT_703a = sVar1;
  DAT_7258 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_703e >> 8));
  DAT_725a = FUN_M78_r3_24000__0d38();
  if (DAT_7176 != 0) {
    DAT_725a = -DAT_725a;
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_725a >> 8));
  uVar2 = 0;
  if (DAT_7088 != 0) {
    uVar2 = FUN_M78_r3_24000__11e5();
  }
  API_FE76((char)((ushort)uVar2 >> 8),(char)uVar2,&PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f);
  DAT_70e4 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_703e >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__0e71 @ M78_r3_24000::0e71 =====

undefined2 __h3000 FUN_M78_r3_24000__0e71(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__0f18();
  DAT_60dc = 100;
  DAT_60de = 100;
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0xe);
  LcdSetCursor();
                    /* inline[API_FC38]: "pitch 2 " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M78_r3_24000__0e9e @ M78_r3_24000::0e9e =====

undefined2 __h3000 FUN_M78_r3_24000__0e9e(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__0f18();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0xe);
  LcdSetCursor();
                    /* inline[API_FC38]: " fine 2 " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M78_r3_24000__0f0c @ M78_r3_24000::0f0c =====

void __h3000 FUN_M78_r3_24000__0f0c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F73 ->$0F48 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  return;
}


// ===== FUN_M78_r3_24000__0f18 @ M78_r3_24000::0f18 =====

void __h3000 FUN_M78_r3_24000__0f18(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F73 ->$0F48 */
  API_FE6A(param_1,param_2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  return;
}


// ===== FUN_M78_r3_24000__0f24 @ M78_r3_24000::0f24 =====

void __h3000 FUN_M78_r3_24000__0f24(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F73 ->$0F48 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  return;
}


// ===== FUN_M78_r3_24000__0f30 @ M78_r3_24000::0f30 =====

void __h3000 FUN_M78_r3_24000__0f30(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F73 ->$0F48 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  return;
}


// ===== FUN_M78_r3_24000__0f3c @ M78_r3_24000::0f3c =====

void __h3000 FUN_M78_r3_24000__0f3c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F73 ->$0F48 $0F24 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  return;
}


// ===== FUN_M78_r3_24000__0f48 @ M78_r3_24000::0f48 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__0f48(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$0F73 ->$0F48 */
  API_FE6E();
  uVar1 = DAT_70e8;
  *(char *)(in_U + -1) = (char)DAT_70e8;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_7128);
  return in_D;
}


// ===== FUN_M78_r3_24000__0f73 @ M78_r3_24000::0f73 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__0f73(void)

{
  short sVar1;
  undefined2 in_D;
  undefined2 uVar2;
  
  sVar1 = DAT_7046;
  DAT_7046 = DAT_7046 + DAT_7048;
  API_FE76((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,
           &PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  DAT_7046 = sVar1;
  DAT_70e8 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_704a >> 8));
  DAT_70ea = FUN_M78_r3_24000__0d38();
  if (DAT_7178 != 0) {
    DAT_70ea = -DAT_70ea;
  }
  if (DAT_7256 == 0) goto LAB_M78_r3_24000__101d;
  if (DAT_7256 != 1) {
    if (DAT_7256 == 2) {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70ea >> 8));
      goto LAB_M78_r3_24000__101d;
    }
    if (DAT_7090 == 1) {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70ea >> 8));
      goto LAB_M78_r3_24000__101d;
    }
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70ea >> 8));
  }
  FUN_M78_r3_24000__103e();
LAB_M78_r3_24000__101d:
  uVar2 = 0;
  if (DAT_7088 != 0) {
    uVar2 = FUN_M78_r3_24000__12d0();
  }
  API_FE76((char)((ushort)uVar2 >> 8),(char)uVar2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  DAT_70e8 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_704a >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__103e @ M78_r3_24000::103e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__103e(void)

{
  short sVar1;
  undefined2 in_D;
  undefined2 uVar2;
  
  sVar1 = DAT_7046;
  DAT_7046 = DAT_7046 + DAT_726a;
  API_FE76((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,
           &PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  DAT_7046 = sVar1;
  DAT_725c = FUN_M78_r3_24000__0d20((char)((ushort)DAT_704a >> 8));
  DAT_725e = FUN_M78_r3_24000__0d38();
  if (DAT_7178 != 0) {
    DAT_725e = -DAT_725e;
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_725e >> 8));
  uVar2 = 0;
  if (DAT_7088 != 0) {
    uVar2 = FUN_M78_r3_24000__1394();
  }
  API_FE76((char)((ushort)uVar2 >> 8),(char)uVar2,&PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2);
  DAT_70e8 = FUN_M78_r3_24000__0d20((char)((ushort)DAT_704a >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__10d3 @ M78_r3_24000::10d3 =====

void __h3000 FUN_M78_r3_24000__10d3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1130 ->$10F7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad);
  return;
}


// ===== FUN_M78_r3_24000__10df @ M78_r3_24000::10df =====

void __h3000 FUN_M78_r3_24000__10df(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1130 ->$10F7 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad);
  return;
}


// ===== FUN_M78_r3_24000__10eb @ M78_r3_24000::10eb =====

void __h3000 FUN_M78_r3_24000__10eb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1130 ->$10F7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad);
  return;
}


// ===== FUN_M78_r3_24000__10f7 @ M78_r3_24000::10f7 =====

void __h3000 FUN_M78_r3_24000__10f7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1130 ->$10F7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad);
  return;
}


// ===== FUN_M78_r3_24000__1103 @ M78_r3_24000::1103 =====

void __h3000 FUN_M78_r3_24000__1103(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1130 ->$10F7 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad);
  return;
}


// ===== FUN_M78_r3_24000__110f @ M78_r3_24000::110f =====

void __h3000 FUN_M78_r3_24000__110f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1130 ->$10F7 $10EB */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad);
  return;
}


// ===== FUN_M78_r3_24000__1130 @ M78_r3_24000::1130 =====

undefined2 __h3000 FUN_M78_r3_24000__1130(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  API_FE76();
  uVar2 = (undefined1)((ushort)DAT_7054 >> 8);
  if (DAT_7088 == 0) {
    *(char *)(in_U + -1) = (char)DAT_7054;
    *(undefined1 *)(in_U + -2) = uVar2;
    *(undefined1 *)(in_U + -3) = 0x89;
    psVar3 = (short *)(in_U + -4);
    *(undefined1 *)psVar3 = 0x41;
    API_FCF2();
    DAT_7058 = *psVar3;
  }
  else {
    *(char *)(in_U + -1) = (char)DAT_7054;
    *(undefined1 *)(in_U + -2) = uVar2;
    uVar1 = DAT_70e4;
    *(char *)(in_U + -3) = (char)DAT_70e4;
    psVar3 = (short *)(in_U + -4);
    *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
    API_FCF2();
    FUN_M78_r3_24000__1e10();
    DAT_7058 = *psVar3;
  }
  if (DAT_7176 != 0) {
    DAT_7058 = -DAT_7058;
  }
  if (DAT_7254 == 0) {
    return in_D;
  }
  if (DAT_7254 != 1) {
    if (DAT_7254 == 2) {
      FUN_M78_r3_24000__11e5();
      return in_D;
    }
    if (DAT_7090 == 1) {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_7058 >> 8));
      return in_D;
    }
    FUN_M78_r3_24000__11e5();
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7058 >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__11e5 @ M78_r3_24000::11e5 =====

undefined2 __h3000 FUN_M78_r3_24000__11e5(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  API_FE76();
  uVar2 = (undefined1)((ushort)DAT_7054 >> 8);
  if (DAT_7088 == 0) {
    *(char *)(in_U + -1) = (char)DAT_7054;
    *(undefined1 *)(in_U + -2) = uVar2;
    *(undefined1 *)(in_U + -3) = 0x89;
    psVar3 = (short *)(in_U + -4);
    *(undefined1 *)psVar3 = 0x41;
    API_FCF2();
    DAT_7262 = *psVar3;
  }
  else {
    *(char *)(in_U + -1) = (char)DAT_7054;
    *(undefined1 *)(in_U + -2) = uVar2;
    uVar1 = DAT_7258;
    *(char *)(in_U + -3) = (char)DAT_7258;
    psVar3 = (short *)(in_U + -4);
    *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
    API_FCF2();
    FUN_M78_r3_24000__1e10();
    DAT_7262 = *psVar3;
  }
  if (DAT_7176 != 0) {
    DAT_7262 = -DAT_7262;
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7262 >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__1273 @ M78_r3_24000::1273 =====

void __h3000 FUN_M78_r3_24000__1273(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$12D0 ->$1297 */
  API_FE6A(param_1,param_2,&PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d);
  return;
}


// ===== FUN_M78_r3_24000__127f @ M78_r3_24000::127f =====

void __h3000 FUN_M78_r3_24000__127f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$12D0 ->$1297 */
                    /* inline[API_FDBC]: "5.94...M" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d);
  return;
}


// ===== FUN_M78_r3_24000__128b @ M78_r3_24000::128b =====

void __h3000 FUN_M78_r3_24000__128b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$12D0 ->$1297 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d);
  return;
}


// ===== FUN_M78_r3_24000__1297 @ M78_r3_24000::1297 =====

void __h3000 FUN_M78_r3_24000__1297(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$12D0 ->$1297 */
  API_FE6E(param_1,param_2,&PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d);
  return;
}


// ===== FUN_M78_r3_24000__12a3 @ M78_r3_24000::12a3 =====

void __h3000 FUN_M78_r3_24000__12a3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$12D0 ->$1297 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d);
  return;
}


// ===== FUN_M78_r3_24000__12af @ M78_r3_24000::12af =====

void __h3000 FUN_M78_r3_24000__12af(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$12D0 ->$1297 $128B */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d);
  return;
}


// ===== FUN_M78_r3_24000__12d0 @ M78_r3_24000::12d0 =====

undefined2 __h3000 FUN_M78_r3_24000__12d0(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  API_FE76();
  uVar2 = (undefined1)((ushort)DAT_705e >> 8);
  if (DAT_7088 == 0) {
    *(char *)(in_U + -1) = (char)DAT_705e;
    *(undefined1 *)(in_U + -2) = uVar2;
    *(undefined1 *)(in_U + -3) = 0x89;
    psVar3 = (short *)(in_U + -4);
    *(undefined1 *)psVar3 = 0x41;
    API_FCF2();
    DAT_7062 = *psVar3;
  }
  else {
    *(char *)(in_U + -1) = (char)DAT_705e;
    *(undefined1 *)(in_U + -2) = uVar2;
    uVar1 = DAT_70e8;
    *(char *)(in_U + -3) = (char)DAT_70e8;
    psVar3 = (short *)(in_U + -4);
    *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
    API_FCF2();
    FUN_M78_r3_24000__1e10();
    DAT_7062 = *psVar3;
  }
  if (DAT_7178 != 0) {
    DAT_7062 = -DAT_7062;
  }
  if (DAT_7256 == 0) {
    return in_D;
  }
  if (DAT_7256 != 1) {
    if (DAT_7256 == 2) {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_7062 >> 8));
      return in_D;
    }
    if (DAT_7090 == 1) {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_7062 >> 8));
      return in_D;
    }
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7062 >> 8));
  }
  FUN_M78_r3_24000__1394();
  return in_D;
}


// ===== FUN_M78_r3_24000__1394 @ M78_r3_24000::1394 =====

undefined2 __h3000 FUN_M78_r3_24000__1394(void)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  API_FE76();
  uVar2 = (undefined1)((ushort)DAT_705e >> 8);
  if (DAT_7088 == 0) {
    *(char *)(in_U + -1) = (char)DAT_705e;
    *(undefined1 *)(in_U + -2) = uVar2;
    *(undefined1 *)(in_U + -3) = 0x89;
    psVar3 = (short *)(in_U + -4);
    *(undefined1 *)psVar3 = 0x41;
    API_FCF2();
    DAT_7266 = *psVar3;
  }
  else {
    *(char *)(in_U + -1) = (char)DAT_705e;
    *(undefined1 *)(in_U + -2) = uVar2;
    uVar1 = DAT_725c;
    *(char *)(in_U + -3) = (char)DAT_725c;
    psVar3 = (short *)(in_U + -4);
    *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
    API_FCF2();
    FUN_M78_r3_24000__1e10();
    DAT_7266 = *psVar3;
  }
  if (DAT_7178 != 0) {
    DAT_7266 = -DAT_7266;
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7266 >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__1447 @ M78_r3_24000::1447 =====

void __h3000 FUN_M78_r3_24000__1447(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1492 ->$1483 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc);
  return;
}


// ===== FUN_M78_r3_24000__1453 @ M78_r3_24000::1453 =====

void __h3000 FUN_M78_r3_24000__1453(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc);
  return;
}


// ===== FUN_M78_r3_24000__145f @ M78_r3_24000::145f =====

void __h3000 FUN_M78_r3_24000__145f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1492 ->$1483 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc);
  return;
}


// ===== FUN_M78_r3_24000__146b @ M78_r3_24000::146b =====

void __h3000 FUN_M78_r3_24000__146b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1492 ->$1483 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc);
  return;
}


// ===== FUN_M78_r3_24000__1477 @ M78_r3_24000::1477 =====

void __h3000 FUN_M78_r3_24000__1477(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1492 ->$1483 $145F */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc);
  return;
}


// ===== FUN_M78_r3_24000__1483 @ M78_r3_24000::1483 =====

void __h3000 FUN_M78_r3_24000__1483(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc);
  FUN_M78_r3_24000__07a5();
  return;
}


// ===== FUN_M78_r3_24000__1492 @ M78_r3_24000::1492 =====

undefined2 __h3000 FUN_M78_r3_24000__1492(void)

{
  undefined2 in_D;
  
  API_FE76();
  if ((DAT_7034 == 0) || (DAT_7034 != 1)) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  else if (DAT_7090 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__1605 @ M78_r3_24000::1605 =====

void __h3000 FUN_M78_r3_24000__1605(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1650 ->$1641 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba);
  return;
}


// ===== FUN_M78_r3_24000__1611 @ M78_r3_24000::1611 =====

void __h3000 FUN_M78_r3_24000__1611(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba);
  return;
}


// ===== FUN_M78_r3_24000__161d @ M78_r3_24000::161d =====

void __h3000 FUN_M78_r3_24000__161d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1650 ->$1641 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba);
  return;
}


// ===== FUN_M78_r3_24000__1629 @ M78_r3_24000::1629 =====

void __h3000 FUN_M78_r3_24000__1629(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1650 ->$1641 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba);
  return;
}


// ===== FUN_M78_r3_24000__1635 @ M78_r3_24000::1635 =====

void __h3000 FUN_M78_r3_24000__1635(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1650 ->$1641 $161D */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba);
  return;
}


// ===== FUN_M78_r3_24000__1641 @ M78_r3_24000::1641 =====

void __h3000 FUN_M78_r3_24000__1641(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba);
  FUN_M78_r3_24000__0836();
  return;
}


// ===== FUN_M78_r3_24000__1650 @ M78_r3_24000::1650 =====

undefined2 __h3000 FUN_M78_r3_24000__1650(void)

{
  undefined2 in_D;
  
  API_FE76();
  if (DAT_70a8 != 0) {
                    /* inline[API_FC62]: $6B01 */
    ModuleStorePtr(0x1f);
                    /* inline[API_FC62]: $6B03 */
    ModuleStorePtr(9);
    if ((DAT_7090 != 0) || (DAT_70a8 == 1)) {
      DAT_70a8 = 1;
      DAT_7144 = FUN_M78_r3_24000__2587;
      DAT_7146 = FUN_M78_r3_24000__263d;
      return in_D;
    }
    if (DAT_70a8 == 2) {
      DAT_7144 = FUN_M78_r3_24000__252a;
      DAT_7146 = FUN_M78_r3_24000__2563;
      return in_D;
    }
  }
                    /* inline[API_FC62]: $6B01 */
  ModuleStorePtr(9);
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(9);
  return in_D;
}


// ===== FUN_M78_r3_24000__172f @ M78_r3_24000::172f =====

void __h3000 FUN_M78_r3_24000__172f(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  return;
}


// ===== FUN_M78_r3_24000__173b @ M78_r3_24000::173b =====

void __h3000 FUN_M78_r3_24000__173b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$179C ->$1753 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  return;
}


// ===== FUN_M78_r3_24000__1747 @ M78_r3_24000::1747 =====

void __h3000 FUN_M78_r3_24000__1747(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$179C ->$1753 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  return;
}


// ===== FUN_M78_r3_24000__1753 @ M78_r3_24000::1753 =====

void __h3000 FUN_M78_r3_24000__1753(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  return;
}


// ===== FUN_M78_r3_24000__175f @ M78_r3_24000::175f =====

void __h3000 FUN_M78_r3_24000__175f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$179C ->$1753 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  return;
}


// ===== FUN_M78_r3_24000__176b @ M78_r3_24000::176b =====

void __h3000 FUN_M78_r3_24000__176b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$179C ->$1753 $1747 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  return;
}


// ===== FUN_M78_r3_24000__179c @ M78_r3_24000::179c =====

undefined2 __h3000 FUN_M78_r3_24000__179c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709);
  FUN_M78_r3_24000__1130();
  FUN_M78_r3_24000__12d0();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__1804 @ M78_r3_24000::1804 =====

void __h3000 FUN_M78_r3_24000__1804(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de);
  return;
}


// ===== FUN_M78_r3_24000__1810 @ M78_r3_24000::1810 =====

void __h3000 FUN_M78_r3_24000__1810(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1871 ->$1828 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de);
  return;
}


// ===== FUN_M78_r3_24000__181c @ M78_r3_24000::181c =====

void __h3000 FUN_M78_r3_24000__181c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1871 ->$1828 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de);
  return;
}


// ===== FUN_M78_r3_24000__1828 @ M78_r3_24000::1828 =====

void __h3000 FUN_M78_r3_24000__1828(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de);
  return;
}


// ===== FUN_M78_r3_24000__1834 @ M78_r3_24000::1834 =====

void __h3000 FUN_M78_r3_24000__1834(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1871 ->$1828 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de);
  return;
}


// ===== FUN_M78_r3_24000__1840 @ M78_r3_24000::1840 =====

void __h3000 FUN_M78_r3_24000__1840(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1871 ->$1828 $181C */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de);
  return;
}


// ===== FUN_M78_r3_24000__1871 @ M78_r3_24000::1871 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__1871(void)

{
  bool bVar1;
  char cVar2;
  undefined2 in_D;
  
  API_FE76();
  bVar1 = DAT_7090 == 0;
  if (bVar1) {
    DAT_714e = DAT_714a;
    DAT_7150 = DAT_714c;
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_714e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7150 >> 8));
  }
  else {
    cVar2 = (char)((ushort)DAT_714a >> 8);
    DAT_714e = CONCAT11(cVar2 >> 1,(char)DAT_714a >> 1 | cVar2 << 7);
    cVar2 = (char)((ushort)DAT_714c >> 8);
    DAT_7150 = CONCAT11(cVar2 >> 1,(char)DAT_714c >> 1 | cVar2 << 7);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_714e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7150 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7152 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)_DAT_7154 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_714a >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_714c >> 8));
  }
  DAT_7174 = (ushort)!bVar1;
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  FUN_M78_r3_24000__1492();
  FUN_M78_r3_24000__1650();
  return in_D;
}


// ===== FUN_M78_r3_24000__19fa @ M78_r3_24000::19fa =====

void __h3000 FUN_M78_r3_24000__19fa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1A36 ->$1A35 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1a36_M78_r3_24000__19d2);
  return;
}


// ===== FUN_M78_r3_24000__1a06 @ M78_r3_24000::1a06 =====

void __h3000 FUN_M78_r3_24000__1a06(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1A36 ->$1A35 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1a36_M78_r3_24000__19d2);
  return;
}


// ===== FUN_M78_r3_24000__1a12 @ M78_r3_24000::1a12 =====

void __h3000 FUN_M78_r3_24000__1a12(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1A36 ->$1A35 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1a36_M78_r3_24000__19d2);
  return;
}


// ===== FUN_M78_r3_24000__1a1e @ M78_r3_24000::1a1e =====

void __h3000 FUN_M78_r3_24000__1a1e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1A36 ->$1A35 $1A06 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1a36_M78_r3_24000__19d2);
  return;
}


// ===== FUN_M78_r3_24000__1a2a @ M78_r3_24000::1a2a =====

undefined2 __h3000 FUN_M78_r3_24000__1a2a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__1da0(param_1,param_2,&PTR_FUN_M78_r3_24000__1a36_M78_r3_24000__19d2);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__1a35 @ M78_r3_24000::1a35 =====

void __h3000 FUN_M78_r3_24000__1a35(void)

{
  return;
}


// ===== FUN_M78_r3_24000__1a36 @ M78_r3_24000::1a36 =====

undefined2 __h3000 FUN_M78_r3_24000__1a36(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_70c8;
  *(char *)(in_U + -1) = (char)DAT_70c8;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $001C $7188 */
  FarCallInline();
  DAT_7110 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7110 >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__1ab1 @ M78_r3_24000::1ab1 =====

void __h3000 FUN_M78_r3_24000__1ab1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1AEE ->$1AED */
                    /* inline[API_FDBC]: "5.94...f" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1aee_M78_r3_24000__1a66);
  return;
}


// ===== FUN_M78_r3_24000__1abd @ M78_r3_24000::1abd =====

void __h3000 FUN_M78_r3_24000__1abd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1AEE ->$1AED */
  API_FE6A(param_1,param_2,&PTR_FUN_M78_r3_24000__1aee_M78_r3_24000__1a66);
  return;
}


// ===== FUN_M78_r3_24000__1ac9 @ M78_r3_24000::1ac9 =====

void __h3000 FUN_M78_r3_24000__1ac9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1AEE ->$1AED */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1aee_M78_r3_24000__1a66);
  return;
}


// ===== FUN_M78_r3_24000__1ad5 @ M78_r3_24000::1ad5 =====

void __h3000 FUN_M78_r3_24000__1ad5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1AEE ->$1AED */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1aee_M78_r3_24000__1a66);
  return;
}


// ===== FUN_M78_r3_24000__1ae1 @ M78_r3_24000::1ae1 =====

void __h3000 FUN_M78_r3_24000__1ae1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1AEE ->$1AED $1AC9 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1aee_M78_r3_24000__1a66);
  return;
}


// ===== FUN_M78_r3_24000__1aed @ M78_r3_24000::1aed =====

void __h3000 FUN_M78_r3_24000__1aed(void)

{
  return;
}


// ===== FUN_M78_r3_24000__1aee @ M78_r3_24000::1aee =====

undefined2 __h3000 FUN_M78_r3_24000__1aee(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = DAT_70d0;
  *(char *)(in_U + -1) = (char)DAT_70d0;
  psVar2 = (short *)(in_U + -2);
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
                    /* inline[API_FD26]: $001C $7188 */
  FarCallInline();
  DAT_7110 = *psVar2;
  *psVar2 = DAT_70d0 + -4;
                    /* inline[API_FD26]: $001C $7188 */
  FarCallInline();
  DAT_7112 = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7110 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7112 >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__1b90 @ M78_r3_24000::1b90 =====

void __h3000 FUN_M78_r3_24000__1b90(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1BCD ->$1BCC */
                    /* inline[API_FDBC]: "5.94...E" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1bcd_M78_r3_24000__1b45);
  return;
}


// ===== FUN_M78_r3_24000__1b9c @ M78_r3_24000::1b9c =====

void __h3000 FUN_M78_r3_24000__1b9c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1BCD ->$1BCC */
  API_FE6A(param_1,param_2,&PTR_FUN_M78_r3_24000__1bcd_M78_r3_24000__1b45);
  return;
}


// ===== FUN_M78_r3_24000__1ba8 @ M78_r3_24000::1ba8 =====

void __h3000 FUN_M78_r3_24000__1ba8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1BCD ->$1BCC */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1bcd_M78_r3_24000__1b45);
  return;
}


// ===== FUN_M78_r3_24000__1bb4 @ M78_r3_24000::1bb4 =====

void __h3000 FUN_M78_r3_24000__1bb4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1BCD ->$1BCC */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1bcd_M78_r3_24000__1b45);
  return;
}


// ===== FUN_M78_r3_24000__1bc0 @ M78_r3_24000::1bc0 =====

void __h3000 FUN_M78_r3_24000__1bc0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1BCD ->$1BCC $1BA8 */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1bcd_M78_r3_24000__1b45);
  return;
}


// ===== FUN_M78_r3_24000__1bcc @ M78_r3_24000::1bcc =====

void __h3000 FUN_M78_r3_24000__1bcc(void)

{
  return;
}


// ===== FUN_M78_r3_24000__1bcd @ M78_r3_24000::1bcd =====

undefined2 __h3000 FUN_M78_r3_24000__1bcd(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = DAT_70d8;
  *(char *)(in_U + -1) = (char)DAT_70d8;
  psVar2 = (short *)(in_U + -2);
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
                    /* inline[API_FD26]: $001C $7188 */
  FarCallInline();
  DAT_7110 = *psVar2;
  *psVar2 = DAT_70d8 + -4;
                    /* inline[API_FD26]: $001C $7188 */
  FarCallInline();
  DAT_7112 = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7110 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7112 >> 8));
  return in_D;
}


// ===== FUN_M78_r3_24000__1c24 @ M78_r3_24000::1c24 =====

undefined2 __h3000 FUN_M78_r3_24000__1c24(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__1abd();
                    /* inline[API_FD26]: $002E $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0030 $7188 */
  FarCallInline();
                    /* inline[API_FC62]: $7250 */
  ModuleStorePtr(0x1c);
  return in_D;
}


// ===== FUN_M78_r3_24000__1c45 @ M78_r3_24000::1c45 =====

undefined2 __h3000 FUN_M78_r3_24000__1c45(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  short in_U;
  undefined1 *puVar2;
  
  if ((code *)(DAT_6070 - g_moduleBase) == FUN_M78_r3_24000__1aed) {
                    /* inline[API_FD26]: $0014 $7188 */
    FarCallInline();
    uVar1 = API_FD3A();
    *(char *)(in_U + -1) = (char)uVar1;
    puVar2 = (undefined1 *)(in_U + -2);
    *puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $0028 $7188 */
    FarCallInline();
    puVar2[1] = puVar2[1];
    *puVar2 = *puVar2;
                    /* inline[API_FD26]: $001E $7188 */
    uVar1 = FarCallInline();
    puVar2[-1] = (char)uVar1;
    puVar2 = puVar2 + -2;
    *puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $0020 $7188 */
    FarCallInline();
                    /* inline[API_FD26]: $0022 $7188 */
    FarCallInline();
    uVar1 = DAT_70d0;
    puVar2[-1] = (char)DAT_70d0;
    puVar2[-2] = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $0024 $7188 */
    FarCallInline();
                    /* inline[API_FD26]: $0026 $7188 */
    FarCallInline();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__1c9f @ M78_r3_24000::1c9f =====

undefined2 __h3000 FUN_M78_r3_24000__1c9f(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__1b9c();
                    /* inline[API_FD26]: $002E $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0030 $7188 */
  FarCallInline();
                    /* inline[API_FC62]: $7250 */
  ModuleStorePtr(0x1c);
  return in_D;
}


// ===== FUN_M78_r3_24000__1cc0 @ M78_r3_24000::1cc0 =====

undefined2 __h3000 FUN_M78_r3_24000__1cc0(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  short in_U;
  undefined1 *puVar2;
  
  if ((code *)(DAT_6070 - g_moduleBase) == FUN_M78_r3_24000__1bcc) {
                    /* inline[API_FD26]: $0016 $7188 */
    FarCallInline();
    uVar1 = API_FD3A();
    *(char *)(in_U + -1) = (char)uVar1;
    puVar2 = (undefined1 *)(in_U + -2);
    *puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $0028 $7188 */
    FarCallInline();
    puVar2[1] = puVar2[1];
    *puVar2 = *puVar2;
                    /* inline[API_FD26]: $001E $7188 */
    uVar1 = FarCallInline();
    puVar2[-1] = (char)uVar1;
    puVar2 = puVar2 + -2;
    *puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $0020 $7188 */
    FarCallInline();
                    /* inline[API_FD26]: $0022 $7188 */
    FarCallInline();
    uVar1 = DAT_70d8;
    puVar2[-1] = (char)DAT_70d8;
    puVar2[-2] = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $0024 $7188 */
    FarCallInline();
                    /* inline[API_FD26]: $0026 $7188 */
    FarCallInline();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__1d1a @ M78_r3_24000::1d1a =====

undefined2 __h3000 FUN_M78_r3_24000__1d1a(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $7250 */
  ModuleStorePtr(9);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(9);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(9);
  FUN_M78_r3_24000__0717();
  return in_D;
}


// ===== FUN_M78_r3_24000__1d63 @ M78_r3_24000::1d63 =====

void __h3000 FUN_M78_r3_24000__1d63(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1E04 ->$1E03 */
                    /* inline[API_FDBC]: "5.94...=" */
  API_FDBC(param_1,param_2,&PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d);
  return;
}


// ===== FUN_M78_r3_24000__1d6f @ M78_r3_24000::1d6f =====

void __h3000 FUN_M78_r3_24000__1d6f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1E04 ->$1E03 */
  API_FE6C(param_1,param_2,&PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d);
  return;
}


// ===== FUN_M78_r3_24000__1d7b @ M78_r3_24000::1d7b =====

void __h3000 FUN_M78_r3_24000__1d7b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1E04 ->$1E03 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d);
  return;
}


// ===== FUN_M78_r3_24000__1d87 @ M78_r3_24000::1d87 =====

void __h3000 FUN_M78_r3_24000__1d87(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1E04 ->$1E03 $1D6F */
  API_FE1A(param_1,param_2,&PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d);
  return;
}


// ===== FUN_M78_r3_24000__1d95 @ M78_r3_24000::1d95 =====

undefined2 __h3000 FUN_M78_r3_24000__1d95(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__1da0(param_1,param_2,&PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__1da0 @ M78_r3_24000::1da0 =====

undefined2 __h3000 FUN_M78_r3_24000__1da0(short param_1)

{
  undefined2 in_D;
  
  param_1 = param_1 + g_moduleBase;
  DAT_6074 = **(undefined2 **)(param_1 + 0xc);
  DAT_6066 = 1;
  DAT_6068 = 1;
  DAT_60e0 = 1;
  DAT_6067 = 1;
  DAT_6058 = 2;
  DAT_606e = *(undefined2 *)(param_1 + 0x13);
  DAT_606c = *(undefined2 *)(param_1 + 0x15);
  DAT_60dc = *(undefined2 *)(param_1 + 0x17);
  DAT_6099 = *(undefined1 *)(param_1 + 0x19);
  DAT_6069 = *(undefined1 *)(param_1 + 0x1a);
  DAT_6070 = *(short *)(param_1 + 2) + g_moduleBase;
  DAT_6072 = *(short *)(param_1 + 4) + g_moduleBase;
  DAT_60de = DAT_60dc;
  API_FC14();
  (*(code *)(*(short *)(param_1 + 2) + g_moduleBase))();
  return in_D;
}


// ===== FUN_M78_r3_24000__1e03 @ M78_r3_24000::1e03 =====

void __h3000 FUN_M78_r3_24000__1e03(void)

{
  return;
}


// ===== FUN_M78_r3_24000__1e04 @ M78_r3_24000::1e04 =====

undefined2 __h3000 FUN_M78_r3_24000__1e04(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__1e10 @ M78_r3_24000::1e10 =====

undefined2 __h3000 FUN_M78_r3_24000__1e10(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *in_U;
  
  uVar1 = *in_U;
  uVar2 = in_U[1];
  in_U[1] = uVar2;
  *in_U = uVar1;
  in_U[-1] = 0x10;
  in_U = in_U + -2;
  *in_U = 0;
  API_FCEC();
  in_U[-1] = uVar2;
  in_U[-2] = uVar1;
  in_U[-3] = 0x16;
  in_U[-4] = 0x31;
  API_FCF2();
  API_FCE2();
  return in_D;
}


// ===== FUN_M78_r3_24000__1e35 @ M78_r3_24000::1e35 =====

undefined2 __h3000 FUN_M78_r3_24000__1e35(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $000C $7188 */
  FarCallInline(param_1,0,&DAT_70ec);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__1e47 @ M78_r3_24000::1e47 =====

undefined2 __h3000 FUN_M78_r3_24000__1e47(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $000C $7188 */
  FarCallInline(param_1,0x15,&DAT_70f4);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__1e59 @ M78_r3_24000::1e59 =====

undefined2 __h3000 FUN_M78_r3_24000__1e59(void)

{
  undefined2 in_D;
  
  DAT_7186 = 1;
  DAT_7110 = 30000;
  do {
    DAT_7110 = DAT_7110 + -1;
    if (DAT_7110 < 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "ERROR - NO RESPONSE FROM PROCESSOR #3   " */
      LcdPrintInline();
      return in_D;
    }
  } while ((code *)(DAT_600f - g_moduleBase) != FUN_M78_r3_24000__1ee7);
  FUN_M78_r3_24000__1ee7(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__1eb8 @ M78_r3_24000::1eb8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1ed8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M78_r3_24000__1eb8(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_7186 != 0) {
                    /* inline[API_FC62]: $600F */
    ModuleStorePtr(0x1e);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x1ed8. Too many branches */
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


// ===== FUN_M78_r3_24000__1ee7 @ M78_r3_24000::1ee7 =====

undefined2 __h3000 FUN_M78_r3_24000__1ee7(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_715e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7160 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7162 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7166 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7168 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7174 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_716a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_716c >> 8));
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(9);
  DAT_7186 = 0;
  API_FD76();
  return in_D;
}


// ===== MODULE_78_02_entry @ M78_r3_24000::1fab =====

void __h3000 MODULE_78_02_entry(void)

{
  return;
}


// ===== FUN_M78_r3_24000__1fac @ M78_r3_24000::1fac =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__1fac(void)

{
  undefined2 in_D;
  
  _DAT_7381 = 0;
  DAT_7387 = 0;
  _DAT_7383 = 0;
  _DAT_7385 = 0;
  return in_D;
}


// ===== FUN_M78_r3_24000__1fc0 @ M78_r3_24000::1fc0 =====

byte __h3000 FUN_M78_r3_24000__1fc0(undefined1 param_1,byte param_2)

{
  if ((param_2 & 0xf0) == 0x90) {
    if (((char)DAT_608a < '\0') || ((param_2 & 0xf) == DAT_608a)) {
                    /* inline[API_FC62]: $6B03 */
      ModuleStorePtr((char)((ushort)DAT_7144 >> 8));
    }
    else {
                    /* inline[API_FC62]: $6B03 */
      ModuleStorePtr(0x1f);
    }
  }
  else if ((param_2 & 0xf0) == 0x80) {
    if (((char)DAT_608a < '\0') || ((param_2 & 0xf) == DAT_608a)) {
                    /* inline[API_FC62]: $6B03 */
      ModuleStorePtr((char)((ushort)DAT_7146 >> 8));
    }
    else {
                    /* inline[API_FC62]: $6B03 */
      ModuleStorePtr(0x1f);
    }
  }
  else {
                    /* inline[API_FC62]: $6B03 */
    ModuleStorePtr(0x1f);
  }
  return param_2;
}


// ===== FUN_M78_r3_24000__2020 @ M78_r3_24000::2020 =====

undefined2 __h3000 FUN_M78_r3_24000__2020(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_717a = 1;
  DAT_7254 = DAT_7254 | 1;
  DAT_7256 = DAT_7256 & 0xfffe;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  DAT_703c = FUN_M78_r3_24000__219c();
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__1130();
  return in_D;
}


// ===== FUN_M78_r3_24000__20a0 @ M78_r3_24000::20a0 =====

undefined2 __h3000 FUN_M78_r3_24000__20a0(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_717c = 1;
  DAT_7254 = DAT_7254 | 2;
  DAT_7256 = DAT_7256 & 0xfffd;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  DAT_7268 = FUN_M78_r3_24000__219c();
  FUN_M78_r3_24000__0e02();
  FUN_M78_r3_24000__11e5();
  return in_D;
}


// ===== FUN_M78_r3_24000__2120 @ M78_r3_24000::2120 =====

undefined2 __h3000 FUN_M78_r3_24000__2120(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_717a = 1;
  DAT_7254 = 3;
  DAT_7256 = 0;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  DAT_703c = FUN_M78_r3_24000__219c();
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__1130();
  return in_D;
}


// ===== FUN_M78_r3_24000__219c @ M78_r3_24000::219c =====

undefined2 __h3000 FUN_M78_r3_24000__219c(void)

{
  short in_U;
  undefined2 *puVar1;
  
  *(ushort *)(in_U + -2) = (ushort)DAT_7381 - DAT_70b8;
  *(undefined1 *)(in_U + -3) = 100;
  puVar1 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar1 = 0;
  API_FCEC();
  return *puVar1;
}


// ===== FUN_M78_r3_24000__21b5 @ M78_r3_24000::21b5 =====

undefined2 __h3000 FUN_M78_r3_24000__21b5(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_717a = 1;
  DAT_7256 = DAT_7256 | 1;
  DAT_7254 = DAT_7254 & 0xfffe;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  DAT_726a = FUN_M78_r3_24000__2331();
  FUN_M78_r3_24000__103e();
  FUN_M78_r3_24000__1394();
  return in_D;
}


// ===== FUN_M78_r3_24000__2235 @ M78_r3_24000::2235 =====

undefined2 __h3000 FUN_M78_r3_24000__2235(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_717c = 1;
  DAT_7256 = DAT_7256 | 2;
  DAT_7254 = DAT_7254 & 0xfffd;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  DAT_7048 = FUN_M78_r3_24000__2331();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__12d0();
  return in_D;
}


// ===== FUN_M78_r3_24000__22b5 @ M78_r3_24000::22b5 =====

undefined2 __h3000 FUN_M78_r3_24000__22b5(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  DAT_717c = 1;
  DAT_7256 = 3;
  DAT_7254 = 0;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  DAT_7048 = FUN_M78_r3_24000__2331();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__12d0();
  return in_D;
}


// ===== FUN_M78_r3_24000__2331 @ M78_r3_24000::2331 =====

undefined2 __h3000 FUN_M78_r3_24000__2331(void)

{
  short in_U;
  undefined2 *puVar1;
  
  *(ushort *)(in_U + -2) = (ushort)DAT_7381 - DAT_70c0;
  *(undefined1 *)(in_U + -3) = 100;
  puVar1 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar1 = 0;
  API_FCEC();
  return *puVar1;
}


// ===== FUN_M78_r3_24000__234a @ M78_r3_24000::234a =====

undefined2 __h3000 FUN_M78_r3_24000__234a(void)

{
  undefined2 in_D;
  byte extraout_CC;
  short in_U;
  undefined2 *puVar1;
  
  DAT_717a = 1;
  DAT_717c = 1;
  DAT_7254 = 1;
  DAT_7256 = 2;
  if ((DAT_7148 == 0) && (FUN_M78_r3_24000__2404(), (extraout_CC >> 2 & 1) == 0)) {
    return in_D;
  }
  if (DAT_7098 == 0) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  *(ushort *)(in_U + -2) = (ushort)DAT_7381 - DAT_70b0;
  *(undefined1 *)(in_U + -3) = 100;
  puVar1 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar1 = 0;
  API_FCEC();
  DAT_703c = *puVar1;
  DAT_7048 = DAT_703c;
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__1130();
  FUN_M78_r3_24000__12d0();
  return in_D;
}


// ===== FUN_M78_r3_24000__2404 @ M78_r3_24000::2404 =====

undefined2 __h3000 FUN_M78_r3_24000__2404(void)

{
  undefined2 in_D;
  
  if (DAT_73b9 != 0) {
    FUN_M78_r3_24000__3c50();
  }
  if (DAT_73bb != 0) {
    FUN_M78_r3_24000__3cd4();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2426 @ M78_r3_24000::2426 =====

undefined2 __h3000 FUN_M78_r3_24000__2426(void)

{
  undefined2 in_D;
  
  DAT_717a = 0;
  if ((DAT_7148 != 0) && (DAT_7098 == 0)) {
    if (DAT_7090 == 0) {
      API_FD20(0);
      API_FD2E(0);
      API_FD20(0);
      API_FD2E(0);
    }
    else {
      API_FD20(0);
      API_FD2E(0);
      API_FD20(0);
      API_FD2E(0);
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__248a @ M78_r3_24000::248a =====

undefined2 __h3000 FUN_M78_r3_24000__248a(void)

{
  undefined2 in_D;
  
  DAT_717c = 0;
  if ((DAT_7148 != 0) && (DAT_7098 == 0)) {
    if (DAT_7090 == 0) {
      API_FD20(0);
      API_FD2E(0);
      API_FD20(0);
      API_FD2E(0);
    }
    else {
      API_FD20(0);
      API_FD2E(0);
      API_FD20(0);
      API_FD2E(0);
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__24ee @ M78_r3_24000::24ee =====

undefined2 __h3000 FUN_M78_r3_24000__24ee(void)

{
  undefined2 in_D;
  
  DAT_717a = 0;
  DAT_717c = 0;
  if ((DAT_7148 != 0) && (DAT_7098 == 0)) {
    API_FD20(0);
    API_FD2E(0);
    API_FD20(0);
    API_FD2E(0);
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__252a @ M78_r3_24000::252a =====

undefined1 __h3000 FUN_M78_r3_24000__252a(undefined1 param_1,undefined1 param_2)

{
  DAT_7381 = param_2;
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x25);
  return param_2;
}


// ===== FUN_M78_r3_24000__253b @ M78_r3_24000::253b =====

char __h3000 FUN_M78_r3_24000__253b(undefined1 param_1,char param_2)

{
  if (param_2 == '\0') {
    if (DAT_7381 == DAT_7383) {
      FUN_M78_r3_24000__24ee();
    }
  }
  else {
    FUN_M78_r3_24000__234a();
    DAT_7383 = DAT_7381;
  }
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x25);
  return param_2;
}


// ===== FUN_M78_r3_24000__2563 @ M78_r3_24000::2563 =====

char __h3000 FUN_M78_r3_24000__2563(undefined1 param_1,char param_2)

{
  if (param_2 == DAT_7383) {
    FUN_M78_r3_24000__24ee();
  }
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x25);
  return param_2;
}


// ===== FUN_M78_r3_24000__2579 @ M78_r3_24000::2579 =====

undefined2 __h3000 FUN_M78_r3_24000__2579(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x25);
  return in_D;
}


// ===== FUN_M78_r3_24000__2587 @ M78_r3_24000::2587 =====

undefined1 __h3000 FUN_M78_r3_24000__2587(undefined1 param_1,undefined1 param_2)

{
  DAT_7381 = param_2;
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x25);
  return param_2;
}


// ===== FUN_M78_r3_24000__2598 @ M78_r3_24000::2598 =====

char __h3000 FUN_M78_r3_24000__2598(undefined1 param_1,char param_2)

{
  if (param_2 == '\0') {
    FUN_M78_r3_24000__265f();
  }
  else if ((short)((ushort)(byte)(DAT_7381 - (char)DAT_70a0) << 8) < 0 ==
           SBORROW1(DAT_7381,(char)DAT_70a0)) {
    if (DAT_7090 == 0) {
      if (DAT_7387 == 0) {
        FUN_M78_r3_24000__21b5();
        DAT_7383 = DAT_7381;
        DAT_7387 = 1;
      }
      else {
        FUN_M78_r3_24000__2235();
        DAT_7385 = DAT_7381;
        DAT_7387 = 0;
      }
    }
    else {
      FUN_M78_r3_24000__22b5();
      DAT_7383 = DAT_7381;
    }
  }
  else if (DAT_7090 == 0) {
    if (DAT_7387 == 0) {
      FUN_M78_r3_24000__2020();
      DAT_7383 = DAT_7381;
      DAT_7387 = 1;
    }
    else {
      FUN_M78_r3_24000__20a0();
      DAT_7385 = DAT_7381;
      DAT_7387 = 0;
    }
  }
  else {
    FUN_M78_r3_24000__2120();
    DAT_7383 = DAT_7381;
  }
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x25);
  return param_2;
}


// ===== FUN_M78_r3_24000__263d @ M78_r3_24000::263d =====

undefined1 __h3000 FUN_M78_r3_24000__263d(undefined1 param_1,undefined1 param_2)

{
  DAT_7381 = param_2;
  FUN_M78_r3_24000__265f();
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x26);
  return param_2;
}


// ===== FUN_M78_r3_24000__2651 @ M78_r3_24000::2651 =====

undefined2 __h3000 FUN_M78_r3_24000__2651(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6B03 */
  ModuleStorePtr(0x26);
  return in_D;
}


// ===== FUN_M78_r3_24000__265f @ M78_r3_24000::265f =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__265f(void)

{
  undefined2 in_D;
  
  if (DAT_7381 == DAT_7383) {
    FUN_M78_r3_24000__2426();
    _DAT_7383 = 0xffff;
    DAT_7387 = 0;
  }
  else if (DAT_7381 == DAT_7385) {
    FUN_M78_r3_24000__248a();
    _DAT_7385 = 0xffff;
    if (DAT_717a != 0) {
      DAT_7387 = 1;
    }
  }
  return in_D;
}


// ===== MODULE_78_03_entry @ M78_r3_24000::26a8 =====

void __h3000 MODULE_78_03_entry(void)

{
  return;
}


// ===== FUN_M78_r3_24000__26a9 @ M78_r3_24000::26a9 =====

void __h3000 FUN_M78_r3_24000__26a9(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_717a = 0;
  DAT_717c = 0;
  DAT_738d = 0;
  DAT_738f = 0;
                    /* WARNING: Could not recover jumptable at 0x26ba. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M78_r3_24000__26bc @ M78_r3_24000::26bc =====

void __h3000
FUN_M78_r3_24000__26bc
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M78_r3_24000__272c();
  FUN_M78_r3_24000__27b1();
  FUN_M78_r3_24000__27d7();
  FUN_M78_r3_24000__2810();
  FUN_M78_r3_24000__2849();
  FUN_M78_r3_24000__273f();
  FUN_M78_r3_24000__2d0f();
  FUN_M78_r3_24000__2ce1();
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
                    /* WARNING: Could not recover jumptable at 0x26de. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M78_r3_24000__26e0 @ M78_r3_24000::26e0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__26e0(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,0x14f);
  return;
}


// ===== FUN_M78_r3_24000__26f3 @ M78_r3_24000::26f3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__26f3(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,0x14f);
  return;
}


// ===== FUN_M78_r3_24000__2706 @ M78_r3_24000::2706 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2706(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,&BYTE_M78_r3_24000__024f);
  return;
}


// ===== FUN_M78_r3_24000__2719 @ M78_r3_24000::2719 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2719(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,&BYTE_M78_r3_24000__024f);
  return;
}


// ===== FUN_M78_r3_24000__272c @ M78_r3_24000::272c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__272c(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,"tch 2 ");
  return;
}


// ===== FUN_M78_r3_24000__273f @ M78_r3_24000::273f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__273f(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,"tch 2 ");
  return;
}


// ===== FUN_M78_r3_24000__2752 @ M78_r3_24000::2752 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2752(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,0x14b);
  return;
}


// ===== FUN_M78_r3_24000__2765 @ M78_r3_24000::2765 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2765(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,0x14b);
  return;
}


// ===== FUN_M78_r3_24000__2778 @ M78_r3_24000::2778 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2778(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,0x24c);
  return;
}


// ===== FUN_M78_r3_24000__278b @ M78_r3_24000::278b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__278b(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,0x24c);
  return;
}


// ===== FUN_M78_r3_24000__279e @ M78_r3_24000::279e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__279e(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,&BYTE_M78_r3_24000__034b);
  return;
}


// ===== FUN_M78_r3_24000__27b1 @ M78_r3_24000::27b1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__27b1(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,&BYTE_M78_r3_24000__034b);
  return;
}


// ===== FUN_M78_r3_24000__27c4 @ M78_r3_24000::27c4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__27c4(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,&BYTE_M78_r3_24000__034c);
  return;
}


// ===== FUN_M78_r3_24000__27d7 @ M78_r3_24000::27d7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__27d7(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,&BYTE_M78_r3_24000__034c);
  return;
}


// ===== FUN_M78_r3_24000__27ea @ M78_r3_24000::27ea =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__27ea(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,0x169);
  return;
}


// ===== FUN_M78_r3_24000__27fd @ M78_r3_24000::27fd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__27fd(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,&PTR_FUN_M78_r3_24000__1103_M78_r3_24000__0369);
  return;
}


// ===== FUN_M78_r3_24000__2810 @ M78_r3_24000::2810 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2810(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,&PTR_FUN_M78_r3_24000__1103_M78_r3_24000__0369);
  return;
}


// ===== FUN_M78_r3_24000__2823 @ M78_r3_24000::2823 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2823(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,0x26a);
  return;
}


// ===== FUN_M78_r3_24000__2836 @ M78_r3_24000::2836 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2836(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,1,param_3,0x36a);
  return;
}


// ===== FUN_M78_r3_24000__2849 @ M78_r3_24000::2849 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__2849(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  API_FD20(0);
  API_FD2E(0,0,param_3,0x36a);
  return;
}


// ===== FUN_M78_r3_24000__285c @ M78_r3_24000::285c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x289b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__285c(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_7090 != 1) {
    if ((DAT_604f & 0x12) == 0) {
      FUN_M78_r3_24000__28df();
      goto LAB_M78_r3_24000__289b;
    }
  }
  if (DAT_717e == 0) {
    FUN_M78_r3_24000__29b4();
  }
  else {
    FUN_M78_r3_24000__2810();
    DAT_717e = 0;
    FUN_M78_r3_24000__2d0f();
                    /* inline[API_FD26]: $003C $7188 */
    FarCallInline();
  }
LAB_M78_r3_24000__289b:
                    /* WARNING: Could not recover jumptable at 0x289b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M78_r3_24000__289d @ M78_r3_24000::289d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x28dc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__289d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_7090 != 1) {
    if ((DAT_604f & 0x12) == 0) {
      FUN_M78_r3_24000__28df();
      goto LAB_M78_r3_24000__28dc;
    }
  }
  if (DAT_7180 == 0) {
    FUN_M78_r3_24000__2b33();
  }
  else {
    FUN_M78_r3_24000__2849();
    DAT_7180 = 0;
    FUN_M78_r3_24000__2d0f();
                    /* inline[API_FD26]: $003C $7188 */
    FarCallInline();
  }
LAB_M78_r3_24000__28dc:
                    /* WARNING: Could not recover jumptable at 0x28dc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M78_r3_24000__28df @ M78_r3_24000::28df =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x29b2 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__28df(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_717e == 1) {
    API_FD20(0);
    API_FD2E(0);
    if (DAT_7180 == 1) {
      API_FD20(0);
      API_FD2E(0);
    }
    else {
      FUN_M78_r3_24000__2706();
      FUN_M78_r3_24000__2719();
      FUN_M78_r3_24000__2778();
      FUN_M78_r3_24000__278b();
      FUN_M78_r3_24000__2823();
    }
  }
  else if (DAT_7180 == 1) {
    FUN_M78_r3_24000__278b();
    FUN_M78_r3_24000__26e0();
    FUN_M78_r3_24000__26f3();
    FUN_M78_r3_24000__2752();
    FUN_M78_r3_24000__2765();
    FUN_M78_r3_24000__27ea();
  }
  else {
    FUN_M78_r3_24000__272c();
    FUN_M78_r3_24000__273f();
    FUN_M78_r3_24000__2752();
    FUN_M78_r3_24000__2778();
    FUN_M78_r3_24000__2765();
    FUN_M78_r3_24000__278b();
    FUN_M78_r3_24000__27ea();
    FUN_M78_r3_24000__2823();
    DAT_717a = 1;
    DAT_717c = 1;
    DAT_738d = 1;
    DAT_738f = 1;
    DAT_7254 = 1;
    DAT_7256 = 2;
  }
  DAT_7389 = 0;
  DAT_738b = 0;
  DAT_717e = 0;
  DAT_7180 = 0;
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  FUN_M78_r3_24000__2d0f();
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x2a);
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x2c);
  FUN_M78_r3_24000__2cf8();
                    /* WARNING: Could not recover jumptable at 0x29b2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M78_r3_24000__29b4 @ M78_r3_24000::29b4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x29e2 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__29b4(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M78_r3_24000__29e4();
  DAT_7389 = 0;
  DAT_717e = 0;
  DAT_717a = 1;
  DAT_738d = 1;
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  FUN_M78_r3_24000__2d0f();
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x2a);
  FUN_M78_r3_24000__2cf8();
                    /* WARNING: Could not recover jumptable at 0x29e2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M78_r3_24000__29e4 @ M78_r3_24000::29e4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2a80 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M78_r3_24000__29e4(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_7090 == 0) {
    FUN_M78_r3_24000__26e0();
    FUN_M78_r3_24000__26f3();
    FUN_M78_r3_24000__2752();
    FUN_M78_r3_24000__2765();
    FUN_M78_r3_24000__27ea();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70e6 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7058 >> 8));
    DAT_7254 = 1;
  }
  else {
    FUN_M78_r3_24000__27d7();
    FUN_M78_r3_24000__2849();
    FUN_M78_r3_24000__272c();
    FUN_M78_r3_24000__273f();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70e6 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7058 >> 8));
    FUN_M78_r3_24000__279e();
    FUN_M78_r3_24000__27b1();
    FUN_M78_r3_24000__27fd();
    DAT_7256 = 0;
    DAT_7254 = 3;
    if (DAT_717c == 1) {
      FUN_M78_r3_24000__2ca4();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x2a80. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M78_r3_24000__2a82 @ M78_r3_24000::2a82 =====

undefined2 __h3000 FUN_M78_r3_24000__2a82(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
                    /* inline[API_FD26]: $0014 $7188 */
  FarCallInline();
  sVar1 = API_FD3E();
  if (sVar1 == 1) {
    FUN_M78_r3_24000__2d2a();
    if ((extraout_CC >> 2 & 1) != 0) {
                    /* inline[API_FD26]: $000E $7188 */
      FarCallInline();
      if ((DAT_738d == 0) && (FUN_M78_r3_24000__2d39(), (extraout_CC_00 >> 2 & 1) == 0)) {
        return in_D;
      }
      if ((DAT_717c == 0) && (FUN_M78_r3_24000__2d54(), (extraout_CC_01 >> 2 & 1) != 0)) {
        FUN_M78_r3_24000__2b33();
      }
      if (DAT_738d != 0) {
        FUN_M78_r3_24000__2d48();
        if ((bool)(extraout_CC_02 >> 2 & 1)) {
          DAT_7389 = DAT_7389 + 1;
          if (DAT_7389 < 8 == (DAT_7389 == 8)) {
            DAT_717e = 1;
            LcdSetCursor();
                    /* inline[API_FC38]: "--looping---|" */
            LcdPrintInline();
          }
        }
        else {
          DAT_738d = 0;
          FUN_M78_r3_24000__2ce1();
          if (DAT_717e == 0) {
            FUN_M78_r3_24000__2810();
          }
        }
      }
    }
  }
  else {
    FUN_M78_r3_24000__2b0c();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2b0c @ M78_r3_24000::2b0c =====

undefined2 __h3000 FUN_M78_r3_24000__2b0c(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x26);
  DAT_717a = 0;
  DAT_717e = 0;
  FUN_M78_r3_24000__2d2a();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M78_r3_24000__2ce1();
                    /* inline[API_FD26]: $003C $7188 */
    FarCallInline();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2b33 @ M78_r3_24000::2b33 =====

undefined2 __h3000 FUN_M78_r3_24000__2b33(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__2b64();
  DAT_738b = 0;
  DAT_7180 = 0;
  DAT_717c = 1;
  DAT_738f = 1;
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  FUN_M78_r3_24000__2d0f();
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x2c);
  FUN_M78_r3_24000__2cf8();
  return in_D;
}


// ===== FUN_M78_r3_24000__2b64 @ M78_r3_24000::2b64 =====

undefined2 __h3000 FUN_M78_r3_24000__2b64(void)

{
  undefined2 in_D;
  
  if (DAT_7090 == 0) {
    FUN_M78_r3_24000__2706();
    FUN_M78_r3_24000__2719();
    FUN_M78_r3_24000__2778();
    FUN_M78_r3_24000__278b();
    FUN_M78_r3_24000__2823();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70ea >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7062 >> 8));
    DAT_7256 = 2;
  }
  else {
    FUN_M78_r3_24000__27b1();
    FUN_M78_r3_24000__2810();
    FUN_M78_r3_24000__272c();
    FUN_M78_r3_24000__273f();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70ea >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7062 >> 8));
    FUN_M78_r3_24000__27c4();
    FUN_M78_r3_24000__27d7();
    FUN_M78_r3_24000__2836();
    DAT_7254 = 0;
    DAT_7256 = 3;
    if (DAT_717a == 1) {
      FUN_M78_r3_24000__2b0c();
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2c03 @ M78_r3_24000::2c03 =====

undefined2 __h3000 FUN_M78_r3_24000__2c03(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
                    /* inline[API_FD26]: $0016 $7188 */
  FarCallInline();
  sVar1 = API_FD3E();
  if (sVar1 == 1) {
    FUN_M78_r3_24000__2d2a();
    if ((extraout_CC >> 2 & 1) != 0) {
      if (DAT_7090 == 0) {
                    /* inline[API_FD26]: $0010 $7188 */
        FarCallInline();
      }
      else {
                    /* inline[API_FD26]: $0034 $7188 */
        FarCallInline();
      }
      if ((DAT_738f == 0) && (FUN_M78_r3_24000__2d39(), (extraout_CC_00 >> 2 & 1) == 0)) {
        return in_D;
      }
      if ((DAT_717a == 0) && (FUN_M78_r3_24000__2d48(), (extraout_CC_01 >> 2 & 1) != 0)) {
        FUN_M78_r3_24000__29b4();
      }
      if (DAT_738f != 0) {
        FUN_M78_r3_24000__2d54();
        if ((bool)(extraout_CC_02 >> 2 & 1)) {
          DAT_738b = DAT_738b + 1;
          if (DAT_738b < 8 == (DAT_738b == 8)) {
            DAT_7180 = 1;
            LcdSetCursor();
                    /* inline[API_FC38]: "--looping---" */
            LcdPrintInline();
          }
        }
        else {
          DAT_738f = 0;
          FUN_M78_r3_24000__2ce1();
          if (DAT_7180 == 0) {
            FUN_M78_r3_24000__2849();
          }
        }
      }
    }
  }
  else {
    FUN_M78_r3_24000__2ca4();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2ca4 @ M78_r3_24000::2ca4 =====

undefined2 __h3000 FUN_M78_r3_24000__2ca4(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x26);
  DAT_717c = 0;
  DAT_7180 = 0;
  FUN_M78_r3_24000__2d2a();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M78_r3_24000__2ce1();
    LcdSetCursor();
                    /* inline[API_FC38]: "--stopped--" */
    LcdPrintInline();
                    /* inline[API_FD26]: $003C $7188 */
    FarCallInline();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2ce1 @ M78_r3_24000::2ce1 =====

undefined2 __h3000 FUN_M78_r3_24000__2ce1(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(0x28);
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr(0x28);
  return in_D;
}


// ===== FUN_M78_r3_24000__2cf8 @ M78_r3_24000::2cf8 =====

undefined2 __h3000 FUN_M78_r3_24000__2cf8(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $60E7 */
  ModuleStorePtr(0x26);
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr(0x26);
  return in_D;
}


// ===== FUN_M78_r3_24000__2d0f @ M78_r3_24000::2d0f =====

undefined2 __h3000 FUN_M78_r3_24000__2d0f(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x28);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x26);
  API_FC14();
  return in_D;
}


// ===== FUN_M78_r3_24000__2d2a @ M78_r3_24000::2d2a =====

undefined2 __h3000 FUN_M78_r3_24000__2d2a(void)

{
  undefined2 in_D;
  
  return in_D;
}


// ===== FUN_M78_r3_24000__2d39 @ M78_r3_24000::2d39 =====

undefined2 __h3000 FUN_M78_r3_24000__2d39(void)

{
  undefined2 in_D;
  
  return in_D;
}


// ===== FUN_M78_r3_24000__2d48 @ M78_r3_24000::2d48 =====

undefined2 __h3000 FUN_M78_r3_24000__2d48(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  return uStack_4;
}


// ===== FUN_M78_r3_24000__2d54 @ M78_r3_24000::2d54 =====

undefined2 __h3000 FUN_M78_r3_24000__2d54(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  return uStack_4;
}


// ===== MODULE_78_04_entry @ M78_r3_24000::2d68 =====

void __h3000 MODULE_78_04_entry(void)

{
  return;
}


// ===== FUN_M78_r3_24000__2d69 @ M78_r3_24000::2d69 =====

undefined2 __h3000 FUN_M78_r3_24000__2d69(void)

{
  undefined2 in_D;
  
  return in_D;
}


// ===== FUN_M78_r3_24000__2d78 @ M78_r3_24000::2d78 =====

undefined2 __h3000 FUN_M78_r3_24000__2d78(void)

{
  undefined2 in_D;
  
  DAT_7391 = 0;
  DAT_7393 = 0;
  return in_D;
}


// ===== FUN_M78_r3_24000__2d86 @ M78_r3_24000::2d86 =====

void __h3000 FUN_M78_r3_24000__2d86(void)

{
  return;
}


// ===== FUN_M78_r3_24000__2d87 @ M78_r3_24000::2d87 =====

undefined2 __h3000 FUN_M78_r3_24000__2d87(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__36d5();
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x2d);
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x2d);
  if (DAT_7391 == 0) {
    FUN_M78_r3_24000__2e2b();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "Select record destination:              " */
    LcdPrintInline();
                    /* inline[API_FE02]: "record 1" "record 2" [*] [*] */
    SoftKeyLabels4Inline();
    API_FDF2();
    if (DAT_7391 == 1) {
                    /* inline[API_FE00]: ->$2E2B ->$2E5D ->$2D86 ->$2D86 ->$312D ->$312D */
      SetModuleHandlers();
    }
    else {
                    /* inline[API_FE00]: ->$2E95 ->$2E5D ->$2D86 ->$2D86 ->$312D ->$312D */
      SetModuleHandlers();
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__2e2b @ M78_r3_24000::2e2b =====

undefined2 __h3000 FUN_M78_r3_24000__2e2b(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__36d5();
  DAT_7395 = 1;
  DAT_7397 = 0;
  DAT_7393 = 1;
  DAT_726c = 0;
  DAT_726e = 0;
  DAT_7270 = DAT_714e;
  DAT_7272 = DAT_7150;
  FUN_M78_r3_24000__2ecd();
  return in_D;
}


// ===== FUN_M78_r3_24000__2e5d @ M78_r3_24000::2e5d =====

undefined2 __h3000 FUN_M78_r3_24000__2e5d(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__36d5();
  DAT_7395 = 0;
  DAT_7397 = 1;
  DAT_7393 = 2;
  DAT_726c = DAT_70f0 + 0x23;
  DAT_726e = DAT_70f2;
  DAT_7270 = DAT_714e;
  DAT_7272 = DAT_7150;
  FUN_M78_r3_24000__2ecd();
  return in_D;
}


// ===== FUN_M78_r3_24000__2e95 @ M78_r3_24000::2e95 =====

undefined2 __h3000 FUN_M78_r3_24000__2e95(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__36d5();
  DAT_7395 = 1;
  DAT_7397 = 0;
  DAT_7393 = DAT_7391;
  DAT_726c = DAT_70ec;
  DAT_726e = DAT_70ee;
  DAT_7270 = DAT_70f0 + 0x22;
  DAT_7272 = DAT_70f2;
  FUN_M78_r3_24000__2ecd();
  return in_D;
}


// ===== FUN_M78_r3_24000__2ecd @ M78_r3_24000::2ecd =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M78_r3_24000__2ecd(void)

{
  undefined2 in_D;
  
  if (DAT_7090 == 0) {
    _DAT_7274 = DAT_726c;
    _DAT_7276 = DAT_726e;
    _DAT_7278 = DAT_7270;
    _DAT_727a = DAT_7272;
                    /* inline[API_FD26]: $0076 $7188 */
    FarCallInline();
    FUN_M78_r3_24000__0580();
  }
  else {
    _DAT_7274 = DAT_726c + DAT_7152;
    _DAT_7276 = DAT_726e;
    _DAT_7278 = DAT_7270 + DAT_7152;
    _DAT_727a = DAT_7272;
                    /* inline[API_FD26]: $0074 $7188 */
    FarCallInline();
    FUN_M78_r3_24000__05ab();
  }
                    /* inline[API_FD26]: $0014 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__1a2a();
  LcdSetCursor();
                    /* inline[API_FC38]: "       set trigger|                     " */
  LcdPrintInline();
  FUN_M78_r3_24000__1e35();
                    /* inline[API_FD26]: $002E $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $0030 $7188 */
  FarCallInline();
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x32);
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x2d);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x2d);
  return in_D;
}


// ===== FUN_M78_r3_24000__2f98 @ M78_r3_24000::2f98 =====

undefined2 __h3000 FUN_M78_r3_24000__2f98(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "       -rec ready-|                     " */
  LcdPrintInline();
  FUN_M78_r3_24000__1e35();
  API_FD20(0);
  API_FD2E(0xff);
  return in_D;
}


// ===== FUN_M78_r3_24000__2fe5 @ M78_r3_24000::2fe5 =====

undefined2 __h3000 FUN_M78_r3_24000__2fe5(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "       -rec ready-|                     " */
  LcdPrintInline();
  FUN_M78_r3_24000__1e35();
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3032 @ M78_r3_24000::3032 =====

undefined2 __h3000 FUN_M78_r3_24000__3032(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__305b @ M78_r3_24000::305b =====

undefined2 __h3000 FUN_M78_r3_24000__305b(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3084 @ M78_r3_24000::3084 =====

undefined2 __h3000 FUN_M78_r3_24000__3084(void)

{
  undefined2 in_D;
  
  API_FD20(0x15);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__30b4 @ M78_r3_24000::30b4 =====

undefined2 __h3000 FUN_M78_r3_24000__30b4(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  FUN_M78_r3_24000__2d69();
  if ((bool)(extraout_CC >> 2 & 1)) {
    FUN_M78_r3_24000__30ea();
  }
  else {
    DAT_73ab = DAT_603a;
                    /* inline[API_FC62]: $603A */
    ModuleStorePtr(0x30);
  }
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x33);
  FUN_M78_r3_24000__34e8();
  return in_D;
}


// ===== FUN_M78_r3_24000__30de @ M78_r3_24000::30de =====

undefined2 __h3000 FUN_M78_r3_24000__30de(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  (*DAT_73ab)();
  FUN_M78_r3_24000__30ea();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__30ea @ M78_r3_24000::30ea =====

undefined2 __h3000 FUN_M78_r3_24000__30ea(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $0014 $7188 */
  FarCallInline();
  LcdSetCursor(extraout_A,0);
                    /* inline[API_FC38]: "       -recording-|                     " */
  LcdPrintInline();
  FUN_M78_r3_24000__05d6();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__312d @ M78_r3_24000::312d =====

undefined2 __h3000 FUN_M78_r3_24000__312d(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x2d);
  API_FD20(0);
  API_FD2E(0);
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  FUN_M78_r3_24000__0547();
  FUN_M78_r3_24000__2d0f();
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  FUN_M78_r3_24000__36f4();
  return in_D;
}


// ===== FUN_M78_r3_24000__316e @ M78_r3_24000::316e =====

undefined2 __h3000 FUN_M78_r3_24000__316e(void)

{
  undefined2 in_D;
  short sVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  
  FUN_M78_r3_24000__2d69();
  if ((bool)(extraout_CC >> 2 & 1)) {
    LcdSetCursor();
                    /* inline[API_FC38]: "--stopped--|                     " */
    LcdPrintInline();
    FUN_M78_r3_24000__0547();
    FUN_M78_r3_24000__2d0f();
  }
  else {
    DAT_73ab = DAT_603a;
                    /* inline[API_FC62]: $603A */
    ModuleStorePtr(0x32);
  }
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x2d);
                    /* inline[API_FC62]: $7252 */
  ModuleStorePtr(0x33);
                    /* inline[API_FD26]: $0018 $7188 */
  FarCallInline();
  DAT_7270 = API_FD3A();
  DAT_7272 = API_FD3E();
  FUN_M78_r3_24000__3553();
  sVar1 = DAT_7270 + -0x22;
  if (DAT_7270 < 0x22) {
    sVar1 = 0;
  }
  if (DAT_7395 != 0) {
    DAT_70ec = DAT_726c;
    DAT_70ee = DAT_726e;
    DAT_70f2 = DAT_7272;
    DAT_70f0 = sVar1;
  }
  if (DAT_7397 != 0) {
    DAT_70f4 = DAT_726c;
    DAT_70f6 = DAT_726e;
    DAT_70fa = DAT_7272;
    DAT_70f8 = sVar1;
  }
  DAT_7270 = sVar1;
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  FUN_M78_r3_24000__3694();
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__1130();
  FUN_M78_r3_24000__12d0();
  DAT_7391 = DAT_7393;
  FUN_M78_r3_24000__36f4();
  FUN_M78_r3_24000__2d69();
  if ((extraout_CC_00 >> 2 & 1) != 0) {
                    /* inline[API_FD26]: $003C $7188 */
    FarCallInline();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3263 @ M78_r3_24000::3263 =====

undefined2 __h3000 FUN_M78_r3_24000__3263(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  (*DAT_73ab)();
  FUN_M78_r3_24000__326f();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__326f @ M78_r3_24000::326f =====

undefined2 __h3000 FUN_M78_r3_24000__326f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,7);
                    /* inline[API_FC38]: "--stopped--|                     " */
  LcdPrintInline();
  FUN_M78_r3_24000__0547();
  FUN_M78_r3_24000__2d0f();
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__32ae @ M78_r3_24000::32ae =====

undefined2 __h3000 FUN_M78_r3_24000__32ae(void)

{
  undefined2 in_D;
  short sVar1;
  ushort uVar2;
  undefined2 uVar3;
  byte extraout_CC;
  short in_U;
  undefined1 *puVar4;
  
                    /* inline[API_FD26]: $0014 $7188 */
  FarCallInline();
  sVar1 = API_FD3E();
  if (sVar1 == 3) {
    FUN_M78_r3_24000__30b4();
  }
  else {
    FUN_M78_r3_24000__2d69();
    if ((extraout_CC >> 2 & 1) != 0) {
                    /* inline[API_FD26]: $0014 $7188 */
      FarCallInline();
      DAT_73a7 = API_FD3A();
      if (DAT_7090 != 0) {
                    /* inline[API_FD26]: $0016 $7188 */
        FarCallInline();
        uVar2 = API_FD3A();
        if (uVar2 < DAT_73a7 == (uVar2 == DAT_73a7)) {
          DAT_73a7 = uVar2;
        }
      }
      uVar2 = DAT_73a7;
      *(char *)(in_U + -1) = (char)DAT_73a7;
      puVar4 = (undefined1 *)(in_U + -2);
      *puVar4 = (char)(uVar2 >> 8);
                    /* inline[API_FD26]: $0028 $7188 */
      FarCallInline();
      puVar4[1] = puVar4[1];
      *puVar4 = *puVar4;
                    /* inline[API_FD26]: $001E $7188 */
      uVar3 = FarCallInline();
      puVar4[-1] = (char)uVar3;
      puVar4 = puVar4 + -2;
      *puVar4 = (char)((ushort)uVar3 >> 8);
                    /* inline[API_FD26]: $0020 $7188 */
      FarCallInline();
                    /* inline[API_FD26]: $0022 $7188 */
      FarCallInline();
      uVar3 = DAT_70c8;
      puVar4[-1] = (char)DAT_70c8;
      puVar4[-2] = (char)((ushort)uVar3 >> 8);
                    /* inline[API_FD26]: $0024 $7188 */
      FarCallInline();
                    /* inline[API_FD26]: $0026 $7188 */
      FarCallInline();
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__333e @ M78_r3_24000::333e =====

undefined2 __h3000 FUN_M78_r3_24000__333e(void)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte extraout_CC;
  short in_U;
  undefined1 *puVar3;
  
                    /* inline[API_FD26]: $0014 $7188 */
  FarCallInline();
  sVar1 = API_FD3E();
  if (sVar1 == 3) {
    FUN_M78_r3_24000__2d69();
    if ((extraout_CC >> 2 & 1) != 0) {
      uVar2 = API_FD3A();
      *(char *)(in_U + -1) = (char)uVar2;
      puVar3 = (undefined1 *)(in_U + -2);
      *puVar3 = (char)((ushort)uVar2 >> 8);
                    /* inline[API_FD26]: $0028 $7188 */
      FarCallInline();
      puVar3[1] = puVar3[1];
      *puVar3 = *puVar3;
                    /* inline[API_FD26]: $001E $7188 */
      uVar2 = FarCallInline();
      puVar3[-1] = (char)uVar2;
      puVar3[-2] = (char)((ushort)uVar2 >> 8);
                    /* inline[API_FD26]: $0020 $7188 */
      FarCallInline();
                    /* inline[API_FD26]: $0022 $7188 */
      FarCallInline();
                    /* inline[API_FD26]: $0026 $7188 */
      FarCallInline();
                    /* inline[API_FD26]: $000E $7188 */
      FarCallInline();
    }
  }
  else {
    FUN_M78_r3_24000__316e();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__339b @ M78_r3_24000::339b =====

undefined2 __h3000 FUN_M78_r3_24000__339b(void)

{
  byte bVar1;
  undefined2 in_D;
  undefined2 uVar2;
  short sVar3;
  
  if (DAT_7182 == 1) {
    uVar2 = API_FD4A();
    DAT_73a7._0_1_ = (byte)((ushort)uVar2 >> 8);
    bVar1 = DAT_73a7._0_1_ & 0x40;
    sVar3 = (ushort)bVar1 * 0x100;
    DAT_73a7 = uVar2;
    if ((bVar1 == 0) && (DAT_7182 = sVar3, DAT_7184 == 2)) {
      DAT_7184 = 1;
      FUN_M78_r3_24000__35b2();
    }
    FUN_M78_r3_24000__3418();
  }
  else if (DAT_7184 == 1) {
    uVar2 = API_FD4A();
    DAT_73a7._0_1_ = (byte)((ushort)uVar2 >> 8);
    bVar1 = DAT_73a7._0_1_ & 0x40;
    sVar3 = (ushort)bVar1 * 0x100;
    DAT_73a7 = uVar2;
    if ((bVar1 == 0) && (DAT_7184 = sVar3, DAT_7182 == 2)) {
      DAT_7182 = 1;
      FUN_M78_r3_24000__35b2();
    }
    FUN_M78_r3_24000__3480();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3418 @ M78_r3_24000::3418 =====

undefined2 __h3000 FUN_M78_r3_24000__3418(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  FUN_M78_r3_24000__2d2a();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_7399 = DAT_7399 + 1;
    if ((DAT_7399 == 0x19) || (DAT_7182 == 0)) {
                    /* inline[API_FD26]: $003C $7188 */
      FarCallInline();
    }
    else if (DAT_7399 == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "-analyzing--" */
      LcdPrintInline();
    }
    else if (DAT_7399 < 0x32 == (DAT_7399 == 0x32)) {
      DAT_7399 = 0;
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3480 @ M78_r3_24000::3480 =====

undefined2 __h3000 FUN_M78_r3_24000__3480(void)

{
  undefined2 in_D;
  byte extraout_CC;
  
  FUN_M78_r3_24000__2d2a();
  if ((extraout_CC >> 2 & 1) != 0) {
    DAT_7399 = DAT_7399 + 1;
    if ((DAT_7399 == 0x19) || (DAT_7184 == 0)) {
                    /* inline[API_FD26]: $003C $7188 */
      FarCallInline();
    }
    else if (DAT_7399 == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "-analyzing--" */
      LcdPrintInline();
    }
    else if (DAT_7399 < 0x32 == (DAT_7399 == 0x32)) {
      DAT_7399 = 0;
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__34e8 @ M78_r3_24000::34e8 =====

undefined2 __h3000 FUN_M78_r3_24000__34e8(void)

{
  undefined2 in_D;
  
  if (DAT_7395 == 1) {
    if (DAT_7184 == 1) {
      FUN_M78_r3_24000__3639();
      DAT_7182 = 2;
    }
    else {
      FUN_M78_r3_24000__35e1();
      FUN_M78_r3_24000__35f8();
      FUN_M78_r3_24000__3677();
      DAT_7182 = 1;
    }
  }
  else if (DAT_7397 == 1) {
    if (DAT_7182 == 1) {
      FUN_M78_r3_24000__3639();
      DAT_7184 = 2;
    }
    else {
      FUN_M78_r3_24000__35e1();
      FUN_M78_r3_24000__35f8();
      FUN_M78_r3_24000__3677();
      DAT_7184 = 1;
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3553 @ M78_r3_24000::3553 =====

undefined2 __h3000 FUN_M78_r3_24000__3553(void)

{
  undefined2 in_D;
  
  if (DAT_7395 == 1) {
    if (DAT_7184 == 1) {
      FUN_M78_r3_24000__3639();
      DAT_7182 = 2;
    }
    else {
      FUN_M78_r3_24000__35f8();
      DAT_7182 = 1;
    }
  }
  else if (DAT_7397 == 1) {
    if (DAT_7182 == 1) {
      FUN_M78_r3_24000__3639();
      DAT_7184 = 2;
    }
    else {
      FUN_M78_r3_24000__35f8();
      DAT_7184 = 1;
    }
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__35b2 @ M78_r3_24000::35b2 =====

undefined2 __h3000 FUN_M78_r3_24000__35b2(void)

{
  undefined2 in_D;
  
  DAT_7162 = DAT_739b;
  DAT_7164 = DAT_739d;
  DAT_7166 = DAT_739f;
  DAT_7168 = DAT_73a1;
  DAT_716a = DAT_73a3;
  DAT_716c = DAT_73a5;
  FUN_M78_r3_24000__35f8();
  FUN_M78_r3_24000__3677();
  return in_D;
}


// ===== FUN_M78_r3_24000__35e1 @ M78_r3_24000::35e1 =====

undefined2 __h3000 FUN_M78_r3_24000__35e1(void)

{
  undefined2 in_D;
  
  DAT_7160 = 1;
  FUN_M78_r3_24000__1e59();
  DAT_7160 = 0;
  FUN_M78_r3_24000__1e59();
  return in_D;
}


// ===== FUN_M78_r3_24000__35f8 @ M78_r3_24000::35f8 =====

undefined2 __h3000 FUN_M78_r3_24000__35f8(void)

{
  undefined2 in_D;
  
  DAT_7162 = (ushort)(DAT_726c._0_1_ >> 1);
  DAT_7164 = CONCAT11((char)DAT_726c >> 1 | DAT_726c._0_1_ << 7,
                      DAT_726e._0_1_ >> 1 | (char)DAT_726c << 7);
  DAT_7166 = (ushort)(DAT_7270._0_1_ >> 1);
  DAT_7168 = CONCAT11((char)DAT_7270 >> 1 | DAT_7270._0_1_ << 7,
                      DAT_7272._0_1_ >> 1 | (char)DAT_7270 << 7);
  DAT_716a = (ushort)(DAT_7152._0_1_ >> 1);
  DAT_716c = CONCAT11((char)DAT_7152 >> 1 | DAT_7152._0_1_ << 7,DAT_7154 >> 1 | (char)DAT_7152 << 7)
  ;
  FUN_M78_r3_24000__1e59();
  return in_D;
}


// ===== FUN_M78_r3_24000__3639 @ M78_r3_24000::3639 =====

undefined2 __h3000 FUN_M78_r3_24000__3639(void)

{
  undefined2 in_D;
  
  DAT_739b = (ushort)(DAT_726c._0_1_ >> 1);
  DAT_739d = CONCAT11((char)DAT_726c >> 1 | DAT_726c._0_1_ << 7,
                      DAT_726e._0_1_ >> 1 | (char)DAT_726c << 7);
  DAT_739f = (ushort)(DAT_7270._0_1_ >> 1);
  DAT_73a1 = CONCAT11((char)DAT_7270 >> 1 | DAT_7270._0_1_ << 7,
                      DAT_7272._0_1_ >> 1 | (char)DAT_7270 << 7);
  DAT_73a3 = (ushort)(DAT_7152._0_1_ >> 1);
  DAT_73a5 = CONCAT11((char)DAT_7152 >> 1 | DAT_7152._0_1_ << 7,DAT_7154 >> 1 | (char)DAT_7152 << 7)
  ;
  return in_D;
}


// ===== FUN_M78_r3_24000__3677 @ M78_r3_24000::3677 =====

undefined2 __h3000 FUN_M78_r3_24000__3677(void)

{
  undefined2 in_D;
  
  DAT_7160 = 0;
  DAT_715e = 1;
  FUN_M78_r3_24000__1e59();
  DAT_715e = 0;
  FUN_M78_r3_24000__1e59();
  return in_D;
}


// ===== FUN_M78_r3_24000__3694 @ M78_r3_24000::3694 =====

undefined2 __h3000 FUN_M78_r3_24000__3694(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $0036 $7188 */
  FarCallInline(param_1,param_2,&DAT_70ec,&DAT_7068);
                    /* inline[API_FD26]: $0036 $7188 */
  FarCallInline(extraout_A,extraout_B,&DAT_70f0,&DAT_7070);
                    /* inline[API_FD26]: $0036 $7188 */
  FarCallInline(extraout_A_00,extraout_B_00,&DAT_70f4,&DAT_7078);
                    /* inline[API_FD26]: $0036 $7188 */
  FarCallInline(extraout_A_01,extraout_B_01,&DAT_70f8,&DAT_7080);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__36d5 @ M78_r3_24000::36d5 =====

undefined2 __h3000 FUN_M78_r3_24000__36d5(void)

{
  undefined2 in_D;
  
  DAT_7148 = 0;
  DAT_717a = 0;
  DAT_717c = 0;
  DAT_717e = 0;
  DAT_7180 = 0;
                    /* inline[API_FD26]: $0078 $7188 */
  FarCallInline();
  return in_D;
}


// ===== FUN_M78_r3_24000__36f4 @ M78_r3_24000::36f4 =====

undefined2 __h3000 FUN_M78_r3_24000__36f4(void)

{
  undefined2 in_D;
  
  DAT_7148 = 1;
  FUN_M78_r3_24000__1492();
  return in_D;
}


// ===== MODULE_78_05_entry @ M78_r3_24000::370a =====

void __h3000 MODULE_78_05_entry(void)

{
  return;
}


// ===== FUN_M78_r3_24000__370c @ M78_r3_24000::370c =====

undefined2 __h3000 FUN_M78_r3_24000__370c(void)

{
  undefined2 in_D;
  
  return in_D;
}


// ===== FUN_M78_r3_24000__3724 @ M78_r3_24000::3724 =====

undefined2 __h3000 FUN_M78_r3_24000__3724(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  return uStack_2;
}


// ===== FUN_M78_r3_24000__3729 @ M78_r3_24000::3729 =====

undefined2 __h3000 FUN_M78_r3_24000__3729(void)

{
  undefined2 in_D;
  
  if (DAT_717e == 1) {
    FUN_M78_r3_24000__3741();
  }
  else {
    FUN_M78_r3_24000__37cd();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3741 @ M78_r3_24000::3741 =====

undefined2 __h3000 FUN_M78_r3_24000__3741(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__376f();
  LcdSetCursor(extraout_A,0xc);
                    /* inline[API_FC38]: "1" */
  LcdPrintInline();
                    /* inline[API_FE00]: ->$09A6 ->$0B14 ->$370A ->$370A ->$37C1 ->$37C1 */
  SetModuleHandlers();
  FUN_M78_r3_24000__0b14();
  FUN_M78_r3_24000__09a6();
  API_FDE8();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__376f @ M78_r3_24000::376f =====

undefined2 __h3000 FUN_M78_r3_24000__376f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,0);
                    /* inline[API_FC38]: "edit sample 1 - start:       stop:      " */
  LcdPrintInline();
                    /* inline[API_FE02]: " start  " "  stop  " [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__37c1 @ M78_r3_24000::37c1 =====

void __h3000 FUN_M78_r3_24000__37c1(void)

{
  FUN_M78_r3_24000__0547();
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  return;
}


// ===== FUN_M78_r3_24000__37cd @ M78_r3_24000::37cd =====

undefined2 __h3000 FUN_M78_r3_24000__37cd(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__3810();
  LcdSetCursor();
                    /* inline[API_FC38]: "1" */
  LcdPrintInline();
                    /* inline[API_FE00]: ->$3949 ->$3B99 ->$3C33 ->$370A ->$3C64 ->$3C64 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $6044 */
  ModuleStorePtr(0x38);
                    /* inline[API_FC62]: $605C */
  ModuleStorePtr(0x38);
  FUN_M78_r3_24000__3d43();
  FUN_M78_r3_24000__3d67();
  FUN_M78_r3_24000__3954();
  API_FDE8();
  return in_D;
}


// ===== FUN_M78_r3_24000__3810 @ M78_r3_24000::3810 =====

undefined2 __h3000 FUN_M78_r3_24000__3810(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__376f();
                    /* inline[API_FE02]: [-] [-] "--play--" [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_70e0 = 0;
  DAT_70dc = 0;
  DAT_70de = 0;
  DAT_73ad = 0;
  FUN_M78_r3_24000__36d5();
                    /* inline[API_FD26]: $0032 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__1d95();
  return in_D;
}


// ===== FUN_M78_r3_24000__3848 @ M78_r3_24000::3848 =====

undefined2 __h3000 FUN_M78_r3_24000__3848(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__3810();
  LcdSetCursor();
                    /* inline[API_FC38]: "2" */
  LcdPrintInline();
                    /* inline[API_FE00]: ->$3996 ->$3BE6 ->$3CB7 ->$370A ->$3CE8 ->$3CE8 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $6044 */
  ModuleStorePtr(0x38);
                    /* inline[API_FC62]: $605C */
  ModuleStorePtr(0x38);
  FUN_M78_r3_24000__3d55();
  FUN_M78_r3_24000__3d79();
  FUN_M78_r3_24000__39a1();
  API_FDE8();
  return in_D;
}


// ===== FUN_M78_r3_24000__388b @ M78_r3_24000::388b =====

undefined2 __h3000 FUN_M78_r3_24000__388b(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x37);
  (*DAT_73af)();
  (*DAT_6044)((char)((ushort)in_D >> 8));
                    /* inline[API_FC62]: $605C */
  ModuleStorePtr(0x38);
  return in_D;
}


// ===== FUN_M78_r3_24000__38ae @ M78_r3_24000::38ae =====

undefined2 __h3000 FUN_M78_r3_24000__38ae(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x37);
  (*DAT_73af)();
  (*DAT_6044)((char)((ushort)in_D >> 8));
                    /* inline[API_FC62]: $605C */
  ModuleStorePtr(0x38);
  return in_D;
}


// ===== FUN_M78_r3_24000__38d1 @ M78_r3_24000::38d1 =====

undefined2 __h3000 FUN_M78_r3_24000__38d1(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__1d95();
  (*DAT_73b1)();
  (*DAT_605c)();
                    /* inline[API_FC62]: $6044 */
  ModuleStorePtr(0x38);
  return in_D;
}


// ===== FUN_M78_r3_24000__38ea @ M78_r3_24000::38ea =====

undefined2 __h3000 FUN_M78_r3_24000__38ea(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__1d95();
  (*DAT_73b1)();
  (*DAT_605c)();
                    /* inline[API_FC62]: $6044 */
  ModuleStorePtr(0x38);
  return in_D;
}


// ===== FUN_M78_r3_24000__3903 @ M78_r3_24000::3903 =====

undefined2 __h3000 FUN_M78_r3_24000__3903(void)

{
  undefined2 in_D;
  
  if (DAT_7180 == 1) {
    FUN_M78_r3_24000__391b();
  }
  else {
    FUN_M78_r3_24000__3848();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__391b @ M78_r3_24000::391b =====

undefined2 __h3000 FUN_M78_r3_24000__391b(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__376f();
  LcdSetCursor(extraout_A,0xc);
                    /* inline[API_FC38]: "2" */
  LcdPrintInline();
                    /* inline[API_FE00]: ->$0A5D ->$0BCB ->$370A ->$370A ->$37C1 ->$37C1 */
  SetModuleHandlers();
  FUN_M78_r3_24000__0bcb();
  FUN_M78_r3_24000__0a5d();
  API_FDE8();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3949 @ M78_r3_24000::3949 =====

void __h3000 FUN_M78_r3_24000__3949(void)

{
  FUN_M78_r3_24000__37cd();
  API_FDE8();
  FUN_M78_r3_24000__3954();
  return;
}


// ===== FUN_M78_r3_24000__3954 @ M78_r3_24000::3954 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__3954(void)

{
  undefined2 in_D;
  
  DAT_73b9 = 1;
  FUN_M78_r3_24000__36d5();
                    /* inline[API_FC62]: $73AF */
  ModuleStorePtr(9);
                    /* inline[API_FC62]: $73B1 */
  ModuleStorePtr(0x39);
  if (DAT_7090 == 0) {
    FUN_M78_r3_24000__3e0c(0,0,&DAT_70ec);
  }
  else {
    FUN_M78_r3_24000__3d8b((char)((ushort)DAT_7090 >> 8),(char)DAT_7090,&DAT_70ec);
  }
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x39);
  return in_D;
}


// ===== FUN_M78_r3_24000__3996 @ M78_r3_24000::3996 =====

void __h3000 FUN_M78_r3_24000__3996(void)

{
  FUN_M78_r3_24000__3848();
  API_FDE8();
  FUN_M78_r3_24000__39a1();
  return;
}


// ===== FUN_M78_r3_24000__39a1 @ M78_r3_24000::39a1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__39a1(void)

{
  undefined2 in_D;
  
  DAT_73bb = 1;
  FUN_M78_r3_24000__36d5();
                    /* inline[API_FC62]: $73AF */
  ModuleStorePtr(10);
                    /* inline[API_FC62]: $73B1 */
  ModuleStorePtr(0x39);
  if (DAT_7090 == 0) {
    FUN_M78_r3_24000__3e75(0,0,&DAT_70f4);
  }
  else {
    FUN_M78_r3_24000__3d8b((char)((ushort)DAT_7090 >> 8),(char)DAT_7090,&DAT_70f4);
  }
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x3a);
  return in_D;
}


// ===== FUN_M78_r3_24000__39e3 @ M78_r3_24000::39e3 =====

undefined2 __h3000 FUN_M78_r3_24000__39e3(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  short in_U;
  undefined2 *puVar2;
  
                    /* inline[API_FD26]: $0018 $7188 */
  FarCallInline();
  DAT_70ec = API_FD3A();
  DAT_70ee = API_FD3E();
  uVar1 = DAT_70e0;
  *(char *)(in_U + -1) = (char)DAT_70e0;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $002C $7188 */
  FarCallInline();
  DAT_73ad = *puVar2;
  if (DAT_7090 == 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  FUN_M78_r3_24000__370c();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M78_r3_24000__3d43();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3a49 @ M78_r3_24000::3a49 =====

undefined2 __h3000 FUN_M78_r3_24000__3a49(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_70e0;
  *(char *)(in_U + -1) = (char)DAT_70e0;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $002C $7188 */
  FarCallInline();
  DAT_73ad = *puVar2;
  if (DAT_7090 == 0) {
                    /* inline[API_FD26]: $001A $7188 */
    FarCallInline();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  else {
                    /* inline[API_FD26]: $0018 $7188 */
    FarCallInline();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  DAT_70f4 = API_FD3A();
  DAT_70f6 = API_FD3E();
  FUN_M78_r3_24000__370c();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M78_r3_24000__3d55();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3ab7 @ M78_r3_24000::3ab7 =====

undefined2 __h3000 FUN_M78_r3_24000__3ab7(void)

{
  undefined2 uVar1;
  byte extraout_A;
  undefined2 in_D;
  byte extraout_CC;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_70e0;
  *(char *)(in_U + -1) = (char)DAT_70e0;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $002C $7188 */
  FarCallInline();
  DAT_73ad = *puVar2;
  if (DAT_7090 == 0) {
                    /* inline[API_FD26]: $0018 $7188 */
    FarCallInline();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  else {
                    /* inline[API_FD26]: $0018 $7188 */
    FarCallInline();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  DAT_70f0 = API_FD3A();
  API_FD3E();
  DAT_70f2 = (ushort)(extraout_A & 0xfe) << 8;
  FUN_M78_r3_24000__370c();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M78_r3_24000__3d67();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3b28 @ M78_r3_24000::3b28 =====

undefined2 __h3000 FUN_M78_r3_24000__3b28(void)

{
  undefined2 uVar1;
  byte extraout_A;
  undefined2 in_D;
  byte extraout_CC;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_70e0;
  *(char *)(in_U + -1) = (char)DAT_70e0;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
                    /* inline[API_FD26]: $002C $7188 */
  FarCallInline();
  DAT_73ad = *puVar2;
  if (DAT_7090 == 0) {
                    /* inline[API_FD26]: $001A $7188 */
    FarCallInline();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  else {
                    /* inline[API_FD26]: $0018 $7188 */
    FarCallInline();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_73ad >> 8));
  }
  DAT_70f8 = API_FD3A();
  API_FD3E();
  DAT_70fa = (ushort)(extraout_A & 0xfe) << 8;
  FUN_M78_r3_24000__370c();
  if ((extraout_CC >> 2 & 1) != 0) {
    FUN_M78_r3_24000__3d79();
  }
  return in_D;
}


// ===== FUN_M78_r3_24000__3b99 @ M78_r3_24000::3b99 =====

void __h3000 FUN_M78_r3_24000__3b99(void)

{
  FUN_M78_r3_24000__37cd();
  API_FDEA();
  FUN_M78_r3_24000__3ba4();
  return;
}


// ===== FUN_M78_r3_24000__3ba4 @ M78_r3_24000::3ba4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__3ba4(void)

{
  undefined2 in_D;
  
  DAT_73b9 = 1;
  FUN_M78_r3_24000__36d5();
                    /* inline[API_FC62]: $73AF */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $73B1 */
  ModuleStorePtr(0x3b);
  if (DAT_7090 == 0) {
    FUN_M78_r3_24000__3e0c(0,0,&DAT_70f0);
  }
  else {
    FUN_M78_r3_24000__3d8b((char)((ushort)DAT_7090 >> 8),(char)DAT_7090,&DAT_70f0);
  }
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x3a);
  return in_D;
}


// ===== FUN_M78_r3_24000__3be6 @ M78_r3_24000::3be6 =====

void __h3000 FUN_M78_r3_24000__3be6(void)

{
  FUN_M78_r3_24000__3848();
  API_FDEA();
  FUN_M78_r3_24000__3bf1();
  return;
}


// ===== FUN_M78_r3_24000__3bf1 @ M78_r3_24000::3bf1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M78_r3_24000__3bf1(void)

{
  undefined2 in_D;
  
  DAT_73bb = 1;
  FUN_M78_r3_24000__36d5();
                    /* inline[API_FC62]: $73AF */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $73B1 */
  ModuleStorePtr(0x3b);
  if (DAT_7090 == 0) {
    FUN_M78_r3_24000__3e75(0,0,&DAT_70f8);
  }
  else {
    FUN_M78_r3_24000__3d8b((char)((ushort)DAT_7090 >> 8),(char)DAT_7090,&DAT_70f8);
  }
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x3b);
  return in_D;
}


// ===== FUN_M78_r3_24000__3c33 @ M78_r3_24000::3c33 =====

undefined2 __h3000 FUN_M78_r3_24000__3c33(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__3c50();
  FUN_M78_r3_24000__29e4();
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3c50 @ M78_r3_24000::3c50 =====

undefined2 __h3000 FUN_M78_r3_24000__3c50(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__3c7a();
  FUN_M78_r3_24000__36f4();
                    /* inline[API_FC62]: $605C */
  ModuleStorePtr(0x38);
  return in_D;
}


// ===== FUN_M78_r3_24000__3c64 @ M78_r3_24000::3c64 =====

undefined2 __h3000 FUN_M78_r3_24000__3c64(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__3c7a();
  FUN_M78_r3_24000__36f4();
  FUN_M78_r3_24000__05fa();
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3c7a @ M78_r3_24000::3c7a =====

undefined2 __h3000 FUN_M78_r3_24000__3c7a(void)

{
  undefined2 in_D;
  
  DAT_73b9 = 0;
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(0x37);
  API_FD20(0);
  API_FD2E(0);
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
  FUN_M78_r3_24000__3694();
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__1130();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__12d0();
  return in_D;
}


// ===== FUN_M78_r3_24000__3cb7 @ M78_r3_24000::3cb7 =====

undefined2 __h3000 FUN_M78_r3_24000__3cb7(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__3cd4();
  FUN_M78_r3_24000__2b64();
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3cd4 @ M78_r3_24000::3cd4 =====

undefined2 __h3000 FUN_M78_r3_24000__3cd4(void)

{
  undefined2 in_D;
  
  FUN_M78_r3_24000__3cfe();
  FUN_M78_r3_24000__36f4();
                    /* inline[API_FC62]: $605C */
  ModuleStorePtr(0x38);
  return in_D;
}


// ===== FUN_M78_r3_24000__3ce8 @ M78_r3_24000::3ce8 =====

undefined2 __h3000 FUN_M78_r3_24000__3ce8(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M78_r3_24000__3cfe();
  FUN_M78_r3_24000__36f4();
  FUN_M78_r3_24000__05fa();
                    /* inline[API_FD26]: $003C $7188 */
  FarCallInline();
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3cfe @ M78_r3_24000::3cfe =====

undefined2 __h3000 FUN_M78_r3_24000__3cfe(void)

{
  undefined2 in_D;
  
  DAT_73bb = 0;
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0x37);
  API_FD20(0);
  API_FD2E(0);
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  FUN_M78_r3_24000__3694();
  FUN_M78_r3_24000__0d46();
  FUN_M78_r3_24000__1130();
  FUN_M78_r3_24000__0f73();
  FUN_M78_r3_24000__12d0();
  return in_D;
}


// ===== FUN_M78_r3_24000__3d43 @ M78_r3_24000::3d43 =====

undefined2 __h3000 FUN_M78_r3_24000__3d43(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $000C $7188 */
  FarCallInline(param_1,0x16,&DAT_70ec);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3d55 @ M78_r3_24000::3d55 =====

undefined2 __h3000 FUN_M78_r3_24000__3d55(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $000C $7188 */
  FarCallInline(param_1,0x16,&DAT_70f4);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3d67 @ M78_r3_24000::3d67 =====

undefined2 __h3000 FUN_M78_r3_24000__3d67(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $000C $7188 */
  FarCallInline(param_1,0x22,&DAT_70f0);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3d79 @ M78_r3_24000::3d79 =====

undefined2 __h3000 FUN_M78_r3_24000__3d79(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FD26]: $000C $7188 */
  FarCallInline(param_1,0x22,&DAT_70f8);
  return uStack_8;
}


// ===== FUN_M78_r3_24000__3d8b @ M78_r3_24000::3d8b =====

undefined2 __h3000 FUN_M78_r3_24000__3d8b(short *param_1)

{
  undefined2 in_D;
  
  DAT_73b3 = *param_1;
  DAT_73b5 = DAT_73b3 + DAT_7152;
  DAT_73b7 = param_1[1];
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b3 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b5 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b7 >> 8));
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3e0c @ M78_r3_24000::3e0c =====

undefined2 __h3000 FUN_M78_r3_24000__3e0c(undefined2 *param_1)

{
  undefined2 in_D;
  
  DAT_73b3 = *param_1;
  DAT_73b5 = param_1[1];
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b3 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b5 >> 8));
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3e75 @ M78_r3_24000::3e75 =====

undefined2 __h3000 FUN_M78_r3_24000__3e75(undefined2 *param_1)

{
  undefined2 in_D;
  
  DAT_73b3 = *param_1;
  DAT_73b5 = param_1[1];
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b3 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_73b5 >> 8));
  API_FD20(0);
  API_FD2E(0);
  return in_D;
}


// ===== FUN_M78_r3_24000__3ede @ M78_r3_24000::3ede =====

undefined2 __h3000 FUN_M78_r3_24000__3ede(void)

{
  undefined2 in_D;
  short sVar1;
  
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_714a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_714c >> 8));
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  API_FD2E(0);
  LcdSetCursor();
                    /* inline[API_FC38]: "       clearing sample memory .........." */
  LcdPrintInline();
  while( true ) {
                    /* inline[API_FD26]: $0014 $7188 */
    FarCallInline();
    sVar1 = API_FD3E();
    if (sVar1 != 5) break;
                    /* inline[API_FD26]: $000E $7188 */
    FarCallInline();
  }
  DAT_70ec = 0;
  DAT_70ee = 0;
  DAT_70f0 = 0;
  DAT_70f2 = 0;
  DAT_70f4 = 0;
  DAT_70f6 = 0;
  DAT_70f8 = 0;
  DAT_70fa = 0;
                    /* inline[API_FD26]: $0038 $7188 */
  FarCallInline();
                    /* inline[API_FD26]: $003A $7188 */
  FarCallInline();
  FUN_M78_r3_24000__3694();
  return in_D;
}


