; H3500  block M74_r4_04000  M74_r4_04000::0000-M74_r4_04000::3fff
; Bank r4_04000 (module id 74, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 74 parameter/preset table "MULTI-SHIFT", 257 bytes
MODULE_74_TABLE_MULTI_SHIFT_hdr:
  0008  740001090000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_74_TABLE_MULTI_SHIFT:
  0010  74             ?? 74h    t                       
  0011  .db 01                                               ; .
  0012  4D554C54492D.. ds "MULTI-SHIFT    "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0054  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0064  .db 00 00 00 00 00 00 00 00 00 00 64 00 0C FF F4 00  ; ..........d.....
  0074  .db 19 00 19 00 AF 01 5E 00 10 00 10                 ; ......^....
  007f  006400640064.. unicode u"ddddddddd"              
  0094  .db 14 00 07 00 0E 00 14 00 14 00 14 00 14 00 46 00  ; ..............F.
  00a4  .db 46 FF BA 00 46 00 00 00 64 00 00 00 02 00 00 00  ; F...F...d.......
  00b4  .db 02 00 01 00 01 00 01 00 01 00 00 00 00 00 C8 00  ; ................
  00c4  .db C8 02 02 02 02 02 32 00                          ; ......2.
  00cc  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  00f0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13  ; ................
  0100  .db 88 13 88 13 88 00 32 00 32 00 32 00 32 00 01 00  ; ......2.2.2.2...
  0110  .db 01                                               ; .

;; Module 74 code record 01, 11923 bytes, entered at payload start
MODULE_74_01_CODE_hdr:
  0111  74012E9B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_74_01_entry
MODULE_74_01_entry:
  0119  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $011D
  011d  011D           dw 11Dh                           
LAB_M74_r4_04000__011f:
  011f  3477           PSHS  U Y X B A CC                
  0121  1701AF         LBSR 0x02d3                       
  0124  170116         LBSR 0x023d                       
  0127  17018A         LBSR 0x02b4                       
  012a  C600           LDB #0x0                          
  012c  AD9FFC58       JSR [0xfc58]                      
  0130  8603           LDA #0x3                          
  0132  B760DA         STA 0x60da                        
  0135  AD9FFE38       JSR [0xfe38]                      
  0139  170073         LBSR 0x01af                       
  013c  B6600A         LDA 0x600a                        
  013f  8174           CMPA #0x74                        
  0141  270B           BEQ 0x014e                        
  0143  AD9FFED0       JSR [0xfed0]                      
  0147  17008E         LBSR 0x01d8                       
  014a  10260029       LBNE 0x0177                       
LAB_M74_r4_04000__014e:
  014e  17026E         LBSR 0x03bf                       
  0151  170309         LBSR 0x045d                       
  0154  B6600A         LDA 0x600a                        
  0157  8174           CMPA #0x74                        
  0159  2707           BEQ 0x0162                        
  015b  CC4E20         LDD #0x4e20                       
  015e  AD9FFD20       JSR [0xfd20]                      
LAB_M74_r4_04000__0162:
  0162  AD9FFE36       JSR [0xfe36]                      
  0166  AD9FFDF6       JSR [0xfdf6]                      
  016a  AD9FFE18       JSR [0xfe18]                      
  016e  170620         LBSR 0x0791                       
  0171  AD9FFE10       JSR [0xfe10]                      
  0175  2033           BRA 0x01aa                        
LAB_M74_r4_04000__0177:
  0177  C600           LDB #0x0                          
  0179  AD9FFC36       JSR [0xfc36]                      
  017d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0181  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M74_r4_04000__01aa:
  01aa  3577           PULS CC A B X Y U                 
  01ac  39             RTS                               
DAT_M74_r4_04000__01ad:
  01ad  1388           undefined2 1388h                  

; ---- function FUN_M74_r4_04000__01af
FUN_M74_r4_04000__01af:
  01af  3476           PSHS  U Y X B A                   
  01b1  1A40           ORCC #0x40                        
  01b3  3440           PSHS  U                           
  01b5  CC2E07         LDD #0x2e07                       
  01b8  F3600D         ADDD 0x600d                       
  01bb  1F01           TFR D,X                           
  01bd  CC2E36         LDD #0x2e36                       
  01c0  F3600D         ADDD 0x600d                       
  01c3  1F03           TFR D,U                           
  01c5  108E6600       LDY #0x6600                       
  01c9  AD9FFD08       JSR [0xfd08]                      
  01cd  3540           PULS  U                           
  01cf  AD9FFD76       JSR [0xfd76]                      
  01d3  1CBF           ANDCC #0xbf                       
  01d5  3576           PULS  A B X Y U                   
  01d7  39             RTS                               

; ---- function FUN_M74_r4_04000__01d8
FUN_M74_r4_04000__01d8:
  01d8  3476           PSHS  U Y X B A                   
  01da  C601           LDB #0x1                          
  01dc  8E7410         LDX #0x7410                       
  01df  AD9FFD30       JSR [0xfd30]                      
  01e3  10260050       LBNE 0x0237                       
  01e7  C602           LDB #0x2                          
  01e9  8E7411         LDX #0x7411                       
  01ec  AD9FFD30       JSR [0xfd30]                      
  01f0  10260043       LBNE 0x0237                       
  01f4  C603           LDB #0x3                          
  01f6  8E7412         LDX #0x7412                       
  01f9  AD9FFD30       JSR [0xfd30]                      
  01fd  10260036       LBNE 0x0237                       
  0201  CC0000         LDD #0x0                          
  0204  AD9FFD3C       JSR [0xfd3c]                      
  0208  AD9FFD40       JSR [0xfd40]                      
  020c  AD9FFD44       JSR [0xfd44]                      
  0210  FD7034         STD 0x7034                        
  0213  FD7036         STD 0x7036                        
  0216  FD7106         STD 0x7106                        
  0219  FD710A         STD 0x710a                        
  021c  CC000A         LDD #0xa                          
  021f  AD9FFD20       JSR [0xfd20]                      
  0223  108E0000       LDY #0x0                          
  0227  FC7164         LDD 0x7164                        
  022a  AD9FFD2E       JSR [0xfd2e]                      
  022e  AD9FFD7C       JSR [0xfd7c]                      
  0232  CC0000         LDD #0x0                          
  0235  2003           BRA 0x023a                        
LAB_M74_r4_04000__0237:
  0237  CCFFFF         LDD #0xffff                       
LAB_M74_r4_04000__023a:
  023a  3576           PULS  A B X Y U                   
  023c  39             RTS                               

; ---- function FUN_M74_r4_04000__023d
FUN_M74_r4_04000__023d:
  023d  3406           PSHS  B A                         
  023f  CC0000         LDD #0x0                          
  0242  FD70C8         STD 0x70c8                        
  0245  FD7104         STD 0x7104                        
  0248  FD7108         STD 0x7108                        
  024b  FD70D4         STD 0x70d4                        
  024e  FD70D8         STD 0x70d8                        
  0251  FD70DC         STD 0x70dc                        
  0254  FD70E0         STD 0x70e0                        
  0257  FD70E8         STD 0x70e8                        
  025a  FD70EC         STD 0x70ec                        
  025d  FD710C         STD 0x710c                        
  0260  FD710E         STD 0x710e                        
  0263  FD7110         STD 0x7110                        
  0266  FD7112         STD 0x7112                        
  0269  FD70C2         STD 0x70c2                        
  026c  FD7114         STD 0x7114                        
  026f  FD7116         STD 0x7116                        
  0272  FD7118         STD 0x7118                        
  0275  FD711A         STD 0x711a                        
  0278  FD70F0         STD 0x70f0                        
  027b  FD70F4         STD 0x70f4                        
  027e  FD70F8         STD 0x70f8                        
  0281  FD70FC         STD 0x70fc                        
  0284  FD7100         STD 0x7100                        
  0287  FD7154         STD 0x7154                        
  028a  FD715C         STD 0x715c                        
  028d  FD7158         STD 0x7158                        
  0290  FD7160         STD 0x7160                        
  0293  FD712C         STD 0x712c                        
  0296  FD7134         STD 0x7134                        
  0299  FD7130         STD 0x7130                        
  029c  FD7138         STD 0x7138                        
  029f  FD713C         STD 0x713c                        
  02a2  FD7140         STD 0x7140                        
  02a5  FD7144         STD 0x7144                        
  02a8  FD7148         STD 0x7148                        
  02ab  FD714C         STD 0x714c                        
  02ae  FD7150         STD 0x7150                        
  02b1  3506           PULS  A B                         
  02b3  39             RTS                               

; ---- function FUN_M74_r4_04000__02b4
FUN_M74_r4_04000__02b4:
  02b4  3476           PSHS  U Y X B A                   
  02b6  CC0000         LDD #0x0                          
  02b9  AD9FFC6C       JSR [0xfc6c]                      
  02bd  AD9FFC74       JSR [0xfc74]                      
  02c1  1727FB         LBSR 0x2abf                       
  02c4  172873         LBSR 0x2b3a                       
  02c7  1728EB         LBSR 0x2bb5                       
  02ca  172963         LBSR 0x2c30                       
  02cd  172755         LBSR 0x2a25                       
  02d0  3576           PULS  A B X Y U                   
  02d2  39             RTS                               

; ---- function FUN_M74_r4_04000__02d3
FUN_M74_r4_04000__02d3:
  02d3  3476           PSHS  U Y X B A                   
  02d5  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 67:A6 69:AA 73:20 75:24 65:00
  02d9  67             db 67h                            
  02da  A6             db A6h                            
  02db  69             db 69h                            
  02dc  AA             db AAh                            
  02dd  73             db 73h                            
  02de  20             db 20h                            
  02df  75             db 75h                            
  02e0  24             db 24h                            
  02e1  65             db 65h                            
  02e2  00             db 0h                             
  02e3  00             db 0h                             
LAB_M74_r4_04000__02e4:
  02e4  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 6F:18 71:1C 81:1A 83:1E 6B:10 6D:14 7D:12 7F:16
  02e8  6F             db 6Fh                            
  02e9  18             db 18h                            
  02ea  71             db 71h                            
  02eb  1C             db 1Ch                            
  02ec  81             db 81h                            
  02ed  1A             db 1Ah                            
  02ee  83             db 83h                            
  02ef  1E             db 1Eh                            
  02f0  6B             db 6Bh                            
  02f1  10             db 10h                            
  02f2  6D             db 6Dh                            
  02f3  14             db 14h                            
  02f4  7D             db 7Dh                            
  02f5  12             db 12h                            
  02f6  7F             db 7Fh                            
  02f7  16             db 16h                            
  02f8  00             db 0h                             
LAB_M74_r4_04000__02f9:
  02f9  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 79:A8 7B:AC 85:22 87:26 77:02
  02fd  79             db 79h                            
  02fe  A8             db A8h                            
  02ff  7B             db 7Bh                            
  0300  AC             db ACh                            
  0301  85             db 85h                            
  0302  22             db 22h                            
  0303  87             db 87h                            
  0304  26             db 26h                            
  0305  77             db 77h                            
  0306  02             db 2h                             
  0307  00             db 0h                             
LAB_M74_r4_04000__0308:
  0308  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:58 1A:54 1B:56 1C:52
  030c  19             db 19h                            
  030d  58             db 58h                            
  030e  1A             db 1Ah                            
  030f  54             db 54h                            
  0310  1B             db 1Bh                            
  0311  56             db 56h                            
  0312  1C             db 1Ch                            
  0313  52             db 52h                            
  0314  00             db 0h                             
LAB_M74_r4_04000__0315:
  0315  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 99:42 9B:46 9D:4A 9F:4E
  0319  99             db 99h                            
  031a  42             db 42h                            
  031b  9B             db 9Bh                            
  031c  46             db 46h                            
  031d  9D             db 9Dh                            
  031e  4A             db 4Ah                            
  031f  9F             db 9Fh                            
  0320  4E             db 4Eh                            
  0321  00             db 0h                             
LAB_M74_r4_04000__0322:
  0322  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A1:38 A3:3A B9:3E BB:40
  0326  A1             db A1h                            
  0327  38             db 38h                            
  0328  A3             db A3h                            
  0329  3A             db 3Ah                            
  032a  B9             db B9h                            
  032b  3E             db 3Eh                            
  032c  BB             db BBh                            
  032d  40             db 40h                            
  032e  00             db 0h                             
LAB_M74_r4_04000__032f:
  032f  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A5:76 A9:7E A7:7A AB:82
  0333  A5             db A5h                            
  0334  76             db 76h                            
  0335  A9             db A9h                            
  0336  7E             db 7Eh                            
  0337  A7             db A7h                            
  0338  7A             db 7Ah                            
  0339  AB             db ABh                            
  033a  82             db 82h                            
  033b  00             db 0h                             
LAB_M74_r4_04000__033c:
  033c  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: AD:72 AF:6E B1:6A B3:62 B5:60 B7:5E
  0340  AD             db ADh                            
  0341  72             db 72h                            
  0342  AF             db AFh                            
  0343  6E             db 6Eh                            
  0344  B1             db B1h                            
  0345  6A             db 6Ah                            
  0346  B3             db B3h                            
  0347  62             db 62h                            
  0348  B5             db B5h                            
  0349  60             db 60h                            
  034a  B7             db B7h                            
  034b  5E             db 5Eh                            
  034c  00             db 0h                             
LAB_M74_r4_04000__034d:
  034d  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 89:86 8B:88 8D:8A 8F:8C 91:8E 93:90 95:92 97:94
  0351  89             db 89h                            
  0352  86             db 86h                            
  0353  8B             db 8Bh                            
  0354  88             db 88h                            
  0355  8D             db 8Dh                            
  0356  8A             db 8Ah                            
  0357  8F             db 8Fh                            
  0358  8C             db 8Ch                            
  0359  91             db 91h                            
  035a  8E             db 8Eh                            
  035b  93             db 93h                            
  035c  90             db 90h                            
  035d  95             db 95h                            
  035e  92             db 92h                            
  035f  97             db 97h                            
  0360  94             db 94h                            
  0361  00             db 0h                             
LAB_M74_r4_04000__0362:
  0362  CC0105         LDD #0x105                        
  0365  830008         SUBD #0x8                         
  0368  1F01           TFR D,X                           
  036a  AD9FFC7E       JSR [0xfc7e]                      
  036e  FD7096         STD 0x7096                        
  0371  CC0107         LDD #0x107                        
  0374  830008         SUBD #0x8                         
  0377  1F01           TFR D,X                           
  0379  AD9FFC7E       JSR [0xfc7e]                      
  037d  FD7098         STD 0x7098                        
  0380  CC0109         LDD #0x109                        
  0383  830008         SUBD #0x8                         
  0386  1F01           TFR D,X                           
  0388  AD9FFC7E       JSR [0xfc7e]                      
  038c  FD709A         STD 0x709a                        
  038f  CC010B         LDD #0x10b                        
  0392  830008         SUBD #0x8                         
  0395  1F01           TFR D,X                           
  0397  AD9FFC7E       JSR [0xfc7e]                      
  039b  FD709C         STD 0x709c                        
  039e  CC010D         LDD #0x10d                        
  03a1  830008         SUBD #0x8                         
  03a4  1F01           TFR D,X                           
  03a6  AD9FFC7E       JSR [0xfc7e]                      
  03aa  FD7066         STD 0x7066                        
  03ad  CC010F         LDD #0x10f                        
  03b0  830008         SUBD #0x8                         
  03b3  1F01           TFR D,X                           
  03b5  AD9FFC7E       JSR [0xfc7e]                      
  03b9  FD7064         STD 0x7064                        
  03bc  3576           PULS  A B X Y U                   
  03be  39             RTS                               

; ---- function FUN_M74_r4_04000__03bf
FUN_M74_r4_04000__03bf:
  03bf  3476           PSHS  U Y X B A                   
  03c1  CC0000         LDD #0x0                          
  03c4  FD716E         STD 0x716e                        
  03c7  FD7170         STD 0x7170                        
  03ca  8E136A         LDX #0x136a                       
  03cd  AD9FFE76       JSR [0xfe76]                      
  03d1  8E145B         LDX #0x145b                       
  03d4  AD9FFE76       JSR [0xfe76]                      
  03d8  8E151C         LDX #0x151c                       
  03db  AD9FFE76       JSR [0xfe76]                      
  03df  8E1619         LDX #0x1619                       
  03e2  AD9FFE76       JSR [0xfe76]                      
  03e6  CC233E         LDD #0x233e                       
  03e9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6095
  03ed  6095           addr 6095                         
LAB_M74_r4_04000__03ef:
  03ef  CC2493         LDD #0x2493                       
  03f2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  03f6  6097           addr 6097                         
LAB_M74_r4_04000__03f8:
  03f8  17218D         LBSR 0x2588                       
  03fb  1722BF         LBSR 0x26bd                       
  03fe  170E5F         LBSR 0x1260                       
  0401  170F54         LBSR 0x1358                       
  0404  171D2A         LBSR 0x2131                       
  0407  171DD6         LBSR 0x21e0                       
  040a  CC000A         LDD #0xa                          
  040d  AD9FFD20       JSR [0xfd20]                      
  0411  108E0448       LDY #0x448                        
  0415  FC70B6         LDD 0x70b6                        
  0418  AD9FFD2E       JSR [0xfd2e]                      
  041c  CC000A         LDD #0xa                          
  041f  AD9FFD20       JSR [0xfd20]                      
  0423  108E0449       LDY #0x449                        
  0427  FC70BA         LDD 0x70ba                        
  042a  AD9FFD2E       JSR [0xfd2e]                      
  042e  FC70B6         LDD 0x70b6                        
  0431  AD9FFD3C       JSR [0xfd3c]                      
  0435  FC70BA         LDD 0x70ba                        
  0438  AD9FFD44       JSR [0xfd44]                      
  043c  17134D         LBSR 0x178c                       
  043f  171594         LBSR 0x19d6                       
  0442  1714B8         LBSR 0x18fd                       
  0445  171667         LBSR 0x1aaf                       
  0448  17170E         LBSR 0x1b59                       
  044b  171812         LBSR 0x1c60                       
  044e  170663         LBSR 0x0ab4                       
  0451  1706EE         LBSR 0x0b42                       
  0454  170779         LBSR 0x0bd0                       
  0457  170804         LBSR 0x0c5e                       
  045a  3576           PULS  A B X Y U                   
  045c  39             RTS                               

; ---- function FUN_M74_r4_04000__045d
FUN_M74_r4_04000__045d:
  045d  3476           PSHS  U Y X B A                   
  045f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l pitch " 21 $1D45 $1D51
  0463  00             db 0h                             
  0464  80             db 80h                            
  0465  6C2070697463.. ds "l pitch "                     
  046d  21             db 21h                            
  046e  1D45           addr M74_r4_04000::1d45           
  0470  1D51           addr M74_r4_04000::1d51           
LAB_M74_r4_04000__0472:
  0472  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r pitch " 25 $1F59 $1F65
  0476  01             db 1h                             
  0477  80             db 80h                            
  0478  722070697463.. ds "r pitch "                     
  0480  25             db 25h                            
  0481  1F59           addr M74_r4_04000::1f59           
  0483  1F65           addr M74_r4_04000::1f65           
LAB_M74_r4_04000__0485:
  0485  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l pdelay" 29 $2262 $226E
  0489  02             db 2h                             
  048a  80             db 80h                            
  048b  6C207064656C.. ds "l pdelay"                     
  0493  29             db 29h                            
  0494  2262           addr M74_r4_04000::2262           
  0496  226E           addr M74_r4_04000::226e           
LAB_M74_r4_04000__0498:
  0498  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r pdelay" 2D $23B7 $23C3
  049c  03             db 3h                             
  049d  80             db 80h                            
  049e  72207064656C.. ds "r pdelay"                     
  04a6  2D             db 2Dh                            
  04a7  23B7           addr M74_r4_04000::23b7           
  04a9  23C3           addr M74_r4_04000::23c3           
LAB_M74_r4_04000__04ab:
  04ab  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "l delay " 31 $2104 $2110
  04af  04             db 4h                             
  04b0  80             db 80h                            
  04b1  6C2064656C61.. ds "l delay "                     
  04b9  31             db 31h                            
  04ba  2104           addr M74_r4_04000::2104           
  04bc  2110           addr M74_r4_04000::2110           
LAB_M74_r4_04000__04be:
  04be  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "r delay " 35 $21B3 $21BF
  04c2  05             db 5h                             
  04c3  80             db 80h                            
  04c4  722064656C61.. ds "r delay "                     
  04cc  35             db 35h                            
  04cd  21B3           addr M74_r4_04000::21b3           
  04cf  21BF           addr M74_r4_04000::21bf           
LAB_M74_r4_04000__04d1:
  04d1  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 " image  " 39 $1BED $1BF9
  04d5  06             db 6h                             
  04d6  80             db 80h                            
  04d7  20696D616765.. ds " image  "                     
  04df  39             db 39h                            
  04e0  1BED           addr M74_r4_04000::1bed           
  04e2  1BF9           addr M74_r4_04000::1bf9           
LAB_M74_r4_04000__04e4:
  04e4  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "feedback" 3D $1B2C $1B38
  04e8  07             db 7h                             
  04e9  80             db 80h                            
  04ea  666565646261.. ds "feedback"                     
  04f2  3D             db 3Dh                            
  04f3  1B2C           addr M74_r4_04000::1b2c           
  04f5  1B38           addr M74_r4_04000::1b38           
LAB_M74_r4_04000__04f7:
  04f7  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 "  pan1  " 41 $0A8B $0A97
  04fb  08             db 8h                             
  04fc  80             db 80h                            
  04fd  202070616E31.. ds "  pan1  "                     
  0505  41             db 41h                            
  0506  0A8B           addr M74_r4_04000::0a8b           
  0508  0A97           addr M74_r4_04000::0a97           
LAB_M74_r4_04000__050a:
  050a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 "  pan2  " 45 $0B19 $0B25
  050e  09             db 9h                             
  050f  80             db 80h                            
  0510  202070616E32.. ds "  pan2  "                     
  0518  45             db 45h                            
  0519  0B19           addr M74_r4_04000::0b19           
  051b  0B25           addr M74_r4_04000::0b25           
LAB_M74_r4_04000__051d:
  051d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "  pan3  " 49 $0BA7 $0BB3
  0521  0A             db Ah                             
  0522  80             db 80h                            
  0523  202070616E33.. ds "  pan3  "                     
  052b  49             db 49h                            
  052c  0BA7           addr M74_r4_04000::0ba7           
  052e  0BB3           addr M74_r4_04000::0bb3           
LAB_M74_r4_04000__0530:
  0530  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 "  pan4  " 4D $0C35 $0C41
  0534  0B             db Bh                             
  0535  80             db 80h                            
  0536  202070616E34.. ds "  pan4  "                     
  053e  4D             db 4Dh                            
  053f  0C35           addr M74_r4_04000::0c35           
  0541  0C41           addr M74_r4_04000::0c41           
LAB_M74_r4_04000__0543:
  0543  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0C 80 "l splice" 51 $2525 $2531
  0547  0C             db Ch                             
  0548  80             db 80h                            
  0549  6C2073706C69.. ds "l splice"                     
  0551  51             db 51h                            
  0552  2525           addr M74_r4_04000::2525           
  0554  2531           addr M74_r4_04000::2531           
LAB_M74_r4_04000__0556:
  0556  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0D 80 "r splice" 55 $265C $2668
  055a  0D             db Dh                             
  055b  80             db 80h                            
  055c  722073706C69.. ds "r splice"                     
  0564  55             db 55h                            
  0565  265C           addr M74_r4_04000::265c           
  0567  2668           addr M74_r4_04000::2668           
LAB_M74_r4_04000__0569:
  0569  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0E 80 "  mix   " 59 $29F8 $2A04
  056d  0E             db Eh                             
  056e  80             db 80h                            
  056f  20206D697820.. ds "  mix   "                     
  0577  59             db 59h                            
  0578  29F8           addr M74_r4_04000::29f8           
  057a  2A04           addr M74_r4_04000::2a04           
LAB_M74_r4_04000__057c:
  057c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0F 80 " l dir  " 5D $158F $15AD
  0580  0F             db Fh                             
  0581  80             db 80h                            
  0582  206C20646972.. ds " l dir  "                     
  058a  5D             db 5Dh                            
  058b  158F           addr M74_r4_04000::158f           
  058d  15AD           addr M74_r4_04000::15ad           
LAB_M74_r4_04000__058f:
  058f  CC05AB         LDD #0x5ab                        
  0592  FD60F5         STD 0x60f5                        
  0595  CC004A         LDD #0x4a                         
  0598  47             ASRA                              
  0599  56             RORB                              
  059a  FD60F7         STD 0x60f7                        
  059d  8601           LDA #0x1                          
  059f  B76105         STA 0x6105                        
  05a2  CC00BD         LDD #0xbd                         
  05a5  FD6106         STD 0x6106                        
  05a8  3576           PULS  A B X Y U                   
  05aa  39             RTS                               
  05ab  05F50600060B.. addr[37]                          

; ---- function FUN_M74_r4_04000__05f5
FUN_M74_r4_04000__05f5:
  05f5  171729         LBSR 0x1d21                       
  05f8  170196         LBSR 0x0791                       
  05fb  AD9FFE10       JSR [0xfe10]                      
  05ff  39             RTS                               

; ---- function FUN_M74_r4_04000__0600
FUN_M74_r4_04000__0600:
  0600  171C3B         LBSR 0x223e                       
  0603  17018B         LBSR 0x0791                       
  0606  AD9FFE12       JSR [0xfe12]                      
  060a  39             RTS                               

; ---- function FUN_M74_r4_04000__060b
FUN_M74_r4_04000__060b:
  060b  171AD2         LBSR 0x20e0                       
  060e  170180         LBSR 0x0791                       
  0611  AD9FFE14       JSR [0xfe14]                      
  0615  39             RTS                               

; ---- function FUN_M74_r4_04000__0616
FUN_M74_r4_04000__0616:
  0616  17191C         LBSR 0x1f35                       
  0619  1701AE         LBSR 0x07ca                       
  061c  AD9FFE10       JSR [0xfe10]                      
  0620  39             RTS                               

; ---- function FUN_M74_r4_04000__0621
FUN_M74_r4_04000__0621:
  0621  171D6F         LBSR 0x2393                       
  0624  1701A3         LBSR 0x07ca                       
  0627  AD9FFE12       JSR [0xfe12]                      
  062b  39             RTS                               

; ---- function FUN_M74_r4_04000__062c
FUN_M74_r4_04000__062c:
  062c  171B60         LBSR 0x218f                       
  062f  170198         LBSR 0x07ca                       
  0632  AD9FFE14       JSR [0xfe14]                      
  0636  39             RTS                               

; ---- function FUN_M74_r4_04000__0637
FUN_M74_r4_04000__0637:
  0637  17239A         LBSR 0x29d4                       
  063a  170154         LBSR 0x0791                       
  063d  AD9FFE16       JSR [0xfe16]                      
  0641  39             RTS                               

; ---- function FUN_M74_r4_04000__0642
FUN_M74_r4_04000__0642:
  0642  1714C3         LBSR 0x1b08                       
  0645  1701BB         LBSR 0x0803                       
  0648  AD9FFE10       JSR [0xfe10]                      
  064c  39             RTS                               

; ---- function FUN_M74_r4_04000__064d
FUN_M74_r4_04000__064d:
  064d  171579         LBSR 0x1bc9                       
  0650  1701B0         LBSR 0x0803                       
  0653  AD9FFE12       JSR [0xfe12]                      
  0657  39             RTS                               

; ---- function FUN_M74_r4_04000__0658
FUN_M74_r4_04000__0658:
  0658  17242B         LBSR 0x2a86                       
  065b  1701DE         LBSR 0x083c                       
  065e  AD9FFE10       JSR [0xfe10]                      
  0662  39             RTS                               

; ---- function FUN_M74_r4_04000__0663
FUN_M74_r4_04000__0663:
  0663  17249B         LBSR 0x2b01                       
  0666  1701D3         LBSR 0x083c                       
  0669  AD9FFE12       JSR [0xfe12]                      
  066d  39             RTS                               

; ---- function FUN_M74_r4_04000__066e
FUN_M74_r4_04000__066e:
  066e  17250B         LBSR 0x2b7c                       
  0671  1701C8         LBSR 0x083c                       
  0674  AD9FFE14       JSR [0xfe14]                      
  0678  39             RTS                               

; ---- function FUN_M74_r4_04000__0679
FUN_M74_r4_04000__0679:
  0679  17257B         LBSR 0x2bf7                       
  067c  1701BD         LBSR 0x083c                       
  067f  AD9FFE16       JSR [0xfe16]                      
  0683  39             RTS                               

; ---- function FUN_M74_r4_04000__0684
FUN_M74_r4_04000__0684:
  0684  1707D1         LBSR 0x0e58                       
  0687  170224         LBSR 0x08ae                       
  068a  AD9FFE10       JSR [0xfe10]                      
  068e  39             RTS                               

; ---- function FUN_M74_r4_04000__068f
FUN_M74_r4_04000__068f:
  068f  1708A8         LBSR 0x0f3a                       
  0692  170219         LBSR 0x08ae                       
  0695  AD9FFE12       JSR [0xfe12]                      
  0699  39             RTS                               

; ---- function FUN_M74_r4_04000__069a
FUN_M74_r4_04000__069a:
  069a  17097F         LBSR 0x101c                       
  069d  17020E         LBSR 0x08ae                       
  06a0  AD9FFE14       JSR [0xfe14]                      
  06a4  39             RTS                               

; ---- function FUN_M74_r4_04000__06a5
FUN_M74_r4_04000__06a5:
  06a5  170A56         LBSR 0x10fe                       
  06a8  170203         LBSR 0x08ae                       
  06ab  AD9FFE16       JSR [0xfe16]                      
  06af  39             RTS                               

; ---- function FUN_M74_r4_04000__06b0
FUN_M74_r4_04000__06b0:
  06b0  1703B4         LBSR 0x0a67                       
  06b3  170231         LBSR 0x08e7                       
  06b6  AD9FFE10       JSR [0xfe10]                      
  06ba  39             RTS                               

; ---- function FUN_M74_r4_04000__06bb
FUN_M74_r4_04000__06bb:
  06bb  170437         LBSR 0x0af5                       
  06be  170226         LBSR 0x08e7                       
  06c1  AD9FFE12       JSR [0xfe12]                      
  06c5  39             RTS                               

; ---- function FUN_M74_r4_04000__06c6
FUN_M74_r4_04000__06c6:
  06c6  1704BA         LBSR 0x0b83                       
  06c9  17021B         LBSR 0x08e7                       
  06cc  AD9FFE14       JSR [0xfe14]                      
  06d0  39             RTS                               

; ---- function FUN_M74_r4_04000__06d1
FUN_M74_r4_04000__06d1:
  06d1  17053D         LBSR 0x0c11                       
  06d4  170210         LBSR 0x08e7                       
  06d7  AD9FFE16       JSR [0xfe16]                      
  06db  39             RTS                               

; ---- function FUN_M74_r4_04000__06dc
FUN_M74_r4_04000__06dc:
  06dc  172075         LBSR 0x2754                       
  06df  170262         LBSR 0x0944                       
  06e2  AD9FFE10       JSR [0xfe10]                      
  06e6  39             RTS                               

; ---- function FUN_M74_r4_04000__06e7
FUN_M74_r4_04000__06e7:
  06e7  17210A         LBSR 0x27f4                       
  06ea  170257         LBSR 0x0944                       
  06ed  AD9FFE12       JSR [0xfe12]                      
  06f1  39             RTS                               

; ---- function FUN_M74_r4_04000__06f2
FUN_M74_r4_04000__06f2:
  06f2  171025         LBSR 0x171a                       
  06f5  17024C         LBSR 0x0944                       
  06f8  AD9FFDEC       JSR [0xfdec]                      
  06fc  39             RTS                               

; ---- function FUN_M74_r4_04000__06fd
FUN_M74_r4_04000__06fd:
  06fd  17118B         LBSR 0x188b                       
  0700  170241         LBSR 0x0944                       
  0703  AD9FFDEE       JSR [0xfdee]                      
  0707  39             RTS                               

; ---- function FUN_M74_r4_04000__0708
FUN_M74_r4_04000__0708:
  0708  172189         LBSR 0x2894                       
  070b  17026B         LBSR 0x0979                       
  070e  AD9FFE10       JSR [0xfe10]                      
  0712  39             RTS                               

; ---- function FUN_M74_r4_04000__0713
FUN_M74_r4_04000__0713:
  0713  17221E         LBSR 0x2934                       
  0716  170260         LBSR 0x0979                       
  0719  AD9FFE12       JSR [0xfe12]                      
  071d  39             RTS                               

; ---- function FUN_M74_r4_04000__071e
FUN_M74_r4_04000__071e:
  071e  171243         LBSR 0x1964                       
  0721  170255         LBSR 0x0979                       
  0724  AD9FFDEC       JSR [0xfdec]                      
  0728  39             RTS                               

; ---- function FUN_M74_r4_04000__0729
FUN_M74_r4_04000__0729:
  0729  171311         LBSR 0x1a3d                       
  072c  17024A         LBSR 0x0979                       
  072f  AD9FFDEE       JSR [0xfdee]                      
  0733  39             RTS                               

; ---- function FUN_M74_r4_04000__0734
FUN_M74_r4_04000__0734:
  0734  170E25         LBSR 0x155c                       
  0737  170298         LBSR 0x09d2                       
  073a  AD9FFDE8       JSR [0xfde8]                      
  073e  39             RTS                               

; ---- function FUN_M74_r4_04000__073f
FUN_M74_r4_04000__073f:
  073f  170C68         LBSR 0x13aa                       
  0742  17028D         LBSR 0x09d2                       
  0745  AD9FFDEA       JSR [0xfdea]                      
  0749  39             RTS                               

; ---- function FUN_M74_r4_04000__074a
FUN_M74_r4_04000__074a:
  074a  170AA1         LBSR 0x11ee                       
  074d  170282         LBSR 0x09d2                       
  0750  AD9FFDEC       JSR [0xfdec]                      
  0754  39             RTS                               

; ---- function FUN_M74_r4_04000__0755
FUN_M74_r4_04000__0755:
  0755  171DA9         LBSR 0x2501                       
  0758  170277         LBSR 0x09d2                       
  075b  AD9FFE16       JSR [0xfe16]                      
  075f  39             RTS                               

; ---- function FUN_M74_r4_04000__0760
FUN_M74_r4_04000__0760:
  0760  170EF6         LBSR 0x1659                       
  0763  17029D         LBSR 0x0a03                       
  0766  AD9FFDE8       JSR [0xfde8]                      
  076a  39             RTS                               

; ---- function FUN_M74_r4_04000__076b
FUN_M74_r4_04000__076b:
  076b  170D2D         LBSR 0x149b                       
  076e  170292         LBSR 0x0a03                       
  0771  AD9FFDEA       JSR [0xfdea]                      
  0775  39             RTS                               

; ---- function FUN_M74_r4_04000__0776
FUN_M74_r4_04000__0776:
  0776  170B6D         LBSR 0x12e6                       
  0779  170287         LBSR 0x0a03                       
  077c  AD9FFDEC       JSR [0xfdec]                      
  0780  39             RTS                               

; ---- function FUN_M74_r4_04000__0781
FUN_M74_r4_04000__0781:
  0781  171EB4         LBSR 0x2638                       
  0784  17027C         LBSR 0x0a03                       
  0787  AD9FFE16       JSR [0xfe16]                      
  078b  39             RTS                               

; ---- function FUN_M74_r4_04000__078c
FUN_M74_r4_04000__078c:
  078c  AD9FFDFC       JSR [0xfdfc]                      
  0790  39             RTS                               

; ---- function FUN_M74_r4_04000__0791
FUN_M74_r4_04000__0791:
  0791  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l coarse" "l pdelay" "l delay " "  mix   "
  0795  6C20636F6172.. ds "l coarse"                     
  079d  6C207064656C.. ds "l pdelay"                     
  07a5  6C2064656C61.. ds "l delay "                     
  07ad  20206D697820.. ds "  mix   "                     
LAB_M74_r4_04000__07b5:
  07b5  AD9FFDF2       JSR [0xfdf2]                      
  07b9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1C86 ->$2232 ->$20D4 ->$29C8 ->$07CA ->$0803
  07bd  1C86           addr M74_r4_04000::1c86           
  07bf  2232           addr M74_r4_04000::2232           
  07c1  20D4           addr M74_r4_04000::20d4           
  07c3  29C8           addr M74_r4_04000::29c8           
  07c5  07CA           addr M74_r4_04000::07ca           
  07c7  0803           addr M74_r4_04000::0803           
LAB_M74_r4_04000__07c9:
  07c9  39             RTS                               

; ---- function FUN_M74_r4_04000__07ca
FUN_M74_r4_04000__07ca:
  07ca  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r coarse" "r pdelay" "r delay " "  mix   "
  07ce  7220636F6172.. ds "r coarse"                     
  07d6  72207064656C.. ds "r pdelay"                     
  07de  722064656C61.. ds "r delay "                     
  07e6  20206D697820.. ds "  mix   "                     
LAB_M74_r4_04000__07ee:
  07ee  AD9FFDF2       JSR [0xfdf2]                      
  07f2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1E9A ->$2387 ->$2183 ->$29C8 ->$0803 ->$0791
  07f6  1E9A           addr M74_r4_04000::1e9a           
  07f8  2387           addr M74_r4_04000::2387           
  07fa  2183           addr M74_r4_04000::2183           
  07fc  29C8           addr M74_r4_04000::29c8           
  07fe  0803           addr M74_r4_04000::0803           
  0800  0791           addr M74_r4_04000::0791           
LAB_M74_r4_04000__0802:
  0802  39             RTS                               

; ---- function FUN_M74_r4_04000__0803
FUN_M74_r4_04000__0803:
  0803  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "feedback" " image  " " levels " " expert "
  0807  666565646261.. ds "feedback"                     
  080f  20696D616765.. ds " image  "                     
  0817  206C6576656C.. ds " levels "                     
  081f  206578706572.. ds " expert "                     
LAB_M74_r4_04000__0827:
  0827  AD9FFDF2       JSR [0xfdf2]                      
  082b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1AFC ->$1BD5 ->$083C ->$0875 ->$0791 ->$07CA
  082f  1AFC           addr M74_r4_04000::1afc           
  0831  1BD5           addr M74_r4_04000::1bd5           
  0833  083C           addr M74_r4_04000::083c           
  0835  0875           addr M74_r4_04000::0875           
  0837  0791           addr M74_r4_04000::0791           
  0839  07CA           addr M74_r4_04000::07ca           
LAB_M74_r4_04000__083b:
  083b  39             RTS                               

; ---- function FUN_M74_r4_04000__083c
FUN_M74_r4_04000__083c:
  083c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" "left out" "rightout"
  0840  6C6566742069.. ds "left in "                     
  0848  726967687420.. ds "right in"                     
  0850  6C656674206F.. ds "left out"                     
  0858  72696768746F.. ds "rightout"                     
LAB_M74_r4_04000__0860:
  0860  AD9FFDF2       JSR [0xfdf2]                      
  0864  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2A7A ->$2AF5 ->$2B70 ->$2BEB ->$0803 ->$0803
  0868  2A7A           addr M74_r4_04000::2a7a           
  086a  2AF5           addr M74_r4_04000::2af5           
  086c  2B70           addr M74_r4_04000::2b70           
  086e  2BEB           addr M74_r4_04000::2beb           
  0870  0803           addr M74_r4_04000::0803           
  0872  0803           addr M74_r4_04000::0803           
LAB_M74_r4_04000__0874:
  0874  39             RTS                               

; ---- function FUN_M74_r4_04000__0875
FUN_M74_r4_04000__0875:
  0875  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "outputs " "patching" "lcontrol" "rcontrol"
  0879  6F7574707574.. ds "outputs "                     
  0881  706174636869.. ds "patching"                     
  0889  6C636F6E7472.. ds "lcontrol"                     
  0891  72636F6E7472.. ds "rcontrol"                     
LAB_M74_r4_04000__0899:
  0899  AD9FFDF2       JSR [0xfdf2]                      
  089d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$08AE ->$0944 ->$09D2 ->$0A03 ->$0803 ->$0803
  08a1  08AE           addr M74_r4_04000::08ae           
  08a3  0944           addr M74_r4_04000::0944           
  08a5  09D2           addr M74_r4_04000::09d2           
  08a7  0A03           addr M74_r4_04000::0a03           
  08a9  0803           addr M74_r4_04000::0803           
  08ab  0803           addr M74_r4_04000::0803           
LAB_M74_r4_04000__08ad:
  08ad  39             RTS                               

; ---- function FUN_M74_r4_04000__08ae
FUN_M74_r4_04000__08ae:
  08ae  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l pitlev" "r pitlev" "l dellev" "r dellev"
  08b2  6C207069746C.. ds "l pitlev"                     
  08ba  72207069746C.. ds "r pitlev"                     
  08c2  6C2064656C6C.. ds "l dellev"                     
  08ca  722064656C6C.. ds "r dellev"                     
LAB_M74_r4_04000__08d2:
  08d2  AD9FFDF2       JSR [0xfdf2]                      
  08d6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0E4C ->$0F2E ->$1010 ->$10F2 ->$08E7 ->$0920
  08da  0E4C           addr M74_r4_04000::0e4c           
  08dc  0F2E           addr M74_r4_04000::0f2e           
  08de  1010           addr M74_r4_04000::1010           
  08e0  10F2           addr M74_r4_04000::10f2           
  08e2  08E7           addr M74_r4_04000::08e7           
  08e4  0920           addr M74_r4_04000::0920           
LAB_M74_r4_04000__08e6:
  08e6  39             RTS                               

; ---- function FUN_M74_r4_04000__08e7
FUN_M74_r4_04000__08e7:
  08e7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l pitpan" "r ritpan" "l delpan" "r delpan"
  08eb  6C2070697470.. ds "l pitpan"                     
  08f3  722072697470.. ds "r ritpan"                     
  08fb  6C2064656C70.. ds "l delpan"                     
  0903  722064656C70.. ds "r delpan"                     
LAB_M74_r4_04000__090b:
  090b  AD9FFDF2       JSR [0xfdf2]                      
  090f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A5B ->$0AE9 ->$0B77 ->$0C05 ->$0920 ->$08AE
  0913  0A5B           addr M74_r4_04000::0a5b           
  0915  0AE9           addr M74_r4_04000::0ae9           
  0917  0B77           addr M74_r4_04000::0b77           
  0919  0C05           addr M74_r4_04000::0c05           
  091b  0920           addr M74_r4_04000::0920           
  091d  08AE           addr M74_r4_04000::08ae           
LAB_M74_r4_04000__091f:
  091f  39             RTS                               

; ---- function FUN_M74_r4_04000__0920
FUN_M74_r4_04000__0920:
  0920  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0924  01             db 1h                             
  0925  01             db 1h                             
  0926  01             db 1h                             
  0927  207265747572.. ds " return "                     
LAB_M74_r4_04000__092f:
  092f  AD9FFDF2       JSR [0xfdf2]                      
  0933  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A34 ->$0A34 ->$0A34 ->$0875 ->$08AE ->$08E7
  0937  0A34           addr M74_r4_04000::0a34           
  0939  0A34           addr M74_r4_04000::0a34           
  093b  0A34           addr M74_r4_04000::0a34           
  093d  0875           addr M74_r4_04000::0875           
  093f  08AE           addr M74_r4_04000::08ae           
  0941  08E7           addr M74_r4_04000::08e7           
LAB_M74_r4_04000__0943:
  0943  39             RTS                               

; ---- function FUN_M74_r4_04000__0944
FUN_M74_r4_04000__0944:
  0944  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l fdbck1" "l fdbck2" [-] [-]
  0948  6C2066646263.. ds "l fdbck1"                     
  0950  6C2066646263.. ds "l fdbck2"                     
  0958  00             db 0h                             
  0959  00             db 0h                             
LAB_M74_r4_04000__095a:
  095a  AD9FFDF2       JSR [0xfdf2]                      
  095e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2748 ->$27E8 ->$1702 ->$1873 ->$0979 ->$09AE
  0962  2748           addr M74_r4_04000::2748           
  0964  27E8           addr M74_r4_04000::27e8           
  0966  1702           addr M74_r4_04000::1702           
  0968  1873           addr M74_r4_04000::1873           
  096a  0979           addr M74_r4_04000::0979           
  096c  09AE           addr M74_r4_04000::09ae           
LAB_M74_r4_04000__096e:
  096e  170DD0         LBSR 0x1741                       
  0971  170F3E         LBSR 0x18b2                       
  0974  AD9FFDF2       JSR [0xfdf2]                      
  0978  39             RTS                               

; ---- function FUN_M74_r4_04000__0979
FUN_M74_r4_04000__0979:
  0979  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r fdbck1" "r fdbck2" [-] [-]
  097d  722066646263.. ds "r fdbck1"                     
  0985  722066646263.. ds "r fdbck2"                     
  098d  00             db 0h                             
  098e  00             db 0h                             
LAB_M74_r4_04000__098f:
  098f  AD9FFDF2       JSR [0xfdf2]                      
  0993  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2888 ->$2928 ->$194C ->$1A25 ->$09AE ->$0944
  0997  2888           addr M74_r4_04000::2888           
  0999  2928           addr M74_r4_04000::2928           
  099b  194C           addr M74_r4_04000::194c           
  099d  1A25           addr M74_r4_04000::1a25           
  099f  09AE           addr M74_r4_04000::09ae           
  09a1  0944           addr M74_r4_04000::0944           
LAB_M74_r4_04000__09a3:
  09a3  170FE5         LBSR 0x198b                       
  09a6  1710BB         LBSR 0x1a64                       
  09a9  AD9FFDF2       JSR [0xfdf2]                      
  09ad  39             RTS                               

; ---- function FUN_M74_r4_04000__09ae
FUN_M74_r4_04000__09ae:
  09ae  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  09b2  01             db 1h                             
  09b3  01             db 1h                             
  09b4  01             db 1h                             
  09b5  207265747572.. ds " return "                     
LAB_M74_r4_04000__09bd:
  09bd  AD9FFDF2       JSR [0xfdf2]                      
  09c1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A34 ->$0A34 ->$0A34 ->$0875 ->$0944 ->$0979
  09c5  0A34           addr M74_r4_04000::0a34           
  09c7  0A34           addr M74_r4_04000::0a34           
  09c9  0A34           addr M74_r4_04000::0a34           
  09cb  0875           addr M74_r4_04000::0875           
  09cd  0944           addr M74_r4_04000::0944           
  09cf  0979           addr M74_r4_04000::0979           
LAB_M74_r4_04000__09d1:
  09d1  39             RTS                               

; ---- function FUN_M74_r4_04000__09d2
FUN_M74_r4_04000__09d2:
  09d2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] [-] "l splice"
  09d6  00             db 0h                             
  09d7  00             db 0h                             
  09d8  00             db 0h                             
  09d9  6C2073706C69.. ds "l splice"                     
