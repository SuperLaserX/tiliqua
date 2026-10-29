; H3000_v153  block M6C_small_04000  M6C_small_04000::0000-M6C_small_04000::3fff
; Bank small_04000 (module id 6C)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 6C parameter/preset table "ULTRA-TAP", 152 bytes
MODULE_6C_TABLE_ULTRA_TAP_hdr:
  0008  6C0000A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6C_TABLE_ULTRA_TAP:
  0010  6C             ?? 6Ch    l                       
  0011  .db 01                                               ; .
  0012  554C5452412D.. ds "ULTRA-TAP      "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 64 00 64 00 4B 00 C8 00 00 00 64 00 64 00  ; ..d.d.K.....d.d.
  0054  .db 00 00 00 00 00 00 00 00 32 00 64 00 C8 00 00 01  ; ........2.d.....
  0064  .db 00 02 00 04 00 08 00 10 00 20 00 40 00 80 01 00  ; ......... .@....
  0074  .db 02 00 04 00 08 00 00 50 00 A0 00 F0 01 40 01 90  ; .......P.....@..
  0084  .db 01 E0 02 30 02 80 02 D0 03 20 03 70 03 C0 F5 F7  ; ...0..... .p....
  0094  .db F9 FB FD FF 01 03 05 07 09 0B 05 07 05 85 06 83  ; ................
  00a4  .db 07 63 00 0C                                      ; .c..

;; Module 6C code record 01, 10145 bytes, entered at payload start
MODULE_6C_01_CODE_hdr:
  00a8  6C0127A90000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6C_01_entry
MODULE_6C_01_entry:
  00b0  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00B4
  00b4  00B4           dw B4h                            
LAB_M6C_small_04000__00b6:
  00b6  3477           PSHS  U Y X B A CC                
  00b8  1A40           ORCC #0x40                        
  00ba  C600           LDB #0x0                          
  00bc  AD9FFC58       JSR [0xfc58]                      
  00c0  C601           LDB #0x1                          
  00c2  8E0110         LDX #0x110                        
  00c5  AD9FFD30       JSR [0xfd30]                      
  00c9  1026044B       LBNE 0x0518                       
  00cd  C602           LDB #0x2                          
  00cf  8E0111         LDX #0x111                        
  00d2  AD9FFD30       JSR [0xfd30]                      
  00d6  1026043E       LBNE 0x0518                       
  00da  C603           LDB #0x3                          
  00dc  8E0112         LDX #0x112                        
  00df  AD9FFD30       JSR [0xfd30]                      
  00e3  10260431       LBNE 0x0518                       
  00e7  CC0000         LDD #0x0                          
  00ea  FD7030         STD 0x7030                        
  00ed  FD7038         STD 0x7038                        
  00f0  FD70B0         STD 0x70b0                        
  00f3  FD7050         STD 0x7050                        
  00f6  FD7058         STD 0x7058                        
  00f9  FD7040         STD 0x7040                        
  00fc  FD7046         STD 0x7046                        
  00ff  FD7048         STD 0x7048                        
  0102  FD704A         STD 0x704a                        
  0105  CC00C8         LDD #0xc8                         
  0108  FD70B8         STD 0x70b8                        
  010b  CC012C         LDD #0x12c                        
  010e  FD70BE         STD 0x70be                        
  0111  CCFFFF         LDD #0xffff                       
  0114  FD70BA         STD 0x70ba                        
  0117  CC0000         LDD #0x0                          
  011a  FD70BC         STD 0x70bc                        
  011d  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 45:3E 3D:2E 3F:36 49:56 47:4E 53:44 4B:34 4D:3C 57:5C
  0121  45             db 45h                            
  0122  3E             db 3Eh                            
  0123  3D             db 3Dh                            
  0124  2E             db 2Eh                            
  0125  3F             db 3Fh                            
  0126  36             db 36h                            
  0127  49             db 49h                            
  0128  56             db 56h                            
  0129  47             db 47h                            
  012a  4E             db 4Eh                            
  012b  53             db 53h                            
  012c  44             db 44h                            
  012d  4B             db 4Bh                            
  012e  34             db 34h                            
  012f  4D             db 4Dh                            
  0130  3C             db 3Ch                            
  0131  57             db 57h                            
  0132  5C             db 5Ch                            
  0133  00             db 0h                             
LAB_M6C_small_04000__0134:
  0134  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 55:54 88:A4
  0138  55             db 55h                            
  0139  54             db 54h                            
  013a  88             db 88h                            
  013b  A4             db A4h                            
  013c  00             db 0h                             
LAB_M6C_small_04000__013d:
  013d  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 8A:5E 8B:60 8C:62 8D:64 8E:66 8F:68 90:6A 91:6C 92:6E 93:70 94:72 95:74 59:4C
  0141  8A             db 8Ah                            
  0142  5E             db 5Eh                            
  0143  8B             db 8Bh                            
  0144  60             db 60h                            
  0145  8C             db 8Ch                            
  0146  62             db 62h                            
  0147  8D             db 8Dh                            
  0148  64             db 64h                            
  0149  8E             db 8Eh                            
  014a  66             db 66h                            
  014b  8F             db 8Fh                            
  014c  68             db 68h                            
  014d  90             db 90h                            
  014e  6A             db 6Ah                            
  014f  91             db 91h                            
  0150  6C             db 6Ch                            
  0151  92             db 92h                            
  0152  6E             db 6Eh                            
  0153  93             db 93h                            
  0154  70             db 70h                            
  0155  94             db 94h                            
  0156  72             db 72h                            
  0157  95             db 95h                            
  0158  74             db 74h                            
  0159  59             db 59h                            
  015a  4C             db 4Ch                            
  015b  00             db 0h                             
LAB_M6C_small_04000__015c:
  015c  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 5A:76 5C:78 5E:7A 60:7C 62:7E 64:80 66:82 68:84 6A:86
  0160  5A             db 5Ah                            
  0161  76             db 76h                            
  0162  5C             db 5Ch                            
  0163  78             db 78h                            
  0164  5E             db 5Eh                            
  0165  7A             db 7Ah                            
  0166  60             db 60h                            
  0167  7C             db 7Ch                            
  0168  62             db 62h                            
  0169  7E             db 7Eh                            
  016a  64             db 64h                            
  016b  80             db 80h                            
  016c  66             db 66h                            
  016d  82             db 82h                            
  016e  68             db 68h                            
  016f  84             db 84h                            
  0170  6A             db 6Ah                            
  0171  86             db 86h                            
  0172  00             db 0h                             
LAB_M6C_small_04000__0173:
  0173  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 6C:88 6E:8A 70:8C 96:A6 98:A8 9A:AA 9C:AC 72:8E 74:90
  0177  6C             db 6Ch                            
  0178  88             db 88h                            
  0179  6E             db 6Eh                            
  017a  8A             db 8Ah                            
  017b  70             db 70h                            
  017c  8C             db 8Ch                            
  017d  96             db 96h                            
  017e  A6             db A6h                            
  017f  98             db 98h                            
  0180  A8             db A8h                            
  0181  9A             db 9Ah                            
  0182  AA             db AAh                            
  0183  9C             db 9Ch                            
  0184  AC             db ACh                            
  0185  72             db 72h                            
  0186  8E             db 8Eh                            
  0187  74             db 74h                            
  0188  90             db 90h                            
  0189  00             db 0h                             
LAB_M6C_small_04000__018a:
  018a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 76:92 78:94 7A:96 7C:98 7E:9A 80:9C 82:9E 84:A0 86:A2
  018e  76             db 76h                            
  018f  92             db 92h                            
  0190  78             db 78h                            
  0191  94             db 94h                            
  0192  7A             db 7Ah                            
  0193  96             db 96h                            
  0194  7C             db 7Ch                            
  0195  98             db 98h                            
  0196  7E             db 7Eh                            
  0197  9A             db 9Ah                            
  0198  80             db 80h                            
  0199  9C             db 9Ch                            
  019a  82             db 82h                            
  019b  9E             db 9Eh                            
  019c  84             db 84h                            
  019d  A0             db A0h                            
  019e  86             db 86h                            
  019f  A2             db A2h                            
  01a0  00             db 0h                             
LAB_M6C_small_04000__01a1:
  01a1  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 41:AE 9E:B6
  01a5  41             db 41h                            
  01a6  AE             db AEh                            
  01a7  9E             db 9Eh                            
  01a8  B6             db B6h                            
  01a9  00             db 0h                             
LAB_M6C_small_04000__01aa:
  01aa  AD9FFD7C       JSR [0xfd7c]                      
  01ae  171A4D         LBSR 0x1bfe                       
  01b1  172363         LBSR 0x2517                       
  01b4  17247A         LBSR 0x2631                       
  01b7  170943         LBSR 0x0afd                       
  01ba  170DE4         LBSR 0x0fa1                       
  01bd  170C59         LBSR 0x0e19                       
  01c0  170B6A         LBSR 0x0d2d                       
  01c3  170A5F         LBSR 0x0c25                       
  01c6  1724FE         LBSR 0x26c7                       
  01c9  17259D         LBSR 0x2769                       
  01cc  172540         LBSR 0x270f                       
  01cf  CC097E         LDD #0x97e                        
  01d2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  01d6  6011           addr 6011                         
LAB_M6C_small_04000__01d8:
  01d8  CC0000         LDD #0x0                          
  01db  AD9FFC6C       JSR [0xfc6c]                      
  01df  AD9FFC74       JSR [0xfc74]                      
  01e3  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "diffusor" 21 $1B36 $1B42
  01e7  00             db 0h                             
  01e8  80             db 80h                            
  01e9  646966667573.. ds "diffusor"                     
  01f1  21             db 21h                            
  01f2  1B36           addr M6C_small_04000::1b36        
  01f4  1B42           addr M6C_small_04000::1b42        
LAB_M6C_small_04000__01f6:
  01f6  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " delay  " 25 $0A32 $0A3E
  01fa  01             db 1h                             
  01fb  80             db 80h                            
  01fc  2064656C6179.. ds " delay  "                     
  0204  25             db 25h                            
  0205  0A32           addr M6C_small_04000::0a32        
  0207  0A3E           addr M6C_small_04000::0a3e        
LAB_M6C_small_04000__0209:
  0209  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "panning " 29 $0E81 $0E8D
  020d  02             db 2h                             
  020e  80             db 80h                            
  020f  70616E6E696E.. ds "panning "                     
  0217  29             db 29h                            
  0218  0E81           addr M6C_small_04000::0e81        
  021a  0E8D           addr M6C_small_04000::0e8d        
LAB_M6C_small_04000__021c:
  021c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "feedback" 2D $0B5A $0B66
  0220  03             db 3h                             
  0221  80             db 80h                            
  0222  666565646261.. ds "feedback"                     
  022a  2D             db 2Dh                            
  022b  0B5A           addr M6C_small_04000::0b5a        
  022d  0B66           addr M6C_small_04000::0b66        
LAB_M6C_small_04000__022f:
  022f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 " mix 1  " 31 $244A $2456
  0233  04             db 4h                             
  0234  80             db 80h                            
  0235  206D69782031.. ds " mix 1  "                     
  023d  31             db 31h                            
  023e  244A           addr M6C_small_04000::244a        
  0240  2456           addr M6C_small_04000::2456        
LAB_M6C_small_04000__0242:
  0242  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 " mix 2  " 35 $2564 $2570
  0246  05             db 5h                             
  0247  80             db 80h                            
  0248  206D69782032.. ds " mix 2  "                     
  0250  35             db 35h                            
  0251  2564           addr M6C_small_04000::2564        
  0253  2570           addr M6C_small_04000::2570        
LAB_M6C_small_04000__0255:
  0255  CC027C         LDD #0x27c                        
  0258  FD60F5         STD 0x60f5                        
  025b  CC0066         LDD #0x66                         
  025e  47             ASRA                              
  025f  56             RORB                              
  0260  FD60F7         STD 0x60f7                        
  0263  AD9FFDF6       JSR [0xfdf6]                      
  0267  AD9FFE18       JSR [0xfe18]                      
  026b  1702E0         LBSR 0x054e                       
  026e  AD9FFE10       JSR [0xfe10]                      
  0272  CC4E20         LDD #0x4e20                       
  0275  AD9FFD20       JSR [0xfd20]                      
  0279  3577           PULS CC A B X Y U                 
  027b  39             RTS                               
  027c  02E202ED02F8.. addr[51]                          

; ---- function FUN_M6C_small_04000__02e2
FUN_M6C_small_04000__02e2:
  02e2  17217D         LBSR 0x2462                       
  02e5  17029F         LBSR 0x0587                       
  02e8  AD9FFE10       JSR [0xfe10]                      
  02ec  39             RTS                               

; ---- function FUN_M6C_small_04000__02ed
FUN_M6C_small_04000__02ed:
  02ed  17228C         LBSR 0x257c                       
  02f0  170294         LBSR 0x0587                       
  02f3  AD9FFE12       JSR [0xfe12]                      
  02f7  39             RTS                               

; ---- function FUN_M6C_small_04000__02f8
FUN_M6C_small_04000__02f8:
  02f8  17074F         LBSR 0x0a4a                       
  02fb  170250         LBSR 0x054e                       
  02fe  AD9FFE10       JSR [0xfe10]                      
  0302  39             RTS                               

; ---- function FUN_M6C_small_04000__0303
FUN_M6C_small_04000__0303:
  0303  171848         LBSR 0x1b4e                       
  0306  170245         LBSR 0x054e                       
  0309  AD9FFE12       JSR [0xfe12]                      
  030d  39             RTS                               

; ---- function FUN_M6C_small_04000__030e
FUN_M6C_small_04000__030e:
  030e  170B88         LBSR 0x0e99                       
  0311  17023A         LBSR 0x054e                       
  0314  AD9FFE14       JSR [0xfe14]                      
  0318  39             RTS                               

; ---- function FUN_M6C_small_04000__0319
FUN_M6C_small_04000__0319:
  0319  170A31         LBSR 0x0d4d                       
  031c  17029A         LBSR 0x05b9                       
  031f  AD9FFE10       JSR [0xfe10]                      
  0323  39             RTS                               

; ---- function FUN_M6C_small_04000__0324
FUN_M6C_small_04000__0324:
  0324  170CC6         LBSR 0x0fed                       
  0327  1702F3         LBSR 0x061d                       
  032a  AD9FFE10       JSR [0xfe10]                      
  032e  39             RTS                               

; ---- function FUN_M6C_small_04000__032f
FUN_M6C_small_04000__032f:
  032f  17107C         LBSR 0x13ae                       
  0332  1702E8         LBSR 0x061d                       
  0335  AD9FFE12       JSR [0xfe12]                      
  0339  39             RTS                               

; ---- function FUN_M6C_small_04000__033a
FUN_M6C_small_04000__033a:
  033a  1713B2         LBSR 0x16ef                       
  033d  1702DD         LBSR 0x061d                       
  0340  AD9FFE14       JSR [0xfe14]                      
  0344  39             RTS                               

; ---- function FUN_M6C_small_04000__0345
FUN_M6C_small_04000__0345:
  0345  1719E5         LBSR 0x1d2d                       
  0348  170368         LBSR 0x06b3                       
  034b  AD9FFE10       JSR [0xfe10]                      
  034f  39             RTS                               

; ---- function FUN_M6C_small_04000__0350
FUN_M6C_small_04000__0350:
  0350  1719E1         LBSR 0x1d34                       
  0353  17035D         LBSR 0x06b3                       
  0356  AD9FFE12       JSR [0xfe12]                      
  035a  39             RTS                               

; ---- function FUN_M6C_small_04000__035b
FUN_M6C_small_04000__035b:
  035b  1719DD         LBSR 0x1d3b                       
  035e  170352         LBSR 0x06b3                       
  0361  AD9FFE14       JSR [0xfe14]                      
  0365  39             RTS                               

; ---- function FUN_M6C_small_04000__0366
FUN_M6C_small_04000__0366:
  0366  1719D9         LBSR 0x1d42                       
  0369  170347         LBSR 0x06b3                       
  036c  AD9FFE16       JSR [0xfe16]                      
  0370  39             RTS                               

; ---- function FUN_M6C_small_04000__0371
FUN_M6C_small_04000__0371:
  0371  1719D5         LBSR 0x1d49                       
  0374  170375         LBSR 0x06ec                       
  0377  AD9FFE10       JSR [0xfe10]                      
  037b  39             RTS                               

; ---- function FUN_M6C_small_04000__037c
FUN_M6C_small_04000__037c:
  037c  1719D1         LBSR 0x1d50                       
  037f  17036A         LBSR 0x06ec                       
  0382  AD9FFE12       JSR [0xfe12]                      
  0386  39             RTS                               

; ---- function FUN_M6C_small_04000__0387
FUN_M6C_small_04000__0387:
  0387  1719CD         LBSR 0x1d57                       
  038a  17035F         LBSR 0x06ec                       
  038d  AD9FFE14       JSR [0xfe14]                      
  0391  39             RTS                               

; ---- function FUN_M6C_small_04000__0392
FUN_M6C_small_04000__0392:
  0392  1719C9         LBSR 0x1d5e                       
  0395  170354         LBSR 0x06ec                       
  0398  AD9FFE16       JSR [0xfe16]                      
  039c  39             RTS                               

; ---- function FUN_M6C_small_04000__039d
FUN_M6C_small_04000__039d:
  039d  1719C5         LBSR 0x1d65                       
  03a0  170382         LBSR 0x0725                       
  03a3  AD9FFE10       JSR [0xfe10]                      
  03a7  39             RTS                               

; ---- function FUN_M6C_small_04000__03a8
FUN_M6C_small_04000__03a8:
  03a8  1719C1         LBSR 0x1d6c                       
  03ab  170377         LBSR 0x0725                       
  03ae  AD9FFE12       JSR [0xfe12]                      
  03b2  39             RTS                               

; ---- function FUN_M6C_small_04000__03b3
FUN_M6C_small_04000__03b3:
  03b3  1719BD         LBSR 0x1d73                       
  03b6  17036C         LBSR 0x0725                       
  03b9  AD9FFE14       JSR [0xfe14]                      
  03bd  39             RTS                               

; ---- function FUN_M6C_small_04000__03be
FUN_M6C_small_04000__03be:
  03be  1719B9         LBSR 0x1d7a                       
  03c1  170361         LBSR 0x0725                       
  03c4  AD9FFE16       JSR [0xfe16]                      
  03c8  39             RTS                               

; ---- function FUN_M6C_small_04000__03c9
FUN_M6C_small_04000__03c9:
  03c9  171B61         LBSR 0x1f2d                       
  03cc  1703B3         LBSR 0x0782                       
  03cf  AD9FFE10       JSR [0xfe10]                      
  03d3  39             RTS                               

; ---- function FUN_M6C_small_04000__03d4
FUN_M6C_small_04000__03d4:
  03d4  171B5D         LBSR 0x1f34                       
  03d7  1703A8         LBSR 0x0782                       
  03da  AD9FFE12       JSR [0xfe12]                      
  03de  39             RTS                               

; ---- function FUN_M6C_small_04000__03df
FUN_M6C_small_04000__03df:
  03df  171B59         LBSR 0x1f3b                       
  03e2  17039D         LBSR 0x0782                       
  03e5  AD9FFE14       JSR [0xfe14]                      
  03e9  39             RTS                               

; ---- function FUN_M6C_small_04000__03ea
FUN_M6C_small_04000__03ea:
  03ea  171B55         LBSR 0x1f42                       
  03ed  170392         LBSR 0x0782                       
  03f0  AD9FFE16       JSR [0xfe16]                      
  03f4  39             RTS                               

; ---- function FUN_M6C_small_04000__03f5
FUN_M6C_small_04000__03f5:
  03f5  171B51         LBSR 0x1f49                       
  03f8  1703C0         LBSR 0x07bb                       
  03fb  AD9FFE10       JSR [0xfe10]                      
  03ff  39             RTS                               

; ---- function FUN_M6C_small_04000__0400
FUN_M6C_small_04000__0400:
  0400  171B4D         LBSR 0x1f50                       
  0403  1703B5         LBSR 0x07bb                       
  0406  AD9FFE12       JSR [0xfe12]                      
  040a  39             RTS                               

; ---- function FUN_M6C_small_04000__040b
FUN_M6C_small_04000__040b:
  040b  171B49         LBSR 0x1f57                       
  040e  1703AA         LBSR 0x07bb                       
  0411  AD9FFE14       JSR [0xfe14]                      
  0415  39             RTS                               

; ---- function FUN_M6C_small_04000__0416
FUN_M6C_small_04000__0416:
  0416  171B45         LBSR 0x1f5e                       
  0419  17039F         LBSR 0x07bb                       
  041c  AD9FFE16       JSR [0xfe16]                      
  0420  39             RTS                               

; ---- function FUN_M6C_small_04000__0421
FUN_M6C_small_04000__0421:
  0421  171B41         LBSR 0x1f65                       
  0424  1703CD         LBSR 0x07f4                       
  0427  AD9FFE10       JSR [0xfe10]                      
  042b  39             RTS                               

; ---- function FUN_M6C_small_04000__042c
FUN_M6C_small_04000__042c:
  042c  171B3D         LBSR 0x1f6c                       
  042f  1703C2         LBSR 0x07f4                       
  0432  AD9FFE12       JSR [0xfe12]                      
  0436  39             RTS                               

; ---- function FUN_M6C_small_04000__0437
FUN_M6C_small_04000__0437:
  0437  171B39         LBSR 0x1f73                       
  043a  1703B7         LBSR 0x07f4                       
  043d  AD9FFE14       JSR [0xfe14]                      
  0441  39             RTS                               

; ---- function FUN_M6C_small_04000__0442
FUN_M6C_small_04000__0442:
  0442  171B35         LBSR 0x1f7a                       
  0445  1703AC         LBSR 0x07f4                       
  0448  AD9FFE16       JSR [0xfe16]                      
  044c  39             RTS                               

; ---- function FUN_M6C_small_04000__044d
FUN_M6C_small_04000__044d:
  044d  171CC3         LBSR 0x2113                       
  0450  1703FE         LBSR 0x0851                       
  0453  AD9FFE10       JSR [0xfe10]                      
  0457  39             RTS                               

; ---- function FUN_M6C_small_04000__0458
FUN_M6C_small_04000__0458:
  0458  171CBF         LBSR 0x211a                       
  045b  1703F3         LBSR 0x0851                       
  045e  AD9FFE12       JSR [0xfe12]                      
  0462  39             RTS                               

; ---- function FUN_M6C_small_04000__0463
FUN_M6C_small_04000__0463:
  0463  171CBB         LBSR 0x2121                       
  0466  1703E8         LBSR 0x0851                       
  0469  AD9FFE14       JSR [0xfe14]                      
  046d  39             RTS                               

; ---- function FUN_M6C_small_04000__046e
FUN_M6C_small_04000__046e:
  046e  171CB7         LBSR 0x2128                       
  0471  1703DD         LBSR 0x0851                       
  0474  AD9FFE16       JSR [0xfe16]                      
  0478  39             RTS                               

; ---- function FUN_M6C_small_04000__0479
FUN_M6C_small_04000__0479:
  0479  171CB3         LBSR 0x212f                       
  047c  17040B         LBSR 0x088a                       
  047f  AD9FFE10       JSR [0xfe10]                      
  0483  39             RTS                               

; ---- function FUN_M6C_small_04000__0484
FUN_M6C_small_04000__0484:
  0484  171CAF         LBSR 0x2136                       
  0487  170400         LBSR 0x088a                       
  048a  AD9FFE12       JSR [0xfe12]                      
  048e  39             RTS                               

; ---- function FUN_M6C_small_04000__048f
FUN_M6C_small_04000__048f:
  048f  171CAB         LBSR 0x213d                       
  0492  1703F5         LBSR 0x088a                       
  0495  AD9FFE14       JSR [0xfe14]                      
  0499  39             RTS                               

; ---- function FUN_M6C_small_04000__049a
FUN_M6C_small_04000__049a:
  049a  171CA7         LBSR 0x2144                       
  049d  1703EA         LBSR 0x088a                       
  04a0  AD9FFE14       JSR [0xfe14]                      
  04a4  39             RTS                               

; ---- function FUN_M6C_small_04000__04a5
FUN_M6C_small_04000__04a5:
  04a5  171CA3         LBSR 0x214b                       
  04a8  170418         LBSR 0x08c3                       
  04ab  AD9FFE10       JSR [0xfe10]                      
  04af  39             RTS                               

; ---- function FUN_M6C_small_04000__04b0
FUN_M6C_small_04000__04b0:
  04b0  171C9F         LBSR 0x2152                       
  04b3  17040D         LBSR 0x08c3                       
  04b6  AD9FFE12       JSR [0xfe12]                      
  04ba  39             RTS                               

; ---- function FUN_M6C_small_04000__04bb
FUN_M6C_small_04000__04bb:
  04bb  171C9B         LBSR 0x2159                       
  04be  170402         LBSR 0x08c3                       
  04c1  AD9FFE14       JSR [0xfe14]                      
  04c5  39             RTS                               

; ---- function FUN_M6C_small_04000__04c6
FUN_M6C_small_04000__04c6:
  04c6  171C97         LBSR 0x2160                       
  04c9  1703F7         LBSR 0x08c3                       
  04cc  AD9FFE16       JSR [0xfe16]                      
  04d0  39             RTS                               

; ---- function FUN_M6C_small_04000__04d1
FUN_M6C_small_04000__04d1:
  04d1  171DEE         LBSR 0x22c2                       
  04d4  170449         LBSR 0x0920                       
  04d7  AD9FFE10       JSR [0xfe10]                      
  04db  39             RTS                               

; ---- function FUN_M6C_small_04000__04dc
FUN_M6C_small_04000__04dc:
  04dc  171DEA         LBSR 0x22c9                       
  04df  17043E         LBSR 0x0920                       
  04e2  AD9FFE12       JSR [0xfe12]                      
  04e6  39             RTS                               

; ---- function FUN_M6C_small_04000__04e7
FUN_M6C_small_04000__04e7:
  04e7  171DE6         LBSR 0x22d0                       
  04ea  170433         LBSR 0x0920                       
  04ed  AD9FFE14       JSR [0xfe14]                      
  04f1  39             RTS                               

; ---- function FUN_M6C_small_04000__04f2
FUN_M6C_small_04000__04f2:
  04f2  171DE2         LBSR 0x22d7                       
  04f5  170428         LBSR 0x0920                       
  04f8  AD9FFE16       JSR [0xfe16]                      
  04fc  39             RTS                               

; ---- function FUN_M6C_small_04000__04fd
FUN_M6C_small_04000__04fd:
  04fd  170672         LBSR 0x0b72                       
  0500  17004B         LBSR 0x054e                       
  0503  AD9FFE16       JSR [0xfe16]                      
  0507  39             RTS                               

; ---- function FUN_M6C_small_04000__0508
FUN_M6C_small_04000__0508:
  0508  170775         LBSR 0x0c80                       
  050b  1700AB         LBSR 0x05b9                       
  050e  AD9FFE12       JSR [0xfe12]                      
  0512  39             RTS                               

; ---- function FUN_M6C_small_04000__0513
FUN_M6C_small_04000__0513:
  0513  AD9FFDFC       JSR [0xfdfc]                      
  0517  39             RTS                               
LAB_M6C_small_04000__0518:
  0518  C600           LDB #0x0                          
  051a  AD9FFC36       JSR [0xfc36]                      
  051e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0522  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M6C_small_04000__054b:
  054b  3577           PULS CC A B X Y U                 
  054d  39             RTS                               

; ---- function FUN_M6C_small_04000__054e
FUN_M6C_small_04000__054e:
  054e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "m delay " "diffusor" " width  " "feedback"
  0552  6D2064656C61.. ds "m delay "                     
  055a  646966667573.. ds "diffusor"                     
  0562  207769647468.. ds " width  "                     
  056a  666565646261.. ds "feedback"                     
LAB_M6C_small_04000__0572:
  0572  AD9FFDF2       JSR [0xfdf2]                      
  0576  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A71 ->$1B72 ->$0EC0 ->$0B99 ->$0587 ->$0587
  057a  0A71           addr M6C_small_04000::0a71        
  057c  1B72           addr M6C_small_04000::1b72        
  057e  0EC0           addr M6C_small_04000::0ec0        
  0580  0B99           addr M6C_small_04000::0b99        
  0582  0587           addr M6C_small_04000::0587        
  0584  0587           addr M6C_small_04000::0587        
LAB_M6C_small_04000__0586:
  0586  39             RTS                               

; ---- function FUN_M6C_small_04000__0587
FUN_M6C_small_04000__0587:
  0587  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" [*] " expert "
  058b  6C656674206D.. ds "left mix"                     
  0593  72696768746D.. ds "rightmix"                     
  059b  01             db 1h                             
  059c  206578706572.. ds " expert "                     
LAB_M6C_small_04000__05a4:
  05a4  AD9FFDF2       JSR [0xfdf2]                      
  05a8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2489 ->$25A3 ->$097D ->$05B9 ->$054E ->$054E
  05ac  2489           addr M6C_small_04000::2489        
  05ae  25A3           addr M6C_small_04000::25a3        
  05b0  097D           addr M6C_small_04000::097d        
  05b2  05B9           addr M6C_small_04000::05b9        
  05b4  054E           addr M6C_small_04000::054e        
  05b6  054E           addr M6C_small_04000::054e        
LAB_M6C_small_04000__05b8:
  05b8  39             RTS                               

; ---- function FUN_M6C_small_04000__05b9
FUN_M6C_small_04000__05b9:
  05b9  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "st/mono " " fb tap " [*] " return "
  05bd  73742F6D6F6E.. ds "st/mono "                     
  05c5  206662207461.. ds " fb tap "                     
  05cd  01             db 1h                             
  05ce  207265747572.. ds " return "                     
LAB_M6C_small_04000__05d6:
  05d6  AD9FFDF2       JSR [0xfdf2]                      
  05da  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D71 ->$0CA4 ->$097D ->$0587 ->$05EB ->$05EB
  05de  0D71           addr M6C_small_04000::0d71        
  05e0  0CA4           addr M6C_small_04000::0ca4        
  05e2  097D           addr M6C_small_04000::097d        
  05e4  0587           addr M6C_small_04000::0587        
  05e6  05EB           addr M6C_small_04000::05eb        
  05e8  05EB           addr M6C_small_04000::05eb        
