// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M75_r4_08000 M75_r4_08000::0000-M75_r4_08000::3fff, 436 functions
// Bank r4_08000 (module id 75, sub 00)

// ===== MODULE_75_01_entry @ M75_r4_08000::0102 =====

undefined2 __h3000 MODULE_75_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $0106 */
  uVar1 = ModuleSetBase();
  FUN_M75_r4_08000__01b1();
  FUN_M75_r4_08000__018e();
  FUN_M75_r4_08000__0192();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  if (DAT_600a != 'u') {
    FUN_M75_r4_08000__0156();
  }
  FUN_M75_r4_08000__02ab();
  FUN_M75_r4_08000__040d();
  if (DAT_600a != 'u') {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M75_r4_08000__07f7();
  API_FE10();
  return uVar1;
}


// ===== FUN_M75_r4_08000__0156 @ M75_r4_08000::0156 =====

undefined2 __h3000 FUN_M75_r4_08000__0156(undefined1 param_1,undefined1 param_2)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 uVar1;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_a2f1();
  API_FDFA();
  DspLoadProgram(extraout_A,1,0x7510);
  uVar1 = extraout_A_00;
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(extraout_A_00,2,0x7511);
    uVar1 = extraout_A_01;
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(extraout_A_01,3,0x7512);
      uVar1 = extraout_A_02;
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        API_FD7C();
        return uStack_8;
      }
    }
  }
  LcdSetCursor(uVar1,0);
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M75_r4_08000__018e @ M75_r4_08000::018e =====

void __h3000
FUN_M75_r4_08000__018e(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x0190. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M75_r4_08000__0192 @ M75_r4_08000::0192 =====

undefined2 __h3000 FUN_M75_r4_08000__0192(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M75_r4_08000__3295();
  FUN_M75_r4_08000__3310();
  FUN_M75_r4_08000__338b();
  FUN_M75_r4_08000__3406();
  FUN_M75_r4_08000__31fb();
  return in_D;
}


// ===== FUN_M75_r4_08000__01b1 @ M75_r4_08000::01b1 =====

undefined2 __h3000 FUN_M75_r4_08000__01b1(void)

{
  undefined2 in_D;
  undefined2 *puVar1;
  short sVar2;
  
  sVar2 = 0x400;
  puVar1 = &DAT_7000;
  do {
    *puVar1 = 0;
    sVar2 = sVar2 + -2;
    puVar1 = puVar1 + 1;
  } while (sVar2 != 0);
                    /* inline[API_FE08]: 41:5E 43:60 45:62 47:64 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 4B:6A 4D:6C 4F:6E 51:70 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 55:76 57:78 59:7A 5B:7C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 5F:82 61:84 63:86 65:88 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 69:8E 6B:90 6D:92 6F:94 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 73:9A 75:9C 77:9E 79:A0 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 7D:A6 7F:A8 81:AA 83:AC */
  LoadParamsScaled();
                    /* inline[API_FE08]: 87:B2 89:B4 8B:B6 8D:B8 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 49:66 53:72 5D:7E 67:8A 71:96 7B:A2 85:AE 8F:BA */
  LoadParamsSigned();
                    /* inline[API_FE04]: 4A:68 54:74 5E:80 68:8C 72:98 7C:A4 86:B0 90:BC */
  LoadParamsSigned();
                    /* inline[API_FE08]: 91:08 93:0E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 95:12 97:18 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 99:26 9B:2C */
  LoadParamsScaled();
                    /* inline[API_FE08]: 9D:1C 9F:22 */
  LoadParamsScaled();
                    /* inline[API_FE08]: A1:30 A3:36 */
  LoadParamsScaled();
                    /* inline[API_FE08]: A5:38 A7:3E */
  LoadParamsScaled();
                    /* inline[API_FE08]: AD:40 */
  LoadParamsScaled();
                    /* inline[API_FE08]: B0:00 AE:06 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 19:46 1A:4C 1B:52 1C:58 */
  LoadParamsSigned();
  return in_D;
}


// ===== FUN_M75_r4_08000__02ab @ M75_r4_08000::02ab =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__02ab(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
                    /* inline[addr:9CDD]: ->$1D5B(rel) */
  DAT_600f = FUN_9cdd();
  API_FD20(0);
  API_FD2E(0);
  API_FD20(0);
  uVar1 = API_FD2E(0);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2843_M75_r4_08000__27d8);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__1359_M75_r4_08000__12ee);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2cbc_M75_r4_08000__2c3e);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__1dca_M75_r4_08000__1d5f);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__216f);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__13da_M75_r4_08000__136f);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__28c4_M75_r4_08000__2859);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2d50_M75_r4_08000__2cd2);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__1e4c_M75_r4_08000__1de1);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__21fa);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__145b_M75_r4_08000__13f0);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2945_M75_r4_08000__28da);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2de4_M75_r4_08000__2d66);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__1ece_M75_r4_08000__1e63);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__2285);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__14dc_M75_r4_08000__1471);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__29c6_M75_r4_08000__295b);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2e78_M75_r4_08000__2dfa);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__1f50_M75_r4_08000__1ee5);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__2310);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__155d_M75_r4_08000__14f2);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2a47_M75_r4_08000__29dc);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2f0c_M75_r4_08000__2e8e);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__1fd2_M75_r4_08000__1f67);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__239b);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__15de_M75_r4_08000__1573);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2ac8_M75_r4_08000__2a5d);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2fa0_M75_r4_08000__2f22);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2054_M75_r4_08000__1fe9);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__2426);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__165f_M75_r4_08000__15f4);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2b49_M75_r4_08000__2ade);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__3034_M75_r4_08000__2fb6);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__20d6_M75_r4_08000__206b);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__24b1);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__16e0_M75_r4_08000__1675);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2bca_M75_r4_08000__2b5f);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__30c8_M75_r4_08000__304a);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M75_r4_08000__2158_M75_r4_08000__20ed);
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,PTR_ARRAY_M75_r4_08000__253c);
  FUN_M75_r4_08000__1c9f();
  FUN_M75_r4_08000__0dcc();
  FUN_M75_r4_08000__0e82();
  FUN_M75_r4_08000__0f35();
  FUN_M75_r4_08000__1043();
  FUN_M75_r4_08000__129e();
  FUN_M75_r4_08000__115d();
  FUN_M75_r4_08000__120c();
  return in_D;
}


// ===== FUN_M75_r4_08000__040d @ M75_r4_08000::040d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M75_r4_08000__040d(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 " delay  " 21 $0D9F $0DAB */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "  freq  " 25 $0E55 $0E61 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "q factor" 29 $0F08 $0F14 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "  pan   " 2D $0FD0 $0FDC */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "fbk dly " 31 $111D $1129 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "feedback" 35 $11DF $11EB */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "  mix   " 3D $31CE $31DA */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M75_r4_08000__04b0;
  _DAT_60f7 = 0x3c;
  DAT_6105 = 1;
  DAT_6106 = 0xb2;
  return in_D;
}


// ===== FUN_M75_r4_08000__0533 @ M75_r4_08000::0533 =====

void __h3000 FUN_M75_r4_08000__0533(void)

