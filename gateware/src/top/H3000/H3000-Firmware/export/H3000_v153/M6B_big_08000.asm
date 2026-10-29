; H3000_v153  block M6B_big_08000  M6B_big_08000::0000-M6B_big_08000::3fff
; Bank big_08000 (module id 6B)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 6B parameter/preset table "REVERB FACTORY", 88 bytes
MODULE_6B_TABLE_REVERB_FACTORY_hdr:
  0008  6B0000600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6B_TABLE_REVERB_FACTORY:
  0010  6B             ?? 6Bh    k                       
  0011  .db 01                                               ; .
  0012  524556455242.. ds "REVERB FACTORY "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 64 00 14 00 14 00  ; ..........d.....
  0044  .db 03 00 1E 00 40 00 80 00 80 FB 00 05 00 1E 14 FF  ; ....@...........
  0054  .db 05 81 06 65 07 27 07 E1 09 05 09 EF 01 02 00 FD  ; ...e.'..........
  0064  .db 01 02 00 FD                                      ; ....

;; Module 6B code record 01, 7011 bytes, entered at payload start
MODULE_6B_01_CODE_hdr:
  0068  6B011B6B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6B_01_entry
MODULE_6B_01_entry:
  0070  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0074
  0074  0074           dw 74h                            
LAB_M6B_big_08000__0076:
  0076  3477           PSHS  U Y X B A CC                
  0078  1A40           ORCC #0x40                        
  007a  3440           PSHS  U                           
  007c  CC1898         LDD #0x1898                       
  007f  F3600D         ADDD 0x600d                       
  0082  1F01           TFR D,X                           
  0084  CC18CB         LDD #0x18cb                       
  0087  F3600D         ADDD 0x600d                       
  008a  1F03           TFR D,U                           
  008c  108E6600       LDY #0x6600                       
  0090  AD9FFD08       JSR [0xfd08]                      
  0094  3540           PULS  U                           
  0096  C600           LDB #0x0                          
  0098  AD9FFC58       JSR [0xfc58]                      
  009c  C601           LDB #0x1                          
  009e  8E2810         LDX #0x2810                       
  00a1  AD9FFD30       JSR [0xfd30]                      
  00a5  10260278       LBNE 0x0321                       
  00a9  C602           LDB #0x2                          
  00ab  8E2811         LDX #0x2811                       
  00ae  AD9FFD30       JSR [0xfd30]                      
  00b2  1026026B       LBNE 0x0321                       
  00b6  C603           LDB #0x3                          
  00b8  8E2812         LDX #0x2812                       
  00bb  AD9FFD30       JSR [0xfd30]                      
  00bf  1026025E       LBNE 0x0321                       
  00c3  CC0000         LDD #0x0                          
  00c6  FD7002         STD 0x7002                        
  00c9  FD700A         STD 0x700a                        
  00cc  FD7012         STD 0x7012                        
  00cf  FD701A         STD 0x701a                        
  00d2  FD7022         STD 0x7022                        
  00d5  FD7008         STD 0x7008                        
  00d8  FD7010         STD 0x7010                        
  00db  CC0000         LDD #0x0                          
  00de  AD9FFC6C       JSR [0xfc6c]                      
  00e2  AD9FFC74       JSR [0xfc74]                      
  00e6  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 49:28 4A:2A 4B:2C
  00ea  49             db 49h                            
  00eb  28             db 28h                            
  00ec  4A             db 4Ah                            
  00ed  2A             db 2Ah                            
  00ee  4B             db 4Bh                            
  00ef  2C             db 2Ch                            
  00f0  00             db 0h                             
LAB_M6B_big_08000__00f1:
  00f1  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 58:3A 59:3C 5A:3E 5B:40 5C:42 5D:44 5E:46 5F:48
  00f5  58             db 58h                            
  00f6  3A             db 3Ah                            
  00f7  59             db 59h                            
  00f8  3C             db 3Ch                            
  00f9  5A             db 5Ah                            
  00fa  3E             db 3Eh                            
  00fb  5B             db 5Bh                            
  00fc  40             db 40h                            
  00fd  5C             db 5Ch                            
  00fe  42             db 42h                            
  00ff  5D             db 5Dh                            
  0100  44             db 44h                            
  0101  5E             db 5Eh                            
  0102  46             db 46h                            
  0103  5F             db 5Fh                            
  0104  48             db 48h                            
  0105  00             db 0h                             
LAB_M6B_big_08000__0106:
  0106  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 3B:18 3D:20 4C:2E 4E:30 50:32 52:34 54:36 56:38 35:00 3F:06
  010a  3B             db 3Bh                            
  010b  18             db 18h                            
  010c  3D             db 3Dh                            
  010d  20             db 20h                            
  010e  4C             db 4Ch                            
  010f  2E             db 2Eh                            
  0110  4E             db 4Eh                            
  0111  30             db 30h                            
  0112  50             db 50h                            
  0113  32             db 32h                            
  0114  52             db 52h                            
  0115  34             db 34h                            
  0116  54             db 54h                            
  0117  36             db 36h                            
  0118  56             db 56h                            
  0119  38             db 38h                            
  011a  35             db 35h                            
  011b  00             db 0h                             
  011c  3F             db 3Fh                            
  011d  06             db 6h                             
  011e  00             db 0h                             
LAB_M6B_big_08000__011f:
  011f  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 41:0E 43:16 47:26 45:1E
  0123  41             db 41h                            
  0124  0E             db Eh                             
  0125  43             db 43h                            
  0126  16             db 16h                            
  0127  47             db 47h                            
  0128  26             db 26h                            
  0129  45             db 45h                            
  012a  1E             db 1Eh                            
  012b  00             db 0h                             
LAB_M6B_big_08000__012c:
  012c  AD9FFD7C       JSR [0xfd7c]                      
  0130  171712         LBSR 0x1845                       
  0133  17139A         LBSR 0x14d0                       
  0136  .db 17                                               ; .
  0137  0738           ASR <0x38                         
  0139  170876         LBSR 0x09b2                       
  013c  170AA5         LBSR 0x0be4                       
  013f  170B86         LBSR 0x0cc8                       
  0142  170611         LBSR 0x0756                       
  0145  1704EB         LBSR 0x0633                       
  0148  170C59         LBSR 0x0da4                       
  014b  170D13         LBSR 0x0e61                       
  014e  170DC3         LBSR 0x0f14                       
  0151  170E73         LBSR 0x0fc7                       
  0154  170F30         LBSR 0x1087                       
  0157  170FEA         LBSR 0x1144                       
  015a  17109A         LBSR 0x11f7                       
  015d  17114A         LBSR 0x12aa                       
  0160  170980         LBSR 0x0ae3                       
  0163  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 37:08 39:10
  0167  37             db 37h                            
  0168  08             db 8h                             
  0169  39             db 39h                            
  016a  10             db 10h                            
  016b  00             db 0h                             
LAB_M6B_big_08000__016c:
  016c  170702         LBSR 0x0871                       
  016f  170840         LBSR 0x09b2                       
  0172  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " decay  " 21 $0797 $07A3
  0176  00             db 0h                             
  0177  80             db 80h                            
  0178  206465636179.. ds " decay  "                     
  0180  21             db 21h                            
  0181  0797           addr M6B_big_08000::0797          
  0183  07A3           addr M6B_big_08000::07a3          
LAB_M6B_big_08000__0185:
  0185  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "gate dec" 25 $08D8 $08E4
  0189  01             db 1h                             
  018a  80             db 80h                            
  018b  676174652064.. ds "gate dec"                     
  0193  25             db 25h                            
  0194  08D8           addr M6B_big_08000::08d8          
  0196  08E4           addr M6B_big_08000::08e4          
LAB_M6B_big_08000__0198:
  0198  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "gatetime" 29 $068B $0697
  019c  02             db 2h                             
  019d  80             db 80h                            
  019e  676174657469.. ds "gatetime"                     
  01a6  29             db 29h                            
  01a7  068B           addr M6B_big_08000::068b          
  01a9  0697           addr M6B_big_08000::0697          
LAB_M6B_big_08000__01ab:
  01ab  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "predelay" 2D $0568 $0574
  01af  03             db 3h                             
  01b0  80             db 80h                            
  01b1  70726564656C.. ds "predelay"                     
  01b9  2D             db 2Dh                            
  01ba  0568           addr M6B_big_08000::0568          
  01bc  0574           addr M6B_big_08000::0574          
LAB_M6B_big_08000__01be:
  01be  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "  mix   " 31 $1403 $140F
  01c2  04             db 4h                             
  01c3  80             db 80h                            
  01c4  20206D697820.. ds "  mix   "                     
  01cc  31             db 31h                            
  01cd  1403           addr M6B_big_08000::1403          
  01cf  140F           addr M6B_big_08000::140f          
LAB_M6B_big_08000__01d1:
  01d1  CC01FE         LDD #0x1fe                        
  01d4  FD60F5         STD 0x60f5                        
  01d7  CC002C         LDD #0x2c                         
  01da  47             ASRA                              
  01db  56             RORB                              
  01dc  FD60F7         STD 0x60f7                        
  01df  CC4E20         LDD #0x4e20                       
  01e2  AD9FFD20       JSR [0xfd20]                      
  01e6  AD9FFD76       JSR [0xfd76]                      
  01ea  1CBF           ANDCC #0xbf                       
  01ec  AD9FFDF6       JSR [0xfdf6]                      
  01f0  AD9FFE18       JSR [0xfe18]                      
  01f4  170160         LBSR 0x0357                       
  01f7  AD9FFE10       JSR [0xfe10]                      
  01fb  3577           PULS CC A B X Y U                 
  01fd  39             RTS                               
  01fe  022A02350240.. addr[22]                          

; ---- function FUN_M6B_big_08000__022a
FUN_M6B_big_08000__022a:
  022a  1711EE         LBSR 0x141b                       
  022d  170160         LBSR 0x0390                       
  0230  AD9FFE10       JSR [0xfe10]                      
  0234  39             RTS                               

; ---- function FUN_M6B_big_08000__0235
FUN_M6B_big_08000__0235:
  0235  170348         LBSR 0x0580                       
  0238  17011C         LBSR 0x0357                       
  023b  AD9FFE10       JSR [0xfe10]                      
  023f  39             RTS                               

; ---- function FUN_M6B_big_08000__0240
FUN_M6B_big_08000__0240:
  0240  17056C         LBSR 0x07af                       
  0243  170111         LBSR 0x0357                       
  0246  AD9FFE12       JSR [0xfe12]                      
  024a  39             RTS                               

; ---- function FUN_M6B_big_08000__024b
FUN_M6B_big_08000__024b:
  024b  1706A2         LBSR 0x08f0                       
  024e  170106         LBSR 0x0357                       
  0251  AD9FFE14       JSR [0xfe14]                      
  0255  39             RTS                               

; ---- function FUN_M6B_big_08000__0256
FUN_M6B_big_08000__0256:
  0256  17044A         LBSR 0x06a3                       
  0259  1700FB         LBSR 0x0357                       
  025c  AD9FFE16       JSR [0xfe16]                      
  0260  39             RTS                               

; ---- function FUN_M6B_big_08000__0261
FUN_M6B_big_08000__0261:
  0261  170A84         LBSR 0x0ce8                       
  0264  1701C6         LBSR 0x042d                       
  0267  AD9FFE10       JSR [0xfe10]                      
  026b  39             RTS                               

; ---- function FUN_M6B_big_08000__026c
FUN_M6B_big_08000__026c:
  026c  170BF6         LBSR 0x0e65                       
  026f  1701BB         LBSR 0x042d                       
  0272  AD9FFE12       JSR [0xfe12]                      
  0276  39             RTS                               

; ---- function FUN_M6B_big_08000__0277
FUN_M6B_big_08000__0277:
  0277  170B2E         LBSR 0x0da8                       
  027a  1701B0         LBSR 0x042d                       
  027d  AD9FFE14       JSR [0xfe14]                      
  0281  39             RTS                               

; ---- function FUN_M6B_big_08000__0282
FUN_M6B_big_08000__0282:
  0282  170C93         LBSR 0x0f18                       
  0285  1701A5         LBSR 0x042d                       
  0288  AD9FFE16       JSR [0xfe16]                      
  028c  39             RTS                               

; ---- function FUN_M6B_big_08000__028d
FUN_M6B_big_08000__028d:
  028d  170D3B         LBSR 0x0fcb                       
  0290  1701D3         LBSR 0x0466                       
  0293  AD9FFE10       JSR [0xfe10]                      
  0297  39             RTS                               

; ---- function FUN_M6B_big_08000__0298
FUN_M6B_big_08000__0298:
  0298  170EAD         LBSR 0x1148                       
  029b  1701C8         LBSR 0x0466                       
  029e  AD9FFE12       JSR [0xfe12]                      
  02a2  39             RTS                               

; ---- function FUN_M6B_big_08000__02a3
FUN_M6B_big_08000__02a3:
  02a3  170DE5         LBSR 0x108b                       
  02a6  1701BD         LBSR 0x0466                       
  02a9  AD9FFE14       JSR [0xfe14]                      
  02ad  39             RTS                               

; ---- function FUN_M6B_big_08000__02ae
FUN_M6B_big_08000__02ae:
  02ae  170F4A         LBSR 0x11fb                       
  02b1  1701B2         LBSR 0x0466                       
  02b4  AD9FFE16       JSR [0xfe16]                      
  02b8  39             RTS                               

; ---- function FUN_M6B_big_08000__02b9
FUN_M6B_big_08000__02b9:
  02b9  17095F         LBSR 0x0c1b                       
  02bc  170135         LBSR 0x03f4                       
  02bf  AD9FFE10       JSR [0xfe10]                      
  02c3  39             RTS                               

; ---- function FUN_M6B_big_08000__02c4
FUN_M6B_big_08000__02c4:
  02c4  170870         LBSR 0x0b37                       
  02c7  17012A         LBSR 0x03f4                       
  02ca  AD9FFE12       JSR [0xfe12]                      
  02ce  39             RTS                               

; ---- function FUN_M6B_big_08000__02cf
FUN_M6B_big_08000__02cf:
  02cf  170739         LBSR 0x0a0b                       
  02d2  17011F         LBSR 0x03f4                       
  02d5  AD9FFE14       JSR [0xfe14]                      
  02d9  39             RTS                               

; ---- function FUN_M6B_big_08000__02da
FUN_M6B_big_08000__02da:
  02da  170FD1         LBSR 0x12ae                       
  02dd  1701E3         LBSR 0x04c3                       
  02e0  AD9FFE10       JSR [0xfe10]                      
  02e4  39             RTS                               

; ---- function FUN_M6B_big_08000__02e5
FUN_M6B_big_08000__02e5:
  02e5  170FCD         LBSR 0x12b5                       
  02e8  1701D8         LBSR 0x04c3                       
  02eb  AD9FFE12       JSR [0xfe12]                      
  02ef  39             RTS                               

; ---- function FUN_M6B_big_08000__02f0
FUN_M6B_big_08000__02f0:
  02f0  170FC9         LBSR 0x12bc                       
  02f3  1701CD         LBSR 0x04c3                       
  02f6  AD9FFE14       JSR [0xfe14]                      
  02fa  39             RTS                               

; ---- function FUN_M6B_big_08000__02fb
FUN_M6B_big_08000__02fb:
  02fb  170FC5         LBSR 0x12c3                       
  02fe  1701C2         LBSR 0x04c3                       
  0301  AD9FFE16       JSR [0xfe16]                      
  0305  39             RTS                               

; ---- function FUN_M6B_big_08000__0306
FUN_M6B_big_08000__0306:
  0306  170FC1         LBSR 0x12ca                       
  0309  1701F0         LBSR 0x04fc                       
  030c  AD9FFE10       JSR [0xfe10]                      
  0310  39             RTS                               

; ---- function FUN_M6B_big_08000__0311
FUN_M6B_big_08000__0311:
  0311  170FBD         LBSR 0x12d1                       
  0314  1701E5         LBSR 0x04fc                       
  0317  AD9FFE12       JSR [0xfe12]                      
  031b  39             RTS                               

; ---- function FUN_M6B_big_08000__031c
FUN_M6B_big_08000__031c:
  031c  AD9FFDFC       JSR [0xfdfc]                      
  0320  39             RTS                               

; ---- function FUN_M6B_big_08000__0321
FUN_M6B_big_08000__0321:
  0321  C600           LDB #0x0                          
  0323  AD9FFC36       JSR [0xfc36]                      
  0327  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  032b  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M6B_big_08000__0354:
  0354  3577           PULS CC A B X Y U                 
  0356  39             RTS                               

; ---- function FUN_M6B_big_08000__0357
FUN_M6B_big_08000__0357:
  0357  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "predelay" "on decay" "offdecay" "gatetime"
  035b  70726564656C.. ds "predelay"                     
  0363  6F6E20646563.. ds "on decay"                     
  036b  6F6666646563.. ds "offdecay"                     
  0373  676174657469.. ds "gatetime"                     
LAB_M6B_big_08000__037b:
  037b  AD9FFDF2       JSR [0xfdf2]                      
  037f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$05A7 ->$07D6 ->$0917 ->$06CA ->$0390 ->$0390
  0383  05A7           addr M6B_big_08000::05a7          
  0385  07D6           addr M6B_big_08000::07d6          
  0387  0917           addr M6B_big_08000::0917          
  0389  06CA           addr M6B_big_08000::06ca          
  038b  0390           addr M6B_big_08000::0390          
  038d  0390           addr M6B_big_08000::0390          
