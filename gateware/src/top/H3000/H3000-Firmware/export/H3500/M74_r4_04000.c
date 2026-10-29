// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M74_r4_04000 M74_r4_04000::0000-M74_r4_04000::3fff, 335 functions
// Bank r4_04000 (module id 74, sub 00)

// ===== MODULE_74_01_entry @ M74_r4_04000::0119 =====

undefined2 __h3000 MODULE_74_01_entry(void)

{
  undefined2 uVar1;
  byte extraout_CC;
  
                    /* inline[API_FC60]: $011D */
  uVar1 = ModuleSetBase();
  FUN_M74_r4_04000__02d3();
  FUN_M74_r4_04000__023d();
  FUN_M74_r4_04000__02b4();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  FUN_M74_r4_04000__01af();
  if (DAT_600a != 't') {
    FUN_a2f1();
    FUN_M74_r4_04000__01d8();
    if ((extraout_CC >> 2 & 1) == 0) {
      LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
      LcdPrintInline();
      return uVar1;
    }
  }
  FUN_M74_r4_04000__03bf();
  FUN_M74_r4_04000__045d();
  if (DAT_600a != 't') {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M74_r4_04000__0791();
  API_FE10();
  return uVar1;
}


// ===== FUN_M74_r4_04000__01af @ M74_r4_04000::01af =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M74_r4_04000__01af(void)

{
  code *pcVar1;
  undefined2 in_D;
  
  pcVar1 = FUN_M74_r4_04000__2e36 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,FUN_M74_r4_04000__2e07 + g_moduleBase,&LAB_6600,
           pcVar1);
  API_FD76();
  return in_D;
}


// ===== FUN_M74_r4_04000__01d8 @ M74_r4_04000::01d8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x01ec */
/* WARNING: Restarted to delay deadcode elimination for space: register */
/* WARNING: Exceeded maximum restarts with more pending */

undefined2 __h3000 FUN_M74_r4_04000__01d8(void)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DspLoadProgram();
  if ((((extraout_CC >> 2 & 1) != 0) &&
      (DspLoadProgram(uVar1,(char)in_D,0x7411), (extraout_CC_00 >> 2 & 1) != 0)) &&
     (DspLoadProgram(uVar1,(char)in_D,0x7412), (extraout_CC_01 >> 2 & 1) != 0)) {
    API_FD3C(0);
    API_FD40();
    DAT_7034 = API_FD44();
    DAT_7036 = DAT_7034;
    DAT_7106 = DAT_7034;
    DAT_710a = DAT_7034;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7164 >> 8));
    API_FD7C();
  }
  return in_D;
}


// ===== FUN_M74_r4_04000__023d @ M74_r4_04000::023d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M74_r4_04000__023d(void)

{
  undefined2 in_D;
  
  DAT_70c8 = 0;
  DAT_7104 = 0;
  DAT_7108 = 0;
  DAT_70d4 = 0;
  DAT_70d8 = 0;
  DAT_70dc = 0;
  DAT_70e0 = 0;
  DAT_70e8 = 0;
  DAT_70ec = 0;
  DAT_710c = 0;
  DAT_710e = 0;
  DAT_7110 = 0;
  DAT_7112 = 0;
  DAT_70c2 = 0;
  DAT_7114 = 0;
  DAT_7116 = 0;
  DAT_7118 = 0;
  DAT_711a = 0;
  DAT_70f0 = 0;
  DAT_70f4 = 0;
  DAT_70f8 = 0;
  DAT_70fc = 0;
  DAT_7100 = 0;
  _DAT_7154 = 0;
  DAT_715c = 0;
  DAT_7158 = 0;
  DAT_7160 = 0;
  DAT_712c = 0;
  DAT_7134 = 0;
  DAT_7130 = 0;
  DAT_7138 = 0;
  DAT_713c = 0;
  DAT_7140 = 0;
  DAT_7144 = 0;
  DAT_7148 = 0;
  DAT_714c = 0;
  DAT_7150 = 0;
  return in_D;
}


// ===== FUN_M74_r4_04000__02b4 @ M74_r4_04000::02b4 =====

undefined2 __h3000 FUN_M74_r4_04000__02b4(void)

{
  undefined2 in_D;
  
  API_FC6C(0);
  API_FC74();
  FUN_M74_r4_04000__2abf();
  FUN_M74_r4_04000__2b3a();
  FUN_M74_r4_04000__2bb5();
  FUN_M74_r4_04000__2c30();
  FUN_M74_r4_04000__2a25();
  return in_D;
}


// ===== FUN_M74_r4_04000__02d3 @ M74_r4_04000::02d3 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M74_r4_04000__02d3(void)

{
  undefined2 in_D;
  
                    /* inline[API_FE08]: 67:A6 69:AA 73:20 75:24 65:00 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 6F:18 71:1C 81:1A 83:1E 6B:10 6D:14 7D:12 7F:16 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 79:A8 7B:AC 85:22 87:26 77:02 */
  LoadParamsScaled();
                    /* inline[API_FE04]: 19:58 1A:54 1B:56 1C:52 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 99:42 9B:46 9D:4A 9F:4E */
  LoadParamsScaled();
                    /* inline[API_FE08]: A1:38 A3:3A B9:3E BB:40 */
  LoadParamsScaled();
                    /* inline[API_FE08]: A5:76 A9:7E A7:7A AB:82 */
  LoadParamsScaled();
                    /* inline[API_FE08]: AD:72 AF:6E B1:6A B3:62 B5:60 B7:5E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 89:86 8B:88 8D:8A 8F:8C 91:8E 93:90 95:92 97:94 */
  LoadParamsScaled();
  DAT_7096 = API_FC7E(0,0xfd,0xfd);
  DAT_7098 = API_FC7E(0,0xff,0xff);
  DAT_709a = API_FC7E(1,1,&UNK_M74_r4_04000__0101);
  DAT_709c = API_FC7E(1,3,&UNK_M74_r4_04000__0103);
  DAT_7066 = API_FC7E(1,5,&UNK_M74_r4_04000__0105);
  DAT_7064 = API_FC7E(1,7,&UNK_M74_r4_04000__0107);
  return in_D;
}


// ===== FUN_M74_r4_04000__03bf @ M74_r4_04000::03bf =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M74_r4_04000__03bf(void)

{
  undefined2 in_D;
  undefined2 uVar1;
  
  DAT_716e = 0;
  DAT_7170 = 0;
  uVar1 = API_FE76(0,0,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  uVar1 = API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,
                   &PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  API_FE76((char)((ushort)uVar1 >> 8),(char)uVar1,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
                    /* inline[API_FC62]: $6095 */
  ModuleStorePtr(0x23);
                    /* inline[API_FC62]: $6097 */
  ModuleStorePtr(0x24);
  FUN_M74_r4_04000__2588();
  FUN_M74_r4_04000__26bd();
  FUN_M74_r4_04000__1260();
  FUN_M74_r4_04000__1358();
  FUN_M74_r4_04000__2131();
  FUN_M74_r4_04000__21e0();
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b6 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70ba >> 8));
  API_FD3C((char)((ushort)DAT_70b6 >> 8));
  API_FD44((char)((ushort)DAT_70ba >> 8));
  FUN_M74_r4_04000__178c();
  FUN_M74_r4_04000__19d6();
  FUN_M74_r4_04000__18fd();
  FUN_M74_r4_04000__1aaf();
  FUN_M74_r4_04000__1b59();
  FUN_M74_r4_04000__1c60();
  FUN_M74_r4_04000__0ab4();
  FUN_M74_r4_04000__0b42();
  FUN_M74_r4_04000__0bd0();
  FUN_M74_r4_04000__0c5e();
  return in_D;
}


// ===== FUN_M74_r4_04000__045d @ M74_r4_04000::045d =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 __h3000 FUN_M74_r4_04000__045d(void)

{
  undefined2 in_D;
  
                    /* inline[API_FD84]: 00 80 "l pitch " 21 $1D45 $1D51 */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "r pitch " 25 $1F59 $1F65 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "l pdelay" 29 $2262 $226E */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "r pdelay" 2D $23B7 $23C3 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "l delay " 31 $2104 $2110 */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "r delay " 35 $21B3 $21BF */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 " image  " 39 $1BED $1BF9 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "feedback" 3D $1B2C $1B38 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 "  pan1  " 41 $0A8B $0A97 */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 "  pan2  " 45 $0B19 $0B25 */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "  pan3  " 49 $0BA7 $0BB3 */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 "  pan4  " 4D $0C35 $0C41 */
  DefineParameter();
                    /* inline[API_FD84]: 0C 80 "l splice" 51 $2525 $2531 */
  DefineParameter();
                    /* inline[API_FD84]: 0D 80 "r splice" 55 $265C $2668 */
  DefineParameter();
                    /* inline[API_FD84]: 0E 80 "  mix   " 59 $29F8 $2A04 */
  DefineParameter();
                    /* inline[API_FD84]: 0F 80 " l dir  " 5D $158F $15AD */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M74_r4_04000__05ab;
  _DAT_60f7 = 0x25;
  DAT_6105 = 1;
  DAT_6106 = 0xbd;
  return in_D;
}


// ===== FUN_M74_r4_04000__05f5 @ M74_r4_04000::05f5 =====

void __h3000 FUN_M74_r4_04000__05f5(void)