{
  FUN_M75_r4_08000__0e2b();
  FUN_M75_r4_08000__07f7();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__053e @ M75_r4_08000::053e =====

void __h3000 FUN_M75_r4_08000__053e(void)

{
  FUN_M75_r4_08000__0ede();
  FUN_M75_r4_08000__07f7();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0549 @ M75_r4_08000::0549 =====

void __h3000 FUN_M75_r4_08000__0549(void)

{
  FUN_M75_r4_08000__31aa();
  FUN_M75_r4_08000__085b();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__0554 @ M75_r4_08000::0554 =====

void __h3000 FUN_M75_r4_08000__0554(void)

{
  FUN_M75_r4_08000__325c();
  FUN_M75_r4_08000__0cde();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__055f @ M75_r4_08000::055f =====

void __h3000 FUN_M75_r4_08000__055f(void)

{
  FUN_M75_r4_08000__32d7();
  FUN_M75_r4_08000__0cde();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__056a @ M75_r4_08000::056a =====

void __h3000 FUN_M75_r4_08000__056a(void)

{
  FUN_M75_r4_08000__3352();
  FUN_M75_r4_08000__0d10();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0575 @ M75_r4_08000::0575 =====

void __h3000 FUN_M75_r4_08000__0575(void)

{
  FUN_M75_r4_08000__33cd();
  FUN_M75_r4_08000__0d10();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__0580 @ M75_r4_08000::0580 =====

void __h3000 FUN_M75_r4_08000__0580(void)

{
  FUN_M75_r4_08000__0fac();
  FUN_M75_r4_08000__07f7();
  API_FE16();
  return;
}


// ===== FUN_M75_r4_08000__058b @ M75_r4_08000::058b =====

void __h3000 FUN_M75_r4_08000__058b(void)

{
  FUN_M75_r4_08000__1320();
  FUN_M75_r4_08000__08ff();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0596 @ M75_r4_08000::0596 =====

void __h3000 FUN_M75_r4_08000__0596(void)

{
  FUN_M75_r4_08000__280a();
  FUN_M75_r4_08000__0a4e();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__05a1 @ M75_r4_08000::05a1 =====

void __h3000 FUN_M75_r4_08000__05a1(void)

{
  FUN_M75_r4_08000__2c70();
  FUN_M75_r4_08000__0b96();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__05ac @ M75_r4_08000::05ac =====

void __h3000 FUN_M75_r4_08000__05ac(void)

{
  FUN_M75_r4_08000__1d91();
  FUN_M75_r4_08000__0c3a();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__05b7 @ M75_r4_08000::05b7 =====

void __h3000 FUN_M75_r4_08000__05b7(void)

{
  FUN_M75_r4_08000__21a1();
  FUN_M75_r4_08000__0af2();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__05c2 @ M75_r4_08000::05c2 =====

void __h3000 FUN_M75_r4_08000__05c2(void)

{
  FUN_M75_r4_08000__1881();
  FUN_M75_r4_08000__09a3();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__05cd @ M75_r4_08000::05cd =====

void __h3000 FUN_M75_r4_08000__05cd(void)

{
  FUN_M75_r4_08000__13a1();
  FUN_M75_r4_08000__08ff();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__05d8 @ M75_r4_08000::05d8 =====

void __h3000 FUN_M75_r4_08000__05d8(void)

{
  FUN_M75_r4_08000__288b();
  FUN_M75_r4_08000__0a4e();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__05e3 @ M75_r4_08000::05e3 =====

void __h3000 FUN_M75_r4_08000__05e3(void)

{
  FUN_M75_r4_08000__2d04();
  FUN_M75_r4_08000__0b96();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__05ee @ M75_r4_08000::05ee =====

void __h3000 FUN_M75_r4_08000__05ee(void)

{
  FUN_M75_r4_08000__1e13();
  FUN_M75_r4_08000__0c3a();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__05f9 @ M75_r4_08000::05f9 =====

void __h3000 FUN_M75_r4_08000__05f9(void)

{
  FUN_M75_r4_08000__222c();
  FUN_M75_r4_08000__0af2();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__0604 @ M75_r4_08000::0604 =====

void __h3000 FUN_M75_r4_08000__0604(void)

{
  FUN_M75_r4_08000__190b();
  FUN_M75_r4_08000__09a3();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__060f @ M75_r4_08000::060f =====

void __h3000 FUN_M75_r4_08000__060f(void)

{
  FUN_M75_r4_08000__1422();
  FUN_M75_r4_08000__08ff();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__061a @ M75_r4_08000::061a =====

void __h3000 FUN_M75_r4_08000__061a(void)

{
  FUN_M75_r4_08000__290c();
  FUN_M75_r4_08000__0a4e();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0625 @ M75_r4_08000::0625 =====

void __h3000 FUN_M75_r4_08000__0625(void)

{
  FUN_M75_r4_08000__2d98();
  FUN_M75_r4_08000__0b96();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0630 @ M75_r4_08000::0630 =====

void __h3000 FUN_M75_r4_08000__0630(void)

{
  FUN_M75_r4_08000__1e95();
  FUN_M75_r4_08000__0c3a();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__063b @ M75_r4_08000::063b =====

void __h3000 FUN_M75_r4_08000__063b(void)

{
  FUN_M75_r4_08000__22b7();
  FUN_M75_r4_08000__0af2();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0646 @ M75_r4_08000::0646 =====

void __h3000 FUN_M75_r4_08000__0646(void)

{
  FUN_M75_r4_08000__1995();
  FUN_M75_r4_08000__09a3();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0651 @ M75_r4_08000::0651 =====

void __h3000 FUN_M75_r4_08000__0651(void)

{
  FUN_M75_r4_08000__14a3();
  FUN_M75_r4_08000__0938();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__065c @ M75_r4_08000::065c =====

void __h3000 FUN_M75_r4_08000__065c(void)

{
  FUN_M75_r4_08000__298d();
  FUN_M75_r4_08000__0a87();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0667 @ M75_r4_08000::0667 =====

void __h3000 FUN_M75_r4_08000__0667(void)

{
  FUN_M75_r4_08000__2e2c();
  FUN_M75_r4_08000__0bcf();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0672 @ M75_r4_08000::0672 =====

void __h3000 FUN_M75_r4_08000__0672(void)

{
  FUN_M75_r4_08000__1f17();
  FUN_M75_r4_08000__0c73();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__067d @ M75_r4_08000::067d =====

void __h3000 FUN_M75_r4_08000__067d(void)

{
  FUN_M75_r4_08000__2342();
  FUN_M75_r4_08000__0b2b();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0688 @ M75_r4_08000::0688 =====

void __h3000 FUN_M75_r4_08000__0688(void)

{
  FUN_M75_r4_08000__1a1f();
  FUN_M75_r4_08000__09dc();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0693 @ M75_r4_08000::0693 =====

void __h3000 FUN_M75_r4_08000__0693(void)

{
  FUN_M75_r4_08000__1524();
  FUN_M75_r4_08000__0938();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__069e @ M75_r4_08000::069e =====

void __h3000 FUN_M75_r4_08000__069e(void)

{
  FUN_M75_r4_08000__2a0e();
  FUN_M75_r4_08000__0a87();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__06a9 @ M75_r4_08000::06a9 =====

void __h3000 FUN_M75_r4_08000__06a9(void)

{
  FUN_M75_r4_08000__2ec0();
  FUN_M75_r4_08000__0bcf();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__06b4 @ M75_r4_08000::06b4 =====

void __h3000 FUN_M75_r4_08000__06b4(void)

{
  FUN_M75_r4_08000__1f99();
  FUN_M75_r4_08000__0c73();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__06bf @ M75_r4_08000::06bf =====

void __h3000 FUN_M75_r4_08000__06bf(void)

{
  FUN_M75_r4_08000__23cd();
  FUN_M75_r4_08000__0b2b();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__06ca @ M75_r4_08000::06ca =====

void __h3000 FUN_M75_r4_08000__06ca(void)

{
  FUN_M75_r4_08000__1aa9();
  FUN_M75_r4_08000__09dc();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__06d5 @ M75_r4_08000::06d5 =====

void __h3000 FUN_M75_r4_08000__06d5(void)

{
  FUN_M75_r4_08000__15a5();
  FUN_M75_r4_08000__0938();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__06e0 @ M75_r4_08000::06e0 =====

void __h3000 FUN_M75_r4_08000__06e0(void)

{
  FUN_M75_r4_08000__2a8f();
  FUN_M75_r4_08000__0a87();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__06eb @ M75_r4_08000::06eb =====

void __h3000 FUN_M75_r4_08000__06eb(void)

{
  FUN_M75_r4_08000__2f54();
  FUN_M75_r4_08000__0bcf();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__06f6 @ M75_r4_08000::06f6 =====

void __h3000 FUN_M75_r4_08000__06f6(void)

{
  FUN_M75_r4_08000__201b();
  FUN_M75_r4_08000__0c73();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0701 @ M75_r4_08000::0701 =====

void __h3000 FUN_M75_r4_08000__0701(void)

{
  FUN_M75_r4_08000__2458();
  FUN_M75_r4_08000__0b2b();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__070c @ M75_r4_08000::070c =====

void __h3000 FUN_M75_r4_08000__070c(void)

{
  FUN_M75_r4_08000__1b33();
  FUN_M75_r4_08000__09dc();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__0717 @ M75_r4_08000::0717 =====

void __h3000 FUN_M75_r4_08000__0717(void)

{
  FUN_M75_r4_08000__1626();
  FUN_M75_r4_08000__0971();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0722 @ M75_r4_08000::0722 =====

void __h3000 FUN_M75_r4_08000__0722(void)

{
  FUN_M75_r4_08000__2b10();
  FUN_M75_r4_08000__0ac0();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__072d @ M75_r4_08000::072d =====

void __h3000 FUN_M75_r4_08000__072d(void)

{
  FUN_M75_r4_08000__2fe8();
  FUN_M75_r4_08000__0c08();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0738 @ M75_r4_08000::0738 =====

void __h3000 FUN_M75_r4_08000__0738(void)

{
  FUN_M75_r4_08000__209d();
  FUN_M75_r4_08000__0cac();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0743 @ M75_r4_08000::0743 =====

void __h3000 FUN_M75_r4_08000__0743(void)

{
  FUN_M75_r4_08000__24e3();
  FUN_M75_r4_08000__0b64();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__074e @ M75_r4_08000::074e =====

void __h3000 FUN_M75_r4_08000__074e(void)

{
  FUN_M75_r4_08000__1bbd();
  FUN_M75_r4_08000__0a15();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__0759 @ M75_r4_08000::0759 =====

void __h3000 FUN_M75_r4_08000__0759(void)

{
  FUN_M75_r4_08000__16a7();
  FUN_M75_r4_08000__0971();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__0764 @ M75_r4_08000::0764 =====

void __h3000 FUN_M75_r4_08000__0764(void)

{
  FUN_M75_r4_08000__2b91();
  FUN_M75_r4_08000__0ac0();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__076f @ M75_r4_08000::076f =====

void __h3000 FUN_M75_r4_08000__076f(void)

{
  FUN_M75_r4_08000__307c();
  FUN_M75_r4_08000__0c08();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__077a @ M75_r4_08000::077a =====

void __h3000 FUN_M75_r4_08000__077a(void)

{
  FUN_M75_r4_08000__211f();
  FUN_M75_r4_08000__0cac();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__0785 @ M75_r4_08000::0785 =====

void __h3000 FUN_M75_r4_08000__0785(void)

{
  FUN_M75_r4_08000__256e();
  FUN_M75_r4_08000__0b64();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__0790 @ M75_r4_08000::0790 =====

void __h3000 FUN_M75_r4_08000__0790(void)

{
  FUN_M75_r4_08000__1c47();
  FUN_M75_r4_08000__0a15();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__079b @ M75_r4_08000::079b =====

void __h3000 FUN_M75_r4_08000__079b(void)

{
  FUN_M75_r4_08000__1265();
  FUN_M75_r4_08000__0a15();
  API_FE14();
  return;
}


// ===== FUN_M75_r4_08000__07a6 @ M75_r4_08000::07a6 =====

void __h3000 FUN_M75_r4_08000__07a6(void)

{
  FUN_M75_r4_08000__10f3();
  FUN_M75_r4_08000__0830();
  API_FE10();
  return;
}


// ===== FUN_M75_r4_08000__07b1 @ M75_r4_08000::07b1 =====

void __h3000 FUN_M75_r4_08000__07b1(void)

{
  FUN_M75_r4_08000__11b5();
  FUN_M75_r4_08000__0830();
  API_FE12();
  return;
}


// ===== FUN_M75_r4_08000__07bc @ M75_r4_08000::07bc =====

void __h3000 FUN_M75_r4_08000__07bc(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M75_r4_08000__07f7 @ M75_r4_08000::07f7 =====

void __h3000 FUN_M75_r4_08000__07f7(void)

{
                    /* inline[API_FE02]: " delay  " "  freq  " "q factor" "  pan   " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0D69 ->$0E1F ->$0ED2 ->$0FB8 ->$0830 ->$0830 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0830 @ M75_r4_08000::0830 =====

void __h3000 FUN_M75_r4_08000__0830(void)

{
                    /* inline[API_FE02]: "fbk dly " "feedback" [*] [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$10E7 ->$11A9 ->$0D42 ->$0D42 ->$085B ->$07F7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__085b @ M75_r4_08000::085b =====

void __h3000 FUN_M75_r4_08000__085b(void)

{
                    /* inline[API_FE02]: " levels " "  mix   " [*] " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0CDE ->$319E ->$0D42 ->$088D ->$07F7 ->$0830 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__088d @ M75_r4_08000::088d =====

void __h3000 FUN_M75_r4_08000__088d(void)

{
                    /* inline[API_FE02]: " freqs  " "q factor" " delays " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$08FF ->$0A4E ->$0B96 ->$085B ->$08C6 ->$08C6 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__08c6 @ M75_r4_08000::08c6 =====

void __h3000 FUN_M75_r4_08000__08c6(void)

{
                    /* inline[API_FE02]: "outputs " "  pans  " " notes  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C3A ->$0AF2 ->$09A3 ->$085B ->$088D ->$088D */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__08ff @ M75_r4_08000::08ff =====

void __h3000 FUN_M75_r4_08000__08ff(void)

{
                    /* inline[API_FE02]: "F1 freq " "F2 freq " "F3 freq " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1314 ->$1395 ->$1416 ->$088D ->$0938 ->$0971 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0938 @ M75_r4_08000::0938 =====

void __h3000 FUN_M75_r4_08000__0938(void)

{
                    /* inline[API_FE02]: "F4 freq " "F5 freq " "F6 freq " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1497 ->$1518 ->$1599 ->$088D ->$0971 ->$08FF */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0971 @ M75_r4_08000::0971 =====

void __h3000 FUN_M75_r4_08000__0971(void)

{
                    /* inline[API_FE02]: "F7 freq " "F8 freq " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$161A ->$169B ->$0D42 ->$088D ->$08FF ->$0938 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__09a3 @ M75_r4_08000::09a3 =====

void __h3000 FUN_M75_r4_08000__09a3(void)

{
                    /* inline[API_FE02]: "F1 note " "F2 note " "F3 note " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1875 ->$18FF ->$1989 ->$08C6 ->$09DC ->$0A15 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__09dc @ M75_r4_08000::09dc =====

void __h3000 FUN_M75_r4_08000__09dc(void)

{
                    /* inline[API_FE02]: "F4 note " "F5 note " "F6 note " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1A13 ->$1A9D ->$1B27 ->$08C6 ->$0A15 ->$09A3 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0a15 @ M75_r4_08000::0a15 =====

void __h3000 FUN_M75_r4_08000__0a15(void)

{
                    /* inline[API_FE02]: "F7 note " "F8 note " "notemode" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1BB1 ->$1C3B ->$1259 ->$08C6 ->$09A3 ->$09DC */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0a4e @ M75_r4_08000::0a4e =====

void __h3000 FUN_M75_r4_08000__0a4e(void)

{
                    /* inline[API_FE02]: "F1 q fac" "F2 q fac" "F3 q fac" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$27FE ->$287F ->$2900 ->$088D ->$0A87 ->$0AC0 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0a87 @ M75_r4_08000::0a87 =====

void __h3000 FUN_M75_r4_08000__0a87(void)

{
                    /* inline[API_FE02]: "F4 q fac" "F5 q fac" "F6 q fac" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2981 ->$2A02 ->$2A83 ->$088D ->$0AC0 ->$0A4E */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0ac0 @ M75_r4_08000::0ac0 =====

void __h3000 FUN_M75_r4_08000__0ac0(void)

{
                    /* inline[API_FE02]: "F7 q fac" "F8 q fac" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2B04 ->$2B85 ->$0D42 ->$088D ->$0A4E ->$0A87 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0af2 @ M75_r4_08000::0af2 =====

void __h3000 FUN_M75_r4_08000__0af2(void)

{
                    /* inline[API_FE02]: "F1 pan  " "F2 pan  " "F3 pan  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2195 ->$2220 ->$22AB ->$08C6 ->$0B2B ->$0B64 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0b2b @ M75_r4_08000::0b2b =====

void __h3000 FUN_M75_r4_08000__0b2b(void)

{
                    /* inline[API_FE02]: "F4 pan  " "F5 pan  " "F6 pan  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2336 ->$23C1 ->$244C ->$08C6 ->$0B64 ->$0AF2 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0b64 @ M75_r4_08000::0b64 =====

void __h3000 FUN_M75_r4_08000__0b64(void)

{
                    /* inline[API_FE02]: "F7 pan  " "F8 pan  " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$24D7 ->$2562 ->$0D42 ->$08C6 ->$0AF2 ->$0B2B */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0b96 @ M75_r4_08000::0b96 =====

void __h3000 FUN_M75_r4_08000__0b96(void)

{
                    /* inline[API_FE02]: "F1 delay" "F2 delay" "F3 delay" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2C64 ->$2CF8 ->$2D8C ->$088D ->$0BCF ->$0C08 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0bcf @ M75_r4_08000::0bcf =====

void __h3000 FUN_M75_r4_08000__0bcf(void)

{
                    /* inline[API_FE02]: "F4 delay" "F5 delay" "F6 delay" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2E20 ->$2EB4 ->$2F48 ->$088D ->$0C08 ->$0B96 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0c08 @ M75_r4_08000::0c08 =====

void __h3000 FUN_M75_r4_08000__0c08(void)

{
                    /* inline[API_FE02]: "F7 delay" "F8 delay" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2FDC ->$3070 ->$0D42 ->$088D ->$0B96 ->$0BCF */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0c3a @ M75_r4_08000::0c3a =====

void __h3000 FUN_M75_r4_08000__0c3a(void)

{
                    /* inline[API_FE02]: "F1 out  " "F2 out  " "F3 out  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1D85 ->$1E07 ->$1E89 ->$08C6 ->$0C73 ->$0CAC */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0c73 @ M75_r4_08000::0c73 =====

void __h3000 FUN_M75_r4_08000__0c73(void)

{
                    /* inline[API_FE02]: "F4 out  " "F5 out  " "F6 out  " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1F0B ->$1F8D ->$200F ->$08C6 ->$0CAC ->$0C3A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0cac @ M75_r4_08000::0cac =====

void __h3000 FUN_M75_r4_08000__0cac(void)

{
                    /* inline[API_FE02]: "F7 out  " "F8 out  " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2091 ->$2113 ->$0D42 ->$08C6 ->$0C3A ->$0C73 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0cde @ M75_r4_08000::0cde =====

void __h3000 FUN_M75_r4_08000__0cde(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3250 ->$32CB ->$0D42 ->$0830 ->$0D10 ->$0D10 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0d10 @ M75_r4_08000::0d10 =====

void __h3000 FUN_M75_r4_08000__0d10(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3346 ->$33C1 ->$0D42 ->$0830 ->$0CDE ->$0CDE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M75_r4_08000__0d42 @ M75_r4_08000::0d42 =====

void __h3000 FUN_M75_r4_08000__0d42(void)

{
  return;
}


// ===== FUN_M75_r4_08000__0d69 @ M75_r4_08000::0d69 =====

void __h3000 FUN_M75_r4_08000__0d69(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0DCC ->$0D8D */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__0dcc_M75_r4_08000__0d43);
  return;
}


// ===== FUN_M75_r4_08000__0d75 @ M75_r4_08000::0d75 =====

void __h3000 FUN_M75_r4_08000__0d75(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0DCC ->$0D8D */
                    /* inline[API_FDBC]: "5.94...C" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__0dcc_M75_r4_08000__0d43);
  return;
}


// ===== FUN_M75_r4_08000__0d81 @ M75_r4_08000::0d81 =====

void __h3000 FUN_M75_r4_08000__0d81(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0DCC ->$0D8D */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__0dcc_M75_r4_08000__0d43);
  return;
}


// ===== FUN_M75_r4_08000__0d8d @ M75_r4_08000::0d8d =====

void __h3000 FUN_M75_r4_08000__0d8d(void)

{
                    /* desc[API_FE6E]: ->$0DCC ->$0D8D */
  API_FE6E();
  DAT_60de = 1;
  return;
}


// ===== FUN_M75_r4_08000__0d9f @ M75_r4_08000::0d9f =====

void __h3000 FUN_M75_r4_08000__0d9f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0DCC ->$0D8D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__0dcc_M75_r4_08000__0d43);
  return;
}


// ===== FUN_M75_r4_08000__0dab @ M75_r4_08000::0dab =====

void __h3000 FUN_M75_r4_08000__0dab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0DCC ->$0D8D $0D81 */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__0dcc_M75_r4_08000__0d43);
  return;
}


// ===== FUN_M75_r4_08000__0dcc @ M75_r4_08000::0dcc =====

undefined2 __h3000 FUN_M75_r4_08000__0dcc(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_7010 = FUN_M75_r4_08000__34a7((char)((ushort)DAT_700c >> 8));
  FUN_M75_r4_08000__2cbc();
  FUN_M75_r4_08000__2d50();
  FUN_M75_r4_08000__2de4();
  FUN_M75_r4_08000__2e78();
  FUN_M75_r4_08000__2f0c();
  FUN_M75_r4_08000__2fa0();
  FUN_M75_r4_08000__3034();
  FUN_M75_r4_08000__30c8();
  return in_D;
}


// ===== FUN_M75_r4_08000__0e1f @ M75_r4_08000::0e1f =====

void __h3000 FUN_M75_r4_08000__0e1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0E82 ->$0E43 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__0e82_M75_r4_08000__0df9);
  return;
}


// ===== FUN_M75_r4_08000__0e2b @ M75_r4_08000::0e2b =====

void __h3000 FUN_M75_r4_08000__0e2b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0E82 ->$0E43 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__0e82_M75_r4_08000__0df9);
  return;
}


// ===== FUN_M75_r4_08000__0e37 @ M75_r4_08000::0e37 =====

void __h3000 FUN_M75_r4_08000__0e37(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0E82 ->$0E43 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__0e82_M75_r4_08000__0df9);
  return;
}


// ===== FUN_M75_r4_08000__0e43 @ M75_r4_08000::0e43 =====

void __h3000 FUN_M75_r4_08000__0e43(void)

{
                    /* desc[API_FE6E]: ->$0E82 ->$0E43 */
  API_FE6E();
  DAT_60de = 1;
  return;
}


// ===== FUN_M75_r4_08000__0e55 @ M75_r4_08000::0e55 =====

void __h3000 FUN_M75_r4_08000__0e55(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0E82 ->$0E43 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__0e82_M75_r4_08000__0df9);
  return;
}


// ===== FUN_M75_r4_08000__0e61 @ M75_r4_08000::0e61 =====

void __h3000 FUN_M75_r4_08000__0e61(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0E82 ->$0E43 $0E37 */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__0e82_M75_r4_08000__0df9);
  return;
}


// ===== FUN_M75_r4_08000__0e82 @ M75_r4_08000::0e82 =====

undefined2 __h3000 FUN_M75_r4_08000__0e82(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_701a = DAT_7016;
  FUN_M75_r4_08000__1359();
  FUN_M75_r4_08000__13da();
  FUN_M75_r4_08000__145b();
  FUN_M75_r4_08000__14dc();
  FUN_M75_r4_08000__155d();
  FUN_M75_r4_08000__15de();
  FUN_M75_r4_08000__165f();
  FUN_M75_r4_08000__16e0();
  return in_D;
}


// ===== FUN_M75_r4_08000__0ed2 @ M75_r4_08000::0ed2 =====

void __h3000 FUN_M75_r4_08000__0ed2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F35 ->$0EF6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__0f35_M75_r4_08000__0eac);
  return;
}


// ===== FUN_M75_r4_08000__0ede @ M75_r4_08000::0ede =====

void __h3000 FUN_M75_r4_08000__0ede(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F35 ->$0EF6 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__0f35_M75_r4_08000__0eac);
  return;
}


// ===== FUN_M75_r4_08000__0eea @ M75_r4_08000::0eea =====

void __h3000 FUN_M75_r4_08000__0eea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F35 ->$0EF6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__0f35_M75_r4_08000__0eac);
  return;
}


// ===== FUN_M75_r4_08000__0ef6 @ M75_r4_08000::0ef6 =====

void __h3000 FUN_M75_r4_08000__0ef6(void)

{
                    /* desc[API_FE6E]: ->$0F35 ->$0EF6 */
  API_FE6E();
  DAT_60de = 1;
  return;
}


// ===== FUN_M75_r4_08000__0f08 @ M75_r4_08000::0f08 =====

void __h3000 FUN_M75_r4_08000__0f08(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F35 ->$0EF6 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__0f35_M75_r4_08000__0eac);
  return;
}


// ===== FUN_M75_r4_08000__0f14 @ M75_r4_08000::0f14 =====

void __h3000 FUN_M75_r4_08000__0f14(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F35 ->$0EF6 $0EEA */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__0f35_M75_r4_08000__0eac);
  return;
}


// ===== FUN_M75_r4_08000__0f35 @ M75_r4_08000::0f35 =====

undefined2 __h3000 FUN_M75_r4_08000__0f35(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_702e = FUN_M75_r4_08000__34a7((char)((ushort)DAT_702a >> 8));
  FUN_M75_r4_08000__2843();
  FUN_M75_r4_08000__28c4();
  FUN_M75_r4_08000__2945();
  FUN_M75_r4_08000__29c6();
  FUN_M75_r4_08000__2a47();
  FUN_M75_r4_08000__2ac8();
  FUN_M75_r4_08000__2b49();
  FUN_M75_r4_08000__2bca();
  return in_D;
}


// ===== FUN_M75_r4_08000__0fac @ M75_r4_08000::0fac =====

void __h3000 FUN_M75_r4_08000__0fac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1043 ->$0FE8 */
                    /* inline[API_FDBC]: "5.94...b" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1043_M75_r4_08000__0f62);
  return;
}


// ===== FUN_M75_r4_08000__0fb8 @ M75_r4_08000::0fb8 =====

void __h3000 FUN_M75_r4_08000__0fb8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1043 ->$0FE8 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1043_M75_r4_08000__0f62);
  return;
}


// ===== FUN_M75_r4_08000__0fc4 @ M75_r4_08000::0fc4 =====

void __h3000 FUN_M75_r4_08000__0fc4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1043 ->$0FE8 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1043_M75_r4_08000__0f62);
  return;
}


// ===== FUN_M75_r4_08000__0fd0 @ M75_r4_08000::0fd0 =====

void __h3000 FUN_M75_r4_08000__0fd0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1043 ->$0FE8 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__1043_M75_r4_08000__0f62);
  return;
}


// ===== FUN_M75_r4_08000__0fdc @ M75_r4_08000::0fdc =====

void __h3000 FUN_M75_r4_08000__0fdc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1043 ->$0FE8 $0FC4 */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__1043_M75_r4_08000__0f62);
  return;
}


// ===== FUN_M75_r4_08000__0fe8 @ M75_r4_08000::0fe8 =====

undefined2 __h3000 FUN_M75_r4_08000__0fe8(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                     " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_7020 + 100;
  *(undefined1 *)(in_U + -3) = 10;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  DAT_717e = *psVar1;
  LcdSetCursor((char)((ushort)(DAT_717e + 0x12) >> 8));
  API_FC2A();
  LcdSetCursor((char)((ushort)(0x26 - DAT_717e) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M75_r4_08000__1043 @ M75_r4_08000::1043 =====

undefined2 __h3000 FUN_M75_r4_08000__1043(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_7020;
  *(char *)(in_U + -1) = (char)DAT_7020;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEC();
  DAT_7024 = *puVar2;
  FUN_M75_r4_08000__1065();
  return in_D;
}


// ===== FUN_M75_r4_08000__1065 @ M75_r4_08000::1065 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x10bf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1065(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x10bf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__10e7 @ M75_r4_08000::10e7 =====

void __h3000 FUN_M75_r4_08000__10e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$115D ->$110B */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__115d_M75_r4_08000__10c1);
  return;
}


// ===== FUN_M75_r4_08000__10f3 @ M75_r4_08000::10f3 =====

void __h3000 FUN_M75_r4_08000__10f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$115D ->$110B */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__115d_M75_r4_08000__10c1);
  return;
}


// ===== FUN_M75_r4_08000__10ff @ M75_r4_08000::10ff =====

void __h3000 FUN_M75_r4_08000__10ff(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$115D ->$110B */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__115d_M75_r4_08000__10c1);
  return;
}


// ===== FUN_M75_r4_08000__110b @ M75_r4_08000::110b =====

void __h3000 FUN_M75_r4_08000__110b(void)

{
                    /* desc[API_FE6E]: ->$115D ->$110B */
  API_FE6E();
  DAT_60de = 1;
  return;
}


// ===== FUN_M75_r4_08000__111d @ M75_r4_08000::111d =====

void __h3000 FUN_M75_r4_08000__111d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$115D ->$110B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__115d_M75_r4_08000__10c1);
  return;
}


// ===== FUN_M75_r4_08000__1129 @ M75_r4_08000::1129 =====

void __h3000 FUN_M75_r4_08000__1129(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$115D ->$110B $10FF */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__115d_M75_r4_08000__10c1);
  return;
}


// ===== FUN_M75_r4_08000__115d @ M75_r4_08000::115d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1181 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__115d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  uVar1 = FUN_M75_r4_08000__34cb((char)((ushort)DAT_7034 >> 8));
  DAT_717e = uVar1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_717e >> 8));
                    /* WARNING: Could not recover jumptable at 0x1181. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__11a9 @ M75_r4_08000::11a9 =====

void __h3000 FUN_M75_r4_08000__11a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$120C ->$11CD */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__120c_M75_r4_08000__1183);
  return;
}


// ===== FUN_M75_r4_08000__11b5 @ M75_r4_08000::11b5 =====

void __h3000 FUN_M75_r4_08000__11b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$120C ->$11CD */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__120c_M75_r4_08000__1183);
  return;
}


// ===== FUN_M75_r4_08000__11c1 @ M75_r4_08000::11c1 =====

void __h3000 FUN_M75_r4_08000__11c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$120C ->$11CD */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__120c_M75_r4_08000__1183);
  return;
}


// ===== FUN_M75_r4_08000__11cd @ M75_r4_08000::11cd =====

void __h3000 FUN_M75_r4_08000__11cd(void)

{
                    /* desc[API_FE6E]: ->$120C ->$11CD */
  API_FE6E();
  DAT_60de = 1;
  return;
}


// ===== FUN_M75_r4_08000__11df @ M75_r4_08000::11df =====

void __h3000 FUN_M75_r4_08000__11df(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$120C ->$11CD */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__120c_M75_r4_08000__1183);
  return;
}


// ===== FUN_M75_r4_08000__11eb @ M75_r4_08000::11eb =====

void __h3000 FUN_M75_r4_08000__11eb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$120C ->$11CD $11C1 */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__120c_M75_r4_08000__1183);
  return;
}


// ===== FUN_M75_r4_08000__120c @ M75_r4_08000::120c =====

undefined2 __h3000 FUN_M75_r4_08000__120c(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_717e = FUN_M75_r4_08000__34a7((char)((ushort)DAT_703c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_717e >> 8));
  return in_D;
}


// ===== FUN_M75_r4_08000__1259 @ M75_r4_08000::1259 =====

void __h3000 FUN_M75_r4_08000__1259(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__1233);
  return;
}


// ===== FUN_M75_r4_08000__1265 @ M75_r4_08000::1265 =====

void __h3000 FUN_M75_r4_08000__1265(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__1233);
  return;
}


// ===== FUN_M75_r4_08000__1271 @ M75_r4_08000::1271 =====

void __h3000 FUN_M75_r4_08000__1271(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__1233);
  return;
}


// ===== FUN_M75_r4_08000__127d @ M75_r4_08000::127d =====

void __h3000 FUN_M75_r4_08000__127d(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__1233);
  return;
}


// ===== FUN_M75_r4_08000__129e @ M75_r4_08000::129e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x12b0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__129e(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_722a = (undefined1)DAT_7044;
  FUN_M75_r4_08000__3610();
                    /* WARNING: Could not recover jumptable at 0x12b0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1314 @ M75_r4_08000::1314 =====

void __h3000 FUN_M75_r4_08000__1314(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1359 ->$1338 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1359_M75_r4_08000__12ee);
  return;
}


// ===== FUN_M75_r4_08000__1320 @ M75_r4_08000::1320 =====

void __h3000 FUN_M75_r4_08000__1320(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1359 ->$1338 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1359_M75_r4_08000__12ee);
  return;
}


// ===== FUN_M75_r4_08000__132c @ M75_r4_08000::132c =====

void __h3000 FUN_M75_r4_08000__132c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1359 ->$1338 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1359_M75_r4_08000__12ee);
  return;
}


// ===== FUN_M75_r4_08000__1338 @ M75_r4_08000::1338 =====

void __h3000 FUN_M75_r4_08000__1338(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1359 ->$1338 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__1359_M75_r4_08000__12ee);
  return;
}


// ===== FUN_M75_r4_08000__1359 @ M75_r4_08000::1359 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x136d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1359(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x136d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1395 @ M75_r4_08000::1395 =====

void __h3000 FUN_M75_r4_08000__1395(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$13DA ->$13B9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__13da_M75_r4_08000__136f);
  return;
}


// ===== FUN_M75_r4_08000__13a1 @ M75_r4_08000::13a1 =====

void __h3000 FUN_M75_r4_08000__13a1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$13DA ->$13B9 */
                    /* inline[API_FDBC]: "5.94...o" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__13da_M75_r4_08000__136f);
  return;
}


// ===== FUN_M75_r4_08000__13ad @ M75_r4_08000::13ad =====

void __h3000 FUN_M75_r4_08000__13ad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$13DA ->$13B9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__13da_M75_r4_08000__136f);
  return;
}


// ===== FUN_M75_r4_08000__13b9 @ M75_r4_08000::13b9 =====

void __h3000 FUN_M75_r4_08000__13b9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$13DA ->$13B9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__13da_M75_r4_08000__136f);
  return;
}


// ===== FUN_M75_r4_08000__13da @ M75_r4_08000::13da =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x13ee */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__13da(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x13ee. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1416 @ M75_r4_08000::1416 =====

void __h3000 FUN_M75_r4_08000__1416(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$145B ->$143A */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__145b_M75_r4_08000__13f0);
  return;
}


// ===== FUN_M75_r4_08000__1422 @ M75_r4_08000::1422 =====

void __h3000 FUN_M75_r4_08000__1422(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$145B ->$143A */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__145b_M75_r4_08000__13f0);
  return;
}


// ===== FUN_M75_r4_08000__142e @ M75_r4_08000::142e =====

void __h3000 FUN_M75_r4_08000__142e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$145B ->$143A */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__145b_M75_r4_08000__13f0);
  return;
}


// ===== FUN_M75_r4_08000__143a @ M75_r4_08000::143a =====

void __h3000 FUN_M75_r4_08000__143a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$145B ->$143A */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__145b_M75_r4_08000__13f0);
  return;
}


// ===== FUN_M75_r4_08000__145b @ M75_r4_08000::145b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x146f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__145b(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x146f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1497 @ M75_r4_08000::1497 =====

void __h3000 FUN_M75_r4_08000__1497(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$14DC ->$14BB */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__14dc_M75_r4_08000__1471);
  return;
}


// ===== FUN_M75_r4_08000__14a3 @ M75_r4_08000::14a3 =====

void __h3000 FUN_M75_r4_08000__14a3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$14DC ->$14BB */
                    /* inline[API_FDBC]: "5.94...q" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__14dc_M75_r4_08000__1471);
  return;
}


// ===== FUN_M75_r4_08000__14af @ M75_r4_08000::14af =====

void __h3000 FUN_M75_r4_08000__14af(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$14DC ->$14BB */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__14dc_M75_r4_08000__1471);
  return;
}


// ===== FUN_M75_r4_08000__14bb @ M75_r4_08000::14bb =====

void __h3000 FUN_M75_r4_08000__14bb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$14DC ->$14BB */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__14dc_M75_r4_08000__1471);
  return;
}


// ===== FUN_M75_r4_08000__14dc @ M75_r4_08000::14dc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x14f0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__14dc(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x14f0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1518 @ M75_r4_08000::1518 =====

void __h3000 FUN_M75_r4_08000__1518(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$155D ->$153C */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__155d_M75_r4_08000__14f2);
  return;
}


// ===== FUN_M75_r4_08000__1524 @ M75_r4_08000::1524 =====

void __h3000 FUN_M75_r4_08000__1524(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$155D ->$153C */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__155d_M75_r4_08000__14f2);
  return;
}


// ===== FUN_M75_r4_08000__1530 @ M75_r4_08000::1530 =====

void __h3000 FUN_M75_r4_08000__1530(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$155D ->$153C */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__155d_M75_r4_08000__14f2);
  return;
}


// ===== FUN_M75_r4_08000__153c @ M75_r4_08000::153c =====

void __h3000 FUN_M75_r4_08000__153c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$155D ->$153C */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__155d_M75_r4_08000__14f2);
  return;
}


// ===== FUN_M75_r4_08000__155d @ M75_r4_08000::155d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1571 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__155d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1571. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1599 @ M75_r4_08000::1599 =====

void __h3000 FUN_M75_r4_08000__1599(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$15DE ->$15BD */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__15de_M75_r4_08000__1573);
  return;
}


// ===== FUN_M75_r4_08000__15a5 @ M75_r4_08000::15a5 =====

void __h3000 FUN_M75_r4_08000__15a5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$15DE ->$15BD */
                    /* inline[API_FDBC]: "5.94...s" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__15de_M75_r4_08000__1573);
  return;
}


// ===== FUN_M75_r4_08000__15b1 @ M75_r4_08000::15b1 =====

void __h3000 FUN_M75_r4_08000__15b1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$15DE ->$15BD */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__15de_M75_r4_08000__1573);
  return;
}


// ===== FUN_M75_r4_08000__15bd @ M75_r4_08000::15bd =====

void __h3000 FUN_M75_r4_08000__15bd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$15DE ->$15BD */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__15de_M75_r4_08000__1573);
  return;
}


// ===== FUN_M75_r4_08000__15de @ M75_r4_08000::15de =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x15f2 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__15de(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x15f2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__161a @ M75_r4_08000::161a =====

void __h3000 FUN_M75_r4_08000__161a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$165F ->$163E */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__165f_M75_r4_08000__15f4);
  return;
}


