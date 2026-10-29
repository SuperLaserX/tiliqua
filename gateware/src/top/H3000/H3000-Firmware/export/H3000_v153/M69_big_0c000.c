// H3000_v153 - decompiled by Ghidra (6809, __h3000 convention)
// block M69_big_0c000 M69_big_0c000::0000-M69_big_0c000::3fff, 291 functions
// Bank big_0c000 (module id 69)

// ===== MODULE_69_02_entry @ M69_big_0c000::0010 =====

void __h3000 MODULE_69_02_entry(void)

{
  DAT_7002 = 0;
  DAT_700a = 0;
  DAT_7012 = 0;
  DAT_701a = 0;
  DAT_7032 = 0;
  DAT_702a = 0;
  DAT_703a = 0;
  DAT_7022 = 0;
  DAT_704a = 0;
  DAT_7042 = 0;
  DAT_70a6 = 0;
  DAT_70ae = 0;
  DAT_70b6 = 0;
  DAT_70be = 0;
  DAT_70c6 = 0;
  DAT_7050 = 0xffff;
                    /* inline[API_FE04]: 42:5A 41:58 75:98 76:9A 77:9C 78:9E 79:A0 7A:A2 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 69:80 6A:82 6B:84 6C:86 6D:88 6E:8A 6F:8C 70:8E 71:90 72:92
                       73:94 74:96 */
  LoadParamsSigned();
                    /* inline[API_FE06]: 5D:5C 5E:5E 5F:60 60:62 61:64 62:66 63:68 64:6A 65:6C 66:6E
                       67:70 68:72 */
  LoadParamsUnsigned();
                    /* inline[API_FE06]: 57:74 58:76 59:78 5A:7A 5B:7C 5C:7E */
  LoadParamsUnsigned();
                    /* inline[API_FE08]: 35:BC 57:C4 37:C2 59:CA 39:00 39:08 4F:10 3B:06 3B:0E 51:16
                        */
  LoadParamsScaled();
                    /* inline[API_FE08]: 3D:20 7F:48 53:28 35:30 31:38 4F:18 7B:40 3F:26 55:2E 37:36
                       33:3E 7D:46 51:1E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 31:A4 31:AC 53:B4 33:AA 33:B2 55:BA 81:4E */
  LoadParamsScaled();
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x2c);
  FUN_e568();
  API_FD7C();
  return;
}


// ===== FUN_M69_big_0c000__0103 @ M69_big_0c000::0103 =====

undefined2 __h3000 FUN_M69_big_0c000__0103(void)

{
  undefined2 in_D;
  
  DAT_7118 = 0x7fff;
  DAT_711a = 0x7fff;
  DAT_708c = 200;
  DAT_708e = 0;
  DAT_7090 = 0;
  DAT_7092 = 0;
  DAT_7094 = 0;
  DAT_7096 = 0;
  DAT_705c = 0;
  DAT_7068 = 0;
  DAT_7080 = 0;
  FUN_M69_big_0c000__2fc8();
  FUN_M69_big_0c000__2f5a();
  FUN_M69_big_0c000__3050();
  return in_D;
}


// ===== FUN_M69_big_0c000__013b @ M69_big_0c000::013b =====

undefined2 __h3000 FUN_M69_big_0c000__013b(void)

{
  undefined2 in_D;
  
  DAT_7118 = 0x7fff;
  DAT_711a = 0x7fff;
  DAT_711c = 0x7fff;
  DAT_708c = 100;
  DAT_7092 = 100;
  DAT_708e = 0;
  DAT_7090 = 0;
  DAT_7094 = 0;
  DAT_7096 = 0;
  DAT_705c = 0;
  DAT_7068 = 0;
  DAT_706e = 0;
  DAT_7080 = 0xfff6;
  DAT_7086 = 10;
  FUN_M69_big_0c000__2fc8();
  FUN_M69_big_0c000__2f5a();
  FUN_M69_big_0c000__3050();
  return in_D;
}


// ===== FUN_M69_big_0c000__0182 @ M69_big_0c000::0182 =====

void __h3000 FUN_M69_big_0c000__0182(void)

{
                    /* inline[API_FD84]: 00 80 "l delay " 21 $277E $278A */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r delay " 25 $28A0 $28AC */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l fdback" 29 $2A4C $2A58 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r fdback" 2D $2B6C $2B78 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "left mix" 43 $244A $2456 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "rightmix" 47 $2564 $2570 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "glide sp" 4B $125C $1268 */
  DefineParameter();
  DAT_60f5 = PTR_ARRAY_M69_big_0c000__0216;
  DAT_60f7 = 10;
  return;
}


// ===== FUN_M69_big_0c000__022a @ M69_big_0c000::022a =====

void __h3000 FUN_M69_big_0c000__022a(void)

{
  FUN_M69_big_0c000__2462();
  FUN_M69_big_0c000__0a36();
  FUN_e595();
  return;
}


// ===== FUN_M69_big_0c000__0235 @ M69_big_0c000::0235 =====

void __h3000 FUN_M69_big_0c000__0235(void)

{
  FUN_M69_big_0c000__257c();
  FUN_M69_big_0c000__0a6b();
  FUN_e595();
  return;
}


// ===== FUN_M69_big_0c000__0240 @ M69_big_0c000::0240 =====

void __h3000 FUN_M69_big_0c000__0240(void)

{
  FUN_M69_big_0c000__2796();
  FUN_M69_big_0c000__0a36();
  FUN_e585();
  return;
}


// ===== FUN_M69_big_0c000__024b @ M69_big_0c000::024b =====

void __h3000 FUN_M69_big_0c000__024b(void)

{
  FUN_M69_big_0c000__2a64();
  FUN_M69_big_0c000__0a36();
  FUN_e58d();
  return;
}


// ===== FUN_M69_big_0c000__0256 @ M69_big_0c000::0256 =====

void __h3000 FUN_M69_big_0c000__0256(void)

{
  FUN_M69_big_0c000__1274();
  FUN_M69_big_0c000__0ac4();
  FUN_e585();
  return;
}


// ===== FUN_M69_big_0c000__0261 @ M69_big_0c000::0261 =====

void __h3000 FUN_M69_big_0c000__0261(void)

{
  FUN_M69_big_0c000__1378();
  FUN_M69_big_0c000__0ac4();
  FUN_e58d();
  return;
}


// ===== FUN_M69_big_0c000__026c @ M69_big_0c000::026c =====

void __h3000 FUN_M69_big_0c000__026c(void)

{
  FUN_M69_big_0c000__16c8();
  FUN_M69_big_0c000__0ac4();
  FUN_e595();
  return;
}


// ===== FUN_M69_big_0c000__0277 @ M69_big_0c000::0277 =====

void __h3000 FUN_M69_big_0c000__0277(void)

{
  FUN_M69_big_0c000__17ca();
  FUN_M69_big_0c000__17f1();
  FUN_M69_big_0c000__0a36();
  API_FDEE();
  return;
}


// ===== FUN_M69_big_0c000__0285 @ M69_big_0c000::0285 =====

void __h3000 FUN_M69_big_0c000__0285(void)

{
  FUN_M69_big_0c000__28b8();
  FUN_M69_big_0c000__0a6b();
  FUN_e585();
  return;
}


// ===== FUN_M69_big_0c000__0290 @ M69_big_0c000::0290 =====

void __h3000 FUN_M69_big_0c000__0290(void)

{
  FUN_M69_big_0c000__2b84();
  FUN_M69_big_0c000__0a6b();
  FUN_e58d();
  return;
}


// ===== FUN_M69_big_0c000__029b @ M69_big_0c000::029b =====

void __h3000 FUN_M69_big_0c000__029b(void)

{
                    /* inline[API_FD84]: 00 80 " delay  " 21 $267E $268A */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "feedback" 25 $2A4C $2A58 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "  mix   " 29 $232C $2338 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "glide sp" 2D $125C $1268 */
  DefineParameter();
  DAT_60f5 = &UNK_M69_big_0c000__02f6;
  DAT_60f7 = 8;
  return;
}


// ===== FUN_M69_big_0c000__034d @ M69_big_0c000::034d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M69_big_0c000__034d(void)

{
                    /* inline[API_FD84]: 00 80 "m fdback" 21 $144D $1459 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " m rate " 25 $0F2F $0F3B */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "m depth " 29 $103E $104A */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "m delay " 2D $114D $1159 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "  image " 43 $1572 $157E */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "  mix   " 47 $232C $2338 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "glide sp" 4B $125C $1268 */
  DefineParameter();
  DAT_60f5 = &UNK_M69_big_0c000__03e7;
  DAT_60f7 = 0x2f;
  DAT_7120 = _FUN_M69_big_0c000__0926;
  return;
}


// ===== FUN_M69_big_0c000__0643 @ M69_big_0c000::0643 =====

void __h3000 FUN_M69_big_0c000__0643(void)

{
                    /* inline[API_FD84]: 00 80 " m delay" 21 $114D $1159 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " m depth" 25 $103E $104A */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 " m rate " 29 $0F2F $0F3B */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "m fdback" 2D $0DD8 $0DE4 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "  mix   " 43 $232C $2338 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "glide sp" 47 $125C $1268 */
  DefineParameter();
  DAT_60f5 = PTR_ARRAY_M69_big_0c000__06ca;
  DAT_60f7 = 0x1d;
  DAT_7120 = FUN_M69_big_0c000__0840;
  return;
}


// ===== FUN_M69_big_0c000__0704 @ M69_big_0c000::0704 =====

void __h3000 FUN_M69_big_0c000__0704(void)

{
  FUN_M69_big_0c000__2344();
  FUN_M69_big_0c000__07e0();
  FUN_e585();
  return;
}


// ===== FUN_M69_big_0c000__070f @ M69_big_0c000::070f =====

void __h3000 FUN_M69_big_0c000__070f(void)

{
  FUN_M69_big_0c000__0df0();
  FUN_M69_big_0c000__07a7();
  FUN_e59d();
  return;
}


// ===== FUN_M69_big_0c000__071a @ M69_big_0c000::071a =====

void __h3000 FUN_M69_big_0c000__071a(void)

{
  FUN_M69_big_0c000__1165();
  FUN_M69_big_0c000__07a7();
  FUN_e585();
  return;
}


// ===== FUN_M69_big_0c000__0725 @ M69_big_0c000::0725 =====

void __h3000 FUN_M69_big_0c000__0725(void)

{
  FUN_M69_big_0c000__0f47();
  FUN_M69_big_0c000__07a7();
  FUN_e58d();
  return;
}


// ===== FUN_M69_big_0c000__0730 @ M69_big_0c000::0730 =====

void __h3000 FUN_M69_big_0c000__0730(void)

{
  FUN_M69_big_0c000__1274();
  FUN_M69_big_0c000__080e();
  FUN_e585();
  return;
}


// ===== FUN_M69_big_0c000__073b @ M69_big_0c000::073b =====

void __h3000 FUN_M69_big_0c000__073b(void)

{
  FUN_M69_big_0c000__1378();
  FUN_M69_big_0c000__080e();
  FUN_e58d();
  return;
}


// ===== FUN_M69_big_0c000__0746 @ M69_big_0c000::0746 =====

void __h3000 FUN_M69_big_0c000__0746(void)

{
  FUN_M69_big_0c000__16c8();
  FUN_M69_big_0c000__080e();
  FUN_e595();
  return;
}


// ===== FUN_M69_big_0c000__0751 @ M69_big_0c000::0751 =====

void __h3000 FUN_M69_big_0c000__0751(void)

{
  FUN_M69_big_0c000__17ca();
  FUN_M69_big_0c000__17f1();
  FUN_M69_big_0c000__07e0();
  API_FDEA();
  return;
}


// ===== FUN_M69_big_0c000__075f @ M69_big_0c000::075f =====

void __h3000 FUN_M69_big_0c000__075f(void)

{
  FUN_M69_big_0c000__1056();
  FUN_M69_big_0c000__07a7();
  FUN_e595();
  return;
}


// ===== FUN_M69_big_0c000__076c @ M69_big_0c000::076c =====

