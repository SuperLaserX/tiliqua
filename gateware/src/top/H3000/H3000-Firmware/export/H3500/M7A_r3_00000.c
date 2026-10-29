// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M7A_r3_00000 M7A_r3_00000::0000-M7A_r3_00000::3fff, 479 functions
// Bank r3_00000 (module id 7A, sub 01)

// ===== MODULE_7A_01_entry @ M7A_r3_00000::0010 =====

undefined2 __h3000 MODULE_7A_01_entry(void)

{
  undefined2 uVar1;
  char cVar2;
  byte extraout_CC;
  
                    /* inline[API_FC60]: $0014 */
  uVar1 = ModuleSetBase();
  FUN_M7A_r3_00000__02d0();
  FUN_M7A_r3_00000__3d77();
  FUN_M7A_r3_00000__045f();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  FUN_M7A_r3_00000__0184();
  if ((DAT_70d8 == 0) || (DAT_600a != 'z')) {
    FUN_a2f1();
    DAT_71f2 = 1;
    DAT_71f9 = 1;
    FUN_M7A_r3_00000__01ac();
    if (!(bool)(extraout_CC >> 2 & 1)) {
      LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
      LcdPrintInline();
      return uVar1;
    }
  }
  FUN_M7A_r3_00000__3e2f();
  FUN_M7A_r3_00000__047d();
  if ((DAT_70d8 == 0) || (DAT_600a != 'z')) {
    API_FD20(0x4e);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M7A_r3_00000__0204();
  FUN_M7A_r3_00000__1e1d();
  FUN_M7A_r3_00000__1edb();
  cVar2 = (char)DAT_7000;
  if (cVar2 == '\0') {
LAB_M7A_r3_00000__0107:
    FUN_M7A_r3_00000__0a00();
LAB_M7A_r3_00000__017d:
    API_FE10();
  }
  else {
    if (cVar2 == '\x01') {
      FUN_M7A_r3_00000__0a3f();
    }
    else {
      if (cVar2 != '\x02') {
        if (cVar2 == '\x03') {
          FUN_M7A_r3_00000__0abd();
        }
        else if (cVar2 == '\x04') {
          FUN_M7A_r3_00000__0afc();
        }
        else if (cVar2 == '\x05') {
          FUN_M7A_r3_00000__0b3b();
        }
        else if (cVar2 == '\x06') {
          FUN_M7A_r3_00000__0b65();
        }
        else if (cVar2 == '\a') {
          FUN_M7A_r3_00000__0ba4();
        }
        else if (cVar2 == '\b') {
          FUN_M7A_r3_00000__0be3();
        }
        else if (cVar2 == '\t') {
          FUN_M7A_r3_00000__0c1b();
        }
        else if (cVar2 == '\n') {
          FUN_M7A_r3_00000__0c5a();
        }
        else if (cVar2 == '\v') {
          FUN_M7A_r3_00000__0c99();
        }
        else if (cVar2 == '\f') {
          FUN_M7A_r3_00000__0cc3();
        }
        else if (cVar2 == '\r') {
          FUN_M7A_r3_00000__0d02();
        }
        else if (cVar2 == '\x0e') {
          FUN_M7A_r3_00000__0d41();
        }
        else if (cVar2 == '\x0f') {
          FUN_M7A_r3_00000__0d79();
        }
        else if (cVar2 == '\x10') {
          FUN_M7A_r3_00000__0db8();
        }
        else if (cVar2 == '\x11') {
          FUN_M7A_r3_00000__0df7();
        }
        else if (cVar2 == '\x12') {
          FUN_M7A_r3_00000__0e2f();
        }
        else {
          if (cVar2 != '\x13') goto LAB_M7A_r3_00000__0107;
          FUN_M7A_r3_00000__0e6e();
        }
        goto LAB_M7A_r3_00000__017d;
      }
      FUN_M7A_r3_00000__0a7e();
    }
    API_FDFC();
    LcdSetCursor();
    API_FC2A();
  }
  return uVar1;
}


// ===== FUN_M7A_r3_00000__0184 @ M7A_r3_00000::0184 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x01aa */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0184(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  code *pcVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  pcVar1 = FUN_M7A_r3_00000__3d77 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,&DAT_M7A_r3_00000__3d72 + g_moduleBase,&LAB_6600
           ,pcVar1);
  API_FD76();
                    /* WARNING: Could not recover jumptable at 0x01aa. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)pcVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__01ac @ M7A_r3_00000::01ac =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0202 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__01ac(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined1 uVar1;
  undefined2 in_D;
  byte extraout_CC;
  byte extraout_CC_00;
  byte extraout_CC_01;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (undefined1)((ushort)in_D >> 8);
  DspLoadProgram();
  if ((((extraout_CC >> 2 & 1) != 0) &&
      (DspLoadProgram(uVar1,2,0x7a11), (extraout_CC_00 >> 2 & 1) != 0)) &&
     (DspLoadProgram(uVar1,3,0x7a12), (extraout_CC_01 >> 2 & 1) != 0)) {
    API_FD3C(0);
    API_FD40();
    API_FD44();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70de >> 8));
    API_FD7C();
  }
                    /* WARNING: Could not recover jumptable at 0x0202. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__0204 @ M7A_r3_00000::0204 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x02ce */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0204(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = API_FD3E();
  if (sVar1 == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "NO SAMPLER          " */
    LcdPrintInline();
    DAT_70da = 0;
    DAT_70dc = "ECS";
  }
  else if (sVar1 == 1) {
    LcdSetCursor();
                    /* inline[API_FC38]: "HS322 BOARD, 23 SECS" */
    LcdPrintInline();
    DAT_70da = 1;
    DAT_70dc = (char *)0x2af8;
  }
  else if (sVar1 == 2) {
    LcdSetCursor();
                    /* inline[API_FC38]: "HS396 BOARD, 95 SECS" */
    LcdPrintInline();
    DAT_70da = 2;
    DAT_70dc = (char *)0x7d00;
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "MEMORY ERROR        " */
    LcdPrintInline();
    DAT_70da = 0;
  }
                    /* WARNING: Could not recover jumptable at 0x02ce. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__02d0 @ M7A_r3_00000::02d0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x043b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__02d0(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  char extraout_B;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FE04]: 19:D0 1A:D2 1B:D4 1C:D6 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 61:0A 62:0C 79:3A 7A:3C */
  LoadParamsSigned();
                    /* inline[API_FE04]: 6B:1E 6C:20 6D:22 6E:24 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 6F:26 70:28 71:2A 72:2C */
  LoadParamsSigned();
                    /* inline[API_FE04]: 63:0E 64:10 65:12 66:14 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 67:16 68:18 69:1A 6A:1C */
  LoadParamsSigned();
                    /* inline[API_FE04]: 77:36 78:38 7B:3E 7C:40 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 73:2E 74:30 75:32 76:34 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 9B:60 9D:62 FD:A0 FF:A2 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 9F:74 A1:76 7F:CA 81:CE */
  LoadParamsScaled();
                    /* inline[API_FE08]: B1:78 87:7A B3:7C 89:7E */
  LoadParamsScaled();
                    /* inline[API_FE08]: B5:8C B7:8E B9:88 BB:8A */
  LoadParamsScaled();
                    /* inline[API_FE08]: A3:6C 97:6E A5:70 99:72 A7:64 A9:66 AB:4C AD:4E */
  LoadParamsScaled();
                    /* inline[API_FE08]: 83:B2 85:B6 8B:BA 8D:BE 8F:C2 91:C6 93:44 95:48 */
  LoadParamsScaled();
                    /* inline[API_FE04]: AF:84 B0:86 */
  LoadParamsSigned();
  API_FC7C(1,0x15,0x115);
  extraout_B = (char)in_D;
  DAT_7058 = (short)extraout_B;
  API_FC7C(1,0x16,0x116);
  DAT_705a = (short)extraout_B;
  API_FC7C(1,0x18,0x118);
  DAT_704a = (short)extraout_B;
  API_FC7C(1,0x17,0x117);
  DAT_70d8 = (short)extraout_B;
                    /* inline[at:M7A_r3_00000::043D]: 45:00 11:80 13:82 01:A4 03:A6 */
  FUN_M7A_r3_00000__043d();
                    /* inline[at:M7A_r3_00000::043D]: 1D:A8 1F:AC 21:B0 23:B4 25:B8 27:BC 29:C0
                       2B:C4 */
  FUN_M7A_r3_00000__043d();
                    /* inline[at:M7A_r3_00000::043D]: 05:50 07:52 09:54 0B:56 0D:5C 0F:5E */
  FUN_M7A_r3_00000__043d();
                    /* inline[at:M7A_r3_00000::043D]: 19:42 1B:46 47:C8 49:CC 3D:AA 3F:AE 41:68
                       43:6A */
  FUN_M7A_r3_00000__043d();
                    /* inline[at:M7A_r3_00000::043D]: 2D:90 2F:92 31:94 33:96 35:98 37:9A 39:9C
                       3B:9E */
  FUN_M7A_r3_00000__043d();
                    /* WARNING: Could not recover jumptable at 0x043b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),extraout_B,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__043d @ M7A_r3_00000::043d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x045d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__043d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  byte bVar1;
  ushort uVar2;
  undefined2 in_D;
  undefined2 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  byte *local_res0;
  
  uVar2 = (ushort)in_D >> 8;
  while( true ) {
    UNRECOVERED_JUMPTABLE = (code *)(local_res0 + 1);
    bVar1 = *local_res0;
    if (bVar1 == 0) break;
    local_res0 = local_res0 + 2;
    puVar3 = (undefined2 *)((byte)*UNRECOVERED_JUMPTABLE + 0x7000);
    in_D = API_FC7E((char)((ushort)puVar3 >> 8),(char)puVar3,bVar1 + 0x100);
    *puVar3 = in_D;
  }
                    /* WARNING: Could not recover jumptable at 0x045d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar2,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__045f @ M7A_r3_00000::045f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x047b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__045f(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC6C(0);
  API_FC74();
  FUN_M7A_r3_00000__3b78();
  FUN_M7A_r3_00000__3bf2();
  FUN_M7A_r3_00000__3c6c();
  FUN_M7A_r3_00000__3ce6();
  FUN_M7A_r3_00000__154c();
                    /* WARNING: Could not recover jumptable at 0x047b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__047d @ M7A_r3_00000::047d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x05c8 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__047d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD84]: 00 80 "modknob1" 21 $12F1 $12FD */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "modknob2" 25 $1414 $1420 */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "dly1loop" 29 $220B $2217 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "dly2loop" 2D $22D6 $22E2 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "lfo1 frq" 31 $2505 $2511 */
  DefineParameter();
                    /* inline[API_FE78]: 05 80 "  bpm   " 35 $15F1 $0EFC */
  DefineParameterAlt();
                    /* inline[API_FD84]: 06 80 "mscale 1" 39 $3A17 $3A23 */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "mscale 2" 3D $3ABD $3AC9 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 "mix 1a  " 41 $34E7 $34F3 */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 "mix 1b  " 45 $358D $3599 */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "mix 2a  " 49 $3633 $363F */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 "mix 2b  " 4D $36D9 $36E5 */
  DefineParameter();
                    /* inline[API_FD84]: 0C 80 "mix 3a  " 51 $377F $378B */
  DefineParameter();
                    /* inline[API_FD84]: 0D 80 "mix 3b  " 55 $3825 $3831 */
  DefineParameter();
                    /* inline[API_FD84]: 0E 80 "mix 4a  " 59 $38CB $38D7 */
  DefineParameter();
                    /* inline[API_FD84]: 0F 80 "mix 4b  " 5D $3971 $397D */
  DefineParameter();
  _DAT_60f5 = PTR_ARRAY_M7A_r3_00000__05ca;
  _DAT_60f7 = 0xd9;
  DAT_6105 = 1;
  DAT_6106 = 0xbd;
                    /* WARNING: Could not recover jumptable at 0x05c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__067c @ M7A_r3_00000::067c =====

void __h3000 FUN_M7A_r3_00000__067c(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0682 @ M7A_r3_00000::0682 =====

void __h3000 FUN_M7A_r3_00000__0682(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0688 @ M7A_r3_00000::0688 =====

void __h3000 FUN_M7A_r3_00000__0688(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__068e @ M7A_r3_00000::068e =====

void __h3000 FUN_M7A_r3_00000__068e(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0694 @ M7A_r3_00000::0694 =====

void __h3000 FUN_M7A_r3_00000__0694(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__069a @ M7A_r3_00000::069a =====

void __h3000 FUN_M7A_r3_00000__069a(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06a0 @ M7A_r3_00000::06a0 =====

void __h3000 FUN_M7A_r3_00000__06a0(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06a6 @ M7A_r3_00000::06a6 =====

void __h3000 FUN_M7A_r3_00000__06a6(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06ac @ M7A_r3_00000::06ac =====

void __h3000 FUN_M7A_r3_00000__06ac(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06b2 @ M7A_r3_00000::06b2 =====

void __h3000 FUN_M7A_r3_00000__06b2(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06b8 @ M7A_r3_00000::06b8 =====

void __h3000 FUN_M7A_r3_00000__06b8(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06be @ M7A_r3_00000::06be =====

void __h3000 FUN_M7A_r3_00000__06be(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06c4 @ M7A_r3_00000::06c4 =====

void __h3000 FUN_M7A_r3_00000__06c4(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06ca @ M7A_r3_00000::06ca =====

void __h3000 FUN_M7A_r3_00000__06ca(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06d0 @ M7A_r3_00000::06d0 =====

void __h3000 FUN_M7A_r3_00000__06d0(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06d6 @ M7A_r3_00000::06d6 =====

void __h3000 FUN_M7A_r3_00000__06d6(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06dc @ M7A_r3_00000::06dc =====

void __h3000 FUN_M7A_r3_00000__06dc(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06e2 @ M7A_r3_00000::06e2 =====

void __h3000 FUN_M7A_r3_00000__06e2(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06e8 @ M7A_r3_00000::06e8 =====

void __h3000 FUN_M7A_r3_00000__06e8(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06ee @ M7A_r3_00000::06ee =====

void __h3000 FUN_M7A_r3_00000__06ee(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06f4 @ M7A_r3_00000::06f4 =====

void __h3000 FUN_M7A_r3_00000__06f4(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__06fa @ M7A_r3_00000::06fa =====

void __h3000 FUN_M7A_r3_00000__06fa(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0700 @ M7A_r3_00000::0700 =====

void __h3000 FUN_M7A_r3_00000__0700(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0706 @ M7A_r3_00000::0706 =====

void __h3000 FUN_M7A_r3_00000__0706(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__070c @ M7A_r3_00000::070c =====

void __h3000 FUN_M7A_r3_00000__070c(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0712 @ M7A_r3_00000::0712 =====

void __h3000 FUN_M7A_r3_00000__0712(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0718 @ M7A_r3_00000::0718 =====

void __h3000 FUN_M7A_r3_00000__0718(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__071e @ M7A_r3_00000::071e =====

void __h3000 FUN_M7A_r3_00000__071e(void)

{
  FUN_M7A_r3_00000__0726(0);
  return;
}


// ===== FUN_M7A_r3_00000__0726 @ M7A_r3_00000::0726 =====

void __h3000 FUN_M7A_r3_00000__0726(void)

{
  FUN_M7A_r3_00000__0f7a();
  FUN_M7A_r3_00000__09bb();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0731 @ M7A_r3_00000::0731 =====

void __h3000 FUN_M7A_r3_00000__0731(void)

{
  FUN_M7A_r3_00000__12cd();
  FUN_M7A_r3_00000__0a00();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__073c @ M7A_r3_00000::073c =====

void __h3000 FUN_M7A_r3_00000__073c(void)

{
  FUN_M7A_r3_00000__13f0();
  FUN_M7A_r3_00000__0a00();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__0747 @ M7A_r3_00000::0747 =====

void __h3000 FUN_M7A_r3_00000__0747(void)

{
  FUN_M7A_r3_00000__1513();
  FUN_M7A_r3_00000__0a00();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0752 @ M7A_r3_00000::0752 =====

void __h3000 FUN_M7A_r3_00000__0752(void)

{
  FUN_M7A_r3_00000__15c1();
  FUN_M7A_r3_00000__0a00();
  return;
}


// ===== FUN_M7A_r3_00000__0759 @ M7A_r3_00000::0759 =====

void __h3000 FUN_M7A_r3_00000__0759(void)

{
  FUN_M7A_r3_00000__1874();
  FUN_M7A_r3_00000__0abd();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__0764 @ M7A_r3_00000::0764 =====

void __h3000 FUN_M7A_r3_00000__0764(void)

{
  FUN_M7A_r3_00000__192b();
  FUN_M7A_r3_00000__0afc();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__076f @ M7A_r3_00000::076f =====

void __h3000 FUN_M7A_r3_00000__076f(void)

{
  FUN_M7A_r3_00000__19e2();
  FUN_M7A_r3_00000__0abd();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__077a @ M7A_r3_00000::077a =====

void __h3000 FUN_M7A_r3_00000__077a(void)

{
  FUN_M7A_r3_00000__1a8e();
  FUN_M7A_r3_00000__0afc();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0785 @ M7A_r3_00000::0785 =====

void __h3000 FUN_M7A_r3_00000__0785(void)

{
  FUN_M7A_r3_00000__1b3a();
  FUN_M7A_r3_00000__0abd();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__0790 @ M7A_r3_00000::0790 =====

void __h3000 FUN_M7A_r3_00000__0790(void)

{
  FUN_M7A_r3_00000__1bc2();
  FUN_M7A_r3_00000__0afc();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__079b @ M7A_r3_00000::079b =====

void __h3000 FUN_M7A_r3_00000__079b(void)

{
  FUN_M7A_r3_00000__1c65();
  FUN_M7A_r3_00000__0abd();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__07a6 @ M7A_r3_00000::07a6 =====

void __h3000 FUN_M7A_r3_00000__07a6(void)

{
  FUN_M7A_r3_00000__1d1c();
  FUN_M7A_r3_00000__0afc();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__07b1 @ M7A_r3_00000::07b1 =====

void __h3000 FUN_M7A_r3_00000__07b1(void)

{
  FUN_M7A_r3_00000__1dd3();
  FUN_M7A_r3_00000__0cc3();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__07bc @ M7A_r3_00000::07bc =====

void __h3000 FUN_M7A_r3_00000__07bc(void)

{
  FUN_M7A_r3_00000__1e91();
  FUN_M7A_r3_00000__0cc3();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__07c7 @ M7A_r3_00000::07c7 =====

void __h3000 FUN_M7A_r3_00000__07c7(void)

{
  FUN_M7A_r3_00000__1f4f();
  FUN_M7A_r3_00000__0cc3();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__07d2 @ M7A_r3_00000::07d2 =====

void __h3000 FUN_M7A_r3_00000__07d2(void)

{
  FUN_M7A_r3_00000__1ff6();
  FUN_M7A_r3_00000__0cc3();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__07dd @ M7A_r3_00000::07dd =====

void __h3000 FUN_M7A_r3_00000__07dd(void)

{
  FUN_M7A_r3_00000__209d();
  FUN_M7A_r3_00000__0d02();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__07e8 @ M7A_r3_00000::07e8 =====

void __h3000 FUN_M7A_r3_00000__07e8(void)

{
  FUN_M7A_r3_00000__2142();
  FUN_M7A_r3_00000__0d02();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__07f3 @ M7A_r3_00000::07f3 =====

void __h3000 FUN_M7A_r3_00000__07f3(void)

{
  FUN_M7A_r3_00000__21e7();
  FUN_M7A_r3_00000__0d41();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__07fe @ M7A_r3_00000::07fe =====

void __h3000 FUN_M7A_r3_00000__07fe(void)

{
  FUN_M7A_r3_00000__22b2();
  FUN_M7A_r3_00000__0d41();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0809 @ M7A_r3_00000::0809 =====

void __h3000 FUN_M7A_r3_00000__0809(void)

{
  FUN_M7A_r3_00000__2371();
  FUN_M7A_r3_00000__0d02();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0814 @ M7A_r3_00000::0814 =====

void __h3000 FUN_M7A_r3_00000__0814(void)

{
  FUN_M7A_r3_00000__2429();
  FUN_M7A_r3_00000__0d02();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__081f @ M7A_r3_00000::081f =====

void __h3000 FUN_M7A_r3_00000__081f(void)

{
  FUN_M7A_r3_00000__24e1();
  FUN_M7A_r3_00000__0d79();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__082a @ M7A_r3_00000::082a =====

void __h3000 FUN_M7A_r3_00000__082a(void)

{
  FUN_M7A_r3_00000__25a2();
  FUN_M7A_r3_00000__0d79();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__0835 @ M7A_r3_00000::0835 =====

void __h3000 FUN_M7A_r3_00000__0835(void)

{
  FUN_M7A_r3_00000__2663();
  FUN_M7A_r3_00000__0d79();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0840 @ M7A_r3_00000::0840 =====

void __h3000 FUN_M7A_r3_00000__0840(void)

{
  FUN_M7A_r3_00000__2702();
  FUN_M7A_r3_00000__0d79();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__084b @ M7A_r3_00000::084b =====

void __h3000 FUN_M7A_r3_00000__084b(void)

{
  FUN_M7A_r3_00000__27a1();
  FUN_M7A_r3_00000__0db8();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0856 @ M7A_r3_00000::0856 =====

void __h3000 FUN_M7A_r3_00000__0856(void)

{
  FUN_M7A_r3_00000__2893();
  FUN_M7A_r3_00000__0db8();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__0861 @ M7A_r3_00000::0861 =====

void __h3000 FUN_M7A_r3_00000__0861(void)

{
  FUN_M7A_r3_00000__2a07();
  FUN_M7A_r3_00000__0df7();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__086c @ M7A_r3_00000::086c =====

void __h3000 FUN_M7A_r3_00000__086c(void)

{
  FUN_M7A_r3_00000__2a9e();
  FUN_M7A_r3_00000__0df7();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0877 @ M7A_r3_00000::0877 =====

void __h3000 FUN_M7A_r3_00000__0877(void)

{
  FUN_M7A_r3_00000__2b89();
  FUN_M7A_r3_00000__0db8();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__0882 @ M7A_r3_00000::0882 =====

void __h3000 FUN_M7A_r3_00000__0882(void)

{
  FUN_M7A_r3_00000__2c1c();
  FUN_M7A_r3_00000__0db8();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__088d @ M7A_r3_00000::088d =====

void __h3000 FUN_M7A_r3_00000__088d(void)

{
  FUN_M7A_r3_00000__2caf();
  FUN_M7A_r3_00000__0c1b();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__0898 @ M7A_r3_00000::0898 =====

void __h3000 FUN_M7A_r3_00000__0898(void)

{
  FUN_M7A_r3_00000__2d4a();
  FUN_M7A_r3_00000__0c5a();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__08a3 @ M7A_r3_00000::08a3 =====

void __h3000 FUN_M7A_r3_00000__08a3(void)

{
  FUN_M7A_r3_00000__2de5();
  FUN_M7A_r3_00000__0c1b();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__08ae @ M7A_r3_00000::08ae =====

void __h3000 FUN_M7A_r3_00000__08ae(void)

{
  FUN_M7A_r3_00000__2e80();
  FUN_M7A_r3_00000__0c5a();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__08b9 @ M7A_r3_00000::08b9 =====

void __h3000 FUN_M7A_r3_00000__08b9(void)

{
  FUN_M7A_r3_00000__3013();
  FUN_M7A_r3_00000__0c1b();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__08c4 @ M7A_r3_00000::08c4 =====

void __h3000 FUN_M7A_r3_00000__08c4(void)

{
  FUN_M7A_r3_00000__30a6();
  FUN_M7A_r3_00000__0c5a();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__08cf @ M7A_r3_00000::08cf =====

void __h3000 FUN_M7A_r3_00000__08cf(void)

{
  FUN_M7A_r3_00000__3139();
  FUN_M7A_r3_00000__0c1b();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__08da @ M7A_r3_00000::08da =====

void __h3000 FUN_M7A_r3_00000__08da(void)

{
  FUN_M7A_r3_00000__31d8();
  FUN_M7A_r3_00000__0c5a();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__08e5 @ M7A_r3_00000::08e5 =====

void __h3000 FUN_M7A_r3_00000__08e5(void)

{
  FUN_M7A_r3_00000__3277();
  FUN_M7A_r3_00000__0e2f();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__08f0 @ M7A_r3_00000::08f0 =====

void __h3000 FUN_M7A_r3_00000__08f0(void)

{
  FUN_M7A_r3_00000__330a();
  FUN_M7A_r3_00000__0e2f();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__08fb @ M7A_r3_00000::08fb =====

void __h3000 FUN_M7A_r3_00000__08fb(void)

{
  FUN_M7A_r3_00000__339d();
  FUN_M7A_r3_00000__0e2f();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0906 @ M7A_r3_00000::0906 =====

void __h3000 FUN_M7A_r3_00000__0906(void)

{
  FUN_M7A_r3_00000__3430();
  FUN_M7A_r3_00000__0e2f();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__0911 @ M7A_r3_00000::0911 =====

void __h3000 FUN_M7A_r3_00000__0911(void)

{
  FUN_M7A_r3_00000__34c3();
  FUN_M7A_r3_00000__0b65();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__091c @ M7A_r3_00000::091c =====

void __h3000 FUN_M7A_r3_00000__091c(void)

{
  FUN_M7A_r3_00000__3569();
  FUN_M7A_r3_00000__0b65();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0927 @ M7A_r3_00000::0927 =====

void __h3000 FUN_M7A_r3_00000__0927(void)

{
  FUN_M7A_r3_00000__360f();
  FUN_M7A_r3_00000__0b65();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__0932 @ M7A_r3_00000::0932 =====

void __h3000 FUN_M7A_r3_00000__0932(void)

{
  FUN_M7A_r3_00000__36b5();
  FUN_M7A_r3_00000__0b65();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__093d @ M7A_r3_00000::093d =====

void __h3000 FUN_M7A_r3_00000__093d(void)

{
  FUN_M7A_r3_00000__375b();
  FUN_M7A_r3_00000__0ba4();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__0948 @ M7A_r3_00000::0948 =====

void __h3000 FUN_M7A_r3_00000__0948(void)

{
  FUN_M7A_r3_00000__3801();
  FUN_M7A_r3_00000__0ba4();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0953 @ M7A_r3_00000::0953 =====

void __h3000 FUN_M7A_r3_00000__0953(void)

{
  FUN_M7A_r3_00000__38a7();
  FUN_M7A_r3_00000__0ba4();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__095e @ M7A_r3_00000::095e =====

void __h3000 FUN_M7A_r3_00000__095e(void)

{
  FUN_M7A_r3_00000__394d();
  FUN_M7A_r3_00000__0ba4();
  API_FE16();
  return;
}


// ===== FUN_M7A_r3_00000__0969 @ M7A_r3_00000::0969 =====

void __h3000 FUN_M7A_r3_00000__0969(void)

{
  FUN_M7A_r3_00000__39f3();
  FUN_M7A_r3_00000__0be3();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__0974 @ M7A_r3_00000::0974 =====

void __h3000 FUN_M7A_r3_00000__0974(void)

{
  FUN_M7A_r3_00000__3a99();
  FUN_M7A_r3_00000__0be3();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__097f @ M7A_r3_00000::097f =====

void __h3000 FUN_M7A_r3_00000__097f(void)

{
  FUN_M7A_r3_00000__3b3f();
  FUN_M7A_r3_00000__0e98();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__098a @ M7A_r3_00000::098a =====

void __h3000 FUN_M7A_r3_00000__098a(void)

{
  FUN_M7A_r3_00000__3bb9();
  FUN_M7A_r3_00000__0e98();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__0995 @ M7A_r3_00000::0995 =====

void __h3000 FUN_M7A_r3_00000__0995(void)

{
  FUN_M7A_r3_00000__3c33();
  FUN_M7A_r3_00000__0eca();
  API_FE10();
  return;
}


// ===== FUN_M7A_r3_00000__09a0 @ M7A_r3_00000::09a0 =====

void __h3000 FUN_M7A_r3_00000__09a0(void)

{
  FUN_M7A_r3_00000__3cad();
  FUN_M7A_r3_00000__0eca();
  API_FE12();
  return;
}


// ===== FUN_M7A_r3_00000__09ab @ M7A_r3_00000::09ab =====

void __h3000 FUN_M7A_r3_00000__09ab(void)

{
  FUN_M7A_r3_00000__3d27();
  FUN_M7A_r3_00000__09bb();
  API_FE14();
  return;
}


// ===== FUN_M7A_r3_00000__09b6 @ M7A_r3_00000::09b6 =====

void __h3000 FUN_M7A_r3_00000__09b6(void)

{
  API_FDFC();
  return;
}


// ===== FUN_M7A_r3_00000__09bb @ M7A_r3_00000::09bb =====

void __h3000 FUN_M7A_r3_00000__09bb(void)

{
                    /* inline[API_FE02]: " input  " " output " "prg load" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0FF5 ->$0F0B ->$3D1B ->$0A7E ->$09BB ->$09BB */
  SetModuleHandlers();
  return;
}