{
  FUN_M74_r4_04000__1d21();
  FUN_M74_r4_04000__0791();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__0600 @ M74_r4_04000::0600 =====

void __h3000 FUN_M74_r4_04000__0600(void)

{
  FUN_M74_r4_04000__223e();
  FUN_M74_r4_04000__0791();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__060b @ M74_r4_04000::060b =====

void __h3000 FUN_M74_r4_04000__060b(void)

{
  FUN_M74_r4_04000__20e0();
  FUN_M74_r4_04000__0791();
  API_FE14();
  return;
}


// ===== FUN_M74_r4_04000__0616 @ M74_r4_04000::0616 =====

void __h3000 FUN_M74_r4_04000__0616(void)

{
  FUN_M74_r4_04000__1f35();
  FUN_M74_r4_04000__07ca();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__0621 @ M74_r4_04000::0621 =====

void __h3000 FUN_M74_r4_04000__0621(void)

{
  FUN_M74_r4_04000__2393();
  FUN_M74_r4_04000__07ca();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__062c @ M74_r4_04000::062c =====

void __h3000 FUN_M74_r4_04000__062c(void)

{
  FUN_M74_r4_04000__218f();
  FUN_M74_r4_04000__07ca();
  API_FE14();
  return;
}


// ===== FUN_M74_r4_04000__0637 @ M74_r4_04000::0637 =====

void __h3000 FUN_M74_r4_04000__0637(void)

{
  FUN_M74_r4_04000__29d4();
  FUN_M74_r4_04000__0791();
  API_FE16();
  return;
}


// ===== FUN_M74_r4_04000__0642 @ M74_r4_04000::0642 =====

void __h3000 FUN_M74_r4_04000__0642(void)

{
  FUN_M74_r4_04000__1b08();
  FUN_M74_r4_04000__0803();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__064d @ M74_r4_04000::064d =====

void __h3000 FUN_M74_r4_04000__064d(void)

{
  FUN_M74_r4_04000__1bc9();
  FUN_M74_r4_04000__0803();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__0658 @ M74_r4_04000::0658 =====

void __h3000 FUN_M74_r4_04000__0658(void)

{
  FUN_M74_r4_04000__2a86();
  FUN_M74_r4_04000__083c();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__0663 @ M74_r4_04000::0663 =====

void __h3000 FUN_M74_r4_04000__0663(void)

{
  FUN_M74_r4_04000__2b01();
  FUN_M74_r4_04000__083c();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__066e @ M74_r4_04000::066e =====

void __h3000 FUN_M74_r4_04000__066e(void)

{
  FUN_M74_r4_04000__2b7c();
  FUN_M74_r4_04000__083c();
  API_FE14();
  return;
}


// ===== FUN_M74_r4_04000__0679 @ M74_r4_04000::0679 =====

void __h3000 FUN_M74_r4_04000__0679(void)

{
  FUN_M74_r4_04000__2bf7();
  FUN_M74_r4_04000__083c();
  API_FE16();
  return;
}


// ===== FUN_M74_r4_04000__0684 @ M74_r4_04000::0684 =====

void __h3000 FUN_M74_r4_04000__0684(void)

{
  FUN_M74_r4_04000__0e58();
  FUN_M74_r4_04000__08ae();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__068f @ M74_r4_04000::068f =====

void __h3000 FUN_M74_r4_04000__068f(void)

{
  FUN_M74_r4_04000__0f3a();
  FUN_M74_r4_04000__08ae();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__069a @ M74_r4_04000::069a =====

void __h3000 FUN_M74_r4_04000__069a(void)

{
  FUN_M74_r4_04000__101c();
  FUN_M74_r4_04000__08ae();
  API_FE14();
  return;
}


// ===== FUN_M74_r4_04000__06a5 @ M74_r4_04000::06a5 =====

void __h3000 FUN_M74_r4_04000__06a5(void)

{
  FUN_M74_r4_04000__10fe();
  FUN_M74_r4_04000__08ae();
  API_FE16();
  return;
}


// ===== FUN_M74_r4_04000__06b0 @ M74_r4_04000::06b0 =====

void __h3000 FUN_M74_r4_04000__06b0(void)

{
  FUN_M74_r4_04000__0a67();
  FUN_M74_r4_04000__08e7();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__06bb @ M74_r4_04000::06bb =====

void __h3000 FUN_M74_r4_04000__06bb(void)

{
  FUN_M74_r4_04000__0af5();
  FUN_M74_r4_04000__08e7();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__06c6 @ M74_r4_04000::06c6 =====

void __h3000 FUN_M74_r4_04000__06c6(void)

{
  FUN_M74_r4_04000__0b83();
  FUN_M74_r4_04000__08e7();
  API_FE14();
  return;
}


// ===== FUN_M74_r4_04000__06d1 @ M74_r4_04000::06d1 =====

void __h3000 FUN_M74_r4_04000__06d1(void)

{
  FUN_M74_r4_04000__0c11();
  FUN_M74_r4_04000__08e7();
  API_FE16();
  return;
}


// ===== FUN_M74_r4_04000__06dc @ M74_r4_04000::06dc =====

void __h3000 FUN_M74_r4_04000__06dc(void)

{
  FUN_M74_r4_04000__2754();
  FUN_M74_r4_04000__0944();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__06e7 @ M74_r4_04000::06e7 =====

void __h3000 FUN_M74_r4_04000__06e7(void)

{
  FUN_M74_r4_04000__27f4();
  FUN_M74_r4_04000__0944();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__06f2 @ M74_r4_04000::06f2 =====

void __h3000 FUN_M74_r4_04000__06f2(void)

{
  FUN_M74_r4_04000__171a();
  FUN_M74_r4_04000__0944();
  API_FDEC();
  return;
}


// ===== FUN_M74_r4_04000__06fd @ M74_r4_04000::06fd =====

void __h3000 FUN_M74_r4_04000__06fd(void)

{
  FUN_M74_r4_04000__188b();
  FUN_M74_r4_04000__0944();
  API_FDEE();
  return;
}


// ===== FUN_M74_r4_04000__0708 @ M74_r4_04000::0708 =====

void __h3000 FUN_M74_r4_04000__0708(void)

{
  FUN_M74_r4_04000__2894();
  FUN_M74_r4_04000__0979();
  API_FE10();
  return;
}


// ===== FUN_M74_r4_04000__0713 @ M74_r4_04000::0713 =====

void __h3000 FUN_M74_r4_04000__0713(void)

{
  FUN_M74_r4_04000__2934();
  FUN_M74_r4_04000__0979();
  API_FE12();
  return;
}


// ===== FUN_M74_r4_04000__071e @ M74_r4_04000::071e =====

void __h3000 FUN_M74_r4_04000__071e(void)

{
  FUN_M74_r4_04000__1964();
  FUN_M74_r4_04000__0979();
  API_FDEC();
  return;
}


// ===== FUN_M74_r4_04000__0729 @ M74_r4_04000::0729 =====

void __h3000 FUN_M74_r4_04000__0729(void)

{
  FUN_M74_r4_04000__1a3d();
  FUN_M74_r4_04000__0979();
  API_FDEE();
  return;
}


// ===== FUN_M74_r4_04000__0734 @ M74_r4_04000::0734 =====

void __h3000 FUN_M74_r4_04000__0734(void)

{
  FUN_M74_r4_04000__155c();
  FUN_M74_r4_04000__09d2();
  API_FDE8();
  return;
}


// ===== FUN_M74_r4_04000__073f @ M74_r4_04000::073f =====

void __h3000 FUN_M74_r4_04000__073f(void)

{
  FUN_M74_r4_04000__13aa();
  FUN_M74_r4_04000__09d2();
  API_FDEA();
  return;
}


// ===== FUN_M74_r4_04000__074a @ M74_r4_04000::074a =====

void __h3000 FUN_M74_r4_04000__074a(void)

{
  FUN_M74_r4_04000__11ee();
  FUN_M74_r4_04000__09d2();
  API_FDEC();
  return;
}


// ===== FUN_M74_r4_04000__0755 @ M74_r4_04000::0755 =====

void __h3000 FUN_M74_r4_04000__0755(void)

{
  FUN_M74_r4_04000__2501();
  FUN_M74_r4_04000__09d2();
  API_FE16();
  return;
}


// ===== FUN_M74_r4_04000__0760 @ M74_r4_04000::0760 =====

void __h3000 FUN_M74_r4_04000__0760(void)

{
  FUN_M74_r4_04000__1659();
  FUN_M74_r4_04000__0a03();
  API_FDE8();
  return;
}


// ===== FUN_M74_r4_04000__076b @ M74_r4_04000::076b =====

void __h3000 FUN_M74_r4_04000__076b(void)

{
  FUN_M74_r4_04000__149b();
  FUN_M74_r4_04000__0a03();
  API_FDEA();
  return;
}


// ===== FUN_M74_r4_04000__0776 @ M74_r4_04000::0776 =====

void __h3000 FUN_M74_r4_04000__0776(void)

{
  FUN_M74_r4_04000__12e6();
  FUN_M74_r4_04000__0a03();
  API_FDEC();
  return;
}


// ===== FUN_M74_r4_04000__0781 @ M74_r4_04000::0781 =====

void __h3000 FUN_M74_r4_04000__0781(void)

{
  FUN_M74_r4_04000__2638();
  FUN_M74_r4_04000__0a03();
  API_FE16();
  return;
}


// ===== FUN_M74_r4_04000__078c @ M74_r4_04000::078c =====

void __h3000 FUN_M74_r4_04000__078c(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M74_r4_04000__0791 @ M74_r4_04000::0791 =====

void __h3000 FUN_M74_r4_04000__0791(void)

{
                    /* inline[API_FE02]: "l coarse" "l pdelay" "l delay " "  mix   " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1C86 ->$2232 ->$20D4 ->$29C8 ->$07CA ->$0803 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__07ca @ M74_r4_04000::07ca =====

void __h3000 FUN_M74_r4_04000__07ca(void)

{
                    /* inline[API_FE02]: "r coarse" "r pdelay" "r delay " "  mix   " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1E9A ->$2387 ->$2183 ->$29C8 ->$0803 ->$0791 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__0803 @ M74_r4_04000::0803 =====

void __h3000 FUN_M74_r4_04000__0803(void)

{
                    /* inline[API_FE02]: "feedback" " image  " " levels " " expert " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1AFC ->$1BD5 ->$083C ->$0875 ->$0791 ->$07CA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__083c @ M74_r4_04000::083c =====

void __h3000 FUN_M74_r4_04000__083c(void)

{
                    /* inline[API_FE02]: "left in " "right in" "left out" "rightout" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2A7A ->$2AF5 ->$2B70 ->$2BEB ->$0803 ->$0803 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__0875 @ M74_r4_04000::0875 =====

void __h3000 FUN_M74_r4_04000__0875(void)

{
                    /* inline[API_FE02]: "outputs " "patching" "lcontrol" "rcontrol" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$08AE ->$0944 ->$09D2 ->$0A03 ->$0803 ->$0803 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__08ae @ M74_r4_04000::08ae =====

void __h3000 FUN_M74_r4_04000__08ae(void)

{
                    /* inline[API_FE02]: "l pitlev" "r pitlev" "l dellev" "r dellev" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0E4C ->$0F2E ->$1010 ->$10F2 ->$08E7 ->$0920 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__08e7 @ M74_r4_04000::08e7 =====

void __h3000 FUN_M74_r4_04000__08e7(void)

{
                    /* inline[API_FE02]: "l pitpan" "r ritpan" "l delpan" "r delpan" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A5B ->$0AE9 ->$0B77 ->$0C05 ->$0920 ->$08AE */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__0920 @ M74_r4_04000::0920 =====

void __h3000 FUN_M74_r4_04000__0920(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A34 ->$0A34 ->$0A34 ->$0875 ->$08AE ->$08E7 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__0944 @ M74_r4_04000::0944 =====

void __h3000 FUN_M74_r4_04000__0944(void)

{
                    /* inline[API_FE02]: "l fdbck1" "l fdbck2" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2748 ->$27E8 ->$1702 ->$1873 ->$0979 ->$09AE */
  SetModuleHandlers();
  FUN_M74_r4_04000__1741();
  FUN_M74_r4_04000__18b2();
  API_FDF2();
  return;
}


// ===== FUN_M74_r4_04000__0979 @ M74_r4_04000::0979 =====

void __h3000 FUN_M74_r4_04000__0979(void)

{
                    /* inline[API_FE02]: "r fdbck1" "r fdbck2" [-] [-] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2888 ->$2928 ->$194C ->$1A25 ->$09AE ->$0944 */
  SetModuleHandlers();
  FUN_M74_r4_04000__198b();
  FUN_M74_r4_04000__1a64();
  API_FDF2();
  return;
}


// ===== FUN_M74_r4_04000__09ae @ M74_r4_04000::09ae =====

void __h3000 FUN_M74_r4_04000__09ae(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0A34 ->$0A34 ->$0A34 ->$0875 ->$0944 ->$0979 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M74_r4_04000__09d2 @ M74_r4_04000::09d2 =====

void __h3000 FUN_M74_r4_04000__09d2(void)

{
                    /* inline[API_FE02]: [-] [-] [-] "l splice" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1544 ->$1392 ->$11D6 ->$250D ->$0875 ->$0875 */
  SetModuleHandlers();
  FUN_M74_r4_04000__1583();
  FUN_M74_r4_04000__13d1();
  FUN_M74_r4_04000__1215();
  API_FDF2();
  return;
}


// ===== FUN_M74_r4_04000__0a03 @ M74_r4_04000::0a03 =====

void __h3000 FUN_M74_r4_04000__0a03(void)

{
                    /* inline[API_FE02]: [-] [-] [-] "r splice" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1641 ->$1483 ->$12CE ->$2644 ->$0875 ->$0875 */
  SetModuleHandlers();
  FUN_M74_r4_04000__1680();
  FUN_M74_r4_04000__14c2();
  FUN_M74_r4_04000__130d();
  API_FDF2();
  return;
}


// ===== FUN_M74_r4_04000__0a34 @ M74_r4_04000::0a34 =====

void __h3000 FUN_M74_r4_04000__0a34(void)

{
  return;
}


// ===== FUN_M74_r4_04000__0a5b @ M74_r4_04000::0a5b =====

void __h3000 FUN_M74_r4_04000__0a5b(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  return;
}


// ===== FUN_M74_r4_04000__0a67 @ M74_r4_04000::0a67 =====

void __h3000 FUN_M74_r4_04000__0a67(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0AB4 ->$0A7F */
                    /* inline[API_FDBC]: "5.94...5" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  return;
}


// ===== FUN_M74_r4_04000__0a73 @ M74_r4_04000::0a73 =====

void __h3000 FUN_M74_r4_04000__0a73(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0AB4 ->$0A7F */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  return;
}


// ===== FUN_M74_r4_04000__0a7f @ M74_r4_04000::0a7f =====

void __h3000 FUN_M74_r4_04000__0a7f(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  return;
}


// ===== FUN_M74_r4_04000__0a8b @ M74_r4_04000::0a8b =====

void __h3000 FUN_M74_r4_04000__0a8b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0AB4 ->$0A7F */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  return;
}


// ===== FUN_M74_r4_04000__0a97 @ M74_r4_04000::0a97 =====

void __h3000 FUN_M74_r4_04000__0a97(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0AB4 ->$0A7F $0A73 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  return;
}


// ===== FUN_M74_r4_04000__0ab4 @ M74_r4_04000::0ab4 =====

undefined2 __h3000 FUN_M74_r4_04000__0ab4(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35);
  FUN_M74_r4_04000__0e91();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__0ae9 @ M74_r4_04000::0ae9 =====

void __h3000 FUN_M74_r4_04000__0ae9(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  return;
}


// ===== FUN_M74_r4_04000__0af5 @ M74_r4_04000::0af5 =====

void __h3000 FUN_M74_r4_04000__0af5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0B42 ->$0B0D */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  return;
}


// ===== FUN_M74_r4_04000__0b01 @ M74_r4_04000::0b01 =====

void __h3000 FUN_M74_r4_04000__0b01(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0B42 ->$0B0D */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  return;
}


// ===== FUN_M74_r4_04000__0b0d @ M74_r4_04000::0b0d =====

void __h3000 FUN_M74_r4_04000__0b0d(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  return;
}


// ===== FUN_M74_r4_04000__0b19 @ M74_r4_04000::0b19 =====

void __h3000 FUN_M74_r4_04000__0b19(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0B42 ->$0B0D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  return;
}


// ===== FUN_M74_r4_04000__0b25 @ M74_r4_04000::0b25 =====

void __h3000 FUN_M74_r4_04000__0b25(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0B42 ->$0B0D $0B01 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  return;
}


// ===== FUN_M74_r4_04000__0b42 @ M74_r4_04000::0b42 =====

undefined2 __h3000 FUN_M74_r4_04000__0b42(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3);
  FUN_M74_r4_04000__0f73();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__0b77 @ M74_r4_04000::0b77 =====

void __h3000 FUN_M74_r4_04000__0b77(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  return;
}


// ===== FUN_M74_r4_04000__0b83 @ M74_r4_04000::0b83 =====

void __h3000 FUN_M74_r4_04000__0b83(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0BD0 ->$0B9B */
                    /* inline[API_FDBC]: "5.94...Q" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  return;
}


// ===== FUN_M74_r4_04000__0b8f @ M74_r4_04000::0b8f =====

void __h3000 FUN_M74_r4_04000__0b8f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0BD0 ->$0B9B */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  return;
}


// ===== FUN_M74_r4_04000__0b9b @ M74_r4_04000::0b9b =====

void __h3000 FUN_M74_r4_04000__0b9b(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  return;
}


// ===== FUN_M74_r4_04000__0ba7 @ M74_r4_04000::0ba7 =====

void __h3000 FUN_M74_r4_04000__0ba7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0BD0 ->$0B9B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  return;
}


// ===== FUN_M74_r4_04000__0bb3 @ M74_r4_04000::0bb3 =====

void __h3000 FUN_M74_r4_04000__0bb3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0BD0 ->$0B9B $0B8F */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  return;
}


// ===== FUN_M74_r4_04000__0bd0 @ M74_r4_04000::0bd0 =====

undefined2 __h3000 FUN_M74_r4_04000__0bd0(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51);
  FUN_M74_r4_04000__1055();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__0c05 @ M74_r4_04000::0c05 =====

void __h3000 FUN_M74_r4_04000__0c05(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  return;
}


// ===== FUN_M74_r4_04000__0c11 @ M74_r4_04000::0c11 =====

void __h3000 FUN_M74_r4_04000__0c11(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0C5E ->$0C29 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  return;
}


// ===== FUN_M74_r4_04000__0c1d @ M74_r4_04000::0c1d =====

void __h3000 FUN_M74_r4_04000__0c1d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0C5E ->$0C29 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  return;
}


// ===== FUN_M74_r4_04000__0c29 @ M74_r4_04000::0c29 =====

void __h3000 FUN_M74_r4_04000__0c29(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  return;
}


// ===== FUN_M74_r4_04000__0c35 @ M74_r4_04000::0c35 =====

void __h3000 FUN_M74_r4_04000__0c35(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$0C5E ->$0C29 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  return;
}


// ===== FUN_M74_r4_04000__0c41 @ M74_r4_04000::0c41 =====

void __h3000 FUN_M74_r4_04000__0c41(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$0C5E ->$0C29 $0C1D */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  return;
}


// ===== FUN_M74_r4_04000__0c5e @ M74_r4_04000::0c5e =====

undefined2 __h3000 FUN_M74_r4_04000__0c5e(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf);
  FUN_M74_r4_04000__1137();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__0e4c @ M74_r4_04000::0e4c =====

void __h3000 FUN_M74_r4_04000__0e4c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0E91 ->$0E70 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__0e91_M74_r4_04000__0e26);
  return;
}


// ===== FUN_M74_r4_04000__0e58 @ M74_r4_04000::0e58 =====

void __h3000 FUN_M74_r4_04000__0e58(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0E91 ->$0E70 */
                    /* inline[API_FDBC]: "5.94...&" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__0e91_M74_r4_04000__0e26);
  return;
}


// ===== FUN_M74_r4_04000__0e64 @ M74_r4_04000::0e64 =====

void __h3000 FUN_M74_r4_04000__0e64(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0E91 ->$0E70 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__0e91_M74_r4_04000__0e26);
  return;
}


// ===== FUN_M74_r4_04000__0e70 @ M74_r4_04000::0e70 =====

void __h3000 FUN_M74_r4_04000__0e70(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0E91 ->$0E70 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__0e91_M74_r4_04000__0e26);
  return;
}


// ===== FUN_M74_r4_04000__0e91 @ M74_r4_04000::0e91 =====

undefined2 __h3000 FUN_M74_r4_04000__0e91(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  *(short *)(in_U + -2) = DAT_711c + -10;
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  FUN_c0cd();
  uVar1 = DAT_70c6;
  puVar2[-1] = (char)DAT_70c6;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  puVar2[-1] = 0xff;
  puVar2 = puVar2 + -2;
  *puVar2 = 0x3f;
  API_FCE2();
  uVar1 = DAT_7124;
  puVar2[-1] = (char)DAT_7124;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7166 = *psVar3;
  API_FCF2();
  DAT_7164 = *psVar3;
  DAT_7166 = DAT_7166 - DAT_7164;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7166 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__0f2e @ M74_r4_04000::0f2e =====

void __h3000 FUN_M74_r4_04000__0f2e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$0F73 ->$0F52 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__0f73_M74_r4_04000__0f08);
  return;
}


// ===== FUN_M74_r4_04000__0f3a @ M74_r4_04000::0f3a =====

void __h3000 FUN_M74_r4_04000__0f3a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$0F73 ->$0F52 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__0f73_M74_r4_04000__0f08);
  return;
}


// ===== FUN_M74_r4_04000__0f46 @ M74_r4_04000::0f46 =====

void __h3000 FUN_M74_r4_04000__0f46(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$0F73 ->$0F52 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__0f73_M74_r4_04000__0f08);
  return;
}


// ===== FUN_M74_r4_04000__0f52 @ M74_r4_04000::0f52 =====

void __h3000 FUN_M74_r4_04000__0f52(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$0F73 ->$0F52 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__0f73_M74_r4_04000__0f08);
  return;
}


// ===== FUN_M74_r4_04000__0f73 @ M74_r4_04000::0f73 =====

undefined2 __h3000 FUN_M74_r4_04000__0f73(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  *(short *)(in_U + -2) = DAT_711e + -10;
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  FUN_c0cd();
  uVar1 = DAT_70c6;
  puVar2[-1] = (char)DAT_70c6;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  puVar2[-1] = 0xff;
  puVar2 = puVar2 + -2;
  *puVar2 = 0x3f;
  API_FCE2();
  uVar1 = DAT_7126;
  puVar2[-1] = (char)DAT_7126;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7166 = *psVar3;
  API_FCF2();
  DAT_7164 = *psVar3;
  DAT_7166 = DAT_7166 - DAT_7164;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7166 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__1010 @ M74_r4_04000::1010 =====

void __h3000 FUN_M74_r4_04000__1010(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1055 ->$1034 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__1055_M74_r4_04000__0fea);
  return;
}


// ===== FUN_M74_r4_04000__101c @ M74_r4_04000::101c =====

void __h3000 FUN_M74_r4_04000__101c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1055 ->$1034 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1055_M74_r4_04000__0fea);
  return;
}


// ===== FUN_M74_r4_04000__1028 @ M74_r4_04000::1028 =====

void __h3000 FUN_M74_r4_04000__1028(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1055 ->$1034 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1055_M74_r4_04000__0fea);
  return;
}


// ===== FUN_M74_r4_04000__1034 @ M74_r4_04000::1034 =====

void __h3000 FUN_M74_r4_04000__1034(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1055 ->$1034 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__1055_M74_r4_04000__0fea);
  return;
}


// ===== FUN_M74_r4_04000__1055 @ M74_r4_04000::1055 =====

undefined2 __h3000 FUN_M74_r4_04000__1055(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  *(short *)(in_U + -2) = DAT_7120 + -10;
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  FUN_c0cd();
  uVar1 = DAT_70c6;
  puVar2[-1] = (char)DAT_70c6;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  puVar2[-1] = 0xff;
  puVar2 = puVar2 + -2;
  *puVar2 = 0x3f;
  API_FCE2();
  uVar1 = DAT_7128;
  puVar2[-1] = (char)DAT_7128;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7166 = *psVar3;
  API_FCF2();
  DAT_7164 = *psVar3;
  DAT_7166 = DAT_7166 - DAT_7164;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7166 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__10f2 @ M74_r4_04000::10f2 =====

void __h3000 FUN_M74_r4_04000__10f2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1137 ->$1116 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__1137_M74_r4_04000__10cc);
  return;
}


// ===== FUN_M74_r4_04000__10fe @ M74_r4_04000::10fe =====

void __h3000 FUN_M74_r4_04000__10fe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1137 ->$1116 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1137_M74_r4_04000__10cc);
  return;
}


// ===== FUN_M74_r4_04000__110a @ M74_r4_04000::110a =====

void __h3000 FUN_M74_r4_04000__110a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1137 ->$1116 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1137_M74_r4_04000__10cc);
  return;
}


// ===== FUN_M74_r4_04000__1116 @ M74_r4_04000::1116 =====

void __h3000 FUN_M74_r4_04000__1116(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1137 ->$1116 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__1137_M74_r4_04000__10cc);
  return;
}


// ===== FUN_M74_r4_04000__1137 @ M74_r4_04000::1137 =====

undefined2 __h3000 FUN_M74_r4_04000__1137(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  API_FE76();
  *(short *)(in_U + -2) = DAT_7122 + -10;
  *(undefined1 *)(in_U + -3) = 5;
  puVar2 = (undefined1 *)(in_U + -4);
  *puVar2 = 0;
  API_FCEC();
  FUN_c0cd();
  uVar1 = DAT_70c6;
  puVar2[-1] = (char)DAT_70c6;
  puVar2 = puVar2 + -2;
  *puVar2 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  puVar2[-1] = 0xff;
  puVar2 = puVar2 + -2;
  *puVar2 = 0x3f;
  API_FCE2();
  uVar1 = DAT_712a;
  puVar2[-1] = (char)DAT_712a;
  psVar3 = (short *)(puVar2 + -2);
  *(char *)psVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_7166 = *psVar3;
  API_FCF2();
  DAT_7164 = *psVar3;
  DAT_7166 = DAT_7166 - DAT_7164;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7166 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__11d6 @ M74_r4_04000::11d6 =====

void __h3000 FUN_M74_r4_04000__11d6(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  return;
}


// ===== FUN_M74_r4_04000__11e2 @ M74_r4_04000::11e2 =====

void __h3000 FUN_M74_r4_04000__11e2(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  return;
}


// ===== FUN_M74_r4_04000__11ee @ M74_r4_04000::11ee =====

void __h3000 FUN_M74_r4_04000__11ee(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1260 ->$1206 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  return;
}


// ===== FUN_M74_r4_04000__11fa @ M74_r4_04000::11fa =====

void __h3000 FUN_M74_r4_04000__11fa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1260 ->$1206 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  return;
}


// ===== FUN_M74_r4_04000__1206 @ M74_r4_04000::1206 =====

void __h3000 FUN_M74_r4_04000__1206(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  FUN_M74_r4_04000__1215(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1215 @ M74_r4_04000::1215 =====

void __h3000 FUN_M74_r4_04000__1215(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  return;
}


// ===== FUN_M74_r4_04000__1221 @ M74_r4_04000::1221 =====

void __h3000 FUN_M74_r4_04000__1221(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$1260 ->$1206 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  FUN_M74_r4_04000__1215(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1230 @ M74_r4_04000::1230 =====

void __h3000 FUN_M74_r4_04000__1230(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  FUN_M74_r4_04000__1215(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__123f @ M74_r4_04000::123f =====

void __h3000 FUN_M74_r4_04000__123f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1260 ->$1206 $11FA */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae);
  return;
}


// ===== FUN_M74_r4_04000__1260 @ M74_r4_04000::1260 =====

undefined2 __h3000 FUN_M74_r4_04000__1260(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_716c = 1;
  return in_D;
}


// ===== FUN_M74_r4_04000__12ce @ M74_r4_04000::12ce =====

void __h3000 FUN_M74_r4_04000__12ce(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  return;
}


// ===== FUN_M74_r4_04000__12da @ M74_r4_04000::12da =====

void __h3000 FUN_M74_r4_04000__12da(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  return;
}


// ===== FUN_M74_r4_04000__12e6 @ M74_r4_04000::12e6 =====

void __h3000 FUN_M74_r4_04000__12e6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1358 ->$12FE */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  return;
}


// ===== FUN_M74_r4_04000__12f2 @ M74_r4_04000::12f2 =====

void __h3000 FUN_M74_r4_04000__12f2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1358 ->$12FE */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  return;
}


// ===== FUN_M74_r4_04000__12fe @ M74_r4_04000::12fe =====

void __h3000 FUN_M74_r4_04000__12fe(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  FUN_M74_r4_04000__130d(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__130d @ M74_r4_04000::130d =====

void __h3000 FUN_M74_r4_04000__130d(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  return;
}


// ===== FUN_M74_r4_04000__1319 @ M74_r4_04000::1319 =====

void __h3000 FUN_M74_r4_04000__1319(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$1358 ->$12FE */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  FUN_M74_r4_04000__130d(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1328 @ M74_r4_04000::1328 =====

void __h3000 FUN_M74_r4_04000__1328(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  FUN_M74_r4_04000__130d(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1337 @ M74_r4_04000::1337 =====

void __h3000 FUN_M74_r4_04000__1337(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1358 ->$12FE $12F2 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6);
  return;
}


// ===== FUN_M74_r4_04000__1358 @ M74_r4_04000::1358 =====

undefined2 __h3000 FUN_M74_r4_04000__1358(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_716c = 1;
  return in_D;
}


// ===== FUN_M74_r4_04000__1392 @ M74_r4_04000::1392 =====

void __h3000 FUN_M74_r4_04000__1392(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  return;
}


// ===== FUN_M74_r4_04000__139e @ M74_r4_04000::139e =====

void __h3000 FUN_M74_r4_04000__139e(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  return;
}


// ===== FUN_M74_r4_04000__13aa @ M74_r4_04000::13aa =====

void __h3000 FUN_M74_r4_04000__13aa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$141C ->$13C2 */
                    /* inline[API_FDBC]: "5.94...j" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  return;
}


// ===== FUN_M74_r4_04000__13b6 @ M74_r4_04000::13b6 =====

void __h3000 FUN_M74_r4_04000__13b6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$141C ->$13C2 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  return;
}


// ===== FUN_M74_r4_04000__13c2 @ M74_r4_04000::13c2 =====

void __h3000 FUN_M74_r4_04000__13c2(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  FUN_M74_r4_04000__13d1(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__13d1 @ M74_r4_04000::13d1 =====

void __h3000 FUN_M74_r4_04000__13d1(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  return;
}


// ===== FUN_M74_r4_04000__13dd @ M74_r4_04000::13dd =====

void __h3000 FUN_M74_r4_04000__13dd(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$141C ->$13C2 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  FUN_M74_r4_04000__13d1(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__13ec @ M74_r4_04000::13ec =====

void __h3000 FUN_M74_r4_04000__13ec(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  FUN_M74_r4_04000__13d1(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__13fb @ M74_r4_04000::13fb =====

void __h3000 FUN_M74_r4_04000__13fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$141C ->$13C2 $13B6 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  return;
}


// ===== FUN_M74_r4_04000__141c @ M74_r4_04000::141c =====

undefined2 __h3000 FUN_M74_r4_04000__141c(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a);
  FUN_M74_r4_04000__1d88();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__1483 @ M74_r4_04000::1483 =====

void __h3000 FUN_M74_r4_04000__1483(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  return;
}


// ===== FUN_M74_r4_04000__148f @ M74_r4_04000::148f =====

void __h3000 FUN_M74_r4_04000__148f(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  return;
}


// ===== FUN_M74_r4_04000__149b @ M74_r4_04000::149b =====

void __h3000 FUN_M74_r4_04000__149b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$150D ->$14B3 */
                    /* inline[API_FDBC]: "5.94...[" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  return;
}


// ===== FUN_M74_r4_04000__14a7 @ M74_r4_04000::14a7 =====

void __h3000 FUN_M74_r4_04000__14a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$150D ->$14B3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  return;
}


// ===== FUN_M74_r4_04000__14b3 @ M74_r4_04000::14b3 =====

void __h3000 FUN_M74_r4_04000__14b3(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  FUN_M74_r4_04000__14c2(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__14c2 @ M74_r4_04000::14c2 =====

void __h3000 FUN_M74_r4_04000__14c2(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  return;
}


// ===== FUN_M74_r4_04000__14ce @ M74_r4_04000::14ce =====

void __h3000 FUN_M74_r4_04000__14ce(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$150D ->$14B3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  FUN_M74_r4_04000__14c2(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__14dd @ M74_r4_04000::14dd =====

void __h3000 FUN_M74_r4_04000__14dd(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  FUN_M74_r4_04000__14c2(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__14ec @ M74_r4_04000::14ec =====

void __h3000 FUN_M74_r4_04000__14ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$150D ->$14B3 $14A7 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  return;
}


// ===== FUN_M74_r4_04000__150d @ M74_r4_04000::150d =====

undefined2 __h3000 FUN_M74_r4_04000__150d(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b);
  FUN_M74_r4_04000__1f9c();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__1544 @ M74_r4_04000::1544 =====

void __h3000 FUN_M74_r4_04000__1544(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  return;
}


// ===== FUN_M74_r4_04000__1550 @ M74_r4_04000::1550 =====

void __h3000 FUN_M74_r4_04000__1550(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  return;
}


// ===== FUN_M74_r4_04000__155c @ M74_r4_04000::155c =====

void __h3000 FUN_M74_r4_04000__155c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$15CE ->$1574 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  return;
}


// ===== FUN_M74_r4_04000__1568 @ M74_r4_04000::1568 =====

void __h3000 FUN_M74_r4_04000__1568(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$15CE ->$1574 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  return;
}


// ===== FUN_M74_r4_04000__1574 @ M74_r4_04000::1574 =====

void __h3000 FUN_M74_r4_04000__1574(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  FUN_M74_r4_04000__1583(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1583 @ M74_r4_04000::1583 =====

void __h3000 FUN_M74_r4_04000__1583(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  return;
}


// ===== FUN_M74_r4_04000__158f @ M74_r4_04000::158f =====

void __h3000 FUN_M74_r4_04000__158f(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$15CE ->$1574 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  FUN_M74_r4_04000__1583(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__159e @ M74_r4_04000::159e =====

void __h3000 FUN_M74_r4_04000__159e(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  FUN_M74_r4_04000__1583(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__15ad @ M74_r4_04000::15ad =====

void __h3000 FUN_M74_r4_04000__15ad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$15CE ->$1574 $1568 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  return;
}


// ===== FUN_M74_r4_04000__15ce @ M74_r4_04000::15ce =====

undefined2 __h3000 FUN_M74_r4_04000__15ce(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c);
  FUN_M74_r4_04000__1d88();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__1641 @ M74_r4_04000::1641 =====

void __h3000 FUN_M74_r4_04000__1641(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  return;
}


// ===== FUN_M74_r4_04000__164d @ M74_r4_04000::164d =====

void __h3000 FUN_M74_r4_04000__164d(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  return;
}


// ===== FUN_M74_r4_04000__1659 @ M74_r4_04000::1659 =====

void __h3000 FUN_M74_r4_04000__1659(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$16CB ->$1671 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  return;
}


// ===== FUN_M74_r4_04000__1665 @ M74_r4_04000::1665 =====

void __h3000 FUN_M74_r4_04000__1665(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$16CB ->$1671 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  return;
}


// ===== FUN_M74_r4_04000__1671 @ M74_r4_04000::1671 =====

void __h3000 FUN_M74_r4_04000__1671(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  FUN_M74_r4_04000__1680(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1680 @ M74_r4_04000::1680 =====

void __h3000 FUN_M74_r4_04000__1680(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  return;
}


// ===== FUN_M74_r4_04000__168c @ M74_r4_04000::168c =====

void __h3000 FUN_M74_r4_04000__168c(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$16CB ->$1671 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  FUN_M74_r4_04000__1680(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__169b @ M74_r4_04000::169b =====

void __h3000 FUN_M74_r4_04000__169b(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  FUN_M74_r4_04000__1680(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__16aa @ M74_r4_04000::16aa =====

void __h3000 FUN_M74_r4_04000__16aa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$16CB ->$1671 $1665 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  return;
}


// ===== FUN_M74_r4_04000__16cb @ M74_r4_04000::16cb =====

undefined2 __h3000 FUN_M74_r4_04000__16cb(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619);
  FUN_M74_r4_04000__1f9c();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__1702 @ M74_r4_04000::1702 =====

void __h3000 FUN_M74_r4_04000__1702(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  return;
}


// ===== FUN_M74_r4_04000__170e @ M74_r4_04000::170e =====

void __h3000 FUN_M74_r4_04000__170e(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  return;
}


// ===== FUN_M74_r4_04000__171a @ M74_r4_04000::171a =====

void __h3000 FUN_M74_r4_04000__171a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$178C ->$1732 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  return;
}


// ===== FUN_M74_r4_04000__1726 @ M74_r4_04000::1726 =====

void __h3000 FUN_M74_r4_04000__1726(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$178C ->$1732 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  return;
}


// ===== FUN_M74_r4_04000__1732 @ M74_r4_04000::1732 =====

void __h3000 FUN_M74_r4_04000__1732(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  FUN_M74_r4_04000__1741(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1741 @ M74_r4_04000::1741 =====

void __h3000 FUN_M74_r4_04000__1741(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  return;
}


// ===== FUN_M74_r4_04000__174d @ M74_r4_04000::174d =====

void __h3000 FUN_M74_r4_04000__174d(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$178C ->$1732 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  FUN_M74_r4_04000__1741(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__175c @ M74_r4_04000::175c =====

void __h3000 FUN_M74_r4_04000__175c(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  FUN_M74_r4_04000__1741(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__176b @ M74_r4_04000::176b =====

void __h3000 FUN_M74_r4_04000__176b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$178C ->$1732 $1726 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da);
  return;
}


// ===== FUN_M74_r4_04000__178c @ M74_r4_04000::178c =====

undefined2 __h3000 FUN_M74_r4_04000__178c(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_7164 = DAT_712e + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__1873 @ M74_r4_04000::1873 =====

void __h3000 FUN_M74_r4_04000__1873(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  return;
}


// ===== FUN_M74_r4_04000__187f @ M74_r4_04000::187f =====

void __h3000 FUN_M74_r4_04000__187f(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  return;
}


// ===== FUN_M74_r4_04000__188b @ M74_r4_04000::188b =====

void __h3000 FUN_M74_r4_04000__188b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$18FD ->$18A3 */
                    /* inline[API_FDBC]: "5.94...K" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  return;
}


// ===== FUN_M74_r4_04000__1897 @ M74_r4_04000::1897 =====

void __h3000 FUN_M74_r4_04000__1897(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$18FD ->$18A3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  return;
}


// ===== FUN_M74_r4_04000__18a3 @ M74_r4_04000::18a3 =====

void __h3000 FUN_M74_r4_04000__18a3(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  FUN_M74_r4_04000__18b2(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__18b2 @ M74_r4_04000::18b2 =====

void __h3000 FUN_M74_r4_04000__18b2(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  return;
}


// ===== FUN_M74_r4_04000__18be @ M74_r4_04000::18be =====

void __h3000 FUN_M74_r4_04000__18be(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$18FD ->$18A3 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  FUN_M74_r4_04000__18b2(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__18cd @ M74_r4_04000::18cd =====

void __h3000 FUN_M74_r4_04000__18cd(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  FUN_M74_r4_04000__18b2(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__18dc @ M74_r4_04000::18dc =====

void __h3000 FUN_M74_r4_04000__18dc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$18FD ->$18A3 $1897 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b);
  return;
}


// ===== FUN_M74_r4_04000__18fd @ M74_r4_04000::18fd =====

undefined2 __h3000 FUN_M74_r4_04000__18fd(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_7164 = DAT_7136 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__194c @ M74_r4_04000::194c =====

void __h3000 FUN_M74_r4_04000__194c(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  return;
}


// ===== FUN_M74_r4_04000__1958 @ M74_r4_04000::1958 =====

void __h3000 FUN_M74_r4_04000__1958(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  return;
}


// ===== FUN_M74_r4_04000__1964 @ M74_r4_04000::1964 =====

void __h3000 FUN_M74_r4_04000__1964(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$19D6 ->$197C */
                    /* inline[API_FDBC]: "5.94...$" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  return;
}


// ===== FUN_M74_r4_04000__1970 @ M74_r4_04000::1970 =====

void __h3000 FUN_M74_r4_04000__1970(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$19D6 ->$197C */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  return;
}


// ===== FUN_M74_r4_04000__197c @ M74_r4_04000::197c =====

void __h3000 FUN_M74_r4_04000__197c(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  FUN_M74_r4_04000__198b(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__198b @ M74_r4_04000::198b =====

void __h3000 FUN_M74_r4_04000__198b(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  return;
}


// ===== FUN_M74_r4_04000__1997 @ M74_r4_04000::1997 =====

void __h3000 FUN_M74_r4_04000__1997(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$19D6 ->$197C */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  FUN_M74_r4_04000__198b(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__19a6 @ M74_r4_04000::19a6 =====

void __h3000 FUN_M74_r4_04000__19a6(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  FUN_M74_r4_04000__198b(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__19b5 @ M74_r4_04000::19b5 =====

void __h3000 FUN_M74_r4_04000__19b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$19D6 ->$197C $1970 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924);
  return;
}


// ===== FUN_M74_r4_04000__19d6 @ M74_r4_04000::19d6 =====

undefined2 __h3000 FUN_M74_r4_04000__19d6(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_7164 = DAT_7132 + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__1a25 @ M74_r4_04000::1a25 =====

void __h3000 FUN_M74_r4_04000__1a25(undefined1 param_1,undefined1 param_2)

{
  FUN_f02e(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  return;
}


// ===== FUN_M74_r4_04000__1a31 @ M74_r4_04000::1a31 =====

void __h3000 FUN_M74_r4_04000__1a31(undefined1 param_1,undefined1 param_2)

{
  FUN_f039(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  return;
}


// ===== FUN_M74_r4_04000__1a3d @ M74_r4_04000::1a3d =====

void __h3000 FUN_M74_r4_04000__1a3d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1AAF ->$1A55 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  return;
}


// ===== FUN_M74_r4_04000__1a49 @ M74_r4_04000::1a49 =====

void __h3000 FUN_M74_r4_04000__1a49(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1AAF ->$1A55 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  return;
}


// ===== FUN_M74_r4_04000__1a55 @ M74_r4_04000::1a55 =====

void __h3000 FUN_M74_r4_04000__1a55(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_efb9(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  FUN_M74_r4_04000__1a64(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1a64 @ M74_r4_04000::1a64 =====

void __h3000 FUN_M74_r4_04000__1a64(undefined1 param_1,undefined1 param_2)

{
  FUN_efe5(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  return;
}


// ===== FUN_M74_r4_04000__1a70 @ M74_r4_04000::1a70 =====

void __h3000 FUN_M74_r4_04000__1a70(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
                    /* desc[API_FE1C]: ->$1AAF ->$1A55 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  FUN_M74_r4_04000__1a64(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1a7f @ M74_r4_04000::1a7f =====

void __h3000 FUN_M74_r4_04000__1a7f(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 extraout_A;
  undefined1 extraout_B;
  
  FUN_ef6c(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  FUN_M74_r4_04000__1a64(extraout_A,extraout_B,param_3);
  return;
}


// ===== FUN_M74_r4_04000__1a8e @ M74_r4_04000::1a8e =====

void __h3000 FUN_M74_r4_04000__1a8e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1AAF ->$1A55 $1A49 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd);
  return;
}


// ===== FUN_M74_r4_04000__1aaf @ M74_r4_04000::1aaf =====

undefined2 __h3000 FUN_M74_r4_04000__1aaf(void)

{
  undefined2 in_D;
  
  API_FE76();
  DAT_7164 = DAT_713a + 1;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__1afc @ M74_r4_04000::1afc =====

void __h3000 FUN_M74_r4_04000__1afc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1B59 ->$1B20 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6);
  return;
}


// ===== FUN_M74_r4_04000__1b08 @ M74_r4_04000::1b08 =====

void __h3000 FUN_M74_r4_04000__1b08(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1B59 ->$1B20 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6);
  return;
}


// ===== FUN_M74_r4_04000__1b14 @ M74_r4_04000::1b14 =====

void __h3000 FUN_M74_r4_04000__1b14(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1B59 ->$1B20 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6);
  return;
}


// ===== FUN_M74_r4_04000__1b20 @ M74_r4_04000::1b20 =====

void __h3000 FUN_M74_r4_04000__1b20(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1B59 ->$1B20 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6);
  return;
}


// ===== FUN_M74_r4_04000__1b2c @ M74_r4_04000::1b2c =====

void __h3000 FUN_M74_r4_04000__1b2c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1B59 ->$1B20 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6);
  return;
}


// ===== FUN_M74_r4_04000__1b38 @ M74_r4_04000::1b38 =====

void __h3000 FUN_M74_r4_04000__1b38(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1B59 ->$1B20 $1B14 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6);
  return;
}


// ===== FUN_M74_r4_04000__1b59 @ M74_r4_04000::1b59 =====

undefined2 __h3000 FUN_M74_r4_04000__1b59(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_70f2;
  *(char *)(in_U + -1) = (char)DAT_70f2;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_703c = *puVar2;
  FUN_M74_r4_04000__278d();
  FUN_M74_r4_04000__282d();
  FUN_M74_r4_04000__28cd();
  FUN_M74_r4_04000__296d();
  return in_D;
}


// ===== FUN_M74_r4_04000__1bc9 @ M74_r4_04000::1bc9 =====

void __h3000 FUN_M74_r4_04000__1bc9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1C60 ->$1C05 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1c60_M74_r4_04000__1b7f);
  return;
}


// ===== FUN_M74_r4_04000__1bd5 @ M74_r4_04000::1bd5 =====

void __h3000 FUN_M74_r4_04000__1bd5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1C60 ->$1C05 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__1c60_M74_r4_04000__1b7f);
  return;
}


// ===== FUN_M74_r4_04000__1be1 @ M74_r4_04000::1be1 =====

void __h3000 FUN_M74_r4_04000__1be1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1C60 ->$1C05 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1c60_M74_r4_04000__1b7f);
  return;
}


// ===== FUN_M74_r4_04000__1bed @ M74_r4_04000::1bed =====

void __h3000 FUN_M74_r4_04000__1bed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1C60 ->$1C05 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1c60_M74_r4_04000__1b7f);
  return;
}


// ===== FUN_M74_r4_04000__1bf9 @ M74_r4_04000::1bf9 =====

void __h3000 FUN_M74_r4_04000__1bf9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1C60 ->$1C05 $1BE1 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1c60_M74_r4_04000__1b7f);
  return;
}


// ===== FUN_M74_r4_04000__1c05 @ M74_r4_04000::1c05 =====

undefined2 __h3000 FUN_M74_r4_04000__1c05(void)

{
  undefined2 in_D;
  short in_U;
  short *psVar1;
  
  LcdSetCursor();
                    /* inline[API_FC38]: "                     " */
  LcdPrintInline();
  *(short *)(in_U + -2) = DAT_70c4 + 100;
  *(undefined1 *)(in_U + -3) = 10;
  psVar1 = (short *)(in_U + -4);
  *(undefined1 *)psVar1 = 0;
  API_FCEA();
  DAT_7164 = *psVar1;
  LcdSetCursor((char)((ushort)(DAT_7164 + 0x12) >> 8));
  API_FC2A();
  LcdSetCursor((char)((ushort)(0x26 - DAT_7164) >> 8));
  API_FC2A();
  return in_D;
}


// ===== FUN_M74_r4_04000__1c60 @ M74_r4_04000::1c60 =====

undefined2 __h3000 FUN_M74_r4_04000__1c60(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_70c4;
  *(char *)(in_U + -1) = (char)DAT_70c4;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70c6 = *puVar2;
  FUN_M74_r4_04000__0ab4();
  FUN_M74_r4_04000__0b42();
  FUN_M74_r4_04000__0bd0();
  FUN_M74_r4_04000__0c5e();
  return in_D;
}


// ===== FUN_M74_r4_04000__1c86 @ M74_r4_04000::1c86 =====

undefined2 __h3000 FUN_M74_r4_04000__1c86(void)

{
  undefined2 in_D;
  
  FUN_M74_r4_04000__1d2d();
  DAT_60dc = 100;
  DAT_60de = 100;
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x1c);
  LcdSetCursor();
                    /* inline[API_FC38]: "l coarse" */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M74_r4_04000__1cb3 @ M74_r4_04000::1cb3 =====

undefined2 __h3000 FUN_M74_r4_04000__1cb3(void)

{
  undefined2 in_D;
  
  FUN_M74_r4_04000__1d2d();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x1c);
  LcdSetCursor();
                    /* inline[API_FC38]: " l fine " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M74_r4_04000__1d21 @ M74_r4_04000::1d21 =====

void __h3000 FUN_M74_r4_04000__1d21(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1D88 ->$1D5D */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1d88_M74_r4_04000__1cd7);
  return;
}


// ===== FUN_M74_r4_04000__1d2d @ M74_r4_04000::1d2d =====

void __h3000 FUN_M74_r4_04000__1d2d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1D88 ->$1D5D */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__1d88_M74_r4_04000__1cd7);
  return;
}


// ===== FUN_M74_r4_04000__1d39 @ M74_r4_04000::1d39 =====

void __h3000 FUN_M74_r4_04000__1d39(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1D88 ->$1D5D */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1d88_M74_r4_04000__1cd7);
  return;
}


// ===== FUN_M74_r4_04000__1d45 @ M74_r4_04000::1d45 =====

void __h3000 FUN_M74_r4_04000__1d45(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1D88 ->$1D5D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1d88_M74_r4_04000__1cd7);
  return;
}


// ===== FUN_M74_r4_04000__1d51 @ M74_r4_04000::1d51 =====

void __h3000 FUN_M74_r4_04000__1d51(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1D88 ->$1D5D $1D39 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1d88_M74_r4_04000__1cd7);
  return;
}


// ===== FUN_M74_r4_04000__1d5d @ M74_r4_04000::1d5d =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M74_r4_04000__1d5d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$1D88 ->$1D5D */
  API_FE6E();
  uVar1 = DAT_70ce;
  *(char *)(in_U + -1) = (char)DAT_70ce;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_7182);
  return in_D;
}


// ===== FUN_M74_r4_04000__1d88 @ M74_r4_04000::1d88 =====

undefined2 __h3000 FUN_M74_r4_04000__1d88(void)

{
  short sVar1;
  undefined2 uVar2;
  ushort uVar3;
  char cVar4;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar5;
  short *psVar6;
  
  API_FE76();
  uVar3 = DAT_7106;
  *(char *)(in_U + -1) = (char)DAT_7106;
  *(char *)(in_U + -2) = (char)(uVar3 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar5 = (undefined1 *)(in_U + -4);
  *puVar5 = 0;
  API_FCE6();
  psVar6 = (short *)(puVar5 + -2);
  FUN_M74_r4_04000__2c40();
  DAT_70ce = *psVar6;
  DAT_7164 = 1000 - DAT_70ce;
  cVar4 = (char)((ushort)DAT_7164 >> 8);
  *psVar6 = CONCAT11(cVar4 >> 2,(char)((char)DAT_7164 >> 1 | cVar4 << 7) >> 1 | (cVar4 >> 1) << 7) +
            DAT_7164;
  FUN_c111();
  uVar2 = DAT_7028;
  DAT_7008 = CONCAT11(*(char *)psVar6 >> 1,(char)*psVar6 >> 1 | *(char *)psVar6 << 7);
  if (DAT_714e == 0) {
    if ((DAT_7106 < 0xff38 == (DAT_7106 == 0xff38)) && (DAT_7146 == 0)) {
      DAT_702c = DAT_7030;
      goto LAB_M74_r4_04000__1e25;
    }
  }
  else {
    DAT_7008 = 0x1000 - DAT_7008;
  }
  *(char *)((short)psVar6 + 1) = (char)DAT_7028;
  *(char *)psVar6 = (char)((ushort)uVar2 >> 8);
  sVar1 = DAT_7008;
  *(char *)((short)psVar6 + -1) = (char)DAT_7008;
  psVar6 = psVar6 + -1;
  *(char *)psVar6 = (char)((ushort)sVar1 >> 8);
  API_FCC8();
  API_FCF2();
  DAT_702c = *psVar6 * 2 + 1;
LAB_M74_r4_04000__1e25:
  if (DAT_702c < DAT_7034 && (short)DAT_7034 <= (short)DAT_702c) {
    API_FD20(0);
    API_FD2E((char)(DAT_702c >> 8));
    DAT_7034 = DAT_702c;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7008 >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7008 >> 8));
    if (DAT_716e != 1) {
      API_FD20(0);
      API_FD2E((char)(DAT_702c >> 8));
      DAT_7034 = DAT_702c;
    }
  }
  DAT_716c = 1;
  return in_D;
}


// ===== FUN_M74_r4_04000__1e9a @ M74_r4_04000::1e9a =====

undefined2 __h3000 FUN_M74_r4_04000__1e9a(void)

{
  undefined2 in_D;
  
  FUN_M74_r4_04000__1f41();
  DAT_60dc = 100;
  DAT_60de = 100;
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x1e);
  LcdSetCursor();
                    /* inline[API_FC38]: "r coarse" */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M74_r4_04000__1ec7 @ M74_r4_04000::1ec7 =====

undefined2 __h3000 FUN_M74_r4_04000__1ec7(void)

{
  undefined2 in_D;
  
  FUN_M74_r4_04000__1f41();
                    /* inline[API_FC62]: $60E3 */
  ModuleStorePtr(0x1e);
  LcdSetCursor();
                    /* inline[API_FC38]: " r fine " */
  LcdPrintInline();
  return in_D;
}


// ===== FUN_M74_r4_04000__1f35 @ M74_r4_04000::1f35 =====

void __h3000 FUN_M74_r4_04000__1f35(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1F9C ->$1F71 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__1f9c_M74_r4_04000__1eeb);
  return;
}


// ===== FUN_M74_r4_04000__1f41 @ M74_r4_04000::1f41 =====

void __h3000 FUN_M74_r4_04000__1f41(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1F9C ->$1F71 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__1f9c_M74_r4_04000__1eeb);
  return;
}


// ===== FUN_M74_r4_04000__1f4d @ M74_r4_04000::1f4d =====

void __h3000 FUN_M74_r4_04000__1f4d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1F9C ->$1F71 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__1f9c_M74_r4_04000__1eeb);
  return;
}


// ===== FUN_M74_r4_04000__1f59 @ M74_r4_04000::1f59 =====

void __h3000 FUN_M74_r4_04000__1f59(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1F9C ->$1F71 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__1f9c_M74_r4_04000__1eeb);
  return;
}


// ===== FUN_M74_r4_04000__1f65 @ M74_r4_04000::1f65 =====

void __h3000 FUN_M74_r4_04000__1f65(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1F9C ->$1F71 $1F4D */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__1f9c_M74_r4_04000__1eeb);
  return;
}


// ===== FUN_M74_r4_04000__1f71 @ M74_r4_04000::1f71 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M74_r4_04000__1f71(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  
                    /* desc[API_FE6E]: ->$1F9C ->$1F71 */
  API_FE6E();
  uVar1 = DAT_70d2;
  *(char *)(in_U + -1) = (char)DAT_70d2;
  *(char *)(in_U + -2) = (char)((ushort)uVar1 >> 8);
  API_FC40(3);
  LcdSetCursor();
  API_FC3A(0,5,&DAT_7182);
  return in_D;
}


// ===== FUN_M74_r4_04000__1f9c @ M74_r4_04000::1f9c =====

undefined2 __h3000 FUN_M74_r4_04000__1f9c(void)

{
  short sVar1;
  undefined2 uVar2;
  ushort uVar3;
  char cVar4;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar5;
  short *psVar6;
  
  API_FE76();
  uVar3 = DAT_710a;
  *(char *)(in_U + -1) = (char)DAT_710a;
  *(char *)(in_U + -2) = (char)(uVar3 >> 8);
  *(undefined1 *)(in_U + -3) = 100;
  puVar5 = (undefined1 *)(in_U + -4);
  *puVar5 = 0;
  API_FCE6();
  psVar6 = (short *)(puVar5 + -2);
  FUN_M74_r4_04000__2c40();
  DAT_70d2 = *psVar6;
  DAT_7164 = 1000 - DAT_70d2;
  cVar4 = (char)((ushort)DAT_7164 >> 8);
  *psVar6 = CONCAT11(cVar4 >> 2,(char)((char)DAT_7164 >> 1 | cVar4 << 7) >> 1 | (cVar4 >> 1) << 7) +
            DAT_7164;
  FUN_c111();
  uVar2 = DAT_702a;
  DAT_700e = CONCAT11(*(char *)psVar6 >> 1,(char)*psVar6 >> 1 | *(char *)psVar6 << 7);
  if (DAT_7152 == 0) {
    if ((DAT_710a < 0xff38 == (DAT_710a == 0xff38)) && (DAT_714a == 0)) {
      DAT_702e = DAT_7032;
      goto LAB_M74_r4_04000__2039;
    }
  }
  else {
    DAT_700e = 0x1000 - DAT_700e;
  }
  *(char *)((short)psVar6 + 1) = (char)DAT_702a;
  *(char *)psVar6 = (char)((ushort)uVar2 >> 8);
  sVar1 = DAT_700e;
  *(char *)((short)psVar6 + -1) = (char)DAT_700e;
  psVar6 = psVar6 + -1;
  *(char *)psVar6 = (char)((ushort)sVar1 >> 8);
  API_FCC8();
  API_FCF2();
  DAT_702e = *psVar6 * 2 + 1;
LAB_M74_r4_04000__2039:
  if (DAT_702e < DAT_7036 && (short)DAT_7036 <= (short)DAT_702e) {
    API_FD20(0);
    API_FD2E((char)(DAT_702e >> 8));
    DAT_7036 = DAT_702e;
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_700e >> 8));
  }
  else {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_700e >> 8));
    if (DAT_7170 != 1) {
      API_FD20(0);
      API_FD2E((char)(DAT_702e >> 8));
      DAT_7036 = DAT_702e;
    }
  }
  DAT_716c = 1;
  return in_D;
}


// ===== FUN_M74_r4_04000__20d4 @ M74_r4_04000::20d4 =====

void __h3000 FUN_M74_r4_04000__20d4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2131 ->$20F8 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae);
  return;
}