// ===== FUN_M75_r4_08000__1626 @ M75_r4_08000::1626 =====

void __h3000 FUN_M75_r4_08000__1626(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$165F ->$163E */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__165f_M75_r4_08000__15f4);
  return;
}


// ===== FUN_M75_r4_08000__1632 @ M75_r4_08000::1632 =====

void __h3000 FUN_M75_r4_08000__1632(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$165F ->$163E */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__165f_M75_r4_08000__15f4);
  return;
}


// ===== FUN_M75_r4_08000__163e @ M75_r4_08000::163e =====

void __h3000 FUN_M75_r4_08000__163e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$165F ->$163E */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__165f_M75_r4_08000__15f4);
  return;
}


// ===== FUN_M75_r4_08000__165f @ M75_r4_08000::165f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1673 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__165f(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1673. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__169b @ M75_r4_08000::169b =====

void __h3000 FUN_M75_r4_08000__169b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$16E0 ->$16BF */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__16e0_M75_r4_08000__1675);
  return;
}


// ===== FUN_M75_r4_08000__16a7 @ M75_r4_08000::16a7 =====

void __h3000 FUN_M75_r4_08000__16a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$16E0 ->$16BF */
                    /* inline[API_FDBC]: "5.94...u" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__16e0_M75_r4_08000__1675);
  return;
}


// ===== FUN_M75_r4_08000__16b3 @ M75_r4_08000::16b3 =====

void __h3000 FUN_M75_r4_08000__16b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$16E0 ->$16BF */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__16e0_M75_r4_08000__1675);
  return;
}