// ===== FUN_M7A_r3_00000__09f4 @ M7A_r3_00000::09f4 =====

void __h3000 FUN_M7A_r3_00000__09f4(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC82();
                    /* WARNING: Could not recover jumptable at 0x09fe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


// ===== FUN_M7A_r3_00000__0a00 @ M7A_r3_00000::0a00 =====

void __h3000 FUN_M7A_r3_00000__0a00(void)

{
                    /* inline[API_FE02]: "  bpm   " "  mix   " "modknob1" "modknob2" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$16ED ->$1507 ->$12C1 ->$13E4 ->$0A3F ->$0A7E */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0a3f @ M7A_r3_00000::0a3f =====

void __h3000 FUN_M7A_r3_00000__0a3f(void)

{
                    /* inline[API_FE02]: "filters " " delays " "  lfos  " "envelope" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0ABD ->$0CC3 ->$0D79 ->$0C1B ->$0A7E ->$0A00 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0a7e @ M7A_r3_00000::0a7e =====

void __h3000 FUN_M7A_r3_00000__0a7e(void)

{
                    /* inline[API_FE02]: " mixers " "ampmods " " levels " "patching" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0B65 ->$0E2F ->$0E98 ->$09BB ->$0A00 ->$0A3F */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0abd @ M7A_r3_00000::0abd =====

void __h3000 FUN_M7A_r3_00000__0abd(void)

{
                    /* inline[API_FE02]: "cutoff 1" "  q1    " "modamt 1" " type 1 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$18AD ->$19D6 ->$1C9E ->$1B2E ->$0AFC ->$0B3B */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0afc @ M7A_r3_00000::0afc =====

void __h3000 FUN_M7A_r3_00000__0afc(void)

{
                    /* inline[API_FE02]: "cutoff 2" "  q2    " "modamt 2" " type 2 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1964 ->$1A82 ->$1D55 ->$1BB6 ->$0B3B ->$0ABD */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0b3b @ M7A_r3_00000::0b3b =====

void __h3000 FUN_M7A_r3_00000__0b3b(void)

{
                    /* inline[API_FE02]: [*] [*] [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0EFC ->$0EFC ->$0EFC ->$0A3F ->$0ABD ->$0AFC */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0b65 @ M7A_r3_00000::0b65 =====

void __h3000 FUN_M7A_r3_00000__0b65(void)

{
                    /* inline[API_FE02]: " mix1 a " " mix1 b " " mix2 a " " mix2 b " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$34B7 ->$355D ->$3603 ->$36A9 ->$0BA4 ->$0BE3 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0ba4 @ M7A_r3_00000::0ba4 =====

void __h3000 FUN_M7A_r3_00000__0ba4(void)

{
                    /* inline[API_FE02]: " mix3 a " " mix3 b " " mix4 a " " mix4 b " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$374F ->$37F5 ->$389B ->$3941 ->$0BE3 ->$0B65 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0be3 @ M7A_r3_00000::0be3 =====

void __h3000 FUN_M7A_r3_00000__0be3(void)

{
                    /* inline[API_FE02]: "mscale 1" "mscale 2" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$39E7 ->$3A8D ->$0EFC ->$0A7E ->$0B65 ->$0BA4 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0c1b @ M7A_r3_00000::0c1b =====

void __h3000 FUN_M7A_r3_00000__0c1b(void)

{
                    /* inline[API_FE02]: "env1 att" "env1 dec" "thresh 1" "ratio 1 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2CE8 ->$2E1E ->$3007 ->$312D ->$0C5A ->$0C99 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0c5a @ M7A_r3_00000::0c5a =====

void __h3000 FUN_M7A_r3_00000__0c5a(void)

{
                    /* inline[API_FE02]: "env2 att" "env2 dec" "thresh 2" "ratio 2 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2D83 ->$2EB9 ->$309A ->$31CC ->$0C99 ->$0C1B */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0c99 @ M7A_r3_00000::0c99 =====

void __h3000 FUN_M7A_r3_00000__0c99(void)

{
                    /* inline[API_FE02]: [*] [*] [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0EFC ->$0EFC ->$0EFC ->$0A3F ->$0C1B ->$0C5A */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0cc3 @ M7A_r3_00000::0cc3 =====

void __h3000 FUN_M7A_r3_00000__0cc3(void)

{
                    /* inline[API_FE02]: "delay 1 " "dly1 bpm" "delay 2 " "dly2 bpm" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1E0C ->$1F43 ->$1ECA ->$1FEA ->$0D02 ->$0D41 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0d02 @ M7A_r3_00000::0d02 =====

void __h3000 FUN_M7A_r3_00000__0d02(void)

{
                    /* inline[API_FE02]: "delay1fb" "delay1 m" "delay2fb" "delay2 m" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2091 ->$2365 ->$2136 ->$241D ->$0D41 ->$0CC3 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0d41 @ M7A_r3_00000::0d41 =====

void __h3000 FUN_M7A_r3_00000__0d41(void)

{
                    /* inline[API_FE02]: " loop 1 " " loop 2 " [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$21DB ->$22A6 ->$0EFC ->$0A3F ->$0CC3 ->$0D02 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0d79 @ M7A_r3_00000::0d79 =====

void __h3000 FUN_M7A_r3_00000__0d79(void)

{
                    /* inline[API_FE02]: "lfo1 frq" "lfo1 bpm" "lfo2 frq" "lfo2 bpm" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$24D5 ->$2657 ->$2596 ->$26F6 ->$0DB8 ->$0DF7 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0db8 @ M7A_r3_00000::0db8 =====

void __h3000 FUN_M7A_r3_00000__0db8(void)

{
                    /* inline[API_FE02]: "lfo1 mod" "lfo1wave" "lfo2 mod" "lfo2wave" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2B7D ->$2795 ->$2C10 ->$2887 ->$0DF7 ->$0D79 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0df7 @ M7A_r3_00000::0df7 =====

void __h3000 FUN_M7A_r3_00000__0df7(void)

{
                    /* inline[API_FE02]: "thresh 1" "thresh 2" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$29FB ->$2A92 ->$0EFC ->$0A3F ->$0D79 ->$0DB8 */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0e2f @ M7A_r3_00000::0e2f =====

void __h3000 FUN_M7A_r3_00000__0e2f(void)

{
                    /* inline[API_FE02]: "am1 amt " "am1 ofs " "am2 amt " "amt ofs " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$326B ->$3391 ->$32FE ->$3424 ->$0E6E ->$0E6E */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0e6e @ M7A_r3_00000::0e6e =====

void __h3000 FUN_M7A_r3_00000__0e6e(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0EFC ->$0EFC ->$0EFC ->$0A7E ->$0E2F ->$0E2F */
  SetModuleHandlers();
  FUN_M7A_r3_00000__09f4(0);
  return;
}


// ===== FUN_M7A_r3_00000__0e98 @ M7A_r3_00000::0e98 =====

void __h3000 FUN_M7A_r3_00000__0e98(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3B33 ->$3BAD ->$0EFC ->$0A7E ->$0ECA ->$0ECA */
  SetModuleHandlers();
  return;
}


// ===== FUN_M7A_r3_00000__0eca @ M7A_r3_00000::0eca =====

void __h3000 FUN_M7A_r3_00000__0eca(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3C27 ->$3CA1 ->$0EFC ->$0A7E ->$0E98 ->$0E98 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M7A_r3_00000__0efc @ M7A_r3_00000::0efc =====

void __h3000 FUN_M7A_r3_00000__0efc(void)

{
  return;
}


// ===== FUN_M7A_r3_00000__0efd @ M7A_r3_00000::0efd =====

void __h3000 FUN_M7A_r3_00000__0efd(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 uVar1;
  
  uVar1 = (undefined1)((ushort)param_3 >> 8);
  API_FD20(0);
  API_FD2E(uVar1);
  return;
}


// ===== FUN_M7A_r3_00000__0f0b @ M7A_r3_00000::0f0b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0f42 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0f0b(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6074 = DAT_7008;
  API_FDFC();
  LcdSetCursor();
  API_FC2A();
                    /* inline[API_FC16]: 01 10 02 01 01 00 0B 80 $0019 $0000 $0000 ->$0FAF ->$0F44
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M7A_r3_00000__0faf();
                    /* WARNING: Could not recover jumptable at 0x0f42. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__0f44 @ M7A_r3_00000::0f44 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0f78 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0f44(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7008 = DAT_6074;
  cVar1 = (byte)DAT_7006 << 1;
  *(undefined2 *)
   ((short)&DAT_700a + CONCAT11((char)((ushort)DAT_7006 >> 8) << 1 | (byte)DAT_7006 >> 7,cVar1)) =
       DAT_6074;
  API_FE40();
  FUN_M7A_r3_00000__0fb3();
  FUN_M7A_r3_00000__0faf();
  API_FC80((char)((ushort)DAT_7008 >> 8));
                    /* WARNING: Could not recover jumptable at 0x0f78. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__0f7a @ M7A_r3_00000::0f7a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0fad */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0f7a(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7006 = in_D;
  API_FC8E();
  DAT_7008 = DAT_60f9;
  cVar1 = (byte)DAT_7006 << 1;
  *(undefined2 *)
   ((short)&DAT_700a + CONCAT11((char)((ushort)DAT_7006 >> 8) << 1 | (byte)DAT_7006 >> 7,cVar1)) =
       DAT_60f9;
  FUN_M7A_r3_00000__0fb3();
  FUN_M7A_r3_00000__0faf();
  API_FC80((char)((ushort)DAT_7008 >> 8));
                    /* WARNING: Could not recover jumptable at 0x0fad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__0faf @ M7A_r3_00000::0faf =====

void __h3000 FUN_M7A_r3_00000__0faf(void)

{
  FUN_M7A_r3_00000__1048();
  return;
}


// ===== FUN_M7A_r3_00000__0fb3 @ M7A_r3_00000::0fb3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0fd7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0fb3(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  short sVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FD20(0);
  sVar2 = CONCAT11((char)((ushort)DAT_7006 >> 8) << 1 | (byte)DAT_7006 >> 7,(byte)DAT_7006 << 1);
  sVar1 = *(short *)((short)&DAT_700a + sVar2) + 1;
  uVar3 = (undefined1)sVar1;
  API_FD2E((char)((ushort)sVar1 >> 8),uVar3,sVar2,DAT_7006 + 0x730);
                    /* WARNING: Could not recover jumptable at 0x0fd7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__0fd9 @ M7A_r3_00000::0fd9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0ff3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0fd9(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7006 = 0;
  do {
    sVar1 = FUN_M7A_r3_00000__0fb3();
    DAT_7006 = sVar1 + 1;
  } while (DAT_7006 < 0x1c);
  DAT_7006 = 0;
                    /* WARNING: Could not recover jumptable at 0x0ff3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__0ff5 @ M7A_r3_00000::0ff5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x102c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__0ff5(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6074 = DAT_7006;
  API_FDFC();
  LcdSetCursor();
  API_FC2A();
                    /* inline[API_FC16]: 01 10 02 01 01 00 09 80 $001B $0000 $0000 ->$1048 ->$102E
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M7A_r3_00000__102e();
                    /* WARNING: Could not recover jumptable at 0x102c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__102e @ M7A_r3_00000::102e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1046 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__102e(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7006 = DAT_6074;
  cVar1 = (byte)DAT_6074 << 1;
  DAT_7008 = *(undefined2 *)
              ((short)&DAT_700a +
              CONCAT11((char)((ushort)DAT_6074 >> 8) << 1 | (byte)DAT_6074 >> 7,cVar1));
  FUN_M7A_r3_00000__1080();
  FUN_M7A_r3_00000__1048();
                    /* WARNING: Could not recover jumptable at 0x1046. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1048 @ M7A_r3_00000::1048 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x107e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1048(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M7A_r3_00000__1081 + (DAT_7006 & 0xff) * 9 + g_moduleBase) >> 8),9,
           &UNK_M7A_r3_00000__1081 + (DAT_7006 & 0xff) * 9 + g_moduleBase);
  LcdSetCursor();
  sVar1 = (DAT_7008 & 0xff) * 0xb;
  API_FC3A((char)((ushort)(&UNK_M7A_r3_00000__117d + sVar1 + g_moduleBase) >> 8),0xb,
           &UNK_M7A_r3_00000__117d + sVar1 + g_moduleBase);
                    /* WARNING: Could not recover jumptable at 0x107e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1080 @ M7A_r3_00000::1080 =====

void __h3000 FUN_M7A_r3_00000__1080(void)

{
  return;
}


// ===== FUN_M7A_r3_00000__12c1 @ M7A_r3_00000::12c1 =====

void __h3000 FUN_M7A_r3_00000__12c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$131E ->$12E5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b);
  return;
}


// ===== FUN_M7A_r3_00000__12cd @ M7A_r3_00000::12cd =====

void __h3000 FUN_M7A_r3_00000__12cd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$131E ->$12E5 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b);
  return;
}


// ===== FUN_M7A_r3_00000__12d9 @ M7A_r3_00000::12d9 =====

void __h3000 FUN_M7A_r3_00000__12d9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$131E ->$12E5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b);
  return;
}


// ===== FUN_M7A_r3_00000__12e5 @ M7A_r3_00000::12e5 =====

void __h3000 FUN_M7A_r3_00000__12e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$131E ->$12E5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b);
  return;
}


// ===== FUN_M7A_r3_00000__12f1 @ M7A_r3_00000::12f1 =====

void __h3000 FUN_M7A_r3_00000__12f1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$131E ->$12E5 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b);
  return;
}


// ===== FUN_M7A_r3_00000__12fd @ M7A_r3_00000::12fd =====

void __h3000 FUN_M7A_r3_00000__12fd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$131E ->$12E5 $12D9 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b);
  return;
}


// ===== FUN_M7A_r3_00000__131e @ M7A_r3_00000::131e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x13bc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__131e(undefined2 param_1,undefined2 param_2,short param_3)

{
  byte bVar1;
  ushort in_D;
  ushort uVar2;
  undefined2 uVar3;
  byte bVar4;
  short sVar5;
  short *psVar6;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = (byte)(in_D >> 8);
  sVar5 = param_3;
  API_FE76();
  if (DAT_71f2 == '\0') {
    FUN_M7A_r3_00000__0efd(0,(char)in_D,1,0x74f);
    API_FD20(0);
    API_FD42();
    DAT_71f0 = (ushort)bVar1;
    bVar4 = bVar1;
    if (DAT_71f0 == 0) goto LAB_M7A_r3_00000__13bc;
    uVar2 = FUN_M7A_r3_00000__0efd(0,bVar1,0,0x77c);
    in_D = uVar2 & 0xff;
    FUN_M7A_r3_00000__0efd((char)(uVar2 >> 8),(char)uVar2,0,0);
  }
  else {
    DAT_71f2 = '\0';
    DAT_71ee = 0;
    DAT_71f0 = 1;
  }
  uVar3 = DAT_70f0;
  *(char *)(sVar5 + -1) = (char)DAT_70f0;
  psVar6 = (short *)(sVar5 + -2);
  *(char *)psVar6 = (char)((ushort)uVar3 >> 8);
  FUN_c0ef();
  DAT_71ec = *psVar6;
  bVar4 = (byte)in_D;
  if (DAT_71ec - DAT_71ee != 0) {
    *psVar6 = DAT_71ec - DAT_71ee;
    API_FCC8();
    uVar2 = DAT_71f0;
    *(char *)((short)psVar6 + -1) = (char)DAT_71f0;
    psVar6 = psVar6 + -1;
    *(char *)psVar6 = (char)(uVar2 >> 8);
    API_FCEA();
    DAT_70de = *psVar6;
    if (DAT_70de == 0) {
      DAT_70de = 1;
    }
    uVar3 = FUN_M7A_r3_00000__0efd
                      ((char)((ushort)DAT_70de >> 8),(char)DAT_70de,DAT_71ec,FUN_M7A_r3_00000__077a,
                       psVar6 + 1);
    FUN_M7A_r3_00000__0efd((char)((ushort)uVar3 >> 8),(byte)uVar3,DAT_70de,0x77b);
    DAT_71ee = DAT_71ec;
    bVar4 = (byte)uVar3;
  }
LAB_M7A_r3_00000__13bc:
                    /* WARNING: Could not recover jumptable at 0x13bc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar1,bVar4,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__13e4 @ M7A_r3_00000::13e4 =====

void __h3000 FUN_M7A_r3_00000__13e4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1441 ->$1408 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be);
  return;
}


// ===== FUN_M7A_r3_00000__13f0 @ M7A_r3_00000::13f0 =====

void __h3000 FUN_M7A_r3_00000__13f0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1441 ->$1408 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be);
  return;
}


// ===== FUN_M7A_r3_00000__13fc @ M7A_r3_00000::13fc =====

void __h3000 FUN_M7A_r3_00000__13fc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1441 ->$1408 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be);
  return;
}


// ===== FUN_M7A_r3_00000__1408 @ M7A_r3_00000::1408 =====

void __h3000 FUN_M7A_r3_00000__1408(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1441 ->$1408 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be);
  return;
}


// ===== FUN_M7A_r3_00000__1414 @ M7A_r3_00000::1414 =====

void __h3000 FUN_M7A_r3_00000__1414(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$1441 ->$1408 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be);
  return;
}


// ===== FUN_M7A_r3_00000__1420 @ M7A_r3_00000::1420 =====

void __h3000 FUN_M7A_r3_00000__1420(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$1441 ->$1408 $13FC */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be);
  return;
}


// ===== FUN_M7A_r3_00000__1441 @ M7A_r3_00000::1441 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x14df */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1441(undefined2 param_1,undefined2 param_2,short param_3)

{
  byte bVar1;
  ushort in_D;
  ushort uVar2;
  undefined2 uVar3;
  byte bVar4;
  short sVar5;
  short *psVar6;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar1 = (byte)(in_D >> 8);
  sVar5 = param_3;
  API_FE76();
  if (DAT_71f9 == '\0') {
    FUN_M7A_r3_00000__0efd(0,(char)in_D,2,0x74f);
    API_FD20(0);
    API_FD42();
    DAT_71f7 = (ushort)bVar1;
    bVar4 = bVar1;
    if (DAT_71f7 == 0) goto LAB_M7A_r3_00000__14df;
    uVar2 = FUN_M7A_r3_00000__0efd(0,bVar1,0,0x77f);
    in_D = uVar2 & 0xff;
    FUN_M7A_r3_00000__0efd((char)(uVar2 >> 8),(char)uVar2,0,0);
  }
  else {
    DAT_71f9 = '\0';
    DAT_71f5 = 0;
    DAT_71f7 = 1;
  }
  uVar3 = DAT_70f4;
  *(char *)(sVar5 + -1) = (char)DAT_70f4;
  psVar6 = (short *)(sVar5 + -2);
  *(char *)psVar6 = (char)((ushort)uVar3 >> 8);
  FUN_c0ef();
  DAT_71f3 = *psVar6;
  bVar4 = (byte)in_D;
  if (DAT_71f3 - DAT_71f5 != 0) {
    *psVar6 = DAT_71f3 - DAT_71f5;
    API_FCC8();
    uVar2 = DAT_71f7;
    *(char *)((short)psVar6 + -1) = (char)DAT_71f7;
    psVar6 = psVar6 + -1;
    *(char *)psVar6 = (char)(uVar2 >> 8);
    API_FCEA();
    DAT_70de = *psVar6;
    if (DAT_70de == 0) {
      DAT_70de = 1;
    }
    uVar3 = FUN_M7A_r3_00000__0efd
                      ((char)((ushort)DAT_70de >> 8),(char)DAT_70de,DAT_71f3,0x77d,psVar6 + 1);
    FUN_M7A_r3_00000__0efd((char)((ushort)uVar3 >> 8),(byte)uVar3,DAT_70de,0x77e);
    DAT_71f5 = DAT_71f3;
    bVar4 = (byte)uVar3;
  }
LAB_M7A_r3_00000__14df:
                    /* WARNING: Could not recover jumptable at 0x14df. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar1,bVar4,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1507 @ M7A_r3_00000::1507 =====

void __h3000 FUN_M7A_r3_00000__1507(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7A_r3_00000__154c_M7A_r3_00000__14e1);
  return;
}


// ===== FUN_M7A_r3_00000__1513 @ M7A_r3_00000::1513 =====

void __h3000 FUN_M7A_r3_00000__1513(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$154C ->$152B */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7A_r3_00000__154c_M7A_r3_00000__14e1);
  return;
}


// ===== FUN_M7A_r3_00000__151f @ M7A_r3_00000::151f =====

void __h3000 FUN_M7A_r3_00000__151f(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7A_r3_00000__154c_M7A_r3_00000__14e1);
  return;
}


// ===== FUN_M7A_r3_00000__152b @ M7A_r3_00000::152b =====

void __h3000 FUN_M7A_r3_00000__152b(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7A_r3_00000__154c_M7A_r3_00000__14e1);
  return;
}


// ===== FUN_M7A_r3_00000__154c @ M7A_r3_00000::154c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1578 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__154c(undefined2 param_1,undefined2 param_2,short param_3)

{
  ushort uVar1;
  undefined2 in_D;
  char cVar2;
  short sVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = 100 - DAT_70f8;
  *(ushort *)(sVar3 + -2) = uVar1;
  cVar2 = (char)uVar1 << 1;
  DAT_70de = CONCAT11((char)(uVar1 >> 7),cVar2);
  *(undefined1 *)(sVar3 + -3) = 0x66;
  psVar4 = (short *)(sVar3 + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar4 + DAT_70de) >> 8));
  API_FC72();
                    /* WARNING: Could not recover jumptable at 0x1578. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__15b5 @ M7A_r3_00000::15b5 =====

void __h3000 FUN_M7A_r3_00000__15b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$17DA ->$15D9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__17da_M7A_r3_00000__158f);
  return;
}


// ===== FUN_M7A_r3_00000__15c1 @ M7A_r3_00000::15c1 =====

void __h3000 FUN_M7A_r3_00000__15c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$17DA ->$15D9 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__17da_M7A_r3_00000__158f);
  return;
}


// ===== FUN_M7A_r3_00000__15cd @ M7A_r3_00000::15cd =====

void __h3000 FUN_M7A_r3_00000__15cd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$17DA ->$15D9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__17da_M7A_r3_00000__158f);
  return;
}


// ===== FUN_M7A_r3_00000__15d9 @ M7A_r3_00000::15d9 =====

void __h3000 FUN_M7A_r3_00000__15d9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$17DA ->$15D9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__17da_M7A_r3_00000__158f);
  return;
}


// ===== FUN_M7A_r3_00000__15e5 @ M7A_r3_00000::15e5 =====

void __h3000 FUN_M7A_r3_00000__15e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$17DA ->$15D9 $15CD */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__17da_M7A_r3_00000__158f);
  return;
}


// ===== FUN_M7A_r3_00000__15f1 @ M7A_r3_00000::15f1 =====

/* WARNING: Restarted to delay deadcode elimination for space: register */

undefined2 __h3000 FUN_M7A_r3_00000__15f1(void)

{
  undefined2 in_D;
  code *pcVar1;
  undefined2 uVar2;
  short sVar3;
  
  if (DAT_7102 != 0) {
    DAT_7102 = DAT_7102 + 1;
    goto LAB_M7A_r3_00000__16db;
  }
  DAT_7102 = 1;
  pcVar1 = FUN_M7A_r3_00000__15d9 + g_moduleBase;
  if (pcVar1 == DAT_6070) {
    LcdSetCursor();
                    /* inline[API_FC38]: ".  " */
    pcVar1 = (code *)LcdPrintInline();
  }
  uVar2 = FUN_M7A_r3_00000__0efd((char)((ushort)pcVar1 >> 8),(char)pcVar1,0,0x74c);
  FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,0,0);
  do {
    API_FE2A();
    if (DAT_7102 == 2) {
      uVar2 = FUN_M7A_r3_00000__0efd(0,2,0,0x74c);
      FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,0,0);
      if (FUN_M7A_r3_00000__15d9 + g_moduleBase == DAT_6070) {
        LcdSetCursor();
                    /* inline[API_FC38]: ".. " */
        LcdPrintInline();
      }
      goto LAB_M7A_r3_00000__168f;
    }
    FUN_M7A_r3_00000__0efd((char)((ushort)DAT_7102 >> 8),(char)DAT_7102,4,0x74f);
    API_FD20(0);
    sVar3 = API_FD42();
  } while (sVar3 < 0x7fff);
  goto LAB_M7A_r3_00000__16d5;
  while( true ) {
    FUN_M7A_r3_00000__0efd((char)((ushort)DAT_7102 >> 8),(char)DAT_7102,4,0x74f);
    API_FD20(0);
    DAT_7100 = API_FD42();
    if (0x7ffe < DAT_7100) break;
LAB_M7A_r3_00000__168f:
    API_FE2A();
    if (DAT_7102 == 3) {
      FUN_M7A_r3_00000__1809();
      if (FUN_M7A_r3_00000__15d9 + g_moduleBase == DAT_6070) {
        FUN_M7A_r3_00000__15b5();
      }
      FUN_M7A_r3_00000__17da();
      break;
    }
  }
LAB_M7A_r3_00000__16d5:
  DAT_7102 = 0;
LAB_M7A_r3_00000__16db:
  if (3 < DAT_7102) {
    DAT_7102 = 0;
  }
  return in_D;
}


// ===== FUN_M7A_r3_00000__16ed @ M7A_r3_00000::16ed =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x171e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__16ed(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (FUN_M7A_r3_00000__15d9 + g_moduleBase == DAT_6070) {
    DAT_70fe = DAT_70fe + 1;
    FUN_M7A_r3_00000__1720();
    FUN_M7A_r3_00000__17da();
  }
  else {
    DAT_70fe = 0;
  }
  FUN_M7A_r3_00000__15b5();
                    /* WARNING: Could not recover jumptable at 0x171e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1720 @ M7A_r3_00000::1720 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x17d8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1720(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined2 uVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor();
                    /* inline[API_FC38]: ".  " */
  uVar2 = LcdPrintInline();
  uVar2 = FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,0,0x74c);
  FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,0,0);
  do {
    API_FC1A();
  } while ((char)uVar2 != '\0');
  while( true ) {
    sVar3 = API_FC1A();
    uVar1 = (undefined1)((ushort)sVar3 >> 8);
    if ((char)sVar3 == '\x01') break;
    if ((char)sVar3 != '\0') goto LAB_M7A_r3_00000__17d4;
    FUN_M7A_r3_00000__0efd(uVar1,0,4,0x74f);
    API_FD20(0);
    sVar3 = API_FD42();
    if (0x7ffe < sVar3) goto LAB_M7A_r3_00000__17d8;
  }
  uVar2 = FUN_M7A_r3_00000__0efd(uVar1,1,0,0x74c);
  FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,0,0);
  LcdSetCursor();
                    /* inline[API_FC38]: ".. " */
  LcdPrintInline();
  do {
    API_FC1A();
  } while ((char)uVar2 != '\0');
  do {
    sVar3 = API_FC1A();
    if ((char)sVar3 == '\x01') {
      FUN_M7A_r3_00000__1809();
      break;
    }
    if ((char)sVar3 != '\0') goto LAB_M7A_r3_00000__17d4;
    FUN_M7A_r3_00000__0efd((char)((ushort)sVar3 >> 8),0,4,0x74f);
    API_FD20(0);
    DAT_7100 = API_FD42();
    sVar3 = DAT_7100;
  } while (DAT_7100 < 0x7fff);