// ===== FUN_M74_r4_04000__20e0 @ M74_r4_04000::20e0 =====

void __h3000 FUN_M74_r4_04000__20e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2131 ->$20F8 */
                    /* inline[API_FDBC]: "5.94.. ." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae);
  return;
}


// ===== FUN_M74_r4_04000__20ec @ M74_r4_04000::20ec =====

void __h3000 FUN_M74_r4_04000__20ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2131 ->$20F8 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae);
  return;
}


// ===== FUN_M74_r4_04000__20f8 @ M74_r4_04000::20f8 =====

void __h3000 FUN_M74_r4_04000__20f8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2131 ->$20F8 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae);
  return;
}


// ===== FUN_M74_r4_04000__2104 @ M74_r4_04000::2104 =====

void __h3000 FUN_M74_r4_04000__2104(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2131 ->$20F8 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae);
  return;
}


// ===== FUN_M74_r4_04000__2110 @ M74_r4_04000::2110 =====

void __h3000 FUN_M74_r4_04000__2110(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2131 ->$20F8 $20EC */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae);
  return;
}


// ===== FUN_M74_r4_04000__2131 @ M74_r4_04000::2131 =====

undefined2 __h3000 FUN_M74_r4_04000__2131(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_70de;
  *(char *)(in_U + -1) = (char)DAT_70de;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c133();
  DAT_7164 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__2183 @ M74_r4_04000::2183 =====

void __h3000 FUN_M74_r4_04000__2183(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$21E0 ->$21A7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d);
  return;
}