LAB_M6C_small_04000__05ea:
  05ea  39             RTS                               

; ---- function FUN_M6C_small_04000__05eb
FUN_M6C_small_04000__05eb:
  05eb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "quickset" " tedium " [*] " return "
  05ef  717569636B73.. ds "quickset"                     
  05f7  207465646975.. ds " tedium "                     
  05ff  01             db 1h                             
  0600  207265747572.. ds " return "                     
LAB_M6C_small_04000__0608:
  0608  AD9FFDF2       JSR [0xfdf2]                      
  060c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$061D ->$0656 ->$097D ->$0587 ->$05B9 ->$05B9
  0610  061D           addr M6C_small_04000::061d        
  0612  0656           addr M6C_small_04000::0656        
  0614  097D           addr M6C_small_04000::097d        
  0616  0587           addr M6C_small_04000::0587        
  0618  05B9           addr M6C_small_04000::05b9        
  061a  05B9           addr M6C_small_04000::05b9        
LAB_M6C_small_04000__061c:
  061c  39             RTS                               

; ---- function FUN_M6C_small_04000__061d
FUN_M6C_small_04000__061d:
  061d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "spacing " "weights " " pans   " " return "
  0621  73706163696E.. ds "spacing "                     
  0629  776569676874.. ds "weights "                     
  0631  2070616E7320.. ds " pans   "                     
  0639  207265747572.. ds " return "                     
LAB_M6C_small_04000__0641:
  0641  AD9FFDF2       JSR [0xfdf2]                      
  0645  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1002 ->$13C3 ->$1704 ->$05EB ->$061D ->$061D
  0649  1002           addr M6C_small_04000::1002        
  064b  13C3           addr M6C_small_04000::13c3        
  064d  1704           addr M6C_small_04000::1704        
  064f  05EB           addr M6C_small_04000::05eb        
  0651  061D           addr M6C_small_04000::061d        
  0653  061D           addr M6C_small_04000::061d        
LAB_M6C_small_04000__0655:
  0655  39             RTS                               

; ---- function FUN_M6C_small_04000__0656
FUN_M6C_small_04000__0656:
  0656  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "tapdelay" "taplevel" "pan taps" "apdelays"
  065a  74617064656C.. ds "tapdelay"                     
  0662  7461706C6576.. ds "taplevel"                     
  066a  70616E207461.. ds "pan taps"                     
  0672  617064656C61.. ds "apdelays"                     
LAB_M6C_small_04000__067a:
  067a  AD9FFDF2       JSR [0xfdf2]                      
  067e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$06B3 ->$0782 ->$0851 ->$0920 ->$068F ->$068F
  0682  06B3           addr M6C_small_04000::06b3        
  0684  0782           addr M6C_small_04000::0782        
  0686  0851           addr M6C_small_04000::0851        
  0688  0920           addr M6C_small_04000::0920        
  068a  068F           addr M6C_small_04000::068f        
  068c  068F           addr M6C_small_04000::068f        
LAB_M6C_small_04000__068e:
  068e  39             RTS                               

; ---- function FUN_M6C_small_04000__068f
FUN_M6C_small_04000__068f:
  068f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0693  01             db 1h                             
  0694  01             db 1h                             
  0695  01             db 1h                             
  0696  207265747572.. ds " return "                     
LAB_M6C_small_04000__069e:
  069e  AD9FFDF2       JSR [0xfdf2]                      
  06a2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$097D ->$097D ->$097D ->$05EB ->$0656 ->$0656
  06a6  097D           addr M6C_small_04000::097d        
  06a8  097D           addr M6C_small_04000::097d        
  06aa  097D           addr M6C_small_04000::097d        
  06ac  05EB           addr M6C_small_04000::05eb        
  06ae  0656           addr M6C_small_04000::0656        
  06b0  0656           addr M6C_small_04000::0656        
LAB_M6C_small_04000__06b2:
  06b2  39             RTS                               

; ---- function FUN_M6C_small_04000__06b3
FUN_M6C_small_04000__06b3:
  06b3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 "
  06b7  64656C617920.. ds "delay 1 "                     
  06bf  64656C617920.. ds "delay 2 "                     
  06c7  64656C617920.. ds "delay 3 "                     
  06cf  64656C617920.. ds "delay 4 "                     
LAB_M6C_small_04000__06d7:
  06d7  AD9FFDF2       JSR [0xfdf2]                      
  06db  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1DAF ->$1DB6 ->$1DBD ->$1DC4 ->$06EC ->$075E
  06df  1DAF           addr M6C_small_04000::1daf        
  06e1  1DB6           addr M6C_small_04000::1db6        
  06e3  1DBD           addr M6C_small_04000::1dbd        
  06e5  1DC4           addr M6C_small_04000::1dc4        
  06e7  06EC           addr M6C_small_04000::06ec        
  06e9  075E           addr M6C_small_04000::075e        
LAB_M6C_small_04000__06eb:
  06eb  39             RTS                               

; ---- function FUN_M6C_small_04000__06ec
FUN_M6C_small_04000__06ec:
  06ec  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 5 " "delay 6 " "delay 7 " "delay 8 "
  06f0  64656C617920.. ds "delay 5 "                     
  06f8  64656C617920.. ds "delay 6 "                     
  0700  64656C617920.. ds "delay 7 "                     
  0708  64656C617920.. ds "delay 8 "                     
LAB_M6C_small_04000__0710:
  0710  AD9FFDF2       JSR [0xfdf2]                      
  0714  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1DCB ->$1DD2 ->$1DD9 ->$1DE0 ->$0725 ->$06B3
  0718  1DCB           addr M6C_small_04000::1dcb        
  071a  1DD2           addr M6C_small_04000::1dd2        
  071c  1DD9           addr M6C_small_04000::1dd9        
  071e  1DE0           addr M6C_small_04000::1de0        
  0720  0725           addr M6C_small_04000::0725        
  0722  06B3           addr M6C_small_04000::06b3        
LAB_M6C_small_04000__0724:
  0724  39             RTS                               

; ---- function FUN_M6C_small_04000__0725
FUN_M6C_small_04000__0725:
  0725  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 9 " "delay 10" "delay 11" "delay 12"
  0729  64656C617920.. ds "delay 9 "                     
  0731  64656C617920.. ds "delay 10"                     
  0739  64656C617920.. ds "delay 11"                     
  0741  64656C617920.. ds "delay 12"                     
LAB_M6C_small_04000__0749:
  0749  AD9FFDF2       JSR [0xfdf2]                      
  074d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1DE7 ->$1DEE ->$1DF5 ->$1DFC ->$075E ->$06EC
  0751  1DE7           addr M6C_small_04000::1de7        
  0753  1DEE           addr M6C_small_04000::1dee        
  0755  1DF5           addr M6C_small_04000::1df5        
  0757  1DFC           addr M6C_small_04000::1dfc        
  0759  075E           addr M6C_small_04000::075e        
  075b  06EC           addr M6C_small_04000::06ec        
LAB_M6C_small_04000__075d:
  075d  39             RTS                               

; ---- function FUN_M6C_small_04000__075e
FUN_M6C_small_04000__075e:
  075e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0762  01             db 1h                             
  0763  01             db 1h                             
  0764  01             db 1h                             
  0765  207265747572.. ds " return "                     
LAB_M6C_small_04000__076d:
  076d  AD9FFDF2       JSR [0xfdf2]                      
  0771  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$06B3 ->$0725
  0775  097D           addr M6C_small_04000::097d        
  0777  097D           addr M6C_small_04000::097d        
  0779  097D           addr M6C_small_04000::097d        
  077b  0656           addr M6C_small_04000::0656        
  077d  06B3           addr M6C_small_04000::06b3        
  077f  0725           addr M6C_small_04000::0725        
LAB_M6C_small_04000__0781:
  0781  39             RTS                               

; ---- function FUN_M6C_small_04000__0782
FUN_M6C_small_04000__0782:
  0782  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " tap 1  " " tap 2  " " tap 3  " " tap 4  "
  0786  207461702031.. ds " tap 1  "                     
  078e  207461702032.. ds " tap 2  "                     
  0796  207461702033.. ds " tap 3  "                     
  079e  207461702034.. ds " tap 4  "                     
LAB_M6C_small_04000__07a6:
  07a6  AD9FFDF2       JSR [0xfdf2]                      
  07aa  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FAF ->$1FB6 ->$1FBD ->$1FC4 ->$07BB ->$082D
  07ae  1FAF           addr M6C_small_04000::1faf        
  07b0  1FB6           addr M6C_small_04000::1fb6        
  07b2  1FBD           addr M6C_small_04000::1fbd        
  07b4  1FC4           addr M6C_small_04000::1fc4        
  07b6  07BB           addr M6C_small_04000::07bb        
  07b8  082D           addr M6C_small_04000::082d        
LAB_M6C_small_04000__07ba:
  07ba  39             RTS                               

; ---- function FUN_M6C_small_04000__07bb
FUN_M6C_small_04000__07bb:
  07bb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " tap 5  " " tap 6  " " tap 7  " " tap 8  "
  07bf  207461702035.. ds " tap 5  "                     
  07c7  207461702036.. ds " tap 6  "                     
  07cf  207461702037.. ds " tap 7  "                     
  07d7  207461702038.. ds " tap 8  "                     
LAB_M6C_small_04000__07df:
  07df  AD9FFDF2       JSR [0xfdf2]                      
  07e3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FCB ->$1FD2 ->$1FD9 ->$1FE0 ->$07F4 ->$0782
  07e7  1FCB           addr M6C_small_04000::1fcb        
  07e9  1FD2           addr M6C_small_04000::1fd2        
  07eb  1FD9           addr M6C_small_04000::1fd9        
  07ed  1FE0           addr M6C_small_04000::1fe0        
  07ef  07F4           addr M6C_small_04000::07f4        
  07f1  0782           addr M6C_small_04000::0782        
LAB_M6C_small_04000__07f3:
  07f3  39             RTS                               

; ---- function FUN_M6C_small_04000__07f4
FUN_M6C_small_04000__07f4:
  07f4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " tap 9  " " tap 10 " " tap 11 " " tap 12 "
  07f8  207461702039.. ds " tap 9  "                     
  0800  207461702031.. ds " tap 10 "                     
  0808  207461702031.. ds " tap 11 "                     
  0810  207461702031.. ds " tap 12 "                     
LAB_M6C_small_04000__0818:
  0818  AD9FFDF2       JSR [0xfdf2]                      
  081c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FE7 ->$1FEE ->$1FF5 ->$1FFC ->$082D ->$07BB
  0820  1FE7           addr M6C_small_04000::1fe7        
  0822  1FEE           addr M6C_small_04000::1fee        
  0824  1FF5           addr M6C_small_04000::1ff5        
  0826  1FFC           addr M6C_small_04000::1ffc        
  0828  082D           addr M6C_small_04000::082d        
  082a  07BB           addr M6C_small_04000::07bb        
LAB_M6C_small_04000__082c:
  082c  39             RTS                               

; ---- function FUN_M6C_small_04000__082d
FUN_M6C_small_04000__082d:
  082d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0831  01             db 1h                             
  0832  01             db 1h                             
  0833  01             db 1h                             
  0834  207265747572.. ds " return "                     
LAB_M6C_small_04000__083c:
  083c  AD9FFDF2       JSR [0xfdf2]                      
  0840  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$0782 ->$07F4
  0844  097D           addr M6C_small_04000::097d        
  0846  097D           addr M6C_small_04000::097d        
  0848  097D           addr M6C_small_04000::097d        
  084a  0656           addr M6C_small_04000::0656        
  084c  0782           addr M6C_small_04000::0782        
  084e  07F4           addr M6C_small_04000::07f4        
LAB_M6C_small_04000__0850:
  0850  39             RTS                               

; ---- function FUN_M6C_small_04000__0851
FUN_M6C_small_04000__0851:
  0851  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  "
  0855  2070616E2031.. ds " pan 1  "                     
  085d  2070616E2032.. ds " pan 2  "                     
  0865  2070616E2033.. ds " pan 3  "                     
  086d  2070616E2034.. ds " pan 4  "                     
LAB_M6C_small_04000__0875:
  0875  AD9FFDF2       JSR [0xfdf2]                      
  0879  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2195 ->$219C ->$21A3 ->$21AA ->$088A ->$08FC
  087d  2195           addr M6C_small_04000::2195        
  087f  219C           addr M6C_small_04000::219c        
  0881  21A3           addr M6C_small_04000::21a3        
  0883  21AA           addr M6C_small_04000::21aa        
  0885  088A           addr M6C_small_04000::088a        
  0887  08FC           addr M6C_small_04000::08fc        
LAB_M6C_small_04000__0889:
  0889  39             RTS                               

; ---- function FUN_M6C_small_04000__088a
FUN_M6C_small_04000__088a:
  088a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 5  " " pan 6  " " pan 7  " " pan 8  "
  088e  2070616E2035.. ds " pan 5  "                     
  0896  2070616E2036.. ds " pan 6  "                     
  089e  2070616E2037.. ds " pan 7  "                     
  08a6  2070616E2038.. ds " pan 8  "                     
LAB_M6C_small_04000__08ae:
  08ae  AD9FFDF2       JSR [0xfdf2]                      
  08b2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$21B1 ->$21B8 ->$21BF ->$21C6 ->$08C3 ->$0851
  08b6  21B1           addr M6C_small_04000::21b1        
  08b8  21B8           addr M6C_small_04000::21b8        
  08ba  21BF           addr M6C_small_04000::21bf        
  08bc  21C6           addr M6C_small_04000::21c6        
  08be  08C3           addr M6C_small_04000::08c3        
  08c0  0851           addr M6C_small_04000::0851        
LAB_M6C_small_04000__08c2:
  08c2  39             RTS                               

; ---- function FUN_M6C_small_04000__08c3
FUN_M6C_small_04000__08c3:
  08c3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 9  " " pan 10 " " pan 11 " " pan 12 "
  08c7  2070616E2039.. ds " pan 9  "                     
  08cf  2070616E2031.. ds " pan 10 "                     
  08d7  2070616E2031.. ds " pan 11 "                     
  08df  2070616E2031.. ds " pan 12 "                     
LAB_M6C_small_04000__08e7:
  08e7  AD9FFDF2       JSR [0xfdf2]                      
  08eb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$21CD ->$21D4 ->$21DB ->$21E2 ->$08FC ->$088A
  08ef  21CD           addr M6C_small_04000::21cd        
  08f1  21D4           addr M6C_small_04000::21d4        
  08f3  21DB           addr M6C_small_04000::21db        
  08f5  21E2           addr M6C_small_04000::21e2        
  08f7  08FC           addr M6C_small_04000::08fc        
  08f9  088A           addr M6C_small_04000::088a        
LAB_M6C_small_04000__08fb:
  08fb  39             RTS                               

; ---- function FUN_M6C_small_04000__08fc
FUN_M6C_small_04000__08fc:
  08fc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0900  01             db 1h                             
  0901  01             db 1h                             
  0902  01             db 1h                             
  0903  207265747572.. ds " return "                     
LAB_M6C_small_04000__090b:
  090b  AD9FFDF2       JSR [0xfdf2]                      
  090f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$0851 ->$08C3
  0913  097D           addr M6C_small_04000::097d        
  0915  097D           addr M6C_small_04000::097d        
  0917  097D           addr M6C_small_04000::097d        
  0919  0656           addr M6C_small_04000::0656        
  091b  0851           addr M6C_small_04000::0851        
  091d  08C3           addr M6C_small_04000::08c3        
LAB_M6C_small_04000__091f:
  091f  39             RTS                               

; ---- function FUN_M6C_small_04000__0920
FUN_M6C_small_04000__0920:
  0920  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "apdelay1" "apdelay2" "apdelay3" "apdelay4"
  0924  617064656C61.. ds "apdelay1"                     
  092c  617064656C61.. ds "apdelay2"                     
  0934  617064656C61.. ds "apdelay3"                     
  093c  617064656C61.. ds "apdelay4"                     
LAB_M6C_small_04000__0944:
  0944  AD9FFDF2       JSR [0xfdf2]                      
  0948  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$230C ->$2313 ->$231A ->$2321 ->$0959 ->$0959
  094c  230C           addr M6C_small_04000::230c        
  094e  2313           addr M6C_small_04000::2313        
  0950  231A           addr M6C_small_04000::231a        
  0952  2321           addr M6C_small_04000::2321        
  0954  0959           addr M6C_small_04000::0959        
  0956  0959           addr M6C_small_04000::0959        
LAB_M6C_small_04000__0958:
  0958  39             RTS                               

; ---- function FUN_M6C_small_04000__0959
FUN_M6C_small_04000__0959:
  0959  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  095d  01             db 1h                             
  095e  01             db 1h                             
  095f  01             db 1h                             
  0960  207265747572.. ds " return "                     
LAB_M6C_small_04000__0968:
  0968  AD9FFDF2       JSR [0xfdf2]                      
  096c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$097D ->$097D ->$097D ->$0656 ->$0920 ->$0920
  0970  097D           addr M6C_small_04000::097d        
  0972  097D           addr M6C_small_04000::097d        
  0974  097D           addr M6C_small_04000::097d        
  0976  0656           addr M6C_small_04000::0656        
  0978  0920           addr M6C_small_04000::0920        
  097a  0920           addr M6C_small_04000::0920        
LAB_M6C_small_04000__097c:
  097c  39             RTS                               

; ---- function FUN_M6C_small_04000__097d
FUN_M6C_small_04000__097d:
  097d  39             RTS                               

; ---- function FUN_M6C_small_04000__097e
FUN_M6C_small_04000__097e:
  097e  3436           PSHS  Y X B A                     
  0980  FC70BC         LDD 0x70bc                        
  0983  10830000       CMPD #0x0                         
  0987  1027000E       LBEQ 0x0999                       
  098b  FC70BA         LDD 0x70ba                        
  098e  10830000       CMPD #0x0                         
  0992  1027004D       LBEQ 0x09e3                       
  0996  160088         LBRA 0x0a21                       
LAB_M6C_small_04000__0999:
  0999  FC70B8         LDD 0x70b8                        
  099c  B370BE         SUBD 0x70be                       
  099f  FD70B8         STD 0x70b8                        
  09a2  2F15           BLE 0x09b9                        
  09a4  CC000A         LDD #0xa                          
  09a7  AD9FFD20       JSR [0xfd20]                      
  09ab  108E0440       LDY #0x440                        
  09af  FC70B8         LDD 0x70b8                        
  09b2  AD9FFD2E       JSR [0xfd2e]                      
  09b6  160068         LBRA 0x0a21                       
LAB_M6C_small_04000__09b9:
  09b9  CC0000         LDD #0x0                          
  09bc  FD70B8         STD 0x70b8                        
  09bf  CC000A         LDD #0xa                          
  09c2  AD9FFD20       JSR [0xfd20]                      
  09c6  108E0440       LDY #0x440                        
  09ca  FC70B8         LDD 0x70b8                        
  09cd  AD9FFD2E       JSR [0xfd2e]                      
  09d1  171CF3         LBSR 0x26c7                       
  09d4  CCFFFF         LDD #0xffff                       
  09d7  FD70BC         STD 0x70bc                        
  09da  CC0000         LDD #0x0                          
  09dd  FD70BA         STD 0x70ba                        
  09e0  16003E         LBRA 0x0a21                       
LAB_M6C_small_04000__09e3:
  09e3  FC70B8         LDD 0x70b8                        
  09e6  F370BE         ADDD 0x70be                       
  09e9  2918           BVS 0x0a03                        
  09eb  FD70B8         STD 0x70b8                        
  09ee  CC000A         LDD #0xa                          
  09f1  AD9FFD20       JSR [0xfd20]                      
  09f5  108E0440       LDY #0x440                        
  09f9  FC70B8         LDD 0x70b8                        
  09fc  AD9FFD2E       JSR [0xfd2e]                      
  0a00  16001E         LBRA 0x0a21                       
LAB_M6C_small_04000__0a03:
  0a03  CC7FFF         LDD #0x7fff                       
  0a06  FD70B8         STD 0x70b8                        
  0a09  CC000A         LDD #0xa                          
  0a0c  AD9FFD20       JSR [0xfd20]                      
  0a10  108E0440       LDY #0x440                        
  0a14  FC70B8         LDD 0x70b8                        
  0a17  AD9FFD2E       JSR [0xfd2e]                      
  0a1b  CCFFFF         LDD #0xffff                       
  0a1e  FD70BA         STD 0x70ba                        
LAB_M6C_small_04000__0a21:
  0a21  3536           PULS  A B X Y                     
  0a23  39             RTS                               
PTR_FUN_M6C_small_04000__0ae8_M6C_small_04000__0a24:
  0a24  0AE8           addr M6C_small_04000::0ae8        
  0a26  0AFD           addr M6C_small_04000::0afd        
  0a28  704E           addr 704e                         
  0a2a  .db 00 55 D8 00 04 00 00 05                          ; .U......

; ---- function FUN_M6C_small_04000__0a32
FUN_M6C_small_04000__0a32:
  0a32  3410           PSHS  X                           
  0a34  8E0A24         LDX #0xa24                         ; desc[API_FE1C]: ->$0AE8 ->$0AFD $704E
  0a37  AD9FFE1C       JSR [0xfe1c]                      
  0a3b  3510           PULS  X                           
  0a3d  39             RTS                               

; ---- function FUN_M6C_small_04000__0a3e
FUN_M6C_small_04000__0a3e:
  0a3e  3410           PSHS  X                           
  0a40  8E0A24         LDX #0xa24                         ; desc[API_FE1A]: ->$0AE8 ->$0AFD $704E
  0a43  AD9FFE1A       JSR [0xfe1a]                      
  0a47  3510           PULS  X                           
  0a49  39             RTS                               

; ---- function FUN_M6C_small_04000__0a4a
FUN_M6C_small_04000__0a4a:
  0a4a  3426           PSHS  Y B A                       
  0a4c  AD9FFC8E       JSR [0xfc8e]                      
  0a50  FC60F9         LDD 0x60f9                        
  0a53  FD6074         STD 0x6074                        
  0a56  B37050         SUBD 0x7050                       
  0a59  FD704E         STD 0x704e                        
  0a5c  17009E         LBSR 0x0afd                       
  0a5f  CC004F         LDD #0x4f                         
  0a62  830008         SUBD #0x8                         
  0a65  1F02           TFR D,Y                           
  0a67  FC704E         LDD 0x704e                        
  0a6a  AD9FFC82       JSR [0xfc82]                      
  0a6e  3526           PULS  A B Y                       
  0a70  39             RTS                               

; ---- function FUN_M6C_small_04000__0a71
FUN_M6C_small_04000__0a71:
  0a71  3406           PSHS  B A                         
  0a73  FC7052         LDD 0x7052                        
  0a76  FD6074         STD 0x6074                        
  0a79  17FA97         LBSR 0x0513                       
  0a7c  C613           LDB #0x13                         
  0a7e  AD9FFC36       JSR [0xfc36]                      
  0a82  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " master delay:     % "
  0a86  0A6D61737465.. char[22] "\nmaster delay:     % " 
LAB_M6C_small_04000__0a9c:
  0a9c  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0001 $0000 ->$0AE8 ->$0ABE $0001 $0001 $0000
  0aa0  01             db 1h                             
  0aa1  01             db 1h                             
  0aa2  02             db 2h                             
  0aa3  01             db 1h                             
  0aa4  01             db 1h                             
  0aa5  00             db 0h                             
  0aa6  03             db 3h                             
  0aa7  80             db 80h                            
  0aa8  0064           dw 64h                            
  0aaa  0001           dw 1h                             
  0aac  0000           dw 0h                             
  0aae  0AE8           addr M6C_small_04000::0ae8        
  0ab0  0ABE           addr M6C_small_04000::0abe        
  0ab2  0001           dw 1h                             
  0ab4  0001           dw 1h                             
  0ab6  0000           dw 0h                             
LAB_M6C_small_04000__0ab8:
  0ab8  17002D         LBSR 0x0ae8                       
  0abb  3506           PULS  A B                         
  0abd  39             RTS                               

; ---- function FUN_M6C_small_04000__0abe
FUN_M6C_small_04000__0abe:
  0abe  3426           PSHS  Y B A                       
  0ac0  FC6074         LDD 0x6074                        
  0ac3  B37050         SUBD 0x7050                       
  0ac6  FD704E         STD 0x704e                        
  0ac9  CC004F         LDD #0x4f                         
  0acc  830008         SUBD #0x8                         
  0acf  1F02           TFR D,Y                           
  0ad1  FC704E         LDD 0x704e                        
  0ad4  AD9FFC82       JSR [0xfc82]                      
  0ad8  8D23           BSR 0x0afd                        
  0ada  108E0002       LDY #0x2                          
  0ade  FC704E         LDD 0x704e                        
  0ae1  AD9FFE40       JSR [0xfe40]                      
  0ae5  3526           PULS  A B Y                       
  0ae7  39             RTS                               

; ---- function FUN_M6C_small_04000__0ae8
FUN_M6C_small_04000__0ae8:
  0ae8  3456           PSHS  U X B A                     
  0aea  C622           LDB #0x22                         
  0aec  AD9FFC36       JSR [0xfc36]                      
  0af0  CC0003         LDD #0x3                          
  0af3  8E60A0         LDX #0x60a0                       
  0af6  AD9FFC3A       JSR [0xfc3a]                      
  0afa  3556           PULS  A B X U                     
  0afc  39             RTS                               

; ---- function FUN_M6C_small_04000__0afd
FUN_M6C_small_04000__0afd:
  0afd  3476           PSHS  U Y X B A                   
  0aff  CC0001         LDD #0x1                          
  0b02  3606           PSHU  B A                         
  0b04  CC0064         LDD #0x64                         
  0b07  3606           PSHU  B A                         
  0b09  FC704E         LDD 0x704e                        
  0b0c  F37050         ADDD 0x7050                       
  0b0f  3606           PSHU  B A                         
  0b11  AD9FFCD8       JSR [0xfcd8]                      
  0b15  3706           PULU  A B                         
  0b17  FD7052         STD 0x7052                        
  0b1a  FC7052         LDD 0x7052                        
  0b1d  3606           PSHU  B A                         
  0b1f  CC0147         LDD #0x147                        
  0b22  3606           PSHU  B A                         
  0b24  AD9FFCEE       JSR [0xfcee]                      
  0b28  3706           PULU  A B                         
  0b2a  FD701C         STD 0x701c                        
  0b2d  FC7052         LDD 0x7052                        
  0b30  3606           PSHU  B A                         
  0b32  CC55C1         LDD #0x55c1                       
  0b35  3606           PSHU  B A                         
  0b37  AD9FFCF2       JSR [0xfcf2]                      
  0b3b  3706           PULU  A B                         
  0b3d  F3701C         ADDD 0x701c                       
  0b40  FD70C2         STD 0x70c2                        
  0b43  CC0000         LDD #0x0                          
  0b46  FD70BC         STD 0x70bc                        
  0b49  3576           PULS  A B X Y U                   
  0b4b  39             RTS                               
PTR_FUN_M6C_small_04000__0c10_M6C_small_04000__0b4c:
  0b4c  0C10           addr M6C_small_04000::0c10        
  0b4e  0C25           addr M6C_small_04000::0c25        
  0b50  70AE           addr 70ae                         
  0b52  .db 00 43 D8 00 04 00 00 05                          ; .C......

; ---- function FUN_M6C_small_04000__0b5a
FUN_M6C_small_04000__0b5a:
  0b5a  3410           PSHS  X                           
  0b5c  8E0B4C         LDX #0xb4c                         ; desc[API_FE1C]: ->$0C10 ->$0C25 $70AE
  0b5f  AD9FFE1C       JSR [0xfe1c]                      
  0b63  3510           PULS  X                           
  0b65  39             RTS                               

; ---- function FUN_M6C_small_04000__0b66
FUN_M6C_small_04000__0b66:
  0b66  3410           PSHS  X                           
  0b68  8E0B4C         LDX #0xb4c                         ; desc[API_FE1A]: ->$0C10 ->$0C25 $70AE
  0b6b  AD9FFE1A       JSR [0xfe1a]                      
  0b6f  3510           PULS  X                           
  0b71  39             RTS                               

; ---- function FUN_M6C_small_04000__0b72
FUN_M6C_small_04000__0b72:
  0b72  3426           PSHS  Y B A                       
  0b74  AD9FFC8E       JSR [0xfc8e]                      
  0b78  FC60F9         LDD 0x60f9                        
  0b7b  FD6074         STD 0x6074                        
  0b7e  B370B0         SUBD 0x70b0                       
  0b81  FD70AE         STD 0x70ae                        
  0b84  17009E         LBSR 0x0c25                       
  0b87  CC0049         LDD #0x49                         
  0b8a  830008         SUBD #0x8                         
  0b8d  1F02           TFR D,Y                           
  0b8f  FC70AE         LDD 0x70ae                        
  0b92  AD9FFC82       JSR [0xfc82]                      
  0b96  3526           PULS  A B Y                       
  0b98  39             RTS                               

; ---- function FUN_M6C_small_04000__0b99
FUN_M6C_small_04000__0b99:
  0b99  3406           PSHS  B A                         
  0b9b  FC70B2         LDD 0x70b2                        
  0b9e  FD6074         STD 0x6074                        
  0ba1  17F96F         LBSR 0x0513                       
  0ba4  C613           LDB #0x13                         
  0ba6  AD9FFC36       JSR [0xfc36]                      
  0baa  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " feedback:     %     "
  0bae  0A6665656462.. char[22] "\nfeedback:     %     " 