void __h3000 FUN_M69_big_0c000__076c(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M69_big_0c000__0771 @ M69_big_0c000::0771 =====

undefined2 __h3000 FUN_M69_big_0c000__0771(undefined1 param_1)

{
  undefined2 in_stack_00000001;
  
  LcdSetCursor(param_1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return in_stack_00000001;
}


// ===== FUN_M69_big_0c000__07a7 @ M69_big_0c000::07a7 =====

void __h3000 FUN_M69_big_0c000__07a7(void)

{
                    /* inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$118C ->$0F6E ->$107D ->$0E17 ->$07E0 ->$07E0 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__07e0 @ M69_big_0c000::07e0 =====

void __h3000 FUN_M69_big_0c000__07e0(void)

{
                    /* inline[API_FE02]: "  mix   " [-] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_big_0c000__1882();
                    /* inline[API_FE00]: ->$236B ->$17DF ->$0DC9 ->$080E ->$07A7 ->$07A7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__080e @ M69_big_0c000::080e =====

void __h3000 FUN_M69_big_0c000__080e(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$129B ->$139C ->$0DC9 ->$07E0 ->$0840 ->$0840 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0840 @ M69_big_0c000::0840 =====

void __h3000 FUN_M69_big_0c000__0840(void)

{
                    /* inline[API_FE02]: " rates  " " depths " " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0B71 ->$0BE5 ->$0AFD ->$07E0 ->$080E ->$080E */
  SetModuleHandlers();
  DAT_7120 = FUN_M69_big_0c000__0840;
  return;
}


// ===== FUN_M69_big_0c000__087f @ M69_big_0c000::087f =====

void __h3000 FUN_M69_big_0c000__087f(void)

{
                    /* inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$118C ->$0F6E ->$107D ->$148C ->$08B8 ->$08B8 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__08b8 @ M69_big_0c000::08b8 =====

void __h3000 FUN_M69_big_0c000__08b8(void)

{
                    /* inline[API_FE02]: " width  " [-] "  mix   " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_big_0c000__1882();
                    /* inline[API_FE00]: ->$15B1 ->$17DF ->$236B ->$08ED ->$087F ->$087F */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__08ed @ M69_big_0c000::08ed =====

void __h3000 FUN_M69_big_0c000__08ed(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" "st/mono " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$129B ->$139C ->$16EC ->$08B8 ->$0926 ->$0926 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0926 @ M69_big_0c000::0926 =====

void __h3000 FUN_M69_big_0c000__0926(void)

{
                    /* inline[API_FE02]: " rates  " " depths " " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0B71 ->$0BE5 ->$0AFD ->$08B8 ->$0965 ->$08ED */
  SetModuleHandlers();
  DAT_7120 = FUN_M69_big_0c000__0926;
  return;
}


// ===== FUN_M69_big_0c000__0965 @ M69_big_0c000::0965 =====

void __h3000 FUN_M69_big_0c000__0965(void)

{
                    /* inline[API_FE02]: "fdbacks " " pans   " " levels " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D41 ->$0CCD ->$0C59 ->$08B8 ->$08ED ->$0926 */
  SetModuleHandlers();
  DAT_7120 = FUN_M69_big_0c000__0965;
  return;
}


// ===== FUN_M69_big_0c000__09a4 @ M69_big_0c000::09a4 =====

void __h3000 FUN_M69_big_0c000__09a4(void)

{
                    /* inline[API_FE02]: " delay  " [-] "feedback" " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_big_0c000__1882();
                    /* inline[API_FE00]: ->$26BD ->$17DF ->$29DB ->$0A04 ->$09D9 ->$09D9 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__09d9 @ M69_big_0c000::09d9 =====

void __h3000 FUN_M69_big_0c000__09d9(void)

{
                    /* inline[API_FE02]: "  mix   " [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$236B ->$0DC9 ->$0DC9 ->$0A04 ->$09A4 ->$09A4 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0a04 @ M69_big_0c000::0a04 =====

void __h3000 FUN_M69_big_0c000__0a04(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$129B ->$139C ->$0DC9 ->$09A4 ->$0A04 ->$0A04 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0a36 @ M69_big_0c000::0a36 =====

void __h3000 FUN_M69_big_0c000__0a36(void)

{
                    /* inline[API_FE02]: "l delay " [-] "l mix   " "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_big_0c000__1882();
                    /* inline[API_FE00]: ->$27BD ->$17DF ->$2489 ->$2A7C ->$0A6B ->$0AA0 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0a6b @ M69_big_0c000::0a6b =====

void __h3000 FUN_M69_big_0c000__0a6b(void)

{
                    /* inline[API_FE02]: "r delay " [-] "r mix   " "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M69_big_0c000__1882();
                    /* inline[API_FE00]: ->$28DF ->$17DF ->$25A3 ->$2BAB ->$0AA0 ->$0A36 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0aa0 @ M69_big_0c000::0aa0 =====

void __h3000 FUN_M69_big_0c000__0aa0(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0DC9 ->$0DC9 ->$0DC9 ->$0AC4 ->$0A36 ->$0A6B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0ac4 @ M69_big_0c000::0ac4 =====

void __h3000 FUN_M69_big_0c000__0ac4(void)

{
                    /* inline[API_FE02]: "glide sp" "glide en" "st/mono " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$129B ->$139C ->$16EC ->$0A36 ->$0AC4 ->$0AC4 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0afd @ M69_big_0c000::0afd =====

void __h3000 FUN_M69_big_0c000__0afd(void)

{
                    /* inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$19DE ->$19EC ->$19FA ->$1A08 ->$0B36 ->$0B36 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0b36 @ M69_big_0c000::0b36 =====

void __h3000 FUN_M69_big_0c000__0b36(void)

{
                    /* inline[API_FE02]: "delay 5 " "delay 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1A16 ->$1A24 ->$0DC9 ->$0DC9 ->$0AFD ->$0AFD */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7120 >> 8));
  return;
}


// ===== FUN_M69_big_0c000__0b71 @ M69_big_0c000::0b71 =====

void __h3000 FUN_M69_big_0c000__0b71(void)

{
                    /* inline[API_FE02]: " rate 1 " " rate 2 " " rate 3 " " rate 4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1C0A ->$1C14 ->$1C1E ->$1C28 ->$0BAA ->$0BAA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0baa @ M69_big_0c000::0baa =====

void __h3000 FUN_M69_big_0c000__0baa(void)

{
                    /* inline[API_FE02]: " rate 5 " " rate 6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1C32 ->$1C3C ->$0DC9 ->$0DC9 ->$0B71 ->$0B71 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7120 >> 8));
  return;
}


// ===== FUN_M69_big_0c000__0be5 @ M69_big_0c000::0be5 =====

void __h3000 FUN_M69_big_0c000__0be5(void)

{
                    /* inline[API_FE02]: " depth 1" " depth 2" " depth 3" " depth4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D67 ->$1D71 ->$1D7B ->$1D85 ->$0C1E ->$0C1E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0c1e @ M69_big_0c000::0c1e =====

void __h3000 FUN_M69_big_0c000__0c1e(void)

{
                    /* inline[API_FE02]: " depth 5" " depth6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D8F ->$1D99 ->$0DC9 ->$0DC9 ->$0BE5 ->$0BE5 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7120 >> 8));
  return;
}


// ===== FUN_M69_big_0c000__0c59 @ M69_big_0c000::0c59 =====

void __h3000 FUN_M69_big_0c000__0c59(void)

{
                    /* inline[API_FE02]: " level 1" " level 2" " level 3" " level 4" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1EC4 ->$1ED2 ->$1EE0 ->$1EEE ->$0C92 ->$0C92 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0c92 @ M69_big_0c000::0c92 =====

void __h3000 FUN_M69_big_0c000__0c92(void)

{
                    /* inline[API_FE02]: " level 5" " level 6" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1EFC ->$1F0A ->$0DC9 ->$0DC9 ->$0C59 ->$0C59 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7120 >> 8));
  return;
}


// ===== FUN_M69_big_0c000__0ccd @ M69_big_0c000::0ccd =====

void __h3000 FUN_M69_big_0c000__0ccd(void)

{
                    /* inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2082 ->$2090 ->$209E ->$20AC ->$0D06 ->$0D06 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0d06 @ M69_big_0c000::0d06 =====

void __h3000 FUN_M69_big_0c000__0d06(void)

{
                    /* inline[API_FE02]: " pan 5  " " pan 6  " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$20BA ->$20C8 ->$0DC9 ->$0DC9 ->$0CCD ->$0CCD */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7120 >> 8));
  return;
}


// ===== FUN_M69_big_0c000__0d41 @ M69_big_0c000::0d41 =====

void __h3000 FUN_M69_big_0c000__0d41(void)

