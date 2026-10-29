// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M70_r4_30000 M70_r4_30000::0000-M70_r4_30000::3fff, 431 functions
// Bank r4_30000 (module id 70, sub 00)

// ===== MODULE_70_01_entry @ M70_r4_30000::00f7 =====

undefined2 __h3000 MODULE_70_01_entry(void)

{
  undefined2 uVar1;
  
                    /* inline[API_FC60]: $00FB */
  uVar1 = ModuleSetBase();
  FUN_M70_r4_30000__0227();
  FUN_M70_r4_30000__01a7();
  FUN_M70_r4_30000__02c8();
  DAT_60da = 3;
  API_FE38();
  API_FC58();
  FUN_M70_r4_30000__069e();
  if (DAT_600a != 'p') {
    FUN_a2f1();
    FUN_M70_r4_30000__0155();
  }
  FUN_M70_r4_30000__02e5();
  if (DAT_600a != 'p') {
    API_FD20(0x4e);
  }
  FUN_M70_r4_30000__034d();
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M70_r4_30000__083a();
  API_FE14();
  FUN_M70_r4_30000__0868();
  return uVar1;
}


// ===== FUN_M70_r4_30000__0155 @ M70_r4_30000::0155 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0169 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M70_r4_30000__0155(undefined2 param_1)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  byte extraout_CC_02;
  undefined1 auStack_8 [2];
  undefined2 uStack_6;
  
  uVar2 = (undefined1)in_D;
  stack0xfff9 = CONCAT12(uVar2,param_1);
  uVar1 = (undefined1)((ushort)in_D >> 8);
  _auStack_8 = CONCAT13(uVar1,stack0xfff9);
  DspLoadProgram();
  if ((extraout_CC >> 2 & 1) != 0) {
    DspLoadProgram(uVar1,uVar2,0x7011);
    if ((extraout_CC_00 >> 2 & 1) != 0) {
      DspLoadProgram(uVar1,uVar2,0x12);
      if ((extraout_CC_01 >> 2 & 1) != 0) {
        DspLoadProgram(uVar1,uVar2,&DAT_7012);
        if ((extraout_CC_02 >> 2 & 1) != 0) {
          FUN_M70_r4_30000__14d3();
          FUN_M70_r4_30000__159b();
          FUN_M70_r4_30000__168e();
          DAT_7084 = 100;
          _DAT_7196 = " min ";
          API_FD7C();
          return auStack_8;
        }
      }
    }
  }
  LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
  LcdPrintInline();
  return stack0xfff9;
}


// ===== FUN_M70_r4_30000__01a7 @ M70_r4_30000::01a7 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M70_r4_30000__01a7(void)

{
  undefined2 in_D;
  
  DAT_7028 = 0;
  DAT_7030 = 0;
  DAT_7038 = 0;
  DAT_7040 = 0;
  DAT_7002 = 0;
  DAT_700a = 0;
  DAT_7012 = 0;
  DAT_701a = 0;
  DAT_7048 = 0;
  DAT_7050 = 0;
  DAT_7058 = 0;
  DAT_7060 = 0;
  DAT_70fa = 0;
  DAT_7022 = 0;
  DAT_70d0 = 0;
  DAT_70d2 = 0;
  DAT_70d4 = 0;
  DAT_70d6 = 0;
  DAT_70d8 = 0;
  DAT_70da = 0;
  DAT_70dc = 0;
  DAT_70de = 0;
  DAT_70e0 = 0;
  DAT_70e2 = 0;
  DAT_70e4 = 0;
  DAT_70e6 = 0;
  DAT_70e8 = 0;
  DAT_70ea = 0;
  DAT_70ec = 0;
  DAT_70ee = 0;
  DAT_70f0 = 0;
  DAT_70f2 = 0;
  DAT_70f4 = 0;
  DAT_70f6 = 0;
  DAT_70c6 = 0;
  DAT_70f8 = 0;
  DAT_7068 = 0;
  _DAT_706e = 0;
  DAT_7074 = 0;
  DAT_707a = 0;
  return in_D;
}


// ===== FUN_M70_r4_30000__0227 @ M70_r4_30000::0227 =====

undefined2 __h3000 FUN_M70_r4_30000__0227(void)

{
  undefined2 in_D;
  
                    /* inline[API_FE08]: 79:26 7B:2C 7D:2E 7F:34 99:C4 9B:CA */
  LoadParamsScaled();
                    /* inline[API_FE08]: 81:36 83:3C 85:3E 87:44 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 65:00 67:06 69:08 6B:0E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 6D:10 6F:16 71:18 73:1E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 55:46 57:4C 59:4E 5B:54 5D:56 5F:5C 61:5E 63:64 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 8D:AA 91:B4 8F:AE 93:B8 95:BC 97:BE */
  LoadParamsScaled();
                    /* inline[API_FE04]: 89:A8 8B:B2 8A:AC 8C:B6 9D:CC */
  LoadParamsSigned();
                    /* inline[API_FE04]: 9F:98 A0:9A A1:9C A2:9E */
  LoadParamsSigned();
                    /* inline[API_FE04]: A3:A0 A4:A2 A5:A4 A6:A6 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 76:7E 77:80 78:82 75:20 9E:CE */
  LoadParamsSigned();
  DAT_7156 = 0x10;
  return in_D;
}


// ===== FUN_M70_r4_30000__02c8 @ M70_r4_30000::02c8 =====