LAB_M6C_small_04000__0bc4:
  0bc4  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$0C10 ->$0BE6 $0001 $0001 $0000
  0bc8  01             db 1h                             
  0bc9  01             db 1h                             
  0bca  02             db 2h                             
  0bcb  01             db 1h                             
  0bcc  01             db 1h                             
  0bcd  00             db 0h                             
  0bce  04             db 4h                             
  0bcf  80             db 80h                            
  0bd0  0063           dw 63h                            
  0bd2  FF9C           dw FF9Ch                          
  0bd4  0000           dw 0h                             
  0bd6  0C10           addr M6C_small_04000::0c10        
  0bd8  0BE6           addr M6C_small_04000::0be6        
  0bda  0001           dw 1h                             
  0bdc  0001           dw 1h                             
  0bde  0000           dw 0h                             
LAB_M6C_small_04000__0be0:
  0be0  17002D         LBSR 0x0c10                       
  0be3  3506           PULS  A B                         
  0be5  39             RTS                               

; ---- function FUN_M6C_small_04000__0be6
FUN_M6C_small_04000__0be6:
  0be6  3426           PSHS  Y B A                       
  0be8  FC6074         LDD 0x6074                        
  0beb  B370B0         SUBD 0x70b0                       
  0bee  FD70AE         STD 0x70ae                        
  0bf1  CC0049         LDD #0x49                         
  0bf4  830008         SUBD #0x8                         
  0bf7  1F02           TFR D,Y                           
  0bf9  FC70AE         LDD 0x70ae                        
  0bfc  AD9FFC82       JSR [0xfc82]                      
  0c00  8D23           BSR 0x0c25                        
  0c02  108E0031       LDY #0x31                         
  0c06  FC70AE         LDD 0x70ae                        
  0c09  AD9FFE40       JSR [0xfe40]                      
  0c0d  3526           PULS  A B Y                       
  0c0f  39             RTS                               

; ---- function FUN_M6C_small_04000__0c10
FUN_M6C_small_04000__0c10:
  0c10  3456           PSHS  U X B A                     
  0c12  C61D           LDB #0x1d                         
  0c14  AD9FFC36       JSR [0xfc36]                      
  0c18  CC0004         LDD #0x4                          
  0c1b  8E609F         LDX #0x609f                       
  0c1e  AD9FFC3A       JSR [0xfc3a]                      
  0c22  3556           PULS  A B X U                     
  0c24  39             RTS                               

; ---- function FUN_M6C_small_04000__0c25
FUN_M6C_small_04000__0c25:
  0c25  3476           PSHS  U Y X B A                   
  0c27  CCFF9C         LDD #0xff9c                       
  0c2a  3606           PSHU  B A                         
  0c2c  CC0064         LDD #0x64                         
  0c2f  3606           PSHU  B A                         
  0c31  FC70AE         LDD 0x70ae                        
  0c34  F370B0         ADDD 0x70b0                       
  0c37  3606           PSHU  B A                         
  0c39  AD9FFCD8       JSR [0xfcd8]                      
  0c3d  3706           PULU  A B                         
  0c3f  FD70B2         STD 0x70b2                        
  0c42  FC70B2         LDD 0x70b2                        
  0c45  3606           PSHU  B A                         
  0c47  CC0147         LDD #0x147                        
  0c4a  3606           PSHU  B A                         
  0c4c  AD9FFCEC       JSR [0xfcec]                      
  0c50  3706           PULU  A B                         
  0c52  FD701C         STD 0x701c                        
  0c55  FC70B2         LDD 0x70b2                        
  0c58  3606           PSHU  B A                         
  0c5a  CC55C1         LDD #0x55c1                       
  0c5d  3606           PSHU  B A                         
  0c5f  AD9FFCF2       JSR [0xfcf2]                      
  0c63  3706           PULU  A B                         
  0c65  F3701C         ADDD 0x701c                       
  0c68  FD701C         STD 0x701c                        
  0c6b  CC000A         LDD #0xa                          
  0c6e  AD9FFD20       JSR [0xfd20]                      
  0c72  108E0242       LDY #0x242                        
  0c76  FC701C         LDD 0x701c                        
  0c79  AD9FFD2E       JSR [0xfd2e]                      
  0c7d  3576           PULS  A B X Y U                   
  0c7f  39             RTS                               

; ---- function FUN_M6C_small_04000__0c80
FUN_M6C_small_04000__0c80:
  0c80  3426           PSHS  Y B A                       
  0c82  AD9FFC8E       JSR [0xfc8e]                      
  0c86  FC60F9         LDD 0x60f9                        
  0c89  FD70B6         STD 0x70b6                        
  0c8c  FD6074         STD 0x6074                        
  0c8f  17009B         LBSR 0x0d2d                       
  0c92  CC00A6         LDD #0xa6                         
  0c95  830008         SUBD #0x8                         
  0c98  1F02           TFR D,Y                           
  0c9a  FC70B6         LDD 0x70b6                        
  0c9d  AD9FFC82       JSR [0xfc82]                      
  0ca1  3526           PULS  A B Y                       
  0ca3  39             RTS                               

; ---- function FUN_M6C_small_04000__0ca4
FUN_M6C_small_04000__0ca4:
  0ca4  3406           PSHS  B A                         
  0ca6  FC70B6         LDD 0x70b6                        
  0ca9  FD6074         STD 0x6074                        
  0cac  17F864         LBSR 0x0513                       
  0caf  C613           LDB #0x13                         
  0cb1  AD9FFC36       JSR [0xfc36]                      
  0cb5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " feedback from tap:  "
  0cb9  0A6665656462.. char[22] "\nfeedback from tap:  " 
LAB_M6C_small_04000__0ccf:
  0ccf  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $000C $0001 $0000 ->$0D18 ->$0CF1 $0001 $0001 $0000
  0cd3  01             db 1h                             
  0cd4  01             db 1h                             
  0cd5  02             db 2h                             
  0cd6  01             db 1h                             
  0cd7  01             db 1h                             
  0cd8  00             db 0h                             
  0cd9  02             db 2h                             
  0cda  80             db 80h                            
  0cdb  000C           dw Ch                             
  0cdd  0001           dw 1h                             
  0cdf  0000           dw 0h                             
  0ce1  0D18           addr M6C_small_04000::0d18        
  0ce3  0CF1           addr M6C_small_04000::0cf1        
  0ce5  0001           dw 1h                             
  0ce7  0001           dw 1h                             
  0ce9  0000           dw 0h                             
LAB_M6C_small_04000__0ceb:
  0ceb  17002A         LBSR 0x0d18                       
  0cee  3506           PULS  A B                         
  0cf0  39             RTS                               

; ---- function FUN_M6C_small_04000__0cf1
FUN_M6C_small_04000__0cf1:
  0cf1  3426           PSHS  Y B A                       
  0cf3  FC6074         LDD 0x6074                        
  0cf6  FD70B6         STD 0x70b6                        
  0cf9  CC00A6         LDD #0xa6                         
  0cfc  830008         SUBD #0x8                         
  0cff  1F02           TFR D,Y                           
  0d01  FC70B6         LDD 0x70b6                        
  0d04  AD9FFC82       JSR [0xfc82]                      
  0d08  8D23           BSR 0x0d2d                        
  0d0a  108E0032       LDY #0x32                         
  0d0e  FC70B6         LDD 0x70b6                        
  0d11  AD9FFE40       JSR [0xfe40]                      
  0d15  3526           PULS  A B Y                       
  0d17  39             RTS                               

; ---- function FUN_M6C_small_04000__0d18
FUN_M6C_small_04000__0d18:
  0d18  3456           PSHS  U X B A                     
  0d1a  C626           LDB #0x26                         
  0d1c  AD9FFC36       JSR [0xfc36]                      
  0d20  CC0002         LDD #0x2                          
  0d23  8E60A1         LDX #0x60a1                       
  0d26  AD9FFC3A       JSR [0xfc3a]                      
  0d2a  3556           PULS  A B X U                     
  0d2c  39             RTS                               

; ---- function FUN_M6C_small_04000__0d2d
FUN_M6C_small_04000__0d2d:
  0d2d  3476           PSHS  U Y X B A                   
  0d2f  FC70B6         LDD 0x70b6                        
  0d32  C30009         ADDD #0x9                         
  0d35  FD701C         STD 0x701c                        
  0d38  CC000A         LDD #0xa                          
  0d3b  AD9FFD20       JSR [0xfd20]                      
  0d3f  108E0140       LDY #0x140                        
  0d43  FC701C         LDD 0x701c                        
  0d46  AD9FFD2E       JSR [0xfd2e]                      
  0d4a  3576           PULS  A B X Y U                   
  0d4c  39             RTS                               

; ---- function FUN_M6C_small_04000__0d4d
FUN_M6C_small_04000__0d4d:
  0d4d  3426           PSHS  Y B A                       
  0d4f  AD9FFC8E       JSR [0xfc8e]                      
  0d53  FC60F9         LDD 0x60f9                        
  0d56  FD704C         STD 0x704c                        
  0d59  FD6074         STD 0x6074                        
  0d5c  1700BA         LBSR 0x0e19                       
  0d5f  CC0061         LDD #0x61                         
  0d62  830008         SUBD #0x8                         
  0d65  1F02           TFR D,Y                           
  0d67  FC704C         LDD 0x704c                        
  0d6a  AD9FFC80       JSR [0xfc80]                      
  0d6e  3526           PULS  A B Y                       
  0d70  39             RTS                               

; ---- function FUN_M6C_small_04000__0d71
FUN_M6C_small_04000__0d71:
  0d71  3406           PSHS  B A                         
  0d73  FC704C         LDD 0x704c                        
  0d76  FD6074         STD 0x6074                        
  0d79  17F797         LBSR 0x0513                       
  0d7c  C613           LDB #0x13                         
  0d7e  AD9FFC36       JSR [0xfc36]                      
  0d82  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " input mode:         "
  0d86  0A696E707574.. char[22] "\ninput mode:         " 
LAB_M6C_small_04000__0d9c:
  0d9c  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$0DE5 ->$0DBE $0001 $0001 $0000
  0da0  01             db 1h                             
  0da1  01             db 1h                             
  0da2  02             db 2h                             
  0da3  01             db 1h                             
  0da4  01             db 1h                             
  0da5  00             db 0h                             
  0da6  02             db 2h                             
  0da7  80             db 80h                            
  0da8  0000           dw 0h                             
  0daa  FFFF           dw FFFFh                          
  0dac  0000           dw 0h                             
  0dae  0DE5           addr M6C_small_04000::0de5        
  0db0  0DBE           addr M6C_small_04000::0dbe        
  0db2  0001           dw 1h                             
  0db4  0001           dw 1h                             
  0db6  0000           dw 0h                             
LAB_M6C_small_04000__0db8:
  0db8  17002A         LBSR 0x0de5                       
  0dbb  3506           PULS  A B                         
  0dbd  39             RTS                               

; ---- function FUN_M6C_small_04000__0dbe
FUN_M6C_small_04000__0dbe:
  0dbe  3426           PSHS  Y B A                       
  0dc0  FC6074         LDD 0x6074                        
  0dc3  FD704C         STD 0x704c                        
  0dc6  CC0061         LDD #0x61                         
  0dc9  830008         SUBD #0x8                         
  0dcc  1F02           TFR D,Y                           
  0dce  FC704C         LDD 0x704c                        
  0dd1  AD9FFC80       JSR [0xfc80]                      
  0dd5  8D42           BSR 0x0e19                        
  0dd7  108E0005       LDY #0x5                          
  0ddb  FC704C         LDD 0x704c                        
  0dde  AD9FFE40       JSR [0xfe40]                      
  0de2  3526           PULS  A B Y                       
  0de4  39             RTS                               

; ---- function FUN_M6C_small_04000__0de5
FUN_M6C_small_04000__0de5:
  0de5  3456           PSHS  U X B A                     
  0de7  FC704C         LDD 0x704c                        
  0dea  10830000       CMPD #0x0                         
  0dee  10270013       LBEQ 0x0e05                       
  0df2  C620           LDB #0x20                         
  0df4  AD9FFC36       JSR [0xfc36]                      
  0df8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "mono  "
  0dfc  6D6F6E6F2020.. char[7] "mono  "                  
LAB_M6C_small_04000__0e03:
  0e03  2011           BRA 0x0e16                        
LAB_M6C_small_04000__0e05:
  0e05  C620           LDB #0x20                         
  0e07  AD9FFC36       JSR [0xfc36]                      
  0e0b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stereo"
  0e0f  73746572656F.. char[7] "stereo"                  
LAB_M6C_small_04000__0e16:
  0e16  3556           PULS  A B X U                     
  0e18  39             RTS                               

; ---- function FUN_M6C_small_04000__0e19
FUN_M6C_small_04000__0e19:
  0e19  3476           PSHS  U Y X B A                   
  0e1b  FC704C         LDD 0x704c                        
  0e1e  10830000       CMPD #0x0                         
  0e22  10270026       LBEQ 0x0e4c                       
  0e26  CC000A         LDD #0xa                          
  0e29  AD9FFD20       JSR [0xfd20]                      
  0e2d  108E0240       LDY #0x240                        
  0e31  CC7FFF         LDD #0x7fff                       
  0e34  AD9FFD2E       JSR [0xfd2e]                      
  0e38  CC000A         LDD #0xa                          
  0e3b  AD9FFD20       JSR [0xfd20]                      
  0e3f  108E0241       LDY #0x241                        
  0e43  CC0000         LDD #0x0                          
  0e46  AD9FFD2E       JSR [0xfd2e]                      
  0e4a  2024           BRA 0x0e70                        
LAB_M6C_small_04000__0e4c:
  0e4c  CC000A         LDD #0xa                          
  0e4f  AD9FFD20       JSR [0xfd20]                      
  0e53  108E0240       LDY #0x240                        
  0e57  CC4000         LDD #0x4000                       
  0e5a  AD9FFD2E       JSR [0xfd2e]                      
  0e5e  CC000A         LDD #0xa                          
  0e61  AD9FFD20       JSR [0xfd20]                      
  0e65  108E0241       LDY #0x241                        
  0e69  CC4000         LDD #0x4000                       
  0e6c  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6C_small_04000__0e70:
  0e70  3576           PULS  A B X Y U                   
  0e72  39             RTS                               
PTR_FUN_M6C_small_04000__0f46_M6C_small_04000__0e73:
  0e73  0F46           addr M6C_small_04000::0f46        
  0e75  0FA1           addr M6C_small_04000::0fa1        
  0e77  7056           addr 7056                         
  0e79  .db 00 57 F8 00 08 00 00 05                          ; .W......

; ---- function FUN_M6C_small_04000__0e81
FUN_M6C_small_04000__0e81:
  0e81  3410           PSHS  X                           
  0e83  8E0E73         LDX #0xe73                         ; desc[API_FE1C]: ->$0F46 ->$0FA1 $7056
  0e86  AD9FFE1C       JSR [0xfe1c]                      
  0e8a  3510           PULS  X                           
  0e8c  39             RTS                               

; ---- function FUN_M6C_small_04000__0e8d
FUN_M6C_small_04000__0e8d:
  0e8d  3410           PSHS  X                           
  0e8f  8E0E73         LDX #0xe73                         ; desc[API_FE1A]: ->$0F46 ->$0FA1 $7056
  0e92  AD9FFE1A       JSR [0xfe1a]                      
  0e96  3510           PULS  X                           
  0e98  39             RTS                               

; ---- function FUN_M6C_small_04000__0e99
FUN_M6C_small_04000__0e99:
  0e99  3426           PSHS  Y B A                       
  0e9b  AD9FFC8E       JSR [0xfc8e]                      
  0e9f  FC60F9         LDD 0x60f9                        
  0ea2  FD6074         STD 0x6074                        
  0ea5  B37058         SUBD 0x7058                       
  0ea8  FD7056         STD 0x7056                        
  0eab  1700F3         LBSR 0x0fa1                       
  0eae  CC0051         LDD #0x51                         
  0eb1  830008         SUBD #0x8                         
  0eb4  1F02           TFR D,Y                           
  0eb6  FC7056         LDD 0x7056                        
  0eb9  AD9FFC82       JSR [0xfc82]                      
  0ebd  3526           PULS  A B Y                       
  0ebf  39             RTS                               

; ---- function FUN_M6C_small_04000__0ec0
FUN_M6C_small_04000__0ec0:
  0ec0  3406           PSHS  B A                         
  0ec2  FC705A         LDD 0x705a                        
  0ec5  FD6074         STD 0x6074                        
  0ec8  17F648         LBSR 0x0513                       
  0ecb  C604           LDB #0x4                          
  0ecd  AD9FFC36       JSR [0xfc36]                      
  0ed1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " image width:-                     -"
  0ed5  0A696D616765.. char[37] "\nimage width:-                     -"
LAB_M6C_small_04000__0efa:
  0efa  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$0F46 ->$0F1C $0001 $0001 $0000
  0efe  01             db 1h                             
  0eff  01             db 1h                             
  0f00  02             db 2h                             
  0f01  01             db 1h                             
  0f02  01             db 1h                             
  0f03  00             db 0h                             
  0f04  04             db 4h                             
  0f05  80             db 80h                            
  0f06  0064           dw 64h                            
  0f08  FF9C           dw FF9Ch                          
  0f0a  0000           dw 0h                             
  0f0c  0F46           addr M6C_small_04000::0f46        
  0f0e  0F1C           addr M6C_small_04000::0f1c        
  0f10  0001           dw 1h                             
  0f12  0001           dw 1h                             
  0f14  0000           dw 0h                             
LAB_M6C_small_04000__0f16:
  0f16  17002D         LBSR 0x0f46                       
  0f19  3506           PULS  A B                         
  0f1b  39             RTS                               

; ---- function FUN_M6C_small_04000__0f1c
FUN_M6C_small_04000__0f1c:
  0f1c  3426           PSHS  Y B A                       
  0f1e  FC6074         LDD 0x6074                        
  0f21  B37058         SUBD 0x7058                       
  0f24  FD7056         STD 0x7056                        
  0f27  CC0051         LDD #0x51                         
  0f2a  830008         SUBD #0x8                         
  0f2d  1F02           TFR D,Y                           
  0f2f  FC7056         LDD 0x7056                        
  0f32  AD9FFC82       JSR [0xfc82]                      
  0f36  8D69           BSR 0x0fa1                        
  0f38  108E0004       LDY #0x4                          
  0f3c  FC7056         LDD 0x7056                        
  0f3f  AD9FFE40       JSR [0xfe40]                      
  0f43  3526           PULS  A B Y                       
  0f45  39             RTS                               

; ---- function FUN_M6C_small_04000__0f46
FUN_M6C_small_04000__0f46:
  0f46  3456           PSHS  U X B A                     
  0f48  C612           LDB #0x12                         
  0f4a  AD9FFC36       JSR [0xfc36]                      
  0f4e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                     "
  0f52  202020202020.. char[22] "                     "  
LAB_M6C_small_04000__0f68:
  0f68  FC705A         LDD 0x705a                        
  0f6b  C30064         ADDD #0x64                        
  0f6e  3606           PSHU  B A                         
  0f70  CC000A         LDD #0xa                          
  0f73  3606           PSHU  B A                         
  0f75  AD9FFCEA       JSR [0xfcea]                      
  0f79  3706           PULU  A B                         
  0f7b  FD701C         STD 0x701c                        
  0f7e  C30012         ADDD #0x12                        
  0f81  AD9FFC36       JSR [0xfc36]                      
  0f85  C652           LDB #0x52                         
  0f87  AD9FFC2A       JSR [0xfc2a]                      
  0f8b  CC0014         LDD #0x14                         
  0f8e  B3701C         SUBD 0x701c                       
  0f91  C30012         ADDD #0x12                        
  0f94  AD9FFC36       JSR [0xfc36]                      
  0f98  C64C           LDB #0x4c                         
  0f9a  AD9FFC2A       JSR [0xfc2a]                      
  0f9e  3556           PULS  A B X U                     
  0fa0  39             RTS                               

; ---- function FUN_M6C_small_04000__0fa1
FUN_M6C_small_04000__0fa1:
  0fa1  3476           PSHS  U Y X B A                   
  0fa3  CCFF9C         LDD #0xff9c                       
  0fa6  3606           PSHU  B A                         
  0fa8  CC0064         LDD #0x64                         
  0fab  3606           PSHU  B A                         
  0fad  FC7056         LDD 0x7056                        
  0fb0  F37058         ADDD 0x7058                       
  0fb3  3606           PSHU  B A                         
  0fb5  AD9FFCD8       JSR [0xfcd8]                      
  0fb9  3706           PULU  A B                         
  0fbb  FD705A         STD 0x705a                        
  0fbe  FC705A         LDD 0x705a                        
  0fc1  3606           PSHU  B A                         
  0fc3  CC0147         LDD #0x147                        
  0fc6  3606           PSHU  B A                         
  0fc8  AD9FFCEC       JSR [0xfcec]                      
  0fcc  3706           PULU  A B                         
  0fce  FD701C         STD 0x701c                        
  0fd1  FC705A         LDD 0x705a                        
  0fd4  3606           PSHU  B A                         
  0fd6  CC55C1         LDD #0x55c1                       
  0fd9  3606           PSHU  B A                         
  0fdb  AD9FFCF2       JSR [0xfcf2]                      
  0fdf  3706           PULU  A B                         
  0fe1  F3701C         ADDD 0x701c                       
  0fe4  FD70C0         STD 0x70c0                        
  0fe7  171725         LBSR 0x270f                       
  0fea  3576           PULS  A B X Y U                   
  0fec  39             RTS                               

; ---- function FUN_M6C_small_04000__0fed
FUN_M6C_small_04000__0fed:
  0fed  3406           PSHS  B A                         
  0fef  FC60F9         LDD 0x60f9                        
  0ff2  FD6074         STD 0x6074                        
  0ff5  FD7046         STD 0x7046                        
  0ff8  8D08           BSR 0x1002                        
  0ffa  8D4F           BSR 0x104b                        
  0ffc  1701DE         LBSR 0x11dd                       
  0fff  3506           PULS  A B                         
  1001  39             RTS                               

; ---- function FUN_M6C_small_04000__1002
FUN_M6C_small_04000__1002:
  1002  3406           PSHS  B A                         
  1004  FC7046         LDD 0x7046                        
  1007  FD6074         STD 0x6074                        
  100a  17F506         LBSR 0x0513                       
  100d  C613           LDB #0x13                         
  100f  AD9FFC36       JSR [0xfc36]                      
  1013  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$104B ->$103E $0001 $0001 $0000
  1017  01             db 1h                             
  1018  01             db 1h                             
  1019  02             db 2h                             
  101a  01             db 1h                             
  101b  01             db 1h                             
  101c  00             db 0h                             
  101d  01             db 1h                             
  101e  80             db 80h                            
  101f  0006           dw 6h                             
  1021  0001           dw 1h                             
  1023  0000           dw 0h                             
  1025  104B           addr M6C_small_04000::104b        
  1027  103E           addr M6C_small_04000::103e        
  1029  0001           dw 1h                             
  102b  0001           dw 1h                             
  102d  0000           dw 0h                             
LAB_M6C_small_04000__102f:
  102f  170019         LBSR 0x104b                       
  1032  CC11DD         LDD #0x11dd                       
  1035  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1039  6038           addr 6038                         
LAB_M6C_small_04000__103b:
  103b  3506           PULS  A B                         
  103d  39             RTS                               

; ---- function FUN_M6C_small_04000__103e
FUN_M6C_small_04000__103e:
  103e  3426           PSHS  Y B A                       
  1040  FC6074         LDD 0x6074                        
  1043  FD7046         STD 0x7046                        
  1046  8D03           BSR 0x104b                        
  1048  3526           PULS  A B Y                       
  104a  39             RTS                               

; ---- function FUN_M6C_small_04000__104b
FUN_M6C_small_04000__104b:
  104b  3416           PSHS  X B A                       
  104d  FC7046         LDD 0x7046                        
  1050  10830000       CMPD #0x0                         
  1054  10270064       LBEQ 0x10bc                       
  1058  C600           LDB #0x0                          
  105a  AD9FFC36       JSR [0xfc36]                      
  105e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "hit enter for:         "
  1062  68697420656E.. char[24] "hit enter for:         "
LAB_M6C_small_04000__107a:
  107a  FC7046         LDD 0x7046                        
  107d  10830001       CMPD #0x1                         
  1081  1027006D       LBEQ 0x10f2                       
  1085  FC7046         LDD 0x7046                        
  1088  10830002       CMPD #0x2                         
  108c  10270089       LBEQ 0x1119                       
  1090  FC7046         LDD 0x7046                        
  1093  10830003       CMPD #0x3                         
  1097  102700A5       LBEQ 0x1140                       
  109b  FC7046         LDD 0x7046                        
  109e  10830004       CMPD #0x4                         
  10a2  102700C1       LBEQ 0x1167                       
  10a6  FC7046         LDD 0x7046                        
  10a9  10830005       CMPD #0x5                         
  10ad  102700DD       LBEQ 0x118e                       
  10b1  FC7046         LDD 0x7046                        
  10b4  10830006       CMPD #0x6                         
  10b8  102700F9       LBEQ 0x11b5                       
LAB_M6C_small_04000__10bc:
  10bc  C600           LDB #0x0                          
  10be  AD9FFC36       JSR [0xfc36]                      
  10c2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "spacing control - use knob for options  "
  10c6  73706163696E.. char[41] "spacing control - use knob for options  "
LAB_M6C_small_04000__10ef:
  10ef  1600E7         LBRA 0x11d9                       
LAB_M6C_small_04000__10f2:
  10f2  C60F           LDB #0xf                          
  10f4  AD9FFC36       JSR [0xfc36]                      
  10f8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "constant spacing         "
  10fc  636F6E737461.. char[26] "constant spacing         "
LAB_M6C_small_04000__1116:
  1116  1600C0         LBRA 0x11d9                       
LAB_M6C_small_04000__1119:
  1119  C60F           LDB #0xf                          
  111b  AD9FFC36       JSR [0xfc36]                      
  111f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear increasing spacing"
  1123  6C696E656172.. char[26] "linear increasing spacing"
LAB_M6C_small_04000__113d:
  113d  160099         LBRA 0x11d9                       
LAB_M6C_small_04000__1140:
  1140  C60F           LDB #0xf                          
  1142  AD9FFC36       JSR [0xfc36]                      
  1146  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear decreasing spacing"
  114a  6C696E656172.. char[26] "linear decreasing spacing"
LAB_M6C_small_04000__1164:
  1164  160072         LBRA 0x11d9                       
LAB_M6C_small_04000__1167:
  1167  C60F           LDB #0xf                          
  1169  AD9FFC36       JSR [0xfc36]                      
  116d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al increasing spacing"
  1171  65787027616C.. char[26] "exp'al increasing spacing"
LAB_M6C_small_04000__118b:
  118b  16004B         LBRA 0x11d9                       
LAB_M6C_small_04000__118e:
  118e  C60F           LDB #0xf                          
  1190  AD9FFC36       JSR [0xfc36]                      
  1194  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al decreasing spacing"
  1198  65787027616C.. char[26] "exp'al decreasing spacing"
LAB_M6C_small_04000__11b2:
  11b2  160024         LBRA 0x11d9                       
LAB_M6C_small_04000__11b5:
  11b5  C60F           LDB #0xf                          
  11b7  AD9FFC36       JSR [0xfc36]                      
  11bb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "random spacing           "
  11bf  72616E646F6D.. char[26] "random spacing           "
LAB_M6C_small_04000__11d9:
  11d9  3516           PULS  A B X                       
  11db  39             RTS                               
  11dc  .db 39                                               ; 9

; ---- function FUN_M6C_small_04000__11dd
FUN_M6C_small_04000__11dd:
  11dd  3476           PSHS  U Y X B A                   
  11df  108E0006       LDY #0x6                          
  11e3  FC7046         LDD 0x7046                        
  11e6  AD9FFE40       JSR [0xfe40]                      
  11ea  FC7046         LDD 0x7046                        
  11ed  10830000       CMPD #0x0                         
  11f1  10270042       LBEQ 0x1237                       
  11f5  FC7046         LDD 0x7046                        
  11f8  10830001       CMPD #0x1                         
  11fc  1027003A       LBEQ 0x123a                       
  1200  FC7046         LDD 0x7046                        
  1203  10830002       CMPD #0x2                         
  1207  1027004A       LBEQ 0x1255                       
  120b  FC7046         LDD 0x7046                        
  120e  10830003       CMPD #0x3                         
  1212  10270063       LBEQ 0x1279                       
  1216  FC7046         LDD 0x7046                        
  1219  10830004       CMPD #0x4                         
  121d  1027007E       LBEQ 0x129f                       
  1221  FC7046         LDD 0x7046                        
  1224  10830005       CMPD #0x5                         
  1228  102700C8       LBEQ 0x12f4                       
  122c  FC7046         LDD 0x7046                        
  122f  10830006       CMPD #0x6                         
  1233  10270112       LBEQ 0x1349                       
LAB_M6C_small_04000__1237:
  1237  160138         LBRA 0x1372                       
LAB_M6C_small_04000__123a:
  123a  171574         LBSR 0x27b1                       
  123d  CC000C         LDD #0xc                          
  1240  3606           PSHU  B A                         
  1242  AD9FFCEA       JSR [0xfcea]                      
  1246  3706           PULU  A B                         
  1248  8E7076         LDX #0x7076                       
LAB_M6C_small_04000__124b:
  124b  ED81           STD ,X++                          
  124d  8C708C         CMPX #0x708c                      
  1250  2FF9           BLE 0x124b                        
  1252  16011D         LBRA 0x1372                       
LAB_M6C_small_04000__1255:
  1255  171559         LBSR 0x27b1                       
  1258  CC004E         LDD #0x4e                         
  125b  3606           PSHU  B A                         
  125d  AD9FFCEA       JSR [0xfcea]                      
  1261  3706           PULU  A B                         
  1263  FD701C         STD 0x701c                        
  1266  8E7076         LDX #0x7076                       
  1269  CC0000         LDD #0x0                          
LAB_M6C_small_04000__126c:
  126c  F3701C         ADDD 0x701c                       
  126f  ED81           STD ,X++                          
  1271  8C708C         CMPX #0x708c                      
  1274  2FF6           BLE 0x126c                        
  1276  1600F9         LBRA 0x1372                       