// ===== FUN_M74_r4_04000__218f @ M74_r4_04000::218f =====

void __h3000 FUN_M74_r4_04000__218f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$21E0 ->$21A7 */
                    /* inline[API_FDBC]: "5.94..!]" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d);
  return;
}


// ===== FUN_M74_r4_04000__219b @ M74_r4_04000::219b =====

void __h3000 FUN_M74_r4_04000__219b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$21E0 ->$21A7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d);
  return;
}


// ===== FUN_M74_r4_04000__21a7 @ M74_r4_04000::21a7 =====

void __h3000 FUN_M74_r4_04000__21a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$21E0 ->$21A7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d);
  return;
}


// ===== FUN_M74_r4_04000__21b3 @ M74_r4_04000::21b3 =====

void __h3000 FUN_M74_r4_04000__21b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$21E0 ->$21A7 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d);
  return;
}


// ===== FUN_M74_r4_04000__21bf @ M74_r4_04000::21bf =====

void __h3000 FUN_M74_r4_04000__21bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$21E0 ->$21A7 $219B */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d);
  return;
}


// ===== FUN_M74_r4_04000__21e0 @ M74_r4_04000::21e0 =====

undefined2 __h3000 FUN_M74_r4_04000__21e0(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined2 *puVar2;
  
  API_FE76();
  uVar1 = DAT_70e2;
  *(char *)(in_U + -1) = (char)DAT_70e2;
  puVar2 = (undefined2 *)(in_U + -2);
  *(char *)puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c133();
  DAT_7164 = *puVar2;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__2232 @ M74_r4_04000::2232 =====

void __h3000 FUN_M74_r4_04000__2232(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$228F ->$2256 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c);
  return;
}


