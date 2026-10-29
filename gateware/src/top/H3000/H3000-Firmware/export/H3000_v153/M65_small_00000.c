// H3000_v153 - decompiled by Ghidra (6809, __h3000 convention)
// block M65_small_00000 M65_small_00000::0000-M65_small_00000::3fff, 222 functions
// Bank small_00000 (module id 65)

// ===== MODULE_65_02_entry @ M65_small_00000::0010 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 MODULE_65_02_entry(void)

{
  short sVar1;
  undefined2 in_D;
  
  sVar1 = DAT_600d + 0x5e;
  API_FD08((char)((ushort)sVar1 >> 8),(char)sVar1,DAT_600d + 0x2f,&LAB_6600,sVar1);
  return in_D;
}


// ===== FUN_M65_small_00000__002f @ M65_small_00000::002f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x004f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M65_small_00000__002f(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_70f2 == 0) {
                    /* inline[API_FC62]: $6013 */
    ModuleStorePtr(0);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x004f. Too many branches */
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


// ===== FUN_M65_small_00000__005e @ M65_small_00000::005e =====

undefined2 __h3000 FUN_M65_small_00000__005e(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7108 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_710a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_710c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_710e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7110 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7124 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7116 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7118 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_711e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7120 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7122 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70ac >> 8));
  if (DAT_713a == 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711a >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_711c >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7106 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70ae >> 8));
  }
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0xb);
  DAT_70f2 = 0xffff;
  API_FD76();
  return in_D;
}


// ===== FUN_M65_small_00000__01a5 @ M65_small_00000::01a5 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__01a5(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  _DAT_712c = FUN_M65_small_00000__079c;
  _DAT_712e = 0x78d0;
  DAT_7048 = 0;
  DAT_7050 = 0;
  DAT_7058 = 0;
  DAT_7060 = 0;
  DAT_7068 = 0;
  DAT_7070 = 0;
  DAT_7078 = 0;
  DAT_7080 = 0;
  DAT_7088 = 0;
  DAT_7090 = 0;
  DAT_7098 = 0;
  DAT_70a0 = 0;
  DAT_7008 = 0;
  DAT_70ac = 100;
  DAT_70dc = 0xffff;
  DAT_70b2 = 0xffff;
                    /* inline[API_FE08]: 45:46 47:4C 31:4E 33:54 49:56 4B:5C 35:5E 37:64 49:96 35:9E
                       4B:9C 59:06 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 51:6E 53:74 3D:76 3F:7C 4D:86 4F:8C 39:8E 3B:94 3D:66 3F:6C
                       39:7E 3B:84 37:A4 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 5B:16 5D:18 5F:1A 61:1C 63:1E 65:20 67:22 69:24 6B:26 6D:28
                       6F:2A 71:2C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 73:2E 75:30 77:32 79:34 7B:36 7D:38 7F:3A 81:3C 83:3E 85:40
                       87:42 89:44 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 41:A6 42:A8 43:B0 44:AA 31:00 32:02 33:04 8B:B4 */
  LoadParamsSigned();
  FUN_M65_small_00000__29f4();
  FUN_M65_small_00000__2abc();
  FUN_M65_small_00000__2cd5();
  FUN_M65_small_00000__2452();
  FUN_M65_small_00000__256c();
  FUN_M65_small_00000__27a1();
  FUN_M65_small_00000__28b8();
  DAT_70f2 = 0;
  API_FD76();
  FUN_e568();
  API_FD7C();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_713a >> 8),(char)DAT_713a,param_3,"ix");
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7136 >> 8),(char)DAT_7136,param_3,"x");
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7132 >> 8),(char)DAT_7132,param_3,&BYTE_M65_small_00000__0345);
  return;
}


// ===== FUN_M65_small_00000__02d8 @ M65_small_00000::02d8 =====

void __h3000 FUN_M65_small_00000__02d8(void)

{
                    /* inline[API_FD84]: 00 80 "l pitch " 21 $0E06 $0E12 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r pitch " 25 $0FEB $0FF7 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l delay " 29 $1175 $1181 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r delay " 2D $12D8 $12E4 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "left mix" 55 $2385 $2391 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "rightmix" 59 $249F $24AB */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "l fdback" 5D $26D4 $26E0 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "r fdback" 61 $27EB $27F7 */
  DefineParameter();
  DAT_60f5 = PTR_ARRAY_M65_small_00000__0385;
  DAT_60f7 = 0xc;
  DAT_714a = FUN_M65_small_00000__080e;
  return;
}


// ===== FUN_M65_small_00000__03a8 @ M65_small_00000::03a8 =====

void __h3000 FUN_M65_small_00000__03a8(void)