{
                    /* inline[API_FE02]: "  fb   1" "  fb   2" "  fb   3" "  fb  4 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$21FC ->$2206 ->$2210 ->$221A ->$0D7A ->$0D7A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M69_big_0c000__0d7a @ M69_big_0c000::0d7a =====

void __h3000 FUN_M69_big_0c000__0d7a(void)

{
                    /* inline[API_FE02]: "  fb   5" "  fb  6 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2224 ->$222E ->$0DC9 ->$0DC9 ->$0D41 ->$0D41 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_7120 >> 8));
  return;
}


// ===== FUN_M69_big_0c000__0db5 @ M69_big_0c000::0db5 =====

void __h3000 FUN_M69_big_0c000__0db5(void)

{
                    /* inline[API_FE02]: [-] " range  " [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
  return;
}


// ===== FUN_M69_big_0c000__0dc9 @ M69_big_0c000::0dc9 =====

void __h3000 FUN_M69_big_0c000__0dc9(void)

{
  return;
}


// ===== FUN_M69_big_0c000__0dd8 @ M69_big_0c000::0dd8 =====

void __h3000 FUN_M69_big_0c000__0dd8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0E8E ->$0EA3 $7018 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__0e8e_M69_big_0c000__0dca);
  return;
}


// ===== FUN_M69_big_0c000__0de4 @ M69_big_0c000::0de4 =====

void __h3000 FUN_M69_big_0c000__0de4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0E8E ->$0EA3 $7018 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__0e8e_M69_big_0c000__0dca);
  return;
}


// ===== FUN_M69_big_0c000__0df0 @ M69_big_0c000::0df0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0df0(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7018 = DAT_60f9 - DAT_701a;
  FUN_M69_big_0c000__0ea3();
  API_FC82((char)((ushort)DAT_7018 >> 8),(char)DAT_7018,param_1,0x4f);
  return in_D;
}


// ===== FUN_M69_big_0c000__0e17 @ M69_big_0c000::0e17 =====

undefined2 __h3000 FUN_M69_big_0c000__0e17(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_701c;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       master fdback:     %" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$0E8E ->$0E64
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__0e8e();
  return in_D;
}


// ===== FUN_M69_big_0c000__0e64 @ M69_big_0c000::0e64 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0e64(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7018 = DAT_6074 - DAT_701a;
  API_FC82((char)((ushort)DAT_7018 >> 8),(char)DAT_7018,param_1,0x4f);
  FUN_eb1d((char)((ushort)DAT_7018 >> 8),(char)DAT_7018,param_1,1);
  FUN_M69_big_0c000__0ea3();
  return in_D;
}


// ===== FUN_M69_big_0c000__0e8e @ M69_big_0c000::0e8e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0e8e(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__0ea3 @ M69_big_0c000::0ea3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0ea3(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 in_D;
  short *psVar2;
  
  *(undefined1 *)(param_3 + -1) = 0x9c;
  *(undefined1 *)(param_3 + -2) = 0xff;
  *(undefined1 *)(param_3 + -3) = 100;
  *(undefined1 *)(param_3 + -4) = 0;
  psVar2 = (short *)(param_3 + -6);
  *psVar2 = DAT_7018 + DAT_701a;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_701c = sVar1;
  if (DAT_7050 != 0) {
    *(char *)((short)psVar2 + 1) = (char)sVar1;
    *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
    *(undefined1 *)((short)psVar2 + -1) = 0x34;
    psVar2 = psVar2 + -1;
    *(undefined1 *)psVar2 = 1;
    API_FCEC();
    sVar1 = DAT_701c;
    DAT_70fa = *psVar2;
    *(char *)((short)psVar2 + 1) = (char)DAT_701c;
    *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
    *(undefined1 *)((short)psVar2 + -1) = 0x51;
    psVar2 = psVar2 + -1;
    *(undefined1 *)psVar2 = 0x78;
    API_FCF2();
    DAT_7124 = *psVar2 + DAT_70fa;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7124 >> 8),(char)DAT_7124,param_1,FUN_M69_big_0c000__0240);
    DAT_70fc = 0x7fff;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70fc >> 8),(char)DAT_70fc,param_1,0x241);
  }
  return in_D;
}


// ===== FUN_M69_big_0c000__0f2f @ M69_big_0c000::0f2f =====

void __h3000 FUN_M69_big_0c000__0f2f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0FE5 ->$0FFA $7030 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__0fe5_M69_big_0c000__0f21);
  return;
}


// ===== FUN_M69_big_0c000__0f3b @ M69_big_0c000::0f3b =====

void __h3000 FUN_M69_big_0c000__0f3b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0FE5 ->$0FFA $7030 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__0fe5_M69_big_0c000__0f21);
  return;
}


// ===== FUN_M69_big_0c000__0f47 @ M69_big_0c000::0f47 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0f47(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7030 = DAT_60f9 - DAT_7032;
  FUN_M69_big_0c000__0ffa();
  API_FC82((char)((ushort)DAT_7030 >> 8),(char)DAT_7030,param_1,0x35);
  return in_D;
}


// ===== FUN_M69_big_0c000__0f6e @ M69_big_0c000::0f6e =====

undefined2 __h3000 FUN_M69_big_0c000__0f6e(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7034;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       master rate:     %  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$0FE5 ->$0FBB
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__0fe5();
  return in_D;
}


// ===== FUN_M69_big_0c000__0fbb @ M69_big_0c000::0fbb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0fbb(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7030 = DAT_6074 - DAT_7032;
  API_FC82((char)((ushort)DAT_7030 >> 8),(char)DAT_7030,param_1,0x35);
  FUN_eb1d((char)((ushort)DAT_7030 >> 8),(char)DAT_7030,param_1,3);
  FUN_M69_big_0c000__0ffa();
  return in_D;
}


// ===== FUN_M69_big_0c000__0fe5 @ M69_big_0c000::0fe5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__0fe5(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__0ffa @ M69_big_0c000::0ffa =====

undefined2 __h3000 FUN_M69_big_0c000__0ffa(void)

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
  *psVar2 = DAT_7030 + DAT_7032;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7034 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEE();
  DAT_7116 = *psVar2;
  FUN_M69_big_0c000__2f5a();
  return in_D;
}


// ===== FUN_M69_big_0c000__103e @ M69_big_0c000::103e =====

void __h3000 FUN_M69_big_0c000__103e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$10F4 ->$1109 $7028 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__10f4_M69_big_0c000__1030);
  return;
}


// ===== FUN_M69_big_0c000__104a @ M69_big_0c000::104a =====

void __h3000 FUN_M69_big_0c000__104a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$10F4 ->$1109 $7028 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__10f4_M69_big_0c000__1030);
  return;
}


// ===== FUN_M69_big_0c000__1056 @ M69_big_0c000::1056 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1056(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7028 = DAT_60f9 - DAT_702a;
  FUN_M69_big_0c000__1109();
  API_FC82((char)((ushort)DAT_7028 >> 8),(char)DAT_7028,param_1,0x53);
  return in_D;
}


// ===== FUN_M69_big_0c000__107d @ M69_big_0c000::107d =====

undefined2 __h3000 FUN_M69_big_0c000__107d(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_702c;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       master depth:     % " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$10F4 ->$10CA
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__10f4();
  return in_D;
}


// ===== FUN_M69_big_0c000__10ca @ M69_big_0c000::10ca =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__10ca(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7028 = DAT_6074 - DAT_702a;
  API_FC82((char)((ushort)DAT_7028 >> 8),(char)DAT_7028,param_1,0x53);
  FUN_eb1d((char)((ushort)DAT_7028 >> 8),(char)DAT_7028,param_1,8);
  FUN_M69_big_0c000__1109();
  return in_D;
}


// ===== FUN_M69_big_0c000__10f4 @ M69_big_0c000::10f4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__10f4(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__1109 @ M69_big_0c000::1109 =====

undefined2 __h3000 FUN_M69_big_0c000__1109(void)

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
  *psVar2 = DAT_7028 + DAT_702a;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_702c = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEE();
  DAT_7114 = *psVar2;
  FUN_M69_big_0c000__2fc8();
  return in_D;
}


// ===== FUN_M69_big_0c000__114d @ M69_big_0c000::114d =====

void __h3000 FUN_M69_big_0c000__114d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1203 ->$1218 $7038 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__1203_M69_big_0c000__113f);
  return;
}


// ===== FUN_M69_big_0c000__1159 @ M69_big_0c000::1159 =====

void __h3000 FUN_M69_big_0c000__1159(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1203 ->$1218 $7038 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__1203_M69_big_0c000__113f);
  return;
}


// ===== FUN_M69_big_0c000__1165 @ M69_big_0c000::1165 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1165(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7038 = DAT_60f9 - DAT_703a;
  FUN_M69_big_0c000__1218();
  API_FC82((char)((ushort)DAT_7038 >> 8),(char)DAT_7038,param_1,0x31);
  return in_D;
}


// ===== FUN_M69_big_0c000__118c @ M69_big_0c000::118c =====

undefined2 __h3000 FUN_M69_big_0c000__118c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_703c;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       master delay:     % " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1203 ->$11D9
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1203();
  return in_D;
}


// ===== FUN_M69_big_0c000__11d9 @ M69_big_0c000::11d9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__11d9(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7038 = DAT_6074 - DAT_703a;
  API_FC82((char)((ushort)DAT_7038 >> 8),(char)DAT_7038,param_1,0x31);
  FUN_eb1d((char)((ushort)DAT_7038 >> 8),(char)DAT_7038,param_1,2);
  FUN_M69_big_0c000__1218();
  return in_D;
}


// ===== FUN_M69_big_0c000__1203 @ M69_big_0c000::1203 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1203(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__1218 @ M69_big_0c000::1218 =====

undefined2 __h3000 FUN_M69_big_0c000__1218(void)

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
  *psVar2 = DAT_7038 + DAT_703a;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_703c = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEE();
  DAT_7118 = *psVar2;
  FUN_M69_big_0c000__2ebb();
  return in_D;
}


// ===== FUN_M69_big_0c000__125c @ M69_big_0c000::125c =====

void __h3000 FUN_M69_big_0c000__125c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1312 ->$1327 $7020 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__1312_M69_big_0c000__124e);
  return;
}


// ===== FUN_M69_big_0c000__1268 @ M69_big_0c000::1268 =====

void __h3000 FUN_M69_big_0c000__1268(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1312 ->$1327 $7020 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__1312_M69_big_0c000__124e);
  return;
}


// ===== FUN_M69_big_0c000__1274 @ M69_big_0c000::1274 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1274(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7020 = DAT_60f9 - DAT_7022;
  FUN_M69_big_0c000__1327();
  API_FC82((char)((ushort)DAT_7020 >> 8),(char)DAT_7020,param_1,0x3d);
  return in_D;
}


// ===== FUN_M69_big_0c000__129b @ M69_big_0c000::129b =====

undefined2 __h3000 FUN_M69_big_0c000__129b(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7024;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       glide rate:         " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1312 ->$12E8
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1312();
  return in_D;
}


// ===== FUN_M69_big_0c000__12e8 @ M69_big_0c000::12e8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__12e8(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7020 = DAT_6074 - DAT_7022;
  API_FC82((char)((ushort)DAT_7020 >> 8),(char)DAT_7020,param_1,0x3d);
  FUN_eb1d((char)((ushort)DAT_7020 >> 8),(char)DAT_7020,param_1,4);
  FUN_M69_big_0c000__1327();
  return in_D;
}


// ===== FUN_M69_big_0c000__1312 @ M69_big_0c000::1312 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1312(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__1327 @ M69_big_0c000::1327 =====

undefined2 __h3000 FUN_M69_big_0c000__1327(void)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar3 = (short *)(in_U + -6);
  *psVar3 = DAT_7020 + DAT_7022;
  API_FCD8();
  sVar1 = *psVar3;
  DAT_7024 = sVar1;
  *(char *)((short)psVar3 + 1) = (char)sVar1;
  *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x2c;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 1;
  API_FCEE();
  DAT_7110 = *psVar3;
  *(undefined1 *)((short)psVar3 + 1) = 0x87;
  *(undefined1 *)psVar3 = 0;
  uVar2 = DAT_711e;
  *(char *)((short)psVar3 + -1) = (char)DAT_711e;
  psVar3 = psVar3 + -1;
  *(char *)psVar3 = (char)((ushort)uVar2 >> 8);
  API_FCEE();
  sVar1 = DAT_7024;
  *(char *)((short)psVar3 + -1) = (char)DAT_7024;
  psVar3 = psVar3 + -1;
  *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
  API_FCE6();
  DAT_7112 = CONCAT11(*(char *)psVar3 << 1 | (byte)*psVar3 >> 7,(byte)*psVar3 << 1);
  return in_D;
}


// ===== FUN_M69_big_0c000__1378 @ M69_big_0c000::1378 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1378(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7058 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M69_big_0c000__143e();
  API_FC80((char)((ushort)DAT_7058 >> 8),(char)DAT_7058,param_1,0x41);
  return in_D;
}


// ===== FUN_M69_big_0c000__139c @ M69_big_0c000::139c =====

undefined2 __h3000 FUN_M69_big_0c000__139c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7058;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay gliding:      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$1410 ->$13E9
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1410();
  return in_D;
}


// ===== FUN_M69_big_0c000__13e9 @ M69_big_0c000::13e9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__13e9(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7058 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x41);
  FUN_eb1d((char)((ushort)DAT_7058 >> 8),(char)DAT_7058,param_1,5);
  FUN_M69_big_0c000__143e();
  return in_D;
}


// ===== FUN_M69_big_0c000__1410 @ M69_big_0c000::1410 =====

undefined2 __h3000 FUN_M69_big_0c000__1410(void)

{
  undefined2 in_D;
  
  if (DAT_7058 == 0) {
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


// ===== FUN_M69_big_0c000__143e @ M69_big_0c000::143e =====

void __h3000 FUN_M69_big_0c000__143e(void)

{
  return;
}


// ===== FUN_M69_big_0c000__144d @ M69_big_0c000::144d =====

void __h3000 FUN_M69_big_0c000__144d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1503 ->$1518 $7040 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__1503_M69_big_0c000__143f);
  return;
}


// ===== FUN_M69_big_0c000__1459 @ M69_big_0c000::1459 =====

void __h3000 FUN_M69_big_0c000__1459(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1503 ->$1518 $7040 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__1503_M69_big_0c000__143f);
  return;
}


// ===== FUN_M69_big_0c000__1465 @ M69_big_0c000::1465 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1465(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7040 = DAT_60f9 - DAT_7042;
  FUN_M69_big_0c000__1518();
  API_FC82((char)((ushort)DAT_7040 >> 8),(char)DAT_7040,param_1,0x7b);
  return in_D;
}


// ===== FUN_M69_big_0c000__148c @ M69_big_0c000::148c =====

undefined2 __h3000 FUN_M69_big_0c000__148c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7044;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       master fdback:     %" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$1503 ->$14D9
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1503();
  return in_D;
}


// ===== FUN_M69_big_0c000__14d9 @ M69_big_0c000::14d9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__14d9(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7040 = DAT_6074 - DAT_7042;
  API_FC82((char)((ushort)DAT_7040 >> 8),(char)DAT_7040,param_1,0x7b);
  FUN_eb1d((char)((ushort)DAT_7040 >> 8),(char)DAT_7040,param_1,9);
  FUN_M69_big_0c000__1518();
  return in_D;
}


// ===== FUN_M69_big_0c000__1503 @ M69_big_0c000::1503 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1503(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__1518 @ M69_big_0c000::1518 =====

undefined2 __h3000 FUN_M69_big_0c000__1518(void)

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
  *psVar2 = DAT_7040 + DAT_7042;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7044 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  sVar1 = DAT_7044;
  DAT_70fa = *psVar2;
  *(char *)((short)psVar2 + 1) = (char)DAT_7044;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  DAT_711a = *psVar2 + DAT_70fa;
  FUN_M69_big_0c000__30d5();
  return in_D;
}


// ===== FUN_M69_big_0c000__1572 @ M69_big_0c000::1572 =====

void __h3000 FUN_M69_big_0c000__1572(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1637 ->$1692 $7048 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__1637_M69_big_0c000__1564);
  return;
}


// ===== FUN_M69_big_0c000__157e @ M69_big_0c000::157e =====

void __h3000 FUN_M69_big_0c000__157e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1637 ->$1692 $7048 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__1637_M69_big_0c000__1564);
  return;
}


// ===== FUN_M69_big_0c000__158a @ M69_big_0c000::158a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__158a(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7048 = DAT_60f9 - DAT_704a;
  FUN_M69_big_0c000__1692();
  API_FC82((char)((ushort)DAT_7048 >> 8),(char)DAT_7048,param_1,0x7f);
  return in_D;
}


// ===== FUN_M69_big_0c000__15b1 @ M69_big_0c000::15b1 =====

undefined2 __h3000 FUN_M69_big_0c000__15b1(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_704c;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       image width:-                     -" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$1637 ->$160D
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1637();
  return in_D;
}


// ===== FUN_M69_big_0c000__160d @ M69_big_0c000::160d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__160d(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7048 = DAT_6074 - DAT_704a;
  API_FC82((char)((ushort)DAT_7048 >> 8),(char)DAT_7048,param_1,0x7f);
  FUN_eb1d((char)((ushort)DAT_7048 >> 8),(char)DAT_7048,param_1,10);
  FUN_M69_big_0c000__1692();
  return in_D;
}


// ===== FUN_M69_big_0c000__1637 @ M69_big_0c000::1637 =====

undefined2 __h3000 FUN_M69_big_0c000__1637(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                     " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_704c + 100;
  *(undefined1 *)(in_U + -3) = 10;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  DAT_70fa = *psVar1;
  LcdSetCursor((char)((ushort)(DAT_70fa + 0x12) >> 8));
  API_FC2A();
  LcdSetCursor((char)((ushort)(0x26 - DAT_70fa) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M69_big_0c000__1692 @ M69_big_0c000::1692 =====

undefined2 __h3000 FUN_M69_big_0c000__1692(void)

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
  *psVar2 = DAT_7048 + DAT_704a;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_704c = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x47;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  DAT_711c = *psVar2;
  FUN_M69_big_0c000__3050();
  return in_D;
}


// ===== FUN_M69_big_0c000__16c8 @ M69_big_0c000::16c8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__16c8(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_705a = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M69_big_0c000__1794();
  API_FC80((char)((ushort)DAT_705a >> 8),(char)DAT_705a,param_1,0x42);
  return in_D;
}


// ===== FUN_M69_big_0c000__16ec @ M69_big_0c000::16ec =====

undefined2 __h3000 FUN_M69_big_0c000__16ec(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_705a;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       input mode:         " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$1760 ->$1739
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1760();
  return in_D;
}


// ===== FUN_M69_big_0c000__1739 @ M69_big_0c000::1739 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1739(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_705a = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x42);
  FUN_eb1d((char)((ushort)DAT_705a >> 8),(char)DAT_705a,param_1,6);
  FUN_M69_big_0c000__1794();
  return in_D;
}


// ===== FUN_M69_big_0c000__1760 @ M69_big_0c000::1760 =====

undefined2 __h3000 FUN_M69_big_0c000__1760(void)

{
  undefined2 in_D;
  
  if (DAT_705a == 0) {
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


// ===== FUN_M69_big_0c000__1794 @ M69_big_0c000::1794 =====

undefined2 __h3000 FUN_M69_big_0c000__1794(void)

{
  undefined2 in_D;
  
  if (DAT_705a == 0) {
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0xff);
  }
  return in_D;
}


// ===== FUN_M69_big_0c000__17ca @ M69_big_0c000::17ca =====

undefined2 __h3000 FUN_M69_big_0c000__17ca(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7050 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M69_big_0c000__18ba();
  return in_D;
}


// ===== FUN_M69_big_0c000__17df @ M69_big_0c000::17df =====

undefined2 __h3000 FUN_M69_big_0c000__17df(void)

{
  undefined2 in_D;
  
  DAT_7050 = DAT_7050 ^ 0xffff;
  FUN_M69_big_0c000__180e();
  return in_D;
}


// ===== FUN_M69_big_0c000__17f1 @ M69_big_0c000::17f1 =====

undefined2 __h3000 FUN_M69_big_0c000__17f1(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__18ba();
  FUN_M69_big_0c000__182a();
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xd);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xd);
  return in_D;
}


// ===== FUN_M69_big_0c000__180e @ M69_big_0c000::180e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__180e(undefined2 param_1)

{
  undefined2 in_D;
  
  FUN_eb1d((char)((ushort)DAT_7050 >> 8),(char)DAT_7050,param_1,7);
  FUN_M69_big_0c000__18ba();
  FUN_M69_big_0c000__182a();
  FUN_M69_big_0c000__1882();
  API_FDEA();
  return in_D;
}


// ===== FUN_M69_big_0c000__182a @ M69_big_0c000::182a =====

undefined2 __h3000 FUN_M69_big_0c000__182a(void)

{
  undefined2 in_D;
  
  if (DAT_7050 == 0) {
    FUN_M69_big_0c000__076c();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       ---repeat looping---" */
    LcdPrintInline();
  }
  else {
    FUN_M69_big_0c000__076c();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       --normal operation--" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M69_big_0c000__1882 @ M69_big_0c000::1882 =====

undefined2 __h3000 FUN_M69_big_0c000__1882(void)

{
  undefined2 in_D;
  
  if (DAT_7050 == 0) {
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


// ===== FUN_M69_big_0c000__18ba @ M69_big_0c000::18ba =====

undefined2 __h3000 FUN_M69_big_0c000__18ba(void)

{
  undefined2 in_D;
  
  if (DAT_7122 == 0) {
    if (DAT_7050 == 0) {
      DAT_70fc = &DAT_7124;
      DAT_70fe = 100;
      DAT_7100 = 200;
      do {
        DAT_70fa = 0;
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_70fa >> 8));
        DAT_70fc = (undefined2 *)((short)DAT_70fc + DAT_7100);
        if (DAT_70fc < (undefined2 *)0x78af == (DAT_70fc == (undefined2 *)0x78af)) {
          DAT_70fc = (undefined2 *)0x78af;
        }
        API_FD20(0);
        API_FD2E((char)((ushort)DAT_70fc >> 8));
      } while (DAT_70fc < (undefined2 *)0x78af != (DAT_70fc == (undefined2 *)0x78af));
    }
    else {
      FUN_M69_big_0c000__0ea3();
    }
  }
  else if (DAT_7050 == 0) {
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0xff);
  }
  return in_D;
}