undefined2 __h3000 FUN_M70_r4_30000__02c8(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M70_r4_30000__110e();
  FUN_M70_r4_30000__11bc();
  FUN_M70_r4_30000__0fb8();
  FUN_M70_r4_30000__1063();
  FUN_M70_r4_30000__1252();
  FUN_M70_r4_30000__12cd();
  FUN_M70_r4_30000__1348();
  FUN_M70_r4_30000__13c3();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__02e5 @ M70_r4_30000::02e5 =====

undefined2 __h3000 FUN_M70_r4_30000__02e5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  FUN_M70_r4_30000__14d3();
  FUN_M70_r4_30000__159b();
  FUN_M70_r4_30000__168e();
  FUN_M70_r4_30000__0ccf();
  FUN_M70_r4_30000__0d7f();
  FUN_M70_r4_30000__0e63();
  FUN_M70_r4_30000__0f13();
  FUN_M70_r4_30000__36ae();
  FUN_M70_r4_30000__381b();
  FUN_M70_r4_30000__3764();
  FUN_M70_r4_30000__38ac();
  FUN_M70_r4_30000__3924();
  FUN_M70_r4_30000__347b();
  FUN_M70_r4_30000__34ae();
  FUN_M70_r4_30000__34d4();
  FUN_M70_r4_30000__3507();
  FUN_M70_r4_30000__352d();
  FUN_M70_r4_30000__3560();
  FUN_M70_r4_30000__3586();
  FUN_M70_r4_30000__35b9();
  FUN_M70_r4_30000__35df();
  FUN_M70_r4_30000__3605();
  FUN_M70_r4_30000__3c50();
  FUN_M70_r4_30000__3ce2();
  FUN_M70_r4_30000__3a6f();
  FUN_M70_r4_30000__278a();
  FUN_M70_r4_30000__2815();
  FUN_M70_r4_30000__28a0();
  FUN_M70_r4_30000__292b();
  FUN_M70_r4_30000__29b6();
  FUN_M70_r4_30000__2a41();
  FUN_M70_r4_30000__2acc();
  FUN_M70_r4_30000__2b57();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__034d @ M70_r4_30000::034d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M70_r4_30000__034d(void)

{
  undefined2 in_D;
  
                    /* inline[API_FE78]: 00 80 "trigger1" 21 $2CE3 $0C04 */
  DefineParameterAlt();
                    /* inline[API_FE78]: 01 80 "trigger2" 25 $2D91 $0C04 */
  DefineParameterAlt();
                    /* inline[API_FE78]: 02 80 "trigger3" 29 $2E3F $0C04 */
  DefineParameterAlt();
                    /* inline[API_FE78]: 03 80 "trigger4" 2D $2EED $0C04 */
  DefineParameterAlt();
                    /* inline[API_FD84]: 04 80 "length 1" 31 $3681 $368D */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "length 2" 35 $3737 $3743 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 " count1 " 39 $37ED $37F9 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 " count2 " 3D $387D $3889 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 "l pitch " 41 $0C8C $0C98 */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 "r pitch " 45 $0E20 $0E2C */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "l delay " 49 $0D52 $0D5E */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 "r delay " 4D $0EE6 $0EF2 */
  DefineParameter();
                    /* inline[API_FD84]: 0C 80 "pr speed" 51 $3C22 $3C2E */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M70_r4_30000__0462;
  _DAT_60f7 = 0x2c;
  DAT_6105 = 1;
  DAT_6106 = 0xa7;
  return in_D;
}


// ===== FUN_M70_r4_30000__04ba @ M70_r4_30000::04ba =====

void __h3000 FUN_M70_r4_30000__04ba(void)

{
  FUN_M70_r4_30000__2cef();
  FUN_M70_r4_30000__083a();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__04c5 @ M70_r4_30000::04c5 =====

void __h3000 FUN_M70_r4_30000__04c5(void)

{
  FUN_M70_r4_30000__2d9d();
  FUN_M70_r4_30000__083a();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__04d0 @ M70_r4_30000::04d0 =====

void __h3000 FUN_M70_r4_30000__04d0(void)

{
  FUN_M70_r4_30000__2e4b();
  FUN_M70_r4_30000__083a();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__04db @ M70_r4_30000::04db =====

void __h3000 FUN_M70_r4_30000__04db(void)

{
  FUN_M70_r4_30000__2ef9();
  FUN_M70_r4_30000__083a();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__04e6 @ M70_r4_30000::04e6 =====

void __h3000 FUN_M70_r4_30000__04e6(void)

{
  FUN_M70_r4_30000__395f();
  FUN_M70_r4_30000__0868();
  API_FDE8();
  return;
}


// ===== FUN_M70_r4_30000__04f1 @ M70_r4_30000::04f1 =====

void __h3000 FUN_M70_r4_30000__04f1(void)

{
  FUN_M70_r4_30000__3bfe();
  FUN_M70_r4_30000__0868();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__04fc @ M70_r4_30000::04fc =====

void __h3000 FUN_M70_r4_30000__04fc(void)

{
  FUN_M70_r4_30000__3ca8();
  FUN_M70_r4_30000__0868();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__0507 @ M70_r4_30000::0507 =====

void __h3000 FUN_M70_r4_30000__0507(void)

{
  FUN_M70_r4_30000__10bd();
  FUN_M70_r4_30000__08a1();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0512 @ M70_r4_30000::0512 =====

void __h3000 FUN_M70_r4_30000__0512(void)

{
  FUN_M70_r4_30000__116b();
  FUN_M70_r4_30000__08a1();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__051d @ M70_r4_30000::051d =====

void __h3000 FUN_M70_r4_30000__051d(void)

{
  FUN_M70_r4_30000__1219();
  FUN_M70_r4_30000__08e0();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0528 @ M70_r4_30000::0528 =====

void __h3000 FUN_M70_r4_30000__0528(void)

{
  FUN_M70_r4_30000__1294();
  FUN_M70_r4_30000__08e0();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__0533 @ M70_r4_30000::0533 =====

void __h3000 FUN_M70_r4_30000__0533(void)

{
  FUN_M70_r4_30000__130f();
  FUN_M70_r4_30000__091b();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__053e @ M70_r4_30000::053e =====

void __h3000 FUN_M70_r4_30000__053e(void)

{
  FUN_M70_r4_30000__138a();
  FUN_M70_r4_30000__091b();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__0549 @ M70_r4_30000::0549 =====

void __h3000 FUN_M70_r4_30000__0549(void)

{
  FUN_M70_r4_30000__365d();
  FUN_M70_r4_30000__0998();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0554 @ M70_r4_30000::0554 =====

void __h3000 FUN_M70_r4_30000__0554(void)

{
  FUN_M70_r4_30000__3713();
  FUN_M70_r4_30000__0998();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__055f @ M70_r4_30000::055f =====

void __h3000 FUN_M70_r4_30000__055f(void)

{
  FUN_M70_r4_30000__37c9();
  FUN_M70_r4_30000__0998();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__056a @ M70_r4_30000::056a =====

void __h3000 FUN_M70_r4_30000__056a(void)

{
  FUN_M70_r4_30000__3859();
  FUN_M70_r4_30000__0998();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__0575 @ M70_r4_30000::0575 =====

void __h3000 FUN_M70_r4_30000__0575(void)

{
  FUN_M70_r4_30000__2751();
  FUN_M70_r4_30000__09d1();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0580 @ M70_r4_30000::0580 =====

void __h3000 FUN_M70_r4_30000__0580(void)

{
  FUN_M70_r4_30000__27dc();
  FUN_M70_r4_30000__09d1();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__058b @ M70_r4_30000::058b =====

void __h3000 FUN_M70_r4_30000__058b(void)

{
  FUN_M70_r4_30000__2867();
  FUN_M70_r4_30000__0a0a();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0596 @ M70_r4_30000::0596 =====

void __h3000 FUN_M70_r4_30000__0596(void)

{
  FUN_M70_r4_30000__28f2();
  FUN_M70_r4_30000__0a0a();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__05a1 @ M70_r4_30000::05a1 =====

void __h3000 FUN_M70_r4_30000__05a1(void)

{
  FUN_M70_r4_30000__297d();
  FUN_M70_r4_30000__0a43();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__05ac @ M70_r4_30000::05ac =====

void __h3000 FUN_M70_r4_30000__05ac(void)

{
  FUN_M70_r4_30000__2a08();
  FUN_M70_r4_30000__0a43();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__05b7 @ M70_r4_30000::05b7 =====

void __h3000 FUN_M70_r4_30000__05b7(void)

{
  FUN_M70_r4_30000__2a93();
  FUN_M70_r4_30000__0a7c();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__05c2 @ M70_r4_30000::05c2 =====

void __h3000 FUN_M70_r4_30000__05c2(void)

{
  FUN_M70_r4_30000__2b1e();
  FUN_M70_r4_30000__0a7c();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__05cd @ M70_r4_30000::05cd =====

void __h3000 FUN_M70_r4_30000__05cd(void)

{
  FUN_M70_r4_30000__0c68();
  FUN_M70_r4_30000__0aee();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__05d8 @ M70_r4_30000::05d8 =====

void __h3000 FUN_M70_r4_30000__05d8(void)

{
  FUN_M70_r4_30000__0d2e();
  FUN_M70_r4_30000__0aee();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__05e3 @ M70_r4_30000::05e3 =====

void __h3000 FUN_M70_r4_30000__05e3(void)

{
  FUN_M70_r4_30000__0dfc();
  FUN_M70_r4_30000__0b27();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__05ee @ M70_r4_30000::05ee =====

void __h3000 FUN_M70_r4_30000__05ee(void)

{
  FUN_M70_r4_30000__0ec2();
  FUN_M70_r4_30000__0b27();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__05f9 @ M70_r4_30000::05f9 =====

void __h3000 FUN_M70_r4_30000__05f9(void)

{
  FUN_M70_r4_30000__0f67();
  FUN_M70_r4_30000__0aee();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__0604 @ M70_r4_30000::0604 =====

void __h3000 FUN_M70_r4_30000__0604(void)

{
  FUN_M70_r4_30000__1012();
  FUN_M70_r4_30000__0b27();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__060f @ M70_r4_30000::060f =====

void __h3000 FUN_M70_r4_30000__060f(void)

{
  FUN_M70_r4_30000__307b();
  FUN_M70_r4_30000__0b60();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__061a @ M70_r4_30000::061a =====

void __h3000 FUN_M70_r4_30000__061a(void)

{
  FUN_M70_r4_30000__322b();
  FUN_M70_r4_30000__0b60();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__0625 @ M70_r4_30000::0625 =====

void __h3000 FUN_M70_r4_30000__0625(void)

{
  FUN_M70_r4_30000__3153();
  FUN_M70_r4_30000__0b60();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__0630 @ M70_r4_30000::0630 =====

void __h3000 FUN_M70_r4_30000__0630(void)

{
  FUN_M70_r4_30000__3301();
  FUN_M70_r4_30000__0b60();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__063b @ M70_r4_30000::063b =====

void __h3000 FUN_M70_r4_30000__063b(void)

{
  FUN_M70_r4_30000__30e7();
  FUN_M70_r4_30000__0b99();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0646 @ M70_r4_30000::0646 =====

void __h3000 FUN_M70_r4_30000__0646(void)

{
  FUN_M70_r4_30000__3296();
  FUN_M70_r4_30000__0b99();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__0651 @ M70_r4_30000::0651 =====

void __h3000 FUN_M70_r4_30000__0651(void)

{
  FUN_M70_r4_30000__31bf();
  FUN_M70_r4_30000__0b99();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__065c @ M70_r4_30000::065c =====

void __h3000 FUN_M70_r4_30000__065c(void)

{
  FUN_M70_r4_30000__336c();
  FUN_M70_r4_30000__0b99();
  API_FE16();
  return;
}


// ===== FUN_M70_r4_30000__0667 @ M70_r4_30000::0667 =====

void __h3000 FUN_M70_r4_30000__0667(void)

{
  FUN_M70_r4_30000__33d7();
  FUN_M70_r4_30000__0bd2();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0672 @ M70_r4_30000::0672 =====

void __h3000 FUN_M70_r4_30000__0672(void)

{
  FUN_M70_r4_30000__3442();
  FUN_M70_r4_30000__0bd2();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__067d @ M70_r4_30000::067d =====

void __h3000 FUN_M70_r4_30000__067d(void)

{
  FUN_M70_r4_30000__14d7();
  FUN_M70_r4_30000__0ab5();
  API_FE10();
  return;
}


// ===== FUN_M70_r4_30000__0688 @ M70_r4_30000::0688 =====

void __h3000 FUN_M70_r4_30000__0688(void)

{
  FUN_M70_r4_30000__13d3();
  FUN_M70_r4_30000__0ab5();
  API_FE12();
  return;
}


// ===== FUN_M70_r4_30000__0693 @ M70_r4_30000::0693 =====

void __h3000 FUN_M70_r4_30000__0693(void)

{
  FUN_M70_r4_30000__15aa();
  FUN_M70_r4_30000__0ab5();
  API_FE14();
  return;
}


// ===== FUN_M70_r4_30000__069e @ M70_r4_30000::069e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__069e(void)

{
  code *pcVar1;
  undefined2 in_D;
  
  pcVar1 = FUN_M70_r4_30000__06f2 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M70_r4_30000__06c3 + g_moduleBase,&LAB_6600,
           pcVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M70_r4_30000__06c3 @ M70_r4_30000::06c3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x06e3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M70_r4_30000__06c3(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_7174 == 0) {
                    /* inline[API_FC62]: $6013 */
    ModuleStorePtr(6);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x06e3. Too many branches */
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


// ===== FUN_M70_r4_30000__06f2 @ M70_r4_30000::06f2 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M70_r4_30000__06f2(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7184 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7186 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7188 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_718a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_718c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_71a2 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7190 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7192 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7194 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)_DAT_7196 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_719a >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_719c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7084 >> 8));
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(0xc);
  DAT_7174 = 0xffff;
  API_FD76();
  return in_D;
}


// ===== FUN_M70_r4_30000__07f6 @ M70_r4_30000::07f6 =====

void __h3000 FUN_M70_r4_30000__07f6(void)

{
  API_FE18();
  API_FD7C();
  return;
}


// ===== FUN_M70_r4_30000__07ff @ M70_r4_30000::07ff =====

void __h3000 FUN_M70_r4_30000__07ff(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M70_r4_30000__083a @ M70_r4_30000::083a =====

void __h3000 FUN_M70_r4_30000__083a(void)

{
                    /* inline[API_FE02]: [*] " speed  " "program " [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3974 ->$3BF2 ->$3C9C ->$0C04 ->$08A1 ->$0868 */
  SetModuleHandlers();
  FUN_M70_r4_30000__39bf();
  return;
}


// ===== FUN_M70_r4_30000__0868 @ M70_r4_30000::0868 =====

void __h3000 FUN_M70_r4_30000__0868(void)

{
                    /* inline[API_FE02]: "trigger1" "trigger2" "trigger3" "trigger4" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2D0C ->$2DBA ->$2E68 ->$2F16 ->$083A ->$08A1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__08a1 @ M70_r4_30000::08a1 =====

void __h3000 FUN_M70_r4_30000__08a1(void)

{
                    /* inline[API_FE02]: "left mix" "rightmix" " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$10B1 ->$115F ->$08E0 ->$0956 ->$0868 ->$083A */
  SetModuleHandlers();
  DAT_71b4 = FUN_M70_r4_30000__08a1;
  return;
}


// ===== FUN_M70_r4_30000__08e0 @ M70_r4_30000::08e0 =====

void __h3000 FUN_M70_r4_30000__08e0(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$120D ->$1288 ->$0C04 ->$0C04 ->$091B ->$091B */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_71b4 >> 8));
  return;
}


// ===== FUN_M70_r4_30000__091b @ M70_r4_30000::091b =====

void __h3000 FUN_M70_r4_30000__091b(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1303 ->$137E ->$0C04 ->$0C04 ->$08E0 ->$08E0 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_71b4 >> 8));
  return;
}


// ===== FUN_M70_r4_30000__0956 @ M70_r4_30000::0956 =====

void __h3000 FUN_M70_r4_30000__0956(void)

{
                    /* inline[API_FE02]: "triggers" " sweeps " "deglitch" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0998 ->$0AEE ->$0AB5 ->$0C04 ->$0956 ->$0956 */
  SetModuleHandlers();
                    /* inline[API_FC62]: $60E9 */
  ModuleStorePtr((char)((ushort)DAT_71b4 >> 8));
  return;
}


// ===== FUN_M70_r4_30000__0998 @ M70_r4_30000::0998 =====

void __h3000 FUN_M70_r4_30000__0998(void)

{
                    /* inline[API_FE02]: "length 1" "count 1 " "length 2" "count 2 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3651 ->$37BD ->$3707 ->$384D ->$09D1 ->$0A7C */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__09d1 @ M70_r4_30000::09d1 =====

void __h3000 FUN_M70_r4_30000__09d1(void)

{
                    /* inline[API_FE02]: "trig 1a " "trig 1b " "trigger1" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2745 ->$27D0 ->$2D0C ->$0956 ->$0A0A ->$0998 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0a0a @ M70_r4_30000::0a0a =====

void __h3000 FUN_M70_r4_30000__0a0a(void)

{
                    /* inline[API_FE02]: "trig 2a " "trig 2b " "trigger2" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$285B ->$28E6 ->$2DBA ->$0956 ->$0A43 ->$09D1 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0a43 @ M70_r4_30000::0a43 =====

void __h3000 FUN_M70_r4_30000__0a43(void)

{
                    /* inline[API_FE02]: "trig 3a " "trig 3b " "trigger3" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2971 ->$29FC ->$2E68 ->$0956 ->$0A7C ->$0A0A */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0a7c @ M70_r4_30000::0a7c =====

void __h3000 FUN_M70_r4_30000__0a7c(void)

{
                    /* inline[API_FE02]: "trig 4a " "trig 4b " "trigger4" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2A87 ->$2B12 ->$2F16 ->$0956 ->$0998 ->$0A43 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0ab5 @ M70_r4_30000::0ab5 =====

void __h3000 FUN_M70_r4_30000__0ab5(void)

{
                    /* inline[API_FE02]: "low note" "highnote" " source " " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$14FB ->$13F7 ->$15CE ->$0956 ->$0AB5 ->$0AB5 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0aee @ M70_r4_30000::0aee =====

void __h3000 FUN_M70_r4_30000__0aee(void)

{
                    /* inline[API_FE02]: "l coarse" "l fine  " "l delay " "l fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0C0D ->$0C80 ->$0D22 ->$0F5B ->$0B27 ->$0BD2 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0b27 @ M70_r4_30000::0b27 =====

void __h3000 FUN_M70_r4_30000__0b27(void)

{
                    /* inline[API_FE02]: "r coarse" "r fine  " "r delay " "r fdback" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0DA1 ->$0E14 ->$0EB6 ->$1006 ->$0B60 ->$0AEE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0b60 @ M70_r4_30000::0b60 =====

void __h3000 FUN_M70_r4_30000__0b60(void)

{
                    /* inline[API_FE02]: "up1 rate" "up1 max " "dn1 rate" "dn1 min " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$306F ->$321F ->$3147 ->$32F5 ->$0B99 ->$0B27 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0b99 @ M70_r4_30000::0b99 =====

void __h3000 FUN_M70_r4_30000__0b99(void)

{
                    /* inline[API_FE02]: "up2 rate" "up2 max " "dn2 rate" "dn2 min " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$30DB ->$328A ->$31B3 ->$3360 ->$0BD2 ->$0B60 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0bd2 @ M70_r4_30000::0bd2 =====

void __h3000 FUN_M70_r4_30000__0bd2(void)

{
                    /* inline[API_FE02]: "rand1max" "rand2max" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$33CB ->$3436 ->$0C04 ->$0956 ->$0AEE ->$0B99 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M70_r4_30000__0c04 @ M70_r4_30000::0c04 =====

void __h3000 FUN_M70_r4_30000__0c04(void)

{
  return;
}


// ===== MODULE_70_02_entry @ M70_r4_30000::0c0d =====

undefined2 __h3000 MODULE_70_02_entry(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__0c80();
  DAT_60dc = 100;
  DAT_60de = 100;
  return in_D;
}


// ===== FUN_M70_r4_30000__0c68 @ M70_r4_30000::0c68 =====

void __h3000 FUN_M70_r4_30000__0c68(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0CCF ->$0CA4 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__0ccf_M70_r4_30000__0c1e);
  return;
}


// ===== FUN_M70_r4_30000__0c74 @ M70_r4_30000::0c74 =====

void __h3000 FUN_M70_r4_30000__0c74(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0CCF ->$0CA4 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__0ccf_M70_r4_30000__0c1e);
  return;
}


// ===== FUN_M70_r4_30000__0c80 @ M70_r4_30000::0c80 =====

void __h3000 FUN_M70_r4_30000__0c80(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0CCF ->$0CA4 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__0ccf_M70_r4_30000__0c1e);
  return;
}


// ===== FUN_M70_r4_30000__0c8c @ M70_r4_30000::0c8c =====

void __h3000 FUN_M70_r4_30000__0c8c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0CCF ->$0CA4 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__0ccf_M70_r4_30000__0c1e);
  return;
}


// ===== FUN_M70_r4_30000__0c98 @ M70_r4_30000::0c98 =====

void __h3000 FUN_M70_r4_30000__0c98(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0CCF ->$0CA4 $0C74 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__0ccf_M70_r4_30000__0c1e);
  return;
}


// ===== FUN_M70_r4_30000__0ca4 @ M70_r4_30000::0ca4 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__0ca4(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$0CCF ->$0CA4 */
  API_FE6E();
  uVar1 = DAT_7088;
  *(char *)(in_U + -1) = (char)DAT_7088;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_71ba);
  return in_D;
}


// ===== FUN_M70_r4_30000__0ccf @ M70_r4_30000::0ccf =====

undefined2 __h3000 FUN_M70_r4_30000__0ccf(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_702a;
  *(char *)(in_U + -1) = (char)DAT_702a;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCE6();
  puVar3 = (undefined2 *)(puVar2 + -2);
  FUN_M70_r4_30000__187e();
  DAT_7170 = *puVar3;
  puVar3 = puVar3 + 1;
  API_FD52();
  DAT_7088 = *puVar3;
  return in_D;
}


// ===== FUN_M70_r4_30000__0d22 @ M70_r4_30000::0d22 =====

void __h3000 FUN_M70_r4_30000__0d22(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0D7F ->$0D46 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__0d7f_M70_r4_30000__0cfc);
  return;
}


// ===== FUN_M70_r4_30000__0d2e @ M70_r4_30000::0d2e =====

void __h3000 FUN_M70_r4_30000__0d2e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0D7F ->$0D46 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__0d7f_M70_r4_30000__0cfc);
  return;
}


// ===== FUN_M70_r4_30000__0d3a @ M70_r4_30000::0d3a =====

void __h3000 FUN_M70_r4_30000__0d3a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0D7F ->$0D46 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__0d7f_M70_r4_30000__0cfc);
  return;
}


// ===== FUN_M70_r4_30000__0d46 @ M70_r4_30000::0d46 =====

void __h3000 FUN_M70_r4_30000__0d46(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0D7F ->$0D46 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__0d7f_M70_r4_30000__0cfc);
  return;
}


// ===== FUN_M70_r4_30000__0d52 @ M70_r4_30000::0d52 =====

void __h3000 FUN_M70_r4_30000__0d52(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0D7F ->$0D46 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__0d7f_M70_r4_30000__0cfc);
  return;
}


// ===== FUN_M70_r4_30000__0d5e @ M70_r4_30000::0d5e =====

void __h3000 FUN_M70_r4_30000__0d5e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0D7F ->$0D46 $0D3A */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__0d7f_M70_r4_30000__0cfc);
  return;
}


// ===== FUN_M70_r4_30000__0d7f @ M70_r4_30000::0d7f =====

undefined2 __h3000 FUN_M70_r4_30000__0d7f(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  *(undefined1 *)(in_U + -1) = 0x2c;
  *(undefined1 *)(in_U + -2) = 0;
  uVar1 = DAT_7032;
  *(char *)(in_U + -3) = (char)DAT_7032;
  puVar2 = (undefined2 *)(in_U + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_719e = *puVar2;
  FUN_M70_r4_30000__16ac();
  return in_D;
}


// ===== FUN_M70_r4_30000__0da1 @ M70_r4_30000::0da1 =====

undefined2 __h3000 FUN_M70_r4_30000__0da1(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__0e14();
  DAT_60dc = 100;
  DAT_60de = 100;
  return in_D;
}


// ===== FUN_M70_r4_30000__0dfc @ M70_r4_30000::0dfc =====

void __h3000 FUN_M70_r4_30000__0dfc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0E63 ->$0E38 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__0e63_M70_r4_30000__0db2);
  return;
}


// ===== FUN_M70_r4_30000__0e08 @ M70_r4_30000::0e08 =====

void __h3000 FUN_M70_r4_30000__0e08(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0E63 ->$0E38 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__0e63_M70_r4_30000__0db2);
  return;
}


// ===== FUN_M70_r4_30000__0e14 @ M70_r4_30000::0e14 =====

void __h3000 FUN_M70_r4_30000__0e14(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0E63 ->$0E38 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__0e63_M70_r4_30000__0db2);
  return;
}


// ===== FUN_M70_r4_30000__0e20 @ M70_r4_30000::0e20 =====

void __h3000 FUN_M70_r4_30000__0e20(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0E63 ->$0E38 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__0e63_M70_r4_30000__0db2);
  return;
}


// ===== FUN_M70_r4_30000__0e2c @ M70_r4_30000::0e2c =====

void __h3000 FUN_M70_r4_30000__0e2c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0E63 ->$0E38 $0E08 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__0e63_M70_r4_30000__0db2);
  return;
}


// ===== FUN_M70_r4_30000__0e38 @ M70_r4_30000::0e38 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__0e38(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$0E63 ->$0E38 */
  API_FE6E();
  uVar1 = DAT_708a;
  *(char *)(in_U + -1) = (char)DAT_708a;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_71ba);
  return in_D;
}


// ===== FUN_M70_r4_30000__0e63 @ M70_r4_30000::0e63 =====

undefined2 __h3000 FUN_M70_r4_30000__0e63(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_703a;
  *(char *)(in_U + -1) = (char)DAT_703a;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCE6();
  puVar3 = (undefined2 *)(puVar2 + -2);
  FUN_M70_r4_30000__187e();
  DAT_7170 = *puVar3;
  puVar3 = puVar3 + 1;
  API_FD54();
  DAT_708a = *puVar3;
  return in_D;
}


// ===== FUN_M70_r4_30000__0eb6 @ M70_r4_30000::0eb6 =====

void __h3000 FUN_M70_r4_30000__0eb6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F13 ->$0EDA */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__0f13_M70_r4_30000__0e90);
  return;
}


// ===== FUN_M70_r4_30000__0ec2 @ M70_r4_30000::0ec2 =====

void __h3000 FUN_M70_r4_30000__0ec2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F13 ->$0EDA */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__0f13_M70_r4_30000__0e90);
  return;
}


// ===== FUN_M70_r4_30000__0ece @ M70_r4_30000::0ece =====

void __h3000 FUN_M70_r4_30000__0ece(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F13 ->$0EDA */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__0f13_M70_r4_30000__0e90);
  return;
}


// ===== FUN_M70_r4_30000__0eda @ M70_r4_30000::0eda =====

void __h3000 FUN_M70_r4_30000__0eda(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0F13 ->$0EDA */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__0f13_M70_r4_30000__0e90);
  return;
}


// ===== FUN_M70_r4_30000__0ee6 @ M70_r4_30000::0ee6 =====

void __h3000 FUN_M70_r4_30000__0ee6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0F13 ->$0EDA */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__0f13_M70_r4_30000__0e90);
  return;
}


// ===== FUN_M70_r4_30000__0ef2 @ M70_r4_30000::0ef2 =====

void __h3000 FUN_M70_r4_30000__0ef2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0F13 ->$0EDA $0ECE */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__0f13_M70_r4_30000__0e90);
  return;
}


// ===== FUN_M70_r4_30000__0f13 @ M70_r4_30000::0f13 =====

undefined2 __h3000 FUN_M70_r4_30000__0f13(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  *(undefined1 *)(in_U + -1) = 0x2c;
  *(undefined1 *)(in_U + -2) = 0;
  uVar1 = DAT_7042;
  *(char *)(in_U + -3) = (char)DAT_7042;
  puVar2 = (undefined2 *)(in_U + -4);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  DAT_71a0 = *puVar2;
  FUN_M70_r4_30000__16ac();
  return in_D;
}


// ===== FUN_M70_r4_30000__0f5b @ M70_r4_30000::0f5b =====

void __h3000 FUN_M70_r4_30000__0f5b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0FB8 ->$0F7F */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__0fb8_M70_r4_30000__0f35);
  return;
}


// ===== FUN_M70_r4_30000__0f67 @ M70_r4_30000::0f67 =====

void __h3000 FUN_M70_r4_30000__0f67(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0FB8 ->$0F7F */
                    /* inline[API_FDBC]: "5.94...5" */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__0fb8_M70_r4_30000__0f35);
  return;
}


// ===== FUN_M70_r4_30000__0f73 @ M70_r4_30000::0f73 =====

void __h3000 FUN_M70_r4_30000__0f73(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0FB8 ->$0F7F */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__0fb8_M70_r4_30000__0f35);
  return;
}


// ===== FUN_M70_r4_30000__0f7f @ M70_r4_30000::0f7f =====

void __h3000 FUN_M70_r4_30000__0f7f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0FB8 ->$0F7F */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__0fb8_M70_r4_30000__0f35);
  return;
}


// ===== FUN_M70_r4_30000__0f8b @ M70_r4_30000::0f8b =====

void __h3000 FUN_M70_r4_30000__0f8b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0FB8 ->$0F7F */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__0fb8_M70_r4_30000__0f35);
  return;
}


// ===== FUN_M70_r4_30000__0f97 @ M70_r4_30000::0f97 =====

void __h3000 FUN_M70_r4_30000__0f97(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0FB8 ->$0F7F $0F73 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__0fb8_M70_r4_30000__0f35);
  return;
}


// ===== FUN_M70_r4_30000__0fb8 @ M70_r4_30000::0fb8 =====

undefined2 __h3000 FUN_M70_r4_30000__0fb8(void)

{
  undefined2 uVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  API_FE76();
  uVar1 = DAT_705a;
  bVar3 = (byte)DAT_705a;
  *(byte *)(in_U + -1) = bVar3;
  cVar2 = (char)((ushort)uVar1 >> 8);
  *(char *)(in_U + -2) = cVar2;
  DAT_7160 = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6C((char)((ushort)(*psVar4 + DAT_7160) >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__1006 @ M70_r4_30000::1006 =====

void __h3000 FUN_M70_r4_30000__1006(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1063 ->$102A */
  API_FE6A(param_1,param_2,0xfe0);
  return;
}


// ===== FUN_M70_r4_30000__1012 @ M70_r4_30000::1012 =====

void __h3000 FUN_M70_r4_30000__1012(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1063 ->$102A */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,0xfe0);
  return;
}


// ===== FUN_M70_r4_30000__101e @ M70_r4_30000::101e =====

void __h3000 FUN_M70_r4_30000__101e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1063 ->$102A */
  API_FE6C(param_1,param_2,0xfe0);
  return;
}


// ===== FUN_M70_r4_30000__102a @ M70_r4_30000::102a =====

void __h3000 FUN_M70_r4_30000__102a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1063 ->$102A */
  API_FE6E(param_1,param_2,0xfe0);
  return;
}


// ===== FUN_M70_r4_30000__1036 @ M70_r4_30000::1036 =====

void __h3000 FUN_M70_r4_30000__1036(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1063 ->$102A */
  ParamDescriptorCall(param_1,param_2,0xfe0);
  return;
}


// ===== FUN_M70_r4_30000__1042 @ M70_r4_30000::1042 =====

void __h3000 FUN_M70_r4_30000__1042(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1063 ->$102A $101E */
  API_FE1A(param_1,param_2,0xfe0);
  return;
}


// ===== FUN_M70_r4_30000__1063 @ M70_r4_30000::1063 =====

undefined2 __h3000 FUN_M70_r4_30000__1063(void)

{
  undefined2 uVar1;
  char cVar2;
  undefined2 in_D;
  byte bVar3;
  short in_U;
  short *psVar4;
  
  API_FE76();
  uVar1 = DAT_7062;
  bVar3 = (byte)DAT_7062;
  *(byte *)(in_U + -1) = bVar3;
  cVar2 = (char)((ushort)uVar1 >> 8);
  *(char *)(in_U + -2) = cVar2;
  DAT_7160 = CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1);
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar4 = (short *)(in_U + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC74((char)((ushort)(*psVar4 + DAT_7160) >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__10b1 @ M70_r4_30000::10b1 =====

void __h3000 FUN_M70_r4_30000__10b1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$110E ->$10D5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__110e_M70_r4_30000__108b);
  return;
}


// ===== FUN_M70_r4_30000__10bd @ M70_r4_30000::10bd =====

void __h3000 FUN_M70_r4_30000__10bd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$110E ->$10D5 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__110e_M70_r4_30000__108b);
  return;
}


// ===== FUN_M70_r4_30000__10c9 @ M70_r4_30000::10c9 =====

void __h3000 FUN_M70_r4_30000__10c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$110E ->$10D5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__110e_M70_r4_30000__108b);
  return;
}


