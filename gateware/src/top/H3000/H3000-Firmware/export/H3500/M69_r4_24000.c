// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M69_r4_24000 M69_r4_24000::0000-M69_r4_24000::3fff, 331 functions
// Bank r4_24000 (module id 69, sub 02)

// ===== MODULE_69_02_entry @ M69_r4_24000::0010 =====

undefined2 __h3000 MODULE_69_02_entry(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M69_r4_24000__268d();
  FUN_M69_r4_24000__2708();
  FUN_M69_r4_24000__2783();
  FUN_M69_r4_24000__27fe();
  return in_D;
}


// ===== FUN_M69_r4_24000__002c @ M69_r4_24000::002c =====

undefined2 __h3000 FUN_M69_r4_24000__002c(void)

{
  undefined2 in_D;
  
  DAT_7002 = 0;
  DAT_700a = 0;
  DAT_7012 = 0;
  DAT_7032 = 0;
  DAT_704a = 0;
  DAT_7042 = 0;
  DAT_7052 = 0;
  DAT_703a = 0;
  DAT_7062 = 0;
  DAT_705a = 0;
  DAT_70be = 0;
  DAT_70c6 = 0;
  DAT_70ce = 0;
  DAT_70d6 = 0;
  DAT_70de = 0;
  DAT_70e6 = 0;
  DAT_701a = 0;
  DAT_7020 = 0;
  DAT_7026 = 0;
  DAT_702c = 0;
  return in_D;
}


// ===== FUN_M69_r4_24000__0070 @ M69_r4_24000::0070 =====

undefined2 __h3000 FUN_M69_r4_24000__0070(void)

{
  undefined2 in_D;
  
  DAT_7068 = 0xffff;
  DAT_714a = 0;
                    /* inline[API_FE04]: 19:18 1A:1E 1B:24 1C:2A */
  LoadParamsSigned();
                    /* inline[API_FE04]: 42:72 41:70 75:B0 76:B2 77:B4 78:B6 79:B8 7A:BA */
  LoadParamsSigned();
                    /* inline[API_FE04]: 69:98 6A:9A 6B:9C 6C:9E 6D:A0 6E:A2 6F:A4 70:A6 71:A8 72:AA
                       73:AC 74:AE */
  LoadParamsSigned();
                    /* inline[API_FE06]: 5D:74 5E:76 5F:78 60:7A 61:7C 62:7E 63:80 64:82 65:84 66:86
                       67:88 68:8A */
  LoadParamsUnsigned();
                    /* inline[API_FE06]: 57:8C 58:8E 59:90 5A:92 5B:94 5C:96 */
  LoadParamsUnsigned();
                    /* inline[API_FE08]: 35:DC 57:E4 37:E2 59:EA 39:00 39:08 4F:10 3B:06 3B:0E 51:16
                        */
  LoadParamsScaled();
                    /* inline[API_FE08]: 3D:38 7F:60 53:40 35:48 31:50 4F:30 7B:58 3F:3E 55:46 37:4E
                       33:56 7D:5E 51:36 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 31:BC 31:C4 53:CC 33:C2 33:CA 55:D2 81:66 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 37:DA 35:D4 */
  LoadParamsScaled();
  return in_D;
}


// ===== FUN_M69_r4_24000__0142 @ M69_r4_24000::0142 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0157 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M69_r4_24000__0142(undefined2 param_1)

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
  API_FC58();
  DAT_7144 = 0;
  DspLoadProgram(0,uVar2,0x1e10);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar2,0x1e11);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar2,0x1e12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        API_FD7C();
        return auStack_8;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M69_r4_24000__0180 @ M69_r4_24000::0180 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0195 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M69_r4_24000__0180(undefined2 param_1)

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
  API_FC58();
  DAT_7144 = 0xffff;
  DspLoadProgram(0xff,uVar2,0x1410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar2,0x1411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar2,FUN_M69_r4_24000__1412);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        API_FD7C();
        return auStack_8;
      }
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M69_r4_24000__01be @ M69_r4_24000::01be =====

undefined2 __h3000 FUN_M69_r4_24000__01be(void)

{
  undefined2 in_D;
  
  DAT_713a = 0x7fff;
  DAT_713c = 0x7fff;
  DAT_70a4 = 200;
  DAT_70a6 = 0;
  DAT_70a8 = 0;
  DAT_70aa = 0;
  DAT_70ac = 0;
  DAT_70ae = 0;
  DAT_7074 = 0;
  DAT_7080 = 0;
  DAT_7098 = 0;
  FUN_M69_r4_24000__2f9e();
  FUN_M69_r4_24000__2f2a();
  FUN_M69_r4_24000__302c();
  return in_D;
}


// ===== FUN_M69_r4_24000__01f6 @ M69_r4_24000::01f6 =====

undefined2 __h3000 FUN_M69_r4_24000__01f6(void)

{
  undefined2 in_D;
  
  DAT_713a = 0x7fff;
  DAT_713c = 0x7fff;
  DAT_713e = 0x7fff;
  DAT_70a4 = 100;
  DAT_70aa = 100;
  DAT_70a6 = 0;
  DAT_70a8 = 0;
  DAT_70ac = 0;
  DAT_70ae = 0;
  DAT_7074 = 0;
  DAT_707a = 0;
  DAT_7080 = 0;
  DAT_7086 = 0;
  DAT_7098 = 0xfff6;
  DAT_709e = 10;
  FUN_M69_r4_24000__2f9e();
  FUN_M69_r4_24000__2f2a();
  FUN_M69_r4_24000__302c();
  return in_D;
}


// ===== FUN_M69_r4_24000__0240 @ M69_r4_24000::0240 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M69_r4_24000__0240(void)

{
                    /* inline[API_FD84]: 00 80 "l delay " 21 $2915 $2921 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r delay " 25 $29CF $29DB */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l fdback" 29 $2B37 $2B43 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r fdback" 2D $2BE5 $2BF1 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "left mix" 43 $251C $2528 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "rightmix" 47 $25CA $25D6 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "glide sp" 4B $141E $142A */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M69_r4_24000__02d4;
  _DAT_60f7 = 0x33;
  return;
}


// ===== FUN_M69_r4_24000__033a @ M69_r4_24000::033a =====

void __h3000 FUN_M69_r4_24000__033a(void)

{
  FUN_M69_r4_24000__24f8();
  FUN_M69_r4_24000__0cc3();
  API_FE14();
  return;
}


// ===== FUN_M69_r4_24000__0345 @ M69_r4_24000::0345 =====

void __h3000 FUN_M69_r4_24000__0345(void)

{
  FUN_M69_r4_24000__25a6();
  FUN_M69_r4_24000__0cf8();
  API_FE14();
  return;
}


// ===== FUN_M69_r4_24000__0350 @ M69_r4_24000::0350 =====

void __h3000 FUN_M69_r4_24000__0350(void)