LAB_M74_r4_04000__09e1:
  09e1  AD9FFDF2       JSR [0xfdf2]                      
  09e5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1544 ->$1392 ->$11D6 ->$250D ->$0875 ->$0875
  09e9  1544           addr M74_r4_04000::1544           
  09eb  1392           addr M74_r4_04000::1392           
  09ed  11D6           addr M74_r4_04000::11d6           
  09ef  250D           addr M74_r4_04000::250d           
  09f1  0875           addr M74_r4_04000::0875           
  09f3  0875           addr M74_r4_04000::0875           
LAB_M74_r4_04000__09f5:
  09f5  170B8B         LBSR 0x1583                       
  09f8  1709D6         LBSR 0x13d1                       
  09fb  170817         LBSR 0x1215                       
  09fe  AD9FFDF2       JSR [0xfdf2]                      
  0a02  39             RTS                               

; ---- function FUN_M74_r4_04000__0a03
FUN_M74_r4_04000__0a03:
  0a03  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] [-] "r splice"
  0a07  00             db 0h                             
  0a08  00             db 0h                             
  0a09  00             db 0h                             
  0a0a  722073706C69.. ds "r splice"                     
LAB_M74_r4_04000__0a12:
  0a12  AD9FFDF2       JSR [0xfdf2]                      
  0a16  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1641 ->$1483 ->$12CE ->$2644 ->$0875 ->$0875
  0a1a  1641           addr M74_r4_04000::1641           
  0a1c  1483           addr M74_r4_04000::1483           
  0a1e  12CE           addr M74_r4_04000::12ce           
  0a20  2644           addr M74_r4_04000::2644           
  0a22  0875           addr M74_r4_04000::0875           
  0a24  0875           addr M74_r4_04000::0875           
LAB_M74_r4_04000__0a26:
  0a26  170C57         LBSR 0x1680                       
  0a29  170A96         LBSR 0x14c2                       
  0a2c  1708DE         LBSR 0x130d                       
  0a2f  AD9FFDF2       JSR [0xfdf2]                      
  0a33  39             RTS                               

; ---- function FUN_M74_r4_04000__0a34
FUN_M74_r4_04000__0a34:
  0a34  39             RTS                               
PTR_FUN_M74_r4_04000__0ab4_M74_r4_04000__0a35:
  0a35  0AB4           addr M74_r4_04000::0ab4           
  0a37  0A7F           addr M74_r4_04000::0a7f           
  0a39  .db 0A 73 70 86 71 0C 00 00 71 1C 00 08 00 91 11 00  ; .sp.q...q.......
  0a49  .db 00 00 14 00 01 00 15 13 0A A3 00 00 0C 6D 70 8E  ; .............mp.
  0a59  .db 00 99                                            ; ..

; ---- function FUN_M74_r4_04000__0a5b
FUN_M74_r4_04000__0a5b:
  0a5b  3410           PSHS  X                           
  0a5d  8E0A35         LDX #0xa35                        
  0a60  AD9FFC4E       JSR [0xfc4e]                      
  0a64  3510           PULS  X                           
  0a66  39             RTS                               

; ---- function FUN_M74_r4_04000__0a67
FUN_M74_r4_04000__0a67:
  0a67  3410           PSHS  X                           
  0a69  8E0A35         LDX #0xa35                         ; desc[API_FDBC]: ->$0AB4 ->$0A7F
  0a6c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...5"
  0a70  3510           PULS  X                           
  0a72  39             RTS                               

; ---- function FUN_M74_r4_04000__0a73
FUN_M74_r4_04000__0a73:
  0a73  3410           PSHS  X                           
  0a75  8E0A35         LDX #0xa35                         ; desc[API_FE6C]: ->$0AB4 ->$0A7F
  0a78  AD9FFE6C       JSR [0xfe6c]                      
  0a7c  3510           PULS  X                           
  0a7e  39             RTS                               

; ---- function FUN_M74_r4_04000__0a7f
FUN_M74_r4_04000__0a7f:
  0a7f  3410           PSHS  X                           
  0a81  8E0A35         LDX #0xa35                        
  0a84  AD9FFC52       JSR [0xfc52]                      
  0a88  3510           PULS  X                           
  0a8a  39             RTS                               

; ---- function FUN_M74_r4_04000__0a8b
FUN_M74_r4_04000__0a8b:
  0a8b  3410           PSHS  X                           
  0a8d  8E0A35         LDX #0xa35                         ; desc[API_FE1C]: ->$0AB4 ->$0A7F
  0a90  AD9FFE1C       JSR [0xfe1c]                      
  0a94  3510           PULS  X                           
  0a96  39             RTS                               

; ---- function FUN_M74_r4_04000__0a97
FUN_M74_r4_04000__0a97:
  0a97  3410           PSHS  X                           
  0a99  8E0A35         LDX #0xa35                         ; desc[API_FE1A]: ->$0AB4 ->$0A7F $0A73
  0a9c  AD9FFE1A       JSR [0xfe1a]                      
  0aa0  3510           PULS  X                           
  0aa2  39             RTS                               
  0aa3  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  0ab3  .db 20                                               ;  

; ---- function FUN_M74_r4_04000__0ab4
FUN_M74_r4_04000__0ab4:
  0ab4  3476           PSHS  U Y X B A                   
  0ab6  8E0A35         LDX #0xa35                        
  0ab9  AD9FFE76       JSR [0xfe76]                      
  0abd  1703D1         LBSR 0x0e91                       
  0ac0  3576           PULS  A B X Y U                   
  0ac2  39             RTS                               
PTR_FUN_M74_r4_04000__0b42_M74_r4_04000__0ac3:
  0ac3  0B42           addr M74_r4_04000::0b42           
  0ac5  0B0D           addr M74_r4_04000::0b0d           
  0ac7  .db 0B 01 70 88 71 0E 00 00 71 1E 00 08 00 93 12 00  ; ..p.q...q.......
  0ad7  .db 00 00 14 00 01 00 15 13 0B 31 00 00 0C 6D 70 90  ; .........1...mp.
  0ae7  .db 00 9B                                            ; ..

; ---- function FUN_M74_r4_04000__0ae9
FUN_M74_r4_04000__0ae9:
  0ae9  3410           PSHS  X                           
  0aeb  8E0AC3         LDX #0xac3                        
  0aee  AD9FFC4E       JSR [0xfc4e]                      
  0af2  3510           PULS  X                           
  0af4  39             RTS                               

; ---- function FUN_M74_r4_04000__0af5
FUN_M74_r4_04000__0af5:
  0af5  3410           PSHS  X                           
  0af7  8E0AC3         LDX #0xac3                         ; desc[API_FDBC]: ->$0B42 ->$0B0D
  0afa  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0afe  3510           PULS  X                           
  0b00  39             RTS                               

; ---- function FUN_M74_r4_04000__0b01
FUN_M74_r4_04000__0b01:
  0b01  3410           PSHS  X                           
  0b03  8E0AC3         LDX #0xac3                         ; desc[API_FE6C]: ->$0B42 ->$0B0D
  0b06  AD9FFE6C       JSR [0xfe6c]                      
  0b0a  3510           PULS  X                           
  0b0c  39             RTS                               

; ---- function FUN_M74_r4_04000__0b0d
FUN_M74_r4_04000__0b0d:
  0b0d  3410           PSHS  X                           
  0b0f  8E0AC3         LDX #0xac3                        
  0b12  AD9FFC52       JSR [0xfc52]                      
  0b16  3510           PULS  X                           
  0b18  39             RTS                               

; ---- function FUN_M74_r4_04000__0b19
FUN_M74_r4_04000__0b19:
  0b19  3410           PSHS  X                           
  0b1b  8E0AC3         LDX #0xac3                         ; desc[API_FE1C]: ->$0B42 ->$0B0D
  0b1e  AD9FFE1C       JSR [0xfe1c]                      
  0b22  3510           PULS  X                           
  0b24  39             RTS                               

; ---- function FUN_M74_r4_04000__0b25
FUN_M74_r4_04000__0b25:
  0b25  3410           PSHS  X                           
  0b27  8E0AC3         LDX #0xac3                         ; desc[API_FE1A]: ->$0B42 ->$0B0D $0B01
  0b2a  AD9FFE1A       JSR [0xfe1a]                      
  0b2e  3510           PULS  X                           
  0b30  39             RTS                               
  0b31  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  0b41  .db 20                                               ;  

; ---- function FUN_M74_r4_04000__0b42
FUN_M74_r4_04000__0b42:
  0b42  3476           PSHS  U Y X B A                   
  0b44  8E0AC3         LDX #0xac3                        
  0b47  AD9FFE76       JSR [0xfe76]                      
  0b4b  170425         LBSR 0x0f73                       
  0b4e  3576           PULS  A B X Y U                   
  0b50  39             RTS                               
PTR_FUN_M74_r4_04000__0bd0_M74_r4_04000__0b51:
  0b51  0BD0           addr M74_r4_04000::0bd0           
  0b53  0B9B           addr M74_r4_04000::0b9b           
  0b55  .db 0B 8F 70 8A 71 10 00 00 71 20 00 08 00 95 13 00  ; ..p.q...q ......
  0b65  .db 00 00 14 00 01 00 15 13 0B BF 00 00 0C 6D 70 92  ; .............mp.
  0b75  .db 00 9D                                            ; ..

; ---- function FUN_M74_r4_04000__0b77
FUN_M74_r4_04000__0b77:
  0b77  3410           PSHS  X                           
  0b79  8E0B51         LDX #0xb51                        
  0b7c  AD9FFC4E       JSR [0xfc4e]                      
  0b80  3510           PULS  X                           
  0b82  39             RTS                               

; ---- function FUN_M74_r4_04000__0b83
FUN_M74_r4_04000__0b83:
  0b83  3410           PSHS  X                           
  0b85  8E0B51         LDX #0xb51                         ; desc[API_FDBC]: ->$0BD0 ->$0B9B
  0b88  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...Q"
  0b8c  3510           PULS  X                           
  0b8e  39             RTS                               

; ---- function FUN_M74_r4_04000__0b8f
FUN_M74_r4_04000__0b8f:
  0b8f  3410           PSHS  X                           
  0b91  8E0B51         LDX #0xb51                         ; desc[API_FE6C]: ->$0BD0 ->$0B9B
  0b94  AD9FFE6C       JSR [0xfe6c]                      
  0b98  3510           PULS  X                           
  0b9a  39             RTS                               

; ---- function FUN_M74_r4_04000__0b9b
FUN_M74_r4_04000__0b9b:
  0b9b  3410           PSHS  X                           
  0b9d  8E0B51         LDX #0xb51                        
  0ba0  AD9FFC52       JSR [0xfc52]                      
  0ba4  3510           PULS  X                           
  0ba6  39             RTS                               