// ===== FUN_M70_r4_30000__10d5 @ M70_r4_30000::10d5 =====

void __h3000 FUN_M70_r4_30000__10d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$110E ->$10D5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__110e_M70_r4_30000__108b);
  return;
}


// ===== FUN_M70_r4_30000__10e1 @ M70_r4_30000::10e1 =====

void __h3000 FUN_M70_r4_30000__10e1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$110E ->$10D5 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__110e_M70_r4_30000__108b);
  return;
}


// ===== FUN_M70_r4_30000__10ed @ M70_r4_30000::10ed =====

void __h3000 FUN_M70_r4_30000__10ed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$110E ->$10D5 $10C9 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__110e_M70_r4_30000__108b);
  return;
}


// ===== FUN_M70_r4_30000__110e @ M70_r4_30000::110e =====

undefined2 __h3000 FUN_M70_r4_30000__110e(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_704a;
  *(short *)(in_U + -2) = sVar1;
  DAT_7160 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_7160) >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__115f @ M70_r4_30000::115f =====

void __h3000 FUN_M70_r4_30000__115f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$11BC ->$1183 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__11bc_M70_r4_30000__1139);
  return;
}


// ===== FUN_M70_r4_30000__116b @ M70_r4_30000::116b =====

void __h3000 FUN_M70_r4_30000__116b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$11BC ->$1183 */
                    /* inline[API_FDBC]: "5.94...9" */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__11bc_M70_r4_30000__1139);
  return;
}


// ===== FUN_M70_r4_30000__1177 @ M70_r4_30000::1177 =====

void __h3000 FUN_M70_r4_30000__1177(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$11BC ->$1183 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__11bc_M70_r4_30000__1139);
  return;
}


// ===== FUN_M70_r4_30000__1183 @ M70_r4_30000::1183 =====

void __h3000 FUN_M70_r4_30000__1183(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$11BC ->$1183 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__11bc_M70_r4_30000__1139);
  return;
}


// ===== FUN_M70_r4_30000__118f @ M70_r4_30000::118f =====

void __h3000 FUN_M70_r4_30000__118f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$11BC ->$1183 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__11bc_M70_r4_30000__1139);
  return;
}


// ===== FUN_M70_r4_30000__119b @ M70_r4_30000::119b =====

void __h3000 FUN_M70_r4_30000__119b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$11BC ->$1183 $1177 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__11bc_M70_r4_30000__1139);
  return;
}


// ===== FUN_M70_r4_30000__11bc @ M70_r4_30000::11bc =====

undefined2 __h3000 FUN_M70_r4_30000__11bc(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_7052;
  *(short *)(in_U + -2) = sVar1;
  DAT_7160 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC72((char)((ushort)(*psVar2 + DAT_7160) >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__120d @ M70_r4_30000::120d =====

void __h3000 FUN_M70_r4_30000__120d(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__1252_M70_r4_30000__11e7);
  return;
}


// ===== FUN_M70_r4_30000__1219 @ M70_r4_30000::1219 =====

void __h3000 FUN_M70_r4_30000__1219(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1252 ->$1231 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__1252_M70_r4_30000__11e7);
  return;
}


// ===== FUN_M70_r4_30000__1225 @ M70_r4_30000::1225 =====

void __h3000 FUN_M70_r4_30000__1225(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__1252_M70_r4_30000__11e7);
  return;
}


// ===== FUN_M70_r4_30000__1231 @ M70_r4_30000::1231 =====

void __h3000 FUN_M70_r4_30000__1231(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__1252_M70_r4_30000__11e7);
  return;
}


// ===== FUN_M70_r4_30000__1252 @ M70_r4_30000::1252 =====

undefined2 __h3000 FUN_M70_r4_30000__1252(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M70_r4_30000__1252_M70_r4_30000__11e7);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1288 @ M70_r4_30000::1288 =====

void __h3000 FUN_M70_r4_30000__1288(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__12cd_M70_r4_30000__1262);
  return;
}


// ===== FUN_M70_r4_30000__1294 @ M70_r4_30000::1294 =====

void __h3000 FUN_M70_r4_30000__1294(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$12CD ->$12AC */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__12cd_M70_r4_30000__1262);
  return;
}


// ===== FUN_M70_r4_30000__12a0 @ M70_r4_30000::12a0 =====

void __h3000 FUN_M70_r4_30000__12a0(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__12cd_M70_r4_30000__1262);
  return;
}


// ===== FUN_M70_r4_30000__12ac @ M70_r4_30000::12ac =====

void __h3000 FUN_M70_r4_30000__12ac(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__12cd_M70_r4_30000__1262);
  return;
}


// ===== FUN_M70_r4_30000__12cd @ M70_r4_30000::12cd =====

undefined2 __h3000 FUN_M70_r4_30000__12cd(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M70_r4_30000__12cd_M70_r4_30000__1262);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1303 @ M70_r4_30000::1303 =====

void __h3000 FUN_M70_r4_30000__1303(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__1348_M70_r4_30000__12dd);
  return;
}


// ===== FUN_M70_r4_30000__130f @ M70_r4_30000::130f =====

void __h3000 FUN_M70_r4_30000__130f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1348 ->$1327 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__1348_M70_r4_30000__12dd);
  return;
}


// ===== FUN_M70_r4_30000__131b @ M70_r4_30000::131b =====

void __h3000 FUN_M70_r4_30000__131b(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__1348_M70_r4_30000__12dd);
  return;
}


// ===== FUN_M70_r4_30000__1327 @ M70_r4_30000::1327 =====

void __h3000 FUN_M70_r4_30000__1327(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__1348_M70_r4_30000__12dd);
  return;
}


// ===== FUN_M70_r4_30000__1348 @ M70_r4_30000::1348 =====

undefined2 __h3000 FUN_M70_r4_30000__1348(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M70_r4_30000__1348_M70_r4_30000__12dd);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__137e @ M70_r4_30000::137e =====

void __h3000 FUN_M70_r4_30000__137e(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__13c3_M70_r4_30000__1358);
  return;
}


// ===== FUN_M70_r4_30000__138a @ M70_r4_30000::138a =====

void __h3000 FUN_M70_r4_30000__138a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$13C3 ->$13A2 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__13c3_M70_r4_30000__1358);
  return;
}


// ===== FUN_M70_r4_30000__1396 @ M70_r4_30000::1396 =====

void __h3000 FUN_M70_r4_30000__1396(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__13c3_M70_r4_30000__1358);
  return;
}


// ===== FUN_M70_r4_30000__13a2 @ M70_r4_30000::13a2 =====

void __h3000 FUN_M70_r4_30000__13a2(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__13c3_M70_r4_30000__1358);
  return;
}


// ===== FUN_M70_r4_30000__13c3 @ M70_r4_30000::13c3 =====

undefined2 __h3000 FUN_M70_r4_30000__13c3(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M70_r4_30000__13c3_M70_r4_30000__1358);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__13d3 @ M70_r4_30000::13d3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__13d3(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7080 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M70_r4_30000__14d3();
  API_FC80((char)((ushort)DAT_7080 >> 8),(char)DAT_7080,param_1,0x77);
  return in_D;
}


// ===== FUN_M70_r4_30000__13f7 @ M70_r4_30000::13f7 =====

undefined2 __h3000 FUN_M70_r4_30000__13f7(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_7080;
  FUN_M70_r4_30000__07ff();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$1473 ->$1447
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M70_r4_30000__1473();
  FUN_M70_r4_30000__1577();
  return in_D;
}


// ===== FUN_M70_r4_30000__1447 @ M70_r4_30000::1447 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__1447(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_7080 = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x77);
  API_FE40((char)((ushort)DAT_7080 >> 8),(char)DAT_7080,param_1,0x2a);
  FUN_M70_r4_30000__1473();
  FUN_M70_r4_30000__1577();
  FUN_M70_r4_30000__14d3();
  return in_D;
}


// ===== FUN_M70_r4_30000__1473 @ M70_r4_30000::1473 =====

void __h3000 FUN_M70_r4_30000__1473(void)