{
  FUN_M69_r4_24000__28f1();
  FUN_M69_r4_24000__0cc3();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__035b @ M69_r4_24000::035b =====

void __h3000 FUN_M69_r4_24000__035b(void)

{
  FUN_M69_r4_24000__2b13();
  FUN_M69_r4_24000__0cc3();
  API_FE16();
  return;
}


// ===== FUN_M69_r4_24000__0366 @ M69_r4_24000::0366 =====

void __h3000 FUN_M69_r4_24000__0366(void)

{
  FUN_M69_r4_24000__13fa();
  FUN_M69_r4_24000__0d5e();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__0371 @ M69_r4_24000::0371 =====

void __h3000 FUN_M69_r4_24000__0371(void)

{
  FUN_M69_r4_24000__14e2();
  FUN_M69_r4_24000__0d5e();
  API_FE12();
  return;
}


// ===== FUN_M69_r4_24000__037c @ M69_r4_24000::037c =====

void __h3000 FUN_M69_r4_24000__037c(void)

{
  FUN_M69_r4_24000__1767();
  FUN_M69_r4_24000__0d5e();
  API_FE14();
  return;
}


// ===== FUN_M69_r4_24000__0387 @ M69_r4_24000::0387 =====

void __h3000 FUN_M69_r4_24000__0387(void)

{
  FUN_M69_r4_24000__1869();
  FUN_M69_r4_24000__18a2();
  FUN_M69_r4_24000__0cc3();
  API_FDEA();
  return;
}


// ===== FUN_M69_r4_24000__0395 @ M69_r4_24000::0395 =====

void __h3000 FUN_M69_r4_24000__0395(void)

{
  FUN_M69_r4_24000__29ab();
  FUN_M69_r4_24000__0cf8();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__03a0 @ M69_r4_24000::03a0 =====

void __h3000 FUN_M69_r4_24000__03a0(void)

{
  FUN_M69_r4_24000__2bc1();
  FUN_M69_r4_24000__0cf8();
  API_FE16();
  return;
}


// ===== FUN_M69_r4_24000__03ab @ M69_r4_24000::03ab =====

void __h3000 FUN_M69_r4_24000__03ab(void)

{
  FUN_M69_r4_24000__2654();
  FUN_M69_r4_24000__1063();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__03b6 @ M69_r4_24000::03b6 =====

void __h3000 FUN_M69_r4_24000__03b6(void)

{
  FUN_M69_r4_24000__26cf();
  FUN_M69_r4_24000__1063();
  API_FE12();
  return;
}


// ===== FUN_M69_r4_24000__03c1 @ M69_r4_24000::03c1 =====

void __h3000 FUN_M69_r4_24000__03c1(void)

{
  FUN_M69_r4_24000__274a();
  FUN_M69_r4_24000__109e();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__03cc @ M69_r4_24000::03cc =====

void __h3000 FUN_M69_r4_24000__03cc(void)

{
  FUN_M69_r4_24000__27c5();
  FUN_M69_r4_24000__109e();
  API_FE12();
  return;
}


// ===== FUN_M69_r4_24000__03d7 @ M69_r4_24000::03d7 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M69_r4_24000__03d7(void)

{
                    /* inline[API_FD84]: 00 80 " delay  " 21 $2864 $2870 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "feedback" 25 $2A89 $2A95 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "  mix   " 29 $246A $2476 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "glide sp" 2D $141E $142A */
  DefineParameter();
  _DAT_60f5 = &UNK_M69_r4_24000__0432;
  _DAT_60f7 = 0x33;
  return;
}


// ===== FUN_M69_r4_24000__050b @ M69_r4_24000::050b =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M69_r4_24000__050b(void)

{
                    /* inline[API_FD84]: 00 80 "m fdback" 21 $15FF $160B */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " m rate " 25 $121D $1229 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "m depth " 29 $12D4 $12E0 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "m delay " 2D $1379 $1385 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "  image " 43 $16D2 $16DE */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "  mix   " 47 $246A $2476 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "glide sp" 4B $141E $142A */
  DefineParameter();
  _DAT_60f5 = &UNK_M69_r4_24000__05a5;
  _DAT_60f7 = 0x33;
  DAT_7142 = _FUN_M69_r4_24000__0bad;
  return;
}


// ===== FUN_M69_r4_24000__0835 @ M69_r4_24000::0835 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M69_r4_24000__0835(void)

{
                    /* inline[API_FD84]: 00 80 " m delay" 21 $1379 $1385 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " m depth" 25 $12D4 $12E0 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 " m rate " 29 $121D $1229 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "m fdback" 2D $1130 $113C */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "  mix   " 43 $246A $2476 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "glide sp" 47 $141E $142A */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M69_r4_24000__08bc;
  _DAT_60f7 = 0x33;
  DAT_7142 = FUN_M69_r4_24000__0a97;
  return;
}


// ===== FUN_M69_r4_24000__0922 @ M69_r4_24000::0922 =====

void __h3000 FUN_M69_r4_24000__0922(void)

{
  FUN_M69_r4_24000__2446();
  FUN_M69_r4_24000__0a2a();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__092d @ M69_r4_24000::092d =====

void __h3000 FUN_M69_r4_24000__092d(void)

{
  FUN_M69_r4_24000__110c();
  FUN_M69_r4_24000__09f1();
  API_FE16();
  return;
}


// ===== FUN_M69_r4_24000__0938 @ M69_r4_24000::0938 =====

void __h3000 FUN_M69_r4_24000__0938(void)

{
  FUN_M69_r4_24000__1355();
  FUN_M69_r4_24000__09f1();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__0943 @ M69_r4_24000::0943 =====

void __h3000 FUN_M69_r4_24000__0943(void)

{
  FUN_M69_r4_24000__11f9();
  FUN_M69_r4_24000__09f1();
  API_FE12();
  return;
}


// ===== FUN_M69_r4_24000__094e @ M69_r4_24000::094e =====

void __h3000 FUN_M69_r4_24000__094e(void)

{
  FUN_M69_r4_24000__13fa();
  FUN_M69_r4_24000__0a65();
  API_FE10();
  return;
}


// ===== FUN_M69_r4_24000__0959 @ M69_r4_24000::0959 =====

void __h3000 FUN_M69_r4_24000__0959(void)

{
  FUN_M69_r4_24000__14e2();
  FUN_M69_r4_24000__0a65();
  API_FE12();
  return;
}


// ===== FUN_M69_r4_24000__0964 @ M69_r4_24000::0964 =====

void __h3000 FUN_M69_r4_24000__0964(void)

{
  FUN_M69_r4_24000__1767();
  FUN_M69_r4_24000__0a65();
  API_FE14();
  return;
}


// ===== FUN_M69_r4_24000__096f @ M69_r4_24000::096f =====

void __h3000 FUN_M69_r4_24000__096f(void)

{
  FUN_M69_r4_24000__1869();
  FUN_M69_r4_24000__18a2();
  FUN_M69_r4_24000__0a2a();
  API_FDEA();
  return;
}


// ===== FUN_M69_r4_24000__097d @ M69_r4_24000::097d =====

void __h3000 FUN_M69_r4_24000__097d(void)

{
  FUN_M69_r4_24000__12b0();
  FUN_M69_r4_24000__09f1();
  API_FE14();
  return;
}


// ===== FUN_M69_r4_24000__09b6 @ M69_r4_24000::09b6 =====

void __h3000 FUN_M69_r4_24000__09b6(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M69_r4_24000__09f1 @ M69_r4_24000::09f1 =====

void __h3000 FUN_M69_r4_24000__09f1(void)

{
                    /* inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1349 ->$11ED ->$12A4 ->$1100 ->$0A2A ->$0A2A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0a2a @ M69_r4_24000::0a2a =====

void __h3000 FUN_M69_r4_24000__0a2a(void)

{
                    /* inline[API_FE02]: "  mix   " [-] " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_7142 = FUN_M69_r4_24000__0a2a;
  FUN_M69_r4_24000__1933();
                    /* inline[API_FE00]: ->$243A ->$187E ->$1063 ->$0A65 ->$09F1 ->$09F1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0a65 @ M69_r4_24000::0a65 =====

void __h3000 FUN_M69_r4_24000__0a65(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$144B ->$1506 ->$10D9 ->$0A2A ->$0A97 ->$0A97 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0a97 @ M69_r4_24000::0a97 =====

void __h3000 FUN_M69_r4_24000__0a97(void)

{
                    /* inline[API_FE02]: " rates  " " depths " " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0E0B ->$0E7F ->$0D97 ->$0A2A ->$0A65 ->$0A65 */
  SetModuleHandlers();
  DAT_7142 = FUN_M69_r4_24000__0a97;
  return;
}


// ===== FUN_M69_r4_24000__0ad6 @ M69_r4_24000::0ad6 =====

void __h3000 FUN_M69_r4_24000__0ad6(void)

{
                    /* inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1349 ->$11ED ->$12A4 ->$15CF ->$0B0F ->$0B0F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0b0f @ M69_r4_24000::0b0f =====

void __h3000 FUN_M69_r4_24000__0b0f(void)

{
                    /* inline[API_FE02]: " width  " [-] "  mix   " " levels " */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_7142 = FUN_M69_r4_24000__0b0f;
  FUN_M69_r4_24000__1933();
                    /* inline[API_FE00]: ->$16BA ->$187E ->$243A ->$1063 ->$0B4A ->$0AD6 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0b4a @ M69_r4_24000::0b4a =====

void __h3000 FUN_M69_r4_24000__0b4a(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_7142 = FUN_M69_r4_24000__0b4a;
                    /* inline[API_FE00]: ->$10D9 ->$10D9 ->$10D9 ->$0B74 ->$0AD6 ->$0B0F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0b74 @ M69_r4_24000::0b74 =====

void __h3000 FUN_M69_r4_24000__0b74(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" "st/mono " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$144B ->$1506 ->$178B ->$0B4A ->$0BAD ->$0BAD */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0bad @ M69_r4_24000::0bad =====

void __h3000 FUN_M69_r4_24000__0bad(void)

{
                    /* inline[API_FE02]: " rates  " " depths " " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0E0B ->$0E7F ->$0D97 ->$0B4A ->$0BEC ->$0B74 */
  SetModuleHandlers();
  DAT_7142 = FUN_M69_r4_24000__0bad;
  return;
}


// ===== FUN_M69_r4_24000__0bec @ M69_r4_24000::0bec =====

void __h3000 FUN_M69_r4_24000__0bec(void)

{
                    /* inline[API_FE02]: "fdbacks " " pans   " " levels " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0FDB ->$0F67 ->$0EF3 ->$0B4A ->$0B74 ->$0BAD */
  SetModuleHandlers();
  DAT_7142 = FUN_M69_r4_24000__0bec;
  return;
}


// ===== FUN_M69_r4_24000__0c2b @ M69_r4_24000::0c2b =====

void __h3000 FUN_M69_r4_24000__0c2b(void)

{
                    /* inline[API_FE02]: " delay  " [-] "  mix   " "feedback" */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_r4_24000__1933();
                    /* inline[API_FE00]: ->$2834 ->$187E ->$243A ->$2A59 ->$0C60 ->$0C60 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0c60 @ M69_r4_24000::0c60 =====

void __h3000 FUN_M69_r4_24000__0c60(void)

{
                    /* inline[API_FE02]: [*] [*] " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_7142 = FUN_M69_r4_24000__0c60;
                    /* inline[API_FE00]: ->$10D9 ->$10D9 ->$1063 ->$0C91 ->$0C2B ->$0C2B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0c91 @ M69_r4_24000::0c91 =====

void __h3000 FUN_M69_r4_24000__0c91(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$144B ->$1506 ->$10D9 ->$0C60 ->$0C91 ->$0C91 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0cc3 @ M69_r4_24000::0cc3 =====

void __h3000 FUN_M69_r4_24000__0cc3(void)

{
                    /* inline[API_FE02]: "l delay " [-] "l mix   " "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_r4_24000__1933();
                    /* inline[API_FE00]: ->$28E5 ->$187E ->$24EC ->$2B07 ->$0CF8 ->$0D2D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0cf8 @ M69_r4_24000::0cf8 =====

void __h3000 FUN_M69_r4_24000__0cf8(void)

{
                    /* inline[API_FE02]: "r delay " [-] "r mix   " "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_r4_24000__1933();
                    /* inline[API_FE00]: ->$299F ->$187E ->$259A ->$2BB5 ->$0D2D ->$0CC3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0d2d @ M69_r4_24000::0d2d =====

void __h3000 FUN_M69_r4_24000__0d2d(void)

{
                    /* inline[API_FE02]: [*] [*] " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  DAT_7142 = FUN_M69_r4_24000__0d2d;
                    /* inline[API_FE00]: ->$10D9 ->$10D9 ->$1063 ->$0D5E ->$0CC3 ->$0CF8 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0d5e @ M69_r4_24000::0d5e =====

void __h3000 FUN_M69_r4_24000__0d5e(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" "st/mono " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$144B ->$1506 ->$178B ->$0D2D ->$0D5E ->$0D5E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0d97 @ M69_r4_24000::0d97 =====

void __h3000 FUN_M69_r4_24000__0d97(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1A8F ->$1A9D ->$1AAB ->$1AB9 ->$0DD0 ->$0DD0 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0dd0 @ M69_r4_24000::0dd0 =====

void __h3000 FUN_M69_r4_24000__0dd0(void)

{
                    /* inline[API_FE02]: "delay 5 " "delay 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1AC7 ->$1AD5 ->$10D9 ->$10D9 ->$0D97 ->$0D97 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__0e0b @ M69_r4_24000::0e0b =====

void __h3000 FUN_M69_r4_24000__0e0b(void)

{
                    /* inline[API_FE02]: " rate 1 " " rate 2 " " rate 3 " " rate 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1CC7 ->$1CD1 ->$1CDB ->$1CE5 ->$0E44 ->$0E44 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0e44 @ M69_r4_24000::0e44 =====

void __h3000 FUN_M69_r4_24000__0e44(void)

{
                    /* inline[API_FE02]: " rate 5 " " rate 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1CEF ->$1CF9 ->$10D9 ->$10D9 ->$0E0B ->$0E0B */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__0e7f @ M69_r4_24000::0e7f =====

void __h3000 FUN_M69_r4_24000__0e7f(void)

{
                    /* inline[API_FE02]: " depth 1" " depth 2" " depth 3" " depth4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1E42 ->$1E4C ->$1E56 ->$1E60 ->$0EB8 ->$0EB8 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0eb8 @ M69_r4_24000::0eb8 =====

void __h3000 FUN_M69_r4_24000__0eb8(void)

{
                    /* inline[API_FE02]: " depth 5" " depth6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1E6A ->$1E74 ->$10D9 ->$10D9 ->$0E7F ->$0E7F */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__0ef3 @ M69_r4_24000::0ef3 =====

void __h3000 FUN_M69_r4_24000__0ef3(void)

{
                    /* inline[API_FE02]: " level 1" " level 2" " level 3" " level 4" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FAA ->$1FB8 ->$1FC6 ->$1FD4 ->$0F2C ->$0F2C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0f2c @ M69_r4_24000::0f2c =====

void __h3000 FUN_M69_r4_24000__0f2c(void)

{
                    /* inline[API_FE02]: " level 5" " level 6" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FE2 ->$1FF0 ->$10D9 ->$10D9 ->$0EF3 ->$0EF3 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__0f67 @ M69_r4_24000::0f67 =====

void __h3000 FUN_M69_r4_24000__0f67(void)

{
                    /* inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2171 ->$217F ->$218D ->$219B ->$0FA0 ->$0FA0 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__0fa0 @ M69_r4_24000::0fa0 =====

void __h3000 FUN_M69_r4_24000__0fa0(void)

{
                    /* inline[API_FE02]: " pan 5  " " pan 6  " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$21A9 ->$21B7 ->$10D9 ->$10D9 ->$0F67 ->$0F67 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__0fdb @ M69_r4_24000::0fdb =====

void __h3000 FUN_M69_r4_24000__0fdb(void)

{
                    /* inline[API_FE02]: "  fb   1" "  fb   2" "  fb   3" "  fb  4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$22F2 ->$22FC ->$2306 ->$2310 ->$1014 ->$1014 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_r4_24000__1014 @ M69_r4_24000::1014 =====

void __h3000 FUN_M69_r4_24000__1014(void)

{
                    /* inline[API_FE02]: "  fb   5" "  fb  6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$231A ->$2324 ->$10D9 ->$10D9 ->$0FDB ->$0FDB */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__104f @ M69_r4_24000::104f =====

void __h3000 FUN_M69_r4_24000__104f(void)

{
                    /* inline[API_FE02]: [-] " range  " [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
  return;
}


// ===== FUN_M69_r4_24000__1063 @ M69_r4_24000::1063 =====

void __h3000 FUN_M69_r4_24000__1063(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2648 ->$26C3 ->$10D9 ->$10D9 ->$109E ->$109E */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__109e @ M69_r4_24000::109e =====

void __h3000 FUN_M69_r4_24000__109e(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$273E ->$27B9 ->$10D9 ->$10D9 ->$1063 ->$1063 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7142 >> 8));
  return;
}


// ===== FUN_M69_r4_24000__10d9 @ M69_r4_24000::10d9 =====

void __h3000 FUN_M69_r4_24000__10d9(void)

{
  return;
}


// ===== FUN_M69_r4_24000__1100 @ M69_r4_24000::1100 =====

void __h3000 FUN_M69_r4_24000__1100(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$115D ->$1124 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da);
  return;
}


// ===== FUN_M69_r4_24000__110c @ M69_r4_24000::110c =====

void __h3000 FUN_M69_r4_24000__110c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$115D ->$1124 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da);
  return;
}


// ===== FUN_M69_r4_24000__1118 @ M69_r4_24000::1118 =====

void __h3000 FUN_M69_r4_24000__1118(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$115D ->$1124 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da);
  return;
}


// ===== FUN_M69_r4_24000__1124 @ M69_r4_24000::1124 =====

void __h3000 FUN_M69_r4_24000__1124(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$115D ->$1124 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da);
  return;
}


// ===== FUN_M69_r4_24000__1130 @ M69_r4_24000::1130 =====

void __h3000 FUN_M69_r4_24000__1130(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$115D ->$1124 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da);
  return;
}


// ===== FUN_M69_r4_24000__113c @ M69_r4_24000::113c =====

void __h3000 FUN_M69_r4_24000__113c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$115D ->$1124 $1118 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da);
  return;
}


// ===== FUN_M69_r4_24000__115d @ M69_r4_24000::115d =====

undefined2 __h3000 FUN_M69_r4_24000__115d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_7034;
  if (DAT_7068 != 0) {
    *(char *)(in_U + -1) = (char)DAT_7034;
    *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
    *(undefined1 *)(in_U + -3) = 0x34;
    psVar2 = (short *)(in_U + -4);
    *(undefined1 *)psVar2 = 1;
    API_FCEC();
    uVar1 = DAT_7034;
    DAT_711a = *psVar2;
    *(char *)((short)psVar2 + 1) = (char)DAT_7034;
    *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
    *(undefined1 *)((short)psVar2 + -1) = 0x51;
    psVar2 = psVar2 + -1;
    *(undefined1 *)psVar2 = 0x78;
    API_FCF2();
    DAT_7146 = *psVar2 + DAT_711a;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7146 >> 8));
    DAT_711c = 0x7fff;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711c >> 8));
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__11ed @ M69_r4_24000::11ed =====

void __h3000 FUN_M69_r4_24000__11ed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$124A ->$1211 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7);
  return;
}