LAB_M6C_small_04000__1279:
  1279  171535         LBSR 0x27b1                       
  127c  CC004E         LDD #0x4e                         
  127f  3606           PSHU  B A                         
  1281  AD9FFCEA       JSR [0xfcea]                      
  1285  3706           PULU  A B                         
  1287  FD701C         STD 0x701c                        
  128a  8E708C         LDX #0x708c                       
  128d  3002           LEAX 0x2,X                        
  128f  CC0000         LDD #0x0                          
LAB_M6C_small_04000__1292:
  1292  F3701C         ADDD 0x701c                       
  1295  ED83           STD ,--X                          
  1297  8C7076         CMPX #0x7076                      
  129a  2EF6           BGT 0x1292                        
  129c  1600D3         LBRA 0x1372                       
LAB_M6C_small_04000__129f:
  129f  17150F         LBSR 0x27b1                       
  12a2  3706           PULU  A B                         
  12a4  108332C8       CMPD #0x32c8                      
  12a8  2E12           BGT 0x12bc                        
  12aa  10832008       CMPD #0x2008                      
  12ae  2E14           BGT 0x12c4                        
  12b0  10831004       CMPD #0x1004                      
  12b4  2E16           BGT 0x12cc                        
  12b6  17155C         LBSR 0x2815                       
  12b9  1600EF         LBRA 0x13ab                       
LAB_M6C_small_04000__12bc:
  12bc  CC0003         LDD #0x3                          
  12bf  FD701C         STD 0x701c                        
  12c2  200E           BRA 0x12d2                        
LAB_M6C_small_04000__12c4:
  12c4  CC0002         LDD #0x2                          
  12c7  FD701C         STD 0x701c                        
  12ca  2006           BRA 0x12d2                        
LAB_M6C_small_04000__12cc:
  12cc  CC0001         LDD #0x1                          
  12cf  FD701C         STD 0x701c                        
LAB_M6C_small_04000__12d2:
  12d2  8E7076         LDX #0x7076                       
  12d5  ED81           STD ,X++                          
LAB_M6C_small_04000__12d7:
  12d7  FC701C         LDD 0x701c                        
  12da  3606           PSHU  B A                         
  12dc  CC0002         LDD #0x2                          
  12df  3606           PSHU  B A                         
  12e1  AD9FFCEE       JSR [0xfcee]                      
  12e5  3706           PULU  A B                         
  12e7  FD701C         STD 0x701c                        
  12ea  ED81           STD ,X++                          
  12ec  8C708C         CMPX #0x708c                      
  12ef  2FE6           BLE 0x12d7                        
  12f1  16007E         LBRA 0x1372                       
LAB_M6C_small_04000__12f4:
  12f4  1714BA         LBSR 0x27b1                       
  12f7  3706           PULU  A B                         
  12f9  108332C8       CMPD #0x32c8                      
  12fd  2E12           BGT 0x1311                        
  12ff  10832008       CMPD #0x2008                      
  1303  2E14           BGT 0x1319                        
  1305  10831004       CMPD #0x1004                      
  1309  2E16           BGT 0x1321                        
  130b  171507         LBSR 0x2815                       
  130e  16009A         LBRA 0x13ab                       
LAB_M6C_small_04000__1311:
  1311  CC0003         LDD #0x3                          
  1314  FD701C         STD 0x701c                        
  1317  200E           BRA 0x1327                        
LAB_M6C_small_04000__1319:
  1319  CC0002         LDD #0x2                          
  131c  FD701C         STD 0x701c                        
  131f  2006           BRA 0x1327                        
LAB_M6C_small_04000__1321:
  1321  CC0001         LDD #0x1                          
  1324  FD701C         STD 0x701c                        
LAB_M6C_small_04000__1327:
  1327  8E708C         LDX #0x708c                       
  132a  ED84           STD ,X                            
LAB_M6C_small_04000__132c:
  132c  FC701C         LDD 0x701c                        
  132f  3606           PSHU  B A                         
  1331  CC0002         LDD #0x2                          
  1334  3606           PSHU  B A                         
  1336  AD9FFCEE       JSR [0xfcee]                      
  133a  3706           PULU  A B                         
  133c  FD701C         STD 0x701c                        
  133f  ED83           STD ,--X                          
  1341  8C7076         CMPX #0x7076                      
  1344  2EE6           BGT 0x132c                        
  1346  160029         LBRA 0x1372                       
LAB_M6C_small_04000__1349:
  1349  171465         LBSR 0x27b1                       
  134c  CC000C         LDD #0xc                          
  134f  3606           PSHU  B A                         
  1351  AD9FFCEA       JSR [0xfcea]                      
  1355  3706           PULU  A B                         
  1357  FD701C         STD 0x701c                        
  135a  8E7076         LDX #0x7076                       
LAB_M6C_small_04000__135d:
  135d  FC701C         LDD 0x701c                        
  1360  3606           PSHU  B A                         
  1362  AD9FFCF8       JSR [0xfcf8]                      
  1366  3706           PULU  A B                         
  1368  ED81           STD ,X++                          
  136a  8C708C         CMPX #0x708c                      
  136d  2FEE           BLE 0x135d                        
  136f  160000         LBRA 0x1372                       
LAB_M6C_small_04000__1372:
  1372  171352         LBSR 0x26c7                       
  1375  1712F8         LBSR 0x2670                       
  1378  C600           LDB #0x0                          
  137a  AD9FFC36       JSR [0xfc36]                      
  137e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "spacing was set - use knob for options  "
  1382  73706163696E.. char[41] "spacing was set - use knob for options  "
LAB_M6C_small_04000__13ab:
  13ab  3576           PULS  A B X Y U                   
  13ad  39             RTS                               

; ---- function FUN_M6C_small_04000__13ae
FUN_M6C_small_04000__13ae:
  13ae  3406           PSHS  B A                         
  13b0  FC60F9         LDD 0x60f9                        
  13b3  FD6074         STD 0x6074                        
  13b6  FD7048         STD 0x7048                        
  13b9  8D08           BSR 0x13c3                        
  13bb  8D4F           BSR 0x140c                        
  13bd  1701DF         LBSR 0x159f                       
  13c0  3506           PULS  A B                         
  13c2  39             RTS                               

; ---- function FUN_M6C_small_04000__13c3
FUN_M6C_small_04000__13c3:
  13c3  3406           PSHS  B A                         
  13c5  FC7048         LDD 0x7048                        
  13c8  FD6074         STD 0x6074                        
  13cb  17F145         LBSR 0x0513                       
  13ce  C613           LDB #0x13                         
  13d0  AD9FFC36       JSR [0xfc36]                      
  13d4  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$140C ->$13FF $0001 $0001 $0000
  13d8  01             db 1h                             
  13d9  01             db 1h                             
  13da  02             db 2h                             
  13db  01             db 1h                             
  13dc  01             db 1h                             
  13dd  00             db 0h                             
  13de  01             db 1h                             
  13df  80             db 80h                            
  13e0  0006           dw 6h                             
  13e2  0001           dw 1h                             
  13e4  0000           dw 0h                             
  13e6  140C           addr M6C_small_04000::140c        
  13e8  13FF           addr M6C_small_04000::13ff        
  13ea  0001           dw 1h                             
  13ec  0001           dw 1h                             
  13ee  0000           dw 0h                             
LAB_M6C_small_04000__13f0:
  13f0  170019         LBSR 0x140c                       
  13f3  CC159F         LDD #0x159f                       
  13f6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  13fa  6038           addr 6038                         
LAB_M6C_small_04000__13fc:
  13fc  3506           PULS  A B                         
  13fe  39             RTS                               

; ---- function FUN_M6C_small_04000__13ff
FUN_M6C_small_04000__13ff:
  13ff  3426           PSHS  Y B A                       
  1401  FC6074         LDD 0x6074                        
  1404  FD7048         STD 0x7048                        
  1407  8D03           BSR 0x140c                        
  1409  3526           PULS  A B Y                       
  140b  39             RTS                               

; ---- function FUN_M6C_small_04000__140c
FUN_M6C_small_04000__140c:
  140c  3416           PSHS  X B A                       
  140e  FC7048         LDD 0x7048                        
  1411  10830000       CMPD #0x0                         
  1415  10270065       LBEQ 0x147e                       
  1419  C600           LDB #0x0                          
  141b  AD9FFC36       JSR [0xfc36]                      
  141f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "hit enter for:          "
  1423  68697420656E.. char[25] "hit enter for:          "
LAB_M6C_small_04000__143c:
  143c  FC7048         LDD 0x7048                        
  143f  10830001       CMPD #0x1                         
  1443  1027006D       LBEQ 0x14b4                       
  1447  FC7048         LDD 0x7048                        
  144a  10830002       CMPD #0x2                         
  144e  10270089       LBEQ 0x14db                       
  1452  FC7048         LDD 0x7048                        
  1455  10830003       CMPD #0x3                         
  1459  102700A5       LBEQ 0x1502                       
  145d  FC7048         LDD 0x7048                        
  1460  10830004       CMPD #0x4                         
  1464  102700C1       LBEQ 0x1529                       
  1468  FC7048         LDD 0x7048                        
  146b  10830005       CMPD #0x5                         
  146f  102700DD       LBEQ 0x1550                       
  1473  FC7048         LDD 0x7048                        
  1476  10830006       CMPD #0x6                         
  147a  102700F9       LBEQ 0x1577                       
LAB_M6C_small_04000__147e:
  147e  C600           LDB #0x0                          
  1480  AD9FFC36       JSR [0xfc36]                      
  1484  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "weighting control - use knob for options"
  1488  776569676874.. char[41] "weighting control - use knob for options"
LAB_M6C_small_04000__14b1:
  14b1  1600E7         LBRA 0x159b                       
LAB_M6C_small_04000__14b4:
  14b4  C60F           LDB #0xf                          
  14b6  AD9FFC36       JSR [0xfc36]                      
  14ba  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "constant weight          "
  14be  636F6E737461.. char[26] "constant weight          "
LAB_M6C_small_04000__14d8:
  14d8  1600C0         LBRA 0x159b                       
LAB_M6C_small_04000__14db:
  14db  C60F           LDB #0xf                          
  14dd  AD9FFC36       JSR [0xfc36]                      
  14e1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear increasing weights"
  14e5  6C696E656172.. char[26] "linear increasing weights"
LAB_M6C_small_04000__14ff:
  14ff  160099         LBRA 0x159b                       
LAB_M6C_small_04000__1502:
  1502  C60F           LDB #0xf                          
  1504  AD9FFC36       JSR [0xfc36]                      
  1508  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear decreasing weights"
  150c  6C696E656172.. char[26] "linear decreasing weights"
LAB_M6C_small_04000__1526:
  1526  160072         LBRA 0x159b                       
LAB_M6C_small_04000__1529:
  1529  C60F           LDB #0xf                          
  152b  AD9FFC36       JSR [0xfc36]                      
  152f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al increasing weights"
  1533  65787027616C.. char[26] "exp'al increasing weights"
LAB_M6C_small_04000__154d:
  154d  16004B         LBRA 0x159b                       
LAB_M6C_small_04000__1550:
  1550  C60F           LDB #0xf                          
  1552  AD9FFC36       JSR [0xfc36]                      
  1556  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al decreasing weights"
  155a  65787027616C.. char[26] "exp'al decreasing weights"
LAB_M6C_small_04000__1574:
  1574  160024         LBRA 0x159b                       
LAB_M6C_small_04000__1577:
  1577  C60F           LDB #0xf                          
  1579  AD9FFC36       JSR [0xfc36]                      
  157d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "random weights           "
  1581  72616E646F6D.. char[26] "random weights           "
LAB_M6C_small_04000__159b:
  159b  3516           PULS  A B X                       
  159d  39             RTS                               
  159e  .db 39                                               ; 9

; ---- function FUN_M6C_small_04000__159f
FUN_M6C_small_04000__159f:
  159f  3476           PSHS  U Y X B A                   
  15a1  108E0007       LDY #0x7                          
  15a5  FC7048         LDD 0x7048                        
  15a8  AD9FFE40       JSR [0xfe40]                      
  15ac  FC7048         LDD 0x7048                        
  15af  10830000       CMPD #0x0                         
  15b3  10270042       LBEQ 0x15f9                       
  15b7  FC7048         LDD 0x7048                        
  15ba  10830001       CMPD #0x1                         
  15be  1027003A       LBEQ 0x15fc                       
  15c2  FC7048         LDD 0x7048                        
  15c5  10830002       CMPD #0x2                         
  15c9  1027003F       LBEQ 0x160c                       
  15cd  FC7048         LDD 0x7048                        
  15d0  10830003       CMPD #0x3                         
  15d4  1027004D       LBEQ 0x1625                       
  15d8  FC7048         LDD 0x7048                        
  15db  10830004       CMPD #0x4                         
  15df  1027005D       LBEQ 0x1640                       
  15e3  FC7048         LDD 0x7048                        
  15e6  10830005       CMPD #0x5                         
  15ea  10270081       LBEQ 0x166f                       
  15ee  FC7048         LDD 0x7048                        
  15f1  10830006       CMPD #0x6                         
  15f5  102700A2       LBEQ 0x169b                       
LAB_M6C_small_04000__15f9:
  15f9  1600B7         LBRA 0x16b3                       
LAB_M6C_small_04000__15fc:
  15fc  8E708E         LDX #0x708e                       
  15ff  CC0190         LDD #0x190                        
LAB_M6C_small_04000__1602:
  1602  ED81           STD ,X++                          
  1604  8C70A4         CMPX #0x70a4                      
  1607  2FF9           BLE 0x1602                        
  1609  1600A7         LBRA 0x16b3                       
LAB_M6C_small_04000__160c:
  160c  8E708E         LDX #0x708e                       
  160f  CC0050         LDD #0x50                         
  1612  FD701C         STD 0x701c                        
  1615  CC0000         LDD #0x0                          
LAB_M6C_small_04000__1618:
  1618  F3701C         ADDD 0x701c                       
  161b  ED81           STD ,X++                          
  161d  8C70A4         CMPX #0x70a4                      
  1620  2FF6           BLE 0x1618                        
  1622  16008E         LBRA 0x16b3                       
LAB_M6C_small_04000__1625:
  1625  8E70A4         LDX #0x70a4                       
  1628  3002           LEAX 0x2,X                        
  162a  CC0050         LDD #0x50                         
  162d  FD701C         STD 0x701c                        
  1630  CC0000         LDD #0x0                          
LAB_M6C_small_04000__1633:
  1633  F3701C         ADDD 0x701c                       
  1636  ED83           STD ,--X                          
  1638  8C708E         CMPX #0x708e                      
  163b  2EF6           BGT 0x1633                        
  163d  160073         LBRA 0x16b3                       
LAB_M6C_small_04000__1640:
  1640  8E708E         LDX #0x708e                       
  1643  CC0001         LDD #0x1                          
  1646  FD701C         STD 0x701c                        
  1649  ED81           STD ,X++                          
LAB_M6C_small_04000__164b:
  164b  FC701C         LDD 0x701c                        
  164e  3606           PSHU  B A                         
  1650  CC0002         LDD #0x2                          
  1653  3606           PSHU  B A                         
  1655  AD9FFCEE       JSR [0xfcee]                      
  1659  3706           PULU  A B                         
  165b  FD701C         STD 0x701c                        
  165e  ED81           STD ,X++                          
  1660  8C70A0         CMPX #0x70a0                      
  1663  2FE6           BLE 0x164b                        
  1665  CC03E8         LDD #0x3e8                        
  1668  ED81           STD ,X++                          
  166a  ED81           STD ,X++                          
  166c  160044         LBRA 0x16b3                       
LAB_M6C_small_04000__166f:
  166f  8E70A4         LDX #0x70a4                       
  1672  CC0001         LDD #0x1                          
  1675  FD701C         STD 0x701c                        
  1678  ED84           STD ,X                            
LAB_M6C_small_04000__167a:
  167a  FC701C         LDD 0x701c                        
  167d  3606           PSHU  B A                         
  167f  CC0002         LDD #0x2                          
  1682  3606           PSHU  B A                         
  1684  AD9FFCEE       JSR [0xfcee]                      
  1688  3706           PULU  A B                         
  168a  FD701C         STD 0x701c                        
  168d  ED83           STD ,--X                          
  168f  8C7092         CMPX #0x7092                      
  1692  2EE6           BGT 0x167a                        
  1694  ED83           STD ,--X                          
  1696  ED83           STD ,--X                          
  1698  160018         LBRA 0x16b3                       
LAB_M6C_small_04000__169b:
  169b  8E708E         LDX #0x708e                       
LAB_M6C_small_04000__169e:
  169e  CC03E8         LDD #0x3e8                        
  16a1  3606           PSHU  B A                         
  16a3  AD9FFCF8       JSR [0xfcf8]                      
  16a7  3706           PULU  A B                         
  16a9  ED81           STD ,X++                          
  16ab  8C70A4         CMPX #0x70a4                      
  16ae  2FEE           BLE 0x169e                        
  16b0  160000         LBRA 0x16b3                       
LAB_M6C_small_04000__16b3:
  16b3  171059         LBSR 0x270f                       
  16b6  170FD4         LBSR 0x268d                       
  16b9  C600           LDB #0x0                          
  16bb  AD9FFC36       JSR [0xfc36]                      
  16bf  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "weights set - use knob for options      "
  16c3  776569676874.. char[41] "weights set - use knob for options      "
LAB_M6C_small_04000__16ec:
  16ec  3576           PULS  A B X Y U                   
  16ee  39             RTS                               

; ---- function FUN_M6C_small_04000__16ef
FUN_M6C_small_04000__16ef:
  16ef  3406           PSHS  B A                         
  16f1  FC60F9         LDD 0x60f9                        
  16f4  FD6074         STD 0x6074                        
  16f7  FD704A         STD 0x704a                        
  16fa  8D08           BSR 0x1704                        
  16fc  8D4F           BSR 0x174d                        
  16fe  170275         LBSR 0x1976                       
  1701  3506           PULS  A B                         
  1703  39             RTS                               

; ---- function FUN_M6C_small_04000__1704
FUN_M6C_small_04000__1704:
  1704  3406           PSHS  B A                         
  1706  FC704A         LDD 0x704a                        
  1709  FD6074         STD 0x6074                        
  170c  17EE04         LBSR 0x0513                       
  170f  C613           LDB #0x13                         
  1711  AD9FFC36       JSR [0xfc36]                      
  1715  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0009 $0001 $0000 ->$174D ->$1740 $0001 $0001 $0000
  1719  01             db 1h                             
  171a  01             db 1h                             
  171b  02             db 2h                             
  171c  01             db 1h                             
  171d  01             db 1h                             
  171e  00             db 0h                             
  171f  01             db 1h                             
  1720  80             db 80h                            
  1721  0009           dw 9h                             
  1723  0001           dw 1h                             
  1725  0000           dw 0h                             
  1727  174D           addr M6C_small_04000::174d        
  1729  1740           addr M6C_small_04000::1740        
  172b  0001           dw 1h                             
  172d  0001           dw 1h                             
  172f  0000           dw 0h                             
LAB_M6C_small_04000__1731:
  1731  170019         LBSR 0x174d                       
  1734  CC1976         LDD #0x1976                       
  1737  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  173b  6038           addr 6038                         
LAB_M6C_small_04000__173d:
  173d  3506           PULS  A B                         
  173f  39             RTS                               

; ---- function FUN_M6C_small_04000__1740
FUN_M6C_small_04000__1740:
  1740  3426           PSHS  Y B A                       
  1742  FC6074         LDD 0x6074                        
  1745  FD704A         STD 0x704a                        
  1748  8D03           BSR 0x174d                        
  174a  3526           PULS  A B Y                       
  174c  39             RTS                               

; ---- function FUN_M6C_small_04000__174d
FUN_M6C_small_04000__174d:
  174d  3416           PSHS  X B A                       
  174f  FC704A         LDD 0x704a                        
  1752  10830000       CMPD #0x0                         
  1756  10270086       LBEQ 0x17e0                       
  175a  C600           LDB #0x0                          
  175c  AD9FFC36       JSR [0xfc36]                      
  1760  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "hit enter for:          "
  1764  68697420656E.. char[25] "hit enter for:          "
LAB_M6C_small_04000__177d:
  177d  FC704A         LDD 0x704a                        
  1780  10830001       CMPD #0x1                         
  1784  1027008E       LBEQ 0x1816                       
  1788  FC704A         LDD 0x704a                        
  178b  10830002       CMPD #0x2                         
  178f  102700AA       LBEQ 0x183d                       
  1793  FC704A         LDD 0x704a                        
  1796  10830003       CMPD #0x3                         
  179a  102700C6       LBEQ 0x1864                       
  179e  FC704A         LDD 0x704a                        
  17a1  10830004       CMPD #0x4                         
  17a5  102700E2       LBEQ 0x188b                       
  17a9  FC704A         LDD 0x704a                        
  17ac  10830005       CMPD #0x5                         
  17b0  102700FE       LBEQ 0x18b2                       
  17b4  FC704A         LDD 0x704a                        
  17b7  10830006       CMPD #0x6                         
  17bb  1027011A       LBEQ 0x18d9                       
  17bf  FC704A         LDD 0x704a                        
  17c2  10830007       CMPD #0x7                         
  17c6  10270136       LBEQ 0x1900                       
  17ca  FC704A         LDD 0x704a                        
  17cd  10830008       CMPD #0x8                         
  17d1  10270152       LBEQ 0x1927                       
  17d5  FC704A         LDD 0x704a                        
  17d8  10830009       CMPD #0x9                         
  17dc  1027016E       LBEQ 0x194e                       
LAB_M6C_small_04000__17e0:
  17e0  C600           LDB #0x0                          
  17e2  AD9FFC36       JSR [0xfc36]                      
  17e6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panning control - use knob for options  "
  17ea  70616E6E696E.. char[41] "panning control - use knob for options  "
LAB_M6C_small_04000__1813:
  1813  16015C         LBRA 0x1972                       
LAB_M6C_small_04000__1816:
  1816  C60F           LDB #0xf                          
  1818  AD9FFC36       JSR [0xfc36]                      
  181c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panned center            "
  1820  70616E6E6564.. char[26] "panned center            "
LAB_M6C_small_04000__183a:
  183a  160135         LBRA 0x1972                       
LAB_M6C_small_04000__183d:
  183d  C60F           LDB #0xf                          
  183f  AD9FFC36       JSR [0xfc36]                      
  1843  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panned left              "
  1847  70616E6E6564.. char[26] "panned left              "
LAB_M6C_small_04000__1861:
  1861  16010E         LBRA 0x1972                       
LAB_M6C_small_04000__1864:
  1864  C60F           LDB #0xf                          
  1866  AD9FFC36       JSR [0xfc36]                      
  186a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panned right             "
  186e  70616E6E6564.. char[26] "panned right             "
LAB_M6C_small_04000__1888:
  1888  1600E7         LBRA 0x1972                       
LAB_M6C_small_04000__188b:
  188b  C60F           LDB #0xf                          
  188d  AD9FFC36       JSR [0xfc36]                      
  1891  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "alternating left & right "
  1895  616C7465726E.. char[26] "alternating left & right "
LAB_M6C_small_04000__18af:
  18af  1600C0         LBRA 0x1972                       
LAB_M6C_small_04000__18b2:
  18b2  C60F           LDB #0xf                          
  18b4  AD9FFC36       JSR [0xfc36]                      
  18b8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "left to right sweep      "
  18bc  6C6566742074.. char[26] "left to right sweep      "
LAB_M6C_small_04000__18d6:
  18d6  160099         LBRA 0x1972                       
LAB_M6C_small_04000__18d9:
  18d9  C60F           LDB #0xf                          
  18db  AD9FFC36       JSR [0xfc36]                      
  18df  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "right to left sweep      "
  18e3  726967687420.. char[26] "right to left sweep      "
LAB_M6C_small_04000__18fd:
  18fd  160072         LBRA 0x1972                       
LAB_M6C_small_04000__1900:
  1900  C60F           LDB #0xf                          
  1902  AD9FFC36       JSR [0xfc36]                      
  1906  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "spread from center       "
  190a  737072656164.. char[26] "spread from center       "
LAB_M6C_small_04000__1924:
  1924  16004B         LBRA 0x1972                       
LAB_M6C_small_04000__1927:
  1927  C60F           LDB #0xf                          
  1929  AD9FFC36       JSR [0xfc36]                      
  192d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "merge to center          "
  1931  6D6572676520.. char[26] "merge to center          "
LAB_M6C_small_04000__194b:
  194b  160024         LBRA 0x1972                       
LAB_M6C_small_04000__194e:
  194e  C60F           LDB #0xf                          
  1950  AD9FFC36       JSR [0xfc36]                      
  1954  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "random panning           "
  1958  72616E646F6D.. char[26] "random panning           "
LAB_M6C_small_04000__1972:
  1972  3516           PULS  A B X                       
  1974  39             RTS                               
  1975  .db 39                                               ; 9

; ---- function FUN_M6C_small_04000__1976
FUN_M6C_small_04000__1976:
  1976  3476           PSHS  U Y X B A                   
  1978  108E0008       LDY #0x8                          
  197c  FC704A         LDD 0x704a                        
  197f  AD9FFE40       JSR [0xfe40]                      
  1983  FC704A         LDD 0x704a                        
  1986  10830000       CMPD #0x0                         
  198a  10270063       LBEQ 0x19f1                       
  198e  FC704A         LDD 0x704a                        
  1991  10830001       CMPD #0x1                         
  1995  1027005B       LBEQ 0x19f4                       
  1999  FC704A         LDD 0x704a                        
  199c  10830002       CMPD #0x2                         
  19a0  10270055       LBEQ 0x19f9                       
  19a4  FC704A         LDD 0x704a                        
  19a7  10830003       CMPD #0x3                         
  19ab  1027004F       LBEQ 0x19fe                       
  19af  FC704A         LDD 0x704a                        
  19b2  10830004       CMPD #0x4                         
  19b6  10270056       LBEQ 0x1a10                       
  19ba  FC704A         LDD 0x704a                        
  19bd  10830005       CMPD #0x5                         
  19c1  10270068       LBEQ 0x1a2d                       
  19c5  FC704A         LDD 0x704a                        
  19c8  10830006       CMPD #0x6                         
  19cc  10270070       LBEQ 0x1a40                       
  19d0  FC704A         LDD 0x704a                        
  19d3  10830007       CMPD #0x7                         
  19d7  10270078       LBEQ 0x1a53                       
  19db  FC704A         LDD 0x704a                        
  19de  10830008       CMPD #0x8                         
  19e2  102700AC       LBEQ 0x1a92                       
  19e6  FC704A         LDD 0x704a                        
  19e9  10830009       CMPD #0x9                         
  19ed  102700E0       LBEQ 0x1ad1                       
LAB_M6C_small_04000__19f1:
  19f1  1600F8         LBRA 0x1aec                       
LAB_M6C_small_04000__19f4:
  19f4  CC0000         LDD #0x0                          
  19f7  200A           BRA 0x1a03                        
LAB_M6C_small_04000__19f9:
  19f9  CCFFF5         LDD #0xfff5                       
  19fc  2005           BRA 0x1a03                        
LAB_M6C_small_04000__19fe:
  19fe  CC000B         LDD #0xb                          
  1a01  2000           BRA 0x1a03                        
LAB_M6C_small_04000__1a03:
  1a03  8E705E         LDX #0x705e                       
LAB_M6C_small_04000__1a06:
  1a06  ED81           STD ,X++                          
  1a08  8C7074         CMPX #0x7074                      
  1a0b  2FF9           BLE 0x1a06                        
  1a0d  1600DC         LBRA 0x1aec                       
LAB_M6C_small_04000__1a10:
  1a10  8E705E         LDX #0x705e                       
  1a13  CCFFF5         LDD #0xfff5                       
LAB_M6C_small_04000__1a16:
  1a16  ED81           STD ,X++                          
  1a18  3606           PSHU  B A                         
  1a1a  CCFFFF         LDD #0xffff                       
  1a1d  3606           PSHU  B A                         
  1a1f  AD9FFCEC       JSR [0xfcec]                      
  1a23  3706           PULU  A B                         
  1a25  8C7074         CMPX #0x7074                      
  1a28  2FEC           BLE 0x1a16                        
  1a2a  1600BF         LBRA 0x1aec                       
LAB_M6C_small_04000__1a2d:
  1a2d  8E705E         LDX #0x705e                       
  1a30  CCFFF5         LDD #0xfff5                       
LAB_M6C_small_04000__1a33:
  1a33  ED81           STD ,X++                          
  1a35  C30002         ADDD #0x2                         
  1a38  8C7074         CMPX #0x7074                      
  1a3b  2FF6           BLE 0x1a33                        
  1a3d  1600AC         LBRA 0x1aec                       
LAB_M6C_small_04000__1a40:
  1a40  8E705E         LDX #0x705e                       
  1a43  CC000B         LDD #0xb                          
LAB_M6C_small_04000__1a46:
  1a46  ED81           STD ,X++                          
  1a48  830002         SUBD #0x2                         
  1a4b  8C7074         CMPX #0x7074                      
  1a4e  2FF6           BLE 0x1a46                        
  1a50  160099         LBRA 0x1aec                       
LAB_M6C_small_04000__1a53:
  1a53  8E705E         LDX #0x705e                       
  1a56  CC0001         LDD #0x1                          
  1a59  FD701E         STD 0x701e                        
  1a5c  CC0000         LDD #0x0                          
  1a5f  FD701C         STD 0x701c                        
LAB_M6C_small_04000__1a62:
  1a62  ED81           STD ,X++                          
  1a64  7C701D         INC 0x701d                        
  1a67  FC701E         LDD 0x701e                        
  1a6a  3606           PSHU  B A                         
  1a6c  CCFFFF         LDD #0xffff                       
  1a6f  3606           PSHU  B A                         
  1a71  AD9FFCEC       JSR [0xfcec]                      
  1a75  3706           PULU  A B                         
  1a77  FD701E         STD 0x701e                        
  1a7a  FC701E         LDD 0x701e                        
  1a7d  3606           PSHU  B A                         
  1a7f  FC701C         LDD 0x701c                        
  1a82  3606           PSHU  B A                         
  1a84  AD9FFCEC       JSR [0xfcec]                      
  1a88  3706           PULU  A B                         
  1a8a  8C7074         CMPX #0x7074                      
  1a8d  2FD3           BLE 0x1a62                        
  1a8f  16005A         LBRA 0x1aec                       