{
  LcdSetCursor();
  if (DAT_7080 == 0) {
                    /* inline[API_FC38]: "C4" */
    LcdPrintInline();
  }
  else if (DAT_7080 == 1) {
                    /* inline[API_FC38]: "C5" */
    LcdPrintInline();
  }
  else if (DAT_7080 == 2) {
                    /* inline[API_FC38]: "C6" */
    LcdPrintInline();
  }
  else if (DAT_7080 == 3) {
                    /* inline[API_FC38]: "C7" */
    LcdPrintInline();
  }
  else {
                    /* inline[API_FC38]: "C8" */
    LcdPrintInline();
  }
  return;
}


// ===== FUN_M70_r4_30000__14d3 @ M70_r4_30000::14d3 =====

void __h3000 FUN_M70_r4_30000__14d3(void)

{
  FUN_M70_r4_30000__159b();
  return;
}


// ===== FUN_M70_r4_30000__14d7 @ M70_r4_30000::14d7 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__14d7(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_707e = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M70_r4_30000__159b();
  API_FC80((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_1,0x76);
  return in_D;
}


// ===== FUN_M70_r4_30000__14fb @ M70_r4_30000::14fb =====

undefined2 __h3000 FUN_M70_r4_30000__14fb(void)

{
  undefined2 in_D;
  
  DAT_6074 = DAT_707e;
  FUN_M70_r4_30000__07ff();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       range=      thru    " */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$1577 ->$154B
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M70_r4_30000__1577();
  FUN_M70_r4_30000__1473();
  return in_D;
}


// ===== FUN_M70_r4_30000__154b @ M70_r4_30000::154b =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__154b(undefined2 param_1)

{
  undefined2 in_D;
  
  DAT_707e = DAT_6062;
  API_FC80((char)((ushort)DAT_6062 >> 8),(char)DAT_6062,param_1,0x76);
  API_FE40((char)((ushort)DAT_707e >> 8),(char)DAT_707e,param_1,0x29);
  FUN_M70_r4_30000__1577();
  FUN_M70_r4_30000__1473();
  FUN_M70_r4_30000__159b();
  return in_D;
}


// ===== FUN_M70_r4_30000__1577 @ M70_r4_30000::1577 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M70_r4_30000__1577(void)

{
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M70_r4_30000__1b52 +
                          g_moduleBase + ((DAT_7080 & 0xff) * 0xc + 2 + DAT_707e & 0xff) * 4) >> 8),
           4,&UNK_M70_r4_30000__1b52 +
             g_moduleBase + ((DAT_7080 & 0xff) * 0xc + 2 + DAT_707e & 0xff) * 4);
  return;
}


// ===== FUN_M70_r4_30000__159b @ M70_r4_30000::159b =====

undefined2 __h3000 FUN_M70_r4_30000__159b(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__16ac();
  API_FD3C((char)((ushort)DAT_71b2 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__15aa @ M70_r4_30000::15aa =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__15aa(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_7082 = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M70_r4_30000__168e();
  API_FC80((char)((ushort)DAT_7082 >> 8),(char)DAT_7082,param_1,0x78);
  return in_D;
}


// ===== FUN_M70_r4_30000__15ce @ M70_r4_30000::15ce =====

void __h3000 FUN_M70_r4_30000__15ce(void)

{
  DAT_6074 = DAT_7082;
  FUN_M70_r4_30000__07ff();
  LcdSetCursor();
                    /* inline[API_FC38]: "
                       polyphonic-                   -solo" */
  LcdPrintInline();
                    /* inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$164B ->$1626
                       $0005 $0005 $0000 */
  SetupParamEditPage();
  FUN_M70_r4_30000__164b();
  return;
}


// ===== FUN_M70_r4_30000__1626 @ M70_r4_30000::1626 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M70_r4_30000__1626(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  DAT_7082 = DAT_6074;
  API_FC80((char)((ushort)DAT_6074 >> 8),(char)DAT_6074,param_3,0x78);
  API_FE40((char)((ushort)DAT_7082 >> 8),(char)DAT_7082,param_3,0x2b);
  FUN_M70_r4_30000__168e();
  FUN_M70_r4_30000__164b();
  return;
}


// ===== FUN_M70_r4_30000__164b @ M70_r4_30000::164b =====

undefined2 __h3000 FUN_M70_r4_30000__164b(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                   " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_7082 + -5;
  *(undefined1 *)(in_U + -3) = 5;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  LcdSetCursor((char)((ushort)(*psVar1 + 0x10) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M70_r4_30000__168e @ M70_r4_30000::168e =====

undefined2 __h3000 FUN_M70_r4_30000__168e(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  uVar1 = DAT_7082;
  *(char *)(in_U + -1) = (char)DAT_7082;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0x47;
  puVar2 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar2 = 1;
  API_FCEE();
  DAT_71a2 = *puVar2;
  DAT_7174 = 0;
  return in_D;
}


// ===== FUN_M70_r4_30000__16ac @ M70_r4_30000::16ac =====

undefined2 __h3000 FUN_M70_r4_30000__16ac(void)

{
  undefined2 uVar1;
  undefined2 *puVar2;
  ushort uVar3;
  short sVar4;
  undefined2 in_D;
  short in_U;
  short *psVar5;
  ushort *puVar6;
  
  uVar1 = *(undefined2 *)(&UNK_M70_r4_30000__1d02 + g_moduleBase + (DAT_707e & 0xff) * 2);
  DAT_7190 = uVar1;
  *(char *)(in_U + -1) = (char)uVar1;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(in_U + -3) = 0xff;
  psVar5 = (short *)(in_U + -4);
  *(undefined1 *)psVar5 = 0xff;
  API_FCDE();
  uVar1 = DAT_7190;
  DAT_7192 = *psVar5 + -2;
  if (DAT_7080 == 0) {
    DAT_7194 = 0x10;
  }
  else if (DAT_7080 == 1) {
    DAT_7194 = 8;
  }
  else if (DAT_7080 == 2) {
    DAT_7194 = 4;
  }
  else {
    if (DAT_7080 != 3) {
      DAT_7194 = 1;
      goto LAB_M70_r4_30000__174d;
    }
    DAT_7194 = 2;
  }
  puVar2 = (undefined2 *)(&UNK_M70_r4_30000__1d7a + g_moduleBase + (DAT_7080 & 0xff) * 10);
  DAT_7184 = *puVar2;
  DAT_7186 = puVar2[1];
  DAT_7188 = puVar2[2];
  DAT_718a = puVar2[3];
  DAT_718c = puVar2[4];
LAB_M70_r4_30000__174d:
  DAT_7160 = (DAT_7080 & 0xff) * 0x30;
  DAT_71b0 = *(short *)(&UNK_M70_r4_30000__1a62 +
                       g_moduleBase + (0x2e - DAT_707e & 0xfffc) + DAT_7160);
  DAT_71ae = *(short *)((short)(&UNK_M70_r4_30000__1a62 +
                               g_moduleBase + (0x2e - DAT_707e & 0xfffc) + DAT_7160) + 2);
  *(char *)((short)psVar5 + 1) = (char)DAT_7190;
  *(char *)psVar5 = (char)((ushort)uVar1 >> 8);
  uVar3 = (ushort)DAT_7194 >> 8;
  *(char *)((short)psVar5 + -1) = (char)DAT_7194 << 1;
  puVar6 = (ushort *)(psVar5 + -1);
  *(char *)puVar6 = (char)uVar3;
  API_FCF0();
  uVar1 = DAT_7032;
  DAT_7160 = puVar6[1];
  *(char *)((short)puVar6 + 3) = (char)DAT_7032;
  *(char *)(puVar6 + 1) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)puVar6 + 1) = 0x2c;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  uVar1 = DAT_7042;
  DAT_7162 = *puVar6;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_7162 <= (ushort)(DAT_71ae - DAT_71b0) || DAT_71ae - DAT_71b0 < (short)DAT_7162)) {
    DAT_719a = (DAT_7160 + DAT_7162) - DAT_71ae;
  }
  else {
    DAT_719a = DAT_7160 - DAT_71b0;
  }
  *(char *)((short)puVar6 + 1) = (char)DAT_7042;
  *(char *)puVar6 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)puVar6 + -1) = 0x2c;
  puVar6 = puVar6 + -1;
  *(undefined1 *)puVar6 = 0;
  API_FCEE();
  sVar4 = DAT_7192;
  DAT_7162 = *puVar6;
  if ((*(char *)puVar6 < '\0') ||
     (DAT_7162 <= (ushort)(DAT_71ae - DAT_71b0) || DAT_71ae - DAT_71b0 < (short)DAT_7162)) {
    DAT_719c = (DAT_7160 + DAT_7162) - DAT_71ae;
  }
  else {
    DAT_719c = DAT_7160 - DAT_71b0;
  }
  *(char *)((short)puVar6 + 1) = (char)DAT_7192;
  *(char *)puVar6 = (char)((ushort)sVar4 >> 8);
  uVar1 = DAT_7194;
  *(char *)((short)puVar6 + -1) = (char)DAT_7194;
  puVar6 = puVar6 + -1;
  *(char *)puVar6 = (char)((ushort)uVar1 >> 8);
  API_FCF0();
  *(undefined1 *)((short)puVar6 + 1) = 0xff;
  *(undefined1 *)puVar6 = 0xff;
  API_FCDE();
  DAT_7160 = *puVar6;
  DAT_7090 = DAT_7160 + DAT_719e;
  DAT_7094 = DAT_7160 + DAT_71a0;
  DAT_71b2 = DAT_7160;
  *(undefined1 *)((short)puVar6 + 1) = 0xff;
  *(undefined1 *)puVar6 = 0x7f;
  uVar3 = DAT_7160;
  *(char *)((short)puVar6 + -1) = (char)DAT_7160;
  puVar6 = puVar6 + -1;
  *(char *)puVar6 = (char)(uVar3 >> 8);
  API_FCEA();
  DAT_708e = *puVar6 + 5;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_708e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7094 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7090 >> 8));
  DAT_7174 = 0;
  return in_D;
}


// ===== FUN_M70_r4_30000__187e @ M70_r4_30000::187e =====

undefined2 __h3000 FUN_M70_r4_30000__187e(void)

{
  undefined2 uVar1;
  ushort uVar2;
  undefined *puVar3;
  undefined2 in_D;
  short sVar4;
  byte extraout_CC;
  undefined2 *puVar5;
  short *in_U;
  
  DAT_7162 = *in_U;
  DAT_7166 = in_U[1];
  uVar2 = (DAT_7166 + 0x18) * 2 + g_moduleBase;
  puVar3 = &DAT_M70_r4_30000__18fc;
  if (DAT_7162 < 0 || uVar2 < 0xe704) {
    sVar4 = -DAT_7162;
  }
  else {
    sVar4 = 100 - DAT_7162;
    puVar3 = &DAT_M70_r4_30000__18fe;
  }
  puVar5 = (undefined2 *)(puVar3 + uVar2);
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) +
          g_moduleBase;
  uVar1 = *puVar5;
  DAT_7164 = DAT_7162;
  *(char *)((short)in_U + 3) = (char)uVar1;
  *(char *)(in_U + 1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M70_r4_30000__1996 + sVar4);
  *(char *)((short)in_U + 1) = (char)uVar1;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  sVar4 = DAT_7162;
  if (!(bool)(extraout_CC & 1 & -1 < DAT_7162)) {
    sVar4 = DAT_7162 + 100;
  }
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) +
          g_moduleBase;
  uVar1 = puVar5[0x26];
  *(char *)((short)in_U + -1) = (char)uVar1;
  *(char *)(in_U + -1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M70_r4_30000__1996 + sVar4);
  *(char *)((short)in_U + -3) = (char)uVar1;
  in_U = in_U + -2;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7160 = *in_U;
  *in_U = 0x1000 - DAT_7160;
  return in_D;
}


// ===== MODULE_70_03_entry @ M70_r4_30000::1daa =====

void __h3000 MODULE_70_03_entry(void)

{
  return;
}


// ===== FUN_M70_r4_30000__1dac @ M70_r4_30000::1dac =====