// ===== FUN_M69_r4_24000__11f9 @ M69_r4_24000::11f9 =====

void __h3000 FUN_M69_r4_24000__11f9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$124A ->$1211 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7);
  return;
}


// ===== FUN_M69_r4_24000__1205 @ M69_r4_24000::1205 =====

void __h3000 FUN_M69_r4_24000__1205(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$124A ->$1211 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7);
  return;
}


// ===== FUN_M69_r4_24000__1211 @ M69_r4_24000::1211 =====

void __h3000 FUN_M69_r4_24000__1211(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$124A ->$1211 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7);
  return;
}


// ===== FUN_M69_r4_24000__121d @ M69_r4_24000::121d =====

void __h3000 FUN_M69_r4_24000__121d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$124A ->$1211 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7);
  return;
}


// ===== FUN_M69_r4_24000__1229 @ M69_r4_24000::1229 =====

void __h3000 FUN_M69_r4_24000__1229(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$124A ->$1211 $1205 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7);
  return;
}


// ===== FUN_M69_r4_24000__124a @ M69_r4_24000::124a =====

undefined2 __h3000 FUN_M69_r4_24000__124a(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_704c;
  *(char *)(in_U + -1) = (char)DAT_704c;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 1;
  API_FCEE();
  uVar1 = DAT_704c;
  puVar2[-1] = (char)DAT_704c;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0xc2;
  puVar3 = (undefined2 *)(puVar2 + -4);
  *(undefined1 *)puVar3 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_7138 = *puVar3;
  FUN_M69_r4_24000__2f2a();
  return in_D;
}


// ===== FUN_M69_r4_24000__12a4 @ M69_r4_24000::12a4 =====

void __h3000 FUN_M69_r4_24000__12a4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1301 ->$12C8 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e);
  return;
}


// ===== FUN_M69_r4_24000__12b0 @ M69_r4_24000::12b0 =====

void __h3000 FUN_M69_r4_24000__12b0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1301 ->$12C8 */
                    /* inline[API_FDBC]: "5.94...~" */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e);
  return;
}


// ===== FUN_M69_r4_24000__12bc @ M69_r4_24000::12bc =====

void __h3000 FUN_M69_r4_24000__12bc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1301 ->$12C8 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e);
  return;
}


// ===== FUN_M69_r4_24000__12c8 @ M69_r4_24000::12c8 =====

void __h3000 FUN_M69_r4_24000__12c8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1301 ->$12C8 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e);
  return;
}


// ===== FUN_M69_r4_24000__12d4 @ M69_r4_24000::12d4 =====

void __h3000 FUN_M69_r4_24000__12d4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1301 ->$12C8 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e);
  return;
}


// ===== FUN_M69_r4_24000__12e0 @ M69_r4_24000::12e0 =====

void __h3000 FUN_M69_r4_24000__12e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1301 ->$12C8 $12BC */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e);
  return;
}


// ===== FUN_M69_r4_24000__1301 @ M69_r4_24000::1301 =====

undefined2 __h3000 FUN_M69_r4_24000__1301(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7044;
  *(char *)(in_U + -1) = (char)DAT_7044;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEE();
  DAT_7136 = *puVar2;
  FUN_M69_r4_24000__2f9e();
  return in_D;
}


// ===== FUN_M69_r4_24000__1349 @ M69_r4_24000::1349 =====

void __h3000 FUN_M69_r4_24000__1349(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$13A6 ->$136D */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323);
  return;
}


// ===== FUN_M69_r4_24000__1355 @ M69_r4_24000::1355 =====

void __h3000 FUN_M69_r4_24000__1355(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$13A6 ->$136D */
                    /* inline[API_FDBC]: "5.94...#" */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323);
  return;
}


// ===== FUN_M69_r4_24000__1361 @ M69_r4_24000::1361 =====

void __h3000 FUN_M69_r4_24000__1361(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$13A6 ->$136D */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323);
  return;
}


// ===== FUN_M69_r4_24000__136d @ M69_r4_24000::136d =====

void __h3000 FUN_M69_r4_24000__136d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$13A6 ->$136D */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323);
  return;
}


// ===== FUN_M69_r4_24000__1379 @ M69_r4_24000::1379 =====

void __h3000 FUN_M69_r4_24000__1379(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$13A6 ->$136D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323);
  return;
}


// ===== FUN_M69_r4_24000__1385 @ M69_r4_24000::1385 =====

void __h3000 FUN_M69_r4_24000__1385(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$13A6 ->$136D $1361 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323);
  return;
}


// ===== FUN_M69_r4_24000__13a6 @ M69_r4_24000::13a6 =====

undefined2 __h3000 FUN_M69_r4_24000__13a6(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7054;
  *(char *)(in_U + -1) = (char)DAT_7054;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEE();
  DAT_713a = *puVar2;
  FUN_M69_r4_24000__2e82();
  return in_D;
}


// ===== FUN_M69_r4_24000__13ee @ M69_r4_24000::13ee =====

void __h3000 FUN_M69_r4_24000__13ee(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$145E ->$1412 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8);
  return;
}


// ===== FUN_M69_r4_24000__13fa @ M69_r4_24000::13fa =====

void __h3000 FUN_M69_r4_24000__13fa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$145E ->$1412 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8);
  return;
}


// ===== FUN_M69_r4_24000__1406 @ M69_r4_24000::1406 =====

void __h3000 FUN_M69_r4_24000__1406(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$145E ->$1412 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8);
  return;
}


// ===== FUN_M69_r4_24000__1412 @ M69_r4_24000::1412 =====

void __h3000 FUN_M69_r4_24000__1412(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$145E ->$1412 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8);
  return;
}


// ===== FUN_M69_r4_24000__141e @ M69_r4_24000::141e =====

void __h3000 FUN_M69_r4_24000__141e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$145E ->$1412 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8);
  return;
}


// ===== FUN_M69_r4_24000__142a @ M69_r4_24000::142a =====

void __h3000 FUN_M69_r4_24000__142a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$145E ->$1412 $1406 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8);
  return;
}


// ===== FUN_M69_r4_24000__144b @ M69_r4_24000::144b =====

undefined2 __h3000 FUN_M69_r4_24000__144b(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__13ee();
  DAT_6066 = 5;
  DAT_60dc = 100;
  return in_D;
}


// ===== FUN_M69_r4_24000__145e @ M69_r4_24000::145e =====

undefined2 __h3000 FUN_M69_r4_24000__145e(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  byte *pbVar3;
  short in_U;
  undefined1 *puVar4;
  undefined2 *puVar5;
  
  API_FE76();
  sVar1 = DAT_703c;
  *(char *)(in_U + -1) = (char)DAT_703c;
  *(char *)(in_U + -2) = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 3;
  puVar4 = (undefined1 *)(in_U + -4);
  *puVar4 = 0;
  API_FCEE();
  sVar1 = DAT_703c;
  puVar4[-1] = (char)DAT_703c;
  puVar4[-2] = (char)((ushort)sVar1 >> 8);
  puVar4[-3] = 0x6b;
  puVar5 = (undefined2 *)(puVar4 + -4);
  *(undefined1 *)puVar5 = 0x23;
  API_FCF2();
  API_FCE2();
  DAT_7130 = *puVar5;
  if (DAT_703c < 100) {
    DAT_7134 = 100;
    pbVar3 = &BYTE_M69_r4_24000__010e;
  }
  else {
    DAT_7134 = 0;
    pbVar3 = (byte *)0x6978;
  }
  *(char *)((short)puVar5 + 1) = (char)pbVar3;
  *(char *)puVar5 = (char)((ushort)pbVar3 >> 8);
  sVar1 = DAT_703c;
  *(char *)((short)puVar5 + -1) = (char)DAT_703c;
  puVar5 = puVar5 + -1;
  *(char *)puVar5 = (char)((ushort)sVar1 >> 8);
  API_FCE6();
  uVar2 = DAT_7140;
  *(char *)((short)puVar5 + -1) = (char)DAT_7140;
  puVar5 = puVar5 + -1;
  *(char *)puVar5 = (char)((ushort)uVar2 >> 8);
  API_FCEE();
  DAT_7132 = *puVar5;
  if (DAT_7148 != -1) {
    DAT_714a = DAT_7134;
    API_FCC4((char)((ushort)DAT_7132 >> 8));
    FUN_M69_r4_24000__2e82();
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__14e2 @ M69_r4_24000::14e2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__14e2(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7070 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M69_r4_24000__15a8();
  API_FC80((char)((ushort)DAT_7070 >> 8),(char)DAT_7070,param_1,0x41);
  return in_D;
}


// ===== FUN_M69_r4_24000__1506 @ M69_r4_24000::1506 =====

undefined2 __h3000 FUN_M69_r4_24000__1506(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7070;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay gliding:      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$157A ->$1553
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__157a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1553 @ M69_r4_24000::1553 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1553(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7070 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x41);
  API_FE40((char)((ushort)DAT_7070 >> 8),(char)DAT_7070,param_1,5);
  FUN_M69_r4_24000__15a8();
  return in_D;
}


// ===== FUN_M69_r4_24000__157a @ M69_r4_24000::157a =====

undefined2 __h3000 FUN_M69_r4_24000__157a(void)

{
  undefined2 in_D;
  
  if (DAT_7070 == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "on " */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "off" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__15a8 @ M69_r4_24000::15a8 =====

void __h3000 FUN_M69_r4_24000__15a8(void)

{
  return;
}


// ===== FUN_M69_r4_24000__15cf @ M69_r4_24000::15cf =====

void __h3000 FUN_M69_r4_24000__15cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$162C ->$15F3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9);
  return;
}


// ===== FUN_M69_r4_24000__15db @ M69_r4_24000::15db =====

void __h3000 FUN_M69_r4_24000__15db(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$162C ->$15F3 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9);
  return;
}


// ===== FUN_M69_r4_24000__15e7 @ M69_r4_24000::15e7 =====

void __h3000 FUN_M69_r4_24000__15e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$162C ->$15F3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9);
  return;
}


// ===== FUN_M69_r4_24000__15f3 @ M69_r4_24000::15f3 =====

void __h3000 FUN_M69_r4_24000__15f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$162C ->$15F3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9);
  return;
}


// ===== FUN_M69_r4_24000__15ff @ M69_r4_24000::15ff =====

void __h3000 FUN_M69_r4_24000__15ff(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$162C ->$15F3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9);
  return;
}


// ===== FUN_M69_r4_24000__160b @ M69_r4_24000::160b =====

void __h3000 FUN_M69_r4_24000__160b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$162C ->$15F3 $15E7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9);
  return;
}


// ===== FUN_M69_r4_24000__162c @ M69_r4_24000::162c =====

undefined2 __h3000 FUN_M69_r4_24000__162c(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_705c;
  *(char *)(in_U + -1) = (char)DAT_705c;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  uVar1 = DAT_705c;
  DAT_711a = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_705c;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_713c = *psVar2 + DAT_711a;
  FUN_M69_r4_24000__30b8();
  return in_D;
}


// ===== FUN_M69_r4_24000__16ae @ M69_r4_24000::16ae =====

void __h3000 FUN_M69_r4_24000__16ae(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1745 ->$16EA */
                    /* inline[API_FDBC]: "5.94...d" */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__1745_M69_r4_24000__1664);
  return;
}


// ===== FUN_M69_r4_24000__16ba @ M69_r4_24000::16ba =====

void __h3000 FUN_M69_r4_24000__16ba(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1745 ->$16EA */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__1745_M69_r4_24000__1664);
  return;
}


// ===== FUN_M69_r4_24000__16c6 @ M69_r4_24000::16c6 =====

void __h3000 FUN_M69_r4_24000__16c6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1745 ->$16EA */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__1745_M69_r4_24000__1664);
  return;
}


// ===== FUN_M69_r4_24000__16d2 @ M69_r4_24000::16d2 =====

void __h3000 FUN_M69_r4_24000__16d2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1745 ->$16EA */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__1745_M69_r4_24000__1664);
  return;
}


// ===== FUN_M69_r4_24000__16de @ M69_r4_24000::16de =====

void __h3000 FUN_M69_r4_24000__16de(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1745 ->$16EA $16C6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__1745_M69_r4_24000__1664);
  return;
}


// ===== FUN_M69_r4_24000__16ea @ M69_r4_24000::16ea =====