LAB_M7A_r3_00000__17d8:
                    /* WARNING: Could not recover jumptable at 0x17d8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
LAB_M7A_r3_00000__17d4:
  FUN_8fe4();
  goto LAB_M7A_r3_00000__17d8;
}


// ===== FUN_M7A_r3_00000__17da @ M7A_r3_00000::17da =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1807 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__17da(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  *(undefined1 *)(sVar2 + -1) = 0xc4;
  *(undefined1 *)(sVar2 + -2) = 9;
  uVar1 = DAT_7106;
  *(char *)(sVar2 + -3) = (char)DAT_7106;
  puVar3 = (undefined2 *)(sVar2 + -4);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  DAT_70fa = *puVar3;
  DAT_70fc = puVar3[1];
  FUN_M7A_r3_00000__1f88();
  FUN_M7A_r3_00000__202f();
  FUN_M7A_r3_00000__269c();
  FUN_M7A_r3_00000__273b();
                    /* WARNING: Could not recover jumptable at 0x1807. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1809 @ M7A_r3_00000::1809 =====

void __h3000 FUN_M7A_r3_00000__1809(void)

{
  undefined2 uVar1;
  char cVar2;
  short in_U;
  char *pcVar3;
  
  *(undefined1 *)(in_U + -1) = 0xc0;
  *(undefined1 *)(in_U + -2) = 0x50;
  cVar2 = (char)((ushort)DAT_7100 >> 8);
  *(char *)(in_U + -3) =
       (char)((char)((char)((char)((char)DAT_7100 >> 1 | cVar2 << 7) >> 1 | (cVar2 >> 1) << 7) >> 1
                    | (cVar2 >> 2) << 7) >> 1 | (cVar2 >> 3) << 7) >> 1 | (cVar2 >> 4) << 7;
  pcVar3 = (char *)(in_U + -4);
  *pcVar3 = cVar2 >> 5;
  API_FCEA();
  DAT_70de = *(undefined2 *)pcVar3;
  pcVar3[1] = '\x1e';
  *pcVar3 = '\0';
  pcVar3[-1] = -0x38;
  pcVar3[-2] = '\0';
  uVar1 = DAT_70de;
  pcVar3[-3] = (char)DAT_70de;
  pcVar3 = pcVar3 + -4;
  *pcVar3 = (char)((ushort)uVar1 >> 8);
  API_FCD8();
  DAT_704c = *(undefined2 *)pcVar3;
  DAT_7106 = *(undefined2 *)pcVar3;
  return;
}


// ===== FUN_M7A_r3_00000__1868 @ M7A_r3_00000::1868 =====

void __h3000 FUN_M7A_r3_00000__1868(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$18BF ->$188C */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__18bf_M7A_r3_00000__1842);
  return;
}