// ===== FUN_M75_r4_08000__16bf @ M75_r4_08000::16bf =====

void __h3000 FUN_M75_r4_08000__16bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$16E0 ->$16BF */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__16e0_M75_r4_08000__1675);
  return;
}


// ===== FUN_M75_r4_08000__16e0 @ M75_r4_08000::16e0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x16f4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__16e0(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x16f4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__16f6 @ M75_r4_08000::16f6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x183a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__16f6(short *param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  short sVar1;
  undefined2 uVar2;
  byte bVar3;
  short *psVar4;
  byte *pbVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  psVar4 = param_1;
  sVar1 = FUN_M75_r4_08000__183c
                    ((char)((((short *)*param_1)[5] & 0xffU) * 100 + *(short *)*param_1 >> 8));
  uVar2 = FUN_M75_r4_08000__183c((char)((ushort)(sVar1 + DAT_701a) >> 8));
  bVar3 = (byte)uVar2;
  *(byte *)(param_3 + -1) = bVar3 << 1;
  pbVar5 = (byte *)(param_3 + -2);
  *pbVar5 = (char)((ushort)uVar2 >> 8) << 1 | bVar3 >> 7;
  InterpTableLookup();
  DAT_717e = *(undefined2 *)pbVar5;
  DAT_7180 = psVar4[1];
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_717e >> 8));
                    /* WARNING: Could not recover jumptable at 0x183a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar3,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1708 @ M75_r4_08000::1708 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x183a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000
FUN_M75_r4_08000__1708
          (undefined1 param_1,undefined1 param_2,short param_3,undefined2 param_4,short param_5)

{
  short sVar1;
  undefined2 uVar2;
  byte bVar3;
  byte *pbVar4;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = FUN_M75_r4_08000__183c();
  uVar2 = FUN_M75_r4_08000__183c((char)((ushort)(sVar1 + DAT_701a) >> 8));
  bVar3 = (byte)uVar2;
  *(byte *)(param_5 + -1) = bVar3 << 1;
  pbVar4 = (byte *)(param_5 + -2);
  *pbVar4 = (char)((ushort)uVar2 >> 8) << 1 | bVar3 >> 7;
                    /* inline[API_FE20]: interp table, 129 points */
  InterpTableLookup();
  DAT_717e = *(undefined2 *)pbVar4;
  DAT_7180 = *(undefined2 *)(param_3 + 2);
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_717e >> 8));
                    /* WARNING: Could not recover jumptable at 0x183a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000000 >> 8),bVar3,in_stack_00000002,in_stack_00000004);
  return;
}


// ===== FUN_M75_r4_08000__183c @ M75_r4_08000::183c =====

/* WARNING: Removing unreachable block (RAM,0x184b) */

void __h3000 FUN_M75_r4_08000__183c(void)

{
  return;
}


// ===== FUN_M75_r4_08000__1875 @ M75_r4_08000::1875 =====

void __h3000 FUN_M75_r4_08000__1875(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__18c3_M75_r4_08000__184f);
  return;
}


// ===== FUN_M75_r4_08000__1881 @ M75_r4_08000::1881 =====

void __h3000 FUN_M75_r4_08000__1881(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$18C3 ->$18AE */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__18c3_M75_r4_08000__184f);
  return;
}


// ===== FUN_M75_r4_08000__188d @ M75_r4_08000::188d =====

void __h3000 FUN_M75_r4_08000__188d(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__18c3_M75_r4_08000__184f);
  return;
}


// ===== FUN_M75_r4_08000__18ae @ M75_r4_08000::18ae =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x18c1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__18ae(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_7128 >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x18c1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__18c3 @ M75_r4_08000::18c3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x18d7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__18c3(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x18d7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__18ff @ M75_r4_08000::18ff =====

void __h3000 FUN_M75_r4_08000__18ff(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__194d_M75_r4_08000__18d9);
  return;
}


// ===== FUN_M75_r4_08000__190b @ M75_r4_08000::190b =====

void __h3000 FUN_M75_r4_08000__190b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$194D ->$1938 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__194d_M75_r4_08000__18d9);
  return;
}


// ===== FUN_M75_r4_08000__1917 @ M75_r4_08000::1917 =====

void __h3000 FUN_M75_r4_08000__1917(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__194d_M75_r4_08000__18d9);
  return;
}


// ===== FUN_M75_r4_08000__1938 @ M75_r4_08000::1938 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x194b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1938(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_7134 >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x194b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__194d @ M75_r4_08000::194d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1961 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__194d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1961. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1989 @ M75_r4_08000::1989 =====

void __h3000 FUN_M75_r4_08000__1989(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__19d7_M75_r4_08000__1963);
  return;
}


// ===== FUN_M75_r4_08000__1995 @ M75_r4_08000::1995 =====

void __h3000 FUN_M75_r4_08000__1995(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$19D7 ->$19C2 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__19d7_M75_r4_08000__1963);
  return;
}


// ===== FUN_M75_r4_08000__19a1 @ M75_r4_08000::19a1 =====

void __h3000 FUN_M75_r4_08000__19a1(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__19d7_M75_r4_08000__1963);
  return;
}


// ===== FUN_M75_r4_08000__19c2 @ M75_r4_08000::19c2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x19d5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__19c2(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_7140 >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x19d5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__19d7 @ M75_r4_08000::19d7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x19eb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__19d7(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x19eb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1a13 @ M75_r4_08000::1a13 =====

void __h3000 FUN_M75_r4_08000__1a13(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__1a61_M75_r4_08000__19ed);
  return;
}


// ===== FUN_M75_r4_08000__1a1f @ M75_r4_08000::1a1f =====

void __h3000 FUN_M75_r4_08000__1a1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1A61 ->$1A4C */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__1a61_M75_r4_08000__19ed);
  return;
}


// ===== FUN_M75_r4_08000__1a2b @ M75_r4_08000::1a2b =====

void __h3000 FUN_M75_r4_08000__1a2b(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__1a61_M75_r4_08000__19ed);
  return;
}


// ===== FUN_M75_r4_08000__1a4c @ M75_r4_08000::1a4c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1a5f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1a4c(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_714c >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1a5f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1a61 @ M75_r4_08000::1a61 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1a75 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1a61(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1a75. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1a9d @ M75_r4_08000::1a9d =====

void __h3000 FUN_M75_r4_08000__1a9d(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__1aeb_M75_r4_08000__1a77);
  return;
}


// ===== FUN_M75_r4_08000__1aa9 @ M75_r4_08000::1aa9 =====

void __h3000 FUN_M75_r4_08000__1aa9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1AEB ->$1AD6 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__1aeb_M75_r4_08000__1a77);
  return;
}


// ===== FUN_M75_r4_08000__1ab5 @ M75_r4_08000::1ab5 =====

void __h3000 FUN_M75_r4_08000__1ab5(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__1aeb_M75_r4_08000__1a77);
  return;
}


// ===== FUN_M75_r4_08000__1ad6 @ M75_r4_08000::1ad6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1ae9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1ad6(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_7158 >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1ae9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1aeb @ M75_r4_08000::1aeb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1aff */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1aeb(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1aff. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1b27 @ M75_r4_08000::1b27 =====

void __h3000 FUN_M75_r4_08000__1b27(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__1b75_M75_r4_08000__1b01);
  return;
}


// ===== FUN_M75_r4_08000__1b33 @ M75_r4_08000::1b33 =====

void __h3000 FUN_M75_r4_08000__1b33(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1B75 ->$1B60 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__1b75_M75_r4_08000__1b01);
  return;
}


// ===== FUN_M75_r4_08000__1b3f @ M75_r4_08000::1b3f =====

void __h3000 FUN_M75_r4_08000__1b3f(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__1b75_M75_r4_08000__1b01);
  return;
}


// ===== FUN_M75_r4_08000__1b60 @ M75_r4_08000::1b60 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1b73 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1b60(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_7164 >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1b73. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1b75 @ M75_r4_08000::1b75 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1b89 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1b75(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1b89. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1bb1 @ M75_r4_08000::1bb1 =====

void __h3000 FUN_M75_r4_08000__1bb1(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__1bff_M75_r4_08000__1b8b);
  return;
}


// ===== FUN_M75_r4_08000__1bbd @ M75_r4_08000::1bbd =====

void __h3000 FUN_M75_r4_08000__1bbd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1BFF ->$1BEA */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__1bff_M75_r4_08000__1b8b);
  return;
}


// ===== FUN_M75_r4_08000__1bc9 @ M75_r4_08000::1bc9 =====

void __h3000 FUN_M75_r4_08000__1bc9(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__1bff_M75_r4_08000__1b8b);
  return;
}


// ===== FUN_M75_r4_08000__1bea @ M75_r4_08000::1bea =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1bfd */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1bea(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_7170 >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1bfd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1bff @ M75_r4_08000::1bff =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1c13 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1bff(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1c13. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1c3b @ M75_r4_08000::1c3b =====

void __h3000 FUN_M75_r4_08000__1c3b(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__1c89_M75_r4_08000__1c15);
  return;
}


// ===== FUN_M75_r4_08000__1c47 @ M75_r4_08000::1c47 =====

void __h3000 FUN_M75_r4_08000__1c47(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1C89 ->$1C74 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__1c89_M75_r4_08000__1c15);
  return;
}


// ===== FUN_M75_r4_08000__1c53 @ M75_r4_08000::1c53 =====

void __h3000 FUN_M75_r4_08000__1c53(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__1c89_M75_r4_08000__1c15);
  return;
}