undefined2 __h3000 FUN_M69_r4_24000__16ea(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                     " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_7064 + 100;
  *(undefined1 *)(in_U + -3) = 10;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  DAT_711a = *psVar1;
  LcdSetCursor((char)((ushort)(DAT_711a + 0x12) >> 8));
  API_FC2A();
  LcdSetCursor((char)((ushort)(0x26 - DAT_711a) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M69_r4_24000__1745 @ M69_r4_24000::1745 =====

undefined2 __h3000 FUN_M69_r4_24000__1745(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7064;
  *(char *)(in_U + -1) = (char)DAT_7064;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEC();
  DAT_713e = *puVar2;
  FUN_M69_r4_24000__302c();
  return in_D;
}


// ===== FUN_M69_r4_24000__1767 @ M69_r4_24000::1767 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1767(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7072 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M69_r4_24000__1833();
  API_FC80((char)((ushort)DAT_7072 >> 8),(char)DAT_7072,param_1,0x42);
  return in_D;
}


// ===== FUN_M69_r4_24000__178b @ M69_r4_24000::178b =====

undefined2 __h3000 FUN_M69_r4_24000__178b(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7072;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       input mode:         " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$17FF ->$17D8
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__17ff();
  return in_D;
}


// ===== FUN_M69_r4_24000__17d8 @ M69_r4_24000::17d8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__17d8(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7072 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x42);
  API_FE40((char)((ushort)DAT_7072 >> 8),(char)DAT_7072,param_1,6);
  FUN_M69_r4_24000__1833();
  return in_D;
}


// ===== FUN_M69_r4_24000__17ff @ M69_r4_24000::17ff =====

undefined2 __h3000 FUN_M69_r4_24000__17ff(void)

{
  undefined2 in_D;
  
  if (DAT_7072 == 0) {
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


// ===== FUN_M69_r4_24000__1833 @ M69_r4_24000::1833 =====

undefined2 __h3000 FUN_M69_r4_24000__1833(void)

{
  undefined2 in_D;
  
  if (DAT_7072 == 0) {
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0xff);
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__1869 @ M69_r4_24000::1869 =====

undefined2 __h3000 FUN_M69_r4_24000__1869(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7068 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M69_r4_24000__196b();
  return in_D;
}


// ===== FUN_M69_r4_24000__187e @ M69_r4_24000::187e =====

undefined2 __h3000 FUN_M69_r4_24000__187e(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x10);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x10);
  DAT_7068 = DAT_7068 ^ 0xffff;
  FUN_M69_r4_24000__18bf();
  return in_D;
}


// ===== FUN_M69_r4_24000__18a2 @ M69_r4_24000::18a2 =====

undefined2 __h3000 FUN_M69_r4_24000__18a2(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__196b();
  FUN_M69_r4_24000__18db();
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x10);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x10);
  return in_D;
}


// ===== FUN_M69_r4_24000__18bf @ M69_r4_24000::18bf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__18bf(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FE40((char)((ushort)DAT_7068 >> 8),(char)DAT_7068,param_1,7);
  FUN_M69_r4_24000__196b();
  FUN_M69_r4_24000__18db();
  FUN_M69_r4_24000__1933();
  API_FDEA();
  return in_D;
}


// ===== FUN_M69_r4_24000__18db @ M69_r4_24000::18db =====

undefined2 __h3000 FUN_M69_r4_24000__18db(void)