// ===== FUN_M7A_r3_00000__1874 @ M7A_r3_00000::1874 =====

void __h3000 FUN_M7A_r3_00000__1874(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$18BF ->$188C */
                    /* inline[API_FDBC]: "5.94...B" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__18bf_M7A_r3_00000__1842);
  return;
}


// ===== FUN_M7A_r3_00000__1880 @ M7A_r3_00000::1880 =====

void __h3000 FUN_M7A_r3_00000__1880(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$18BF ->$188C */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__18bf_M7A_r3_00000__1842);
  return;
}


// ===== FUN_M7A_r3_00000__188c @ M7A_r3_00000::188c =====

void __h3000 FUN_M7A_r3_00000__188c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$18BF ->$188C */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__18bf_M7A_r3_00000__1842);
  return;
}


// ===== FUN_M7A_r3_00000__18ad @ M7A_r3_00000::18ad =====

void __h3000 FUN_M7A_r3_00000__18ad(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__1868();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x18bd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__18bf @ M7A_r3_00000::18bf =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x18f7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__18bf(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined1 *puVar4;
  undefined2 *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_710a;
  *(char *)(sVar3 + -1) = (char)DAT_710a;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 4;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = 0;
  API_FCEE();
  uVar1 = DAT_710a;
  puVar4[-1] = (char)DAT_710a;
  puVar4[-2] = (char)((ushort)uVar1 >> 8);
  puVar4[-3] = 0x91;
  puVar5 = (undefined2 *)(puVar4 + -4);
  *(undefined1 *)puVar5 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_70de = *puVar5;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x760,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x18f7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__191f @ M7A_r3_00000::191f =====

void __h3000 FUN_M7A_r3_00000__191f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1976 ->$1943 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1976_M7A_r3_00000__18f9);
  return;
}


// ===== FUN_M7A_r3_00000__192b @ M7A_r3_00000::192b =====

void __h3000 FUN_M7A_r3_00000__192b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1976 ->$1943 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1976_M7A_r3_00000__18f9);
  return;
}


// ===== FUN_M7A_r3_00000__1937 @ M7A_r3_00000::1937 =====

void __h3000 FUN_M7A_r3_00000__1937(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1976 ->$1943 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1976_M7A_r3_00000__18f9);
  return;
}


// ===== FUN_M7A_r3_00000__1943 @ M7A_r3_00000::1943 =====

void __h3000 FUN_M7A_r3_00000__1943(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1976 ->$1943 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1976_M7A_r3_00000__18f9);
  return;
}


// ===== FUN_M7A_r3_00000__1964 @ M7A_r3_00000::1964 =====

void __h3000 FUN_M7A_r3_00000__1964(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__191f();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x1974. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__1976 @ M7A_r3_00000::1976 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x19ae */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1976(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined1 *puVar4;
  undefined2 *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_710e;
  *(char *)(sVar3 + -1) = (char)DAT_710e;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 4;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = 0;
  API_FCEE();
  uVar1 = DAT_710e;
  puVar4[-1] = (char)DAT_710e;
  puVar4[-2] = (char)((ushort)uVar1 >> 8);
  puVar4[-3] = 0x91;
  puVar5 = (undefined2 *)(puVar4 + -4);
  *(undefined1 *)puVar5 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_70de = *puVar5;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd
            ((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,FUN_M7A_r3_00000__0764,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x19ae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__19d6 @ M7A_r3_00000::19d6 =====

void __h3000 FUN_M7A_r3_00000__19d6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1A1B ->$19FA */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1a1b_M7A_r3_00000__19b0);
  return;
}


// ===== FUN_M7A_r3_00000__19e2 @ M7A_r3_00000::19e2 =====

void __h3000 FUN_M7A_r3_00000__19e2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1A1B ->$19FA */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1a1b_M7A_r3_00000__19b0);
  return;
}


// ===== FUN_M7A_r3_00000__19ee @ M7A_r3_00000::19ee =====

void __h3000 FUN_M7A_r3_00000__19ee(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1A1B ->$19FA */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1a1b_M7A_r3_00000__19b0);
  return;
}


// ===== FUN_M7A_r3_00000__19fa @ M7A_r3_00000::19fa =====

void __h3000 FUN_M7A_r3_00000__19fa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1A1B ->$19FA */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1a1b_M7A_r3_00000__19b0);
  return;
}


// ===== FUN_M7A_r3_00000__1a1b @ M7A_r3_00000::1a1b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1a5a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1a1b(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7112;
  *(char *)(sVar3 + -1) = (char)DAT_7112;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x20;
  psVar4 = (short *)(sVar3 + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEE();
  uVar1 = DAT_7112;
  DAT_70de = *psVar4;
  *(char *)((short)psVar4 + 1) = (char)DAT_7112;
  *(char *)psVar4 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x2c;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x62;
  API_FCF2();
  DAT_70de = *psVar4 + DAT_70de + -0x7fff;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x761,psVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x1a5a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1a82 @ M7A_r3_00000::1a82 =====

void __h3000 FUN_M7A_r3_00000__1a82(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1AC7 ->$1AA6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1ac7_M7A_r3_00000__1a5c);
  return;
}


// ===== FUN_M7A_r3_00000__1a8e @ M7A_r3_00000::1a8e =====

void __h3000 FUN_M7A_r3_00000__1a8e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1AC7 ->$1AA6 */
                    /* inline[API_FDBC]: "5.94...\" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1ac7_M7A_r3_00000__1a5c);
  return;
}


// ===== FUN_M7A_r3_00000__1a9a @ M7A_r3_00000::1a9a =====

void __h3000 FUN_M7A_r3_00000__1a9a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1AC7 ->$1AA6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1ac7_M7A_r3_00000__1a5c);
  return;
}


// ===== FUN_M7A_r3_00000__1aa6 @ M7A_r3_00000::1aa6 =====

void __h3000 FUN_M7A_r3_00000__1aa6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1AC7 ->$1AA6 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1ac7_M7A_r3_00000__1a5c);
  return;
}


// ===== FUN_M7A_r3_00000__1ac7 @ M7A_r3_00000::1ac7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1b06 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1ac7(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7116;
  *(char *)(sVar3 + -1) = (char)DAT_7116;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x20;
  psVar4 = (short *)(sVar3 + -4);
  *(undefined1 *)psVar4 = 0;
  API_FCEE();
  uVar1 = DAT_7116;
  DAT_70de = *psVar4;
  *(char *)((short)psVar4 + 1) = (char)DAT_7116;
  *(char *)psVar4 = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x2c;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x62;
  API_FCF2();
  DAT_70de = *psVar4 + DAT_70de + -0x7fff;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x765,psVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x1b06. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1b2e @ M7A_r3_00000::1b2e =====

void __h3000 FUN_M7A_r3_00000__1b2e(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b08);
  return;
}


// ===== FUN_M7A_r3_00000__1b3a @ M7A_r3_00000::1b3a =====

void __h3000 FUN_M7A_r3_00000__1b3a(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b08);
  return;
}


// ===== FUN_M7A_r3_00000__1b46 @ M7A_r3_00000::1b46 =====

void __h3000 FUN_M7A_r3_00000__1b46(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b08);
  return;
}


// ===== FUN_M7A_r3_00000__1b52 @ M7A_r3_00000::1b52 =====

void __h3000 FUN_M7A_r3_00000__1b52(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b08);
  return;
}


// ===== FUN_M7A_r3_00000__1b72 @ M7A_r3_00000::1b72 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1b8e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1b72(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = DAT_711a + 0x15;
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x763);
                    /* WARNING: Could not recover jumptable at 0x1b8e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1bb6 @ M7A_r3_00000::1bb6 =====

void __h3000 FUN_M7A_r3_00000__1bb6(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b90);
  return;
}


// ===== FUN_M7A_r3_00000__1bc2 @ M7A_r3_00000::1bc2 =====

void __h3000 FUN_M7A_r3_00000__1bc2(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b90);
  return;
}


// ===== FUN_M7A_r3_00000__1bce @ M7A_r3_00000::1bce =====

void __h3000 FUN_M7A_r3_00000__1bce(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b90);
  return;
}


// ===== FUN_M7A_r3_00000__1bda @ M7A_r3_00000::1bda =====

void __h3000 FUN_M7A_r3_00000__1bda(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7A_r3_00000__1b90);
  return;
}


// ===== FUN_M7A_r3_00000__1bfa @ M7A_r3_00000::1bfa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1c16 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1bfa(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = DAT_711e + 0x19;
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x767);
                    /* WARNING: Could not recover jumptable at 0x1c16. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1c59 @ M7A_r3_00000::1c59 =====

void __h3000 FUN_M7A_r3_00000__1c59(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1CB0 ->$1C7D */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1cb0_M7A_r3_00000__1c33);
  return;
}


// ===== FUN_M7A_r3_00000__1c65 @ M7A_r3_00000::1c65 =====

void __h3000 FUN_M7A_r3_00000__1c65(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1CB0 ->$1C7D */
                    /* inline[API_FDBC]: "5.94...3" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1cb0_M7A_r3_00000__1c33);
  return;
}


// ===== FUN_M7A_r3_00000__1c71 @ M7A_r3_00000::1c71 =====

void __h3000 FUN_M7A_r3_00000__1c71(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1CB0 ->$1C7D */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1cb0_M7A_r3_00000__1c33);
  return;
}


// ===== FUN_M7A_r3_00000__1c7d @ M7A_r3_00000::1c7d =====

void __h3000 FUN_M7A_r3_00000__1c7d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1CB0 ->$1C7D */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1cb0_M7A_r3_00000__1c33);
  return;
}


// ===== FUN_M7A_r3_00000__1c9e @ M7A_r3_00000::1c9e =====

void __h3000 FUN_M7A_r3_00000__1c9e(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__1c59();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x1cae. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__1cb0 @ M7A_r3_00000::1cb0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1ce8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1cb0(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined1 *puVar4;
  undefined2 *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7122;
  *(char *)(sVar3 + -1) = (char)DAT_7122;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 4;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = 0;
  API_FCEC();
  uVar1 = DAT_7122;
  puVar4[-1] = (char)DAT_7122;
  puVar4[-2] = (char)((ushort)uVar1 >> 8);
  puVar4[-3] = 0x91;
  puVar5 = (undefined2 *)(puVar4 + -4);
  *(undefined1 *)puVar5 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_70de = *puVar5;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x762,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x1ce8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1d10 @ M7A_r3_00000::1d10 =====

void __h3000 FUN_M7A_r3_00000__1d10(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1D67 ->$1D34 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1d67_M7A_r3_00000__1cea);
  return;
}


// ===== FUN_M7A_r3_00000__1d1c @ M7A_r3_00000::1d1c =====

void __h3000 FUN_M7A_r3_00000__1d1c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1D67 ->$1D34 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1d67_M7A_r3_00000__1cea);
  return;
}


// ===== FUN_M7A_r3_00000__1d28 @ M7A_r3_00000::1d28 =====

void __h3000 FUN_M7A_r3_00000__1d28(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1D67 ->$1D34 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1d67_M7A_r3_00000__1cea);
  return;
}


// ===== FUN_M7A_r3_00000__1d34 @ M7A_r3_00000::1d34 =====

void __h3000 FUN_M7A_r3_00000__1d34(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1D67 ->$1D34 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1d67_M7A_r3_00000__1cea);
  return;
}


// ===== FUN_M7A_r3_00000__1d55 @ M7A_r3_00000::1d55 =====

void __h3000 FUN_M7A_r3_00000__1d55(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__1d10();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x1d65. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__1d67 @ M7A_r3_00000::1d67 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1d9f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1d67(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined1 *puVar4;
  undefined2 *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7126;
  *(char *)(sVar3 + -1) = (char)DAT_7126;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 4;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = 0;
  API_FCEC();
  uVar1 = DAT_7126;
  puVar4[-1] = (char)DAT_7126;
  puVar4[-2] = (char)((ushort)uVar1 >> 8);
  puVar4[-3] = 0x91;
  puVar5 = (undefined2 *)(puVar4 + -4);
  *(undefined1 *)puVar5 = 0x55;
  API_FCF2();
  API_FCE2();
  DAT_70de = *puVar5;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x766,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x1d9f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1dc7 @ M7A_r3_00000::1dc7 =====

void __h3000 FUN_M7A_r3_00000__1dc7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1E1D ->$1DEB */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1e1d_M7A_r3_00000__1da1);
  return;
}


// ===== FUN_M7A_r3_00000__1dd3 @ M7A_r3_00000::1dd3 =====

void __h3000 FUN_M7A_r3_00000__1dd3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1E1D ->$1DEB */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1e1d_M7A_r3_00000__1da1);
  return;
}


// ===== FUN_M7A_r3_00000__1ddf @ M7A_r3_00000::1ddf =====

void __h3000 FUN_M7A_r3_00000__1ddf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1E1D ->$1DEB */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1e1d_M7A_r3_00000__1da1);
  return;
}


// ===== FUN_M7A_r3_00000__1deb @ M7A_r3_00000::1deb =====

void __h3000 FUN_M7A_r3_00000__1deb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1E1D ->$1DEB */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1e1d_M7A_r3_00000__1da1);
  return;
}


// ===== FUN_M7A_r3_00000__1e0c @ M7A_r3_00000::1e0c =====

void __h3000 FUN_M7A_r3_00000__1e0c(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__1dc7();
  DAT_606c = DAT_70dc;
  API_FC14();
                    /* WARNING: Could not recover jumptable at 0x1e1b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__1e1d @ M7A_r3_00000::1e1d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1e5d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1e1d(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  uVar2 = DAT_70dc;
  *(char *)(param_3 + -3) = (char)DAT_70dc;
  *(char *)(param_3 + -4) = (char)((ushort)uVar2 >> 8);
  psVar4 = (short *)(param_3 + -6);
  *psVar4 = DAT_7060 + DAT_712a;
  API_FCD8();
  sVar1 = *psVar4;
  DAT_712c = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x33;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x58;
  API_FCF2();
  DAT_70de = *psVar4;
  uVar3 = (undefined1)DAT_70de;
  DAT_7128 = DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar3,DAT_70de,0x75c,psVar4 + 1);
  FUN_M7A_r3_00000__23aa();
                    /* WARNING: Could not recover jumptable at 0x1e5d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1e85 @ M7A_r3_00000::1e85 =====

void __h3000 FUN_M7A_r3_00000__1e85(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1EDB ->$1EA9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1edb_M7A_r3_00000__1e5f);
  return;
}


// ===== FUN_M7A_r3_00000__1e91 @ M7A_r3_00000::1e91 =====

void __h3000 FUN_M7A_r3_00000__1e91(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1EDB ->$1EA9 */
                    /* inline[API_FDBC]: "5.94..._" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1edb_M7A_r3_00000__1e5f);
  return;
}


// ===== FUN_M7A_r3_00000__1e9d @ M7A_r3_00000::1e9d =====

void __h3000 FUN_M7A_r3_00000__1e9d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1EDB ->$1EA9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1edb_M7A_r3_00000__1e5f);
  return;
}


// ===== FUN_M7A_r3_00000__1ea9 @ M7A_r3_00000::1ea9 =====

void __h3000 FUN_M7A_r3_00000__1ea9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1EDB ->$1EA9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1edb_M7A_r3_00000__1e5f);
  return;
}


// ===== FUN_M7A_r3_00000__1eca @ M7A_r3_00000::1eca =====

void __h3000 FUN_M7A_r3_00000__1eca(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__1e85();
  DAT_606c = DAT_70dc;
  API_FC14();
                    /* WARNING: Could not recover jumptable at 0x1ed9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__1edb @ M7A_r3_00000::1edb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1f1b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1edb(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  uVar2 = DAT_70dc;
  *(char *)(param_3 + -3) = (char)DAT_70dc;
  *(char *)(param_3 + -4) = (char)((ushort)uVar2 >> 8);
  psVar4 = (short *)(param_3 + -6);
  *psVar4 = DAT_7062 + DAT_7130;
  API_FCD8();
  sVar1 = *psVar4;
  DAT_7132 = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x33;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x58;
  API_FCF2();
  DAT_70de = *psVar4;
  uVar3 = (undefined1)DAT_70de;
  DAT_712e = DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar3,DAT_70de,0x75e,psVar4 + 1);
  FUN_M7A_r3_00000__2462();
                    /* WARNING: Could not recover jumptable at 0x1f1b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1f43 @ M7A_r3_00000::1f43 =====

void __h3000 FUN_M7A_r3_00000__1f43(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1F88 ->$1F67 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__1f88_M7A_r3_00000__1f1d);
  return;
}


// ===== FUN_M7A_r3_00000__1f4f @ M7A_r3_00000::1f4f =====

void __h3000 FUN_M7A_r3_00000__1f4f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1F88 ->$1F67 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__1f88_M7A_r3_00000__1f1d);
  return;
}


// ===== FUN_M7A_r3_00000__1f5b @ M7A_r3_00000::1f5b =====

void __h3000 FUN_M7A_r3_00000__1f5b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1F88 ->$1F67 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__1f88_M7A_r3_00000__1f1d);
  return;
}


// ===== FUN_M7A_r3_00000__1f67 @ M7A_r3_00000::1f67 =====

void __h3000 FUN_M7A_r3_00000__1f67(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1F88 ->$1F67 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__1f88_M7A_r3_00000__1f1d);
  return;
}


// ===== FUN_M7A_r3_00000__1f88 @ M7A_r3_00000::1f88 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1fc2 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__1f88(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70fc;
  *(char *)(sVar2 + -1) = (char)DAT_70fc;
  *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7136;
  *(char *)(sVar2 + -3) = (char)DAT_7136;
  puVar3 = (undefined1 *)(sVar2 + -4);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  uVar1 = DAT_7106;
  puVar3[-1] = (char)DAT_7106;
  puVar3 = puVar3 + -2;
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  uVar1 = DAT_70fa;
  puVar3[-1] = (char)DAT_70fa;
  puVar3[-2] = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7136;
  puVar3[-3] = (char)DAT_7136;
  puVar4 = (undefined2 *)(puVar3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  API_FCE2();
  DAT_712a = *puVar4;
  FUN_M7A_r3_00000__1e1d();
                    /* WARNING: Could not recover jumptable at 0x1fc2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__1fea @ M7A_r3_00000::1fea =====

void __h3000 FUN_M7A_r3_00000__1fea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$202F ->$200E */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__202f_M7A_r3_00000__1fc4);
  return;
}