; ---- function FUN_M74_r4_04000__0ba7
FUN_M74_r4_04000__0ba7:
  0ba7  3410           PSHS  X                           
  0ba9  8E0B51         LDX #0xb51                         ; desc[API_FE1C]: ->$0BD0 ->$0B9B
  0bac  AD9FFE1C       JSR [0xfe1c]                      
  0bb0  3510           PULS  X                           
  0bb2  39             RTS                               

; ---- function FUN_M74_r4_04000__0bb3
FUN_M74_r4_04000__0bb3:
  0bb3  3410           PSHS  X                           
  0bb5  8E0B51         LDX #0xb51                         ; desc[API_FE1A]: ->$0BD0 ->$0B9B $0B8F
  0bb8  AD9FFE1A       JSR [0xfe1a]                      
  0bbc  3510           PULS  X                           
  0bbe  39             RTS                               
  0bbf  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  0bcf  .db 20                                               ;  

; ---- function FUN_M74_r4_04000__0bd0
FUN_M74_r4_04000__0bd0:
  0bd0  3476           PSHS  U Y X B A                   
  0bd2  8E0B51         LDX #0xb51                        
  0bd5  AD9FFE76       JSR [0xfe76]                      
  0bd9  170479         LBSR 0x1055                       
  0bdc  3576           PULS  A B X Y U                   
  0bde  39             RTS                               
PTR_FUN_M74_r4_04000__0c5e_M74_r4_04000__0bdf:
  0bdf  0C5E           addr M74_r4_04000::0c5e           
  0be1  0C29           addr M74_r4_04000::0c29           
  0be3  .db 0C 1D 70 8C 71 12 00 00 71 22 00 08 00 97 14 00  ; ..p.q...q"......
  0bf3  .db 00 00 14 00 01 00 15 13 0C 4D 00 00 0C 6D 70 94  ; .........M...mp.
  0c03  .db 00 9F                                            ; ..

; ---- function FUN_M74_r4_04000__0c05
FUN_M74_r4_04000__0c05:
  0c05  3410           PSHS  X                           
  0c07  8E0BDF         LDX #0xbdf                        
  0c0a  AD9FFC4E       JSR [0xfc4e]                      
  0c0e  3510           PULS  X                           
  0c10  39             RTS                               

; ---- function FUN_M74_r4_04000__0c11
FUN_M74_r4_04000__0c11:
  0c11  3410           PSHS  X                           
  0c13  8E0BDF         LDX #0xbdf                         ; desc[API_FDBC]: ->$0C5E ->$0C29
  0c16  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0c1a  3510           PULS  X                           
  0c1c  39             RTS                               

; ---- function FUN_M74_r4_04000__0c1d
FUN_M74_r4_04000__0c1d:
  0c1d  3410           PSHS  X                           
  0c1f  8E0BDF         LDX #0xbdf                         ; desc[API_FE6C]: ->$0C5E ->$0C29
  0c22  AD9FFE6C       JSR [0xfe6c]                      
  0c26  3510           PULS  X                           
  0c28  39             RTS                               

; ---- function FUN_M74_r4_04000__0c29
FUN_M74_r4_04000__0c29:
  0c29  3410           PSHS  X                           
  0c2b  8E0BDF         LDX #0xbdf                        
  0c2e  AD9FFC52       JSR [0xfc52]                      
  0c32  3510           PULS  X                           
  0c34  39             RTS                               

; ---- function FUN_M74_r4_04000__0c35
FUN_M74_r4_04000__0c35:
  0c35  3410           PSHS  X                           
  0c37  8E0BDF         LDX #0xbdf                         ; desc[API_FE1C]: ->$0C5E ->$0C29
  0c3a  AD9FFE1C       JSR [0xfe1c]                      
  0c3e  3510           PULS  X                           
  0c40  39             RTS                               

; ---- function FUN_M74_r4_04000__0c41
FUN_M74_r4_04000__0c41:
  0c41  3410           PSHS  X                           
  0c43  8E0BDF         LDX #0xbdf                         ; desc[API_FE1A]: ->$0C5E ->$0C29 $0C1D
  0c46  AD9FFE1A       JSR [0xfe1a]                      
  0c4a  3510           PULS  X                           
  0c4c  39             RTS                               
  0c4d  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  0c5d  .db 20                                               ;  

; ---- function FUN_M74_r4_04000__0c5e
FUN_M74_r4_04000__0c5e:
  0c5e  3476           PSHS  U Y X B A                   
  0c60  8E0BDF         LDX #0xbdf                        
  0c63  AD9FFE76       JSR [0xfe76]                      
  0c67  1704CD         LBSR 0x1137                       
  0c6a  3576           PULS  A B X Y U                   
  0c6c  39             RTS                               
  0c6d  .db 0C 20 20 20 20 20 20 20 20 20 7C 20 20 20 20 20  ; .         |     
  0c7d  .db 20 20 20 20 52 4C 0C 20 20 20 20 20 20 20 20 7C  ;     RL.        |
  0c8d  .db 20 20 20 20 20 20 20 20 20 52 4C 20 0C 20 20 20  ;          RL .   
  0c9d  .db 20 20 20 20 7C 20 20 20 20 20 20 20 20 20 52 4C  ;     |         RL
  0cad  .db 20 20 0C 20 20 20 20 20 20 7C 20 20 20 20 20 20  ;   .      |      
  0cbd  .db 20 20 20 52 4C 20 20 20 0C 20 20 20 20 20 7C 20  ;    RL   .     | 
  0ccd  .db 20 20 20 20 20 20 20 20 52 4C 20 20 20 20 0C 20  ;         RL    . 
  0cdd  .db 20 20 20 7C 20 20 20 20 20 20 20 20 20 52 4C 20  ;    |         RL 
  0ced  .db 20 20 20 20 0C 20 20 20 7C 20 20 20 20 20 20 20  ;     .   |       
  0cfd  .db 20 20 52 4C 20 20 20 20 20 20 0C 20 20 7C 20 20  ;   RL      .  |  
  0d0d  .db 20 20 20 20 20 20 20 52 4C 20 20 20 20 20 20 20  ;        RL       
  0d1d  .db 0C 20 7C 20 20 20 20 20 20 20 20 20 52 4C 20 20  ; . |         RL  
  0d2d  .db 20 20 20 20 20 20 0C 7C 20 20 20 20 20 20 20 20  ;       .|        
  0d3d  .db 20 52 4C 20 20 20 20 20 20 20 20 20 0C 20 20 20  ;  RL         .   
  0d4d  .db 20 20 20 20 20 20 52 4C 20 20 20 20 20 20 20 20  ;       RL        
  0d5d  .db 20 7C 0C 20 20 20 20 20 20 20 20 52 4C 20 20 20  ;  |.        RL   
  0d6d  .db 20 20 20 20 20 20 7C 20 0C 20 20 20 20 20 20 20  ;       | .       
  0d7d  .db 52 4C 20 20 20 20 20 20 20 20 20 7C 20 20 0C 20  ; RL         |  . 
  0d8d  .db 20 20 20 20 20 52 4C 20 20 20 20 20 20 20 20 20  ;      RL         
  0d9d  .db 7C 20 20 20 0C 20 20 20 20 20 52 4C 20 20 20 20  ; |   .     RL    
  0dad  .db 20 20 20 20 20 7C 20 20 20 20 0C 20 20 20 20 52  ;      |    .    R
  0dbd  .db 4C 20 20 20 20 20 20 20 20 20 7C 20 20 20 20 20  ; L         |     
  0dcd  .db 0C 20 20 20 52 4C 20 20 20 20 20 20 20 20 20 7C  ; .   RL         |
  0ddd  .db 20 20 20 20 20 20 0C 20 20 52 4C 20 20 20 20 20  ;       .  RL     
  0ded  .db 20 20 20 20 7C 20 20 20 20 20 20 20 0C 20 52 4C  ;     |       . RL
  0dfd  .db 20 20 20 20 20 20 20 20 20 7C 20 20 20 20 20 20  ;          |      
  0e0d  .db 20 20 0C 52 4C 20 20 20 20 20 20 20 20 20 7C 20  ;   .RL         | 
  0e1d  .db 20 20 20 20 20 20 20 20 0C                       ;         .
PTR_FUN_M74_r4_04000__0e91_M74_r4_04000__0e26:
  0e26  0E91           addr M74_r4_04000::0e91           
  0e28  0E70           addr M74_r4_04000::0e70           
  0e2a  .db 0E 64 70 96 71 14 00 00 71 24 00 08 01 05 0D FF  ; .dp.q...q$......
  0e3a  .db 9C 00 64 00 01 00 04 22 0E 7C 00 00 00 00 00 00  ; ..d....".|......
  0e4a  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__0e4c
FUN_M74_r4_04000__0e4c:
  0e4c  3410           PSHS  X                           
  0e4e  8E0E26         LDX #0xe26                         ; desc[API_FE6A]: ->$0E91 ->$0E70
  0e51  AD9FFE6A       JSR [0xfe6a]                      
  0e55  3510           PULS  X                           
  0e57  39             RTS                               

; ---- function FUN_M74_r4_04000__0e58
FUN_M74_r4_04000__0e58:
  0e58  3410           PSHS  X                           
  0e5a  8E0E26         LDX #0xe26                         ; desc[API_FDBC]: ->$0E91 ->$0E70
  0e5d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...&"
  0e61  3510           PULS  X                           
  0e63  39             RTS                               

; ---- function FUN_M74_r4_04000__0e64
FUN_M74_r4_04000__0e64:
  0e64  3410           PSHS  X                           
  0e66  8E0E26         LDX #0xe26                         ; desc[API_FE6C]: ->$0E91 ->$0E70
  0e69  AD9FFE6C       JSR [0xfe6c]                      
  0e6d  3510           PULS  X                           
  0e6f  39             RTS                               

; ---- function FUN_M74_r4_04000__0e70
FUN_M74_r4_04000__0e70:
  0e70  3410           PSHS  X                           
  0e72  8E0E26         LDX #0xe26                         ; desc[API_FE6E]: ->$0E91 ->$0E70
  0e75  AD9FFE6E       JSR [0xfe6e]                      
  0e79  3510           PULS  X                           
  0e7b  39             RTS                               
  0e7c  .db 14 6C 20 70 69 74 63 68 20 6C 65 76 65 6C 3A 20  ; .l pitch level: 
  0e8c  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M74_r4_04000__0e91
FUN_M74_r4_04000__0e91:
  0e91  3476           PSHS  U Y X B A                   
  0e93  8E0E26         LDX #0xe26                        
  0e96  AD9FFE76       JSR [0xfe76]                      
  0e9a  FC711C         LDD 0x711c                        
  0e9d  83000A         SUBD #0xa                         
  0ea0  3606           PSHU  B A                         
  0ea2  CC0005         LDD #0x5                          
  0ea5  3606           PSHU  B A                         
  0ea7  AD9FFCEC       JSR [0xfcec]                      
  0eab  AD9FFEC4       JSR [0xfec4]                      
  0eaf  FC70C6         LDD 0x70c6                        
  0eb2  3606           PSHU  B A                         
  0eb4  AD9FFCF2       JSR [0xfcf2]                      
  0eb8  CC3FFF         LDD #0x3fff                       
  0ebb  3606           PSHU  B A                         
  0ebd  AD9FFCE2       JSR [0xfce2]                      
  0ec1  FC7124         LDD 0x7124                        
  0ec4  3606           PSHU  B A                         
  0ec6  AD9FFEC4       JSR [0xfec4]                      
  0eca  ECC4           LDD ,U                            
  0ecc  FD7166         STD 0x7166                        
  0ecf  AD9FFCF2       JSR [0xfcf2]                      
  0ed3  3706           PULU  A B                         
  0ed5  FD7164         STD 0x7164                        
  0ed8  FC7166         LDD 0x7166                        
  0edb  B37164         SUBD 0x7164                       
  0ede  FD7166         STD 0x7166                        
  0ee1  CC000A         LDD #0xa                          
  0ee4  AD9FFD20       JSR [0xfd20]                      
  0ee8  108E0362       LDY #0x362                        
  0eec  FC7166         LDD 0x7166                        
  0eef  AD9FFD2E       JSR [0xfd2e]                      
  0ef3  CC000A         LDD #0xa                          
  0ef6  AD9FFD20       JSR [0xfd20]                      
  0efa  108E0363       LDY #0x363                        
  0efe  FC7164         LDD 0x7164                        
  0f01  AD9FFD2E       JSR [0xfd2e]                      
  0f05  3576           PULS  A B X Y U                   
  0f07  39             RTS                               
PTR_FUN_M74_r4_04000__0f73_M74_r4_04000__0f08:
  0f08  0F73           addr M74_r4_04000::0f73           
  0f0a  0F52           addr M74_r4_04000::0f52           
  0f0c  .db 0F 46 70 98 71 16 00 00 71 26 00 08 01 07 0E FF  ; .Fp.q...q&......
  0f1c  .db 9C 00 64 00 01 00 04 22 0F 5E 00 00 00 00 00 00  ; ..d....".^......
  0f2c  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__0f2e
FUN_M74_r4_04000__0f2e:
  0f2e  3410           PSHS  X                           
  0f30  8E0F08         LDX #0xf08                         ; desc[API_FE6A]: ->$0F73 ->$0F52
  0f33  AD9FFE6A       JSR [0xfe6a]                      
  0f37  3510           PULS  X                           
  0f39  39             RTS                               

; ---- function FUN_M74_r4_04000__0f3a
FUN_M74_r4_04000__0f3a:
  0f3a  3410           PSHS  X                           
  0f3c  8E0F08         LDX #0xf08                         ; desc[API_FDBC]: ->$0F73 ->$0F52
  0f3f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0f43  3510           PULS  X                           
  0f45  39             RTS                               

; ---- function FUN_M74_r4_04000__0f46
FUN_M74_r4_04000__0f46:
  0f46  3410           PSHS  X                           
  0f48  8E0F08         LDX #0xf08                         ; desc[API_FE6C]: ->$0F73 ->$0F52
  0f4b  AD9FFE6C       JSR [0xfe6c]                      
  0f4f  3510           PULS  X                           
  0f51  39             RTS                               

; ---- function FUN_M74_r4_04000__0f52
FUN_M74_r4_04000__0f52:
  0f52  3410           PSHS  X                           
  0f54  8E0F08         LDX #0xf08                         ; desc[API_FE6E]: ->$0F73 ->$0F52
  0f57  AD9FFE6E       JSR [0xfe6e]                      
  0f5b  3510           PULS  X                           
  0f5d  39             RTS                               
  0f5e  .db 14 72 20 70 69 74 63 68 20 6C 65 76 65 6C 3A 20  ; .r pitch level: 
  0f6e  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M74_r4_04000__0f73
FUN_M74_r4_04000__0f73:
  0f73  3476           PSHS  U Y X B A                   
  0f75  8E0F08         LDX #0xf08                        
  0f78  AD9FFE76       JSR [0xfe76]                      
  0f7c  FC711E         LDD 0x711e                        
  0f7f  83000A         SUBD #0xa                         
  0f82  3606           PSHU  B A                         
  0f84  CC0005         LDD #0x5                          
  0f87  3606           PSHU  B A                         
  0f89  AD9FFCEC       JSR [0xfcec]                      
  0f8d  AD9FFEC4       JSR [0xfec4]                      
  0f91  FC70C6         LDD 0x70c6                        
  0f94  3606           PSHU  B A                         
  0f96  AD9FFCF2       JSR [0xfcf2]                      
  0f9a  CC3FFF         LDD #0x3fff                       
  0f9d  3606           PSHU  B A                         
  0f9f  AD9FFCE2       JSR [0xfce2]                      
  0fa3  FC7126         LDD 0x7126                        
  0fa6  3606           PSHU  B A                         
  0fa8  AD9FFEC4       JSR [0xfec4]                      
  0fac  ECC4           LDD ,U                            
  0fae  FD7166         STD 0x7166                        
  0fb1  AD9FFCF2       JSR [0xfcf2]                      
  0fb5  3706           PULU  A B                         
  0fb7  FD7164         STD 0x7164                        
  0fba  FC7166         LDD 0x7166                        
  0fbd  B37164         SUBD 0x7164                       
  0fc0  FD7166         STD 0x7166                        
  0fc3  CC000A         LDD #0xa                          
  0fc6  AD9FFD20       JSR [0xfd20]                      
  0fca  108E0364       LDY #0x364                        
  0fce  FC7166         LDD 0x7166                        
  0fd1  AD9FFD2E       JSR [0xfd2e]                      
  0fd5  CC000A         LDD #0xa                          
  0fd8  AD9FFD20       JSR [0xfd20]                      
  0fdc  108E0365       LDY #0x365                        
  0fe0  FC7164         LDD 0x7164                        
  0fe3  AD9FFD2E       JSR [0xfd2e]                      
  0fe7  3576           PULS  A B X Y U                   
  0fe9  39             RTS                               