{
  FUN_M65_small_00000__24b7();
  FUN_M65_small_00000__080e();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__03b3 @ M65_small_00000::03b3 =====

void __h3000 FUN_M65_small_00000__03b3(void)

{
  FUN_M65_small_00000__26ec();
  FUN_M65_small_00000__079c();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__03be @ M65_small_00000::03be =====

void __h3000 FUN_M65_small_00000__03be(void)

{
  FUN_M65_small_00000__2803();
  FUN_M65_small_00000__07d5();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__03c9 @ M65_small_00000::03c9 =====

void __h3000 FUN_M65_small_00000__03c9(void)

{
  FUN_M65_small_00000__0e1e();
  FUN_M65_small_00000__079c();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__03d4 @ M65_small_00000::03d4 =====

void __h3000 FUN_M65_small_00000__03d4(void)

{
  FUN_M65_small_00000__118d();
  FUN_M65_small_00000__079c();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__03df @ M65_small_00000::03df =====

void __h3000 FUN_M65_small_00000__03df(void)

{
  FUN_M65_small_00000__1003();
  FUN_M65_small_00000__07d5();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__03ea @ M65_small_00000::03ea =====

void __h3000 FUN_M65_small_00000__03ea(void)

{
  FUN_M65_small_00000__12f0();
  FUN_M65_small_00000__07d5();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__03f5 @ M65_small_00000::03f5 =====

void __h3000 FUN_M65_small_00000__03f5(void)

{
  FUN_M65_small_00000__29f8();
  FUN_M65_small_00000__0849();
  FUN_e585();
  return;
}


// ===== FUN_M65_small_00000__0400 @ M65_small_00000::0400 =====

void __h3000 FUN_M65_small_00000__0400(void)

{
  FUN_M65_small_00000__28f4();
  FUN_M65_small_00000__0849();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__040b @ M65_small_00000::040b =====

void __h3000 FUN_M65_small_00000__040b(void)

{
  FUN_M65_small_00000__2bf1();
  FUN_M65_small_00000__0849();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__0416 @ M65_small_00000::0416 =====

void __h3000 FUN_M65_small_00000__0416(void)

{
  FUN_M65_small_00000__0b63();
  FUN_M65_small_00000__0b8c();
  FUN_M65_small_00000__080e();
  API_FDEC();
  return;
}


// ===== FUN_M65_small_00000__0424 @ M65_small_00000::0424 =====

void __h3000 FUN_M65_small_00000__0424(void)

{
                    /* inline[API_FD84]: 00 80 " pitch  " 21 $0FEB $0FF7 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 " delay  " 25 $12D8 $12E4 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "  mix   " 29 $2267 $2273 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "feedback" 2D $25B9 $25C5 */
  DefineParameter();
  DAT_60f5 = &UNK_M65_small_00000__0485;
  DAT_60f7 = 0xc;
  DAT_714a = FUN_M65_small_00000__08c4;
  return;
}


// ===== FUN_M65_small_00000__04f9 @ M65_small_00000::04f9 =====

void __h3000 FUN_M65_small_00000__04f9(void)

{
                    /* inline[API_FD84]: 00 80 "l pitch " 21 $0E06 $0E12 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r pitch " 25 $0FEB $0FF7 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l length" 29 $149D $14A9 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r length" 2D $15E5 $15F1 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "left mix" 55 $2385 $2391 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "rightmix" 59 $249F $24AB */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "l fdback" 5D $26D4 $26E0 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "r fdback" 61 $27EB $27F7 */
  DefineParameter();
  DAT_60f5 = PTR_ARRAY_M65_small_00000__05a0;
  DAT_60f7 = 8;
  return;
}


// ===== FUN_M65_small_00000__05b0 @ M65_small_00000::05b0 =====

void __h3000 FUN_M65_small_00000__05b0(void)

{
  FUN_M65_small_00000__239d();
  FUN_M65_small_00000__09dd();
  FUN_e585();
  return;
}


// ===== FUN_M65_small_00000__05bb @ M65_small_00000::05bb =====

void __h3000 FUN_M65_small_00000__05bb(void)

{
  FUN_M65_small_00000__24b7();
  FUN_M65_small_00000__09dd();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__05c6 @ M65_small_00000::05c6 =====

void __h3000 FUN_M65_small_00000__05c6(void)

{
  FUN_M65_small_00000__26ec();
  FUN_M65_small_00000__096b();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__05d1 @ M65_small_00000::05d1 =====

void __h3000 FUN_M65_small_00000__05d1(void)

{
  FUN_M65_small_00000__2803();
  FUN_M65_small_00000__09a4();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__05dc @ M65_small_00000::05dc =====

void __h3000 FUN_M65_small_00000__05dc(void)

{
  FUN_M65_small_00000__0e1e();
  FUN_M65_small_00000__096b();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__05e7 @ M65_small_00000::05e7 =====

void __h3000 FUN_M65_small_00000__05e7(void)

{
  FUN_M65_small_00000__14b5();
  FUN_M65_small_00000__096b();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__05f2 @ M65_small_00000::05f2 =====

void __h3000 FUN_M65_small_00000__05f2(void)

{
  FUN_M65_small_00000__1003();
  FUN_M65_small_00000__09a4();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__05fd @ M65_small_00000::05fd =====

void __h3000 FUN_M65_small_00000__05fd(void)

{
  FUN_M65_small_00000__15fd();
  FUN_M65_small_00000__09a4();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__0608 @ M65_small_00000::0608 =====

void __h3000 FUN_M65_small_00000__0608(void)

{
                    /* inline[API_FD84]: 00 80 " delay  " 21 $12D8 $12E4 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "left mix" 25 $2385 $2391 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "rightmix" 29 $249F $24AB */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "l fdback" 2D $26D4 $26E0 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "r fdback" 55 $27EB $27F7 */
  DefineParameter();
  DAT_60f5 = PTR_ARRAY_M65_small_00000__067c;
  DAT_60f7 = 0x24;
  DAT_714a = FUN_M65_small_00000__0a76;
  return;
}


// ===== FUN_M65_small_00000__06cf @ M65_small_00000::06cf =====

void __h3000 FUN_M65_small_00000__06cf(void)

{
  FUN_M65_small_00000__24b7();
  FUN_M65_small_00000__0a3d();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__06da @ M65_small_00000::06da =====

void __h3000 FUN_M65_small_00000__06da(void)

{
  FUN_M65_small_00000__26ec();
  FUN_M65_small_00000__0a3d();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__06e5 @ M65_small_00000::06e5 =====

void __h3000 FUN_M65_small_00000__06e5(void)

{
  FUN_M65_small_00000__2803();
  FUN_M65_small_00000__0a3d();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__06f0 @ M65_small_00000::06f0 =====

void __h3000 FUN_M65_small_00000__06f0(void)

{
  FUN_M65_small_00000__171f();
  FUN_M65_small_00000__0a08();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__06fb @ M65_small_00000::06fb =====

void __h3000 FUN_M65_small_00000__06fb(void)

{
  FUN_M65_small_00000__1970();
  FUN_M65_small_00000__0a08();
  FUN_e585();
  return;
}


// ===== FUN_M65_small_00000__0706 @ M65_small_00000::0706 =====

void __h3000 FUN_M65_small_00000__0706(void)

{
  FUN_M65_small_00000__1a5b();
  FUN_M65_small_00000__0a08();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__0711 @ M65_small_00000::0711 =====

void __h3000 FUN_M65_small_00000__0711(void)

{
  FUN_M65_small_00000__12f0();
  FUN_M65_small_00000__0a76();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__071c @ M65_small_00000::071c =====

void __h3000 FUN_M65_small_00000__071c(void)

{
  FUN_M65_small_00000__29f8();
  FUN_M65_small_00000__0ab5();
  FUN_e595();
  return;
}


// ===== FUN_M65_small_00000__0727 @ M65_small_00000::0727 =====

void __h3000 FUN_M65_small_00000__0727(void)

{
  FUN_M65_small_00000__28f4();
  FUN_M65_small_00000__0ab5();
  FUN_e59d();
  return;
}


// ===== FUN_M65_small_00000__0732 @ M65_small_00000::0732 =====

void __h3000 FUN_M65_small_00000__0732(void)

{
  FUN_M65_small_00000__2bf1();
  FUN_M65_small_00000__0aee();
  FUN_e585();
  return;
}


// ===== FUN_M65_small_00000__073d @ M65_small_00000::073d =====

void __h3000 FUN_M65_small_00000__073d(void)

{
  FUN_M65_small_00000__188e();
  FUN_M65_small_00000__0b22();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__0748 @ M65_small_00000::0748 =====

void __h3000 FUN_M65_small_00000__0748(void)

{
  FUN_M65_small_00000__188e();
  FUN_M65_small_00000__0b2a();
  FUN_e58d();
  return;
}


// ===== FUN_M65_small_00000__0753 @ M65_small_00000::0753 =====

void __h3000 FUN_M65_small_00000__0753(void)

{
  FUN_M65_small_00000__0c8c();
  FUN_M65_small_00000__0cc4();
  FUN_M65_small_00000__0a08();
  API_FDEC();
  return;
}


// ===== FUN_M65_small_00000__0761 @ M65_small_00000::0761 =====

void __h3000 FUN_M65_small_00000__0761(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M65_small_00000__0766 @ M65_small_00000::0766 =====

undefined2 __h3000 FUN_M65_small_00000__0766(undefined1 param_1)

{
  undefined2 in_stack_00000001;
  
  LcdSetCursor(param_1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return in_stack_00000001;
}


// ===== FUN_M65_small_00000__079c @ M65_small_00000::079c =====

void __h3000 FUN_M65_small_00000__079c(void)

{
                    /* inline[API_FE02]: "l coarse" "l fine  " "l delay " "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D9D ->$0E45 ->$11B4 ->$2713 ->$07D5 ->$080E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__07d5 @ M65_small_00000::07d5 =====

void __h3000 FUN_M65_small_00000__07d5(void)

{
                    /* inline[API_FE02]: "r coarse" "r fine  " "r delay " "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F45 ->$102A ->$1317 ->$282A ->$080E ->$079C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__080e @ M65_small_00000::080e =====

void __h3000 FUN_M65_small_00000__080e(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" [-] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M65_small_00000__0bc6();
                    /* inline[API_FE00]: ->$23C4 ->$24DE ->$0B78 ->$0849 ->$079C ->$07D5 */
  SetModuleHandlers();
  DAT_714a = FUN_M65_small_00000__080e;
  return;
}


// ===== FUN_M65_small_00000__0849 @ M65_small_00000::0849 =====

void __h3000 FUN_M65_small_00000__0849(void)

{
                    /* inline[API_FE02]: "low note" "highnote" " source " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2A1C ->$2918 ->$2C15 ->$0B62 ->$0B62 ->$0B62 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_714a >> 8));
  return;
}


// ===== FUN_M65_small_00000__088b @ M65_small_00000::088b =====

void __h3000 FUN_M65_small_00000__088b(void)

{
                    /* inline[API_FE02]: " coarse " "  fine  " " delay  " "feedback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F45 ->$102A ->$1317 ->$25F8 ->$08C4 ->$08C4 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__08c4 @ M65_small_00000::08c4 =====

void __h3000 FUN_M65_small_00000__08c4(void)

{
                    /* inline[API_FE02]: "  mix   " [*] [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$22A6 ->$0B62 ->$0B62 ->$08F5 ->$088B ->$088B */
  SetModuleHandlers();
  DAT_714a = FUN_M65_small_00000__08c4;
  return;
}


// ===== FUN_M65_small_00000__08f5 @ M65_small_00000::08f5 =====

void __h3000 FUN_M65_small_00000__08f5(void)

{
                    /* inline[API_FE02]: "low note" "highnote" " source " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2A1C ->$2918 ->$2C15 ->$0B62 ->$0937 ->$0937 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_714a >> 8));
  return;
}


// ===== FUN_M65_small_00000__0937 @ M65_small_00000::0937 =====

void __h3000 FUN_M65_small_00000__0937(void)

{
                    /* inline[API_FE02]: "deg mode" [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2B07 ->$0B62 ->$0B62 ->$0B62 ->$08F5 ->$08F5 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_714a >> 8));
  return;
}


// ===== FUN_M65_small_00000__096b @ M65_small_00000::096b =====

void __h3000 FUN_M65_small_00000__096b(void)

{
                    /* inline[API_FE02]: "l coarse" "l fine  " "l length" "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D9D ->$0E45 ->$14DC ->$2713 ->$09A4 ->$09DD */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__09a4 @ M65_small_00000::09a4 =====

void __h3000 FUN_M65_small_00000__09a4(void)

{
                    /* inline[API_FE02]: "r coarse" "r fine  " "r length" "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F45 ->$102A ->$1624 ->$282A ->$09DD ->$096B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__09dd @ M65_small_00000::09dd =====

void __h3000 FUN_M65_small_00000__09dd(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$23C4 ->$24DE ->$0B62 ->$0B62 ->$096B ->$09A4 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__0a08 @ M65_small_00000::0a08 =====

void __h3000 FUN_M65_small_00000__0a08(void)

{
                    /* inline[API_FE02]: "l voice " "r voice " [-] "  key   " */
  SoftKeyLabels4Inline();
  API_FDF2();
  FUN_M65_small_00000__0d64();
                    /* inline[API_FE00]: ->$1994 ->$1A7F ->$0CB0 ->$1743 ->$0A3D ->$0A76 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__0a3d @ M65_small_00000::0a3d =====

void __h3000 FUN_M65_small_00000__0a3d(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" "l fdback" "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$23C4 ->$24DE ->$2713 ->$282A ->$0A76 ->$0A08 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__0a76 @ M65_small_00000::0a76 =====

void __h3000 FUN_M65_small_00000__0a76(void)

{
                    /* inline[API_FE02]: "  tune  " "shownote" "  delay " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1C41 ->$1D8A ->$1317 ->$0AB5 ->$0A08 ->$0A3D */
  SetModuleHandlers();
  DAT_714a = FUN_M65_small_00000__0a76;
  return;
}


// ===== FUN_M65_small_00000__0ab5 @ M65_small_00000::0ab5 =====

void __h3000 FUN_M65_small_00000__0ab5(void)

{
                    /* inline[API_FE02]: " scale1 " "scale2  " "lownote " "highnote" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0B22 ->$0B2A ->$2A1C ->$2918 ->$0AEE ->$0AEE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__0aee @ M65_small_00000::0aee =====

void __h3000 FUN_M65_small_00000__0aee(void)

{
                    /* inline[API_FE02]: " source " [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2C15 ->$0B62 ->$0B62 ->$0B62 ->$0AB5 ->$0AB5 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_714a >> 8));
  return;
}


// ===== FUN_M65_small_00000__0b22 @ M65_small_00000::0b22 =====

void __h3000 FUN_M65_small_00000__0b22(void)

{
  DAT_7014 = &DAT_7016;
  SoftKeyLabels4Inline();
  API_FDF2();
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__0b2a @ M65_small_00000::0b2a =====

void __h3000 FUN_M65_small_00000__0b2a(void)

{
  DAT_7014 = &DAT_702e;
                    /* inline[API_FE02]: "  note  " "interval" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$17F1 ->$18C5 ->$0B62 ->$0AB5 ->$0B62 ->$0B62 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M65_small_00000__0b62 @ M65_small_00000::0b62 =====

void __h3000 FUN_M65_small_00000__0b62(void)

{
  return;
}


// ===== FUN_M65_small_00000__0b63 @ M65_small_00000::0b63 =====

undefined2 __h3000 FUN_M65_small_00000__0b63(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70b2 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__0c56();
  return in_D;
}


// ===== FUN_M65_small_00000__0b78 @ M65_small_00000::0b78 =====

undefined2 __h3000 FUN_M65_small_00000__0b78(void)

{
  undefined2 in_D;
  
  DAT_70b2 = DAT_70b2 ^ 0xffff;
  FUN_M65_small_00000__0b8c();
  FUN_M65_small_00000__0ba9();
  FUN_M65_small_00000__0c56();
  FUN_M65_small_00000__0bfe();
  ModuleStorePtr(0xb);
  ModuleStorePtr(0xb);
  return in_D;
}


// ===== FUN_M65_small_00000__0b8c @ M65_small_00000::0b8c =====

undefined2 __h3000 FUN_M65_small_00000__0b8c(void)

{
  undefined2 in_D;
  
  FUN_M65_small_00000__0c56();
  FUN_M65_small_00000__0bfe();
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xb);
  return in_D;
}


// ===== FUN_M65_small_00000__0ba9 @ M65_small_00000::0ba9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__0ba9(undefined2 param_1)

{
  undefined2 in_D;
  
  FUN_eb1d((char)((ushort)DAT_70b2 >> 8),(char)DAT_70b2,param_1,0xb);
  FUN_M65_small_00000__0c56();
  FUN_M65_small_00000__0bfe();
  FUN_M65_small_00000__0bc6();
  API_FDEC();
  return in_D;
}


// ===== FUN_M65_small_00000__0bc6 @ M65_small_00000::0bc6 =====

undefined2 __h3000 FUN_M65_small_00000__0bc6(void)

{
  undefined2 in_D;
  
  if (DAT_70b2 == 0) {
                    /* inline[API_FE02]: [-] [-] "sust=on " [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  else {
                    /* inline[API_FE02]: [-] [-] "sust=off" [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__0bfe @ M65_small_00000::0bfe =====

undefined2 __h3000 FUN_M65_small_00000__0bfe(void)

{
  undefined2 in_D;
  
  if (DAT_70b2 == 0) {
    FUN_M65_small_00000__0761();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                        --sustain looping--" */
    LcdPrintInline();
  }
  else {
    FUN_M65_small_00000__0761();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                        --normal operation-" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__0c56 @ M65_small_00000::0c56 =====

undefined2 __h3000 FUN_M65_small_00000__0c56(void)

{
  undefined2 in_D;
  
  if (DAT_70b2 == 0) {
    API_FD20(0);
    API_FD2E(0);
  }
  else {
    API_FD20(0);
    API_FD2E(0);
  }
  return in_D;
}


// ===== FUN_M65_small_00000__0c8c @ M65_small_00000::0c8c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__0c8c(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70b4 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__0d9c();
  API_FC80((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_1,0x8b);
  return in_D;
}


// ===== FUN_M65_small_00000__0cb0 @ M65_small_00000::0cb0 =====

undefined2 __h3000 FUN_M65_small_00000__0cb0(void)

{
  undefined2 in_D;
  
  DAT_70b4 = DAT_70b4 ^ 0xffff;
  FUN_M65_small_00000__0cc4();
  FUN_M65_small_00000__0ce1();
  FUN_M65_small_00000__0d9c();
  FUN_M65_small_00000__0d0c();
  ModuleStorePtr(0xd);
  ModuleStorePtr(0xd);
  return in_D;
}


// ===== FUN_M65_small_00000__0cc4 @ M65_small_00000::0cc4 =====

undefined2 __h3000 FUN_M65_small_00000__0cc4(void)

{
  undefined2 in_D;
  
  FUN_M65_small_00000__0d9c();
  FUN_M65_small_00000__0d0c();
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xd);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xd);
  return in_D;
}


// ===== FUN_M65_small_00000__0ce1 @ M65_small_00000::0ce1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__0ce1(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC80((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_1,0x8b);
  FUN_eb1d((char)((ushort)DAT_70b4 >> 8),(char)DAT_70b4,param_1,0x23);
  FUN_M65_small_00000__0d9c();
  FUN_M65_small_00000__0d0c();
  FUN_M65_small_00000__0d64();
  API_FDEC();
  return in_D;
}


// ===== FUN_M65_small_00000__0d0c @ M65_small_00000::0d0c =====

undefined2 __h3000 FUN_M65_small_00000__0d0c(void)

{
  undefined2 in_D;
  
  if (DAT_70b4 == 0) {
    FUN_M65_small_00000__0761();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       --pitch quantizing--" */
    LcdPrintInline();
  }
  else {
    FUN_M65_small_00000__0761();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       ---normal output----" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__0d64 @ M65_small_00000::0d64 =====

undefined2 __h3000 FUN_M65_small_00000__0d64(void)

{
  undefined2 in_D;
  
  if (DAT_70b4 == 0) {
                    /* inline[API_FE02]: [-] [-] "quan=on " [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  else {
                    /* inline[API_FE02]: [-] [-] "quan=off" [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__0d9c @ M65_small_00000::0d9c =====

void __h3000 FUN_M65_small_00000__0d9c(void)

{
  return;
}


// ===== FUN_M65_small_00000__0d9d @ M65_small_00000::0d9d =====

void __h3000 FUN_M65_small_00000__0d9d(void)

{
  DAT_6074 = DAT_704a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left pitch:       cents,  [     :1]" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$0ED0 ->$0EA4
                       $0064 $0064 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__0ed0();
  FUN_M65_small_00000__0ed0();
  return;
}


// ===== FUN_M65_small_00000__0e06 @ M65_small_00000::0e06 =====

void __h3000 FUN_M65_small_00000__0e06(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0ED0 ->$0F04 $7046 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__0ed0_M65_small_00000__0df8);
  return;
}


// ===== FUN_M65_small_00000__0e12 @ M65_small_00000::0e12 =====

void __h3000 FUN_M65_small_00000__0e12(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0ED0 ->$0F04 $7046 */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__0ed0_M65_small_00000__0df8);
  return;
}


// ===== FUN_M65_small_00000__0e1e @ M65_small_00000::0e1e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__0e1e(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7046 = DAT_60f9 - DAT_7048;
  FUN_M65_small_00000__0f04();
  API_FC82((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,param_1,0x45);
  return in_D;
}


// ===== FUN_M65_small_00000__0e45 @ M65_small_00000::0e45 =====

undefined2 __h3000 FUN_M65_small_00000__0e45(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_704a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left pitch:       cents,  [     :1]" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$0ED0 ->$0EA4
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__0ed0();
  FUN_M65_small_00000__0ed0();
  return in_D;
}


// ===== FUN_M65_small_00000__0ea4 @ M65_small_00000::0ea4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__0ea4(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7046 = DAT_6074 - DAT_7048;
  API_FC82((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,param_1,0x45);
  FUN_eb1d((char)((ushort)DAT_7046 >> 8),(char)DAT_7046,param_1,4);
  FUN_M65_small_00000__0f04();
  FUN_M65_small_00000__0ed0();
  return in_D;
}


// ===== FUN_M65_small_00000__0ed0 @ M65_small_00000::0ed0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__0ed0(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  uVar1 = DAT_70b6;
  *(char *)(in_U + -1) = (char)DAT_70b6;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,0x7150);
  return in_D;
}


// ===== FUN_M65_small_00000__0f04 @ M65_small_00000::0f04 =====

undefined2 __h3000 FUN_M65_small_00000__0f04(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0xa0;
  *(undefined1 *)(in_U + -2) = 0xf6;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_7046 + DAT_7048;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_704a = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 100;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCE6();
  psVar2 = psVar2 + -1;
  FUN_M65_small_00000__2f43();
  DAT_70ee = *psVar2;
  psVar2 = psVar2 + 1;
  API_FD52();
  DAT_70b6 = *psVar2;
  return in_D;
}


// ===== FUN_M65_small_00000__0f45 @ M65_small_00000::0f45 =====

void __h3000 FUN_M65_small_00000__0f45(void)

{
  DAT_6074 = DAT_7052;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right pitch:       cents, [     :1]" */
  LcdPrintInline();
  if (DAT_7132 != -1) {
    FUN_M65_small_00000__0761();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       l & r pitch:       cents, [     :1]" */
    LcdPrintInline();
  }
                    /* inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$10F2 ->$10C6
                       $0064 $0064 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__10f2();
  FUN_M65_small_00000__10f2();
  return;
}


// ===== FUN_M65_small_00000__0feb @ M65_small_00000::0feb =====

void __h3000 FUN_M65_small_00000__0feb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$10F2 ->$1126 $704E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__10f2_M65_small_00000__0fdd);
  return;
}


// ===== FUN_M65_small_00000__0ff7 @ M65_small_00000::0ff7 =====

void __h3000 FUN_M65_small_00000__0ff7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$10F2 ->$1126 $704E */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__10f2_M65_small_00000__0fdd);
  return;
}


// ===== FUN_M65_small_00000__1003 @ M65_small_00000::1003 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1003(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_704e = DAT_60f9 - DAT_7050;
  FUN_M65_small_00000__1126();
  API_FC82((char)((ushort)DAT_704e >> 8),(char)DAT_704e,param_1,0x31);
  return in_D;
}


// ===== FUN_M65_small_00000__102a @ M65_small_00000::102a =====

undefined2 __h3000 FUN_M65_small_00000__102a(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7052;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right pitch:       cents, [     :1]" */
  LcdPrintInline();
  if (DAT_7132 != -1) {
    FUN_M65_small_00000__0761();
    LcdSetCursor();
                    /* inline[API_FC38]: "
                       l & r pitch:       cents, [     :1]" */
    LcdPrintInline();
  }
                    /* inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$10F2 ->$10C6
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__10f2();
  FUN_M65_small_00000__10f2();
  return in_D;
}


// ===== FUN_M65_small_00000__10c6 @ M65_small_00000::10c6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__10c6(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_704e = DAT_6074 - DAT_7050;
  API_FC82((char)((ushort)DAT_704e >> 8),(char)DAT_704e,param_1,0x31);
  FUN_eb1d((char)((ushort)DAT_704e >> 8),(char)DAT_704e,param_1,6);
  FUN_M65_small_00000__1126();
  FUN_M65_small_00000__10f2();
  return in_D;
}


// ===== FUN_M65_small_00000__10f2 @ M65_small_00000::10f2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__10f2(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  uVar1 = DAT_70b8;
  *(char *)(in_U + -1) = (char)DAT_70b8;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,0x7150);
  return in_D;
}


// ===== FUN_M65_small_00000__1126 @ M65_small_00000::1126 =====

undefined2 __h3000 FUN_M65_small_00000__1126(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  *(undefined1 *)(in_U + -1) = 0xa0;
  *(undefined1 *)(in_U + -2) = 0xf6;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar2 = (short *)(in_U + -6);
  *psVar2 = DAT_704e + DAT_7050;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7052 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 100;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCE6();
  psVar2 = psVar2 + -1;
  FUN_M65_small_00000__2f43();
  DAT_70f0 = *psVar2;
  psVar2 = psVar2 + 1;
  API_FD54();
  DAT_70b8 = *psVar2;
  return in_D;
}


// ===== FUN_M65_small_00000__1175 @ M65_small_00000::1175 =====

void __h3000 FUN_M65_small_00000__1175(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1257 ->$126C $7056 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__1257_M65_small_00000__1167);
  return;
}


// ===== FUN_M65_small_00000__1181 @ M65_small_00000::1181 =====

void __h3000 FUN_M65_small_00000__1181(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1257 ->$126C $7056 */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__1257_M65_small_00000__1167);
  return;
}


// ===== FUN_M65_small_00000__118d @ M65_small_00000::118d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__118d(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7056 = DAT_60f9 - DAT_7058;
  FUN_M65_small_00000__126c();
  API_FC82((char)((ushort)DAT_7056 >> 8),(char)DAT_7056,param_1,0x49);
  return in_D;
}


// ===== FUN_M65_small_00000__11b4 @ M65_small_00000::11b4 =====

undefined2 __h3000 FUN_M65_small_00000__11b4(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_705a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left delay:      mS " */
  LcdPrintInline();
  if (DAT_7134 == -1) {
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $01F4 $0000 $0000 ->$1257 ->$122D
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M65_small_00000__1257();
  }
  else {
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $03E8 $0000 $0000 ->$1257 ->$122D
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M65_small_00000__1257();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__122d @ M65_small_00000::122d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__122d(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7056 = DAT_6074 - DAT_7058;
  API_FC82((char)((ushort)DAT_7056 >> 8),(char)DAT_7056,param_1,0x49);
  FUN_eb1d((char)((ushort)DAT_7056 >> 8),(char)DAT_7056,param_1,5);
  FUN_M65_small_00000__126c();
  return in_D;
}


// ===== FUN_M65_small_00000__1257 @ M65_small_00000::1257 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1257(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M65_small_00000__126c @ M65_small_00000::126c =====

undefined2 __h3000 FUN_M65_small_00000__126c(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  if (DAT_7134 == 0) {
    *(undefined1 *)(in_U + -1) = 0;
    *(undefined1 *)(in_U + -2) = 0;
    *(undefined1 *)(in_U + -3) = 0xe8;
    *(undefined1 *)(in_U + -4) = 3;
    psVar2 = (short *)(in_U + -6);
    *psVar2 = DAT_7056 + DAT_7058;
    API_FCD8();
    DAT_705a = *psVar2;
  }
  else {
    *(undefined1 *)(in_U + -1) = 0;
    *(undefined1 *)(in_U + -2) = 0;
    *(undefined1 *)(in_U + -3) = 0xf4;
    *(undefined1 *)(in_U + -4) = 1;
    psVar2 = (short *)(in_U + -6);
    *psVar2 = DAT_7056 + DAT_7058;
    API_FCD8();
    DAT_705a = *psVar2;
  }
  *(undefined1 *)((short)psVar2 + 1) = 0x2c;
  *(undefined1 *)psVar2 = 0;
  sVar1 = DAT_705a;
  *(char *)((short)psVar2 + -1) = (char)DAT_705a;
  psVar2 = psVar2 + -1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  API_FCEE();
  DAT_70ba = *psVar2;
  FUN_M65_small_00000__2cf3();
  return in_D;
}


// ===== FUN_M65_small_00000__12d8 @ M65_small_00000::12d8 =====

void __h3000 FUN_M65_small_00000__12d8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$13ED ->$1402 $705E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__13ed_M65_small_00000__12ca);
  return;
}


// ===== FUN_M65_small_00000__12e4 @ M65_small_00000::12e4 =====

void __h3000 FUN_M65_small_00000__12e4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$13ED ->$1402 $705E */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__13ed_M65_small_00000__12ca);
  return;
}


// ===== FUN_M65_small_00000__12f0 @ M65_small_00000::12f0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__12f0(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_705e = DAT_60f9 - DAT_7060;
  FUN_M65_small_00000__1402();
  API_FC82((char)((ushort)DAT_705e >> 8),(char)DAT_705e,param_1,0x35);
  return in_D;
}


// ===== FUN_M65_small_00000__1317 @ M65_small_00000::1317 =====

undefined2 __h3000 FUN_M65_small_00000__1317(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7062;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right delay:      mS" */
  LcdPrintInline();
  if ((DAT_7132 == 0) || (DAT_713a == 0)) {
    LcdSetCursor();
                    /* inline[API_FC38]: "l & r" */
    LcdPrintInline();
  }
  if ((DAT_7134 == 0) || (DAT_713a == 0)) {
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $03E8 $0000 $0000 ->$13ED ->$13C3
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M65_small_00000__13ed();
  }
  else {
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $01F4 $0000 $0000 ->$13ED ->$13C3
                       $0001 $0001 $0000 */
    SetupParamEditPage();
    FUN_M65_small_00000__13ed();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__13c3 @ M65_small_00000::13c3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__13c3(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_705e = DAT_6074 - DAT_7060;
  API_FC82((char)((ushort)DAT_705e >> 8),(char)DAT_705e,param_1,0x35);
  FUN_eb1d((char)((ushort)DAT_705e >> 8),(char)DAT_705e,param_1,7);
  FUN_M65_small_00000__1402();
  return in_D;
}


// ===== FUN_M65_small_00000__13ed @ M65_small_00000::13ed =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__13ed(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M65_small_00000__1402 @ M65_small_00000::1402 =====

undefined2 __h3000 FUN_M65_small_00000__1402(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  short *psVar3;
  
  if ((DAT_7134 == 0) || (DAT_713a == 0)) {
    *(undefined1 *)(in_U + -1) = 0;
    *(undefined1 *)(in_U + -2) = 0;
    *(undefined1 *)(in_U + -3) = 0xe8;
    *(undefined1 *)(in_U + -4) = 3;
    psVar3 = (short *)(in_U + -6);
    *psVar3 = DAT_705e + DAT_7060;
    API_FCD8();
    DAT_7062 = *psVar3;
    psVar2 = psVar3 + 1;
    if (DAT_713a != -1) {
      DAT_705a = DAT_7062;
      *(undefined1 *)((short)psVar3 + 1) = 0x2c;
      *(undefined1 *)psVar3 = 0;
      sVar1 = DAT_705a;
      *(char *)((short)psVar3 + -1) = (char)DAT_705a;
      psVar3 = psVar3 + -1;
      *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
      API_FCEE();
      DAT_70ba = *psVar3;
      psVar2 = psVar3 + 1;
    }
  }
  else {
    *(undefined1 *)(in_U + -1) = 0;
    *(undefined1 *)(in_U + -2) = 0;
    *(undefined1 *)(in_U + -3) = 0xf4;
    *(undefined1 *)(in_U + -4) = 1;
    psVar2 = (short *)(in_U + -6);
    *psVar2 = DAT_705e + DAT_7060;
    API_FCD8();
    DAT_7062 = *psVar2;
    psVar2 = psVar2 + 1;
  }
  *(undefined1 *)((short)psVar2 + -1) = 0x2c;
  *(undefined1 *)(psVar2 + -1) = 0;
  sVar1 = DAT_7062;
  *(char *)((short)psVar2 + -3) = (char)DAT_7062;
  psVar2 = psVar2 + -2;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  API_FCEE();
  DAT_70bc = *psVar2;
  FUN_M65_small_00000__2cf3();
  return in_D;
}


// ===== FUN_M65_small_00000__149d @ M65_small_00000::149d =====

void __h3000 FUN_M65_small_00000__149d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1553 ->$1568 $7096 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__1553_M65_small_00000__148f);
  return;
}


// ===== FUN_M65_small_00000__14a9 @ M65_small_00000::14a9 =====

void __h3000 FUN_M65_small_00000__14a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1553 ->$1568 $7096 */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__1553_M65_small_00000__148f);
  return;
}


// ===== FUN_M65_small_00000__14b5 @ M65_small_00000::14b5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__14b5(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7096 = DAT_60f9 - DAT_7098;
  FUN_M65_small_00000__1568();
  API_FC82((char)((ushort)DAT_7096 >> 8),(char)DAT_7096,param_1,0x49);
  return in_D;
}


// ===== FUN_M65_small_00000__14dc @ M65_small_00000::14dc =====

undefined2 __h3000 FUN_M65_small_00000__14dc(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_709a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       l length =      mS  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0578 $0001 $0000 ->$1553 ->$1529
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__1553();
  return in_D;
}


// ===== FUN_M65_small_00000__1529 @ M65_small_00000::1529 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1529(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7096 = DAT_6074 - DAT_7098;
  API_FC82((char)((ushort)DAT_7096 >> 8),(char)DAT_7096,param_1,0x49);
  FUN_eb1d((char)((ushort)DAT_7096 >> 8),(char)DAT_7096,param_1,5);
  FUN_M65_small_00000__1568();
  return in_D;
}


// ===== FUN_M65_small_00000__1553 @ M65_small_00000::1553 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1553(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M65_small_00000__1568 @ M65_small_00000::1568 =====

undefined2 __h3000 FUN_M65_small_00000__1568(void)

{
  byte bVar1;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  short *psVar4;
  byte *pbVar5;
  short sVar2;
  
  *(undefined1 *)(in_U + -1) = 1;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x78;
  *(undefined1 *)(in_U + -4) = 5;
  psVar3 = (short *)(in_U + -6);
  *psVar3 = DAT_7096 + DAT_7098;
  API_FCD8();
  sVar2 = *psVar3;
  DAT_709a = sVar2;
  *(char *)((short)psVar3 + 1) = (char)sVar2;
  *(char *)psVar3 = (char)((ushort)sVar2 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x2c;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0;
  API_FCEE();
  DAT_70de = *psVar3;
  psVar3 = psVar3 + 1;
  API_FD3C();
  *(undefined1 *)((short)psVar3 + -1) = 0xff;
  psVar4 = psVar3 + -1;
  *(undefined1 *)psVar4 = 0x7f;
  sVar2 = DAT_70de;
  if (DAT_70de < 0) {
    *(char *)((short)psVar3 + -3) = (char)DAT_70de;
    psVar3 = psVar3 + -2;
    *(char *)psVar3 = (char)((ushort)sVar2 >> 8);
    API_FCC8();
    sVar2 = *psVar3;
    psVar4 = psVar3 + 1;
  }
  bVar1 = (byte)((ushort)sVar2 >> 8);
  *(byte *)((short)psVar4 + -1) =
       (char)((char)((char)sVar2 >> 1 | bVar1 << 7) >> 1 | (bVar1 >> 1) << 7) >> 1 |
       (bVar1 >> 2) << 7;
  pbVar5 = (byte *)(psVar4 + -1);
  *pbVar5 = bVar1 >> 3;
  API_FCEA();
  DAT_70de = -1 - *(short *)pbVar5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70de >> 8));
  return in_D;
}


// ===== FUN_M65_small_00000__15e5 @ M65_small_00000::15e5 =====

void __h3000 FUN_M65_small_00000__15e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$169B ->$16B0 $709E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__169b_M65_small_00000__15d7);
  return;
}


// ===== FUN_M65_small_00000__15f1 @ M65_small_00000::15f1 =====

void __h3000 FUN_M65_small_00000__15f1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$169B ->$16B0 $709E */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__169b_M65_small_00000__15d7);
  return;
}


// ===== FUN_M65_small_00000__15fd @ M65_small_00000::15fd =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__15fd(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_709e = DAT_60f9 - DAT_70a0;
  FUN_M65_small_00000__16b0();
  API_FC82((char)((ushort)DAT_709e >> 8),(char)DAT_709e,param_1,0x35);
  return in_D;
}


// ===== FUN_M65_small_00000__1624 @ M65_small_00000::1624 =====

undefined2 __h3000 FUN_M65_small_00000__1624(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70a2;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       r length =      mS  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 04 80 $0578 $0001 $0000 ->$169B ->$1671
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__169b();
  return in_D;
}


// ===== FUN_M65_small_00000__1671 @ M65_small_00000::1671 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1671(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_709e = DAT_6074 - DAT_70a0;
  API_FC82((char)((ushort)DAT_709e >> 8),(char)DAT_709e,param_1,0x35);
  FUN_eb1d((char)((ushort)DAT_709e >> 8),(char)DAT_709e,param_1,7);
  FUN_M65_small_00000__16b0();
  return in_D;
}


// ===== FUN_M65_small_00000__169b @ M65_small_00000::169b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__169b(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,4,&DAT_609f);
  return in_D;
}


// ===== FUN_M65_small_00000__16b0 @ M65_small_00000::16b0 =====

undefined2 __h3000 FUN_M65_small_00000__16b0(void)

{
  byte bVar1;
  undefined2 in_D;
  short in_U;
  short *psVar3;
  short *psVar4;
  byte *pbVar5;
  short sVar2;
  
  *(undefined1 *)(in_U + -1) = 1;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x78;
  *(undefined1 *)(in_U + -4) = 5;
  psVar3 = (short *)(in_U + -6);
  *psVar3 = DAT_709e + DAT_70a0;
  API_FCD8();
  sVar2 = *psVar3;
  DAT_70a2 = sVar2;
  *(char *)((short)psVar3 + 1) = (char)sVar2;
  *(char *)psVar3 = (char)((ushort)sVar2 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x2c;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0;
  API_FCEE();
  DAT_70de = *psVar3;
  psVar3 = psVar3 + 1;
  API_FD44();
  *(undefined1 *)((short)psVar3 + -1) = 0xff;
  psVar4 = psVar3 + -1;
  *(undefined1 *)psVar4 = 0x7f;
  sVar2 = DAT_70de;
  if (DAT_70de < 0) {
    *(char *)((short)psVar3 + -3) = (char)DAT_70de;
    psVar3 = psVar3 + -2;
    *(char *)psVar3 = (char)((ushort)sVar2 >> 8);
    API_FCC8();
    sVar2 = *psVar3;
    psVar4 = psVar3 + 1;
  }
  bVar1 = (byte)((ushort)sVar2 >> 8);
  *(byte *)((short)psVar4 + -1) =
       (char)((char)((char)sVar2 >> 1 | bVar1 << 7) >> 1 | (bVar1 >> 1) << 7) >> 1 |
       (bVar1 >> 2) << 7;
  pbVar5 = (byte *)(psVar4 + -1);
  *pbVar5 = bVar1 >> 3;
  API_FCEA();
  DAT_70de = -1 - *(short *)pbVar5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70de >> 8));
  return in_D;
}


// ===== FUN_M65_small_00000__171c @ M65_small_00000::171c =====

undefined2 __h3000 FUN_M65_small_00000__171c(void)

{
  undefined2 in_stack_00000000;
  
  return in_stack_00000000;
}


// ===== FUN_M65_small_00000__171f @ M65_small_00000::171f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__171f(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7004 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__17d4();
  API_FC80((char)((ushort)DAT_7004 >> 8),(char)DAT_7004,param_1,0x33);
  return in_D;
}


// ===== FUN_M65_small_00000__1743 @ M65_small_00000::1743 =====

undefined2 __h3000 FUN_M65_small_00000__1743(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7004;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       major key:          " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $000B $0000 $0000 ->$17B9 ->$1790
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__17b9();
  return in_D;
}


// ===== FUN_M65_small_00000__1790 @ M65_small_00000::1790 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1790(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7004 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x33);
  FUN_eb1d((char)((ushort)DAT_7004 >> 8),(char)DAT_7004,param_1,4);
  FUN_M65_small_00000__17b9();
  FUN_M65_small_00000__17d4();
  return in_D;
}


// ===== FUN_M65_small_00000__17b9 @ M65_small_00000::17b9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__17b9(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_small_00000__17d9 + DAT_600d + (DAT_7004 & 0xff) * 2) >> 8),2,
           &UNK_M65_small_00000__17d9 + DAT_600d + (DAT_7004 & 0xff) * 2);
  return;
}