LAB_M6B_big_08000__038f:
  038f  39             RTS                               

; ---- function FUN_M6B_big_08000__0390
FUN_M6B_big_08000__0390:
  0390  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [*] [*] " expert "
  0394  20206D697820.. ds "  mix   "                     
  039c  01             db 1h                             
  039d  01             db 1h                             
  039e  206578706572.. ds " expert "                     
LAB_M6B_big_08000__03a6:
  03a6  AD9FFDF2       JSR [0xfdf2]                      
  03aa  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1442 ->$0559 ->$0559 ->$03BB ->$0357 ->$0357
  03ae  1442           addr M6B_big_08000::1442          
  03b0  0559           addr M6B_big_08000::0559          
  03b2  0559           addr M6B_big_08000::0559          
  03b4  03BB           addr M6B_big_08000::03bb          
  03b6  0357           addr M6B_big_08000::0357          
  03b8  0357           addr M6B_big_08000::0357          
LAB_M6B_big_08000__03ba:
  03ba  39             RTS                               

; ---- function FUN_M6B_big_08000__03bb
FUN_M6B_big_08000__03bb:
  03bb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "   eq   " " gate   " " delays " " return "
  03bf  202020657120.. ds "   eq   "                     
  03c7  206761746520.. ds " gate   "                     
  03cf  2064656C6179.. ds " delays "                     
  03d7  207265747572.. ds " return "                     
LAB_M6B_big_08000__03df:
  03df  AD9FFDF2       JSR [0xfdf2]                      
  03e3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$042D ->$03F4 ->$04C3 ->$0390 ->$03BB ->$03BB
  03e7  042D           addr M6B_big_08000::042d          
  03e9  03F4           addr M6B_big_08000::03f4          
  03eb  04C3           addr M6B_big_08000::04c3          
  03ed  0390           addr M6B_big_08000::0390          
  03ef  03BB           addr M6B_big_08000::03bb          
  03f1  03BB           addr M6B_big_08000::03bb          
LAB_M6B_big_08000__03f3:
  03f3  39             RTS                               

; ---- function FUN_M6B_big_08000__03f4
FUN_M6B_big_08000__03f4:
  03f4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " speed  " " thresh " " enable " " return "
  03f8  207370656564.. ds " speed  "                     
  0400  207468726573.. ds " thresh "                     
  0408  20656E61626C.. ds " enable "                     
  0410  207265747572.. ds " return "                     
LAB_M6B_big_08000__0418:
  0418  AD9FFDF2       JSR [0xfdf2]                      
  041c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C3F ->$0B5B ->$0A2F ->$03BB ->$03F4 ->$03F4
  0420  0C3F           addr M6B_big_08000::0c3f          
  0422  0B5B           addr M6B_big_08000::0b5b          
  0424  0A2F           addr M6B_big_08000::0a2f          
  0426  03BB           addr M6B_big_08000::03bb          
  0428  03F4           addr M6B_big_08000::03f4          
  042a  03F4           addr M6B_big_08000::03f4          
LAB_M6B_big_08000__042c:
  042c  39             RTS                               

; ---- function FUN_M6B_big_08000__042d
FUN_M6B_big_08000__042d:
  042d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "on lfreq" "on lowdB" "on hfreq" "on  hidB"
  0431  6F6E206C6672.. ds "on lfreq"                     
  0439  6F6E206C6F77.. ds "on lowdB"                     
  0441  6F6E20686672.. ds "on hfreq"                     
  0449  6F6E20206869.. ds "on  hidB"                     
LAB_M6B_big_08000__0451:
  0451  AD9FFDF2       JSR [0xfdf2]                      
  0455  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D0C ->$0E89 ->$0DCC ->$0F3C ->$0466 ->$049F
  0459  0D0C           addr M6B_big_08000::0d0c          
  045b  0E89           addr M6B_big_08000::0e89          
  045d  0DCC           addr M6B_big_08000::0dcc          
  045f  0F3C           addr M6B_big_08000::0f3c          
  0461  0466           addr M6B_big_08000::0466          
  0463  049F           addr M6B_big_08000::049f          
LAB_M6B_big_08000__0465:
  0465  39             RTS                               

; ---- function FUN_M6B_big_08000__0466
FUN_M6B_big_08000__0466:
  0466  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "offlfreq" "offlowdB" "offhfreq" "off hidB"
  046a  6F66666C6672.. ds "offlfreq"                     
  0472  6F66666C6F77.. ds "offlowdB"                     
  047a  6F6666686672.. ds "offhfreq"                     
  0482  6F6666206869.. ds "off hidB"                     
LAB_M6B_big_08000__048a:
  048a  AD9FFDF2       JSR [0xfdf2]                      
  048e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0FEF ->$116C ->$10AF ->$121F ->$049F ->$042D
  0492  0FEF           addr M6B_big_08000::0fef          
  0494  116C           addr M6B_big_08000::116c          
  0496  10AF           addr M6B_big_08000::10af          
  0498  121F           addr M6B_big_08000::121f          
  049a  049F           addr M6B_big_08000::049f          
  049c  042D           addr M6B_big_08000::042d          
LAB_M6B_big_08000__049e:
  049e  39             RTS                               

; ---- function FUN_M6B_big_08000__049f
FUN_M6B_big_08000__049f:
  049f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  04a3  01             db 1h                             
  04a4  01             db 1h                             
  04a5  01             db 1h                             
  04a6  207265747572.. ds " return "                     
LAB_M6B_big_08000__04ae:
  04ae  AD9FFDF2       JSR [0xfdf2]                      
  04b2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0559 ->$0559 ->$0559 ->$03BB ->$042D ->$0466
  04b6  0559           addr M6B_big_08000::0559          
  04b8  0559           addr M6B_big_08000::0559          
  04ba  0559           addr M6B_big_08000::0559          
  04bc  03BB           addr M6B_big_08000::03bb          
  04be  042D           addr M6B_big_08000::042d          
  04c0  0466           addr M6B_big_08000::0466          
LAB_M6B_big_08000__04c2:
  04c2  39             RTS                               

; ---- function FUN_M6B_big_08000__04c3
FUN_M6B_big_08000__04c3:
  04c3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 "
  04c7  64656C617920.. ds "delay 1 "                     
  04cf  64656C617920.. ds "delay 2 "                     
  04d7  64656C617920.. ds "delay 3 "                     
  04df  64656C617920.. ds "delay 4 "                     
LAB_M6B_big_08000__04e7:
  04e7  AD9FFDF2       JSR [0xfdf2]                      
  04eb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1304 ->$130E ->$1318 ->$1322 ->$04FC ->$04FC
  04ef  1304           addr M6B_big_08000::1304          
  04f1  130E           addr M6B_big_08000::130e          
  04f3  1318           addr M6B_big_08000::1318          
  04f5  1322           addr M6B_big_08000::1322          
  04f7  04FC           addr M6B_big_08000::04fc          
  04f9  04FC           addr M6B_big_08000::04fc          
LAB_M6B_big_08000__04fb:
  04fb  39             RTS                               

; ---- function FUN_M6B_big_08000__04fc
FUN_M6B_big_08000__04fc:
  04fc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 5 " "delay 6 " [*] " return "
  0500  64656C617920.. ds "delay 5 "                     
  0508  64656C617920.. ds "delay 6 "                     
  0510  01             db 1h                             
  0511  207265747572.. ds " return "                     
LAB_M6B_big_08000__0519:
  0519  AD9FFDF2       JSR [0xfdf2]                      
  051d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$132C ->$1336 ->$0559 ->$03BB ->$04C3 ->$04C3
  0521  132C           addr M6B_big_08000::132c          
  0523  1336           addr M6B_big_08000::1336          
  0525  0559           addr M6B_big_08000::0559          
  0527  03BB           addr M6B_big_08000::03bb          
  0529  04C3           addr M6B_big_08000::04c3          
  052b  04C3           addr M6B_big_08000::04c3          
LAB_M6B_big_08000__052d:
  052d  39             RTS                               

; ---- function FUN_M6B_big_08000__052e
FUN_M6B_big_08000__052e:
  052e  C633           LDB #0x33                         
  0530  AD9FFC36       JSR [0xfc36]                      
  0534  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range  "
  0538  2072616E6765.. char[9] " range  "                
LAB_M6B_big_08000__0541:
  0541  C63D           LDB #0x3d                         
  0543  AD9FFC36       JSR [0xfc36]                      
  0547  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "perclick"
  054b  706572636C69.. char[9] "perclick"                
LAB_M6B_big_08000__0554:
  0554  AD9FFDF2       JSR [0xfdf2]                      
  0558  39             RTS                               

; ---- function FUN_M6B_big_08000__0559
FUN_M6B_big_08000__0559:
  0559  39             RTS                               
PTR_FUN_M6B_big_08000__061e_M6B_big_08000__055a:
  055a  061E           addr M6B_big_08000::061e          
  055c  0633           addr M6B_big_08000::0633          
  055e  7020           addr 7020                         
  0560  .db 00 47 EC 00 14 00 00 04                          ; .G......

; ---- function FUN_M6B_big_08000__0568
FUN_M6B_big_08000__0568:
  0568  3410           PSHS  X                           
  056a  8E055A         LDX #0x55a                         ; desc[API_FE1C]: ->$061E ->$0633 $7020
  056d  AD9FFE1C       JSR [0xfe1c]                      
  0571  3510           PULS  X                           
  0573  39             RTS                               

; ---- function FUN_M6B_big_08000__0574
FUN_M6B_big_08000__0574:
  0574  3410           PSHS  X                           
  0576  8E055A         LDX #0x55a                         ; desc[API_FE1A]: ->$061E ->$0633 $7020
  0579  AD9FFE1A       JSR [0xfe1a]                      
  057d  3510           PULS  X                           
  057f  39             RTS                               

; ---- function FUN_M6B_big_08000__0580
FUN_M6B_big_08000__0580:
  0580  3426           PSHS  Y B A                       
  0582  AD9FFC8E       JSR [0xfc8e]                      
  0586  FC60F9         LDD 0x60f9                        
  0589  FD6074         STD 0x6074                        
  058c  B37022         SUBD 0x7022                       
  058f  FD7020         STD 0x7020                        
  0592  17009E         LBSR 0x0633                       
  0595  CC0045         LDD #0x45                         
  0598  830008         SUBD #0x8                         
  059b  1F02           TFR D,Y                           
  059d  FC7020         LDD 0x7020                        
  05a0  AD9FFC82       JSR [0xfc82]                      
  05a4  3526           PULS  A B Y                       
  05a6  39             RTS                               

; ---- function FUN_M6B_big_08000__05a7
FUN_M6B_big_08000__05a7:
  05a7  3406           PSHS  B A                         
  05a9  FC7024         LDD 0x7024                        
  05ac  FD6074         STD 0x6074                        
  05af  17FD6A         LBSR 0x031c                       
  05b2  C613           LDB #0x13                         
  05b4  AD9FFC36       JSR [0xfc36]                      
  05b8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " predelay =        mS"
  05bc  0A7072656465.. char[22] "\npredelay =        mS" 
LAB_M6B_big_08000__05d2:
  05d2  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $01F4 $0000 $0000 ->$061E ->$05F4 $0001 $0001 $0000
  05d6  01             db 1h                             
  05d7  01             db 1h                             
  05d8  02             db 2h                             
  05d9  01             db 1h                             
  05da  01             db 1h                             
  05db  00             db 0h                             
  05dc  03             db 3h                             
  05dd  80             db 80h                            
  05de  01F4           dw 1F4h                           
  05e0  0000           dw 0h                             
  05e2  0000           dw 0h                             
  05e4  061E           addr M6B_big_08000::061e          
  05e6  05F4           addr M6B_big_08000::05f4          
  05e8  0001           dw 1h                             
  05ea  0001           dw 1h                             
  05ec  0000           dw 0h                             
LAB_M6B_big_08000__05ee:
  05ee  17002D         LBSR 0x061e                       
  05f1  3506           PULS  A B                         
  05f3  39             RTS                               

; ---- function FUN_M6B_big_08000__05f4
FUN_M6B_big_08000__05f4:
  05f4  3426           PSHS  Y B A                       
  05f6  FC6074         LDD 0x6074                        
  05f9  B37022         SUBD 0x7022                       
  05fc  FD7020         STD 0x7020                        
  05ff  CC0045         LDD #0x45                         
  0602  830008         SUBD #0x8                         
  0605  1F02           TFR D,Y                           
  0607  FC7020         LDD 0x7020                        
  060a  AD9FFC82       JSR [0xfc82]                      
  060e  108E0001       LDY #0x1                          
  0612  FC7020         LDD 0x7020                        
  0615  AD9FFE40       JSR [0xfe40]                      
  0619  8D18           BSR 0x0633                        
  061b  3526           PULS  A B Y                       
  061d  39             RTS                               

; ---- function FUN_M6B_big_08000__061e
FUN_M6B_big_08000__061e:
  061e  3456           PSHS  U X B A                     
  0620  C61F           LDB #0x1f                         
  0622  AD9FFC36       JSR [0xfc36]                      
  0626  CC0003         LDD #0x3                          
  0629  8E60A0         LDX #0x60a0                       
  062c  AD9FFC3A       JSR [0xfc3a]                      
  0630  3556           PULS  A B X U                     
  0632  39             RTS                               

; ---- function FUN_M6B_big_08000__0633
FUN_M6B_big_08000__0633:
  0633  3476           PSHS  U Y X B A                   
  0635  CC0000         LDD #0x0                          
  0638  3606           PSHU  B A                         
  063a  CC01F4         LDD #0x1f4                        
  063d  3606           PSHU  B A                         
  063f  FC7020         LDD 0x7020                        
  0642  F37022         ADDD 0x7022                       
  0645  3606           PSHU  B A                         
  0647  AD9FFCD8       JSR [0xfcd8]                      
  064b  3706           PULU  A B                         
  064d  FD7024         STD 0x7024                        
  0650  FC7024         LDD 0x7024                        
  0653  3606           PSHU  B A                         
  0655  CC002C         LDD #0x2c                         
  0658  3606           PSHU  B A                         
  065a  AD9FFCF0       JSR [0xfcf0]                      
  065e  3706           PULU  A B                         
  0660  3706           PULU  A B                         
  0662  C30001         ADDD #0x1                         
  0665  FD707E         STD 0x707e                        
  0668  CC000A         LDD #0xa                          
  066b  AD9FFD20       JSR [0xfd20]                      
  066f  108E0451       LDY #0x451                        
  0673  FC707E         LDD 0x707e                        
  0676  AD9FFD2E       JSR [0xfd2e]                      
  067a  3576           PULS  A B X Y U                   
  067c  39             RTS                               
PTR_FUN_M6B_big_08000__0741_M6B_big_08000__067d:
  067d  0741           addr M6B_big_08000::0741          
  067f  0756           addr M6B_big_08000::0756          
  0681  7018           addr 7018                         
  0683  .db 00 45 F6 00 0A 00 01 04                          ; .E......

; ---- function FUN_M6B_big_08000__068b
FUN_M6B_big_08000__068b:
  068b  3410           PSHS  X                           
  068d  8E067D         LDX #0x67d                         ; desc[API_FE1C]: ->$0741 ->$0756 $7018
  0690  AD9FFE1C       JSR [0xfe1c]                      
  0694  3510           PULS  X                           
  0696  39             RTS                               

; ---- function FUN_M6B_big_08000__0697
FUN_M6B_big_08000__0697:
  0697  3410           PSHS  X                           
  0699  8E067D         LDX #0x67d                         ; desc[API_FE1A]: ->$0741 ->$0756 $7018
  069c  AD9FFE1A       JSR [0xfe1a]                      
  06a0  3510           PULS  X                           
  06a2  39             RTS                               

; ---- function FUN_M6B_big_08000__06a3
FUN_M6B_big_08000__06a3:
  06a3  3426           PSHS  Y B A                       
  06a5  AD9FFC8E       JSR [0xfc8e]                      
  06a9  FC60F9         LDD 0x60f9                        
  06ac  FD6074         STD 0x6074                        
  06af  B3701A         SUBD 0x701a                       
  06b2  FD7018         STD 0x7018                        
  06b5  17009E         LBSR 0x0756                       
  06b8  CC0043         LDD #0x43                         
  06bb  830008         SUBD #0x8                         
  06be  1F02           TFR D,Y                           
  06c0  FC7018         LDD 0x7018                        
  06c3  AD9FFC82       JSR [0xfc82]                      
  06c7  3526           PULS  A B Y                       
  06c9  39             RTS                               

; ---- function FUN_M6B_big_08000__06ca
FUN_M6B_big_08000__06ca:
  06ca  3406           PSHS  B A                         
  06cc  FC701C         LDD 0x701c                        
  06cf  FD6074         STD 0x6074                        
  06d2  17FC47         LBSR 0x031c                       
  06d5  C613           LDB #0x13                         
  06d7  AD9FFC36       JSR [0xfc36]                      
  06db  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " gate time:       sec"
  06df  0A6761746520.. char[22] "\ngate time:       sec" 