// ===== FUN_M7A_r3_00000__1ff6 @ M7A_r3_00000::1ff6 =====

void __h3000 FUN_M7A_r3_00000__1ff6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$202F ->$200E */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__202f_M7A_r3_00000__1fc4);
  return;
}


// ===== FUN_M7A_r3_00000__2002 @ M7A_r3_00000::2002 =====

void __h3000 FUN_M7A_r3_00000__2002(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$202F ->$200E */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__202f_M7A_r3_00000__1fc4);
  return;
}


// ===== FUN_M7A_r3_00000__200e @ M7A_r3_00000::200e =====

void __h3000 FUN_M7A_r3_00000__200e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$202F ->$200E */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__202f_M7A_r3_00000__1fc4);
  return;
}


// ===== FUN_M7A_r3_00000__202f @ M7A_r3_00000::202f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2069 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__202f(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70fc;
  *(char *)(sVar2 + -1) = (char)DAT_70fc;
  *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_713a;
  *(char *)(sVar2 + -3) = (char)DAT_713a;
  puVar3 = (undefined1 *)(sVar2 + -4);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  uVar1 = DAT_7106;
  puVar3[-1] = (char)DAT_7106;
  puVar3 = puVar3 + -2;
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  uVar1 = DAT_70fa;
  puVar3[-1] = (char)DAT_70fa;
  puVar3[-2] = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_713a;
  puVar3[-3] = (char)DAT_713a;
  puVar4 = (undefined2 *)(puVar3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  API_FCE2();
  DAT_7130 = *puVar4;
  FUN_M7A_r3_00000__1edb();
                    /* WARNING: Could not recover jumptable at 0x2069. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2091 @ M7A_r3_00000::2091 =====

void __h3000 FUN_M7A_r3_00000__2091(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$20D6 ->$20B5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__20d6_M7A_r3_00000__206b);
  return;
}


// ===== FUN_M7A_r3_00000__209d @ M7A_r3_00000::209d =====

void __h3000 FUN_M7A_r3_00000__209d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$20D6 ->$20B5 */
                    /* inline[API_FDBC]: "5.94.. k" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__20d6_M7A_r3_00000__206b);
  return;
}


// ===== FUN_M7A_r3_00000__20a9 @ M7A_r3_00000::20a9 =====

void __h3000 FUN_M7A_r3_00000__20a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$20D6 ->$20B5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__20d6_M7A_r3_00000__206b);
  return;
}


// ===== FUN_M7A_r3_00000__20b5 @ M7A_r3_00000::20b5 =====

void __h3000 FUN_M7A_r3_00000__20b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$20D6 ->$20B5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__20d6_M7A_r3_00000__206b);
  return;
}


// ===== FUN_M7A_r3_00000__20d6 @ M7A_r3_00000::20d6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x210e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__20d6(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_713e;
  *(char *)(sVar3 + -1) = (char)DAT_713e;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_7146;
  if (DAT_7146 == 1) {
    FUN_M7A_r3_00000__0efd(0,1,0x8000,0x74d,puVar4 + 1);
  }
  else {
    FUN_M7A_r3_00000__0efd((char)((ushort)DAT_7146 >> 8),uVar2,DAT_70de,0x74d,puVar4 + 1);
  }
                    /* WARNING: Could not recover jumptable at 0x210e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2136 @ M7A_r3_00000::2136 =====

void __h3000 FUN_M7A_r3_00000__2136(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$217B ->$215A */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__217b_M7A_r3_00000__2110);
  return;
}


// ===== FUN_M7A_r3_00000__2142 @ M7A_r3_00000::2142 =====

void __h3000 FUN_M7A_r3_00000__2142(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$217B ->$215A */
                    /* inline[API_FDBC]: "5.94..!." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__217b_M7A_r3_00000__2110);
  return;
}


// ===== FUN_M7A_r3_00000__214e @ M7A_r3_00000::214e =====

void __h3000 FUN_M7A_r3_00000__214e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$217B ->$215A */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__217b_M7A_r3_00000__2110);
  return;
}


// ===== FUN_M7A_r3_00000__215a @ M7A_r3_00000::215a =====

void __h3000 FUN_M7A_r3_00000__215a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$217B ->$215A */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__217b_M7A_r3_00000__2110);
  return;
}


// ===== FUN_M7A_r3_00000__217b @ M7A_r3_00000::217b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x21b3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__217b(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7142;
  *(char *)(sVar3 + -1) = (char)DAT_7142;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_714a;
  if (DAT_714a == 1) {
    FUN_M7A_r3_00000__0efd(0,1,0x8000,0x74e,puVar4 + 1);
  }
  else {
    FUN_M7A_r3_00000__0efd((char)((ushort)DAT_714a >> 8),uVar2,DAT_70de,0x74e,puVar4 + 1);
  }
                    /* WARNING: Could not recover jumptable at 0x21b3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__21db @ M7A_r3_00000::21db =====

void __h3000 FUN_M7A_r3_00000__21db(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5);
  return;
}


// ===== FUN_M7A_r3_00000__21e7 @ M7A_r3_00000::21e7 =====

void __h3000 FUN_M7A_r3_00000__21e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2244 ->$21FF */
                    /* inline[API_FDBC]: "5.94..!." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5);
  return;
}


// ===== FUN_M7A_r3_00000__21f3 @ M7A_r3_00000::21f3 =====

void __h3000 FUN_M7A_r3_00000__21f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2244 ->$21FF */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5);
  return;
}


// ===== FUN_M7A_r3_00000__21ff @ M7A_r3_00000::21ff =====

void __h3000 FUN_M7A_r3_00000__21ff(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5);
  return;
}


// ===== FUN_M7A_r3_00000__220b @ M7A_r3_00000::220b =====

void __h3000 FUN_M7A_r3_00000__220b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2244 ->$21FF */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5);
  return;
}


// ===== FUN_M7A_r3_00000__2217 @ M7A_r3_00000::2217 =====

void __h3000 FUN_M7A_r3_00000__2217(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2244 ->$21FF $21F3 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5);
  return;
}


// ===== FUN_M7A_r3_00000__2244 @ M7A_r3_00000::2244 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x227e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2244(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  ushort uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  API_FE76();
  FUN_M7A_r3_00000__20d6();
  if (DAT_7146 == 1) {
    API_FD2E(0);
  }
  else {
    uVar2 = (undefined1)((ushort)(DAT_7026 + 1) >> 8);
    in_D = CONCAT11(uVar2,(char)in_D);
    API_FD2E(uVar2);
  }
                    /* WARNING: Could not recover jumptable at 0x227e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__22a6 @ M7A_r3_00000::22a6 =====

void __h3000 FUN_M7A_r3_00000__22a6(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280);
  return;
}


// ===== FUN_M7A_r3_00000__22b2 @ M7A_r3_00000::22b2 =====

void __h3000 FUN_M7A_r3_00000__22b2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2303 ->$22CA */
                    /* inline[API_FDBC]: "5.94.."." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280);
  return;
}


// ===== FUN_M7A_r3_00000__22be @ M7A_r3_00000::22be =====

void __h3000 FUN_M7A_r3_00000__22be(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2303 ->$22CA */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280);
  return;
}


// ===== FUN_M7A_r3_00000__22ca @ M7A_r3_00000::22ca =====

void __h3000 FUN_M7A_r3_00000__22ca(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280);
  return;
}


// ===== FUN_M7A_r3_00000__22d6 @ M7A_r3_00000::22d6 =====

void __h3000 FUN_M7A_r3_00000__22d6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2303 ->$22CA */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280);
  return;
}


// ===== FUN_M7A_r3_00000__22e2 @ M7A_r3_00000::22e2 =====

void __h3000 FUN_M7A_r3_00000__22e2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2303 ->$22CA $22BE */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280);
  return;
}


// ===== FUN_M7A_r3_00000__2303 @ M7A_r3_00000::2303 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x233d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2303(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  ushort uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  API_FE76();
  FUN_M7A_r3_00000__217b();
  if (DAT_714a == 1) {
    API_FD2E(0);
  }
  else {
    uVar2 = (undefined1)((ushort)(DAT_702a + 1) >> 8);
    in_D = CONCAT11(uVar2,(char)in_D);
    API_FD2E(uVar2);
  }
                    /* WARNING: Could not recover jumptable at 0x233d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2365 @ M7A_r3_00000::2365 =====

void __h3000 FUN_M7A_r3_00000__2365(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$23AA ->$2389 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__23aa_M7A_r3_00000__233f);
  return;
}


// ===== FUN_M7A_r3_00000__2371 @ M7A_r3_00000::2371 =====

void __h3000 FUN_M7A_r3_00000__2371(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$23AA ->$2389 */
                    /* inline[API_FDBC]: "5.94..#?" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__23aa_M7A_r3_00000__233f);
  return;
}


// ===== FUN_M7A_r3_00000__237d @ M7A_r3_00000::237d =====

void __h3000 FUN_M7A_r3_00000__237d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$23AA ->$2389 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__23aa_M7A_r3_00000__233f);
  return;
}


// ===== FUN_M7A_r3_00000__2389 @ M7A_r3_00000::2389 =====

void __h3000 FUN_M7A_r3_00000__2389(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$23AA ->$2389 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__23aa_M7A_r3_00000__233f);
  return;
}


// ===== FUN_M7A_r3_00000__23aa @ M7A_r3_00000::23aa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x23f5 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__23aa(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  byte bVar3;
  ushort uVar2;
  short sVar4;
  ushort *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar4 = param_3;
  API_FE76();
  uVar1 = DAT_714e;
  *(char *)(sVar4 + -1) = (char)DAT_714e;
  puVar5 = (ushort *)(sVar4 + -2);
  *(char *)puVar5 = (char)((ushort)uVar1 >> 8);
  FUN_c155();
  DAT_70de = *puVar5;
  uVar2 = DAT_70de;
  if ((short)DAT_70de < 0) {
    uVar2 = DAT_7128;
    if ((short)DAT_7128 < 0x1ff) {
      bVar3 = (byte)DAT_7128;
      DAT_70e0 = CONCAT11(((((((char)(DAT_7128 >> 8) << 1 | bVar3 >> 7) << 1 | (bVar3 & 0x7f) >> 6)
                             << 1 | (bVar3 & 0x3f) >> 5) << 1 | (bVar3 & 0x1f) >> 4) << 1 |
                          (bVar3 & 0xf) >> 3) << 1 | (bVar3 & 7) >> 2,bVar3 << 6);
      uVar2 = DAT_70e0 + DAT_70de;
      if (!CARRY2(DAT_70e0,DAT_70de) || (short)uVar2 < 0 != SCARRY2(DAT_70e0,DAT_70de)) {
        uVar2 = 1 - DAT_70e0;
        DAT_70de = uVar2;
      }
    }
  }
  FUN_M7A_r3_00000__0efd((char)(uVar2 >> 8),(char)uVar2,DAT_70de,0x75d,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x23f5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__241d @ M7A_r3_00000::241d =====

void __h3000 FUN_M7A_r3_00000__241d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2462 ->$2441 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2462_M7A_r3_00000__23f7);
  return;
}


// ===== FUN_M7A_r3_00000__2429 @ M7A_r3_00000::2429 =====

void __h3000 FUN_M7A_r3_00000__2429(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2462 ->$2441 */
                    /* inline[API_FDBC]: "5.94..#." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2462_M7A_r3_00000__23f7);
  return;
}


// ===== FUN_M7A_r3_00000__2435 @ M7A_r3_00000::2435 =====

void __h3000 FUN_M7A_r3_00000__2435(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2462 ->$2441 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2462_M7A_r3_00000__23f7);
  return;
}


// ===== FUN_M7A_r3_00000__2441 @ M7A_r3_00000::2441 =====

void __h3000 FUN_M7A_r3_00000__2441(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2462 ->$2441 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2462_M7A_r3_00000__23f7);
  return;
}


// ===== FUN_M7A_r3_00000__2462 @ M7A_r3_00000::2462 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x24ad */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2462(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  byte bVar3;
  ushort uVar2;
  short sVar4;
  ushort *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar4 = param_3;
  API_FE76();
  uVar1 = DAT_7152;
  *(char *)(sVar4 + -1) = (char)DAT_7152;
  puVar5 = (ushort *)(sVar4 + -2);
  *(char *)puVar5 = (char)((ushort)uVar1 >> 8);
  FUN_c155();
  DAT_70de = *puVar5;
  uVar2 = DAT_70de;
  if ((short)DAT_70de < 0) {
    uVar2 = DAT_712e;
    if ((short)DAT_712e < 0x1ff) {
      bVar3 = (byte)DAT_712e;
      DAT_70e0 = CONCAT11(((((((char)(DAT_712e >> 8) << 1 | bVar3 >> 7) << 1 | (bVar3 & 0x7f) >> 6)
                             << 1 | (bVar3 & 0x3f) >> 5) << 1 | (bVar3 & 0x1f) >> 4) << 1 |
                          (bVar3 & 0xf) >> 3) << 1 | (bVar3 & 7) >> 2,bVar3 << 6);
      uVar2 = DAT_70e0 + DAT_70de;
      if (!CARRY2(DAT_70e0,DAT_70de) || (short)uVar2 < 0 != SCARRY2(DAT_70e0,DAT_70de)) {
        uVar2 = 1 - DAT_70e0;
        DAT_70de = uVar2;
      }
    }
  }
  FUN_M7A_r3_00000__0efd((char)(uVar2 >> 8),(char)uVar2,DAT_70de,0x75f,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x24ad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__24d5 @ M7A_r3_00000::24d5 =====

void __h3000 FUN_M7A_r3_00000__24d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2532 ->$24F9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af);
  return;
}


// ===== FUN_M7A_r3_00000__24e1 @ M7A_r3_00000::24e1 =====

void __h3000 FUN_M7A_r3_00000__24e1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2532 ->$24F9 */
                    /* inline[API_FDBC]: "5.94..$." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af);
  return;
}


// ===== FUN_M7A_r3_00000__24ed @ M7A_r3_00000::24ed =====

void __h3000 FUN_M7A_r3_00000__24ed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2532 ->$24F9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af);
  return;
}


// ===== FUN_M7A_r3_00000__24f9 @ M7A_r3_00000::24f9 =====

void __h3000 FUN_M7A_r3_00000__24f9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2532 ->$24F9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af);
  return;
}


// ===== FUN_M7A_r3_00000__2505 @ M7A_r3_00000::2505 =====

void __h3000 FUN_M7A_r3_00000__2505(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2532 ->$24F9 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af);
  return;
}


// ===== FUN_M7A_r3_00000__2511 @ M7A_r3_00000::2511 =====

void __h3000 FUN_M7A_r3_00000__2511(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2532 ->$24F9 $24ED */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af);
  return;
}


// ===== FUN_M7A_r3_00000__2532 @ M7A_r3_00000::2532 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x256e */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2532(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short *psVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  *(undefined1 *)(param_3 + -3) = 0x30;
  *(undefined1 *)(param_3 + -4) = 0x75;
  psVar3 = (short *)(param_3 + -6);
  *psVar3 = DAT_7078 + _DAT_7154 + DAT_715c;
  API_FCD8();
  sVar1 = *psVar3;
  DAT_7156 = sVar1;
  *(char *)((short)psVar3 + 1) = (char)sVar1;
  *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x38;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0xf;
  API_FCF2();
  DAT_70de = *psVar3;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x770,psVar3 + 1);
                    /* WARNING: Could not recover jumptable at 0x256e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2596 @ M7A_r3_00000::2596 =====

void __h3000 FUN_M7A_r3_00000__2596(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$25F3 ->$25BA */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570);
  return;
}


// ===== FUN_M7A_r3_00000__25a2 @ M7A_r3_00000::25a2 =====

void __h3000 FUN_M7A_r3_00000__25a2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$25F3 ->$25BA */
                    /* inline[API_FDBC]: "5.94..%p" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570);
  return;
}


// ===== FUN_M7A_r3_00000__25ae @ M7A_r3_00000::25ae =====

void __h3000 FUN_M7A_r3_00000__25ae(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$25F3 ->$25BA */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570);
  return;
}


// ===== FUN_M7A_r3_00000__25ba @ M7A_r3_00000::25ba =====

void __h3000 FUN_M7A_r3_00000__25ba(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$25F3 ->$25BA */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570);
  return;
}


// ===== FUN_M7A_r3_00000__25c6 @ M7A_r3_00000::25c6 =====

void __h3000 FUN_M7A_r3_00000__25c6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$25F3 ->$25BA */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570);
  return;
}


// ===== FUN_M7A_r3_00000__25d2 @ M7A_r3_00000::25d2 =====

void __h3000 FUN_M7A_r3_00000__25d2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$25F3 ->$25BA $25AE */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570);
  return;
}


// ===== FUN_M7A_r3_00000__25f3 @ M7A_r3_00000::25f3 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x262f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__25f3(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short *psVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  *(undefined1 *)(param_3 + -3) = 0x30;
  *(undefined1 *)(param_3 + -4) = 0x75;
  psVar3 = (short *)(param_3 + -6);
  *psVar3 = DAT_707c + DAT_7158 + DAT_7162;
  API_FCD8();
  sVar1 = *psVar3;
  DAT_715a = sVar1;
  *(char *)((short)psVar3 + 1) = (char)sVar1;
  *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x38;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0xf;
  API_FCF2();
  DAT_70de = *psVar3;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x774,psVar3 + 1);
                    /* WARNING: Could not recover jumptable at 0x262f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2657 @ M7A_r3_00000::2657 =====

void __h3000 FUN_M7A_r3_00000__2657(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$269C ->$267B */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__269c_M7A_r3_00000__2631);
  return;
}


// ===== FUN_M7A_r3_00000__2663 @ M7A_r3_00000::2663 =====

void __h3000 FUN_M7A_r3_00000__2663(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$269C ->$267B */
                    /* inline[API_FDBC]: "5.94..&1" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__269c_M7A_r3_00000__2631);
  return;
}


// ===== FUN_M7A_r3_00000__266f @ M7A_r3_00000::266f =====

void __h3000 FUN_M7A_r3_00000__266f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$269C ->$267B */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__269c_M7A_r3_00000__2631);
  return;
}


// ===== FUN_M7A_r3_00000__267b @ M7A_r3_00000::267b =====

void __h3000 FUN_M7A_r3_00000__267b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$269C ->$267B */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__269c_M7A_r3_00000__2631);
  return;
}


// ===== FUN_M7A_r3_00000__269c @ M7A_r3_00000::269c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x26ce */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__269c(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_7106;
  if (DAT_7160 == 0) {
    DAT_715c = DAT_7160;
  }
  else {
    *(char *)(sVar2 + -1) = (char)DAT_7106;
    *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
    *(undefined1 *)(sVar2 + -3) = 0x28;
    puVar3 = (undefined1 *)(sVar2 + -4);
    *puVar3 = 0;
    API_FCEE();
    sVar2 = DAT_7160;
    puVar3[-1] = (char)DAT_7160;
    psVar4 = (short *)(puVar3 + -2);
    *(char *)psVar4 = (char)((ushort)sVar2 >> 8);
    API_FCEA();
    DAT_715c = *psVar4;
  }
  FUN_M7A_r3_00000__2532();
                    /* WARNING: Could not recover jumptable at 0x26ce. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__26f6 @ M7A_r3_00000::26f6 =====

void __h3000 FUN_M7A_r3_00000__26f6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$273B ->$271A */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__273b_M7A_r3_00000__26d0);
  return;
}


