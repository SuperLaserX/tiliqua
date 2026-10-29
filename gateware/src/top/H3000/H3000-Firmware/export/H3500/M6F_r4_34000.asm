; H3500  block M6F_r4_34000  M6F_r4_34000::0000-M6F_r4_34000::3fff
; Bank r4_34000 (module id 6F, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 6F parameter/preset table "PATCH FACTORY", 209 bytes
MODULE_6F_TABLE_PATCH_FACTORY_hdr:
  0008  6F0000D90000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6F_TABLE_PATCH_FACTORY:
  0010  6F             ?? 6Fh    o                       
  0011  .db 01                                               ; .
  0012  504154434820.. ds "PATCH FACTORY  "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0054  .db 00 00 00 00 00 00 64 00 64 00 64 00 64 00 00 00  ; ......d.d.d.d...
  0064  .db 64 00 00 00 64 01 F4 07 D0 1B 58 1B 58 00 00 00  ; d...d.....X.X...
  0074  .db 00 03 E8 03 E8 51 86 7A 9E 7D 00 7D 00 01 B8 01  ; .....Q.z.}.}....
  0084  .db B8 03 E8 03 E8 03 04 0E 0E 03 04 05 06 00 01 09  ; ................
  0094  .db 0A 02 0C 02 5A FF 9C 04 B0 00 19 01 F4 02 02 02  ; ....Z...........
  00a4  .db 02 02 32 00                                      ; ..2.
  00a8  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  00cc  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13  ; ................
  00dc  .db 88 13 88 13 88                                   ; .....

;; Module 6F code record 01, 10534 bytes, entered at payload start
MODULE_6F_01_CODE_hdr:
  00e1  6F01292E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6F_01_entry
MODULE_6F_01_entry:
  00e9  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00ED
  00ed  00ED           dw EDh                            
LAB_M6F_r4_34000__00ef:
  00ef  3477           PSHS  U Y X B A CC                
  00f1  17003E         LBSR 0x0132                       
  00f4  1700D4         LBSR 0x01cb                       
  00f7  170130         LBSR 0x022a                       
  00fa  8603           LDA #0x3                          
  00fc  B760DA         STA 0x60da                        
  00ff  AD9FFE38       JSR [0xfe38]                      
  0103  17049B         LBSR 0x05a1                       
  0106  AD9FFED0       JSR [0xfed0]                      
  010a  17013F         LBSR 0x024c                       
  010d  170199         LBSR 0x02a9                       
  0110  1701E0         LBSR 0x02f3                       
  0113  170DF4         LBSR 0x0f0a                       
  0116  170F39         LBSR 0x1052                       
  0119  AD9FFE36       JSR [0xfe36]                      
  011d  1701DF         LBSR 0x02ff                       
  0120  AD9FFDF6       JSR [0xfdf6]                      
  0124  AD9FFE18       JSR [0xfe18]                      
  0128  170600         LBSR 0x072b                       
  012b  AD9FFE10       JSR [0xfe10]                      
  012f  3577           PULS CC A B X Y U                 
  0131  39             RTS                               

; ---- function FUN_M6F_r4_34000__0132
FUN_M6F_r4_34000__0132:
  0132  3476           PSHS  U Y X B A                   
  0134  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 61:00 63:08 69:10 6B:18 71:20 73:28 79:30 7B:38
  0138  61             db 61h                            
  0139  00             db 0h                             
  013a  63             db 63h                            
  013b  08             db 8h                             
  013c  69             db 69h                            
  013d  10             db 10h                            
  013e  6B             db 6Bh                            
  013f  18             db 18h                            
  0140  71             db 71h                            
  0141  20             db 20h                            
  0142  73             db 73h                            
  0143  28             db 28h                            
  0144  79             db 79h                            
  0145  30             db 30h                            
  0146  7B             db 7Bh                            
  0147  38             db 38h                            
  0148  00             db 0h                             
LAB_M6F_r4_34000__0149:
  0149  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 65:06 67:0E 6D:16 6F:1E 75:26 77:2E 7D:36 7F:3E
  014d  65             db 65h                            
  014e  06             db 6h                             
  014f  67             db 67h                            
  0150  0E             db Eh                             
  0151  6D             db 6Dh                            
  0152  16             db 16h                            
  0153  6F             db 6Fh                            
  0154  1E             db 1Eh                            
  0155  75             db 75h                            
  0156  26             db 26h                            
  0157  77             db 77h                            
  0158  2E             db 2Eh                            
  0159  7D             db 7Dh                            
  015a  36             db 36h                            
  015b  7F             db 7Fh                            
  015c  3E             db 3Eh                            
  015d  00             db 0h                             
LAB_M6F_r4_34000__015e:
  015e  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 81:40 82:42 83:44 84:46 85:48 86:4A 87:4C 88:4E 89:50 8A:52
  0162  81             db 81h                            
  0163  40             db 40h                            
  0164  82             db 82h                            
  0165  42             db 42h                            
  0166  83             db 83h                            
  0167  44             db 44h                            
  0168  84             db 84h                            
  0169  46             db 46h                            
  016a  85             db 85h                            
  016b  48             db 48h                            
  016c  86             db 86h                            
  016d  4A             db 4Ah                            
  016e  87             db 87h                            
  016f  4C             db 4Ch                            
  0170  88             db 88h                            
  0171  4E             db 4Eh                            
  0172  89             db 89h                            
  0173  50             db 50h                            
  0174  8A             db 8Ah                            
  0175  52             db 52h                            
  0176  00             db 0h                             
LAB_M6F_r4_34000__0177:
  0177  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 8B:54 8C:56 8D:58
  017b  8B             db 8Bh                            
  017c  54             db 54h                            
  017d  8C             db 8Ch                            
  017e  56             db 56h                            
  017f  8D             db 8Dh                            
  0180  58             db 58h                            
  0181  00             db 0h                             
LAB_M6F_r4_34000__0182:
  0182  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 91:8E 93:94 95:96 97:9C
  0186  91             db 91h                            
  0187  8E             db 8Eh                            
  0188  93             db 93h                            
  0189  94             db 94h                            
  018a  95             db 95h                            
  018b  96             db 96h                            
  018c  97             db 97h                            
  018d  9C             db 9Ch                            
  018e  00             db 0h                             
LAB_M6F_r4_34000__018f:
  018f  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 51:BE 53:C4 55:C6 57:CC 59:CE 5B:D4 5D:D6 5F:DC
  0193  51             db 51h                            
  0194  BE             db BEh                            
  0195  53             db 53h                            
  0196  C4             db C4h                            
  0197  55             db 55h                            
  0198  C6             db C6h                            
  0199  57             db 57h                            
  019a  CC             db CCh                            
  019b  59             db 59h                            
  019c  CE             db CEh                            
  019d  5B             db 5Bh                            
  019e  D4             db D4h                            
  019f  5D             db 5Dh                            
  01a0  D6             db D6h                            
  01a1  5F             db 5Fh                            
  01a2  DC             db DCh                            
  01a3  00             db 0h                             
LAB_M6F_r4_34000__01a4:
  01a4  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 8E:DE 8F:E0 90:E2
  01a8  8E             db 8Eh                            
  01a9  DE             db DEh                            
  01aa  8F             db 8Fh                            
  01ab  E0             db E0h                            
  01ac  90             db 90h                            
  01ad  E2             db E2h                            
  01ae  00             db 0h                             
LAB_M6F_r4_34000__01af:
  01af  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:9E 1A:A6 1B:AE 1C:B6
  01b3  19             db 19h                            
  01b4  9E             db 9Eh                            
  01b5  1A             db 1Ah                            
  01b6  A6             db A6h                            
  01b7  1B             db 1Bh                            
  01b8  AE             db AEh                            
  01b9  1C             db 1Ch                            
  01ba  B6             db B6h                            
  01bb  00             db 0h                             
LAB_M6F_r4_34000__01bc:
  01bc  CCFFFF         LDD #0xffff                       
  01bf  FD70EA         STD 0x70ea                        
  01c2  CC0000         LDD #0x0                          
  01c5  FD70E8         STD 0x70e8                        
  01c8  3576           PULS  A B X Y U                   
  01ca  39             RTS                               

; ---- function FUN_M6F_r4_34000__01cb
FUN_M6F_r4_34000__01cb:
  01cb  3476           PSHS  U Y X B A                   
  01cd  CC0000         LDD #0x0                          
  01d0  FD7002         STD 0x7002                        
  01d3  FD700A         STD 0x700a                        
  01d6  FD7012         STD 0x7012                        
  01d9  FD701A         STD 0x701a                        
  01dc  FD7022         STD 0x7022                        
  01df  FD702A         STD 0x702a                        
  01e2  FD7032         STD 0x7032                        
  01e5  FD703A         STD 0x703a                        
  01e8  FD705A         STD 0x705a                        
  01eb  FD705C         STD 0x705c                        
  01ee  FD705E         STD 0x705e                        
  01f1  FD7060         STD 0x7060                        
  01f4  FD7062         STD 0x7062                        
  01f7  FD7064         STD 0x7064                        
  01fa  FD7066         STD 0x7066                        
  01fd  FD7068         STD 0x7068                        
  0200  FD706A         STD 0x706a                        
  0203  FD706C         STD 0x706c                        
  0206  FD706E         STD 0x706e                        
  0209  FD7070         STD 0x7070                        
  020c  FD7072         STD 0x7072                        
  020f  FD7090         STD 0x7090                        
  0212  FD7098         STD 0x7098                        
  0215  FD70C0         STD 0x70c0                        
  0218  FD70C8         STD 0x70c8                        
  021b  FD70A0         STD 0x70a0                        
  021e  FD70A8         STD 0x70a8                        
  0221  FD70B0         STD 0x70b0                        
  0224  FD70B8         STD 0x70b8                        
  0227  3576           PULS  A B X Y U                   
  0229  39             RTS                               

; ---- function FUN_M6F_r4_34000__022a
FUN_M6F_r4_34000__022a:
  022a  3476           PSHS  U Y X B A                   
  022c  CC0000         LDD #0x0                          
  022f  AD9FFC6C       JSR [0xfc6c]                      
  0233  AD9FFC74       JSR [0xfc74]                      
  0237  171D25         LBSR 0x1f5f                       
  023a  171D9D         LBSR 0x1fda                       
  023d  171E15         LBSR 0x2055                       
  0240  171E8D         LBSR 0x20d0                       
  0243  171BD5         LBSR 0x1e1b                       
  0246  171C80         LBSR 0x1ec9                       
  0249  3576           PULS  A B X Y U                   
  024b  39             RTS                               

; ---- function FUN_M6F_r4_34000__024c
FUN_M6F_r4_34000__024c:
  024c  3476           PSHS  U Y X B A                   
  024e  C601           LDB #0x1                          
  0250  8E6F10         LDX #0x6f10                       
  0253  AD9FFD30       JSR [0xfd30]                      
  0257  1026049A       LBNE 0x06f5                       
  025b  C602           LDB #0x2                          
  025d  8E6F11         LDX #0x6f11                       
  0260  AD9FFD30       JSR [0xfd30]                      
  0264  1026048D       LBNE 0x06f5                       
  0268  C603           LDB #0x3                          
  026a  8E0012         LDX #0x12                         
  026d  AD9FFD30       JSR [0xfd30]                      
  0271  10260480       LBNE 0x06f5                       
  0275  C603           LDB #0x3                          
  0277  8E6F12         LDX #0x6f12                       
  027a  AD9FFD30       JSR [0xfd30]                      
  027e  10260473       LBNE 0x06f5                       
  0282  CC0064         LDD #0x64                         
  0285  FD70E4         STD 0x70e4                        
  0288  CC0BB8         LDD #0xbb8                        
  028b  FD7128         STD 0x7128                        
  028e  CC0000         LDD #0x0                          
  0291  AD9FFC6C       JSR [0xfc6c]                      
  0295  AD9FFC74       JSR [0xfc74]                      
  0299  171F44         LBSR 0x21e0                       
  029c  172009         LBSR 0x22a8                       
  029f  1720F9         LBSR 0x239b                       
  02a2  AD9FFD7C       JSR [0xfd7c]                      
  02a6  3576           PULS  A B X Y U                   
  02a8  39             RTS                               

; ---- function FUN_M6F_r4_34000__02a9
FUN_M6F_r4_34000__02a9:
  02a9  3476           PSHS  U Y X B A                   
  02ab  1719E4         LBSR 0x1c92                       
  02ae  171AC5         LBSR 0x1d76                       
  02b1  1711E2         LBSR 0x1496                       
  02b4  171318         LBSR 0x15cf                       
  02b7  17139E         LBSR 0x1658                       
  02ba  171424         LBSR 0x16e1                       
  02bd  1714AA         LBSR 0x176a                       
  02c0  171530         LBSR 0x17f3                       
  02c3  1715B6         LBSR 0x187c                       
  02c6  17163C         LBSR 0x1905                       
  02c9  1716C2         LBSR 0x198e                       
  02cc  171748         LBSR 0x1a17                       
  02cf  171857         LBSR 0x1b29                       
  02d2  1718DD         LBSR 0x1bb2                       
  02d5  1717C8         LBSR 0x1aa0                       
  02d8  170A5B         LBSR 0x0d36                       
  02db  170B31         LBSR 0x0e0f                       
  02de  170C29         LBSR 0x0f0a                       
  02e1  170D6E         LBSR 0x1052                       
  02e4  170E91         LBSR 0x1178                       
  02e7  170F58         LBSR 0x1242                       
  02ea  171022         LBSR 0x130f                       
  02ed  1710F8         LBSR 0x13e8                       
  02f0  3576           PULS  A B X Y U                   
  02f2  39             RTS                               

; ---- function FUN_M6F_r4_34000__02f3
FUN_M6F_r4_34000__02f3:
  02f3  3476           PSHS  U Y X B A                   
  02f5  CC4E20         LDD #0x4e20                       
  02f8  AD9FFD20       JSR [0xfd20]                      
  02fc  3576           PULS  A B X Y U                   
  02fe  39             RTS                               

; ---- function FUN_M6F_r4_34000__02ff
FUN_M6F_r4_34000__02ff:
  02ff  3476           PSHS  U Y X B A                   
  0301  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " ratio  " 21 $1C4F $1C5B
  0305  00             db 0h                             
  0306  80             db 80h                            
  0307  20726174696F.. ds " ratio  "                     
  030f  21             db 21h                            
  0310  1C4F           addr M6F_r4_34000::1c4f           
  0312  1C5B           addr M6F_r4_34000::1c5b           
LAB_M6F_r4_34000__0314:
  0314  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "p delay " 25 $1D49 $1D55
  0318  01             db 1h                             
  0319  80             db 80h                            
  031a  702064656C61.. ds "p delay "                     
  0322  25             db 25h                            
  0323  1D49           addr M6F_r4_34000::1d49           
  0325  1D55           addr M6F_r4_34000::1d55           
LAB_M6F_r4_34000__0327:
  0327  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 " delay 1" 29 $1138 $1144
  032b  02             db 2h                             
  032c  80             db 80h                            
  032d  2064656C6179.. ds " delay 1"                     
  0335  29             db 29h                            
  0336  1138           addr M6F_r4_34000::1138           
  0338  1144           addr M6F_r4_34000::1144           
LAB_M6F_r4_34000__033a:
  033a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 " delay 2" 2D $1202 $120E
  033e  03             db 3h                             
  033f  80             db 80h                            
  0340  2064656C6179.. ds " delay 2"                     
  0348  2D             db 2Dh                            
  0349  1202           addr M6F_r4_34000::1202           
  034b  120E           addr M6F_r4_34000::120e           
LAB_M6F_r4_34000__034d:
  034d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "cutoff 1" 31 $0CF6 $0D02
  0351  04             db 4h                             
  0352  80             db 80h                            
  0353  6375746F6666.. ds "cutoff 1"                     
  035b  31             db 31h                            
  035c  0CF6           addr M6F_r4_34000::0cf6           
  035e  0D02           addr M6F_r4_34000::0d02           
LAB_M6F_r4_34000__0360:
  0360  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "cutoff 2" 35 $0DCF $0DDB
  0364  05             db 5h                             
  0365  80             db 80h                            
  0366  6375746F6666.. ds "cutoff 2"                     
  036e  35             db 35h                            
  036f  0DCF           addr M6F_r4_34000::0dcf           
  0371  0DDB           addr M6F_r4_34000::0ddb           
LAB_M6F_r4_34000__0373:
  0373  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "q fact 1" 39 $0E9C $0EA8
  0377  06             db 6h                             
  0378  80             db 80h                            
  0379  712066616374.. ds "q fact 1"                     
  0381  39             db 39h                            
  0382  0E9C           addr M6F_r4_34000::0e9c           
  0384  0EA8           addr M6F_r4_34000::0ea8           
LAB_M6F_r4_34000__0386:
  0386  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "q fact 2" 3D $0FE4 $0FF0
  038a  07             db 7h                             
  038b  80             db 80h                            
  038c  712066616374.. ds "q fact 2"                     
  0394  3D             db 3Dh                            
  0395  0FE4           addr M6F_r4_34000::0fe4           
  0397  0FF0           addr M6F_r4_34000::0ff0           
LAB_M6F_r4_34000__0399:
  0399  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 " scale 1" 41 $12CF $12DB
  039d  08             db 8h                             
  039e  80             db 80h                            
  039f  207363616C65.. ds " scale 1"                     
  03a7  41             db 41h                            
  03a8  12CF           addr M6F_r4_34000::12cf           
  03aa  12DB           addr M6F_r4_34000::12db           
LAB_M6F_r4_34000__03ac:
  03ac  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 " scale 2" 45 $13A8 $13B4
  03b0  09             db 9h                             
  03b1  80             db 80h                            
  03b2  207363616C65.. ds " scale 2"                     
  03ba  45             db 45h                            
  03bb  13A8           addr M6F_r4_34000::13a8           
  03bd  13B4           addr M6F_r4_34000::13b4           
LAB_M6F_r4_34000__03bf:
  03bf  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "left mix" 49 $1DEE $1DFA
  03c3  0A             db Ah                             
  03c4  80             db 80h                            
  03c5  6C656674206D.. ds "left mix"                     
  03cd  49             db 49h                            
  03ce  1DEE           addr M6F_r4_34000::1dee           
  03d0  1DFA           addr M6F_r4_34000::1dfa           
LAB_M6F_r4_34000__03d2:
  03d2  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 "rightmix" 4D $1E9C $1EA8
  03d6  0B             db Bh                             
  03d7  80             db 80h                            
  03d8  72696768746D.. ds "rightmix"                     
  03e0  4D             db 4Dh                            
  03e1  1E9C           addr M6F_r4_34000::1e9c           
  03e3  1EA8           addr M6F_r4_34000::1ea8           
LAB_M6F_r4_34000__03e5:
  03e5  CC0401         LDD #0x401                        
  03e8  FD60F5         STD 0x60f5                        
  03eb  CC0040         LDD #0x40                         
  03ee  47             ASRA                              
  03ef  56             RORB                              
  03f0  FD60F7         STD 0x60f7                        
  03f3  8601           LDA #0x1                          
  03f5  B76105         STA 0x6105                        
  03f8  CC0099         LDD #0x99                         
  03fb  FD6106         STD 0x6106                        
  03fe  3576           PULS  A B X Y U                   
  0400  39             RTS                               
  0401  0441044C0457.. addr[32]                          

; ---- function FUN_M6F_r4_34000__0441
FUN_M6F_r4_34000__0441:
  0441  17088E         LBSR 0x0cd2                       
  0444  1702E4         LBSR 0x072b                       
  0447  AD9FFE10       JSR [0xfe10]                      
  044b  39             RTS                               

; ---- function FUN_M6F_r4_34000__044c
FUN_M6F_r4_34000__044c:
  044c  17095C         LBSR 0x0dab                       
  044f  1702D9         LBSR 0x072b                       
  0452  AD9FFE12       JSR [0xfe12]                      
  0456  39             RTS                               

; ---- function FUN_M6F_r4_34000__0457
FUN_M6F_r4_34000__0457:
  0457  170A2A         LBSR 0x0e84                       
  045a  1702CE         LBSR 0x072b                       
  045d  AD9FFE14       JSR [0xfe14]                      
  0461  39             RTS                               

; ---- function FUN_M6F_r4_34000__0462
FUN_M6F_r4_34000__0462:
  0462  170B67         LBSR 0x0fcc                       
  0465  1702C3         LBSR 0x072b                       
  0468  AD9FFE16       JSR [0xfe16]                      
  046c  39             RTS                               

; ---- function FUN_M6F_r4_34000__046d
FUN_M6F_r4_34000__046d:
  046d  170CA4         LBSR 0x1114                       
  0470  1702F1         LBSR 0x0764                       
  0473  AD9FFE10       JSR [0xfe10]                      
  0477  39             RTS                               

; ---- function FUN_M6F_r4_34000__0478
FUN_M6F_r4_34000__0478:
  0478  170D63         LBSR 0x11de                       
  047b  1702E6         LBSR 0x0764                       
  047e  AD9FFE12       JSR [0xfe12]                      
  0482  39             RTS                               

; ---- function FUN_M6F_r4_34000__0483
FUN_M6F_r4_34000__0483:
  0483  170E25         LBSR 0x12ab                       
  0486  1702DB         LBSR 0x0764                       
  0489  AD9FFE14       JSR [0xfe14]                      
  048d  39             RTS                               

; ---- function FUN_M6F_r4_34000__048e
FUN_M6F_r4_34000__048e:
  048e  170EF3         LBSR 0x1384                       
  0491  1702D0         LBSR 0x0764                       
  0494  AD9FFE16       JSR [0xfe16]                      
  0498  39             RTS                               

; ---- function FUN_M6F_r4_34000__0499
FUN_M6F_r4_34000__0499:
  0499  17178F         LBSR 0x1c2b                       
  049c  1702FE         LBSR 0x079d                       
  049f  AD9FFE12       JSR [0xfe12]                      
  04a3  39             RTS                               

; ---- function FUN_M6F_r4_34000__04a4
FUN_M6F_r4_34000__04a4:
  04a4  17187E         LBSR 0x1d25                       
  04a7  1702F3         LBSR 0x079d                       
  04aa  AD9FFE14       JSR [0xfe14]                      
  04ae  39             RTS                               

; ---- function FUN_M6F_r4_34000__04af
FUN_M6F_r4_34000__04af:
  04af  171918         LBSR 0x1dca                       
  04b2  17031A         LBSR 0x07cf                       
  04b5  AD9FFE10       JSR [0xfe10]                      
  04b9  39             RTS                               

; ---- function FUN_M6F_r4_34000__04ba
FUN_M6F_r4_34000__04ba:
  04ba  1719BB         LBSR 0x1e78                       
  04bd  17030F         LBSR 0x07cf                       
  04c0  AD9FFE12       JSR [0xfe12]                      
  04c4  39             RTS                               

; ---- function FUN_M6F_r4_34000__04c5
FUN_M6F_r4_34000__04c5:
  04c5  171A5E         LBSR 0x1f26                       
  04c8  17075E         LBSR 0x0c29                       
  04cb  AD9FFE10       JSR [0xfe10]                      
  04cf  39             RTS                               

; ---- function FUN_M6F_r4_34000__04d0
FUN_M6F_r4_34000__04d0:
  04d0  171ACE         LBSR 0x1fa1                       
  04d3  170753         LBSR 0x0c29                       
  04d6  AD9FFE12       JSR [0xfe12]                      
  04da  39             RTS                               

; ---- function FUN_M6F_r4_34000__04db
FUN_M6F_r4_34000__04db:
  04db  171B3E         LBSR 0x201c                       
  04de  170783         LBSR 0x0c64                       
  04e1  AD9FFE10       JSR [0xfe10]                      
  04e5  39             RTS                               

; ---- function FUN_M6F_r4_34000__04e6
FUN_M6F_r4_34000__04e6:
  04e6  171BAE         LBSR 0x2097                       
  04e9  170778         LBSR 0x0c64                       
  04ec  AD9FFE12       JSR [0xfe12]                      
  04f0  39             RTS                               

; ---- function FUN_M6F_r4_34000__04f1
FUN_M6F_r4_34000__04f1:
  04f1  171CF0         LBSR 0x21e4                       
  04f4  1706F0         LBSR 0x0be7                       
  04f7  AD9FFE10       JSR [0xfe10]                      
  04fb  39             RTS                               