PTR_FUN_M74_r4_04000__1055_M74_r4_04000__0fea:
  0fea  1055           addr M74_r4_04000::1055           
  0fec  1034           addr M74_r4_04000::1034           
  0fee  .db 10 28 70 9A 71 18 00 00 71 28 00 08 01 09 0F FF  ; .(p.q...q(......
  0ffe  .db 9C 00 64 00 01 00 04 22 10 40 00 00 00 00 00 00  ; ..d....".@......
  100e  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__1010
FUN_M74_r4_04000__1010:
  1010  3410           PSHS  X                           
  1012  8E0FEA         LDX #0xfea                         ; desc[API_FE6A]: ->$1055 ->$1034
  1015  AD9FFE6A       JSR [0xfe6a]                      
  1019  3510           PULS  X                           
  101b  39             RTS                               

; ---- function FUN_M74_r4_04000__101c
FUN_M74_r4_04000__101c:
  101c  3410           PSHS  X                           
  101e  8E0FEA         LDX #0xfea                         ; desc[API_FDBC]: ->$1055 ->$1034
  1021  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1025  3510           PULS  X                           
  1027  39             RTS                               

; ---- function FUN_M74_r4_04000__1028
FUN_M74_r4_04000__1028:
  1028  3410           PSHS  X                           
  102a  8E0FEA         LDX #0xfea                         ; desc[API_FE6C]: ->$1055 ->$1034
  102d  AD9FFE6C       JSR [0xfe6c]                      
  1031  3510           PULS  X                           
  1033  39             RTS                               

; ---- function FUN_M74_r4_04000__1034
FUN_M74_r4_04000__1034:
  1034  3410           PSHS  X                           
  1036  8E0FEA         LDX #0xfea                         ; desc[API_FE6E]: ->$1055 ->$1034
  1039  AD9FFE6E       JSR [0xfe6e]                      
  103d  3510           PULS  X                           
  103f  39             RTS                               
  1040  .db 14 6C 20 64 65 6C 61 79 20 6C 65 76 65 6C 3A 20  ; .l delay level: 
  1050  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M74_r4_04000__1055
FUN_M74_r4_04000__1055:
  1055  3476           PSHS  U Y X B A                   
  1057  8E0FEA         LDX #0xfea                        
  105a  AD9FFE76       JSR [0xfe76]                      
  105e  FC7120         LDD 0x7120                        
  1061  83000A         SUBD #0xa                         
  1064  3606           PSHU  B A                         
  1066  CC0005         LDD #0x5                          
  1069  3606           PSHU  B A                         
  106b  AD9FFCEC       JSR [0xfcec]                      
  106f  AD9FFEC4       JSR [0xfec4]                      
  1073  FC70C6         LDD 0x70c6                        
  1076  3606           PSHU  B A                         
  1078  AD9FFCF2       JSR [0xfcf2]                      
  107c  CC3FFF         LDD #0x3fff                       
  107f  3606           PSHU  B A                         
  1081  AD9FFCE2       JSR [0xfce2]                      
  1085  FC7128         LDD 0x7128                        
  1088  3606           PSHU  B A                         
  108a  AD9FFEC4       JSR [0xfec4]                      
  108e  ECC4           LDD ,U                            
  1090  FD7166         STD 0x7166                        
  1093  AD9FFCF2       JSR [0xfcf2]                      
  1097  3706           PULU  A B                         
  1099  FD7164         STD 0x7164                        
  109c  FC7166         LDD 0x7166                        
  109f  B37164         SUBD 0x7164                       
  10a2  FD7166         STD 0x7166                        
  10a5  CC000A         LDD #0xa                          
  10a8  AD9FFD20       JSR [0xfd20]                      
  10ac  108E0366       LDY #0x366                        
  10b0  FC7166         LDD 0x7166                        
  10b3  AD9FFD2E       JSR [0xfd2e]                      
  10b7  CC000A         LDD #0xa                          
  10ba  AD9FFD20       JSR [0xfd20]                      
  10be  108E0367       LDY #0x367                        
  10c2  FC7164         LDD 0x7164                        
  10c5  AD9FFD2E       JSR [0xfd2e]                      
  10c9  3576           PULS  A B X Y U                   
  10cb  39             RTS                               
PTR_FUN_M74_r4_04000__1137_M74_r4_04000__10cc:
  10cc  1137           addr M74_r4_04000::1137           
  10ce  1116           addr M74_r4_04000::1116           
  10d0  .db 11 0A 70 9C 71 1A 00 00 71 2A 00 08 01 0B 10 FF  ; ..p.q...q*......
  10e0  .db 9C 00 64 00 01 00 04 22 11 22 00 00 00 00 00 00  ; ..d...."."......
  10f0  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__10f2
FUN_M74_r4_04000__10f2:
  10f2  3410           PSHS  X                           
  10f4  8E10CC         LDX #0x10cc                        ; desc[API_FE6A]: ->$1137 ->$1116
  10f7  AD9FFE6A       JSR [0xfe6a]                      
  10fb  3510           PULS  X                           
  10fd  39             RTS                               

; ---- function FUN_M74_r4_04000__10fe
FUN_M74_r4_04000__10fe:
  10fe  3410           PSHS  X                           
  1100  8E10CC         LDX #0x10cc                        ; desc[API_FDBC]: ->$1137 ->$1116
  1103  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1107  3510           PULS  X                           
  1109  39             RTS                               

; ---- function FUN_M74_r4_04000__110a
FUN_M74_r4_04000__110a:
  110a  3410           PSHS  X                           
  110c  8E10CC         LDX #0x10cc                        ; desc[API_FE6C]: ->$1137 ->$1116
  110f  AD9FFE6C       JSR [0xfe6c]                      
  1113  3510           PULS  X                           
  1115  39             RTS                               

; ---- function FUN_M74_r4_04000__1116
FUN_M74_r4_04000__1116:
  1116  3410           PSHS  X                           
  1118  8E10CC         LDX #0x10cc                        ; desc[API_FE6E]: ->$1137 ->$1116
  111b  AD9FFE6E       JSR [0xfe6e]                      
  111f  3510           PULS  X                           
  1121  39             RTS                               
  1122  .db 14 72 20 64 65 6C 61 79 20 6C 65 76 65 6C 3A 20  ; .r delay level: 
  1132  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M74_r4_04000__1137
FUN_M74_r4_04000__1137:
  1137  3476           PSHS  U Y X B A                   
  1139  8E10CC         LDX #0x10cc                       
  113c  AD9FFE76       JSR [0xfe76]                      
  1140  FC7122         LDD 0x7122                        
  1143  83000A         SUBD #0xa                         
  1146  3606           PSHU  B A                         
  1148  CC0005         LDD #0x5                          
  114b  3606           PSHU  B A                         
  114d  AD9FFCEC       JSR [0xfcec]                      
  1151  AD9FFEC4       JSR [0xfec4]                      
  1155  FC70C6         LDD 0x70c6                        
  1158  3606           PSHU  B A                         
  115a  AD9FFCF2       JSR [0xfcf2]                      
  115e  CC3FFF         LDD #0x3fff                       
  1161  3606           PSHU  B A                         
  1163  AD9FFCE2       JSR [0xfce2]                      
  1167  FC712A         LDD 0x712a                        
  116a  3606           PSHU  B A                         
  116c  AD9FFEC4       JSR [0xfec4]                      
  1170  ECC4           LDD ,U                            
  1172  FD7166         STD 0x7166                        
  1175  AD9FFCF2       JSR [0xfcf2]                      
  1179  3706           PULU  A B                         
  117b  FD7164         STD 0x7164                        
  117e  FC7166         LDD 0x7166                        
  1181  B37164         SUBD 0x7164                       
  1184  FD7166         STD 0x7166                        
  1187  CC000A         LDD #0xa                          
  118a  AD9FFD20       JSR [0xfd20]                      
  118e  108E0368       LDY #0x368                        
  1192  FC7166         LDD 0x7166                        
  1195  AD9FFD2E       JSR [0xfd2e]                      
  1199  CC000A         LDD #0xa                          
  119c  AD9FFD20       JSR [0xfd20]                      
  11a0  108E0369       LDY #0x369                        
  11a4  FC7164         LDD 0x7164                        
  11a7  AD9FFD2E       JSR [0xfd2e]                      
  11ab  3576           PULS  A B X Y U                   
  11ad  39             RTS                               
PTR_FUN_M74_r4_04000__1260_M74_r4_04000__11ae:
  11ae  1260           addr M74_r4_04000::1260           
  11b0  1206           addr M74_r4_04000::1206           
  11b2  .db 11 FA 70 72 71 3C 00 00 71 3E 00 08 00 B5 1F 00  ; ..prq<..q>......
  11c2  .db 00 00 01 00 01 00 05 20 12 4B 11 D6 12 72 70 74  ; ....... .K...rpt
  11d2  .db 71 8A 11 E2                                      ; q...

; ---- function FUN_M74_r4_04000__11d6
FUN_M74_r4_04000__11d6:
  11d6  3410           PSHS  X                           
  11d8  8E11AE         LDX #0x11ae                       
  11db  AD9FFEBA       JSR [0xfeba]                      
  11df  3510           PULS  X                           
  11e1  39             RTS                               

; ---- function FUN_M74_r4_04000__11e2
FUN_M74_r4_04000__11e2:
  11e2  3410           PSHS  X                           
  11e4  8E11AE         LDX #0x11ae                       
  11e7  AD9FFEC0       JSR [0xfec0]                      
  11eb  3510           PULS  X                           
  11ed  39             RTS                               

; ---- function FUN_M74_r4_04000__11ee
FUN_M74_r4_04000__11ee:
  11ee  3410           PSHS  X                           
  11f0  8E11AE         LDX #0x11ae                        ; desc[API_FDBC]: ->$1260 ->$1206
  11f3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  11f7  3510           PULS  X                           
  11f9  39             RTS                               

; ---- function FUN_M74_r4_04000__11fa
FUN_M74_r4_04000__11fa:
  11fa  3410           PSHS  X                           
  11fc  8E11AE         LDX #0x11ae                        ; desc[API_FE6C]: ->$1260 ->$1206
  11ff  AD9FFE6C       JSR [0xfe6c]                      
  1203  3510           PULS  X                           
  1205  39             RTS                               

; ---- function FUN_M74_r4_04000__1206
FUN_M74_r4_04000__1206:
  1206  3410           PSHS  X                           
  1208  8E11AE         LDX #0x11ae                       
  120b  AD9FFEBC       JSR [0xfebc]                      
  120f  3510           PULS  X                           
  1211  170001         LBSR 0x1215                       
  1214  39             RTS                               

; ---- function FUN_M74_r4_04000__1215
FUN_M74_r4_04000__1215:
  1215  3410           PSHS  X                           
  1217  8E11AE         LDX #0x11ae                       
  121a  AD9FFEBE       JSR [0xfebe]                      
  121e  3510           PULS  X                           
  1220  39             RTS                               

; ---- function FUN_M74_r4_04000__1221
FUN_M74_r4_04000__1221:
  1221  3410           PSHS  X                           
  1223  8E11AE         LDX #0x11ae                        ; desc[API_FE1C]: ->$1260 ->$1206
  1226  AD9FFE1C       JSR [0xfe1c]                      
  122a  3510           PULS  X                           
  122c  17FFE6         LBSR 0x1215                       
  122f  39             RTS                               

; ---- function FUN_M74_r4_04000__1230
FUN_M74_r4_04000__1230:
  1230  3410           PSHS  X                           
  1232  8E11AE         LDX #0x11ae                       
  1235  AD9FFEC2       JSR [0xfec2]                      
  1239  3510           PULS  X                           
  123b  17FFD7         LBSR 0x1215                       
  123e  39             RTS                               

; ---- function FUN_M74_r4_04000__123f
FUN_M74_r4_04000__123f:
  123f  3410           PSHS  X                           
  1241  8E11AE         LDX #0x11ae                        ; desc[API_FE1A]: ->$1260 ->$1206 $11FA
  1244  AD9FFE1A       JSR [0xfe1a]                      
  1248  3510           PULS  X                           
  124a  39             RTS                               
  124b  .db 14 6C 20 64 65 67 6C 69 74 63 68 3A 20 20 20 20  ; .l deglitch:    
  125b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__1260
FUN_M74_r4_04000__1260:
  1260  3476           PSHS  U Y X B A                   
  1262  8E11AE         LDX #0x11ae                       
  1265  AD9FFE76       JSR [0xfe76]                      
  1269  CC0001         LDD #0x1                          
  126c  FD716C         STD 0x716c                        
  126f  3576           PULS  A B X Y U                   
  1271  39             RTS                               
  1272  .db 6C 64 65 67 3D 6F 66 66 66 69 78 65 64 6C 64 65  ; ldeg=offfixedlde
  1282  .db 67 3D 6F 6E 20 73 6D 61 72 74 72 64 65 67 3D 6F  ; g=on smartrdeg=o
  1292  .db 66 66 66 69 78 65 64 72 64 65 67 3D 6F 6E 20 73  ; fffixedrdeg=on s
  12a2  .db 6D 61 72 74                                      ; mart
PTR_FUN_M74_r4_04000__1358_M74_r4_04000__12a6:
  12a6  1358           addr M74_r4_04000::1358           
  12a8  12FE           addr M74_r4_04000::12fe           
  12aa  .db 12 F2 70 6E 71 40 00 00 71 42 00 08 00 B7 23 00  ; ..pnq@..qB....#.
  12ba  .db 00 00 01 00 01 00 05 20 13 43 12 CE 12 8C 70 70  ; ....... .C....pp
  12ca  .db 71 8A 12 DA                                      ; q...

; ---- function FUN_M74_r4_04000__12ce
FUN_M74_r4_04000__12ce:
  12ce  3410           PSHS  X                           
  12d0  8E12A6         LDX #0x12a6                       
  12d3  AD9FFEBA       JSR [0xfeba]                      
  12d7  3510           PULS  X                           
  12d9  39             RTS                               

; ---- function FUN_M74_r4_04000__12da
FUN_M74_r4_04000__12da:
  12da  3410           PSHS  X                           
  12dc  8E12A6         LDX #0x12a6                       
  12df  AD9FFEC0       JSR [0xfec0]                      
  12e3  3510           PULS  X                           
  12e5  39             RTS                               

; ---- function FUN_M74_r4_04000__12e6
FUN_M74_r4_04000__12e6:
  12e6  3410           PSHS  X                           
  12e8  8E12A6         LDX #0x12a6                        ; desc[API_FDBC]: ->$1358 ->$12FE
  12eb  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  12ef  3510           PULS  X                           
  12f1  39             RTS                               

; ---- function FUN_M74_r4_04000__12f2
FUN_M74_r4_04000__12f2:
  12f2  3410           PSHS  X                           
  12f4  8E12A6         LDX #0x12a6                        ; desc[API_FE6C]: ->$1358 ->$12FE
  12f7  AD9FFE6C       JSR [0xfe6c]                      
  12fb  3510           PULS  X                           
  12fd  39             RTS                               

; ---- function FUN_M74_r4_04000__12fe
FUN_M74_r4_04000__12fe:
  12fe  3410           PSHS  X                           
  1300  8E12A6         LDX #0x12a6                       
  1303  AD9FFEBC       JSR [0xfebc]                      
  1307  3510           PULS  X                           
  1309  170001         LBSR 0x130d                       
  130c  39             RTS                               

; ---- function FUN_M74_r4_04000__130d
FUN_M74_r4_04000__130d:
  130d  3410           PSHS  X                           
  130f  8E12A6         LDX #0x12a6                       
  1312  AD9FFEBE       JSR [0xfebe]                      
  1316  3510           PULS  X                           
  1318  39             RTS                               

; ---- function FUN_M74_r4_04000__1319
FUN_M74_r4_04000__1319:
  1319  3410           PSHS  X                           
  131b  8E12A6         LDX #0x12a6                        ; desc[API_FE1C]: ->$1358 ->$12FE
  131e  AD9FFE1C       JSR [0xfe1c]                      
  1322  3510           PULS  X                           
  1324  17FFE6         LBSR 0x130d                       
  1327  39             RTS                               

; ---- function FUN_M74_r4_04000__1328
FUN_M74_r4_04000__1328:
  1328  3410           PSHS  X                           
  132a  8E12A6         LDX #0x12a6                       
  132d  AD9FFEC2       JSR [0xfec2]                      
  1331  3510           PULS  X                           
  1333  17FFD7         LBSR 0x130d                       
  1336  39             RTS                               

; ---- function FUN_M74_r4_04000__1337
FUN_M74_r4_04000__1337:
  1337  3410           PSHS  X                           
  1339  8E12A6         LDX #0x12a6                        ; desc[API_FE1A]: ->$1358 ->$12FE $12F2
  133c  AD9FFE1A       JSR [0xfe1a]                      
  1340  3510           PULS  X                           
  1342  39             RTS                               
  1343  .db 14 72 20 64 65 67 6C 69 74 63 68 3A 20 20 20 20  ; .r deglitch:    
  1353  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__1358
FUN_M74_r4_04000__1358:
  1358  3476           PSHS  U Y X B A                   
  135a  8E12A6         LDX #0x12a6                       
  135d  AD9FFE76       JSR [0xfe76]                      
  1361  CC0001         LDD #0x1                          
  1364  FD716C         STD 0x716c                        
  1367  3576           PULS  A B X Y U                   
  1369  39             RTS                               
PTR_FUN_M74_r4_04000__141c_M74_r4_04000__136a:
  136a  141C           addr M74_r4_04000::141c           
  136c  13C2           addr M74_r4_04000::13c2           
  136e  .db 13 B6 70 6A 71 44 00 00 71 46 00 08 00 B9 1E 00  ; ..pjqD..qF......
  137e  .db 00 00 01 00 01 00 04 21 14 07 13 92 14 2B 70 6C  ; .......!.....+pl
  138e  .db 71 8A 13 9E                                      ; q...

; ---- function FUN_M74_r4_04000__1392
FUN_M74_r4_04000__1392:
  1392  3410           PSHS  X                           
  1394  8E136A         LDX #0x136a                       
  1397  AD9FFEBA       JSR [0xfeba]                      
  139b  3510           PULS  X                           
  139d  39             RTS                               

; ---- function FUN_M74_r4_04000__139e
FUN_M74_r4_04000__139e:
  139e  3410           PSHS  X                           
  13a0  8E136A         LDX #0x136a                       
  13a3  AD9FFEC0       JSR [0xfec0]                      
  13a7  3510           PULS  X                           
  13a9  39             RTS                               

; ---- function FUN_M74_r4_04000__13aa
FUN_M74_r4_04000__13aa:
  13aa  3410           PSHS  X                           
  13ac  8E136A         LDX #0x136a                        ; desc[API_FDBC]: ->$141C ->$13C2
  13af  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...j"
  13b3  3510           PULS  X                           
  13b5  39             RTS                               

; ---- function FUN_M74_r4_04000__13b6
FUN_M74_r4_04000__13b6:
  13b6  3410           PSHS  X                           
  13b8  8E136A         LDX #0x136a                        ; desc[API_FE6C]: ->$141C ->$13C2
  13bb  AD9FFE6C       JSR [0xfe6c]                      
  13bf  3510           PULS  X                           
  13c1  39             RTS                               

; ---- function FUN_M74_r4_04000__13c2
FUN_M74_r4_04000__13c2:
  13c2  3410           PSHS  X                           
  13c4  8E136A         LDX #0x136a                       
  13c7  AD9FFEBC       JSR [0xfebc]                      
  13cb  3510           PULS  X                           
  13cd  170001         LBSR 0x13d1                       
  13d0  39             RTS                               

; ---- function FUN_M74_r4_04000__13d1
FUN_M74_r4_04000__13d1:
  13d1  3410           PSHS  X                           
  13d3  8E136A         LDX #0x136a                       
  13d6  AD9FFEBE       JSR [0xfebe]                      
  13da  3510           PULS  X                           
  13dc  39             RTS                               

; ---- function FUN_M74_r4_04000__13dd
FUN_M74_r4_04000__13dd:
  13dd  3410           PSHS  X                           
  13df  8E136A         LDX #0x136a                        ; desc[API_FE1C]: ->$141C ->$13C2
  13e2  AD9FFE1C       JSR [0xfe1c]                      
  13e6  3510           PULS  X                           
  13e8  17FFE6         LBSR 0x13d1                       
  13eb  39             RTS                               

; ---- function FUN_M74_r4_04000__13ec
FUN_M74_r4_04000__13ec:
  13ec  3410           PSHS  X                           
  13ee  8E136A         LDX #0x136a                       
  13f1  AD9FFEC2       JSR [0xfec2]                      
  13f5  3510           PULS  X                           
  13f7  17FFD7         LBSR 0x13d1                       
  13fa  39             RTS                               

; ---- function FUN_M74_r4_04000__13fb
FUN_M74_r4_04000__13fb:
  13fb  3410           PSHS  X                           
  13fd  8E136A         LDX #0x136a                        ; desc[API_FE1A]: ->$141C ->$13C2 $13B6
  1400  AD9FFE1A       JSR [0xfe1a]                      
  1404  3510           PULS  X                           
  1406  39             RTS                               
  1407  .db 14 6C 20 78 66 61 64 65 20 6D 6F 64 65 3A 20 20  ; .l xfade mode:  
  1417  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__141c
FUN_M74_r4_04000__141c:
  141c  3476           PSHS  U Y X B A                   
  141e  8E136A         LDX #0x136a                       
  1421  AD9FFE76       JSR [0xfe76]                      
  1425  170960         LBSR 0x1d88                       
  1428  3576           PULS  A B X Y U                   
  142a  39             RTS                               
  142b  .db 6C 78 66 3D 66 61 73 74 66 61 73 74 6C 78 66 3D  ; lxf=fastfastlxf=
  143b  .db 73 6C 6F 77 73 6C 6F 77 72 78 66 3D 66 61 73 74  ; slowslowrxf=fast
  144b  .db 66 61 73 74 72 78 66 3D 73 6C 6F 77 73 6C 6F 77  ; fastrxf=slowslow
PTR_FUN_M74_r4_04000__150d_M74_r4_04000__145b:
  145b  150D           addr M74_r4_04000::150d           
  145d  14B3           addr M74_r4_04000::14b3           
  145f  .db 14 A7 70 62 71 48 00 00 71 4A 00 08 00 BB 22 00  ; ..pbqH..qJ....".
  146f  .db 00 00 01 00 01 00 04 21 14 F8 14 83 14 43 70 68  ; .......!.....Cph
  147f  .db 71 8A 14 8F                                      ; q...

; ---- function FUN_M74_r4_04000__1483
FUN_M74_r4_04000__1483:
  1483  3410           PSHS  X                           
  1485  8E145B         LDX #0x145b                       
  1488  AD9FFEBA       JSR [0xfeba]                      
  148c  3510           PULS  X                           
  148e  39             RTS                               

; ---- function FUN_M74_r4_04000__148f
FUN_M74_r4_04000__148f:
  148f  3410           PSHS  X                           
  1491  8E145B         LDX #0x145b                       
  1494  AD9FFEC0       JSR [0xfec0]                      
  1498  3510           PULS  X                           
  149a  39             RTS                               

; ---- function FUN_M74_r4_04000__149b
FUN_M74_r4_04000__149b:
  149b  3410           PSHS  X                           
  149d  8E145B         LDX #0x145b                        ; desc[API_FDBC]: ->$150D ->$14B3
  14a0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...["
  14a4  3510           PULS  X                           
  14a6  39             RTS                               

; ---- function FUN_M74_r4_04000__14a7
FUN_M74_r4_04000__14a7:
  14a7  3410           PSHS  X                           
  14a9  8E145B         LDX #0x145b                        ; desc[API_FE6C]: ->$150D ->$14B3
  14ac  AD9FFE6C       JSR [0xfe6c]                      
  14b0  3510           PULS  X                           
  14b2  39             RTS                               

; ---- function FUN_M74_r4_04000__14b3
FUN_M74_r4_04000__14b3:
  14b3  3410           PSHS  X                           
  14b5  8E145B         LDX #0x145b                       
  14b8  AD9FFEBC       JSR [0xfebc]                      
  14bc  3510           PULS  X                           
  14be  170001         LBSR 0x14c2                       
  14c1  39             RTS                               

; ---- function FUN_M74_r4_04000__14c2
FUN_M74_r4_04000__14c2:
  14c2  3410           PSHS  X                           
  14c4  8E145B         LDX #0x145b                       
  14c7  AD9FFEBE       JSR [0xfebe]                      
  14cb  3510           PULS  X                           
  14cd  39             RTS                               

; ---- function FUN_M74_r4_04000__14ce
FUN_M74_r4_04000__14ce:
  14ce  3410           PSHS  X                           
  14d0  8E145B         LDX #0x145b                        ; desc[API_FE1C]: ->$150D ->$14B3
  14d3  AD9FFE1C       JSR [0xfe1c]                      
  14d7  3510           PULS  X                           
  14d9  17FFE6         LBSR 0x14c2                       
  14dc  39             RTS                               

; ---- function FUN_M74_r4_04000__14dd
FUN_M74_r4_04000__14dd:
  14dd  3410           PSHS  X                           
  14df  8E145B         LDX #0x145b                       
  14e2  AD9FFEC2       JSR [0xfec2]                      
  14e6  3510           PULS  X                           
  14e8  17FFD7         LBSR 0x14c2                       
  14eb  39             RTS                               

; ---- function FUN_M74_r4_04000__14ec
FUN_M74_r4_04000__14ec:
  14ec  3410           PSHS  X                           
  14ee  8E145B         LDX #0x145b                        ; desc[API_FE1A]: ->$150D ->$14B3 $14A7
  14f1  AD9FFE1A       JSR [0xfe1a]                      
  14f5  3510           PULS  X                           
  14f7  39             RTS                               
  14f8  .db 14 72 20 78 66 61 64 65 20 6D 6F 64 65 3A 20 20  ; .r xfade mode:  
  1508  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__150d
FUN_M74_r4_04000__150d:
  150d  3476           PSHS  U Y X B A                   
  150f  8E145B         LDX #0x145b                       
  1512  AD9FFE76       JSR [0xfe76]                      
  1516  170A83         LBSR 0x1f9c                       
  1519  3576           PULS  A B X Y U                   
  151b  39             RTS                               
PTR_FUN_M74_r4_04000__15ce_M74_r4_04000__151c:
  151c  15CE           addr M74_r4_04000::15ce           
  151e  1574           addr M74_r4_04000::1574           
  1520  .db 15 68 70 60 71 4C 00 00 71 4E 00 08 00 BD 1D 00  ; .hp`qL..qN......
  1530  .db 00 00 01 00 01 00 07 20 15 B9 15 44 15 DD 70 66  ; ....... ...D..pf
  1540  .db 01 0D 15 50                                      ; ...P

; ---- function FUN_M74_r4_04000__1544
FUN_M74_r4_04000__1544:
  1544  3410           PSHS  X                           
  1546  8E151C         LDX #0x151c                       
  1549  AD9FFEBA       JSR [0xfeba]                      
  154d  3510           PULS  X                           
  154f  39             RTS                               

; ---- function FUN_M74_r4_04000__1550
FUN_M74_r4_04000__1550:
  1550  3410           PSHS  X                           
  1552  8E151C         LDX #0x151c                       
  1555  AD9FFEC0       JSR [0xfec0]                      
  1559  3510           PULS  X                           
  155b  39             RTS                               

; ---- function FUN_M74_r4_04000__155c
FUN_M74_r4_04000__155c:
  155c  3410           PSHS  X                           
  155e  8E151C         LDX #0x151c                        ; desc[API_FDBC]: ->$15CE ->$1574
  1561  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1565  3510           PULS  X                           
  1567  39             RTS                               

; ---- function FUN_M74_r4_04000__1568
FUN_M74_r4_04000__1568:
  1568  3410           PSHS  X                           
  156a  8E151C         LDX #0x151c                        ; desc[API_FE6C]: ->$15CE ->$1574
  156d  AD9FFE6C       JSR [0xfe6c]                      
  1571  3510           PULS  X                           
  1573  39             RTS                               

; ---- function FUN_M74_r4_04000__1574
FUN_M74_r4_04000__1574:
  1574  3410           PSHS  X                           
  1576  8E151C         LDX #0x151c                       
  1579  AD9FFEBC       JSR [0xfebc]                      
  157d  3510           PULS  X                           
  157f  170001         LBSR 0x1583                       
  1582  39             RTS                               

; ---- function FUN_M74_r4_04000__1583
FUN_M74_r4_04000__1583:
  1583  3410           PSHS  X                           
  1585  8E151C         LDX #0x151c                       
  1588  AD9FFEBE       JSR [0xfebe]                      
  158c  3510           PULS  X                           
  158e  39             RTS                               

; ---- function FUN_M74_r4_04000__158f
FUN_M74_r4_04000__158f:
  158f  3410           PSHS  X                           
  1591  8E151C         LDX #0x151c                        ; desc[API_FE1C]: ->$15CE ->$1574
  1594  AD9FFE1C       JSR [0xfe1c]                      
  1598  3510           PULS  X                           
  159a  17FFE6         LBSR 0x1583                       
  159d  39             RTS                               

; ---- function FUN_M74_r4_04000__159e
FUN_M74_r4_04000__159e:
  159e  3410           PSHS  X                           
  15a0  8E151C         LDX #0x151c                       
  15a3  AD9FFEC2       JSR [0xfec2]                      
  15a7  3510           PULS  X                           
  15a9  17FFD7         LBSR 0x1583                       
  15ac  39             RTS                               

; ---- function FUN_M74_r4_04000__15ad
FUN_M74_r4_04000__15ad:
  15ad  3410           PSHS  X                           
  15af  8E151C         LDX #0x151c                        ; desc[API_FE1A]: ->$15CE ->$1574 $1568
  15b2  AD9FFE1A       JSR [0xfe1a]                      
  15b6  3510           PULS  X                           
  15b8  39             RTS                               
  15b9  .db 14 6C 20 73 68 69 66 74 6D 6F 64 65 3A 20 20 20  ; .l shiftmode:   
  15c9  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__15ce
FUN_M74_r4_04000__15ce:
  15ce  3476           PSHS  U Y X B A                   
  15d0  8E151C         LDX #0x151c                       
  15d3  AD9FFE76       JSR [0xfe76]                      
  15d7  1707AE         LBSR 0x1d88                       
  15da  3576           PULS  A B X Y U                   
  15dc  39             RTS                               
  15dd  .db 6C 64 69 72 3D 66 77 64 66 6F 72 77 61 72 64 6C  ; ldir=fwdforwardl
  15ed  .db 64 69 72 3D 72 65 76 72 65 76 65 72 73 65 72 64  ; dir=revreverserd
  15fd  .db 69 72 3D 66 77 64 66 6F 72 77 61 72 64 72 64 69  ; ir=fwdforwardrdi
  160d  .db 72 3D 72 65 76 72 65 76 65 72 73 65              ; r=revreverse
PTR_FUN_M74_r4_04000__16cb_M74_r4_04000__1619:
  1619  16CB           addr M74_r4_04000::16cb           
  161b  1671           addr M74_r4_04000::1671           
  161d  .db 16 65 70 5E 71 50 00 00 71 52 00 08 00 BF 21 00  ; .ep^qP..qR....!.
  162d  .db 00 00 01 00 01 00 07 20 16 B6 16 41 15 FB 70 64  ; ....... ...A..pd
  163d  .db 01 0F 16 4D                                      ; ...M

; ---- function FUN_M74_r4_04000__1641
FUN_M74_r4_04000__1641:
  1641  3410           PSHS  X                           
  1643  8E1619         LDX #0x1619                       
  1646  AD9FFEBA       JSR [0xfeba]                      
  164a  3510           PULS  X                           
  164c  39             RTS                               

; ---- function FUN_M74_r4_04000__164d
FUN_M74_r4_04000__164d:
  164d  3410           PSHS  X                           
  164f  8E1619         LDX #0x1619                       
  1652  AD9FFEC0       JSR [0xfec0]                      
  1656  3510           PULS  X                           
  1658  39             RTS                               

; ---- function FUN_M74_r4_04000__1659
FUN_M74_r4_04000__1659:
  1659  3410           PSHS  X                           
  165b  8E1619         LDX #0x1619                        ; desc[API_FDBC]: ->$16CB ->$1671
  165e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1662  3510           PULS  X                           
  1664  39             RTS                               

; ---- function FUN_M74_r4_04000__1665
FUN_M74_r4_04000__1665:
  1665  3410           PSHS  X                           
  1667  8E1619         LDX #0x1619                        ; desc[API_FE6C]: ->$16CB ->$1671
  166a  AD9FFE6C       JSR [0xfe6c]                      
  166e  3510           PULS  X                           
  1670  39             RTS                               

; ---- function FUN_M74_r4_04000__1671
FUN_M74_r4_04000__1671:
  1671  3410           PSHS  X                           
  1673  8E1619         LDX #0x1619                       
  1676  AD9FFEBC       JSR [0xfebc]                      
  167a  3510           PULS  X                           
  167c  170001         LBSR 0x1680                       
  167f  39             RTS                               

; ---- function FUN_M74_r4_04000__1680
FUN_M74_r4_04000__1680:
  1680  3410           PSHS  X                           
  1682  8E1619         LDX #0x1619                       
  1685  AD9FFEBE       JSR [0xfebe]                      
  1689  3510           PULS  X                           
  168b  39             RTS                               

; ---- function FUN_M74_r4_04000__168c
FUN_M74_r4_04000__168c:
  168c  3410           PSHS  X                           
  168e  8E1619         LDX #0x1619                        ; desc[API_FE1C]: ->$16CB ->$1671
  1691  AD9FFE1C       JSR [0xfe1c]                      
  1695  3510           PULS  X                           
  1697  17FFE6         LBSR 0x1680                       
  169a  39             RTS                               

; ---- function FUN_M74_r4_04000__169b
FUN_M74_r4_04000__169b:
  169b  3410           PSHS  X                           
  169d  8E1619         LDX #0x1619                       
  16a0  AD9FFEC2       JSR [0xfec2]                      
  16a4  3510           PULS  X                           
  16a6  17FFD7         LBSR 0x1680                       
  16a9  39             RTS                               

; ---- function FUN_M74_r4_04000__16aa
FUN_M74_r4_04000__16aa:
  16aa  3410           PSHS  X                           
  16ac  8E1619         LDX #0x1619                        ; desc[API_FE1A]: ->$16CB ->$1671 $1665
  16af  AD9FFE1A       JSR [0xfe1a]                      
  16b3  3510           PULS  X                           
  16b5  39             RTS                               
  16b6  .db 14 72 20 73 68 69 66 74 6D 6F 64 65 3A 20 20 20  ; .r shiftmode:   
  16c6  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__16cb
FUN_M74_r4_04000__16cb:
  16cb  3476           PSHS  U Y X B A                   
  16cd  8E1619         LDX #0x1619                       
  16d0  AD9FFE76       JSR [0xfe76]                      
  16d4  1708C5         LBSR 0x1f9c                       
  16d7  3576           PULS  A B X Y U                   
  16d9  39             RTS                               
PTR_FUN_M74_r4_04000__178c_M74_r4_04000__16da:
  16da  178C           addr M74_r4_04000::178c           
  16dc  1732           addr M74_r4_04000::1732           
  16de  .db 17 26 70 76 71 2C 00 00 71 2E 00 08 00 AD 17 00  ; .&pvq,..q.......
  16ee  .db 00 00 03 00 01 00 0B 1D 17 77 17 02 17 B3 70 78  ; .........w....px
  16fe  .db 71 8A 17 0E                                      ; q...

; ---- function FUN_M74_r4_04000__1702
FUN_M74_r4_04000__1702:
  1702  3410           PSHS  X                           
  1704  8E16DA         LDX #0x16da                       
  1707  AD9FFEBA       JSR [0xfeba]                      
  170b  3510           PULS  X                           
  170d  39             RTS                               

; ---- function FUN_M74_r4_04000__170e
FUN_M74_r4_04000__170e:
  170e  3410           PSHS  X                           
  1710  8E16DA         LDX #0x16da                       
  1713  AD9FFEC0       JSR [0xfec0]                      
  1717  3510           PULS  X                           
  1719  39             RTS                               

; ---- function FUN_M74_r4_04000__171a
FUN_M74_r4_04000__171a:
  171a  3410           PSHS  X                           
  171c  8E16DA         LDX #0x16da                        ; desc[API_FDBC]: ->$178C ->$1732
  171f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1723  3510           PULS  X                           
  1725  39             RTS                               

; ---- function FUN_M74_r4_04000__1726
FUN_M74_r4_04000__1726:
  1726  3410           PSHS  X                           
  1728  8E16DA         LDX #0x16da                        ; desc[API_FE6C]: ->$178C ->$1732
  172b  AD9FFE6C       JSR [0xfe6c]                      
  172f  3510           PULS  X                           
  1731  39             RTS                               

; ---- function FUN_M74_r4_04000__1732
FUN_M74_r4_04000__1732:
  1732  3410           PSHS  X                           
  1734  8E16DA         LDX #0x16da                       
  1737  AD9FFEBC       JSR [0xfebc]                      
  173b  3510           PULS  X                           
  173d  170001         LBSR 0x1741                       
  1740  39             RTS                               

; ---- function FUN_M74_r4_04000__1741
FUN_M74_r4_04000__1741:
  1741  3410           PSHS  X                           
  1743  8E16DA         LDX #0x16da                       
  1746  AD9FFEBE       JSR [0xfebe]                      
  174a  3510           PULS  X                           
  174c  39             RTS                               

; ---- function FUN_M74_r4_04000__174d
FUN_M74_r4_04000__174d:
  174d  3410           PSHS  X                           
  174f  8E16DA         LDX #0x16da                        ; desc[API_FE1C]: ->$178C ->$1732
  1752  AD9FFE1C       JSR [0xfe1c]                      
  1756  3510           PULS  X                           
  1758  17FFE6         LBSR 0x1741                       
  175b  39             RTS                               

; ---- function FUN_M74_r4_04000__175c
FUN_M74_r4_04000__175c:
  175c  3410           PSHS  X                           
  175e  8E16DA         LDX #0x16da                       
  1761  AD9FFEC2       JSR [0xfec2]                      
  1765  3510           PULS  X                           
  1767  17FFD7         LBSR 0x1741                       
  176a  39             RTS                               

; ---- function FUN_M74_r4_04000__176b
FUN_M74_r4_04000__176b:
  176b  3410           PSHS  X                           
  176d  8E16DA         LDX #0x16da                        ; desc[API_FE1A]: ->$178C ->$1732 $1726
  1770  AD9FFE1A       JSR [0xfe1a]                      
  1774  3510           PULS  X                           
  1776  39             RTS                               
  1777  .db 14 6C 65 66 74 20 66 62 31 3A 20 20 20 20 20 20  ; .left fb1:      
  1787  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__178c
FUN_M74_r4_04000__178c:
  178c  3476           PSHS  U Y X B A                   
  178e  8E16DA         LDX #0x16da                       
  1791  AD9FFE76       JSR [0xfe76]                      
  1795  FC712E         LDD 0x712e                        
  1798  C30001         ADDD #0x1                         
  179b  FD7164         STD 0x7164                        
  179e  CC000A         LDD #0xa                          
  17a1  AD9FFD20       JSR [0xfd20]                      
  17a5  108E035A       LDY #0x35a                        
  17a9  FC7164         LDD 0x7164                        
  17ac  AD9FFD2E       JSR [0xfd2e]                      
  17b0  3576           PULS  A B X Y U                   
  17b2  39             RTS                               
  17b3  .db 66 62 31 3D 6C 70 69 74 6C 65 66 74 20 70 69 74  ; fb1=lpitleft pit
  17c3  .db 63 68 20 66 62 31 3D 6C 64 6C 79 6C 65 66 74 20  ; ch fb1=ldlyleft 
  17d3  .db 64 65 6C 61 79 20 66 62 31 3D 72 70 69 74 72 69  ; delay fb1=rpitri
  17e3  .db 67 68 74 20 70 69 74 63 68 66 62 31 3D 72 64 6C  ; ght pitchfb1=rdl
  17f3  .db 79 72 69 67 68 74 20 64 65 6C 61 79 66 62 32 3D  ; yright delayfb2=
  1803  .db 6C 70 69 74 6C 65 66 74 20 70 69 74 63 68 20 66  ; lpitleft pitch f
  1813  .db 62 32 3D 6C 64 6C 79 6C 65 66 74 20 64 65 6C 61  ; b2=ldlyleft dela
  1823  .db 79 20 66 62 32 3D 72 70 69 74 72 69 67 68 74 20  ; y fb2=rpitright 
  1833  .db 70 69 74 63 68 66 62 32 3D 72 64 6C 79 72 69 67  ; pitchfb2=rdlyrig
  1843  .db 68 74 20 64 65 6C 61 79                          ; ht delay
PTR_FUN_M74_r4_04000__18fd_M74_r4_04000__184b:
  184b  18FD           addr M74_r4_04000::18fd           
  184d  18A3           addr M74_r4_04000::18a3           
  184f  .db 18 97 70 7A 71 34 00 00 71 36 00 08 00 AF 18 00  ; ..pzq4..q6......
  185f  .db 00 00 03 00 01 00 0B 1D 18 E8 18 73 17 FF 70 7C  ; ...........s..p|
  186f  .db 71 8A 18 7F                                      ; q...

; ---- function FUN_M74_r4_04000__1873
FUN_M74_r4_04000__1873:
  1873  3410           PSHS  X                           
  1875  8E184B         LDX #0x184b                       
  1878  AD9FFEBA       JSR [0xfeba]                      
  187c  3510           PULS  X                           
  187e  39             RTS                               

; ---- function FUN_M74_r4_04000__187f
FUN_M74_r4_04000__187f:
  187f  3410           PSHS  X                           
  1881  8E184B         LDX #0x184b                       
  1884  AD9FFEC0       JSR [0xfec0]                      
  1888  3510           PULS  X                           
  188a  39             RTS                               

; ---- function FUN_M74_r4_04000__188b
FUN_M74_r4_04000__188b:
  188b  3410           PSHS  X                           
  188d  8E184B         LDX #0x184b                        ; desc[API_FDBC]: ->$18FD ->$18A3
  1890  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...K"
  1894  3510           PULS  X                           
  1896  39             RTS                               

; ---- function FUN_M74_r4_04000__1897
FUN_M74_r4_04000__1897:
  1897  3410           PSHS  X                           
  1899  8E184B         LDX #0x184b                        ; desc[API_FE6C]: ->$18FD ->$18A3
  189c  AD9FFE6C       JSR [0xfe6c]                      
  18a0  3510           PULS  X                           
  18a2  39             RTS                               

; ---- function FUN_M74_r4_04000__18a3
FUN_M74_r4_04000__18a3:
  18a3  3410           PSHS  X                           
  18a5  8E184B         LDX #0x184b                       
  18a8  AD9FFEBC       JSR [0xfebc]                      
  18ac  3510           PULS  X                           
  18ae  170001         LBSR 0x18b2                       
  18b1  39             RTS                               

; ---- function FUN_M74_r4_04000__18b2
FUN_M74_r4_04000__18b2:
  18b2  3410           PSHS  X                           
  18b4  8E184B         LDX #0x184b                       
  18b7  AD9FFEBE       JSR [0xfebe]                      
  18bb  3510           PULS  X                           
  18bd  39             RTS                               

; ---- function FUN_M74_r4_04000__18be
FUN_M74_r4_04000__18be:
  18be  3410           PSHS  X                           
  18c0  8E184B         LDX #0x184b                        ; desc[API_FE1C]: ->$18FD ->$18A3
  18c3  AD9FFE1C       JSR [0xfe1c]                      
  18c7  3510           PULS  X                           
  18c9  17FFE6         LBSR 0x18b2                       
  18cc  39             RTS                               

; ---- function FUN_M74_r4_04000__18cd
FUN_M74_r4_04000__18cd:
  18cd  3410           PSHS  X                           
  18cf  8E184B         LDX #0x184b                       
  18d2  AD9FFEC2       JSR [0xfec2]                      
  18d6  3510           PULS  X                           
  18d8  17FFD7         LBSR 0x18b2                       
  18db  39             RTS                               

; ---- function FUN_M74_r4_04000__18dc
FUN_M74_r4_04000__18dc:
  18dc  3410           PSHS  X                           
  18de  8E184B         LDX #0x184b                        ; desc[API_FE1A]: ->$18FD ->$18A3 $1897
  18e1  AD9FFE1A       JSR [0xfe1a]                      
  18e5  3510           PULS  X                           
  18e7  39             RTS                               
  18e8  .db 14 6C 65 66 74 20 66 62 32 3A 20 20 20 20 20 20  ; .left fb2:      
  18f8  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__18fd
FUN_M74_r4_04000__18fd:
  18fd  3476           PSHS  U Y X B A                   
  18ff  8E184B         LDX #0x184b                       
  1902  AD9FFE76       JSR [0xfe76]                      
  1906  FC7136         LDD 0x7136                        
  1909  C30001         ADDD #0x1                         
  190c  FD7164         STD 0x7164                        
  190f  CC000A         LDD #0xa                          
  1912  AD9FFD20       JSR [0xfd20]                      
  1916  108E035C       LDY #0x35c                        
  191a  FC7164         LDD 0x7164                        
  191d  AD9FFD2E       JSR [0xfd2e]                      
  1921  3576           PULS  A B X Y U                   
  1923  39             RTS                               
PTR_FUN_M74_r4_04000__19d6_M74_r4_04000__1924:
  1924  19D6           addr M74_r4_04000::19d6           
  1926  197C           addr M74_r4_04000::197c           
  1928  .db 19 70 70 7E 71 30 00 00 71 32 00 08 00 B1 1B 00  ; .pp~q0..q2......
  1938  .db 00 00 03 00 01 00 0B 1D 19 C1 19 4C 17 B3 70 80  ; ...........L..p.
  1948  .db 71 8A 19 58                                      ; q..X

; ---- function FUN_M74_r4_04000__194c
FUN_M74_r4_04000__194c:
  194c  3410           PSHS  X                           
  194e  8E1924         LDX #0x1924                       
  1951  AD9FFEBA       JSR [0xfeba]                      
  1955  3510           PULS  X                           
  1957  39             RTS                               

; ---- function FUN_M74_r4_04000__1958
FUN_M74_r4_04000__1958:
  1958  3410           PSHS  X                           
  195a  8E1924         LDX #0x1924                       
  195d  AD9FFEC0       JSR [0xfec0]                      
  1961  3510           PULS  X                           
  1963  39             RTS                               

; ---- function FUN_M74_r4_04000__1964
FUN_M74_r4_04000__1964:
  1964  3410           PSHS  X                           
  1966  8E1924         LDX #0x1924                        ; desc[API_FDBC]: ->$19D6 ->$197C
  1969  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...$"
  196d  3510           PULS  X                           
  196f  39             RTS                               

; ---- function FUN_M74_r4_04000__1970
FUN_M74_r4_04000__1970:
  1970  3410           PSHS  X                           
  1972  8E1924         LDX #0x1924                        ; desc[API_FE6C]: ->$19D6 ->$197C
  1975  AD9FFE6C       JSR [0xfe6c]                      
  1979  3510           PULS  X                           
  197b  39             RTS                               

; ---- function FUN_M74_r4_04000__197c
FUN_M74_r4_04000__197c:
  197c  3410           PSHS  X                           
  197e  8E1924         LDX #0x1924                       
  1981  AD9FFEBC       JSR [0xfebc]                      
  1985  3510           PULS  X                           
  1987  170001         LBSR 0x198b                       
  198a  39             RTS                               

; ---- function FUN_M74_r4_04000__198b
FUN_M74_r4_04000__198b:
  198b  3410           PSHS  X                           
  198d  8E1924         LDX #0x1924                       
  1990  AD9FFEBE       JSR [0xfebe]                      
  1994  3510           PULS  X                           
  1996  39             RTS                               

; ---- function FUN_M74_r4_04000__1997
FUN_M74_r4_04000__1997:
  1997  3410           PSHS  X                           
  1999  8E1924         LDX #0x1924                        ; desc[API_FE1C]: ->$19D6 ->$197C
  199c  AD9FFE1C       JSR [0xfe1c]                      
  19a0  3510           PULS  X                           
  19a2  17FFE6         LBSR 0x198b                       
  19a5  39             RTS                               

; ---- function FUN_M74_r4_04000__19a6
FUN_M74_r4_04000__19a6:
  19a6  3410           PSHS  X                           
  19a8  8E1924         LDX #0x1924                       
  19ab  AD9FFEC2       JSR [0xfec2]                      
  19af  3510           PULS  X                           
  19b1  17FFD7         LBSR 0x198b                       
  19b4  39             RTS                               

; ---- function FUN_M74_r4_04000__19b5
FUN_M74_r4_04000__19b5:
  19b5  3410           PSHS  X                           
  19b7  8E1924         LDX #0x1924                        ; desc[API_FE1A]: ->$19D6 ->$197C $1970
  19ba  AD9FFE1A       JSR [0xfe1a]                      
  19be  3510           PULS  X                           
  19c0  39             RTS                               
  19c1  .db 14 72 69 67 68 74 66 62 31 3A 20 20 20 20 20 20  ; .rightfb1:      
  19d1  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__19d6
FUN_M74_r4_04000__19d6:
  19d6  3476           PSHS  U Y X B A                   
  19d8  8E1924         LDX #0x1924                       
  19db  AD9FFE76       JSR [0xfe76]                      
  19df  FC7132         LDD 0x7132                        
  19e2  C30001         ADDD #0x1                         
  19e5  FD7164         STD 0x7164                        
  19e8  CC000A         LDD #0xa                          
  19eb  AD9FFD20       JSR [0xfd20]                      
  19ef  108E035B       LDY #0x35b                        
  19f3  FC7164         LDD 0x7164                        
  19f6  AD9FFD2E       JSR [0xfd2e]                      
  19fa  3576           PULS  A B X Y U                   
  19fc  39             RTS                               
PTR_FUN_M74_r4_04000__1aaf_M74_r4_04000__19fd:
  19fd  1AAF           addr M74_r4_04000::1aaf           
  19ff  1A55           addr M74_r4_04000::1a55           
  1a01  .db 1A 49 70 82 71 38 00 00 71 3A 00 08 00 B3 1C 00  ; .Ip.q8..q:......
  1a11  .db 00 00 03 00 01 00 0B 1D 1A 9A 1A 25 17 FF 70 84  ; ...........%..p.
  1a21  .db 71 8A 1A 31                                      ; q..1

; ---- function FUN_M74_r4_04000__1a25
FUN_M74_r4_04000__1a25:
  1a25  3410           PSHS  X                           
  1a27  8E19FD         LDX #0x19fd                       
  1a2a  AD9FFEBA       JSR [0xfeba]                      
  1a2e  3510           PULS  X                           
  1a30  39             RTS                               

; ---- function FUN_M74_r4_04000__1a31
FUN_M74_r4_04000__1a31:
  1a31  3410           PSHS  X                           
  1a33  8E19FD         LDX #0x19fd                       
  1a36  AD9FFEC0       JSR [0xfec0]                      
  1a3a  3510           PULS  X                           
  1a3c  39             RTS                               

; ---- function FUN_M74_r4_04000__1a3d
FUN_M74_r4_04000__1a3d:
  1a3d  3410           PSHS  X                           
  1a3f  8E19FD         LDX #0x19fd                        ; desc[API_FDBC]: ->$1AAF ->$1A55
  1a42  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1a46  3510           PULS  X                           
  1a48  39             RTS                               

; ---- function FUN_M74_r4_04000__1a49
FUN_M74_r4_04000__1a49:
  1a49  3410           PSHS  X                           
  1a4b  8E19FD         LDX #0x19fd                        ; desc[API_FE6C]: ->$1AAF ->$1A55
  1a4e  AD9FFE6C       JSR [0xfe6c]                      
  1a52  3510           PULS  X                           
  1a54  39             RTS                               

; ---- function FUN_M74_r4_04000__1a55
FUN_M74_r4_04000__1a55:
  1a55  3410           PSHS  X                           
  1a57  8E19FD         LDX #0x19fd                       
  1a5a  AD9FFEBC       JSR [0xfebc]                      
  1a5e  3510           PULS  X                           
  1a60  170001         LBSR 0x1a64                       
  1a63  39             RTS                               

; ---- function FUN_M74_r4_04000__1a64
FUN_M74_r4_04000__1a64:
  1a64  3410           PSHS  X                           
  1a66  8E19FD         LDX #0x19fd                       
  1a69  AD9FFEBE       JSR [0xfebe]                      
  1a6d  3510           PULS  X                           
  1a6f  39             RTS                               

; ---- function FUN_M74_r4_04000__1a70
FUN_M74_r4_04000__1a70:
  1a70  3410           PSHS  X                           
  1a72  8E19FD         LDX #0x19fd                        ; desc[API_FE1C]: ->$1AAF ->$1A55
  1a75  AD9FFE1C       JSR [0xfe1c]                      
  1a79  3510           PULS  X                           
  1a7b  17FFE6         LBSR 0x1a64                       
  1a7e  39             RTS                               

; ---- function FUN_M74_r4_04000__1a7f
FUN_M74_r4_04000__1a7f:
  1a7f  3410           PSHS  X                           
  1a81  8E19FD         LDX #0x19fd                       
  1a84  AD9FFEC2       JSR [0xfec2]                      
  1a88  3510           PULS  X                           
  1a8a  17FFD7         LBSR 0x1a64                       
  1a8d  39             RTS                               

; ---- function FUN_M74_r4_04000__1a8e
FUN_M74_r4_04000__1a8e:
  1a8e  3410           PSHS  X                           
  1a90  8E19FD         LDX #0x19fd                        ; desc[API_FE1A]: ->$1AAF ->$1A55 $1A49
  1a93  AD9FFE1A       JSR [0xfe1a]                      
  1a97  3510           PULS  X                           
  1a99  39             RTS                               
  1a9a  .db 14 72 69 67 68 74 66 62 32 3A 20 20 20 20 20 20  ; .rightfb2:      
  1aaa  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__1aaf
FUN_M74_r4_04000__1aaf:
  1aaf  3476           PSHS  U Y X B A                   
  1ab1  8E19FD         LDX #0x19fd                       
  1ab4  AD9FFE76       JSR [0xfe76]                      
  1ab8  FC713A         LDD 0x713a                        
  1abb  C30001         ADDD #0x1                         
  1abe  FD7164         STD 0x7164                        
  1ac1  CC000A         LDD #0xa                          
  1ac4  AD9FFD20       JSR [0xfd20]                      
  1ac8  108E035D       LDY #0x35d                        
  1acc  FC7164         LDD 0x7164                        
  1acf  AD9FFD2E       JSR [0xfd2e]                      
  1ad3  3576           PULS  A B X Y U                   
  1ad5  39             RTS                               
PTR_FUN_M74_r4_04000__1b59_M74_r4_04000__1ad6:
  1ad6  1B59           addr M74_r4_04000::1b59           
  1ad8  1B20           addr M74_r4_04000::1b20           
  1ada  .db 1B 14 70 38 70 F0 00 00 70 F2 00 08 00 A9 07 FC  ; ..p8p...p.......
  1aea  .db 18 03 E8 00 01 01 06 1E 1B 44 00 00 00 00 70 3A  ; .........D....p:
  1afa  .db 00 AB                                            ; ..

; ---- function FUN_M74_r4_04000__1afc
FUN_M74_r4_04000__1afc:
  1afc  3410           PSHS  X                           
  1afe  8E1AD6         LDX #0x1ad6                        ; desc[API_FE6A]: ->$1B59 ->$1B20
  1b01  AD9FFE6A       JSR [0xfe6a]                      
  1b05  3510           PULS  X                           
  1b07  39             RTS                               

; ---- function FUN_M74_r4_04000__1b08
FUN_M74_r4_04000__1b08:
  1b08  3410           PSHS  X                           
  1b0a  8E1AD6         LDX #0x1ad6                        ; desc[API_FDBC]: ->$1B59 ->$1B20
  1b0d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1b11  3510           PULS  X                           
  1b13  39             RTS                               

; ---- function FUN_M74_r4_04000__1b14
FUN_M74_r4_04000__1b14:
  1b14  3410           PSHS  X                           
  1b16  8E1AD6         LDX #0x1ad6                        ; desc[API_FE6C]: ->$1B59 ->$1B20
  1b19  AD9FFE6C       JSR [0xfe6c]                      
  1b1d  3510           PULS  X                           
  1b1f  39             RTS                               

; ---- function FUN_M74_r4_04000__1b20
FUN_M74_r4_04000__1b20:
  1b20  3410           PSHS  X                           
  1b22  8E1AD6         LDX #0x1ad6                        ; desc[API_FE6E]: ->$1B59 ->$1B20
  1b25  AD9FFE6E       JSR [0xfe6e]                      
  1b29  3510           PULS  X                           
  1b2b  39             RTS                               

; ---- function FUN_M74_r4_04000__1b2c
FUN_M74_r4_04000__1b2c:
  1b2c  3410           PSHS  X                           
  1b2e  8E1AD6         LDX #0x1ad6                        ; desc[API_FE1C]: ->$1B59 ->$1B20
  1b31  AD9FFE1C       JSR [0xfe1c]                      
  1b35  3510           PULS  X                           
  1b37  39             RTS                               

; ---- function FUN_M74_r4_04000__1b38
FUN_M74_r4_04000__1b38:
  1b38  3410           PSHS  X                           
  1b3a  8E1AD6         LDX #0x1ad6                        ; desc[API_FE1A]: ->$1B59 ->$1B20 $1B14
  1b3d  AD9FFE1A       JSR [0xfe1a]                      
  1b41  3510           PULS  X                           
  1b43  39             RTS                               
  1b44  .db 14 67 6C 6F 62 61 6C 20 66 62 3A 20 20 20 20 20  ; .global fb:     
  1b54  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M74_r4_04000__1b59
FUN_M74_r4_04000__1b59:
  1b59  3476           PSHS  U Y X B A                   
  1b5b  8E1AD6         LDX #0x1ad6                       
  1b5e  AD9FFE76       JSR [0xfe76]                      
  1b62  FC70F2         LDD 0x70f2                        
  1b65  3606           PSHU  B A                         
  1b67  AD9FFEC6       JSR [0xfec6]                      
  1b6b  3706           PULU  A B                         
  1b6d  FD703C         STD 0x703c                        
  1b70  170C1A         LBSR 0x278d                       
  1b73  170CB7         LBSR 0x282d                       
  1b76  170D54         LBSR 0x28cd                       
  1b79  170DF1         LBSR 0x296d                       
  1b7c  3576           PULS  A B X Y U                   
  1b7e  39             RTS                               
PTR_FUN_M74_r4_04000__1c60_M74_r4_04000__1b7f:
  1b7f  1C60           addr M74_r4_04000::1c60           
  1b81  1C05           addr M74_r4_04000::1c05           
  1b83  .db 1B E1 70 3E 70 C2 00 00 70 C4 00 08 00 C1 08 FF  ; ..p>p...p.......
  1b93  .db 9C 00 64 00 01 00 04 22 1B A5 00 00 00 00 70 40  ; ..d...."......p@
  1ba3  .db 00 C3 05 69 6D 61 67 65 20 77 69 64 74 68 3A 2D  ; ...image width:-
  1bb3  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1bc3  .db 20 20 20 20 20 2D                                ;      -

; ---- function FUN_M74_r4_04000__1bc9
FUN_M74_r4_04000__1bc9:
  1bc9  3410           PSHS  X                           
  1bcb  8E1B7F         LDX #0x1b7f                        ; desc[API_FDBC]: ->$1C60 ->$1C05
  1bce  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1bd2  3510           PULS  X                           
  1bd4  39             RTS                               

; ---- function FUN_M74_r4_04000__1bd5
FUN_M74_r4_04000__1bd5:
  1bd5  3410           PSHS  X                           
  1bd7  8E1B7F         LDX #0x1b7f                        ; desc[API_FE6A]: ->$1C60 ->$1C05
  1bda  AD9FFE6A       JSR [0xfe6a]                      
  1bde  3510           PULS  X                           
  1be0  39             RTS                               

; ---- function FUN_M74_r4_04000__1be1
FUN_M74_r4_04000__1be1:
  1be1  3410           PSHS  X                           
  1be3  8E1B7F         LDX #0x1b7f                        ; desc[API_FE6C]: ->$1C60 ->$1C05
  1be6  AD9FFE6C       JSR [0xfe6c]                      
  1bea  3510           PULS  X                           
  1bec  39             RTS                               

; ---- function FUN_M74_r4_04000__1bed
FUN_M74_r4_04000__1bed:
  1bed  3410           PSHS  X                           
  1bef  8E1B7F         LDX #0x1b7f                        ; desc[API_FE1C]: ->$1C60 ->$1C05
  1bf2  AD9FFE1C       JSR [0xfe1c]                      
  1bf6  3510           PULS  X                           
  1bf8  39             RTS                               

; ---- function FUN_M74_r4_04000__1bf9
FUN_M74_r4_04000__1bf9:
  1bf9  3410           PSHS  X                           
  1bfb  8E1B7F         LDX #0x1b7f                        ; desc[API_FE1A]: ->$1C60 ->$1C05 $1BE1
  1bfe  AD9FFE1A       JSR [0xfe1a]                      
  1c02  3510           PULS  X                           
  1c04  39             RTS                               

; ---- function FUN_M74_r4_04000__1c05
FUN_M74_r4_04000__1c05:
  1c05  3456           PSHS  U X B A                     
  1c07  C612           LDB #0x12                         
  1c09  AD9FFC36       JSR [0xfc36]                      
  1c0d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                     "
  1c11  202020202020.. char[22] "                     "  
LAB_M74_r4_04000__1c27:
  1c27  FC70C4         LDD 0x70c4                        
  1c2a  C30064         ADDD #0x64                        
  1c2d  3606           PSHU  B A                         
  1c2f  CC000A         LDD #0xa                          
  1c32  3606           PSHU  B A                         
  1c34  AD9FFCEA       JSR [0xfcea]                      
  1c38  3706           PULU  A B                         
  1c3a  FD7164         STD 0x7164                        
  1c3d  C30012         ADDD #0x12                        
  1c40  AD9FFC36       JSR [0xfc36]                      
  1c44  C652           LDB #0x52                         
  1c46  AD9FFC2A       JSR [0xfc2a]                      
  1c4a  CC0014         LDD #0x14                         
  1c4d  B37164         SUBD 0x7164                       
  1c50  C30012         ADDD #0x12                        
  1c53  AD9FFC36       JSR [0xfc36]                      
  1c57  C64C           LDB #0x4c                         
  1c59  AD9FFC2A       JSR [0xfc2a]                      
  1c5d  3556           PULS  A B X U                     
  1c5f  39             RTS                               

; ---- function FUN_M74_r4_04000__1c60
FUN_M74_r4_04000__1c60:
  1c60  3476           PSHS  U Y X B A                   
  1c62  8E1B7F         LDX #0x1b7f                       
  1c65  AD9FFE76       JSR [0xfe76]                      
  1c69  FC70C4         LDD 0x70c4                        
  1c6c  3606           PSHU  B A                         
  1c6e  AD9FFEC4       JSR [0xfec4]                      
  1c72  3706           PULU  A B                         
  1c74  FD70C6         STD 0x70c6                        
  1c77  17EE3A         LBSR 0x0ab4                       
  1c7a  17EEC5         LBSR 0x0b42                       
  1c7d  17EF50         LBSR 0x0bd0                       
  1c80  17EFDB         LBSR 0x0c5e                       
  1c83  3576           PULS  A B X Y U                   
  1c85  39             RTS                               

; ---- function FUN_M74_r4_04000__1c86
FUN_M74_r4_04000__1c86:
  1c86  3476           PSHS  U Y X B A                   
  1c88  1700A2         LBSR 0x1d2d                       
  1c8b  CC0064         LDD #0x64                         
  1c8e  FD60DC         STD 0x60dc                        
  1c91  FD60DE         STD 0x60de                        
  1c94  CC1CB3         LDD #0x1cb3                       
  1c97  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  1c9b  60E3           addr 60e3                         
LAB_M74_r4_04000__1c9d:
  1c9d  C629           LDB #0x29                         
  1c9f  AD9FFC36       JSR [0xfc36]                      
  1ca3  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "l coarse"
  1ca7  6C20636F6172.. char[9] "l coarse"                
LAB_M74_r4_04000__1cb0:
  1cb0  3576           PULS  A B X Y U                   
  1cb2  39             RTS                               

; ---- function FUN_M74_r4_04000__1cb3
FUN_M74_r4_04000__1cb3:
  1cb3  3476           PSHS  U Y X B A                   
  1cb5  170075         LBSR 0x1d2d                       
  1cb8  CC1C86         LDD #0x1c86                       
  1cbb  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  1cbf  60E3           addr 60e3                         
LAB_M74_r4_04000__1cc1:
  1cc1  C629           LDB #0x29                         
  1cc3  AD9FFC36       JSR [0xfc36]                      
  1cc7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l fine "
  1ccb  206C2066696E.. char[9] " l fine "                
LAB_M74_r4_04000__1cd4:
  1cd4  3576           PULS  A B X Y U                   
  1cd6  39             RTS                               
PTR_FUN_M74_r4_04000__1d88_M74_r4_04000__1cd7:
  1cd7  1D88           addr M74_r4_04000::1d88           
  1cd9  1D5D           addr M74_r4_04000::1d5d           
  1cdb  .db 1D 39 70 A6 71 04 00 00 71 06 00 08 00 6F 00 F1  ; .9p.q...q....o..
  1ceb  .db F0 0E 10 00 01 00 05 11 1C FD 00 00 00 00 70 A8  ; ..............p.
  1cfb  .db 00 81 05 6C 65 66 74 20 70 69 74 63 68 3A 20 20  ; ...left pitch:  
  1d0b  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  1d1b  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M74_r4_04000__1d21
FUN_M74_r4_04000__1d21:
  1d21  3410           PSHS  X                           
  1d23  8E1CD7         LDX #0x1cd7                        ; desc[API_FDBC]: ->$1D88 ->$1D5D
  1d26  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1d2a  3510           PULS  X                           
  1d2c  39             RTS                               

; ---- function FUN_M74_r4_04000__1d2d
FUN_M74_r4_04000__1d2d:
  1d2d  3410           PSHS  X                           
  1d2f  8E1CD7         LDX #0x1cd7                        ; desc[API_FE6A]: ->$1D88 ->$1D5D
  1d32  AD9FFE6A       JSR [0xfe6a]                      
  1d36  3510           PULS  X                           
  1d38  39             RTS                               

; ---- function FUN_M74_r4_04000__1d39
FUN_M74_r4_04000__1d39:
  1d39  3410           PSHS  X                           
  1d3b  8E1CD7         LDX #0x1cd7                        ; desc[API_FE6C]: ->$1D88 ->$1D5D
  1d3e  AD9FFE6C       JSR [0xfe6c]                      
  1d42  3510           PULS  X                           
  1d44  39             RTS                               

; ---- function FUN_M74_r4_04000__1d45
FUN_M74_r4_04000__1d45:
  1d45  3410           PSHS  X                           
  1d47  8E1CD7         LDX #0x1cd7                        ; desc[API_FE1C]: ->$1D88 ->$1D5D
  1d4a  AD9FFE1C       JSR [0xfe1c]                      
  1d4e  3510           PULS  X                           
  1d50  39             RTS                               

; ---- function FUN_M74_r4_04000__1d51
FUN_M74_r4_04000__1d51:
  1d51  3410           PSHS  X                           
  1d53  8E1CD7         LDX #0x1cd7                        ; desc[API_FE1A]: ->$1D88 ->$1D5D $1D39
  1d56  AD9FFE1A       JSR [0xfe1a]                      
  1d5a  3510           PULS  X                           
  1d5c  39             RTS                               

; ---- function FUN_M74_r4_04000__1d5d
FUN_M74_r4_04000__1d5d:
  1d5d  3456           PSHS  U X B A                     
  1d5f  8E1CD7         LDX #0x1cd7                        ; desc[API_FE6E]: ->$1D88 ->$1D5D
  1d62  AD9FFE6E       JSR [0xfe6e]                      
  1d66  FC70CE         LDD 0x70ce                        
  1d69  3606           PSHU  B A                         
  1d6b  108E717E       LDY #0x717e                       
  1d6f  8603           LDA #0x3                          
  1d71  AD9FFC40       JSR [0xfc40]                      
  1d75  C620           LDB #0x20                         
  1d77  AD9FFC36       JSR [0xfc36]                      
  1d7b  CC0005         LDD #0x5                          
  1d7e  8E7182         LDX #0x7182                       
  1d81  AD9FFC3A       JSR [0xfc3a]                      
  1d85  3556           PULS  A B X U                     
  1d87  39             RTS                               

; ---- function FUN_M74_r4_04000__1d88
FUN_M74_r4_04000__1d88:
  1d88  3476           PSHS  U Y X B A                   
  1d8a  8E1CD7         LDX #0x1cd7                       
  1d8d  AD9FFE76       JSR [0xfe76]                      
  1d91  FC7106         LDD 0x7106                        
  1d94  3606           PSHU  B A                         
  1d96  CC0064         LDD #0x64                         
  1d99  3606           PSHU  B A                         
  1d9b  AD9FFCE6       JSR [0xfce6]                      
  1d9f  335E           LEAU -0x2,U                       
  1da1  170E9C         LBSR 0x2c40                       
  1da4  3706           PULU  A B                         
  1da6  FD70CE         STD 0x70ce                        
  1da9  CC03E8         LDD #0x3e8                        
  1dac  B370CE         SUBD 0x70ce                       
  1daf  FD7164         STD 0x7164                        
  1db2  47             ASRA                              
  1db3  56             RORB                              
  1db4  47             ASRA                              
  1db5  56             RORB                              
  1db6  F37164         ADDD 0x7164                       
  1db9  3606           PSHU  B A                         
  1dbb  AD9FFEC8       JSR [0xfec8]                      
  1dbf  3706           PULU  A B                         
  1dc1  47             ASRA                              
  1dc2  56             RORB                              
  1dc3  FD7008         STD 0x7008                        
  1dc6  FC714E         LDD 0x714e                        
  1dc9  10830000       CMPD #0x0                         
  1dcd  1027000B       LBEQ 0x1ddc                       
  1dd1  CC1000         LDD #0x1000                       
  1dd4  B37008         SUBD 0x7008                       
  1dd7  FD7008         STD 0x7008                        
  1dda  2021           BRA 0x1dfd                        
LAB_M74_r4_04000__1ddc:
  1ddc  FC7106         LDD 0x7106                        
  1ddf  108300C8       CMPD #0xc8                        
  1de3  102E0016       LBGT 0x1dfd                       
  1de7  FC7106         LDD 0x7106                        
  1dea  1083FF38       CMPD #0xff38                      
  1dee  102D000B       LBLT 0x1dfd                       
  1df2  FC7146         LDD 0x7146                        
  1df5  10830000       CMPD #0x0                         
  1df9  10270022       LBEQ 0x1e1f                       
LAB_M74_r4_04000__1dfd:
  1dfd  FC7028         LDD 0x7028                        
  1e00  3606           PSHU  B A                         
  1e02  FC7008         LDD 0x7008                        
  1e05  3606           PSHU  B A                         
  1e07  AD9FFCC8       JSR [0xfcc8]                      
  1e0b  AD9FFCF2       JSR [0xfcf2]                      
  1e0f  3706           PULU  A B                         
  1e11  FD702C         STD 0x702c                        
  1e14  F3702C         ADDD 0x702c                       
  1e17  C30001         ADDD #0x1                         
  1e1a  FD702C         STD 0x702c                        
  1e1d  2006           BRA 0x1e25                        
LAB_M74_r4_04000__1e1f:
  1e1f  FC7030         LDD 0x7030                        
  1e22  FD702C         STD 0x702c                        
LAB_M74_r4_04000__1e25:
  1e25  FC702C         LDD 0x702c                        
  1e28  10B37034       CMPD 0x7034                       
  1e2c  102E0037       LBGT 0x1e67                       
  1e30  CC000A         LDD #0xa                          
  1e33  AD9FFD20       JSR [0xfd20]                      
  1e37  108E0350       LDY #0x350                        
  1e3b  FC7008         LDD 0x7008                        
  1e3e  AD9FFD2E       JSR [0xfd2e]                      
  1e42  FC716E         LDD 0x716e                        
  1e45  10830001       CMPD #0x1                         
  1e49  10270018       LBEQ 0x1e65                       
  1e4d  CC000A         LDD #0xa                          
  1e50  AD9FFD20       JSR [0xfd20]                      
  1e54  108E0356       LDY #0x356                        
  1e58  FC702C         LDD 0x702c                        
  1e5b  AD9FFD2E       JSR [0xfd2e]                      
  1e5f  FC702C         LDD 0x702c                        
  1e62  FD7034         STD 0x7034                        
LAB_M74_r4_04000__1e65:
  1e65  202A           BRA 0x1e91                        
LAB_M74_r4_04000__1e67:
  1e67  CC000A         LDD #0xa                          
  1e6a  AD9FFD20       JSR [0xfd20]                      
  1e6e  108E0356       LDY #0x356                        
  1e72  FC702C         LDD 0x702c                        
  1e75  AD9FFD2E       JSR [0xfd2e]                      
  1e79  FC702C         LDD 0x702c                        
  1e7c  FD7034         STD 0x7034                        
  1e7f  CC000A         LDD #0xa                          
  1e82  AD9FFD20       JSR [0xfd20]                      
  1e86  108E0350       LDY #0x350                        
  1e8a  FC7008         LDD 0x7008                        
  1e8d  AD9FFD2E       JSR [0xfd2e]                      
LAB_M74_r4_04000__1e91:
  1e91  CC0001         LDD #0x1                          
  1e94  FD716C         STD 0x716c                        
  1e97  3576           PULS  A B X Y U                   
  1e99  39             RTS                               

; ---- function FUN_M74_r4_04000__1e9a
FUN_M74_r4_04000__1e9a:
  1e9a  3476           PSHS  U Y X B A                   
  1e9c  1700A2         LBSR 0x1f41                       
  1e9f  CC0064         LDD #0x64                         
  1ea2  FD60DC         STD 0x60dc                        
  1ea5  FD60DE         STD 0x60de                        
  1ea8  CC1EC7         LDD #0x1ec7                       
  1eab  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  1eaf  60E3           addr 60e3                         
LAB_M74_r4_04000__1eb1:
  1eb1  C629           LDB #0x29                         
  1eb3  AD9FFC36       JSR [0xfc36]                      
  1eb7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "r coarse"
  1ebb  7220636F6172.. char[9] "r coarse"                
LAB_M74_r4_04000__1ec4:
  1ec4  3576           PULS  A B X Y U                   
  1ec6  39             RTS                               

; ---- function FUN_M74_r4_04000__1ec7
FUN_M74_r4_04000__1ec7:
  1ec7  3476           PSHS  U Y X B A                   
  1ec9  170075         LBSR 0x1f41                       
  1ecc  CC1E9A         LDD #0x1e9a                       
  1ecf  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  1ed3  60E3           addr 60e3                         
LAB_M74_r4_04000__1ed5:
  1ed5  C629           LDB #0x29                         
  1ed7  AD9FFC36       JSR [0xfc36]                      
  1edb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " r fine "
  1edf  20722066696E.. char[9] " r fine "                
LAB_M74_r4_04000__1ee8:
  1ee8  3576           PULS  A B X Y U                   
  1eea  39             RTS                               
PTR_FUN_M74_r4_04000__1f9c_M74_r4_04000__1eeb:
  1eeb  1F9C           addr M74_r4_04000::1f9c           
  1eed  1F71           addr M74_r4_04000::1f71           
  1eef  .db 1F 4D 70 AA 71 08 00 00 71 0A 00 08 00 71 03 F1  ; .Mp.q...q....q..
  1eff  .db F0 0E 10 00 01 00 05 12 1F 11 00 00 00 00 70 AC  ; ..............p.
  1f0f  .db 00 83 05 72 69 67 68 74 20 70 69 74 63 68 3A 20  ; ...right pitch: 
  1f1f  .db 20 20 20 20 20 20 63 65 6E 74 73 2C 20 5B 20 20  ;       cents, [  
  1f2f  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M74_r4_04000__1f35
FUN_M74_r4_04000__1f35:
  1f35  3410           PSHS  X                           
  1f37  8E1EEB         LDX #0x1eeb                        ; desc[API_FDBC]: ->$1F9C ->$1F71
  1f3a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1f3e  3510           PULS  X                           
  1f40  39             RTS                               

; ---- function FUN_M74_r4_04000__1f41
FUN_M74_r4_04000__1f41:
  1f41  3410           PSHS  X                           
  1f43  8E1EEB         LDX #0x1eeb                        ; desc[API_FE6A]: ->$1F9C ->$1F71
  1f46  AD9FFE6A       JSR [0xfe6a]                      
  1f4a  3510           PULS  X                           
  1f4c  39             RTS                               

; ---- function FUN_M74_r4_04000__1f4d
FUN_M74_r4_04000__1f4d:
  1f4d  3410           PSHS  X                           
  1f4f  8E1EEB         LDX #0x1eeb                        ; desc[API_FE6C]: ->$1F9C ->$1F71
  1f52  AD9FFE6C       JSR [0xfe6c]                      
  1f56  3510           PULS  X                           
  1f58  39             RTS                               

; ---- function FUN_M74_r4_04000__1f59
FUN_M74_r4_04000__1f59:
  1f59  3410           PSHS  X                           
  1f5b  8E1EEB         LDX #0x1eeb                        ; desc[API_FE1C]: ->$1F9C ->$1F71
  1f5e  AD9FFE1C       JSR [0xfe1c]                      
  1f62  3510           PULS  X                           
  1f64  39             RTS                               

; ---- function FUN_M74_r4_04000__1f65
FUN_M74_r4_04000__1f65:
  1f65  3410           PSHS  X                           
  1f67  8E1EEB         LDX #0x1eeb                        ; desc[API_FE1A]: ->$1F9C ->$1F71 $1F4D
  1f6a  AD9FFE1A       JSR [0xfe1a]                      
  1f6e  3510           PULS  X                           
  1f70  39             RTS                               

; ---- function FUN_M74_r4_04000__1f71
FUN_M74_r4_04000__1f71:
  1f71  3456           PSHS  U X B A                     
  1f73  8E1EEB         LDX #0x1eeb                        ; desc[API_FE6E]: ->$1F9C ->$1F71
  1f76  AD9FFE6E       JSR [0xfe6e]                      
  1f7a  FC70D2         LDD 0x70d2                        
  1f7d  3606           PSHU  B A                         
  1f7f  108E717E       LDY #0x717e                       
  1f83  8603           LDA #0x3                          
  1f85  AD9FFC40       JSR [0xfc40]                      
  1f89  C620           LDB #0x20                         
  1f8b  AD9FFC36       JSR [0xfc36]                      
  1f8f  CC0005         LDD #0x5                          
  1f92  8E7182         LDX #0x7182                       
  1f95  AD9FFC3A       JSR [0xfc3a]                      
  1f99  3556           PULS  A B X U                     
  1f9b  39             RTS                               

; ---- function FUN_M74_r4_04000__1f9c
FUN_M74_r4_04000__1f9c:
  1f9c  3476           PSHS  U Y X B A                   
  1f9e  8E1EEB         LDX #0x1eeb                       
  1fa1  AD9FFE76       JSR [0xfe76]                      
  1fa5  FC710A         LDD 0x710a                        
  1fa8  3606           PSHU  B A                         
  1faa  CC0064         LDD #0x64                         
  1fad  3606           PSHU  B A                         
  1faf  AD9FFCE6       JSR [0xfce6]                      
  1fb3  335E           LEAU -0x2,U                       
  1fb5  170C88         LBSR 0x2c40                       
  1fb8  3706           PULU  A B                         
  1fba  FD70D2         STD 0x70d2                        
  1fbd  CC03E8         LDD #0x3e8                        
  1fc0  B370D2         SUBD 0x70d2                       
  1fc3  FD7164         STD 0x7164                        
  1fc6  47             ASRA                              
  1fc7  56             RORB                              
  1fc8  47             ASRA                              
  1fc9  56             RORB                              
  1fca  F37164         ADDD 0x7164                       
  1fcd  3606           PSHU  B A                         
  1fcf  AD9FFEC8       JSR [0xfec8]                      
  1fd3  3706           PULU  A B                         
  1fd5  47             ASRA                              
  1fd6  56             RORB                              
  1fd7  FD700E         STD 0x700e                        
  1fda  FC7152         LDD 0x7152                        
  1fdd  10830000       CMPD #0x0                         
  1fe1  1027000B       LBEQ 0x1ff0                       
  1fe5  CC1000         LDD #0x1000                       
  1fe8  B3700E         SUBD 0x700e                       
  1feb  FD700E         STD 0x700e                        
  1fee  2021           BRA 0x2011                        
LAB_M74_r4_04000__1ff0:
  1ff0  FC710A         LDD 0x710a                        
  1ff3  108300C8       CMPD #0xc8                        
  1ff7  102E0016       LBGT 0x2011                       
  1ffb  FC710A         LDD 0x710a                        
  1ffe  1083FF38       CMPD #0xff38                      
  2002  102D000B       LBLT 0x2011                       
  2006  FC714A         LDD 0x714a                        
  2009  10830000       CMPD #0x0                         
  200d  10270022       LBEQ 0x2033                       
LAB_M74_r4_04000__2011:
  2011  FC702A         LDD 0x702a                        
  2014  3606           PSHU  B A                         
  2016  FC700E         LDD 0x700e                        
  2019  3606           PSHU  B A                         
  201b  AD9FFCC8       JSR [0xfcc8]                      
  201f  AD9FFCF2       JSR [0xfcf2]                      
  2023  3706           PULU  A B                         
  2025  FD702E         STD 0x702e                        
  2028  F3702E         ADDD 0x702e                       
  202b  C30001         ADDD #0x1                         
  202e  FD702E         STD 0x702e                        
  2031  2006           BRA 0x2039                        
LAB_M74_r4_04000__2033:
  2033  FC7032         LDD 0x7032                        
  2036  FD702E         STD 0x702e                        
LAB_M74_r4_04000__2039:
  2039  FC702E         LDD 0x702e                        
  203c  10B37036       CMPD 0x7036                       
  2040  102E0037       LBGT 0x207b                       
  2044  CC000A         LDD #0xa                          
  2047  AD9FFD20       JSR [0xfd20]                      
  204b  108E0351       LDY #0x351                        
  204f  FC700E         LDD 0x700e                        
  2052  AD9FFD2E       JSR [0xfd2e]                      
  2056  FC7170         LDD 0x7170                        
  2059  10830001       CMPD #0x1                         
  205d  10270018       LBEQ 0x2079                       
  2061  CC000A         LDD #0xa                          
  2064  AD9FFD20       JSR [0xfd20]                      
  2068  108E0357       LDY #0x357                        
  206c  FC702E         LDD 0x702e                        
  206f  AD9FFD2E       JSR [0xfd2e]                      
  2073  FC702E         LDD 0x702e                        
  2076  FD7036         STD 0x7036                        
LAB_M74_r4_04000__2079:
  2079  202A           BRA 0x20a5                        
LAB_M74_r4_04000__207b:
  207b  CC000A         LDD #0xa                          
  207e  AD9FFD20       JSR [0xfd20]                      
  2082  108E0357       LDY #0x357                        
  2086  FC702E         LDD 0x702e                        
  2089  AD9FFD2E       JSR [0xfd2e]                      
  208d  FC702E         LDD 0x702e                        
  2090  FD7036         STD 0x7036                        
  2093  CC000A         LDD #0xa                          
  2096  AD9FFD20       JSR [0xfd20]                      
  209a  108E0351       LDY #0x351                        
  209e  FC700E         LDD 0x700e                        
  20a1  AD9FFD2E       JSR [0xfd2e]                      
LAB_M74_r4_04000__20a5:
  20a5  CC0001         LDD #0x1                          
  20a8  FD716C         STD 0x716c                        
  20ab  3576           PULS  A B X Y U                   
  20ad  39             RTS                               
PTR_FUN_M74_r4_04000__2131_M74_r4_04000__20ae:
  20ae  2131           addr M74_r4_04000::2131           
  20b0  20F8           addr M74_r4_04000::20f8           
  20b2  .db 20 EC 70 18 70 DC 00 00 70 DE 00 08 00 77 02 00  ;  .p.p...p....w..
  20c2  .db 00 02 BC 00 01 00 03 1D 21 1C 00 00 00 00 70 1A  ; ........!.....p.
  20d2  .db 00 89                                            ; ..

; ---- function FUN_M74_r4_04000__20d4
FUN_M74_r4_04000__20d4:
  20d4  3410           PSHS  X                           
  20d6  8E20AE         LDX #0x20ae                        ; desc[API_FE6A]: ->$2131 ->$20F8
  20d9  AD9FFE6A       JSR [0xfe6a]                      
  20dd  3510           PULS  X                           
  20df  39             RTS                               

; ---- function FUN_M74_r4_04000__20e0
FUN_M74_r4_04000__20e0:
  20e0  3410           PSHS  X                           
  20e2  8E20AE         LDX #0x20ae                        ; desc[API_FDBC]: ->$2131 ->$20F8
  20e5  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.. ."
  20e9  3510           PULS  X                           
  20eb  39             RTS                               

; ---- function FUN_M74_r4_04000__20ec
FUN_M74_r4_04000__20ec:
  20ec  3410           PSHS  X                           
  20ee  8E20AE         LDX #0x20ae                        ; desc[API_FE6C]: ->$2131 ->$20F8
  20f1  AD9FFE6C       JSR [0xfe6c]                      
  20f5  3510           PULS  X                           
  20f7  39             RTS                               

; ---- function FUN_M74_r4_04000__20f8
FUN_M74_r4_04000__20f8:
  20f8  3410           PSHS  X                           
  20fa  8E20AE         LDX #0x20ae                        ; desc[API_FE6E]: ->$2131 ->$20F8
  20fd  AD9FFE6E       JSR [0xfe6e]                      
  2101  3510           PULS  X                           
  2103  39             RTS                               

; ---- function FUN_M74_r4_04000__2104
FUN_M74_r4_04000__2104:
  2104  3410           PSHS  X                           
  2106  8E20AE         LDX #0x20ae                        ; desc[API_FE1C]: ->$2131 ->$20F8
  2109  AD9FFE1C       JSR [0xfe1c]                      
  210d  3510           PULS  X                           
  210f  39             RTS                               

; ---- function FUN_M74_r4_04000__2110
FUN_M74_r4_04000__2110:
  2110  3410           PSHS  X                           
  2112  8E20AE         LDX #0x20ae                        ; desc[API_FE1A]: ->$2131 ->$20F8 $20EC
  2115  AD9FFE1A       JSR [0xfe1a]                      
  2119  3510           PULS  X                           
  211b  39             RTS                               
  211c  .db 14 6C 20 64 65 6C 61 79 3A 20 20 20 20 20 6D 73  ; .l delay:     ms
  212c  .db 65 63 20 20 20                                   ; ec   

; ---- function FUN_M74_r4_04000__2131
FUN_M74_r4_04000__2131:
  2131  3476           PSHS  U Y X B A                   
  2133  8E20AE         LDX #0x20ae                       
  2136  AD9FFE76       JSR [0xfe76]                      
  213a  FC70DE         LDD 0x70de                        
  213d  3606           PSHU  B A                         
  213f  AD9FFECA       JSR [0xfeca]                      
  2143  3706           PULU  A B                         
  2145  FD7164         STD 0x7164                        
  2148  CC000A         LDD #0xa                          
  214b  AD9FFD20       JSR [0xfd20]                      
  214f  108E0358       LDY #0x358                        
  2153  FC7164         LDD 0x7164                        
  2156  AD9FFD2E       JSR [0xfd2e]                      
  215a  3576           PULS  A B X Y U                   
  215c  39             RTS                               
PTR_FUN_M74_r4_04000__21e0_M74_r4_04000__215d:
  215d  21E0           addr M74_r4_04000::21e0           
  215f  21A7           addr M74_r4_04000::21a7           
  2161  .db 21 9B 70 1C 70 E0 00 00 70 E2 00 08 00 79 05 00  ; !.p.p...p....y..
  2171  .db 00 02 BC 00 01 00 03 1D 21 CB 00 00 00 00 70 1E  ; ........!.....p.
  2181  .db 00 8B                                            ; ..

; ---- function FUN_M74_r4_04000__2183
FUN_M74_r4_04000__2183:
  2183  3410           PSHS  X                           
  2185  8E215D         LDX #0x215d                        ; desc[API_FE6A]: ->$21E0 ->$21A7
  2188  AD9FFE6A       JSR [0xfe6a]                      
  218c  3510           PULS  X                           
  218e  39             RTS                               

; ---- function FUN_M74_r4_04000__218f
FUN_M74_r4_04000__218f:
  218f  3410           PSHS  X                           
  2191  8E215D         LDX #0x215d                        ; desc[API_FDBC]: ->$21E0 ->$21A7
  2194  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..!]"
  2198  3510           PULS  X                           
  219a  39             RTS                               

; ---- function FUN_M74_r4_04000__219b
FUN_M74_r4_04000__219b:
  219b  3410           PSHS  X                           
  219d  8E215D         LDX #0x215d                        ; desc[API_FE6C]: ->$21E0 ->$21A7
  21a0  AD9FFE6C       JSR [0xfe6c]                      
  21a4  3510           PULS  X                           
  21a6  39             RTS                               

; ---- function FUN_M74_r4_04000__21a7
FUN_M74_r4_04000__21a7:
  21a7  3410           PSHS  X                           
  21a9  8E215D         LDX #0x215d                        ; desc[API_FE6E]: ->$21E0 ->$21A7
  21ac  AD9FFE6E       JSR [0xfe6e]                      
  21b0  3510           PULS  X                           
  21b2  39             RTS                               

; ---- function FUN_M74_r4_04000__21b3
FUN_M74_r4_04000__21b3:
  21b3  3410           PSHS  X                           
  21b5  8E215D         LDX #0x215d                        ; desc[API_FE1C]: ->$21E0 ->$21A7
  21b8  AD9FFE1C       JSR [0xfe1c]                      
  21bc  3510           PULS  X                           
  21be  39             RTS                               

; ---- function FUN_M74_r4_04000__21bf
FUN_M74_r4_04000__21bf:
  21bf  3410           PSHS  X                           
  21c1  8E215D         LDX #0x215d                        ; desc[API_FE1A]: ->$21E0 ->$21A7 $219B
  21c4  AD9FFE1A       JSR [0xfe1a]                      
  21c8  3510           PULS  X                           
  21ca  39             RTS                               
  21cb  .db 14 72 20 64 65 6C 61 79 3A 20 20 20 20 20 6D 73  ; .r delay:     ms
  21db  .db 65 63 20 20 20                                   ; ec   

; ---- function FUN_M74_r4_04000__21e0
FUN_M74_r4_04000__21e0:
  21e0  3476           PSHS  U Y X B A                   
  21e2  8E215D         LDX #0x215d                       
  21e5  AD9FFE76       JSR [0xfe76]                      
  21e9  FC70E2         LDD 0x70e2                        
  21ec  3606           PSHU  B A                         
  21ee  AD9FFECA       JSR [0xfeca]                      
  21f2  3706           PULU  A B                         
  21f4  FD7164         STD 0x7164                        
  21f7  CC000A         LDD #0xa                          
  21fa  AD9FFD20       JSR [0xfd20]                      
  21fe  108E0359       LDY #0x359                        
  2202  FC7164         LDD 0x7164                        
  2205  AD9FFD2E       JSR [0xfd2e]                      
  2209  3576           PULS  A B X Y U                   
  220b  39             RTS                               
PTR_FUN_M74_r4_04000__228f_M74_r4_04000__220c:
  220c  228F           addr M74_r4_04000::228f           
  220e  2256           addr M74_r4_04000::2256           
  2210  .db 22 4A 70 10 70 D4 00 00 70 D6 00 08 00 73 01 00  ; "Jp.p...p....s..
  2220  .db 00 02 A3 00 01 00 03 22 22 7A 00 00 00 00 70 12  ; .......""z....p.
  2230  .db 00 85                                            ; ..

; ---- function FUN_M74_r4_04000__2232
FUN_M74_r4_04000__2232:
  2232  3410           PSHS  X                           
  2234  8E220C         LDX #0x220c                        ; desc[API_FE6A]: ->$228F ->$2256
  2237  AD9FFE6A       JSR [0xfe6a]                      
  223b  3510           PULS  X                           
  223d  39             RTS                               

; ---- function FUN_M74_r4_04000__223e
FUN_M74_r4_04000__223e:
  223e  3410           PSHS  X                           
  2240  8E220C         LDX #0x220c                        ; desc[API_FDBC]: ->$228F ->$2256
  2243  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.."."
  2247  3510           PULS  X                           
  2249  39             RTS                               

; ---- function FUN_M74_r4_04000__224a
FUN_M74_r4_04000__224a:
  224a  3410           PSHS  X                           
  224c  8E220C         LDX #0x220c                        ; desc[API_FE6C]: ->$228F ->$2256
  224f  AD9FFE6C       JSR [0xfe6c]                      
  2253  3510           PULS  X                           
  2255  39             RTS                               

; ---- function FUN_M74_r4_04000__2256
FUN_M74_r4_04000__2256:
  2256  3410           PSHS  X                           
  2258  8E220C         LDX #0x220c                        ; desc[API_FE6E]: ->$228F ->$2256
  225b  AD9FFE6E       JSR [0xfe6e]                      
  225f  3510           PULS  X                           
  2261  39             RTS                               

; ---- function FUN_M74_r4_04000__2262
FUN_M74_r4_04000__2262:
  2262  3410           PSHS  X                           
  2264  8E220C         LDX #0x220c                        ; desc[API_FE1C]: ->$228F ->$2256
  2267  AD9FFE1C       JSR [0xfe1c]                      
  226b  3510           PULS  X                           
  226d  39             RTS                               

; ---- function FUN_M74_r4_04000__226e
FUN_M74_r4_04000__226e:
  226e  3410           PSHS  X                           
  2270  8E220C         LDX #0x220c                        ; desc[API_FE1A]: ->$228F ->$2256 $224A
  2273  AD9FFE1A       JSR [0xfe1a]                      
  2277  3510           PULS  X                           
  2279  39             RTS                               
  227a  .db 14 6C 20 70 69 74 63 68 20 64 65 6C 61 79 3A 20  ; .l pitch delay: 
  228a  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M74_r4_04000__228f
FUN_M74_r4_04000__228f:
  228f  3476           PSHS  U Y X B A                   
  2291  8E220C         LDX #0x220c                       
  2294  AD9FFE76       JSR [0xfe76]                      
  2298  CC0000         LDD #0x0                          
  229b  3606           PSHU  B A                         
  229d  CC02A3         LDD #0x2a3                        
  22a0  B370EA         SUBD 0x70ea                       
  22a3  3606           PSHU  B A                         
  22a5  FC70D6         LDD 0x70d6                        
  22a8  3606           PSHU  B A                         
  22aa  AD9FFCD8       JSR [0xfcd8]                      
  22ae  AD9FFECA       JSR [0xfeca]                      
  22b2  3706           PULU  A B                         
  22b4  F370B8         ADDD 0x70b8                       
  22b7  FD70AE         STD 0x70ae                        
  22ba  F370B6         ADDD 0x70b6                       
  22bd  FD70B2         STD 0x70b2                        
  22c0  CC000A         LDD #0xa                          
  22c3  AD9FFD20       JSR [0xfd20]                      
  22c7  108E0352       LDY #0x352                        
  22cb  FC70AE         LDD 0x70ae                        
  22ce  AD9FFD2E       JSR [0xfd2e]                      
  22d2  CC000A         LDD #0xa                          
  22d5  AD9FFD20       JSR [0xfd20]                      
  22d9  108E0354       LDY #0x354                        
  22dd  FC70B2         LDD 0x70b2                        
  22e0  AD9FFD2E       JSR [0xfd2e]                      
  22e4  FC714E         LDD 0x714e                        
  22e7  10830001       CMPD #0x1                         
  22eb  10270046       LBEQ 0x2335                       
  22ef  FC7106         LDD 0x7106                        
  22f2  108300C8       CMPD #0xc8                        
  22f6  102E003B       LBGT 0x2335                       
  22fa  FC7106         LDD 0x7106                        
  22fd  1083FF38       CMPD #0xff38                      
  2301  102D0030       LBLT 0x2335                       
  2305  FC7146         LDD 0x7146                        
  2308  10830000       CMPD #0x0                         
  230c  10270025       LBEQ 0x2335                       
  2310  CC000A         LDD #0xa                          
  2313  AD9FFD20       JSR [0xfd20]                      
  2317  108E0356       LDY #0x356                        
  231b  FC7030         LDD 0x7030                        
  231e  AD9FFD2E       JSR [0xfd2e]                      
  2322  FC7030         LDD 0x7030                        
  2325  FD7034         STD 0x7034                        
  2328  CC0001         LDD #0x1                          
  232b  FD716E         STD 0x716e                        
  232e  FC01AD         LDD 0x01ad                        
  2331  AD9FFCC2       JSR [0xfcc2]                      
LAB_M74_r4_04000__2335:
  2335  CC0001         LDD #0x1                          
  2338  FD716C         STD 0x716c                        
  233b  3576           PULS  A B X Y U                   
  233d  39             RTS                               

; ---- function FUN_M74_r4_04000__233e
FUN_M74_r4_04000__233e:
  233e  3476           PSHS  U Y X B A                   
  2340  CC0000         LDD #0x0                          
  2343  FD716E         STD 0x716e                        
  2346  CC000A         LDD #0xa                          
  2349  AD9FFD20       JSR [0xfd20]                      
  234d  108E0356       LDY #0x356                        
  2351  FC702C         LDD 0x702c                        
  2354  AD9FFD2E       JSR [0xfd2e]                      
  2358  FC702C         LDD 0x702c                        
  235b  FD7034         STD 0x7034                        
  235e  3576           PULS  A B X Y U                   
  2360  39             RTS                               
PTR_FUN_M74_r4_04000__23e4_M74_r4_04000__2361:
  2361  23E4           addr M74_r4_04000::23e4           
  2363  23AB           addr M74_r4_04000::23ab           
  2365  .db 23 9F 70 14 70 D8 00 00 70 DA 00 08 00 75 04 00  ; #.p.p...p....u..
  2375  .db 00 02 A3 00 01 00 03 22 23 CF 00 00 00 00 70 16  ; ......."#.....p.
  2385  .db 00 87                                            ; ..

; ---- function FUN_M74_r4_04000__2387
FUN_M74_r4_04000__2387:
  2387  3410           PSHS  X                           
  2389  8E2361         LDX #0x2361                        ; desc[API_FE6A]: ->$23E4 ->$23AB
  238c  AD9FFE6A       JSR [0xfe6a]                      
  2390  3510           PULS  X                           
  2392  39             RTS                               

; ---- function FUN_M74_r4_04000__2393
FUN_M74_r4_04000__2393:
  2393  3410           PSHS  X                           
  2395  8E2361         LDX #0x2361                        ; desc[API_FDBC]: ->$23E4 ->$23AB
  2398  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..#a"
  239c  3510           PULS  X                           
  239e  39             RTS                               

; ---- function FUN_M74_r4_04000__239f
FUN_M74_r4_04000__239f:
  239f  3410           PSHS  X                           
  23a1  8E2361         LDX #0x2361                        ; desc[API_FE6C]: ->$23E4 ->$23AB
  23a4  AD9FFE6C       JSR [0xfe6c]                      
  23a8  3510           PULS  X                           
  23aa  39             RTS                               

; ---- function FUN_M74_r4_04000__23ab
FUN_M74_r4_04000__23ab:
  23ab  3410           PSHS  X                           
  23ad  8E2361         LDX #0x2361                        ; desc[API_FE6E]: ->$23E4 ->$23AB
  23b0  AD9FFE6E       JSR [0xfe6e]                      
  23b4  3510           PULS  X                           
  23b6  39             RTS                               

; ---- function FUN_M74_r4_04000__23b7
FUN_M74_r4_04000__23b7:
  23b7  3410           PSHS  X                           
  23b9  8E2361         LDX #0x2361                        ; desc[API_FE1C]: ->$23E4 ->$23AB
  23bc  AD9FFE1C       JSR [0xfe1c]                      
  23c0  3510           PULS  X                           
  23c2  39             RTS                               

; ---- function FUN_M74_r4_04000__23c3
FUN_M74_r4_04000__23c3:
  23c3  3410           PSHS  X                           
  23c5  8E2361         LDX #0x2361                        ; desc[API_FE1A]: ->$23E4 ->$23AB $239F
  23c8  AD9FFE1A       JSR [0xfe1a]                      
  23cc  3510           PULS  X                           
  23ce  39             RTS                               
  23cf  .db 14 72 20 70 69 74 63 68 20 64 65 6C 61 79 3A 20  ; .r pitch delay: 
  23df  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M74_r4_04000__23e4
FUN_M74_r4_04000__23e4:
  23e4  3476           PSHS  U Y X B A                   
  23e6  8E2361         LDX #0x2361                       
  23e9  AD9FFE76       JSR [0xfe76]                      
  23ed  CC0000         LDD #0x0                          
  23f0  3606           PSHU  B A                         
  23f2  CC02A3         LDD #0x2a3                        
  23f5  B370EE         SUBD 0x70ee                       
  23f8  3606           PSHU  B A                         
  23fa  FC70DA         LDD 0x70da                        
  23fd  3606           PSHU  B A                         
  23ff  AD9FFCD8       JSR [0xfcd8]                      
  2403  AD9FFECA       JSR [0xfeca]                      
  2407  3706           PULU  A B                         
  2409  F370BC         ADDD 0x70bc                       
  240c  FD70B0         STD 0x70b0                        
  240f  F370BA         ADDD 0x70ba                       
  2412  FD70B4         STD 0x70b4                        
  2415  CC000A         LDD #0xa                          
  2418  AD9FFD20       JSR [0xfd20]                      
  241c  108E0353       LDY #0x353                        
  2420  FC70B0         LDD 0x70b0                        
  2423  AD9FFD2E       JSR [0xfd2e]                      
  2427  CC000A         LDD #0xa                          
  242a  AD9FFD20       JSR [0xfd20]                      
  242e  108E0355       LDY #0x355                        
  2432  FC70B4         LDD 0x70b4                        
  2435  AD9FFD2E       JSR [0xfd2e]                      
  2439  FC7152         LDD 0x7152                        
  243c  10830001       CMPD #0x1                         
  2440  10270046       LBEQ 0x248a                       
  2444  FC710A         LDD 0x710a                        
  2447  108300C8       CMPD #0xc8                        
  244b  102E003B       LBGT 0x248a                       
  244f  FC710A         LDD 0x710a                        
  2452  1083FF38       CMPD #0xff38                      
  2456  102D0030       LBLT 0x248a                       
  245a  FC714A         LDD 0x714a                        
  245d  10830000       CMPD #0x0                         
  2461  10270025       LBEQ 0x248a                       
  2465  CC000A         LDD #0xa                          
  2468  AD9FFD20       JSR [0xfd20]                      
  246c  108E0357       LDY #0x357                        
  2470  FC7032         LDD 0x7032                        
  2473  AD9FFD2E       JSR [0xfd2e]                      
  2477  FC7032         LDD 0x7032                        
  247a  FD7036         STD 0x7036                        
  247d  CC0001         LDD #0x1                          
  2480  FD7170         STD 0x7170                        
  2483  FC01AD         LDD 0x01ad                        
  2486  AD9FFCC4       JSR [0xfcc4]                      
LAB_M74_r4_04000__248a:
  248a  CC0001         LDD #0x1                          
  248d  FD716C         STD 0x716c                        
  2490  3576           PULS  A B X Y U                   
  2492  39             RTS                               

; ---- function FUN_M74_r4_04000__2493
FUN_M74_r4_04000__2493:
  2493  3476           PSHS  U Y X B A                   
  2495  CC0000         LDD #0x0                          
  2498  FD7170         STD 0x7170                        
  249b  CC000A         LDD #0xa                          
  249e  AD9FFD20       JSR [0xfd20]                      
  24a2  108E0357       LDY #0x357                        
  24a6  FC702E         LDD 0x702e                        
  24a9  AD9FFD2E       JSR [0xfd2e]                      
  24ad  FC702E         LDD 0x702e                        
  24b0  FD7036         STD 0x7036                        
  24b3  3576           PULS  A B X Y U                   
  24b5  39             RTS                               
PTR_FUN_M74_r4_04000__2588_M74_r4_04000__24b6:
  24b6  2588           addr M74_r4_04000::2588           
  24b8  253D           addr M74_r4_04000::253d           
  24ba  .db 25 19 70 20 70 E8 00 00 70 EA 00 08 00 7B 20 00  ; %.p p...p....{ .
  24ca  .db 01 02 A3 00 01 00 04 11 24 DC 00 00 00 00 70 22  ; ........$.....p"
  24da  .db 00 8D 04 6C 20 6D 61 78 20 73 70 6C 69 63 65 3A  ; ...l max splice:
  24ea  .db 20 20 20 20 20 6D 73 20 20 20 20 20 20 20 20 20  ;      ms         
  24fa  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M74_r4_04000__2501
FUN_M74_r4_04000__2501:
  2501  3410           PSHS  X                           
  2503  8E24B6         LDX #0x24b6                        ; desc[API_FDBC]: ->$2588 ->$253D
  2506  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$."
  250a  3510           PULS  X                           
  250c  39             RTS                               

; ---- function FUN_M74_r4_04000__250d
FUN_M74_r4_04000__250d:
  250d  3410           PSHS  X                           
  250f  8E24B6         LDX #0x24b6                        ; desc[API_FE6A]: ->$2588 ->$253D
  2512  AD9FFE6A       JSR [0xfe6a]                      
  2516  3510           PULS  X                           
  2518  39             RTS                               

; ---- function FUN_M74_r4_04000__2519
FUN_M74_r4_04000__2519:
  2519  3410           PSHS  X                           
  251b  8E24B6         LDX #0x24b6                        ; desc[API_FE6C]: ->$2588 ->$253D
  251e  AD9FFE6C       JSR [0xfe6c]                      
  2522  3510           PULS  X                           
  2524  39             RTS                               

; ---- function FUN_M74_r4_04000__2525
FUN_M74_r4_04000__2525:
  2525  3410           PSHS  X                           
  2527  8E24B6         LDX #0x24b6                        ; desc[API_FE1C]: ->$2588 ->$253D
  252a  AD9FFE1C       JSR [0xfe1c]                      
  252e  3510           PULS  X                           
  2530  39             RTS                               

; ---- function FUN_M74_r4_04000__2531
FUN_M74_r4_04000__2531:
  2531  3410           PSHS  X                           
  2533  8E24B6         LDX #0x24b6                        ; desc[API_FE1A]: ->$2588 ->$253D $2519
  2536  AD9FFE1A       JSR [0xfe1a]                      
  253a  3510           PULS  X                           
  253c  39             RTS                               

; ---- function FUN_M74_r4_04000__253d
FUN_M74_r4_04000__253d:
  253d  3456           PSHS  U X B A                     
  253f  8E24B6         LDX #0x24b6                        ; desc[API_FE6E]: ->$2588 ->$253D
  2542  AD9FFE6E       JSR [0xfe6e]                      
  2546  FC70B6         LDD 0x70b6                        
  2549  10B32586       CMPD 0x2586                       
  254d  2D1B           BLT 0x256a                        
  254f  C619           LDB #0x19                         
  2551  AD9FFC36       JSR [0xfc36]                      
  2555  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "-deglitch off-"
  2559  2D6465676C69.. char[15] "-deglitch off-"         
LAB_M74_r4_04000__2568:
  2568  2019           BRA 0x2583                        
LAB_M74_r4_04000__256a:
  256a  C619           LDB #0x19                         
  256c  AD9FFC36       JSR [0xfc36]                      
  2570  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "              "
  2574  202020202020.. char[15] "              "         
LAB_M74_r4_04000__2583:
  2583  3556           PULS  A B X U                     
  2585  39             RTS                               
DAT_M74_r4_04000__2586:
  2586  0780           undefined2 0780h                  

; ---- function FUN_M74_r4_04000__2588
FUN_M74_r4_04000__2588:
  2588  3476           PSHS  U Y X B A                   
  258a  8E24B6         LDX #0x24b6                       
  258d  AD9FFE76       JSR [0xfe76]                      
  2591  FC70EA         LDD 0x70ea                        
  2594  3606           PSHU  B A                         
  2596  AD9FFECA       JSR [0xfeca]                      
  259a  3706           PULU  A B                         
  259c  FD70B6         STD 0x70b6                        
  259f  10B32586       CMPD 0x2586                       
  25a3  2D03           BLT 0x25a8                        
  25a5  FC2586         LDD 0x2586                        
LAB_M74_r4_04000__25a8:
  25a8  FD70B8         STD 0x70b8                        
  25ab  47             ASRA                              
  25ac  56             RORB                              
  25ad  830003         SUBD #0x3                         
  25b0  FD70BE         STD 0x70be                        
  25b3  CC7FFF         LDD #0x7fff                       
  25b6  3606           PSHU  B A                         
  25b8  FC70BE         LDD 0x70be                        
  25bb  3606           PSHU  B A                         
  25bd  AD9FFCEA       JSR [0xfcea]                      
  25c1  CC000C         LDD #0xc                          
  25c4  3606           PSHU  B A                         
  25c6  AD9FFCEE       JSR [0xfcee]                      
  25ca  3706           PULU  A B                         
  25cc  FD7028         STD 0x7028                        
  25cf  44             LSRA                              
  25d0  56             RORB                              
  25d1  44             LSRA                              
  25d2  56             RORB                              
  25d3  44             LSRA                              
  25d4  56             RORB                              
  25d5  44             LSRA                              
  25d6  56             RORB                              
  25d7  44             LSRA                              
  25d8  56             RORB                              
  25d9  44             LSRA                              
  25da  56             RORB                              
  25db  FD7030         STD 0x7030                        
  25de  CC0001         LDD #0x1                          
  25e1  FD716C         STD 0x716c                        
  25e4  17FCA8         LBSR 0x228f                       
  25e7  17F79E         LBSR 0x1d88                       
  25ea  3576           PULS  A B X Y U                   
  25ec  39             RTS                               
PTR_FUN_M74_r4_04000__26bd_M74_r4_04000__25ed:
  25ed  26BD           addr M74_r4_04000::26bd           
  25ef  2674           addr M74_r4_04000::2674           
  25f1  .db 26 50 70 24 70 EC 00 00 70 EE 00 08 00 7D 24 00  ; &Pp$p...p....}$.
  2601  .db 01 02 A3 00 01 00 04 11 26 13 00 00 00 00 70 26  ; ........&.....p&
  2611  .db 00 8F 04 72 20 6D 61 78 20 73 70 6C 69 63 65 3A  ; ...r max splice:
  2621  .db 20 20 20 20 20 6D 73 20 20 20 20 20 20 20 20 20  ;      ms         
  2631  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M74_r4_04000__2638
FUN_M74_r4_04000__2638:
  2638  3410           PSHS  X                           
  263a  8E25ED         LDX #0x25ed                        ; desc[API_FDBC]: ->$26BD ->$2674
  263d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..%."
  2641  3510           PULS  X                           
  2643  39             RTS                               

; ---- function FUN_M74_r4_04000__2644
FUN_M74_r4_04000__2644:
  2644  3410           PSHS  X                           
  2646  8E25ED         LDX #0x25ed                        ; desc[API_FE6A]: ->$26BD ->$2674
  2649  AD9FFE6A       JSR [0xfe6a]                      
  264d  3510           PULS  X                           
  264f  39             RTS                               

; ---- function FUN_M74_r4_04000__2650
FUN_M74_r4_04000__2650:
  2650  3410           PSHS  X                           
  2652  8E25ED         LDX #0x25ed                        ; desc[API_FE6C]: ->$26BD ->$2674
  2655  AD9FFE6C       JSR [0xfe6c]                      
  2659  3510           PULS  X                           
  265b  39             RTS                               

; ---- function FUN_M74_r4_04000__265c
FUN_M74_r4_04000__265c:
  265c  3410           PSHS  X                           
  265e  8E25ED         LDX #0x25ed                        ; desc[API_FE1C]: ->$26BD ->$2674
  2661  AD9FFE1C       JSR [0xfe1c]                      
  2665  3510           PULS  X                           
  2667  39             RTS                               

; ---- function FUN_M74_r4_04000__2668
FUN_M74_r4_04000__2668:
  2668  3410           PSHS  X                           
  266a  8E25ED         LDX #0x25ed                        ; desc[API_FE1A]: ->$26BD ->$2674 $2650
  266d  AD9FFE1A       JSR [0xfe1a]                      
  2671  3510           PULS  X                           
  2673  39             RTS                               

; ---- function FUN_M74_r4_04000__2674
FUN_M74_r4_04000__2674:
  2674  3456           PSHS  U X B A                     
  2676  8E25ED         LDX #0x25ed                        ; desc[API_FE6E]: ->$26BD ->$2674
  2679  AD9FFE6E       JSR [0xfe6e]                      
  267d  FC70BA         LDD 0x70ba                        
  2680  10B32586       CMPD 0x2586                       
  2684  2D1B           BLT 0x26a1                        
  2686  C619           LDB #0x19                         
  2688  AD9FFC36       JSR [0xfc36]                      
  268c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "-deglitch off-"
  2690  2D6465676C69.. char[15] "-deglitch off-"         
LAB_M74_r4_04000__269f:
  269f  2019           BRA 0x26ba                        
LAB_M74_r4_04000__26a1:
  26a1  C619           LDB #0x19                         
  26a3  AD9FFC36       JSR [0xfc36]                      
  26a7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "              "
  26ab  202020202020.. char[15] "              "         
LAB_M74_r4_04000__26ba:
  26ba  3556           PULS  A B X U                     
  26bc  39             RTS                               

; ---- function FUN_M74_r4_04000__26bd
FUN_M74_r4_04000__26bd:
  26bd  3476           PSHS  U Y X B A                   
  26bf  8E25ED         LDX #0x25ed                       
  26c2  AD9FFE76       JSR [0xfe76]                      
  26c6  FC70EE         LDD 0x70ee                        
  26c9  3606           PSHU  B A                         
  26cb  AD9FFECA       JSR [0xfeca]                      
  26cf  3706           PULU  A B                         
  26d1  FD70BA         STD 0x70ba                        
  26d4  10B32586       CMPD 0x2586                       
  26d8  2D03           BLT 0x26dd                        
  26da  FC2586         LDD 0x2586                        
LAB_M74_r4_04000__26dd:
  26dd  FD70BC         STD 0x70bc                        
  26e0  47             ASRA                              
  26e1  56             RORB                              
  26e2  830003         SUBD #0x3                         
  26e5  FD70C0         STD 0x70c0                        
  26e8  CC7FFF         LDD #0x7fff                       
  26eb  3606           PSHU  B A                         
  26ed  FC70C0         LDD 0x70c0                        
  26f0  3606           PSHU  B A                         
  26f2  AD9FFCEA       JSR [0xfcea]                      
  26f6  CC000C         LDD #0xc                          
  26f9  3606           PSHU  B A                         
  26fb  AD9FFCEE       JSR [0xfcee]                      
  26ff  3706           PULU  A B                         
  2701  FD702A         STD 0x702a                        
  2704  44             LSRA                              
  2705  56             RORB                              
  2706  44             LSRA                              
  2707  56             RORB                              
  2708  44             LSRA                              
  2709  56             RORB                              
  270a  44             LSRA                              
  270b  56             RORB                              
  270c  44             LSRA                              
  270d  56             RORB                              
  270e  44             LSRA                              
  270f  56             RORB                              
  2710  FD7032         STD 0x7032                        
  2713  CC0001         LDD #0x1                          
  2716  FD716C         STD 0x716c                        
  2719  17FCC8         LBSR 0x23e4                       
  271c  17F87D         LBSR 0x1f9c                       
  271f  3576           PULS  A B X Y U                   
  2721  39             RTS                               
PTR_FUN_M74_r4_04000__278d_M74_r4_04000__2722:
  2722  278D           addr M74_r4_04000::278d           
  2724  276C           addr M74_r4_04000::276c           
  2726  .db 27 60 70 42 70 F4 00 00 70 F6 00 08 00 A1 15 FF  ; '`pBp...p.......
  2736  .db 9C 00 64 00 01 00 04 21 27 78 00 00 00 00 00 00  ; ..d....!'x......
  2746  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2748
FUN_M74_r4_04000__2748:
  2748  3410           PSHS  X                           
  274a  8E2722         LDX #0x2722                        ; desc[API_FE6A]: ->$278D ->$276C
  274d  AD9FFE6A       JSR [0xfe6a]                      
  2751  3510           PULS  X                           
  2753  39             RTS                               

; ---- function FUN_M74_r4_04000__2754
FUN_M74_r4_04000__2754:
  2754  3410           PSHS  X                           
  2756  8E2722         LDX #0x2722                        ; desc[API_FDBC]: ->$278D ->$276C
  2759  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..'""
  275d  3510           PULS  X                           
  275f  39             RTS                               

; ---- function FUN_M74_r4_04000__2760
FUN_M74_r4_04000__2760:
  2760  3410           PSHS  X                           
  2762  8E2722         LDX #0x2722                        ; desc[API_FE6C]: ->$278D ->$276C
  2765  AD9FFE6C       JSR [0xfe6c]                      
  2769  3510           PULS  X                           
  276b  39             RTS                               

; ---- function FUN_M74_r4_04000__276c
FUN_M74_r4_04000__276c:
  276c  3410           PSHS  X                           
  276e  8E2722         LDX #0x2722                        ; desc[API_FE6E]: ->$278D ->$276C
  2771  AD9FFE6E       JSR [0xfe6e]                      
  2775  3510           PULS  X                           
  2777  39             RTS                               
  2778  .db 14 6C 20 66 65 65 64 62 61 63 6B 20 31 3A 20 20  ; .l feedback 1:  
  2788  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M74_r4_04000__278d
FUN_M74_r4_04000__278d:
  278d  3476           PSHS  U Y X B A                   
  278f  8E2722         LDX #0x2722                       
  2792  AD9FFE76       JSR [0xfe76]                      
  2796  FC70F6         LDD 0x70f6                        
  2799  3606           PSHU  B A                         
  279b  AD9FFEC4       JSR [0xfec4]                      
  279f  FC703C         LDD 0x703c                        
  27a2  3606           PSHU  B A                         
  27a4  AD9FFCF2       JSR [0xfcf2]                      
  27a8  3706           PULU  A B                         
  27aa  FD7164         STD 0x7164                        
  27ad  CC000A         LDD #0xa                          
  27b0  AD9FFD20       JSR [0xfd20]                      
  27b4  108E035E       LDY #0x35e                        
  27b8  FC7164         LDD 0x7164                        
  27bb  AD9FFD2E       JSR [0xfd2e]                      
  27bf  3576           PULS  A B X Y U                   
  27c1  39             RTS                               
PTR_FUN_M74_r4_04000__282d_M74_r4_04000__27c2:
  27c2  282D           addr M74_r4_04000::282d           
  27c4  280C           addr M74_r4_04000::280c           
  27c6  .db 28 00 70 46 70 F8 00 00 70 FA 00 08 00 A3 16 FF  ; (.pFp...p.......
  27d6  .db 9C 00 64 00 01 00 04 21 28 18 00 00 00 00 00 00  ; ..d....!(.......
  27e6  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__27e8
FUN_M74_r4_04000__27e8:
  27e8  3410           PSHS  X                           
  27ea  8E27C2         LDX #0x27c2                        ; desc[API_FE6A]: ->$282D ->$280C
  27ed  AD9FFE6A       JSR [0xfe6a]                      
  27f1  3510           PULS  X                           
  27f3  39             RTS                               

; ---- function FUN_M74_r4_04000__27f4
FUN_M74_r4_04000__27f4:
  27f4  3410           PSHS  X                           
  27f6  8E27C2         LDX #0x27c2                        ; desc[API_FDBC]: ->$282D ->$280C
  27f9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..'."
  27fd  3510           PULS  X                           
  27ff  39             RTS                               

; ---- function FUN_M74_r4_04000__2800
FUN_M74_r4_04000__2800:
  2800  3410           PSHS  X                           
  2802  8E27C2         LDX #0x27c2                        ; desc[API_FE6C]: ->$282D ->$280C
  2805  AD9FFE6C       JSR [0xfe6c]                      
  2809  3510           PULS  X                           
  280b  39             RTS                               

; ---- function FUN_M74_r4_04000__280c
FUN_M74_r4_04000__280c:
  280c  3410           PSHS  X                           
  280e  8E27C2         LDX #0x27c2                        ; desc[API_FE6E]: ->$282D ->$280C
  2811  AD9FFE6E       JSR [0xfe6e]                      
  2815  3510           PULS  X                           
  2817  39             RTS                               
  2818  .db 14 6C 20 66 65 65 64 62 61 63 6B 20 32 3A 20 20  ; .l feedback 2:  
  2828  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M74_r4_04000__282d
FUN_M74_r4_04000__282d:
  282d  3476           PSHS  U Y X B A                   
  282f  8E27C2         LDX #0x27c2                       
  2832  AD9FFE76       JSR [0xfe76]                      
  2836  FC70FA         LDD 0x70fa                        
  2839  3606           PSHU  B A                         
  283b  AD9FFEC4       JSR [0xfec4]                      
  283f  FC703C         LDD 0x703c                        
  2842  3606           PSHU  B A                         
  2844  AD9FFCF2       JSR [0xfcf2]                      
  2848  3706           PULU  A B                         
  284a  FD7164         STD 0x7164                        
  284d  CC000A         LDD #0xa                          
  2850  AD9FFD20       JSR [0xfd20]                      
  2854  108E0360       LDY #0x360                        
  2858  FC7164         LDD 0x7164                        
  285b  AD9FFD2E       JSR [0xfd2e]                      
  285f  3576           PULS  A B X Y U                   
  2861  39             RTS                               
PTR_FUN_M74_r4_04000__28cd_M74_r4_04000__2862:
  2862  28CD           addr M74_r4_04000::28cd           
  2864  28AC           addr M74_r4_04000::28ac           
  2866  .db 28 A0 70 4A 70 FC 00 00 70 FE 00 08 00 A5 19 FF  ; (.pJp...p.......
  2876  .db 9C 00 64 00 01 00 04 21 28 B8 00 00 00 00 00 00  ; ..d....!(.......
  2886  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2888
FUN_M74_r4_04000__2888:
  2888  3410           PSHS  X                           
  288a  8E2862         LDX #0x2862                        ; desc[API_FE6A]: ->$28CD ->$28AC
  288d  AD9FFE6A       JSR [0xfe6a]                      
  2891  3510           PULS  X                           
  2893  39             RTS                               

; ---- function FUN_M74_r4_04000__2894
FUN_M74_r4_04000__2894:
  2894  3410           PSHS  X                           
  2896  8E2862         LDX #0x2862                        ; desc[API_FDBC]: ->$28CD ->$28AC
  2899  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..(b"
  289d  3510           PULS  X                           
  289f  39             RTS                               

; ---- function FUN_M74_r4_04000__28a0
FUN_M74_r4_04000__28a0:
  28a0  3410           PSHS  X                           
  28a2  8E2862         LDX #0x2862                        ; desc[API_FE6C]: ->$28CD ->$28AC
  28a5  AD9FFE6C       JSR [0xfe6c]                      
  28a9  3510           PULS  X                           
  28ab  39             RTS                               

; ---- function FUN_M74_r4_04000__28ac
FUN_M74_r4_04000__28ac:
  28ac  3410           PSHS  X                           
  28ae  8E2862         LDX #0x2862                        ; desc[API_FE6E]: ->$28CD ->$28AC
  28b1  AD9FFE6E       JSR [0xfe6e]                      
  28b5  3510           PULS  X                           
  28b7  39             RTS                               
  28b8  .db 14 72 20 66 65 65 64 62 61 63 6B 20 31 3A 20 20  ; .r feedback 1:  
  28c8  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M74_r4_04000__28cd
FUN_M74_r4_04000__28cd:
  28cd  3476           PSHS  U Y X B A                   
  28cf  8E2862         LDX #0x2862                       
  28d2  AD9FFE76       JSR [0xfe76]                      
  28d6  FC70FE         LDD 0x70fe                        
  28d9  3606           PSHU  B A                         
  28db  AD9FFEC4       JSR [0xfec4]                      
  28df  FC703C         LDD 0x703c                        
  28e2  3606           PSHU  B A                         
  28e4  AD9FFCF2       JSR [0xfcf2]                      
  28e8  3706           PULU  A B                         
  28ea  FD7164         STD 0x7164                        
  28ed  CC000A         LDD #0xa                          
  28f0  AD9FFD20       JSR [0xfd20]                      
  28f4  108E035F       LDY #0x35f                        
  28f8  FC7164         LDD 0x7164                        
  28fb  AD9FFD2E       JSR [0xfd2e]                      
  28ff  3576           PULS  A B X Y U                   
  2901  39             RTS                               
PTR_FUN_M74_r4_04000__296d_M74_r4_04000__2902:
  2902  296D           addr M74_r4_04000::296d           
  2904  294C           addr M74_r4_04000::294c           
  2906  .db 29 40 70 4E 71 00 00 00 71 02 00 08 00 A7 1A FF  ; )@pNq...q.......
  2916  .db 9C 00 64 00 01 00 04 21 29 58 00 00 00 00 00 00  ; ..d....!)X......
  2926  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2928
FUN_M74_r4_04000__2928:
  2928  3410           PSHS  X                           
  292a  8E2902         LDX #0x2902                        ; desc[API_FE6A]: ->$296D ->$294C
  292d  AD9FFE6A       JSR [0xfe6a]                      
  2931  3510           PULS  X                           
  2933  39             RTS                               

; ---- function FUN_M74_r4_04000__2934
FUN_M74_r4_04000__2934:
  2934  3410           PSHS  X                           
  2936  8E2902         LDX #0x2902                        ; desc[API_FDBC]: ->$296D ->$294C
  2939  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)."
  293d  3510           PULS  X                           
  293f  39             RTS                               

; ---- function FUN_M74_r4_04000__2940
FUN_M74_r4_04000__2940:
  2940  3410           PSHS  X                           
  2942  8E2902         LDX #0x2902                        ; desc[API_FE6C]: ->$296D ->$294C
  2945  AD9FFE6C       JSR [0xfe6c]                      
  2949  3510           PULS  X                           
  294b  39             RTS                               

; ---- function FUN_M74_r4_04000__294c
FUN_M74_r4_04000__294c:
  294c  3410           PSHS  X                           
  294e  8E2902         LDX #0x2902                        ; desc[API_FE6E]: ->$296D ->$294C
  2951  AD9FFE6E       JSR [0xfe6e]                      
  2955  3510           PULS  X                           
  2957  39             RTS                               
  2958  .db 14 72 20 66 65 65 64 62 61 63 6B 20 32 3A 20 20  ; .r feedback 2:  
  2968  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M74_r4_04000__296d
FUN_M74_r4_04000__296d:
  296d  3476           PSHS  U Y X B A                   
  296f  8E2902         LDX #0x2902                       
  2972  AD9FFE76       JSR [0xfe76]                      
  2976  FC7102         LDD 0x7102                        
  2979  3606           PSHU  B A                         
  297b  AD9FFEC4       JSR [0xfec4]                      
  297f  FC703C         LDD 0x703c                        
  2982  3606           PSHU  B A                         
  2984  AD9FFCF2       JSR [0xfcf2]                      
  2988  3706           PULU  A B                         
  298a  FD7164         STD 0x7164                        
  298d  CC000A         LDD #0xa                          
  2990  AD9FFD20       JSR [0xfd20]                      
  2994  108E0361       LDY #0x361                        
  2998  FC7164         LDD 0x7164                        
  299b  AD9FFD2E       JSR [0xfd2e]                      
  299f  3576           PULS  A B X Y U                   
  29a1  39             RTS                               
PTR_FUN_M74_r4_04000__2a25_M74_r4_04000__29a2:
  29a2  2A25           addr M74_r4_04000::2a25           
  29a4  29EC           addr M74_r4_04000::29ec           
  29a6  .db 29 E0 70 00 70 C8 00 00 70 CA 00 08 00 6D 06 00  ; ).p.p...p....m..
  29b6  .db 00 00 64 00 01 00 03 19 2A 10 00 00 00 00 70 02  ; ..d.....*.....p.
  29c6  .db 00 7F                                            ; ..

; ---- function FUN_M74_r4_04000__29c8
FUN_M74_r4_04000__29c8:
  29c8  3410           PSHS  X                           
  29ca  8E29A2         LDX #0x29a2                        ; desc[API_FE6A]: ->$2A25 ->$29EC
  29cd  AD9FFE6A       JSR [0xfe6a]                      
  29d1  3510           PULS  X                           
  29d3  39             RTS                               

; ---- function FUN_M74_r4_04000__29d4
FUN_M74_r4_04000__29d4:
  29d4  3410           PSHS  X                           
  29d6  8E29A2         LDX #0x29a2                        ; desc[API_FDBC]: ->$2A25 ->$29EC
  29d9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)."
  29dd  3510           PULS  X                           
  29df  39             RTS                               

; ---- function FUN_M74_r4_04000__29e0
FUN_M74_r4_04000__29e0:
  29e0  3410           PSHS  X                           
  29e2  8E29A2         LDX #0x29a2                        ; desc[API_FE6C]: ->$2A25 ->$29EC
  29e5  AD9FFE6C       JSR [0xfe6c]                      
  29e9  3510           PULS  X                           
  29eb  39             RTS                               

; ---- function FUN_M74_r4_04000__29ec
FUN_M74_r4_04000__29ec:
  29ec  3410           PSHS  X                           
  29ee  8E29A2         LDX #0x29a2                        ; desc[API_FE6E]: ->$2A25 ->$29EC
  29f1  AD9FFE6E       JSR [0xfe6e]                      
  29f5  3510           PULS  X                           
  29f7  39             RTS                               

; ---- function FUN_M74_r4_04000__29f8
FUN_M74_r4_04000__29f8:
  29f8  3410           PSHS  X                           
  29fa  8E29A2         LDX #0x29a2                        ; desc[API_FE1C]: ->$2A25 ->$29EC
  29fd  AD9FFE1C       JSR [0xfe1c]                      
  2a01  3510           PULS  X                           
  2a03  39             RTS                               

; ---- function FUN_M74_r4_04000__2a04
FUN_M74_r4_04000__2a04:
  2a04  3410           PSHS  X                           
  2a06  8E29A2         LDX #0x29a2                        ; desc[API_FE1A]: ->$2A25 ->$29EC $29E0
  2a09  AD9FFE1A       JSR [0xfe1a]                      
  2a0d  3510           PULS  X                           
  2a0f  39             RTS                               
  2a10  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  2a20  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__2a25
FUN_M74_r4_04000__2a25:
  2a25  3476           PSHS  U Y X B A                   
  2a27  8E29A2         LDX #0x29a2                       
  2a2a  AD9FFE76       JSR [0xfe76]                      
  2a2e  CC0064         LDD #0x64                         
  2a31  B370CA         SUBD 0x70ca                       
  2a34  3606           PSHU  B A                         
  2a36  58             LSLB                              
  2a37  49             ROLA                              
  2a38  FD7164         STD 0x7164                        
  2a3b  CC4666         LDD #0x4666                       
  2a3e  3606           PSHU  B A                         
  2a40  AD9FFCF2       JSR [0xfcf2]                      
  2a44  3706           PULU  A B                         
  2a46  F37164         ADDD 0x7164                       
  2a49  AD9FFC6A       JSR [0xfc6a]                      
  2a4d  AD9FFC72       JSR [0xfc72]                      
  2a51  3576           PULS  A B X Y U                   
  2a53  39             RTS                               
PTR_FUN_M74_r4_04000__2abf_M74_r4_04000__2a54:
  2a54  2ABF           addr M74_r4_04000::2abf           
  2a56  2A9E           addr M74_r4_04000::2a9e           
  2a58  .db 2A 92 70 58 71 54 00 00 71 56 00 08 00 21 09 FF  ; *.pXqT..qV...!..
  2a68  .db D0 00 30 00 01 00 03 1C 2A AA 00 00 00 00 00 00  ; ..0.....*.......
  2a78  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2a7a
FUN_M74_r4_04000__2a7a:
  2a7a  3410           PSHS  X                           
  2a7c  8E2A54         LDX #0x2a54                       
  2a7f  AD9FFE74       JSR [0xfe74]                      
  2a83  3510           PULS  X                           
  2a85  39             RTS                               

; ---- function FUN_M74_r4_04000__2a86
FUN_M74_r4_04000__2a86:
  2a86  3410           PSHS  X                           
  2a88  8E2A54         LDX #0x2a54                        ; desc[API_FE22]: ->$2ABF ->$2A9E
  2a8b  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2a8f  3510           PULS  X                           
  2a91  39             RTS                               

; ---- function FUN_M74_r4_04000__2a92
FUN_M74_r4_04000__2a92:
  2a92  3410           PSHS  X                           
  2a94  8E2A54         LDX #0x2a54                       
  2a97  AD9FFE70       JSR [0xfe70]                      
  2a9b  3510           PULS  X                           
  2a9d  39             RTS                               

; ---- function FUN_M74_r4_04000__2a9e
FUN_M74_r4_04000__2a9e:
  2a9e  3410           PSHS  X                           
  2aa0  8E2A54         LDX #0x2a54                       
  2aa3  AD9FFE72       JSR [0xfe72]                      
  2aa7  3510           PULS  X                           
  2aa9  39             RTS                               
  2aaa  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  2aba  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__2abf
FUN_M74_r4_04000__2abf:
  2abf  3476           PSHS  U Y X B A                   
  2ac1  8E2A54         LDX #0x2a54                       
  2ac4  AD9FFE76       JSR [0xfe76]                      
  2ac8  AD9FFE52       JSR [0xfe52]                      
  2acc  3576           PULS  A B X Y U                   
  2ace  39             RTS                               
PTR_FUN_M74_r4_04000__2b3a_M74_r4_04000__2acf:
  2acf  2B3A           addr M74_r4_04000::2b3a           
  2ad1  2B19           addr M74_r4_04000::2b19           
  2ad3  .db 2B 0D 70 54 71 5C 00 00 71 5E 00 08 00 22 0A FF  ; +.pTq\..q^..."..
  2ae3  .db D0 00 30 00 01 00 03 1D 2B 25 00 00 00 00 00 00  ; ..0.....+%......
  2af3  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2af5
FUN_M74_r4_04000__2af5:
  2af5  3410           PSHS  X                           
  2af7  8E2ACF         LDX #0x2acf                       
  2afa  AD9FFE74       JSR [0xfe74]                      
  2afe  3510           PULS  X                           
  2b00  39             RTS                               

; ---- function FUN_M74_r4_04000__2b01
FUN_M74_r4_04000__2b01:
  2b01  3410           PSHS  X                           
  2b03  8E2ACF         LDX #0x2acf                        ; desc[API_FE22]: ->$2B3A ->$2B19
  2b06  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2b0a  3510           PULS  X                           
  2b0c  39             RTS                               

; ---- function FUN_M74_r4_04000__2b0d
FUN_M74_r4_04000__2b0d:
  2b0d  3410           PSHS  X                           
  2b0f  8E2ACF         LDX #0x2acf                       
  2b12  AD9FFE70       JSR [0xfe70]                      
  2b16  3510           PULS  X                           
  2b18  39             RTS                               

; ---- function FUN_M74_r4_04000__2b19
FUN_M74_r4_04000__2b19:
  2b19  3410           PSHS  X                           
  2b1b  8E2ACF         LDX #0x2acf                       
  2b1e  AD9FFE72       JSR [0xfe72]                      
  2b22  3510           PULS  X                           
  2b24  39             RTS                               
  2b25  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  2b35  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__2b3a
FUN_M74_r4_04000__2b3a:
  2b3a  3476           PSHS  U Y X B A                   
  2b3c  8E2ACF         LDX #0x2acf                       
  2b3f  AD9FFE76       JSR [0xfe76]                      
  2b43  AD9FFE54       JSR [0xfe54]                      
  2b47  3576           PULS  A B X Y U                   
  2b49  39             RTS                               
PTR_FUN_M74_r4_04000__2bb5_M74_r4_04000__2b4a:
  2b4a  2BB5           addr M74_r4_04000::2bb5           
  2b4c  2B94           addr M74_r4_04000::2b94           
  2b4e  .db 2B 88 70 56 71 58 00 00 71 5A 00 08 00 23 0B FF  ; +.pVqX..qZ...#..
  2b5e  .db D0 00 30 00 01 00 03 1D 2B A0 00 00 00 00 00 00  ; ..0.....+.......
  2b6e  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2b70
FUN_M74_r4_04000__2b70:
  2b70  3410           PSHS  X                           
  2b72  8E2B4A         LDX #0x2b4a                       
  2b75  AD9FFE74       JSR [0xfe74]                      
  2b79  3510           PULS  X                           
  2b7b  39             RTS                               

; ---- function FUN_M74_r4_04000__2b7c
FUN_M74_r4_04000__2b7c:
  2b7c  3410           PSHS  X                           
  2b7e  8E2B4A         LDX #0x2b4a                        ; desc[API_FE22]: ->$2BB5 ->$2B94
  2b81  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2b85  3510           PULS  X                           
  2b87  39             RTS                               

; ---- function FUN_M74_r4_04000__2b88
FUN_M74_r4_04000__2b88:
  2b88  3410           PSHS  X                           
  2b8a  8E2B4A         LDX #0x2b4a                       
  2b8d  AD9FFE70       JSR [0xfe70]                      
  2b91  3510           PULS  X                           
  2b93  39             RTS                               

; ---- function FUN_M74_r4_04000__2b94
FUN_M74_r4_04000__2b94:
  2b94  3410           PSHS  X                           
  2b96  8E2B4A         LDX #0x2b4a                       
  2b99  AD9FFE72       JSR [0xfe72]                      
  2b9d  3510           PULS  X                           
  2b9f  39             RTS                               
  2ba0  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  2bb0  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M74_r4_04000__2bb5
FUN_M74_r4_04000__2bb5:
  2bb5  3476           PSHS  U Y X B A                   
  2bb7  8E2B4A         LDX #0x2b4a                       
  2bba  AD9FFE76       JSR [0xfe76]                      
  2bbe  AD9FFE56       JSR [0xfe56]                      
  2bc2  3576           PULS  A B X Y U                   
  2bc4  39             RTS                               
PTR_FUN_M74_r4_04000__2c30_M74_r4_04000__2bc5:
  2bc5  2C30           addr M74_r4_04000::2c30           
  2bc7  2C0F           addr M74_r4_04000::2c0f           
  2bc9  .db 2C 03 70 52 71 60 00 00 71 62 00 08 00 24 0C FF  ; ,.pRq`..qb...$..
  2bd9  .db D0 00 30 00 01 00 03 1E 2C 1B 00 00 00 00 00 00  ; ..0.....,.......
  2be9  .db 00 00                                            ; ..

; ---- function FUN_M74_r4_04000__2beb
FUN_M74_r4_04000__2beb:
  2beb  3410           PSHS  X                           
  2bed  8E2BC5         LDX #0x2bc5                       
  2bf0  AD9FFE74       JSR [0xfe74]                      
  2bf4  3510           PULS  X                           
  2bf6  39             RTS                               

; ---- function FUN_M74_r4_04000__2bf7
FUN_M74_r4_04000__2bf7:
  2bf7  3410           PSHS  X                           
  2bf9  8E2BC5         LDX #0x2bc5                        ; desc[API_FE22]: ->$2C30 ->$2C0F
  2bfc  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2c00  3510           PULS  X                           
  2c02  39             RTS                               

; ---- function FUN_M74_r4_04000__2c03
FUN_M74_r4_04000__2c03:
  2c03  3410           PSHS  X                           
  2c05  8E2BC5         LDX #0x2bc5                       
  2c08  AD9FFE70       JSR [0xfe70]                      
  2c0c  3510           PULS  X                           
  2c0e  39             RTS                               

; ---- function FUN_M74_r4_04000__2c0f
FUN_M74_r4_04000__2c0f:
  2c0f  3410           PSHS  X                           
  2c11  8E2BC5         LDX #0x2bc5                       
  2c14  AD9FFE72       JSR [0xfe72]                      
  2c18  3510           PULS  X                           
  2c1a  39             RTS                               
  2c1b  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  2c2b  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M74_r4_04000__2c30
FUN_M74_r4_04000__2c30:
  2c30  3476           PSHS  U Y X B A                   
  2c32  8E2BC5         LDX #0x2bc5                       
  2c35  AD9FFE76       JSR [0xfe76]                      
  2c39  AD9FFE58       JSR [0xfe58]                      
  2c3d  3576           PULS  A B X Y U                   
  2c3f  39             RTS                               

; ---- function FUN_M74_r4_04000__2c40
FUN_M74_r4_04000__2c40:
  2c40  3437           PSHS  Y X B A CC                  
  2c42  3706           PULU  A B                         
  2c44  FD7168         STD 0x7168                        
  2c47  3706           PULU  A B                         
  2c49  FD716A         STD 0x716a                        
  2c4c  FC716A         LDD 0x716a                        
  2c4f  C30030         ADDD #0x30                        
  2c52  58             LSLB                              
  2c53  49             ROLA                              
  2c54  F3600D         ADDD 0x600d                       
  2c57  C32C8F         ADDD #0x2c8f                      
  2c5a  1F01           TFR D,X                           
  2c5c  FC7168         LDD 0x7168                        
  2c5f  FD7166         STD 0x7166                        
  2c62  2E08           BGT 0x2c6c                        
  2c64  CC0000         LDD #0x0                          
  2c67  B37166         SUBD 0x7166                       
  2c6a  2008           BRA 0x2c74                        
LAB_M74_r4_04000__2c6c:
  2c6c  CC0064         LDD #0x64                         
  2c6f  B37166         SUBD 0x7166                       
  2c72  3002           LEAX 0x2,X                        
LAB_M74_r4_04000__2c74:
  2c74  58             LSLB                              
  2c75  49             ROLA                              
  2c76  F3600D         ADDD 0x600d                       
  2c79  C32D3B         ADDD #0x2d3b                      
  2c7c  1F02           TFR D,Y                           
  2c7e  EC84           LDD ,X                            
  2c80  3606           PSHU  B A                         
  2c82  ECA4           LDD ,Y                            
  2c84  3606           PSHU  B A                         
  2c86  AD9FFCF2       JSR [0xfcf2]                      
  2c8a  3537           PULS CC A B X Y                   
  2c8c  39             RTS                               
  2c8d  .db 00 3B                                            ; .;
DAT_M74_r4_04000__2c8f:
  2c8f  00             ?? 00h                            
  2c90  .db 3F                                               ; ?
DAT_M74_r4_04000__2c91:
  2c91  00             ?? 00h                            
  2c92  .db 42 00 46 00 4A 00 4F 00 54 00 59 00 5E 00 63 00  ; B.F.J.O.T.Y.^.c.
  2ca2  .db 69 00 6F 00 76 00 7D 00 85 00 8C 00 95 00 9E 00  ; i.o.v.}.........
  2cb2  .db A7 00 B1 00 BC 00 C6 00 D2 00 DF 00 EC 00 FA 01  ; ................
  2cc2  .db 09 01 19 01 29 01 3B 01 4E 01 62 01 77 01 8D 01  ; ....).;.N.b.w...
  2cd2  .db A4 01 BD 01 D8 01 F4 02 12 02 31 02 53 02 76 02  ; ..........1.S.v.
  2ce2  .db 9B 02 C3 02 ED 03 1A 03 49 03 7B 03 B0 03 E8 04  ; ........I.{.....
  2cf2  .db 23 04 62 04 A5 04 EC 05 37 05 86 05 DA 06 33 06  ; #.b.....7.....3.
  2d02  .db 92 06 F6 07 60 07 D0 08 47 08 C4 09 4A 09 D8 0A  ; ....`...G...J...
  2d12  .db 6E 0B 0C 0B B4 0C 66 0D 24 0D EC 0E C0 0F A0 10  ; n.....f.$.......
  2d22  .db 8E 11 88 12 94 13 B0 14 DC 16 18 17 68 18 CC 1A  ; ............h...
  2d32  .db 48 1B D8 1D 80 1F 40 21 1C                       ; H.....@!.
DAT_M74_r4_04000__2d3b:
  2d3b  7F             ?? 7Fh                           
  2d3c  .db FF 7F EC 7F D9 7F C6 7F B3 7F A0 7F 8D 7F 7A 7F  ; ..............z.
  2d4c  .db 67 7F 55 7F 42 7F 39 7F 1C 7F 09 7E F7 7E E4 7E  ; g.U.B.9....~.~.~
  2d5c  .db D1 7E BE 7E AC 7E 99 7E 86 7E 73 7E 61 7E 4E 7E  ; .~.~.~.~.~s~a~N~
  2d6c  .db 3B 7E 29 7E 16 7E 03 7D F1 7D DE 7D CC 7D B9 7D  ; ;~)~.~.}.}.}.}.}
  2d7c  .db A6 7D 94 7D 81 7D 6F 7D 52 7D 4A 7D 37 7D 25 7D  ; .}.}.}o}R}J}7}%}
  2d8c  .db 12 7D 00 7C ED 7C DB 7C C8 7C B6 7C A3 7C 91 7C  ; .}.|.|.|.|.|.|.|
  2d9c  .db 7E 7C 6C 7C 5A 7C 48 7C 35 7C 23 7C 11 7B FE 7B  ; ~|l|Z|H|5|#|.{.{
  2dac  .db EC 7B DA 7B C7 7B B5 7B A3 7B 90 7B 7E 7B 6C 7B  ; .{.{.{.{.{.{~{l{
  2dbc  .db 5A 7B 47 7B 35 7B 23 7B 11 7A FF 7A EC 7A DA 7A  ; Z{G{5{#{.z.z.z.z
  2dcc  .db C8 7A B6 7A A4 7A 92 7A 7F 7A 6D 7A 5B 7A 49 7A  ; .z.z.z.z.zmz[zIz
  2ddc  .db 37 7A 25 7A 13 7A 01 79 EF 79 DD 79 CB 79 B9 79  ; 7z%z.z.y.y.y.y.y
  2dec  .db A7 79 95 79 83 79 71 79 5F 79 4D 79 3B 79 29 79  ; .y.y.yqy_yMy;y)y
  2dfc  .db 17 79 05 78 F3 78 E2 78 D0 78 BE                 ; .y.x.x.x.x.

; ---- function FUN_M74_r4_04000__2e07
FUN_M74_r4_04000__2e07:
  2e07  3436           PSHS  Y X B A                     
  2e09  3401           PSHS  CC                          
  2e0b  AD9FFC54       JSR [0xfc54]                      
  2e0f  FC716C         LDD 0x716c                        
  2e12  2715           BEQ 0x2e29                        
  2e14  CC2E36         LDD #0x2e36                       
  2e17  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2e1b  6013           addr 6013                         
LAB_M74_r4_04000__2e1d:
  2e1d  AD9FFC56       JSR [0xfc56]                      
  2e21  3501           PULS CC                           
  2e23  3536           PULS  A B X Y                     
  2e25  3261           LEAS 0x1,S                        
  2e27  3580           PULS  PC                          
LAB_M74_r4_04000__2e29:
  2e29  AD9FFD76       JSR [0xfd76]                      
  2e2d  AD9FFC56       JSR [0xfc56]                      
  2e31  3501           PULS CC                           
  2e33  3536           PULS  A B X Y                     
  2e35  3B             RTI                               

; ---- function FUN_M74_r4_04000__2e36
FUN_M74_r4_04000__2e36:
  2e36  3436           PSHS  Y X B A                     
  2e38  CC000A         LDD #0xa                          
  2e3b  AD9FFD20       JSR [0xfd20]                      
  2e3f  108E0440       LDY #0x440                        
  2e43  FC7008         LDD 0x7008                        
  2e46  AD9FFD2E       JSR [0xfd2e]                      
  2e4a  CC000A         LDD #0xa                          
  2e4d  AD9FFD20       JSR [0xfd20]                      
  2e51  108E0441       LDY #0x441                        
  2e55  FC700E         LDD 0x700e                        
  2e58  AD9FFD2E       JSR [0xfd2e]                      
  2e5c  CC000A         LDD #0xa                          
  2e5f  AD9FFD20       JSR [0xfd20]                      
  2e63  108E0442       LDY #0x442                        
  2e67  FC70AE         LDD 0x70ae                        
  2e6a  AD9FFD2E       JSR [0xfd2e]                      
  2e6e  CC000A         LDD #0xa                          
  2e71  AD9FFD20       JSR [0xfd20]                      
  2e75  108E0444       LDY #0x444                        
  2e79  FC70B2         LDD 0x70b2                        
  2e7c  AD9FFD2E       JSR [0xfd2e]                      
  2e80  CC000A         LDD #0xa                          
  2e83  AD9FFD20       JSR [0xfd20]                      
  2e87  108E0443       LDY #0x443                        
  2e8b  FC70B0         LDD 0x70b0                        
  2e8e  AD9FFD2E       JSR [0xfd2e]                      
  2e92  CC000A         LDD #0xa                          
  2e95  AD9FFD20       JSR [0xfd20]                      
  2e99  108E0445       LDY #0x445                        
  2e9d  FC70B4         LDD 0x70b4                        
  2ea0  AD9FFD2E       JSR [0xfd2e]                      
  2ea4  FC70B6         LDD 0x70b6                        
  2ea7  10B32586       CMPD 0x2586                       
  2eab  102E004A       LBGT 0x2ef9                       
  2eaf  CC000A         LDD #0xa                          
  2eb2  AD9FFD20       JSR [0xfd20]                      
  2eb6  108E0446       LDY #0x446                        
  2eba  FC70BE         LDD 0x70be                        
  2ebd  AD9FFD2E       JSR [0xfd2e]                      
  2ec1  CC000A         LDD #0xa                          
  2ec4  AD9FFD20       JSR [0xfd20]                      
  2ec8  108E044A       LDY #0x44a                        
  2ecc  FC713E         LDD 0x713e                        
  2ecf  AD9FFD2E       JSR [0xfd2e]                      
  2ed3  CC000A         LDD #0xa                          
  2ed6  AD9FFD20       JSR [0xfd20]                      
  2eda  108E0448       LDY #0x448                        
  2ede  FC70B6         LDD 0x70b6                        
  2ee1  AD9FFD2E       JSR [0xfd2e]                      
  2ee5  FC713E         LDD 0x713e                        
  2ee8  10830001       CMPD #0x1                         
  2eec  10270007       LBEQ 0x2ef7                       
  2ef0  FC70B6         LDD 0x70b6                        
  2ef3  AD9FFD3C       JSR [0xfd3c]                      
LAB_M74_r4_04000__2ef7:
  2ef7  2019           BRA 0x2f12                        
LAB_M74_r4_04000__2ef9:
  2ef9  CC000A         LDD #0xa                          
  2efc  AD9FFD20       JSR [0xfd20]                      
  2f00  108E044A       LDY #0x44a                        
  2f04  CC0000         LDD #0x0                          
  2f07  AD9FFD2E       JSR [0xfd2e]                      
  2f0b  FC70B6         LDD 0x70b6                        
  2f0e  AD9FFD3C       JSR [0xfd3c]                      
LAB_M74_r4_04000__2f12:
  2f12  FC70BA         LDD 0x70ba                        
  2f15  10B32586       CMPD 0x2586                       
  2f19  102E004A       LBGT 0x2f67                       
  2f1d  CC000A         LDD #0xa                          
  2f20  AD9FFD20       JSR [0xfd20]                      
  2f24  108E0447       LDY #0x447                        
  2f28  FC70C0         LDD 0x70c0                        
  2f2b  AD9FFD2E       JSR [0xfd2e]                      
  2f2f  CC000A         LDD #0xa                          
  2f32  AD9FFD20       JSR [0xfd20]                      
  2f36  108E0449       LDY #0x449                        
  2f3a  FC70BA         LDD 0x70ba                        
  2f3d  AD9FFD2E       JSR [0xfd2e]                      
  2f41  CC000A         LDD #0xa                          
  2f44  AD9FFD20       JSR [0xfd20]                      
  2f48  108E044B       LDY #0x44b                        
  2f4c  FC7142         LDD 0x7142                        
  2f4f  AD9FFD2E       JSR [0xfd2e]                      
  2f53  FC7142         LDD 0x7142                        
  2f56  10830001       CMPD #0x1                         
  2f5a  10270007       LBEQ 0x2f65                       
  2f5e  FC70BA         LDD 0x70ba                        
  2f61  AD9FFD44       JSR [0xfd44]                      
LAB_M74_r4_04000__2f65:
  2f65  2019           BRA 0x2f80                        
LAB_M74_r4_04000__2f67:
  2f67  CC000A         LDD #0xa                          
  2f6a  AD9FFD20       JSR [0xfd20]                      
  2f6e  108E044B       LDY #0x44b                        
  2f72  CC0000         LDD #0x0                          
  2f75  AD9FFD2E       JSR [0xfd2e]                      
  2f79  FC70BA         LDD 0x70ba                        
  2f7c  AD9FFD44       JSR [0xfd44]                      
LAB_M74_r4_04000__2f80:
  2f80  CC0A34         LDD #0xa34                        
  2f83  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2f87  6013           addr 6013                         
LAB_M74_r4_04000__2f89:
  2f89  CC0000         LDD #0x0                          
  2f8c  FD716C         STD 0x716c                        
  2f8f  AD9FFD76       JSR [0xfd76]                      
  2f93  1CBF           ANDCC #0xbf                       
  2f95  3536           PULS  A B X Y                     
  2f97  39             RTS                               

; ---- function FUN_M74_r4_04000__2f98
FUN_M74_r4_04000__2f98:
  2f98  3436           PSHS  Y X B A                     
  2f9a  CC0A34         LDD #0xa34                        
  2f9d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2fa1  6013           addr 6013                         
LAB_M74_r4_04000__2fa3:
  2fa3  AD9FFD76       JSR [0xfd76]                      
  2fa7  1CBF           ANDCC #0xbf                       
  2fa9  3536           PULS  A B X Y                     
  2fab  39             RTS                               

;; TMS32010 program 74 for DSP 1: 357 words loaded at $800 (written via bank latch $81)
DSPPROG_74_DSP1_hdr:
  2fac  741002D40000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_74_DSP1:
  2fb4  08007F8B6E00.. dw[358]                           

;; TMS32010 program 74 for DSP 2: 354 words loaded at $800 (written via bank latch $82)
DSPPROG_74_DSP2_hdr:
  3280  741102CE0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_74_DSP2:
  3288  08007F8B6E00.. dw[355]                           

;; TMS32010 program 74 for DSP 3: 1168 words loaded at $800 (written via bank latch $83)
DSPPROG_74_DSP3_hdr:
  354e  7412092A0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_74_DSP3:
  3556  08007F8B6E00.. dw[1169]                          

;; End of record chain
END_OF_CHAIN_hdr:
  3e78  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3e80  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e90  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ea0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eb0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ec0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ed0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ee0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f00  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f10  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f20  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f30  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f40  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f50  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f60  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f70  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f80  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f90  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