// ===== FUN_M7A_r3_00000__2702 @ M7A_r3_00000::2702 =====

void __h3000 FUN_M7A_r3_00000__2702(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$273B ->$271A */
                    /* inline[API_FDBC]: "5.94..&." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__273b_M7A_r3_00000__26d0);
  return;
}


// ===== FUN_M7A_r3_00000__270e @ M7A_r3_00000::270e =====

void __h3000 FUN_M7A_r3_00000__270e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$273B ->$271A */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__273b_M7A_r3_00000__26d0);
  return;
}


// ===== FUN_M7A_r3_00000__271a @ M7A_r3_00000::271a =====

void __h3000 FUN_M7A_r3_00000__271a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$273B ->$271A */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__273b_M7A_r3_00000__26d0);
  return;
}


// ===== FUN_M7A_r3_00000__273b @ M7A_r3_00000::273b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x276d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__273b(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_7106;
  if (DAT_7166 == 0) {
    DAT_7162 = DAT_7166;
  }
  else {
    *(char *)(sVar2 + -1) = (char)DAT_7106;
    *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
    *(undefined1 *)(sVar2 + -3) = 0x28;
    puVar3 = (undefined1 *)(sVar2 + -4);
    *puVar3 = 0;
    API_FCEE();
    sVar2 = DAT_7166;
    puVar3[-1] = (char)DAT_7166;
    psVar4 = (short *)(puVar3 + -2);
    *(char *)psVar4 = (char)((ushort)sVar2 >> 8);
    API_FCEA();
    DAT_7162 = *psVar4;
  }
  FUN_M7A_r3_00000__25f3();
                    /* WARNING: Could not recover jumptable at 0x276d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2795 @ M7A_r3_00000::2795 =====

void __h3000 FUN_M7A_r3_00000__2795(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7A_r3_00000__276f);
  return;
}


// ===== FUN_M7A_r3_00000__27a1 @ M7A_r3_00000::27a1 =====

void __h3000 FUN_M7A_r3_00000__27a1(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7A_r3_00000__276f);
  return;
}


// ===== FUN_M7A_r3_00000__27ad @ M7A_r3_00000::27ad =====

void __h3000 FUN_M7A_r3_00000__27ad(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7A_r3_00000__276f);
  return;
}


// ===== FUN_M7A_r3_00000__27b9 @ M7A_r3_00000::27b9 =====

void __h3000 FUN_M7A_r3_00000__27b9(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7A_r3_00000__276f);
  return;
}


// ===== FUN_M7A_r3_00000__27da @ M7A_r3_00000::27da =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x285f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__27da(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 in_D;
  char cVar3;
  undefined2 uVar2;
  short sVar4;
  short *psVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar4 = param_3;
  API_FE76();
  cVar3 = (char)DAT_716a;
  if (cVar3 < '\x06') {
    DAT_70de = DAT_716a;
    DAT_70e0 = 0;
  }
  else if (cVar3 == '\x06') {
    DAT_70de = 0;
    DAT_70e0 = 1;
  }
  else if (cVar3 < '\v') {
    DAT_70de = DAT_716a + -5;
    DAT_70e0 = 1;
  }
  else if (cVar3 == '\v') {
    DAT_70de = 2;
    DAT_70e0 = 2;
  }
  else {
    DAT_70de = 4;
    DAT_70e0 = 2;
  }
  sVar1 = DAT_70de;
  *(char *)(sVar4 + -1) = (char)DAT_70de;
  *(char *)(sVar4 + -2) = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)(sVar4 + -3) = 0x41;
  psVar5 = (short *)(sVar4 + -4);
  *(undefined1 *)psVar5 = 0;
  API_FCEE();
  DAT_70de = *psVar5;
  uVar2 = FUN_M7A_r3_00000__0efd
                    ((char)((ushort)DAT_70de >> 8),(char)DAT_70de,DAT_70de,0x771,psVar5 + 1);
  FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,DAT_70e0,0x773);
                    /* WARNING: Could not recover jumptable at 0x285f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2887 @ M7A_r3_00000::2887 =====

void __h3000 FUN_M7A_r3_00000__2887(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7A_r3_00000__2861);
  return;
}


// ===== FUN_M7A_r3_00000__2893 @ M7A_r3_00000::2893 =====

void __h3000 FUN_M7A_r3_00000__2893(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7A_r3_00000__2861);
  return;
}


// ===== FUN_M7A_r3_00000__289f @ M7A_r3_00000::289f =====

void __h3000 FUN_M7A_r3_00000__289f(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7A_r3_00000__2861);
  return;
}


// ===== FUN_M7A_r3_00000__28ab @ M7A_r3_00000::28ab =====

void __h3000 FUN_M7A_r3_00000__28ab(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7A_r3_00000__2861);
  return;
}


// ===== FUN_M7A_r3_00000__28cc @ M7A_r3_00000::28cc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2951 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__28cc(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 in_D;
  char cVar3;
  undefined2 uVar2;
  short sVar4;
  short *psVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar4 = param_3;
  API_FE76();
  cVar3 = (char)DAT_716e;
  if (cVar3 < '\x06') {
    DAT_70de = DAT_716e;
    DAT_70e0 = 0;
  }
  else if (cVar3 == '\x06') {
    DAT_70de = 0;
    DAT_70e0 = 1;
  }
  else if (cVar3 < '\v') {
    DAT_70de = DAT_716e + -5;
    DAT_70e0 = 1;
  }
  else if (cVar3 == '\v') {
    DAT_70de = 2;
    DAT_70e0 = 2;
  }
  else {
    DAT_70de = 4;
    DAT_70e0 = 2;
  }
  sVar1 = DAT_70de;
  *(char *)(sVar4 + -1) = (char)DAT_70de;
  *(char *)(sVar4 + -2) = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)(sVar4 + -3) = 0x41;
  psVar5 = (short *)(sVar4 + -4);
  *(undefined1 *)psVar5 = 0;
  API_FCEE();
  DAT_70de = *psVar5;
  uVar2 = FUN_M7A_r3_00000__0efd
                    ((char)((ushort)DAT_70de >> 8),(char)DAT_70de,DAT_70de,0x775,psVar5 + 1);
  FUN_M7A_r3_00000__0efd((char)((ushort)uVar2 >> 8),(char)uVar2,DAT_70e0,0x777);
                    /* WARNING: Could not recover jumptable at 0x2951. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__29fb @ M7A_r3_00000::29fb =====

void __h3000 FUN_M7A_r3_00000__29fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2A40 ->$2A1F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2a40_M7A_r3_00000__29d5);
  return;
}


// ===== FUN_M7A_r3_00000__2a07 @ M7A_r3_00000::2a07 =====

void __h3000 FUN_M7A_r3_00000__2a07(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2A40 ->$2A1F */
                    /* inline[API_FDBC]: "5.94..)." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2a40_M7A_r3_00000__29d5);
  return;
}


// ===== FUN_M7A_r3_00000__2a13 @ M7A_r3_00000::2a13 =====

void __h3000 FUN_M7A_r3_00000__2a13(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2A40 ->$2A1F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2a40_M7A_r3_00000__29d5);
  return;
}


// ===== FUN_M7A_r3_00000__2a1f @ M7A_r3_00000::2a1f =====

void __h3000 FUN_M7A_r3_00000__2a1f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2A40 ->$2A1F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2a40_M7A_r3_00000__29d5);
  return;
}


// ===== FUN_M7A_r3_00000__2a40 @ M7A_r3_00000::2a40 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2a6a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2a40(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = *(undefined2 *)
              (&UNK_M7A_r3_00000__2b03 +
              g_moduleBase + CONCAT11((char)(DAT_7172 + 0x29U >> 7),(char)(DAT_7172 + 0x29U) << 1));
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x778);
                    /* WARNING: Could not recover jumptable at 0x2a6a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2a92 @ M7A_r3_00000::2a92 =====

void __h3000 FUN_M7A_r3_00000__2a92(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2AD7 ->$2AB6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ad7_M7A_r3_00000__2a6c);
  return;
}


// ===== FUN_M7A_r3_00000__2a9e @ M7A_r3_00000::2a9e =====

void __h3000 FUN_M7A_r3_00000__2a9e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2AD7 ->$2AB6 */
                    /* inline[API_FDBC]: "5.94..*l" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ad7_M7A_r3_00000__2a6c);
  return;
}


// ===== FUN_M7A_r3_00000__2aaa @ M7A_r3_00000::2aaa =====

void __h3000 FUN_M7A_r3_00000__2aaa(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2AD7 ->$2AB6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ad7_M7A_r3_00000__2a6c);
  return;
}


// ===== FUN_M7A_r3_00000__2ab6 @ M7A_r3_00000::2ab6 =====

void __h3000 FUN_M7A_r3_00000__2ab6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2AD7 ->$2AB6 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ad7_M7A_r3_00000__2a6c);
  return;
}


// ===== FUN_M7A_r3_00000__2ad7 @ M7A_r3_00000::2ad7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2b01 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2ad7(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = *(undefined2 *)
              (&UNK_M7A_r3_00000__2b03 +
              g_moduleBase + CONCAT11((char)(DAT_7176 + 0x29U >> 7),(char)(DAT_7176 + 0x29U) << 1));
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x779);
                    /* WARNING: Could not recover jumptable at 0x2b01. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2b7d @ M7A_r3_00000::2b7d =====

void __h3000 FUN_M7A_r3_00000__2b7d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2BC2 ->$2BA1 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2bc2_M7A_r3_00000__2b57);
  return;
}


// ===== FUN_M7A_r3_00000__2b89 @ M7A_r3_00000::2b89 =====

void __h3000 FUN_M7A_r3_00000__2b89(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2BC2 ->$2BA1 */
                    /* inline[API_FDBC]: "5.94..+W" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2bc2_M7A_r3_00000__2b57);
  return;
}


// ===== FUN_M7A_r3_00000__2b95 @ M7A_r3_00000::2b95 =====

void __h3000 FUN_M7A_r3_00000__2b95(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2BC2 ->$2BA1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2bc2_M7A_r3_00000__2b57);
  return;
}


// ===== FUN_M7A_r3_00000__2ba1 @ M7A_r3_00000::2ba1 =====

void __h3000 FUN_M7A_r3_00000__2ba1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2BC2 ->$2BA1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2bc2_M7A_r3_00000__2b57);
  return;
}


// ===== FUN_M7A_r3_00000__2bc2 @ M7A_r3_00000::2bc2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2be8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2bc2(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_717a;
  *(char *)(sVar3 + -1) = (char)DAT_717a;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x38;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0xf;
  API_FCF2();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x772,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x2be8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2c10 @ M7A_r3_00000::2c10 =====

void __h3000 FUN_M7A_r3_00000__2c10(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2C55 ->$2C34 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2c55_M7A_r3_00000__2bea);
  return;
}


// ===== FUN_M7A_r3_00000__2c1c @ M7A_r3_00000::2c1c =====

void __h3000 FUN_M7A_r3_00000__2c1c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2C55 ->$2C34 */
                    /* inline[API_FDBC]: "5.94..+." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2c55_M7A_r3_00000__2bea);
  return;
}


// ===== FUN_M7A_r3_00000__2c28 @ M7A_r3_00000::2c28 =====

void __h3000 FUN_M7A_r3_00000__2c28(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2C55 ->$2C34 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2c55_M7A_r3_00000__2bea);
  return;
}


// ===== FUN_M7A_r3_00000__2c34 @ M7A_r3_00000::2c34 =====

void __h3000 FUN_M7A_r3_00000__2c34(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2C55 ->$2C34 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2c55_M7A_r3_00000__2bea);
  return;
}


// ===== FUN_M7A_r3_00000__2c55 @ M7A_r3_00000::2c55 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2c7b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2c55(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_717e;
  *(char *)(sVar3 + -1) = (char)DAT_717e;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x38;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0xf;
  API_FCF2();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x776,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x2c7b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2ca3 @ M7A_r3_00000::2ca3 =====

void __h3000 FUN_M7A_r3_00000__2ca3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2CFA ->$2CC7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2cfa_M7A_r3_00000__2c7d);
  return;
}


// ===== FUN_M7A_r3_00000__2caf @ M7A_r3_00000::2caf =====

void __h3000 FUN_M7A_r3_00000__2caf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2CFA ->$2CC7 */
                    /* inline[API_FDBC]: "5.94..,}" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2cfa_M7A_r3_00000__2c7d);
  return;
}


// ===== FUN_M7A_r3_00000__2cbb @ M7A_r3_00000::2cbb =====

void __h3000 FUN_M7A_r3_00000__2cbb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2CFA ->$2CC7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2cfa_M7A_r3_00000__2c7d);
  return;
}


// ===== FUN_M7A_r3_00000__2cc7 @ M7A_r3_00000::2cc7 =====

void __h3000 FUN_M7A_r3_00000__2cc7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2CFA ->$2CC7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2cfa_M7A_r3_00000__2c7d);
  return;
}


// ===== FUN_M7A_r3_00000__2ce8 @ M7A_r3_00000::2ce8 =====

void __h3000 FUN_M7A_r3_00000__2ce8(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__2ca3();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x2cf8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__2cfa @ M7A_r3_00000::2cfa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2d16 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2cfa(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = FUN_M7A_r3_00000__2ee9((char)((ushort)DAT_7182 >> 8));
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x768);
                    /* WARNING: Could not recover jumptable at 0x2d16. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2d3e @ M7A_r3_00000::2d3e =====

void __h3000 FUN_M7A_r3_00000__2d3e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2D95 ->$2D62 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2d95_M7A_r3_00000__2d18);
  return;
}


// ===== FUN_M7A_r3_00000__2d4a @ M7A_r3_00000::2d4a =====

void __h3000 FUN_M7A_r3_00000__2d4a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2D95 ->$2D62 */
                    /* inline[API_FDBC]: "5.94..-." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2d95_M7A_r3_00000__2d18);
  return;
}


// ===== FUN_M7A_r3_00000__2d56 @ M7A_r3_00000::2d56 =====

void __h3000 FUN_M7A_r3_00000__2d56(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2D95 ->$2D62 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2d95_M7A_r3_00000__2d18);
  return;
}


// ===== FUN_M7A_r3_00000__2d62 @ M7A_r3_00000::2d62 =====

void __h3000 FUN_M7A_r3_00000__2d62(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2D95 ->$2D62 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2d95_M7A_r3_00000__2d18);
  return;
}


// ===== FUN_M7A_r3_00000__2d83 @ M7A_r3_00000::2d83 =====

void __h3000 FUN_M7A_r3_00000__2d83(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__2d3e();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x2d93. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__2d95 @ M7A_r3_00000::2d95 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2db1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2d95(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = FUN_M7A_r3_00000__2ee9((char)((ushort)DAT_7186 >> 8));
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x76c);
                    /* WARNING: Could not recover jumptable at 0x2db1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2dd9 @ M7A_r3_00000::2dd9 =====

void __h3000 FUN_M7A_r3_00000__2dd9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2E30 ->$2DFD */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2e30_M7A_r3_00000__2db3);
  return;
}


// ===== FUN_M7A_r3_00000__2de5 @ M7A_r3_00000::2de5 =====

void __h3000 FUN_M7A_r3_00000__2de5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2E30 ->$2DFD */
                    /* inline[API_FDBC]: "5.94..-." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2e30_M7A_r3_00000__2db3);
  return;
}


// ===== FUN_M7A_r3_00000__2df1 @ M7A_r3_00000::2df1 =====

void __h3000 FUN_M7A_r3_00000__2df1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2E30 ->$2DFD */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2e30_M7A_r3_00000__2db3);
  return;
}


// ===== FUN_M7A_r3_00000__2dfd @ M7A_r3_00000::2dfd =====

void __h3000 FUN_M7A_r3_00000__2dfd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2E30 ->$2DFD */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2e30_M7A_r3_00000__2db3);
  return;
}


// ===== FUN_M7A_r3_00000__2e1e @ M7A_r3_00000::2e1e =====

void __h3000 FUN_M7A_r3_00000__2e1e(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__2dd9();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x2e2e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__2e30 @ M7A_r3_00000::2e30 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2e4c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2e30(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = FUN_M7A_r3_00000__2ee9((char)((ushort)DAT_718a >> 8));
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x769);
                    /* WARNING: Could not recover jumptable at 0x2e4c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2e74 @ M7A_r3_00000::2e74 =====

void __h3000 FUN_M7A_r3_00000__2e74(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2ECB ->$2E98 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ecb_M7A_r3_00000__2e4e);
  return;
}


// ===== FUN_M7A_r3_00000__2e80 @ M7A_r3_00000::2e80 =====

void __h3000 FUN_M7A_r3_00000__2e80(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2ECB ->$2E98 */
                    /* inline[API_FDBC]: "5.94...N" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ecb_M7A_r3_00000__2e4e);
  return;
}


// ===== FUN_M7A_r3_00000__2e8c @ M7A_r3_00000::2e8c =====

void __h3000 FUN_M7A_r3_00000__2e8c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2ECB ->$2E98 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ecb_M7A_r3_00000__2e4e);
  return;
}


// ===== FUN_M7A_r3_00000__2e98 @ M7A_r3_00000::2e98 =====

void __h3000 FUN_M7A_r3_00000__2e98(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2ECB ->$2E98 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__2ecb_M7A_r3_00000__2e4e);
  return;
}


// ===== FUN_M7A_r3_00000__2eb9 @ M7A_r3_00000::2eb9 =====

void __h3000 FUN_M7A_r3_00000__2eb9(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__2e74();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x2ec9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__2ecb @ M7A_r3_00000::2ecb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2ee7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2ecb(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70de = FUN_M7A_r3_00000__2ee9((char)((ushort)DAT_718e >> 8));
  uVar1 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar1,DAT_70de,0x76d);
                    /* WARNING: Could not recover jumptable at 0x2ee7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2ee9 @ M7A_r3_00000::2ee9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2f93 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__2ee9(undefined2 param_1,undefined2 param_2,short param_3)

{
  char cVar1;
  byte *in_D;
  byte bVar3;
  short sVar2;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar3 = (byte)in_D;
  cVar1 = (char)((ushort)in_D >> 8);
  if (in_D < (byte *)0xa == (in_D == (byte *)0xa)) {
    if (in_D < (byte *)0x64 == (in_D == (byte *)0x64)) {
      if (in_D < &BYTE_M7A_r3_00000__03e8 == (in_D == &BYTE_M7A_r3_00000__03e8)) {
        *(byte *)(param_3 + -1) = bVar3;
        *(char *)(param_3 + -2) = cVar1;
        *(undefined1 *)(param_3 + -3) = 0xe8;
        psVar4 = (short *)(param_3 + -4);
        *(undefined1 *)psVar4 = 3;
        API_FCEA();
        sVar2 = CONCAT11((char)(*psVar4 - 1U >> 7),(char)(*psVar4 - 1U) << 1);
        DAT_70de = *(undefined2 *)(&UNK_M7A_r3_00000__2fcd + g_moduleBase + sVar2);
      }
      else {
        *(byte *)(param_3 + -1) = bVar3;
        *(char *)(param_3 + -2) = cVar1;
        *(undefined1 *)(param_3 + -3) = 100;
        psVar4 = (short *)(param_3 + -4);
        *(undefined1 *)psVar4 = 0;
        API_FCEA();
        sVar2 = CONCAT11((char)(*psVar4 - 1U >> 7),(char)(*psVar4 - 1U) << 1);
        DAT_70de = *(undefined2 *)(&UNK_M7A_r3_00000__2fbb + g_moduleBase + sVar2);
      }
    }
    else {
      *(byte *)(param_3 + -1) = bVar3;
      *(char *)(param_3 + -2) = cVar1;
      *(undefined1 *)(param_3 + -3) = 10;
      psVar4 = (short *)(param_3 + -4);
      *(undefined1 *)psVar4 = 0;
      API_FCEA();
      sVar2 = CONCAT11((char)(*psVar4 - 1U >> 7),(char)(*psVar4 - 1U) << 1);
      DAT_70de = *(undefined2 *)(&UNK_M7A_r3_00000__2fa9 + g_moduleBase + sVar2);
    }
  }
  else {
    sVar2 = CONCAT11(cVar1 << 1 | bVar3 >> 7,bVar3 << 1);
    DAT_70de = *(undefined2 *)(FUN_M7A_r3_00000__2f95 + g_moduleBase + sVar2);
  }
                    /* WARNING: Could not recover jumptable at 0x2f93. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)DAT_70de >> 8),(char)sVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__2f95 @ M7A_r3_00000::2f95 =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FUN_M7A_r3_00000__2f95(void)

{
                    /* WARNING: Read-only address (RAM,0xff4d) is written */
  uRAMff4d = 0;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_M7A_r3_00000__3007 @ M7A_r3_00000::3007 =====

void __h3000 FUN_M7A_r3_00000__3007(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$304C ->$302B */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__304c_M7A_r3_00000__2fe1);
  return;
}


