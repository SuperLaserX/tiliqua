// H3500 - decompiled by Ghidra (6809, __h3000 convention)
// block M7B_r3_08000 M7B_r3_08000::0000-M7B_r3_08000::3fff, 382 functions
// Bank r3_08000 (module id 7B, sub 01)

// ===== MODULE_7B_01_entry @ M7B_r3_08000::0010 =====

undefined2 __h3000 MODULE_7B_01_entry(void)

{
  undefined2 uVar1;
  char cVar2;
  byte extraout_CC;
  
                    /* inline[API_FC60]: $0014 */
  uVar1 = ModuleSetBase();
  FUN_M7B_r3_08000__0305();
  FUN_M7B_r3_08000__3e95();
  FUN_M7B_r3_08000__04ba();
  API_FC58();
  DAT_60da = 3;
  API_FE38();
  FUN_M7B_r3_08000__0187();
  if ((DAT_70d2 == 0) || (DAT_600a != '{')) {
    FUN_a2f1();
    DAT_7218 = 1;
    FUN_M7B_r3_08000__01af();
    if (!(bool)(extraout_CC >> 2 & 1)) {
      LcdSetCursor();
                    /* inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR " */
      LcdPrintInline();
      return uVar1;
    }
  }
  FUN_M7B_r3_08000__3f46();
  FUN_M7B_r3_08000__04d7();
  if ((DAT_70d2 == 0) || (DAT_600a != '{')) {
    API_FD20(0x75);
  }
  API_FE36();
  API_FDF6();
  API_FE18();
  FUN_M7B_r3_08000__0205();
  FUN_M7B_r3_08000__1903();
  FUN_M7B_r3_08000__19a0();
  FUN_M7B_r3_08000__1ffe();
  FUN_M7B_r3_08000__20bb();
  cVar2 = (char)DAT_7000;
  if (cVar2 == '\0') {
LAB_M7B_r3_08000__010a:
    FUN_M7B_r3_08000__0a45();
LAB_M7B_r3_08000__0180:
    API_FE10();
  }
  else {
    if (cVar2 == '\x01') {
      FUN_M7B_r3_08000__0a7d();
    }
    else {
      if (cVar2 != '\x02') {
        if (cVar2 == '\x03') {
          FUN_M7B_r3_08000__0afb();
        }
        else if (cVar2 == '\x04') {
          FUN_M7B_r3_08000__0b3a();
        }
        else if (cVar2 == '\x05') {
          FUN_M7B_r3_08000__0b79();
        }
        else if (cVar2 == '\x06') {
          FUN_M7B_r3_08000__0bb8();
        }
        else if (cVar2 == '\a') {
          FUN_M7B_r3_08000__0be2();
        }
        else if (cVar2 == '\b') {
          FUN_M7B_r3_08000__0c21();
        }
        else if (cVar2 == '\t') {
          FUN_M7B_r3_08000__0c60();
        }
        else if (cVar2 == '\n') {
          FUN_M7B_r3_08000__0c98();
        }
        else if (cVar2 == '\v') {
          FUN_M7B_r3_08000__0cd7();
        }
        else if (cVar2 == '\r') {
          FUN_M7B_r3_08000__0d01();
        }
        else if (cVar2 == '\x0e') {
          FUN_M7B_r3_08000__0d40();
        }
        else if (cVar2 == '\x0f') {
          FUN_M7B_r3_08000__0d7f();
        }
        else if (cVar2 == '\x10') {
          FUN_M7B_r3_08000__0dbe();
        }
        else if (cVar2 == '\x11') {
          FUN_M7B_r3_08000__0df6();
        }
        else if (cVar2 == '\x12') {
          FUN_M7B_r3_08000__0e35();
        }
        else if (cVar2 == '\x14') {
          FUN_M7B_r3_08000__0e66();
        }
        else {
          if (cVar2 != '\x15') goto LAB_M7B_r3_08000__010a;
          FUN_M7B_r3_08000__0ea5();
        }
        goto LAB_M7B_r3_08000__0180;
      }
      FUN_M7B_r3_08000__0abc();
    }
    API_FDFC();
    LcdSetCursor();
    API_FC2A();
  }
  return uVar1;
}


// ===== FUN_M7B_r3_08000__0187 @ M7B_r3_08000::0187 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x01ad */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0187(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  code *pcVar1;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  pcVar1 = FUN_M7B_r3_08000__3e95 + g_moduleBase;
  API_FD08((char)((ushort)pcVar1 >> 8),(char)pcVar1,&DAT_M7B_r3_08000__3e90 + g_moduleBase,&LAB_6600
           ,pcVar1);
  API_FD76();
                    /* WARNING: Could not recover jumptable at 0x01ad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)pcVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__01af @ M7B_r3_08000::01af =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0203 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__01af(undefined2 param_1,undefined2 param_2,undefined2 param_3)

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
      (DspLoadProgram(uVar1,2,0x7a14), (extraout_CC_00 >> 2 & 1) != 0)) &&
     (DspLoadProgram(uVar1,3,0x7a15), (extraout_CC_01 >> 2 & 1) != 0)) {
    API_FD3C(0);
    API_FD40();
    API_FD44();
    API_FD20(0);
    API_FD2E((char)((ushort)DAT_70d6 >> 8));
    API_FD7C();
  }
                    /* WARNING: Could not recover jumptable at 0x0203. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0205 @ M7B_r3_08000::0205 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0303 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0205(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = API_FD3E();
  if (sVar1 == 0) {
    LcdSetCursor();
                    /* inline[API_FC38]: "NO SAMPLER          " */
    LcdPrintInline();
    DAT_70d4 = 0;
    DAT_7110 = 8000;
    DAT_7112 = 0x1fff;
    DAT_7116 = 0xaf;
    DAT_7114 = (undefined *)0x226;
  }
  else if (sVar1 == 1) {
    LcdSetCursor();
                    /* inline[API_FC38]: "HS322 BOARD, 23 SECS" */
    LcdPrintInline();
    DAT_70d4 = 1;
    DAT_7110 = 0x7c00;
    DAT_7112 = 0x7fff;
    DAT_7116 = 700;
    DAT_7114 = &UNK_M7B_r3_08000__2af8;
  }
  else if (sVar1 == 2) {
    LcdSetCursor();
                    /* inline[API_FC38]: "HS396 BOARD, 95 SECS" */
    LcdPrintInline();
    DAT_70d4 = 2;
    DAT_7110 = 0x7c00;
    DAT_7112 = 0x7fff;
    DAT_7116 = 700;
    DAT_7114 = (undefined *)0x7d00;
  }
  else {
    LcdSetCursor();
                    /* inline[API_FC38]: "MEMORY ERROR        " */
    LcdPrintInline();
    DAT_70d4 = 0;
  }
                    /* WARNING: Could not recover jumptable at 0x0303. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0305 @ M7B_r3_08000::0305 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0496 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0305(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC7C(1,0x27,0x127);
  DAT_7046 = (short)(char)in_D;
  DAT_7000 = API_FC7E(1,0x48,0x148);
                    /* inline[API_FE04]: 19:CA 1A:CC 1B:CE 1C:D0 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 61:0A 62:0C 7A:3C */
  LoadParamsSigned();
                    /* inline[API_FE04]: 6B:1E 6C:20 6D:22 6E:24 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 6F:26 70:28 72:2C 73:2E */
  LoadParamsSigned();
                    /* inline[API_FE04]: 71:2A 74:30 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 63:0E 64:10 65:12 66:14 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 67:16 68:18 69:1A 6A:1C */
  LoadParamsSigned();
                    /* inline[API_FE04]: 79:3A 7B:3E 7C:40 */
  LoadParamsSigned();
                    /* inline[API_FE04]: 75:32 76:34 77:36 78:38 */
  LoadParamsSigned();
                    /* inline[API_FE08]: 9B:64 9D:66 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 9F:7C A1:7E 7F:C4 81:C8 */
  LoadParamsScaled();
                    /* inline[API_FE08]: B8:84 87:86 */
  LoadParamsScaled();
                    /* inline[API_FE08]: BA:8E BC:8C */
  LoadParamsScaled();
                    /* inline[API_FE08]: A3:74 97:76 A5:78 99:7A */
  LoadParamsScaled();
                    /* inline[API_FE04]: B7:8A */
  LoadParamsSigned();
                    /* inline[API_FE08]: AF:68 B1:6A B3:48 B5:4A */
  LoadParamsScaled();
  DAT_7088 = API_FC7E(1,0x24,0x124);
                    /* inline[API_FE08]: AB:6C AD:6E A7:70 A9:72 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 93:44 */
  LoadParamsScaled();
                    /* inline[API_FE08]: 83:AC 85:B0 8B:B4 8D:B8 8F:BC 91:C0 */
  LoadParamsScaled();
  DAT_7080 = API_FC7E(0,0xfe,0xfe);
  sVar1 = API_FC7E(1,0,0x100);
  DAT_7082 = sVar1;
                    /* inline[at:M7B_r3_08000::0498]: 02:9A 04:9C 06:9E 08:A0 28:42 */
  FUN_M7B_r3_08000__0498();
                    /* inline[at:M7B_r3_08000::0498]: 2C:A2 2E:A6 30:AA 32:AE 34:B2 36:B6 38:BA
                       3A:BE 44:A4 46:A8 */
  FUN_M7B_r3_08000__0498();
                    /* inline[at:M7B_r3_08000::0498]: 0A:4C 0C:4E 16:58 18:5A 1E:5C 20:5E */
  FUN_M7B_r3_08000__0498();
                    /* inline[at:M7B_r3_08000::0498]: 0E:50 10:52 12:54 14:56 1A:60 1C:62 22:98 */
  FUN_M7B_r3_08000__0498();
                    /* inline[at:M7B_r3_08000::0498]: 3C:90 3E:92 40:94 42:96 4A:C2 4C:C6 */
  FUN_M7B_r3_08000__0498();
  API_FC7C(1,0x26,0x126);
  DAT_70d2 = (short)(char)sVar1;
                    /* WARNING: Could not recover jumptable at 0x0496. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0498 @ M7B_r3_08000::0498 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x04b8 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0498(undefined2 param_1,undefined2 param_2,undefined2 param_3)

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
                    /* WARNING: Could not recover jumptable at 0x04b8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar2,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__04ba @ M7B_r3_08000::04ba =====

void __h3000
FUN_M7B_r3_08000__04ba
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC6C(0,0);
  API_FC74();
  FUN_M7B_r3_08000__3ad0();
  FUN_M7B_r3_08000__3b4a();
  FUN_M7B_r3_08000__3bc4();
  FUN_M7B_r3_08000__3c3e();
  FUN_M7B_r3_08000__1448();
                    /* WARNING: Could not recover jumptable at 0x04d5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7B_r3_08000__04d7 @ M7B_r3_08000::04d7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0622 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__04d7(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
                    /* inline[API_FD84]: 00 80 "modknob " 21 $1310 $131C */
  DefineParameter();
                    /* inline[API_FD84]: 01 80 "dly1loop" 25 $25D1 $25DD */
  DefineParameter();
                    /* inline[API_FD84]: 02 80 "dly2loop" 29 $269C $26A8 */
  DefineParameter();
                    /* inline[API_FD84]: 03 80 "lfo freq" 2D $2A29 $2A35 */
  DefineParameter();
                    /* inline[API_FD84]: 04 80 "mscale 1" 31 $396F $397B */
  DefineParameter();
                    /* inline[API_FD84]: 05 80 "mscale 2" 35 $3A15 $3A21 */
  DefineParameter();
                    /* inline[API_FD84]: 06 80 "mix 1a  " 39 $343F $344B */
  DefineParameter();
                    /* inline[API_FD84]: 07 80 "mix 1b  " 3D $34E5 $34F1 */
  DefineParameter();
                    /* inline[API_FD84]: 08 80 "mix 2a  " 41 $358B $3597 */
  DefineParameter();
                    /* inline[API_FD84]: 09 80 "mix 2b  " 45 $3631 $363D */
  DefineParameter();
                    /* inline[API_FD84]: 0A 80 "mix 3a  " 49 $36D7 $36E3 */
  DefineParameter();
                    /* inline[API_FD84]: 0B 80 "mix 3b  " 4D $377D $3789 */
  DefineParameter();
                    /* inline[API_FD84]: 0C 80 "mix 4a  " 51 $3823 $382F */
  DefineParameter();
                    /* inline[API_FD84]: 0D 80 "mix 4b  " 55 $38C9 $38D5 */
  DefineParameter();
                    /* inline[API_FE78]: 0E 80 "  bpm   " 59 $14ED $0F33 */
  DefineParameterAlt();
                    /* inline[API_FD84]: 0F 80 " ratio  " 5D $313C $3148 */
  DefineParameter();
  _DAT_60f5 = &UNK_M7B_r3_08000__0624;
  _DAT_60f7 = 0xd9;
  DAT_6105 = 1;
  DAT_6106 = 0xbe;
                    /* WARNING: Could not recover jumptable at 0x0622. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0a00 @ M7B_r3_08000::0a00 =====

void __h3000 FUN_M7B_r3_08000__0a00(void)

{
                    /* inline[API_FE02]: " input  " " output " "prg load" " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$102A ->$0F42 ->$3C73 ->$0ABC ->$0A00 ->$0A00 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M7B_r3_08000__0a39 @ M7B_r3_08000::0a39 =====

void __h3000 FUN_M7B_r3_08000__0a39(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FC82();
                    /* WARNING: Could not recover jumptable at 0x0a43. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


// ===== FUN_M7B_r3_08000__0a45 @ M7B_r3_08000::0a45 =====

void __h3000 FUN_M7B_r3_08000__0a45(void)

{
                    /* inline[API_FE02]: "  bpm   " "  mix   " "modknob " [*] */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$15E6 ->$1403 ->$12E0 ->$0F33 ->$0A7D ->$0ABC */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0a7d @ M7B_r3_08000::0a7d =====

void __h3000 FUN_M7B_r3_08000__0a7d(void)