undefined2 __h3000 FUN_M70_r4_30000__1dac(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "-----------------" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1dc7 @ M70_r4_30000::1dc7 =====

undefined2 __h3000 FUN_M70_r4_30000__1dc7(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rnd stutter left " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1de2 @ M70_r4_30000::1de2 =====

undefined2 __h3000 FUN_M70_r4_30000__1de2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rnd stutter right" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1dfd @ M70_r4_30000::1dfd =====

undefined2 __h3000 FUN_M70_r4_30000__1dfd(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rnd stutter both " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1e18 @ M70_r4_30000::1e18 =====

void __h3000 FUN_M70_r4_30000__1e18(void)

{
  FUN_M70_r4_30000__1e2d(0);
  return;
}


// ===== FUN_M70_r4_30000__1e1f @ M70_r4_30000::1e1f =====

void __h3000 FUN_M70_r4_30000__1e1f(void)

{
  FUN_M70_r4_30000__1e2d(0);
  return;
}


// ===== FUN_M70_r4_30000__1e26 @ M70_r4_30000::1e26 =====

void __h3000 FUN_M70_r4_30000__1e26(void)

{
  FUN_M70_r4_30000__1e2d(0);
  return;
}


// ===== FUN_M70_r4_30000__1e2d @ M70_r4_30000::1e2d =====

undefined2 __h3000 FUN_M70_r4_30000__1e2d(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_713e = in_D;
  FUN_M70_r4_30000__2511();
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__1e36 @ M70_r4_30000::1e36 =====

undefined2 __h3000 FUN_M70_r4_30000__1e36(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "stutter 1 left   " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1e51 @ M70_r4_30000::1e51 =====

undefined2 __h3000 FUN_M70_r4_30000__1e51(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "stutter 1 right  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1e6c @ M70_r4_30000::1e6c =====

undefined2 __h3000 FUN_M70_r4_30000__1e6c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "stutter 1 both   " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1e87 @ M70_r4_30000::1e87 =====

void __h3000 FUN_M70_r4_30000__1e87(void)

{
  FUN_M70_r4_30000__1e9c(0);
  return;
}


// ===== FUN_M70_r4_30000__1e8e @ M70_r4_30000::1e8e =====

void __h3000 FUN_M70_r4_30000__1e8e(void)

{
  FUN_M70_r4_30000__1e9c(0);
  return;
}


// ===== FUN_M70_r4_30000__1e95 @ M70_r4_30000::1e95 =====

void __h3000 FUN_M70_r4_30000__1e95(void)

{
  FUN_M70_r4_30000__1e9c(0);
  return;
}


// ===== FUN_M70_r4_30000__1e9c @ M70_r4_30000::1e9c =====

undefined2 __h3000 FUN_M70_r4_30000__1e9c(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_713a = in_D;
  FUN_M70_r4_30000__25db();
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__1ea5 @ M70_r4_30000::1ea5 =====

undefined2 __h3000 FUN_M70_r4_30000__1ea5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "stutter 2 left   " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1ec0 @ M70_r4_30000::1ec0 =====

undefined2 __h3000 FUN_M70_r4_30000__1ec0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "stutter 2 right  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1edb @ M70_r4_30000::1edb =====

undefined2 __h3000 FUN_M70_r4_30000__1edb(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "stutter 2 both   " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1ef6 @ M70_r4_30000::1ef6 =====

void __h3000 FUN_M70_r4_30000__1ef6(void)

{
  FUN_M70_r4_30000__1f0b(0);
  return;
}


// ===== FUN_M70_r4_30000__1efd @ M70_r4_30000::1efd =====

void __h3000 FUN_M70_r4_30000__1efd(void)

{
  FUN_M70_r4_30000__1f0b(0);
  return;
}


// ===== FUN_M70_r4_30000__1f04 @ M70_r4_30000::1f04 =====

void __h3000 FUN_M70_r4_30000__1f04(void)

{
  FUN_M70_r4_30000__1f0b(0);
  return;
}


// ===== FUN_M70_r4_30000__1f0b @ M70_r4_30000::1f0b =====

undefined2 __h3000 FUN_M70_r4_30000__1f0b(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_713c = in_D;
  FUN_M70_r4_30000__267d();
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__1f14 @ M70_r4_30000::1f14 =====

undefined2 __h3000 FUN_M70_r4_30000__1f14(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep up 1 left  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1f2f @ M70_r4_30000::1f2f =====

undefined2 __h3000 FUN_M70_r4_30000__1f2f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep up 1 right " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1f4a @ M70_r4_30000::1f4a =====

undefined2 __h3000 FUN_M70_r4_30000__1f4a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep up 1 both  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1f65 @ M70_r4_30000::1f65 =====

void __h3000 FUN_M70_r4_30000__1f65(void)

{
  FUN_M70_r4_30000__1f7a(0);
  return;
}


// ===== FUN_M70_r4_30000__1f6c @ M70_r4_30000::1f6c =====

void __h3000 FUN_M70_r4_30000__1f6c(void)

{
  FUN_M70_r4_30000__1f7a(0);
  return;
}


// ===== FUN_M70_r4_30000__1f73 @ M70_r4_30000::1f73 =====

void __h3000 FUN_M70_r4_30000__1f73(void)

{
  FUN_M70_r4_30000__1f7a(0);
  return;
}


// ===== FUN_M70_r4_30000__1f7a @ M70_r4_30000::1f7a =====

undefined2 __h3000 FUN_M70_r4_30000__1f7a(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_712a = in_D;
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x23);
  API_FCC4(0);
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__1f90 @ M70_r4_30000::1f90 =====

undefined2 __h3000 FUN_M70_r4_30000__1f90(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep dwn 1 left " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1fab @ M70_r4_30000::1fab =====

undefined2 __h3000 FUN_M70_r4_30000__1fab(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep dwn 1 right" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1fc6 @ M70_r4_30000::1fc6 =====

undefined2 __h3000 FUN_M70_r4_30000__1fc6(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep dwn 1 both " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__1fe1 @ M70_r4_30000::1fe1 =====

void __h3000 FUN_M70_r4_30000__1fe1(void)

{
  FUN_M70_r4_30000__1ff6(0);
  return;
}


// ===== FUN_M70_r4_30000__1fe8 @ M70_r4_30000::1fe8 =====

void __h3000 FUN_M70_r4_30000__1fe8(void)

{
  FUN_M70_r4_30000__1ff6(0);
  return;
}


// ===== FUN_M70_r4_30000__1fef @ M70_r4_30000::1fef =====

void __h3000 FUN_M70_r4_30000__1fef(void)

{
  FUN_M70_r4_30000__1ff6(0);
  return;
}


// ===== FUN_M70_r4_30000__1ff6 @ M70_r4_30000::1ff6 =====

undefined2 __h3000 FUN_M70_r4_30000__1ff6(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_712c = in_D;
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x23);
  API_FCC4(0);
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__200c @ M70_r4_30000::200c =====

undefined2 __h3000 FUN_M70_r4_30000__200c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "zero sweep1 left " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2027 @ M70_r4_30000::2027 =====

undefined2 __h3000 FUN_M70_r4_30000__2027(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "zero sweep1 right" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2042 @ M70_r4_30000::2042 =====

undefined2 __h3000 FUN_M70_r4_30000__2042(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "zero sweep1 both " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__205d @ M70_r4_30000::205d =====

void __h3000 FUN_M70_r4_30000__205d(void)

{
  FUN_M70_r4_30000__2072(0);
  return;
}


// ===== FUN_M70_r4_30000__2064 @ M70_r4_30000::2064 =====

void __h3000 FUN_M70_r4_30000__2064(void)

{
  FUN_M70_r4_30000__2072(0);
  return;
}


// ===== FUN_M70_r4_30000__206b @ M70_r4_30000::206b =====

void __h3000 FUN_M70_r4_30000__206b(void)

{
  FUN_M70_r4_30000__2072(0);
  return;
}


// ===== FUN_M70_r4_30000__2072 @ M70_r4_30000::2072 =====

undefined2 __h3000 FUN_M70_r4_30000__2072(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_7132 = in_D;
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__23e8();
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__2084 @ M70_r4_30000::2084 =====

undefined2 __h3000 FUN_M70_r4_30000__2084(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep up 2 left  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__209f @ M70_r4_30000::209f =====

undefined2 __h3000 FUN_M70_r4_30000__209f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep up 2 right " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__20ba @ M70_r4_30000::20ba =====

undefined2 __h3000 FUN_M70_r4_30000__20ba(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep up 2 both  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__20d5 @ M70_r4_30000::20d5 =====

void __h3000 FUN_M70_r4_30000__20d5(void)

{
  FUN_M70_r4_30000__20ea(0);
  return;
}


// ===== FUN_M70_r4_30000__20dc @ M70_r4_30000::20dc =====

void __h3000 FUN_M70_r4_30000__20dc(void)

{
  FUN_M70_r4_30000__20ea(0);
  return;
}


// ===== FUN_M70_r4_30000__20e3 @ M70_r4_30000::20e3 =====

void __h3000 FUN_M70_r4_30000__20e3(void)

{
  FUN_M70_r4_30000__20ea(0);
  return;
}


// ===== FUN_M70_r4_30000__20ea @ M70_r4_30000::20ea =====

undefined2 __h3000 FUN_M70_r4_30000__20ea(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_712e = in_D;
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x23);
  API_FCC2(0);
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__2100 @ M70_r4_30000::2100 =====

undefined2 __h3000 FUN_M70_r4_30000__2100(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep dwn 2 left " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__211b @ M70_r4_30000::211b =====

undefined2 __h3000 FUN_M70_r4_30000__211b(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep dwn 2 right" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2136 @ M70_r4_30000::2136 =====

undefined2 __h3000 FUN_M70_r4_30000__2136(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep dwn 2 both " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2151 @ M70_r4_30000::2151 =====

void __h3000 FUN_M70_r4_30000__2151(void)

{
  FUN_M70_r4_30000__2166(0);
  return;
}


// ===== FUN_M70_r4_30000__2158 @ M70_r4_30000::2158 =====

void __h3000 FUN_M70_r4_30000__2158(void)

{
  FUN_M70_r4_30000__2166(0);
  return;
}


// ===== FUN_M70_r4_30000__215f @ M70_r4_30000::215f =====

void __h3000 FUN_M70_r4_30000__215f(void)

{
  FUN_M70_r4_30000__2166(0);
  return;
}


// ===== FUN_M70_r4_30000__2166 @ M70_r4_30000::2166 =====

undefined2 __h3000 FUN_M70_r4_30000__2166(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_7130 = in_D;
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x24);
  API_FCC2(0);
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__217c @ M70_r4_30000::217c =====

undefined2 __h3000 FUN_M70_r4_30000__217c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "zero swp 2 left  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2197 @ M70_r4_30000::2197 =====

undefined2 __h3000 FUN_M70_r4_30000__2197(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "zero swp 2 right " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__21b2 @ M70_r4_30000::21b2 =====

undefined2 __h3000 FUN_M70_r4_30000__21b2(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "zero swp 2 both  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__21cd @ M70_r4_30000::21cd =====

void __h3000 FUN_M70_r4_30000__21cd(void)

{
  FUN_M70_r4_30000__21e2(0);
  return;
}


// ===== FUN_M70_r4_30000__21d4 @ M70_r4_30000::21d4 =====

void __h3000 FUN_M70_r4_30000__21d4(void)

{
  FUN_M70_r4_30000__21e2(0);
  return;
}


// ===== FUN_M70_r4_30000__21db @ M70_r4_30000::21db =====

void __h3000 FUN_M70_r4_30000__21db(void)

{
  FUN_M70_r4_30000__21e2(0);
  return;
}


// ===== FUN_M70_r4_30000__21e2 @ M70_r4_30000::21e2 =====

undefined2 __h3000 FUN_M70_r4_30000__21e2(void)

{
  undefined2 in_D;
  undefined2 in_stack_00000000;
  
  DAT_7134 = in_D;
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__2469();
  return in_stack_00000000;
}


// ===== FUN_M70_r4_30000__21f4 @ M70_r4_30000::21f4 =====

undefined2 __h3000 FUN_M70_r4_30000__21f4(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rand swp 1 left  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__220f @ M70_r4_30000::220f =====

undefined2 __h3000 FUN_M70_r4_30000__220f(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rand swp 1 right " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__222a @ M70_r4_30000::222a =====

undefined2 __h3000 FUN_M70_r4_30000__222a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rand swp 1 both  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2245 @ M70_r4_30000::2245 =====

undefined2 __h3000 FUN_M70_r4_30000__2245(void)

{
  undefined2 in_D;
  
  DAT_7136 = 0;
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__247a();
  return in_D;
}


// ===== FUN_M70_r4_30000__224c @ M70_r4_30000::224c =====

undefined2 __h3000 FUN_M70_r4_30000__224c(void)

{
  undefined2 in_D;
  
  DAT_7136 = 1;
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__247a();
  return in_D;
}


// ===== FUN_M70_r4_30000__2253 @ M70_r4_30000::2253 =====

undefined2 __h3000 FUN_M70_r4_30000__2253(void)

{
  undefined2 in_D;
  
  DAT_7136 = 2;
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__247a();
  return in_D;
}


// ===== FUN_M70_r4_30000__226a @ M70_r4_30000::226a =====

undefined2 __h3000 FUN_M70_r4_30000__226a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rand swp 2 left  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2285 @ M70_r4_30000::2285 =====

undefined2 __h3000 FUN_M70_r4_30000__2285(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rand swp 2 right " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__22a0 @ M70_r4_30000::22a0 =====

undefined2 __h3000 FUN_M70_r4_30000__22a0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "rand swp 2 both  " */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__22bb @ M70_r4_30000::22bb =====

undefined2 __h3000 FUN_M70_r4_30000__22bb(void)

{
  undefined2 in_D;
  
  DAT_7138 = 0;
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__249e();
  return in_D;
}


// ===== FUN_M70_r4_30000__22c2 @ M70_r4_30000::22c2 =====

undefined2 __h3000 FUN_M70_r4_30000__22c2(void)

{
  undefined2 in_D;
  
  DAT_7138 = 1;
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__249e();
  return in_D;
}


// ===== FUN_M70_r4_30000__22c9 @ M70_r4_30000::22c9 =====

undefined2 __h3000 FUN_M70_r4_30000__22c9(void)

{
  undefined2 in_D;
  
  DAT_7138 = 2;
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__249e();
  return in_D;
}


// ===== FUN_M70_r4_30000__22e0 @ M70_r4_30000::22e0 =====

undefined2 __h3000 FUN_M70_r4_30000__22e0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep l up-r down" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__22fb @ M70_r4_30000::22fb =====

undefined2 __h3000 FUN_M70_r4_30000__22fb(void)

{
  undefined2 in_D;
  
  DAT_712a = 0;
  DAT_7130 = 1;
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x23);
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x24);
  API_FCC4(0);
  API_FCC2(0);
  return in_D;
}


// ===== FUN_M70_r4_30000__232c @ M70_r4_30000::232c =====

undefined2 __h3000 FUN_M70_r4_30000__232c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
                    /* inline[API_FC38]: "sweep r up-l down" */
  LcdPrintInline();
  return uStack_8;
}


// ===== FUN_M70_r4_30000__2347 @ M70_r4_30000::2347 =====

undefined2 __h3000 FUN_M70_r4_30000__2347(void)

{
  undefined2 in_D;
  
  DAT_712c = 0;
  DAT_712e = 1;
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x23);
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x23);
  API_FCC4(0);
  API_FCC2(0);
  return in_D;
}


// ===== FUN_M70_r4_30000__2378 @ M70_r4_30000::2378 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__2378(void)

{
  bool bVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar3;
  
  bVar1 = SCARRY2(DAT_70b0,DAT_7140);
  DAT_70b0 = DAT_70b0 + DAT_7140;
  if (bVar1) {
    DAT_70b0 = 0;
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_712a >> 8));
  }
  else {
    *(short *)(in_U + -2) = DAT_70b0;
    uVar2 = DAT_7142;
    *(char *)(in_U + -3) = (char)DAT_7142;
    puVar3 = (undefined2 *)(in_U + -4);
    *(char *)puVar3 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_712a >> 8),(char)DAT_712a,*puVar3);
    API_FCC4(0);
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__23b0 @ M70_r4_30000::23b0 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__23b0(void)

{
  bool bVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar3;
  
  bVar1 = SBORROW2(DAT_70b0,DAT_7144);
  DAT_70b0 = DAT_70b0 - DAT_7144;
  if (bVar1) {
    DAT_70b0 = 0;
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_712c >> 8));
  }
  else {
    *(short *)(in_U + -2) = DAT_70b0;
    uVar2 = DAT_7146;
    *(char *)(in_U + -3) = (char)DAT_7146;
    puVar3 = (undefined2 *)(in_U + -4);
    *(char *)puVar3 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_712c >> 8),(char)DAT_712c,*puVar3);
    API_FCC4(0);
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__23e8 @ M70_r4_30000::23e8 =====

undefined2 __h3000 FUN_M70_r4_30000__23e8(void)

{
  undefined2 in_D;
  
  DAT_70b0 = 0;
  FUN_M70_r4_30000__24c2((char)((ushort)DAT_7132 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__23f9 @ M70_r4_30000::23f9 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__23f9(void)

{
  bool bVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar3;
  
  bVar1 = SCARRY2(DAT_70ba,DAT_7148);
  DAT_70ba = DAT_70ba + DAT_7148;
  if (bVar1) {
    DAT_70ba = 0;
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_712e >> 8));
  }
  else {
    *(short *)(in_U + -2) = DAT_70ba;
    uVar2 = DAT_714a;
    *(char *)(in_U + -3) = (char)DAT_714a;
    puVar3 = (undefined2 *)(in_U + -4);
    *(char *)puVar3 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_712e >> 8),(char)DAT_712e,*puVar3);
    API_FCC2(0);
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__2431 @ M70_r4_30000::2431 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__2431(void)

{
  bool bVar1;
  undefined2 uVar2;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar3;
  
  bVar1 = SBORROW2(DAT_70ba,DAT_714c);
  DAT_70ba = DAT_70ba - DAT_714c;
  if (bVar1) {
    DAT_70ba = 0;
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_7130 >> 8));
  }
  else {
    *(short *)(in_U + -2) = DAT_70ba;
    uVar2 = DAT_714e;
    *(char *)(in_U + -3) = (char)DAT_714e;
    puVar3 = (undefined2 *)(in_U + -4);
    *(char *)puVar3 = (char)((ushort)uVar2 >> 8);
    API_FCF2();
    FUN_M70_r4_30000__24c2((char)((ushort)DAT_7130 >> 8),(char)DAT_7130,*puVar3);
    API_FCC2(0);
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__2469 @ M70_r4_30000::2469 =====

undefined2 __h3000 FUN_M70_r4_30000__2469(void)

{
  undefined2 in_D;
  
  DAT_70ba = 0;
  FUN_M70_r4_30000__24c2((char)((ushort)DAT_7134 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__247a @ M70_r4_30000::247a =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__247a(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  psVar1 = (short *)(in_U + -2);
  *psVar1 = DAT_7150;
  API_FCF8();
  DAT_7160 = *psVar1;
  DAT_70b0 = DAT_7160 * 2 - DAT_7150;
  FUN_M70_r4_30000__24c2((char)((ushort)DAT_7136 >> 8),(char)DAT_7136,DAT_70b0);
  return in_D;
}


// ===== FUN_M70_r4_30000__249e @ M70_r4_30000::249e =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__249e(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  psVar1 = (short *)(in_U + -2);
  *psVar1 = DAT_7152;
  API_FCF8();
  DAT_7160 = *psVar1;
  DAT_70ba = DAT_7160 * 2 - DAT_7152;
  FUN_M70_r4_30000__24c2((char)((ushort)DAT_7138 >> 8),(char)DAT_7138,DAT_70ba);
  return in_D;
}


// ===== FUN_M70_r4_30000__24c2 @ M70_r4_30000::24c2 =====

short __h3000 FUN_M70_r4_30000__24c2(undefined2 param_1,undefined2 param_2,undefined2 *param_3)

{
  short in_D;
  short sVar1;
  
  if (in_D != 0) {
    param_3 = param_3 + -1;
    *param_3 = param_1;
    sVar1 = FUN_M70_r4_30000__24f7();
    if (sVar1 == 1) {
      return in_D;
    }
  }
  param_3[-1] = param_1;
  FUN_M70_r4_30000__24dd();
  return in_D;
}


// ===== FUN_M70_r4_30000__24dd @ M70_r4_30000::24dd =====

undefined2 __h3000 FUN_M70_r4_30000__24dd(void)

{
  short sVar1;
  undefined2 in_D;
  short *in_U;
  
  sVar1 = *in_U;
  *in_U = DAT_7028;
  DAT_7028 = sVar1 + DAT_7028;
  FUN_M70_r4_30000__0ccf();
  DAT_7028 = *in_U;
  return in_D;
}


// ===== FUN_M70_r4_30000__24f7 @ M70_r4_30000::24f7 =====

undefined2 __h3000 FUN_M70_r4_30000__24f7(void)

{
  short sVar1;
  undefined2 in_D;
  short *in_U;
  
  sVar1 = *in_U;
  *in_U = DAT_7038;
  DAT_7038 = sVar1 + DAT_7038;
  FUN_M70_r4_30000__0e63();
  DAT_7038 = *in_U;
  return in_D;
}


// ===== FUN_M70_r4_30000__2511 @ M70_r4_30000::2511 =====

undefined2 __h3000 FUN_M70_r4_30000__2511(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  short *psVar3;
  
  uVar1 = DAT_7156;
  *(char *)(in_U + -1) = (char)DAT_7156;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF8();
  DAT_7162 = *puVar2;
  *(undefined1 *)((short)puVar2 + 1) = 0x60;
  *(undefined1 *)puVar2 = 0xea;
  uVar1 = DAT_7162;
  *(char *)((short)puVar2 + -1) = (char)DAT_7162;
  psVar3 = puVar2 + -1;
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  API_FCF8();
  DAT_7160 = *psVar3 + 1000;
  if (DAT_713e != 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7160 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7160 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7162 >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7162 >> 8));
    if (DAT_713e == 1) {
      return in_D;
    }
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7160 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7160 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7162 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7162 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__25db @ M70_r4_30000::25db =====

undefined2 __h3000 FUN_M70_r4_30000__25db(void)

{
  undefined2 in_D;
  
  if (DAT_713a != 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_715c >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_715c >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_700c >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_700c >> 8));
    if (DAT_713a == 1) {
      return in_D;
    }
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_715c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_715c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_700c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_700c >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__267d @ M70_r4_30000::267d =====

undefined2 __h3000 FUN_M70_r4_30000__267d(void)

{
  undefined2 in_D;
  
  if (DAT_713c != 0) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_715e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_715e >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_701c >> 8));
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_701c >> 8));
    if (DAT_713c == 1) {
      return in_D;
    }
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_715e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_715e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_701c >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2745 @ M70_r4_30000::2745 =====

void __h3000 FUN_M70_r4_30000__2745(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__271f);
  return;
}


// ===== FUN_M70_r4_30000__2751 @ M70_r4_30000::2751 =====

void __h3000 FUN_M70_r4_30000__2751(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__271f);
  return;
}


// ===== FUN_M70_r4_30000__275d @ M70_r4_30000::275d =====

void __h3000 FUN_M70_r4_30000__275d(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__271f);
  return;
}


// ===== FUN_M70_r4_30000__2769 @ M70_r4_30000::2769 =====

void __h3000 FUN_M70_r4_30000__2769(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__271f);
  return;
}


// ===== FUN_M70_r4_30000__278a @ M70_r4_30000::278a =====

undefined2 __h3000 FUN_M70_r4_30000__278a(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_7098 + DAT_70d0;
  API_FCD8();
  DAT_70fc = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__27d0 @ M70_r4_30000::27d0 =====

void __h3000 FUN_M70_r4_30000__27d0(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__27aa);
  return;
}


// ===== FUN_M70_r4_30000__27dc @ M70_r4_30000::27dc =====

void __h3000 FUN_M70_r4_30000__27dc(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__27aa);
  return;
}


// ===== FUN_M70_r4_30000__27e8 @ M70_r4_30000::27e8 =====

void __h3000 FUN_M70_r4_30000__27e8(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__27aa);
  return;
}


// ===== FUN_M70_r4_30000__27f4 @ M70_r4_30000::27f4 =====

void __h3000 FUN_M70_r4_30000__27f4(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__27aa);
  return;
}


// ===== FUN_M70_r4_30000__2815 @ M70_r4_30000::2815 =====

undefined2 __h3000 FUN_M70_r4_30000__2815(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_709a + DAT_70d2;
  API_FCD8();
  DAT_70fe = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__285b @ M70_r4_30000::285b =====

void __h3000 FUN_M70_r4_30000__285b(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__2835);
  return;
}


// ===== FUN_M70_r4_30000__2867 @ M70_r4_30000::2867 =====

void __h3000 FUN_M70_r4_30000__2867(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__2835);
  return;
}


// ===== FUN_M70_r4_30000__2873 @ M70_r4_30000::2873 =====

void __h3000 FUN_M70_r4_30000__2873(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__2835);
  return;
}


// ===== FUN_M70_r4_30000__287f @ M70_r4_30000::287f =====

void __h3000 FUN_M70_r4_30000__287f(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__2835);
  return;
}


// ===== FUN_M70_r4_30000__28a0 @ M70_r4_30000::28a0 =====

undefined2 __h3000 FUN_M70_r4_30000__28a0(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_709c + DAT_70d4;
  API_FCD8();
  DAT_7100 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__28e6 @ M70_r4_30000::28e6 =====

void __h3000 FUN_M70_r4_30000__28e6(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__28c0);
  return;
}


// ===== FUN_M70_r4_30000__28f2 @ M70_r4_30000::28f2 =====

void __h3000 FUN_M70_r4_30000__28f2(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__28c0);
  return;
}


// ===== FUN_M70_r4_30000__28fe @ M70_r4_30000::28fe =====

void __h3000 FUN_M70_r4_30000__28fe(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__28c0);
  return;
}


// ===== FUN_M70_r4_30000__290a @ M70_r4_30000::290a =====

void __h3000 FUN_M70_r4_30000__290a(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__28c0);
  return;
}


// ===== FUN_M70_r4_30000__292b @ M70_r4_30000::292b =====

undefined2 __h3000 FUN_M70_r4_30000__292b(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_709e + DAT_70d6;
  API_FCD8();
  DAT_7102 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__2971 @ M70_r4_30000::2971 =====

void __h3000 FUN_M70_r4_30000__2971(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__294b);
  return;
}


// ===== FUN_M70_r4_30000__297d @ M70_r4_30000::297d =====

void __h3000 FUN_M70_r4_30000__297d(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__294b);
  return;
}


// ===== FUN_M70_r4_30000__2989 @ M70_r4_30000::2989 =====

void __h3000 FUN_M70_r4_30000__2989(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__294b);
  return;
}


// ===== FUN_M70_r4_30000__2995 @ M70_r4_30000::2995 =====

void __h3000 FUN_M70_r4_30000__2995(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__294b);
  return;
}


// ===== FUN_M70_r4_30000__29b6 @ M70_r4_30000::29b6 =====

undefined2 __h3000 FUN_M70_r4_30000__29b6(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70a0 + DAT_70d8;
  API_FCD8();
  DAT_7104 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__29fc @ M70_r4_30000::29fc =====

void __h3000 FUN_M70_r4_30000__29fc(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__29d6);
  return;
}


// ===== FUN_M70_r4_30000__2a08 @ M70_r4_30000::2a08 =====

void __h3000 FUN_M70_r4_30000__2a08(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__29d6);
  return;
}