// ===== FUN_M69_big_0c000__1988 @ M69_big_0c000::1988 =====

undefined2 __h3000 FUN_M69_big_0c000__1988(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0);
  DAT_6074 = DAT_60f9;
  *DAT_70cc = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__19de + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1aba();
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__198f @ M69_big_0c000::198f =====

undefined2 __h3000 FUN_M69_big_0c000__198f(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0);
  DAT_6074 = DAT_60f9;
  *DAT_70cc = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__19de + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1aba();
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1996 @ M69_big_0c000::1996 =====

undefined2 __h3000 FUN_M69_big_0c000__1996(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0);
  DAT_6074 = DAT_60f9;
  *DAT_70cc = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__19de + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1aba();
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__199d @ M69_big_0c000::199d =====

undefined2 __h3000 FUN_M69_big_0c000__199d(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0);
  DAT_6074 = DAT_60f9;
  *DAT_70cc = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__19de + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1aba();
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__19a4 @ M69_big_0c000::19a4 =====

undefined2 __h3000 FUN_M69_big_0c000__19a4(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0);
  DAT_6074 = DAT_60f9;
  *DAT_70cc = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__19de + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1aba();
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__19ab @ M69_big_0c000::19ab =====

undefined2 __h3000 FUN_M69_big_0c000__19ab(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0);
  DAT_6074 = DAT_60f9;
  *DAT_70cc = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__19de + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1aba();
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__19de @ M69_big_0c000::19de =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__19de(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,0,&UNK_M69_big_0c000__044c,&UNK_M69_big_0c000__0440);
  DAT_6074 = *DAT_70cc;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1aba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__19ec @ M69_big_0c000::19ec =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__19ec(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,1,&UNK_M69_big_0c000__044d,&UNK_M69_big_0c000__0441);
  DAT_6074 = *DAT_70cc;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1aba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__19fa @ M69_big_0c000::19fa =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__19fa(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,2,&UNK_M69_big_0c000__044e,&UNK_M69_big_0c000__0442);
  DAT_6074 = *DAT_70cc;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1aba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1a08 @ M69_big_0c000::1a08 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1a08(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,3,&UNK_M69_big_0c000__044f,&UNK_M69_big_0c000__0443);
  DAT_6074 = *DAT_70cc;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1aba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1a16 @ M69_big_0c000::1a16 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1a16(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,4,&UNK_M69_big_0c000__0450,&UNK_M69_big_0c000__0444);
  DAT_6074 = *DAT_70cc;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1aba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1a24 @ M69_big_0c000::1a24 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1a24(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,5,&UNK_M69_big_0c000__0451,&UNK_M69_big_0c000__0445);
  DAT_6074 = *DAT_70cc;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       delay  :     mS     " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $00C8 $0000 $0000 ->$1ABA ->$1A8E
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1aba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1a8e @ M69_big_0c000::1a8e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1a8e(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70cc = DAT_6074;
  API_FC80();
  FUN_eb1d((char)((ushort)*DAT_70cc >> 8),(char)*DAT_70cc,param_1,DAT_70f8 + 0xb);
  DAT_711e = 0xe1;
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1aba @ M69_big_0c000::1aba =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1aba(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__1acf @ M69_big_0c000::1acf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1acf(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  short *psVar3;
  
  uVar1 = *DAT_70cc;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0x2c;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = 0;
  API_FCEE();
  uVar1 = DAT_7118;
  puVar2[-1] = (char)DAT_7118;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70fa = *psVar3 + *DAT_70e4;
  if (DAT_7058 == -1) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70e8);
    DAT_70e8 = DAT_70e8 + 0xc;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70e8);
    DAT_70e8 = DAT_70e8 + 6;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70e8);
    DAT_70e8 = DAT_70e8 + -0x12;
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70e8);
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7110 >> 8),(char)DAT_7110,param_1,DAT_70f4);
    API_FD20(0);
    API_FD2E(0,0,param_1,DAT_70f6);
    DAT_70e8 = DAT_70e8 + 0x12;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70e8);
    DAT_70e8 = DAT_70e8 + -0x12;
    API_FCC4((char)((ushort)DAT_7112 >> 8));
  }
  return in_D;
}


// ===== FUN_M69_big_0c000__1bb4 @ M69_big_0c000::1bb4 =====