{
                    /* inline[API_FE02]: "detuners" " delays " "  lfo   " "envelope" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0AFB ->$0D01 ->$0DF6 ->$0C98 ->$0ABC ->$0A45 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0abc @ M7B_r3_08000::0abc =====

void __h3000 FUN_M7B_r3_08000__0abc(void)

{
                    /* inline[API_FE02]: " mixers " "ampmods " " levels " "patching" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0BE2 ->$0E66 ->$0ECF ->$0A00 ->$0A45 ->$0A7D */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0afb @ M7B_r3_08000::0afb =====

void __h3000 FUN_M7B_r3_08000__0afb(void)

{
                    /* inline[API_FE02]: "detune 1" "delay 1 " " bpm 1  " "modamt 1" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1763 ->$18F2 ->$1B11 ->$1C5F ->$0B3A ->$0BB8 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0b3a @ M7B_r3_08000::0b3a =====

void __h3000 FUN_M7B_r3_08000__0b3a(void)

{
                    /* inline[API_FE02]: "detune 2" "delay 2 " " bpm 2  " "modamt 2" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$181D ->$198F ->$1BB8 ->$1CEF ->$0B79 ->$0AFB */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0b79 @ M7B_r3_08000::0b79 =====

void __h3000 FUN_M7B_r3_08000__0b79(void)

{
                    /* inline[API_FE02]: "splice 1" "xfade 1 " "splice 2" "xfade 2 " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1E97 ->$1D7F ->$1F1E ->$1E0B ->$0BB8 ->$0B3A */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0bb8 @ M7B_r3_08000::0bb8 =====

void __h3000 FUN_M7B_r3_08000__0bb8(void)

{
                    /* inline[API_FE02]: [*] [*] [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F33 ->$0F33 ->$0F33 ->$0A7D ->$0AFB ->$0B79 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0be2 @ M7B_r3_08000::0be2 =====

void __h3000 FUN_M7B_r3_08000__0be2(void)

{
                    /* inline[API_FE02]: " mix1 a " " mix1 b " " mix2 a " " mix2 b " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$340F ->$34B5 ->$355B ->$3601 ->$0C21 ->$0C60 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0c21 @ M7B_r3_08000::0c21 =====

void __h3000 FUN_M7B_r3_08000__0c21(void)

{
                    /* inline[API_FE02]: " mix3 a " " mix3 b " " mix4 a " " mix4 b " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$36A7 ->$374D ->$37F3 ->$3899 ->$0C60 ->$0BE2 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0c60 @ M7B_r3_08000::0c60 =====

void __h3000 FUN_M7B_r3_08000__0c60(void)

{
                    /* inline[API_FE02]: "mscale 1" "mscale 2" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$393F ->$39E5 ->$0F33 ->$0ABC ->$0BE2 ->$0C21 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0c98 @ M7B_r3_08000::0c98 =====

void __h3000 FUN_M7B_r3_08000__0c98(void)

{
                    /* inline[API_FE02]: "env  att" "env  dec" " thresh " " ratio  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2E90 ->$3023 ->$3079 ->$310C ->$0CD7 ->$0CD7 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0cd7 @ M7B_r3_08000::0cd7 =====

void __h3000 FUN_M7B_r3_08000__0cd7(void)

{
                    /* inline[API_FE02]: [*] [*] [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F33 ->$0F33 ->$0F33 ->$0A7D ->$0C98 ->$0C98 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0d01 @ M7B_r3_08000::0d01 =====

void __h3000 FUN_M7B_r3_08000__0d01(void)

{
                    /* inline[API_FE02]: "delay 1 " "dly1 bpm" "delay 2 " "dly2 bpm" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$1FED ->$2122 ->$20AA ->$21C9 ->$0D40 ->$0DBE */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0d40 @ M7B_r3_08000::0d40 =====

void __h3000 FUN_M7B_r3_08000__0d40(void)

{
                    /* inline[API_FE02]: "delay1fb" "delay1 m" "delay2fb" "delay2 m" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2270 ->$272B ->$2311 ->$27E3 ->$0D7F ->$0D01 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0d7f @ M7B_r3_08000::0d7f =====

void __h3000 FUN_M7B_r3_08000__0d7f(void)

{
                    /* inline[API_FE02]: " loop 1 " " loop 2 " "highcut1" "highcut2" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$25A1 ->$266C ->$23B2 ->$243B ->$0DBE ->$0D40 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0dbe @ M7B_r3_08000::0dbe =====

void __h3000 FUN_M7B_r3_08000__0dbe(void)

{
                    /* inline[API_FE02]: "cutmod 1" "cutmod 2" [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$289B ->$294A ->$0F33 ->$0A7D ->$0D01 ->$0D7F */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0df6 @ M7B_r3_08000::0df6 =====

void __h3000 FUN_M7B_r3_08000__0df6(void)

{
                    /* inline[API_FE02]: "lfo freq" "lfo bpm " "lfo mod " "lfo wave" */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$29F9 ->$2ABA ->$2DB8 ->$2B59 ->$0E35 ->$0E35 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0e35 @ M7B_r3_08000::0e35 =====

void __h3000 FUN_M7B_r3_08000__0e35(void)

{
                    /* inline[API_FE02]: " thresh " [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$2CCD ->$0F33 ->$0F33 ->$0A7D ->$0DF6 ->$0DF6 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0e66 @ M7B_r3_08000::0e66 =====

void __h3000 FUN_M7B_r3_08000__0e66(void)

{
                    /* inline[API_FE02]: "am1 amt " "am1 ofs " "am2 amt " "am2 ofs " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$31C3 ->$32E9 ->$3256 ->$337C ->$0EA5 ->$0EA5 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0ea5 @ M7B_r3_08000::0ea5 =====

void __h3000 FUN_M7B_r3_08000__0ea5(void)

{
                    /* inline[API_FE02]: [*] [*] [*] " return " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$0F33 ->$0F33 ->$0F33 ->$0ABC ->$0E66 ->$0E66 */
  SetModuleHandlers();
  FUN_M7B_r3_08000__0a39(0);
  return;
}


// ===== FUN_M7B_r3_08000__0ecf @ M7B_r3_08000::0ecf =====

void __h3000 FUN_M7B_r3_08000__0ecf(void)

{
                    /* inline[API_FE02]: "left in " "right in" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3A8B ->$3B05 ->$0F33 ->$0ABC ->$0F01 ->$0F01 */
  SetModuleHandlers();
  return;
}


// ===== FUN_M7B_r3_08000__0f01 @ M7B_r3_08000::0f01 =====

void __h3000 FUN_M7B_r3_08000__0f01(void)

{
                    /* inline[API_FE02]: "left out" "rightout" [*] "return  " */
  SoftKeyLabels4Inline();
  API_FDF2();
                    /* inline[API_FE00]: ->$3B7F ->$3BF9 ->$0F33 ->$0ABC ->$0ECF ->$0ECF */
  SetModuleHandlers();
  return;
}


// ===== FUN_M7B_r3_08000__0f33 @ M7B_r3_08000::0f33 =====

void __h3000 FUN_M7B_r3_08000__0f33(void)

{
  return;
}


// ===== FUN_M7B_r3_08000__0f34 @ M7B_r3_08000::0f34 =====

void __h3000 FUN_M7B_r3_08000__0f34(undefined1 param_1,undefined1 param_2,undefined2 param_3)

{
  undefined1 uVar1;
  
  uVar1 = (undefined1)((ushort)param_3 >> 8);
  API_FD20(0);
  API_FD2E(uVar1);
  return;
}


// ===== FUN_M7B_r3_08000__0f42 @ M7B_r3_08000::0f42 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0f79 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0f42(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6074 = DAT_7008;
  API_FDFC();
  LcdSetCursor();
  API_FC2A();
                    /* inline[API_FC16]: 01 10 02 01 01 00 0B 80 $0015 $0000 $0000 ->$0FE6 ->$0F7B
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M7B_r3_08000__0fe6();
                    /* WARNING: Could not recover jumptable at 0x0f79. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0f7b @ M7B_r3_08000::0f7b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0faf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0f7b(undefined2 param_1,undefined2 param_2,undefined2 param_3)

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
  FUN_M7B_r3_08000__0fea();
  FUN_M7B_r3_08000__0fe6();
  API_FC80((char)((ushort)DAT_7008 >> 8));
                    /* WARNING: Could not recover jumptable at 0x0faf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0fb1 @ M7B_r3_08000::0fb1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x0fe4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0fb1(undefined2 param_1,undefined2 param_2,undefined2 param_3)

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
  FUN_M7B_r3_08000__0fea();
  FUN_M7B_r3_08000__0fe6();
  API_FC80((char)((ushort)DAT_7008 >> 8));
                    /* WARNING: Could not recover jumptable at 0x0fe4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__0fe6 @ M7B_r3_08000::0fe6 =====

void __h3000 FUN_M7B_r3_08000__0fe6(void)

{
  FUN_M7B_r3_08000__107d();
  return;
}


// ===== FUN_M7B_r3_08000__0fea @ M7B_r3_08000::0fea =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x100e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__0fea(undefined2 param_1,undefined2 param_2,undefined2 param_3)

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
  API_FD2E((char)((ushort)sVar1 >> 8),uVar3,sVar2,DAT_7006 + 0x3f2c);
                    /* WARNING: Could not recover jumptable at 0x100e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1010 @ M7B_r3_08000::1010 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1028 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1010(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7006 = 0;
  do {
    sVar1 = FUN_M7B_r3_08000__0fea();
    DAT_7006 = sVar1 + 1;
  } while (DAT_7006 < 0x1c);
  DAT_7006 = 0;
                    /* WARNING: Could not recover jumptable at 0x1028. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__102a @ M7B_r3_08000::102a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1061 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__102a(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_6074 = DAT_7006;
  API_FDFC();
  LcdSetCursor();
  API_FC2A();
                    /* inline[API_FC16]: 01 10 02 01 01 00 09 80 $001B $0000 $0000 ->$107D ->$1063
                       $0001 $0001 $0000 */
  SetupParamEditPage();
  FUN_M7B_r3_08000__1063();
                    /* WARNING: Could not recover jumptable at 0x1061. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1063 @ M7B_r3_08000::1063 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x107b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1063(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  char cVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_7006 = DAT_6074;
  cVar1 = (byte)DAT_6074 << 1;
  DAT_7008 = *(undefined2 *)
              ((short)&DAT_700a +
              CONCAT11((char)((ushort)DAT_6074 >> 8) << 1 | (byte)DAT_6074 >> 7,cVar1));
  FUN_M7B_r3_08000__10b5();
  FUN_M7B_r3_08000__107d();
                    /* WARNING: Could not recover jumptable at 0x107b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__107d @ M7B_r3_08000::107d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x10b3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__107d(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  short sVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor();
  API_FC3A((char)((ushort)(&UNK_M7B_r3_08000__10b6 + (DAT_7006 & 0xff) * 9 + g_moduleBase) >> 8),9,
           &UNK_M7B_r3_08000__10b6 + (DAT_7006 & 0xff) * 9 + g_moduleBase);
  LcdSetCursor();
  sVar1 = (DAT_7008 & 0xff) * 0xb;
  API_FC3A((char)((ushort)(&UNK_M7B_r3_08000__11b2 + sVar1 + g_moduleBase) >> 8),0xb,
           &UNK_M7B_r3_08000__11b2 + sVar1 + g_moduleBase);
                    /* WARNING: Could not recover jumptable at 0x10b3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__10b5 @ M7B_r3_08000::10b5 =====

void __h3000 FUN_M7B_r3_08000__10b5(void)

{
  return;
}


// ===== FUN_M7B_r3_08000__12e0 @ M7B_r3_08000::12e0 =====

void __h3000 FUN_M7B_r3_08000__12e0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$133D ->$1304 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba);
  return;
}


// ===== FUN_M7B_r3_08000__12ec @ M7B_r3_08000::12ec =====

void __h3000 FUN_M7B_r3_08000__12ec(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$133D ->$1304 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba);
  return;
}


// ===== FUN_M7B_r3_08000__12f8 @ M7B_r3_08000::12f8 =====

void __h3000 FUN_M7B_r3_08000__12f8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$133D ->$1304 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba);
  return;
}


// ===== FUN_M7B_r3_08000__1304 @ M7B_r3_08000::1304 =====

void __h3000 FUN_M7B_r3_08000__1304(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$133D ->$1304 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba);
  return;
}


// ===== FUN_M7B_r3_08000__1310 @ M7B_r3_08000::1310 =====

void __h3000 FUN_M7B_r3_08000__1310(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$133D ->$1304 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba);
  return;
}


// ===== FUN_M7B_r3_08000__131c @ M7B_r3_08000::131c =====

void __h3000 FUN_M7B_r3_08000__131c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$133D ->$1304 $12F8 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba);
  return;
}


// ===== FUN_M7B_r3_08000__133d @ M7B_r3_08000::133d =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x13db */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__133d(undefined2 param_1,undefined2 param_2,short param_3)

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
  if (DAT_7218 == '\0') {
    FUN_M7B_r3_08000__0f34(0,(char)in_D,1,0x3f4b);
    API_FD20(0);
    API_FD42();
    _DAT_7216 = (ushort)bVar1;
    bVar4 = bVar1;
    if (_DAT_7216 == 0) goto LAB_M7B_r3_08000__13db;
    uVar2 = FUN_M7B_r3_08000__0f34(0,bVar1,0,0x3f77);
    in_D = uVar2 & 0xff;
    FUN_M7B_r3_08000__0f34((char)(uVar2 >> 8),(char)uVar2,0,0);
  }
  else {
    DAT_7218 = '\0';
    DAT_7214 = 0;
    _DAT_7216 = 1;
  }
  uVar3 = DAT_70ec;
  *(char *)(sVar5 + -1) = (char)DAT_70ec;
  psVar6 = (short *)(sVar5 + -2);
  *(char *)psVar6 = (char)((ushort)uVar3 >> 8);
  FUN_c0ef();
  DAT_7212 = *psVar6;
  bVar4 = (byte)in_D;
  if (DAT_7212 - DAT_7214 != 0) {
    *psVar6 = DAT_7212 - DAT_7214;
    API_FCC8();
    uVar2 = _DAT_7216;
    *(char *)((short)psVar6 + -1) = (char)_DAT_7216;
    psVar6 = psVar6 + -1;
    *(char *)psVar6 = (char)(uVar2 >> 8);
    API_FCEA();
    DAT_70d6 = *psVar6;
    if (DAT_70d6 == 0) {
      DAT_70d6 = 1;
    }
    uVar3 = FUN_M7B_r3_08000__0f34
                      ((char)((ushort)DAT_70d6 >> 8),(char)DAT_70d6,DAT_7212,0x3f75,psVar6 + 1);
    FUN_M7B_r3_08000__0f34((char)((ushort)uVar3 >> 8),(byte)uVar3,DAT_70d6,0x3f76);
    DAT_7214 = DAT_7212;
    bVar4 = (byte)uVar3;
  }
LAB_M7B_r3_08000__13db:
                    /* WARNING: Could not recover jumptable at 0x13db. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(bVar1,bVar4,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1403 @ M7B_r3_08000::1403 =====

void __h3000 FUN_M7B_r3_08000__1403(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7B_r3_08000__1448_M7B_r3_08000__13dd);
  return;
}


// ===== FUN_M7B_r3_08000__140f @ M7B_r3_08000::140f =====

void __h3000 FUN_M7B_r3_08000__140f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$1448 ->$1427 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7B_r3_08000__1448_M7B_r3_08000__13dd);
  return;
}


// ===== FUN_M7B_r3_08000__141b @ M7B_r3_08000::141b =====

void __h3000 FUN_M7B_r3_08000__141b(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7B_r3_08000__1448_M7B_r3_08000__13dd);
  return;
}


// ===== FUN_M7B_r3_08000__1427 @ M7B_r3_08000::1427 =====

void __h3000 FUN_M7B_r3_08000__1427(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7B_r3_08000__1448_M7B_r3_08000__13dd);
  return;
}


// ===== FUN_M7B_r3_08000__1448 @ M7B_r3_08000::1448 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1474 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1448(undefined2 param_1,undefined2 param_2,short param_3)

{
  ushort uVar1;
  undefined2 in_D;
  char cVar2;
  short sVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = 100 - DAT_70f0;
  *(ushort *)(sVar3 + -2) = uVar1;
  cVar2 = (char)uVar1 << 1;
  DAT_70d6 = CONCAT11((char)(uVar1 >> 7),cVar2);
  *(undefined1 *)(sVar3 + -3) = 0x66;
  psVar4 = (short *)(sVar3 + -4);
  *(undefined1 *)psVar4 = 0x46;
  API_FCF2();
  API_FC6A((char)((ushort)(*psVar4 + DAT_70d6) >> 8));
  API_FC72();
                    /* WARNING: Could not recover jumptable at 0x1474. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),cVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__14b1 @ M7B_r3_08000::14b1 =====

void __h3000 FUN_M7B_r3_08000__14b1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$170B ->$14D5 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__170b_M7B_r3_08000__148b);
  return;
}


// ===== FUN_M7B_r3_08000__14bd @ M7B_r3_08000::14bd =====

void __h3000 FUN_M7B_r3_08000__14bd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$170B ->$14D5 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__170b_M7B_r3_08000__148b);
  return;
}


// ===== FUN_M7B_r3_08000__14c9 @ M7B_r3_08000::14c9 =====

void __h3000 FUN_M7B_r3_08000__14c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$170B ->$14D5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__170b_M7B_r3_08000__148b);
  return;
}


// ===== FUN_M7B_r3_08000__14d5 @ M7B_r3_08000::14d5 =====

void __h3000 FUN_M7B_r3_08000__14d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$170B ->$14D5 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__170b_M7B_r3_08000__148b);
  return;
}


// ===== FUN_M7B_r3_08000__14e1 @ M7B_r3_08000::14e1 =====

void __h3000 FUN_M7B_r3_08000__14e1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$170B ->$14D5 $14C9 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__170b_M7B_r3_08000__148b);
  return;
}


// ===== FUN_M7B_r3_08000__14ed @ M7B_r3_08000::14ed =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x15e4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__14ed(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  ushort uVar1;
  ushort in_D;
  code *pcVar2;
  undefined2 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = in_D >> 8;
  if (DAT_70fa != 0) {
    DAT_70fa = DAT_70fa + 1;
    goto LAB_M7B_r3_08000__15d6;
  }
  DAT_70fa = 1;
  pcVar2 = FUN_M7B_r3_08000__14d5 + g_moduleBase;
  if (pcVar2 == DAT_6070) {
    LcdSetCursor();
                    /* inline[API_FC38]: ".  " */
    pcVar2 = (code *)LcdPrintInline();
  }
  uVar3 = FUN_M7B_r3_08000__0f34((char)((ushort)pcVar2 >> 8),(char)pcVar2,0,0x3f4a);
  FUN_M7B_r3_08000__0f34((char)((ushort)uVar3 >> 8),(char)uVar3,0,0);
  do {
    API_FE2A();
    if (DAT_70fa == 2) {
      uVar3 = FUN_M7B_r3_08000__0f34(0,2,0,0x3f4a);
      FUN_M7B_r3_08000__0f34((char)((ushort)uVar3 >> 8),(char)uVar3,0,0);
      if (FUN_M7B_r3_08000__14d5 + g_moduleBase == DAT_6070) {
        LcdSetCursor();
                    /* inline[API_FC38]: ".. " */
        LcdPrintInline();
      }
      goto LAB_M7B_r3_08000__158b;
    }
    FUN_M7B_r3_08000__0f34((char)(DAT_70fa >> 8),(char)DAT_70fa,4,0x3f4b);
    API_FD20(0);
    in_D = API_FD42();
  } while ((short)in_D < 0x7fff);
  goto LAB_M7B_r3_08000__15d1;
  while( true ) {
    FUN_M7B_r3_08000__0f34((char)(DAT_70fa >> 8),(char)DAT_70fa,4,0x3f4b);
    API_FD20(0);
    DAT_70f8 = API_FD42();
    in_D = DAT_70f8;
    if (0x7ffe < (short)DAT_70f8) break;
LAB_M7B_r3_08000__158b:
    API_FE2A();
    if (DAT_70fa == 3) {
      FUN_M7B_r3_08000__16d2();
      if (FUN_M7B_r3_08000__14d5 + g_moduleBase == DAT_6070) {
        FUN_M7B_r3_08000__14b1();
      }
      FUN_M7B_r3_08000__170b();
      in_D = 3;
      break;
    }
  }
LAB_M7B_r3_08000__15d1:
  DAT_70fa = 0;
LAB_M7B_r3_08000__15d6:
  if (3 < (short)DAT_70fa) {
    DAT_70fa = 0;
  }
                    /* WARNING: Could not recover jumptable at 0x15e4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__15e6 @ M7B_r3_08000::15e6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1616 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__15e6(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  if (FUN_M7B_r3_08000__14d5 + g_moduleBase == DAT_6070) {
    DAT_70f6 = DAT_70f6 + 1;
    FUN_M7B_r3_08000__1618();
    FUN_M7B_r3_08000__170b();
  }
  else {
    DAT_70f6 = 0;
  }
  FUN_M7B_r3_08000__14b1();
                    /* WARNING: Could not recover jumptable at 0x1616. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1618 @ M7B_r3_08000::1618 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x16d0 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1618(undefined2 param_1,undefined2 param_2)

{
  undefined1 uVar1;
  undefined2 in_D;
  undefined2 uVar2;
  short sVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  LcdSetCursor();
                    /* inline[API_FC38]: ".  " */
  uVar2 = LcdPrintInline();
  uVar2 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar2 >> 8),(char)uVar2,0,0x3f4a);
  FUN_M7B_r3_08000__0f34((char)((ushort)uVar2 >> 8),(char)uVar2,0,0);
  do {
    API_FC1A();
  } while ((char)uVar2 != '\0');
  while( true ) {
    sVar3 = API_FC1A();
    uVar1 = (undefined1)((ushort)sVar3 >> 8);
    if ((char)sVar3 == '\x01') break;
    if ((char)sVar3 != '\0') goto LAB_M7B_r3_08000__16cc;
    FUN_M7B_r3_08000__0f34(uVar1,0,4,0x3f4b);
    API_FD20(0);
    sVar3 = API_FD42();
    if (0x7ffe < sVar3) goto LAB_M7B_r3_08000__16d0;
  }
  uVar2 = FUN_M7B_r3_08000__0f34(uVar1,1,0,0x3f4a);
  FUN_M7B_r3_08000__0f34((char)((ushort)uVar2 >> 8),(char)uVar2,0,0);
  LcdSetCursor();
                    /* inline[API_FC38]: ".. " */
  LcdPrintInline();
  do {
    API_FC1A();
  } while ((char)uVar2 != '\0');
  do {
    sVar3 = API_FC1A();
    if ((char)sVar3 == '\x01') {
      FUN_M7B_r3_08000__16d2();
      break;
    }
    if ((char)sVar3 != '\0') goto LAB_M7B_r3_08000__16cc;
    FUN_M7B_r3_08000__0f34((char)((ushort)sVar3 >> 8),0,4,0x3f4b);
    API_FD20(0);
    DAT_70f8 = API_FD42();
    sVar3 = DAT_70f8;
  } while (DAT_70f8 < 0x7fff);
LAB_M7B_r3_08000__16d0:
                    /* WARNING: Could not recover jumptable at 0x16d0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar3,param_1,param_2);
  return;
LAB_M7B_r3_08000__16cc:
  FUN_8fe4();
  goto LAB_M7B_r3_08000__16d0;
}


// ===== FUN_M7B_r3_08000__16d2 @ M7B_r3_08000::16d2 =====

void __h3000 FUN_M7B_r3_08000__16d2(void)

{
  undefined2 uVar1;
  char cVar2;
  short in_U;
  char *pcVar3;
  
  *(undefined1 *)(in_U + -1) = 0xc0;
  *(undefined1 *)(in_U + -2) = 0x50;
  cVar2 = (char)((ushort)DAT_70f8 >> 8);
  *(char *)(in_U + -3) =
       (char)((char)((char)((char)((char)DAT_70f8 >> 1 | cVar2 << 7) >> 1 | (cVar2 >> 1) << 7) >> 1
                    | (cVar2 >> 2) << 7) >> 1 | (cVar2 >> 3) << 7) >> 1 | (cVar2 >> 4) << 7;
  pcVar3 = (char *)(in_U + -4);
  *pcVar3 = cVar2 >> 5;
  API_FCEA();
  DAT_70d6 = *(undefined2 *)pcVar3;
  pcVar3[1] = '\x1e';
  *pcVar3 = '\0';
  pcVar3[-1] = -0x38;
  pcVar3[-2] = '\0';
  uVar1 = DAT_70d6;
  pcVar3[-3] = (char)DAT_70d6;
  pcVar3 = pcVar3 + -4;
  *pcVar3 = (char)((ushort)uVar1 >> 8);
  API_FCD8();
  DAT_7048 = *(undefined2 *)pcVar3;
  DAT_70fe = *(undefined2 *)pcVar3;
  return;
}


// ===== FUN_M7B_r3_08000__170b @ M7B_r3_08000::170b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x173b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__170b(undefined2 param_1,undefined2 param_2,short param_3)

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
  uVar1 = DAT_70fe;
  *(char *)(sVar2 + -3) = (char)DAT_70fe;
  puVar3 = (undefined2 *)(sVar2 + -4);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  DAT_70f2 = *puVar3;
  DAT_70f4 = puVar3[1];
  FUN_M7B_r3_08000__2167();
  FUN_M7B_r3_08000__220e();
  FUN_M7B_r3_08000__1b56();
  FUN_M7B_r3_08000__1bfd();
  FUN_M7B_r3_08000__2aff();
                    /* WARNING: Could not recover jumptable at 0x173b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1763 @ M7B_r3_08000::1763 =====

void __h3000 FUN_M7B_r3_08000__1763(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$17A8 ->$1787 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__17a8_M7B_r3_08000__173d);
  return;
}


// ===== FUN_M7B_r3_08000__176f @ M7B_r3_08000::176f =====

void __h3000 FUN_M7B_r3_08000__176f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$17A8 ->$1787 */
                    /* inline[API_FDBC]: "5.94...=" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__17a8_M7B_r3_08000__173d);
  return;
}


// ===== FUN_M7B_r3_08000__177b @ M7B_r3_08000::177b =====

void __h3000 FUN_M7B_r3_08000__177b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$17A8 ->$1787 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__17a8_M7B_r3_08000__173d);
  return;
}


// ===== FUN_M7B_r3_08000__1787 @ M7B_r3_08000::1787 =====

void __h3000 FUN_M7B_r3_08000__1787(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$17A8 ->$1787 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__17a8_M7B_r3_08000__173d);
  return;
}


// ===== FUN_M7B_r3_08000__17a8 @ M7B_r3_08000::17a8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x17cb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__17a8(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7102;
  *(char *)(sVar3 + -1) = (char)DAT_7102;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_M7B_r3_08000__17cd();
  DAT_711c = *puVar4;
  uVar2 = (undefined1)DAT_711c;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_711c >> 8),uVar2,DAT_711c,0x3f60,puVar4 + 1);
  FUN_M7B_r3_08000__19c1();
                    /* WARNING: Could not recover jumptable at 0x17cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__17cd @ M7B_r3_08000::17cd =====

void __h3000 FUN_M7B_r3_08000__17cd(void)

{
  char cVar1;
  short in_U;
  undefined1 *puVar2;
  short *psVar3;
  
  *(undefined1 *)(in_U + -1) = 100;
  puVar2 = (undefined1 *)(in_U + -2);
  *puVar2 = 0;
  API_FCE6();
  psVar3 = (short *)(puVar2 + -2);
  FUN_M7B_r3_08000__3cca();
  DAT_70d8 = *psVar3;
  DAT_70d6 = 1000 - DAT_70d8;
  cVar1 = (char)((ushort)DAT_70d6 >> 8);
  *psVar3 = CONCAT11(cVar1 >> 2,(char)((char)DAT_70d6 >> 1 | cVar1 << 7) >> 1 | (cVar1 >> 1) << 7) +
            DAT_70d6;
  FUN_c111();
  return;
}


// ===== FUN_M7B_r3_08000__181d @ M7B_r3_08000::181d =====

void __h3000 FUN_M7B_r3_08000__181d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1862 ->$1841 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1862_M7B_r3_08000__17f7);
  return;
}


// ===== FUN_M7B_r3_08000__1829 @ M7B_r3_08000::1829 =====

void __h3000 FUN_M7B_r3_08000__1829(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1862 ->$1841 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1862_M7B_r3_08000__17f7);
  return;
}


// ===== FUN_M7B_r3_08000__1835 @ M7B_r3_08000::1835 =====

void __h3000 FUN_M7B_r3_08000__1835(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1862 ->$1841 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1862_M7B_r3_08000__17f7);
  return;
}


// ===== FUN_M7B_r3_08000__1841 @ M7B_r3_08000::1841 =====

void __h3000 FUN_M7B_r3_08000__1841(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1862 ->$1841 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1862_M7B_r3_08000__17f7);
  return;
}


// ===== FUN_M7B_r3_08000__1862 @ M7B_r3_08000::1862 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1885 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1862(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7106;
  *(char *)(sVar3 + -1) = (char)DAT_7106;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_M7B_r3_08000__17cd();
  DAT_7132 = *puVar4;
  uVar2 = (undefined1)DAT_7132;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_7132 >> 8),uVar2,DAT_7132,0x3f66,puVar4 + 1);
  FUN_M7B_r3_08000__19f6();
                    /* WARNING: Could not recover jumptable at 0x1885. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__18ad @ M7B_r3_08000::18ad =====

void __h3000 FUN_M7B_r3_08000__18ad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1903 ->$18D1 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1903_M7B_r3_08000__1887);
  return;
}


// ===== FUN_M7B_r3_08000__18b9 @ M7B_r3_08000::18b9 =====

void __h3000 FUN_M7B_r3_08000__18b9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1903 ->$18D1 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1903_M7B_r3_08000__1887);
  return;
}


// ===== FUN_M7B_r3_08000__18c5 @ M7B_r3_08000::18c5 =====

void __h3000 FUN_M7B_r3_08000__18c5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1903 ->$18D1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1903_M7B_r3_08000__1887);
  return;
}


// ===== FUN_M7B_r3_08000__18d1 @ M7B_r3_08000::18d1 =====

void __h3000 FUN_M7B_r3_08000__18d1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1903 ->$18D1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1903_M7B_r3_08000__1887);
  return;
}


// ===== FUN_M7B_r3_08000__18f2 @ M7B_r3_08000::18f2 =====

void __h3000 FUN_M7B_r3_08000__18f2(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__18ad();
  DAT_606c = DAT_7116;
  API_FC14();
                    /* WARNING: Could not recover jumptable at 0x1901. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__1903 @ M7B_r3_08000::1903 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1922 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1903(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  uVar1 = DAT_7116;
  *(char *)(param_3 + -3) = (char)DAT_7116;
  *(char *)(param_3 + -4) = (char)((ushort)uVar1 >> 8);
  psVar2 = (short *)(param_3 + -6);
  *psVar2 = DAT_7050 + DAT_7108;
  API_FCD8();
  DAT_710a = *psVar2;
  FUN_M7B_r3_08000__19c1();
                    /* WARNING: Could not recover jumptable at 0x1922. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__194a @ M7B_r3_08000::194a =====

void __h3000 FUN_M7B_r3_08000__194a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$19A0 ->$196E */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__19a0_M7B_r3_08000__1924);
  return;
}


// ===== FUN_M7B_r3_08000__1956 @ M7B_r3_08000::1956 =====

void __h3000 FUN_M7B_r3_08000__1956(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$19A0 ->$196E */
                    /* inline[API_FDBC]: "5.94...$" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__19a0_M7B_r3_08000__1924);
  return;
}


// ===== FUN_M7B_r3_08000__1962 @ M7B_r3_08000::1962 =====

void __h3000 FUN_M7B_r3_08000__1962(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$19A0 ->$196E */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__19a0_M7B_r3_08000__1924);
  return;
}