// ===== FUN_M7A_r3_00000__3013 @ M7A_r3_00000::3013 =====

void __h3000 FUN_M7A_r3_00000__3013(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$304C ->$302B */
                    /* inline[API_FDBC]: "5.94../." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__304c_M7A_r3_00000__2fe1);
  return;
}


// ===== FUN_M7A_r3_00000__301f @ M7A_r3_00000::301f =====

void __h3000 FUN_M7A_r3_00000__301f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$304C ->$302B */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__304c_M7A_r3_00000__2fe1);
  return;
}


// ===== FUN_M7A_r3_00000__302b @ M7A_r3_00000::302b =====

void __h3000 FUN_M7A_r3_00000__302b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$304C ->$302B */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__304c_M7A_r3_00000__2fe1);
  return;
}


// ===== FUN_M7A_r3_00000__304c @ M7A_r3_00000::304c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3072 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__304c(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7192;
  *(char *)(sVar3 + -1) = (char)DAT_7192;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x55;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 1;
  API_FCEC();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x76a,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3072. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__309a @ M7A_r3_00000::309a =====

void __h3000 FUN_M7A_r3_00000__309a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$30DF ->$30BE */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__30df_M7A_r3_00000__3074);
  return;
}


// ===== FUN_M7A_r3_00000__30a6 @ M7A_r3_00000::30a6 =====

void __h3000 FUN_M7A_r3_00000__30a6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$30DF ->$30BE */
                    /* inline[API_FDBC]: "5.94..0t" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__30df_M7A_r3_00000__3074);
  return;
}


// ===== FUN_M7A_r3_00000__30b2 @ M7A_r3_00000::30b2 =====

void __h3000 FUN_M7A_r3_00000__30b2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$30DF ->$30BE */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__30df_M7A_r3_00000__3074);
  return;
}


// ===== FUN_M7A_r3_00000__30be @ M7A_r3_00000::30be =====

void __h3000 FUN_M7A_r3_00000__30be(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$30DF ->$30BE */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__30df_M7A_r3_00000__3074);
  return;
}


// ===== FUN_M7A_r3_00000__30df @ M7A_r3_00000::30df =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3105 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__30df(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = _DAT_7196;
  *(char *)(sVar3 + -1) = (char)_DAT_7196;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x55;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 1;
  API_FCEC();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x76e,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3105. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__312d @ M7A_r3_00000::312d =====

void __h3000 FUN_M7A_r3_00000__312d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3172 ->$3151 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3172_M7A_r3_00000__3107);
  return;
}


// ===== FUN_M7A_r3_00000__3139 @ M7A_r3_00000::3139 =====

void __h3000 FUN_M7A_r3_00000__3139(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3172 ->$3151 */
                    /* inline[API_FDBC]: "5.94..1." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3172_M7A_r3_00000__3107);
  return;
}


// ===== FUN_M7A_r3_00000__3145 @ M7A_r3_00000::3145 =====

void __h3000 FUN_M7A_r3_00000__3145(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3172 ->$3151 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3172_M7A_r3_00000__3107);
  return;
}


// ===== FUN_M7A_r3_00000__3151 @ M7A_r3_00000::3151 =====

void __h3000 FUN_M7A_r3_00000__3151(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3172 ->$3151 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3172_M7A_r3_00000__3107);
  return;
}


// ===== FUN_M7A_r3_00000__3172 @ M7A_r3_00000::3172 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x31a4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3172(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined1 *puVar4;
  short *psVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  *(undefined1 *)(sVar3 + -1) = 0xff;
  *(undefined1 *)(sVar3 + -2) = 0x7f;
  uVar1 = DAT_719a;
  *(char *)(sVar3 + -3) = (char)DAT_719a;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCE6();
  puVar4[-1] = 10;
  psVar5 = (short *)(puVar4 + -2);
  *(undefined1 *)psVar5 = 0;
  API_FCEC();
  DAT_70de = *psVar5 + -0x7fff;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x76b,psVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x31a4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__31cc @ M7A_r3_00000::31cc =====

void __h3000 FUN_M7A_r3_00000__31cc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3211 ->$31F0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3211_M7A_r3_00000__31a6);
  return;
}


// ===== FUN_M7A_r3_00000__31d8 @ M7A_r3_00000::31d8 =====

void __h3000 FUN_M7A_r3_00000__31d8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3211 ->$31F0 */
                    /* inline[API_FDBC]: "5.94..1." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3211_M7A_r3_00000__31a6);
  return;
}


// ===== FUN_M7A_r3_00000__31e4 @ M7A_r3_00000::31e4 =====

void __h3000 FUN_M7A_r3_00000__31e4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3211 ->$31F0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3211_M7A_r3_00000__31a6);
  return;
}


// ===== FUN_M7A_r3_00000__31f0 @ M7A_r3_00000::31f0 =====

void __h3000 FUN_M7A_r3_00000__31f0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3211 ->$31F0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3211_M7A_r3_00000__31a6);
  return;
}


// ===== FUN_M7A_r3_00000__3211 @ M7A_r3_00000::3211 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3243 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3211(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined1 *puVar4;
  short *psVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  *(undefined1 *)(sVar3 + -1) = 0xff;
  *(undefined1 *)(sVar3 + -2) = 0x7f;
  uVar1 = DAT_719e;
  *(char *)(sVar3 + -3) = (char)DAT_719e;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCE6();
  puVar4[-1] = 10;
  psVar5 = (short *)(puVar4 + -2);
  *(undefined1 *)psVar5 = 0;
  API_FCEC();
  DAT_70de = *psVar5 + -0x7fff;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd
            ((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,FUN_M7A_r3_00000__076f,psVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x3243. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__326b @ M7A_r3_00000::326b =====

void __h3000 FUN_M7A_r3_00000__326b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$32B0 ->$328F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__32b0_M7A_r3_00000__3245);
  return;
}


// ===== FUN_M7A_r3_00000__3277 @ M7A_r3_00000::3277 =====

void __h3000 FUN_M7A_r3_00000__3277(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$32B0 ->$328F */
                    /* inline[API_FDBC]: "5.94..2E" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__32b0_M7A_r3_00000__3245);
  return;
}


// ===== FUN_M7A_r3_00000__3283 @ M7A_r3_00000::3283 =====

void __h3000 FUN_M7A_r3_00000__3283(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$32B0 ->$328F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__32b0_M7A_r3_00000__3245);
  return;
}


// ===== FUN_M7A_r3_00000__328f @ M7A_r3_00000::328f =====

void __h3000 FUN_M7A_r3_00000__328f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$32B0 ->$328F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__32b0_M7A_r3_00000__3245);
  return;
}


// ===== FUN_M7A_r3_00000__32b0 @ M7A_r3_00000::32b0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x32d6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__32b0(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71a2;
  *(char *)(sVar3 + -1) = (char)DAT_71a2;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x758,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x32d6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__32fe @ M7A_r3_00000::32fe =====

void __h3000 FUN_M7A_r3_00000__32fe(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3343 ->$3322 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3343_M7A_r3_00000__32d8);
  return;
}


// ===== FUN_M7A_r3_00000__330a @ M7A_r3_00000::330a =====

void __h3000 FUN_M7A_r3_00000__330a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3343 ->$3322 */
                    /* inline[API_FDBC]: "5.94..2." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3343_M7A_r3_00000__32d8);
  return;
}


// ===== FUN_M7A_r3_00000__3316 @ M7A_r3_00000::3316 =====

void __h3000 FUN_M7A_r3_00000__3316(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3343 ->$3322 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3343_M7A_r3_00000__32d8);
  return;
}


// ===== FUN_M7A_r3_00000__3322 @ M7A_r3_00000::3322 =====

void __h3000 FUN_M7A_r3_00000__3322(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3343 ->$3322 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3343_M7A_r3_00000__32d8);
  return;
}


// ===== FUN_M7A_r3_00000__3343 @ M7A_r3_00000::3343 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3369 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3343(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71a6;
  *(char *)(sVar3 + -1) = (char)DAT_71a6;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd
            ((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,FUN_M7A_r3_00000__0759,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3369. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__3391 @ M7A_r3_00000::3391 =====

void __h3000 FUN_M7A_r3_00000__3391(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$33D6 ->$33B5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__33d6_M7A_r3_00000__336b);
  return;
}


// ===== FUN_M7A_r3_00000__339d @ M7A_r3_00000::339d =====

void __h3000 FUN_M7A_r3_00000__339d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$33D6 ->$33B5 */
                    /* inline[API_FDBC]: "5.94..3k" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__33d6_M7A_r3_00000__336b);
  return;
}


// ===== FUN_M7A_r3_00000__33a9 @ M7A_r3_00000::33a9 =====

void __h3000 FUN_M7A_r3_00000__33a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$33D6 ->$33B5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__33d6_M7A_r3_00000__336b);
  return;
}


// ===== FUN_M7A_r3_00000__33b5 @ M7A_r3_00000::33b5 =====

void __h3000 FUN_M7A_r3_00000__33b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$33D6 ->$33B5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__33d6_M7A_r3_00000__336b);
  return;
}


// ===== FUN_M7A_r3_00000__33d6 @ M7A_r3_00000::33d6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x33fc */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__33d6(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71aa;
  *(char *)(sVar3 + -1) = (char)DAT_71aa;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x75a,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x33fc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__3424 @ M7A_r3_00000::3424 =====

void __h3000 FUN_M7A_r3_00000__3424(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3469 ->$3448 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3469_M7A_r3_00000__33fe);
  return;
}


// ===== FUN_M7A_r3_00000__3430 @ M7A_r3_00000::3430 =====

void __h3000 FUN_M7A_r3_00000__3430(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3469 ->$3448 */
                    /* inline[API_FDBC]: "5.94..3." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3469_M7A_r3_00000__33fe);
  return;
}


// ===== FUN_M7A_r3_00000__343c @ M7A_r3_00000::343c =====

void __h3000 FUN_M7A_r3_00000__343c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3469 ->$3448 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3469_M7A_r3_00000__33fe);
  return;
}


// ===== FUN_M7A_r3_00000__3448 @ M7A_r3_00000::3448 =====

void __h3000 FUN_M7A_r3_00000__3448(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3469 ->$3448 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3469_M7A_r3_00000__33fe);
  return;
}


// ===== FUN_M7A_r3_00000__3469 @ M7A_r3_00000::3469 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x348f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3469(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71ae;
  *(char *)(sVar3 + -1) = (char)DAT_71ae;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x75b,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x348f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__34b7 @ M7A_r3_00000::34b7 =====

void __h3000 FUN_M7A_r3_00000__34b7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3514 ->$34DB */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491);
  return;
}


// ===== FUN_M7A_r3_00000__34c3 @ M7A_r3_00000::34c3 =====

void __h3000 FUN_M7A_r3_00000__34c3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3514 ->$34DB */
                    /* inline[API_FDBC]: "5.94..4." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491);
  return;
}


// ===== FUN_M7A_r3_00000__34cf @ M7A_r3_00000::34cf =====

void __h3000 FUN_M7A_r3_00000__34cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3514 ->$34DB */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491);
  return;
}


// ===== FUN_M7A_r3_00000__34db @ M7A_r3_00000::34db =====

void __h3000 FUN_M7A_r3_00000__34db(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3514 ->$34DB */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491);
  return;
}


// ===== FUN_M7A_r3_00000__34e7 @ M7A_r3_00000::34e7 =====

void __h3000 FUN_M7A_r3_00000__34e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3514 ->$34DB */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491);
  return;
}


// ===== FUN_M7A_r3_00000__34f3 @ M7A_r3_00000::34f3 =====

void __h3000 FUN_M7A_r3_00000__34f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3514 ->$34DB $34CF */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491);
  return;
}


// ===== FUN_M7A_r3_00000__3514 @ M7A_r3_00000::3514 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3535 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3514(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71b2;
  *(char *)(sVar3 + -1) = (char)DAT_71b2;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x750,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3535. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__355d @ M7A_r3_00000::355d =====

void __h3000 FUN_M7A_r3_00000__355d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$35BA ->$3581 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537);
  return;
}


// ===== FUN_M7A_r3_00000__3569 @ M7A_r3_00000::3569 =====

void __h3000 FUN_M7A_r3_00000__3569(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$35BA ->$3581 */
                    /* inline[API_FDBC]: "5.94..57" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537);
  return;
}


// ===== FUN_M7A_r3_00000__3575 @ M7A_r3_00000::3575 =====

void __h3000 FUN_M7A_r3_00000__3575(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$35BA ->$3581 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537);
  return;
}


// ===== FUN_M7A_r3_00000__3581 @ M7A_r3_00000::3581 =====

void __h3000 FUN_M7A_r3_00000__3581(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$35BA ->$3581 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537);
  return;
}


// ===== FUN_M7A_r3_00000__358d @ M7A_r3_00000::358d =====

void __h3000 FUN_M7A_r3_00000__358d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$35BA ->$3581 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537);
  return;
}


// ===== FUN_M7A_r3_00000__3599 @ M7A_r3_00000::3599 =====

void __h3000 FUN_M7A_r3_00000__3599(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$35BA ->$3581 $3575 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537);
  return;
}


// ===== FUN_M7A_r3_00000__35ba @ M7A_r3_00000::35ba =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x35db */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__35ba(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71b6;
  *(char *)(sVar3 + -1) = (char)DAT_71b6;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x751,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x35db. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__3603 @ M7A_r3_00000::3603 =====

void __h3000 FUN_M7A_r3_00000__3603(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3660 ->$3627 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd);
  return;
}


// ===== FUN_M7A_r3_00000__360f @ M7A_r3_00000::360f =====

void __h3000 FUN_M7A_r3_00000__360f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3660 ->$3627 */
                    /* inline[API_FDBC]: "5.94..5." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd);
  return;
}


// ===== FUN_M7A_r3_00000__361b @ M7A_r3_00000::361b =====

void __h3000 FUN_M7A_r3_00000__361b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3660 ->$3627 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd);
  return;
}


// ===== FUN_M7A_r3_00000__3627 @ M7A_r3_00000::3627 =====

void __h3000 FUN_M7A_r3_00000__3627(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3660 ->$3627 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd);
  return;
}


// ===== FUN_M7A_r3_00000__3633 @ M7A_r3_00000::3633 =====

void __h3000 FUN_M7A_r3_00000__3633(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3660 ->$3627 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd);
  return;
}


// ===== FUN_M7A_r3_00000__363f @ M7A_r3_00000::363f =====

void __h3000 FUN_M7A_r3_00000__363f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3660 ->$3627 $361B */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd);
  return;
}


// ===== FUN_M7A_r3_00000__3660 @ M7A_r3_00000::3660 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3681 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3660(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71ba;
  *(char *)(sVar3 + -1) = (char)DAT_71ba;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd
            ((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,FUN_M7A_r3_00000__0752,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3681. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__36a9 @ M7A_r3_00000::36a9 =====

void __h3000 FUN_M7A_r3_00000__36a9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3706 ->$36CD */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683);
  return;
}


// ===== FUN_M7A_r3_00000__36b5 @ M7A_r3_00000::36b5 =====

void __h3000 FUN_M7A_r3_00000__36b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3706 ->$36CD */
                    /* inline[API_FDBC]: "5.94..6." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683);
  return;
}


// ===== FUN_M7A_r3_00000__36c1 @ M7A_r3_00000::36c1 =====

void __h3000 FUN_M7A_r3_00000__36c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3706 ->$36CD */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683);
  return;
}


// ===== FUN_M7A_r3_00000__36cd @ M7A_r3_00000::36cd =====

void __h3000 FUN_M7A_r3_00000__36cd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3706 ->$36CD */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683);
  return;
}


// ===== FUN_M7A_r3_00000__36d9 @ M7A_r3_00000::36d9 =====

void __h3000 FUN_M7A_r3_00000__36d9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3706 ->$36CD */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683);
  return;
}


// ===== FUN_M7A_r3_00000__36e5 @ M7A_r3_00000::36e5 =====

void __h3000 FUN_M7A_r3_00000__36e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3706 ->$36CD $36C1 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683);
  return;
}


// ===== FUN_M7A_r3_00000__3706 @ M7A_r3_00000::3706 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3727 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3706(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71be;
  *(char *)(sVar3 + -1) = (char)DAT_71be;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x753,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3727. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__374f @ M7A_r3_00000::374f =====

void __h3000 FUN_M7A_r3_00000__374f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$37AC ->$3773 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729);
  return;
}


// ===== FUN_M7A_r3_00000__375b @ M7A_r3_00000::375b =====

void __h3000 FUN_M7A_r3_00000__375b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$37AC ->$3773 */
                    /* inline[API_FDBC]: "5.94..7)" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729);
  return;
}


// ===== FUN_M7A_r3_00000__3767 @ M7A_r3_00000::3767 =====

void __h3000 FUN_M7A_r3_00000__3767(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$37AC ->$3773 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729);
  return;
}


// ===== FUN_M7A_r3_00000__3773 @ M7A_r3_00000::3773 =====

void __h3000 FUN_M7A_r3_00000__3773(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$37AC ->$3773 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729);
  return;
}


// ===== FUN_M7A_r3_00000__377f @ M7A_r3_00000::377f =====

void __h3000 FUN_M7A_r3_00000__377f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$37AC ->$3773 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729);
  return;
}


// ===== FUN_M7A_r3_00000__378b @ M7A_r3_00000::378b =====

void __h3000 FUN_M7A_r3_00000__378b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$37AC ->$3773 $3767 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729);
  return;
}


// ===== FUN_M7A_r3_00000__37ac @ M7A_r3_00000::37ac =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x37cd */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__37ac(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71c2;
  *(char *)(sVar3 + -1) = (char)DAT_71c2;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x754,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x37cd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__37f5 @ M7A_r3_00000::37f5 =====

void __h3000 FUN_M7A_r3_00000__37f5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3852 ->$3819 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf);
  return;
}