; ---- function FUN_M6F_r4_34000__04fc
FUN_M6F_r4_34000__04fc:
  04fc  171BE1         LBSR 0x20e0                       
  04ff  1706E5         LBSR 0x0be7                       
  0502  AD9FFE12       JSR [0xfe12]                      
  0506  39             RTS                               

; ---- function FUN_M6F_r4_34000__0507
FUN_M6F_r4_34000__0507:
  0507  171DAD         LBSR 0x22b7                       
  050a  1706DA         LBSR 0x0be7                       
  050d  AD9FFE14       JSR [0xfe14]                      
  0511  39             RTS                               

; ---- function FUN_M6F_r4_34000__0512
FUN_M6F_r4_34000__0512:
  0512  170F48         LBSR 0x145d                       
  0515  17050D         LBSR 0x0a25                       
  0518  AD9FFE10       JSR [0xfe10]                      
  051c  39             RTS                               

; ---- function FUN_M6F_r4_34000__051d
FUN_M6F_r4_34000__051d:
  051d  171076         LBSR 0x1596                       
  0520  170502         LBSR 0x0a25                       
  0523  AD9FFE12       JSR [0xfe12]                      
  0527  39             RTS                               

; ---- function FUN_M6F_r4_34000__0528
FUN_M6F_r4_34000__0528:
  0528  1710F4         LBSR 0x161f                       
  052b  170546         LBSR 0x0a74                       
  052e  AD9FFE10       JSR [0xfe10]                      
  0532  39             RTS                               

; ---- function FUN_M6F_r4_34000__0533
FUN_M6F_r4_34000__0533:
  0533  171172         LBSR 0x16a8                       
  0536  17053B         LBSR 0x0a74                       
  0539  AD9FFE12       JSR [0xfe12]                      
  053d  39             RTS                               

; ---- function FUN_M6F_r4_34000__053e
FUN_M6F_r4_34000__053e:
  053e  1711F0         LBSR 0x1731                       
  0541  17056F         LBSR 0x0ab3                       
  0544  AD9FFE10       JSR [0xfe10]                      
  0548  39             RTS                               

; ---- function FUN_M6F_r4_34000__0549
FUN_M6F_r4_34000__0549:
  0549  17126E         LBSR 0x17ba                       
  054c  170564         LBSR 0x0ab3                       
  054f  AD9FFE12       JSR [0xfe12]                      
  0553  39             RTS                               

; ---- function FUN_M6F_r4_34000__0554
FUN_M6F_r4_34000__0554:
  0554  1712EC         LBSR 0x1843                       
  0557  170598         LBSR 0x0af2                       
  055a  AD9FFE10       JSR [0xfe10]                      
  055e  39             RTS                               

; ---- function FUN_M6F_r4_34000__055f
FUN_M6F_r4_34000__055f:
  055f  17136A         LBSR 0x18cc                       
  0562  17058D         LBSR 0x0af2                       
  0565  AD9FFE12       JSR [0xfe12]                      
  0569  39             RTS                               

; ---- function FUN_M6F_r4_34000__056a
FUN_M6F_r4_34000__056a:
  056a  1713E8         LBSR 0x1955                       
  056d  1705C1         LBSR 0x0b31                       
  0570  AD9FFE10       JSR [0xfe10]                      
  0574  39             RTS                               

; ---- function FUN_M6F_r4_34000__0575
FUN_M6F_r4_34000__0575:
  0575  171466         LBSR 0x19de                       
  0578  1705B6         LBSR 0x0b31                       
  057b  AD9FFE12       JSR [0xfe12]                      
  057f  39             RTS                               

; ---- function FUN_M6F_r4_34000__0580
FUN_M6F_r4_34000__0580:
  0580  1714E4         LBSR 0x1a67                       
  0583  1705EA         LBSR 0x0b70                       
  0586  AD9FFE10       JSR [0xfe10]                      
  058a  39             RTS                               

; ---- function FUN_M6F_r4_34000__058b
FUN_M6F_r4_34000__058b:
  058b  171562         LBSR 0x1af0                       
  058e  170617         LBSR 0x0ba8                       
  0591  AD9FFE10       JSR [0xfe10]                      
  0595  39             RTS                               

; ---- function FUN_M6F_r4_34000__0596
FUN_M6F_r4_34000__0596:
  0596  1715E0         LBSR 0x1b79                       
  0599  17060C         LBSR 0x0ba8                       
  059c  AD9FFE12       JSR [0xfe12]                      
  05a0  39             RTS                               

; ---- function FUN_M6F_r4_34000__05a1
FUN_M6F_r4_34000__05a1:
  05a1  3476           PSHS  U Y X B A                   
  05a3  1A40           ORCC #0x40                        
  05a5  CC05C6         LDD #0x5c6                        
  05a8  F3600D         ADDD 0x600d                       
  05ab  1F01           TFR D,X                           
  05ad  CC05F5         LDD #0x5f5                        
  05b0  F3600D         ADDD 0x600d                       
  05b3  1F03           TFR D,U                           
  05b5  108E6600       LDY #0x6600                       
  05b9  AD9FFD08       JSR [0xfd08]                      
  05bd  AD9FFD76       JSR [0xfd76]                      
  05c1  1CBF           ANDCC #0xbf                       
  05c3  3576           PULS  A B X Y U                   
  05c5  39             RTS                               

; ---- function FUN_M6F_r4_34000__05c6
FUN_M6F_r4_34000__05c6:
  05c6  3436           PSHS  Y X B A                     
  05c8  3401           PSHS  CC                          
  05ca  AD9FFC54       JSR [0xfc54]                      
  05ce  FC7106         LDD 0x7106                        
  05d1  2615           BNE 0x05e8                        
  05d3  CC05F5         LDD #0x5f5                        
  05d6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  05da  6013           addr 6013                         
LAB_M6F_r4_34000__05dc:
  05dc  AD9FFC56       JSR [0xfc56]                      
  05e0  3501           PULS CC                           
  05e2  3536           PULS  A B X Y                     
  05e4  3261           LEAS 0x1,S                        
  05e6  3580           PULS  PC                          
LAB_M6F_r4_34000__05e8:
  05e8  AD9FFD76       JSR [0xfd76]                      
  05ec  AD9FFC56       JSR [0xfc56]                      
  05f0  3501           PULS CC                           
  05f2  3536           PULS  A B X Y                     
  05f4  3B             RTI                               

; ---- function FUN_M6F_r4_34000__05f5
FUN_M6F_r4_34000__05f5:
  05f5  3436           PSHS  Y X B A                     
  05f7  CC000A         LDD #0xa                          
  05fa  AD9FFD20       JSR [0xfd20]                      
  05fe  108E0428       LDY #0x428                        
  0602  FC7116         LDD 0x7116                        
  0605  AD9FFD2E       JSR [0xfd2e]                      
  0609  CC000A         LDD #0xa                          
  060c  AD9FFD20       JSR [0xfd20]                      
  0610  108E0429       LDY #0x429                        
  0614  FC7118         LDD 0x7118                        
  0617  AD9FFD2E       JSR [0xfd2e]                      
  061b  CC000A         LDD #0xa                          
  061e  AD9FFD20       JSR [0xfd20]                      
  0622  108E042A       LDY #0x42a                        
  0626  FC711A         LDD 0x711a                        
  0629  AD9FFD2E       JSR [0xfd2e]                      
  062d  CC000A         LDD #0xa                          
  0630  AD9FFD20       JSR [0xfd20]                      
  0634  108E042B       LDY #0x42b                        
  0638  FC711C         LDD 0x711c                        
  063b  AD9FFD2E       JSR [0xfd2e]                      
  063f  CC000A         LDD #0xa                          
  0642  AD9FFD20       JSR [0xfd20]                      
  0646  108E042C       LDY #0x42c                        
  064a  FC711E         LDD 0x711e                        
  064d  AD9FFD2E       JSR [0xfd2e]                      
  0651  CC000A         LDD #0xa                          
  0654  AD9FFD20       JSR [0xfd20]                      
  0658  108E0426       LDY #0x426                        
  065c  FC712E         LDD 0x712e                        
  065f  AD9FFD2E       JSR [0xfd2e]                      
  0663  CC000A         LDD #0xa                          
  0666  AD9FFD20       JSR [0xfd20]                      
  066a  108E0421       LDY #0x421                        
  066e  FC7122         LDD 0x7122                        
  0671  AD9FFD2E       JSR [0xfd2e]                      
  0675  CC000A         LDD #0xa                          
  0678  AD9FFD20       JSR [0xfd20]                      
  067c  108E0422       LDY #0x422                        
  0680  FC7124         LDD 0x7124                        
  0683  AD9FFD2E       JSR [0xfd2e]                      
  0687  CC000A         LDD #0xa                          
  068a  AD9FFD20       JSR [0xfd20]                      
  068e  108E0423       LDY #0x423                        
  0692  FC7126         LDD 0x7126                        
  0695  AD9FFD2E       JSR [0xfd2e]                      
  0699  CC000A         LDD #0xa                          
  069c  AD9FFD20       JSR [0xfd20]                      
  06a0  108E0424       LDY #0x424                        
  06a4  FC7128         LDD 0x7128                        
  06a7  AD9FFD2E       JSR [0xfd2e]                      
  06ab  CC000A         LDD #0xa                          
  06ae  AD9FFD20       JSR [0xfd20]                      
  06b2  108E0420       LDY #0x420                        
  06b6  FC712A         LDD 0x712a                        
  06b9  AD9FFD2E       JSR [0xfd2e]                      
  06bd  CC000A         LDD #0xa                          
  06c0  AD9FFD20       JSR [0xfd20]                      
  06c4  108E042D       LDY #0x42d                        
  06c8  FC70E4         LDD 0x70e4                        
  06cb  AD9FFD2E       JSR [0xfd2e]                      
  06cf  CC0C9F         LDD #0xc9f                        
  06d2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  06d6  6013           addr 6013                         
LAB_M6F_r4_34000__06d8:
  06d8  CCFFFF         LDD #0xffff                       
  06db  FD7106         STD 0x7106                        
  06de  AD9FFD76       JSR [0xfd76]                      
  06e2  1CBF           ANDCC #0xbf                       
  06e4  3536           PULS  A B X Y                     
  06e6  39             RTS                               

; ---- function FUN_M6F_r4_34000__06e7
FUN_M6F_r4_34000__06e7:
  06e7  AD9FFE18       JSR [0xfe18]                      
  06eb  AD9FFD7C       JSR [0xfd7c]                      
  06ef  39             RTS                               

; ---- function FUN_M6F_r4_34000__06f0
FUN_M6F_r4_34000__06f0:
  06f0  AD9FFDFC       JSR [0xfdfc]                      
  06f4  39             RTS                               
LAB_M6F_r4_34000__06f5:
  06f5  C600           LDB #0x0                          
  06f7  AD9FFC36       JSR [0xfc36]                      
  06fb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  06ff  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M6F_r4_34000__0728:
  0728  3577           PULS CC A B X Y U                 
  072a  39             RTS                               

; ---- function FUN_M6F_r4_34000__072b
FUN_M6F_r4_34000__072b:
  072b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "cutoff 1" "cutoff 2" "q fact 1" "q fact 2"
  072f  6375746F6666.. ds "cutoff 1"                     
  0737  6375746F6666.. ds "cutoff 2"                     
  073f  712066616374.. ds "q fact 1"                     
  0747  712066616374.. ds "q fact 2"                     
LAB_M6F_r4_34000__074f:
  074f  AD9FFDF2       JSR [0xfdf2]                      
  0753  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D23 ->$0DFC ->$0E78 ->$0FC0 ->$0764 ->$07CF
  0757  0D23           addr M6F_r4_34000::0d23           
  0759  0DFC           addr M6F_r4_34000::0dfc           
  075b  0E78           addr M6F_r4_34000::0e78           
  075d  0FC0           addr M6F_r4_34000::0fc0           
  075f  0764           addr M6F_r4_34000::0764           
  0761  07CF           addr M6F_r4_34000::07cf           
LAB_M6F_r4_34000__0763:
  0763  39             RTS                               

; ---- function FUN_M6F_r4_34000__0764
FUN_M6F_r4_34000__0764:
  0764  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " delay 1" " delay 2" "scale 1 " "scale 2 "
  0768  2064656C6179.. ds " delay 1"                     
  0770  2064656C6179.. ds " delay 2"                     
  0778  7363616C6520.. ds "scale 1 "                     
  0780  7363616C6520.. ds "scale 2 "                     
LAB_M6F_r4_34000__0788:
  0788  AD9FFDF2       JSR [0xfdf2]                      
  078c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1165 ->$122F ->$12FC ->$13D5 ->$079D ->$072B
  0790  1165           addr M6F_r4_34000::1165           
  0792  122F           addr M6F_r4_34000::122f           
  0794  12FC           addr M6F_r4_34000::12fc           
  0796  13D5           addr M6F_r4_34000::13d5           
  0798  079D           addr M6F_r4_34000::079d           
  079a  072B           addr M6F_r4_34000::072b           
LAB_M6F_r4_34000__079c:
  079c  39             RTS                               

; ---- function FUN_M6F_r4_34000__079d
FUN_M6F_r4_34000__079d:
  079d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " coarse " "  fine  " "p delay " [*]
  07a1  20636F617273.. ds " coarse "                     
  07a9  202066696E65.. ds "  fine  "                     
  07b1  702064656C61.. ds "p delay "                     
  07b9  01             db 1h                             
LAB_M6F_r4_34000__07ba:
  07ba  AD9FFDF2       JSR [0xfdf2]                      
  07be  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1BD0 ->$1C37 ->$1D19 ->$0C9F ->$07CF ->$0764
  07c2  1BD0           addr M6F_r4_34000::1bd0           
  07c4  1C37           addr M6F_r4_34000::1c37           
  07c6  1D19           addr M6F_r4_34000::1d19           
  07c8  0C9F           addr M6F_r4_34000::0c9f           
  07ca  07CF           addr M6F_r4_34000::07cf           
  07cc  0764           addr M6F_r4_34000::0764           
LAB_M6F_r4_34000__07ce:
  07ce  39             RTS                               

; ---- function FUN_M6F_r4_34000__07cf
FUN_M6F_r4_34000__07cf:
  07cf  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" " levels " " expert "
  07d3  6C656674206D.. ds "left mix"                     
  07db  72696768746D.. ds "rightmix"                     
  07e3  206C6576656C.. ds " levels "                     
  07eb  206578706572.. ds " expert "                     
LAB_M6F_r4_34000__07f3:
  07f3  AD9FFDF2       JSR [0xfdf2]                      
  07f7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1DBE ->$1E6C ->$0C29 ->$080E ->$072B ->$079D
  07fb  1DBE           addr M6F_r4_34000::1dbe           
  07fd  1E6C           addr M6F_r4_34000::1e6c           
  07ff  0C29           addr M6F_r4_34000::0c29           
  0801  080E           addr M6F_r4_34000::080e           
  0803  072B           addr M6F_r4_34000::072b           
  0805  079D           addr M6F_r4_34000::079d           
LAB_M6F_r4_34000__0807:
  0807  CC07CF         LDD #0x7cf                        
  080a  FD7140         STD 0x7140                        
  080d  39             RTS                               

; ---- function FUN_M6F_r4_34000__080e
FUN_M6F_r4_34000__080e:
  080e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "patching" "deglitch" [*] " return "
  0812  706174636869.. ds "patching"                     
  081a  6465676C6974.. ds "deglitch"                     
  0822  01             db 1h                             
  0823  207265747572.. ds " return "                     
LAB_M6F_r4_34000__082b:
  082b  AD9FFDF2       JSR [0xfdf2]                      
  082f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A17 ->$0BE7 ->$0C9F ->$07CF ->$080E ->$080E
  0833  0A17           addr M6F_r4_34000::0a17           
  0835  0BE7           addr M6F_r4_34000::0be7           
  0837  0C9F           addr M6F_r4_34000::0c9f           
  0839  07CF           addr M6F_r4_34000::07cf           
  083b  080E           addr M6F_r4_34000::080e           
  083d  080E           addr M6F_r4_34000::080e           
LAB_M6F_r4_34000__083f:
  083f  CC080E         LDD #0x80e                        
  0842  FD7140         STD 0x7140                        
  0845  39             RTS                               

; ---- function FUN_M6F_r4_34000__0846
FUN_M6F_r4_34000__0846:
  0846  3476           PSHS  U Y X B A                   
  0848  17FEA5         LBSR 0x06f0                       
  084b  C604           LDB #0x4                          
  084d  AD9FFC36       JSR [0xfc36]                      
  0851  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " Output level is now    dB lower    "
  0855  0A4F75747075.. char[37] "\nOutput level is now    dB lower    "
LAB_M6F_r4_34000__087a:
  087a  CC0000         LDD #0x0                          
  087d  FD70EA         STD 0x70ea                        
  0880  17001D         LBSR 0x08a0                       
  0883  3576           PULS  A B X Y U                   
  0885  39             RTS                               

; ---- function FUN_M6F_r4_34000__0886
FUN_M6F_r4_34000__0886:
  0886  3476           PSHS  U Y X B A                   
  0888  C618           LDB #0x18                         
  088a  AD9FFC36       JSR [0xfc36]                      
  088e  FC70E8         LDD 0x70e8                        
  0891  3606           PSHU  B A                         
  0893  AD9FFCC8       JSR [0xfcc8]                      
  0897  3706           PULU  A B                         
  0899  AD9FFC44       JSR [0xfc44]                      
  089d  3576           PULS  A B X Y U                   
  089f  39             RTS                               

; ---- function FUN_M6F_r4_34000__08a0
FUN_M6F_r4_34000__08a0:
  08a0  3476           PSHS  U Y X B A                   
LAB_M6F_r4_34000__08a2:
  08a2  FC70E8         LDD 0x70e8                        
  08a5  1083FFF1       CMPD #0xfff1                      
  08a9  2F4A           BLE 0x08f5                        
  08ab  830001         SUBD #0x1                         
  08ae  FD70E8         STD 0x70e8                        
  08b1  FC70AE         LDD 0x70ae                        
  08b4  830001         SUBD #0x1                         
  08b7  FD70AE         STD 0x70ae                        
  08ba  CC0023         LDD #0x23                         
  08bd  830008         SUBD #0x8                         
  08c0  1F02           TFR D,Y                           
  08c2  FC70AE         LDD 0x70ae                        
  08c5  AD9FFC80       JSR [0xfc80]                      
  08c9  AD9FFE56       JSR [0xfe56]                      
  08cd  FC70B6         LDD 0x70b6                        
  08d0  830001         SUBD #0x1                         
  08d3  FD70B6         STD 0x70b6                        
  08d6  CC0024         LDD #0x24                         
  08d9  830008         SUBD #0x8                         
  08dc  1F02           TFR D,Y                           
  08de  FC70B6         LDD 0x70b6                        
  08e1  AD9FFC80       JSR [0xfc80]                      
  08e5  AD9FFE58       JSR [0xfe58]                      
  08e9  17FF9A         LBSR 0x0886                       
  08ec  CC03E8         LDD #0x3e8                        
  08ef  AD9FFD20       JSR [0xfd20]                      
  08f3  20AD           BRA 0x08a2                        
LAB_M6F_r4_34000__08f5:
  08f5  17FF8E         LBSR 0x0886                       
  08f8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "--loud--" [-]
  08fc  00             db 0h                             
  08fd  00             db 0h                             
  08fe  2D2D6C6F7564.. ds "--loud--"                     
  0906  00             db 0h                             
LAB_M6F_r4_34000__0907:
  0907  AD9FFDF2       JSR [0xfdf2]                      
  090b  CC0917         LDD #0x917                        
  090e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  0912  60E7           addr 60e7                         
LAB_M6F_r4_34000__0914:
  0914  3576           PULS  A B X Y U                   
  0916  39             RTS                               

; ---- function FUN_M6F_r4_34000__0917
FUN_M6F_r4_34000__0917:
  0917  3476           PSHS  U Y X B A                   
  0919  17FDD4         LBSR 0x06f0                       
  091c  C604           LDB #0x4                          
  091e  AD9FFC36       JSR [0xfc36]                      
  0922  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " Output level is now    dB lower    "
  0926  0A4F75747075.. char[37] "\nOutput level is now    dB lower    "
LAB_M6F_r4_34000__094b:
  094b  CCFFFF         LDD #0xffff                       
  094e  FD70EA         STD 0x70ea                        
  0951  17001D         LBSR 0x0971                       
  0954  3576           PULS  A B X Y U                   
  0956  39             RTS                               

; ---- function FUN_M6F_r4_34000__0957
FUN_M6F_r4_34000__0957:
  0957  3476           PSHS  U Y X B A                   
  0959  C618           LDB #0x18                         
  095b  AD9FFC36       JSR [0xfc36]                      
  095f  FC70E8         LDD 0x70e8                        
  0962  3606           PSHU  B A                         
  0964  AD9FFCC8       JSR [0xfcc8]                      
  0968  3706           PULU  A B                         
  096a  AD9FFC44       JSR [0xfc44]                      
  096e  3576           PULS  A B X Y U                   
  0970  39             RTS                               

; ---- function FUN_M6F_r4_34000__0971
FUN_M6F_r4_34000__0971:
  0971  3476           PSHS  U Y X B A                   
LAB_M6F_r4_34000__0973:
  0973  FC70E8         LDD 0x70e8                        
  0976  10830000       CMPD #0x0                         
  097a  2C4A           BGE 0x09c6                        
  097c  C30001         ADDD #0x1                         
  097f  FD70E8         STD 0x70e8                        
  0982  FC70AE         LDD 0x70ae                        
  0985  C30001         ADDD #0x1                         
  0988  FD70AE         STD 0x70ae                        
  098b  CC0023         LDD #0x23                         
  098e  830008         SUBD #0x8                         
  0991  1F02           TFR D,Y                           
  0993  FC70AE         LDD 0x70ae                        
  0996  AD9FFC80       JSR [0xfc80]                      
  099a  AD9FFE56       JSR [0xfe56]                      
  099e  FC70B6         LDD 0x70b6                        
  09a1  C30001         ADDD #0x1                         
  09a4  FD70B6         STD 0x70b6                        
  09a7  CC0024         LDD #0x24                         
  09aa  830008         SUBD #0x8                         
  09ad  1F02           TFR D,Y                           
  09af  FC70B6         LDD 0x70b6                        
  09b2  AD9FFC80       JSR [0xfc80]                      
  09b6  AD9FFE58       JSR [0xfe58]                      
  09ba  17FF9A         LBSR 0x0957                       
  09bd  CC03E8         LDD #0x3e8                        
  09c0  AD9FFD20       JSR [0xfd20]                      
  09c4  20AD           BRA 0x0973                        
LAB_M6F_r4_34000__09c6:
  09c6  17FD27         LBSR 0x06f0                       
  09c9  C604           LDB #0x4                          
  09cb  AD9FFC36       JSR [0xfc36]                      
  09cf  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " Output level is now normal         "
  09d3  0A4F75747075.. char[37] "\nOutput level is now normal         "
LAB_M6F_r4_34000__09f8:
  09f8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "--soft--" [-]
  09fc  00             db 0h                             
  09fd  00             db 0h                             
  09fe  2D2D736F6674.. ds "--soft--"                     
  0a06  00             db 0h                             
LAB_M6F_r4_34000__0a07:
  0a07  AD9FFDF2       JSR [0xfdf2]                      
  0a0b  CC0846         LDD #0x846                        
  0a0e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  0a12  60E7           addr 60e7                         
LAB_M6F_r4_34000__0a14:
  0a14  3576           PULS  A B X Y U                   
  0a16  39             RTS                               

; ---- function FUN_M6F_r4_34000__0a17
FUN_M6F_r4_34000__0a17:
  0a17  17FE2C         LBSR 0x0846                       
  0a1a  170008         LBSR 0x0a25                       
  0a1d  39             RTS                               

; ---- function FUN_M6F_r4_34000__0a1e
FUN_M6F_r4_34000__0a1e:
  0a1e  17FEF6         LBSR 0x0917                       
  0a21  17FDEA         LBSR 0x080e                       
  0a24  39             RTS                               

; ---- function FUN_M6F_r4_34000__0a25
FUN_M6F_r4_34000__0a25:
  0a25  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "filt1 in" "filt2 in" [-] " return "
  0a29  66696C743120.. ds "filt1 in"                     
  0a31  66696C743220.. ds "filt2 in"                     
  0a39  00             db 0h                             
  0a3a  207265747572.. ds " return "                     