LAB_M6C_small_04000__1a92:
  1a92  8E705E         LDX #0x705e                       
  1a95  CC0001         LDD #0x1                          
  1a98  FD701E         STD 0x701e                        
  1a9b  CC000B         LDD #0xb                          
  1a9e  FD701C         STD 0x701c                        
LAB_M6C_small_04000__1aa1:
  1aa1  ED81           STD ,X++                          
  1aa3  7A701D         DEC 0x701d                        
  1aa6  FC701E         LDD 0x701e                        
  1aa9  3606           PSHU  B A                         
  1aab  CCFFFF         LDD #0xffff                       
  1aae  3606           PSHU  B A                         
  1ab0  AD9FFCEC       JSR [0xfcec]                      
  1ab4  3706           PULU  A B                         
  1ab6  FD701E         STD 0x701e                        
  1ab9  FC701E         LDD 0x701e                        
  1abc  3606           PSHU  B A                         
  1abe  FC701C         LDD 0x701c                        
  1ac1  3606           PSHU  B A                         
  1ac3  AD9FFCEC       JSR [0xfcec]                      
  1ac7  3706           PULU  A B                         
  1ac9  8C7074         CMPX #0x7074                      
  1acc  2FD3           BLE 0x1aa1                        
  1ace  16001B         LBRA 0x1aec                       
LAB_M6C_small_04000__1ad1:
  1ad1  8E705E         LDX #0x705e                       
LAB_M6C_small_04000__1ad4:
  1ad4  CC0016         LDD #0x16                         
  1ad7  3606           PSHU  B A                         
  1ad9  AD9FFCF8       JSR [0xfcf8]                      
  1add  3706           PULU  A B                         
  1adf  83000B         SUBD #0xb                         
  1ae2  ED81           STD ,X++                          
  1ae4  8C7074         CMPX #0x7074                      
  1ae7  2FEB           BLE 0x1ad4                        
  1ae9  160000         LBRA 0x1aec                       
LAB_M6C_small_04000__1aec:
  1aec  170C20         LBSR 0x270f                       
  1aef  170BB8         LBSR 0x26aa                       
  1af2  C600           LDB #0x0                          
  1af4  AD9FFC36       JSR [0xfc36]                      
  1af8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "pans set - use knob for options         "
  1afc  70616E732073.. char[41] "pans set - use knob for options         "
LAB_M6C_small_04000__1b25:
  1b25  3576           PULS  A B X Y U                   
  1b27  39             RTS                               
PTR_FUN_M6C_small_04000__1be9_M6C_small_04000__1b28:
  1b28  1BE9           addr M6C_small_04000::1be9        
  1b2a  1BFE           addr M6C_small_04000::1bfe        
  1b2c  703E           addr 703e                         
  1b2e  .db 00 53 FC 00 04 00 00 04                          ; .S......

; ---- function FUN_M6C_small_04000__1b36
FUN_M6C_small_04000__1b36:
  1b36  3410           PSHS  X                           
  1b38  8E1B28         LDX #0x1b28                        ; desc[API_FE1C]: ->$1BE9 ->$1BFE $703E
  1b3b  AD9FFE1C       JSR [0xfe1c]                      
  1b3f  3510           PULS  X                           
  1b41  39             RTS                               

; ---- function FUN_M6C_small_04000__1b42
FUN_M6C_small_04000__1b42:
  1b42  3410           PSHS  X                           
  1b44  8E1B28         LDX #0x1b28                        ; desc[API_FE1A]: ->$1BE9 ->$1BFE $703E
  1b47  AD9FFE1A       JSR [0xfe1a]                      
  1b4b  3510           PULS  X                           
  1b4d  39             RTS                               

; ---- function FUN_M6C_small_04000__1b4e
FUN_M6C_small_04000__1b4e:
  1b4e  3426           PSHS  Y B A                       
  1b50  AD9FFC8E       JSR [0xfc8e]                      
  1b54  FC60F9         LDD 0x60f9                        
  1b57  FD703E         STD 0x703e                        
  1b5a  FD6074         STD 0x6074                        
  1b5d  17009E         LBSR 0x1bfe                       
  1b60  CC004D         LDD #0x4d                         
  1b63  830008         SUBD #0x8                         
  1b66  1F02           TFR D,Y                           
  1b68  FC703E         LDD 0x703e                        
  1b6b  AD9FFC82       JSR [0xfc82]                      
  1b6f  3526           PULS  A B Y                       
  1b71  39             RTS                               

; ---- function FUN_M6C_small_04000__1b72
FUN_M6C_small_04000__1b72:
  1b72  3406           PSHS  B A                         
  1b74  FC7042         LDD 0x7042                        
  1b77  FD6074         STD 0x6074                        
  1b7a  17E996         LBSR 0x0513                       
  1b7d  C613           LDB #0x13                         
  1b7f  AD9FFC36       JSR [0xfc36]                      
  1b83  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " diffusion:    %     "
  1b87  0A6469666675.. char[22] "\ndiffusion:    %     " 
LAB_M6C_small_04000__1b9d:
  1b9d  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1BE9 ->$1BBF $0001 $0001 $0000
  1ba1  01             db 1h                             
  1ba2  01             db 1h                             
  1ba3  02             db 2h                             
  1ba4  01             db 1h                             
  1ba5  01             db 1h                             
  1ba6  00             db 0h                             
  1ba7  03             db 3h                             
  1ba8  80             db 80h                            
  1ba9  0064           dw 64h                            
  1bab  0000           dw 0h                             
  1bad  0000           dw 0h                             
  1baf  1BE9           addr M6C_small_04000::1be9        
  1bb1  1BBF           addr M6C_small_04000::1bbf        
  1bb3  0001           dw 1h                             
  1bb5  0001           dw 1h                             
  1bb7  0000           dw 0h                             
LAB_M6C_small_04000__1bb9:
  1bb9  17002D         LBSR 0x1be9                       
  1bbc  3506           PULS  A B                         
  1bbe  39             RTS                               

; ---- function FUN_M6C_small_04000__1bbf
FUN_M6C_small_04000__1bbf:
  1bbf  3426           PSHS  Y B A                       
  1bc1  FC6074         LDD 0x6074                        
  1bc4  B37040         SUBD 0x7040                       
  1bc7  FD703E         STD 0x703e                        
  1bca  CC004D         LDD #0x4d                         
  1bcd  830008         SUBD #0x8                         
  1bd0  1F02           TFR D,Y                           
  1bd2  FC703E         LDD 0x703e                        
  1bd5  AD9FFC82       JSR [0xfc82]                      
  1bd9  8D23           BSR 0x1bfe                        
  1bdb  108E0003       LDY #0x3                          
  1bdf  FC703E         LDD 0x703e                        
  1be2  AD9FFE40       JSR [0xfe40]                      
  1be6  3526           PULS  A B Y                       
  1be8  39             RTS                               

; ---- function FUN_M6C_small_04000__1be9
FUN_M6C_small_04000__1be9:
  1be9  3416           PSHS  X B A                       
  1beb  C61E           LDB #0x1e                         
  1bed  AD9FFC36       JSR [0xfc36]                      
  1bf1  CC0003         LDD #0x3                          
  1bf4  8E60A0         LDX #0x60a0                       
  1bf7  AD9FFC3A       JSR [0xfc3a]                      
  1bfb  3516           PULS  A B X                       
  1bfd  39             RTS                               

; ---- function FUN_M6C_small_04000__1bfe
FUN_M6C_small_04000__1bfe:
  1bfe  3476           PSHS  U Y X B A                   
  1c00  CC0000         LDD #0x0                          
  1c03  3606           PSHU  B A                         
  1c05  CC0064         LDD #0x64                         
  1c08  3606           PSHU  B A                         
  1c0a  FC703E         LDD 0x703e                        
  1c0d  F37040         ADDD 0x7040                       
  1c10  3606           PSHU  B A                         
  1c12  AD9FFCD8       JSR [0xfcd8]                      
  1c16  3706           PULU  A B                         
  1c18  FD7042         STD 0x7042                        
  1c1b  FC7042         LDD 0x7042                        
  1c1e  3606           PSHU  B A                         
  1c20  CC0140         LDD #0x140                        
  1c23  3606           PSHU  B A                         
  1c25  AD9FFCF0       JSR [0xfcf0]                      
  1c29  3706           PULU  A B                         
  1c2b  3706           PULU  A B                         
  1c2d  FD7000         STD 0x7000                        
  1c30  CC000A         LDD #0xa                          
  1c33  AD9FFD20       JSR [0xfd20]                      
  1c37  108E0212       LDY #0x212                        
  1c3b  FC7000         LDD 0x7000                        
  1c3e  AD9FFD2E       JSR [0xfd2e]                      
  1c42  CC000A         LDD #0xa                          
  1c45  AD9FFD20       JSR [0xfd20]                      
  1c49  108E0213       LDY #0x213                        
  1c4d  FC7000         LDD 0x7000                        
  1c50  AD9FFD2E       JSR [0xfd2e]                      
  1c54  CC000A         LDD #0xa                          
  1c57  AD9FFD20       JSR [0xfd20]                      
  1c5b  108E0214       LDY #0x214                        
  1c5f  FC7000         LDD 0x7000                        
  1c62  AD9FFD2E       JSR [0xfd2e]                      
  1c66  CC000A         LDD #0xa                          
  1c69  AD9FFD20       JSR [0xfd20]                      
  1c6d  108E0215       LDY #0x215                        
  1c71  FC7000         LDD 0x7000                        
  1c74  AD9FFD2E       JSR [0xfd2e]                      
  1c78  CC0000         LDD #0x0                          
  1c7b  B37000         SUBD 0x7000                       
  1c7e  FD7002         STD 0x7002                        
  1c81  CC000A         LDD #0xa                          
  1c84  AD9FFD20       JSR [0xfd20]                      
  1c88  108E0216       LDY #0x216                        
  1c8c  FC7002         LDD 0x7002                        
  1c8f  AD9FFD2E       JSR [0xfd2e]                      
  1c93  CC000A         LDD #0xa                          
  1c96  AD9FFD20       JSR [0xfd20]                      
  1c9a  108E0217       LDY #0x217                        
  1c9e  FC7002         LDD 0x7002                        
  1ca1  AD9FFD2E       JSR [0xfd2e]                      
  1ca5  CC000A         LDD #0xa                          
  1ca8  AD9FFD20       JSR [0xfd20]                      
  1cac  108E0218       LDY #0x218                        
  1cb0  FC7002         LDD 0x7002                        
  1cb3  AD9FFD2E       JSR [0xfd2e]                      
  1cb7  CC000A         LDD #0xa                          
  1cba  AD9FFD20       JSR [0xfd20]                      
  1cbe  108E0219       LDY #0x219                        
  1cc2  FC7002         LDD 0x7002                        
  1cc5  AD9FFD2E       JSR [0xfd2e]                      
  1cc9  FC7000         LDD 0x7000                        
  1ccc  3606           PSHU  B A                         
  1cce  3606           PSHU  B A                         
  1cd0  AD9FFCF2       JSR [0xfcf2]                      
  1cd4  3706           PULU  A B                         
  1cd6  FD701E         STD 0x701e                        
  1cd9  CC7FFF         LDD #0x7fff                       
  1cdc  B3701E         SUBD 0x701e                       
  1cdf  FD7004         STD 0x7004                        
  1ce2  CC000A         LDD #0xa                          
  1ce5  AD9FFD20       JSR [0xfd20]                      
  1ce9  108E021A       LDY #0x21a                        
  1ced  FC7004         LDD 0x7004                        
  1cf0  AD9FFD2E       JSR [0xfd2e]                      
  1cf4  CC000A         LDD #0xa                          
  1cf7  AD9FFD20       JSR [0xfd20]                      
  1cfb  108E021B       LDY #0x21b                        
  1cff  FC7004         LDD 0x7004                        
  1d02  AD9FFD2E       JSR [0xfd2e]                      
  1d06  CC000A         LDD #0xa                          
  1d09  AD9FFD20       JSR [0xfd20]                      
  1d0d  108E021C       LDY #0x21c                        
  1d11  FC7004         LDD 0x7004                        
  1d14  AD9FFD2E       JSR [0xfd2e]                      
  1d18  CC000A         LDD #0xa                          
  1d1b  AD9FFD20       JSR [0xfd20]                      
  1d1f  108E021D       LDY #0x21d                        
  1d23  FC7004         LDD 0x7004                        
  1d26  AD9FFD2E       JSR [0xfd2e]                      
  1d2a  3576           PULS  A B X Y U                   
  1d2c  39             RTS                               

; ---- function FUN_M6C_small_04000__1d2d
FUN_M6C_small_04000__1d2d:
  1d2d  3436           PSHS  Y X B A                     
  1d2f  CC0000         LDD #0x0                          
  1d32  204D           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d34
FUN_M6C_small_04000__1d34:
  1d34  3436           PSHS  Y X B A                     
  1d36  CC0001         LDD #0x1                          
  1d39  2046           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d3b
FUN_M6C_small_04000__1d3b:
  1d3b  3436           PSHS  Y X B A                     
  1d3d  CC0002         LDD #0x2                          
  1d40  203F           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d42
FUN_M6C_small_04000__1d42:
  1d42  3436           PSHS  Y X B A                     
  1d44  CC0003         LDD #0x3                          
  1d47  2038           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d49
FUN_M6C_small_04000__1d49:
  1d49  3436           PSHS  Y X B A                     
  1d4b  CC0004         LDD #0x4                          
  1d4e  2031           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d50
FUN_M6C_small_04000__1d50:
  1d50  3436           PSHS  Y X B A                     
  1d52  CC0005         LDD #0x5                          
  1d55  202A           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d57
FUN_M6C_small_04000__1d57:
  1d57  3436           PSHS  Y X B A                     
  1d59  CC0006         LDD #0x6                          
  1d5c  2023           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d5e
FUN_M6C_small_04000__1d5e:
  1d5e  3436           PSHS  Y X B A                     
  1d60  CC0007         LDD #0x7                          
  1d63  201C           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d65
FUN_M6C_small_04000__1d65:
  1d65  3436           PSHS  Y X B A                     
  1d67  CC0008         LDD #0x8                          
  1d6a  2015           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d6c
FUN_M6C_small_04000__1d6c:
  1d6c  3436           PSHS  Y X B A                     
  1d6e  CC0009         LDD #0x9                          
  1d71  200E           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d73
FUN_M6C_small_04000__1d73:
  1d73  3436           PSHS  Y X B A                     
  1d75  CC000A         LDD #0xa                          
  1d78  2007           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d7a
FUN_M6C_small_04000__1d7a:
  1d7a  3436           PSHS  Y X B A                     
  1d7c  CC000B         LDD #0xb                          
  1d7f  2000           BRA 0x1d81                        

; ---- function FUN_M6C_small_04000__1d81
FUN_M6C_small_04000__1d81:
  1d81  170959         LBSR 0x26dd                       
  1d84  FC60F9         LDD 0x60f9                        
  1d87  ED9F7008       STD [0x7008]                      
  1d8b  FD6074         STD 0x6074                        
  1d8e  10BE700E       LDY 0x700e                        
  1d92  AD9FFC82       JSR [0xfc82]                      
  1d96  FC701A         LDD 0x701a                        
  1d99  8607           LDA #0x7                          
  1d9b  3D             MUL                               
  1d9c  C31DAF         ADDD #0x1daf                      
  1d9f  F3600D         ADDD 0x600d                       
  1da2  1F01           TFR D,X                           
  1da4  AD84           JSR ,X                            
  1da6  1700E6         LBSR 0x1e8f                       
  1da9  17012B         LBSR 0x1ed7                       
  1dac  3536           PULS  A B X Y                     
  1dae  39             RTS                               

; ---- function FUN_M6C_small_04000__1daf
FUN_M6C_small_04000__1daf:
  1daf  3406           PSHS  B A                         
  1db1  CC0000         LDD #0x0                          
  1db4  204D           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1db6
FUN_M6C_small_04000__1db6:
  1db6  3406           PSHS  B A                         
  1db8  CC0001         LDD #0x1                          
  1dbb  2046           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dbd
FUN_M6C_small_04000__1dbd:
  1dbd  3406           PSHS  B A                         
  1dbf  CC0002         LDD #0x2                          
  1dc2  203F           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dc4
FUN_M6C_small_04000__1dc4:
  1dc4  3406           PSHS  B A                         
  1dc6  CC0003         LDD #0x3                          
  1dc9  2038           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dcb
FUN_M6C_small_04000__1dcb:
  1dcb  3406           PSHS  B A                         
  1dcd  CC0004         LDD #0x4                          
  1dd0  2031           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dd2
FUN_M6C_small_04000__1dd2:
  1dd2  3406           PSHS  B A                         
  1dd4  CC0005         LDD #0x5                          
  1dd7  202A           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dd9
FUN_M6C_small_04000__1dd9:
  1dd9  3406           PSHS  B A                         
  1ddb  CC0006         LDD #0x6                          
  1dde  2023           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1de0
FUN_M6C_small_04000__1de0:
  1de0  3406           PSHS  B A                         
  1de2  CC0007         LDD #0x7                          
  1de5  201C           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1de7
FUN_M6C_small_04000__1de7:
  1de7  3406           PSHS  B A                         
  1de9  CC0008         LDD #0x8                          
  1dec  2015           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dee
FUN_M6C_small_04000__1dee:
  1dee  3406           PSHS  B A                         
  1df0  CC0009         LDD #0x9                          
  1df3  200E           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1df5
FUN_M6C_small_04000__1df5:
  1df5  3406           PSHS  B A                         
  1df7  CC000A         LDD #0xa                          
  1dfa  2007           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1dfc
FUN_M6C_small_04000__1dfc:
  1dfc  3406           PSHS  B A                         
  1dfe  CC000B         LDD #0xb                          
  1e01  2000           BRA 0x1e03                        

; ---- function FUN_M6C_small_04000__1e03
FUN_M6C_small_04000__1e03:
  1e03  1708D7         LBSR 0x26dd                       
  1e06  EC9F7008       LDD [0x7008]                      
  1e0a  FD6074         STD 0x6074                        
  1e0d  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1E8F ->$1E2F $0001 $0001 $0000
  1e11  01             db 1h                             
  1e12  01             db 1h                             
  1e13  02             db 2h                             
  1e14  01             db 1h                             
  1e15  01             db 1h                             
  1e16  01             db 1h                             
  1e17  05             db 5h                             
  1e18  80             db 80h                            
  1e19  1F40           dw 1F40h                          
  1e1b  0000           dw 0h                             
  1e1d  0000           dw 0h                             
  1e1f  1E8F           addr M6C_small_04000::1e8f        
  1e21  1E2F           addr M6C_small_04000::1e2f        
  1e23  0001           dw 1h                             
  1e25  0001           dw 1h                             
  1e27  0000           dw 0h                             
LAB_M6C_small_04000__1e29:
  1e29  170063         LBSR 0x1e8f                       
  1e2c  3506           PULS  A B                         
  1e2e  39             RTS                               

; ---- function FUN_M6C_small_04000__1e2f
FUN_M6C_small_04000__1e2f:
  1e2f  3466           PSHS  U Y B A                     
  1e31  FC6074         LDD 0x6074                        
  1e34  ED9F7008       STD [0x7008]                      
  1e38  17098F         LBSR 0x27ca                       
  1e3b  272F           BEQ 0x1e6c                        
  1e3d  3706           PULU  A B                         
  1e3f  E39F7008       ADDD [0x7008]                     
  1e43  ED9F7008       STD [0x7008]                      
  1e47  FD6074         STD 0x6074                        
  1e4a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1E8F ->$1E2F $0001 $0001 $0000
  1e4e  01             db 1h                             
  1e4f  01             db 1h                             
  1e50  02             db 2h                             
  1e51  01             db 1h                             
  1e52  01             db 1h                             
  1e53  01             db 1h                             
  1e54  05             db 5h                             
  1e55  80             db 80h                            
  1e56  1F40           dw 1F40h                          
  1e58  0000           dw 0h                             
  1e5a  0000           dw 0h                             
  1e5c  1E8F           addr M6C_small_04000::1e8f        
  1e5e  1E2F           addr M6C_small_04000::1e2f        
  1e60  0001           dw 1h                             
  1e62  0001           dw 1h                             
  1e64  0000           dw 0h                             
LAB_M6C_small_04000__1e66:
  1e66  170026         LBSR 0x1e8f                       
  1e69  1709A9         LBSR 0x2815                       
LAB_M6C_small_04000__1e6c:
  1e6c  10BE700E       LDY 0x700e                        
  1e70  AD9FFC82       JSR [0xfc82]                      
  1e74  8D61           BSR 0x1ed7                        
  1e76  FC701A         LDD 0x701a                        
  1e79  C30009         ADDD #0x9                         
  1e7c  1F02           TFR D,Y                           
  1e7e  EC9F7008       LDD [0x7008]                      
  1e82  AD9FFE40       JSR [0xfe40]                      
  1e86  CC0000         LDD #0x0                          
  1e89  FD7046         STD 0x7046                        
  1e8c  3566           PULS  A B Y U                     
  1e8e  39             RTS                               

; ---- function FUN_M6C_small_04000__1e8f
FUN_M6C_small_04000__1e8f:
  1e8f  3416           PSHS  X B A                       
  1e91  17E67F         LBSR 0x0513                       
  1e94  C613           LDB #0x13                         
  1e96  AD9FFC36       JSR [0xfc36]                      
  1e9a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay   :        mS "
  1e9e  0A64656C6179.. char[22] "\ndelay   :        mS " 
LAB_M6C_small_04000__1eb4:
  1eb4  C619           LDB #0x19                         
  1eb6  AD9FFC36       JSR [0xfc36]                      
  1eba  FC701A         LDD 0x701a                        
  1ebd  C30001         ADDD #0x1                         
  1ec0  AD9FFC44       JSR [0xfc44]                      
  1ec4  C61F           LDB #0x1f                         
  1ec6  AD9FFC36       JSR [0xfc36]                      
  1eca  CC0005         LDD #0x5                          
  1ecd  8E609E         LDX #0x609e                       
  1ed0  AD9FFC3A       JSR [0xfc3a]                      
  1ed4  3516           PULS  A B X                       
  1ed6  39             RTS                               

; ---- function FUN_M6C_small_04000__1ed7
FUN_M6C_small_04000__1ed7:
  1ed7  3466           PSHS  U Y B A                     
  1ed9  EC9F7008       LDD [0x7008]                      
  1edd  3606           PSHU  B A                         
  1edf  CC0004         LDD #0x4                          
  1ee2  3606           PSHU  B A                         
  1ee4  AD9FFCEE       JSR [0xfcee]                      
  1ee8  3706           PULU  A B                         
  1eea  FD701C         STD 0x701c                        
  1eed  EC9F7008       LDD [0x7008]                      
  1ef1  3606           PSHU  B A                         
  1ef3  CC347A         LDD #0x347a                       
  1ef6  3606           PSHU  B A                         
  1ef8  AD9FFCF2       JSR [0xfcf2]                      
  1efc  3706           PULU  A B                         
  1efe  F3701C         ADDD 0x701c                       
  1f01  E39F7012       ADDD [0x7012]                     
  1f05  3606           PSHU  B A                         
  1f07  FC70C2         LDD 0x70c2                        
  1f0a  3606           PSHU  B A                         
  1f0c  AD9FFCF2       JSR [0xfcf2]                      
  1f10  3706           PULU  A B                         
  1f12  C30001         ADDD #0x1                         
  1f15  FD701C         STD 0x701c                        
  1f18  CC000A         LDD #0xa                          
  1f1b  AD9FFD20       JSR [0xfd20]                      
  1f1f  10BE7014       LDY 0x7014                        
  1f23  FC701C         LDD 0x701c                        
  1f26  AD9FFD2E       JSR [0xfd2e]                      
  1f2a  3566           PULS  A B Y U                     
  1f2c  39             RTS                               

; ---- function FUN_M6C_small_04000__1f2d
FUN_M6C_small_04000__1f2d:
  1f2d  3436           PSHS  Y X B A                     
  1f2f  CC0000         LDD #0x0                          
  1f32  204D           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f34
FUN_M6C_small_04000__1f34:
  1f34  3436           PSHS  Y X B A                     
  1f36  CC0001         LDD #0x1                          
  1f39  2046           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f3b
FUN_M6C_small_04000__1f3b:
  1f3b  3436           PSHS  Y X B A                     
  1f3d  CC0002         LDD #0x2                          
  1f40  203F           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f42
FUN_M6C_small_04000__1f42:
  1f42  3436           PSHS  Y X B A                     
  1f44  CC0003         LDD #0x3                          
  1f47  2038           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f49
FUN_M6C_small_04000__1f49:
  1f49  3436           PSHS  Y X B A                     
  1f4b  CC0004         LDD #0x4                          
  1f4e  2031           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f50
FUN_M6C_small_04000__1f50:
  1f50  3436           PSHS  Y X B A                     
  1f52  CC0005         LDD #0x5                          
  1f55  202A           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f57
FUN_M6C_small_04000__1f57:
  1f57  3436           PSHS  Y X B A                     
  1f59  CC0006         LDD #0x6                          
  1f5c  2023           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f5e
FUN_M6C_small_04000__1f5e:
  1f5e  3436           PSHS  Y X B A                     
  1f60  CC0007         LDD #0x7                          
  1f63  201C           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f65
FUN_M6C_small_04000__1f65:
  1f65  3436           PSHS  Y X B A                     
  1f67  CC0008         LDD #0x8                          
  1f6a  2015           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f6c
FUN_M6C_small_04000__1f6c:
  1f6c  3436           PSHS  Y X B A                     
  1f6e  CC0009         LDD #0x9                          
  1f71  200E           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f73
FUN_M6C_small_04000__1f73:
  1f73  3436           PSHS  Y X B A                     
  1f75  CC000A         LDD #0xa                          
  1f78  2007           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f7a
FUN_M6C_small_04000__1f7a:
  1f7a  3436           PSHS  Y X B A                     
  1f7c  CC000B         LDD #0xb                          
  1f7f  2000           BRA 0x1f81                        

; ---- function FUN_M6C_small_04000__1f81
FUN_M6C_small_04000__1f81:
  1f81  1707A1         LBSR 0x2725                       
  1f84  FC60F9         LDD 0x60f9                        
  1f87  ED9F7006       STD [0x7006]                      
  1f8b  FD6074         STD 0x6074                        
  1f8e  10BE700C       LDY 0x700c                        
  1f92  AD9FFC82       JSR [0xfc82]                      
  1f96  FC701A         LDD 0x701a                        
  1f99  8607           LDA #0x7                          
  1f9b  3D             MUL                               
  1f9c  C31FAF         ADDD #0x1faf                      
  1f9f  F3600D         ADDD 0x600d                       
  1fa2  1F01           TFR D,X                           
  1fa4  AD84           JSR ,X                            
  1fa6  1700E5         LBSR 0x208e                       
  1fa9  1700F7         LBSR 0x20a3                       
  1fac  3536           PULS  A B X Y                     
  1fae  39             RTS                               

; ---- function FUN_M6C_small_04000__1faf
FUN_M6C_small_04000__1faf:
  1faf  3406           PSHS  B A                         
  1fb1  CC0000         LDD #0x0                          
  1fb4  204D           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fb6
FUN_M6C_small_04000__1fb6:
  1fb6  3406           PSHS  B A                         
  1fb8  CC0001         LDD #0x1                          
  1fbb  2046           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fbd
FUN_M6C_small_04000__1fbd:
  1fbd  3406           PSHS  B A                         
  1fbf  CC0002         LDD #0x2                          
  1fc2  203F           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fc4
FUN_M6C_small_04000__1fc4:
  1fc4  3406           PSHS  B A                         
  1fc6  CC0003         LDD #0x3                          
  1fc9  2038           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fcb
FUN_M6C_small_04000__1fcb:
  1fcb  3406           PSHS  B A                         
  1fcd  CC0004         LDD #0x4                          
  1fd0  2031           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fd2
FUN_M6C_small_04000__1fd2:
  1fd2  3406           PSHS  B A                         
  1fd4  CC0005         LDD #0x5                          
  1fd7  202A           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fd9
FUN_M6C_small_04000__1fd9:
  1fd9  3406           PSHS  B A                         
  1fdb  CC0006         LDD #0x6                          
  1fde  2023           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fe0
FUN_M6C_small_04000__1fe0:
  1fe0  3406           PSHS  B A                         
  1fe2  CC0007         LDD #0x7                          
  1fe5  201C           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fe7
FUN_M6C_small_04000__1fe7:
  1fe7  3406           PSHS  B A                         
  1fe9  CC0008         LDD #0x8                          
  1fec  2015           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1fee
FUN_M6C_small_04000__1fee:
  1fee  3406           PSHS  B A                         
  1ff0  CC0009         LDD #0x9                          
  1ff3  200E           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1ff5
FUN_M6C_small_04000__1ff5:
  1ff5  3406           PSHS  B A                         
  1ff7  CC000A         LDD #0xa                          
  1ffa  2007           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__1ffc
FUN_M6C_small_04000__1ffc:
  1ffc  3406           PSHS  B A                         
  1ffe  CC000B         LDD #0xb                          
  2001  2000           BRA 0x2003                        

; ---- function FUN_M6C_small_04000__2003
FUN_M6C_small_04000__2003:
  2003  17071F         LBSR 0x2725                       
  2006  EC9F7006       LDD [0x7006]                      
  200a  FD6074         STD 0x6074                        
  200d  17E503         LBSR 0x0513                       
  2010  C613           LDB #0x13                         
  2012  AD9FFC36       JSR [0xfc36]                      
  2016  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " level   :      %    "
  201a  0A6C6576656C.. char[22] "\nlevel   :      %    " 