// ===== FUN_M74_r4_04000__223e @ M74_r4_04000::223e =====

void __h3000 FUN_M74_r4_04000__223e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$228F ->$2256 */
                    /* inline[API_FDBC]: "5.94.."." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c);
  return;
}


// ===== FUN_M74_r4_04000__224a @ M74_r4_04000::224a =====

void __h3000 FUN_M74_r4_04000__224a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$228F ->$2256 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c);
  return;
}


// ===== FUN_M74_r4_04000__2256 @ M74_r4_04000::2256 =====

void __h3000 FUN_M74_r4_04000__2256(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$228F ->$2256 */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c);
  return;
}


// ===== FUN_M74_r4_04000__2262 @ M74_r4_04000::2262 =====

void __h3000 FUN_M74_r4_04000__2262(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$228F ->$2256 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c);
  return;
}


// ===== FUN_M74_r4_04000__226e @ M74_r4_04000::226e =====

void __h3000 FUN_M74_r4_04000__226e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$228F ->$2256 $224A */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c);
  return;
}


// ===== FUN_M74_r4_04000__228f @ M74_r4_04000::228f =====

undefined2 __h3000 FUN_M74_r4_04000__228f(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(short *)(in_U + -4) = 0x2a3 - DAT_70ea;
  uVar1 = DAT_70d6;
  *(char *)(in_U + -5) = (char)DAT_70d6;
  psVar2 = (short *)(in_U + -6);
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCD8();
  FUN_c133();
  DAT_70ae = *psVar2 + DAT_70b8;
  DAT_70b2 = DAT_70ae + DAT_70b6;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70ae >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b2 >> 8));
  if (((DAT_714e != 1) && (DAT_7106 < 0xff38 == (DAT_7106 == 0xff38))) && (DAT_7146 != 0)) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7030 >> 8));
    DAT_7034 = DAT_7030;
    DAT_716e = 1;
    API_FCC2(0x13);
  }
  DAT_716c = 1;
  return in_D;
}