LAB_M6F_r4_34000__0a42:
  0a42  AD9FFDF2       JSR [0xfdf2]                      
  0a46  CC1451         LDD #0x1451                       
  0a49  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0a4d  60E3           addr 60e3                         
LAB_M6F_r4_34000__0a4f:
  0a4f  CC158A         LDD #0x158a                       
  0a52  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0a56  60E5           addr 60e5                         
LAB_M6F_r4_34000__0a58:
  0a58  CC0A1E         LDD #0xa1e                        
  0a5b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0a5f  60E9           addr 60e9                         
LAB_M6F_r4_34000__0a61:
  0a61  CC0A74         LDD #0xa74                        
  0a64  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0a68  603A           addr 603a                         
LAB_M6F_r4_34000__0a6a:
  0a6a  CC0BA8         LDD #0xba8                        
  0a6d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0a71  6036           addr 6036                         
LAB_M6F_r4_34000__0a73:
  0a73  39             RTS                               

; ---- function FUN_M6F_r4_34000__0a74
FUN_M6F_r4_34000__0a74:
  0a74  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay1in" "delay2in" [-] [-]
  0a78  64656C617931.. ds "delay1in"                     
  0a80  64656C617932.. ds "delay2in"                     
  0a88  00             db 0h                             
  0a89  00             db 0h                             
LAB_M6F_r4_34000__0a8a:
  0a8a  AD9FFDF2       JSR [0xfdf2]                      
  0a8e  CC1613         LDD #0x1613                       
  0a91  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0a95  60E3           addr 60e3                         
LAB_M6F_r4_34000__0a97:
  0a97  CC169C         LDD #0x169c                       
  0a9a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0a9e  60E5           addr 60e5                         
LAB_M6F_r4_34000__0aa0:
  0aa0  CC0AB3         LDD #0xab3                        
  0aa3  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0aa7  603A           addr 603a                         
LAB_M6F_r4_34000__0aa9:
  0aa9  CC0A25         LDD #0xa25                        
  0aac  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0ab0  6036           addr 6036                         
LAB_M6F_r4_34000__0ab2:
  0ab2  39             RTS                               

; ---- function FUN_M6F_r4_34000__0ab3
FUN_M6F_r4_34000__0ab3:
  0ab3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "scale1in" "scale2in" [-] [-]
  0ab7  7363616C6531.. ds "scale1in"                     
  0abf  7363616C6532.. ds "scale2in"                     
  0ac7  00             db 0h                             
  0ac8  00             db 0h                             
LAB_M6F_r4_34000__0ac9:
  0ac9  AD9FFDF2       JSR [0xfdf2]                      
  0acd  CC1725         LDD #0x1725                       
  0ad0  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0ad4  60E3           addr 60e3                         
LAB_M6F_r4_34000__0ad6:
  0ad6  CC17AE         LDD #0x17ae                       
  0ad9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0add  60E5           addr 60e5                         
LAB_M6F_r4_34000__0adf:
  0adf  CC0AF2         LDD #0xaf2                        
  0ae2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0ae6  603A           addr 603a                         
LAB_M6F_r4_34000__0ae8:
  0ae8  CC0A74         LDD #0xa74                        
  0aeb  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0aef  6036           addr 6036                         
LAB_M6F_r4_34000__0af1:
  0af1  39             RTS                               

; ---- function FUN_M6F_r4_34000__0af2
FUN_M6F_r4_34000__0af2:
  0af2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "sum1a in" "sum1b in" [-] [-]
  0af6  73756D316120.. ds "sum1a in"                     
  0afe  73756D316220.. ds "sum1b in"                     
  0b06  00             db 0h                             
  0b07  00             db 0h                             
LAB_M6F_r4_34000__0b08:
  0b08  AD9FFDF2       JSR [0xfdf2]                      
  0b0c  CC1837         LDD #0x1837                       
  0b0f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0b13  60E3           addr 60e3                         
LAB_M6F_r4_34000__0b15:
  0b15  CC18C0         LDD #0x18c0                       
  0b18  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0b1c  60E5           addr 60e5                         
LAB_M6F_r4_34000__0b1e:
  0b1e  CC0B31         LDD #0xb31                        
  0b21  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0b25  603A           addr 603a                         
LAB_M6F_r4_34000__0b27:
  0b27  CC0AB3         LDD #0xab3                        
  0b2a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0b2e  6036           addr 6036                         
LAB_M6F_r4_34000__0b30:
  0b30  39             RTS                               

; ---- function FUN_M6F_r4_34000__0b31
FUN_M6F_r4_34000__0b31:
  0b31  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "sum2a in" "sum2b in" [-] [-]
  0b35  73756D326120.. ds "sum2a in"                     
  0b3d  73756D326220.. ds "sum2b in"                     
  0b45  00             db 0h                             
  0b46  00             db 0h                             
LAB_M6F_r4_34000__0b47:
  0b47  AD9FFDF2       JSR [0xfdf2]                      
  0b4b  CC1949         LDD #0x1949                       
  0b4e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0b52  60E3           addr 60e3                         
LAB_M6F_r4_34000__0b54:
  0b54  CC19D2         LDD #0x19d2                       
  0b57  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0b5b  60E5           addr 60e5                         
LAB_M6F_r4_34000__0b5d:
  0b5d  CC0B70         LDD #0xb70                        
  0b60  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0b64  603A           addr 603a                         
LAB_M6F_r4_34000__0b66:
  0b66  CC0AF2         LDD #0xaf2                        
  0b69  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0b6d  6036           addr 6036                         
LAB_M6F_r4_34000__0b6f:
  0b6f  39             RTS                               

; ---- function FUN_M6F_r4_34000__0b70
FUN_M6F_r4_34000__0b70:
  0b70  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "shift in" [*] [-] [-]
  0b74  736869667420.. ds "shift in"                     
  0b7c  01             db 1h                             
  0b7d  00             db 0h                             
  0b7e  00             db 0h                             
LAB_M6F_r4_34000__0b7f:
  0b7f  AD9FFDF2       JSR [0xfdf2]                      
  0b83  CC1A5B         LDD #0x1a5b                       
  0b86  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0b8a  60E3           addr 60e3                         
LAB_M6F_r4_34000__0b8c:
  0b8c  CC0C9F         LDD #0xc9f                        
  0b8f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0b93  60E5           addr 60e5                         
LAB_M6F_r4_34000__0b95:
  0b95  CC0BA8         LDD #0xba8                        
  0b98  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0b9c  603A           addr 603a                         
LAB_M6F_r4_34000__0b9e:
  0b9e  CC0B31         LDD #0xb31                        
  0ba1  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0ba5  6036           addr 6036                         
LAB_M6F_r4_34000__0ba7:
  0ba7  39             RTS                               

; ---- function FUN_M6F_r4_34000__0ba8
FUN_M6F_r4_34000__0ba8:
  0ba8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l output" "r output" [-] [-]
  0bac  6C206F757470.. ds "l output"                     
  0bb4  72206F757470.. ds "r output"                     
  0bbc  00             db 0h                             
  0bbd  00             db 0h                             
LAB_M6F_r4_34000__0bbe:
  0bbe  AD9FFDF2       JSR [0xfdf2]                      
  0bc2  CC1AE4         LDD #0x1ae4                       
  0bc5  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0bc9  60E3           addr 60e3                         
LAB_M6F_r4_34000__0bcb:
  0bcb  CC1B6D         LDD #0x1b6d                       
  0bce  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E5
  0bd2  60E5           addr 60e5                         
LAB_M6F_r4_34000__0bd4:
  0bd4  CC0A25         LDD #0xa25                        
  0bd7  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  0bdb  603A           addr 603a                         
LAB_M6F_r4_34000__0bdd:
  0bdd  CC0B70         LDD #0xb70                        
  0be0  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6036
  0be4  6036           addr 6036                         
LAB_M6F_r4_34000__0be6:
  0be6  39             RTS                               

; ---- function FUN_M6F_r4_34000__0be7
FUN_M6F_r4_34000__0be7:
  0be7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "low note" "highnote" " source " " return "
  0beb  6C6F77206E6F.. ds "low note"                     
  0bf3  686967686E6F.. ds "highnote"                     
  0bfb  20736F757263.. ds " source "                     
  0c03  207265747572.. ds " return "                     
LAB_M6F_r4_34000__0c0b:
  0c0b  AD9FFDF2       JSR [0xfdf2]                      
  0c0f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2208 ->$2104 ->$22DB ->$0C9F ->$0BE7 ->$0BE7
  0c13  2208           addr M6F_r4_34000::2208           
  0c15  2104           addr M6F_r4_34000::2104           
  0c17  22DB           addr M6F_r4_34000::22db           
  0c19  0C9F           addr M6F_r4_34000::0c9f           
  0c1b  0BE7           addr M6F_r4_34000::0be7           
  0c1d  0BE7           addr M6F_r4_34000::0be7           
LAB_M6F_r4_34000__0c1f:
  0c1f  FC7140         LDD 0x7140                        
  0c22  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0c26  60E9           addr 60e9                         
LAB_M6F_r4_34000__0c28:
  0c28  39             RTS                               

; ---- function FUN_M6F_r4_34000__0c29
FUN_M6F_r4_34000__0c29:
  0c29  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  0c2d  6C6566742069.. ds "left in "                     
  0c35  726967687420.. ds "right in"                     
  0c3d  01             db 1h                             
  0c3e  207265747572.. ds " return "                     
LAB_M6F_r4_34000__0c46:
  0c46  AD9FFDF2       JSR [0xfdf2]                      
  0c4a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1F1A ->$1F95 ->$0C9F ->$0C9F ->$0C64 ->$0C64
  0c4e  1F1A           addr M6F_r4_34000::1f1a           
  0c50  1F95           addr M6F_r4_34000::1f95           
  0c52  0C9F           addr M6F_r4_34000::0c9f           
  0c54  0C9F           addr M6F_r4_34000::0c9f           
  0c56  0C64           addr M6F_r4_34000::0c64           
  0c58  0C64           addr M6F_r4_34000::0c64           
LAB_M6F_r4_34000__0c5a:
  0c5a  FC7140         LDD 0x7140                        
  0c5d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0c61  60E9           addr 60e9                         
LAB_M6F_r4_34000__0c63:
  0c63  39             RTS                               

; ---- function FUN_M6F_r4_34000__0c64
FUN_M6F_r4_34000__0c64:
  0c64  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  0c68  6C656674206F.. ds "left out"                     
  0c70  72696768746F.. ds "rightout"                     
  0c78  01             db 1h                             
  0c79  207265747572.. ds " return "                     
LAB_M6F_r4_34000__0c81:
  0c81  AD9FFDF2       JSR [0xfdf2]                      
  0c85  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2010 ->$208B ->$0C9F ->$0C9F ->$0C29 ->$0C29
  0c89  2010           addr M6F_r4_34000::2010           
  0c8b  208B           addr M6F_r4_34000::208b           
  0c8d  0C9F           addr M6F_r4_34000::0c9f           
  0c8f  0C9F           addr M6F_r4_34000::0c9f           
  0c91  0C29           addr M6F_r4_34000::0c29           
  0c93  0C29           addr M6F_r4_34000::0c29           
LAB_M6F_r4_34000__0c95:
  0c95  FC7140         LDD 0x7140                        
  0c98  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0c9c  60E9           addr 60e9                         
LAB_M6F_r4_34000__0c9e:
  0c9e  39             RTS                               

; ---- function FUN_M6F_r4_34000__0c9f
FUN_M6F_r4_34000__0c9f:
  0c9f  39             RTS                               
PTR_FUN_M6F_r4_34000__0d36_M6F_r4_34000__0ca0:
  0ca0  0D36           addr M6F_r4_34000::0d36           
  0ca2  0CEA           addr M6F_r4_34000::0cea           
  0ca4  .db 0C DE 70 00 70 02 00 00 70 04 00 08 00 69 00 00  ; ..p.p...p....i..
  0cb4  .db 00 1B 58 00 01 00 04 1E 0D 0E 00 00 00 00 70 06  ; ..X...........p.
  0cc4  .db 00 6D                                            ; .m

; ---- function FUN_M6F_r4_34000__0cc6
FUN_M6F_r4_34000__0cc6:
  0cc6  3410           PSHS  X                           
  0cc8  8E0CA0         LDX #0xca0                         ; desc[API_FE6A]: ->$0D36 ->$0CEA
  0ccb  AD9FFE6A       JSR [0xfe6a]                      
  0ccf  3510           PULS  X                           
  0cd1  39             RTS                               

; ---- function FUN_M6F_r4_34000__0cd2
FUN_M6F_r4_34000__0cd2:
  0cd2  3410           PSHS  X                           
  0cd4  8E0CA0         LDX #0xca0                         ; desc[API_FDBC]: ->$0D36 ->$0CEA
  0cd7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0cdb  3510           PULS  X                           
  0cdd  39             RTS                               

; ---- function FUN_M6F_r4_34000__0cde
FUN_M6F_r4_34000__0cde:
  0cde  3410           PSHS  X                           
  0ce0  8E0CA0         LDX #0xca0                         ; desc[API_FE6C]: ->$0D36 ->$0CEA
  0ce3  AD9FFE6C       JSR [0xfe6c]                      
  0ce7  3510           PULS  X                           
  0ce9  39             RTS                               

; ---- function FUN_M6F_r4_34000__0cea
FUN_M6F_r4_34000__0cea:
  0cea  3410           PSHS  X                           
  0cec  8E0CA0         LDX #0xca0                         ; desc[API_FE6E]: ->$0D36 ->$0CEA
  0cef  AD9FFE6E       JSR [0xfe6e]                      
  0cf3  3510           PULS  X                           
  0cf5  39             RTS                               

; ---- function FUN_M6F_r4_34000__0cf6
FUN_M6F_r4_34000__0cf6:
  0cf6  3410           PSHS  X                           
  0cf8  8E0CA0         LDX #0xca0                         ; desc[API_FE1C]: ->$0D36 ->$0CEA
  0cfb  AD9FFE1C       JSR [0xfe1c]                      
  0cff  3510           PULS  X                           
  0d01  39             RTS                               

; ---- function FUN_M6F_r4_34000__0d02
FUN_M6F_r4_34000__0d02:
  0d02  3410           PSHS  X                           
  0d04  8E0CA0         LDX #0xca0                         ; desc[API_FE1A]: ->$0D36 ->$0CEA $0CDE
  0d07  AD9FFE1A       JSR [0xfe1a]                      
  0d0b  3510           PULS  X                           
  0d0d  39             RTS                               
  0d0e  .db 14 63 75 74 6F 66 66 20 31 3A 20 20 20 20 20 20  ; .cutoff 1:      
  0d1e  .db 48 7A 20 20 20                                   ; Hz   

; ---- function FUN_M6F_r4_34000__0d23
FUN_M6F_r4_34000__0d23:
  0d23  3406           PSHS  B A                         
  0d25  17FF9E         LBSR 0x0cc6                       
  0d28  C605           LDB #0x5                          
  0d2a  F76066         STB 0x6066                        
  0d2d  CC0064         LDD #0x64                         
  0d30  FD60DC         STD 0x60dc                        
  0d33  3506           PULS  A B                         
  0d35  39             RTS                               

; ---- function FUN_M6F_r4_34000__0d36
FUN_M6F_r4_34000__0d36:
  0d36  3476           PSHS  U Y X B A                   
  0d38  8E0CA0         LDX #0xca0                        
  0d3b  AD9FFE76       JSR [0xfe76]                      
  0d3f  FC7004         LDD 0x7004                        
  0d42  3606           PSHU  B A                         
  0d44  CC0004         LDD #0x4                          
  0d47  3606           PSHU  B A                         
  0d49  AD9FFCEE       JSR [0xfcee]                      
  0d4d  FC7004         LDD 0x7004                        
  0d50  3606           PSHU  B A                         
  0d52  CC5591         LDD #0x5591                       
  0d55  3606           PSHU  B A                         
  0d57  AD9FFCF2       JSR [0xfcf2]                      
  0d5b  AD9FFCE2       JSR [0xfce2]                      
  0d5f  3706           PULU  A B                         
  0d61  FD70F2         STD 0x70f2                        
  0d64  CC000A         LDD #0xa                          
  0d67  AD9FFD20       JSR [0xfd20]                      
  0d6b  108E0140       LDY #0x140                        
  0d6f  FC70F2         LDD 0x70f2                        
  0d72  AD9FFD2E       JSR [0xfd2e]                      
  0d76  3576           PULS  A B X Y U                   
  0d78  39             RTS                               
PTR_FUN_M6F_r4_34000__0e0f_M6F_r4_34000__0d79:
  0d79  0E0F           addr M6F_r4_34000::0e0f           
  0d7b  0DC3           addr M6F_r4_34000::0dc3           
  0d7d  .db 0D B7 70 08 70 0A 00 00 70 0C 00 08 00 6B 01 00  ; ..p.p...p....k..
  0d8d  .db 00 1B 58 00 01 00 04 1E 0D E7 00 00 00 00 70 0E  ; ..X...........p.
  0d9d  .db 00 6F                                            ; .o

; ---- function FUN_M6F_r4_34000__0d9f
FUN_M6F_r4_34000__0d9f:
  0d9f  3410           PSHS  X                           
  0da1  8E0D79         LDX #0xd79                         ; desc[API_FE6A]: ->$0E0F ->$0DC3
  0da4  AD9FFE6A       JSR [0xfe6a]                      
  0da8  3510           PULS  X                           
  0daa  39             RTS                               

; ---- function FUN_M6F_r4_34000__0dab
FUN_M6F_r4_34000__0dab:
  0dab  3410           PSHS  X                           
  0dad  8E0D79         LDX #0xd79                         ; desc[API_FDBC]: ->$0E0F ->$0DC3
  0db0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...y"
  0db4  3510           PULS  X                           
  0db6  39             RTS                               

; ---- function FUN_M6F_r4_34000__0db7
FUN_M6F_r4_34000__0db7:
  0db7  3410           PSHS  X                           
  0db9  8E0D79         LDX #0xd79                         ; desc[API_FE6C]: ->$0E0F ->$0DC3
  0dbc  AD9FFE6C       JSR [0xfe6c]                      
  0dc0  3510           PULS  X                           
  0dc2  39             RTS                               

; ---- function FUN_M6F_r4_34000__0dc3
FUN_M6F_r4_34000__0dc3:
  0dc3  3410           PSHS  X                           
  0dc5  8E0D79         LDX #0xd79                         ; desc[API_FE6E]: ->$0E0F ->$0DC3
  0dc8  AD9FFE6E       JSR [0xfe6e]                      
  0dcc  3510           PULS  X                           
  0dce  39             RTS                               

; ---- function FUN_M6F_r4_34000__0dcf
FUN_M6F_r4_34000__0dcf:
  0dcf  3410           PSHS  X                           
  0dd1  8E0D79         LDX #0xd79                         ; desc[API_FE1C]: ->$0E0F ->$0DC3
  0dd4  AD9FFE1C       JSR [0xfe1c]                      
  0dd8  3510           PULS  X                           
  0dda  39             RTS                               

; ---- function FUN_M6F_r4_34000__0ddb
FUN_M6F_r4_34000__0ddb:
  0ddb  3410           PSHS  X                           
  0ddd  8E0D79         LDX #0xd79                         ; desc[API_FE1A]: ->$0E0F ->$0DC3 $0DB7
  0de0  AD9FFE1A       JSR [0xfe1a]                      
  0de4  3510           PULS  X                           
  0de6  39             RTS                               
  0de7  .db 14 63 75 74 6F 66 66 20 32 3A 20 20 20 20 20 20  ; .cutoff 2:      
  0df7  .db 48 7A 20 20 20                                   ; Hz   

; ---- function FUN_M6F_r4_34000__0dfc
FUN_M6F_r4_34000__0dfc:
  0dfc  3406           PSHS  B A                         
  0dfe  17FF9E         LBSR 0x0d9f                       
  0e01  C605           LDB #0x5                          
  0e03  F76066         STB 0x6066                        
  0e06  CC0064         LDD #0x64                         
  0e09  FD60DC         STD 0x60dc                        
  0e0c  3506           PULS  A B                         
  0e0e  39             RTS                               

; ---- function FUN_M6F_r4_34000__0e0f
FUN_M6F_r4_34000__0e0f:
  0e0f  3476           PSHS  U Y X B A                   
  0e11  8E0D79         LDX #0xd79                        
  0e14  AD9FFE76       JSR [0xfe76]                      
  0e18  FC700C         LDD 0x700c                        
  0e1b  3606           PSHU  B A                         
  0e1d  CC0004         LDD #0x4                          
  0e20  3606           PSHU  B A                         
  0e22  AD9FFCEE       JSR [0xfcee]                      
  0e26  FC700C         LDD 0x700c                        
  0e29  3606           PSHU  B A                         
  0e2b  CC5591         LDD #0x5591                       
  0e2e  3606           PSHU  B A                         
  0e30  AD9FFCF2       JSR [0xfcf2]                      
  0e34  AD9FFCE2       JSR [0xfce2]                      
  0e38  3706           PULU  A B                         
  0e3a  FD70F2         STD 0x70f2                        
  0e3d  CC000A         LDD #0xa                          
  0e40  AD9FFD20       JSR [0xfd20]                      
  0e44  108E0141       LDY #0x141                        
  0e48  FC70F2         LDD 0x70f2                        
  0e4b  AD9FFD2E       JSR [0xfd2e]                      
  0e4f  3576           PULS  A B X Y U                   
  0e51  39             RTS                               
PTR_FUN_M6F_r4_34000__0f0a_M6F_r4_34000__0e52:
  0e52  0F0A           addr M6F_r4_34000::0f0a           
  0e54  0EC9           addr M6F_r4_34000::0ec9           
  0e56  .db 0E 90 70 10 70 12 00 00 70 14 00 08 00 71 02 00  ; ..p.p...p....q..
  0e66  .db 00 03 E8 00 01 00 04 1F 0E B4 00 00 00 00 70 16  ; ..............p.
  0e76  .db 00 75                                            ; .u

; ---- function FUN_M6F_r4_34000__0e78
FUN_M6F_r4_34000__0e78:
  0e78  3410           PSHS  X                           
  0e7a  8E0E52         LDX #0xe52                         ; desc[API_FE6A]: ->$0F0A ->$0EC9
  0e7d  AD9FFE6A       JSR [0xfe6a]                      
  0e81  3510           PULS  X                           
  0e83  39             RTS                               

; ---- function FUN_M6F_r4_34000__0e84
FUN_M6F_r4_34000__0e84:
  0e84  3410           PSHS  X                           
  0e86  8E0E52         LDX #0xe52                         ; desc[API_FDBC]: ->$0F0A ->$0EC9
  0e89  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...R"
  0e8d  3510           PULS  X                           
  0e8f  39             RTS                               

; ---- function FUN_M6F_r4_34000__0e90
FUN_M6F_r4_34000__0e90:
  0e90  3410           PSHS  X                           
  0e92  8E0E52         LDX #0xe52                         ; desc[API_FE6C]: ->$0F0A ->$0EC9
  0e95  AD9FFE6C       JSR [0xfe6c]                      
  0e99  3510           PULS  X                           
  0e9b  39             RTS                               

; ---- function FUN_M6F_r4_34000__0e9c
FUN_M6F_r4_34000__0e9c:
  0e9c  3410           PSHS  X                           
  0e9e  8E0E52         LDX #0xe52                         ; desc[API_FE1C]: ->$0F0A ->$0EC9
  0ea1  AD9FFE1C       JSR [0xfe1c]                      
  0ea5  3510           PULS  X                           
  0ea7  39             RTS                               

; ---- function FUN_M6F_r4_34000__0ea8
FUN_M6F_r4_34000__0ea8:
  0ea8  3410           PSHS  X                           
  0eaa  8E0E52         LDX #0xe52                         ; desc[API_FE1A]: ->$0F0A ->$0EC9 $0E90
  0ead  AD9FFE1A       JSR [0xfe1a]                      
  0eb1  3510           PULS  X                           
  0eb3  39             RTS                               
  0eb4  .db 14 71 20 66 61 63 74 6F 72 20 31 3A 20 20 20 20  ; .q factor 1:    
  0ec4  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__0ec9