LAB_M6C_small_04000__2030:
  2030  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 04 80 $03E8 $0000 $0000 ->$208E ->$2062 $0001 $0001 $0000
  2034  01             db 1h                             
  2035  01             db 1h                             
  2036  02             db 2h                             
  2037  01             db 1h                             
  2038  01             db 1h                             
  2039  01             db 1h                             
  203a  04             db 4h                             
  203b  80             db 80h                            
  203c  03E8           dw 3E8h                           
  203e  0000           dw 0h                             
  2040  0000           dw 0h                             
  2042  208E           addr M6C_small_04000::208e        
  2044  2062           addr M6C_small_04000::2062        
  2046  0001           dw 1h                             
  2048  0001           dw 1h                             
  204a  0000           dw 0h                             
LAB_M6C_small_04000__204c:
  204c  17003F         LBSR 0x208e                       
  204f  C619           LDB #0x19                         
  2051  AD9FFC36       JSR [0xfc36]                      
  2055  FC701A         LDD 0x701a                        
  2058  C30001         ADDD #0x1                         
  205b  AD9FFC44       JSR [0xfc44]                      
  205f  3506           PULS  A B                         
  2061  39             RTS                               

; ---- function FUN_M6C_small_04000__2062
FUN_M6C_small_04000__2062:
  2062  3426           PSHS  Y B A                       
  2064  FC6074         LDD 0x6074                        
  2067  ED9F7006       STD [0x7006]                      
  206b  10BE700C       LDY 0x700c                        
  206f  AD9FFC82       JSR [0xfc82]                      
  2073  8D2E           BSR 0x20a3                        
  2075  FC701A         LDD 0x701a                        
  2078  C30015         ADDD #0x15                        
  207b  1F02           TFR D,Y                           
  207d  EC9F7006       LDD [0x7006]                      
  2081  AD9FFE40       JSR [0xfe40]                      
  2085  CC0000         LDD #0x0                          
  2088  FD7048         STD 0x7048                        
  208b  3526           PULS  A B Y                       
  208d  39             RTS                               

; ---- function FUN_M6C_small_04000__208e
FUN_M6C_small_04000__208e:
  208e  3416           PSHS  X B A                       
  2090  C61D           LDB #0x1d                         
  2092  AD9FFC36       JSR [0xfc36]                      
  2096  CC0005         LDD #0x5                          
  2099  8E609E         LDX #0x609e                       
  209c  AD9FFC3A       JSR [0xfc3a]                      
  20a0  3516           PULS  A B X                       
  20a2  39             RTS                               

; ---- function FUN_M6C_small_04000__20a3
FUN_M6C_small_04000__20a3:
  20a3  3476           PSHS  U Y X B A                   
  20a5  EC9F7006       LDD [0x7006]                      
  20a9  FD701C         STD 0x701c                        
  20ac  EC9F700A       LDD [0x700a]                      
  20b0  3606           PSHU  B A                         
  20b2  FC70C0         LDD 0x70c0                        
  20b5  3606           PSHU  B A                         
  20b7  AD9FFCF2       JSR [0xfcf2]                      
  20bb  3706           PULU  A B                         
  20bd  FD701E         STD 0x701e                        
  20c0  FC701E         LDD 0x701e                        
  20c3  C3000B         ADDD #0xb                         
  20c6  3606           PSHU  B A                         
  20c8  FC701C         LDD 0x701c                        
  20cb  3606           PSHU  B A                         
  20cd  AD9FFCEE       JSR [0xfcee]                      
  20d1  3706           PULU  A B                         
  20d3  FD7020         STD 0x7020                        
  20d6  CC000A         LDD #0xa                          
  20d9  AD9FFD20       JSR [0xfd20]                      
  20dd  10BE7018       LDY 0x7018                        
  20e1  FC7020         LDD 0x7020                        
  20e4  AD9FFD2E       JSR [0xfd2e]                      
  20e8  CC000B         LDD #0xb                          
  20eb  B3701E         SUBD 0x701e                       
  20ee  3606           PSHU  B A                         
  20f0  FC701C         LDD 0x701c                        
  20f3  3606           PSHU  B A                         
  20f5  AD9FFCEE       JSR [0xfcee]                      
  20f9  3706           PULU  A B                         
  20fb  FD7020         STD 0x7020                        
  20fe  CC000A         LDD #0xa                          
  2101  AD9FFD20       JSR [0xfd20]                      
  2105  10BE7016       LDY 0x7016                        
  2109  FC7020         LDD 0x7020                        
  210c  AD9FFD2E       JSR [0xfd2e]                      
  2110  3576           PULS  A B X Y U                   
  2112  39             RTS                               

; ---- function FUN_M6C_small_04000__2113
FUN_M6C_small_04000__2113:
  2113  3436           PSHS  Y X B A                     
  2115  CC0000         LDD #0x0                          
  2118  204D           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__211a
FUN_M6C_small_04000__211a:
  211a  3436           PSHS  Y X B A                     
  211c  CC0001         LDD #0x1                          
  211f  2046           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2121
FUN_M6C_small_04000__2121:
  2121  3436           PSHS  Y X B A                     
  2123  CC0002         LDD #0x2                          
  2126  203F           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2128
FUN_M6C_small_04000__2128:
  2128  3436           PSHS  Y X B A                     
  212a  CC0003         LDD #0x3                          
  212d  2038           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__212f
FUN_M6C_small_04000__212f:
  212f  3436           PSHS  Y X B A                     
  2131  CC0004         LDD #0x4                          
  2134  2031           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2136
FUN_M6C_small_04000__2136:
  2136  3436           PSHS  Y X B A                     
  2138  CC0005         LDD #0x5                          
  213b  202A           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__213d
FUN_M6C_small_04000__213d:
  213d  3436           PSHS  Y X B A                     
  213f  CC0006         LDD #0x6                          
  2142  2023           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2144
FUN_M6C_small_04000__2144:
  2144  3436           PSHS  Y X B A                     
  2146  CC0007         LDD #0x7                          
  2149  201C           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__214b
FUN_M6C_small_04000__214b:
  214b  3436           PSHS  Y X B A                     
  214d  CC0008         LDD #0x8                          
  2150  2015           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2152
FUN_M6C_small_04000__2152:
  2152  3436           PSHS  Y X B A                     
  2154  CC0009         LDD #0x9                          
  2157  200E           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2159
FUN_M6C_small_04000__2159:
  2159  3436           PSHS  Y X B A                     
  215b  CC000A         LDD #0xa                          
  215e  2007           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2160
FUN_M6C_small_04000__2160:
  2160  3436           PSHS  Y X B A                     
  2162  CC000B         LDD #0xb                          
  2165  2000           BRA 0x2167                        

; ---- function FUN_M6C_small_04000__2167
FUN_M6C_small_04000__2167:
  2167  1705BB         LBSR 0x2725                       
  216a  FC60F9         LDD 0x60f9                        
  216d  ED9F700A       STD [0x700a]                      
  2171  FD6074         STD 0x6074                        
  2174  10BE7010       LDY 0x7010                        
  2178  AD9FFC80       JSR [0xfc80]                      
  217c  FC701A         LDD 0x701a                        
  217f  8607           LDA #0x7                          
  2181  3D             MUL                               
  2182  C32195         ADDD #0x2195                      
  2185  F3600D         ADDD 0x600d                       
  2188  1F01           TFR D,X                           
  218a  AD84           JSR ,X                            
  218c  1700F8         LBSR 0x2287                       
  218f  1700F2         LBSR 0x2284                       
  2192  3536           PULS  A B X Y                     
  2194  39             RTS                               

; ---- function FUN_M6C_small_04000__2195
FUN_M6C_small_04000__2195:
  2195  3406           PSHS  B A                         
  2197  CC0000         LDD #0x0                          
  219a  204D           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__219c
FUN_M6C_small_04000__219c:
  219c  3406           PSHS  B A                         
  219e  CC0001         LDD #0x1                          
  21a1  2046           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21a3
FUN_M6C_small_04000__21a3:
  21a3  3406           PSHS  B A                         
  21a5  CC0002         LDD #0x2                          
  21a8  203F           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21aa
FUN_M6C_small_04000__21aa:
  21aa  3406           PSHS  B A                         
  21ac  CC0003         LDD #0x3                          
  21af  2038           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21b1
FUN_M6C_small_04000__21b1:
  21b1  3406           PSHS  B A                         
  21b3  CC0004         LDD #0x4                          
  21b6  2031           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21b8
FUN_M6C_small_04000__21b8:
  21b8  3406           PSHS  B A                         
  21ba  CC0005         LDD #0x5                          
  21bd  202A           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21bf
FUN_M6C_small_04000__21bf:
  21bf  3406           PSHS  B A                         
  21c1  CC0006         LDD #0x6                          
  21c4  2023           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21c6
FUN_M6C_small_04000__21c6:
  21c6  3406           PSHS  B A                         
  21c8  CC0007         LDD #0x7                          
  21cb  201C           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21cd
FUN_M6C_small_04000__21cd:
  21cd  3406           PSHS  B A                         
  21cf  CC0008         LDD #0x8                          
  21d2  2015           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21d4
FUN_M6C_small_04000__21d4:
  21d4  3406           PSHS  B A                         
  21d6  CC0009         LDD #0x9                          
  21d9  200E           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21db
FUN_M6C_small_04000__21db:
  21db  3406           PSHS  B A                         
  21dd  CC000A         LDD #0xa                          
  21e0  2007           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21e2
FUN_M6C_small_04000__21e2:
  21e2  3406           PSHS  B A                         
  21e4  CC000B         LDD #0xb                          
  21e7  2000           BRA 0x21e9                        

; ---- function FUN_M6C_small_04000__21e9
FUN_M6C_small_04000__21e9:
  21e9  170539         LBSR 0x2725                       
  21ec  EC9F700A       LDD [0x700a]                      
  21f0  FD6074         STD 0x6074                        
  21f3  17E31D         LBSR 0x0513                       
  21f6  C604           LDB #0x4                          
  21f8  AD9FFC36       JSR [0xfc36]                      
  21fc  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " pan   : L-           C           -R"
  2200  0A70616E2020.. char[37] "\npan   : L-           C           -R"
LAB_M6C_small_04000__2225:
  2225  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$2287 ->$2257 $0001 $0001 $0000
  2229  01             db 1h                             
  222a  01             db 1h                             
  222b  02             db 2h                             
  222c  01             db 1h                             
  222d  01             db 1h                             
  222e  00             db 0h                             
  222f  03             db 3h                             
  2230  80             db 80h                            
  2231  000B           dw Bh                             
  2233  FFF5           dw FFF5h                          
  2235  0000           dw 0h                             
  2237  2287           addr M6C_small_04000::2287        
  2239  2257           addr M6C_small_04000::2257        
  223b  0001           dw 1h                             
  223d  0001           dw 1h                             
  223f  0000           dw 0h                             
LAB_M6C_small_04000__2241:
  2241  170043         LBSR 0x2287                       
  2244  C608           LDB #0x8                          
  2246  AD9FFC36       JSR [0xfc36]                      
  224a  FC701A         LDD 0x701a                        
  224d  C30001         ADDD #0x1                         
  2250  AD9FFC44       JSR [0xfc44]                      
  2254  3506           PULS  A B                         
  2256  39             RTS                               

; ---- function FUN_M6C_small_04000__2257
FUN_M6C_small_04000__2257:
  2257  3426           PSHS  Y B A                       
  2259  FC6074         LDD 0x6074                        
  225c  ED9F700A       STD [0x700a]                      
  2260  10BE7010       LDY 0x7010                        
  2264  AD9FFC80       JSR [0xfc80]                      
  2268  170019         LBSR 0x2284                       
  226b  FC701A         LDD 0x701a                        
  226e  C30021         ADDD #0x21                        
  2271  1F02           TFR D,Y                           
  2273  EC9F700A       LDD [0x700a]                      
  2277  AD9FFE40       JSR [0xfe40]                      
  227b  CC0000         LDD #0x0                          
  227e  FD704A         STD 0x704a                        
  2281  3526           PULS  A B Y                       
  2283  39             RTS                               

; ---- function FUN_M6C_small_04000__2284
FUN_M6C_small_04000__2284:
  2284  17FE1C         LBSR 0x20a3                       

; ---- function FUN_M6C_small_04000__2287
FUN_M6C_small_04000__2287:
  2287  3456           PSHS  U X B A                     
  2289  C60F           LDB #0xf                          
  228b  AD9FFC36       JSR [0xfc36]                      
  228f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "           C           "
  2293  202020202020.. char[24] "           C           "
LAB_M6C_small_04000__22ab:
  22ab  EC9F700A       LDD [0x700a]                      
  22af  C3000B         ADDD #0xb                         
  22b2  C3000F         ADDD #0xf                         
  22b5  AD9FFC36       JSR [0xfc36]                      
  22b9  C62A           LDB #0x2a                         
  22bb  AD9FFC2A       JSR [0xfc2a]                      
  22bf  3556           PULS  A B X U                     
  22c1  39             RTS                               

; ---- function FUN_M6C_small_04000__22c2
FUN_M6C_small_04000__22c2:
  22c2  3436           PSHS  Y X B A                     
  22c4  CC0000         LDD #0x0                          
  22c7  2015           BRA 0x22de                        

; ---- function FUN_M6C_small_04000__22c9
FUN_M6C_small_04000__22c9:
  22c9  3436           PSHS  Y X B A                     
  22cb  CC0001         LDD #0x1                          
  22ce  200E           BRA 0x22de                        

; ---- function FUN_M6C_small_04000__22d0
FUN_M6C_small_04000__22d0:
  22d0  3436           PSHS  Y X B A                     
  22d2  CC0002         LDD #0x2                          
  22d5  2007           BRA 0x22de                        

; ---- function FUN_M6C_small_04000__22d7
FUN_M6C_small_04000__22d7:
  22d7  3436           PSHS  Y X B A                     
  22d9  CC0003         LDD #0x3                          
  22dc  2000           BRA 0x22de                        

; ---- function FUN_M6C_small_04000__22de
FUN_M6C_small_04000__22de:
  22de  17049E         LBSR 0x277f                       
  22e1  FC60F9         LDD 0x60f9                        
  22e4  ED9F7008       STD [0x7008]                      
  22e8  FD6074         STD 0x6074                        
  22eb  10BE700E       LDY 0x700e                        
  22ef  AD9FFC82       JSR [0xfc82]                      
  22f3  FC701A         LDD 0x701a                        
  22f6  8607           LDA #0x7                          
  22f8  3D             MUL                               
  22f9  C3230C         ADDD #0x230c                      
  22fc  F3600D         ADDD 0x600d                       
  22ff  1F01           TFR D,X                           
  2301  AD84           JSR ,X                            
  2303  1700A8         LBSR 0x23ae                       
  2306  1700ED         LBSR 0x23f6                       
  2309  3536           PULS  A B X Y                     
  230b  39             RTS                               

; ---- function FUN_M6C_small_04000__230c
FUN_M6C_small_04000__230c:
  230c  3406           PSHS  B A                         
  230e  CC0000         LDD #0x0                          
  2311  2015           BRA 0x2328                        

; ---- function FUN_M6C_small_04000__2313
FUN_M6C_small_04000__2313:
  2313  3406           PSHS  B A                         
  2315  CC0001         LDD #0x1                          
  2318  200E           BRA 0x2328                        

; ---- function FUN_M6C_small_04000__231a
FUN_M6C_small_04000__231a:
  231a  3406           PSHS  B A                         
  231c  CC0002         LDD #0x2                          
  231f  2007           BRA 0x2328                        

; ---- function FUN_M6C_small_04000__2321
FUN_M6C_small_04000__2321:
  2321  3406           PSHS  B A                         
  2323  CC0003         LDD #0x3                          
  2326  2000           BRA 0x2328                        

; ---- function FUN_M6C_small_04000__2328
FUN_M6C_small_04000__2328:
  2328  170454         LBSR 0x277f                       
  232b  EC9F7008       LDD [0x7008]                      
  232f  FD6074         STD 0x6074                        
  2332  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$23AE ->$2354 $0001 $0001 $0000
  2336  01             db 1h                             
  2337  01             db 1h                             
  2338  02             db 2h                             
  2339  01             db 1h                             
  233a  01             db 1h                             
  233b  01             db 1h                             
  233c  05             db 5h                             
  233d  80             db 80h                            
  233e  1F40           dw 1F40h                          
  2340  0000           dw 0h                             
  2342  0000           dw 0h                             
  2344  23AE           addr M6C_small_04000::23ae        
  2346  2354           addr M6C_small_04000::2354        
  2348  0001           dw 1h                             
  234a  0001           dw 1h                             
  234c  0000           dw 0h                             
LAB_M6C_small_04000__234e:
  234e  17005D         LBSR 0x23ae                       
  2351  3506           PULS  A B                         
  2353  39             RTS                               

; ---- function FUN_M6C_small_04000__2354
FUN_M6C_small_04000__2354:
  2354  3466           PSHS  U Y B A                     
  2356  FC6074         LDD 0x6074                        
  2359  ED9F7008       STD [0x7008]                      
  235d  17046A         LBSR 0x27ca                       
  2360  272F           BEQ 0x2391                        
  2362  3706           PULU  A B                         
  2364  E39F7008       ADDD [0x7008]                     
  2368  ED9F7008       STD [0x7008]                      
  236c  FD6074         STD 0x6074                        
  236f  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$23AE ->$2354 $0001 $0001 $0000
  2373  01             db 1h                             
  2374  01             db 1h                             
  2375  02             db 2h                             
  2376  01             db 1h                             
  2377  01             db 1h                             
  2378  01             db 1h                             
  2379  05             db 5h                             
  237a  80             db 80h                            
  237b  1F40           dw 1F40h                          
  237d  0000           dw 0h                             
  237f  0000           dw 0h                             
  2381  23AE           addr M6C_small_04000::23ae        
  2383  2354           addr M6C_small_04000::2354        
  2385  0001           dw 1h                             
  2387  0001           dw 1h                             
  2389  0000           dw 0h                             
LAB_M6C_small_04000__238b:
  238b  170020         LBSR 0x23ae                       
  238e  170484         LBSR 0x2815                       
LAB_M6C_small_04000__2391:
  2391  10BE700E       LDY 0x700e                        
  2395  AD9FFC82       JSR [0xfc82]                      
  2399  FC701A         LDD 0x701a                        
  239c  C3002D         ADDD #0x2d                        
  239f  1F02           TFR D,Y                           
  23a1  EC9F7008       LDD [0x7008]                      
  23a5  AD9FFE40       JSR [0xfe40]                      
  23a9  8D4B           BSR 0x23f6                        
  23ab  3566           PULS  A B Y U                     
  23ad  39             RTS                               

; ---- function FUN_M6C_small_04000__23ae
FUN_M6C_small_04000__23ae:
  23ae  3416           PSHS  X B A                       
  23b0  17E160         LBSR 0x0513                       
  23b3  C613           LDB #0x13                         
  23b5  AD9FFC36       JSR [0xfc36]                      
  23b9  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " ap delay   :      mS"
  23bd  0A6170206465.. char[22] "\nap delay   :      mS" 
LAB_M6C_small_04000__23d3:
  23d3  C61C           LDB #0x1c                         
  23d5  AD9FFC36       JSR [0xfc36]                      
  23d9  FC701A         LDD 0x701a                        
  23dc  C30001         ADDD #0x1                         
  23df  AD9FFC44       JSR [0xfc44]                      
  23e3  C621           LDB #0x21                         
  23e5  AD9FFC36       JSR [0xfc36]                      
  23e9  CC0005         LDD #0x5                          
  23ec  8E609E         LDX #0x609e                       
  23ef  AD9FFC3A       JSR [0xfc3a]                      
  23f3  3516           PULS  A B X                       
  23f5  39             RTS                               

; ---- function FUN_M6C_small_04000__23f6
FUN_M6C_small_04000__23f6:
  23f6  3466           PSHS  U Y B A                     
  23f8  EC9F7008       LDD [0x7008]                      
  23fc  3606           PSHU  B A                         
  23fe  CC0004         LDD #0x4                          
  2401  3606           PSHU  B A                         
  2403  AD9FFCEE       JSR [0xfcee]                      
  2407  3706           PULU  A B                         
  2409  FD701C         STD 0x701c                        
  240c  EC9F7008       LDD [0x7008]                      
  2410  3606           PSHU  B A                         
  2412  CC347A         LDD #0x347a                       
  2415  3606           PSHU  B A                         
  2417  AD9FFCF2       JSR [0xfcf2]                      
  241b  3706           PULU  A B                         
  241d  F3701C         ADDD 0x701c                       
  2420  E39F7012       ADDD [0x7012]                     
  2424  FD701C         STD 0x701c                        
  2427  CC000A         LDD #0xa                          
  242a  AD9FFD20       JSR [0xfd20]                      
  242e  10BE7014       LDY 0x7014                        
  2432  FC701C         LDD 0x701c                        
  2435  AD9FFD2E       JSR [0xfd2e]                      
  2439  3566           PULS  A B Y U                     
  243b  39             RTS                               
PTR_FUN_M6C_small_04000__2502_M6C_small_04000__243c:
  243c  2502           addr M6C_small_04000::2502        
  243e  2517           addr M6C_small_04000::2517        
  2440  702E           addr 702e                         
  2442  .db 00 4B FF 9C 00 64 00 04                          ; .K...d..

; ---- function FUN_M6C_small_04000__244a
FUN_M6C_small_04000__244a:
  244a  3410           PSHS  X                           
  244c  8E243C         LDX #0x243c                        ; desc[API_FE1C]: ->$2502 ->$2517 $702E
  244f  AD9FFE1C       JSR [0xfe1c]                      
  2453  3510           PULS  X                           
  2455  39             RTS                               

; ---- function FUN_M6C_small_04000__2456
FUN_M6C_small_04000__2456:
  2456  3410           PSHS  X                           
  2458  8E243C         LDX #0x243c                        ; desc[API_FE1A]: ->$2502 ->$2517 $702E
  245b  AD9FFE1A       JSR [0xfe1a]                      
  245f  3510           PULS  X                           
  2461  39             RTS                               

; ---- function FUN_M6C_small_04000__2462
FUN_M6C_small_04000__2462:
  2462  3426           PSHS  Y B A                       
  2464  AD9FFC8E       JSR [0xfc8e]                      
  2468  FC60F9         LDD 0x60f9                        
  246b  FD6074         STD 0x6074                        
  246e  B37030         SUBD 0x7030                       
  2471  FD702E         STD 0x702e                        
  2474  1700A0         LBSR 0x2517                       
  2477  CC0045         LDD #0x45                         
  247a  830008         SUBD #0x8                         
  247d  1F02           TFR D,Y                           
  247f  FC702E         LDD 0x702e                        
  2482  AD9FFC82       JSR [0xfc82]                      
  2486  3526           PULS  A B Y                       
  2488  39             RTS                               

; ---- function FUN_M6C_small_04000__2489
FUN_M6C_small_04000__2489:
  2489  3406           PSHS  B A                         
  248b  FC7032         LDD 0x7032                        
  248e  FD6074         STD 0x6074                        
  2491  17E07F         LBSR 0x0513                       
  2494  C613           LDB #0x13                         
  2496  AD9FFC36       JSR [0xfc36]                      
  249a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left mix:     % wet "
  249e  0A6C65667420.. char[22] "\nleft mix:     % wet " 
LAB_M6C_small_04000__24b4:
  24b4  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2502 ->$24D6 $0001 $0001 $0000
  24b8  01             db 1h                             
  24b9  01             db 1h                             
  24ba  02             db 2h                             
  24bb  01             db 1h                             
  24bc  01             db 1h                             
  24bd  00             db 0h                             
  24be  03             db 3h                             
  24bf  80             db 80h                            
  24c0  0064           dw 64h                            
  24c2  0000           dw 0h                             
  24c4  0000           dw 0h                             
  24c6  2502           addr M6C_small_04000::2502        
  24c8  24D6           addr M6C_small_04000::24d6        
  24ca  0001           dw 1h                             
  24cc  0001           dw 1h                             
  24ce  0000           dw 0h                             
LAB_M6C_small_04000__24d0:
  24d0  17002F         LBSR 0x2502                       
  24d3  3506           PULS  A B                         
  24d5  39             RTS                               

; ---- function FUN_M6C_small_04000__24d6
FUN_M6C_small_04000__24d6:
  24d6  3426           PSHS  Y B A                       
  24d8  FC6074         LDD 0x6074                        
  24db  B37030         SUBD 0x7030                       
  24de  FD702E         STD 0x702e                        
  24e1  CC0045         LDD #0x45                         
  24e4  830008         SUBD #0x8                         
  24e7  1F02           TFR D,Y                           
  24e9  FC702E         LDD 0x702e                        
  24ec  AD9FFC82       JSR [0xfc82]                      
  24f0  108E0000       LDY #0x0                          
  24f4  FC702E         LDD 0x702e                        
  24f7  AD9FFE40       JSR [0xfe40]                      
  24fb  8D1A           BSR 0x2517                        
  24fd  8D03           BSR 0x2502                        
  24ff  3526           PULS  A B Y                       
  2501  39             RTS                               

; ---- function FUN_M6C_small_04000__2502
FUN_M6C_small_04000__2502:
  2502  3416           PSHS  X B A                       
  2504  C61E           LDB #0x1e                         
  2506  AD9FFC36       JSR [0xfc36]                      
  250a  CC0003         LDD #0x3                          
  250d  8E60A0         LDX #0x60a0                       
  2510  AD9FFC3A       JSR [0xfc3a]                      
  2514  3516           PULS  A B X                       
  2516  39             RTS                               

; ---- function FUN_M6C_small_04000__2517
FUN_M6C_small_04000__2517:
  2517  3476           PSHS  U Y X B A                   
  2519  CC0000         LDD #0x0                          
  251c  3606           PSHU  B A                         
  251e  CC0064         LDD #0x64                         
  2521  3606           PSHU  B A                         
  2523  FC702E         LDD 0x702e                        
  2526  F37030         ADDD 0x7030                       
  2529  3606           PSHU  B A                         
  252b  AD9FFCD8       JSR [0xfcd8]                      
  252f  3706           PULU  A B                         
  2531  FD7032         STD 0x7032                        
  2534  CC0064         LDD #0x64                         
  2537  B37032         SUBD 0x7032                       
  253a  3606           PSHU  B A                         
  253c  58             LSLB                              
  253d  49             ROLA                              
  253e  FD701C         STD 0x701c                        
  2541  CC4666         LDD #0x4666                       
  2544  3606           PSHU  B A                         
  2546  AD9FFCF2       JSR [0xfcf2]                      
  254a  3706           PULU  A B                         
  254c  F3701C         ADDD 0x701c                       
  254f  AD9FFC6A       JSR [0xfc6a]                      
  2553  3576           PULS  A B X Y U                   
  2555  39             RTS                               
PTR_FUN_M6C_small_04000__261c_M6C_small_04000__2556:
  2556  261C           addr M6C_small_04000::261c        
  2558  2631           addr M6C_small_04000::2631        
  255a  7036           addr 7036                         
  255c  .db 00 4D FF 9C 00 64 00 04                          ; .M...d..

; ---- function FUN_M6C_small_04000__2564
FUN_M6C_small_04000__2564:
  2564  3410           PSHS  X                           
  2566  8E2556         LDX #0x2556                        ; desc[API_FE1C]: ->$261C ->$2631 $7036
  2569  AD9FFE1C       JSR [0xfe1c]                      
  256d  3510           PULS  X                           
  256f  39             RTS                               

; ---- function FUN_M6C_small_04000__2570
FUN_M6C_small_04000__2570:
  2570  3410           PSHS  X                           
  2572  8E2556         LDX #0x2556                        ; desc[API_FE1A]: ->$261C ->$2631 $7036
  2575  AD9FFE1A       JSR [0xfe1a]                      
  2579  3510           PULS  X                           
  257b  39             RTS                               

; ---- function FUN_M6C_small_04000__257c
FUN_M6C_small_04000__257c:
  257c  3426           PSHS  Y B A                       
  257e  AD9FFC8E       JSR [0xfc8e]                      
  2582  FC60F9         LDD 0x60f9                        
  2585  FD6074         STD 0x6074                        
  2588  B37038         SUBD 0x7038                       
  258b  FD7036         STD 0x7036                        
  258e  1700A0         LBSR 0x2631                       
  2591  CC0047         LDD #0x47                         
  2594  830008         SUBD #0x8                         
  2597  1F02           TFR D,Y                           
  2599  FC7036         LDD 0x7036                        
  259c  AD9FFC82       JSR [0xfc82]                      
  25a0  3526           PULS  A B Y                       
  25a2  39             RTS                               

; ---- function FUN_M6C_small_04000__25a3
FUN_M6C_small_04000__25a3:
  25a3  3406           PSHS  B A                         
  25a5  FC703A         LDD 0x703a                        
  25a8  FD6074         STD 0x6074                        
  25ab  17DF65         LBSR 0x0513                       
  25ae  C613           LDB #0x13                         
  25b0  AD9FFC36       JSR [0xfc36]                      
  25b4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right mix:    % wet "
  25b8  0A7269676874.. char[22] "\nright mix:    % wet " 
LAB_M6C_small_04000__25ce:
  25ce  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$261C ->$25F0 $0001 $0001 $0000
  25d2  01             db 1h                             
  25d3  01             db 1h                             
  25d4  02             db 2h                             
  25d5  01             db 1h                             
  25d6  01             db 1h                             
  25d7  00             db 0h                             
  25d8  03             db 3h                             
  25d9  80             db 80h                            
  25da  0064           dw 64h                            
  25dc  0000           dw 0h                             
  25de  0000           dw 0h                             
  25e0  261C           addr M6C_small_04000::261c        
  25e2  25F0           addr M6C_small_04000::25f0        
  25e4  0001           dw 1h                             
  25e6  0001           dw 1h                             
  25e8  0000           dw 0h                             
LAB_M6C_small_04000__25ea:
  25ea  17002F         LBSR 0x261c                       
  25ed  3506           PULS  A B                         
  25ef  39             RTS                               