undefined2 __h3000 FUN_M69_big_0c000__1bb4(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ce = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1c0a + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1cc8();
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1bbb @ M69_big_0c000::1bbb =====

undefined2 __h3000 FUN_M69_big_0c000__1bbb(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ce = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1c0a + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1cc8();
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1bc2 @ M69_big_0c000::1bc2 =====

undefined2 __h3000 FUN_M69_big_0c000__1bc2(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ce = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1c0a + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1cc8();
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1bc9 @ M69_big_0c000::1bc9 =====

undefined2 __h3000 FUN_M69_big_0c000__1bc9(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ce = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1c0a + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1cc8();
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1bd0 @ M69_big_0c000::1bd0 =====

undefined2 __h3000 FUN_M69_big_0c000__1bd0(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ce = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1c0a + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1cc8();
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1bd7 @ M69_big_0c000::1bd7 =====

undefined2 __h3000 FUN_M69_big_0c000__1bd7(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0);
  DAT_6074 = DAT_60f9;
  *DAT_70ce = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1c0a + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1cc8();
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1c0a @ M69_big_0c000::1c0a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1c0a(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,0,&UNK_M69_big_0c000__0440);
  DAT_6074 = *DAT_70ce;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1cc8();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1c14 @ M69_big_0c000::1c14 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1c14(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,1,&UNK_M69_big_0c000__0441);
  DAT_6074 = *DAT_70ce;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1cc8();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1c1e @ M69_big_0c000::1c1e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1c1e(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,2,&UNK_M69_big_0c000__0442);
  DAT_6074 = *DAT_70ce;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1cc8();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1c28 @ M69_big_0c000::1c28 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1c28(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,3,&UNK_M69_big_0c000__0443);
  DAT_6074 = *DAT_70ce;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1cc8();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1c32 @ M69_big_0c000::1c32 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1c32(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,4,&UNK_M69_big_0c000__0444);
  DAT_6074 = *DAT_70ce;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1cc8();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1c3c @ M69_big_0c000::1c3c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1c3c(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,5,&UNK_M69_big_0c000__0445);
  DAT_6074 = *DAT_70ce;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       rate  :             " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1CC8 ->$1CA2
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1cc8();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1ca2 @ M69_big_0c000::1ca2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1ca2(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70ce = DAT_6074;
  API_FC80();
  FUN_eb1d((char)((ushort)*DAT_70ce >> 8),(char)*DAT_70ce,param_1,DAT_70f8 + 0x17);
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__1cc8 @ M69_big_0c000::1cc8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1cc8(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__1cdd @ M69_big_0c000::1cdd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1cdd(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  uVar1 = *DAT_70ce;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0x47;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = 1;
  API_FCEE();
  uVar1 = DAT_7116;
  puVar2[-1] = (char)DAT_7116;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70fa = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70ea);
  return in_D;
}


// ===== FUN_M69_big_0c000__1d11 @ M69_big_0c000::1d11 =====

undefined2 __h3000 FUN_M69_big_0c000__1d11(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1d67 + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1e25();
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1d18 @ M69_big_0c000::1d18 =====

undefined2 __h3000 FUN_M69_big_0c000__1d18(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1d67 + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1e25();
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1d1f @ M69_big_0c000::1d1f =====

undefined2 __h3000 FUN_M69_big_0c000__1d1f(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1d67 + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1e25();
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1d26 @ M69_big_0c000::1d26 =====

undefined2 __h3000 FUN_M69_big_0c000__1d26(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1d67 + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1e25();
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1d2d @ M69_big_0c000::1d2d =====

undefined2 __h3000 FUN_M69_big_0c000__1d2d(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1d67 + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1e25();
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1d34 @ M69_big_0c000::1d34 =====

undefined2 __h3000 FUN_M69_big_0c000__1d34(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d0 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1d67 + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__1e25();
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1d67 @ M69_big_0c000::1d67 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1d67(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,0,&UNK_M69_big_0c000__0452);
  DAT_6074 = *DAT_70d0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1e25();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1d71 @ M69_big_0c000::1d71 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1d71(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,1,&UNK_M69_big_0c000__0453);
  DAT_6074 = *DAT_70d0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1e25();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1d7b @ M69_big_0c000::1d7b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1d7b(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,2,&UNK_M69_big_0c000__0454);
  DAT_6074 = *DAT_70d0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1e25();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1d85 @ M69_big_0c000::1d85 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1d85(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,3,&UNK_M69_big_0c000__0455);
  DAT_6074 = *DAT_70d0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1e25();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1d8f @ M69_big_0c000::1d8f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1d8f(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,4,&UNK_M69_big_0c000__0456);
  DAT_6074 = *DAT_70d0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1e25();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1d99 @ M69_big_0c000::1d99 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1d99(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,5,&UNK_M69_big_0c000__0457);
  DAT_6074 = *DAT_70d0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       depth  :    mS      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0028 $0000 $0000 ->$1E25 ->$1DFF
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1e25();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1dff @ M69_big_0c000::1dff =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1dff(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70d0 = DAT_6074;
  API_FC80();
  FUN_eb1d((char)((ushort)*DAT_70d0 >> 8),(char)*DAT_70d0,param_1,DAT_70f8 + 0x11);
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__1e25 @ M69_big_0c000::1e25 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1e25(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,2,0x60a1);
  return in_D;
}


// ===== FUN_M69_big_0c000__1e3a @ M69_big_0c000::1e3a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1e3a(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  uVar1 = *DAT_70d0;
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(param_3 + -3) = 0x2c;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = 0;
  API_FCEE();
  uVar1 = DAT_7114;
  puVar2[-1] = (char)DAT_7114;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70fa = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,DAT_70ec);
  return in_D;
}


// ===== FUN_M69_big_0c000__1e6e @ M69_big_0c000::1e6e =====

undefined2 __h3000 FUN_M69_big_0c000__1e6e(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1ec4 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1f9a();
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1e75 @ M69_big_0c000::1e75 =====

undefined2 __h3000 FUN_M69_big_0c000__1e75(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1ec4 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1f9a();
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1e7c @ M69_big_0c000::1e7c =====

undefined2 __h3000 FUN_M69_big_0c000__1e7c(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1ec4 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1f9a();
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1e83 @ M69_big_0c000::1e83 =====

undefined2 __h3000 FUN_M69_big_0c000__1e83(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1ec4 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1f9a();
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1e8a @ M69_big_0c000::1e8a =====

undefined2 __h3000 FUN_M69_big_0c000__1e8a(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1ec4 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1f9a();
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1e91 @ M69_big_0c000::1e91 =====

undefined2 __h3000 FUN_M69_big_0c000__1e91(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d2 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__1ec4 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__1f9a();
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1ec4 @ M69_big_0c000::1ec4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1ec4(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,0,0x140,0x143);
  DAT_6074 = *DAT_70d2;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1f9a();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1ed2 @ M69_big_0c000::1ed2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1ed2(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,1,0x141,0x144);
  DAT_6074 = *DAT_70d2;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1f9a();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1ee0 @ M69_big_0c000::1ee0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1ee0(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,2,0x142,0x145);
  DAT_6074 = *DAT_70d2;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1f9a();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1eee @ M69_big_0c000::1eee =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1eee(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,3,FUN_M69_big_0c000__0240,0x243);
  DAT_6074 = *DAT_70d2;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1f9a();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1efc @ M69_big_0c000::1efc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1efc(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,4,0x241,0x244);
  DAT_6074 = *DAT_70d2;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__1f9a();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1f0a @ M69_big_0c000::1f0a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1f0a(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,5,0x242,0x245);
  DAT_6074 = *DAT_70d2;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       level  :     %      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1F9A ->$1F74
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__1f9a();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__1f74 @ M69_big_0c000::1f74 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1f74(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70d2 = DAT_6074;
  API_FC80();
  FUN_eb1d((char)((ushort)*DAT_70d2 >> 8),(char)*DAT_70d2,param_1,DAT_70f8 + 0x1d);
  FUN_M69_big_0c000__1faf();
  return in_D;
}


// ===== FUN_M69_big_0c000__1f9a @ M69_big_0c000::1f9a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__1f9a(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__1faf @ M69_big_0c000::1faf =====

undefined2 __h3000 FUN_M69_big_0c000__1faf(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  short *psVar3;
  
  uVar1 = *DAT_70d2;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0xe;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 0;
  API_FCEE();
  DAT_70fa = *puVar2;
  uVar1 = *DAT_70d4;
  *(char *)((short)puVar2 + 1) = (char)uVar1;
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_711c;
  *(char *)((short)puVar2 + -1) = (char)DAT_711c;
  psVar3 = puVar2 + -1;
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70fc = *psVar3;
  *psVar3 = DAT_70fc + 0xb;
  uVar1 = DAT_70fa;
  *(char *)((short)psVar3 + -1) = (char)DAT_70fa;
  psVar3 = psVar3 + -1;
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_70fe = *psVar3;
  psVar3 = psVar3 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fe >> 8));
  psVar3[-1] = 0xb - DAT_70fc;
  uVar1 = DAT_70fa;
  *(char *)((short)psVar3 + -3) = (char)DAT_70fa;
  psVar3 = psVar3 + -2;
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_70fe = *psVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fe >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__202c @ M69_big_0c000::202c =====

undefined2 __h3000 FUN_M69_big_0c000__202c(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__2082 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__2167();
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__2033 @ M69_big_0c000::2033 =====

undefined2 __h3000 FUN_M69_big_0c000__2033(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__2082 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__2167();
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__203a @ M69_big_0c000::203a =====

undefined2 __h3000 FUN_M69_big_0c000__203a(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__2082 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__2167();
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__2041 @ M69_big_0c000::2041 =====

undefined2 __h3000 FUN_M69_big_0c000__2041(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__2082 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__2167();
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__2048 @ M69_big_0c000::2048 =====

undefined2 __h3000 FUN_M69_big_0c000__2048(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__2082 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__2167();
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__204f @ M69_big_0c000::204f =====

undefined2 __h3000 FUN_M69_big_0c000__204f(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d4 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__2082 + DAT_600d + (DAT_70f8 & 0xff) * 0xe))();
  FUN_M69_big_0c000__2167();
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__2082 @ M69_big_0c000::2082 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2082(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,0,0x140,0x143);
  DAT_6074 = *DAT_70d4;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__2167();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2090 @ M69_big_0c000::2090 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2090(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,1,0x141,0x144);
  DAT_6074 = *DAT_70d4;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__2167();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__209e @ M69_big_0c000::209e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__209e(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,2,0x142,0x145);
  DAT_6074 = *DAT_70d4;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__2167();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__20ac @ M69_big_0c000::20ac =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__20ac(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,3,FUN_M69_big_0c000__0240,0x243);
  DAT_6074 = *DAT_70d4;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__2167();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__20ba @ M69_big_0c000::20ba =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__20ba(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,4,0x241,0x244);
  DAT_6074 = *DAT_70d4;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__2167();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__20c8 @ M69_big_0c000::20c8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__20c8(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__3015(0,5,0x242,0x245);
  DAT_6074 = *DAT_70d4;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       pan  : L-           C           -R " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$2167 ->$2141
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__2167();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2141 @ M69_big_0c000::2141 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2141(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70d4 = DAT_6074;
  API_FC80();
  FUN_eb1d((char)((ushort)*DAT_70d4 >> 8),(char)*DAT_70d4,param_1,DAT_70f8 + 0x29);
  FUN_M69_big_0c000__21a2();
  return in_D;
}


// ===== FUN_M69_big_0c000__2167 @ M69_big_0c000::2167 =====

undefined2 __h3000 FUN_M69_big_0c000__2167(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "           C           " */
  LcdPrintInline();
  LcdSetCursor((char)((ushort)(*DAT_70d4 + 0x19) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M69_big_0c000__21a2 @ M69_big_0c000::21a2 =====

void __h3000 FUN_M69_big_0c000__21a2(void)

{
  FUN_M69_big_0c000__1faf();
  return;
}


// ===== FUN_M69_big_0c000__21a6 @ M69_big_0c000::21a6 =====

undefined2 __h3000 FUN_M69_big_0c000__21a6(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__21fc + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__22ba();
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__21ad @ M69_big_0c000::21ad =====

undefined2 __h3000 FUN_M69_big_0c000__21ad(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__21fc + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__22ba();
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__21b4 @ M69_big_0c000::21b4 =====

undefined2 __h3000 FUN_M69_big_0c000__21b4(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__21fc + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__22ba();
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__21bb @ M69_big_0c000::21bb =====

undefined2 __h3000 FUN_M69_big_0c000__21bb(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__21fc + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__22ba();
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__21c2 @ M69_big_0c000::21c2 =====

undefined2 __h3000 FUN_M69_big_0c000__21c2(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__21fc + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__22ba();
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__21c9 @ M69_big_0c000::21c9 =====

undefined2 __h3000 FUN_M69_big_0c000__21c9(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0);
  DAT_6074 = DAT_60f9;
  *DAT_70d6 = DAT_60f9;
  API_FC80();
  (*(FUN_M69_big_0c000__21fc + DAT_600d + (DAT_70f8 & 0xff) * 10))();
  FUN_M69_big_0c000__22ba();
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__21fc @ M69_big_0c000::21fc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__21fc(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,0,0x146);
  DAT_6074 = *DAT_70d6;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__22ba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2206 @ M69_big_0c000::2206 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2206(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,1,0x147);
  DAT_6074 = *DAT_70d6;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__22ba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2210 @ M69_big_0c000::2210 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2210(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,2,0x148);
  DAT_6074 = *DAT_70d6;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__22ba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__221a @ M69_big_0c000::221a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__221a(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,3,0x246);
  DAT_6074 = *DAT_70d6;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__22ba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2224 @ M69_big_0c000::2224 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2224(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,4,0x247);
  DAT_6074 = *DAT_70d6;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
  LcdPrintInline();
  SetupParamEditPage();
  FUN_M69_big_0c000__22ba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__222e @ M69_big_0c000::222e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__222e(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,5,0x248);
  DAT_6074 = *DAT_70d6;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       feedback  :     %   " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$22BA ->$2294
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__22ba();
  LcdSetCursor();
  API_FC2A((char)((ushort)DAT_70f8 >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2294 @ M69_big_0c000::2294 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2294(undefined2 param_1)

{
  undefined2 in_D;
  
  *DAT_70d6 = DAT_6074;
  API_FC80();
  FUN_eb1d((char)((ushort)*DAT_70d6 >> 8),(char)*DAT_70d6,param_1,DAT_70f8 + 0x23);
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__22ba @ M69_big_0c000::22ba =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__22ba(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__22cf @ M69_big_0c000::22cf =====

undefined2 __h3000 FUN_M69_big_0c000__22cf(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  uVar1 = *DAT_70d6;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 1;
  API_FCEC();
  DAT_70fa = *psVar2;
  uVar1 = *DAT_70d6;
  *(char *)((short)psVar2 + 1) = (char)uVar1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0xc1;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x55;
  API_FCF2();
  *psVar2 = *psVar2 + DAT_70fa;
  uVar1 = DAT_711a;
  *(char *)((short)psVar2 + -1) = (char)DAT_711a;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70fa = *psVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__232c @ M69_big_0c000::232c =====

void __h3000 FUN_M69_big_0c000__232c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$23E4 ->$23F9 $7000 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__23e4_M69_big_0c000__231e);
  return;
}


// ===== FUN_M69_big_0c000__2338 @ M69_big_0c000::2338 =====

void __h3000 FUN_M69_big_0c000__2338(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$23E4 ->$23F9 $7000 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__23e4_M69_big_0c000__231e);
  return;
}


// ===== FUN_M69_big_0c000__2344 @ M69_big_0c000::2344 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2344(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7000 = DAT_60f9 - DAT_7002;
  FUN_M69_big_0c000__23f9();
  API_FC82((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0x39);
  return in_D;
}


// ===== FUN_M69_big_0c000__236b @ M69_big_0c000::236b =====

undefined2 __h3000 FUN_M69_big_0c000__236b(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7004;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       mix:     % wet      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$23E4 ->$23B8
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__23e4();
  return in_D;
}


// ===== FUN_M69_big_0c000__23b8 @ M69_big_0c000::23b8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__23b8(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7000 = DAT_6074 - DAT_7002;
  API_FC82((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0x39);
  FUN_M69_big_0c000__23f9();
  FUN_M69_big_0c000__23e4();
  FUN_eb1d((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0);
  return in_D;
}


// ===== FUN_M69_big_0c000__23e4 @ M69_big_0c000::23e4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__23e4(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__23f9 @ M69_big_0c000::23f9 =====

undefined2 __h3000 FUN_M69_big_0c000__23f9(void)

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
  DAT_70fa = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70fa) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M69_big_0c000__244a @ M69_big_0c000::244a =====

void __h3000 FUN_M69_big_0c000__244a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2502 ->$2517 $7008 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__2502_M69_big_0c000__243c);
  return;
}


// ===== FUN_M69_big_0c000__2456 @ M69_big_0c000::2456 =====

void __h3000 FUN_M69_big_0c000__2456(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2502 ->$2517 $7008 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__2502_M69_big_0c000__243c);
  return;
}


// ===== FUN_M69_big_0c000__2462 @ M69_big_0c000::2462 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2462(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7008 = DAT_60f9 - DAT_700a;
  FUN_M69_big_0c000__2517();
  API_FC82((char)((ushort)DAT_7008 >> 8),(char)DAT_7008,param_1,0x39);
  return in_D;
}


// ===== FUN_M69_big_0c000__2489 @ M69_big_0c000::2489 =====

undefined2 __h3000 FUN_M69_big_0c000__2489(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_700c;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left mix:     % wet " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2502 ->$24D6
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__2502();
  return in_D;
}


// ===== FUN_M69_big_0c000__24d6 @ M69_big_0c000::24d6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__24d6(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7008 = DAT_6074 - DAT_700a;
  API_FC82((char)((ushort)DAT_7008 >> 8),(char)DAT_7008,param_1,0x39);
  FUN_eb1d((char)((ushort)DAT_7008 >> 8),(char)DAT_7008,param_1,0);
  FUN_M69_big_0c000__2517();
  FUN_M69_big_0c000__2502();
  return in_D;
}


// ===== FUN_M69_big_0c000__2502 @ M69_big_0c000::2502 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2502(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__2517 @ M69_big_0c000::2517 =====

undefined2 __h3000 FUN_M69_big_0c000__2517(void)

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
  *psVar2 = DAT_7008 + DAT_700a;
  API_FCD8();
  DAT_700c = *psVar2;
  sVar1 = 100 - DAT_700c;
  *psVar2 = sVar1;
  DAT_70fa = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70fa) >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__2564 @ M69_big_0c000::2564 =====

void __h3000 FUN_M69_big_0c000__2564(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$261C ->$2631 $7010 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__261c_M69_big_0c000__2556);
  return;
}


// ===== FUN_M69_big_0c000__2570 @ M69_big_0c000::2570 =====

void __h3000 FUN_M69_big_0c000__2570(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$261C ->$2631 $7010 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__261c_M69_big_0c000__2556);
  return;
}


// ===== FUN_M69_big_0c000__257c @ M69_big_0c000::257c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__257c(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7010 = DAT_60f9 - DAT_7012;
  FUN_M69_big_0c000__2631();
  API_FC82((char)((ushort)DAT_7010 >> 8),(char)DAT_7010,param_1,0x4f);
  return in_D;
}


// ===== FUN_M69_big_0c000__25a3 @ M69_big_0c000::25a3 =====

undefined2 __h3000 FUN_M69_big_0c000__25a3(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7014;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right mix:    % wet " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$261C ->$25F0
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__261c();
  return in_D;
}


// ===== FUN_M69_big_0c000__25f0 @ M69_big_0c000::25f0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__25f0(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7010 = DAT_6074 - DAT_7012;
  API_FC82((char)((ushort)DAT_7010 >> 8),(char)DAT_7010,param_1,0x4f);
  FUN_eb1d((char)((ushort)DAT_7010 >> 8),(char)DAT_7010,param_1,1);
  FUN_M69_big_0c000__2631();
  FUN_M69_big_0c000__261c();
  return in_D;
}


// ===== FUN_M69_big_0c000__261c @ M69_big_0c000::261c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__261c(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M69_big_0c000__2631 @ M69_big_0c000::2631 =====

undefined2 __h3000 FUN_M69_big_0c000__2631(void)

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
  *psVar2 = DAT_7010 + DAT_7012;
  API_FCD8();
  DAT_7014 = *psVar2;
  sVar1 = 100 - DAT_7014;
  *psVar2 = sVar1;
  DAT_70fa = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_70fa) >> 8));
  return in_D;
}


// ===== FUN_M69_big_0c000__267e @ M69_big_0c000::267e =====

void __h3000 FUN_M69_big_0c000__267e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$287D ->$2741 $70A4 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__287d_M69_big_0c000__2670);
  return;
}


// ===== FUN_M69_big_0c000__268a @ M69_big_0c000::268a =====

void __h3000 FUN_M69_big_0c000__268a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$287D ->$2741 $70A4 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__287d_M69_big_0c000__2670);
  return;
}


// ===== FUN_M69_big_0c000__2696 @ M69_big_0c000::2696 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2696(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70a4 = DAT_60f9 - DAT_70a6;
  FUN_M69_big_0c000__2741();
  API_FC82((char)((ushort)DAT_70a4 >> 8),(char)DAT_70a4,param_1,0x31);
  return in_D;
}


// ===== FUN_M69_big_0c000__26bd @ M69_big_0c000::26bd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__26bd(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,0,&UNK_M69_big_0c000__044c,&UNK_M69_big_0c000__0440);
  DAT_6074 = DAT_70a8;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       loop delay:      mS " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0578 $0000 $0000 ->$287D ->$2717
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__287d();
  return in_D;
}


// ===== FUN_M69_big_0c000__2717 @ M69_big_0c000::2717 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2717(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70a4 = DAT_6074 - DAT_70a6;
  API_FC82((char)((ushort)DAT_70a4 >> 8),(char)DAT_70a4,param_1,0x31);
  FUN_eb1d((char)((ushort)DAT_70a4 >> 8),(char)DAT_70a4,param_1,2);
  FUN_M69_big_0c000__2741();
  return in_D;
}


// ===== FUN_M69_big_0c000__2741 @ M69_big_0c000::2741 =====

undefined2 __h3000 FUN_M69_big_0c000__2741(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  DAT_7112 = 0x7fff;
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x78;
  *(undefined1 *)(in_U + -4) = 5;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70a4 + DAT_70a6;
  API_FCD8();
  DAT_7074 = *psVar1;
  DAT_70a8 = DAT_7074;
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__277e @ M69_big_0c000::277e =====

void __h3000 FUN_M69_big_0c000__277e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$287D ->$2841 $70AC */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__287d_M69_big_0c000__2770);
  return;
}


// ===== FUN_M69_big_0c000__278a @ M69_big_0c000::278a =====

void __h3000 FUN_M69_big_0c000__278a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$287D ->$2841 $70AC */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__287d_M69_big_0c000__2770);
  return;
}


// ===== FUN_M69_big_0c000__2796 @ M69_big_0c000::2796 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2796(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70ac = DAT_60f9 - DAT_70ae;
  FUN_M69_big_0c000__2841();
  API_FC82((char)((ushort)DAT_70ac >> 8),(char)DAT_70ac,param_1,0x31);
  return in_D;
}


// ===== FUN_M69_big_0c000__27bd @ M69_big_0c000::27bd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__27bd(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,0,&UNK_M69_big_0c000__044c,&UNK_M69_big_0c000__0440);
  DAT_6074 = DAT_70b0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left delay:      mS " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $02BC $0000 $0000 ->$287D ->$2817
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__287d();
  return in_D;
}


// ===== FUN_M69_big_0c000__2817 @ M69_big_0c000::2817 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2817(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70ac = DAT_6074 - DAT_70ae;
  API_FC82((char)((ushort)DAT_70ac >> 8),(char)DAT_70ac,param_1,0x31);
  FUN_eb1d((char)((ushort)DAT_70ac >> 8),(char)DAT_70ac,param_1,2);
  FUN_M69_big_0c000__2841();
  return in_D;
}


// ===== FUN_M69_big_0c000__2841 @ M69_big_0c000::2841 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2841(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  FUN_M69_big_0c000__2e79(0,0,&UNK_M69_big_0c000__044c,&UNK_M69_big_0c000__0440);
  DAT_7112 = 0x7fff;
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0xbc;
  *(undefined1 *)(in_U + -4) = 2;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70ac + DAT_70ae;
  API_FCD8();
  DAT_7074 = *psVar1;
  DAT_70b0 = DAT_7074;
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__287d @ M69_big_0c000::287d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__287d(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__28a0 @ M69_big_0c000::28a0 =====

void __h3000 FUN_M69_big_0c000__28a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$299F ->$2963 $70B4 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__299f_M69_big_0c000__2892);
  return;
}


// ===== FUN_M69_big_0c000__28ac @ M69_big_0c000::28ac =====

void __h3000 FUN_M69_big_0c000__28ac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$299F ->$2963 $70B4 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__299f_M69_big_0c000__2892);
  return;
}