{
  undefined2 in_D;
  
  if (DAT_7068 == 0) {
    FUN_M69_r4_24000__09b6();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       ---repeat looping---" */
    LcdPrintInline();
  }
  else {
    FUN_M69_r4_24000__09b6();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       --normal operation--" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__1933 @ M69_r4_24000::1933 =====

undefined2 __h3000 FUN_M69_r4_24000__1933(void)

{
  undefined2 in_D;
  
  if (DAT_7068 == 0) {
                    /* inline[API_FE02]: [-] "rept=on " [-] [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  else {
                    /* inline[API_FE02]: [-] "rept=off" [-] [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__196b @ M69_r4_24000::196b =====

undefined2 __h3000 FUN_M69_r4_24000__196b(void)

{
  undefined2 in_D;
  
  if (DAT_7144 == 0) {
    if (DAT_7068 == 0) {
      DAT_711c = &DAT_7146;
      DAT_711e = 100;
      DAT_7120 = 200;
      do {
        DAT_711a = 0;
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_711a >> 8));
        DAT_711c = (undefined2 *)((short)DAT_711c + DAT_7120);
        if (DAT_711c < (undefined2 *)0x78af == (DAT_711c == (undefined2 *)0x78af)) {
          DAT_711c = (undefined2 *)0x78af;
        }
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_711c >> 8));
      } while (DAT_711c < (undefined2 *)0x78af != (DAT_711c == (undefined2 *)0x78af));
    }
    else {
      FUN_M69_r4_24000__115d();
    }
  }
  else if (DAT_7068 == 0) {
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0xff);
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__1a39 @ M69_r4_24000::1a39 =====

undefined2 __h3000 FUN_M69_r4_24000__1a39(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ec = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1a8f + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__1b6b();
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1a40 @ M69_r4_24000::1a40 =====

undefined2 __h3000 FUN_M69_r4_24000__1a40(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ec = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1a8f + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__1b6b();
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1a47 @ M69_r4_24000::1a47 =====

undefined2 __h3000 FUN_M69_r4_24000__1a47(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ec = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1a8f + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__1b6b();
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1a4e @ M69_r4_24000::1a4e =====

undefined2 __h3000 FUN_M69_r4_24000__1a4e(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ec = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1a8f + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__1b6b();
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1a55 @ M69_r4_24000::1a55 =====

undefined2 __h3000 FUN_M69_r4_24000__1a55(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ec = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1a8f + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__1b6b();
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1a5c @ M69_r4_24000::1a5c =====

undefined2 __h3000 FUN_M69_r4_24000__1a5c(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ec = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1a8f + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__1b6b();
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1a8f @ M69_r4_24000::1a8f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1a8f(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,0,&UNK_M69_r4_24000__044c,&UNK_M69_r4_24000__0440);
  DAT_6074 = *DAT_70ec;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1b6b();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1a9d @ M69_r4_24000::1a9d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1a9d(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,1,&UNK_M69_r4_24000__044d,&UNK_M69_r4_24000__0441);
  DAT_6074 = *DAT_70ec;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1b6b();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1aab @ M69_r4_24000::1aab =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1aab(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,2,&UNK_M69_r4_24000__044e,&UNK_M69_r4_24000__0442);
  DAT_6074 = *DAT_70ec;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1b6b();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1ab9 @ M69_r4_24000::1ab9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1ab9(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,3,&UNK_M69_r4_24000__044f,&UNK_M69_r4_24000__0443);
  DAT_6074 = *DAT_70ec;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1b6b();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1ac7 @ M69_r4_24000::1ac7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1ac7(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,4,&UNK_M69_r4_24000__0450,&UNK_M69_r4_24000__0444);
  DAT_6074 = *DAT_70ec;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1b6b();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1ad5 @ M69_r4_24000::1ad5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1ad5(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,5,&UNK_M69_r4_24000__0451,&UNK_M69_r4_24000__0445);
  DAT_6074 = *DAT_70ec;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay  :     mS     " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $00C8 $0000 $0000 ->$1B6B ->$1B3F
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__1b6b();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1b3f @ M69_r4_24000::1b3f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1b3f(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70ec = DAT_6074;
  API_FC80();
  API_FE40((char)((ushort)*DAT_70ec >> 8),(char)*DAT_70ec,param_1,DAT_7118 + 0xb);
  DAT_7140 = 0xe1;
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__1b6b @ M69_r4_24000::1b6b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1b6b(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_r4_24000__1b80 @ M69_r4_24000::1b80 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1b80(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  short *psVar3;
  
  uVar1 = *DAT_70ec;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0x2c;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = 0;
  API_FCEE();
  uVar1 = DAT_713a;
  puVar2[-1] = (char)DAT_713a;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_711a = *psVar3 + *DAT_7104;
  if (DAT_7070 == -1) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_7108);
    DAT_7108 = DAT_7108 + 0xc;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_7108);
    DAT_7108 = DAT_7108 + 6;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_7108);
    DAT_7108 = DAT_7108 + -0x12;
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_7108);
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7130 >> 8),(char)DAT_7130,param_1,DAT_7114);
    API_FD20(0);
    API_FD2E(0,0,param_1,DAT_7116);
    DAT_7108 = DAT_7108 + 0x12;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_7108);
    DAT_7108 = DAT_7108 + -0x12;
    DAT_7148 = 0;
    DAT_714a = DAT_7134;
    API_FCC4((char)((ushort)DAT_7132 >> 8));
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__1c71 @ M69_r4_24000::1c71 =====

undefined2 __h3000 FUN_M69_r4_24000__1c71(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ee = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1cc7 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1d85();
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1c78 @ M69_r4_24000::1c78 =====

undefined2 __h3000 FUN_M69_r4_24000__1c78(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ee = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1cc7 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1d85();
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1c7f @ M69_r4_24000::1c7f =====

undefined2 __h3000 FUN_M69_r4_24000__1c7f(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ee = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1cc7 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1d85();
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1c86 @ M69_r4_24000::1c86 =====

undefined2 __h3000 FUN_M69_r4_24000__1c86(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ee = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1cc7 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1d85();
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1c8d @ M69_r4_24000::1c8d =====

undefined2 __h3000 FUN_M69_r4_24000__1c8d(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ee = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1cc7 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1d85();
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1c94 @ M69_r4_24000::1c94 =====

undefined2 __h3000 FUN_M69_r4_24000__1c94(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ee = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1cc7 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1d85();
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1cc7 @ M69_r4_24000::1cc7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1cc7(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0,0,&UNK_M69_r4_24000__0440);
  DAT_6074 = *DAT_70ee;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1d85();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1cd1 @ M69_r4_24000::1cd1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1cd1(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0,1,&UNK_M69_r4_24000__0441);
  DAT_6074 = *DAT_70ee;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1d85();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1cdb @ M69_r4_24000::1cdb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1cdb(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0,2,&UNK_M69_r4_24000__0442);
  DAT_6074 = *DAT_70ee;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1d85();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1ce5 @ M69_r4_24000::1ce5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1ce5(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0,3,&UNK_M69_r4_24000__0443);
  DAT_6074 = *DAT_70ee;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1d85();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1cef @ M69_r4_24000::1cef =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1cef(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0,4,&UNK_M69_r4_24000__0444);
  DAT_6074 = *DAT_70ee;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1d85();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1cf9 @ M69_r4_24000::1cf9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1cf9(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f09(0,5,&UNK_M69_r4_24000__0445);
  DAT_6074 = *DAT_70ee;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       rate  :             " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1D85 ->$1D5F
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__1d85();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1d5f @ M69_r4_24000::1d5f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1d5f(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70ee = DAT_6074;
  API_FC80();
  API_FE40((char)((ushort)*DAT_70ee >> 8),(char)*DAT_70ee,param_1,DAT_7118 + 0x17);
  FUN_M69_r4_24000__1d9a();
  return in_D;
}


// ===== FUN_M69_r4_24000__1d85 @ M69_r4_24000::1d85 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1d85(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_r4_24000__1d9a @ M69_r4_24000::1d9a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1d9a(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  uVar1 = *DAT_70ee;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0x47;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = 1;
  API_FCEE();
  uVar1 = *DAT_70ee;
  puVar2[-1] = (char)uVar1;
  puVar2[-2] = (char)((ushort)uVar1 >> 8);
  puVar2[-3] = 0xc2;
  puVar2 = puVar2 + -4;
  *puVar2 = 0x55;
  API_FCF2();
  API_FCE2();
  uVar1 = DAT_7138;
  puVar2[-1] = (char)DAT_7138;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_711a = *puVar3;
  if (DAT_7148 != 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_710a);
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__1dec @ M69_r4_24000::1dec =====

undefined2 __h3000 FUN_M69_r4_24000__1dec(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1e42 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1f00();
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1df3 @ M69_r4_24000::1df3 =====

undefined2 __h3000 FUN_M69_r4_24000__1df3(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1e42 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1f00();
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1dfa @ M69_r4_24000::1dfa =====

undefined2 __h3000 FUN_M69_r4_24000__1dfa(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1e42 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1f00();
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1e01 @ M69_r4_24000::1e01 =====

undefined2 __h3000 FUN_M69_r4_24000__1e01(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1e42 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1f00();
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1e08 @ M69_r4_24000::1e08 =====

undefined2 __h3000 FUN_M69_r4_24000__1e08(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1e42 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1f00();
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1e0f @ M69_r4_24000::1e0f =====

undefined2 __h3000 FUN_M69_r4_24000__1e0f(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1e42 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__1f00();
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1e42 @ M69_r4_24000::1e42 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1e42(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0,0,&UNK_M69_r4_24000__0452);
  DAT_6074 = *DAT_70f0;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1f00();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1e4c @ M69_r4_24000::1e4c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1e4c(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0,1,&UNK_M69_r4_24000__0453);
  DAT_6074 = *DAT_70f0;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1f00();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1e56 @ M69_r4_24000::1e56 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1e56(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0,2,&UNK_M69_r4_24000__0454);
  DAT_6074 = *DAT_70f0;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1f00();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1e60 @ M69_r4_24000::1e60 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1e60(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0,3,&UNK_M69_r4_24000__0455);
  DAT_6074 = *DAT_70f0;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1f00();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1e6a @ M69_r4_24000::1e6a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1e6a(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0,4,&UNK_M69_r4_24000__0456);
  DAT_6074 = *DAT_70f0;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__1f00();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1e74 @ M69_r4_24000::1e74 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1e74(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2f7d(0,5,&UNK_M69_r4_24000__0457);
  DAT_6074 = *DAT_70f0;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       depth  :    mS      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0028 $0000 $0000 ->$1F00 ->$1EDA
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__1f00();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1eda @ M69_r4_24000::1eda =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1eda(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70f0 = DAT_6074;
  API_FC80();
  API_FE40((char)((ushort)*DAT_70f0 >> 8),(char)*DAT_70f0,param_1,DAT_7118 + 0x11);
  FUN_M69_r4_24000__1f15();
  return in_D;
}


// ===== FUN_M69_r4_24000__1f00 @ M69_r4_24000::1f00 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1f00(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M69_r4_24000__1f15 @ M69_r4_24000::1f15 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1f15(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  uVar1 = *DAT_70f0;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0x2c;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = 0;
  API_FCEE();
  uVar1 = DAT_7136;
  puVar2[-1] = (char)DAT_7136;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_711a = *puVar3;
  if (DAT_7148 != 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,DAT_710c);
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__1f54 @ M69_r4_24000::1f54 =====

undefined2 __h3000 FUN_M69_r4_24000__1f54(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1faa + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__2080();
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__1f5b @ M69_r4_24000::1f5b =====

undefined2 __h3000 FUN_M69_r4_24000__1f5b(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1faa + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__2080();
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__1f62 @ M69_r4_24000::1f62 =====

undefined2 __h3000 FUN_M69_r4_24000__1f62(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1faa + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__2080();
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__1f69 @ M69_r4_24000::1f69 =====

undefined2 __h3000 FUN_M69_r4_24000__1f69(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1faa + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__2080();
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__1f70 @ M69_r4_24000::1f70 =====

undefined2 __h3000 FUN_M69_r4_24000__1f70(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1faa + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__2080();
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__1f77 @ M69_r4_24000::1f77 =====

undefined2 __h3000 FUN_M69_r4_24000__1f77(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__1faa + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__2080();
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__1faa @ M69_r4_24000::1faa =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1faa(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,0,0x140,0x143);
  DAT_6074 = *DAT_70f2;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__2080();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1fb8 @ M69_r4_24000::1fb8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1fb8(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,1,0x141,0x144);
  DAT_6074 = *DAT_70f2;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__2080();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1fc6 @ M69_r4_24000::1fc6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1fc6(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,2,FUN_M69_r4_24000__0142,0x145);
  DAT_6074 = *DAT_70f2;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__2080();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1fd4 @ M69_r4_24000::1fd4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1fd4(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,3,FUN_M69_r4_24000__0240,0x243);
  DAT_6074 = *DAT_70f2;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__2080();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1fe2 @ M69_r4_24000::1fe2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1fe2(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,4,0x241,&BYTE_M69_r4_24000__0244);
  DAT_6074 = *DAT_70f2;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__2080();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__1ff0 @ M69_r4_24000::1ff0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__1ff0(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,5,0x242,&BYTE_M69_r4_24000__0245);
  DAT_6074 = *DAT_70f2;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       level  :     %      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2080 ->$205A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__2080();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__205a @ M69_r4_24000::205a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__205a(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70f2 = DAT_6074;
  API_FC80();
  API_FE40((char)((ushort)*DAT_70f2 >> 8),(char)*DAT_70f2,param_1,DAT_7118 + 0x1d);
  FUN_M69_r4_24000__2095();
  return in_D;
}


// ===== FUN_M69_r4_24000__2080 @ M69_r4_24000::2080 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2080(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_r4_24000__2095 @ M69_r4_24000::2095 =====

undefined2 __h3000 FUN_M69_r4_24000__2095(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  sVar1 = *DAT_70f2;
  if (sVar1 == 0) {
    DAT_711e = 0;
    DAT_7120 = 0;
  }
  else {
    *(char *)(in_U + -1) = (char)sVar1;
    *(char *)(in_U + -2) = (char)((ushort)sVar1 >> 8);
    *(undefined1 *)(in_U + -3) = 0xe;
    psVar3 = (short *)(in_U + -4);
    *(undefined1 *)psVar3 = 0;
    API_FCEC();
    DAT_711c = *psVar3;
    *(char *)((short)psVar3 + 1) = (char)*psVar3;
    *(undefined1 *)psVar3 = *(undefined1 *)psVar3;
    *(undefined1 *)((short)psVar3 + -1) = 0xb;
    psVar3 = psVar3 + -1;
    *(undefined1 *)psVar3 = 0;
    API_FCEC();
    sVar1 = DAT_711c;
    DAT_711a = *psVar3;
    *(char *)((short)psVar3 + 1) = (char)DAT_711c;
    *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
    uVar2 = *DAT_70f4;
    *(char *)((short)psVar3 + -1) = (char)uVar2;
    psVar3 = psVar3 + -1;
    *(char *)psVar3 = (char)((ushort)uVar2 >> 8);
    API_FCEC();
    uVar2 = DAT_713e;
    *(char *)((short)psVar3 + -1) = (char)DAT_713e;
    psVar3 = psVar3 + -1;
    *(char *)psVar3 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    DAT_711c = *psVar3;
    DAT_711e = DAT_711a + DAT_711c;
    DAT_7120 = DAT_711a - DAT_711c;
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7120 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__211b @ M69_r4_24000::211b =====

undefined2 __h3000 FUN_M69_r4_24000__211b(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__2171 + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__225c();
  FUN_M69_r4_24000__225d();
  return in_D;
}


// ===== FUN_M69_r4_24000__2122 @ M69_r4_24000::2122 =====

undefined2 __h3000 FUN_M69_r4_24000__2122(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__2171 + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__225c();
  FUN_M69_r4_24000__225d();
  return in_D;
}


// ===== FUN_M69_r4_24000__2129 @ M69_r4_24000::2129 =====

undefined2 __h3000 FUN_M69_r4_24000__2129(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__2171 + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__225c();
  FUN_M69_r4_24000__225d();
  return in_D;
}


// ===== FUN_M69_r4_24000__2130 @ M69_r4_24000::2130 =====

undefined2 __h3000 FUN_M69_r4_24000__2130(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__2171 + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__225c();
  FUN_M69_r4_24000__225d();
  return in_D;
}


// ===== FUN_M69_r4_24000__2137 @ M69_r4_24000::2137 =====

undefined2 __h3000 FUN_M69_r4_24000__2137(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__2171 + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__225c();
  FUN_M69_r4_24000__225d();
  return in_D;
}


// ===== FUN_M69_r4_24000__213e @ M69_r4_24000::213e =====

undefined2 __h3000 FUN_M69_r4_24000__213e(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__2171 + g_moduleBase + (DAT_7118 & 0xff) * 0xe))();
  FUN_M69_r4_24000__225c();
  FUN_M69_r4_24000__225d();
  return in_D;
}


// ===== FUN_M69_r4_24000__2171 @ M69_r4_24000::2171 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2171(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,0,0x140,0x143);
  DAT_6074 = *DAT_70f4;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__225c();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__217f @ M69_r4_24000::217f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__217f(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,1,0x141,0x144);
  DAT_6074 = *DAT_70f4;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__225c();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__218d @ M69_r4_24000::218d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__218d(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,2,FUN_M69_r4_24000__0142,0x145);
  DAT_6074 = *DAT_70f4;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__225c();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__219b @ M69_r4_24000::219b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__219b(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,3,FUN_M69_r4_24000__0240,0x243);
  DAT_6074 = *DAT_70f4;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__225c();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__21a9 @ M69_r4_24000::21a9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__21a9(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,4,0x241,&BYTE_M69_r4_24000__0244);
  DAT_6074 = *DAT_70f4;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__225c();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__21b7 @ M69_r4_24000::21b7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__21b7(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2ff1(0,5,0x242,&BYTE_M69_r4_24000__0245);
  DAT_6074 = *DAT_70f4;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       pan  : L-           C           -R " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$225C ->$2233
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__225c();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__2233 @ M69_r4_24000::2233 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2233(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70f4 = DAT_6074;
  API_FC80();
  API_FE40((char)((ushort)*DAT_70f4 >> 8),(char)*DAT_70f4,param_1,DAT_7118 + 0x29);
  FUN_M69_r4_24000__225d();
  FUN_M69_r4_24000__2261();
  return in_D;
}


// ===== FUN_M69_r4_24000__225c @ M69_r4_24000::225c =====

void __h3000 FUN_M69_r4_24000__225c(void)

{
  return;
}


// ===== FUN_M69_r4_24000__225d @ M69_r4_24000::225d =====

void __h3000 FUN_M69_r4_24000__225d(void)

{
  FUN_M69_r4_24000__2095();
  return;
}


// ===== FUN_M69_r4_24000__2261 @ M69_r4_24000::2261 =====

undefined2 __h3000 FUN_M69_r4_24000__2261(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "           C           " */
  LcdPrintInline();
  LcdSetCursor((char)((ushort)(*DAT_70f4 + 0x19) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M69_r4_24000__229c @ M69_r4_24000::229c =====

undefined2 __h3000 FUN_M69_r4_24000__229c(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__22f2 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__23b0();
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__22a3 @ M69_r4_24000::22a3 =====

undefined2 __h3000 FUN_M69_r4_24000__22a3(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__22f2 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__23b0();
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__22aa @ M69_r4_24000::22aa =====

undefined2 __h3000 FUN_M69_r4_24000__22aa(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__22f2 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__23b0();
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__22b1 @ M69_r4_24000::22b1 =====

undefined2 __h3000 FUN_M69_r4_24000__22b1(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__22f2 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__23b0();
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__22b8 @ M69_r4_24000::22b8 =====

undefined2 __h3000 FUN_M69_r4_24000__22b8(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__22f2 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__23b0();
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__22bf @ M69_r4_24000::22bf =====

undefined2 __h3000 FUN_M69_r4_24000__22bf(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0);
  DAT_6074 = DAT_60f9;
  *DAT_70f6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_r4_24000__22f2 + g_moduleBase + (DAT_7118 & 0xff) * 10))();
  FUN_M69_r4_24000__23b0();
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__22f2 @ M69_r4_24000::22f2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__22f2(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0,0,0x146);
  DAT_6074 = *DAT_70f6;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__23b0();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__22fc @ M69_r4_24000::22fc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__22fc(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0,1,0x147);
  DAT_6074 = *DAT_70f6;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__23b0();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__2306 @ M69_r4_24000::2306 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2306(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0,2,0x148);
  DAT_6074 = *DAT_70f6;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__23b0();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__2310 @ M69_r4_24000::2310 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2310(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0,3,"l delay ");
  DAT_6074 = *DAT_70f6;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__23b0();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__231a @ M69_r4_24000::231a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__231a(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0,4," delay ");
  DAT_6074 = *DAT_70f6;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_r4_24000__23b0();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__2324 @ M69_r4_24000::2324 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2324(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__3097(0,5,"delay ");
  DAT_6074 = *DAT_70f6;
  FUN_M69_r4_24000__09b6();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       feedback  :     %   " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$23B0 ->$238A
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_r4_24000__23b0();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_7118 >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__238a @ M69_r4_24000::238a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__238a(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70f6 = DAT_6074;
  API_FC80();
  API_FE40((char)((ushort)*DAT_70f6 >> 8),(char)*DAT_70f6,param_1,DAT_7118 + 0x23);
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__23b0 @ M69_r4_24000::23b0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__23b0(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_r4_24000__23c5 @ M69_r4_24000::23c5 =====

undefined2 __h3000 FUN_M69_r4_24000__23c5(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  uVar1 = *DAT_70f6;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  DAT_711a = *psVar2;
  uVar1 = *DAT_70f6;
  *(char *)((short)psVar2 + 1) = (char)uVar1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  *psVar2 = *psVar2 + DAT_711a;
  uVar1 = DAT_713c;
  *(char *)((short)psVar2 + -1) = (char)DAT_713c;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_711a = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__243a @ M69_r4_24000::243a =====

void __h3000 FUN_M69_r4_24000__243a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2497 ->$245E */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414);
  return;
}


// ===== FUN_M69_r4_24000__2446 @ M69_r4_24000::2446 =====

void __h3000 FUN_M69_r4_24000__2446(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2497 ->$245E */
                    /* inline[API_FDBC]: "5.94..$." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414);
  return;
}


// ===== FUN_M69_r4_24000__2452 @ M69_r4_24000::2452 =====

void __h3000 FUN_M69_r4_24000__2452(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2497 ->$245E */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414);
  return;
}


// ===== FUN_M69_r4_24000__245e @ M69_r4_24000::245e =====

void __h3000 FUN_M69_r4_24000__245e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2497 ->$245E */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414);
  return;
}


// ===== FUN_M69_r4_24000__246a @ M69_r4_24000::246a =====

void __h3000 FUN_M69_r4_24000__246a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2497 ->$245E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414);
  return;
}


// ===== FUN_M69_r4_24000__2476 @ M69_r4_24000::2476 =====

void __h3000 FUN_M69_r4_24000__2476(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2497 ->$245E $2452 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414);
  return;
}


// ===== FUN_M69_r4_24000__2497 @ M69_r4_24000::2497 =====

undefined2 __h3000 FUN_M69_r4_24000__2497(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7004;
  *(short *)(in_U + -2) = sVar1;
  DAT_711a = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_711a) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M69_r4_24000__24ec @ M69_r4_24000::24ec =====

void __h3000 FUN_M69_r4_24000__24ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2549 ->$2510 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6);
  return;
}


// ===== FUN_M69_r4_24000__24f8 @ M69_r4_24000::24f8 =====

void __h3000 FUN_M69_r4_24000__24f8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2549 ->$2510 */
                    /* inline[API_FDBC]: "5.94..$." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6);
  return;
}


// ===== FUN_M69_r4_24000__2504 @ M69_r4_24000::2504 =====

void __h3000 FUN_M69_r4_24000__2504(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2549 ->$2510 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6);
  return;
}


// ===== FUN_M69_r4_24000__2510 @ M69_r4_24000::2510 =====

void __h3000 FUN_M69_r4_24000__2510(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2549 ->$2510 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6);
  return;
}


// ===== FUN_M69_r4_24000__251c @ M69_r4_24000::251c =====

void __h3000 FUN_M69_r4_24000__251c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2549 ->$2510 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6);
  return;
}


// ===== FUN_M69_r4_24000__2528 @ M69_r4_24000::2528 =====

void __h3000 FUN_M69_r4_24000__2528(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2549 ->$2510 $2504 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6);
  return;
}


// ===== FUN_M69_r4_24000__2549 @ M69_r4_24000::2549 =====

undefined2 __h3000 FUN_M69_r4_24000__2549(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_700c;
  *(short *)(in_U + -2) = sVar1;
  DAT_711a = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_711a) >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__259a @ M69_r4_24000::259a =====

void __h3000 FUN_M69_r4_24000__259a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$25F7 ->$25BE */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574);
  return;
}


// ===== FUN_M69_r4_24000__25a6 @ M69_r4_24000::25a6 =====

void __h3000 FUN_M69_r4_24000__25a6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$25F7 ->$25BE */
                    /* inline[API_FDBC]: "5.94..%t" */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574);
  return;
}