LAB_M6B_big_08000__06f5:
  06f5  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 04 80 $00FA $0000 $0000 ->$0741 ->$0717 $0001 $0001 $0000
  06f9  01             db 1h                             
  06fa  01             db 1h                             
  06fb  02             db 2h                             
  06fc  01             db 1h                             
  06fd  01             db 1h                             
  06fe  01             db 1h                             
  06ff  04             db 4h                             
  0700  80             db 80h                            
  0701  00FA           dw FAh                            
  0703  0000           dw 0h                             
  0705  0000           dw 0h                             
  0707  0741           addr M6B_big_08000::0741          
  0709  0717           addr M6B_big_08000::0717          
  070b  0001           dw 1h                             
  070d  0001           dw 1h                             
  070f  0000           dw 0h                             
LAB_M6B_big_08000__0711:
  0711  17002D         LBSR 0x0741                       
  0714  3506           PULS  A B                         
  0716  39             RTS                               

; ---- function FUN_M6B_big_08000__0717
FUN_M6B_big_08000__0717:
  0717  3426           PSHS  Y B A                       
  0719  FC6074         LDD 0x6074                        
  071c  B3701A         SUBD 0x701a                       
  071f  FD7018         STD 0x7018                        
  0722  CC0043         LDD #0x43                         
  0725  830008         SUBD #0x8                         
  0728  1F02           TFR D,Y                           
  072a  FC7018         LDD 0x7018                        
  072d  AD9FFC82       JSR [0xfc82]                      
  0731  108E0004       LDY #0x4                          
  0735  FC7018         LDD 0x7018                        
  0738  AD9FFE40       JSR [0xfe40]                      
  073c  8D18           BSR 0x0756                        
  073e  3526           PULS  A B Y                       
  0740  39             RTS                               

; ---- function FUN_M6B_big_08000__0741
FUN_M6B_big_08000__0741:
  0741  3456           PSHS  U X B A                     
  0743  C61F           LDB #0x1f                         
  0745  AD9FFC36       JSR [0xfc36]                      
  0749  CC0004         LDD #0x4                          
  074c  8E609F         LDX #0x609f                       
  074f  AD9FFC3A       JSR [0xfc3a]                      
  0753  3556           PULS  A B X U                     
  0755  39             RTS                               

; ---- function FUN_M6B_big_08000__0756
FUN_M6B_big_08000__0756:
  0756  3476           PSHS  U Y X B A                   
  0758  CC0000         LDD #0x0                          
  075b  3606           PSHU  B A                         
  075d  CC00FA         LDD #0xfa                         
  0760  3606           PSHU  B A                         
  0762  FC7018         LDD 0x7018                        
  0765  F3701A         ADDD 0x701a                       
  0768  3606           PSHU  B A                         
  076a  AD9FFCD8       JSR [0xfcd8]                      
  076e  3706           PULU  A B                         
  0770  FD701C         STD 0x701c                        
  0773  FC701C         LDD 0x701c                        
  0776  3606           PSHU  B A                         
  0778  CC0044         LDD #0x44                         
  077b  3606           PSHU  B A                         
  077d  AD9FFCEE       JSR [0xfcee]                      
  0781  3706           PULU  A B                         
  0783  FD7062         STD 0x7062                        
  0786  3576           PULS  A B X Y U                   
  0788  39             RTS                               
PTR_FUN_M6B_big_08000__084f_M6B_big_08000__0789:
  0789  084F           addr M6B_big_08000::084f          
  078b  0871           addr M6B_big_08000::0871          
  078d  7008           addr 7008                         
  078f  .db 00 41 FE 00 02 00 00 04                          ; .A......

; ---- function FUN_M6B_big_08000__0797
FUN_M6B_big_08000__0797:
  0797  3410           PSHS  X                           
  0799  8E0789         LDX #0x789                         ; desc[API_FE1C]: ->$084F ->$0871 $7008
  079c  AD9FFE1C       JSR [0xfe1c]                      
  07a0  3510           PULS  X                           
  07a2  39             RTS                               

; ---- function FUN_M6B_big_08000__07a3
FUN_M6B_big_08000__07a3:
  07a3  3410           PSHS  X                           
  07a5  8E0789         LDX #0x789                         ; desc[API_FE1A]: ->$084F ->$0871 $7008
  07a8  AD9FFE1A       JSR [0xfe1a]                      
  07ac  3510           PULS  X                           
  07ae  39             RTS                               

; ---- function FUN_M6B_big_08000__07af
FUN_M6B_big_08000__07af:
  07af  3426           PSHS  Y B A                       
  07b1  AD9FFC8E       JSR [0xfc8e]                      
  07b5  FC60F9         LDD 0x60f9                        
  07b8  FD6074         STD 0x6074                        
  07bb  B3700A         SUBD 0x700a                       
  07be  FD7008         STD 0x7008                        
  07c1  1700AD         LBSR 0x0871                       
  07c4  CC003F         LDD #0x3f                         
  07c7  830008         SUBD #0x8                         
  07ca  1F02           TFR D,Y                           
  07cc  FC7008         LDD 0x7008                        
  07cf  AD9FFC82       JSR [0xfc82]                      
  07d3  3526           PULS  A B Y                       
  07d5  39             RTS                               

; ---- function FUN_M6B_big_08000__07d6
FUN_M6B_big_08000__07d6:
  07d6  3406           PSHS  B A                         
  07d8  FC700C         LDD 0x700c                        
  07db  FD6074         STD 0x6074                        
  07de  17FB3B         LBSR 0x031c                       
  07e1  C613           LDB #0x13                         
  07e3  AD9FFC36       JSR [0xfc36]                      
  07e7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " decay open:     sec "
  07eb  0A6465636179.. char[22] "\ndecay open:     sec " 
LAB_M6B_big_08000__0801:
  0801  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $004A $0000 $0000 ->$084F ->$0823 $0001 $0001 $0000
  0805  01             db 1h                             
  0806  01             db 1h                             
  0807  02             db 2h                             
  0808  01             db 1h                             
  0809  01             db 1h                             
  080a  00             db 0h                             
  080b  02             db 2h                             
  080c  80             db 80h                            
  080d  004A           dw 4Ah                            
  080f  0000           dw 0h                             
  0811  0000           dw 0h                             
  0813  084F           addr M6B_big_08000::084f          
  0815  0823           addr M6B_big_08000::0823          
  0817  0001           dw 1h                             
  0819  0001           dw 1h                             
  081b  0000           dw 0h                             
LAB_M6B_big_08000__081d:
  081d  17002F         LBSR 0x084f                       
  0820  3506           PULS  A B                         
  0822  39             RTS                               

; ---- function FUN_M6B_big_08000__0823
FUN_M6B_big_08000__0823:
  0823  3426           PSHS  Y B A                       
  0825  FC6074         LDD 0x6074                        
  0828  B3700A         SUBD 0x700a                       
  082b  FD7008         STD 0x7008                        
  082e  CC003F         LDD #0x3f                         
  0831  830008         SUBD #0x8                         
  0834  1F02           TFR D,Y                           
  0836  FC7008         LDD 0x7008                        
  0839  AD9FFC82       JSR [0xfc82]                      
  083d  108E0002       LDY #0x2                          
  0841  FC7008         LDD 0x7008                        
  0844  AD9FFE40       JSR [0xfe40]                      
  0848  8D27           BSR 0x0871                        
  084a  8D03           BSR 0x084f                        
  084c  3526           PULS  A B Y                       
  084e  39             RTS                               

; ---- function FUN_M6B_big_08000__084f
FUN_M6B_big_08000__084f:
  084f  3456           PSHS  U X B A                     
  0851  C620           LDB #0x20                         
  0853  AD9FFC36       JSR [0xfc36]                      
  0857  FC700C         LDD 0x700c                        
  085a  F3700C         ADDD 0x700c                       
  085d  F3700C         ADDD 0x700c                       
  0860  C31A5C         ADDD #0x1a5c                      
  0863  F3600D         ADDD 0x600d                       
  0866  1F01           TFR D,X                           
  0868  C603           LDB #0x3                          
  086a  AD9FFC3A       JSR [0xfc3a]                      
  086e  3556           PULS  A B X U                     
  0870  39             RTS                               

; ---- function FUN_M6B_big_08000__0871
FUN_M6B_big_08000__0871:
  0871  3476           PSHS  U Y X B A                   
  0873  CC0000         LDD #0x0                          
  0876  3606           PSHU  B A                         
  0878  CC004A         LDD #0x4a                         
  087b  3606           PSHU  B A                         
  087d  FC7008         LDD 0x7008                        
  0880  F3700A         ADDD 0x700a                       
  0883  3606           PSHU  B A                         
  0885  AD9FFCD8       JSR [0xfcd8]                      
  0889  3706           PULU  A B                         
  088b  FD700C         STD 0x700c                        
  088e  FC700C         LDD 0x700c                        
  0891  F3700C         ADDD 0x700c                       
  0894  C31B3D         ADDD #0x1b3d                      
  0897  F3600D         ADDD 0x600d                       
  089a  1F01           TFR D,X                           
  089c  EC84           LDD ,X                            
  089e  FD705E         STD 0x705e                        
  08a1  170C6F         LBSR 0x1513                       
  08a4  FC705E         LDD 0x705e                        
  08a7  10B37060       CMPD 0x7060                       
  08ab  102D0018       LBLT 0x08c7                       
  08af  CC727B         LDD #0x727b                       
  08b2  FD707E         STD 0x707e                        
  08b5  CC000A         LDD #0xa                          
  08b8  AD9FFD20       JSR [0xfd20]                      
  08bc  108E0242       LDY #0x242                        
  08c0  FC707E         LDD 0x707e                        
  08c3  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6B_big_08000__08c7:
  08c7  3576           PULS  A B X Y U                   
  08c9  39             RTS                               
PTR_FUN_M6B_big_08000__0990_M6B_big_08000__08ca:
  08ca  0990           addr M6B_big_08000::0990          
  08cc  09B2           addr M6B_big_08000::09b2          
  08ce  7010           addr 7010                         
  08d0  .db 00 43 FE 00 02 00 00 04                          ; .C......

; ---- function FUN_M6B_big_08000__08d8
FUN_M6B_big_08000__08d8:
  08d8  3410           PSHS  X                           
  08da  8E08CA         LDX #0x8ca                         ; desc[API_FE1C]: ->$0990 ->$09B2 $7010
  08dd  AD9FFE1C       JSR [0xfe1c]                      
  08e1  3510           PULS  X                           
  08e3  39             RTS                               

; ---- function FUN_M6B_big_08000__08e4
FUN_M6B_big_08000__08e4:
  08e4  3410           PSHS  X                           
  08e6  8E08CA         LDX #0x8ca                         ; desc[API_FE1A]: ->$0990 ->$09B2 $7010
  08e9  AD9FFE1A       JSR [0xfe1a]                      
  08ed  3510           PULS  X                           
  08ef  39             RTS                               

; ---- function FUN_M6B_big_08000__08f0
FUN_M6B_big_08000__08f0:
  08f0  3426           PSHS  Y B A                       
  08f2  AD9FFC8E       JSR [0xfc8e]                      
  08f6  FC60F9         LDD 0x60f9                        
  08f9  FD6074         STD 0x6074                        
  08fc  B37012         SUBD 0x7012                       
  08ff  FD7010         STD 0x7010                        
  0902  1700AD         LBSR 0x09b2                       
  0905  CC0041         LDD #0x41                         
  0908  830008         SUBD #0x8                         
  090b  1F02           TFR D,Y                           
  090d  FC7010         LDD 0x7010                        
  0910  AD9FFC82       JSR [0xfc82]                      
  0914  3526           PULS  A B Y                       
  0916  39             RTS                               

; ---- function FUN_M6B_big_08000__0917
FUN_M6B_big_08000__0917:
  0917  3406           PSHS  B A                         
  0919  FC7014         LDD 0x7014                        
  091c  FD6074         STD 0x6074                        
  091f  17F9FA         LBSR 0x031c                       
  0922  C613           LDB #0x13                         
  0924  AD9FFC36       JSR [0xfc36]                      
  0928  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " decay close:     sec"
  092c  0A6465636179.. char[22] "\ndecay close:     sec" 
LAB_M6B_big_08000__0942:
  0942  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $004A $0000 $0000 ->$0990 ->$0964 $0001 $0001 $0000
  0946  01             db 1h                             
  0947  01             db 1h                             
  0948  02             db 2h                             
  0949  01             db 1h                             
  094a  01             db 1h                             
  094b  00             db 0h                             
  094c  03             db 3h                             
  094d  80             db 80h                            
  094e  004A           dw 4Ah                            
  0950  0000           dw 0h                             
  0952  0000           dw 0h                             
  0954  0990           addr M6B_big_08000::0990          
  0956  0964           addr M6B_big_08000::0964          
  0958  0001           dw 1h                             
  095a  0001           dw 1h                             
  095c  0000           dw 0h                             
LAB_M6B_big_08000__095e:
  095e  17002F         LBSR 0x0990                       
  0961  3506           PULS  A B                         
  0963  39             RTS                               

; ---- function FUN_M6B_big_08000__0964
FUN_M6B_big_08000__0964:
  0964  3426           PSHS  Y B A                       
  0966  FC6074         LDD 0x6074                        
  0969  B37012         SUBD 0x7012                       
  096c  FD7010         STD 0x7010                        
  096f  CC0041         LDD #0x41                         
  0972  830008         SUBD #0x8                         
  0975  1F02           TFR D,Y                           
  0977  FC7010         LDD 0x7010                        
  097a  AD9FFC82       JSR [0xfc82]                      
  097e  108E0003       LDY #0x3                          
  0982  FC7010         LDD 0x7010                        
  0985  AD9FFE40       JSR [0xfe40]                      
  0989  8D27           BSR 0x09b2                        
  098b  8D03           BSR 0x0990                        
  098d  3526           PULS  A B Y                       
  098f  39             RTS                               

; ---- function FUN_M6B_big_08000__0990
FUN_M6B_big_08000__0990:
  0990  3456           PSHS  U X B A                     
  0992  C621           LDB #0x21                         
  0994  AD9FFC36       JSR [0xfc36]                      
  0998  FC7014         LDD 0x7014                        
  099b  F37014         ADDD 0x7014                       
  099e  F37014         ADDD 0x7014                       
  09a1  C31A5C         ADDD #0x1a5c                      
  09a4  F3600D         ADDD 0x600d                       
  09a7  1F01           TFR D,X                           
  09a9  C603           LDB #0x3                          
  09ab  AD9FFC3A       JSR [0xfc3a]                      
  09af  3556           PULS  A B X U                     
  09b1  39             RTS                               

; ---- function FUN_M6B_big_08000__09b2
FUN_M6B_big_08000__09b2:
  09b2  3476           PSHS  U Y X B A                   
  09b4  CC0000         LDD #0x0                          
  09b7  3606           PSHU  B A                         
  09b9  CC004A         LDD #0x4a                         
  09bc  3606           PSHU  B A                         
  09be  FC7010         LDD 0x7010                        
  09c1  F37012         ADDD 0x7012                       
  09c4  3606           PSHU  B A                         
  09c6  AD9FFCD8       JSR [0xfcd8]                      
  09ca  3706           PULU  A B                         
  09cc  FD7014         STD 0x7014                        
  09cf  FC7014         LDD 0x7014                        
  09d2  F37014         ADDD 0x7014                       
  09d5  C31B3D         ADDD #0x1b3d                      
  09d8  F3600D         ADDD 0x600d                       
  09db  1F01           TFR D,X                           
  09dd  EC84           LDD ,X                            
  09df  FD7060         STD 0x7060                        
  09e2  170C97         LBSR 0x167c                       
  09e5  FC7060         LDD 0x7060                        
  09e8  10B3705E       CMPD 0x705e                       
  09ec  102D0018       LBLT 0x0a08                       
  09f0  CC727B         LDD #0x727b                       
  09f3  FD707E         STD 0x707e                        
  09f6  CC000A         LDD #0xa                          
  09f9  AD9FFD20       JSR [0xfd20]                      
  09fd  108E0242       LDY #0x242                        
  0a01  FC707E         LDD 0x707e                        
  0a04  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6B_big_08000__0a08:
  0a08  3576           PULS  A B X Y U                   
  0a0a  39             RTS                               

; ---- function FUN_M6B_big_08000__0a0b
FUN_M6B_big_08000__0a0b:
  0a0b  3426           PSHS  Y B A                       
  0a0d  AD9FFC8E       JSR [0xfc8e]                      
  0a11  FC60F9         LDD 0x60f9                        
  0a14  FD702C         STD 0x702c                        
  0a17  FD6074         STD 0x6074                        
  0a1a  1700C6         LBSR 0x0ae3                       
  0a1d  CC0053         LDD #0x53                         
  0a20  830008         SUBD #0x8                         
  0a23  1F02           TFR D,Y                           
  0a25  FC702C         LDD 0x702c                        
  0a28  AD9FFC80       JSR [0xfc80]                      
  0a2c  3526           PULS  A B Y                       
  0a2e  39             RTS                               

; ---- function FUN_M6B_big_08000__0a2f
FUN_M6B_big_08000__0a2f:
  0a2f  3406           PSHS  B A                         
  0a31  FC702C         LDD 0x702c                        
  0a34  FD6074         STD 0x6074                        
  0a37  17F8E2         LBSR 0x031c                       
  0a3a  C613           LDB #0x13                         
  0a3c  AD9FFC36       JSR [0xfc36]                      
  0a40  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "     "
  0a44  0A2020202000   char[6] "\n    "                  