// ===== FUN_M74_r4_04000__233e @ M74_r4_04000::233e =====

undefined2 __h3000 FUN_M74_r4_04000__233e(void)

{
  undefined2 in_D;
  
  DAT_716e = 0;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_702c >> 8));
  DAT_7034 = DAT_702c;
  return in_D;
}


// ===== FUN_M74_r4_04000__2387 @ M74_r4_04000::2387 =====

void __h3000 FUN_M74_r4_04000__2387(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$23E4 ->$23AB */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361);
  return;
}


// ===== FUN_M74_r4_04000__2393 @ M74_r4_04000::2393 =====

void __h3000 FUN_M74_r4_04000__2393(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$23E4 ->$23AB */
                    /* inline[API_FDBC]: "5.94..#a" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361);
  return;
}


// ===== FUN_M74_r4_04000__239f @ M74_r4_04000::239f =====

void __h3000 FUN_M74_r4_04000__239f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$23E4 ->$23AB */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361);
  return;
}


// ===== FUN_M74_r4_04000__23ab @ M74_r4_04000::23ab =====

void __h3000 FUN_M74_r4_04000__23ab(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$23E4 ->$23AB */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361);
  return;
}


// ===== FUN_M74_r4_04000__23b7 @ M74_r4_04000::23b7 =====

void __h3000 FUN_M74_r4_04000__23b7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$23E4 ->$23AB */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361);
  return;
}


// ===== FUN_M74_r4_04000__23c3 @ M74_r4_04000::23c3 =====