// ===== FUN_M65_small_00000__17d4 @ M65_small_00000::17d4 =====

undefined2 __h3000 FUN_M65_small_00000__17d4(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_4;
  
  uStack_4 = CONCAT11(param_1,param_2);
  return uStack_4;
}


// ===== FUN_M65_small_00000__17f1 @ M65_small_00000::17f1 =====

undefined2 __h3000 FUN_M65_small_00000__17f1(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7008;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       note    :      cents" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0016 $0000 $0000 ->$184D ->$183E
                       $0002 $0002 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__184d();
  return in_D;
}


// ===== FUN_M65_small_00000__183e @ M65_small_00000::183e =====

undefined2 __h3000 FUN_M65_small_00000__183e(void)

{
  undefined2 in_D;
  
  DAT_7008 = DAT_6074;
  FUN_M65_small_00000__184d();
  FUN_M65_small_00000__188d();
  return in_D;
}


// ===== FUN_M65_small_00000__184d @ M65_small_00000::184d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__184d(void)

{
  undefined2 uVar1;
  undefined2 *puVar2;
  undefined1 extraout_A;
  undefined1 uVar3;
  short in_U;
  
  LcdSetCursor();
  DAT_70de = DAT_7008;
  API_FC3A((char)((ushort)(&UNK_M65_small_00000__17d9 + DAT_600d + DAT_7008) >> 8),2,
           &UNK_M65_small_00000__17d9 + DAT_600d + DAT_7008);
  puVar2 = (undefined2 *)(DAT_7008 + DAT_7014);
  uVar1 = *puVar2;
  uVar3 = (undefined1)uVar1;
  *(undefined1 *)(in_U + -1) = uVar3;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0,uVar3,puVar2,&DAT_70fa);
  LcdSetCursor();
  API_FC3A(extraout_A,5,&DAT_70fe);
  return;
}