; ---- function FUN_M6C_small_04000__25f0
FUN_M6C_small_04000__25f0:
  25f0  3426           PSHS  Y B A                       
  25f2  FC6074         LDD 0x6074                        
  25f5  B37038         SUBD 0x7038                       
  25f8  FD7036         STD 0x7036                        
  25fb  CC0047         LDD #0x47                         
  25fe  830008         SUBD #0x8                         
  2601  1F02           TFR D,Y                           
  2603  FC7036         LDD 0x7036                        
  2606  AD9FFC82       JSR [0xfc82]                      
  260a  108E0001       LDY #0x1                          
  260e  FC7036         LDD 0x7036                        
  2611  AD9FFE40       JSR [0xfe40]                      
  2615  8D1A           BSR 0x2631                        
  2617  8D03           BSR 0x261c                        
  2619  3526           PULS  A B Y                       
  261b  39             RTS                               

; ---- function FUN_M6C_small_04000__261c
FUN_M6C_small_04000__261c:
  261c  3416           PSHS  X B A                       
  261e  C61E           LDB #0x1e                         
  2620  AD9FFC36       JSR [0xfc36]                      
  2624  CC0003         LDD #0x3                          
  2627  8E60A0         LDX #0x60a0                       
  262a  AD9FFC3A       JSR [0xfc3a]                      
  262e  3516           PULS  A B X                       
  2630  39             RTS                               

; ---- function FUN_M6C_small_04000__2631
FUN_M6C_small_04000__2631:
  2631  3476           PSHS  U Y X B A                   
  2633  CC0000         LDD #0x0                          
  2636  3606           PSHU  B A                         
  2638  CC0064         LDD #0x64                         
  263b  3606           PSHU  B A                         
  263d  FC7036         LDD 0x7036                        
  2640  F37038         ADDD 0x7038                       
  2643  3606           PSHU  B A                         
  2645  AD9FFCD8       JSR [0xfcd8]                      
  2649  3706           PULU  A B                         
  264b  FD703A         STD 0x703a                        
  264e  CC0064         LDD #0x64                         
  2651  B3703A         SUBD 0x703a                       
  2654  3606           PSHU  B A                         
  2656  58             LSLB                              
  2657  49             ROLA                              
  2658  FD701C         STD 0x701c                        
  265b  CC4666         LDD #0x4666                       
  265e  3606           PSHU  B A                         
  2660  AD9FFCF2       JSR [0xfcf2]                      
  2664  3706           PULU  A B                         
  2666  F3701C         ADDD 0x701c                       
  2669  AD9FFC72       JSR [0xfc72]                      
  266d  3576           PULS  A B X Y U                   
  266f  39             RTS                               

; ---- function FUN_M6C_small_04000__2670
FUN_M6C_small_04000__2670:
  2670  3476           PSHS  U Y X B A                   
  2672  8E7076         LDX #0x7076                       
  2675  CC0062         LDD #0x62                         
  2678  830008         SUBD #0x8                         
  267b  1F02           TFR D,Y                           
LAB_M6C_small_04000__267d:
  267d  EC81           LDD ,X++                          
  267f  AD9FFC82       JSR [0xfc82]                      
  2683  3122           LEAY 0x2,Y                        
  2685  8C708C         CMPX #0x708c                      
  2688  2FF3           BLE 0x267d                        
  268a  3576           PULS  A B X Y U                   
  268c  39             RTS                               

; ---- function FUN_M6C_small_04000__268d
FUN_M6C_small_04000__268d:
  268d  3476           PSHS  U Y X B A                   
  268f  8E708E         LDX #0x708e                       
  2692  CC007A         LDD #0x7a                         
  2695  830008         SUBD #0x8                         
  2698  1F02           TFR D,Y                           
LAB_M6C_small_04000__269a:
  269a  EC81           LDD ,X++                          
  269c  AD9FFC82       JSR [0xfc82]                      
  26a0  3122           LEAY 0x2,Y                        
  26a2  8C70A4         CMPX #0x70a4                      
  26a5  2FF3           BLE 0x269a                        
  26a7  3576           PULS  A B X Y U                   
  26a9  39             RTS                               

; ---- function FUN_M6C_small_04000__26aa
FUN_M6C_small_04000__26aa:
  26aa  3476           PSHS  U Y X B A                   
  26ac  8E705E         LDX #0x705e                       
  26af  CC0092         LDD #0x92                         
  26b2  830008         SUBD #0x8                         
  26b5  1F02           TFR D,Y                           
LAB_M6C_small_04000__26b7:
  26b7  EC81           LDD ,X++                          
  26b9  AD9FFC80       JSR [0xfc80]                      
  26bd  3121           LEAY 0x1,Y                        
  26bf  8C7074         CMPX #0x7074                      
  26c2  2FF3           BLE 0x26b7                        
  26c4  3576           PULS  A B X Y U                   
  26c6  39             RTS                               

; ---- function FUN_M6C_small_04000__26c7
FUN_M6C_small_04000__26c7:
  26c7  3406           PSHS  B A                         
  26c9  4F             CLRA                              
  26ca  5F             CLRB                              
LAB_M6C_small_04000__26cb:
  26cb  17000F         LBSR 0x26dd                       
  26ce  17F806         LBSR 0x1ed7                       
  26d1  C30001         ADDD #0x1                         
  26d4  1083000B       CMPD #0xb                         
  26d8  2FF1           BLE 0x26cb                        
  26da  3506           PULS  A B                         
  26dc  39             RTS                               

; ---- function FUN_M6C_small_04000__26dd
FUN_M6C_small_04000__26dd:
  26dd  3406           PSHS  B A                         
  26df  FD701A         STD 0x701a                        
  26e2  C3041E         ADDD #0x41e                       
  26e5  FD7014         STD 0x7014                        
  26e8  FC701A         LDD 0x701a                        
  26eb  58             LSLB                              
  26ec  C37076         ADDD #0x7076                      
  26ef  FD7008         STD 0x7008                        
  26f2  FC701A         LDD 0x701a                        
  26f5  58             LSLB                              
  26f6  C30062         ADDD #0x62                        
  26f9  830008         SUBD #0x8                         
  26fc  FD700E         STD 0x700e                        
  26ff  FC701A         LDD 0x701a                        
  2702  58             LSLB                              
  2703  C32839         ADDD #0x2839                      
  2706  F3600D         ADDD 0x600d                       
  2709  FD7012         STD 0x7012                        
  270c  3506           PULS  A B                         
  270e  39             RTS                               

; ---- function FUN_M6C_small_04000__270f
FUN_M6C_small_04000__270f:
  270f  3406           PSHS  B A                         
  2711  4F             CLRA                              
  2712  5F             CLRB                              
LAB_M6C_small_04000__2713:
  2713  17000F         LBSR 0x2725                       
  2716  17F98A         LBSR 0x20a3                       
  2719  C30001         ADDD #0x1                         
  271c  1083000B       CMPD #0xb                         
  2720  2FF1           BLE 0x2713                        
  2722  3506           PULS  A B                         
  2724  39             RTS                               

; ---- function FUN_M6C_small_04000__2725
FUN_M6C_small_04000__2725:
  2725  3406           PSHS  B A                         
  2727  FD701A         STD 0x701a                        
  272a  C3011E         ADDD #0x11e                       
  272d  FD7016         STD 0x7016                        
  2730  FC701A         LDD 0x701a                        
  2733  C30132         ADDD #0x132                       
  2736  FD7018         STD 0x7018                        
  2739  FC701A         LDD 0x701a                        
  273c  58             LSLB                              
  273d  C3708E         ADDD #0x708e                      
  2740  FD7006         STD 0x7006                        
  2743  FC701A         LDD 0x701a                        
  2746  58             LSLB                              
  2747  C3705E         ADDD #0x705e                      
  274a  FD700A         STD 0x700a                        
  274d  FC701A         LDD 0x701a                        
  2750  58             LSLB                              
  2751  C3007A         ADDD #0x7a                        
  2754  830008         SUBD #0x8                         
  2757  FD700C         STD 0x700c                        
  275a  FC701A         LDD 0x701a                        
  275d  C30092         ADDD #0x92                        
  2760  830008         SUBD #0x8                         
  2763  FD7010         STD 0x7010                        
  2766  3506           PULS  A B                         
  2768  39             RTS                               

; ---- function FUN_M6C_small_04000__2769
FUN_M6C_small_04000__2769:
  2769  3406           PSHS  B A                         
  276b  4F             CLRA                              
  276c  5F             CLRB                              
LAB_M6C_small_04000__276d:
  276d  17000F         LBSR 0x277f                       
  2770  17FC83         LBSR 0x23f6                       
  2773  C30001         ADDD #0x1                         
  2776  10830003       CMPD #0x3                         
  277a  2FF1           BLE 0x276d                        
  277c  3506           PULS  A B                         
  277e  39             RTS                               

; ---- function FUN_M6C_small_04000__277f
FUN_M6C_small_04000__277f:
  277f  3406           PSHS  B A                         
  2781  FD701A         STD 0x701a                        
  2784  C3043C         ADDD #0x43c                       
  2787  FD7014         STD 0x7014                        
  278a  FC701A         LDD 0x701a                        
  278d  58             LSLB                              
  278e  C370A6         ADDD #0x70a6                      
  2791  FD7008         STD 0x7008                        
  2794  FC701A         LDD 0x701a                        
  2797  58             LSLB                              
  2798  C3009E         ADDD #0x9e                        
  279b  830008         SUBD #0x8                         
  279e  FD700E         STD 0x700e                        
  27a1  FC701A         LDD 0x701a                        
  27a4  58             LSLB                              
  27a5  C32839         ADDD #0x2839                      
  27a8  F3600D         ADDD 0x600d                       
  27ab  FD7012         STD 0x7012                        
  27ae  3506           PULS  A B                         
  27b0  39             RTS                               

; ---- function FUN_M6C_small_04000__27b1
FUN_M6C_small_04000__27b1:
  27b1  3406           PSHS  B A                         
  27b3  CC0000         LDD #0x0                          
  27b6  B370A6         SUBD 0x70a6                       
  27b9  B370A8         SUBD 0x70a8                       
  27bc  B370AA         SUBD 0x70aa                       
  27bf  B370AC         SUBD 0x70ac                       
  27c2  C338A4         ADDD #0x38a4                      
  27c5  3606           PSHU  B A                         
  27c7  3506           PULS  A B                         
  27c9  39             RTS                               

; ---- function FUN_M6C_small_04000__27ca
FUN_M6C_small_04000__27ca:
  27ca  3406           PSHS  B A                         
  27cc  CC0000         LDD #0x0                          
  27cf  B37076         SUBD 0x7076                       
  27d2  B37078         SUBD 0x7078                       
  27d5  B3707A         SUBD 0x707a                       
  27d8  B3707C         SUBD 0x707c                       
  27db  B3707E         SUBD 0x707e                       
  27de  B37080         SUBD 0x7080                       
  27e1  B37082         SUBD 0x7082                       
  27e4  B37084         SUBD 0x7084                       
  27e7  B37086         SUBD 0x7086                       
  27ea  B37088         SUBD 0x7088                       
  27ed  B3708A         SUBD 0x708a                       
  27f0  B3708C         SUBD 0x708c                       
  27f3  B370A6         SUBD 0x70a6                       
  27f6  B370A8         SUBD 0x70a8                       
  27f9  B370AA         SUBD 0x70aa                       
  27fc  B370AC         SUBD 0x70ac                       
  27ff  C338A4         ADDD #0x38a4                      
  2802  3606           PSHU  B A                         
  2804  10830000       CMPD #0x0                         
  2808  2D05           BLT 0x280f                        
  280a  CC0000         LDD #0x0                          
  280d  2003           BRA 0x2812                        
LAB_M6C_small_04000__280f:
  280f  CCFFFF         LDD #0xffff                       
LAB_M6C_small_04000__2812:
  2812  3506           PULS  A B                         
  2814  39             RTS                               

; ---- function FUN_M6C_small_04000__2815
FUN_M6C_small_04000__2815:
  2815  3406           PSHS  B A                         
  2817  C614           LDB #0x14                         
  2819  AD9FFC36       JSR [0xfc36]                      
  281d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "OOPS, no delay left "
  2821  4F4F50532C20.. char[21] "OOPS, no delay left "   
LAB_M6C_small_04000__2836:
  2836  3506           PULS  A B                         
  2838  39             RTS                               
  2839  .db 00 2F 00 0D 00 05 00 01 00 17 00 11 00 25 00 29  ; ./...........%.)
  2849  .db 00 0B 00 07 00 1F 00 13                          ; ........

;; Preset 00D "DUEL EFFECT" (algorithm 6601), 93 bytes
PRESET_00D_DUEL_EFFECT_hdr:
  2851  C80D00650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_00D_DUEL_EFFECT:
  2859  66             ?? 66h    f                       
  285a  .db 01                                               ; .
  285b  4455454C2045.. ds "DUEL EFFECT    "              
  286c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  287c  .db 00 00 00 00 00 00 FF 9C 32 00 00 14 08 00 00 41  ; ........2......A
  288c  .db 00 64 00 64 00 64 0C 02 FF 46 00 06 32 00 00 AF  ; .d.d.d...F..2...
  289c  .db 04 00 00 32 00 64 00 64 00 64 00 00 00 00 00 00  ; ...2.d.d.d......
  28ac  .db 00 00 00 00 00 00 00 00 00 00                    ; ..........

;; Preset 00E "SLAP/MICROPITCH" (algorithm 6601), 93 bytes
PRESET_00E_SLAP_MICROPITCH_hdr:
  28b6  C80E00650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_00E_SLAP_MICROPITCH:
  28be  66             ?? 66h    f                       
  28bf  .db 01                                               ; .
  28c0  534C41502F4D.. ds "SLAP/MICROPITCH"              
  28d0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  28e0  .db 00 00 00 00 00 00 00 00 09 32 00 00 00 08 00 00  ; .........2......
  28f0  .db 00 00 64 00 64 00 64 0C 02 FF 5E FF F7 32 00 01  ; ..d.d.d...^..2..
  2900  .db 13 04 00 00 00 00 64 00 64 00 64 00 00 00 00 00  ; ......d.d.d.....
  2910  .db 00 00 00 00 00 00 00 00 00 00 00                 ; ...........

;; Preset 00F "DUAL H910S" (algorithm 6601), 93 bytes
PRESET_00F_DUAL_H910S_hdr:
  291b  C80F00650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_00F_DUAL_H910S:
  2923  66             ?? 66h    f                       
  2924  .db 01 44 55 41 4C 20 48 39 31 30 53 20 20 20 20 20  ; .DUAL H910S     
  2934  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2944  .db 00 00 00 00 00 00 00 00 FF F4 32 00 00 00 08 00  ; ..........2.....
  2954  .db 00 00 00 64 00 64 00 64 2E 00 FF 5F 00 0C 32 00  ; ...d.d.d..._..2.
  2964  .db 00 00 04 00 00 00 00 64 00 64 00 64 00 00 00 00  ; .......d.d.d....
  2974  .db 00 00 00 00 00 00 00 00 00 00 00 00              ; ............

;; Preset 010 "GLITCH SHIFT" (algorithm 6601), 93 bytes
PRESET_010_GLITCH_SHIFT_hdr:
  2980  C81000650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_010_GLITCH_SHIFT:
  2988  66             ?? 66h    f                       
  2989  .db 01                                               ; .
  298a  474C49544348.. ds "GLITCH SHIFT   "              
  299c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  29ac  .db 00 00 00 00 00 FB 50 32 00 00 00 08 00 00 00 00  ; ......P2........
  29bc  .db 64 00 64 00 64 2E 00 FF 5F 04 B0 32 00 00 00 04  ; d.d.d..._..2....
  29cc  .db 00 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00  ; ....d.d.d.......
  29dc  .db 00 00 00 00 00 00 00 00 00                       ; .........

;; Preset 006 "TWELVE STRING" (algorithm 6501), 93 bytes
PRESET_006_TWELVE_STRING_hdr:
  29e5  C80600650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_006_TWELVE_STRING:
  29ed  65             ?? 65h    e                       
  29ee  .db 01                                               ; .
  29ef  5457454C5645.. ds "TWELVE STRING  "              
  2a00  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2a10  .db 00 00 00 00 00 00 FF F4 32 00 00 00 05 78 00 00  ; ........2....x..
  2a20  .db 00 64 00 64 00 64 00 00 FF 32 FB 4B 32 00 00 00  ; .d.d.d...2.K2...
  2a30  .db 05 78 00 00 00 64 00 64 00 64 00 00 00 00 00 00  ; .x...d.d.d......
  2a40  .db 00 00 00 00 00 00 00 00 00 00                    ; ..........

;; Preset 007 "MICROPITCHSHIFT" (algorithm 6501), 93 bytes
PRESET_007_MICROPITCHSHIFT_hdr:
  2a4a  C80700650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_007_MICROPITCHSHIFT:
  2a52  65             ?? 65h    e                       
  2a53  .db 01                                               ; .
  2a54  4D4943524F50.. ds "MICROPITCHSHIFT"              
  2a64  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2a74  .db 00 00 00 00 00 00 00 FF F7 32 00 00 19 05 78 00  ; .........2....x.
  2a84  .db 00 00 64 00 64 00 64 0C 02 FF 32 00 09 32 00 00  ; ..d.d.d...2..2..
  2a94  .db 00 05 78 00 00 00 64 00 64 00 64 00 00 00 00 00  ; ..x...d.d.d.....
  2aa4  .db 00 00 00 00 00 00 00 00 00 00 00                 ; ...........

;; Preset 008 "H949" (algorithm 6501), 93 bytes
PRESET_008_H949_hdr:
  2aaf  C80800650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_008_H949:
  2ab7  65             ?? 65h    e                       
  2ab8  .db 01 48 39 34 39 20 20 20 20 20 20 20 20 20 20 20  ; .H949           
  2ac8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2ad8  .db 00 00 00 00 00 00 00 00 FB 50 32 00 00 19 05 78  ; .........P2....x
  2ae8  .db 00 00 00 64 00 64 00 64 0C 02 FF 32 00 00 32 00  ; ...d.d.d...2..2.
  2af8  .db 01 13 05 78 00 64 00 64 00 64 00 64 00 00 00 00  ; ...x.d.d.d.d....
  2b08  .db 00 00 00 00 00 00 00 00 00 00 00 00              ; ............

;; Preset 009 "MICROPITCH-SLAP" (algorithm 6501), 93 bytes
PRESET_009_MICROPITCH_SLAP_hdr:
  2b14  C80900650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_009_MICROPITCH_SLAP:
  2b1c  65             ?? 65h    e                       
  2b1d  .db 01                                               ; .
  2b1e  4D4943524F50.. ds "MICROPITCH-SLAP"              
  2b30  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2b40  .db 00 00 00 00 00 FF F7 32 00 01 13 05 78 00 00 00  ; .......2....x...
  2b50  .db 64 00 64 00 64 0C 02 FF 32 00 09 32 00 00 00 05  ; d.d.d...2..2....
  2b60  .db 78 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00  ; x...d.d.d.......
  2b70  .db 00 00 00 00 00 00 00 00 00                       ; .........