// ===== FUN_M69_big_0c000__28b8 @ M69_big_0c000::28b8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__28b8(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70b4 = DAT_60f9 - DAT_70b6;
  FUN_M69_big_0c000__2963();
  API_FC82((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_1,0x53);
  return in_D;
}


// ===== FUN_M69_big_0c000__28df @ M69_big_0c000::28df =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__28df(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2e79(0,3,&UNK_M69_big_0c000__044f,&UNK_M69_big_0c000__0443);
  DAT_6074 = DAT_70b8;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right delay:      mS" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $02BC $0000 $0000 ->$299F ->$2939
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__299f();
  return in_D;
}


// ===== FUN_M69_big_0c000__2939 @ M69_big_0c000::2939 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2939(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70b4 = DAT_6074 - DAT_70b6;
  API_FC82((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_1,0x53);
  FUN_eb1d((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_1,8);
  FUN_M69_big_0c000__2963();
  return in_D;
}


// ===== FUN_M69_big_0c000__2963 @ M69_big_0c000::2963 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2963(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  FUN_M69_big_0c000__2e79(0,3,&UNK_M69_big_0c000__044f,&UNK_M69_big_0c000__0443);
  DAT_7112 = 0x7fff;
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0xbc;
  *(undefined1 *)(in_U + -4) = 2;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70b4 + DAT_70b6;
  API_FCD8();
  DAT_707a = *psVar1;
  DAT_70b8 = DAT_707a;
  FUN_M69_big_0c000__1acf();
  return in_D;
}


