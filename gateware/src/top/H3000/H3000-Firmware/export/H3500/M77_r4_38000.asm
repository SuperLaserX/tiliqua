; H3500  block M77_r4_38000  M77_r4_38000::0000-M77_r4_38000::3fff
; Bank r4_38000 (module id 77, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 77 parameter/preset table "PHASER", 221 bytes
MODULE_77_TABLE_PHASER_hdr:
  0008  770000E50000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_77_TABLE_PHASER:
  0010  77             ?? 77h    w                       
  0011  .db 01                                               ; .
  0012  504841534552.. ds "PHASER         "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0054  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0064  .db 00 00 00 00 00 00 64 00 3F 00 16 00 29 03 E8 00  ; ......d.?...)...
  0074  .db 00 00 A0 00 82 01 2C 00 0F 00 3C 00 28 03 E8 00  ; ......,...<.(...
  0084  .db 00 00 00 00 01 00 00 00 64 00 64 27 10 00 64 03  ; ........d.d'..d.
  0094  .db E8 03 E8 03 E8 27 10 27 10 03 E8 27 10 00 64 00  ; .....'.'...'..d.
  00a4  .db 64 00 01 00 02 00 01 00 01 02 02 02 02 02 32 00  ; d.............2.
  00b4  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  00d8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 27 10 27  ; .............'.'
  00e8  .db 10 27 10 27 10                                   ; .'.'.

;; Module 77 code record 01, 5748 bytes, entered at payload start
MODULE_77_01_CODE_hdr:
  00ed  7701167C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_77_01_entry
MODULE_77_01_entry:
  00f5  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00F9
  00f9  00F9           dw F9h                            
LAB_M77_r4_38000__00fb:
  00fb  3477           PSHS  U Y X B A CC                
  00fd  170172         LBSR 0x0272                       
  0100  17010C         LBSR 0x020f                       
  0103  170150         LBSR 0x0256                       
  0106  C600           LDB #0x0                          
  0108  AD9FFC58       JSR [0xfc58]                      
  010c  8603           LDA #0x3                          
  010e  B760DA         STA 0x60da                        
  0111  AD9FFE38       JSR [0xfe38]                      
  0115  170071         LBSR 0x0189                       
  0118  B6600A         LDA 0x600a                        
  011b  8177           CMPA #0x77                        
  011d  270B           BEQ 0x012a                        
  011f  AD9FFED0       JSR [0xfed0]                      
  0123  17008C         LBSR 0x01b2                       
  0126  10260029       LBNE 0x0153                       
LAB_M77_r4_38000__012a:
  012a  1701DD         LBSR 0x030a                       
  012d  170212         LBSR 0x0342                       
  0130  B6600A         LDA 0x600a                        
  0133  8177           CMPA #0x77                        
  0135  2707           BEQ 0x013e                        
  0137  CC4E20         LDD #0x4e20                       
  013a  AD9FFD20       JSR [0xfd20]                      
LAB_M77_r4_38000__013e:
  013e  AD9FFE36       JSR [0xfe36]                      
  0142  AD9FFDF6       JSR [0xfdf6]                      
  0146  AD9FFE18       JSR [0xfe18]                      
  014a  170436         LBSR 0x0583                       
  014d  AD9FFE10       JSR [0xfe10]                      
  0151  2033           BRA 0x0186                        
LAB_M77_r4_38000__0153:
  0153  C600           LDB #0x0                          
  0155  AD9FFC36       JSR [0xfc36]                      
  0159  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  015d  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M77_r4_38000__0186:
  0186  3577           PULS CC A B X Y U                 
  0188  39             RTS                               

; ---- function FUN_M77_r4_38000__0189
FUN_M77_r4_38000__0189:
  0189  3476           PSHS  U Y X B A                   
  018b  1A40           ORCC #0x40                        
  018d  3440           PSHS  U                           
  018f  CC1764         LDD #0x1764                       
  0192  F3600D         ADDD 0x600d                       
  0195  1F01           TFR D,X                           
  0197  CC1769         LDD #0x1769                       
  019a  F3600D         ADDD 0x600d                       
  019d  1F03           TFR D,U                           
  019f  108E6600       LDY #0x6600                       
  01a3  AD9FFD08       JSR [0xfd08]                      
  01a7  3540           PULS  U                           
  01a9  AD9FFD76       JSR [0xfd76]                      
  01ad  1CBF           ANDCC #0xbf                       
  01af  3576           PULS  A B X Y U                   
  01b1  39             RTS                               

; ---- function FUN_M77_r4_38000__01b2
FUN_M77_r4_38000__01b2:
  01b2  3476           PSHS  U Y X B A                   
  01b4  C601           LDB #0x1                          
  01b6  8E7710         LDX #0x7710                       
  01b9  AD9FFD30       JSR [0xfd30]                      
  01bd  10260048       LBNE 0x0209                       
  01c1  C602           LDB #0x2                          
  01c3  8E7711         LDX #0x7711                       
  01c6  AD9FFD30       JSR [0xfd30]                      
  01ca  1026003B       LBNE 0x0209                       
  01ce  C603           LDB #0x3                          
  01d0  8E7712         LDX #0x7712                       
  01d3  AD9FFD30       JSR [0xfd30]                      
  01d7  1026002E       LBNE 0x0209                       
  01db  CC0000         LDD #0x0                          
  01de  AD9FFD3C       JSR [0xfd3c]                      
  01e2  AD9FFD40       JSR [0xfd40]                      
  01e6  AD9FFD44       JSR [0xfd44]                      
  01ea  AD9FFD3A       JSR [0xfd3a]                      
  01ee  CC000A         LDD #0xa                          
  01f1  AD9FFD20       JSR [0xfd20]                      
  01f5  108E0000       LDY #0x0                          
  01f9  FC70C2         LDD 0x70c2                        
  01fc  AD9FFD2E       JSR [0xfd2e]                      
  0200  AD9FFD7C       JSR [0xfd7c]                      
  0204  CC0000         LDD #0x0                          
  0207  2003           BRA 0x020c                        
LAB_M77_r4_38000__0209:
  0209  CCFFFF         LDD #0xffff                       
LAB_M77_r4_38000__020c:
  020c  3576           PULS  A B X Y U                   
  020e  39             RTS                               

; ---- function FUN_M77_r4_38000__020f
FUN_M77_r4_38000__020f:
  020f  3406           PSHS  B A                         
  0211  CC0000         LDD #0x0                          
  0214  FD701A         STD 0x701a                        
  0217  FD7022         STD 0x7022                        
  021a  FD702A         STD 0x702a                        
  021d  FD7032         STD 0x7032                        
  0220  FD703A         STD 0x703a                        
  0223  FD70A2         STD 0x70a2                        
  0226  FD709A         STD 0x709a                        
  0229  FD7062         STD 0x7062                        
  022c  FD706A         STD 0x706a                        
  022f  FD7072         STD 0x7072                        
  0232  FD707A         STD 0x707a                        
  0235  FD7082         STD 0x7082                        
  0238  FD708A         STD 0x708a                        
  023b  FD70AA         STD 0x70aa                        
  023e  FD7052         STD 0x7052                        
  0241  FD705A         STD 0x705a                        
  0244  FD7042         STD 0x7042                        
  0247  FD7002         STD 0x7002                        
  024a  FD7008         STD 0x7008                        
  024d  FD700E         STD 0x700e                        
  0250  FD7014         STD 0x7014                        
  0253  3506           PULS  A B                         
  0255  39             RTS                               

; ---- function FUN_M77_r4_38000__0256
FUN_M77_r4_38000__0256:
  0256  3476           PSHS  U Y X B A                   
  0258  CC0000         LDD #0x0                          
  025b  AD9FFC6C       JSR [0xfc6c]                      
  025f  AD9FFC74       JSR [0xfc74]                      
  0263  17137D         LBSR 0x15e3                       
  0266  1713F5         LBSR 0x165e                       
  0269  17146D         LBSR 0x16d9                       
  026c  1714E5         LBSR 0x1754                       
  026f  3576           PULS  A B X Y U                   
  0271  39             RTS                               

; ---- function FUN_M77_r4_38000__0272
FUN_M77_r4_38000__0272:
  0272  3476           PSHS  U Y X B A                   
  0274  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 61:18 63:20
  0278  61             db 61h                            
  0279  18             db 18h                            
  027a  63             db 63h                            
  027b  20             db 20h                            
  027c  00             db 0h                             
LAB_M77_r4_38000__027d:
  027d  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 6B:40
  0281  6B             db 6Bh                            
  0282  40             db 40h                            
  0283  00             db 0h                             
LAB_M77_r4_38000__0284:
  0284  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 65:28 67:30 69:38
  0288  65             db 65h                            
  0289  28             db 28h                            
  028a  67             db 67h                            
  028b  30             db 30h                            
  028c  69             db 69h                            
  028d  38             db 38h                            
  028e  00             db 0h                             
LAB_M77_r4_38000__028f:
  028f  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 6D:60 6F:68
  0293  6D             db 6Dh                            
  0294  60             db 60h                            
  0295  6F             db 6Fh                            
  0296  68             db 68h                            
  0297  00             db 0h                             
LAB_M77_r4_38000__0298:
  0298  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 71:70 73:78
  029c  71             db 71h                            
  029d  70             db 70h                            
  029e  73             db 73h                            
  029f  78             db 78h                            
  02a0  00             db 0h                             
LAB_M77_r4_38000__02a1:
  02a1  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 75:80 77:88
  02a5  75             db 75h                            
  02a6  80             db 80h                            
  02a7  77             db 77h                            
  02a8  88             db 88h                            
  02a9  00             db 0h                             
LAB_M77_r4_38000__02aa:
  02aa  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 79:98 7B:A0 81:A8
  02ae  79             db 79h                            
  02af  98             db 98h                            
  02b0  7B             db 7Bh                            
  02b1  A0             db A0h                            
  02b2  81             db 81h                            
  02b3  A8             db A8h                            
  02b4  00             db 0h                             
LAB_M77_r4_38000__02b5:
  02b5  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 83:1E 85:26 9F:46
  02b9  83             db 83h                            
  02ba  1E             db 1Eh                            
  02bb  85             db 85h                            
  02bc  26             db 26h                            
  02bd  9F             db 9Fh                            
  02be  46             db 46h                            
  02bf  00             db 0h                             
LAB_M77_r4_38000__02c0:
  02c0  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 87:2E 89:36 8B:3E
  02c4  87             db 87h                            
  02c5  2E             db 2Eh                            
  02c6  89             db 89h                            
  02c7  36             db 36h                            
  02c8  8B             db 8Bh                            
  02c9  3E             db 3Eh                            
  02ca  00             db 0h                             
LAB_M77_r4_38000__02cb:
  02cb  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 91:66 93:6E
  02cf  91             db 91h                            
  02d0  66             db 66h                            
  02d1  93             db 93h                            
  02d2  6E             db 6Eh                            
  02d3  00             db 0h                             
LAB_M77_r4_38000__02d4:
  02d4  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 95:76 97:7E
  02d8  95             db 95h                            
  02d9  76             db 76h                            
  02da  97             db 97h                            
  02db  7E             db 7Eh                            
  02dc  00             db 0h                             
LAB_M77_r4_38000__02dd:
  02dd  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 99:86 9B:8E
  02e1  99             db 99h                            
  02e2  86             db 86h                            
  02e3  9B             db 9Bh                            
  02e4  8E             db 8Eh                            
  02e5  00             db 0h                             
LAB_M77_r4_38000__02e6:
  02e6  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 8D:9E 8F:A6 9D:AE
  02ea  8D             db 8Dh                            
  02eb  9E             db 9Eh                            
  02ec  8F             db 8Fh                            
  02ed  A6             db A6h                            
  02ee  9D             db 9Dh                            
  02ef  AE             db AEh                            
  02f0  00             db 0h                             
LAB_M77_r4_38000__02f1:
  02f1  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 7D:50 7F:58
  02f5  7D             db 7Dh                            
  02f6  50             db 50h                            
  02f7  7F             db 7Fh                            
  02f8  58             db 58h                            
  02f9  00             db 0h                             
LAB_M77_r4_38000__02fa:
  02fa  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:00 1A:06 1B:0C 1C:12
  02fe  19             db 19h                            
  02ff  00             db 0h                             
  0300  1A             db 1Ah                            
  0301  06             db 6h                             
  0302  1B             db 1Bh                            
  0303  0C             db Ch                             
  0304  1C             db 1Ch                            
  0305  12             db 12h                            
  0306  00             db 0h                             
LAB_M77_r4_38000__0307:
  0307  3576           PULS  A B X Y U                   
  0309  39             RTS                               

; ---- function FUN_M77_r4_38000__030a
FUN_M77_r4_38000__030a:
  030a  3476           PSHS  U Y X B A                   
  030c  1704C0         LBSR 0x07cf                       
  030f  170569         LBSR 0x087b                       
  0312  17064B         LBSR 0x0960                       
  0315  1706F4         LBSR 0x0a0c                       
  0318  1707A7         LBSR 0x0ac2                       
  031b  170892         LBSR 0x0bb0                       
  031e  170C0A         LBSR 0x0f2b                       
  0321  170CD3         LBSR 0x0ff7                       
  0324  170D89         LBSR 0x10b0                       
  0327  170E45         LBSR 0x116f                       
  032a  170EFB         LBSR 0x1228                       
  032d  170FAE         LBSR 0x12de                       
  0330  1709AE         LBSR 0x0ce1                       
  0333  1709AB         LBSR 0x0ce1                       
  0336  17100D         LBSR 0x1346                       
  0339  1710E6         LBSR 0x1422                       
  033c  1711C2         LBSR 0x1501                       
  033f  3576           PULS  A B X Y U                   
  0341  39             RTS                               

; ---- function FUN_M77_r4_38000__0342
FUN_M77_r4_38000__0342:
  0342  3476           PSHS  U Y X B A                   
  0344  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "  mix   " 21 $07A2 $07AE
  0348  00             db 0h                             
  0349  80             db 80h                            
  034a  20206D697820.. ds "  mix   "                     
  0352  21             db 21h                            
  0353  07A2           addr M77_r4_38000::07a2           
  0355  07AE           addr M77_r4_38000::07ae           
LAB_M77_r4_38000__0357:
  0357  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "feedback" 25 $084E $085A
  035b  01             db 1h                             
  035c  80             db 80h                            
  035d  666565646261.. ds "feedback"                     
  0365  25             db 25h                            
  0366  084E           addr M77_r4_38000::084e           
  0368  085A           addr M77_r4_38000::085a           
LAB_M77_r4_38000__036a:
  036a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "swp rate" 29 $0920 $092C
  036e  02             db 2h                             
  036f  80             db 80h                            
  0370  737770207261.. ds "swp rate"                     
  0378  29             db 29h                            
  0379  0920           addr M77_r4_38000::0920           
  037b  092C           addr M77_r4_38000::092c           
LAB_M77_r4_38000__037d:
  037d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "env rate" 2D $09DF $09EB
  0381  03             db 3h                             
  0382  80             db 80h                            
  0383  656E76207261.. ds "env rate"                     
  038b  2D             db 2Dh                            
  038c  09DF           addr M77_r4_38000::09df           
  038e  09EB           addr M77_r4_38000::09eb           
LAB_M77_r4_38000__0390:
  0390  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "adsrrate" 31 $0A95 $0AA1
  0394  04             db 4h                             
  0395  80             db 80h                            
  0396  616473727261.. ds "adsrrate"                     
  039e  31             db 31h                            
  039f  0A95           addr M77_r4_38000::0a95           
  03a1  0AA1           addr M77_r4_38000::0aa1           
LAB_M77_r4_38000__03a3:
  03a3  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "botmfreq" 39 $0C30 $0C3C
  03a7  06             db 6h                             
  03a8  80             db 80h                            
  03a9  626F746D6672.. ds "botmfreq"                     
  03b1  39             db 39h                            
  03b2  0C30           addr M77_r4_38000::0c30           
  03b4  0C3C           addr M77_r4_38000::0c3c           
LAB_M77_r4_38000__03b6:
  03b6  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "top freq" 3D $0CB4 $0CC0
  03ba  07             db 7h                             
  03bb  80             db 80h                            
  03bc  746F70206672.. ds "top freq"                     
  03c4  3D             db 3Dh                            
  03c5  0CB4           addr M77_r4_38000::0cb4           
  03c7  0CC0           addr M77_r4_38000::0cc0           
LAB_M77_r4_38000__03c9:
  03c9  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 "adsr att" 41 $0EEB $0EF7
  03cd  08             db 8h                             
  03ce  80             db 80h                            
  03cf  616473722061.. ds "adsr att"                     
  03d7  41             db 41h                            
  03d8  0EEB           addr M77_r4_38000::0eeb           
  03da  0EF7           addr M77_r4_38000::0ef7           
LAB_M77_r4_38000__03dc:
  03dc  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 "adsr dec" 45 $0FB7 $0FC3
  03e0  09             db 9h                             
  03e1  80             db 80h                            
  03e2  616473722064.. ds "adsr dec"                     
  03ea  45             db 45h                            
  03eb  0FB7           addr M77_r4_38000::0fb7           
  03ed  0FC3           addr M77_r4_38000::0fc3           
LAB_M77_r4_38000__03ef:
  03ef  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "adsr sus" 49 $1083 $108F
  03f3  0A             db Ah                             
  03f4  80             db 80h                            
  03f5  616473722073.. ds "adsr sus"                     
  03fd  49             db 49h                            
  03fe  1083           addr M77_r4_38000::1083           
  0400  108F           addr M77_r4_38000::108f           
LAB_M77_r4_38000__0402:
  0402  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 "adsr rel" 4D $112F $113B
  0406  0B             db Bh                             
  0407  80             db 80h                            
  0408  616473722072.. ds "adsr rel"                     
  0410  4D             db 4Dh                            
  0411  112F           addr M77_r4_38000::112f           
  0413  113B           addr M77_r4_38000::113b           
LAB_M77_r4_38000__0415:
  0415  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0C 80 "a thresh" 51 $11FB $1207
  0419  0C             db Ch                             
  041a  80             db 80h                            
  041b  612074687265.. ds "a thresh"                     
  0423  51             db 51h                            
  0424  11FB           addr M77_r4_38000::11fb           
  0426  1207           addr M77_r4_38000::1207           
LAB_M77_r4_38000__0428:
  0428  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0D 80 "r thresh" 55 $12B1 $12BD
  042c  0D             db Dh                             
  042d  80             db 80h                            
  042e  722074687265.. ds "r thresh"                     
  0436  55             db 55h                            
  0437  12B1           addr M77_r4_38000::12b1           
  0439  12BD           addr M77_r4_38000::12bd           
LAB_M77_r4_38000__043b:
  043b  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 0E 80 "adsrtrig" 59 $1339 $074B
  043f  0E             db Eh                             
  0440  80             db 80h                            
  0441  616473727472.. ds "adsrtrig"                     
  0449  59             db 59h                            
  044a  1339           addr M77_r4_38000::1339           
  044c  074B           addr M77_r4_38000::074b           
LAB_M77_r4_38000__044e:
  044e  CC046A         LDD #0x46a                        
  0451  FD60F5         STD 0x60f5                        
  0454  CC002A         LDD #0x2a                         
  0457  47             ASRA                              
  0458  56             RORB                              
  0459  FD60F7         STD 0x60f7                        
  045c  8601           LDA #0x1                          
  045e  B76105         STA 0x6105                        
  0461  CC00A5         LDD #0xa5                         
  0464  FD6106         STD 0x6106                        
  0467  3576           PULS  A B X Y U                   
  0469  39             RTS                               
  046a  0494049F04AA.. addr[21]                          

; ---- function FUN_M77_r4_38000__0494
FUN_M77_r4_38000__0494:
  0494  1702E7         LBSR 0x077e                       
  0497  1700E9         LBSR 0x0583                       
  049a  AD9FFE10       JSR [0xfe10]                      
  049e  39             RTS                               

; ---- function FUN_M77_r4_38000__049f
FUN_M77_r4_38000__049f:
  049f  170388         LBSR 0x082a                       
  04a2  1700DE         LBSR 0x0583                       
  04a5  AD9FFE12       JSR [0xfe12]                      
  04a9  39             RTS                               

; ---- function FUN_M77_r4_38000__04aa
FUN_M77_r4_38000__04aa:
  04aa  17044F         LBSR 0x08fc                       
  04ad  1700D3         LBSR 0x0583                       
  04b0  1701FC         LBSR 0x06af                       
  04b3  AD9FFE14       JSR [0xfe14]                      
  04b7  39             RTS                               

; ---- function FUN_M77_r4_38000__04b8
FUN_M77_r4_38000__04b8:
  04b8  170500         LBSR 0x09bb                       
  04bb  1700C5         LBSR 0x0583                       
  04be  17020F         LBSR 0x06d0                       
  04c1  AD9FFE14       JSR [0xfe14]                      
  04c5  39             RTS                               

; ---- function FUN_M77_r4_38000__04c6
FUN_M77_r4_38000__04c6:
  04c6  1705A8         LBSR 0x0a71                       
  04c9  1700B7         LBSR 0x0583                       
  04cc  170222         LBSR 0x06f1                       
  04cf  AD9FFE14       JSR [0xfe14]                      
  04d3  39             RTS                               

; ---- function FUN_M77_r4_38000__04d4
FUN_M77_r4_38000__04d4:
  04d4  17069D         LBSR 0x0b74                       
  04d7  1700A9         LBSR 0x0583                       
  04da  AD9FFE16       JSR [0xfe16]                      
  04de  39             RTS                               

; ---- function FUN_M77_r4_38000__04df
FUN_M77_r4_38000__04df:
  04df  17072A         LBSR 0x0c0c                       
  04e2  1700DE         LBSR 0x05c3                       
  04e5  AD9FFE10       JSR [0xfe10]                      
  04e9  39             RTS                               

; ---- function FUN_M77_r4_38000__04ea
FUN_M77_r4_38000__04ea:
  04ea  1707A3         LBSR 0x0c90                       
  04ed  1700D3         LBSR 0x05c3                       
  04f0  AD9FFE12       JSR [0xfe12]                      
  04f4  39             RTS                               

; ---- function FUN_M77_r4_38000__04f5
FUN_M77_r4_38000__04f5:
  04f5  1709CF         LBSR 0x0ec7                       
  04f8  170105         LBSR 0x0600                       
  04fb  AD9FFE10       JSR [0xfe10]                      
  04ff  39             RTS                               

; ---- function FUN_M77_r4_38000__0500
FUN_M77_r4_38000__0500:
  0500  170A90         LBSR 0x0f93                       
  0503  1700FA         LBSR 0x0600                       
  0506  AD9FFE12       JSR [0xfe12]                      
  050a  39             RTS                               

; ---- function FUN_M77_r4_38000__050b
FUN_M77_r4_38000__050b:
  050b  170B51         LBSR 0x105f                       
  050e  1700EF         LBSR 0x0600                       
  0511  AD9FFE14       JSR [0xfe14]                      
  0515  39             RTS                               

; ---- function FUN_M77_r4_38000__0516
FUN_M77_r4_38000__0516:
  0516  170BF2         LBSR 0x110b                       
  0519  1700E4         LBSR 0x0600                       
  051c  AD9FFE16       JSR [0xfe16]                      
  0520  39             RTS                               

; ---- function FUN_M77_r4_38000__0521
FUN_M77_r4_38000__0521:
  0521  170CB3         LBSR 0x11d7                       
  0524  170116         LBSR 0x063d                       
  0527  AD9FFE10       JSR [0xfe10]                      
  052b  39             RTS                               

; ---- function FUN_M77_r4_38000__052c
FUN_M77_r4_38000__052c:
  052c  170D5E         LBSR 0x128d                       
  052f  17010B         LBSR 0x063d                       
  0532  AD9FFE16       JSR [0xfe16]                      
  0536  39             RTS                               

; ---- function FUN_M77_r4_38000__0537
FUN_M77_r4_38000__0537:
  0537  170E0D         LBSR 0x1347                       
  053a  39             RTS                               

; ---- function FUN_M77_r4_38000__053b
FUN_M77_r4_38000__053b:
  053b  170E72         LBSR 0x13b0                       
  053e  17012B         LBSR 0x066c                       
  0541  AD9FFE14       JSR [0xfe14]                      
  0545  39             RTS                               

; ---- function FUN_M77_r4_38000__0546
FUN_M77_r4_38000__0546:
  0546  170F46         LBSR 0x148f                       
  0549  170120         LBSR 0x066c                       
  054c  AD9FFE12       JSR [0xfe12]                      
  0550  39             RTS                               

; ---- function FUN_M77_r4_38000__0551
FUN_M77_r4_38000__0551:
  0551  171056         LBSR 0x15aa                       
  0554  1701BB         LBSR 0x0712                       
  0557  AD9FFE10       JSR [0xfe10]                      
  055b  39             RTS                               

; ---- function FUN_M77_r4_38000__055c
FUN_M77_r4_38000__055c:
  055c  1710C6         LBSR 0x1625                       
  055f  1701B0         LBSR 0x0712                       
  0562  AD9FFE12       JSR [0xfe12]                      
  0566  39             RTS                               

; ---- function FUN_M77_r4_38000__0567
FUN_M77_r4_38000__0567:
  0567  171136         LBSR 0x16a0                       
  056a  1701A5         LBSR 0x0712                       
  056d  AD9FFE14       JSR [0xfe14]                      
  0571  39             RTS                               

; ---- function FUN_M77_r4_38000__0572
FUN_M77_r4_38000__0572:
  0572  1711A6         LBSR 0x171b                       
  0575  17019A         LBSR 0x0712                       
  0578  AD9FFE16       JSR [0xfe16]                      
  057c  39             RTS                               
  057d  .db 39 AD 9F FD FC 39                                ; 9....9

; ---- function FUN_M77_r4_38000__0583
FUN_M77_r4_38000__0583:
  0583  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " "feedback" "  rate  " "  mode  "
  0587  20206D697820.. ds "  mix   "                     
  058f  666565646261.. ds "feedback"                     
  0597  202072617465.. ds "  rate  "                     
  059f  20206D6F6465.. ds "  mode  "                     
LAB_M77_r4_38000__05a7:
  05a7  AD9FFDF2       JSR [0xfdf2]                      
  05ab  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0772 ->$081E ->$094D ->$0B68 ->$05C3 ->$05C3
  05af  0772           addr M77_r4_38000::0772           
  05b1  081E           addr M77_r4_38000::081e           
  05b3  094D           addr M77_r4_38000::094d           
  05b5  0B68           addr M77_r4_38000::0b68           
  05b7  05C3           addr M77_r4_38000::05c3           
  05b9  05C3           addr M77_r4_38000::05c3           
LAB_M77_r4_38000__05bb:
  05bb  170F96         LBSR 0x1554                       
  05be  AD9FFDF2       JSR [0xfdf2]                      
  05c2  39             RTS                               

; ---- function FUN_M77_r4_38000__05c3
FUN_M77_r4_38000__05c3:
  05c3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "botmfreq" "top freq" " levels " " expert "
  05c7  626F746D6672.. ds "botmfreq"                     
  05cf  746F70206672.. ds "top freq"                     
  05d7  206C6576656C.. ds " levels "                     
  05df  206578706572.. ds " expert "                     
LAB_M77_r4_38000__05e7:
  05e7  AD9FFDF2       JSR [0xfdf2]                      
  05eb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C00 ->$0C84 ->$0712 ->$0600 ->$0583 ->$0583
  05ef  0C00           addr M77_r4_38000::0c00           
  05f1  0C84           addr M77_r4_38000::0c84           
  05f3  0712           addr M77_r4_38000::0712           
  05f5  0600           addr M77_r4_38000::0600           
  05f7  0583           addr M77_r4_38000::0583           
  05f9  0583           addr M77_r4_38000::0583           
LAB_M77_r4_38000__05fb:
  05fb  AD9FFDF2       JSR [0xfdf2]                      
  05ff  39             RTS                               

; ---- function FUN_M77_r4_38000__0600
FUN_M77_r4_38000__0600:
  0600  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " attack " " decay  " "sustain " "release "
  0604  206174746163.. ds " attack "                     
  060c  206465636179.. ds " decay  "                     
  0614  737573746169.. ds "sustain "                     
  061c  72656C656173.. ds "release "                     
LAB_M77_r4_38000__0624:
  0624  AD9FFDF2       JSR [0xfdf2]                      
  0628  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F18 ->$0FE4 ->$1053 ->$115C ->$063D ->$066C
  062c  0F18           addr M77_r4_38000::0f18           
  062e  0FE4           addr M77_r4_38000::0fe4           
  0630  1053           addr M77_r4_38000::1053           
  0632  115C           addr M77_r4_38000::115c           
  0634  063D           addr M77_r4_38000::063d           
  0636  066C           addr M77_r4_38000::066c           
LAB_M77_r4_38000__0638:
  0638  AD9FFDF2       JSR [0xfdf2]                      
  063c  39             RTS                               

; ---- function FUN_M77_r4_38000__063d
FUN_M77_r4_38000__063d:
  063d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "a thresh" [*] [*] "r thresh"
  0641  612074687265.. ds "a thresh"                     
  0649  01             db 1h                             
  064a  01             db 1h                             
  064b  722074687265.. ds "r thresh"                     
LAB_M77_r4_38000__0653:
  0653  AD9FFDF2       JSR [0xfdf2]                      
  0657  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$11CB ->$074B ->$074B ->$1281 ->$066C ->$0600
  065b  11CB           addr M77_r4_38000::11cb           
  065d  074B           addr M77_r4_38000::074b           
  065f  074B           addr M77_r4_38000::074b           
  0661  1281           addr M77_r4_38000::1281           
  0663  066C           addr M77_r4_38000::066c           
  0665  0600           addr M77_r4_38000::0600           
LAB_M77_r4_38000__0667:
  0667  AD9FFDF2       JSR [0xfdf2]                      
  066b  39             RTS                               

; ---- function FUN_M77_r4_38000__066c
FUN_M77_r4_38000__066c:
  066c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "env rate" "env type" "env chan" " return "
  0670  656E76207261.. ds "env rate"                     
  0678  656E76207479.. ds "env type"                     
  0680  656E76206368.. ds "env chan"                     
  0688  207265747572.. ds " return "                     
LAB_M77_r4_38000__0690:
  0690  AD9FFDF2       JSR [0xfdf2]                      
  0694  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$09AF ->$1477 ->$1398 ->$05C3 ->$0600 ->$063D
  0698  09AF           addr M77_r4_38000::09af           
  069a  1477           addr M77_r4_38000::1477           
  069c  1398           addr M77_r4_38000::1398           
  069e  05C3           addr M77_r4_38000::05c3           
  06a0  0600           addr M77_r4_38000::0600           
  06a2  063D           addr M77_r4_38000::063d           
LAB_M77_r4_38000__06a4:
  06a4  170E0F         LBSR 0x14b6                       
  06a7  170D2D         LBSR 0x13d7                       
  06aa  AD9FFDF2       JSR [0xfdf2]                      
  06ae  39             RTS                               

; ---- function FUN_M77_r4_38000__06af
FUN_M77_r4_38000__06af:
  06af  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "swp rate" [-]
  06b3  00             db 0h                             
  06b4  00             db 0h                             
  06b5  737770207261.. ds "swp rate"                     
  06bd  00             db 0h                             
LAB_M77_r4_38000__06be:
  06be  AD9FFDF2       JSR [0xfdf2]                      
  06c2  AD9FFDEE       JSR [0xfdee]                      
  06c6  CC094D         LDD #0x94d                        
  06c9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  06cd  60E7           addr 60e7                         
LAB_M77_r4_38000__06cf:
  06cf  39             RTS                               

; ---- function FUN_M77_r4_38000__06d0
FUN_M77_r4_38000__06d0:
  06d0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "env rate" [-]
  06d4  00             db 0h                             
  06d5  00             db 0h                             
  06d6  656E76207261.. ds "env rate"                     
  06de  00             db 0h                             
LAB_M77_r4_38000__06df:
  06df  AD9FFDF2       JSR [0xfdf2]                      
  06e3  AD9FFDEE       JSR [0xfdee]                      
  06e7  CC09AF         LDD #0x9af                        
  06ea  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  06ee  60E7           addr 60e7                         
LAB_M77_r4_38000__06f0:
  06f0  39             RTS                               

; ---- function FUN_M77_r4_38000__06f1
FUN_M77_r4_38000__06f1:
  06f1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "adsrrate" [-]
  06f5  00             db 0h                             
  06f6  00             db 0h                             
  06f7  616473727261.. ds "adsrrate"                     
  06ff  00             db 0h                             
LAB_M77_r4_38000__0700:
  0700  AD9FFDF2       JSR [0xfdf2]                      
  0704  AD9FFDEE       JSR [0xfdee]                      
  0708  CC0A65         LDD #0xa65                        
  070b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  070f  60E7           addr 60e7                         
LAB_M77_r4_38000__0711:
  0711  39             RTS                               

; ---- function FUN_M77_r4_38000__0712
FUN_M77_r4_38000__0712:
  0712  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" "left out" "rightout"
  0716  6C6566742069.. ds "left in "                     
  071e  726967687420.. ds "right in"                     
  0726  6C656674206F.. ds "left out"                     
  072e  72696768746F.. ds "rightout"                     
LAB_M77_r4_38000__0736:
  0736  AD9FFDF2       JSR [0xfdf2]                      
  073a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$159E ->$1619 ->$1694 ->$170F ->$05C3 ->$05C3
  073e  159E           addr M77_r4_38000::159e           
  0740  1619           addr M77_r4_38000::1619           
  0742  1694           addr M77_r4_38000::1694           
  0744  170F           addr M77_r4_38000::170f           
  0746  05C3           addr M77_r4_38000::05c3           
  0748  05C3           addr M77_r4_38000::05c3           
LAB_M77_r4_38000__074a:
  074a  39             RTS                               

; ---- function FUN_M77_r4_38000__074b
FUN_M77_r4_38000__074b:
  074b  39             RTS                               
PTR_FUN_M77_r4_38000__07cf_M77_r4_38000__074c:
  074c  07CF           addr M77_r4_38000::07cf           
  074e  0796           addr M77_r4_38000::0796           
  0750  .db 07 8A 70 18 70 1A 00 00 70 1C 00 08 00 69 00 00  ; ..p.p...p....i..
  0760  .db 00 00 64 00 01 00 03 1F 07 BA 00 00 00 00 70 1E  ; ..d...........p.
  0770  .db 00 8B                                            ; ..

; ---- function FUN_M77_r4_38000__0772
FUN_M77_r4_38000__0772:
  0772  3410           PSHS  X                           
  0774  8E074C         LDX #0x74c                         ; desc[API_FE6A]: ->$07CF ->$0796
  0777  AD9FFE6A       JSR [0xfe6a]                      
  077b  3510           PULS  X                           
  077d  39             RTS                               

; ---- function FUN_M77_r4_38000__077e
FUN_M77_r4_38000__077e:
  077e  3410           PSHS  X                           
  0780  8E074C         LDX #0x74c                         ; desc[API_FDBC]: ->$07CF ->$0796
  0783  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...L"
  0787  3510           PULS  X                           
  0789  39             RTS                               

; ---- function FUN_M77_r4_38000__078a
FUN_M77_r4_38000__078a:
  078a  3410           PSHS  X                           
  078c  8E074C         LDX #0x74c                         ; desc[API_FE6C]: ->$07CF ->$0796
  078f  AD9FFE6C       JSR [0xfe6c]                      
  0793  3510           PULS  X                           
  0795  39             RTS                               

; ---- function FUN_M77_r4_38000__0796
FUN_M77_r4_38000__0796:
  0796  3410           PSHS  X                           
  0798  8E074C         LDX #0x74c                         ; desc[API_FE6E]: ->$07CF ->$0796
  079b  AD9FFE6E       JSR [0xfe6e]                      
  079f  3510           PULS  X                           
  07a1  39             RTS                               

; ---- function FUN_M77_r4_38000__07a2
FUN_M77_r4_38000__07a2:
  07a2  3410           PSHS  X                           
  07a4  8E074C         LDX #0x74c                         ; desc[API_FE1C]: ->$07CF ->$0796
  07a7  AD9FFE1C       JSR [0xfe1c]                      
  07ab  3510           PULS  X                           
  07ad  39             RTS                               

; ---- function FUN_M77_r4_38000__07ae
FUN_M77_r4_38000__07ae:
  07ae  3410           PSHS  X                           
  07b0  8E074C         LDX #0x74c                         ; desc[API_FE1A]: ->$07CF ->$0796 $078A
  07b3  AD9FFE1A       JSR [0xfe1a]                      
  07b7  3510           PULS  X                           
  07b9  39             RTS                               
  07ba  .db 14 20 20 20 20 6D 69 78 3A 20 20 20 78 78 78 20  ; .    mix:   xxx 
  07ca  .db 25 20 77 65 74                                   ; % wet

; ---- function FUN_M77_r4_38000__07cf
FUN_M77_r4_38000__07cf:
  07cf  3476           PSHS  U Y X B A                   
  07d1  8E074C         LDX #0x74c                        
  07d4  AD9FFE76       JSR [0xfe76]                      
  07d8  FC701C         LDD 0x701c                        
  07db  3606           PSHU  B A                         
  07dd  AD9FFEC4       JSR [0xfec4]                      
  07e1  3706           PULU  A B                         
  07e3  FD70C2         STD 0x70c2                        
  07e6  3626           PSHU  Y B A                       
  07e8  108E001E       LDY #0x1e                         
  07ec  FC70C2         LDD 0x70c2                        
  07ef  AD9FFD2E       JSR [0xfd2e]                      
  07f3  3726           PULU  A B Y                       
  07f5  3576           PULS  A B X Y U                   
  07f7  39             RTS                               
PTR_FUN_M77_r4_38000__087b_M77_r4_38000__07f8:
  07f8  087B           addr M77_r4_38000::087b           
  07fa  0842           addr M77_r4_38000::0842           
  07fc  .db 08 36 70 20 70 22 00 00 70 24 00 08 00 6B 01 FF  ; .6p p"..p$...k..
  080c  .db 9C 00 64 00 01 00 04 22 08 66 00 00 00 00 70 26  ; ..d....".f....p&
  081c  .db 00 8D                                            ; ..

; ---- function FUN_M77_r4_38000__081e
FUN_M77_r4_38000__081e:
  081e  3410           PSHS  X                           
  0820  8E07F8         LDX #0x7f8                         ; desc[API_FE6A]: ->$087B ->$0842
  0823  AD9FFE6A       JSR [0xfe6a]                      
  0827  3510           PULS  X                           
  0829  39             RTS                               

; ---- function FUN_M77_r4_38000__082a
FUN_M77_r4_38000__082a:
  082a  3410           PSHS  X                           
  082c  8E07F8         LDX #0x7f8                         ; desc[API_FDBC]: ->$087B ->$0842
  082f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0833  3510           PULS  X                           
  0835  39             RTS                               

; ---- function FUN_M77_r4_38000__0836
FUN_M77_r4_38000__0836:
  0836  3410           PSHS  X                           
  0838  8E07F8         LDX #0x7f8                         ; desc[API_FE6C]: ->$087B ->$0842
  083b  AD9FFE6C       JSR [0xfe6c]                      
  083f  3510           PULS  X                           
  0841  39             RTS                               

; ---- function FUN_M77_r4_38000__0842
FUN_M77_r4_38000__0842:
  0842  3410           PSHS  X                           
  0844  8E07F8         LDX #0x7f8                         ; desc[API_FE6E]: ->$087B ->$0842
  0847  AD9FFE6E       JSR [0xfe6e]                      
  084b  3510           PULS  X                           
  084d  39             RTS                               

; ---- function FUN_M77_r4_38000__084e
FUN_M77_r4_38000__084e:
  084e  3410           PSHS  X                           
  0850  8E07F8         LDX #0x7f8                         ; desc[API_FE1C]: ->$087B ->$0842
  0853  AD9FFE1C       JSR [0xfe1c]                      
  0857  3510           PULS  X                           
  0859  39             RTS                               

; ---- function FUN_M77_r4_38000__085a
FUN_M77_r4_38000__085a:
  085a  3410           PSHS  X                           
  085c  8E07F8         LDX #0x7f8                         ; desc[API_FE1A]: ->$087B ->$0842 $0836
  085f  AD9FFE1A       JSR [0xfe1a]                      
  0863  3510           PULS  X                           
  0865  39             RTS                               
  0866  .db 14 66 65 65 64 62 61 63 6B 20 61 6D 74 3A 20 78  ; .feedback amt: x
  0876  .db 78 78 78 20 25                                   ; xxx %

; ---- function FUN_M77_r4_38000__087b
FUN_M77_r4_38000__087b:
  087b  3476           PSHS  U Y X B A                   
  087d  8E07F8         LDX #0x7f8                        
  0880  AD9FFE76       JSR [0xfe76]                      
  0884  FC7024         LDD 0x7024                        
  0887  3606           PSHU  B A                         
  0889  AD9FFEC4       JSR [0xfec4]                      
  088d  3706           PULU  A B                         
  088f  FD70C2         STD 0x70c2                        
  0892  3606           PSHU  B A                         
  0894  CC6000         LDD #0x6000                       
  0897  3606           PSHU  B A                         
  0899  AD9FFCF2       JSR [0xfcf2]                      
  089d  AD9FFCC8       JSR [0xfcc8]                      
  08a1  CC7FFF         LDD #0x7fff                       
  08a4  A3C1           SUBD ,U++                         
  08a6  FD70C4         STD 0x70c4                        
  08a9  3626           PSHU  Y B A                       
  08ab  108E001F       LDY #0x1f                         
  08af  FC70C2         LDD 0x70c2                        
  08b2  AD9FFD2E       JSR [0xfd2e]                      
  08b6  3726           PULU  A B Y                       
  08b8  3626           PSHU  Y B A                       
  08ba  108E005B       LDY #0x5b                         
  08be  FC70C4         LDD 0x70c4                        
  08c1  AD9FFD2E       JSR [0xfd2e]                      
  08c5  3726           PULU  A B Y                       
  08c7  3576           PULS  A B X Y U                   
  08c9  39             RTS                               
PTR_FUN_M77_r4_38000__0960_M77_r4_38000__08ca:
  08ca  0960           addr M77_r4_38000::0960           
  08cc  0914           addr M77_r4_38000::0914           
  08ce  .db 09 08 70 28 70 2A 00 00 70 2C 00 08 00 6D 02 00  ; ..p(p*..p,...m..
  08de  .db 00 27 10 00 01 02 06 22 09 38 00 00 00 00 70 2E  ; .'.....".8....p.
  08ee  .db 00 8F                                            ; ..

; ---- function FUN_M77_r4_38000__08f0
FUN_M77_r4_38000__08f0:
  08f0  3410           PSHS  X                           
  08f2  8E08CA         LDX #0x8ca                         ; desc[API_FE6A]: ->$0960 ->$0914
  08f5  AD9FFE6A       JSR [0xfe6a]                      
  08f9  3510           PULS  X                           
  08fb  39             RTS                               

; ---- function FUN_M77_r4_38000__08fc
FUN_M77_r4_38000__08fc:
  08fc  3410           PSHS  X                           
  08fe  8E08CA         LDX #0x8ca                         ; desc[API_FDBC]: ->$0960 ->$0914
  0901  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0905  3510           PULS  X                           
  0907  39             RTS                               

; ---- function FUN_M77_r4_38000__0908
FUN_M77_r4_38000__0908:
  0908  3410           PSHS  X                           
  090a  8E08CA         LDX #0x8ca                         ; desc[API_FE6C]: ->$0960 ->$0914
  090d  AD9FFE6C       JSR [0xfe6c]                      
  0911  3510           PULS  X                           
  0913  39             RTS                               

; ---- function FUN_M77_r4_38000__0914
FUN_M77_r4_38000__0914:
  0914  3410           PSHS  X                           
  0916  8E08CA         LDX #0x8ca                         ; desc[API_FE6E]: ->$0960 ->$0914
  0919  AD9FFE6E       JSR [0xfe6e]                      
  091d  3510           PULS  X                           
  091f  39             RTS                               

; ---- function FUN_M77_r4_38000__0920
FUN_M77_r4_38000__0920:
  0920  3410           PSHS  X                           
  0922  8E08CA         LDX #0x8ca                         ; desc[API_FE1C]: ->$0960 ->$0914
  0925  AD9FFE1C       JSR [0xfe1c]                      
  0929  3510           PULS  X                           
  092b  39             RTS                               

; ---- function FUN_M77_r4_38000__092c
FUN_M77_r4_38000__092c:
  092c  3410           PSHS  X                           
  092e  8E08CA         LDX #0x8ca                         ; desc[API_FE1A]: ->$0960 ->$0914 $0908
  0931  AD9FFE1A       JSR [0xfe1a]                      
  0935  3510           PULS  X                           
  0937  39             RTS                               
  0938  .db 14 20 20 73 77 65 65 70 20 72 61 74 65 3A 20 78  ; .  sweep rate: x
  0948  .db 78 78 2E 78 78                                   ; xx.xx

; ---- function FUN_M77_r4_38000__094d
FUN_M77_r4_38000__094d:
  094d  3406           PSHS  B A                         
  094f  17FF9E         LBSR 0x08f0                       
  0952  C605           LDB #0x5                          
  0954  F76066         STB 0x6066                        
  0957  CC0032         LDD #0x32                         
  095a  FD60DC         STD 0x60dc                        
  095d  3506           PULS  A B                         
  095f  39             RTS                               

; ---- function FUN_M77_r4_38000__0960
FUN_M77_r4_38000__0960:
  0960  3476           PSHS  U Y X B A                   
  0962  8E08CA         LDX #0x8ca                        
  0965  AD9FFE76       JSR [0xfe76]                      
  0969  FC702C         LDD 0x702c                        
  096c  3606           PSHU  B A                         
  096e  AD9FFEC8       JSR [0xfec8]                      
  0972  3706           PULU  A B                         
  0974  FD70C2         STD 0x70c2                        
  0977  3626           PSHU  Y B A                       
  0979  108E0028       LDY #0x28                         
  097d  FC70C2         LDD 0x70c2                        
  0980  AD9FFD2E       JSR [0xfd2e]                      
  0984  3726           PULU  A B Y                       
  0986  3576           PULS  A B X Y U                   
  0988  39             RTS                               
PTR_FUN_M77_r4_38000__0a0c_M77_r4_38000__0989:
  0989  0A0C           addr M77_r4_38000::0a0c           
  098b  09D3           addr M77_r4_38000::09d3           
  098d  .db 09 C7 70 30 70 32 00 00 70 34 00 08 00 6F 03 00  ; ..p0p2..p4...o..
  099d  .db 00 00 64 00 01 00 03 25 09 F7 00 00 00 00 70 36  ; ..d....%......p6
  09ad  .db 00 91                                            ; ..

; ---- function FUN_M77_r4_38000__09af
FUN_M77_r4_38000__09af:
  09af  3410           PSHS  X                           
  09b1  8E0989         LDX #0x989                         ; desc[API_FE6A]: ->$0A0C ->$09D3
  09b4  AD9FFE6A       JSR [0xfe6a]                      
  09b8  3510           PULS  X                           
  09ba  39             RTS                               

; ---- function FUN_M77_r4_38000__09bb
FUN_M77_r4_38000__09bb:
  09bb  3410           PSHS  X                           
  09bd  8E0989         LDX #0x989                         ; desc[API_FDBC]: ->$0A0C ->$09D3
  09c0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  09c4  3510           PULS  X                           
  09c6  39             RTS                               

; ---- function FUN_M77_r4_38000__09c7
FUN_M77_r4_38000__09c7:
  09c7  3410           PSHS  X                           
  09c9  8E0989         LDX #0x989                         ; desc[API_FE6C]: ->$0A0C ->$09D3
  09cc  AD9FFE6C       JSR [0xfe6c]                      
  09d0  3510           PULS  X                           
  09d2  39             RTS                               

; ---- function FUN_M77_r4_38000__09d3
FUN_M77_r4_38000__09d3:
  09d3  3410           PSHS  X                           
  09d5  8E0989         LDX #0x989                         ; desc[API_FE6E]: ->$0A0C ->$09D3
  09d8  AD9FFE6E       JSR [0xfe6e]                      
  09dc  3510           PULS  X                           
  09de  39             RTS                               

; ---- function FUN_M77_r4_38000__09df
FUN_M77_r4_38000__09df:
  09df  3410           PSHS  X                           
  09e1  8E0989         LDX #0x989                         ; desc[API_FE1C]: ->$0A0C ->$09D3
  09e4  AD9FFE1C       JSR [0xfe1c]                      
  09e8  3510           PULS  X                           
  09ea  39             RTS                               

; ---- function FUN_M77_r4_38000__09eb
FUN_M77_r4_38000__09eb:
  09eb  3410           PSHS  X                           
  09ed  8E0989         LDX #0x989                         ; desc[API_FE1A]: ->$0A0C ->$09D3 $09C7
  09f0  AD9FFE1A       JSR [0xfe1a]                      
  09f4  3510           PULS  X                           
  09f6  39             RTS                               
  09f7  .db 14 20 65 6E 76 20 64 65 63 61 79 20 72 61 74 65  ; . env decay rate
  0a07  .db 3A 20 78 78 78                                   ; : xxx

; ---- function FUN_M77_r4_38000__0a0c
FUN_M77_r4_38000__0a0c:
  0a0c  3476           PSHS  U Y X B A                   
  0a0e  8E0989         LDX #0x989                        
  0a11  AD9FFE76       JSR [0xfe76]                      
  0a15  FC7034         LDD 0x7034                        
  0a18  3606           PSHU  B A                         
  0a1a  AD9FFEC4       JSR [0xfec4]                      
  0a1e  3706           PULU  A B                         
  0a20  3606           PSHU  B A                         
  0a22  3606           PSHU  B A                         
  0a24  AD9FFCF2       JSR [0xfcf2]                      
  0a28  3706           PULU  A B                         
  0a2a  FD70C2         STD 0x70c2                        
  0a2d  3626           PSHU  Y B A                       
  0a2f  108E002B       LDY #0x2b                         
  0a33  FC70C2         LDD 0x70c2                        
  0a36  AD9FFD2E       JSR [0xfd2e]                      
  0a3a  3726           PULU  A B Y                       
  0a3c  3576           PULS  A B X Y U                   
  0a3e  39             RTS                               
PTR_FUN_M77_r4_38000__0ac2_M77_r4_38000__0a3f:
  0a3f  0AC2           addr M77_r4_38000::0ac2           
  0a41  0A89           addr M77_r4_38000::0a89           
  0a43  .db 0A 7D 70 38 70 3A 00 00 70 3C 00 08 00 71 04 00  ; .}p8p:..p<...q..
  0a53  .db 00 03 E8 00 01 01 05 21 0A AD 00 00 00 00 70 3E  ; .......!......p>
  0a63  .db 00 93                                            ; ..

; ---- function FUN_M77_r4_38000__0a65
FUN_M77_r4_38000__0a65:
  0a65  3410           PSHS  X                           
  0a67  8E0A3F         LDX #0xa3f                         ; desc[API_FE6A]: ->$0AC2 ->$0A89
  0a6a  AD9FFE6A       JSR [0xfe6a]                      
  0a6e  3510           PULS  X                           
  0a70  39             RTS                               

; ---- function FUN_M77_r4_38000__0a71
FUN_M77_r4_38000__0a71:
  0a71  3410           PSHS  X                           
  0a73  8E0A3F         LDX #0xa3f                         ; desc[API_FDBC]: ->$0AC2 ->$0A89
  0a76  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...?"
  0a7a  3510           PULS  X                           
  0a7c  39             RTS                               

; ---- function FUN_M77_r4_38000__0a7d
FUN_M77_r4_38000__0a7d:
  0a7d  3410           PSHS  X                           
  0a7f  8E0A3F         LDX #0xa3f                         ; desc[API_FE6C]: ->$0AC2 ->$0A89
  0a82  AD9FFE6C       JSR [0xfe6c]                      
  0a86  3510           PULS  X                           
  0a88  39             RTS                               

; ---- function FUN_M77_r4_38000__0a89
FUN_M77_r4_38000__0a89:
  0a89  3410           PSHS  X                           
  0a8b  8E0A3F         LDX #0xa3f                         ; desc[API_FE6E]: ->$0AC2 ->$0A89
  0a8e  AD9FFE6E       JSR [0xfe6e]                      
  0a92  3510           PULS  X                           
  0a94  39             RTS                               

; ---- function FUN_M77_r4_38000__0a95
FUN_M77_r4_38000__0a95:
  0a95  3410           PSHS  X                           
  0a97  8E0A3F         LDX #0xa3f                         ; desc[API_FE1C]: ->$0AC2 ->$0A89
  0a9a  AD9FFE1C       JSR [0xfe1c]                      
  0a9e  3510           PULS  X                           
  0aa0  39             RTS                               

; ---- function FUN_M77_r4_38000__0aa1
FUN_M77_r4_38000__0aa1:
  0aa1  3410           PSHS  X                           
  0aa3  8E0A3F         LDX #0xa3f                         ; desc[API_FE1A]: ->$0AC2 ->$0A89 $0A7D
  0aa6  AD9FFE1A       JSR [0xfe1a]                      
  0aaa  3510           PULS  X                           
  0aac  39             RTS                               
  0aad  .db 14 20 41 44 53 52 20 72 61 74 65 3A 20 20 78 78  ; . ADSR rate:  xx
  0abd  .db 78 2E 78 20 25                                   ; x.x %

; ---- function FUN_M77_r4_38000__0ac2
FUN_M77_r4_38000__0ac2:
  0ac2  3476           PSHS  U Y X B A                   
  0ac4  8E0A3F         LDX #0xa3f                        
  0ac7  AD9FFE76       JSR [0xfe76]                      
  0acb  FC703C         LDD 0x703c                        
  0ace  3606           PSHU  B A                         
  0ad0  AD9FFEC6       JSR [0xfec6]                      
  0ad4  3706           PULU  A B                         
  0ad6  3606           PSHU  B A                         
  0ad8  3606           PSHU  B A                         
  0ada  3606           PSHU  B A                         
  0adc  FC7064         LDD 0x7064                        
  0adf  3606           PSHU  B A                         
  0ae1  AD9FFEC6       JSR [0xfec6]                      
  0ae5  AD9FFCF2       JSR [0xfcf2]                      
  0ae9  3706           PULU  A B                         
  0aeb  FD70C2         STD 0x70c2                        
  0aee  3626           PSHU  Y B A                       
  0af0  108E002E       LDY #0x2e                         
  0af4  FC70C2         LDD 0x70c2                        
  0af7  AD9FFD2E       JSR [0xfd2e]                      
  0afb  3726           PULU  A B Y                       
  0afd  FC706C         LDD 0x706c                        
  0b00  3606           PSHU  B A                         
  0b02  AD9FFEC6       JSR [0xfec6]                      
  0b06  AD9FFCF2       JSR [0xfcf2]                      
  0b0a  3706           PULU  A B                         
  0b0c  FD70C2         STD 0x70c2                        
  0b0f  3626           PSHU  Y B A                       
  0b11  108E002F       LDY #0x2f                         
  0b15  FC70C2         LDD 0x70c2                        
  0b18  AD9FFD2E       JSR [0xfd2e]                      
  0b1c  3726           PULU  A B Y                       
  0b1e  FC707C         LDD 0x707c                        
  0b21  3606           PSHU  B A                         
  0b23  AD9FFEC6       JSR [0xfec6]                      
  0b27  AD9FFCF2       JSR [0xfcf2]                      
  0b2b  3706           PULU  A B                         
  0b2d  FD70C2         STD 0x70c2                        
  0b30  3626           PSHU  Y B A                       
  0b32  108E0031       LDY #0x31                         
  0b36  FC70C2         LDD 0x70c2                        
  0b39  AD9FFD2E       JSR [0xfd2e]                      
  0b3d  3726           PULU  A B Y                       
  0b3f  3576           PULS  A B X Y U                   
  0b41  39             RTS                               
  0b42  0BB00B8C0B80   addr[3]                           
  0b48  .db 70 40 70 42 00 00 70 44 00 08 00 73 05 00 00 00  ; p@pB..pD...s....
  0b58  .db 02 00 01 00 05 23 0B 9B 00 00 0B CB 00 00 00 00  ; .....#..........

; ---- function FUN_M77_r4_38000__0b68
FUN_M77_r4_38000__0b68:
  0b68  3410           PSHS  X                           
  0b6a  8E0B42         LDX #0xb42                        
  0b6d  AD9FFC4E       JSR [0xfc4e]                      
  0b71  3510           PULS  X                           
  0b73  39             RTS                               

; ---- function FUN_M77_r4_38000__0b74
FUN_M77_r4_38000__0b74:
  0b74  3410           PSHS  X                           
  0b76  8E0B42         LDX #0xb42                        
  0b79  AD9FFC4C       JSR [0xfc4c]                      
  0b7d  3510           PULS  X                           
  0b7f  39             RTS                               

; ---- function FUN_M77_r4_38000__0b80
FUN_M77_r4_38000__0b80:
  0b80  3410           PSHS  X                           
  0b82  8E0B42         LDX #0xb42                        
  0b85  AD9FFC50       JSR [0xfc50]                      
  0b89  3510           PULS  X                           
  0b8b  39             RTS                               

; ---- function FUN_M77_r4_38000__0b8c
FUN_M77_r4_38000__0b8c:
  0b8c  3410           PSHS  X                           
  0b8e  8E0B42         LDX #0xb42                        
  0b91  AD9FFC52       JSR [0xfc52]                      
  0b95  1709BC         LBSR 0x1554                       
  0b98  3510           PULS  X                           
  0b9a  39             RTS                               
  0b9b  .db 14 20 70 68 61 73 65 72 20 6D 6F 64 65 3A 20 20  ; . phaser mode:  
  0bab  .db 2E 2E 2E 2E 2E                                   ; .....

; ---- function FUN_M77_r4_38000__0bb0
FUN_M77_r4_38000__0bb0:
  0bb0  3476           PSHS  U Y X B A                   
  0bb2  8E0B42         LDX #0xb42                        
  0bb5  AD9FFE76       JSR [0xfe76]                      
  0bb9  3626           PSHU  Y B A                       
  0bbb  108E0023       LDY #0x23                         
  0bbf  FC7044         LDD 0x7044                        
  0bc2  AD9FFD2E       JSR [0xfd2e]                      
  0bc6  3726           PULU  A B Y                       
  0bc8  3576           PULS  A B X Y U                   
  0bca  39             RTS                               
  0bcb  .db 73 77 65 65 70 65 6E 76 20 20 61 64 73 72 20     ; sweepenv  adsr 
PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0bda:
  0bda  0CE1           addr M77_r4_38000::0ce1           
  0bdc  0C24           addr M77_r4_38000::0c24           
  0bde  .db 0C 18 70 A0 70 A2 00 00 70 A4 00 08 00 83 06 00  ; ..p.p...p.......
  0bee  .db 00 03 E8 00 01 01 06 22 0C 48 00 00 00 00 70 A6  ; .......".H....p.
  0bfe  .db 00 97                                            ; ..

; ---- function FUN_M77_r4_38000__0c00
FUN_M77_r4_38000__0c00:
  0c00  3410           PSHS  X                           
  0c02  8E0BDA         LDX #0xbda                         ; desc[API_FE6A]: ->$0CE1 ->$0C24
  0c05  AD9FFE6A       JSR [0xfe6a]                      
  0c09  3510           PULS  X                           
  0c0b  39             RTS                               

; ---- function FUN_M77_r4_38000__0c0c
FUN_M77_r4_38000__0c0c:
  0c0c  3410           PSHS  X                           
  0c0e  8E0BDA         LDX #0xbda                         ; desc[API_FDBC]: ->$0CE1 ->$0C24
  0c11  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0c15  3510           PULS  X                           
  0c17  39             RTS                               

; ---- function FUN_M77_r4_38000__0c18
FUN_M77_r4_38000__0c18:
  0c18  3410           PSHS  X                           
  0c1a  8E0BDA         LDX #0xbda                         ; desc[API_FE6C]: ->$0CE1 ->$0C24
  0c1d  AD9FFE6C       JSR [0xfe6c]                      
  0c21  3510           PULS  X                           
  0c23  39             RTS                               

; ---- function FUN_M77_r4_38000__0c24
FUN_M77_r4_38000__0c24:
  0c24  3410           PSHS  X                           
  0c26  8E0BDA         LDX #0xbda                         ; desc[API_FE6E]: ->$0CE1 ->$0C24
  0c29  AD9FFE6E       JSR [0xfe6e]                      
  0c2d  3510           PULS  X                           
  0c2f  39             RTS                               

; ---- function FUN_M77_r4_38000__0c30
FUN_M77_r4_38000__0c30:
  0c30  3410           PSHS  X                           
  0c32  8E0BDA         LDX #0xbda                         ; desc[API_FE1C]: ->$0CE1 ->$0C24
  0c35  AD9FFE1C       JSR [0xfe1c]                      
  0c39  3510           PULS  X                           
  0c3b  39             RTS                               

; ---- function FUN_M77_r4_38000__0c3c
FUN_M77_r4_38000__0c3c:
  0c3c  3410           PSHS  X                           
  0c3e  8E0BDA         LDX #0xbda                         ; desc[API_FE1A]: ->$0CE1 ->$0C24 $0C18
  0c41  AD9FFE1A       JSR [0xfe1a]                      
  0c45  3510           PULS  X                           
  0c47  39             RTS                               
  0c48  .db 14 53 77 65 65 70 20 62 6F 74 74 6F 6D 3A 20 20  ; .Sweep bottom:  
  0c58  .db 78 78 78 2E 78 78                                ; xxx.xx
PTR_FUN_M77_r4_38000__0ce1_M77_r4_38000__0c5e:
  0c5e  0CE1           addr M77_r4_38000::0ce1           
  0c60  0CA8           addr M77_r4_38000::0ca8           
  0c62  .db 0C 9C 70 98 70 9A 00 00 70 9C 00 08 00 81 07 00  ; ..p.p...p.......
  0c72  .db 00 03 E8 00 01 01 06 22 0C CC 00 00 00 00 70 9E  ; ......."......p.
  0c82  .db 00 95                                            ; ..

; ---- function FUN_M77_r4_38000__0c84
FUN_M77_r4_38000__0c84:
  0c84  3410           PSHS  X                           
  0c86  8E0C5E         LDX #0xc5e                         ; desc[API_FE6A]: ->$0CE1 ->$0CA8
  0c89  AD9FFE6A       JSR [0xfe6a]                      
  0c8d  3510           PULS  X                           
  0c8f  39             RTS                               

; ---- function FUN_M77_r4_38000__0c90
FUN_M77_r4_38000__0c90:
  0c90  3410           PSHS  X                           
  0c92  8E0C5E         LDX #0xc5e                         ; desc[API_FDBC]: ->$0CE1 ->$0CA8
  0c95  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...^"
  0c99  3510           PULS  X                           
  0c9b  39             RTS                               

; ---- function FUN_M77_r4_38000__0c9c
FUN_M77_r4_38000__0c9c:
  0c9c  3410           PSHS  X                           
  0c9e  8E0C5E         LDX #0xc5e                         ; desc[API_FE6C]: ->$0CE1 ->$0CA8
  0ca1  AD9FFE6C       JSR [0xfe6c]                      
  0ca5  3510           PULS  X                           
  0ca7  39             RTS                               

; ---- function FUN_M77_r4_38000__0ca8
FUN_M77_r4_38000__0ca8:
  0ca8  3410           PSHS  X                           
  0caa  8E0C5E         LDX #0xc5e                         ; desc[API_FE6E]: ->$0CE1 ->$0CA8
  0cad  AD9FFE6E       JSR [0xfe6e]                      
  0cb1  3510           PULS  X                           
  0cb3  39             RTS                               

; ---- function FUN_M77_r4_38000__0cb4
FUN_M77_r4_38000__0cb4:
  0cb4  3410           PSHS  X                           
  0cb6  8E0C5E         LDX #0xc5e                         ; desc[API_FE1C]: ->$0CE1 ->$0CA8
  0cb9  AD9FFE1C       JSR [0xfe1c]                      
  0cbd  3510           PULS  X                           
  0cbf  39             RTS                               

; ---- function FUN_M77_r4_38000__0cc0
FUN_M77_r4_38000__0cc0:
  0cc0  3410           PSHS  X                           
  0cc2  8E0C5E         LDX #0xc5e                         ; desc[API_FE1A]: ->$0CE1 ->$0CA8 $0C9C
  0cc5  AD9FFE1A       JSR [0xfe1a]                      
  0cc9  3510           PULS  X                           
  0ccb  39             RTS                               
  0ccc  .db 14 53 77 65 65 70 20 74 6F 70 3A 20 20 20 20 78  ; .Sweep top:    x
  0cdc  .db 78 78 2E 78 78                                   ; xx.xx

; ---- function FUN_M77_r4_38000__0ce1
FUN_M77_r4_38000__0ce1:
  0ce1  3476           PSHS  U Y X B A                   
  0ce3  8E0BDA         LDX #0xbda                        
  0ce6  AD9FFE76       JSR [0xfe76]                      
  0cea  8E0C5E         LDX #0xc5e                        
  0ced  AD9FFE76       JSR [0xfe76]                      
  0cf1  FC70A4         LDD 0x70a4                        
  0cf4  3606           PSHU  B A                         
  0cf6  AD9FFEC6       JSR [0xfec6]                      
  0cfa  3706           PULU  A B                         
  0cfc  3606           PSHU  B A                         
  0cfe  3606           PSHU  B A                         
  0d00  3606           PSHU  B A                         
  0d02  170A6C         LBSR 0x1771                       
  0d05  3706           PULU  A B                         
  0d07  FD70B0         STD 0x70b0                        
  0d0a  170C6C         LBSR 0x1979                       
  0d0d  3706           PULU  A B                         
  0d0f  FD70B2         STD 0x70b2                        
  0d12  170E6C         LBSR 0x1b81                       
  0d15  3706           PULU  A B                         
  0d17  FD70B4         STD 0x70b4                        
  0d1a  FC709C         LDD 0x709c                        
  0d1d  3606           PSHU  B A                         
  0d1f  AD9FFEC6       JSR [0xfec6]                      
  0d23  3706           PULU  A B                         
  0d25  3606           PSHU  B A                         
  0d27  3606           PSHU  B A                         
  0d29  3606           PSHU  B A                         
  0d2b  170A43         LBSR 0x1771                       
  0d2e  3706           PULU  A B                         
  0d30  FD70B6         STD 0x70b6                        
  0d33  170C43         LBSR 0x1979                       
  0d36  3706           PULU  A B                         
  0d38  FD70B8         STD 0x70b8                        
  0d3b  170E43         LBSR 0x1b81                       
  0d3e  3706           PULU  A B                         
  0d40  FD70BA         STD 0x70ba                        
  0d43  FC70A4         LDD 0x70a4                        
  0d46  B3709C         SUBD 0x709c                       
  0d49  2B02           BMI 0x0d4d                        
  0d4b  2003           BRA 0x0d50                        
LAB_M77_r4_38000__0d4d:
  0d4d  7E0D53         JMP 0xd53                         
LAB_M77_r4_38000__0d50:
  0d50  7E0DDA         JMP 0xdda                         

; ---- function FUN_M77_r4_38000__0d53
FUN_M77_r4_38000__0d53:
  0d53  FC70B0         LDD 0x70b0                        
  0d56  B370B6         SUBD 0x70b6                       
  0d59  FD70BC         STD 0x70bc                        
  0d5c  FC70B2         LDD 0x70b2                        
  0d5f  B370B8         SUBD 0x70b8                       
  0d62  FD70BE         STD 0x70be                        
  0d65  FC70B4         LDD 0x70b4                        
  0d68  B370BA         SUBD 0x70ba                       
  0d6b  FD70C0         STD 0x70c0                        
  0d6e  3626           PSHU  Y B A                       
  0d70  108E006E       LDY #0x6e                         
  0d74  FC70B6         LDD 0x70b6                        
  0d77  AD9FFD2E       JSR [0xfd2e]                      
  0d7b  3726           PULU  A B Y                       
  0d7d  3626           PSHU  Y B A                       
  0d7f  108E006F       LDY #0x6f                         
  0d83  FC70B8         LDD 0x70b8                        
  0d86  AD9FFD2E       JSR [0xfd2e]                      
  0d8a  3726           PULU  A B Y                       
  0d8c  3626           PSHU  Y B A                       
  0d8e  108E0070       LDY #0x70                         
  0d92  FC70BA         LDD 0x70ba                        
  0d95  AD9FFD2E       JSR [0xfd2e]                      
  0d99  3726           PULU  A B Y                       
  0d9b  3626           PSHU  Y B A                       
  0d9d  108E0071       LDY #0x71                         
  0da1  FC70BC         LDD 0x70bc                        
  0da4  AD9FFD2E       JSR [0xfd2e]                      
  0da8  3726           PULU  A B Y                       
  0daa  3626           PSHU  Y B A                       
  0dac  108E0072       LDY #0x72                         
  0db0  FC70BE         LDD 0x70be                        
  0db3  AD9FFD2E       JSR [0xfd2e]                      
  0db7  3726           PULU  A B Y                       
  0db9  3626           PSHU  Y B A                       
  0dbb  108E0073       LDY #0x73                         
  0dbf  FC70C0         LDD 0x70c0                        
  0dc2  AD9FFD2E       JSR [0xfd2e]                      
  0dc6  3726           PULU  A B Y                       
  0dc8  3626           PSHU  Y B A                       
  0dca  108E007E       LDY #0x7e                         
  0dce  CC000A         LDD #0xa                          
  0dd1  AD9FFD2E       JSR [0xfd2e]                      
  0dd5  3726           PULU  A B Y                       
  0dd7  7E0E92         JMP 0xe92                         

; ---- function FUN_M77_r4_38000__0dda
FUN_M77_r4_38000__0dda:
  0dda  FC70B6         LDD 0x70b6                        
  0ddd  B370B0         SUBD 0x70b0                       
  0de0  FD70BC         STD 0x70bc                        
  0de3  FC70B8         LDD 0x70b8                        
  0de6  B370B2         SUBD 0x70b2                       
  0de9  FD70BE         STD 0x70be                        
  0dec  FC70BA         LDD 0x70ba                        
  0def  B370B4         SUBD 0x70b4                       
  0df2  FD70C0         STD 0x70c0                        
  0df5  3626           PSHU  Y B A                       
  0df7  108E006E       LDY #0x6e                         
  0dfb  FC70B0         LDD 0x70b0                        
  0dfe  AD9FFD2E       JSR [0xfd2e]                      
  0e02  3726           PULU  A B Y                       
  0e04  3626           PSHU  Y B A                       
  0e06  108E006F       LDY #0x6f                         
  0e0a  FC70B2         LDD 0x70b2                        
  0e0d  AD9FFD2E       JSR [0xfd2e]                      
  0e11  3726           PULU  A B Y                       
  0e13  3626           PSHU  Y B A                       
  0e15  108E0070       LDY #0x70                         
  0e19  FC70B4         LDD 0x70b4                        
  0e1c  AD9FFD2E       JSR [0xfd2e]                      
  0e20  3726           PULU  A B Y                       
  0e22  3626           PSHU  Y B A                       
  0e24  108E0071       LDY #0x71                         
  0e28  FC70BC         LDD 0x70bc                        
  0e2b  AD9FFD2E       JSR [0xfd2e]                      
  0e2f  3726           PULU  A B Y                       
  0e31  3626           PSHU  Y B A                       
  0e33  108E0072       LDY #0x72                         
  0e37  FC70BE         LDD 0x70be                        
  0e3a  AD9FFD2E       JSR [0xfd2e]                      
  0e3e  3726           PULU  A B Y                       
  0e40  3626           PSHU  Y B A                       
  0e42  108E0073       LDY #0x73                         
  0e46  FC70C0         LDD 0x70c0                        
  0e49  AD9FFD2E       JSR [0xfd2e]                      
  0e4d  3726           PULU  A B Y                       
  0e4f  FC7044         LDD 0x7044                        
  0e52  10830001       CMPD #0x1                         
  0e56  2B04           BMI 0x0e5c                        
  0e58  2714           BEQ 0x0e6e                        
  0e5a  2024           BRA 0x0e80                        
LAB_M77_r4_38000__0e5c:
  0e5c  3626           PSHU  Y B A                       
  0e5e  108E007E       LDY #0x7e                         
  0e62  CC0016         LDD #0x16                         
  0e65  AD9FFD2E       JSR [0xfd2e]                      
  0e69  3726           PULU  A B Y                       
  0e6b  7E0E92         JMP 0xe92                         
LAB_M77_r4_38000__0e6e:
  0e6e  3626           PSHU  Y B A                       
  0e70  108E007E       LDY #0x7e                         
  0e74  CC001A         LDD #0x1a                         
  0e77  AD9FFD2E       JSR [0xfd2e]                      
  0e7b  3726           PULU  A B Y                       
  0e7d  7E0E92         JMP 0xe92                         
LAB_M77_r4_38000__0e80:
  0e80  3626           PSHU  Y B A                       
  0e82  108E007E       LDY #0x7e                         
  0e86  CC001C         LDD #0x1c                         
  0e89  AD9FFD2E       JSR [0xfd2e]                      
  0e8d  3726           PULU  A B Y                       
  0e8f  7E0E92         JMP 0xe92                         

; ---- function FUN_M77_r4_38000__0e92
FUN_M77_r4_38000__0e92:
  0e92  3576           PULS  A B X Y U                   
  0e94  39             RTS                               
PTR_FUN_M77_r4_38000__0f2b_M77_r4_38000__0e95:
  0e95  0F2B           addr M77_r4_38000::0f2b           
  0e97  0EDF           addr M77_r4_38000::0edf           
  0e99  .db 0E D3 70 60 70 62 00 00 70 64 00 08 00 75 08 00  ; ..p`pb..pd...u..
  0ea9  .db 00 27 10 00 01 02 06 22 0F 03 00 00 00 00 70 66  ; .'....."......pf
  0eb9  .db 00 99                                            ; ..

; ---- function FUN_M77_r4_38000__0ebb
FUN_M77_r4_38000__0ebb:
  0ebb  3410           PSHS  X                           
  0ebd  8E0E95         LDX #0xe95                         ; desc[API_FE6A]: ->$0F2B ->$0EDF
  0ec0  AD9FFE6A       JSR [0xfe6a]                      
  0ec4  3510           PULS  X                           
  0ec6  39             RTS                               

; ---- function FUN_M77_r4_38000__0ec7
FUN_M77_r4_38000__0ec7:
  0ec7  3410           PSHS  X                           
  0ec9  8E0E95         LDX #0xe95                         ; desc[API_FDBC]: ->$0F2B ->$0EDF
  0ecc  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0ed0  3510           PULS  X                           
  0ed2  39             RTS                               

; ---- function FUN_M77_r4_38000__0ed3
FUN_M77_r4_38000__0ed3:
  0ed3  3410           PSHS  X                           
  0ed5  8E0E95         LDX #0xe95                         ; desc[API_FE6C]: ->$0F2B ->$0EDF
  0ed8  AD9FFE6C       JSR [0xfe6c]                      
  0edc  3510           PULS  X                           
  0ede  39             RTS                               

; ---- function FUN_M77_r4_38000__0edf
FUN_M77_r4_38000__0edf:
  0edf  3410           PSHS  X                           
  0ee1  8E0E95         LDX #0xe95                         ; desc[API_FE6E]: ->$0F2B ->$0EDF
  0ee4  AD9FFE6E       JSR [0xfe6e]                      
  0ee8  3510           PULS  X                           
  0eea  39             RTS                               

; ---- function FUN_M77_r4_38000__0eeb
FUN_M77_r4_38000__0eeb:
  0eeb  3410           PSHS  X                           
  0eed  8E0E95         LDX #0xe95                         ; desc[API_FE1C]: ->$0F2B ->$0EDF
  0ef0  AD9FFE1C       JSR [0xfe1c]                      
  0ef4  3510           PULS  X                           
  0ef6  39             RTS                               

; ---- function FUN_M77_r4_38000__0ef7
FUN_M77_r4_38000__0ef7:
  0ef7  3410           PSHS  X                           
  0ef9  8E0E95         LDX #0xe95                         ; desc[API_FE1A]: ->$0F2B ->$0EDF $0ED3
  0efc  AD9FFE1A       JSR [0xfe1a]                      
  0f00  3510           PULS  X                           
  0f02  39             RTS                               
  0f03  .db 14 41 44 53 52 20 61 74 74 20 72 61 74 65 20 78  ; .ADSR att rate x
  0f13  .db 78 78 2E 78 78                                   ; xx.xx

; ---- function FUN_M77_r4_38000__0f18
FUN_M77_r4_38000__0f18:
  0f18  3406           PSHS  B A                         
  0f1a  17FF9E         LBSR 0x0ebb                       
  0f1d  C605           LDB #0x5                          
  0f1f  F76066         STB 0x6066                        
  0f22  CC0064         LDD #0x64                         
  0f25  FD60DC         STD 0x60dc                        
  0f28  3506           PULS  A B                         
  0f2a  39             RTS                               

; ---- function FUN_M77_r4_38000__0f2b
FUN_M77_r4_38000__0f2b:
  0f2b  3476           PSHS  U Y X B A                   
  0f2d  8E0E95         LDX #0xe95                        
  0f30  AD9FFE76       JSR [0xfe76]                      
  0f34  FC7064         LDD 0x7064                        
  0f37  3606           PSHU  B A                         
  0f39  AD9FFEC8       JSR [0xfec8]                      
  0f3d  FC703C         LDD 0x703c                        
  0f40  3606           PSHU  B A                         
  0f42  AD9FFEC6       JSR [0xfec6]                      
  0f46  AD9FFCF2       JSR [0xfcf2]                      
  0f4a  3706           PULU  A B                         
  0f4c  FD70C2         STD 0x70c2                        
  0f4f  3626           PSHU  Y B A                       
  0f51  108E002E       LDY #0x2e                         
  0f55  FC70C2         LDD 0x70c2                        
  0f58  AD9FFD2E       JSR [0xfd2e]                      
  0f5c  3726           PULU  A B Y                       
  0f5e  3576           PULS  A B X Y U                   
  0f60  39             RTS                               
PTR_FUN_M77_r4_38000__0ff7_M77_r4_38000__0f61:
  0f61  0FF7           addr M77_r4_38000::0ff7           
  0f63  0FAB           addr M77_r4_38000::0fab           
  0f65  .db 0F 9F 70 68 70 6A 00 00 70 6C 00 08 00 77 09 00  ; ..phpj..pl...w..
  0f75  .db 00 27 10 00 01 02 06 22 0F CF 00 00 00 00 70 6E  ; .'....."......pn
  0f85  .db 00 9B                                            ; ..

; ---- function FUN_M77_r4_38000__0f87
FUN_M77_r4_38000__0f87:
  0f87  3410           PSHS  X                           
  0f89  8E0F61         LDX #0xf61                         ; desc[API_FE6A]: ->$0FF7 ->$0FAB
  0f8c  AD9FFE6A       JSR [0xfe6a]                      
  0f90  3510           PULS  X                           
  0f92  39             RTS                               

; ---- function FUN_M77_r4_38000__0f93
FUN_M77_r4_38000__0f93:
  0f93  3410           PSHS  X                           
  0f95  8E0F61         LDX #0xf61                         ; desc[API_FDBC]: ->$0FF7 ->$0FAB
  0f98  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...a"
  0f9c  3510           PULS  X                           
  0f9e  39             RTS                               

; ---- function FUN_M77_r4_38000__0f9f
FUN_M77_r4_38000__0f9f:
  0f9f  3410           PSHS  X                           
  0fa1  8E0F61         LDX #0xf61                         ; desc[API_FE6C]: ->$0FF7 ->$0FAB
  0fa4  AD9FFE6C       JSR [0xfe6c]                      
  0fa8  3510           PULS  X                           
  0faa  39             RTS                               

; ---- function FUN_M77_r4_38000__0fab
FUN_M77_r4_38000__0fab:
  0fab  3410           PSHS  X                           
  0fad  8E0F61         LDX #0xf61                         ; desc[API_FE6E]: ->$0FF7 ->$0FAB
  0fb0  AD9FFE6E       JSR [0xfe6e]                      
  0fb4  3510           PULS  X                           
  0fb6  39             RTS                               

; ---- function FUN_M77_r4_38000__0fb7
FUN_M77_r4_38000__0fb7:
  0fb7  3410           PSHS  X                           
  0fb9  8E0F61         LDX #0xf61                         ; desc[API_FE1C]: ->$0FF7 ->$0FAB
  0fbc  AD9FFE1C       JSR [0xfe1c]                      
  0fc0  3510           PULS  X                           
  0fc2  39             RTS                               

; ---- function FUN_M77_r4_38000__0fc3
FUN_M77_r4_38000__0fc3:
  0fc3  3410           PSHS  X                           
  0fc5  8E0F61         LDX #0xf61                         ; desc[API_FE1A]: ->$0FF7 ->$0FAB $0F9F
  0fc8  AD9FFE1A       JSR [0xfe1a]                      
  0fcc  3510           PULS  X                           
  0fce  39             RTS                               
  0fcf  .db 14 41 44 53 52 20 64 65 63 20 72 61 74 65 20 78  ; .ADSR dec rate x
  0fdf  .db 78 78 2E 78 78                                   ; xx.xx

; ---- function FUN_M77_r4_38000__0fe4
FUN_M77_r4_38000__0fe4:
  0fe4  3406           PSHS  B A                         
  0fe6  17FF9E         LBSR 0x0f87                       
  0fe9  C605           LDB #0x5                          
  0feb  F76066         STB 0x6066                        
  0fee  CC0064         LDD #0x64                         
  0ff1  FD60DC         STD 0x60dc                        
  0ff4  3506           PULS  A B                         
  0ff6  39             RTS                               

; ---- function FUN_M77_r4_38000__0ff7
FUN_M77_r4_38000__0ff7:
  0ff7  3476           PSHS  U Y X B A                   
  0ff9  8E0F61         LDX #0xf61                        
  0ffc  AD9FFE76       JSR [0xfe76]                      
  1000  FC706C         LDD 0x706c                        
  1003  3606           PSHU  B A                         
  1005  AD9FFEC8       JSR [0xfec8]                      
  1009  FC703C         LDD 0x703c                        
  100c  3606           PSHU  B A                         
  100e  AD9FFEC6       JSR [0xfec6]                      
  1012  AD9FFCF2       JSR [0xfcf2]                      
  1016  3706           PULU  A B                         
  1018  FD70C2         STD 0x70c2                        
  101b  3626           PSHU  Y B A                       
  101d  108E002F       LDY #0x2f                         
  1021  FC70C2         LDD 0x70c2                        
  1024  AD9FFD2E       JSR [0xfd2e]                      
  1028  3726           PULU  A B Y                       
  102a  3576           PULS  A B X Y U                   
  102c  39             RTS                               
PTR_FUN_M77_r4_38000__10b0_M77_r4_38000__102d:
  102d  10B0           addr M77_r4_38000::10b0           
  102f  1077           addr M77_r4_38000::1077           
  1031  .db 10 6B 70 70 70 72 00 00 70 74 00 08 00 79 0A 00  ; .kpppr..pt...y..
  1041  .db 00 03 E8 00 01 01 05 23 10 9B 00 00 00 00 70 76  ; .......#......pv
  1051  .db 00 9D                                            ; ..

; ---- function FUN_M77_r4_38000__1053
FUN_M77_r4_38000__1053:
  1053  3410           PSHS  X                           
  1055  8E102D         LDX #0x102d                        ; desc[API_FE6A]: ->$10B0 ->$1077
  1058  AD9FFE6A       JSR [0xfe6a]                      
  105c  3510           PULS  X                           
  105e  39             RTS                               

; ---- function FUN_M77_r4_38000__105f
FUN_M77_r4_38000__105f:
  105f  3410           PSHS  X                           
  1061  8E102D         LDX #0x102d                        ; desc[API_FDBC]: ->$10B0 ->$1077
  1064  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...-"
  1068  3510           PULS  X                           
  106a  39             RTS                               

; ---- function FUN_M77_r4_38000__106b
FUN_M77_r4_38000__106b:
  106b  3410           PSHS  X                           
  106d  8E102D         LDX #0x102d                        ; desc[API_FE6C]: ->$10B0 ->$1077
  1070  AD9FFE6C       JSR [0xfe6c]                      
  1074  3510           PULS  X                           
  1076  39             RTS                               

; ---- function FUN_M77_r4_38000__1077
FUN_M77_r4_38000__1077:
  1077  3410           PSHS  X                           
  1079  8E102D         LDX #0x102d                        ; desc[API_FE6E]: ->$10B0 ->$1077
  107c  AD9FFE6E       JSR [0xfe6e]                      
  1080  3510           PULS  X                           
  1082  39             RTS                               

; ---- function FUN_M77_r4_38000__1083
FUN_M77_r4_38000__1083:
  1083  3410           PSHS  X                           
  1085  8E102D         LDX #0x102d                        ; desc[API_FE1C]: ->$10B0 ->$1077
  1088  AD9FFE1C       JSR [0xfe1c]                      
  108c  3510           PULS  X                           
  108e  39             RTS                               

; ---- function FUN_M77_r4_38000__108f
FUN_M77_r4_38000__108f:
  108f  3410           PSHS  X                           
  1091  8E102D         LDX #0x102d                        ; desc[API_FE1A]: ->$10B0 ->$1077 $106B
  1094  AD9FFE1A       JSR [0xfe1a]                      
  1098  3510           PULS  X                           
  109a  39             RTS                               
  109b  .db 14 41 44 53 52 20 73 75 73 20 6C 65 76 65 6C 20  ; .ADSR sus level 
  10ab  .db 78 78 78 2E 78                                   ; xxx.x

; ---- function FUN_M77_r4_38000__10b0
FUN_M77_r4_38000__10b0:
  10b0  3476           PSHS  U Y X B A                   
  10b2  8E102D         LDX #0x102d                       
  10b5  AD9FFE76       JSR [0xfe76]                      
  10b9  FC7074         LDD 0x7074                        
  10bc  3606           PSHU  B A                         
  10be  AD9FFEC6       JSR [0xfec6]                      
  10c2  3706           PULU  A B                         
  10c4  FD70C2         STD 0x70c2                        
  10c7  3626           PSHU  Y B A                       
  10c9  108E0030       LDY #0x30                         
  10cd  FC70C2         LDD 0x70c2                        
  10d0  AD9FFD2E       JSR [0xfd2e]                      
  10d4  3726           PULU  A B Y                       
  10d6  3576           PULS  A B X Y U                   
  10d8  39             RTS                               
PTR_FUN_M77_r4_38000__116f_M77_r4_38000__10d9:
  10d9  116F           addr M77_r4_38000::116f           
  10db  1123           addr M77_r4_38000::1123           
  10dd  .db 11 17 70 78 70 7A 00 00 70 7C 00 08 00 7B 0B 00  ; ..pxpz..p|...{..
  10ed  .db 00 27 10 00 01 02 06 22 11 47 00 00 00 00 70 7E  ; .'.....".G....p~
  10fd  .db 00 9F                                            ; ..

; ---- function FUN_M77_r4_38000__10ff
FUN_M77_r4_38000__10ff:
  10ff  3410           PSHS  X                           
  1101  8E10D9         LDX #0x10d9                        ; desc[API_FE6A]: ->$116F ->$1123
  1104  AD9FFE6A       JSR [0xfe6a]                      
  1108  3510           PULS  X                           
  110a  39             RTS                               

; ---- function FUN_M77_r4_38000__110b
FUN_M77_r4_38000__110b:
  110b  3410           PSHS  X                           
  110d  8E10D9         LDX #0x10d9                        ; desc[API_FDBC]: ->$116F ->$1123
  1110  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1114  3510           PULS  X                           
  1116  39             RTS                               

; ---- function FUN_M77_r4_38000__1117
FUN_M77_r4_38000__1117:
  1117  3410           PSHS  X                           
  1119  8E10D9         LDX #0x10d9                        ; desc[API_FE6C]: ->$116F ->$1123
  111c  AD9FFE6C       JSR [0xfe6c]                      
  1120  3510           PULS  X                           
  1122  39             RTS                               

; ---- function FUN_M77_r4_38000__1123
FUN_M77_r4_38000__1123:
  1123  3410           PSHS  X                           
  1125  8E10D9         LDX #0x10d9                        ; desc[API_FE6E]: ->$116F ->$1123
  1128  AD9FFE6E       JSR [0xfe6e]                      
  112c  3510           PULS  X                           
  112e  39             RTS                               

; ---- function FUN_M77_r4_38000__112f
FUN_M77_r4_38000__112f:
  112f  3410           PSHS  X                           
  1131  8E10D9         LDX #0x10d9                        ; desc[API_FE1C]: ->$116F ->$1123
  1134  AD9FFE1C       JSR [0xfe1c]                      
  1138  3510           PULS  X                           
  113a  39             RTS                               

; ---- function FUN_M77_r4_38000__113b
FUN_M77_r4_38000__113b:
  113b  3410           PSHS  X                           
  113d  8E10D9         LDX #0x10d9                        ; desc[API_FE1A]: ->$116F ->$1123 $1117
  1140  AD9FFE1A       JSR [0xfe1a]                      
  1144  3510           PULS  X                           
  1146  39             RTS                               
  1147  .db 14 41 44 53 52 20 72 65 6C 20 72 61 74 65 20 78  ; .ADSR rel rate x
  1157  .db 78 78 2E 78 78                                   ; xx.xx

; ---- function FUN_M77_r4_38000__115c
FUN_M77_r4_38000__115c:
  115c  3406           PSHS  B A                         
  115e  17FF9E         LBSR 0x10ff                       
  1161  C605           LDB #0x5                          
  1163  F76066         STB 0x6066                        
  1166  CC0064         LDD #0x64                         
  1169  FD60DC         STD 0x60dc                        
  116c  3506           PULS  A B                         
  116e  39             RTS                               

; ---- function FUN_M77_r4_38000__116f
FUN_M77_r4_38000__116f:
  116f  3476           PSHS  U Y X B A                   
  1171  8E10D9         LDX #0x10d9                       
  1174  AD9FFE76       JSR [0xfe76]                      
  1178  FC707C         LDD 0x707c                        
  117b  3606           PSHU  B A                         
  117d  AD9FFEC8       JSR [0xfec8]                      
  1181  FC703C         LDD 0x703c                        
  1184  3606           PSHU  B A                         
  1186  AD9FFEC6       JSR [0xfec6]                      
  118a  AD9FFCF2       JSR [0xfcf2]                      
  118e  3706           PULU  A B                         
  1190  FD70C2         STD 0x70c2                        
  1193  3626           PSHU  Y B A                       
  1195  108E0031       LDY #0x31                         
  1199  FC70C2         LDD 0x70c2                        
  119c  AD9FFD2E       JSR [0xfd2e]                      
  11a0  3726           PULU  A B Y                       
  11a2  3576           PULS  A B X Y U                   
  11a4  39             RTS                               
PTR_FUN_M77_r4_38000__1228_M77_r4_38000__11a5:
  11a5  1228           addr M77_r4_38000::1228           
  11a7  11EF           addr M77_r4_38000::11ef           
  11a9  .db 11 E3 70 80 70 82 00 00 70 84 00 08 00 7D 0C 00  ; ..p.p...p....}..
  11b9  .db 00 00 64 00 01 00 03 25 12 13 00 00 00 00 70 86  ; ..d....%......p.
  11c9  .db 00 A1                                            ; ..

; ---- function FUN_M77_r4_38000__11cb
FUN_M77_r4_38000__11cb:
  11cb  3410           PSHS  X                           
  11cd  8E11A5         LDX #0x11a5                        ; desc[API_FE6A]: ->$1228 ->$11EF
  11d0  AD9FFE6A       JSR [0xfe6a]                      
  11d4  3510           PULS  X                           
  11d6  39             RTS                               

; ---- function FUN_M77_r4_38000__11d7
FUN_M77_r4_38000__11d7:
  11d7  3410           PSHS  X                           
  11d9  8E11A5         LDX #0x11a5                        ; desc[API_FDBC]: ->$1228 ->$11EF
  11dc  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  11e0  3510           PULS  X                           
  11e2  39             RTS                               

; ---- function FUN_M77_r4_38000__11e3
FUN_M77_r4_38000__11e3:
  11e3  3410           PSHS  X                           
  11e5  8E11A5         LDX #0x11a5                        ; desc[API_FE6C]: ->$1228 ->$11EF
  11e8  AD9FFE6C       JSR [0xfe6c]                      
  11ec  3510           PULS  X                           
  11ee  39             RTS                               

; ---- function FUN_M77_r4_38000__11ef
FUN_M77_r4_38000__11ef:
  11ef  3410           PSHS  X                           
  11f1  8E11A5         LDX #0x11a5                        ; desc[API_FE6E]: ->$1228 ->$11EF
  11f4  AD9FFE6E       JSR [0xfe6e]                      
  11f8  3510           PULS  X                           
  11fa  39             RTS                               

; ---- function FUN_M77_r4_38000__11fb
FUN_M77_r4_38000__11fb:
  11fb  3410           PSHS  X                           
  11fd  8E11A5         LDX #0x11a5                        ; desc[API_FE1C]: ->$1228 ->$11EF
  1200  AD9FFE1C       JSR [0xfe1c]                      
  1204  3510           PULS  X                           
  1206  39             RTS                               

; ---- function FUN_M77_r4_38000__1207
FUN_M77_r4_38000__1207:
  1207  3410           PSHS  X                           
  1209  8E11A5         LDX #0x11a5                        ; desc[API_FE1A]: ->$1228 ->$11EF $11E3
  120c  AD9FFE1A       JSR [0xfe1a]                      
  1210  3510           PULS  X                           
  1212  39             RTS                               
  1213  .db 14 20 20 41 74 74 61 63 6B 20 74 68 72 65 73 68  ; .  Attack thresh
  1223  .db 3A 20 78 78 78                                   ; : xxx

; ---- function FUN_M77_r4_38000__1228
FUN_M77_r4_38000__1228:
  1228  3476           PSHS  U Y X B A                   
  122a  8E11A5         LDX #0x11a5                       
  122d  AD9FFE76       JSR [0xfe76]                      
  1231  FC7084         LDD 0x7084                        
  1234  3606           PSHU  B A                         
  1236  AD9FFEC4       JSR [0xfec4]                      
  123a  3706           PULU  A B                         
  123c  3606           PSHU  B A                         
  123e  3606           PSHU  B A                         
  1240  AD9FFCF2       JSR [0xfcf2]                      
  1244  3706           PULU  A B                         
  1246  FD70C2         STD 0x70c2                        
  1249  3626           PSHU  Y B A                       
  124b  108E0032       LDY #0x32                         
  124f  FC70C2         LDD 0x70c2                        
  1252  AD9FFD2E       JSR [0xfd2e]                      
  1256  3726           PULU  A B Y                       
  1258  3576           PULS  A B X Y U                   
  125a  39             RTS                               
PTR_FUN_M77_r4_38000__12de_M77_r4_38000__125b:
  125b  12DE           addr M77_r4_38000::12de           
  125d  12A5           addr M77_r4_38000::12a5           
  125f  .db 12 99 70 88 70 8A 00 00 70 8C 00 08 00 7F 0D 00  ; ..p.p...p.......
  126f  .db 00 00 64 00 01 00 03 25 12 C9 00 00 00 00 70 8E  ; ..d....%......p.
  127f  .db 00 A3                                            ; ..

; ---- function FUN_M77_r4_38000__1281
FUN_M77_r4_38000__1281:
  1281  3410           PSHS  X                           
  1283  8E125B         LDX #0x125b                        ; desc[API_FE6A]: ->$12DE ->$12A5
  1286  AD9FFE6A       JSR [0xfe6a]                      
  128a  3510           PULS  X                           
  128c  39             RTS                               

; ---- function FUN_M77_r4_38000__128d
FUN_M77_r4_38000__128d:
  128d  3410           PSHS  X                           
  128f  8E125B         LDX #0x125b                        ; desc[API_FDBC]: ->$12DE ->$12A5
  1292  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...["
  1296  3510           PULS  X                           
  1298  39             RTS                               

; ---- function FUN_M77_r4_38000__1299
FUN_M77_r4_38000__1299:
  1299  3410           PSHS  X                           
  129b  8E125B         LDX #0x125b                        ; desc[API_FE6C]: ->$12DE ->$12A5
  129e  AD9FFE6C       JSR [0xfe6c]                      
  12a2  3510           PULS  X                           
  12a4  39             RTS                               

; ---- function FUN_M77_r4_38000__12a5
FUN_M77_r4_38000__12a5:
  12a5  3410           PSHS  X                           
  12a7  8E125B         LDX #0x125b                        ; desc[API_FE6E]: ->$12DE ->$12A5
  12aa  AD9FFE6E       JSR [0xfe6e]                      
  12ae  3510           PULS  X                           
  12b0  39             RTS                               

; ---- function FUN_M77_r4_38000__12b1
FUN_M77_r4_38000__12b1:
  12b1  3410           PSHS  X                           
  12b3  8E125B         LDX #0x125b                        ; desc[API_FE1C]: ->$12DE ->$12A5
  12b6  AD9FFE1C       JSR [0xfe1c]                      
  12ba  3510           PULS  X                           
  12bc  39             RTS                               

; ---- function FUN_M77_r4_38000__12bd
FUN_M77_r4_38000__12bd:
  12bd  3410           PSHS  X                           
  12bf  8E125B         LDX #0x125b                        ; desc[API_FE1A]: ->$12DE ->$12A5 $1299
  12c2  AD9FFE1A       JSR [0xfe1a]                      
  12c6  3510           PULS  X                           
  12c8  39             RTS                               
  12c9  .db 14 20 52 65 6C 65 61 73 65 20 74 68 72 65 73 68  ; . Release thresh
  12d9  .db 3A 20 78 78 78                                   ; : xxx

; ---- function FUN_M77_r4_38000__12de
FUN_M77_r4_38000__12de:
  12de  3476           PSHS  U Y X B A                   
  12e0  8E125B         LDX #0x125b                       
  12e3  AD9FFE76       JSR [0xfe76]                      
  12e7  FC708C         LDD 0x708c                        
  12ea  3606           PSHU  B A                         
  12ec  AD9FFEC4       JSR [0xfec4]                      
  12f0  3706           PULU  A B                         
  12f2  3606           PSHU  B A                         
  12f4  3606           PSHU  B A                         
  12f6  AD9FFCF2       JSR [0xfcf2]                      
  12fa  3706           PULU  A B                         
  12fc  FD70C2         STD 0x70c2                        
  12ff  3626           PSHU  Y B A                       
  1301  108E0033       LDY #0x33                         
  1305  FC70C2         LDD 0x70c2                        
  1308  AD9FFD2E       JSR [0xfd2e]                      
  130c  3726           PULU  A B Y                       
  130e  3576           PULS  A B X Y U                   
  1310  39             RTS                               
  1311  .db 13 46 13 45 07 4B 00 00 00 00 00 00 00 00 00 00  ; .F.E.K..........
  1321  .db 00 00 0E 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  1331  .db 00 00 07 4B 07 4B 13 4B                          ; ...K.K.K

; ---- function FUN_M77_r4_38000__1339
FUN_M77_r4_38000__1339:
  1339  3410           PSHS  X                           
  133b  8E1311         LDX #0x1311                       
  133e  AD9FFEC2       JSR [0xfec2]                      
  1342  3510           PULS  X                           
  1344  39             RTS                               
  1345  .db 39                                               ; 9

; ---- function FUN_M77_r4_38000__1346
FUN_M77_r4_38000__1346:
  1346  39             RTS                               

; ---- function FUN_M77_r4_38000__1347
FUN_M77_r4_38000__1347:
  1347  170001         LBSR 0x134b                       
  134a  39             RTS                               

; ---- function FUN_M77_r4_38000__134b
FUN_M77_r4_38000__134b:
  134b  3476           PSHS  U Y X B A                   
  134d  3626           PSHU  Y B A                       
  134f  108E007D       LDY #0x7d                         
  1353  CC0001         LDD #0x1                          
  1356  AD9FFD2E       JSR [0xfd2e]                      
  135a  3726           PULU  A B Y                       
LAB_M77_r4_38000__135c:
  135c  AD9FFD2C       JSR [0xfd2c]                      
  1360  26FA           BNE 0x135c                        
  1362  108E007D       LDY #0x7d                         
  1366  CC0000         LDD #0x0                          
  1369  AD9FFD2A       JSR [0xfd2a]                      
  136d  3576           PULS  A B X Y U                   
  136f  39             RTS                               
PTR_FUN_M77_r4_38000__1422_M77_r4_38000__1370:
  1370  1422           addr M77_r4_38000::1422           
  1372  13C8           addr M77_r4_38000::13c8           
  1374  .db 13 BC 70 50 70 52 00 00 70 54 00 08 00 85 0F 00  ; ..pPpR..pT......
  1384  .db 00 00 01 00 01 00 01 27 14 0D 13 98 14 3D 70 56  ; .......'.....=pV
  1394  .db 00 A9 13 A4                                      ; ....

; ---- function FUN_M77_r4_38000__1398
FUN_M77_r4_38000__1398:
  1398  3410           PSHS  X                           
  139a  8E1370         LDX #0x1370                       
  139d  AD9FFEBA       JSR [0xfeba]                      
  13a1  3510           PULS  X                           
  13a3  39             RTS                               

; ---- function FUN_M77_r4_38000__13a4
FUN_M77_r4_38000__13a4:
  13a4  3410           PSHS  X                           
  13a6  8E1370         LDX #0x1370                       
  13a9  AD9FFEC0       JSR [0xfec0]                      
  13ad  3510           PULS  X                           
  13af  39             RTS                               

; ---- function FUN_M77_r4_38000__13b0
FUN_M77_r4_38000__13b0:
  13b0  3410           PSHS  X                           
  13b2  8E1370         LDX #0x1370                        ; desc[API_FDBC]: ->$1422 ->$13C8
  13b5  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...p"
  13b9  3510           PULS  X                           
  13bb  39             RTS                               

; ---- function FUN_M77_r4_38000__13bc
FUN_M77_r4_38000__13bc:
  13bc  3410           PSHS  X                           
  13be  8E1370         LDX #0x1370                        ; desc[API_FE6C]: ->$1422 ->$13C8
  13c1  AD9FFE6C       JSR [0xfe6c]                      
  13c5  3510           PULS  X                           
  13c7  39             RTS                               

; ---- function FUN_M77_r4_38000__13c8
FUN_M77_r4_38000__13c8:
  13c8  3410           PSHS  X                           
  13ca  8E1370         LDX #0x1370                       
  13cd  AD9FFEBC       JSR [0xfebc]                      
  13d1  3510           PULS  X                           
  13d3  170001         LBSR 0x13d7                       
  13d6  39             RTS                               

; ---- function FUN_M77_r4_38000__13d7
FUN_M77_r4_38000__13d7:
  13d7  3410           PSHS  X                           
  13d9  8E1370         LDX #0x1370                       
  13dc  AD9FFEBE       JSR [0xfebe]                      
  13e0  3510           PULS  X                           
  13e2  39             RTS                               

; ---- function FUN_M77_r4_38000__13e3
FUN_M77_r4_38000__13e3:
  13e3  3410           PSHS  X                           
  13e5  8E1370         LDX #0x1370                        ; desc[API_FE1C]: ->$1422 ->$13C8
  13e8  AD9FFE1C       JSR [0xfe1c]                      
  13ec  3510           PULS  X                           
  13ee  17FFE6         LBSR 0x13d7                       
  13f1  39             RTS                               

; ---- function FUN_M77_r4_38000__13f2
FUN_M77_r4_38000__13f2:
  13f2  3410           PSHS  X                           
  13f4  8E1370         LDX #0x1370                       
  13f7  AD9FFEC2       JSR [0xfec2]                      
  13fb  3510           PULS  X                           
  13fd  17FFD7         LBSR 0x13d7                       
  1400  39             RTS                               

; ---- function FUN_M77_r4_38000__1401
FUN_M77_r4_38000__1401:
  1401  3410           PSHS  X                           
  1403  8E1370         LDX #0x1370                        ; desc[API_FE1A]: ->$1422 ->$13C8 $13BC
  1406  AD9FFE1A       JSR [0xfe1a]                      
  140a  3510           PULS  X                           
  140c  39             RTS                               
  140d  .db 14 65 6E 76 20 74 72 61 63 6B 73 20 63 68 61 6E  ; .env tracks chan
  141d  .db 6E 65 6C 20 2E                                   ; nel .

; ---- function FUN_M77_r4_38000__1422
FUN_M77_r4_38000__1422:
  1422  3406           PSHS  B A                         
  1424  8E1370         LDX #0x1370                       
  1427  AD9FFE76       JSR [0xfe76]                      
  142b  3626           PSHU  Y B A                       
  142d  108E002D       LDY #0x2d                         
  1431  FC7054         LDD 0x7054                        
  1434  AD9FFD2E       JSR [0xfd2e]                      
  1438  3726           PULU  A B Y                       
  143a  3506           PULS  A B                         
  143c  39             RTS                               
  143d  .db 65 6E 76 3D 63 68 20 31 31 65 6E 76 3D 63 68 20  ; env=ch 11env=ch 
  144d  .db 32 32                                            ; 22
PTR_FUN_M77_r4_38000__1501_M77_r4_38000__144f:
  144f  1501           addr M77_r4_38000::1501           
  1451  14A7           addr M77_r4_38000::14a7           
  1453  .db 14 9B 70 58 70 5A 00 00 70 5C 00 08 00 87 10 00  ; ..pXpZ..p\......
  1463  .db 00 00 01 00 01 00 14 14 14 EC 14 77 15 1C 70 5E  ; ...........w..p^
  1473  .db 00 AB 14 83                                      ; ....

; ---- function FUN_M77_r4_38000__1477
FUN_M77_r4_38000__1477:
  1477  3410           PSHS  X                           
  1479  8E144F         LDX #0x144f                       
  147c  AD9FFEBA       JSR [0xfeba]                      
  1480  3510           PULS  X                           
  1482  39             RTS                               

; ---- function FUN_M77_r4_38000__1483
FUN_M77_r4_38000__1483:
  1483  3410           PSHS  X                           
  1485  8E144F         LDX #0x144f                       
  1488  AD9FFEC0       JSR [0xfec0]                      
  148c  3510           PULS  X                           
  148e  39             RTS                               

; ---- function FUN_M77_r4_38000__148f
FUN_M77_r4_38000__148f:
  148f  3410           PSHS  X                           
  1491  8E144F         LDX #0x144f                        ; desc[API_FDBC]: ->$1501 ->$14A7
  1494  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...O"
  1498  3510           PULS  X                           
  149a  39             RTS                               

; ---- function FUN_M77_r4_38000__149b
FUN_M77_r4_38000__149b:
  149b  3410           PSHS  X                           
  149d  8E144F         LDX #0x144f                        ; desc[API_FE6C]: ->$1501 ->$14A7
  14a0  AD9FFE6C       JSR [0xfe6c]                      
  14a4  3510           PULS  X                           
  14a6  39             RTS                               

; ---- function FUN_M77_r4_38000__14a7
FUN_M77_r4_38000__14a7:
  14a7  3410           PSHS  X                           
  14a9  8E144F         LDX #0x144f                       
  14ac  AD9FFEBC       JSR [0xfebc]                      
  14b0  3510           PULS  X                           
  14b2  170001         LBSR 0x14b6                       
  14b5  39             RTS                               

; ---- function FUN_M77_r4_38000__14b6
FUN_M77_r4_38000__14b6:
  14b6  3410           PSHS  X                           
  14b8  8E144F         LDX #0x144f                       
  14bb  AD9FFEBE       JSR [0xfebe]                      
  14bf  3510           PULS  X                           
  14c1  39             RTS                               

; ---- function FUN_M77_r4_38000__14c2
FUN_M77_r4_38000__14c2:
  14c2  3410           PSHS  X                           
  14c4  8E144F         LDX #0x144f                        ; desc[API_FE1C]: ->$1501 ->$14A7
  14c7  AD9FFE1C       JSR [0xfe1c]                      
  14cb  3510           PULS  X                           
  14cd  17FFE6         LBSR 0x14b6                       
  14d0  39             RTS                               

; ---- function FUN_M77_r4_38000__14d1
FUN_M77_r4_38000__14d1:
  14d1  3410           PSHS  X                           
  14d3  8E144F         LDX #0x144f                       
  14d6  AD9FFEC2       JSR [0xfec2]                      
  14da  3510           PULS  X                           
  14dc  17FFD7         LBSR 0x14b6                       
  14df  39             RTS                               

; ---- function FUN_M77_r4_38000__14e0
FUN_M77_r4_38000__14e0:
  14e0  3410           PSHS  X                           
  14e2  8E144F         LDX #0x144f                        ; desc[API_FE1A]: ->$1501 ->$14A7 $149B
  14e5  AD9FFE1A       JSR [0xfe1a]                      
  14e9  3510           PULS  X                           
  14eb  39             RTS                               
  14ec  .db 14 65 6E 76 65 6C 6F 70 65 20 64 65 63 61 79 20  ; .envelope decay 
  14fc  .db 74 79 70 65 2E                                   ; type.

; ---- function FUN_M77_r4_38000__1501
FUN_M77_r4_38000__1501:
  1501  3406           PSHS  B A                         
  1503  8E144F         LDX #0x144f                       
  1506  AD9FFE76       JSR [0xfe76]                      
  150a  3626           PSHU  Y B A                       
  150c  108E002C       LDY #0x2c                         
  1510  FC705C         LDD 0x705c                        
  1513  AD9FFD2E       JSR [0xfd2e]                      
  1517  3726           PULU  A B Y                       
  1519  3506           PULS  A B                         
  151b  39             RTS                               
  151c  .db 65 6E 76 20 6C 69 6E 20 20 20 20 20 20 6C 69 6E  ; env lin      lin
  152c  .db 65 61 72 20 65 6E 76 65 6C 6F 70 65 65 6E 76 20  ; ear envelopeenv 
  153c  .db 65 78 70 20 65 78 70 6F 6E 65 6E 74 69 61 6C 20  ; exp exponential 
  154c  .db 65 6E 76 65 6C 6F 70 65                          ; envelope

; ---- function FUN_M77_r4_38000__1554
FUN_M77_r4_38000__1554:
  1554  3476           PSHS  U Y X B A                   
  1556  CC0001         LDD #0x1                          
  1559  10B37044       CMPD 0x7044                       
  155d  2B0E           BMI 0x156d                        
  155f  2707           BEQ 0x1568                        
  1561  2A00           BPL 0x1563                        
LAB_M77_r4_38000__1563:
  1563  17F149         LBSR 0x06af                       
  1566  200A           BRA 0x1572                        
LAB_M77_r4_38000__1568:
  1568  17F165         LBSR 0x06d0                       
  156b  2005           BRA 0x1572                        
LAB_M77_r4_38000__156d:
  156d  17F181         LBSR 0x06f1                       
  1570  2000           BRA 0x1572                        
LAB_M77_r4_38000__1572:
  1572  3576           PULS  A B X Y U                   
  1574  17F76A         LBSR 0x0ce1                       
  1577  39             RTS                               
PTR_FUN_M77_r4_38000__15e3_M77_r4_38000__1578:
  1578  15E3           addr M77_r4_38000::15e3           
  157a  15C2           addr M77_r4_38000::15c2           
  157c  .db 15 B6 70 00 70 02 00 00 70 04 00 08 00 21 11 FF  ; ..p.p...p....!..
  158c  .db D0 00 30 00 01 00 03 1C 15 CE 00 00 00 00 00 00  ; ..0.............
  159c  .db 00 00                                            ; ..

; ---- function FUN_M77_r4_38000__159e
FUN_M77_r4_38000__159e:
  159e  3410           PSHS  X                           
  15a0  8E1578         LDX #0x1578                       
  15a3  AD9FFE74       JSR [0xfe74]                      
  15a7  3510           PULS  X                           
  15a9  39             RTS                               

; ---- function FUN_M77_r4_38000__15aa
FUN_M77_r4_38000__15aa:
  15aa  3410           PSHS  X                           
  15ac  8E1578         LDX #0x1578                        ; desc[API_FE22]: ->$15E3 ->$15C2
  15af  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  15b3  3510           PULS  X                           
  15b5  39             RTS                               

; ---- function FUN_M77_r4_38000__15b6
FUN_M77_r4_38000__15b6:
  15b6  3410           PSHS  X                           
  15b8  8E1578         LDX #0x1578                       
  15bb  AD9FFE70       JSR [0xfe70]                      
  15bf  3510           PULS  X                           
  15c1  39             RTS                               

; ---- function FUN_M77_r4_38000__15c2
FUN_M77_r4_38000__15c2:
  15c2  3410           PSHS  X                           
  15c4  8E1578         LDX #0x1578                       
  15c7  AD9FFE72       JSR [0xfe72]                      
  15cb  3510           PULS  X                           
  15cd  39             RTS                               
  15ce  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  15de  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M77_r4_38000__15e3
FUN_M77_r4_38000__15e3:
  15e3  3476           PSHS  U Y X B A                   
  15e5  8E1578         LDX #0x1578                       
  15e8  AD9FFE76       JSR [0xfe76]                      
  15ec  AD9FFE52       JSR [0xfe52]                      
  15f0  3576           PULS  A B X Y U                   
  15f2  39             RTS                               
PTR_FUN_M77_r4_38000__165e_M77_r4_38000__15f3:
  15f3  165E           addr M77_r4_38000::165e           
  15f5  163D           addr M77_r4_38000::163d           
  15f7  .db 16 31 70 06 70 08 00 00 70 0A 00 08 00 22 12 FF  ; .1p.p...p...."..
  1607  .db D0 00 30 00 01 00 03 1D 16 49 00 00 00 00 00 00  ; ..0......I......
  1617  .db 00 00                                            ; ..

; ---- function FUN_M77_r4_38000__1619
FUN_M77_r4_38000__1619:
  1619  3410           PSHS  X                           
  161b  8E15F3         LDX #0x15f3                       
  161e  AD9FFE74       JSR [0xfe74]                      
  1622  3510           PULS  X                           
  1624  39             RTS                               

; ---- function FUN_M77_r4_38000__1625
FUN_M77_r4_38000__1625:
  1625  3410           PSHS  X                           
  1627  8E15F3         LDX #0x15f3                        ; desc[API_FE22]: ->$165E ->$163D
  162a  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  162e  3510           PULS  X                           
  1630  39             RTS                               

; ---- function FUN_M77_r4_38000__1631
FUN_M77_r4_38000__1631:
  1631  3410           PSHS  X                           
  1633  8E15F3         LDX #0x15f3                       
  1636  AD9FFE70       JSR [0xfe70]                      
  163a  3510           PULS  X                           
  163c  39             RTS                               

; ---- function FUN_M77_r4_38000__163d
FUN_M77_r4_38000__163d:
  163d  3410           PSHS  X                           
  163f  8E15F3         LDX #0x15f3                       
  1642  AD9FFE72       JSR [0xfe72]                      
  1646  3510           PULS  X                           
  1648  39             RTS                               
  1649  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  1659  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M77_r4_38000__165e
FUN_M77_r4_38000__165e:
  165e  3476           PSHS  U Y X B A                   
  1660  8E15F3         LDX #0x15f3                       
  1663  AD9FFE76       JSR [0xfe76]                      
  1667  AD9FFE54       JSR [0xfe54]                      
  166b  3576           PULS  A B X Y U                   
  166d  39             RTS                               
PTR_FUN_M77_r4_38000__16d9_M77_r4_38000__166e:
  166e  16D9           addr M77_r4_38000::16d9           
  1670  16B8           addr M77_r4_38000::16b8           
  1672  .db 16 AC 70 0C 70 0E 00 00 70 10 00 08 00 23 13 FF  ; ..p.p...p....#..
  1682  .db D0 00 30 00 01 00 03 1D 16 C4 00 00 00 00 00 00  ; ..0.............
  1692  .db 00 00                                            ; ..

; ---- function FUN_M77_r4_38000__1694
FUN_M77_r4_38000__1694:
  1694  3410           PSHS  X                           
  1696  8E166E         LDX #0x166e                       
  1699  AD9FFE74       JSR [0xfe74]                      
  169d  3510           PULS  X                           
  169f  39             RTS                               

; ---- function FUN_M77_r4_38000__16a0
FUN_M77_r4_38000__16a0:
  16a0  3410           PSHS  X                           
  16a2  8E166E         LDX #0x166e                        ; desc[API_FE22]: ->$16D9 ->$16B8
  16a5  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  16a9  3510           PULS  X                           
  16ab  39             RTS                               

; ---- function FUN_M77_r4_38000__16ac
FUN_M77_r4_38000__16ac:
  16ac  3410           PSHS  X                           
  16ae  8E166E         LDX #0x166e                       
  16b1  AD9FFE70       JSR [0xfe70]                      
  16b5  3510           PULS  X                           
  16b7  39             RTS                               

; ---- function FUN_M77_r4_38000__16b8
FUN_M77_r4_38000__16b8:
  16b8  3410           PSHS  X                           
  16ba  8E166E         LDX #0x166e                       
  16bd  AD9FFE72       JSR [0xfe72]                      
  16c1  3510           PULS  X                           
  16c3  39             RTS                               
  16c4  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  16d4  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M77_r4_38000__16d9
FUN_M77_r4_38000__16d9:
  16d9  3476           PSHS  U Y X B A                   
  16db  8E166E         LDX #0x166e                       
  16de  AD9FFE76       JSR [0xfe76]                      
  16e2  AD9FFE56       JSR [0xfe56]                      
  16e6  3576           PULS  A B X Y U                   
  16e8  39             RTS                               
PTR_FUN_M77_r4_38000__1754_M77_r4_38000__16e9:
  16e9  1754           addr M77_r4_38000::1754           
  16eb  1733           addr M77_r4_38000::1733           
  16ed  .db 17 27 70 12 70 14 00 00 70 16 00 08 00 24 14 FF  ; .'p.p...p....$..
  16fd  .db D0 00 30 00 01 00 03 1E 17 3F 00 00 00 00 00 00  ; ..0......?......
  170d  .db 00 00                                            ; ..

; ---- function FUN_M77_r4_38000__170f
FUN_M77_r4_38000__170f:
  170f  3410           PSHS  X                           
  1711  8E16E9         LDX #0x16e9                       
  1714  AD9FFE74       JSR [0xfe74]                      
  1718  3510           PULS  X                           
  171a  39             RTS                               

; ---- function FUN_M77_r4_38000__171b
FUN_M77_r4_38000__171b:
  171b  3410           PSHS  X                           
  171d  8E16E9         LDX #0x16e9                        ; desc[API_FE22]: ->$1754 ->$1733
  1720  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1724  3510           PULS  X                           
  1726  39             RTS                               

; ---- function FUN_M77_r4_38000__1727
FUN_M77_r4_38000__1727:
  1727  3410           PSHS  X                           
  1729  8E16E9         LDX #0x16e9                       
  172c  AD9FFE70       JSR [0xfe70]                      
  1730  3510           PULS  X                           
  1732  39             RTS                               

; ---- function FUN_M77_r4_38000__1733
FUN_M77_r4_38000__1733:
  1733  3410           PSHS  X                           
  1735  8E16E9         LDX #0x16e9                       
  1738  AD9FFE72       JSR [0xfe72]                      
  173c  3510           PULS  X                           
  173e  39             RTS                               
  173f  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  174f  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M77_r4_38000__1754
FUN_M77_r4_38000__1754:
  1754  3476           PSHS  U Y X B A                   
  1756  8E16E9         LDX #0x16e9                       
  1759  AD9FFE76       JSR [0xfe76]                      
  175d  AD9FFE58       JSR [0xfe58]                      
  1761  3576           PULS  A B X Y U                   
  1763  39             RTS                               

; ---- function FUN_M77_r4_38000__1764
FUN_M77_r4_38000__1764:
  1764  AD9FFD76       JSR [0xfd76]                      
  1768  3B             RTI                               

;; Module 77 code record 02, 1560 bytes, entered at payload start
MODULE_77_02_CODE_hdr:
  1769  770206200000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_77_02_entry
MODULE_77_02_entry:
  1771  AD9FFE20       JSR [0xfe20]                       ; inline[API_FE20]: interp table, 257 points
  1775  08             db 8h                             
  1776  7FA47FA27FA0.. dw[257]                           
LAB_M77_r4_38000__1978:
  1978  39             RTS                               

; ---- function FUN_M77_r4_38000__1979
FUN_M77_r4_38000__1979:
  1979  AD9FFE20       JSR [0xfe20]                       ; inline[API_FE20]: interp table, 257 points
  197d  08             db 8h                             
  197e  7ED47ECE7EC8.. dw[257]                           
LAB_M77_r4_38000__1b80:
  1b80  39             RTS                               

; ---- function FUN_M77_r4_38000__1b81
FUN_M77_r4_38000__1b81:
  1b81  AD9FFE20       JSR [0xfe20]                       ; inline[API_FE20]: interp table, 257 points
  1b85  08             db 8h                             
  1b86  7E4A7E417E38.. dw[257]                           
LAB_M77_r4_38000__1d88:
  1d88  39             RTS                               

;; TMS32010 program 77 for DSP 1: 172 words loaded at $800 (written via bank latch $81)
DSPPROG_77_DSP1_hdr:
  1d89  771001620000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_77_DSP1:
  1d91  08007F8B6E00.. dw[173]                           

;; TMS32010 program 77 for DSP 2: 171 words loaded at $800 (written via bank latch $82)
DSPPROG_77_DSP2_hdr:
  1eeb  771101600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_77_DSP2:
  1ef3  08007F8B6E00.. dw[172]                           

;; TMS32010 program 77 for DSP 3: 283 words loaded at $800 (written via bank latch $83)
DSPPROG_77_DSP3_hdr:
  204b  771202400000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_77_DSP3:
  2053  08007F8B6E00.. dw[284]                           

;; End of record chain
END_OF_CHAIN_hdr:
  228b  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  2293  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2303  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2313  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2323  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2333  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2343  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2353  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2363  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2373  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2383  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2393  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2403  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2413  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2423  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2433  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2443  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2453  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2463  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2473  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2483  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2493  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2503  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2513  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2523  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2533  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2543  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2553  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2563  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2573  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2583  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2593  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2603  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2613  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2623  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2633  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2643  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2653  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2663  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2673  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2683  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2693  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2703  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2713  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2723  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2733  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2743  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2753  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2763  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2773  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2783  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2793  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2803  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2813  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2823  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2833  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2843  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2853  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2863  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2873  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2883  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2893  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2903  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2913  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2923  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2933  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2943  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2953  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2963  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2973  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2983  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2993  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2aa3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ab3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ac3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ad3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ae3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2af3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ba3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2be3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bf3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ca3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ce3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cf3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2da3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2db3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2de3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2df3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ea3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2eb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ec3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ed3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ee3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ef3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fa3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fe3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ff3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3003  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3013  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3023  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3033  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3043  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3053  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3063  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3073  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3083  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3093  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3103  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3113  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3123  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3133  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3143  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3153  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3163  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3173  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3183  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3193  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3203  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3213  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3223  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3233  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3243  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3253  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3263  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3273  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3283  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3293  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3303  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3313  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3323  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3333  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3343  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3353  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3363  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3373  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3383  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3393  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3403  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3413  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3423  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3433  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3443  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3453  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3463  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3473  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3483  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3493  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3503  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3513  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3523  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3533  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3543  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3553  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3563  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3573  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3583  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3593  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3603  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3613  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3623  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3633  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3643  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3653  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3663  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3673  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3683  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3693  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3703  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3713  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3723  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3733  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3743  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3753  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3763  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3773  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3783  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3793  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3803  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3813  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3823  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3833  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3843  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3853  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3863  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3873  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3883  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3893  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3903  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3913  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3923  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3933  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3943  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3953  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3963  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3973  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3983  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3993  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39a3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39b3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39c3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39d3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39e3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39f3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aa3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ab3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ac3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ad3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ae3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3af3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ba3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3be3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bf3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ca3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ce3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cf3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3da3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3db3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3de3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3df3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ea3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ec3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ed3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ee3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f03  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f13  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f23  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f33  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f43  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f53  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f63  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f73  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF           ; .............