// ===== FUN_M7B_r3_08000__196e @ M7B_r3_08000::196e =====

void __h3000 FUN_M7B_r3_08000__196e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$19A0 ->$196E */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__19a0_M7B_r3_08000__1924);
  return;
}


// ===== FUN_M7B_r3_08000__198f @ M7B_r3_08000::198f =====

void __h3000 FUN_M7B_r3_08000__198f(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__194a();
  DAT_606c = DAT_7116;
  API_FC14();
                    /* WARNING: Could not recover jumptable at 0x199e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__19a0 @ M7B_r3_08000::19a0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x19bf */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__19a0(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short *psVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  uVar1 = DAT_7116;
  *(char *)(param_3 + -3) = (char)DAT_7116;
  *(char *)(param_3 + -4) = (char)((ushort)uVar1 >> 8);
  psVar2 = (short *)(param_3 + -6);
  *psVar2 = DAT_7052 + DAT_710c;
  API_FCD8();
  DAT_710e = *psVar2;
  FUN_M7B_r3_08000__19f6();
                    /* WARNING: Could not recover jumptable at 0x19bf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__19c1 @ M7B_r3_08000::19c1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x19f4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__19c1(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_M7B_r3_08000__1a2b((char)((ushort)DAT_710a >> 8),(char)DAT_710a,&DAT_7118);
  uVar1 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_7118,0x3f61);
  uVar1 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_711a,0x3f62);
  uVar1 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_712c,0x3f64);
  FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_7128,0x3f63);
                    /* WARNING: Could not recover jumptable at 0x19f4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__19f6 @ M7B_r3_08000::19f6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1a29 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__19f6(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined2 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = FUN_M7B_r3_08000__1a2b((char)((ushort)DAT_710e >> 8),(char)DAT_710e,&DAT_712e);
  uVar1 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_712e,0x3f67);
  uVar1 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_7130,0x3f68);
  uVar1 = FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_7142,0x3f6a);
  FUN_M7B_r3_08000__0f34((char)((ushort)uVar1 >> 8),(char)uVar1,DAT_713e,0x3f69);
                    /* WARNING: Could not recover jumptable at 0x1a29. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1a2b @ M7B_r3_08000::1a2b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1a79 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1a2b(ushort *param_1,undefined2 param_2,short param_3)

{
  ushort uVar1;
  ushort uVar2;
  undefined2 in_D;
  ushort uVar3;
  byte in_CC;
  ushort *puVar4;
  ushort *puVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = (ushort)in_D >> 8;
  if ((in_CC >> 2 & 1) != 0) {
    in_D = 1;
  }
  *(char *)(param_3 + -1) = (char)in_D;
  puVar5 = (ushort *)(param_3 + -2);
  *(char *)puVar5 = (char)((ushort)in_D >> 8);
  puVar4 = param_1;
  FUN_c133();
  uVar3 = *puVar5;
  *puVar4 = uVar3;
  uVar3 = uVar3 + puVar4[9];
  puVar4[1] = uVar3;
  if (0 < (short)uVar3) {
    if ((short)uVar3 <= (short)DAT_7110) {
      puVar4[10] = puVar4[9];
      goto LAB_M7B_r3_08000__1a5d;
    }
  }
  puVar4[1] = DAT_7110;
  puVar4[10] = puVar4[1] - *puVar4;
LAB_M7B_r3_08000__1a5d:
  uVar3 = *puVar4;
  if (uVar3 < puVar4[10] == (uVar3 == puVar4[10])) {
    uVar3 = puVar4[10];
  }
  puVar4[5] = uVar3;
  uVar1 = DAT_7112 - puVar4[1];
  if (puVar4[5] <= uVar1 || (short)uVar1 < (short)puVar4[5]) {
    puVar4[5] = uVar1;
  }
  FUN_M7B_r3_08000__1a7b();
                    /* WARNING: Could not recover jumptable at 0x1a79. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar2,(char)uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1a7b @ M7B_r3_08000::1a7b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1ae9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1a7b(short param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  ushort uVar2;
  char cVar3;
  undefined2 in_D;
  byte bVar5;
  short sVar4;
  short sVar6;
  undefined1 *puVar7;
  byte *pbVar8;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = *(undefined2 *)(param_1 + 6);
  *(char *)(param_3 + -1) = (char)uVar1;
  puVar7 = (undefined1 *)(param_3 + -2);
  *puVar7 = (char)((ushort)uVar1 >> 8);
  sVar6 = param_1;
  API_FCC8();
  uVar1 = *(undefined2 *)(sVar6 + 4);
  puVar7[-1] = (char)uVar1;
  pbVar8 = puVar7 + -2;
  *pbVar8 = (byte)((ushort)uVar1 >> 8);
  API_FCC8();
  API_FCE2();
  *(undefined2 *)(sVar6 + 8) = *(undefined2 *)pbVar8;
  if (*(short *)(sVar6 + 8) == 0) {
    *(undefined2 *)(sVar6 + 0xc) = 0;
  }
  else {
    uVar2 = *(ushort *)(sVar6 + 8);
    cVar3 = (char)(uVar2 >> 8);
    bVar5 = (byte)uVar2;
    if (uVar2 < 0x400 == (uVar2 == 0x400)) {
      pbVar8[1] = bVar5 << 2;
      *pbVar8 = (cVar3 << 1 | bVar5 >> 7) << 1 | (bVar5 & 0x7f) >> 6;
      uVar1 = *(undefined2 *)(sVar6 + 10);
      pbVar8[-1] = (byte)uVar1;
      pbVar8 = pbVar8 + -2;
      *pbVar8 = (byte)((ushort)uVar1 >> 8);
      API_FCEA();
      bVar5 = (byte)*(undefined2 *)pbVar8;
      *(ushort *)(sVar6 + 0xc) =
           CONCAT11(((((char)((ushort)*(undefined2 *)pbVar8 >> 8) << 1 | bVar5 >> 7) << 1 |
                     (bVar5 & 0x7f) >> 6) << 1 | (bVar5 & 0x3f) >> 5) << 1 | (bVar5 & 0x1f) >> 4,
                    bVar5 << 4);
    }
    else {
      pbVar8[1] = bVar5 << 5;
      *pbVar8 = ((((cVar3 << 1 | bVar5 >> 7) << 1 | (bVar5 & 0x7f) >> 6) << 1 | (bVar5 & 0x3f) >> 5)
                 << 1 | (bVar5 & 0x1f) >> 4) << 1 | (bVar5 & 0xf) >> 3;
      uVar1 = *(undefined2 *)(sVar6 + 10);
      pbVar8[-1] = (byte)uVar1;
      pbVar8 = pbVar8 + -2;
      *pbVar8 = (byte)((ushort)uVar1 >> 8);
      API_FCEA();
      bVar5 = (byte)*(undefined2 *)pbVar8;
      *(ushort *)(sVar6 + 0xc) =
           CONCAT11((char)((ushort)*(undefined2 *)pbVar8 >> 8) << 1 | bVar5 >> 7,bVar5 << 1);
    }
  }
  sVar4 = *(short *)(sVar6 + 0xe);
  if (sVar4 < *(short *)(sVar6 + 0xc)) {
    sVar4 = *(short *)(sVar6 + 0xc);
  }
  *(short *)(sVar6 + 0x10) = sVar4;
                    /* WARNING: Could not recover jumptable at 0x1ae9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)sVar4,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1b11 @ M7B_r3_08000::1b11 =====

void __h3000 FUN_M7B_r3_08000__1b11(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1B56 ->$1B35 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1b56_M7B_r3_08000__1aeb);
  return;
}


// ===== FUN_M7B_r3_08000__1b1d @ M7B_r3_08000::1b1d =====

void __h3000 FUN_M7B_r3_08000__1b1d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1B56 ->$1B35 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1b56_M7B_r3_08000__1aeb);
  return;
}


// ===== FUN_M7B_r3_08000__1b29 @ M7B_r3_08000::1b29 =====

void __h3000 FUN_M7B_r3_08000__1b29(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1B56 ->$1B35 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1b56_M7B_r3_08000__1aeb);
  return;
}


// ===== FUN_M7B_r3_08000__1b35 @ M7B_r3_08000::1b35 =====

void __h3000 FUN_M7B_r3_08000__1b35(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1B56 ->$1B35 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1b56_M7B_r3_08000__1aeb);
  return;
}


// ===== FUN_M7B_r3_08000__1b56 @ M7B_r3_08000::1b56 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1b90 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1b56(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70f4;
  *(char *)(sVar2 + -1) = (char)DAT_70f4;
  *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7146;
  *(char *)(sVar2 + -3) = (char)DAT_7146;
  puVar3 = (undefined1 *)(sVar2 + -4);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  uVar1 = DAT_70fe;
  puVar3[-1] = (char)DAT_70fe;
  puVar3 = puVar3 + -2;
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  uVar1 = DAT_70f2;
  puVar3[-1] = (char)DAT_70f2;
  puVar3[-2] = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7146;
  puVar3[-3] = (char)DAT_7146;
  puVar4 = (undefined2 *)(puVar3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  API_FCE2();
  DAT_7108 = *puVar4;
  FUN_M7B_r3_08000__1903();
                    /* WARNING: Could not recover jumptable at 0x1b90. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1bb8 @ M7B_r3_08000::1bb8 =====

void __h3000 FUN_M7B_r3_08000__1bb8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1BFD ->$1BDC */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1bfd_M7B_r3_08000__1b92);
  return;
}


// ===== FUN_M7B_r3_08000__1bc4 @ M7B_r3_08000::1bc4 =====

void __h3000 FUN_M7B_r3_08000__1bc4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1BFD ->$1BDC */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1bfd_M7B_r3_08000__1b92);
  return;
}


// ===== FUN_M7B_r3_08000__1bd0 @ M7B_r3_08000::1bd0 =====