// ===== FUN_M69_r4_24000__25b2 @ M69_r4_24000::25b2 =====

void __h3000 FUN_M69_r4_24000__25b2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$25F7 ->$25BE */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574);
  return;
}


// ===== FUN_M69_r4_24000__25be @ M69_r4_24000::25be =====

void __h3000 FUN_M69_r4_24000__25be(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$25F7 ->$25BE */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574);
  return;
}


// ===== FUN_M69_r4_24000__25ca @ M69_r4_24000::25ca =====

void __h3000 FUN_M69_r4_24000__25ca(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$25F7 ->$25BE */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574);
  return;
}


// ===== FUN_M69_r4_24000__25d6 @ M69_r4_24000::25d6 =====

void __h3000 FUN_M69_r4_24000__25d6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$25F7 ->$25BE $25B2 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574);
  return;
}


// ===== FUN_M69_r4_24000__25f7 @ M69_r4_24000::25f7 =====

undefined2 __h3000 FUN_M69_r4_24000__25f7(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7014;
  *(short *)(in_U + -2) = sVar1;
  DAT_711a = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_711a) >> 8));
  return in_D;
}


// ===== FUN_M69_r4_24000__2648 @ M69_r4_24000::2648 =====

void __h3000 FUN_M69_r4_24000__2648(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M69_r4_24000__268d_M69_r4_24000__2622);
  return;
}


// ===== FUN_M69_r4_24000__2654 @ M69_r4_24000::2654 =====

void __h3000 FUN_M69_r4_24000__2654(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$268D ->$266C */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M69_r4_24000__268d_M69_r4_24000__2622);
  return;
}


// ===== FUN_M69_r4_24000__2660 @ M69_r4_24000::2660 =====

void __h3000 FUN_M69_r4_24000__2660(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M69_r4_24000__268d_M69_r4_24000__2622);
  return;
}


// ===== FUN_M69_r4_24000__266c @ M69_r4_24000::266c =====

void __h3000 FUN_M69_r4_24000__266c(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M69_r4_24000__268d_M69_r4_24000__2622);
  return;
}


// ===== FUN_M69_r4_24000__268d @ M69_r4_24000::268d =====

undefined2 __h3000 FUN_M69_r4_24000__268d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M69_r4_24000__268d_M69_r4_24000__2622);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M69_r4_24000__26c3 @ M69_r4_24000::26c3 =====

void __h3000 FUN_M69_r4_24000__26c3(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M69_r4_24000__2708_M69_r4_24000__269d);
  return;
}


// ===== FUN_M69_r4_24000__26cf @ M69_r4_24000::26cf =====

void __h3000 FUN_M69_r4_24000__26cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2708 ->$26E7 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M69_r4_24000__2708_M69_r4_24000__269d);
  return;
}


// ===== FUN_M69_r4_24000__26db @ M69_r4_24000::26db =====

void __h3000 FUN_M69_r4_24000__26db(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M69_r4_24000__2708_M69_r4_24000__269d);
  return;
}


// ===== FUN_M69_r4_24000__26e7 @ M69_r4_24000::26e7 =====

void __h3000 FUN_M69_r4_24000__26e7(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M69_r4_24000__2708_M69_r4_24000__269d);
  return;
}


// ===== FUN_M69_r4_24000__2708 @ M69_r4_24000::2708 =====

undefined2 __h3000 FUN_M69_r4_24000__2708(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M69_r4_24000__2708_M69_r4_24000__269d);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M69_r4_24000__273e @ M69_r4_24000::273e =====

void __h3000 FUN_M69_r4_24000__273e(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M69_r4_24000__2783_M69_r4_24000__2718);
  return;
}


// ===== FUN_M69_r4_24000__274a @ M69_r4_24000::274a =====

void __h3000 FUN_M69_r4_24000__274a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2783 ->$2762 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M69_r4_24000__2783_M69_r4_24000__2718);
  return;
}


// ===== FUN_M69_r4_24000__2756 @ M69_r4_24000::2756 =====

void __h3000 FUN_M69_r4_24000__2756(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M69_r4_24000__2783_M69_r4_24000__2718);
  return;
}


// ===== FUN_M69_r4_24000__2762 @ M69_r4_24000::2762 =====

void __h3000 FUN_M69_r4_24000__2762(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M69_r4_24000__2783_M69_r4_24000__2718);
  return;
}


// ===== FUN_M69_r4_24000__2783 @ M69_r4_24000::2783 =====

undefined2 __h3000 FUN_M69_r4_24000__2783(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M69_r4_24000__2783_M69_r4_24000__2718);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M69_r4_24000__27b9 @ M69_r4_24000::27b9 =====

void __h3000 FUN_M69_r4_24000__27b9(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M69_r4_24000__27fe_M69_r4_24000__2793);
  return;
}


// ===== FUN_M69_r4_24000__27c5 @ M69_r4_24000::27c5 =====

void __h3000 FUN_M69_r4_24000__27c5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$27FE ->$27DD */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M69_r4_24000__27fe_M69_r4_24000__2793);
  return;
}


// ===== FUN_M69_r4_24000__27d1 @ M69_r4_24000::27d1 =====

void __h3000 FUN_M69_r4_24000__27d1(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M69_r4_24000__27fe_M69_r4_24000__2793);
  return;
}


// ===== FUN_M69_r4_24000__27dd @ M69_r4_24000::27dd =====

void __h3000 FUN_M69_r4_24000__27dd(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M69_r4_24000__27fe_M69_r4_24000__2793);
  return;
}


// ===== FUN_M69_r4_24000__27fe @ M69_r4_24000::27fe =====

undefined2 __h3000 FUN_M69_r4_24000__27fe(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M69_r4_24000__27fe_M69_r4_24000__2793);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M69_r4_24000__2834 @ M69_r4_24000::2834 =====

void __h3000 FUN_M69_r4_24000__2834(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2891 ->$2858 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  return;
}


// ===== FUN_M69_r4_24000__2840 @ M69_r4_24000::2840 =====

void __h3000 FUN_M69_r4_24000__2840(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2891 ->$2858 */
                    /* inline[API_FDBC]: "5.94..(." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  return;
}


// ===== FUN_M69_r4_24000__284c @ M69_r4_24000::284c =====

void __h3000 FUN_M69_r4_24000__284c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2891 ->$2858 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  return;
}


// ===== FUN_M69_r4_24000__2858 @ M69_r4_24000::2858 =====

void __h3000 FUN_M69_r4_24000__2858(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2891 ->$2858 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  return;
}


// ===== FUN_M69_r4_24000__2864 @ M69_r4_24000::2864 =====

void __h3000 FUN_M69_r4_24000__2864(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2891 ->$2858 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  return;
}


// ===== FUN_M69_r4_24000__2870 @ M69_r4_24000::2870 =====

void __h3000 FUN_M69_r4_24000__2870(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2891 ->$2858 $284C */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  return;
}


// ===== FUN_M69_r4_24000__2891 @ M69_r4_24000::2891 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2891(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,0,&UNK_M69_r4_24000__044c,&UNK_M69_r4_24000__0440);
  DAT_7132 = 0x7fff;
  DAT_7134 = 100;
  API_FE76(0,100,&PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e);
  DAT_708c = DAT_70c0;
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__28e5 @ M69_r4_24000::28e5 =====

void __h3000 FUN_M69_r4_24000__28e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2942 ->$2909 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  return;
}


// ===== FUN_M69_r4_24000__28f1 @ M69_r4_24000::28f1 =====

void __h3000 FUN_M69_r4_24000__28f1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2942 ->$2909 */
                    /* inline[API_FDBC]: "5.94..(." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  return;
}


// ===== FUN_M69_r4_24000__28fd @ M69_r4_24000::28fd =====

void __h3000 FUN_M69_r4_24000__28fd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2942 ->$2909 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  return;
}


// ===== FUN_M69_r4_24000__2909 @ M69_r4_24000::2909 =====

void __h3000 FUN_M69_r4_24000__2909(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2942 ->$2909 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  return;
}


// ===== FUN_M69_r4_24000__2915 @ M69_r4_24000::2915 =====

void __h3000 FUN_M69_r4_24000__2915(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2942 ->$2909 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  return;
}


// ===== FUN_M69_r4_24000__2921 @ M69_r4_24000::2921 =====

void __h3000 FUN_M69_r4_24000__2921(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2942 ->$2909 $28FD */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  return;
}


// ===== FUN_M69_r4_24000__2942 @ M69_r4_24000::2942 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2942(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,0,&UNK_M69_r4_24000__044c,&UNK_M69_r4_24000__0440);
  DAT_7104 = &DAT_M69_r4_24000__320b + g_moduleBase;
  DAT_7132 = 0x7fff;
  DAT_7134 = 100;
  API_FE76(0,100,&PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf);
  DAT_708c = DAT_70c8;
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__299f @ M69_r4_24000::299f =====

void __h3000 FUN_M69_r4_24000__299f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$29FC ->$29C3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  return;
}


// ===== FUN_M69_r4_24000__29ab @ M69_r4_24000::29ab =====

void __h3000 FUN_M69_r4_24000__29ab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$29FC ->$29C3 */
                    /* inline[API_FDBC]: "5.94..)y" */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  return;
}


// ===== FUN_M69_r4_24000__29b7 @ M69_r4_24000::29b7 =====

void __h3000 FUN_M69_r4_24000__29b7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$29FC ->$29C3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  return;
}


// ===== FUN_M69_r4_24000__29c3 @ M69_r4_24000::29c3 =====

void __h3000 FUN_M69_r4_24000__29c3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$29FC ->$29C3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  return;
}


// ===== FUN_M69_r4_24000__29cf @ M69_r4_24000::29cf =====

void __h3000 FUN_M69_r4_24000__29cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$29FC ->$29C3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  return;
}


// ===== FUN_M69_r4_24000__29db @ M69_r4_24000::29db =====

void __h3000 FUN_M69_r4_24000__29db(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$29FC ->$29C3 $29B7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  return;
}


// ===== FUN_M69_r4_24000__29fc @ M69_r4_24000::29fc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__29fc(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__2e40(0,3,&UNK_M69_r4_24000__044f,&UNK_M69_r4_24000__0443);
  DAT_7104 = &DAT_M69_r4_24000__320d + g_moduleBase;
  DAT_7132 = 0x7fff;
  DAT_7134 = 100;
  API_FE76(0,100,&PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979);
  DAT_7092 = DAT_70d0;
  FUN_M69_r4_24000__1b80();
  return in_D;
}


// ===== FUN_M69_r4_24000__2a59 @ M69_r4_24000::2a59 =====

void __h3000 FUN_M69_r4_24000__2a59(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2AB6 ->$2A7D */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  return;
}


// ===== FUN_M69_r4_24000__2a65 @ M69_r4_24000::2a65 =====

void __h3000 FUN_M69_r4_24000__2a65(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2AB6 ->$2A7D */
                    /* inline[API_FDBC]: "5.94..*3" */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  return;
}


// ===== FUN_M69_r4_24000__2a71 @ M69_r4_24000::2a71 =====

void __h3000 FUN_M69_r4_24000__2a71(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2AB6 ->$2A7D */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  return;
}


// ===== FUN_M69_r4_24000__2a7d @ M69_r4_24000::2a7d =====

void __h3000 FUN_M69_r4_24000__2a7d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2AB6 ->$2A7D */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  return;
}


// ===== FUN_M69_r4_24000__2a89 @ M69_r4_24000::2a89 =====

void __h3000 FUN_M69_r4_24000__2a89(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2AB6 ->$2A7D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  return;
}


// ===== FUN_M69_r4_24000__2a95 @ M69_r4_24000::2a95 =====

void __h3000 FUN_M69_r4_24000__2a95(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2AB6 ->$2A7D $2A71 */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  return;
}


// ===== FUN_M69_r4_24000__2ab6 @ M69_r4_24000::2ab6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2ab6(void)