LAB_M6B_big_08000__0a4a:
  0a4a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$0A93 ->$0A6C $0001 $0001 $0000
  0a4e  01             db 1h                             
  0a4f  01             db 1h                             
  0a50  02             db 2h                             
  0a51  01             db 1h                             
  0a52  01             db 1h                             
  0a53  00             db 0h                             
  0a54  02             db 2h                             
  0a55  80             db 80h                            
  0a56  0000           dw 0h                             
  0a58  FFFF           dw FFFFh                          
  0a5a  0000           dw 0h                             
  0a5c  0A93           addr M6B_big_08000::0a93          
  0a5e  0A6C           addr M6B_big_08000::0a6c          
  0a60  0001           dw 1h                             
  0a62  0001           dw 1h                             
  0a64  0000           dw 0h                             
LAB_M6B_big_08000__0a66:
  0a66  17002A         LBSR 0x0a93                       
  0a69  3506           PULS  A B                         
  0a6b  39             RTS                               

; ---- function FUN_M6B_big_08000__0a6c
FUN_M6B_big_08000__0a6c:
  0a6c  3426           PSHS  Y B A                       
  0a6e  FC6074         LDD 0x6074                        
  0a71  FD702C         STD 0x702c                        
  0a74  CC0053         LDD #0x53                         
  0a77  830008         SUBD #0x8                         
  0a7a  1F02           TFR D,Y                           
  0a7c  FC702C         LDD 0x702c                        
  0a7f  AD9FFC80       JSR [0xfc80]                      
  0a83  108E000F       LDY #0xf                          
  0a87  FC702C         LDD 0x702c                        
  0a8a  AD9FFE40       JSR [0xfe40]                      
  0a8e  8D53           BSR 0x0ae3                        
  0a90  3526           PULS  A B Y                       
  0a92  39             RTS                               

; ---- function FUN_M6B_big_08000__0a93
FUN_M6B_big_08000__0a93:
  0a93  3456           PSHS  U X B A                     
  0a95  FC702C         LDD 0x702c                        
  0a98  10830000       CMPD #0x0                         
  0a9c  10270021       LBEQ 0x0ac1                       
  0aa0  C614           LDB #0x14                         
  0aa2  AD9FFC36       JSR [0xfc36]                      
  0aa6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "gate is disabled    "
  0aaa  676174652069.. char[21] "gate is disabled    "   
LAB_M6B_big_08000__0abf:
  0abf  201F           BRA 0x0ae0                        
LAB_M6B_big_08000__0ac1:
  0ac1  C614           LDB #0x14                         
  0ac3  AD9FFC36       JSR [0xfc36]                      
  0ac7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "gate is enabled     "
  0acb  676174652069.. char[21] "gate is enabled     "   
LAB_M6B_big_08000__0ae0:
  0ae0  3556           PULS  A B X U                     
  0ae2  39             RTS                               

; ---- function FUN_M6B_big_08000__0ae3
FUN_M6B_big_08000__0ae3:
  0ae3  3476           PSHS  U Y X B A                   
  0ae5  FC702C         LDD 0x702c                        
  0ae8  10830000       CMPD #0x0                         
  0aec  10270023       LBEQ 0x0b13                       
  0af0  CC0559         LDD #0x559                        
  0af3  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  0af7  6097           addr 6097                         
LAB_M6B_big_08000__0af9:
  0af9  CC000A         LDD #0xa                          
  0afc  AD9FFD20       JSR [0xfd20]                      
  0b00  108E054A       LDY #0x54a                        
  0b04  CC0000         LDD #0x0                          
  0b07  AD9FFD2E       JSR [0xfd2e]                      
  0b0b  CC0000         LDD #0x0                          
  0b0e  FD7094         STD 0x7094                        
  0b11  2021           BRA 0x0b34                        
LAB_M6B_big_08000__0b13:
  0b13  CC18CB         LDD #0x18cb                       
  0b16  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  0b1a  6097           addr 6097                         
LAB_M6B_big_08000__0b1c:
  0b1c  CC000A         LDD #0xa                          
  0b1f  AD9FFD20       JSR [0xfd20]                      
  0b23  108E054A       LDY #0x54a                        
  0b27  CCFFFF         LDD #0xffff                       
  0b2a  AD9FFD2E       JSR [0xfd2e]                      
  0b2e  CCFFFF         LDD #0xffff                       
  0b31  FD7094         STD 0x7094                        
LAB_M6B_big_08000__0b34:
  0b34  3576           PULS  A B X Y U                   
  0b36  39             RTS                               

; ---- function FUN_M6B_big_08000__0b37
FUN_M6B_big_08000__0b37:
  0b37  3426           PSHS  Y B A                       
  0b39  AD9FFC8E       JSR [0xfc8e]                      
  0b3d  FC60F9         LDD 0x60f9                        
  0b40  FD7028         STD 0x7028                        
  0b43  FD6074         STD 0x6074                        
  0b46  17009B         LBSR 0x0be4                       
  0b49  CC0051         LDD #0x51                         
  0b4c  830008         SUBD #0x8                         
  0b4f  1F02           TFR D,Y                           
  0b51  FC7028         LDD 0x7028                        
  0b54  AD9FFC80       JSR [0xfc80]                      
  0b58  3526           PULS  A B Y                       
  0b5a  39             RTS                               

; ---- function FUN_M6B_big_08000__0b5b
FUN_M6B_big_08000__0b5b:
  0b5b  3406           PSHS  B A                         
  0b5d  FC7028         LDD 0x7028                        
  0b60  FD6074         STD 0x6074                        
  0b63  17F7B6         LBSR 0x031c                       
  0b66  C613           LDB #0x13                         
  0b68  AD9FFC36       JSR [0xfc36]                      
  0b6c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " gate threshold:    %"
  0b70  0A6761746520.. char[22] "\ngate threshold:    %" 
LAB_M6B_big_08000__0b86:
  0b86  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0001 $0000 ->$0BCF ->$0BA8 $0001 $0001 $0000
  0b8a  01             db 1h                             
  0b8b  01             db 1h                             
  0b8c  02             db 2h                             
  0b8d  01             db 1h                             
  0b8e  01             db 1h                             
  0b8f  00             db 0h                             
  0b90  03             db 3h                             
  0b91  80             db 80h                            
  0b92  0064           dw 64h                            
  0b94  0001           dw 1h                             
  0b96  0000           dw 0h                             
  0b98  0BCF           addr M6B_big_08000::0bcf          
  0b9a  0BA8           addr M6B_big_08000::0ba8          
  0b9c  0001           dw 1h                             
  0b9e  0001           dw 1h                             
  0ba0  0000           dw 0h                             
LAB_M6B_big_08000__0ba2:
  0ba2  17002A         LBSR 0x0bcf                       
  0ba5  3506           PULS  A B                         
  0ba7  39             RTS                               

; ---- function FUN_M6B_big_08000__0ba8
FUN_M6B_big_08000__0ba8:
  0ba8  3426           PSHS  Y B A                       
  0baa  FC6074         LDD 0x6074                        
  0bad  FD7028         STD 0x7028                        
  0bb0  CC0051         LDD #0x51                         
  0bb3  830008         SUBD #0x8                         
  0bb6  1F02           TFR D,Y                           
  0bb8  FC7028         LDD 0x7028                        
  0bbb  AD9FFC80       JSR [0xfc80]                      
  0bbf  108E000E       LDY #0xe                          
  0bc3  FC7028         LDD 0x7028                        
  0bc6  AD9FFE40       JSR [0xfe40]                      
  0bca  8D18           BSR 0x0be4                        
  0bcc  3526           PULS  A B Y                       
  0bce  39             RTS                               

; ---- function FUN_M6B_big_08000__0bcf
FUN_M6B_big_08000__0bcf:
  0bcf  3456           PSHS  U X B A                     
  0bd1  C623           LDB #0x23                         
  0bd3  AD9FFC36       JSR [0xfc36]                      
  0bd7  CC0003         LDD #0x3                          
  0bda  8E60A0         LDX #0x60a0                       
  0bdd  AD9FFC3A       JSR [0xfc3a]                      
  0be1  3556           PULS  A B X U                     
  0be3  39             RTS                               

; ---- function FUN_M6B_big_08000__0be4
FUN_M6B_big_08000__0be4:
  0be4  3440           PSHS  U                           
  0be6  FC7028         LDD 0x7028                        
  0be9  3606           PSHU  B A                         
  0beb  CC67AD         LDD #0x67ad                       
  0bee  3606           PSHU  B A                         
  0bf0  AD9FFCF2       JSR [0xfcf2]                      
  0bf4  3706           PULU  A B                         
  0bf6  F37028         ADDD 0x7028                       
  0bf9  3606           PSHU  B A                         
  0bfb  3606           PSHU  B A                         
  0bfd  AD9FFCEE       JSR [0xfcee]                      
  0c01  3706           PULU  A B                         
  0c03  FD707E         STD 0x707e                        
  0c06  CC000A         LDD #0xa                          
  0c09  AD9FFD20       JSR [0xfd20]                      
  0c0d  108E0240       LDY #0x240                        
  0c11  FC707E         LDD 0x707e                        
  0c14  AD9FFD2E       JSR [0xfd2e]                      
  0c18  3540           PULS  U                           
  0c1a  39             RTS                               

; ---- function FUN_M6B_big_08000__0c1b
FUN_M6B_big_08000__0c1b:
  0c1b  3426           PSHS  Y B A                       
  0c1d  AD9FFC8E       JSR [0xfc8e]                      
  0c21  FC60F9         LDD 0x60f9                        
  0c24  FD702A         STD 0x702a                        
  0c27  FD6074         STD 0x6074                        
  0c2a  17009B         LBSR 0x0cc8                       
  0c2d  CC0052         LDD #0x52                         
  0c30  830008         SUBD #0x8                         
  0c33  1F02           TFR D,Y                           
  0c35  FC702A         LDD 0x702a                        
  0c38  AD9FFC80       JSR [0xfc80]                      
  0c3c  3526           PULS  A B Y                       
  0c3e  39             RTS                               

; ---- function FUN_M6B_big_08000__0c3f
FUN_M6B_big_08000__0c3f:
  0c3f  3406           PSHS  B A                         
  0c41  FC702A         LDD 0x702a                        
  0c44  FD6074         STD 0x6074                        
  0c47  17F6D2         LBSR 0x031c                       
  0c4a  C613           LDB #0x13                         
  0c4c  AD9FFC36       JSR [0xfc36]                      
  0c50  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " gate speed:         "
  0c54  0A6761746520.. char[22] "\ngate speed:         " 
LAB_M6B_big_08000__0c6a:
  0c6a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$0CB3 ->$0C8C $0001 $0001 $0000
  0c6e  01             db 1h                             
  0c6f  01             db 1h                             
  0c70  02             db 2h                             
  0c71  01             db 1h                             
  0c72  01             db 1h                             
  0c73  00             db 0h                             
  0c74  03             db 3h                             
  0c75  80             db 80h                            
  0c76  0064           dw 64h                            
  0c78  0000           dw 0h                             
  0c7a  0000           dw 0h                             
  0c7c  0CB3           addr M6B_big_08000::0cb3          
  0c7e  0C8C           addr M6B_big_08000::0c8c          
  0c80  0001           dw 1h                             
  0c82  0001           dw 1h                             
  0c84  0000           dw 0h                             
LAB_M6B_big_08000__0c86:
  0c86  17002A         LBSR 0x0cb3                       
  0c89  3506           PULS  A B                         
  0c8b  39             RTS                               

; ---- function FUN_M6B_big_08000__0c8c
FUN_M6B_big_08000__0c8c:
  0c8c  3426           PSHS  Y B A                       
  0c8e  FC6074         LDD 0x6074                        
  0c91  FD702A         STD 0x702a                        
  0c94  CC0052         LDD #0x52                         
  0c97  830008         SUBD #0x8                         
  0c9a  1F02           TFR D,Y                           
  0c9c  FC702A         LDD 0x702a                        
  0c9f  AD9FFC80       JSR [0xfc80]                      
  0ca3  108E000D       LDY #0xd                          
  0ca7  FC702A         LDD 0x702a                        
  0caa  AD9FFE40       JSR [0xfe40]                      
  0cae  8D18           BSR 0x0cc8                        
  0cb0  3526           PULS  A B Y                       
  0cb2  39             RTS                               

; ---- function FUN_M6B_big_08000__0cb3
FUN_M6B_big_08000__0cb3:
  0cb3  3456           PSHS  U X B A                     
  0cb5  C620           LDB #0x20                         
  0cb7  AD9FFC36       JSR [0xfc36]                      
  0cbb  CC0003         LDD #0x3                          
  0cbe  8E60A0         LDX #0x60a0                       
  0cc1  AD9FFC3A       JSR [0xfc3a]                      
  0cc5  3556           PULS  A B X U                     
  0cc7  39             RTS                               

; ---- function FUN_M6B_big_08000__0cc8
FUN_M6B_big_08000__0cc8:
  0cc8  3440           PSHS  U                           
  0cca  CC7FFF         LDD #0x7fff                       
  0ccd  B3702A         SUBD 0x702a                       
  0cd0  FD707E         STD 0x707e                        
  0cd3  CC000A         LDD #0xa                          
  0cd6  AD9FFD20       JSR [0xfd20]                      
  0cda  108E0241       LDY #0x241                        
  0cde  FC707E         LDD 0x707e                        
  0ce1  AD9FFD2E       JSR [0xfd2e]                      
  0ce5  3540           PULS  U                           
  0ce7  39             RTS                               

; ---- function FUN_M6B_big_08000__0ce8
FUN_M6B_big_08000__0ce8:
  0ce8  3426           PSHS  Y B A                       
  0cea  AD9FFC8E       JSR [0xfc8e]                      
  0cee  FC60F9         LDD 0x60f9                        
  0cf1  FD703A         STD 0x703a                        
  0cf4  FD6074         STD 0x6074                        
  0cf7  1700AA         LBSR 0x0da4                       
  0cfa  CC0060         LDD #0x60                         
  0cfd  830008         SUBD #0x8                         
  0d00  1F02           TFR D,Y                           
  0d02  FC703A         LDD 0x703a                        
  0d05  AD9FFC80       JSR [0xfc80]                      
  0d09  3526           PULS  A B Y                       
  0d0b  39             RTS                               

; ---- function FUN_M6B_big_08000__0d0c
FUN_M6B_big_08000__0d0c:
  0d0c  3406           PSHS  B A                         
  0d0e  FC703A         LDD 0x703a                        
  0d11  FD6074         STD 0x6074                        
  0d14  17F605         LBSR 0x031c                       
  0d17  C613           LDB #0x13                         
  0d19  AD9FFC36       JSR [0xfc36]                      
  0d1d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " on low freq:     Hz "
  0d21  0A6F6E206C6F.. char[22] "\non low freq:     Hz " 
LAB_M6B_big_08000__0d37:
  0d37  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$0D82 ->$0D59 $0001 $0001 $0000
  0d3b  01             db 1h                             
  0d3c  01             db 1h                             
  0d3d  02             db 2h                             
  0d3e  01             db 1h                             
  0d3f  01             db 1h                             
  0d40  00             db 0h                             
  0d41  01             db 1h                             
  0d42  80             db 80h                            
  0d43  0003           dw 3h                             
  0d45  0000           dw 0h                             
  0d47  0000           dw 0h                             
  0d49  0D82           addr M6B_big_08000::0d82          
  0d4b  0D59           addr M6B_big_08000::0d59          
  0d4d  0001           dw 1h                             
  0d4f  0001           dw 1h                             
  0d51  0000           dw 0h                             
LAB_M6B_big_08000__0d53:
  0d53  17002C         LBSR 0x0d82                       
  0d56  3506           PULS  A B                         
  0d58  39             RTS                               

; ---- function FUN_M6B_big_08000__0d59
FUN_M6B_big_08000__0d59:
  0d59  3426           PSHS  Y B A                       
  0d5b  FC6074         LDD 0x6074                        
  0d5e  FD703A         STD 0x703a                        
  0d61  CC0060         LDD #0x60                         
  0d64  830008         SUBD #0x8                         
  0d67  1F02           TFR D,Y                           
  0d69  FC703A         LDD 0x703a                        
  0d6c  AD9FFC80       JSR [0xfc80]                      
  0d70  108E0005       LDY #0x5                          
  0d74  FC703A         LDD 0x703a                        
  0d77  AD9FFE40       JSR [0xfe40]                      
  0d7b  8D27           BSR 0x0da4                        
  0d7d  8D03           BSR 0x0d82                        
  0d7f  3526           PULS  A B Y                       
  0d81  39             RTS                               

; ---- function FUN_M6B_big_08000__0d82
FUN_M6B_big_08000__0d82:
  0d82  3456           PSHS  U X B A                     
  0d84  C621           LDB #0x21                         
  0d86  AD9FFC36       JSR [0xfc36]                      
  0d8a  FC703A         LDD 0x703a                        
  0d8d  F3703A         ADDD 0x703a                       
  0d90  F3703A         ADDD 0x703a                       
  0d93  C318E8         ADDD #0x18e8                      
  0d96  F3600D         ADDD 0x600d                       
  0d99  1F01           TFR D,X                           
  0d9b  C603           LDB #0x3                          
  0d9d  AD9FFC3A       JSR [0xfc3a]                      
  0da1  3556           PULS  A B X U                     
  0da3  39             RTS                               