void __h3000 FUN_M7B_r3_08000__1bd0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1BFD ->$1BDC */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1bfd_M7B_r3_08000__1b92);
  return;
}


// ===== FUN_M7B_r3_08000__1bdc @ M7B_r3_08000::1bdc =====

void __h3000 FUN_M7B_r3_08000__1bdc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1BFD ->$1BDC */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1bfd_M7B_r3_08000__1b92);
  return;
}


// ===== FUN_M7B_r3_08000__1bfd @ M7B_r3_08000::1bfd =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1c37 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1bfd(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70f4;
  *(char *)(sVar2 + -1) = (char)DAT_70f4;
  *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_714a;
  *(char *)(sVar2 + -3) = (char)DAT_714a;
  puVar3 = (undefined1 *)(sVar2 + -4);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  uVar1 = DAT_70fe;
  puVar3[-1] = (char)DAT_70fe;
  puVar3 = puVar3 + -2;
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  uVar1 = DAT_70f2;
  puVar3[-1] = (char)DAT_70f2;
  puVar3[-2] = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_714a;
  puVar3[-3] = (char)DAT_714a;
  puVar4 = (undefined2 *)(puVar3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  API_FCE2();
  DAT_710c = *puVar4;
  FUN_M7B_r3_08000__19a0();
                    /* WARNING: Could not recover jumptable at 0x1c37. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1c5f @ M7B_r3_08000::1c5f =====

void __h3000 FUN_M7B_r3_08000__1c5f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1CA4 ->$1C83 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ca4_M7B_r3_08000__1c39);
  return;
}


// ===== FUN_M7B_r3_08000__1c6b @ M7B_r3_08000::1c6b =====

void __h3000 FUN_M7B_r3_08000__1c6b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1CA4 ->$1C83 */
                    /* inline[API_FDBC]: "5.94...9" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ca4_M7B_r3_08000__1c39);
  return;
}


// ===== FUN_M7B_r3_08000__1c77 @ M7B_r3_08000::1c77 =====

void __h3000 FUN_M7B_r3_08000__1c77(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1CA4 ->$1C83 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ca4_M7B_r3_08000__1c39);
  return;
}


// ===== FUN_M7B_r3_08000__1c83 @ M7B_r3_08000::1c83 =====

void __h3000 FUN_M7B_r3_08000__1c83(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1CA4 ->$1C83 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ca4_M7B_r3_08000__1c39);
  return;
}


// ===== FUN_M7B_r3_08000__1ca4 @ M7B_r3_08000::1ca4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1cc7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1ca4(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_714e;
  *(char *)(sVar3 + -1) = (char)DAT_714e;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_M7B_r3_08000__17cd();
  DAT_711e = *puVar4;
  uVar2 = (undefined1)DAT_711e;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_711e >> 8),uVar2,DAT_711e,0x3f65,puVar4 + 1);
  FUN_M7B_r3_08000__19c1();
                    /* WARNING: Could not recover jumptable at 0x1cc7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1cef @ M7B_r3_08000::1cef =====

void __h3000 FUN_M7B_r3_08000__1cef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1D34 ->$1D13 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1d34_M7B_r3_08000__1cc9);
  return;
}


// ===== FUN_M7B_r3_08000__1cfb @ M7B_r3_08000::1cfb =====

void __h3000 FUN_M7B_r3_08000__1cfb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1D34 ->$1D13 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1d34_M7B_r3_08000__1cc9);
  return;
}


// ===== FUN_M7B_r3_08000__1d07 @ M7B_r3_08000::1d07 =====

void __h3000 FUN_M7B_r3_08000__1d07(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1D34 ->$1D13 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1d34_M7B_r3_08000__1cc9);
  return;
}


// ===== FUN_M7B_r3_08000__1d13 @ M7B_r3_08000::1d13 =====

void __h3000 FUN_M7B_r3_08000__1d13(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1D34 ->$1D13 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1d34_M7B_r3_08000__1cc9);
  return;
}


// ===== FUN_M7B_r3_08000__1d34 @ M7B_r3_08000::1d34 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1d57 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1d34(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_7152;
  *(char *)(sVar3 + -1) = (char)DAT_7152;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_M7B_r3_08000__17cd();
  DAT_7134 = *puVar4;
  uVar2 = (undefined1)DAT_7134;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_7134 >> 8),uVar2,DAT_7134,0x3f6b,puVar4 + 1);
  FUN_M7B_r3_08000__19f6();
                    /* WARNING: Could not recover jumptable at 0x1d57. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1d7f @ M7B_r3_08000::1d7f =====

void __h3000 FUN_M7B_r3_08000__1d7f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1DC4 ->$1DA3 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1dc4_M7B_r3_08000__1d59);
  return;
}


// ===== FUN_M7B_r3_08000__1d8b @ M7B_r3_08000::1d8b =====

void __h3000 FUN_M7B_r3_08000__1d8b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1DC4 ->$1DA3 */
                    /* inline[API_FDBC]: "5.94...Y" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1dc4_M7B_r3_08000__1d59);
  return;
}


// ===== FUN_M7B_r3_08000__1d97 @ M7B_r3_08000::1d97 =====

void __h3000 FUN_M7B_r3_08000__1d97(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1DC4 ->$1DA3 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1dc4_M7B_r3_08000__1d59);
  return;
}


// ===== FUN_M7B_r3_08000__1da3 @ M7B_r3_08000::1da3 =====

void __h3000 FUN_M7B_r3_08000__1da3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1DC4 ->$1DA3 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1dc4_M7B_r3_08000__1d59);
  return;
}


// ===== FUN_M7B_r3_08000__1dc4 @ M7B_r3_08000::1dc4 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1de3 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1dc4(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  *(undefined1 *)(sVar2 + -1) = 0x9c;
  *(undefined1 *)(sVar2 + -2) = 0xb;
  uVar1 = DAT_7156;
  *(char *)(sVar2 + -3) = (char)DAT_7156;
  puVar3 = (undefined2 *)(sVar2 + -4);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  DAT_7126 = *puVar3;
  FUN_M7B_r3_08000__19c1();
                    /* WARNING: Could not recover jumptable at 0x1de3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1e0b @ M7B_r3_08000::1e0b =====

void __h3000 FUN_M7B_r3_08000__1e0b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1E50 ->$1E2F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1e50_M7B_r3_08000__1de5);
  return;
}


// ===== FUN_M7B_r3_08000__1e17 @ M7B_r3_08000::1e17 =====

void __h3000 FUN_M7B_r3_08000__1e17(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1E50 ->$1E2F */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1e50_M7B_r3_08000__1de5);
  return;
}


// ===== FUN_M7B_r3_08000__1e23 @ M7B_r3_08000::1e23 =====

void __h3000 FUN_M7B_r3_08000__1e23(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1E50 ->$1E2F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1e50_M7B_r3_08000__1de5);
  return;
}


// ===== FUN_M7B_r3_08000__1e2f @ M7B_r3_08000::1e2f =====

void __h3000 FUN_M7B_r3_08000__1e2f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1E50 ->$1E2F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1e50_M7B_r3_08000__1de5);
  return;
}


// ===== FUN_M7B_r3_08000__1e50 @ M7B_r3_08000::1e50 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1e6f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1e50(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  *(undefined1 *)(sVar2 + -1) = 0x9c;
  *(undefined1 *)(sVar2 + -2) = 0xb;
  uVar1 = DAT_715a;
  *(char *)(sVar2 + -3) = (char)DAT_715a;
  puVar3 = (undefined2 *)(sVar2 + -4);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  DAT_713c = *puVar3;
  FUN_M7B_r3_08000__19f6();
                    /* WARNING: Could not recover jumptable at 0x1e6f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1e97 @ M7B_r3_08000::1e97 =====

void __h3000 FUN_M7B_r3_08000__1e97(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1EDC ->$1EBB */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1edc_M7B_r3_08000__1e71);
  return;
}


// ===== FUN_M7B_r3_08000__1ea3 @ M7B_r3_08000::1ea3 =====

void __h3000 FUN_M7B_r3_08000__1ea3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1EDC ->$1EBB */
                    /* inline[API_FDBC]: "5.94...q" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1edc_M7B_r3_08000__1e71);
  return;
}


// ===== FUN_M7B_r3_08000__1eaf @ M7B_r3_08000::1eaf =====

void __h3000 FUN_M7B_r3_08000__1eaf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1EDC ->$1EBB */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1edc_M7B_r3_08000__1e71);
  return;
}


// ===== FUN_M7B_r3_08000__1ebb @ M7B_r3_08000::1ebb =====

void __h3000 FUN_M7B_r3_08000__1ebb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1EDC ->$1EBB */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1edc_M7B_r3_08000__1e71);
  return;
}


// ===== FUN_M7B_r3_08000__1edc @ M7B_r3_08000::1edc =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1ef6 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1edc(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_715e;
  *(char *)(sVar2 + -1) = (char)DAT_715e;
  puVar3 = (undefined2 *)(sVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c133();
  DAT_712a = *puVar3;
  FUN_M7B_r3_08000__19c1();
                    /* WARNING: Could not recover jumptable at 0x1ef6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1f1e @ M7B_r3_08000::1f1e =====

void __h3000 FUN_M7B_r3_08000__1f1e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1F63 ->$1F42 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1f63_M7B_r3_08000__1ef8);
  return;
}


// ===== FUN_M7B_r3_08000__1f2a @ M7B_r3_08000::1f2a =====

void __h3000 FUN_M7B_r3_08000__1f2a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1F63 ->$1F42 */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1f63_M7B_r3_08000__1ef8);
  return;
}


// ===== FUN_M7B_r3_08000__1f36 @ M7B_r3_08000::1f36 =====

void __h3000 FUN_M7B_r3_08000__1f36(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1F63 ->$1F42 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1f63_M7B_r3_08000__1ef8);
  return;
}


// ===== FUN_M7B_r3_08000__1f42 @ M7B_r3_08000::1f42 =====

void __h3000 FUN_M7B_r3_08000__1f42(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1F63 ->$1F42 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1f63_M7B_r3_08000__1ef8);
  return;
}


// ===== FUN_M7B_r3_08000__1f63 @ M7B_r3_08000::1f63 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x1f80 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1f63(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined2 *puVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_7162;
  *(char *)(sVar2 + -1) = (char)DAT_7162;
  puVar3 = (undefined2 *)(sVar2 + -2);
  *(char *)puVar3 = (char)((ushort)uVar1 >> 8);
  FUN_c133();
  DAT_7140 = *puVar3;
  FUN_M7B_r3_08000__19a0();
  FUN_M7B_r3_08000__19f6();
                    /* WARNING: Could not recover jumptable at 0x1f80. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__1fa8 @ M7B_r3_08000::1fa8 =====

void __h3000 FUN_M7B_r3_08000__1fa8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$1FFE ->$1FCC */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ffe_M7B_r3_08000__1f82);
  return;
}


// ===== FUN_M7B_r3_08000__1fb4 @ M7B_r3_08000::1fb4 =====

void __h3000 FUN_M7B_r3_08000__1fb4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$1FFE ->$1FCC */
                    /* inline[API_FDBC]: "5.94...." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ffe_M7B_r3_08000__1f82);
  return;
}


// ===== FUN_M7B_r3_08000__1fc0 @ M7B_r3_08000::1fc0 =====

void __h3000 FUN_M7B_r3_08000__1fc0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$1FFE ->$1FCC */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ffe_M7B_r3_08000__1f82);
  return;
}


// ===== FUN_M7B_r3_08000__1fcc @ M7B_r3_08000::1fcc =====

void __h3000 FUN_M7B_r3_08000__1fcc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$1FFE ->$1FCC */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__1ffe_M7B_r3_08000__1f82);
  return;
}


// ===== FUN_M7B_r3_08000__1fed @ M7B_r3_08000::1fed =====

void __h3000 FUN_M7B_r3_08000__1fed(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__1fa8();
  DAT_606c = DAT_7114;
  API_FC14();
                    /* WARNING: Could not recover jumptable at 0x1ffc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__1ffe @ M7B_r3_08000::1ffe =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x203d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__1ffe(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  uVar2 = DAT_7114;
  *(char *)(param_3 + -3) = (char)DAT_7114;
  *(char *)(param_3 + -4) = (char)((ushort)uVar2 >> 8);
  psVar4 = (short *)(param_3 + -6);
  *psVar4 = DAT_7064 + DAT_7166;
  API_FCD8();
  sVar1 = *psVar4;
  DAT_7168 = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x33;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x58;
  API_FCF2();
  DAT_70d6 = *psVar4;
  uVar3 = (undefined1)DAT_70d6;
  DAT_7164 = DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar3,DAT_70d6,0x3f58,psVar4 + 1);
  FUN_M7B_r3_08000__2770();
                    /* WARNING: Could not recover jumptable at 0x203d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2065 @ M7B_r3_08000::2065 =====

void __h3000 FUN_M7B_r3_08000__2065(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$20BB ->$2089 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__20bb_M7B_r3_08000__203f);
  return;
}


// ===== FUN_M7B_r3_08000__2071 @ M7B_r3_08000::2071 =====

void __h3000 FUN_M7B_r3_08000__2071(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$20BB ->$2089 */
                    /* inline[API_FDBC]: "5.94.. ?" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__20bb_M7B_r3_08000__203f);
  return;
}


// ===== FUN_M7B_r3_08000__207d @ M7B_r3_08000::207d =====

void __h3000 FUN_M7B_r3_08000__207d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$20BB ->$2089 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__20bb_M7B_r3_08000__203f);
  return;
}


// ===== FUN_M7B_r3_08000__2089 @ M7B_r3_08000::2089 =====

void __h3000 FUN_M7B_r3_08000__2089(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$20BB ->$2089 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__20bb_M7B_r3_08000__203f);
  return;
}


// ===== FUN_M7B_r3_08000__20aa @ M7B_r3_08000::20aa =====

void __h3000 FUN_M7B_r3_08000__20aa(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__2065();
  DAT_606c = DAT_7114;
  API_FC14();
                    /* WARNING: Could not recover jumptable at 0x20b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__20bb @ M7B_r3_08000::20bb =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x20fa */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__20bb(undefined2 param_1,undefined2 param_2,short param_3)

{
  short sVar1;
  undefined2 uVar2;
  undefined2 in_D;
  undefined1 uVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined1 *)(param_3 + -1) = 0;
  *(undefined1 *)(param_3 + -2) = 0;
  uVar2 = DAT_7114;
  *(char *)(param_3 + -3) = (char)DAT_7114;
  *(char *)(param_3 + -4) = (char)((ushort)uVar2 >> 8);
  psVar4 = (short *)(param_3 + -6);
  *psVar4 = DAT_7066 + DAT_716c;
  API_FCD8();
  sVar1 = *psVar4;
  DAT_716e = sVar1;
  *(char *)((short)psVar4 + 1) = (char)sVar1;
  *(char *)psVar4 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar4 + -1) = 0x33;
  psVar4 = psVar4 + -1;
  *(undefined1 *)psVar4 = 0x58;
  API_FCF2();
  DAT_70d6 = *psVar4;
  uVar3 = (undefined1)DAT_70d6;
  DAT_716a = DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar3,DAT_70d6,0x3f5c,psVar4 + 1);
  FUN_M7B_r3_08000__2828();
                    /* WARNING: Could not recover jumptable at 0x20fa. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar3,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2122 @ M7B_r3_08000::2122 =====

void __h3000 FUN_M7B_r3_08000__2122(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2167 ->$2146 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2167_M7B_r3_08000__20fc);
  return;
}


// ===== FUN_M7B_r3_08000__212e @ M7B_r3_08000::212e =====

void __h3000 FUN_M7B_r3_08000__212e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2167 ->$2146 */
                    /* inline[API_FDBC]: "5.94.. ." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2167_M7B_r3_08000__20fc);
  return;
}


// ===== FUN_M7B_r3_08000__213a @ M7B_r3_08000::213a =====

void __h3000 FUN_M7B_r3_08000__213a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2167 ->$2146 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2167_M7B_r3_08000__20fc);
  return;
}


// ===== FUN_M7B_r3_08000__2146 @ M7B_r3_08000::2146 =====

void __h3000 FUN_M7B_r3_08000__2146(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2167 ->$2146 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2167_M7B_r3_08000__20fc);
  return;
}


// ===== FUN_M7B_r3_08000__2167 @ M7B_r3_08000::2167 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x21a1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2167(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70f4;
  *(char *)(sVar2 + -1) = (char)DAT_70f4;
  *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7172;
  *(char *)(sVar2 + -3) = (char)DAT_7172;
  puVar3 = (undefined1 *)(sVar2 + -4);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  uVar1 = DAT_70fe;
  puVar3[-1] = (char)DAT_70fe;
  puVar3 = puVar3 + -2;
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  uVar1 = DAT_70f2;
  puVar3[-1] = (char)DAT_70f2;
  puVar3[-2] = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7172;
  puVar3[-3] = (char)DAT_7172;
  puVar4 = (undefined2 *)(puVar3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  API_FCE2();
  DAT_7166 = *puVar4;
  FUN_M7B_r3_08000__1ffe();
                    /* WARNING: Could not recover jumptable at 0x21a1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__21c9 @ M7B_r3_08000::21c9 =====

void __h3000 FUN_M7B_r3_08000__21c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$220E ->$21ED */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__220e_M7B_r3_08000__21a3);
  return;
}


// ===== FUN_M7B_r3_08000__21d5 @ M7B_r3_08000::21d5 =====

void __h3000 FUN_M7B_r3_08000__21d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$220E ->$21ED */
                    /* inline[API_FDBC]: "5.94..!." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__220e_M7B_r3_08000__21a3);
  return;
}


// ===== FUN_M7B_r3_08000__21e1 @ M7B_r3_08000::21e1 =====

void __h3000 FUN_M7B_r3_08000__21e1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$220E ->$21ED */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__220e_M7B_r3_08000__21a3);
  return;
}


// ===== FUN_M7B_r3_08000__21ed @ M7B_r3_08000::21ed =====

void __h3000 FUN_M7B_r3_08000__21ed(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$220E ->$21ED */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__220e_M7B_r3_08000__21a3);
  return;
}