// ===== FUN_M75_r4_08000__1c74 @ M75_r4_08000::1c74 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1c87 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1c74(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE0A((char)((ushort)DAT_717c >> 8));
                    /* inline[API_FC38]: "{2:1E}{3:60AB}" */
  LcdPrintInline();
                    /* WARNING: Could not recover jumptable at 0x1c87. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1c89 @ M75_r4_08000::1c89 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1c9d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1c89(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__16f6((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x1c9d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__1c9f @ M75_r4_08000::1c9f =====

void __h3000
FUN_M75_r4_08000__1c9f(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  undefined1 extraout_A;
  undefined1 extraout_A_00;
  undefined1 extraout_A_01;
  undefined1 extraout_A_02;
  undefined1 extraout_A_03;
  undefined1 extraout_A_04;
  undefined1 extraout_A_05;
  undefined1 extraout_B;
  undefined1 extraout_B_00;
  undefined1 extraout_B_01;
  undefined1 extraout_B_02;
  undefined1 extraout_B_03;
  undefined1 extraout_B_04;
  undefined1 extraout_B_05;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M75_r4_08000__18c3_M75_r4_08000__184f);
  API_FE76(extraout_A,extraout_B,&PTR_FUN_M75_r4_08000__194d_M75_r4_08000__18d9);
  API_FE76(extraout_A_00,extraout_B_00,&PTR_FUN_M75_r4_08000__19d7_M75_r4_08000__1963);
  API_FE76(extraout_A_01,extraout_B_01,&PTR_FUN_M75_r4_08000__1a61_M75_r4_08000__19ed);
  API_FE76(extraout_A_02,extraout_B_02,&PTR_FUN_M75_r4_08000__1aeb_M75_r4_08000__1a77);
  API_FE76(extraout_A_03,extraout_B_03,&PTR_FUN_M75_r4_08000__1b75_M75_r4_08000__1b01);
  API_FE76(extraout_A_04,extraout_B_04,&PTR_FUN_M75_r4_08000__1bff_M75_r4_08000__1b8b);
  API_FE76(extraout_A_05,extraout_B_05,&PTR_FUN_M75_r4_08000__1c89_M75_r4_08000__1c15);
  DAT_721f = (undefined1)DAT_7128;
  DAT_7220 = (undefined1)DAT_7134;
  DAT_7221 = (undefined1)DAT_7140;
  DAT_7222 = (undefined1)DAT_714c;
  DAT_7223 = (undefined1)DAT_7158;
  DAT_7224 = (undefined1)DAT_7164;
  DAT_7225 = (undefined1)DAT_7170;
  DAT_7226 = (undefined1)DAT_717c;
  MODULE_7A_02_entry();
                    /* WARNING: Could not recover jumptable at 0x1d0c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M75_r4_08000__1d0e @ M75_r4_08000::1d0e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1d59 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__1d0e(undefined2 param_1,undefined2 param_2)

{
  byte bVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7068 = (ushort)DAT_721f;
  FUN_M75_r4_08000__18c3();
  DAT_7074 = (ushort)DAT_7220;
  FUN_M75_r4_08000__194d();
  DAT_7080 = (ushort)DAT_7221;
  FUN_M75_r4_08000__19d7();
  DAT_708c = (ushort)DAT_7222;
  FUN_M75_r4_08000__1a61();
  DAT_7098 = (ushort)DAT_7223;
  FUN_M75_r4_08000__1aeb();
  DAT_70a4 = (ushort)DAT_7224;
  FUN_M75_r4_08000__1b75();
  DAT_70b0 = (ushort)DAT_7225;
  FUN_M75_r4_08000__1bff();
  bVar1 = DAT_7226;
  DAT_70bc = (ushort)DAT_7226;
  FUN_M75_r4_08000__1c89();
                    /* WARNING: Could not recover jumptable at 0x1d59. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),bVar1,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__1d5b @ M75_r4_08000::1d5b =====

void __h3000 FUN_M75_r4_08000__1d5b(void)

{
  FUN_M75_r4_08000__3663();
  return;
}


// ===== FUN_M75_r4_08000__1d85 @ M75_r4_08000::1d85 =====

void __h3000 FUN_M75_r4_08000__1d85(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1DCA ->$1DA9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1dca_M75_r4_08000__1d5f);
  return;
}


// ===== FUN_M75_r4_08000__1d91 @ M75_r4_08000::1d91 =====

void __h3000 FUN_M75_r4_08000__1d91(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1DCA ->$1DA9 */
                    /* inline[API_FDBC]: "5.94..._" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1dca_M75_r4_08000__1d5f);
  return;
}


// ===== FUN_M75_r4_08000__1d9d @ M75_r4_08000::1d9d =====

void __h3000 FUN_M75_r4_08000__1d9d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1DCA ->$1DA9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1dca_M75_r4_08000__1d5f);
  return;
}


// ===== FUN_M75_r4_08000__1da9 @ M75_r4_08000::1da9 =====

void __h3000 FUN_M75_r4_08000__1da9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1DCA ->$1DA9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__1dca_M75_r4_08000__1d5f);
  return;
}


// ===== FUN_M75_r4_08000__1dca @ M75_r4_08000::1dca =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__1dca(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__1e07 @ M75_r4_08000::1e07 =====

void __h3000 FUN_M75_r4_08000__1e07(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1E4C ->$1E2B */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1e4c_M75_r4_08000__1de1);
  return;
}


// ===== FUN_M75_r4_08000__1e13 @ M75_r4_08000::1e13 =====

void __h3000 FUN_M75_r4_08000__1e13(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1E4C ->$1E2B */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1e4c_M75_r4_08000__1de1);
  return;
}


// ===== FUN_M75_r4_08000__1e1f @ M75_r4_08000::1e1f =====

void __h3000 FUN_M75_r4_08000__1e1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1E4C ->$1E2B */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1e4c_M75_r4_08000__1de1);
  return;
}


// ===== FUN_M75_r4_08000__1e2b @ M75_r4_08000::1e2b =====

void __h3000 FUN_M75_r4_08000__1e2b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1E4C ->$1E2B */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__1e4c_M75_r4_08000__1de1);
  return;
}


// ===== FUN_M75_r4_08000__1e4c @ M75_r4_08000::1e4c =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__1e4c(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__1e89 @ M75_r4_08000::1e89 =====

void __h3000 FUN_M75_r4_08000__1e89(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1ECE ->$1EAD */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1ece_M75_r4_08000__1e63);
  return;
}


// ===== FUN_M75_r4_08000__1e95 @ M75_r4_08000::1e95 =====

void __h3000 FUN_M75_r4_08000__1e95(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1ECE ->$1EAD */
                    /* inline[API_FDBC]: "5.94...c" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1ece_M75_r4_08000__1e63);
  return;
}


// ===== FUN_M75_r4_08000__1ea1 @ M75_r4_08000::1ea1 =====

void __h3000 FUN_M75_r4_08000__1ea1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1ECE ->$1EAD */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1ece_M75_r4_08000__1e63);
  return;
}


// ===== FUN_M75_r4_08000__1ead @ M75_r4_08000::1ead =====

void __h3000 FUN_M75_r4_08000__1ead(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1ECE ->$1EAD */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__1ece_M75_r4_08000__1e63);
  return;
}


// ===== FUN_M75_r4_08000__1ece @ M75_r4_08000::1ece =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__1ece(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__1f0b @ M75_r4_08000::1f0b =====

void __h3000 FUN_M75_r4_08000__1f0b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1F50 ->$1F2F */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1f50_M75_r4_08000__1ee5);
  return;
}


// ===== FUN_M75_r4_08000__1f17 @ M75_r4_08000::1f17 =====

void __h3000 FUN_M75_r4_08000__1f17(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1F50 ->$1F2F */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1f50_M75_r4_08000__1ee5);
  return;
}


// ===== FUN_M75_r4_08000__1f23 @ M75_r4_08000::1f23 =====

void __h3000 FUN_M75_r4_08000__1f23(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1F50 ->$1F2F */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1f50_M75_r4_08000__1ee5);
  return;
}


// ===== FUN_M75_r4_08000__1f2f @ M75_r4_08000::1f2f =====

void __h3000 FUN_M75_r4_08000__1f2f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1F50 ->$1F2F */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__1f50_M75_r4_08000__1ee5);
  return;
}


// ===== FUN_M75_r4_08000__1f50 @ M75_r4_08000::1f50 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__1f50(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__1f8d @ M75_r4_08000::1f8d =====

void __h3000 FUN_M75_r4_08000__1f8d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1FD2 ->$1FB1 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__1fd2_M75_r4_08000__1f67);
  return;
}


// ===== FUN_M75_r4_08000__1f99 @ M75_r4_08000::1f99 =====

void __h3000 FUN_M75_r4_08000__1f99(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1FD2 ->$1FB1 */
                    /* inline[API_FDBC]: "5.94...g" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__1fd2_M75_r4_08000__1f67);
  return;
}


// ===== FUN_M75_r4_08000__1fa5 @ M75_r4_08000::1fa5 =====

void __h3000 FUN_M75_r4_08000__1fa5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1FD2 ->$1FB1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__1fd2_M75_r4_08000__1f67);
  return;
}


// ===== FUN_M75_r4_08000__1fb1 @ M75_r4_08000::1fb1 =====

void __h3000 FUN_M75_r4_08000__1fb1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1FD2 ->$1FB1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__1fd2_M75_r4_08000__1f67);
  return;
}


// ===== FUN_M75_r4_08000__1fd2 @ M75_r4_08000::1fd2 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__1fd2(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__200f @ M75_r4_08000::200f =====

void __h3000 FUN_M75_r4_08000__200f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2054 ->$2033 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2054_M75_r4_08000__1fe9);
  return;
}


// ===== FUN_M75_r4_08000__201b @ M75_r4_08000::201b =====

void __h3000 FUN_M75_r4_08000__201b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2054 ->$2033 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2054_M75_r4_08000__1fe9);
  return;
}


// ===== FUN_M75_r4_08000__2027 @ M75_r4_08000::2027 =====

void __h3000 FUN_M75_r4_08000__2027(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2054 ->$2033 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2054_M75_r4_08000__1fe9);
  return;
}


// ===== FUN_M75_r4_08000__2033 @ M75_r4_08000::2033 =====

void __h3000 FUN_M75_r4_08000__2033(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2054 ->$2033 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2054_M75_r4_08000__1fe9);
  return;
}


// ===== FUN_M75_r4_08000__2054 @ M75_r4_08000::2054 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__2054(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__2091 @ M75_r4_08000::2091 =====

void __h3000 FUN_M75_r4_08000__2091(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$20D6 ->$20B5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__20d6_M75_r4_08000__206b);
  return;
}


// ===== FUN_M75_r4_08000__209d @ M75_r4_08000::209d =====

void __h3000 FUN_M75_r4_08000__209d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$20D6 ->$20B5 */
                    /* inline[API_FDBC]: "5.94.. k" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__20d6_M75_r4_08000__206b);
  return;
}


// ===== FUN_M75_r4_08000__20a9 @ M75_r4_08000::20a9 =====

void __h3000 FUN_M75_r4_08000__20a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$20D6 ->$20B5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__20d6_M75_r4_08000__206b);
  return;
}


// ===== FUN_M75_r4_08000__20b5 @ M75_r4_08000::20b5 =====

void __h3000 FUN_M75_r4_08000__20b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$20D6 ->$20B5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__20d6_M75_r4_08000__206b);
  return;
}


// ===== FUN_M75_r4_08000__20d6 @ M75_r4_08000::20d6 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__20d6(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__2113 @ M75_r4_08000::2113 =====

void __h3000 FUN_M75_r4_08000__2113(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2158 ->$2137 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2158_M75_r4_08000__20ed);
  return;
}


// ===== FUN_M75_r4_08000__211f @ M75_r4_08000::211f =====

void __h3000 FUN_M75_r4_08000__211f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2158 ->$2137 */
                    /* inline[API_FDBC]: "5.94.. ." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2158_M75_r4_08000__20ed);
  return;
}


// ===== FUN_M75_r4_08000__212b @ M75_r4_08000::212b =====

void __h3000 FUN_M75_r4_08000__212b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2158 ->$2137 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2158_M75_r4_08000__20ed);
  return;
}


// ===== FUN_M75_r4_08000__2137 @ M75_r4_08000::2137 =====

void __h3000 FUN_M75_r4_08000__2137(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2158 ->$2137 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2158_M75_r4_08000__20ed);
  return;
}


// ===== FUN_M75_r4_08000__2158 @ M75_r4_08000::2158 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M75_r4_08000__2158(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
  return in_D;
}


// ===== FUN_M75_r4_08000__2195 @ M75_r4_08000::2195 =====

void __h3000 FUN_M75_r4_08000__2195(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__216f);
  return;
}


// ===== FUN_M75_r4_08000__21a1 @ M75_r4_08000::21a1 =====

void __h3000 FUN_M75_r4_08000__21a1(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__216f);
  return;
}


// ===== FUN_M75_r4_08000__21ad @ M75_r4_08000::21ad =====

void __h3000 FUN_M75_r4_08000__21ad(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__216f);
  return;
}


// ===== FUN_M75_r4_08000__21b9 @ M75_r4_08000::21b9 =====

void __h3000 FUN_M75_r4_08000__21b9(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__216f);
  return;
}


// ===== FUN_M75_r4_08000__21e4 @ M75_r4_08000::21e4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x21f8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__21e4(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x21f8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2220 @ M75_r4_08000::2220 =====

void __h3000 FUN_M75_r4_08000__2220(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__21fa);
  return;
}


// ===== FUN_M75_r4_08000__222c @ M75_r4_08000::222c =====

void __h3000 FUN_M75_r4_08000__222c(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__21fa);
  return;
}


// ===== FUN_M75_r4_08000__2238 @ M75_r4_08000::2238 =====

void __h3000 FUN_M75_r4_08000__2238(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__21fa);
  return;
}


// ===== FUN_M75_r4_08000__2244 @ M75_r4_08000::2244 =====

void __h3000 FUN_M75_r4_08000__2244(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__21fa);
  return;
}


// ===== FUN_M75_r4_08000__226f @ M75_r4_08000::226f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2283 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__226f(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2283. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__22ab @ M75_r4_08000::22ab =====

void __h3000 FUN_M75_r4_08000__22ab(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__2285);
  return;
}


// ===== FUN_M75_r4_08000__22b7 @ M75_r4_08000::22b7 =====

void __h3000 FUN_M75_r4_08000__22b7(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__2285);
  return;
}


// ===== FUN_M75_r4_08000__22c3 @ M75_r4_08000::22c3 =====

void __h3000 FUN_M75_r4_08000__22c3(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__2285);
  return;
}


// ===== FUN_M75_r4_08000__22cf @ M75_r4_08000::22cf =====

void __h3000 FUN_M75_r4_08000__22cf(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__2285);
  return;
}


// ===== FUN_M75_r4_08000__22fa @ M75_r4_08000::22fa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x230e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__22fa(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x230e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2336 @ M75_r4_08000::2336 =====

void __h3000 FUN_M75_r4_08000__2336(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__2310);
  return;
}


// ===== FUN_M75_r4_08000__2342 @ M75_r4_08000::2342 =====

void __h3000 FUN_M75_r4_08000__2342(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__2310);
  return;
}


// ===== FUN_M75_r4_08000__234e @ M75_r4_08000::234e =====

void __h3000 FUN_M75_r4_08000__234e(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__2310);
  return;
}


// ===== FUN_M75_r4_08000__235a @ M75_r4_08000::235a =====

void __h3000 FUN_M75_r4_08000__235a(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__2310);
  return;
}


// ===== FUN_M75_r4_08000__2385 @ M75_r4_08000::2385 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2399 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2385(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2399. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__23c1 @ M75_r4_08000::23c1 =====

void __h3000 FUN_M75_r4_08000__23c1(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__239b);
  return;
}


// ===== FUN_M75_r4_08000__23cd @ M75_r4_08000::23cd =====

void __h3000 FUN_M75_r4_08000__23cd(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__239b);
  return;
}


// ===== FUN_M75_r4_08000__23d9 @ M75_r4_08000::23d9 =====

void __h3000 FUN_M75_r4_08000__23d9(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__239b);
  return;
}


// ===== FUN_M75_r4_08000__23e5 @ M75_r4_08000::23e5 =====

void __h3000 FUN_M75_r4_08000__23e5(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__239b);
  return;
}


// ===== FUN_M75_r4_08000__2410 @ M75_r4_08000::2410 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2424 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2410(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2424. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__244c @ M75_r4_08000::244c =====

void __h3000 FUN_M75_r4_08000__244c(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__2426);
  return;
}


// ===== FUN_M75_r4_08000__2458 @ M75_r4_08000::2458 =====

void __h3000 FUN_M75_r4_08000__2458(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__2426);
  return;
}


// ===== FUN_M75_r4_08000__2464 @ M75_r4_08000::2464 =====

void __h3000 FUN_M75_r4_08000__2464(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__2426);
  return;
}


// ===== FUN_M75_r4_08000__2470 @ M75_r4_08000::2470 =====

void __h3000 FUN_M75_r4_08000__2470(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__2426);
  return;
}


// ===== FUN_M75_r4_08000__249b @ M75_r4_08000::249b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x24af */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__249b(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x24af. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__24d7 @ M75_r4_08000::24d7 =====

void __h3000 FUN_M75_r4_08000__24d7(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__24b1);
  return;
}


// ===== FUN_M75_r4_08000__24e3 @ M75_r4_08000::24e3 =====

void __h3000 FUN_M75_r4_08000__24e3(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__24b1);
  return;
}


