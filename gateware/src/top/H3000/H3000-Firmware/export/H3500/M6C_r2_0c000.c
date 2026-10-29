// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M6C_r2_0c000 M6C_r2_0c000::0000-M6C_r2_0c000::3fff, 290 functions
// Bank r2_0c000 (module id 6C, sub 00)

// ===== MODULE_6C_01_entry @ M6C_r2_0c000::00f0 =====

undefined2 __h3000 MODULE_6C_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $00F4 */
  uVar1 = ModuleSetBase();
  DAT_70da = 0;
  DAT_70de = 0xffff;
  DAT_70dc = 0xffff;
                    /* inline[API_FC62]: $6011 */
  ModuleStorePtr(10);
  FUN_M6C_r2_0c000__018d();
  FUN_M6C_r2_0c000__01b9();
  FUN_M6C_r2_0c000__027e();
  DAT_60da = 3;
  API_FE38();
  if (DAT_600a != 'l') {
    FUN_a2f1();
    FUN_M6C_r2_0c000__0157();
  }
  FUN_M6C_r2_0c000__02a0();
  FUN_M6C_r2_0c000__02ba();
  DAT_6105 = 1;
  DAT_6106 = 0xa0;
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M6C_r2_0c000__0645();
  API_FE10();
  return uVar1;
}


// ===== FUN_M6C_r2_0c000__0157 @ M6C_r2_0c000::0157 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0157(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  stack0xfff9 = CONCAT12(param_2,param_3);
  _auStack_8 = CONCAT13(param_1,stack0xfff9);
  API_FC58(param_1,0);
  DspLoadProgram(extraout_A,1,0x110);
  uVar1 = extraout_A_00;
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A_00,2,0x111);
    uVar1 = extraout_A_01;
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_01,3,0x112);
      uVar1 = extraout_A_02;
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


// ===== FUN_M6C_r2_0c000__018d @ M6C_r2_0c000::018d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M6C_r2_0c000__018d(void)