// ===== FUN_M7B_r3_08000__220e @ M7B_r3_08000::220e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2248 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__220e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70f4;
  *(char *)(sVar2 + -1) = (char)DAT_70f4;
  *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7176;
  *(char *)(sVar2 + -3) = (char)DAT_7176;
  puVar3 = (undefined1 *)(sVar2 + -4);
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  uVar1 = DAT_70fe;
  puVar3[-1] = (char)DAT_70fe;
  puVar3 = puVar3 + -2;
  *puVar3 = (char)((ushort)uVar1 >> 8);
  API_FCEA();
  uVar1 = DAT_70f2;
  puVar3[-1] = (char)DAT_70f2;
  puVar3[-2] = (char)((ushort)uVar1 >> 8);
  uVar1 = DAT_7176;
  puVar3[-3] = (char)DAT_7176;
  puVar4 = (undefined2 *)(puVar3 + -4);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCEE();
  API_FCE2();
  DAT_716c = *puVar4;
  FUN_M7B_r3_08000__20bb();
                    /* WARNING: Could not recover jumptable at 0x2248. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2270 @ M7B_r3_08000::2270 =====

void __h3000 FUN_M7B_r3_08000__2270(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$22B5 ->$2294 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__22b5_M7B_r3_08000__224a);
  return;
}


// ===== FUN_M7B_r3_08000__227c @ M7B_r3_08000::227c =====

void __h3000 FUN_M7B_r3_08000__227c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$22B5 ->$2294 */
                    /* inline[API_FDBC]: "5.94.."J" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__22b5_M7B_r3_08000__224a);
  return;
}


// ===== FUN_M7B_r3_08000__2288 @ M7B_r3_08000::2288 =====

void __h3000 FUN_M7B_r3_08000__2288(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$22B5 ->$2294 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__22b5_M7B_r3_08000__224a);
  return;
}


// ===== FUN_M7B_r3_08000__2294 @ M7B_r3_08000::2294 =====

void __h3000 FUN_M7B_r3_08000__2294(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$22B5 ->$2294 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__22b5_M7B_r3_08000__224a);
  return;
}


// ===== FUN_M7B_r3_08000__22b5 @ M7B_r3_08000::22b5 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x22e9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__22b5(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_717a;
  *(char *)(sVar3 + -1) = (char)DAT_717a;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)((ushort)DAT_718a >> 8);
  if ((char)DAT_718a == '\x01') {
    FUN_M7B_r3_08000__0f34(uVar2,1,0x8000,0x3f5a,puVar4 + 1);
  }
  else {
    FUN_M7B_r3_08000__0f34(uVar2,(char)DAT_718a,DAT_70d6,0x3f5a,puVar4 + 1);
  }
                    /* WARNING: Could not recover jumptable at 0x22e9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2311 @ M7B_r3_08000::2311 =====

void __h3000 FUN_M7B_r3_08000__2311(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2356 ->$2335 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2356_M7B_r3_08000__22eb);
  return;
}


// ===== FUN_M7B_r3_08000__231d @ M7B_r3_08000::231d =====

void __h3000 FUN_M7B_r3_08000__231d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2356 ->$2335 */
                    /* inline[API_FDBC]: "5.94.."." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2356_M7B_r3_08000__22eb);
  return;
}


// ===== FUN_M7B_r3_08000__2329 @ M7B_r3_08000::2329 =====

void __h3000 FUN_M7B_r3_08000__2329(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2356 ->$2335 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2356_M7B_r3_08000__22eb);
  return;
}


// ===== FUN_M7B_r3_08000__2335 @ M7B_r3_08000::2335 =====

void __h3000 FUN_M7B_r3_08000__2335(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2356 ->$2335 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2356_M7B_r3_08000__22eb);
  return;
}


// ===== FUN_M7B_r3_08000__2356 @ M7B_r3_08000::2356 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x238a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2356(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_717e;
  *(char *)(sVar3 + -1) = (char)DAT_717e;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)((ushort)DAT_718e >> 8);
  if ((char)DAT_718e == '\x01') {
    FUN_M7B_r3_08000__0f34(uVar2,1,0x8000,0x3f5e,puVar4 + 1);
  }
  else {
    FUN_M7B_r3_08000__0f34(uVar2,(char)DAT_718e,DAT_70d6,0x3f5e,puVar4 + 1);
  }
                    /* WARNING: Could not recover jumptable at 0x238a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__23b2 @ M7B_r3_08000::23b2 =====

void __h3000 FUN_M7B_r3_08000__23b2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$23F7 ->$23D6 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__23f7_M7B_r3_08000__238c);
  return;
}


// ===== FUN_M7B_r3_08000__23be @ M7B_r3_08000::23be =====

void __h3000 FUN_M7B_r3_08000__23be(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$23F7 ->$23D6 */
                    /* inline[API_FDBC]: "5.94..#." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__23f7_M7B_r3_08000__238c);
  return;
}


// ===== FUN_M7B_r3_08000__23ca @ M7B_r3_08000::23ca =====

void __h3000 FUN_M7B_r3_08000__23ca(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$23F7 ->$23D6 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__23f7_M7B_r3_08000__238c);
  return;
}


// ===== FUN_M7B_r3_08000__23d6 @ M7B_r3_08000::23d6 =====

void __h3000 FUN_M7B_r3_08000__23d6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$23F7 ->$23D6 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__23f7_M7B_r3_08000__238c);
  return;
}


// ===== FUN_M7B_r3_08000__23f7 @ M7B_r3_08000::23f7 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2413 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__23f7(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70d6 = FUN_M7B_r3_08000__249e((char)((ushort)DAT_7182 >> 8));
  uVar1 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar1,DAT_70d6,0x3f5b);
                    /* WARNING: Could not recover jumptable at 0x2413. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__243b @ M7B_r3_08000::243b =====

void __h3000 FUN_M7B_r3_08000__243b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2480 ->$245F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2480_M7B_r3_08000__2415);
  return;
}


// ===== FUN_M7B_r3_08000__2447 @ M7B_r3_08000::2447 =====

void __h3000 FUN_M7B_r3_08000__2447(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2480 ->$245F */
                    /* inline[API_FDBC]: "5.94..$." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2480_M7B_r3_08000__2415);
  return;
}


// ===== FUN_M7B_r3_08000__2453 @ M7B_r3_08000::2453 =====

void __h3000 FUN_M7B_r3_08000__2453(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2480 ->$245F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2480_M7B_r3_08000__2415);
  return;
}


// ===== FUN_M7B_r3_08000__245f @ M7B_r3_08000::245f =====

void __h3000 FUN_M7B_r3_08000__245f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2480 ->$245F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2480_M7B_r3_08000__2415);
  return;
}


// ===== FUN_M7B_r3_08000__2480 @ M7B_r3_08000::2480 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x249c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2480(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70d6 = FUN_M7B_r3_08000__249e((char)((ushort)DAT_7186 >> 8));
  uVar1 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar1,DAT_70d6,0x3f5f);
                    /* WARNING: Could not recover jumptable at 0x249c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__249e @ M7B_r3_08000::249e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2519 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__249e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  char cVar2;
  ushort in_D;
  byte bVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar3 = (byte)in_D;
  cVar2 = (char)(in_D >> 8);
  if (in_D < 10 == (in_D == 10)) {
    if (in_D < 100 == (in_D == 100)) {
      if (in_D < 1000 == (in_D == 1000)) {
        DAT_70d8 = 1000;
        DAT_70da = &UNK_M7B_r3_08000__2553;
      }
      else {
        DAT_70d8 = 100;
        DAT_70da = (undefined *)0x2541;
      }
    }
    else {
      DAT_70d8 = 10;
      DAT_70da = (undefined *)0x252f;
    }
    *(byte *)(param_3 + -1) = bVar3;
    *(char *)(param_3 + -2) = cVar2;
    uVar1 = DAT_70d8;
    *(char *)(param_3 + -3) = (char)DAT_70d8;
    psVar4 = (short *)(param_3 + -4);
    *(char *)psVar4 = (char)((ushort)uVar1 >> 8);
    API_FCEA();
    DAT_70d6 = *(undefined2 *)
                (DAT_70da +
                g_moduleBase + CONCAT11((char)(*psVar4 - 1U >> 7),(char)(*psVar4 - 1U) << 1));
  }
  else {
    DAT_70d6 = *(undefined2 *)
                (FUN_M7B_r3_08000__251b +
                g_moduleBase + CONCAT11(cVar2 << 1 | bVar3 >> 7,bVar3 << 1));
  }
                    /* WARNING: Could not recover jumptable at 0x2519. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)DAT_70d6 >> 8),(char)DAT_70d6,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__251b @ M7B_r3_08000::251b =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FUN_M7B_r3_08000__251b(void)

{
  DAT_ff7f = 0;
                    /* WARNING (jumptable): Read-only address (RAM,0xf17f) is written */
                    /* WARNING: Read-only address (RAM,0xf17f) is written */
  uRAMf17f = 0;
  DAT_7f45 = ~DAT_7f45;
                    /* WARNING (jumptable): Read-only address (RAM,0x167e) is written */
                    /* WARNING: Read-only address (RAM,0x167e) is written */
  uRAM167e = 0;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_M7B_r3_08000__25a1 @ M7B_r3_08000::25a1 =====

void __h3000 FUN_M7B_r3_08000__25a1(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b);
  return;
}


// ===== FUN_M7B_r3_08000__25ad @ M7B_r3_08000::25ad =====

void __h3000 FUN_M7B_r3_08000__25ad(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$260A ->$25C5 */
                    /* inline[API_FDBC]: "5.94..%{" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b);
  return;
}


// ===== FUN_M7B_r3_08000__25b9 @ M7B_r3_08000::25b9 =====

void __h3000 FUN_M7B_r3_08000__25b9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$260A ->$25C5 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b);
  return;
}


// ===== FUN_M7B_r3_08000__25c5 @ M7B_r3_08000::25c5 =====

void __h3000 FUN_M7B_r3_08000__25c5(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b);
  return;
}


// ===== FUN_M7B_r3_08000__25d1 @ M7B_r3_08000::25d1 =====

void __h3000 FUN_M7B_r3_08000__25d1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$260A ->$25C5 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b);
  return;
}


// ===== FUN_M7B_r3_08000__25dd @ M7B_r3_08000::25dd =====

void __h3000 FUN_M7B_r3_08000__25dd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$260A ->$25C5 $25B9 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b);
  return;
}


// ===== FUN_M7B_r3_08000__260a @ M7B_r3_08000::260a =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2644 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__260a(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  ushort uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  API_FE76();
  FUN_M7B_r3_08000__22b5();
  if (DAT_718a == 1) {
    API_FD2E(0);
  }
  else {
    uVar2 = (undefined1)((ushort)(DAT_7026 + 1) >> 8);
    in_D = CONCAT11(uVar2,(char)in_D);
    API_FD2E(uVar2);
  }
                    /* WARNING: Could not recover jumptable at 0x2644. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__266c @ M7B_r3_08000::266c =====

void __h3000 FUN_M7B_r3_08000__266c(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,&PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646);
  return;
}


// ===== FUN_M7B_r3_08000__2678 @ M7B_r3_08000::2678 =====

void __h3000 FUN_M7B_r3_08000__2678(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$26C9 ->$2690 */
                    /* inline[API_FDBC]: "5.94..&F" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646);
  return;
}


// ===== FUN_M7B_r3_08000__2684 @ M7B_r3_08000::2684 =====

void __h3000 FUN_M7B_r3_08000__2684(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$26C9 ->$2690 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646);
  return;
}


// ===== FUN_M7B_r3_08000__2690 @ M7B_r3_08000::2690 =====

void __h3000 FUN_M7B_r3_08000__2690(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,&PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646);
  return;
}


// ===== FUN_M7B_r3_08000__269c @ M7B_r3_08000::269c =====

void __h3000 FUN_M7B_r3_08000__269c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$26C9 ->$2690 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646);
  return;
}


// ===== FUN_M7B_r3_08000__26a8 @ M7B_r3_08000::26a8 =====

void __h3000 FUN_M7B_r3_08000__26a8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$26C9 ->$2690 $2684 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646);
  return;
}


// ===== FUN_M7B_r3_08000__26c9 @ M7B_r3_08000::26c9 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2703 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__26c9(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  ushort uVar1;
  undefined1 uVar2;
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar1 = (ushort)in_D >> 8;
  API_FE76();
  FUN_M7B_r3_08000__2356();
  if (DAT_718e == 1) {
    API_FD2E(0);
  }
  else {
    uVar2 = (undefined1)((ushort)(DAT_702c + 1) >> 8);
    in_D = CONCAT11(uVar2,(char)in_D);
    API_FD2E(uVar2);
  }
                    /* WARNING: Could not recover jumptable at 0x2703. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)uVar1,(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__272b @ M7B_r3_08000::272b =====

void __h3000 FUN_M7B_r3_08000__272b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2770 ->$274F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2770_M7B_r3_08000__2705);
  return;
}


// ===== FUN_M7B_r3_08000__2737 @ M7B_r3_08000::2737 =====

void __h3000 FUN_M7B_r3_08000__2737(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2770 ->$274F */
                    /* inline[API_FDBC]: "5.94..'." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2770_M7B_r3_08000__2705);
  return;
}


// ===== FUN_M7B_r3_08000__2743 @ M7B_r3_08000::2743 =====

void __h3000 FUN_M7B_r3_08000__2743(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2770 ->$274F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2770_M7B_r3_08000__2705);
  return;
}


// ===== FUN_M7B_r3_08000__274f @ M7B_r3_08000::274f =====

void __h3000 FUN_M7B_r3_08000__274f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2770 ->$274F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2770_M7B_r3_08000__2705);
  return;
}


// ===== FUN_M7B_r3_08000__2770 @ M7B_r3_08000::2770 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x27bb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2770(undefined2 param_1,undefined2 param_2,short param_3)

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
  uVar1 = DAT_7192;
  *(char *)(sVar4 + -1) = (char)DAT_7192;
  puVar5 = (ushort *)(sVar4 + -2);
  *(char *)puVar5 = (char)((ushort)uVar1 >> 8);
  FUN_c155();
  DAT_70d6 = *puVar5;
  uVar2 = DAT_70d6;
  if ((short)DAT_70d6 < 0) {
    uVar2 = DAT_7164;
    if ((short)DAT_7164 < 0x1ff) {
      bVar3 = (byte)DAT_7164;
      DAT_70d8 = CONCAT11(((((((char)(DAT_7164 >> 8) << 1 | bVar3 >> 7) << 1 | (bVar3 & 0x7f) >> 6)
                             << 1 | (bVar3 & 0x3f) >> 5) << 1 | (bVar3 & 0x1f) >> 4) << 1 |
                          (bVar3 & 0xf) >> 3) << 1 | (bVar3 & 7) >> 2,bVar3 << 6);
      uVar2 = DAT_70d8 + DAT_70d6;
      if (!CARRY2(DAT_70d8,DAT_70d6) || (short)uVar2 < 0 != SCARRY2(DAT_70d8,DAT_70d6)) {
        uVar2 = 1 - DAT_70d8;
        DAT_70d6 = uVar2;
      }
    }
  }
  FUN_M7B_r3_08000__0f34((char)(uVar2 >> 8),(char)uVar2,DAT_70d6,0x3f59,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x27bb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__27e3 @ M7B_r3_08000::27e3 =====

void __h3000 FUN_M7B_r3_08000__27e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2828 ->$2807 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2828_M7B_r3_08000__27bd);
  return;
}


// ===== FUN_M7B_r3_08000__27ef @ M7B_r3_08000::27ef =====

void __h3000 FUN_M7B_r3_08000__27ef(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2828 ->$2807 */
                    /* inline[API_FDBC]: "5.94..'." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2828_M7B_r3_08000__27bd);
  return;
}


// ===== FUN_M7B_r3_08000__27fb @ M7B_r3_08000::27fb =====

void __h3000 FUN_M7B_r3_08000__27fb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2828 ->$2807 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2828_M7B_r3_08000__27bd);
  return;
}


// ===== FUN_M7B_r3_08000__2807 @ M7B_r3_08000::2807 =====

void __h3000 FUN_M7B_r3_08000__2807(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2828 ->$2807 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2828_M7B_r3_08000__27bd);
  return;
}


// ===== FUN_M7B_r3_08000__2828 @ M7B_r3_08000::2828 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2873 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2828(undefined2 param_1,undefined2 param_2,short param_3)

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
  uVar1 = _DAT_7196;
  *(char *)(sVar4 + -1) = (char)_DAT_7196;
  puVar5 = (ushort *)(sVar4 + -2);
  *(char *)puVar5 = (char)((ushort)uVar1 >> 8);
  FUN_c155();
  DAT_70d6 = *puVar5;
  uVar2 = DAT_70d6;
  if ((short)DAT_70d6 < 0) {
    uVar2 = DAT_716a;
    if ((short)DAT_716a < 0x1ff) {
      bVar3 = (byte)DAT_716a;
      DAT_70d8 = CONCAT11(((((((char)(DAT_716a >> 8) << 1 | bVar3 >> 7) << 1 | (bVar3 & 0x7f) >> 6)
                             << 1 | (bVar3 & 0x3f) >> 5) << 1 | (bVar3 & 0x1f) >> 4) << 1 |
                          (bVar3 & 0xf) >> 3) << 1 | (bVar3 & 7) >> 2,bVar3 << 6);
      uVar2 = DAT_70d8 + DAT_70d6;
      if (!CARRY2(DAT_70d8,DAT_70d6) || (short)uVar2 < 0 != SCARRY2(DAT_70d8,DAT_70d6)) {
        uVar2 = 1 - DAT_70d8;
        DAT_70d6 = uVar2;
      }
    }
  }
  FUN_M7B_r3_08000__0f34((char)(uVar2 >> 8),(char)uVar2,DAT_70d6,0x3f5d,puVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x2873. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__289b @ M7B_r3_08000::289b =====

void __h3000 FUN_M7B_r3_08000__289b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$28E0 ->$28BF */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__28e0_M7B_r3_08000__2875);
  return;
}


// ===== FUN_M7B_r3_08000__28a7 @ M7B_r3_08000::28a7 =====

void __h3000 FUN_M7B_r3_08000__28a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$28E0 ->$28BF */
                    /* inline[API_FDBC]: "5.94..(u" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__28e0_M7B_r3_08000__2875);
  return;
}


// ===== FUN_M7B_r3_08000__28b3 @ M7B_r3_08000::28b3 =====

void __h3000 FUN_M7B_r3_08000__28b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$28E0 ->$28BF */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__28e0_M7B_r3_08000__2875);
  return;
}


// ===== FUN_M7B_r3_08000__28bf @ M7B_r3_08000::28bf =====

void __h3000 FUN_M7B_r3_08000__28bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$28E0 ->$28BF */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__28e0_M7B_r3_08000__2875);
  return;
}