void __h3000 FUN_M74_r4_04000__23c3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$23E4 ->$23AB $239F */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361);
  return;
}


// ===== FUN_M74_r4_04000__23e4 @ M74_r4_04000::23e4 =====

undefined2 __h3000 FUN_M74_r4_04000__23e4(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  *(undefined1 *)(in_U + -1) = 0;
  *(undefined1 *)(in_U + -2) = 0;
  *(short *)(in_U + -4) = 0x2a3 - DAT_70ee;
  uVar1 = DAT_70da;
  *(char *)(in_U + -5) = (char)DAT_70da;
  psVar2 = (short *)(in_U + -6);
  *(char *)psVar2 = (char)((ushort)uVar1 >> 8);
  API_FCD8();
  FUN_c133();
  DAT_70b0 = *psVar2 + DAT_70bc;
  DAT_70b4 = DAT_70b0 + DAT_70ba;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b0 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b4 >> 8));
  if (((DAT_7152 != 1) && (DAT_710a < 0xff38 == (DAT_710a == 0xff38))) && (DAT_714a != 0)) {
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_7032 >> 8));
    DAT_7036 = DAT_7032;
    DAT_7170 = 1;
    API_FCC4(0x13);
  }
  DAT_716c = 1;
  return in_D;
}


// ===== FUN_M74_r4_04000__2493 @ M74_r4_04000::2493 =====

undefined2 __h3000 FUN_M74_r4_04000__2493(void)

{
  undefined2 in_D;
  
  DAT_7170 = 0;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_702e >> 8));
  DAT_7036 = DAT_702e;
  return in_D;
}


// ===== FUN_M74_r4_04000__2501 @ M74_r4_04000::2501 =====

void __h3000 FUN_M74_r4_04000__2501(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2588 ->$253D */
                    /* inline[API_FDBC]: "5.94..$." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__2588_M74_r4_04000__24b6);
  return;
}


// ===== FUN_M74_r4_04000__250d @ M74_r4_04000::250d =====

void __h3000 FUN_M74_r4_04000__250d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2588 ->$253D */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__2588_M74_r4_04000__24b6);
  return;
}


// ===== FUN_M74_r4_04000__2519 @ M74_r4_04000::2519 =====

void __h3000 FUN_M74_r4_04000__2519(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2588 ->$253D */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__2588_M74_r4_04000__24b6);
  return;
}


// ===== FUN_M74_r4_04000__2525 @ M74_r4_04000::2525 =====

void __h3000 FUN_M74_r4_04000__2525(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2588 ->$253D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__2588_M74_r4_04000__24b6);
  return;
}


// ===== FUN_M74_r4_04000__2531 @ M74_r4_04000::2531 =====

void __h3000 FUN_M74_r4_04000__2531(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2588 ->$253D $2519 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__2588_M74_r4_04000__24b6);
  return;
}


// ===== FUN_M74_r4_04000__253d @ M74_r4_04000::253d =====

undefined2 __h3000 FUN_M74_r4_04000__253d(void)

{
  undefined2 in_D;
  
                    /* desc[API_FE6E]: ->$2588 ->$253D */
  API_FE6E();
  if (DAT_70b6 < 0x780 == (DAT_70b6 == 0x780)) {
    LcdSetCursor();
                    /* inline[API_FC38]: "-deglitch off-" */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "              " */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M74_r4_04000__2588 @ M74_r4_04000::2588 =====

undefined2 __h3000 FUN_M74_r4_04000__2588(void)

{
  short sVar1;
  undefined2 uVar2;
  char cVar3;
  byte bVar4;
  undefined2 in_D;
  short in_U;
  ushort *puVar5;
  
  API_FE76();
  uVar2 = DAT_70ea;
  *(char *)(in_U + -1) = (char)DAT_70ea;
  puVar5 = (ushort *)(in_U + -2);
  *(char *)puVar5 = (char)((ushort)uVar2 >> 8);
  FUN_c133();
  DAT_70b6 = *puVar5;
  DAT_70b8 = DAT_70b6;
  if (DAT_70b6 < 0x780 == (DAT_70b6 == 0x780)) {
    DAT_70b8 = 0x780;
  }
  cVar3 = (char)(DAT_70b8 >> 8);
  DAT_70be = CONCAT11(cVar3 >> 1,(char)DAT_70b8 >> 1 | cVar3 << 7) + -3;
  *(undefined1 *)((short)puVar5 + 1) = 0xff;
  *(undefined1 *)puVar5 = 0x7f;
  sVar1 = DAT_70be;
  *(char *)((short)puVar5 + -1) = (char)DAT_70be;
  puVar5 = puVar5 + -1;
  *(char *)puVar5 = (char)((ushort)sVar1 >> 8);
  API_FCEA();
  *(undefined1 *)((short)puVar5 + -1) = 0xc;
  puVar5 = puVar5 + -1;
  *(undefined1 *)puVar5 = 0;
  API_FCEE();
  bVar4 = *(byte *)puVar5;
  DAT_7028 = *puVar5;
  DAT_7030 = CONCAT11(bVar4 >> 6,
                      (char)((char)((char)((char)((char)((char)*puVar5 >> 1 | bVar4 << 7) >> 1 |
                                                 (bVar4 >> 1) << 7) >> 1 | (bVar4 >> 2) << 7) >> 1 |
                                   (bVar4 >> 3) << 7) >> 1 | (bVar4 >> 4) << 7) >> 1 |
                      (bVar4 >> 5) << 7);
  DAT_716c = 1;
  FUN_M74_r4_04000__228f();
  FUN_M74_r4_04000__1d88();
  return in_D;
}


// ===== FUN_M74_r4_04000__2638 @ M74_r4_04000::2638 =====

void __h3000 FUN_M74_r4_04000__2638(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$26BD ->$2674 */
                    /* inline[API_FDBC]: "5.94..%." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__26bd_M74_r4_04000__25ed);
  return;
}


// ===== FUN_M74_r4_04000__2644 @ M74_r4_04000::2644 =====

void __h3000 FUN_M74_r4_04000__2644(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$26BD ->$2674 */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__26bd_M74_r4_04000__25ed);
  return;
}


// ===== FUN_M74_r4_04000__2650 @ M74_r4_04000::2650 =====

void __h3000 FUN_M74_r4_04000__2650(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$26BD ->$2674 */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__26bd_M74_r4_04000__25ed);
  return;
}


// ===== FUN_M74_r4_04000__265c @ M74_r4_04000::265c =====

void __h3000 FUN_M74_r4_04000__265c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$26BD ->$2674 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__26bd_M74_r4_04000__25ed);
  return;
}


// ===== FUN_M74_r4_04000__2668 @ M74_r4_04000::2668 =====

void __h3000 FUN_M74_r4_04000__2668(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$26BD ->$2674 $2650 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__26bd_M74_r4_04000__25ed);
  return;
}


// ===== FUN_M74_r4_04000__2674 @ M74_r4_04000::2674 =====

undefined2 __h3000 FUN_M74_r4_04000__2674(void)

{
  undefined2 in_D;
  
                    /* desc[API_FE6E]: ->$26BD ->$2674 */
  API_FE6E();
  if (DAT_70ba < 0x780 == (DAT_70ba == 0x780)) {
    LcdSetCursor();
                    /* inline[API_FC38]: "-deglitch off-" */
    LcdPrintInline();
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "              " */
    LcdPrintInline();
  }
  return in_D;
}


// ===== FUN_M74_r4_04000__26bd @ M74_r4_04000::26bd =====

undefined2 __h3000 FUN_M74_r4_04000__26bd(void)

{
  short sVar1;
  undefined2 uVar2;
  char cVar3;
  byte bVar4;
  undefined2 in_D;
  short in_U;
  ushort *puVar5;
  
  API_FE76();
  uVar2 = DAT_70ee;
  *(char *)(in_U + -1) = (char)DAT_70ee;
  puVar5 = (ushort *)(in_U + -2);
  *(char *)puVar5 = (char)((ushort)uVar2 >> 8);
  FUN_c133();
  DAT_70ba = *puVar5;
  DAT_70bc = DAT_70ba;
  if (DAT_70ba < 0x780 == (DAT_70ba == 0x780)) {
    DAT_70bc = 0x780;
  }
  cVar3 = (char)(DAT_70bc >> 8);
  DAT_70c0 = CONCAT11(cVar3 >> 1,(char)DAT_70bc >> 1 | cVar3 << 7) + -3;
  *(undefined1 *)((short)puVar5 + 1) = 0xff;
  *(undefined1 *)puVar5 = 0x7f;
  sVar1 = DAT_70c0;
  *(char *)((short)puVar5 + -1) = (char)DAT_70c0;
  puVar5 = puVar5 + -1;
  *(char *)puVar5 = (char)((ushort)sVar1 >> 8);
  API_FCEA();
  *(undefined1 *)((short)puVar5 + -1) = 0xc;
  puVar5 = puVar5 + -1;
  *(undefined1 *)puVar5 = 0;
  API_FCEE();
  bVar4 = *(byte *)puVar5;
  DAT_702a = *puVar5;
  DAT_7032 = CONCAT11(bVar4 >> 6,
                      (char)((char)((char)((char)((char)((char)*puVar5 >> 1 | bVar4 << 7) >> 1 |
                                                 (bVar4 >> 1) << 7) >> 1 | (bVar4 >> 2) << 7) >> 1 |
                                   (bVar4 >> 3) << 7) >> 1 | (bVar4 >> 4) << 7) >> 1 |
                      (bVar4 >> 5) << 7);
  DAT_716c = 1;
  FUN_M74_r4_04000__23e4();
  FUN_M74_r4_04000__1f9c();
  return in_D;
}


// ===== FUN_M74_r4_04000__2748 @ M74_r4_04000::2748 =====

void __h3000 FUN_M74_r4_04000__2748(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$278D ->$276C */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__278d_M74_r4_04000__2722);
  return;
}


// ===== FUN_M74_r4_04000__2754 @ M74_r4_04000::2754 =====

void __h3000 FUN_M74_r4_04000__2754(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$278D ->$276C */
                    /* inline[API_FDBC]: "5.94..'"" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__278d_M74_r4_04000__2722);
  return;
}


// ===== FUN_M74_r4_04000__2760 @ M74_r4_04000::2760 =====

void __h3000 FUN_M74_r4_04000__2760(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$278D ->$276C */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__278d_M74_r4_04000__2722);
  return;
}


// ===== FUN_M74_r4_04000__276c @ M74_r4_04000::276c =====

void __h3000 FUN_M74_r4_04000__276c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$278D ->$276C */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__278d_M74_r4_04000__2722);
  return;
}


// ===== FUN_M74_r4_04000__278d @ M74_r4_04000::278d =====

undefined2 __h3000 FUN_M74_r4_04000__278d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_70f6;
  *(char *)(in_U + -1) = (char)DAT_70f6;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_703c;
  puVar2[-1] = (char)DAT_703c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7164 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__27e8 @ M74_r4_04000::27e8 =====

void __h3000 FUN_M74_r4_04000__27e8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$282D ->$280C */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__282d_M74_r4_04000__27c2);
  return;
}


// ===== FUN_M74_r4_04000__27f4 @ M74_r4_04000::27f4 =====

void __h3000 FUN_M74_r4_04000__27f4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$282D ->$280C */
                    /* inline[API_FDBC]: "5.94..'." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__282d_M74_r4_04000__27c2);
  return;
}


// ===== FUN_M74_r4_04000__2800 @ M74_r4_04000::2800 =====

void __h3000 FUN_M74_r4_04000__2800(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$282D ->$280C */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__282d_M74_r4_04000__27c2);
  return;
}


// ===== FUN_M74_r4_04000__280c @ M74_r4_04000::280c =====

void __h3000 FUN_M74_r4_04000__280c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$282D ->$280C */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__282d_M74_r4_04000__27c2);
  return;
}


// ===== FUN_M74_r4_04000__282d @ M74_r4_04000::282d =====

undefined2 __h3000 FUN_M74_r4_04000__282d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_70fa;
  *(char *)(in_U + -1) = (char)DAT_70fa;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_703c;
  puVar2[-1] = (char)DAT_703c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7164 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__2888 @ M74_r4_04000::2888 =====

void __h3000 FUN_M74_r4_04000__2888(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$28CD ->$28AC */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__28cd_M74_r4_04000__2862);
  return;
}


// ===== FUN_M74_r4_04000__2894 @ M74_r4_04000::2894 =====

void __h3000 FUN_M74_r4_04000__2894(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$28CD ->$28AC */
                    /* inline[API_FDBC]: "5.94..(b" */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__28cd_M74_r4_04000__2862);
  return;
}