; ---- function FUN_M6B_big_08000__0da4
FUN_M6B_big_08000__0da4:
  0da4  17076C         LBSR 0x1513                       
  0da7  39             RTS                               

; ---- function FUN_M6B_big_08000__0da8
FUN_M6B_big_08000__0da8:
  0da8  3426           PSHS  Y B A                       
  0daa  AD9FFC8E       JSR [0xfc8e]                      
  0dae  FC60F9         LDD 0x60f9                        
  0db1  FD703C         STD 0x703c                        
  0db4  FD6074         STD 0x6074                        
  0db7  1700A7         LBSR 0x0e61                       
  0dba  CC0061         LDD #0x61                         
  0dbd  830008         SUBD #0x8                         
  0dc0  1F02           TFR D,Y                           
  0dc2  FC703C         LDD 0x703c                        
  0dc5  AD9FFC80       JSR [0xfc80]                      
  0dc9  3526           PULS  A B Y                       
  0dcb  39             RTS                               

; ---- function FUN_M6B_big_08000__0dcc
FUN_M6B_big_08000__0dcc:
  0dcc  3406           PSHS  B A                         
  0dce  FC703C         LDD 0x703c                        
  0dd1  FD6074         STD 0x6074                        
  0dd4  17F545         LBSR 0x031c                       
  0dd7  C613           LDB #0x13                         
  0dd9  AD9FFC36       JSR [0xfc36]                      
  0ddd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " on hi freq:     kHz "
  0de1  0A6F6E206869.. char[22] "\non hi freq:     kHz " 
LAB_M6B_big_08000__0df7:
  0df7  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$0E42 ->$0E19 $0001 $0001 $0000
  0dfb  01             db 1h                             
  0dfc  01             db 1h                             
  0dfd  02             db 2h                             
  0dfe  01             db 1h                             
  0dff  01             db 1h                             
  0e00  00             db 0h                             
  0e01  01             db 1h                             
  0e02  80             db 80h                            
  0e03  0003           dw 3h                             
  0e05  0000           dw 0h                             
  0e07  0000           dw 0h                             
  0e09  0E42           addr M6B_big_08000::0e42          
  0e0b  0E19           addr M6B_big_08000::0e19          
  0e0d  0001           dw 1h                             
  0e0f  0001           dw 1h                             
  0e11  0000           dw 0h                             
LAB_M6B_big_08000__0e13:
  0e13  17002C         LBSR 0x0e42                       
  0e16  3506           PULS  A B                         
  0e18  39             RTS                               

; ---- function FUN_M6B_big_08000__0e19
FUN_M6B_big_08000__0e19:
  0e19  3426           PSHS  Y B A                       
  0e1b  FC6074         LDD 0x6074                        
  0e1e  FD703C         STD 0x703c                        
  0e21  CC0061         LDD #0x61                         
  0e24  830008         SUBD #0x8                         
  0e27  1F02           TFR D,Y                           
  0e29  FC703C         LDD 0x703c                        
  0e2c  AD9FFC80       JSR [0xfc80]                      
  0e30  108E0007       LDY #0x7                          
  0e34  FC703C         LDD 0x703c                        
  0e37  AD9FFE40       JSR [0xfe40]                      
  0e3b  8D24           BSR 0x0e61                        
  0e3d  8D03           BSR 0x0e42                        
  0e3f  3526           PULS  A B Y                       
  0e41  39             RTS                               

; ---- function FUN_M6B_big_08000__0e42
FUN_M6B_big_08000__0e42:
  0e42  3456           PSHS  U X B A                     
  0e44  C620           LDB #0x20                         
  0e46  AD9FFC36       JSR [0xfc36]                      
  0e4a  FC703C         LDD 0x703c                        
  0e4d  F3703C         ADDD 0x703c                       
  0e50  C318F4         ADDD #0x18f4                      
  0e53  F3600D         ADDD 0x600d                       
  0e56  1F01           TFR D,X                           
  0e58  C602           LDB #0x2                          
  0e5a  AD9FFC3A       JSR [0xfc3a]                      
  0e5e  3556           PULS  A B X U                     
  0e60  39             RTS                               

; ---- function FUN_M6B_big_08000__0e61
FUN_M6B_big_08000__0e61:
  0e61  1706AF         LBSR 0x1513                       
  0e64  39             RTS                               

; ---- function FUN_M6B_big_08000__0e65
FUN_M6B_big_08000__0e65:
  0e65  3426           PSHS  Y B A                       
  0e67  AD9FFC8E       JSR [0xfc8e]                      
  0e6b  FC60F9         LDD 0x60f9                        
  0e6e  FD703E         STD 0x703e                        
  0e71  FD6074         STD 0x6074                        
  0e74  17009D         LBSR 0x0f14                       
  0e77  CC0062         LDD #0x62                         
  0e7a  830008         SUBD #0x8                         
  0e7d  1F02           TFR D,Y                           
  0e7f  FC703E         LDD 0x703e                        
  0e82  AD9FFC80       JSR [0xfc80]                      
  0e86  3526           PULS  A B Y                       
  0e88  39             RTS                               

; ---- function FUN_M6B_big_08000__0e89
FUN_M6B_big_08000__0e89:
  0e89  3406           PSHS  B A                         
  0e8b  FC703E         LDD 0x703e                        
  0e8e  FD6074         STD 0x6074                        
  0e91  17F488         LBSR 0x031c                       
  0e94  C613           LDB #0x13                         
  0e96  AD9FFC36       JSR [0xfc36]                      
  0e9a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " on lf atten:    dB  "
  0e9e  0A6F6E206C66.. char[22] "\non lf atten:    dB  " 
LAB_M6B_big_08000__0eb4:
  0eb4  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$0EFF ->$0ED6 $0001 $0001 $0000
  0eb8  01             db 1h                             
  0eb9  01             db 1h                             
  0eba  02             db 2h                             
  0ebb  01             db 1h                             
  0ebc  01             db 1h                             
  0ebd  00             db 0h                             
  0ebe  02             db 2h                             
  0ebf  80             db 80h                            
  0ec0  0000           dw 0h                             
  0ec2  FFFA           dw FFFAh                          
  0ec4  0000           dw 0h                             
  0ec6  0EFF           addr M6B_big_08000::0eff          
  0ec8  0ED6           addr M6B_big_08000::0ed6          
  0eca  0001           dw 1h                             
  0ecc  0001           dw 1h                             
  0ece  0000           dw 0h                             
LAB_M6B_big_08000__0ed0:
  0ed0  17002C         LBSR 0x0eff                       
  0ed3  3506           PULS  A B                         
  0ed5  39             RTS                               

; ---- function FUN_M6B_big_08000__0ed6
FUN_M6B_big_08000__0ed6:
  0ed6  3426           PSHS  Y B A                       
  0ed8  FC6074         LDD 0x6074                        
  0edb  FD703E         STD 0x703e                        
  0ede  CC0062         LDD #0x62                         
  0ee1  830008         SUBD #0x8                         
  0ee4  1F02           TFR D,Y                           
  0ee6  FC703E         LDD 0x703e                        
  0ee9  AD9FFC80       JSR [0xfc80]                      
  0eed  108E0006       LDY #0x6                          
  0ef1  FC703E         LDD 0x703e                        
  0ef4  AD9FFE40       JSR [0xfe40]                      
  0ef8  8D1A           BSR 0x0f14                        
  0efa  8D03           BSR 0x0eff                        
  0efc  3526           PULS  A B Y                       
  0efe  39             RTS                               

; ---- function FUN_M6B_big_08000__0eff
FUN_M6B_big_08000__0eff:
  0eff  3456           PSHS  U X B A                     
  0f01  C621           LDB #0x21                         
  0f03  AD9FFC36       JSR [0xfc36]                      
  0f07  CC0002         LDD #0x2                          
  0f0a  8E60A1         LDX #0x60a1                       
  0f0d  AD9FFC3A       JSR [0xfc3a]                      
  0f11  3556           PULS  A B X U                     
  0f13  39             RTS                               

; ---- function FUN_M6B_big_08000__0f14
FUN_M6B_big_08000__0f14:
  0f14  1705FC         LBSR 0x1513                       
  0f17  39             RTS                               

; ---- function FUN_M6B_big_08000__0f18
FUN_M6B_big_08000__0f18:
  0f18  3426           PSHS  Y B A                       
  0f1a  AD9FFC8E       JSR [0xfc8e]                      
  0f1e  FC60F9         LDD 0x60f9                        
  0f21  FD7040         STD 0x7040                        
  0f24  FD6074         STD 0x6074                        
  0f27  17009D         LBSR 0x0fc7                       
  0f2a  CC0063         LDD #0x63                         
  0f2d  830008         SUBD #0x8                         
  0f30  1F02           TFR D,Y                           
  0f32  FC7040         LDD 0x7040                        
  0f35  AD9FFC80       JSR [0xfc80]                      
  0f39  3526           PULS  A B Y                       
  0f3b  39             RTS                               

; ---- function FUN_M6B_big_08000__0f3c
FUN_M6B_big_08000__0f3c:
  0f3c  3406           PSHS  B A                         
  0f3e  FC7040         LDD 0x7040                        
  0f41  FD6074         STD 0x6074                        
  0f44  17F3D5         LBSR 0x031c                       
  0f47  C613           LDB #0x13                         
  0f49  AD9FFC36       JSR [0xfc36]                      
  0f4d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " on hf atten:    dB  "
  0f51  0A6F6E206866.. char[22] "\non hf atten:    dB  " 
LAB_M6B_big_08000__0f67:
  0f67  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$0FB2 ->$0F89 $0001 $0001 $0000
  0f6b  01             db 1h                             
  0f6c  01             db 1h                             
  0f6d  02             db 2h                             
  0f6e  01             db 1h                             
  0f6f  01             db 1h                             
  0f70  00             db 0h                             
  0f71  02             db 2h                             
  0f72  80             db 80h                            
  0f73  0000           dw 0h                             
  0f75  FFFA           dw FFFAh                          
  0f77  0000           dw 0h                             
  0f79  0FB2           addr M6B_big_08000::0fb2          
  0f7b  0F89           addr M6B_big_08000::0f89          
  0f7d  0001           dw 1h                             
  0f7f  0001           dw 1h                             
  0f81  0000           dw 0h                             
LAB_M6B_big_08000__0f83:
  0f83  17002C         LBSR 0x0fb2                       
  0f86  3506           PULS  A B                         
  0f88  39             RTS                               

; ---- function FUN_M6B_big_08000__0f89
FUN_M6B_big_08000__0f89:
  0f89  3426           PSHS  Y B A                       
  0f8b  FC6074         LDD 0x6074                        
  0f8e  FD7040         STD 0x7040                        
  0f91  CC0063         LDD #0x63                         
  0f94  830008         SUBD #0x8                         
  0f97  1F02           TFR D,Y                           
  0f99  FC7040         LDD 0x7040                        
  0f9c  AD9FFC80       JSR [0xfc80]                      
  0fa0  108E0008       LDY #0x8                          
  0fa4  FC7040         LDD 0x7040                        
  0fa7  AD9FFE40       JSR [0xfe40]                      
  0fab  8D1A           BSR 0x0fc7                        
  0fad  8D03           BSR 0x0fb2                        
  0faf  3526           PULS  A B Y                       
  0fb1  39             RTS                               

; ---- function FUN_M6B_big_08000__0fb2
FUN_M6B_big_08000__0fb2:
  0fb2  3456           PSHS  U X B A                     
  0fb4  C621           LDB #0x21                         
  0fb6  AD9FFC36       JSR [0xfc36]                      
  0fba  CC0002         LDD #0x2                          
  0fbd  8E60A1         LDX #0x60a1                       
  0fc0  AD9FFC3A       JSR [0xfc3a]                      
  0fc4  3556           PULS  A B X U                     
  0fc6  39             RTS                               

; ---- function FUN_M6B_big_08000__0fc7
FUN_M6B_big_08000__0fc7:
  0fc7  170549         LBSR 0x1513                       
  0fca  39             RTS                               

; ---- function FUN_M6B_big_08000__0fcb
FUN_M6B_big_08000__0fcb:
  0fcb  3426           PSHS  Y B A                       
  0fcd  AD9FFC8E       JSR [0xfc8e]                      
  0fd1  FC60F9         LDD 0x60f9                        
  0fd4  FD7042         STD 0x7042                        
  0fd7  FD6074         STD 0x6074                        
  0fda  1700AA         LBSR 0x1087                       
  0fdd  CC0064         LDD #0x64                         
  0fe0  830008         SUBD #0x8                         
  0fe3  1F02           TFR D,Y                           
  0fe5  FC7042         LDD 0x7042                        
  0fe8  AD9FFC80       JSR [0xfc80]                      
  0fec  3526           PULS  A B Y                       
  0fee  39             RTS                               

; ---- function FUN_M6B_big_08000__0fef
FUN_M6B_big_08000__0fef:
  0fef  3406           PSHS  B A                         
  0ff1  FC7042         LDD 0x7042                        
  0ff4  FD6074         STD 0x6074                        
  0ff7  17F322         LBSR 0x031c                       
  0ffa  C613           LDB #0x13                         
  0ffc  AD9FFC36       JSR [0xfc36]                      
  1000  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " off low freq:     Hz"
  1004  0A6F6666206C.. char[22] "\noff low freq:     Hz" 
LAB_M6B_big_08000__101a:
  101a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$1065 ->$103C $0001 $0001 $0000
  101e  01             db 1h                             
  101f  01             db 1h                             
  1020  02             db 2h                             
  1021  01             db 1h                             
  1022  01             db 1h                             
  1023  00             db 0h                             
  1024  01             db 1h                             
  1025  80             db 80h                            
  1026  0003           dw 3h                             
  1028  0000           dw 0h                             
  102a  0000           dw 0h                             
  102c  1065           addr M6B_big_08000::1065          
  102e  103C           addr M6B_big_08000::103c          
  1030  0001           dw 1h                             
  1032  0001           dw 1h                             
  1034  0000           dw 0h                             
LAB_M6B_big_08000__1036:
  1036  17002C         LBSR 0x1065                       
  1039  3506           PULS  A B                         
  103b  39             RTS                               

; ---- function FUN_M6B_big_08000__103c
FUN_M6B_big_08000__103c:
  103c  3426           PSHS  Y B A                       
  103e  FC6074         LDD 0x6074                        
  1041  FD7042         STD 0x7042                        
  1044  CC0064         LDD #0x64                         
  1047  830008         SUBD #0x8                         
  104a  1F02           TFR D,Y                           
  104c  FC7042         LDD 0x7042                        
  104f  AD9FFC80       JSR [0xfc80]                      
  1053  108E0009       LDY #0x9                          
  1057  FC7042         LDD 0x7042                        
  105a  AD9FFE40       JSR [0xfe40]                      
  105e  8D27           BSR 0x1087                        
  1060  8D03           BSR 0x1065                        
  1062  3526           PULS  A B Y                       
  1064  39             RTS                               

; ---- function FUN_M6B_big_08000__1065
FUN_M6B_big_08000__1065:
  1065  3456           PSHS  U X B A                     
  1067  C622           LDB #0x22                         
  1069  AD9FFC36       JSR [0xfc36]                      
  106d  FC7042         LDD 0x7042                        
  1070  F37042         ADDD 0x7042                       
  1073  F37042         ADDD 0x7042                       
  1076  C318E8         ADDD #0x18e8                      
  1079  F3600D         ADDD 0x600d                       
  107c  1F01           TFR D,X                           
  107e  C603           LDB #0x3                          
  1080  AD9FFC3A       JSR [0xfc3a]                      
  1084  3556           PULS  A B X U                     
  1086  39             RTS                               

; ---- function FUN_M6B_big_08000__1087
FUN_M6B_big_08000__1087:
  1087  1705F2         LBSR 0x167c                       
  108a  39             RTS                               

; ---- function FUN_M6B_big_08000__108b
FUN_M6B_big_08000__108b:
  108b  3426           PSHS  Y B A                       
  108d  AD9FFC8E       JSR [0xfc8e]                      
  1091  FC60F9         LDD 0x60f9                        
  1094  FD7044         STD 0x7044                        
  1097  FD6074         STD 0x6074                        
  109a  1700A7         LBSR 0x1144                       
  109d  CC0065         LDD #0x65                         
  10a0  830008         SUBD #0x8                         
  10a3  1F02           TFR D,Y                           
  10a5  FC7044         LDD 0x7044                        
  10a8  AD9FFC80       JSR [0xfc80]                      
  10ac  3526           PULS  A B Y                       
  10ae  39             RTS                               

; ---- function FUN_M6B_big_08000__10af
FUN_M6B_big_08000__10af:
  10af  3406           PSHS  B A                         
  10b1  FC7044         LDD 0x7044                        
  10b4  FD6074         STD 0x6074                        
  10b7  17F262         LBSR 0x031c                       
  10ba  C613           LDB #0x13                         
  10bc  AD9FFC36       JSR [0xfc36]                      
  10c0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " off hi freq:    kHz "
  10c4  0A6F66662068.. char[22] "\noff hi freq:    kHz " 