// ===== FUN_M75_r4_08000__24ef @ M75_r4_08000::24ef =====

void __h3000 FUN_M75_r4_08000__24ef(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__24b1);
  return;
}


// ===== FUN_M75_r4_08000__24fb @ M75_r4_08000::24fb =====

void __h3000 FUN_M75_r4_08000__24fb(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__24b1);
  return;
}


// ===== FUN_M75_r4_08000__2526 @ M75_r4_08000::2526 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x253a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2526(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x253a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2562 @ M75_r4_08000::2562 =====

void __h3000 FUN_M75_r4_08000__2562(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M75_r4_08000__253c);
  return;
}


// ===== FUN_M75_r4_08000__256e @ M75_r4_08000::256e =====

void __h3000 FUN_M75_r4_08000__256e(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M75_r4_08000__253c);
  return;
}


// ===== FUN_M75_r4_08000__257a @ M75_r4_08000::257a =====

void __h3000 FUN_M75_r4_08000__257a(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M75_r4_08000__253c);
  return;
}


// ===== FUN_M75_r4_08000__2586 @ M75_r4_08000::2586 =====

void __h3000 FUN_M75_r4_08000__2586(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M75_r4_08000__253c);
  return;
}


// ===== FUN_M75_r4_08000__25b1 @ M75_r4_08000::25b1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x25c5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__25b1(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__3416((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x25c5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__27fe @ M75_r4_08000::27fe =====

void __h3000 FUN_M75_r4_08000__27fe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2843 ->$2822 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2843_M75_r4_08000__27d8);
  return;
}


// ===== FUN_M75_r4_08000__280a @ M75_r4_08000::280a =====

void __h3000 FUN_M75_r4_08000__280a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2843 ->$2822 */
                    /* inline[API_FDBC]: "5.94..'." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2843_M75_r4_08000__27d8);
  return;
}


// ===== FUN_M75_r4_08000__2816 @ M75_r4_08000::2816 =====

void __h3000 FUN_M75_r4_08000__2816(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2843 ->$2822 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2843_M75_r4_08000__27d8);
  return;
}


// ===== FUN_M75_r4_08000__2822 @ M75_r4_08000::2822 =====

void __h3000 FUN_M75_r4_08000__2822(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2843 ->$2822 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2843_M75_r4_08000__27d8);
  return;
}


// ===== FUN_M75_r4_08000__2843 @ M75_r4_08000::2843 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2857 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2843(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2857. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__287f @ M75_r4_08000::287f =====

void __h3000 FUN_M75_r4_08000__287f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$28C4 ->$28A3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__28c4_M75_r4_08000__2859);
  return;
}


// ===== FUN_M75_r4_08000__288b @ M75_r4_08000::288b =====

void __h3000 FUN_M75_r4_08000__288b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$28C4 ->$28A3 */
                    /* inline[API_FDBC]: "5.94..(Y" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__28c4_M75_r4_08000__2859);
  return;
}


// ===== FUN_M75_r4_08000__2897 @ M75_r4_08000::2897 =====

void __h3000 FUN_M75_r4_08000__2897(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$28C4 ->$28A3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__28c4_M75_r4_08000__2859);
  return;
}


// ===== FUN_M75_r4_08000__28a3 @ M75_r4_08000::28a3 =====

void __h3000 FUN_M75_r4_08000__28a3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$28C4 ->$28A3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__28c4_M75_r4_08000__2859);
  return;
}


// ===== FUN_M75_r4_08000__28c4 @ M75_r4_08000::28c4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x28d8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__28c4(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x28d8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2900 @ M75_r4_08000::2900 =====

void __h3000 FUN_M75_r4_08000__2900(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2945 ->$2924 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2945_M75_r4_08000__28da);
  return;
}


// ===== FUN_M75_r4_08000__290c @ M75_r4_08000::290c =====

void __h3000 FUN_M75_r4_08000__290c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2945 ->$2924 */
                    /* inline[API_FDBC]: "5.94..(." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2945_M75_r4_08000__28da);
  return;
}


// ===== FUN_M75_r4_08000__2918 @ M75_r4_08000::2918 =====

void __h3000 FUN_M75_r4_08000__2918(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2945 ->$2924 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2945_M75_r4_08000__28da);
  return;
}


// ===== FUN_M75_r4_08000__2924 @ M75_r4_08000::2924 =====

void __h3000 FUN_M75_r4_08000__2924(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2945 ->$2924 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2945_M75_r4_08000__28da);
  return;
}


// ===== FUN_M75_r4_08000__2945 @ M75_r4_08000::2945 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2959 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2945(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2959. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2981 @ M75_r4_08000::2981 =====

void __h3000 FUN_M75_r4_08000__2981(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$29C6 ->$29A5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__29c6_M75_r4_08000__295b);
  return;
}


// ===== FUN_M75_r4_08000__298d @ M75_r4_08000::298d =====

void __h3000 FUN_M75_r4_08000__298d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$29C6 ->$29A5 */
                    /* inline[API_FDBC]: "5.94..)[" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__29c6_M75_r4_08000__295b);
  return;
}


// ===== FUN_M75_r4_08000__2999 @ M75_r4_08000::2999 =====

void __h3000 FUN_M75_r4_08000__2999(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$29C6 ->$29A5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__29c6_M75_r4_08000__295b);
  return;
}


// ===== FUN_M75_r4_08000__29a5 @ M75_r4_08000::29a5 =====

void __h3000 FUN_M75_r4_08000__29a5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$29C6 ->$29A5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__29c6_M75_r4_08000__295b);
  return;
}


// ===== FUN_M75_r4_08000__29c6 @ M75_r4_08000::29c6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x29da */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__29c6(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x29da. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2a02 @ M75_r4_08000::2a02 =====

void __h3000 FUN_M75_r4_08000__2a02(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2A47 ->$2A26 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2a47_M75_r4_08000__29dc);
  return;
}


// ===== FUN_M75_r4_08000__2a0e @ M75_r4_08000::2a0e =====

void __h3000 FUN_M75_r4_08000__2a0e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2A47 ->$2A26 */
                    /* inline[API_FDBC]: "5.94..)." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2a47_M75_r4_08000__29dc);
  return;
}


// ===== FUN_M75_r4_08000__2a1a @ M75_r4_08000::2a1a =====

void __h3000 FUN_M75_r4_08000__2a1a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2A47 ->$2A26 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2a47_M75_r4_08000__29dc);
  return;
}


// ===== FUN_M75_r4_08000__2a26 @ M75_r4_08000::2a26 =====

void __h3000 FUN_M75_r4_08000__2a26(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2A47 ->$2A26 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2a47_M75_r4_08000__29dc);
  return;
}


// ===== FUN_M75_r4_08000__2a47 @ M75_r4_08000::2a47 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2a5b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2a47(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2a5b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2a83 @ M75_r4_08000::2a83 =====

void __h3000 FUN_M75_r4_08000__2a83(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2AC8 ->$2AA7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2ac8_M75_r4_08000__2a5d);
  return;
}


// ===== FUN_M75_r4_08000__2a8f @ M75_r4_08000::2a8f =====

void __h3000 FUN_M75_r4_08000__2a8f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2AC8 ->$2AA7 */
                    /* inline[API_FDBC]: "5.94..*]" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2ac8_M75_r4_08000__2a5d);
  return;
}


// ===== FUN_M75_r4_08000__2a9b @ M75_r4_08000::2a9b =====

void __h3000 FUN_M75_r4_08000__2a9b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2AC8 ->$2AA7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2ac8_M75_r4_08000__2a5d);
  return;
}


// ===== FUN_M75_r4_08000__2aa7 @ M75_r4_08000::2aa7 =====

void __h3000 FUN_M75_r4_08000__2aa7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2AC8 ->$2AA7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2ac8_M75_r4_08000__2a5d);
  return;
}


// ===== FUN_M75_r4_08000__2ac8 @ M75_r4_08000::2ac8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2adc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2ac8(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2adc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2b04 @ M75_r4_08000::2b04 =====

void __h3000 FUN_M75_r4_08000__2b04(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2B49 ->$2B28 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2b49_M75_r4_08000__2ade);
  return;
}


// ===== FUN_M75_r4_08000__2b10 @ M75_r4_08000::2b10 =====

void __h3000 FUN_M75_r4_08000__2b10(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2B49 ->$2B28 */
                    /* inline[API_FDBC]: "5.94..*." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2b49_M75_r4_08000__2ade);
  return;
}


// ===== FUN_M75_r4_08000__2b1c @ M75_r4_08000::2b1c =====

void __h3000 FUN_M75_r4_08000__2b1c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2B49 ->$2B28 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2b49_M75_r4_08000__2ade);
  return;
}


// ===== FUN_M75_r4_08000__2b28 @ M75_r4_08000::2b28 =====

void __h3000 FUN_M75_r4_08000__2b28(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2B49 ->$2B28 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2b49_M75_r4_08000__2ade);
  return;
}


// ===== FUN_M75_r4_08000__2b49 @ M75_r4_08000::2b49 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2b5d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2b49(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2b5d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2b85 @ M75_r4_08000::2b85 =====

void __h3000 FUN_M75_r4_08000__2b85(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2BCA ->$2BA9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2bca_M75_r4_08000__2b5f);
  return;
}


// ===== FUN_M75_r4_08000__2b91 @ M75_r4_08000::2b91 =====

void __h3000 FUN_M75_r4_08000__2b91(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2BCA ->$2BA9 */
                    /* inline[API_FDBC]: "5.94..+_" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2bca_M75_r4_08000__2b5f);
  return;
}


// ===== FUN_M75_r4_08000__2b9d @ M75_r4_08000::2b9d =====

void __h3000 FUN_M75_r4_08000__2b9d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2BCA ->$2BA9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2bca_M75_r4_08000__2b5f);
  return;
}


// ===== FUN_M75_r4_08000__2ba9 @ M75_r4_08000::2ba9 =====

void __h3000 FUN_M75_r4_08000__2ba9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2BCA ->$2BA9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2bca_M75_r4_08000__2b5f);
  return;
}


// ===== FUN_M75_r4_08000__2bca @ M75_r4_08000::2bca =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2bde */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2bca(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__2be0((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2bde. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2be0 @ M75_r4_08000::2be0 =====

undefined2 __h3000 FUN_M75_r4_08000__2be0(short *param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  short sVar2;
  undefined2 in_D;
  short *psVar3;
  
  uVar1 = *(undefined2 *)(*param_1 + 2);
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_702e;
  *(char *)(param_3 + -3) = (char)DAT_702e;
  psVar3 = (short *)(param_3 + -4);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7180 = *psVar3;
  *(undefined1 *)((short)psVar3 + -1) = 0x20;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0;
  API_FCEE();
  sVar2 = DAT_7180;
  DAT_717e = *psVar3;
  *(char *)((short)psVar3 + 1) = (char)DAT_7180;
  *(char *)psVar3 = (char)((ushort)sVar2 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x2c;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0x62;
  API_FCF2();
  DAT_717e = *psVar3 + DAT_717e + -0x7fff;
  DAT_7180 = param_1[2];
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_717e >> 8));
  return in_D;
}


// ===== FUN_M75_r4_08000__2c64 @ M75_r4_08000::2c64 =====

void __h3000 FUN_M75_r4_08000__2c64(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2CBC ->$2C88 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2cbc_M75_r4_08000__2c3e);
  return;
}


// ===== FUN_M75_r4_08000__2c70 @ M75_r4_08000::2c70 =====

void __h3000 FUN_M75_r4_08000__2c70(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2CBC ->$2C88 */
                    /* inline[API_FDBC]: "5.94..,>" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2cbc_M75_r4_08000__2c3e);
  return;
}


// ===== FUN_M75_r4_08000__2c7c @ M75_r4_08000::2c7c =====

void __h3000 FUN_M75_r4_08000__2c7c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2CBC ->$2C88 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2cbc_M75_r4_08000__2c3e);
  return;
}


// ===== FUN_M75_r4_08000__2c88 @ M75_r4_08000::2c88 =====

void __h3000 FUN_M75_r4_08000__2c88(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2CBC ->$2C88 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2cbc_M75_r4_08000__2c3e);
  return;
}


// ===== FUN_M75_r4_08000__2cbc @ M75_r4_08000::2cbc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2cd0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2cbc(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3118(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2cd0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2cf8 @ M75_r4_08000::2cf8 =====

void __h3000 FUN_M75_r4_08000__2cf8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2D50 ->$2D1C */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2d50_M75_r4_08000__2cd2);
  return;
}