// ===== FUN_M7B_r3_08000__28e0 @ M7B_r3_08000::28e0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2922 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__28e0(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  short sVar1;
  undefined1 uVar2;
  short *psVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_3;
  API_FE76();
  *(undefined1 *)(sVar1 + -1) = 0;
  *(undefined1 *)(sVar1 + -2) = 0;
  *(undefined1 *)(sVar1 + -3) = 0x20;
  *(undefined1 *)(sVar1 + -4) = 0x4e;
  psVar3 = (short *)(sVar1 + -6);
  *psVar3 = DAT_719a + DAT_7182;
  API_FCD8();
  DAT_70d8 = FUN_M7B_r3_08000__249e((char)((ushort)*psVar3 >> 8));
  sVar1 = FUN_M7B_r3_08000__249e((char)((ushort)DAT_7182 >> 8));
  DAT_70d6 = DAT_70d8 - sVar1;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f48);
                    /* WARNING: Could not recover jumptable at 0x2922. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__294a @ M7B_r3_08000::294a =====

void __h3000 FUN_M7B_r3_08000__294a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$298F ->$296E */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__298f_M7B_r3_08000__2924);
  return;
}


// ===== FUN_M7B_r3_08000__2956 @ M7B_r3_08000::2956 =====

void __h3000 FUN_M7B_r3_08000__2956(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$298F ->$296E */
                    /* inline[API_FDBC]: "5.94..)$" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__298f_M7B_r3_08000__2924);
  return;
}


// ===== FUN_M7B_r3_08000__2962 @ M7B_r3_08000::2962 =====

void __h3000 FUN_M7B_r3_08000__2962(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$298F ->$296E */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__298f_M7B_r3_08000__2924);
  return;
}


// ===== FUN_M7B_r3_08000__296e @ M7B_r3_08000::296e =====

void __h3000 FUN_M7B_r3_08000__296e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$298F ->$296E */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__298f_M7B_r3_08000__2924);
  return;
}


// ===== FUN_M7B_r3_08000__298f @ M7B_r3_08000::298f =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x29d1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__298f(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 in_D;
  short sVar1;
  undefined1 uVar2;
  short *psVar3;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar1 = param_3;
  API_FE76();
  *(undefined1 *)(sVar1 + -1) = 0;
  *(undefined1 *)(sVar1 + -2) = 0;
  *(undefined1 *)(sVar1 + -3) = 0x20;
  *(undefined1 *)(sVar1 + -4) = 0x4e;
  psVar3 = (short *)(sVar1 + -6);
  *psVar3 = DAT_719e + DAT_7186;
  API_FCD8();
  DAT_70d8 = FUN_M7B_r3_08000__249e((char)((ushort)*psVar3 >> 8));
  sVar1 = FUN_M7B_r3_08000__249e((char)((ushort)DAT_7186 >> 8));
  DAT_70d6 = DAT_70d8 - sVar1;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f49);
                    /* WARNING: Could not recover jumptable at 0x29d1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__29f9 @ M7B_r3_08000::29f9 =====

void __h3000 FUN_M7B_r3_08000__29f9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2A56 ->$2A1D */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3);
  return;
}


// ===== FUN_M7B_r3_08000__2a05 @ M7B_r3_08000::2a05 =====

void __h3000 FUN_M7B_r3_08000__2a05(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2A56 ->$2A1D */
                    /* inline[API_FDBC]: "5.94..)." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3);
  return;
}


// ===== FUN_M7B_r3_08000__2a11 @ M7B_r3_08000::2a11 =====

void __h3000 FUN_M7B_r3_08000__2a11(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2A56 ->$2A1D */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3);
  return;
}


// ===== FUN_M7B_r3_08000__2a1d @ M7B_r3_08000::2a1d =====

void __h3000 FUN_M7B_r3_08000__2a1d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2A56 ->$2A1D */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3);
  return;
}


// ===== FUN_M7B_r3_08000__2a29 @ M7B_r3_08000::2a29 =====

void __h3000 FUN_M7B_r3_08000__2a29(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$2A56 ->$2A1D */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3);
  return;
}


// ===== FUN_M7B_r3_08000__2a35 @ M7B_r3_08000::2a35 =====

void __h3000 FUN_M7B_r3_08000__2a35(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$2A56 ->$2A1D $2A11 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3);
  return;
}


// ===== FUN_M7B_r3_08000__2a56 @ M7B_r3_08000::2a56 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2a92 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2a56(undefined2 param_1,undefined2 param_2,short param_3)

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
  *psVar3 = DAT_7084 + DAT_71a0 + DAT_71a4;
  API_FCD8();
  sVar1 = *psVar3;
  DAT_71a2 = sVar1;
  *(char *)((short)psVar3 + 1) = (char)sVar1;
  *(char *)psVar3 = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)((short)psVar3 + -1) = 0x38;
  psVar3 = psVar3 + -1;
  *(undefined1 *)psVar3 = 0xf;
  API_FCF2();
  DAT_70d6 = *psVar3;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f70,psVar3 + 1);
                    /* WARNING: Could not recover jumptable at 0x2a92. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2aba @ M7B_r3_08000::2aba =====

void __h3000 FUN_M7B_r3_08000__2aba(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2AFF ->$2ADE */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2aff_M7B_r3_08000__2a94);
  return;
}


// ===== FUN_M7B_r3_08000__2ac6 @ M7B_r3_08000::2ac6 =====

void __h3000 FUN_M7B_r3_08000__2ac6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2AFF ->$2ADE */
                    /* inline[API_FDBC]: "5.94..*." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2aff_M7B_r3_08000__2a94);
  return;
}


// ===== FUN_M7B_r3_08000__2ad2 @ M7B_r3_08000::2ad2 =====

void __h3000 FUN_M7B_r3_08000__2ad2(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2AFF ->$2ADE */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2aff_M7B_r3_08000__2a94);
  return;
}


// ===== FUN_M7B_r3_08000__2ade @ M7B_r3_08000::2ade =====

void __h3000 FUN_M7B_r3_08000__2ade(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2AFF ->$2ADE */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2aff_M7B_r3_08000__2a94);
  return;
}


// ===== FUN_M7B_r3_08000__2aff @ M7B_r3_08000::2aff =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2b31 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2aff(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  short sVar2;
  undefined1 *puVar3;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar2 = param_3;
  API_FE76();
  uVar1 = DAT_70fe;
  if (DAT_71a8 == 0) {
    DAT_71a4 = DAT_71a8;
  }
  else {
    *(char *)(sVar2 + -1) = (char)DAT_70fe;
    *(char *)(sVar2 + -2) = (char)((ushort)uVar1 >> 8);
    *(undefined1 *)(sVar2 + -3) = 0x28;
    puVar3 = (undefined1 *)(sVar2 + -4);
    *puVar3 = 0;
    API_FCEE();
    sVar2 = DAT_71a8;
    puVar3[-1] = (char)DAT_71a8;
    psVar4 = (short *)(puVar3 + -2);
    *(char *)psVar4 = (char)((ushort)sVar2 >> 8);
    API_FCEA();
    DAT_71a4 = *psVar4;
  }
  FUN_M7B_r3_08000__2a56();
                    /* WARNING: Could not recover jumptable at 0x2b31. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)in_D,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2b59 @ M7B_r3_08000::2b59 =====

void __h3000 FUN_M7B_r3_08000__2b59(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7B_r3_08000__2b33);
  return;
}


// ===== FUN_M7B_r3_08000__2b65 @ M7B_r3_08000::2b65 =====

void __h3000 FUN_M7B_r3_08000__2b65(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7B_r3_08000__2b33);
  return;
}


// ===== FUN_M7B_r3_08000__2b71 @ M7B_r3_08000::2b71 =====

void __h3000 FUN_M7B_r3_08000__2b71(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7B_r3_08000__2b33);
  return;
}


// ===== FUN_M7B_r3_08000__2b7d @ M7B_r3_08000::2b7d =====

void __h3000 FUN_M7B_r3_08000__2b7d(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7B_r3_08000__2b33);
  return;
}


// ===== FUN_M7B_r3_08000__2b9e @ M7B_r3_08000::2b9e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2c23 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2b9e(undefined2 param_1,undefined2 param_2,short param_3)

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
  cVar3 = (char)DAT_71ac;
  if (cVar3 < '\x06') {
    DAT_70d6 = DAT_71ac;
    DAT_70d8 = 0;
  }
  else if (cVar3 == '\x06') {
    DAT_70d6 = 0;
    DAT_70d8 = 1;
  }
  else if (cVar3 < '\v') {
    DAT_70d6 = DAT_71ac + -5;
    DAT_70d8 = 1;
  }
  else if (cVar3 == '\v') {
    DAT_70d6 = 2;
    DAT_70d8 = 2;
  }
  else {
    DAT_70d6 = 4;
    DAT_70d8 = 2;
  }
  sVar1 = DAT_70d6;
  *(char *)(sVar4 + -1) = (char)DAT_70d6;
  *(char *)(sVar4 + -2) = (char)((ushort)sVar1 >> 8);
  *(undefined1 *)(sVar4 + -3) = 0x41;
  psVar5 = (short *)(sVar4 + -4);
  *(undefined1 *)psVar5 = 0;
  API_FCEE();
  DAT_70d6 = *psVar5;
  uVar2 = FUN_M7B_r3_08000__0f34
                    ((char)((ushort)DAT_70d6 >> 8),(char)DAT_70d6,DAT_70d6,0x3f71,psVar5 + 1);
  FUN_M7B_r3_08000__0f34((char)((ushort)uVar2 >> 8),(char)uVar2,DAT_70d8,0x3f73);
                    /* WARNING: Could not recover jumptable at 0x2c23. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),(char)uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2ccd @ M7B_r3_08000::2ccd =====

void __h3000 FUN_M7B_r3_08000__2ccd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2D12 ->$2CF1 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2d12_M7B_r3_08000__2ca7);
  return;
}


// ===== FUN_M7B_r3_08000__2cd9 @ M7B_r3_08000::2cd9 =====

void __h3000 FUN_M7B_r3_08000__2cd9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2D12 ->$2CF1 */
                    /* inline[API_FDBC]: "5.94..,." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2d12_M7B_r3_08000__2ca7);
  return;
}


// ===== FUN_M7B_r3_08000__2ce5 @ M7B_r3_08000::2ce5 =====

void __h3000 FUN_M7B_r3_08000__2ce5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2D12 ->$2CF1 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2d12_M7B_r3_08000__2ca7);
  return;
}


// ===== FUN_M7B_r3_08000__2cf1 @ M7B_r3_08000::2cf1 =====

void __h3000 FUN_M7B_r3_08000__2cf1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2D12 ->$2CF1 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2d12_M7B_r3_08000__2ca7);
  return;
}


// ===== FUN_M7B_r3_08000__2d12 @ M7B_r3_08000::2d12 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2d3c */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2d12(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70d6 = *(undefined2 *)
              (&UNK_M7B_r3_08000__2d3e +
              g_moduleBase + CONCAT11((char)(DAT_71b0 + 0x29U >> 7),(char)(DAT_71b0 + 0x29U) << 1));
  uVar1 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar1,DAT_70d6,0x3f74);
                    /* WARNING: Could not recover jumptable at 0x2d3c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2db8 @ M7B_r3_08000::2db8 =====

void __h3000 FUN_M7B_r3_08000__2db8(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2DFD ->$2DDC */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2dfd_M7B_r3_08000__2d92);
  return;
}


// ===== FUN_M7B_r3_08000__2dc4 @ M7B_r3_08000::2dc4 =====

void __h3000 FUN_M7B_r3_08000__2dc4(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2DFD ->$2DDC */
                    /* inline[API_FDBC]: "5.94..-." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2dfd_M7B_r3_08000__2d92);
  return;
}


// ===== FUN_M7B_r3_08000__2dd0 @ M7B_r3_08000::2dd0 =====

void __h3000 FUN_M7B_r3_08000__2dd0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2DFD ->$2DDC */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2dfd_M7B_r3_08000__2d92);
  return;
}


// ===== FUN_M7B_r3_08000__2ddc @ M7B_r3_08000::2ddc =====

void __h3000 FUN_M7B_r3_08000__2ddc(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2DFD ->$2DDC */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2dfd_M7B_r3_08000__2d92);
  return;
}


// ===== FUN_M7B_r3_08000__2dfd @ M7B_r3_08000::2dfd =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2e23 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2dfd(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71b4;
  *(char *)(sVar3 + -1) = (char)DAT_71b4;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x38;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0xf;
  API_FCF2();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f72,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x2e23. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2e4b @ M7B_r3_08000::2e4b =====

void __h3000 FUN_M7B_r3_08000__2e4b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$2EA2 ->$2E6F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__2ea2_M7B_r3_08000__2e25);
  return;
}


// ===== FUN_M7B_r3_08000__2e57 @ M7B_r3_08000::2e57 =====

void __h3000 FUN_M7B_r3_08000__2e57(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$2EA2 ->$2E6F */
                    /* inline[API_FDBC]: "5.94...%" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__2ea2_M7B_r3_08000__2e25);
  return;
}


// ===== FUN_M7B_r3_08000__2e63 @ M7B_r3_08000::2e63 =====

void __h3000 FUN_M7B_r3_08000__2e63(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$2EA2 ->$2E6F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__2ea2_M7B_r3_08000__2e25);
  return;
}


// ===== FUN_M7B_r3_08000__2e6f @ M7B_r3_08000::2e6f =====

void __h3000 FUN_M7B_r3_08000__2e6f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$2EA2 ->$2E6F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__2ea2_M7B_r3_08000__2e25);
  return;
}


// ===== FUN_M7B_r3_08000__2e90 @ M7B_r3_08000::2e90 =====

void __h3000 FUN_M7B_r3_08000__2e90(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__2e4b();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x2ea0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__2ea2 @ M7B_r3_08000::2ea2 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2ebe */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2ea2(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70d6 = FUN_M7B_r3_08000__2ec0((char)((ushort)DAT_71b8 >> 8));
  uVar1 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar1,DAT_70d6,0x3f6c);
                    /* WARNING: Could not recover jumptable at 0x2ebe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2ec0 @ M7B_r3_08000::2ec0 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x2f6a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__2ec0(undefined2 param_1,undefined2 param_2,short param_3)

{
  char cVar1;
  ushort in_D;
  byte bVar3;
  short sVar2;
  short *psVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  bVar3 = (byte)in_D;
  cVar1 = (char)(in_D >> 8);
  if (in_D < 10 == (in_D == 10)) {
    if (in_D < 100 == (in_D == 100)) {
      if (in_D < 1000 == (in_D == 1000)) {
        *(byte *)(param_3 + -1) = bVar3;
        *(char *)(param_3 + -2) = cVar1;
        *(undefined1 *)(param_3 + -3) = 0xe8;
        psVar4 = (short *)(param_3 + -4);
        *(undefined1 *)psVar4 = 3;
        API_FCEA();
        sVar2 = CONCAT11((char)(*psVar4 - 1U >> 7),(char)(*psVar4 - 1U) << 1);
        DAT_70d6 = *(undefined2 *)(&UNK_M7B_r3_08000__2fa4 + g_moduleBase + sVar2);
      }
      else {
        *(byte *)(param_3 + -1) = bVar3;
        *(char *)(param_3 + -2) = cVar1;
        *(undefined1 *)(param_3 + -3) = 100;
        psVar4 = (short *)(param_3 + -4);
        *(undefined1 *)psVar4 = 0;
        API_FCEA();
        sVar2 = CONCAT11((char)(*psVar4 - 1U >> 7),(char)(*psVar4 - 1U) << 1);
        DAT_70d6 = *(undefined2 *)(&UNK_M7B_r3_08000__2f92 + g_moduleBase + sVar2);
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
      DAT_70d6 = *(undefined2 *)(&UNK_M7B_r3_08000__2f80 + g_moduleBase + sVar2);
    }
  }
  else {
    sVar2 = CONCAT11(cVar1 << 1 | bVar3 >> 7,bVar3 << 1);
    DAT_70d6 = *(undefined2 *)(FUN_M7B_r3_08000__2f6c + g_moduleBase + sVar2);
  }
                    /* WARNING: Could not recover jumptable at 0x2f6a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)DAT_70d6 >> 8),(char)sVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__2f6c @ M7B_r3_08000::2f6c =====

/* WARNING: Control flow encountered bad instruction data */

void __h3000 FUN_M7B_r3_08000__2f6c(void)

{
                    /* WARNING: Read-only address (RAM,0xff4d) is written */
  uRAMff4d = 0;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


// ===== FUN_M7B_r3_08000__2fde @ M7B_r3_08000::2fde =====

void __h3000 FUN_M7B_r3_08000__2fde(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3035 ->$3002 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3035_M7B_r3_08000__2fb8);
  return;
}


// ===== FUN_M7B_r3_08000__2fea @ M7B_r3_08000::2fea =====

void __h3000 FUN_M7B_r3_08000__2fea(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3035 ->$3002 */
                    /* inline[API_FDBC]: "5.94../." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3035_M7B_r3_08000__2fb8);
  return;
}


// ===== FUN_M7B_r3_08000__2ff6 @ M7B_r3_08000::2ff6 =====

void __h3000 FUN_M7B_r3_08000__2ff6(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3035 ->$3002 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3035_M7B_r3_08000__2fb8);
  return;
}


// ===== FUN_M7B_r3_08000__3002 @ M7B_r3_08000::3002 =====

void __h3000 FUN_M7B_r3_08000__3002(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3035 ->$3002 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3035_M7B_r3_08000__2fb8);
  return;
}


// ===== FUN_M7B_r3_08000__3023 @ M7B_r3_08000::3023 =====

void __h3000 FUN_M7B_r3_08000__3023(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__2fde();
  DAT_6066 = 5;
  DAT_60dc = 100;
                    /* WARNING: Could not recover jumptable at 0x3033. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__3035 @ M7B_r3_08000::3035 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3051 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3035(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  undefined2 in_D;
  undefined1 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76();
  DAT_70d6 = FUN_M7B_r3_08000__2ec0((char)((ushort)DAT_71bc >> 8));
  uVar1 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar1,DAT_70d6,0x3f6d);
                    /* WARNING: Could not recover jumptable at 0x3051. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar1,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__3079 @ M7B_r3_08000::3079 =====

void __h3000 FUN_M7B_r3_08000__3079(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$30BE ->$309D */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__30be_M7B_r3_08000__3053);
  return;
}


// ===== FUN_M7B_r3_08000__3085 @ M7B_r3_08000::3085 =====

void __h3000 FUN_M7B_r3_08000__3085(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$30BE ->$309D */
                    /* inline[API_FDBC]: "5.94..0S" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__30be_M7B_r3_08000__3053);
  return;
}


// ===== FUN_M7B_r3_08000__3091 @ M7B_r3_08000::3091 =====

void __h3000 FUN_M7B_r3_08000__3091(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$30BE ->$309D */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__30be_M7B_r3_08000__3053);
  return;
}


