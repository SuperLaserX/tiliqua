; H3500  block M70_r5_00000  M70_r5_00000::0000-M70_r5_00000::3fff
; Bank r5_00000 (module id 70, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 70 parameter/preset table "STUTTER", 223 bytes
MODULE_70_TABLE_STUTTER_hdr:
  0008  700000E70000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_70_TABLE_STUTTER:
  0010  70             ?? 70h    p                       
  0011  .db 01                                               ; .
  0012  535455545445.. ds "STUTTER        "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0054  .db 00 00 00 00 00 00 00 00 00 00 64 00 64 00 64 00  ; ..........d.d.d.
  0064  .db 64 00 00 00 64 00 00 00 64 00 51 01 F4 00 08 00  ; d...d...d.Q.....
  0074  .db 10 00 B2 01 F4 00 04 00 10 01 0C 02 5A FF F9 04  ; ............Z...
  0084  .db B0 00 19 03 E8 00 07 04 B0 00 19 03 E8 14 14 28  ; ...............(
  0094  .db 28 02 BC 02 BC 03 84 03 84 02 BC 02 BC 00 55 00  ; (.............U.
  00a4  .db 64 00 00 03 0C 20 23 09 16 01 05 02 02 02 02 02  ; d.... #.........
  00b4  .db 32 00                                            ; 2.
  00b6  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  00dc  .db 00 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13  ; ................
  00ec  .db 88 13 88                                         ; ...

;; Module 70 code record 01, 2830 bytes, entered at payload start
MODULE_70_01_CODE_hdr:
  00ef  70010B160000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_70_01_entry
MODULE_70_01_entry:
  00f7  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00FB
  00fb  00FB           dw FBh                            
LAB_M70_r5_00000__00fd:
  00fd  3477           PSHS  U Y X B A CC                
  00ff  170125         LBSR 0x0227                       
  0102  1700A2         LBSR 0x01a7                       
  0105  1701C0         LBSR 0x02c8                       
  0108  8603           LDA #0x3                          
  010a  B760DA         STA 0x60da                        
  010d  AD9FFE38       JSR [0xfe38]                      
  0111  C602           LDB #0x2                          
  0113  AD9FFC58       JSR [0xfc58]                      
  0117  170584         LBSR 0x069e                       
  011a  B6600A         LDA 0x600a                        
  011d  8170           CMPA #0x70                        
  011f  2707           BEQ 0x0128                        
  0121  AD9FFED0       JSR [0xfed0]                      
  0125  17002D         LBSR 0x0155                       
LAB_M70_r5_00000__0128:
  0128  1701BA         LBSR 0x02e5                       
  012b  B6600A         LDA 0x600a                        
  012e  8170           CMPA #0x70                        
  0130  2707           BEQ 0x0139                        
  0132  CC4E20         LDD #0x4e20                       
  0135  AD9FFD20       JSR [0xfd20]                      
LAB_M70_r5_00000__0139:
  0139  170211         LBSR 0x034d                       
  013c  AD9FFE36       JSR [0xfe36]                      
  0140  AD9FFDF6       JSR [0xfdf6]                      
  0144  AD9FFE18       JSR [0xfe18]                      
  0148  1706EF         LBSR 0x083a                       
  014b  AD9FFE14       JSR [0xfe14]                      
  014f  170716         LBSR 0x0868                       
  0152  3577           PULS CC A B X Y U                 
  0154  39             RTS                               

; ---- function FUN_M70_r5_00000__0155
FUN_M70_r5_00000__0155:
  0155  3476           PSHS  U Y X B A                   
  0157  C601           LDB #0x1                          
  0159  8E7010         LDX #0x7010                       
  015c  AD9FFD30       JSR [0xfd30]                      
  0160  102606A0       LBNE 0x0804                       
  0164  C602           LDB #0x2                          
  0166  8E7011         LDX #0x7011                       
  0169  AD9FFD30       JSR [0xfd30]                      
  016d  10260693       LBNE 0x0804                       
  0171  C603           LDB #0x3                          
  0173  8E0012         LDX #0x12                         
  0176  AD9FFD30       JSR [0xfd30]                      
  017a  10260686       LBNE 0x0804                       
  017e  C603           LDB #0x3                          
  0180  8E7012         LDX #0x7012                       
  0183  AD9FFD30       JSR [0xfd30]                      
  0187  10260679       LBNE 0x0804                       
  018b  171345         LBSR 0x14d3                       
  018e  17140A         LBSR 0x159b                       
  0191  1714FA         LBSR 0x168e                       
  0194  CC0064         LDD #0x64                         
  0197  FD7084         STD 0x7084                        
  019a  CC0BB8         LDD #0xbb8                        
  019d  FD7196         STD 0x7196                        
  01a0  AD9FFD7C       JSR [0xfd7c]                      
  01a4  3576           PULS  A B X Y U                   
  01a6  39             RTS                               

; ---- function FUN_M70_r5_00000__01a7
FUN_M70_r5_00000__01a7:
  01a7  3476           PSHS  U Y X B A                   
  01a9  CC0000         LDD #0x0                          
  01ac  FD7028         STD 0x7028                        
  01af  FD7030         STD 0x7030                        
  01b2  FD7038         STD 0x7038                        
  01b5  FD7040         STD 0x7040                        
  01b8  FD7002         STD 0x7002                        
  01bb  FD700A         STD 0x700a                        
  01be  FD7012         STD 0x7012                        
  01c1  FD701A         STD 0x701a                        
  01c4  FD7048         STD 0x7048                        
  01c7  FD7050         STD 0x7050                        
  01ca  FD7058         STD 0x7058                        
  01cd  FD7060         STD 0x7060                        
  01d0  FD70FA         STD 0x70fa                        
  01d3  FD7022         STD 0x7022                        
  01d6  FD70D0         STD 0x70d0                        
  01d9  FD70D2         STD 0x70d2                        
  01dc  FD70D4         STD 0x70d4                        
  01df  FD70D6         STD 0x70d6                        
  01e2  FD70D8         STD 0x70d8                        
  01e5  FD70DA         STD 0x70da                        
  01e8  FD70DC         STD 0x70dc                        
  01eb  FD70DE         STD 0x70de                        
  01ee  FD70E0         STD 0x70e0                        
  01f1  FD70E2         STD 0x70e2                        
  01f4  FD70E4         STD 0x70e4                        
  01f7  FD70E6         STD 0x70e6                        
  01fa  FD70E8         STD 0x70e8                        
  01fd  FD70EA         STD 0x70ea                        
  0200  FD70EC         STD 0x70ec                        
  0203  FD70EE         STD 0x70ee                        
  0206  FD70F0         STD 0x70f0                        
  0209  FD70F2         STD 0x70f2                        
  020c  FD70F4         STD 0x70f4                        
  020f  FD70F6         STD 0x70f6                        
  0212  FD70C6         STD 0x70c6                        
  0215  FD70F8         STD 0x70f8                        
  0218  FD7068         STD 0x7068                        
  021b  FD706E         STD 0x706e                        
  021e  FD7074         STD 0x7074                        
  0221  FD707A         STD 0x707a                        
  0224  3576           PULS  A B X Y U                   
  0226  39             RTS                               

; ---- function FUN_M70_r5_00000__0227
FUN_M70_r5_00000__0227:
  0227  3476           PSHS  U Y X B A                   
  0229  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 79:26 7B:2C 7D:2E 7F:34 99:C4 9B:CA
  022d  79             db 79h                            
  022e  26             db 26h                            
  022f  7B             db 7Bh                            
  0230  2C             db 2Ch                            
  0231  7D             db 7Dh                            
  0232  2E             db 2Eh                            
  0233  7F             db 7Fh                            
  0234  34             db 34h                            
  0235  99             db 99h                            
  0236  C4             db C4h                            
  0237  9B             db 9Bh                            
  0238  CA             db CAh                            
  0239  00             db 0h                             
LAB_M70_r5_00000__023a:
  023a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 81:36 83:3C 85:3E 87:44
  023e  81             db 81h                            
  023f  36             db 36h                            
  0240  83             db 83h                            
  0241  3C             db 3Ch                            
  0242  85             db 85h                            
  0243  3E             db 3Eh                            
  0244  87             db 87h                            
  0245  44             db 44h                            
  0246  00             db 0h                             
LAB_M70_r5_00000__0247:
  0247  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 65:00 67:06 69:08 6B:0E
  024b  65             db 65h                            
  024c  00             db 0h                             
  024d  67             db 67h                            
  024e  06             db 6h                             
  024f  69             db 69h                            
  0250  08             db 8h                             
  0251  6B             db 6Bh                            
  0252  0E             db Eh                             
  0253  00             db 0h                             
LAB_M70_r5_00000__0254:
  0254  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 6D:10 6F:16 71:18 73:1E
  0258  6D             db 6Dh                            
  0259  10             db 10h                            
  025a  6F             db 6Fh                            
  025b  16             db 16h                            
  025c  71             db 71h                            
  025d  18             db 18h                            
  025e  73             db 73h                            
  025f  1E             db 1Eh                            
  0260  00             db 0h                             
LAB_M70_r5_00000__0261:
  0261  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 55:46 57:4C 59:4E 5B:54 5D:56 5F:5C 61:5E 63:64
  0265  55             db 55h                            
  0266  46             db 46h                            
  0267  57             db 57h                            
  0268  4C             db 4Ch                            
  0269  59             db 59h                            
  026a  4E             db 4Eh                            
  026b  5B             db 5Bh                            
  026c  54             db 54h                            
  026d  5D             db 5Dh                            
  026e  56             db 56h                            
  026f  5F             db 5Fh                            
  0270  5C             db 5Ch                            
  0271  61             db 61h                            
  0272  5E             db 5Eh                            
  0273  63             db 63h                            
  0274  64             db 64h                            
  0275  00             db 0h                             
LAB_M70_r5_00000__0276:
  0276  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 8D:AA 91:B4 8F:AE 93:B8 95:BC 97:BE
  027a  8D             db 8Dh                            
  027b  AA             db AAh                            
  027c  91             db 91h                            
  027d  B4             db B4h                            
  027e  8F             db 8Fh                            
  027f  AE             db AEh                            
  0280  93             db 93h                            
  0281  B8             db B8h                            
  0282  95             db 95h                            
  0283  BC             db BCh                            
  0284  97             db 97h                            
  0285  BE             db BEh                            
  0286  00             db 0h                             
LAB_M70_r5_00000__0287:
  0287  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 89:A8 8B:B2 8A:AC 8C:B6 9D:CC
  028b  89             db 89h                            
  028c  A8             db A8h                            
  028d  8B             db 8Bh                            
  028e  B2             db B2h                            
  028f  8A             db 8Ah                            
  0290  AC             db ACh                            
  0291  8C             db 8Ch                            
  0292  B6             db B6h                            
  0293  9D             db 9Dh                            
  0294  CC             db CCh                            
  0295  00             db 0h                             
LAB_M70_r5_00000__0296:
  0296  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 9F:98 A0:9A A1:9C A2:9E
  029a  9F             db 9Fh                            
  029b  98             db 98h                            
  029c  A0             db A0h                            
  029d  9A             db 9Ah                            
  029e  A1             db A1h                            
  029f  9C             db 9Ch                            
  02a0  A2             db A2h                            
  02a1  9E             db 9Eh                            
  02a2  00             db 0h                             
LAB_M70_r5_00000__02a3:
  02a3  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: A3:A0 A4:A2 A5:A4 A6:A6
  02a7  A3             db A3h                            
  02a8  A0             db A0h                            
  02a9  A4             db A4h                            
  02aa  A2             db A2h                            
  02ab  A5             db A5h                            
  02ac  A4             db A4h                            
  02ad  A6             db A6h                            
  02ae  A6             db A6h                            
  02af  00             db 0h                             
LAB_M70_r5_00000__02b0:
  02b0  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 76:7E 77:80 78:82 75:20 9E:CE
  02b4  76             db 76h                            
  02b5  7E             db 7Eh                            
  02b6  77             db 77h                            
  02b7  80             db 80h                            
  02b8  78             db 78h                            
  02b9  82             db 82h                            
  02ba  75             db 75h                            
  02bb  20             db 20h                            
  02bc  9E             db 9Eh                            
  02bd  CE             db CEh                            
  02be  00             db 0h                             
LAB_M70_r5_00000__02bf:
  02bf  CC0010         LDD #0x10                         
  02c2  FD7156         STD 0x7156                        
  02c5  3576           PULS  A B X Y U                   
  02c7  39             RTS                               

; ---- function FUN_M70_r5_00000__02c8
FUN_M70_r5_00000__02c8:
  02c8  3476           PSHS  U Y X B A                   
  02ca  170E41         LBSR 0x110e                       
  02cd  170EEC         LBSR 0x11bc                       
  02d0  170CE5         LBSR 0x0fb8                       
  02d3  170D8D         LBSR 0x1063                       
  02d6  170F79         LBSR 0x1252                       
  02d9  170FF1         LBSR 0x12cd                       
  02dc  171069         LBSR 0x1348                       
  02df  1710E1         LBSR 0x13c3                       
  02e2  3576           PULS  A B X Y U                   
  02e4  39             RTS                               

; ---- function FUN_M70_r5_00000__02e5
FUN_M70_r5_00000__02e5:
  02e5  3476           PSHS  U Y X B A                   
  02e7  1711E9         LBSR 0x14d3                       
  02ea  1712AE         LBSR 0x159b                       
  02ed  17139E         LBSR 0x168e                       
  02f0  1709DC         LBSR 0x0ccf                       
  02f3  170A89         LBSR 0x0d7f                       
  02f6  170B6A         LBSR 0x0e63                       
  02f9  170C17         LBSR 0x0f13                       
  02fc  1733AF         LBSR 0x36ae                       
  02ff  173519         LBSR 0x381b                       
  0302  17345F         LBSR 0x3764                       
  0305  1735A4         LBSR 0x38ac                       
  0308  173619         LBSR 0x3924                       
  030b  17316D         LBSR 0x347b                       
  030e  17319D         LBSR 0x34ae                       
  0311  1731C0         LBSR 0x34d4                       
  0314  1731F0         LBSR 0x3507                       
  0317  173213         LBSR 0x352d                       
  031a  173243         LBSR 0x3560                       
  031d  173266         LBSR 0x3586                       
  0320  173296         LBSR 0x35b9                       
  0323  1732B9         LBSR 0x35df                       
  0326  1732DC         LBSR 0x3605                       
  0329  173924         LBSR 0x3c50                       
  032c  1739B3         LBSR 0x3ce2                       
  032f  17373D         LBSR 0x3a6f                       
  0332  172455         LBSR 0x278a                       
  0335  1724DD         LBSR 0x2815                       
  0338  172565         LBSR 0x28a0                       
  033b  1725ED         LBSR 0x292b                       
  033e  172675         LBSR 0x29b6                       
  0341  1726FD         LBSR 0x2a41                       
  0344  172785         LBSR 0x2acc                       
  0347  17280D         LBSR 0x2b57                       
  034a  3576           PULS  A B X Y U                   
  034c  39             RTS                               

; ---- function FUN_M70_r5_00000__034d
FUN_M70_r5_00000__034d:
  034d  3476           PSHS  U Y X B A                   
  034f  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 00 80 "trigger1" 21 $2CE3 $0C04
  0353  00             db 0h                             
  0354  80             db 80h                            
  0355  747269676765.. ds "trigger1"                     
  035d  21             db 21h                            
  035e  2CE3           addr M70_r5_00000::2ce3           
  0360  0C04           addr M70_r5_00000::0c04           
LAB_M70_r5_00000__0362:
  0362  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 01 80 "trigger2" 25 $2D91 $0C04
  0366  01             db 1h                             
  0367  80             db 80h                            
  0368  747269676765.. ds "trigger2"                     
  0370  25             db 25h                            
  0371  2D91           addr M70_r5_00000::2d91           
  0373  0C04           addr M70_r5_00000::0c04           
LAB_M70_r5_00000__0375:
  0375  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 02 80 "trigger3" 29 $2E3F $0C04
  0379  02             db 2h                             
  037a  80             db 80h                            
  037b  747269676765.. ds "trigger3"                     
  0383  29             db 29h                            
  0384  2E3F           addr M70_r5_00000::2e3f           
  0386  0C04           addr M70_r5_00000::0c04           
LAB_M70_r5_00000__0388:
  0388  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 03 80 "trigger4" 2D $2EED $0C04
  038c  03             db 3h                             
  038d  80             db 80h                            
  038e  747269676765.. ds "trigger4"                     
  0396  2D             db 2Dh                            
  0397  2EED           addr M70_r5_00000::2eed           
  0399  0C04           addr M70_r5_00000::0c04           
LAB_M70_r5_00000__039b:
  039b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "length 1" 31 $3681 $368D
  039f  04             db 4h                             
  03a0  80             db 80h                            
  03a1  6C656E677468.. ds "length 1"                     
  03a9  31             db 31h                            
  03aa  3681           addr M70_r5_00000::3681           
  03ac  368D           addr M70_r5_00000::368d           
LAB_M70_r5_00000__03ae:
  03ae  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "length 2" 35 $3737 $3743
  03b2  05             db 5h                             
  03b3  80             db 80h                            
  03b4  6C656E677468.. ds "length 2"                     
  03bc  35             db 35h                            
  03bd  3737           addr M70_r5_00000::3737           
  03bf  3743           addr M70_r5_00000::3743           
LAB_M70_r5_00000__03c1:
  03c1  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 " count1 " 39 $37ED $37F9
  03c5  06             db 6h                             
  03c6  80             db 80h                            
  03c7  20636F756E74.. ds " count1 "                     
  03cf  39             db 39h                            
  03d0  37ED           addr M70_r5_00000::37ed           
  03d2  37F9           addr M70_r5_00000::37f9           
LAB_M70_r5_00000__03d4:
  03d4  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 " count2 " 3D $387D $3889
  03d8  07             db 7h                             
  03d9  80             db 80h                            
  03da  20636F756E74.. ds " count2 "                     
  03e2  3D             db 3Dh                            
  03e3  387D           addr M70_r5_00000::387d           
  03e5  3889           addr M70_r5_00000::3889           
LAB_M70_r5_00000__03e7:
  03e7  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 "l pitch " 41 $0C8C $0C98
  03eb  08             db 8h                             
  03ec  80             db 80h                            
  03ed  6C2070697463.. ds "l pitch "                     
  03f5  41             db 41h                            
  03f6  0C8C           addr M70_r5_00000::0c8c           
  03f8  0C98           addr M70_r5_00000::0c98           
LAB_M70_r5_00000__03fa:
  03fa  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 "r pitch " 45 $0E20 $0E2C
  03fe  09             db 9h                             
  03ff  80             db 80h                            
  0400  722070697463.. ds "r pitch "                     
  0408  45             db 45h                            
  0409  0E20           addr M70_r5_00000::0e20           
  040b  0E2C           addr M70_r5_00000::0e2c           
LAB_M70_r5_00000__040d:
  040d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "l delay " 49 $0D52 $0D5E
  0411  0A             db Ah                             
  0412  80             db 80h                            
  0413  6C2064656C61.. ds "l delay "                     
  041b  49             db 49h                            
  041c  0D52           addr M70_r5_00000::0d52           
  041e  0D5E           addr M70_r5_00000::0d5e           
LAB_M70_r5_00000__0420:
  0420  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 "r delay " 4D $0EE6 $0EF2
  0424  0B             db Bh                             
  0425  80             db 80h                            
  0426  722064656C61.. ds "r delay "                     
  042e  4D             db 4Dh                            
  042f  0EE6           addr M70_r5_00000::0ee6           
  0431  0EF2           addr M70_r5_00000::0ef2           
LAB_M70_r5_00000__0433:
  0433  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0C 80 "pr speed" 51 $3C22 $3C2E
  0437  0C             db Ch                             
  0438  80             db 80h                            
  0439  707220737065.. ds "pr speed"                     
  0441  51             db 51h                            
  0442  3C22           addr M70_r5_00000::3c22           
  0444  3C2E           addr M70_r5_00000::3c2e           
LAB_M70_r5_00000__0446:
  0446  CC0462         LDD #0x462                        
  0449  FD60F5         STD 0x60f5                        
  044c  CC0058         LDD #0x58                         
  044f  47             ASRA                              
  0450  56             RORB                              
  0451  FD60F7         STD 0x60f7                        
  0454  8601           LDA #0x1                          
  0456  B76105         STA 0x6105                        
  0459  CC00A7         LDD #0xa7                         
  045c  FD6106         STD 0x6106                        
  045f  3576           PULS  A B X Y U                   
  0461  39             RTS                               
  0462  04BA04C504D0.. addr[44]                          

; ---- function FUN_M70_r5_00000__04ba
FUN_M70_r5_00000__04ba:
  04ba  172832         LBSR 0x2cef                       
  04bd  17037A         LBSR 0x083a                       
  04c0  AD9FFE10       JSR [0xfe10]                      
  04c4  39             RTS                               

; ---- function FUN_M70_r5_00000__04c5
FUN_M70_r5_00000__04c5:
  04c5  1728D5         LBSR 0x2d9d                       
  04c8  17036F         LBSR 0x083a                       
  04cb  AD9FFE12       JSR [0xfe12]                      
  04cf  39             RTS                               

; ---- function FUN_M70_r5_00000__04d0
FUN_M70_r5_00000__04d0:
  04d0  172978         LBSR 0x2e4b                       
  04d3  170364         LBSR 0x083a                       
  04d6  AD9FFE14       JSR [0xfe14]                      
  04da  39             RTS                               

; ---- function FUN_M70_r5_00000__04db
FUN_M70_r5_00000__04db:
  04db  172A1B         LBSR 0x2ef9                       
  04de  170359         LBSR 0x083a                       
  04e1  AD9FFE16       JSR [0xfe16]                      
  04e5  39             RTS                               

; ---- function FUN_M70_r5_00000__04e6
FUN_M70_r5_00000__04e6:
  04e6  173476         LBSR 0x395f                       
  04e9  17037C         LBSR 0x0868                       
  04ec  AD9FFDE8       JSR [0xfde8]                      
  04f0  39             RTS                               

; ---- function FUN_M70_r5_00000__04f1
FUN_M70_r5_00000__04f1:
  04f1  17370A         LBSR 0x3bfe                       
  04f4  170371         LBSR 0x0868                       
  04f7  AD9FFE14       JSR [0xfe14]                      
  04fb  39             RTS                               

; ---- function FUN_M70_r5_00000__04fc
FUN_M70_r5_00000__04fc:
  04fc  1737A9         LBSR 0x3ca8                       
  04ff  170366         LBSR 0x0868                       
  0502  AD9FFE16       JSR [0xfe16]                      
  0506  39             RTS                               

; ---- function FUN_M70_r5_00000__0507
FUN_M70_r5_00000__0507:
  0507  170BB3         LBSR 0x10bd                       
  050a  170394         LBSR 0x08a1                       
  050d  AD9FFE10       JSR [0xfe10]                      
  0511  39             RTS                               

; ---- function FUN_M70_r5_00000__0512
FUN_M70_r5_00000__0512:
  0512  170C56         LBSR 0x116b                       
  0515  170389         LBSR 0x08a1                       
  0518  AD9FFE12       JSR [0xfe12]                      
  051c  39             RTS                               

; ---- function FUN_M70_r5_00000__051d
FUN_M70_r5_00000__051d:
  051d  170CF9         LBSR 0x1219                       
  0520  1703BD         LBSR 0x08e0                       
  0523  AD9FFE10       JSR [0xfe10]                      
  0527  39             RTS                               

; ---- function FUN_M70_r5_00000__0528
FUN_M70_r5_00000__0528:
  0528  170D69         LBSR 0x1294                       
  052b  1703B2         LBSR 0x08e0                       
  052e  AD9FFE12       JSR [0xfe12]                      
  0532  39             RTS                               

; ---- function FUN_M70_r5_00000__0533
FUN_M70_r5_00000__0533:
  0533  170DD9         LBSR 0x130f                       
  0536  1703E2         LBSR 0x091b                       
  0539  AD9FFE10       JSR [0xfe10]                      
  053d  39             RTS                               

; ---- function FUN_M70_r5_00000__053e
FUN_M70_r5_00000__053e:
  053e  170E49         LBSR 0x138a                       
  0541  1703D7         LBSR 0x091b                       
  0544  AD9FFE12       JSR [0xfe12]                      
  0548  39             RTS                               

; ---- function FUN_M70_r5_00000__0549
FUN_M70_r5_00000__0549:
  0549  173111         LBSR 0x365d                       
  054c  170449         LBSR 0x0998                       
  054f  AD9FFE10       JSR [0xfe10]                      
  0553  39             RTS                               

; ---- function FUN_M70_r5_00000__0554
FUN_M70_r5_00000__0554:
  0554  1731BC         LBSR 0x3713                       
  0557  17043E         LBSR 0x0998                       
  055a  AD9FFE14       JSR [0xfe14]                      
  055e  39             RTS                               

; ---- function FUN_M70_r5_00000__055f
FUN_M70_r5_00000__055f:
  055f  173267         LBSR 0x37c9                       
  0562  170433         LBSR 0x0998                       
  0565  AD9FFE12       JSR [0xfe12]                      
  0569  39             RTS                               

; ---- function FUN_M70_r5_00000__056a
FUN_M70_r5_00000__056a:
  056a  1732EC         LBSR 0x3859                       
  056d  170428         LBSR 0x0998                       
  0570  AD9FFE16       JSR [0xfe16]                      
  0574  39             RTS                               

; ---- function FUN_M70_r5_00000__0575
FUN_M70_r5_00000__0575:
  0575  1721D9         LBSR 0x2751                       
  0578  170456         LBSR 0x09d1                       
  057b  AD9FFE10       JSR [0xfe10]                      
  057f  39             RTS                               

; ---- function FUN_M70_r5_00000__0580
FUN_M70_r5_00000__0580:
  0580  172259         LBSR 0x27dc                       
  0583  17044B         LBSR 0x09d1                       
  0586  AD9FFE12       JSR [0xfe12]                      
  058a  39             RTS                               

; ---- function FUN_M70_r5_00000__058b
FUN_M70_r5_00000__058b:
  058b  1722D9         LBSR 0x2867                       
  058e  170479         LBSR 0x0a0a                       
  0591  AD9FFE10       JSR [0xfe10]                      
  0595  39             RTS                               

; ---- function FUN_M70_r5_00000__0596
FUN_M70_r5_00000__0596:
  0596  172359         LBSR 0x28f2                       
  0599  17046E         LBSR 0x0a0a                       
  059c  AD9FFE12       JSR [0xfe12]                      
  05a0  39             RTS                               

; ---- function FUN_M70_r5_00000__05a1
FUN_M70_r5_00000__05a1:
  05a1  1723D9         LBSR 0x297d                       
  05a4  17049C         LBSR 0x0a43                       
  05a7  AD9FFE10       JSR [0xfe10]                      
  05ab  39             RTS                               

; ---- function FUN_M70_r5_00000__05ac
FUN_M70_r5_00000__05ac:
  05ac  172459         LBSR 0x2a08                       
  05af  170491         LBSR 0x0a43                       
  05b2  AD9FFE12       JSR [0xfe12]                      
  05b6  39             RTS                               

; ---- function FUN_M70_r5_00000__05b7
FUN_M70_r5_00000__05b7:
  05b7  1724D9         LBSR 0x2a93                       
  05ba  1704BF         LBSR 0x0a7c                       
  05bd  AD9FFE10       JSR [0xfe10]                      
  05c1  39             RTS                               

; ---- function FUN_M70_r5_00000__05c2
FUN_M70_r5_00000__05c2:
  05c2  172559         LBSR 0x2b1e                       
  05c5  1704B4         LBSR 0x0a7c                       
  05c8  AD9FFE12       JSR [0xfe12]                      
  05cc  39             RTS                               

; ---- function FUN_M70_r5_00000__05cd
FUN_M70_r5_00000__05cd:
  05cd  170698         LBSR 0x0c68                       
  05d0  17051B         LBSR 0x0aee                       
  05d3  AD9FFE12       JSR [0xfe12]                      
  05d7  39             RTS                               

; ---- function FUN_M70_r5_00000__05d8
FUN_M70_r5_00000__05d8:
  05d8  170753         LBSR 0x0d2e                       
  05db  170510         LBSR 0x0aee                       
  05de  AD9FFE14       JSR [0xfe14]                      
  05e2  39             RTS                               

; ---- function FUN_M70_r5_00000__05e3
FUN_M70_r5_00000__05e3:
  05e3  170816         LBSR 0x0dfc                       
  05e6  17053E         LBSR 0x0b27                       
  05e9  AD9FFE12       JSR [0xfe12]                      
  05ed  39             RTS                               

; ---- function FUN_M70_r5_00000__05ee
FUN_M70_r5_00000__05ee:
  05ee  1708D1         LBSR 0x0ec2                       
  05f1  170533         LBSR 0x0b27                       
  05f4  AD9FFE14       JSR [0xfe14]                      
  05f8  39             RTS                               

; ---- function FUN_M70_r5_00000__05f9
FUN_M70_r5_00000__05f9:
  05f9  17096B         LBSR 0x0f67                       
  05fc  1704EF         LBSR 0x0aee                       
  05ff  AD9FFE16       JSR [0xfe16]                      
  0603  39             RTS                               

; ---- function FUN_M70_r5_00000__0604
FUN_M70_r5_00000__0604:
  0604  170A0B         LBSR 0x1012                       
  0607  17051D         LBSR 0x0b27                       
  060a  AD9FFE16       JSR [0xfe16]                      
  060e  39             RTS                               

; ---- function FUN_M70_r5_00000__060f
FUN_M70_r5_00000__060f:
  060f  172A69         LBSR 0x307b                       
  0612  17054B         LBSR 0x0b60                       
  0615  AD9FFE10       JSR [0xfe10]                      
  0619  39             RTS                               

; ---- function FUN_M70_r5_00000__061a
FUN_M70_r5_00000__061a:
  061a  172C0E         LBSR 0x322b                       
  061d  170540         LBSR 0x0b60                       
  0620  AD9FFE12       JSR [0xfe12]                      
  0624  39             RTS                               

; ---- function FUN_M70_r5_00000__0625
FUN_M70_r5_00000__0625:
  0625  172B2B         LBSR 0x3153                       
  0628  170535         LBSR 0x0b60                       
  062b  AD9FFE14       JSR [0xfe14]                      
  062f  39             RTS                               

; ---- function FUN_M70_r5_00000__0630
FUN_M70_r5_00000__0630:
  0630  172CCE         LBSR 0x3301                       
  0633  17052A         LBSR 0x0b60                       
  0636  AD9FFE16       JSR [0xfe16]                      
  063a  39             RTS                               

; ---- function FUN_M70_r5_00000__063b
FUN_M70_r5_00000__063b:
  063b  172AA9         LBSR 0x30e7                       
  063e  170558         LBSR 0x0b99                       
  0641  AD9FFE10       JSR [0xfe10]                      
  0645  39             RTS                               

; ---- function FUN_M70_r5_00000__0646
FUN_M70_r5_00000__0646:
  0646  172C4D         LBSR 0x3296                       
  0649  17054D         LBSR 0x0b99                       
  064c  AD9FFE12       JSR [0xfe12]                      
  0650  39             RTS                               

; ---- function FUN_M70_r5_00000__0651
FUN_M70_r5_00000__0651:
  0651  172B6B         LBSR 0x31bf                       
  0654  170542         LBSR 0x0b99                       
  0657  AD9FFE14       JSR [0xfe14]                      
  065b  39             RTS                               

; ---- function FUN_M70_r5_00000__065c
FUN_M70_r5_00000__065c:
  065c  172D0D         LBSR 0x336c                       
  065f  170537         LBSR 0x0b99                       
  0662  AD9FFE16       JSR [0xfe16]                      
  0666  39             RTS                               

; ---- function FUN_M70_r5_00000__0667
FUN_M70_r5_00000__0667:
  0667  172D6D         LBSR 0x33d7                       
  066a  170565         LBSR 0x0bd2                       
  066d  AD9FFE10       JSR [0xfe10]                      
  0671  39             RTS                               

; ---- function FUN_M70_r5_00000__0672
FUN_M70_r5_00000__0672:
  0672  172DCD         LBSR 0x3442                       
  0675  17055A         LBSR 0x0bd2                       
  0678  AD9FFE12       JSR [0xfe12]                      
  067c  39             RTS                               

; ---- function FUN_M70_r5_00000__067d
FUN_M70_r5_00000__067d:
  067d  170E57         LBSR 0x14d7                       
  0680  170432         LBSR 0x0ab5                       
  0683  AD9FFE10       JSR [0xfe10]                      
  0687  39             RTS                               

; ---- function FUN_M70_r5_00000__0688
FUN_M70_r5_00000__0688:
  0688  170D48         LBSR 0x13d3                       
  068b  170427         LBSR 0x0ab5                       
  068e  AD9FFE12       JSR [0xfe12]                      
  0692  39             RTS                               

; ---- function FUN_M70_r5_00000__0693
FUN_M70_r5_00000__0693:
  0693  170F14         LBSR 0x15aa                       
  0696  17041C         LBSR 0x0ab5                       
  0699  AD9FFE14       JSR [0xfe14]                      
  069d  39             RTS                               

; ---- function FUN_M70_r5_00000__069e
FUN_M70_r5_00000__069e:
  069e  3476           PSHS  U Y X B A                   
  06a0  1A40           ORCC #0x40                        
  06a2  CC06C3         LDD #0x6c3                        
  06a5  F3600D         ADDD 0x600d                       
  06a8  1F01           TFR D,X                           
  06aa  CC06F2         LDD #0x6f2                        
  06ad  F3600D         ADDD 0x600d                       
  06b0  1F03           TFR D,U                           
  06b2  108E6600       LDY #0x6600                       
  06b6  AD9FFD08       JSR [0xfd08]                      
  06ba  AD9FFD76       JSR [0xfd76]                      
  06be  1CBF           ANDCC #0xbf                       
  06c0  3576           PULS  A B X Y U                   
  06c2  39             RTS                               

; ---- function FUN_M70_r5_00000__06c3
FUN_M70_r5_00000__06c3:
  06c3  3436           PSHS  Y X B A                     
  06c5  3401           PSHS  CC                          
  06c7  AD9FFC54       JSR [0xfc54]                      
  06cb  FC7174         LDD 0x7174                        
  06ce  2615           BNE 0x06e5                        
  06d0  CC06F2         LDD #0x6f2                        
  06d3  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  06d7  6013           addr 6013                         
LAB_M70_r5_00000__06d9:
  06d9  AD9FFC56       JSR [0xfc56]                      
  06dd  3501           PULS CC                           
  06df  3536           PULS  A B X Y                     
  06e1  3261           LEAS 0x1,S                        
  06e3  3580           PULS  PC                          
LAB_M70_r5_00000__06e5:
  06e5  AD9FFD76       JSR [0xfd76]                      
  06e9  AD9FFC56       JSR [0xfc56]                      
  06ed  3501           PULS CC                           
  06ef  3536           PULS  A B X Y                     
  06f1  3B             RTI                               

; ---- function FUN_M70_r5_00000__06f2
FUN_M70_r5_00000__06f2:
  06f2  3436           PSHS  Y X B A                     
  06f4  CC000A         LDD #0xa                          
  06f7  AD9FFD20       JSR [0xfd20]                      
  06fb  108E0428       LDY #0x428                        
  06ff  FC7184         LDD 0x7184                        
  0702  AD9FFD2E       JSR [0xfd2e]                      
  0706  CC000A         LDD #0xa                          
  0709  AD9FFD20       JSR [0xfd20]                      
  070d  108E0429       LDY #0x429                        
  0711  FC7186         LDD 0x7186                        
  0714  AD9FFD2E       JSR [0xfd2e]                      
  0718  CC000A         LDD #0xa                          
  071b  AD9FFD20       JSR [0xfd20]                      
  071f  108E042A       LDY #0x42a                        
  0723  FC7188         LDD 0x7188                        
  0726  AD9FFD2E       JSR [0xfd2e]                      
  072a  CC000A         LDD #0xa                          
  072d  AD9FFD20       JSR [0xfd20]                      
  0731  108E042B       LDY #0x42b                        
  0735  FC718A         LDD 0x718a                        
  0738  AD9FFD2E       JSR [0xfd2e]                      
  073c  CC000A         LDD #0xa                          
  073f  AD9FFD20       JSR [0xfd20]                      
  0743  108E042C       LDY #0x42c                        
  0747  FC718C         LDD 0x718c                        
  074a  AD9FFD2E       JSR [0xfd2e]                      
  074e  CC000A         LDD #0xa                          
  0751  AD9FFD20       JSR [0xfd20]                      
  0755  108E0426       LDY #0x426                        
  0759  FC71A2         LDD 0x71a2                        
  075c  AD9FFD2E       JSR [0xfd2e]                      
  0760  CC000A         LDD #0xa                          
  0763  AD9FFD20       JSR [0xfd20]                      
  0767  108E0421       LDY #0x421                        
  076b  FC7190         LDD 0x7190                        
  076e  AD9FFD2E       JSR [0xfd2e]                      
  0772  CC000A         LDD #0xa                          
  0775  AD9FFD20       JSR [0xfd20]                      
  0779  108E0422       LDY #0x422                        
  077d  FC7192         LDD 0x7192                        
  0780  AD9FFD2E       JSR [0xfd2e]                      
  0784  CC000A         LDD #0xa                          
  0787  AD9FFD20       JSR [0xfd20]                      
  078b  108E0423       LDY #0x423                        
  078f  FC7194         LDD 0x7194                        
  0792  AD9FFD2E       JSR [0xfd2e]                      
  0796  CC000A         LDD #0xa                          
  0799  AD9FFD20       JSR [0xfd20]                      
  079d  108E0424       LDY #0x424                        
  07a1  FC7196         LDD 0x7196                        
  07a4  AD9FFD2E       JSR [0xfd2e]                      
  07a8  CC000A         LDD #0xa                          
  07ab  AD9FFD20       JSR [0xfd20]                      
  07af  108E0420       LDY #0x420                        
  07b3  FC719A         LDD 0x719a                        
  07b6  AD9FFD2E       JSR [0xfd2e]                      
  07ba  CC000A         LDD #0xa                          
  07bd  AD9FFD20       JSR [0xfd20]                      
  07c1  108E0425       LDY #0x425                        
  07c5  FC719C         LDD 0x719c                        
  07c8  AD9FFD2E       JSR [0xfd2e]                      
  07cc  CC000A         LDD #0xa                          
  07cf  AD9FFD20       JSR [0xfd20]                      
  07d3  108E042D       LDY #0x42d                        
  07d7  FC7084         LDD 0x7084                        
  07da  AD9FFD2E       JSR [0xfd2e]                      
  07de  CC0C04         LDD #0xc04                        
  07e1  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  07e5  6013           addr 6013                         
LAB_M70_r5_00000__07e7:
  07e7  CCFFFF         LDD #0xffff                       
  07ea  FD7174         STD 0x7174                        
  07ed  AD9FFD76       JSR [0xfd76]                      
  07f1  1CBF           ANDCC #0xbf                       
  07f3  3536           PULS  A B X Y                     
  07f5  39             RTS                               

; ---- function FUN_M70_r5_00000__07f6
FUN_M70_r5_00000__07f6:
  07f6  AD9FFE18       JSR [0xfe18]                      
  07fa  AD9FFD7C       JSR [0xfd7c]                      
  07fe  39             RTS                               

; ---- function FUN_M70_r5_00000__07ff
FUN_M70_r5_00000__07ff:
  07ff  AD9FFDFC       JSR [0xfdfc]                      
  0803  39             RTS                               
LAB_M70_r5_00000__0804:
  0804  C600           LDB #0x0                          
  0806  AD9FFC36       JSR [0xfc36]                      
  080a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  080e  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M70_r5_00000__0837:
  0837  3577           PULS CC A B X Y U                 
  0839  39             RTS                               

; ---- function FUN_M70_r5_00000__083a
FUN_M70_r5_00000__083a:
  083a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] " speed  " "program " [*]
  083e  01             db 1h                             
  083f  207370656564.. ds " speed  "                     
  0847  70726F677261.. ds "program "                     
  084f  01             db 1h                             
LAB_M70_r5_00000__0850:
  0850  AD9FFDF2       JSR [0xfdf2]                      
  0854  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3974 ->$3BF2 ->$3C9C ->$0C04 ->$08A1 ->$0868
  0858  3974           addr M70_r5_00000::3974           
  085a  3BF2           addr M70_r5_00000::3bf2           
  085c  3C9C           addr M70_r5_00000::3c9c           
  085e  0C04           addr M70_r5_00000::0c04           
  0860  08A1           addr M70_r5_00000::08a1           
  0862  0868           addr M70_r5_00000::0868           
LAB_M70_r5_00000__0864:
  0864  173158         LBSR 0x39bf                       
  0867  39             RTS                               

; ---- function FUN_M70_r5_00000__0868
FUN_M70_r5_00000__0868:
  0868  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "trigger1" "trigger2" "trigger3" "trigger4"
  086c  747269676765.. ds "trigger1"                     
  0874  747269676765.. ds "trigger2"                     
  087c  747269676765.. ds "trigger3"                     
  0884  747269676765.. ds "trigger4"                     
LAB_M70_r5_00000__088c:
  088c  AD9FFDF2       JSR [0xfdf2]                      
  0890  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2D0C ->$2DBA ->$2E68 ->$2F16 ->$083A ->$08A1
  0894  2D0C           addr M70_r5_00000::2d0c           
  0896  2DBA           addr M70_r5_00000::2dba           
  0898  2E68           addr M70_r5_00000::2e68           
  089a  2F16           addr M70_r5_00000::2f16           
  089c  083A           addr M70_r5_00000::083a           
  089e  08A1           addr M70_r5_00000::08a1           
LAB_M70_r5_00000__08a0:
  08a0  39             RTS                               

; ---- function FUN_M70_r5_00000__08a1
FUN_M70_r5_00000__08a1:
  08a1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" " levels " " expert "
  08a5  6C656674206D.. ds "left mix"                     
  08ad  72696768746D.. ds "rightmix"                     
  08b5  206C6576656C.. ds " levels "                     
  08bd  206578706572.. ds " expert "                     
LAB_M70_r5_00000__08c5:
  08c5  AD9FFDF2       JSR [0xfdf2]                      
  08c9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$10B1 ->$115F ->$08E0 ->$0956 ->$0868 ->$083A
  08cd  10B1           addr M70_r5_00000::10b1           
  08cf  115F           addr M70_r5_00000::115f           
  08d1  08E0           addr M70_r5_00000::08e0           
  08d3  0956           addr M70_r5_00000::0956           
  08d5  0868           addr M70_r5_00000::0868           
  08d7  083A           addr M70_r5_00000::083a           
LAB_M70_r5_00000__08d9:
  08d9  CC08A1         LDD #0x8a1                        
  08dc  FD71B4         STD 0x71b4                        
  08df  39             RTS                               

; ---- function FUN_M70_r5_00000__08e0
FUN_M70_r5_00000__08e0:
  08e0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  08e4  6C6566742069.. ds "left in "                     
  08ec  726967687420.. ds "right in"                     
  08f4  01             db 1h                             
  08f5  207265747572.. ds " return "                     
LAB_M70_r5_00000__08fd:
  08fd  AD9FFDF2       JSR [0xfdf2]                      
  0901  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$120D ->$1288 ->$0C04 ->$0C04 ->$091B ->$091B
  0905  120D           addr M70_r5_00000::120d           
  0907  1288           addr M70_r5_00000::1288           
  0909  0C04           addr M70_r5_00000::0c04           
  090b  0C04           addr M70_r5_00000::0c04           
  090d  091B           addr M70_r5_00000::091b           
  090f  091B           addr M70_r5_00000::091b           
LAB_M70_r5_00000__0911:
  0911  FC71B4         LDD 0x71b4                        
  0914  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0918  60E9           addr 60e9                         
LAB_M70_r5_00000__091a:
  091a  39             RTS                               

; ---- function FUN_M70_r5_00000__091b
FUN_M70_r5_00000__091b:
  091b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  091f  6C656674206F.. ds "left out"                     
  0927  72696768746F.. ds "rightout"                     
  092f  01             db 1h                             
  0930  207265747572.. ds " return "                     
LAB_M70_r5_00000__0938:
  0938  AD9FFDF2       JSR [0xfdf2]                      
  093c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1303 ->$137E ->$0C04 ->$0C04 ->$08E0 ->$08E0
  0940  1303           addr M70_r5_00000::1303           
  0942  137E           addr M70_r5_00000::137e           
  0944  0C04           addr M70_r5_00000::0c04           
  0946  0C04           addr M70_r5_00000::0c04           
  0948  08E0           addr M70_r5_00000::08e0           
  094a  08E0           addr M70_r5_00000::08e0           
LAB_M70_r5_00000__094c:
  094c  FC71B4         LDD 0x71b4                        
  094f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0953  60E9           addr 60e9                         
LAB_M70_r5_00000__0955:
  0955  39             RTS                               

; ---- function FUN_M70_r5_00000__0956
FUN_M70_r5_00000__0956:
  0956  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "triggers" " sweeps " "deglitch" " return "
  095a  747269676765.. ds "triggers"                     
  0962  207377656570.. ds " sweeps "                     
  096a  6465676C6974.. ds "deglitch"                     
  0972  207265747572.. ds " return "                     
LAB_M70_r5_00000__097a:
  097a  AD9FFDF2       JSR [0xfdf2]                      
  097e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0998 ->$0AEE ->$0AB5 ->$0C04 ->$0956 ->$0956
  0982  0998           addr M70_r5_00000::0998           
  0984  0AEE           addr M70_r5_00000::0aee           
  0986  0AB5           addr M70_r5_00000::0ab5           
  0988  0C04           addr M70_r5_00000::0c04           
  098a  0956           addr M70_r5_00000::0956           
  098c  0956           addr M70_r5_00000::0956           
LAB_M70_r5_00000__098e:
  098e  FC71B4         LDD 0x71b4                        
  0991  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0995  60E9           addr 60e9                         
LAB_M70_r5_00000__0997:
  0997  39             RTS                               

; ---- function FUN_M70_r5_00000__0998
FUN_M70_r5_00000__0998:
  0998  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "length 1" "count 1 " "length 2" "count 2 "
  099c  6C656E677468.. ds "length 1"                     
  09a4  636F756E7420.. ds "count 1 "                     
  09ac  6C656E677468.. ds "length 2"                     
  09b4  636F756E7420.. ds "count 2 "                     
LAB_M70_r5_00000__09bc:
  09bc  AD9FFDF2       JSR [0xfdf2]                      
  09c0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3651 ->$37BD ->$3707 ->$384D ->$09D1 ->$0A7C
  09c4  3651           addr M70_r5_00000::3651           
  09c6  37BD           addr M70_r5_00000::37bd           
  09c8  3707           addr M70_r5_00000::3707           
  09ca  384D           addr M70_r5_00000::384d           
  09cc  09D1           addr M70_r5_00000::09d1           
  09ce  0A7C           addr M70_r5_00000::0a7c           
LAB_M70_r5_00000__09d0:
  09d0  39             RTS                               

; ---- function FUN_M70_r5_00000__09d1
FUN_M70_r5_00000__09d1:
  09d1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "trig 1a " "trig 1b " "trigger1" " return "
  09d5  747269672031.. ds "trig 1a "                     
  09dd  747269672031.. ds "trig 1b "                     
  09e5  747269676765.. ds "trigger1"                     
  09ed  207265747572.. ds " return "                     
LAB_M70_r5_00000__09f5:
  09f5  AD9FFDF2       JSR [0xfdf2]                      
  09f9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2745 ->$27D0 ->$2D0C ->$0956 ->$0A0A ->$0998
  09fd  2745           addr M70_r5_00000::2745           
  09ff  27D0           addr M70_r5_00000::27d0           
  0a01  2D0C           addr M70_r5_00000::2d0c           
  0a03  0956           addr M70_r5_00000::0956           
  0a05  0A0A           addr M70_r5_00000::0a0a           
  0a07  0998           addr M70_r5_00000::0998           
LAB_M70_r5_00000__0a09:
  0a09  39             RTS                               

; ---- function FUN_M70_r5_00000__0a0a
FUN_M70_r5_00000__0a0a:
  0a0a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "trig 2a " "trig 2b " "trigger2" " return "
  0a0e  747269672032.. ds "trig 2a "                     
  0a16  747269672032.. ds "trig 2b "                     
  0a1e  747269676765.. ds "trigger2"                     
  0a26  207265747572.. ds " return "                     
LAB_M70_r5_00000__0a2e:
  0a2e  AD9FFDF2       JSR [0xfdf2]                      
  0a32  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$285B ->$28E6 ->$2DBA ->$0956 ->$0A43 ->$09D1
  0a36  285B           addr M70_r5_00000::285b           
  0a38  28E6           addr M70_r5_00000::28e6           
  0a3a  2DBA           addr M70_r5_00000::2dba           
  0a3c  0956           addr M70_r5_00000::0956           
  0a3e  0A43           addr M70_r5_00000::0a43           
  0a40  09D1           addr M70_r5_00000::09d1           
LAB_M70_r5_00000__0a42:
  0a42  39             RTS                               

; ---- function FUN_M70_r5_00000__0a43
FUN_M70_r5_00000__0a43:
  0a43  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "trig 3a " "trig 3b " "trigger3" " return "
  0a47  747269672033.. ds "trig 3a "                     
  0a4f  747269672033.. ds "trig 3b "                     
  0a57  747269676765.. ds "trigger3"                     
  0a5f  207265747572.. ds " return "                     
LAB_M70_r5_00000__0a67:
  0a67  AD9FFDF2       JSR [0xfdf2]                      
  0a6b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2971 ->$29FC ->$2E68 ->$0956 ->$0A7C ->$0A0A
  0a6f  2971           addr M70_r5_00000::2971           
  0a71  29FC           addr M70_r5_00000::29fc           
  0a73  2E68           addr M70_r5_00000::2e68           
  0a75  0956           addr M70_r5_00000::0956           
  0a77  0A7C           addr M70_r5_00000::0a7c           
  0a79  0A0A           addr M70_r5_00000::0a0a           
LAB_M70_r5_00000__0a7b:
  0a7b  39             RTS                               

; ---- function FUN_M70_r5_00000__0a7c
FUN_M70_r5_00000__0a7c:
  0a7c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "trig 4a " "trig 4b " "trigger4" " return "
  0a80  747269672034.. ds "trig 4a "                     
  0a88  747269672034.. ds "trig 4b "                     
  0a90  747269676765.. ds "trigger4"                     
  0a98  207265747572.. ds " return "                     
LAB_M70_r5_00000__0aa0:
  0aa0  AD9FFDF2       JSR [0xfdf2]                      
  0aa4  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2A87 ->$2B12 ->$2F16 ->$0956 ->$0998 ->$0A43
  0aa8  2A87           addr M70_r5_00000::2a87           
  0aaa  2B12           addr M70_r5_00000::2b12           
  0aac  2F16           addr M70_r5_00000::2f16           
  0aae  0956           addr M70_r5_00000::0956           
  0ab0  0998           addr M70_r5_00000::0998           
  0ab2  0A43           addr M70_r5_00000::0a43           
LAB_M70_r5_00000__0ab4:
  0ab4  39             RTS                               

; ---- function FUN_M70_r5_00000__0ab5
FUN_M70_r5_00000__0ab5:
  0ab5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "low note" "highnote" " source " " return "
  0ab9  6C6F77206E6F.. ds "low note"                     
  0ac1  686967686E6F.. ds "highnote"                     
  0ac9  20736F757263.. ds " source "                     
  0ad1  207265747572.. ds " return "                     
LAB_M70_r5_00000__0ad9:
  0ad9  AD9FFDF2       JSR [0xfdf2]                      
  0add  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$14FB ->$13F7 ->$15CE ->$0956 ->$0AB5 ->$0AB5
  0ae1  14FB           addr M70_r5_00000::14fb           
  0ae3  13F7           addr M70_r5_00000::13f7           
  0ae5  15CE           addr M70_r5_00000::15ce           
  0ae7  0956           addr M70_r5_00000::0956           
  0ae9  0AB5           addr M70_r5_00000::0ab5           
  0aeb  0AB5           addr M70_r5_00000::0ab5           
LAB_M70_r5_00000__0aed:
  0aed  39             RTS                               

; ---- function FUN_M70_r5_00000__0aee
FUN_M70_r5_00000__0aee:
  0aee  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l coarse" "l fine  " "l delay " "l fdback"
  0af2  6C20636F6172.. ds "l coarse"                     
  0afa  6C2066696E65.. ds "l fine  "                     
  0b02  6C2064656C61.. ds "l delay "                     
  0b0a  6C2066646261.. ds "l fdback"                     
LAB_M70_r5_00000__0b12:
  0b12  AD9FFDF2       JSR [0xfdf2]                      
  0b16  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C0D ->$0C80 ->$0D22 ->$0F5B ->$0B27 ->$0BD2
  0b1a  0C0D           addr M70_r5_00000::0c0d           
  0b1c  0C80           addr M70_r5_00000::0c80           
  0b1e  0D22           addr M70_r5_00000::0d22           
  0b20  0F5B           addr M70_r5_00000::0f5b           
  0b22  0B27           addr M70_r5_00000::0b27           
  0b24  0BD2           addr M70_r5_00000::0bd2           
LAB_M70_r5_00000__0b26:
  0b26  39             RTS                               

; ---- function FUN_M70_r5_00000__0b27
FUN_M70_r5_00000__0b27:
  0b27  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r coarse" "r fine  " "r delay " "r fdback"
  0b2b  7220636F6172.. ds "r coarse"                     
  0b33  722066696E65.. ds "r fine  "                     
  0b3b  722064656C61.. ds "r delay "                     
  0b43  722066646261.. ds "r fdback"                     
LAB_M70_r5_00000__0b4b:
  0b4b  AD9FFDF2       JSR [0xfdf2]                      
  0b4f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0DA1 ->$0E14 ->$0EB6 ->$1006 ->$0B60 ->$0AEE
  0b53  0DA1           addr M70_r5_00000::0da1           
  0b55  0E14           addr M70_r5_00000::0e14           
  0b57  0EB6           addr M70_r5_00000::0eb6           
  0b59  1006           addr M70_r5_00000::1006           
  0b5b  0B60           addr M70_r5_00000::0b60           
  0b5d  0AEE           addr M70_r5_00000::0aee           
LAB_M70_r5_00000__0b5f:
  0b5f  39             RTS                               

; ---- function FUN_M70_r5_00000__0b60
FUN_M70_r5_00000__0b60:
  0b60  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "up1 rate" "up1 max " "dn1 rate" "dn1 min "
  0b64  757031207261.. ds "up1 rate"                     
  0b6c  757031206D61.. ds "up1 max "                     
  0b74  646E31207261.. ds "dn1 rate"                     
  0b7c  646E31206D69.. ds "dn1 min "                     
LAB_M70_r5_00000__0b84:
  0b84  AD9FFDF2       JSR [0xfdf2]                      
  0b88  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$306F ->$321F ->$3147 ->$32F5 ->$0B99 ->$0B27
  0b8c  306F           addr M70_r5_00000::306f           
  0b8e  321F           addr M70_r5_00000::321f           
  0b90  3147           addr M70_r5_00000::3147           
  0b92  32F5           addr M70_r5_00000::32f5           
  0b94  0B99           addr M70_r5_00000::0b99           
  0b96  0B27           addr M70_r5_00000::0b27           
LAB_M70_r5_00000__0b98:
  0b98  39             RTS                               

; ---- function FUN_M70_r5_00000__0b99
FUN_M70_r5_00000__0b99:
  0b99  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "up2 rate" "up2 max " "dn2 rate" "dn2 min "
  0b9d  757032207261.. ds "up2 rate"                     
  0ba5  757032206D61.. ds "up2 max "                     
  0bad  646E32207261.. ds "dn2 rate"                     
  0bb5  646E32206D69.. ds "dn2 min "                     
LAB_M70_r5_00000__0bbd:
  0bbd  AD9FFDF2       JSR [0xfdf2]                      
  0bc1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$30DB ->$328A ->$31B3 ->$3360 ->$0BD2 ->$0B60
  0bc5  30DB           addr M70_r5_00000::30db           
  0bc7  328A           addr M70_r5_00000::328a           
  0bc9  31B3           addr M70_r5_00000::31b3           
  0bcb  3360           addr M70_r5_00000::3360           
  0bcd  0BD2           addr M70_r5_00000::0bd2           
  0bcf  0B60           addr M70_r5_00000::0b60           
LAB_M70_r5_00000__0bd1:
  0bd1  39             RTS                               

; ---- function FUN_M70_r5_00000__0bd2
FUN_M70_r5_00000__0bd2:
  0bd2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "rand1max" "rand2max" [*] " return "
  0bd6  72616E64316D.. ds "rand1max"                     
  0bde  72616E64326D.. ds "rand2max"                     
  0be6  01             db 1h                             
  0be7  207265747572.. ds " return "                     
LAB_M70_r5_00000__0bef:
  0bef  AD9FFDF2       JSR [0xfdf2]                      
  0bf3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$33CB ->$3436 ->$0C04 ->$0956 ->$0AEE ->$0B99
  0bf7  33CB           addr M70_r5_00000::33cb           
  0bf9  3436           addr M70_r5_00000::3436           
  0bfb  0C04           addr M70_r5_00000::0c04           
  0bfd  0956           addr M70_r5_00000::0956           
  0bff  0AEE           addr M70_r5_00000::0aee           
  0c01  0B99           addr M70_r5_00000::0b99           
LAB_M70_r5_00000__0c03:
  0c03  39             RTS                               

; ---- function FUN_M70_r5_00000__0c04
FUN_M70_r5_00000__0c04:
  0c04  39             RTS                               

;; Module 70 code record 02, 4501 bytes, entered at payload start
MODULE_70_02_CODE_hdr:
  0c05  7002119D0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_70_02_entry
MODULE_70_02_entry:
  0c0d  3476           PSHS  U Y X B A                   
  0c0f  17006E         LBSR 0x0c80                       
  0c12  CC0064         LDD #0x64                         
  0c15  FD60DC         STD 0x60dc                        
  0c18  FD60DE         STD 0x60de                        
  0c1b  3576           PULS  A B X Y U                   
  0c1d  39             RTS                               
PTR_FUN_M70_r5_00000__0ccf_M70_r5_00000__0c1e:
  0c1e  0CCF           addr M70_r5_00000::0ccf           
  0c20  0CA4           addr M70_r5_00000::0ca4           
  0c22  .db 0C 74 70 26 70 28 00 00 70 2A 00 08 00 81 19 F6  ; .tp&p(..p*......
  0c32  .db A0 04 B0 00 01 00 05 11 0C 44 00 00 00 00 70 2C  ; .........D....p,
  0c42  .db 00 83 05 6C 65 66 74 20 70 69 74 63 68 3A 20 20  ; ...left pitch:  
  0c52  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  0c62  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M70_r5_00000__0c68
FUN_M70_r5_00000__0c68:
  0c68  3410           PSHS  X                           
  0c6a  8E0C1E         LDX #0xc1e                         ; desc[API_FDBC]: ->$0CCF ->$0CA4
  0c6d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0c71  3510           PULS  X                           
  0c73  39             RTS                               

; ---- function FUN_M70_r5_00000__0c74
FUN_M70_r5_00000__0c74:
  0c74  3410           PSHS  X                           
  0c76  8E0C1E         LDX #0xc1e                         ; desc[API_FE6C]: ->$0CCF ->$0CA4
  0c79  AD9FFE6C       JSR [0xfe6c]                      
  0c7d  3510           PULS  X                           
  0c7f  39             RTS                               

; ---- function FUN_M70_r5_00000__0c80
FUN_M70_r5_00000__0c80:
  0c80  3410           PSHS  X                           
  0c82  8E0C1E         LDX #0xc1e                         ; desc[API_FE6A]: ->$0CCF ->$0CA4
  0c85  AD9FFE6A       JSR [0xfe6a]                      
  0c89  3510           PULS  X                           
  0c8b  39             RTS                               

; ---- function FUN_M70_r5_00000__0c8c
FUN_M70_r5_00000__0c8c:
  0c8c  3410           PSHS  X                           
  0c8e  8E0C1E         LDX #0xc1e                         ; desc[API_FE1C]: ->$0CCF ->$0CA4
  0c91  AD9FFE1C       JSR [0xfe1c]                      
  0c95  3510           PULS  X                           
  0c97  39             RTS                               

; ---- function FUN_M70_r5_00000__0c98
FUN_M70_r5_00000__0c98:
  0c98  3410           PSHS  X                           
  0c9a  8E0C1E         LDX #0xc1e                         ; desc[API_FE1A]: ->$0CCF ->$0CA4 $0C74
  0c9d  AD9FFE1A       JSR [0xfe1a]                      
  0ca1  3510           PULS  X                           
  0ca3  39             RTS                               

; ---- function FUN_M70_r5_00000__0ca4
FUN_M70_r5_00000__0ca4:
  0ca4  3456           PSHS  U X B A                     
  0ca6  8E0C1E         LDX #0xc1e                         ; desc[API_FE6E]: ->$0CCF ->$0CA4
  0ca9  AD9FFE6E       JSR [0xfe6e]                      
  0cad  FC7088         LDD 0x7088                        
  0cb0  3606           PSHU  B A                         
  0cb2  108E71B6       LDY #0x71b6                       
  0cb6  8603           LDA #0x3                          
  0cb8  AD9FFC40       JSR [0xfc40]                      
  0cbc  C620           LDB #0x20                         
  0cbe  AD9FFC36       JSR [0xfc36]                      
  0cc2  CC0005         LDD #0x5                          
  0cc5  8E71BA         LDX #0x71ba                       
  0cc8  AD9FFC3A       JSR [0xfc3a]                      
  0ccc  3556           PULS  A B X U                     
  0cce  39             RTS                               

; ---- function FUN_M70_r5_00000__0ccf
FUN_M70_r5_00000__0ccf:
  0ccf  3477           PSHS  U Y X B A CC                
  0cd1  8E0C1E         LDX #0xc1e                        
  0cd4  AD9FFE76       JSR [0xfe76]                      
  0cd8  FC702A         LDD 0x702a                        
  0cdb  3606           PSHU  B A                         
  0cdd  CC0064         LDD #0x64                         
  0ce0  3606           PSHU  B A                         
  0ce2  AD9FFCE6       JSR [0xfce6]                      
  0ce6  335E           LEAU -0x2,U                       
  0ce8  170B93         LBSR 0x187e                       
  0ceb  3706           PULU  A B                         
  0ced  FD7170         STD 0x7170                        
  0cf0  AD9FFD52       JSR [0xfd52]                      
  0cf4  3706           PULU  A B                         
  0cf6  FD7088         STD 0x7088                        
  0cf9  3577           PULS CC A B X Y U                 
  0cfb  39             RTS                               
PTR_FUN_M70_r5_00000__0d7f_M70_r5_00000__0cfc:
  0cfc  0D7F           addr M70_r5_00000::0d7f           
  0cfe  0D46           addr M70_r5_00000::0d46           
  0d00  .db 0D 3A 70 2E 70 30 00 00 70 32 00 08 00 85 1A 00  ; .:p.p0..p2......
  0d10  .db 00 03 E8 00 01 00 04 20 0D 6A 00 00 00 00 70 34  ; ....... .j....p4
  0d20  .db 00 87                                            ; ..

; ---- function FUN_M70_r5_00000__0d22
FUN_M70_r5_00000__0d22:
  0d22  3410           PSHS  X                           
  0d24  8E0CFC         LDX #0xcfc                         ; desc[API_FE6A]: ->$0D7F ->$0D46
  0d27  AD9FFE6A       JSR [0xfe6a]                      
  0d2b  3510           PULS  X                           
  0d2d  39             RTS                               

; ---- function FUN_M70_r5_00000__0d2e
FUN_M70_r5_00000__0d2e:
  0d2e  3410           PSHS  X                           
  0d30  8E0CFC         LDX #0xcfc                         ; desc[API_FDBC]: ->$0D7F ->$0D46
  0d33  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0d37  3510           PULS  X                           
  0d39  39             RTS                               

; ---- function FUN_M70_r5_00000__0d3a
FUN_M70_r5_00000__0d3a:
  0d3a  3410           PSHS  X                           
  0d3c  8E0CFC         LDX #0xcfc                         ; desc[API_FE6C]: ->$0D7F ->$0D46
  0d3f  AD9FFE6C       JSR [0xfe6c]                      
  0d43  3510           PULS  X                           
  0d45  39             RTS                               

; ---- function FUN_M70_r5_00000__0d46
FUN_M70_r5_00000__0d46:
  0d46  3410           PSHS  X                           
  0d48  8E0CFC         LDX #0xcfc                         ; desc[API_FE6E]: ->$0D7F ->$0D46
  0d4b  AD9FFE6E       JSR [0xfe6e]                      
  0d4f  3510           PULS  X                           
  0d51  39             RTS                               

; ---- function FUN_M70_r5_00000__0d52
FUN_M70_r5_00000__0d52:
  0d52  3410           PSHS  X                           
  0d54  8E0CFC         LDX #0xcfc                         ; desc[API_FE1C]: ->$0D7F ->$0D46
  0d57  AD9FFE1C       JSR [0xfe1c]                      
  0d5b  3510           PULS  X                           
  0d5d  39             RTS                               

; ---- function FUN_M70_r5_00000__0d5e
FUN_M70_r5_00000__0d5e:
  0d5e  3410           PSHS  X                           
  0d60  8E0CFC         LDX #0xcfc                         ; desc[API_FE1A]: ->$0D7F ->$0D46 $0D3A
  0d63  AD9FFE1A       JSR [0xfe1a]                      
  0d67  3510           PULS  X                           
  0d69  39             RTS                               
  0d6a  .db 14 6C 65 66 74 20 64 65 6C 61 79 3A 20 20 20 20  ; .left delay:    
  0d7a  .db 20 20 6D 53 20                                   ;   mS 

; ---- function FUN_M70_r5_00000__0d7f
FUN_M70_r5_00000__0d7f:
  0d7f  3476           PSHS  U Y X B A                   
  0d81  8E0CFC         LDX #0xcfc                        
  0d84  AD9FFE76       JSR [0xfe76]                      
  0d88  CC002C         LDD #0x2c                         
  0d8b  3606           PSHU  B A                         
  0d8d  FC7032         LDD 0x7032                        
  0d90  3606           PSHU  B A                         
  0d92  AD9FFCEE       JSR [0xfcee]                      
  0d96  3706           PULU  A B                         
  0d98  FD719E         STD 0x719e                        
  0d9b  17090E         LBSR 0x16ac                       
  0d9e  3576           PULS  A B X Y U                   
  0da0  39             RTS                               

; ---- function FUN_M70_r5_00000__0da1
FUN_M70_r5_00000__0da1:
  0da1  3476           PSHS  U Y X B A                   
  0da3  17006E         LBSR 0x0e14                       
  0da6  CC0064         LDD #0x64                         
  0da9  FD60DC         STD 0x60dc                        
  0dac  FD60DE         STD 0x60de                        
  0daf  3576           PULS  A B X Y U                   
  0db1  39             RTS                               
PTR_FUN_M70_r5_00000__0e63_M70_r5_00000__0db2:
  0db2  0E63           addr M70_r5_00000::0e63           
  0db4  0E38           addr M70_r5_00000::0e38           
  0db6  .db 0E 08 70 36 70 38 00 00 70 3A 00 08 00 89 1B F6  ; ..p6p8..p:......
  0dc6  .db A0 04 B0 00 01 00 05 11 0D D8 00 00 00 00 70 3C  ; ..............p<
  0dd6  .db 00 8B 05 72 69 67 68 74 20 70 69 74 63 68 3A 20  ; ...right pitch: 
  0de6  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  0df6  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M70_r5_00000__0dfc
FUN_M70_r5_00000__0dfc:
  0dfc  3410           PSHS  X                           
  0dfe  8E0DB2         LDX #0xdb2                         ; desc[API_FDBC]: ->$0E63 ->$0E38
  0e01  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0e05  3510           PULS  X                           
  0e07  39             RTS                               

; ---- function FUN_M70_r5_00000__0e08
FUN_M70_r5_00000__0e08:
  0e08  3410           PSHS  X                           
  0e0a  8E0DB2         LDX #0xdb2                         ; desc[API_FE6C]: ->$0E63 ->$0E38
  0e0d  AD9FFE6C       JSR [0xfe6c]                      
  0e11  3510           PULS  X                           
  0e13  39             RTS                               

; ---- function FUN_M70_r5_00000__0e14
FUN_M70_r5_00000__0e14:
  0e14  3410           PSHS  X                           
  0e16  8E0DB2         LDX #0xdb2                         ; desc[API_FE6A]: ->$0E63 ->$0E38
  0e19  AD9FFE6A       JSR [0xfe6a]                      
  0e1d  3510           PULS  X                           
  0e1f  39             RTS                               

; ---- function FUN_M70_r5_00000__0e20
FUN_M70_r5_00000__0e20:
  0e20  3410           PSHS  X                           
  0e22  8E0DB2         LDX #0xdb2                         ; desc[API_FE1C]: ->$0E63 ->$0E38
  0e25  AD9FFE1C       JSR [0xfe1c]                      
  0e29  3510           PULS  X                           
  0e2b  39             RTS                               

; ---- function FUN_M70_r5_00000__0e2c
FUN_M70_r5_00000__0e2c:
  0e2c  3410           PSHS  X                           
  0e2e  8E0DB2         LDX #0xdb2                         ; desc[API_FE1A]: ->$0E63 ->$0E38 $0E08
  0e31  AD9FFE1A       JSR [0xfe1a]                      
  0e35  3510           PULS  X                           
  0e37  39             RTS                               

; ---- function FUN_M70_r5_00000__0e38
FUN_M70_r5_00000__0e38:
  0e38  3456           PSHS  U X B A                     
  0e3a  8E0DB2         LDX #0xdb2                         ; desc[API_FE6E]: ->$0E63 ->$0E38
  0e3d  AD9FFE6E       JSR [0xfe6e]                      
  0e41  FC708A         LDD 0x708a                        
  0e44  3606           PSHU  B A                         
  0e46  108E71B6       LDY #0x71b6                       
  0e4a  8603           LDA #0x3                          
  0e4c  AD9FFC40       JSR [0xfc40]                      
  0e50  C620           LDB #0x20                         
  0e52  AD9FFC36       JSR [0xfc36]                      
  0e56  CC0005         LDD #0x5                          
  0e59  8E71BA         LDX #0x71ba                       
  0e5c  AD9FFC3A       JSR [0xfc3a]                      
  0e60  3556           PULS  A B X U                     
  0e62  39             RTS                               

; ---- function FUN_M70_r5_00000__0e63
FUN_M70_r5_00000__0e63:
  0e63  3477           PSHS  U Y X B A CC                
  0e65  8E0DB2         LDX #0xdb2                        
  0e68  AD9FFE76       JSR [0xfe76]                      
  0e6c  FC703A         LDD 0x703a                        
  0e6f  3606           PSHU  B A                         
  0e71  CC0064         LDD #0x64                         
  0e74  3606           PSHU  B A                         
  0e76  AD9FFCE6       JSR [0xfce6]                      
  0e7a  335E           LEAU -0x2,U                       
  0e7c  1709FF         LBSR 0x187e                       
  0e7f  3706           PULU  A B                         
  0e81  FD7170         STD 0x7170                        
  0e84  AD9FFD54       JSR [0xfd54]                      
  0e88  3706           PULU  A B                         
  0e8a  FD708A         STD 0x708a                        
  0e8d  3577           PULS CC A B X Y U                 
  0e8f  39             RTS                               
PTR_FUN_M70_r5_00000__0f13_M70_r5_00000__0e90:
  0e90  0F13           addr M70_r5_00000::0f13           
  0e92  0EDA           addr M70_r5_00000::0eda           
  0e94  .db 0E CE 70 3E 70 40 00 00 70 42 00 08 00 8D 1C 00  ; ..p>p@..pB......
  0ea4  .db 00 03 E8 00 01 00 04 20 0E FE 00 00 00 00 70 44  ; ....... ......pD
  0eb4  .db 00 8F                                            ; ..

; ---- function FUN_M70_r5_00000__0eb6
FUN_M70_r5_00000__0eb6:
  0eb6  3410           PSHS  X                           
  0eb8  8E0E90         LDX #0xe90                         ; desc[API_FE6A]: ->$0F13 ->$0EDA
  0ebb  AD9FFE6A       JSR [0xfe6a]                      
  0ebf  3510           PULS  X                           
  0ec1  39             RTS                               

; ---- function FUN_M70_r5_00000__0ec2
FUN_M70_r5_00000__0ec2:
  0ec2  3410           PSHS  X                           
  0ec4  8E0E90         LDX #0xe90                         ; desc[API_FDBC]: ->$0F13 ->$0EDA
  0ec7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0ecb  3510           PULS  X                           
  0ecd  39             RTS                               

; ---- function FUN_M70_r5_00000__0ece
FUN_M70_r5_00000__0ece:
  0ece  3410           PSHS  X                           
  0ed0  8E0E90         LDX #0xe90                         ; desc[API_FE6C]: ->$0F13 ->$0EDA
  0ed3  AD9FFE6C       JSR [0xfe6c]                      
  0ed7  3510           PULS  X                           
  0ed9  39             RTS                               

; ---- function FUN_M70_r5_00000__0eda
FUN_M70_r5_00000__0eda:
  0eda  3410           PSHS  X                           
  0edc  8E0E90         LDX #0xe90                         ; desc[API_FE6E]: ->$0F13 ->$0EDA
  0edf  AD9FFE6E       JSR [0xfe6e]                      
  0ee3  3510           PULS  X                           
  0ee5  39             RTS                               

; ---- function FUN_M70_r5_00000__0ee6
FUN_M70_r5_00000__0ee6:
  0ee6  3410           PSHS  X                           
  0ee8  8E0E90         LDX #0xe90                         ; desc[API_FE1C]: ->$0F13 ->$0EDA
  0eeb  AD9FFE1C       JSR [0xfe1c]                      
  0eef  3510           PULS  X                           
  0ef1  39             RTS                               

; ---- function FUN_M70_r5_00000__0ef2
FUN_M70_r5_00000__0ef2:
  0ef2  3410           PSHS  X                           
  0ef4  8E0E90         LDX #0xe90                         ; desc[API_FE1A]: ->$0F13 ->$0EDA $0ECE
  0ef7  AD9FFE1A       JSR [0xfe1a]                      
  0efb  3510           PULS  X                           
  0efd  39             RTS                               
  0efe  .db 14 72 69 67 68 74 20 64 65 6C 61 79 20 20 20 20  ; .right delay    
  0f0e  .db 20 20 6D 53 20                                   ;   mS 

; ---- function FUN_M70_r5_00000__0f13
FUN_M70_r5_00000__0f13:
  0f13  3476           PSHS  U Y X B A                   
  0f15  8E0E90         LDX #0xe90                        
  0f18  AD9FFE76       JSR [0xfe76]                      
  0f1c  CC002C         LDD #0x2c                         
  0f1f  3606           PSHU  B A                         
  0f21  FC7042         LDD 0x7042                        
  0f24  3606           PSHU  B A                         
  0f26  AD9FFCEE       JSR [0xfcee]                      
  0f2a  3706           PULU  A B                         
  0f2c  FD71A0         STD 0x71a0                        
  0f2f  17077A         LBSR 0x16ac                       
  0f32  3576           PULS  A B X Y U                   
  0f34  39             RTS                               
PTR_FUN_M70_r5_00000__0fb8_M70_r5_00000__0f35:
  0f35  0FB8           addr M70_r5_00000::0fb8           
  0f37  0F7F           addr M70_r5_00000::0f7f           
  0f39  .db 0F 73 70 56 70 58 00 00 70 5A 00 08 00 65 1D 00  ; .spVpX..pZ...e..
  0f49  .db 00 00 64 00 01 00 03 21 0F A3 00 00 00 00 70 5C  ; ..d....!......p\
  0f59  .db 00 67                                            ; .g

; ---- function FUN_M70_r5_00000__0f5b
FUN_M70_r5_00000__0f5b:
  0f5b  3410           PSHS  X                           
  0f5d  8E0F35         LDX #0xf35                         ; desc[API_FE6A]: ->$0FB8 ->$0F7F
  0f60  AD9FFE6A       JSR [0xfe6a]                      
  0f64  3510           PULS  X                           
  0f66  39             RTS                               

; ---- function FUN_M70_r5_00000__0f67
FUN_M70_r5_00000__0f67:
  0f67  3410           PSHS  X                           
  0f69  8E0F35         LDX #0xf35                         ; desc[API_FDBC]: ->$0FB8 ->$0F7F
  0f6c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...5"
  0f70  3510           PULS  X                           
  0f72  39             RTS                               

; ---- function FUN_M70_r5_00000__0f73
FUN_M70_r5_00000__0f73:
  0f73  3410           PSHS  X                           
  0f75  8E0F35         LDX #0xf35                         ; desc[API_FE6C]: ->$0FB8 ->$0F7F
  0f78  AD9FFE6C       JSR [0xfe6c]                      
  0f7c  3510           PULS  X                           
  0f7e  39             RTS                               

; ---- function FUN_M70_r5_00000__0f7f
FUN_M70_r5_00000__0f7f:
  0f7f  3410           PSHS  X                           
  0f81  8E0F35         LDX #0xf35                         ; desc[API_FE6E]: ->$0FB8 ->$0F7F
  0f84  AD9FFE6E       JSR [0xfe6e]                      
  0f88  3510           PULS  X                           
  0f8a  39             RTS                               

; ---- function FUN_M70_r5_00000__0f8b
FUN_M70_r5_00000__0f8b:
  0f8b  3410           PSHS  X                           
  0f8d  8E0F35         LDX #0xf35                         ; desc[API_FE1C]: ->$0FB8 ->$0F7F
  0f90  AD9FFE1C       JSR [0xfe1c]                      
  0f94  3510           PULS  X                           
  0f96  39             RTS                               

; ---- function FUN_M70_r5_00000__0f97
FUN_M70_r5_00000__0f97:
  0f97  3410           PSHS  X                           
  0f99  8E0F35         LDX #0xf35                         ; desc[API_FE1A]: ->$0FB8 ->$0F7F $0F73
  0f9c  AD9FFE1A       JSR [0xfe1a]                      
  0fa0  3510           PULS  X                           
  0fa2  39             RTS                               
  0fa3  .db 14 6C 65 66 74 20 66 64 62 61 63 6B 3A 20 20 20  ; .left fdback:   
  0fb3  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M70_r5_00000__0fb8
FUN_M70_r5_00000__0fb8:
  0fb8  3476           PSHS  U Y X B A                   
  0fba  8E0F35         LDX #0xf35                        
  0fbd  AD9FFE76       JSR [0xfe76]                      
  0fc1  FC705A         LDD 0x705a                        
  0fc4  3606           PSHU  B A                         
  0fc6  58             LSLB                              
  0fc7  49             ROLA                              
  0fc8  FD7160         STD 0x7160                        
  0fcb  CC4666         LDD #0x4666                       
  0fce  3606           PSHU  B A                         
  0fd0  AD9FFCF2       JSR [0xfcf2]                      
  0fd4  3706           PULU  A B                         
  0fd6  F37160         ADDD 0x7160                       
  0fd9  AD9FFC6C       JSR [0xfc6c]                      
  0fdd  3576           PULS  A B X Y U                   
  0fdf  39             RTS                               
PTR_FUN_M70_r5_00000__1063_M70_r5_00000__0fe0:
  0fe0  1063           addr M70_r5_00000::1063           
  0fe2  102A           addr M70_r5_00000::102a           
  0fe4  .db 10 1E 70 5E 70 60 00 00 70 62 00 08 00 69 1E 00  ; ..p^p`..pb...i..
  0ff4  .db 00 00 64 00 01 00 03 22 10 4E 00 00 00 00 70 64  ; ..d....".N....pd
  1004  .db 00 6B                                            ; .k

; ---- function FUN_M70_r5_00000__1006
FUN_M70_r5_00000__1006:
  1006  3410           PSHS  X                           
  1008  8E0FE0         LDX #0xfe0                         ; desc[API_FE6A]: ->$1063 ->$102A
  100b  AD9FFE6A       JSR [0xfe6a]                      
  100f  3510           PULS  X                           
  1011  39             RTS                               

; ---- function FUN_M70_r5_00000__1012
FUN_M70_r5_00000__1012:
  1012  3410           PSHS  X                           
  1014  8E0FE0         LDX #0xfe0                         ; desc[API_FDBC]: ->$1063 ->$102A
  1017  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  101b  3510           PULS  X                           
  101d  39             RTS                               

; ---- function FUN_M70_r5_00000__101e
FUN_M70_r5_00000__101e:
  101e  3410           PSHS  X                           
  1020  8E0FE0         LDX #0xfe0                         ; desc[API_FE6C]: ->$1063 ->$102A
  1023  AD9FFE6C       JSR [0xfe6c]                      
  1027  3510           PULS  X                           
  1029  39             RTS                               

; ---- function FUN_M70_r5_00000__102a
FUN_M70_r5_00000__102a:
  102a  3410           PSHS  X                           
  102c  8E0FE0         LDX #0xfe0                         ; desc[API_FE6E]: ->$1063 ->$102A
  102f  AD9FFE6E       JSR [0xfe6e]                      
  1033  3510           PULS  X                           
  1035  39             RTS                               

; ---- function FUN_M70_r5_00000__1036
FUN_M70_r5_00000__1036:
  1036  3410           PSHS  X                           
  1038  8E0FE0         LDX #0xfe0                         ; desc[API_FE1C]: ->$1063 ->$102A
  103b  AD9FFE1C       JSR [0xfe1c]                      
  103f  3510           PULS  X                           
  1041  39             RTS                               

; ---- function FUN_M70_r5_00000__1042
FUN_M70_r5_00000__1042:
  1042  3410           PSHS  X                           
  1044  8E0FE0         LDX #0xfe0                         ; desc[API_FE1A]: ->$1063 ->$102A $101E
  1047  AD9FFE1A       JSR [0xfe1a]                      
  104b  3510           PULS  X                           
  104d  39             RTS                               
  104e  .db 14 72 69 67 68 74 20 66 64 62 61 63 6B 3A 20 20  ; .right fdback:  
  105e  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M70_r5_00000__1063
FUN_M70_r5_00000__1063:
  1063  3476           PSHS  U Y X B A                   
  1065  8E0FE0         LDX #0xfe0                        
  1068  AD9FFE76       JSR [0xfe76]                      
  106c  FC7062         LDD 0x7062                        
  106f  3606           PSHU  B A                         
  1071  58             LSLB                              
  1072  49             ROLA                              
  1073  FD7160         STD 0x7160                        
  1076  CC4666         LDD #0x4666                       
  1079  3606           PSHU  B A                         
  107b  AD9FFCF2       JSR [0xfcf2]                      
  107f  3706           PULU  A B                         
  1081  F37160         ADDD 0x7160                       
  1084  AD9FFC74       JSR [0xfc74]                      
  1088  3576           PULS  A B X Y U                   
  108a  39             RTS                               
PTR_FUN_M70_r5_00000__110e_M70_r5_00000__108b:
  108b  110E           addr M70_r5_00000::110e           
  108d  10D5           addr M70_r5_00000::10d5           
  108f  .db 10 C9 70 46 70 48 00 00 70 4A 00 08 00 5D 07 00  ; ..pFpH..pJ...]..
  109f  .db 00 00 64 00 01 00 03 1D 10 F9 00 00 00 00 70 4C  ; ..d...........pL
  10af  .db 00 5F                                            ; ._

; ---- function FUN_M70_r5_00000__10b1
FUN_M70_r5_00000__10b1:
  10b1  3410           PSHS  X                           
  10b3  8E108B         LDX #0x108b                        ; desc[API_FE6A]: ->$110E ->$10D5
  10b6  AD9FFE6A       JSR [0xfe6a]                      
  10ba  3510           PULS  X                           
  10bc  39             RTS                               

; ---- function FUN_M70_r5_00000__10bd
FUN_M70_r5_00000__10bd:
  10bd  3410           PSHS  X                           
  10bf  8E108B         LDX #0x108b                        ; desc[API_FDBC]: ->$110E ->$10D5
  10c2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  10c6  3510           PULS  X                           
  10c8  39             RTS                               

; ---- function FUN_M70_r5_00000__10c9
FUN_M70_r5_00000__10c9:
  10c9  3410           PSHS  X                           
  10cb  8E108B         LDX #0x108b                        ; desc[API_FE6C]: ->$110E ->$10D5
  10ce  AD9FFE6C       JSR [0xfe6c]                      
  10d2  3510           PULS  X                           
  10d4  39             RTS                               

; ---- function FUN_M70_r5_00000__10d5
FUN_M70_r5_00000__10d5:
  10d5  3410           PSHS  X                           
  10d7  8E108B         LDX #0x108b                        ; desc[API_FE6E]: ->$110E ->$10D5
  10da  AD9FFE6E       JSR [0xfe6e]                      
  10de  3510           PULS  X                           
  10e0  39             RTS                               

; ---- function FUN_M70_r5_00000__10e1
FUN_M70_r5_00000__10e1:
  10e1  3410           PSHS  X                           
  10e3  8E108B         LDX #0x108b                        ; desc[API_FE1C]: ->$110E ->$10D5
  10e6  AD9FFE1C       JSR [0xfe1c]                      
  10ea  3510           PULS  X                           
  10ec  39             RTS                               

; ---- function FUN_M70_r5_00000__10ed
FUN_M70_r5_00000__10ed:
  10ed  3410           PSHS  X                           
  10ef  8E108B         LDX #0x108b                        ; desc[API_FE1A]: ->$110E ->$10D5 $10C9
  10f2  AD9FFE1A       JSR [0xfe1a]                      
  10f6  3510           PULS  X                           
  10f8  39             RTS                               
  10f9  .db 14 6C 65 66 74 20 6D 69 78 3A 20 20 20 20 25 20  ; .left mix:    % 
  1109  .db 77 65 74 20 20                                   ; wet  

; ---- function FUN_M70_r5_00000__110e
FUN_M70_r5_00000__110e:
  110e  3476           PSHS  U Y X B A                   
  1110  8E108B         LDX #0x108b                       
  1113  AD9FFE76       JSR [0xfe76]                      
  1117  CC0064         LDD #0x64                         
  111a  B3704A         SUBD 0x704a                       
  111d  3606           PSHU  B A                         
  111f  58             LSLB                              
  1120  49             ROLA                              
  1121  FD7160         STD 0x7160                        
  1124  CC4666         LDD #0x4666                       
  1127  3606           PSHU  B A                         
  1129  AD9FFCF2       JSR [0xfcf2]                      
  112d  3706           PULU  A B                         
  112f  F37160         ADDD 0x7160                       
  1132  AD9FFC6A       JSR [0xfc6a]                      
  1136  3576           PULS  A B X Y U                   
  1138  39             RTS                               
PTR_FUN_M70_r5_00000__11bc_M70_r5_00000__1139:
  1139  11BC           addr M70_r5_00000::11bc           
  113b  1183           addr M70_r5_00000::1183           
  113d  .db 11 77 70 4E 70 50 00 00 70 52 00 08 00 61 08 00  ; .wpNpP..pR...a..
  114d  .db 00 00 64 00 01 00 03 1E 11 A7 00 00 00 00 70 54  ; ..d...........pT
  115d  .db 00 63                                            ; .c

; ---- function FUN_M70_r5_00000__115f
FUN_M70_r5_00000__115f:
  115f  3410           PSHS  X                           
  1161  8E1139         LDX #0x1139                        ; desc[API_FE6A]: ->$11BC ->$1183
  1164  AD9FFE6A       JSR [0xfe6a]                      
  1168  3510           PULS  X                           
  116a  39             RTS                               

; ---- function FUN_M70_r5_00000__116b
FUN_M70_r5_00000__116b:
  116b  3410           PSHS  X                           
  116d  8E1139         LDX #0x1139                        ; desc[API_FDBC]: ->$11BC ->$1183
  1170  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...9"
  1174  3510           PULS  X                           
  1176  39             RTS                               

; ---- function FUN_M70_r5_00000__1177
FUN_M70_r5_00000__1177:
  1177  3410           PSHS  X                           
  1179  8E1139         LDX #0x1139                        ; desc[API_FE6C]: ->$11BC ->$1183
  117c  AD9FFE6C       JSR [0xfe6c]                      
  1180  3510           PULS  X                           
  1182  39             RTS                               

; ---- function FUN_M70_r5_00000__1183
FUN_M70_r5_00000__1183:
  1183  3410           PSHS  X                           
  1185  8E1139         LDX #0x1139                        ; desc[API_FE6E]: ->$11BC ->$1183
  1188  AD9FFE6E       JSR [0xfe6e]                      
  118c  3510           PULS  X                           
  118e  39             RTS                               

; ---- function FUN_M70_r5_00000__118f
FUN_M70_r5_00000__118f:
  118f  3410           PSHS  X                           
  1191  8E1139         LDX #0x1139                        ; desc[API_FE1C]: ->$11BC ->$1183
  1194  AD9FFE1C       JSR [0xfe1c]                      
  1198  3510           PULS  X                           
  119a  39             RTS                               

; ---- function FUN_M70_r5_00000__119b
FUN_M70_r5_00000__119b:
  119b  3410           PSHS  X                           
  119d  8E1139         LDX #0x1139                        ; desc[API_FE1A]: ->$11BC ->$1183 $1177
  11a0  AD9FFE1A       JSR [0xfe1a]                      
  11a4  3510           PULS  X                           
  11a6  39             RTS                               
  11a7  .db 14 72 69 67 68 74 20 6D 69 78 3A 20 20 20 20 25  ; .right mix:    %
  11b7  .db 20 77 65 74 20                                   ;  wet 

; ---- function FUN_M70_r5_00000__11bc
FUN_M70_r5_00000__11bc:
  11bc  3476           PSHS  U Y X B A                   
  11be  8E1139         LDX #0x1139                       
  11c1  AD9FFE76       JSR [0xfe76]                      
  11c5  CC0064         LDD #0x64                         
  11c8  B37052         SUBD 0x7052                       
  11cb  3606           PSHU  B A                         
  11cd  58             LSLB                              
  11ce  49             ROLA                              
  11cf  FD7160         STD 0x7160                        
  11d2  CC4666         LDD #0x4666                       
  11d5  3606           PSHU  B A                         
  11d7  AD9FFCF2       JSR [0xfcf2]                      
  11db  3706           PULU  A B                         
  11dd  F37160         ADDD 0x7160                       
  11e0  AD9FFC72       JSR [0xfc72]                      
  11e4  3576           PULS  A B X Y U                   
  11e6  39             RTS                               
PTR_FUN_M70_r5_00000__1252_M70_r5_00000__11e7:
  11e7  1252           addr M70_r5_00000::1252           
  11e9  1231           addr M70_r5_00000::1231           
  11eb  .db 12 25 70 66 70 68 00 00 70 6A 00 08 00 21 09 FF  ; .%pfph..pj...!..
  11fb  .db D0 00 30 00 01 00 03 1C 12 3D 00 00 00 00 00 00  ; ..0......=......
  120b  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__120d
FUN_M70_r5_00000__120d:
  120d  3410           PSHS  X                           
  120f  8E11E7         LDX #0x11e7                       
  1212  AD9FFE74       JSR [0xfe74]                      
  1216  3510           PULS  X                           
  1218  39             RTS                               

; ---- function FUN_M70_r5_00000__1219
FUN_M70_r5_00000__1219:
  1219  3410           PSHS  X                           
  121b  8E11E7         LDX #0x11e7                        ; desc[API_FE22]: ->$1252 ->$1231
  121e  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1222  3510           PULS  X                           
  1224  39             RTS                               

; ---- function FUN_M70_r5_00000__1225
FUN_M70_r5_00000__1225:
  1225  3410           PSHS  X                           
  1227  8E11E7         LDX #0x11e7                       
  122a  AD9FFE70       JSR [0xfe70]                      
  122e  3510           PULS  X                           
  1230  39             RTS                               

; ---- function FUN_M70_r5_00000__1231
FUN_M70_r5_00000__1231:
  1231  3410           PSHS  X                           
  1233  8E11E7         LDX #0x11e7                       
  1236  AD9FFE72       JSR [0xfe72]                      
  123a  3510           PULS  X                           
  123c  39             RTS                               
  123d  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  124d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__1252
FUN_M70_r5_00000__1252:
  1252  3476           PSHS  U Y X B A                   
  1254  8E11E7         LDX #0x11e7                       
  1257  AD9FFE76       JSR [0xfe76]                      
  125b  AD9FFE52       JSR [0xfe52]                      
  125f  3576           PULS  A B X Y U                   
  1261  39             RTS                               
PTR_FUN_M70_r5_00000__12cd_M70_r5_00000__1262:
  1262  12CD           addr M70_r5_00000::12cd           
  1264  12AC           addr M70_r5_00000::12ac           
  1266  .db 12 A0 70 6C 70 6E 00 00 70 70 00 08 00 22 0A FF  ; ..plpn..pp..."..
  1276  .db D0 00 30 00 01 00 03 1D 12 B8 00 00 00 00 00 00  ; ..0.............
  1286  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__1288
FUN_M70_r5_00000__1288:
  1288  3410           PSHS  X                           
  128a  8E1262         LDX #0x1262                       
  128d  AD9FFE74       JSR [0xfe74]                      
  1291  3510           PULS  X                           
  1293  39             RTS                               

; ---- function FUN_M70_r5_00000__1294
FUN_M70_r5_00000__1294:
  1294  3410           PSHS  X                           
  1296  8E1262         LDX #0x1262                        ; desc[API_FE22]: ->$12CD ->$12AC
  1299  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  129d  3510           PULS  X                           
  129f  39             RTS                               

; ---- function FUN_M70_r5_00000__12a0
FUN_M70_r5_00000__12a0:
  12a0  3410           PSHS  X                           
  12a2  8E1262         LDX #0x1262                       
  12a5  AD9FFE70       JSR [0xfe70]                      
  12a9  3510           PULS  X                           
  12ab  39             RTS                               

; ---- function FUN_M70_r5_00000__12ac
FUN_M70_r5_00000__12ac:
  12ac  3410           PSHS  X                           
  12ae  8E1262         LDX #0x1262                       
  12b1  AD9FFE72       JSR [0xfe72]                      
  12b5  3510           PULS  X                           
  12b7  39             RTS                               
  12b8  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  12c8  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__12cd
FUN_M70_r5_00000__12cd:
  12cd  3476           PSHS  U Y X B A                   
  12cf  8E1262         LDX #0x1262                       
  12d2  AD9FFE76       JSR [0xfe76]                      
  12d6  AD9FFE54       JSR [0xfe54]                      
  12da  3576           PULS  A B X Y U                   
  12dc  39             RTS                               
PTR_FUN_M70_r5_00000__1348_M70_r5_00000__12dd:
  12dd  1348           addr M70_r5_00000::1348           
  12df  1327           addr M70_r5_00000::1327           
  12e1  .db 13 1B 70 72 70 74 00 00 70 76 00 08 00 23 0B FF  ; ..prpt..pv...#..
  12f1  .db D0 00 30 00 01 00 03 1D 13 33 00 00 00 00 00 00  ; ..0......3......
  1301  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__1303
FUN_M70_r5_00000__1303:
  1303  3410           PSHS  X                           
  1305  8E12DD         LDX #0x12dd                       
  1308  AD9FFE74       JSR [0xfe74]                      
  130c  3510           PULS  X                           
  130e  39             RTS                               

; ---- function FUN_M70_r5_00000__130f
FUN_M70_r5_00000__130f:
  130f  3410           PSHS  X                           
  1311  8E12DD         LDX #0x12dd                        ; desc[API_FE22]: ->$1348 ->$1327
  1314  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1318  3510           PULS  X                           
  131a  39             RTS                               

; ---- function FUN_M70_r5_00000__131b
FUN_M70_r5_00000__131b:
  131b  3410           PSHS  X                           
  131d  8E12DD         LDX #0x12dd                       
  1320  AD9FFE70       JSR [0xfe70]                      
  1324  3510           PULS  X                           
  1326  39             RTS                               

; ---- function FUN_M70_r5_00000__1327
FUN_M70_r5_00000__1327:
  1327  3410           PSHS  X                           
  1329  8E12DD         LDX #0x12dd                       
  132c  AD9FFE72       JSR [0xfe72]                      
  1330  3510           PULS  X                           
  1332  39             RTS                               
  1333  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  1343  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__1348
FUN_M70_r5_00000__1348:
  1348  3476           PSHS  U Y X B A                   
  134a  8E12DD         LDX #0x12dd                       
  134d  AD9FFE76       JSR [0xfe76]                      
  1351  AD9FFE56       JSR [0xfe56]                      
  1355  3576           PULS  A B X Y U                   
  1357  39             RTS                               
PTR_FUN_M70_r5_00000__13c3_M70_r5_00000__1358:
  1358  13C3           addr M70_r5_00000::13c3           
  135a  13A2           addr M70_r5_00000::13a2           
  135c  .db 13 96 70 78 70 7A 00 00 70 7C 00 08 00 24 0C FF  ; ..pxpz..p|...$..
  136c  .db D0 00 30 00 01 00 03 1E 13 AE 00 00 00 00 00 00  ; ..0.............
  137c  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__137e
FUN_M70_r5_00000__137e:
  137e  3410           PSHS  X                           
  1380  8E1358         LDX #0x1358                       
  1383  AD9FFE74       JSR [0xfe74]                      
  1387  3510           PULS  X                           
  1389  39             RTS                               

; ---- function FUN_M70_r5_00000__138a
FUN_M70_r5_00000__138a:
  138a  3410           PSHS  X                           
  138c  8E1358         LDX #0x1358                        ; desc[API_FE22]: ->$13C3 ->$13A2
  138f  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1393  3510           PULS  X                           
  1395  39             RTS                               

; ---- function FUN_M70_r5_00000__1396
FUN_M70_r5_00000__1396:
  1396  3410           PSHS  X                           
  1398  8E1358         LDX #0x1358                       
  139b  AD9FFE70       JSR [0xfe70]                      
  139f  3510           PULS  X                           
  13a1  39             RTS                               

; ---- function FUN_M70_r5_00000__13a2
FUN_M70_r5_00000__13a2:
  13a2  3410           PSHS  X                           
  13a4  8E1358         LDX #0x1358                       
  13a7  AD9FFE72       JSR [0xfe72]                      
  13ab  3510           PULS  X                           
  13ad  39             RTS                               
  13ae  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  13be  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M70_r5_00000__13c3
FUN_M70_r5_00000__13c3:
  13c3  3476           PSHS  U Y X B A                   
  13c5  8E1358         LDX #0x1358                       
  13c8  AD9FFE76       JSR [0xfe76]                      
  13cc  AD9FFE58       JSR [0xfe58]                      
  13d0  3576           PULS  A B X Y U                   
  13d2  39             RTS                               

; ---- function FUN_M70_r5_00000__13d3
FUN_M70_r5_00000__13d3:
  13d3  3426           PSHS  Y B A                       
  13d5  AD9FFC8E       JSR [0xfc8e]                      
  13d9  FC60F9         LDD 0x60f9                        
  13dc  FD7080         STD 0x7080                        
  13df  FD6074         STD 0x6074                        
  13e2  1700EE         LBSR 0x14d3                       
  13e5  CC007F         LDD #0x7f                         
  13e8  830008         SUBD #0x8                         
  13eb  1F02           TFR D,Y                           
  13ed  FC7080         LDD 0x7080                        
  13f0  AD9FFC80       JSR [0xfc80]                      
  13f4  3526           PULS  A B Y                       
  13f6  39             RTS                               

; ---- function FUN_M70_r5_00000__13f7
FUN_M70_r5_00000__13f7:
  13f7  3406           PSHS  B A                         
  13f9  FC7080         LDD 0x7080                        
  13fc  FD6074         STD 0x6074                        
  13ff  17F3FD         LBSR 0x07ff                       
  1402  C613           LDB #0x13                         
  1404  AD9FFC36       JSR [0xfc36]                      
  1408  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  140c  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M70_r5_00000__1422:
  1422  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$1473 ->$1447 $0001 $0001 $0000
  1426  01             db 1h                             
  1427  01             db 1h                             
  1428  02             db 2h                             
  1429  01             db 1h                             
  142a  01             db 1h                             
  142b  00             db 0h                             
  142c  01             db 1h                             
  142d  80             db 80h                            
  142e  0004           dw 4h                             
  1430  0000           dw 0h                             
  1432  0000           dw 0h                             
  1434  1473           addr M70_r5_00000::1473           
  1436  1447           addr M70_r5_00000::1447           
  1438  0001           dw 1h                             
  143a  0001           dw 1h                             
  143c  0000           dw 0h                             
LAB_M70_r5_00000__143e:
  143e  170032         LBSR 0x1473                       
  1441  170133         LBSR 0x1577                       
  1444  3506           PULS  A B                         
  1446  39             RTS                               

; ---- function FUN_M70_r5_00000__1447
FUN_M70_r5_00000__1447:
  1447  3426           PSHS  Y B A                       
  1449  FC6062         LDD 0x6062                        
  144c  FD7080         STD 0x7080                        
  144f  CC007F         LDD #0x7f                         
  1452  830008         SUBD #0x8                         
  1455  1F02           TFR D,Y                           
  1457  FC7080         LDD 0x7080                        
  145a  AD9FFC80       JSR [0xfc80]                      
  145e  108E002A       LDY #0x2a                         
  1462  FC7080         LDD 0x7080                        
  1465  AD9FFE40       JSR [0xfe40]                      
  1469  8D08           BSR 0x1473                        
  146b  170109         LBSR 0x1577                       
  146e  8D63           BSR 0x14d3                        
  1470  3526           PULS  A B Y                       
  1472  39             RTS                               

; ---- function FUN_M70_r5_00000__1473
FUN_M70_r5_00000__1473:
  1473  C626           LDB #0x26                         
  1475  AD9FFC36       JSR [0xfc36]                      
  1479  FC7080         LDD 0x7080                        
  147c  10830000       CMPD #0x0                         
  1480  10270045       LBEQ 0x14c9                       
  1484  FC7080         LDD 0x7080                        
  1487  10830001       CMPD #0x1                         
  148b  10270031       LBEQ 0x14c0                       
  148f  FC7080         LDD 0x7080                        
  1492  10830002       CMPD #0x2                         
  1496  1027001D       LBEQ 0x14b7                       
  149a  FC7080         LDD 0x7080                        
  149d  10830003       CMPD #0x3                         
  14a1  10270009       LBEQ 0x14ae                       
  14a5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C8"
  14a9  433800         char[3] "C8"                      
LAB_M70_r5_00000__14ac:
  14ac  2024           BRA 0x14d2                        
LAB_M70_r5_00000__14ae:
  14ae  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C7"
  14b2  433700         char[3] "C7"                      
LAB_M70_r5_00000__14b5:
  14b5  201B           BRA 0x14d2                        
LAB_M70_r5_00000__14b7:
  14b7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C6"
  14bb  433600         char[3] "C6"                      
LAB_M70_r5_00000__14be:
  14be  2012           BRA 0x14d2                        
LAB_M70_r5_00000__14c0:
  14c0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C5"
  14c4  433500         char[3] "C5"                      
LAB_M70_r5_00000__14c7:
  14c7  2009           BRA 0x14d2                        
LAB_M70_r5_00000__14c9:
  14c9  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C4"
  14cd  433400         char[3] "C4"                      
LAB_M70_r5_00000__14d0:
  14d0  2000           BRA 0x14d2                        
LAB_M70_r5_00000__14d2:
  14d2  39             RTS                               

; ---- function FUN_M70_r5_00000__14d3
FUN_M70_r5_00000__14d3:
  14d3  1700C5         LBSR 0x159b                       
  14d6  39             RTS                               

; ---- function FUN_M70_r5_00000__14d7
FUN_M70_r5_00000__14d7:
  14d7  3426           PSHS  Y B A                       
  14d9  AD9FFC8E       JSR [0xfc8e]                      
  14dd  FC60F9         LDD 0x60f9                        
  14e0  FD707E         STD 0x707e                        
  14e3  FD6074         STD 0x6074                        
  14e6  1700B2         LBSR 0x159b                       
  14e9  CC007E         LDD #0x7e                         
  14ec  830008         SUBD #0x8                         
  14ef  1F02           TFR D,Y                           
  14f1  FC707E         LDD 0x707e                        
  14f4  AD9FFC80       JSR [0xfc80]                      
  14f8  3526           PULS  A B Y                       
  14fa  39             RTS                               

; ---- function FUN_M70_r5_00000__14fb
FUN_M70_r5_00000__14fb:
  14fb  3406           PSHS  B A                         
  14fd  FC707E         LDD 0x707e                        
  1500  FD6074         STD 0x6074                        
  1503  17F2F9         LBSR 0x07ff                       
  1506  C613           LDB #0x13                         
  1508  AD9FFC36       JSR [0xfc36]                      
  150c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  1510  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M70_r5_00000__1526:
  1526  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$1577 ->$154B $0001 $0001 $0000
  152a  01             db 1h                             
  152b  01             db 1h                             
  152c  02             db 2h                             
  152d  01             db 1h                             
  152e  01             db 1h                             
  152f  00             db 0h                             
  1530  02             db 2h                             
  1531  80             db 80h                            
  1532  002E           dw 2Eh                            
  1534  0000           dw 0h                             
  1536  0000           dw 0h                             
  1538  1577           addr M70_r5_00000::1577           
  153a  154B           addr M70_r5_00000::154b           
  153c  0001           dw 1h                             
  153e  0001           dw 1h                             
  1540  0000           dw 0h                             
LAB_M70_r5_00000__1542:
  1542  170032         LBSR 0x1577                       
  1545  17FF2B         LBSR 0x1473                       
  1548  3506           PULS  A B                         
  154a  39             RTS                               

; ---- function FUN_M70_r5_00000__154b
FUN_M70_r5_00000__154b:
  154b  3426           PSHS  Y B A                       
  154d  FC6062         LDD 0x6062                        
  1550  FD707E         STD 0x707e                        
  1553  CC007E         LDD #0x7e                         
  1556  830008         SUBD #0x8                         
  1559  1F02           TFR D,Y                           
  155b  FC707E         LDD 0x707e                        
  155e  AD9FFC80       JSR [0xfc80]                      
  1562  108E0029       LDY #0x29                         
  1566  FC707E         LDD 0x707e                        
  1569  AD9FFE40       JSR [0xfe40]                      
  156d  8D08           BSR 0x1577                        
  156f  17FF01         LBSR 0x1473                       
  1572  8D27           BSR 0x159b                        
  1574  3526           PULS  A B Y                       
  1576  39             RTS                               

; ---- function FUN_M70_r5_00000__1577
FUN_M70_r5_00000__1577:
  1577  C61C           LDB #0x1c                         
  1579  AD9FFC36       JSR [0xfc36]                      
  157d  FC7080         LDD 0x7080                        
  1580  860C           LDA #0xc                          
  1582  3D             MUL                               
  1583  C30002         ADDD #0x2                         
  1586  F3707E         ADDD 0x707e                       
  1589  8604           LDA #0x4                          
  158b  3D             MUL                               
  158c  C31B52         ADDD #0x1b52                      
  158f  F3600D         ADDD 0x600d                       
  1592  1F01           TFR D,X                           
  1594  C604           LDB #0x4                          
  1596  AD9FFC3A       JSR [0xfc3a]                      
  159a  39             RTS                               

; ---- function FUN_M70_r5_00000__159b
FUN_M70_r5_00000__159b:
  159b  3476           PSHS  U Y X B A                   
  159d  17010C         LBSR 0x16ac                       
  15a0  FC71B2         LDD 0x71b2                        
  15a3  AD9FFD3C       JSR [0xfd3c]                      
  15a7  3576           PULS  A B X Y U                   
  15a9  39             RTS                               

; ---- function FUN_M70_r5_00000__15aa
FUN_M70_r5_00000__15aa:
  15aa  3426           PSHS  Y B A                       
  15ac  AD9FFC8E       JSR [0xfc8e]                      
  15b0  FC60F9         LDD 0x60f9                        
  15b3  FD7082         STD 0x7082                        
  15b6  FD6074         STD 0x6074                        
  15b9  1700D2         LBSR 0x168e                       
  15bc  CC0080         LDD #0x80                         
  15bf  830008         SUBD #0x8                         
  15c2  1F02           TFR D,Y                           
  15c4  FC7082         LDD 0x7082                        
  15c7  AD9FFC80       JSR [0xfc80]                      
  15cb  3526           PULS  A B Y                       
  15cd  39             RTS                               

; ---- function FUN_M70_r5_00000__15ce
FUN_M70_r5_00000__15ce:
  15ce  FC7082         LDD 0x7082                        
  15d1  FD6074         STD 0x6074                        
  15d4  17F228         LBSR 0x07ff                       
  15d7  C604           LDB #0x4                          
  15d9  AD9FFC36       JSR [0xfc36]                      
  15dd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " polyphonic-                   -solo"
  15e1  0A706F6C7970.. char[37] "\npolyphonic-                   -solo"
LAB_M70_r5_00000__1606:
  1606  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$164B ->$1626 $0005 $0005 $0000
  160a  01             db 1h                             
  160b  01             db 1h                             
  160c  02             db 2h                             
  160d  01             db 1h                             
  160e  01             db 1h                             
  160f  00             db 0h                             
  1610  03             db 3h                             
  1611  80             db 80h                            
  1612  005F           dw 5Fh                            
  1614  0005           dw 5h                             
  1616  0000           dw 0h                             
  1618  164B           addr M70_r5_00000::164b           
  161a  1626           addr M70_r5_00000::1626           
  161c  0005           dw 5h                             
  161e  0005           dw 5h                             
  1620  0000           dw 0h                             
LAB_M70_r5_00000__1622:
  1622  170026         LBSR 0x164b                       
  1625  39             RTS                               

; ---- function FUN_M70_r5_00000__1626
FUN_M70_r5_00000__1626:
  1626  FC6074         LDD 0x6074                        
  1629  FD7082         STD 0x7082                        
  162c  CC0080         LDD #0x80                         
  162f  830008         SUBD #0x8                         
  1632  1F02           TFR D,Y                           
  1634  FC7082         LDD 0x7082                        
  1637  AD9FFC80       JSR [0xfc80]                      
  163b  108E002B       LDY #0x2b                         
  163f  FC7082         LDD 0x7082                        
  1642  AD9FFE40       JSR [0xfe40]                      
  1646  8D46           BSR 0x168e                        
  1648  8D01           BSR 0x164b                        
  164a  39             RTS                               

; ---- function FUN_M70_r5_00000__164b
FUN_M70_r5_00000__164b:
  164b  3466           PSHS  U Y B A                     
  164d  C610           LDB #0x10                         
  164f  AD9FFC36       JSR [0xfc36]                      
  1653  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                   "
  1657  202020202020.. char[20] "                   "    
LAB_M70_r5_00000__166b:
  166b  FC7082         LDD 0x7082                        
  166e  830005         SUBD #0x5                         
  1671  3606           PSHU  B A                         
  1673  CC0005         LDD #0x5                          
  1676  3606           PSHU  B A                         
  1678  AD9FFCEA       JSR [0xfcea]                      
  167c  3706           PULU  A B                         
  167e  C30010         ADDD #0x10                        
  1681  AD9FFC36       JSR [0xfc36]                      
  1685  C62A           LDB #0x2a                         
  1687  AD9FFC2A       JSR [0xfc2a]                      
  168b  3566           PULS  A B Y U                     
  168d  39             RTS                               

; ---- function FUN_M70_r5_00000__168e
FUN_M70_r5_00000__168e:
  168e  3456           PSHS  U X B A                     
  1690  FC7082         LDD 0x7082                        
  1693  3606           PSHU  B A                         
  1695  CC0147         LDD #0x147                        
  1698  3606           PSHU  B A                         
  169a  AD9FFCEE       JSR [0xfcee]                      
  169e  3706           PULU  A B                         
  16a0  FD71A2         STD 0x71a2                        
  16a3  CC0000         LDD #0x0                          
  16a6  FD7174         STD 0x7174                        
  16a9  3556           PULS  A B X U                     
  16ab  39             RTS                               

; ---- function FUN_M70_r5_00000__16ac
FUN_M70_r5_00000__16ac:
  16ac  3476           PSHS  U Y X B A                   
  16ae  FC707E         LDD 0x707e                        
  16b1  8602           LDA #0x2                          
  16b3  3D             MUL                               
  16b4  C31D02         ADDD #0x1d02                      
  16b7  F3600D         ADDD 0x600d                       
  16ba  1F01           TFR D,X                           
  16bc  EC84           LDD ,X                            
  16be  FD7190         STD 0x7190                        
  16c1  3606           PSHU  B A                         
  16c3  CCFFFF         LDD #0xffff                       
  16c6  3606           PSHU  B A                         
  16c8  AD9FFCDE       JSR [0xfcde]                      
  16cc  3706           PULU  A B                         
  16ce  830002         SUBD #0x2                         
  16d1  FD7192         STD 0x7192                        
  16d4  FC7080         LDD 0x7080                        
  16d7  10830000       CMPD #0x0                         
  16db  10270041       LBEQ 0x1720                       
  16df  FC7080         LDD 0x7080                        
  16e2  10830001       CMPD #0x1                         
  16e6  1027002E       LBEQ 0x1718                       
  16ea  FC7080         LDD 0x7080                        
  16ed  10830002       CMPD #0x2                         
  16f1  1027001B       LBEQ 0x1710                       
  16f5  FC7080         LDD 0x7080                        
  16f8  10830003       CMPD #0x3                         
  16fc  10270008       LBEQ 0x1708                       
  1700  CC0001         LDD #0x1                          
  1703  FD7194         STD 0x7194                        
  1706  2045           BRA 0x174d                        
LAB_M70_r5_00000__1708:
  1708  CC0002         LDD #0x2                          
  170b  FD7194         STD 0x7194                        
  170e  2016           BRA 0x1726                        
LAB_M70_r5_00000__1710:
  1710  CC0004         LDD #0x4                          
  1713  FD7194         STD 0x7194                        
  1716  200E           BRA 0x1726                        
LAB_M70_r5_00000__1718:
  1718  CC0008         LDD #0x8                          
  171b  FD7194         STD 0x7194                        
  171e  2006           BRA 0x1726                        
LAB_M70_r5_00000__1720:
  1720  CC0010         LDD #0x10                         
  1723  FD7194         STD 0x7194                        
LAB_M70_r5_00000__1726:
  1726  FC7080         LDD 0x7080                        
  1729  860A           LDA #0xa                          
  172b  3D             MUL                               
  172c  C31D7A         ADDD #0x1d7a                      
  172f  F3600D         ADDD 0x600d                       
  1732  1F01           TFR D,X                           
  1734  EC81           LDD ,X++                          
  1736  FD7184         STD 0x7184                        
  1739  EC81           LDD ,X++                          
  173b  FD7186         STD 0x7186                        
  173e  EC81           LDD ,X++                          
  1740  FD7188         STD 0x7188                        
  1743  EC81           LDD ,X++                          
  1745  FD718A         STD 0x718a                        
  1748  EC81           LDD ,X++                          
  174a  FD718C         STD 0x718c                        
LAB_M70_r5_00000__174d:
  174d  FC7080         LDD 0x7080                        
  1750  8630           LDA #0x30                         
  1752  3D             MUL                               
  1753  FD7160         STD 0x7160                        
  1756  CC002E         LDD #0x2e                         
  1759  B3707E         SUBD 0x707e                       
  175c  C4FC           ANDB #0xfc                        
  175e  F37160         ADDD 0x7160                       
  1761  C31A62         ADDD #0x1a62                      
  1764  F3600D         ADDD 0x600d                       
  1767  1F01           TFR D,X                           
  1769  EC81           LDD ,X++                          
  176b  FD71B0         STD 0x71b0                        
  176e  EC84           LDD ,X                            
  1770  FD71AE         STD 0x71ae                        
  1773  FC7190         LDD 0x7190                        
  1776  3606           PSHU  B A                         
  1778  FC7194         LDD 0x7194                        
  177b  58             LSLB                              
  177c  3606           PSHU  B A                         
  177e  AD9FFCF0       JSR [0xfcf0]                      
  1782  3706           PULU  A B                         
  1784  3706           PULU  A B                         
  1786  FD7160         STD 0x7160                        
  1789  FC7032         LDD 0x7032                        
  178c  3606           PSHU  B A                         
  178e  CC002C         LDD #0x2c                         
  1791  3606           PSHU  B A                         
  1793  AD9FFCEE       JSR [0xfcee]                      
  1797  3706           PULU  A B                         
  1799  FD7162         STD 0x7162                        
  179c  2B0C           BMI 0x17aa                        
  179e  FC71AE         LDD 0x71ae                        
  17a1  B371B0         SUBD 0x71b0                       
  17a4  10B37162       CMPD 0x7162                       
  17a8  2E0E           BGT 0x17b8                        
LAB_M70_r5_00000__17aa:
  17aa  FC7160         LDD 0x7160                        
  17ad  F37162         ADDD 0x7162                       
  17b0  B371AE         SUBD 0x71ae                       
  17b3  FD719A         STD 0x719a                        
  17b6  2009           BRA 0x17c1                        
LAB_M70_r5_00000__17b8:
  17b8  FC7160         LDD 0x7160                        
  17bb  B371B0         SUBD 0x71b0                       
  17be  FD719A         STD 0x719a                        
LAB_M70_r5_00000__17c1:
  17c1  FC7042         LDD 0x7042                        
  17c4  3606           PSHU  B A                         
  17c6  CC002C         LDD #0x2c                         
  17c9  3606           PSHU  B A                         
  17cb  AD9FFCEE       JSR [0xfcee]                      
  17cf  3706           PULU  A B                         
  17d1  FD7162         STD 0x7162                        
  17d4  2B0C           BMI 0x17e2                        
  17d6  FC71AE         LDD 0x71ae                        
  17d9  B371B0         SUBD 0x71b0                       
  17dc  10B37162       CMPD 0x7162                       
  17e0  2E0E           BGT 0x17f0                        
LAB_M70_r5_00000__17e2:
  17e2  FC7160         LDD 0x7160                        
  17e5  F37162         ADDD 0x7162                       
  17e8  B371AE         SUBD 0x71ae                       
  17eb  FD719C         STD 0x719c                        
  17ee  2009           BRA 0x17f9                        
LAB_M70_r5_00000__17f0:
  17f0  FC7160         LDD 0x7160                        
  17f3  B371B0         SUBD 0x71b0                       
  17f6  FD719C         STD 0x719c                        
LAB_M70_r5_00000__17f9:
  17f9  FC7192         LDD 0x7192                        
  17fc  3606           PSHU  B A                         
  17fe  FC7194         LDD 0x7194                        
  1801  3606           PSHU  B A                         
  1803  AD9FFCF0       JSR [0xfcf0]                      
  1807  3706           PULU  A B                         
  1809  CCFFFF         LDD #0xffff                       
  180c  3606           PSHU  B A                         
  180e  AD9FFCDE       JSR [0xfcde]                      
  1812  3706           PULU  A B                         
  1814  FD7160         STD 0x7160                        
  1817  FD71B2         STD 0x71b2                        
  181a  F3719E         ADDD 0x719e                       
  181d  FD7090         STD 0x7090                        
  1820  FC7160         LDD 0x7160                        
  1823  F371A0         ADDD 0x71a0                       
  1826  FD7094         STD 0x7094                        
  1829  CC7FFF         LDD #0x7fff                       
  182c  3606           PSHU  B A                         
  182e  FC7160         LDD 0x7160                        
  1831  3606           PSHU  B A                         
  1833  AD9FFCEA       JSR [0xfcea]                      
  1837  3706           PULU  A B                         
  1839  C30005         ADDD #0x5                         
  183c  FD708E         STD 0x708e                        
  183f  CC000A         LDD #0xa                          
  1842  AD9FFD20       JSR [0xfd20]                      
  1846  108E0342       LDY #0x342                        
  184a  FC708E         LDD 0x708e                        
  184d  AD9FFD2E       JSR [0xfd2e]                      
  1851  CC000A         LDD #0xa                          
  1854  AD9FFD20       JSR [0xfd20]                      
  1858  108E0141       LDY #0x141                        
  185c  FC7094         LDD 0x7094                        
  185f  AD9FFD2E       JSR [0xfd2e]                      
  1863  CC000A         LDD #0xa                          
  1866  AD9FFD20       JSR [0xfd20]                      
  186a  108E0241       LDY #0x241                        
  186e  FC7090         LDD 0x7090                        
  1871  AD9FFD2E       JSR [0xfd2e]                      
  1875  CC0000         LDD #0x0                          
  1878  FD7174         STD 0x7174                        
  187b  3576           PULS  A B X Y U                   
  187d  39             RTS                               

; ---- function FUN_M70_r5_00000__187e
FUN_M70_r5_00000__187e:
  187e  3437           PSHS  Y X B A CC                  
  1880  3706           PULU  A B                         
  1882  FD7164         STD 0x7164                        
  1885  3706           PULU  A B                         
  1887  FD7166         STD 0x7166                        
  188a  FC7166         LDD 0x7166                        
  188d  C30018         ADDD #0x18                        
  1890  58             LSLB                              
  1891  49             ROLA                              
  1892  F3600D         ADDD 0x600d                       
  1895  C318FC         ADDD #0x18fc                      
  1898  1F01           TFR D,X                           
  189a  FC7164         LDD 0x7164                        
  189d  FD7162         STD 0x7162                        
  18a0  2E08           BGT 0x18aa                        
  18a2  CC0000         LDD #0x0                          
  18a5  B37162         SUBD 0x7162                       
  18a8  2008           BRA 0x18b2                        
LAB_M70_r5_00000__18aa:
  18aa  CC0064         LDD #0x64                         
  18ad  B37162         SUBD 0x7162                       
  18b0  3002           LEAX 0x2,X                        
LAB_M70_r5_00000__18b2:
  18b2  58             LSLB                              
  18b3  49             ROLA                              
  18b4  F3600D         ADDD 0x600d                       
  18b7  C31996         ADDD #0x1996                      
  18ba  1F02           TFR D,Y                           
  18bc  EC84           LDD ,X                            
  18be  3606           PSHU  B A                         
  18c0  ECA4           LDD ,Y                            
  18c2  3606           PSHU  B A                         
  18c4  AD9FFCF2       JSR [0xfcf2]                      
  18c8  3083           LEAX ,--X                         
  18ca  FC7162         LDD 0x7162                        
  18cd  2E03           BGT 0x18d2                        
  18cf  C30064         ADDD #0x64                        
LAB_M70_r5_00000__18d2:
  18d2  58             LSLB                              
  18d3  49             ROLA                              
  18d4  F3600D         ADDD 0x600d                       
  18d7  C31996         ADDD #0x1996                      
  18da  1F02           TFR D,Y                           
  18dc  EC89004E       LDD 0x4e,X                        
  18e0  3606           PSHU  B A                         
  18e2  ECA4           LDD ,Y                            
  18e4  3606           PSHU  B A                         
  18e6  AD9FFCF2       JSR [0xfcf2]                      
  18ea  3706           PULU  A B                         
  18ec  FD7160         STD 0x7160                        
  18ef  CC1000         LDD #0x1000                       
  18f2  B37160         SUBD 0x7160                       
  18f5  3606           PSHU  B A                         
  18f7  3537           PULS CC A B X Y                   
  18f9  39             RTS                               
  18fa  .db 00 EC                                            ; ..
DAT_M70_r5_00000__18fc:
  18fc  00             ?? 00h                            
  18fd  .db FA                                               ; .
DAT_M70_r5_00000__18fe:
  18fe  01             ?? 01h                            
  18ff  .db 09 01 19 01 29 01 3B 01 4E 01 62 01 77 01 8D 01  ; ....).;.N.b.w...
  190f  .db A4 01 BD 01 D8 01 F4 02 12 02 31 02 53 02 76 02  ; ..........1.S.v.
  191f  .db 9B 02 C3 02 ED 03 1A 03 49 03 7B 03 B0 03 E8 04  ; ........I.{.....
  192f  .db 23 04 62 04 A5 04 EC 05 37 05 86 05 DA 06 33 06  ; #.b.....7.....3.
  193f  .db 92 06 F6 07 60 07 D0 08 47                       ; ....`...G
DAT_M70_r5_00000__1948:
  1948  0D             ?? 0Dh                            
  1949  .db C5 0D 00 0C 45 0B 95 0A EF 0A 51 09 BD 09 31 08  ; ....E.....Q...1.
  1959  .db AD 08 31 07 BB 07 4C 06 E3 06 80 06 23 05 CA 05  ; ..1...L.....#...
  1969  .db 77 05 29 04 DF 04 99 04 57 04 18 03 DD 03 A6 03  ; w.).....W.......
  1979  .db 71 03 40 03 11 02 E5 02 BC 02 94 02 6F 02 4C 02  ; q.@.........o.L.
  1989  .db 2B 02 0C 01 EF 01 D3 01 B9 01 A0 01 88           ; +............
DAT_M70_r5_00000__1996:
  1996  7F             ?? 7Fh                           
  1997  .db FF 7F EC 7F D9 7F C6 7F B3 7F A0 7F 8D 7F 7A 7F  ; ..............z.
  19a7  .db 67 7F 55 7F 42 7F 39 7F 1C 7F 09 7E F7 7E E4 7E  ; g.U.B.9....~.~.~
  19b7  .db D1 7E BE 7E AC 7E 99 7E 86 7E 73 7E 61 7E 4E 7E  ; .~.~.~.~.~s~a~N~
  19c7  .db 3B 7E 29 7E 16 7E 03 7D F1 7D DE 7D CC 7D B9 7D  ; ;~)~.~.}.}.}.}.}
  19d7  .db A6 7D 94 7D 81 7D 6F 7D 52 7D 4A 7D 37 7D 25 7D  ; .}.}.}o}R}J}7}%}
  19e7  .db 12 7D 00 7C ED 7C DB 7C C8 7C B6 7C A3 7C 91 7C  ; .}.|.|.|.|.|.|.|
  19f7  .db 7E 7C 6C 7C 5A 7C 48 7C 35 7C 23 7C 11 7B FE 7B  ; ~|l|Z|H|5|#|.{.{
  1a07  .db EC 7B DA 7B C7 7B B5 7B A3 7B 90 7B 7E 7B 6C 7B  ; .{.{.{.{.{.{~{l{
  1a17  .db 5A 7B 47 7B 35 7B 23 7B 11 7A FF 7A EC 7A DA 7A  ; Z{G{5{#{.z.z.z.z
  1a27  .db C8 7A B6 7A A4 7A 92 7A 7F 7A 6D 7A 5B 7A 49 7A  ; .z.z.z.z.zmz[zIz
  1a37  .db 37 7A 25 7A 13 7A 01 79 EF 79 DD 79 CB 79 B9 79  ; 7z%z.z.y.y.y.y.y
  1a47  .db A7 79 95 79 83 79 71 79 5F 79 4D 79 3B 79 29 79  ; .y.y.yqy_yMy;y)y
  1a57  .db 17 79 05 78 F3 78 E2 78 D0 78 BE 00 00 01 F4 00  ; .y.x.x.x.x......
  1a67  .db 00 02 3F 00 32 02 BC 00 96 03 52 01 2C 03 CF 01  ; ..?.2.....R.,...
  1a77  .db C2 04 E2 02 58 06 0E 03 84 07 3A 04 B0 09 2E 06  ; ....X.....:.....
  1a87  .db 40 0C 1C 08 34 0F 3C 0F A0 13 EC 00 00 01 2C 00  ; @...4.<.......,.
  1a97  .db 00 01 5E 00 32 01 C2 00 64 02 0D 00 AF 02 3F 00  ; ..^.2...d.....?.
  1aa7  .db FA 02 EE 01 5E 03 E8 01 C2 04 B0 02 8A 06 0E 03  ; ....^...........
  1ab7  .db 20 08 34 04 4C 0A 8C 08 66 0E 10 00 00 00 AF 00  ;  .4.L...f.......
  1ac7  .db 00 00 AF 00 32 00 E1 00 32 01 2C 00 64 01 90 00  ; ....2...2.,.d...
  1ad7  .db 96 02 0D 00 AF 02 BC 00 FA 03 52 01 5E 04 4C 01  ; ..........R.^.L.
  1ae7  .db 90 06 0E 02 26 07 E9 04 1A 0A BE 00 00 00 AF 00  ; ....&...........
  1af7  .db 00 00 E1 00 00 00 E1 00 32 01 13 00 4B 01 13 00  ; ........2...K...
  1b07  .db 64 01 90 00 7D 02 3F 00 AF 02 A3 00 C8 03 52 00  ; d...}.?.......R.
  1b17  .db FA 04 FB 01 2C 06 8B 02 58 08 FC 00 00 00 64 00  ; ....,...X.....d.
  1b27  .db 00 00 7D 00 00 00 7D 00 00 00 AF 00 00 00 AF 00  ; ..}...}.........
  1b37  .db 00 01 13 00 00 01 90 00 32 01 F4 00 4B 02 A3 00  ; ........2...K...
  1b47  .db 64 04 1A 00 7D 05 78 00 FA 07 D0 38 20 48 7A 39  ; d...}.x....8 Hz9
  1b57  .db 20 48 7A 39 20 48 7A 31 30 48 7A 31 30 48 7A 31  ;  Hz9 Hz10Hz10Hz1
  1b67  .db 31 48 7A 31 32 48 7A 31 32 48 7A 31 33 48 7A 31  ; 1Hz12Hz12Hz13Hz1
  1b77  .db 34 48 7A 31 34 48 7A 31 35 48 7A 43 30 20 20 43  ; 4Hz14Hz15HzC0  C
  1b87  .db 30 23 20 44 30 20 20 44 30 23 20 45 30 20 20 46  ; 0# D0  D0# E0  F
  1b97  .db 30 20 20 46 30 23 20 47 30 20 20 47 30 23 20 41  ; 0  F0# G0  G0# A
  1ba7  .db 30 20 20 41 30 23 20 42 30 20 20 43 31 20 20 43  ; 0  A0# B0  C1  C
  1bb7  .db 31 23 20 44 31 20 20 44 31 23 20 45 31 20 20 46  ; 1# D1  D1# E1  F
  1bc7  .db 31 20 20 46 31 23 20 47 31 20 20 47 31 23 20 41  ; 1  F1# G1  G1# A
  1bd7  .db 31 20 20 41 31 23 20 42 31 20 20 43 32 20 20 43  ; 1  A1# B1  C2  C
  1be7  .db 32 23 20 44 32 20 20 44 32 23 20 45 32 20 20 46  ; 2# D2  D2# E2  F
  1bf7  .db 32 20 20 46 32 23 20 47 32 20 20 47 32 23 20 41  ; 2  F2# G2  G2# A
  1c07  .db 32 20 20 41 32 23 20 42 32 20 20 43 33 20 20 43  ; 2  A2# B2  C3  C
  1c17  .db 33 23 20 44 33 20 20 44 33 23 20 45 33 20 20 46  ; 3# D3  D3# E3  F
  1c27  .db 33 20 20 46 33 23 20 47 33 20 20 47 33 23 20 41  ; 3  F3# G3  G3# A
  1c37  .db 33 20 20 41 33 23 20 42 33 20 20 43 34 20 20 43  ; 3  A3# B3  C4  C
  1c47  .db 34 23 20 44 34 20 20 44 34 23 20 45 34 20 20 46  ; 4# D4  D4# E4  F
  1c57  .db 34 20 20 46 34 23 20 47 34 20 20 47 34 23 20 41  ; 4  F4# G4  G4# A
  1c67  .db 34 20 20 41 34 23 20 42 34 20 20 43 35 20 20 43  ; 4  A4# B4  C5  C
  1c77  .db 35 23 20 44 35 20 20 44 35 23 20 45 35 20 20 46  ; 5# D5  D5# E5  F
  1c87  .db 35 20 20 46 35 23 20 47 35 20 20 47 35 23 20 41  ; 5  F5# G5  G5# A
  1c97  .db 35 20 20 41 35 23 20 42 35 20 20 43 36 20 20 43  ; 5  A5# B5  C6  C
  1ca7  .db 36 23 20 44 36 20 20 44 36 23 20 45 36 20 20 46  ; 6# D6  D6# E6  F
  1cb7  .db 36 20 20 46 36 23 20 47 36 20 20 47 36 23 20 41  ; 6  F6# G6  G6# A
  1cc7  .db 36 20 20 41 36 23 20 42 36 20 20 43 37 20 20 43  ; 6  A6# B6  C7  C
  1cd7  .db 37 23 20 44 37 20 20 44 37 23 20 45 37 20 20 46  ; 7# D7  D7# E7  F
  1ce7  .db 37 20 20 46 37 23 20 47 37 20 20 47 37 23 20 41  ; 7  F7# G7  G7# A
  1cf7  .db 37 20 20 41 37 23 20 42 37 20 20 01 3F 01 2D 01  ; 7  A7# B7  .?.-.
  1d07  .db 1C 01 0C 00 FD 00 EF 00 E1 00 D5 00 C9 00 BE 00  ; ................
  1d17  .db B3 00 A9 00 A0 00 97 00 8E 00 86 00 7F 00 78 00  ; ..............x.
  1d27  .db 71 00 6B 00 65 00 5F 00 5A 00 55 00 50 00 4C 00  ; q.k.e._.Z.U.P.L.
  1d37  .db 47 00 43 00 40 00 3C 00 39 00 36 00 33 00 30 00  ; G.C.@.<.9.6.3.0.
  1d47  .db 2D 00 2B 00 28 00 26 00 24 00 22 00 20 00 1E 00  ; -.+.(.&.$.". ...
  1d57  .db 1D 00 1B 00 1A 00 18 00 17 00 16 00 14 00 13 00  ; ................
  1d67  .db 12 00 11 00 10 00 0F 00 0F 00 0E 00 0D 00 0C 00  ; ................
  1d77  .db 0C 00 0B 78 CF 86 D8 00 16 00 2C 00 16 71 57 8D  ; ...x......,..qW.
  1d87  .db 52 00 56 00 AC 00 56 61 AD 99 39 01 46 02 8C 01  ; R.V...Va..9.F...
  1d97  .db 46 40 10 AD 4B 04 A9 09 52 04 A9                 ; F@..K...R..

;; Module 70 code record 03, 4731 bytes, entered at payload start
MODULE_70_03_CODE_hdr:
  1da2  700312830000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_70_03_entry
MODULE_70_03_entry:
  1daa  39             RTS                               
  1dab  .db 39                                               ; 9

; ---- function FUN_M70_r5_00000__1dac
FUN_M70_r5_00000__1dac:
  1dac  3476           PSHS  U Y X B A                   
  1dae  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "-----------------"
  1db2  2D2D2D2D2D2D.. char[18] "-----------------"      
LAB_M70_r5_00000__1dc4:
  1dc4  3576           PULS  A B X Y U                   
  1dc6  39             RTS                               

; ---- function FUN_M70_r5_00000__1dc7
FUN_M70_r5_00000__1dc7:
  1dc7  3476           PSHS  U Y X B A                   
  1dc9  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rnd stutter left "
  1dcd  726E64207374.. char[18] "rnd stutter left "      
LAB_M70_r5_00000__1ddf:
  1ddf  3576           PULS  A B X Y U                   
  1de1  39             RTS                               

; ---- function FUN_M70_r5_00000__1de2
FUN_M70_r5_00000__1de2:
  1de2  3476           PSHS  U Y X B A                   
  1de4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rnd stutter right"
  1de8  726E64207374.. char[18] "rnd stutter right"      
LAB_M70_r5_00000__1dfa:
  1dfa  3576           PULS  A B X Y U                   
  1dfc  39             RTS                               

; ---- function FUN_M70_r5_00000__1dfd
FUN_M70_r5_00000__1dfd:
  1dfd  3476           PSHS  U Y X B A                   
  1dff  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rnd stutter both "
  1e03  726E64207374.. char[18] "rnd stutter both "      
LAB_M70_r5_00000__1e15:
  1e15  3576           PULS  A B X Y U                   
  1e17  39             RTS                               

; ---- function FUN_M70_r5_00000__1e18
FUN_M70_r5_00000__1e18:
  1e18  3476           PSHS  U Y X B A                   
  1e1a  CC0000         LDD #0x0                          
  1e1d  200E           BRA 0x1e2d                        

; ---- function FUN_M70_r5_00000__1e1f
FUN_M70_r5_00000__1e1f:
  1e1f  3476           PSHS  U Y X B A                   
  1e21  CC0001         LDD #0x1                          
  1e24  2007           BRA 0x1e2d                        

; ---- function FUN_M70_r5_00000__1e26
FUN_M70_r5_00000__1e26:
  1e26  3476           PSHS  U Y X B A                   
  1e28  CC0002         LDD #0x2                          
  1e2b  2000           BRA 0x1e2d                        

; ---- function FUN_M70_r5_00000__1e2d
FUN_M70_r5_00000__1e2d:
  1e2d  FD713E         STD 0x713e                        
  1e30  1706DE         LBSR 0x2511                       
  1e33  3576           PULS  A B X Y U                   
  1e35  39             RTS                               

; ---- function FUN_M70_r5_00000__1e36
FUN_M70_r5_00000__1e36:
  1e36  3476           PSHS  U Y X B A                   
  1e38  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stutter 1 left   "
  1e3c  737475747465.. char[18] "stutter 1 left   "      
LAB_M70_r5_00000__1e4e:
  1e4e  3576           PULS  A B X Y U                   
  1e50  39             RTS                               

; ---- function FUN_M70_r5_00000__1e51
FUN_M70_r5_00000__1e51:
  1e51  3476           PSHS  U Y X B A                   
  1e53  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stutter 1 right  "
  1e57  737475747465.. char[18] "stutter 1 right  "      
LAB_M70_r5_00000__1e69:
  1e69  3576           PULS  A B X Y U                   
  1e6b  39             RTS                               

; ---- function FUN_M70_r5_00000__1e6c
FUN_M70_r5_00000__1e6c:
  1e6c  3476           PSHS  U Y X B A                   
  1e6e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stutter 1 both   "
  1e72  737475747465.. char[18] "stutter 1 both   "      
LAB_M70_r5_00000__1e84:
  1e84  3576           PULS  A B X Y U                   
  1e86  39             RTS                               

; ---- function FUN_M70_r5_00000__1e87
FUN_M70_r5_00000__1e87:
  1e87  3476           PSHS  U Y X B A                   
  1e89  CC0000         LDD #0x0                          
  1e8c  200E           BRA 0x1e9c                        

; ---- function FUN_M70_r5_00000__1e8e
FUN_M70_r5_00000__1e8e:
  1e8e  3476           PSHS  U Y X B A                   
  1e90  CC0001         LDD #0x1                          
  1e93  2007           BRA 0x1e9c                        

; ---- function FUN_M70_r5_00000__1e95
FUN_M70_r5_00000__1e95:
  1e95  3476           PSHS  U Y X B A                   
  1e97  CC0002         LDD #0x2                          
  1e9a  2000           BRA 0x1e9c                        

; ---- function FUN_M70_r5_00000__1e9c
FUN_M70_r5_00000__1e9c:
  1e9c  FD713A         STD 0x713a                        
  1e9f  170739         LBSR 0x25db                       
  1ea2  3576           PULS  A B X Y U                   
  1ea4  39             RTS                               

; ---- function FUN_M70_r5_00000__1ea5
FUN_M70_r5_00000__1ea5:
  1ea5  3476           PSHS  U Y X B A                   
  1ea7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stutter 2 left   "
  1eab  737475747465.. char[18] "stutter 2 left   "      
LAB_M70_r5_00000__1ebd:
  1ebd  3576           PULS  A B X Y U                   
  1ebf  39             RTS                               

; ---- function FUN_M70_r5_00000__1ec0
FUN_M70_r5_00000__1ec0:
  1ec0  3476           PSHS  U Y X B A                   
  1ec2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stutter 2 right  "
  1ec6  737475747465.. char[18] "stutter 2 right  "      
LAB_M70_r5_00000__1ed8:
  1ed8  3576           PULS  A B X Y U                   
  1eda  39             RTS                               

; ---- function FUN_M70_r5_00000__1edb
FUN_M70_r5_00000__1edb:
  1edb  3476           PSHS  U Y X B A                   
  1edd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stutter 2 both   "
  1ee1  737475747465.. char[18] "stutter 2 both   "      
LAB_M70_r5_00000__1ef3:
  1ef3  3576           PULS  A B X Y U                   
  1ef5  39             RTS                               

; ---- function FUN_M70_r5_00000__1ef6
FUN_M70_r5_00000__1ef6:
  1ef6  3476           PSHS  U Y X B A                   
  1ef8  CC0000         LDD #0x0                          
  1efb  200E           BRA 0x1f0b                        

; ---- function FUN_M70_r5_00000__1efd
FUN_M70_r5_00000__1efd:
  1efd  3476           PSHS  U Y X B A                   
  1eff  CC0001         LDD #0x1                          
  1f02  2007           BRA 0x1f0b                        

; ---- function FUN_M70_r5_00000__1f04
FUN_M70_r5_00000__1f04:
  1f04  3476           PSHS  U Y X B A                   
  1f06  CC0002         LDD #0x2                          
  1f09  2000           BRA 0x1f0b                        

; ---- function FUN_M70_r5_00000__1f0b
FUN_M70_r5_00000__1f0b:
  1f0b  FD713C         STD 0x713c                        
  1f0e  17076C         LBSR 0x267d                       
  1f11  3576           PULS  A B X Y U                   
  1f13  39             RTS                               

; ---- function FUN_M70_r5_00000__1f14
FUN_M70_r5_00000__1f14:
  1f14  3476           PSHS  U Y X B A                   
  1f16  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep up 1 left  "
  1f1a  737765657020.. char[18] "sweep up 1 left  "      
LAB_M70_r5_00000__1f2c:
  1f2c  3576           PULS  A B X Y U                   
  1f2e  39             RTS                               

; ---- function FUN_M70_r5_00000__1f2f
FUN_M70_r5_00000__1f2f:
  1f2f  3476           PSHS  U Y X B A                   
  1f31  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep up 1 right "
  1f35  737765657020.. char[18] "sweep up 1 right "      
LAB_M70_r5_00000__1f47:
  1f47  3576           PULS  A B X Y U                   
  1f49  39             RTS                               

; ---- function FUN_M70_r5_00000__1f4a
FUN_M70_r5_00000__1f4a:
  1f4a  3476           PSHS  U Y X B A                   
  1f4c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep up 1 both  "
  1f50  737765657020.. char[18] "sweep up 1 both  "      
LAB_M70_r5_00000__1f62:
  1f62  3576           PULS  A B X Y U                   
  1f64  39             RTS                               

; ---- function FUN_M70_r5_00000__1f65
FUN_M70_r5_00000__1f65:
  1f65  3476           PSHS  U Y X B A                   
  1f67  CC0000         LDD #0x0                          
  1f6a  200E           BRA 0x1f7a                        

; ---- function FUN_M70_r5_00000__1f6c
FUN_M70_r5_00000__1f6c:
  1f6c  3476           PSHS  U Y X B A                   
  1f6e  CC0001         LDD #0x1                          
  1f71  2007           BRA 0x1f7a                        

; ---- function FUN_M70_r5_00000__1f73
FUN_M70_r5_00000__1f73:
  1f73  3476           PSHS  U Y X B A                   
  1f75  CC0002         LDD #0x2                          
  1f78  2000           BRA 0x1f7a                        

; ---- function FUN_M70_r5_00000__1f7a
FUN_M70_r5_00000__1f7a:
  1f7a  FD712A         STD 0x712a                        
  1f7d  CC2378         LDD #0x2378                       
  1f80  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  1f84  6097           addr 6097                         
LAB_M70_r5_00000__1f86:
  1f86  CC0001         LDD #0x1                          
  1f89  AD9FFCC4       JSR [0xfcc4]                      
  1f8d  3576           PULS  A B X Y U                   
  1f8f  39             RTS                               

; ---- function FUN_M70_r5_00000__1f90
FUN_M70_r5_00000__1f90:
  1f90  3476           PSHS  U Y X B A                   
  1f92  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep dwn 1 left "
  1f96  737765657020.. char[18] "sweep dwn 1 left "      
LAB_M70_r5_00000__1fa8:
  1fa8  3576           PULS  A B X Y U                   
  1faa  39             RTS                               

; ---- function FUN_M70_r5_00000__1fab
FUN_M70_r5_00000__1fab:
  1fab  3476           PSHS  U Y X B A                   
  1fad  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep dwn 1 right"
  1fb1  737765657020.. char[18] "sweep dwn 1 right"      
LAB_M70_r5_00000__1fc3:
  1fc3  3576           PULS  A B X Y U                   
  1fc5  39             RTS                               

; ---- function FUN_M70_r5_00000__1fc6
FUN_M70_r5_00000__1fc6:
  1fc6  3476           PSHS  U Y X B A                   
  1fc8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep dwn 1 both "
  1fcc  737765657020.. char[18] "sweep dwn 1 both "      
LAB_M70_r5_00000__1fde:
  1fde  3576           PULS  A B X Y U                   
  1fe0  39             RTS                               

; ---- function FUN_M70_r5_00000__1fe1
FUN_M70_r5_00000__1fe1:
  1fe1  3476           PSHS  U Y X B A                   
  1fe3  CC0000         LDD #0x0                          
  1fe6  200E           BRA 0x1ff6                        

; ---- function FUN_M70_r5_00000__1fe8
FUN_M70_r5_00000__1fe8:
  1fe8  3476           PSHS  U Y X B A                   
  1fea  CC0001         LDD #0x1                          
  1fed  2007           BRA 0x1ff6                        

; ---- function FUN_M70_r5_00000__1fef
FUN_M70_r5_00000__1fef:
  1fef  3476           PSHS  U Y X B A                   
  1ff1  CC0002         LDD #0x2                          
  1ff4  2000           BRA 0x1ff6                        

; ---- function FUN_M70_r5_00000__1ff6
FUN_M70_r5_00000__1ff6:
  1ff6  FD712C         STD 0x712c                        
  1ff9  CC23B0         LDD #0x23b0                       
  1ffc  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  2000  6097           addr 6097                         
LAB_M70_r5_00000__2002:
  2002  CC0001         LDD #0x1                          
  2005  AD9FFCC4       JSR [0xfcc4]                      
  2009  3576           PULS  A B X Y U                   
  200b  39             RTS                               

; ---- function FUN_M70_r5_00000__200c
FUN_M70_r5_00000__200c:
  200c  3476           PSHS  U Y X B A                   
  200e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "zero sweep1 left "
  2012  7A65726F2073.. char[18] "zero sweep1 left "      
LAB_M70_r5_00000__2024:
  2024  3576           PULS  A B X Y U                   
  2026  39             RTS                               

; ---- function FUN_M70_r5_00000__2027
FUN_M70_r5_00000__2027:
  2027  3476           PSHS  U Y X B A                   
  2029  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "zero sweep1 right"
  202d  7A65726F2073.. char[18] "zero sweep1 right"      
LAB_M70_r5_00000__203f:
  203f  3576           PULS  A B X Y U                   
  2041  39             RTS                               

; ---- function FUN_M70_r5_00000__2042
FUN_M70_r5_00000__2042:
  2042  3476           PSHS  U Y X B A                   
  2044  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "zero sweep1 both "
  2048  7A65726F2073.. char[18] "zero sweep1 both "      
LAB_M70_r5_00000__205a:
  205a  3576           PULS  A B X Y U                   
  205c  39             RTS                               

; ---- function FUN_M70_r5_00000__205d
FUN_M70_r5_00000__205d:
  205d  3476           PSHS  U Y X B A                   
  205f  CC0000         LDD #0x0                          
  2062  200E           BRA 0x2072                        

; ---- function FUN_M70_r5_00000__2064
FUN_M70_r5_00000__2064:
  2064  3476           PSHS  U Y X B A                   
  2066  CC0001         LDD #0x1                          
  2069  2007           BRA 0x2072                        

; ---- function FUN_M70_r5_00000__206b
FUN_M70_r5_00000__206b:
  206b  3476           PSHS  U Y X B A                   
  206d  CC0002         LDD #0x2                          
  2070  2000           BRA 0x2072                        

; ---- function FUN_M70_r5_00000__2072
FUN_M70_r5_00000__2072:
  2072  FD7132         STD 0x7132                        
  2075  CC1DAA         LDD #0x1daa                       
  2078  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  207c  6097           addr 6097                         
LAB_M70_r5_00000__207e:
  207e  170367         LBSR 0x23e8                       
  2081  3576           PULS  A B X Y U                   
  2083  39             RTS                               

; ---- function FUN_M70_r5_00000__2084
FUN_M70_r5_00000__2084:
  2084  3476           PSHS  U Y X B A                   
  2086  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep up 2 left  "
  208a  737765657020.. char[18] "sweep up 2 left  "      
LAB_M70_r5_00000__209c:
  209c  3576           PULS  A B X Y U                   
  209e  39             RTS                               

; ---- function FUN_M70_r5_00000__209f
FUN_M70_r5_00000__209f:
  209f  3476           PSHS  U Y X B A                   
  20a1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep up 2 right "
  20a5  737765657020.. char[18] "sweep up 2 right "      
LAB_M70_r5_00000__20b7:
  20b7  3576           PULS  A B X Y U                   
  20b9  39             RTS                               

; ---- function FUN_M70_r5_00000__20ba
FUN_M70_r5_00000__20ba:
  20ba  3476           PSHS  U Y X B A                   
  20bc  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep up 2 both  "
  20c0  737765657020.. char[18] "sweep up 2 both  "      
LAB_M70_r5_00000__20d2:
  20d2  3576           PULS  A B X Y U                   
  20d4  39             RTS                               

; ---- function FUN_M70_r5_00000__20d5
FUN_M70_r5_00000__20d5:
  20d5  3476           PSHS  U Y X B A                   
  20d7  CC0000         LDD #0x0                          
  20da  200E           BRA 0x20ea                        

; ---- function FUN_M70_r5_00000__20dc
FUN_M70_r5_00000__20dc:
  20dc  3476           PSHS  U Y X B A                   
  20de  CC0001         LDD #0x1                          
  20e1  2007           BRA 0x20ea                        

; ---- function FUN_M70_r5_00000__20e3
FUN_M70_r5_00000__20e3:
  20e3  3476           PSHS  U Y X B A                   
  20e5  CC0002         LDD #0x2                          
  20e8  2000           BRA 0x20ea                        

; ---- function FUN_M70_r5_00000__20ea
FUN_M70_r5_00000__20ea:
  20ea  FD712E         STD 0x712e                        
  20ed  CC23F9         LDD #0x23f9                       
  20f0  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  20f4  6095           addr 6095                         
LAB_M70_r5_00000__20f6:
  20f6  CC0001         LDD #0x1                          
  20f9  AD9FFCC2       JSR [0xfcc2]                      
  20fd  3576           PULS  A B X Y U                   
  20ff  39             RTS                               

; ---- function FUN_M70_r5_00000__2100
FUN_M70_r5_00000__2100:
  2100  3476           PSHS  U Y X B A                   
  2102  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep dwn 2 left "
  2106  737765657020.. char[18] "sweep dwn 2 left "      
LAB_M70_r5_00000__2118:
  2118  3576           PULS  A B X Y U                   
  211a  39             RTS                               

; ---- function FUN_M70_r5_00000__211b
FUN_M70_r5_00000__211b:
  211b  3476           PSHS  U Y X B A                   
  211d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep dwn 2 right"
  2121  737765657020.. char[18] "sweep dwn 2 right"      
LAB_M70_r5_00000__2133:
  2133  3576           PULS  A B X Y U                   
  2135  39             RTS                               

; ---- function FUN_M70_r5_00000__2136
FUN_M70_r5_00000__2136:
  2136  3476           PSHS  U Y X B A                   
  2138  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep dwn 2 both "
  213c  737765657020.. char[18] "sweep dwn 2 both "      
LAB_M70_r5_00000__214e:
  214e  3576           PULS  A B X Y U                   
  2150  39             RTS                               

; ---- function FUN_M70_r5_00000__2151
FUN_M70_r5_00000__2151:
  2151  3476           PSHS  U Y X B A                   
  2153  CC0000         LDD #0x0                          
  2156  200E           BRA 0x2166                        

; ---- function FUN_M70_r5_00000__2158
FUN_M70_r5_00000__2158:
  2158  3476           PSHS  U Y X B A                   
  215a  CC0001         LDD #0x1                          
  215d  2007           BRA 0x2166                        

; ---- function FUN_M70_r5_00000__215f
FUN_M70_r5_00000__215f:
  215f  3476           PSHS  U Y X B A                   
  2161  CC0002         LDD #0x2                          
  2164  2000           BRA 0x2166                        

; ---- function FUN_M70_r5_00000__2166
FUN_M70_r5_00000__2166:
  2166  FD7130         STD 0x7130                        
  2169  CC2431         LDD #0x2431                       
  216c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  2170  6095           addr 6095                         
LAB_M70_r5_00000__2172:
  2172  CC0001         LDD #0x1                          
  2175  AD9FFCC2       JSR [0xfcc2]                      
  2179  3576           PULS  A B X Y U                   
  217b  39             RTS                               

; ---- function FUN_M70_r5_00000__217c
FUN_M70_r5_00000__217c:
  217c  3476           PSHS  U Y X B A                   
  217e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "zero swp 2 left  "
  2182  7A65726F2073.. char[18] "zero swp 2 left  "      
LAB_M70_r5_00000__2194:
  2194  3576           PULS  A B X Y U                   
  2196  39             RTS                               

; ---- function FUN_M70_r5_00000__2197
FUN_M70_r5_00000__2197:
  2197  3476           PSHS  U Y X B A                   
  2199  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "zero swp 2 right "
  219d  7A65726F2073.. char[18] "zero swp 2 right "      
LAB_M70_r5_00000__21af:
  21af  3576           PULS  A B X Y U                   
  21b1  39             RTS                               

; ---- function FUN_M70_r5_00000__21b2
FUN_M70_r5_00000__21b2:
  21b2  3476           PSHS  U Y X B A                   
  21b4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "zero swp 2 both  "
  21b8  7A65726F2073.. char[18] "zero swp 2 both  "      
LAB_M70_r5_00000__21ca:
  21ca  3576           PULS  A B X Y U                   
  21cc  39             RTS                               

; ---- function FUN_M70_r5_00000__21cd
FUN_M70_r5_00000__21cd:
  21cd  3476           PSHS  U Y X B A                   
  21cf  CC0000         LDD #0x0                          
  21d2  200E           BRA 0x21e2                        

; ---- function FUN_M70_r5_00000__21d4
FUN_M70_r5_00000__21d4:
  21d4  3476           PSHS  U Y X B A                   
  21d6  CC0001         LDD #0x1                          
  21d9  2007           BRA 0x21e2                        

; ---- function FUN_M70_r5_00000__21db
FUN_M70_r5_00000__21db:
  21db  3476           PSHS  U Y X B A                   
  21dd  CC0002         LDD #0x2                          
  21e0  2000           BRA 0x21e2                        

; ---- function FUN_M70_r5_00000__21e2
FUN_M70_r5_00000__21e2:
  21e2  FD7134         STD 0x7134                        
  21e5  CC1DAA         LDD #0x1daa                       
  21e8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  21ec  6095           addr 6095                         
LAB_M70_r5_00000__21ee:
  21ee  170278         LBSR 0x2469                       
  21f1  3576           PULS  A B X Y U                   
  21f3  39             RTS                               

; ---- function FUN_M70_r5_00000__21f4
FUN_M70_r5_00000__21f4:
  21f4  3476           PSHS  U Y X B A                   
  21f6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rand swp 1 left  "
  21fa  72616E642073.. char[18] "rand swp 1 left  "      
LAB_M70_r5_00000__220c:
  220c  3576           PULS  A B X Y U                   
  220e  39             RTS                               

; ---- function FUN_M70_r5_00000__220f
FUN_M70_r5_00000__220f:
  220f  3476           PSHS  U Y X B A                   
  2211  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rand swp 1 right "
  2215  72616E642073.. char[18] "rand swp 1 right "      
LAB_M70_r5_00000__2227:
  2227  3576           PULS  A B X Y U                   
  2229  39             RTS                               

; ---- function FUN_M70_r5_00000__222a
FUN_M70_r5_00000__222a:
  222a  3476           PSHS  U Y X B A                   
  222c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rand swp 1 both  "
  2230  72616E642073.. char[18] "rand swp 1 both  "      
LAB_M70_r5_00000__2242:
  2242  3576           PULS  A B X Y U                   
  2244  39             RTS                               

; ---- function FUN_M70_r5_00000__2245
FUN_M70_r5_00000__2245:
  2245  3476           PSHS  U Y X B A                   
  2247  CC0000         LDD #0x0                          
  224a  200C           BRA 0x2258                        

; ---- function FUN_M70_r5_00000__224c
FUN_M70_r5_00000__224c:
  224c  3476           PSHS  U Y X B A                   
  224e  CC0001         LDD #0x1                          
  2251  2005           BRA 0x2258                        

; ---- function FUN_M70_r5_00000__2253
FUN_M70_r5_00000__2253:
  2253  3476           PSHS  U Y X B A                   
  2255  CC0002         LDD #0x2                          
LAB_M70_r5_00000__2258:
  2258  FD7136         STD 0x7136                        
  225b  CC1DAA         LDD #0x1daa                       
  225e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  2262  6097           addr 6097                         
LAB_M70_r5_00000__2264:
  2264  170213         LBSR 0x247a                       
  2267  3576           PULS  A B X Y U                   
  2269  39             RTS                               

; ---- function FUN_M70_r5_00000__226a
FUN_M70_r5_00000__226a:
  226a  3476           PSHS  U Y X B A                   
  226c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rand swp 2 left  "
  2270  72616E642073.. char[18] "rand swp 2 left  "      
LAB_M70_r5_00000__2282:
  2282  3576           PULS  A B X Y U                   
  2284  39             RTS                               

; ---- function FUN_M70_r5_00000__2285
FUN_M70_r5_00000__2285:
  2285  3476           PSHS  U Y X B A                   
  2287  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rand swp 2 right "
  228b  72616E642073.. char[18] "rand swp 2 right "      
LAB_M70_r5_00000__229d:
  229d  3576           PULS  A B X Y U                   
  229f  39             RTS                               

; ---- function FUN_M70_r5_00000__22a0
FUN_M70_r5_00000__22a0:
  22a0  3476           PSHS  U Y X B A                   
  22a2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "rand swp 2 both  "
  22a6  72616E642073.. char[18] "rand swp 2 both  "      
LAB_M70_r5_00000__22b8:
  22b8  3576           PULS  A B X Y U                   
  22ba  39             RTS                               

; ---- function FUN_M70_r5_00000__22bb
FUN_M70_r5_00000__22bb:
  22bb  3476           PSHS  U Y X B A                   
  22bd  CC0000         LDD #0x0                          
  22c0  200C           BRA 0x22ce                        

; ---- function FUN_M70_r5_00000__22c2
FUN_M70_r5_00000__22c2:
  22c2  3476           PSHS  U Y X B A                   
  22c4  CC0001         LDD #0x1                          
  22c7  2005           BRA 0x22ce                        

; ---- function FUN_M70_r5_00000__22c9
FUN_M70_r5_00000__22c9:
  22c9  3476           PSHS  U Y X B A                   
  22cb  CC0002         LDD #0x2                          
LAB_M70_r5_00000__22ce:
  22ce  FD7138         STD 0x7138                        
  22d1  CC1DAA         LDD #0x1daa                       
  22d4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  22d8  6095           addr 6095                         
LAB_M70_r5_00000__22da:
  22da  1701C1         LBSR 0x249e                       
  22dd  3576           PULS  A B X Y U                   
  22df  39             RTS                               

; ---- function FUN_M70_r5_00000__22e0
FUN_M70_r5_00000__22e0:
  22e0  3476           PSHS  U Y X B A                   
  22e2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep l up-r down"
  22e6  737765657020.. char[18] "sweep l up-r down"      
LAB_M70_r5_00000__22f8:
  22f8  3576           PULS  A B X Y U                   
  22fa  39             RTS                               

; ---- function FUN_M70_r5_00000__22fb
FUN_M70_r5_00000__22fb:
  22fb  3476           PSHS  U Y X B A                   
  22fd  CC0000         LDD #0x0                          
  2300  FD712A         STD 0x712a                        
  2303  CC0001         LDD #0x1                          
  2306  FD7130         STD 0x7130                        
  2309  CC2378         LDD #0x2378                       
  230c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  2310  6097           addr 6097                         
LAB_M70_r5_00000__2312:
  2312  CC2431         LDD #0x2431                       
  2315  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  2319  6095           addr 6095                         
LAB_M70_r5_00000__231b:
  231b  CC0001         LDD #0x1                          
  231e  AD9FFCC4       JSR [0xfcc4]                      
  2322  CC0001         LDD #0x1                          
  2325  AD9FFCC2       JSR [0xfcc2]                      
  2329  3576           PULS  A B X Y U                   
  232b  39             RTS                               

; ---- function FUN_M70_r5_00000__232c
FUN_M70_r5_00000__232c:
  232c  3476           PSHS  U Y X B A                   
  232e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "sweep r up-l down"
  2332  737765657020.. char[18] "sweep r up-l down"      
LAB_M70_r5_00000__2344:
  2344  3576           PULS  A B X Y U                   
  2346  39             RTS                               

; ---- function FUN_M70_r5_00000__2347
FUN_M70_r5_00000__2347:
  2347  3476           PSHS  U Y X B A                   
  2349  CC0000         LDD #0x0                          
  234c  FD712C         STD 0x712c                        
  234f  CC0001         LDD #0x1                          
  2352  FD712E         STD 0x712e                        
  2355  CC23B0         LDD #0x23b0                       
  2358  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  235c  6097           addr 6097                         
LAB_M70_r5_00000__235e:
  235e  CC23F9         LDD #0x23f9                       
  2361  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  2365  6095           addr 6095                         
LAB_M70_r5_00000__2367:
  2367  CC0001         LDD #0x1                          
  236a  AD9FFCC4       JSR [0xfcc4]                      
  236e  CC0001         LDD #0x1                          
  2371  AD9FFCC2       JSR [0xfcc2]                      
  2375  3576           PULS  A B X Y U                   
  2377  39             RTS                               

; ---- function FUN_M70_r5_00000__2378
FUN_M70_r5_00000__2378:
  2378  3476           PSHS  U Y X B A                   
  237a  FC70B0         LDD 0x70b0                        
  237d  F37140         ADDD 0x7140                       
  2380  291F           BVS 0x23a1                        
  2382  FD70B0         STD 0x70b0                        
  2385  3606           PSHU  B A                         
  2387  FC7142         LDD 0x7142                        
  238a  3606           PSHU  B A                         
  238c  AD9FFCF2       JSR [0xfcf2]                      
  2390  3710           PULU  X                           
  2392  FC712A         LDD 0x712a                        
  2395  17012A         LBSR 0x24c2                       
  2398  CC0001         LDD #0x1                          
  239b  AD9FFCC4       JSR [0xfcc4]                      
  239f  200C           BRA 0x23ad                        
LAB_M70_r5_00000__23a1:
  23a1  8E0000         LDX #0x0                          
  23a4  BF70B0         STX 0x70b0                        
  23a7  FC712A         LDD 0x712a                        
  23aa  170115         LBSR 0x24c2                       
LAB_M70_r5_00000__23ad:
  23ad  3576           PULS  A B X Y U                   
  23af  39             RTS                               

; ---- function FUN_M70_r5_00000__23b0
FUN_M70_r5_00000__23b0:
  23b0  3476           PSHS  U Y X B A                   
  23b2  FC70B0         LDD 0x70b0                        
  23b5  B37144         SUBD 0x7144                       
  23b8  291F           BVS 0x23d9                        
  23ba  FD70B0         STD 0x70b0                        
  23bd  3606           PSHU  B A                         
  23bf  FC7146         LDD 0x7146                        
  23c2  3606           PSHU  B A                         
  23c4  AD9FFCF2       JSR [0xfcf2]                      
  23c8  3710           PULU  X                           
  23ca  FC712C         LDD 0x712c                        
  23cd  1700F2         LBSR 0x24c2                       
  23d0  CC0001         LDD #0x1                          
  23d3  AD9FFCC4       JSR [0xfcc4]                      
  23d7  200C           BRA 0x23e5                        
LAB_M70_r5_00000__23d9:
  23d9  8E0000         LDX #0x0                          
  23dc  BF70B0         STX 0x70b0                        
  23df  FC712C         LDD 0x712c                        
  23e2  1700DD         LBSR 0x24c2                       
LAB_M70_r5_00000__23e5:
  23e5  3576           PULS  A B X Y U                   
  23e7  39             RTS                               

; ---- function FUN_M70_r5_00000__23e8
FUN_M70_r5_00000__23e8:
  23e8  3476           PSHS  U Y X B A                   
  23ea  8E0000         LDX #0x0                          
  23ed  BF70B0         STX 0x70b0                        
  23f0  FC7132         LDD 0x7132                        
  23f3  1700CC         LBSR 0x24c2                       
  23f6  3576           PULS  A B X Y U                   
  23f8  39             RTS                               

; ---- function FUN_M70_r5_00000__23f9
FUN_M70_r5_00000__23f9:
  23f9  3476           PSHS  U Y X B A                   
  23fb  FC70BA         LDD 0x70ba                        
  23fe  F37148         ADDD 0x7148                       
  2401  291F           BVS 0x2422                        
  2403  FD70BA         STD 0x70ba                        
  2406  3606           PSHU  B A                         
  2408  FC714A         LDD 0x714a                        
  240b  3606           PSHU  B A                         
  240d  AD9FFCF2       JSR [0xfcf2]                      
  2411  3710           PULU  X                           
  2413  FC712E         LDD 0x712e                        
  2416  1700A9         LBSR 0x24c2                       
  2419  CC0001         LDD #0x1                          
  241c  AD9FFCC2       JSR [0xfcc2]                      
  2420  200C           BRA 0x242e                        
LAB_M70_r5_00000__2422:
  2422  8E0000         LDX #0x0                          
  2425  BF70BA         STX 0x70ba                        
  2428  FC712E         LDD 0x712e                        
  242b  170094         LBSR 0x24c2                       
LAB_M70_r5_00000__242e:
  242e  3576           PULS  A B X Y U                   
  2430  39             RTS                               

; ---- function FUN_M70_r5_00000__2431
FUN_M70_r5_00000__2431:
  2431  3476           PSHS  U Y X B A                   
  2433  FC70BA         LDD 0x70ba                        
  2436  B3714C         SUBD 0x714c                       
  2439  291F           BVS 0x245a                        
  243b  FD70BA         STD 0x70ba                        
  243e  3606           PSHU  B A                         
  2440  FC714E         LDD 0x714e                        
  2443  3606           PSHU  B A                         
  2445  AD9FFCF2       JSR [0xfcf2]                      
  2449  3710           PULU  X                           
  244b  FC7130         LDD 0x7130                        
  244e  170071         LBSR 0x24c2                       
  2451  CC0001         LDD #0x1                          
  2454  AD9FFCC2       JSR [0xfcc2]                      
  2458  200C           BRA 0x2466                        
LAB_M70_r5_00000__245a:
  245a  8E0000         LDX #0x0                          
  245d  BF70BA         STX 0x70ba                        
  2460  FC7130         LDD 0x7130                        
  2463  17005C         LBSR 0x24c2                       
LAB_M70_r5_00000__2466:
  2466  3576           PULS  A B X Y U                   
  2468  39             RTS                               

; ---- function FUN_M70_r5_00000__2469
FUN_M70_r5_00000__2469:
  2469  3476           PSHS  U Y X B A                   
  246b  8E0000         LDX #0x0                          
  246e  BF70BA         STX 0x70ba                        
  2471  FC7134         LDD 0x7134                        
  2474  17004B         LBSR 0x24c2                       
  2477  3576           PULS  A B X Y U                   
  2479  39             RTS                               

; ---- function FUN_M70_r5_00000__247a
FUN_M70_r5_00000__247a:
  247a  3476           PSHS  U Y X B A                   
  247c  FC7150         LDD 0x7150                        
  247f  3606           PSHU  B A                         
  2481  AD9FFCF8       JSR [0xfcf8]                      
  2485  3706           PULU  A B                         
  2487  FD7160         STD 0x7160                        
  248a  F37160         ADDD 0x7160                       
  248d  B37150         SUBD 0x7150                       
  2490  FD70B0         STD 0x70b0                        
  2493  1F01           TFR D,X                           
  2495  FC7136         LDD 0x7136                        
  2498  170027         LBSR 0x24c2                       
  249b  3576           PULS  A B X Y U                   
  249d  39             RTS                               

; ---- function FUN_M70_r5_00000__249e
FUN_M70_r5_00000__249e:
  249e  3476           PSHS  U Y X B A                   
  24a0  FC7152         LDD 0x7152                        
  24a3  3606           PSHU  B A                         
  24a5  AD9FFCF8       JSR [0xfcf8]                      
  24a9  3706           PULU  A B                         
  24ab  FD7160         STD 0x7160                        
  24ae  F37160         ADDD 0x7160                       
  24b1  B37152         SUBD 0x7152                       
  24b4  FD70BA         STD 0x70ba                        
  24b7  1F01           TFR D,X                           
  24b9  FC7138         LDD 0x7138                        
  24bc  170003         LBSR 0x24c2                       
  24bf  3576           PULS  A B X Y U                   
  24c1  39             RTS                               

; ---- function FUN_M70_r5_00000__24c2
FUN_M70_r5_00000__24c2:
  24c2  3476           PSHS  U Y X B A                   
  24c4  10830000       CMPD #0x0                         
  24c8  270B           BEQ 0x24d5                        
  24ca  3610           PSHU  X                           
  24cc  170028         LBSR 0x24f7                       
  24cf  10830001       CMPD #0x1                         
  24d3  2705           BEQ 0x24da                        
LAB_M70_r5_00000__24d5:
  24d5  3610           PSHU  X                           
  24d7  170003         LBSR 0x24dd                       
LAB_M70_r5_00000__24da:
  24da  3576           PULS  A B X Y U                   
  24dc  39             RTS                               

; ---- function FUN_M70_r5_00000__24dd
FUN_M70_r5_00000__24dd:
  24dd  3476           PSHS  U Y X B A                   
  24df  3706           PULU  A B                         
  24e1  BE7028         LDX 0x7028                        
  24e4  3610           PSHU  X                           
  24e6  F37028         ADDD 0x7028                       
  24e9  FD7028         STD 0x7028                        
  24ec  17E7E0         LBSR 0x0ccf                       
  24ef  3710           PULU  X                           
  24f1  BF7028         STX 0x7028                        
  24f4  3576           PULS  A B X Y U                   
  24f6  39             RTS                               

; ---- function FUN_M70_r5_00000__24f7
FUN_M70_r5_00000__24f7:
  24f7  3476           PSHS  U Y X B A                   
  24f9  3706           PULU  A B                         
  24fb  BE7038         LDX 0x7038                        
  24fe  3610           PSHU  X                           
  2500  F37038         ADDD 0x7038                       
  2503  FD7038         STD 0x7038                        
  2506  17E95A         LBSR 0x0e63                       
  2509  3710           PULU  X                           
  250b  BF7038         STX 0x7038                        
  250e  3576           PULS  A B X Y U                   
  2510  39             RTS                               

; ---- function FUN_M70_r5_00000__2511
FUN_M70_r5_00000__2511:
  2511  3476           PSHS  U Y X B A                   
  2513  FC7156         LDD 0x7156                        
  2516  3606           PSHU  B A                         
  2518  AD9FFCF8       JSR [0xfcf8]                      
  251c  3706           PULU  A B                         
  251e  FD7162         STD 0x7162                        
  2521  CCEA60         LDD #0xea60                       
  2524  3606           PSHU  B A                         
  2526  FC7162         LDD 0x7162                        
  2529  3606           PSHU  B A                         
  252b  AD9FFCEA       JSR [0xfcea]                      
  252f  AD9FFCF8       JSR [0xfcf8]                      
  2533  3706           PULU  A B                         
  2535  C303E8         ADDD #0x3e8                       
  2538  FD7160         STD 0x7160                        
  253b  FC713E         LDD 0x713e                        
  253e  2750           BEQ 0x2590                        
  2540  CC000A         LDD #0xa                          
  2543  AD9FFD20       JSR [0xfd20]                      
  2547  108E0148       LDY #0x148                        
  254b  FC7160         LDD 0x7160                        
  254e  AD9FFD2E       JSR [0xfd2e]                      
  2552  CC000A         LDD #0xa                          
  2555  AD9FFD20       JSR [0xfd20]                      
  2559  108E0000       LDY #0x0                          
  255d  FC7160         LDD 0x7160                        
  2560  AD9FFD2E       JSR [0xfd2e]                      
  2564  CC000A         LDD #0xa                          
  2567  AD9FFD20       JSR [0xfd20]                      
  256b  108E0149       LDY #0x149                        
  256f  FC7162         LDD 0x7162                        
  2572  AD9FFD2E       JSR [0xfd2e]                      
  2576  CC000A         LDD #0xa                          
  2579  AD9FFD20       JSR [0xfd20]                      
  257d  108E0000       LDY #0x0                          
  2581  FC7162         LDD 0x7162                        
  2584  AD9FFD2E       JSR [0xfd2e]                      
  2588  FC713E         LDD 0x713e                        
  258b  830001         SUBD #0x1                         
  258e  2748           BEQ 0x25d8                        
LAB_M70_r5_00000__2590:
  2590  CC000A         LDD #0xa                          
  2593  AD9FFD20       JSR [0xfd20]                      
  2597  108E0248       LDY #0x248                        
  259b  FC7160         LDD 0x7160                        
  259e  AD9FFD2E       JSR [0xfd2e]                      
  25a2  CC000A         LDD #0xa                          
  25a5  AD9FFD20       JSR [0xfd20]                      
  25a9  108E0000       LDY #0x0                          
  25ad  FC7160         LDD 0x7160                        
  25b0  AD9FFD2E       JSR [0xfd2e]                      
  25b4  CC000A         LDD #0xa                          
  25b7  AD9FFD20       JSR [0xfd20]                      
  25bb  108E0249       LDY #0x249                        
  25bf  FC7162         LDD 0x7162                        
  25c2  AD9FFD2E       JSR [0xfd2e]                      
  25c6  CC000A         LDD #0xa                          
  25c9  AD9FFD20       JSR [0xfd20]                      
  25cd  108E0000       LDY #0x0                          
  25d1  FC7162         LDD 0x7162                        
  25d4  AD9FFD2E       JSR [0xfd2e]                      
LAB_M70_r5_00000__25d8:
  25d8  3576           PULS  A B X Y U                   
  25da  39             RTS                               

; ---- function FUN_M70_r5_00000__25db
FUN_M70_r5_00000__25db:
  25db  3476           PSHS  U Y X B A                   
  25dd  FC713A         LDD 0x713a                        
  25e0  2750           BEQ 0x2632                        
  25e2  CC000A         LDD #0xa                          
  25e5  AD9FFD20       JSR [0xfd20]                      
  25e9  108E0148       LDY #0x148                        
  25ed  FC715C         LDD 0x715c                        
  25f0  AD9FFD2E       JSR [0xfd2e]                      
  25f4  CC000A         LDD #0xa                          
  25f7  AD9FFD20       JSR [0xfd20]                      
  25fb  108E0000       LDY #0x0                          
  25ff  FC715C         LDD 0x715c                        
  2602  AD9FFD2E       JSR [0xfd2e]                      
  2606  CC000A         LDD #0xa                          
  2609  AD9FFD20       JSR [0xfd20]                      
  260d  108E0149       LDY #0x149                        
  2611  FC700C         LDD 0x700c                        
  2614  AD9FFD2E       JSR [0xfd2e]                      
  2618  CC000A         LDD #0xa                          
  261b  AD9FFD20       JSR [0xfd20]                      
  261f  108E0000       LDY #0x0                          
  2623  FC700C         LDD 0x700c                        
  2626  AD9FFD2E       JSR [0xfd2e]                      
  262a  FC713A         LDD 0x713a                        
  262d  830001         SUBD #0x1                         
  2630  2748           BEQ 0x267a                        
LAB_M70_r5_00000__2632:
  2632  CC000A         LDD #0xa                          
  2635  AD9FFD20       JSR [0xfd20]                      
  2639  108E0248       LDY #0x248                        
  263d  FC715C         LDD 0x715c                        
  2640  AD9FFD2E       JSR [0xfd2e]                      
  2644  CC000A         LDD #0xa                          
  2647  AD9FFD20       JSR [0xfd20]                      
  264b  108E0000       LDY #0x0                          
  264f  FC715C         LDD 0x715c                        
  2652  AD9FFD2E       JSR [0xfd2e]                      
  2656  CC000A         LDD #0xa                          
  2659  AD9FFD20       JSR [0xfd20]                      
  265d  108E0249       LDY #0x249                        
  2661  FC700C         LDD 0x700c                        
  2664  AD9FFD2E       JSR [0xfd2e]                      
  2668  CC000A         LDD #0xa                          
  266b  AD9FFD20       JSR [0xfd20]                      
  266f  108E0000       LDY #0x0                          
  2673  FC700C         LDD 0x700c                        
  2676  AD9FFD2E       JSR [0xfd2e]                      
LAB_M70_r5_00000__267a:
  267a  3576           PULS  A B X Y U                   
  267c  39             RTS                               

; ---- function FUN_M70_r5_00000__267d
FUN_M70_r5_00000__267d:
  267d  3476           PSHS  U Y X B A                   
  267f  FC713C         LDD 0x713c                        
  2682  2750           BEQ 0x26d4                        
  2684  CC000A         LDD #0xa                          
  2687  AD9FFD20       JSR [0xfd20]                      
  268b  108E0148       LDY #0x148                        
  268f  FC715E         LDD 0x715e                        
  2692  AD9FFD2E       JSR [0xfd2e]                      
  2696  CC000A         LDD #0xa                          
  2699  AD9FFD20       JSR [0xfd20]                      
  269d  108E0000       LDY #0x0                          
  26a1  FC715E         LDD 0x715e                        
  26a4  AD9FFD2E       JSR [0xfd2e]                      
  26a8  CC000A         LDD #0xa                          
  26ab  AD9FFD20       JSR [0xfd20]                      
  26af  108E0149       LDY #0x149                        
  26b3  FC701C         LDD 0x701c                        
  26b6  AD9FFD2E       JSR [0xfd2e]                      
  26ba  CC000A         LDD #0xa                          
  26bd  AD9FFD20       JSR [0xfd20]                      
  26c1  108E0000       LDY #0x0                          
  26c5  FC701C         LDD 0x701c                        
  26c8  AD9FFD2E       JSR [0xfd2e]                      
  26cc  FC713C         LDD 0x713c                        
  26cf  830001         SUBD #0x1                         
  26d2  2748           BEQ 0x271c                        
LAB_M70_r5_00000__26d4:
  26d4  CC000A         LDD #0xa                          
  26d7  AD9FFD20       JSR [0xfd20]                      
  26db  108E0248       LDY #0x248                        
  26df  FC715E         LDD 0x715e                        
  26e2  AD9FFD2E       JSR [0xfd2e]                      
  26e6  CC000A         LDD #0xa                          
  26e9  AD9FFD20       JSR [0xfd20]                      
  26ed  108E0000       LDY #0x0                          
  26f1  FC715E         LDD 0x715e                        
  26f4  AD9FFD2E       JSR [0xfd2e]                      
  26f8  CC000A         LDD #0xa                          
  26fb  AD9FFD20       JSR [0xfd20]                      
  26ff  108E0249       LDY #0x249                        
  2703  FC701C         LDD 0x701c                        
  2706  AD9FFD2E       JSR [0xfd2e]                      
  270a  CC000A         LDD #0xa                          
  270d  AD9FFD20       JSR [0xfd20]                      
  2711  108E0000       LDY #0x0                          
  2715  FC701C         LDD 0x701c                        
  2718  AD9FFD2E       JSR [0xfd2e]                      
LAB_M70_r5_00000__271c:
  271c  3576           PULS  A B X Y U                   
  271e  39             RTS                               
  271f  278A2769275D   addr[3]                           
  2725  .db 70 98 70 D0 00 00 70 FC 00 08 00 A7 11 00 00 00  ; p.p...p.........
  2735  .db 22 00 01 00 09 1F 27 75 00 00 2B 77 00 00 00 00  ; ".....'u..+w....

; ---- function FUN_M70_r5_00000__2745
FUN_M70_r5_00000__2745:
  2745  3410           PSHS  X                           
  2747  8E271F         LDX #0x271f                       
  274a  AD9FFC4E       JSR [0xfc4e]                      
  274e  3510           PULS  X                           
  2750  39             RTS                               

; ---- function FUN_M70_r5_00000__2751
FUN_M70_r5_00000__2751:
  2751  3410           PSHS  X                           
  2753  8E271F         LDX #0x271f                       
  2756  AD9FFC4C       JSR [0xfc4c]                      
  275a  3510           PULS  X                           
  275c  39             RTS                               

; ---- function FUN_M70_r5_00000__275d
FUN_M70_r5_00000__275d:
  275d  3410           PSHS  X                           
  275f  8E271F         LDX #0x271f                       
  2762  AD9FFC50       JSR [0xfc50]                      
  2766  3510           PULS  X                           
  2768  39             RTS                               

; ---- function FUN_M70_r5_00000__2769
FUN_M70_r5_00000__2769:
  2769  3410           PSHS  X                           
  276b  8E271F         LDX #0x271f                       
  276e  AD9FFC52       JSR [0xfc52]                      
  2772  3510           PULS  X                           
  2774  39             RTS                               
  2775  .db 14 74 72 69 67 67 65 72 31 61 3A 20 20 20 20 20  ; .trigger1a:     
  2785  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__278a
FUN_M70_r5_00000__278a:
  278a  3476           PSHS  U Y X B A                   
  278c  CC0000         LDD #0x0                          
  278f  3606           PSHU  B A                         
  2791  CC0022         LDD #0x22                         
  2794  3606           PSHU  B A                         
  2796  FC7098         LDD 0x7098                        
  2799  F370D0         ADDD 0x70d0                       
  279c  3606           PSHU  B A                         
  279e  AD9FFCD8       JSR [0xfcd8]                      
  27a2  3706           PULU  A B                         
  27a4  FD70FC         STD 0x70fc                        
  27a7  3576           PULS  A B X Y U                   
  27a9  39             RTS                               
  27aa  281527F427E8   addr[3]                           
  27b0  .db 70 9A 70 D2 00 00 70 FE 00 08 00 A8 12 00 00 00  ; p.p...p.........
  27c0  .db 22 00 01 00 09 1F 28 00 00 00 2B 77 00 00 00 00  ; ".....(...+w....

; ---- function FUN_M70_r5_00000__27d0
FUN_M70_r5_00000__27d0:
  27d0  3410           PSHS  X                           
  27d2  8E27AA         LDX #0x27aa                       
  27d5  AD9FFC4E       JSR [0xfc4e]                      
  27d9  3510           PULS  X                           
  27db  39             RTS                               

; ---- function FUN_M70_r5_00000__27dc
FUN_M70_r5_00000__27dc:
  27dc  3410           PSHS  X                           
  27de  8E27AA         LDX #0x27aa                       
  27e1  AD9FFC4C       JSR [0xfc4c]                      
  27e5  3510           PULS  X                           
  27e7  39             RTS                               

; ---- function FUN_M70_r5_00000__27e8
FUN_M70_r5_00000__27e8:
  27e8  3410           PSHS  X                           
  27ea  8E27AA         LDX #0x27aa                       
  27ed  AD9FFC50       JSR [0xfc50]                      
  27f1  3510           PULS  X                           
  27f3  39             RTS                               

; ---- function FUN_M70_r5_00000__27f4
FUN_M70_r5_00000__27f4:
  27f4  3410           PSHS  X                           
  27f6  8E27AA         LDX #0x27aa                       
  27f9  AD9FFC52       JSR [0xfc52]                      
  27fd  3510           PULS  X                           
  27ff  39             RTS                               
  2800  .db 14 74 72 69 67 67 65 72 31 62 3A 20 20 20 20 20  ; .trigger1b:     
  2810  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__2815
FUN_M70_r5_00000__2815:
  2815  3476           PSHS  U Y X B A                   
  2817  CC0000         LDD #0x0                          
  281a  3606           PSHU  B A                         
  281c  CC0022         LDD #0x22                         
  281f  3606           PSHU  B A                         
  2821  FC709A         LDD 0x709a                        
  2824  F370D2         ADDD 0x70d2                       
  2827  3606           PSHU  B A                         
  2829  AD9FFCD8       JSR [0xfcd8]                      
  282d  3706           PULU  A B                         
  282f  FD70FE         STD 0x70fe                        
  2832  3576           PULS  A B X Y U                   
  2834  39             RTS                               
  2835  28A0287F2873   addr[3]                           
  283b  .db 70 9C 70 D4 00 00 71 00 00 08 00 A9 13 00 00 00  ; p.p...q.........
  284b  .db 22 00 01 00 09 1F 28 8B 00 00 2B 77 00 00 00 00  ; ".....(...+w....

; ---- function FUN_M70_r5_00000__285b
FUN_M70_r5_00000__285b:
  285b  3410           PSHS  X                           
  285d  8E2835         LDX #0x2835                       
  2860  AD9FFC4E       JSR [0xfc4e]                      
  2864  3510           PULS  X                           
  2866  39             RTS                               

; ---- function FUN_M70_r5_00000__2867
FUN_M70_r5_00000__2867:
  2867  3410           PSHS  X                           
  2869  8E2835         LDX #0x2835                       
  286c  AD9FFC4C       JSR [0xfc4c]                      
  2870  3510           PULS  X                           
  2872  39             RTS                               

; ---- function FUN_M70_r5_00000__2873
FUN_M70_r5_00000__2873:
  2873  3410           PSHS  X                           
  2875  8E2835         LDX #0x2835                       
  2878  AD9FFC50       JSR [0xfc50]                      
  287c  3510           PULS  X                           
  287e  39             RTS                               

; ---- function FUN_M70_r5_00000__287f
FUN_M70_r5_00000__287f:
  287f  3410           PSHS  X                           
  2881  8E2835         LDX #0x2835                       
  2884  AD9FFC52       JSR [0xfc52]                      
  2888  3510           PULS  X                           
  288a  39             RTS                               
  288b  .db 14 74 72 69 67 67 65 72 32 61 3A 20 20 20 20 20  ; .trigger2a:     
  289b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__28a0
FUN_M70_r5_00000__28a0:
  28a0  3476           PSHS  U Y X B A                   
  28a2  CC0000         LDD #0x0                          
  28a5  3606           PSHU  B A                         
  28a7  CC0022         LDD #0x22                         
  28aa  3606           PSHU  B A                         
  28ac  FC709C         LDD 0x709c                        
  28af  F370D4         ADDD 0x70d4                       
  28b2  3606           PSHU  B A                         
  28b4  AD9FFCD8       JSR [0xfcd8]                      
  28b8  3706           PULU  A B                         
  28ba  FD7100         STD 0x7100                        
  28bd  3576           PULS  A B X Y U                   
  28bf  39             RTS                               
  28c0  292B290A28FE   addr[3]                           
  28c6  .db 70 9E 70 D6 00 00 71 02 00 08 00 AA 14 00 00 00  ; p.p...q.........
  28d6  .db 22 00 01 00 09 1F 29 16 00 00 2B 77 00 00 00 00  ; ".....)...+w....

; ---- function FUN_M70_r5_00000__28e6
FUN_M70_r5_00000__28e6:
  28e6  3410           PSHS  X                           
  28e8  8E28C0         LDX #0x28c0                       
  28eb  AD9FFC4E       JSR [0xfc4e]                      
  28ef  3510           PULS  X                           
  28f1  39             RTS                               

; ---- function FUN_M70_r5_00000__28f2
FUN_M70_r5_00000__28f2:
  28f2  3410           PSHS  X                           
  28f4  8E28C0         LDX #0x28c0                       
  28f7  AD9FFC4C       JSR [0xfc4c]                      
  28fb  3510           PULS  X                           
  28fd  39             RTS                               

; ---- function FUN_M70_r5_00000__28fe
FUN_M70_r5_00000__28fe:
  28fe  3410           PSHS  X                           
  2900  8E28C0         LDX #0x28c0                       
  2903  AD9FFC50       JSR [0xfc50]                      
  2907  3510           PULS  X                           
  2909  39             RTS                               

; ---- function FUN_M70_r5_00000__290a
FUN_M70_r5_00000__290a:
  290a  3410           PSHS  X                           
  290c  8E28C0         LDX #0x28c0                       
  290f  AD9FFC52       JSR [0xfc52]                      
  2913  3510           PULS  X                           
  2915  39             RTS                               
  2916  .db 14 74 72 69 67 67 65 72 32 62 3A 20 20 20 20 20  ; .trigger2b:     
  2926  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__292b
FUN_M70_r5_00000__292b:
  292b  3476           PSHS  U Y X B A                   
  292d  CC0000         LDD #0x0                          
  2930  3606           PSHU  B A                         
  2932  CC0022         LDD #0x22                         
  2935  3606           PSHU  B A                         
  2937  FC709E         LDD 0x709e                        
  293a  F370D6         ADDD 0x70d6                       
  293d  3606           PSHU  B A                         
  293f  AD9FFCD8       JSR [0xfcd8]                      
  2943  3706           PULU  A B                         
  2945  FD7102         STD 0x7102                        
  2948  3576           PULS  A B X Y U                   
  294a  39             RTS                               
  294b  29B629952989   addr[3]                           
  2951  .db 70 A0 70 D8 00 00 71 04 00 08 00 AB 15 00 00 00  ; p.p...q.........
  2961  .db 22 00 01 00 09 1F 29 A1 00 00 2B 77 00 00 00 00  ; ".....)...+w....

; ---- function FUN_M70_r5_00000__2971
FUN_M70_r5_00000__2971:
  2971  3410           PSHS  X                           
  2973  8E294B         LDX #0x294b                       
  2976  AD9FFC4E       JSR [0xfc4e]                      
  297a  3510           PULS  X                           
  297c  39             RTS                               

; ---- function FUN_M70_r5_00000__297d
FUN_M70_r5_00000__297d:
  297d  3410           PSHS  X                           
  297f  8E294B         LDX #0x294b                       
  2982  AD9FFC4C       JSR [0xfc4c]                      
  2986  3510           PULS  X                           
  2988  39             RTS                               

; ---- function FUN_M70_r5_00000__2989
FUN_M70_r5_00000__2989:
  2989  3410           PSHS  X                           
  298b  8E294B         LDX #0x294b                       
  298e  AD9FFC50       JSR [0xfc50]                      
  2992  3510           PULS  X                           
  2994  39             RTS                               

; ---- function FUN_M70_r5_00000__2995
FUN_M70_r5_00000__2995:
  2995  3410           PSHS  X                           
  2997  8E294B         LDX #0x294b                       
  299a  AD9FFC52       JSR [0xfc52]                      
  299e  3510           PULS  X                           
  29a0  39             RTS                               
  29a1  .db 14 74 72 69 67 67 65 72 33 61 3A 20 20 20 20 20  ; .trigger3a:     
  29b1  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__29b6
FUN_M70_r5_00000__29b6:
  29b6  3476           PSHS  U Y X B A                   
  29b8  CC0000         LDD #0x0                          
  29bb  3606           PSHU  B A                         
  29bd  CC0022         LDD #0x22                         
  29c0  3606           PSHU  B A                         
  29c2  FC70A0         LDD 0x70a0                        
  29c5  F370D8         ADDD 0x70d8                       
  29c8  3606           PSHU  B A                         
  29ca  AD9FFCD8       JSR [0xfcd8]                      
  29ce  3706           PULU  A B                         
  29d0  FD7104         STD 0x7104                        
  29d3  3576           PULS  A B X Y U                   
  29d5  39             RTS                               
  29d6  2A412A202A14   addr[3]                           
  29dc  .db 70 A2 70 DA 00 00 71 06 00 08 00 AC 16 00 00 00  ; p.p...q.........
  29ec  .db 22 00 01 00 09 1F 2A 2C 00 00 2B 77 00 00 00 00  ; ".....*,..+w....

; ---- function FUN_M70_r5_00000__29fc
FUN_M70_r5_00000__29fc:
  29fc  3410           PSHS  X                           
  29fe  8E29D6         LDX #0x29d6                       
  2a01  AD9FFC4E       JSR [0xfc4e]                      
  2a05  3510           PULS  X                           
  2a07  39             RTS                               

; ---- function FUN_M70_r5_00000__2a08
FUN_M70_r5_00000__2a08:
  2a08  3410           PSHS  X                           
  2a0a  8E29D6         LDX #0x29d6                       
  2a0d  AD9FFC4C       JSR [0xfc4c]                      
  2a11  3510           PULS  X                           
  2a13  39             RTS                               

; ---- function FUN_M70_r5_00000__2a14
FUN_M70_r5_00000__2a14:
  2a14  3410           PSHS  X                           
  2a16  8E29D6         LDX #0x29d6                       
  2a19  AD9FFC50       JSR [0xfc50]                      
  2a1d  3510           PULS  X                           
  2a1f  39             RTS                               

; ---- function FUN_M70_r5_00000__2a20
FUN_M70_r5_00000__2a20:
  2a20  3410           PSHS  X                           
  2a22  8E29D6         LDX #0x29d6                       
  2a25  AD9FFC52       JSR [0xfc52]                      
  2a29  3510           PULS  X                           
  2a2b  39             RTS                               
  2a2c  .db 14 74 72 69 67 67 65 72 33 62 3A 20 20 20 20 20  ; .trigger3b:     
  2a3c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__2a41
FUN_M70_r5_00000__2a41:
  2a41  3476           PSHS  U Y X B A                   
  2a43  CC0000         LDD #0x0                          
  2a46  3606           PSHU  B A                         
  2a48  CC0022         LDD #0x22                         
  2a4b  3606           PSHU  B A                         
  2a4d  FC70A2         LDD 0x70a2                        
  2a50  F370DA         ADDD 0x70da                       
  2a53  3606           PSHU  B A                         
  2a55  AD9FFCD8       JSR [0xfcd8]                      
  2a59  3706           PULU  A B                         
  2a5b  FD7106         STD 0x7106                        
  2a5e  3576           PULS  A B X Y U                   
  2a60  39             RTS                               
  2a61  2ACC2AAB2A9F   addr[3]                           
  2a67  .db 70 A4 70 DC 00 00 71 08 00 08 00 AD 17 00 00 00  ; p.p...q.........
  2a77  .db 22 00 01 00 09 1F 2A B7 00 00 2B 77 00 00 00 00  ; ".....*...+w....

; ---- function FUN_M70_r5_00000__2a87
FUN_M70_r5_00000__2a87:
  2a87  3410           PSHS  X                           
  2a89  8E2A61         LDX #0x2a61                       
  2a8c  AD9FFC4E       JSR [0xfc4e]                      
  2a90  3510           PULS  X                           
  2a92  39             RTS                               

; ---- function FUN_M70_r5_00000__2a93
FUN_M70_r5_00000__2a93:
  2a93  3410           PSHS  X                           
  2a95  8E2A61         LDX #0x2a61                       
  2a98  AD9FFC4C       JSR [0xfc4c]                      
  2a9c  3510           PULS  X                           
  2a9e  39             RTS                               

; ---- function FUN_M70_r5_00000__2a9f
FUN_M70_r5_00000__2a9f:
  2a9f  3410           PSHS  X                           
  2aa1  8E2A61         LDX #0x2a61                       
  2aa4  AD9FFC50       JSR [0xfc50]                      
  2aa8  3510           PULS  X                           
  2aaa  39             RTS                               

; ---- function FUN_M70_r5_00000__2aab
FUN_M70_r5_00000__2aab:
  2aab  3410           PSHS  X                           
  2aad  8E2A61         LDX #0x2a61                       
  2ab0  AD9FFC52       JSR [0xfc52]                      
  2ab4  3510           PULS  X                           
  2ab6  39             RTS                               
  2ab7  .db 14 74 72 69 67 67 65 72 34 61 3A 20 20 20 20 20  ; .trigger4a:     
  2ac7  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__2acc
FUN_M70_r5_00000__2acc:
  2acc  3476           PSHS  U Y X B A                   
  2ace  CC0000         LDD #0x0                          
  2ad1  3606           PSHU  B A                         
  2ad3  CC0022         LDD #0x22                         
  2ad6  3606           PSHU  B A                         
  2ad8  FC70A4         LDD 0x70a4                        
  2adb  F370DC         ADDD 0x70dc                       
  2ade  3606           PSHU  B A                         
  2ae0  AD9FFCD8       JSR [0xfcd8]                      
  2ae4  3706           PULU  A B                         
  2ae6  FD7108         STD 0x7108                        
  2ae9  3576           PULS  A B X Y U                   
  2aeb  39             RTS                               
  2aec  2B572B362B2A   addr[3]                           
  2af2  .db 70 A6 70 DE 00 00 71 0A 00 08 00 AE 18 00 00 00  ; p.p...q.........
  2b02  .db 22 00 01 00 09 1F 2B 42 00 00 2B 77 00 00 00 00  ; ".....+B..+w....

; ---- function FUN_M70_r5_00000__2b12
FUN_M70_r5_00000__2b12:
  2b12  3410           PSHS  X                           
  2b14  8E2AEC         LDX #0x2aec                       
  2b17  AD9FFC4E       JSR [0xfc4e]                      
  2b1b  3510           PULS  X                           
  2b1d  39             RTS                               

; ---- function FUN_M70_r5_00000__2b1e
FUN_M70_r5_00000__2b1e:
  2b1e  3410           PSHS  X                           
  2b20  8E2AEC         LDX #0x2aec                       
  2b23  AD9FFC4C       JSR [0xfc4c]                      
  2b27  3510           PULS  X                           
  2b29  39             RTS                               

; ---- function FUN_M70_r5_00000__2b2a
FUN_M70_r5_00000__2b2a:
  2b2a  3410           PSHS  X                           
  2b2c  8E2AEC         LDX #0x2aec                       
  2b2f  AD9FFC50       JSR [0xfc50]                      
  2b33  3510           PULS  X                           
  2b35  39             RTS                               

; ---- function FUN_M70_r5_00000__2b36
FUN_M70_r5_00000__2b36:
  2b36  3410           PSHS  X                           
  2b38  8E2AEC         LDX #0x2aec                       
  2b3b  AD9FFC52       JSR [0xfc52]                      
  2b3f  3510           PULS  X                           
  2b41  39             RTS                               
  2b42  .db 14 74 72 69 67 67 65 72 34 62 3A 20 20 20 20 20  ; .trigger4b:     
  2b52  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M70_r5_00000__2b57
FUN_M70_r5_00000__2b57:
  2b57  3476           PSHS  U Y X B A                   
  2b59  CC0000         LDD #0x0                          
  2b5c  3606           PSHU  B A                         
  2b5e  CC0022         LDD #0x22                         
  2b61  3606           PSHU  B A                         
  2b63  FC70A6         LDD 0x70a6                        
  2b66  F370DE         ADDD 0x70de                       
  2b69  3606           PSHU  B A                         
  2b6b  AD9FFCD8       JSR [0xfcd8]                      
  2b6f  3706           PULU  A B                         
  2b71  FD710A         STD 0x710a                        
  2b74  3576           PULS  A B X Y U                   
  2b76  39             RTS                               
  2b77  .db 6E 6F 20 61 63 74 69 6F 6E 73 74 75 74 31 20 6C  ; no actionstut1 l
  2b87  .db 20 20 73 74 75 74 31 20 72 20 20 73 74 75 74 31  ;   stut1 r  stut1
  2b97  .db 20 6C 26 72 73 74 75 74 32 20 6C 20 20 73 74 75  ;  l&rstut2 l  stu
  2ba7  .db 74 32 20 72 20 20 73 74 75 74 32 20 6C 26 72 72  ; t2 r  stut2 l&rr
  2bb7  .db 61 6E 64 73 20 6C 20 20 72 61 6E 64 73 20 72 20  ; ands l  rands r 
  2bc7  .db 20 72 61 6E 64 73 20 6C 26 72 73 77 70 75 31 20  ;  rands l&rswpu1 
  2bd7  .db 6C 20 20 73 77 70 75 31 20 72 20 20 73 77 70 75  ; l  swpu1 r  swpu
  2be7  .db 31 20 6C 26 72 73 77 70 75 32 20 6C 20 20 73 77  ; 1 l&rswpu2 l  sw
  2bf7  .db 70 75 32 20 72 20 20 73 77 70 75 32 20 6C 26 72  ; pu2 r  swpu2 l&r
  2c07  .db 73 77 70 64 31 20 6C 20 20 73 77 70 64 31 20 72  ; swpd1 l  swpd1 r
  2c17  .db 20 20 73 77 70 64 31 20 6C 26 72 73 77 70 64 32  ;   swpd1 l&rswpd2
  2c27  .db 20 6C 20 20 73 77 70 64 32 20 72 20 20 73 77 70  ;  l  swpd2 r  swp
  2c37  .db 64 32 20 6C 26 72 73 77 20 6C 75 2F 72 64 20 73  ; d2 l&rsw lu/rd s
  2c47  .db 77 20 6C 64 2F 72 75 20 72 70 69 74 31 20 6C 20  ; w ld/ru rpit1 l 
  2c57  .db 20 72 70 69 74 31 20 72 20 20 72 70 69 74 31 20  ;  rpit1 r  rpit1 
  2c67  .db 6C 26 72 72 70 69 74 32 20 6C 20 20 72 70 69 74  ; l&rrpit2 l  rpit
  2c77  .db 32 20 72 20 20 72 70 69 74 32 20 6C 26 72 7A 65  ; 2 r  rpit2 l&rze
  2c87  .db 72 6F 31 20 6C 20 20 7A 65 72 6F 31 20 72 20 20  ; ro1 l  zero1 r  
  2c97  .db 7A 65 72 6F 31 20 6C 26 72 7A 65 72 6F 32 20 6C  ; zero1 l&rzero2 l
  2ca7  .db 20 20 7A 65 72 6F 32 20 72 20 20 7A 65 72 6F 32  ;   zero2 r  zero2
  2cb7  .db 20 6C 26 72 2D 58 2D 31 1D AA 00 00 00 00 00 00  ;  l&r-X-1........
  2cc7  .db 00 00 00 00 00 00 3C 00 00 00 00 00 00 00 00 00  ; ......<.........
  2cd7  .db 00 00 00 00 00 00 1D AA 1D AA 2D 58              ; ..........-X

; ---- function FUN_M70_r5_00000__2ce3
FUN_M70_r5_00000__2ce3:
  2ce3  3410           PSHS  X                           
  2ce5  8E2CBB         LDX #0x2cbb                       
  2ce8  AD9FFEC2       JSR [0xfec2]                      
  2cec  3510           PULS  X                           
  2cee  39             RTS                               

; ---- function FUN_M70_r5_00000__2cef
FUN_M70_r5_00000__2cef:
  2cef  3476           PSHS  U Y X B A                   
  2cf1  CC3B40         LDD #0x3b40                       
  2cf4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2cf8  6072           addr 6072                         
LAB_M70_r5_00000__2cfa:
  2cfa  CC1DAA         LDD #0x1daa                       
  2cfd  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2d01  6070           addr 6070                         
LAB_M70_r5_00000__2d03:
  2d03  170052         LBSR 0x2d58                       
  2d06  170028         LBSR 0x2d31                       
  2d09  3576           PULS  A B X Y U                   
  2d0b  39             RTS                               

; ---- function FUN_M70_r5_00000__2d0c
FUN_M70_r5_00000__2d0c:
  2d0c  3476           PSHS  U Y X B A                   
  2d0e  CC3B40         LDD #0x3b40                       
  2d11  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2d15  6072           addr 6072                         
LAB_M70_r5_00000__2d17:
  2d17  CC1DAA         LDD #0x1daa                       
  2d1a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2d1e  6070           addr 6070                         
LAB_M70_r5_00000__2d20:
  2d20  108E0000       LDY #0x0                          
  2d24  AD9FFE40       JSR [0xfe40]                      
  2d28  17002D         LBSR 0x2d58                       
  2d2b  170003         LBSR 0x2d31                       
  2d2e  3576           PULS  A B X Y U                   
  2d30  39             RTS                               

; ---- function FUN_M70_r5_00000__2d31
FUN_M70_r5_00000__2d31:
  2d31  3476           PSHS  U Y X B A                   
  2d33  C600           LDB #0x0                          
  2d35  AD9FFC36       JSR [0xfc36]                      
  2d39  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "[tr1]"
  2d3d  5B7472315D00   char[6] "[tr1]"                   
LAB_M70_r5_00000__2d43:
  2d43  FC70FC         LDD 0x70fc                        
  2d46  17022A         LBSR 0x2f73                       
  2d49  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "/"
  2d4d  2F00           char[2] "/"                       
LAB_M70_r5_00000__2d4f:
  2d4f  FC70FE         LDD 0x70fe                        
  2d52  17021E         LBSR 0x2f73                       
  2d55  3576           PULS  A B X Y U                   
  2d57  39             RTS                               

; ---- function FUN_M70_r5_00000__2d58
FUN_M70_r5_00000__2d58:
  2d58  3476           PSHS  U Y X B A                   
  2d5a  FC70FC         LDD 0x70fc                        
  2d5d  170224         LBSR 0x2f84                       
  2d60  FC70FE         LDD 0x70fe                        
  2d63  17021E         LBSR 0x2f84                       
  2d66  3576           PULS  A B X Y U                   
  2d68  39             RTS                               
  2d69  2E062DDF1DAA   addr[3]                           
  2d6f  .db 00 00 00 00 00 00 00 00 00 00 00 00 3C 00 00 00  ; ............<...
  2d7f  .db 00 00 00 00 00 00 00 00 00 00 00 00 1D AA 1D AA  ; ................
  2d8f  .db 2E 06                                            ; ..

; ---- function FUN_M70_r5_00000__2d91
FUN_M70_r5_00000__2d91:
  2d91  3410           PSHS  X                           
  2d93  8E2D69         LDX #0x2d69                       
  2d96  AD9FFEC2       JSR [0xfec2]                      
  2d9a  3510           PULS  X                           
  2d9c  39             RTS                               

; ---- function FUN_M70_r5_00000__2d9d
FUN_M70_r5_00000__2d9d:
  2d9d  3476           PSHS  U Y X B A                   
  2d9f  CC3B40         LDD #0x3b40                       
  2da2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2da6  6072           addr 6072                         
LAB_M70_r5_00000__2da8:
  2da8  CC1DAA         LDD #0x1daa                       
  2dab  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2daf  6070           addr 6070                         
LAB_M70_r5_00000__2db1:
  2db1  170052         LBSR 0x2e06                       
  2db4  170028         LBSR 0x2ddf                       
  2db7  3576           PULS  A B X Y U                   
  2db9  39             RTS                               

; ---- function FUN_M70_r5_00000__2dba
FUN_M70_r5_00000__2dba:
  2dba  3476           PSHS  U Y X B A                   
  2dbc  CC3B40         LDD #0x3b40                       
  2dbf  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2dc3  6072           addr 6072                         
LAB_M70_r5_00000__2dc5:
  2dc5  CC1DAA         LDD #0x1daa                       
  2dc8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2dcc  6070           addr 6070                         
LAB_M70_r5_00000__2dce:
  2dce  108E0001       LDY #0x1                          
  2dd2  AD9FFE40       JSR [0xfe40]                      
  2dd6  17002D         LBSR 0x2e06                       
  2dd9  170003         LBSR 0x2ddf                       
  2ddc  3576           PULS  A B X Y U                   
  2dde  39             RTS                               

; ---- function FUN_M70_r5_00000__2ddf
FUN_M70_r5_00000__2ddf:
  2ddf  3476           PSHS  U Y X B A                   
  2de1  C600           LDB #0x0                          
  2de3  AD9FFC36       JSR [0xfc36]                      
  2de7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "[tr2]"
  2deb  5B7472325D00   char[6] "[tr2]"                   
LAB_M70_r5_00000__2df1:
  2df1  FC7100         LDD 0x7100                        
  2df4  17017C         LBSR 0x2f73                       
  2df7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "/"
  2dfb  2F00           char[2] "/"                       
LAB_M70_r5_00000__2dfd:
  2dfd  FC7102         LDD 0x7102                        
  2e00  170170         LBSR 0x2f73                       
  2e03  3576           PULS  A B X Y U                   
  2e05  39             RTS                               

; ---- function FUN_M70_r5_00000__2e06
FUN_M70_r5_00000__2e06:
  2e06  3476           PSHS  U Y X B A                   
  2e08  FC7100         LDD 0x7100                        
  2e0b  170176         LBSR 0x2f84                       
  2e0e  FC7102         LDD 0x7102                        
  2e11  170170         LBSR 0x2f84                       
  2e14  3576           PULS  A B X Y U                   
  2e16  39             RTS                               
  2e17  2EB42E8D1DAA   addr[3]                           
  2e1d  .db 00 00 00 00 00 00 00 00 00 00 00 00 3C 00 00 00  ; ............<...
  2e2d  .db 00 00 00 00 00 00 00 00 00 00 00 00 1D AA 1D AA  ; ................
  2e3d  .db 2E B4                                            ; ..

; ---- function FUN_M70_r5_00000__2e3f
FUN_M70_r5_00000__2e3f:
  2e3f  3410           PSHS  X                           
  2e41  8E2E17         LDX #0x2e17                       
  2e44  AD9FFEC2       JSR [0xfec2]                      
  2e48  3510           PULS  X                           
  2e4a  39             RTS                               

; ---- function FUN_M70_r5_00000__2e4b
FUN_M70_r5_00000__2e4b:
  2e4b  3476           PSHS  U Y X B A                   
  2e4d  CC3B40         LDD #0x3b40                       
  2e50  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2e54  6072           addr 6072                         
LAB_M70_r5_00000__2e56:
  2e56  CC1DAA         LDD #0x1daa                       
  2e59  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2e5d  6070           addr 6070                         
LAB_M70_r5_00000__2e5f:
  2e5f  170052         LBSR 0x2eb4                       
  2e62  170028         LBSR 0x2e8d                       
  2e65  3576           PULS  A B X Y U                   
  2e67  39             RTS                               

; ---- function FUN_M70_r5_00000__2e68
FUN_M70_r5_00000__2e68:
  2e68  3476           PSHS  U Y X B A                   
  2e6a  CC3B40         LDD #0x3b40                       
  2e6d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2e71  6072           addr 6072                         
LAB_M70_r5_00000__2e73:
  2e73  CC1DAA         LDD #0x1daa                       
  2e76  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2e7a  6070           addr 6070                         
LAB_M70_r5_00000__2e7c:
  2e7c  108E0002       LDY #0x2                          
  2e80  AD9FFE40       JSR [0xfe40]                      
  2e84  17002D         LBSR 0x2eb4                       
  2e87  170003         LBSR 0x2e8d                       
  2e8a  3576           PULS  A B X Y U                   
  2e8c  39             RTS                               

; ---- function FUN_M70_r5_00000__2e8d
FUN_M70_r5_00000__2e8d:
  2e8d  3476           PSHS  U Y X B A                   
  2e8f  C600           LDB #0x0                          
  2e91  AD9FFC36       JSR [0xfc36]                      
  2e95  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "[tr3]"
  2e99  5B7472335D00   char[6] "[tr3]"                   
LAB_M70_r5_00000__2e9f:
  2e9f  FC7104         LDD 0x7104                        
  2ea2  1700CE         LBSR 0x2f73                       
  2ea5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "/"
  2ea9  2F00           char[2] "/"                       
LAB_M70_r5_00000__2eab:
  2eab  FC7106         LDD 0x7106                        
  2eae  1700C2         LBSR 0x2f73                       
  2eb1  3576           PULS  A B X Y U                   
  2eb3  39             RTS                               

; ---- function FUN_M70_r5_00000__2eb4
FUN_M70_r5_00000__2eb4:
  2eb4  3476           PSHS  U Y X B A                   
  2eb6  FC7104         LDD 0x7104                        
  2eb9  1700C8         LBSR 0x2f84                       
  2ebc  FC7106         LDD 0x7106                        
  2ebf  1700C2         LBSR 0x2f84                       
  2ec2  3576           PULS  A B X Y U                   
  2ec4  39             RTS                               
  2ec5  2F622F3B1DAA   addr[3]                           
  2ecb  .db 00 00 00 00 00 00 00 00 00 00 00 00 3C 00 00 00  ; ............<...
  2edb  .db 00 00 00 00 00 00 00 00 00 00 00 00 1D AA 1D AA  ; ................
  2eeb  .db 2F 62                                            ; /b

; ---- function FUN_M70_r5_00000__2eed
FUN_M70_r5_00000__2eed:
  2eed  3410           PSHS  X                           
  2eef  8E2EC5         LDX #0x2ec5                       
  2ef2  AD9FFEC2       JSR [0xfec2]                      
  2ef6  3510           PULS  X                           
  2ef8  39             RTS                               

; ---- function FUN_M70_r5_00000__2ef9
FUN_M70_r5_00000__2ef9:
  2ef9  3476           PSHS  U Y X B A                   
  2efb  CC3B40         LDD #0x3b40                       
  2efe  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2f02  6072           addr 6072                         
LAB_M70_r5_00000__2f04:
  2f04  CC1DAA         LDD #0x1daa                       
  2f07  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2f0b  6070           addr 6070                         
LAB_M70_r5_00000__2f0d:
  2f0d  170052         LBSR 0x2f62                       
  2f10  170028         LBSR 0x2f3b                       
  2f13  3576           PULS  A B X Y U                   
  2f15  39             RTS                               

; ---- function FUN_M70_r5_00000__2f16
FUN_M70_r5_00000__2f16:
  2f16  3476           PSHS  U Y X B A                   
  2f18  CC3B40         LDD #0x3b40                       
  2f1b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2f1f  6072           addr 6072                         
LAB_M70_r5_00000__2f21:
  2f21  CC1DAA         LDD #0x1daa                       
  2f24  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2f28  6070           addr 6070                         
LAB_M70_r5_00000__2f2a:
  2f2a  108E0003       LDY #0x3                          
  2f2e  AD9FFE40       JSR [0xfe40]                      
  2f32  17002D         LBSR 0x2f62                       
  2f35  170003         LBSR 0x2f3b                       
  2f38  3576           PULS  A B X Y U                   
  2f3a  39             RTS                               

; ---- function FUN_M70_r5_00000__2f3b
FUN_M70_r5_00000__2f3b:
  2f3b  3476           PSHS  U Y X B A                   
  2f3d  C600           LDB #0x0                          
  2f3f  AD9FFC36       JSR [0xfc36]                      
  2f43  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "[tr4]"
  2f47  5B7472345D00   char[6] "[tr4]"                   
LAB_M70_r5_00000__2f4d:
  2f4d  FC7108         LDD 0x7108                        
  2f50  170020         LBSR 0x2f73                       
  2f53  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "/"
  2f57  2F00           char[2] "/"                       
LAB_M70_r5_00000__2f59:
  2f59  FC710A         LDD 0x710a                        
  2f5c  170014         LBSR 0x2f73                       
  2f5f  3576           PULS  A B X Y U                   
  2f61  39             RTS                               

; ---- function FUN_M70_r5_00000__2f62
FUN_M70_r5_00000__2f62:
  2f62  3476           PSHS  U Y X B A                   
  2f64  FC7108         LDD 0x7108                        
  2f67  17001A         LBSR 0x2f84                       
  2f6a  FC710A         LDD 0x710a                        
  2f6d  170014         LBSR 0x2f84                       
  2f70  3576           PULS  A B X Y U                   
  2f72  39             RTS                               

; ---- function FUN_M70_r5_00000__2f73
FUN_M70_r5_00000__2f73:
  2f73  3476           PSHS  U Y X B A                   
  2f75  58             LSLB                              
  2f76  49             ROLA                              
  2f77  F3600D         ADDD 0x600d                       
  2f7a  C32FDD         ADDD #0x2fdd                      
  2f7d  1F02           TFR D,Y                           
  2f7f  ADB4           JSR [,Y]                          
  2f81  3576           PULS  A B X Y U                   
  2f83  39             RTS                               

; ---- function FUN_M70_r5_00000__2f84
FUN_M70_r5_00000__2f84:
  2f84  3476           PSHS  U Y X B A                   
  2f86  58             LSLB                              
  2f87  49             ROLA                              
  2f88  F3600D         ADDD 0x600d                       
  2f8b  C32F95         ADDD #0x2f95                      
  2f8e  1F02           TFR D,Y                           
  2f90  ADB4           JSR [,Y]                          
  2f92  3576           PULS  A B X Y U                   
  2f94  39             RTS                               
  2f95  .db 1D AB 1E 87 1E 8E 1E 95 1E F6 1E FD 1F 04 1E 18  ; ................
  2fa5  .db 1E 1F 1E 26 1F 65 1F 6C 1F 73 20 D5 20 DC 20 E3  ; ...&.e.l.s . . .
  2fb5  .db 1F E1 1F E8 1F EF 21 51 21 58 21 5F 22 FB 23 47  ; ......!Q!X!_".#G
  2fc5  .db 22 45 22 4C 22 53 22 BB 22 C2 22 C9 20 5D 20 64  ; "E"L"S".".". ] d
  2fd5  .db 20 6B 21 CD 21 D4 21 DB 1D AC 1E 36 1E 51 1E 6C  ;  k!.!.!....6.Q.l
  2fe5  .db 1E A5 1E C0 1E DB 1D C7 1D E2 1D FD 1F 14 1F 2F  ; .............../
  2ff5  .db 1F 4A 20 84 20 9F 20 BA 1F 90 1F AB 1F C6 21 00  ; .J . . .......!.
  3005  .db 21 1B 21 36 22 E0 23 2C 21 F4 22 0F 22 2A 22 6A  ; !.!6".#,!."."*"j
  3015  .db 22 85 22 A0 20 0C 20 27 20 42 21 7C 21 97 21 B2  ; ".". . ' B!|!.!.

;; Module 70 code record 04, 2345 bytes, entered at payload start
MODULE_70_04_CODE_hdr:
  3025  700409310000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_70_04_entry
MODULE_70_04_entry:
  302d  39             RTS                               
  302e  .db 39 39 39 39 39 34 76 FC 70 C0 FD 71 54 35 76 39  ; 999994v.p..qT5v9
  303e  .db 34 76 FC 70 C2 FD 71 56 35 76 39                 ; 4v.p..qV5v9
PTR_FUN_M70_r5_00000__347b_M70_r5_00000__3049:
  3049  347B           addr M70_r5_00000::347b           
  304b  3093           addr M70_r5_00000::3093           
  304d  .db 30 87 70 A8 70 E0 00 00 71 0C 00 08 00 91 1F 00  ; 0.p.p...q.......
  305d  .db 00 00 64 00 01 00 03 1F 30 9F 00 00 00 00 00 00  ; ..d.....0.......
  306d  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__306f
FUN_M70_r5_00000__306f:
  306f  3410           PSHS  X                           
  3071  8E3049         LDX #0x3049                       
  3074  AD9FFE74       JSR [0xfe74]                      
  3078  3510           PULS  X                           
  307a  39             RTS                               

; ---- function FUN_M70_r5_00000__307b
FUN_M70_r5_00000__307b:
  307b  3410           PSHS  X                           
  307d  8E3049         LDX #0x3049                        ; desc[API_FE22]: ->$347B ->$3093
  3080  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3084  3510           PULS  X                           
  3086  39             RTS                               

; ---- function FUN_M70_r5_00000__3087
FUN_M70_r5_00000__3087:
  3087  3410           PSHS  X                           
  3089  8E3049         LDX #0x3049                       
  308c  AD9FFE70       JSR [0xfe70]                      
  3090  3510           PULS  X                           
  3092  39             RTS                               

; ---- function FUN_M70_r5_00000__3093
FUN_M70_r5_00000__3093:
  3093  3410           PSHS  X                           
  3095  8E3049         LDX #0x3049                       
  3098  AD9FFE72       JSR [0xfe72]                      
  309c  3510           PULS  X                           
  309e  39             RTS                               
  309f  .db 14 75 70 20 31 20 72 61 74 65 3A 20 20 20 20 20  ; .up 1 rate:     
  30af  .db 20 20 20 20 20 20                                ;       
PTR_FUN_M70_r5_00000__352d_M70_r5_00000__30b5:
  30b5  352D           addr M70_r5_00000::352d           
  30b7  30FF           addr M70_r5_00000::30ff           
  30b9  .db 30 F3 70 B2 70 E8 00 00 71 14 00 08 00 93 23 00  ; 0.p.p...q.....#.
  30c9  .db 00 00 64 00 01 00 03 1F 31 0B 00 00 00 00 00 00  ; ..d.....1.......
  30d9  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__30db
FUN_M70_r5_00000__30db:
  30db  3410           PSHS  X                           
  30dd  8E30B5         LDX #0x30b5                       
  30e0  AD9FFE74       JSR [0xfe74]                      
  30e4  3510           PULS  X                           
  30e6  39             RTS                               

; ---- function FUN_M70_r5_00000__30e7
FUN_M70_r5_00000__30e7:
  30e7  3410           PSHS  X                           
  30e9  8E30B5         LDX #0x30b5                        ; desc[API_FE22]: ->$352D ->$30FF
  30ec  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  30f0  3510           PULS  X                           
  30f2  39             RTS                               

; ---- function FUN_M70_r5_00000__30f3
FUN_M70_r5_00000__30f3:
  30f3  3410           PSHS  X                           
  30f5  8E30B5         LDX #0x30b5                       
  30f8  AD9FFE70       JSR [0xfe70]                      
  30fc  3510           PULS  X                           
  30fe  39             RTS                               

; ---- function FUN_M70_r5_00000__30ff
FUN_M70_r5_00000__30ff:
  30ff  3410           PSHS  X                           
  3101  8E30B5         LDX #0x30b5                       
  3104  AD9FFE72       JSR [0xfe72]                      
  3108  3510           PULS  X                           
  310a  39             RTS                               
  310b  .db 14 75 70 20 32 20 72 61 74 65 3A 20 20 20 20 20  ; .up 2 rate:     
  311b  .db 20 20 20 20 20 20                                ;       
PTR_FUN_M70_r5_00000__34d4_M70_r5_00000__3121:
  3121  34D4           addr M70_r5_00000::34d4           
  3123  316B           addr M70_r5_00000::316b           
  3125  .db 31 5F 70 AC 70 E4 00 00 71 10 00 08 00 92 21 00  ; 1_p.p...q.....!.
  3135  .db 00 00 64 00 01 00 03 1F 31 77 00 00 00 00 00 00  ; ..d.....1w......
  3145  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__3147
FUN_M70_r5_00000__3147:
  3147  3410           PSHS  X                           
  3149  8E3121         LDX #0x3121                       
  314c  AD9FFE74       JSR [0xfe74]                      
  3150  3510           PULS  X                           
  3152  39             RTS                               

; ---- function FUN_M70_r5_00000__3153
FUN_M70_r5_00000__3153:
  3153  3410           PSHS  X                           
  3155  8E3121         LDX #0x3121                        ; desc[API_FE22]: ->$34D4 ->$316B
  3158  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  315c  3510           PULS  X                           
  315e  39             RTS                               

; ---- function FUN_M70_r5_00000__315f
FUN_M70_r5_00000__315f:
  315f  3410           PSHS  X                           
  3161  8E3121         LDX #0x3121                       
  3164  AD9FFE70       JSR [0xfe70]                      
  3168  3510           PULS  X                           
  316a  39             RTS                               

; ---- function FUN_M70_r5_00000__316b
FUN_M70_r5_00000__316b:
  316b  3410           PSHS  X                           
  316d  8E3121         LDX #0x3121                       
  3170  AD9FFE72       JSR [0xfe72]                      
  3174  3510           PULS  X                           
  3176  39             RTS                               
  3177  .db 14 64 6E 20 31 20 72 61 74 65 3A 20 20 20 20 20  ; .dn 1 rate:     
  3187  .db 20 20 20 20 20 20                                ;       
PTR_FUN_M70_r5_00000__3586_M70_r5_00000__318d:
  318d  3586           addr M70_r5_00000::3586           
  318f  31D7           addr M70_r5_00000::31d7           
  3191  .db 31 CB 70 B6 70 EC 00 00 71 18 00 08 00 94 25 00  ; 1.p.p...q.....%.
  31a1  .db 00 00 64 00 01 00 03 1F 31 E3 00 00 00 00 00 00  ; ..d.....1.......
  31b1  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__31b3
FUN_M70_r5_00000__31b3:
  31b3  3410           PSHS  X                           
  31b5  8E318D         LDX #0x318d                       
  31b8  AD9FFE74       JSR [0xfe74]                      
  31bc  3510           PULS  X                           
  31be  39             RTS                               

; ---- function FUN_M70_r5_00000__31bf
FUN_M70_r5_00000__31bf:
  31bf  3410           PSHS  X                           
  31c1  8E318D         LDX #0x318d                        ; desc[API_FE22]: ->$3586 ->$31D7
  31c4  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  31c8  3510           PULS  X                           
  31ca  39             RTS                               

; ---- function FUN_M70_r5_00000__31cb
FUN_M70_r5_00000__31cb:
  31cb  3410           PSHS  X                           
  31cd  8E318D         LDX #0x318d                       
  31d0  AD9FFE70       JSR [0xfe70]                      
  31d4  3510           PULS  X                           
  31d6  39             RTS                               

; ---- function FUN_M70_r5_00000__31d7
FUN_M70_r5_00000__31d7:
  31d7  3410           PSHS  X                           
  31d9  8E318D         LDX #0x318d                       
  31dc  AD9FFE72       JSR [0xfe72]                      
  31e0  3510           PULS  X                           
  31e2  39             RTS                               
  31e3  .db 14 64 6E 20 31 20 72 61 74 65 3A 20 20 20 20 20  ; .dn 1 rate:     
  31f3  .db 20 20 20 20 20 20                                ;       
PTR_FUN_M70_r5_00000__34ae_M70_r5_00000__31f9:
  31f9  34AE           addr M70_r5_00000::34ae           
  31fb  3243           addr M70_r5_00000::3243           
  31fd  .db 32 37 70 AA 70 E2 00 00 71 0E 00 08 00 95 20 FB  ; 27p.p...q..... .
  320d  .db 50 04 B0 00 01 00 05 1D 32 4F 00 00 00 00 00 00  ; P.......2O......
  321d  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__321f
FUN_M70_r5_00000__321f:
  321f  3410           PSHS  X                           
  3221  8E31F9         LDX #0x31f9                        ; desc[API_FE6A]: ->$34AE ->$3243
  3224  AD9FFE6A       JSR [0xfe6a]                      
  3228  3510           PULS  X                           
  322a  39             RTS                               

; ---- function FUN_M70_r5_00000__322b
FUN_M70_r5_00000__322b:
  322b  3410           PSHS  X                           
  322d  8E31F9         LDX #0x31f9                        ; desc[API_FDBC]: ->$34AE ->$3243
  3230  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..1."
  3234  3510           PULS  X                           
  3236  39             RTS                               

; ---- function FUN_M70_r5_00000__3237
FUN_M70_r5_00000__3237:
  3237  3410           PSHS  X                           
  3239  8E31F9         LDX #0x31f9                        ; desc[API_FE6C]: ->$34AE ->$3243
  323c  AD9FFE6C       JSR [0xfe6c]                      
  3240  3510           PULS  X                           
  3242  39             RTS                               

; ---- function FUN_M70_r5_00000__3243
FUN_M70_r5_00000__3243:
  3243  3410           PSHS  X                           
  3245  8E31F9         LDX #0x31f9                        ; desc[API_FE6E]: ->$34AE ->$3243
  3248  AD9FFE6E       JSR [0xfe6e]                      
  324c  3510           PULS  X                           
  324e  39             RTS                               
  324f  .db 14 75 70 20 31 20 6D 61 78 3A 20 20 20 20 20 20  ; .up 1 max:      
  325f  .db 63 65 6E 74 73                                   ; cents
PTR_FUN_M70_r5_00000__3560_M70_r5_00000__3264:
  3264  3560           addr M70_r5_00000::3560           
  3266  32AE           addr M70_r5_00000::32ae           
  3268  .db 32 A2 70 B4 70 EA 00 00 71 16 00 08 00 99 24 FB  ; 2.p.p...q.....$.
  3278  .db 50 04 B0 00 01 00 05 1D 32 BA 00 00 00 00 00 00  ; P.......2.......
  3288  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__328a
FUN_M70_r5_00000__328a:
  328a  3410           PSHS  X                           
  328c  8E3264         LDX #0x3264                        ; desc[API_FE6A]: ->$3560 ->$32AE
  328f  AD9FFE6A       JSR [0xfe6a]                      
  3293  3510           PULS  X                           
  3295  39             RTS                               

; ---- function FUN_M70_r5_00000__3296
FUN_M70_r5_00000__3296:
  3296  3410           PSHS  X                           
  3298  8E3264         LDX #0x3264                        ; desc[API_FDBC]: ->$3560 ->$32AE
  329b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..2d"
  329f  3510           PULS  X                           
  32a1  39             RTS                               

; ---- function FUN_M70_r5_00000__32a2
FUN_M70_r5_00000__32a2:
  32a2  3410           PSHS  X                           
  32a4  8E3264         LDX #0x3264                        ; desc[API_FE6C]: ->$3560 ->$32AE
  32a7  AD9FFE6C       JSR [0xfe6c]                      
  32ab  3510           PULS  X                           
  32ad  39             RTS                               

; ---- function FUN_M70_r5_00000__32ae
FUN_M70_r5_00000__32ae:
  32ae  3410           PSHS  X                           
  32b0  8E3264         LDX #0x3264                        ; desc[API_FE6E]: ->$3560 ->$32AE
  32b3  AD9FFE6E       JSR [0xfe6e]                      
  32b7  3510           PULS  X                           
  32b9  39             RTS                               
  32ba  .db 14 75 70 20 32 20 6D 61 78 3A 20 20 20 20 20 20  ; .up 2 max:      
  32ca  .db 63 65 6E 74 73                                   ; cents
PTR_FUN_M70_r5_00000__3507_M70_r5_00000__32cf:
  32cf  3507           addr M70_r5_00000::3507           
  32d1  3319           addr M70_r5_00000::3319           
  32d3  .db 33 0D 70 AE 70 E6 00 00 71 12 00 08 00 97 22 FB  ; 3.p.p...q.....".
  32e3  .db 50 04 B0 00 01 00 05 1D 33 25 00 00 00 00 00 00  ; P.......3%......
  32f3  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__32f5
FUN_M70_r5_00000__32f5:
  32f5  3410           PSHS  X                           
  32f7  8E32CF         LDX #0x32cf                        ; desc[API_FE6A]: ->$3507 ->$3319
  32fa  AD9FFE6A       JSR [0xfe6a]                      
  32fe  3510           PULS  X                           
  3300  39             RTS                               

; ---- function FUN_M70_r5_00000__3301
FUN_M70_r5_00000__3301:
  3301  3410           PSHS  X                           
  3303  8E32CF         LDX #0x32cf                        ; desc[API_FDBC]: ->$3507 ->$3319
  3306  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..2."
  330a  3510           PULS  X                           
  330c  39             RTS                               

; ---- function FUN_M70_r5_00000__330d
FUN_M70_r5_00000__330d:
  330d  3410           PSHS  X                           
  330f  8E32CF         LDX #0x32cf                        ; desc[API_FE6C]: ->$3507 ->$3319
  3312  AD9FFE6C       JSR [0xfe6c]                      
  3316  3510           PULS  X                           
  3318  39             RTS                               

; ---- function FUN_M70_r5_00000__3319
FUN_M70_r5_00000__3319:
  3319  3410           PSHS  X                           
  331b  8E32CF         LDX #0x32cf                        ; desc[API_FE6E]: ->$3507 ->$3319
  331e  AD9FFE6E       JSR [0xfe6e]                      
  3322  3510           PULS  X                           
  3324  39             RTS                               
  3325  .db 14 64 6E 20 31 20 6D 69 6E 3A 20 20 20 20 20 20  ; .dn 1 min:      
  3335  .db 63 65 6E 74 73                                   ; cents
PTR_FUN_M70_r5_00000__35b9_M70_r5_00000__333a:
  333a  35B9           addr M70_r5_00000::35b9           
  333c  3384           addr M70_r5_00000::3384           
  333e  .db 33 78 70 B8 70 EE 00 00 71 1A 00 08 00 9B 26 FB  ; 3xp.p...q.....&.
  334e  .db 50 04 B0 00 01 00 05 1D 33 90 00 00 00 00 00 00  ; P.......3.......
  335e  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__3360
FUN_M70_r5_00000__3360:
  3360  3410           PSHS  X                           
  3362  8E333A         LDX #0x333a                        ; desc[API_FE6A]: ->$35B9 ->$3384
  3365  AD9FFE6A       JSR [0xfe6a]                      
  3369  3510           PULS  X                           
  336b  39             RTS                               

; ---- function FUN_M70_r5_00000__336c
FUN_M70_r5_00000__336c:
  336c  3410           PSHS  X                           
  336e  8E333A         LDX #0x333a                        ; desc[API_FDBC]: ->$35B9 ->$3384
  3371  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..3:"
  3375  3510           PULS  X                           
  3377  39             RTS                               

; ---- function FUN_M70_r5_00000__3378
FUN_M70_r5_00000__3378:
  3378  3410           PSHS  X                           
  337a  8E333A         LDX #0x333a                        ; desc[API_FE6C]: ->$35B9 ->$3384
  337d  AD9FFE6C       JSR [0xfe6c]                      
  3381  3510           PULS  X                           
  3383  39             RTS                               

; ---- function FUN_M70_r5_00000__3384
FUN_M70_r5_00000__3384:
  3384  3410           PSHS  X                           
  3386  8E333A         LDX #0x333a                        ; desc[API_FE6E]: ->$35B9 ->$3384
  3389  AD9FFE6E       JSR [0xfe6e]                      
  338d  3510           PULS  X                           
  338f  39             RTS                               
  3390  .db 14 64 6E 20 32 20 6D 69 6E 3A 20 20 20 20 20 20  ; .dn 2 min:      
  33a0  .db 63 65 6E 74 73                                   ; cents
PTR_FUN_M70_r5_00000__35df_M70_r5_00000__33a5:
  33a5  35DF           addr M70_r5_00000::35df           
  33a7  33EF           addr M70_r5_00000::33ef           
  33a9  .db 33 E3 70 BC 70 F0 00 00 71 1C 00 08 00 9D 27 FB  ; 3.p.p...q.....'.
  33b9  .db 50 04 B0 00 01 00 05 1D 33 FB 00 00 00 00 00 00  ; P.......3.......
  33c9  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__33cb
FUN_M70_r5_00000__33cb:
  33cb  3410           PSHS  X                           
  33cd  8E33A5         LDX #0x33a5                        ; desc[API_FE6A]: ->$35DF ->$33EF
  33d0  AD9FFE6A       JSR [0xfe6a]                      
  33d4  3510           PULS  X                           
  33d6  39             RTS                               

; ---- function FUN_M70_r5_00000__33d7
FUN_M70_r5_00000__33d7:
  33d7  3410           PSHS  X                           
  33d9  8E33A5         LDX #0x33a5                        ; desc[API_FDBC]: ->$35DF ->$33EF
  33dc  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..3."
  33e0  3510           PULS  X                           
  33e2  39             RTS                               

; ---- function FUN_M70_r5_00000__33e3
FUN_M70_r5_00000__33e3:
  33e3  3410           PSHS  X                           
  33e5  8E33A5         LDX #0x33a5                        ; desc[API_FE6C]: ->$35DF ->$33EF
  33e8  AD9FFE6C       JSR [0xfe6c]                      
  33ec  3510           PULS  X                           
  33ee  39             RTS                               

; ---- function FUN_M70_r5_00000__33ef
FUN_M70_r5_00000__33ef:
  33ef  3410           PSHS  X                           
  33f1  8E33A5         LDX #0x33a5                        ; desc[API_FE6E]: ->$35DF ->$33EF
  33f4  AD9FFE6E       JSR [0xfe6e]                      
  33f8  3510           PULS  X                           
  33fa  39             RTS                               
  33fb  .db 14 72 70 69 74 63 68 31 3A 20 20 20 20 20 20 20  ; .rpitch1:       
  340b  .db 63 65 6E 74 73                                   ; cents
PTR_FUN_M70_r5_00000__3605_M70_r5_00000__3410:
  3410  3605           addr M70_r5_00000::3605           
  3412  345A           addr M70_r5_00000::345a           
  3414  .db 34 4E 70 BE 70 F2 00 00 71 1E 00 08 00 9F 28 FB  ; 4Np.p...q.....(.
  3424  .db 50 04 B0 00 01 00 05 1D 34 66 00 00 00 00 00 00  ; P.......4f......
  3434  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__3436
FUN_M70_r5_00000__3436:
  3436  3410           PSHS  X                           
  3438  8E3410         LDX #0x3410                        ; desc[API_FE6A]: ->$3605 ->$345A
  343b  AD9FFE6A       JSR [0xfe6a]                      
  343f  3510           PULS  X                           
  3441  39             RTS                               

; ---- function FUN_M70_r5_00000__3442
FUN_M70_r5_00000__3442:
  3442  3410           PSHS  X                           
  3444  8E3410         LDX #0x3410                        ; desc[API_FDBC]: ->$3605 ->$345A
  3447  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..4."
  344b  3510           PULS  X                           
  344d  39             RTS                               

; ---- function FUN_M70_r5_00000__344e
FUN_M70_r5_00000__344e:
  344e  3410           PSHS  X                           
  3450  8E3410         LDX #0x3410                        ; desc[API_FE6C]: ->$3605 ->$345A
  3453  AD9FFE6C       JSR [0xfe6c]                      
  3457  3510           PULS  X                           
  3459  39             RTS                               

; ---- function FUN_M70_r5_00000__345a
FUN_M70_r5_00000__345a:
  345a  3410           PSHS  X                           
  345c  8E3410         LDX #0x3410                        ; desc[API_FE6E]: ->$3605 ->$345A
  345f  AD9FFE6E       JSR [0xfe6e]                      
  3463  3510           PULS  X                           
  3465  39             RTS                               
  3466  .db 14 72 70 69 74 63 68 32 3A 20 20 20 20 20 20 20  ; .rpitch2:       
  3476  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M70_r5_00000__347b
FUN_M70_r5_00000__347b:
  347b  3476           PSHS  U Y X B A                   
  347d  CC0000         LDD #0x0                          
  3480  3606           PSHU  B A                         
  3482  CC0064         LDD #0x64                         
  3485  3606           PSHU  B A                         
  3487  FC70A8         LDD 0x70a8                        
  348a  F370E0         ADDD 0x70e0                       
  348d  3606           PSHU  B A                         
  348f  AD9FFCD8       JSR [0xfcd8]                      
  3493  3706           PULU  A B                         
  3495  FD710C         STD 0x710c                        
  3498  FC710C         LDD 0x710c                        
  349b  3606           PSHU  B A                         
  349d  CC0014         LDD #0x14                         
  34a0  3606           PSHU  B A                         
  34a2  AD9FFCEE       JSR [0xfcee]                      
  34a6  3706           PULU  A B                         
  34a8  FD7140         STD 0x7140                        
  34ab  3576           PULS  A B X Y U                   
  34ad  39             RTS                               

; ---- function FUN_M70_r5_00000__34ae
FUN_M70_r5_00000__34ae:
  34ae  3476           PSHS  U Y X B A                   
  34b0  CCFB50         LDD #0xfb50                       
  34b3  3606           PSHU  B A                         
  34b5  CC04B0         LDD #0x4b0                        
  34b8  3606           PSHU  B A                         
  34ba  FC70AA         LDD 0x70aa                        
  34bd  F370E2         ADDD 0x70e2                       
  34c0  3606           PSHU  B A                         
  34c2  AD9FFCD8       JSR [0xfcd8]                      
  34c6  3706           PULU  A B                         
  34c8  FD710E         STD 0x710e                        
  34cb  FC710E         LDD 0x710e                        
  34ce  FD7142         STD 0x7142                        
  34d1  3576           PULS  A B X Y U                   
  34d3  39             RTS                               

; ---- function FUN_M70_r5_00000__34d4
FUN_M70_r5_00000__34d4:
  34d4  3476           PSHS  U Y X B A                   
  34d6  CC0000         LDD #0x0                          
  34d9  3606           PSHU  B A                         
  34db  CC0064         LDD #0x64                         
  34de  3606           PSHU  B A                         
  34e0  FC70AC         LDD 0x70ac                        
  34e3  F370E4         ADDD 0x70e4                       
  34e6  3606           PSHU  B A                         
  34e8  AD9FFCD8       JSR [0xfcd8]                      
  34ec  3706           PULU  A B                         
  34ee  FD7110         STD 0x7110                        
  34f1  FC7110         LDD 0x7110                        
  34f4  3606           PSHU  B A                         
  34f6  CC0014         LDD #0x14                         
  34f9  3606           PSHU  B A                         
  34fb  AD9FFCEE       JSR [0xfcee]                      
  34ff  3706           PULU  A B                         
  3501  FD7144         STD 0x7144                        
  3504  3576           PULS  A B X Y U                   
  3506  39             RTS                               

; ---- function FUN_M70_r5_00000__3507
FUN_M70_r5_00000__3507:
  3507  3476           PSHS  U Y X B A                   
  3509  CCFB50         LDD #0xfb50                       
  350c  3606           PSHU  B A                         
  350e  CC04B0         LDD #0x4b0                        
  3511  3606           PSHU  B A                         
  3513  FC70AE         LDD 0x70ae                        
  3516  F370E6         ADDD 0x70e6                       
  3519  3606           PSHU  B A                         
  351b  AD9FFCD8       JSR [0xfcd8]                      
  351f  3706           PULU  A B                         
  3521  FD7112         STD 0x7112                        
  3524  FC7112         LDD 0x7112                        
  3527  FD7146         STD 0x7146                        
  352a  3576           PULS  A B X Y U                   
  352c  39             RTS                               

; ---- function FUN_M70_r5_00000__352d
FUN_M70_r5_00000__352d:
  352d  3476           PSHS  U Y X B A                   
  352f  CC0000         LDD #0x0                          
  3532  3606           PSHU  B A                         
  3534  CC0064         LDD #0x64                         
  3537  3606           PSHU  B A                         
  3539  FC70B2         LDD 0x70b2                        
  353c  F370E8         ADDD 0x70e8                       
  353f  3606           PSHU  B A                         
  3541  AD9FFCD8       JSR [0xfcd8]                      
  3545  3706           PULU  A B                         
  3547  FD7114         STD 0x7114                        
  354a  FC7114         LDD 0x7114                        
  354d  3606           PSHU  B A                         
  354f  CC0014         LDD #0x14                         
  3552  3606           PSHU  B A                         
  3554  AD9FFCEE       JSR [0xfcee]                      
  3558  3706           PULU  A B                         
  355a  FD7148         STD 0x7148                        
  355d  3576           PULS  A B X Y U                   
  355f  39             RTS                               

; ---- function FUN_M70_r5_00000__3560
FUN_M70_r5_00000__3560:
  3560  3476           PSHS  U Y X B A                   
  3562  CCFB50         LDD #0xfb50                       
  3565  3606           PSHU  B A                         
  3567  CC04B0         LDD #0x4b0                        
  356a  3606           PSHU  B A                         
  356c  FC70B4         LDD 0x70b4                        
  356f  F370EA         ADDD 0x70ea                       
  3572  3606           PSHU  B A                         
  3574  AD9FFCD8       JSR [0xfcd8]                      
  3578  3706           PULU  A B                         
  357a  FD7116         STD 0x7116                        
  357d  FC7116         LDD 0x7116                        
  3580  FD714A         STD 0x714a                        
  3583  3576           PULS  A B X Y U                   
  3585  39             RTS                               

; ---- function FUN_M70_r5_00000__3586
FUN_M70_r5_00000__3586:
  3586  3476           PSHS  U Y X B A                   
  3588  CC0000         LDD #0x0                          
  358b  3606           PSHU  B A                         
  358d  CC0064         LDD #0x64                         
  3590  3606           PSHU  B A                         
  3592  FC70B6         LDD 0x70b6                        
  3595  F370EC         ADDD 0x70ec                       
  3598  3606           PSHU  B A                         
  359a  AD9FFCD8       JSR [0xfcd8]                      
  359e  3706           PULU  A B                         
  35a0  FD7118         STD 0x7118                        
  35a3  FC7118         LDD 0x7118                        
  35a6  3606           PSHU  B A                         
  35a8  CC0014         LDD #0x14                         
  35ab  3606           PSHU  B A                         
  35ad  AD9FFCEE       JSR [0xfcee]                      
  35b1  3706           PULU  A B                         
  35b3  FD714C         STD 0x714c                        
  35b6  3576           PULS  A B X Y U                   
  35b8  39             RTS                               

; ---- function FUN_M70_r5_00000__35b9
FUN_M70_r5_00000__35b9:
  35b9  3476           PSHS  U Y X B A                   
  35bb  CCFB50         LDD #0xfb50                       
  35be  3606           PSHU  B A                         
  35c0  CC04B0         LDD #0x4b0                        
  35c3  3606           PSHU  B A                         
  35c5  FC70B8         LDD 0x70b8                        
  35c8  F370EE         ADDD 0x70ee                       
  35cb  3606           PSHU  B A                         
  35cd  AD9FFCD8       JSR [0xfcd8]                      
  35d1  3706           PULU  A B                         
  35d3  FD711A         STD 0x711a                        
  35d6  FC711A         LDD 0x711a                        
  35d9  FD714E         STD 0x714e                        
  35dc  3576           PULS  A B X Y U                   
  35de  39             RTS                               

; ---- function FUN_M70_r5_00000__35df
FUN_M70_r5_00000__35df:
  35df  3476           PSHS  U Y X B A                   
  35e1  CCFB50         LDD #0xfb50                       
  35e4  3606           PSHU  B A                         
  35e6  CC04B0         LDD #0x4b0                        
  35e9  3606           PSHU  B A                         
  35eb  FC70BC         LDD 0x70bc                        
  35ee  F370F0         ADDD 0x70f0                       
  35f1  3606           PSHU  B A                         
  35f3  AD9FFCD8       JSR [0xfcd8]                      
  35f7  3706           PULU  A B                         
  35f9  FD711C         STD 0x711c                        
  35fc  FC711C         LDD 0x711c                        
  35ff  FD7150         STD 0x7150                        
  3602  3576           PULS  A B X Y U                   
  3604  39             RTS                               

; ---- function FUN_M70_r5_00000__3605
FUN_M70_r5_00000__3605:
  3605  3476           PSHS  U Y X B A                   
  3607  CCFB50         LDD #0xfb50                       
  360a  3606           PSHU  B A                         
  360c  CC04B0         LDD #0x4b0                        
  360f  3606           PSHU  B A                         
  3611  FC70BE         LDD 0x70be                        
  3614  F370F2         ADDD 0x70f2                       
  3617  3606           PSHU  B A                         
  3619  AD9FFCD8       JSR [0xfcd8]                      
  361d  3706           PULU  A B                         
  361f  FD711E         STD 0x711e                        
  3622  FC711E         LDD 0x711e                        
  3625  FD7150         STD 0x7150                        
  3628  3576           PULS  A B X Y U                   
  362a  39             RTS                               
PTR_FUN_M70_r5_00000__36ae_M70_r5_00000__362b:
  362b  36AE           addr M70_r5_00000::36ae           
  362d  3675           addr M70_r5_00000::3675           
  362f  .db 36 69 70 00 70 02 00 00 70 04 00 08 00 6D 0D 00  ; 6ip.p...p....m..
  363f  .db 00 01 F4 00 01 00 03 1E 36 99 00 00 00 00 70 06  ; ........6.....p.
  364f  .db 00 6F                                            ; .o

; ---- function FUN_M70_r5_00000__3651
FUN_M70_r5_00000__3651:
  3651  3410           PSHS  X                           
  3653  8E362B         LDX #0x362b                        ; desc[API_FE6A]: ->$36AE ->$3675
  3656  AD9FFE6A       JSR [0xfe6a]                      
  365a  3510           PULS  X                           
  365c  39             RTS                               

; ---- function FUN_M70_r5_00000__365d
FUN_M70_r5_00000__365d:
  365d  3410           PSHS  X                           
  365f  8E362B         LDX #0x362b                        ; desc[API_FDBC]: ->$36AE ->$3675
  3662  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..6+"
  3666  3510           PULS  X                           
  3668  39             RTS                               

; ---- function FUN_M70_r5_00000__3669
FUN_M70_r5_00000__3669:
  3669  3410           PSHS  X                           
  366b  8E362B         LDX #0x362b                        ; desc[API_FE6C]: ->$36AE ->$3675
  366e  AD9FFE6C       JSR [0xfe6c]                      
  3672  3510           PULS  X                           
  3674  39             RTS                               

; ---- function FUN_M70_r5_00000__3675
FUN_M70_r5_00000__3675:
  3675  3410           PSHS  X                           
  3677  8E362B         LDX #0x362b                        ; desc[API_FE6E]: ->$36AE ->$3675
  367a  AD9FFE6E       JSR [0xfe6e]                      
  367e  3510           PULS  X                           
  3680  39             RTS                               

; ---- function FUN_M70_r5_00000__3681
FUN_M70_r5_00000__3681:
  3681  3410           PSHS  X                           
  3683  8E362B         LDX #0x362b                        ; desc[API_FE1C]: ->$36AE ->$3675
  3686  AD9FFE1C       JSR [0xfe1c]                      
  368a  3510           PULS  X                           
  368c  39             RTS                               

; ---- function FUN_M70_r5_00000__368d
FUN_M70_r5_00000__368d:
  368d  3410           PSHS  X                           
  368f  8E362B         LDX #0x362b                        ; desc[API_FE1A]: ->$36AE ->$3675 $3669
  3692  AD9FFE1A       JSR [0xfe1a]                      
  3696  3510           PULS  X                           
  3698  39             RTS                               
  3699  .db 14 6C 65 6E 67 74 68 20 31 3A 20 20 20 20 20 6D  ; .length 1:     m
  36a9  .db 73 65 63 20 20                                   ; sec  

; ---- function FUN_M70_r5_00000__36ae
FUN_M70_r5_00000__36ae:
  36ae  3476           PSHS  U Y X B A                   
  36b0  CC0000         LDD #0x0                          
  36b3  3606           PSHU  B A                         
  36b5  CC01F4         LDD #0x1f4                        
  36b8  3606           PSHU  B A                         
  36ba  FC7000         LDD 0x7000                        
  36bd  F37002         ADDD 0x7002                       
  36c0  3606           PSHU  B A                         
  36c2  AD9FFCD8       JSR [0xfcd8]                      
  36c6  3706           PULU  A B                         
  36c8  FD7004         STD 0x7004                        
  36cb  FC7004         LDD 0x7004                        
  36ce  3606           PSHU  B A                         
  36d0  CC002C         LDD #0x2c                         
  36d3  3606           PSHU  B A                         
  36d5  AD9FFCEE       JSR [0xfcee]                      
  36d9  3706           PULU  A B                         
  36db  FD715C         STD 0x715c                        
  36de  3576           PULS  A B X Y U                   
  36e0  39             RTS                               
PTR_FUN_M70_r5_00000__3764_M70_r5_00000__36e1:
  36e1  3764           addr M70_r5_00000::3764           
  36e3  372B           addr M70_r5_00000::372b           
  36e5  .db 37 1F 70 10 70 12 00 00 70 14 00 08 00 75 0E 00  ; 7.p.p...p....u..
  36f5  .db 00 01 F4 00 01 00 03 1E 37 4F 00 00 00 00 70 16  ; ........7O....p.
  3705  .db 00 77                                            ; .w

; ---- function FUN_M70_r5_00000__3707
FUN_M70_r5_00000__3707:
  3707  3410           PSHS  X                           
  3709  8E36E1         LDX #0x36e1                        ; desc[API_FE6A]: ->$3764 ->$372B
  370c  AD9FFE6A       JSR [0xfe6a]                      
  3710  3510           PULS  X                           
  3712  39             RTS                               

; ---- function FUN_M70_r5_00000__3713
FUN_M70_r5_00000__3713:
  3713  3410           PSHS  X                           
  3715  8E36E1         LDX #0x36e1                        ; desc[API_FDBC]: ->$3764 ->$372B
  3718  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..6."
  371c  3510           PULS  X                           
  371e  39             RTS                               

; ---- function FUN_M70_r5_00000__371f
FUN_M70_r5_00000__371f:
  371f  3410           PSHS  X                           
  3721  8E36E1         LDX #0x36e1                        ; desc[API_FE6C]: ->$3764 ->$372B
  3724  AD9FFE6C       JSR [0xfe6c]                      
  3728  3510           PULS  X                           
  372a  39             RTS                               

; ---- function FUN_M70_r5_00000__372b
FUN_M70_r5_00000__372b:
  372b  3410           PSHS  X                           
  372d  8E36E1         LDX #0x36e1                        ; desc[API_FE6E]: ->$3764 ->$372B
  3730  AD9FFE6E       JSR [0xfe6e]                      
  3734  3510           PULS  X                           
  3736  39             RTS                               

; ---- function FUN_M70_r5_00000__3737
FUN_M70_r5_00000__3737:
  3737  3410           PSHS  X                           
  3739  8E36E1         LDX #0x36e1                        ; desc[API_FE1C]: ->$3764 ->$372B
  373c  AD9FFE1C       JSR [0xfe1c]                      
  3740  3510           PULS  X                           
  3742  39             RTS                               

; ---- function FUN_M70_r5_00000__3743
FUN_M70_r5_00000__3743:
  3743  3410           PSHS  X                           
  3745  8E36E1         LDX #0x36e1                        ; desc[API_FE1A]: ->$3764 ->$372B $371F
  3748  AD9FFE1A       JSR [0xfe1a]                      
  374c  3510           PULS  X                           
  374e  39             RTS                               
  374f  .db 14 6C 65 6E 67 74 68 20 32 3A 20 20 20 20 20 6D  ; .length 2:     m
  375f  .db 73 65 63 20 20                                   ; sec  

; ---- function FUN_M70_r5_00000__3764
FUN_M70_r5_00000__3764:
  3764  3476           PSHS  U Y X B A                   
  3766  CC0000         LDD #0x0                          
  3769  3606           PSHU  B A                         
  376b  CC01F4         LDD #0x1f4                        
  376e  3606           PSHU  B A                         
  3770  FC7010         LDD 0x7010                        
  3773  F37012         ADDD 0x7012                       
  3776  3606           PSHU  B A                         
  3778  AD9FFCD8       JSR [0xfcd8]                      
  377c  3706           PULU  A B                         
  377e  FD7014         STD 0x7014                        
  3781  FC7014         LDD 0x7014                        
  3784  3606           PSHU  B A                         
  3786  CC002C         LDD #0x2c                         
  3789  3606           PSHU  B A                         
  378b  AD9FFCEE       JSR [0xfcee]                      
  378f  3706           PULU  A B                         
  3791  FD715E         STD 0x715e                        
  3794  3576           PULS  A B X Y U                   
  3796  39             RTS                               
PTR_FUN_M70_r5_00000__381b_M70_r5_00000__3797:
  3797  381B           addr M70_r5_00000::381b           
  3799  37E1           addr M70_r5_00000::37e1           
  379b  .db 37 D5 70 08 70 0A 00 00 70 0C 00 08 00 71 0F 00  ; 7.p.p...p....q..
  37ab  .db 00 00 10 00 01 00 02 1C 38 05 00 00 00 00 70 0E  ; ........8.....p.
  37bb  .db 00 73                                            ; .s

; ---- function FUN_M70_r5_00000__37bd
FUN_M70_r5_00000__37bd:
  37bd  3410           PSHS  X                           
  37bf  8E3797         LDX #0x3797                        ; desc[API_FE6A]: ->$381B ->$37E1
  37c2  AD9FFE6A       JSR [0xfe6a]                      
  37c6  3510           PULS  X                           
  37c8  39             RTS                               

; ---- function FUN_M70_r5_00000__37c9
FUN_M70_r5_00000__37c9:
  37c9  3410           PSHS  X                           
  37cb  8E3797         LDX #0x3797                        ; desc[API_FDBC]: ->$381B ->$37E1
  37ce  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..7."
  37d2  3510           PULS  X                           
  37d4  39             RTS                               

; ---- function FUN_M70_r5_00000__37d5
FUN_M70_r5_00000__37d5:
  37d5  3410           PSHS  X                           
  37d7  8E3797         LDX #0x3797                        ; desc[API_FE6C]: ->$381B ->$37E1
  37da  AD9FFE6C       JSR [0xfe6c]                      
  37de  3510           PULS  X                           
  37e0  39             RTS                               

; ---- function FUN_M70_r5_00000__37e1
FUN_M70_r5_00000__37e1:
  37e1  3410           PSHS  X                           
  37e3  8E3797         LDX #0x3797                        ; desc[API_FE6E]: ->$381B ->$37E1
  37e6  AD9FFE6E       JSR [0xfe6e]                      
  37ea  3510           PULS  X                           
  37ec  39             RTS                               

; ---- function FUN_M70_r5_00000__37ed
FUN_M70_r5_00000__37ed:
  37ed  3410           PSHS  X                           
  37ef  8E3797         LDX #0x3797                        ; desc[API_FE1C]: ->$381B ->$37E1
  37f2  AD9FFE1C       JSR [0xfe1c]                      
  37f6  3510           PULS  X                           
  37f8  39             RTS                               

; ---- function FUN_M70_r5_00000__37f9
FUN_M70_r5_00000__37f9:
  37f9  3410           PSHS  X                           
  37fb  8E3797         LDX #0x3797                        ; desc[API_FE1A]: ->$381B ->$37E1 $37D5
  37fe  AD9FFE1A       JSR [0xfe1a]                      
  3802  3510           PULS  X                           
  3804  39             RTS                               
  3805  .db 14 63 6F 75 6E 74 20 31 3A 20 20 20 20 20 20 20  ; .count 1:       
  3815  .db 20 20 20 20 20 20                                ;       

; ---- function FUN_M70_r5_00000__381b
FUN_M70_r5_00000__381b:
  381b  3476           PSHS  U Y X B A                   
  381d  8E3797         LDX #0x3797                       
  3820  AD9FFE76       JSR [0xfe76]                      
  3824  3576           PULS  A B X Y U                   
  3826  39             RTS                               
PTR_FUN_M70_r5_00000__38ac_M70_r5_00000__3827:
  3827  38AC           addr M70_r5_00000::38ac           
  3829  3871           addr M70_r5_00000::3871           
  382b  .db 38 65 70 18 70 1A 00 00 70 1C 00 08 00 79 10 00  ; 8ep.p...p....y..
  383b  .db 00 00 10 00 01 00 02 1C 38 95 00 00 00 00 70 1E  ; ........8.....p.
  384b  .db 00 7B                                            ; .{

; ---- function FUN_M70_r5_00000__384d
FUN_M70_r5_00000__384d:
  384d  3410           PSHS  X                           
  384f  8E3827         LDX #0x3827                        ; desc[API_FE6A]: ->$38AC ->$3871
  3852  AD9FFE6A       JSR [0xfe6a]                      
  3856  3510           PULS  X                           
  3858  39             RTS                               

; ---- function FUN_M70_r5_00000__3859
FUN_M70_r5_00000__3859:
  3859  3410           PSHS  X                           
  385b  8E3827         LDX #0x3827                        ; desc[API_FDBC]: ->$38AC ->$3871
  385e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..8'"
  3862  3510           PULS  X                           
  3864  39             RTS                               

; ---- function FUN_M70_r5_00000__3865
FUN_M70_r5_00000__3865:
  3865  3410           PSHS  X                           
  3867  8E3827         LDX #0x3827                        ; desc[API_FE6C]: ->$38AC ->$3871
  386a  AD9FFE6C       JSR [0xfe6c]                      
  386e  3510           PULS  X                           
  3870  39             RTS                               

; ---- function FUN_M70_r5_00000__3871
FUN_M70_r5_00000__3871:
  3871  3410           PSHS  X                           
  3873  8E3827         LDX #0x3827                        ; desc[API_FE6E]: ->$38AC ->$3871
  3876  AD9FFE6E       JSR [0xfe6e]                      
  387a  3510           PULS  X                           
  387c  39             RTS                               

; ---- function FUN_M70_r5_00000__387d
FUN_M70_r5_00000__387d:
  387d  3410           PSHS  X                           
  387f  8E3827         LDX #0x3827                        ; desc[API_FE1C]: ->$38AC ->$3871
  3882  AD9FFE1C       JSR [0xfe1c]                      
  3886  3510           PULS  X                           
  3888  39             RTS                               

; ---- function FUN_M70_r5_00000__3889
FUN_M70_r5_00000__3889:
  3889  3410           PSHS  X                           
  388b  8E3827         LDX #0x3827                        ; desc[API_FE1A]: ->$38AC ->$3871 $3865
  388e  AD9FFE1A       JSR [0xfe1a]                      
  3892  3510           PULS  X                           
  3894  39             RTS                               
  3895  .db 14 63 6F 75 6E 74 20 32 3A 20 20 20 20 20 20 20  ; .count 2:       
  38a5  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M70_r5_00000__38ac
FUN_M70_r5_00000__38ac:
  38ac  3476           PSHS  U Y X B A                   
  38ae  8E3827         LDX #0x3827                       
  38b1  AD9FFE76       JSR [0xfe76]                      
  38b5  3576           PULS  A B X Y U                   
  38b7  39             RTS                               
PTR_FUN_M70_r5_00000__3924_M70_r5_00000__38b8:
  38b8  3924           addr M70_r5_00000::3924           
  38ba  3902           addr M70_r5_00000::3902           
  38bc  .db 38 F6 70 20 70 22 00 00 70 24 00 08 00 7D 2C 00  ; 8.p p"..p$...},.
  38cc  .db 00 00 64 00 01 00 03 22 39 0E 00 00 00 00 00 00  ; ..d...."9.......
  38dc  .db 00 00                                            ; ..

; ---- function FUN_M70_r5_00000__38de
FUN_M70_r5_00000__38de:
  38de  3410           PSHS  X                           
  38e0  8E38B8         LDX #0x38b8                       
  38e3  AD9FFE74       JSR [0xfe74]                      
  38e7  3510           PULS  X                           
  38e9  39             RTS                               

; ---- function FUN_M70_r5_00000__38ea
FUN_M70_r5_00000__38ea:
  38ea  3410           PSHS  X                           
  38ec  8E38B8         LDX #0x38b8                        ; desc[API_FE22]: ->$3924 ->$3902
  38ef  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  38f3  3510           PULS  X                           
  38f5  39             RTS                               

; ---- function FUN_M70_r5_00000__38f6
FUN_M70_r5_00000__38f6:
  38f6  3410           PSHS  X                           
  38f8  8E38B8         LDX #0x38b8                       
  38fb  AD9FFE70       JSR [0xfe70]                      
  38ff  3510           PULS  X                           
  3901  39             RTS                               

; ---- function FUN_M70_r5_00000__3902
FUN_M70_r5_00000__3902:
  3902  3410           PSHS  X                           
  3904  8E38B8         LDX #0x38b8                       
  3907  AD9FFE72       JSR [0xfe72]                      
  390b  3510           PULS  X                           
  390d  39             RTS                               
  390e  .db 14 63 61 74 63 68 75 70 20 72 61 74 65 3A 20 20  ; .catchup rate:  
  391e  .db 20 20 20 20 20 20                                ;       

; ---- function FUN_M70_r5_00000__3924
FUN_M70_r5_00000__3924:
  3924  3476           PSHS  U Y X B A                   
  3926  CC0000         LDD #0x0                          
  3929  3606           PSHU  B A                         
  392b  CC0064         LDD #0x64                         
  392e  3606           PSHU  B A                         
  3930  FC7020         LDD 0x7020                        
  3933  F37022         ADDD 0x7022                       
  3936  3606           PSHU  B A                         
  3938  AD9FFCD8       JSR [0xfcd8]                      
  393c  3706           PULU  A B                         
  393e  FD7024         STD 0x7024                        
  3941  CC000A         LDD #0xa                          
  3944  AD9FFD20       JSR [0xfd20]                      
  3948  108E034A       LDY #0x34a                        
  394c  FC7024         LDD 0x7024                        
  394f  AD9FFD2E       JSR [0xfd2e]                      
  3953  3576           PULS  A B X Y U                   
  3955  39             RTS                               

;; Module 70 code record 05, 1005 bytes, entered at payload start
MODULE_70_05_CODE_hdr:
  3956  700503F50000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_70_05_entry
MODULE_70_05_entry:
  395e  39             RTS                               

; ---- function FUN_M70_r5_00000__395f
FUN_M70_r5_00000__395f:
  395f  3426           PSHS  Y B A                       
  3961  AD9FFC8E       JSR [0xfc8e]                      
  3965  FC60F9         LDD 0x60f9                        
  3968  FD70CE         STD 0x70ce                        
  396b  FD6074         STD 0x6074                        
  396e  1700FE         LBSR 0x3a6f                       
  3971  3526           PULS  A B Y                       
  3973  39             RTS                               

; ---- function FUN_M70_r5_00000__3974
FUN_M70_r5_00000__3974:
  3974  3406           PSHS  B A                         
  3976  FC70CE         LDD 0x70ce                        
  3979  88FF           EORA #0xff                        
  397b  C8FF           EORB #0xff                        
  397d  FD70CE         STD 0x70ce                        
  3980  170005         LBSR 0x3988                       
  3983  17000D         LBSR 0x3993                       
  3986  3506           PULS  A B                         

; ---- function FUN_M70_r5_00000__3988
FUN_M70_r5_00000__3988:
  3988  3406           PSHS  B A                         
  398a  1700E2         LBSR 0x3a6f                       
  398d  170067         LBSR 0x39f7                       
  3990  3506           PULS  A B                         
  3992  39             RTS                               

; ---- function FUN_M70_r5_00000__3993
FUN_M70_r5_00000__3993:
  3993  3426           PSHS  Y B A                       
  3995  108E0004       LDY #0x4                          
  3999  FC70CE         LDD 0x70ce                        
  399c  AD9FFE40       JSR [0xfe40]                      
  39a0  CC00A6         LDD #0xa6                         
  39a3  830008         SUBD #0x8                         
  39a6  1F02           TFR D,Y                           
  39a8  FC70CE         LDD 0x70ce                        
  39ab  AD9FFC80       JSR [0xfc80]                      
  39af  1700BD         LBSR 0x3a6f                       
  39b2  170042         LBSR 0x39f7                       
  39b5  170007         LBSR 0x39bf                       
  39b8  AD9FFDE8       JSR [0xfde8]                      
  39bc  3526           PULS  A B Y                       
  39be  39             RTS                               

; ---- function FUN_M70_r5_00000__39bf
FUN_M70_r5_00000__39bf:
  39bf  3456           PSHS  U X B A                     
  39c1  FC70CE         LDD 0x70ce                        
  39c4  10830000       CMPD #0x0                         
  39c8  10270015       LBEQ 0x39e1                       
  39cc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "auto=off" [-] [-] [-]
  39d0  6175746F3D6F.. ds "auto=off"                     
  39d8  00             db 0h                             
  39d9  00             db 0h                             
  39da  00             db 0h                             
LAB_M70_r5_00000__39db:
  39db  AD9FFDF2       JSR [0xfdf2]                      
  39df  2013           BRA 0x39f4                        
LAB_M70_r5_00000__39e1:
  39e1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "auto=on " [-] [-] [-]
  39e5  6175746F3D6F.. ds "auto=on "                     
  39ed  00             db 0h                             
  39ee  00             db 0h                             
  39ef  00             db 0h                             
LAB_M70_r5_00000__39f0:
  39f0  AD9FFDF2       JSR [0xfdf2]                      
LAB_M70_r5_00000__39f4:
  39f4  3556           PULS  A B X U                     
  39f6  39             RTS                               

; ---- function FUN_M70_r5_00000__39f7
FUN_M70_r5_00000__39f7:
  39f7  3456           PSHS  U X B A                     
  39f9  FC70CE         LDD 0x70ce                        
  39fc  10830000       CMPD #0x0                         
  3a00  10270035       LBEQ 0x3a39                       
  3a04  C600           LDB #0x0                          
  3a06  AD9FFC36       JSR [0xfc36]                      
  3a0a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "[off] Automatic Trigger Sequencer is OFF"
  3a0e  5B6F66665D20.. char[41] "[off] Automatic Trigger Sequencer is OFF"
LAB_M70_r5_00000__3a37:
  3a37  2033           BRA 0x3a6c                        
LAB_M70_r5_00000__3a39:
  3a39  C600           LDB #0x0                          
  3a3b  AD9FFC36       JSR [0xfc36]                      
  3a3f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "[ on] Automatic Trigger Sequencer is ON "
  3a43  5B206F6E5D20.. char[41] "[ on] Automatic Trigger Sequencer is ON "
LAB_M70_r5_00000__3a6c:
  3a6c  3556           PULS  A B X U                     
  3a6e  39             RTS                               

; ---- function FUN_M70_r5_00000__3a6f
FUN_M70_r5_00000__3a6f:
  3a6f  3476           PSHS  U Y X B A                   
  3a71  FC70CE         LDD 0x70ce                        
  3a74  10830000       CMPD #0x0                         
  3a78  1027001D       LBEQ 0x3a99                       
  3a7c  CC3B40         LDD #0x3b40                       
  3a7f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  3a83  6072           addr 6072                         
LAB_M70_r5_00000__3a85:
  3a85  CC395E         LDD #0x395e                       
  3a88  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  3a8c  6070           addr 6070                         
LAB_M70_r5_00000__3a8e:
  3a8e  CC395E         LDD #0x395e                       
  3a91  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $608F
  3a95  608F           addr 608f                         
LAB_M70_r5_00000__3a97:
  3a97  2028           BRA 0x3ac1                        
LAB_M70_r5_00000__3a99:
  3a99  FC715A         LDD 0x715a                        
  3a9c  FD7128         STD 0x7128                        
  3a9f  CC3B40         LDD #0x3b40                       
  3aa2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  3aa6  6072           addr 6072                         
LAB_M70_r5_00000__3aa8:
  3aa8  CC395E         LDD #0x395e                       
  3aab  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  3aaf  6070           addr 6070                         
LAB_M70_r5_00000__3ab1:
  3ab1  CC3B40         LDD #0x3b40                       
  3ab4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $608F
  3ab8  608F           addr 608f                         
LAB_M70_r5_00000__3aba:
  3aba  FC7158         LDD 0x7158                        
  3abd  AD9FFCBC       JSR [0xfcbc]                      
LAB_M70_r5_00000__3ac1:
  3ac1  3576           PULS  A B X Y U                   
  3ac3  39             RTS                               
DAT_M70_r5_00000__3ac4:
  3ac4  3A             ?? 3Ah    :                       
  3ac5  .db CC 3A F4 3B 1C 3B 28 00 0C 00 09 00 20 00 00 00  ; .:.;.;(..... ...
  3ad5  .db 00 00 00 00 12 00 09 00 20 00 00 00 00 00 00 00  ; ........ .......
  3ae5  .db 18 00 07 00 00 00 08 00 20 00 00 FF FF FF FF 00  ; ........ .......
  3af5  .db 1A 00 00 00 0C 00 00 00 12 00 00 00 18 00 1C 00  ; ................
  3b05  .db 10 00 0E 00 00 00 00 00 0A 00 14 00 00 00 00 00  ; ................
  3b15  .db 20 00 00 FF FF FF FF 00 00 00 00 00 18 00 1C FF  ;  ...............
  3b25  .db FF FF FF 00 00 00 09 00 00 00 00 00 07 00 00 00  ; ................
  3b35  .db 00 00 00 00 08 00 00 FF FF FF FF                 ; ...........

; ---- function FUN_M70_r5_00000__3b40
FUN_M70_r5_00000__3b40:
  3b40  3476           PSHS  U Y X B A                   
LAB_M70_r5_00000__3b42:
  3b42  CC3B40         LDD #0x3b40                       
  3b45  F3600D         ADDD 0x600d                       
  3b48  10B36072       CMPD 0x6072                       
  3b4c  271F           BEQ 0x3b6d                        
  3b4e  BE7128         LDX 0x7128                        
  3b51  EC84           LDD ,X                            
  3b53  1083FFFF       CMPD #0xffff                      
  3b57  276A           BEQ 0x3bc3                        
  3b59  EC81           LDD ,X++                          
  3b5b  17F426         LBSR 0x2f84                       
  3b5e  EC84           LDD ,X                            
  3b60  1083FFFF       CMPD #0xffff                      
  3b64  275D           BEQ 0x3bc3                        
  3b66  EC81           LDD ,X++                          
  3b68  17F419         LBSR 0x2f84                       
  3b6b  2049           BRA 0x3bb6                        
LAB_M70_r5_00000__3b6d:
  3b6d  BE7128         LDX 0x7128                        
  3b70  EC84           LDD ,X                            
  3b72  1083FFFF       CMPD #0xffff                      
  3b76  274B           BEQ 0x3bc3                        
  3b78  C600           LDB #0x0                          
  3b7a  AD9FFC36       JSR [0xfc36]                      
  3b7e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "["
  3b82  5B00           char[2] "["                       
LAB_M70_r5_00000__3b84:
  3b84  FC7128         LDD 0x7128                        
  3b87  B3715A         SUBD 0x715a                       
  3b8a  47             ASRA                              
  3b8b  56             RORB                              
  3b8c  47             ASRA                              
  3b8d  56             RORB                              
  3b8e  AD9FFC44       JSR [0xfc44]                      
  3b92  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "]"
  3b96  5D00           char[2] "]"                       
LAB_M70_r5_00000__3b98:
  3b98  EC81           LDD ,X++                          
  3b9a  17F3E7         LBSR 0x2f84                       
  3b9d  17F3D3         LBSR 0x2f73                       
  3ba0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "/"
  3ba4  2F00           char[2] "/"                       
LAB_M70_r5_00000__3ba6:
  3ba6  EC84           LDD ,X                            
  3ba8  1083FFFF       CMPD #0xffff                      
  3bac  2715           BEQ 0x3bc3                        
  3bae  EC81           LDD ,X++                          
  3bb0  17F3D1         LBSR 0x2f84                       
  3bb3  17F3BD         LBSR 0x2f73                       
LAB_M70_r5_00000__3bb6:
  3bb6  BF7128         STX 0x7128                        
  3bb9  FC7158         LDD 0x7158                        
  3bbc  AD9FFCBC       JSR [0xfcbc]                      
  3bc0  3576           PULS  A B X Y U                   
  3bc2  39             RTS                               
LAB_M70_r5_00000__3bc3:
  3bc3  FC715A         LDD 0x715a                        
  3bc6  FD7128         STD 0x7128                        
  3bc9  16FF76         LBRA 0x3b42                       
PTR_FUN_M70_r5_00000__3c50_M70_r5_00000__3bcc:
  3bcc  3C50           addr M70_r5_00000::3c50           
  3bce  3C16           addr M70_r5_00000::3c16           
  3bd0  .db 3C 0A 70 C4 70 C6 00 00 70 C8 00 08 00 A1 05 00  ; <.p.p...p.......
  3be0  .db 00 00 64 00 01 00 03 22 3C 3A 00 00 00 00 70 CA  ; ..d...."<:....p.
  3bf0  .db 00 A3                                            ; ..

; ---- function FUN_M70_r5_00000__3bf2
FUN_M70_r5_00000__3bf2:
  3bf2  3410           PSHS  X                           
  3bf4  8E3BCC         LDX #0x3bcc                        ; desc[API_FE6A]: ->$3C50 ->$3C16
  3bf7  AD9FFE6A       JSR [0xfe6a]                      
  3bfb  3510           PULS  X                           
  3bfd  39             RTS                               

; ---- function FUN_M70_r5_00000__3bfe
FUN_M70_r5_00000__3bfe:
  3bfe  3410           PSHS  X                           
  3c00  8E3BCC         LDX #0x3bcc                        ; desc[API_FDBC]: ->$3C50 ->$3C16
  3c03  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..;."
  3c07  3510           PULS  X                           
  3c09  39             RTS                               

; ---- function FUN_M70_r5_00000__3c0a
FUN_M70_r5_00000__3c0a:
  3c0a  3410           PSHS  X                           
  3c0c  8E3BCC         LDX #0x3bcc                        ; desc[API_FE6C]: ->$3C50 ->$3C16
  3c0f  AD9FFE6C       JSR [0xfe6c]                      
  3c13  3510           PULS  X                           
  3c15  39             RTS                               

; ---- function FUN_M70_r5_00000__3c16
FUN_M70_r5_00000__3c16:
  3c16  3410           PSHS  X                           
  3c18  8E3BCC         LDX #0x3bcc                        ; desc[API_FE6E]: ->$3C50 ->$3C16
  3c1b  AD9FFE6E       JSR [0xfe6e]                      
  3c1f  3510           PULS  X                           
  3c21  39             RTS                               

; ---- function FUN_M70_r5_00000__3c22
FUN_M70_r5_00000__3c22:
  3c22  3410           PSHS  X                           
  3c24  8E3BCC         LDX #0x3bcc                        ; desc[API_FE1C]: ->$3C50 ->$3C16
  3c27  AD9FFE1C       JSR [0xfe1c]                      
  3c2b  3510           PULS  X                           
  3c2d  39             RTS                               

; ---- function FUN_M70_r5_00000__3c2e
FUN_M70_r5_00000__3c2e:
  3c2e  3410           PSHS  X                           
  3c30  8E3BCC         LDX #0x3bcc                        ; desc[API_FE1A]: ->$3C50 ->$3C16 $3C0A
  3c33  AD9FFE1A       JSR [0xfe1a]                      
  3c37  3510           PULS  X                           
  3c39  39             RTS                               
  3c3a  .db 14 70 72 6F 67 72 61 6D 20 72 61 74 65 3A 20 20  ; .program rate:  
  3c4a  .db 20 20 20 20 20 20                                ;       

; ---- function FUN_M70_r5_00000__3c50
FUN_M70_r5_00000__3c50:
  3c50  3476           PSHS  U Y X B A                   
  3c52  8E3BCC         LDX #0x3bcc                       
  3c55  AD9FFE76       JSR [0xfe76]                      
  3c59  CC0064         LDD #0x64                         
  3c5c  B370C8         SUBD 0x70c8                       
  3c5f  3606           PSHU  B A                         
  3c61  CC0032         LDD #0x32                         
  3c64  3606           PSHU  B A                         
  3c66  AD9FFCEE       JSR [0xfcee]                      
  3c6a  3706           PULU  A B                         
  3c6c  FD7158         STD 0x7158                        
  3c6f  AD9FFCBC       JSR [0xfcbc]                      
  3c73  3576           PULS  A B X Y U                   
  3c75  39             RTS                               
  3c76  3CE23CC03CB4   addr[3]                           
  3c7c  .db 70 CC 70 F8 00 00 71 24 00 08 00 A5 06 00 00 00  ; p.p...q$........
  3c8c  .db 03 00 01 00 0C 1C 3C CC 00 00 3D 1B 00 00 00 00  ; ......<...=.....

; ---- function FUN_M70_r5_00000__3c9c
FUN_M70_r5_00000__3c9c:
  3c9c  3410           PSHS  X                           
  3c9e  8E3C76         LDX #0x3c76                       
  3ca1  AD9FFC4E       JSR [0xfc4e]                      
  3ca5  3510           PULS  X                           
  3ca7  39             RTS                               

; ---- function FUN_M70_r5_00000__3ca8
FUN_M70_r5_00000__3ca8:
  3ca8  3410           PSHS  X                           
  3caa  8E3C76         LDX #0x3c76                       
  3cad  AD9FFC4C       JSR [0xfc4c]                      
  3cb1  3510           PULS  X                           
  3cb3  39             RTS                               

; ---- function FUN_M70_r5_00000__3cb4
FUN_M70_r5_00000__3cb4:
  3cb4  3410           PSHS  X                           
  3cb6  8E3C76         LDX #0x3c76                       
  3cb9  AD9FFC50       JSR [0xfc50]                      
  3cbd  3510           PULS  X                           
  3cbf  39             RTS                               

; ---- function FUN_M70_r5_00000__3cc0
FUN_M70_r5_00000__3cc0:
  3cc0  3410           PSHS  X                           
  3cc2  8E3C76         LDX #0x3c76                       
  3cc5  AD9FFC52       JSR [0xfc52]                      
  3cc9  3510           PULS  X                           
  3ccb  39             RTS                               
  3ccc  .db 14 70 72 6F 67 72 61 6D 3A 20 20 20 20 20 20 20  ; .program:       
  3cdc  .db 20 20 20 20 20 20                                ;       

; ---- function FUN_M70_r5_00000__3ce2
FUN_M70_r5_00000__3ce2:
  3ce2  3476           PSHS  U Y X B A                   
  3ce4  CC0000         LDD #0x0                          
  3ce7  3606           PSHU  B A                         
  3ce9  CC0003         LDD #0x3                          
  3cec  3606           PSHU  B A                         
  3cee  FC70CC         LDD 0x70cc                        
  3cf1  F370F8         ADDD 0x70f8                       
  3cf4  3606           PSHU  B A                         
  3cf6  AD9FFCD8       JSR [0xfcd8]                      
  3cfa  3706           PULU  A B                         
  3cfc  FD7124         STD 0x7124                        
  3cff  FC7124         LDD 0x7124                        
  3d02  F37124         ADDD 0x7124                       
  3d05  F3600D         ADDD 0x600d                       
  3d08  C33AC4         ADDD #0x3ac4                      
  3d0b  1F01           TFR D,X                           
  3d0d  EC84           LDD ,X                            
  3d0f  F3600D         ADDD 0x600d                       
  3d12  FD715A         STD 0x715a                        
  3d15  FD7128         STD 0x7128                        
  3d18  3576           PULS  A B X Y U                   
  3d1a  39             RTS                               
  3d1b  .db 74 6F 74 61 6C 20 72 61 6E 64 6F 6D 72 61 6E 64  ; total randomrand
  3d2b  .db 6F 6D 20 73 77 65 65 70 72 61 6E 64 6F 6D 20 70  ; om sweeprandom p
  3d3b  .db 69 74 63 68 6A 75 73 74 20 73 74 75 74 74 65 72  ; itchjust stutter

;; End of record chain
END_OF_CHAIN_hdr:
  3d4b  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
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
  3ff3  .db FF FF FF FF FF FF FF FF FF FF FF FF 5C           ; ............\