LAB_M6B_big_08000__10da:
  10da  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0003 $0000 $0000 ->$1125 ->$10FC $0001 $0001 $0000
  10de  01             db 1h                             
  10df  01             db 1h                             
  10e0  02             db 2h                             
  10e1  01             db 1h                             
  10e2  01             db 1h                             
  10e3  00             db 0h                             
  10e4  01             db 1h                             
  10e5  80             db 80h                            
  10e6  0003           dw 3h                             
  10e8  0000           dw 0h                             
  10ea  0000           dw 0h                             
  10ec  1125           addr M6B_big_08000::1125          
  10ee  10FC           addr M6B_big_08000::10fc          
  10f0  0001           dw 1h                             
  10f2  0001           dw 1h                             
  10f4  0000           dw 0h                             
LAB_M6B_big_08000__10f6:
  10f6  17002C         LBSR 0x1125                       
  10f9  3506           PULS  A B                         
  10fb  39             RTS                               

; ---- function FUN_M6B_big_08000__10fc
FUN_M6B_big_08000__10fc:
  10fc  3426           PSHS  Y B A                       
  10fe  FC6074         LDD 0x6074                        
  1101  FD7044         STD 0x7044                        
  1104  CC0065         LDD #0x65                         
  1107  830008         SUBD #0x8                         
  110a  1F02           TFR D,Y                           
  110c  FC7044         LDD 0x7044                        
  110f  AD9FFC80       JSR [0xfc80]                      
  1113  108E000B       LDY #0xb                          
  1117  FC7044         LDD 0x7044                        
  111a  AD9FFE40       JSR [0xfe40]                      
  111e  8D24           BSR 0x1144                        
  1120  8D03           BSR 0x1125                        
  1122  3526           PULS  A B Y                       
  1124  39             RTS                               

; ---- function FUN_M6B_big_08000__1125
FUN_M6B_big_08000__1125:
  1125  3456           PSHS  U X B A                     
  1127  C621           LDB #0x21                         
  1129  AD9FFC36       JSR [0xfc36]                      
  112d  FC7044         LDD 0x7044                        
  1130  F37044         ADDD 0x7044                       
  1133  C318F4         ADDD #0x18f4                      
  1136  F3600D         ADDD 0x600d                       
  1139  1F01           TFR D,X                           
  113b  C602           LDB #0x2                          
  113d  AD9FFC3A       JSR [0xfc3a]                      
  1141  3556           PULS  A B X U                     
  1143  39             RTS                               

; ---- function FUN_M6B_big_08000__1144
FUN_M6B_big_08000__1144:
  1144  170535         LBSR 0x167c                       
  1147  39             RTS                               

; ---- function FUN_M6B_big_08000__1148
FUN_M6B_big_08000__1148:
  1148  3426           PSHS  Y B A                       
  114a  AD9FFC8E       JSR [0xfc8e]                      
  114e  FC60F9         LDD 0x60f9                        
  1151  FD7046         STD 0x7046                        
  1154  FD6074         STD 0x6074                        
  1157  17009D         LBSR 0x11f7                       
  115a  CC0066         LDD #0x66                         
  115d  830008         SUBD #0x8                         
  1160  1F02           TFR D,Y                           
  1162  FC7046         LDD 0x7046                        
  1165  AD9FFC80       JSR [0xfc80]                      
  1169  3526           PULS  A B Y                       
  116b  39             RTS                               

; ---- function FUN_M6B_big_08000__116c
FUN_M6B_big_08000__116c:
  116c  3406           PSHS  B A                         
  116e  FC7046         LDD 0x7046                        
  1171  FD6074         STD 0x6074                        
  1174  17F1A5         LBSR 0x031c                       
  1177  C613           LDB #0x13                         
  1179  AD9FFC36       JSR [0xfc36]                      
  117d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " off low atten:    dB"
  1181  0A6F6666206C.. char[22] "\noff low atten:    dB" 
LAB_M6B_big_08000__1197:
  1197  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$11E2 ->$11B9 $0001 $0001 $0000
  119b  01             db 1h                             
  119c  01             db 1h                             
  119d  02             db 2h                             
  119e  01             db 1h                             
  119f  01             db 1h                             
  11a0  00             db 0h                             
  11a1  02             db 2h                             
  11a2  80             db 80h                            
  11a3  0000           dw 0h                             
  11a5  FFFA           dw FFFAh                          
  11a7  0000           dw 0h                             
  11a9  11E2           addr M6B_big_08000::11e2          
  11ab  11B9           addr M6B_big_08000::11b9          
  11ad  0001           dw 1h                             
  11af  0001           dw 1h                             
  11b1  0000           dw 0h                             
LAB_M6B_big_08000__11b3:
  11b3  17002C         LBSR 0x11e2                       
  11b6  3506           PULS  A B                         
  11b8  39             RTS                               

; ---- function FUN_M6B_big_08000__11b9
FUN_M6B_big_08000__11b9:
  11b9  3426           PSHS  Y B A                       
  11bb  FC6074         LDD 0x6074                        
  11be  FD7046         STD 0x7046                        
  11c1  CC0066         LDD #0x66                         
  11c4  830008         SUBD #0x8                         
  11c7  1F02           TFR D,Y                           
  11c9  FC7046         LDD 0x7046                        
  11cc  AD9FFC80       JSR [0xfc80]                      
  11d0  108E000A       LDY #0xa                          
  11d4  FC7046         LDD 0x7046                        
  11d7  AD9FFE40       JSR [0xfe40]                      
  11db  8D1A           BSR 0x11f7                        
  11dd  8D03           BSR 0x11e2                        
  11df  3526           PULS  A B Y                       
  11e1  39             RTS                               

; ---- function FUN_M6B_big_08000__11e2
FUN_M6B_big_08000__11e2:
  11e2  3456           PSHS  U X B A                     
  11e4  C623           LDB #0x23                         
  11e6  AD9FFC36       JSR [0xfc36]                      
  11ea  CC0002         LDD #0x2                          
  11ed  8E60A1         LDX #0x60a1                       
  11f0  AD9FFC3A       JSR [0xfc3a]                      
  11f4  3556           PULS  A B X U                     
  11f6  39             RTS                               

; ---- function FUN_M6B_big_08000__11f7
FUN_M6B_big_08000__11f7:
  11f7  170482         LBSR 0x167c                       
  11fa  39             RTS                               

; ---- function FUN_M6B_big_08000__11fb
FUN_M6B_big_08000__11fb:
  11fb  3426           PSHS  Y B A                       
  11fd  AD9FFC8E       JSR [0xfc8e]                      
  1201  FC60F9         LDD 0x60f9                        
  1204  FD7048         STD 0x7048                        
  1207  FD6074         STD 0x6074                        
  120a  17009D         LBSR 0x12aa                       
  120d  CC0067         LDD #0x67                         
  1210  830008         SUBD #0x8                         
  1213  1F02           TFR D,Y                           
  1215  FC7048         LDD 0x7048                        
  1218  AD9FFC80       JSR [0xfc80]                      
  121c  3526           PULS  A B Y                       
  121e  39             RTS                               

; ---- function FUN_M6B_big_08000__121f
FUN_M6B_big_08000__121f:
  121f  3406           PSHS  B A                         
  1221  FC7048         LDD 0x7048                        
  1224  FD6074         STD 0x6074                        
  1227  17F0F2         LBSR 0x031c                       
  122a  C613           LDB #0x13                         
  122c  AD9FFC36       JSR [0xfc36]                      
  1230  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " off hi atten:    dB "
  1234  0A6F66662068.. char[22] "\noff hi atten:    dB " 
LAB_M6B_big_08000__124a:
  124a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFA $0000 ->$1295 ->$126C $0001 $0001 $0000
  124e  01             db 1h                             
  124f  01             db 1h                             
  1250  02             db 2h                             
  1251  01             db 1h                             
  1252  01             db 1h                             
  1253  00             db 0h                             
  1254  02             db 2h                             
  1255  80             db 80h                            
  1256  0000           dw 0h                             
  1258  FFFA           dw FFFAh                          
  125a  0000           dw 0h                             
  125c  1295           addr M6B_big_08000::1295          
  125e  126C           addr M6B_big_08000::126c          
  1260  0001           dw 1h                             
  1262  0001           dw 1h                             
  1264  0000           dw 0h                             
LAB_M6B_big_08000__1266:
  1266  17002C         LBSR 0x1295                       
  1269  3506           PULS  A B                         
  126b  39             RTS                               

; ---- function FUN_M6B_big_08000__126c
FUN_M6B_big_08000__126c:
  126c  3426           PSHS  Y B A                       
  126e  FC6074         LDD 0x6074                        
  1271  FD7048         STD 0x7048                        
  1274  CC0067         LDD #0x67                         
  1277  830008         SUBD #0x8                         
  127a  1F02           TFR D,Y                           
  127c  FC7048         LDD 0x7048                        
  127f  AD9FFC80       JSR [0xfc80]                      
  1283  108E000C       LDY #0xc                          
  1287  FC7048         LDD 0x7048                        
  128a  AD9FFE40       JSR [0xfe40]                      
  128e  8D1A           BSR 0x12aa                        
  1290  8D03           BSR 0x1295                        
  1292  3526           PULS  A B Y                       
  1294  39             RTS                               

; ---- function FUN_M6B_big_08000__1295
FUN_M6B_big_08000__1295:
  1295  3456           PSHS  U X B A                     
  1297  C622           LDB #0x22                         
  1299  AD9FFC36       JSR [0xfc36]                      
  129d  CC0002         LDD #0x2                          
  12a0  8E60A1         LDX #0x60a1                       
  12a3  AD9FFC3A       JSR [0xfc3a]                      
  12a7  3556           PULS  A B X U                     
  12a9  39             RTS                               

; ---- function FUN_M6B_big_08000__12aa
FUN_M6B_big_08000__12aa:
  12aa  1703CF         LBSR 0x167c                       
  12ad  39             RTS                               

; ---- function FUN_M6B_big_08000__12ae
FUN_M6B_big_08000__12ae:
  12ae  3436           PSHS  Y X B A                     
  12b0  CC0000         LDD #0x0                          
  12b3  2021           BRA 0x12d6                        

; ---- function FUN_M6B_big_08000__12b5
FUN_M6B_big_08000__12b5:
  12b5  3436           PSHS  Y X B A                     
  12b7  CC0001         LDD #0x1                          
  12ba  201A           BRA 0x12d6                        

; ---- function FUN_M6B_big_08000__12bc
FUN_M6B_big_08000__12bc:
  12bc  3436           PSHS  Y X B A                     
  12be  CC0002         LDD #0x2                          
  12c1  2013           BRA 0x12d6                        

; ---- function FUN_M6B_big_08000__12c3
FUN_M6B_big_08000__12c3:
  12c3  3436           PSHS  Y X B A                     
  12c5  CC0003         LDD #0x3                          
  12c8  200C           BRA 0x12d6                        

; ---- function FUN_M6B_big_08000__12ca
FUN_M6B_big_08000__12ca:
  12ca  3436           PSHS  Y X B A                     
  12cc  CC0004         LDD #0x4                          
  12cf  2005           BRA 0x12d6                        

; ---- function FUN_M6B_big_08000__12d1
FUN_M6B_big_08000__12d1:
  12d1  3436           PSHS  Y X B A                     
  12d3  CC0005         LDD #0x5                          
LAB_M6B_big_08000__12d6:
  12d6  17054A         LBSR 0x1823                       
  12d9  FC60F9         LDD 0x60f9                        
  12dc  ED9F7074       STD [0x7074]                      
  12e0  FD6074         STD 0x6074                        
  12e3  10BE7076       LDY 0x7076                        
  12e7  AD9FFC80       JSR [0xfc80]                      
  12eb  FC707C         LDD 0x707c                        
  12ee  860A           LDA #0xa                          
  12f0  3D             MUL                               
  12f1  C31304         ADDD #0x1304                      
  12f4  F3600D         ADDD 0x600d                       
  12f7  1F01           TFR D,X                           
  12f9  AD84           JSR ,X                            
  12fb  1700C4         LBSR 0x13c2                       
  12fe  1700D6         LBSR 0x13d7                       
  1301  3536           PULS  A B X Y                     
  1303  39             RTS                               

; ---- function FUN_M6B_big_08000__1304
FUN_M6B_big_08000__1304:
  1304  3416           PSHS  X B A                       
  1306  CC0000         LDD #0x0                          
  1309  8E044B         LDX #0x44b                        
  130c  2030           BRA 0x133e                        

; ---- function FUN_M6B_big_08000__130e
FUN_M6B_big_08000__130e:
  130e  3416           PSHS  X B A                       
  1310  CC0001         LDD #0x1                          
  1313  8E044F         LDX #0x44f                        
  1316  2026           BRA 0x133e                        

; ---- function FUN_M6B_big_08000__1318
FUN_M6B_big_08000__1318:
  1318  3416           PSHS  X B A                       
  131a  CC0002         LDD #0x2                          
  131d  8E0450         LDX #0x450                        
  1320  201C           BRA 0x133e                        

; ---- function FUN_M6B_big_08000__1322
FUN_M6B_big_08000__1322:
  1322  3416           PSHS  X B A                       
  1324  CC0003         LDD #0x3                          
  1327  8E044C         LDX #0x44c                        
  132a  2012           BRA 0x133e                        

; ---- function FUN_M6B_big_08000__132c
FUN_M6B_big_08000__132c:
  132c  3416           PSHS  X B A                       
  132e  CC0004         LDD #0x4                          
  1331  8E044D         LDX #0x44d                        
  1334  2008           BRA 0x133e                        

; ---- function FUN_M6B_big_08000__1336
FUN_M6B_big_08000__1336:
  1336  3416           PSHS  X B A                       
  1338  CC0005         LDD #0x5                          
  133b  8E044E         LDX #0x44e                        
LAB_M6B_big_08000__133e:
  133e  1704E2         LBSR 0x1823                       
  1341  EC9F7074       LDD [0x7074]                      
  1345  FD6074         STD 0x6074                        
  1348  17EFD1         LBSR 0x031c                       
  134b  C613           LDB #0x13                         
  134d  AD9FFC36       JSR [0xfc36]                      
  1351  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay  :     samples"
  1355  0A64656C6179.. char[22] "\ndelay  :     samples" 
LAB_M6B_big_08000__136b:
  136b  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $1388 $0000 $0000 ->$13C2 ->$139C $0001 $0001 $0000
  136f  01             db 1h                             
  1370  01             db 1h                             
  1371  02             db 2h                             
  1372  01             db 1h                             
  1373  01             db 1h                             
  1374  00             db 0h                             
  1375  04             db 4h                             
  1376  80             db 80h                            
  1377  1388           dw 1388h                          
  1379  0000           dw 0h                             
  137b  0000           dw 0h                             
  137d  13C2           addr M6B_big_08000::13c2          
  137f  139C           addr M6B_big_08000::139c          
  1381  0001           dw 1h                             
  1383  0001           dw 1h                             
  1385  0000           dw 0h                             
LAB_M6B_big_08000__1387:
  1387  170038         LBSR 0x13c2                       
  138a  C61A           LDB #0x1a                         
  138c  AD9FFC36       JSR [0xfc36]                      
  1390  FC707C         LDD 0x707c                        
  1393  CB31           ADDB #0x31                        
  1395  AD9FFC2A       JSR [0xfc2a]                      
  1399  3516           PULS  A B X                       
  139b  39             RTS                               

; ---- function FUN_M6B_big_08000__139c
FUN_M6B_big_08000__139c:
  139c  3426           PSHS  Y B A                       
  139e  FC6074         LDD 0x6074                        
  13a1  ED9F7074       STD [0x7074]                      
  13a5  10BE7076       LDY 0x7076                        
  13a9  AD9FFC82       JSR [0xfc82]                      
  13ad  FC707C         LDD 0x707c                        
  13b0  C30010         ADDD #0x10                        
  13b3  1F02           TFR D,Y                           
  13b5  EC9F7074       LDD [0x7074]                      
  13b9  AD9FFE40       JSR [0xfe40]                      
  13bd  8D18           BSR 0x13d7                        
  13bf  3526           PULS  A B Y                       
  13c1  39             RTS                               

; ---- function FUN_M6B_big_08000__13c2
FUN_M6B_big_08000__13c2:
  13c2  3456           PSHS  U X B A                     
  13c4  C61C           LDB #0x1c                         
  13c6  AD9FFC36       JSR [0xfc36]                      
  13ca  CC0004         LDD #0x4                          
  13cd  8E609F         LDX #0x609f                       
  13d0  AD9FFC3A       JSR [0xfc3a]                      
  13d4  3556           PULS  A B X U                     
  13d6  39             RTS                               

; ---- function FUN_M6B_big_08000__13d7
FUN_M6B_big_08000__13d7:
  13d7  3440           PSHS  U                           
  13d9  EC9F7074       LDD [0x7074]                      
  13dd  FD707E         STD 0x707e                        
  13e0  CC000A         LDD #0xa                          
  13e3  AD9FFD20       JSR [0xfd20]                      
  13e7  10BE707A       LDY 0x707a                        
  13eb  FC707E         LDD 0x707e                        
  13ee  AD9FFD2E       JSR [0xfd2e]                      
  13f2  3540           PULS  U                           
  13f4  39             RTS                               
PTR_FUN_M6B_big_08000__14bb_M6B_big_08000__13f5:
  13f5  14BB           addr M6B_big_08000::14bb          
  13f7  14D0           addr M6B_big_08000::14d0          
  13f9  7000           addr 7000                         
  13fb  .db 00 3F FF 9C 00 64 00 04                          ; .?...d..