// ===== FUN_M70_r4_30000__2a14 @ M70_r4_30000::2a14 =====

void __h3000 FUN_M70_r4_30000__2a14(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__29d6);
  return;
}


// ===== FUN_M70_r4_30000__2a20 @ M70_r4_30000::2a20 =====

void __h3000 FUN_M70_r4_30000__2a20(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__29d6);
  return;
}


// ===== FUN_M70_r4_30000__2a41 @ M70_r4_30000::2a41 =====

undefined2 __h3000 FUN_M70_r4_30000__2a41(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70a2 + DAT_70da;
  API_FCD8();
  DAT_7106 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__2a87 @ M70_r4_30000::2a87 =====

void __h3000 FUN_M70_r4_30000__2a87(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__2a61);
  return;
}


// ===== FUN_M70_r4_30000__2a93 @ M70_r4_30000::2a93 =====

void __h3000 FUN_M70_r4_30000__2a93(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__2a61);
  return;
}


// ===== FUN_M70_r4_30000__2a9f @ M70_r4_30000::2a9f =====

void __h3000 FUN_M70_r4_30000__2a9f(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__2a61);
  return;
}


// ===== FUN_M70_r4_30000__2aab @ M70_r4_30000::2aab =====

void __h3000 FUN_M70_r4_30000__2aab(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__2a61);
  return;
}


// ===== FUN_M70_r4_30000__2acc @ M70_r4_30000::2acc =====

undefined2 __h3000 FUN_M70_r4_30000__2acc(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70a4 + DAT_70dc;
  API_FCD8();
  DAT_7108 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__2b12 @ M70_r4_30000::2b12 =====

void __h3000 FUN_M70_r4_30000__2b12(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__2aec);
  return;
}


// ===== FUN_M70_r4_30000__2b1e @ M70_r4_30000::2b1e =====

void __h3000 FUN_M70_r4_30000__2b1e(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__2aec);
  return;
}


// ===== FUN_M70_r4_30000__2b2a @ M70_r4_30000::2b2a =====

void __h3000 FUN_M70_r4_30000__2b2a(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__2aec);
  return;
}


// ===== FUN_M70_r4_30000__2b36 @ M70_r4_30000::2b36 =====

void __h3000 FUN_M70_r4_30000__2b36(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__2aec);
  return;
}


// ===== FUN_M70_r4_30000__2b57 @ M70_r4_30000::2b57 =====

undefined2 __h3000 FUN_M70_r4_30000__2b57(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 0x22;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70a6 + DAT_70de;
  API_FCD8();
  DAT_710a = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__2ce3 @ M70_r4_30000::2ce3 =====

void __h3000 FUN_M70_r4_30000__2ce3(undefined1 param_1,undefined1 param_2)

{
  FUN_ef6c(param_1,param_2,&UNK_M70_r4_30000__2cbb);
  return;
}


// ===== FUN_M70_r4_30000__2cef @ M70_r4_30000::2cef =====

undefined2 __h3000 FUN_M70_r4_30000__2cef(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__2d58();
  FUN_M70_r4_30000__2d31();
  return in_D;
}


// ===== FUN_M70_r4_30000__2d0c @ M70_r4_30000::2d0c =====

undefined2 __h3000 FUN_M70_r4_30000__2d0c(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  API_FE40();
  FUN_M70_r4_30000__2d58();
  FUN_M70_r4_30000__2d31();
  return in_D;
}


// ===== FUN_M70_r4_30000__2d31 @ M70_r4_30000::2d31 =====

undefined2 __h3000 FUN_M70_r4_30000__2d31(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "[tr1]" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_70fc >> 8));
                    /* inline[API_FC38]: "/" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_70fe >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2d58 @ M70_r4_30000::2d58 =====

undefined2 __h3000 FUN_M70_r4_30000__2d58(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_70fc >> 8));
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_70fe >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2d91 @ M70_r4_30000::2d91 =====

void __h3000 FUN_M70_r4_30000__2d91(undefined1 param_1,undefined1 param_2)

{
  FUN_ef6c(param_1,param_2,PTR_ARRAY_M70_r4_30000__2d69);
  return;
}


// ===== FUN_M70_r4_30000__2d9d @ M70_r4_30000::2d9d =====

undefined2 __h3000 FUN_M70_r4_30000__2d9d(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__2e06();
  FUN_M70_r4_30000__2ddf();
  return in_D;
}


// ===== FUN_M70_r4_30000__2dba @ M70_r4_30000::2dba =====

undefined2 __h3000 FUN_M70_r4_30000__2dba(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  API_FE40();
  FUN_M70_r4_30000__2e06();
  FUN_M70_r4_30000__2ddf();
  return in_D;
}


// ===== FUN_M70_r4_30000__2ddf @ M70_r4_30000::2ddf =====

undefined2 __h3000 FUN_M70_r4_30000__2ddf(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "[tr2]" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_7100 >> 8));
                    /* inline[API_FC38]: "/" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_7102 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2e06 @ M70_r4_30000::2e06 =====

undefined2 __h3000 FUN_M70_r4_30000__2e06(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_7100 >> 8));
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_7102 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2e3f @ M70_r4_30000::2e3f =====

void __h3000 FUN_M70_r4_30000__2e3f(undefined1 param_1,undefined1 param_2)

{
  FUN_ef6c(param_1,param_2,PTR_ARRAY_M70_r4_30000__2e17);
  return;
}


// ===== FUN_M70_r4_30000__2e4b @ M70_r4_30000::2e4b =====

undefined2 __h3000 FUN_M70_r4_30000__2e4b(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__2eb4();
  FUN_M70_r4_30000__2e8d();
  return in_D;
}


// ===== FUN_M70_r4_30000__2e68 @ M70_r4_30000::2e68 =====

undefined2 __h3000 FUN_M70_r4_30000__2e68(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  API_FE40();
  FUN_M70_r4_30000__2eb4();
  FUN_M70_r4_30000__2e8d();
  return in_D;
}


// ===== FUN_M70_r4_30000__2e8d @ M70_r4_30000::2e8d =====

undefined2 __h3000 FUN_M70_r4_30000__2e8d(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "[tr3]" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_7104 >> 8));
                    /* inline[API_FC38]: "/" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_7106 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2eb4 @ M70_r4_30000::2eb4 =====

undefined2 __h3000 FUN_M70_r4_30000__2eb4(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_7104 >> 8));
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_7106 >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2eed @ M70_r4_30000::2eed =====

void __h3000 FUN_M70_r4_30000__2eed(undefined1 param_1,undefined1 param_2)

{
  FUN_ef6c(param_1,param_2,PTR_ARRAY_M70_r4_30000__2ec5);
  return;
}


// ===== FUN_M70_r4_30000__2ef9 @ M70_r4_30000::2ef9 =====

undefined2 __h3000 FUN_M70_r4_30000__2ef9(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  FUN_M70_r4_30000__2f62();
  FUN_M70_r4_30000__2f3b();
  return in_D;
}


// ===== FUN_M70_r4_30000__2f16 @ M70_r4_30000::2f16 =====

undefined2 __h3000 FUN_M70_r4_30000__2f16(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6072 */
  ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
  ModuleStorePtr(0x1d);
  API_FE40();
  FUN_M70_r4_30000__2f62();
  FUN_M70_r4_30000__2f3b();
  return in_D;
}


// ===== FUN_M70_r4_30000__2f3b @ M70_r4_30000::2f3b =====

undefined2 __h3000 FUN_M70_r4_30000__2f3b(void)