FUN_M6F_r4_34000__0ec9:
  0ec9  3476           PSHS  U Y X B A                   
  0ecb  FC7014         LDD 0x7014                        
  0ece  108303E8       CMPD #0x3e8                       
  0ed2  1027001D       LBEQ 0x0ef3                       
  0ed6  C61F           LDB #0x1f                         
  0ed8  AD9FFC36       JSR [0xfc36]                      
  0edc  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "         "
  0ee0  202020202020.. char[10] "         "              
LAB_M6F_r4_34000__0eea:
  0eea  8E0E52         LDX #0xe52                         ; desc[API_FE6E]: ->$0F0A ->$0EC9
  0eed  AD9FFE6E       JSR [0xfe6e]                      
  0ef1  2014           BRA 0x0f07                        
LAB_M6F_r4_34000__0ef3:
  0ef3  C61F           LDB #0x1f                         
  0ef5  AD9FFC36       JSR [0xfc36]                      
  0ef9  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "oscillate"
  0efd  6F7363696C6C.. char[10] "oscillate"              
LAB_M6F_r4_34000__0f07:
  0f07  3576           PULS  A B X Y U                   
  0f09  39             RTS                               

; ---- function FUN_M6F_r4_34000__0f0a
FUN_M6F_r4_34000__0f0a:
  0f0a  3476           PSHS  U Y X B A                   
  0f0c  8E0E52         LDX #0xe52                        
  0f0f  AD9FFE76       JSR [0xfe76]                      
  0f13  FC7014         LDD 0x7014                        
  0f16  3606           PSHU  B A                         
  0f18  CC0020         LDD #0x20                         
  0f1b  3606           PSHU  B A                         
  0f1d  AD9FFCEE       JSR [0xfcee]                      
  0f21  3706           PULU  A B                         
  0f23  FD70F2         STD 0x70f2                        
  0f26  FC7014         LDD 0x7014                        
  0f29  3606           PSHU  B A                         
  0f2b  CC622C         LDD #0x622c                       
  0f2e  3606           PSHU  B A                         
  0f30  AD9FFCF2       JSR [0xfcf2]                      
  0f34  3706           PULU  A B                         
  0f36  F370F2         ADDD 0x70f2                       
  0f39  837FFF         SUBD #0x7fff                      
  0f3c  FD70F2         STD 0x70f2                        
  0f3f  CC000A         LDD #0xa                          
  0f42  AD9FFD20       JSR [0xfd20]                      
  0f46  108E0142       LDY #0x142                        
  0f4a  FC70F2         LDD 0x70f2                        
  0f4d  AD9FFD2E       JSR [0xfd2e]                      
  0f51  FC7014         LDD 0x7014                        
  0f54  108303E8       CMPD #0x3e8                       
  0f58  10270002       LBEQ 0x0f5e                       
  0f5c  2039           BRA 0x0f97                        
LAB_M6F_r4_34000__0f5e:
  0f5e  CC000A         LDD #0xa                          
  0f61  AD9FFD20       JSR [0xfd20]                      
  0f65  108E0148       LDY #0x148                        
  0f69  CC000F         LDD #0xf                          
  0f6c  AD9FFD2E       JSR [0xfd2e]                      
  0f70  CC000A         LDD #0xa                          
  0f73  AD9FFD20       JSR [0xfd20]                      
  0f77  108E0148       LDY #0x148                        
  0f7b  CC0010         LDD #0x10                         
  0f7e  AD9FFD2E       JSR [0xfd2e]                      
  0f82  CC000A         LDD #0xa                          
  0f85  AD9FFD20       JSR [0xfd20]                      
  0f89  108E0148       LDY #0x148                        
  0f8d  CC000F         LDD #0xf                          
  0f90  AD9FFD2E       JSR [0xfd2e]                      
  0f94  1704FF         LBSR 0x1496                       
LAB_M6F_r4_34000__0f97:
  0f97  3576           PULS  A B X Y U                   
  0f99  39             RTS                               
PTR_FUN_M6F_r4_34000__1052_M6F_r4_34000__0f9a:
  0f9a  1052           addr M6F_r4_34000::1052           
  0f9c  1011           addr M6F_r4_34000::1011           
  0f9e  .db 0F D8 70 18 70 1A 00 00 70 1C 00 08 00 73 03 00  ; ..p.p...p....s..
  0fae  .db 00 03 E8 00 01 00 04 1F 0F FC 00 00 00 00 70 1E  ; ..............p.
  0fbe  .db 00 77                                            ; .w

; ---- function FUN_M6F_r4_34000__0fc0
FUN_M6F_r4_34000__0fc0:
  0fc0  3410           PSHS  X                           
  0fc2  8E0F9A         LDX #0xf9a                         ; desc[API_FE6A]: ->$1052 ->$1011
  0fc5  AD9FFE6A       JSR [0xfe6a]                      
  0fc9  3510           PULS  X                           
  0fcb  39             RTS                               

; ---- function FUN_M6F_r4_34000__0fcc
FUN_M6F_r4_34000__0fcc:
  0fcc  3410           PSHS  X                           
  0fce  8E0F9A         LDX #0xf9a                         ; desc[API_FDBC]: ->$1052 ->$1011
  0fd1  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0fd5  3510           PULS  X                           
  0fd7  39             RTS                               

; ---- function FUN_M6F_r4_34000__0fd8
FUN_M6F_r4_34000__0fd8:
  0fd8  3410           PSHS  X                           
  0fda  8E0F9A         LDX #0xf9a                         ; desc[API_FE6C]: ->$1052 ->$1011
  0fdd  AD9FFE6C       JSR [0xfe6c]                      
  0fe1  3510           PULS  X                           
  0fe3  39             RTS                               

; ---- function FUN_M6F_r4_34000__0fe4
FUN_M6F_r4_34000__0fe4:
  0fe4  3410           PSHS  X                           
  0fe6  8E0F9A         LDX #0xf9a                         ; desc[API_FE1C]: ->$1052 ->$1011
  0fe9  AD9FFE1C       JSR [0xfe1c]                      
  0fed  3510           PULS  X                           
  0fef  39             RTS                               

; ---- function FUN_M6F_r4_34000__0ff0
FUN_M6F_r4_34000__0ff0:
  0ff0  3410           PSHS  X                           
  0ff2  8E0F9A         LDX #0xf9a                         ; desc[API_FE1A]: ->$1052 ->$1011 $0FD8
  0ff5  AD9FFE1A       JSR [0xfe1a]                      
  0ff9  3510           PULS  X                           
  0ffb  39             RTS                               
  0ffc  .db 14 71 20 66 61 63 74 6F 72 20 32 3A 20 20 20 20  ; .q factor 2:    
  100c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1011
FUN_M6F_r4_34000__1011:
  1011  3476           PSHS  U Y X B A                   
  1013  FC701C         LDD 0x701c                        
  1016  108303E8       CMPD #0x3e8                       
  101a  1027001D       LBEQ 0x103b                       
  101e  C61F           LDB #0x1f                         
  1020  AD9FFC36       JSR [0xfc36]                      
  1024  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "         "
  1028  202020202020.. char[10] "         "              
LAB_M6F_r4_34000__1032:
  1032  8E0F9A         LDX #0xf9a                         ; desc[API_FE6E]: ->$1052 ->$1011
  1035  AD9FFE6E       JSR [0xfe6e]                      
  1039  2014           BRA 0x104f                        
LAB_M6F_r4_34000__103b:
  103b  C61F           LDB #0x1f                         
  103d  AD9FFC36       JSR [0xfc36]                      
  1041  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "oscillate"
  1045  6F7363696C6C.. char[10] "oscillate"              
LAB_M6F_r4_34000__104f:
  104f  3576           PULS  A B X Y U                   
  1051  39             RTS                               

; ---- function FUN_M6F_r4_34000__1052
FUN_M6F_r4_34000__1052:
  1052  3476           PSHS  U Y X B A                   
  1054  8E0F9A         LDX #0xf9a                        
  1057  AD9FFE76       JSR [0xfe76]                      
  105b  FC701C         LDD 0x701c                        
  105e  3606           PSHU  B A                         
  1060  CC0020         LDD #0x20                         
  1063  3606           PSHU  B A                         
  1065  AD9FFCEE       JSR [0xfcee]                      
  1069  3706           PULU  A B                         
  106b  FD70F2         STD 0x70f2                        
  106e  FC701C         LDD 0x701c                        
  1071  3606           PSHU  B A                         
  1073  CC622C         LDD #0x622c                       
  1076  3606           PSHU  B A                         
  1078  AD9FFCF2       JSR [0xfcf2]                      
  107c  3706           PULU  A B                         
  107e  F370F2         ADDD 0x70f2                       
  1081  837FFF         SUBD #0x7fff                      
  1084  FD70F2         STD 0x70f2                        
  1087  CC000A         LDD #0xa                          
  108a  AD9FFD20       JSR [0xfd20]                      
  108e  108E0143       LDY #0x143                        
  1092  FC70F2         LDD 0x70f2                        
  1095  AD9FFD2E       JSR [0xfd2e]                      
  1099  FC701C         LDD 0x701c                        
  109c  108303E8       CMPD #0x3e8                       
  10a0  10270002       LBEQ 0x10a6                       
  10a4  2039           BRA 0x10df                        
LAB_M6F_r4_34000__10a6:
  10a6  CC000A         LDD #0xa                          
  10a9  AD9FFD20       JSR [0xfd20]                      
  10ad  108E0149       LDY #0x149                        
  10b1  CC000F         LDD #0xf                          
  10b4  AD9FFD2E       JSR [0xfd2e]                      
  10b8  CC000A         LDD #0xa                          
  10bb  AD9FFD20       JSR [0xfd20]                      
  10bf  108E0149       LDY #0x149                        
  10c3  CC0010         LDD #0x10                         
  10c6  AD9FFD2E       JSR [0xfd2e]                      
  10ca  CC000A         LDD #0xa                          
  10cd  AD9FFD20       JSR [0xfd20]                      
  10d1  108E0149       LDY #0x149                        
  10d5  CC000F         LDD #0xf                          
  10d8  AD9FFD2E       JSR [0xfd2e]                      
  10dc  1704F0         LBSR 0x15cf                       
LAB_M6F_r4_34000__10df:
  10df  3576           PULS  A B X Y U                   
  10e1  39             RTS                               
PTR_FUN_M6F_r4_34000__1178_M6F_r4_34000__10e2:
  10e2  1178           addr M6F_r4_34000::1178           
  10e4  112C           addr M6F_r4_34000::112c           
  10e6  .db 11 20 70 20 70 22 00 00 70 24 00 08 00 79 04 00  ; . p p"..p$...y..
  10f6  .db 00 7D 00 00 01 02 06 1D 11 50 00 00 00 00 70 26  ; .}.......P....p&
  1106  .db 00 7D                                            ; .}

; ---- function FUN_M6F_r4_34000__1108
FUN_M6F_r4_34000__1108:
  1108  3410           PSHS  X                           
  110a  8E10E2         LDX #0x10e2                        ; desc[API_FE6A]: ->$1178 ->$112C
  110d  AD9FFE6A       JSR [0xfe6a]                      
  1111  3510           PULS  X                           
  1113  39             RTS                               

; ---- function FUN_M6F_r4_34000__1114
FUN_M6F_r4_34000__1114:
  1114  3410           PSHS  X                           
  1116  8E10E2         LDX #0x10e2                        ; desc[API_FDBC]: ->$1178 ->$112C
  1119  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  111d  3510           PULS  X                           
  111f  39             RTS                               

; ---- function FUN_M6F_r4_34000__1120
FUN_M6F_r4_34000__1120:
  1120  3410           PSHS  X                           
  1122  8E10E2         LDX #0x10e2                        ; desc[API_FE6C]: ->$1178 ->$112C
  1125  AD9FFE6C       JSR [0xfe6c]                      
  1129  3510           PULS  X                           
  112b  39             RTS                               

; ---- function FUN_M6F_r4_34000__112c
FUN_M6F_r4_34000__112c:
  112c  3410           PSHS  X                           
  112e  8E10E2         LDX #0x10e2                        ; desc[API_FE6E]: ->$1178 ->$112C
  1131  AD9FFE6E       JSR [0xfe6e]                      
  1135  3510           PULS  X                           
  1137  39             RTS                               

; ---- function FUN_M6F_r4_34000__1138
FUN_M6F_r4_34000__1138:
  1138  3410           PSHS  X                           
  113a  8E10E2         LDX #0x10e2                        ; desc[API_FE1C]: ->$1178 ->$112C
  113d  AD9FFE1C       JSR [0xfe1c]                      
  1141  3510           PULS  X                           
  1143  39             RTS                               

; ---- function FUN_M6F_r4_34000__1144
FUN_M6F_r4_34000__1144:
  1144  3410           PSHS  X                           
  1146  8E10E2         LDX #0x10e2                        ; desc[API_FE1A]: ->$1178 ->$112C $1120
  1149  AD9FFE1A       JSR [0xfe1a]                      
  114d  3510           PULS  X                           
  114f  39             RTS                               
  1150  .db 14 64 65 6C 61 79 20 31 3A 20 20 20 20 20 20 20  ; .delay 1:       
  1160  .db 20 6D 73 65 63                                   ;  msec

; ---- function FUN_M6F_r4_34000__1165
FUN_M6F_r4_34000__1165:
  1165  3406           PSHS  B A                         
  1167  17FF9E         LBSR 0x1108                       
  116a  C605           LDB #0x5                          
  116c  F76066         STB 0x6066                        
  116f  CC0064         LDD #0x64                         
  1172  FD60DC         STD 0x60dc                        
  1175  3506           PULS  A B                         
  1177  39             RTS                               

; ---- function FUN_M6F_r4_34000__1178
FUN_M6F_r4_34000__1178:
  1178  3476           PSHS  U Y X B A                   
  117a  8E10E2         LDX #0x10e2                       
  117d  AD9FFE76       JSR [0xfe76]                      
  1181  FC7024         LDD 0x7024                        
  1184  3606           PSHU  B A                         
  1186  CC3872         LDD #0x3872                       
  1189  3606           PSHU  B A                         
  118b  AD9FFCF2       JSR [0xfcf2]                      
  118f  3706           PULU  A B                         
  1191  C30001         ADDD #0x1                         
  1194  FD70F2         STD 0x70f2                        
  1197  CC000A         LDD #0xa                          
  119a  AD9FFD20       JSR [0xfd20]                      
  119e  108E0144       LDY #0x144                        
  11a2  FC70F2         LDD 0x70f2                        
  11a5  AD9FFD2E       JSR [0xfd2e]                      
  11a9  3576           PULS  A B X Y U                   
  11ab  39             RTS                               