// ===== FUN_M7B_r3_08000__309d @ M7B_r3_08000::309d =====

void __h3000 FUN_M7B_r3_08000__309d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$30BE ->$309D */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__30be_M7B_r3_08000__3053);
  return;
}


// ===== FUN_M7B_r3_08000__30be @ M7B_r3_08000::30be =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x30e4 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__30be(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71c0;
  *(char *)(sVar3 + -1) = (char)DAT_71c0;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0x55;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 1;
  API_FCEC();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f6e,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x30e4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__310c @ M7B_r3_08000::310c =====

void __h3000 FUN_M7B_r3_08000__310c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3169 ->$3130 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6);
  return;
}


// ===== FUN_M7B_r3_08000__3118 @ M7B_r3_08000::3118 =====

void __h3000 FUN_M7B_r3_08000__3118(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3169 ->$3130 */
                    /* inline[API_FDBC]: "5.94..0." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6);
  return;
}


// ===== FUN_M7B_r3_08000__3124 @ M7B_r3_08000::3124 =====

void __h3000 FUN_M7B_r3_08000__3124(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3169 ->$3130 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6);
  return;
}


// ===== FUN_M7B_r3_08000__3130 @ M7B_r3_08000::3130 =====

void __h3000 FUN_M7B_r3_08000__3130(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3169 ->$3130 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6);
  return;
}


// ===== FUN_M7B_r3_08000__313c @ M7B_r3_08000::313c =====

void __h3000 FUN_M7B_r3_08000__313c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3169 ->$3130 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6);
  return;
}


// ===== FUN_M7B_r3_08000__3148 @ M7B_r3_08000::3148 =====

void __h3000 FUN_M7B_r3_08000__3148(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3169 ->$3130 $3124 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6);
  return;
}


// ===== FUN_M7B_r3_08000__3169 @ M7B_r3_08000::3169 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x319b */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3169(undefined2 param_1,undefined2 param_2,short param_3)

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
  uVar1 = DAT_71c4;
  *(char *)(sVar3 + -3) = (char)DAT_71c4;
  puVar4 = (undefined1 *)(sVar3 + -4);
  *puVar4 = (char)((ushort)uVar1 >> 8);
  API_FCE6();
  puVar4[-1] = 10;
  psVar5 = (short *)(puVar4 + -2);
  *(undefined1 *)psVar5 = 0;
  API_FCEC();
  DAT_70d6 = *psVar5 + -0x7fff;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f6f,psVar5 + 1);
                    /* WARNING: Could not recover jumptable at 0x319b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__31c3 @ M7B_r3_08000::31c3 =====

void __h3000 FUN_M7B_r3_08000__31c3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3208 ->$31E7 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3208_M7B_r3_08000__319d);
  return;
}


// ===== FUN_M7B_r3_08000__31cf @ M7B_r3_08000::31cf =====

void __h3000 FUN_M7B_r3_08000__31cf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3208 ->$31E7 */
                    /* inline[API_FDBC]: "5.94..1." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3208_M7B_r3_08000__319d);
  return;
}


// ===== FUN_M7B_r3_08000__31db @ M7B_r3_08000::31db =====

void __h3000 FUN_M7B_r3_08000__31db(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3208 ->$31E7 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3208_M7B_r3_08000__319d);
  return;
}


// ===== FUN_M7B_r3_08000__31e7 @ M7B_r3_08000::31e7 =====

void __h3000 FUN_M7B_r3_08000__31e7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3208 ->$31E7 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3208_M7B_r3_08000__319d);
  return;
}


// ===== FUN_M7B_r3_08000__3208 @ M7B_r3_08000::3208 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x322e */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3208(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71c8;
  *(char *)(sVar3 + -1) = (char)DAT_71c8;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f54,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x322e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__3256 @ M7B_r3_08000::3256 =====

void __h3000 FUN_M7B_r3_08000__3256(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$329B ->$327A */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__329b_M7B_r3_08000__3230);
  return;
}


// ===== FUN_M7B_r3_08000__3262 @ M7B_r3_08000::3262 =====

void __h3000 FUN_M7B_r3_08000__3262(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$329B ->$327A */
                    /* inline[API_FDBC]: "5.94..20" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__329b_M7B_r3_08000__3230);
  return;
}


// ===== FUN_M7B_r3_08000__326e @ M7B_r3_08000::326e =====

void __h3000 FUN_M7B_r3_08000__326e(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$329B ->$327A */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__329b_M7B_r3_08000__3230);
  return;
}


// ===== FUN_M7B_r3_08000__327a @ M7B_r3_08000::327a =====

void __h3000 FUN_M7B_r3_08000__327a(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$329B ->$327A */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__329b_M7B_r3_08000__3230);
  return;
}


// ===== FUN_M7B_r3_08000__329b @ M7B_r3_08000::329b =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x32c1 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__329b(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71cc;
  *(char *)(sVar3 + -1) = (char)DAT_71cc;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f55,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x32c1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__32e9 @ M7B_r3_08000::32e9 =====

void __h3000 FUN_M7B_r3_08000__32e9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$332E ->$330D */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__332e_M7B_r3_08000__32c3);
  return;
}


// ===== FUN_M7B_r3_08000__32f5 @ M7B_r3_08000::32f5 =====

void __h3000 FUN_M7B_r3_08000__32f5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$332E ->$330D */
                    /* inline[API_FDBC]: "5.94..2." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__332e_M7B_r3_08000__32c3);
  return;
}


// ===== FUN_M7B_r3_08000__3301 @ M7B_r3_08000::3301 =====

void __h3000 FUN_M7B_r3_08000__3301(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$332E ->$330D */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__332e_M7B_r3_08000__32c3);
  return;
}


// ===== FUN_M7B_r3_08000__330d @ M7B_r3_08000::330d =====

void __h3000 FUN_M7B_r3_08000__330d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$332E ->$330D */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__332e_M7B_r3_08000__32c3);
  return;
}


// ===== FUN_M7B_r3_08000__332e @ M7B_r3_08000::332e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3354 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__332e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71d0;
  *(char *)(sVar3 + -1) = (char)DAT_71d0;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f56,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3354. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__337c @ M7B_r3_08000::337c =====

void __h3000 FUN_M7B_r3_08000__337c(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$33C1 ->$33A0 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__33c1_M7B_r3_08000__3356);
  return;
}


// ===== FUN_M7B_r3_08000__3388 @ M7B_r3_08000::3388 =====

void __h3000 FUN_M7B_r3_08000__3388(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$33C1 ->$33A0 */
                    /* inline[API_FDBC]: "5.94..3V" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__33c1_M7B_r3_08000__3356);
  return;
}


// ===== FUN_M7B_r3_08000__3394 @ M7B_r3_08000::3394 =====

void __h3000 FUN_M7B_r3_08000__3394(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$33C1 ->$33A0 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__33c1_M7B_r3_08000__3356);
  return;
}


// ===== FUN_M7B_r3_08000__33a0 @ M7B_r3_08000::33a0 =====

void __h3000 FUN_M7B_r3_08000__33a0(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$33C1 ->$33A0 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__33c1_M7B_r3_08000__3356);
  return;
}


// ===== FUN_M7B_r3_08000__33c1 @ M7B_r3_08000::33c1 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x33e7 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__33c1(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71d4;
  *(char *)(sVar3 + -1) = (char)DAT_71d4;
  *(char *)(sVar3 + -2) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(sVar3 + -3) = 0xa3;
  puVar4 = (undefined2 *)(sVar3 + -4);
  *(undefined1 *)puVar4 = 0;
  API_FCEC();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f57,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x33e7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__340f @ M7B_r3_08000::340f =====

void __h3000 FUN_M7B_r3_08000__340f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$346C ->$3433 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9);
  return;
}


// ===== FUN_M7B_r3_08000__341b @ M7B_r3_08000::341b =====

void __h3000 FUN_M7B_r3_08000__341b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$346C ->$3433 */
                    /* inline[API_FDBC]: "5.94..3." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9);
  return;
}


// ===== FUN_M7B_r3_08000__3427 @ M7B_r3_08000::3427 =====

void __h3000 FUN_M7B_r3_08000__3427(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$346C ->$3433 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9);
  return;
}


// ===== FUN_M7B_r3_08000__3433 @ M7B_r3_08000::3433 =====

void __h3000 FUN_M7B_r3_08000__3433(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$346C ->$3433 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9);
  return;
}


// ===== FUN_M7B_r3_08000__343f @ M7B_r3_08000::343f =====

void __h3000 FUN_M7B_r3_08000__343f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$346C ->$3433 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9);
  return;
}


// ===== FUN_M7B_r3_08000__344b @ M7B_r3_08000::344b =====

void __h3000 FUN_M7B_r3_08000__344b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$346C ->$3433 $3427 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9);
  return;
}


// ===== FUN_M7B_r3_08000__346c @ M7B_r3_08000::346c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x348d */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__346c(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71d8;
  *(char *)(sVar3 + -1) = (char)DAT_71d8;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f4c,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x348d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__34b5 @ M7B_r3_08000::34b5 =====

void __h3000 FUN_M7B_r3_08000__34b5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3512 ->$34D9 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f);
  return;
}


// ===== FUN_M7B_r3_08000__34c1 @ M7B_r3_08000::34c1 =====

void __h3000 FUN_M7B_r3_08000__34c1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3512 ->$34D9 */
                    /* inline[API_FDBC]: "5.94..4." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f);
  return;
}


// ===== FUN_M7B_r3_08000__34cd @ M7B_r3_08000::34cd =====

void __h3000 FUN_M7B_r3_08000__34cd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3512 ->$34D9 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f);
  return;
}


// ===== FUN_M7B_r3_08000__34d9 @ M7B_r3_08000::34d9 =====

void __h3000 FUN_M7B_r3_08000__34d9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3512 ->$34D9 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f);
  return;
}


// ===== FUN_M7B_r3_08000__34e5 @ M7B_r3_08000::34e5 =====

void __h3000 FUN_M7B_r3_08000__34e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3512 ->$34D9 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f);
  return;
}


// ===== FUN_M7B_r3_08000__34f1 @ M7B_r3_08000::34f1 =====

void __h3000 FUN_M7B_r3_08000__34f1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3512 ->$34D9 $34CD */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f);
  return;
}


// ===== FUN_M7B_r3_08000__3512 @ M7B_r3_08000::3512 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3533 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3512(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71dc;
  *(char *)(sVar3 + -1) = (char)DAT_71dc;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f4d,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3533. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__355b @ M7B_r3_08000::355b =====

void __h3000 FUN_M7B_r3_08000__355b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$35B8 ->$357F */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535);
  return;
}


// ===== FUN_M7B_r3_08000__3567 @ M7B_r3_08000::3567 =====

void __h3000 FUN_M7B_r3_08000__3567(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$35B8 ->$357F */
                    /* inline[API_FDBC]: "5.94..55" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535);
  return;
}


// ===== FUN_M7B_r3_08000__3573 @ M7B_r3_08000::3573 =====

void __h3000 FUN_M7B_r3_08000__3573(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$35B8 ->$357F */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535);
  return;
}


// ===== FUN_M7B_r3_08000__357f @ M7B_r3_08000::357f =====

void __h3000 FUN_M7B_r3_08000__357f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$35B8 ->$357F */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535);
  return;
}


// ===== FUN_M7B_r3_08000__358b @ M7B_r3_08000::358b =====

void __h3000 FUN_M7B_r3_08000__358b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$35B8 ->$357F */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535);
  return;
}


// ===== FUN_M7B_r3_08000__3597 @ M7B_r3_08000::3597 =====

void __h3000 FUN_M7B_r3_08000__3597(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$35B8 ->$357F $3573 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535);
  return;
}


// ===== FUN_M7B_r3_08000__35b8 @ M7B_r3_08000::35b8 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x35d9 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__35b8(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71e0;
  *(char *)(sVar3 + -1) = (char)DAT_71e0;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f4e,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x35d9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__3601 @ M7B_r3_08000::3601 =====

void __h3000 FUN_M7B_r3_08000__3601(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$365E ->$3625 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db);
  return;
}


// ===== FUN_M7B_r3_08000__360d @ M7B_r3_08000::360d =====

void __h3000 FUN_M7B_r3_08000__360d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$365E ->$3625 */
                    /* inline[API_FDBC]: "5.94..5." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db);
  return;
}


// ===== FUN_M7B_r3_08000__3619 @ M7B_r3_08000::3619 =====

void __h3000 FUN_M7B_r3_08000__3619(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$365E ->$3625 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db);
  return;
}


// ===== FUN_M7B_r3_08000__3625 @ M7B_r3_08000::3625 =====

void __h3000 FUN_M7B_r3_08000__3625(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$365E ->$3625 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db);
  return;
}


// ===== FUN_M7B_r3_08000__3631 @ M7B_r3_08000::3631 =====

void __h3000 FUN_M7B_r3_08000__3631(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$365E ->$3625 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db);
  return;
}


// ===== FUN_M7B_r3_08000__363d @ M7B_r3_08000::363d =====

void __h3000 FUN_M7B_r3_08000__363d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$365E ->$3625 $3619 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db);
  return;
}


// ===== FUN_M7B_r3_08000__365e @ M7B_r3_08000::365e =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x367f */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__365e(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71e4;
  *(char *)(sVar3 + -1) = (char)DAT_71e4;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f4f,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x367f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__36a7 @ M7B_r3_08000::36a7 =====

void __h3000 FUN_M7B_r3_08000__36a7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3704 ->$36CB */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681);
  return;
}


// ===== FUN_M7B_r3_08000__36b3 @ M7B_r3_08000::36b3 =====

void __h3000 FUN_M7B_r3_08000__36b3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3704 ->$36CB */
                    /* inline[API_FDBC]: "5.94..6." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681);
  return;
}


// ===== FUN_M7B_r3_08000__36bf @ M7B_r3_08000::36bf =====

void __h3000 FUN_M7B_r3_08000__36bf(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3704 ->$36CB */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681);
  return;
}


// ===== FUN_M7B_r3_08000__36cb @ M7B_r3_08000::36cb =====

void __h3000 FUN_M7B_r3_08000__36cb(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3704 ->$36CB */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681);
  return;
}


// ===== FUN_M7B_r3_08000__36d7 @ M7B_r3_08000::36d7 =====

void __h3000 FUN_M7B_r3_08000__36d7(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3704 ->$36CB */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681);
  return;
}


// ===== FUN_M7B_r3_08000__36e3 @ M7B_r3_08000::36e3 =====

void __h3000 FUN_M7B_r3_08000__36e3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3704 ->$36CB $36BF */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681);
  return;
}


// ===== FUN_M7B_r3_08000__3704 @ M7B_r3_08000::3704 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3725 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3704(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71e8;
  *(char *)(sVar3 + -1) = (char)DAT_71e8;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f50,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3725. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__374d @ M7B_r3_08000::374d =====

void __h3000 FUN_M7B_r3_08000__374d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$37AA ->$3771 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727);
  return;
}


// ===== FUN_M7B_r3_08000__3759 @ M7B_r3_08000::3759 =====

void __h3000 FUN_M7B_r3_08000__3759(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$37AA ->$3771 */
                    /* inline[API_FDBC]: "5.94..7'" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727);
  return;
}


// ===== FUN_M7B_r3_08000__3765 @ M7B_r3_08000::3765 =====

void __h3000 FUN_M7B_r3_08000__3765(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$37AA ->$3771 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727);
  return;
}


// ===== FUN_M7B_r3_08000__3771 @ M7B_r3_08000::3771 =====

void __h3000 FUN_M7B_r3_08000__3771(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$37AA ->$3771 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727);
  return;
}


// ===== FUN_M7B_r3_08000__377d @ M7B_r3_08000::377d =====

void __h3000 FUN_M7B_r3_08000__377d(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$37AA ->$3771 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727);
  return;
}


// ===== FUN_M7B_r3_08000__3789 @ M7B_r3_08000::3789 =====

void __h3000 FUN_M7B_r3_08000__3789(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$37AA ->$3771 $3765 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727);
  return;
}


// ===== FUN_M7B_r3_08000__37aa @ M7B_r3_08000::37aa =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x37cb */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__37aa(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71ec;
  *(char *)(sVar3 + -1) = (char)DAT_71ec;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f51,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x37cb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__37f3 @ M7B_r3_08000::37f3 =====

void __h3000 FUN_M7B_r3_08000__37f3(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3850 ->$3817 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd);
  return;
}


// ===== FUN_M7B_r3_08000__37ff @ M7B_r3_08000::37ff =====

void __h3000 FUN_M7B_r3_08000__37ff(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3850 ->$3817 */
                    /* inline[API_FDBC]: "5.94..7." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd);
  return;
}


// ===== FUN_M7B_r3_08000__380b @ M7B_r3_08000::380b =====

void __h3000 FUN_M7B_r3_08000__380b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3850 ->$3817 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd);
  return;
}


// ===== FUN_M7B_r3_08000__3817 @ M7B_r3_08000::3817 =====

void __h3000 FUN_M7B_r3_08000__3817(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3850 ->$3817 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd);
  return;
}


// ===== FUN_M7B_r3_08000__3823 @ M7B_r3_08000::3823 =====

void __h3000 FUN_M7B_r3_08000__3823(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3850 ->$3817 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd);
  return;
}


// ===== FUN_M7B_r3_08000__382f @ M7B_r3_08000::382f =====

void __h3000 FUN_M7B_r3_08000__382f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3850 ->$3817 $380B */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd);
  return;
}


// ===== FUN_M7B_r3_08000__3850 @ M7B_r3_08000::3850 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3871 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3850(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71f0;
  *(char *)(sVar3 + -1) = (char)DAT_71f0;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f52,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3871. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__3899 @ M7B_r3_08000::3899 =====

void __h3000 FUN_M7B_r3_08000__3899(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$38F6 ->$38BD */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873);
  return;
}


// ===== FUN_M7B_r3_08000__38a5 @ M7B_r3_08000::38a5 =====

void __h3000 FUN_M7B_r3_08000__38a5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$38F6 ->$38BD */
                    /* inline[API_FDBC]: "5.94..8s" */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873);
  return;
}


// ===== FUN_M7B_r3_08000__38b1 @ M7B_r3_08000::38b1 =====

void __h3000 FUN_M7B_r3_08000__38b1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$38F6 ->$38BD */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873);
  return;
}


// ===== FUN_M7B_r3_08000__38bd @ M7B_r3_08000::38bd =====

void __h3000 FUN_M7B_r3_08000__38bd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$38F6 ->$38BD */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873);
  return;
}


// ===== FUN_M7B_r3_08000__38c9 @ M7B_r3_08000::38c9 =====