{
  undefined2 in_D;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "[tr4]" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_7108 >> 8));
                    /* inline[API_FC38]: "/" */
  LcdPrintInline();
  FUN_M70_r4_30000__2f73((char)((ushort)DAT_710a >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2f62 @ M70_r4_30000::2f62 =====

undefined2 __h3000 FUN_M70_r4_30000__2f62(void)

{
  undefined2 in_D;
  
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_7108 >> 8));
  FUN_M70_r4_30000__2f84((char)((ushort)DAT_710a >> 8));
  return in_D;
}


// ===== FUN_M70_r4_30000__2f73 @ M70_r4_30000::2f73 =====

undefined2 __h3000 FUN_M70_r4_30000__2f73(void)

{
  undefined2 in_D;
  
  (**(code **)(&UNK_M70_r4_30000__2fdd +
              CONCAT11((char)((ushort)in_D >> 8) << 1 | (byte)in_D >> 7,(byte)in_D << 1) +
              g_moduleBase))();
  return in_D;
}


// ===== FUN_M70_r4_30000__2f84 @ M70_r4_30000::2f84 =====

undefined2 __h3000 FUN_M70_r4_30000__2f84(void)

{
  undefined2 in_D;
  
  (**(code **)(&UNK_M70_r4_30000__2f95 +
              CONCAT11((char)((ushort)in_D >> 8) << 1 | (byte)in_D >> 7,(byte)in_D << 1) +
              g_moduleBase))();
  return in_D;
}


// ===== MODULE_70_04_entry @ M70_r4_30000::302d =====

void __h3000 MODULE_70_04_entry(void)

{
  return;
}


// ===== FUN_M70_r4_30000__306f @ M70_r4_30000::306f =====

void __h3000 FUN_M70_r4_30000__306f(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__347b_M70_r4_30000__3049);
  return;
}


// ===== FUN_M70_r4_30000__307b @ M70_r4_30000::307b =====

void __h3000 FUN_M70_r4_30000__307b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$347B ->$3093 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__347b_M70_r4_30000__3049);
  return;
}


// ===== FUN_M70_r4_30000__3087 @ M70_r4_30000::3087 =====

void __h3000 FUN_M70_r4_30000__3087(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__347b_M70_r4_30000__3049);
  return;
}


// ===== FUN_M70_r4_30000__3093 @ M70_r4_30000::3093 =====

void __h3000 FUN_M70_r4_30000__3093(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__347b_M70_r4_30000__3049);
  return;
}


// ===== FUN_M70_r4_30000__30db @ M70_r4_30000::30db =====

void __h3000 FUN_M70_r4_30000__30db(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__352d_M70_r4_30000__30b5);
  return;
}


// ===== FUN_M70_r4_30000__30e7 @ M70_r4_30000::30e7 =====

void __h3000 FUN_M70_r4_30000__30e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$352D ->$30FF */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__352d_M70_r4_30000__30b5);
  return;
}


// ===== FUN_M70_r4_30000__30f3 @ M70_r4_30000::30f3 =====

void __h3000 FUN_M70_r4_30000__30f3(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__352d_M70_r4_30000__30b5);
  return;
}


// ===== FUN_M70_r4_30000__30ff @ M70_r4_30000::30ff =====

void __h3000 FUN_M70_r4_30000__30ff(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__352d_M70_r4_30000__30b5);
  return;
}


// ===== FUN_M70_r4_30000__3147 @ M70_r4_30000::3147 =====

void __h3000 FUN_M70_r4_30000__3147(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__34d4_M70_r4_30000__3121);
  return;
}


// ===== FUN_M70_r4_30000__3153 @ M70_r4_30000::3153 =====

void __h3000 FUN_M70_r4_30000__3153(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$34D4 ->$316B */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__34d4_M70_r4_30000__3121);
  return;
}


// ===== FUN_M70_r4_30000__315f @ M70_r4_30000::315f =====

void __h3000 FUN_M70_r4_30000__315f(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__34d4_M70_r4_30000__3121);
  return;
}


// ===== FUN_M70_r4_30000__316b @ M70_r4_30000::316b =====

void __h3000 FUN_M70_r4_30000__316b(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__34d4_M70_r4_30000__3121);
  return;
}


// ===== FUN_M70_r4_30000__31b3 @ M70_r4_30000::31b3 =====

void __h3000 FUN_M70_r4_30000__31b3(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__3586_M70_r4_30000__318d);
  return;
}


// ===== FUN_M70_r4_30000__31bf @ M70_r4_30000::31bf =====

void __h3000 FUN_M70_r4_30000__31bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3586 ->$31D7 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__3586_M70_r4_30000__318d);
  return;
}


// ===== FUN_M70_r4_30000__31cb @ M70_r4_30000::31cb =====

void __h3000 FUN_M70_r4_30000__31cb(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__3586_M70_r4_30000__318d);
  return;
}


// ===== FUN_M70_r4_30000__31d7 @ M70_r4_30000::31d7 =====

void __h3000 FUN_M70_r4_30000__31d7(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__3586_M70_r4_30000__318d);
  return;
}


// ===== FUN_M70_r4_30000__321f @ M70_r4_30000::321f =====

void __h3000 FUN_M70_r4_30000__321f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$34AE ->$3243 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__34ae_M70_r4_30000__31f9);
  return;
}


// ===== FUN_M70_r4_30000__322b @ M70_r4_30000::322b =====

void __h3000 FUN_M70_r4_30000__322b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$34AE ->$3243 */
                    /* inline[API_FDBC]: "5.94..1." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__34ae_M70_r4_30000__31f9);
  return;
}


// ===== FUN_M70_r4_30000__3237 @ M70_r4_30000::3237 =====

void __h3000 FUN_M70_r4_30000__3237(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$34AE ->$3243 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__34ae_M70_r4_30000__31f9);
  return;
}


// ===== FUN_M70_r4_30000__3243 @ M70_r4_30000::3243 =====

void __h3000 FUN_M70_r4_30000__3243(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$34AE ->$3243 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__34ae_M70_r4_30000__31f9);
  return;
}


// ===== FUN_M70_r4_30000__328a @ M70_r4_30000::328a =====

void __h3000 FUN_M70_r4_30000__328a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3560 ->$32AE */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__3560_M70_r4_30000__3264);
  return;
}


// ===== FUN_M70_r4_30000__3296 @ M70_r4_30000::3296 =====

void __h3000 FUN_M70_r4_30000__3296(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3560 ->$32AE */
                    /* inline[API_FDBC]: "5.94..2d" */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__3560_M70_r4_30000__3264);
  return;
}


// ===== FUN_M70_r4_30000__32a2 @ M70_r4_30000::32a2 =====

void __h3000 FUN_M70_r4_30000__32a2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3560 ->$32AE */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__3560_M70_r4_30000__3264);
  return;
}


// ===== FUN_M70_r4_30000__32ae @ M70_r4_30000::32ae =====

void __h3000 FUN_M70_r4_30000__32ae(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3560 ->$32AE */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__3560_M70_r4_30000__3264);
  return;
}


// ===== FUN_M70_r4_30000__32f5 @ M70_r4_30000::32f5 =====

void __h3000 FUN_M70_r4_30000__32f5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3507 ->$3319 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__3507_M70_r4_30000__32cf);
  return;
}


// ===== FUN_M70_r4_30000__3301 @ M70_r4_30000::3301 =====

void __h3000 FUN_M70_r4_30000__3301(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3507 ->$3319 */
                    /* inline[API_FDBC]: "5.94..2." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__3507_M70_r4_30000__32cf);
  return;
}


// ===== FUN_M70_r4_30000__330d @ M70_r4_30000::330d =====

void __h3000 FUN_M70_r4_30000__330d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3507 ->$3319 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__3507_M70_r4_30000__32cf);
  return;
}


// ===== FUN_M70_r4_30000__3319 @ M70_r4_30000::3319 =====

void __h3000 FUN_M70_r4_30000__3319(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3507 ->$3319 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__3507_M70_r4_30000__32cf);
  return;
}


// ===== FUN_M70_r4_30000__3360 @ M70_r4_30000::3360 =====

void __h3000 FUN_M70_r4_30000__3360(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$35B9 ->$3384 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__35b9_M70_r4_30000__333a);
  return;
}


// ===== FUN_M70_r4_30000__336c @ M70_r4_30000::336c =====

void __h3000 FUN_M70_r4_30000__336c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$35B9 ->$3384 */
                    /* inline[API_FDBC]: "5.94..3:" */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__35b9_M70_r4_30000__333a);
  return;
}


// ===== FUN_M70_r4_30000__3378 @ M70_r4_30000::3378 =====

void __h3000 FUN_M70_r4_30000__3378(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$35B9 ->$3384 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__35b9_M70_r4_30000__333a);
  return;
}


// ===== FUN_M70_r4_30000__3384 @ M70_r4_30000::3384 =====

void __h3000 FUN_M70_r4_30000__3384(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$35B9 ->$3384 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__35b9_M70_r4_30000__333a);
  return;
}


// ===== FUN_M70_r4_30000__33cb @ M70_r4_30000::33cb =====

void __h3000 FUN_M70_r4_30000__33cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$35DF ->$33EF */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__35df_M70_r4_30000__33a5);
  return;
}


// ===== FUN_M70_r4_30000__33d7 @ M70_r4_30000::33d7 =====

void __h3000 FUN_M70_r4_30000__33d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$35DF ->$33EF */
                    /* inline[API_FDBC]: "5.94..3." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__35df_M70_r4_30000__33a5);
  return;
}


// ===== FUN_M70_r4_30000__33e3 @ M70_r4_30000::33e3 =====

void __h3000 FUN_M70_r4_30000__33e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$35DF ->$33EF */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__35df_M70_r4_30000__33a5);
  return;
}


// ===== FUN_M70_r4_30000__33ef @ M70_r4_30000::33ef =====

void __h3000 FUN_M70_r4_30000__33ef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$35DF ->$33EF */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__35df_M70_r4_30000__33a5);
  return;
}


// ===== FUN_M70_r4_30000__3436 @ M70_r4_30000::3436 =====

void __h3000 FUN_M70_r4_30000__3436(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3605 ->$345A */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__3605_M70_r4_30000__3410);
  return;
}


// ===== FUN_M70_r4_30000__3442 @ M70_r4_30000::3442 =====

void __h3000 FUN_M70_r4_30000__3442(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3605 ->$345A */
                    /* inline[API_FDBC]: "5.94..4." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__3605_M70_r4_30000__3410);
  return;
}


// ===== FUN_M70_r4_30000__344e @ M70_r4_30000::344e =====

void __h3000 FUN_M70_r4_30000__344e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3605 ->$345A */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__3605_M70_r4_30000__3410);
  return;
}


// ===== FUN_M70_r4_30000__345a @ M70_r4_30000::345a =====

void __h3000 FUN_M70_r4_30000__345a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3605 ->$345A */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__3605_M70_r4_30000__3410);
  return;
}


// ===== FUN_M70_r4_30000__347b @ M70_r4_30000::347b =====

undefined2 __h3000 FUN_M70_r4_30000__347b(void)

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
  *psVar2 = DAT_70a8 + DAT_70e0;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_710c = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x14;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_7140 = *psVar2;
  return in_D;
}


// ===== FUN_M70_r4_30000__34ae @ M70_r4_30000::34ae =====

undefined2 __h3000 FUN_M70_r4_30000__34ae(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0x50;
  *(undefined1 *)(in_U + -2) = 0xfb;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70aa + DAT_70e2;
  API_FCD8();
  DAT_710e = *psVar1;
  DAT_7142 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__34d4 @ M70_r4_30000::34d4 =====

undefined2 __h3000 FUN_M70_r4_30000__34d4(void)

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
  *psVar2 = DAT_70ac + DAT_70e4;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7110 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x14;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_7144 = *psVar2;
  return in_D;
}


// ===== FUN_M70_r4_30000__3507 @ M70_r4_30000::3507 =====

undefined2 __h3000 FUN_M70_r4_30000__3507(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0x50;
  *(undefined1 *)(in_U + -2) = 0xfb;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70ae + DAT_70e6;
  API_FCD8();
  DAT_7112 = *psVar1;
  DAT_7146 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__352d @ M70_r4_30000::352d =====

undefined2 __h3000 FUN_M70_r4_30000__352d(void)

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
  *psVar2 = DAT_70b2 + DAT_70e8;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7114 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x14;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_7148 = *psVar2;
  return in_D;
}


// ===== FUN_M70_r4_30000__3560 @ M70_r4_30000::3560 =====

undefined2 __h3000 FUN_M70_r4_30000__3560(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0x50;
  *(undefined1 *)(in_U + -2) = 0xfb;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70b4 + DAT_70ea;
  API_FCD8();
  DAT_7116 = *psVar1;
  DAT_714a = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__3586 @ M70_r4_30000::3586 =====

undefined2 __h3000 FUN_M70_r4_30000__3586(void)

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
  *psVar2 = DAT_70b6 + DAT_70ec;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7118 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x14;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_714c = *psVar2;
  return in_D;
}


// ===== FUN_M70_r4_30000__35b9 @ M70_r4_30000::35b9 =====

undefined2 __h3000 FUN_M70_r4_30000__35b9(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0x50;
  *(undefined1 *)(in_U + -2) = 0xfb;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70b8 + DAT_70ee;
  API_FCD8();
  DAT_711a = *psVar1;
  DAT_714e = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__35df @ M70_r4_30000::35df =====

undefined2 __h3000 FUN_M70_r4_30000__35df(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0x50;
  *(undefined1 *)(in_U + -2) = 0xfb;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70bc + DAT_70f0;
  API_FCD8();
  DAT_711c = *psVar1;
  DAT_7150 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__3605 @ M70_r4_30000::3605 =====

undefined2 __h3000 FUN_M70_r4_30000__3605(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0x50;
  *(undefined1 *)(in_U + -2) = 0xfb;
  *(undefined1 *)(in_U + -3) = 0xb0;
  *(undefined1 *)(in_U + -4) = 4;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70be + DAT_70f2;
  API_FCD8();
  DAT_711e = *psVar1;
  DAT_7150 = *psVar1;
  return in_D;
}


// ===== FUN_M70_r4_30000__3651 @ M70_r4_30000::3651 =====

void __h3000 FUN_M70_r4_30000__3651(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$36AE ->$3675 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__36ae_M70_r4_30000__362b);
  return;
}


// ===== FUN_M70_r4_30000__365d @ M70_r4_30000::365d =====

void __h3000 FUN_M70_r4_30000__365d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$36AE ->$3675 */
                    /* inline[API_FDBC]: "5.94..6+" */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__36ae_M70_r4_30000__362b);
  return;
}


// ===== FUN_M70_r4_30000__3669 @ M70_r4_30000::3669 =====

void __h3000 FUN_M70_r4_30000__3669(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$36AE ->$3675 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__36ae_M70_r4_30000__362b);
  return;
}


// ===== FUN_M70_r4_30000__3675 @ M70_r4_30000::3675 =====

void __h3000 FUN_M70_r4_30000__3675(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$36AE ->$3675 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__36ae_M70_r4_30000__362b);
  return;
}


// ===== FUN_M70_r4_30000__3681 @ M70_r4_30000::3681 =====

void __h3000 FUN_M70_r4_30000__3681(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$36AE ->$3675 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__36ae_M70_r4_30000__362b);
  return;
}


// ===== FUN_M70_r4_30000__368d @ M70_r4_30000::368d =====

void __h3000 FUN_M70_r4_30000__368d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$36AE ->$3675 $3669 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__36ae_M70_r4_30000__362b);
  return;
}


// ===== FUN_M70_r4_30000__36ae @ M70_r4_30000::36ae =====

undefined2 __h3000 FUN_M70_r4_30000__36ae(void)

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
  *psVar2 = DAT_7000 + DAT_7002;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7004 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x2c;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_715c = *psVar2;
  return in_D;
}