// ===== FUN_M65_small_00000__188d @ M65_small_00000::188d =====

void __h3000 FUN_M65_small_00000__188d(void)

{
  return;
}


// ===== FUN_M65_small_00000__188e @ M65_small_00000::188e =====

undefined2 __h3000 FUN_M65_small_00000__188e(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7008 = (DAT_6103 + -0xb) * 2;
  if (0x17 < DAT_7008) {
    DAT_7008 = DAT_7008 + -0x18;
  }
  DAT_7014 = &DAT_7016;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__1915();
  return in_D;
}


// ===== FUN_M65_small_00000__18c5 @ M65_small_00000::18c5 =====

undefined2 __h3000 FUN_M65_small_00000__18c5(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_700e;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       note    :      cents" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$195A ->$1915
                       $0064 $0064 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__195a();
  FUN_M65_small_00000__184d();
  return in_D;
}


// ===== FUN_M65_small_00000__1915 @ M65_small_00000::1915 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1915(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  
  DAT_700e = DAT_6074;
  puVar1 = (undefined2 *)(DAT_7008 + DAT_7014);
  *puVar1 = DAT_6074;
  API_FC82((char)((ushort)*puVar1 >> 8),(char)*puVar1,puVar1,(short)puVar1 + -0x6fbb);
  FUN_eb1d((char)((ushort)*puVar1 >> 8));
  FUN_M65_small_00000__195a();
  FUN_M65_small_00000__196f();
  return in_D;
}


