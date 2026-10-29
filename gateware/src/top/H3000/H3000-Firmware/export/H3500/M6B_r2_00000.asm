; H3500  block M6B_r2_00000  M6B_r2_00000::0000-M6B_r2_00000::3fff
; Bank r2_00000 (module id 6B, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 6B parameter/preset table "REVERB FACTORY", 152 bytes
MODULE_6B_TABLE_REVERB_FACTORY_hdr:
  0008  6B0000A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6B_TABLE_REVERB_FACTORY:
  0010  6B             ?? 6Bh    k                       
  0011  .db 01                                               ; .
  0012  524556455242.. ds "REVERB FACTORY "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 64 00 14 00 14 00  ; ..........d.....
  0044  .db 03 00 1E 00 64 00 4A 00 4A 00 FA 01 F4 1E 14 FF  ; ....d.J.J.......
  0054  .db 05 81 06 65 07 27 07 E1 09 05 09 EF 01 02 00 FD  ; ...e.'..........
  0064  .db 01 02 00 FD 02 02 02 02 02 32 00                 ; .........2.
  006f  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  0094  .db 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13 88  ; ................
  00a4  .db 13 88 13 88                                      ; ....

;; Module 6B code record 01, 6562 bytes, entered at payload start
MODULE_6B_01_CODE_hdr:
  00a8  6B0119AA0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6B_01_entry
MODULE_6B_01_entry:
  00b0  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00B4
  00b4  00B4           dw B4h                            
LAB_M6B_r2_00000__00b6:
  00b6  3477           PSHS  U Y X B A CC                
  00b8  1700EA         LBSR 0x01a5                       
  00bb  17009D         LBSR 0x015b                       
  00be  17013C         LBSR 0x01fd                       
  00c1  8603           LDA #0x3                          
  00c3  B760DA         STA 0x60da                        
  00c6  AD9FFE38       JSR [0xfe38]                      
  00ca  170035         LBSR 0x0102                       
  00cd  B6600A         LDA 0x600a                        
  00d0  816B           CMPA #0x6b                        
  00d2  2707           BEQ 0x00db                        
  00d4  AD9FFED0       JSR [0xfed0]                      
  00d8  170050         LBSR 0x012b                       
LAB_M6B_r2_00000__00db:
  00db  17013E         LBSR 0x021c                       
  00de  17019F         LBSR 0x0280                       
  00e1  8601           LDA #0x1                          
  00e3  B76105         STA 0x6105                        
  00e6  CC0060         LDD #0x60                         
  00e9  FD6106         STD 0x6106                        
  00ec  AD9FFE36       JSR [0xfe36]                      
  00f0  AD9FFDF6       JSR [0xfdf6]                      
  00f4  AD9FFE18       JSR [0xfe18]                      
  00f8  170384         LBSR 0x047f                       
  00fb  AD9FFE10       JSR [0xfe10]                      
  00ff  3577           PULS CC A B X Y U                 
  0101  39             RTS                               

; ---- function FUN_M6B_r2_00000__0102
FUN_M6B_r2_00000__0102:
  0102  3476           PSHS  U Y X B A                   
  0104  1A40           ORCC #0x40                        
  0106  3440           PSHS  U                           
  0108  CC175F         LDD #0x175f                       
  010b  F3600D         ADDD 0x600d                       
  010e  1F01           TFR D,X                           
  0110  CC1792         LDD #0x1792                       
  0113  F3600D         ADDD 0x600d                       
  0116  1F03           TFR D,U                           
  0118  108E6600       LDY #0x6600                       
  011c  AD9FFD08       JSR [0xfd08]                      
  0120  3540           PULS  U                           
  0122  AD9FFD76       JSR [0xfd76]                      
  0126  1CBF           ANDCC #0xbf                       
  0128  3576           PULS  A B X Y U                   
  012a  39             RTS                               

; ---- function FUN_M6B_r2_00000__012b
FUN_M6B_r2_00000__012b:
  012b  3476           PSHS  U Y X B A                   
  012d  C601           LDB #0x1                          
  012f  8E2810         LDX #0x2810                       
  0132  AD9FFD30       JSR [0xfd30]                      
  0136  1026030F       LBNE 0x0449                       
  013a  C602           LDB #0x2                          
  013c  8E2811         LDX #0x2811                       
  013f  AD9FFD30       JSR [0xfd30]                      
  0143  10260302       LBNE 0x0449                       
  0147  C603           LDB #0x3                          
  0149  8E2812         LDX #0x2812                       
  014c  AD9FFD30       JSR [0xfd30]                      
  0150  102602F5       LBNE 0x0449                       
  0154  AD9FFD7C       JSR [0xfd7c]                      
  0158  3576           PULS  A B X Y U                   
  015a  39             RTS                               

; ---- function FUN_M6B_r2_00000__015b
FUN_M6B_r2_00000__015b:
  015b  3476           PSHS  U Y X B A                   
  015d  CC0000         LDD #0x0                          
  0160  FD7002         STD 0x7002                        
  0163  FD7022         STD 0x7022                        
  0166  FD702A         STD 0x702a                        
  0169  FD7032         STD 0x7032                        
  016c  FD703A         STD 0x703a                        
  016f  FD7062         STD 0x7062                        
  0172  FD7064         STD 0x7064                        
  0175  FD7066         STD 0x7066                        
  0178  FD7068         STD 0x7068                        
  017b  FD706A         STD 0x706a                        
  017e  FD706C         STD 0x706c                        
  0181  FD706E         STD 0x706e                        
  0184  FD7070         STD 0x7070                        
  0187  FD7072         STD 0x7072                        
  018a  FD7074         STD 0x7074                        
  018d  FD7076         STD 0x7076                        
  0190  FD700A         STD 0x700a                        
  0193  FD7010         STD 0x7010                        
  0196  FD7016         STD 0x7016                        
  0199  FD701C         STD 0x701c                        
  019c  FD7020         STD 0x7020                        
  019f  FD7028         STD 0x7028                        
  01a2  3576           PULS  A B X Y U                   
  01a4  39             RTS                               

; ---- function FUN_M6B_r2_00000__01a5
FUN_M6B_r2_00000__01a5:
  01a5  3476           PSHS  U Y X B A                   
  01a7  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:08 1A:0E 1B:14 1C:1A
  01ab  19             db 19h                            
  01ac  08             db 8h                             
  01ad  1A             db 1Ah                            
  01ae  0E             db Eh                             
  01af  1B             db 1Bh                            
  01b0  14             db 14h                            
  01b1  1C             db 1Ch                            
  01b2  1A             db 1Ah                            
  01b3  00             db 0h                             
LAB_M6B_r2_00000__01b4:
  01b4  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 49:40 4A:42 4B:44
  01b8  49             db 49h                            
  01b9  40             db 40h                            
  01ba  4A             db 4Ah                            
  01bb  42             db 42h                            
  01bc  4B             db 4Bh                            
  01bd  44             db 44h                            
  01be  00             db 0h                             
LAB_M6B_r2_00000__01bf:
  01bf  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 58:52 59:54 5A:56 5B:58 5C:5A 5D:5C 5E:5E 5F:60
  01c3  58             db 58h                            
  01c4  52             db 52h                            
  01c5  59             db 59h                            
  01c6  54             db 54h                            
  01c7  5A             db 5Ah                            
  01c8  56             db 56h                            
  01c9  5B             db 5Bh                            
  01ca  58             db 58h                            
  01cb  5C             db 5Ch                            
  01cc  5A             db 5Ah                            
  01cd  5D             db 5Dh                            
  01ce  5C             db 5Ch                            
  01cf  5E             db 5Eh                            
  01d0  5E             db 5Eh                            
  01d1  5F             db 5Fh                            
  01d2  60             db 60h                            
  01d3  00             db 0h                             
LAB_M6B_r2_00000__01d4:
  01d4  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 3B:30 3D:38 4C:46 4E:48 50:4A 52:4C 54:4E 56:50 35:00 3F:06
  01d8  3B             db 3Bh                            
  01d9  30             db 30h                            
  01da  3D             db 3Dh                            
  01db  38             db 38h                            
  01dc  4C             db 4Ch                            
  01dd  46             db 46h                            
  01de  4E             db 4Eh                            
  01df  48             db 48h                            
  01e0  50             db 50h                            
  01e1  4A             db 4Ah                            
  01e2  52             db 52h                            
  01e3  4C             db 4Ch                            
  01e4  54             db 54h                            
  01e5  4E             db 4Eh                            
  01e6  56             db 56h                            
  01e7  50             db 50h                            
  01e8  35             db 35h                            
  01e9  00             db 0h                             
  01ea  3F             db 3Fh                            
  01eb  06             db 6h                             
  01ec  00             db 0h                             
LAB_M6B_r2_00000__01ed:
  01ed  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 41:26 43:2E 47:3E 45:36
  01f1  41             db 41h                            
  01f2  26             db 26h                            
  01f3  43             db 43h                            
  01f4  2E             db 2Eh                            
  01f5  47             db 47h                            
  01f6  3E             db 3Eh                            
  01f7  45             db 45h                            
  01f8  36             db 36h                            
  01f9  00             db 0h                             
LAB_M6B_r2_00000__01fa:
  01fa  3576           PULS  A B X Y U                   
  01fc  39             RTS                               

; ---- function FUN_M6B_r2_00000__01fd
FUN_M6B_r2_00000__01fd:
  01fd  3476           PSHS  U Y X B A                   
  01ff  CC0000         LDD #0x0                          
  0202  AD9FFC6C       JSR [0xfc6c]                      
  0206  AD9FFC74       JSR [0xfc74]                      
  020a  171031         LBSR 0x123e                       
  020d  1710A9         LBSR 0x12b9                       
  0210  171121         LBSR 0x1334                       
  0213  171199         LBSR 0x13af                       
  0216  170F8B         LBSR 0x11a4                       
  0219  3576           PULS  A B X Y U                   
  021b  39             RTS                               

; ---- function FUN_M6B_r2_00000__021c
FUN_M6B_r2_00000__021c:
  021c  3476           PSHS  U Y X B A                   
  021e  1714EB         LBSR 0x170c                       
  0221  170916         LBSR 0x0b3a                       
  0224  1709BC         LBSR 0x0be3                       
  0227  1705FF         LBSR 0x0829                       
  022a  170543         LBSR 0x0770                       
  022d  8E0C0A         LDX #0xc0a                        
  0230  AD9FFE76       JSR [0xfe76]                      
  0234  8E0C84         LDX #0xc84                        
  0237  AD9FFE76       JSR [0xfe76]                      
  023b  8E0CFE         LDX #0xcfe                        
  023e  AD9FFE76       JSR [0xfe76]                      
  0242  8E0D78         LDX #0xd78                        
  0245  AD9FFE76       JSR [0xfe76]                      
  0249  17067F         LBSR 0x08cb                       
  024c  8E0DF2         LDX #0xdf2                        
  024f  AD9FFE76       JSR [0xfe76]                      
  0253  8E0E6C         LDX #0xe6c                        
  0256  AD9FFE76       JSR [0xfe76]                      
  025a  8E0EE6         LDX #0xee6                        
  025d  AD9FFE76       JSR [0xfe76]                      
  0261  8E0F60         LDX #0xf60                        
  0264  AD9FFE76       JSR [0xfe76]                      
  0268  170728         LBSR 0x0993                       
  026b  170806         LBSR 0x0a74                       
  026e  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 37:20 39:28
  0272  37             db 37h                            
  0273  20             db 20h                            
  0274  39             db 39h                            
  0275  28             db 28h                            
  0276  00             db 0h                             
LAB_M6B_r2_00000__0277:
  0277  170651         LBSR 0x08cb                       
  027a  170716         LBSR 0x0993                       
  027d  3576           PULS  A B X Y U                   
  027f  39             RTS                               

; ---- function FUN_M6B_r2_00000__0280
FUN_M6B_r2_00000__0280:
  0280  3476           PSHS  U Y X B A                   
  0282  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " decay  " 21 $089E $08AA
  0286  00             db 0h                             
  0287  80             db 80h                            
  0288  206465636179.. ds " decay  "                     
  0290  21             db 21h                            
  0291  089E           addr M6B_r2_00000::089e           
  0293  08AA           addr M6B_r2_00000::08aa           
LAB_M6B_r2_00000__0295:
  0295  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "gate dec" 25 $0966 $0972
  0299  01             db 1h                             
  029a  80             db 80h                            
  029b  676174652064.. ds "gate dec"                     
  02a3  25             db 25h                            
  02a4  0966           addr M6B_r2_00000::0966           
  02a6  0972           addr M6B_r2_00000::0972           
LAB_M6B_r2_00000__02a8:
  02a8  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "gatetime" 29 $07FC $0808
  02ac  02             db 2h                             
  02ad  80             db 80h                            
  02ae  676174657469.. ds "gatetime"                     
  02b6  29             db 29h                            
  02b7  07FC           addr M6B_r2_00000::07fc           
  02b9  0808           addr M6B_r2_00000::0808           
LAB_M6B_r2_00000__02bb:
  02bb  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "predelay" 2D $0743 $074F
  02bf  03             db 3h                             
  02c0  80             db 80h                            
  02c1  70726564656C.. ds "predelay"                     
  02c9  2D             db 2Dh                            
  02ca  0743           addr M6B_r2_00000::0743           
  02cc  074F           addr M6B_r2_00000::074f           
LAB_M6B_r2_00000__02ce:
  02ce  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "  mix   " 31 $1177 $1183
  02d2  04             db 4h                             
  02d3  80             db 80h                            
  02d4  20206D697820.. ds "  mix   "                     
  02dc  31             db 31h                            
  02dd  1177           addr M6B_r2_00000::1177           
  02df  1183           addr M6B_r2_00000::1183           
LAB_M6B_r2_00000__02e1:
  02e1  CC02F2         LDD #0x2f2                        
  02e4  FD60F5         STD 0x60f5                        
  02e7  CC0034         LDD #0x34                         
  02ea  47             ASRA                              
  02eb  56             RORB                              
  02ec  FD60F7         STD 0x60f7                        
  02ef  3576           PULS  A B X Y U                   
  02f1  39             RTS                               
  02f2  03260331033C.. addr[27]                          
  0328  .db 2A 17 01 8C AD 9F FE 10 39                       ; *.......9

; ---- function FUN_M6B_r2_00000__0331
FUN_M6B_r2_00000__0331:
  0331  1703EB         LBSR 0x071f                       
  0334  170148         LBSR 0x047f                       
  0337  AD9FFE10       JSR [0xfe10]                      
  033b  39             RTS                               

; ---- function FUN_M6B_r2_00000__033c
FUN_M6B_r2_00000__033c:
  033c  17053B         LBSR 0x087a                       
  033f  17013D         LBSR 0x047f                       
  0342  AD9FFE12       JSR [0xfe12]                      
  0346  39             RTS                               

; ---- function FUN_M6B_r2_00000__0347
FUN_M6B_r2_00000__0347:
  0347  1705F8         LBSR 0x0942                       
  034a  170132         LBSR 0x047f                       
  034d  AD9FFE14       JSR [0xfe14]                      
  0351  39             RTS                               

; ---- function FUN_M6B_r2_00000__0352
FUN_M6B_r2_00000__0352:
  0352  170483         LBSR 0x07d8                       
  0355  170127         LBSR 0x047f                       
  0358  AD9FFE16       JSR [0xfe16]                      
  035c  39             RTS                               

; ---- function FUN_M6B_r2_00000__035d
FUN_M6B_r2_00000__035d:
  035d  1708DC         LBSR 0x0c3c                       
  0360  1701F9         LBSR 0x055c                       
  0363  AD9FFE10       JSR [0xfe10]                      
  0367  39             RTS                               

; ---- function FUN_M6B_r2_00000__0368
FUN_M6B_r2_00000__0368:
  0368  1709C5         LBSR 0x0d30                       
  036b  1701EE         LBSR 0x055c                       
  036e  AD9FFE12       JSR [0xfe12]                      
  0372  39             RTS                               

; ---- function FUN_M6B_r2_00000__0373
FUN_M6B_r2_00000__0373:
  0373  170940         LBSR 0x0cb6                       
  0376  1701E3         LBSR 0x055c                       
  0379  AD9FFE14       JSR [0xfe14]                      
  037d  39             RTS                               

; ---- function FUN_M6B_r2_00000__037e
FUN_M6B_r2_00000__037e:
  037e  170A29         LBSR 0x0daa                       
  0381  1701D8         LBSR 0x055c                       
  0384  AD9FFE16       JSR [0xfe16]                      
  0388  39             RTS                               

; ---- function FUN_M6B_r2_00000__0389
FUN_M6B_r2_00000__0389:
  0389  170A98         LBSR 0x0e24                       
  038c  170206         LBSR 0x0595                       
  038f  AD9FFE10       JSR [0xfe10]                      
  0393  39             RTS                               

; ---- function FUN_M6B_r2_00000__0394
FUN_M6B_r2_00000__0394:
  0394  170B81         LBSR 0x0f18                       
  0397  1701FB         LBSR 0x0595                       
  039a  AD9FFE12       JSR [0xfe12]                      
  039e  39             RTS                               

; ---- function FUN_M6B_r2_00000__039f
FUN_M6B_r2_00000__039f:
  039f  170AFC         LBSR 0x0e9e                       
  03a2  1701F0         LBSR 0x0595                       
  03a5  AD9FFE14       JSR [0xfe14]                      
  03a9  39             RTS                               

; ---- function FUN_M6B_r2_00000__03aa
FUN_M6B_r2_00000__03aa:
  03aa  170BE5         LBSR 0x0f92                       
  03ad  1701E5         LBSR 0x0595                       
  03b0  AD9FFE16       JSR [0xfe16]                      
  03b4  39             RTS                               

; ---- function FUN_M6B_r2_00000__03b5
FUN_M6B_r2_00000__03b5:
  03b5  1707F2         LBSR 0x0baa                       
  03b8  170168         LBSR 0x0523                       
  03bb  AD9FFE10       JSR [0xfe10]                      
  03bf  39             RTS                               

; ---- function FUN_M6B_r2_00000__03c0
FUN_M6B_r2_00000__03c0:
  03c0  17073E         LBSR 0x0b01                       
  03c3  17015D         LBSR 0x0523                       
  03c6  AD9FFE12       JSR [0xfe12]                      
  03ca  39             RTS                               

; ---- function FUN_M6B_r2_00000__03cb
FUN_M6B_r2_00000__03cb:
  03cb  17063E         LBSR 0x0a0c                       
  03ce  170152         LBSR 0x0523                       
  03d1  AD9FFE14       JSR [0xfe14]                      
  03d5  39             RTS                               

; ---- function FUN_M6B_r2_00000__03d6
FUN_M6B_r2_00000__03d6:
  03d6  170C01         LBSR 0x0fda                       
  03d9  170216         LBSR 0x05f2                       
  03dc  AD9FFE10       JSR [0xfe10]                      
  03e0  39             RTS                               

; ---- function FUN_M6B_r2_00000__03e1
FUN_M6B_r2_00000__03e1:
  03e1  170BFD         LBSR 0x0fe1                       
  03e4  17020B         LBSR 0x05f2                       
  03e7  AD9FFE12       JSR [0xfe12]                      
  03eb  39             RTS                               

; ---- function FUN_M6B_r2_00000__03ec
FUN_M6B_r2_00000__03ec:
  03ec  170BF9         LBSR 0x0fe8                       
  03ef  170200         LBSR 0x05f2                       
  03f2  AD9FFE14       JSR [0xfe14]                      
  03f6  39             RTS                               

; ---- function FUN_M6B_r2_00000__03f7
FUN_M6B_r2_00000__03f7:
  03f7  170BF5         LBSR 0x0fef                       
  03fa  1701F5         LBSR 0x05f2                       
  03fd  AD9FFE16       JSR [0xfe16]                      
  0401  39             RTS                               

; ---- function FUN_M6B_r2_00000__0402
FUN_M6B_r2_00000__0402:
  0402  170BF1         LBSR 0x0ff6                       
  0405  170223         LBSR 0x062b                       
  0408  AD9FFE10       JSR [0xfe10]                      
  040c  39             RTS                               

; ---- function FUN_M6B_r2_00000__040d
FUN_M6B_r2_00000__040d:
  040d  170BED         LBSR 0x0ffd                       
  0410  170218         LBSR 0x062b                       
  0413  AD9FFE12       JSR [0xfe12]                      
  0417  39             RTS                               

; ---- function FUN_M6B_r2_00000__0418
FUN_M6B_r2_00000__0418:
  0418  170DEA         LBSR 0x1205                       
  041b  17026A         LBSR 0x0688                       
  041e  AD9FFE10       JSR [0xfe10]                      
  0422  39             RTS                               

; ---- function FUN_M6B_r2_00000__0423
FUN_M6B_r2_00000__0423:
  0423  170E5A         LBSR 0x1280                       
  0426  17025F         LBSR 0x0688                       
  0429  AD9FFE12       JSR [0xfe12]                      
  042d  39             RTS                               

; ---- function FUN_M6B_r2_00000__042e
FUN_M6B_r2_00000__042e:
  042e  170ECA         LBSR 0x12fb                       
  0431  170286         LBSR 0x06ba                       
  0434  AD9FFE10       JSR [0xfe10]                      
  0438  39             RTS                               

; ---- function FUN_M6B_r2_00000__0439
FUN_M6B_r2_00000__0439:
  0439  170F3A         LBSR 0x1376                       
  043c  17027B         LBSR 0x06ba                       
  043f  AD9FFE12       JSR [0xfe12]                      
  0443  39             RTS                               

; ---- function FUN_M6B_r2_00000__0444
FUN_M6B_r2_00000__0444:
  0444  AD9FFDFC       JSR [0xfdfc]                      
  0448  39             RTS                               
LAB_M6B_r2_00000__0449:
  0449  C600           LDB #0x0                          
  044b  AD9FFC36       JSR [0xfc36]                      
  044f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0453  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M6B_r2_00000__047c:
  047c  3577           PULS CC A B X Y U                 
  047e  39             RTS                               

; ---- function FUN_M6B_r2_00000__047f
FUN_M6B_r2_00000__047f:
  047f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "predelay" "on decay" "offdecay" "gatetime"
  0483  70726564656C.. ds "predelay"                     
  048b  6F6E20646563.. ds "on decay"                     
  0493  6F6666646563.. ds "offdecay"                     
  049b  676174657469.. ds "gatetime"                     
LAB_M6B_r2_00000__04a3:
  04a3  AD9FFDF2       JSR [0xfdf2]                      
  04a7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0713 ->$086E ->$0936 ->$07CC ->$04B8 ->$04B8
  04ab  0713           addr M6B_r2_00000::0713           
  04ad  086E           addr M6B_r2_00000::086e           
  04af  0936           addr M6B_r2_00000::0936           
  04b1  07CC           addr M6B_r2_00000::07cc           
  04b3  04B8           addr M6B_r2_00000::04b8           
  04b5  04B8           addr M6B_r2_00000::04b8           
LAB_M6B_r2_00000__04b7:
  04b7  39             RTS                               

; ---- function FUN_M6B_r2_00000__04b8
FUN_M6B_r2_00000__04b8:
  04b8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [*] " levels " " expert "
  04bc  20206D697820.. ds "  mix   "                     
  04c4  01             db 1h                             
  04c5  206C6576656C.. ds " levels "                     
  04cd  206578706572.. ds " expert "                     
LAB_M6B_r2_00000__04d5:
  04d5  AD9FFDF2       JSR [0xfdf2]                      
  04d9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1147 ->$06EC ->$0688 ->$04EA ->$047F ->$047F
  04dd  1147           addr M6B_r2_00000::1147           
  04df  06EC           addr M6B_r2_00000::06ec           
  04e1  0688           addr M6B_r2_00000::0688           
  04e3  04EA           addr M6B_r2_00000::04ea           
  04e5  047F           addr M6B_r2_00000::047f           
  04e7  047F           addr M6B_r2_00000::047f           
LAB_M6B_r2_00000__04e9:
  04e9  39             RTS                               

; ---- function FUN_M6B_r2_00000__04ea
FUN_M6B_r2_00000__04ea:
  04ea  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "   eq   " " gate   " " delays " " return "
  04ee  202020657120.. ds "   eq   "                     
  04f6  206761746520.. ds " gate   "                     
  04fe  2064656C6179.. ds " delays "                     
  0506  207265747572.. ds " return "                     
LAB_M6B_r2_00000__050e:
  050e  AD9FFDF2       JSR [0xfdf2]                      
  0512  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$055C ->$0523 ->$05F2 ->$04B8 ->$04EA ->$04EA
  0516  055C           addr M6B_r2_00000::055c           
  0518  0523           addr M6B_r2_00000::0523           
  051a  05F2           addr M6B_r2_00000::05f2           
  051c  04B8           addr M6B_r2_00000::04b8           
  051e  04EA           addr M6B_r2_00000::04ea           
  0520  04EA           addr M6B_r2_00000::04ea           
LAB_M6B_r2_00000__0522:
  0522  39             RTS                               

; ---- function FUN_M6B_r2_00000__0523
FUN_M6B_r2_00000__0523:
  0523  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " speed  " " thresh " " enable " " return "
  0527  207370656564.. ds " speed  "                     
  052f  207468726573.. ds " thresh "                     
  0537  20656E61626C.. ds " enable "                     
  053f  207265747572.. ds " return "                     
LAB_M6B_r2_00000__0547:
  0547  AD9FFDF2       JSR [0xfdf2]                      
  054b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0B9E ->$0AF5 ->$0A00 ->$04EA ->$0523 ->$0523
  054f  0B9E           addr M6B_r2_00000::0b9e           
  0551  0AF5           addr M6B_r2_00000::0af5           
  0553  0A00           addr M6B_r2_00000::0a00           
  0555  04EA           addr M6B_r2_00000::04ea           
  0557  0523           addr M6B_r2_00000::0523           
  0559  0523           addr M6B_r2_00000::0523           
LAB_M6B_r2_00000__055b:
  055b  39             RTS                               

; ---- function FUN_M6B_r2_00000__055c
FUN_M6B_r2_00000__055c:
  055c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "on lfreq" "on lowdB" "on hfreq" "on  hidB"
  0560  6F6E206C6672.. ds "on lfreq"                     
  0568  6F6E206C6F77.. ds "on lowdB"                     
  0570  6F6E20686672.. ds "on hfreq"                     
  0578  6F6E20206869.. ds "on  hidB"                     
LAB_M6B_r2_00000__0580:
  0580  AD9FFDF2       JSR [0xfdf2]                      
  0584  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C30 ->$0D24 ->$0CAA ->$0D9E ->$0595 ->$05CE
  0588  0C30           addr M6B_r2_00000::0c30           
  058a  0D24           addr M6B_r2_00000::0d24           
  058c  0CAA           addr M6B_r2_00000::0caa           
  058e  0D9E           addr M6B_r2_00000::0d9e           
  0590  0595           addr M6B_r2_00000::0595           
  0592  05CE           addr M6B_r2_00000::05ce           
LAB_M6B_r2_00000__0594:
  0594  39             RTS                               

; ---- function FUN_M6B_r2_00000__0595
FUN_M6B_r2_00000__0595:
  0595  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "offlfreq" "offlowdB" "offhfreq" "off hidB"
  0599  6F66666C6672.. ds "offlfreq"                     
  05a1  6F66666C6F77.. ds "offlowdB"                     
  05a9  6F6666686672.. ds "offhfreq"                     
  05b1  6F6666206869.. ds "off hidB"                     
LAB_M6B_r2_00000__05b9:
  05b9  AD9FFDF2       JSR [0xfdf2]                      
  05bd  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0E18 ->$0F0C ->$0E92 ->$0F86 ->$05CE ->$055C
  05c1  0E18           addr M6B_r2_00000::0e18           
  05c3  0F0C           addr M6B_r2_00000::0f0c           
  05c5  0E92           addr M6B_r2_00000::0e92           
  05c7  0F86           addr M6B_r2_00000::0f86           
  05c9  05CE           addr M6B_r2_00000::05ce           
  05cb  055C           addr M6B_r2_00000::055c           
LAB_M6B_r2_00000__05cd:
  05cd  39             RTS                               

; ---- function FUN_M6B_r2_00000__05ce
FUN_M6B_r2_00000__05ce:
  05ce  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  05d2  01             db 1h                             
  05d3  01             db 1h                             
  05d4  01             db 1h                             
  05d5  207265747572.. ds " return "                     
LAB_M6B_r2_00000__05dd:
  05dd  AD9FFDF2       JSR [0xfdf2]                      
  05e1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$06EC ->$06EC ->$06EC ->$04EA ->$055C ->$0595
  05e5  06EC           addr M6B_r2_00000::06ec           
  05e7  06EC           addr M6B_r2_00000::06ec           
  05e9  06EC           addr M6B_r2_00000::06ec           
  05eb  04EA           addr M6B_r2_00000::04ea           
  05ed  055C           addr M6B_r2_00000::055c           
  05ef  0595           addr M6B_r2_00000::0595           
LAB_M6B_r2_00000__05f1:
  05f1  39             RTS                               

; ---- function FUN_M6B_r2_00000__05f2
FUN_M6B_r2_00000__05f2:
  05f2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 "
  05f6  64656C617920.. ds "delay 1 "                     
  05fe  64656C617920.. ds "delay 2 "                     
  0606  64656C617920.. ds "delay 3 "                     
  060e  64656C617920.. ds "delay 4 "                     
LAB_M6B_r2_00000__0616:
  0616  AD9FFDF2       JSR [0xfdf2]                      
  061a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1030 ->$103A ->$1044 ->$104E ->$062B ->$062B
  061e  1030           addr M6B_r2_00000::1030           
  0620  103A           addr M6B_r2_00000::103a           
  0622  1044           addr M6B_r2_00000::1044           
  0624  104E           addr M6B_r2_00000::104e           
  0626  062B           addr M6B_r2_00000::062b           
  0628  062B           addr M6B_r2_00000::062b           
LAB_M6B_r2_00000__062a:
  062a  39             RTS                               

; ---- function FUN_M6B_r2_00000__062b
FUN_M6B_r2_00000__062b:
  062b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 5 " "delay 6 " [*] " return "
  062f  64656C617920.. ds "delay 5 "                     
  0637  64656C617920.. ds "delay 6 "                     
  063f  01             db 1h                             
  0640  207265747572.. ds " return "                     
LAB_M6B_r2_00000__0648:
  0648  AD9FFDF2       JSR [0xfdf2]                      
  064c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1058 ->$1062 ->$06EC ->$04EA ->$05F2 ->$05F2
  0650  1058           addr M6B_r2_00000::1058           
  0652  1062           addr M6B_r2_00000::1062           
  0654  06EC           addr M6B_r2_00000::06ec           
  0656  04EA           addr M6B_r2_00000::04ea           
  0658  05F2           addr M6B_r2_00000::05f2           
  065a  05F2           addr M6B_r2_00000::05f2           
LAB_M6B_r2_00000__065c:
  065c  39             RTS                               

; ---- function FUN_M6B_r2_00000__065d
FUN_M6B_r2_00000__065d:
  065d  C633           LDB #0x33                         
  065f  AD9FFC36       JSR [0xfc36]                      
  0663  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range  "
  0667  2072616E6765.. char[9] " range  "                
LAB_M6B_r2_00000__0670:
  0670  C63D           LDB #0x3d                         
  0672  AD9FFC36       JSR [0xfc36]                      
  0676  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "perclick"
  067a  706572636C69.. char[9] "perclick"                
LAB_M6B_r2_00000__0683:
  0683  AD9FFDF2       JSR [0xfdf2]                      
  0687  39             RTS                               

; ---- function FUN_M6B_r2_00000__0688
FUN_M6B_r2_00000__0688:
  0688  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  068c  6C6566742069.. ds "left in "                     
  0694  726967687420.. ds "right in"                     
  069c  01             db 1h                             
  069d  207265747572.. ds " return "                     
LAB_M6B_r2_00000__06a5:
  06a5  AD9FFDF2       JSR [0xfdf2]                      
  06a9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$11F9 ->$1274 ->$06EC ->$04B8 ->$06BA ->$06BA
  06ad  11F9           addr M6B_r2_00000::11f9           
  06af  1274           addr M6B_r2_00000::1274           
  06b1  06EC           addr M6B_r2_00000::06ec           
  06b3  04B8           addr M6B_r2_00000::04b8           
  06b5  06BA           addr M6B_r2_00000::06ba           
  06b7  06BA           addr M6B_r2_00000::06ba           
LAB_M6B_r2_00000__06b9:
  06b9  39             RTS                               

; ---- function FUN_M6B_r2_00000__06ba
FUN_M6B_r2_00000__06ba:
  06ba  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  06be  6C656674206F.. ds "left out"                     
  06c6  72696768746F.. ds "rightout"                     
  06ce  01             db 1h                             
  06cf  207265747572.. ds " return "                     
LAB_M6B_r2_00000__06d7:
  06d7  AD9FFDF2       JSR [0xfdf2]                      
  06db  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$12EF ->$136A ->$06EC ->$04B8 ->$0688 ->$0688
  06df  12EF           addr M6B_r2_00000::12ef           
  06e1  136A           addr M6B_r2_00000::136a           
  06e3  06EC           addr M6B_r2_00000::06ec           
  06e5  04B8           addr M6B_r2_00000::04b8           
  06e7  0688           addr M6B_r2_00000::0688           
  06e9  0688           addr M6B_r2_00000::0688           
LAB_M6B_r2_00000__06eb:
  06eb  39             RTS                               

; ---- function FUN_M6B_r2_00000__06ec
FUN_M6B_r2_00000__06ec:
  06ec  39             RTS                               
PTR_FUN_M6B_r2_00000__0770_M6B_r2_00000__06ed:
  06ed  0770           addr M6B_r2_00000::0770           
  06ef  0737           addr M6B_r2_00000::0737           
  06f1  .db 07 2B 70 38 70 3A 00 00 70 3C 00 08 00 45 01 00  ; .+p8p:..p<...E..
  0701  .db 00 01 F4 00 01 00 03 1F 07 5B 00 00 00 00 70 3E  ; .........[....p>
  0711  .db 00 4F                                            ; .O

; ---- function FUN_M6B_r2_00000__0713
FUN_M6B_r2_00000__0713:
  0713  3410           PSHS  X                           
  0715  8E06ED         LDX #0x6ed                         ; desc[API_FE6A]: ->$0770 ->$0737
  0718  AD9FFE6A       JSR [0xfe6a]                      
  071c  3510           PULS  X                           
  071e  39             RTS                               

; ---- function FUN_M6B_r2_00000__071f
FUN_M6B_r2_00000__071f:
  071f  3410           PSHS  X                           
  0721  8E06ED         LDX #0x6ed                         ; desc[API_FDBC]: ->$0770 ->$0737
  0724  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0728  3510           PULS  X                           
  072a  39             RTS                               

; ---- function FUN_M6B_r2_00000__072b
FUN_M6B_r2_00000__072b:
  072b  3410           PSHS  X                           
  072d  8E06ED         LDX #0x6ed                         ; desc[API_FE6C]: ->$0770 ->$0737
  0730  AD9FFE6C       JSR [0xfe6c]                      
  0734  3510           PULS  X                           
  0736  39             RTS                               

; ---- function FUN_M6B_r2_00000__0737
FUN_M6B_r2_00000__0737:
  0737  3410           PSHS  X                           
  0739  8E06ED         LDX #0x6ed                         ; desc[API_FE6E]: ->$0770 ->$0737
  073c  AD9FFE6E       JSR [0xfe6e]                      
  0740  3510           PULS  X                           
  0742  39             RTS                               

; ---- function FUN_M6B_r2_00000__0743
FUN_M6B_r2_00000__0743:
  0743  3410           PSHS  X                           
  0745  8E06ED         LDX #0x6ed                         ; desc[API_FE1C]: ->$0770 ->$0737
  0748  AD9FFE1C       JSR [0xfe1c]                      
  074c  3510           PULS  X                           
  074e  39             RTS                               

; ---- function FUN_M6B_r2_00000__074f
FUN_M6B_r2_00000__074f:
  074f  3410           PSHS  X                           
  0751  8E06ED         LDX #0x6ed                         ; desc[API_FE1A]: ->$0770 ->$0737 $072B
  0754  AD9FFE1A       JSR [0xfe1a]                      
  0758  3510           PULS  X                           
  075a  39             RTS                               
  075b  .db 14 70 72 65 64 65 6C 61 79 20 3D 20 20 20 20 20  ; .predelay =     
  076b  .db 20 20 20 6D 53                                   ;    mS

; ---- function FUN_M6B_r2_00000__0770
FUN_M6B_r2_00000__0770:
  0770  3476           PSHS  U Y X B A                   
  0772  8E06ED         LDX #0x6ed                        
  0775  AD9FFE76       JSR [0xfe76]                      
  0779  FC703C         LDD 0x703c                        
  077c  3606           PSHU  B A                         
  077e  CC002C         LDD #0x2c                         
  0781  3606           PSHU  B A                         
  0783  AD9FFCF0       JSR [0xfcf0]                      
  0787  3706           PULU  A B                         
  0789  3706           PULU  A B                         
  078b  C30001         ADDD #0x1                         
  078e  FD70C4         STD 0x70c4                        
  0791  CC000A         LDD #0xa                          
  0794  AD9FFD20       JSR [0xfd20]                      
  0798  108E0451       LDY #0x451                        
  079c  FC70C4         LDD 0x70c4                        
  079f  AD9FFD2E       JSR [0xfd2e]                      
  07a3  3576           PULS  A B X Y U                   
  07a5  39             RTS                               
PTR_FUN_M6B_r2_00000__0829_M6B_r2_00000__07a6:
  07a6  0829           addr M6B_r2_00000::0829           
  07a8  07F0           addr M6B_r2_00000::07f0           
  07aa  .db 07 E4 70 30 70 32 00 00 70 34 00 08 00 43 04 00  ; ..p0p2..p4...C..
  07ba  .db 00 00 FA 00 01 01 04 20 08 14 00 00 00 00 70 36  ; ....... ......p6
  07ca  .db 00 4D                                            ; .M

; ---- function FUN_M6B_r2_00000__07cc
FUN_M6B_r2_00000__07cc:
  07cc  3410           PSHS  X                           
  07ce  8E07A6         LDX #0x7a6                         ; desc[API_FE6A]: ->$0829 ->$07F0
  07d1  AD9FFE6A       JSR [0xfe6a]                      
  07d5  3510           PULS  X                           
  07d7  39             RTS                               

; ---- function FUN_M6B_r2_00000__07d8
FUN_M6B_r2_00000__07d8:
  07d8  3410           PSHS  X                           
  07da  8E07A6         LDX #0x7a6                         ; desc[API_FDBC]: ->$0829 ->$07F0
  07dd  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  07e1  3510           PULS  X                           
  07e3  39             RTS                               

; ---- function FUN_M6B_r2_00000__07e4
FUN_M6B_r2_00000__07e4:
  07e4  3410           PSHS  X                           
  07e6  8E07A6         LDX #0x7a6                         ; desc[API_FE6C]: ->$0829 ->$07F0
  07e9  AD9FFE6C       JSR [0xfe6c]                      
  07ed  3510           PULS  X                           
  07ef  39             RTS                               

; ---- function FUN_M6B_r2_00000__07f0
FUN_M6B_r2_00000__07f0:
  07f0  3410           PSHS  X                           
  07f2  8E07A6         LDX #0x7a6                         ; desc[API_FE6E]: ->$0829 ->$07F0
  07f5  AD9FFE6E       JSR [0xfe6e]                      
  07f9  3510           PULS  X                           
  07fb  39             RTS                               

; ---- function FUN_M6B_r2_00000__07fc
FUN_M6B_r2_00000__07fc:
  07fc  3410           PSHS  X                           
  07fe  8E07A6         LDX #0x7a6                         ; desc[API_FE1C]: ->$0829 ->$07F0
  0801  AD9FFE1C       JSR [0xfe1c]                      
  0805  3510           PULS  X                           
  0807  39             RTS                               

; ---- function FUN_M6B_r2_00000__0808
FUN_M6B_r2_00000__0808:
  0808  3410           PSHS  X                           
  080a  8E07A6         LDX #0x7a6                         ; desc[API_FE1A]: ->$0829 ->$07F0 $07E4
  080d  AD9FFE1A       JSR [0xfe1a]                      
  0811  3510           PULS  X                           
  0813  39             RTS                               
  0814  .db 14 67 61 74 65 20 74 69 6D 65 3A 20 20 20 20 20  ; .gate time:     
  0824  .db 20 20 73 65 63                                   ;   sec

; ---- function FUN_M6B_r2_00000__0829
FUN_M6B_r2_00000__0829:
  0829  3476           PSHS  U Y X B A                   
  082b  8E07A6         LDX #0x7a6                        
  082e  AD9FFE76       JSR [0xfe76]                      
  0832  FC7034         LDD 0x7034                        
  0835  3606           PSHU  B A                         
  0837  CC0044         LDD #0x44                         
  083a  3606           PSHU  B A                         
  083c  AD9FFCEE       JSR [0xfcee]                      
  0840  3706           PULU  A B                         
  0842  FD70A6         STD 0x70a6                        
  0845  3576           PULS  A B X Y U                   
  0847  39             RTS                               
PTR_FUN_M6B_r2_00000__08cb_M6B_r2_00000__0848:
  0848  08CB           addr M6B_r2_00000::08cb           
  084a  0892           addr M6B_r2_00000::0892           
  084c  .db 08 86 70 20 70 22 00 00 70 24 00 08 00 3F 02 00  ; ..p p"..p$...?..
  085c  .db 00 00 4A 00 01 00 03 20 08 B6 00 00 18 DB 70 26  ; ..J.... ......p&
  086c  .db 00 49                                            ; .I

; ---- function FUN_M6B_r2_00000__086e
FUN_M6B_r2_00000__086e:
  086e  3410           PSHS  X                           
  0870  8E0848         LDX #0x848                        
  0873  AD9FFC4E       JSR [0xfc4e]                      
  0877  3510           PULS  X                           
  0879  39             RTS                               

; ---- function FUN_M6B_r2_00000__087a
FUN_M6B_r2_00000__087a:
  087a  3410           PSHS  X                           
  087c  8E0848         LDX #0x848                         ; desc[API_FDBC]: ->$08CB ->$0892
  087f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...H"
  0883  3510           PULS  X                           
  0885  39             RTS                               

; ---- function FUN_M6B_r2_00000__0886
FUN_M6B_r2_00000__0886:
  0886  3410           PSHS  X                           
  0888  8E0848         LDX #0x848                         ; desc[API_FE6C]: ->$08CB ->$0892
  088b  AD9FFE6C       JSR [0xfe6c]                      
  088f  3510           PULS  X                           
  0891  39             RTS                               

; ---- function FUN_M6B_r2_00000__0892
FUN_M6B_r2_00000__0892:
  0892  3410           PSHS  X                           
  0894  8E0848         LDX #0x848                        
  0897  AD9FFC52       JSR [0xfc52]                      
  089b  3510           PULS  X                           
  089d  39             RTS                               

; ---- function FUN_M6B_r2_00000__089e
FUN_M6B_r2_00000__089e:
  089e  3410           PSHS  X                           
  08a0  8E0848         LDX #0x848                         ; desc[API_FE1C]: ->$08CB ->$0892
  08a3  AD9FFE1C       JSR [0xfe1c]                      
  08a7  3510           PULS  X                           
  08a9  39             RTS                               

; ---- function FUN_M6B_r2_00000__08aa
FUN_M6B_r2_00000__08aa:
  08aa  3410           PSHS  X                           
  08ac  8E0848         LDX #0x848                         ; desc[API_FE1A]: ->$08CB ->$0892 $0886
  08af  AD9FFE1A       JSR [0xfe1a]                      
  08b3  3510           PULS  X                           
  08b5  39             RTS                               
  08b6  .db 14 64 65 63 61 79 20 6F 70 65 6E 3A 20 20 20 20  ; .decay open:    
  08c6  .db 20 20 73 65 63                                   ;   sec

; ---- function FUN_M6B_r2_00000__08cb
FUN_M6B_r2_00000__08cb:
  08cb  3476           PSHS  U Y X B A                   
  08cd  8E0848         LDX #0x848                        
  08d0  AD9FFE76       JSR [0xfe76]                      
  08d4  FC7024         LDD 0x7024                        
  08d7  F37024         ADDD 0x7024                       
  08da  C319BC         ADDD #0x19bc                      
  08dd  F3600D         ADDD 0x600d                       
  08e0  1F01           TFR D,X                           
  08e2  EC84           LDD ,X                            
  08e4  FD70A2         STD 0x70a2                        
  08e7  170AD5         LBSR 0x13bf                       
  08ea  FC70A2         LDD 0x70a2                        
  08ed  10B370A4       CMPD 0x70a4                       
  08f1  102D0018       LBLT 0x090d                       
  08f5  CC727B         LDD #0x727b                       
  08f8  FD70C4         STD 0x70c4                        
  08fb  CC000A         LDD #0xa                          
  08fe  AD9FFD20       JSR [0xfd20]                      
  0902  108E024D       LDY #0x24d                        
  0906  FC70C4         LDD 0x70c4                        
  0909  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6B_r2_00000__090d:
  090d  3576           PULS  A B X Y U                   
  090f  39             RTS                               
PTR_FUN_M6B_r2_00000__0993_M6B_r2_00000__0910:
  0910  0993           addr M6B_r2_00000::0993           
  0912  095A           addr M6B_r2_00000::095a           
  0914  .db 09 4E 70 28 70 2A 00 00 70 2C 00 08 00 41 03 00  ; .Np(p*..p,...A..
  0924  .db 00 00 4A 00 01 00 03 21 09 7E 00 00 18 DB 70 2E  ; ..J....!.~....p.
  0934  .db 00 4B                                            ; .K

; ---- function FUN_M6B_r2_00000__0936
FUN_M6B_r2_00000__0936:
  0936  3410           PSHS  X                           
  0938  8E0910         LDX #0x910                        
  093b  AD9FFC4E       JSR [0xfc4e]                      
  093f  3510           PULS  X                           
  0941  39             RTS                               

; ---- function FUN_M6B_r2_00000__0942
FUN_M6B_r2_00000__0942:
  0942  3410           PSHS  X                           
  0944  8E0910         LDX #0x910                         ; desc[API_FDBC]: ->$0993 ->$095A
  0947  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  094b  3510           PULS  X                           
  094d  39             RTS                               

; ---- function FUN_M6B_r2_00000__094e
FUN_M6B_r2_00000__094e:
  094e  3410           PSHS  X                           
  0950  8E0910         LDX #0x910                         ; desc[API_FE6C]: ->$0993 ->$095A
  0953  AD9FFE6C       JSR [0xfe6c]                      
  0957  3510           PULS  X                           
  0959  39             RTS                               

; ---- function FUN_M6B_r2_00000__095a
FUN_M6B_r2_00000__095a:
  095a  3410           PSHS  X                           
  095c  8E0910         LDX #0x910                        
  095f  AD9FFC52       JSR [0xfc52]                      
  0963  3510           PULS  X                           
  0965  39             RTS                               

; ---- function FUN_M6B_r2_00000__0966
FUN_M6B_r2_00000__0966:
  0966  3410           PSHS  X                           
  0968  8E0910         LDX #0x910                         ; desc[API_FE1C]: ->$0993 ->$095A
  096b  AD9FFE1C       JSR [0xfe1c]                      
  096f  3510           PULS  X                           
  0971  39             RTS                               

; ---- function FUN_M6B_r2_00000__0972
FUN_M6B_r2_00000__0972:
  0972  3410           PSHS  X                           
  0974  8E0910         LDX #0x910                         ; desc[API_FE1A]: ->$0993 ->$095A $094E
  0977  AD9FFE1A       JSR [0xfe1a]                      
  097b  3510           PULS  X                           
  097d  39             RTS                               
  097e  .db 14 64 65 63 61 79 20 63 6C 6F 73 65 3A 20 20 20  ; .decay close:   
  098e  .db 20 20 73 65 63                                   ;   sec

; ---- function FUN_M6B_r2_00000__0993
FUN_M6B_r2_00000__0993:
  0993  3476           PSHS  U Y X B A                   
  0995  8E0910         LDX #0x910                        
  0998  AD9FFE76       JSR [0xfe76]                      
  099c  FC702C         LDD 0x702c                        
  099f  F3702C         ADDD 0x702c                       
  09a2  C319BC         ADDD #0x19bc                      
  09a5  F3600D         ADDD 0x600d                       
  09a8  1F01           TFR D,X                           
  09aa  EC84           LDD ,X                            
  09ac  FD70A4         STD 0x70a4                        
  09af  170B66         LBSR 0x1518                       
  09b2  FC70A4         LDD 0x70a4                        
  09b5  10B370A2       CMPD 0x70a2                       
  09b9  102D0018       LBLT 0x09d5                       
  09bd  CC727B         LDD #0x727b                       
  09c0  FD70C4         STD 0x70c4                        
  09c3  CC000A         LDD #0xa                          
  09c6  AD9FFD20       JSR [0xfd20]                      
  09ca  108E024D       LDY #0x24d                        
  09ce  FC70C4         LDD 0x70c4                        
  09d1  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6B_r2_00000__09d5:
  09d5  3576           PULS  A B X Y U                   
  09d7  39             RTS                               
PTR_FUN_M6B_r2_00000__0a74_M6B_r2_00000__09d8:
  09d8  0A74           addr M6B_r2_00000::0a74           
  09da  0A24           addr M6B_r2_00000::0a24           
  09dc  .db 0A 18 70 44 70 66 00 00 70 7C 00 08 00 53 0F FF  ; ..pDpf..p|...S..
  09ec  .db FF 00 00 00 01 00 02 1E 09 FE 00 00 00 00 00 00  ; ................
  09fc  .db 00 00 14 20                                      ; ... 

; ---- function FUN_M6B_r2_00000__0a00
FUN_M6B_r2_00000__0a00:
  0a00  3410           PSHS  X                           
  0a02  8E09D8         LDX #0x9d8                        
  0a05  AD9FFE74       JSR [0xfe74]                      
  0a09  3510           PULS  X                           
  0a0b  39             RTS                               

; ---- function FUN_M6B_r2_00000__0a0c
FUN_M6B_r2_00000__0a0c:
  0a0c  3410           PSHS  X                           
  0a0e  8E09D8         LDX #0x9d8                         ; desc[API_FE22]: ->$0A74 ->$0A24
  0a11  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0a15  3510           PULS  X                           
  0a17  39             RTS                               

; ---- function FUN_M6B_r2_00000__0a18
FUN_M6B_r2_00000__0a18:
  0a18  3410           PSHS  X                           
  0a1a  8E09D8         LDX #0x9d8                        
  0a1d  AD9FFE70       JSR [0xfe70]                      
  0a21  3510           PULS  X                           
  0a23  39             RTS                               

; ---- function FUN_M6B_r2_00000__0a24
FUN_M6B_r2_00000__0a24:
  0a24  3456           PSHS  U X B A                     
  0a26  FC7044         LDD 0x7044                        
  0a29  10830000       CMPD #0x0                         
  0a2d  10270021       LBEQ 0x0a52                       
  0a31  C614           LDB #0x14                         
  0a33  AD9FFC36       JSR [0xfc36]                      
  0a37  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "gate is disabled    "
  0a3b  676174652069.. char[21] "gate is disabled    "   
LAB_M6B_r2_00000__0a50:
  0a50  201F           BRA 0x0a71                        
LAB_M6B_r2_00000__0a52:
  0a52  C614           LDB #0x14                         
  0a54  AD9FFC36       JSR [0xfc36]                      
  0a58  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "gate is enabled     "
  0a5c  676174652069.. char[21] "gate is enabled     "   
LAB_M6B_r2_00000__0a71:
  0a71  3556           PULS  A B X U                     
  0a73  39             RTS                               

; ---- function FUN_M6B_r2_00000__0a74
FUN_M6B_r2_00000__0a74:
  0a74  3476           PSHS  U Y X B A                   
  0a76  8E09D8         LDX #0x9d8                        
  0a79  AD9FFE76       JSR [0xfe76]                      
  0a7d  FC707C         LDD 0x707c                        
  0a80  10830000       CMPD #0x0                         
  0a84  10270023       LBEQ 0x0aab                       
  0a88  CC06EC         LDD #0x6ec                        
  0a8b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  0a8f  6097           addr 6097                         
LAB_M6B_r2_00000__0a91:
  0a91  CC000A         LDD #0xa                          
  0a94  AD9FFD20       JSR [0xfd20]                      
  0a98  108E074A       LDY #0x74a                        
  0a9c  CC0000         LDD #0x0                          
  0a9f  AD9FFD2E       JSR [0xfd2e]                      
  0aa3  CC0000         LDD #0x0                          
  0aa6  FD70DA         STD 0x70da                        
  0aa9  2021           BRA 0x0acc                        
LAB_M6B_r2_00000__0aab:
  0aab  CC1792         LDD #0x1792                       
  0aae  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  0ab2  6097           addr 6097                         
LAB_M6B_r2_00000__0ab4:
  0ab4  CC000A         LDD #0xa                          
  0ab7  AD9FFD20       JSR [0xfd20]                      
  0abb  108E074A       LDY #0x74a                        
  0abf  CCFFFF         LDD #0xffff                       
  0ac2  AD9FFD2E       JSR [0xfd2e]                      
  0ac6  CCFFFF         LDD #0xffff                       
  0ac9  FD70DA         STD 0x70da                        
LAB_M6B_r2_00000__0acc:
  0acc  3576           PULS  A B X Y U                   
  0ace  39             RTS                               
PTR_FUN_M6B_r2_00000__0b3a_M6B_r2_00000__0acf:
  0acf  0B3A           addr M6B_r2_00000::0b3a           
  0ad1  0B19           addr M6B_r2_00000::0b19           
  0ad3  .db 0B 0D 70 40 70 62 00 00 70 78 00 08 00 51 0E 00  ; ..p@pb..px...Q..
  0ae3  .db 01 00 64 00 01 00 03 23 0B 25 00 00 00 00 00 00  ; ..d....#.%......
  0af3  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__0af5
FUN_M6B_r2_00000__0af5:
  0af5  3410           PSHS  X                           
  0af7  8E0ACF         LDX #0xacf                        
  0afa  AD9FFE74       JSR [0xfe74]                      
  0afe  3510           PULS  X                           
  0b00  39             RTS                               

; ---- function FUN_M6B_r2_00000__0b01
FUN_M6B_r2_00000__0b01:
  0b01  3410           PSHS  X                           
  0b03  8E0ACF         LDX #0xacf                         ; desc[API_FE22]: ->$0B3A ->$0B19
  0b06  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0b0a  3510           PULS  X                           
  0b0c  39             RTS                               

; ---- function FUN_M6B_r2_00000__0b0d
FUN_M6B_r2_00000__0b0d:
  0b0d  3410           PSHS  X                           
  0b0f  8E0ACF         LDX #0xacf                        
  0b12  AD9FFE70       JSR [0xfe70]                      
  0b16  3510           PULS  X                           
  0b18  39             RTS                               

; ---- function FUN_M6B_r2_00000__0b19
FUN_M6B_r2_00000__0b19:
  0b19  3410           PSHS  X                           
  0b1b  8E0ACF         LDX #0xacf                        
  0b1e  AD9FFE72       JSR [0xfe72]                      
  0b22  3510           PULS  X                           
  0b24  39             RTS                               
  0b25  .db 14 67 61 74 65 20 74 68 72 65 73 68 6F 6C 64 3A  ; .gate threshold:
  0b35  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M6B_r2_00000__0b3a
FUN_M6B_r2_00000__0b3a:
  0b3a  3440           PSHS  U                           
  0b3c  8E0ACF         LDX #0xacf                        
  0b3f  AD9FFE76       JSR [0xfe76]                      
  0b43  FC7078         LDD 0x7078                        
  0b46  3606           PSHU  B A                         
  0b48  CC67AD         LDD #0x67ad                       
  0b4b  3606           PSHU  B A                         
  0b4d  AD9FFCF2       JSR [0xfcf2]                      
  0b51  3706           PULU  A B                         
  0b53  F37040         ADDD 0x7040                       
  0b56  3606           PSHU  B A                         
  0b58  3606           PSHU  B A                         
  0b5a  AD9FFCEE       JSR [0xfcee]                      
  0b5e  3706           PULU  A B                         
  0b60  FD70C4         STD 0x70c4                        
  0b63  CC000A         LDD #0xa                          
  0b66  AD9FFD20       JSR [0xfd20]                      
  0b6a  108E024B       LDY #0x24b                        
  0b6e  FC70C4         LDD 0x70c4                        
  0b71  AD9FFD2E       JSR [0xfd2e]                      
  0b75  3540           PULS  U                           
  0b77  39             RTS                               
PTR_FUN_M6B_r2_00000__0be3_M6B_r2_00000__0b78:
  0b78  0BE3           addr M6B_r2_00000::0be3           
  0b7a  0BC2           addr M6B_r2_00000::0bc2           
  0b7c  .db 0B B6 70 42 70 64 00 00 70 7A 00 08 00 52 0D 00  ; ..pBpd..pz...R..
  0b8c  .db 00 00 64 00 01 00 03 20 0B CE 00 00 00 00 00 00  ; ..d.... ........
  0b9c  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__0b9e
FUN_M6B_r2_00000__0b9e:
  0b9e  3410           PSHS  X                           
  0ba0  8E0B78         LDX #0xb78                        
  0ba3  AD9FFE74       JSR [0xfe74]                      
  0ba7  3510           PULS  X                           
  0ba9  39             RTS                               

; ---- function FUN_M6B_r2_00000__0baa
FUN_M6B_r2_00000__0baa:
  0baa  3410           PSHS  X                           
  0bac  8E0B78         LDX #0xb78                         ; desc[API_FE22]: ->$0BE3 ->$0BC2
  0baf  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0bb3  3510           PULS  X                           
  0bb5  39             RTS                               

; ---- function FUN_M6B_r2_00000__0bb6
FUN_M6B_r2_00000__0bb6:
  0bb6  3410           PSHS  X                           
  0bb8  8E0B78         LDX #0xb78                        
  0bbb  AD9FFE70       JSR [0xfe70]                      
  0bbf  3510           PULS  X                           
  0bc1  39             RTS                               

; ---- function FUN_M6B_r2_00000__0bc2
FUN_M6B_r2_00000__0bc2:
  0bc2  3410           PSHS  X                           
  0bc4  8E0B78         LDX #0xb78                        
  0bc7  AD9FFE72       JSR [0xfe72]                      
  0bcb  3510           PULS  X                           
  0bcd  39             RTS                               
  0bce  .db 14 67 61 74 65 20 73 70 65 65 64 3A 20 20 20 20  ; .gate speed:    
  0bde  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6B_r2_00000__0be3
FUN_M6B_r2_00000__0be3:
  0be3  3440           PSHS  U                           
  0be5  8E0B78         LDX #0xb78                        
  0be8  AD9FFE76       JSR [0xfe76]                      
  0bec  CC7FFF         LDD #0x7fff                       
  0bef  B3707A         SUBD 0x707a                       
  0bf2  FD70C4         STD 0x70c4                        
  0bf5  CC000A         LDD #0xa                          
  0bf8  AD9FFD20       JSR [0xfd20]                      
  0bfc  108E024C       LDY #0x24c                        
  0c00  FC70C4         LDD 0x70c4                        
  0c03  AD9FFD2E       JSR [0xfd2e]                      
  0c07  3540           PULS  U                           
  0c09  39             RTS                               
  0c0a  0C750C540C48   addr[3]                           
  0c10  .db 70 52 70 68 00 00 70 7E 00 08 00 60 05 00 00 00  ; pRph..p~...`....
  0c20  .db 03 00 01 00 03 21 0C 60 00 00 17 AF 00 00 00 00  ; .....!.`........

; ---- function FUN_M6B_r2_00000__0c30
FUN_M6B_r2_00000__0c30:
  0c30  3410           PSHS  X                           
  0c32  8E0C0A         LDX #0xc0a                        
  0c35  AD9FFC4E       JSR [0xfc4e]                      
  0c39  3510           PULS  X                           
  0c3b  39             RTS                               

; ---- function FUN_M6B_r2_00000__0c3c
FUN_M6B_r2_00000__0c3c:
  0c3c  3410           PSHS  X                           
  0c3e  8E0C0A         LDX #0xc0a                        
  0c41  AD9FFC4C       JSR [0xfc4c]                      
  0c45  3510           PULS  X                           
  0c47  39             RTS                               

; ---- function FUN_M6B_r2_00000__0c48
FUN_M6B_r2_00000__0c48:
  0c48  3410           PSHS  X                           
  0c4a  8E0C0A         LDX #0xc0a                        
  0c4d  AD9FFC50       JSR [0xfc50]                      
  0c51  3510           PULS  X                           
  0c53  39             RTS                               

; ---- function FUN_M6B_r2_00000__0c54
FUN_M6B_r2_00000__0c54:
  0c54  3410           PSHS  X                           
  0c56  8E0C0A         LDX #0xc0a                        
  0c59  AD9FFC52       JSR [0xfc52]                      
  0c5d  3510           PULS  X                           
  0c5f  39             RTS                               
  0c60  .db 14 6F 6E 20 6C 6F 77 20 66 72 65 71 3A 20 20 20  ; .on low freq:   
  0c70  .db 20 20 48 7A 20                                   ;   Hz 

; ---- function FUN_M6B_r2_00000__0c75
FUN_M6B_r2_00000__0c75:
  0c75  3476           PSHS  U Y X B A                   
  0c77  8E0C0A         LDX #0xc0a                        
  0c7a  AD9FFE76       JSR [0xfe76]                      
  0c7e  17073E         LBSR 0x13bf                       
  0c81  3576           PULS  A B X Y U                   
  0c83  39             RTS                               
  0c84  0CEF0CCE0CC2   addr[3]                           
  0c8a  .db 70 54 70 6A 00 00 70 80 00 08 00 61 07 00 00 00  ; pTpj..p....a....
  0c9a  .db 03 00 01 00 02 20 0C DA 00 00 17 BB 00 00 00 00  ; ..... ..........

; ---- function FUN_M6B_r2_00000__0caa
FUN_M6B_r2_00000__0caa:
  0caa  3410           PSHS  X                           
  0cac  8E0C84         LDX #0xc84                        
  0caf  AD9FFC4E       JSR [0xfc4e]                      
  0cb3  3510           PULS  X                           
  0cb5  39             RTS                               

; ---- function FUN_M6B_r2_00000__0cb6
FUN_M6B_r2_00000__0cb6:
  0cb6  3410           PSHS  X                           
  0cb8  8E0C84         LDX #0xc84                        
  0cbb  AD9FFC4C       JSR [0xfc4c]                      
  0cbf  3510           PULS  X                           
  0cc1  39             RTS                               

; ---- function FUN_M6B_r2_00000__0cc2
FUN_M6B_r2_00000__0cc2:
  0cc2  3410           PSHS  X                           
  0cc4  8E0C84         LDX #0xc84                        
  0cc7  AD9FFC50       JSR [0xfc50]                      
  0ccb  3510           PULS  X                           
  0ccd  39             RTS                               

; ---- function FUN_M6B_r2_00000__0cce
FUN_M6B_r2_00000__0cce:
  0cce  3410           PSHS  X                           
  0cd0  8E0C84         LDX #0xc84                        
  0cd3  AD9FFC52       JSR [0xfc52]                      
  0cd7  3510           PULS  X                           
  0cd9  39             RTS                               
  0cda  .db 14 6F 6E 20 68 69 20 66 72 65 71 3A 20 20 20 20  ; .on hi freq:    
  0cea  .db 20 6B 48 7A 20                                   ;  kHz 

; ---- function FUN_M6B_r2_00000__0cef
FUN_M6B_r2_00000__0cef:
  0cef  3476           PSHS  U Y X B A                   
  0cf1  8E0C84         LDX #0xc84                        
  0cf4  AD9FFE76       JSR [0xfe76]                      
  0cf8  1706C4         LBSR 0x13bf                       
  0cfb  3576           PULS  A B X Y U                   
  0cfd  39             RTS                               
PTR_FUN_M6B_r2_00000__0d69_M6B_r2_00000__0cfe:
  0cfe  0D69           addr M6B_r2_00000::0d69           
  0d00  0D48           addr M6B_r2_00000::0d48           
  0d02  .db 0D 3C 70 56 70 6C 00 00 70 82 00 08 00 62 06 FF  ; .<pVpl..p....b..
  0d12  .db FA 00 00 00 01 00 02 20 0D 54 00 00 00 00 00 00  ; ....... .T......
  0d22  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__0d24
FUN_M6B_r2_00000__0d24:
  0d24  3410           PSHS  X                           
  0d26  8E0CFE         LDX #0xcfe                        
  0d29  AD9FFE74       JSR [0xfe74]                      
  0d2d  3510           PULS  X                           
  0d2f  39             RTS                               

; ---- function FUN_M6B_r2_00000__0d30
FUN_M6B_r2_00000__0d30:
  0d30  3410           PSHS  X                           
  0d32  8E0CFE         LDX #0xcfe                         ; desc[API_FE22]: ->$0D69 ->$0D48
  0d35  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0d39  3510           PULS  X                           
  0d3b  39             RTS                               

; ---- function FUN_M6B_r2_00000__0d3c
FUN_M6B_r2_00000__0d3c:
  0d3c  3410           PSHS  X                           
  0d3e  8E0CFE         LDX #0xcfe                        
  0d41  AD9FFE70       JSR [0xfe70]                      
  0d45  3510           PULS  X                           
  0d47  39             RTS                               

; ---- function FUN_M6B_r2_00000__0d48
FUN_M6B_r2_00000__0d48:
  0d48  3410           PSHS  X                           
  0d4a  8E0CFE         LDX #0xcfe                        
  0d4d  AD9FFE72       JSR [0xfe72]                      
  0d51  3510           PULS  X                           
  0d53  39             RTS                               
  0d54  .db 14 6F 6E 20 6C 66 20 61 74 74 65 6E 3A 20 20 20  ; .on lf atten:   
  0d64  .db 20 64 42 20 20                                   ;  dB  

; ---- function FUN_M6B_r2_00000__0d69
FUN_M6B_r2_00000__0d69:
  0d69  3476           PSHS  U Y X B A                   
  0d6b  8E0CFE         LDX #0xcfe                        
  0d6e  AD9FFE76       JSR [0xfe76]                      
  0d72  17064A         LBSR 0x13bf                       
  0d75  3576           PULS  A B X Y U                   
  0d77  39             RTS                               
PTR_FUN_M6B_r2_00000__0de3_M6B_r2_00000__0d78:
  0d78  0DE3           addr M6B_r2_00000::0de3           
  0d7a  0DC2           addr M6B_r2_00000::0dc2           
  0d7c  .db 0D B6 70 58 70 6E 00 00 70 84 00 08 00 63 08 FF  ; ..pXpn..p....c..
  0d8c  .db FA 00 00 00 01 00 02 20 0D CE 00 00 00 00 00 00  ; ....... ........
  0d9c  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__0d9e
FUN_M6B_r2_00000__0d9e:
  0d9e  3410           PSHS  X                           
  0da0  8E0D78         LDX #0xd78                        
  0da3  AD9FFE74       JSR [0xfe74]                      
  0da7  3510           PULS  X                           
  0da9  39             RTS                               

; ---- function FUN_M6B_r2_00000__0daa
FUN_M6B_r2_00000__0daa:
  0daa  3410           PSHS  X                           
  0dac  8E0D78         LDX #0xd78                         ; desc[API_FE22]: ->$0DE3 ->$0DC2
  0daf  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0db3  3510           PULS  X                           
  0db5  39             RTS                               

; ---- function FUN_M6B_r2_00000__0db6
FUN_M6B_r2_00000__0db6:
  0db6  3410           PSHS  X                           
  0db8  8E0D78         LDX #0xd78                        
  0dbb  AD9FFE70       JSR [0xfe70]                      
  0dbf  3510           PULS  X                           
  0dc1  39             RTS                               

; ---- function FUN_M6B_r2_00000__0dc2
FUN_M6B_r2_00000__0dc2:
  0dc2  3410           PSHS  X                           
  0dc4  8E0D78         LDX #0xd78                        
  0dc7  AD9FFE72       JSR [0xfe72]                      
  0dcb  3510           PULS  X                           
  0dcd  39             RTS                               
  0dce  .db 14 6F 6E 20 68 66 20 61 74 74 65 6E 3A 20 20 20  ; .on hf atten:   
  0dde  .db 20 64 42 20 20                                   ;  dB  

; ---- function FUN_M6B_r2_00000__0de3
FUN_M6B_r2_00000__0de3:
  0de3  3476           PSHS  U Y X B A                   
  0de5  8E0D78         LDX #0xd78                        
  0de8  AD9FFE76       JSR [0xfe76]                      
  0dec  1705D0         LBSR 0x13bf                       
  0def  3576           PULS  A B X Y U                   
  0df1  39             RTS                               
  0df2  0E5D0E3C0E30   addr[3]                           
  0df8  .db 70 5A 70 70 00 00 70 86 00 08 00 64 09 00 00 00  ; pZpp..p....d....
  0e08  .db 03 00 01 00 03 22 0E 48 00 00 17 AF 00 00 00 00  ; .....".H........

; ---- function FUN_M6B_r2_00000__0e18
FUN_M6B_r2_00000__0e18:
  0e18  3410           PSHS  X                           
  0e1a  8E0DF2         LDX #0xdf2                        
  0e1d  AD9FFC4E       JSR [0xfc4e]                      
  0e21  3510           PULS  X                           
  0e23  39             RTS                               

; ---- function FUN_M6B_r2_00000__0e24
FUN_M6B_r2_00000__0e24:
  0e24  3410           PSHS  X                           
  0e26  8E0DF2         LDX #0xdf2                        
  0e29  AD9FFC4C       JSR [0xfc4c]                      
  0e2d  3510           PULS  X                           
  0e2f  39             RTS                               

; ---- function FUN_M6B_r2_00000__0e30
FUN_M6B_r2_00000__0e30:
  0e30  3410           PSHS  X                           
  0e32  8E0DF2         LDX #0xdf2                        
  0e35  AD9FFC50       JSR [0xfc50]                      
  0e39  3510           PULS  X                           
  0e3b  39             RTS                               

; ---- function FUN_M6B_r2_00000__0e3c
FUN_M6B_r2_00000__0e3c:
  0e3c  3410           PSHS  X                           
  0e3e  8E0DF2         LDX #0xdf2                        
  0e41  AD9FFC52       JSR [0xfc52]                      
  0e45  3510           PULS  X                           
  0e47  39             RTS                               
  0e48  .db 14 6F 66 66 20 6C 6F 77 20 66 72 65 71 3A 20 20  ; .off low freq:  
  0e58  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M6B_r2_00000__0e5d
FUN_M6B_r2_00000__0e5d:
  0e5d  3476           PSHS  U Y X B A                   
  0e5f  8E0DF2         LDX #0xdf2                        
  0e62  AD9FFE76       JSR [0xfe76]                      
  0e66  1706AF         LBSR 0x1518                       
  0e69  3576           PULS  A B X Y U                   
  0e6b  39             RTS                               
  0e6c  0ED70EB60EAA   addr[3]                           
  0e72  .db 70 5C 70 72 00 00 70 88 00 08 00 65 0B 00 00 00  ; p\pr..p....e....
  0e82  .db 03 00 01 00 02 21 0E C2 00 00 17 BB 00 00 00 00  ; .....!..........

; ---- function FUN_M6B_r2_00000__0e92
FUN_M6B_r2_00000__0e92:
  0e92  3410           PSHS  X                           
  0e94  8E0E6C         LDX #0xe6c                        
  0e97  AD9FFC4E       JSR [0xfc4e]                      
  0e9b  3510           PULS  X                           
  0e9d  39             RTS                               

; ---- function FUN_M6B_r2_00000__0e9e
FUN_M6B_r2_00000__0e9e:
  0e9e  3410           PSHS  X                           
  0ea0  8E0E6C         LDX #0xe6c                        
  0ea3  AD9FFC4C       JSR [0xfc4c]                      
  0ea7  3510           PULS  X                           
  0ea9  39             RTS                               

; ---- function FUN_M6B_r2_00000__0eaa
FUN_M6B_r2_00000__0eaa:
  0eaa  3410           PSHS  X                           
  0eac  8E0E6C         LDX #0xe6c                        
  0eaf  AD9FFC50       JSR [0xfc50]                      
  0eb3  3510           PULS  X                           
  0eb5  39             RTS                               

; ---- function FUN_M6B_r2_00000__0eb6
FUN_M6B_r2_00000__0eb6:
  0eb6  3410           PSHS  X                           
  0eb8  8E0E6C         LDX #0xe6c                        
  0ebb  AD9FFC52       JSR [0xfc52]                      
  0ebf  3510           PULS  X                           
  0ec1  39             RTS                               
  0ec2  .db 14 6F 66 66 20 68 69 20 66 72 65 71 3A 20 20 20  ; .off hi freq:   
  0ed2  .db 20 20 6B 48 7A                                   ;   kHz

; ---- function FUN_M6B_r2_00000__0ed7
FUN_M6B_r2_00000__0ed7:
  0ed7  3476           PSHS  U Y X B A                   
  0ed9  8E0E6C         LDX #0xe6c                        
  0edc  AD9FFE76       JSR [0xfe76]                      
  0ee0  170635         LBSR 0x1518                       
  0ee3  3576           PULS  A B X Y U                   
  0ee5  39             RTS                               
PTR_FUN_M6B_r2_00000__0f51_M6B_r2_00000__0ee6:
  0ee6  0F51           addr M6B_r2_00000::0f51           
  0ee8  0F30           addr M6B_r2_00000::0f30           
  0eea  .db 0F 24 70 5E 70 74 00 00 70 8A 00 08 00 66 0A FF  ; .$p^pt..p....f..
  0efa  .db FA 00 00 00 01 00 02 21 0F 3C 00 00 00 00 00 00  ; .......!.<......
  0f0a  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__0f0c
FUN_M6B_r2_00000__0f0c:
  0f0c  3410           PSHS  X                           
  0f0e  8E0EE6         LDX #0xee6                        
  0f11  AD9FFE74       JSR [0xfe74]                      
  0f15  3510           PULS  X                           
  0f17  39             RTS                               

; ---- function FUN_M6B_r2_00000__0f18
FUN_M6B_r2_00000__0f18:
  0f18  3410           PSHS  X                           
  0f1a  8E0EE6         LDX #0xee6                         ; desc[API_FE22]: ->$0F51 ->$0F30
  0f1d  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0f21  3510           PULS  X                           
  0f23  39             RTS                               

; ---- function FUN_M6B_r2_00000__0f24
FUN_M6B_r2_00000__0f24:
  0f24  3410           PSHS  X                           
  0f26  8E0EE6         LDX #0xee6                        
  0f29  AD9FFE70       JSR [0xfe70]                      
  0f2d  3510           PULS  X                           
  0f2f  39             RTS                               

; ---- function FUN_M6B_r2_00000__0f30
FUN_M6B_r2_00000__0f30:
  0f30  3410           PSHS  X                           
  0f32  8E0EE6         LDX #0xee6                        
  0f35  AD9FFE72       JSR [0xfe72]                      
  0f39  3510           PULS  X                           
  0f3b  39             RTS                               
  0f3c  .db 14 6F 66 66 20 6C 66 20 61 74 74 65 6E 3A 20 20  ; .off lf atten:  
  0f4c  .db 20 20 64 42 20                                   ;   dB 

; ---- function FUN_M6B_r2_00000__0f51
FUN_M6B_r2_00000__0f51:
  0f51  3476           PSHS  U Y X B A                   
  0f53  8E0EE6         LDX #0xee6                        
  0f56  AD9FFE76       JSR [0xfe76]                      
  0f5a  1705BB         LBSR 0x1518                       
  0f5d  3576           PULS  A B X Y U                   
  0f5f  39             RTS                               
PTR_FUN_M6B_r2_00000__0fcb_M6B_r2_00000__0f60:
  0f60  0FCB           addr M6B_r2_00000::0fcb           
  0f62  0FAA           addr M6B_r2_00000::0faa           
  0f64  .db 0F 9E 70 60 70 76 00 00 70 8C 00 08 00 67 0C FF  ; ..p`pv..p....g..
  0f74  .db FA 00 00 00 01 00 02 21 0F B6 00 00 00 00 00 00  ; .......!........
  0f84  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__0f86
FUN_M6B_r2_00000__0f86:
  0f86  3410           PSHS  X                           
  0f88  8E0F60         LDX #0xf60                        
  0f8b  AD9FFE74       JSR [0xfe74]                      
  0f8f  3510           PULS  X                           
  0f91  39             RTS                               

; ---- function FUN_M6B_r2_00000__0f92
FUN_M6B_r2_00000__0f92:
  0f92  3410           PSHS  X                           
  0f94  8E0F60         LDX #0xf60                         ; desc[API_FE22]: ->$0FCB ->$0FAA
  0f97  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0f9b  3510           PULS  X                           
  0f9d  39             RTS                               

; ---- function FUN_M6B_r2_00000__0f9e
FUN_M6B_r2_00000__0f9e:
  0f9e  3410           PSHS  X                           
  0fa0  8E0F60         LDX #0xf60                        
  0fa3  AD9FFE70       JSR [0xfe70]                      
  0fa7  3510           PULS  X                           
  0fa9  39             RTS                               

; ---- function FUN_M6B_r2_00000__0faa
FUN_M6B_r2_00000__0faa:
  0faa  3410           PSHS  X                           
  0fac  8E0F60         LDX #0xf60                        
  0faf  AD9FFE72       JSR [0xfe72]                      
  0fb3  3510           PULS  X                           
  0fb5  39             RTS                               
  0fb6  .db 14 6F 66 66 20 68 66 20 61 74 74 65 6E 3A 20 20  ; .off hf atten:  
  0fc6  .db 20 20 64 42 20                                   ;   dB 

; ---- function FUN_M6B_r2_00000__0fcb
FUN_M6B_r2_00000__0fcb:
  0fcb  3476           PSHS  U Y X B A                   
  0fcd  8E0F60         LDX #0xf60                        
  0fd0  AD9FFE76       JSR [0xfe76]                      
  0fd4  170541         LBSR 0x1518                       
  0fd7  3576           PULS  A B X Y U                   
  0fd9  39             RTS                               

; ---- function FUN_M6B_r2_00000__0fda
FUN_M6B_r2_00000__0fda:
  0fda  3436           PSHS  Y X B A                     
  0fdc  CC0000         LDD #0x0                          
  0fdf  2021           BRA 0x1002                        

; ---- function FUN_M6B_r2_00000__0fe1
FUN_M6B_r2_00000__0fe1:
  0fe1  3436           PSHS  Y X B A                     
  0fe3  CC0001         LDD #0x1                          
  0fe6  201A           BRA 0x1002                        

; ---- function FUN_M6B_r2_00000__0fe8
FUN_M6B_r2_00000__0fe8:
  0fe8  3436           PSHS  Y X B A                     
  0fea  CC0002         LDD #0x2                          
  0fed  2013           BRA 0x1002                        

; ---- function FUN_M6B_r2_00000__0fef
FUN_M6B_r2_00000__0fef:
  0fef  3436           PSHS  Y X B A                     
  0ff1  CC0003         LDD #0x3                          
  0ff4  200C           BRA 0x1002                        

; ---- function FUN_M6B_r2_00000__0ff6
FUN_M6B_r2_00000__0ff6:
  0ff6  3436           PSHS  Y X B A                     
  0ff8  CC0004         LDD #0x4                          
  0ffb  2005           BRA 0x1002                        

; ---- function FUN_M6B_r2_00000__0ffd
FUN_M6B_r2_00000__0ffd:
  0ffd  3436           PSHS  Y X B A                     
  0fff  CC0005         LDD #0x5                          
LAB_M6B_r2_00000__1002:
  1002  1706E5         LBSR 0x16ea                       
  1005  FC60F9         LDD 0x60f9                        
  1008  ED9F70BA       STD [0x70ba]                      
  100c  FD6074         STD 0x6074                        
  100f  10BE70BC       LDY 0x70bc                        
  1013  AD9FFC80       JSR [0xfc80]                      
  1017  FC70C2         LDD 0x70c2                        
  101a  860A           LDA #0xa                          
  101c  3D             MUL                               
  101d  C31030         ADDD #0x1030                      
  1020  F3600D         ADDD 0x600d                       
  1023  1F01           TFR D,X                           
  1025  AD84           JSR ,X                            
  1027  1700C4         LBSR 0x10ee                       
  102a  1700D6         LBSR 0x1103                       
  102d  3536           PULS  A B X Y                     
  102f  39             RTS                               

; ---- function FUN_M6B_r2_00000__1030
FUN_M6B_r2_00000__1030:
  1030  3416           PSHS  X B A                       
  1032  CC0000         LDD #0x0                          
  1035  8E044B         LDX #0x44b                        
  1038  2030           BRA 0x106a                        

; ---- function FUN_M6B_r2_00000__103a
FUN_M6B_r2_00000__103a:
  103a  3416           PSHS  X B A                       
  103c  CC0001         LDD #0x1                          
  103f  8E044F         LDX #0x44f                        
  1042  2026           BRA 0x106a                        

; ---- function FUN_M6B_r2_00000__1044
FUN_M6B_r2_00000__1044:
  1044  3416           PSHS  X B A                       
  1046  CC0002         LDD #0x2                          
  1049  8E0450         LDX #0x450                        
  104c  201C           BRA 0x106a                        

; ---- function FUN_M6B_r2_00000__104e
FUN_M6B_r2_00000__104e:
  104e  3416           PSHS  X B A                       
  1050  CC0003         LDD #0x3                          
  1053  8E044C         LDX #0x44c                        
  1056  2012           BRA 0x106a                        

; ---- function FUN_M6B_r2_00000__1058
FUN_M6B_r2_00000__1058:
  1058  3416           PSHS  X B A                       
  105a  CC0004         LDD #0x4                          
  105d  8E044D         LDX #0x44d                        
  1060  2008           BRA 0x106a                        

; ---- function FUN_M6B_r2_00000__1062
FUN_M6B_r2_00000__1062:
  1062  3416           PSHS  X B A                       
  1064  CC0005         LDD #0x5                          
  1067  8E044E         LDX #0x44e                        
LAB_M6B_r2_00000__106a:
  106a  17067D         LBSR 0x16ea                       
  106d  EC9F70BA       LDD [0x70ba]                      
  1071  FD6074         STD 0x6074                        
  1074  17F3CD         LBSR 0x0444                       
  1077  C613           LDB #0x13                         
  1079  AD9FFC36       JSR [0xfc36]                      
  107d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay  :     samples"
  1081  0A64656C6179.. char[22] "\ndelay  :     samples" 
LAB_M6B_r2_00000__1097:
  1097  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $1388 $0000 $0000 ->$10EE ->$10C8 $0001 $0001 $0000
  109b  01             db 1h                             
  109c  01             db 1h                             
  109d  02             db 2h                             
  109e  01             db 1h                             
  109f  01             db 1h                             
  10a0  00             db 0h                             
  10a1  04             db 4h                             
  10a2  80             db 80h                            
  10a3  1388           dw 1388h                          
  10a5  0000           dw 0h                             
  10a7  0000           dw 0h                             
  10a9  10EE           addr M6B_r2_00000::10ee           
  10ab  10C8           addr M6B_r2_00000::10c8           
  10ad  0001           dw 1h                             
  10af  0001           dw 1h                             
  10b1  0000           dw 0h                             
LAB_M6B_r2_00000__10b3:
  10b3  170038         LBSR 0x10ee                       
  10b6  C61A           LDB #0x1a                         
  10b8  AD9FFC36       JSR [0xfc36]                      
  10bc  FC70C2         LDD 0x70c2                        
  10bf  CB31           ADDB #0x31                        
  10c1  AD9FFC2A       JSR [0xfc2a]                      
  10c5  3516           PULS  A B X                       
  10c7  39             RTS                               

; ---- function FUN_M6B_r2_00000__10c8
FUN_M6B_r2_00000__10c8:
  10c8  3426           PSHS  Y B A                       
  10ca  FC6074         LDD 0x6074                        
  10cd  ED9F70BA       STD [0x70ba]                      
  10d1  10BE70BC       LDY 0x70bc                        
  10d5  AD9FFC82       JSR [0xfc82]                      
  10d9  FC70C2         LDD 0x70c2                        
  10dc  C30010         ADDD #0x10                        
  10df  1F02           TFR D,Y                           
  10e1  EC9F70BA       LDD [0x70ba]                      
  10e5  AD9FFE40       JSR [0xfe40]                      
  10e9  8D18           BSR 0x1103                        
  10eb  3526           PULS  A B Y                       
  10ed  39             RTS                               

; ---- function FUN_M6B_r2_00000__10ee
FUN_M6B_r2_00000__10ee:
  10ee  3456           PSHS  U X B A                     
  10f0  C61C           LDB #0x1c                         
  10f2  AD9FFC36       JSR [0xfc36]                      
  10f6  CC0004         LDD #0x4                          
  10f9  8E609F         LDX #0x609f                       
  10fc  AD9FFC3A       JSR [0xfc3a]                      
  1100  3556           PULS  A B X U                     
  1102  39             RTS                               

; ---- function FUN_M6B_r2_00000__1103
FUN_M6B_r2_00000__1103:
  1103  3440           PSHS  U                           
  1105  EC9F70BA       LDD [0x70ba]                      
  1109  FD70C4         STD 0x70c4                        
  110c  CC000A         LDD #0xa                          
  110f  AD9FFD20       JSR [0xfd20]                      
  1113  10BE70C0       LDY 0x70c0                        
  1117  FC70C4         LDD 0x70c4                        
  111a  AD9FFD2E       JSR [0xfd2e]                      
  111e  3540           PULS  U                           
  1120  39             RTS                               
PTR_FUN_M6B_r2_00000__11a4_M6B_r2_00000__1121:
  1121  11A4           addr M6B_r2_00000::11a4           
  1123  116B           addr M6B_r2_00000::116b           
  1125  .db 11 5F 70 00 70 02 00 00 70 04 00 08 00 3D 00 00  ; ._p.p...p....=..
  1135  .db 00 00 64 00 01 00 03 19 11 8F 00 00 00 00 70 06  ; ..d...........p.
  1145  .db 00 47                                            ; .G

; ---- function FUN_M6B_r2_00000__1147
FUN_M6B_r2_00000__1147:
  1147  3410           PSHS  X                           
  1149  8E1121         LDX #0x1121                        ; desc[API_FE6A]: ->$11A4 ->$116B
  114c  AD9FFE6A       JSR [0xfe6a]                      
  1150  3510           PULS  X                           
  1152  39             RTS                               

; ---- function FUN_M6B_r2_00000__1153
FUN_M6B_r2_00000__1153:
  1153  3410           PSHS  X                           
  1155  8E1121         LDX #0x1121                        ; desc[API_FDBC]: ->$11A4 ->$116B
  1158  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...!"
  115c  3510           PULS  X                           
  115e  39             RTS                               

; ---- function FUN_M6B_r2_00000__115f
FUN_M6B_r2_00000__115f:
  115f  3410           PSHS  X                           
  1161  8E1121         LDX #0x1121                        ; desc[API_FE6C]: ->$11A4 ->$116B
  1164  AD9FFE6C       JSR [0xfe6c]                      
  1168  3510           PULS  X                           
  116a  39             RTS                               

; ---- function FUN_M6B_r2_00000__116b
FUN_M6B_r2_00000__116b:
  116b  3410           PSHS  X                           
  116d  8E1121         LDX #0x1121                        ; desc[API_FE6E]: ->$11A4 ->$116B
  1170  AD9FFE6E       JSR [0xfe6e]                      
  1174  3510           PULS  X                           
  1176  39             RTS                               

; ---- function FUN_M6B_r2_00000__1177
FUN_M6B_r2_00000__1177:
  1177  3410           PSHS  X                           
  1179  8E1121         LDX #0x1121                        ; desc[API_FE1C]: ->$11A4 ->$116B
  117c  AD9FFE1C       JSR [0xfe1c]                      
  1180  3510           PULS  X                           
  1182  39             RTS                               

; ---- function FUN_M6B_r2_00000__1183
FUN_M6B_r2_00000__1183:
  1183  3410           PSHS  X                           
  1185  8E1121         LDX #0x1121                        ; desc[API_FE1A]: ->$11A4 ->$116B $115F
  1188  AD9FFE1A       JSR [0xfe1a]                      
  118c  3510           PULS  X                           
  118e  39             RTS                               
  118f  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  119f  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6B_r2_00000__11a4
FUN_M6B_r2_00000__11a4:
  11a4  3476           PSHS  U Y X B A                   
  11a6  8E1121         LDX #0x1121                       
  11a9  AD9FFE76       JSR [0xfe76]                      
  11ad  CC0064         LDD #0x64                         
  11b0  B37004         SUBD 0x7004                       
  11b3  3606           PSHU  B A                         
  11b5  58             LSLB                              
  11b6  49             ROLA                              
  11b7  FD70C4         STD 0x70c4                        
  11ba  CC4666         LDD #0x4666                       
  11bd  3606           PSHU  B A                         
  11bf  AD9FFCF2       JSR [0xfcf2]                      
  11c3  3706           PULU  A B                         
  11c5  F370C4         ADDD 0x70c4                       
  11c8  AD9FFC6A       JSR [0xfc6a]                      
  11cc  AD9FFC72       JSR [0xfc72]                      
  11d0  3576           PULS  A B X Y U                   
  11d2  39             RTS                               
PTR_FUN_M6B_r2_00000__123e_M6B_r2_00000__11d3:
  11d3  123E           addr M6B_r2_00000::123e           
  11d5  121D           addr M6B_r2_00000::121d           
  11d7  .db 12 11 70 08 70 0A 00 00 70 0C 00 08 00 21 16 FF  ; ..p.p...p....!..
  11e7  .db D0 00 30 00 01 00 03 1C 12 29 00 00 00 00 00 00  ; ..0......)......
  11f7  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__11f9
FUN_M6B_r2_00000__11f9:
  11f9  3410           PSHS  X                           
  11fb  8E11D3         LDX #0x11d3                       
  11fe  AD9FFE74       JSR [0xfe74]                      
  1202  3510           PULS  X                           
  1204  39             RTS                               

; ---- function FUN_M6B_r2_00000__1205
FUN_M6B_r2_00000__1205:
  1205  3410           PSHS  X                           
  1207  8E11D3         LDX #0x11d3                        ; desc[API_FE22]: ->$123E ->$121D
  120a  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  120e  3510           PULS  X                           
  1210  39             RTS                               

; ---- function FUN_M6B_r2_00000__1211
FUN_M6B_r2_00000__1211:
  1211  3410           PSHS  X                           
  1213  8E11D3         LDX #0x11d3                       
  1216  AD9FFE70       JSR [0xfe70]                      
  121a  3510           PULS  X                           
  121c  39             RTS                               

; ---- function FUN_M6B_r2_00000__121d
FUN_M6B_r2_00000__121d:
  121d  3410           PSHS  X                           
  121f  8E11D3         LDX #0x11d3                       
  1222  AD9FFE72       JSR [0xfe72]                      
  1226  3510           PULS  X                           
  1228  39             RTS                               
  1229  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  1239  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6B_r2_00000__123e
FUN_M6B_r2_00000__123e:
  123e  3476           PSHS  U Y X B A                   
  1240  8E11D3         LDX #0x11d3                       
  1243  AD9FFE76       JSR [0xfe76]                      
  1247  AD9FFE52       JSR [0xfe52]                      
  124b  3576           PULS  A B X Y U                   
  124d  39             RTS                               
PTR_FUN_M6B_r2_00000__12b9_M6B_r2_00000__124e:
  124e  12B9           addr M6B_r2_00000::12b9           
  1250  1298           addr M6B_r2_00000::1298           
  1252  .db 12 8C 70 0E 70 10 00 00 70 12 00 08 00 22 17 FF  ; ..p.p...p...."..
  1262  .db D0 00 30 00 01 00 03 1D 12 A4 00 00 00 00 00 00  ; ..0.............
  1272  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__1274
FUN_M6B_r2_00000__1274:
  1274  3410           PSHS  X                           
  1276  8E124E         LDX #0x124e                       
  1279  AD9FFE74       JSR [0xfe74]                      
  127d  3510           PULS  X                           
  127f  39             RTS                               

; ---- function FUN_M6B_r2_00000__1280
FUN_M6B_r2_00000__1280:
  1280  3410           PSHS  X                           
  1282  8E124E         LDX #0x124e                        ; desc[API_FE22]: ->$12B9 ->$1298
  1285  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1289  3510           PULS  X                           
  128b  39             RTS                               

; ---- function FUN_M6B_r2_00000__128c
FUN_M6B_r2_00000__128c:
  128c  3410           PSHS  X                           
  128e  8E124E         LDX #0x124e                       
  1291  AD9FFE70       JSR [0xfe70]                      
  1295  3510           PULS  X                           
  1297  39             RTS                               

; ---- function FUN_M6B_r2_00000__1298
FUN_M6B_r2_00000__1298:
  1298  3410           PSHS  X                           
  129a  8E124E         LDX #0x124e                       
  129d  AD9FFE72       JSR [0xfe72]                      
  12a1  3510           PULS  X                           
  12a3  39             RTS                               
  12a4  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  12b4  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6B_r2_00000__12b9
FUN_M6B_r2_00000__12b9:
  12b9  3476           PSHS  U Y X B A                   
  12bb  8E124E         LDX #0x124e                       
  12be  AD9FFE76       JSR [0xfe76]                      
  12c2  AD9FFE54       JSR [0xfe54]                      
  12c6  3576           PULS  A B X Y U                   
  12c8  39             RTS                               
PTR_FUN_M6B_r2_00000__1334_M6B_r2_00000__12c9:
  12c9  1334           addr M6B_r2_00000::1334           
  12cb  1313           addr M6B_r2_00000::1313           
  12cd  .db 13 07 70 14 70 16 00 00 70 18 00 08 00 23 18 FF  ; ..p.p...p....#..
  12dd  .db D0 00 30 00 01 00 03 1D 13 1F 00 00 00 00 00 00  ; ..0.............
  12ed  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__12ef
FUN_M6B_r2_00000__12ef:
  12ef  3410           PSHS  X                           
  12f1  8E12C9         LDX #0x12c9                       
  12f4  AD9FFE74       JSR [0xfe74]                      
  12f8  3510           PULS  X                           
  12fa  39             RTS                               

; ---- function FUN_M6B_r2_00000__12fb
FUN_M6B_r2_00000__12fb:
  12fb  3410           PSHS  X                           
  12fd  8E12C9         LDX #0x12c9                        ; desc[API_FE22]: ->$1334 ->$1313
  1300  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1304  3510           PULS  X                           
  1306  39             RTS                               

; ---- function FUN_M6B_r2_00000__1307
FUN_M6B_r2_00000__1307:
  1307  3410           PSHS  X                           
  1309  8E12C9         LDX #0x12c9                       
  130c  AD9FFE70       JSR [0xfe70]                      
  1310  3510           PULS  X                           
  1312  39             RTS                               

; ---- function FUN_M6B_r2_00000__1313
FUN_M6B_r2_00000__1313:
  1313  3410           PSHS  X                           
  1315  8E12C9         LDX #0x12c9                       
  1318  AD9FFE72       JSR [0xfe72]                      
  131c  3510           PULS  X                           
  131e  39             RTS                               
  131f  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  132f  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6B_r2_00000__1334
FUN_M6B_r2_00000__1334:
  1334  3476           PSHS  U Y X B A                   
  1336  8E12C9         LDX #0x12c9                       
  1339  AD9FFE76       JSR [0xfe76]                      
  133d  AD9FFE56       JSR [0xfe56]                      
  1341  3576           PULS  A B X Y U                   
  1343  39             RTS                               
PTR_FUN_M6B_r2_00000__13af_M6B_r2_00000__1344:
  1344  13AF           addr M6B_r2_00000::13af           
  1346  138E           addr M6B_r2_00000::138e           
  1348  .db 13 82 70 1A 70 1C 00 00 70 1E 00 08 00 24 19 FF  ; ..p.p...p....$..
  1358  .db D0 00 30 00 01 00 03 1E 13 9A 00 00 00 00 00 00  ; ..0.............
  1368  .db 00 00                                            ; ..

; ---- function FUN_M6B_r2_00000__136a
FUN_M6B_r2_00000__136a:
  136a  3410           PSHS  X                           
  136c  8E1344         LDX #0x1344                       
  136f  AD9FFE74       JSR [0xfe74]                      
  1373  3510           PULS  X                           
  1375  39             RTS                               

; ---- function FUN_M6B_r2_00000__1376
FUN_M6B_r2_00000__1376:
  1376  3410           PSHS  X                           
  1378  8E1344         LDX #0x1344                        ; desc[API_FE22]: ->$13AF ->$138E
  137b  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  137f  3510           PULS  X                           
  1381  39             RTS                               

; ---- function FUN_M6B_r2_00000__1382
FUN_M6B_r2_00000__1382:
  1382  3410           PSHS  X                           
  1384  8E1344         LDX #0x1344                       
  1387  AD9FFE70       JSR [0xfe70]                      
  138b  3510           PULS  X                           
  138d  39             RTS                               

; ---- function FUN_M6B_r2_00000__138e
FUN_M6B_r2_00000__138e:
  138e  3410           PSHS  X                           
  1390  8E1344         LDX #0x1344                       
  1393  AD9FFE72       JSR [0xfe72]                      
  1397  3510           PULS  X                           
  1399  39             RTS                               
  139a  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  13aa  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M6B_r2_00000__13af
FUN_M6B_r2_00000__13af:
  13af  3476           PSHS  U Y X B A                   
  13b1  8E1344         LDX #0x1344                       
  13b4  AD9FFE76       JSR [0xfe76]                      
  13b8  AD9FFE58       JSR [0xfe58]                      
  13bc  3576           PULS  A B X Y U                   
  13be  39             RTS                               

; ---- function FUN_M6B_r2_00000__13bf
FUN_M6B_r2_00000__13bf:
  13bf  3456           PSHS  U X B A                     
  13c1  1702AD         LBSR 0x1671                        ; inline[at:M6B_r2_00000::1671]: $707E $7082 $7080 $7084 $70A2 $708E $7090 $7092 $7094 $7096
  13c4  707E           addr 707e                         
  13c6  7082           addr 7082                         
  13c8  7080           addr 7080                         
  13ca  7084           addr 7084                         
  13cc  70A2           addr 70a2                         
  13ce  708E           addr 708e                         
  13d0  7090           addr 7090                         
  13d2  7092           addr 7092                         
  13d4  7094           addr 7094                         
  13d6  7096           addr 7096                         
LAB_M6B_r2_00000__13d8:
  13d8  FC70DA         LDD 0x70da                        
  13db  1083FFFF       CMPD #0xffff                      
  13df  1027006C       LBEQ 0x144f                       
  13e3  CC000A         LDD #0xa                          
  13e6  AD9FFD20       JSR [0xfd20]                      
  13ea  108E0745       LDY #0x745                        
  13ee  FC708E         LDD 0x708e                        
  13f1  AD9FFD2E       JSR [0xfd2e]                      
  13f5  CC000A         LDD #0xa                          
  13f8  AD9FFD20       JSR [0xfd20]                      
  13fc  108E0746       LDY #0x746                        
  1400  FC7090         LDD 0x7090                        
  1403  AD9FFD2E       JSR [0xfd2e]                      
  1407  CC000A         LDD #0xa                          
  140a  AD9FFD20       JSR [0xfd20]                      
  140e  108E0747       LDY #0x747                        
  1412  FC7092         LDD 0x7092                        
  1415  AD9FFD2E       JSR [0xfd2e]                      
  1419  CC000A         LDD #0xa                          
  141c  AD9FFD20       JSR [0xfd20]                      
  1420  108E0748       LDY #0x748                        
  1424  FC7094         LDD 0x7094                        
  1427  AD9FFD2E       JSR [0xfd2e]                      
  142b  CC000A         LDD #0xa                          
  142e  AD9FFD20       JSR [0xfd20]                      
  1432  108E0749       LDY #0x749                        
  1436  FC7096         LDD 0x7096                        
  1439  AD9FFD2E       JSR [0xfd2e]                      
  143d  CC000A         LDD #0xa                          
  1440  AD9FFD20       JSR [0xfd20]                      
  1444  108E074A       LDY #0x74a                        
  1448  CCFFFF         LDD #0xffff                       
  144b  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6B_r2_00000__144f:
  144f  CC000A         LDD #0xa                          
  1452  AD9FFD20       JSR [0xfd20]                      
  1456  108E0740       LDY #0x740                        
  145a  FC708E         LDD 0x708e                        
  145d  AD9FFD2E       JSR [0xfd2e]                      
  1461  CC000A         LDD #0xa                          
  1464  AD9FFD20       JSR [0xfd20]                      
  1468  108E0741       LDY #0x741                        
  146c  FC7090         LDD 0x7090                        
  146f  AD9FFD2E       JSR [0xfd2e]                      
  1473  CC000A         LDD #0xa                          
  1476  AD9FFD20       JSR [0xfd20]                      
  147a  108E0742       LDY #0x742                        
  147e  FC7092         LDD 0x7092                        
  1481  AD9FFD2E       JSR [0xfd2e]                      
  1485  CC000A         LDD #0xa                          
  1488  AD9FFD20       JSR [0xfd20]                      
  148c  108E0743       LDY #0x743                        
  1490  FC7094         LDD 0x7094                        
  1493  AD9FFD2E       JSR [0xfd2e]                      
  1497  CC000A         LDD #0xa                          
  149a  AD9FFD20       JSR [0xfd20]                      
  149e  108E0744       LDY #0x744                        
  14a2  FC7096         LDD 0x7096                        
  14a5  AD9FFD2E       JSR [0xfd2e]                      
  14a9  CC000A         LDD #0xa                          
  14ac  AD9FFD20       JSR [0xfd20]                      
  14b0  108E0745       LDY #0x745                        
  14b4  FC7098         LDD 0x7098                        
  14b7  AD9FFD2E       JSR [0xfd2e]                      
  14bb  CC000A         LDD #0xa                          
  14be  AD9FFD20       JSR [0xfd20]                      
  14c2  108E0746       LDY #0x746                        
  14c6  FC709A         LDD 0x709a                        
  14c9  AD9FFD2E       JSR [0xfd2e]                      
  14cd  CC000A         LDD #0xa                          
  14d0  AD9FFD20       JSR [0xfd20]                      
  14d4  108E0747       LDY #0x747                        
  14d8  FC709C         LDD 0x709c                        
  14db  AD9FFD2E       JSR [0xfd2e]                      
  14df  CC000A         LDD #0xa                          
  14e2  AD9FFD20       JSR [0xfd20]                      
  14e6  108E0748       LDY #0x748                        
  14ea  FC709E         LDD 0x709e                        
  14ed  AD9FFD2E       JSR [0xfd2e]                      
  14f1  CC000A         LDD #0xa                          
  14f4  AD9FFD20       JSR [0xfd20]                      
  14f8  108E0749       LDY #0x749                        
  14fc  FC70A0         LDD 0x70a0                        
  14ff  AD9FFD2E       JSR [0xfd2e]                      
  1503  CC000A         LDD #0xa                          
  1506  AD9FFD20       JSR [0xfd20]                      
  150a  108E074A       LDY #0x74a                        
  150e  FC70DA         LDD 0x70da                        
  1511  AD9FFD2E       JSR [0xfd2e]                      
  1515  3556           PULS  A B X U                     
  1517  39             RTS                               

; ---- function FUN_M6B_r2_00000__1518
FUN_M6B_r2_00000__1518:
  1518  3456           PSHS  U X B A                     
  151a  170154         LBSR 0x1671                        ; inline[at:M6B_r2_00000::1671]: $7086 $708A $7088 $708C $70A4 $7098 $709A $709C $709E $70A0
  151d  7086           addr 7086                         
  151f  708A           addr 708a                         
  1521  7088           addr 7088                         
  1523  708C           addr 708c                         
  1525  70A4           addr 70a4                         
  1527  7098           addr 7098                         
  1529  709A           addr 709a                         
  152b  709C           addr 709c                         
  152d  709E           addr 709e                         
  152f  70A0           addr 70a0                         
LAB_M6B_r2_00000__1531:
  1531  FC70DA         LDD 0x70da                        
  1534  10830000       CMPD #0x0                         
  1538  1027006C       LBEQ 0x15a8                       
  153c  CC000A         LDD #0xa                          
  153f  AD9FFD20       JSR [0xfd20]                      
  1543  108E0740       LDY #0x740                        
  1547  FC7098         LDD 0x7098                        
  154a  AD9FFD2E       JSR [0xfd2e]                      
  154e  CC000A         LDD #0xa                          
  1551  AD9FFD20       JSR [0xfd20]                      
  1555  108E0741       LDY #0x741                        
  1559  FC709A         LDD 0x709a                        
  155c  AD9FFD2E       JSR [0xfd2e]                      
  1560  CC000A         LDD #0xa                          
  1563  AD9FFD20       JSR [0xfd20]                      
  1567  108E0742       LDY #0x742                        
  156b  FC709C         LDD 0x709c                        
  156e  AD9FFD2E       JSR [0xfd2e]                      
  1572  CC000A         LDD #0xa                          
  1575  AD9FFD20       JSR [0xfd20]                      
  1579  108E0743       LDY #0x743                        
  157d  FC709E         LDD 0x709e                        
  1580  AD9FFD2E       JSR [0xfd2e]                      
  1584  CC000A         LDD #0xa                          
  1587  AD9FFD20       JSR [0xfd20]                      
  158b  108E0744       LDY #0x744                        
  158f  FC70A0         LDD 0x70a0                        
  1592  AD9FFD2E       JSR [0xfd2e]                      
  1596  CC000A         LDD #0xa                          
  1599  AD9FFD20       JSR [0xfd20]                      
  159d  108E074A       LDY #0x74a                        
  15a1  CC0000         LDD #0x0                          
  15a4  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6B_r2_00000__15a8:
  15a8  CC000A         LDD #0xa                          
  15ab  AD9FFD20       JSR [0xfd20]                      
  15af  108E0745       LDY #0x745                        
  15b3  FC7098         LDD 0x7098                        
  15b6  AD9FFD2E       JSR [0xfd2e]                      
  15ba  CC000A         LDD #0xa                          
  15bd  AD9FFD20       JSR [0xfd20]                      
  15c1  108E0746       LDY #0x746                        
  15c5  FC709A         LDD 0x709a                        
  15c8  AD9FFD2E       JSR [0xfd2e]                      
  15cc  CC000A         LDD #0xa                          
  15cf  AD9FFD20       JSR [0xfd20]                      
  15d3  108E0747       LDY #0x747                        
  15d7  FC709C         LDD 0x709c                        
  15da  AD9FFD2E       JSR [0xfd2e]                      
  15de  CC000A         LDD #0xa                          
  15e1  AD9FFD20       JSR [0xfd20]                      
  15e5  108E0748       LDY #0x748                        
  15e9  FC709E         LDD 0x709e                        
  15ec  AD9FFD2E       JSR [0xfd2e]                      
  15f0  CC000A         LDD #0xa                          
  15f3  AD9FFD20       JSR [0xfd20]                      
  15f7  108E0749       LDY #0x749                        
  15fb  FC70A0         LDD 0x70a0                        
  15fe  AD9FFD2E       JSR [0xfd2e]                      
  1602  CC000A         LDD #0xa                          
  1605  AD9FFD20       JSR [0xfd20]                      
  1609  108E0740       LDY #0x740                        
  160d  FC708E         LDD 0x708e                        
  1610  AD9FFD2E       JSR [0xfd2e]                      
  1614  CC000A         LDD #0xa                          
  1617  AD9FFD20       JSR [0xfd20]                      
  161b  108E0741       LDY #0x741                        
  161f  FC7090         LDD 0x7090                        
  1622  AD9FFD2E       JSR [0xfd2e]                      
  1626  CC000A         LDD #0xa                          
  1629  AD9FFD20       JSR [0xfd20]                      
  162d  108E0742       LDY #0x742                        
  1631  FC7092         LDD 0x7092                        
  1634  AD9FFD2E       JSR [0xfd2e]                      
  1638  CC000A         LDD #0xa                          
  163b  AD9FFD20       JSR [0xfd20]                      
  163f  108E0743       LDY #0x743                        
  1643  FC7094         LDD 0x7094                        
  1646  AD9FFD2E       JSR [0xfd2e]                      
  164a  CC000A         LDD #0xa                          
  164d  AD9FFD20       JSR [0xfd20]                      
  1651  108E0744       LDY #0x744                        
  1655  FC7096         LDD 0x7096                        
  1658  AD9FFD2E       JSR [0xfd2e]                      
  165c  CC000A         LDD #0xa                          
  165f  AD9FFD20       JSR [0xfd20]                      
  1663  108E074A       LDY #0x74a                        
  1667  FC70DA         LDD 0x70da                        
  166a  AD9FFD2E       JSR [0xfd2e]                      
  166e  3556           PULS  A B X U                     
  1670  39             RTS                               

; ---- function FUN_M6B_r2_00000__1671
FUN_M6B_r2_00000__1671:
  1671  3476           PSHS  U Y X B A                   
  1673  10AE68         LDY 0x8,S                         
  1676  ECB1           LDD [,Y++]                        
  1678  861C           LDA #0x1c                         
  167a  3D             MUL                               
  167b  A3B4           SUBD [,Y]                         
  167d  A3B4           SUBD [,Y]                         
  167f  A3B4           SUBD [,Y]                         
  1681  A3B1           SUBD [,Y++]                       
  1683  C317C3         ADDD #0x17c3                      
  1686  F3600D         ADDD 0x600d                       
  1689  FD70A8         STD 0x70a8                        
  168c  ECB1           LDD [,Y++]                        
  168e  862A           LDA #0x2a                         
  1690  3D             MUL                               
  1691  A3B4           SUBD [,Y]                         
  1693  A3B4           SUBD [,Y]                         
  1695  A3B4           SUBD [,Y]                         
  1697  A3B4           SUBD [,Y]                         
  1699  A3B4           SUBD [,Y]                         
  169b  A3B1           SUBD [,Y++]                       
  169d  C31833         ADDD #0x1833                      
  16a0  F3600D         ADDD 0x600d                       
  16a3  FD70AA         STD 0x70aa                        
  16a6  ECB1           LDD [,Y++]                        
  16a8  FD70B4         STD 0x70b4                        
  16ab  BE70A8         LDX 0x70a8                        
  16ae  EC84           LDD ,X                            
  16b0  E381           ADDD ,X++                         
  16b2  EDB1           STD [,Y++]                        
  16b4  EC84           LDD ,X                            
  16b6  EDB1           STD [,Y++]                        
  16b8  BE70AA         LDX 0x70aa                        
  16bb  EC81           LDD ,X++                          
  16bd  3606           PSHU  B A                         
  16bf  FC70B4         LDD 0x70b4                        
  16c2  3606           PSHU  B A                         
  16c4  AD9FFCF2       JSR [0xfcf2]                      
  16c8  3706           PULU  A B                         
  16ca  837FFF         SUBD #0x7fff                      
  16cd  EDB1           STD [,Y++]                        
  16cf  EC81           LDD ,X++                          
  16d1  EDB1           STD [,Y++]                        
  16d3  EC84           LDD ,X                            
  16d5  3606           PSHU  B A                         
  16d7  FC70B4         LDD 0x70b4                        
  16da  3606           PSHU  B A                         
  16dc  AD9FFCF2       JSR [0xfcf2]                      
  16e0  3706           PULU  A B                         
  16e2  EDB1           STD [,Y++]                        
  16e4  10AF68         STY 0x8,S                         
  16e7  3576           PULS  A B X Y U                   
  16e9  39             RTS                               

; ---- function FUN_M6B_r2_00000__16ea
FUN_M6B_r2_00000__16ea:
  16ea  3406           PSHS  B A                         
  16ec  FD70C2         STD 0x70c2                        
  16ef  BF70C0         STX 0x70c0                        
  16f2  FC70C2         LDD 0x70c2                        
  16f5  58             LSLB                              
  16f6  C37046         ADDD #0x7046                      
  16f9  FD70BA         STD 0x70ba                        
  16fc  FC70C2         LDD 0x70c2                        
  16ff  58             LSLB                              
  1700  C30054         ADDD #0x54                        
  1703  830008         SUBD #0x8                         
  1706  FD70BC         STD 0x70bc                        
  1709  3506           PULS  A B                         
  170b  39             RTS                               

; ---- function FUN_M6B_r2_00000__170c
FUN_M6B_r2_00000__170c:
  170c  3416           PSHS  X B A                       

; ---- function FUN_M6B_r2_00000__170e
FUN_M6B_r2_00000__170e:
  170e  CC0000         LDD #0x0                          
  1711  8E044B         LDX #0x44b                        
  1714  170030         LBSR 0x1747                       
  1717  CC0001         LDD #0x1                          
  171a  8E044F         LDX #0x44f                        
  171d  170027         LBSR 0x1747                       
  1720  CC0002         LDD #0x2                          
  1723  8E0450         LDX #0x450                        
  1726  17001E         LBSR 0x1747                       
  1729  CC0003         LDD #0x3                          
  172c  8E044C         LDX #0x44c                        
  172f  170015         LBSR 0x1747                       
  1732  CC0004         LDD #0x4                          
  1735  8E044D         LDX #0x44d                        
  1738  17000C         LBSR 0x1747                       
  173b  CC0005         LDD #0x5                          
  173e  8E044E         LDX #0x44e                        
  1741  170003         LBSR 0x1747                       
  1744  3516           PULS  A B X                       
  1746  39             RTS                               

; ---- function FUN_M6B_r2_00000__1747
FUN_M6B_r2_00000__1747:
  1747  3406           PSHS  B A                         
  1749  FD70C2         STD 0x70c2                        
  174c  BF70C0         STX 0x70c0                        
  174f  FC70C2         LDD 0x70c2                        
  1752  58             LSLB                              
  1753  C37046         ADDD #0x7046                      
  1756  FD70BA         STD 0x70ba                        
  1759  17F9A7         LBSR 0x1103                       
  175c  3506           PULS  A B                         
  175e  39             RTS                               

; ---- function FUN_M6B_r2_00000__175f
FUN_M6B_r2_00000__175f:
  175f  3436           PSHS  Y X B A                     
  1761  AD9FFD42       JSR [0xfd42]                      
  1765  FD70C8         STD 0x70c8                        
  1768  2B1A           BMI 0x1784                        
  176a  CC000A         LDD #0xa                          
  176d  AD9FFD20       JSR [0xfd20]                      
  1771  108E074A       LDY #0x74a                        
  1775  CC0000         LDD #0x0                          
  1778  AD9FFD2E       JSR [0xfd2e]                      
  177c  CC0000         LDD #0x0                          
  177f  FD70DA         STD 0x70da                        
  1782  2007           BRA 0x178b                        
LAB_M6B_r2_00000__1784:
  1784  FC70A6         LDD 0x70a6                        
  1787  AD9FFCC4       JSR [0xfcc4]                      
LAB_M6B_r2_00000__178b:
  178b  AD9FFD76       JSR [0xfd76]                      
  178f  3536           PULS  A B X Y                     
  1791  3B             RTI                               

; ---- function FUN_M6B_r2_00000__1792
FUN_M6B_r2_00000__1792:
  1792  3436           PSHS  Y X B A                     
  1794  CC000A         LDD #0xa                          
  1797  AD9FFD20       JSR [0xfd20]                      
  179b  108E074A       LDY #0x74a                        
  179f  CCFFFF         LDD #0xffff                       
  17a2  AD9FFD2E       JSR [0xfd2e]                      
  17a6  CCFFFF         LDD #0xffff                       
  17a9  FD70DA         STD 0x70da                        
  17ac  3536           PULS  A B X Y                     
  17ae  39             RTS                               
  17af  .db 20 35 30 31 30 30 32 30 30 34 30 30 20 32 20 34  ;  50100200400 2 4
  17bf  .db 20 38 31 32 00 00 7F 17 FF FC 7F 17 FF EF 7F 17  ;  812............
  17cf  .db FF DC 7F 17 FF C4 7F 17 FF AA 7F 17 FF 8F 7F 17  ; ................
  17df  .db 00 00 7E 33 FF F7 7E 33 FF DF 7E 33 FF B9 7E 33  ; ..~3..~3..~3..~3
  17ef  .db FF 89 7E 33 FF 54 7E 33 FF 1E 7E 33 00 00 7C 73  ; ..~3.T~3..~3..|s
  17ff  .db FF EF 7C 73 FF BE 7C 73 FF 71 7C 73 FF 12 7C 73  ; ..|s..|s.q|s..|s
  180f  .db FE A7 7C 73 FE 3B 7C 73 00 00 79 18 FF DE 79 18  ; ..|s.;|s..y...y.
  181f  .db FF 7B 79 18 FE E3 79 18 FE 23 79 18 FD 4F 79 18  ; .{y...y..#y..Oy.
  182f  .db FC 77 79 18 00 00 63 9D 7F FF 00 98 63 9D 7D 54  ; .wy...c.....c.}T
  183f  .db 02 4E 63 9D 75 9C 04 F4 63 9D 69 A8 08 47 63 9D  ; .Nc.u...c.i..Gc.
  184f  .db 5A AB 0B F8 63 9D 4A 08 0F B8 63 9D 39 1B 00 00  ; Z...c.J...c.9...
  185f  .db 51 88 7F FF 01 17 51 88 7C FF 04 3E 51 88 74 50  ; Q.....Q.|..>Q.tP
  186f  .db 09 1F 51 88 66 DF 0F 3E 51 88 56 03 16 09 51 88  ; ..Q.f..>Q.V...Q.
  187f  .db 43 4D 1C F1 51 88 30 44 00 00 3B D1 7F FF 01 F4  ; CM..Q.0D..;.....
  188f  .db 3B D1 7C 54 07 9A 3B D1 71 B9 10 5A 3B D1 61 4C  ; ;.|T..;.q..Z;.aL
  189f  .db 1B 53 3B D1 4C B4 27 80 3B D1 35 D7 33 E3 3B D1  ; .S;.L.'.;.5.3.;.
  18af  .db 1E 96 00 00 2F 3C 7F FF 02 BC 2F 3C 7B AA 0A A4  ; ..../<..../<{...
  18bf  .db 2F 3C 6F 22 16 E3 2F 3C 5B BA 26 3D 2F 3C 43 64  ; /<o"../<[.&=/<Cd
  18cf  .db 37 48 2F 3C 28 61 48 9E 2F 3C 0C E8 30 2E 31 30  ; 7H/<(aH./<..0.10
  18df  .db 2E 32 30 2E 33 30 2E 34 30 2E 35 30 2E 36 30 2E  ; .20.30.40.50.60.
  18ef  .db 37 30 2E 38 30 2E 39 31 2E 30 31 2E 31 31 2E 32  ; 70.80.91.01.11.2
  18ff  .db 31 2E 33 31 2E 34 31 2E 35 31 2E 36 31 2E 37 31  ; 1.31.41.51.61.71
  190f  .db 2E 38 31 2E 39 32 2E 30 32 2E 31 32 2E 32 32 2E  ; .81.92.02.12.22.
  191f  .db 33 32 2E 34 32 2E 35 32 2E 36 32 2E 37 32 2E 38  ; 32.42.52.62.72.8
  192f  .db 32 2E 39 33 2E 30 33 2E 32 33 2E 34 33 2E 36 33  ; 2.93.03.23.43.63
  193f  .db 2E 38 34 2E 30 34 2E 32 34 2E 34 34 2E 36 34 2E  ; .84.04.24.44.64.
  194f  .db 38 35 2E 30 35 2E 35 36 2E 30 36 2E 35 37 2E 30  ; 85.05.56.06.57.0
  195f  .db 37 2E 35 38 2E 30 38 2E 35 39 2E 30 39 2E 35 20  ; 7.58.08.59.09.5 
  196f  .db 31 30 20 31 35 20 32 30 20 32 35 20 33 30 20 34  ; 10 15 20 25 30 4
  197f  .db 30 20 35 30 20 36 30 20 37 30 20 38 30 20 39 30  ; 0 50 60 70 80 90
  198f  .db 31 30 30 32 30 30 33 30 30 34 30 30 35 30 30 36  ; 1002003004005006
  199f  .db 30 30 37 30 30 38 30 30 62 69 67 20 F3 20 F3 2B  ; 00700800big . .+
  19af  .db 31 F3 2B 32 F3 2B 33 F3 2B 34 F3 2B 35 02 3E 10  ; 1.+2.+3.+4.+5.>.
  19bf  .db 72 1F F6 2C 8D 36 61 3E 1B 44 49 49 53 4D 7F 51  ; r..,.6a>.DIISM.Q
  19cf  .db 02 53 FF 56 92 58 D0 5A C7 5C 85 5E 11 5F 75 60  ; .S.V.X.Z.\.^._u`
  19df  .db B5 61 D7 62 E0 63 D1 64 AF 65 7A 66 37 66 E5 67  ; .a.b.c.d.ezf7f.g
  19ef  .db 87 68 1E 68 AB 69 2F 69 AA 6A 8C 6B 55 6C 08 6C  ; .h.h.i/i.j.kUl.l
  19ff  .db AA 6D 3B 6D C1 6E 3A 6E AA 6F 10 6F 6E 70 3E 70  ; .m;m.n:n.o.onp>p
  1a0f  .db EC 71 81 72 00 72 6F 72 D0 73 27 73 73 73 B9 73  ; .q.r.ror.s'sss.s
  1a1f  .db F6 75 84 76 4C 76 C5 77 16 77 7B 77 B8 77 E1 77  ; .u.vLv.w.w{w.w.w
  1a2f  .db FE 78 14 78 25 78 33 78 70 78 84 78 8F 78 95 78  ; .x.x%x3xpx.x.x.x
  1a3f  .db 99 78 9C 78 9F 78 A6 78 AE 78 E6 79 4A 79 E0 7A  ; .x.x.x.x.x.yJy.z
  1a4f  .db 4D 7F FF                                         ; M..

;; TMS32010 program 28 for DSP 1: 310 words loaded at $800 (written via bank latch $81)
DSPPROG_28_DSP1_hdr:
  1a52  281002760000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_28_DSP1:
  1a5a  08007F8B6E00.. dw[311]                           

;; TMS32010 program 28 for DSP 2: 427 words loaded at $800 (written via bank latch $82)
DSPPROG_28_DSP2_hdr:
  1cc8  281103600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_28_DSP2:
  1cd0  08007F8B6E00.. dw[428]                           

;; TMS32010 program 28 for DSP 3: 241 words loaded at $800 (written via bank latch $83)
DSPPROG_28_DSP3_hdr:
  2028  281201EC0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_28_DSP3:
  2030  08007F8B6E00.. dw[242]                           

;; TMS32010 program 1E for DSP 1: 384 words loaded at $800 (written via bank latch $81)
DSPPROG_1E_DSP1_hdr:
  2214  1E10030A0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_1E_DSP1:
  221c  08007F8B6E00.. dw[385]                           

;; TMS32010 program 1E for DSP 2: 221 words loaded at $800 (written via bank latch $82)
DSPPROG_1E_DSP2_hdr:
  251e  1E1101C40000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_1E_DSP2:
  2526  08007F8B6E00.. dw[222]                           

;; TMS32010 program 1E for DSP 3: 502 words loaded at $800 (written via bank latch $83)
DSPPROG_1E_DSP3_hdr:
  26e2  1E1203F60000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_1E_DSP3:
  26ea  08007F8B6E00.. dw[503]                           

;; TMS32010 program 08 for DSP 3: 2 words loaded at $800 (written via bank latch $83)
DSPPROG_08_DSP3_hdr:
  2ad8  0812000E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_08_DSP3:
  2ae0  0800F9000800   dw[3]                             

;; TMS32010 program 01 for DSP 1: 220 words loaded at $800 (written via bank latch $81)
DSPPROG_01_DSP1_hdr:
  2ae6  011001C20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_01_DSP1:
  2aee  08007F8B6E00.. dw[221]                           

;; TMS32010 program 01 for DSP 2: 223 words loaded at $800 (written via bank latch $82)
DSPPROG_01_DSP2_hdr:
  2ca8  011101C80000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_01_DSP2:
  2cb0  08007F8B6E00.. dw[224]                           

;; TMS32010 program 01 for DSP 3: 193 words loaded at $800 (written via bank latch $83)
DSPPROG_01_DSP3_hdr:
  2e70  0112018C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_01_DSP3:
  2e78  08007F8B6E00.. dw[194]                           

;; TMS32010 program 00 for DSP 3: 992 words loaded at $800 (written via bank latch $83)
DSPPROG_00_DSP3_hdr:
  2ffc  001207CA0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_00_DSP3:
  3004  08007F807F80.. dw[993]                           

;; TMS32010 program 02 for DSP 3: 199 words loaded at $800 (written via bank latch $83)
DSPPROG_02_DSP3_hdr:
  37c6  021201980000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_02_DSP3:
  37ce  08007F8B6E00.. dw[200]                           

;; TMS32010 program 03 for DSP 3: 121 words loaded at $800 (written via bank latch $83)
DSPPROG_03_DSP3_hdr:
  395e  031200FC0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_03_DSP3:
  3966  08007F8B6E00.. dw[122]                           

;; TMS32010 program 14 for DSP 1: 335 words loaded at $800 (written via bank latch $81)
DSPPROG_14_DSP1_hdr:
  3a5a  141002A80000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_14_DSP1:
  3a62  08007F8B6E00.. dw[336]                           

;; TMS32010 program 14 for DSP 2: 365 words loaded at $800 (written via bank latch $82)
DSPPROG_14_DSP2_hdr:
  3d02  141102E40000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_14_DSP2:
  3d0a  08007F8B6E00.. dw[366]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3fe6  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3fee  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ffe  .db FF FF                                            ; ..