// ===== FUN_M7A_r3_00000__3801 @ M7A_r3_00000::3801 =====

void __h3000 FUN_M7A_r3_00000__3801(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3852 ->$3819 */
                    /* inline[API_FDBC]: "5.94..7." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf);
  return;
}


// ===== FUN_M7A_r3_00000__380d @ M7A_r3_00000::380d =====

void __h3000 FUN_M7A_r3_00000__380d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3852 ->$3819 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf);
  return;
}


// ===== FUN_M7A_r3_00000__3819 @ M7A_r3_00000::3819 =====

void __h3000 FUN_M7A_r3_00000__3819(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3852 ->$3819 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf);
  return;
}


// ===== FUN_M7A_r3_00000__3825 @ M7A_r3_00000::3825 =====

void __h3000 FUN_M7A_r3_00000__3825(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3852 ->$3819 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf);
  return;
}


// ===== FUN_M7A_r3_00000__3831 @ M7A_r3_00000::3831 =====

void __h3000 FUN_M7A_r3_00000__3831(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3852 ->$3819 $380D */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf);
  return;
}


// ===== FUN_M7A_r3_00000__3852 @ M7A_r3_00000::3852 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3873 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3852(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71c6;
  *(char *)(sVar3 + -1) = (char)DAT_71c6;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x755,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3873. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__389b @ M7A_r3_00000::389b =====

void __h3000 FUN_M7A_r3_00000__389b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$38F8 ->$38BF */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875);
  return;
}


// ===== FUN_M7A_r3_00000__38a7 @ M7A_r3_00000::38a7 =====

void __h3000 FUN_M7A_r3_00000__38a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$38F8 ->$38BF */
                    /* inline[API_FDBC]: "5.94..8u" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875);
  return;
}


// ===== FUN_M7A_r3_00000__38b3 @ M7A_r3_00000::38b3 =====

void __h3000 FUN_M7A_r3_00000__38b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$38F8 ->$38BF */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875);
  return;
}


// ===== FUN_M7A_r3_00000__38bf @ M7A_r3_00000::38bf =====

void __h3000 FUN_M7A_r3_00000__38bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$38F8 ->$38BF */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875);
  return;
}


// ===== FUN_M7A_r3_00000__38cb @ M7A_r3_00000::38cb =====

void __h3000 FUN_M7A_r3_00000__38cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$38F8 ->$38BF */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875);
  return;
}


// ===== FUN_M7A_r3_00000__38d7 @ M7A_r3_00000::38d7 =====

void __h3000 FUN_M7A_r3_00000__38d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$38F8 ->$38BF $38B3 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875);
  return;
}


// ===== FUN_M7A_r3_00000__38f8 @ M7A_r3_00000::38f8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3919 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__38f8(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71ca;
  *(char *)(sVar3 + -1) = (char)DAT_71ca;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x756,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3919. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__3941 @ M7A_r3_00000::3941 =====

void __h3000 FUN_M7A_r3_00000__3941(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$399E ->$3965 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b);
  return;
}


// ===== FUN_M7A_r3_00000__394d @ M7A_r3_00000::394d =====

void __h3000 FUN_M7A_r3_00000__394d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$399E ->$3965 */
                    /* inline[API_FDBC]: "5.94..9." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b);
  return;
}


// ===== FUN_M7A_r3_00000__3959 @ M7A_r3_00000::3959 =====

void __h3000 FUN_M7A_r3_00000__3959(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$399E ->$3965 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b);
  return;
}


// ===== FUN_M7A_r3_00000__3965 @ M7A_r3_00000::3965 =====

void __h3000 FUN_M7A_r3_00000__3965(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$399E ->$3965 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b);
  return;
}


// ===== FUN_M7A_r3_00000__3971 @ M7A_r3_00000::3971 =====

void __h3000 FUN_M7A_r3_00000__3971(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$399E ->$3965 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b);
  return;
}


// ===== FUN_M7A_r3_00000__397d @ M7A_r3_00000::397d =====

void __h3000 FUN_M7A_r3_00000__397d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$399E ->$3965 $3959 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b);
  return;
}


// ===== FUN_M7A_r3_00000__399e @ M7A_r3_00000::399e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x39bf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__399e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71ce;
  *(char *)(sVar3 + -1) = (char)DAT_71ce;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x757,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x39bf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__39e7 @ M7A_r3_00000::39e7 =====

void __h3000 FUN_M7A_r3_00000__39e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3A44 ->$3A0B */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1);
  return;
}


// ===== FUN_M7A_r3_00000__39f3 @ M7A_r3_00000::39f3 =====

void __h3000 FUN_M7A_r3_00000__39f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3A44 ->$3A0B */
                    /* inline[API_FDBC]: "5.94..9." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1);
  return;
}


// ===== FUN_M7A_r3_00000__39ff @ M7A_r3_00000::39ff =====

void __h3000 FUN_M7A_r3_00000__39ff(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3A44 ->$3A0B */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1);
  return;
}


// ===== FUN_M7A_r3_00000__3a0b @ M7A_r3_00000::3a0b =====

void __h3000 FUN_M7A_r3_00000__3a0b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3A44 ->$3A0B */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1);
  return;
}


// ===== FUN_M7A_r3_00000__3a17 @ M7A_r3_00000::3a17 =====

void __h3000 FUN_M7A_r3_00000__3a17(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3A44 ->$3A0B */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1);
  return;
}


// ===== FUN_M7A_r3_00000__3a23 @ M7A_r3_00000::3a23 =====

void __h3000 FUN_M7A_r3_00000__3a23(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3A44 ->$3A0B $39FF */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1);
  return;
}


// ===== FUN_M7A_r3_00000__3a44 @ M7A_r3_00000::3a44 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3a65 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3a44(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71d2;
  *(char *)(sVar3 + -1) = (char)DAT_71d2;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x788,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3a65. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__3a8d @ M7A_r3_00000::3a8d =====

void __h3000 FUN_M7A_r3_00000__3a8d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3AEA ->$3AB1 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67);
  return;
}


// ===== FUN_M7A_r3_00000__3a99 @ M7A_r3_00000::3a99 =====

void __h3000 FUN_M7A_r3_00000__3a99(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3AEA ->$3AB1 */
                    /* inline[API_FDBC]: "5.94..:g" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67);
  return;
}


// ===== FUN_M7A_r3_00000__3aa5 @ M7A_r3_00000::3aa5 =====

void __h3000 FUN_M7A_r3_00000__3aa5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3AEA ->$3AB1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67);
  return;
}


// ===== FUN_M7A_r3_00000__3ab1 @ M7A_r3_00000::3ab1 =====

void __h3000 FUN_M7A_r3_00000__3ab1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3AEA ->$3AB1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67);
  return;
}


// ===== FUN_M7A_r3_00000__3abd @ M7A_r3_00000::3abd =====

void __h3000 FUN_M7A_r3_00000__3abd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3AEA ->$3AB1 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67);
  return;
}


// ===== FUN_M7A_r3_00000__3ac9 @ M7A_r3_00000::3ac9 =====

void __h3000 FUN_M7A_r3_00000__3ac9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3AEA ->$3AB1 $3AA5 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67);
  return;
}


// ===== FUN_M7A_r3_00000__3aea @ M7A_r3_00000::3aea =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3b0b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7A_r3_00000__3aea(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71d6;
  *(char *)(sVar3 + -1) = (char)DAT_71d6;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_70de = *puVar4;
  uVar2 = (undefined1)DAT_70de;
  FUN_M7A_r3_00000__0efd((char)((ushort)DAT_70de >> 8),uVar2,DAT_70de,0x789,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3b0b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7A_r3_00000__3b33 @ M7A_r3_00000::3b33 =====

void __h3000 FUN_M7A_r3_00000__3b33(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7A_r3_00000__3b78_M7A_r3_00000__3b0d);
  return;
}


// ===== FUN_M7A_r3_00000__3b3f @ M7A_r3_00000::3b3f =====

void __h3000 FUN_M7A_r3_00000__3b3f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3B78 ->$3B57 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7A_r3_00000__3b78_M7A_r3_00000__3b0d);
  return;
}


// ===== FUN_M7A_r3_00000__3b4b @ M7A_r3_00000::3b4b =====

void __h3000 FUN_M7A_r3_00000__3b4b(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7A_r3_00000__3b78_M7A_r3_00000__3b0d);
  return;
}


// ===== FUN_M7A_r3_00000__3b57 @ M7A_r3_00000::3b57 =====

void __h3000 FUN_M7A_r3_00000__3b57(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7A_r3_00000__3b78_M7A_r3_00000__3b0d);
  return;
}


// ===== FUN_M7A_r3_00000__3b78 @ M7A_r3_00000::3b78 =====

void __h3000
FUN_M7A_r3_00000__3b78
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7A_r3_00000__3b78_M7A_r3_00000__3b0d);
  API_FE52();
                    /* WARNING: Could not recover jumptable at 0x3b85. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7A_r3_00000__3bad @ M7A_r3_00000::3bad =====

void __h3000 FUN_M7A_r3_00000__3bad(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7A_r3_00000__3bf2_M7A_r3_00000__3b87);
  return;
}


// ===== FUN_M7A_r3_00000__3bb9 @ M7A_r3_00000::3bb9 =====

void __h3000 FUN_M7A_r3_00000__3bb9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3BF2 ->$3BD1 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7A_r3_00000__3bf2_M7A_r3_00000__3b87);
  return;
}


// ===== FUN_M7A_r3_00000__3bc5 @ M7A_r3_00000::3bc5 =====

void __h3000 FUN_M7A_r3_00000__3bc5(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7A_r3_00000__3bf2_M7A_r3_00000__3b87);
  return;
}


// ===== FUN_M7A_r3_00000__3bd1 @ M7A_r3_00000::3bd1 =====

void __h3000 FUN_M7A_r3_00000__3bd1(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7A_r3_00000__3bf2_M7A_r3_00000__3b87);
  return;
}


// ===== FUN_M7A_r3_00000__3bf2 @ M7A_r3_00000::3bf2 =====

void __h3000
FUN_M7A_r3_00000__3bf2
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7A_r3_00000__3bf2_M7A_r3_00000__3b87);
  API_FE54();
                    /* WARNING: Could not recover jumptable at 0x3bff. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7A_r3_00000__3c27 @ M7A_r3_00000::3c27 =====

void __h3000 FUN_M7A_r3_00000__3c27(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7A_r3_00000__3c6c_M7A_r3_00000__3c01);
  return;
}


// ===== FUN_M7A_r3_00000__3c33 @ M7A_r3_00000::3c33 =====

void __h3000 FUN_M7A_r3_00000__3c33(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3C6C ->$3C4B */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7A_r3_00000__3c6c_M7A_r3_00000__3c01);
  return;
}


// ===== FUN_M7A_r3_00000__3c3f @ M7A_r3_00000::3c3f =====

void __h3000 FUN_M7A_r3_00000__3c3f(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7A_r3_00000__3c6c_M7A_r3_00000__3c01);
  return;
}


// ===== FUN_M7A_r3_00000__3c4b @ M7A_r3_00000::3c4b =====

void __h3000 FUN_M7A_r3_00000__3c4b(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7A_r3_00000__3c6c_M7A_r3_00000__3c01);
  return;
}


// ===== FUN_M7A_r3_00000__3c6c @ M7A_r3_00000::3c6c =====

void __h3000
FUN_M7A_r3_00000__3c6c
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7A_r3_00000__3c6c_M7A_r3_00000__3c01);
  API_FE56();
                    /* WARNING: Could not recover jumptable at 0x3c79. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7A_r3_00000__3ca1 @ M7A_r3_00000::3ca1 =====

void __h3000 FUN_M7A_r3_00000__3ca1(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7A_r3_00000__3ce6_M7A_r3_00000__3c7b);
  return;
}


// ===== FUN_M7A_r3_00000__3cad @ M7A_r3_00000::3cad =====

void __h3000 FUN_M7A_r3_00000__3cad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3CE6 ->$3CC5 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7A_r3_00000__3ce6_M7A_r3_00000__3c7b);
  return;
}


// ===== FUN_M7A_r3_00000__3cb9 @ M7A_r3_00000::3cb9 =====

void __h3000 FUN_M7A_r3_00000__3cb9(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7A_r3_00000__3ce6_M7A_r3_00000__3c7b);
  return;
}


// ===== FUN_M7A_r3_00000__3cc5 @ M7A_r3_00000::3cc5 =====

void __h3000 FUN_M7A_r3_00000__3cc5(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7A_r3_00000__3ce6_M7A_r3_00000__3c7b);
  return;
}


// ===== FUN_M7A_r3_00000__3ce6 @ M7A_r3_00000::3ce6 =====

void __h3000
FUN_M7A_r3_00000__3ce6
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7A_r3_00000__3ce6_M7A_r3_00000__3c7b);
  API_FE58();
                    /* WARNING: Could not recover jumptable at 0x3cf3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7A_r3_00000__3d1b @ M7A_r3_00000::3d1b =====

void __h3000 FUN_M7A_r3_00000__3d1b(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7A_r3_00000__3cf5);
  return;
}


// ===== FUN_M7A_r3_00000__3d27 @ M7A_r3_00000::3d27 =====

void __h3000 FUN_M7A_r3_00000__3d27(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7A_r3_00000__3cf5);
  return;
}


// ===== FUN_M7A_r3_00000__3d33 @ M7A_r3_00000::3d33 =====

void __h3000 FUN_M7A_r3_00000__3d33(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7A_r3_00000__3cf5);
  return;
}


// ===== FUN_M7A_r3_00000__3d3f @ M7A_r3_00000::3d3f =====

void __h3000 FUN_M7A_r3_00000__3d3f(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7A_r3_00000__3cf5);
  return;
}


// ===== FUN_M7A_r3_00000__3d5f @ M7A_r3_00000::3d5f =====

void __h3000
FUN_M7A_r3_00000__3d5f
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,PTR_ARRAY_M7A_r3_00000__3cf5);
                    /* WARNING: Could not recover jumptable at 0x3d68. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7A_r3_00000__3d77 @ M7A_r3_00000::3d77 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M7A_r3_00000__3d77(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_70ee = 0;
  DAT_70f2 = 0;
  DAT_70f6 = 0;
  DAT_7104 = 0;
  DAT_7108 = 0;
  DAT_710c = 0;
  DAT_7110 = 0;
  DAT_7114 = 0;
  DAT_7118 = 0;
  DAT_711c = 0;
  DAT_7120 = 0;
  DAT_7124 = 0;
  DAT_712a = 0;
  DAT_7130 = 0;
  DAT_7134 = 0;
  DAT_7138 = 0;
  DAT_713c = 0;
  DAT_7140 = 0;
  DAT_7144 = 0;
  DAT_7148 = 0;
  DAT_714c = 0;
  DAT_7150 = 0;
  _DAT_7154 = 0;
  DAT_7158 = 0;
  DAT_715e = 0;
  DAT_7164 = 0;
  DAT_7168 = 0;
  DAT_716c = 0;
  DAT_7170 = 0;
  DAT_7174 = 0;
  DAT_7178 = 0;
  DAT_717c = 0;
  DAT_7180 = 0;
  DAT_7184 = 0;
  DAT_7188 = 0;
  DAT_718c = 0;
  DAT_7190 = 0;
  DAT_7194 = 0;
  DAT_7198 = 0;
  DAT_719c = 0;
  DAT_71a0 = 0;
  DAT_71a4 = 0;
  DAT_71a8 = 0;
  DAT_71ac = 0;
  DAT_71b0 = 0;
  DAT_71b4 = 0;
  DAT_71b8 = 0;
  DAT_71bc = 0;
  DAT_71c0 = 0;
  DAT_71c4 = 0;
  DAT_71c8 = 0;
  DAT_71cc = 0;
  DAT_71d0 = 0;
  DAT_71d4 = 0;
  DAT_71d8 = 0;
  DAT_71dc = 0;
  DAT_71e0 = 0;
  DAT_71e4 = 0;
  DAT_71e8 = 0;
                    /* WARNING: Could not recover jumptable at 0x3e2d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7A_r3_00000__3e2f @ M7A_r3_00000::3e2f =====

void __h3000
FUN_M7A_r3_00000__3e2f
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7A_r3_00000__0fd9();
  FUN_M7A_r3_00000__131e();
  FUN_M7A_r3_00000__1441();
  FUN_M7A_r3_00000__17da();
  FUN_M7A_r3_00000__18bf();
  FUN_M7A_r3_00000__1976();
  FUN_M7A_r3_00000__1a1b();
  FUN_M7A_r3_00000__1ac7();
  FUN_M7A_r3_00000__1b72();
  FUN_M7A_r3_00000__1bfa();
  FUN_M7A_r3_00000__1cb0();
  FUN_M7A_r3_00000__1d67();
  FUN_M7A_r3_00000__1e1d();
  FUN_M7A_r3_00000__1edb();
  FUN_M7A_r3_00000__1f88();
  FUN_M7A_r3_00000__202f();
  FUN_M7A_r3_00000__20d6();
  FUN_M7A_r3_00000__217b();
  FUN_M7A_r3_00000__2244();
  FUN_M7A_r3_00000__2303();
  FUN_M7A_r3_00000__23aa();
  FUN_M7A_r3_00000__2462();
  FUN_M7A_r3_00000__2532();
  FUN_M7A_r3_00000__25f3();
  FUN_M7A_r3_00000__269c();
  FUN_M7A_r3_00000__273b();
  FUN_M7A_r3_00000__27da();
  FUN_M7A_r3_00000__28cc();
  FUN_M7A_r3_00000__2a40();
  FUN_M7A_r3_00000__2ad7();
  FUN_M7A_r3_00000__2bc2();
  FUN_M7A_r3_00000__2c55();
  FUN_M7A_r3_00000__2cfa();
  FUN_M7A_r3_00000__2d95();
  FUN_M7A_r3_00000__2e30();
  FUN_M7A_r3_00000__2ecb();
  FUN_M7A_r3_00000__304c();
  FUN_M7A_r3_00000__30df();
  FUN_M7A_r3_00000__3172();
  FUN_M7A_r3_00000__3211();
  FUN_M7A_r3_00000__32b0();
  FUN_M7A_r3_00000__3343();
  FUN_M7A_r3_00000__33d6();
  FUN_M7A_r3_00000__3469();
  FUN_M7A_r3_00000__3514();
  FUN_M7A_r3_00000__35ba();
  FUN_M7A_r3_00000__3660();
  FUN_M7A_r3_00000__3706();
  FUN_M7A_r3_00000__37ac();
  FUN_M7A_r3_00000__3852();
  FUN_M7A_r3_00000__38f8();
  FUN_M7A_r3_00000__399e();
  FUN_M7A_r3_00000__3a44();
  FUN_M7A_r3_00000__3aea();
  FUN_M7A_r3_00000__3d5f();
                    /* WARNING: Could not recover jumptable at 0x3ed6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