PTR_FUN_M6F_r4_34000__1242_M6F_r4_34000__11ac:
  11ac  1242           addr M6F_r4_34000::1242           
  11ae  11F6           addr M6F_r4_34000::11f6           
  11b0  .db 11 EA 70 28 70 2A 00 00 70 2C 00 08 00 7B 05 00  ; ..p(p*..p,...{..
  11c0  .db 00 7D 00 00 01 02 06 1D 12 1A 00 00 00 00 70 2E  ; .}............p.
  11d0  .db 00 7F                                            ; ..

; ---- function FUN_M6F_r4_34000__11d2
FUN_M6F_r4_34000__11d2:
  11d2  3410           PSHS  X                           
  11d4  8E11AC         LDX #0x11ac                        ; desc[API_FE6A]: ->$1242 ->$11F6
  11d7  AD9FFE6A       JSR [0xfe6a]                      
  11db  3510           PULS  X                           
  11dd  39             RTS                               

; ---- function FUN_M6F_r4_34000__11de
FUN_M6F_r4_34000__11de:
  11de  3410           PSHS  X                           
  11e0  8E11AC         LDX #0x11ac                        ; desc[API_FDBC]: ->$1242 ->$11F6
  11e3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  11e7  3510           PULS  X                           
  11e9  39             RTS                               

; ---- function FUN_M6F_r4_34000__11ea
FUN_M6F_r4_34000__11ea:
  11ea  3410           PSHS  X                           
  11ec  8E11AC         LDX #0x11ac                        ; desc[API_FE6C]: ->$1242 ->$11F6
  11ef  AD9FFE6C       JSR [0xfe6c]                      
  11f3  3510           PULS  X                           
  11f5  39             RTS                               

; ---- function FUN_M6F_r4_34000__11f6
FUN_M6F_r4_34000__11f6:
  11f6  3410           PSHS  X                           
  11f8  8E11AC         LDX #0x11ac                        ; desc[API_FE6E]: ->$1242 ->$11F6
  11fb  AD9FFE6E       JSR [0xfe6e]                      
  11ff  3510           PULS  X                           
  1201  39             RTS                               

; ---- function FUN_M6F_r4_34000__1202
FUN_M6F_r4_34000__1202:
  1202  3410           PSHS  X                           
  1204  8E11AC         LDX #0x11ac                        ; desc[API_FE1C]: ->$1242 ->$11F6
  1207  AD9FFE1C       JSR [0xfe1c]                      
  120b  3510           PULS  X                           
  120d  39             RTS                               

; ---- function FUN_M6F_r4_34000__120e
FUN_M6F_r4_34000__120e:
  120e  3410           PSHS  X                           
  1210  8E11AC         LDX #0x11ac                        ; desc[API_FE1A]: ->$1242 ->$11F6 $11EA
  1213  AD9FFE1A       JSR [0xfe1a]                      
  1217  3510           PULS  X                           
  1219  39             RTS                               
  121a  .db 14 64 65 6C 61 79 20 32 3A 20 20 20 20 20 20 20  ; .delay 2:       
  122a  .db 20 6D 73 65 63                                   ;  msec

; ---- function FUN_M6F_r4_34000__122f
FUN_M6F_r4_34000__122f:
  122f  3406           PSHS  B A                         
  1231  17FF9E         LBSR 0x11d2                       
  1234  C605           LDB #0x5                          
  1236  F76066         STB 0x6066                        
  1239  CC0064         LDD #0x64                         
  123c  FD60DC         STD 0x60dc                        
  123f  3506           PULS  A B                         
  1241  39             RTS                               

; ---- function FUN_M6F_r4_34000__1242
FUN_M6F_r4_34000__1242:
  1242  3476           PSHS  U Y X B A                   
  1244  8E11AC         LDX #0x11ac                       
  1247  AD9FFE76       JSR [0xfe76]                      
  124b  FC702C         LDD 0x702c                        
  124e  FC702C         LDD 0x702c                        
  1251  3606           PSHU  B A                         
  1253  CC3872         LDD #0x3872                       
  1256  3606           PSHU  B A                         
  1258  AD9FFCF2       JSR [0xfcf2]                      
  125c  3706           PULU  A B                         
  125e  C30001         ADDD #0x1                         
  1261  FD70F2         STD 0x70f2                        
  1264  CC000A         LDD #0xa                          
  1267  AD9FFD20       JSR [0xfd20]                      
  126b  108E0145       LDY #0x145                        
  126f  FC70F2         LDD 0x70f2                        
  1272  AD9FFD2E       JSR [0xfd2e]                      
  1276  3576           PULS  A B X Y U                   
  1278  39             RTS                               
PTR_FUN_M6F_r4_34000__130f_M6F_r4_34000__1279:
  1279  130F           addr M6F_r4_34000::130f           
  127b  12C3           addr M6F_r4_34000::12c3           
  127d  .db 12 B7 70 30 70 32 00 00 70 34 00 08 00 81 06 FC  ; ..p0p2..p4......
  128d  .db 18 03 E8 00 01 01 06 1C 12 E7 00 00 00 00 70 36  ; ..............p6
  129d  .db 00 85                                            ; ..

; ---- function FUN_M6F_r4_34000__129f
FUN_M6F_r4_34000__129f:
  129f  3410           PSHS  X                           
  12a1  8E1279         LDX #0x1279                        ; desc[API_FE6A]: ->$130F ->$12C3
  12a4  AD9FFE6A       JSR [0xfe6a]                      
  12a8  3510           PULS  X                           
  12aa  39             RTS                               

; ---- function FUN_M6F_r4_34000__12ab
FUN_M6F_r4_34000__12ab:
  12ab  3410           PSHS  X                           
  12ad  8E1279         LDX #0x1279                        ; desc[API_FDBC]: ->$130F ->$12C3
  12b0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...y"
  12b4  3510           PULS  X                           
  12b6  39             RTS                               

; ---- function FUN_M6F_r4_34000__12b7
FUN_M6F_r4_34000__12b7:
  12b7  3410           PSHS  X                           
  12b9  8E1279         LDX #0x1279                        ; desc[API_FE6C]: ->$130F ->$12C3
  12bc  AD9FFE6C       JSR [0xfe6c]                      
  12c0  3510           PULS  X                           
  12c2  39             RTS                               

; ---- function FUN_M6F_r4_34000__12c3
FUN_M6F_r4_34000__12c3:
  12c3  3410           PSHS  X                           
  12c5  8E1279         LDX #0x1279                        ; desc[API_FE6E]: ->$130F ->$12C3
  12c8  AD9FFE6E       JSR [0xfe6e]                      
  12cc  3510           PULS  X                           
  12ce  39             RTS                               

; ---- function FUN_M6F_r4_34000__12cf
FUN_M6F_r4_34000__12cf:
  12cf  3410           PSHS  X                           
  12d1  8E1279         LDX #0x1279                        ; desc[API_FE1C]: ->$130F ->$12C3
  12d4  AD9FFE1C       JSR [0xfe1c]                      
  12d8  3510           PULS  X                           
  12da  39             RTS                               

; ---- function FUN_M6F_r4_34000__12db
FUN_M6F_r4_34000__12db:
  12db  3410           PSHS  X                           
  12dd  8E1279         LDX #0x1279                        ; desc[API_FE1A]: ->$130F ->$12C3 $12B7
  12e0  AD9FFE1A       JSR [0xfe1a]                      
  12e4  3510           PULS  X                           
  12e6  39             RTS                               
  12e7  .db 14 73 63 61 6C 65 20 31 3A 20 20 20 20 20 20 20  ; .scale 1:       
  12f7  .db 25 20 20 20 20                                   ; %    

; ---- function FUN_M6F_r4_34000__12fc
FUN_M6F_r4_34000__12fc:
  12fc  3406           PSHS  B A                         
  12fe  17FF9E         LBSR 0x129f                       
  1301  C605           LDB #0x5                          
  1303  F76066         STB 0x6066                        
  1306  CC000A         LDD #0xa                          
  1309  FD60DC         STD 0x60dc                        
  130c  3506           PULS  A B                         
  130e  39             RTS                               

; ---- function FUN_M6F_r4_34000__130f
FUN_M6F_r4_34000__130f:
  130f  3476           PSHS  U Y X B A                   
  1311  8E1279         LDX #0x1279                       
  1314  AD9FFE76       JSR [0xfe76]                      
  1318  FC7034         LDD 0x7034                        
  131b  3606           PSHU  B A                         
  131d  CC0020         LDD #0x20                         
  1320  3606           PSHU  B A                         
  1322  AD9FFCEC       JSR [0xfcec]                      
  1326  FC7034         LDD 0x7034                        
  1329  3606           PSHU  B A                         
  132b  CC622C         LDD #0x622c                       
  132e  3606           PSHU  B A                         
  1330  AD9FFCF2       JSR [0xfcf2]                      
  1334  AD9FFCE2       JSR [0xfce2]                      
  1338  3706           PULU  A B                         
  133a  FD70F2         STD 0x70f2                        
  133d  CC000A         LDD #0xa                          
  1340  AD9FFD20       JSR [0xfd20]                      
  1344  108E0146       LDY #0x146                        
  1348  FC70F2         LDD 0x70f2                        
  134b  AD9FFD2E       JSR [0xfd2e]                      
  134f  3576           PULS  A B X Y U                   
  1351  39             RTS                               
PTR_FUN_M6F_r4_34000__13e8_M6F_r4_34000__1352:
  1352  13E8           addr M6F_r4_34000::13e8           
  1354  139C           addr M6F_r4_34000::139c           
  1356  .db 13 90 70 38 70 3A 00 00 70 3C 00 08 00 83 07 FC  ; ..p8p:..p<......
  1366  .db 18 03 E8 00 01 01 06 1C 13 C0 00 00 00 00 70 3E  ; ..............p>
  1376  .db 00 87                                            ; ..

; ---- function FUN_M6F_r4_34000__1378
FUN_M6F_r4_34000__1378:
  1378  3410           PSHS  X                           
  137a  8E1352         LDX #0x1352                        ; desc[API_FE6A]: ->$13E8 ->$139C
  137d  AD9FFE6A       JSR [0xfe6a]                      
  1381  3510           PULS  X                           
  1383  39             RTS                               

; ---- function FUN_M6F_r4_34000__1384
FUN_M6F_r4_34000__1384:
  1384  3410           PSHS  X                           
  1386  8E1352         LDX #0x1352                        ; desc[API_FDBC]: ->$13E8 ->$139C
  1389  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...R"
  138d  3510           PULS  X                           
  138f  39             RTS                               

; ---- function FUN_M6F_r4_34000__1390
FUN_M6F_r4_34000__1390:
  1390  3410           PSHS  X                           
  1392  8E1352         LDX #0x1352                        ; desc[API_FE6C]: ->$13E8 ->$139C
  1395  AD9FFE6C       JSR [0xfe6c]                      
  1399  3510           PULS  X                           
  139b  39             RTS                               

; ---- function FUN_M6F_r4_34000__139c
FUN_M6F_r4_34000__139c:
  139c  3410           PSHS  X                           
  139e  8E1352         LDX #0x1352                        ; desc[API_FE6E]: ->$13E8 ->$139C
  13a1  AD9FFE6E       JSR [0xfe6e]                      
  13a5  3510           PULS  X                           
  13a7  39             RTS                               

; ---- function FUN_M6F_r4_34000__13a8
FUN_M6F_r4_34000__13a8:
  13a8  3410           PSHS  X                           
  13aa  8E1352         LDX #0x1352                        ; desc[API_FE1C]: ->$13E8 ->$139C
  13ad  AD9FFE1C       JSR [0xfe1c]                      
  13b1  3510           PULS  X                           
  13b3  39             RTS                               

; ---- function FUN_M6F_r4_34000__13b4
FUN_M6F_r4_34000__13b4:
  13b4  3410           PSHS  X                           
  13b6  8E1352         LDX #0x1352                        ; desc[API_FE1A]: ->$13E8 ->$139C $1390
  13b9  AD9FFE1A       JSR [0xfe1a]                      
  13bd  3510           PULS  X                           
  13bf  39             RTS                               
  13c0  .db 14 73 63 61 6C 65 20 32 3A 20 20 20 20 20 20 20  ; .scale 2:       
  13d0  .db 25 20 20 20 20                                   ; %    

; ---- function FUN_M6F_r4_34000__13d5
FUN_M6F_r4_34000__13d5:
  13d5  3406           PSHS  B A                         
  13d7  17FF9E         LBSR 0x1378                       
  13da  C605           LDB #0x5                          
  13dc  F76066         STB 0x6066                        
  13df  CC000A         LDD #0xa                          
  13e2  FD60DC         STD 0x60dc                        
  13e5  3506           PULS  A B                         
  13e7  39             RTS                               

; ---- function FUN_M6F_r4_34000__13e8
FUN_M6F_r4_34000__13e8:
  13e8  3476           PSHS  U Y X B A                   
  13ea  8E1352         LDX #0x1352                       
  13ed  AD9FFE76       JSR [0xfe76]                      
  13f1  FC703C         LDD 0x703c                        
  13f4  3606           PSHU  B A                         
  13f6  CC0020         LDD #0x20                         
  13f9  3606           PSHU  B A                         
  13fb  AD9FFCEC       JSR [0xfcec]                      
  13ff  FC703C         LDD 0x703c                        
  1402  3606           PSHU  B A                         
  1404  CC622C         LDD #0x622c                       
  1407  3606           PSHU  B A                         
  1409  AD9FFCF2       JSR [0xfcf2]                      
  140d  AD9FFCE2       JSR [0xfce2]                      
  1411  3706           PULU  A B                         
  1413  FD70F2         STD 0x70f2                        
  1416  CC000A         LDD #0xa                          
  1419  AD9FFD20       JSR [0xfd20]                      
  141d  108E0147       LDY #0x147                        
  1421  FC70F2         LDD 0x70f2                        
  1424  AD9FFD2E       JSR [0xfd2e]                      
  1428  3576           PULS  A B X Y U                   
  142a  39             RTS                               
  142b  149614751469   addr[3]                           
  1431  .db 70 40 70 5A 00 00 70 74 00 08 00 89 13 00 00 00  ; p@pZ..pt........
  1441  .db 0F 00 01 00 0B 1D 14 81 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__1451
FUN_M6F_r4_34000__1451:
  1451  3410           PSHS  X                           
  1453  8E142B         LDX #0x142b                       
  1456  AD9FFC4E       JSR [0xfc4e]                      
  145a  3510           PULS  X                           
  145c  39             RTS                               

; ---- function FUN_M6F_r4_34000__145d
FUN_M6F_r4_34000__145d:
  145d  3410           PSHS  X                           
  145f  8E142B         LDX #0x142b                       
  1462  AD9FFC4C       JSR [0xfc4c]                      
  1466  3510           PULS  X                           
  1468  39             RTS                               

; ---- function FUN_M6F_r4_34000__1469
FUN_M6F_r4_34000__1469:
  1469  3410           PSHS  X                           
  146b  8E142B         LDX #0x142b                       
  146e  AD9FFC50       JSR [0xfc50]                      
  1472  3510           PULS  X                           
  1474  39             RTS                               

; ---- function FUN_M6F_r4_34000__1475
FUN_M6F_r4_34000__1475:
  1475  3410           PSHS  X                           
  1477  8E142B         LDX #0x142b                       
  147a  AD9FFC52       JSR [0xfc52]                      
  147e  3510           PULS  X                           
  1480  39             RTS                               
  1481  .db 14 66 69 6C 74 31 20 69 6E 3C 20 20 20 20 20 20  ; .filt1 in<      
  1491  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1496
FUN_M6F_r4_34000__1496:
  1496  3476           PSHS  U Y X B A                   
  1498  8E142B         LDX #0x142b                       
  149b  AD9FFE76       JSR [0xfe76]                      
  149f  CC000A         LDD #0xa                          
  14a2  AD9FFD20       JSR [0xfd20]                      
  14a6  108E0148       LDY #0x148                        
  14aa  FC7074         LDD 0x7074                        
  14ad  AD9FFD2E       JSR [0xfd2e]                      
  14b1  3576           PULS  A B X Y U                   
  14b3  39             RTS                               
  14b4  .db 6C 65 66 74 20 69 6E 70 75 74 20 73 75 6D 20 31  ; left input sum 1
  14c4  .db 20 20 20 20 20 20 73 75 6D 20 32 20 20 20 20 20  ;       sum 2     
  14d4  .db 20 64 65 6C 61 79 20 31 20 20 20 20 64 65 6C 61  ;  delay 1    dela
  14e4  .db 79 20 32 20 20 20 20 73 63 61 6C 65 72 20 31 20  ; y 2    scaler 1 
  14f4  .db 20 20 73 63 61 6C 65 72 20 32 20 20 20 6C 6F 77  ;   scaler 2   low
  1504  .db 70 61 73 73 20 31 20 20 6C 6F 77 70 61 73 73 20  ; pass 1  lowpass 
  1514  .db 32 20 20 62 61 6E 64 70 61 73 73 20 31 20 62 61  ; 2  bandpass 1 ba
  1524  .db 6E 64 70 61 73 73 20 32 20 68 69 67 68 70 61 73  ; ndpass 2 highpas
  1534  .db 73 20 31 20 68 69 67 68 70 61 73 73 20 32 20 6E  ; s 1 highpass 2 n
  1544  .db 6F 69 73 65 20 67 65 6E 20 20 70 69 74 63 68 20  ; oise gen  pitch 
  1554  .db 73 68 69 66 74 6E 75 6C 6C 20 69 6E 70 75 74 20  ; shiftnull input 
  1564  .db 15 CF 15 AE 15 A2 70 42 70 5C 00 00 70 76 00 08  ; ......pBp\..pv..
  1574  .db 00 8A 14 00 00 00 0F 00 01 00 0B 1D 15 BA 00 00  ; ................
  1584  .db 14 B4 00 00 00 00                                ; ......

; ---- function FUN_M6F_r4_34000__158a
FUN_M6F_r4_34000__158a:
  158a  3410           PSHS  X                           
  158c  8E1564         LDX #0x1564                       
  158f  AD9FFC4E       JSR [0xfc4e]                      
  1593  3510           PULS  X                           
  1595  39             RTS                               

; ---- function FUN_M6F_r4_34000__1596
FUN_M6F_r4_34000__1596:
  1596  3410           PSHS  X                           
  1598  8E1564         LDX #0x1564                       
  159b  AD9FFC4C       JSR [0xfc4c]                      
  159f  3510           PULS  X                           
  15a1  39             RTS                               

; ---- function FUN_M6F_r4_34000__15a2
FUN_M6F_r4_34000__15a2:
  15a2  3410           PSHS  X                           
  15a4  8E1564         LDX #0x1564                       
  15a7  AD9FFC50       JSR [0xfc50]                      
  15ab  3510           PULS  X                           
  15ad  39             RTS                               

; ---- function FUN_M6F_r4_34000__15ae
FUN_M6F_r4_34000__15ae:
  15ae  3410           PSHS  X                           
  15b0  8E1564         LDX #0x1564                       
  15b3  AD9FFC52       JSR [0xfc52]                      
  15b7  3510           PULS  X                           
  15b9  39             RTS                               
  15ba  .db 14 66 69 6C 74 32 20 69 6E 3C 20 20 20 20 20 20  ; .filt2 in<      
  15ca  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__15cf
FUN_M6F_r4_34000__15cf:
  15cf  3476           PSHS  U Y X B A                   
  15d1  8E1564         LDX #0x1564                       
  15d4  AD9FFE76       JSR [0xfe76]                      
  15d8  CC000A         LDD #0xa                          
  15db  AD9FFD20       JSR [0xfd20]                      
  15df  108E0149       LDY #0x149                        
  15e3  FC7076         LDD 0x7076                        
  15e6  AD9FFD2E       JSR [0xfd2e]                      
  15ea  3576           PULS  A B X Y U                   
  15ec  39             RTS                               
  15ed  16581637162B   addr[3]                           
  15f3  .db 70 44 70 5E 00 00 70 78 00 08 00 8B 15 00 00 00  ; pDp^..px........
  1603  .db 0F 00 01 00 0B 1D 16 43 00 00 14 B4 00 00 00 00  ; .......C........

; ---- function FUN_M6F_r4_34000__1613
FUN_M6F_r4_34000__1613:
  1613  3410           PSHS  X                           
  1615  8E15ED         LDX #0x15ed                       
  1618  AD9FFC4E       JSR [0xfc4e]                      
  161c  3510           PULS  X                           
  161e  39             RTS                               

; ---- function FUN_M6F_r4_34000__161f
FUN_M6F_r4_34000__161f:
  161f  3410           PSHS  X                           
  1621  8E15ED         LDX #0x15ed                       
  1624  AD9FFC4C       JSR [0xfc4c]                      
  1628  3510           PULS  X                           
  162a  39             RTS                               

; ---- function FUN_M6F_r4_34000__162b
FUN_M6F_r4_34000__162b:
  162b  3410           PSHS  X                           
  162d  8E15ED         LDX #0x15ed                       
  1630  AD9FFC50       JSR [0xfc50]                      
  1634  3510           PULS  X                           
  1636  39             RTS                               

; ---- function FUN_M6F_r4_34000__1637
FUN_M6F_r4_34000__1637:
  1637  3410           PSHS  X                           
  1639  8E15ED         LDX #0x15ed                       
  163c  AD9FFC52       JSR [0xfc52]                      
  1640  3510           PULS  X                           
  1642  39             RTS                               
  1643  .db 14 64 65 6C 61 79 31 69 6E 3C 20 20 20 20 20 20  ; .delay1in<      
  1653  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1658
FUN_M6F_r4_34000__1658:
  1658  3476           PSHS  U Y X B A                   
  165a  8E15ED         LDX #0x15ed                       
  165d  AD9FFE76       JSR [0xfe76]                      
  1661  CC000A         LDD #0xa                          
  1664  AD9FFD20       JSR [0xfd20]                      
  1668  108E014A       LDY #0x14a                        
  166c  FC7078         LDD 0x7078                        
  166f  AD9FFD2E       JSR [0xfd2e]                      
  1673  3576           PULS  A B X Y U                   
  1675  39             RTS                               
  1676  16E116C016B4   addr[3]                           
  167c  .db 70 46 70 60 00 00 70 7A 00 08 00 8C 16 00 00 00  ; pFp`..pz........
  168c  .db 0F 00 01 00 0B 1D 16 CC 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__169c
FUN_M6F_r4_34000__169c:
  169c  3410           PSHS  X                           
  169e  8E1676         LDX #0x1676                       
  16a1  AD9FFC4E       JSR [0xfc4e]                      
  16a5  3510           PULS  X                           
  16a7  39             RTS                               

; ---- function FUN_M6F_r4_34000__16a8
FUN_M6F_r4_34000__16a8:
  16a8  3410           PSHS  X                           
  16aa  8E1676         LDX #0x1676                       
  16ad  AD9FFC4C       JSR [0xfc4c]                      
  16b1  3510           PULS  X                           
  16b3  39             RTS                               

; ---- function FUN_M6F_r4_34000__16b4
FUN_M6F_r4_34000__16b4:
  16b4  3410           PSHS  X                           
  16b6  8E1676         LDX #0x1676                       
  16b9  AD9FFC50       JSR [0xfc50]                      
  16bd  3510           PULS  X                           
  16bf  39             RTS                               

; ---- function FUN_M6F_r4_34000__16c0
FUN_M6F_r4_34000__16c0:
  16c0  3410           PSHS  X                           
  16c2  8E1676         LDX #0x1676                       
  16c5  AD9FFC52       JSR [0xfc52]                      
  16c9  3510           PULS  X                           
  16cb  39             RTS                               
  16cc  .db 14 64 65 6C 61 79 32 69 6E 3C 20 20 20 20 20 20  ; .delay2in<      
  16dc  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__16e1
FUN_M6F_r4_34000__16e1:
  16e1  3476           PSHS  U Y X B A                   
  16e3  8E1676         LDX #0x1676                       
  16e6  AD9FFE76       JSR [0xfe76]                      
  16ea  CC000A         LDD #0xa                          
  16ed  AD9FFD20       JSR [0xfd20]                      
  16f1  108E014B       LDY #0x14b                        
  16f5  FC707A         LDD 0x707a                        
  16f8  AD9FFD2E       JSR [0xfd2e]                      
  16fc  3576           PULS  A B X Y U                   
  16fe  39             RTS                               
  16ff  176A1749173D   addr[3]                           
  1705  .db 70 48 70 62 00 00 70 7C 00 08 00 8D 17 00 00 00  ; pHpb..p|........
  1715  .db 0F 00 01 00 0B 1D 17 55 00 00 14 B4 00 00 00 00  ; .......U........

; ---- function FUN_M6F_r4_34000__1725
FUN_M6F_r4_34000__1725:
  1725  3410           PSHS  X                           
  1727  8E16FF         LDX #0x16ff                       
  172a  AD9FFC4E       JSR [0xfc4e]                      
  172e  3510           PULS  X                           
  1730  39             RTS                               

; ---- function FUN_M6F_r4_34000__1731
FUN_M6F_r4_34000__1731:
  1731  3410           PSHS  X                           
  1733  8E16FF         LDX #0x16ff                       
  1736  AD9FFC4C       JSR [0xfc4c]                      
  173a  3510           PULS  X                           
  173c  39             RTS                               

; ---- function FUN_M6F_r4_34000__173d
FUN_M6F_r4_34000__173d:
  173d  3410           PSHS  X                           
  173f  8E16FF         LDX #0x16ff                       
  1742  AD9FFC50       JSR [0xfc50]                      
  1746  3510           PULS  X                           
  1748  39             RTS                               

; ---- function FUN_M6F_r4_34000__1749
FUN_M6F_r4_34000__1749:
  1749  3410           PSHS  X                           
  174b  8E16FF         LDX #0x16ff                       
  174e  AD9FFC52       JSR [0xfc52]                      
  1752  3510           PULS  X                           
  1754  39             RTS                               
  1755  .db 14 73 63 61 6C 65 31 69 6E 3C 20 20 20 20 20 20  ; .scale1in<      
  1765  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__176a
FUN_M6F_r4_34000__176a:
  176a  3476           PSHS  U Y X B A                   
  176c  8E16FF         LDX #0x16ff                       
  176f  AD9FFE76       JSR [0xfe76]                      
  1773  CC000A         LDD #0xa                          
  1776  AD9FFD20       JSR [0xfd20]                      
  177a  108E014C       LDY #0x14c                        
  177e  FC707C         LDD 0x707c                        
  1781  AD9FFD2E       JSR [0xfd2e]                      
  1785  3576           PULS  A B X Y U                   
  1787  39             RTS                               
  1788  17F317D217C6   addr[3]                           
  178e  .db 70 4A 70 64 00 00 70 7E 00 08 00 8E 18 00 00 00  ; pJpd..p~........
  179e  .db 0F 00 01 00 0B 1D 17 DE 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__17ae
FUN_M6F_r4_34000__17ae:
  17ae  3410           PSHS  X                           
  17b0  8E1788         LDX #0x1788                       
  17b3  AD9FFC4E       JSR [0xfc4e]                      
  17b7  3510           PULS  X                           
  17b9  39             RTS                               

; ---- function FUN_M6F_r4_34000__17ba
FUN_M6F_r4_34000__17ba:
  17ba  3410           PSHS  X                           
  17bc  8E1788         LDX #0x1788                       
  17bf  AD9FFC4C       JSR [0xfc4c]                      
  17c3  3510           PULS  X                           
  17c5  39             RTS                               

; ---- function FUN_M6F_r4_34000__17c6
FUN_M6F_r4_34000__17c6:
  17c6  3410           PSHS  X                           
  17c8  8E1788         LDX #0x1788                       
  17cb  AD9FFC50       JSR [0xfc50]                      
  17cf  3510           PULS  X                           
  17d1  39             RTS                               

; ---- function FUN_M6F_r4_34000__17d2
FUN_M6F_r4_34000__17d2:
  17d2  3410           PSHS  X                           
  17d4  8E1788         LDX #0x1788                       
  17d7  AD9FFC52       JSR [0xfc52]                      
  17db  3510           PULS  X                           
  17dd  39             RTS                               
  17de  .db 14 73 63 61 6C 65 32 69 6E 3C 20 20 20 20 20 20  ; .scale2in<      
  17ee  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__17f3
FUN_M6F_r4_34000__17f3:
  17f3  3476           PSHS  U Y X B A                   
  17f5  8E1788         LDX #0x1788                       
  17f8  AD9FFE76       JSR [0xfe76]                      
  17fc  CC000A         LDD #0xa                          
  17ff  AD9FFD20       JSR [0xfd20]                      
  1803  108E014D       LDY #0x14d                        
  1807  FC707E         LDD 0x707e                        
  180a  AD9FFD2E       JSR [0xfd2e]                      
  180e  3576           PULS  A B X Y U                   
  1810  39             RTS                               
  1811  187C185B184F   addr[3]                           
  1817  .db 70 4C 70 66 00 00 70 80 00 08 00 8F 19 00 00 00  ; pLpf..p.........
  1827  .db 0F 00 01 00 0B 1D 18 67 00 00 14 B4 00 00 00 00  ; .......g........

; ---- function FUN_M6F_r4_34000__1837
FUN_M6F_r4_34000__1837:
  1837  3410           PSHS  X                           
  1839  8E1811         LDX #0x1811                       
  183c  AD9FFC4E       JSR [0xfc4e]                      
  1840  3510           PULS  X                           
  1842  39             RTS                               

; ---- function FUN_M6F_r4_34000__1843
FUN_M6F_r4_34000__1843:
  1843  3410           PSHS  X                           
  1845  8E1811         LDX #0x1811                       
  1848  AD9FFC4C       JSR [0xfc4c]                      
  184c  3510           PULS  X                           
  184e  39             RTS                               

; ---- function FUN_M6F_r4_34000__184f
FUN_M6F_r4_34000__184f:
  184f  3410           PSHS  X                           
  1851  8E1811         LDX #0x1811                       
  1854  AD9FFC50       JSR [0xfc50]                      
  1858  3510           PULS  X                           
  185a  39             RTS                               

; ---- function FUN_M6F_r4_34000__185b
FUN_M6F_r4_34000__185b:
  185b  3410           PSHS  X                           
  185d  8E1811         LDX #0x1811                       
  1860  AD9FFC52       JSR [0xfc52]                      
  1864  3510           PULS  X                           
  1866  39             RTS                               
  1867  .db 14 73 75 6D 31 61 20 69 6E 3C 20 20 20 20 20 20  ; .sum1a in<      
  1877  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__187c
FUN_M6F_r4_34000__187c:
  187c  3476           PSHS  U Y X B A                   
  187e  8E1811         LDX #0x1811                       
  1881  AD9FFE76       JSR [0xfe76]                      
  1885  CC000A         LDD #0xa                          
  1888  AD9FFD20       JSR [0xfd20]                      
  188c  108E014E       LDY #0x14e                        
  1890  FC7080         LDD 0x7080                        
  1893  AD9FFD2E       JSR [0xfd2e]                      
  1897  3576           PULS  A B X Y U                   
  1899  39             RTS                               
  189a  190518E418D8   addr[3]                           
  18a0  .db 70 4E 70 68 00 00 70 82 00 08 00 90 1A 00 00 00  ; pNph..p.........
  18b0  .db 0F 00 01 00 0B 1D 18 F0 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__18c0
FUN_M6F_r4_34000__18c0:
  18c0  3410           PSHS  X                           
  18c2  8E189A         LDX #0x189a                       
  18c5  AD9FFC4E       JSR [0xfc4e]                      
  18c9  3510           PULS  X                           
  18cb  39             RTS                               

; ---- function FUN_M6F_r4_34000__18cc
FUN_M6F_r4_34000__18cc:
  18cc  3410           PSHS  X                           
  18ce  8E189A         LDX #0x189a                       
  18d1  AD9FFC4C       JSR [0xfc4c]                      
  18d5  3510           PULS  X                           
  18d7  39             RTS                               

; ---- function FUN_M6F_r4_34000__18d8
FUN_M6F_r4_34000__18d8:
  18d8  3410           PSHS  X                           
  18da  8E189A         LDX #0x189a                       
  18dd  AD9FFC50       JSR [0xfc50]                      
  18e1  3510           PULS  X                           
  18e3  39             RTS                               

; ---- function FUN_M6F_r4_34000__18e4
FUN_M6F_r4_34000__18e4:
  18e4  3410           PSHS  X                           
  18e6  8E189A         LDX #0x189a                       
  18e9  AD9FFC52       JSR [0xfc52]                      
  18ed  3510           PULS  X                           
  18ef  39             RTS                               
  18f0  .db 14 73 75 6D 31 62 20 69 6E 3C 20 20 20 20 20 20  ; .sum1b in<      
  1900  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1905
FUN_M6F_r4_34000__1905:
  1905  3476           PSHS  U Y X B A                   
  1907  8E189A         LDX #0x189a                       
  190a  AD9FFE76       JSR [0xfe76]                      
  190e  CC000A         LDD #0xa                          
  1911  AD9FFD20       JSR [0xfd20]                      
  1915  108E014F       LDY #0x14f                        
  1919  FC7082         LDD 0x7082                        
  191c  AD9FFD2E       JSR [0xfd2e]                      
  1920  3576           PULS  A B X Y U                   
  1922  39             RTS                               
  1923  198E196D1961   addr[3]                           
  1929  .db 70 50 70 6A 00 00 70 84 00 08 00 91 1B 00 00 00  ; pPpj..p.........
  1939  .db 0F 00 01 00 0B 1D 19 79 00 00 14 B4 00 00 00 00  ; .......y........

; ---- function FUN_M6F_r4_34000__1949
FUN_M6F_r4_34000__1949:
  1949  3410           PSHS  X                           
  194b  8E1923         LDX #0x1923                       
  194e  AD9FFC4E       JSR [0xfc4e]                      
  1952  3510           PULS  X                           
  1954  39             RTS                               

; ---- function FUN_M6F_r4_34000__1955
FUN_M6F_r4_34000__1955:
  1955  3410           PSHS  X                           
  1957  8E1923         LDX #0x1923                       
  195a  AD9FFC4C       JSR [0xfc4c]                      
  195e  3510           PULS  X                           
  1960  39             RTS                               

; ---- function FUN_M6F_r4_34000__1961
FUN_M6F_r4_34000__1961:
  1961  3410           PSHS  X                           
  1963  8E1923         LDX #0x1923                       
  1966  AD9FFC50       JSR [0xfc50]                      
  196a  3510           PULS  X                           
  196c  39             RTS                               

; ---- function FUN_M6F_r4_34000__196d
FUN_M6F_r4_34000__196d:
  196d  3410           PSHS  X                           
  196f  8E1923         LDX #0x1923                       
  1972  AD9FFC52       JSR [0xfc52]                      
  1976  3510           PULS  X                           
  1978  39             RTS                               
  1979  .db 14 73 75 6D 32 61 20 69 6E 3C 20 20 20 20 20 20  ; .sum2a in<      
  1989  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__198e
FUN_M6F_r4_34000__198e:
  198e  3476           PSHS  U Y X B A                   
  1990  8E1923         LDX #0x1923                       
  1993  AD9FFE76       JSR [0xfe76]                      
  1997  CC000A         LDD #0xa                          
  199a  AD9FFD20       JSR [0xfd20]                      
  199e  108E0150       LDY #0x150                        
  19a2  FC7084         LDD 0x7084                        
  19a5  AD9FFD2E       JSR [0xfd2e]                      
  19a9  3576           PULS  A B X Y U                   
  19ab  39             RTS                               
  19ac  1A1719F619EA   addr[3]                           
  19b2  .db 70 52 70 6C 00 00 70 86 00 08 00 92 1C 00 00 00  ; pRpl..p.........
  19c2  .db 0F 00 01 00 0B 1D 1A 02 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__19d2
FUN_M6F_r4_34000__19d2:
  19d2  3410           PSHS  X                           
  19d4  8E19AC         LDX #0x19ac                       
  19d7  AD9FFC4E       JSR [0xfc4e]                      
  19db  3510           PULS  X                           
  19dd  39             RTS                               

; ---- function FUN_M6F_r4_34000__19de
FUN_M6F_r4_34000__19de:
  19de  3410           PSHS  X                           
  19e0  8E19AC         LDX #0x19ac                       
  19e3  AD9FFC4C       JSR [0xfc4c]                      
  19e7  3510           PULS  X                           
  19e9  39             RTS                               

; ---- function FUN_M6F_r4_34000__19ea
FUN_M6F_r4_34000__19ea:
  19ea  3410           PSHS  X                           
  19ec  8E19AC         LDX #0x19ac                       
  19ef  AD9FFC50       JSR [0xfc50]                      
  19f3  3510           PULS  X                           
  19f5  39             RTS                               

; ---- function FUN_M6F_r4_34000__19f6
FUN_M6F_r4_34000__19f6:
  19f6  3410           PSHS  X                           
  19f8  8E19AC         LDX #0x19ac                       
  19fb  AD9FFC52       JSR [0xfc52]                      
  19ff  3510           PULS  X                           
  1a01  39             RTS                               
  1a02  .db 14 73 75 6D 32 62 20 69 6E 3C 20 20 20 20 20 20  ; .sum2b in<      
  1a12  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1a17
FUN_M6F_r4_34000__1a17:
  1a17  3476           PSHS  U Y X B A                   
  1a19  8E19AC         LDX #0x19ac                       
  1a1c  AD9FFE76       JSR [0xfe76]                      
  1a20  CC000A         LDD #0xa                          
  1a23  AD9FFD20       JSR [0xfd20]                      
  1a27  108E0151       LDY #0x151                        
  1a2b  FC7086         LDD 0x7086                        
  1a2e  AD9FFD2E       JSR [0xfd2e]                      
  1a32  3576           PULS  A B X Y U                   
  1a34  39             RTS                               
  1a35  1AA01A7F1A73   addr[3]                           
  1a3b  .db 70 58 70 72 00 00 70 8C 00 08 00 95 1D 00 00 00  ; pXpr..p.........
  1a4b  .db 0F 00 01 00 0B 1D 1A 8B 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__1a5b
FUN_M6F_r4_34000__1a5b:
  1a5b  3410           PSHS  X                           
  1a5d  8E1A35         LDX #0x1a35                       
  1a60  AD9FFC4E       JSR [0xfc4e]                      
  1a64  3510           PULS  X                           
  1a66  39             RTS                               

; ---- function FUN_M6F_r4_34000__1a67
FUN_M6F_r4_34000__1a67:
  1a67  3410           PSHS  X                           
  1a69  8E1A35         LDX #0x1a35                       
  1a6c  AD9FFC4C       JSR [0xfc4c]                      
  1a70  3510           PULS  X                           
  1a72  39             RTS                               

; ---- function FUN_M6F_r4_34000__1a73
FUN_M6F_r4_34000__1a73:
  1a73  3410           PSHS  X                           
  1a75  8E1A35         LDX #0x1a35                       
  1a78  AD9FFC50       JSR [0xfc50]                      
  1a7c  3510           PULS  X                           
  1a7e  39             RTS                               

; ---- function FUN_M6F_r4_34000__1a7f
FUN_M6F_r4_34000__1a7f:
  1a7f  3410           PSHS  X                           
  1a81  8E1A35         LDX #0x1a35                       
  1a84  AD9FFC52       JSR [0xfc52]                      
  1a88  3510           PULS  X                           
  1a8a  39             RTS                               
  1a8b  .db 14 73 68 69 66 74 20 69 6E 3C 20 20 20 20 20 20  ; .shift in<      
  1a9b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1aa0
FUN_M6F_r4_34000__1aa0:
  1aa0  3476           PSHS  U Y X B A                   
  1aa2  8E1A35         LDX #0x1a35                       
  1aa5  AD9FFE76       JSR [0xfe76]                      
  1aa9  CC000A         LDD #0xa                          
  1aac  AD9FFD20       JSR [0xfd20]                      
  1ab0  108E0154       LDY #0x154                        
  1ab4  FC708C         LDD 0x708c                        
  1ab7  AD9FFD2E       JSR [0xfd2e]                      
  1abb  3576           PULS  A B X Y U                   
  1abd  39             RTS                               
  1abe  1B291B081AFC   addr[3]                           
  1ac4  .db 70 54 70 6E 00 00 70 88 00 08 00 93 1E 00 00 00  ; pTpn..p.........
  1ad4  .db 0F 00 01 00 0B 1D 1B 14 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__1ae4
FUN_M6F_r4_34000__1ae4:
  1ae4  3410           PSHS  X                           
  1ae6  8E1ABE         LDX #0x1abe                       
  1ae9  AD9FFC4E       JSR [0xfc4e]                      
  1aed  3510           PULS  X                           
  1aef  39             RTS                               

; ---- function FUN_M6F_r4_34000__1af0
FUN_M6F_r4_34000__1af0:
  1af0  3410           PSHS  X                           
  1af2  8E1ABE         LDX #0x1abe                       
  1af5  AD9FFC4C       JSR [0xfc4c]                      
  1af9  3510           PULS  X                           
  1afb  39             RTS                               

; ---- function FUN_M6F_r4_34000__1afc
FUN_M6F_r4_34000__1afc:
  1afc  3410           PSHS  X                           
  1afe  8E1ABE         LDX #0x1abe                       
  1b01  AD9FFC50       JSR [0xfc50]                      
  1b05  3510           PULS  X                           
  1b07  39             RTS                               

; ---- function FUN_M6F_r4_34000__1b08
FUN_M6F_r4_34000__1b08:
  1b08  3410           PSHS  X                           
  1b0a  8E1ABE         LDX #0x1abe                       
  1b0d  AD9FFC52       JSR [0xfc52]                      
  1b11  3510           PULS  X                           
  1b13  39             RTS                               
  1b14  .db 14 6C 20 6F 75 74 70 75 74 3C 20 20 20 20 20 20  ; .l output<      
  1b24  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1b29
FUN_M6F_r4_34000__1b29:
  1b29  3476           PSHS  U Y X B A                   
  1b2b  8E1ABE         LDX #0x1abe                       
  1b2e  AD9FFE76       JSR [0xfe76]                      
  1b32  CC000A         LDD #0xa                          
  1b35  AD9FFD20       JSR [0xfd20]                      
  1b39  108E0152       LDY #0x152                        
  1b3d  FC7088         LDD 0x7088                        
  1b40  AD9FFD2E       JSR [0xfd2e]                      
  1b44  3576           PULS  A B X Y U                   
  1b46  39             RTS                               
  1b47  1BB21B911B85   addr[3]                           
  1b4d  .db 70 56 70 70 00 00 70 8A 00 08 00 94 1F 00 00 00  ; pVpp..p.........
  1b5d  .db 0F 00 01 00 0B 1D 1B 9D 00 00 14 B4 00 00 00 00  ; ................

; ---- function FUN_M6F_r4_34000__1b6d
FUN_M6F_r4_34000__1b6d:
  1b6d  3410           PSHS  X                           
  1b6f  8E1B47         LDX #0x1b47                       
  1b72  AD9FFC4E       JSR [0xfc4e]                      
  1b76  3510           PULS  X                           
  1b78  39             RTS                               

; ---- function FUN_M6F_r4_34000__1b79
FUN_M6F_r4_34000__1b79:
  1b79  3410           PSHS  X                           
  1b7b  8E1B47         LDX #0x1b47                       
  1b7e  AD9FFC4C       JSR [0xfc4c]                      
  1b82  3510           PULS  X                           
  1b84  39             RTS                               

; ---- function FUN_M6F_r4_34000__1b85
FUN_M6F_r4_34000__1b85:
  1b85  3410           PSHS  X                           
  1b87  8E1B47         LDX #0x1b47                       
  1b8a  AD9FFC50       JSR [0xfc50]                      
  1b8e  3510           PULS  X                           
  1b90  39             RTS                               

; ---- function FUN_M6F_r4_34000__1b91
FUN_M6F_r4_34000__1b91:
  1b91  3410           PSHS  X                           
  1b93  8E1B47         LDX #0x1b47                       
  1b96  AD9FFC52       JSR [0xfc52]                      
  1b9a  3510           PULS  X                           
  1b9c  39             RTS                               
  1b9d  .db 14 72 20 6F 75 74 70 75 74 3C 20 20 20 20 20 20  ; .r output<      
  1bad  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1bb2
FUN_M6F_r4_34000__1bb2:
  1bb2  3476           PSHS  U Y X B A                   
  1bb4  8E1B47         LDX #0x1b47                       
  1bb7  AD9FFE76       JSR [0xfe76]                      
  1bbb  CC000A         LDD #0xa                          
  1bbe  AD9FFD20       JSR [0xfd20]                      
  1bc2  108E0153       LDY #0x153                        
  1bc6  FC708A         LDD 0x708a                        
  1bc9  AD9FFD2E       JSR [0xfd2e]                      
  1bcd  3576           PULS  A B X Y U                   
  1bcf  39             RTS                               

; ---- function FUN_M6F_r4_34000__1bd0
FUN_M6F_r4_34000__1bd0:
  1bd0  3476           PSHS  U Y X B A                   
  1bd2  170062         LBSR 0x1c37                       
  1bd5  CC0064         LDD #0x64                         
  1bd8  FD60DC         STD 0x60dc                        
  1bdb  FD60DE         STD 0x60de                        
  1bde  3576           PULS  A B X Y U                   
  1be0  39             RTS                               
PTR_FUN_M6F_r4_34000__1c92_M6F_r4_34000__1be1:
  1be1  1C92           addr M6F_r4_34000::1c92           
  1be3  1C67           addr M6F_r4_34000::1c67           
  1be5  .db 1C 43 70 8E 70 90 00 00 70 92 00 08 00 99 08 ED  ; .Cp.p...p.......
  1bf5  .db 40 04 B0 00 01 00 05 11 1C 07 00 00 00 00 70 94  ; @.............p.
  1c05  .db 00 9B 05 6C 65 66 74 20 70 69 74 63 68 3A 20 20  ; ...left pitch:  
  1c15  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  1c25  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M6F_r4_34000__1c2b
FUN_M6F_r4_34000__1c2b:
  1c2b  3410           PSHS  X                           
  1c2d  8E1BE1         LDX #0x1be1                        ; desc[API_FDBC]: ->$1C92 ->$1C67
  1c30  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1c34  3510           PULS  X                           
  1c36  39             RTS                               

; ---- function FUN_M6F_r4_34000__1c37
FUN_M6F_r4_34000__1c37:
  1c37  3410           PSHS  X                           
  1c39  8E1BE1         LDX #0x1be1                        ; desc[API_FE6A]: ->$1C92 ->$1C67
  1c3c  AD9FFE6A       JSR [0xfe6a]                      
  1c40  3510           PULS  X                           
  1c42  39             RTS                               

; ---- function FUN_M6F_r4_34000__1c43
FUN_M6F_r4_34000__1c43:
  1c43  3410           PSHS  X                           
  1c45  8E1BE1         LDX #0x1be1                        ; desc[API_FE6C]: ->$1C92 ->$1C67
  1c48  AD9FFE6C       JSR [0xfe6c]                      
  1c4c  3510           PULS  X                           
  1c4e  39             RTS                               

; ---- function FUN_M6F_r4_34000__1c4f
FUN_M6F_r4_34000__1c4f:
  1c4f  3410           PSHS  X                           
  1c51  8E1BE1         LDX #0x1be1                        ; desc[API_FE1C]: ->$1C92 ->$1C67
  1c54  AD9FFE1C       JSR [0xfe1c]                      
  1c58  3510           PULS  X                           
  1c5a  39             RTS                               

; ---- function FUN_M6F_r4_34000__1c5b
FUN_M6F_r4_34000__1c5b:
  1c5b  3410           PSHS  X                           
  1c5d  8E1BE1         LDX #0x1be1                        ; desc[API_FE1A]: ->$1C92 ->$1C67 $1C43
  1c60  AD9FFE1A       JSR [0xfe1a]                      
  1c64  3510           PULS  X                           
  1c66  39             RTS                               

; ---- function FUN_M6F_r4_34000__1c67
FUN_M6F_r4_34000__1c67:
  1c67  3456           PSHS  U X B A                     
  1c69  8E1BE1         LDX #0x1be1                        ; desc[API_FE6E]: ->$1C92 ->$1C67
  1c6c  AD9FFE6E       JSR [0xfe6e]                      
  1c70  FC70EC         LDD 0x70ec                        
  1c73  3606           PSHU  B A                         
  1c75  108E7142       LDY #0x7142                       
  1c79  8603           LDA #0x3                          
  1c7b  AD9FFC40       JSR [0xfc40]                      
  1c7f  C620           LDB #0x20                         
  1c81  AD9FFC36       JSR [0xfc36]                      
  1c85  CC0005         LDD #0x5                          
  1c88  8E7146         LDX #0x7146                       
  1c8b  AD9FFC3A       JSR [0xfc3a]                      
  1c8f  3556           PULS  A B X U                     
  1c91  39             RTS                               

; ---- function FUN_M6F_r4_34000__1c92
FUN_M6F_r4_34000__1c92:
  1c92  3477           PSHS  U Y X B A CC                
  1c94  8E1BE1         LDX #0x1be1                       
  1c97  AD9FFE76       JSR [0xfe76]                      
  1c9b  FC7092         LDD 0x7092                        
  1c9e  3606           PSHU  B A                         
  1ca0  CC0064         LDD #0x64                         
  1ca3  3606           PSHU  B A                         
  1ca5  AD9FFCE6       JSR [0xfce6]                      
  1ca9  335E           LEAU -0x2,U                       
  1cab  17088A         LBSR 0x2538                       
  1cae  3706           PULU  A B                         
  1cb0  FD70EC         STD 0x70ec                        
  1cb3  CC03E8         LDD #0x3e8                        
  1cb6  B370EC         SUBD 0x70ec                       
  1cb9  FD70F2         STD 0x70f2                        
  1cbc  3606           PSHU  B A                         
  1cbe  CC0020         LDD #0x20                         
  1cc1  3606           PSHU  B A                         
  1cc3  AD9FFCEC       JSR [0xfcec]                      
  1cc7  FC70F2         LDD 0x70f2                        
  1cca  3606           PSHU  B A                         
  1ccc  CC622C         LDD #0x622c                       
  1ccf  3606           PSHU  B A                         
  1cd1  AD9FFCF2       JSR [0xfcf2]                      
  1cd5  AD9FFCE2       JSR [0xfce2]                      
  1cd9  3706           PULU  A B                         
  1cdb  FD70E6         STD 0x70e6                        
  1cde  CC000A         LDD #0xa                          
  1ce1  AD9FFD20       JSR [0xfd20]                      
  1ce5  108E0240       LDY #0x240                        
  1ce9  FC70E6         LDD 0x70e6                        
  1cec  AD9FFD2E       JSR [0xfd2e]                      
  1cf0  3577           PULS CC A B X Y U                 
  1cf2  39             RTS                               
PTR_FUN_M6F_r4_34000__1d76_M6F_r4_34000__1cf3:
  1cf3  1D76           addr M6F_r4_34000::1d76           
  1cf5  1D3D           addr M6F_r4_34000::1d3d           
  1cf7  .db 1D 31 70 96 70 98 00 00 70 9A 00 08 00 9D 09 00  ; .1p.p...p.......
  1d07  .db 00 01 F4 00 01 00 03 20 1D 61 00 00 00 00 70 9C  ; ....... .a....p.
  1d17  .db 00 9F                                            ; ..

; ---- function FUN_M6F_r4_34000__1d19
FUN_M6F_r4_34000__1d19:
  1d19  3410           PSHS  X                           
  1d1b  8E1CF3         LDX #0x1cf3                        ; desc[API_FE6A]: ->$1D76 ->$1D3D
  1d1e  AD9FFE6A       JSR [0xfe6a]                      
  1d22  3510           PULS  X                           
  1d24  39             RTS                               

; ---- function FUN_M6F_r4_34000__1d25
FUN_M6F_r4_34000__1d25:
  1d25  3410           PSHS  X                           
  1d27  8E1CF3         LDX #0x1cf3                        ; desc[API_FDBC]: ->$1D76 ->$1D3D
  1d2a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1d2e  3510           PULS  X                           
  1d30  39             RTS                               

; ---- function FUN_M6F_r4_34000__1d31
FUN_M6F_r4_34000__1d31:
  1d31  3410           PSHS  X                           
  1d33  8E1CF3         LDX #0x1cf3                        ; desc[API_FE6C]: ->$1D76 ->$1D3D
  1d36  AD9FFE6C       JSR [0xfe6c]                      
  1d3a  3510           PULS  X                           
  1d3c  39             RTS                               

; ---- function FUN_M6F_r4_34000__1d3d
FUN_M6F_r4_34000__1d3d:
  1d3d  3410           PSHS  X                           
  1d3f  8E1CF3         LDX #0x1cf3                        ; desc[API_FE6E]: ->$1D76 ->$1D3D
  1d42  AD9FFE6E       JSR [0xfe6e]                      
  1d46  3510           PULS  X                           
  1d48  39             RTS                               

; ---- function FUN_M6F_r4_34000__1d49
FUN_M6F_r4_34000__1d49:
  1d49  3410           PSHS  X                           
  1d4b  8E1CF3         LDX #0x1cf3                        ; desc[API_FE1C]: ->$1D76 ->$1D3D
  1d4e  AD9FFE1C       JSR [0xfe1c]                      
  1d52  3510           PULS  X                           
  1d54  39             RTS                               

; ---- function FUN_M6F_r4_34000__1d55
FUN_M6F_r4_34000__1d55:
  1d55  3410           PSHS  X                           
  1d57  8E1CF3         LDX #0x1cf3                        ; desc[API_FE1A]: ->$1D76 ->$1D3D $1D31
  1d5a  AD9FFE1A       JSR [0xfe1a]                      
  1d5e  3510           PULS  X                           
  1d60  39             RTS                               
  1d61  .db 14 70 69 74 63 68 20 64 65 6C 61 79 3A 20 20 20  ; .pitch delay:   
  1d71  .db 20 20 6D 53 20                                   ;   mS 

; ---- function FUN_M6F_r4_34000__1d76
FUN_M6F_r4_34000__1d76:
  1d76  3476           PSHS  U Y X B A                   
  1d78  8E1CF3         LDX #0x1cf3                       
  1d7b  AD9FFE76       JSR [0xfe76]                      
  1d7f  CC002C         LDD #0x2c                         
  1d82  3606           PSHU  B A                         
  1d84  FC709A         LDD 0x709a                        
  1d87  3606           PSHU  B A                         
  1d89  AD9FFCEE       JSR [0xfcee]                      
  1d8d  3706           PULU  A B                         
  1d8f  FD712C         STD 0x712c                        
  1d92  170624         LBSR 0x23b9                       
  1d95  3576           PULS  A B X Y U                   
  1d97  39             RTS                               
PTR_FUN_M6F_r4_34000__1e1b_M6F_r4_34000__1d98:
  1d98  1E1B           addr M6F_r4_34000::1e1b           
  1d9a  1DE2           addr M6F_r4_34000::1de2           
  1d9c  .db 1D D6 70 BE 70 C0 00 00 70 C2 00 08 00 59 0A 00  ; ..p.p...p....Y..
  1dac  .db 00 00 64 00 01 00 03 1D 1E 06 00 00 00 00 70 C4  ; ..d...........p.
  1dbc  .db 00 5B                                            ; .[

; ---- function FUN_M6F_r4_34000__1dbe
FUN_M6F_r4_34000__1dbe:
  1dbe  3410           PSHS  X                           
  1dc0  8E1D98         LDX #0x1d98                        ; desc[API_FE6A]: ->$1E1B ->$1DE2
  1dc3  AD9FFE6A       JSR [0xfe6a]                      
  1dc7  3510           PULS  X                           
  1dc9  39             RTS                               

; ---- function FUN_M6F_r4_34000__1dca
FUN_M6F_r4_34000__1dca:
  1dca  3410           PSHS  X                           
  1dcc  8E1D98         LDX #0x1d98                        ; desc[API_FDBC]: ->$1E1B ->$1DE2
  1dcf  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1dd3  3510           PULS  X                           
  1dd5  39             RTS                               

; ---- function FUN_M6F_r4_34000__1dd6
FUN_M6F_r4_34000__1dd6:
  1dd6  3410           PSHS  X                           
  1dd8  8E1D98         LDX #0x1d98                        ; desc[API_FE6C]: ->$1E1B ->$1DE2
  1ddb  AD9FFE6C       JSR [0xfe6c]                      
  1ddf  3510           PULS  X                           
  1de1  39             RTS                               

; ---- function FUN_M6F_r4_34000__1de2
FUN_M6F_r4_34000__1de2:
  1de2  3410           PSHS  X                           
  1de4  8E1D98         LDX #0x1d98                        ; desc[API_FE6E]: ->$1E1B ->$1DE2
  1de7  AD9FFE6E       JSR [0xfe6e]                      
  1deb  3510           PULS  X                           
  1ded  39             RTS                               

; ---- function FUN_M6F_r4_34000__1dee
FUN_M6F_r4_34000__1dee:
  1dee  3410           PSHS  X                           
  1df0  8E1D98         LDX #0x1d98                        ; desc[API_FE1C]: ->$1E1B ->$1DE2
  1df3  AD9FFE1C       JSR [0xfe1c]                      
  1df7  3510           PULS  X                           
  1df9  39             RTS                               

; ---- function FUN_M6F_r4_34000__1dfa
FUN_M6F_r4_34000__1dfa:
  1dfa  3410           PSHS  X                           
  1dfc  8E1D98         LDX #0x1d98                        ; desc[API_FE1A]: ->$1E1B ->$1DE2 $1DD6
  1dff  AD9FFE1A       JSR [0xfe1a]                      
  1e03  3510           PULS  X                           
  1e05  39             RTS                               
  1e06  .db 14 6C 65 66 74 20 6D 69 78 3A 20 20 20 20 25 20  ; .left mix:    % 
  1e16  .db 77 65 74 20 20                                   ; wet  

; ---- function FUN_M6F_r4_34000__1e1b
FUN_M6F_r4_34000__1e1b:
  1e1b  3476           PSHS  U Y X B A                   
  1e1d  8E1D98         LDX #0x1d98                       
  1e20  AD9FFE76       JSR [0xfe76]                      
  1e24  CC0064         LDD #0x64                         
  1e27  B370C2         SUBD 0x70c2                       
  1e2a  3606           PSHU  B A                         
  1e2c  58             LSLB                              
  1e2d  49             ROLA                              
  1e2e  FD70F2         STD 0x70f2                        
  1e31  CC4666         LDD #0x4666                       
  1e34  3606           PSHU  B A                         
  1e36  AD9FFCF2       JSR [0xfcf2]                      
  1e3a  3706           PULU  A B                         
  1e3c  F370F2         ADDD 0x70f2                       
  1e3f  AD9FFC6A       JSR [0xfc6a]                      
  1e43  3576           PULS  A B X Y U                   
  1e45  39             RTS                               
PTR_FUN_M6F_r4_34000__1ec9_M6F_r4_34000__1e46:
  1e46  1EC9           addr M6F_r4_34000::1ec9           
  1e48  1E90           addr M6F_r4_34000::1e90           
  1e4a  .db 1E 84 70 C6 70 C8 00 00 70 CA 00 08 00 5D 0B 00  ; ..p.p...p....]..
  1e5a  .db 00 00 64 00 01 00 03 1E 1E B4 00 00 00 00 70 CC  ; ..d...........p.
  1e6a  .db 00 5F                                            ; ._

; ---- function FUN_M6F_r4_34000__1e6c
FUN_M6F_r4_34000__1e6c:
  1e6c  3410           PSHS  X                           
  1e6e  8E1E46         LDX #0x1e46                        ; desc[API_FE6A]: ->$1EC9 ->$1E90
  1e71  AD9FFE6A       JSR [0xfe6a]                      
  1e75  3510           PULS  X                           
  1e77  39             RTS                               

; ---- function FUN_M6F_r4_34000__1e78
FUN_M6F_r4_34000__1e78:
  1e78  3410           PSHS  X                           
  1e7a  8E1E46         LDX #0x1e46                        ; desc[API_FDBC]: ->$1EC9 ->$1E90
  1e7d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...F"
  1e81  3510           PULS  X                           
  1e83  39             RTS                               

; ---- function FUN_M6F_r4_34000__1e84
FUN_M6F_r4_34000__1e84:
  1e84  3410           PSHS  X                           
  1e86  8E1E46         LDX #0x1e46                        ; desc[API_FE6C]: ->$1EC9 ->$1E90
  1e89  AD9FFE6C       JSR [0xfe6c]                      
  1e8d  3510           PULS  X                           
  1e8f  39             RTS                               

; ---- function FUN_M6F_r4_34000__1e90
FUN_M6F_r4_34000__1e90:
  1e90  3410           PSHS  X                           
  1e92  8E1E46         LDX #0x1e46                        ; desc[API_FE6E]: ->$1EC9 ->$1E90
  1e95  AD9FFE6E       JSR [0xfe6e]                      
  1e99  3510           PULS  X                           
  1e9b  39             RTS                               

; ---- function FUN_M6F_r4_34000__1e9c
FUN_M6F_r4_34000__1e9c:
  1e9c  3410           PSHS  X                           
  1e9e  8E1E46         LDX #0x1e46                        ; desc[API_FE1C]: ->$1EC9 ->$1E90
  1ea1  AD9FFE1C       JSR [0xfe1c]                      
  1ea5  3510           PULS  X                           
  1ea7  39             RTS                               

; ---- function FUN_M6F_r4_34000__1ea8
FUN_M6F_r4_34000__1ea8:
  1ea8  3410           PSHS  X                           
  1eaa  8E1E46         LDX #0x1e46                        ; desc[API_FE1A]: ->$1EC9 ->$1E90 $1E84
  1ead  AD9FFE1A       JSR [0xfe1a]                      
  1eb1  3510           PULS  X                           
  1eb3  39             RTS                               
  1eb4  .db 14 72 69 67 68 74 20 6D 69 78 3A 20 20 20 20 25  ; .right mix:    %
  1ec4  .db 20 77 65 74 20                                   ;  wet 

; ---- function FUN_M6F_r4_34000__1ec9
FUN_M6F_r4_34000__1ec9:
  1ec9  3476           PSHS  U Y X B A                   
  1ecb  8E1E46         LDX #0x1e46                       
  1ece  AD9FFE76       JSR [0xfe76]                      
  1ed2  CC0064         LDD #0x64                         
  1ed5  B370CA         SUBD 0x70ca                       
  1ed8  3606           PSHU  B A                         
  1eda  58             LSLB                              
  1edb  49             ROLA                              
  1edc  FD70F2         STD 0x70f2                        
  1edf  CC4666         LDD #0x4666                       
  1ee2  3606           PSHU  B A                         
  1ee4  AD9FFCF2       JSR [0xfcf2]                      
  1ee8  3706           PULU  A B                         
  1eea  F370F2         ADDD 0x70f2                       
  1eed  AD9FFC72       JSR [0xfc72]                      
  1ef1  3576           PULS  A B X Y U                   
  1ef3  39             RTS                               
PTR_FUN_M6F_r4_34000__1f5f_M6F_r4_34000__1ef4:
  1ef4  1F5F           addr M6F_r4_34000::1f5f           
  1ef6  1F3E           addr M6F_r4_34000::1f3e           
  1ef8  .db 1F 32 70 9E 70 A0 00 00 70 A2 00 08 00 21 0C FF  ; .2p.p...p....!..
  1f08  .db D0 00 30 00 01 00 03 1C 1F 4A 00 00 00 00 00 00  ; ..0......J......
  1f18  .db 00 00                                            ; ..

; ---- function FUN_M6F_r4_34000__1f1a
FUN_M6F_r4_34000__1f1a:
  1f1a  3410           PSHS  X                           
  1f1c  8E1EF4         LDX #0x1ef4                       
  1f1f  AD9FFE74       JSR [0xfe74]                      
  1f23  3510           PULS  X                           
  1f25  39             RTS                               

; ---- function FUN_M6F_r4_34000__1f26
FUN_M6F_r4_34000__1f26:
  1f26  3410           PSHS  X                           
  1f28  8E1EF4         LDX #0x1ef4                        ; desc[API_FE22]: ->$1F5F ->$1F3E
  1f2b  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1f2f  3510           PULS  X                           
  1f31  39             RTS                               

; ---- function FUN_M6F_r4_34000__1f32
FUN_M6F_r4_34000__1f32:
  1f32  3410           PSHS  X                           
  1f34  8E1EF4         LDX #0x1ef4                       
  1f37  AD9FFE70       JSR [0xfe70]                      
  1f3b  3510           PULS  X                           
  1f3d  39             RTS                               

; ---- function FUN_M6F_r4_34000__1f3e
FUN_M6F_r4_34000__1f3e:
  1f3e  3410           PSHS  X                           
  1f40  8E1EF4         LDX #0x1ef4                       
  1f43  AD9FFE72       JSR [0xfe72]                      
  1f47  3510           PULS  X                           
  1f49  39             RTS                               
  1f4a  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  1f5a  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1f5f
FUN_M6F_r4_34000__1f5f:
  1f5f  3476           PSHS  U Y X B A                   
  1f61  8E1EF4         LDX #0x1ef4                       
  1f64  AD9FFE76       JSR [0xfe76]                      
  1f68  AD9FFE52       JSR [0xfe52]                      
  1f6c  3576           PULS  A B X Y U                   
  1f6e  39             RTS                               
PTR_FUN_M6F_r4_34000__1fda_M6F_r4_34000__1f6f:
  1f6f  1FDA           addr M6F_r4_34000::1fda           
  1f71  1FB9           addr M6F_r4_34000::1fb9           
  1f73  .db 1F AD 70 A6 70 A8 00 00 70 AA 00 08 00 22 0D FF  ; ..p.p...p...."..
  1f83  .db D0 00 30 00 01 00 03 1D 1F C5 00 00 00 00 00 00  ; ..0.............
  1f93  .db 00 00                                            ; ..

; ---- function FUN_M6F_r4_34000__1f95
FUN_M6F_r4_34000__1f95:
  1f95  3410           PSHS  X                           
  1f97  8E1F6F         LDX #0x1f6f                       
  1f9a  AD9FFE74       JSR [0xfe74]                      
  1f9e  3510           PULS  X                           
  1fa0  39             RTS                               

; ---- function FUN_M6F_r4_34000__1fa1
FUN_M6F_r4_34000__1fa1:
  1fa1  3410           PSHS  X                           
  1fa3  8E1F6F         LDX #0x1f6f                        ; desc[API_FE22]: ->$1FDA ->$1FB9
  1fa6  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1faa  3510           PULS  X                           
  1fac  39             RTS                               

; ---- function FUN_M6F_r4_34000__1fad
FUN_M6F_r4_34000__1fad:
  1fad  3410           PSHS  X                           
  1faf  8E1F6F         LDX #0x1f6f                       
  1fb2  AD9FFE70       JSR [0xfe70]                      
  1fb6  3510           PULS  X                           
  1fb8  39             RTS                               

; ---- function FUN_M6F_r4_34000__1fb9
FUN_M6F_r4_34000__1fb9:
  1fb9  3410           PSHS  X                           
  1fbb  8E1F6F         LDX #0x1f6f                       
  1fbe  AD9FFE72       JSR [0xfe72]                      
  1fc2  3510           PULS  X                           
  1fc4  39             RTS                               
  1fc5  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  1fd5  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__1fda
FUN_M6F_r4_34000__1fda:
  1fda  3476           PSHS  U Y X B A                   
  1fdc  8E1F6F         LDX #0x1f6f                       
  1fdf  AD9FFE76       JSR [0xfe76]                      
  1fe3  AD9FFE54       JSR [0xfe54]                      
  1fe7  3576           PULS  A B X Y U                   
  1fe9  39             RTS                               
PTR_FUN_M6F_r4_34000__2055_M6F_r4_34000__1fea:
  1fea  2055           addr M6F_r4_34000::2055           
  1fec  2034           addr M6F_r4_34000::2034           
  1fee  .db 20 28 70 AE 70 B0 00 00 70 B2 00 08 00 23 0E FF  ;  (p.p...p....#..
  1ffe  .db D0 00 30 00 01 00 03 1D 20 40 00 00 00 00 00 00  ; ..0..... @......
  200e  .db 00 00                                            ; ..

; ---- function FUN_M6F_r4_34000__2010
FUN_M6F_r4_34000__2010:
  2010  3410           PSHS  X                           
  2012  8E1FEA         LDX #0x1fea                       
  2015  AD9FFE74       JSR [0xfe74]                      
  2019  3510           PULS  X                           
  201b  39             RTS                               

; ---- function FUN_M6F_r4_34000__201c
FUN_M6F_r4_34000__201c:
  201c  3410           PSHS  X                           
  201e  8E1FEA         LDX #0x1fea                        ; desc[API_FE22]: ->$2055 ->$2034
  2021  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2025  3510           PULS  X                           
  2027  39             RTS                               

; ---- function FUN_M6F_r4_34000__2028
FUN_M6F_r4_34000__2028:
  2028  3410           PSHS  X                           
  202a  8E1FEA         LDX #0x1fea                       
  202d  AD9FFE70       JSR [0xfe70]                      
  2031  3510           PULS  X                           
  2033  39             RTS                               

; ---- function FUN_M6F_r4_34000__2034
FUN_M6F_r4_34000__2034:
  2034  3410           PSHS  X                           
  2036  8E1FEA         LDX #0x1fea                       
  2039  AD9FFE72       JSR [0xfe72]                      
  203d  3510           PULS  X                           
  203f  39             RTS                               
  2040  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  2050  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6F_r4_34000__2055
FUN_M6F_r4_34000__2055:
  2055  3476           PSHS  U Y X B A                   
  2057  8E1FEA         LDX #0x1fea                       
  205a  AD9FFE76       JSR [0xfe76]                      
  205e  AD9FFE56       JSR [0xfe56]                      
  2062  3576           PULS  A B X Y U                   
  2064  39             RTS                               
PTR_FUN_M6F_r4_34000__20d0_M6F_r4_34000__2065:
  2065  20D0           addr M6F_r4_34000::20d0           
  2067  20AF           addr M6F_r4_34000::20af           
  2069  .db 20 A3 70 B6 70 B8 00 00 70 BA 00 08 00 24 0F FF  ;  .p.p...p....$..
  2079  .db D0 00 30 00 01 00 03 1E 20 BB 00 00 00 00 00 00  ; ..0..... .......
  2089  .db 00 00                                            ; ..

; ---- function FUN_M6F_r4_34000__208b
FUN_M6F_r4_34000__208b:
  208b  3410           PSHS  X                           
  208d  8E2065         LDX #0x2065                       
  2090  AD9FFE74       JSR [0xfe74]                      
  2094  3510           PULS  X                           
  2096  39             RTS                               

; ---- function FUN_M6F_r4_34000__2097
FUN_M6F_r4_34000__2097:
  2097  3410           PSHS  X                           
  2099  8E2065         LDX #0x2065                        ; desc[API_FE22]: ->$20D0 ->$20AF
  209c  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  20a0  3510           PULS  X                           
  20a2  39             RTS                               

; ---- function FUN_M6F_r4_34000__20a3
FUN_M6F_r4_34000__20a3:
  20a3  3410           PSHS  X                           
  20a5  8E2065         LDX #0x2065                       
  20a8  AD9FFE70       JSR [0xfe70]                      
  20ac  3510           PULS  X                           
  20ae  39             RTS                               

; ---- function FUN_M6F_r4_34000__20af
FUN_M6F_r4_34000__20af:
  20af  3410           PSHS  X                           
  20b1  8E2065         LDX #0x2065                       
  20b4  AD9FFE72       JSR [0xfe72]                      
  20b8  3510           PULS  X                           
  20ba  39             RTS                               
  20bb  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  20cb  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M6F_r4_34000__20d0
FUN_M6F_r4_34000__20d0:
  20d0  3476           PSHS  U Y X B A                   
  20d2  8E2065         LDX #0x2065                       
  20d5  AD9FFE76       JSR [0xfe76]                      
  20d9  AD9FFE58       JSR [0xfe58]                      
  20dd  3576           PULS  A B X Y U                   
  20df  39             RTS                               

; ---- function FUN_M6F_r4_34000__20e0
FUN_M6F_r4_34000__20e0:
  20e0  3426           PSHS  Y B A                       
  20e2  AD9FFC8E       JSR [0xfc8e]                      
  20e6  FC60F9         LDD 0x60f9                        
  20e9  FD70E0         STD 0x70e0                        
  20ec  FD6074         STD 0x6074                        
  20ef  1700EE         LBSR 0x21e0                       
  20f2  CC0097         LDD #0x97                         
  20f5  830008         SUBD #0x8                         
  20f8  1F02           TFR D,Y                           
  20fa  FC70E0         LDD 0x70e0                        
  20fd  AD9FFC80       JSR [0xfc80]                      
  2101  3526           PULS  A B Y                       
  2103  39             RTS                               

; ---- function FUN_M6F_r4_34000__2104
FUN_M6F_r4_34000__2104:
  2104  3406           PSHS  B A                         
  2106  FC70E0         LDD 0x70e0                        
  2109  FD6074         STD 0x6074                        
  210c  17E5E1         LBSR 0x06f0                       
  210f  C613           LDB #0x13                         
  2111  AD9FFC36       JSR [0xfc36]                      
  2115  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  2119  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M6F_r4_34000__212f:
  212f  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$2180 ->$2154 $0001 $0001 $0000
  2133  01             db 1h                             
  2134  01             db 1h                             
  2135  02             db 2h                             
  2136  01             db 1h                             
  2137  01             db 1h                             
  2138  00             db 0h                             
  2139  01             db 1h                             
  213a  80             db 80h                            
  213b  0004           dw 4h                             
  213d  0000           dw 0h                             
  213f  0000           dw 0h                             
  2141  2180           addr M6F_r4_34000::2180           
  2143  2154           addr M6F_r4_34000::2154           
  2145  0001           dw 1h                             
  2147  0001           dw 1h                             
  2149  0000           dw 0h                             
LAB_M6F_r4_34000__214b:
  214b  170032         LBSR 0x2180                       
  214e  170133         LBSR 0x2284                       
  2151  3506           PULS  A B                         
  2153  39             RTS                               

; ---- function FUN_M6F_r4_34000__2154
FUN_M6F_r4_34000__2154:
  2154  3426           PSHS  Y B A                       
  2156  FC6062         LDD 0x6062                        
  2159  FD70E0         STD 0x70e0                        
  215c  CC0097         LDD #0x97                         
  215f  830008         SUBD #0x8                         
  2162  1F02           TFR D,Y                           
  2164  FC70E0         LDD 0x70e0                        
  2167  AD9FFC80       JSR [0xfc80]                      
  216b  108E0011       LDY #0x11                         
  216f  FC70E0         LDD 0x70e0                        
  2172  AD9FFE40       JSR [0xfe40]                      
  2176  8D08           BSR 0x2180                        
  2178  170109         LBSR 0x2284                       
  217b  8D63           BSR 0x21e0                        
  217d  3526           PULS  A B Y                       
  217f  39             RTS                               

; ---- function FUN_M6F_r4_34000__2180
FUN_M6F_r4_34000__2180:
  2180  C626           LDB #0x26                         
  2182  AD9FFC36       JSR [0xfc36]                      
  2186  FC70E0         LDD 0x70e0                        
  2189  10830000       CMPD #0x0                         
  218d  10270045       LBEQ 0x21d6                       
  2191  FC70E0         LDD 0x70e0                        
  2194  10830001       CMPD #0x1                         
  2198  10270031       LBEQ 0x21cd                       
  219c  FC70E0         LDD 0x70e0                        
  219f  10830002       CMPD #0x2                         
  21a3  1027001D       LBEQ 0x21c4                       
  21a7  FC70E0         LDD 0x70e0                        
  21aa  10830003       CMPD #0x3                         
  21ae  10270009       LBEQ 0x21bb                       
  21b2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C8"
  21b6  433800         char[3] "C8"                      
LAB_M6F_r4_34000__21b9:
  21b9  2024           BRA 0x21df                        
LAB_M6F_r4_34000__21bb:
  21bb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C7"
  21bf  433700         char[3] "C7"                      
LAB_M6F_r4_34000__21c2:
  21c2  201B           BRA 0x21df                        
LAB_M6F_r4_34000__21c4:
  21c4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C6"
  21c8  433600         char[3] "C6"                      
LAB_M6F_r4_34000__21cb:
  21cb  2012           BRA 0x21df                        
LAB_M6F_r4_34000__21cd:
  21cd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C5"
  21d1  433500         char[3] "C5"                      
LAB_M6F_r4_34000__21d4:
  21d4  2009           BRA 0x21df                        
LAB_M6F_r4_34000__21d6:
  21d6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C4"
  21da  433400         char[3] "C4"                      
LAB_M6F_r4_34000__21dd:
  21dd  2000           BRA 0x21df                        
LAB_M6F_r4_34000__21df:
  21df  39             RTS                               

; ---- function FUN_M6F_r4_34000__21e0
FUN_M6F_r4_34000__21e0:
  21e0  1700C5         LBSR 0x22a8                       
  21e3  39             RTS                               

; ---- function FUN_M6F_r4_34000__21e4
FUN_M6F_r4_34000__21e4:
  21e4  3426           PSHS  Y B A                       
  21e6  AD9FFC8E       JSR [0xfc8e]                      
  21ea  FC60F9         LDD 0x60f9                        
  21ed  FD70DE         STD 0x70de                        
  21f0  FD6074         STD 0x6074                        
  21f3  1700B2         LBSR 0x22a8                       
  21f6  CC0096         LDD #0x96                         
  21f9  830008         SUBD #0x8                         
  21fc  1F02           TFR D,Y                           
  21fe  FC70DE         LDD 0x70de                        
  2201  AD9FFC80       JSR [0xfc80]                      
  2205  3526           PULS  A B Y                       
  2207  39             RTS                               

; ---- function FUN_M6F_r4_34000__2208
FUN_M6F_r4_34000__2208:
  2208  3406           PSHS  B A                         
  220a  FC70DE         LDD 0x70de                        
  220d  FD6074         STD 0x6074                        
  2210  17E4DD         LBSR 0x06f0                       
  2213  C613           LDB #0x13                         
  2215  AD9FFC36       JSR [0xfc36]                      
  2219  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  221d  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M6F_r4_34000__2233:
  2233  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$2284 ->$2258 $0001 $0001 $0000
  2237  01             db 1h                             
  2238  01             db 1h                             
  2239  02             db 2h                             
  223a  01             db 1h                             
  223b  01             db 1h                             
  223c  00             db 0h                             
  223d  02             db 2h                             
  223e  80             db 80h                            
  223f  002E           dw 2Eh                            
  2241  0000           dw 0h                             
  2243  0000           dw 0h                             
  2245  2284           addr M6F_r4_34000::2284           
  2247  2258           addr M6F_r4_34000::2258           
  2249  0001           dw 1h                             
  224b  0001           dw 1h                             
  224d  0000           dw 0h                             
LAB_M6F_r4_34000__224f:
  224f  170032         LBSR 0x2284                       
  2252  17FF2B         LBSR 0x2180                       
  2255  3506           PULS  A B                         
  2257  39             RTS                               

; ---- function FUN_M6F_r4_34000__2258
FUN_M6F_r4_34000__2258:
  2258  3426           PSHS  Y B A                       
  225a  FC6062         LDD 0x6062                        
  225d  FD70DE         STD 0x70de                        
  2260  CC0096         LDD #0x96                         
  2263  830008         SUBD #0x8                         
  2266  1F02           TFR D,Y                           
  2268  FC70DE         LDD 0x70de                        
  226b  AD9FFC80       JSR [0xfc80]                      
  226f  108E0010       LDY #0x10                         
  2273  FC70DE         LDD 0x70de                        
  2276  AD9FFE40       JSR [0xfe40]                      
  227a  8D08           BSR 0x2284                        
  227c  17FF01         LBSR 0x2180                       
  227f  8D27           BSR 0x22a8                        
  2281  3526           PULS  A B Y                       
  2283  39             RTS                               

; ---- function FUN_M6F_r4_34000__2284
FUN_M6F_r4_34000__2284:
  2284  C61C           LDB #0x1c                         
  2286  AD9FFC36       JSR [0xfc36]                      
  228a  FC70E0         LDD 0x70e0                        
  228d  860C           LDA #0xc                          
  228f  3D             MUL                               
  2290  C30002         ADDD #0x2                         
  2293  F370DE         ADDD 0x70de                       
  2296  8604           LDA #0x4                          
  2298  3D             MUL                               
  2299  C327BF         ADDD #0x27bf                      
  229c  F3600D         ADDD 0x600d                       
  229f  1F01           TFR D,X                           
  22a1  C604           LDB #0x4                          
  22a3  AD9FFC3A       JSR [0xfc3a]                      
  22a7  39             RTS                               

; ---- function FUN_M6F_r4_34000__22a8
FUN_M6F_r4_34000__22a8:
  22a8  3476           PSHS  U Y X B A                   
  22aa  17010C         LBSR 0x23b9                       
  22ad  FC713E         LDD 0x713e                        
  22b0  AD9FFD3C       JSR [0xfd3c]                      
  22b4  3576           PULS  A B X Y U                   
  22b6  39             RTS                               

; ---- function FUN_M6F_r4_34000__22b7
FUN_M6F_r4_34000__22b7:
  22b7  3426           PSHS  Y B A                       
  22b9  AD9FFC8E       JSR [0xfc8e]                      
  22bd  FC60F9         LDD 0x60f9                        
  22c0  FD70E2         STD 0x70e2                        
  22c3  FD6074         STD 0x6074                        
  22c6  1700D2         LBSR 0x239b                       
  22c9  CC0098         LDD #0x98                         
  22cc  830008         SUBD #0x8                         
  22cf  1F02           TFR D,Y                           
  22d1  FC70E2         LDD 0x70e2                        
  22d4  AD9FFC80       JSR [0xfc80]                      
  22d8  3526           PULS  A B Y                       
  22da  39             RTS                               

; ---- function FUN_M6F_r4_34000__22db
FUN_M6F_r4_34000__22db:
  22db  FC70E2         LDD 0x70e2                        
  22de  FD6074         STD 0x6074                        
  22e1  17E40C         LBSR 0x06f0                       
  22e4  C604           LDB #0x4                          
  22e6  AD9FFC36       JSR [0xfc36]                      
  22ea  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " polyphonic-                   -solo"
  22ee  0A706F6C7970.. char[37] "\npolyphonic-                   -solo"
LAB_M6F_r4_34000__2313:
  2313  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$2358 ->$2333 $0005 $0005 $0000
  2317  01             db 1h                             
  2318  01             db 1h                             
  2319  02             db 2h                             
  231a  01             db 1h                             
  231b  01             db 1h                             
  231c  00             db 0h                             
  231d  03             db 3h                             
  231e  80             db 80h                            
  231f  005F           dw 5Fh                            
  2321  0005           dw 5h                             
  2323  0000           dw 0h                             
  2325  2358           addr M6F_r4_34000::2358           
  2327  2333           addr M6F_r4_34000::2333           
  2329  0005           dw 5h                             
  232b  0005           dw 5h                             
  232d  0000           dw 0h                             
LAB_M6F_r4_34000__232f:
  232f  170026         LBSR 0x2358                       
  2332  39             RTS                               

; ---- function FUN_M6F_r4_34000__2333
FUN_M6F_r4_34000__2333:
  2333  FC6074         LDD 0x6074                        
  2336  FD70E2         STD 0x70e2                        
  2339  CC0098         LDD #0x98                         
  233c  830008         SUBD #0x8                         
  233f  1F02           TFR D,Y                           
  2341  FC70E2         LDD 0x70e2                        
  2344  AD9FFC80       JSR [0xfc80]                      
  2348  108E0012       LDY #0x12                         
  234c  FC70E2         LDD 0x70e2                        
  234f  AD9FFE40       JSR [0xfe40]                      
  2353  8D46           BSR 0x239b                        
  2355  8D01           BSR 0x2358                        
  2357  39             RTS                               

; ---- function FUN_M6F_r4_34000__2358
FUN_M6F_r4_34000__2358:
  2358  3466           PSHS  U Y B A                     
  235a  C610           LDB #0x10                         
  235c  AD9FFC36       JSR [0xfc36]                      
  2360  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                   "
  2364  202020202020.. char[20] "                   "    
LAB_M6F_r4_34000__2378:
  2378  FC70E2         LDD 0x70e2                        
  237b  830005         SUBD #0x5                         
  237e  3606           PSHU  B A                         
  2380  CC0005         LDD #0x5                          
  2383  3606           PSHU  B A                         
  2385  AD9FFCEA       JSR [0xfcea]                      
  2389  3706           PULU  A B                         
  238b  C30010         ADDD #0x10                        
  238e  AD9FFC36       JSR [0xfc36]                      
  2392  C62A           LDB #0x2a                         
  2394  AD9FFC2A       JSR [0xfc2a]                      
  2398  3566           PULS  A B Y U                     
  239a  39             RTS                               

; ---- function FUN_M6F_r4_34000__239b
FUN_M6F_r4_34000__239b:
  239b  3456           PSHS  U X B A                     
  239d  FC70E2         LDD 0x70e2                        
  23a0  3606           PSHU  B A                         
  23a2  CC0147         LDD #0x147                        
  23a5  3606           PSHU  B A                         
  23a7  AD9FFCEE       JSR [0xfcee]                      
  23ab  3706           PULU  A B                         
  23ad  FD712E         STD 0x712e                        
  23b0  CC0000         LDD #0x0                          
  23b3  FD7106         STD 0x7106                        
  23b6  3556           PULS  A B X U                     
  23b8  39             RTS                               

; ---- function FUN_M6F_r4_34000__23b9
FUN_M6F_r4_34000__23b9:
  23b9  3476           PSHS  U Y X B A                   
  23bb  FC70DE         LDD 0x70de                        
  23be  8602           LDA #0x2                          
  23c0  3D             MUL                               
  23c1  C3296F         ADDD #0x296f                      
  23c4  F3600D         ADDD 0x600d                       
  23c7  1F01           TFR D,X                           
  23c9  EC84           LDD ,X                            
  23cb  FD7122         STD 0x7122                        
  23ce  3606           PSHU  B A                         
  23d0  CCFFFF         LDD #0xffff                       
  23d3  3606           PSHU  B A                         
  23d5  AD9FFCDE       JSR [0xfcde]                      
  23d9  3706           PULU  A B                         
  23db  830002         SUBD #0x2                         
  23de  FD7124         STD 0x7124                        
  23e1  FC70E0         LDD 0x70e0                        
  23e4  10830000       CMPD #0x0                         
  23e8  10270041       LBEQ 0x242d                       
  23ec  FC70E0         LDD 0x70e0                        
  23ef  10830001       CMPD #0x1                         
  23f3  1027002E       LBEQ 0x2425                       
  23f7  FC70E0         LDD 0x70e0                        
  23fa  10830002       CMPD #0x2                         
  23fe  1027001B       LBEQ 0x241d                       
  2402  FC70E0         LDD 0x70e0                        
  2405  10830003       CMPD #0x3                         
  2409  10270008       LBEQ 0x2415                       
  240d  CC0001         LDD #0x1                          
  2410  FD7126         STD 0x7126                        
  2413  2045           BRA 0x245a                        
LAB_M6F_r4_34000__2415:
  2415  CC0002         LDD #0x2                          
  2418  FD7126         STD 0x7126                        
  241b  2016           BRA 0x2433                        
LAB_M6F_r4_34000__241d:
  241d  CC0004         LDD #0x4                          
  2420  FD7126         STD 0x7126                        
  2423  200E           BRA 0x2433                        
LAB_M6F_r4_34000__2425:
  2425  CC0008         LDD #0x8                          
  2428  FD7126         STD 0x7126                        
  242b  2006           BRA 0x2433                        
LAB_M6F_r4_34000__242d:
  242d  CC0010         LDD #0x10                         
  2430  FD7126         STD 0x7126                        
LAB_M6F_r4_34000__2433:
  2433  FC70E0         LDD 0x70e0                        
  2436  860A           LDA #0xa                          
  2438  3D             MUL                               
  2439  C329E7         ADDD #0x29e7                      
  243c  F3600D         ADDD 0x600d                       
  243f  1F01           TFR D,X                           
  2441  EC81           LDD ,X++                          
  2443  FD7116         STD 0x7116                        
  2446  EC81           LDD ,X++                          
  2448  FD7118         STD 0x7118                        
  244b  EC81           LDD ,X++                          
  244d  FD711A         STD 0x711a                        
  2450  EC81           LDD ,X++                          
  2452  FD711C         STD 0x711c                        
  2455  EC81           LDD ,X++                          
  2457  FD711E         STD 0x711e                        
LAB_M6F_r4_34000__245a:
  245a  FC70E0         LDD 0x70e0                        
  245d  8630           LDA #0x30                         
  245f  3D             MUL                               
  2460  FD70F2         STD 0x70f2                        
  2463  CC002E         LDD #0x2e                         
  2466  B370DE         SUBD 0x70de                       
  2469  C4FC           ANDB #0xfc                        
  246b  F370F2         ADDD 0x70f2                       
  246e  C326CF         ADDD #0x26cf                      
  2471  F3600D         ADDD 0x600d                       
  2474  1F01           TFR D,X                           
  2476  EC81           LDD ,X++                          
  2478  FD713C         STD 0x713c                        
  247b  EC84           LDD ,X                            
  247d  FD713A         STD 0x713a                        
  2480  FC7122         LDD 0x7122                        
  2483  3606           PSHU  B A                         
  2485  FC7126         LDD 0x7126                        
  2488  58             LSLB                              
  2489  3606           PSHU  B A                         
  248b  AD9FFCF0       JSR [0xfcf0]                      
  248f  3706           PULU  A B                         
  2491  3706           PULU  A B                         
  2493  FD70F2         STD 0x70f2                        
  2496  FC709A         LDD 0x709a                        
  2499  3606           PSHU  B A                         
  249b  CC002C         LDD #0x2c                         
  249e  3606           PSHU  B A                         
  24a0  AD9FFCEE       JSR [0xfcee]                      
  24a4  3706           PULU  A B                         
  24a6  FD70F4         STD 0x70f4                        
  24a9  2B0C           BMI 0x24b7                        
  24ab  FC713A         LDD 0x713a                        
  24ae  B3713C         SUBD 0x713c                       
  24b1  10B370F4       CMPD 0x70f4                       
  24b5  2E0E           BGT 0x24c5                        
LAB_M6F_r4_34000__24b7:
  24b7  FC70F2         LDD 0x70f2                        
  24ba  F370F4         ADDD 0x70f4                       
  24bd  B3713A         SUBD 0x713a                       
  24c0  FD712A         STD 0x712a                        
  24c3  2009           BRA 0x24ce                        
LAB_M6F_r4_34000__24c5:
  24c5  FC70F2         LDD 0x70f2                        
  24c8  B3713C         SUBD 0x713c                       
  24cb  FD712A         STD 0x712a                        
LAB_M6F_r4_34000__24ce:
  24ce  FC7124         LDD 0x7124                        
  24d1  3606           PSHU  B A                         
  24d3  FC7126         LDD 0x7126                        
  24d6  3606           PSHU  B A                         
  24d8  AD9FFCF0       JSR [0xfcf0]                      
  24dc  3706           PULU  A B                         
  24de  CCFFFF         LDD #0xffff                       
  24e1  3606           PSHU  B A                         
  24e3  AD9FFCDE       JSR [0xfcde]                      
  24e7  3706           PULU  A B                         
  24e9  FD70F2         STD 0x70f2                        
  24ec  FD713E         STD 0x713e                        
  24ef  F3712C         ADDD 0x712c                       
  24f2  FD70EE         STD 0x70ee                        
  24f5  CC7FFF         LDD #0x7fff                       
  24f8  3606           PSHU  B A                         
  24fa  FC70F2         LDD 0x70f2                        
  24fd  3606           PSHU  B A                         
  24ff  AD9FFCEA       JSR [0xfcea]                      
  2503  3706           PULU  A B                         
  2505  C30005         ADDD #0x5                         
  2508  FD70F0         STD 0x70f0                        
  250b  CC000A         LDD #0xa                          
  250e  AD9FFD20       JSR [0xfd20]                      
  2512  108E0242       LDY #0x242                        
  2516  FC70F0         LDD 0x70f0                        
  2519  AD9FFD2E       JSR [0xfd2e]                      
  251d  CC000A         LDD #0xa                          
  2520  AD9FFD20       JSR [0xfd20]                      
  2524  108E0241       LDY #0x241                        
  2528  FC70EE         LDD 0x70ee                        
  252b  AD9FFD2E       JSR [0xfd2e]                      
  252f  CC0000         LDD #0x0                          
  2532  FD7106         STD 0x7106                        
  2535  3576           PULS  A B X Y U                   
  2537  39             RTS                               

; ---- function FUN_M6F_r4_34000__2538
FUN_M6F_r4_34000__2538:
  2538  3437           PSHS  Y X B A CC                  
  253a  3706           PULU  A B                         
  253c  FD70F6         STD 0x70f6                        
  253f  3706           PULU  A B                         
  2541  FD70F8         STD 0x70f8                        
  2544  FC70F8         LDD 0x70f8                        
  2547  C30030         ADDD #0x30                        
  254a  58             LSLB                              
  254b  49             ROLA                              
  254c  F3600D         ADDD 0x600d                       
  254f  C32587         ADDD #0x2587                      
  2552  1F01           TFR D,X                           
  2554  FC70F6         LDD 0x70f6                        
  2557  FD70F4         STD 0x70f4                        
  255a  2E08           BGT 0x2564                        
  255c  CC0000         LDD #0x0                          
  255f  B370F4         SUBD 0x70f4                       
  2562  2008           BRA 0x256c                        
LAB_M6F_r4_34000__2564:
  2564  CC0064         LDD #0x64                         
  2567  B370F4         SUBD 0x70f4                       
  256a  3002           LEAX 0x2,X                        
LAB_M6F_r4_34000__256c:
  256c  58             LSLB                              
  256d  49             ROLA                              
  256e  F3600D         ADDD 0x600d                       
  2571  C32603         ADDD #0x2603                      
  2574  1F02           TFR D,Y                           
  2576  EC84           LDD ,X                            
  2578  3606           PSHU  B A                         
  257a  ECA4           LDD ,Y                            
  257c  3606           PSHU  B A                         
  257e  AD9FFCF2       JSR [0xfcf2]                      
  2582  3537           PULS CC A B X Y                   
  2584  39             RTS                               
  2585  .db 00 3B                                            ; .;
DAT_M6F_r4_34000__2587:
  2587  00             ?? 00h                            
  2588  .db 3F                                               ; ?
DAT_M6F_r4_34000__2589:
  2589  00             ?? 00h                            
  258a  .db 42 00 46 00 4A 00 4F 00 54 00 59 00 5E 00 63 00  ; B.F.J.O.T.Y.^.c.
  259a  .db 69 00 6F 00 76 00 7D 00 85 00 8C 00 95 00 9E 00  ; i.o.v.}.........
  25aa  .db A7 00 B1 00 BC 00 C6 00 D2 00 DF 00 EC 00 FA 01  ; ................
  25ba  .db 09 01 19 01 29 01 3B 01 4E 01 62 01 77 01 8D 01  ; ....).;.N.b.w...
  25ca  .db A4 01 BD 01 D8 01 F4 02 12 02 31 02 53 02 76 02  ; ..........1.S.v.
  25da  .db 9B 02 C3 02 ED 03 1A 03 49 03 7B 03 B0 03 E8 04  ; ........I.{.....
  25ea  .db 23 04 62 04 A5 04 EC 05 37 05 86 05 DA 06 33 06  ; #.b.....7.....3.
  25fa  .db 92 06 F6 07 60 07 D0 08 47                       ; ....`...G
DAT_M6F_r4_34000__2603:
  2603  7F             ?? 7Fh                           
  2604  .db FF 7F EC 7F D9 7F C6 7F B3 7F A0 7F 8D 7F 7A 7F  ; ..............z.
  2614  .db 67 7F 55 7F 42 7F 39 7F 1C 7F 09 7E F7 7E E4 7E  ; g.U.B.9....~.~.~
  2624  .db D1 7E BE 7E AC 7E 99 7E 86 7E 73 7E 61 7E 4E 7E  ; .~.~.~.~.~s~a~N~
  2634  .db 3B 7E 29 7E 16 7E 03 7D F1 7D DE 7D CC 7D B9 7D  ; ;~)~.~.}.}.}.}.}
  2644  .db A6 7D 94 7D 81 7D 6F 7D 52 7D 4A 7D 37 7D 25 7D  ; .}.}.}o}R}J}7}%}
  2654  .db 12 7D 00 7C ED 7C DB 7C C8 7C B6 7C A3 7C 91 7C  ; .}.|.|.|.|.|.|.|
  2664  .db 7E 7C 6C 7C 5A 7C 48 7C 35 7C 23 7C 11 7B FE 7B  ; ~|l|Z|H|5|#|.{.{
  2674  .db EC 7B DA 7B C7 7B B5 7B A3 7B 90 7B 7E 7B 6C 7B  ; .{.{.{.{.{.{~{l{
  2684  .db 5A 7B 47 7B 35 7B 23 7B 11 7A FF 7A EC 7A DA 7A  ; Z{G{5{#{.z.z.z.z
  2694  .db C8 7A B6 7A A4 7A 92 7A 7F 7A 6D 7A 5B 7A 49 7A  ; .z.z.z.z.zmz[zIz
  26a4  .db 37 7A 25 7A 13 7A 01 79 EF 79 DD 79 CB 79 B9 79  ; 7z%z.z.y.y.y.y.y
  26b4  .db A7 79 95 79 83 79 71 79 5F 79 4D 79 3B 79 29 79  ; .y.y.yqy_yMy;y)y
  26c4  .db 17 79 05 78 F3 78 E2 78 D0 78 BE 00 00 01 F4 00  ; .y.x.x.x.x......
  26d4  .db 00 02 3F 00 32 02 BC 00 96 03 52 01 2C 03 CF 01  ; ..?.2.....R.,...
  26e4  .db C2 04 E2 02 58 06 0E 03 84 07 3A 04 B0 09 2E 06  ; ....X.....:.....
  26f4  .db 40 0C 1C 08 34 0F 3C 0F A0 13 EC 00 00 01 2C 00  ; @...4.<.......,.
  2704  .db 00 01 5E 00 32 01 C2 00 64 02 0D 00 AF 02 3F 00  ; ..^.2...d.....?.
  2714  .db FA 02 EE 01 5E 03 E8 01 C2 04 B0 02 8A 06 0E 03  ; ....^...........
  2724  .db 20 08 34 04 4C 0A 8C 08 66 0E 10 00 00 00 AF 00  ;  .4.L...f.......
  2734  .db 00 00 AF 00 32 00 E1 00 32 01 2C 00 64 01 90 00  ; ....2...2.,.d...
  2744  .db 96 02 0D 00 AF 02 BC 00 FA 03 52 01 5E 04 4C 01  ; ..........R.^.L.
  2754  .db 90 06 0E 02 26 07 E9 04 1A 0A BE 00 00 00 AF 00  ; ....&...........
  2764  .db 00 00 E1 00 00 00 E1 00 32 01 13 00 4B 01 13 00  ; ........2...K...
  2774  .db 64 01 90 00 7D 02 3F 00 AF 02 A3 00 C8 03 52 00  ; d...}.?.......R.
  2784  .db FA 04 FB 01 2C 06 8B 02 58 08 FC 00 00 00 64 00  ; ....,...X.....d.
  2794  .db 00 00 7D 00 00 00 7D 00 00 00 AF 00 00 00 AF 00  ; ..}...}.........
  27a4  .db 00 01 13 00 00 01 90 00 32 01 F4 00 4B 02 A3 00  ; ........2...K...
  27b4  .db 64 04 1A 00 7D 05 78 00 FA 07 D0 38 20 48 7A 39  ; d...}.x....8 Hz9
  27c4  .db 20 48 7A 39 20 48 7A 31 30 48 7A 31 30 48 7A 31  ;  Hz9 Hz10Hz10Hz1
  27d4  .db 31 48 7A 31 32 48 7A 31 32 48 7A 31 33 48 7A 31  ; 1Hz12Hz12Hz13Hz1
  27e4  .db 34 48 7A 31 34 48 7A 31 35 48 7A 43 30 20 20 43  ; 4Hz14Hz15HzC0  C
  27f4  .db 30 23 20 44 30 20 20 44 30 23 20 45 30 20 20 46  ; 0# D0  D0# E0  F
  2804  .db 30 20 20 46 30 23 20 47 30 20 20 47 30 23 20 41  ; 0  F0# G0  G0# A
  2814  .db 30 20 20 41 30 23 20 42 30 20 20 43 31 20 20 43  ; 0  A0# B0  C1  C
  2824  .db 31 23 20 44 31 20 20 44 31 23 20 45 31 20 20 46  ; 1# D1  D1# E1  F
  2834  .db 31 20 20 46 31 23 20 47 31 20 20 47 31 23 20 41  ; 1  F1# G1  G1# A
  2844  .db 31 20 20 41 31 23 20 42 31 20 20 43 32 20 20 43  ; 1  A1# B1  C2  C
  2854  .db 32 23 20 44 32 20 20 44 32 23 20 45 32 20 20 46  ; 2# D2  D2# E2  F
  2864  .db 32 20 20 46 32 23 20 47 32 20 20 47 32 23 20 41  ; 2  F2# G2  G2# A
  2874  .db 32 20 20 41 32 23 20 42 32 20 20 43 33 20 20 43  ; 2  A2# B2  C3  C
  2884  .db 33 23 20 44 33 20 20 44 33 23 20 45 33 20 20 46  ; 3# D3  D3# E3  F
  2894  .db 33 20 20 46 33 23 20 47 33 20 20 47 33 23 20 41  ; 3  F3# G3  G3# A
  28a4  .db 33 20 20 41 33 23 20 42 33 20 20 43 34 20 20 43  ; 3  A3# B3  C4  C
  28b4  .db 34 23 20 44 34 20 20 44 34 23 20 45 34 20 20 46  ; 4# D4  D4# E4  F
  28c4  .db 34 20 20 46 34 23 20 47 34 20 20 47 34 23 20 41  ; 4  F4# G4  G4# A
  28d4  .db 34 20 20 41 34 23 20 42 34 20 20 43 35 20 20 43  ; 4  A4# B4  C5  C
  28e4  .db 35 23 20 44 35 20 20 44 35 23 20 45 35 20 20 46  ; 5# D5  D5# E5  F
  28f4  .db 35 20 20 46 35 23 20 47 35 20 20 47 35 23 20 41  ; 5  F5# G5  G5# A
  2904  .db 35 20 20 41 35 23 20 42 35 20 20 43 36 20 20 43  ; 5  A5# B5  C6  C
  2914  .db 36 23 20 44 36 20 20 44 36 23 20 45 36 20 20 46  ; 6# D6  D6# E6  F
  2924  .db 36 20 20 46 36 23 20 47 36 20 20 47 36 23 20 41  ; 6  F6# G6  G6# A
  2934  .db 36 20 20 41 36 23 20 42 36 20 20 43 37 20 20 43  ; 6  A6# B6  C7  C
  2944  .db 37 23 20 44 37 20 20 44 37 23 20 45 37 20 20 46  ; 7# D7  D7# E7  F
  2954  .db 37 20 20 46 37 23 20 47 37 20 20 47 37 23 20 41  ; 7  F7# G7  G7# A
  2964  .db 37 20 20 41 37 23 20 42 37 20 20 01 3F 01 2D 01  ; 7  A7# B7  .?.-.
  2974  .db 1C 01 0C 00 FD 00 EF 00 E1 00 D5 00 C9 00 BE 00  ; ................
  2984  .db B3 00 A9 00 A0 00 97 00 8E 00 86 00 7F 00 78 00  ; ..............x.
  2994  .db 71 00 6B 00 65 00 5F 00 5A 00 55 00 50 00 4C 00  ; q.k.e._.Z.U.P.L.
  29a4  .db 47 00 43 00 40 00 3C 00 39 00 36 00 33 00 30 00  ; G.C.@.<.9.6.3.0.
  29b4  .db 2D 00 2B 00 28 00 26 00 24 00 22 00 20 00 1E 00  ; -.+.(.&.$.". ...
  29c4  .db 1D 00 1B 00 1A 00 18 00 17 00 16 00 14 00 13 00  ; ................
  29d4  .db 12 00 11 00 10 00 0F 00 0F 00 0E 00 0D 00 0C 00  ; ................
  29e4  .db 0C 00 0B 78 CF 86 D8 00 16 00 2C 00 16 71 57 8D  ; ...x......,..qW.
  29f4  .db 52 00 56 00 AC 00 56 61 AD 99 39 01 46 02 8C 01  ; R.V...Va..9.F...
  2a04  .db 46 40 10 AD 4B 04 A9 09 52 04 A9                 ; F@..K...R..

;; TMS32010 program 6F for DSP 1: 200 words loaded at $800 (written via bank latch $81)
DSPPROG_6F_DSP1_hdr:
  2a0f  6F10019A0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_6F_DSP1:
  2a17  08007F8B6E00.. dw[201]                           

;; TMS32010 program 6F for DSP 2: 1410 words loaded at $800 (written via bank latch $82)
DSPPROG_6F_DSP2_hdr:
  2ba9  6F110B0E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_6F_DSP2:
  2bb1  08007F8B6E00.. dw[1411]                          

;; TMS32010 program 6F for DSP 3: 113 words loaded at $800 (written via bank latch $83)
DSPPROG_6F_DSP3_hdr:
  36b7  6F1200EC0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_6F_DSP3:
  36bf  08007F8B6E00.. dw[114]                           

;; TMS32010 program 70 for DSP 1: 458 words loaded at $800 (written via bank latch $81)
DSPPROG_70_DSP1_hdr:
  37a3  7010039E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_70_DSP1:
  37ab  080068807F8B.. dw[459]                           

;; TMS32010 program 70 for DSP 2: 468 words loaded at $800 (written via bank latch $82)
DSPPROG_70_DSP2_hdr:
  3b41  701103B20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_70_DSP2:
  3b49  080068807F8B.. dw[469]                           

;; TMS32010 program 70 for DSP 3: 116 words loaded at $800 (written via bank latch $83)
DSPPROG_70_DSP3_hdr:
  3ef3  701200F20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_70_DSP3:
  3efb  08007F8B6E00.. dw[117]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3fe5  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3fed  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ffd  .db FF FF FF                                         ; ...