{
  undefined2 in_D;
  
  DAT_7032 = 0;
  DAT_703a = 0;
  DAT_70ce = 0;
  _DAT_706e = 0;
  DAT_7076 = 0;
  DAT_705a = 0;
  DAT_7068 = 0;
  DAT_70d6 = 0;
  DAT_7042 = 0;
  DAT_7048 = 0;
  DAT_704e = 0;
  DAT_7054 = 0;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__01b9 @ M6C_r2_0c000::01b9 =====

undefined2 __h3000 FUN_M6C_r2_0c000__01b9(void)

{
  undefined2 in_D;
  
                    /* inline[API_FE04]: 19:40 1A:46 1B:4C 1C:52 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 45:58 3D:30 3F:38 49:74 47:6C 53:5E 4B:36 4D:3E 57:7A */
  LoadParamsScaled();
                    /* inline[API_FE08]: 55:72 88:C2 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 8A:7C 8B:7E 8C:80 8D:82 8E:84 8F:86 90:88 91:8A 92:8C 93:8E
                       94:90 95:92 59:66 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 5A:94 5C:96 5E:98 60:9A 62:9C 64:9E 66:A0 68:A2 6A:A4 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 6C:A6 6E:A8 70:AA 96:C4 98:C6 9A:C8 9C:CA 72:AC 74:AE */
  LoadParamsScaled();
                    /* inline[API_FE08]: 76:B0 78:B2 7A:B4 7C:B6 7E:B8 80:BA 82:BC 84:BE 86:C0 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 41:CC 9E:D4 43:D2 */
  LoadParamsScaled();
  DAT_7060 = 0;
  DAT_7062 = 0;
  DAT_7064 = 0;
  DAT_70da = 0x7fff;
  DAT_70e0 = 300;
  DAT_70dc = 0xffff;
  DAT_70de = 0xffff;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__027e @ M6C_r2_0c000::027e =====

undefined2 __h3000 FUN_M6C_r2_0c000__027e(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M6C_r2_0c000__256a();
  FUN_M6C_r2_0c000__25e5();
  FUN_M6C_r2_0c000__2660();
  FUN_M6C_r2_0c000__26db();
  FUN_M6C_r2_0c000__2426();
  FUN_M6C_r2_0c000__24d4();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__02a0 @ M6C_r2_0c000::02a0 =====

undefined2 __h3000 FUN_M6C_r2_0c000__02a0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M6C_r2_0c000__1b6b();
  FUN_M6C_r2_0c000__0d79();
  FUN_M6C_r2_0c000__0cc7();
  FUN_M6C_r2_0c000__27f0();
  FUN_M6C_r2_0c000__0c09();
  FUN_M6C_r2_0c000__0f75();
  FUN_M6C_r2_0c000__0e33();
  return uStack_8;
}


// ===== FUN_M6C_r2_0c000__02ba @ M6C_r2_0c000::02ba =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M6C_r2_0c000__02ba(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 "diffusor" 21 $1B3E $1B4A */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " delay  " 25 $0BDC $0BE8 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "panning " 29 $0F02 $0F0E */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "feedback" 2D $0C9A $0CA6 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 " mix 1  " 31 $23F9 $2405 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 " mix 2  " 35 $24A7 $24B3 */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M6C_r2_0c000__033f;
  _DAT_60f7 = 0x37;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__03b8 @ M6C_r2_0c000::03b8 =====

void __h3000 FUN_M6C_r2_0c000__03b8(void)

{
  FUN_M6C_r2_0c000__2483();
  FUN_M6C_r2_0c000__067e();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__03c3 @ M6C_r2_0c000::03c3 =====

void __h3000 FUN_M6C_r2_0c000__03c3(void)

{
  FUN_M6C_r2_0c000__0bb8();
  FUN_M6C_r2_0c000__0645();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__03ce @ M6C_r2_0c000::03ce =====

void __h3000 FUN_M6C_r2_0c000__03ce(void)

{
  FUN_M6C_r2_0c000__1b1a();
  FUN_M6C_r2_0c000__0645();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__03d9 @ M6C_r2_0c000::03d9 =====

void __h3000 FUN_M6C_r2_0c000__03d9(void)

{
  FUN_M6C_r2_0c000__0ef6();
  FUN_M6C_r2_0c000__0645();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__03e4 @ M6C_r2_0c000::03e4 =====

void __h3000 FUN_M6C_r2_0c000__03e4(void)

{
  FUN_M6C_r2_0c000__0df3();
  FUN_M6C_r2_0c000__06b7();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__03ef @ M6C_r2_0c000::03ef =====

void __h3000 FUN_M6C_r2_0c000__03ef(void)

{
  FUN_M6C_r2_0c000__0fad();
  FUN_M6C_r2_0c000__071b();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__03fa @ M6C_r2_0c000::03fa =====

void __h3000 FUN_M6C_r2_0c000__03fa(void)

{
  FUN_M6C_r2_0c000__136e();
  FUN_M6C_r2_0c000__071b();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__0405 @ M6C_r2_0c000::0405 =====

void __h3000 FUN_M6C_r2_0c000__0405(void)

{
  FUN_M6C_r2_0c000__16af();
  FUN_M6C_r2_0c000__071b();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__0410 @ M6C_r2_0c000::0410 =====

void __h3000 FUN_M6C_r2_0c000__0410(void)

{
  FUN_M6C_r2_0c000__1c86();
  FUN_M6C_r2_0c000__07b1();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__041b @ M6C_r2_0c000::041b =====

void __h3000 FUN_M6C_r2_0c000__041b(void)

{
  FUN_M6C_r2_0c000__1c8d();
  FUN_M6C_r2_0c000__07b1();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__0426 @ M6C_r2_0c000::0426 =====

void __h3000 FUN_M6C_r2_0c000__0426(void)

{
  FUN_M6C_r2_0c000__1c94();
  FUN_M6C_r2_0c000__07b1();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__0431 @ M6C_r2_0c000::0431 =====

void __h3000 FUN_M6C_r2_0c000__0431(void)

{
  FUN_M6C_r2_0c000__1c9b();
  FUN_M6C_r2_0c000__07b1();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__043c @ M6C_r2_0c000::043c =====

void __h3000 FUN_M6C_r2_0c000__043c(void)

{
  FUN_M6C_r2_0c000__1ca2();
  FUN_M6C_r2_0c000__07ea();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__0447 @ M6C_r2_0c000::0447 =====

void __h3000 FUN_M6C_r2_0c000__0447(void)

{
  FUN_M6C_r2_0c000__1ca9();
  FUN_M6C_r2_0c000__07ea();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__0452 @ M6C_r2_0c000::0452 =====

void __h3000 FUN_M6C_r2_0c000__0452(void)

{
  FUN_M6C_r2_0c000__1cb0();
  FUN_M6C_r2_0c000__07ea();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__045d @ M6C_r2_0c000::045d =====

void __h3000 FUN_M6C_r2_0c000__045d(void)

{
  FUN_M6C_r2_0c000__1cb7();
  FUN_M6C_r2_0c000__07ea();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__0468 @ M6C_r2_0c000::0468 =====

void __h3000 FUN_M6C_r2_0c000__0468(void)

{
  FUN_M6C_r2_0c000__1cbe();
  FUN_M6C_r2_0c000__0823();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__0473 @ M6C_r2_0c000::0473 =====

void __h3000 FUN_M6C_r2_0c000__0473(void)

{
  FUN_M6C_r2_0c000__1cc5();
  FUN_M6C_r2_0c000__0823();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__047e @ M6C_r2_0c000::047e =====

void __h3000 FUN_M6C_r2_0c000__047e(void)

{
  FUN_M6C_r2_0c000__1ccc();
  FUN_M6C_r2_0c000__0823();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__0489 @ M6C_r2_0c000::0489 =====

void __h3000 FUN_M6C_r2_0c000__0489(void)

{
  FUN_M6C_r2_0c000__1cd3();
  FUN_M6C_r2_0c000__0823();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__0494 @ M6C_r2_0c000::0494 =====

void __h3000 FUN_M6C_r2_0c000__0494(void)

{
  FUN_M6C_r2_0c000__1e86();
  FUN_M6C_r2_0c000__0880();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__049f @ M6C_r2_0c000::049f =====

void __h3000 FUN_M6C_r2_0c000__049f(void)

{
  FUN_M6C_r2_0c000__1e8d();
  FUN_M6C_r2_0c000__0880();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__04aa @ M6C_r2_0c000::04aa =====

void __h3000 FUN_M6C_r2_0c000__04aa(void)

{
  FUN_M6C_r2_0c000__1e94();
  FUN_M6C_r2_0c000__0880();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__04b5 @ M6C_r2_0c000::04b5 =====

void __h3000 FUN_M6C_r2_0c000__04b5(void)

{
  FUN_M6C_r2_0c000__1e9b();
  FUN_M6C_r2_0c000__0880();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__04c0 @ M6C_r2_0c000::04c0 =====

void __h3000 FUN_M6C_r2_0c000__04c0(void)

{
  FUN_M6C_r2_0c000__1ea2();
  FUN_M6C_r2_0c000__08b9();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__04cb @ M6C_r2_0c000::04cb =====

void __h3000 FUN_M6C_r2_0c000__04cb(void)

{
  FUN_M6C_r2_0c000__1ea9();
  FUN_M6C_r2_0c000__08b9();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__04d6 @ M6C_r2_0c000::04d6 =====

void __h3000 FUN_M6C_r2_0c000__04d6(void)

{
  FUN_M6C_r2_0c000__1eb0();
  FUN_M6C_r2_0c000__08b9();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__04e1 @ M6C_r2_0c000::04e1 =====

void __h3000 FUN_M6C_r2_0c000__04e1(void)

{
  FUN_M6C_r2_0c000__1eb7();
  FUN_M6C_r2_0c000__08b9();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__04ec @ M6C_r2_0c000::04ec =====

void __h3000 FUN_M6C_r2_0c000__04ec(void)

{
  FUN_M6C_r2_0c000__1ebe();
  FUN_M6C_r2_0c000__08f2();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__04f7 @ M6C_r2_0c000::04f7 =====

void __h3000 FUN_M6C_r2_0c000__04f7(void)

{
  FUN_M6C_r2_0c000__1ec5();
  FUN_M6C_r2_0c000__08f2();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__0502 @ M6C_r2_0c000::0502 =====

void __h3000 FUN_M6C_r2_0c000__0502(void)

{
  FUN_M6C_r2_0c000__1ecc();
  FUN_M6C_r2_0c000__08f2();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__050d @ M6C_r2_0c000::050d =====

void __h3000 FUN_M6C_r2_0c000__050d(void)

{
  FUN_M6C_r2_0c000__1ed3();
  FUN_M6C_r2_0c000__08f2();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__0518 @ M6C_r2_0c000::0518 =====

void __h3000 FUN_M6C_r2_0c000__0518(void)

{
  FUN_M6C_r2_0c000__2073();
  FUN_M6C_r2_0c000__094f();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__0523 @ M6C_r2_0c000::0523 =====

void __h3000 FUN_M6C_r2_0c000__0523(void)

{
  FUN_M6C_r2_0c000__207a();
  FUN_M6C_r2_0c000__094f();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__052e @ M6C_r2_0c000::052e =====

void __h3000 FUN_M6C_r2_0c000__052e(void)

{
  FUN_M6C_r2_0c000__2081();
  FUN_M6C_r2_0c000__094f();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__0539 @ M6C_r2_0c000::0539 =====

void __h3000 FUN_M6C_r2_0c000__0539(void)

{
  FUN_M6C_r2_0c000__2088();
  FUN_M6C_r2_0c000__094f();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__0544 @ M6C_r2_0c000::0544 =====

void __h3000 FUN_M6C_r2_0c000__0544(void)

{
  FUN_M6C_r2_0c000__208f();
  FUN_M6C_r2_0c000__0988();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__054f @ M6C_r2_0c000::054f =====

void __h3000 FUN_M6C_r2_0c000__054f(void)

{
  FUN_M6C_r2_0c000__2096();
  FUN_M6C_r2_0c000__0988();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__055a @ M6C_r2_0c000::055a =====

void __h3000 FUN_M6C_r2_0c000__055a(void)

{
  FUN_M6C_r2_0c000__209d();
  FUN_M6C_r2_0c000__0988();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__0565 @ M6C_r2_0c000::0565 =====

void __h3000 FUN_M6C_r2_0c000__0565(void)

{
  FUN_M6C_r2_0c000__20a4();
  FUN_M6C_r2_0c000__0988();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__0570 @ M6C_r2_0c000::0570 =====

void __h3000 FUN_M6C_r2_0c000__0570(void)

{
  FUN_M6C_r2_0c000__20ab();
  FUN_M6C_r2_0c000__09c1();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__057b @ M6C_r2_0c000::057b =====

void __h3000 FUN_M6C_r2_0c000__057b(void)

{
  FUN_M6C_r2_0c000__20b2();
  FUN_M6C_r2_0c000__09c1();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__0586 @ M6C_r2_0c000::0586 =====

void __h3000 FUN_M6C_r2_0c000__0586(void)

{
  FUN_M6C_r2_0c000__20b9();
  FUN_M6C_r2_0c000__09c1();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__0591 @ M6C_r2_0c000::0591 =====

void __h3000 FUN_M6C_r2_0c000__0591(void)

{
  FUN_M6C_r2_0c000__20c0();
  FUN_M6C_r2_0c000__09c1();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__059c @ M6C_r2_0c000::059c =====

void __h3000 FUN_M6C_r2_0c000__059c(void)

{
  FUN_M6C_r2_0c000__2229();
  FUN_M6C_r2_0c000__0a1e();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__05a7 @ M6C_r2_0c000::05a7 =====

void __h3000 FUN_M6C_r2_0c000__05a7(void)

{
  FUN_M6C_r2_0c000__2230();
  FUN_M6C_r2_0c000__0a1e();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__05b2 @ M6C_r2_0c000::05b2 =====

void __h3000 FUN_M6C_r2_0c000__05b2(void)

{
  FUN_M6C_r2_0c000__2237();
  FUN_M6C_r2_0c000__0a1e();
  API_FE14();
  return;
}


// ===== FUN_M6C_r2_0c000__05bd @ M6C_r2_0c000::05bd =====

void __h3000 FUN_M6C_r2_0c000__05bd(void)

{
  FUN_M6C_r2_0c000__223e();
  FUN_M6C_r2_0c000__0a1e();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__05c8 @ M6C_r2_0c000::05c8 =====

void __h3000 FUN_M6C_r2_0c000__05c8(void)

{
  FUN_M6C_r2_0c000__0c76();
  FUN_M6C_r2_0c000__0645();
  API_FE16();
  return;
}


// ===== FUN_M6C_r2_0c000__05d3 @ M6C_r2_0c000::05d3 =====

void __h3000 FUN_M6C_r2_0c000__05d3(void)

{
  FUN_M6C_r2_0c000__0d40();
  FUN_M6C_r2_0c000__06b7();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__05de @ M6C_r2_0c000::05de =====

void __h3000 FUN_M6C_r2_0c000__05de(void)

{
  FUN_M6C_r2_0c000__2531();
  FUN_M6C_r2_0c000__0a7b();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__05e9 @ M6C_r2_0c000::05e9 =====

void __h3000 FUN_M6C_r2_0c000__05e9(void)

{
  FUN_M6C_r2_0c000__25ac();
  FUN_M6C_r2_0c000__0a7b();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__05f4 @ M6C_r2_0c000::05f4 =====

void __h3000 FUN_M6C_r2_0c000__05f4(void)

{
  FUN_M6C_r2_0c000__2627();
  FUN_M6C_r2_0c000__0aad();
  API_FE10();
  return;
}


// ===== FUN_M6C_r2_0c000__05ff @ M6C_r2_0c000::05ff =====

void __h3000 FUN_M6C_r2_0c000__05ff(void)

{
  FUN_M6C_r2_0c000__26a2();
  FUN_M6C_r2_0c000__0aad();
  API_FE12();
  return;
}


// ===== FUN_M6C_r2_0c000__060a @ M6C_r2_0c000::060a =====

void __h3000 FUN_M6C_r2_0c000__060a(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M6C_r2_0c000__0645 @ M6C_r2_0c000::0645 =====

void __h3000 FUN_M6C_r2_0c000__0645(void)

{
                    /* inline[API_FE02]: "m delay " "diffusor" " width  " "feedback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0BAC ->$1B0E ->$0EDE ->$0C6A ->$067E ->$067E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__067e @ M6C_r2_0c000::067e =====

void __h3000 FUN_M6C_r2_0c000__067e(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$23C9 ->$2477 ->$0A7B ->$06B7 ->$0645 ->$0645 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__06b7 @ M6C_r2_0c000::06b7 =====

void __h3000 FUN_M6C_r2_0c000__06b7(void)

{
                    /* inline[API_FE02]: "st/mono " " fb tap " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0DDB ->$0D34 ->$0ADF ->$067E ->$06E9 ->$06E9 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__06e9 @ M6C_r2_0c000::06e9 =====

void __h3000 FUN_M6C_r2_0c000__06e9(void)

{
                    /* inline[API_FE02]: "quickset" " tedium " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$071B ->$0754 ->$0ADF ->$067E ->$06B7 ->$06B7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__071b @ M6C_r2_0c000::071b =====

void __h3000 FUN_M6C_r2_0c000__071b(void)

{
                    /* inline[API_FE02]: "spacing " "weights " " pans   " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0FC2 ->$1383 ->$16C4 ->$06E9 ->$071B ->$071B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0754 @ M6C_r2_0c000::0754 =====

void __h3000 FUN_M6C_r2_0c000__0754(void)

{
                    /* inline[API_FE02]: "tapdelay" "taplevel" "pan taps" "apdelays" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$07B1 ->$0880 ->$094F ->$0A1E ->$078D ->$078D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__078d @ M6C_r2_0c000::078d =====

void __h3000 FUN_M6C_r2_0c000__078d(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$06E9 ->$0754 ->$0754 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__07b1 @ M6C_r2_0c000::07b1 =====

void __h3000 FUN_M6C_r2_0c000__07b1(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D08 ->$1D0F ->$1D16 ->$1D1D ->$07EA ->$085C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__07ea @ M6C_r2_0c000::07ea =====

void __h3000 FUN_M6C_r2_0c000__07ea(void)

{
                    /* inline[API_FE02]: "delay 5 " "delay 6 " "delay 7 " "delay 8 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D24 ->$1D2B ->$1D32 ->$1D39 ->$0823 ->$07B1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0823 @ M6C_r2_0c000::0823 =====

void __h3000 FUN_M6C_r2_0c000__0823(void)

{
                    /* inline[API_FE02]: "delay 9 " "delay 10" "delay 11" "delay 12" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D40 ->$1D47 ->$1D4E ->$1D55 ->$085C ->$07EA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__085c @ M6C_r2_0c000::085c =====

void __h3000 FUN_M6C_r2_0c000__085c(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$07B1 ->$0823 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0880 @ M6C_r2_0c000::0880 =====

void __h3000 FUN_M6C_r2_0c000__0880(void)

{
                    /* inline[API_FE02]: " tap 1  " " tap 2  " " tap 3  " " tap 4  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1F08 ->$1F0F ->$1F16 ->$1F1D ->$08B9 ->$092B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__08b9 @ M6C_r2_0c000::08b9 =====

void __h3000 FUN_M6C_r2_0c000__08b9(void)

{
                    /* inline[API_FE02]: " tap 5  " " tap 6  " " tap 7  " " tap 8  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1F24 ->$1F2B ->$1F32 ->$1F39 ->$08F2 ->$0880 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__08f2 @ M6C_r2_0c000::08f2 =====

void __h3000 FUN_M6C_r2_0c000__08f2(void)

{
                    /* inline[API_FE02]: " tap 9  " " tap 10 " " tap 11 " " tap 12 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1F40 ->$1F47 ->$1F4E ->$1F55 ->$092B ->$08B9 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__092b @ M6C_r2_0c000::092b =====

void __h3000 FUN_M6C_r2_0c000__092b(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$0880 ->$08F2 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__094f @ M6C_r2_0c000::094f =====

void __h3000 FUN_M6C_r2_0c000__094f(void)

{
                    /* inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$20F5 ->$20FC ->$2103 ->$210A ->$0988 ->$09FA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0988 @ M6C_r2_0c000::0988 =====

void __h3000 FUN_M6C_r2_0c000__0988(void)

{
                    /* inline[API_FE02]: " pan 5  " " pan 6  " " pan 7  " " pan 8  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2111 ->$2118 ->$211F ->$2126 ->$09C1 ->$094F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__09c1 @ M6C_r2_0c000::09c1 =====

void __h3000 FUN_M6C_r2_0c000__09c1(void)

{
                    /* inline[API_FE02]: " pan 9  " " pan 10 " " pan 11 " " pan 12 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$212D ->$2134 ->$213B ->$2142 ->$09FA ->$0988 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__09fa @ M6C_r2_0c000::09fa =====

void __h3000 FUN_M6C_r2_0c000__09fa(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$094F ->$09C1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0a1e @ M6C_r2_0c000::0a1e =====

void __h3000 FUN_M6C_r2_0c000__0a1e(void)

{
                    /* inline[API_FE02]: "apdelay1" "apdelay2" "apdelay3" "apdelay4" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2273 ->$227A ->$2281 ->$2288 ->$0A57 ->$0A57 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0a57 @ M6C_r2_0c000::0a57 =====

void __h3000 FUN_M6C_r2_0c000__0a57(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$0A1E ->$0A1E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0a7b @ M6C_r2_0c000::0a7b =====

void __h3000 FUN_M6C_r2_0c000__0a7b(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2525 ->$25A0 ->$0ADF ->$067E ->$0AAD ->$0AAD */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0aad @ M6C_r2_0c000::0aad =====

void __h3000 FUN_M6C_r2_0c000__0aad(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$261B ->$2696 ->$0ADF ->$067E ->$0A7B ->$0A7B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M6C_r2_0c000__0adf @ M6C_r2_0c000::0adf =====

void __h3000 FUN_M6C_r2_0c000__0adf(void)

{
  return;
}


// ===== FUN_M6C_r2_0c000__0ae0 @ M6C_r2_0c000::0ae0 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0ae0(void)

{
  bool bVar1;
  undefined2 in_D;
  
  if (DAT_70de == 0) {
    DAT_70da = DAT_70da - DAT_70e0;
    if (DAT_70da < 1) {
      DAT_70da = 0;
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70da >> 8));
      FUN_M6C_r2_0c000__2742();
      DAT_70de = -1;
      DAT_70dc = 0;
    }
    else {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70da >> 8));
    }
  }
  else if (DAT_70dc == 0) {
    bVar1 = SCARRY2(DAT_70da,DAT_70e0);
    DAT_70da = DAT_70da + DAT_70e0;
    if (bVar1) {
      DAT_70da = 0x7fff;
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70da >> 8));
      DAT_70dc = -1;
    }
    else {
      API_FD20(0);
      API_FD2E((char)((ushort)DAT_70da >> 8));
    }
  }
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0bac @ M6C_r2_0c000::0bac =====

void __h3000 FUN_M6C_r2_0c000__0bac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0C09 ->$0BD0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86);
  return;
}


// ===== FUN_M6C_r2_0c000__0bb8 @ M6C_r2_0c000::0bb8 =====

void __h3000 FUN_M6C_r2_0c000__0bb8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0C09 ->$0BD0 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86);
  return;
}


// ===== FUN_M6C_r2_0c000__0bc4 @ M6C_r2_0c000::0bc4 =====

void __h3000 FUN_M6C_r2_0c000__0bc4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0C09 ->$0BD0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86);
  return;
}


// ===== FUN_M6C_r2_0c000__0bd0 @ M6C_r2_0c000::0bd0 =====

void __h3000 FUN_M6C_r2_0c000__0bd0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0C09 ->$0BD0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86);
  return;
}


// ===== FUN_M6C_r2_0c000__0bdc @ M6C_r2_0c000::0bdc =====

void __h3000 FUN_M6C_r2_0c000__0bdc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0C09 ->$0BD0 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86);
  return;
}


// ===== FUN_M6C_r2_0c000__0be8 @ M6C_r2_0c000::0be8 =====

void __h3000 FUN_M6C_r2_0c000__0be8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0C09 ->$0BD0 $0BC4 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86);
  return;
}


// ===== FUN_M6C_r2_0c000__0c09 @ M6C_r2_0c000::0c09 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0c09(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_7070;
  *(char *)(in_U + -1) = (char)DAT_7070;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 1;
  API_FCEE();
  uVar1 = DAT_7070;
  DAT_701c = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_7070;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_70e4 = *psVar2 + DAT_701c;
  DAT_70de = 0;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0c6a @ M6C_r2_0c000::0c6a =====

void __h3000 FUN_M6C_r2_0c000__0c6a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0CC7 ->$0C8E */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44);
  return;
}


// ===== FUN_M6C_r2_0c000__0c76 @ M6C_r2_0c000::0c76 =====

void __h3000 FUN_M6C_r2_0c000__0c76(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0CC7 ->$0C8E */
                    /* inline[API_FDBC]: "5.94...D" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44);
  return;
}


// ===== FUN_M6C_r2_0c000__0c82 @ M6C_r2_0c000::0c82 =====

void __h3000 FUN_M6C_r2_0c000__0c82(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0CC7 ->$0C8E */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44);
  return;
}


// ===== FUN_M6C_r2_0c000__0c8e @ M6C_r2_0c000::0c8e =====

void __h3000 FUN_M6C_r2_0c000__0c8e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0CC7 ->$0C8E */
  API_FE6E(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44);
  return;
}


// ===== FUN_M6C_r2_0c000__0c9a @ M6C_r2_0c000::0c9a =====

void __h3000 FUN_M6C_r2_0c000__0c9a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0CC7 ->$0C8E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44);
  return;
}


// ===== FUN_M6C_r2_0c000__0ca6 @ M6C_r2_0c000::0ca6 =====

void __h3000 FUN_M6C_r2_0c000__0ca6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0CC7 ->$0C8E $0C82 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44);
  return;
}


// ===== FUN_M6C_r2_0c000__0cc7 @ M6C_r2_0c000::0cc7 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0cc7(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_70d0;
  *(char *)(in_U + -1) = (char)DAT_70d0;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  uVar1 = DAT_70d0;
  DAT_701c = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_70d0;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_701c = *psVar2 + DAT_701c;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8));
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0d34 @ M6C_r2_0c000::0d34 =====

void __h3000 FUN_M6C_r2_0c000__0d34(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0D79 ->$0D58 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0d79_M6C_r2_0c000__0d0e);
  return;
}


// ===== FUN_M6C_r2_0c000__0d40 @ M6C_r2_0c000::0d40 =====

void __h3000 FUN_M6C_r2_0c000__0d40(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0D79 ->$0D58 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0d79_M6C_r2_0c000__0d0e);
  return;
}


// ===== FUN_M6C_r2_0c000__0d4c @ M6C_r2_0c000::0d4c =====

void __h3000 FUN_M6C_r2_0c000__0d4c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0D79 ->$0D58 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0d79_M6C_r2_0c000__0d0e);
  return;
}


// ===== FUN_M6C_r2_0c000__0d58 @ M6C_r2_0c000::0d58 =====

void __h3000 FUN_M6C_r2_0c000__0d58(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0D79 ->$0D58 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0d79_M6C_r2_0c000__0d0e);
  return;
}


// ===== FUN_M6C_r2_0c000__0d79 @ M6C_r2_0c000::0d79 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0d79(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_701c = DAT_70d8 + 9;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8));
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0ddb @ M6C_r2_0c000::0ddb =====

void __h3000 FUN_M6C_r2_0c000__0ddb(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0e33_M6C_r2_0c000__0da0);
  return;
}


// ===== FUN_M6C_r2_0c000__0de7 @ M6C_r2_0c000::0de7 =====

void __h3000 FUN_M6C_r2_0c000__0de7(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0e33_M6C_r2_0c000__0da0);
  return;
}


// ===== FUN_M6C_r2_0c000__0df3 @ M6C_r2_0c000::0df3 =====

void __h3000 FUN_M6C_r2_0c000__0df3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$0E33 ->$0DFF */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0e33_M6C_r2_0c000__0da0);
  return;
}


// ===== FUN_M6C_r2_0c000__0dff @ M6C_r2_0c000::0dff =====

undefined2 __h3000 FUN_M6C_r2_0c000__0dff(void)

{
  undefined2 in_D;
  
  if (DAT_706a == 0) {
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


// ===== FUN_M6C_r2_0c000__0e33 @ M6C_r2_0c000::0e33 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0e33(void)

{
  undefined2 in_D;
  
  API_FE76();
  if (DAT_706a == 0) {
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


// ===== FUN_M6C_r2_0c000__0ede @ M6C_r2_0c000::0ede =====

void __h3000 FUN_M6C_r2_0c000__0ede(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F75 ->$0F1A */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0f75_M6C_r2_0c000__0e94);
  return;
}


// ===== FUN_M6C_r2_0c000__0eea @ M6C_r2_0c000::0eea =====

void __h3000 FUN_M6C_r2_0c000__0eea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F75 ->$0F1A */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0f75_M6C_r2_0c000__0e94);
  return;
}


// ===== FUN_M6C_r2_0c000__0ef6 @ M6C_r2_0c000::0ef6 =====

void __h3000 FUN_M6C_r2_0c000__0ef6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F75 ->$0F1A */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0f75_M6C_r2_0c000__0e94);
  return;
}


// ===== FUN_M6C_r2_0c000__0f02 @ M6C_r2_0c000::0f02 =====

void __h3000 FUN_M6C_r2_0c000__0f02(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F75 ->$0F1A */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0f75_M6C_r2_0c000__0e94);
  return;
}


// ===== FUN_M6C_r2_0c000__0f0e @ M6C_r2_0c000::0f0e =====

void __h3000 FUN_M6C_r2_0c000__0f0e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F75 ->$0F1A $0EEA */
  API_FE1A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__0f75_M6C_r2_0c000__0e94);
  return;
}


// ===== FUN_M6C_r2_0c000__0f1a @ M6C_r2_0c000::0f1a =====

undefined2 __h3000 FUN_M6C_r2_0c000__0f1a(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                     " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_7078 + 100;
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


// ===== FUN_M6C_r2_0c000__0f75 @ M6C_r2_0c000::0f75 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0f75(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  uVar1 = DAT_7078;
  *(char *)(in_U + -1) = (char)DAT_7078;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  uVar1 = DAT_7078;
  DAT_701c = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_7078;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_70e2 = *psVar2 + DAT_701c;
  FUN_M6C_r2_0c000__2790();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0fad @ M6C_r2_0c000::0fad =====

undefined2 __h3000 FUN_M6C_r2_0c000__0fad(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_60f9;
  DAT_7060 = DAT_60f9;
  FUN_M6C_r2_0c000__0fc2();
  FUN_M6C_r2_0c000__100b();
  FUN_M6C_r2_0c000__119d();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0fc2 @ M6C_r2_0c000::0fc2 =====

undefined2 __h3000 FUN_M6C_r2_0c000__0fc2(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7060;
  FUN_M6C_r2_0c000__060a();
  LcdSetCursor();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$100B ->$0FFE
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__100b();
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x11);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__0ffe @ M6C_r2_0c000::0ffe =====

undefined2 __h3000 FUN_M6C_r2_0c000__0ffe(void)

{
  undefined2 in_D;
  
  DAT_7060 = DAT_6074;
  FUN_M6C_r2_0c000__100b();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__100b @ M6C_r2_0c000::100b =====

undefined2 __h3000 FUN_M6C_r2_0c000__100b(void)

{
  undefined2 in_D;
  
  if (DAT_7060 != 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "hit enter for:         " */
    LcdPrintInline();
    if (DAT_7060 == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "constant spacing         " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7060 == 2) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear increasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7060 == 3) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear decreasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7060 == 4) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al increasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7060 == 5) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al decreasing spacing" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7060 == 6) {
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


// ===== FUN_M6C_r2_0c000__119d @ M6C_r2_0c000::119d =====

/* WARNING: Removing unreachable block (RAM,0x12e1) */
/* WARNING: Removing unreachable block (RAM,0x12d1) */
/* WARNING: Removing unreachable block (RAM,0x1284) */
/* WARNING: Removing unreachable block (RAM,0x128c) */
/* WARNING: Removing unreachable block (RAM,0x12d9) */
/* WARNING: Removing unreachable block (RAM,0x12e7) */
/* WARNING: Removing unreachable block (RAM,0x12ec) */
/* WARNING: Removing unreachable block (RAM,0x1306) */
/* WARNING: Removing unreachable block (RAM,0x127c) */
/* WARNING: Removing unreachable block (RAM,0x1292) */
/* WARNING: Removing unreachable block (RAM,0x1297) */
/* WARNING: Removing unreachable block (RAM,0x12b1) */
/* WARNING: Heritage AFTER dead removal. Example location: B : 0x11a6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6C_r2_0c000__119d(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  short *psVar4;
  undefined2 *puVar5;
  short *psVar6;
  short *psVar7;
  
  API_FE40((char)((ushort)DAT_7060 >> 8),(char)DAT_7060,param_1,6);
  if (DAT_7060 != 0) {
    if (DAT_7060 == 1) {
      FUN_M6C_r2_0c000__28b6();
      *(undefined1 *)(param_3 + -1) = 0xc;
      puVar5 = (undefined2 *)(param_3 + -2);
      *(undefined1 *)puVar5 = 0;
      API_FCEA();
      uVar1 = *puVar5;
      puVar5 = &DAT_7094;
      do {
        puVar3 = puVar5 + 1;
        *puVar5 = uVar1;
        puVar5 = puVar3;
      } while ((short)puVar3 < 0x70ab);
    }
    else if (DAT_7060 == 2) {
      FUN_M6C_r2_0c000__28b6();
      *(undefined1 *)(param_3 + -1) = 0x4e;
      psVar6 = (short *)(param_3 + -2);
      *(undefined1 *)psVar6 = 0;
      API_FCEA();
      DAT_701c = *psVar6;
      sVar2 = 0;
      psVar6 = &DAT_7094;
      do {
        sVar2 = sVar2 + DAT_701c;
        psVar7 = psVar6 + 1;
        *psVar6 = sVar2;
        psVar6 = psVar7;
      } while ((short)psVar7 < 0x70ab);
    }
    else if (DAT_7060 == 3) {
      FUN_M6C_r2_0c000__28b6();
      *(undefined1 *)(param_3 + -1) = 0x4e;
      psVar6 = (short *)(param_3 + -2);
      *(undefined1 *)psVar6 = 0;
      API_FCEA();
      DAT_701c = *psVar6;
      DAT_70aa = DAT_701c;
    }
    else {
      if (DAT_7060 == 4) {
        FUN_M6C_r2_0c000__28b6();
        FUN_M6C_r2_0c000__291a();
        return in_D;
      }
      if (DAT_7060 == 5) {
        FUN_M6C_r2_0c000__28b6();
        FUN_M6C_r2_0c000__291a();
        return in_D;
      }
      if (DAT_7060 == 6) {
        FUN_M6C_r2_0c000__28b6();
        *(undefined1 *)(param_3 + -1) = 0xc;
        psVar7 = (short *)(param_3 + -2);
        *(undefined1 *)psVar7 = 0;
        API_FCEA();
        DAT_701c = *psVar7;
        psVar6 = &DAT_7094;
        do {
          sVar2 = DAT_701c;
          *(char *)((short)psVar7 + 1) = (char)DAT_701c;
          *(char *)psVar7 = (char)((ushort)sVar2 >> 8);
          API_FCF8();
          psVar4 = psVar6 + 1;
          *psVar6 = *psVar7;
          psVar6 = psVar4;
        } while ((short)psVar4 < 0x70ab);
      }
    }
  }
  FUN_M6C_r2_0c000__2742();
  FUN_M6C_r2_0c000__26eb();
  LcdSetCursor();
                    /* inline[API_FC38]: "spacing was set - use knob for options  " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__136e @ M6C_r2_0c000::136e =====

undefined2 __h3000 FUN_M6C_r2_0c000__136e(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_60f9;
  DAT_7062 = DAT_60f9;
  FUN_M6C_r2_0c000__1383();
  FUN_M6C_r2_0c000__13cc();
  FUN_M6C_r2_0c000__155f();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1383 @ M6C_r2_0c000::1383 =====

undefined2 __h3000 FUN_M6C_r2_0c000__1383(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7062;
  FUN_M6C_r2_0c000__060a();
  LcdSetCursor();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$13CC ->$13BF
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__13cc();
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x15);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__13bf @ M6C_r2_0c000::13bf =====

undefined2 __h3000 FUN_M6C_r2_0c000__13bf(void)

{
  undefined2 in_D;
  
  DAT_7062 = DAT_6074;
  FUN_M6C_r2_0c000__13cc();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__13cc @ M6C_r2_0c000::13cc =====

undefined2 __h3000 FUN_M6C_r2_0c000__13cc(void)

{
  undefined2 in_D;
  
  if (DAT_7062 != 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "hit enter for:          " */
    LcdPrintInline();
    if (DAT_7062 == 1) {
      LcdSetCursor();
                    /* inline[API_FC38]: "constant weight          " */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7062 == 2) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear increasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7062 == 3) {
      LcdSetCursor();
                    /* inline[API_FC38]: "linear decreasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7062 == 4) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al increasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7062 == 5) {
      LcdSetCursor();
                    /* inline[API_FC38]: "exp'al decreasing weights" */
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7062 == 6) {
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


// ===== FUN_M6C_r2_0c000__155f @ M6C_r2_0c000::155f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1568 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6C_r2_0c000__155f(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  short sVar1;
  undefined2 *puVar2;
  short *psVar3;
  undefined2 *puVar4;
  short *psVar5;
  short *psVar6;
  
  API_FE40((char)((ushort)DAT_7062 >> 8),(char)DAT_7062,param_1,7);
  if (DAT_7062 != 0) {
    if (DAT_7062 == 1) {
      puVar4 = &DAT_70ac;
      do {
        puVar2 = puVar4 + 1;
        *puVar4 = 400;
        puVar4 = puVar2;
      } while ((short)puVar2 < 0x70c3);
    }
    else if (DAT_7062 == 2) {
      DAT_701c = 0x50;
      sVar1 = 0;
      psVar5 = &DAT_70ac;
      do {
        sVar1 = sVar1 + DAT_701c;
        psVar3 = psVar5 + 1;
        *psVar5 = sVar1;
        psVar5 = psVar3;
      } while ((short)psVar3 < 0x70c3);
    }
    else if (DAT_7062 == 3) {
      DAT_701c = 0x50;
      DAT_70c2 = 0x50;
    }
    else if (DAT_7062 == 4) {
      DAT_701c = 1;
      DAT_70ac = 1;
      psVar5 = &DAT_70ae;
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
      } while ((short)psVar5 < 0x70bf);
      *psVar5 = 1000;
      psVar3[2] = 1000;
    }
    else if (DAT_7062 == 5) {
      DAT_701c = 1;
      DAT_70c2 = 1;
      puVar4 = &DAT_70c2;
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
    else if (DAT_7062 == 6) {
      psVar5 = &DAT_70ac;
      do {
        *(undefined1 *)((short)param_3 + -1) = 0xe8;
        psVar6 = param_3 + -1;
        *(undefined1 *)psVar6 = 3;
        API_FCF8();
        param_3 = psVar6 + 1;
        psVar3 = psVar5 + 1;
        *psVar5 = *psVar6;
        psVar5 = psVar3;
      } while ((short)psVar3 < 0x70c3);
    }
  }
  FUN_M6C_r2_0c000__2790();
  FUN_M6C_r2_0c000__2708();
  LcdSetCursor();
                    /* inline[API_FC38]: "weights set - use knob for options      " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__16af @ M6C_r2_0c000::16af =====

undefined2 __h3000 FUN_M6C_r2_0c000__16af(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_60f9;
  DAT_7064 = DAT_60f9;
  FUN_M6C_r2_0c000__16c4();
  FUN_M6C_r2_0c000__170d();
  FUN_M6C_r2_0c000__1936();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__16c4 @ M6C_r2_0c000::16c4 =====

undefined2 __h3000 FUN_M6C_r2_0c000__16c4(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7064;
  FUN_M6C_r2_0c000__060a();
  LcdSetCursor();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0009 $0001 $0000 ->$170D ->$1700
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__170d();
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x19);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1700 @ M6C_r2_0c000::1700 =====

undefined2 __h3000 FUN_M6C_r2_0c000__1700(void)

{
  undefined2 in_D;
  
  DAT_7064 = DAT_6074;
  FUN_M6C_r2_0c000__170d();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__170d @ M6C_r2_0c000::170d =====

undefined2 __h3000 FUN_M6C_r2_0c000__170d(void)

{
  undefined2 in_D;
  
  if (DAT_7064 != 0) {
    LcdSetCursor();
    LcdPrintInline();
    if (DAT_7064 == 1) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 2) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 3) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 4) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 5) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 6) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 7) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 8) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
    if (DAT_7064 == 9) {
      LcdSetCursor();
      LcdPrintInline();
      return in_D;
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1720 @ M6C_r2_0c000::1720 =====

undefined2 __h3000 FUN_M6C_r2_0c000__1720(void)

{
  undefined2 in_stack_00000000;
  
                    /* inline[API_FC38]: "hit enter for:          " */
  LcdPrintInline();
  if (DAT_7064 == 1) {
    LcdSetCursor();
                    /* inline[API_FC38]: "panned center            " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 2) {
    LcdSetCursor();
                    /* inline[API_FC38]: "panned left              " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 3) {
    LcdSetCursor();
                    /* inline[API_FC38]: "panned right             " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 4) {
    LcdSetCursor();
                    /* inline[API_FC38]: "alternating left & right " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 5) {
    LcdSetCursor();
                    /* inline[API_FC38]: "left to right sweep      " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 6) {
    LcdSetCursor();
                    /* inline[API_FC38]: "right to left sweep      " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 7) {
    LcdSetCursor();
                    /* inline[API_FC38]: "spread from center       " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 8) {
    LcdSetCursor();
                    /* inline[API_FC38]: "merge to center          " */
    LcdPrintInline();
  }
  else if (DAT_7064 == 9) {
    LcdSetCursor();
                    /* inline[API_FC38]: "random panning           " */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "panning control - use knob for options  " */
    LcdPrintInline();
  }
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__1936 @ M6C_r2_0c000::1936 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x193f */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M6C_r2_0c000__1936(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  short sVar2;
  undefined2 *puVar3;
  short *psVar5;
  short *psVar6;
  short *psVar7;
  undefined2 *puVar4;
  
  API_FE40((char)((ushort)DAT_7064 >> 8),(char)DAT_7064,param_1,8);
  if (DAT_7064 != 0) {
    if (DAT_7064 == 1) {
      uVar1 = 0;
    }
    else if (DAT_7064 == 2) {
      uVar1 = 0xfff5;
    }
    else {
      if (DAT_7064 != 3) {
        if (DAT_7064 == 4) {
          sVar2 = -0xb;
          psVar6 = &DAT_707c;
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
          } while ((short)psVar5 < 0x7093);
        }
        else if (DAT_7064 == 5) {
          sVar2 = -0xb;
          psVar6 = &DAT_707c;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            sVar2 = sVar2 + 2;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7093);
        }
        else if (DAT_7064 == 6) {
          sVar2 = 0xb;
          psVar6 = &DAT_707c;
          do {
            psVar5 = psVar6 + 1;
            *psVar6 = sVar2;
            sVar2 = sVar2 + -2;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7093);
        }
        else if (DAT_7064 == 7) {
          DAT_701e = 1;
          sVar2 = 0;
          DAT_701c = 0;
          psVar6 = &DAT_707c;
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
          } while ((short)psVar5 < 0x7093);
        }
        else if (DAT_7064 == 8) {
          DAT_701e = 1;
          sVar2 = 0xb;
          DAT_701c = 0xb;
          psVar6 = &DAT_707c;
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
          } while ((short)psVar5 < 0x7093);
        }
        else if (DAT_7064 == 9) {
          psVar6 = &DAT_707c;
          do {
            *(undefined1 *)((short)param_3 + -1) = 0x16;
            psVar7 = param_3 + -1;
            *(undefined1 *)psVar7 = 0;
            API_FCF8();
            param_3 = psVar7 + 1;
            psVar5 = psVar6 + 1;
            *psVar6 = *psVar7 + -0xb;
            psVar6 = psVar5;
          } while ((short)psVar5 < 0x7093);
        }
        goto LAB_M6C_r2_0c000__1aac;
      }
      uVar1 = 0xb;
    }
    puVar3 = &DAT_707c;
    do {
      puVar4 = puVar3 + 1;
      *puVar3 = uVar1;
      puVar3 = puVar4;
    } while ((short)puVar4 < 0x7093);
  }
LAB_M6C_r2_0c000__1aac:
  FUN_M6C_r2_0c000__2790();
  FUN_M6C_r2_0c000__2725();
  LcdSetCursor();
                    /* inline[API_FC38]: "pans set - use knob for options         " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1b0e @ M6C_r2_0c000::1b0e =====

void __h3000 FUN_M6C_r2_0c000__1b0e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1B6B ->$1B32 */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8);
  return;
}


// ===== FUN_M6C_r2_0c000__1b1a @ M6C_r2_0c000::1b1a =====

void __h3000 FUN_M6C_r2_0c000__1b1a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1B6B ->$1B32 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8);
  return;
}


// ===== FUN_M6C_r2_0c000__1b26 @ M6C_r2_0c000::1b26 =====

void __h3000 FUN_M6C_r2_0c000__1b26(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1B6B ->$1B32 */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8);
  return;
}


// ===== FUN_M6C_r2_0c000__1b32 @ M6C_r2_0c000::1b32 =====

void __h3000 FUN_M6C_r2_0c000__1b32(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1B6B ->$1B32 */
  API_FE6E(param_1,param_2,&PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8);
  return;
}


// ===== FUN_M6C_r2_0c000__1b3e @ M6C_r2_0c000::1b3e =====

void __h3000 FUN_M6C_r2_0c000__1b3e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1B6B ->$1B32 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8);
  return;
}


// ===== FUN_M6C_r2_0c000__1b4a @ M6C_r2_0c000::1b4a =====

void __h3000 FUN_M6C_r2_0c000__1b4a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1B6B ->$1B32 $1B26 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8);
  return;
}


// ===== FUN_M6C_r2_0c000__1b6b @ M6C_r2_0c000::1b6b =====

undefined2 __h3000 FUN_M6C_r2_0c000__1b6b(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  undefined2 in_D;
  undefined1 uVar4;
  short in_U;
  undefined1 *puVar5;
  short *psVar6;
  
  API_FE76();
  uVar2 = DAT_705c;
  *(char *)(in_U + -1) = (char)DAT_705c;
  *(char *)(in_U + -2) = (char)((ushort)uVar2 >> 8);
  *(undefined1 *)(in_U + -3) = 0x40;
  puVar5 = (undefined1 *)(in_U + -4);
  *puVar5 = 1;
  API_FCF0();
  DAT_7000 = *(short *)(puVar5 + 2);
  puVar5 = puVar5 + 4;
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
  uVar4 = (undefined1)DAT_7000;
  puVar5[-1] = uVar4;
  uVar3 = (undefined1)((ushort)sVar1 >> 8);
  puVar5[-2] = uVar3;
  puVar5[-3] = uVar4;
  psVar6 = (short *)(puVar5 + -4);
  *(undefined1 *)psVar6 = uVar3;
  API_FCF2();
  DAT_701e = *psVar6;
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


// ===== FUN_M6C_r2_0c000__1c86 @ M6C_r2_0c000::1c86 =====

void __h3000 FUN_M6C_r2_0c000__1c86(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1c8d @ M6C_r2_0c000::1c8d =====

void __h3000 FUN_M6C_r2_0c000__1c8d(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1c94 @ M6C_r2_0c000::1c94 =====

void __h3000 FUN_M6C_r2_0c000__1c94(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1c9b @ M6C_r2_0c000::1c9b =====

void __h3000 FUN_M6C_r2_0c000__1c9b(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ca2 @ M6C_r2_0c000::1ca2 =====

void __h3000 FUN_M6C_r2_0c000__1ca2(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ca9 @ M6C_r2_0c000::1ca9 =====

void __h3000 FUN_M6C_r2_0c000__1ca9(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1cb0 @ M6C_r2_0c000::1cb0 =====

void __h3000 FUN_M6C_r2_0c000__1cb0(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1cb7 @ M6C_r2_0c000::1cb7 =====

void __h3000 FUN_M6C_r2_0c000__1cb7(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1cbe @ M6C_r2_0c000::1cbe =====

void __h3000 FUN_M6C_r2_0c000__1cbe(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1cc5 @ M6C_r2_0c000::1cc5 =====

void __h3000 FUN_M6C_r2_0c000__1cc5(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ccc @ M6C_r2_0c000::1ccc =====

void __h3000 FUN_M6C_r2_0c000__1ccc(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1cd3 @ M6C_r2_0c000::1cd3 =====

void __h3000 FUN_M6C_r2_0c000__1cd3(void)

{
  FUN_M6C_r2_0c000__1cda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1cda @ M6C_r2_0c000::1cda =====

undefined2 __h3000 FUN_M6C_r2_0c000__1cda(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__275e();
  DAT_6074 = DAT_60f9;
  *DAT_7008 = DAT_60f9;
  API_FC82();
  (*(FUN_M6C_r2_0c000__1d08 + g_moduleBase + (DAT_701a & 0xff) * 7))();
  FUN_M6C_r2_0c000__1de8();
  FUN_M6C_r2_0c000__1e30();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__1d08 @ M6C_r2_0c000::1d08 =====

void __h3000 FUN_M6C_r2_0c000__1d08(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d0f @ M6C_r2_0c000::1d0f =====

void __h3000 FUN_M6C_r2_0c000__1d0f(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d16 @ M6C_r2_0c000::1d16 =====

void __h3000 FUN_M6C_r2_0c000__1d16(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d1d @ M6C_r2_0c000::1d1d =====

void __h3000 FUN_M6C_r2_0c000__1d1d(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d24 @ M6C_r2_0c000::1d24 =====

void __h3000 FUN_M6C_r2_0c000__1d24(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d2b @ M6C_r2_0c000::1d2b =====

void __h3000 FUN_M6C_r2_0c000__1d2b(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d32 @ M6C_r2_0c000::1d32 =====

void __h3000 FUN_M6C_r2_0c000__1d32(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d39 @ M6C_r2_0c000::1d39 =====

void __h3000 FUN_M6C_r2_0c000__1d39(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d40 @ M6C_r2_0c000::1d40 =====

void __h3000 FUN_M6C_r2_0c000__1d40(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d47 @ M6C_r2_0c000::1d47 =====

void __h3000 FUN_M6C_r2_0c000__1d47(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d4e @ M6C_r2_0c000::1d4e =====

void __h3000 FUN_M6C_r2_0c000__1d4e(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d55 @ M6C_r2_0c000::1d55 =====

void __h3000 FUN_M6C_r2_0c000__1d55(void)

{
  FUN_M6C_r2_0c000__1d5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1d5c @ M6C_r2_0c000::1d5c =====

undefined2 __h3000 FUN_M6C_r2_0c000__1d5c(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__275e();
  DAT_6074 = *DAT_7008;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1DE8 ->$1D88
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__1de8();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__1d88 @ M6C_r2_0c000::1d88 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__1d88(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  byte extraout_CC;
  
  *DAT_7008 = DAT_6074;
  FUN_M6C_r2_0c000__28cf();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    DAT_6074 = *param_3 + *DAT_7008;
    *DAT_7008 = DAT_6074;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1DE8 ->$1D88
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M6C_r2_0c000__1de8();
    FUN_M6C_r2_0c000__291a();
  }
  API_FC82();
  FUN_M6C_r2_0c000__1e30();
  API_FE40((char)((ushort)*DAT_7008 >> 8),(char)*DAT_7008,param_1,DAT_701a + 9);
  DAT_7060 = 0;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1de8 @ M6C_r2_0c000::1de8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__1de8(void)

{
  undefined2 in_D;
  
  FUN_M6C_r2_0c000__060a();
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


// ===== FUN_M6C_r2_0c000__1e30 @ M6C_r2_0c000::1e30 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__1e30(undefined2 param_1,undefined2 param_2,short param_3)

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
  uVar1 = DAT_70e4;
  *(char *)((short)psVar2 + -1) = (char)DAT_70e4;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_701c = *psVar2 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8),(char)DAT_701c,param_1,DAT_7014);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1e86 @ M6C_r2_0c000::1e86 =====

void __h3000 FUN_M6C_r2_0c000__1e86(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1e8d @ M6C_r2_0c000::1e8d =====

void __h3000 FUN_M6C_r2_0c000__1e8d(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1e94 @ M6C_r2_0c000::1e94 =====

void __h3000 FUN_M6C_r2_0c000__1e94(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1e9b @ M6C_r2_0c000::1e9b =====

void __h3000 FUN_M6C_r2_0c000__1e9b(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ea2 @ M6C_r2_0c000::1ea2 =====

void __h3000 FUN_M6C_r2_0c000__1ea2(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ea9 @ M6C_r2_0c000::1ea9 =====

void __h3000 FUN_M6C_r2_0c000__1ea9(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1eb0 @ M6C_r2_0c000::1eb0 =====

void __h3000 FUN_M6C_r2_0c000__1eb0(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1eb7 @ M6C_r2_0c000::1eb7 =====

void __h3000 FUN_M6C_r2_0c000__1eb7(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ebe @ M6C_r2_0c000::1ebe =====

void __h3000 FUN_M6C_r2_0c000__1ebe(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ec5 @ M6C_r2_0c000::1ec5 =====

void __h3000 FUN_M6C_r2_0c000__1ec5(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ecc @ M6C_r2_0c000::1ecc =====

void __h3000 FUN_M6C_r2_0c000__1ecc(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1ed3 @ M6C_r2_0c000::1ed3 =====

void __h3000 FUN_M6C_r2_0c000__1ed3(void)

{
  FUN_M6C_r2_0c000__1eda(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1eda @ M6C_r2_0c000::1eda =====

undefined2 __h3000 FUN_M6C_r2_0c000__1eda(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__27ac();
  DAT_6074 = DAT_60f9;
  *DAT_7006 = DAT_60f9;
  API_FC82();
  (*(FUN_M6C_r2_0c000__1f08 + g_moduleBase + (DAT_701a & 0xff) * 7))();
  FUN_M6C_r2_0c000__1fe7();
  FUN_M6C_r2_0c000__1ffc();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__1f08 @ M6C_r2_0c000::1f08 =====

void __h3000 FUN_M6C_r2_0c000__1f08(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f0f @ M6C_r2_0c000::1f0f =====

void __h3000 FUN_M6C_r2_0c000__1f0f(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f16 @ M6C_r2_0c000::1f16 =====

void __h3000 FUN_M6C_r2_0c000__1f16(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f1d @ M6C_r2_0c000::1f1d =====

void __h3000 FUN_M6C_r2_0c000__1f1d(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f24 @ M6C_r2_0c000::1f24 =====

void __h3000 FUN_M6C_r2_0c000__1f24(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f2b @ M6C_r2_0c000::1f2b =====

void __h3000 FUN_M6C_r2_0c000__1f2b(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f32 @ M6C_r2_0c000::1f32 =====

void __h3000 FUN_M6C_r2_0c000__1f32(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f39 @ M6C_r2_0c000::1f39 =====

void __h3000 FUN_M6C_r2_0c000__1f39(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f40 @ M6C_r2_0c000::1f40 =====

void __h3000 FUN_M6C_r2_0c000__1f40(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f47 @ M6C_r2_0c000::1f47 =====

void __h3000 FUN_M6C_r2_0c000__1f47(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f4e @ M6C_r2_0c000::1f4e =====

void __h3000 FUN_M6C_r2_0c000__1f4e(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f55 @ M6C_r2_0c000::1f55 =====

void __h3000 FUN_M6C_r2_0c000__1f55(void)

{
  FUN_M6C_r2_0c000__1f5c(0);
  return;
}


// ===== FUN_M6C_r2_0c000__1f5c @ M6C_r2_0c000::1f5c =====

undefined2 __h3000 FUN_M6C_r2_0c000__1f5c(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__27ac();
  DAT_6074 = *DAT_7006;
  FUN_M6C_r2_0c000__060a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       level   :       %   " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $03E8 $FC18 $0000 ->$1FE7 ->$1FBB
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__1fe7();
  LcdSetCursor();
  API_FC44((char)((ushort)(DAT_701a + 1) >> 8));
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__1fbb @ M6C_r2_0c000::1fbb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__1fbb(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_7006 = DAT_6074;
  API_FC82();
  FUN_M6C_r2_0c000__1ffc();
  API_FE40((char)((ushort)*DAT_7006 >> 8),(char)*DAT_7006,param_1,DAT_701a + 0x15);
  DAT_7062 = 0;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1fe7 @ M6C_r2_0c000::1fe7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__1fe7(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,6,&DAT_609d);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__1ffc @ M6C_r2_0c000::1ffc =====

undefined2 __h3000 FUN_M6C_r2_0c000__1ffc(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  sVar1 = *DAT_7006;
  if (sVar1 == 0) {
    DAT_7020 = 0;
    DAT_7022 = 0;
  }
  else {
    *(char *)(in_U + -1) = (char)sVar1;
    *(char *)(in_U + -2) = (char)((ushort)sVar1 >> 8);
    *(undefined1 *)(in_U + -3) = 0xb;
    psVar3 = (short *)(in_U + -4);
    *(undefined1 *)psVar3 = 0;
    API_FCEC();
    DAT_701c = *psVar3;
    sVar1 = *DAT_7006;
    *(char *)((short)psVar3 + 1) = (char)sVar1;
    *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
    uVar2 = *DAT_700a;
    *(char *)((short)psVar3 + -1) = (char)uVar2;
    psVar3 = psVar3 + -1;
    *(char *)psVar3 = (char)((ushort)uVar2 >> 8);
    API_FCEC();
    uVar2 = DAT_70e2;
    *(char *)((short)psVar3 + -1) = (char)DAT_70e2;
    psVar3 = psVar3 + -1;
    *(char *)psVar3 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    DAT_701e = *psVar3;
    DAT_7020 = DAT_701c + DAT_701e;
    DAT_7022 = DAT_701c - DAT_701e;
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7020 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7022 >> 8));
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2073 @ M6C_r2_0c000::2073 =====

void __h3000 FUN_M6C_r2_0c000__2073(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__207a @ M6C_r2_0c000::207a =====

void __h3000 FUN_M6C_r2_0c000__207a(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2081 @ M6C_r2_0c000::2081 =====

void __h3000 FUN_M6C_r2_0c000__2081(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2088 @ M6C_r2_0c000::2088 =====

void __h3000 FUN_M6C_r2_0c000__2088(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__208f @ M6C_r2_0c000::208f =====

void __h3000 FUN_M6C_r2_0c000__208f(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2096 @ M6C_r2_0c000::2096 =====

void __h3000 FUN_M6C_r2_0c000__2096(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__209d @ M6C_r2_0c000::209d =====

void __h3000 FUN_M6C_r2_0c000__209d(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20a4 @ M6C_r2_0c000::20a4 =====

void __h3000 FUN_M6C_r2_0c000__20a4(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20ab @ M6C_r2_0c000::20ab =====

void __h3000 FUN_M6C_r2_0c000__20ab(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20b2 @ M6C_r2_0c000::20b2 =====

void __h3000 FUN_M6C_r2_0c000__20b2(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20b9 @ M6C_r2_0c000::20b9 =====

void __h3000 FUN_M6C_r2_0c000__20b9(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20c0 @ M6C_r2_0c000::20c0 =====

void __h3000 FUN_M6C_r2_0c000__20c0(void)

{
  FUN_M6C_r2_0c000__20c7(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20c7 @ M6C_r2_0c000::20c7 =====

undefined2 __h3000 FUN_M6C_r2_0c000__20c7(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__27ac();
  DAT_6074 = DAT_60f9;
  *DAT_700a = DAT_60f9;
  API_FC80();
  (*(FUN_M6C_r2_0c000__20f5 + g_moduleBase + (DAT_701a & 0xff) * 7))();
  FUN_M6C_r2_0c000__21ea();
  FUN_M6C_r2_0c000__21ed();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__20f5 @ M6C_r2_0c000::20f5 =====

void __h3000 FUN_M6C_r2_0c000__20f5(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__20fc @ M6C_r2_0c000::20fc =====

void __h3000 FUN_M6C_r2_0c000__20fc(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2103 @ M6C_r2_0c000::2103 =====

void __h3000 FUN_M6C_r2_0c000__2103(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__210a @ M6C_r2_0c000::210a =====

void __h3000 FUN_M6C_r2_0c000__210a(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2111 @ M6C_r2_0c000::2111 =====

void __h3000 FUN_M6C_r2_0c000__2111(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2118 @ M6C_r2_0c000::2118 =====

void __h3000 FUN_M6C_r2_0c000__2118(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__211f @ M6C_r2_0c000::211f =====

void __h3000 FUN_M6C_r2_0c000__211f(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2126 @ M6C_r2_0c000::2126 =====

void __h3000 FUN_M6C_r2_0c000__2126(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__212d @ M6C_r2_0c000::212d =====

void __h3000 FUN_M6C_r2_0c000__212d(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2134 @ M6C_r2_0c000::2134 =====

void __h3000 FUN_M6C_r2_0c000__2134(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__213b @ M6C_r2_0c000::213b =====

void __h3000 FUN_M6C_r2_0c000__213b(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2142 @ M6C_r2_0c000::2142 =====

void __h3000 FUN_M6C_r2_0c000__2142(void)

{
  FUN_M6C_r2_0c000__2149(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2149 @ M6C_r2_0c000::2149 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2149(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__27ac();
  DAT_6074 = *DAT_700a;
  FUN_M6C_r2_0c000__060a();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       pan   : L-           C           -R" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$21ED ->$21BA
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__21ed();
  LcdSetCursor();
  API_FC44((char)((ushort)(DAT_701a + 1) >> 8));
  FUN_M6C_r2_0c000__21ee();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__21ba @ M6C_r2_0c000::21ba =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__21ba(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_700a = DAT_6074;
  API_FC80();
  FUN_M6C_r2_0c000__21ea();
  FUN_M6C_r2_0c000__21ee();
  API_FE40((char)((ushort)*DAT_700a >> 8),(char)*DAT_700a,param_1,DAT_701a + 0x21);
  DAT_7064 = 0;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__21ea @ M6C_r2_0c000::21ea =====

void __h3000 FUN_M6C_r2_0c000__21ea(void)

{
  FUN_M6C_r2_0c000__1ffc();
  return;
}


// ===== FUN_M6C_r2_0c000__21ed @ M6C_r2_0c000::21ed =====

void __h3000 FUN_M6C_r2_0c000__21ed(void)

{
  return;
}


// ===== FUN_M6C_r2_0c000__21ee @ M6C_r2_0c000::21ee =====

undefined2 __h3000 FUN_M6C_r2_0c000__21ee(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "           C           " */
  LcdPrintInline();
  LcdSetCursor((char)((ushort)(*DAT_700a + 0x1a) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2229 @ M6C_r2_0c000::2229 =====

void __h3000 FUN_M6C_r2_0c000__2229(void)

{
  FUN_M6C_r2_0c000__2245(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2230 @ M6C_r2_0c000::2230 =====

void __h3000 FUN_M6C_r2_0c000__2230(void)

{
  FUN_M6C_r2_0c000__2245(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2237 @ M6C_r2_0c000::2237 =====

void __h3000 FUN_M6C_r2_0c000__2237(void)

{
  FUN_M6C_r2_0c000__2245(0);
  return;
}


// ===== FUN_M6C_r2_0c000__223e @ M6C_r2_0c000::223e =====

void __h3000 FUN_M6C_r2_0c000__223e(void)

{
  FUN_M6C_r2_0c000__2245(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2245 @ M6C_r2_0c000::2245 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2245(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__280c();
  DAT_6074 = DAT_60f9;
  *DAT_7008 = DAT_60f9;
  API_FC82();
  (*(FUN_M6C_r2_0c000__2273 + g_moduleBase + (DAT_701a & 0xff) * 7))();
  FUN_M6C_r2_0c000__2315();
  FUN_M6C_r2_0c000__235d();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__2273 @ M6C_r2_0c000::2273 =====

void __h3000 FUN_M6C_r2_0c000__2273(void)

{
  FUN_M6C_r2_0c000__228f(0);
  return;
}


// ===== FUN_M6C_r2_0c000__227a @ M6C_r2_0c000::227a =====

void __h3000 FUN_M6C_r2_0c000__227a(void)

{
  FUN_M6C_r2_0c000__228f(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2281 @ M6C_r2_0c000::2281 =====

void __h3000 FUN_M6C_r2_0c000__2281(void)

{
  FUN_M6C_r2_0c000__228f(0);
  return;
}


// ===== FUN_M6C_r2_0c000__2288 @ M6C_r2_0c000::2288 =====

void __h3000 FUN_M6C_r2_0c000__2288(void)

{
  FUN_M6C_r2_0c000__228f(0);
  return;
}


// ===== FUN_M6C_r2_0c000__228f @ M6C_r2_0c000::228f =====

undefined2 __h3000 FUN_M6C_r2_0c000__228f(void)

{
  undefined2 in_stack_00000000;
  
  FUN_M6C_r2_0c000__280c();
  DAT_6074 = *DAT_7008;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$2315 ->$22BB
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M6C_r2_0c000__2315();
  return in_stack_00000000;
}


// ===== FUN_M6C_r2_0c000__22bb @ M6C_r2_0c000::22bb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__22bb(undefined2 param_1,undefined2 param_2,short *param_3)

{
  undefined2 in_D;
  byte extraout_CC;
  
  *DAT_7008 = DAT_6074;
  FUN_M6C_r2_0c000__28cf();
  if (!(bool)(extraout_CC >> 2 & 1)) {
    DAT_6074 = *param_3 + *DAT_7008;
    *DAT_7008 = DAT_6074;
                    /* inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$2315 ->$22BB
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M6C_r2_0c000__2315();
    FUN_M6C_r2_0c000__291a();
  }
  API_FC82();
  API_FE40((char)((ushort)*DAT_7008 >> 8),(char)*DAT_7008,param_1,DAT_701a + 0x2d);
  FUN_M6C_r2_0c000__235d();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2315 @ M6C_r2_0c000::2315 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__2315(void)

{
  undefined2 in_D;
  
  FUN_M6C_r2_0c000__060a();
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


// ===== FUN_M6C_r2_0c000__235d @ M6C_r2_0c000::235d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M6C_r2_0c000__235d(undefined2 param_1,undefined2 param_2,short param_3)

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


// ===== FUN_M6C_r2_0c000__23c9 @ M6C_r2_0c000::23c9 =====

void __h3000 FUN_M6C_r2_0c000__23c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2426 ->$23ED */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3);
  return;
}


// ===== FUN_M6C_r2_0c000__23d5 @ M6C_r2_0c000::23d5 =====

void __h3000 FUN_M6C_r2_0c000__23d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2426 ->$23ED */
                    /* inline[API_FDBC]: "5.94..#." */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3);
  return;
}


// ===== FUN_M6C_r2_0c000__23e1 @ M6C_r2_0c000::23e1 =====

void __h3000 FUN_M6C_r2_0c000__23e1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2426 ->$23ED */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3);
  return;
}


// ===== FUN_M6C_r2_0c000__23ed @ M6C_r2_0c000::23ed =====

void __h3000 FUN_M6C_r2_0c000__23ed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2426 ->$23ED */
  API_FE6E(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3);
  return;
}


// ===== FUN_M6C_r2_0c000__23f9 @ M6C_r2_0c000::23f9 =====

void __h3000 FUN_M6C_r2_0c000__23f9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2426 ->$23ED */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3);
  return;
}


// ===== FUN_M6C_r2_0c000__2405 @ M6C_r2_0c000::2405 =====

void __h3000 FUN_M6C_r2_0c000__2405(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2426 ->$23ED $23E1 */
  API_FE1A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3);
  return;
}


// ===== FUN_M6C_r2_0c000__2426 @ M6C_r2_0c000::2426 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2426(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7034;
  *(short *)(in_U + -2) = sVar1;
  DAT_701c = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_701c) >> 8));
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2477 @ M6C_r2_0c000::2477 =====

void __h3000 FUN_M6C_r2_0c000__2477(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$24D4 ->$249B */
  API_FE6A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451);
  return;
}


// ===== FUN_M6C_r2_0c000__2483 @ M6C_r2_0c000::2483 =====

void __h3000 FUN_M6C_r2_0c000__2483(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$24D4 ->$249B */
                    /* inline[API_FDBC]: "5.94..$Q" */
  API_FDBC(param_1,param_2,&PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451);
  return;
}


// ===== FUN_M6C_r2_0c000__248f @ M6C_r2_0c000::248f =====

void __h3000 FUN_M6C_r2_0c000__248f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$24D4 ->$249B */
  API_FE6C(param_1,param_2,&PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451);
  return;
}


// ===== FUN_M6C_r2_0c000__249b @ M6C_r2_0c000::249b =====

void __h3000 FUN_M6C_r2_0c000__249b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$24D4 ->$249B */
  API_FE6E(param_1,param_2,&PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451);
  return;
}


// ===== FUN_M6C_r2_0c000__24a7 @ M6C_r2_0c000::24a7 =====

void __h3000 FUN_M6C_r2_0c000__24a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$24D4 ->$249B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451);
  return;
}


// ===== FUN_M6C_r2_0c000__24b3 @ M6C_r2_0c000::24b3 =====

void __h3000 FUN_M6C_r2_0c000__24b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$24D4 ->$249B $248F */
  API_FE1A(param_1,param_2,&PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451);
  return;
}


// ===== FUN_M6C_r2_0c000__24d4 @ M6C_r2_0c000::24d4 =====

undefined2 __h3000 FUN_M6C_r2_0c000__24d4(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_703c;
  *(short *)(in_U + -2) = sVar1;
  DAT_701c = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_701c) >> 8));
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2525 @ M6C_r2_0c000::2525 =====

void __h3000 FUN_M6C_r2_0c000__2525(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6C_r2_0c000__256a_M6C_r2_0c000__24ff);
  return;
}


// ===== FUN_M6C_r2_0c000__2531 @ M6C_r2_0c000::2531 =====

void __h3000 FUN_M6C_r2_0c000__2531(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$256A ->$2549 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6C_r2_0c000__256a_M6C_r2_0c000__24ff);
  return;
}


// ===== FUN_M6C_r2_0c000__253d @ M6C_r2_0c000::253d =====

void __h3000 FUN_M6C_r2_0c000__253d(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6C_r2_0c000__256a_M6C_r2_0c000__24ff);
  return;
}


// ===== FUN_M6C_r2_0c000__2549 @ M6C_r2_0c000::2549 =====

void __h3000 FUN_M6C_r2_0c000__2549(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6C_r2_0c000__256a_M6C_r2_0c000__24ff);
  return;
}


// ===== FUN_M6C_r2_0c000__256a @ M6C_r2_0c000::256a =====

undefined2 __h3000 FUN_M6C_r2_0c000__256a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6C_r2_0c000__256a_M6C_r2_0c000__24ff);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M6C_r2_0c000__25a0 @ M6C_r2_0c000::25a0 =====

void __h3000 FUN_M6C_r2_0c000__25a0(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6C_r2_0c000__25e5_M6C_r2_0c000__257a);
  return;
}


// ===== FUN_M6C_r2_0c000__25ac @ M6C_r2_0c000::25ac =====

void __h3000 FUN_M6C_r2_0c000__25ac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$25E5 ->$25C4 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6C_r2_0c000__25e5_M6C_r2_0c000__257a);
  return;
}


// ===== FUN_M6C_r2_0c000__25b8 @ M6C_r2_0c000::25b8 =====

void __h3000 FUN_M6C_r2_0c000__25b8(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6C_r2_0c000__25e5_M6C_r2_0c000__257a);
  return;
}


// ===== FUN_M6C_r2_0c000__25c4 @ M6C_r2_0c000::25c4 =====

void __h3000 FUN_M6C_r2_0c000__25c4(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6C_r2_0c000__25e5_M6C_r2_0c000__257a);
  return;
}


// ===== FUN_M6C_r2_0c000__25e5 @ M6C_r2_0c000::25e5 =====

undefined2 __h3000 FUN_M6C_r2_0c000__25e5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6C_r2_0c000__25e5_M6C_r2_0c000__257a);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M6C_r2_0c000__261b @ M6C_r2_0c000::261b =====

void __h3000 FUN_M6C_r2_0c000__261b(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2660_M6C_r2_0c000__25f5);
  return;
}


// ===== FUN_M6C_r2_0c000__2627 @ M6C_r2_0c000::2627 =====

void __h3000 FUN_M6C_r2_0c000__2627(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2660 ->$263F */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2660_M6C_r2_0c000__25f5);
  return;
}


// ===== FUN_M6C_r2_0c000__2633 @ M6C_r2_0c000::2633 =====

void __h3000 FUN_M6C_r2_0c000__2633(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2660_M6C_r2_0c000__25f5);
  return;
}


// ===== FUN_M6C_r2_0c000__263f @ M6C_r2_0c000::263f =====

void __h3000 FUN_M6C_r2_0c000__263f(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2660_M6C_r2_0c000__25f5);
  return;
}


// ===== FUN_M6C_r2_0c000__2660 @ M6C_r2_0c000::2660 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2660(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6C_r2_0c000__2660_M6C_r2_0c000__25f5);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M6C_r2_0c000__2696 @ M6C_r2_0c000::2696 =====

void __h3000 FUN_M6C_r2_0c000__2696(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M6C_r2_0c000__26db_M6C_r2_0c000__2670);
  return;
}


// ===== FUN_M6C_r2_0c000__26a2 @ M6C_r2_0c000::26a2 =====

void __h3000 FUN_M6C_r2_0c000__26a2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$26DB ->$26BA */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M6C_r2_0c000__26db_M6C_r2_0c000__2670);
  return;
}


// ===== FUN_M6C_r2_0c000__26ae @ M6C_r2_0c000::26ae =====

void __h3000 FUN_M6C_r2_0c000__26ae(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M6C_r2_0c000__26db_M6C_r2_0c000__2670);
  return;
}


// ===== FUN_M6C_r2_0c000__26ba @ M6C_r2_0c000::26ba =====

void __h3000 FUN_M6C_r2_0c000__26ba(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M6C_r2_0c000__26db_M6C_r2_0c000__2670);
  return;
}


// ===== FUN_M6C_r2_0c000__26db @ M6C_r2_0c000::26db =====

undefined2 __h3000 FUN_M6C_r2_0c000__26db(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M6C_r2_0c000__26db_M6C_r2_0c000__2670);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M6C_r2_0c000__26eb @ M6C_r2_0c000::26eb =====

undefined2 __h3000 FUN_M6C_r2_0c000__26eb(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  puVar1 = &DAT_7094;
  do {
    puVar2 = puVar1 + 1;
    API_FC82((char)((ushort)*puVar1 >> 8));
    puVar1 = puVar2;
  } while ((short)puVar2 < 0x70ab);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2708 @ M6C_r2_0c000::2708 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2708(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  puVar1 = &DAT_70ac;
  do {
    puVar2 = puVar1 + 1;
    API_FC82((char)((ushort)*puVar1 >> 8));
    puVar1 = puVar2;
  } while ((short)puVar2 < 0x70c3);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2725 @ M6C_r2_0c000::2725 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2725(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  undefined2 *puVar2;
  
  puVar1 = &DAT_707c;
  do {
    puVar2 = puVar1 + 1;
    API_FC80((char)((ushort)*puVar1 >> 8));
    puVar1 = puVar2;
  } while ((short)puVar2 < 0x7093);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2742 @ M6C_r2_0c000::2742 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2742(void)

{
  undefined2 in_D;
  short sVar1;
  
  FUN_M6C_r2_0c000__283e();
  do {
    FUN_M6C_r2_0c000__275e();
    sVar1 = FUN_M6C_r2_0c000__1e30();
  } while (sVar1 + 1 < 0xc);
  FUN_M6C_r2_0c000__287a();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__275e @ M6C_r2_0c000::275e =====

short __h3000 FUN_M6C_r2_0c000__275e(void)

{
  undefined1 uVar1;
  short in_D;
  char cVar2;
  
  cVar2 = (char)in_D;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_701a = in_D;
  DAT_7014 = in_D + 0x41e;
  DAT_7008 = (short)&DAT_7094 + CONCAT11(uVar1,cVar2 << 1);
  DAT_700e = CONCAT11(uVar1,cVar2 << 1) + 0x5a;
  DAT_7012 = &UNK_M6C_r2_0c000__293e + g_moduleBase + CONCAT11(uVar1,cVar2 << 1);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__2790 @ M6C_r2_0c000::2790 =====

undefined2 __h3000 FUN_M6C_r2_0c000__2790(void)

{
  undefined2 in_D;
  short sVar1;
  
  FUN_M6C_r2_0c000__283e();
  do {
    FUN_M6C_r2_0c000__27ac();
    sVar1 = FUN_M6C_r2_0c000__1ffc();
  } while (sVar1 + 1 < 0xc);
  FUN_M6C_r2_0c000__287a();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__27ac @ M6C_r2_0c000::27ac =====

short __h3000 FUN_M6C_r2_0c000__27ac(void)

{
  undefined1 uVar1;
  short in_D;
  char cVar2;
  
  cVar2 = (char)in_D;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_701a = in_D;
  DAT_7016 = in_D + 0x11e;
  DAT_7018 = in_D + 0x132;
  DAT_7006 = (short)&DAT_70ac + CONCAT11(uVar1,cVar2 << 1);
  DAT_700a = (short)&DAT_707c + CONCAT11(uVar1,cVar2 << 1);
  DAT_700c = CONCAT11(uVar1,cVar2 << 1) + 0x72;
  DAT_7010 = in_D + 0x8a;
  return in_D;
}


// ===== FUN_M6C_r2_0c000__27f0 @ M6C_r2_0c000::27f0 =====

undefined2 __h3000 FUN_M6C_r2_0c000__27f0(void)

{
  undefined2 in_D;
  short sVar1;
  
  FUN_M6C_r2_0c000__283e();
  do {
    FUN_M6C_r2_0c000__280c();
    sVar1 = FUN_M6C_r2_0c000__235d();
  } while (sVar1 + 1 < 4);
  FUN_M6C_r2_0c000__287a();
  return in_D;
}


// ===== FUN_M6C_r2_0c000__280c @ M6C_r2_0c000::280c =====

short __h3000 FUN_M6C_r2_0c000__280c(void)

{
  undefined1 uVar1;
  short in_D;
  char cVar2;
  
  cVar2 = (char)in_D;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_701a = in_D;
  DAT_7014 = FUN_M6C_r2_0c000__043c + in_D;
  DAT_7008 = (short)&DAT_70c4 + CONCAT11(uVar1,cVar2 << 1);
  DAT_700e = CONCAT11(uVar1,cVar2 << 1) + 0x96;
  DAT_7012 = &UNK_M6C_r2_0c000__293e + g_moduleBase + CONCAT11(uVar1,cVar2 << 1);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__283e @ M6C_r2_0c000::283e =====

undefined2 __h3000 FUN_M6C_r2_0c000__283e(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
  uVar1 = DAT_701a;
  *(char *)(in_U + -1) = (char)DAT_701a;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7014;
  *(char *)(in_U + -3) = (char)DAT_7014;
  *(char *)(in_U + -4) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7008;
  *(char *)(in_U + -5) = (char)DAT_7008;
  *(char *)(in_U + -6) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_700e;
  *(char *)(in_U + -7) = (char)DAT_700e;
  *(char *)(in_U + -8) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7012;
  *(char *)(in_U + -9) = (char)DAT_7012;
  *(char *)(in_U + -10) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7016;
  *(char *)(in_U + -0xb) = (char)DAT_7016;
  *(char *)(in_U + -0xc) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7018;
  *(char *)(in_U + -0xd) = (char)DAT_7018;
  *(char *)(in_U + -0xe) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7006;
  *(char *)(in_U + -0xf) = (char)DAT_7006;
  *(char *)(in_U + -0x10) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_700c;
  *(char *)(in_U + -0x11) = (char)DAT_700c;
  *(char *)(in_U + -0x12) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_700a;
  *(char *)(in_U + -0x13) = (char)DAT_700a;
  *(char *)(in_U + -0x14) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7010;
  *(char *)(in_U + -0x15) = (char)DAT_7010;
  *(char *)(in_U + -0x16) = (char)((ushort)uVar1 >> 8);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__287a @ M6C_r2_0c000::287a =====

undefined2 __h3000 FUN_M6C_r2_0c000__287a(void)

{
  undefined2 in_D;
  undefined2 *in_U;
  
  DAT_7010 = *in_U;
  DAT_700a = in_U[1];
  DAT_700c = in_U[2];
  DAT_7006 = in_U[3];
  DAT_7018 = in_U[4];
  DAT_7016 = in_U[5];
  DAT_7012 = in_U[6];
  DAT_700e = in_U[7];
  DAT_7008 = in_U[8];
  DAT_7014 = in_U[9];
  DAT_701a = in_U[10];
  return in_D;
}


// ===== FUN_M6C_r2_0c000__28b6 @ M6C_r2_0c000::28b6 =====

undefined2 __h3000 FUN_M6C_r2_0c000__28b6(void)

{
  undefined2 in_D;
  short in_U;
  
  *(undefined **)(in_U + -2) =
       &UNK_M6C_r2_0c000__38a4 + (((-DAT_70c6 - DAT_70c4) - DAT_70c8) - DAT_70ca);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__28cf @ M6C_r2_0c000::28cf =====

undefined2 __h3000 FUN_M6C_r2_0c000__28cf(void)

{
  undefined2 in_D;
  short in_U;
  
  *(undefined **)(in_U + -2) =
       &UNK_M6C_r2_0c000__38a4 +
       (((((((((((((((-DAT_7096 - DAT_7094) - DAT_7098) - DAT_709a) - DAT_709c) - DAT_709e) -
                DAT_70a0) - DAT_70a2) - DAT_70a4) - DAT_70a6) - DAT_70a8) - DAT_70aa) - DAT_70c4) -
         DAT_70c6) - DAT_70c8) - DAT_70ca);
  return in_D;
}


// ===== FUN_M6C_r2_0c000__291a @ M6C_r2_0c000::291a =====

undefined2 __h3000 FUN_M6C_r2_0c000__291a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  LcdSetCursor(param_1,0x14);
                    /* inline[API_FC38]: "OOPS, no delay left " */
  LcdPrintInline();
  return uStack_2;
}