{
  undefined2 in_D;
  
  DAT_7118 = 0;
  DAT_7112 = 0x146;
  DAT_70f6 = &DAT_70b0;
  API_FE76(0x70,0xb0,&PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33);
  DAT_70b0 = DAT_70d8;
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__2b07 @ M69_r4_24000::2b07 =====

void __h3000 FUN_M69_r4_24000__2b07(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2B64 ->$2B2B */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  return;
}


// ===== FUN_M69_r4_24000__2b13 @ M69_r4_24000::2b13 =====

void __h3000 FUN_M69_r4_24000__2b13(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2B64 ->$2B2B */
                    /* inline[API_FDBC]: "5.94..*." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  return;
}


// ===== FUN_M69_r4_24000__2b1f @ M69_r4_24000::2b1f =====

void __h3000 FUN_M69_r4_24000__2b1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2B64 ->$2B2B */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  return;
}


// ===== FUN_M69_r4_24000__2b2b @ M69_r4_24000::2b2b =====

void __h3000 FUN_M69_r4_24000__2b2b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2B64 ->$2B2B */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  return;
}


// ===== FUN_M69_r4_24000__2b37 @ M69_r4_24000::2b37 =====

void __h3000 FUN_M69_r4_24000__2b37(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2B64 ->$2B2B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  return;
}


// ===== FUN_M69_r4_24000__2b43 @ M69_r4_24000::2b43 =====

void __h3000 FUN_M69_r4_24000__2b43(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2B64 ->$2B2B $2B1F */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  return;
}


// ===== FUN_M69_r4_24000__2b64 @ M69_r4_24000::2b64 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2b64(void)

{
  undefined2 in_D;
  
  DAT_7118 = 0;
  DAT_7112 = 0x146;
  DAT_70f6 = &DAT_70b0;
  API_FE76(0x70,0xb0,&PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1);
  DAT_70b0 = DAT_70e0;
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__2bb5 @ M69_r4_24000::2bb5 =====

void __h3000 FUN_M69_r4_24000__2bb5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2C12 ->$2BD9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  return;
}


// ===== FUN_M69_r4_24000__2bc1 @ M69_r4_24000::2bc1 =====

void __h3000 FUN_M69_r4_24000__2bc1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2C12 ->$2BD9 */
                    /* inline[API_FDBC]: "5.94..+." */
  API_FDBC(param_1,param_2,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  return;
}


// ===== FUN_M69_r4_24000__2bcd @ M69_r4_24000::2bcd =====

void __h3000 FUN_M69_r4_24000__2bcd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2C12 ->$2BD9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  return;
}


// ===== FUN_M69_r4_24000__2bd9 @ M69_r4_24000::2bd9 =====

void __h3000 FUN_M69_r4_24000__2bd9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2C12 ->$2BD9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  return;
}


// ===== FUN_M69_r4_24000__2be5 @ M69_r4_24000::2be5 =====

void __h3000 FUN_M69_r4_24000__2be5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2C12 ->$2BD9 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  return;
}


// ===== FUN_M69_r4_24000__2bf1 @ M69_r4_24000::2bf1 =====

void __h3000 FUN_M69_r4_24000__2bf1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2C12 ->$2BD9 $2BCD */
  API_FE1A(param_1,param_2,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  return;
}


// ===== FUN_M69_r4_24000__2c12 @ M69_r4_24000::2c12 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2c12(void)

{
  undefined2 in_D;
  
  DAT_7118 = 3;
  DAT_7112 = "l delay ";
  DAT_70f6 = &DAT_70b6;
  API_FE76(0x70,0xb6,&PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f);
  DAT_70b6 = DAT_70e8;
  FUN_M69_r4_24000__23c5();
  return in_D;
}


// ===== FUN_M69_r4_24000__2c3d @ M69_r4_24000::2c3d =====

undefined2 __h3000 FUN_M69_r4_24000__2c3d(void)

{
  undefined2 in_D;
  
  DAT_7140 = DAT_708c;
  if (DAT_708e <= DAT_708c || (short)DAT_708c < (short)DAT_708e) {
    DAT_7140 = DAT_708e;
  }
  if (DAT_7090 <= DAT_7140 || (short)DAT_7140 < (short)DAT_7090) {
    DAT_7140 = DAT_7090;
  }
  if (DAT_7092 <= DAT_7140 || (short)DAT_7140 < (short)DAT_7092) {
    DAT_7140 = DAT_7092;
  }
  if (DAT_7094 <= DAT_7140 || (short)DAT_7140 < (short)DAT_7094) {
    DAT_7140 = DAT_7094;
  }
  if (DAT_7096 <= DAT_7140 || (short)DAT_7140 < (short)DAT_7096) {
    DAT_7140 = DAT_7096;
  }
  return in_D;
}


// ===== FUN_M69_r4_24000__2c84 @ M69_r4_24000::2c84 =====

void __h3000 FUN_M69_r4_24000__2c84(void)

{
  if (DAT_714a < 1) {
    DAT_7148 = 0xffff;
    FUN_M69_r4_24000__2f2a();
    FUN_M69_r4_24000__2f9e();
    FUN_M69_r4_24000__2c3d();
    FUN_M69_r4_24000__145e();
  }
  else {
    DAT_714a = DAT_714a + -1;
  }
  return;
}


// ===== FUN_M69_r4_24000__2ca8 @ M69_r4_24000::2ca8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2ca8(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_711a = 0;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0446);
  DAT_711a = 0xfffe;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0447);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0448);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0449);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__044a);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__044b);
  return in_D;
}


// ===== FUN_M69_r4_24000__2d25 @ M69_r4_24000::2d25 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2d25(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_711a = 0;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0446);
  DAT_711a = 0x7fff;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0447);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0448);
  DAT_711a = 0x8000;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__0449);
  DAT_711a = 0xfffe;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__044a);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8),(char)DAT_711a,param_1,&UNK_M69_r4_24000__044b);
  return in_D;
}


// ===== FUN_M69_r4_24000__2dae @ M69_r4_24000::2dae =====

short __h3000 FUN_M69_r4_24000__2dae(void)

{
  undefined1 uVar1;
  undefined2 *puVar2;
  undefined2 *puVar3;
  undefined *puVar4;
  
  puVar2 = (undefined2 *)(&DAT_M69_r4_24000__3211 + g_moduleBase);
  DAT_711a = *(undefined2 *)(&DAT_M69_r4_24000__320f + g_moduleBase);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  puVar3 = puVar2 + 1;
  DAT_711a = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  puVar2 = puVar3 + 1;
  DAT_711a = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  puVar3 = puVar2 + 1;
  DAT_711a = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  puVar2 = puVar3 + 1;
  DAT_711a = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711a >> 8));
  puVar3 = puVar2 + 1;
  DAT_711a = *puVar2;
  API_FD20(0);
  puVar4 = &UNK_M69_r4_24000__044b;
  DAT_7118 = API_FD2E((char)((ushort)DAT_711a >> 8));
  uVar1 = (undefined1)((ushort)DAT_7118 >> 8);
  DAT_7108 = puVar3;
  DAT_710a = puVar4;
  DAT_7114 = puVar4;
  DAT_7116 = puVar4 + 0x12;
  DAT_710c = puVar4 + 0x12;
  DAT_70ec = (short)&DAT_708c + CONCAT11(uVar1,(char)DAT_7118 << 1);
  DAT_70f8 = DAT_7118 + 0x57;
  DAT_7104 = &UNK_M69_r4_24000__31f1 + g_moduleBase + CONCAT11(uVar1,(char)DAT_7118 << 1);
  return DAT_7118;
}


// ===== FUN_M69_r4_24000__2e40 @ M69_r4_24000::2e40 =====

short __h3000 FUN_M69_r4_24000__2e40(undefined2 param_1,short param_2)

{
  undefined1 uVar1;
  short in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_7118 = in_D;
  DAT_7108 = param_1;
  DAT_710a = param_2;
  DAT_7114 = param_2;
  DAT_7116 = param_2 + 0x12;
  DAT_710c = param_2 + 0x12;
  DAT_70ec = (short)&DAT_708c + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70f8 = in_D + 0x57;
  DAT_7104 = &UNK_M69_r4_24000__31f1 + g_moduleBase + CONCAT11(uVar1,(char)in_D << 1);
  return in_D;
}


// ===== FUN_M69_r4_24000__2e82 @ M69_r4_24000::2e82 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2e82(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  FUN_M69_r4_24000__310b();
  uVar1 = DAT_7070;
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_M69_r4_24000__2e40(0,0,&UNK_M69_r4_24000__044c,&UNK_M69_r4_24000__0440);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,1,&UNK_M69_r4_24000__044d,&UNK_M69_r4_24000__0441);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,2,&UNK_M69_r4_24000__044e,&UNK_M69_r4_24000__0442);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,3,&UNK_M69_r4_24000__044f,&UNK_M69_r4_24000__0443);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,4,&UNK_M69_r4_24000__0450,&UNK_M69_r4_24000__0444);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,5,&UNK_M69_r4_24000__0451,&UNK_M69_r4_24000__0445);
  FUN_M69_r4_24000__1b80();
  DAT_7070 = *puVar2;
  FUN_M69_r4_24000__317e();
  return in_D;
}


// ===== FUN_M69_r4_24000__2e8e @ M69_r4_24000::2e8e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2e8e(void)

{
  undefined2 in_D;
  short in_U;
  undefined2 *puVar1;
  
  FUN_M69_r4_24000__310b();
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar1 = (undefined2 *)(in_U + -2);
  *(char *)puVar1 = (char)((ushort)DAT_7070 >> 8);
  DAT_7070 = 0xffff;
  FUN_M69_r4_24000__2e40(0,0,&UNK_M69_r4_24000__044c,&UNK_M69_r4_24000__0440);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,1,&UNK_M69_r4_24000__044d,&UNK_M69_r4_24000__0441);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,2,&UNK_M69_r4_24000__044e,&UNK_M69_r4_24000__0442);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,3,&UNK_M69_r4_24000__044f,&UNK_M69_r4_24000__0443);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,4,&UNK_M69_r4_24000__0450,&UNK_M69_r4_24000__0444);
  FUN_M69_r4_24000__1b80();
  FUN_M69_r4_24000__2e40(0,5,&UNK_M69_r4_24000__0451,&UNK_M69_r4_24000__0445);
  FUN_M69_r4_24000__1b80();
  DAT_7070 = *puVar1;
  FUN_M69_r4_24000__317e();
  return in_D;
}


// ===== FUN_M69_r4_24000__2f09 @ M69_r4_24000::2f09 =====

short __h3000 FUN_M69_r4_24000__2f09(undefined2 param_1)

{
  short in_D;
  
  DAT_7118 = in_D;
  DAT_710a = param_1;
  DAT_70ee = (short)&DAT_7080 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70fa = in_D + 99;
  return in_D;
}


// ===== FUN_M69_r4_24000__2f2a @ M69_r4_24000::2f2a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2f2a(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__310b();
  FUN_M69_r4_24000__2f09(0,0,&UNK_M69_r4_24000__0440);
  FUN_M69_r4_24000__1d9a();
  FUN_M69_r4_24000__2f09(0,1,&UNK_M69_r4_24000__0441);
  FUN_M69_r4_24000__1d9a();
  FUN_M69_r4_24000__2f09(0,2,&UNK_M69_r4_24000__0442);
  FUN_M69_r4_24000__1d9a();
  FUN_M69_r4_24000__2f09(0,3,&UNK_M69_r4_24000__0443);
  FUN_M69_r4_24000__1d9a();
  FUN_M69_r4_24000__2f09(0,4,&UNK_M69_r4_24000__0444);
  FUN_M69_r4_24000__1d9a();
  FUN_M69_r4_24000__2f09(0,5,&UNK_M69_r4_24000__0445);
  FUN_M69_r4_24000__1d9a();
  FUN_M69_r4_24000__317e();
  return in_D;
}


// ===== FUN_M69_r4_24000__2f7d @ M69_r4_24000::2f7d =====

short __h3000 FUN_M69_r4_24000__2f7d(undefined2 param_1)

{
  short in_D;
  
  DAT_7118 = in_D;
  DAT_710c = param_1;
  DAT_70f0 = (short)&DAT_7074 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70fc = in_D + 0x5d;
  return in_D;
}


// ===== FUN_M69_r4_24000__2f9e @ M69_r4_24000::2f9e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__2f9e(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__310b();
  FUN_M69_r4_24000__2f7d(0,0,&UNK_M69_r4_24000__0452);
  FUN_M69_r4_24000__1f15();
  FUN_M69_r4_24000__2f7d(0,1,&UNK_M69_r4_24000__0453);
  FUN_M69_r4_24000__1f15();
  FUN_M69_r4_24000__2f7d(0,2,&UNK_M69_r4_24000__0454);
  FUN_M69_r4_24000__1f15();
  FUN_M69_r4_24000__2f7d(0,3,&UNK_M69_r4_24000__0455);
  FUN_M69_r4_24000__1f15();
  FUN_M69_r4_24000__2f7d(0,4,&UNK_M69_r4_24000__0456);
  FUN_M69_r4_24000__1f15();
  FUN_M69_r4_24000__2f7d(0,5,&UNK_M69_r4_24000__0457);
  FUN_M69_r4_24000__1f15();
  FUN_M69_r4_24000__317e();
  return in_D;
}