// ===== FUN_M75_r4_08000__2d04 @ M75_r4_08000::2d04 =====

void __h3000 FUN_M75_r4_08000__2d04(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2D50 ->$2D1C */
                    /* inline[API_FDBC]: "5.94..,." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2d50_M75_r4_08000__2cd2);
  return;
}


// ===== FUN_M75_r4_08000__2d10 @ M75_r4_08000::2d10 =====

void __h3000 FUN_M75_r4_08000__2d10(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2D50 ->$2D1C */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2d50_M75_r4_08000__2cd2);
  return;
}


// ===== FUN_M75_r4_08000__2d1c @ M75_r4_08000::2d1c =====

void __h3000 FUN_M75_r4_08000__2d1c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2D50 ->$2D1C */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2d50_M75_r4_08000__2cd2);
  return;
}


// ===== FUN_M75_r4_08000__2d50 @ M75_r4_08000::2d50 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2d64 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2d50(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3124(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2d64. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2d8c @ M75_r4_08000::2d8c =====

void __h3000 FUN_M75_r4_08000__2d8c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2DE4 ->$2DB0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2de4_M75_r4_08000__2d66);
  return;
}


// ===== FUN_M75_r4_08000__2d98 @ M75_r4_08000::2d98 =====

void __h3000 FUN_M75_r4_08000__2d98(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2DE4 ->$2DB0 */
                    /* inline[API_FDBC]: "5.94..-f" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2de4_M75_r4_08000__2d66);
  return;
}


// ===== FUN_M75_r4_08000__2da4 @ M75_r4_08000::2da4 =====

void __h3000 FUN_M75_r4_08000__2da4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2DE4 ->$2DB0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2de4_M75_r4_08000__2d66);
  return;
}


// ===== FUN_M75_r4_08000__2db0 @ M75_r4_08000::2db0 =====

void __h3000 FUN_M75_r4_08000__2db0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2DE4 ->$2DB0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2de4_M75_r4_08000__2d66);
  return;
}


// ===== FUN_M75_r4_08000__2de4 @ M75_r4_08000::2de4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2df8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2de4(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3130(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2df8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2e20 @ M75_r4_08000::2e20 =====

void __h3000 FUN_M75_r4_08000__2e20(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2E78 ->$2E44 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2e78_M75_r4_08000__2dfa);
  return;
}


// ===== FUN_M75_r4_08000__2e2c @ M75_r4_08000::2e2c =====

void __h3000 FUN_M75_r4_08000__2e2c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2E78 ->$2E44 */
                    /* inline[API_FDBC]: "5.94..-." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2e78_M75_r4_08000__2dfa);
  return;
}


// ===== FUN_M75_r4_08000__2e38 @ M75_r4_08000::2e38 =====

void __h3000 FUN_M75_r4_08000__2e38(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2E78 ->$2E44 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2e78_M75_r4_08000__2dfa);
  return;
}


// ===== FUN_M75_r4_08000__2e44 @ M75_r4_08000::2e44 =====

void __h3000 FUN_M75_r4_08000__2e44(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2E78 ->$2E44 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2e78_M75_r4_08000__2dfa);
  return;
}


// ===== FUN_M75_r4_08000__2e78 @ M75_r4_08000::2e78 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2e8c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2e78(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$313C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2e8c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2eb4 @ M75_r4_08000::2eb4 =====

void __h3000 FUN_M75_r4_08000__2eb4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2F0C ->$2ED8 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2f0c_M75_r4_08000__2e8e);
  return;
}


// ===== FUN_M75_r4_08000__2ec0 @ M75_r4_08000::2ec0 =====

void __h3000 FUN_M75_r4_08000__2ec0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2F0C ->$2ED8 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2f0c_M75_r4_08000__2e8e);
  return;
}


// ===== FUN_M75_r4_08000__2ecc @ M75_r4_08000::2ecc =====

void __h3000 FUN_M75_r4_08000__2ecc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2F0C ->$2ED8 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2f0c_M75_r4_08000__2e8e);
  return;
}


// ===== FUN_M75_r4_08000__2ed8 @ M75_r4_08000::2ed8 =====

void __h3000 FUN_M75_r4_08000__2ed8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2F0C ->$2ED8 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2f0c_M75_r4_08000__2e8e);
  return;
}


// ===== FUN_M75_r4_08000__2f0c @ M75_r4_08000::2f0c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2f20 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2f0c(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3148(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2f20. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2f48 @ M75_r4_08000::2f48 =====

void __h3000 FUN_M75_r4_08000__2f48(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2FA0 ->$2F6C */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__2fa0_M75_r4_08000__2f22);
  return;
}


// ===== FUN_M75_r4_08000__2f54 @ M75_r4_08000::2f54 =====

void __h3000 FUN_M75_r4_08000__2f54(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2FA0 ->$2F6C */
                    /* inline[API_FDBC]: "5.94../"" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__2fa0_M75_r4_08000__2f22);
  return;
}


// ===== FUN_M75_r4_08000__2f60 @ M75_r4_08000::2f60 =====

void __h3000 FUN_M75_r4_08000__2f60(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2FA0 ->$2F6C */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__2fa0_M75_r4_08000__2f22);
  return;
}


// ===== FUN_M75_r4_08000__2f6c @ M75_r4_08000::2f6c =====

void __h3000 FUN_M75_r4_08000__2f6c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2FA0 ->$2F6C */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__2fa0_M75_r4_08000__2f22);
  return;
}


// ===== FUN_M75_r4_08000__2fa0 @ M75_r4_08000::2fa0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2fb4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__2fa0(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3154(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x2fb4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__2fdc @ M75_r4_08000::2fdc =====

void __h3000 FUN_M75_r4_08000__2fdc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3034 ->$3000 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__3034_M75_r4_08000__2fb6);
  return;
}


// ===== FUN_M75_r4_08000__2fe8 @ M75_r4_08000::2fe8 =====

void __h3000 FUN_M75_r4_08000__2fe8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3034 ->$3000 */
                    /* inline[API_FDBC]: "5.94../." */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__3034_M75_r4_08000__2fb6);
  return;
}


// ===== FUN_M75_r4_08000__2ff4 @ M75_r4_08000::2ff4 =====

void __h3000 FUN_M75_r4_08000__2ff4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3034 ->$3000 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__3034_M75_r4_08000__2fb6);
  return;
}


// ===== FUN_M75_r4_08000__3000 @ M75_r4_08000::3000 =====

void __h3000 FUN_M75_r4_08000__3000(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3034 ->$3000 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__3034_M75_r4_08000__2fb6);
  return;
}


// ===== FUN_M75_r4_08000__3034 @ M75_r4_08000::3034 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3048 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3034(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$3160(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x3048. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__3070 @ M75_r4_08000::3070 =====

void __h3000 FUN_M75_r4_08000__3070(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$30C8 ->$3094 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__30c8_M75_r4_08000__304a);
  return;
}


// ===== FUN_M75_r4_08000__307c @ M75_r4_08000::307c =====

void __h3000 FUN_M75_r4_08000__307c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$30C8 ->$3094 */
                    /* inline[API_FDBC]: "5.94..0J" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__30c8_M75_r4_08000__304a);
  return;
}


// ===== FUN_M75_r4_08000__3088 @ M75_r4_08000::3088 =====

void __h3000 FUN_M75_r4_08000__3088(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$30C8 ->$3094 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__30c8_M75_r4_08000__304a);
  return;
}


// ===== FUN_M75_r4_08000__3094 @ M75_r4_08000::3094 =====

void __h3000 FUN_M75_r4_08000__3094(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$30C8 ->$3094 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__30c8_M75_r4_08000__304a);
  return;
}


// ===== FUN_M75_r4_08000__30c8 @ M75_r4_08000::30c8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x30dc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__30c8(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
                    /* inline[addr:9CDD]: ->$316C(rel) */
  uVar1 = FUN_9cdd();
  FUN_M75_r4_08000__30de((char)((ushort)uVar1 >> 8),(char)uVar1,uVar1);
                    /* WARNING: Could not recover jumptable at 0x30dc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__30de @ M75_r4_08000::30de =====

undefined2 __h3000 FUN_M75_r4_08000__30de(short *param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 *puVar2;
  
  uVar1 = *(undefined2 *)(*param_1 + 4);
  *(char *)(param_3 + -1) = (char)uVar1;
  *(char *)(param_3 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7010;
  *(char *)(param_3 + -3) = (char)DAT_7010;
  puVar2 = (undefined1 *)(param_3 + -4);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_717e = FUN_M75_r4_08000__34cb(*puVar2);
  DAT_7180 = param_1[5];
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_717e >> 8));
  return in_D;
}


// ===== FUN_M75_r4_08000__319e @ M75_r4_08000::319e =====

void __h3000 FUN_M75_r4_08000__319e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$31FB ->$31C2 */
  API_FE6A(param_1,param_2,&PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178);
  return;
}


// ===== FUN_M75_r4_08000__31aa @ M75_r4_08000::31aa =====

void __h3000 FUN_M75_r4_08000__31aa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$31FB ->$31C2 */
                    /* inline[API_FDBC]: "5.94..1x" */
  API_FDBC(param_1,param_2,&PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178);
  return;
}


// ===== FUN_M75_r4_08000__31b6 @ M75_r4_08000::31b6 =====

void __h3000 FUN_M75_r4_08000__31b6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$31FB ->$31C2 */
  API_FE6C(param_1,param_2,&PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178);
  return;
}


// ===== FUN_M75_r4_08000__31c2 @ M75_r4_08000::31c2 =====

void __h3000 FUN_M75_r4_08000__31c2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$31FB ->$31C2 */
  API_FE6E(param_1,param_2,&PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178);
  return;
}


// ===== FUN_M75_r4_08000__31ce @ M75_r4_08000::31ce =====

void __h3000 FUN_M75_r4_08000__31ce(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$31FB ->$31C2 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178);
  return;
}


// ===== FUN_M75_r4_08000__31da @ M75_r4_08000::31da =====

void __h3000 FUN_M75_r4_08000__31da(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$31FB ->$31C2 $31B6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178);
  return;
}


// ===== FUN_M75_r4_08000__31fb @ M75_r4_08000::31fb =====

undefined2 __h3000 FUN_M75_r4_08000__31fb(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7004;
  *(short *)(in_U + -2) = sVar1;
  DAT_717e = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_717e) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M75_r4_08000__3250 @ M75_r4_08000::3250 =====

void __h3000 FUN_M75_r4_08000__3250(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__3295_M75_r4_08000__322a);
  return;
}


// ===== FUN_M75_r4_08000__325c @ M75_r4_08000::325c =====

void __h3000 FUN_M75_r4_08000__325c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3295 ->$3274 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__3295_M75_r4_08000__322a);
  return;
}


// ===== FUN_M75_r4_08000__3268 @ M75_r4_08000::3268 =====

void __h3000 FUN_M75_r4_08000__3268(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__3295_M75_r4_08000__322a);
  return;
}


// ===== FUN_M75_r4_08000__3274 @ M75_r4_08000::3274 =====

void __h3000 FUN_M75_r4_08000__3274(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M75_r4_08000__3295_M75_r4_08000__322a);
  return;
}


// ===== FUN_M75_r4_08000__3295 @ M75_r4_08000::3295 =====

undefined2 __h3000 FUN_M75_r4_08000__3295(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M75_r4_08000__3295_M75_r4_08000__322a);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M75_r4_08000__32cb @ M75_r4_08000::32cb =====

void __h3000 FUN_M75_r4_08000__32cb(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__3310_M75_r4_08000__32a5);
  return;
}


// ===== FUN_M75_r4_08000__32d7 @ M75_r4_08000::32d7 =====

void __h3000 FUN_M75_r4_08000__32d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3310 ->$32EF */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__3310_M75_r4_08000__32a5);
  return;
}


// ===== FUN_M75_r4_08000__32e3 @ M75_r4_08000::32e3 =====

void __h3000 FUN_M75_r4_08000__32e3(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__3310_M75_r4_08000__32a5);
  return;
}


// ===== FUN_M75_r4_08000__32ef @ M75_r4_08000::32ef =====

void __h3000 FUN_M75_r4_08000__32ef(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M75_r4_08000__3310_M75_r4_08000__32a5);
  return;
}


// ===== FUN_M75_r4_08000__3310 @ M75_r4_08000::3310 =====

undefined2 __h3000 FUN_M75_r4_08000__3310(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M75_r4_08000__3310_M75_r4_08000__32a5);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M75_r4_08000__3346 @ M75_r4_08000::3346 =====

void __h3000 FUN_M75_r4_08000__3346(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__338b_M75_r4_08000__3320);
  return;
}


// ===== FUN_M75_r4_08000__3352 @ M75_r4_08000::3352 =====

void __h3000 FUN_M75_r4_08000__3352(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$338B ->$336A */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__338b_M75_r4_08000__3320);
  return;
}


// ===== FUN_M75_r4_08000__335e @ M75_r4_08000::335e =====

void __h3000 FUN_M75_r4_08000__335e(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__338b_M75_r4_08000__3320);
  return;
}


// ===== FUN_M75_r4_08000__336a @ M75_r4_08000::336a =====

void __h3000 FUN_M75_r4_08000__336a(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M75_r4_08000__338b_M75_r4_08000__3320);
  return;
}


// ===== FUN_M75_r4_08000__338b @ M75_r4_08000::338b =====

undefined2 __h3000 FUN_M75_r4_08000__338b(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M75_r4_08000__338b_M75_r4_08000__3320);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M75_r4_08000__33c1 @ M75_r4_08000::33c1 =====

void __h3000 FUN_M75_r4_08000__33c1(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M75_r4_08000__3406_M75_r4_08000__339b);
  return;
}


// ===== FUN_M75_r4_08000__33cd @ M75_r4_08000::33cd =====

void __h3000 FUN_M75_r4_08000__33cd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3406 ->$33E5 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M75_r4_08000__3406_M75_r4_08000__339b);
  return;
}


// ===== FUN_M75_r4_08000__33d9 @ M75_r4_08000::33d9 =====

void __h3000 FUN_M75_r4_08000__33d9(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M75_r4_08000__3406_M75_r4_08000__339b);
  return;
}


// ===== FUN_M75_r4_08000__33e5 @ M75_r4_08000::33e5 =====

void __h3000 FUN_M75_r4_08000__33e5(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M75_r4_08000__3406_M75_r4_08000__339b);
  return;
}


// ===== FUN_M75_r4_08000__3406 @ M75_r4_08000::3406 =====