// ===== FUN_M69_big_0c000__299f @ M69_big_0c000::299f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__299f(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__29b4 @ M69_big_0c000::29b4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__29b4(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70bc = DAT_60f9 - DAT_70be;
  FUN_M69_big_0c000__2b0a();
  API_FC82((char)((ushort)DAT_70bc >> 8),(char)DAT_70bc,param_1,0x35);
  return in_D;
}


// ===== FUN_M69_big_0c000__29db @ M69_big_0c000::29db =====

undefined2 __h3000 FUN_M69_big_0c000__29db(void)

{
  undefined2 in_D;
  
  DAT_70f8 = 0;
  DAT_70f2 = 0x146;
  DAT_70d6 = &DAT_7098;
  DAT_6074 = DAT_70c0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       loop feedback:     %" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$2B49 ->$2ADF
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__2b49();
  return in_D;
}


// ===== FUN_M69_big_0c000__2a4c @ M69_big_0c000::2a4c =====

void __h3000 FUN_M69_big_0c000__2a4c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2B49 ->$2B0A $70BC */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__2b49_M69_big_0c000__2a3e);
  return;
}


// ===== FUN_M69_big_0c000__2a58 @ M69_big_0c000::2a58 =====

void __h3000 FUN_M69_big_0c000__2a58(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2B49 ->$2B0A $70BC */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__2b49_M69_big_0c000__2a3e);
  return;
}


// ===== FUN_M69_big_0c000__2a64 @ M69_big_0c000::2a64 =====

undefined2 __h3000 FUN_M69_big_0c000__2a64(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70bc = DAT_60f9 - DAT_70be;
  FUN_M69_big_0c000__2b0a();
  return in_D;
}


// ===== FUN_M69_big_0c000__2a7c @ M69_big_0c000::2a7c =====

undefined2 __h3000 FUN_M69_big_0c000__2a7c(void)

{
  undefined2 in_D;
  
  DAT_70f8 = 0;
  DAT_70f2 = 0x146;
  DAT_70d6 = &DAT_7098;
  DAT_6074 = DAT_70c0;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left feedback:     %" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$2B49 ->$2ADF
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__2b49();
  return in_D;
}


// ===== FUN_M69_big_0c000__2adf @ M69_big_0c000::2adf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2adf(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70bc = DAT_6074 - DAT_70be;
  API_FC82((char)((ushort)DAT_70bc >> 8),(char)DAT_70bc,param_1,0x35);
  FUN_eb1d((char)((ushort)DAT_70bc >> 8),(char)DAT_70bc,param_1,3);
  FUN_M69_big_0c000__2b0a();
  return in_D;
}


// ===== FUN_M69_big_0c000__2b0a @ M69_big_0c000::2b0a =====

undefined2 __h3000 FUN_M69_big_0c000__2b0a(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  DAT_70f8 = 0;
  DAT_70f2 = 0x146;
  DAT_70d6 = &DAT_7098;
  *(undefined1 *)(in_U + -1) = 0x9c;
  *(undefined1 *)(in_U + -2) = 0xff;
  *(undefined1 *)(in_U + -3) = 99;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70bc + DAT_70be;
  API_FCD8();
  DAT_7098 = *psVar1;
  DAT_70c0 = DAT_7098;
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__2b49 @ M69_big_0c000::2b49 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2b49(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__2b6c @ M69_big_0c000::2b6c =====

void __h3000 FUN_M69_big_0c000__2b6c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2C78 ->$2C39 $70C4 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M69_big_0c000__2c78_M69_big_0c000__2b5e);
  return;
}


// ===== FUN_M69_big_0c000__2b78 @ M69_big_0c000::2b78 =====

void __h3000 FUN_M69_big_0c000__2b78(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2C78 ->$2C39 $70C4 */
  FUN_e736(param_1,param_2,&PTR_FUN_M69_big_0c000__2c78_M69_big_0c000__2b5e);
  return;
}


// ===== FUN_M69_big_0c000__2b84 @ M69_big_0c000::2b84 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2b84(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_70c4 = DAT_60f9 - DAT_70c6;
  FUN_M69_big_0c000__2c39();
  API_FC82((char)((ushort)DAT_70c4 >> 8),(char)DAT_70c4,param_1,0x57);
  return in_D;
}


// ===== FUN_M69_big_0c000__2bab @ M69_big_0c000::2bab =====

undefined2 __h3000 FUN_M69_big_0c000__2bab(void)

{
  undefined2 in_D;
  
  DAT_70f8 = 3;
  DAT_70f2 = 0x246;
  DAT_70d6 = &DAT_709e;
  DAT_6074 = DAT_70c8;
  FUN_M69_big_0c000__076c();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right fdback:     % " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$2C78 ->$2C0E
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M69_big_0c000__2c78();
  return in_D;
}


// ===== FUN_M69_big_0c000__2c0e @ M69_big_0c000::2c0e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2c0e(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70c4 = DAT_6074 - DAT_70c6;
  API_FC82((char)((ushort)DAT_70c4 >> 8),(char)DAT_70c4,param_1,0x57);
  FUN_eb1d((char)((ushort)DAT_70c4 >> 8),(char)DAT_70c4,param_1,9);
  FUN_M69_big_0c000__2c39();
  return in_D;
}


// ===== FUN_M69_big_0c000__2c39 @ M69_big_0c000::2c39 =====

undefined2 __h3000 FUN_M69_big_0c000__2c39(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  DAT_70f8 = 3;
  DAT_70f2 = 0x246;
  DAT_70d6 = &DAT_709e;
  *(undefined1 *)(in_U + -1) = 0x9c;
  *(undefined1 *)(in_U + -2) = 0xff;
  *(undefined1 *)(in_U + -3) = 99;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70c4 + DAT_70c6;
  API_FCD8();
  DAT_709e = *psVar1;
  DAT_70c8 = DAT_709e;
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== FUN_M69_big_0c000__2c78 @ M69_big_0c000::2c78 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2c78(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M69_big_0c000__2c8d @ M69_big_0c000::2c8d =====

undefined2 __h3000 FUN_M69_big_0c000__2c8d(void)

{
  undefined2 in_D;
  
  DAT_711e = DAT_7074;
  if (DAT_7076 <= DAT_7074 || (short)DAT_7074 < (short)DAT_7076) {
    DAT_711e = DAT_7076;
  }
  if (DAT_7078 <= DAT_711e || (short)DAT_711e < (short)DAT_7078) {
    DAT_711e = DAT_7078;
  }
  if (DAT_707a <= DAT_711e || (short)DAT_711e < (short)DAT_707a) {
    DAT_711e = DAT_707a;
  }
  if (DAT_707c <= DAT_711e || (short)DAT_711e < (short)DAT_707c) {
    DAT_711e = DAT_707c;
  }
  if (DAT_707e <= DAT_711e || (short)DAT_711e < (short)DAT_707e) {
    DAT_711e = DAT_707e;
  }
  return in_D;
}


// ===== FUN_M69_big_0c000__2cd4 @ M69_big_0c000::2cd4 =====

void __h3000 FUN_M69_big_0c000__2cd4(void)

{
  FUN_M69_big_0c000__2f5a();
  FUN_M69_big_0c000__2fc8();
  FUN_M69_big_0c000__2c8d();
  FUN_M69_big_0c000__1327();
  return;
}


// ===== FUN_M69_big_0c000__2ce1 @ M69_big_0c000::2ce1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2ce1(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70fa = 0;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0446);
  DAT_70fa = 0xfffe;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0447);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0448);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0449);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__044a);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__044b);
  return in_D;
}


// ===== FUN_M69_big_0c000__2d5e @ M69_big_0c000::2d5e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2d5e(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70fa = 0;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0446);
  DAT_70fa = 0x7fff;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0447);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0448);
  DAT_70fa = 0x8000;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__0449);
  DAT_70fa = 0xfffe;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__044a);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8),(char)DAT_70fa,param_1,&UNK_M69_big_0c000__044b);
  return in_D;
}


// ===== FUN_M69_big_0c000__2de7 @ M69_big_0c000::2de7 =====

short __h3000 FUN_M69_big_0c000__2de7(void)

{
  undefined1 uVar1;
  undefined2 *puVar2;
  undefined2 *puVar3;
  undefined *puVar4;
  
  puVar2 = (undefined2 *)(&DAT_M69_big_0c000__313e + DAT_600d);
  DAT_70fa = *(undefined2 *)(&DAT_M69_big_0c000__313c + DAT_600d);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8));
  puVar3 = puVar2 + 1;
  DAT_70fa = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8));
  puVar2 = puVar3 + 1;
  DAT_70fa = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8));
  puVar3 = puVar2 + 1;
  DAT_70fa = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8));
  puVar2 = puVar3 + 1;
  DAT_70fa = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70fa >> 8));
  puVar3 = puVar2 + 1;
  DAT_70fa = *puVar2;
  API_FD20(0);
  puVar4 = &UNK_M69_big_0c000__044b;
  DAT_70f8 = API_FD2E((char)((ushort)DAT_70fa >> 8));
  uVar1 = (undefined1)((ushort)DAT_70f8 >> 8);
  DAT_70e8 = puVar3;
  DAT_70ea = puVar4;
  DAT_70f4 = puVar4;
  DAT_70f6 = puVar4 + 0x12;
  DAT_70ec = puVar4 + 0x12;
  DAT_70cc = (short)&DAT_7074 + CONCAT11(uVar1,(char)DAT_70f8 << 1);
  DAT_70d8 = DAT_70f8 + 0x57;
  DAT_70e4 = &UNK_M69_big_0c000__3122 + DAT_600d + CONCAT11(uVar1,(char)DAT_70f8 << 1);
  return DAT_70f8;
}


// ===== FUN_M69_big_0c000__2e79 @ M69_big_0c000::2e79 =====

short __h3000 FUN_M69_big_0c000__2e79(undefined2 param_1,short param_2)

{
  undefined1 uVar1;
  short in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_70f8 = in_D;
  DAT_70e8 = param_1;
  DAT_70ea = param_2;
  DAT_70f4 = param_2;
  DAT_70f6 = param_2 + 0x12;
  DAT_70ec = param_2 + 0x12;
  DAT_70cc = (short)&DAT_7074 + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70d8 = in_D + 0x57;
  DAT_70e4 = &UNK_M69_big_0c000__3122 + DAT_600d + CONCAT11(uVar1,(char)in_D << 1);
  return in_D;
}