void __h3000 FUN_M7B_r3_08000__38c9(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$38F6 ->$38BD */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873);
  return;
}


// ===== FUN_M7B_r3_08000__38d5 @ M7B_r3_08000::38d5 =====

void __h3000 FUN_M7B_r3_08000__38d5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$38F6 ->$38BD $38B1 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873);
  return;
}


// ===== FUN_M7B_r3_08000__38f6 @ M7B_r3_08000::38f6 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3917 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__38f6(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = RAM0x71f4;
  *(char *)(sVar3 + -1) = (char)RAM0x71f4;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0cd();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f53,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3917. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__393f @ M7B_r3_08000::393f =====

void __h3000 FUN_M7B_r3_08000__393f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$399C ->$3963 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919);
  return;
}


// ===== FUN_M7B_r3_08000__394b @ M7B_r3_08000::394b =====

void __h3000 FUN_M7B_r3_08000__394b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$399C ->$3963 */
                    /* inline[API_FDBC]: "5.94..9." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919);
  return;
}


// ===== FUN_M7B_r3_08000__3957 @ M7B_r3_08000::3957 =====

void __h3000 FUN_M7B_r3_08000__3957(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$399C ->$3963 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919);
  return;
}


// ===== FUN_M7B_r3_08000__3963 @ M7B_r3_08000::3963 =====

void __h3000 FUN_M7B_r3_08000__3963(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$399C ->$3963 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919);
  return;
}


// ===== FUN_M7B_r3_08000__396f @ M7B_r3_08000::396f =====

void __h3000 FUN_M7B_r3_08000__396f(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$399C ->$3963 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919);
  return;
}


// ===== FUN_M7B_r3_08000__397b @ M7B_r3_08000::397b =====

void __h3000 FUN_M7B_r3_08000__397b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$399C ->$3963 $3957 */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919);
  return;
}


// ===== FUN_M7B_r3_08000__399c @ M7B_r3_08000::399c =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x39bd */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__399c(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = RAM0x71f8;
  *(char *)(sVar3 + -1) = (char)RAM0x71f8;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f8a,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x39bd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__39e5 @ M7B_r3_08000::39e5 =====

void __h3000 FUN_M7B_r3_08000__39e5(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6A]: ->$3A42 ->$3A09 */
  API_FE6A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf);
  return;
}


// ===== FUN_M7B_r3_08000__39f1 @ M7B_r3_08000::39f1 =====

void __h3000 FUN_M7B_r3_08000__39f1(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FDBC]: ->$3A42 ->$3A09 */
                    /* inline[API_FDBC]: "5.94..9." */
  API_FDBC(param_1,param_2,&PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf);
  return;
}


// ===== FUN_M7B_r3_08000__39fd @ M7B_r3_08000::39fd =====

void __h3000 FUN_M7B_r3_08000__39fd(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6C]: ->$3A42 ->$3A09 */
  API_FE6C(param_1,param_2,&PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf);
  return;
}


// ===== FUN_M7B_r3_08000__3a09 @ M7B_r3_08000::3a09 =====

void __h3000 FUN_M7B_r3_08000__3a09(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE6E]: ->$3A42 ->$3A09 */
  API_FE6E(param_1,param_2,&PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf);
  return;
}


// ===== FUN_M7B_r3_08000__3a15 @ M7B_r3_08000::3a15 =====

void __h3000 FUN_M7B_r3_08000__3a15(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1C]: ->$3A42 ->$3A09 */
  ParamDescriptorCall(param_1,param_2,&PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf);
  return;
}


// ===== FUN_M7B_r3_08000__3a21 @ M7B_r3_08000::3a21 =====

void __h3000 FUN_M7B_r3_08000__3a21(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE1A]: ->$3A42 ->$3A09 $39FD */
  API_FE1A(param_1,param_2,&PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf);
  return;
}


// ===== FUN_M7B_r3_08000__3a42 @ M7B_r3_08000::3a42 =====

/* WARNING: Heritage AFTER dead removal. Example location: B : 0x3a63 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void __h3000 FUN_M7B_r3_08000__3a42(undefined2 param_1,undefined2 param_2,short param_3)

{
  undefined2 uVar1;
  undefined2 in_D;
  undefined1 uVar2;
  short sVar3;
  undefined2 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  
  sVar3 = param_3;
  API_FE76();
  uVar1 = DAT_71fc;
  *(char *)(sVar3 + -1) = (char)DAT_71fc;
  puVar4 = (undefined2 *)(sVar3 + -2);
  *(char *)puVar4 = (char)((ushort)uVar1 >> 8);
  FUN_c0ef();
  DAT_70d6 = *puVar4;
  uVar2 = (undefined1)DAT_70d6;
  FUN_M7B_r3_08000__0f34((char)((ushort)DAT_70d6 >> 8),uVar2,DAT_70d6,0x3f8b,puVar4 + 1);
                    /* WARNING: Could not recover jumptable at 0x3a63. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8),uVar2,param_1,param_2,param_3);
  return;
}


// ===== FUN_M7B_r3_08000__3a8b @ M7B_r3_08000::3a8b =====

void __h3000 FUN_M7B_r3_08000__3a8b(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7B_r3_08000__3ad0_M7B_r3_08000__3a65);
  return;
}


// ===== FUN_M7B_r3_08000__3a97 @ M7B_r3_08000::3a97 =====

void __h3000 FUN_M7B_r3_08000__3a97(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3AD0 ->$3AAF */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7B_r3_08000__3ad0_M7B_r3_08000__3a65);
  return;
}


// ===== FUN_M7B_r3_08000__3aa3 @ M7B_r3_08000::3aa3 =====

void __h3000 FUN_M7B_r3_08000__3aa3(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7B_r3_08000__3ad0_M7B_r3_08000__3a65);
  return;
}


// ===== FUN_M7B_r3_08000__3aaf @ M7B_r3_08000::3aaf =====

void __h3000 FUN_M7B_r3_08000__3aaf(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7B_r3_08000__3ad0_M7B_r3_08000__3a65);
  return;
}


// ===== FUN_M7B_r3_08000__3ad0 @ M7B_r3_08000::3ad0 =====

void __h3000
FUN_M7B_r3_08000__3ad0
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7B_r3_08000__3ad0_M7B_r3_08000__3a65);
  API_FE52();
                    /* WARNING: Could not recover jumptable at 0x3add. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7B_r3_08000__3b05 @ M7B_r3_08000::3b05 =====

void __h3000 FUN_M7B_r3_08000__3b05(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7B_r3_08000__3b4a_M7B_r3_08000__3adf);
  return;
}


// ===== FUN_M7B_r3_08000__3b11 @ M7B_r3_08000::3b11 =====

void __h3000 FUN_M7B_r3_08000__3b11(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3B4A ->$3B29 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7B_r3_08000__3b4a_M7B_r3_08000__3adf);
  return;
}


// ===== FUN_M7B_r3_08000__3b1d @ M7B_r3_08000::3b1d =====

void __h3000 FUN_M7B_r3_08000__3b1d(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7B_r3_08000__3b4a_M7B_r3_08000__3adf);
  return;
}


// ===== FUN_M7B_r3_08000__3b29 @ M7B_r3_08000::3b29 =====

void __h3000 FUN_M7B_r3_08000__3b29(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7B_r3_08000__3b4a_M7B_r3_08000__3adf);
  return;
}


// ===== FUN_M7B_r3_08000__3b4a @ M7B_r3_08000::3b4a =====

void __h3000
FUN_M7B_r3_08000__3b4a
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7B_r3_08000__3b4a_M7B_r3_08000__3adf);
  API_FE54();
                    /* WARNING: Could not recover jumptable at 0x3b57. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7B_r3_08000__3b7f @ M7B_r3_08000::3b7f =====

void __h3000 FUN_M7B_r3_08000__3b7f(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7B_r3_08000__3bc4_M7B_r3_08000__3b59);
  return;
}


// ===== FUN_M7B_r3_08000__3b8b @ M7B_r3_08000::3b8b =====

void __h3000 FUN_M7B_r3_08000__3b8b(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3BC4 ->$3BA3 */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7B_r3_08000__3bc4_M7B_r3_08000__3b59);
  return;
}


// ===== FUN_M7B_r3_08000__3b97 @ M7B_r3_08000::3b97 =====

void __h3000 FUN_M7B_r3_08000__3b97(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7B_r3_08000__3bc4_M7B_r3_08000__3b59);
  return;
}


// ===== FUN_M7B_r3_08000__3ba3 @ M7B_r3_08000::3ba3 =====

void __h3000 FUN_M7B_r3_08000__3ba3(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7B_r3_08000__3bc4_M7B_r3_08000__3b59);
  return;
}


// ===== FUN_M7B_r3_08000__3bc4 @ M7B_r3_08000::3bc4 =====

void __h3000
FUN_M7B_r3_08000__3bc4
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7B_r3_08000__3bc4_M7B_r3_08000__3b59);
  API_FE56();
                    /* WARNING: Could not recover jumptable at 0x3bd1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7B_r3_08000__3bf9 @ M7B_r3_08000::3bf9 =====

void __h3000 FUN_M7B_r3_08000__3bf9(undefined1 param_1,undefined1 param_2)

{
  API_FE74(param_1,param_2,&PTR_FUN_M7B_r3_08000__3c3e_M7B_r3_08000__3bd3);
  return;
}


// ===== FUN_M7B_r3_08000__3c05 @ M7B_r3_08000::3c05 =====

void __h3000 FUN_M7B_r3_08000__3c05(undefined1 param_1,undefined1 param_2)

{
                    /* desc[API_FE22]: ->$3C3E ->$3C1D */
                    /* inline[API_FE22]: $3510 39 */
  API_FE22(param_1,param_2,&PTR_FUN_M7B_r3_08000__3c3e_M7B_r3_08000__3bd3);
  return;
}


// ===== FUN_M7B_r3_08000__3c11 @ M7B_r3_08000::3c11 =====

void __h3000 FUN_M7B_r3_08000__3c11(undefined1 param_1,undefined1 param_2)

{
  API_FE70(param_1,param_2,&PTR_FUN_M7B_r3_08000__3c3e_M7B_r3_08000__3bd3);
  return;
}


// ===== FUN_M7B_r3_08000__3c1d @ M7B_r3_08000::3c1d =====

void __h3000 FUN_M7B_r3_08000__3c1d(undefined1 param_1,undefined1 param_2)

{
  API_FE72(param_1,param_2,&PTR_FUN_M7B_r3_08000__3c3e_M7B_r3_08000__3bd3);
  return;
}


// ===== FUN_M7B_r3_08000__3c3e @ M7B_r3_08000::3c3e =====

void __h3000
FUN_M7B_r3_08000__3c3e
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,&PTR_FUN_M7B_r3_08000__3c3e_M7B_r3_08000__3bd3);
  API_FE58();
                    /* WARNING: Could not recover jumptable at 0x3c4b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7B_r3_08000__3c73 @ M7B_r3_08000::3c73 =====

void __h3000 FUN_M7B_r3_08000__3c73(undefined1 param_1,undefined1 param_2)

{
  API_FC4E(param_1,param_2,PTR_ARRAY_M7B_r3_08000__3c4d);
  return;
}


// ===== FUN_M7B_r3_08000__3c7f @ M7B_r3_08000::3c7f =====

void __h3000 FUN_M7B_r3_08000__3c7f(undefined1 param_1,undefined1 param_2)

{
  API_FC4C(param_1,param_2,PTR_ARRAY_M7B_r3_08000__3c4d);
  return;
}


// ===== FUN_M7B_r3_08000__3c8b @ M7B_r3_08000::3c8b =====

void __h3000 FUN_M7B_r3_08000__3c8b(undefined1 param_1,undefined1 param_2)

{
  API_FC50(param_1,param_2,PTR_ARRAY_M7B_r3_08000__3c4d);
  return;
}


// ===== FUN_M7B_r3_08000__3c97 @ M7B_r3_08000::3c97 =====

void __h3000 FUN_M7B_r3_08000__3c97(undefined1 param_1,undefined1 param_2)

{
  API_FC52(param_1,param_2,PTR_ARRAY_M7B_r3_08000__3c4d);
  return;
}


// ===== FUN_M7B_r3_08000__3cb7 @ M7B_r3_08000::3cb7 =====

void __h3000
FUN_M7B_r3_08000__3cb7
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  API_FE76(param_1,param_2,PTR_ARRAY_M7B_r3_08000__3c4d);
                    /* WARNING: Could not recover jumptable at 0x3cc0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


// ===== FUN_M7B_r3_08000__3cca @ M7B_r3_08000::3cca =====

undefined2 __h3000 FUN_M7B_r3_08000__3cca(void)

{
  undefined2 uVar1;
  ushort uVar2;
  undefined *puVar3;
  undefined2 in_D;
  short sVar4;
  short *in_U;
  
  DAT_70d8 = *in_U;
  DAT_70dc = in_U[1];
  uVar2 = (DAT_70dc + 0x30) * 2 + g_moduleBase;
  puVar3 = &DAT_M7B_r3_08000__3d18;
  if (DAT_70d8 < 0 || uVar2 < 0xc2e8) {
    sVar4 = -DAT_70d8;
  }
  else {
    sVar4 = 100 - DAT_70d8;
    puVar3 = &DAT_M7B_r3_08000__3d1a;
  }
  sVar4 = CONCAT11((char)((ushort)sVar4 >> 8) << 1 | (byte)sVar4 >> 7,(byte)sVar4 << 1) +
          g_moduleBase;
  uVar1 = *(undefined2 *)(puVar3 + uVar2);
  DAT_70da = DAT_70d8;
  *(char *)((short)in_U + 3) = (char)uVar1;
  *(char *)(in_U + 1) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(&DAT_M7B_r3_08000__3dc4 + sVar4);
  *(char *)((short)in_U + 1) = (char)uVar1;
  *(char *)in_U = (char)((ushort)uVar1 >> 8);
  API_FCF2();
  return in_D;
}


// ===== FUN_M7B_r3_08000__3e95 @ M7B_r3_08000::3e95 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __h3000 FUN_M7B_r3_08000__3e95(void)

{
  undefined2 in_D;
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_70ea = 0;
  DAT_70ee = 0;
  DAT_70fc = 0;
  DAT_7100 = 0;
  DAT_7104 = 0;
  DAT_7108 = 0;
  DAT_710c = 0;
  DAT_7144 = 0;
  DAT_7148 = 0;
  DAT_714c = 0;
  DAT_7150 = 0;
  _DAT_7154 = 0;
  DAT_7158 = 0;
  DAT_715c = 0;
  DAT_7160 = 0;
  DAT_7166 = 0;
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
  DAT_71a6 = 0;
  DAT_71aa = 0;
  DAT_71ae = 0;
  DAT_71b2 = 0;
  DAT_71b6 = 0;
  DAT_71ba = 0;
  DAT_71be = 0;
  DAT_71c2 = 0;
  DAT_71c6 = 0;
  DAT_71ca = 0;
  DAT_71ce = 0;
  DAT_71d2 = 0;
  DAT_71d6 = 0;
  _DAT_71da = 0;
  _DAT_71de = 0;
  _DAT_71e2 = 0;
  _DAT_71e6 = 0;
  _DAT_71ea = 0;
  DAT_71ee = 0;
  _DAT_71f2 = 0;
  RAM0x71f6 = 0;
  _DAT_71fa = 0;
  _DAT_71fe = 0;
  _DAT_7202 = 0;
  _DAT_7206 = 0;
  _DAT_720a = 0;
  _DAT_720e = 0;
                    /* WARNING: Could not recover jumptable at 0x3f44. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)((char)((ushort)in_D >> 8));
  return;
}


// ===== FUN_M7B_r3_08000__3f46 @ M7B_r3_08000::3f46 =====

void __h3000
FUN_M7B_r3_08000__3f46
          (undefined1 param_1,undefined1 param_2,undefined2 param_3,undefined2 param_4,
          undefined2 param_5)

{
  code *UNRECOVERED_JUMPTABLE;
  
  FUN_M7B_r3_08000__1010();
  FUN_M7B_r3_08000__133d();
  FUN_M7B_r3_08000__170b();
  FUN_M7B_r3_08000__17a8();
  FUN_M7B_r3_08000__1862();
  FUN_M7B_r3_08000__1903();
  FUN_M7B_r3_08000__19a0();
  FUN_M7B_r3_08000__1b56();
  FUN_M7B_r3_08000__1bfd();
  FUN_M7B_r3_08000__1ca4();
  FUN_M7B_r3_08000__1d34();
  FUN_M7B_r3_08000__1dc4();
  FUN_M7B_r3_08000__1e50();
  FUN_M7B_r3_08000__1edc();
  FUN_M7B_r3_08000__1f63();
  FUN_M7B_r3_08000__1ffe();
  FUN_M7B_r3_08000__20bb();
  FUN_M7B_r3_08000__2167();
  FUN_M7B_r3_08000__220e();
  FUN_M7B_r3_08000__22b5();
  FUN_M7B_r3_08000__2356();
  FUN_M7B_r3_08000__23f7();
  FUN_M7B_r3_08000__2480();
  FUN_M7B_r3_08000__260a();
  FUN_M7B_r3_08000__26c9();
  FUN_M7B_r3_08000__2770();
  FUN_M7B_r3_08000__2828();
  FUN_M7B_r3_08000__28e0();
  FUN_M7B_r3_08000__298f();
  FUN_M7B_r3_08000__2a56();
  FUN_M7B_r3_08000__2aff();
  FUN_M7B_r3_08000__2b9e();
  FUN_M7B_r3_08000__2d12();
  FUN_M7B_r3_08000__2dfd();
  FUN_M7B_r3_08000__2ea2();
  FUN_M7B_r3_08000__3035();
  FUN_M7B_r3_08000__30be();
  FUN_M7B_r3_08000__3169();
  FUN_M7B_r3_08000__3208();
  FUN_M7B_r3_08000__329b();
  FUN_M7B_r3_08000__332e();
  FUN_M7B_r3_08000__33c1();
  FUN_M7B_r3_08000__346c();
  FUN_M7B_r3_08000__3512();
  FUN_M7B_r3_08000__35b8();
  FUN_M7B_r3_08000__365e();
  FUN_M7B_r3_08000__3704();
  FUN_M7B_r3_08000__37aa();
  FUN_M7B_r3_08000__3850();
  FUN_M7B_r3_08000__38f6();
  FUN_M7B_r3_08000__399c();
  FUN_M7B_r3_08000__3a42();
  FUN_M7B_r3_08000__3cb7();
                    /* WARNING: Could not recover jumptable at 0x3fe7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_2,param_3,param_4,param_5);
  return;
}