; ---- function FUN_M6B_big_08000__1403
FUN_M6B_big_08000__1403:
  1403  3410           PSHS  X                           
  1405  8E13F5         LDX #0x13f5                        ; desc[API_FE1C]: ->$14BB ->$14D0 $7000
  1408  AD9FFE1C       JSR [0xfe1c]                      
  140c  3510           PULS  X                           
  140e  39             RTS                               

; ---- function FUN_M6B_big_08000__140f
FUN_M6B_big_08000__140f:
  140f  3410           PSHS  X                           
  1411  8E13F5         LDX #0x13f5                        ; desc[API_FE1A]: ->$14BB ->$14D0 $7000
  1414  AD9FFE1A       JSR [0xfe1a]                      
  1418  3510           PULS  X                           
  141a  39             RTS                               

; ---- function FUN_M6B_big_08000__141b
FUN_M6B_big_08000__141b:
  141b  3426           PSHS  Y B A                       
  141d  AD9FFC8E       JSR [0xfc8e]                      
  1421  FC60F9         LDD 0x60f9                        
  1424  FD6074         STD 0x6074                        
  1427  B37002         SUBD 0x7002                       
  142a  FD7000         STD 0x7000                        
  142d  1700A0         LBSR 0x14d0                       
  1430  CC003D         LDD #0x3d                         
  1433  830008         SUBD #0x8                         
  1436  1F02           TFR D,Y                           
  1438  FC7000         LDD 0x7000                        
  143b  AD9FFC82       JSR [0xfc82]                      
  143f  3526           PULS  A B Y                       
  1441  39             RTS                               

; ---- function FUN_M6B_big_08000__1442
FUN_M6B_big_08000__1442:
  1442  3406           PSHS  B A                         
  1444  FC7004         LDD 0x7004                        
  1447  FD6074         STD 0x6074                        
  144a  17EECF         LBSR 0x031c                       
  144d  C613           LDB #0x13                         
  144f  AD9FFC36       JSR [0xfc36]                      
  1453  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " mix:     % wet      "
  1457  0A6D69783A20.. char[22] "\nmix:     % wet      " 
LAB_M6B_big_08000__146d:
  146d  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$14BB ->$148F $0001 $0001 $0000
  1471  01             db 1h                             
  1472  01             db 1h                             
  1473  02             db 2h                             
  1474  01             db 1h                             
  1475  01             db 1h                             
  1476  00             db 0h                             
  1477  03             db 3h                             
  1478  80             db 80h                            
  1479  0064           dw 64h                            
  147b  0000           dw 0h                             
  147d  0000           dw 0h                             
  147f  14BB           addr M6B_big_08000::14bb          
  1481  148F           addr M6B_big_08000::148f          
  1483  0001           dw 1h                             
  1485  0001           dw 1h                             
  1487  0000           dw 0h                             
LAB_M6B_big_08000__1489:
  1489  17002F         LBSR 0x14bb                       
  148c  3506           PULS  A B                         
  148e  39             RTS                               

; ---- function FUN_M6B_big_08000__148f
FUN_M6B_big_08000__148f:
  148f  3426           PSHS  Y B A                       
  1491  FC6074         LDD 0x6074                        
  1494  B37002         SUBD 0x7002                       
  1497  FD7000         STD 0x7000                        
  149a  CC003D         LDD #0x3d                         
  149d  830008         SUBD #0x8                         
  14a0  1F02           TFR D,Y                           
  14a2  FC7000         LDD 0x7000                        
  14a5  AD9FFC82       JSR [0xfc82]                      
  14a9  8D25           BSR 0x14d0                        
  14ab  8D0E           BSR 0x14bb                        
  14ad  108E0000       LDY #0x0                          
  14b1  FC7000         LDD 0x7000                        
  14b4  AD9FFE40       JSR [0xfe40]                      
  14b8  3526           PULS  A B Y                       
  14ba  39             RTS                               

; ---- function FUN_M6B_big_08000__14bb
FUN_M6B_big_08000__14bb:
  14bb  3416           PSHS  X B A                       
  14bd  C619           LDB #0x19                         
  14bf  AD9FFC36       JSR [0xfc36]                      
  14c3  CC0003         LDD #0x3                          
  14c6  8E60A0         LDX #0x60a0                       
  14c9  AD9FFC3A       JSR [0xfc3a]                      
  14cd  3516           PULS  A B X                       
  14cf  39             RTS                               

; ---- function FUN_M6B_big_08000__14d0
FUN_M6B_big_08000__14d0:
  14d0  3476           PSHS  U Y X B A                   
  14d2  CC0000         LDD #0x0                          
  14d5  3606           PSHU  B A                         
  14d7  CC0064         LDD #0x64                         
  14da  3606           PSHU  B A                         
  14dc  FC7000         LDD 0x7000                        
  14df  F37002         ADDD 0x7002                       
  14e2  3606           PSHU  B A                         
  14e4  AD9FFCD8       JSR [0xfcd8]                      
  14e8  3706           PULU  A B                         
  14ea  FD7004         STD 0x7004                        
  14ed  CC0064         LDD #0x64                         
  14f0  B37004         SUBD 0x7004                       
  14f3  3606           PSHU  B A                         
  14f5  58             LSLB                              
  14f6  49             ROLA                              
  14f7  FD707E         STD 0x707e                        
  14fa  CC4666         LDD #0x4666                       
  14fd  3606           PSHU  B A                         
  14ff  AD9FFCF2       JSR [0xfcf2]                      
  1503  3706           PULU  A B                         
  1505  F3707E         ADDD 0x707e                       
  1508  AD9FFC6A       JSR [0xfc6a]                      
  150c  AD9FFC72       JSR [0xfc72]                      
  1510  3576           PULS  A B X Y U                   
  1512  39             RTS                               

; ---- function FUN_M6B_big_08000__1513
FUN_M6B_big_08000__1513:
  1513  3456           PSHS  U X B A                     
  1515  FC703A         LDD 0x703a                        
  1518  862C           LDA #0x2c                         
  151a  3D             MUL                               
  151b  B3703E         SUBD 0x703e                       
  151e  B3703E         SUBD 0x703e                       
  1521  B3703E         SUBD 0x703e                       
  1524  B3703E         SUBD 0x703e                       
  1527  C318FC         ADDD #0x18fc                      
  152a  F3600D         ADDD 0x600d                       
  152d  FD7064         STD 0x7064                        
  1530  FC703C         LDD 0x703c                        
  1533  862C           LDA #0x2c                         
  1535  3D             MUL                               
  1536  B37040         SUBD 0x7040                       
  1539  B37040         SUBD 0x7040                       
  153c  B37040         SUBD 0x7040                       
  153f  B37040         SUBD 0x7040                       
  1542  C319AC         ADDD #0x19ac                      
  1545  F3600D         ADDD 0x600d                       
  1548  FD7066         STD 0x7066                        
  154b  BE7064         LDX 0x7064                        
  154e  EC81           LDD ,X++                          
  1550  FD7068         STD 0x7068                        
  1553  EC84           LDD ,X                            
  1555  FD706A         STD 0x706a                        
  1558  BE7066         LDX 0x7066                        
  155b  EC81           LDD ,X++                          
  155d  FD706C         STD 0x706c                        
  1560  EC84           LDD ,X                            
  1562  FD706E         STD 0x706e                        
  1565  CC7FFF         LDD #0x7fff                       
  1568  B3706E         SUBD 0x706e                       
  156b  3606           PSHU  B A                         
  156d  FC705E         LDD 0x705e                        
  1570  3606           PSHU  B A                         
  1572  AD9FFCF2       JSR [0xfcf2]                      
  1576  CC7FFF         LDD #0x7fff                       
  1579  B3706C         SUBD 0x706c                       
  157c  3606           PSHU  B A                         
  157e  170264         LBSR 0x17e5                       
  1581  3706           PULU  A B                         
  1583  FD704A         STD 0x704a                        
  1586  FC704A         LDD 0x704a                        
  1589  3606           PSHU  B A                         
  158b  FC706C         LDD 0x706c                        
  158e  3606           PSHU  B A                         
  1590  AD9FFCF2       JSR [0xfcf2]                      
  1594  FC704A         LDD 0x704a                        
  1597  3606           PSHU  B A                         
  1599  FC7068         LDD 0x7068                        
  159c  3606           PSHU  B A                         
  159e  AD9FFCF2       JSR [0xfcf2]                      
  15a2  CC8001         LDD #0x8001                       
  15a5  3606           PSHU  B A                         
  15a7  AD9FFCE2       JSR [0xfce2]                      
  15ab  AD9FFCE2       JSR [0xfce2]                      
  15af  3706           PULU  A B                         
  15b1  FD704C         STD 0x704c                        
  15b4  CC0000         LDD #0x0                          
  15b7  B3704C         SUBD 0x704c                       
  15ba  FD704C         STD 0x704c                        
  15bd  FC7068         LDD 0x7068                        
  15c0  3606           PSHU  B A                         
  15c2  FC706C         LDD 0x706c                        
  15c5  3606           PSHU  B A                         
  15c7  AD9FFCF2       JSR [0xfcf2]                      
  15cb  FC704A         LDD 0x704a                        
  15ce  3606           PSHU  B A                         
  15d0  AD9FFCF2       JSR [0xfcf2]                      
  15d4  3706           PULU  A B                         
  15d6  FD704E         STD 0x704e                        
  15d9  CC8001         LDD #0x8001                       
  15dc  F3706A         ADDD 0x706a                       
  15df  F3706E         ADDD 0x706e                       
  15e2  FD7050         STD 0x7050                        
  15e5  CC0000         LDD #0x0                          
  15e8  B3706A         SUBD 0x706a                       
  15eb  3606           PSHU  B A                         
  15ed  FC706E         LDD 0x706e                        
  15f0  3606           PSHU  B A                         
  15f2  AD9FFCF2       JSR [0xfcf2]                      
  15f6  3706           PULU  A B                         
  15f8  FD7052         STD 0x7052                        
  15fb  CC000A         LDD #0xa                          
  15fe  AD9FFD20       JSR [0xfd20]                      
  1602  108E054A       LDY #0x54a                        
  1606  CCFFFF         LDD #0xffff                       
  1609  AD9FFD2E       JSR [0xfd2e]                      
  160d  CC000A         LDD #0xa                          
  1610  AD9FFD20       JSR [0xfd20]                      
  1614  108E0540       LDY #0x540                        
  1618  FC704A         LDD 0x704a                        
  161b  AD9FFD2E       JSR [0xfd2e]                      
  161f  CC000A         LDD #0xa                          
  1622  AD9FFD20       JSR [0xfd20]                      
  1626  108E0541       LDY #0x541                        
  162a  FC704C         LDD 0x704c                        
  162d  AD9FFD2E       JSR [0xfd2e]                      
  1631  CC000A         LDD #0xa                          
  1634  AD9FFD20       JSR [0xfd20]                      
  1638  108E0542       LDY #0x542                        
  163c  FC704E         LDD 0x704e                        
  163f  AD9FFD2E       JSR [0xfd2e]                      
  1643  CC000A         LDD #0xa                          
  1646  AD9FFD20       JSR [0xfd20]                      
  164a  108E0543       LDY #0x543                        
  164e  FC7050         LDD 0x7050                        
  1651  AD9FFD2E       JSR [0xfd2e]                      
  1655  CC000A         LDD #0xa                          
  1658  AD9FFD20       JSR [0xfd20]                      
  165c  108E0544       LDY #0x544                        
  1660  FC7052         LDD 0x7052                        
  1663  AD9FFD2E       JSR [0xfd2e]                      
  1667  CC000A         LDD #0xa                          
  166a  AD9FFD20       JSR [0xfd20]                      
  166e  108E054A       LDY #0x54a                        
  1672  FC7094         LDD 0x7094                        
  1675  AD9FFD2E       JSR [0xfd2e]                      
  1679  3556           PULS  A B X U                     
  167b  39             RTS                               

; ---- function FUN_M6B_big_08000__167c
FUN_M6B_big_08000__167c:
  167c  3456           PSHS  U X B A                     
  167e  FC7042         LDD 0x7042                        
  1681  862C           LDA #0x2c                         
  1683  3D             MUL                               
  1684  B37046         SUBD 0x7046                       
  1687  B37046         SUBD 0x7046                       
  168a  B37046         SUBD 0x7046                       
  168d  B37046         SUBD 0x7046                       
  1690  C318FC         ADDD #0x18fc                      
  1693  F3600D         ADDD 0x600d                       
  1696  FD7064         STD 0x7064                        
  1699  FC7044         LDD 0x7044                        
  169c  862C           LDA #0x2c                         
  169e  3D             MUL                               
  169f  B37048         SUBD 0x7048                       
  16a2  B37048         SUBD 0x7048                       
  16a5  B37048         SUBD 0x7048                       
  16a8  B37048         SUBD 0x7048                       
  16ab  C319AC         ADDD #0x19ac                      
  16ae  F3600D         ADDD 0x600d                       
  16b1  FD7066         STD 0x7066                        
  16b4  BE7064         LDX 0x7064                        
  16b7  EC81           LDD ,X++                          
  16b9  FD7068         STD 0x7068                        
  16bc  EC84           LDD ,X                            
  16be  FD706A         STD 0x706a                        
  16c1  BE7066         LDX 0x7066                        
  16c4  EC81           LDD ,X++                          
  16c6  FD706C         STD 0x706c                        
  16c9  EC84           LDD ,X                            
  16cb  FD706E         STD 0x706e                        
  16ce  CC7FFF         LDD #0x7fff                       
  16d1  B3706E         SUBD 0x706e                       
  16d4  3606           PSHU  B A                         
  16d6  FC7060         LDD 0x7060                        
  16d9  3606           PSHU  B A                         
  16db  AD9FFCF2       JSR [0xfcf2]                      
  16df  CC7FFF         LDD #0x7fff                       
  16e2  B3706C         SUBD 0x706c                       
  16e5  3606           PSHU  B A                         
  16e7  1700FB         LBSR 0x17e5                       
  16ea  3706           PULU  A B                         
  16ec  FD7054         STD 0x7054                        
  16ef  FC7054         LDD 0x7054                        
  16f2  3606           PSHU  B A                         
  16f4  FC706C         LDD 0x706c                        
  16f7  3606           PSHU  B A                         
  16f9  AD9FFCF2       JSR [0xfcf2]                      
  16fd  FC7054         LDD 0x7054                        
  1700  3606           PSHU  B A                         
  1702  FC7068         LDD 0x7068                        
  1705  3606           PSHU  B A                         
  1707  AD9FFCF2       JSR [0xfcf2]                      
  170b  CC8001         LDD #0x8001                       
  170e  3606           PSHU  B A                         
  1710  AD9FFCE2       JSR [0xfce2]                      
  1714  AD9FFCE2       JSR [0xfce2]                      
  1718  3706           PULU  A B                         
  171a  FD7056         STD 0x7056                        
  171d  CC0000         LDD #0x0                          
  1720  B37056         SUBD 0x7056                       
  1723  FD7056         STD 0x7056                        
  1726  FC7068         LDD 0x7068                        
  1729  3606           PSHU  B A                         
  172b  FC706C         LDD 0x706c                        
  172e  3606           PSHU  B A                         
  1730  AD9FFCF2       JSR [0xfcf2]                      
  1734  FC7054         LDD 0x7054                        
  1737  3606           PSHU  B A                         
  1739  AD9FFCF2       JSR [0xfcf2]                      
  173d  3706           PULU  A B                         
  173f  FD7058         STD 0x7058                        
  1742  CC8001         LDD #0x8001                       
  1745  F3706A         ADDD 0x706a                       
  1748  F3706E         ADDD 0x706e                       
  174b  FD705A         STD 0x705a                        
  174e  CC0000         LDD #0x0                          
  1751  B3706A         SUBD 0x706a                       
  1754  3606           PSHU  B A                         
  1756  FC706E         LDD 0x706e                        
  1759  3606           PSHU  B A                         
  175b  AD9FFCF2       JSR [0xfcf2]                      
  175f  3706           PULU  A B                         
  1761  FD705C         STD 0x705c                        
  1764  CC000A         LDD #0xa                          
  1767  AD9FFD20       JSR [0xfd20]                      
  176b  108E054A       LDY #0x54a                        
  176f  CC0000         LDD #0x0                          
  1772  AD9FFD2E       JSR [0xfd2e]                      
  1776  CC000A         LDD #0xa                          
  1779  AD9FFD20       JSR [0xfd20]                      
  177d  108E0545       LDY #0x545                        
  1781  FC7054         LDD 0x7054                        
  1784  AD9FFD2E       JSR [0xfd2e]                      
  1788  CC000A         LDD #0xa                          
  178b  AD9FFD20       JSR [0xfd20]                      
  178f  108E0546       LDY #0x546                        
  1793  FC7056         LDD 0x7056                        
  1796  AD9FFD2E       JSR [0xfd2e]                      
  179a  CC000A         LDD #0xa                          
  179d  AD9FFD20       JSR [0xfd20]                      
  17a1  108E0547       LDY #0x547                        
  17a5  FC7058         LDD 0x7058                        
  17a8  AD9FFD2E       JSR [0xfd2e]                      
  17ac  CC000A         LDD #0xa                          
  17af  AD9FFD20       JSR [0xfd20]                      
  17b3  108E0548       LDY #0x548                        
  17b7  FC705A         LDD 0x705a                        
  17ba  AD9FFD2E       JSR [0xfd2e]                      
  17be  CC000A         LDD #0xa                          
  17c1  AD9FFD20       JSR [0xfd20]                      
  17c5  108E0549       LDY #0x549                        
  17c9  FC705C         LDD 0x705c                        
  17cc  AD9FFD2E       JSR [0xfd2e]                      
  17d0  CC000A         LDD #0xa                          
  17d3  AD9FFD20       JSR [0xfd20]                      
  17d7  108E054A       LDY #0x54a                        
  17db  FC7094         LDD 0x7094                        
  17de  AD9FFD2E       JSR [0xfd2e]                      
  17e2  3556           PULS  A B X U                     
  17e4  39             RTS                               