// ===== FUN_M65_small_00000__195a @ M65_small_00000::195a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__195a(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,5,&DAT_609e);
  return in_D;
}


// ===== FUN_M65_small_00000__196f @ M65_small_00000::196f =====

void __h3000 FUN_M65_small_00000__196f(void)

{
  return;
}


// ===== FUN_M65_small_00000__1970 @ M65_small_00000::1970 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1970(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7000 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__1a25();
  API_FC80((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,0x31);
  return in_D;
}


// ===== FUN_M65_small_00000__1994 @ M65_small_00000::1994 =====

undefined2 __h3000 FUN_M65_small_00000__1994(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7000;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       l voice:            " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1A0A ->$19E1
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__1a0a();
  return in_D;
}


// ===== FUN_M65_small_00000__19e1 @ M65_small_00000::19e1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__19e1(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7000 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x31);
  FUN_eb1d((char)((ushort)DAT_7000 >> 8),(char)DAT_7000,param_1,5);
  FUN_M65_small_00000__1a0a();
  FUN_M65_small_00000__1a25();
  return in_D;
}


// ===== FUN_M65_small_00000__1a0a @ M65_small_00000::1a0a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__1a0a(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_small_00000__1b6f + DAT_600d + (DAT_7000 & 0xff) * 10) >> 8),10,
           &UNK_M65_small_00000__1b6f + DAT_600d + (DAT_7000 & 0xff) * 10);
  return;
}


// ===== FUN_M65_small_00000__1a25 @ M65_small_00000::1a25 =====

undefined2 __h3000 FUN_M65_small_00000__1a25(void)

{
  undefined2 in_D;
  
  if (DAT_7000 < 0x13) {
    DAT_70d8 = (undefined2 *)
               (*(short *)(&UNK_M65_small_00000__1b49 +
                          DAT_600d +
                          CONCAT11((char)((ushort)DAT_7000 >> 8) << 1 | (byte)DAT_7000 >> 7,
                                   (byte)DAT_7000 << 1)) + DAT_600d);
  }
  else if (DAT_7000 == 0x14) {
    DAT_70d8 = &DAT_702e;
  }
  else {
    DAT_70d8 = &DAT_7016;
  }
  return in_D;
}


// ===== FUN_M65_small_00000__1a5b @ M65_small_00000::1a5b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1a5b(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7002 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__1b10();
  API_FC80((char)((ushort)DAT_7002 >> 8),(char)DAT_7002,param_1,0x32);
  return in_D;
}


// ===== FUN_M65_small_00000__1a7f @ M65_small_00000::1a7f =====

undefined2 __h3000 FUN_M65_small_00000__1a7f(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7002;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       r voice:            " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1AF5 ->$1ACC
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__1af5();
  return in_D;
}


// ===== FUN_M65_small_00000__1acc @ M65_small_00000::1acc =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1acc(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7002 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x32);
  FUN_eb1d((char)((ushort)DAT_7002 >> 8),(char)DAT_7002,param_1,6);
  FUN_M65_small_00000__1af5();
  FUN_M65_small_00000__1b10();
  return in_D;
}


// ===== FUN_M65_small_00000__1af5 @ M65_small_00000::1af5 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__1af5(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_small_00000__1b6f + DAT_600d + (DAT_7002 & 0xff) * 10) >> 8),10,
           &UNK_M65_small_00000__1b6f + DAT_600d + (DAT_7002 & 0xff) * 10);
  return;
}


// ===== FUN_M65_small_00000__1b10 @ M65_small_00000::1b10 =====

undefined2 __h3000 FUN_M65_small_00000__1b10(void)

{
  undefined2 in_D;
  
  if (DAT_7002 < 0x13) {
    DAT_70da = (undefined2 *)
               (*(short *)(&UNK_M65_small_00000__1b49 +
                          DAT_600d +
                          CONCAT11((char)((ushort)DAT_7002 >> 8) << 1 | (byte)DAT_7002 >> 7,
                                   (byte)DAT_7002 << 1)) + DAT_600d);
  }
  else if (DAT_7002 == 0x14) {
    DAT_70da = &DAT_702e;
  }
  else {
    DAT_70da = &DAT_7016;
  }
  return in_D;
}


// ===== FUN_M65_small_00000__1c41 @ M65_small_00000::1c41 =====

undefined2 __h3000 FUN_M65_small_00000__1c41(void)

{
  undefined2 in_D;
  
  DAT_70dc = 0;
  LcdSetCursor();
                    /* inline[API_FC38]: "Play note - enter retunes:         cents" */
  LcdPrintInline();
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1d);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0x1c);
  return in_D;
}


// ===== FUN_M65_small_00000__1ca3 @ M65_small_00000::1ca3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__1ca3(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  FUN_M65_small_00000__1d0f();
  FUN_M65_small_00000__1cb9();
  API_FC82((char)((ushort)DAT_7006 >> 8),(char)DAT_7006,param_3,0x59);
  return;
}


// ===== FUN_M65_small_00000__1cb9 @ M65_small_00000::1cb9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1cb9(void)

{
  undefined2 uVar1;
  undefined1 extraout_A;
  undefined2 in_D;
  short in_U;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "You are now tuned     cents from A440   " */
  LcdPrintInline();
  LcdSetCursor();
  uVar1 = DAT_70f8;
  *(char *)(in_U + -1) = (char)DAT_70f8;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0);
  API_FC3A(extraout_A,3,&DAT_7100);
  return in_D;
}


// ===== FUN_M65_small_00000__1d0f @ M65_small_00000::1d0f =====

undefined2 __h3000 FUN_M65_small_00000__1d0f(void)

{
  undefined2 in_D;
  short in_U;
  char *pcVar1;
  
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1e);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0xb);
  *(short *)(in_U + -2) = DAT_70f8 + 0x32;
  *(undefined1 *)(in_U + -3) = 5;
  pcVar1 = (char *)(in_U + -4);
  *pcVar1 = '\0';
  API_FCEA();
  DAT_7006 = *(undefined2 *)
              (FUN_M65_small_00000__1d60 +
              DAT_600d + CONCAT11(*pcVar1 << 1 | (byte)pcVar1[1] >> 7,pcVar1[1] << 1));
  DAT_70dc = 0xffff;
  return in_D;
}


// ===== FUN_M65_small_00000__1d60 @ M65_small_00000::1d60 =====

/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Removing unreachable block (RAM,0x1d6d) */

void __h3000 FUN_M65_small_00000__1d60(void)

{
  undefined2 uVar1;
  
  uVar1 = DAT_40fc;
                    /* WARNING: Read-only address (RAM,0x0001) is written */
  do {
  } while( true );
}


// ===== FUN_M65_small_00000__1d8a @ M65_small_00000::1d8a =====

void __h3000 FUN_M65_small_00000__1d8a(void)

{
  FUN_M65_small_00000__0761();
  LcdSetCursor();
  DAT_70dc = 0xffff;
                    /* inline[API_FC62]: $6038 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $600F */
  ModuleStorePtr(0x1d);
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0xb);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0xb);
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       pitch:         cents" */
  LcdPrintInline();
  FUN_M65_small_00000__1de3();
  return;
}


// ===== FUN_M65_small_00000__1de3 @ M65_small_00000::1de3 =====

undefined2 __h3000 FUN_M65_small_00000__1de3(void)

