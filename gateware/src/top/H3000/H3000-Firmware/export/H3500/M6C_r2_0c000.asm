; H3500  block M6C_r2_0c000  M6C_r2_0c000::0000-M6C_r2_0c000::3fff
; Bank r2_0c000 (module id 6C, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 6C parameter/preset table "ULTRA-TAP", 216 bytes
MODULE_6C_TABLE_ULTRA_TAP_hdr:
  0008  6C0000E00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6C_TABLE_ULTRA_TAP:
  0010  6C             ?? 6Ch    l                       
  0011  .db 01                                               ; .
  0012  554C5452412D.. ds "ULTRA-TAP      "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 64 00 64 00 1E 00 64 00 00 00 64 00 64 00  ; ..d.d...d...d.d.
  0054  .db 64 00 64 00 64 00 64 00 64 00 64 00 C8 00 00 01  ; d.d.d.d.d.d.....
  0064  .db 00 02 00 04 00 08 00 10 00 20 00 40 00 80 01 00  ; ......... .@....
  0074  .db 02 00 04 00 08 00 00 50 FF 60 00 F0 FE C0 01 90  ; .......P.`......
  0084  .db FE 20 02 30 FD 80 02 D0 FC E0 03 70 FC 40 F5 F7  ; . .0.......p.@..
  0094  .db F9 FB FD FF 01 03 05 07 09 0B 05 07 05 85 06 83  ; ................
  00a4  .db 07 63 00 0C 02 02 02 02 02 32 00                 ; .c.......2.
  00af  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  00d4  .db 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13 88  ; ................
  00e4  .db 13 88 13 88                                      ; ....

;; Module 6C code record 01, 10342 bytes, entered at payload start
MODULE_6C_01_CODE_hdr:
  00e8  6C01286E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6C_01_entry
MODULE_6C_01_entry:
  00f0  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00F4
  00f4  00F4           dw F4h                            
LAB_M6C_r2_0c000__00f6:
  00f6  3477           PSHS  U Y X B A CC                
  00f8  CC0000         LDD #0x0                          
  00fb  FD70DA         STD 0x70da                        
  00fe  CCFFFF         LDD #0xffff                       
  0101  FD70DE         STD 0x70de                        
  0104  FD70DC         STD 0x70dc                        
  0107  CC0AE0         LDD #0xae0                        
  010a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  010e  6011           addr 6011                         
LAB_M6C_r2_0c000__0110:
  0110  17007A         LBSR 0x018d                       
  0113  1700A3         LBSR 0x01b9                       
  0116  170165         LBSR 0x027e                       
  0119  8603           LDA #0x3                          
  011b  B760DA         STA 0x60da                        
  011e  AD9FFE38       JSR [0xfe38]                      
  0122  B6600A         LDA 0x600a                        
  0125  816C           CMPA #0x6c                        
  0127  2707           BEQ 0x0130                        
  0129  AD9FFED0       JSR [0xfed0]                      
  012d  170027         LBSR 0x0157                       
LAB_M6C_r2_0c000__0130:
  0130  17016D         LBSR 0x02a0                       
  0133  170184         LBSR 0x02ba                       
  0136  8601           LDA #0x1                          
  0138  B76105         STA 0x6105                        
  013b  CC00A0         LDD #0xa0                         
  013e  FD6106         STD 0x6106                        
  0141  AD9FFE36       JSR [0xfe36]                      
  0145  AD9FFDF6       JSR [0xfdf6]                      
  0149  AD9FFE18       JSR [0xfe18]                      
  014d  1704F5         LBSR 0x0645                       
  0150  AD9FFE10       JSR [0xfe10]                      
  0154  3577           PULS CC A B X Y U                 
  0156  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0157
FUN_M6C_r2_0c000__0157:
  0157  3476           PSHS  U Y X B A                   
  0159  C600           LDB #0x0                          
  015b  AD9FFC58       JSR [0xfc58]                      
  015f  C601           LDB #0x1                          
  0161  8E0110         LDX #0x110                        
  0164  AD9FFD30       JSR [0xfd30]                      
  0168  102604A3       LBNE 0x060f                       
  016c  C602           LDB #0x2                          
  016e  8E0111         LDX #0x111                        
  0171  AD9FFD30       JSR [0xfd30]                      
  0175  10260496       LBNE 0x060f                       
  0179  C603           LDB #0x3                          
  017b  8E0112         LDX #0x112                        
  017e  AD9FFD30       JSR [0xfd30]                      
  0182  10260489       LBNE 0x060f                       
  0186  AD9FFD7C       JSR [0xfd7c]                      
  018a  3576           PULS  A B X Y U                   
  018c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__018d
FUN_M6C_r2_0c000__018d:
  018d  3476           PSHS  U Y X B A                   
  018f  CC0000         LDD #0x0                          
  0192  FD7032         STD 0x7032                        
  0195  FD703A         STD 0x703a                        
  0198  FD70CE         STD 0x70ce                        
  019b  FD706E         STD 0x706e                        
  019e  FD7076         STD 0x7076                        
  01a1  FD705A         STD 0x705a                        
  01a4  FD7068         STD 0x7068                        
  01a7  FD70D6         STD 0x70d6                        
  01aa  FD7042         STD 0x7042                        
  01ad  FD7048         STD 0x7048                        
  01b0  FD704E         STD 0x704e                        
  01b3  FD7054         STD 0x7054                        
  01b6  3576           PULS  A B X Y U                   
  01b8  39             RTS                               

; ---- function FUN_M6C_r2_0c000__01b9
FUN_M6C_r2_0c000__01b9:
  01b9  3476           PSHS  U Y X B A                   
  01bb  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:40 1A:46 1B:4C 1C:52
  01bf  19             db 19h                            
  01c0  40             db 40h                            
  01c1  1A             db 1Ah                            
  01c2  46             db 46h                            
  01c3  1B             db 1Bh                            
  01c4  4C             db 4Ch                            
  01c5  1C             db 1Ch                            
  01c6  52             db 52h                            
  01c7  00             db 0h                             
LAB_M6C_r2_0c000__01c8:
  01c8  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 45:58 3D:30 3F:38 49:74 47:6C 53:5E 4B:36 4D:3E 57:7A
  01cc  45             db 45h                            
  01cd  58             db 58h                            
  01ce  3D             db 3Dh                            
  01cf  30             db 30h                            
  01d0  3F             db 3Fh                            
  01d1  38             db 38h                            
  01d2  49             db 49h                            
  01d3  74             db 74h                            
  01d4  47             db 47h                            
  01d5  6C             db 6Ch                            
  01d6  53             db 53h                            
  01d7  5E             db 5Eh                            
  01d8  4B             db 4Bh                            
  01d9  36             db 36h                            
  01da  4D             db 4Dh                            
  01db  3E             db 3Eh                            
  01dc  57             db 57h                            
  01dd  7A             db 7Ah                            
  01de  00             db 0h                             
LAB_M6C_r2_0c000__01df:
  01df  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 55:72 88:C2
  01e3  55             db 55h                            
  01e4  72             db 72h                            
  01e5  88             db 88h                            
  01e6  C2             db C2h                            
  01e7  00             db 0h                             
LAB_M6C_r2_0c000__01e8:
  01e8  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 8A:7C 8B:7E 8C:80 8D:82 8E:84 8F:86 90:88 91:8A 92:8C 93:8E 94:90 95:92 59:66
  01ec  8A             db 8Ah                            
  01ed  7C             db 7Ch                            
  01ee  8B             db 8Bh                            
  01ef  7E             db 7Eh                            
  01f0  8C             db 8Ch                            
  01f1  80             db 80h                            
  01f2  8D             db 8Dh                            
  01f3  82             db 82h                            
  01f4  8E             db 8Eh                            
  01f5  84             db 84h                            
  01f6  8F             db 8Fh                            
  01f7  86             db 86h                            
  01f8  90             db 90h                            
  01f9  88             db 88h                            
  01fa  91             db 91h                            
  01fb  8A             db 8Ah                            
  01fc  92             db 92h                            
  01fd  8C             db 8Ch                            
  01fe  93             db 93h                            
  01ff  8E             db 8Eh                            
  0200  94             db 94h                            
  0201  90             db 90h                            
  0202  95             db 95h                            
  0203  92             db 92h                            
  0204  59             db 59h                            
  0205  66             db 66h                            
  0206  00             db 0h                             
LAB_M6C_r2_0c000__0207:
  0207  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 5A:94 5C:96 5E:98 60:9A 62:9C 64:9E 66:A0 68:A2 6A:A4
  020b  5A             db 5Ah                            
  020c  94             db 94h                            
  020d  5C             db 5Ch                            
  020e  96             db 96h                            
  020f  5E             db 5Eh                            
  0210  98             db 98h                            
  0211  60             db 60h                            
  0212  9A             db 9Ah                            
  0213  62             db 62h                            
  0214  9C             db 9Ch                            
  0215  64             db 64h                            
  0216  9E             db 9Eh                            
  0217  66             db 66h                            
  0218  A0             db A0h                            
  0219  68             db 68h                            
  021a  A2             db A2h                            
  021b  6A             db 6Ah                            
  021c  A4             db A4h                            
  021d  00             db 0h                             
LAB_M6C_r2_0c000__021e:
  021e  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 6C:A6 6E:A8 70:AA 96:C4 98:C6 9A:C8 9C:CA 72:AC 74:AE
  0222  6C             db 6Ch                            
  0223  A6             db A6h                            
  0224  6E             db 6Eh                            
  0225  A8             db A8h                            
  0226  70             db 70h                            
  0227  AA             db AAh                            
  0228  96             db 96h                            
  0229  C4             db C4h                            
  022a  98             db 98h                            
  022b  C6             db C6h                            
  022c  9A             db 9Ah                            
  022d  C8             db C8h                            
  022e  9C             db 9Ch                            
  022f  CA             db CAh                            
  0230  72             db 72h                            
  0231  AC             db ACh                            
  0232  74             db 74h                            
  0233  AE             db AEh                            
  0234  00             db 0h                             
LAB_M6C_r2_0c000__0235:
  0235  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 76:B0 78:B2 7A:B4 7C:B6 7E:B8 80:BA 82:BC 84:BE 86:C0
  0239  76             db 76h                            
  023a  B0             db B0h                            
  023b  78             db 78h                            
  023c  B2             db B2h                            
  023d  7A             db 7Ah                            
  023e  B4             db B4h                            
  023f  7C             db 7Ch                            
  0240  B6             db B6h                            
  0241  7E             db 7Eh                            
  0242  B8             db B8h                            
  0243  80             db 80h                            
  0244  BA             db BAh                            
  0245  82             db 82h                            
  0246  BC             db BCh                            
  0247  84             db 84h                            
  0248  BE             db BEh                            
  0249  86             db 86h                            
  024a  C0             db C0h                            
  024b  00             db 0h                             
LAB_M6C_r2_0c000__024c:
  024c  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 41:CC 9E:D4 43:D2
  0250  41             db 41h                            
  0251  CC             db CCh                            
  0252  9E             db 9Eh                            
  0253  D4             db D4h                            
  0254  43             db 43h                            
  0255  D2             db D2h                            
  0256  00             db 0h                             
LAB_M6C_r2_0c000__0257:
  0257  CC0000         LDD #0x0                          
  025a  FD7060         STD 0x7060                        
  025d  FD7062         STD 0x7062                        
  0260  FD7064         STD 0x7064                        
  0263  CC7FFF         LDD #0x7fff                       
  0266  FD70DA         STD 0x70da                        
  0269  CC012C         LDD #0x12c                        
  026c  FD70E0         STD 0x70e0                        
  026f  CCFFFF         LDD #0xffff                       
  0272  FD70DC         STD 0x70dc                        
  0275  CCFFFF         LDD #0xffff                       
  0278  FD70DE         STD 0x70de                        
  027b  3576           PULS  A B X Y U                   
  027d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__027e
FUN_M6C_r2_0c000__027e:
  027e  3476           PSHS  U Y X B A                   
  0280  CC0000         LDD #0x0                          
  0283  AD9FFC6C       JSR [0xfc6c]                      
  0287  AD9FFC74       JSR [0xfc74]                      
  028b  1722DC         LBSR 0x256a                       
  028e  172354         LBSR 0x25e5                       
  0291  1723CC         LBSR 0x2660                       
  0294  172444         LBSR 0x26db                       
  0297  17218C         LBSR 0x2426                       
  029a  172237         LBSR 0x24d4                       
  029d  3576           PULS  A B X Y U                   
  029f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__02a0
FUN_M6C_r2_0c000__02a0:
  02a0  3476           PSHS  U Y X B A                   
  02a2  1718C6         LBSR 0x1b6b                       
  02a5  170AD1         LBSR 0x0d79                       
  02a8  170A1C         LBSR 0x0cc7                       
  02ab  172542         LBSR 0x27f0                       
  02ae  170958         LBSR 0x0c09                       
  02b1  170CC1         LBSR 0x0f75                       
  02b4  170B7C         LBSR 0x0e33                       
  02b7  3576           PULS  A B X Y U                   
  02b9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__02ba
FUN_M6C_r2_0c000__02ba:
  02ba  3476           PSHS  U Y X B A                   
  02bc  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "diffusor" 21 $1B3E $1B4A
  02c0  00             db 0h                             
  02c1  80             db 80h                            
  02c2  646966667573.. ds "diffusor"                     
  02ca  21             db 21h                            
  02cb  1B3E           addr M6C_r2_0c000::1b3e           
  02cd  1B4A           addr M6C_r2_0c000::1b4a           
LAB_M6C_r2_0c000__02cf:
  02cf  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " delay  " 25 $0BDC $0BE8
  02d3  01             db 1h                             
  02d4  80             db 80h                            
  02d5  2064656C6179.. ds " delay  "                     
  02dd  25             db 25h                            
  02de  0BDC           addr M6C_r2_0c000::0bdc           
  02e0  0BE8           addr M6C_r2_0c000::0be8           
LAB_M6C_r2_0c000__02e2:
  02e2  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "panning " 29 $0F02 $0F0E
  02e6  02             db 2h                             
  02e7  80             db 80h                            
  02e8  70616E6E696E.. ds "panning "                     
  02f0  29             db 29h                            
  02f1  0F02           addr M6C_r2_0c000::0f02           
  02f3  0F0E           addr M6C_r2_0c000::0f0e           
LAB_M6C_r2_0c000__02f5:
  02f5  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "feedback" 2D $0C9A $0CA6
  02f9  03             db 3h                             
  02fa  80             db 80h                            
  02fb  666565646261.. ds "feedback"                     
  0303  2D             db 2Dh                            
  0304  0C9A           addr M6C_r2_0c000::0c9a           
  0306  0CA6           addr M6C_r2_0c000::0ca6           
LAB_M6C_r2_0c000__0308:
  0308  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 " mix 1  " 31 $23F9 $2405
  030c  04             db 4h                             
  030d  80             db 80h                            
  030e  206D69782031.. ds " mix 1  "                     
  0316  31             db 31h                            
  0317  23F9           addr M6C_r2_0c000::23f9           
  0319  2405           addr M6C_r2_0c000::2405           
LAB_M6C_r2_0c000__031b:
  031b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 " mix 2  " 35 $24A7 $24B3
  031f  05             db 5h                             
  0320  80             db 80h                            
  0321  206D69782032.. ds " mix 2  "                     
  0329  35             db 35h                            
  032a  24A7           addr M6C_r2_0c000::24a7           
  032c  24B3           addr M6C_r2_0c000::24b3           
LAB_M6C_r2_0c000__032e:
  032e  CC033F         LDD #0x33f                        
  0331  FD60F5         STD 0x60f5                        
  0334  CC006E         LDD #0x6e                         
  0337  47             ASRA                              
  0338  56             RORB                              
  0339  FD60F7         STD 0x60f7                        
  033c  3576           PULS  A B X Y U                   
  033e  39             RTS                               
  033f  03AD03B803C3.. addr[56]                          
  03af  .db 25 17 02 CB AD 9F FE 10 39                       ; %.......9

; ---- function FUN_M6C_r2_0c000__03b8
FUN_M6C_r2_0c000__03b8:
  03b8  1720C8         LBSR 0x2483                       
  03bb  1702C0         LBSR 0x067e                       
  03be  AD9FFE12       JSR [0xfe12]                      
  03c2  39             RTS                               

; ---- function FUN_M6C_r2_0c000__03c3
FUN_M6C_r2_0c000__03c3:
  03c3  1707F2         LBSR 0x0bb8                       
  03c6  17027C         LBSR 0x0645                       
  03c9  AD9FFE10       JSR [0xfe10]                      
  03cd  39             RTS                               

; ---- function FUN_M6C_r2_0c000__03ce
FUN_M6C_r2_0c000__03ce:
  03ce  171749         LBSR 0x1b1a                       
  03d1  170271         LBSR 0x0645                       
  03d4  AD9FFE12       JSR [0xfe12]                      
  03d8  39             RTS                               

; ---- function FUN_M6C_r2_0c000__03d9
FUN_M6C_r2_0c000__03d9:
  03d9  170B1A         LBSR 0x0ef6                       
  03dc  170266         LBSR 0x0645                       
  03df  AD9FFE14       JSR [0xfe14]                      
  03e3  39             RTS                               

; ---- function FUN_M6C_r2_0c000__03e4
FUN_M6C_r2_0c000__03e4:
  03e4  170A0C         LBSR 0x0df3                       
  03e7  1702CD         LBSR 0x06b7                       
  03ea  AD9FFE10       JSR [0xfe10]                      
  03ee  39             RTS                               

; ---- function FUN_M6C_r2_0c000__03ef
FUN_M6C_r2_0c000__03ef:
  03ef  170BBB         LBSR 0x0fad                       
  03f2  170326         LBSR 0x071b                       
  03f5  AD9FFE10       JSR [0xfe10]                      
  03f9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__03fa
FUN_M6C_r2_0c000__03fa:
  03fa  170F71         LBSR 0x136e                       
  03fd  17031B         LBSR 0x071b                       
  0400  AD9FFE12       JSR [0xfe12]                      
  0404  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0405
FUN_M6C_r2_0c000__0405:
  0405  1712A7         LBSR 0x16af                       
  0408  170310         LBSR 0x071b                       
  040b  AD9FFE14       JSR [0xfe14]                      
  040f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0410
FUN_M6C_r2_0c000__0410:
  0410  171873         LBSR 0x1c86                       
  0413  17039B         LBSR 0x07b1                       
  0416  AD9FFE10       JSR [0xfe10]                      
  041a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__041b
FUN_M6C_r2_0c000__041b:
  041b  17186F         LBSR 0x1c8d                       
  041e  170390         LBSR 0x07b1                       
  0421  AD9FFE12       JSR [0xfe12]                      
  0425  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0426
FUN_M6C_r2_0c000__0426:
  0426  17186B         LBSR 0x1c94                       
  0429  170385         LBSR 0x07b1                       
  042c  AD9FFE14       JSR [0xfe14]                      
  0430  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0431
FUN_M6C_r2_0c000__0431:
  0431  171867         LBSR 0x1c9b                       
  0434  17037A         LBSR 0x07b1                       
  0437  AD9FFE16       JSR [0xfe16]                      
  043b  39             RTS                               

; ---- function FUN_M6C_r2_0c000__043c
FUN_M6C_r2_0c000__043c:
  043c  171863         LBSR 0x1ca2                       
  043f  1703A8         LBSR 0x07ea                       
  0442  AD9FFE10       JSR [0xfe10]                      
  0446  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0447
FUN_M6C_r2_0c000__0447:
  0447  17185F         LBSR 0x1ca9                       
  044a  17039D         LBSR 0x07ea                       
  044d  AD9FFE12       JSR [0xfe12]                      
  0451  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0452
FUN_M6C_r2_0c000__0452:
  0452  17185B         LBSR 0x1cb0                       
  0455  170392         LBSR 0x07ea                       
  0458  AD9FFE14       JSR [0xfe14]                      
  045c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__045d
FUN_M6C_r2_0c000__045d:
  045d  171857         LBSR 0x1cb7                       
  0460  170387         LBSR 0x07ea                       
  0463  AD9FFE16       JSR [0xfe16]                      
  0467  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0468
FUN_M6C_r2_0c000__0468:
  0468  171853         LBSR 0x1cbe                       
  046b  1703B5         LBSR 0x0823                       
  046e  AD9FFE10       JSR [0xfe10]                      
  0472  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0473
FUN_M6C_r2_0c000__0473:
  0473  17184F         LBSR 0x1cc5                       
  0476  1703AA         LBSR 0x0823                       
  0479  AD9FFE12       JSR [0xfe12]                      
  047d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__047e
FUN_M6C_r2_0c000__047e:
  047e  17184B         LBSR 0x1ccc                       
  0481  17039F         LBSR 0x0823                       
  0484  AD9FFE14       JSR [0xfe14]                      
  0488  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0489
FUN_M6C_r2_0c000__0489:
  0489  171847         LBSR 0x1cd3                       
  048c  170394         LBSR 0x0823                       
  048f  AD9FFE16       JSR [0xfe16]                      
  0493  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0494
FUN_M6C_r2_0c000__0494:
  0494  1719EF         LBSR 0x1e86                       
  0497  1703E6         LBSR 0x0880                       
  049a  AD9FFE10       JSR [0xfe10]                      
  049e  39             RTS                               

; ---- function FUN_M6C_r2_0c000__049f
FUN_M6C_r2_0c000__049f:
  049f  1719EB         LBSR 0x1e8d                       
  04a2  1703DB         LBSR 0x0880                       
  04a5  AD9FFE12       JSR [0xfe12]                      
  04a9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04aa
FUN_M6C_r2_0c000__04aa:
  04aa  1719E7         LBSR 0x1e94                       
  04ad  1703D0         LBSR 0x0880                       
  04b0  AD9FFE14       JSR [0xfe14]                      
  04b4  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04b5
FUN_M6C_r2_0c000__04b5:
  04b5  1719E3         LBSR 0x1e9b                       
  04b8  1703C5         LBSR 0x0880                       
  04bb  AD9FFE16       JSR [0xfe16]                      
  04bf  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04c0
FUN_M6C_r2_0c000__04c0:
  04c0  1719DF         LBSR 0x1ea2                       
  04c3  1703F3         LBSR 0x08b9                       
  04c6  AD9FFE10       JSR [0xfe10]                      
  04ca  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04cb
FUN_M6C_r2_0c000__04cb:
  04cb  1719DB         LBSR 0x1ea9                       
  04ce  1703E8         LBSR 0x08b9                       
  04d1  AD9FFE12       JSR [0xfe12]                      
  04d5  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04d6
FUN_M6C_r2_0c000__04d6:
  04d6  1719D7         LBSR 0x1eb0                       
  04d9  1703DD         LBSR 0x08b9                       
  04dc  AD9FFE14       JSR [0xfe14]                      
  04e0  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04e1
FUN_M6C_r2_0c000__04e1:
  04e1  1719D3         LBSR 0x1eb7                       
  04e4  1703D2         LBSR 0x08b9                       
  04e7  AD9FFE16       JSR [0xfe16]                      
  04eb  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04ec
FUN_M6C_r2_0c000__04ec:
  04ec  1719CF         LBSR 0x1ebe                       
  04ef  170400         LBSR 0x08f2                       
  04f2  AD9FFE10       JSR [0xfe10]                      
  04f6  39             RTS                               

; ---- function FUN_M6C_r2_0c000__04f7
FUN_M6C_r2_0c000__04f7:
  04f7  1719CB         LBSR 0x1ec5                       
  04fa  1703F5         LBSR 0x08f2                       
  04fd  AD9FFE12       JSR [0xfe12]                      
  0501  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0502
FUN_M6C_r2_0c000__0502:
  0502  1719C7         LBSR 0x1ecc                       
  0505  1703EA         LBSR 0x08f2                       
  0508  AD9FFE14       JSR [0xfe14]                      
  050c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__050d
FUN_M6C_r2_0c000__050d:
  050d  1719C3         LBSR 0x1ed3                       
  0510  1703DF         LBSR 0x08f2                       
  0513  AD9FFE16       JSR [0xfe16]                      
  0517  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0518
FUN_M6C_r2_0c000__0518:
  0518  171B58         LBSR 0x2073                       
  051b  170431         LBSR 0x094f                       
  051e  AD9FFE10       JSR [0xfe10]                      
  0522  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0523
FUN_M6C_r2_0c000__0523:
  0523  171B54         LBSR 0x207a                       
  0526  170426         LBSR 0x094f                       
  0529  AD9FFE12       JSR [0xfe12]                      
  052d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__052e
FUN_M6C_r2_0c000__052e:
  052e  171B50         LBSR 0x2081                       
  0531  17041B         LBSR 0x094f                       
  0534  AD9FFE14       JSR [0xfe14]                      
  0538  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0539
FUN_M6C_r2_0c000__0539:
  0539  171B4C         LBSR 0x2088                       
  053c  170410         LBSR 0x094f                       
  053f  AD9FFE16       JSR [0xfe16]                      
  0543  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0544
FUN_M6C_r2_0c000__0544:
  0544  171B48         LBSR 0x208f                       
  0547  17043E         LBSR 0x0988                       
  054a  AD9FFE10       JSR [0xfe10]                      
  054e  39             RTS                               

; ---- function FUN_M6C_r2_0c000__054f
FUN_M6C_r2_0c000__054f:
  054f  171B44         LBSR 0x2096                       
  0552  170433         LBSR 0x0988                       
  0555  AD9FFE12       JSR [0xfe12]                      
  0559  39             RTS                               

; ---- function FUN_M6C_r2_0c000__055a
FUN_M6C_r2_0c000__055a:
  055a  171B40         LBSR 0x209d                       
  055d  170428         LBSR 0x0988                       
  0560  AD9FFE14       JSR [0xfe14]                      
  0564  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0565
FUN_M6C_r2_0c000__0565:
  0565  171B3C         LBSR 0x20a4                       
  0568  17041D         LBSR 0x0988                       
  056b  AD9FFE16       JSR [0xfe16]                      
  056f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0570
FUN_M6C_r2_0c000__0570:
  0570  171B38         LBSR 0x20ab                       
  0573  17044B         LBSR 0x09c1                       
  0576  AD9FFE10       JSR [0xfe10]                      
  057a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__057b
FUN_M6C_r2_0c000__057b:
  057b  171B34         LBSR 0x20b2                       
  057e  170440         LBSR 0x09c1                       
  0581  AD9FFE12       JSR [0xfe12]                      
  0585  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0586
FUN_M6C_r2_0c000__0586:
  0586  171B30         LBSR 0x20b9                       
  0589  170435         LBSR 0x09c1                       
  058c  AD9FFE14       JSR [0xfe14]                      
  0590  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0591
FUN_M6C_r2_0c000__0591:
  0591  171B2C         LBSR 0x20c0                       
  0594  17042A         LBSR 0x09c1                       
  0597  AD9FFE16       JSR [0xfe16]                      
  059b  39             RTS                               

; ---- function FUN_M6C_r2_0c000__059c
FUN_M6C_r2_0c000__059c:
  059c  171C8A         LBSR 0x2229                       
  059f  17047C         LBSR 0x0a1e                       
  05a2  AD9FFE10       JSR [0xfe10]                      
  05a6  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05a7
FUN_M6C_r2_0c000__05a7:
  05a7  171C86         LBSR 0x2230                       
  05aa  170471         LBSR 0x0a1e                       
  05ad  AD9FFE12       JSR [0xfe12]                      
  05b1  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05b2
FUN_M6C_r2_0c000__05b2:
  05b2  171C82         LBSR 0x2237                       
  05b5  170466         LBSR 0x0a1e                       
  05b8  AD9FFE14       JSR [0xfe14]                      
  05bc  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05bd
FUN_M6C_r2_0c000__05bd:
  05bd  171C7E         LBSR 0x223e                       
  05c0  17045B         LBSR 0x0a1e                       
  05c3  AD9FFE16       JSR [0xfe16]                      
  05c7  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05c8
FUN_M6C_r2_0c000__05c8:
  05c8  1706AB         LBSR 0x0c76                       
  05cb  170077         LBSR 0x0645                       
  05ce  AD9FFE16       JSR [0xfe16]                      
  05d2  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05d3
FUN_M6C_r2_0c000__05d3:
  05d3  17076A         LBSR 0x0d40                       
  05d6  1700DE         LBSR 0x06b7                       
  05d9  AD9FFE12       JSR [0xfe12]                      
  05dd  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05de
FUN_M6C_r2_0c000__05de:
  05de  171F50         LBSR 0x2531                       
  05e1  170497         LBSR 0x0a7b                       
  05e4  AD9FFE10       JSR [0xfe10]                      
  05e8  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05e9
FUN_M6C_r2_0c000__05e9:
  05e9  171FC0         LBSR 0x25ac                       
  05ec  17048C         LBSR 0x0a7b                       
  05ef  AD9FFE12       JSR [0xfe12]                      
  05f3  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05f4
FUN_M6C_r2_0c000__05f4:
  05f4  172030         LBSR 0x2627                       
  05f7  1704B3         LBSR 0x0aad                       
  05fa  AD9FFE10       JSR [0xfe10]                      
  05fe  39             RTS                               

; ---- function FUN_M6C_r2_0c000__05ff
FUN_M6C_r2_0c000__05ff:
  05ff  1720A0         LBSR 0x26a2                       
  0602  1704A8         LBSR 0x0aad                       
  0605  AD9FFE12       JSR [0xfe12]                      
  0609  39             RTS                               

; ---- function FUN_M6C_r2_0c000__060a
FUN_M6C_r2_0c000__060a:
  060a  AD9FFDFC       JSR [0xfdfc]                      
  060e  39             RTS                               
LAB_M6C_r2_0c000__060f:
  060f  C600           LDB #0x0                          
  0611  AD9FFC36       JSR [0xfc36]                      
  0615  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0619  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M6C_r2_0c000__0642:
  0642  3577           PULS CC A B X Y U                 
  0644  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0645
FUN_M6C_r2_0c000__0645:
  0645  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "m delay " "diffusor" " width  " "feedback"
  0649  6D2064656C61.. ds "m delay "                     
  0651  646966667573.. ds "diffusor"                     
  0659  207769647468.. ds " width  "                     
  0661  666565646261.. ds "feedback"                     
LAB_M6C_r2_0c000__0669:
  0669  AD9FFDF2       JSR [0xfdf2]                      
  066d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0BAC ->$1B0E ->$0EDE ->$0C6A ->$067E ->$067E
  0671  0BAC           addr M6C_r2_0c000::0bac           
  0673  1B0E           addr M6C_r2_0c000::1b0e           
  0675  0EDE           addr M6C_r2_0c000::0ede           
  0677  0C6A           addr M6C_r2_0c000::0c6a           
  0679  067E           addr M6C_r2_0c000::067e           
  067b  067E           addr M6C_r2_0c000::067e           
LAB_M6C_r2_0c000__067d:
  067d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__067e
FUN_M6C_r2_0c000__067e:
  067e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" " levels " " expert "
  0682  6C656674206D.. ds "left mix"                     
  068a  72696768746D.. ds "rightmix"                     
  0692  206C6576656C.. ds " levels "                     
  069a  206578706572.. ds " expert "                     
LAB_M6C_r2_0c000__06a2:
  06a2  AD9FFDF2       JSR [0xfdf2]                      
  06a6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$23C9 ->$2477 ->$0A7B ->$06B7 ->$0645 ->$0645
  06aa  23C9           addr M6C_r2_0c000::23c9           
  06ac  2477           addr M6C_r2_0c000::2477           
  06ae  0A7B           addr M6C_r2_0c000::0a7b           
  06b0  06B7           addr M6C_r2_0c000::06b7           
  06b2  0645           addr M6C_r2_0c000::0645           
  06b4  0645           addr M6C_r2_0c000::0645           
LAB_M6C_r2_0c000__06b6:
  06b6  39             RTS                               

; ---- function FUN_M6C_r2_0c000__06b7
FUN_M6C_r2_0c000__06b7:
  06b7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "st/mono " " fb tap " [*] " return "
  06bb  73742F6D6F6E.. ds "st/mono "                     
  06c3  206662207461.. ds " fb tap "                     
  06cb  01             db 1h                             
  06cc  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__06d4:
  06d4  AD9FFDF2       JSR [0xfdf2]                      
  06d8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0DDB ->$0D34 ->$0ADF ->$067E ->$06E9 ->$06E9
  06dc  0DDB           addr M6C_r2_0c000::0ddb           
  06de  0D34           addr M6C_r2_0c000::0d34           
  06e0  0ADF           addr M6C_r2_0c000::0adf           
  06e2  067E           addr M6C_r2_0c000::067e           
  06e4  06E9           addr M6C_r2_0c000::06e9           
  06e6  06E9           addr M6C_r2_0c000::06e9           
LAB_M6C_r2_0c000__06e8:
  06e8  39             RTS                               

; ---- function FUN_M6C_r2_0c000__06e9
FUN_M6C_r2_0c000__06e9:
  06e9  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "quickset" " tedium " [*] " return "
  06ed  717569636B73.. ds "quickset"                     
  06f5  207465646975.. ds " tedium "                     
  06fd  01             db 1h                             
  06fe  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__0706:
  0706  AD9FFDF2       JSR [0xfdf2]                      
  070a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$071B ->$0754 ->$0ADF ->$067E ->$06B7 ->$06B7
  070e  071B           addr M6C_r2_0c000::071b           
  0710  0754           addr M6C_r2_0c000::0754           
  0712  0ADF           addr M6C_r2_0c000::0adf           
  0714  067E           addr M6C_r2_0c000::067e           
  0716  06B7           addr M6C_r2_0c000::06b7           
  0718  06B7           addr M6C_r2_0c000::06b7           
LAB_M6C_r2_0c000__071a:
  071a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__071b
FUN_M6C_r2_0c000__071b:
  071b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "spacing " "weights " " pans   " " return "
  071f  73706163696E.. ds "spacing "                     
  0727  776569676874.. ds "weights "                     
  072f  2070616E7320.. ds " pans   "                     
  0737  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__073f:
  073f  AD9FFDF2       JSR [0xfdf2]                      
  0743  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0FC2 ->$1383 ->$16C4 ->$06E9 ->$071B ->$071B
  0747  0FC2           addr M6C_r2_0c000::0fc2           
  0749  1383           addr M6C_r2_0c000::1383           
  074b  16C4           addr M6C_r2_0c000::16c4           
  074d  06E9           addr M6C_r2_0c000::06e9           
  074f  071B           addr M6C_r2_0c000::071b           
  0751  071B           addr M6C_r2_0c000::071b           
LAB_M6C_r2_0c000__0753:
  0753  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0754
FUN_M6C_r2_0c000__0754:
  0754  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "tapdelay" "taplevel" "pan taps" "apdelays"
  0758  74617064656C.. ds "tapdelay"                     
  0760  7461706C6576.. ds "taplevel"                     
  0768  70616E207461.. ds "pan taps"                     
  0770  617064656C61.. ds "apdelays"                     
LAB_M6C_r2_0c000__0778:
  0778  AD9FFDF2       JSR [0xfdf2]                      
  077c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$07B1 ->$0880 ->$094F ->$0A1E ->$078D ->$078D
  0780  07B1           addr M6C_r2_0c000::07b1           
  0782  0880           addr M6C_r2_0c000::0880           
  0784  094F           addr M6C_r2_0c000::094f           
  0786  0A1E           addr M6C_r2_0c000::0a1e           
  0788  078D           addr M6C_r2_0c000::078d           
  078a  078D           addr M6C_r2_0c000::078d           
LAB_M6C_r2_0c000__078c:
  078c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__078d
FUN_M6C_r2_0c000__078d:
  078d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0791  01             db 1h                             
  0792  01             db 1h                             
  0793  01             db 1h                             
  0794  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__079c:
  079c  AD9FFDF2       JSR [0xfdf2]                      
  07a0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$06E9 ->$0754 ->$0754
  07a4  0ADF           addr M6C_r2_0c000::0adf           
  07a6  0ADF           addr M6C_r2_0c000::0adf           
  07a8  0ADF           addr M6C_r2_0c000::0adf           
  07aa  06E9           addr M6C_r2_0c000::06e9           
  07ac  0754           addr M6C_r2_0c000::0754           
  07ae  0754           addr M6C_r2_0c000::0754           
LAB_M6C_r2_0c000__07b0:
  07b0  39             RTS                               

; ---- function FUN_M6C_r2_0c000__07b1
FUN_M6C_r2_0c000__07b1:
  07b1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 "
  07b5  64656C617920.. ds "delay 1 "                     
  07bd  64656C617920.. ds "delay 2 "                     
  07c5  64656C617920.. ds "delay 3 "                     
  07cd  64656C617920.. ds "delay 4 "                     
LAB_M6C_r2_0c000__07d5:
  07d5  AD9FFDF2       JSR [0xfdf2]                      
  07d9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D08 ->$1D0F ->$1D16 ->$1D1D ->$07EA ->$085C
  07dd  1D08           addr M6C_r2_0c000::1d08           
  07df  1D0F           addr M6C_r2_0c000::1d0f           
  07e1  1D16           addr M6C_r2_0c000::1d16           
  07e3  1D1D           addr M6C_r2_0c000::1d1d           
  07e5  07EA           addr M6C_r2_0c000::07ea           
  07e7  085C           addr M6C_r2_0c000::085c           
LAB_M6C_r2_0c000__07e9:
  07e9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__07ea
FUN_M6C_r2_0c000__07ea:
  07ea  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 5 " "delay 6 " "delay 7 " "delay 8 "
  07ee  64656C617920.. ds "delay 5 "                     
  07f6  64656C617920.. ds "delay 6 "                     
  07fe  64656C617920.. ds "delay 7 "                     
  0806  64656C617920.. ds "delay 8 "                     
LAB_M6C_r2_0c000__080e:
  080e  AD9FFDF2       JSR [0xfdf2]                      
  0812  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D24 ->$1D2B ->$1D32 ->$1D39 ->$0823 ->$07B1
  0816  1D24           addr M6C_r2_0c000::1d24           
  0818  1D2B           addr M6C_r2_0c000::1d2b           
  081a  1D32           addr M6C_r2_0c000::1d32           
  081c  1D39           addr M6C_r2_0c000::1d39           
  081e  0823           addr M6C_r2_0c000::0823           
  0820  07B1           addr M6C_r2_0c000::07b1           
LAB_M6C_r2_0c000__0822:
  0822  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0823
FUN_M6C_r2_0c000__0823:
  0823  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 9 " "delay 10" "delay 11" "delay 12"
  0827  64656C617920.. ds "delay 9 "                     
  082f  64656C617920.. ds "delay 10"                     
  0837  64656C617920.. ds "delay 11"                     
  083f  64656C617920.. ds "delay 12"                     
LAB_M6C_r2_0c000__0847:
  0847  AD9FFDF2       JSR [0xfdf2]                      
  084b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D40 ->$1D47 ->$1D4E ->$1D55 ->$085C ->$07EA
  084f  1D40           addr M6C_r2_0c000::1d40           
  0851  1D47           addr M6C_r2_0c000::1d47           
  0853  1D4E           addr M6C_r2_0c000::1d4e           
  0855  1D55           addr M6C_r2_0c000::1d55           
  0857  085C           addr M6C_r2_0c000::085c           
  0859  07EA           addr M6C_r2_0c000::07ea           
LAB_M6C_r2_0c000__085b:
  085b  39             RTS                               

; ---- function FUN_M6C_r2_0c000__085c
FUN_M6C_r2_0c000__085c:
  085c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0860  01             db 1h                             
  0861  01             db 1h                             
  0862  01             db 1h                             
  0863  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__086b:
  086b  AD9FFDF2       JSR [0xfdf2]                      
  086f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$07B1 ->$0823
  0873  0ADF           addr M6C_r2_0c000::0adf           
  0875  0ADF           addr M6C_r2_0c000::0adf           
  0877  0ADF           addr M6C_r2_0c000::0adf           
  0879  0754           addr M6C_r2_0c000::0754           
  087b  07B1           addr M6C_r2_0c000::07b1           
  087d  0823           addr M6C_r2_0c000::0823           
LAB_M6C_r2_0c000__087f:
  087f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0880
FUN_M6C_r2_0c000__0880:
  0880  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " tap 1  " " tap 2  " " tap 3  " " tap 4  "
  0884  207461702031.. ds " tap 1  "                     
  088c  207461702032.. ds " tap 2  "                     
  0894  207461702033.. ds " tap 3  "                     
  089c  207461702034.. ds " tap 4  "                     
LAB_M6C_r2_0c000__08a4:
  08a4  AD9FFDF2       JSR [0xfdf2]                      
  08a8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1F08 ->$1F0F ->$1F16 ->$1F1D ->$08B9 ->$092B
  08ac  1F08           addr M6C_r2_0c000::1f08           
  08ae  1F0F           addr M6C_r2_0c000::1f0f           
  08b0  1F16           addr M6C_r2_0c000::1f16           
  08b2  1F1D           addr M6C_r2_0c000::1f1d           
  08b4  08B9           addr M6C_r2_0c000::08b9           
  08b6  092B           addr M6C_r2_0c000::092b           
LAB_M6C_r2_0c000__08b8:
  08b8  39             RTS                               

; ---- function FUN_M6C_r2_0c000__08b9
FUN_M6C_r2_0c000__08b9:
  08b9  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " tap 5  " " tap 6  " " tap 7  " " tap 8  "
  08bd  207461702035.. ds " tap 5  "                     
  08c5  207461702036.. ds " tap 6  "                     
  08cd  207461702037.. ds " tap 7  "                     
  08d5  207461702038.. ds " tap 8  "                     
LAB_M6C_r2_0c000__08dd:
  08dd  AD9FFDF2       JSR [0xfdf2]                      
  08e1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1F24 ->$1F2B ->$1F32 ->$1F39 ->$08F2 ->$0880
  08e5  1F24           addr M6C_r2_0c000::1f24           
  08e7  1F2B           addr M6C_r2_0c000::1f2b           
  08e9  1F32           addr M6C_r2_0c000::1f32           
  08eb  1F39           addr M6C_r2_0c000::1f39           
  08ed  08F2           addr M6C_r2_0c000::08f2           
  08ef  0880           addr M6C_r2_0c000::0880           
LAB_M6C_r2_0c000__08f1:
  08f1  39             RTS                               

; ---- function FUN_M6C_r2_0c000__08f2
FUN_M6C_r2_0c000__08f2:
  08f2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " tap 9  " " tap 10 " " tap 11 " " tap 12 "
  08f6  207461702039.. ds " tap 9  "                     
  08fe  207461702031.. ds " tap 10 "                     
  0906  207461702031.. ds " tap 11 "                     
  090e  207461702031.. ds " tap 12 "                     
LAB_M6C_r2_0c000__0916:
  0916  AD9FFDF2       JSR [0xfdf2]                      
  091a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1F40 ->$1F47 ->$1F4E ->$1F55 ->$092B ->$08B9
  091e  1F40           addr M6C_r2_0c000::1f40           
  0920  1F47           addr M6C_r2_0c000::1f47           
  0922  1F4E           addr M6C_r2_0c000::1f4e           
  0924  1F55           addr M6C_r2_0c000::1f55           
  0926  092B           addr M6C_r2_0c000::092b           
  0928  08B9           addr M6C_r2_0c000::08b9           
LAB_M6C_r2_0c000__092a:
  092a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__092b
FUN_M6C_r2_0c000__092b:
  092b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  092f  01             db 1h                             
  0930  01             db 1h                             
  0931  01             db 1h                             
  0932  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__093a:
  093a  AD9FFDF2       JSR [0xfdf2]                      
  093e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$0880 ->$08F2
  0942  0ADF           addr M6C_r2_0c000::0adf           
  0944  0ADF           addr M6C_r2_0c000::0adf           
  0946  0ADF           addr M6C_r2_0c000::0adf           
  0948  0754           addr M6C_r2_0c000::0754           
  094a  0880           addr M6C_r2_0c000::0880           
  094c  08F2           addr M6C_r2_0c000::08f2           
LAB_M6C_r2_0c000__094e:
  094e  39             RTS                               

; ---- function FUN_M6C_r2_0c000__094f
FUN_M6C_r2_0c000__094f:
  094f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  "
  0953  2070616E2031.. ds " pan 1  "                     
  095b  2070616E2032.. ds " pan 2  "                     
  0963  2070616E2033.. ds " pan 3  "                     
  096b  2070616E2034.. ds " pan 4  "                     
LAB_M6C_r2_0c000__0973:
  0973  AD9FFDF2       JSR [0xfdf2]                      
  0977  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$20F5 ->$20FC ->$2103 ->$210A ->$0988 ->$09FA
  097b  20F5           addr M6C_r2_0c000::20f5           
  097d  20FC           addr M6C_r2_0c000::20fc           
  097f  2103           addr M6C_r2_0c000::2103           
  0981  210A           addr M6C_r2_0c000::210a           
  0983  0988           addr M6C_r2_0c000::0988           
  0985  09FA           addr M6C_r2_0c000::09fa           
LAB_M6C_r2_0c000__0987:
  0987  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0988
FUN_M6C_r2_0c000__0988:
  0988  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 5  " " pan 6  " " pan 7  " " pan 8  "
  098c  2070616E2035.. ds " pan 5  "                     
  0994  2070616E2036.. ds " pan 6  "                     
  099c  2070616E2037.. ds " pan 7  "                     
  09a4  2070616E2038.. ds " pan 8  "                     
LAB_M6C_r2_0c000__09ac:
  09ac  AD9FFDF2       JSR [0xfdf2]                      
  09b0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2111 ->$2118 ->$211F ->$2126 ->$09C1 ->$094F
  09b4  2111           addr M6C_r2_0c000::2111           
  09b6  2118           addr M6C_r2_0c000::2118           
  09b8  211F           addr M6C_r2_0c000::211f           
  09ba  2126           addr M6C_r2_0c000::2126           
  09bc  09C1           addr M6C_r2_0c000::09c1           
  09be  094F           addr M6C_r2_0c000::094f           
LAB_M6C_r2_0c000__09c0:
  09c0  39             RTS                               

; ---- function FUN_M6C_r2_0c000__09c1
FUN_M6C_r2_0c000__09c1:
  09c1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 9  " " pan 10 " " pan 11 " " pan 12 "
  09c5  2070616E2039.. ds " pan 9  "                     
  09cd  2070616E2031.. ds " pan 10 "                     
  09d5  2070616E2031.. ds " pan 11 "                     
  09dd  2070616E2031.. ds " pan 12 "                     
LAB_M6C_r2_0c000__09e5:
  09e5  AD9FFDF2       JSR [0xfdf2]                      
  09e9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$212D ->$2134 ->$213B ->$2142 ->$09FA ->$0988
  09ed  212D           addr M6C_r2_0c000::212d           
  09ef  2134           addr M6C_r2_0c000::2134           
  09f1  213B           addr M6C_r2_0c000::213b           
  09f3  2142           addr M6C_r2_0c000::2142           
  09f5  09FA           addr M6C_r2_0c000::09fa           
  09f7  0988           addr M6C_r2_0c000::0988           
LAB_M6C_r2_0c000__09f9:
  09f9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__09fa
FUN_M6C_r2_0c000__09fa:
  09fa  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  09fe  01             db 1h                             
  09ff  01             db 1h                             
  0a00  01             db 1h                             
  0a01  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__0a09:
  0a09  AD9FFDF2       JSR [0xfdf2]                      
  0a0d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$094F ->$09C1
  0a11  0ADF           addr M6C_r2_0c000::0adf           
  0a13  0ADF           addr M6C_r2_0c000::0adf           
  0a15  0ADF           addr M6C_r2_0c000::0adf           
  0a17  0754           addr M6C_r2_0c000::0754           
  0a19  094F           addr M6C_r2_0c000::094f           
  0a1b  09C1           addr M6C_r2_0c000::09c1           
LAB_M6C_r2_0c000__0a1d:
  0a1d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0a1e
FUN_M6C_r2_0c000__0a1e:
  0a1e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "apdelay1" "apdelay2" "apdelay3" "apdelay4"
  0a22  617064656C61.. ds "apdelay1"                     
  0a2a  617064656C61.. ds "apdelay2"                     
  0a32  617064656C61.. ds "apdelay3"                     
  0a3a  617064656C61.. ds "apdelay4"                     
LAB_M6C_r2_0c000__0a42:
  0a42  AD9FFDF2       JSR [0xfdf2]                      
  0a46  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2273 ->$227A ->$2281 ->$2288 ->$0A57 ->$0A57
  0a4a  2273           addr M6C_r2_0c000::2273           
  0a4c  227A           addr M6C_r2_0c000::227a           
  0a4e  2281           addr M6C_r2_0c000::2281           
  0a50  2288           addr M6C_r2_0c000::2288           
  0a52  0A57           addr M6C_r2_0c000::0a57           
  0a54  0A57           addr M6C_r2_0c000::0a57           
LAB_M6C_r2_0c000__0a56:
  0a56  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0a57
FUN_M6C_r2_0c000__0a57:
  0a57  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0a5b  01             db 1h                             
  0a5c  01             db 1h                             
  0a5d  01             db 1h                             
  0a5e  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__0a66:
  0a66  AD9FFDF2       JSR [0xfdf2]                      
  0a6a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ADF ->$0ADF ->$0ADF ->$0754 ->$0A1E ->$0A1E
  0a6e  0ADF           addr M6C_r2_0c000::0adf           
  0a70  0ADF           addr M6C_r2_0c000::0adf           
  0a72  0ADF           addr M6C_r2_0c000::0adf           
  0a74  0754           addr M6C_r2_0c000::0754           
  0a76  0A1E           addr M6C_r2_0c000::0a1e           
  0a78  0A1E           addr M6C_r2_0c000::0a1e           
LAB_M6C_r2_0c000__0a7a:
  0a7a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0a7b
FUN_M6C_r2_0c000__0a7b:
  0a7b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  0a7f  6C6566742069.. ds "left in "                     
  0a87  726967687420.. ds "right in"                     
  0a8f  01             db 1h                             
  0a90  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__0a98:
  0a98  AD9FFDF2       JSR [0xfdf2]                      
  0a9c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2525 ->$25A0 ->$0ADF ->$067E ->$0AAD ->$0AAD
  0aa0  2525           addr M6C_r2_0c000::2525           
  0aa2  25A0           addr M6C_r2_0c000::25a0           
  0aa4  0ADF           addr M6C_r2_0c000::0adf           
  0aa6  067E           addr M6C_r2_0c000::067e           
  0aa8  0AAD           addr M6C_r2_0c000::0aad           
  0aaa  0AAD           addr M6C_r2_0c000::0aad           
LAB_M6C_r2_0c000__0aac:
  0aac  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0aad
FUN_M6C_r2_0c000__0aad:
  0aad  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  0ab1  6C656674206F.. ds "left out"                     
  0ab9  72696768746F.. ds "rightout"                     
  0ac1  01             db 1h                             
  0ac2  207265747572.. ds " return "                     
LAB_M6C_r2_0c000__0aca:
  0aca  AD9FFDF2       JSR [0xfdf2]                      
  0ace  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$261B ->$2696 ->$0ADF ->$067E ->$0A7B ->$0A7B
  0ad2  261B           addr M6C_r2_0c000::261b           
  0ad4  2696           addr M6C_r2_0c000::2696           
  0ad6  0ADF           addr M6C_r2_0c000::0adf           
  0ad8  067E           addr M6C_r2_0c000::067e           
  0ada  0A7B           addr M6C_r2_0c000::0a7b           
  0adc  0A7B           addr M6C_r2_0c000::0a7b           
LAB_M6C_r2_0c000__0ade:
  0ade  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0adf
FUN_M6C_r2_0c000__0adf:
  0adf  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0ae0
FUN_M6C_r2_0c000__0ae0:
  0ae0  3476           PSHS  U Y X B A                   
  0ae2  FC70DE         LDD 0x70de                        
  0ae5  10830000       CMPD #0x0                         
  0ae9  1027000E       LBEQ 0x0afb                       
  0aed  FC70DC         LDD 0x70dc                        
  0af0  10830000       CMPD #0x0                         
  0af4  1027004D       LBEQ 0x0b45                       
  0af8  160088         LBRA 0x0b83                       
LAB_M6C_r2_0c000__0afb:
  0afb  FC70DA         LDD 0x70da                        
  0afe  B370E0         SUBD 0x70e0                       
  0b01  FD70DA         STD 0x70da                        
  0b04  2F15           BLE 0x0b1b                        
  0b06  CC000A         LDD #0xa                          
  0b09  AD9FFD20       JSR [0xfd20]                      
  0b0d  108E0440       LDY #0x440                        
  0b11  FC70DA         LDD 0x70da                        
  0b14  AD9FFD2E       JSR [0xfd2e]                      
  0b18  160068         LBRA 0x0b83                       
LAB_M6C_r2_0c000__0b1b:
  0b1b  CC0000         LDD #0x0                          
  0b1e  FD70DA         STD 0x70da                        
  0b21  CC000A         LDD #0xa                          
  0b24  AD9FFD20       JSR [0xfd20]                      
  0b28  108E0440       LDY #0x440                        
  0b2c  FC70DA         LDD 0x70da                        
  0b2f  AD9FFD2E       JSR [0xfd2e]                      
  0b33  171C0C         LBSR 0x2742                       
  0b36  CCFFFF         LDD #0xffff                       
  0b39  FD70DE         STD 0x70de                        
  0b3c  CC0000         LDD #0x0                          
  0b3f  FD70DC         STD 0x70dc                        
  0b42  16003E         LBRA 0x0b83                       
LAB_M6C_r2_0c000__0b45:
  0b45  FC70DA         LDD 0x70da                        
  0b48  F370E0         ADDD 0x70e0                       
  0b4b  2918           BVS 0x0b65                        
  0b4d  FD70DA         STD 0x70da                        
  0b50  CC000A         LDD #0xa                          
  0b53  AD9FFD20       JSR [0xfd20]                      
  0b57  108E0440       LDY #0x440                        
  0b5b  FC70DA         LDD 0x70da                        
  0b5e  AD9FFD2E       JSR [0xfd2e]                      
  0b62  16001E         LBRA 0x0b83                       
LAB_M6C_r2_0c000__0b65:
  0b65  CC7FFF         LDD #0x7fff                       
  0b68  FD70DA         STD 0x70da                        
  0b6b  CC000A         LDD #0xa                          
  0b6e  AD9FFD20       JSR [0xfd20]                      
  0b72  108E0440       LDY #0x440                        
  0b76  FC70DA         LDD 0x70da                        
  0b79  AD9FFD2E       JSR [0xfd2e]                      
  0b7d  CCFFFF         LDD #0xffff                       
  0b80  FD70DC         STD 0x70dc                        
LAB_M6C_r2_0c000__0b83:
  0b83  3576           PULS  A B X Y U                   
  0b85  39             RTS                               
PTR_FUN_M6C_r2_0c000__0c09_M6C_r2_0c000__0b86:
  0b86  0C09           addr M6C_r2_0c000::0c09           
  0b88  0BD0           addr M6C_r2_0c000::0bd0           
  0b8a  .db 0B C4 70 6C 70 6E 00 00 70 70 00 08 00 4F 02 00  ; ..plpn..pp...O..
  0b9a  .db 01 00 64 00 01 00 03 22 0B F4 00 00 00 00 70 72  ; ..d...."......pr
  0baa  .db 00 5D                                            ; .]

; ---- function FUN_M6C_r2_0c000__0bac
FUN_M6C_r2_0c000__0bac:
  0bac  3410           PSHS  X                           
  0bae  8E0B86         LDX #0xb86                         ; desc[API_FE6A]: ->$0C09 ->$0BD0
  0bb1  AD9FFE6A       JSR [0xfe6a]                      
  0bb5  3510           PULS  X                           
  0bb7  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0bb8
FUN_M6C_r2_0c000__0bb8:
  0bb8  3410           PSHS  X                           
  0bba  8E0B86         LDX #0xb86                         ; desc[API_FDBC]: ->$0C09 ->$0BD0
  0bbd  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0bc1  3510           PULS  X                           
  0bc3  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0bc4
FUN_M6C_r2_0c000__0bc4:
  0bc4  3410           PSHS  X                           
  0bc6  8E0B86         LDX #0xb86                         ; desc[API_FE6C]: ->$0C09 ->$0BD0
  0bc9  AD9FFE6C       JSR [0xfe6c]                      
  0bcd  3510           PULS  X                           
  0bcf  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0bd0
FUN_M6C_r2_0c000__0bd0:
  0bd0  3410           PSHS  X                           
  0bd2  8E0B86         LDX #0xb86                         ; desc[API_FE6E]: ->$0C09 ->$0BD0
  0bd5  AD9FFE6E       JSR [0xfe6e]                      
  0bd9  3510           PULS  X                           
  0bdb  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0bdc
FUN_M6C_r2_0c000__0bdc:
  0bdc  3410           PSHS  X                           
  0bde  8E0B86         LDX #0xb86                         ; desc[API_FE1C]: ->$0C09 ->$0BD0
  0be1  AD9FFE1C       JSR [0xfe1c]                      
  0be5  3510           PULS  X                           
  0be7  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0be8
FUN_M6C_r2_0c000__0be8:
  0be8  3410           PSHS  X                           
  0bea  8E0B86         LDX #0xb86                         ; desc[API_FE1A]: ->$0C09 ->$0BD0 $0BC4
  0bed  AD9FFE1A       JSR [0xfe1a]                      
  0bf1  3510           PULS  X                           
  0bf3  39             RTS                               
  0bf4  .db 14 6D 61 73 74 65 72 20 64 65 6C 61 79 3A 20 20  ; .master delay:  
  0c04  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M6C_r2_0c000__0c09
FUN_M6C_r2_0c000__0c09:
  0c09  3476           PSHS  U Y X B A                   
  0c0b  8E0B86         LDX #0xb86                        
  0c0e  AD9FFE76       JSR [0xfe76]                      
  0c12  FC7070         LDD 0x7070                        
  0c15  3606           PSHU  B A                         
  0c17  CC0147         LDD #0x147                        
  0c1a  3606           PSHU  B A                         
  0c1c  AD9FFCEE       JSR [0xfcee]                      
  0c20  3706           PULU  A B                         
  0c22  FD701C         STD 0x701c                        
  0c25  FC7070         LDD 0x7070                        
  0c28  3606           PSHU  B A                         
  0c2a  CC55C1         LDD #0x55c1                       
  0c2d  3606           PSHU  B A                         
  0c2f  AD9FFCF2       JSR [0xfcf2]                      
  0c33  3706           PULU  A B                         
  0c35  F3701C         ADDD 0x701c                       
  0c38  FD70E4         STD 0x70e4                        
  0c3b  CC0000         LDD #0x0                          
  0c3e  FD70DE         STD 0x70de                        
  0c41  3576           PULS  A B X Y U                   
  0c43  39             RTS                               
PTR_FUN_M6C_r2_0c000__0cc7_M6C_r2_0c000__0c44:
  0c44  0CC7           addr M6C_r2_0c000::0cc7           
  0c46  0C8E           addr M6C_r2_0c000::0c8e           
  0c48  .db 0C 82 70 CC 70 CE 00 00 70 D0 00 08 00 49 31 FF  ; ..p.p...p....I1.
  0c58  .db 9C 00 63 00 01 00 03 1D 0C B2 00 00 00 00 70 D2  ; ..c...........p.
  0c68  .db 00 4B                                            ; .K

; ---- function FUN_M6C_r2_0c000__0c6a
FUN_M6C_r2_0c000__0c6a:
  0c6a  3410           PSHS  X                           
  0c6c  8E0C44         LDX #0xc44                         ; desc[API_FE6A]: ->$0CC7 ->$0C8E
  0c6f  AD9FFE6A       JSR [0xfe6a]                      
  0c73  3510           PULS  X                           
  0c75  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0c76
FUN_M6C_r2_0c000__0c76:
  0c76  3410           PSHS  X                           
  0c78  8E0C44         LDX #0xc44                         ; desc[API_FDBC]: ->$0CC7 ->$0C8E
  0c7b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...D"
  0c7f  3510           PULS  X                           
  0c81  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0c82
FUN_M6C_r2_0c000__0c82:
  0c82  3410           PSHS  X                           
  0c84  8E0C44         LDX #0xc44                         ; desc[API_FE6C]: ->$0CC7 ->$0C8E
  0c87  AD9FFE6C       JSR [0xfe6c]                      
  0c8b  3510           PULS  X                           
  0c8d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0c8e
FUN_M6C_r2_0c000__0c8e:
  0c8e  3410           PSHS  X                           
  0c90  8E0C44         LDX #0xc44                         ; desc[API_FE6E]: ->$0CC7 ->$0C8E
  0c93  AD9FFE6E       JSR [0xfe6e]                      
  0c97  3510           PULS  X                           
  0c99  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0c9a
FUN_M6C_r2_0c000__0c9a:
  0c9a  3410           PSHS  X                           
  0c9c  8E0C44         LDX #0xc44                         ; desc[API_FE1C]: ->$0CC7 ->$0C8E
  0c9f  AD9FFE1C       JSR [0xfe1c]                      
  0ca3  3510           PULS  X                           
  0ca5  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0ca6
FUN_M6C_r2_0c000__0ca6:
  0ca6  3410           PSHS  X                           
  0ca8  8E0C44         LDX #0xc44                         ; desc[API_FE1A]: ->$0CC7 ->$0C8E $0C82
  0cab  AD9FFE1A       JSR [0xfe1a]                      
  0caf  3510           PULS  X                           
  0cb1  39             RTS                               
  0cb2  .db 14 66 65 65 64 62 61 63 6B 3A 20 20 20 20 20 25  ; .feedback:     %
  0cc2  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6C_r2_0c000__0cc7
FUN_M6C_r2_0c000__0cc7:
  0cc7  3476           PSHS  U Y X B A                   
  0cc9  8E0C44         LDX #0xc44                        
  0ccc  AD9FFE76       JSR [0xfe76]                      
  0cd0  FC70D0         LDD 0x70d0                        
  0cd3  3606           PSHU  B A                         
  0cd5  CC0147         LDD #0x147                        
  0cd8  3606           PSHU  B A                         
  0cda  AD9FFCEC       JSR [0xfcec]                      
  0cde  3706           PULU  A B                         
  0ce0  FD701C         STD 0x701c                        
  0ce3  FC70D0         LDD 0x70d0                        
  0ce6  3606           PSHU  B A                         
  0ce8  CC55C1         LDD #0x55c1                       
  0ceb  3606           PSHU  B A                         
  0ced  AD9FFCF2       JSR [0xfcf2]                      
  0cf1  3706           PULU  A B                         
  0cf3  F3701C         ADDD 0x701c                       
  0cf6  FD701C         STD 0x701c                        
  0cf9  CC000A         LDD #0xa                          
  0cfc  AD9FFD20       JSR [0xfd20]                      
  0d00  108E0242       LDY #0x242                        
  0d04  FC701C         LDD 0x701c                        
  0d07  AD9FFD2E       JSR [0xfd2e]                      
  0d0b  3576           PULS  A B X Y U                   
  0d0d  39             RTS                               
PTR_FUN_M6C_r2_0c000__0d79_M6C_r2_0c000__0d0e:
  0d0e  0D79           addr M6C_r2_0c000::0d79           
  0d10  0D58           addr M6C_r2_0c000::0d58           
  0d12  .db 0D 4C 70 D4 70 D6 00 00 70 D8 00 08 00 A6 32 00  ; .Lp.p...p.....2.
  0d22  .db 01 00 0C 00 01 00 02 26 0D 64 00 00 00 00 00 00  ; .......&.d......
  0d32  .db 00 00                                            ; ..

; ---- function FUN_M6C_r2_0c000__0d34
FUN_M6C_r2_0c000__0d34:
  0d34  3410           PSHS  X                           
  0d36  8E0D0E         LDX #0xd0e                         ; desc[API_FE6A]: ->$0D79 ->$0D58
  0d39  AD9FFE6A       JSR [0xfe6a]                      
  0d3d  3510           PULS  X                           
  0d3f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0d40
FUN_M6C_r2_0c000__0d40:
  0d40  3410           PSHS  X                           
  0d42  8E0D0E         LDX #0xd0e                         ; desc[API_FDBC]: ->$0D79 ->$0D58
  0d45  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0d49  3510           PULS  X                           
  0d4b  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0d4c
FUN_M6C_r2_0c000__0d4c:
  0d4c  3410           PSHS  X                           
  0d4e  8E0D0E         LDX #0xd0e                         ; desc[API_FE6C]: ->$0D79 ->$0D58
  0d51  AD9FFE6C       JSR [0xfe6c]                      
  0d55  3510           PULS  X                           
  0d57  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0d58
FUN_M6C_r2_0c000__0d58:
  0d58  3410           PSHS  X                           
  0d5a  8E0D0E         LDX #0xd0e                         ; desc[API_FE6E]: ->$0D79 ->$0D58
  0d5d  AD9FFE6E       JSR [0xfe6e]                      
  0d61  3510           PULS  X                           
  0d63  39             RTS                               
  0d64  .db 14 66 65 65 64 62 61 63 6B 20 66 72 6F 6D 20 74  ; .feedback from t
  0d74  .db 61 70 3A 20 20                                   ; ap:  

; ---- function FUN_M6C_r2_0c000__0d79
FUN_M6C_r2_0c000__0d79:
  0d79  3476           PSHS  U Y X B A                   
  0d7b  8E0D0E         LDX #0xd0e                        
  0d7e  AD9FFE76       JSR [0xfe76]                      
  0d82  FC70D8         LDD 0x70d8                        
  0d85  C30009         ADDD #0x9                         
  0d88  FD701C         STD 0x701c                        
  0d8b  CC000A         LDD #0xa                          
  0d8e  AD9FFD20       JSR [0xfd20]                      
  0d92  108E0140       LDY #0x140                        
  0d96  FC701C         LDD 0x701c                        
  0d99  AD9FFD2E       JSR [0xfd2e]                      
  0d9d  3576           PULS  A B X Y U                   
  0d9f  39             RTS                               
PTR_FUN_M6C_r2_0c000__0e33_M6C_r2_0c000__0da0:
  0da0  0E33           addr M6C_r2_0c000::0e33           
  0da2  0DFF           addr M6C_r2_0c000::0dff           
  0da4  .db 0D E7 70 66 70 68 00 00 70 6A 00 08 00 61 05 FF  ; ..pfph..pj...a..
  0db4  .db FF 00 00 00 01 00 02 20 0D C6 00 00 00 00 00 00  ; ....... ........
  0dc4  .db 00 00 14 69 6E 70 75 74 20 6D 6F 64 65 3A 20 20  ; ...input mode:  
  0dd4  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M6C_r2_0c000__0ddb
FUN_M6C_r2_0c000__0ddb:
  0ddb  3410           PSHS  X                           
  0ddd  8E0DA0         LDX #0xda0                        
  0de0  AD9FFE74       JSR [0xfe74]                      
  0de4  3510           PULS  X                           
  0de6  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0de7
FUN_M6C_r2_0c000__0de7:
  0de7  3410           PSHS  X                           
  0de9  8E0DA0         LDX #0xda0                        
  0dec  AD9FFE70       JSR [0xfe70]                      
  0df0  3510           PULS  X                           
  0df2  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0df3
FUN_M6C_r2_0c000__0df3:
  0df3  3410           PSHS  X                           
  0df5  8E0DA0         LDX #0xda0                         ; desc[API_FE22]: ->$0E33 ->$0DFF
  0df8  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0dfc  3510           PULS  X                           
  0dfe  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0dff
FUN_M6C_r2_0c000__0dff:
  0dff  3456           PSHS  U X B A                     
  0e01  FC706A         LDD 0x706a                        
  0e04  10830000       CMPD #0x0                         
  0e08  10270013       LBEQ 0x0e1f                       
  0e0c  C620           LDB #0x20                         
  0e0e  AD9FFC36       JSR [0xfc36]                      
  0e12  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "mono  "
  0e16  6D6F6E6F2020.. char[7] "mono  "                  
LAB_M6C_r2_0c000__0e1d:
  0e1d  2011           BRA 0x0e30                        
LAB_M6C_r2_0c000__0e1f:
  0e1f  C620           LDB #0x20                         
  0e21  AD9FFC36       JSR [0xfc36]                      
  0e25  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stereo"
  0e29  73746572656F.. char[7] "stereo"                  
LAB_M6C_r2_0c000__0e30:
  0e30  3556           PULS  A B X U                     
  0e32  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0e33
FUN_M6C_r2_0c000__0e33:
  0e33  3476           PSHS  U Y X B A                   
  0e35  8E0DA0         LDX #0xda0                        
  0e38  AD9FFE76       JSR [0xfe76]                      
  0e3c  FC706A         LDD 0x706a                        
  0e3f  10830000       CMPD #0x0                         
  0e43  10270026       LBEQ 0x0e6d                       
  0e47  CC000A         LDD #0xa                          
  0e4a  AD9FFD20       JSR [0xfd20]                      
  0e4e  108E0241       LDY #0x241                        
  0e52  CC7FFF         LDD #0x7fff                       
  0e55  AD9FFD2E       JSR [0xfd2e]                      
  0e59  CC000A         LDD #0xa                          
  0e5c  AD9FFD20       JSR [0xfd20]                      
  0e60  108E0240       LDY #0x240                        
  0e64  CC0000         LDD #0x0                          
  0e67  AD9FFD2E       JSR [0xfd2e]                      
  0e6b  2024           BRA 0x0e91                        
LAB_M6C_r2_0c000__0e6d:
  0e6d  CC000A         LDD #0xa                          
  0e70  AD9FFD20       JSR [0xfd20]                      
  0e74  108E0241       LDY #0x241                        
  0e78  CC4000         LDD #0x4000                       
  0e7b  AD9FFD2E       JSR [0xfd2e]                      
  0e7f  CC000A         LDD #0xa                          
  0e82  AD9FFD20       JSR [0xfd20]                      
  0e86  108E0240       LDY #0x240                        
  0e8a  CC4000         LDD #0x4000                       
  0e8d  AD9FFD2E       JSR [0xfd2e]                      
LAB_M6C_r2_0c000__0e91:
  0e91  3576           PULS  A B X Y U                   
  0e93  39             RTS                               
PTR_FUN_M6C_r2_0c000__0f75_M6C_r2_0c000__0e94:
  0e94  0F75           addr M6C_r2_0c000::0f75           
  0e96  0F1A           addr M6C_r2_0c000::0f1a           
  0e98  .db 0E EA 70 74 70 76 00 00 70 78 00 08 00 51 04 FF  ; ..ptpv..px...Q..
  0ea8  .db 9C 00 64 00 01 00 04 20 0E BA 00 00 00 00 70 7A  ; ..d.... ......pz
  0eb8  .db 00 5F 05 69 6D 61 67 65 20 77 69 64 74 68 3A 2D  ; ._.image width:-
  0ec8  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0ed8  .db 20 20 20 20 20 2D                                ;      -

; ---- function FUN_M6C_r2_0c000__0ede
FUN_M6C_r2_0c000__0ede:
  0ede  3410           PSHS  X                           
  0ee0  8E0E94         LDX #0xe94                         ; desc[API_FE6A]: ->$0F75 ->$0F1A
  0ee3  AD9FFE6A       JSR [0xfe6a]                      
  0ee7  3510           PULS  X                           
  0ee9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0eea
FUN_M6C_r2_0c000__0eea:
  0eea  3410           PSHS  X                           
  0eec  8E0E94         LDX #0xe94                         ; desc[API_FE6C]: ->$0F75 ->$0F1A
  0eef  AD9FFE6C       JSR [0xfe6c]                      
  0ef3  3510           PULS  X                           
  0ef5  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0ef6
FUN_M6C_r2_0c000__0ef6:
  0ef6  3410           PSHS  X                           
  0ef8  8E0E94         LDX #0xe94                         ; desc[API_FDBC]: ->$0F75 ->$0F1A
  0efb  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0eff  3510           PULS  X                           
  0f01  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0f02
FUN_M6C_r2_0c000__0f02:
  0f02  3410           PSHS  X                           
  0f04  8E0E94         LDX #0xe94                         ; desc[API_FE1C]: ->$0F75 ->$0F1A
  0f07  AD9FFE1C       JSR [0xfe1c]                      
  0f0b  3510           PULS  X                           
  0f0d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0f0e
FUN_M6C_r2_0c000__0f0e:
  0f0e  3410           PSHS  X                           
  0f10  8E0E94         LDX #0xe94                         ; desc[API_FE1A]: ->$0F75 ->$0F1A $0EEA
  0f13  AD9FFE1A       JSR [0xfe1a]                      
  0f17  3510           PULS  X                           
  0f19  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0f1a
FUN_M6C_r2_0c000__0f1a:
  0f1a  3456           PSHS  U X B A                     
  0f1c  C612           LDB #0x12                         
  0f1e  AD9FFC36       JSR [0xfc36]                      
  0f22  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                     "
  0f26  202020202020.. char[22] "                     "  
LAB_M6C_r2_0c000__0f3c:
  0f3c  FC7078         LDD 0x7078                        
  0f3f  C30064         ADDD #0x64                        
  0f42  3606           PSHU  B A                         
  0f44  CC000A         LDD #0xa                          
  0f47  3606           PSHU  B A                         
  0f49  AD9FFCEA       JSR [0xfcea]                      
  0f4d  3706           PULU  A B                         
  0f4f  FD701C         STD 0x701c                        
  0f52  C30012         ADDD #0x12                        
  0f55  AD9FFC36       JSR [0xfc36]                      
  0f59  C652           LDB #0x52                         
  0f5b  AD9FFC2A       JSR [0xfc2a]                      
  0f5f  CC0014         LDD #0x14                         
  0f62  B3701C         SUBD 0x701c                       
  0f65  C30012         ADDD #0x12                        
  0f68  AD9FFC36       JSR [0xfc36]                      
  0f6c  C64C           LDB #0x4c                         
  0f6e  AD9FFC2A       JSR [0xfc2a]                      
  0f72  3556           PULS  A B X U                     
  0f74  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0f75
FUN_M6C_r2_0c000__0f75:
  0f75  3476           PSHS  U Y X B A                   
  0f77  8E0E94         LDX #0xe94                        
  0f7a  AD9FFE76       JSR [0xfe76]                      
  0f7e  FC7078         LDD 0x7078                        
  0f81  3606           PSHU  B A                         
  0f83  CC0147         LDD #0x147                        
  0f86  3606           PSHU  B A                         
  0f88  AD9FFCEC       JSR [0xfcec]                      
  0f8c  3706           PULU  A B                         
  0f8e  FD701C         STD 0x701c                        
  0f91  FC7078         LDD 0x7078                        
  0f94  3606           PSHU  B A                         
  0f96  CC55C1         LDD #0x55c1                       
  0f99  3606           PSHU  B A                         
  0f9b  AD9FFCF2       JSR [0xfcf2]                      
  0f9f  3706           PULU  A B                         
  0fa1  F3701C         ADDD 0x701c                       
  0fa4  FD70E2         STD 0x70e2                        
  0fa7  1717E6         LBSR 0x2790                       
  0faa  3576           PULS  A B X Y U                   
  0fac  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0fad
FUN_M6C_r2_0c000__0fad:
  0fad  3406           PSHS  B A                         
  0faf  FC60F9         LDD 0x60f9                        
  0fb2  FD6074         STD 0x6074                        
  0fb5  FD7060         STD 0x7060                        
  0fb8  8D08           BSR 0x0fc2                        
  0fba  8D4F           BSR 0x100b                        
  0fbc  1701DE         LBSR 0x119d                       
  0fbf  3506           PULS  A B                         
  0fc1  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0fc2
FUN_M6C_r2_0c000__0fc2:
  0fc2  3406           PSHS  B A                         
  0fc4  FC7060         LDD 0x7060                        
  0fc7  FD6074         STD 0x6074                        
  0fca  17F63D         LBSR 0x060a                       
  0fcd  C613           LDB #0x13                         
  0fcf  AD9FFC36       JSR [0xfc36]                      
  0fd3  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$100B ->$0FFE $0001 $0001 $0000
  0fd7  01             db 1h                             
  0fd8  01             db 1h                             
  0fd9  02             db 2h                             
  0fda  01             db 1h                             
  0fdb  01             db 1h                             
  0fdc  00             db 0h                             
  0fdd  01             db 1h                             
  0fde  80             db 80h                            
  0fdf  0006           dw 6h                             
  0fe1  0001           dw 1h                             
  0fe3  0000           dw 0h                             
  0fe5  100B           addr M6C_r2_0c000::100b           
  0fe7  0FFE           addr M6C_r2_0c000::0ffe           
  0fe9  0001           dw 1h                             
  0feb  0001           dw 1h                             
  0fed  0000           dw 0h                             
LAB_M6C_r2_0c000__0fef:
  0fef  170019         LBSR 0x100b                       
  0ff2  CC119D         LDD #0x119d                       
  0ff5  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  0ff9  6038           addr 6038                         
LAB_M6C_r2_0c000__0ffb:
  0ffb  3506           PULS  A B                         
  0ffd  39             RTS                               

; ---- function FUN_M6C_r2_0c000__0ffe
FUN_M6C_r2_0c000__0ffe:
  0ffe  3426           PSHS  Y B A                       
  1000  FC6074         LDD 0x6074                        
  1003  FD7060         STD 0x7060                        
  1006  8D03           BSR 0x100b                        
  1008  3526           PULS  A B Y                       
  100a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__100b
FUN_M6C_r2_0c000__100b:
  100b  3416           PSHS  X B A                       
  100d  FC7060         LDD 0x7060                        
  1010  10830000       CMPD #0x0                         
  1014  10270064       LBEQ 0x107c                       
  1018  C600           LDB #0x0                          
  101a  AD9FFC36       JSR [0xfc36]                      
  101e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "hit enter for:         "
  1022  68697420656E.. char[24] "hit enter for:         "
LAB_M6C_r2_0c000__103a:
  103a  FC7060         LDD 0x7060                        
  103d  10830001       CMPD #0x1                         
  1041  1027006D       LBEQ 0x10b2                       
  1045  FC7060         LDD 0x7060                        
  1048  10830002       CMPD #0x2                         
  104c  10270089       LBEQ 0x10d9                       
  1050  FC7060         LDD 0x7060                        
  1053  10830003       CMPD #0x3                         
  1057  102700A5       LBEQ 0x1100                       
  105b  FC7060         LDD 0x7060                        
  105e  10830004       CMPD #0x4                         
  1062  102700C1       LBEQ 0x1127                       
  1066  FC7060         LDD 0x7060                        
  1069  10830005       CMPD #0x5                         
  106d  102700DD       LBEQ 0x114e                       
  1071  FC7060         LDD 0x7060                        
  1074  10830006       CMPD #0x6                         
  1078  102700F9       LBEQ 0x1175                       
LAB_M6C_r2_0c000__107c:
  107c  C600           LDB #0x0                          
  107e  AD9FFC36       JSR [0xfc36]                      
  1082  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "spacing control - use knob for options  "
  1086  73706163696E.. char[41] "spacing control - use knob for options  "
LAB_M6C_r2_0c000__10af:
  10af  1600E7         LBRA 0x1199                       
LAB_M6C_r2_0c000__10b2:
  10b2  C60F           LDB #0xf                          
  10b4  AD9FFC36       JSR [0xfc36]                      
  10b8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "constant spacing         "
  10bc  636F6E737461.. char[26] "constant spacing         "
LAB_M6C_r2_0c000__10d6:
  10d6  1600C0         LBRA 0x1199                       
LAB_M6C_r2_0c000__10d9:
  10d9  C60F           LDB #0xf                          
  10db  AD9FFC36       JSR [0xfc36]                      
  10df  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear increasing spacing"
  10e3  6C696E656172.. char[26] "linear increasing spacing"
LAB_M6C_r2_0c000__10fd:
  10fd  160099         LBRA 0x1199                       
LAB_M6C_r2_0c000__1100:
  1100  C60F           LDB #0xf                          
  1102  AD9FFC36       JSR [0xfc36]                      
  1106  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear decreasing spacing"
  110a  6C696E656172.. char[26] "linear decreasing spacing"
LAB_M6C_r2_0c000__1124:
  1124  160072         LBRA 0x1199                       
LAB_M6C_r2_0c000__1127:
  1127  C60F           LDB #0xf                          
  1129  AD9FFC36       JSR [0xfc36]                      
  112d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al increasing spacing"
  1131  65787027616C.. char[26] "exp'al increasing spacing"
LAB_M6C_r2_0c000__114b:
  114b  16004B         LBRA 0x1199                       
LAB_M6C_r2_0c000__114e:
  114e  C60F           LDB #0xf                          
  1150  AD9FFC36       JSR [0xfc36]                      
  1154  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al decreasing spacing"
  1158  65787027616C.. char[26] "exp'al decreasing spacing"
LAB_M6C_r2_0c000__1172:
  1172  160024         LBRA 0x1199                       
LAB_M6C_r2_0c000__1175:
  1175  C60F           LDB #0xf                          
  1177  AD9FFC36       JSR [0xfc36]                      
  117b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "random spacing           "
  117f  72616E646F6D.. char[26] "random spacing           "
LAB_M6C_r2_0c000__1199:
  1199  3516           PULS  A B X                       
  119b  39             RTS                               
  119c  .db 39                                               ; 9

; ---- function FUN_M6C_r2_0c000__119d
FUN_M6C_r2_0c000__119d:
  119d  3476           PSHS  U Y X B A                   
  119f  108E0006       LDY #0x6                          
  11a3  FC7060         LDD 0x7060                        
  11a6  AD9FFE40       JSR [0xfe40]                      
  11aa  FC7060         LDD 0x7060                        
  11ad  10830000       CMPD #0x0                         
  11b1  10270042       LBEQ 0x11f7                       
  11b5  FC7060         LDD 0x7060                        
  11b8  10830001       CMPD #0x1                         
  11bc  1027003A       LBEQ 0x11fa                       
  11c0  FC7060         LDD 0x7060                        
  11c3  10830002       CMPD #0x2                         
  11c7  1027004A       LBEQ 0x1215                       
  11cb  FC7060         LDD 0x7060                        
  11ce  10830003       CMPD #0x3                         
  11d2  10270063       LBEQ 0x1239                       
  11d6  FC7060         LDD 0x7060                        
  11d9  10830004       CMPD #0x4                         
  11dd  1027007E       LBEQ 0x125f                       
  11e1  FC7060         LDD 0x7060                        
  11e4  10830005       CMPD #0x5                         
  11e8  102700C8       LBEQ 0x12b4                       
  11ec  FC7060         LDD 0x7060                        
  11ef  10830006       CMPD #0x6                         
  11f3  10270112       LBEQ 0x1309                       
LAB_M6C_r2_0c000__11f7:
  11f7  160138         LBRA 0x1332                       
LAB_M6C_r2_0c000__11fa:
  11fa  1716B9         LBSR 0x28b6                       
  11fd  CC000C         LDD #0xc                          
  1200  3606           PSHU  B A                         
  1202  AD9FFCEA       JSR [0xfcea]                      
  1206  3706           PULU  A B                         
  1208  8E7094         LDX #0x7094                       
LAB_M6C_r2_0c000__120b:
  120b  ED81           STD ,X++                          
  120d  8C70AA         CMPX #0x70aa                      
  1210  2FF9           BLE 0x120b                        
  1212  16011D         LBRA 0x1332                       
LAB_M6C_r2_0c000__1215:
  1215  17169E         LBSR 0x28b6                       
  1218  CC004E         LDD #0x4e                         
  121b  3606           PSHU  B A                         
  121d  AD9FFCEA       JSR [0xfcea]                      
  1221  3706           PULU  A B                         
  1223  FD701C         STD 0x701c                        
  1226  8E7094         LDX #0x7094                       
  1229  CC0000         LDD #0x0                          
LAB_M6C_r2_0c000__122c:
  122c  F3701C         ADDD 0x701c                       
  122f  ED81           STD ,X++                          
  1231  8C70AA         CMPX #0x70aa                      
  1234  2FF6           BLE 0x122c                        
  1236  1600F9         LBRA 0x1332                       
LAB_M6C_r2_0c000__1239:
  1239  17167A         LBSR 0x28b6                       
  123c  CC004E         LDD #0x4e                         
  123f  3606           PSHU  B A                         
  1241  AD9FFCEA       JSR [0xfcea]                      
  1245  3706           PULU  A B                         
  1247  FD701C         STD 0x701c                        
  124a  8E70AA         LDX #0x70aa                       
  124d  3002           LEAX 0x2,X                        
  124f  CC0000         LDD #0x0                          
LAB_M6C_r2_0c000__1252:
  1252  F3701C         ADDD 0x701c                       
  1255  ED83           STD ,--X                          
  1257  8C7094         CMPX #0x7094                      
  125a  2EF6           BGT 0x1252                        
  125c  1600D3         LBRA 0x1332                       
LAB_M6C_r2_0c000__125f:
  125f  171654         LBSR 0x28b6                       
  1262  3706           PULU  A B                         
  1264  108332C8       CMPD #0x32c8                      
  1268  2E12           BGT 0x127c                        
  126a  10832008       CMPD #0x2008                      
  126e  2E14           BGT 0x1284                        
  1270  10831004       CMPD #0x1004                      
  1274  2E16           BGT 0x128c                        
  1276  1716A1         LBSR 0x291a                       
  1279  1600EF         LBRA 0x136b                       
LAB_M6C_r2_0c000__127c:
  127c  CC0003         LDD #0x3                          
  127f  FD701C         STD 0x701c                        
  1282  200E           BRA 0x1292                        
LAB_M6C_r2_0c000__1284:
  1284  CC0002         LDD #0x2                          
  1287  FD701C         STD 0x701c                        
  128a  2006           BRA 0x1292                        
LAB_M6C_r2_0c000__128c:
  128c  CC0001         LDD #0x1                          
  128f  FD701C         STD 0x701c                        
LAB_M6C_r2_0c000__1292:
  1292  8E7094         LDX #0x7094                       
  1295  ED81           STD ,X++                          
LAB_M6C_r2_0c000__1297:
  1297  FC701C         LDD 0x701c                        
  129a  3606           PSHU  B A                         
  129c  CC0002         LDD #0x2                          
  129f  3606           PSHU  B A                         
  12a1  AD9FFCEE       JSR [0xfcee]                      
  12a5  3706           PULU  A B                         
  12a7  FD701C         STD 0x701c                        
  12aa  ED81           STD ,X++                          
  12ac  8C70AA         CMPX #0x70aa                      
  12af  2FE6           BLE 0x1297                        
  12b1  16007E         LBRA 0x1332                       
LAB_M6C_r2_0c000__12b4:
  12b4  1715FF         LBSR 0x28b6                       
  12b7  3706           PULU  A B                         
  12b9  108332C8       CMPD #0x32c8                      
  12bd  2E12           BGT 0x12d1                        
  12bf  10832008       CMPD #0x2008                      
  12c3  2E14           BGT 0x12d9                        
  12c5  10831004       CMPD #0x1004                      
  12c9  2E16           BGT 0x12e1                        
  12cb  17164C         LBSR 0x291a                       
  12ce  16009A         LBRA 0x136b                       
LAB_M6C_r2_0c000__12d1:
  12d1  CC0003         LDD #0x3                          
  12d4  FD701C         STD 0x701c                        
  12d7  200E           BRA 0x12e7                        
LAB_M6C_r2_0c000__12d9:
  12d9  CC0002         LDD #0x2                          
  12dc  FD701C         STD 0x701c                        
  12df  2006           BRA 0x12e7                        
LAB_M6C_r2_0c000__12e1:
  12e1  CC0001         LDD #0x1                          
  12e4  FD701C         STD 0x701c                        
LAB_M6C_r2_0c000__12e7:
  12e7  8E70AA         LDX #0x70aa                       
  12ea  ED84           STD ,X                            
LAB_M6C_r2_0c000__12ec:
  12ec  FC701C         LDD 0x701c                        
  12ef  3606           PSHU  B A                         
  12f1  CC0002         LDD #0x2                          
  12f4  3606           PSHU  B A                         
  12f6  AD9FFCEE       JSR [0xfcee]                      
  12fa  3706           PULU  A B                         
  12fc  FD701C         STD 0x701c                        
  12ff  ED83           STD ,--X                          
  1301  8C7094         CMPX #0x7094                      
  1304  2EE6           BGT 0x12ec                        
  1306  160029         LBRA 0x1332                       
LAB_M6C_r2_0c000__1309:
  1309  1715AA         LBSR 0x28b6                       
  130c  CC000C         LDD #0xc                          
  130f  3606           PSHU  B A                         
  1311  AD9FFCEA       JSR [0xfcea]                      
  1315  3706           PULU  A B                         
  1317  FD701C         STD 0x701c                        
  131a  8E7094         LDX #0x7094                       
LAB_M6C_r2_0c000__131d:
  131d  FC701C         LDD 0x701c                        
  1320  3606           PSHU  B A                         
  1322  AD9FFCF8       JSR [0xfcf8]                      
  1326  3706           PULU  A B                         
  1328  ED81           STD ,X++                          
  132a  8C70AA         CMPX #0x70aa                      
  132d  2FEE           BLE 0x131d                        
  132f  160000         LBRA 0x1332                       
LAB_M6C_r2_0c000__1332:
  1332  17140D         LBSR 0x2742                       
  1335  1713B3         LBSR 0x26eb                       
  1338  C600           LDB #0x0                          
  133a  AD9FFC36       JSR [0xfc36]                      
  133e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "spacing was set - use knob for options  "
  1342  73706163696E.. char[41] "spacing was set - use knob for options  "
LAB_M6C_r2_0c000__136b:
  136b  3576           PULS  A B X Y U                   
  136d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__136e
FUN_M6C_r2_0c000__136e:
  136e  3406           PSHS  B A                         
  1370  FC60F9         LDD 0x60f9                        
  1373  FD6074         STD 0x6074                        
  1376  FD7062         STD 0x7062                        
  1379  8D08           BSR 0x1383                        
  137b  8D4F           BSR 0x13cc                        
  137d  1701DF         LBSR 0x155f                       
  1380  3506           PULS  A B                         
  1382  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1383
FUN_M6C_r2_0c000__1383:
  1383  3406           PSHS  B A                         
  1385  FC7062         LDD 0x7062                        
  1388  FD6074         STD 0x6074                        
  138b  17F27C         LBSR 0x060a                       
  138e  C613           LDB #0x13                         
  1390  AD9FFC36       JSR [0xfc36]                      
  1394  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0006 $0001 $0000 ->$13CC ->$13BF $0001 $0001 $0000
  1398  01             db 1h                             
  1399  01             db 1h                             
  139a  02             db 2h                             
  139b  01             db 1h                             
  139c  01             db 1h                             
  139d  00             db 0h                             
  139e  01             db 1h                             
  139f  80             db 80h                            
  13a0  0006           dw 6h                             
  13a2  0001           dw 1h                             
  13a4  0000           dw 0h                             
  13a6  13CC           addr M6C_r2_0c000::13cc           
  13a8  13BF           addr M6C_r2_0c000::13bf           
  13aa  0001           dw 1h                             
  13ac  0001           dw 1h                             
  13ae  0000           dw 0h                             
LAB_M6C_r2_0c000__13b0:
  13b0  170019         LBSR 0x13cc                       
  13b3  CC155F         LDD #0x155f                       
  13b6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  13ba  6038           addr 6038                         
LAB_M6C_r2_0c000__13bc:
  13bc  3506           PULS  A B                         
  13be  39             RTS                               

; ---- function FUN_M6C_r2_0c000__13bf
FUN_M6C_r2_0c000__13bf:
  13bf  3426           PSHS  Y B A                       
  13c1  FC6074         LDD 0x6074                        
  13c4  FD7062         STD 0x7062                        
  13c7  8D03           BSR 0x13cc                        
  13c9  3526           PULS  A B Y                       
  13cb  39             RTS                               

; ---- function FUN_M6C_r2_0c000__13cc
FUN_M6C_r2_0c000__13cc:
  13cc  3416           PSHS  X B A                       
  13ce  FC7062         LDD 0x7062                        
  13d1  10830000       CMPD #0x0                         
  13d5  10270065       LBEQ 0x143e                       
  13d9  C600           LDB #0x0                          
  13db  AD9FFC36       JSR [0xfc36]                      
  13df  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "hit enter for:          "
  13e3  68697420656E.. char[25] "hit enter for:          "
LAB_M6C_r2_0c000__13fc:
  13fc  FC7062         LDD 0x7062                        
  13ff  10830001       CMPD #0x1                         
  1403  1027006D       LBEQ 0x1474                       
  1407  FC7062         LDD 0x7062                        
  140a  10830002       CMPD #0x2                         
  140e  10270089       LBEQ 0x149b                       
  1412  FC7062         LDD 0x7062                        
  1415  10830003       CMPD #0x3                         
  1419  102700A5       LBEQ 0x14c2                       
  141d  FC7062         LDD 0x7062                        
  1420  10830004       CMPD #0x4                         
  1424  102700C1       LBEQ 0x14e9                       
  1428  FC7062         LDD 0x7062                        
  142b  10830005       CMPD #0x5                         
  142f  102700DD       LBEQ 0x1510                       
  1433  FC7062         LDD 0x7062                        
  1436  10830006       CMPD #0x6                         
  143a  102700F9       LBEQ 0x1537                       
LAB_M6C_r2_0c000__143e:
  143e  C600           LDB #0x0                          
  1440  AD9FFC36       JSR [0xfc36]                      
  1444  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "weighting control - use knob for options"
  1448  776569676874.. char[41] "weighting control - use knob for options"
LAB_M6C_r2_0c000__1471:
  1471  1600E7         LBRA 0x155b                       
LAB_M6C_r2_0c000__1474:
  1474  C60F           LDB #0xf                          
  1476  AD9FFC36       JSR [0xfc36]                      
  147a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "constant weight          "
  147e  636F6E737461.. char[26] "constant weight          "
LAB_M6C_r2_0c000__1498:
  1498  1600C0         LBRA 0x155b                       
LAB_M6C_r2_0c000__149b:
  149b  C60F           LDB #0xf                          
  149d  AD9FFC36       JSR [0xfc36]                      
  14a1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear increasing weights"
  14a5  6C696E656172.. char[26] "linear increasing weights"
LAB_M6C_r2_0c000__14bf:
  14bf  160099         LBRA 0x155b                       
LAB_M6C_r2_0c000__14c2:
  14c2  C60F           LDB #0xf                          
  14c4  AD9FFC36       JSR [0xfc36]                      
  14c8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "linear decreasing weights"
  14cc  6C696E656172.. char[26] "linear decreasing weights"
LAB_M6C_r2_0c000__14e6:
  14e6  160072         LBRA 0x155b                       
LAB_M6C_r2_0c000__14e9:
  14e9  C60F           LDB #0xf                          
  14eb  AD9FFC36       JSR [0xfc36]                      
  14ef  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al increasing weights"
  14f3  65787027616C.. char[26] "exp'al increasing weights"
LAB_M6C_r2_0c000__150d:
  150d  16004B         LBRA 0x155b                       
LAB_M6C_r2_0c000__1510:
  1510  C60F           LDB #0xf                          
  1512  AD9FFC36       JSR [0xfc36]                      
  1516  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "exp'al decreasing weights"
  151a  65787027616C.. char[26] "exp'al decreasing weights"
LAB_M6C_r2_0c000__1534:
  1534  160024         LBRA 0x155b                       
LAB_M6C_r2_0c000__1537:
  1537  C60F           LDB #0xf                          
  1539  AD9FFC36       JSR [0xfc36]                      
  153d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "random weights           "
  1541  72616E646F6D.. char[26] "random weights           "
LAB_M6C_r2_0c000__155b:
  155b  3516           PULS  A B X                       
  155d  39             RTS                               
  155e  .db 39                                               ; 9

; ---- function FUN_M6C_r2_0c000__155f
FUN_M6C_r2_0c000__155f:
  155f  3476           PSHS  U Y X B A                   
  1561  108E0007       LDY #0x7                          
  1565  FC7062         LDD 0x7062                        
  1568  AD9FFE40       JSR [0xfe40]                      
  156c  FC7062         LDD 0x7062                        
  156f  10830000       CMPD #0x0                         
  1573  10270042       LBEQ 0x15b9                       
  1577  FC7062         LDD 0x7062                        
  157a  10830001       CMPD #0x1                         
  157e  1027003A       LBEQ 0x15bc                       
  1582  FC7062         LDD 0x7062                        
  1585  10830002       CMPD #0x2                         
  1589  1027003F       LBEQ 0x15cc                       
  158d  FC7062         LDD 0x7062                        
  1590  10830003       CMPD #0x3                         
  1594  1027004D       LBEQ 0x15e5                       
  1598  FC7062         LDD 0x7062                        
  159b  10830004       CMPD #0x4                         
  159f  1027005D       LBEQ 0x1600                       
  15a3  FC7062         LDD 0x7062                        
  15a6  10830005       CMPD #0x5                         
  15aa  10270081       LBEQ 0x162f                       
  15ae  FC7062         LDD 0x7062                        
  15b1  10830006       CMPD #0x6                         
  15b5  102700A2       LBEQ 0x165b                       
LAB_M6C_r2_0c000__15b9:
  15b9  1600B7         LBRA 0x1673                       
LAB_M6C_r2_0c000__15bc:
  15bc  8E70AC         LDX #0x70ac                       
  15bf  CC0190         LDD #0x190                        
LAB_M6C_r2_0c000__15c2:
  15c2  ED81           STD ,X++                          
  15c4  8C70C2         CMPX #0x70c2                      
  15c7  2FF9           BLE 0x15c2                        
  15c9  1600A7         LBRA 0x1673                       
LAB_M6C_r2_0c000__15cc:
  15cc  8E70AC         LDX #0x70ac                       
  15cf  CC0050         LDD #0x50                         
  15d2  FD701C         STD 0x701c                        
  15d5  CC0000         LDD #0x0                          
LAB_M6C_r2_0c000__15d8:
  15d8  F3701C         ADDD 0x701c                       
  15db  ED81           STD ,X++                          
  15dd  8C70C2         CMPX #0x70c2                      
  15e0  2FF6           BLE 0x15d8                        
  15e2  16008E         LBRA 0x1673                       
LAB_M6C_r2_0c000__15e5:
  15e5  8E70C2         LDX #0x70c2                       
  15e8  3002           LEAX 0x2,X                        
  15ea  CC0050         LDD #0x50                         
  15ed  FD701C         STD 0x701c                        
  15f0  CC0000         LDD #0x0                          
LAB_M6C_r2_0c000__15f3:
  15f3  F3701C         ADDD 0x701c                       
  15f6  ED83           STD ,--X                          
  15f8  8C70AC         CMPX #0x70ac                      
  15fb  2EF6           BGT 0x15f3                        
  15fd  160073         LBRA 0x1673                       
LAB_M6C_r2_0c000__1600:
  1600  8E70AC         LDX #0x70ac                       
  1603  CC0001         LDD #0x1                          
  1606  FD701C         STD 0x701c                        
  1609  ED81           STD ,X++                          
LAB_M6C_r2_0c000__160b:
  160b  FC701C         LDD 0x701c                        
  160e  3606           PSHU  B A                         
  1610  CC0002         LDD #0x2                          
  1613  3606           PSHU  B A                         
  1615  AD9FFCEE       JSR [0xfcee]                      
  1619  3706           PULU  A B                         
  161b  FD701C         STD 0x701c                        
  161e  ED81           STD ,X++                          
  1620  8C70BE         CMPX #0x70be                      
  1623  2FE6           BLE 0x160b                        
  1625  CC03E8         LDD #0x3e8                        
  1628  ED81           STD ,X++                          
  162a  ED81           STD ,X++                          
  162c  160044         LBRA 0x1673                       
LAB_M6C_r2_0c000__162f:
  162f  8E70C2         LDX #0x70c2                       
  1632  CC0001         LDD #0x1                          
  1635  FD701C         STD 0x701c                        
  1638  ED84           STD ,X                            
LAB_M6C_r2_0c000__163a:
  163a  FC701C         LDD 0x701c                        
  163d  3606           PSHU  B A                         
  163f  CC0002         LDD #0x2                          
  1642  3606           PSHU  B A                         
  1644  AD9FFCEE       JSR [0xfcee]                      
  1648  3706           PULU  A B                         
  164a  FD701C         STD 0x701c                        
  164d  ED83           STD ,--X                          
  164f  8C70B0         CMPX #0x70b0                      
  1652  2EE6           BGT 0x163a                        
  1654  ED83           STD ,--X                          
  1656  ED83           STD ,--X                          
  1658  160018         LBRA 0x1673                       
LAB_M6C_r2_0c000__165b:
  165b  8E70AC         LDX #0x70ac                       
LAB_M6C_r2_0c000__165e:
  165e  CC03E8         LDD #0x3e8                        
  1661  3606           PSHU  B A                         
  1663  AD9FFCF8       JSR [0xfcf8]                      
  1667  3706           PULU  A B                         
  1669  ED81           STD ,X++                          
  166b  8C70C2         CMPX #0x70c2                      
  166e  2FEE           BLE 0x165e                        
  1670  160000         LBRA 0x1673                       
LAB_M6C_r2_0c000__1673:
  1673  17111A         LBSR 0x2790                       
  1676  17108F         LBSR 0x2708                       
  1679  C600           LDB #0x0                          
  167b  AD9FFC36       JSR [0xfc36]                      
  167f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "weights set - use knob for options      "
  1683  776569676874.. char[41] "weights set - use knob for options      "
LAB_M6C_r2_0c000__16ac:
  16ac  3576           PULS  A B X Y U                   
  16ae  39             RTS                               

; ---- function FUN_M6C_r2_0c000__16af
FUN_M6C_r2_0c000__16af:
  16af  3406           PSHS  B A                         
  16b1  FC60F9         LDD 0x60f9                        
  16b4  FD6074         STD 0x6074                        
  16b7  FD7064         STD 0x7064                        
  16ba  8D08           BSR 0x16c4                        
  16bc  8D4F           BSR 0x170d                        
  16be  170275         LBSR 0x1936                       
  16c1  3506           PULS  A B                         
  16c3  39             RTS                               

; ---- function FUN_M6C_r2_0c000__16c4
FUN_M6C_r2_0c000__16c4:
  16c4  3406           PSHS  B A                         
  16c6  FC7064         LDD 0x7064                        
  16c9  FD6074         STD 0x6074                        
  16cc  17EF3B         LBSR 0x060a                       
  16cf  C613           LDB #0x13                         
  16d1  AD9FFC36       JSR [0xfc36]                      
  16d5  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0009 $0001 $0000 ->$170D ->$1700 $0001 $0001 $0000
  16d9  01             db 1h                             
  16da  01             db 1h                             
  16db  02             db 2h                             
  16dc  01             db 1h                             
  16dd  01             db 1h                             
  16de  00             db 0h                             
  16df  01             db 1h                             
  16e0  80             db 80h                            
  16e1  0009           dw 9h                             
  16e3  0001           dw 1h                             
  16e5  0000           dw 0h                             
  16e7  170D           addr M6C_r2_0c000::170d           
  16e9  1700           addr M6C_r2_0c000::1700           
  16eb  0001           dw 1h                             
  16ed  0001           dw 1h                             
  16ef  0000           dw 0h                             
LAB_M6C_r2_0c000__16f1:
  16f1  170019         LBSR 0x170d                       
  16f4  CC1936         LDD #0x1936                       
  16f7  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  16fb  6038           addr 6038                         
LAB_M6C_r2_0c000__16fd:
  16fd  3506           PULS  A B                         
  16ff  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1700
FUN_M6C_r2_0c000__1700:
  1700  3426           PSHS  Y B A                       
  1702  FC6074         LDD 0x6074                        
  1705  FD7064         STD 0x7064                        
  1708  8D03           BSR 0x170d                        
  170a  3526           PULS  A B Y                       
  170c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__170d
FUN_M6C_r2_0c000__170d:
  170d  3416           PSHS  X B A                       
  170f  FC7064         LDD 0x7064                        
  1712  10830000       CMPD #0x0                         
  1716  10270086       LBEQ 0x17a0                       
  171a  C600           LDB #0x0                          
  171c  AD9FFC36       JSR [0xfc36]                      

; ---- function FUN_M6C_r2_0c000__1720
FUN_M6C_r2_0c000__1720:
  1720  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "hit enter for:          "
  1724  68697420656E.. char[25] "hit enter for:          "
LAB_M6C_r2_0c000__173d:
  173d  FC7064         LDD 0x7064                        
  1740  10830001       CMPD #0x1                         
  1744  1027008E       LBEQ 0x17d6                       
  1748  FC7064         LDD 0x7064                        
  174b  10830002       CMPD #0x2                         
  174f  102700AA       LBEQ 0x17fd                       
  1753  FC7064         LDD 0x7064                        
  1756  10830003       CMPD #0x3                         
  175a  102700C6       LBEQ 0x1824                       
  175e  FC7064         LDD 0x7064                        
  1761  10830004       CMPD #0x4                         
  1765  102700E2       LBEQ 0x184b                       
  1769  FC7064         LDD 0x7064                        
  176c  10830005       CMPD #0x5                         
  1770  102700FE       LBEQ 0x1872                       
  1774  FC7064         LDD 0x7064                        
  1777  10830006       CMPD #0x6                         
  177b  1027011A       LBEQ 0x1899                       
  177f  FC7064         LDD 0x7064                        
  1782  10830007       CMPD #0x7                         
  1786  10270136       LBEQ 0x18c0                       
  178a  FC7064         LDD 0x7064                        
  178d  10830008       CMPD #0x8                         
  1791  10270152       LBEQ 0x18e7                       
  1795  FC7064         LDD 0x7064                        
  1798  10830009       CMPD #0x9                         
  179c  1027016E       LBEQ 0x190e                       
LAB_M6C_r2_0c000__17a0:
  17a0  C600           LDB #0x0                          
  17a2  AD9FFC36       JSR [0xfc36]                      
  17a6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panning control - use knob for options  "
  17aa  70616E6E696E.. char[41] "panning control - use knob for options  "
LAB_M6C_r2_0c000__17d3:
  17d3  16015C         LBRA 0x1932                       
LAB_M6C_r2_0c000__17d6:
  17d6  C60F           LDB #0xf                          
  17d8  AD9FFC36       JSR [0xfc36]                      
  17dc  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panned center            "
  17e0  70616E6E6564.. char[26] "panned center            "
LAB_M6C_r2_0c000__17fa:
  17fa  160135         LBRA 0x1932                       
LAB_M6C_r2_0c000__17fd:
  17fd  C60F           LDB #0xf                          
  17ff  AD9FFC36       JSR [0xfc36]                      
  1803  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panned left              "
  1807  70616E6E6564.. char[26] "panned left              "
LAB_M6C_r2_0c000__1821:
  1821  16010E         LBRA 0x1932                       
LAB_M6C_r2_0c000__1824:
  1824  C60F           LDB #0xf                          
  1826  AD9FFC36       JSR [0xfc36]                      
  182a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "panned right             "
  182e  70616E6E6564.. char[26] "panned right             "
LAB_M6C_r2_0c000__1848:
  1848  1600E7         LBRA 0x1932                       
LAB_M6C_r2_0c000__184b:
  184b  C60F           LDB #0xf                          
  184d  AD9FFC36       JSR [0xfc36]                      
  1851  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "alternating left & right "
  1855  616C7465726E.. char[26] "alternating left & right "
LAB_M6C_r2_0c000__186f:
  186f  1600C0         LBRA 0x1932                       
LAB_M6C_r2_0c000__1872:
  1872  C60F           LDB #0xf                          
  1874  AD9FFC36       JSR [0xfc36]                      
  1878  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "left to right sweep      "
  187c  6C6566742074.. char[26] "left to right sweep      "
LAB_M6C_r2_0c000__1896:
  1896  160099         LBRA 0x1932                       
LAB_M6C_r2_0c000__1899:
  1899  C60F           LDB #0xf                          
  189b  AD9FFC36       JSR [0xfc36]                      
  189f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "right to left sweep      "
  18a3  726967687420.. char[26] "right to left sweep      "
LAB_M6C_r2_0c000__18bd:
  18bd  160072         LBRA 0x1932                       
LAB_M6C_r2_0c000__18c0:
  18c0  C60F           LDB #0xf                          
  18c2  AD9FFC36       JSR [0xfc36]                      
  18c6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "spread from center       "
  18ca  737072656164.. char[26] "spread from center       "
LAB_M6C_r2_0c000__18e4:
  18e4  16004B         LBRA 0x1932                       
LAB_M6C_r2_0c000__18e7:
  18e7  C60F           LDB #0xf                          
  18e9  AD9FFC36       JSR [0xfc36]                      
  18ed  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "merge to center          "
  18f1  6D6572676520.. char[26] "merge to center          "
LAB_M6C_r2_0c000__190b:
  190b  160024         LBRA 0x1932                       
LAB_M6C_r2_0c000__190e:
  190e  C60F           LDB #0xf                          
  1910  AD9FFC36       JSR [0xfc36]                      
  1914  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "random panning           "
  1918  72616E646F6D.. char[26] "random panning           "
LAB_M6C_r2_0c000__1932:
  1932  3516           PULS  A B X                       
  1934  39             RTS                               
  1935  .db 39                                               ; 9

; ---- function FUN_M6C_r2_0c000__1936
FUN_M6C_r2_0c000__1936:
  1936  3476           PSHS  U Y X B A                   
  1938  108E0008       LDY #0x8                          
  193c  FC7064         LDD 0x7064                        
  193f  AD9FFE40       JSR [0xfe40]                      
  1943  FC7064         LDD 0x7064                        
  1946  10830000       CMPD #0x0                         
  194a  10270063       LBEQ 0x19b1                       
  194e  FC7064         LDD 0x7064                        
  1951  10830001       CMPD #0x1                         
  1955  1027005B       LBEQ 0x19b4                       
  1959  FC7064         LDD 0x7064                        
  195c  10830002       CMPD #0x2                         
  1960  10270055       LBEQ 0x19b9                       
  1964  FC7064         LDD 0x7064                        
  1967  10830003       CMPD #0x3                         
  196b  1027004F       LBEQ 0x19be                       
  196f  FC7064         LDD 0x7064                        
  1972  10830004       CMPD #0x4                         
  1976  10270056       LBEQ 0x19d0                       
  197a  FC7064         LDD 0x7064                        
  197d  10830005       CMPD #0x5                         
  1981  10270068       LBEQ 0x19ed                       
  1985  FC7064         LDD 0x7064                        
  1988  10830006       CMPD #0x6                         
  198c  10270070       LBEQ 0x1a00                       
  1990  FC7064         LDD 0x7064                        
  1993  10830007       CMPD #0x7                         
  1997  10270078       LBEQ 0x1a13                       
  199b  FC7064         LDD 0x7064                        
  199e  10830008       CMPD #0x8                         
  19a2  102700AC       LBEQ 0x1a52                       
  19a6  FC7064         LDD 0x7064                        
  19a9  10830009       CMPD #0x9                         
  19ad  102700E0       LBEQ 0x1a91                       
LAB_M6C_r2_0c000__19b1:
  19b1  1600F8         LBRA 0x1aac                       
LAB_M6C_r2_0c000__19b4:
  19b4  CC0000         LDD #0x0                          
  19b7  200A           BRA 0x19c3                        
LAB_M6C_r2_0c000__19b9:
  19b9  CCFFF5         LDD #0xfff5                       
  19bc  2005           BRA 0x19c3                        
LAB_M6C_r2_0c000__19be:
  19be  CC000B         LDD #0xb                          
  19c1  2000           BRA 0x19c3                        
LAB_M6C_r2_0c000__19c3:
  19c3  8E707C         LDX #0x707c                       
LAB_M6C_r2_0c000__19c6:
  19c6  ED81           STD ,X++                          
  19c8  8C7092         CMPX #0x7092                      
  19cb  2FF9           BLE 0x19c6                        
  19cd  1600DC         LBRA 0x1aac                       
LAB_M6C_r2_0c000__19d0:
  19d0  8E707C         LDX #0x707c                       
  19d3  CCFFF5         LDD #0xfff5                       
LAB_M6C_r2_0c000__19d6:
  19d6  ED81           STD ,X++                          
  19d8  3606           PSHU  B A                         
  19da  CCFFFF         LDD #0xffff                       
  19dd  3606           PSHU  B A                         
  19df  AD9FFCEC       JSR [0xfcec]                      
  19e3  3706           PULU  A B                         
  19e5  8C7092         CMPX #0x7092                      
  19e8  2FEC           BLE 0x19d6                        
  19ea  1600BF         LBRA 0x1aac                       
LAB_M6C_r2_0c000__19ed:
  19ed  8E707C         LDX #0x707c                       
  19f0  CCFFF5         LDD #0xfff5                       
LAB_M6C_r2_0c000__19f3:
  19f3  ED81           STD ,X++                          
  19f5  C30002         ADDD #0x2                         
  19f8  8C7092         CMPX #0x7092                      
  19fb  2FF6           BLE 0x19f3                        
  19fd  1600AC         LBRA 0x1aac                       
LAB_M6C_r2_0c000__1a00:
  1a00  8E707C         LDX #0x707c                       
  1a03  CC000B         LDD #0xb                          
LAB_M6C_r2_0c000__1a06:
  1a06  ED81           STD ,X++                          
  1a08  830002         SUBD #0x2                         
  1a0b  8C7092         CMPX #0x7092                      
  1a0e  2FF6           BLE 0x1a06                        
  1a10  160099         LBRA 0x1aac                       
LAB_M6C_r2_0c000__1a13:
  1a13  8E707C         LDX #0x707c                       
  1a16  CC0001         LDD #0x1                          
  1a19  FD701E         STD 0x701e                        
  1a1c  CC0000         LDD #0x0                          
  1a1f  FD701C         STD 0x701c                        
LAB_M6C_r2_0c000__1a22:
  1a22  ED81           STD ,X++                          
  1a24  7C701D         INC 0x701d                        
  1a27  FC701E         LDD 0x701e                        
  1a2a  3606           PSHU  B A                         
  1a2c  CCFFFF         LDD #0xffff                       
  1a2f  3606           PSHU  B A                         
  1a31  AD9FFCEC       JSR [0xfcec]                      
  1a35  3706           PULU  A B                         
  1a37  FD701E         STD 0x701e                        
  1a3a  FC701E         LDD 0x701e                        
  1a3d  3606           PSHU  B A                         
  1a3f  FC701C         LDD 0x701c                        
  1a42  3606           PSHU  B A                         
  1a44  AD9FFCEC       JSR [0xfcec]                      
  1a48  3706           PULU  A B                         
  1a4a  8C7092         CMPX #0x7092                      
  1a4d  2FD3           BLE 0x1a22                        
  1a4f  16005A         LBRA 0x1aac                       
LAB_M6C_r2_0c000__1a52:
  1a52  8E707C         LDX #0x707c                       
  1a55  CC0001         LDD #0x1                          
  1a58  FD701E         STD 0x701e                        
  1a5b  CC000B         LDD #0xb                          
  1a5e  FD701C         STD 0x701c                        
LAB_M6C_r2_0c000__1a61:
  1a61  ED81           STD ,X++                          
  1a63  7A701D         DEC 0x701d                        
  1a66  FC701E         LDD 0x701e                        
  1a69  3606           PSHU  B A                         
  1a6b  CCFFFF         LDD #0xffff                       
  1a6e  3606           PSHU  B A                         
  1a70  AD9FFCEC       JSR [0xfcec]                      
  1a74  3706           PULU  A B                         
  1a76  FD701E         STD 0x701e                        
  1a79  FC701E         LDD 0x701e                        
  1a7c  3606           PSHU  B A                         
  1a7e  FC701C         LDD 0x701c                        
  1a81  3606           PSHU  B A                         
  1a83  AD9FFCEC       JSR [0xfcec]                      
  1a87  3706           PULU  A B                         
  1a89  8C7092         CMPX #0x7092                      
  1a8c  2FD3           BLE 0x1a61                        
  1a8e  16001B         LBRA 0x1aac                       
LAB_M6C_r2_0c000__1a91:
  1a91  8E707C         LDX #0x707c                       
LAB_M6C_r2_0c000__1a94:
  1a94  CC0016         LDD #0x16                         
  1a97  3606           PSHU  B A                         
  1a99  AD9FFCF8       JSR [0xfcf8]                      
  1a9d  3706           PULU  A B                         
  1a9f  83000B         SUBD #0xb                         
  1aa2  ED81           STD ,X++                          
  1aa4  8C7092         CMPX #0x7092                      
  1aa7  2FEB           BLE 0x1a94                        
  1aa9  160000         LBRA 0x1aac                       
LAB_M6C_r2_0c000__1aac:
  1aac  170CE1         LBSR 0x2790                       
  1aaf  170C73         LBSR 0x2725                       
  1ab2  C600           LDB #0x0                          
  1ab4  AD9FFC36       JSR [0xfc36]                      
  1ab8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "pans set - use knob for options         "
  1abc  70616E732073.. char[41] "pans set - use knob for options         "
LAB_M6C_r2_0c000__1ae5:
  1ae5  3576           PULS  A B X Y U                   
  1ae7  39             RTS                               
PTR_FUN_M6C_r2_0c000__1b6b_M6C_r2_0c000__1ae8:
  1ae8  1B6B           addr M6C_r2_0c000::1b6b           
  1aea  1B32           addr M6C_r2_0c000::1b32           
  1aec  .db 1B 26 70 58 70 5A 00 00 70 5C 00 08 00 4D 03 00  ; .&pXpZ..p\...M..
  1afc  .db 00 00 64 00 01 00 03 1E 1B 56 00 00 00 00 70 5E  ; ..d......V....p^
  1b0c  .db 00 5B                                            ; .[

; ---- function FUN_M6C_r2_0c000__1b0e
FUN_M6C_r2_0c000__1b0e:
  1b0e  3410           PSHS  X                           
  1b10  8E1AE8         LDX #0x1ae8                        ; desc[API_FE6A]: ->$1B6B ->$1B32
  1b13  AD9FFE6A       JSR [0xfe6a]                      
  1b17  3510           PULS  X                           
  1b19  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1b1a
FUN_M6C_r2_0c000__1b1a:
  1b1a  3410           PSHS  X                           
  1b1c  8E1AE8         LDX #0x1ae8                        ; desc[API_FDBC]: ->$1B6B ->$1B32
  1b1f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1b23  3510           PULS  X                           
  1b25  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1b26
FUN_M6C_r2_0c000__1b26:
  1b26  3410           PSHS  X                           
  1b28  8E1AE8         LDX #0x1ae8                        ; desc[API_FE6C]: ->$1B6B ->$1B32
  1b2b  AD9FFE6C       JSR [0xfe6c]                      
  1b2f  3510           PULS  X                           
  1b31  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1b32
FUN_M6C_r2_0c000__1b32:
  1b32  3410           PSHS  X                           
  1b34  8E1AE8         LDX #0x1ae8                        ; desc[API_FE6E]: ->$1B6B ->$1B32
  1b37  AD9FFE6E       JSR [0xfe6e]                      
  1b3b  3510           PULS  X                           
  1b3d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1b3e
FUN_M6C_r2_0c000__1b3e:
  1b3e  3410           PSHS  X                           
  1b40  8E1AE8         LDX #0x1ae8                        ; desc[API_FE1C]: ->$1B6B ->$1B32
  1b43  AD9FFE1C       JSR [0xfe1c]                      
  1b47  3510           PULS  X                           
  1b49  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1b4a
FUN_M6C_r2_0c000__1b4a:
  1b4a  3410           PSHS  X                           
  1b4c  8E1AE8         LDX #0x1ae8                        ; desc[API_FE1A]: ->$1B6B ->$1B32 $1B26
  1b4f  AD9FFE1A       JSR [0xfe1a]                      
  1b53  3510           PULS  X                           
  1b55  39             RTS                               
  1b56  .db 14 64 69 66 66 75 73 69 6F 6E 3A 20 20 20 20 25  ; .diffusion:    %
  1b66  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6C_r2_0c000__1b6b
FUN_M6C_r2_0c000__1b6b:
  1b6b  3476           PSHS  U Y X B A                   
  1b6d  8E1AE8         LDX #0x1ae8                       
  1b70  AD9FFE76       JSR [0xfe76]                      
  1b74  FC705C         LDD 0x705c                        
  1b77  3606           PSHU  B A                         
  1b79  CC0140         LDD #0x140                        
  1b7c  3606           PSHU  B A                         
  1b7e  AD9FFCF0       JSR [0xfcf0]                      
  1b82  3706           PULU  A B                         
  1b84  3706           PULU  A B                         
  1b86  FD7000         STD 0x7000                        
  1b89  CC000A         LDD #0xa                          
  1b8c  AD9FFD20       JSR [0xfd20]                      
  1b90  108E0212       LDY #0x212                        
  1b94  FC7000         LDD 0x7000                        
  1b97  AD9FFD2E       JSR [0xfd2e]                      
  1b9b  CC000A         LDD #0xa                          
  1b9e  AD9FFD20       JSR [0xfd20]                      
  1ba2  108E0213       LDY #0x213                        
  1ba6  FC7000         LDD 0x7000                        
  1ba9  AD9FFD2E       JSR [0xfd2e]                      
  1bad  CC000A         LDD #0xa                          
  1bb0  AD9FFD20       JSR [0xfd20]                      
  1bb4  108E0214       LDY #0x214                        
  1bb8  FC7000         LDD 0x7000                        
  1bbb  AD9FFD2E       JSR [0xfd2e]                      
  1bbf  CC000A         LDD #0xa                          
  1bc2  AD9FFD20       JSR [0xfd20]                      
  1bc6  108E0215       LDY #0x215                        
  1bca  FC7000         LDD 0x7000                        
  1bcd  AD9FFD2E       JSR [0xfd2e]                      
  1bd1  CC0000         LDD #0x0                          
  1bd4  B37000         SUBD 0x7000                       
  1bd7  FD7002         STD 0x7002                        
  1bda  CC000A         LDD #0xa                          
  1bdd  AD9FFD20       JSR [0xfd20]                      
  1be1  108E0216       LDY #0x216                        
  1be5  FC7002         LDD 0x7002                        
  1be8  AD9FFD2E       JSR [0xfd2e]                      
  1bec  CC000A         LDD #0xa                          
  1bef  AD9FFD20       JSR [0xfd20]                      
  1bf3  108E0217       LDY #0x217                        
  1bf7  FC7002         LDD 0x7002                        
  1bfa  AD9FFD2E       JSR [0xfd2e]                      
  1bfe  CC000A         LDD #0xa                          
  1c01  AD9FFD20       JSR [0xfd20]                      
  1c05  108E0218       LDY #0x218                        
  1c09  FC7002         LDD 0x7002                        
  1c0c  AD9FFD2E       JSR [0xfd2e]                      
  1c10  CC000A         LDD #0xa                          
  1c13  AD9FFD20       JSR [0xfd20]                      
  1c17  108E0219       LDY #0x219                        
  1c1b  FC7002         LDD 0x7002                        
  1c1e  AD9FFD2E       JSR [0xfd2e]                      
  1c22  FC7000         LDD 0x7000                        
  1c25  3606           PSHU  B A                         
  1c27  3606           PSHU  B A                         
  1c29  AD9FFCF2       JSR [0xfcf2]                      
  1c2d  3706           PULU  A B                         
  1c2f  FD701E         STD 0x701e                        
  1c32  CC7FFF         LDD #0x7fff                       
  1c35  B3701E         SUBD 0x701e                       
  1c38  FD7004         STD 0x7004                        
  1c3b  CC000A         LDD #0xa                          
  1c3e  AD9FFD20       JSR [0xfd20]                      
  1c42  108E021A       LDY #0x21a                        
  1c46  FC7004         LDD 0x7004                        
  1c49  AD9FFD2E       JSR [0xfd2e]                      
  1c4d  CC000A         LDD #0xa                          
  1c50  AD9FFD20       JSR [0xfd20]                      
  1c54  108E021B       LDY #0x21b                        
  1c58  FC7004         LDD 0x7004                        
  1c5b  AD9FFD2E       JSR [0xfd2e]                      
  1c5f  CC000A         LDD #0xa                          
  1c62  AD9FFD20       JSR [0xfd20]                      
  1c66  108E021C       LDY #0x21c                        
  1c6a  FC7004         LDD 0x7004                        
  1c6d  AD9FFD2E       JSR [0xfd2e]                      
  1c71  CC000A         LDD #0xa                          
  1c74  AD9FFD20       JSR [0xfd20]                      
  1c78  108E021D       LDY #0x21d                        
  1c7c  FC7004         LDD 0x7004                        
  1c7f  AD9FFD2E       JSR [0xfd2e]                      
  1c83  3576           PULS  A B X Y U                   
  1c85  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1c86
FUN_M6C_r2_0c000__1c86:
  1c86  3436           PSHS  Y X B A                     
  1c88  CC0000         LDD #0x0                          
  1c8b  204D           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1c8d
FUN_M6C_r2_0c000__1c8d:
  1c8d  3436           PSHS  Y X B A                     
  1c8f  CC0001         LDD #0x1                          
  1c92  2046           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1c94
FUN_M6C_r2_0c000__1c94:
  1c94  3436           PSHS  Y X B A                     
  1c96  CC0002         LDD #0x2                          
  1c99  203F           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1c9b
FUN_M6C_r2_0c000__1c9b:
  1c9b  3436           PSHS  Y X B A                     
  1c9d  CC0003         LDD #0x3                          
  1ca0  2038           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1ca2
FUN_M6C_r2_0c000__1ca2:
  1ca2  3436           PSHS  Y X B A                     
  1ca4  CC0004         LDD #0x4                          
  1ca7  2031           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1ca9
FUN_M6C_r2_0c000__1ca9:
  1ca9  3436           PSHS  Y X B A                     
  1cab  CC0005         LDD #0x5                          
  1cae  202A           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1cb0
FUN_M6C_r2_0c000__1cb0:
  1cb0  3436           PSHS  Y X B A                     
  1cb2  CC0006         LDD #0x6                          
  1cb5  2023           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1cb7
FUN_M6C_r2_0c000__1cb7:
  1cb7  3436           PSHS  Y X B A                     
  1cb9  CC0007         LDD #0x7                          
  1cbc  201C           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1cbe
FUN_M6C_r2_0c000__1cbe:
  1cbe  3436           PSHS  Y X B A                     
  1cc0  CC0008         LDD #0x8                          
  1cc3  2015           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1cc5
FUN_M6C_r2_0c000__1cc5:
  1cc5  3436           PSHS  Y X B A                     
  1cc7  CC0009         LDD #0x9                          
  1cca  200E           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1ccc
FUN_M6C_r2_0c000__1ccc:
  1ccc  3436           PSHS  Y X B A                     
  1cce  CC000A         LDD #0xa                          
  1cd1  2007           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1cd3
FUN_M6C_r2_0c000__1cd3:
  1cd3  3436           PSHS  Y X B A                     
  1cd5  CC000B         LDD #0xb                          
  1cd8  2000           BRA 0x1cda                        

; ---- function FUN_M6C_r2_0c000__1cda
FUN_M6C_r2_0c000__1cda:
  1cda  170A81         LBSR 0x275e                       
  1cdd  FC60F9         LDD 0x60f9                        
  1ce0  ED9F7008       STD [0x7008]                      
  1ce4  FD6074         STD 0x6074                        
  1ce7  10BE700E       LDY 0x700e                        
  1ceb  AD9FFC82       JSR [0xfc82]                      
  1cef  FC701A         LDD 0x701a                        
  1cf2  8607           LDA #0x7                          
  1cf4  3D             MUL                               
  1cf5  C31D08         ADDD #0x1d08                      
  1cf8  F3600D         ADDD 0x600d                       
  1cfb  1F01           TFR D,X                           
  1cfd  AD84           JSR ,X                            
  1cff  1700E6         LBSR 0x1de8                       
  1d02  17012B         LBSR 0x1e30                       
  1d05  3536           PULS  A B X Y                     
  1d07  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1d08
FUN_M6C_r2_0c000__1d08:
  1d08  3406           PSHS  B A                         
  1d0a  CC0000         LDD #0x0                          
  1d0d  204D           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d0f
FUN_M6C_r2_0c000__1d0f:
  1d0f  3406           PSHS  B A                         
  1d11  CC0001         LDD #0x1                          
  1d14  2046           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d16
FUN_M6C_r2_0c000__1d16:
  1d16  3406           PSHS  B A                         
  1d18  CC0002         LDD #0x2                          
  1d1b  203F           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d1d
FUN_M6C_r2_0c000__1d1d:
  1d1d  3406           PSHS  B A                         
  1d1f  CC0003         LDD #0x3                          
  1d22  2038           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d24
FUN_M6C_r2_0c000__1d24:
  1d24  3406           PSHS  B A                         
  1d26  CC0004         LDD #0x4                          
  1d29  2031           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d2b
FUN_M6C_r2_0c000__1d2b:
  1d2b  3406           PSHS  B A                         
  1d2d  CC0005         LDD #0x5                          
  1d30  202A           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d32
FUN_M6C_r2_0c000__1d32:
  1d32  3406           PSHS  B A                         
  1d34  CC0006         LDD #0x6                          
  1d37  2023           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d39
FUN_M6C_r2_0c000__1d39:
  1d39  3406           PSHS  B A                         
  1d3b  CC0007         LDD #0x7                          
  1d3e  201C           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d40
FUN_M6C_r2_0c000__1d40:
  1d40  3406           PSHS  B A                         
  1d42  CC0008         LDD #0x8                          
  1d45  2015           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d47
FUN_M6C_r2_0c000__1d47:
  1d47  3406           PSHS  B A                         
  1d49  CC0009         LDD #0x9                          
  1d4c  200E           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d4e
FUN_M6C_r2_0c000__1d4e:
  1d4e  3406           PSHS  B A                         
  1d50  CC000A         LDD #0xa                          
  1d53  2007           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d55
FUN_M6C_r2_0c000__1d55:
  1d55  3406           PSHS  B A                         
  1d57  CC000B         LDD #0xb                          
  1d5a  2000           BRA 0x1d5c                        

; ---- function FUN_M6C_r2_0c000__1d5c
FUN_M6C_r2_0c000__1d5c:
  1d5c  1709FF         LBSR 0x275e                       
  1d5f  EC9F7008       LDD [0x7008]                      
  1d63  FD6074         STD 0x6074                        
  1d66  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1DE8 ->$1D88 $0001 $0001 $0000
  1d6a  01             db 1h                             
  1d6b  01             db 1h                             
  1d6c  02             db 2h                             
  1d6d  01             db 1h                             
  1d6e  01             db 1h                             
  1d6f  01             db 1h                             
  1d70  05             db 5h                             
  1d71  80             db 80h                            
  1d72  1F40           dw 1F40h                          
  1d74  0000           dw 0h                             
  1d76  0000           dw 0h                             
  1d78  1DE8           addr M6C_r2_0c000::1de8           
  1d7a  1D88           addr M6C_r2_0c000::1d88           
  1d7c  0001           dw 1h                             
  1d7e  0001           dw 1h                             
  1d80  0000           dw 0h                             
LAB_M6C_r2_0c000__1d82:
  1d82  170063         LBSR 0x1de8                       
  1d85  3506           PULS  A B                         
  1d87  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1d88
FUN_M6C_r2_0c000__1d88:
  1d88  3466           PSHS  U Y B A                     
  1d8a  FC6074         LDD 0x6074                        
  1d8d  ED9F7008       STD [0x7008]                      
  1d91  170B3B         LBSR 0x28cf                       
  1d94  272F           BEQ 0x1dc5                        
  1d96  3706           PULU  A B                         
  1d98  E39F7008       ADDD [0x7008]                     
  1d9c  ED9F7008       STD [0x7008]                      
  1da0  FD6074         STD 0x6074                        
  1da3  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$1DE8 ->$1D88 $0001 $0001 $0000
  1da7  01             db 1h                             
  1da8  01             db 1h                             
  1da9  02             db 2h                             
  1daa  01             db 1h                             
  1dab  01             db 1h                             
  1dac  01             db 1h                             
  1dad  05             db 5h                             
  1dae  80             db 80h                            
  1daf  1F40           dw 1F40h                          
  1db1  0000           dw 0h                             
  1db3  0000           dw 0h                             
  1db5  1DE8           addr M6C_r2_0c000::1de8           
  1db7  1D88           addr M6C_r2_0c000::1d88           
  1db9  0001           dw 1h                             
  1dbb  0001           dw 1h                             
  1dbd  0000           dw 0h                             
LAB_M6C_r2_0c000__1dbf:
  1dbf  170026         LBSR 0x1de8                       
  1dc2  170B55         LBSR 0x291a                       
LAB_M6C_r2_0c000__1dc5:
  1dc5  10BE700E       LDY 0x700e                        
  1dc9  AD9FFC82       JSR [0xfc82]                      
  1dcd  8D61           BSR 0x1e30                        
  1dcf  FC701A         LDD 0x701a                        
  1dd2  C30009         ADDD #0x9                         
  1dd5  1F02           TFR D,Y                           
  1dd7  EC9F7008       LDD [0x7008]                      
  1ddb  AD9FFE40       JSR [0xfe40]                      
  1ddf  CC0000         LDD #0x0                          
  1de2  FD7060         STD 0x7060                        
  1de5  3566           PULS  A B Y U                     
  1de7  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1de8
FUN_M6C_r2_0c000__1de8:
  1de8  3416           PSHS  X B A                       
  1dea  17E81D         LBSR 0x060a                       
  1ded  C613           LDB #0x13                         
  1def  AD9FFC36       JSR [0xfc36]                      
  1df3  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay   :        mS "
  1df7  0A64656C6179.. char[22] "\ndelay   :        mS " 
LAB_M6C_r2_0c000__1e0d:
  1e0d  C619           LDB #0x19                         
  1e0f  AD9FFC36       JSR [0xfc36]                      
  1e13  FC701A         LDD 0x701a                        
  1e16  C30001         ADDD #0x1                         
  1e19  AD9FFC44       JSR [0xfc44]                      
  1e1d  C61F           LDB #0x1f                         
  1e1f  AD9FFC36       JSR [0xfc36]                      
  1e23  CC0005         LDD #0x5                          
  1e26  8E609E         LDX #0x609e                       
  1e29  AD9FFC3A       JSR [0xfc3a]                      
  1e2d  3516           PULS  A B X                       
  1e2f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1e30
FUN_M6C_r2_0c000__1e30:
  1e30  3466           PSHS  U Y B A                     
  1e32  EC9F7008       LDD [0x7008]                      
  1e36  3606           PSHU  B A                         
  1e38  CC0004         LDD #0x4                          
  1e3b  3606           PSHU  B A                         
  1e3d  AD9FFCEE       JSR [0xfcee]                      
  1e41  3706           PULU  A B                         
  1e43  FD701C         STD 0x701c                        
  1e46  EC9F7008       LDD [0x7008]                      
  1e4a  3606           PSHU  B A                         
  1e4c  CC347A         LDD #0x347a                       
  1e4f  3606           PSHU  B A                         
  1e51  AD9FFCF2       JSR [0xfcf2]                      
  1e55  3706           PULU  A B                         
  1e57  F3701C         ADDD 0x701c                       
  1e5a  E39F7012       ADDD [0x7012]                     
  1e5e  3606           PSHU  B A                         
  1e60  FC70E4         LDD 0x70e4                        
  1e63  3606           PSHU  B A                         
  1e65  AD9FFCF2       JSR [0xfcf2]                      
  1e69  3706           PULU  A B                         
  1e6b  C30001         ADDD #0x1                         
  1e6e  FD701C         STD 0x701c                        
  1e71  CC000A         LDD #0xa                          
  1e74  AD9FFD20       JSR [0xfd20]                      
  1e78  10BE7014       LDY 0x7014                        
  1e7c  FC701C         LDD 0x701c                        
  1e7f  AD9FFD2E       JSR [0xfd2e]                      
  1e83  3566           PULS  A B Y U                     
  1e85  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1e86
FUN_M6C_r2_0c000__1e86:
  1e86  3436           PSHS  Y X B A                     
  1e88  CC0000         LDD #0x0                          
  1e8b  204D           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1e8d
FUN_M6C_r2_0c000__1e8d:
  1e8d  3436           PSHS  Y X B A                     
  1e8f  CC0001         LDD #0x1                          
  1e92  2046           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1e94
FUN_M6C_r2_0c000__1e94:
  1e94  3436           PSHS  Y X B A                     
  1e96  CC0002         LDD #0x2                          
  1e99  203F           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1e9b
FUN_M6C_r2_0c000__1e9b:
  1e9b  3436           PSHS  Y X B A                     
  1e9d  CC0003         LDD #0x3                          
  1ea0  2038           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1ea2
FUN_M6C_r2_0c000__1ea2:
  1ea2  3436           PSHS  Y X B A                     
  1ea4  CC0004         LDD #0x4                          
  1ea7  2031           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1ea9
FUN_M6C_r2_0c000__1ea9:
  1ea9  3436           PSHS  Y X B A                     
  1eab  CC0005         LDD #0x5                          
  1eae  202A           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1eb0
FUN_M6C_r2_0c000__1eb0:
  1eb0  3436           PSHS  Y X B A                     
  1eb2  CC0006         LDD #0x6                          
  1eb5  2023           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1eb7
FUN_M6C_r2_0c000__1eb7:
  1eb7  3436           PSHS  Y X B A                     
  1eb9  CC0007         LDD #0x7                          
  1ebc  201C           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1ebe
FUN_M6C_r2_0c000__1ebe:
  1ebe  3436           PSHS  Y X B A                     
  1ec0  CC0008         LDD #0x8                          
  1ec3  2015           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1ec5
FUN_M6C_r2_0c000__1ec5:
  1ec5  3436           PSHS  Y X B A                     
  1ec7  CC0009         LDD #0x9                          
  1eca  200E           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1ecc
FUN_M6C_r2_0c000__1ecc:
  1ecc  3436           PSHS  Y X B A                     
  1ece  CC000A         LDD #0xa                          
  1ed1  2007           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1ed3
FUN_M6C_r2_0c000__1ed3:
  1ed3  3436           PSHS  Y X B A                     
  1ed5  CC000B         LDD #0xb                          
  1ed8  2000           BRA 0x1eda                        

; ---- function FUN_M6C_r2_0c000__1eda
FUN_M6C_r2_0c000__1eda:
  1eda  1708CF         LBSR 0x27ac                       
  1edd  FC60F9         LDD 0x60f9                        
  1ee0  ED9F7006       STD [0x7006]                      
  1ee4  FD6074         STD 0x6074                        
  1ee7  10BE700C       LDY 0x700c                        
  1eeb  AD9FFC82       JSR [0xfc82]                      
  1eef  FC701A         LDD 0x701a                        
  1ef2  8607           LDA #0x7                          
  1ef4  3D             MUL                               
  1ef5  C31F08         ADDD #0x1f08                      
  1ef8  F3600D         ADDD 0x600d                       
  1efb  1F01           TFR D,X                           
  1efd  AD84           JSR ,X                            
  1eff  1700E5         LBSR 0x1fe7                       
  1f02  1700F7         LBSR 0x1ffc                       
  1f05  3536           PULS  A B X Y                     
  1f07  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1f08
FUN_M6C_r2_0c000__1f08:
  1f08  3406           PSHS  B A                         
  1f0a  CC0000         LDD #0x0                          
  1f0d  204D           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f0f
FUN_M6C_r2_0c000__1f0f:
  1f0f  3406           PSHS  B A                         
  1f11  CC0001         LDD #0x1                          
  1f14  2046           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f16
FUN_M6C_r2_0c000__1f16:
  1f16  3406           PSHS  B A                         
  1f18  CC0002         LDD #0x2                          
  1f1b  203F           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f1d
FUN_M6C_r2_0c000__1f1d:
  1f1d  3406           PSHS  B A                         
  1f1f  CC0003         LDD #0x3                          
  1f22  2038           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f24
FUN_M6C_r2_0c000__1f24:
  1f24  3406           PSHS  B A                         
  1f26  CC0004         LDD #0x4                          
  1f29  2031           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f2b
FUN_M6C_r2_0c000__1f2b:
  1f2b  3406           PSHS  B A                         
  1f2d  CC0005         LDD #0x5                          
  1f30  202A           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f32
FUN_M6C_r2_0c000__1f32:
  1f32  3406           PSHS  B A                         
  1f34  CC0006         LDD #0x6                          
  1f37  2023           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f39
FUN_M6C_r2_0c000__1f39:
  1f39  3406           PSHS  B A                         
  1f3b  CC0007         LDD #0x7                          
  1f3e  201C           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f40
FUN_M6C_r2_0c000__1f40:
  1f40  3406           PSHS  B A                         
  1f42  CC0008         LDD #0x8                          
  1f45  2015           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f47
FUN_M6C_r2_0c000__1f47:
  1f47  3406           PSHS  B A                         
  1f49  CC0009         LDD #0x9                          
  1f4c  200E           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f4e
FUN_M6C_r2_0c000__1f4e:
  1f4e  3406           PSHS  B A                         
  1f50  CC000A         LDD #0xa                          
  1f53  2007           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f55
FUN_M6C_r2_0c000__1f55:
  1f55  3406           PSHS  B A                         
  1f57  CC000B         LDD #0xb                          
  1f5a  2000           BRA 0x1f5c                        

; ---- function FUN_M6C_r2_0c000__1f5c
FUN_M6C_r2_0c000__1f5c:
  1f5c  17084D         LBSR 0x27ac                       
  1f5f  EC9F7006       LDD [0x7006]                      
  1f63  FD6074         STD 0x6074                        
  1f66  17E6A1         LBSR 0x060a                       
  1f69  C613           LDB #0x13                         
  1f6b  AD9FFC36       JSR [0xfc36]                      
  1f6f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " level   :       %   "
  1f73  0A6C6576656C.. char[22] "\nlevel   :       %   " 
LAB_M6C_r2_0c000__1f89:
  1f89  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $03E8 $FC18 $0000 ->$1FE7 ->$1FBB $0001 $0001 $0000
  1f8d  01             db 1h                             
  1f8e  01             db 1h                             
  1f8f  02             db 2h                             
  1f90  01             db 1h                             
  1f91  01             db 1h                             
  1f92  01             db 1h                             
  1f93  05             db 5h                             
  1f94  80             db 80h                            
  1f95  03E8           dw 3E8h                           
  1f97  FC18           dw FC18h                          
  1f99  0000           dw 0h                             
  1f9b  1FE7           addr M6C_r2_0c000::1fe7           
  1f9d  1FBB           addr M6C_r2_0c000::1fbb           
  1f9f  0001           dw 1h                             
  1fa1  0001           dw 1h                             
  1fa3  0000           dw 0h                             
LAB_M6C_r2_0c000__1fa5:
  1fa5  17003F         LBSR 0x1fe7                       
  1fa8  C619           LDB #0x19                         
  1faa  AD9FFC36       JSR [0xfc36]                      
  1fae  FC701A         LDD 0x701a                        
  1fb1  C30001         ADDD #0x1                         
  1fb4  AD9FFC44       JSR [0xfc44]                      
  1fb8  3506           PULS  A B                         
  1fba  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1fbb
FUN_M6C_r2_0c000__1fbb:
  1fbb  3426           PSHS  Y B A                       
  1fbd  FC6074         LDD 0x6074                        
  1fc0  ED9F7006       STD [0x7006]                      
  1fc4  10BE700C       LDY 0x700c                        
  1fc8  AD9FFC82       JSR [0xfc82]                      
  1fcc  8D2E           BSR 0x1ffc                        
  1fce  FC701A         LDD 0x701a                        
  1fd1  C30015         ADDD #0x15                        
  1fd4  1F02           TFR D,Y                           
  1fd6  EC9F7006       LDD [0x7006]                      
  1fda  AD9FFE40       JSR [0xfe40]                      
  1fde  CC0000         LDD #0x0                          
  1fe1  FD7062         STD 0x7062                        
  1fe4  3526           PULS  A B Y                       
  1fe6  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1fe7
FUN_M6C_r2_0c000__1fe7:
  1fe7  3416           PSHS  X B A                       
  1fe9  C61D           LDB #0x1d                         
  1feb  AD9FFC36       JSR [0xfc36]                      
  1fef  CC0006         LDD #0x6                          
  1ff2  8E609D         LDX #0x609d                       
  1ff5  AD9FFC3A       JSR [0xfc3a]                      
  1ff9  3516           PULS  A B X                       
  1ffb  39             RTS                               

; ---- function FUN_M6C_r2_0c000__1ffc
FUN_M6C_r2_0c000__1ffc:
  1ffc  3476           PSHS  U Y X B A                   
  1ffe  EC9F7006       LDD [0x7006]                      
  2002  2608           BNE 0x200c                        
  2004  FD7020         STD 0x7020                        
  2007  FD7022         STD 0x7022                        
  200a  2040           BRA 0x204c                        
LAB_M6C_r2_0c000__200c:
  200c  3606           PSHU  B A                         
  200e  CC000B         LDD #0xb                          
  2011  3606           PSHU  B A                         
  2013  AD9FFCEC       JSR [0xfcec]                      
  2017  3706           PULU  A B                         
  2019  FD701C         STD 0x701c                        
  201c  EC9F7006       LDD [0x7006]                      
  2020  3606           PSHU  B A                         
  2022  EC9F700A       LDD [0x700a]                      
  2026  3606           PSHU  B A                         
  2028  AD9FFCEC       JSR [0xfcec]                      
  202c  FC70E2         LDD 0x70e2                        
  202f  3606           PSHU  B A                         
  2031  AD9FFCF2       JSR [0xfcf2]                      
  2035  3706           PULU  A B                         
  2037  FD701E         STD 0x701e                        
  203a  FC701C         LDD 0x701c                        
  203d  F3701E         ADDD 0x701e                       
  2040  FD7020         STD 0x7020                        
  2043  FC701C         LDD 0x701c                        
  2046  B3701E         SUBD 0x701e                       
  2049  FD7022         STD 0x7022                        
LAB_M6C_r2_0c000__204c:
  204c  CC000A         LDD #0xa                          
  204f  AD9FFD20       JSR [0xfd20]                      
  2053  10BE7018       LDY 0x7018                        
  2057  FC7020         LDD 0x7020                        
  205a  AD9FFD2E       JSR [0xfd2e]                      
  205e  CC000A         LDD #0xa                          
  2061  AD9FFD20       JSR [0xfd20]                      
  2065  10BE7016       LDY 0x7016                        
  2069  FC7022         LDD 0x7022                        
  206c  AD9FFD2E       JSR [0xfd2e]                      
  2070  3576           PULS  A B X Y U                   
  2072  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2073
FUN_M6C_r2_0c000__2073:
  2073  3436           PSHS  Y X B A                     
  2075  CC0000         LDD #0x0                          
  2078  204D           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__207a
FUN_M6C_r2_0c000__207a:
  207a  3436           PSHS  Y X B A                     
  207c  CC0001         LDD #0x1                          
  207f  2046           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__2081
FUN_M6C_r2_0c000__2081:
  2081  3436           PSHS  Y X B A                     
  2083  CC0002         LDD #0x2                          
  2086  203F           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__2088
FUN_M6C_r2_0c000__2088:
  2088  3436           PSHS  Y X B A                     
  208a  CC0003         LDD #0x3                          
  208d  2038           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__208f
FUN_M6C_r2_0c000__208f:
  208f  3436           PSHS  Y X B A                     
  2091  CC0004         LDD #0x4                          
  2094  2031           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__2096
FUN_M6C_r2_0c000__2096:
  2096  3436           PSHS  Y X B A                     
  2098  CC0005         LDD #0x5                          
  209b  202A           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__209d
FUN_M6C_r2_0c000__209d:
  209d  3436           PSHS  Y X B A                     
  209f  CC0006         LDD #0x6                          
  20a2  2023           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__20a4
FUN_M6C_r2_0c000__20a4:
  20a4  3436           PSHS  Y X B A                     
  20a6  CC0007         LDD #0x7                          
  20a9  201C           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__20ab
FUN_M6C_r2_0c000__20ab:
  20ab  3436           PSHS  Y X B A                     
  20ad  CC0008         LDD #0x8                          
  20b0  2015           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__20b2
FUN_M6C_r2_0c000__20b2:
  20b2  3436           PSHS  Y X B A                     
  20b4  CC0009         LDD #0x9                          
  20b7  200E           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__20b9
FUN_M6C_r2_0c000__20b9:
  20b9  3436           PSHS  Y X B A                     
  20bb  CC000A         LDD #0xa                          
  20be  2007           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__20c0
FUN_M6C_r2_0c000__20c0:
  20c0  3436           PSHS  Y X B A                     
  20c2  CC000B         LDD #0xb                          
  20c5  2000           BRA 0x20c7                        

; ---- function FUN_M6C_r2_0c000__20c7
FUN_M6C_r2_0c000__20c7:
  20c7  1706E2         LBSR 0x27ac                       
  20ca  FC60F9         LDD 0x60f9                        
  20cd  ED9F700A       STD [0x700a]                      
  20d1  FD6074         STD 0x6074                        
  20d4  10BE7010       LDY 0x7010                        
  20d8  AD9FFC80       JSR [0xfc80]                      
  20dc  FC701A         LDD 0x701a                        
  20df  8607           LDA #0x7                          
  20e1  3D             MUL                               
  20e2  C320F5         ADDD #0x20f5                      
  20e5  F3600D         ADDD 0x600d                       
  20e8  1F01           TFR D,X                           
  20ea  AD84           JSR ,X                            
  20ec  1700FB         LBSR 0x21ea                       
  20ef  1700FB         LBSR 0x21ed                       
  20f2  3536           PULS  A B X Y                     
  20f4  39             RTS                               

; ---- function FUN_M6C_r2_0c000__20f5
FUN_M6C_r2_0c000__20f5:
  20f5  3406           PSHS  B A                         
  20f7  CC0000         LDD #0x0                          
  20fa  204D           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__20fc
FUN_M6C_r2_0c000__20fc:
  20fc  3406           PSHS  B A                         
  20fe  CC0001         LDD #0x1                          
  2101  2046           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2103
FUN_M6C_r2_0c000__2103:
  2103  3406           PSHS  B A                         
  2105  CC0002         LDD #0x2                          
  2108  203F           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__210a
FUN_M6C_r2_0c000__210a:
  210a  3406           PSHS  B A                         
  210c  CC0003         LDD #0x3                          
  210f  2038           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2111
FUN_M6C_r2_0c000__2111:
  2111  3406           PSHS  B A                         
  2113  CC0004         LDD #0x4                          
  2116  2031           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2118
FUN_M6C_r2_0c000__2118:
  2118  3406           PSHS  B A                         
  211a  CC0005         LDD #0x5                          
  211d  202A           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__211f
FUN_M6C_r2_0c000__211f:
  211f  3406           PSHS  B A                         
  2121  CC0006         LDD #0x6                          
  2124  2023           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2126
FUN_M6C_r2_0c000__2126:
  2126  3406           PSHS  B A                         
  2128  CC0007         LDD #0x7                          
  212b  201C           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__212d
FUN_M6C_r2_0c000__212d:
  212d  3406           PSHS  B A                         
  212f  CC0008         LDD #0x8                          
  2132  2015           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2134
FUN_M6C_r2_0c000__2134:
  2134  3406           PSHS  B A                         
  2136  CC0009         LDD #0x9                          
  2139  200E           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__213b
FUN_M6C_r2_0c000__213b:
  213b  3406           PSHS  B A                         
  213d  CC000A         LDD #0xa                          
  2140  2007           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2142
FUN_M6C_r2_0c000__2142:
  2142  3406           PSHS  B A                         
  2144  CC000B         LDD #0xb                          
  2147  2000           BRA 0x2149                        

; ---- function FUN_M6C_r2_0c000__2149
FUN_M6C_r2_0c000__2149:
  2149  170660         LBSR 0x27ac                       
  214c  EC9F700A       LDD [0x700a]                      
  2150  FD6074         STD 0x6074                        
  2153  17E4B4         LBSR 0x060a                       
  2156  C604           LDB #0x4                          
  2158  AD9FFC36       JSR [0xfc36]                      
  215c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " pan   : L-           C           -R"
  2160  0A70616E2020.. char[37] "\npan   : L-           C           -R"
LAB_M6C_r2_0c000__2185:
  2185  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$21ED ->$21BA $0001 $0001 $0000
  2189  01             db 1h                             
  218a  01             db 1h                             
  218b  02             db 2h                             
  218c  01             db 1h                             
  218d  01             db 1h                             
  218e  00             db 0h                             
  218f  03             db 3h                             
  2190  80             db 80h                            
  2191  000B           dw Bh                             
  2193  FFF5           dw FFF5h                          
  2195  0000           dw 0h                             
  2197  21ED           addr M6C_r2_0c000::21ed           
  2199  21BA           addr M6C_r2_0c000::21ba           
  219b  0001           dw 1h                             
  219d  0001           dw 1h                             
  219f  0000           dw 0h                             
LAB_M6C_r2_0c000__21a1:
  21a1  170049         LBSR 0x21ed                       
  21a4  C608           LDB #0x8                          
  21a6  AD9FFC36       JSR [0xfc36]                      
  21aa  FC701A         LDD 0x701a                        
  21ad  C30001         ADDD #0x1                         
  21b0  AD9FFC44       JSR [0xfc44]                      
  21b4  170037         LBSR 0x21ee                       
  21b7  3506           PULS  A B                         
  21b9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__21ba
FUN_M6C_r2_0c000__21ba:
  21ba  3426           PSHS  Y B A                       
  21bc  FC6074         LDD 0x6074                        
  21bf  ED9F700A       STD [0x700a]                      
  21c3  10BE7010       LDY 0x7010                        
  21c7  AD9FFC80       JSR [0xfc80]                      
  21cb  17001C         LBSR 0x21ea                       
  21ce  17001D         LBSR 0x21ee                       
  21d1  FC701A         LDD 0x701a                        
  21d4  C30021         ADDD #0x21                        
  21d7  1F02           TFR D,Y                           
  21d9  EC9F700A       LDD [0x700a]                      
  21dd  AD9FFE40       JSR [0xfe40]                      
  21e1  CC0000         LDD #0x0                          
  21e4  FD7064         STD 0x7064                        
  21e7  3526           PULS  A B Y                       
  21e9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__21ea
FUN_M6C_r2_0c000__21ea:
  21ea  17FE0F         LBSR 0x1ffc                       

; ---- function FUN_M6C_r2_0c000__21ed
FUN_M6C_r2_0c000__21ed:
  21ed  39             RTS                               

; ---- function FUN_M6C_r2_0c000__21ee
FUN_M6C_r2_0c000__21ee:
  21ee  3456           PSHS  U X B A                     
  21f0  C60F           LDB #0xf                          
  21f2  AD9FFC36       JSR [0xfc36]                      
  21f6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "           C           "
  21fa  202020202020.. char[24] "           C           "
LAB_M6C_r2_0c000__2212:
  2212  EC9F700A       LDD [0x700a]                      
  2216  C3000B         ADDD #0xb                         
  2219  C3000F         ADDD #0xf                         
  221c  AD9FFC36       JSR [0xfc36]                      
  2220  C62A           LDB #0x2a                         
  2222  AD9FFC2A       JSR [0xfc2a]                      
  2226  3556           PULS  A B X U                     
  2228  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2229
FUN_M6C_r2_0c000__2229:
  2229  3436           PSHS  Y X B A                     
  222b  CC0000         LDD #0x0                          
  222e  2015           BRA 0x2245                        

; ---- function FUN_M6C_r2_0c000__2230
FUN_M6C_r2_0c000__2230:
  2230  3436           PSHS  Y X B A                     
  2232  CC0001         LDD #0x1                          
  2235  200E           BRA 0x2245                        

; ---- function FUN_M6C_r2_0c000__2237
FUN_M6C_r2_0c000__2237:
  2237  3436           PSHS  Y X B A                     
  2239  CC0002         LDD #0x2                          
  223c  2007           BRA 0x2245                        

; ---- function FUN_M6C_r2_0c000__223e
FUN_M6C_r2_0c000__223e:
  223e  3436           PSHS  Y X B A                     
  2240  CC0003         LDD #0x3                          
  2243  2000           BRA 0x2245                        

; ---- function FUN_M6C_r2_0c000__2245
FUN_M6C_r2_0c000__2245:
  2245  1705C4         LBSR 0x280c                       
  2248  FC60F9         LDD 0x60f9                        
  224b  ED9F7008       STD [0x7008]                      
  224f  FD6074         STD 0x6074                        
  2252  10BE700E       LDY 0x700e                        
  2256  AD9FFC82       JSR [0xfc82]                      
  225a  FC701A         LDD 0x701a                        
  225d  8607           LDA #0x7                          
  225f  3D             MUL                               
  2260  C32273         ADDD #0x2273                      
  2263  F3600D         ADDD 0x600d                       
  2266  1F01           TFR D,X                           
  2268  AD84           JSR ,X                            
  226a  1700A8         LBSR 0x2315                       
  226d  1700ED         LBSR 0x235d                       
  2270  3536           PULS  A B X Y                     
  2272  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2273
FUN_M6C_r2_0c000__2273:
  2273  3406           PSHS  B A                         
  2275  CC0000         LDD #0x0                          
  2278  2015           BRA 0x228f                        

; ---- function FUN_M6C_r2_0c000__227a
FUN_M6C_r2_0c000__227a:
  227a  3406           PSHS  B A                         
  227c  CC0001         LDD #0x1                          
  227f  200E           BRA 0x228f                        

; ---- function FUN_M6C_r2_0c000__2281
FUN_M6C_r2_0c000__2281:
  2281  3406           PSHS  B A                         
  2283  CC0002         LDD #0x2                          
  2286  2007           BRA 0x228f                        

; ---- function FUN_M6C_r2_0c000__2288
FUN_M6C_r2_0c000__2288:
  2288  3406           PSHS  B A                         
  228a  CC0003         LDD #0x3                          
  228d  2000           BRA 0x228f                        

; ---- function FUN_M6C_r2_0c000__228f
FUN_M6C_r2_0c000__228f:
  228f  17057A         LBSR 0x280c                       
  2292  EC9F7008       LDD [0x7008]                      
  2296  FD6074         STD 0x6074                        
  2299  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$2315 ->$22BB $0001 $0001 $0000
  229d  01             db 1h                             
  229e  01             db 1h                             
  229f  02             db 2h                             
  22a0  01             db 1h                             
  22a1  01             db 1h                             
  22a2  01             db 1h                             
  22a3  05             db 5h                             
  22a4  80             db 80h                            
  22a5  1F40           dw 1F40h                          
  22a7  0000           dw 0h                             
  22a9  0000           dw 0h                             
  22ab  2315           addr M6C_r2_0c000::2315           
  22ad  22BB           addr M6C_r2_0c000::22bb           
  22af  0001           dw 1h                             
  22b1  0001           dw 1h                             
  22b3  0000           dw 0h                             
LAB_M6C_r2_0c000__22b5:
  22b5  17005D         LBSR 0x2315                       
  22b8  3506           PULS  A B                         
  22ba  39             RTS                               

; ---- function FUN_M6C_r2_0c000__22bb
FUN_M6C_r2_0c000__22bb:
  22bb  3466           PSHS  U Y B A                     
  22bd  FC6074         LDD 0x6074                        
  22c0  ED9F7008       STD [0x7008]                      
  22c4  170608         LBSR 0x28cf                       
  22c7  272F           BEQ 0x22f8                        
  22c9  3706           PULU  A B                         
  22cb  E39F7008       ADDD [0x7008]                     
  22cf  ED9F7008       STD [0x7008]                      
  22d3  FD6074         STD 0x6074                        
  22d6  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 01 05 80 $1F40 $0000 $0000 ->$2315 ->$22BB $0001 $0001 $0000
  22da  01             db 1h                             
  22db  01             db 1h                             
  22dc  02             db 2h                             
  22dd  01             db 1h                             
  22de  01             db 1h                             
  22df  01             db 1h                             
  22e0  05             db 5h                             
  22e1  80             db 80h                            
  22e2  1F40           dw 1F40h                          
  22e4  0000           dw 0h                             
  22e6  0000           dw 0h                             
  22e8  2315           addr M6C_r2_0c000::2315           
  22ea  22BB           addr M6C_r2_0c000::22bb           
  22ec  0001           dw 1h                             
  22ee  0001           dw 1h                             
  22f0  0000           dw 0h                             
LAB_M6C_r2_0c000__22f2:
  22f2  170020         LBSR 0x2315                       
  22f5  170622         LBSR 0x291a                       
LAB_M6C_r2_0c000__22f8:
  22f8  10BE700E       LDY 0x700e                        
  22fc  AD9FFC82       JSR [0xfc82]                      
  2300  FC701A         LDD 0x701a                        
  2303  C3002D         ADDD #0x2d                        
  2306  1F02           TFR D,Y                           
  2308  EC9F7008       LDD [0x7008]                      
  230c  AD9FFE40       JSR [0xfe40]                      
  2310  8D4B           BSR 0x235d                        
  2312  3566           PULS  A B Y U                     
  2314  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2315
FUN_M6C_r2_0c000__2315:
  2315  3416           PSHS  X B A                       
  2317  17E2F0         LBSR 0x060a                       
  231a  C613           LDB #0x13                         
  231c  AD9FFC36       JSR [0xfc36]                      
  2320  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " ap delay   :      mS"
  2324  0A6170206465.. char[22] "\nap delay   :      mS" 
LAB_M6C_r2_0c000__233a:
  233a  C61C           LDB #0x1c                         
  233c  AD9FFC36       JSR [0xfc36]                      
  2340  FC701A         LDD 0x701a                        
  2343  C30001         ADDD #0x1                         
  2346  AD9FFC44       JSR [0xfc44]                      
  234a  C621           LDB #0x21                         
  234c  AD9FFC36       JSR [0xfc36]                      
  2350  CC0005         LDD #0x5                          
  2353  8E609E         LDX #0x609e                       
  2356  AD9FFC3A       JSR [0xfc3a]                      
  235a  3516           PULS  A B X                       
  235c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__235d
FUN_M6C_r2_0c000__235d:
  235d  3466           PSHS  U Y B A                     
  235f  EC9F7008       LDD [0x7008]                      
  2363  3606           PSHU  B A                         
  2365  CC0004         LDD #0x4                          
  2368  3606           PSHU  B A                         
  236a  AD9FFCEE       JSR [0xfcee]                      
  236e  3706           PULU  A B                         
  2370  FD701C         STD 0x701c                        
  2373  EC9F7008       LDD [0x7008]                      
  2377  3606           PSHU  B A                         
  2379  CC347A         LDD #0x347a                       
  237c  3606           PSHU  B A                         
  237e  AD9FFCF2       JSR [0xfcf2]                      
  2382  3706           PULU  A B                         
  2384  F3701C         ADDD 0x701c                       
  2387  E39F7012       ADDD [0x7012]                     
  238b  FD701C         STD 0x701c                        
  238e  CC000A         LDD #0xa                          
  2391  AD9FFD20       JSR [0xfd20]                      
  2395  10BE7014       LDY 0x7014                        
  2399  FC701C         LDD 0x701c                        
  239c  AD9FFD2E       JSR [0xfd2e]                      
  23a0  3566           PULS  A B Y U                     
  23a2  39             RTS                               
PTR_FUN_M6C_r2_0c000__2426_M6C_r2_0c000__23a3:
  23a3  2426           addr M6C_r2_0c000::2426           
  23a5  23ED           addr M6C_r2_0c000::23ed           
  23a7  .db 23 E1 70 30 70 32 00 00 70 34 00 08 00 45 00 00  ; #.p0p2..p4...E..
  23b7  .db 00 00 64 00 01 00 03 1D 24 11 00 00 00 00 70 36  ; ..d.....$.....p6
  23c7  .db 00 53                                            ; .S

; ---- function FUN_M6C_r2_0c000__23c9
FUN_M6C_r2_0c000__23c9:
  23c9  3410           PSHS  X                           
  23cb  8E23A3         LDX #0x23a3                        ; desc[API_FE6A]: ->$2426 ->$23ED
  23ce  AD9FFE6A       JSR [0xfe6a]                      
  23d2  3510           PULS  X                           
  23d4  39             RTS                               

; ---- function FUN_M6C_r2_0c000__23d5
FUN_M6C_r2_0c000__23d5:
  23d5  3410           PSHS  X                           
  23d7  8E23A3         LDX #0x23a3                        ; desc[API_FDBC]: ->$2426 ->$23ED
  23da  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..#."
  23de  3510           PULS  X                           
  23e0  39             RTS                               

; ---- function FUN_M6C_r2_0c000__23e1
FUN_M6C_r2_0c000__23e1:
  23e1  3410           PSHS  X                           
  23e3  8E23A3         LDX #0x23a3                        ; desc[API_FE6C]: ->$2426 ->$23ED
  23e6  AD9FFE6C       JSR [0xfe6c]                      
  23ea  3510           PULS  X                           
  23ec  39             RTS                               

; ---- function FUN_M6C_r2_0c000__23ed
FUN_M6C_r2_0c000__23ed:
  23ed  3410           PSHS  X                           
  23ef  8E23A3         LDX #0x23a3                        ; desc[API_FE6E]: ->$2426 ->$23ED
  23f2  AD9FFE6E       JSR [0xfe6e]                      
  23f6  3510           PULS  X                           
  23f8  39             RTS                               

; ---- function FUN_M6C_r2_0c000__23f9
FUN_M6C_r2_0c000__23f9:
  23f9  3410           PSHS  X                           
  23fb  8E23A3         LDX #0x23a3                        ; desc[API_FE1C]: ->$2426 ->$23ED
  23fe  AD9FFE1C       JSR [0xfe1c]                      
  2402  3510           PULS  X                           
  2404  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2405
FUN_M6C_r2_0c000__2405:
  2405  3410           PSHS  X                           
  2407  8E23A3         LDX #0x23a3                        ; desc[API_FE1A]: ->$2426 ->$23ED $23E1
  240a  AD9FFE1A       JSR [0xfe1a]                      
  240e  3510           PULS  X                           
  2410  39             RTS                               
  2411  .db 14 6C 65 66 74 20 6D 69 78 3A 20 20 20 20 25 20  ; .left mix:    % 
  2421  .db 77 65 74 20 20                                   ; wet  

; ---- function FUN_M6C_r2_0c000__2426
FUN_M6C_r2_0c000__2426:
  2426  3476           PSHS  U Y X B A                   
  2428  8E23A3         LDX #0x23a3                       
  242b  AD9FFE76       JSR [0xfe76]                      
  242f  CC0064         LDD #0x64                         
  2432  B37034         SUBD 0x7034                       
  2435  3606           PSHU  B A                         
  2437  58             LSLB                              
  2438  49             ROLA                              
  2439  FD701C         STD 0x701c                        
  243c  CC4666         LDD #0x4666                       
  243f  3606           PSHU  B A                         
  2441  AD9FFCF2       JSR [0xfcf2]                      
  2445  3706           PULU  A B                         
  2447  F3701C         ADDD 0x701c                       
  244a  AD9FFC6A       JSR [0xfc6a]                      
  244e  3576           PULS  A B X Y U                   
  2450  39             RTS                               
PTR_FUN_M6C_r2_0c000__24d4_M6C_r2_0c000__2451:
  2451  24D4           addr M6C_r2_0c000::24d4           
  2453  249B           addr M6C_r2_0c000::249b           
  2455  .db 24 8F 70 38 70 3A 00 00 70 3C 00 08 00 47 01 00  ; $.p8p:..p<...G..
  2465  .db 00 00 64 00 01 00 03 1E 24 BF 00 00 00 00 70 3E  ; ..d.....$.....p>
  2475  .db 00 55                                            ; .U

; ---- function FUN_M6C_r2_0c000__2477
FUN_M6C_r2_0c000__2477:
  2477  3410           PSHS  X                           
  2479  8E2451         LDX #0x2451                        ; desc[API_FE6A]: ->$24D4 ->$249B
  247c  AD9FFE6A       JSR [0xfe6a]                      
  2480  3510           PULS  X                           
  2482  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2483
FUN_M6C_r2_0c000__2483:
  2483  3410           PSHS  X                           
  2485  8E2451         LDX #0x2451                        ; desc[API_FDBC]: ->$24D4 ->$249B
  2488  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$Q"
  248c  3510           PULS  X                           
  248e  39             RTS                               

; ---- function FUN_M6C_r2_0c000__248f
FUN_M6C_r2_0c000__248f:
  248f  3410           PSHS  X                           
  2491  8E2451         LDX #0x2451                        ; desc[API_FE6C]: ->$24D4 ->$249B
  2494  AD9FFE6C       JSR [0xfe6c]                      
  2498  3510           PULS  X                           
  249a  39             RTS                               

; ---- function FUN_M6C_r2_0c000__249b
FUN_M6C_r2_0c000__249b:
  249b  3410           PSHS  X                           
  249d  8E2451         LDX #0x2451                        ; desc[API_FE6E]: ->$24D4 ->$249B
  24a0  AD9FFE6E       JSR [0xfe6e]                      
  24a4  3510           PULS  X                           
  24a6  39             RTS                               

; ---- function FUN_M6C_r2_0c000__24a7
FUN_M6C_r2_0c000__24a7:
  24a7  3410           PSHS  X                           
  24a9  8E2451         LDX #0x2451                        ; desc[API_FE1C]: ->$24D4 ->$249B
  24ac  AD9FFE1C       JSR [0xfe1c]                      
  24b0  3510           PULS  X                           
  24b2  39             RTS                               

; ---- function FUN_M6C_r2_0c000__24b3
FUN_M6C_r2_0c000__24b3:
  24b3  3410           PSHS  X                           
  24b5  8E2451         LDX #0x2451                        ; desc[API_FE1A]: ->$24D4 ->$249B $248F
  24b8  AD9FFE1A       JSR [0xfe1a]                      
  24bc  3510           PULS  X                           
  24be  39             RTS                               
  24bf  .db 14 72 69 67 68 74 20 6D 69 78 3A 20 20 20 20 25  ; .right mix:    %
  24cf  .db 20 77 65 74 20                                   ;  wet 

; ---- function FUN_M6C_r2_0c000__24d4
FUN_M6C_r2_0c000__24d4:
  24d4  3476           PSHS  U Y X B A                   
  24d6  8E2451         LDX #0x2451                       
  24d9  AD9FFE76       JSR [0xfe76]                      
  24dd  CC0064         LDD #0x64                         
  24e0  B3703C         SUBD 0x703c                       
  24e3  3606           PSHU  B A                         
  24e5  58             LSLB                              
  24e6  49             ROLA                              
  24e7  FD701C         STD 0x701c                        
  24ea  CC4666         LDD #0x4666                       
  24ed  3606           PSHU  B A                         
  24ef  AD9FFCF2       JSR [0xfcf2]                      
  24f3  3706           PULU  A B                         
  24f5  F3701C         ADDD 0x701c                       
  24f8  AD9FFC72       JSR [0xfc72]                      
  24fc  3576           PULS  A B X Y U                   
  24fe  39             RTS                               
PTR_FUN_M6C_r2_0c000__256a_M6C_r2_0c000__24ff:
  24ff  256A           addr M6C_r2_0c000::256a           
  2501  2549           addr M6C_r2_0c000::2549           
  2503  .db 25 3D 70 40 70 42 00 00 70 44 00 08 00 21 33 FF  ; %=p@pB..pD...!3.
  2513  .db D0 00 30 00 01 00 03 1C 25 55 00 00 00 00 00 00  ; ..0.....%U......
  2523  .db 00 00                                            ; ..

; ---- function FUN_M6C_r2_0c000__2525
FUN_M6C_r2_0c000__2525:
  2525  3410           PSHS  X                           
  2527  8E24FF         LDX #0x24ff                       
  252a  AD9FFE74       JSR [0xfe74]                      
  252e  3510           PULS  X                           
  2530  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2531
FUN_M6C_r2_0c000__2531:
  2531  3410           PSHS  X                           
  2533  8E24FF         LDX #0x24ff                        ; desc[API_FE22]: ->$256A ->$2549
  2536  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  253a  3510           PULS  X                           
  253c  39             RTS                               

; ---- function FUN_M6C_r2_0c000__253d
FUN_M6C_r2_0c000__253d:
  253d  3410           PSHS  X                           
  253f  8E24FF         LDX #0x24ff                       
  2542  AD9FFE70       JSR [0xfe70]                      
  2546  3510           PULS  X                           
  2548  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2549
FUN_M6C_r2_0c000__2549:
  2549  3410           PSHS  X                           
  254b  8E24FF         LDX #0x24ff                       
  254e  AD9FFE72       JSR [0xfe72]                      
  2552  3510           PULS  X                           
  2554  39             RTS                               
  2555  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  2565  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6C_r2_0c000__256a
FUN_M6C_r2_0c000__256a:
  256a  3476           PSHS  U Y X B A                   
  256c  8E24FF         LDX #0x24ff                       
  256f  AD9FFE76       JSR [0xfe76]                      
  2573  AD9FFE52       JSR [0xfe52]                      
  2577  3576           PULS  A B X Y U                   
  2579  39             RTS                               
PTR_FUN_M6C_r2_0c000__25e5_M6C_r2_0c000__257a:
  257a  25E5           addr M6C_r2_0c000::25e5           
  257c  25C4           addr M6C_r2_0c000::25c4           
  257e  .db 25 B8 70 46 70 48 00 00 70 4A 00 08 00 22 34 FF  ; %.pFpH..pJ..."4.
  258e  .db D0 00 30 00 01 00 03 1D 25 D0 00 00 00 00 00 00  ; ..0.....%.......
  259e  .db 00 00                                            ; ..

; ---- function FUN_M6C_r2_0c000__25a0
FUN_M6C_r2_0c000__25a0:
  25a0  3410           PSHS  X                           
  25a2  8E257A         LDX #0x257a                       
  25a5  AD9FFE74       JSR [0xfe74]                      
  25a9  3510           PULS  X                           
  25ab  39             RTS                               

; ---- function FUN_M6C_r2_0c000__25ac
FUN_M6C_r2_0c000__25ac:
  25ac  3410           PSHS  X                           
  25ae  8E257A         LDX #0x257a                        ; desc[API_FE22]: ->$25E5 ->$25C4
  25b1  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  25b5  3510           PULS  X                           
  25b7  39             RTS                               

; ---- function FUN_M6C_r2_0c000__25b8
FUN_M6C_r2_0c000__25b8:
  25b8  3410           PSHS  X                           
  25ba  8E257A         LDX #0x257a                       
  25bd  AD9FFE70       JSR [0xfe70]                      
  25c1  3510           PULS  X                           
  25c3  39             RTS                               

; ---- function FUN_M6C_r2_0c000__25c4
FUN_M6C_r2_0c000__25c4:
  25c4  3410           PSHS  X                           
  25c6  8E257A         LDX #0x257a                       
  25c9  AD9FFE72       JSR [0xfe72]                      
  25cd  3510           PULS  X                           
  25cf  39             RTS                               
  25d0  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  25e0  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6C_r2_0c000__25e5
FUN_M6C_r2_0c000__25e5:
  25e5  3476           PSHS  U Y X B A                   
  25e7  8E257A         LDX #0x257a                       
  25ea  AD9FFE76       JSR [0xfe76]                      
  25ee  AD9FFE54       JSR [0xfe54]                      
  25f2  3576           PULS  A B X Y U                   
  25f4  39             RTS                               
PTR_FUN_M6C_r2_0c000__2660_M6C_r2_0c000__25f5:
  25f5  2660           addr M6C_r2_0c000::2660           
  25f7  263F           addr M6C_r2_0c000::263f           
  25f9  .db 26 33 70 4C 70 4E 00 00 70 50 00 08 00 23 35 FF  ; &3pLpN..pP...#5.
  2609  .db D0 00 30 00 01 00 03 1D 26 4B 00 00 00 00 00 00  ; ..0.....&K......
  2619  .db 00 00                                            ; ..

; ---- function FUN_M6C_r2_0c000__261b
FUN_M6C_r2_0c000__261b:
  261b  3410           PSHS  X                           
  261d  8E25F5         LDX #0x25f5                       
  2620  AD9FFE74       JSR [0xfe74]                      
  2624  3510           PULS  X                           
  2626  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2627
FUN_M6C_r2_0c000__2627:
  2627  3410           PSHS  X                           
  2629  8E25F5         LDX #0x25f5                        ; desc[API_FE22]: ->$2660 ->$263F
  262c  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2630  3510           PULS  X                           
  2632  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2633
FUN_M6C_r2_0c000__2633:
  2633  3410           PSHS  X                           
  2635  8E25F5         LDX #0x25f5                       
  2638  AD9FFE70       JSR [0xfe70]                      
  263c  3510           PULS  X                           
  263e  39             RTS                               

; ---- function FUN_M6C_r2_0c000__263f
FUN_M6C_r2_0c000__263f:
  263f  3410           PSHS  X                           
  2641  8E25F5         LDX #0x25f5                       
  2644  AD9FFE72       JSR [0xfe72]                      
  2648  3510           PULS  X                           
  264a  39             RTS                               
  264b  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  265b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M6C_r2_0c000__2660
FUN_M6C_r2_0c000__2660:
  2660  3476           PSHS  U Y X B A                   
  2662  8E25F5         LDX #0x25f5                       
  2665  AD9FFE76       JSR [0xfe76]                      
  2669  AD9FFE56       JSR [0xfe56]                      
  266d  3576           PULS  A B X Y U                   
  266f  39             RTS                               
PTR_FUN_M6C_r2_0c000__26db_M6C_r2_0c000__2670:
  2670  26DB           addr M6C_r2_0c000::26db           
  2672  26BA           addr M6C_r2_0c000::26ba           
  2674  .db 26 AE 70 52 70 54 00 00 70 56 00 08 00 24 36 FF  ; &.pRpT..pV...$6.
  2684  .db D0 00 30 00 01 00 03 1E 26 C6 00 00 00 00 00 00  ; ..0.....&.......
  2694  .db 00 00                                            ; ..

; ---- function FUN_M6C_r2_0c000__2696
FUN_M6C_r2_0c000__2696:
  2696  3410           PSHS  X                           
  2698  8E2670         LDX #0x2670                       
  269b  AD9FFE74       JSR [0xfe74]                      
  269f  3510           PULS  X                           
  26a1  39             RTS                               

; ---- function FUN_M6C_r2_0c000__26a2
FUN_M6C_r2_0c000__26a2:
  26a2  3410           PSHS  X                           
  26a4  8E2670         LDX #0x2670                        ; desc[API_FE22]: ->$26DB ->$26BA
  26a7  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  26ab  3510           PULS  X                           
  26ad  39             RTS                               

; ---- function FUN_M6C_r2_0c000__26ae
FUN_M6C_r2_0c000__26ae:
  26ae  3410           PSHS  X                           
  26b0  8E2670         LDX #0x2670                       
  26b3  AD9FFE70       JSR [0xfe70]                      
  26b7  3510           PULS  X                           
  26b9  39             RTS                               

; ---- function FUN_M6C_r2_0c000__26ba
FUN_M6C_r2_0c000__26ba:
  26ba  3410           PSHS  X                           
  26bc  8E2670         LDX #0x2670                       
  26bf  AD9FFE72       JSR [0xfe72]                      
  26c3  3510           PULS  X                           
  26c5  39             RTS                               
  26c6  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  26d6  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M6C_r2_0c000__26db
FUN_M6C_r2_0c000__26db:
  26db  3476           PSHS  U Y X B A                   
  26dd  8E2670         LDX #0x2670                       
  26e0  AD9FFE76       JSR [0xfe76]                      
  26e4  AD9FFE58       JSR [0xfe58]                      
  26e8  3576           PULS  A B X Y U                   
  26ea  39             RTS                               

; ---- function FUN_M6C_r2_0c000__26eb
FUN_M6C_r2_0c000__26eb:
  26eb  3476           PSHS  U Y X B A                   
  26ed  8E7094         LDX #0x7094                       
  26f0  CC0062         LDD #0x62                         
  26f3  830008         SUBD #0x8                         
  26f6  1F02           TFR D,Y                           
LAB_M6C_r2_0c000__26f8:
  26f8  EC81           LDD ,X++                          
  26fa  AD9FFC82       JSR [0xfc82]                      
  26fe  3122           LEAY 0x2,Y                        
  2700  8C70AA         CMPX #0x70aa                      
  2703  2FF3           BLE 0x26f8                        
  2705  3576           PULS  A B X Y U                   
  2707  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2708
FUN_M6C_r2_0c000__2708:
  2708  3476           PSHS  U Y X B A                   
  270a  8E70AC         LDX #0x70ac                       
  270d  CC007A         LDD #0x7a                         
  2710  830008         SUBD #0x8                         
  2713  1F02           TFR D,Y                           
LAB_M6C_r2_0c000__2715:
  2715  EC81           LDD ,X++                          
  2717  AD9FFC82       JSR [0xfc82]                      
  271b  3122           LEAY 0x2,Y                        
  271d  8C70C2         CMPX #0x70c2                      
  2720  2FF3           BLE 0x2715                        
  2722  3576           PULS  A B X Y U                   
  2724  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2725
FUN_M6C_r2_0c000__2725:
  2725  3476           PSHS  U Y X B A                   
  2727  8E707C         LDX #0x707c                       
  272a  CC0092         LDD #0x92                         
  272d  830008         SUBD #0x8                         
  2730  1F02           TFR D,Y                           
LAB_M6C_r2_0c000__2732:
  2732  EC81           LDD ,X++                          
  2734  AD9FFC80       JSR [0xfc80]                      
  2738  3121           LEAY 0x1,Y                        
  273a  8C7092         CMPX #0x7092                      
  273d  2FF3           BLE 0x2732                        
  273f  3576           PULS  A B X Y U                   
  2741  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2742
FUN_M6C_r2_0c000__2742:
  2742  3476           PSHS  U Y X B A                   
  2744  1700F7         LBSR 0x283e                       
  2747  4F             CLRA                              
  2748  5F             CLRB                              
LAB_M6C_r2_0c000__2749:
  2749  170012         LBSR 0x275e                       
  274c  17F6E1         LBSR 0x1e30                       
  274f  C30001         ADDD #0x1                         
  2752  1083000B       CMPD #0xb                         
  2756  2FF1           BLE 0x2749                        
  2758  17011F         LBSR 0x287a                       
  275b  3576           PULS  A B X Y U                   
  275d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__275e
FUN_M6C_r2_0c000__275e:
  275e  3406           PSHS  B A                         
  2760  FD701A         STD 0x701a                        
  2763  C3041E         ADDD #0x41e                       
  2766  FD7014         STD 0x7014                        
  2769  FC701A         LDD 0x701a                        
  276c  58             LSLB                              
  276d  C37094         ADDD #0x7094                      
  2770  FD7008         STD 0x7008                        
  2773  FC701A         LDD 0x701a                        
  2776  58             LSLB                              
  2777  C30062         ADDD #0x62                        
  277a  830008         SUBD #0x8                         
  277d  FD700E         STD 0x700e                        
  2780  FC701A         LDD 0x701a                        
  2783  58             LSLB                              
  2784  C3293E         ADDD #0x293e                      
  2787  F3600D         ADDD 0x600d                       
  278a  FD7012         STD 0x7012                        
  278d  3506           PULS  A B                         
  278f  39             RTS                               

; ---- function FUN_M6C_r2_0c000__2790
FUN_M6C_r2_0c000__2790:
  2790  3476           PSHS  U Y X B A                   
  2792  1700A9         LBSR 0x283e                       
  2795  4F             CLRA                              
  2796  5F             CLRB                              
LAB_M6C_r2_0c000__2797:
  2797  170012         LBSR 0x27ac                       
  279a  17F85F         LBSR 0x1ffc                       
  279d  C30001         ADDD #0x1                         
  27a0  1083000B       CMPD #0xb                         
  27a4  2FF1           BLE 0x2797                        
  27a6  1700D1         LBSR 0x287a                       
  27a9  3576           PULS  A B X Y U                   
  27ab  39             RTS                               

; ---- function FUN_M6C_r2_0c000__27ac
FUN_M6C_r2_0c000__27ac:
  27ac  3406           PSHS  B A                         
  27ae  FD701A         STD 0x701a                        
  27b1  C3011E         ADDD #0x11e                       
  27b4  FD7016         STD 0x7016                        
  27b7  FC701A         LDD 0x701a                        
  27ba  C30132         ADDD #0x132                       
  27bd  FD7018         STD 0x7018                        
  27c0  FC701A         LDD 0x701a                        
  27c3  58             LSLB                              
  27c4  C370AC         ADDD #0x70ac                      
  27c7  FD7006         STD 0x7006                        
  27ca  FC701A         LDD 0x701a                        
  27cd  58             LSLB                              
  27ce  C3707C         ADDD #0x707c                      
  27d1  FD700A         STD 0x700a                        
  27d4  FC701A         LDD 0x701a                        
  27d7  58             LSLB                              
  27d8  C3007A         ADDD #0x7a                        
  27db  830008         SUBD #0x8                         
  27de  FD700C         STD 0x700c                        
  27e1  FC701A         LDD 0x701a                        
  27e4  C30092         ADDD #0x92                        
  27e7  830008         SUBD #0x8                         
  27ea  FD7010         STD 0x7010                        
  27ed  3506           PULS  A B                         
  27ef  39             RTS                               

; ---- function FUN_M6C_r2_0c000__27f0
FUN_M6C_r2_0c000__27f0:
  27f0  3476           PSHS  U Y X B A                   
  27f2  170049         LBSR 0x283e                       
  27f5  4F             CLRA                              
  27f6  5F             CLRB                              
LAB_M6C_r2_0c000__27f7:
  27f7  170012         LBSR 0x280c                       
  27fa  17FB60         LBSR 0x235d                       
  27fd  C30001         ADDD #0x1                         
  2800  10830003       CMPD #0x3                         
  2804  2FF1           BLE 0x27f7                        
  2806  170071         LBSR 0x287a                       
  2809  3576           PULS  A B X Y U                   
  280b  39             RTS                               

; ---- function FUN_M6C_r2_0c000__280c
FUN_M6C_r2_0c000__280c:
  280c  3406           PSHS  B A                         
  280e  FD701A         STD 0x701a                        
  2811  C3043C         ADDD #0x43c                       
  2814  FD7014         STD 0x7014                        
  2817  FC701A         LDD 0x701a                        
  281a  58             LSLB                              
  281b  C370C4         ADDD #0x70c4                      
  281e  FD7008         STD 0x7008                        
  2821  FC701A         LDD 0x701a                        
  2824  58             LSLB                              
  2825  C3009E         ADDD #0x9e                        
  2828  830008         SUBD #0x8                         
  282b  FD700E         STD 0x700e                        
  282e  FC701A         LDD 0x701a                        
  2831  58             LSLB                              
  2832  C3293E         ADDD #0x293e                      
  2835  F3600D         ADDD 0x600d                       
  2838  FD7012         STD 0x7012                        
  283b  3506           PULS  A B                         
  283d  39             RTS                               

; ---- function FUN_M6C_r2_0c000__283e
FUN_M6C_r2_0c000__283e:
  283e  3436           PSHS  Y X B A                     
  2840  FC701A         LDD 0x701a                        
  2843  3606           PSHU  B A                         
  2845  FC7014         LDD 0x7014                        
  2848  3606           PSHU  B A                         
  284a  FC7008         LDD 0x7008                        
  284d  3606           PSHU  B A                         
  284f  FC700E         LDD 0x700e                        
  2852  3606           PSHU  B A                         
  2854  FC7012         LDD 0x7012                        
  2857  3606           PSHU  B A                         
  2859  FC7016         LDD 0x7016                        
  285c  3606           PSHU  B A                         
  285e  FC7018         LDD 0x7018                        
  2861  3606           PSHU  B A                         
  2863  FC7006         LDD 0x7006                        
  2866  3606           PSHU  B A                         
  2868  FC700C         LDD 0x700c                        
  286b  3606           PSHU  B A                         
  286d  FC700A         LDD 0x700a                        
  2870  3606           PSHU  B A                         
  2872  FC7010         LDD 0x7010                        
  2875  3606           PSHU  B A                         
  2877  3536           PULS  A B X Y                     
  2879  39             RTS                               

; ---- function FUN_M6C_r2_0c000__287a
FUN_M6C_r2_0c000__287a:
  287a  3436           PSHS  Y X B A                     
  287c  3706           PULU  A B                         
  287e  FD7010         STD 0x7010                        
  2881  3706           PULU  A B                         
  2883  FD700A         STD 0x700a                        
  2886  3706           PULU  A B                         
  2888  FD700C         STD 0x700c                        
  288b  3706           PULU  A B                         
  288d  FD7006         STD 0x7006                        
  2890  3706           PULU  A B                         
  2892  FD7018         STD 0x7018                        
  2895  3706           PULU  A B                         
  2897  FD7016         STD 0x7016                        
  289a  3706           PULU  A B                         
  289c  FD7012         STD 0x7012                        
  289f  3706           PULU  A B                         
  28a1  FD700E         STD 0x700e                        
  28a4  3706           PULU  A B                         
  28a6  FD7008         STD 0x7008                        
  28a9  3706           PULU  A B                         
  28ab  FD7014         STD 0x7014                        
  28ae  3706           PULU  A B                         
  28b0  FD701A         STD 0x701a                        
  28b3  3536           PULS  A B X Y                     
  28b5  39             RTS                               

; ---- function FUN_M6C_r2_0c000__28b6
FUN_M6C_r2_0c000__28b6:
  28b6  3406           PSHS  B A                         
  28b8  CC0000         LDD #0x0                          
  28bb  B370C4         SUBD 0x70c4                       
  28be  B370C6         SUBD 0x70c6                       
  28c1  B370C8         SUBD 0x70c8                       
  28c4  B370CA         SUBD 0x70ca                       
  28c7  C338A4         ADDD #0x38a4                      
  28ca  3606           PSHU  B A                         
  28cc  3506           PULS  A B                         
  28ce  39             RTS                               

; ---- function FUN_M6C_r2_0c000__28cf
FUN_M6C_r2_0c000__28cf:
  28cf  3406           PSHS  B A                         
  28d1  CC0000         LDD #0x0                          
  28d4  B37094         SUBD 0x7094                       
  28d7  B37096         SUBD 0x7096                       
  28da  B37098         SUBD 0x7098                       
  28dd  B3709A         SUBD 0x709a                       
  28e0  B3709C         SUBD 0x709c                       
  28e3  B3709E         SUBD 0x709e                       
  28e6  B370A0         SUBD 0x70a0                       
  28e9  B370A2         SUBD 0x70a2                       
  28ec  B370A4         SUBD 0x70a4                       
  28ef  B370A6         SUBD 0x70a6                       
  28f2  B370A8         SUBD 0x70a8                       
  28f5  B370AA         SUBD 0x70aa                       
  28f8  B370C4         SUBD 0x70c4                       
  28fb  B370C6         SUBD 0x70c6                       
  28fe  B370C8         SUBD 0x70c8                       
  2901  B370CA         SUBD 0x70ca                       
  2904  C338A4         ADDD #0x38a4                      
  2907  3606           PSHU  B A                         
  2909  10830000       CMPD #0x0                         
  290d  2D05           BLT 0x2914                        
  290f  CC0000         LDD #0x0                          
  2912  2003           BRA 0x2917                        
LAB_M6C_r2_0c000__2914:
  2914  CCFFFF         LDD #0xffff                       
LAB_M6C_r2_0c000__2917:
  2917  3506           PULS  A B                         
  2919  39             RTS                               

; ---- function FUN_M6C_r2_0c000__291a
FUN_M6C_r2_0c000__291a:
  291a  3406           PSHS  B A                         
  291c  C614           LDB #0x14                         
  291e  AD9FFC36       JSR [0xfc36]                      
  2922  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "OOPS, no delay left "
  2926  4F4F50532C20.. char[21] "OOPS, no delay left "   
LAB_M6C_r2_0c000__293b:
  293b  3506           PULS  A B                         
  293d  39             RTS                               
  293e  .db 00 2F 00 0D 00 05 00 01 00 17 00 11 00 25 00 29  ; ./...........%.)
  294e  .db 00 0B 00 07 00 1F 00 13                          ; ........

;; TMS32010 program 14 for DSP 3: 515 words loaded at $800 (written via bank latch $83)
DSPPROG_14_DSP3_hdr:
  2956  141204100000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_14_DSP3:
  295e  08007F8B6E00.. dw[516]                           

;; TMS32010 program 04 for DSP 2: 541 words loaded at $800 (written via bank latch $82)
DSPPROG_04_DSP2_hdr:
  2d66  041104440000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_04_DSP2:
  2d6e  080068807F8B.. dw[542]                           

;; TMS32010 program 04 for DSP 3: 119 words loaded at $800 (written via bank latch $83)
DSPPROG_04_DSP3_hdr:
  31aa  041200F80000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_04_DSP3:
  31b2  08007F8B6E00.. dw[120]                           

;; End of record chain
END_OF_CHAIN_hdr:
  32a2  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  32aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  330a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  331a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  332a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  333a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  334a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  335a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  336a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  337a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  338a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  339a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  340a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  341a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  342a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  343a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  344a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  345a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  346a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  347a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  348a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  349a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  350a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  351a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  352a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  353a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  354a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  355a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  356a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  357a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  358a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  359a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  360a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  361a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  362a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  363a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  364a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  365a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  366a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  367a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  368a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  369a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  370a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  371a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  372a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  373a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  374a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  375a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  376a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  377a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  378a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  379a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  380a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  381a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  382a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  383a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  384a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  385a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  386a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  387a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  388a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  389a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  390a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  391a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  392a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  393a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  394a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  395a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  396a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  397a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  398a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  399a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39aa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39ba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39ca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39da  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39ea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39fa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a0a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a1a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a2a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a3a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a4a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a5a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a6a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a7a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a8a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a9a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aaa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ada  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3afa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b0a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b1a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b2a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b3a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b4a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b5a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b6a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b7a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b8a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b9a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3baa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bda  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bfa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c0a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c1a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c2a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c3a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c4a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c5a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c6a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c7a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c8a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c9a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3caa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cda  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cfa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d0a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d1a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d2a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d3a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d4a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d5a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d6a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d7a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d8a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d9a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3daa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dda  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dfa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e0a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e1a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e2a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e3a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e4a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e5a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e6a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e7a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e8a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e9a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eaa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eda  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3efa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f0a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f1a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f2a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f3a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f4a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f5a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f6a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f7a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f8a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f9a  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3faa  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fba  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fca  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fda  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fea  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ffa  .db FF FF FF FF FF 5F                                ; ....._