; ---- function FUN_M6B_big_08000__17e5
FUN_M6B_big_08000__17e5:
  17e5  3416           PSHS  X B A                       
  17e7  CC0000         LDD #0x0                          
  17ea  FD7072         STD 0x7072                        
  17ed  3706           PULU  A B                         
  17ef  47             ASRA                              
  17f0  56             RORB                              
  17f1  FD7070         STD 0x7070                        
  17f4  3706           PULU  A B                         
  17f6  8E000F         LDX #0xf                          
LAB_M6B_big_08000__17f9:
  17f9  10B37070       CMPD 0x7070                       
  17fd  2510           BCS 0x180f                        
  17ff  B37070         SUBD 0x7070                       
  1802  787073         LSL 0x7073                        
  1805  797072         ROL 0x7072                        
  1808  59             ROLB                              
  1809  49             ROLA                              
  180a  7C7073         INC 0x7073                        
  180d  2008           BRA 0x1817                        
LAB_M6B_big_08000__180f:
  180f  787073         LSL 0x7073                        
  1812  797072         ROL 0x7072                        
  1815  59             ROLB                              
  1816  49             ROLA                              
LAB_M6B_big_08000__1817:
  1817  301F           LEAX -0x1,X                       
  1819  26DE           BNE 0x17f9                        
  181b  FC7072         LDD 0x7072                        
  181e  3606           PSHU  B A                         
  1820  3516           PULS  A B X                       
  1822  39             RTS                               

; ---- function FUN_M6B_big_08000__1823
FUN_M6B_big_08000__1823:
  1823  3406           PSHS  B A                         
  1825  FD707C         STD 0x707c                        
  1828  BF707A         STX 0x707a                        
  182b  FC707C         LDD 0x707c                        
  182e  58             LSLB                              
  182f  C3702E         ADDD #0x702e                      
  1832  FD7074         STD 0x7074                        
  1835  FC707C         LDD 0x707c                        
  1838  58             LSLB                              
  1839  C30054         ADDD #0x54                        
  183c  830008         SUBD #0x8                         
  183f  FD7076         STD 0x7076                        
  1842  3506           PULS  A B                         
  1844  39             RTS                               

; ---- function FUN_M6B_big_08000__1845
FUN_M6B_big_08000__1845:
  1845  3416           PSHS  X B A                       
  1847  CC0000         LDD #0x0                          
  184a  8E044B         LDX #0x44b                        
  184d  170030         LBSR 0x1880                       
  1850  CC0001         LDD #0x1                          
  1853  8E044F         LDX #0x44f                        
  1856  170027         LBSR 0x1880                       
  1859  CC0002         LDD #0x2                          
  185c  8E0450         LDX #0x450                        
  185f  17001E         LBSR 0x1880                       
  1862  CC0003         LDD #0x3                          
  1865  8E044C         LDX #0x44c                        
  1868  170015         LBSR 0x1880                       
  186b  CC0004         LDD #0x4                          
  186e  8E044D         LDX #0x44d                        
  1871  17000C         LBSR 0x1880                       
  1874  CC0005         LDD #0x5                          
  1877  8E044E         LDX #0x44e                        
  187a  170003         LBSR 0x1880                       
  187d  3516           PULS  A B X                       
  187f  39             RTS                               

; ---- function FUN_M6B_big_08000__1880
FUN_M6B_big_08000__1880:
  1880  3406           PSHS  B A                         
  1882  FD707C         STD 0x707c                        
  1885  BF707A         STX 0x707a                        
  1888  FC707C         LDD 0x707c                        
  188b  58             LSLB                              
  188c  C3702E         ADDD #0x702e                      
  188f  FD7074         STD 0x7074                        
  1892  17FB42         LBSR 0x13d7                       
  1895  3506           PULS  A B                         
  1897  39             RTS                               

; ---- function FUN_M6B_big_08000__1898
FUN_M6B_big_08000__1898:
  1898  3436           PSHS  Y X B A                     
  189a  AD9FFD42       JSR [0xfd42]                      
  189e  FD7082         STD 0x7082                        
  18a1  2B1A           BMI 0x18bd                        
  18a3  CC000A         LDD #0xa                          
  18a6  AD9FFD20       JSR [0xfd20]                      
  18aa  108E054A       LDY #0x54a                        
  18ae  CC0000         LDD #0x0                          
  18b1  AD9FFD2E       JSR [0xfd2e]                      
  18b5  CC0000         LDD #0x0                          
  18b8  FD7094         STD 0x7094                        
  18bb  2007           BRA 0x18c4                        
LAB_M6B_big_08000__18bd:
  18bd  FC7062         LDD 0x7062                        
  18c0  AD9FFCC4       JSR [0xfcc4]                      
LAB_M6B_big_08000__18c4:
  18c4  AD9FFD76       JSR [0xfd76]                      
  18c8  3536           PULS  A B X Y                     
  18ca  3B             RTI                               

; ---- function FUN_M6B_big_08000__18cb
FUN_M6B_big_08000__18cb:
  18cb  3436           PSHS  Y X B A                     
  18cd  CC000A         LDD #0xa                          
  18d0  AD9FFD20       JSR [0xfd20]                      
  18d4  108E054A       LDY #0x54a                        
  18d8  CCFFFF         LDD #0xffff                       
  18db  AD9FFD2E       JSR [0xfd2e]                      
  18df  CCFFFF         LDD #0xffff                       
  18e2  FD7094         STD 0x7094                        
  18e5  3536           PULS  A B X Y                     
  18e7  39             RTS                               
  18e8  .db 20 35 30 31 30 30 32 30 30 34 30 30 20 32 20 34  ;  50100200400 2 4
  18f8  .db 20 38 31 32 00 00 00 00 7F 30 7F 17 7F 46 7F 17  ;  812.....0...F..
  1908  .db 7F 5A 7F 17 7F 6C 7F 17 7F 7C 7F 17 7F 8A 7F 17  ; .Z...l...|......
  1918  .db 7F 97 7F 17 7F A2 7F 17 7F AC 7F 17 7F B5 7F 17  ; ................
  1928  .db 00 00 00 00 7E 64 7E 32 7E 91 7E 32 7E B9 7E 32  ; ....~d~2~.~2~.~2
  1938  .db 7E DC 7E 32 7E FC 7E 32 7F 18 7E 32 7F 31 7E 32  ; ~.~2~.~2..~2.1~2
  1948  .db 7F 47 7E 32 7F 5B 7E 32 7F 6D 7E 32 00 00 00 00  ; .G~2.[~2.m~2....
  1958  .db 7C D5 7C 73 7D 2D 7C 73 7D 7C 7C 73 7D C2 7C 73  ; |.|s}-|s}||s}.|s
  1968  .db 7E 00 7C 73 7E 38 7C 73 7E 69 7C 73 7E 95 7C 73  ; ~.|s~8|s~i|s~.|s
  1978  .db 7E BC 7C 73 7E DF 7C 73 00 00 00 00 79 D8 79 18  ; ~.|s~.|s....y.y.
  1988  .db 7A 83 79 18 7B 1C 79 18 7B A4 79 18 7C 1D 79 18  ; z.y.{.y.{.y.|.y.
  1998  .db 7C 89 79 18 7C E9 79 18 7D 3F 79 18 7D 8C 79 18  ; |.y.|.y.}?y.}.y.
  19a8  .db 7D D0 79 18 00 00 00 00 60 92 63 9C 5D 42 63 9C  ; }.y.....`.c.]Bc.
  19b8  .db 59 A7 63 9C 55 BF 63 9C 51 87 63 9C 4C FD 63 9C  ; Y.c.U.c.Q.c.L.c.
  19c8  .db 48 20 63 9C 42 EF 63 9C 3D 6B 63 9C 37 98 63 9C  ; H c.B.c.=kc.7.c.
  19d8  .db 00 00 00 00 4C FD 51 87 48 20 51 87 42 EF 51 87  ; ....L.Q.H Q.B.Q.
  19e8  .db 3D 6C 51 87 37 98 51 87 31 78 51 87 2B 11 51 87  ; =lQ.7.Q.1xQ.+.Q.
  19f8  .db 24 69 51 87 1D 89 51 87 16 79 51 87 00 00 00 00  ; $iQ...Q..yQ.....
  1a08  .db 35 E7 3B D1 2F B3 3B D1 29 39 3B D1 22 80 3B D1  ; 5.;./.;.)9;.".;.
  1a18  .db 1B 92 3B D1 14 76 3B D1 0D 39 3B D1 05 E6 3B D1  ; ..;..v;..9;...;.
  1a28  .db FE 89 3B D1 F7 2E 3B D1 00 00 00 00 28 BD 2F 3C  ; ..;...;.....(./<
  1a38  .db 22 00 2F 3C 1B 0E 2F 3C 13 F0 2F 3C 0C B1 2F 3C  ; "./<../<../<../<
  1a48  .db 05 5D 2F 3C FD FF 2F 3C F6 A5 2F 3C EF 5B 2F 3C  ; .]/<../<../<.[/<
  1a58  .db E8 2C 2F 3C 30 2E 31 30 2E 32 30 2E 33 30 2E 34  ; .,/<0.10.20.30.4
  1a68  .db 30 2E 35 30 2E 36 30 2E 37 30 2E 38 30 2E 39 31  ; 0.50.60.70.80.91
  1a78  .db 2E 30 31 2E 31 31 2E 32 31 2E 33 31 2E 34 31 2E  ; .01.11.21.31.41.
  1a88  .db 35 31 2E 36 31 2E 37 31 2E 38 31 2E 39 32 2E 30  ; 51.61.71.81.92.0
  1a98  .db 32 2E 31 32 2E 32 32 2E 33 32 2E 34 32 2E 35 32  ; 2.12.22.32.42.52
  1aa8  .db 2E 36 32 2E 37 32 2E 38 32 2E 39 33 2E 30 33 2E  ; .62.72.82.93.03.
  1ab8  .db 32 33 2E 34 33 2E 36 33 2E 38 34 2E 30 34 2E 32  ; 23.43.63.84.04.2
  1ac8  .db 34 2E 34 34 2E 36 34 2E 38 35 2E 30 35 2E 35 36  ; 4.44.64.85.05.56
  1ad8  .db 2E 30 36 2E 35 37 2E 30 37 2E 35 38 2E 30 38 2E  ; .06.57.07.58.08.
  1ae8  .db 35 39 2E 30 39 2E 35 20 31 30 20 31 35 20 32 30  ; 59.09.5 10 15 20
  1af8  .db 20 32 35 20 33 30 20 34 30 20 35 30 20 36 30 20  ;  25 30 40 50 60 
  1b08  .db 37 30 20 38 30 20 39 30 31 30 30 32 30 30 33 30  ; 70 80 9010020030
  1b18  .db 30 34 30 30 35 30 30 36 30 30 37 30 30 38 30 30  ; 0400500600700800
  1b28  .db 62 69 67 20 F3 20 F3 2B 31 F3 2B 32 F3 2B 33 F3  ; big . .+1.+2.+3.
  1b38  .db 2B 34 F3 2B 35 02 3E 10 72 1F F6 2C 8D 36 61 3E  ; +4.+5.>.r..,.6a>
  1b48  .db 1B 44 49 49 53 4D 7F 51 02 53 FF 56 92 58 D0 5A  ; .DIISM.Q.S.V.X.Z
  1b58  .db C7 5C 85 5E 11 5F 75 60 B5 61 D7 62 E0 63 D1 64  ; .\.^._u`.a.b.c.d
  1b68  .db AF 65 7A 66 37 66 E5 67 87 68 1E 68 AB 69 2F 69  ; .ezf7f.g.h.h.i/i
  1b78  .db AA 6A 8C 6B 55 6C 08 6C AA 6D 3B 6D C1 6E 3A 6E  ; .j.kUl.l.m;m.n:n
  1b88  .db AA 6F 10 6F 6E 70 3E 70 EC 71 81 72 00 72 6F 72  ; .o.onp>p.q.r.ror
  1b98  .db D0 73 27 73 73 73 B9 73 F6 75 84 76 4C 76 C5 77  ; .s'sss.s.u.vLv.w
  1ba8  .db 16 77 7B 77 B8 77 E1 77 FE 78 14 78 25 78 33 78  ; .w{w.w.w.x.x%x3x
  1bb8  .db 70 78 84 78 8F 78 95 78 99 78 9C 78 9F 78 A6 78  ; px.x.x.x.x.x.x.x
  1bc8  .db AE 78 E6 79 4A 79 E0 7A 4D 7F FF                 ; .x.yJy.zM..

;; TMS32010 program 28 for DSP 1: 260 words loaded at $800 (written via bank latch $81)
DSPPROG_28_DSP1_hdr:
  1bd3  281002120000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_28_DSP1:
  1bdb  08006E007F8B.. dw[261]                           

;; TMS32010 program 28 for DSP 2: 368 words loaded at $800 (written via bank latch $82)
DSPPROG_28_DSP2_hdr:
  1de5  281102EA0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_28_DSP2:
  1ded  08006E007F8B.. dw[369]                           

;; TMS32010 program 28 for DSP 3: 216 words loaded at $800 (written via bank latch $83)
DSPPROG_28_DSP3_hdr:
  20cf  281201BA0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_28_DSP3:
  20d7  08006E007F8B.. dw[217]                           

;; TMS32010 program 1E for DSP 1: 338 words loaded at $800 (written via bank latch $81)
DSPPROG_1E_DSP1_hdr:
  2289  1E1002AE0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_1E_DSP1:
  2291  08006E007F8B.. dw[339]                           

;; TMS32010 program 1E for DSP 2: 179 words loaded at $800 (written via bank latch $82)
DSPPROG_1E_DSP2_hdr:
  2537  1E1101700000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_1E_DSP2:
  253f  08006E007F8B.. dw[180]                           

;; TMS32010 program 1E for DSP 3: 481 words loaded at $800 (written via bank latch $83)
DSPPROG_1E_DSP3_hdr:
  26a7  1E1203CC0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_1E_DSP3:
  26af  08006E007F8B.. dw[482]                           

;; TMS32010 program 08 for DSP 1: 277 words loaded at $800 (written via bank latch $81)
DSPPROG_08_DSP1_hdr:
  2a73  081002340000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_08_DSP1:
  2a7b  080068807F8B.. dw[278]                           

;; TMS32010 program 08 for DSP 2: 289 words loaded at $800 (written via bank latch $82)
DSPPROG_08_DSP2_hdr:
  2ca7  0811024C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_08_DSP2:
  2caf  080068807F8B.. dw[290]                           

;; TMS32010 program 08 for DSP 3: 2 words loaded at $800 (written via bank latch $83)
DSPPROG_08_DSP3_hdr:
  2ef3  0812000E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_08_DSP3:
  2efb  0800F9000800   dw[3]                             

;; TMS32010 program 01 for DSP 1: 156 words loaded at $800 (written via bank latch $81)
DSPPROG_01_DSP1_hdr:
  2f01  011001420000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_01_DSP1:
  2f09  08007F8B7F81.. dw[157]                           

;; TMS32010 program 01 for DSP 2: 163 words loaded at $800 (written via bank latch $82)
DSPPROG_01_DSP2_hdr:
  3043  011101500000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_01_DSP2:
  304b  08007F8B7F81.. dw[164]                           

;; TMS32010 program 01 for DSP 3: 154 words loaded at $800 (written via bank latch $83)
DSPPROG_01_DSP3_hdr:
  3193  0112013E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_01_DSP3:
  319b  08007F8A7F81.. dw[155]                           

;; TMS32010 program 00 for DSP 3: 992 words loaded at $800 (written via bank latch $83)
DSPPROG_00_DSP3_hdr:
  32d1  001207CA0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_00_DSP3:
  32d9  08007F807F80.. dw[993]                           

;; TMS32010 program 02 for DSP 3: 199 words loaded at $800 (written via bank latch $83)
DSPPROG_02_DSP3_hdr:
  3a9b  021201980000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_02_DSP3:
  3aa3  08007F8B6E00.. dw[200]                           

;; TMS32010 program 03 for DSP 3: 121 words loaded at $800 (written via bank latch $83)
DSPPROG_03_DSP3_hdr:
  3c33  031200FC0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_03_DSP3:
  3c3b  08007F8B6E00.. dw[122]                           

;; TMS32010 program 14 for DSP 1: 277 words loaded at $800 (written via bank latch $81)
DSPPROG_14_DSP1_hdr:
  3d2f  141002340000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_14_DSP1:
  3d37  08006E007F8B.. dw[278]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3f63  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3f6b  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f7b  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f8b  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f9b  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fab  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fbb  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fcb  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fdb  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3feb  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ffb  .db FF FF FF FF FF                                   ; .....