undefined2 __h3000 FUN_M75_r4_08000__3406(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M75_r4_08000__3406_M75_r4_08000__339b);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M75_r4_08000__3416 @ M75_r4_08000::3416 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x34a5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3416(short *param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short *psVar3;
  short sVar4;
  short *psVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar4 = *param_1;
  sVar1 = *(short *)(sVar4 + 6);
  psVar3 = param_1;
  if (sVar1 == 0) {
    DAT_7182 = 0;
    DAT_7184 = 0;
  }
  else {
    *(char *)(param_3 + -1) = (char)sVar1;
    *(char *)(param_3 + -2) = (char)((ushort)sVar1 >> 8);
    *(undefined1 *)(param_3 + -3) = 0xe;
    psVar5 = (short *)(param_3 + -4);
    *(undefined1 *)psVar5 = 0;
    API_FCEC();
    sVar1 = *psVar5;
    DAT_7180 = sVar1;
    *(char *)((short)psVar5 + 1) = (char)sVar1;
    *(char *)psVar5 = (char)((ushort)sVar1 >> 8);
    *(undefined1 *)((short)psVar5 + -1) = 0xb;
    psVar5 = psVar5 + -1;
    *(undefined1 *)psVar5 = 0;
    API_FCEC();
    sVar1 = DAT_7180;
    DAT_717e = *psVar5;
    *(char *)((short)psVar5 + 1) = (char)DAT_7180;
    *(char *)psVar5 = (char)((ushort)sVar1 >> 8);
    psVar5 = psVar5 + -1;
    *psVar5 = *(short *)(sVar4 + 8) + -0xb;
    API_FCEC();
    uVar2 = DAT_7024;
    *(char *)((short)psVar5 + -1) = (char)DAT_7024;
    psVar5 = psVar5 + -1;
    *(char *)psVar5 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    DAT_7182 = DAT_717e + *psVar5;
    DAT_7184 = DAT_717e - *psVar5;
  }
  DAT_717e = psVar3[4];
  DAT_7180 = psVar3[3];
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7182 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7184 >> 8));
                    /* WARNING: Could not recover jumptable at 0x34a5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M75_r4_08000__34a7 @ M75_r4_08000::34a7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x34c9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__34a7(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = (undefined1)in_D;
  *(undefined1 *)(param_3 + -1) = uVar2;
  uVar1 = (undefined1)((ushort)in_D >> 8);
  *(undefined1 *)(param_3 + -2) = uVar1;
  *(undefined1 *)(param_3 + -3) = uVar2;
  *(undefined1 *)(param_3 + -4) = uVar1;
  *(undefined1 *)(param_3 + -5) = 3;
  puVar3 = (undefined1 *)(param_3 + -6);
  *puVar3 = 0;
  API_FCEC();
  API_FCFC();
  puVar3[-1] = 0x6b;
  puVar4 = (undefined2 *)(puVar3 + -2);
  *(undefined1 *)puVar4 = 0x23;
  API_FCF2();
  API_FCE2();
                    /* WARNING: Could not recover jumptable at 0x34c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)*puVar4 >> 8),uVar2,param_1,param_2,puVar4 + 1);
  return;
}


// ===== FUN_M75_r4_08000__34cb @ M75_r4_08000::34cb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x34eb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__34cb(undefined2 param_1,undefined2 param_2,short param_3)

{
  char cVar1;
  undefined2 in_D;
  byte bVar2;
  byte *pbVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar2 = (byte)in_D;
  *(byte *)(param_3 + -1) = bVar2;
  cVar1 = (char)((ushort)in_D >> 8);
  *(char *)(param_3 + -2) = cVar1;
  *(byte *)(param_3 + -3) = bVar2 << 2;
  pbVar3 = (byte *)(param_3 + -4);
  *pbVar3 = (cVar1 << 1 | bVar2 >> 7) << 1 | (bVar2 & 0x7f) >> 6;
  API_FCFC();
  pbVar3[-1] = 0x7f;
  pbVar3 = pbVar3 + -2;
  *pbVar3 = 0x34;
  API_FCF2();
  API_FCE2();
                    /* WARNING: Could not recover jumptable at 0x34eb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)(*(short *)pbVar3 + 1) >> 8),bVar2,param_1,param_2,pbVar3 + 2);
  return;
}


// ===== FUN_M75_r4_08000__34ed @ M75_r4_08000::34ed =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3522 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__34ed(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  byte bVar1;
  byte bVar2;
  char cVar3;
  undefined2 in_D;
  ushort uVar4;
  ushort uVar5;
  short sVar6;
  code *UNRECOVERED_JUMPTABLE;
  byte local_6;
  byte bStack_5;
  
  bStack_5 = 0;
  local_6 = 0;
  cVar3 = (char)((ushort)*param_3 >> 8);
  uVar4 = CONCAT11(cVar3 >> 1,(char)*param_3 >> 1 | cVar3 << 7);
  uVar5 = param_3[1];
  sVar6 = 0xf;
  do {
    if (uVar5 < uVar4) {
      bVar1 = bStack_5 >> 7;
      bStack_5 = bStack_5 << 1;
      bVar2 = local_6 >> 7;
      local_6 = local_6 << 1 | bVar1;
      uVar5 = CONCAT11((char)(uVar5 >> 8) << 1 | (byte)uVar5 >> 7,(byte)uVar5 << 1 | bVar2);
    }
    else {
      uVar5 = uVar5 - uVar4;
      bVar1 = local_6 >> 7;
      local_6 = local_6 << 1 | bStack_5 >> 7;
      uVar5 = CONCAT11((char)(uVar5 >> 7),(char)uVar5 << 1 | bVar1);
      bStack_5 = bStack_5 * '\x02' + 1;
    }
    sVar6 = sVar6 + -1;
  } while (sVar6 != 0);
  *(byte *)((short)param_3 + 3) = bStack_5;
  *(byte *)(param_3 + 1) = local_6;
                    /* WARNING: Could not recover jumptable at 0x3522. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar5,param_1);
  return;
}


// ===== MODULE_7A_02_entry @ M75_r4_08000::352d =====

void __h3000
MODULE_7A_02_entry(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M75_r4_08000__3537();
  FUN_M75_r4_08000__1d0e();
                    /* WARNING: Could not recover jumptable at 0x3535. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M75_r4_08000__3537 @ M75_r4_08000::3537 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3561 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3537(undefined2 param_1,undefined2 param_2)

{
  char cVar1;
  undefined2 in_D;
  undefined2 uVar2;
  undefined1 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puVar4;
  
  cVar1 = -0x80;
  puVar4 = &DAT_7196;
  do {
    puVar3 = puVar4 + 1;
    *puVar4 = 0;
    cVar1 = cVar1 + -1;
    puVar4 = puVar3;
  } while (cVar1 != '\0');
  FUN_M75_r4_08000__3602();
                    /* inline[addr:9CDD]: ->$3601(rel) */
  uVar2 = FUN_9cdd();
  *(undefined2 *)(puVar3 + 3) = uVar2;
                    /* inline[addr:9CDD]: ->$3563(rel) */
  uVar2 = FUN_9cdd();
  *(undefined2 *)(puVar3 + 1) = uVar2;
  _DAT_7228 = 0;
                    /* WARNING: Could not recover jumptable at 0x3561. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__3563 @ M75_r4_08000::3563 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x358e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3563(undefined2 param_1,short param_2)

{
  undefined2 in_D;
  undefined2 uVar1;
  short sVar2;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 local_5;
  
  local_5 = (byte)in_D;
  if (-1 < (char)DAT_608a) {
    if ((local_5 & 0xf) != DAT_608a) goto LAB_M75_r4_08000__3581;
  }
  if ((local_5 & 0xf0) == 0x90) {
                    /* inline[addr:9CDD]: ->$35A0(rel) */
    FUN_9cdd();
    FUN_M75_r4_08000__3587();
    return;
  }
  if ((local_5 & 0xf0) == 0x80) {
                    /* inline[addr:9CDD]: ->$35CB(rel) */
    FUN_9cdd();
    FUN_M75_r4_08000__3587();
    return;
  }
LAB_M75_r4_08000__3581:
  sVar2 = param_2;
                    /* inline[addr:9CDD]: ->$3601(rel) */
  FUN_9cdd();
  uVar1 = FUN_M75_r4_08000__3602();
  *(undefined2 *)(sVar2 + 3) = uVar1;
                    /* WARNING: Could not recover jumptable at 0x358e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__3587 @ M75_r4_08000::3587 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x358e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3587(void)

{
  undefined2 uVar1;
  short in_Y;
  undefined2 in_stack_00000000;
  undefined2 in_stack_00000002;
  undefined2 in_stack_00000004;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_M75_r4_08000__3602();
  *(undefined2 *)(in_Y + 3) = uVar1;
                    /* WARNING: Could not recover jumptable at 0x358e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)
            ((char)((ushort)in_stack_00000000 >> 8),(char)uVar1,in_stack_00000002,in_stack_00000004)
  ;
  return;
}


// ===== FUN_M75_r4_08000__35a0 @ M75_r4_08000::35a0 =====

void __h3000 FUN_M75_r4_08000__35a0(undefined1 param_1,undefined1 param_2)

{
  DAT_7216 = param_2;
                    /* inline[addr:9CDD]: ->$35AD(rel) */
  FUN_9cdd();
  FUN_M75_r4_08000__3587();
  return;
}


// ===== FUN_M75_r4_08000__35ad @ M75_r4_08000::35ad =====

void __h3000 FUN_M75_r4_08000__35ad(undefined1 param_1,char param_2)

{
  if (param_2 == '\0') {
    FUN_M75_r4_08000__35e5();
  }
  else {
    (&DAT_7196)[DAT_7216] = param_2;
    FUN_M75_r4_08000__3614();
  }
                    /* inline[addr:9CDD]: ->$35A0(rel) */
  FUN_9cdd();
  FUN_M75_r4_08000__3587();
  return;
}


// ===== FUN_M75_r4_08000__35cb @ M75_r4_08000::35cb =====

void __h3000 FUN_M75_r4_08000__35cb(undefined1 param_1,undefined1 param_2)

{
  DAT_7216 = param_2;
                    /* inline[addr:9CDD]: ->$35D8(rel) */
  FUN_9cdd();
  FUN_M75_r4_08000__3587();
  return;
}


// ===== FUN_M75_r4_08000__35d8 @ M75_r4_08000::35d8 =====

void __h3000 FUN_M75_r4_08000__35d8(void)

{
  FUN_M75_r4_08000__35e5();
                    /* inline[addr:9CDD]: ->$35CB(rel) */
  FUN_9cdd();
  FUN_M75_r4_08000__3587();
  return;
}


// ===== FUN_M75_r4_08000__35e5 @ M75_r4_08000::35e5 =====

void __h3000
FUN_M75_r4_08000__35e5(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  (&DAT_7196)[DAT_7216] = 0;
  if (DAT_722a == '\x02') {
    FUN_M75_r4_08000__3717();
    if ((extraout_CC >> 2 & 1) != 0) {
      DAT_7228 = 0;
    }
  }
                    /* WARNING: Could not recover jumptable at 0x35ff. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M75_r4_08000__3602 @ M75_r4_08000::3602 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x360e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3602(undefined2 param_1)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x360e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,0x6dd0);
  return;
}


// ===== FUN_M75_r4_08000__3610 @ M75_r4_08000::3610 =====

void __h3000 FUN_M75_r4_08000__3610(void)

{
  DAT_7228 = 0;
  return;
}


// ===== FUN_M75_r4_08000__3614 @ M75_r4_08000::3614 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x362d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__3614(undefined2 param_1,undefined2 param_2)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_722b = 0xff;
  if (DAT_722a == '\x02') {
    if (DAT_7228 != '\b') {
      (&DAT_7217)[DAT_7228] = DAT_7216;
      DAT_7228 = DAT_7228 + '\x01';
      FUN_M75_r4_08000__36ad();
      FUN_M75_r4_08000__1d0e();
    }
  }
  else if (DAT_722a == '\x03') {
    (&DAT_721f)[DAT_7228] = DAT_7216;
    DAT_7228 = (char)in_D;
    FUN_M75_r4_08000__1d0e();
  }
  else {
    API_FCB4(0);
  }
                    /* WARNING: Could not recover jumptable at 0x362d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__3663 @ M75_r4_08000::3663 =====

void __h3000
FUN_M75_r4_08000__3663(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  byte extraout_CC;
  code *UNRECOVERED_JUMPTABLE;
  
  if ((DAT_722b != '\0') && (DAT_722a == '\x01')) {
    API_FCB6();
    if ((extraout_CC >> 2 & 1) != 0) {
      DAT_722b = '\0';
      FUN_M75_r4_08000__367f();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x367d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M75_r4_08000__367f @ M75_r4_08000::367f =====

void __h3000
FUN_M75_r4_08000__367f(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  if (DAT_722a != '\0') {
    DAT_7227 = '\0';
    cVar1 = '\0';
    do {
      if ((&DAT_7196)[cVar1] != '\0') {
        (&DAT_7217)[DAT_7227] = cVar1;
        DAT_7227 = DAT_7227 + '\x01';
      }
      cVar1 = cVar1 + '\x01';
    } while ((cVar1 != -0x80) && (DAT_7227 != '\b'));
    FUN_M75_r4_08000__36ad();
    FUN_M75_r4_08000__1d0e();
  }
                    /* WARNING: Could not recover jumptable at 0x36ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


// ===== FUN_M75_r4_08000__36ad @ M75_r4_08000::36ad =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x36d5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M75_r4_08000__36ad(undefined2 param_1,undefined2 param_2)

{
  char cVar1;
  undefined2 in_D;
  short sVar2;
  byte bVar4;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[addr:9CDD]: ->$36D7(rel) */
  sVar2 = FUN_9cdd();
  bVar4 = (char)in_D - 1;
  sVar3 = (CONCAT11(8,bVar4) >> 8) * (ushort)bVar4;
  cVar1 = '\0';
  do {
    (&DAT_721f)[cVar1] = (&DAT_7217)[*(char *)(sVar3 + sVar2 + (short)cVar1)];
    cVar1 = cVar1 + '\x01';
  } while (cVar1 != '\b');
                    /* WARNING: Could not recover jumptable at 0x36d5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
}


// ===== FUN_M75_r4_08000__3717 @ M75_r4_08000::3717 =====

void __h3000
FUN_M75_r4_08000__3717(undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4)

{
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  cVar1 = '\0';
  do {
    if ((&DAT_7196)[cVar1] != '\0') break;
    cVar1 = cVar1 + '\x01';
  } while (cVar1 != -0x80);
                    /* WARNING: Could not recover jumptable at 0x3727. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4);
  return;
}