;; Preset 00A "BIZARRMONIZER" (algorithm 6501), 93 bytes
PRESET_00A_BIZARRMONIZER_hdr:
  2b79  C80A00650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_00A_BIZARRMONIZER:
  2b81  65             ?? 65h    e                       
  2b82  .db 01                                               ; .
  2b83  42495A415252.. ds "BIZARRMONIZER  "              
  2b94  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2ba4  .db 00 00 00 00 00 00 01 2C 32 00 00 28 05 78 00 4B  ; .......,2..(.x.K
  2bb4  .db 00 64 00 64 00 64 0C 01 FF 5E 01 2C 32 00 00 50  ; .d.d.d...^.,2..P
  2bc4  .db 05 78 00 4B 00 64 00 64 00 64 00 00 00 00 00 00  ; .x.K.d.d.d......
  2bd4  .db 00 00 00 00 00 00 00 00 00 00                    ; ..........

;; Preset 00B "ROCK 'N' ROLL" (algorithm 6501), 93 bytes
PRESET_00B_ROCK_N_ROLL_hdr:
  2bde  C80B00650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_00B_ROCK_N_ROLL:
  2be6  65             ?? 65h    e                       
  2be7  .db 01                                               ; .
  2be8  524F434B2027.. ds "ROCK 'N' ROLL  "              
  2bf8  .db 00 00 00 00 00 00 00 05 00 46 00 05 00 46 00 01  ; .........F...F..
  2c08  .db 00 00 00 01 00 00 00 E8 8B 32 00 00 00 05 78 00  ; .........2....x.
  2c18  .db 00 00 64 00 00 00 64 0C 02 FF 5A E8 95 32 00 00  ; ..d...d...Z..2..
  2c28  .db 00 05 78 00 00 00 64 00 00 00 64 24 00 01 00 24  ; ..x...d...d$...$
  2c38  .db 00 01 00 00 00 00 00 00 00 00 00                 ; ...........

;; Preset 00C "BASS SHIFT" (algorithm 6501), 93 bytes
PRESET_00C_BASS_SHIFT_hdr:
  2c43  C80C00650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_00C_BASS_SHIFT:
  2c4b  65             ?? 65h    e                       
  2c4c  .db 01                                               ; .
  2c4d  424153532053.. ds "BASS SHIFT     "              
  2c60  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2c70  .db 00 00 00 00 04 B0 32 00 00 19 05 78 00 00 00 64  ; ......2....x...d
  2c80  .db 00 64 00 64 18 00 FF 32 FF F7 32 00 00 19 05 78  ; .d.d...2..2....x
  2c90  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; ...d.d.d........
  2ca0  .db 00 00 00 00 00 00 00 00                          ; ........

;; Preset 011 "MUSIC SHIFT" (algorithm 6701), 61 bytes
PRESET_011_MUSIC_SHIFT_hdr:
  2ca8  C81100450000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_011_MUSIC_SHIFT:
  2cb0  67             ?? 67h    g                       
  2cb1  .db 01                                               ; .
  2cb2  4D5553494320.. ds "MUSIC SHIFT    "              
  2cc4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2cd4  .db 00 00 00 00 00 00 C8 32 00 00 19 08 00 00 00 00  ; .......2........
  2ce4  .db 64 00 64 00 64 0C 01 FF 14                       ; d.d.d....

;; Preset 012 "VOICE SHIFT" (algorithm 6701), 61 bytes
PRESET_012_VOICE_SHIFT_hdr:
  2ced  C81200450000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_012_VOICE_SHIFT:
  2cf5  67             ?? 67h    g                       
  2cf6  .db 01                                               ; .
  2cf7  564F49434520.. ds "VOICE SHIFT    "              
  2d08  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2d18  .db 00 00 00 00 00 00 00 C8 32 00 00 19 08 00 00 00  ; ........2.......
  2d28  .db 00 64 00 64 00 64 0C 02 00 5A                    ; .d.d.d...Z

;; Preset 013 "CANNONS" (algorithm 6801), 93 bytes
PRESET_013_CANNONS_hdr:
  2d32  C81300650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_013_CANNONS:
  2d3a  68             ?? 68h    h                       
  2d3b  .db 01                                               ; .
  2d3c  43414E4E4F4E.. ds "CANNONS        "              
  2d4c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2d5c  .db 00 00 00 00 00 00 00 00 C8 32 00 00 7C 00 80 00  ; .........2..|...
  2d6c  .db 00 00 64 00 64 00 64 00 00 00 00 FF 38 32 00 00  ; ..d.d.d.....82..
  2d7c  .db F1 00 80 00 64 00 64 00 64 00 64 00 00 00 00 00  ; ....d.d.d.d.....
  2d8c  .db 00 00 00 00 00 00 00 00 00 00 00                 ; ...........

;; Preset 014 "ANTI-AMBIENCE" (algorithm 6801), 93 bytes
PRESET_014_ANTI_AMBIENCE_hdr:
  2d97  C81400650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_014_ANTI_AMBIENCE:
  2d9f  68             ?? 68h    h                       
  2da0  .db 01                                               ; .
  2da1  414E54492D41.. ds "ANTI-AMBIENCE  "              
  2db4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2dc4  .db 00 00 00 00 FF F8 32 00 01 73 00 80 00 46 00 64  ; ......2..s...F.d
  2dd4  .db 00 64 00 64 00 00 00 00 00 09 32 00 00 ED 00 80  ; .d.d......2.....
  2de4  .db 00 46 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; .F.d.d.d........
  2df4  .db 00 00 00 00 00 00 00 00                          ; ........

;; Preset 015 "ALIENS" (algorithm 6801), 93 bytes
PRESET_015_ALIENS_hdr:
  2dfc  C81500650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_015_ALIENS:
  2e04  68             ?? 68h    h                       
  2e05  .db 01                                               ; .
  2e06  414C49454E53.. ds "ALIENS         "              
  2e18  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2e28  .db 00 00 00 00 00 FF 9C 32 00 00 0D 00 80 00 28 00  ; .......2......(.
  2e38  .db 64 00 64 00 64 00 00 00 00 00 64 32 00 00 0B 00  ; d.d.d.....d2....
  2e48  .db 80 00 28 00 64 00 64 00 64 00 00 00 00 00 00 00  ; ..(.d.d.d.......
  2e58  .db 00 00 00 00 00 00 00 00 00                       ; .........

;; Preset 016 "AVANTE-GARDE" (algorithm 6801), 93 bytes
PRESET_016_AVANTE_GARDE_hdr:
  2e61  C81600650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_016_AVANTE_GARDE:
  2e69  68             ?? 68h    h                       
  2e6a  .db 01                                               ; .
  2e6b  4156414E5445.. ds "AVANTE-GARDE   "              
  2e7c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2e8c  .db 00 00 00 00 00 00 FF 9A 32 00 04 4D 00 80 00 64  ; ........2..M...d
  2e9c  .db 00 64 00 64 00 64 00 00 00 00 00 09 32 00 00 98  ; .d.d.d......2...
  2eac  .db 00 80 00 32 00 64 00 64 00 64 00 00 00 00 00 00  ; ...2.d.d.d......
  2ebc  .db 00 00 00 00 00 00 00 00 00 00                    ; ..........

;; Preset 017 "SCARY MOVIE" (algorithm 6801), 93 bytes
PRESET_017_SCARY_MOVIE_hdr:
  2ec6  C81700650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_017_SCARY_MOVIE:
  2ece  68             ?? 68h    h                       
  2ecf  .db 01                                               ; .
  2ed0  534341525920.. ds "SCARY MOVIE    "              
  2ee0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2ef0  .db 00 00 00 00 00 00 00 FB 4E 32 00 04 4C 00 80 00  ; ........N2..L...
  2f00  .db 32 00 64 00 64 00 64 00 00 00 00 00 09 32 00 00  ; 2.d.d.d......2..
  2f10  .db 98 00 80 00 32 00 64 00 64 00 64 00 00 00 00 00  ; ....2.d.d.d.....
  2f20  .db 00 00 00 00 00 00 00 00 00 00 00                 ; ...........

;; Preset 000 "THIRD & FIFTH" (algorithm 6401), 132 bytes
PRESET_000_THIRD_FIFTH_hdr:
  2f2b  C800008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_000_THIRD_FIFTH:
  2f33  64             ?? 64h    d                       
  2f34  .db 01                                               ; .
  2f35  544849524420.. ds "THIRD & FIFTH  "              
  2f48  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2f58  .db 00 00 00 00 09 0B 00 00 00 19 08 00 00 00 00 64  ; ...............d
  2f68  .db 00 64 00 64 0C 02 00 46 00 00 00 00 00 00 00 00  ; .d.d...F........
  2f78  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; ...d.d.d........
  2f88  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2f98  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2fa8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF     ; ...............

;; Preset 001 "THIRD & OCTAVE" (algorithm 6401), 132 bytes
PRESET_001_THIRD_OCTAVE_hdr:
  2fb7  C801008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_001_THIRD_OCTAVE:
  2fbf  64             ?? 64h    d                       
  2fc0  .db 01                                               ; .
  2fc1  544849524420.. ds "THIRD & OCTAVE "              
  2fd4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2fe4  .db 00 00 00 00 00 09 00 00 00 19 08 00 00 00 00 64  ; ...............d
  2ff4  .db 00 64 00 64 0C 02 00 46 00 00 00 00 00 00 00 00  ; .d.d...F........
  3004  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; ...d.d.d........
  3014  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF     ; ...............

;; Preset 002 "JUST 3RD & 5TH" (algorithm 6401), 132 bytes
PRESET_002_JUST_3RD_5TH_hdr:
  3043  C802008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_002_JUST_3RD_5TH:
  304b  64             ?? 64h    d                       
  304c  .db 01                                               ; .
  304d  4A5553542033.. ds "JUST 3RD & 5TH "              
  3060  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3070  .db 00 00 00 00 13 14 00 00 00 19 08 00 00 00 00 64  ; ...............d
  3080  .db 00 64 00 64 0C 02 00 46 00 00 00 00 00 00 00 00  ; .d.d...F........
  3090  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 01 82  ; ...d.d.d........
  30a0  .db 01 55 01 3C 01 3C 01 3C 01 82 01 82 01 82 01 55  ; .U.<.<.<.......U
  30b0  .db 01 3C 01 3C 01 3C 02 BE 02 BE 02 BE 02 BE 02 BE  ; .<.<.<..........
  30c0  .db 02 BE 02 BE 02 BE 02 BE 02 BE 02 8A 02 61 FF     ; .............a.

;; Preset 003 "JUST 4TH & 6TH" (algorithm 6401), 132 bytes
PRESET_003_JUST_4TH_6TH_hdr:
  30cf  C803008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_003_JUST_4TH_6TH:
  30d7  64             ?? 64h    d                       
  30d8  .db 01                                               ; .
  30d9  4A5553542034.. ds "JUST 4TH & 6TH "              
  30ec  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  30fc  .db 00 00 00 00 13 14 00 00 00 19 08 00 00 00 00 64  ; ...............d
  310c  .db 00 64 00 64 0C 02 00 46 00 00 00 00 00 00 00 00  ; .d.d...F........
  311c  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 01 F2  ; ...d.d.d........
  312c  .db 01 F2 01 F2 01 F2 01 F2 01 82 01 64 01 F2 01 F2  ; ...........d....
  313c  .db 01 F2 01 F2 01 F2 03 74 03 74 03 74 03 51 03 2E  ; .......t.t.t.Q..
  314c  .db 03 74 03 74 03 74 03 51 03 2E 03 2E 03 2E FF     ; .t.t.t.Q.......

;; Preset 004 "A MINOR CHORDS" (algorithm 6401), 132 bytes
PRESET_004_A_MINOR_CHORDS_hdr:
  315b  C804008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_004_A_MINOR_CHORDS:
  3163  64             ?? 64h    d                       
  3164  .db 01                                               ; .
  3165  41204D494E4F.. ds "A MINOR CHORDS "              
  3178  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3188  .db 00 00 00 00 09 04 07 00 00 19 08 00 00 14 00 64  ; ...............d
  3198  .db 00 64 00 64 0C 02 00 46 00 00 00 00 00 00 00 00  ; .d.d...F........
  31a8  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; ...d.d.d........
  31b8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  31c8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  31d8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF     ; ...............

;; Preset 005 "PITCH QUANTIZE" (algorithm 6401), 132 bytes
PRESET_005_PITCH_QUANTIZE_hdr:
  31e7  C805008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_005_PITCH_QUANTIZE:
  31ef  64             ?? 64h    d                       
  31f0  .db 01                                               ; .
  31f1  504954434820.. ds "PITCH QUANTIZE "              
  3204  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3214  .db 00 00 00 00 07 07 00 00 00 19 08 00 00 14 00 64  ; ...............d
  3224  .db 00 64 00 64 0C 02 00 46 00 00 00 00 00 00 00 00  ; .d.d...F........
  3234  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; ...d.d.d........
  3244  .db FF 9C 00 00 FF 9C 00 00 00 00 FF 9C 00 00 FF 9C  ; ................
  3254  .db 00 00 FF 9C 00 00 00 00 00 64 00 00 00 64 00 00  ; .........d...d..
  3264  .db 00 00 00 64 00 00 00 64 00 00 00 64 00 00 00     ; ...d...d...d...

;; Preset 026 "BIG SNARE" (algorithm 6B01), 88 bytes
PRESET_026_BIG_SNARE_hdr:
  3273  C82600600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_026_BIG_SNARE:
  327b  6B             ?? 6Bh    k                       
  327c  .db 01                                               ; .
  327d  42494720534E.. ds "BIG SNARE      "              
  3290  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  32a0  .db 00 00 00 00 00 00 00 00 00 64 00 45 00 14 00 01  ; .........d.E....
  32b0  .db 00 0A 00 40 00 80 00 80 FB 00 05 00 14 32 00 05  ; ...@.........2..
  32c0  .db 81 06 65 07 27 07 E1 09 05 09 EF 01 03 00 FE 01  ; ..e.'...........
  32d0  .db 02 00 FD                                         ; ...

;; Preset 027 "GATED REVERB" (algorithm 6B01), 88 bytes
PRESET_027_GATED_REVERB_hdr:
  32d3  C82700600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_027_GATED_REVERB:
  32db  6B             ?? 6Bh    k                       
  32dc  .db 01                                               ; .
  32dd  474154454420.. ds "GATED REVERB   "              
  32f0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3300  .db 00 00 00 00 00 00 00 00 00 64 00 24 00 05 00 02  ; .........d.$....
  3310  .db 00 0A 00 40 00 80 00 80 FB 00 05 00 14 32 00 05  ; ...@.........2..
  3320  .db 81 06 65 07 27 07 E1 09 05 09 EF 01 03 00 FE 01  ; ..e.'...........
  3330  .db 02 00 FD                                         ; ...

;; Preset 028 "WARM HALL" (algorithm 6B01), 88 bytes
PRESET_028_WARM_HALL_hdr:
  3333  C82800600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_028_WARM_HALL:
  333b  6B             ?? 6Bh    k                       
  333c  .db 01                                               ; .
  333d  5741524D2048.. ds "WARM HALL      "              
  3350  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3360  .db 00 00 00 00 00 00 00 00 00 64 00 14 00 00 00 02  ; .........d......
  3370  .db 00 32 00 40 00 80 00 80 FB 00 05 00 14 32 FF 05  ; .2.@.........2..
  3380  .db 81 06 65 07 27 07 E1 09 05 09 EF 01 03 00 FE 01  ; ..e.'...........
  3390  .db 02 00 FD                                         ; ...

;; Preset 029 "SMALL ROOM" (algorithm 6B01), 88 bytes
PRESET_029_SMALL_ROOM_hdr:
  3393  C82900600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_029_SMALL_ROOM:
  339b  6B             ?? 6Bh    k                       
  339c  .db 01                                               ; .
  339d  534D414C4C20.. ds "SMALL ROOM     "              
  33b0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  33c0  .db 00 00 00 00 00 00 00 00 00 64 00 13 00 14 00 01  ; .........d......
  33d0  .db 00 0A 00 40 00 80 00 80 FB 00 05 00 14 32 FF 02  ; ...@.........2..
  33e0  .db BF 03 31 03 91 03 EF 04 81 04 F7 01 02 00 FF 01  ; ..1.............
  33f0  .db 02 00 FF                                         ; ...

;; Preset 02A "BRIGHT ROOM" (algorithm 6B01), 88 bytes
PRESET_02A_BRIGHT_ROOM_hdr:
  33f3  C82A00600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_02A_BRIGHT_ROOM:
  33fb  6B             ?? 6Bh    k                       
  33fc  .db 01                                               ; .
  33fd  425249474854.. ds "BRIGHT ROOM    "              
  3410  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3420  .db 00 00 00 00 00 00 00 00 00 64 00 1C 00 14 00 01  ; .........d......
  3430  .db 00 0A 00 40 00 80 00 80 FB 00 05 00 14 32 FF 04  ; ...@.........2..
  3440  .db 21 04 CB 05 5D 05 E9 06 C3 07 73 01 03 00 00 01  ; !...].....s.....
  3450  .db 02 00 FF                                         ; ...

;; Preset 02B "CANYON" (algorithm 6B01), 88 bytes
PRESET_02B_CANYON_hdr:
  3453  C82B00600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_02B_CANYON:
  345b  6B             ?? 6Bh    k                       
  345c  .db 01                                               ; .
  345d  43414E594F4E.. ds "CANYON         "              
  3470  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3480  .db 00 00 00 00 00 00 00 00 00 64 00 16 00 00 00 01  ; .........d......
  3490  .db 00 0A 00 40 00 80 00 80 FB 00 05 00 14 32 FF 16  ; ...@.........2..
  34a0  .db 05 19 8D 1C 9F 1F 83 24 0F 27 C1 01 03 00 FE 01  ; .......$.'......
  34b0  .db 02 00 FD                                         ; ...

;; Preset 02C "EXPLODING 'VERB" (algorithm 6B01), 88 bytes
PRESET_02C_EXPLODING_VERB_hdr:
  34b3  C82C00600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_02C_EXPLODING_VERB:
  34bb  6B             ?? 6Bh    k                       
  34bc  .db 01                                               ; .
  34bd  4558504C4F44.. ds "EXPLODING 'VERB"              
  34d0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  34e0  .db 00 00 00 00 00 00 00 00 00 64 00 4A 00 09 00 1E  ; .........d.J....
  34f0  .db 00 1E 00 40 00 80 00 80 FB 00 05 00 32 32 00 0B  ; ...@........22..
  3500  .db 01 0C C9 0E 53 0F C1 12 09 13 E1 03 03 00 00 01  ; ....S...........
  3510  .db 02 00 FD                                         ; ...

;; Preset 02D "RICH PLATE" (algorithm 6A01), 97 bytes
PRESET_02D_RICH_PLATE_hdr:
  3513  C82D00690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_02D_RICH_PLATE:
  351b  6A             ?? 6Ah    j                       
  351c  .db 01                                               ; .
  351d  524943482050.. ds "RICH PLATE     "              
  3530  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3540  .db 00 00 00 00 00 2E FF CE 00 06 00 64 00 64 00 64  ; ...........d.d.d
  3550  .db 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00 00  ; ...d............
  3560  .db 00 00 00 4C FF 9C 00 02 00 64 5B 65 71 7F 99 B7  ; ...L.....d[eq...
  3570  .db 28 28 28 28 28 28 12 11 10 0F 0E 0D              ; ((((((......

;; Preset 02E "LOCKER ROOM" (algorithm 6B01), 88 bytes
PRESET_02E_LOCKER_ROOM_hdr:
  357c  C82E00600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_02E_LOCKER_ROOM:
  3584  6B             ?? 6Bh    k                       
  3585  .db 01                                               ; .
  3586  4C4F434B4552.. ds "LOCKER ROOM    "              
  3598  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  35a8  .db 00 00 00 00 00 00 00 00 00 00 64 00 1A 00 1A 00  ; ..........d.....
  35b8  .db 01 00 00 00 40 00 80 00 80 FB 00 05 00 14 32 FF  ; ....@.........2.
  35c8  .db 02 BF 03 31 03 91 03 EF 04 81 04 F7 01 01 00 FE  ; ...1............
  35d8  .db 01 01 00 FE                                      ; ....

;; Preset 02F "DARK ROOM" (algorithm 6B01), 88 bytes
PRESET_02F_DARK_ROOM_hdr:
  35dc  C82F00600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_02F_DARK_ROOM:
  35e4  6B             ?? 6Bh    k                       
  35e5  .db 01                                               ; .
  35e6  4441524B2052.. ds "DARK ROOM      "              
  35f8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3608  .db 00 00 00 00 00 00 00 00 00 00 64 00 1C 00 14 00  ; ..........d.....
  3618  .db 01 00 0A 00 40 00 80 00 80 FB 00 05 00 14 32 FF  ; ....@.........2.
  3628  .db 05 81 06 65 07 27 07 E1 09 05 09 EF 01 01 00 FB  ; ...e.'..........
  3638  .db 01 01 00 FB                                      ; ....

;; Preset 01D "BIG SWEEP" (algorithm 6A01), 97 bytes
PRESET_01D_BIG_SWEEP_hdr:
  363c  C81D00690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_01D_BIG_SWEEP:
  3644  6A             ?? 6Ah    j                       
  3645  .db 01                                               ; .
  3646  424947205357.. ds "BIG SWEEP      "              
  3658  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3668  .db 00 00 00 00 00 00 32 00 64 00 06 00 64 00 64 00  ; ......2.d...d.d.
  3678  .db 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00  ; d...d...........
  3688  .db 00 00 00 FF B0 00 64 00 02 00 64 5B 65 71 7F 99  ; ......d...d[eq..
  3698  .db B7 28 28 28 28 28 28 12 11 10 0F 0E 0D           ; .((((((......

;; Preset 01E "SHIMMERISH" (algorithm 6A01), 97 bytes
PRESET_01E_SHIMMERISH_hdr:
  36a5  C81E00690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_01E_SHIMMERISH:
  36ad  6A             ?? 6Ah    j                       
  36ae  .db 01                                               ; .
  36af  5348494D4D45.. ds "SHIMMERISH     "              
  36c0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  36d0  .db 00 00 00 00 00 00 00 64 00 64 00 0C 00 64 00 64  ; .......d.d...d.d
  36e0  .db 00 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00  ; .d...d..........
  36f0  .db 00 00 00 00 FF B0 00 64 00 02 00 64 46 41 49 3D  ; .......d...dFAI=
  3700  .db 47 3F 28 28 28 28 28 28 14 12 10 0F 13 11        ; G?((((((......

;; Preset 01F "MODWHEEL REVERB" (algorithm 6A01), 97 bytes
PRESET_01F_MODWHEEL_REVERB_hdr:
  370e  C81F00690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_01F_MODWHEEL_REVERB:
  3716  6A             ?? 6Ah    j                       
  3717  .db 01                                               ; .
  3718  4D4F44574845.. ds "MODWHEEL REVERB"              
  3728  .db 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00 00  ; ................
  3738  .db 00 00 00 01 00 00 00 00 32 FF CE 00 06 00 64 00  ; ........2.....d.
  3748  .db 64 00 64 00 14 00 64 00 00 00 00 00 00 00 00 00  ; d.d...d.........
  3758  .db 00 00 00 00 00 00 00 FF 9C 00 02 00 64 5B 65 71  ; ............d[eq
  3768  .db 7F 99 B7 28 28 28 28 28 28 12 11 10 0F 0E 0D     ; ...((((((......

;; Preset 020 "DEATH FLANGE" (algorithm 6A01), 97 bytes
PRESET_020_DEATH_FLANGE_hdr:
  3777  C82000690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_020_DEATH_FLANGE:
  377f  6A             ?? 6Ah    j                       
  3780  .db 01                                               ; .
  3781  444541544820.. ds "DEATH FLANGE   "              
  3794  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  37a4  .db 00 00 00 00 00 00 00 64 00 06 00 64 00 64 00 64  ; .......d...d.d.d
  37b4  .db 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00 00  ; ...d............
  37c4  .db 00 00 FF A6 00 64 00 14 00 64 2D 33 39 3F 4F 5B  ; .....d...d-39?O[
  37d4  .db 28 28 28 28 28 28 14 12 10 0F 11 13              ; ((((((......

;; Preset 021 "THICK LOOP" (algorithm 6A01), 97 bytes
PRESET_021_THICK_LOOP_hdr:
  37e0  C82100690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_021_THICK_LOOP:
  37e8  6A             ?? 6Ah    j                       
  37e9  .db 01                                               ; .
  37ea  544849434B20.. ds "THICK LOOP     "              
  37fc  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  380c  .db 00 00 00 00 00 00 64 00 64 00 0C 00 64 00 64 00  ; ......d.d...d.d.
  381c  .db 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00  ; d...d...........
  382c  .db 00 00 00 FF AC 00 64 00 02 00 64 C8 C5 C3 C2 BB  ; ......d...d.....
  383c  .db C6 28 28 28 28 28 28 14 12 10 13 11 0F           ; .((((((......

;; Preset 022 "DRUM PROCESSOR" (algorithm 6A01), 97 bytes
PRESET_022_DRUM_PROCESSOR_hdr:
  3849  C82200690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_022_DRUM_PROCESSOR:
  3851  6A             ?? 6Ah    j                       
  3852  .db 01                                               ; .
  3853  4452554D2050.. ds "DRUM PROCESSOR "              
  3864  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3874  .db 00 00 00 00 00 00 00 32 00 64 00 32 00 64 00 64  ; .......2.d.2.d.d
  3884  .db 00 64 00 50 00 64 00 00 00 00 00 00 00 00 00 00  ; .d.P.d..........
  3894  .db 00 00 00 00 FF A6 00 64 00 0F 00 64 01 04 03 02  ; .......d...d....
  38a4  .db 05 07 01 02 03 05 07 06 64 17 53 3B 29 23        ; ........d.S;)#

;; Preset 023 "SPACE FLANGE" (algorithm 6A01), 97 bytes
PRESET_023_SPACE_FLANGE_hdr:
  38b2  C82300690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_023_SPACE_FLANGE:
  38ba  6A             ?? 6Ah    j                       
  38bb  .db 01                                               ; .
  38bc  535041434520.. ds "SPACE FLANGE   "              
  38cc  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  38dc  .db 00 00 00 00 00 00 00 00 64 00 64 00 03 00 64 00  ; ........d.d...d.
  38ec  .db 64 00 64 00 19 00 64 00 00 00 00 00 00 00 00 00  ; d.d...d.........
  38fc  .db 00 00 00 00 00 FF AC 00 64 00 64 00 64 00 00 00  ; ........d.d.d...
  390c  .db 00 00 C8 06 06 06 06 06 28 09 08 07 0A 09 09     ; ........(......

;; Preset 024 "MIDI PEDALSWEEP" (algorithm 6A01), 97 bytes
PRESET_024_MIDI_PEDALSWEEP_hdr:
  391b  C82400690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_024_MIDI_PEDALSWEEP:
  3923  6A             ?? 6Ah    j                       
  3924  .db 01                                               ; .
  3925  4D4944492050.. ds "MIDI PEDALSWEEP"              
  3938  .db 00 00 00 00 19 00 00 00 01 00 00 00 01 00 00 00  ; ................
  3948  .db 00 00 00 00 00 00 00 64 00 00 00 1E 00 64 00 64  ; .......d.....d.d
  3958  .db 00 01 00 64 00 00 00 00 00 00 00 00 00 00 00 00  ; ...d............
  3968  .db 00 00 FF B0 00 64 00 00 00 64 02 02 02 02 02 02  ; .....d...d......
  3978  .db 06 06 06 06 06 06 09 08 07 0A 09 09              ; ............

;; Preset 025 "TONAL ROOM" (algorithm 6A01), 97 bytes
PRESET_025_TONAL_ROOM_hdr:
  3984  C82500690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_025_TONAL_ROOM:
  398c  6A             ?? 6Ah    j                       
  398d  .db 01                                               ; .
  398e  544F4E414C20.. ds "TONAL ROOM     "              
  39a0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  39b0  .db 00 00 00 00 00 00 64 00 64 00 64 00 64 00 64 00  ; ......d.d.d.d.d.
  39c0  .db 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00  ; d...d...........
  39d0  .db 00 00 00 FF A6 00 64 00 64 00 64 2D 33 39 3F 4F  ; ......d.d.d-39?O
  39e0  .db 01 28 28 28 28 28 28 00 00 00 00 00 64           ; .((((((.....d

;; Preset 018 "DISCRETE-VERB" (algorithm 6901), 127 bytes
PRESET_018_DISCRETE_VERB_hdr:
  39ed  C81800870000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_018_DISCRETE_VERB:
  39f5  69             ?? 69h    i                       
  39f6  .db 01                                               ; .
  39f7  444953435245.. ds "DISCRETE-VERB  "              
  3a08  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3a18  .db 00 00 00 00 00 00 00 32 00 64 00 0A 00 64 00 64  ; .......2.d...d.d
  3a28  .db 00 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00  ; .d...d..........
  3a38  .db 00 00 00 00 00 64 00 64 00 32 00 64 5A 66 72 7E  ; .....d.d.2.dZfr~
  3a48  .db 9E B6 28 28 28 28 28 28 09 08 07 06 05 04 F5 0B  ; ..((((((........
  3a58  .db F5 0B F5 0B 28 28 28 28 28 28 64 64 64 64 64 64  ; ....((((((dddddd
  3a68  .db 00 50 00 64 00 64 00 64 00 00 00 00              ; .P.d.d.d....

;; Preset 019 "FLANGER" (algorithm 6901), 127 bytes
PRESET_019_FLANGER_hdr:
  3a74  C81900870000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_019_FLANGER:
  3a7c  69             ?? 69h    i                       
  3a7d  .db 01                                               ; .
  3a7e  464C414E4745.. ds "FLANGER        "              
  3a90  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3aa0  .db 00 00 00 00 00 00 00 00 64 00 0A 00 64 00 64 00  ; ........d...d.d.
  3ab0  .db 64 00 14 00 64 00 FF 00 00 00 00 00 00 00 00 00  ; d...d...........
  3ac0  .db 00 00 00 00 64 00 64 00 09 00 64 C8 C8 C8 C8 C8  ; ....d.d...d.....
  3ad0  .db C8 28 28 28 28 28 28 0A 0A 09 09 08 08 F5 0B FC  ; .((((((.........
  3ae0  .db 04 F9 07 64 64 00 00 00 00 64 9C 64 9C 64 9C FF  ; ...dd....d.d.d..
  3af0  .db BA 00 64 00 64 00 64 00 00 00 00                 ; ..d.d.d....

;; Preset 01A "MULTI-FLANGE" (algorithm 6901), 127 bytes
PRESET_01A_MULTI_FLANGE_hdr:
  3afb  C81A00870000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_01A_MULTI_FLANGE:
  3b03  69             ?? 69h    i                       
  3b04  .db 01                                               ; .
  3b05  4D554C54492D.. ds "MULTI-FLANGE   "              
  3b18  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3b28  .db 00 00 00 00 00 00 00 64 00 08 00 64 00 64 00 64  ; .......d...d.d.d
  3b38  .db 00 1A 00 64 00 FF 00 00 00 00 00 00 00 00 00 00  ; ...d............
  3b48  .db 00 00 00 64 00 64 00 1C 00 64 C8 B9 B0 A3 9D 8E  ; ...d.d...d......
  3b58  .db 28 27 26 25 24 23 0A 09 08 07 06 05 F5 0B FC 04  ; ('&%$#..........
  3b68  .db F9 07 32 32 32 32 32 32 64 64 64 64 64 64 FF BA  ; ..222222dddddd..
  3b78  .db 00 64 00 64 00 64 00 00 00 00                    ; .d.d.d....

;; Preset 01B "RICH CHORUS" (algorithm 6901), 127 bytes
PRESET_01B_RICH_CHORUS_hdr:
  3b82  C81B00870000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_01B_RICH_CHORUS:
  3b8a  69             ?? 69h    i                       
  3b8b  .db 01                                               ; .
  3b8c  524943482043.. ds "RICH CHORUS    "              
  3b9c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3bac  .db 00 00 00 00 00 00 00 00 00 00 64 00 19 00 64 00  ; ..........d...d.
  3bbc  .db 64 00 64 00 0F 00 64 00 FF 00 00 00 00 00 00 00  ; d.d...d.........
  3bcc  .db 00 00 00 00 00 00 64 00 64 00 64 00 64 C8 97 6E  ; ......d.d.d.d..n
  3bdc  .db 64 4E 32 28 27 26 25 24 23 0A 09 08 07 06 05 F5  ; dN2('&%$#.......
  3bec  .db 0B FC 04 F9 07 2D 31 3D 37 35 2D 64 9C 64 9C 64  ; .....-1=75-d.d.d
  3bfc  .db 9C 00 00 00 64 00 64 00 64 00 00 00 00           ; ....d.d.d....

;; Preset 01C "FLANGE & REVERB" (algorithm 6901), 127 bytes
PRESET_01C_FLANGE_REVERB_hdr:
  3c09  C81C00870000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_01C_FLANGE_REVERB:
  3c11  69             ?? 69h    i                       
  3c12  .db 01                                               ; .
  3c13  464C414E4745.. ds "FLANGE & REVERB"              
  3c24  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3c34  .db 00 00 00 00 00 00 00 64 00 64 00 0A 00 64 00 64  ; .......d.d...d.d
  3c44  .db 00 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00  ; .d...d..........
  3c54  .db 00 00 00 00 00 64 00 64 00 1E 00 64 00 00 00 41  ; .....d.d...d...A
  3c64  .db 67 2D 07 07 06 28 28 28 09 08 08 01 02 03 F5 F5  ; g-...(((........
  3c74  .db F5 0B 0B 0B 28 28 28 28 28 28 64 64 64 64 64 64  ; ....((((((dddddd
  3c84  .db FF BA 00 64 00 64 00 64 00 00 00 00              ; ...d.d.d....

;; Preset 030 "RANDOM GATE" (algorithm 6C01), 152 bytes
PRESET_030_RANDOM_GATE_hdr:
  3c90  C83000A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_030_RANDOM_GATE:
  3c98  6C             ?? 6Ch    l                       
  3c99  .db 01                                               ; .
  3c9a  52414E444F4D.. ds "RANDOM GATE    "              
  3cac  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3cbc  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3ccc  .db 00 00 64 00 64 00 00 00 00 00 36 00 14 00 64 00  ; ..d.d.....6...d.
  3cdc  .db 00 00 00 00 00 00 00 00 32 00 64 00 C8 00 02 45  ; ........2.d....E
  3cec  .db 02 51 03 79 01 C4 02 EB 01 E5 02 FF 02 6B 02 6D  ; .Q.y.........k.m
  3cfc  .db 04 2C 02 87 01 DD 03 84 03 20 02 BC 03 84 02 94  ; .,....... ......
  3d0c  .db 02 BC 02 58 01 F4 02 58 02 A8 02 58 01 E0 00 FF  ; ...X...X...X....
  3d1c  .db 02 FD 04 FB 06 F9 08 F7 0A F5 00 62 00 2A 00 67  ; ...........b.*.g
  3d2c  .db 00 91 00 0C                                      ; ....

;; Preset 031 "REVERSE GATE" (algorithm 6C01), 152 bytes
PRESET_031_REVERSE_GATE_hdr:
  3d30  C83100A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_031_REVERSE_GATE:
  3d38  6C             ?? 6Ch    l                       
  3d39  .db 01                                               ; .
  3d3a  524556455253.. ds "REVERSE GATE   "              
  3d4c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3d5c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3d6c  .db 00 00 64 00 64 00 00 00 00 00 36 00 14 00 64 00  ; ..d.d.....6...d.
  3d7c  .db 00 00 00 00 00 00 00 00 32 00 64 00 C8 00 04 39  ; ........2.d....9
  3d8c  .db 02 51 03 79 01 C4 02 EB 01 E5 02 FF 02 6B 02 6D  ; .Q.y.........k.m
  3d9c  .db 04 2C 02 87 01 DD 00 50 00 A0 00 F0 01 40 01 90  ; .,.....P.....@..
  3dac  .db 01 E0 02 30 02 80 02 D0 03 20 03 70 03 C0 00 FF  ; ...0..... .p....
  3dbc  .db 02 FD 04 FB 06 F9 08 F7 0A F5 00 62 00 2A 00 67  ; ...........b.*.g
  3dcc  .db 00 91 00 0C                                      ; ....

;; Preset 032 "HUMP-VERB" (algorithm 6C01), 152 bytes
PRESET_032_HUMP_VERB_hdr:
  3dd0  C83200A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_032_HUMP_VERB:
  3dd8  6C             ?? 6Ch    l                       
  3dd9  .db 01                                               ; .
  3dda  48554D502D56.. ds "HUMP-VERB      "              
  3dec  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3dfc  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3e0c  .db 00 00 64 00 64 00 19 00 00 00 37 00 64 00 64 00  ; ..d.d.....7.d.d.
  3e1c  .db 00 00 00 00 00 00 00 00 64 00 64 00 C8 00 00 00  ; ........d.d.....
  3e2c  .db 00 51 00 90 00 5B 00 5C 00 73 00 B0 00 8F 00 B5  ; .Q...[.\.s......
  3e3c  .db 00 A2 01 22 01 A7 01 E4 01 CD 02 09 01 E3 01 E9  ; ..."............
  3e4c  .db 02 07 01 E7 01 FF 02 26 01 EB 01 D8 01 CA F5 0B  ; .......&........
  3e5c  .db F9 00 09 F8 08 FF 0B 06 F6 FB 0B B3 0C 98 0B 91  ; ................
  3e6c  .db 0D 3A 00 0C                                      ; .:..

;; Preset 033 "AMBIENCE" (algorithm 6C01), 152 bytes
PRESET_033_AMBIENCE_hdr:
  3e70  C83300A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_033_AMBIENCE:
  3e78  6C             ?? 6Ch    l                       
  3e79  .db 01                                               ; .
  3e7a  414D4249454E.. ds "AMBIENCE       "              
  3e8c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3e9c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3eac  .db 00 00 64 00 64 00 00 00 00 00 36 00 64 00 64 00  ; ..d.d.....6.d.d.
  3ebc  .db 00 00 00 00 00 00 00 00 64 00 64 00 C8 00 00 D8  ; ........d.d.....
  3ecc  .db 00 76 00 B2 00 5B 00 95 00 60 00 9A 00 7C 00 7C  ; .v...[...`...|.|
  3edc  .db 00 D6 00 80 00 60 03 E8 02 F0 02 00 01 00 00 80  ; .....`..........
  3eec  .db 00 40 00 20 00 10 00 08 00 04 00 02 00 01 F5 0B  ; .@. ............
  3efc  .db F5 0B F5 0B F5 0B F5 0B F5 0B 00 62 00 2A 00 67  ; ...........b.*.g
  3f0c  .db 00 91 00 0C                                      ; ....

;; Preset 034 "FAT SLAP" (algorithm 6C01), 152 bytes
PRESET_034_FAT_SLAP_hdr:
  3f10  C83400A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_034_FAT_SLAP:
  3f18  6C             ?? 6Ch    l                       
  3f19  .db 01                                               ; .
  3f1a  46415420534C.. ds "FAT SLAP       "              
  3f2c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3f3c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3f4c  .db 00 00 64 00 64 00 00 00 00 00 1B 00 64 00 64 00  ; ..d.d.......d.d.
  3f5c  .db 00 00 00 00 00 00 00 00 64 00 64 00 C8 00 00 64  ; ........d.d....d
  3f6c  .db 0A 8C 00 07 00 0C 00 1B 00 17 00 0A 00 13 00 0C  ; ................
  3f7c  .db 00 0E 00 21 00 32 03 C0 03 70 03 20 02 D0 02 80  ; ...!.2...p. ....
  3f8c  .db 02 30 01 E0 01 90 01 40 00 F0 00 A0 00 50 F5 0B  ; .0.....@.....P..
  3f9c  .db F5 0B F5 0B F5 0B F5 0B F5 0B 00 52 00 73 00 2A  ; ...........R.s.*
  3fac  .db 00 67 00 0C                                      ; .g..

;; Preset 038 "MIDIPLEX" (algorithm 6D01), 59 bytes
PRESET_038_MIDIPLEX_hdr:
  3fb0  C83800430000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_038_MIDIPLEX:
  3fb8  6D             ?? 6Dh    m                       
  3fb9  .db 01                                               ; .
  3fba  4D494449504C.. ds "MIDIPLEX       "              
  3fcc  .db 00 00 00 00 00 29 00 00 00 00 00 00 00 00 00 00  ; .....)..........
  3fdc  .db 00 00 00 00 00 00 00 08 00 00 00 00 64 00 64 00  ; ............d.d.
  3fec  .db 64 00 14 00 64 FF 00                             ; d...d..

;; End of record chain
END_OF_CHAIN_hdr:
  3ff3  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3ffb  .db FF FF FF FF FF                                   ; .....