{
  undefined2 in_D;
  
  if (FUN_M65_small_00000__0b62 + DAT_600d == DAT_6072) {
    FUN_M65_small_00000__1e3d();
    FUN_M65_small_00000__1e0b();
  }
  else {
    DAT_70dc = 0xffff;
                    /* inline[API_FC62]: $6038 */
    ModuleStorePtr(0xb);
    FUN_M65_small_00000__1e3d();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__1e0b @ M65_small_00000::1e0b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__1e0b(void)

{
  undefined2 uVar1;
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined2 in_D;
  short in_U;
  
  LcdSetCursor();
  uVar1 = DAT_70f8;
  *(char *)(in_U + -1) = (char)DAT_70f8;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(0);
  API_FC3A(extraout_A,3,&DAT_7100);
  LcdSetCursor();
  API_FC3A(extraout_A_00,4,DAT_70d6);
  return in_D;
}


// ===== FUN_M65_small_00000__1e3d @ M65_small_00000::1e3d =====

undefined2 __h3000 FUN_M65_small_00000__1e3d(void)

{
  ushort uVar1;
  undefined2 uVar2;
  char cVar3;
  undefined2 in_D;
  short sVar4;
  ushort *puVar5;
  ushort *puVar6;
  short *psVar7;
  short in_U;
  ushort *puVar8;
  
  DAT_70ca = API_FD42();
  DAT_70cc = API_FD3A();
  cVar3 = (char)((ushort)DAT_70ca >> 8);
  if (DAT_70ca < DAT_70cc) {
    DAT_70e4 = CONCAT11(cVar3 >> 2,(char)((char)DAT_70ca >> 1 | cVar3 << 7) >> 1 | (cVar3 >> 1) << 7
                       );
    *(short *)(in_U + -2) = DAT_70e4 + DAT_70cc;
    sVar4 = DAT_70ca;
    *(char *)(in_U + -3) = (char)DAT_70ca;
    puVar8 = (ushort *)(in_U + -4);
    *(char *)puVar8 = (char)((ushort)sVar4 >> 8);
    API_FCEA();
    sVar4 = DAT_70cc;
    DAT_70e2 = *puVar8;
    *(char *)((short)puVar8 + 1) = (char)DAT_70cc;
    *(char *)puVar8 = (char)((ushort)sVar4 >> 8);
    *(undefined1 *)((short)puVar8 + -1) = 10;
    puVar8 = puVar8 + -1;
    *(undefined1 *)puVar8 = 0;
    API_FCEE();
    uVar1 = DAT_70e2;
    *(char *)((short)puVar8 + -1) = (char)DAT_70e2;
    puVar8 = puVar8 + -1;
    *(char *)puVar8 = (char)(uVar1 >> 8);
    API_FCEA();
    DAT_70ce = *puVar8;
    DAT_70e2 = DAT_70ce;
  }
  else {
    *(char *)(in_U + -1) = (char)DAT_70ca;
    *(char *)(in_U + -2) = cVar3;
    *(undefined1 *)(in_U + -3) = 10;
    puVar8 = (ushort *)(in_U + -4);
    *(undefined1 *)puVar8 = 0;
    API_FCEE();
    DAT_70ce = *puVar8;
  }
  uVar1 = DAT_70ce;
  if (DAT_70dc == -1) {
    *(char *)((short)puVar8 + 1) = (char)DAT_70ce;
    *(char *)puVar8 = (char)(uVar1 >> 8);
    uVar2 = DAT_7006;
    *(char *)((short)puVar8 + -1) = (char)DAT_7006;
    puVar8 = puVar8 + -1;
    *(char *)puVar8 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    DAT_70f6 = *puVar8 + DAT_70ce;
  }
  else {
    DAT_70f6 = DAT_70ce;
  }
  puVar6 = (ushort *)(&DAT_M65_small_00000__21af + DAT_600d);
  do {
    puVar5 = puVar6;
    puVar6 = puVar5 + 1;
  } while (*puVar5 < DAT_70f6 == (*puVar5 == DAT_70f6));
  DAT_70f8 = 0x32;
  DAT_70e0 = -5;
  uVar1 = *puVar5;
  *(char *)((short)puVar8 + 1) = (char)uVar1;
  *(char *)puVar8 = (char)(uVar1 >> 8);
  if (DAT_70f6 - *puVar5 != 0) {
    puVar8 = puVar8 + -1;
    *puVar8 = DAT_70f6 - *puVar5;
    API_FCEA();
    DAT_70de = *puVar8;
    DAT_70f8 = -0x32;
    DAT_70e0 = 5;
    uVar1 = puVar5[-1];
    *(char *)((short)puVar8 + 1) = (char)uVar1;
    *(char *)puVar8 = (char)(uVar1 >> 8);
    if (uVar1 - DAT_70f6 != 0) {
      puVar8 = puVar8 + -1;
      *puVar8 = uVar1 - DAT_70f6;
      API_FCEA();
      DAT_70de = *puVar8;
      puVar8 = puVar8 + 1;
      puVar6 = (ushort *)(&DAT_M65_small_00000__2197 + DAT_600d);
      while (*puVar6 < DAT_70de == (*puVar6 == DAT_70de)) {
        DAT_70f8 = DAT_70f8 + DAT_70e0;
        puVar6 = puVar6 + 1;
      }
    }
  }
  DAT_70d6 = &UNK_M65_small_00000__3277 + ((short)((short)puVar5 + -0x21af) * 2 - DAT_600d);
  puVar8[-1] = (ushort)((short)puVar5 + (DAT_7004 * -2 - DAT_600d) + -0x2197);
  *(undefined1 *)((short)puVar8 + -3) = 0x18;
  puVar8 = puVar8 + -2;
  *(undefined1 *)puVar8 = 0;
  API_FCE8();
  psVar7 = (short *)(*puVar8 + DAT_70d8);
  sVar4 = DAT_70b4;
  if (DAT_70b4 != -1) {
    sVar4 = DAT_70b4 - DAT_70f8;
  }
  if (sVar4 + *psVar7 != DAT_7046) {
    DAT_7046 = sVar4 + *psVar7;
    FUN_M65_small_00000__0f04();
  }
  sVar4 = DAT_70b4;
  if (DAT_70b4 != -1) {
    sVar4 = DAT_70b4 - DAT_70f8;
  }
  sVar4 = sVar4 + *(short *)((short)psVar7 + (DAT_70da - DAT_70d8));
  if (sVar4 != DAT_704e) {
    DAT_704e = sVar4;
    FUN_M65_small_00000__1126();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__2267 @ M65_small_00000::2267 =====

void __h3000 FUN_M65_small_00000__2267(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$231F ->$2334 $7066 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__231f_M65_small_00000__2259);
  return;
}


// ===== FUN_M65_small_00000__2273 @ M65_small_00000::2273 =====

void __h3000 FUN_M65_small_00000__2273(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$231F ->$2334 $7066 */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__231f_M65_small_00000__2259);
  return;
}


// ===== FUN_M65_small_00000__227f @ M65_small_00000::227f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__227f(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7066 = DAT_60f9 - DAT_7068;
  FUN_M65_small_00000__2334();
  API_FC82((char)((ushort)DAT_7066 >> 8),(char)DAT_7066,param_1,0x3d);
  return in_D;
}


// ===== FUN_M65_small_00000__22a6 @ M65_small_00000::22a6 =====

undefined2 __h3000 FUN_M65_small_00000__22a6(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_706a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       mix:     % wet      " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$231F ->$22F3
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__231f();
  return in_D;
}


// ===== FUN_M65_small_00000__22f3 @ M65_small_00000::22f3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__22f3(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7066 = DAT_6074 - DAT_7068;
  API_FC82((char)((ushort)DAT_7066 >> 8),(char)DAT_7066,param_1,0x3d);
  FUN_M65_small_00000__2334();
  FUN_M65_small_00000__231f();
  FUN_eb1d((char)((ushort)DAT_7066 >> 8),(char)DAT_7066,param_1,0);
  return in_D;
}


// ===== FUN_M65_small_00000__231f @ M65_small_00000::231f =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__231f(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M65_small_00000__2334 @ M65_small_00000::2334 =====

undefined2 __h3000 FUN_M65_small_00000__2334(void)

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
  *psVar2 = DAT_7066 + DAT_7068;
  API_FCD8();
  DAT_706a = *psVar2;
  sVar1 = 100 - DAT_706a;
  *psVar2 = sVar1;
  DAT_70de = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70de) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M65_small_00000__2385 @ M65_small_00000::2385 =====

void __h3000 FUN_M65_small_00000__2385(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$243D ->$2452 $706E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__243d_M65_small_00000__2377);
  return;
}


// ===== FUN_M65_small_00000__2391 @ M65_small_00000::2391 =====

void __h3000 FUN_M65_small_00000__2391(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$243D ->$2452 $706E */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__243d_M65_small_00000__2377);
  return;
}


// ===== FUN_M65_small_00000__239d @ M65_small_00000::239d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__239d(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_706e = DAT_60f9 - DAT_7070;
  FUN_M65_small_00000__2452();
  API_FC82((char)((ushort)DAT_706e >> 8),(char)DAT_706e,param_1,0x51);
  return in_D;
}


// ===== FUN_M65_small_00000__23c4 @ M65_small_00000::23c4 =====

undefined2 __h3000 FUN_M65_small_00000__23c4(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7072;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left mix:     % wet " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$243D ->$2411
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__243d();
  return in_D;
}


// ===== FUN_M65_small_00000__2411 @ M65_small_00000::2411 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2411(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_706e = DAT_6074 - DAT_7070;
  API_FC82((char)((ushort)DAT_706e >> 8),(char)DAT_706e,param_1,0x51);
  FUN_eb1d((char)((ushort)DAT_706e >> 8),(char)DAT_706e,param_1,0);
  FUN_M65_small_00000__2452();
  FUN_M65_small_00000__243d();
  return in_D;
}


// ===== FUN_M65_small_00000__243d @ M65_small_00000::243d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__243d(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M65_small_00000__2452 @ M65_small_00000::2452 =====

undefined2 __h3000 FUN_M65_small_00000__2452(void)

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
  *psVar2 = DAT_706e + DAT_7070;
  API_FCD8();
  DAT_7072 = *psVar2;
  sVar1 = 100 - DAT_7072;
  *psVar2 = sVar1;
  DAT_70de = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_70de) >> 8));
  return in_D;
}


// ===== FUN_M65_small_00000__249f @ M65_small_00000::249f =====

void __h3000 FUN_M65_small_00000__249f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2557 ->$256C $7076 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__2557_M65_small_00000__2491);
  return;
}


// ===== FUN_M65_small_00000__24ab @ M65_small_00000::24ab =====

void __h3000 FUN_M65_small_00000__24ab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2557 ->$256C $7076 */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__2557_M65_small_00000__2491);
  return;
}


// ===== FUN_M65_small_00000__24b7 @ M65_small_00000::24b7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__24b7(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7076 = DAT_60f9 - DAT_7078;
  FUN_M65_small_00000__256c();
  API_FC82((char)((ushort)DAT_7076 >> 8),(char)DAT_7076,param_1,0x3d);
  return in_D;
}


// ===== FUN_M65_small_00000__24de @ M65_small_00000::24de =====

undefined2 __h3000 FUN_M65_small_00000__24de(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_707a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right mix:    % wet " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2557 ->$252B
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__2557();
  return in_D;
}


// ===== FUN_M65_small_00000__252b @ M65_small_00000::252b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__252b(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7076 = DAT_6074 - DAT_7078;
  API_FC82((char)((ushort)DAT_7076 >> 8),(char)DAT_7076,param_1,0x3d);
  FUN_eb1d((char)((ushort)DAT_7076 >> 8),(char)DAT_7076,param_1,1);
  FUN_M65_small_00000__256c();
  FUN_M65_small_00000__2557();
  return in_D;
}


// ===== FUN_M65_small_00000__2557 @ M65_small_00000::2557 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2557(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M65_small_00000__256c @ M65_small_00000::256c =====

undefined2 __h3000 FUN_M65_small_00000__256c(void)

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
  *psVar2 = DAT_7076 + DAT_7078;
  API_FCD8();
  DAT_707a = *psVar2;
  sVar1 = 100 - DAT_707a;
  *psVar2 = sVar1;
  DAT_70de = sVar1 * 2;
  *(undefined1 *)((short)psVar2 + -1) = 0x66;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_70de) >> 8));
  return in_D;
}


// ===== FUN_M65_small_00000__25b9 @ M65_small_00000::25b9 =====

void __h3000 FUN_M65_small_00000__25b9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2671 ->$2686 $707E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__2671_M65_small_00000__25ab);
  return;
}


// ===== FUN_M65_small_00000__25c5 @ M65_small_00000::25c5 =====

void __h3000 FUN_M65_small_00000__25c5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2671 ->$2686 $707E */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__2671_M65_small_00000__25ab);
  return;
}


// ===== FUN_M65_small_00000__25d1 @ M65_small_00000::25d1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__25d1(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_707e = DAT_60f9 - DAT_7080;
  FUN_M65_small_00000__2686();
  API_FC82((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_1,0x39);
  return in_D;
}


// ===== FUN_M65_small_00000__25f8 @ M65_small_00000::25f8 =====

undefined2 __h3000 FUN_M65_small_00000__25f8(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7082;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       l & r fdback:     % " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2671 ->$2645
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__2671();
  return in_D;
}


// ===== FUN_M65_small_00000__2645 @ M65_small_00000::2645 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2645(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_707e = DAT_6074 - DAT_7080;
  API_FC82((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_1,0x39);
  FUN_eb1d((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_1,1);
  FUN_M65_small_00000__2686();
  FUN_M65_small_00000__2671();
  return in_D;
}


// ===== FUN_M65_small_00000__2671 @ M65_small_00000::2671 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2671(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M65_small_00000__2686 @ M65_small_00000::2686 =====

undefined2 __h3000 FUN_M65_small_00000__2686(void)

{
  short sVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar4 = (short *)(in_U + -6);
  *psVar4 = DAT_707e + DAT_7080;
  API_FCD8();
  sVar1 = *psVar4;
  bVar3 = (byte)sVar1;
  DAT_7082 = sVar1;
  *(byte *)((short)psVar4 + 1) = bVar3;
  cVar2 = (char)((ushort)sVar1 >> 8);
  *(char *)psVar4 = cVar2;
  DAT_70de = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)((short)psVar4 + -1) = 0x66;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6C((char)((ushort)(*psVar4 + DAT_70de) >> 8));
  API_FC74();
  return in_D;
}


// ===== FUN_M65_small_00000__26d4 @ M65_small_00000::26d4 =====

void __h3000 FUN_M65_small_00000__26d4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$278C ->$27A1 $7086 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__278c_M65_small_00000__26c6);
  return;
}


// ===== FUN_M65_small_00000__26e0 @ M65_small_00000::26e0 =====

void __h3000 FUN_M65_small_00000__26e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$278C ->$27A1 $7086 */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__278c_M65_small_00000__26c6);
  return;
}


// ===== FUN_M65_small_00000__26ec @ M65_small_00000::26ec =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__26ec(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_7086 = DAT_60f9 - DAT_7088;
  FUN_M65_small_00000__27a1();
  API_FC82((char)((ushort)DAT_7086 >> 8),(char)DAT_7086,param_1,0x4d);
  return in_D;
}


// ===== FUN_M65_small_00000__2713 @ M65_small_00000::2713 =====

undefined2 __h3000 FUN_M65_small_00000__2713(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_708a;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       left fdback:     %  " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$278C ->$2760
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__278c();
  return in_D;
}