// ===== FUN_M69_big_0c000__2ebb @ M69_big_0c000::2ebb =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2ebb(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_7058;
  *(char *)(in_U + -1) = (char)DAT_7058;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_M69_big_0c000__2e79(0,0,&UNK_M69_big_0c000__044c,&UNK_M69_big_0c000__0440);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,1,&UNK_M69_big_0c000__044d,&UNK_M69_big_0c000__0441);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,2,&UNK_M69_big_0c000__044e,&UNK_M69_big_0c000__0442);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,3,&UNK_M69_big_0c000__044f,&UNK_M69_big_0c000__0443);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,4,&UNK_M69_big_0c000__0450,&UNK_M69_big_0c000__0444);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,5,&UNK_M69_big_0c000__0451,&UNK_M69_big_0c000__0445);
  FUN_M69_big_0c000__1acf();
  DAT_7058 = *puVar2;
  return in_D;
}


// ===== FUN_M69_big_0c000__2ec4 @ M69_big_0c000::2ec4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2ec4(void)

{
  undefined2 in_D;
  short in_U;
  undefined2 *puVar1;
  
  *(char *)(in_U + -1) = (char)DAT_7058;
  puVar1 = (undefined2 *)(in_U + -2);
  *(char *)puVar1 = (char)((ushort)DAT_7058 >> 8);
  DAT_7058 = 0xffff;
  FUN_M69_big_0c000__2e79(0,0,&UNK_M69_big_0c000__044c,&UNK_M69_big_0c000__0440);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,1,&UNK_M69_big_0c000__044d,&UNK_M69_big_0c000__0441);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,2,&UNK_M69_big_0c000__044e,&UNK_M69_big_0c000__0442);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,3,&UNK_M69_big_0c000__044f,&UNK_M69_big_0c000__0443);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,4,&UNK_M69_big_0c000__0450,&UNK_M69_big_0c000__0444);
  FUN_M69_big_0c000__1acf();
  FUN_M69_big_0c000__2e79(0,5,&UNK_M69_big_0c000__0451,&UNK_M69_big_0c000__0445);
  FUN_M69_big_0c000__1acf();
  DAT_7058 = *puVar1;
  return in_D;
}


// ===== FUN_M69_big_0c000__2f39 @ M69_big_0c000::2f39 =====

short __h3000 FUN_M69_big_0c000__2f39(undefined2 param_1)

{
  short in_D;
  
  DAT_70f8 = in_D;
  DAT_70ea = param_1;
  DAT_70ce = (short)&DAT_7068 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70da = in_D + 99;
  return in_D;
}


// ===== FUN_M69_big_0c000__2f5a @ M69_big_0c000::2f5a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2f5a(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2f39(0,0,&UNK_M69_big_0c000__0440);
  FUN_M69_big_0c000__1cdd();
  FUN_M69_big_0c000__2f39(0,1,&UNK_M69_big_0c000__0441);
  FUN_M69_big_0c000__1cdd();
  FUN_M69_big_0c000__2f39(0,2,&UNK_M69_big_0c000__0442);
  FUN_M69_big_0c000__1cdd();
  FUN_M69_big_0c000__2f39(0,3,&UNK_M69_big_0c000__0443);
  FUN_M69_big_0c000__1cdd();
  FUN_M69_big_0c000__2f39(0,4,&UNK_M69_big_0c000__0444);
  FUN_M69_big_0c000__1cdd();
  FUN_M69_big_0c000__2f39(0,5,&UNK_M69_big_0c000__0445);
  FUN_M69_big_0c000__1cdd();
  return in_D;
}


// ===== FUN_M69_big_0c000__2fa7 @ M69_big_0c000::2fa7 =====

short __h3000 FUN_M69_big_0c000__2fa7(undefined2 param_1)

{
  short in_D;
  
  DAT_70f8 = in_D;
  DAT_70ec = param_1;
  DAT_70d0 = (short)&DAT_705c + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70dc = in_D + 0x5d;
  return in_D;
}


// ===== FUN_M69_big_0c000__2fc8 @ M69_big_0c000::2fc8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__2fc8(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__2fa7(0,0,&UNK_M69_big_0c000__0452);
  FUN_M69_big_0c000__1e3a();
  FUN_M69_big_0c000__2fa7(0,1,&UNK_M69_big_0c000__0453);
  FUN_M69_big_0c000__1e3a();
  FUN_M69_big_0c000__2fa7(0,2,&UNK_M69_big_0c000__0454);
  FUN_M69_big_0c000__1e3a();
  FUN_M69_big_0c000__2fa7(0,3,&UNK_M69_big_0c000__0455);
  FUN_M69_big_0c000__1e3a();
  FUN_M69_big_0c000__2fa7(0,4,&UNK_M69_big_0c000__0456);
  FUN_M69_big_0c000__1e3a();
  FUN_M69_big_0c000__2fa7(0,5,&UNK_M69_big_0c000__0457);
  FUN_M69_big_0c000__1e3a();
  return in_D;
}


// ===== FUN_M69_big_0c000__3015 @ M69_big_0c000::3015 =====

short __h3000 FUN_M69_big_0c000__3015(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  short in_D;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DAT_70f8 = in_D;
  DAT_70ee = param_1;
  DAT_70f0 = param_2;
  DAT_70d2 = (short)&DAT_708c + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70d4 = (short)&DAT_7080 + CONCAT11(uVar1,(char)in_D << 1);
  DAT_70de = in_D + 0x6f;
  DAT_70e0 = in_D + 0x69;
  return in_D;
}


// ===== FUN_M69_big_0c000__3050 @ M69_big_0c000::3050 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

short __h3000 FUN_M69_big_0c000__3050(undefined2 param_1)

{
  short in_D;
  
  FUN_M69_big_0c000__3015(0,0,0x140,0x143);
  FUN_M69_big_0c000__1faf();
  FUN_M69_big_0c000__3015(0,1,0x141,0x144);
  FUN_M69_big_0c000__1faf();
  FUN_M69_big_0c000__3015(0,2,0x142,0x145);
  FUN_M69_big_0c000__1faf();
  FUN_M69_big_0c000__3015(0,3,FUN_M69_big_0c000__0240,0x243);
  FUN_M69_big_0c000__1faf();
  FUN_M69_big_0c000__3015(0,4,0x241,0x244);
  FUN_M69_big_0c000__1faf();
  FUN_M69_big_0c000__3015(0,5,0x242,0x245);
  FUN_M69_big_0c000__1faf();
  DAT_70f8 = in_D;
  DAT_70f2 = param_1;
  DAT_70d6 = (short)&DAT_7098 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70e2 = in_D + 0x75;
  return in_D;
}


// ===== FUN_M69_big_0c000__30b4 @ M69_big_0c000::30b4 =====

short __h3000 FUN_M69_big_0c000__30b4(undefined2 param_1)

{
  short in_D;
  
  DAT_70f8 = in_D;
  DAT_70f2 = param_1;
  DAT_70d6 = (short)&DAT_7098 + CONCAT11((char)((ushort)in_D >> 8),(char)in_D << 1);
  DAT_70e2 = in_D + 0x75;
  return in_D;
}


// ===== FUN_M69_big_0c000__30d5 @ M69_big_0c000::30d5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M69_big_0c000__30d5(void)

{
  undefined2 in_D;
  
  FUN_M69_big_0c000__30b4(0,0,0x146);
  FUN_M69_big_0c000__22cf();
  FUN_M69_big_0c000__30b4(0,1,0x147);
  FUN_M69_big_0c000__22cf();
  FUN_M69_big_0c000__30b4(0,2,0x148);
  FUN_M69_big_0c000__22cf();
  FUN_M69_big_0c000__30b4(0,3,0x246);
  FUN_M69_big_0c000__22cf();
  FUN_M69_big_0c000__30b4(0,4,0x247);
  FUN_M69_big_0c000__22cf();
  FUN_M69_big_0c000__30b4(0,5,0x248);
  FUN_M69_big_0c000__22cf();
  return in_D;
}


// ===== MODULE_6D_01_entry @ M69_big_0c000::3193 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x31ae */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_6D_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $3197 */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  API_FC58();
  DAT_7122 = 0xffff;
  DspLoadProgram(0xff,uVar3,FUN_M69_big_0c000__1410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x1411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x1412);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        MODULE_69_02_entry();
        FUN_M69_big_0c000__0103();
        FUN_M69_big_0c000__18ba();
        FUN_M69_big_0c000__23f9();
        FUN_M69_big_0c000__1327();
        FUN_M69_big_0c000__1794();
        FUN_M69_big_0c000__2b0a();
        FUN_M69_big_0c000__2741();
        FUN_M69_big_0c000__30d5();
        FUN_M69_big_0c000__2ec4();
        FUN_M69_big_0c000__2ce1();
        FUN_M69_big_0c000__2cd4();
        API_FC6C(0);
        API_FC74();
        API_FDF6();
        FUN_M69_big_0c000__09a4();
        FUN_e585();
        FUN_M69_big_0c000__029b();
        API_FD20(0x4e);
        return uVar2;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_6E_01_entry @ M69_big_0c000::327a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3295 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_6E_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $327E */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  API_FC58();
  DAT_7122 = 0xffff;
  DspLoadProgram(0xff,uVar3,FUN_M69_big_0c000__1410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x1411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x1412);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        MODULE_69_02_entry();
        FUN_M69_big_0c000__013b();
        FUN_M69_big_0c000__18ba();
        FUN_M69_big_0c000__2517();
        FUN_M69_big_0c000__2631();
        FUN_M69_big_0c000__1327();
        FUN_M69_big_0c000__1794();
        FUN_M69_big_0c000__2841();
        FUN_M69_big_0c000__2963();
        FUN_M69_big_0c000__2b0a();
        FUN_M69_big_0c000__2c39();
        FUN_M69_big_0c000__30d5();
        FUN_M69_big_0c000__2d5e();
        FUN_M69_big_0c000__2ec4();
        FUN_M69_big_0c000__2cd4();
        API_FC6C(0);
        API_FC74();
        API_FDF6();
        FUN_M69_big_0c000__0a36();
        FUN_e585();
        FUN_M69_big_0c000__0182();
        API_FD20(0x4e);
        return uVar2;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_69_01_entry @ M69_big_0c000::3396 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x33b1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_69_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $339A */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  API_FC58();
  DAT_7122 = 0xffff;
  DspLoadProgram(0xff,uVar3,FUN_M69_big_0c000__1410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x1411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x1412);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        MODULE_69_02_entry();
        FUN_M69_big_0c000__18ba();
        FUN_M69_big_0c000__23f9();
        FUN_M69_big_0c000__1518();
        FUN_M69_big_0c000__1692();
        FUN_M69_big_0c000__0ffa();
        FUN_M69_big_0c000__1109();
        FUN_M69_big_0c000__1218();
        FUN_M69_big_0c000__1327();
        FUN_M69_big_0c000__1794();
        FUN_M69_big_0c000__2fc8();
        FUN_M69_big_0c000__2f5a();
        FUN_M69_big_0c000__30d5();
        FUN_M69_big_0c000__2de7();
        FUN_M69_big_0c000__2ec4();
        FUN_M69_big_0c000__3050();
        FUN_M69_big_0c000__2cd4();
        API_FC6C(0);
        API_FC74();
        API_FDF6();
        FUN_M69_big_0c000__087f();
        FUN_e585();
        FUN_M69_big_0c000__034d();
        API_FD20(0x4e);
        return uVar2;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_6A_01_entry @ M69_big_0c000::349a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x34b5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_6A_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $349E */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  API_FC58();
  DAT_7122 = 0;
  DspLoadProgram(0,uVar3,0x1e10);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x1e11);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x1e12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        MODULE_69_02_entry();
        FUN_M69_big_0c000__18ba();
        FUN_M69_big_0c000__23f9();
        FUN_M69_big_0c000__0ea3();
        FUN_M69_big_0c000__1327();
        FUN_M69_big_0c000__0ffa();
        FUN_M69_big_0c000__1109();
        FUN_M69_big_0c000__1218();
        FUN_M69_big_0c000__2fc8();
        FUN_M69_big_0c000__2f5a();
        FUN_M69_big_0c000__2de7();
        FUN_M69_big_0c000__2ec4();
        FUN_M69_big_0c000__2cd4();
        API_FC6C(0);
        API_FC74();
        API_FDF6();
        FUN_M69_big_0c000__07a7();
        FUN_e585();
        FUN_M69_big_0c000__0643();
        API_FD20(0x4e);
        return uVar2;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