// ===== FUN_M69_r4_24000__2ff1 @ M69_r4_24000::2ff1 =====

short __h3000 FUN_M69_r4_24000__2ff1(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  short in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_7118 = in_D;
  DAT_710e = param_1;
  DAT_7110 = param_2;
  DAT_70f2 = (short)&DAT_70a4 + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70f4 = (short)&DAT_7098 + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70fe = in_D + 0x6f;
  DAT_7100 = in_D + 0x69;
  return in_D;
}


// ===== FUN_M69_r4_24000__302c @ M69_r4_24000::302c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__302c(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__310b();
  FUN_M69_r4_24000__2ff1(0,0,0x140,0x143);
  FUN_M69_r4_24000__2095();
  FUN_M69_r4_24000__2ff1(0,1,0x141,0x144);
  FUN_M69_r4_24000__2095();
  FUN_M69_r4_24000__2ff1(0,2,FUN_M69_r4_24000__0142,0x145);
  FUN_M69_r4_24000__2095();
  FUN_M69_r4_24000__2ff1(0,3,FUN_M69_r4_24000__0240,0x243);
  FUN_M69_r4_24000__2095();
  FUN_M69_r4_24000__2ff1(0,4,0x241,&BYTE_M69_r4_24000__0244);
  FUN_M69_r4_24000__2095();
  FUN_M69_r4_24000__2ff1(0,5,0x242,&BYTE_M69_r4_24000__0245);
  FUN_M69_r4_24000__2095();
  FUN_M69_r4_24000__317e();
  return in_D;
}


// ===== FUN_M69_r4_24000__3097 @ M69_r4_24000::3097 =====

short __h3000 FUN_M69_r4_24000__3097(undefined2 param_1)

{
  short in_D;
  
  DAT_7118 = in_D;
  DAT_7112 = param_1;
  DAT_70f6 = (short)&DAT_70b0 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_7102 = in_D + 0x75;
  return in_D;
}


// ===== FUN_M69_r4_24000__30b8 @ M69_r4_24000::30b8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_r4_24000__30b8(void)

{
  undefined2 in_D;
  
  FUN_M69_r4_24000__310b();
  FUN_M69_r4_24000__3097(0,0,0x146);
  FUN_M69_r4_24000__23c5();
  FUN_M69_r4_24000__3097(0,1,0x147);
  FUN_M69_r4_24000__23c5();
  FUN_M69_r4_24000__3097(0,2,0x148);
  FUN_M69_r4_24000__23c5();
  FUN_M69_r4_24000__3097(0,3,"l delay ");
  FUN_M69_r4_24000__23c5();
  FUN_M69_r4_24000__3097(0,4," delay ");
  FUN_M69_r4_24000__23c5();
  FUN_M69_r4_24000__3097(0,5,"delay ");
  FUN_M69_r4_24000__23c5();
  FUN_M69_r4_24000__317e();
  return in_D;
}


// ===== FUN_M69_r4_24000__310b @ M69_r4_24000::310b =====

undefined2 __h3000 FUN_M69_r4_24000__310b(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
  uVar1 = DAT_7118;
  *(char *)(in_U + -1) = (char)DAT_7118;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7108;
  *(char *)(in_U + -3) = (char)DAT_7108;
  *(char *)(in_U + -4) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70ec;
  *(char *)(in_U + -5) = (char)DAT_70ec;
  *(char *)(in_U + -6) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70f8;
  *(char *)(in_U + -7) = (char)DAT_70f8;
  *(char *)(in_U + -8) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7114;
  *(char *)(in_U + -9) = (char)DAT_7114;
  *(char *)(in_U + -10) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7116;
  *(char *)(in_U + -0xb) = (char)DAT_7116;
  *(char *)(in_U + -0xc) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7104;
  *(char *)(in_U + -0xd) = (char)DAT_7104;
  *(char *)(in_U + -0xe) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_710a;
  *(char *)(in_U + -0xf) = (char)DAT_710a;
  *(char *)(in_U + -0x10) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70ee;
  *(char *)(in_U + -0x11) = (char)DAT_70ee;
  *(char *)(in_U + -0x12) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70fa;
  *(char *)(in_U + -0x13) = (char)DAT_70fa;
  *(char *)(in_U + -0x14) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_710c;
  *(char *)(in_U + -0x15) = (char)DAT_710c;
  *(char *)(in_U + -0x16) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70f0;
  *(char *)(in_U + -0x17) = (char)DAT_70f0;
  *(char *)(in_U + -0x18) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70fc;
  *(char *)(in_U + -0x19) = (char)DAT_70fc;
  *(char *)(in_U + -0x1a) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_710e;
  *(char *)(in_U + -0x1b) = (char)DAT_710e;
  *(char *)(in_U + -0x1c) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7110;
  *(char *)(in_U + -0x1d) = (char)DAT_7110;
  *(char *)(in_U + -0x1e) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70f2;
  *(char *)(in_U + -0x1f) = (char)DAT_70f2;
  *(char *)(in_U + -0x20) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70fe;
  *(char *)(in_U + -0x21) = (char)DAT_70fe;
  *(char *)(in_U + -0x22) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70f4;
  *(char *)(in_U + -0x23) = (char)DAT_70f4;
  *(char *)(in_U + -0x24) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7100;
  *(char *)(in_U + -0x25) = (char)DAT_7100;
  *(char *)(in_U + -0x26) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7112;
  *(char *)(in_U + -0x27) = (char)DAT_7112;
  *(char *)(in_U + -0x28) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_70f6;
  *(char *)(in_U + -0x29) = (char)DAT_70f6;
  *(char *)(in_U + -0x2a) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7102;
  *(char *)(in_U + -0x2b) = (char)DAT_7102;
  *(char *)(in_U + -0x2c) = (char)((ushort)uVar1 >> 8);
  return in_D;
}


// ===== FUN_M69_r4_24000__317e @ M69_r4_24000::317e =====

undefined2 __h3000 FUN_M69_r4_24000__317e(void)

{
  undefined2 in_D;
  undefined2 *in_U;
  
  DAT_7102 = *in_U;
  DAT_70f6 = in_U[1];
  DAT_7112 = in_U[2];
  DAT_7100 = in_U[3];
  DAT_70f4 = in_U[4];
  DAT_70fe = in_U[5];
  DAT_70f2 = in_U[6];
  DAT_7110 = in_U[7];
  DAT_710e = in_U[8];
  DAT_70fc = in_U[9];
  DAT_70f0 = in_U[10];
  DAT_710c = in_U[0xb];
  DAT_70fa = in_U[0xc];
  DAT_70ee = in_U[0xd];
  DAT_710a = in_U[0xe];
  DAT_7104 = in_U[0xf];
  DAT_7116 = in_U[0x11];
  DAT_70f8 = in_U[0x12];
  DAT_70ec = in_U[0x13];
  DAT_7108 = in_U[0x14];
  DAT_7118 = in_U[0x15];
  return in_D;
}


// ===== MODULE_6D_01_entry @ M69_r4_24000::32a6 =====

undefined2 __h3000 MODULE_6D_01_entry(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 *puVar2;
  
                    /* inline[API_FC60]: $32AA */
  uVar1 = ModuleSetBase();
  FUN_M69_r4_24000__0070();
  FUN_M69_r4_24000__002c();
  FUN_M69_r4_24000__2497();
  MODULE_69_02_entry();
  DAT_60da = 3;
  API_FE38();
  if (((DAT_600a != 'i') && (DAT_600a != 'n')) && (DAT_600a != 'm')) {
    FUN_a2f1();
    FUN_M69_r4_24000__0180();
  }
  if (DAT_600a != 'm') {
    FUN_M69_r4_24000__01be();
  }
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)DAT_7070 >> 8);
  DAT_7070 = 0xffff;
  FUN_M69_r4_24000__2ca8();
  FUN_M69_r4_24000__2891();
  FUN_M69_r4_24000__196b();
  DAT_7070 = *puVar2;
  FUN_M69_r4_24000__145e();
  FUN_M69_r4_24000__1833();
  FUN_M69_r4_24000__2ab6();
  FUN_M69_r4_24000__2c84();
  FUN_M69_r4_24000__03d7();
  DAT_6105 = 1;
  DAT_6106 = 0x43;
  if (((DAT_600a != 'i') && (DAT_600a != 'n')) && (DAT_600a != 'm')) {
    API_FD20(0xf);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M69_r4_24000__0c2b();
  API_FE10();
  return uVar1;
}


// ===== MODULE_6E_01_entry @ M69_r4_24000::33e5 =====

undefined2 __h3000 MODULE_6E_01_entry(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 *puVar2;
  
                    /* inline[API_FC60]: $33E9 */
  uVar1 = ModuleSetBase();
  FUN_M69_r4_24000__0070();
  FUN_M69_r4_24000__002c();
  FUN_M69_r4_24000__2549();
  FUN_M69_r4_24000__25f7();
  MODULE_69_02_entry();
  DAT_60da = 3;
  API_FE38();
  if (((DAT_600a != 'i') && (DAT_600a != 'n')) && (DAT_600a != 'm')) {
    FUN_a2f1();
    FUN_M69_r4_24000__0180();
  }
  FUN_M69_r4_24000__01f6();
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)DAT_7070 >> 8);
  DAT_7070 = 0xffff;
  FUN_M69_r4_24000__2d25();
  FUN_M69_r4_24000__2942();
  FUN_M69_r4_24000__29fc();
  FUN_M69_r4_24000__196b();
  DAT_7070 = *puVar2;
  FUN_M69_r4_24000__145e();
  FUN_M69_r4_24000__1833();
  FUN_M69_r4_24000__2b64();
  FUN_M69_r4_24000__2c12();
  FUN_M69_r4_24000__2c84();
  FUN_M69_r4_24000__0240();
  DAT_6105 = 1;
  DAT_6106 = 0x5b;
  if (((DAT_600a != 'i') && (DAT_600a != 'n')) && (DAT_600a != 'm')) {
    API_FD20(0xf);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M69_r4_24000__0cc3();
  API_FE10();
  return uVar1;
}


// ===== MODULE_69_01_entry @ M69_r4_24000::3552 =====

undefined2 __h3000 MODULE_69_01_entry(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 *puVar2;
  
                    /* inline[API_FC60]: $3556 */
  uVar1 = ModuleSetBase();
  FUN_M69_r4_24000__0070();
  FUN_M69_r4_24000__002c();
  MODULE_69_02_entry();
  FUN_M69_r4_24000__2497();
  DAT_60da = 4;
  API_FE38();
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x2c);
  DAT_7148 = 0xffff;
  if (((DAT_600a != 'i') && (DAT_600a != 'm')) && (DAT_600a != 'n')) {
    FUN_a2f1();
    FUN_M69_r4_24000__0180();
  }
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)DAT_7070 >> 8);
  DAT_7070 = 0xffff;
  FUN_M69_r4_24000__2dae();
  FUN_M69_r4_24000__13a6();
  FUN_M69_r4_24000__196b();
  FUN_M69_r4_24000__1833();
  FUN_M69_r4_24000__162c();
  FUN_M69_r4_24000__1745();
  FUN_M69_r4_24000__124a();
  FUN_M69_r4_24000__1301();
  FUN_M69_r4_24000__145e();
  DAT_7070 = *puVar2;
  FUN_M69_r4_24000__2c84();
  FUN_M69_r4_24000__050b();
  DAT_6105 = 1;
  DAT_6106 = 0x87;
  if (((DAT_600a != 'i') && (DAT_600a != 'm')) && (DAT_600a != 'n')) {
    API_FD20(0xf);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M69_r4_24000__0ad6();
  API_FE10();
  return uVar1;
}


// ===== MODULE_6A_01_entry @ M69_r4_24000::36ad =====

undefined2 __h3000 MODULE_6A_01_entry(void)

{
  undefined2 uVar1;
  short in_U;
  undefined2 *puVar2;
  
                    /* inline[API_FC60]: $36B1 */
  uVar1 = ModuleSetBase();
  FUN_M69_r4_24000__0070();
  FUN_M69_r4_24000__002c();
  MODULE_69_02_entry();
  FUN_M69_r4_24000__2497();
  DAT_60da = 3;
  API_FE38();
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x2c);
  DAT_7148 = 0xffff;
  if (DAT_600a != 'j') {
    FUN_a2f1();
    FUN_M69_r4_24000__0142();
  }
  *(char *)(in_U + -1) = (char)DAT_7070;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)DAT_7070 >> 8);
  DAT_7070 = 0xffff;
  FUN_M69_r4_24000__196b();
  FUN_M69_r4_24000__2dae();
  FUN_M69_r4_24000__13a6();
  FUN_M69_r4_24000__115d();
  FUN_M69_r4_24000__145e();
  FUN_M69_r4_24000__124a();
  FUN_M69_r4_24000__1301();
  DAT_7070 = *puVar2;
  FUN_M69_r4_24000__2c84();
  FUN_M69_r4_24000__0835();
  DAT_6105 = 1;
  DAT_6106 = 0x69;
  if (DAT_600a != 'j') {
    API_FD20(0xf);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M69_r4_24000__09f1();
  API_FE10();
  return uVar1;
}