// ===== FUN_M65_small_00000__2760 @ M65_small_00000::2760 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2760(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7086 = DAT_6074 - DAT_7088;
  API_FC82((char)((ushort)DAT_7086 >> 8),(char)DAT_7086,param_1,0x4d);
  FUN_eb1d((char)((ushort)DAT_7086 >> 8),(char)DAT_7086,param_1,2);
  FUN_M65_small_00000__27a1();
  FUN_M65_small_00000__278c();
  return in_D;
}


// ===== FUN_M65_small_00000__278c @ M65_small_00000::278c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__278c(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M65_small_00000__27a1 @ M65_small_00000::27a1 =====

undefined2 __h3000 FUN_M65_small_00000__27a1(void)

{
  short sVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar4 = (short *)(in_U + -6);
  *psVar4 = DAT_7086 + DAT_7088;
  API_FCD8();
  sVar1 = *psVar4;
  bVar3 = (byte)sVar1;
  DAT_708a = sVar1;
  *(byte *)((short)psVar4 + 1) = bVar3;
  cVar2 = (char)((ushort)sVar1 >> 8);
  *(char *)psVar4 = cVar2;
  DAT_70de = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)((short)psVar4 + -1) = 0x66;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6C((char)((ushort)(*psVar4 + DAT_70de) >> 8));
  return in_D;
}


// ===== FUN_M65_small_00000__27eb @ M65_small_00000::27eb =====

void __h3000 FUN_M65_small_00000__27eb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$28A3 ->$28B8 $708E */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M65_small_00000__28a3_M65_small_00000__27dd);
  return;
}


// ===== FUN_M65_small_00000__27f7 @ M65_small_00000::27f7 =====

void __h3000 FUN_M65_small_00000__27f7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$28A3 ->$28B8 $708E */
  FUN_e736(param_1,param_2,&PTR_FUN_M65_small_00000__28a3_M65_small_00000__27dd);
  return;
}


// ===== FUN_M65_small_00000__2803 @ M65_small_00000::2803 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2803(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_6074 = DAT_60f9;
  DAT_708e = DAT_60f9 - DAT_7090;
  FUN_M65_small_00000__28b8();
  API_FC82((char)((ushort)DAT_708e >> 8),(char)DAT_708e,param_1,0x39);
  return in_D;
}


// ===== FUN_M65_small_00000__282a @ M65_small_00000::282a =====

undefined2 __h3000 FUN_M65_small_00000__282a(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7092;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       right fdback:     % " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$28A3 ->$2877
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__28a3();
  return in_D;
}


// ===== FUN_M65_small_00000__2877 @ M65_small_00000::2877 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2877(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_708e = DAT_6074 - DAT_7090;
  API_FC82((char)((ushort)DAT_708e >> 8),(char)DAT_708e,param_1,0x39);
  FUN_eb1d((char)((ushort)DAT_708e >> 8),(char)DAT_708e,param_1,3);
  FUN_M65_small_00000__28b8();
  FUN_M65_small_00000__28a3();
  return in_D;
}


// ===== FUN_M65_small_00000__28a3 @ M65_small_00000::28a3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__28a3(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
  API_FC3A(0,3,0x60a0);
  return in_D;
}


// ===== FUN_M65_small_00000__28b8 @ M65_small_00000::28b8 =====

undefined2 __h3000 FUN_M65_small_00000__28b8(void)

{
  short sVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar4 = (short *)(in_U + -6);
  *psVar4 = DAT_708e + DAT_7090;
  API_FCD8();
  sVar1 = *psVar4;
  bVar3 = (byte)sVar1;
  DAT_7092 = sVar1;
  *(byte *)((short)psVar4 + 1) = bVar3;
  cVar2 = (char)((ushort)sVar1 >> 8);
  *(char *)psVar4 = cVar2;
  DAT_70de = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)((short)psVar4 + -1) = 0x66;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC74((char)((ushort)(*psVar4 + DAT_70de) >> 8));
  return in_D;
}


// ===== FUN_M65_small_00000__28f4 @ M65_small_00000::28f4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__28f4(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70a8 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__29f4();
  API_FC80((char)((ushort)DAT_70a8 >> 8),(char)DAT_70a8,param_1,0x42);
  return in_D;
}


// ===== FUN_M65_small_00000__2918 @ M65_small_00000::2918 =====

undefined2 __h3000 FUN_M65_small_00000__2918(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70a8;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$2994 ->$2968
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__2994();
  FUN_M65_small_00000__2a98();
  return in_D;
}


// ===== FUN_M65_small_00000__2968 @ M65_small_00000::2968 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2968(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70a8 = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x42);
  FUN_eb1d((char)((ushort)DAT_70a8 >> 8),(char)DAT_70a8,param_1,9);
  FUN_M65_small_00000__2994();
  FUN_M65_small_00000__2a98();
  FUN_M65_small_00000__29f4();
  return in_D;
}


// ===== FUN_M65_small_00000__2994 @ M65_small_00000::2994 =====

void __h3000 FUN_M65_small_00000__2994(void)

{
  LcdSetCursor();
  if (DAT_70a8 == 0) {
                    /* inline[API_FC38]: "C4" */
    LcdPrintInline();
  }
  else if (DAT_70a8 == 1) {
                    /* inline[API_FC38]: "C5" */
    LcdPrintInline();
  }
  else if (DAT_70a8 == 2) {
                    /* inline[API_FC38]: "C6" */
    LcdPrintInline();
  }
  else if (DAT_70a8 == 3) {
                    /* inline[API_FC38]: "C7" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "C8" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_M65_small_00000__29f4 @ M65_small_00000::29f4 =====

void __h3000 FUN_M65_small_00000__29f4(void)

{
  FUN_M65_small_00000__2abc();
  return;
}


// ===== FUN_M65_small_00000__29f8 @ M65_small_00000::29f8 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__29f8(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70a6 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__2abc();
  API_FC80((char)((ushort)DAT_70a6 >> 8),(char)DAT_70a6,param_1,0x41);
  return in_D;
}


// ===== FUN_M65_small_00000__2a1c @ M65_small_00000::2a1c =====

undefined2 __h3000 FUN_M65_small_00000__2a1c(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70a6;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$2A98 ->$2A6C
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__2a98();
  FUN_M65_small_00000__2994();
  return in_D;
}


// ===== FUN_M65_small_00000__2a6c @ M65_small_00000::2a6c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2a6c(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70a6 = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x41);
  FUN_eb1d((char)((ushort)DAT_70a6 >> 8),(char)DAT_70a6,param_1,8);
  FUN_M65_small_00000__2a98();
  FUN_M65_small_00000__2994();
  FUN_M65_small_00000__2abc();
  return in_D;
}


// ===== FUN_M65_small_00000__2a98 @ M65_small_00000::2a98 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__2a98(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M65_small_00000__3217 +
                          DAT_600d + ((DAT_70a8 & 0xff) * 0xc + 2 + DAT_70a6 & 0xff) * 4) >> 8),4,
           &UNK_M65_small_00000__3217 +
           DAT_600d + ((DAT_70a8 & 0xff) * 0xc + 2 + DAT_70a6 & 0xff) * 4);
  return;
}


// ===== FUN_M65_small_00000__2abc @ M65_small_00000::2abc =====

undefined2 __h3000 FUN_M65_small_00000__2abc(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  
  FUN_M65_small_00000__2cf3();
  uVar1 = (undefined1)((ushort)DAT_7148 >> 8);
  if (DAT_7132 == 0) {
    API_FD3C(uVar1);
  }
  else {
    API_FD3C(uVar1);
    API_FD44();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__2ae3 @ M65_small_00000::2ae3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2ae3(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70b0 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__2be0();
  API_FC80((char)((ushort)DAT_70b0 >> 8),(char)DAT_70b0,param_1,0x43);
  return in_D;
}


// ===== FUN_M65_small_00000__2b07 @ M65_small_00000::2b07 =====

undefined2 __h3000 FUN_M65_small_00000__2b07(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_70b0;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       deglitch:                          " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$2B8A ->$2B63
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__2b8a();
  return in_D;
}


// ===== FUN_M65_small_00000__2b63 @ M65_small_00000::2b63 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2b63(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_70b0 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_1,0x43);
  FUN_eb1d((char)((ushort)DAT_70b0 >> 8),(char)DAT_70b0,param_1,0xb);
  FUN_M65_small_00000__2be0();
  return in_D;
}


// ===== FUN_M65_small_00000__2b8a @ M65_small_00000::2b8a =====

undefined2 __h3000 FUN_M65_small_00000__2b8a(void)

{
  undefined2 in_D;
  
  if (DAT_70b0 == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "lock to channel 1      " */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "channel 1 and channel 2" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M65_small_00000__2be0 @ M65_small_00000::2be0 =====

undefined2 __h3000 FUN_M65_small_00000__2be0(void)

{
  undefined2 in_D;
  
  DAT_70ae = DAT_70b0;
  DAT_70f2 = 0;
  return in_D;
}


// ===== FUN_M65_small_00000__2bf1 @ M65_small_00000::2bf1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M65_small_00000__2bf1(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70aa = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M65_small_00000__2cd5();
  API_FC80((char)((ushort)DAT_70aa >> 8),(char)DAT_70aa,param_1,0x44);
  return in_D;
}


// ===== FUN_M65_small_00000__2c15 @ M65_small_00000::2c15 =====

void __h3000 FUN_M65_small_00000__2c15(void)

{
  DAT_6074 = DAT_70aa;
  FUN_M65_small_00000__0761();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       polyphonic-                   -solo" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$2C92 ->$2C6D
                       $0005 $0005 $0000 */
  SetupParamEditPage();
  FUN_M65_small_00000__2c92();
  return;
}


// ===== FUN_M65_small_00000__2c6d @ M65_small_00000::2c6d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M65_small_00000__2c6d(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_70aa = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_3,0x44);
  FUN_eb1d((char)((ushort)DAT_70aa >> 8),(char)DAT_70aa,param_3,10);
  FUN_M65_small_00000__2cd5();
  FUN_M65_small_00000__2c92();
  return;
}


// ===== FUN_M65_small_00000__2c92 @ M65_small_00000::2c92 =====