// ===== FUN_M70_r4_30000__3707 @ M70_r4_30000::3707 =====

void __h3000 FUN_M70_r4_30000__3707(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3764 ->$372B */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__3764_M70_r4_30000__36e1);
  return;
}


// ===== FUN_M70_r4_30000__3713 @ M70_r4_30000::3713 =====

void __h3000 FUN_M70_r4_30000__3713(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3764 ->$372B */
                    /* inline[API_FDBC]: "5.94..6." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__3764_M70_r4_30000__36e1);
  return;
}


// ===== FUN_M70_r4_30000__371f @ M70_r4_30000::371f =====

void __h3000 FUN_M70_r4_30000__371f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3764 ->$372B */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__3764_M70_r4_30000__36e1);
  return;
}


// ===== FUN_M70_r4_30000__372b @ M70_r4_30000::372b =====

void __h3000 FUN_M70_r4_30000__372b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3764 ->$372B */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__3764_M70_r4_30000__36e1);
  return;
}


// ===== FUN_M70_r4_30000__3737 @ M70_r4_30000::3737 =====

void __h3000 FUN_M70_r4_30000__3737(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3764 ->$372B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__3764_M70_r4_30000__36e1);
  return;
}


// ===== FUN_M70_r4_30000__3743 @ M70_r4_30000::3743 =====

void __h3000 FUN_M70_r4_30000__3743(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3764 ->$372B $371F */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__3764_M70_r4_30000__36e1);
  return;
}


// ===== FUN_M70_r4_30000__3764 @ M70_r4_30000::3764 =====

undefined2 __h3000 FUN_M70_r4_30000__3764(void)

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
  *psVar2 = DAT_7010 + DAT_7012;
  API_FCD8();
  sVar1 = *psVar2;
  DAT_7014 = sVar1;
  *(char *)((short)psVar2 + 1) = (char)sVar1;
  *(char *)psVar2 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar2 + -1) = 0x2c;
  psVar2 = psVar2 + -1;
  *(undefined1 *)psVar2 = 0;
  API_FCEE();
  DAT_715e = *psVar2;
  return in_D;
}


// ===== FUN_M70_r4_30000__37bd @ M70_r4_30000::37bd =====

void __h3000 FUN_M70_r4_30000__37bd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$381B ->$37E1 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return;
}


// ===== FUN_M70_r4_30000__37c9 @ M70_r4_30000::37c9 =====

void __h3000 FUN_M70_r4_30000__37c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$381B ->$37E1 */
                    /* inline[API_FDBC]: "5.94..7." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return;
}


// ===== FUN_M70_r4_30000__37d5 @ M70_r4_30000::37d5 =====

void __h3000 FUN_M70_r4_30000__37d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$381B ->$37E1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return;
}


// ===== FUN_M70_r4_30000__37e1 @ M70_r4_30000::37e1 =====

void __h3000 FUN_M70_r4_30000__37e1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$381B ->$37E1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return;
}


// ===== FUN_M70_r4_30000__37ed @ M70_r4_30000::37ed =====

void __h3000 FUN_M70_r4_30000__37ed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$381B ->$37E1 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return;
}


// ===== FUN_M70_r4_30000__37f9 @ M70_r4_30000::37f9 =====

void __h3000 FUN_M70_r4_30000__37f9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$381B ->$37E1 $37D5 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return;
}


// ===== FUN_M70_r4_30000__381b @ M70_r4_30000::381b =====

undefined2 __h3000 FUN_M70_r4_30000__381b(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M70_r4_30000__381b_M70_r4_30000__3797);
  return uStack_8;
}


// ===== FUN_M70_r4_30000__384d @ M70_r4_30000::384d =====

void __h3000 FUN_M70_r4_30000__384d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$38AC ->$3871 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return;
}


// ===== FUN_M70_r4_30000__3859 @ M70_r4_30000::3859 =====

void __h3000 FUN_M70_r4_30000__3859(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$38AC ->$3871 */
                    /* inline[API_FDBC]: "5.94..8'" */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return;
}


// ===== FUN_M70_r4_30000__3865 @ M70_r4_30000::3865 =====

void __h3000 FUN_M70_r4_30000__3865(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$38AC ->$3871 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return;
}


// ===== FUN_M70_r4_30000__3871 @ M70_r4_30000::3871 =====

void __h3000 FUN_M70_r4_30000__3871(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$38AC ->$3871 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return;
}


// ===== FUN_M70_r4_30000__387d @ M70_r4_30000::387d =====

void __h3000 FUN_M70_r4_30000__387d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$38AC ->$3871 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return;
}


// ===== FUN_M70_r4_30000__3889 @ M70_r4_30000::3889 =====

void __h3000 FUN_M70_r4_30000__3889(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$38AC ->$3871 $3865 */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return;
}


// ===== FUN_M70_r4_30000__38ac @ M70_r4_30000::38ac =====

undefined2 __h3000 FUN_M70_r4_30000__38ac(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M70_r4_30000__38ac_M70_r4_30000__3827);
  return uStack_8;
}


// ===== FUN_M70_r4_30000__38de @ M70_r4_30000::38de =====

void __h3000 FUN_M70_r4_30000__38de(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M70_r4_30000__3924_M70_r4_30000__38b8);
  return;
}


// ===== FUN_M70_r4_30000__38ea @ M70_r4_30000::38ea =====

void __h3000 FUN_M70_r4_30000__38ea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3924 ->$3902 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M70_r4_30000__3924_M70_r4_30000__38b8);
  return;
}


// ===== FUN_M70_r4_30000__38f6 @ M70_r4_30000::38f6 =====

void __h3000 FUN_M70_r4_30000__38f6(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M70_r4_30000__3924_M70_r4_30000__38b8);
  return;
}


// ===== FUN_M70_r4_30000__3902 @ M70_r4_30000::3902 =====

void __h3000 FUN_M70_r4_30000__3902(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M70_r4_30000__3924_M70_r4_30000__38b8);
  return;
}


// ===== FUN_M70_r4_30000__3924 @ M70_r4_30000::3924 =====

undefined2 __h3000 FUN_M70_r4_30000__3924(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 100;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_7020 + DAT_7022;
  API_FCD8();
  DAT_7024 = *psVar1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7024 >> 8));
  return in_D;
}


// ===== MODULE_70_05_entry @ M70_r4_30000::395e =====

void __h3000 MODULE_70_05_entry(void)

{
  return;
}


// ===== FUN_M70_r4_30000__395f @ M70_r4_30000::395f =====

undefined2 __h3000 FUN_M70_r4_30000__395f(void)

{
  undefined2 in_D;
  
  API_FC8E();
  DAT_70ce = DAT_60f9;
  DAT_6074 = DAT_60f9;
  FUN_M70_r4_30000__3a6f();
  return in_D;
}


// ===== FUN_M70_r4_30000__3974 @ M70_r4_30000::3974 =====

undefined2 __h3000 FUN_M70_r4_30000__3974(void)

{
  undefined2 in_D;
  
  DAT_70ce = DAT_70ce ^ 0xffff;
  FUN_M70_r4_30000__3988();
  FUN_M70_r4_30000__3993();
  FUN_M70_r4_30000__3a6f();
  FUN_M70_r4_30000__39f7();
  return in_D;
}


// ===== FUN_M70_r4_30000__3988 @ M70_r4_30000::3988 =====

undefined2 __h3000 FUN_M70_r4_30000__3988(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_2;
  
  uStack_2 = CONCAT11(param_1,param_2);
  FUN_M70_r4_30000__3a6f();
  FUN_M70_r4_30000__39f7();
  return uStack_2;
}


// ===== FUN_M70_r4_30000__3993 @ M70_r4_30000::3993 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M70_r4_30000__3993(undefined2 param_1)

{
  undefined2 in_D;
  
  API_FE40((char)((ushort)DAT_70ce >> 8),(char)DAT_70ce,param_1,4);
  API_FC80((char)((ushort)DAT_70ce >> 8),(char)DAT_70ce,param_1,0x9e);
  FUN_M70_r4_30000__3a6f();
  FUN_M70_r4_30000__39f7();
  FUN_M70_r4_30000__39bf();
  API_FDE8();
  return in_D;
}


// ===== FUN_M70_r4_30000__39bf @ M70_r4_30000::39bf =====

undefined2 __h3000 FUN_M70_r4_30000__39bf(void)

{
  undefined2 in_D;
  
  if (DAT_70ce == 0) {
                    /* inline[API_FE02]: "auto=on " [-] [-] [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  else {
                    /* inline[API_FE02]: "auto=off" [-] [-] [-] */
    SoftKeyLabels4Inline();
    API_FDF2();
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__39f7 @ M70_r4_30000::39f7 =====

undefined2 __h3000 FUN_M70_r4_30000__39f7(void)

{
  undefined2 in_D;
  
  if (DAT_70ce == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "[ on] Automatic Trigger Sequencer is ON " */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "[off] Automatic Trigger Sequencer is OFF" */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__3a6f @ M70_r4_30000::3a6f =====

undefined2 __h3000 FUN_M70_r4_30000__3a6f(void)

{
  undefined2 in_D;
  
  if (DAT_70ce == 0) {
    DAT_7128 = DAT_715a;
                    /* inline[API_FC62]: $6072 */
    ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
    ModuleStorePtr(0x39);
                    /* inline[API_FC62]: $608F */
    ModuleStorePtr(0x3b);
    API_FCBC((char)((ushort)DAT_7158 >> 8));
  }
  else {
                    /* inline[API_FC62]: $6072 */
    ModuleStorePtr(0x3b);
                    /* inline[API_FC62]: $6070 */
    ModuleStorePtr(0x39);
                    /* inline[API_FC62]: $608F */
    ModuleStorePtr(0x39);
  }
  return in_D;
}


// ===== FUN_M70_r4_30000__3b40 @ M70_r4_30000::3b40 =====

undefined2 __h3000 FUN_M70_r4_30000__3b40(void)

{
  undefined2 in_D;
  short *psVar1;
  short *psVar2;
  
  do {
    if (FUN_M70_r4_30000__3b40 + g_moduleBase == DAT_6072) {
      if (*DAT_7128 != -1) {
        psVar1 = DAT_7128;
        LcdSetCursor();
                    /* inline[API_FC38]: "[" */
        LcdPrintInline();
        API_FC44((char)((short)DAT_7128 - (short)DAT_715a >> 10));
                    /* inline[API_FC38]: "]" */
        LcdPrintInline();
        psVar2 = psVar1 + 1;
        FUN_M70_r4_30000__2f84((char)((ushort)*psVar1 >> 8));
        FUN_M70_r4_30000__2f73();
                    /* inline[API_FC38]: "/" */
        LcdPrintInline();
        if (*psVar2 != -1) {
          psVar1 = psVar2 + 1;
          FUN_M70_r4_30000__2f84((char)((ushort)*psVar2 >> 8));
          FUN_M70_r4_30000__2f73();
          goto LAB_M70_r4_30000__3bb6;
        }
      }
    }
    else if (*DAT_7128 != -1) {
      psVar2 = DAT_7128 + 1;
      FUN_M70_r4_30000__2f84((char)((ushort)*DAT_7128 >> 8));
      if (*psVar2 != -1) {
        psVar1 = psVar2 + 1;
        FUN_M70_r4_30000__2f84((char)((ushort)*psVar2 >> 8));
LAB_M70_r4_30000__3bb6:
        DAT_7128 = psVar1;
        API_FCBC((char)((ushort)DAT_7158 >> 8));
        return in_D;
      }
    }
    DAT_7128 = DAT_715a;
  } while( true );
}


// ===== FUN_M70_r4_30000__3bf2 @ M70_r4_30000::3bf2 =====

void __h3000 FUN_M70_r4_30000__3bf2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3C50 ->$3C16 */
  API_FE6A(param_1,param_2,&PTR_FUN_M70_r4_30000__3c50_M70_r4_30000__3bcc);
  return;
}


// ===== FUN_M70_r4_30000__3bfe @ M70_r4_30000::3bfe =====

void __h3000 FUN_M70_r4_30000__3bfe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3C50 ->$3C16 */
                    /* inline[API_FDBC]: "5.94..;." */
  API_FDBC(param_1,param_2,&PTR_FUN_M70_r4_30000__3c50_M70_r4_30000__3bcc);
  return;
}


// ===== FUN_M70_r4_30000__3c0a @ M70_r4_30000::3c0a =====

void __h3000 FUN_M70_r4_30000__3c0a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3C50 ->$3C16 */
  API_FE6C(param_1,param_2,&PTR_FUN_M70_r4_30000__3c50_M70_r4_30000__3bcc);
  return;
}


// ===== FUN_M70_r4_30000__3c16 @ M70_r4_30000::3c16 =====

void __h3000 FUN_M70_r4_30000__3c16(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3C50 ->$3C16 */
  API_FE6E(param_1,param_2,&PTR_FUN_M70_r4_30000__3c50_M70_r4_30000__3bcc);
  return;
}


// ===== FUN_M70_r4_30000__3c22 @ M70_r4_30000::3c22 =====

void __h3000 FUN_M70_r4_30000__3c22(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3C50 ->$3C16 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M70_r4_30000__3c50_M70_r4_30000__3bcc);
  return;
}


// ===== FUN_M70_r4_30000__3c2e @ M70_r4_30000::3c2e =====

void __h3000 FUN_M70_r4_30000__3c2e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3C50 ->$3C16 $3C0A */
  API_FE1A(param_1,param_2,&PTR_FUN_M70_r4_30000__3c50_M70_r4_30000__3bcc);
  return;
}


// ===== FUN_M70_r4_30000__3c50 @ M70_r4_30000::3c50 =====

undefined2 __h3000 FUN_M70_r4_30000__3c50(void)

{
  undefined2 in_D;
  short in_U;
  undefined2 *puVar1;
  
  API_FE76();
  *(short *)(in_U + -2) = 100 - DAT_70c8;
  *(undefined1 *)(in_U + -3) = 0x32;
  puVar1 = (undefined2 *)(in_U + -4);
  *(undefined1 *)puVar1 = 0;
  API_FCEE();
  DAT_7158 = *puVar1;
  API_FCBC();
  return in_D;
}


// ===== FUN_M70_r4_30000__3c9c @ M70_r4_30000::3c9c =====

void __h3000 FUN_M70_r4_30000__3c9c(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M70_r4_30000__3c76);
  return;
}


// ===== FUN_M70_r4_30000__3ca8 @ M70_r4_30000::3ca8 =====

void __h3000 FUN_M70_r4_30000__3ca8(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M70_r4_30000__3c76);
  return;
}


// ===== FUN_M70_r4_30000__3cb4 @ M70_r4_30000::3cb4 =====

void __h3000 FUN_M70_r4_30000__3cb4(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M70_r4_30000__3c76);
  return;
}


// ===== FUN_M70_r4_30000__3cc0 @ M70_r4_30000::3cc0 =====

void __h3000 FUN_M70_r4_30000__3cc0(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M70_r4_30000__3c76);
  return;
}


// ===== FUN_M70_r4_30000__3ce2 @ M70_r4_30000::3ce2 =====

undefined2 __h3000 FUN_M70_r4_30000__3ce2(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(undefined1 *)(in_U + -3) = 3;
  *(undefined1 *)(in_U + -4) = 0;
  psVar1 = (short *)(in_U + -6);
  *psVar1 = DAT_70cc + DAT_70f8;
  API_FCD8();
  DAT_7124 = *psVar1;
  DAT_715a = *(short *)(&DAT_M70_r4_30000__3ac4 + *psVar1 * 2 + g_moduleBase) + g_moduleBase;
  DAT_7128 = *(short *)(&DAT_M70_r4_30000__3ac4 + *psVar1 * 2 + g_moduleBase) + g_moduleBase;
  return in_D;
}