// ===== FUN_M74_r4_04000__28a0 @ M74_r4_04000::28a0 =====

void __h3000 FUN_M74_r4_04000__28a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$28CD ->$28AC */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__28cd_M74_r4_04000__2862);
  return;
}


// ===== FUN_M74_r4_04000__28ac @ M74_r4_04000::28ac =====

void __h3000 FUN_M74_r4_04000__28ac(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$28CD ->$28AC */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__28cd_M74_r4_04000__2862);
  return;
}


// ===== FUN_M74_r4_04000__28cd @ M74_r4_04000::28cd =====

undefined2 __h3000 FUN_M74_r4_04000__28cd(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_70fe;
  *(char *)(in_U + -1) = (char)DAT_70fe;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_703c;
  puVar2[-1] = (char)DAT_703c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7164 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__2928 @ M74_r4_04000::2928 =====

void __h3000 FUN_M74_r4_04000__2928(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$296D ->$294C */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__296d_M74_r4_04000__2902);
  return;
}


// ===== FUN_M74_r4_04000__2934 @ M74_r4_04000::2934 =====

void __h3000 FUN_M74_r4_04000__2934(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$296D ->$294C */
                    /* inline[API_FDBC]: "5.94..)." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__296d_M74_r4_04000__2902);
  return;
}


// ===== FUN_M74_r4_04000__2940 @ M74_r4_04000::2940 =====

void __h3000 FUN_M74_r4_04000__2940(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$296D ->$294C */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__296d_M74_r4_04000__2902);
  return;
}


// ===== FUN_M74_r4_04000__294c @ M74_r4_04000::294c =====

void __h3000 FUN_M74_r4_04000__294c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$296D ->$294C */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__296d_M74_r4_04000__2902);
  return;
}


// ===== FUN_M74_r4_04000__296d @ M74_r4_04000::296d =====

undefined2 __h3000 FUN_M74_r4_04000__296d(void)

{
  undefined2 uVar1;
  undefined2 in_D;
  short in_U;
  undefined1 *puVar2;
  undefined2 *puVar3;
  
  API_FE76();
  uVar1 = DAT_7102;
  *(char *)(in_U + -1) = (char)DAT_7102;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  uVar1 = DAT_703c;
  puVar2[-1] = (char)DAT_703c;
  puVar3 = (undefined2 *)(puVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  DAT_7164 = *puVar3;
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7164 >> 8));
  return in_D;
}


// ===== FUN_M74_r4_04000__29c8 @ M74_r4_04000::29c8 =====

void __h3000 FUN_M74_r4_04000__29c8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2A25 ->$29EC */
  API_FE6A(param_1,param_2,&PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2);
  return;
}


// ===== FUN_M74_r4_04000__29d4 @ M74_r4_04000::29d4 =====

void __h3000 FUN_M74_r4_04000__29d4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2A25 ->$29EC */
                    /* inline[API_FDBC]: "5.94..)." */
  API_FDBC(param_1,param_2,&PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2);
  return;
}


// ===== FUN_M74_r4_04000__29e0 @ M74_r4_04000::29e0 =====

void __h3000 FUN_M74_r4_04000__29e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2A25 ->$29EC */
  API_FE6C(param_1,param_2,&PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2);
  return;
}


// ===== FUN_M74_r4_04000__29ec @ M74_r4_04000::29ec =====

void __h3000 FUN_M74_r4_04000__29ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2A25 ->$29EC */
  API_FE6E(param_1,param_2,&PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2);
  return;
}


// ===== FUN_M74_r4_04000__29f8 @ M74_r4_04000::29f8 =====

void __h3000 FUN_M74_r4_04000__29f8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2A25 ->$29EC */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2);
  return;
}


// ===== FUN_M74_r4_04000__2a04 @ M74_r4_04000::2a04 =====

void __h3000 FUN_M74_r4_04000__2a04(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2A25 ->$29EC $29E0 */
  API_FE1A(param_1,param_2,&PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2);
  return;
}


// ===== FUN_M74_r4_04000__2a25 @ M74_r4_04000::2a25 =====

undefined2 __h3000 FUN_M74_r4_04000__2a25(void)

{
  short sVar1;
  undefined2 in_D;
  short in_U;
  short *psVar2;
  
  API_FE76();
  sVar1 = 100 - DAT_70ca;
  *(short *)(in_U + -2) = sVar1;
  DAT_7164 = sVar1 * 2;
  *(undefined1 *)(in_U + -3) = 0x66;
  psVar2 = (short *)(in_U + -4);
  *(undefined1 *)psVar2 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar2 + DAT_7164) >> 8));
  API_FC72();
  return in_D;
}


// ===== FUN_M74_r4_04000__2a7a @ M74_r4_04000::2a7a =====

void __h3000 FUN_M74_r4_04000__2a7a(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M74_r4_04000__2abf_M74_r4_04000__2a54);
  return;
}


// ===== FUN_M74_r4_04000__2a86 @ M74_r4_04000::2a86 =====

void __h3000 FUN_M74_r4_04000__2a86(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2ABF ->$2A9E */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M74_r4_04000__2abf_M74_r4_04000__2a54);
  return;
}


// ===== FUN_M74_r4_04000__2a92 @ M74_r4_04000::2a92 =====

void __h3000 FUN_M74_r4_04000__2a92(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M74_r4_04000__2abf_M74_r4_04000__2a54);
  return;
}


// ===== FUN_M74_r4_04000__2a9e @ M74_r4_04000::2a9e =====

void __h3000 FUN_M74_r4_04000__2a9e(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M74_r4_04000__2abf_M74_r4_04000__2a54);
  return;
}


// ===== FUN_M74_r4_04000__2abf @ M74_r4_04000::2abf =====

undefined2 __h3000 FUN_M74_r4_04000__2abf(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__2abf_M74_r4_04000__2a54);
  API_FE52();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__2af5 @ M74_r4_04000::2af5 =====

void __h3000 FUN_M74_r4_04000__2af5(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M74_r4_04000__2b3a_M74_r4_04000__2acf);
  return;
}


// ===== FUN_M74_r4_04000__2b01 @ M74_r4_04000::2b01 =====

void __h3000 FUN_M74_r4_04000__2b01(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2B3A ->$2B19 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M74_r4_04000__2b3a_M74_r4_04000__2acf);
  return;
}


// ===== FUN_M74_r4_04000__2b0d @ M74_r4_04000::2b0d =====

void __h3000 FUN_M74_r4_04000__2b0d(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M74_r4_04000__2b3a_M74_r4_04000__2acf);
  return;
}


// ===== FUN_M74_r4_04000__2b19 @ M74_r4_04000::2b19 =====

void __h3000 FUN_M74_r4_04000__2b19(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M74_r4_04000__2b3a_M74_r4_04000__2acf);
  return;
}


// ===== FUN_M74_r4_04000__2b3a @ M74_r4_04000::2b3a =====

undefined2 __h3000 FUN_M74_r4_04000__2b3a(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__2b3a_M74_r4_04000__2acf);
  API_FE54();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__2b70 @ M74_r4_04000::2b70 =====

void __h3000 FUN_M74_r4_04000__2b70(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M74_r4_04000__2bb5_M74_r4_04000__2b4a);
  return;
}


// ===== FUN_M74_r4_04000__2b7c @ M74_r4_04000::2b7c =====

void __h3000 FUN_M74_r4_04000__2b7c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2BB5 ->$2B94 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M74_r4_04000__2bb5_M74_r4_04000__2b4a);
  return;
}


// ===== FUN_M74_r4_04000__2b88 @ M74_r4_04000::2b88 =====

void __h3000 FUN_M74_r4_04000__2b88(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M74_r4_04000__2bb5_M74_r4_04000__2b4a);
  return;
}


// ===== FUN_M74_r4_04000__2b94 @ M74_r4_04000::2b94 =====

void __h3000 FUN_M74_r4_04000__2b94(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M74_r4_04000__2bb5_M74_r4_04000__2b4a);
  return;
}


// ===== FUN_M74_r4_04000__2bb5 @ M74_r4_04000::2bb5 =====

undefined2 __h3000 FUN_M74_r4_04000__2bb5(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__2bb5_M74_r4_04000__2b4a);
  API_FE56();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__2beb @ M74_r4_04000::2beb =====

void __h3000 FUN_M74_r4_04000__2beb(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M74_r4_04000__2c30_M74_r4_04000__2bc5);
  return;
}


// ===== FUN_M74_r4_04000__2bf7 @ M74_r4_04000::2bf7 =====

void __h3000 FUN_M74_r4_04000__2bf7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$2C30 ->$2C0F */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M74_r4_04000__2c30_M74_r4_04000__2bc5);
  return;
}


// ===== FUN_M74_r4_04000__2c03 @ M74_r4_04000::2c03 =====

void __h3000 FUN_M74_r4_04000__2c03(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M74_r4_04000__2c30_M74_r4_04000__2bc5);
  return;
}


// ===== FUN_M74_r4_04000__2c0f @ M74_r4_04000::2c0f =====

void __h3000 FUN_M74_r4_04000__2c0f(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M74_r4_04000__2c30_M74_r4_04000__2bc5);
  return;
}


// ===== FUN_M74_r4_04000__2c30 @ M74_r4_04000::2c30 =====

undefined2 __h3000 FUN_M74_r4_04000__2c30(undefined1 param_1,undefined1 param_2)

{
  undefined2 uStack_8;
  
  uStack_8 = CONCAT11(param_1,param_2);
  API_FE76(param_1,param_2,&PTR_FUN_M74_r4_04000__2c30_M74_r4_04000__2bc5);
  API_FE58();
  return uStack_8;
}


// ===== FUN_M74_r4_04000__2c40 @ M74_r4_04000::2c40 =====

undefined2 __h3000 FUN_M74_r4_04000__2c40(void)

{
  undefined2 uVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined2 in_D;
  short sVar4;
  short *in_U;
  
  DAT_7166 = *in_U;
  DAT_716a = in_U[1];
  puVar2 = (undefined *)((DAT_716a + 0x30) * 2 + g_moduleBase);
  puVar3 = &DAT_M74_r4_04000__2c8f;
  if (DAT_7166 < 0 || puVar2 <= &UNK_d370) {
    sVar4 = -DAT_7166;
  }
  else {
    sVar4 = 100 - DAT_7166;
    puVar3 = &DAT_M74_r4_04000__2c91;
  }
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) +
          g_moduleBase;
  uVar1 = *(undefined2 *)(puVar2 + (short)puVar3);
  DAT_7168 = DAT_7166;
  *(char *)((short)in_U + 3) = (char)uVar1;
  *(char *)(in_U + 1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M74_r4_04000__2d3b + sVar4);
  *(char *)((short)in_U + 1) = (char)uVar1;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  return in_D;
}


// ===== FUN_M74_r4_04000__2e07 @ M74_r4_04000::2e07 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2e27 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

code * __h3000 FUN_M74_r4_04000__2e07(undefined2 param_1,undefined2 param_2)

{
  code *in_D;
  char in_stack_00000000;
  code *UNRECOVERED_JUMPTABLE;
  
  Io80A7_Clear();
  if (DAT_716c != 0) {
                    /* inline[API_FC62]: $6013 */
    ModuleStorePtr(0x2e);
    Io80A7_Set();
                    /* WARNING: Could not recover jumptable at 0x2e27. Too many branches */
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


// ===== FUN_M74_r4_04000__2e36 @ M74_r4_04000::2e36 =====

/* WARNING: Removing unreachable block (RAM,0x2ef9) */
/* WARNING: Removing unreachable block (RAM,0x2f67) */

undefined2 __h3000 FUN_M74_r4_04000__2e36(void)

{
  undefined2 in_D;
  
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7008 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_700e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70ae >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b2 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b0 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b4 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70be >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_713e >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70b6 >> 8));
  if (DAT_713e != 1) {
    API_FD3C((char)((ushort)DAT_70b6 >> 8));
  }
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70c0 >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_70ba >> 8));
  API_FD20(0);
  API_FD2E((char)((ushort)DAT_7142 >> 8));
  if (DAT_7142 != 1) {
    API_FD44((char)((ushort)DAT_70ba >> 8));
  }
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(10);
  DAT_716c = 0;
  API_FD76();
  return in_D;
}


// ===== FUN_M74_r4_04000__2f98 @ M74_r4_04000::2f98 =====

undefined2 __h3000 FUN_M74_r4_04000__2f98(void)

{
  undefined2 in_D;
  
                    /* inline[API_FC62]: $6013 */
  ModuleStorePtr(10);
  API_FD76();
  return in_D;
}