undefined2 __h3000 FUN_M65_small_00000__2c92(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                   " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_70aa + -5;
  *(undefined1 *)(in_U + -3) = 5;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  LcdSetCursor((char)((ushort)(*psVar1 + 0x10) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M65_small_00000__2cd5 @ M65_small_00000::2cd5 =====

undefined2 __h3000 FUN_M65_small_00000__2cd5(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_70aa;
  *(char *)(in_U + -1) = (char)DAT_70aa;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEE();
  DAT_7124 = *puVar2;
  DAT_70f2 = 0;
  return in_D;
}


// ===== FUN_M65_small_00000__2cf3 @ M65_small_00000::2cf3 =====

undefined2 __h3000 FUN_M65_small_00000__2cf3(void)

{
  undefined2 uVar1;
  undefined2 *puVar2;
  ushort uVar3;
  short sVar4;
  undefined2 in_D;
  short in_U;
  short *psVar5;
  ushort *puVar6;
  ushort *puVar7;
  
  uVar1 = *(undefined2 *)(&UNK_M65_small_00000__33c7 + DAT_600d + (DAT_70a6 & 0xff) * 2);
  DAT_7116 = uVar1;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0xff;
  psVar5 = (short *)(in_U + -4);
  *(undefined1 *)psVar5 = 0xff;
  API_FCDE();
  uVar1 = DAT_7116;
  DAT_7118 = *psVar5 + -2;
  if (DAT_70a8 == 0) {
    DAT_711e = 0x10;
  }
  else if (DAT_70a8 == 1) {
    DAT_711e = 8;
  }
  else if (DAT_70a8 == 2) {
    DAT_711e = 4;
  }
  else {
    if (DAT_70a8 != 3) {
      DAT_711e = 1;
      goto LAB_M65_small_00000__2d97;
    }
    DAT_711e = 2;
  }
  puVar2 = (undefined2 *)(&UNK_M65_small_00000__343f + DAT_600d + (DAT_70a8 & 0xff) * 10);
  DAT_7108 = *puVar2;
  DAT_710a = puVar2[1];
  DAT_710c = puVar2[2];
  DAT_710e = puVar2[3];
  DAT_7110 = puVar2[4];
LAB_M65_small_00000__2d97:
  DAT_70de = (DAT_70a8 & 0xff) * 0x30;
  DAT_7146 = *(short *)(&UNK_M65_small_00000__3127 +
                       DAT_600d + (0x2e - DAT_70a6 & 0xfffc) + DAT_70de);
  DAT_7144 = *(short *)((short)(&UNK_M65_small_00000__3127 +
                               DAT_600d + (0x2e - DAT_70a6 & 0xfffc) + DAT_70de) + 2);
  DAT_711a = DAT_7118;
  *(char *)((short)psVar5 + 1) = (char)DAT_7116;
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  uVar3 = (ushort)DAT_711e >> 8;
  *(char *)((short)psVar5 + -1) = (char)DAT_711e << 1;
  puVar6 = (ushort *)(psVar5 + -1);
  *(char *)puVar6 = (char)uVar3;
  API_FCF0();
  sVar4 = DAT_705a;
  DAT_70de = puVar6[1];
  *(char *)((short)puVar6 + 3) = (char)DAT_705a;
  *(char *)(puVar6 + 1) = (char)((ushort)sVar4 >> 8);
  *(undefined1 *)((short)puVar6 + 1) = 0x2c;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  sVar4 = DAT_7062;
  DAT_70e0 = *puVar6;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_70e0 <= (ushort)(DAT_7144 - DAT_7146) || DAT_7144 - DAT_7146 < (short)DAT_70e0)) {
    DAT_7122 = (DAT_70de + DAT_70e0) - DAT_7144;
  }
  else {
    DAT_7122 = DAT_70de - DAT_7146;
  }
  *(char *)((short)puVar6 + 1) = (char)DAT_7062;
  *(char *)puVar6 = (char)((ushort)sVar4 >> 8);
  *(undefined1 *)((short)puVar6 + -1) = 0x2c;
  puVar6 = puVar6 + -1;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  DAT_70e0 = *puVar6;
  puVar7 = puVar6 + 1;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_70e0 <= (ushort)(DAT_7144 - DAT_7146) || DAT_7144 - DAT_7146 < (short)DAT_70e0)) {
    DAT_7106 = (DAT_70de + DAT_70e0 + -0x8000) - DAT_7144;
  }
  else {
    DAT_7106 = (DAT_70de + 0x8000) - DAT_7146;
  }
  DAT_70ae = 0xffff;
  if (DAT_7134 == -1) {
    if (DAT_7132 != -1) {
      DAT_7122 = DAT_7106 + -0x8000;
    }
  }
  else {
    DAT_7106 = DAT_7106 + -0x8000;
    *puVar6 = DAT_705a - DAT_7062;
    API_FCC8();
    puVar7 = puVar6 + 1;
    DAT_70ae = 0;
  }
  sVar4 = DAT_7118;
  *(char *)((short)puVar7 + -1) = (char)DAT_7118;
  *(char *)(puVar7 + -1) = (char)((ushort)sVar4 >> 8);
  uVar1 = DAT_711e;
  *(char *)((short)puVar7 + -3) = (char)DAT_711e;
  puVar7 = puVar7 + -2;
  *(char *)puVar7 = (char)((ushort)uVar1 >> 8);
  API_FCF0();
  *(undefined1 *)((short)puVar7 + 1) = 0xff;
  *(undefined1 *)puVar7 = 0xff;
  API_FCDE();
  DAT_70de = *puVar7;
  DAT_70be = DAT_70de + DAT_70ba;
  DAT_70c4 = DAT_70de + DAT_70bc;
  DAT_7148 = DAT_70de;
  *(undefined1 *)((short)puVar7 + 1) = 0xff;
  *(undefined1 *)puVar7 = 0x7f;
  uVar3 = DAT_70de;
  *(char *)((short)puVar7 + -1) = (char)DAT_70de;
  puVar7 = puVar7 + -1;
  *(char *)puVar7 = (char)(uVar3 >> 8);
  API_FCEA();
  DAT_7126 = *puVar7 + 5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7126 >> 8));
  if (DAT_7132 == 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70c4 >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70c4 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70be >> 8));
  }
  DAT_70ae = CONCAT11((byte)((ushort)DAT_70b0 >> 8) & DAT_70ae._0_1_,(byte)DAT_70b0 & DAT_70ae._0_1_
                     );
  DAT_70f2 = 0;
  return in_D;
}


// ===== FUN_M65_small_00000__2f43 @ M65_small_00000::2f43 =====

undefined2 __h3000 FUN_M65_small_00000__2f43(void)

{
  undefined2 uVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined2 in_D;
  short sVar4;
  byte extraout_CC;
  undefined2 *puVar5;
  short *in_U;
  
  DAT_70e0 = *in_U;
  DAT_70e4 = in_U[1];
  puVar2 = (undefined *)((DAT_70e4 + 0x18) * 2 + DAT_600d);
  puVar3 = &DAT_M65_small_00000__2fc1;
  if (DAT_70e0 < 0 || puVar2 <= &UNK_d03e) {
    sVar4 = -DAT_70e0;
  }
  else {
    sVar4 = 100 - DAT_70e0;
    puVar3 = &DAT_M65_small_00000__2fc3;
  }
  puVar5 = (undefined2 *)(puVar2 + (short)puVar3);
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) + DAT_600d;
  uVar1 = *puVar5;
  DAT_70e2 = DAT_70e0;
  *(char *)((short)in_U + 3) = (char)uVar1;
  *(char *)(in_U + 1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M65_small_00000__305b + sVar4);
  *(char *)((short)in_U + 1) = (char)uVar1;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  sVar4 = DAT_70e0;
  if (!(bool)(extraout_CC & 1 & -1 < DAT_70e0)) {
    sVar4 = DAT_70e0 + 100;
  }
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) + DAT_600d;
  uVar1 = puVar5[0x26];
  *(char *)((short)in_U + -1) = (char)uVar1;
  *(char *)(in_U + -1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M65_small_00000__305b + sVar4);
  *(char *)((short)in_U + -3) = (char)uVar1;
  in_U = in_U + -2;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_70de = *in_U;
  *in_U = 0x1000 - DAT_70de;
  return in_D;
}


// ===== MODULE_66_01_entry @ M65_small_00000::34d4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x34ee */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_66_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
                    /* inline[API_FC60]: $34D8 */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  MODULE_65_02_entry();
  Io80A7_Clear();
  API_FC58();
  DspLoadProgram(uVar1,uVar3,0x410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DspLoadProgram(uVar1,uVar3,0x412);
        if ((extraout_CC_02 >> 2 & 1) != 0) {
          DAT_7136 = 0;
          DAT_7132 = 0xffff;
          DAT_7134 = 0xffff;
          DAT_713a = 0xffff;
          _DAT_7138 = 1;
          FUN_M65_small_00000__01a5();
          DAT_7120 = 3000;
          DAT_70ac = 100;
          FUN_M65_small_00000__0f04();
          FUN_M65_small_00000__1126();
          FUN_M65_small_00000__126c();
          FUN_M65_small_00000__1402();
          Io80A7_Set();
          API_FDF6();
          FUN_M65_small_00000__079c();
          FUN_e585();
          FUN_M65_small_00000__02d8();
          API_FD20(0x4e);
          return uVar2;
        }
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_65_01_entry @ M65_small_00000::35d9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x35f3 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_65_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
                    /* inline[API_FC60]: $35DD */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  MODULE_65_02_entry();
  Io80A7_Clear();
  API_FC58();
  DspLoadProgram(uVar1,uVar3,0x410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DspLoadProgram(uVar1,uVar3,0x412);
        if ((extraout_CC_02 >> 2 & 1) != 0) {
          DAT_7134 = 0;
          DAT_7132 = 0xffff;
          DAT_7136 = 0xffff;
          DAT_713a = 0xffff;
          _DAT_7138 = 1;
          DAT_70ac = 100;
          DAT_7120 = 3000;
          FUN_M65_small_00000__01a5();
          FUN_M65_small_00000__0f04();
          FUN_M65_small_00000__1126();
          FUN_M65_small_00000__126c();
          FUN_M65_small_00000__1402();
          Io80A7_Set();
          API_FDF6();
          FUN_M65_small_00000__079c();
          FUN_e585();
          FUN_M65_small_00000__02d8();
          API_FD20(0x4e);
          return uVar2;
        }
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_67_01_entry @ M65_small_00000::36be =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x36d8 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_67_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
                    /* inline[API_FC60]: $36C2 */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  MODULE_65_02_entry();
  Io80A7_Clear();
  API_FC58();
  DspLoadProgram(uVar1,uVar3,0x410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DspLoadProgram(uVar1,uVar3,&BYTE_M65_small_00000__0212);
        if ((extraout_CC_02 >> 2 & 1) != 0) {
          DAT_7132 = 0;
          DAT_7136 = 0xffff;
          DAT_7134 = 0xffff;
          DAT_713a = 0xffff;
          _DAT_7138 = 1;
          DAT_70ac = 100;
          DAT_7120 = FUN_M65_small_00000__05dc;
          FUN_M65_small_00000__01a5();
          FUN_M65_small_00000__1126();
          FUN_M65_small_00000__1402();
          FUN_M65_small_00000__2334();
          FUN_M65_small_00000__2686();
          Io80A7_Set();
          API_FDF6();
          FUN_M65_small_00000__088b();
          FUN_e585();
          FUN_M65_small_00000__0424();
          API_FD20(0x4e);
          return uVar2;
        }
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_68_01_entry @ M65_small_00000::37c3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x37dd */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_68_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
                    /* inline[API_FC60]: $37C7 */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  MODULE_65_02_entry();
  Io80A7_Clear();
  API_FC58();
  DspLoadProgram(uVar1,uVar3,0x810);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x811);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,"left mix");
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DAT_7136 = 0;
        DAT_7132 = 0xffff;
        DAT_7134 = 0xffff;
        DAT_713a = 0xffff;
        _DAT_7138 = 0xffff;
        _DAT_713e = 0xfff6;
        _DAT_7140 = 0xdac;
        FUN_M65_small_00000__01a5();
        FUN_M65_small_00000__0f04();
        FUN_M65_small_00000__1126();
        FUN_M65_small_00000__126c();
        FUN_M65_small_00000__1402();
        FUN_M65_small_00000__1568();
        FUN_M65_small_00000__16b0();
        Io80A7_Set();
        API_FDF6();
        FUN_M65_small_00000__096b();
        FUN_e585();
        FUN_M65_small_00000__04f9();
        API_FD20(0x4e);
        return uVar2;
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


// ===== MODULE_64_01_entry @ M65_small_00000::38e8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3902 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 MODULE_64_01_entry(void)

{
  undefined1 uVar1;
  undefined2 uVar2;
  undefined1 uVar3;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  
                    /* inline[API_FC60]: $38EC */
  uVar2 = ModuleSetBase();
  uVar3 = (undefined1)uVar2;
  uVar1 = (undefined1)((ushort)uVar2 >> 8);
  MODULE_65_02_entry();
  Io80A7_Clear();
  API_FC58();
  DspLoadProgram(uVar1,uVar3,0x410);
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar3,0x411);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar3,0x12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DspLoadProgram(uVar1,uVar3,0x312);
        if ((extraout_CC_02 >> 2 & 1) != 0) {
          DAT_713a = 0;
          DAT_7132 = 0xffff;
          DAT_7136 = 0xffff;
          DAT_7134 = 0xffff;
          _DAT_7138 = 1;
          DAT_70ac = 100;
          DAT_7120 = 3000;
          DAT_711c = 3;
          FUN_M65_small_00000__01a5();
          FUN_M65_small_00000__17d4();
          FUN_M65_small_00000__1a25();
          FUN_M65_small_00000__1b10();
          FUN_M65_small_00000__0d9c();
                    /* inline[API_FC62]: $600F */
          ModuleStorePtr(0x1e);
          FUN_M65_small_00000__1402();
          Io80A7_Set();
          API_FDF6();
          FUN_M65_small_00000__0a76();
          FUN_e58d();
          FUN_M65_small_00000__0a08();
          FUN_M65_small_00000__0608();
          API_FD20(0x4e);
          return uVar2;
        }
      }
    }
  }
  LcdSetCursor();
  LcdPrintInline();
  return uVar2;
}


