; H3500  block M78_r3_24000  M78_r3_24000::0000-M78_r3_24000::3fff
; Bank r3_24000 (module id 78, sub 01)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 78 code record 01, 8083 bytes, entered at payload start
MODULE_78_01_CODE_hdr:
  0008  78011F9B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_78_01_entry
MODULE_78_01_entry:
  0010  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0014
  0014  0014           dw 14h                            
LAB_M78_r3_24000__0016:
  0016  3477           PSHS  U Y X B A CC                
  0018  108E7188       LDY #0x7188                       
  001c  8678           LDA #0x78                         
  001e  C606           LDB #0x6                          
  0020  AD9FFD22       JSR [0xfd22]                      
  0024  1701B4         LBSR 0x01db                       
  0027  170130         LBSR 0x015a                       
  002a  17019E         LBSR 0x01cb                       
  002d  C600           LDB #0x0                          
  002f  AD9FFC58       JSR [0xfc58]                      
  0033  8603           LDA #0x3                          
  0035  B760DA         STA 0x60da                        
  0038  AD9FFE38       JSR [0xfe38]                      
  003c  170099         LBSR 0x00d8                       
  003f  B6600A         LDA 0x600a                        
  0042  8178           CMPA #0x78                        
  0044  2707           BEQ 0x004d                        
  0046  1700B8         LBSR 0x0101                       
  0049  1026004C       LBNE 0x0099                       
LAB_M78_r3_24000__004d:
  004d  171F5C         LBSR 0x1fac                       
  0050  172656         LBSR 0x26a9                       
  0053  172D22         LBSR 0x2d78                       
  0056  1736CB         LBSR 0x3724                       
  0059  170230         LBSR 0x028c                       
  005c  1702D3         LBSR 0x0332                       
  005f  B6600A         LDA 0x600a                        
  0062  8178           CMPA #0x78                        
  0064  2703           BEQ 0x0069                        
  0066  173E75         LBSR 0x3ede                       
LAB_M78_r3_24000__0069:
  0069  AD9FFE36       JSR [0xfe36]                      
  006d  CC0941         LDD #0x941                        
  0070  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $7250
  0074  7250           addr 7250                         
LAB_M78_r3_24000__0076:
  0076  CC0941         LDD #0x941                        
  0079  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $7252
  007d  7252           addr 7252                         
LAB_M78_r3_24000__007f:
  007f  CC00CF         LDD #0xcf                         
  0082  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6015
  0086  6015           addr 6015                         
LAB_M78_r3_24000__0088:
  0088  AD9FFDF6       JSR [0xfdf6]                      
  008c  AD9FFE18       JSR [0xfe18]                      
  0090  1704B4         LBSR 0x0547                       
  0093  AD9FFE12       JSR [0xfe12]                      
  0097  2033           BRA 0x00cc                        
LAB_M78_r3_24000__0099:
  0099  C600           LDB #0x0                          
  009b  AD9FFC36       JSR [0xfc36]                      
  009f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  00a3  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M78_r3_24000__00cc:
  00cc  3577           PULS CC A B X Y U                 
  00ce  39             RTS                               
DAT_M78_r3_24000__00cf:
  00cf  AD             ?? ADh                            
  00d0  .db 9F 72 50 AD 9F 72 52 39                          ; .rP..rR9

; ---- function FUN_M78_r3_24000__00d8
FUN_M78_r3_24000__00d8:
  00d8  3476           PSHS  U Y X B A                   
  00da  1A40           ORCC #0x40                        
  00dc  3440           PSHS  U                           
  00de  CC1EB8         LDD #0x1eb8                       
  00e1  F3600D         ADDD 0x600d                       
  00e4  1F01           TFR D,X                           
  00e6  CC1EE7         LDD #0x1ee7                       
  00e9  F3600D         ADDD 0x600d                       
  00ec  1F03           TFR D,U                           
  00ee  108E6600       LDY #0x6600                       
  00f2  AD9FFD08       JSR [0xfd08]                      
  00f6  3540           PULS  U                           
  00f8  AD9FFD76       JSR [0xfd76]                      
  00fc  1CBF           ANDCC #0xbf                       
  00fe  3576           PULS  A B X Y U                   
  0100  39             RTS                               

; ---- function FUN_M78_r3_24000__0101
FUN_M78_r3_24000__0101:
  0101  3476           PSHS  U Y X B A                   
  0103  C601           LDB #0x1                          
  0105  8E7810         LDX #0x7810                       
  0108  AD9FFD30       JSR [0xfd30]                      
  010c  10260044       LBNE 0x0154                       
  0110  C602           LDB #0x2                          
  0112  8E7811         LDX #0x7811                       
  0115  AD9FFD30       JSR [0xfd30]                      
  0119  10260037       LBNE 0x0154                       
  011d  C603           LDB #0x3                          
  011f  8E7812         LDX #0x7812                       
  0122  AD9FFD30       JSR [0xfd30]                      
  0126  1026002A       LBNE 0x0154                       
  012a  CC0000         LDD #0x0                          
  012d  AD9FFD3C       JSR [0xfd3c]                      
  0131  AD9FFD40       JSR [0xfd40]                      
  0135  AD9FFD44       JSR [0xfd44]                      
  0139  CC000A         LDD #0xa                          
  013c  AD9FFD20       JSR [0xfd20]                      
  0140  108E0000       LDY #0x0                          
  0144  FC7110         LDD 0x7110                        
  0147  AD9FFD2E       JSR [0xfd2e]                      
  014b  AD9FFD7C       JSR [0xfd7c]                      
  014f  CC0000         LDD #0x0                          
  0152  2003           BRA 0x0157                        
LAB_M78_r3_24000__0154:
  0154  CCFFFF         LDD #0xffff                       
LAB_M78_r3_24000__0157:
  0157  3576           PULS  A B X Y U                   
  0159  39             RTS                               

; ---- function FUN_M78_r3_24000__015a
FUN_M78_r3_24000__015a:
  015a  3406           PSHS  B A                         
  015c  CC0000         LDD #0x0                          
  015f  FD7002         STD 0x7002                        
  0162  FD700A         STD 0x700a                        
  0165  FD7014         STD 0x7014                        
  0168  FD701E         STD 0x701e                        
  016b  FD7028         STD 0x7028                        
  016e  FD703A         STD 0x703a                        
  0171  FD7046         STD 0x7046                        
  0174  FD703C         STD 0x703c                        
  0177  FD7268         STD 0x7268                        
  017a  FD726A         STD 0x726a                        
  017d  FD7048         STD 0x7048                        
  0180  FD7052         STD 0x7052                        
  0183  FD705C         STD 0x705c                        
  0186  FD7066         STD 0x7066                        
  0189  FD706E         STD 0x706e                        
  018c  FD7076         STD 0x7076                        
  018f  FD707E         STD 0x707e                        
  0192  FD7032         STD 0x7032                        
  0195  FD7096         STD 0x7096                        
  0198  FD7086         STD 0x7086                        
  019b  FD70DE         STD 0x70de                        
  019e  FD70C6         STD 0x70c6                        
  01a1  FD70CE         STD 0x70ce                        
  01a4  FD70D6         STD 0x70d6                        
  01a7  FD708E         STD 0x708e                        
  01aa  FD70A6         STD 0x70a6                        
  01ad  FD709E         STD 0x709e                        
  01b0  FD70AE         STD 0x70ae                        
  01b3  FD70B6         STD 0x70b6                        
  01b6  FD70BE         STD 0x70be                        
  01b9  FD7186         STD 0x7186                        
  01bc  FD715E         STD 0x715e                        
  01bf  FD7160         STD 0x7160                        
  01c2  FD7182         STD 0x7182                        
  01c5  FD7184         STD 0x7184                        
  01c8  3506           PULS  A B                         
  01ca  39             RTS                               

; ---- function FUN_M78_r3_24000__01cb
FUN_M78_r3_24000__01cb:
  01cb  3476           PSHS  U Y X B A                   
  01cd  CC0000         LDD #0x0                          
  01d0  AD9FFC6C       JSR [0xfc6c]                      
  01d4  AD9FFC74       JSR [0xfc74]                      
  01d8  3576           PULS  A B X Y U                   
  01da  39             RTS                               

; ---- function FUN_M78_r3_24000__01db
FUN_M78_r3_24000__01db:
  01db  3476           PSHS  U Y X B A                   
  01dd  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: B9:00 A9:08 AD:12 B1:1C B5:26
  01e1  B9             db B9h                            
  01e2  00             db 0h                             
  01e3  A9             db A9h                            
  01e4  08             db 8h                             
  01e5  AD             db ADh                            
  01e6  12             db 12h                            
  01e7  B1             db B1h                            
  01e8  1C             db 1Ch                            
  01e9  B5             db B5h                            
  01ea  26             db 26h                            
  01eb  00             db 0h                             
LAB_M78_r3_24000__01ec:
  01ec  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: BB:06 AB:0E AF:18 B3:22 B7:2C
  01f0  BB             db BBh                            
  01f1  06             db 6h                             
  01f2  AB             db ABh                            
  01f3  0E             db Eh                             
  01f4  AF             db AFh                            
  01f5  18             db 18h                            
  01f6  B3             db B3h                            
  01f7  22             db 22h                            
  01f8  B7             db B7h                            
  01f9  2C             db 2Ch                            
  01fa  00             db 0h                             
LAB_M78_r3_24000__01fb:
  01fb  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 59:38 5B:40 5D:44 5F:4C
  01ff  59             db 59h                            
  0200  38             db 38h                            
  0201  5B             db 5Bh                            
  0202  40             db 40h                            
  0203  5D             db 5Dh                            
  0204  44             db 44h                            
  0205  5F             db 5Fh                            
  0206  4C             db 4Ch                            
  0207  00             db 0h                             
LAB_M78_r3_24000__0208:
  0208  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 61:50 63:56 65:5A 67:60
  020c  61             db 61h                            
  020d  50             db 50h                            
  020e  63             db 63h                            
  020f  56             db 56h                            
  0210  65             db 65h                            
  0211  5A             db 5Ah                            
  0212  67             db 67h                            
  0213  60             db 60h                            
  0214  00             db 0h                             
LAB_M78_r3_24000__0215:
  0215  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 55:30 81:CC 85:D4
  0219  55             db 55h                            
  021a  30             db 30h                            
  021b  81             db 81h                            
  021c  CC             db CCh                            
  021d  85             db 85h                            
  021e  D4             db D4h                            
  021f  00             db 0h                             
LAB_M78_r3_24000__0220:
  0220  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 69:64 71:74 6D:6C 75:7C
  0224  69             db 69h                            
  0225  64             db 64h                            
  0226  71             db 71h                            
  0227  74             db 74h                            
  0228  6D             db 6Dh                            
  0229  6C             db 6Ch                            
  022a  75             db 75h                            
  022b  7C             db 7Ch                            
  022c  00             db 0h                             
LAB_M78_r3_24000__022d:
  022d  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 6B:6A 73:7A 6F:72 77:82
  0231  6B             db 6Bh                            
  0232  6A             db 6Ah                            
  0233  73             db 73h                            
  0234  7A             db 7Ah                            
  0235  6F             db 6Fh                            
  0236  72             db 72h                            
  0237  77             db 77h                            
  0238  82             db 82h                            
  0239  00             db 0h                             
LAB_M78_r3_24000__023a:
  023a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 99:A4 95:9C 89:AC 8D:B4 91:BC
  023e  99             db 99h                            
  023f  A4             db A4h                            
  0240  95             db 95h                            
  0241  9C             db 9Ch                            
  0242  89             db 89h                            
  0243  AC             db ACh                            
  0244  8D             db 8Dh                            
  0245  B4             db B4h                            
  0246  91             db 91h                            
  0247  BC             db BCh                            
  0248  00             db 0h                             
LAB_M78_r3_24000__0249:
  0249  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9D:84 A1:8C A5:94 7D:C4
  024d  9D             db 9Dh                            
  024e  84             db 84h                            
  024f  A1             db A1h                            
  0250  8C             db 8Ch                            
  0251  A5             db A5h                            
  0252  94             db 94h                            
  0253  7D             db 7Dh                            
  0254  C4             db C4h                            
  0255  00             db 0h                             
LAB_M78_r3_24000__0256:
  0256  CC7FFF         LDD #0x7fff                       
  0259  FD714A         STD 0x714a                        
  025c  CCFE00         LDD #0xfe00                       
  025f  FD714C         STD 0x714c                        
  0262  CC4000         LDD #0x4000                       
  0265  FD7152         STD 0x7152                        
  0268  CC0000         LDD #0x0                          
  026b  FD7154         STD 0x7154                        
  026e  CC0001         LDD #0x1                          
  0271  FD7148         STD 0x7148                        
  0274  CC0000         LDD #0x0                          
  0277  FD73B9         STD 0x73b9                        
  027a  FD73BB         STD 0x73bb                        
  027d  CC0001         LDD #0x1                          
  0280  FD7254         STD 0x7254                        
  0283  CC0002         LDD #0x2                          
  0286  FD7256         STD 0x7256                        
  0289  3576           PULS  A B X Y U                   
  028b  39             RTS                               

; ---- function FUN_M78_r3_24000__028c
FUN_M78_r3_24000__028c:
  028c  3476           PSHS  U Y X B A                   
  028e  17072C         LBSR 0x09bd                       
  0291  170897         LBSR 0x0b2b                       
  0294  1707DD         LBSR 0x0a74                       
  0297  170948         LBSR 0x0be2                       
  029a  1711F5         LBSR 0x1492                       
  029d  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $007E $7188
  02a1  007E           dw 7Eh                            
  02a3  7188           dw 7188h                          
LAB_M78_r3_24000__02a5:
  02a5  1714F4         LBSR 0x179c                       
  02a8  1715C6         LBSR 0x1871                       
  02ab  170A98         LBSR 0x0d46                       
  02ae  170CC2         LBSR 0x0f73                       
  02b1  170E7C         LBSR 0x1130                       
  02b4  171019         LBSR 0x12d0                       
  02b7  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $005E $7188
  02bb  005E           dw 5Eh                            
  02bd  7188           dw 7188h                          
LAB_M78_r3_24000__02bf:
  02bf  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0060 $7188
  02c3  0060           dw 60h                            
  02c5  7188           dw 7188h                          
LAB_M78_r3_24000__02c7:
  02c7  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0062 $7188
  02cb  0062           dw 62h                            
  02cd  7188           dw 7188h                          
LAB_M78_r3_24000__02cf:
  02cf  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0064 $7188
  02d3  0064           dw 64h                            
  02d5  7188           dw 7188h                          
LAB_M78_r3_24000__02d7:
  02d7  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0070 $7188
  02db  0070           dw 70h                            
  02dd  7188           dw 7188h                          
LAB_M78_r3_24000__02df:
  02df  CC000A         LDD #0xa                          
  02e2  AD9FFD20       JSR [0xfd20]                      
  02e6  108E0351       LDY #0x351                        
  02ea  CC7998         LDD #0x7998                       
  02ed  AD9FFD2E       JSR [0xfd2e]                      
  02f1  CC000A         LDD #0xa                          
  02f4  AD9FFD20       JSR [0xfd20]                      
  02f8  108E0355       LDY #0x355                        
  02fc  CC7FEE         LDD #0x7fee                       
  02ff  AD9FFD2E       JSR [0xfd2e]                      
  0303  171730         LBSR 0x1a36                       
  0306  1717E5         LBSR 0x1aee                       
  0309  1718C1         LBSR 0x1bcd                       
  030c  171341         LBSR 0x1650                       
  030f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $004C $7188
  0313  004C           dw 4Ch                            
  0315  7188           dw 7188h                          
LAB_M78_r3_24000__0317:
  0317  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0046 $7188
  031b  0046           dw 46h                            
  031d  7188           dw 7188h                          
LAB_M78_r3_24000__031f:
  031f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0048 $7188
  0323  0048           dw 48h                            
  0325  7188           dw 7188h                          
LAB_M78_r3_24000__0327:
  0327  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $004A $7188
  032b  004A           dw 4Ah                            
  032d  7188           dw 7188h                          
LAB_M78_r3_24000__032f:
  032f  3576           PULS  A B X Y U                   
  0331  39             RTS                               

; ---- function FUN_M78_r3_24000__0332
FUN_M78_r3_24000__0332:
  0332  3476           PSHS  U Y X B A                   
  0334  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "pitch 1 " 25 $0CDD $0CE9
  0338  01             db 1h                             
  0339  80             db 80h                            
  033a  706974636820.. ds "pitch 1 "                     
  0342  25             db 25h                            
  0343  0CDD           addr M78_r3_24000::0cdd           
  0345  0CE9           addr M78_r3_24000::0ce9           
LAB_M78_r3_24000__0347:
  0347  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "pitch 2 " 29 $0F30 $0F3C
  034b  02             db 2h                             
  034c  80             db 80h                            
  034d  706974636820.. ds "pitch 2 "                     
  0355  29             db 29h                            
  0356  0F30           addr M78_r3_24000::0f30           
  0358  0F3C           addr M78_r3_24000::0f3c           
LAB_M78_r3_24000__035a:
  035a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 " time 1 " 2D $1103 $110F
  035e  03             db 3h                             
  035f  80             db 80h                            
  0360  2074696D6520.. ds " time 1 "                     
  0368  2D             db 2Dh                            
  0369  1103           addr M78_r3_24000::1103           
  036b  110F           addr M78_r3_24000::110f           
LAB_M78_r3_24000__036d:
  036d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 " time 2 " 31 $12A3 $12AF
  0371  04             db 4h                             
  0372  80             db 80h                            
  0373  2074696D6520.. ds " time 2 "                     
  037b  31             db 31h                            
  037c  12A3           addr M78_r3_24000::12a3           
  037e  12AF           addr M78_r3_24000::12af           
LAB_M78_r3_24000__0380:
  0380  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "start 1 " 35 $098C $0998
  0384  05             db 5h                             
  0385  80             db 80h                            
  0386  737461727420.. ds "start 1 "                     
  038e  35             db 35h                            
  038f  098C           addr M78_r3_24000::098c           
  0391  0998           addr M78_r3_24000::0998           
LAB_M78_r3_24000__0393:
  0393  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "start 2 " 39 $0A43 $0A4F
  0397  06             db 6h                             
  0398  80             db 80h                            
  0399  737461727420.. ds "start 2 "                     
  03a1  39             db 39h                            
  03a2  0A43           addr M78_r3_24000::0a43           
  03a4  0A4F           addr M78_r3_24000::0a4f           
LAB_M78_r3_24000__03a6:
  03a6  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 " stop 1 " 3D $0AFA $0B06
  03aa  07             db 7h                             
  03ab  80             db 80h                            
  03ac  2073746F7020.. ds " stop 1 "                     
  03b4  3D             db 3Dh                            
  03b5  0AFA           addr M78_r3_24000::0afa           
  03b7  0B06           addr M78_r3_24000::0b06           
LAB_M78_r3_24000__03b9:
  03b9  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 " stop 2 " 41 $0BB1 $0BBD
  03bd  08             db 8h                             
  03be  80             db 80h                            
  03bf  2073746F7020.. ds " stop 2 "                     
  03c7  41             db 41h                            
  03c8  0BB1           addr M78_r3_24000::0bb1           
  03ca  0BBD           addr M78_r3_24000::0bbd           
LAB_M78_r3_24000__03cc:
  03cc  CC03E8         LDD #0x3e8                        
  03cf  FD60F5         STD 0x60f5                        
  03d2  CC0034         LDD #0x34                         
  03d5  47             ASRA                              
  03d6  56             RORB                              
  03d7  FD60F7         STD 0x60f7                        
  03da  8601           LDA #0x1                          
  03dc  B76105         STA 0x6105                        
  03df  CC00BD         LDD #0xbd                         
  03e2  FD6106         STD 0x6106                        
  03e5  3576           PULS  A B X Y U                   
  03e7  39             RTS                               
  03e8  041C04270432.. addr[26]                          

; ---- function FUN_M78_r3_24000__041c
FUN_M78_r3_24000__041c:
  041c  17089A         LBSR 0x0cb9                       
  041f  170211         LBSR 0x0633                       
  0422  AD9FFE10       JSR [0xfe10]                      
  0426  39             RTS                               

; ---- function FUN_M78_r3_24000__0427
FUN_M78_r3_24000__0427:
  0427  170AE2         LBSR 0x0f0c                       
  042a  170206         LBSR 0x0633                       
  042d  AD9FFE14       JSR [0xfe14]                      
  0431  39             RTS                               

; ---- function FUN_M78_r3_24000__0432
FUN_M78_r3_24000__0432:
  0432  170CAA         LBSR 0x10df                       
  0435  1701FB         LBSR 0x0633                       
  0438  AD9FFE12       JSR [0xfe12]                      
  043c  39             RTS                               

; ---- function FUN_M78_r3_24000__043d
FUN_M78_r3_24000__043d:
  043d  170E3F         LBSR 0x127f                       
  0440  1701F0         LBSR 0x0633                       
  0443  AD9FFE16       JSR [0xfe16]                      
  0447  39             RTS                               

; ---- function FUN_M78_r3_24000__0448
FUN_M78_r3_24000__0448:
  0448  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0066 $7188
  044c  0066           dw 66h                            
  044e  7188           dw 7188h                          
LAB_M78_r3_24000__0450:
  0450  1701E0         LBSR 0x0633                       
  0453  AD9FFE14       JSR [0xfe14]                      
  0457  39             RTS                               

; ---- function FUN_M78_r3_24000__0458
FUN_M78_r3_24000__0458:
  0458  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0068 $7188
  045c  0068           dw 68h                            
  045e  7188           dw 7188h                          
LAB_M78_r3_24000__0460:
  0460  170209         LBSR 0x066c                       
  0463  AD9FFE14       JSR [0xfe14]                      
  0467  39             RTS                               

; ---- function FUN_M78_r3_24000__0468
FUN_M78_r3_24000__0468:
  0468  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $006A $7188
  046c  006A           dw 6Ah                            
  046e  7188           dw 7188h                          
LAB_M78_r3_24000__0470:
  0470  1701C0         LBSR 0x0633                       
  0473  AD9FFE16       JSR [0xfe16]                      
  0477  39             RTS                               

; ---- function FUN_M78_r3_24000__0478
FUN_M78_r3_24000__0478:
  0478  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $006C $7188
  047c  006C           dw 6Ch                            
  047e  7188           dw 7188h                          
LAB_M78_r3_24000__0480:
  0480  1701E9         LBSR 0x066c                       
  0483  AD9FFE16       JSR [0xfe16]                      
  0487  39             RTS                               

; ---- function FUN_M78_r3_24000__0488
FUN_M78_r3_24000__0488:
  0488  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0072 $7188
  048c  0072           dw 72h                            
  048e  7188           dw 7188h                          
LAB_M78_r3_24000__0490:
  0490  170167         LBSR 0x05fa                       
  0493  AD9FFE14       JSR [0xfe14]                      
  0497  39             RTS                               

; ---- function FUN_M78_r3_24000__0498
FUN_M78_r3_24000__0498:
  0498  170FAC         LBSR 0x1447                       
  049b  1702DD         LBSR 0x077b                       
  049e  AD9FFE10       JSR [0xfe10]                      
  04a2  39             RTS                               

; ---- function FUN_M78_r3_24000__04a3
FUN_M78_r3_24000__04a3:
  04a3  17160B         LBSR 0x1ab1                       
  04a6  1702D2         LBSR 0x077b                       
  04a9  AD9FFE12       JSR [0xfe12]                      
  04ad  39             RTS                               

; ---- function FUN_M78_r3_24000__04ae
FUN_M78_r3_24000__04ae:
  04ae  1716DF         LBSR 0x1b90                       
  04b1  1702C7         LBSR 0x077b                       
  04b4  AD9FFE14       JSR [0xfe14]                      
  04b8  39             RTS                               

; ---- function FUN_M78_r3_24000__04b9
FUN_M78_r3_24000__04b9:
  04b9  171149         LBSR 0x1605                       
  04bc  17034D         LBSR 0x080c                       
  04bf  AD9FFE10       JSR [0xfe10]                      
  04c3  39             RTS                               

; ---- function FUN_M78_r3_24000__04c4
FUN_M78_r3_24000__04c4:
  04c4  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $004E $7188
  04c8  004E           dw 4Eh                            
  04ca  7188           dw 7188h                          
LAB_M78_r3_24000__04cc:
  04cc  17033D         LBSR 0x080c                       
  04cf  AD9FFE12       JSR [0xfe12]                      
  04d3  39             RTS                               

; ---- function FUN_M78_r3_24000__04d4
FUN_M78_r3_24000__04d4:
  04d4  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0050 $7188
  04d8  0050           dw 50h                            
  04da  7188           dw 7188h                          
LAB_M78_r3_24000__04dc:
  04dc  17032D         LBSR 0x080c                       
  04df  AD9FFE12       JSR [0xfe12]                      
  04e3  39             RTS                               

; ---- function FUN_M78_r3_24000__04e4
FUN_M78_r3_24000__04e4:
  04e4  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0052 $7188
  04e8  0052           dw 52h                            
  04ea  7188           dw 7188h                          
LAB_M78_r3_24000__04ec:
  04ec  17031D         LBSR 0x080c                       
  04ef  AD9FFE14       JSR [0xfe14]                      
  04f3  39             RTS                               

; ---- function FUN_M78_r3_24000__04f4
FUN_M78_r3_24000__04f4:
  04f4  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0054 $7188
  04f8  0054           dw 54h                            
  04fa  7188           dw 7188h                          
LAB_M78_r3_24000__04fc:
  04fc  17030D         LBSR 0x080c                       
  04ff  AD9FFE16       JSR [0xfe16]                      
  0503  39             RTS                               

; ---- function FUN_M78_r3_24000__0504
FUN_M78_r3_24000__0504:
  0504  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $007C $7188
  0508  007C           dw 7Ch                            
  050a  7188           dw 7188h                          
LAB_M78_r3_24000__050c:
  050c  170208         LBSR 0x0717                       
  050f  AD9FFE10       JSR [0xfe10]                      
  0513  39             RTS                               

; ---- function FUN_M78_r3_24000__0514
FUN_M78_r3_24000__0514:
  0514  171224         LBSR 0x173b                       
  0517  1701FD         LBSR 0x0717                       
  051a  AD9FFE14       JSR [0xfe14]                      
  051e  39             RTS                               

; ---- function FUN_M78_r3_24000__051f
FUN_M78_r3_24000__051f:
  051f  1712EE         LBSR 0x1810                       
  0522  1701F2         LBSR 0x0717                       
  0525  AD9FFE16       JSR [0xfe16]                      
  0529  39             RTS                               

; ---- function FUN_M78_r3_24000__052a
FUN_M78_r3_24000__052a:
  052a  1714CD         LBSR 0x19fa                       
  052d  39             RTS                               

; ---- function FUN_M78_r3_24000__052e
FUN_M78_r3_24000__052e:
  052e  170437         LBSR 0x0968                       
  0531  39             RTS                               

; ---- function FUN_M78_r3_24000__0532
FUN_M78_r3_24000__0532:
  0532  1704EA         LBSR 0x0a1f                       
  0535  39             RTS                               

; ---- function FUN_M78_r3_24000__0536
FUN_M78_r3_24000__0536:
  0536  17059D         LBSR 0x0ad6                       
  0539  39             RTS                               

; ---- function FUN_M78_r3_24000__053a
FUN_M78_r3_24000__053a:
  053a  170650         LBSR 0x0b8d                       
  053d  39             RTS                               

; ---- function FUN_M78_r3_24000__053e
FUN_M78_r3_24000__053e:
  053e  171822         LBSR 0x1d63                       
  0541  39             RTS                               

; ---- function FUN_M78_r3_24000__0542
FUN_M78_r3_24000__0542:
  0542  AD9FFDFC       JSR [0xfdfc]                      
  0546  39             RTS                               

; ---- function FUN_M78_r3_24000__0547
FUN_M78_r3_24000__0547:
  0547  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " record " "--stop--" "-play 1-" "-play 2-"
  054b  207265636F72.. ds " record "                     
  0553  2D2D73746F70.. ds "--stop--"                     
  055b  2D706C617920.. ds "-play 1-"                     
  0563  2D706C617920.. ds "-play 2-"                     
LAB_M78_r3_24000__056b:
  056b  AD9FFDF2       JSR [0xfdf2]                      
  056f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2D87 ->$26BC ->$285C ->$289D ->$05FA ->$06DE
  0573  2D87           addr M78_r3_24000::2d87           
  0575  26BC           addr M78_r3_24000::26bc           
  0577  285C           addr M78_r3_24000::285c           
  0579  289D           addr M78_r3_24000::289d           
  057b  05FA           addr M78_r3_24000::05fa           
  057d  06DE           addr M78_r3_24000::06de           
LAB_M78_r3_24000__057f:
  057f  39             RTS                               

; ---- function FUN_M78_r3_24000__0580
FUN_M78_r3_24000__0580:
  0580  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "-trg en-" "-record-" [*] [*]
  0584  2D7472672065.. ds "-trg en-"                     
  058c  2D7265636F72.. ds "-record-"                     
  0594  01             db 1h                             
  0595  01             db 1h                             
LAB_M78_r3_24000__0596:
  0596  AD9FFDF2       JSR [0xfdf2]                      
  059a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2F98 ->$3032 ->$0941 ->$0941 ->$312D ->$312D
  059e  2F98           addr M78_r3_24000::2f98           
  05a0  3032           addr M78_r3_24000::3032           
  05a2  0941           addr M78_r3_24000::0941           
  05a4  0941           addr M78_r3_24000::0941           
  05a6  312D           addr M78_r3_24000::312d           
  05a8  312D           addr M78_r3_24000::312d           
LAB_M78_r3_24000__05aa:
  05aa  39             RTS                               

; ---- function FUN_M78_r3_24000__05ab
FUN_M78_r3_24000__05ab:
  05ab  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "-trg en-" "-record-" [*] [*]
  05af  2D7472672065.. ds "-trg en-"                     
  05b7  2D7265636F72.. ds "-record-"                     
  05bf  01             db 1h                             
  05c0  01             db 1h                             
LAB_M78_r3_24000__05c1:
  05c1  AD9FFDF2       JSR [0xfdf2]                      
  05c5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2FE5 ->$305B ->$0941 ->$0941 ->$312D ->$312D
  05c9  2FE5           addr M78_r3_24000::2fe5           
  05cb  305B           addr M78_r3_24000::305b           
  05cd  0941           addr M78_r3_24000::0941           
  05cf  0941           addr M78_r3_24000::0941           
  05d1  312D           addr M78_r3_24000::312d           
  05d3  312D           addr M78_r3_24000::312d           
LAB_M78_r3_24000__05d5:
  05d5  39             RTS                               

; ---- function FUN_M78_r3_24000__05d6
FUN_M78_r3_24000__05d6:
  05d6  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "--stop--" [*] [*] [*]
  05da  2D2D73746F70.. ds "--stop--"                     
  05e2  01             db 1h                             
  05e3  01             db 1h                             
  05e4  01             db 1h                             
LAB_M78_r3_24000__05e5:
  05e5  AD9FFDF2       JSR [0xfdf2]                      
  05e9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3084 ->$0941 ->$0941 ->$0941 ->$3084 ->$3084
  05ed  3084           addr M78_r3_24000::3084           
  05ef  0941           addr M78_r3_24000::0941           
  05f1  0941           addr M78_r3_24000::0941           
  05f3  0941           addr M78_r3_24000::0941           
  05f5  3084           addr M78_r3_24000::3084           
  05f7  3084           addr M78_r3_24000::3084           
LAB_M78_r3_24000__05f9:
  05f9  39             RTS                               

; ---- function FUN_M78_r3_24000__05fa
FUN_M78_r3_24000__05fa:
  05fa  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "-edit 1-" "-edit 2-" "   mix  " " expert "
  05fe  2D6564697420.. ds "-edit 1-"                     
  0606  2D6564697420.. ds "-edit 2-"                     
  060e  2020206D6978.. ds "   mix  "                     
  0616  206578706572.. ds " expert "                     
LAB_M78_r3_24000__061e:
  061e  AD9FFDF2       JSR [0xfdf2]                      
  0622  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3729 ->$3903 ->$08E7 ->$0717 ->$0633 ->$0547
  0626  3729           addr M78_r3_24000::3729           
  0628  3903           addr M78_r3_24000::3903           
  062a  08E7           addr M78_r3_24000::08e7           
  062c  0717           addr M78_r3_24000::0717           
  062e  0633           addr M78_r3_24000::0633           
  0630  0547           addr M78_r3_24000::0547           
LAB_M78_r3_24000__0632:
  0632  39             RTS                               

; ---- function FUN_M78_r3_24000__0633
FUN_M78_r3_24000__0633:
  0633  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "pitch 1 " " time 1 " "-play 1-" "-play 2-"
  0637  706974636820.. ds "pitch 1 "                     
  063f  2074696D6520.. ds " time 1 "                     
  0647  2D706C617920.. ds "-play 1-"                     
  064f  2D706C617920.. ds "-play 2-"                     
LAB_M78_r3_24000__0657:
  0657  AD9FFDF2       JSR [0xfdf2]                      
  065b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C1E ->$10D3 ->$285C ->$289D ->$066C ->$05FA
  065f  0C1E           addr M78_r3_24000::0c1e           
  0661  10D3           addr M78_r3_24000::10d3           
  0663  285C           addr M78_r3_24000::285c           
  0665  289D           addr M78_r3_24000::289d           
  0667  066C           addr M78_r3_24000::066c           
  0669  05FA           addr M78_r3_24000::05fa           
LAB_M78_r3_24000__066b:
  066b  39             RTS                               

; ---- function FUN_M78_r3_24000__066c
FUN_M78_r3_24000__066c:
  066c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "attack 1" "release1" "-play 1-" "-play 2-"
  0670  61747461636B.. ds "attack 1"                     
  0678  72656C656173.. ds "release1"                     
  0680  2D706C617920.. ds "-play 1-"                     
  0688  2D706C617920.. ds "-play 2-"                     
LAB_M78_r3_24000__0690:
  0690  AD9FFDF2       JSR [0xfdf2]                      
  0694  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$08F0 ->$0902 ->$285C ->$289D ->$06A5 ->$0633
  0698  08F0           addr M78_r3_24000::08f0           
  069a  0902           addr M78_r3_24000::0902           
  069c  285C           addr M78_r3_24000::285c           
  069e  289D           addr M78_r3_24000::289d           
  06a0  06A5           addr M78_r3_24000::06a5           
  06a2  0633           addr M78_r3_24000::0633           
LAB_M78_r3_24000__06a4:
  06a4  39             RTS                               

; ---- function FUN_M78_r3_24000__06a5
FUN_M78_r3_24000__06a5:
  06a5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "pitch 2 " " time 2 " "-play 1-" "-play 2-"
  06a9  706974636820.. ds "pitch 2 "                     
  06b1  2074696D6520.. ds " time 2 "                     
  06b9  2D706C617920.. ds "-play 1-"                     
  06c1  2D706C617920.. ds "-play 2-"                     
LAB_M78_r3_24000__06c9:
  06c9  AD9FFDF2       JSR [0xfdf2]                      
  06cd  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0E71 ->$1273 ->$285C ->$289D ->$06DE ->$066C
  06d1  0E71           addr M78_r3_24000::0e71           
  06d3  1273           addr M78_r3_24000::1273           
  06d5  285C           addr M78_r3_24000::285c           
  06d7  289D           addr M78_r3_24000::289d           
  06d9  06DE           addr M78_r3_24000::06de           
  06db  066C           addr M78_r3_24000::066c           
LAB_M78_r3_24000__06dd:
  06dd  39             RTS                               

; ---- function FUN_M78_r3_24000__06de
FUN_M78_r3_24000__06de:
  06de  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "attack 2" "release2" "-play 1-" "-play 2-"
  06e2  61747461636B.. ds "attack 2"                     
  06ea  72656C656173.. ds "release2"                     
  06f2  2D706C617920.. ds "-play 1-"                     
  06fa  2D706C617920.. ds "-play 2-"                     
LAB_M78_r3_24000__0702:
  0702  AD9FFDF2       JSR [0xfdf2]                      
  0706  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$08F9 ->$090B ->$285C ->$289D ->$0547 ->$06A5
  070a  08F9           addr M78_r3_24000::08f9           
  070c  090B           addr M78_r3_24000::090b           
  070e  285C           addr M78_r3_24000::285c           
  0710  289D           addr M78_r3_24000::289d           
  0712  0547           addr M78_r3_24000::0547           
  0714  06A5           addr M78_r3_24000::06a5           
LAB_M78_r3_24000__0716:
  0716  39             RTS                               

; ---- function FUN_M78_r3_24000__0717
FUN_M78_r3_24000__0717:
  0717  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "aud trig" "  midi  " "shftmode" "rec mode"
  071b  617564207472.. ds "aud trig"                     
  0723  20206D696469.. ds "  midi  "                     
  072b  736866746D6F.. ds "shftmode"                     
  0733  726563206D6F.. ds "rec mode"                     
LAB_M78_r3_24000__073b:
  073b  AD9FFDF2       JSR [0xfdf2]                      
  073f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$077B ->$080C ->$172F ->$1804 ->$0750 ->$0750
  0743  077B           addr M78_r3_24000::077b           
  0745  080C           addr M78_r3_24000::080c           
  0747  172F           addr M78_r3_24000::172f           
  0749  1804           addr M78_r3_24000::1804           
  074b  0750           addr M78_r3_24000::0750           
  074d  0750           addr M78_r3_24000::0750           
LAB_M78_r3_24000__074f:
  074f  39             RTS                               

; ---- function FUN_M78_r3_24000__0750
FUN_M78_r3_24000__0750:
  0750  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "drumtrig" [*] [*] " return "
  0754  6472756D7472.. ds "drumtrig"                     
  075c  01             db 1h                             
  075d  01             db 1h                             
  075e  207265747572.. ds " return "                     
LAB_M78_r3_24000__0766:
  0766  AD9FFDF2       JSR [0xfdf2]                      
  076a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0938 ->$0941 ->$0941 ->$05FA ->$0717 ->$0717
  076e  0938           addr M78_r3_24000::0938           
  0770  0941           addr M78_r3_24000::0941           
  0772  0941           addr M78_r3_24000::0941           
  0774  05FA           addr M78_r3_24000::05fa           
  0776  0717           addr M78_r3_24000::0717           
  0778  0717           addr M78_r3_24000::0717           
LAB_M78_r3_24000__077a:
  077a  39             RTS                               

; ---- function FUN_M78_r3_24000__077b
FUN_M78_r3_24000__077b:
  077b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "trig en " [*] [*] [*]
  077f  747269672065.. ds "trig en "                     
  0787  01             db 1h                             
  0788  01             db 1h                             
  0789  01             db 1h                             
LAB_M78_r3_24000__078a:
  078a  AD9FFDF2       JSR [0xfdf2]                      
  078e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1453 ->$0941 ->$0941 ->$0941 ->$1D1A ->$1D1A
  0792  1453           addr M78_r3_24000::1453           
  0794  0941           addr M78_r3_24000::0941           
  0796  0941           addr M78_r3_24000::0941           
  0798  0941           addr M78_r3_24000::0941           
  079a  1D1A           addr M78_r3_24000::1d1a           
  079c  1D1A           addr M78_r3_24000::1d1a           
LAB_M78_r3_24000__079e:
  079e  170004         LBSR 0x07a5                       
  07a1  170CAF         LBSR 0x1453                       
  07a4  39             RTS                               

; ---- function FUN_M78_r3_24000__07a5
FUN_M78_r3_24000__07a5:
  07a5  3476           PSHS  U Y X B A                   
  07a7  FC7034         LDD 0x7034                        
  07aa  10830000       CMPD #0x0                         
  07ae  1027000B       LBEQ 0x07bd                       
  07b2  FC7034         LDD 0x7034                        
  07b5  10830001       CMPD #0x1                         
  07b9  1027001F       LBEQ 0x07dc                       
LAB_M78_r3_24000__07bd:
  07bd  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [*] [*] [-]
  07c1  00             db 0h                             
  07c2  01             db 1h                             
  07c3  01             db 1h                             
  07c4  00             db 0h                             
LAB_M78_r3_24000__07c5:
  07c5  AD9FFDF2       JSR [0xfdf2]                      
  07c9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1453 ->$0941 ->$0941 ->$0941 ->$1D1A ->$1D1A
  07cd  1453           addr M78_r3_24000::1453           
  07cf  0941           addr M78_r3_24000::0941           
  07d1  0941           addr M78_r3_24000::0941           
  07d3  0941           addr M78_r3_24000::0941           
  07d5  1D1A           addr M78_r3_24000::1d1a           
  07d7  1D1A           addr M78_r3_24000::1d1a           
LAB_M78_r3_24000__07d9:
  07d9  16002D         LBRA 0x0809                       
LAB_M78_r3_24000__07dc:
  07dc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "thresh 1" "thresh 2" [-]
  07e0  00             db 0h                             
  07e1  746872657368.. ds "thresh 1"                     
  07e9  746872657368.. ds "thresh 2"                     
  07f1  00             db 0h                             
LAB_M78_r3_24000__07f2:
  07f2  AD9FFDF2       JSR [0xfdf2]                      
  07f6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1453 ->$1C24 ->$1C9F ->$0941 ->$1D1A ->$1D1A
  07fa  1453           addr M78_r3_24000::1453           
  07fc  1C24           addr M78_r3_24000::1c24           
  07fe  1C9F           addr M78_r3_24000::1c9f           
  0800  0941           addr M78_r3_24000::0941           
  0802  1D1A           addr M78_r3_24000::1d1a           
  0804  1D1A           addr M78_r3_24000::1d1a           
LAB_M78_r3_24000__0806:
  0806  160000         LBRA 0x0809                       
LAB_M78_r3_24000__0809:
  0809  3576           PULS  A B X Y U                   
  080b  39             RTS                               

; ---- function FUN_M78_r3_24000__080c
FUN_M78_r3_24000__080c:
  080c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "midimode" [*] [*] [*]
  0810  6D6964696D6F.. ds "midimode"                     
  0818  01             db 1h                             
  0819  01             db 1h                             
  081a  01             db 1h                             
LAB_M78_r3_24000__081b:
  081b  AD9FFDF2       JSR [0xfdf2]                      
  081f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1611 ->$0941 ->$0941 ->$0941 ->$0717 ->$0717
  0823  1611           addr M78_r3_24000::1611           
  0825  0941           addr M78_r3_24000::0941           
  0827  0941           addr M78_r3_24000::0941           
  0829  0941           addr M78_r3_24000::0941           
  082b  0717           addr M78_r3_24000::0717           
  082d  0717           addr M78_r3_24000::0717           
LAB_M78_r3_24000__082f:
  082f  170004         LBSR 0x0836                       
  0832  170DDC         LBSR 0x1611                       
  0835  39             RTS                               

; ---- function FUN_M78_r3_24000__0836
FUN_M78_r3_24000__0836:
  0836  3476           PSHS  U Y X B A                   
  0838  FC70A8         LDD 0x70a8                        
  083b  10830000       CMPD #0x0                         
  083f  10270016       LBEQ 0x0859                       
  0843  FC70A8         LDD 0x70a8                        
  0846  10830001       CMPD #0x1                         
  084a  1027002A       LBEQ 0x0878                       
  084e  FC70A8         LDD 0x70a8                        
  0851  10830002       CMPD #0x2                         
  0855  10270053       LBEQ 0x08ac                       
LAB_M78_r3_24000__0859:
  0859  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [*] [*] [*]
  085d  00             db 0h                             
  085e  01             db 1h                             
  085f  01             db 1h                             
  0860  01             db 1h                             
LAB_M78_r3_24000__0861:
  0861  AD9FFDF2       JSR [0xfdf2]                      
  0865  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1611 ->$0941 ->$0941 ->$0941 ->$0717 ->$0717
  0869  1611           addr M78_r3_24000::1611           
  086b  0941           addr M78_r3_24000::0941           
  086d  0941           addr M78_r3_24000::0941           
  086f  0941           addr M78_r3_24000::0941           
  0871  0717           addr M78_r3_24000::0717           
  0873  0717           addr M78_r3_24000::0717           
LAB_M78_r3_24000__0875:
  0875  16005A         LBRA 0x08d2                       
LAB_M78_r3_24000__0878:
  0878  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "bs note1" "bs note2" "split pt"
  087c  00             db 0h                             
  087d  6273206E6F74.. ds "bs note1"                     
  0885  6273206E6F74.. ds "bs note2"                     
  088d  73706C697420.. ds "split pt"                     
LAB_M78_r3_24000__0895:
  0895  AD9FFDF2       JSR [0xfdf2]                      
  0899  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1611 ->$091D ->$0926 ->$092F ->$0717 ->$0717
  089d  1611           addr M78_r3_24000::1611           
  089f  091D           addr M78_r3_24000::091d           
  08a1  0926           addr M78_r3_24000::0926           
  08a3  092F           addr M78_r3_24000::092f           
  08a5  0717           addr M78_r3_24000::0717           
  08a7  0717           addr M78_r3_24000::0717           
LAB_M78_r3_24000__08a9:
  08a9  160026         LBRA 0x08d2                       
LAB_M78_r3_24000__08ac:
  08ac  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "bs note " [*] [*]
  08b0  00             db 0h                             
  08b1  6273206E6F74.. ds "bs note "                     
  08b9  01             db 1h                             
  08ba  01             db 1h                             
LAB_M78_r3_24000__08bb:
  08bb  AD9FFDF2       JSR [0xfdf2]                      
  08bf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1611 ->$0914 ->$0941 ->$0941 ->$0717 ->$0717
  08c3  1611           addr M78_r3_24000::1611           
  08c5  0914           addr M78_r3_24000::0914           
  08c7  0941           addr M78_r3_24000::0941           
  08c9  0941           addr M78_r3_24000::0941           
  08cb  0717           addr M78_r3_24000::0717           
  08cd  0717           addr M78_r3_24000::0717           
LAB_M78_r3_24000__08cf:
  08cf  160000         LBRA 0x08d2                       
LAB_M78_r3_24000__08d2:
  08d2  CC1611         LDD #0x1611                       
  08d5  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  08d9  60E3           addr 60e3                         
LAB_M78_r3_24000__08db:
  08db  CC0717         LDD #0x717                        
  08de  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  08e2  603A           addr 603a                         
LAB_M78_r3_24000__08e4:
  08e4  3576           PULS  A B X Y U                   
  08e6  39             RTS                               

; ---- function FUN_M78_r3_24000__08e7
FUN_M78_r3_24000__08e7:
  08e7  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $006E $7188
  08eb  006E           dw 6Eh                            
  08ed  7188           dw 7188h                          
LAB_M78_r3_24000__08ef:
  08ef  39             RTS                               

; ---- function FUN_M78_r3_24000__08f0
FUN_M78_r3_24000__08f0:
  08f0  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0056 $7188
  08f4  0056           dw 56h                            
  08f6  7188           dw 7188h                          
LAB_M78_r3_24000__08f8:
  08f8  39             RTS                               

; ---- function FUN_M78_r3_24000__08f9
FUN_M78_r3_24000__08f9:
  08f9  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0058 $7188
  08fd  0058           dw 58h                            
  08ff  7188           dw 7188h                          
LAB_M78_r3_24000__0901:
  0901  39             RTS                               

; ---- function FUN_M78_r3_24000__0902
FUN_M78_r3_24000__0902:
  0902  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $005A $7188
  0906  005A           dw 5Ah                            
  0908  7188           dw 7188h                          
LAB_M78_r3_24000__090a:
  090a  39             RTS                               

; ---- function FUN_M78_r3_24000__090b
FUN_M78_r3_24000__090b:
  090b  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $005C $7188
  090f  005C           dw 5Ch                            
  0911  7188           dw 7188h                          
LAB_M78_r3_24000__0913:
  0913  39             RTS                               

; ---- function FUN_M78_r3_24000__0914
FUN_M78_r3_24000__0914:
  0914  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003E $7188
  0918  003E           dw 3Eh                            
  091a  7188           dw 7188h                          
LAB_M78_r3_24000__091c:
  091c  39             RTS                               

; ---- function FUN_M78_r3_24000__091d
FUN_M78_r3_24000__091d:
  091d  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0040 $7188
  0921  0040           dw 40h                            
  0923  7188           dw 7188h                          
LAB_M78_r3_24000__0925:
  0925  39             RTS                               

; ---- function FUN_M78_r3_24000__0926
FUN_M78_r3_24000__0926:
  0926  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0042 $7188
  092a  0042           dw 42h                            
  092c  7188           dw 7188h                          
LAB_M78_r3_24000__092e:
  092e  39             RTS                               

; ---- function FUN_M78_r3_24000__092f
FUN_M78_r3_24000__092f:
  092f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0044 $7188
  0933  0044           dw 44h                            
  0935  7188           dw 7188h                          
LAB_M78_r3_24000__0937:
  0937  39             RTS                               

; ---- function FUN_M78_r3_24000__0938
FUN_M78_r3_24000__0938:
  0938  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $007A $7188
  093c  007A           dw 7Ah                            
  093e  7188           dw 7188h                          
LAB_M78_r3_24000__0940:
  0940  39             RTS                               

; ---- function FUN_M78_r3_24000__0941
FUN_M78_r3_24000__0941:
  0941  39             RTS                               
PTR_FUN_M78_r3_24000__09bd_M78_r3_24000__0942:
  0942  09BD           addr M78_r3_24000::09bd           
  0944  0980           addr M78_r3_24000::0980           
  0946  .db 09 74 70 64 70 66 00 00 70 68 72 84 72 ED 14 00  ; .tpdpf..phr.r...
  0956  .db 00 25 1C 00 01 02 05 16 09 A4 00 00 00 00 70 6A  ; .%............pj
  0966  .db 72 EF                                            ; r.

; ---- function FUN_M78_r3_24000__0968
FUN_M78_r3_24000__0968:
  0968  3410           PSHS  X                           
  096a  8E0942         LDX #0x942                         ; desc[API_FDBC]: ->$09BD ->$0980
  096d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...B"
  0971  3510           PULS  X                           
  0973  39             RTS                               

; ---- function FUN_M78_r3_24000__0974
FUN_M78_r3_24000__0974:
  0974  3410           PSHS  X                           
  0976  8E0942         LDX #0x942                         ; desc[API_FE6C]: ->$09BD ->$0980
  0979  AD9FFE6C       JSR [0xfe6c]                      
  097d  3510           PULS  X                           
  097f  39             RTS                               

; ---- function FUN_M78_r3_24000__0980
FUN_M78_r3_24000__0980:
  0980  3410           PSHS  X                           
  0982  8E0942         LDX #0x942                         ; desc[API_FE6E]: ->$09BD ->$0980
  0985  AD9FFE6E       JSR [0xfe6e]                      
  0989  3510           PULS  X                           
  098b  39             RTS                               

; ---- function FUN_M78_r3_24000__098c
FUN_M78_r3_24000__098c:
  098c  3410           PSHS  X                           
  098e  8E0942         LDX #0x942                         ; desc[API_FE1C]: ->$09BD ->$0980
  0991  AD9FFE1C       JSR [0xfe1c]                      
  0995  3510           PULS  X                           
  0997  39             RTS                               

; ---- function FUN_M78_r3_24000__0998
FUN_M78_r3_24000__0998:
  0998  3410           PSHS  X                           
  099a  8E0942         LDX #0x942                         ; desc[API_FE1A]: ->$09BD ->$0980 $0974
  099d  AD9FFE1A       JSR [0xfe1a]                      
  09a1  3510           PULS  X                           
  09a3  39             RTS                               
  09a4  .db 27 20                                            ; ' 

; ---- function FUN_M78_r3_24000__09a6
FUN_M78_r3_24000__09a6:
  09a6  3476           PSHS  U Y X B A                   
  09a8  8E0942         LDX #0x942                        
  09ab  1713F2         LBSR 0x1da0                       
  09ae  C61B           LDB #0x1b                         
  09b0  AD9FFC36       JSR [0xfc36]                      
  09b4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " "
  09b8  2000           char[2] " "                       
LAB_M78_r3_24000__09ba:
  09ba  3576           PULS  A B X Y U                   
  09bc  39             RTS                               

; ---- function FUN_M78_r3_24000__09bd
FUN_M78_r3_24000__09bd:
  09bd  3476           PSHS  U Y X B A                   
  09bf  8E0942         LDX #0x942                        
  09c2  AD9FFE76       JSR [0xfe76]                      
  09c6  FC7068         LDD 0x7068                        
  09c9  3606           PSHU  B A                         
  09cb  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000A $7188
  09cf  000A           dw Ah                             
  09d1  7188           dw 7188h                          
LAB_M78_r3_24000__09d3:
  09d3  3706           PULU  A B                         
  09d5  FD70EC         STD 0x70ec                        
  09d8  3706           PULU  A B                         
  09da  FD70EE         STD 0x70ee                        
  09dd  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  09e1  0038           dw 38h                            
  09e3  7188           dw 7188h                          
LAB_M78_r3_24000__09e5:
  09e5  FC73B9         LDD 0x73b9                        
  09e8  10830001       CMPD #0x1                         
  09ec  10270006       LBEQ 0x09f6                       
  09f0  170353         LBSR 0x0d46                       
  09f3  17073A         LBSR 0x1130                       
LAB_M78_r3_24000__09f6:
  09f6  3576           PULS  A B X Y U                   
  09f8  39             RTS                               
PTR_FUN_M78_r3_24000__0a74_M78_r3_24000__09f9:
  09f9  0A74           addr M78_r3_24000::0a74           
  09fb  0A37           addr M78_r3_24000::0a37           
  09fd  .db 0A 2B 70 74 70 76 00 00 70 78 72 84 72 F5 15 00  ; .+ptpv..pxr.r...
  0a0d  .db 00 25 1C 00 01 02 05 16 0A 5B 00 00 00 00 70 7A  ; .%.......[....pz
  0a1d  .db 72 F7                                            ; r.

; ---- function FUN_M78_r3_24000__0a1f
FUN_M78_r3_24000__0a1f:
  0a1f  3410           PSHS  X                           
  0a21  8E09F9         LDX #0x9f9                         ; desc[API_FDBC]: ->$0A74 ->$0A37
  0a24  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0a28  3510           PULS  X                           
  0a2a  39             RTS                               

; ---- function FUN_M78_r3_24000__0a2b
FUN_M78_r3_24000__0a2b:
  0a2b  3410           PSHS  X                           
  0a2d  8E09F9         LDX #0x9f9                         ; desc[API_FE6C]: ->$0A74 ->$0A37
  0a30  AD9FFE6C       JSR [0xfe6c]                      
  0a34  3510           PULS  X                           
  0a36  39             RTS                               

; ---- function FUN_M78_r3_24000__0a37
FUN_M78_r3_24000__0a37:
  0a37  3410           PSHS  X                           
  0a39  8E09F9         LDX #0x9f9                         ; desc[API_FE6E]: ->$0A74 ->$0A37
  0a3c  AD9FFE6E       JSR [0xfe6e]                      
  0a40  3510           PULS  X                           
  0a42  39             RTS                               

; ---- function FUN_M78_r3_24000__0a43
FUN_M78_r3_24000__0a43:
  0a43  3410           PSHS  X                           
  0a45  8E09F9         LDX #0x9f9                         ; desc[API_FE1C]: ->$0A74 ->$0A37
  0a48  AD9FFE1C       JSR [0xfe1c]                      
  0a4c  3510           PULS  X                           
  0a4e  39             RTS                               

; ---- function FUN_M78_r3_24000__0a4f
FUN_M78_r3_24000__0a4f:
  0a4f  3410           PSHS  X                           
  0a51  8E09F9         LDX #0x9f9                         ; desc[API_FE1A]: ->$0A74 ->$0A37 $0A2B
  0a54  AD9FFE1A       JSR [0xfe1a]                      
  0a58  3510           PULS  X                           
  0a5a  39             RTS                               
  0a5b  .db 00 20                                            ; . 

; ---- function FUN_M78_r3_24000__0a5d
FUN_M78_r3_24000__0a5d:
  0a5d  3476           PSHS  U Y X B A                   
  0a5f  8E09F9         LDX #0x9f9                        
  0a62  17133B         LBSR 0x1da0                       
  0a65  C61B           LDB #0x1b                         
  0a67  AD9FFC36       JSR [0xfc36]                      
  0a6b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " "
  0a6f  2000           char[2] " "                       
LAB_M78_r3_24000__0a71:
  0a71  3576           PULS  A B X Y U                   
  0a73  39             RTS                               

; ---- function FUN_M78_r3_24000__0a74
FUN_M78_r3_24000__0a74:
  0a74  3476           PSHS  U Y X B A                   
  0a76  8E09F9         LDX #0x9f9                        
  0a79  AD9FFE76       JSR [0xfe76]                      
  0a7d  FC7078         LDD 0x7078                        
  0a80  3606           PSHU  B A                         
  0a82  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000A $7188
  0a86  000A           dw Ah                             
  0a88  7188           dw 7188h                          
LAB_M78_r3_24000__0a8a:
  0a8a  3706           PULU  A B                         
  0a8c  FD70F4         STD 0x70f4                        
  0a8f  3706           PULU  A B                         
  0a91  FD70F6         STD 0x70f6                        
  0a94  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  0a98  003A           dw 3Ah                            
  0a9a  7188           dw 7188h                          
LAB_M78_r3_24000__0a9c:
  0a9c  FC73BB         LDD 0x73bb                        
  0a9f  10830001       CMPD #0x1                         
  0aa3  10270006       LBEQ 0x0aad                       
  0aa7  1704C9         LBSR 0x0f73                       
  0aaa  170823         LBSR 0x12d0                       
LAB_M78_r3_24000__0aad:
  0aad  3576           PULS  A B X Y U                   
  0aaf  39             RTS                               
PTR_FUN_M78_r3_24000__0b2b_M78_r3_24000__0ab0:
  0ab0  0B2B           addr M78_r3_24000::0b2b           
  0ab2  0AEE           addr M78_r3_24000::0aee           
  0ab4  .db 0A E2 70 6C 70 6E 00 00 70 70 72 84 72 F1 16 00  ; ..plpn..ppr.r...
  0ac4  .db 00 25 1C 00 01 02 05 22 0B 12 00 00 00 00 70 72  ; .%....."......pr
  0ad4  .db 72 F3                                            ; r.

; ---- function FUN_M78_r3_24000__0ad6
FUN_M78_r3_24000__0ad6:
  0ad6  3410           PSHS  X                           
  0ad8  8E0AB0         LDX #0xab0                         ; desc[API_FDBC]: ->$0B2B ->$0AEE
  0adb  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0adf  3510           PULS  X                           
  0ae1  39             RTS                               

; ---- function FUN_M78_r3_24000__0ae2
FUN_M78_r3_24000__0ae2:
  0ae2  3410           PSHS  X                           
  0ae4  8E0AB0         LDX #0xab0                         ; desc[API_FE6C]: ->$0B2B ->$0AEE
  0ae7  AD9FFE6C       JSR [0xfe6c]                      
  0aeb  3510           PULS  X                           
  0aed  39             RTS                               

; ---- function FUN_M78_r3_24000__0aee
FUN_M78_r3_24000__0aee:
  0aee  3410           PSHS  X                           
  0af0  8E0AB0         LDX #0xab0                         ; desc[API_FE6E]: ->$0B2B ->$0AEE
  0af3  AD9FFE6E       JSR [0xfe6e]                      
  0af7  3510           PULS  X                           
  0af9  39             RTS                               

; ---- function FUN_M78_r3_24000__0afa
FUN_M78_r3_24000__0afa:
  0afa  3410           PSHS  X                           
  0afc  8E0AB0         LDX #0xab0                         ; desc[API_FE1C]: ->$0B2B ->$0AEE
  0aff  AD9FFE1C       JSR [0xfe1c]                      
  0b03  3510           PULS  X                           
  0b05  39             RTS                               

; ---- function FUN_M78_r3_24000__0b06
FUN_M78_r3_24000__0b06:
  0b06  3410           PSHS  X                           
  0b08  8E0AB0         LDX #0xab0                         ; desc[API_FE1A]: ->$0B2B ->$0AEE $0AE2
  0b0b  AD9FFE1A       JSR [0xfe1a]                      
  0b0f  3510           PULS  X                           
  0b11  39             RTS                               
  0b12  .db 27 20                                            ; ' 

; ---- function FUN_M78_r3_24000__0b14
FUN_M78_r3_24000__0b14:
  0b14  3476           PSHS  U Y X B A                   
  0b16  8E0AB0         LDX #0xab0                        
  0b19  171284         LBSR 0x1da0                       
  0b1c  C627           LDB #0x27                         
  0b1e  AD9FFC36       JSR [0xfc36]                      
  0b22  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " "
  0b26  2000           char[2] " "                       
LAB_M78_r3_24000__0b28:
  0b28  3576           PULS  A B X Y U                   
  0b2a  39             RTS                               

; ---- function FUN_M78_r3_24000__0b2b
FUN_M78_r3_24000__0b2b:
  0b2b  3476           PSHS  U Y X B A                   
  0b2d  8E0AB0         LDX #0xab0                        
  0b30  AD9FFE76       JSR [0xfe76]                      
  0b34  FC7070         LDD 0x7070                        
  0b37  3606           PSHU  B A                         
  0b39  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000A $7188
  0b3d  000A           dw Ah                             
  0b3f  7188           dw 7188h                          
LAB_M78_r3_24000__0b41:
  0b41  3706           PULU  A B                         
  0b43  FD70F0         STD 0x70f0                        
  0b46  3706           PULU  A B                         
  0b48  FD70F2         STD 0x70f2                        
  0b4b  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  0b4f  0038           dw 38h                            
  0b51  7188           dw 7188h                          
LAB_M78_r3_24000__0b53:
  0b53  FC73B9         LDD 0x73b9                        
  0b56  10830001       CMPD #0x1                         
  0b5a  10270006       LBEQ 0x0b64                       
  0b5e  1701E5         LBSR 0x0d46                       
  0b61  1705CC         LBSR 0x1130                       
LAB_M78_r3_24000__0b64:
  0b64  3576           PULS  A B X Y U                   
  0b66  39             RTS                               
PTR_FUN_M78_r3_24000__0be2_M78_r3_24000__0b67:
  0b67  0BE2           addr M78_r3_24000::0be2           
  0b69  0BA5           addr M78_r3_24000::0ba5           
  0b6b  .db 0B 99 70 7C 70 7E 00 00 70 80 72 84 72 F9 17 00  ; ..p|p~..p.r.r...
  0b7b  .db 00 25 1C 00 01 02 05 22 0B C9 00 00 00 00 70 82  ; .%....."......p.
  0b8b  .db 72 FB                                            ; r.

; ---- function FUN_M78_r3_24000__0b8d
FUN_M78_r3_24000__0b8d:
  0b8d  3410           PSHS  X                           
  0b8f  8E0B67         LDX #0xb67                         ; desc[API_FDBC]: ->$0BE2 ->$0BA5
  0b92  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...g"
  0b96  3510           PULS  X                           
  0b98  39             RTS                               

; ---- function FUN_M78_r3_24000__0b99
FUN_M78_r3_24000__0b99:
  0b99  3410           PSHS  X                           
  0b9b  8E0B67         LDX #0xb67                         ; desc[API_FE6C]: ->$0BE2 ->$0BA5
  0b9e  AD9FFE6C       JSR [0xfe6c]                      
  0ba2  3510           PULS  X                           
  0ba4  39             RTS                               

; ---- function FUN_M78_r3_24000__0ba5
FUN_M78_r3_24000__0ba5:
  0ba5  3410           PSHS  X                           
  0ba7  8E0B67         LDX #0xb67                         ; desc[API_FE6E]: ->$0BE2 ->$0BA5
  0baa  AD9FFE6E       JSR [0xfe6e]                      
  0bae  3510           PULS  X                           
  0bb0  39             RTS                               

; ---- function FUN_M78_r3_24000__0bb1
FUN_M78_r3_24000__0bb1:
  0bb1  3410           PSHS  X                           
  0bb3  8E0B67         LDX #0xb67                         ; desc[API_FE1C]: ->$0BE2 ->$0BA5
  0bb6  AD9FFE1C       JSR [0xfe1c]                      
  0bba  3510           PULS  X                           
  0bbc  39             RTS                               

; ---- function FUN_M78_r3_24000__0bbd
FUN_M78_r3_24000__0bbd:
  0bbd  3410           PSHS  X                           
  0bbf  8E0B67         LDX #0xb67                         ; desc[API_FE1A]: ->$0BE2 ->$0BA5 $0B99
  0bc2  AD9FFE1A       JSR [0xfe1a]                      
  0bc6  3510           PULS  X                           
  0bc8  39             RTS                               
  0bc9  .db 00 20                                            ; . 

; ---- function FUN_M78_r3_24000__0bcb
FUN_M78_r3_24000__0bcb:
  0bcb  3476           PSHS  U Y X B A                   
  0bcd  8E0B67         LDX #0xb67                        
  0bd0  1711CD         LBSR 0x1da0                       
  0bd3  C627           LDB #0x27                         
  0bd5  AD9FFC36       JSR [0xfc36]                      
  0bd9  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " "
  0bdd  2000           char[2] " "                       
LAB_M78_r3_24000__0bdf:
  0bdf  3576           PULS  A B X Y U                   
  0be1  39             RTS                               

; ---- function FUN_M78_r3_24000__0be2
FUN_M78_r3_24000__0be2:
  0be2  3476           PSHS  U Y X B A                   
  0be4  8E0B67         LDX #0xb67                        
  0be7  AD9FFE76       JSR [0xfe76]                      
  0beb  FC7080         LDD 0x7080                        
  0bee  3606           PSHU  B A                         
  0bf0  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000A $7188
  0bf4  000A           dw Ah                             
  0bf6  7188           dw 7188h                          
LAB_M78_r3_24000__0bf8:
  0bf8  3706           PULU  A B                         
  0bfa  FD70F8         STD 0x70f8                        
  0bfd  3706           PULU  A B                         
  0bff  FD70FA         STD 0x70fa                        
  0c02  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  0c06  003A           dw 3Ah                            
  0c08  7188           dw 7188h                          
LAB_M78_r3_24000__0c0a:
  0c0a  FC73B9         LDD 0x73b9                        
  0c0d  10830001       CMPD #0x1                         
  0c11  10270006       LBEQ 0x0c1b                       
  0c15  17035B         LBSR 0x0f73                       
  0c18  1706B5         LBSR 0x12d0                       
LAB_M78_r3_24000__0c1b:
  0c1b  3576           PULS  A B X Y U                   
  0c1d  39             RTS                               

; ---- function FUN_M78_r3_24000__0c1e
FUN_M78_r3_24000__0c1e:
  0c1e  3476           PSHS  U Y X B A                   
  0c20  1700A2         LBSR 0x0cc5                       
  0c23  CC0064         LDD #0x64                         
  0c26  FD60DC         STD 0x60dc                        
  0c29  FD60DE         STD 0x60de                        
  0c2c  CC0C4B         LDD #0xc4b                        
  0c2f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0c33  60E3           addr 60e3                         
LAB_M78_r3_24000__0c35:
  0c35  C629           LDB #0x29                         
  0c37  AD9FFC36       JSR [0xfc36]                      
  0c3b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "pitch 1 "
  0c3f  706974636820.. char[9] "pitch 1 "                
LAB_M78_r3_24000__0c48:
  0c48  3576           PULS  A B X Y U                   
  0c4a  39             RTS                               

; ---- function FUN_M78_r3_24000__0c4b
FUN_M78_r3_24000__0c4b:
  0c4b  3476           PSHS  U Y X B A                   
  0c4d  170075         LBSR 0x0cc5                       
  0c50  CC0C1E         LDD #0xc1e                        
  0c53  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0c57  60E3           addr 60e3                         
LAB_M78_r3_24000__0c59:
  0c59  C629           LDB #0x29                         
  0c5b  AD9FFC36       JSR [0xfc36]                      
  0c5f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " fine 1 "
  0c63  2066696E6520.. char[9] " fine 1 "                
LAB_M78_r3_24000__0c6c:
  0c6c  3576           PULS  A B X Y U                   
  0c6e  39             RTS                               
PTR_FUN_M78_r3_24000__0d46_M78_r3_24000__0c6f:
  0c6f  0D46           addr M78_r3_24000::0d46           
  0c71  0CF5           addr M78_r3_24000::0cf5           
  0c73  .db 0C D1 70 38 70 3A 00 00 70 3E 72 84 72 DD 00 F1  ; ..p8p:..p>r.r...
  0c83  .db F0 0E 10 00 01 00 05 11 0C 95 00 00 00 00 70 40  ; ..............p@
  0c93  .db 72 DF 05 70 69 74 63 68 20 31 3A 20 20 20 20 20  ; r..pitch 1:     
  0ca3  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  0cb3  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M78_r3_24000__0cb9
FUN_M78_r3_24000__0cb9:
  0cb9  3410           PSHS  X                           
  0cbb  8E0C6F         LDX #0xc6f                         ; desc[API_FDBC]: ->$0D46 ->$0CF5
  0cbe  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...o"
  0cc2  3510           PULS  X                           
  0cc4  39             RTS                               

; ---- function FUN_M78_r3_24000__0cc5
FUN_M78_r3_24000__0cc5:
  0cc5  3410           PSHS  X                           
  0cc7  8E0C6F         LDX #0xc6f                         ; desc[API_FE6A]: ->$0D46 ->$0CF5
  0cca  AD9FFE6A       JSR [0xfe6a]                      
  0cce  3510           PULS  X                           
  0cd0  39             RTS                               

; ---- function FUN_M78_r3_24000__0cd1
FUN_M78_r3_24000__0cd1:
  0cd1  3410           PSHS  X                           
  0cd3  8E0C6F         LDX #0xc6f                         ; desc[API_FE6C]: ->$0D46 ->$0CF5
  0cd6  AD9FFE6C       JSR [0xfe6c]                      
  0cda  3510           PULS  X                           
  0cdc  39             RTS                               

; ---- function FUN_M78_r3_24000__0cdd
FUN_M78_r3_24000__0cdd:
  0cdd  3410           PSHS  X                           
  0cdf  8E0C6F         LDX #0xc6f                         ; desc[API_FE1C]: ->$0D46 ->$0CF5
  0ce2  AD9FFE1C       JSR [0xfe1c]                      
  0ce6  3510           PULS  X                           
  0ce8  39             RTS                               

; ---- function FUN_M78_r3_24000__0ce9
FUN_M78_r3_24000__0ce9:
  0ce9  3410           PSHS  X                           
  0ceb  8E0C6F         LDX #0xc6f                         ; desc[API_FE1A]: ->$0D46 ->$0CF5 $0CD1
  0cee  AD9FFE1A       JSR [0xfe1a]                      
  0cf2  3510           PULS  X                           
  0cf4  39             RTS                               

; ---- function FUN_M78_r3_24000__0cf5
FUN_M78_r3_24000__0cf5:
  0cf5  3456           PSHS  U X B A                     
  0cf7  8E0C6F         LDX #0xc6f                         ; desc[API_FE6E]: ->$0D46 ->$0CF5
  0cfa  AD9FFE6E       JSR [0xfe6e]                      
  0cfe  FC70E4         LDD 0x70e4                        
  0d01  3606           PSHU  B A                         
  0d03  108E7124       LDY #0x7124                       
  0d07  8603           LDA #0x3                          
  0d09  AD9FFC40       JSR [0xfc40]                      
  0d0d  C620           LDB #0x20                         
  0d0f  AD9FFC36       JSR [0xfc36]                      
  0d13  CC0005         LDD #0x5                          
  0d16  8E7128         LDX #0x7128                       
  0d19  AD9FFC3A       JSR [0xfc3a]                      
  0d1d  3556           PULS  A B X U                     
  0d1f  39             RTS                               

; ---- function FUN_M78_r3_24000__0d20
FUN_M78_r3_24000__0d20:
  0d20  3606           PSHU  B A                         
  0d22  CC0064         LDD #0x64                         
  0d25  3606           PSHU  B A                         
  0d27  AD9FFCE6       JSR [0xfce6]                      
  0d2b  335E           LEAU -0x2,U                       
  0d2d  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002A $7188
  0d31  002A           dw 2Ah                            
  0d33  7188           dw 7188h                          
LAB_M78_r3_24000__0d35:
  0d35  3706           PULU  A B                         
  0d37  39             RTS                               

; ---- function FUN_M78_r3_24000__0d38
FUN_M78_r3_24000__0d38:
  0d38  3606           PSHU  B A                         
  0d3a  CC4189         LDD #0x4189                       
  0d3d  3606           PSHU  B A                         
  0d3f  AD9FFCF2       JSR [0xfcf2]                      
  0d43  3706           PULU  A B                         
  0d45  39             RTS                               

; ---- function FUN_M78_r3_24000__0d46
FUN_M78_r3_24000__0d46:
  0d46  3476           PSHS  U Y X B A                   
  0d48  FC703A         LDD 0x703a                        
  0d4b  3406           PSHS  B A                         
  0d4d  F3703C         ADDD 0x703c                       
  0d50  FD703A         STD 0x703a                        
  0d53  8E0C6F         LDX #0xc6f                        
  0d56  AD9FFE76       JSR [0xfe76]                      
  0d5a  3506           PULS  A B                         
  0d5c  FD703A         STD 0x703a                        
  0d5f  FC703E         LDD 0x703e                        
  0d62  17FFBB         LBSR 0x0d20                       
  0d65  FD70E4         STD 0x70e4                        
  0d68  17FFCD         LBSR 0x0d38                       
  0d6b  FD70E6         STD 0x70e6                        
  0d6e  FC7176         LDD 0x7176                        
  0d71  10830000       CMPD #0x0                         
  0d75  10270009       LBEQ 0x0d82                       
  0d79  CC0000         LDD #0x0                          
  0d7c  B370E6         SUBD 0x70e6                       
  0d7f  FD70E6         STD 0x70e6                        
LAB_M78_r3_24000__0d82:
  0d82  FC7254         LDD 0x7254                        
  0d85  10830000       CMPD #0x0                         
  0d89  10270054       LBEQ 0x0de1                       
  0d8d  FC7254         LDD 0x7254                        
  0d90  10830001       CMPD #0x1                         
  0d94  10270019       LBEQ 0x0db1                       
  0d98  FC7254         LDD 0x7254                        
  0d9b  10830002       CMPD #0x2                         
  0d9f  10270023       LBEQ 0x0dc6                       
  0da3  FC7090         LDD 0x7090                        
  0da6  10830001       CMPD #0x1                         
  0daa  1027001E       LBEQ 0x0dcc                       
  0dae  170051         LBSR 0x0e02                       
LAB_M78_r3_24000__0db1:
  0db1  CC000A         LDD #0xa                          
  0db4  AD9FFD20       JSR [0xfd20]                      
  0db8  108E0140       LDY #0x140                        
  0dbc  FC70E6         LDD 0x70e6                        
  0dbf  AD9FFD2E       JSR [0xfd2e]                      
  0dc3  16001B         LBRA 0x0de1                       
LAB_M78_r3_24000__0dc6:
  0dc6  170039         LBSR 0x0e02                       
  0dc9  160015         LBRA 0x0de1                       
LAB_M78_r3_24000__0dcc:
  0dcc  CC000A         LDD #0xa                          
  0dcf  AD9FFD20       JSR [0xfd20]                      
  0dd3  108E0340       LDY #0x340                        
  0dd7  FC70E6         LDD 0x70e6                        
  0dda  AD9FFD2E       JSR [0xfd2e]                      
  0dde  160000         LBRA 0x0de1                       
LAB_M78_r3_24000__0de1:
  0de1  FC7088         LDD 0x7088                        
  0de4  10830000       CMPD #0x0                         
  0de8  10270003       LBEQ 0x0def                       
  0dec  170341         LBSR 0x1130                       
LAB_M78_r3_24000__0def:
  0def  8E0C6F         LDX #0xc6f                        
  0df2  AD9FFE76       JSR [0xfe76]                      
  0df6  FC703E         LDD 0x703e                        
  0df9  17FF24         LBSR 0x0d20                       
  0dfc  FD70E4         STD 0x70e4                        
  0dff  3576           PULS  A B X Y U                   
  0e01  39             RTS                               

; ---- function FUN_M78_r3_24000__0e02
FUN_M78_r3_24000__0e02:
  0e02  3476           PSHS  U Y X B A                   
  0e04  FC703A         LDD 0x703a                        
  0e07  3406           PSHS  B A                         
  0e09  F37268         ADDD 0x7268                       
  0e0c  FD703A         STD 0x703a                        
  0e0f  8E0C6F         LDX #0xc6f                        
  0e12  AD9FFE76       JSR [0xfe76]                      
  0e16  3506           PULS  A B                         
  0e18  FD703A         STD 0x703a                        
  0e1b  FC703E         LDD 0x703e                        
  0e1e  17FEFF         LBSR 0x0d20                       
  0e21  FD7258         STD 0x7258                        
  0e24  17FF11         LBSR 0x0d38                       
  0e27  FD725A         STD 0x725a                        
  0e2a  FC7176         LDD 0x7176                        
  0e2d  10830000       CMPD #0x0                         
  0e31  10270009       LBEQ 0x0e3e                       
  0e35  CC0000         LDD #0x0                          
  0e38  B3725A         SUBD 0x725a                       
  0e3b  FD725A         STD 0x725a                        
LAB_M78_r3_24000__0e3e:
  0e3e  CC000A         LDD #0xa                          
  0e41  AD9FFD20       JSR [0xfd20]                      
  0e45  108E0240       LDY #0x240                        
  0e49  FC725A         LDD 0x725a                        
  0e4c  AD9FFD2E       JSR [0xfd2e]                      
  0e50  FC7088         LDD 0x7088                        
  0e53  10830000       CMPD #0x0                         
  0e57  10270003       LBEQ 0x0e5e                       
  0e5b  170387         LBSR 0x11e5                       
LAB_M78_r3_24000__0e5e:
  0e5e  8E0C6F         LDX #0xc6f                        
  0e61  AD9FFE76       JSR [0xfe76]                      
  0e65  FC703E         LDD 0x703e                        
  0e68  17FEB5         LBSR 0x0d20                       
  0e6b  FD70E4         STD 0x70e4                        
  0e6e  3576           PULS  A B X Y U                   
  0e70  39             RTS                               

; ---- function FUN_M78_r3_24000__0e71
FUN_M78_r3_24000__0e71:
  0e71  3476           PSHS  U Y X B A                   
  0e73  1700A2         LBSR 0x0f18                       
  0e76  CC0064         LDD #0x64                         
  0e79  FD60DC         STD 0x60dc                        
  0e7c  FD60DE         STD 0x60de                        
  0e7f  CC0E9E         LDD #0xe9e                        
  0e82  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0e86  60E3           addr 60e3                         
LAB_M78_r3_24000__0e88:
  0e88  C629           LDB #0x29                         
  0e8a  AD9FFC36       JSR [0xfc36]                      
  0e8e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "pitch 2 "
  0e92  706974636820.. char[9] "pitch 2 "                
LAB_M78_r3_24000__0e9b:
  0e9b  3576           PULS  A B X Y U                   
  0e9d  39             RTS                               

; ---- function FUN_M78_r3_24000__0e9e
FUN_M78_r3_24000__0e9e:
  0e9e  3476           PSHS  U Y X B A                   
  0ea0  170075         LBSR 0x0f18                       
  0ea3  CC0E71         LDD #0xe71                        
  0ea6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E3
  0eaa  60E3           addr 60e3                         
LAB_M78_r3_24000__0eac:
  0eac  C629           LDB #0x29                         
  0eae  AD9FFC36       JSR [0xfc36]                      
  0eb2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " fine 2 "
  0eb6  2066696E6520.. char[9] " fine 2 "                
LAB_M78_r3_24000__0ebf:
  0ebf  3576           PULS  A B X Y U                   
  0ec1  39             RTS                               
PTR_FUN_M78_r3_24000__0f73_M78_r3_24000__0ec2:
  0ec2  0F73           addr M78_r3_24000::0f73           
  0ec4  0F48           addr M78_r3_24000::0f48           
  0ec6  .db 0F 24 70 44 70 46 00 00 70 4A 72 84 72 E1 01 F1  ; .$pDpF..pJr.r...
  0ed6  .db F0 0E 10 00 01 00 05 11 0E E8 00 00 00 00 70 4C  ; ..............pL
  0ee6  .db 72 E3 05 70 69 74 63 68 20 32 3A 20 20 20 20 20  ; r..pitch 2:     
  0ef6  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  0f06  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M78_r3_24000__0f0c
FUN_M78_r3_24000__0f0c:
  0f0c  3410           PSHS  X                           
  0f0e  8E0EC2         LDX #0xec2                         ; desc[API_FDBC]: ->$0F73 ->$0F48
  0f11  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0f15  3510           PULS  X                           
  0f17  39             RTS                               

; ---- function FUN_M78_r3_24000__0f18
FUN_M78_r3_24000__0f18:
  0f18  3410           PSHS  X                           
  0f1a  8E0EC2         LDX #0xec2                         ; desc[API_FE6A]: ->$0F73 ->$0F48
  0f1d  AD9FFE6A       JSR [0xfe6a]                      
  0f21  3510           PULS  X                           
  0f23  39             RTS                               

; ---- function FUN_M78_r3_24000__0f24
FUN_M78_r3_24000__0f24:
  0f24  3410           PSHS  X                           
  0f26  8E0EC2         LDX #0xec2                         ; desc[API_FE6C]: ->$0F73 ->$0F48
  0f29  AD9FFE6C       JSR [0xfe6c]                      
  0f2d  3510           PULS  X                           
  0f2f  39             RTS                               

; ---- function FUN_M78_r3_24000__0f30
FUN_M78_r3_24000__0f30:
  0f30  3410           PSHS  X                           
  0f32  8E0EC2         LDX #0xec2                         ; desc[API_FE1C]: ->$0F73 ->$0F48
  0f35  AD9FFE1C       JSR [0xfe1c]                      
  0f39  3510           PULS  X                           
  0f3b  39             RTS                               

; ---- function FUN_M78_r3_24000__0f3c
FUN_M78_r3_24000__0f3c:
  0f3c  3410           PSHS  X                           
  0f3e  8E0EC2         LDX #0xec2                         ; desc[API_FE1A]: ->$0F73 ->$0F48 $0F24
  0f41  AD9FFE1A       JSR [0xfe1a]                      
  0f45  3510           PULS  X                           
  0f47  39             RTS                               

; ---- function FUN_M78_r3_24000__0f48
FUN_M78_r3_24000__0f48:
  0f48  3456           PSHS  U X B A                     
  0f4a  8E0EC2         LDX #0xec2                         ; desc[API_FE6E]: ->$0F73 ->$0F48
  0f4d  AD9FFE6E       JSR [0xfe6e]                      
  0f51  FC70E8         LDD 0x70e8                        
  0f54  3606           PSHU  B A                         
  0f56  108E7124       LDY #0x7124                       
  0f5a  8603           LDA #0x3                          
  0f5c  AD9FFC40       JSR [0xfc40]                      
  0f60  C620           LDB #0x20                         
  0f62  AD9FFC36       JSR [0xfc36]                      
  0f66  CC0005         LDD #0x5                          
  0f69  8E7128         LDX #0x7128                       
  0f6c  AD9FFC3A       JSR [0xfc3a]                      
  0f70  3556           PULS  A B X U                     
  0f72  39             RTS                               

; ---- function FUN_M78_r3_24000__0f73
FUN_M78_r3_24000__0f73:
  0f73  3476           PSHS  U Y X B A                   
  0f75  FC7046         LDD 0x7046                        
  0f78  3406           PSHS  B A                         
  0f7a  F37048         ADDD 0x7048                       
  0f7d  FD7046         STD 0x7046                        
  0f80  8E0EC2         LDX #0xec2                        
  0f83  AD9FFE76       JSR [0xfe76]                      
  0f87  3506           PULS  A B                         
  0f89  FD7046         STD 0x7046                        
  0f8c  FC704A         LDD 0x704a                        
  0f8f  17FD8E         LBSR 0x0d20                       
  0f92  FD70E8         STD 0x70e8                        
  0f95  17FDA0         LBSR 0x0d38                       
  0f98  FD70EA         STD 0x70ea                        
  0f9b  FC7178         LDD 0x7178                        
  0f9e  10830000       CMPD #0x0                         
  0fa2  10270009       LBEQ 0x0faf                       
  0fa6  CC0000         LDD #0x0                          
  0fa9  B370EA         SUBD 0x70ea                       
  0fac  FD70EA         STD 0x70ea                        
LAB_M78_r3_24000__0faf:
  0faf  FC7256         LDD 0x7256                        
  0fb2  10830000       CMPD #0x0                         
  0fb6  10270063       LBEQ 0x101d                       
  0fba  FC7256         LDD 0x7256                        
  0fbd  10830001       CMPD #0x1                         
  0fc1  10270028       LBEQ 0x0fed                       
  0fc5  FC7256         LDD 0x7256                        
  0fc8  10830002       CMPD #0x2                         
  0fcc  10270023       LBEQ 0x0ff3                       
  0fd0  FC7090         LDD 0x7090                        
  0fd3  10830001       CMPD #0x1                         
  0fd7  1027002D       LBEQ 0x1008                       
  0fdb  CC000A         LDD #0xa                          
  0fde  AD9FFD20       JSR [0xfd20]                      
  0fe2  108E036F       LDY #0x36f                        
  0fe6  FC70EA         LDD 0x70ea                        
  0fe9  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__0fed:
  0fed  17004E         LBSR 0x103e                       
  0ff0  16002A         LBRA 0x101d                       
LAB_M78_r3_24000__0ff3:
  0ff3  CC000A         LDD #0xa                          
  0ff6  AD9FFD20       JSR [0xfd20]                      
  0ffa  108E026F       LDY #0x26f                        
  0ffe  FC70EA         LDD 0x70ea                        
  1001  AD9FFD2E       JSR [0xfd2e]                      
  1005  160015         LBRA 0x101d                       
LAB_M78_r3_24000__1008:
  1008  CC000A         LDD #0xa                          
  100b  AD9FFD20       JSR [0xfd20]                      
  100f  108E036F       LDY #0x36f                        
  1013  FC70EA         LDD 0x70ea                        
  1016  AD9FFD2E       JSR [0xfd2e]                      
  101a  160000         LBRA 0x101d                       
LAB_M78_r3_24000__101d:
  101d  FC7088         LDD 0x7088                        
  1020  10830000       CMPD #0x0                         
  1024  10270003       LBEQ 0x102b                       
  1028  1702A5         LBSR 0x12d0                       
LAB_M78_r3_24000__102b:
  102b  8E0EC2         LDX #0xec2                        
  102e  AD9FFE76       JSR [0xfe76]                      
  1032  FC704A         LDD 0x704a                        
  1035  17FCE8         LBSR 0x0d20                       
  1038  FD70E8         STD 0x70e8                        
  103b  3576           PULS  A B X Y U                   
  103d  39             RTS                               

; ---- function FUN_M78_r3_24000__103e
FUN_M78_r3_24000__103e:
  103e  3476           PSHS  U Y X B A                   
  1040  FC7046         LDD 0x7046                        
  1043  3406           PSHS  B A                         
  1045  F3726A         ADDD 0x726a                       
  1048  FD7046         STD 0x7046                        
  104b  8E0EC2         LDX #0xec2                        
  104e  AD9FFE76       JSR [0xfe76]                      
  1052  3506           PULS  A B                         
  1054  FD7046         STD 0x7046                        
  1057  FC704A         LDD 0x704a                        
  105a  17FCC3         LBSR 0x0d20                       
  105d  FD725C         STD 0x725c                        
  1060  17FCD5         LBSR 0x0d38                       
  1063  FD725E         STD 0x725e                        
  1066  FC7178         LDD 0x7178                        
  1069  10830000       CMPD #0x0                         
  106d  10270009       LBEQ 0x107a                       
  1071  CC0000         LDD #0x0                          
  1074  B3725E         SUBD 0x725e                       
  1077  FD725E         STD 0x725e                        
LAB_M78_r3_24000__107a:
  107a  CC000A         LDD #0xa                          
  107d  AD9FFD20       JSR [0xfd20]                      
  1081  108E016F       LDY #0x16f                        
  1085  FC725E         LDD 0x725e                        
  1088  AD9FFD2E       JSR [0xfd2e]                      
  108c  FC7088         LDD 0x7088                        
  108f  10830000       CMPD #0x0                         
  1093  10270003       LBEQ 0x109a                       
  1097  1702FA         LBSR 0x1394                       
LAB_M78_r3_24000__109a:
  109a  8E0EC2         LDX #0xec2                        
  109d  AD9FFE76       JSR [0xfe76]                      
  10a1  FC704A         LDD 0x704a                        
  10a4  17FC79         LBSR 0x0d20                       
  10a7  FD70E8         STD 0x70e8                        
  10aa  3576           PULS  A B X Y U                   
  10ac  39             RTS                               
PTR_FUN_M78_r3_24000__1130_M78_r3_24000__10ad:
  10ad  1130           addr M78_r3_24000::1130           
  10af  10F7           addr M78_r3_24000::10f7           
  10b1  .db 10 EB 70 50 70 52 00 00 70 54 72 84 72 E5 02 00  ; ..pPpR..pTr.r...
  10c1  .db 00 1F 40 00 01 01 05 21 11 1B 00 00 00 00 70 56  ; ..@....!......pV
  10d1  .db 72 E7                                            ; r.

; ---- function FUN_M78_r3_24000__10d3
FUN_M78_r3_24000__10d3:
  10d3  3410           PSHS  X                           
  10d5  8E10AD         LDX #0x10ad                        ; desc[API_FE6A]: ->$1130 ->$10F7
  10d8  AD9FFE6A       JSR [0xfe6a]                      
  10dc  3510           PULS  X                           
  10de  39             RTS                               

; ---- function FUN_M78_r3_24000__10df
FUN_M78_r3_24000__10df:
  10df  3410           PSHS  X                           
  10e1  8E10AD         LDX #0x10ad                        ; desc[API_FDBC]: ->$1130 ->$10F7
  10e4  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  10e8  3510           PULS  X                           
  10ea  39             RTS                               

; ---- function FUN_M78_r3_24000__10eb
FUN_M78_r3_24000__10eb:
  10eb  3410           PSHS  X                           
  10ed  8E10AD         LDX #0x10ad                        ; desc[API_FE6C]: ->$1130 ->$10F7
  10f0  AD9FFE6C       JSR [0xfe6c]                      
  10f4  3510           PULS  X                           
  10f6  39             RTS                               

; ---- function FUN_M78_r3_24000__10f7
FUN_M78_r3_24000__10f7:
  10f7  3410           PSHS  X                           
  10f9  8E10AD         LDX #0x10ad                        ; desc[API_FE6E]: ->$1130 ->$10F7
  10fc  AD9FFE6E       JSR [0xfe6e]                      
  1100  3510           PULS  X                           
  1102  39             RTS                               

; ---- function FUN_M78_r3_24000__1103
FUN_M78_r3_24000__1103:
  1103  3410           PSHS  X                           
  1105  8E10AD         LDX #0x10ad                        ; desc[API_FE1C]: ->$1130 ->$10F7
  1108  AD9FFE1C       JSR [0xfe1c]                      
  110c  3510           PULS  X                           
  110e  39             RTS                               

; ---- function FUN_M78_r3_24000__110f
FUN_M78_r3_24000__110f:
  110f  3410           PSHS  X                           
  1111  8E10AD         LDX #0x10ad                        ; desc[API_FE1A]: ->$1130 ->$10F7 $10EB
  1114  AD9FFE1A       JSR [0xfe1a]                      
  1118  3510           PULS  X                           
  111a  39             RTS                               
  111b  .db 14 72 65 70 6C 61 79 20 73 70 65 65 64 3A 20 20  ; .replay speed:  
  112b  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M78_r3_24000__1130
FUN_M78_r3_24000__1130:
  1130  3476           PSHS  U Y X B A                   
  1132  8E10AD         LDX #0x10ad                       
  1135  AD9FFE76       JSR [0xfe76]                      
  1139  FC7088         LDD 0x7088                        
  113c  10830000       CMPD #0x0                         
  1140  10270018       LBEQ 0x115c                       
  1144  FC7054         LDD 0x7054                        
  1147  3606           PSHU  B A                         
  1149  FC70E4         LDD 0x70e4                        
  114c  3606           PSHU  B A                         
  114e  AD9FFCF2       JSR [0xfcf2]                      
  1152  170CBB         LBSR 0x1e10                       
  1155  3706           PULU  A B                         
  1157  FD7058         STD 0x7058                        
  115a  2013           BRA 0x116f                        
LAB_M78_r3_24000__115c:
  115c  FC7054         LDD 0x7054                        
  115f  3606           PSHU  B A                         
  1161  CC4189         LDD #0x4189                       
  1164  3606           PSHU  B A                         
  1166  AD9FFCF2       JSR [0xfcf2]                      
  116a  3706           PULU  A B                         
  116c  FD7058         STD 0x7058                        
LAB_M78_r3_24000__116f:
  116f  FC7176         LDD 0x7176                        
  1172  10830000       CMPD #0x0                         
  1176  10270009       LBEQ 0x1183                       
  117a  CC0000         LDD #0x0                          
  117d  B37058         SUBD 0x7058                       
  1180  FD7058         STD 0x7058                        
LAB_M78_r3_24000__1183:
  1183  FC7254         LDD 0x7254                        
  1186  10830000       CMPD #0x0                         
  118a  10270054       LBEQ 0x11e2                       
  118e  FC7254         LDD 0x7254                        
  1191  10830001       CMPD #0x1                         
  1195  10270019       LBEQ 0x11b2                       
  1199  FC7254         LDD 0x7254                        
  119c  10830002       CMPD #0x2                         
  11a0  10270023       LBEQ 0x11c7                       
  11a4  FC7090         LDD 0x7090                        
  11a7  10830001       CMPD #0x1                         
  11ab  1027001E       LBEQ 0x11cd                       
  11af  170033         LBSR 0x11e5                       
LAB_M78_r3_24000__11b2:
  11b2  CC000A         LDD #0xa                          
  11b5  AD9FFD20       JSR [0xfd20]                      
  11b9  108E0141       LDY #0x141                        
  11bd  FC7058         LDD 0x7058                        
  11c0  AD9FFD2E       JSR [0xfd2e]                      
  11c4  16001B         LBRA 0x11e2                       
LAB_M78_r3_24000__11c7:
  11c7  17001B         LBSR 0x11e5                       
  11ca  160015         LBRA 0x11e2                       
LAB_M78_r3_24000__11cd:
  11cd  CC000A         LDD #0xa                          
  11d0  AD9FFD20       JSR [0xfd20]                      
  11d4  108E0341       LDY #0x341                        
  11d8  FC7058         LDD 0x7058                        
  11db  AD9FFD2E       JSR [0xfd2e]                      
  11df  160000         LBRA 0x11e2                       
LAB_M78_r3_24000__11e2:
  11e2  3576           PULS  A B X Y U                   
  11e4  39             RTS                               

; ---- function FUN_M78_r3_24000__11e5
FUN_M78_r3_24000__11e5:
  11e5  3476           PSHS  U Y X B A                   
  11e7  8E10AD         LDX #0x10ad                       
  11ea  AD9FFE76       JSR [0xfe76]                      
  11ee  FC7088         LDD 0x7088                        
  11f1  10830000       CMPD #0x0                         
  11f5  10270018       LBEQ 0x1211                       
  11f9  FC7054         LDD 0x7054                        
  11fc  3606           PSHU  B A                         
  11fe  FC7258         LDD 0x7258                        
  1201  3606           PSHU  B A                         
  1203  AD9FFCF2       JSR [0xfcf2]                      
  1207  170C06         LBSR 0x1e10                       
  120a  3706           PULU  A B                         
  120c  FD7262         STD 0x7262                        
  120f  2013           BRA 0x1224                        
LAB_M78_r3_24000__1211:
  1211  FC7054         LDD 0x7054                        
  1214  3606           PSHU  B A                         
  1216  CC4189         LDD #0x4189                       
  1219  3606           PSHU  B A                         
  121b  AD9FFCF2       JSR [0xfcf2]                      
  121f  3706           PULU  A B                         
  1221  FD7262         STD 0x7262                        
LAB_M78_r3_24000__1224:
  1224  FC7176         LDD 0x7176                        
  1227  10830000       CMPD #0x0                         
  122b  10270009       LBEQ 0x1238                       
  122f  CC0000         LDD #0x0                          
  1232  B37262         SUBD 0x7262                       
  1235  FD7262         STD 0x7262                        
LAB_M78_r3_24000__1238:
  1238  CC000A         LDD #0xa                          
  123b  AD9FFD20       JSR [0xfd20]                      
  123f  108E0241       LDY #0x241                        
  1243  FC7262         LDD 0x7262                        
  1246  AD9FFD2E       JSR [0xfd2e]                      
  124a  3576           PULS  A B X Y U                   
  124c  39             RTS                               
PTR_FUN_M78_r3_24000__12d0_M78_r3_24000__124d:
  124d  12D0           addr M78_r3_24000::12d0           
  124f  1297           addr M78_r3_24000::1297           
  1251  .db 12 8B 70 5A 70 5C 00 00 70 5E 72 84 72 E9 03 00  ; ..pZp\..p^r.r...
  1261  .db 00 1F 40 00 01 01 05 21 12 BB 00 00 00 00 70 60  ; ..@....!......p`
  1271  .db 72 EB                                            ; r.

; ---- function FUN_M78_r3_24000__1273
FUN_M78_r3_24000__1273:
  1273  3410           PSHS  X                           
  1275  8E124D         LDX #0x124d                        ; desc[API_FE6A]: ->$12D0 ->$1297
  1278  AD9FFE6A       JSR [0xfe6a]                      
  127c  3510           PULS  X                           
  127e  39             RTS                               

; ---- function FUN_M78_r3_24000__127f
FUN_M78_r3_24000__127f:
  127f  3410           PSHS  X                           
  1281  8E124D         LDX #0x124d                        ; desc[API_FDBC]: ->$12D0 ->$1297
  1284  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...M"
  1288  3510           PULS  X                           
  128a  39             RTS                               

; ---- function FUN_M78_r3_24000__128b
FUN_M78_r3_24000__128b:
  128b  3410           PSHS  X                           
  128d  8E124D         LDX #0x124d                        ; desc[API_FE6C]: ->$12D0 ->$1297
  1290  AD9FFE6C       JSR [0xfe6c]                      
  1294  3510           PULS  X                           
  1296  39             RTS                               

; ---- function FUN_M78_r3_24000__1297
FUN_M78_r3_24000__1297:
  1297  3410           PSHS  X                           
  1299  8E124D         LDX #0x124d                        ; desc[API_FE6E]: ->$12D0 ->$1297
  129c  AD9FFE6E       JSR [0xfe6e]                      
  12a0  3510           PULS  X                           
  12a2  39             RTS                               

; ---- function FUN_M78_r3_24000__12a3
FUN_M78_r3_24000__12a3:
  12a3  3410           PSHS  X                           
  12a5  8E124D         LDX #0x124d                        ; desc[API_FE1C]: ->$12D0 ->$1297
  12a8  AD9FFE1C       JSR [0xfe1c]                      
  12ac  3510           PULS  X                           
  12ae  39             RTS                               

; ---- function FUN_M78_r3_24000__12af
FUN_M78_r3_24000__12af:
  12af  3410           PSHS  X                           
  12b1  8E124D         LDX #0x124d                        ; desc[API_FE1A]: ->$12D0 ->$1297 $128B
  12b4  AD9FFE1A       JSR [0xfe1a]                      
  12b8  3510           PULS  X                           
  12ba  39             RTS                               
  12bb  .db 14 72 65 70 6C 61 79 20 73 70 65 65 64 3A 20 20  ; .replay speed:  
  12cb  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M78_r3_24000__12d0
FUN_M78_r3_24000__12d0:
  12d0  3476           PSHS  U Y X B A                   
  12d2  8E124D         LDX #0x124d                       
  12d5  AD9FFE76       JSR [0xfe76]                      
  12d9  FC7088         LDD 0x7088                        
  12dc  10830000       CMPD #0x0                         
  12e0  10270018       LBEQ 0x12fc                       
  12e4  FC705E         LDD 0x705e                        
  12e7  3606           PSHU  B A                         
  12e9  FC70E8         LDD 0x70e8                        
  12ec  3606           PSHU  B A                         
  12ee  AD9FFCF2       JSR [0xfcf2]                      
  12f2  170B1B         LBSR 0x1e10                       
  12f5  3706           PULU  A B                         
  12f7  FD7062         STD 0x7062                        
  12fa  2013           BRA 0x130f                        
LAB_M78_r3_24000__12fc:
  12fc  FC705E         LDD 0x705e                        
  12ff  3606           PSHU  B A                         
  1301  CC4189         LDD #0x4189                       
  1304  3606           PSHU  B A                         
  1306  AD9FFCF2       JSR [0xfcf2]                      
  130a  3706           PULU  A B                         
  130c  FD7062         STD 0x7062                        
LAB_M78_r3_24000__130f:
  130f  FC7178         LDD 0x7178                        
  1312  10830000       CMPD #0x0                         
  1316  10270009       LBEQ 0x1323                       
  131a  CC0000         LDD #0x0                          
  131d  B37062         SUBD 0x7062                       
  1320  FD7062         STD 0x7062                        
LAB_M78_r3_24000__1323:
  1323  FC7256         LDD 0x7256                        
  1326  10830000       CMPD #0x0                         
  132a  10270063       LBEQ 0x1391                       
  132e  FC7256         LDD 0x7256                        
  1331  10830001       CMPD #0x1                         
  1335  10270028       LBEQ 0x1361                       
  1339  FC7256         LDD 0x7256                        
  133c  10830002       CMPD #0x2                         
  1340  10270023       LBEQ 0x1367                       
  1344  FC7090         LDD 0x7090                        
  1347  10830001       CMPD #0x1                         
  134b  1027002D       LBEQ 0x137c                       
  134f  CC000A         LDD #0xa                          
  1352  AD9FFD20       JSR [0xfd20]                      
  1356  108E0370       LDY #0x370                        
  135a  FC7062         LDD 0x7062                        
  135d  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__1361:
  1361  170030         LBSR 0x1394                       
  1364  16002A         LBRA 0x1391                       
LAB_M78_r3_24000__1367:
  1367  CC000A         LDD #0xa                          
  136a  AD9FFD20       JSR [0xfd20]                      
  136e  108E0270       LDY #0x270                        
  1372  FC7062         LDD 0x7062                        
  1375  AD9FFD2E       JSR [0xfd2e]                      
  1379  160015         LBRA 0x1391                       
LAB_M78_r3_24000__137c:
  137c  CC000A         LDD #0xa                          
  137f  AD9FFD20       JSR [0xfd20]                      
  1383  108E0370       LDY #0x370                        
  1387  FC7062         LDD 0x7062                        
  138a  AD9FFD2E       JSR [0xfd2e]                      
  138e  160000         LBRA 0x1391                       
LAB_M78_r3_24000__1391:
  1391  3576           PULS  A B X Y U                   
  1393  39             RTS                               

; ---- function FUN_M78_r3_24000__1394
FUN_M78_r3_24000__1394:
  1394  3476           PSHS  U Y X B A                   
  1396  8E124D         LDX #0x124d                       
  1399  AD9FFE76       JSR [0xfe76]                      
  139d  FC7088         LDD 0x7088                        
  13a0  10830000       CMPD #0x0                         
  13a4  10270018       LBEQ 0x13c0                       
  13a8  FC705E         LDD 0x705e                        
  13ab  3606           PSHU  B A                         
  13ad  FC725C         LDD 0x725c                        
  13b0  3606           PSHU  B A                         
  13b2  AD9FFCF2       JSR [0xfcf2]                      
  13b6  170A57         LBSR 0x1e10                       
  13b9  3706           PULU  A B                         
  13bb  FD7266         STD 0x7266                        
  13be  2013           BRA 0x13d3                        
LAB_M78_r3_24000__13c0:
  13c0  FC705E         LDD 0x705e                        
  13c3  3606           PSHU  B A                         
  13c5  CC4189         LDD #0x4189                       
  13c8  3606           PSHU  B A                         
  13ca  AD9FFCF2       JSR [0xfcf2]                      
  13ce  3706           PULU  A B                         
  13d0  FD7266         STD 0x7266                        
LAB_M78_r3_24000__13d3:
  13d3  FC7178         LDD 0x7178                        
  13d6  10830000       CMPD #0x0                         
  13da  10270009       LBEQ 0x13e7                       
  13de  CC0000         LDD #0x0                          
  13e1  B37266         SUBD 0x7266                       
  13e4  FD7266         STD 0x7266                        
LAB_M78_r3_24000__13e7:
  13e7  CC000A         LDD #0xa                          
  13ea  AD9FFD20       JSR [0xfd20]                      
  13ee  108E0170       LDY #0x170                        
  13f2  FC7266         LDD 0x7266                        
  13f5  AD9FFD2E       JSR [0xfd2e]                      
  13f9  3576           PULS  A B X Y U                   
  13fb  39             RTS                               
PTR_FUN_M78_r3_24000__1492_M78_r3_24000__13fc:
  13fc  1492           addr M78_r3_24000::1492           
  13fe  1483           addr M78_r3_24000::1483           
  1400  .db 14 5F 70 30 70 32 00 00 70 34 72 84 72 D9 09 00  ; ._p0p2..p4r.r...
  1410  .db 00 00 01 00 01 00 18 10 14 22 00 00 15 8A 70 36  ; ........."....p6
  1420  .db 72 DB 04 74 72 69 67 20 6D 6F 64 65 3A 20 20 20  ; r..trig mode:   
  1430  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1440  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M78_r3_24000__1447
FUN_M78_r3_24000__1447:
  1447  3410           PSHS  X                           
  1449  8E13FC         LDX #0x13fc                        ; desc[API_FDBC]: ->$1492 ->$1483
  144c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1450  3510           PULS  X                           
  1452  39             RTS                               

; ---- function FUN_M78_r3_24000__1453
FUN_M78_r3_24000__1453:
  1453  3410           PSHS  X                           
  1455  8E13FC         LDX #0x13fc                       
  1458  AD9FFC4E       JSR [0xfc4e]                      
  145c  3510           PULS  X                           
  145e  39             RTS                               

; ---- function FUN_M78_r3_24000__145f
FUN_M78_r3_24000__145f:
  145f  3410           PSHS  X                           
  1461  8E13FC         LDX #0x13fc                        ; desc[API_FE6C]: ->$1492 ->$1483
  1464  AD9FFE6C       JSR [0xfe6c]                      
  1468  3510           PULS  X                           
  146a  39             RTS                               

; ---- function FUN_M78_r3_24000__146b
FUN_M78_r3_24000__146b:
  146b  3410           PSHS  X                           
  146d  8E13FC         LDX #0x13fc                        ; desc[API_FE1C]: ->$1492 ->$1483
  1470  AD9FFE1C       JSR [0xfe1c]                      
  1474  3510           PULS  X                           
  1476  39             RTS                               

; ---- function FUN_M78_r3_24000__1477
FUN_M78_r3_24000__1477:
  1477  3410           PSHS  X                           
  1479  8E13FC         LDX #0x13fc                        ; desc[API_FE1A]: ->$1492 ->$1483 $145F
  147c  AD9FFE1A       JSR [0xfe1a]                      
  1480  3510           PULS  X                           
  1482  39             RTS                               

; ---- function FUN_M78_r3_24000__1483
FUN_M78_r3_24000__1483:
  1483  3410           PSHS  X                           
  1485  8E13FC         LDX #0x13fc                       
  1488  AD9FFC52       JSR [0xfc52]                      
  148c  17F316         LBSR 0x07a5                       
  148f  3510           PULS  X                           
  1491  39             RTS                               

; ---- function FUN_M78_r3_24000__1492
FUN_M78_r3_24000__1492:
  1492  3476           PSHS  U Y X B A                   
  1494  8E13FC         LDX #0x13fc                       
  1497  AD9FFE76       JSR [0xfe76]                      
  149b  FC7034         LDD 0x7034                        
  149e  10830000       CMPD #0x0                         
  14a2  1027000B       LBEQ 0x14b1                       
  14a6  FC7034         LDD 0x7034                        
  14a9  10830001       CMPD #0x1                         
  14ad  10270039       LBEQ 0x14ea                       
LAB_M78_r3_24000__14b1:
  14b1  CC000A         LDD #0xa                          
  14b4  AD9FFD20       JSR [0xfd20]                      
  14b8  108E0358       LDY #0x358                        
  14bc  CC0000         LDD #0x0                          
  14bf  AD9FFD2E       JSR [0xfd2e]                      
  14c3  CC000A         LDD #0xa                          
  14c6  AD9FFD20       JSR [0xfd20]                      
  14ca  108E0359       LDY #0x359                        
  14ce  CC0000         LDD #0x0                          
  14d1  AD9FFD2E       JSR [0xfd2e]                      
  14d5  CC000A         LDD #0xa                          
  14d8  AD9FFD20       JSR [0xfd20]                      
  14dc  108E035B       LDY #0x35b                        
  14e0  CC0000         LDD #0x0                          
  14e3  AD9FFD2E       JSR [0xfd2e]                      
  14e7  16009D         LBRA 0x1587                       
LAB_M78_r3_24000__14ea:
  14ea  FC7090         LDD 0x7090                        
  14ed  10830000       CMPD #0x0                         
  14f1  10270038       LBEQ 0x152d                       
  14f5  CC000A         LDD #0xa                          
  14f8  AD9FFD20       JSR [0xfd20]                      
  14fc  108E0358       LDY #0x358                        
  1500  CC0001         LDD #0x1                          
  1503  AD9FFD2E       JSR [0xfd2e]                      
  1507  CC000A         LDD #0xa                          
  150a  AD9FFD20       JSR [0xfd20]                      
  150e  108E0359       LDY #0x359                        
  1512  CC0001         LDD #0x1                          
  1515  AD9FFD2E       JSR [0xfd2e]                      
  1519  CC000A         LDD #0xa                          
  151c  AD9FFD20       JSR [0xfd20]                      
  1520  108E035B       LDY #0x35b                        
  1524  CC0001         LDD #0x1                          
  1527  AD9FFD2E       JSR [0xfd2e]                      
  152b  205A           BRA 0x1587                        
LAB_M78_r3_24000__152d:
  152d  CC000A         LDD #0xa                          
  1530  AD9FFD20       JSR [0xfd20]                      
  1534  108E0158       LDY #0x158                        
  1538  CC0001         LDD #0x1                          
  153b  AD9FFD2E       JSR [0xfd2e]                      
  153f  CC000A         LDD #0xa                          
  1542  AD9FFD20       JSR [0xfd20]                      
  1546  108E0259       LDY #0x259                        
  154a  CC0001         LDD #0x1                          
  154d  AD9FFD2E       JSR [0xfd2e]                      
  1551  CC000A         LDD #0xa                          
  1554  AD9FFD20       JSR [0xfd20]                      
  1558  108E0258       LDY #0x258                        
  155c  CC0000         LDD #0x0                          
  155f  AD9FFD2E       JSR [0xfd2e]                      
  1563  CC000A         LDD #0xa                          
  1566  AD9FFD20       JSR [0xfd20]                      
  156a  108E0159       LDY #0x159                        
  156e  CC0000         LDD #0x0                          
  1571  AD9FFD2E       JSR [0xfd2e]                      
  1575  CC000A         LDD #0xa                          
  1578  AD9FFD20       JSR [0xfd20]                      
  157c  108E035B       LDY #0x35b                        
  1580  CC0001         LDD #0x1                          
  1583  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__1587:
  1587  3576           PULS  A B X Y U                   
  1589  39             RTS                               
  158a  .db 61 75 64 69 6F 20 74 72 69 67 67 65 72 69 6E 67  ; audio triggering
  159a  .db 20 6F 66 66 20 20 20 20 61 75 64 69 6F 20 74 72  ;  off    audio tr
  15aa  .db 69 67 67 65 72 69 6E 67 20 6F 6E 20 20 20 20 20  ; iggering on     
PTR_FUN_M78_r3_24000__1650_M78_r3_24000__15ba:
  15ba  1650           addr M78_r3_24000::1650           
  15bc  1641           addr M78_r3_24000::1641           
  15be  .db 16 1D 70 A4 70 A6 00 00 70 A8 72 84 73 1D 0C 00  ; ..p.p...p.r.s...
  15ce  .db 00 00 02 00 01 00 18 10 15 E0 00 00 16 C1 70 AA  ; ..............p.
  15de  .db 73 1F 04 6D 69 64 69 20 6D 6F 64 65 3A 20 20 20  ; s..midi mode:   
  15ee  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  15fe  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M78_r3_24000__1605
FUN_M78_r3_24000__1605:
  1605  3410           PSHS  X                           
  1607  8E15BA         LDX #0x15ba                        ; desc[API_FDBC]: ->$1650 ->$1641
  160a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  160e  3510           PULS  X                           
  1610  39             RTS                               

; ---- function FUN_M78_r3_24000__1611
FUN_M78_r3_24000__1611:
  1611  3410           PSHS  X                           
  1613  8E15BA         LDX #0x15ba                       
  1616  AD9FFC4E       JSR [0xfc4e]                      
  161a  3510           PULS  X                           
  161c  39             RTS                               

; ---- function FUN_M78_r3_24000__161d
FUN_M78_r3_24000__161d:
  161d  3410           PSHS  X                           
  161f  8E15BA         LDX #0x15ba                        ; desc[API_FE6C]: ->$1650 ->$1641
  1622  AD9FFE6C       JSR [0xfe6c]                      
  1626  3510           PULS  X                           
  1628  39             RTS                               

; ---- function FUN_M78_r3_24000__1629
FUN_M78_r3_24000__1629:
  1629  3410           PSHS  X                           
  162b  8E15BA         LDX #0x15ba                        ; desc[API_FE1C]: ->$1650 ->$1641
  162e  AD9FFE1C       JSR [0xfe1c]                      
  1632  3510           PULS  X                           
  1634  39             RTS                               

; ---- function FUN_M78_r3_24000__1635
FUN_M78_r3_24000__1635:
  1635  3410           PSHS  X                           
  1637  8E15BA         LDX #0x15ba                        ; desc[API_FE1A]: ->$1650 ->$1641 $161D
  163a  AD9FFE1A       JSR [0xfe1a]                      
  163e  3510           PULS  X                           
  1640  39             RTS                               

; ---- function FUN_M78_r3_24000__1641
FUN_M78_r3_24000__1641:
  1641  3410           PSHS  X                           
  1643  8E15BA         LDX #0x15ba                       
  1646  AD9FFC52       JSR [0xfc52]                      
  164a  17F1E9         LBSR 0x0836                       
  164d  3510           PULS  X                           
  164f  39             RTS                               

; ---- function FUN_M78_r3_24000__1650
FUN_M78_r3_24000__1650:
  1650  3476           PSHS  U Y X B A                   
  1652  8E15BA         LDX #0x15ba                       
  1655  AD9FFE76       JSR [0xfe76]                      
  1659  FC70A8         LDD 0x70a8                        
  165c  10830000       CMPD #0x0                         
  1660  2726           BEQ 0x1688                        
  1662  CC1FC0         LDD #0x1fc0                       
  1665  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B01
  1669  6B01           addr 6b01                         
LAB_M78_r3_24000__166b:
  166b  CC0941         LDD #0x941                        
  166e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  1672  6B03           addr 6b03                         
LAB_M78_r3_24000__1674:
  1674  FC7090         LDD 0x7090                        
  1677  2623           BNE 0x169c                        
  1679  FC70A8         LDD 0x70a8                        
  167c  10830001       CMPD #0x1                         
  1680  271A           BEQ 0x169c                        
  1682  10830002       CMPD #0x2                         
  1686  2728           BEQ 0x16b0                        
LAB_M78_r3_24000__1688:
  1688  CC0941         LDD #0x941                        
  168b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B01
  168f  6B01           addr 6b01                         
LAB_M78_r3_24000__1691:
  1691  CC0941         LDD #0x941                        
  1694  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  1698  6B03           addr 6b03                         
LAB_M78_r3_24000__169a:
  169a  2022           BRA 0x16be                        
LAB_M78_r3_24000__169c:
  169c  CC2587         LDD #0x2587                       
  169f  FD7144         STD 0x7144                        
  16a2  CC263D         LDD #0x263d                       
  16a5  FD7146         STD 0x7146                        
  16a8  CC0001         LDD #0x1                          
  16ab  FD70A8         STD 0x70a8                        
  16ae  200E           BRA 0x16be                        
LAB_M78_r3_24000__16b0:
  16b0  CC252A         LDD #0x252a                       
  16b3  FD7144         STD 0x7144                        
  16b6  CC2563         LDD #0x2563                       
  16b9  FD7146         STD 0x7146                        
  16bc  2000           BRA 0x16be                        
LAB_M78_r3_24000__16be:
  16be  3576           PULS  A B X Y U                   
  16c0  39             RTS                               
  16c1  .db 4D 49 44 49 20 63 6F 6E 74 72 6F 6C 20 6F 66 66  ; MIDI control off
  16d1  .db 20 20 20 20 20 20 20 20 6B 65 79 62 6F 61 72 64  ;         keyboard
  16e1  .db 20 73 70 6C 69 74 20 20 20 20 20 20 20 20 20 20  ;  split          
  16f1  .db 6C 61 79 65 72 65 64 20 76 6F 69 63 65 73 20 20  ; layered voices  
  1701  .db 20 20 20 20 20 20 20 20                          ;         
PTR_FUN_M78_r3_24000__179c_M78_r3_24000__1709:
  1709  179C           addr M78_r3_24000::179c           
  170b  1753           addr M78_r3_24000::1753           
  170d  .db 17 47 70 84 70 86 00 00 70 88 72 84 73 21 12 00  ; .Gp.p...p.r.s!..
  171d  .db 00 00 01 00 01 00 18 10 17 77 00 00 17 AE 70 8A  ; .........w....p.
  172d  .db 73 23                                            ; s#

; ---- function FUN_M78_r3_24000__172f
FUN_M78_r3_24000__172f:
  172f  3410           PSHS  X                           
  1731  8E1709         LDX #0x1709                       
  1734  AD9FFC4E       JSR [0xfc4e]                      
  1738  3510           PULS  X                           
  173a  39             RTS                               

; ---- function FUN_M78_r3_24000__173b
FUN_M78_r3_24000__173b:
  173b  3410           PSHS  X                           
  173d  8E1709         LDX #0x1709                        ; desc[API_FDBC]: ->$179C ->$1753
  1740  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1744  3510           PULS  X                           
  1746  39             RTS                               

; ---- function FUN_M78_r3_24000__1747
FUN_M78_r3_24000__1747:
  1747  3410           PSHS  X                           
  1749  8E1709         LDX #0x1709                        ; desc[API_FE6C]: ->$179C ->$1753
  174c  AD9FFE6C       JSR [0xfe6c]                      
  1750  3510           PULS  X                           
  1752  39             RTS                               

; ---- function FUN_M78_r3_24000__1753
FUN_M78_r3_24000__1753:
  1753  3410           PSHS  X                           
  1755  8E1709         LDX #0x1709                       
  1758  AD9FFC52       JSR [0xfc52]                      
  175c  3510           PULS  X                           
  175e  39             RTS                               

; ---- function FUN_M78_r3_24000__175f
FUN_M78_r3_24000__175f:
  175f  3410           PSHS  X                           
  1761  8E1709         LDX #0x1709                        ; desc[API_FE1C]: ->$179C ->$1753
  1764  AD9FFE1C       JSR [0xfe1c]                      
  1768  3510           PULS  X                           
  176a  39             RTS                               

; ---- function FUN_M78_r3_24000__176b
FUN_M78_r3_24000__176b:
  176b  3410           PSHS  X                           
  176d  8E1709         LDX #0x1709                        ; desc[API_FE1A]: ->$179C ->$1753 $1747
  1770  AD9FFE1A       JSR [0xfe1a]                      
  1774  3510           PULS  X                           
  1776  39             RTS                               
  1777  .db 04 73 68 69 66 74 20 6D 6F 64 65 3A 20 20 20 20  ; .shift mode:    
  1787  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1797  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M78_r3_24000__179c
FUN_M78_r3_24000__179c:
  179c  3476           PSHS  U Y X B A                   
  179e  8E1709         LDX #0x1709                       
  17a1  AD9FFE76       JSR [0xfe76]                      
  17a5  17F988         LBSR 0x1130                       
  17a8  17FB25         LBSR 0x12d0                       
  17ab  3576           PULS  A B X Y U                   
  17ad  39             RTS                               
  17ae  .db 63 6F 6E 73 74 61 6E 74 20 6C 65 6E 67 74 68 20  ; constant length 
  17be  .db 73 61 6D 70 6C 65 73 20 67 65 6E 65 72 69 63 20  ; samples generic 
  17ce  .db 73 61 6D 70 6C 65 72 20 6D 6F 64 65 20 20 20 20  ; sampler mode    
PTR_FUN_M78_r3_24000__1871_M78_r3_24000__17de:
  17de  1871           addr M78_r3_24000::1871           
  17e0  1828           addr M78_r3_24000::1828           
  17e2  .db 18 1C 70 8C 70 8E 00 00 70 90 72 84 73 25 13 00  ; ..p.p...p.r.s%..
  17f2  .db 00 00 01 00 01 00 18 10 18 4C 00 00 19 A2 70 92  ; .........L....p.
  1802  .db 73 27                                            ; s'

; ---- function FUN_M78_r3_24000__1804
FUN_M78_r3_24000__1804:
  1804  3410           PSHS  X                           
  1806  8E17DE         LDX #0x17de                       
  1809  AD9FFC4E       JSR [0xfc4e]                      
  180d  3510           PULS  X                           
  180f  39             RTS                               

; ---- function FUN_M78_r3_24000__1810
FUN_M78_r3_24000__1810:
  1810  3410           PSHS  X                           
  1812  8E17DE         LDX #0x17de                        ; desc[API_FDBC]: ->$1871 ->$1828
  1815  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1819  3510           PULS  X                           
  181b  39             RTS                               

; ---- function FUN_M78_r3_24000__181c
FUN_M78_r3_24000__181c:
  181c  3410           PSHS  X                           
  181e  8E17DE         LDX #0x17de                        ; desc[API_FE6C]: ->$1871 ->$1828
  1821  AD9FFE6C       JSR [0xfe6c]                      
  1825  3510           PULS  X                           
  1827  39             RTS                               

; ---- function FUN_M78_r3_24000__1828
FUN_M78_r3_24000__1828:
  1828  3410           PSHS  X                           
  182a  8E17DE         LDX #0x17de                       
  182d  AD9FFC52       JSR [0xfc52]                      
  1831  3510           PULS  X                           
  1833  39             RTS                               

; ---- function FUN_M78_r3_24000__1834
FUN_M78_r3_24000__1834:
  1834  3410           PSHS  X                           
  1836  8E17DE         LDX #0x17de                        ; desc[API_FE1C]: ->$1871 ->$1828
  1839  AD9FFE1C       JSR [0xfe1c]                      
  183d  3510           PULS  X                           
  183f  39             RTS                               

; ---- function FUN_M78_r3_24000__1840
FUN_M78_r3_24000__1840:
  1840  3410           PSHS  X                           
  1842  8E17DE         LDX #0x17de                        ; desc[API_FE1A]: ->$1871 ->$1828 $181C
  1845  AD9FFE1A       JSR [0xfe1a]                      
  1849  3510           PULS  X                           
  184b  39             RTS                               
  184c  .db 04 72 65 63 6F 72 64 20 6D 6F 64 65 3A 20 20 20  ; .record mode:   
  185c  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  186c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M78_r3_24000__1871
FUN_M78_r3_24000__1871:
  1871  3476           PSHS  U Y X B A                   
  1873  8E17DE         LDX #0x17de                       
  1876  AD9FFE76       JSR [0xfe76]                      
  187a  FC7090         LDD 0x7090                        
  187d  10830000       CMPD #0x0                         
  1881  102700A8       LBEQ 0x192d                       
  1885  FC714A         LDD 0x714a                        
  1888  47             ASRA                              
  1889  56             RORB                              
  188a  FD714E         STD 0x714e                        
  188d  FC714C         LDD 0x714c                        
  1890  47             ASRA                              
  1891  56             RORB                              
  1892  FD7150         STD 0x7150                        
  1895  CC000A         LDD #0xa                          
  1898  AD9FFD20       JSR [0xfd20]                      
  189c  108E0160       LDY #0x160                        
  18a0  CC0000         LDD #0x0                          
  18a3  AD9FFD2E       JSR [0xfd2e]                      
  18a7  CC000A         LDD #0xa                          
  18aa  AD9FFD20       JSR [0xfd20]                      
  18ae  108E0161       LDY #0x161                        
  18b2  CC0000         LDD #0x0                          
  18b5  AD9FFD2E       JSR [0xfd2e]                      
  18b9  CC000A         LDD #0xa                          
  18bc  AD9FFD20       JSR [0xfd20]                      
  18c0  108E0162       LDY #0x162                        
  18c4  FC714E         LDD 0x714e                        
  18c7  AD9FFD2E       JSR [0xfd2e]                      
  18cb  CC000A         LDD #0xa                          
  18ce  AD9FFD20       JSR [0xfd20]                      
  18d2  108E0163       LDY #0x163                        
  18d6  FC7150         LDD 0x7150                        
  18d9  AD9FFD2E       JSR [0xfd2e]                      
  18dd  CC000A         LDD #0xa                          
  18e0  AD9FFD20       JSR [0xfd20]                      
  18e4  108E0260       LDY #0x260                        
  18e8  FC7152         LDD 0x7152                        
  18eb  AD9FFD2E       JSR [0xfd2e]                      
  18ef  CC000A         LDD #0xa                          
  18f2  AD9FFD20       JSR [0xfd20]                      
  18f6  108E0261       LDY #0x261                        
  18fa  FC7154         LDD 0x7154                        
  18fd  AD9FFD2E       JSR [0xfd2e]                      
  1901  CC000A         LDD #0xa                          
  1904  AD9FFD20       JSR [0xfd20]                      
  1908  108E0262       LDY #0x262                        
  190c  FC714A         LDD 0x714a                        
  190f  AD9FFD2E       JSR [0xfd2e]                      
  1913  CC000A         LDD #0xa                          
  1916  AD9FFD20       JSR [0xfd20]                      
  191a  108E0263       LDY #0x263                        
  191e  FC714C         LDD 0x714c                        
  1921  AD9FFD2E       JSR [0xfd2e]                      
  1925  CC0001         LDD #0x1                          
  1928  FD7174         STD 0x7174                        
  192b  205C           BRA 0x1989                        
LAB_M78_r3_24000__192d:
  192d  FC714A         LDD 0x714a                        
  1930  FD714E         STD 0x714e                        
  1933  FC714C         LDD 0x714c                        
  1936  FD7150         STD 0x7150                        
  1939  CC000A         LDD #0xa                          
  193c  AD9FFD20       JSR [0xfd20]                      
  1940  108E0360       LDY #0x360                        
  1944  CC0000         LDD #0x0                          
  1947  AD9FFD2E       JSR [0xfd2e]                      
  194b  CC000A         LDD #0xa                          
  194e  AD9FFD20       JSR [0xfd20]                      
  1952  108E0361       LDY #0x361                        
  1956  CC0000         LDD #0x0                          
  1959  AD9FFD2E       JSR [0xfd2e]                      
  195d  CC000A         LDD #0xa                          
  1960  AD9FFD20       JSR [0xfd20]                      
  1964  108E0362       LDY #0x362                        
  1968  FC714E         LDD 0x714e                        
  196b  AD9FFD2E       JSR [0xfd2e]                      
  196f  CC000A         LDD #0xa                          
  1972  AD9FFD20       JSR [0xfd20]                      
  1976  108E0363       LDY #0x363                        
  197a  FC7150         LDD 0x7150                        
  197d  AD9FFD2E       JSR [0xfd2e]                      
  1981  CC0000         LDD #0x0                          
  1984  FD7174         STD 0x7174                        
  1987  2000           BRA 0x1989                        
LAB_M78_r3_24000__1989:
  1989  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  198d  0038           dw 38h                            
  198f  7188           dw 7188h                          
LAB_M78_r3_24000__1991:
  1991  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  1995  003A           dw 3Ah                            
  1997  7188           dw 7188h                          
LAB_M78_r3_24000__1999:
  1999  17FAF6         LBSR 0x1492                       
  199c  17FCB1         LBSR 0x1650                       
  199f  3576           PULS  A B X Y U                   
  19a1  39             RTS                               
  19a2  .db 6D 6F 6E 6F 70 68 6F 6E 69 63 20 72 65 63 6F 72  ; monophonic recor
  19b2  .db 64 69 6E 67 20 20 20 20 73 74 65 72 65 6F 70 68  ; ding    stereoph
  19c2  .db 6F 6E 69 63 20 72 65 63 6F 72 64 69 6E 67 20 20  ; onic recording  
PTR_FUN_M78_r3_24000__1a36_M78_r3_24000__19d2:
  19d2  1A36           addr M78_r3_24000::1a36           
  19d4  1A35           addr M78_r3_24000::1a35           
  19d6  .db 1A 06 70 C4 70 C6 00 00 70 C8 72 84 73 01 14 00  ; ..p.p...p.r.s...
  19e6  .db 00 00 27 00 01 00 02 24 19 F8 00 00 00 00 70 CA  ; ..'....$......p.
  19f6  .db 73 03 00 20                                      ; s.. 

; ---- function FUN_M78_r3_24000__19fa
FUN_M78_r3_24000__19fa:
  19fa  3410           PSHS  X                           
  19fc  8E19D2         LDX #0x19d2                        ; desc[API_FDBC]: ->$1A36 ->$1A35
  19ff  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1a03  3510           PULS  X                           
  1a05  39             RTS                               

; ---- function FUN_M78_r3_24000__1a06
FUN_M78_r3_24000__1a06:
  1a06  3410           PSHS  X                           
  1a08  8E19D2         LDX #0x19d2                        ; desc[API_FE6C]: ->$1A36 ->$1A35
  1a0b  AD9FFE6C       JSR [0xfe6c]                      
  1a0f  3510           PULS  X                           
  1a11  39             RTS                               

; ---- function FUN_M78_r3_24000__1a12
FUN_M78_r3_24000__1a12:
  1a12  3410           PSHS  X                           
  1a14  8E19D2         LDX #0x19d2                        ; desc[API_FE1C]: ->$1A36 ->$1A35
  1a17  AD9FFE1C       JSR [0xfe1c]                      
  1a1b  3510           PULS  X                           
  1a1d  39             RTS                               

; ---- function FUN_M78_r3_24000__1a1e
FUN_M78_r3_24000__1a1e:
  1a1e  3410           PSHS  X                           
  1a20  8E19D2         LDX #0x19d2                        ; desc[API_FE1A]: ->$1A36 ->$1A35 $1A06
  1a23  AD9FFE1A       JSR [0xfe1a]                      
  1a27  3510           PULS  X                           
  1a29  39             RTS                               

; ---- function FUN_M78_r3_24000__1a2a
FUN_M78_r3_24000__1a2a:
  1a2a  3476           PSHS  U Y X B A                   
  1a2c  8E19D2         LDX #0x19d2                       
  1a2f  17036E         LBSR 0x1da0                       
  1a32  3576           PULS  A B X Y U                   
  1a34  39             RTS                               

; ---- function FUN_M78_r3_24000__1a35
FUN_M78_r3_24000__1a35:
  1a35  39             RTS                               

; ---- function FUN_M78_r3_24000__1a36
FUN_M78_r3_24000__1a36:
  1a36  3476           PSHS  U Y X B A                   
  1a38  8E19D2         LDX #0x19d2                       
  1a3b  AD9FFE76       JSR [0xfe76]                      
  1a3f  FC70C8         LDD 0x70c8                        
  1a42  3606           PSHU  B A                         
  1a44  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001C $7188
  1a48  001C           dw 1Ch                            
  1a4a  7188           dw 7188h                          
LAB_M78_r3_24000__1a4c:
  1a4c  3706           PULU  A B                         
  1a4e  FD7110         STD 0x7110                        
  1a51  CC000A         LDD #0xa                          
  1a54  AD9FFD20       JSR [0xfd20]                      
  1a58  108E0356       LDY #0x356                        
  1a5c  FC7110         LDD 0x7110                        
  1a5f  AD9FFD2E       JSR [0xfd2e]                      
  1a63  3576           PULS  A B X Y U                   
  1a65  39             RTS                               
PTR_FUN_M78_r3_24000__1aee_M78_r3_24000__1a66:
  1a66  1AEE           addr M78_r3_24000::1aee           
  1a68  1AED           addr M78_r3_24000::1aed           
  1a6a  .db 1A C9 70 CC 70 CE 00 00 70 D0 72 84 73 05 0A 00  ; ..p.p...p.r.s...
  1a7a  .db 04 00 27 00 01 00 02 24 1A 8C 00 00 00 00 70 D2  ; ..'....$......p.
  1a8a  .db 73 07 04 70 6C 61 79 20 74 68 72 65 73 68 20 31  ; s..play thresh 1
  1a9a  .db 3A 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; :               
  1aaa  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M78_r3_24000__1ab1
FUN_M78_r3_24000__1ab1:
  1ab1  3410           PSHS  X                           
  1ab3  8E1A66         LDX #0x1a66                        ; desc[API_FDBC]: ->$1AEE ->$1AED
  1ab6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...f"
  1aba  3510           PULS  X                           
  1abc  39             RTS                               

; ---- function FUN_M78_r3_24000__1abd
FUN_M78_r3_24000__1abd:
  1abd  3410           PSHS  X                           
  1abf  8E1A66         LDX #0x1a66                        ; desc[API_FE6A]: ->$1AEE ->$1AED
  1ac2  AD9FFE6A       JSR [0xfe6a]                      
  1ac6  3510           PULS  X                           
  1ac8  39             RTS                               

; ---- function FUN_M78_r3_24000__1ac9
FUN_M78_r3_24000__1ac9:
  1ac9  3410           PSHS  X                           
  1acb  8E1A66         LDX #0x1a66                        ; desc[API_FE6C]: ->$1AEE ->$1AED
  1ace  AD9FFE6C       JSR [0xfe6c]                      
  1ad2  3510           PULS  X                           
  1ad4  39             RTS                               

; ---- function FUN_M78_r3_24000__1ad5
FUN_M78_r3_24000__1ad5:
  1ad5  3410           PSHS  X                           
  1ad7  8E1A66         LDX #0x1a66                        ; desc[API_FE1C]: ->$1AEE ->$1AED
  1ada  AD9FFE1C       JSR [0xfe1c]                      
  1ade  3510           PULS  X                           
  1ae0  39             RTS                               

; ---- function FUN_M78_r3_24000__1ae1
FUN_M78_r3_24000__1ae1:
  1ae1  3410           PSHS  X                           
  1ae3  8E1A66         LDX #0x1a66                        ; desc[API_FE1A]: ->$1AEE ->$1AED $1AC9
  1ae6  AD9FFE1A       JSR [0xfe1a]                      
  1aea  3510           PULS  X                           
  1aec  39             RTS                               

; ---- function FUN_M78_r3_24000__1aed
FUN_M78_r3_24000__1aed:
  1aed  39             RTS                               

; ---- function FUN_M78_r3_24000__1aee
FUN_M78_r3_24000__1aee:
  1aee  3476           PSHS  U Y X B A                   
  1af0  8E1A66         LDX #0x1a66                       
  1af3  AD9FFE76       JSR [0xfe76]                      
  1af7  FC70D0         LDD 0x70d0                        
  1afa  3606           PSHU  B A                         
  1afc  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001C $7188
  1b00  001C           dw 1Ch                            
  1b02  7188           dw 7188h                          
LAB_M78_r3_24000__1b04:
  1b04  3706           PULU  A B                         
  1b06  FD7110         STD 0x7110                        
  1b09  FC70D0         LDD 0x70d0                        
  1b0c  830004         SUBD #0x4                         
  1b0f  3606           PSHU  B A                         
  1b11  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001C $7188
  1b15  001C           dw 1Ch                            
  1b17  7188           dw 7188h                          
LAB_M78_r3_24000__1b19:
  1b19  3706           PULU  A B                         
  1b1b  FD7112         STD 0x7112                        
  1b1e  CC000A         LDD #0xa                          
  1b21  AD9FFD20       JSR [0xfd20]                      
  1b25  108E015D       LDY #0x15d                        
  1b29  FC7110         LDD 0x7110                        
  1b2c  AD9FFD2E       JSR [0xfd2e]                      
  1b30  CC000A         LDD #0xa                          
  1b33  AD9FFD20       JSR [0xfd20]                      
  1b37  108E015E       LDY #0x15e                        
  1b3b  FC7112         LDD 0x7112                        
  1b3e  AD9FFD2E       JSR [0xfd2e]                      
  1b42  3576           PULS  A B X Y U                   
  1b44  39             RTS                               
PTR_FUN_M78_r3_24000__1bcd_M78_r3_24000__1b45:
  1b45  1BCD           addr M78_r3_24000::1bcd           
  1b47  1BCC           addr M78_r3_24000::1bcc           
  1b49  .db 1B A8 70 D4 70 D6 00 00 70 D8 72 84 73 09 0B 00  ; ..p.p...p.r.s...
  1b59  .db 04 00 27 00 01 00 02 24 1B 6B 00 00 00 00 70 DA  ; ..'....$.k....p.
  1b69  .db 73 0B 04 70 6C 61 79 20 74 68 72 65 73 68 20 32  ; s..play thresh 2
  1b79  .db 3A 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; :               
  1b89  .db 20 20 20 20 20 20 20                             ;        

; ---- function FUN_M78_r3_24000__1b90
FUN_M78_r3_24000__1b90:
  1b90  3410           PSHS  X                           
  1b92  8E1B45         LDX #0x1b45                        ; desc[API_FDBC]: ->$1BCD ->$1BCC
  1b95  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...E"
  1b99  3510           PULS  X                           
  1b9b  39             RTS                               

; ---- function FUN_M78_r3_24000__1b9c
FUN_M78_r3_24000__1b9c:
  1b9c  3410           PSHS  X                           
  1b9e  8E1B45         LDX #0x1b45                        ; desc[API_FE6A]: ->$1BCD ->$1BCC
  1ba1  AD9FFE6A       JSR [0xfe6a]                      
  1ba5  3510           PULS  X                           
  1ba7  39             RTS                               

; ---- function FUN_M78_r3_24000__1ba8
FUN_M78_r3_24000__1ba8:
  1ba8  3410           PSHS  X                           
  1baa  8E1B45         LDX #0x1b45                        ; desc[API_FE6C]: ->$1BCD ->$1BCC
  1bad  AD9FFE6C       JSR [0xfe6c]                      
  1bb1  3510           PULS  X                           
  1bb3  39             RTS                               

; ---- function FUN_M78_r3_24000__1bb4
FUN_M78_r3_24000__1bb4:
  1bb4  3410           PSHS  X                           
  1bb6  8E1B45         LDX #0x1b45                        ; desc[API_FE1C]: ->$1BCD ->$1BCC
  1bb9  AD9FFE1C       JSR [0xfe1c]                      
  1bbd  3510           PULS  X                           
  1bbf  39             RTS                               

; ---- function FUN_M78_r3_24000__1bc0
FUN_M78_r3_24000__1bc0:
  1bc0  3410           PSHS  X                           
  1bc2  8E1B45         LDX #0x1b45                        ; desc[API_FE1A]: ->$1BCD ->$1BCC $1BA8
  1bc5  AD9FFE1A       JSR [0xfe1a]                      
  1bc9  3510           PULS  X                           
  1bcb  39             RTS                               

; ---- function FUN_M78_r3_24000__1bcc
FUN_M78_r3_24000__1bcc:
  1bcc  39             RTS                               

; ---- function FUN_M78_r3_24000__1bcd
FUN_M78_r3_24000__1bcd:
  1bcd  3476           PSHS  U Y X B A                   
  1bcf  8E1B45         LDX #0x1b45                       
  1bd2  AD9FFE76       JSR [0xfe76]                      
  1bd6  FC70D8         LDD 0x70d8                        
  1bd9  3606           PSHU  B A                         
  1bdb  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001C $7188
  1bdf  001C           dw 1Ch                            
  1be1  7188           dw 7188h                          
LAB_M78_r3_24000__1be3:
  1be3  3706           PULU  A B                         
  1be5  FD7110         STD 0x7110                        
  1be8  FC70D8         LDD 0x70d8                        
  1beb  830004         SUBD #0x4                         
  1bee  3606           PSHU  B A                         
  1bf0  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001C $7188
  1bf4  001C           dw 1Ch                            
  1bf6  7188           dw 7188h                          
LAB_M78_r3_24000__1bf8:
  1bf8  3706           PULU  A B                         
  1bfa  FD7112         STD 0x7112                        
  1bfd  CC000A         LDD #0xa                          
  1c00  AD9FFD20       JSR [0xfd20]                      
  1c04  108E025D       LDY #0x25d                        
  1c08  FC7110         LDD 0x7110                        
  1c0b  AD9FFD2E       JSR [0xfd2e]                      
  1c0f  CC000A         LDD #0xa                          
  1c12  AD9FFD20       JSR [0xfd20]                      
  1c16  108E025E       LDY #0x25e                        
  1c1a  FC7112         LDD 0x7112                        
  1c1d  AD9FFD2E       JSR [0xfd2e]                      
  1c21  3576           PULS  A B X Y U                   
  1c23  39             RTS                               

; ---- function FUN_M78_r3_24000__1c24
FUN_M78_r3_24000__1c24:
  1c24  3476           PSHS  U Y X B A                   
  1c26  17FE94         LBSR 0x1abd                       
  1c29  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002E $7188
  1c2d  002E           dw 2Eh                            
  1c2f  7188           dw 7188h                          
LAB_M78_r3_24000__1c31:
  1c31  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0030 $7188
  1c35  0030           dw 30h                            
  1c37  7188           dw 7188h                          
LAB_M78_r3_24000__1c39:
  1c39  CC1C45         LDD #0x1c45                       
  1c3c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $7250
  1c40  7250           addr 7250                         
LAB_M78_r3_24000__1c42:
  1c42  3576           PULS  A B X Y U                   
  1c44  39             RTS                               

; ---- function FUN_M78_r3_24000__1c45
FUN_M78_r3_24000__1c45:
  1c45  3476           PSHS  U Y X B A                   
  1c47  FC6070         LDD 0x6070                        
  1c4a  B3600D         SUBD 0x600d                       
  1c4d  10831AED       CMPD #0x1aed                      
  1c51  2649           BNE 0x1c9c                        
  1c53  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  1c57  0014           dw 14h                            
  1c59  7188           dw 7188h                          
LAB_M78_r3_24000__1c5b:
  1c5b  AD9FFD3A       JSR [0xfd3a]                      
  1c5f  3606           PSHU  B A                         
  1c61  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0028 $7188
  1c65  0028           dw 28h                            
  1c67  7188           dw 7188h                          
LAB_M78_r3_24000__1c69:
  1c69  3706           PULU  A B                         
  1c6b  3606           PSHU  B A                         
  1c6d  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001E $7188
  1c71  001E           dw 1Eh                            
  1c73  7188           dw 7188h                          
LAB_M78_r3_24000__1c75:
  1c75  3606           PSHU  B A                         
  1c77  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0020 $7188
  1c7b  0020           dw 20h                            
  1c7d  7188           dw 7188h                          
LAB_M78_r3_24000__1c7f:
  1c7f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0022 $7188
  1c83  0022           dw 22h                            
  1c85  7188           dw 7188h                          
LAB_M78_r3_24000__1c87:
  1c87  FC70D0         LDD 0x70d0                        
  1c8a  3606           PSHU  B A                         
  1c8c  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0024 $7188
  1c90  0024           dw 24h                            
  1c92  7188           dw 7188h                          
LAB_M78_r3_24000__1c94:
  1c94  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0026 $7188
  1c98  0026           dw 26h                            
  1c9a  7188           dw 7188h                          
LAB_M78_r3_24000__1c9c:
  1c9c  3576           PULS  A B X Y U                   
  1c9e  39             RTS                               

; ---- function FUN_M78_r3_24000__1c9f
FUN_M78_r3_24000__1c9f:
  1c9f  3476           PSHS  U Y X B A                   
  1ca1  17FEF8         LBSR 0x1b9c                       
  1ca4  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002E $7188
  1ca8  002E           dw 2Eh                            
  1caa  7188           dw 7188h                          
LAB_M78_r3_24000__1cac:
  1cac  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0030 $7188
  1cb0  0030           dw 30h                            
  1cb2  7188           dw 7188h                          
LAB_M78_r3_24000__1cb4:
  1cb4  CC1CC0         LDD #0x1cc0                       
  1cb7  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $7250
  1cbb  7250           addr 7250                         
LAB_M78_r3_24000__1cbd:
  1cbd  3576           PULS  A B X Y U                   
  1cbf  39             RTS                               

; ---- function FUN_M78_r3_24000__1cc0
FUN_M78_r3_24000__1cc0:
  1cc0  3476           PSHS  U Y X B A                   
  1cc2  FC6070         LDD 0x6070                        
  1cc5  B3600D         SUBD 0x600d                       
  1cc8  10831BCC       CMPD #0x1bcc                      
  1ccc  2649           BNE 0x1d17                        
  1cce  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0016 $7188
  1cd2  0016           dw 16h                            
  1cd4  7188           dw 7188h                          
LAB_M78_r3_24000__1cd6:
  1cd6  AD9FFD3A       JSR [0xfd3a]                      
  1cda  3606           PSHU  B A                         
  1cdc  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0028 $7188
  1ce0  0028           dw 28h                            
  1ce2  7188           dw 7188h                          
LAB_M78_r3_24000__1ce4:
  1ce4  3706           PULU  A B                         
  1ce6  3606           PSHU  B A                         
  1ce8  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001E $7188
  1cec  001E           dw 1Eh                            
  1cee  7188           dw 7188h                          
LAB_M78_r3_24000__1cf0:
  1cf0  3606           PSHU  B A                         
  1cf2  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0020 $7188
  1cf6  0020           dw 20h                            
  1cf8  7188           dw 7188h                          
LAB_M78_r3_24000__1cfa:
  1cfa  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0022 $7188
  1cfe  0022           dw 22h                            
  1d00  7188           dw 7188h                          
LAB_M78_r3_24000__1d02:
  1d02  FC70D8         LDD 0x70d8                        
  1d05  3606           PSHU  B A                         
  1d07  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0024 $7188
  1d0b  0024           dw 24h                            
  1d0d  7188           dw 7188h                          
LAB_M78_r3_24000__1d0f:
  1d0f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0026 $7188
  1d13  0026           dw 26h                            
  1d15  7188           dw 7188h                          
LAB_M78_r3_24000__1d17:
  1d17  3576           PULS  A B X Y U                   
  1d19  39             RTS                               

; ---- function FUN_M78_r3_24000__1d1a
FUN_M78_r3_24000__1d1a:
  1d1a  3476           PSHS  U Y X B A                   
  1d1c  CC0941         LDD #0x941                        
  1d1f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $7250
  1d23  7250           addr 7250                         
LAB_M78_r3_24000__1d25:
  1d25  CC0941         LDD #0x941                        
  1d28  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1d2c  6070           addr 6070                         
LAB_M78_r3_24000__1d2e:
  1d2e  CC0941         LDD #0x941                        
  1d31  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1d35  6072           addr 6072                         
LAB_M78_r3_24000__1d37:
  1d37  17E9DD         LBSR 0x0717                       
  1d3a  3576           PULS  A B X Y U                   
  1d3c  39             RTS                               
PTR_FUN_M78_r3_24000__1e04_M78_r3_24000__1d3d:
  1d3d  1E04           addr M78_r3_24000::1e04           
  1d3f  1E03           addr M78_r3_24000::1e03           
  1d41  .db 1D 6F 70 DC 70 DE 00 00 70 E0 72 84 72 FD 19 80  ; .op.p...p.r.r...
  1d51  .db 01 7F FF 00 01 00 01 27 1D 93 00 00 00 00 70 E2  ; .......'......p.
  1d61  .db 72 FF                                            ; r.

; ---- function FUN_M78_r3_24000__1d63
FUN_M78_r3_24000__1d63:
  1d63  3410           PSHS  X                           
  1d65  8E1D3D         LDX #0x1d3d                        ; desc[API_FDBC]: ->$1E04 ->$1E03
  1d68  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...="
  1d6c  3510           PULS  X                           
  1d6e  39             RTS                               

; ---- function FUN_M78_r3_24000__1d6f
FUN_M78_r3_24000__1d6f:
  1d6f  3410           PSHS  X                           
  1d71  8E1D3D         LDX #0x1d3d                        ; desc[API_FE6C]: ->$1E04 ->$1E03
  1d74  AD9FFE6C       JSR [0xfe6c]                      
  1d78  3510           PULS  X                           
  1d7a  39             RTS                               

; ---- function FUN_M78_r3_24000__1d7b
FUN_M78_r3_24000__1d7b:
  1d7b  3410           PSHS  X                           
  1d7d  8E1D3D         LDX #0x1d3d                        ; desc[API_FE1C]: ->$1E04 ->$1E03
  1d80  AD9FFE1C       JSR [0xfe1c]                      
  1d84  3510           PULS  X                           
  1d86  39             RTS                               

; ---- function FUN_M78_r3_24000__1d87
FUN_M78_r3_24000__1d87:
  1d87  3410           PSHS  X                           
  1d89  8E1D3D         LDX #0x1d3d                        ; desc[API_FE1A]: ->$1E04 ->$1E03 $1D6F
  1d8c  AD9FFE1A       JSR [0xfe1a]                      
  1d90  3510           PULS  X                           
  1d92  39             RTS                               
  1d93  .db 01 20                                            ; . 

; ---- function FUN_M78_r3_24000__1d95
FUN_M78_r3_24000__1d95:
  1d95  3476           PSHS  U Y X B A                   
  1d97  8E1D3D         LDX #0x1d3d                       
  1d9a  170003         LBSR 0x1da0                       
  1d9d  3576           PULS  A B X Y U                   
  1d9f  39             RTS                               

; ---- function FUN_M78_r3_24000__1da0
FUN_M78_r3_24000__1da0:
  1da0  3476           PSHS  U Y X B A                   
  1da2  FC600D         LDD 0x600d                        
  1da5  308B           LEAX D,X                          
  1da7  EC980C         LDD [0xc,X]                       
  1daa  FD6074         STD 0x6074                        
  1dad  CC0001         LDD #0x1                          
  1db0  F76066         STB 0x6066                        
  1db3  F76068         STB 0x6068                        
  1db6  FD60E0         STD 0x60e0                        
  1db9  F76067         STB 0x6067                        
  1dbc  CC0002         LDD #0x2                          
  1dbf  F76058         STB 0x6058                        
  1dc2  EC8813         LDD 0x13,X                        
  1dc5  FD606E         STD 0x606e                        
  1dc8  EC8815         LDD 0x15,X                        
  1dcb  FD606C         STD 0x606c                        
  1dce  EC8817         LDD 0x17,X                        
  1dd1  FD60DC         STD 0x60dc                        
  1dd4  FD60DE         STD 0x60de                        
  1dd7  E68819         LDB 0x19,X                        
  1dda  F76099         STB 0x6099                        
  1ddd  E6881A         LDB 0x1a,X                        
  1de0  F76069         STB 0x6069                        
  1de3  EC02           LDD 0x2,X                         
  1de5  F3600D         ADDD 0x600d                       
  1de8  FD6070         STD 0x6070                        
  1deb  EC04           LDD 0x4,X                         
  1ded  F3600D         ADDD 0x600d                       
  1df0  FD6072         STD 0x6072                        
  1df3  AD9FFC14       JSR [0xfc14]                      
  1df7  EC02           LDD 0x2,X                         
  1df9  F3600D         ADDD 0x600d                       
  1dfc  1F02           TFR D,Y                           
  1dfe  ADA4           JSR ,Y                            
  1e00  3576           PULS  A B X Y U                   
  1e02  39             RTS                               

; ---- function FUN_M78_r3_24000__1e03
FUN_M78_r3_24000__1e03:
  1e03  39             RTS                               

; ---- function FUN_M78_r3_24000__1e04
FUN_M78_r3_24000__1e04:
  1e04  3476           PSHS  U Y X B A                   
  1e06  8E1D3D         LDX #0x1d3d                       
  1e09  AD9FFE76       JSR [0xfe76]                      
  1e0d  3576           PULS  A B X Y U                   
  1e0f  39             RTS                               

; ---- function FUN_M78_r3_24000__1e10
FUN_M78_r3_24000__1e10:
  1e10  3436           PSHS  Y X B A                     
  1e12  3706           PULU  A B                         
  1e14  3606           PSHU  B A                         
  1e16  3406           PSHS  B A                         
  1e18  CC0010         LDD #0x10                         
  1e1b  3606           PSHU  B A                         
  1e1d  AD9FFCEC       JSR [0xfcec]                      
  1e21  3506           PULS  A B                         
  1e23  3606           PSHU  B A                         
  1e25  CC3116         LDD #0x3116                       
  1e28  3606           PSHU  B A                         
  1e2a  AD9FFCF2       JSR [0xfcf2]                      
  1e2e  AD9FFCE2       JSR [0xfce2]                      
  1e32  3536           PULS  A B X Y                     
  1e34  39             RTS                               

; ---- function FUN_M78_r3_24000__1e35
FUN_M78_r3_24000__1e35:
  1e35  3476           PSHS  U Y X B A                   
  1e37  C600           LDB #0x0                          
  1e39  8E70EC         LDX #0x70ec                       
  1e3c  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000C $7188
  1e40  000C           dw Ch                             
  1e42  7188           dw 7188h                          
LAB_M78_r3_24000__1e44:
  1e44  3576           PULS  A B X Y U                   
  1e46  39             RTS                               

; ---- function FUN_M78_r3_24000__1e47
FUN_M78_r3_24000__1e47:
  1e47  3476           PSHS  U Y X B A                   
  1e49  C615           LDB #0x15                         
  1e4b  8E70F4         LDX #0x70f4                       
  1e4e  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000C $7188
  1e52  000C           dw Ch                             
  1e54  7188           dw 7188h                          
LAB_M78_r3_24000__1e56:
  1e56  3576           PULS  A B X Y U                   
  1e58  39             RTS                               

; ---- function FUN_M78_r3_24000__1e59
FUN_M78_r3_24000__1e59:
  1e59  3476           PSHS  U Y X B A                   
  1e5b  CC0001         LDD #0x1                          
  1e5e  FD7186         STD 0x7186                        
  1e61  CC7530         LDD #0x7530                       
  1e64  FD7110         STD 0x7110                        
LAB_M78_r3_24000__1e67:
  1e67  FC7110         LDD 0x7110                        
  1e6a  830001         SUBD #0x1                         
  1e6d  FD7110         STD 0x7110                        
  1e70  2F10           BLE 0x1e82                        
  1e72  FC600F         LDD 0x600f                        
  1e75  B3600D         SUBD 0x600d                       
  1e78  831EE7         SUBD #0x1ee7                      
  1e7b  26EA           BNE 0x1e67                        
  1e7d  170067         LBSR 0x1ee7                       
  1e80  2033           BRA 0x1eb5                        
LAB_M78_r3_24000__1e82:
  1e82  C600           LDB #0x0                          
  1e84  AD9FFC36       JSR [0xfc36]                      
  1e88  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "ERROR - NO RESPONSE FROM PROCESSOR #3   "
  1e8c  4552524F5220.. char[41] "ERROR - NO RESPONSE FROM PROCESSOR #3   "
LAB_M78_r3_24000__1eb5:
  1eb5  3576           PULS  A B X Y U                   
  1eb7  39             RTS                               

; ---- function FUN_M78_r3_24000__1eb8
FUN_M78_r3_24000__1eb8:
  1eb8  3436           PSHS  Y X B A                     
  1eba  3401           PSHS  CC                          
  1ebc  AD9FFC54       JSR [0xfc54]                      
  1ec0  FC7186         LDD 0x7186                        
  1ec3  2715           BEQ 0x1eda                        
  1ec5  CC1EE7         LDD #0x1ee7                       
  1ec8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1ecc  600F           addr 600f                         
LAB_M78_r3_24000__1ece:
  1ece  AD9FFC56       JSR [0xfc56]                      
  1ed2  3501           PULS CC                           
  1ed4  3536           PULS  A B X Y                     
  1ed6  3261           LEAS 0x1,S                        
  1ed8  3580           PULS  PC                          
LAB_M78_r3_24000__1eda:
  1eda  AD9FFD76       JSR [0xfd76]                      
  1ede  AD9FFC56       JSR [0xfc56]                      
  1ee2  3501           PULS CC                           
  1ee4  3536           PULS  A B X Y                     
  1ee6  3B             RTI                               

; ---- function FUN_M78_r3_24000__1ee7
FUN_M78_r3_24000__1ee7:
  1ee7  3436           PSHS  Y X B A                     
  1ee9  CC000A         LDD #0xa                          
  1eec  AD9FFD20       JSR [0xfd20]                      
  1ef0  108E0440       LDY #0x440                        
  1ef4  FC715E         LDD 0x715e                        
  1ef7  AD9FFD2E       JSR [0xfd2e]                      
  1efb  CC000A         LDD #0xa                          
  1efe  AD9FFD20       JSR [0xfd20]                      
  1f02  108E0441       LDY #0x441                        
  1f06  FC7160         LDD 0x7160                        
  1f09  AD9FFD2E       JSR [0xfd2e]                      
  1f0d  CC000A         LDD #0xa                          
  1f10  AD9FFD20       JSR [0xfd20]                      
  1f14  108E0442       LDY #0x442                        
  1f18  FC7162         LDD 0x7162                        
  1f1b  AD9FFD2E       JSR [0xfd2e]                      
  1f1f  CC000A         LDD #0xa                          
  1f22  AD9FFD20       JSR [0xfd20]                      
  1f26  108E0443       LDY #0x443                        
  1f2a  FC7164         LDD 0x7164                        
  1f2d  AD9FFD2E       JSR [0xfd2e]                      
  1f31  CC000A         LDD #0xa                          
  1f34  AD9FFD20       JSR [0xfd20]                      
  1f38  108E0444       LDY #0x444                        
  1f3c  FC7166         LDD 0x7166                        
  1f3f  AD9FFD2E       JSR [0xfd2e]                      
  1f43  CC000A         LDD #0xa                          
  1f46  AD9FFD20       JSR [0xfd20]                      
  1f4a  108E0445       LDY #0x445                        
  1f4e  FC7168         LDD 0x7168                        
  1f51  AD9FFD2E       JSR [0xfd2e]                      
  1f55  CC000A         LDD #0xa                          
  1f58  AD9FFD20       JSR [0xfd20]                      
  1f5c  108E044B       LDY #0x44b                        
  1f60  FC7174         LDD 0x7174                        
  1f63  AD9FFD2E       JSR [0xfd2e]                      
  1f67  CC000A         LDD #0xa                          
  1f6a  AD9FFD20       JSR [0xfd20]                      
  1f6e  108E0446       LDY #0x446                        
  1f72  FC716A         LDD 0x716a                        
  1f75  AD9FFD2E       JSR [0xfd2e]                      
  1f79  CC000A         LDD #0xa                          
  1f7c  AD9FFD20       JSR [0xfd20]                      
  1f80  108E0447       LDY #0x447                        
  1f84  FC716C         LDD 0x716c                        
  1f87  AD9FFD2E       JSR [0xfd2e]                      
  1f8b  CC0941         LDD #0x941                        
  1f8e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1f92  600F           addr 600f                         
LAB_M78_r3_24000__1f94:
  1f94  CC0000         LDD #0x0                          
  1f97  FD7186         STD 0x7186                        
  1f9a  AD9FFD76       JSR [0xfd76]                      
  1f9e  1CBF           ANDCC #0xbf                       
  1fa0  3536           PULS  A B X Y                     
  1fa2  39             RTS                               

;; Module 78 code record 02, 1781 bytes, entered at payload start
MODULE_78_02_CODE_hdr:
  1fa3  780206FD0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_78_02_entry
MODULE_78_02_entry:
  1fab  39             RTS                               

; ---- function FUN_M78_r3_24000__1fac
FUN_M78_r3_24000__1fac:
  1fac  3406           PSHS  B A                         
  1fae  CC0000         LDD #0x0                          
  1fb1  FD7381         STD 0x7381                        
  1fb4  FD7387         STD 0x7387                        
  1fb7  FD7383         STD 0x7383                        
  1fba  FD7385         STD 0x7385                        
  1fbd  3506           PULS  A B                         
  1fbf  39             RTS                               

; ---- function FUN_M78_r3_24000__1fc0
FUN_M78_r3_24000__1fc0:
  1fc0  3406           PSHS  B A                         
  1fc2  C4F0           ANDB #0xf0                        
  1fc4  C190           CMPB #0x90                        
  1fc6  2733           BEQ 0x1ffb                        
  1fc8  C180           CMPB #0x80                        
  1fca  270B           BEQ 0x1fd7                        
  1fcc  CC1FAB         LDD #0x1fab                       
  1fcf  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  1fd3  6B03           addr 6b03                         
LAB_M78_r3_24000__1fd5:
  1fd5  2046           BRA 0x201d                        
LAB_M78_r3_24000__1fd7:
  1fd7  F6608A         LDB 0x608a                        
  1fda  2B14           BMI 0x1ff0                        
  1fdc  E661           LDB 0x1,S                         
  1fde  C40F           ANDB #0xf                         
  1fe0  F1608A         CMPB 0x608a                       
  1fe3  270B           BEQ 0x1ff0                        
  1fe5  CC1FAB         LDD #0x1fab                       
  1fe8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  1fec  6B03           addr 6b03                         
LAB_M78_r3_24000__1fee:
  1fee  202D           BRA 0x201d                        
LAB_M78_r3_24000__1ff0:
  1ff0  FC7146         LDD 0x7146                        
  1ff3  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  1ff7  6B03           addr 6b03                         
LAB_M78_r3_24000__1ff9:
  1ff9  2022           BRA 0x201d                        
LAB_M78_r3_24000__1ffb:
  1ffb  F6608A         LDB 0x608a                        
  1ffe  2B14           BMI 0x2014                        
  2000  E661           LDB 0x1,S                         
  2002  C40F           ANDB #0xf                         
  2004  F1608A         CMPB 0x608a                       
  2007  270B           BEQ 0x2014                        
  2009  CC1FAB         LDD #0x1fab                       
  200c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  2010  6B03           addr 6b03                         
LAB_M78_r3_24000__2012:
  2012  2009           BRA 0x201d                        
LAB_M78_r3_24000__2014:
  2014  FC7144         LDD 0x7144                        
  2017  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  201b  6B03           addr 6b03                         
LAB_M78_r3_24000__201d:
  201d  3506           PULS  A B                         
  201f  39             RTS                               

; ---- function FUN_M78_r3_24000__2020
FUN_M78_r3_24000__2020:
  2020  3476           PSHS  U Y X B A                   
  2022  CC0001         LDD #0x1                          
  2025  FD717A         STD 0x717a                        
  2028  FC7254         LDD 0x7254                        
  202b  CA01           ORB #0x1                          
  202d  FD7254         STD 0x7254                        
  2030  FC7256         LDD 0x7256                        
  2033  C4FE           ANDB #0xfe                        
  2035  FD7256         STD 0x7256                        
  2038  FC7148         LDD 0x7148                        
  203b  2607           BNE 0x2044                        
  203d  1703C4         LBSR 0x2404                       
  2040  10260059       LBNE 0x209d                       
LAB_M78_r3_24000__2044:
  2044  FC7098         LDD 0x7098                        
  2047  2624           BNE 0x206d                        
  2049  CC000A         LDD #0xa                          
  204c  AD9FFD20       JSR [0xfd20]                      
  2050  108E014F       LDY #0x14f                        
  2054  CC0001         LDD #0x1                          
  2057  AD9FFD2E       JSR [0xfd2e]                      
  205b  CC000A         LDD #0xa                          
  205e  AD9FFD20       JSR [0xfd20]                      
  2062  108E014F       LDY #0x14f                        
  2066  CC0000         LDD #0x0                          
  2069  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__206d:
  206d  CC000A         LDD #0xa                          
  2070  AD9FFD20       JSR [0xfd20]                      
  2074  108E014B       LDY #0x14b                        
  2078  CC0001         LDD #0x1                          
  207b  AD9FFD2E       JSR [0xfd2e]                      
  207f  CC000A         LDD #0xa                          
  2082  AD9FFD20       JSR [0xfd20]                      
  2086  108E014B       LDY #0x14b                        
  208a  CC0000         LDD #0x0                          
  208d  AD9FFD2E       JSR [0xfd2e]                      
  2091  170108         LBSR 0x219c                       
  2094  FD703C         STD 0x703c                        
  2097  17ECAC         LBSR 0x0d46                       
  209a  17F093         LBSR 0x1130                       
LAB_M78_r3_24000__209d:
  209d  3576           PULS  A B X Y U                   
  209f  39             RTS                               

; ---- function FUN_M78_r3_24000__20a0
FUN_M78_r3_24000__20a0:
  20a0  3476           PSHS  U Y X B A                   
  20a2  CC0001         LDD #0x1                          
  20a5  FD717C         STD 0x717c                        
  20a8  FC7254         LDD 0x7254                        
  20ab  CA02           ORB #0x2                          
  20ad  FD7254         STD 0x7254                        
  20b0  FC7256         LDD 0x7256                        
  20b3  C4FD           ANDB #0xfd                        
  20b5  FD7256         STD 0x7256                        
  20b8  FC7148         LDD 0x7148                        
  20bb  2607           BNE 0x20c4                        
  20bd  170344         LBSR 0x2404                       
  20c0  10260059       LBNE 0x211d                       
LAB_M78_r3_24000__20c4:
  20c4  FC7098         LDD 0x7098                        
  20c7  2624           BNE 0x20ed                        
  20c9  CC000A         LDD #0xa                          
  20cc  AD9FFD20       JSR [0xfd20]                      
  20d0  108E024F       LDY #0x24f                        
  20d4  CC0001         LDD #0x1                          
  20d7  AD9FFD2E       JSR [0xfd2e]                      
  20db  CC000A         LDD #0xa                          
  20de  AD9FFD20       JSR [0xfd20]                      
  20e2  108E024F       LDY #0x24f                        
  20e6  CC0000         LDD #0x0                          
  20e9  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__20ed:
  20ed  CC000A         LDD #0xa                          
  20f0  AD9FFD20       JSR [0xfd20]                      
  20f4  108E024B       LDY #0x24b                        
  20f8  CC0001         LDD #0x1                          
  20fb  AD9FFD2E       JSR [0xfd2e]                      
  20ff  CC000A         LDD #0xa                          
  2102  AD9FFD20       JSR [0xfd20]                      
  2106  108E024B       LDY #0x24b                        
  210a  CC0000         LDD #0x0                          
  210d  AD9FFD2E       JSR [0xfd2e]                      
  2111  170088         LBSR 0x219c                       
  2114  FD7268         STD 0x7268                        
  2117  17ECE8         LBSR 0x0e02                       
  211a  17F0C8         LBSR 0x11e5                       
LAB_M78_r3_24000__211d:
  211d  3576           PULS  A B X Y U                   
  211f  39             RTS                               

; ---- function FUN_M78_r3_24000__2120
FUN_M78_r3_24000__2120:
  2120  3476           PSHS  U Y X B A                   
  2122  CC0001         LDD #0x1                          
  2125  FD717A         STD 0x717a                        
  2128  CC0003         LDD #0x3                          
  212b  FD7254         STD 0x7254                        
  212e  CC0000         LDD #0x0                          
  2131  FD7256         STD 0x7256                        
  2134  FC7148         LDD 0x7148                        
  2137  2607           BNE 0x2140                        
  2139  1702C8         LBSR 0x2404                       
  213c  10260059       LBNE 0x2199                       
LAB_M78_r3_24000__2140:
  2140  FC7098         LDD 0x7098                        
  2143  2624           BNE 0x2169                        
  2145  CC000A         LDD #0xa                          
  2148  AD9FFD20       JSR [0xfd20]                      
  214c  108E034F       LDY #0x34f                        
  2150  CC0001         LDD #0x1                          
  2153  AD9FFD2E       JSR [0xfd2e]                      
  2157  CC000A         LDD #0xa                          
  215a  AD9FFD20       JSR [0xfd20]                      
  215e  108E034F       LDY #0x34f                        
  2162  CC0000         LDD #0x0                          
  2165  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__2169:
  2169  CC000A         LDD #0xa                          
  216c  AD9FFD20       JSR [0xfd20]                      
  2170  108E034B       LDY #0x34b                        
  2174  CC0001         LDD #0x1                          
  2177  AD9FFD2E       JSR [0xfd2e]                      
  217b  CC000A         LDD #0xa                          
  217e  AD9FFD20       JSR [0xfd20]                      
  2182  108E034B       LDY #0x34b                        
  2186  CC0000         LDD #0x0                          
  2189  AD9FFD2E       JSR [0xfd2e]                      
  218d  17000C         LBSR 0x219c                       
  2190  FD703C         STD 0x703c                        
  2193  17EBB0         LBSR 0x0d46                       
  2196  17EF97         LBSR 0x1130                       
LAB_M78_r3_24000__2199:
  2199  3576           PULS  A B X Y U                   
  219b  39             RTS                               

; ---- function FUN_M78_r3_24000__219c
FUN_M78_r3_24000__219c:
  219c  3470           PSHS  U Y X                       
  219e  F67381         LDB 0x7381                        
  21a1  4F             CLRA                              
  21a2  B370B8         SUBD 0x70b8                       
  21a5  3606           PSHU  B A                         
  21a7  CC0064         LDD #0x64                         
  21aa  3606           PSHU  B A                         
  21ac  AD9FFCEC       JSR [0xfcec]                      
  21b0  3706           PULU  A B                         
  21b2  3570           PULS  X Y U                       
  21b4  39             RTS                               

; ---- function FUN_M78_r3_24000__21b5
FUN_M78_r3_24000__21b5:
  21b5  3476           PSHS  U Y X B A                   
  21b7  CC0001         LDD #0x1                          
  21ba  FD717A         STD 0x717a                        
  21bd  FC7256         LDD 0x7256                        
  21c0  CA01           ORB #0x1                          
  21c2  FD7256         STD 0x7256                        
  21c5  FC7254         LDD 0x7254                        
  21c8  C4FE           ANDB #0xfe                        
  21ca  FD7254         STD 0x7254                        
  21cd  FC7148         LDD 0x7148                        
  21d0  2607           BNE 0x21d9                        
  21d2  17022F         LBSR 0x2404                       
  21d5  10260059       LBNE 0x2232                       
LAB_M78_r3_24000__21d9:
  21d9  FC7098         LDD 0x7098                        
  21dc  2624           BNE 0x2202                        
  21de  CC000A         LDD #0xa                          
  21e1  AD9FFD20       JSR [0xfd20]                      
  21e5  108E014F       LDY #0x14f                        
  21e9  CC0001         LDD #0x1                          
  21ec  AD9FFD2E       JSR [0xfd2e]                      
  21f0  CC000A         LDD #0xa                          
  21f3  AD9FFD20       JSR [0xfd20]                      
  21f7  108E014F       LDY #0x14f                        
  21fb  CC0000         LDD #0x0                          
  21fe  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__2202:
  2202  CC000A         LDD #0xa                          
  2205  AD9FFD20       JSR [0xfd20]                      
  2209  108E014C       LDY #0x14c                        
  220d  CC0001         LDD #0x1                          
  2210  AD9FFD2E       JSR [0xfd2e]                      
  2214  CC000A         LDD #0xa                          
  2217  AD9FFD20       JSR [0xfd20]                      
  221b  108E014C       LDY #0x14c                        
  221f  CC0000         LDD #0x0                          
  2222  AD9FFD2E       JSR [0xfd2e]                      
  2226  170108         LBSR 0x2331                       
  2229  FD726A         STD 0x726a                        
  222c  17EE0F         LBSR 0x103e                       
  222f  17F162         LBSR 0x1394                       
LAB_M78_r3_24000__2232:
  2232  3576           PULS  A B X Y U                   
  2234  39             RTS                               

; ---- function FUN_M78_r3_24000__2235
FUN_M78_r3_24000__2235:
  2235  3476           PSHS  U Y X B A                   
  2237  CC0001         LDD #0x1                          
  223a  FD717C         STD 0x717c                        
  223d  FC7256         LDD 0x7256                        
  2240  CA02           ORB #0x2                          
  2242  FD7256         STD 0x7256                        
  2245  FC7254         LDD 0x7254                        
  2248  C4FD           ANDB #0xfd                        
  224a  FD7254         STD 0x7254                        
  224d  FC7148         LDD 0x7148                        
  2250  2607           BNE 0x2259                        
  2252  1701AF         LBSR 0x2404                       
  2255  10260059       LBNE 0x22b2                       
LAB_M78_r3_24000__2259:
  2259  FC7098         LDD 0x7098                        
  225c  2624           BNE 0x2282                        
  225e  CC000A         LDD #0xa                          
  2261  AD9FFD20       JSR [0xfd20]                      
  2265  108E024F       LDY #0x24f                        
  2269  CC0001         LDD #0x1                          
  226c  AD9FFD2E       JSR [0xfd2e]                      
  2270  CC000A         LDD #0xa                          
  2273  AD9FFD20       JSR [0xfd20]                      
  2277  108E024F       LDY #0x24f                        
  227b  CC0000         LDD #0x0                          
  227e  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__2282:
  2282  CC000A         LDD #0xa                          
  2285  AD9FFD20       JSR [0xfd20]                      
  2289  108E024C       LDY #0x24c                        
  228d  CC0001         LDD #0x1                          
  2290  AD9FFD2E       JSR [0xfd2e]                      
  2294  CC000A         LDD #0xa                          
  2297  AD9FFD20       JSR [0xfd20]                      
  229b  108E024C       LDY #0x24c                        
  229f  CC0000         LDD #0x0                          
  22a2  AD9FFD2E       JSR [0xfd2e]                      
  22a6  170088         LBSR 0x2331                       
  22a9  FD7048         STD 0x7048                        
  22ac  17ECC4         LBSR 0x0f73                       
  22af  17F01E         LBSR 0x12d0                       
LAB_M78_r3_24000__22b2:
  22b2  3576           PULS  A B X Y U                   
  22b4  39             RTS                               

; ---- function FUN_M78_r3_24000__22b5
FUN_M78_r3_24000__22b5:
  22b5  3476           PSHS  U Y X B A                   
  22b7  CC0001         LDD #0x1                          
  22ba  FD717C         STD 0x717c                        
  22bd  CC0003         LDD #0x3                          
  22c0  FD7256         STD 0x7256                        
  22c3  CC0000         LDD #0x0                          
  22c6  FD7254         STD 0x7254                        
  22c9  FC7148         LDD 0x7148                        
  22cc  2607           BNE 0x22d5                        
  22ce  170133         LBSR 0x2404                       
  22d1  10260059       LBNE 0x232e                       
LAB_M78_r3_24000__22d5:
  22d5  FC7098         LDD 0x7098                        
  22d8  2624           BNE 0x22fe                        
  22da  CC000A         LDD #0xa                          
  22dd  AD9FFD20       JSR [0xfd20]                      
  22e1  108E034F       LDY #0x34f                        
  22e5  CC0001         LDD #0x1                          
  22e8  AD9FFD2E       JSR [0xfd2e]                      
  22ec  CC000A         LDD #0xa                          
  22ef  AD9FFD20       JSR [0xfd20]                      
  22f3  108E034F       LDY #0x34f                        
  22f7  CC0000         LDD #0x0                          
  22fa  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__22fe:
  22fe  CC000A         LDD #0xa                          
  2301  AD9FFD20       JSR [0xfd20]                      
  2305  108E034C       LDY #0x34c                        
  2309  CC0001         LDD #0x1                          
  230c  AD9FFD2E       JSR [0xfd2e]                      
  2310  CC000A         LDD #0xa                          
  2313  AD9FFD20       JSR [0xfd20]                      
  2317  108E034C       LDY #0x34c                        
  231b  CC0000         LDD #0x0                          
  231e  AD9FFD2E       JSR [0xfd2e]                      
  2322  17000C         LBSR 0x2331                       
  2325  FD7048         STD 0x7048                        
  2328  17EC48         LBSR 0x0f73                       
  232b  17EFA2         LBSR 0x12d0                       
LAB_M78_r3_24000__232e:
  232e  3576           PULS  A B X Y U                   
  2330  39             RTS                               

; ---- function FUN_M78_r3_24000__2331
FUN_M78_r3_24000__2331:
  2331  3470           PSHS  U Y X                       
  2333  F67381         LDB 0x7381                        
  2336  4F             CLRA                              
  2337  B370C0         SUBD 0x70c0                       
  233a  3606           PSHU  B A                         
  233c  CC0064         LDD #0x64                         
  233f  3606           PSHU  B A                         
  2341  AD9FFCEC       JSR [0xfcec]                      
  2345  3706           PULU  A B                         
  2347  3570           PULS  X Y U                       
  2349  39             RTS                               

; ---- function FUN_M78_r3_24000__234a
FUN_M78_r3_24000__234a:
  234a  3476           PSHS  U Y X B A                   
  234c  CC0001         LDD #0x1                          
  234f  FD717A         STD 0x717a                        
  2352  FD717C         STD 0x717c                        
  2355  FD7254         STD 0x7254                        
  2358  CC0002         LDD #0x2                          
  235b  FD7256         STD 0x7256                        
  235e  FC7148         LDD 0x7148                        
  2361  2607           BNE 0x236a                        
  2363  17009E         LBSR 0x2404                       
  2366  10260097       LBNE 0x2401                       
LAB_M78_r3_24000__236a:
  236a  FC7098         LDD 0x7098                        
  236d  2624           BNE 0x2393                        
  236f  CC000A         LDD #0xa                          
  2372  AD9FFD20       JSR [0xfd20]                      
  2376  108E034F       LDY #0x34f                        
  237a  CC0001         LDD #0x1                          
  237d  AD9FFD2E       JSR [0xfd2e]                      
  2381  CC000A         LDD #0xa                          
  2384  AD9FFD20       JSR [0xfd20]                      
  2388  108E034F       LDY #0x34f                        
  238c  CC0000         LDD #0x0                          
  238f  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__2393:
  2393  CC000A         LDD #0xa                          
  2396  AD9FFD20       JSR [0xfd20]                      
  239a  108E014B       LDY #0x14b                        
  239e  CC0001         LDD #0x1                          
  23a1  AD9FFD2E       JSR [0xfd2e]                      
  23a5  CC000A         LDD #0xa                          
  23a8  AD9FFD20       JSR [0xfd20]                      
  23ac  108E024C       LDY #0x24c                        
  23b0  CC0001         LDD #0x1                          
  23b3  AD9FFD2E       JSR [0xfd2e]                      
  23b7  CC000A         LDD #0xa                          
  23ba  AD9FFD20       JSR [0xfd20]                      
  23be  108E014B       LDY #0x14b                        
  23c2  CC0000         LDD #0x0                          
  23c5  AD9FFD2E       JSR [0xfd2e]                      
  23c9  CC000A         LDD #0xa                          
  23cc  AD9FFD20       JSR [0xfd20]                      
  23d0  108E024C       LDY #0x24c                        
  23d4  CC0000         LDD #0x0                          
  23d7  AD9FFD2E       JSR [0xfd2e]                      
  23db  F67381         LDB 0x7381                        
  23de  4F             CLRA                              
  23df  B370B0         SUBD 0x70b0                       
  23e2  3606           PSHU  B A                         
  23e4  CC0064         LDD #0x64                         
  23e7  3606           PSHU  B A                         
  23e9  AD9FFCEC       JSR [0xfcec]                      
  23ed  3706           PULU  A B                         
  23ef  FD703C         STD 0x703c                        
  23f2  FD7048         STD 0x7048                        
  23f5  17E94E         LBSR 0x0d46                       
  23f8  17EB78         LBSR 0x0f73                       
  23fb  17ED32         LBSR 0x1130                       
  23fe  17EECF         LBSR 0x12d0                       
LAB_M78_r3_24000__2401:
  2401  3576           PULS  A B X Y U                   
  2403  39             RTS                               

; ---- function FUN_M78_r3_24000__2404
FUN_M78_r3_24000__2404:
  2404  3476           PSHS  U Y X B A                   
  2406  FC73B9         LDD 0x73b9                        
  2409  260A           BNE 0x2415                        
  240b  FC73BB         LDD 0x73bb                        
  240e  260D           BNE 0x241d                        
  2410  CC0001         LDD #0x1                          
  2413  200E           BRA 0x2423                        
LAB_M78_r3_24000__2415:
  2415  171838         LBSR 0x3c50                       
  2418  FC73BB         LDD 0x73bb                        
  241b  2706           BEQ 0x2423                        
LAB_M78_r3_24000__241d:
  241d  1718B4         LBSR 0x3cd4                       
  2420  CC0000         LDD #0x0                          
LAB_M78_r3_24000__2423:
  2423  3576           PULS  A B X Y U                   
  2425  39             RTS                               

; ---- function FUN_M78_r3_24000__2426
FUN_M78_r3_24000__2426:
  2426  3436           PSHS  Y X B A                     
  2428  CC0000         LDD #0x0                          
  242b  FD717A         STD 0x717a                        
  242e  FC7148         LDD 0x7148                        
  2431  2754           BEQ 0x2487                        
  2433  FC7098         LDD 0x7098                        
  2436  264F           BNE 0x2487                        
  2438  FC7090         LDD 0x7090                        
  243b  2626           BNE 0x2463                        
  243d  CC000A         LDD #0xa                          
  2440  AD9FFD20       JSR [0xfd20]                      
  2444  108E014F       LDY #0x14f                        
  2448  CC0001         LDD #0x1                          
  244b  AD9FFD2E       JSR [0xfd2e]                      
  244f  CC000A         LDD #0xa                          
  2452  AD9FFD20       JSR [0xfd20]                      
  2456  108E014F       LDY #0x14f                        
  245a  CC0000         LDD #0x0                          
  245d  AD9FFD2E       JSR [0xfd2e]                      
  2461  2024           BRA 0x2487                        
LAB_M78_r3_24000__2463:
  2463  CC000A         LDD #0xa                          
  2466  AD9FFD20       JSR [0xfd20]                      
  246a  108E034F       LDY #0x34f                        
  246e  CC0001         LDD #0x1                          
  2471  AD9FFD2E       JSR [0xfd2e]                      
  2475  CC000A         LDD #0xa                          
  2478  AD9FFD20       JSR [0xfd20]                      
  247c  108E034F       LDY #0x34f                        
  2480  CC0000         LDD #0x0                          
  2483  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__2487:
  2487  3536           PULS  A B X Y                     
  2489  39             RTS                               

; ---- function FUN_M78_r3_24000__248a
FUN_M78_r3_24000__248a:
  248a  3436           PSHS  Y X B A                     
  248c  CC0000         LDD #0x0                          
  248f  FD717C         STD 0x717c                        
  2492  FC7148         LDD 0x7148                        
  2495  2754           BEQ 0x24eb                        
  2497  FC7098         LDD 0x7098                        
  249a  264F           BNE 0x24eb                        
  249c  FC7090         LDD 0x7090                        
  249f  2626           BNE 0x24c7                        
  24a1  CC000A         LDD #0xa                          
  24a4  AD9FFD20       JSR [0xfd20]                      
  24a8  108E024F       LDY #0x24f                        
  24ac  CC0001         LDD #0x1                          
  24af  AD9FFD2E       JSR [0xfd2e]                      
  24b3  CC000A         LDD #0xa                          
  24b6  AD9FFD20       JSR [0xfd20]                      
  24ba  108E024F       LDY #0x24f                        
  24be  CC0000         LDD #0x0                          
  24c1  AD9FFD2E       JSR [0xfd2e]                      
  24c5  2024           BRA 0x24eb                        
LAB_M78_r3_24000__24c7:
  24c7  CC000A         LDD #0xa                          
  24ca  AD9FFD20       JSR [0xfd20]                      
  24ce  108E034F       LDY #0x34f                        
  24d2  CC0001         LDD #0x1                          
  24d5  AD9FFD2E       JSR [0xfd2e]                      
  24d9  CC000A         LDD #0xa                          
  24dc  AD9FFD20       JSR [0xfd20]                      
  24e0  108E034F       LDY #0x34f                        
  24e4  CC0000         LDD #0x0                          
  24e7  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__24eb:
  24eb  3536           PULS  A B X Y                     
  24ed  39             RTS                               

; ---- function FUN_M78_r3_24000__24ee
FUN_M78_r3_24000__24ee:
  24ee  3436           PSHS  Y X B A                     
  24f0  CC0000         LDD #0x0                          
  24f3  FD717A         STD 0x717a                        
  24f6  FD717C         STD 0x717c                        
  24f9  FC7148         LDD 0x7148                        
  24fc  2729           BEQ 0x2527                        
  24fe  FC7098         LDD 0x7098                        
  2501  2624           BNE 0x2527                        
  2503  CC000A         LDD #0xa                          
  2506  AD9FFD20       JSR [0xfd20]                      
  250a  108E034F       LDY #0x34f                        
  250e  CC0001         LDD #0x1                          
  2511  AD9FFD2E       JSR [0xfd2e]                      
  2515  CC000A         LDD #0xa                          
  2518  AD9FFD20       JSR [0xfd20]                      
  251c  108E034F       LDY #0x34f                        
  2520  CC0000         LDD #0x0                          
  2523  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__2527:
  2527  3536           PULS  A B X Y                     
  2529  39             RTS                               

; ---- function FUN_M78_r3_24000__252a
FUN_M78_r3_24000__252a:
  252a  3406           PSHS  B A                         
  252c  F77381         STB 0x7381                        
  252f  CC253B         LDD #0x253b                       
  2532  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  2536  6B03           addr 6b03                         
LAB_M78_r3_24000__2538:
  2538  3506           PULS  A B                         
  253a  39             RTS                               

; ---- function FUN_M78_r3_24000__253b
FUN_M78_r3_24000__253b:
  253b  3406           PSHS  B A                         
  253d  C100           CMPB #0x0                         
  253f  270B           BEQ 0x254c                        
  2541  17FE06         LBSR 0x234a                       
  2544  F67381         LDB 0x7381                        
  2547  F77383         STB 0x7383                        
  254a  200B           BRA 0x2557                        
LAB_M78_r3_24000__254c:
  254c  F67381         LDB 0x7381                        
  254f  F17383         CMPB 0x7383                       
  2552  2603           BNE 0x2557                        
  2554  17FF97         LBSR 0x24ee                       
LAB_M78_r3_24000__2557:
  2557  CC252A         LDD #0x252a                       
  255a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  255e  6B03           addr 6b03                         
LAB_M78_r3_24000__2560:
  2560  3506           PULS  A B                         
  2562  39             RTS                               

; ---- function FUN_M78_r3_24000__2563
FUN_M78_r3_24000__2563:
  2563  3406           PSHS  B A                         
  2565  F17383         CMPB 0x7383                       
  2568  2603           BNE 0x256d                        
  256a  17FF81         LBSR 0x24ee                       
LAB_M78_r3_24000__256d:
  256d  CC2579         LDD #0x2579                       
  2570  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  2574  6B03           addr 6b03                         
LAB_M78_r3_24000__2576:
  2576  3506           PULS  A B                         
  2578  39             RTS                               

; ---- function FUN_M78_r3_24000__2579
FUN_M78_r3_24000__2579:
  2579  3406           PSHS  B A                         
  257b  CC2563         LDD #0x2563                       
  257e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  2582  6B03           addr 6b03                         
LAB_M78_r3_24000__2584:
  2584  3506           PULS  A B                         
  2586  39             RTS                               

; ---- function FUN_M78_r3_24000__2587
FUN_M78_r3_24000__2587:
  2587  3406           PSHS  B A                         
  2589  F77381         STB 0x7381                        
  258c  CC2598         LDD #0x2598                       
  258f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  2593  6B03           addr 6b03                         
LAB_M78_r3_24000__2595:
  2595  3506           PULS  A B                         
  2597  39             RTS                               

; ---- function FUN_M78_r3_24000__2598
FUN_M78_r3_24000__2598:
  2598  3406           PSHS  B A                         
  259a  C100           CMPB #0x0                         
  259c  1027008E       LBEQ 0x262e                       
  25a0  F67381         LDB 0x7381                        
  25a3  F170A1         CMPB 0x70a1                       
  25a6  2C43           BGE 0x25eb                        
  25a8  FC7090         LDD 0x7090                        
  25ab  10830000       CMPD #0x0                         
  25af  1027000B       LBEQ 0x25be                       
  25b3  17FB6A         LBSR 0x2120                       
  25b6  F67381         LDB 0x7381                        
  25b9  F77383         STB 0x7383                        
  25bc  2073           BRA 0x2631                        
LAB_M78_r3_24000__25be:
  25be  FC7387         LDD 0x7387                        
  25c1  10830000       CMPD #0x0                         
  25c5  10260011       LBNE 0x25da                       
  25c9  17FA54         LBSR 0x2020                       
  25cc  F67381         LDB 0x7381                        
  25cf  F77383         STB 0x7383                        
  25d2  CC0001         LDD #0x1                          
  25d5  FD7387         STD 0x7387                        
  25d8  2057           BRA 0x2631                        
LAB_M78_r3_24000__25da:
  25da  17FAC3         LBSR 0x20a0                       
  25dd  F67381         LDB 0x7381                        
  25e0  F77385         STB 0x7385                        
  25e3  CC0000         LDD #0x0                          
  25e6  FD7387         STD 0x7387                        
  25e9  2046           BRA 0x2631                        
LAB_M78_r3_24000__25eb:
  25eb  FC7090         LDD 0x7090                        
  25ee  10830000       CMPD #0x0                         
  25f2  1027000B       LBEQ 0x2601                       
  25f6  17FCBC         LBSR 0x22b5                       
  25f9  F67381         LDB 0x7381                        
  25fc  F77383         STB 0x7383                        
  25ff  2030           BRA 0x2631                        
LAB_M78_r3_24000__2601:
  2601  FC7387         LDD 0x7387                        
  2604  10830000       CMPD #0x0                         
  2608  10260011       LBNE 0x261d                       
  260c  17FBA6         LBSR 0x21b5                       
  260f  F67381         LDB 0x7381                        
  2612  F77383         STB 0x7383                        
  2615  CC0001         LDD #0x1                          
  2618  FD7387         STD 0x7387                        
  261b  2014           BRA 0x2631                        
LAB_M78_r3_24000__261d:
  261d  17FC15         LBSR 0x2235                       
  2620  F67381         LDB 0x7381                        
  2623  F77385         STB 0x7385                        
  2626  CC0000         LDD #0x0                          
  2629  FD7387         STD 0x7387                        
  262c  2003           BRA 0x2631                        
LAB_M78_r3_24000__262e:
  262e  17002E         LBSR 0x265f                       
LAB_M78_r3_24000__2631:
  2631  CC2587         LDD #0x2587                       
  2634  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  2638  6B03           addr 6b03                         
LAB_M78_r3_24000__263a:
  263a  3506           PULS  A B                         
  263c  39             RTS                               

; ---- function FUN_M78_r3_24000__263d
FUN_M78_r3_24000__263d:
  263d  3406           PSHS  B A                         
  263f  F77381         STB 0x7381                        
  2642  17001A         LBSR 0x265f                       
  2645  CC2651         LDD #0x2651                       
  2648  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  264c  6B03           addr 6b03                         
LAB_M78_r3_24000__264e:
  264e  3506           PULS  A B                         
  2650  39             RTS                               

; ---- function FUN_M78_r3_24000__2651
FUN_M78_r3_24000__2651:
  2651  3406           PSHS  B A                         
  2653  CC263D         LDD #0x263d                       
  2656  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6B03
  265a  6B03           addr 6b03                         
LAB_M78_r3_24000__265c:
  265c  3506           PULS  A B                         
  265e  39             RTS                               

; ---- function FUN_M78_r3_24000__265f
FUN_M78_r3_24000__265f:
  265f  3406           PSHS  B A                         
  2661  F67381         LDB 0x7381                        
  2664  F17383         CMPB 0x7383                       
  2667  2707           BEQ 0x2670                        
  2669  F17385         CMPB 0x7385                       
  266c  2713           BEQ 0x2681                        
  266e  202D           BRA 0x269d                        
LAB_M78_r3_24000__2670:
  2670  17FDB3         LBSR 0x2426                       
  2673  CCFFFF         LDD #0xffff                       
  2676  FD7383         STD 0x7383                        
  2679  CC0000         LDD #0x0                          
  267c  FD7387         STD 0x7387                        
  267f  201C           BRA 0x269d                        
LAB_M78_r3_24000__2681:
  2681  17FE06         LBSR 0x248a                       
  2684  CCFFFF         LDD #0xffff                       
  2687  FD7385         STD 0x7385                        
  268a  FC717A         LDD 0x717a                        
  268d  10830000       CMPD #0x0                         
  2691  10270008       LBEQ 0x269d                       
  2695  CC0001         LDD #0x1                          
  2698  FD7387         STD 0x7387                        
  269b  2000           BRA 0x269d                        
LAB_M78_r3_24000__269d:
  269d  3506           PULS  A B                         
  269f  39             RTS                               

;; Module 78 code record 03, 1720 bytes, entered at payload start
MODULE_78_03_CODE_hdr:
  26a0  780306C00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_78_03_entry
MODULE_78_03_entry:
  26a8  39             RTS                               

; ---- function FUN_M78_r3_24000__26a9
FUN_M78_r3_24000__26a9:
  26a9  3406           PSHS  B A                         
  26ab  CC0000         LDD #0x0                          
  26ae  FD717A         STD 0x717a                        
  26b1  FD717C         STD 0x717c                        
  26b4  FD738D         STD 0x738d                        
  26b7  FD738F         STD 0x738f                        
  26ba  3586           PULS  A B PC                      

; ---- function FUN_M78_r3_24000__26bc
FUN_M78_r3_24000__26bc:
  26bc  3476           PSHS  U Y X B A                   
  26be  17006B         LBSR 0x272c                       
  26c1  1700ED         LBSR 0x27b1                       
  26c4  170110         LBSR 0x27d7                       
  26c7  170146         LBSR 0x2810                       
  26ca  17017C         LBSR 0x2849                       
  26cd  17006F         LBSR 0x273f                       
  26d0  17063C         LBSR 0x2d0f                       
  26d3  17060B         LBSR 0x2ce1                       
  26d6  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  26da  003C           dw 3Ch                            
  26dc  7188           dw 7188h                          
LAB_M78_r3_24000__26de:
  26de  35F6           PULS  A B X Y U PC                

; ---- function FUN_M78_r3_24000__26e0
FUN_M78_r3_24000__26e0:
  26e0  CC000A         LDD #0xa                          
  26e3  AD9FFD20       JSR [0xfd20]                      
  26e7  108E014F       LDY #0x14f                        
  26eb  CC0001         LDD #0x1                          
  26ee  AD9FFD2E       JSR [0xfd2e]                      
  26f2  39             RTS                               

; ---- function FUN_M78_r3_24000__26f3
FUN_M78_r3_24000__26f3:
  26f3  CC000A         LDD #0xa                          
  26f6  AD9FFD20       JSR [0xfd20]                      
  26fa  108E014F       LDY #0x14f                        
  26fe  CC0000         LDD #0x0                          
  2701  AD9FFD2E       JSR [0xfd2e]                      
  2705  39             RTS                               

; ---- function FUN_M78_r3_24000__2706
FUN_M78_r3_24000__2706:
  2706  CC000A         LDD #0xa                          
  2709  AD9FFD20       JSR [0xfd20]                      
  270d  108E024F       LDY #0x24f                        
  2711  CC0001         LDD #0x1                          
  2714  AD9FFD2E       JSR [0xfd2e]                      
  2718  39             RTS                               

; ---- function FUN_M78_r3_24000__2719
FUN_M78_r3_24000__2719:
  2719  CC000A         LDD #0xa                          
  271c  AD9FFD20       JSR [0xfd20]                      
  2720  108E024F       LDY #0x24f                        
  2724  CC0000         LDD #0x0                          
  2727  AD9FFD2E       JSR [0xfd2e]                      
  272b  39             RTS                               

; ---- function FUN_M78_r3_24000__272c
FUN_M78_r3_24000__272c:
  272c  CC000A         LDD #0xa                          
  272f  AD9FFD20       JSR [0xfd20]                      
  2733  108E034F       LDY #0x34f                        
  2737  CC0001         LDD #0x1                          
  273a  AD9FFD2E       JSR [0xfd2e]                      
  273e  39             RTS                               

; ---- function FUN_M78_r3_24000__273f
FUN_M78_r3_24000__273f:
  273f  CC000A         LDD #0xa                          
  2742  AD9FFD20       JSR [0xfd20]                      
  2746  108E034F       LDY #0x34f                        
  274a  CC0000         LDD #0x0                          
  274d  AD9FFD2E       JSR [0xfd2e]                      
  2751  39             RTS                               

; ---- function FUN_M78_r3_24000__2752
FUN_M78_r3_24000__2752:
  2752  CC000A         LDD #0xa                          
  2755  AD9FFD20       JSR [0xfd20]                      
  2759  108E014B       LDY #0x14b                        
  275d  CC0001         LDD #0x1                          
  2760  AD9FFD2E       JSR [0xfd2e]                      
  2764  39             RTS                               

; ---- function FUN_M78_r3_24000__2765
FUN_M78_r3_24000__2765:
  2765  CC000A         LDD #0xa                          
  2768  AD9FFD20       JSR [0xfd20]                      
  276c  108E014B       LDY #0x14b                        
  2770  CC0000         LDD #0x0                          
  2773  AD9FFD2E       JSR [0xfd2e]                      
  2777  39             RTS                               

; ---- function FUN_M78_r3_24000__2778
FUN_M78_r3_24000__2778:
  2778  CC000A         LDD #0xa                          
  277b  AD9FFD20       JSR [0xfd20]                      
  277f  108E024C       LDY #0x24c                        
  2783  CC0001         LDD #0x1                          
  2786  AD9FFD2E       JSR [0xfd2e]                      
  278a  39             RTS                               

; ---- function FUN_M78_r3_24000__278b
FUN_M78_r3_24000__278b:
  278b  CC000A         LDD #0xa                          
  278e  AD9FFD20       JSR [0xfd20]                      
  2792  108E024C       LDY #0x24c                        
  2796  CC0000         LDD #0x0                          
  2799  AD9FFD2E       JSR [0xfd2e]                      
  279d  39             RTS                               

; ---- function FUN_M78_r3_24000__279e
FUN_M78_r3_24000__279e:
  279e  CC000A         LDD #0xa                          
  27a1  AD9FFD20       JSR [0xfd20]                      
  27a5  108E034B       LDY #0x34b                        
  27a9  CC0001         LDD #0x1                          
  27ac  AD9FFD2E       JSR [0xfd2e]                      
  27b0  39             RTS                               

; ---- function FUN_M78_r3_24000__27b1
FUN_M78_r3_24000__27b1:
  27b1  CC000A         LDD #0xa                          
  27b4  AD9FFD20       JSR [0xfd20]                      
  27b8  108E034B       LDY #0x34b                        
  27bc  CC0000         LDD #0x0                          
  27bf  AD9FFD2E       JSR [0xfd2e]                      
  27c3  39             RTS                               

; ---- function FUN_M78_r3_24000__27c4
FUN_M78_r3_24000__27c4:
  27c4  CC000A         LDD #0xa                          
  27c7  AD9FFD20       JSR [0xfd20]                      
  27cb  108E034C       LDY #0x34c                        
  27cf  CC0001         LDD #0x1                          
  27d2  AD9FFD2E       JSR [0xfd2e]                      
  27d6  39             RTS                               

; ---- function FUN_M78_r3_24000__27d7
FUN_M78_r3_24000__27d7:
  27d7  CC000A         LDD #0xa                          
  27da  AD9FFD20       JSR [0xfd20]                      
  27de  108E034C       LDY #0x34c                        
  27e2  CC0000         LDD #0x0                          
  27e5  AD9FFD2E       JSR [0xfd2e]                      
  27e9  39             RTS                               

; ---- function FUN_M78_r3_24000__27ea
FUN_M78_r3_24000__27ea:
  27ea  CC000A         LDD #0xa                          
  27ed  AD9FFD20       JSR [0xfd20]                      
  27f1  108E0169       LDY #0x169                        
  27f5  CC0001         LDD #0x1                          
  27f8  AD9FFD2E       JSR [0xfd2e]                      
  27fc  39             RTS                               

; ---- function FUN_M78_r3_24000__27fd
FUN_M78_r3_24000__27fd:
  27fd  CC000A         LDD #0xa                          
  2800  AD9FFD20       JSR [0xfd20]                      
  2804  108E0369       LDY #0x369                        
  2808  CC0001         LDD #0x1                          
  280b  AD9FFD2E       JSR [0xfd2e]                      
  280f  39             RTS                               

; ---- function FUN_M78_r3_24000__2810
FUN_M78_r3_24000__2810:
  2810  CC000A         LDD #0xa                          
  2813  AD9FFD20       JSR [0xfd20]                      
  2817  108E0369       LDY #0x369                        
  281b  CC0000         LDD #0x0                          
  281e  AD9FFD2E       JSR [0xfd2e]                      
  2822  39             RTS                               

; ---- function FUN_M78_r3_24000__2823
FUN_M78_r3_24000__2823:
  2823  CC000A         LDD #0xa                          
  2826  AD9FFD20       JSR [0xfd20]                      
  282a  108E026A       LDY #0x26a                        
  282e  CC0001         LDD #0x1                          
  2831  AD9FFD2E       JSR [0xfd2e]                      
  2835  39             RTS                               

; ---- function FUN_M78_r3_24000__2836
FUN_M78_r3_24000__2836:
  2836  CC000A         LDD #0xa                          
  2839  AD9FFD20       JSR [0xfd20]                      
  283d  108E036A       LDY #0x36a                        
  2841  CC0001         LDD #0x1                          
  2844  AD9FFD2E       JSR [0xfd2e]                      
  2848  39             RTS                               

; ---- function FUN_M78_r3_24000__2849
FUN_M78_r3_24000__2849:
  2849  CC000A         LDD #0xa                          
  284c  AD9FFD20       JSR [0xfd20]                      
  2850  108E036A       LDY #0x36a                        
  2854  CC0000         LDD #0x0                          
  2857  AD9FFD2E       JSR [0xfd2e]                      
  285b  39             RTS                               

; ---- function FUN_M78_r3_24000__285c
FUN_M78_r3_24000__285c:
  285c  3476           PSHS  U Y X B A                   
  285e  FC7090         LDD 0x7090                        
  2861  10830001       CMPD #0x1                         
  2865  1027000E       LBEQ 0x2877                       
  2869  8E604E         LDX #0x604e                       
  286c  8612           LDA #0x12                         
  286e  A401           ANDA 0x1,X                        
  2870  2605           BNE 0x2877                        
  2872  17006A         LBSR 0x28df                       
  2875  2024           BRA 0x289b                        
LAB_M78_r3_24000__2877:
  2877  FC717E         LDD 0x717e                        
  287a  10830000       CMPD #0x0                         
  287e  10270016       LBEQ 0x2898                       
  2882  17FF8B         LBSR 0x2810                       
  2885  CC0000         LDD #0x0                          
  2888  FD717E         STD 0x717e                        
  288b  170481         LBSR 0x2d0f                       
  288e  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  2892  003C           dw 3Ch                            
  2894  7188           dw 7188h                          
LAB_M78_r3_24000__2896:
  2896  2003           BRA 0x289b                        
LAB_M78_r3_24000__2898:
  2898  170119         LBSR 0x29b4                       
LAB_M78_r3_24000__289b:
  289b  35F6           PULS  A B X Y U PC                

; ---- function FUN_M78_r3_24000__289d
FUN_M78_r3_24000__289d:
  289d  3476           PSHS  U Y X B A                   
  289f  FC7090         LDD 0x7090                        
  28a2  10830001       CMPD #0x1                         
  28a6  1027000E       LBEQ 0x28b8                       
  28aa  8E604E         LDX #0x604e                       
  28ad  8612           LDA #0x12                         
  28af  A401           ANDA 0x1,X                        
  28b1  2605           BNE 0x28b8                        
  28b3  170029         LBSR 0x28df                       
  28b6  2024           BRA 0x28dc                        
LAB_M78_r3_24000__28b8:
  28b8  FC7180         LDD 0x7180                        
  28bb  10830000       CMPD #0x0                         
  28bf  10270016       LBEQ 0x28d9                       
  28c3  17FF83         LBSR 0x2849                       
  28c6  CC0000         LDD #0x0                          
  28c9  FD7180         STD 0x7180                        
  28cc  170440         LBSR 0x2d0f                       
  28cf  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  28d3  003C           dw 3Ch                            
  28d5  7188           dw 7188h                          
LAB_M78_r3_24000__28d7:
  28d7  2003           BRA 0x28dc                        
LAB_M78_r3_24000__28d9:
  28d9  170257         LBSR 0x2b33                       
LAB_M78_r3_24000__28dc:
  28dc  35F6           PULS  A B X Y U PC                
DAT_M78_r3_24000__28de:
  28de  39             ?? 39h    9                       

; ---- function FUN_M78_r3_24000__28df
FUN_M78_r3_24000__28df:
  28df  3476           PSHS  U Y X B A                   
  28e1  FC717E         LDD 0x717e                        
  28e4  10830001       CMPD #0x1                         
  28e8  10270020       LBEQ 0x290c                       
  28ec  FC7180         LDD 0x7180                        
  28ef  10830001       CMPD #0x1                         
  28f3  10260059       LBNE 0x2950                       
  28f7  17FE91         LBSR 0x278b                       
  28fa  17FDE3         LBSR 0x26e0                       
  28fd  17FDF3         LBSR 0x26f3                       
  2900  17FE4F         LBSR 0x2752                       
  2903  17FE5F         LBSR 0x2765                       
  2906  17FEE1         LBSR 0x27ea                       
  2909  160077         LBRA 0x2983                       
LAB_M78_r3_24000__290c:
  290c  CC000A         LDD #0xa                          
  290f  AD9FFD20       JSR [0xfd20]                      
  2913  108E0169       LDY #0x169                        
  2917  CC0000         LDD #0x0                          
  291a  AD9FFD2E       JSR [0xfd2e]                      
  291e  FC7180         LDD 0x7180                        
  2921  10830001       CMPD #0x1                         
  2925  10270012       LBEQ 0x293b                       
  2929  17FDDA         LBSR 0x2706                       
  292c  17FDEA         LBSR 0x2719                       
  292f  17FE46         LBSR 0x2778                       
  2932  17FE56         LBSR 0x278b                       
  2935  17FEEB         LBSR 0x2823                       
  2938  160048         LBRA 0x2983                       
LAB_M78_r3_24000__293b:
  293b  CC000A         LDD #0xa                          
  293e  AD9FFD20       JSR [0xfd20]                      
  2942  108E026A       LDY #0x26a                        
  2946  CC0000         LDD #0x0                          
  2949  AD9FFD2E       JSR [0xfd2e]                      
  294d  160033         LBRA 0x2983                       
LAB_M78_r3_24000__2950:
  2950  17FDD9         LBSR 0x272c                       
  2953  17FDE9         LBSR 0x273f                       
  2956  17FDF9         LBSR 0x2752                       
  2959  17FE1C         LBSR 0x2778                       
  295c  17FE06         LBSR 0x2765                       
  295f  17FE29         LBSR 0x278b                       
  2962  17FE85         LBSR 0x27ea                       
  2965  17FEBB         LBSR 0x2823                       
  2968  CC0001         LDD #0x1                          
  296b  FD717A         STD 0x717a                        
  296e  FD717C         STD 0x717c                        
  2971  FD738D         STD 0x738d                        
  2974  FD738F         STD 0x738f                        
  2977  CC0001         LDD #0x1                          
  297a  FD7254         STD 0x7254                        
  297d  CC0002         LDD #0x2                          
  2980  FD7256         STD 0x7256                        
LAB_M78_r3_24000__2983:
  2983  CC0000         LDD #0x0                          
  2986  FD7389         STD 0x7389                        
  2989  FD738B         STD 0x738b                        
  298c  FD717E         STD 0x717e                        
  298f  FD7180         STD 0x7180                        
  2992  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  2996  003C           dw 3Ch                            
  2998  7188           dw 7188h                          
LAB_M78_r3_24000__299a:
  299a  170372         LBSR 0x2d0f                       
  299d  CC2A82         LDD #0x2a82                       
  29a0  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  29a4  6011           addr 6011                         
LAB_M78_r3_24000__29a6:
  29a6  CC2C03         LDD #0x2c03                       
  29a9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  29ad  6013           addr 6013                         
LAB_M78_r3_24000__29af:
  29af  170346         LBSR 0x2cf8                       
  29b2  35F6           PULS  A B X Y U PC                

; ---- function FUN_M78_r3_24000__29b4
FUN_M78_r3_24000__29b4:
  29b4  3476           PSHS  U Y X B A                   
  29b6  17002B         LBSR 0x29e4                       
  29b9  CC0000         LDD #0x0                          
  29bc  FD7389         STD 0x7389                        
  29bf  FD717E         STD 0x717e                        
  29c2  CC0001         LDD #0x1                          
  29c5  FD717A         STD 0x717a                        
  29c8  FD738D         STD 0x738d                        
  29cb  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  29cf  003C           dw 3Ch                            
  29d1  7188           dw 7188h                          
LAB_M78_r3_24000__29d3:
  29d3  170339         LBSR 0x2d0f                       
  29d6  CC2A82         LDD #0x2a82                       
  29d9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  29dd  6011           addr 6011                         
LAB_M78_r3_24000__29df:
  29df  170316         LBSR 0x2cf8                       
  29e2  35F6           PULS  A B X Y U PC                

; ---- function FUN_M78_r3_24000__29e4
FUN_M78_r3_24000__29e4:
  29e4  3476           PSHS  U Y X B A                   
  29e6  FC7090         LDD 0x7090                        
  29e9  10830000       CMPD #0x0                         
  29ed  10270056       LBEQ 0x2a47                       
  29f1  17FDE3         LBSR 0x27d7                       
  29f4  17FE52         LBSR 0x2849                       
  29f7  17FD32         LBSR 0x272c                       
  29fa  17FD42         LBSR 0x273f                       
  29fd  CC000A         LDD #0xa                          
  2a00  AD9FFD20       JSR [0xfd20]                      
  2a04  108E0340       LDY #0x340                        
  2a08  FC70E6         LDD 0x70e6                        
  2a0b  AD9FFD2E       JSR [0xfd2e]                      
  2a0f  CC000A         LDD #0xa                          
  2a12  AD9FFD20       JSR [0xfd20]                      
  2a16  108E0341       LDY #0x341                        
  2a1a  FC7058         LDD 0x7058                        
  2a1d  AD9FFD2E       JSR [0xfd2e]                      
  2a21  17FD7A         LBSR 0x279e                       
  2a24  17FD8A         LBSR 0x27b1                       
  2a27  17FDD3         LBSR 0x27fd                       
  2a2a  CC0000         LDD #0x0                          
  2a2d  FD7256         STD 0x7256                        
  2a30  CC0003         LDD #0x3                          
  2a33  FD7254         STD 0x7254                        
  2a36  FC717C         LDD 0x717c                        
  2a39  10830001       CMPD #0x1                         
  2a3d  1026003F       LBNE 0x2a80                       
  2a41  170260         LBSR 0x2ca4                       
  2a44  160039         LBRA 0x2a80                       
LAB_M78_r3_24000__2a47:
  2a47  17FC96         LBSR 0x26e0                       
  2a4a  17FCA6         LBSR 0x26f3                       
  2a4d  17FD02         LBSR 0x2752                       
  2a50  17FD12         LBSR 0x2765                       
  2a53  17FD94         LBSR 0x27ea                       
  2a56  CC000A         LDD #0xa                          
  2a59  AD9FFD20       JSR [0xfd20]                      
  2a5d  108E0140       LDY #0x140                        
  2a61  FC70E6         LDD 0x70e6                        
  2a64  AD9FFD2E       JSR [0xfd2e]                      
  2a68  CC000A         LDD #0xa                          
  2a6b  AD9FFD20       JSR [0xfd20]                      
  2a6f  108E0141       LDY #0x141                        
  2a73  FC7058         LDD 0x7058                        
  2a76  AD9FFD2E       JSR [0xfd2e]                      
  2a7a  CC0001         LDD #0x1                          
  2a7d  FD7254         STD 0x7254                        
LAB_M78_r3_24000__2a80:
  2a80  35F6           PULS  A B X Y U PC                

; ---- function FUN_M78_r3_24000__2a82
FUN_M78_r3_24000__2a82:
  2a82  3476           PSHS  U Y X B A                   
  2a84  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  2a88  0014           dw 14h                            
  2a8a  7188           dw 7188h                          
LAB_M78_r3_24000__2a8c:
  2a8c  AD9FFD3E       JSR [0xfd3e]                      
  2a90  10830001       CMPD #0x1                         
  2a94  2705           BEQ 0x2a9b                        
  2a96  170073         LBSR 0x2b0c                       
  2a99  206E           BRA 0x2b09                        
LAB_M78_r3_24000__2a9b:
  2a9b  17028C         LBSR 0x2d2a                       
  2a9e  2669           BNE 0x2b09                        
  2aa0  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000E $7188
  2aa4  000E           dw Eh                             
  2aa6  7188           dw 7188h                          
LAB_M78_r3_24000__2aa8:
  2aa8  FC738D         LDD 0x738d                        
  2aab  2605           BNE 0x2ab2                        
  2aad  170289         LBSR 0x2d39                       
  2ab0  2657           BNE 0x2b09                        
LAB_M78_r3_24000__2ab2:
  2ab2  FC717C         LDD 0x717c                        
  2ab5  2608           BNE 0x2abf                        
  2ab7  17029A         LBSR 0x2d54                       
  2aba  2603           BNE 0x2abf                        
  2abc  170074         LBSR 0x2b33                       
LAB_M78_r3_24000__2abf:
  2abf  FC738D         LDD 0x738d                        
  2ac2  2745           BEQ 0x2b09                        
  2ac4  170281         LBSR 0x2d48                       
  2ac7  2713           BEQ 0x2adc                        
  2ac9  CC0000         LDD #0x0                          
  2acc  FD738D         STD 0x738d                        
  2acf  17020F         LBSR 0x2ce1                       
  2ad2  FC717E         LDD 0x717e                        
  2ad5  2632           BNE 0x2b09                        
  2ad7  17FD36         LBSR 0x2810                       
  2ada  202D           BRA 0x2b09                        
LAB_M78_r3_24000__2adc:
  2adc  FC7389         LDD 0x7389                        
  2adf  C30001         ADDD #0x1                         
  2ae2  FD7389         STD 0x7389                        
  2ae5  10830008       CMPD #0x8                         
  2ae9  2D1E           BLT 0x2b09                        
  2aeb  CC0001         LDD #0x1                          
  2aee  FD717E         STD 0x717e                        
  2af1  C607           LDB #0x7                          
  2af3  AD9FFC36       JSR [0xfc36]                      
  2af7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "--looping---|"
  2afb  2D2D6C6F6F70.. char[14] "--looping---|"          
LAB_M78_r3_24000__2b09:
  2b09  3576           PULS  A B X Y U                   
  2b0b  39             RTS                               

; ---- function FUN_M78_r3_24000__2b0c
FUN_M78_r3_24000__2b0c:
  2b0c  3476           PSHS  U Y X B A                   
  2b0e  CC26A8         LDD #0x26a8                       
  2b11  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  2b15  6011           addr 6011                         
LAB_M78_r3_24000__2b17:
  2b17  CC0000         LDD #0x0                          
  2b1a  FD717A         STD 0x717a                        
  2b1d  FD717E         STD 0x717e                        
  2b20  170207         LBSR 0x2d2a                       
  2b23  260B           BNE 0x2b30                        
  2b25  1701B9         LBSR 0x2ce1                       
  2b28  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  2b2c  003C           dw 3Ch                            
  2b2e  7188           dw 7188h                          
LAB_M78_r3_24000__2b30:
  2b30  3576           PULS  A B X Y U                   
  2b32  39             RTS                               

; ---- function FUN_M78_r3_24000__2b33
FUN_M78_r3_24000__2b33:
  2b33  3476           PSHS  U Y X B A                   
  2b35  17002C         LBSR 0x2b64                       
  2b38  CC0000         LDD #0x0                          
  2b3b  FD738B         STD 0x738b                        
  2b3e  FD7180         STD 0x7180                        
  2b41  CC0001         LDD #0x1                          
  2b44  FD717C         STD 0x717c                        
  2b47  FD738F         STD 0x738f                        
  2b4a  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  2b4e  003C           dw 3Ch                            
  2b50  7188           dw 7188h                          
LAB_M78_r3_24000__2b52:
  2b52  1701BA         LBSR 0x2d0f                       
  2b55  CC2C03         LDD #0x2c03                       
  2b58  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2b5c  6013           addr 6013                         
LAB_M78_r3_24000__2b5e:
  2b5e  170197         LBSR 0x2cf8                       
  2b61  3576           PULS  A B X Y U                   
  2b63  39             RTS                               

; ---- function FUN_M78_r3_24000__2b64
FUN_M78_r3_24000__2b64:
  2b64  3476           PSHS  U Y X B A                   
  2b66  FC7090         LDD 0x7090                        
  2b69  10830000       CMPD #0x0                         
  2b6d  10270056       LBEQ 0x2bc7                       
  2b71  17FC3D         LBSR 0x27b1                       
  2b74  17FC99         LBSR 0x2810                       
  2b77  17FBB2         LBSR 0x272c                       
  2b7a  17FBC2         LBSR 0x273f                       
  2b7d  CC000A         LDD #0xa                          
  2b80  AD9FFD20       JSR [0xfd20]                      
  2b84  108E036F       LDY #0x36f                        
  2b88  FC70EA         LDD 0x70ea                        
  2b8b  AD9FFD2E       JSR [0xfd2e]                      
  2b8f  CC000A         LDD #0xa                          
  2b92  AD9FFD20       JSR [0xfd20]                      
  2b96  108E0370       LDY #0x370                        
  2b9a  FC7062         LDD 0x7062                        
  2b9d  AD9FFD2E       JSR [0xfd2e]                      
  2ba1  17FC20         LBSR 0x27c4                       
  2ba4  17FC30         LBSR 0x27d7                       
  2ba7  17FC8C         LBSR 0x2836                       
  2baa  CC0000         LDD #0x0                          
  2bad  FD7254         STD 0x7254                        
  2bb0  CC0003         LDD #0x3                          
  2bb3  FD7256         STD 0x7256                        
  2bb6  FC717A         LDD 0x717a                        
  2bb9  10830001       CMPD #0x1                         
  2bbd  1026003F       LBNE 0x2c00                       
  2bc1  17FF48         LBSR 0x2b0c                       
  2bc4  160039         LBRA 0x2c00                       
LAB_M78_r3_24000__2bc7:
  2bc7  17FB3C         LBSR 0x2706                       
  2bca  17FB4C         LBSR 0x2719                       
  2bcd  17FBA8         LBSR 0x2778                       
  2bd0  17FBB8         LBSR 0x278b                       
  2bd3  17FC4D         LBSR 0x2823                       
  2bd6  CC000A         LDD #0xa                          
  2bd9  AD9FFD20       JSR [0xfd20]                      
  2bdd  108E026F       LDY #0x26f                        
  2be1  FC70EA         LDD 0x70ea                        
  2be4  AD9FFD2E       JSR [0xfd2e]                      
  2be8  CC000A         LDD #0xa                          
  2beb  AD9FFD20       JSR [0xfd20]                      
  2bef  108E0270       LDY #0x270                        
  2bf3  FC7062         LDD 0x7062                        
  2bf6  AD9FFD2E       JSR [0xfd2e]                      
  2bfa  CC0002         LDD #0x2                          
  2bfd  FD7256         STD 0x7256                        
LAB_M78_r3_24000__2c00:
  2c00  3576           PULS  A B X Y U                   
  2c02  39             RTS                               

; ---- function FUN_M78_r3_24000__2c03
FUN_M78_r3_24000__2c03:
  2c03  3476           PSHS  U Y X B A                   
  2c05  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0016 $7188
  2c09  0016           dw 16h                            
  2c0b  7188           dw 7188h                          
LAB_M78_r3_24000__2c0d:
  2c0d  AD9FFD3E       JSR [0xfd3e]                      
  2c11  10830001       CMPD #0x1                         
  2c15  2706           BEQ 0x2c1d                        
  2c17  17008A         LBSR 0x2ca4                       
  2c1a  160084         LBRA 0x2ca1                       
LAB_M78_r3_24000__2c1d:
  2c1d  17010A         LBSR 0x2d2a                       
  2c20  1026007D       LBNE 0x2ca1                       
  2c24  FC7090         LDD 0x7090                        
  2c27  10830000       CMPD #0x0                         
  2c2b  1027000A       LBEQ 0x2c39                       
  2c2f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0034 $7188
  2c33  0034           dw 34h                            
  2c35  7188           dw 7188h                          
LAB_M78_r3_24000__2c37:
  2c37  2008           BRA 0x2c41                        
LAB_M78_r3_24000__2c39:
  2c39  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0010 $7188
  2c3d  0010           dw 10h                            
  2c3f  7188           dw 7188h                          
LAB_M78_r3_24000__2c41:
  2c41  FC738F         LDD 0x738f                        
  2c44  2605           BNE 0x2c4b                        
  2c46  1700F0         LBSR 0x2d39                       
  2c49  2656           BNE 0x2ca1                        
LAB_M78_r3_24000__2c4b:
  2c4b  FC717A         LDD 0x717a                        
  2c4e  2608           BNE 0x2c58                        
  2c50  1700F5         LBSR 0x2d48                       
  2c53  2603           BNE 0x2c58                        
  2c55  17FD5C         LBSR 0x29b4                       
LAB_M78_r3_24000__2c58:
  2c58  FC738F         LDD 0x738f                        
  2c5b  2744           BEQ 0x2ca1                        
  2c5d  1700F4         LBSR 0x2d54                       
  2c60  2713           BEQ 0x2c75                        
  2c62  CC0000         LDD #0x0                          
  2c65  FD738F         STD 0x738f                        
  2c68  170076         LBSR 0x2ce1                       
  2c6b  FC7180         LDD 0x7180                        
  2c6e  2631           BNE 0x2ca1                        
  2c70  17FBD6         LBSR 0x2849                       
  2c73  202C           BRA 0x2ca1                        
LAB_M78_r3_24000__2c75:
  2c75  FC738B         LDD 0x738b                        
  2c78  C30001         ADDD #0x1                         
  2c7b  FD738B         STD 0x738b                        
  2c7e  10830008       CMPD #0x8                         
  2c82  2D1D           BLT 0x2ca1                        
  2c84  CC0001         LDD #0x1                          
  2c87  FD7180         STD 0x7180                        
  2c8a  C61C           LDB #0x1c                         
  2c8c  AD9FFC36       JSR [0xfc36]                      
  2c90  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "--looping---"
  2c94  2D2D6C6F6F70.. char[13] "--looping---"           
LAB_M78_r3_24000__2ca1:
  2ca1  3576           PULS  A B X Y U                   
  2ca3  39             RTS                               

; ---- function FUN_M78_r3_24000__2ca4
FUN_M78_r3_24000__2ca4:
  2ca4  3476           PSHS  U Y X B A                   
  2ca6  CC26A8         LDD #0x26a8                       
  2ca9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2cad  6013           addr 6013                         
LAB_M78_r3_24000__2caf:
  2caf  CC0000         LDD #0x0                          
  2cb2  FD717C         STD 0x717c                        
  2cb5  FD7180         STD 0x7180                        
  2cb8  17006F         LBSR 0x2d2a                       
  2cbb  2621           BNE 0x2cde                        
  2cbd  170021         LBSR 0x2ce1                       
  2cc0  C61C           LDB #0x1c                         
  2cc2  AD9FFC36       JSR [0xfc36]                      
  2cc6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "--stopped--"
  2cca  2D2D73746F70.. char[12] "--stopped--"            
LAB_M78_r3_24000__2cd6:
  2cd6  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  2cda  003C           dw 3Ch                            
  2cdc  7188           dw 7188h                          
LAB_M78_r3_24000__2cde:
  2cde  3576           PULS  A B X Y U                   
  2ce0  39             RTS                               

; ---- function FUN_M78_r3_24000__2ce1
FUN_M78_r3_24000__2ce1:
  2ce1  3476           PSHS  U Y X B A                   
  2ce3  CC285C         LDD #0x285c                       
  2ce6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  2cea  60E7           addr 60e7                         
LAB_M78_r3_24000__2cec:
  2cec  CC289D         LDD #0x289d                       
  2cef  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  2cf3  60E9           addr 60e9                         
LAB_M78_r3_24000__2cf5:
  2cf5  3576           PULS  A B X Y U                   
  2cf7  39             RTS                               

; ---- function FUN_M78_r3_24000__2cf8
FUN_M78_r3_24000__2cf8:
  2cf8  3476           PSHS  U Y X B A                   
  2cfa  CC26A8         LDD #0x26a8                       
  2cfd  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E7
  2d01  60E7           addr 60e7                         
LAB_M78_r3_24000__2d03:
  2d03  CC26A8         LDD #0x26a8                       
  2d06  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  2d0a  60E9           addr 60e9                         
LAB_M78_r3_24000__2d0c:
  2d0c  3576           PULS  A B X Y U                   
  2d0e  39             RTS                               

; ---- function FUN_M78_r3_24000__2d0f
FUN_M78_r3_24000__2d0f:
  2d0f  3476           PSHS  U Y X B A                   
  2d11  CC28DE         LDD #0x28de                       
  2d14  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2d18  6070           addr 6070                         
LAB_M78_r3_24000__2d1a:
  2d1a  CC26A8         LDD #0x26a8                       
  2d1d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  2d21  6072           addr 6072                         
LAB_M78_r3_24000__2d23:
  2d23  AD9FFC14       JSR [0xfc14]                      
  2d27  3576           PULS  A B X Y U                   
  2d29  39             RTS                               

; ---- function FUN_M78_r3_24000__2d2a
FUN_M78_r3_24000__2d2a:
  2d2a  3406           PSHS  B A                         
  2d2c  FC6070         LDD 0x6070                        
  2d2f  B3600D         SUBD 0x600d                       
  2d32  108328DE       CMPD #0x28de                      
  2d36  3506           PULS  A B                         
  2d38  39             RTS                               

; ---- function FUN_M78_r3_24000__2d39
FUN_M78_r3_24000__2d39:
  2d39  3406           PSHS  B A                         
  2d3b  FC60E7         LDD 0x60e7                        
  2d3e  B3600D         SUBD 0x600d                       
  2d41  1083285C       CMPD #0x285c                      
  2d45  3506           PULS  A B                         
  2d47  39             RTS                               

; ---- function FUN_M78_r3_24000__2d48
FUN_M78_r3_24000__2d48:
  2d48  3416           PSHS  X B A                       
  2d4a  8E604E         LDX #0x604e                       
  2d4d  8610           LDA #0x10                         
  2d4f  A401           ANDA 0x1,X                        
  2d51  3516           PULS  A B X                       
  2d53  39             RTS                               

; ---- function FUN_M78_r3_24000__2d54
FUN_M78_r3_24000__2d54:
  2d54  3416           PSHS  X B A                       
  2d56  8E604E         LDX #0x604e                       
  2d59  8602           LDA #0x2                          
  2d5b  A401           ANDA 0x1,X                        
  2d5d  3516           PULS  A B X                       
  2d5f  39             RTS                               

;; Module 78 code record 04, 2458 bytes, entered at payload start
MODULE_78_04_CODE_hdr:
  2d60  780409A20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_78_04_entry
MODULE_78_04_entry:
  2d68  39             RTS                               

; ---- function FUN_M78_r3_24000__2d69
FUN_M78_r3_24000__2d69:
  2d69  3406           PSHS  B A                         
  2d6b  FC6070         LDD 0x6070                        
  2d6e  B3600D         SUBD 0x600d                       
  2d71  10832D68       CMPD #0x2d68                      
  2d75  3506           PULS  A B                         
  2d77  39             RTS                               

; ---- function FUN_M78_r3_24000__2d78
FUN_M78_r3_24000__2d78:
  2d78  3406           PSHS  B A                         
  2d7a  CC0000         LDD #0x0                          
  2d7d  FD7391         STD 0x7391                        
  2d80  FD7393         STD 0x7393                        
  2d83  3506           PULS  A B                         
  2d85  39             RTS                               

; ---- function FUN_M78_r3_24000__2d86
FUN_M78_r3_24000__2d86:
  2d86  39             RTS                               

; ---- function FUN_M78_r3_24000__2d87
FUN_M78_r3_24000__2d87:
  2d87  3476           PSHS  U Y X B A                   
  2d89  170949         LBSR 0x36d5                       
  2d8c  CC2D86         LDD #0x2d86                       
  2d8f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  2d93  6011           addr 6011                         
LAB_M78_r3_24000__2d95:
  2d95  CC2D86         LDD #0x2d86                       
  2d98  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2d9c  6013           addr 6013                         
LAB_M78_r3_24000__2d9e:
  2d9e  FC7391         LDD 0x7391                        
  2da1  10830000       CMPD #0x0                         
  2da5  1027007C       LBEQ 0x2e25                       
  2da9  C600           LDB #0x0                          
  2dab  AD9FFC36       JSR [0xfc36]                      
  2daf  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "Select record destination:              "
  2db3  53656C656374.. char[41] "Select record destination:              "
LAB_M78_r3_24000__2ddc:
  2ddc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "record 1" "record 2" [*] [*]
  2de0  7265636F7264.. ds "record 1"                     
  2de8  7265636F7264.. ds "record 2"                     
  2df0  01             db 1h                             
  2df1  01             db 1h                             
LAB_M78_r3_24000__2df2:
  2df2  AD9FFDF2       JSR [0xfdf2]                      
  2df6  FC7391         LDD 0x7391                        
  2df9  10830001       CMPD #0x1                         
  2dfd  2713           BEQ 0x2e12                        
  2dff  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2E95 ->$2E5D ->$2D86 ->$2D86 ->$312D ->$312D
  2e03  2E95           addr M78_r3_24000::2e95           
  2e05  2E5D           addr M78_r3_24000::2e5d           
  2e07  2D86           addr M78_r3_24000::2d86           
  2e09  2D86           addr M78_r3_24000::2d86           
  2e0b  312D           addr M78_r3_24000::312d           
  2e0d  312D           addr M78_r3_24000::312d           
LAB_M78_r3_24000__2e0f:
  2e0f  160016         LBRA 0x2e28                       
LAB_M78_r3_24000__2e12:
  2e12  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2E2B ->$2E5D ->$2D86 ->$2D86 ->$312D ->$312D
  2e16  2E2B           addr M78_r3_24000::2e2b           
  2e18  2E5D           addr M78_r3_24000::2e5d           
  2e1a  2D86           addr M78_r3_24000::2d86           
  2e1c  2D86           addr M78_r3_24000::2d86           
  2e1e  312D           addr M78_r3_24000::312d           
  2e20  312D           addr M78_r3_24000::312d           
LAB_M78_r3_24000__2e22:
  2e22  160003         LBRA 0x2e28                       
LAB_M78_r3_24000__2e25:
  2e25  170003         LBSR 0x2e2b                       
LAB_M78_r3_24000__2e28:
  2e28  3576           PULS  A B X Y U                   
  2e2a  39             RTS                               

; ---- function FUN_M78_r3_24000__2e2b
FUN_M78_r3_24000__2e2b:
  2e2b  3476           PSHS  U Y X B A                   
  2e2d  1708A5         LBSR 0x36d5                       
  2e30  CC0001         LDD #0x1                          
  2e33  FD7395         STD 0x7395                        
  2e36  CC0000         LDD #0x0                          
  2e39  FD7397         STD 0x7397                        
  2e3c  CC0001         LDD #0x1                          
  2e3f  FD7393         STD 0x7393                        
  2e42  CC0000         LDD #0x0                          
  2e45  FD726C         STD 0x726c                        
  2e48  FD726E         STD 0x726e                        
  2e4b  FC714E         LDD 0x714e                        
  2e4e  FD7270         STD 0x7270                        
  2e51  FC7150         LDD 0x7150                        
  2e54  FD7272         STD 0x7272                        
  2e57  170073         LBSR 0x2ecd                       
  2e5a  3576           PULS  A B X Y U                   
  2e5c  39             RTS                               

; ---- function FUN_M78_r3_24000__2e5d
FUN_M78_r3_24000__2e5d:
  2e5d  3476           PSHS  U Y X B A                   
  2e5f  170873         LBSR 0x36d5                       
  2e62  CC0000         LDD #0x0                          
  2e65  FD7395         STD 0x7395                        
  2e68  CC0001         LDD #0x1                          
  2e6b  FD7397         STD 0x7397                        
  2e6e  CC0002         LDD #0x2                          
  2e71  FD7393         STD 0x7393                        
  2e74  FC70F0         LDD 0x70f0                        
  2e77  C30023         ADDD #0x23                        
  2e7a  FD726C         STD 0x726c                        
  2e7d  FC70F2         LDD 0x70f2                        
  2e80  FD726E         STD 0x726e                        
  2e83  FC714E         LDD 0x714e                        
  2e86  FD7270         STD 0x7270                        
  2e89  FC7150         LDD 0x7150                        
  2e8c  FD7272         STD 0x7272                        
  2e8f  17003B         LBSR 0x2ecd                       
  2e92  3576           PULS  A B X Y U                   
  2e94  39             RTS                               

; ---- function FUN_M78_r3_24000__2e95
FUN_M78_r3_24000__2e95:
  2e95  3476           PSHS  U Y X B A                   
  2e97  17083B         LBSR 0x36d5                       
  2e9a  CC0001         LDD #0x1                          
  2e9d  FD7395         STD 0x7395                        
  2ea0  CC0000         LDD #0x0                          
  2ea3  FD7397         STD 0x7397                        
  2ea6  FC7391         LDD 0x7391                        
  2ea9  FD7393         STD 0x7393                        
  2eac  FC70EC         LDD 0x70ec                        
  2eaf  FD726C         STD 0x726c                        
  2eb2  FC70EE         LDD 0x70ee                        
  2eb5  FD726E         STD 0x726e                        
  2eb8  FC70F0         LDD 0x70f0                        
  2ebb  C30022         ADDD #0x22                        
  2ebe  FD7270         STD 0x7270                        
  2ec1  FC70F2         LDD 0x70f2                        
  2ec4  FD7272         STD 0x7272                        
  2ec7  170003         LBSR 0x2ecd                       
  2eca  3576           PULS  A B X Y U                   
  2ecc  39             RTS                               

; ---- function FUN_M78_r3_24000__2ecd
FUN_M78_r3_24000__2ecd:
  2ecd  3476           PSHS  U Y X B A                   
  2ecf  FC7090         LDD 0x7090                        
  2ed2  10830000       CMPD #0x0                         
  2ed6  1027002C       LBEQ 0x2f06                       
  2eda  FC726C         LDD 0x726c                        
  2edd  F37152         ADDD 0x7152                       
  2ee0  FD7274         STD 0x7274                        
  2ee3  FC726E         LDD 0x726e                        
  2ee6  FD7276         STD 0x7276                        
  2ee9  FC7270         LDD 0x7270                        
  2eec  F37152         ADDD 0x7152                       
  2eef  FD7278         STD 0x7278                        
  2ef2  FC7272         LDD 0x7272                        
  2ef5  FD727A         STD 0x727a                        
  2ef8  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0074 $7188
  2efc  0074           dw 74h                            
  2efe  7188           dw 7188h                          
LAB_M78_r3_24000__2f00:
  2f00  17D6A8         LBSR 0x05ab                       
  2f03  160023         LBRA 0x2f29                       
LAB_M78_r3_24000__2f06:
  2f06  FC726C         LDD 0x726c                        
  2f09  FD7274         STD 0x7274                        
  2f0c  FC726E         LDD 0x726e                        
  2f0f  FD7276         STD 0x7276                        
  2f12  FC7270         LDD 0x7270                        
  2f15  FD7278         STD 0x7278                        
  2f18  FC7272         LDD 0x7272                        
  2f1b  FD727A         STD 0x727a                        
  2f1e  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0076 $7188
  2f22  0076           dw 76h                            
  2f24  7188           dw 7188h                          
LAB_M78_r3_24000__2f26:
  2f26  17D657         LBSR 0x0580                       
LAB_M78_r3_24000__2f29:
  2f29  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  2f2d  0014           dw 14h                            
  2f2f  7188           dw 7188h                          
LAB_M78_r3_24000__2f31:
  2f31  17EAF6         LBSR 0x1a2a                       
  2f34  C600           LDB #0x0                          
  2f36  AD9FFC36       JSR [0xfc36]                      
  2f3a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "       set trigger|                     "
  2f3e  202020202020.. char[41] "       set trigger|                     "
LAB_M78_r3_24000__2f67:
  2f67  17EECB         LBSR 0x1e35                       
  2f6a  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002E $7188
  2f6e  002E           dw 2Eh                            
  2f70  7188           dw 7188h                          
LAB_M78_r3_24000__2f72:
  2f72  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0030 $7188
  2f76  0030           dw 30h                            
  2f78  7188           dw 7188h                          
LAB_M78_r3_24000__2f7a:
  2f7a  CC32AE         LDD #0x32ae                       
  2f7d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  2f81  6011           addr 6011                         
LAB_M78_r3_24000__2f83:
  2f83  CC2D86         LDD #0x2d86                       
  2f86  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  2f8a  6013           addr 6013                         
LAB_M78_r3_24000__2f8c:
  2f8c  CC2D68         LDD #0x2d68                       
  2f8f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  2f93  6070           addr 6070                         
LAB_M78_r3_24000__2f95:
  2f95  3576           PULS  A B X Y U                   
  2f97  39             RTS                               

; ---- function FUN_M78_r3_24000__2f98
FUN_M78_r3_24000__2f98:
  2f98  3476           PSHS  U Y X B A                   
  2f9a  C600           LDB #0x0                          
  2f9c  AD9FFC36       JSR [0xfc36]                      
  2fa0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "       -rec ready-|                     "
  2fa4  202020202020.. char[41] "       -rec ready-|                     "
LAB_M78_r3_24000__2fcd:
  2fcd  17EE65         LBSR 0x1e35                       
  2fd0  CC000A         LDD #0xa                          
  2fd3  AD9FFD20       JSR [0xfd20]                      
  2fd7  108E015A       LDY #0x15a                        
  2fdb  CCFFFF         LDD #0xffff                       
  2fde  AD9FFD2E       JSR [0xfd2e]                      
  2fe2  3576           PULS  A B X Y U                   
  2fe4  39             RTS                               

; ---- function FUN_M78_r3_24000__2fe5
FUN_M78_r3_24000__2fe5:
  2fe5  3476           PSHS  U Y X B A                   
  2fe7  C600           LDB #0x0                          
  2fe9  AD9FFC36       JSR [0xfc36]                      
  2fed  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "       -rec ready-|                     "
  2ff1  202020202020.. char[41] "       -rec ready-|                     "
LAB_M78_r3_24000__301a:
  301a  17EE18         LBSR 0x1e35                       
  301d  CC000A         LDD #0xa                          
  3020  AD9FFD20       JSR [0xfd20]                      
  3024  108E035A       LDY #0x35a                        
  3028  CC0001         LDD #0x1                          
  302b  AD9FFD2E       JSR [0xfd2e]                      
  302f  3576           PULS  A B X Y U                   
  3031  39             RTS                               

; ---- function FUN_M78_r3_24000__3032
FUN_M78_r3_24000__3032:
  3032  3476           PSHS  U Y X B A                   
  3034  CC000A         LDD #0xa                          
  3037  AD9FFD20       JSR [0xfd20]                      
  303b  108E014E       LDY #0x14e                        
  303f  CC0001         LDD #0x1                          
  3042  AD9FFD2E       JSR [0xfd2e]                      
  3046  CC000A         LDD #0xa                          
  3049  AD9FFD20       JSR [0xfd20]                      
  304d  108E014E       LDY #0x14e                        
  3051  CC0000         LDD #0x0                          
  3054  AD9FFD2E       JSR [0xfd2e]                      
  3058  3576           PULS  A B X Y U                   
  305a  39             RTS                               

; ---- function FUN_M78_r3_24000__305b
FUN_M78_r3_24000__305b:
  305b  3476           PSHS  U Y X B A                   
  305d  CC000A         LDD #0xa                          
  3060  AD9FFD20       JSR [0xfd20]                      
  3064  108E034E       LDY #0x34e                        
  3068  CC0001         LDD #0x1                          
  306b  AD9FFD2E       JSR [0xfd2e]                      
  306f  CC000A         LDD #0xa                          
  3072  AD9FFD20       JSR [0xfd20]                      
  3076  108E034E       LDY #0x34e                        
  307a  CC0000         LDD #0x0                          
  307d  AD9FFD2E       JSR [0xfd2e]                      
  3081  3576           PULS  A B X Y U                   
  3083  39             RTS                               

; ---- function FUN_M78_r3_24000__3084
FUN_M78_r3_24000__3084:
  3084  3476           PSHS  U Y X B A                   
  3086  CC1518         LDD #0x1518                       
  3089  AD9FFD20       JSR [0xfd20]                      
  308d  CC000A         LDD #0xa                          
  3090  AD9FFD20       JSR [0xfd20]                      
  3094  108E034F       LDY #0x34f                        
  3098  CC0001         LDD #0x1                          
  309b  AD9FFD2E       JSR [0xfd2e]                      
  309f  CC000A         LDD #0xa                          
  30a2  AD9FFD20       JSR [0xfd20]                      
  30a6  108E034F       LDY #0x34f                        
  30aa  CC0000         LDD #0x0                          
  30ad  AD9FFD2E       JSR [0xfd2e]                      
  30b1  3576           PULS  A B X Y U                   
  30b3  39             RTS                               

; ---- function FUN_M78_r3_24000__30b4
FUN_M78_r3_24000__30b4:
  30b4  3476           PSHS  U Y X B A                   
  30b6  17FCB0         LBSR 0x2d69                       
  30b9  2711           BEQ 0x30cc                        
  30bb  FC603A         LDD 0x603a                        
  30be  FD73AB         STD 0x73ab                        
  30c1  CC30DE         LDD #0x30de                       
  30c4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  30c8  603A           addr 603a                         
LAB_M78_r3_24000__30ca:
  30ca  2003           BRA 0x30cf                        
LAB_M78_r3_24000__30cc:
  30cc  17001B         LBSR 0x30ea                       
LAB_M78_r3_24000__30cf:
  30cf  CC333E         LDD #0x333e                       
  30d2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  30d6  6011           addr 6011                         
LAB_M78_r3_24000__30d8:
  30d8  17040D         LBSR 0x34e8                       
  30db  3576           PULS  A B X Y U                   
  30dd  39             RTS                               

; ---- function FUN_M78_r3_24000__30de
FUN_M78_r3_24000__30de:
  30de  3476           PSHS  U Y X B A                   
  30e0  AD9F73AB       JSR [0x73ab]                      
  30e4  170003         LBSR 0x30ea                       
  30e7  3576           PULS  A B X Y U                   
  30e9  39             RTS                               

; ---- function FUN_M78_r3_24000__30ea
FUN_M78_r3_24000__30ea:
  30ea  3476           PSHS  U Y X B A                   
  30ec  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  30f0  0014           dw 14h                            
  30f2  7188           dw 7188h                          
LAB_M78_r3_24000__30f4:
  30f4  C600           LDB #0x0                          
  30f6  AD9FFC36       JSR [0xfc36]                      
  30fa  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "       -recording-|                     "
  30fe  202020202020.. char[41] "       -recording-|                     "
LAB_M78_r3_24000__3127:
  3127  17D4AC         LBSR 0x05d6                       
  312a  3576           PULS  A B X Y U                   
  312c  39             RTS                               

; ---- function FUN_M78_r3_24000__312d
FUN_M78_r3_24000__312d:
  312d  3476           PSHS  U Y X B A                   
  312f  CC2D86         LDD #0x2d86                       
  3132  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  3136  6011           addr 6011                         
LAB_M78_r3_24000__3138:
  3138  CC000A         LDD #0xa                          
  313b  AD9FFD20       JSR [0xfd20]                      
  313f  108E034F       LDY #0x34f                        
  3143  CC0001         LDD #0x1                          
  3146  AD9FFD2E       JSR [0xfd2e]                      
  314a  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  314e  0038           dw 38h                            
  3150  7188           dw 7188h                          
LAB_M78_r3_24000__3152:
  3152  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  3156  003A           dw 3Ah                            
  3158  7188           dw 7188h                          
LAB_M78_r3_24000__315a:
  315a  17D3EA         LBSR 0x0547                       
  315d  17FBAF         LBSR 0x2d0f                       
  3160  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  3164  003C           dw 3Ch                            
  3166  7188           dw 7188h                          
LAB_M78_r3_24000__3168:
  3168  170589         LBSR 0x36f4                       
  316b  3576           PULS  A B X Y U                   
  316d  39             RTS                               

; ---- function FUN_M78_r3_24000__316e
FUN_M78_r3_24000__316e:
  316e  3476           PSHS  U Y X B A                   
  3170  17FBF6         LBSR 0x2d69                       
  3173  2711           BEQ 0x3186                        
  3175  FC603A         LDD 0x603a                        
  3178  FD73AB         STD 0x73ab                        
  317b  CC3263         LDD #0x3263                       
  317e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $603A
  3182  603A           addr 603a                         
LAB_M78_r3_24000__3184:
  3184  2032           BRA 0x31b8                        
LAB_M78_r3_24000__3186:
  3186  C607           LDB #0x7                          
  3188  AD9FFC36       JSR [0xfc36]                      
  318c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "--stopped--|                     "
  3190  2D2D73746F70.. char[34] "--stopped--|                     "
LAB_M78_r3_24000__31b2:
  31b2  17D392         LBSR 0x0547                       
  31b5  17FB57         LBSR 0x2d0f                       
LAB_M78_r3_24000__31b8:
  31b8  CC2D86         LDD #0x2d86                       
  31bb  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  31bf  6011           addr 6011                         
LAB_M78_r3_24000__31c1:
  31c1  CC339B         LDD #0x339b                       
  31c4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $7252
  31c8  7252           addr 7252                         
LAB_M78_r3_24000__31ca:
  31ca  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0018 $7188
  31ce  0018           dw 18h                            
  31d0  7188           dw 7188h                          
LAB_M78_r3_24000__31d2:
  31d2  AD9FFD3A       JSR [0xfd3a]                      
  31d6  FD7270         STD 0x7270                        
  31d9  AD9FFD3E       JSR [0xfd3e]                      
  31dd  FD7272         STD 0x7272                        
  31e0  170370         LBSR 0x3553                       
  31e3  FC7270         LDD 0x7270                        
  31e6  830022         SUBD #0x22                        
  31e9  2C03           BGE 0x31ee                        
  31eb  CC0000         LDD #0x0                          
LAB_M78_r3_24000__31ee:
  31ee  FD7270         STD 0x7270                        
  31f1  FC7395         LDD 0x7395                        
  31f4  2718           BEQ 0x320e                        
  31f6  FC726C         LDD 0x726c                        
  31f9  FD70EC         STD 0x70ec                        
  31fc  FC726E         LDD 0x726e                        
  31ff  FD70EE         STD 0x70ee                        
  3202  FC7270         LDD 0x7270                        
  3205  FD70F0         STD 0x70f0                        
  3208  FC7272         LDD 0x7272                        
  320b  FD70F2         STD 0x70f2                        
LAB_M78_r3_24000__320e:
  320e  FC7397         LDD 0x7397                        
  3211  2718           BEQ 0x322b                        
  3213  FC726C         LDD 0x726c                        
  3216  FD70F4         STD 0x70f4                        
  3219  FC726E         LDD 0x726e                        
  321c  FD70F6         STD 0x70f6                        
  321f  FC7270         LDD 0x7270                        
  3222  FD70F8         STD 0x70f8                        
  3225  FC7272         LDD 0x7272                        
  3228  FD70FA         STD 0x70fa                        
LAB_M78_r3_24000__322b:
  322b  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  322f  0038           dw 38h                            
  3231  7188           dw 7188h                          
LAB_M78_r3_24000__3233:
  3233  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  3237  003A           dw 3Ah                            
  3239  7188           dw 7188h                          
LAB_M78_r3_24000__323b:
  323b  170456         LBSR 0x3694                       
  323e  17DB05         LBSR 0x0d46                       
  3241  17DD2F         LBSR 0x0f73                       
  3244  17DEE9         LBSR 0x1130                       
  3247  17E086         LBSR 0x12d0                       
  324a  FC7393         LDD 0x7393                        
  324d  FD7391         STD 0x7391                        
  3250  1704A1         LBSR 0x36f4                       
  3253  17FB13         LBSR 0x2d69                       
  3256  2608           BNE 0x3260                        
  3258  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  325c  003C           dw 3Ch                            
  325e  7188           dw 7188h                          
LAB_M78_r3_24000__3260:
  3260  3576           PULS  A B X Y U                   
  3262  39             RTS                               

; ---- function FUN_M78_r3_24000__3263
FUN_M78_r3_24000__3263:
  3263  3476           PSHS  U Y X B A                   
  3265  AD9F73AB       JSR [0x73ab]                      
  3269  170003         LBSR 0x326f                       
  326c  3576           PULS  A B X Y U                   
  326e  39             RTS                               

; ---- function FUN_M78_r3_24000__326f
FUN_M78_r3_24000__326f:
  326f  3476           PSHS  U Y X B A                   
  3271  C607           LDB #0x7                          
  3273  AD9FFC36       JSR [0xfc36]                      
  3277  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "--stopped--|                     "
  327b  2D2D73746F70.. char[34] "--stopped--|                     "
LAB_M78_r3_24000__329d:
  329d  17D2A7         LBSR 0x0547                       
  32a0  17FA6C         LBSR 0x2d0f                       
  32a3  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  32a7  003C           dw 3Ch                            
  32a9  7188           dw 7188h                          
LAB_M78_r3_24000__32ab:
  32ab  3576           PULS  A B X Y U                   
  32ad  39             RTS                               

; ---- function FUN_M78_r3_24000__32ae
FUN_M78_r3_24000__32ae:
  32ae  3476           PSHS  U Y X B A                   
  32b0  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  32b4  0014           dw 14h                            
  32b6  7188           dw 7188h                          
LAB_M78_r3_24000__32b8:
  32b8  AD9FFD3E       JSR [0xfd3e]                      
  32bc  10830003       CMPD #0x3                         
  32c0  2605           BNE 0x32c7                        
  32c2  17FDEF         LBSR 0x30b4                       
  32c5  2074           BRA 0x333b                        
LAB_M78_r3_24000__32c7:
  32c7  17FA9F         LBSR 0x2d69                       
  32ca  266F           BNE 0x333b                        
  32cc  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  32d0  0014           dw 14h                            
  32d2  7188           dw 7188h                          
LAB_M78_r3_24000__32d4:
  32d4  AD9FFD3A       JSR [0xfd3a]                      
  32d8  FD73A7         STD 0x73a7                        
  32db  FC7090         LDD 0x7090                        
  32de  10830000       CMPD #0x0                         
  32e2  10270015       LBEQ 0x32fb                       
  32e6  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0016 $7188
  32ea  0016           dw 16h                            
  32ec  7188           dw 7188h                          
LAB_M78_r3_24000__32ee:
  32ee  AD9FFD3A       JSR [0xfd3a]                      
  32f2  10B373A7       CMPD 0x73a7                       
  32f6  2D03           BLT 0x32fb                        
  32f8  FD73A7         STD 0x73a7                        
LAB_M78_r3_24000__32fb:
  32fb  FC73A7         LDD 0x73a7                        
  32fe  3606           PSHU  B A                         
  3300  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0028 $7188
  3304  0028           dw 28h                            
  3306  7188           dw 7188h                          
LAB_M78_r3_24000__3308:
  3308  3706           PULU  A B                         
  330a  3606           PSHU  B A                         
  330c  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001E $7188
  3310  001E           dw 1Eh                            
  3312  7188           dw 7188h                          
LAB_M78_r3_24000__3314:
  3314  3606           PSHU  B A                         
  3316  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0020 $7188
  331a  0020           dw 20h                            
  331c  7188           dw 7188h                          
LAB_M78_r3_24000__331e:
  331e  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0022 $7188
  3322  0022           dw 22h                            
  3324  7188           dw 7188h                          
LAB_M78_r3_24000__3326:
  3326  FC70C8         LDD 0x70c8                        
  3329  3606           PSHU  B A                         
  332b  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0024 $7188
  332f  0024           dw 24h                            
  3331  7188           dw 7188h                          
LAB_M78_r3_24000__3333:
  3333  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0026 $7188
  3337  0026           dw 26h                            
  3339  7188           dw 7188h                          
LAB_M78_r3_24000__333b:
  333b  3576           PULS  A B X Y U                   
  333d  39             RTS                               

; ---- function FUN_M78_r3_24000__333e
FUN_M78_r3_24000__333e:
  333e  3476           PSHS  U Y X B A                   
  3340  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  3344  0014           dw 14h                            
  3346  7188           dw 7188h                          
LAB_M78_r3_24000__3348:
  3348  AD9FFD3E       JSR [0xfd3e]                      
  334c  10830003       CMPD #0x3                         
  3350  2705           BEQ 0x3357                        
  3352  17FE19         LBSR 0x316e                       
  3355  2041           BRA 0x3398                        
LAB_M78_r3_24000__3357:
  3357  17FA0F         LBSR 0x2d69                       
  335a  263C           BNE 0x3398                        
  335c  AD9FFD3A       JSR [0xfd3a]                      
  3360  3606           PSHU  B A                         
  3362  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0028 $7188
  3366  0028           dw 28h                            
  3368  7188           dw 7188h                          
LAB_M78_r3_24000__336a:
  336a  3706           PULU  A B                         
  336c  3606           PSHU  B A                         
  336e  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001E $7188
  3372  001E           dw 1Eh                            
  3374  7188           dw 7188h                          
LAB_M78_r3_24000__3376:
  3376  3606           PSHU  B A                         
  3378  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0020 $7188
  337c  0020           dw 20h                            
  337e  7188           dw 7188h                          
LAB_M78_r3_24000__3380:
  3380  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0022 $7188
  3384  0022           dw 22h                            
  3386  7188           dw 7188h                          
LAB_M78_r3_24000__3388:
  3388  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0026 $7188
  338c  0026           dw 26h                            
  338e  7188           dw 7188h                          
LAB_M78_r3_24000__3390:
  3390  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000E $7188
  3394  000E           dw Eh                             
  3396  7188           dw 7188h                          
LAB_M78_r3_24000__3398:
  3398  3576           PULS  A B X Y U                   
  339a  39             RTS                               

; ---- function FUN_M78_r3_24000__339b
FUN_M78_r3_24000__339b:
  339b  3476           PSHS  U Y X B A                   
  339d  FC7182         LDD 0x7182                        
  33a0  10830001       CMPD #0x1                         
  33a4  10260032       LBNE 0x33da                       
  33a8  AD9FFD4A       JSR [0xfd4a]                      
  33ac  FD73A7         STD 0x73a7                        
  33af  CC4000         LDD #0x4000                       
  33b2  B473A7         ANDA 0x73a7                       
  33b5  F473A8         ANDB 0x73a8                       
  33b8  10830000       CMPD #0x0                         
  33bc  2617           BNE 0x33d5                        
  33be  FD7182         STD 0x7182                        
  33c1  FC7184         LDD 0x7184                        
  33c4  10830002       CMPD #0x2                         
  33c8  10260009       LBNE 0x33d5                       
  33cc  CC0001         LDD #0x1                          
  33cf  FD7184         STD 0x7184                        
  33d2  1701DD         LBSR 0x35b2                       
LAB_M78_r3_24000__33d5:
  33d5  170040         LBSR 0x3418                       
  33d8  203B           BRA 0x3415                        
LAB_M78_r3_24000__33da:
  33da  FC7184         LDD 0x7184                        
  33dd  10830001       CMPD #0x1                         
  33e1  10260030       LBNE 0x3415                       
  33e5  AD9FFD4A       JSR [0xfd4a]                      
  33e9  FD73A7         STD 0x73a7                        
  33ec  CC4000         LDD #0x4000                       
  33ef  B473A7         ANDA 0x73a7                       
  33f2  F473A8         ANDB 0x73a8                       
  33f5  10830000       CMPD #0x0                         
  33f9  2617           BNE 0x3412                        
  33fb  FD7184         STD 0x7184                        
  33fe  FC7182         LDD 0x7182                        
  3401  10830002       CMPD #0x2                         
  3405  10260009       LBNE 0x3412                       
  3409  CC0001         LDD #0x1                          
  340c  FD7182         STD 0x7182                        
  340f  1701A0         LBSR 0x35b2                       
LAB_M78_r3_24000__3412:
  3412  17006B         LBSR 0x3480                       
LAB_M78_r3_24000__3415:
  3415  3576           PULS  A B X Y U                   
  3417  39             RTS                               

; ---- function FUN_M78_r3_24000__3418
FUN_M78_r3_24000__3418:
  3418  3476           PSHS  U Y X B A                   
  341a  17F90D         LBSR 0x2d2a                       
  341d  265E           BNE 0x347d                        
  341f  FC7399         LDD 0x7399                        
  3422  C30001         ADDD #0x1                         
  3425  FD7399         STD 0x7399                        
  3428  FC7399         LDD 0x7399                        
  342b  10830019       CMPD #0x19                        
  342f  10270042       LBEQ 0x3475                       
  3433  FC7182         LDD 0x7182                        
  3436  10830000       CMPD #0x0                         
  343a  10270037       LBEQ 0x3475                       
  343e  FC7399         LDD 0x7399                        
  3441  10830001       CMPD #0x1                         
  3445  10270013       LBEQ 0x345c                       
  3449  FC7399         LDD 0x7399                        
  344c  10830032       CMPD #0x32                        
  3450  102D0029       LBLT 0x347d                       
  3454  CC0000         LDD #0x0                          
  3457  FD7399         STD 0x7399                        
  345a  2021           BRA 0x347d                        
LAB_M78_r3_24000__345c:
  345c  C607           LDB #0x7                          
  345e  AD9FFC36       JSR [0xfc36]                      
  3462  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "-analyzing--"
  3466  2D616E616C79.. char[13] "-analyzing--"           
LAB_M78_r3_24000__3473:
  3473  2008           BRA 0x347d                        
LAB_M78_r3_24000__3475:
  3475  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  3479  003C           dw 3Ch                            
  347b  7188           dw 7188h                          
LAB_M78_r3_24000__347d:
  347d  3576           PULS  A B X Y U                   
  347f  39             RTS                               

; ---- function FUN_M78_r3_24000__3480
FUN_M78_r3_24000__3480:
  3480  3476           PSHS  U Y X B A                   
  3482  17F8A5         LBSR 0x2d2a                       
  3485  265E           BNE 0x34e5                        
  3487  FC7399         LDD 0x7399                        
  348a  C30001         ADDD #0x1                         
  348d  FD7399         STD 0x7399                        
  3490  FC7399         LDD 0x7399                        
  3493  10830019       CMPD #0x19                        
  3497  10270042       LBEQ 0x34dd                       
  349b  FC7184         LDD 0x7184                        
  349e  10830000       CMPD #0x0                         
  34a2  10270037       LBEQ 0x34dd                       
  34a6  FC7399         LDD 0x7399                        
  34a9  10830001       CMPD #0x1                         
  34ad  10270013       LBEQ 0x34c4                       
  34b1  FC7399         LDD 0x7399                        
  34b4  10830032       CMPD #0x32                        
  34b8  102D0029       LBLT 0x34e5                       
  34bc  CC0000         LDD #0x0                          
  34bf  FD7399         STD 0x7399                        
  34c2  2021           BRA 0x34e5                        
LAB_M78_r3_24000__34c4:
  34c4  C61C           LDB #0x1c                         
  34c6  AD9FFC36       JSR [0xfc36]                      
  34ca  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "-analyzing--"
  34ce  2D616E616C79.. char[13] "-analyzing--"           
LAB_M78_r3_24000__34db:
  34db  2008           BRA 0x34e5                        
LAB_M78_r3_24000__34dd:
  34dd  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  34e1  003C           dw 3Ch                            
  34e3  7188           dw 7188h                          
LAB_M78_r3_24000__34e5:
  34e5  3576           PULS  A B X Y U                   
  34e7  39             RTS                               

; ---- function FUN_M78_r3_24000__34e8
FUN_M78_r3_24000__34e8:
  34e8  3476           PSHS  U Y X B A                   
  34ea  FC7395         LDD 0x7395                        
  34ed  10830001       CMPD #0x1                         
  34f1  1027000D       LBEQ 0x3502                       
  34f5  FC7397         LDD 0x7397                        
  34f8  10830001       CMPD #0x1                         
  34fc  10270029       LBEQ 0x3529                       
  3500  204E           BRA 0x3550                        
LAB_M78_r3_24000__3502:
  3502  FC7184         LDD 0x7184                        
  3505  10830001       CMPD #0x1                         
  3509  10270011       LBEQ 0x351e                       
  350d  1700D1         LBSR 0x35e1                       
  3510  1700E5         LBSR 0x35f8                       
  3513  170161         LBSR 0x3677                       
  3516  CC0001         LDD #0x1                          
  3519  FD7182         STD 0x7182                        
  351c  2032           BRA 0x3550                        
LAB_M78_r3_24000__351e:
  351e  170118         LBSR 0x3639                       
  3521  CC0002         LDD #0x2                          
  3524  FD7182         STD 0x7182                        
  3527  2027           BRA 0x3550                        
LAB_M78_r3_24000__3529:
  3529  FC7182         LDD 0x7182                        
  352c  10830001       CMPD #0x1                         
  3530  10270011       LBEQ 0x3545                       
  3534  1700AA         LBSR 0x35e1                       
  3537  1700BE         LBSR 0x35f8                       
  353a  17013A         LBSR 0x3677                       
  353d  CC0001         LDD #0x1                          
  3540  FD7184         STD 0x7184                        
  3543  200B           BRA 0x3550                        
LAB_M78_r3_24000__3545:
  3545  1700F1         LBSR 0x3639                       
  3548  CC0002         LDD #0x2                          
  354b  FD7184         STD 0x7184                        
  354e  2000           BRA 0x3550                        
LAB_M78_r3_24000__3550:
  3550  3576           PULS  A B X Y U                   
  3552  39             RTS                               

; ---- function FUN_M78_r3_24000__3553
FUN_M78_r3_24000__3553:
  3553  3476           PSHS  U Y X B A                   
  3555  FC7395         LDD 0x7395                        
  3558  10830001       CMPD #0x1                         
  355c  1027000D       LBEQ 0x356d                       
  3560  FC7397         LDD 0x7397                        
  3563  10830001       CMPD #0x1                         
  3567  10270023       LBEQ 0x358e                       
  356b  2042           BRA 0x35af                        
LAB_M78_r3_24000__356d:
  356d  FC7184         LDD 0x7184                        
  3570  10830001       CMPD #0x1                         
  3574  1027000B       LBEQ 0x3583                       
  3578  17007D         LBSR 0x35f8                       
  357b  CC0001         LDD #0x1                          
  357e  FD7182         STD 0x7182                        
  3581  202C           BRA 0x35af                        
LAB_M78_r3_24000__3583:
  3583  1700B3         LBSR 0x3639                       
  3586  CC0002         LDD #0x2                          
  3589  FD7182         STD 0x7182                        
  358c  2021           BRA 0x35af                        
LAB_M78_r3_24000__358e:
  358e  FC7182         LDD 0x7182                        
  3591  10830001       CMPD #0x1                         
  3595  1027000B       LBEQ 0x35a4                       
  3599  17005C         LBSR 0x35f8                       
  359c  CC0001         LDD #0x1                          
  359f  FD7184         STD 0x7184                        
  35a2  200B           BRA 0x35af                        
LAB_M78_r3_24000__35a4:
  35a4  170092         LBSR 0x3639                       
  35a7  CC0002         LDD #0x2                          
  35aa  FD7184         STD 0x7184                        
  35ad  2000           BRA 0x35af                        
LAB_M78_r3_24000__35af:
  35af  3576           PULS  A B X Y U                   
  35b1  39             RTS                               

; ---- function FUN_M78_r3_24000__35b2
FUN_M78_r3_24000__35b2:
  35b2  3476           PSHS  U Y X B A                   
  35b4  FC739B         LDD 0x739b                        
  35b7  FD7162         STD 0x7162                        
  35ba  FC739D         LDD 0x739d                        
  35bd  FD7164         STD 0x7164                        
  35c0  FC739F         LDD 0x739f                        
  35c3  FD7166         STD 0x7166                        
  35c6  FC73A1         LDD 0x73a1                        
  35c9  FD7168         STD 0x7168                        
  35cc  FC73A3         LDD 0x73a3                        
  35cf  FD716A         STD 0x716a                        
  35d2  FC73A5         LDD 0x73a5                        
  35d5  FD716C         STD 0x716c                        
  35d8  17001D         LBSR 0x35f8                       
  35db  170099         LBSR 0x3677                       
  35de  3576           PULS  A B X Y U                   
  35e0  39             RTS                               

; ---- function FUN_M78_r3_24000__35e1
FUN_M78_r3_24000__35e1:
  35e1  3476           PSHS  U Y X B A                   
  35e3  CC0001         LDD #0x1                          
  35e6  FD7160         STD 0x7160                        
  35e9  17E86D         LBSR 0x1e59                       
  35ec  CC0000         LDD #0x0                          
  35ef  FD7160         STD 0x7160                        
  35f2  17E864         LBSR 0x1e59                       
  35f5  3576           PULS  A B X Y U                   
  35f7  39             RTS                               

; ---- function FUN_M78_r3_24000__35f8
FUN_M78_r3_24000__35f8:
  35f8  3406           PSHS  B A                         
  35fa  4F             CLRA                              
  35fb  F6726C         LDB 0x726c                        
  35fe  54             LSRB                              
  35ff  FD7162         STD 0x7162                        
  3602  B6726D         LDA 0x726d                        
  3605  F6726E         LDB 0x726e                        
  3608  46             RORA                              
  3609  56             RORB                              
  360a  FD7164         STD 0x7164                        
  360d  4F             CLRA                              
  360e  F67270         LDB 0x7270                        
  3611  54             LSRB                              
  3612  FD7166         STD 0x7166                        
  3615  B67271         LDA 0x7271                        
  3618  F67272         LDB 0x7272                        
  361b  46             RORA                              
  361c  56             RORB                              
  361d  FD7168         STD 0x7168                        
  3620  4F             CLRA                              
  3621  F67152         LDB 0x7152                        
  3624  54             LSRB                              
  3625  FD716A         STD 0x716a                        
  3628  B67153         LDA 0x7153                        
  362b  F67154         LDB 0x7154                        
  362e  46             RORA                              
  362f  56             RORB                              
  3630  FD716C         STD 0x716c                        
  3633  17E823         LBSR 0x1e59                       
  3636  3506           PULS  A B                         
  3638  39             RTS                               

; ---- function FUN_M78_r3_24000__3639
FUN_M78_r3_24000__3639:
  3639  3406           PSHS  B A                         
  363b  4F             CLRA                              
  363c  F6726C         LDB 0x726c                        
  363f  54             LSRB                              
  3640  FD739B         STD 0x739b                        
  3643  B6726D         LDA 0x726d                        
  3646  F6726E         LDB 0x726e                        
  3649  46             RORA                              
  364a  56             RORB                              
  364b  FD739D         STD 0x739d                        
  364e  4F             CLRA                              
  364f  F67270         LDB 0x7270                        
  3652  54             LSRB                              
  3653  FD739F         STD 0x739f                        
  3656  B67271         LDA 0x7271                        
  3659  F67272         LDB 0x7272                        
  365c  46             RORA                              
  365d  56             RORB                              
  365e  FD73A1         STD 0x73a1                        
  3661  4F             CLRA                              
  3662  F67152         LDB 0x7152                        
  3665  54             LSRB                              
  3666  FD73A3         STD 0x73a3                        
  3669  B67153         LDA 0x7153                        
  366c  F67154         LDB 0x7154                        
  366f  46             RORA                              
  3670  56             RORB                              
  3671  FD73A5         STD 0x73a5                        
  3674  3506           PULS  A B                         
  3676  39             RTS                               

; ---- function FUN_M78_r3_24000__3677
FUN_M78_r3_24000__3677:
  3677  3476           PSHS  U Y X B A                   
  3679  CC0000         LDD #0x0                          
  367c  FD7160         STD 0x7160                        
  367f  CC0001         LDD #0x1                          
  3682  FD715E         STD 0x715e                        
  3685  17E7D1         LBSR 0x1e59                       
  3688  CC0000         LDD #0x0                          
  368b  FD715E         STD 0x715e                        
  368e  17E7C8         LBSR 0x1e59                       
  3691  3576           PULS  A B X Y U                   
  3693  39             RTS                               

; ---- function FUN_M78_r3_24000__3694
FUN_M78_r3_24000__3694:
  3694  3476           PSHS  U Y X B A                   
  3696  8E70EC         LDX #0x70ec                       
  3699  108E7068       LDY #0x7068                       
  369d  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0036 $7188
  36a1  0036           dw 36h                            
  36a3  7188           dw 7188h                          
LAB_M78_r3_24000__36a5:
  36a5  8E70F0         LDX #0x70f0                       
  36a8  108E7070       LDY #0x7070                       
  36ac  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0036 $7188
  36b0  0036           dw 36h                            
  36b2  7188           dw 7188h                          
LAB_M78_r3_24000__36b4:
  36b4  8E70F4         LDX #0x70f4                       
  36b7  108E7078       LDY #0x7078                       
  36bb  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0036 $7188
  36bf  0036           dw 36h                            
  36c1  7188           dw 7188h                          
LAB_M78_r3_24000__36c3:
  36c3  8E70F8         LDX #0x70f8                       
  36c6  108E7080       LDY #0x7080                       
  36ca  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0036 $7188
  36ce  0036           dw 36h                            
  36d0  7188           dw 7188h                          
LAB_M78_r3_24000__36d2:
  36d2  3576           PULS  A B X Y U                   
  36d4  39             RTS                               

; ---- function FUN_M78_r3_24000__36d5
FUN_M78_r3_24000__36d5:
  36d5  3476           PSHS  U Y X B A                   
  36d7  CC0000         LDD #0x0                          
  36da  FD7148         STD 0x7148                        
  36dd  FD717A         STD 0x717a                        
  36e0  FD717C         STD 0x717c                        
  36e3  FD717E         STD 0x717e                        
  36e6  FD7180         STD 0x7180                        
  36e9  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0078 $7188
  36ed  0078           dw 78h                            
  36ef  7188           dw 7188h                          
LAB_M78_r3_24000__36f1:
  36f1  3576           PULS  A B X Y U                   
  36f3  39             RTS                               

; ---- function FUN_M78_r3_24000__36f4
FUN_M78_r3_24000__36f4:
  36f4  3476           PSHS  U Y X B A                   
  36f6  CC0001         LDD #0x1                          
  36f9  FD7148         STD 0x7148                        
  36fc  17DD93         LBSR 0x1492                       
  36ff  3576           PULS  A B X Y U                   
  3701  39             RTS                               

;; Module 78 code record 05, 2260 bytes, entered at payload start
MODULE_78_05_CODE_hdr:
  3702  780508DC0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_78_05_entry
MODULE_78_05_entry:
  370a  39             RTS                               
  370b  .db 39                                               ; 9

; ---- function FUN_M78_r3_24000__370c
FUN_M78_r3_24000__370c:
  370c  3406           PSHS  B A                         
  370e  FC60E9         LDD 0x60e9                        
  3711  B3600D         SUBD 0x600d                       
  3714  1083370A       CMPD #0x370a                      
  3718  2607           BNE 0x3721                        
  371a  FC6042         LDD 0x6042                        
  371d  10B3FE16       CMPD 0xfe16                       
LAB_M78_r3_24000__3721:
  3721  3506           PULS  A B                         
  3723  39             RTS                               

; ---- function FUN_M78_r3_24000__3724
FUN_M78_r3_24000__3724:
  3724  3406           PSHS  B A                         
  3726  3506           PULS  A B                         
  3728  39             RTS                               

; ---- function FUN_M78_r3_24000__3729
FUN_M78_r3_24000__3729:
  3729  3476           PSHS  U Y X B A                   
  372b  FC717E         LDD 0x717e                        
  372e  10830001       CMPD #0x1                         
  3732  10270005       LBEQ 0x373b                       
  3736  170094         LBSR 0x37cd                       
  3739  2003           BRA 0x373e                        
LAB_M78_r3_24000__373b:
  373b  170003         LBSR 0x3741                       
LAB_M78_r3_24000__373e:
  373e  3576           PULS  A B X Y U                   
  3740  39             RTS                               

; ---- function FUN_M78_r3_24000__3741
FUN_M78_r3_24000__3741:
  3741  3476           PSHS  U Y X B A                   
  3743  170029         LBSR 0x376f                       
  3746  C60C           LDB #0xc                          
  3748  AD9FFC36       JSR [0xfc36]                      
  374c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "1"
  3750  3100           char[2] "1"                       
LAB_M78_r3_24000__3752:
  3752  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$09A6 ->$0B14 ->$370A ->$370A ->$37C1 ->$37C1
  3756  09A6           addr M78_r3_24000::09a6           
  3758  0B14           addr M78_r3_24000::0b14           
  375a  370A           addr M78_r3_24000::370a           
  375c  370A           addr M78_r3_24000::370a           
  375e  37C1           addr M78_r3_24000::37c1           
  3760  37C1           addr M78_r3_24000::37c1           
LAB_M78_r3_24000__3762:
  3762  17D3AF         LBSR 0x0b14                       
  3765  17D23E         LBSR 0x09a6                       
  3768  AD9FFDE8       JSR [0xfde8]                      
  376c  3576           PULS  A B X Y U                   
  376e  39             RTS                               

; ---- function FUN_M78_r3_24000__376f
FUN_M78_r3_24000__376f:
  376f  3476           PSHS  U Y X B A                   
  3771  C600           LDB #0x0                          
  3773  AD9FFC36       JSR [0xfc36]                      
  3777  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "edit sample 1 - start:       stop:      "
  377b  656469742073.. char[41] "edit sample 1 - start:       stop:      "
LAB_M78_r3_24000__37a4:
  37a4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " start  " "  stop  " [*] [*]
  37a8  207374617274.. ds " start  "                     
  37b0  202073746F70.. ds "  stop  "                     
  37b8  01             db 1h                             
  37b9  01             db 1h                             
LAB_M78_r3_24000__37ba:
  37ba  AD9FFDF2       JSR [0xfdf2]                      
  37be  3576           PULS  A B X Y U                   
  37c0  39             RTS                               

; ---- function FUN_M78_r3_24000__37c1
FUN_M78_r3_24000__37c1:
  37c1  17CD83         LBSR 0x0547                       
  37c4  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  37c8  003C           dw 3Ch                            
  37ca  7188           dw 7188h                          
LAB_M78_r3_24000__37cc:
  37cc  39             RTS                               

; ---- function FUN_M78_r3_24000__37cd
FUN_M78_r3_24000__37cd:
  37cd  3476           PSHS  U Y X B A                   
  37cf  17003E         LBSR 0x3810                       
  37d2  C60C           LDB #0xc                          
  37d4  AD9FFC36       JSR [0xfc36]                      
  37d8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "1"
  37dc  3100           char[2] "1"                       
LAB_M78_r3_24000__37de:
  37de  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3949 ->$3B99 ->$3C33 ->$370A ->$3C64 ->$3C64
  37e2  3949           addr M78_r3_24000::3949           
  37e4  3B99           addr M78_r3_24000::3b99           
  37e6  3C33           addr M78_r3_24000::3c33           
  37e8  370A           addr M78_r3_24000::370a           
  37ea  3C64           addr M78_r3_24000::3c64           
  37ec  3C64           addr M78_r3_24000::3c64           
LAB_M78_r3_24000__37ee:
  37ee  CC388B         LDD #0x388b                       
  37f1  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6044
  37f5  6044           addr 6044                         
LAB_M78_r3_24000__37f7:
  37f7  CC38D1         LDD #0x38d1                       
  37fa  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $605C
  37fe  605C           addr 605c                         
LAB_M78_r3_24000__3800:
  3800  170540         LBSR 0x3d43                       
  3803  170561         LBSR 0x3d67                       
  3806  17014B         LBSR 0x3954                       
  3809  AD9FFDE8       JSR [0xfde8]                      
  380d  3576           PULS  A B X Y U                   
  380f  39             RTS                               

; ---- function FUN_M78_r3_24000__3810
FUN_M78_r3_24000__3810:
  3810  3476           PSHS  U Y X B A                   
  3812  17FF5A         LBSR 0x376f                       
  3815  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "--play--" [-]
  3819  00             db 0h                             
  381a  00             db 0h                             
  381b  2D2D706C6179.. ds "--play--"                     
  3823  00             db 0h                             
LAB_M78_r3_24000__3824:
  3824  AD9FFDF2       JSR [0xfdf2]                      
  3828  CC0000         LDD #0x0                          
  382b  FD70E0         STD 0x70e0                        
  382e  FD70DC         STD 0x70dc                        
  3831  FD70DE         STD 0x70de                        
  3834  FD73AD         STD 0x73ad                        
  3837  17FE9B         LBSR 0x36d5                       
  383a  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0032 $7188
  383e  0032           dw 32h                            
  3840  7188           dw 7188h                          
LAB_M78_r3_24000__3842:
  3842  17E550         LBSR 0x1d95                       
  3845  3576           PULS  A B X Y U                   
  3847  39             RTS                               

; ---- function FUN_M78_r3_24000__3848
FUN_M78_r3_24000__3848:
  3848  3476           PSHS  U Y X B A                   
  384a  17FFC3         LBSR 0x3810                       
  384d  C60C           LDB #0xc                          
  384f  AD9FFC36       JSR [0xfc36]                      
  3853  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "2"
  3857  3200           char[2] "2"                       
LAB_M78_r3_24000__3859:
  3859  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3996 ->$3BE6 ->$3CB7 ->$370A ->$3CE8 ->$3CE8
  385d  3996           addr M78_r3_24000::3996           
  385f  3BE6           addr M78_r3_24000::3be6           
  3861  3CB7           addr M78_r3_24000::3cb7           
  3863  370A           addr M78_r3_24000::370a           
  3865  3CE8           addr M78_r3_24000::3ce8           
  3867  3CE8           addr M78_r3_24000::3ce8           
LAB_M78_r3_24000__3869:
  3869  CC38AE         LDD #0x38ae                       
  386c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6044
  3870  6044           addr 6044                         
LAB_M78_r3_24000__3872:
  3872  CC38EA         LDD #0x38ea                       
  3875  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $605C
  3879  605C           addr 605c                         
LAB_M78_r3_24000__387b:
  387b  1704D7         LBSR 0x3d55                       
  387e  1704F8         LBSR 0x3d79                       
  3881  17011D         LBSR 0x39a1                       
  3884  AD9FFDE8       JSR [0xfde8]                      
  3888  3576           PULS  A B X Y U                   
  388a  39             RTS                               

; ---- function FUN_M78_r3_24000__388b
FUN_M78_r3_24000__388b:
  388b  3476           PSHS  U Y X B A                   
  388d  3406           PSHS  B A                         
  388f  CC370A         LDD #0x370a                       
  3892  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  3896  6011           addr 6011                         
LAB_M78_r3_24000__3898:
  3898  AD9F73AF       JSR [0x73af]                      
  389c  3506           PULS  A B                         
  389e  AD9F6044       JSR [0x6044]                      
  38a2  CC38D1         LDD #0x38d1                       
  38a5  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $605C
  38a9  605C           addr 605c                         
LAB_M78_r3_24000__38ab:
  38ab  3576           PULS  A B X Y U                   
  38ad  39             RTS                               

; ---- function FUN_M78_r3_24000__38ae
FUN_M78_r3_24000__38ae:
  38ae  3476           PSHS  U Y X B A                   
  38b0  3406           PSHS  B A                         
  38b2  CC370A         LDD #0x370a                       
  38b5  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  38b9  6013           addr 6013                         
LAB_M78_r3_24000__38bb:
  38bb  AD9F73AF       JSR [0x73af]                      
  38bf  3506           PULS  A B                         
  38c1  AD9F6044       JSR [0x6044]                      
  38c5  CC38EA         LDD #0x38ea                       
  38c8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $605C
  38cc  605C           addr 605c                         
LAB_M78_r3_24000__38ce:
  38ce  3576           PULS  A B X Y U                   
  38d0  39             RTS                               

; ---- function FUN_M78_r3_24000__38d1
FUN_M78_r3_24000__38d1:
  38d1  3476           PSHS  U Y X B A                   
  38d3  17E4BF         LBSR 0x1d95                       
  38d6  AD9F73B1       JSR [0x73b1]                      
  38da  AD9F605C       JSR [0x605c]                      
  38de  CC388B         LDD #0x388b                       
  38e1  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6044
  38e5  6044           addr 6044                         
LAB_M78_r3_24000__38e7:
  38e7  3576           PULS  A B X Y U                   
  38e9  39             RTS                               

; ---- function FUN_M78_r3_24000__38ea
FUN_M78_r3_24000__38ea:
  38ea  3476           PSHS  U Y X B A                   
  38ec  17E4A6         LBSR 0x1d95                       
  38ef  AD9F73B1       JSR [0x73b1]                      
  38f3  AD9F605C       JSR [0x605c]                      
  38f7  CC38AE         LDD #0x38ae                       
  38fa  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6044
  38fe  6044           addr 6044                         
LAB_M78_r3_24000__3900:
  3900  3576           PULS  A B X Y U                   
  3902  39             RTS                               

; ---- function FUN_M78_r3_24000__3903
FUN_M78_r3_24000__3903:
  3903  3476           PSHS  U Y X B A                   
  3905  FC7180         LDD 0x7180                        
  3908  10830001       CMPD #0x1                         
  390c  10270005       LBEQ 0x3915                       
  3910  17FF35         LBSR 0x3848                       
  3913  2003           BRA 0x3918                        
LAB_M78_r3_24000__3915:
  3915  170003         LBSR 0x391b                       
LAB_M78_r3_24000__3918:
  3918  3576           PULS  A B X Y U                   
  391a  39             RTS                               

; ---- function FUN_M78_r3_24000__391b
FUN_M78_r3_24000__391b:
  391b  3476           PSHS  U Y X B A                   
  391d  17FE4F         LBSR 0x376f                       
  3920  C60C           LDB #0xc                          
  3922  AD9FFC36       JSR [0xfc36]                      
  3926  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "2"
  392a  3200           char[2] "2"                       
LAB_M78_r3_24000__392c:
  392c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A5D ->$0BCB ->$370A ->$370A ->$37C1 ->$37C1
  3930  0A5D           addr M78_r3_24000::0a5d           
  3932  0BCB           addr M78_r3_24000::0bcb           
  3934  370A           addr M78_r3_24000::370a           
  3936  370A           addr M78_r3_24000::370a           
  3938  37C1           addr M78_r3_24000::37c1           
  393a  37C1           addr M78_r3_24000::37c1           
LAB_M78_r3_24000__393c:
  393c  17D28C         LBSR 0x0bcb                       
  393f  17D11B         LBSR 0x0a5d                       
  3942  AD9FFDE8       JSR [0xfde8]                      
  3946  3576           PULS  A B X Y U                   
  3948  39             RTS                               

; ---- function FUN_M78_r3_24000__3949
FUN_M78_r3_24000__3949:
  3949  17FE81         LBSR 0x37cd                       
  394c  AD9FFDE8       JSR [0xfde8]                      
  3950  170001         LBSR 0x3954                       
  3953  39             RTS                               

; ---- function FUN_M78_r3_24000__3954
FUN_M78_r3_24000__3954:
  3954  3476           PSHS  U Y X B A                   
  3956  CC0001         LDD #0x1                          
  3959  FD73B9         STD 0x73b9                        
  395c  17FD76         LBSR 0x36d5                       
  395f  CC09A6         LDD #0x9a6                        
  3962  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73AF
  3966  73AF           addr 73af                         
LAB_M78_r3_24000__3968:
  3968  CC3954         LDD #0x3954                       
  396b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73B1
  396f  73B1           addr 73b1                         
LAB_M78_r3_24000__3971:
  3971  FC7090         LDD 0x7090                        
  3974  10830000       CMPD #0x0                         
  3978  10270008       LBEQ 0x3984                       
  397c  8E70EC         LDX #0x70ec                       
  397f  170409         LBSR 0x3d8b                       
  3982  2006           BRA 0x398a                        
LAB_M78_r3_24000__3984:
  3984  8E70EC         LDX #0x70ec                       
  3987  170482         LBSR 0x3e0c                       
LAB_M78_r3_24000__398a:
  398a  CC39E3         LDD #0x39e3                       
  398d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  3991  6011           addr 6011                         
LAB_M78_r3_24000__3993:
  3993  3576           PULS  A B X Y U                   
  3995  39             RTS                               

; ---- function FUN_M78_r3_24000__3996
FUN_M78_r3_24000__3996:
  3996  17FEAF         LBSR 0x3848                       
  3999  AD9FFDE8       JSR [0xfde8]                      
  399d  170001         LBSR 0x39a1                       
  39a0  39             RTS                               

; ---- function FUN_M78_r3_24000__39a1
FUN_M78_r3_24000__39a1:
  39a1  3476           PSHS  U Y X B A                   
  39a3  CC0001         LDD #0x1                          
  39a6  FD73BB         STD 0x73bb                        
  39a9  17FD29         LBSR 0x36d5                       
  39ac  CC0A5D         LDD #0xa5d                        
  39af  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73AF
  39b3  73AF           addr 73af                         
LAB_M78_r3_24000__39b5:
  39b5  CC39A1         LDD #0x39a1                       
  39b8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73B1
  39bc  73B1           addr 73b1                         
LAB_M78_r3_24000__39be:
  39be  FC7090         LDD 0x7090                        
  39c1  10830000       CMPD #0x0                         
  39c5  10270008       LBEQ 0x39d1                       
  39c9  8E70F4         LDX #0x70f4                       
  39cc  1703BC         LBSR 0x3d8b                       
  39cf  2006           BRA 0x39d7                        
LAB_M78_r3_24000__39d1:
  39d1  8E70F4         LDX #0x70f4                       
  39d4  17049E         LBSR 0x3e75                       
LAB_M78_r3_24000__39d7:
  39d7  CC3A49         LDD #0x3a49                       
  39da  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  39de  6013           addr 6013                         
LAB_M78_r3_24000__39e0:
  39e0  3576           PULS  A B X Y U                   
  39e2  39             RTS                               

; ---- function FUN_M78_r3_24000__39e3
FUN_M78_r3_24000__39e3:
  39e3  3476           PSHS  U Y X B A                   
  39e5  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0018 $7188
  39e9  0018           dw 18h                            
  39eb  7188           dw 7188h                          
LAB_M78_r3_24000__39ed:
  39ed  AD9FFD3A       JSR [0xfd3a]                      
  39f1  FD70EC         STD 0x70ec                        
  39f4  AD9FFD3E       JSR [0xfd3e]                      
  39f8  FD70EE         STD 0x70ee                        
  39fb  FC70E0         LDD 0x70e0                        
  39fe  3606           PSHU  B A                         
  3a00  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002C $7188
  3a04  002C           dw 2Ch                            
  3a06  7188           dw 7188h                          
LAB_M78_r3_24000__3a08:
  3a08  3706           PULU  A B                         
  3a0a  FD73AD         STD 0x73ad                        
  3a0d  FC7090         LDD 0x7090                        
  3a10  10830000       CMPD #0x0                         
  3a14  10270014       LBEQ 0x3a2c                       
  3a18  CC000A         LDD #0xa                          
  3a1b  AD9FFD20       JSR [0xfd20]                      
  3a1f  108E0340       LDY #0x340                        
  3a23  FC73AD         LDD 0x73ad                        
  3a26  AD9FFD2E       JSR [0xfd2e]                      
  3a2a  2012           BRA 0x3a3e                        
LAB_M78_r3_24000__3a2c:
  3a2c  CC000A         LDD #0xa                          
  3a2f  AD9FFD20       JSR [0xfd20]                      
  3a33  108E0140       LDY #0x140                        
  3a37  FC73AD         LDD 0x73ad                        
  3a3a  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__3a3e:
  3a3e  17FCCB         LBSR 0x370c                       
  3a41  2603           BNE 0x3a46                        
  3a43  1702FD         LBSR 0x3d43                       
LAB_M78_r3_24000__3a46:
  3a46  3576           PULS  A B X Y U                   
  3a48  39             RTS                               

; ---- function FUN_M78_r3_24000__3a49
FUN_M78_r3_24000__3a49:
  3a49  3476           PSHS  U Y X B A                   
  3a4b  FC70E0         LDD 0x70e0                        
  3a4e  3606           PSHU  B A                         
  3a50  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002C $7188
  3a54  002C           dw 2Ch                            
  3a56  7188           dw 7188h                          
LAB_M78_r3_24000__3a58:
  3a58  3706           PULU  A B                         
  3a5a  FD73AD         STD 0x73ad                        
  3a5d  FC7090         LDD 0x7090                        
  3a60  10830000       CMPD #0x0                         
  3a64  1027001C       LBEQ 0x3a84                       
  3a68  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0018 $7188
  3a6c  0018           dw 18h                            
  3a6e  7188           dw 7188h                          
LAB_M78_r3_24000__3a70:
  3a70  CC000A         LDD #0xa                          
  3a73  AD9FFD20       JSR [0xfd20]                      
  3a77  108E0340       LDY #0x340                        
  3a7b  FC73AD         LDD 0x73ad                        
  3a7e  AD9FFD2E       JSR [0xfd2e]                      
  3a82  201A           BRA 0x3a9e                        
LAB_M78_r3_24000__3a84:
  3a84  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001A $7188
  3a88  001A           dw 1Ah                            
  3a8a  7188           dw 7188h                          
LAB_M78_r3_24000__3a8c:
  3a8c  CC000A         LDD #0xa                          
  3a8f  AD9FFD20       JSR [0xfd20]                      
  3a93  108E0240       LDY #0x240                        
  3a97  FC73AD         LDD 0x73ad                        
  3a9a  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__3a9e:
  3a9e  AD9FFD3A       JSR [0xfd3a]                      
  3aa2  FD70F4         STD 0x70f4                        
  3aa5  AD9FFD3E       JSR [0xfd3e]                      
  3aa9  FD70F6         STD 0x70f6                        
  3aac  17FC5D         LBSR 0x370c                       
  3aaf  2603           BNE 0x3ab4                        
  3ab1  1702A1         LBSR 0x3d55                       
LAB_M78_r3_24000__3ab4:
  3ab4  3576           PULS  A B X Y U                   
  3ab6  39             RTS                               

; ---- function FUN_M78_r3_24000__3ab7
FUN_M78_r3_24000__3ab7:
  3ab7  3476           PSHS  U Y X B A                   
  3ab9  FC70E0         LDD 0x70e0                        
  3abc  3606           PSHU  B A                         
  3abe  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002C $7188
  3ac2  002C           dw 2Ch                            
  3ac4  7188           dw 7188h                          
LAB_M78_r3_24000__3ac6:
  3ac6  3706           PULU  A B                         
  3ac8  FD73AD         STD 0x73ad                        
  3acb  FC7090         LDD 0x7090                        
  3ace  10830000       CMPD #0x0                         
  3ad2  1027001C       LBEQ 0x3af2                       
  3ad6  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0018 $7188
  3ada  0018           dw 18h                            
  3adc  7188           dw 7188h                          
LAB_M78_r3_24000__3ade:
  3ade  CC000A         LDD #0xa                          
  3ae1  AD9FFD20       JSR [0xfd20]                      
  3ae5  108E0340       LDY #0x340                        
  3ae9  FC73AD         LDD 0x73ad                        
  3aec  AD9FFD2E       JSR [0xfd2e]                      
  3af0  201A           BRA 0x3b0c                        
LAB_M78_r3_24000__3af2:
  3af2  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0018 $7188
  3af6  0018           dw 18h                            
  3af8  7188           dw 7188h                          
LAB_M78_r3_24000__3afa:
  3afa  CC000A         LDD #0xa                          
  3afd  AD9FFD20       JSR [0xfd20]                      
  3b01  108E0140       LDY #0x140                        
  3b05  FC73AD         LDD 0x73ad                        
  3b08  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__3b0c:
  3b0c  AD9FFD3A       JSR [0xfd3a]                      
  3b10  FD70F0         STD 0x70f0                        
  3b13  AD9FFD3E       JSR [0xfd3e]                      
  3b17  5F             CLRB                              
  3b18  84FE           ANDA #0xfe                        
  3b1a  FD70F2         STD 0x70f2                        
  3b1d  17FBEC         LBSR 0x370c                       
  3b20  2603           BNE 0x3b25                        
  3b22  170242         LBSR 0x3d67                       
LAB_M78_r3_24000__3b25:
  3b25  3576           PULS  A B X Y U                   
  3b27  39             RTS                               

; ---- function FUN_M78_r3_24000__3b28
FUN_M78_r3_24000__3b28:
  3b28  3476           PSHS  U Y X B A                   
  3b2a  FC70E0         LDD 0x70e0                        
  3b2d  3606           PSHU  B A                         
  3b2f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $002C $7188
  3b33  002C           dw 2Ch                            
  3b35  7188           dw 7188h                          
LAB_M78_r3_24000__3b37:
  3b37  3706           PULU  A B                         
  3b39  FD73AD         STD 0x73ad                        
  3b3c  FC7090         LDD 0x7090                        
  3b3f  10830000       CMPD #0x0                         
  3b43  1027001C       LBEQ 0x3b63                       
  3b47  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0018 $7188
  3b4b  0018           dw 18h                            
  3b4d  7188           dw 7188h                          
LAB_M78_r3_24000__3b4f:
  3b4f  CC000A         LDD #0xa                          
  3b52  AD9FFD20       JSR [0xfd20]                      
  3b56  108E0340       LDY #0x340                        
  3b5a  FC73AD         LDD 0x73ad                        
  3b5d  AD9FFD2E       JSR [0xfd2e]                      
  3b61  201A           BRA 0x3b7d                        
LAB_M78_r3_24000__3b63:
  3b63  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $001A $7188
  3b67  001A           dw 1Ah                            
  3b69  7188           dw 7188h                          
LAB_M78_r3_24000__3b6b:
  3b6b  CC000A         LDD #0xa                          
  3b6e  AD9FFD20       JSR [0xfd20]                      
  3b72  108E0240       LDY #0x240                        
  3b76  FC73AD         LDD 0x73ad                        
  3b79  AD9FFD2E       JSR [0xfd2e]                      
LAB_M78_r3_24000__3b7d:
  3b7d  AD9FFD3A       JSR [0xfd3a]                      
  3b81  FD70F8         STD 0x70f8                        
  3b84  AD9FFD3E       JSR [0xfd3e]                      
  3b88  5F             CLRB                              
  3b89  84FE           ANDA #0xfe                        
  3b8b  FD70FA         STD 0x70fa                        
  3b8e  17FB7B         LBSR 0x370c                       
  3b91  2603           BNE 0x3b96                        
  3b93  1701E3         LBSR 0x3d79                       
LAB_M78_r3_24000__3b96:
  3b96  3576           PULS  A B X Y U                   
  3b98  39             RTS                               

; ---- function FUN_M78_r3_24000__3b99
FUN_M78_r3_24000__3b99:
  3b99  17FC31         LBSR 0x37cd                       
  3b9c  AD9FFDEA       JSR [0xfdea]                      
  3ba0  170001         LBSR 0x3ba4                       
  3ba3  39             RTS                               

; ---- function FUN_M78_r3_24000__3ba4
FUN_M78_r3_24000__3ba4:
  3ba4  3476           PSHS  U Y X B A                   
  3ba6  CC0001         LDD #0x1                          
  3ba9  FD73B9         STD 0x73b9                        
  3bac  17FB26         LBSR 0x36d5                       
  3baf  CC0B14         LDD #0xb14                        
  3bb2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73AF
  3bb6  73AF           addr 73af                         
LAB_M78_r3_24000__3bb8:
  3bb8  CC3BA4         LDD #0x3ba4                       
  3bbb  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73B1
  3bbf  73B1           addr 73b1                         
LAB_M78_r3_24000__3bc1:
  3bc1  FC7090         LDD 0x7090                        
  3bc4  10830000       CMPD #0x0                         
  3bc8  10270008       LBEQ 0x3bd4                       
  3bcc  8E70F0         LDX #0x70f0                       
  3bcf  1701B9         LBSR 0x3d8b                       
  3bd2  2006           BRA 0x3bda                        
LAB_M78_r3_24000__3bd4:
  3bd4  8E70F0         LDX #0x70f0                       
  3bd7  170232         LBSR 0x3e0c                       
LAB_M78_r3_24000__3bda:
  3bda  CC3AB7         LDD #0x3ab7                       
  3bdd  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  3be1  6011           addr 6011                         
LAB_M78_r3_24000__3be3:
  3be3  3576           PULS  A B X Y U                   
  3be5  39             RTS                               

; ---- function FUN_M78_r3_24000__3be6
FUN_M78_r3_24000__3be6:
  3be6  17FC5F         LBSR 0x3848                       
  3be9  AD9FFDEA       JSR [0xfdea]                      
  3bed  170001         LBSR 0x3bf1                       
  3bf0  39             RTS                               

; ---- function FUN_M78_r3_24000__3bf1
FUN_M78_r3_24000__3bf1:
  3bf1  3476           PSHS  U Y X B A                   
  3bf3  CC0001         LDD #0x1                          
  3bf6  FD73BB         STD 0x73bb                        
  3bf9  17FAD9         LBSR 0x36d5                       
  3bfc  CC0BCB         LDD #0xbcb                        
  3bff  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73AF
  3c03  73AF           addr 73af                         
LAB_M78_r3_24000__3c05:
  3c05  CC3BF1         LDD #0x3bf1                       
  3c08  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $73B1
  3c0c  73B1           addr 73b1                         
LAB_M78_r3_24000__3c0e:
  3c0e  FC7090         LDD 0x7090                        
  3c11  10830000       CMPD #0x0                         
  3c15  10270008       LBEQ 0x3c21                       
  3c19  8E70F8         LDX #0x70f8                       
  3c1c  17016C         LBSR 0x3d8b                       
  3c1f  2006           BRA 0x3c27                        
LAB_M78_r3_24000__3c21:
  3c21  8E70F8         LDX #0x70f8                       
  3c24  17024E         LBSR 0x3e75                       
LAB_M78_r3_24000__3c27:
  3c27  CC3B28         LDD #0x3b28                       
  3c2a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  3c2e  6013           addr 6013                         
LAB_M78_r3_24000__3c30:
  3c30  3576           PULS  A B X Y U                   
  3c32  39             RTS                               

; ---- function FUN_M78_r3_24000__3c33
FUN_M78_r3_24000__3c33:
  3c33  3476           PSHS  U Y X B A                   
  3c35  170018         LBSR 0x3c50                       
  3c38  17EDA9         LBSR 0x29e4                       
  3c3b  CC000A         LDD #0xa                          
  3c3e  AD9FFD20       JSR [0xfd20]                      
  3c42  108E0369       LDY #0x369                        
  3c46  CC0000         LDD #0x0                          
  3c49  AD9FFD2E       JSR [0xfd2e]                      
  3c4d  3576           PULS  A B X Y U                   
  3c4f  39             RTS                               

; ---- function FUN_M78_r3_24000__3c50
FUN_M78_r3_24000__3c50:
  3c50  3476           PSHS  U Y X B A                   
  3c52  170025         LBSR 0x3c7a                       
  3c55  17FA9C         LBSR 0x36f4                       
  3c58  CC38D1         LDD #0x38d1                       
  3c5b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $605C
  3c5f  605C           addr 605c                         
LAB_M78_r3_24000__3c61:
  3c61  3576           PULS  A B X Y U                   
  3c63  39             RTS                               

; ---- function FUN_M78_r3_24000__3c64
FUN_M78_r3_24000__3c64:
  3c64  3476           PSHS  U Y X B A                   
  3c66  170011         LBSR 0x3c7a                       
  3c69  17FA88         LBSR 0x36f4                       
  3c6c  17C98B         LBSR 0x05fa                       
  3c6f  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  3c73  003C           dw 3Ch                            
  3c75  7188           dw 7188h                          
LAB_M78_r3_24000__3c77:
  3c77  3576           PULS  A B X Y U                   
  3c79  39             RTS                               

; ---- function FUN_M78_r3_24000__3c7a
FUN_M78_r3_24000__3c7a:
  3c7a  3476           PSHS  U Y X B A                   
  3c7c  CC0000         LDD #0x0                          
  3c7f  FD73B9         STD 0x73b9                        
  3c82  CC370A         LDD #0x370a                       
  3c85  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6011
  3c89  6011           addr 6011                         
LAB_M78_r3_24000__3c8b:
  3c8b  CC000A         LDD #0xa                          
  3c8e  AD9FFD20       JSR [0xfd20]                      
  3c92  108E0350       LDY #0x350                        
  3c96  CC0000         LDD #0x0                          
  3c99  AD9FFD2E       JSR [0xfd2e]                      
  3c9d  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  3ca1  0038           dw 38h                            
  3ca3  7188           dw 7188h                          
LAB_M78_r3_24000__3ca5:
  3ca5  17F9EC         LBSR 0x3694                       
  3ca8  17D09B         LBSR 0x0d46                       
  3cab  17D482         LBSR 0x1130                       
  3cae  17D2C2         LBSR 0x0f73                       
  3cb1  17D61C         LBSR 0x12d0                       
  3cb4  3576           PULS  A B X Y U                   
  3cb6  39             RTS                               

; ---- function FUN_M78_r3_24000__3cb7
FUN_M78_r3_24000__3cb7:
  3cb7  3476           PSHS  U Y X B A                   
  3cb9  170018         LBSR 0x3cd4                       
  3cbc  17EEA5         LBSR 0x2b64                       
  3cbf  CC000A         LDD #0xa                          
  3cc2  AD9FFD20       JSR [0xfd20]                      
  3cc6  108E036A       LDY #0x36a                        
  3cca  CC0000         LDD #0x0                          
  3ccd  AD9FFD2E       JSR [0xfd2e]                      
  3cd1  3576           PULS  A B X Y U                   
  3cd3  39             RTS                               

; ---- function FUN_M78_r3_24000__3cd4
FUN_M78_r3_24000__3cd4:
  3cd4  3476           PSHS  U Y X B A                   
  3cd6  170025         LBSR 0x3cfe                       
  3cd9  17FA18         LBSR 0x36f4                       
  3cdc  CC38EA         LDD #0x38ea                       
  3cdf  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $605C
  3ce3  605C           addr 605c                         
LAB_M78_r3_24000__3ce5:
  3ce5  3576           PULS  A B X Y U                   
  3ce7  39             RTS                               

; ---- function FUN_M78_r3_24000__3ce8
FUN_M78_r3_24000__3ce8:
  3ce8  3476           PSHS  U Y X B A                   
  3cea  170011         LBSR 0x3cfe                       
  3ced  17FA04         LBSR 0x36f4                       
  3cf0  17C907         LBSR 0x05fa                       
  3cf3  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003C $7188
  3cf7  003C           dw 3Ch                            
  3cf9  7188           dw 7188h                          
LAB_M78_r3_24000__3cfb:
  3cfb  3576           PULS  A B X Y U                   
  3cfd  39             RTS                               

; ---- function FUN_M78_r3_24000__3cfe
FUN_M78_r3_24000__3cfe:
  3cfe  3476           PSHS  U Y X B A                   
  3d00  CC0000         LDD #0x0                          
  3d03  FD73BB         STD 0x73bb                        
  3d06  CC370A         LDD #0x370a                       
  3d09  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  3d0d  6013           addr 6013                         
LAB_M78_r3_24000__3d0f:
  3d0f  CC000A         LDD #0xa                          
  3d12  AD9FFD20       JSR [0xfd20]                      
  3d16  108E0350       LDY #0x350                        
  3d1a  CC0000         LDD #0x0                          
  3d1d  AD9FFD2E       JSR [0xfd2e]                      
  3d21  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  3d25  0038           dw 38h                            
  3d27  7188           dw 7188h                          
LAB_M78_r3_24000__3d29:
  3d29  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  3d2d  003A           dw 3Ah                            
  3d2f  7188           dw 7188h                          
LAB_M78_r3_24000__3d31:
  3d31  17F960         LBSR 0x3694                       
  3d34  17D00F         LBSR 0x0d46                       
  3d37  17D3F6         LBSR 0x1130                       
  3d3a  17D236         LBSR 0x0f73                       
  3d3d  17D590         LBSR 0x12d0                       
  3d40  3576           PULS  A B X Y U                   
  3d42  39             RTS                               

; ---- function FUN_M78_r3_24000__3d43
FUN_M78_r3_24000__3d43:
  3d43  3476           PSHS  U Y X B A                   
  3d45  C616           LDB #0x16                         
  3d47  8E70EC         LDX #0x70ec                       
  3d4a  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000C $7188
  3d4e  000C           dw Ch                             
  3d50  7188           dw 7188h                          
LAB_M78_r3_24000__3d52:
  3d52  3576           PULS  A B X Y U                   
  3d54  39             RTS                               

; ---- function FUN_M78_r3_24000__3d55
FUN_M78_r3_24000__3d55:
  3d55  3476           PSHS  U Y X B A                   
  3d57  C616           LDB #0x16                         
  3d59  8E70F4         LDX #0x70f4                       
  3d5c  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000C $7188
  3d60  000C           dw Ch                             
  3d62  7188           dw 7188h                          
LAB_M78_r3_24000__3d64:
  3d64  3576           PULS  A B X Y U                   
  3d66  39             RTS                               

; ---- function FUN_M78_r3_24000__3d67
FUN_M78_r3_24000__3d67:
  3d67  3476           PSHS  U Y X B A                   
  3d69  C622           LDB #0x22                         
  3d6b  8E70F0         LDX #0x70f0                       
  3d6e  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000C $7188
  3d72  000C           dw Ch                             
  3d74  7188           dw 7188h                          
LAB_M78_r3_24000__3d76:
  3d76  3576           PULS  A B X Y U                   
  3d78  39             RTS                               

; ---- function FUN_M78_r3_24000__3d79
FUN_M78_r3_24000__3d79:
  3d79  3476           PSHS  U Y X B A                   
  3d7b  C622           LDB #0x22                         
  3d7d  8E70F8         LDX #0x70f8                       
  3d80  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000C $7188
  3d84  000C           dw Ch                             
  3d86  7188           dw 7188h                          
LAB_M78_r3_24000__3d88:
  3d88  3576           PULS  A B X Y U                   
  3d8a  39             RTS                               

; ---- function FUN_M78_r3_24000__3d8b
FUN_M78_r3_24000__3d8b:
  3d8b  3476           PSHS  U Y X B A                   
  3d8d  EC81           LDD ,X++                          
  3d8f  FD73B3         STD 0x73b3                        
  3d92  F37152         ADDD 0x7152                       
  3d95  FD73B5         STD 0x73b5                        
  3d98  EC84           LDD ,X                            
  3d9a  FD73B7         STD 0x73b7                        
  3d9d  CC000A         LDD #0xa                          
  3da0  AD9FFD20       JSR [0xfd20]                      
  3da4  108E0340       LDY #0x340                        
  3da8  CC0000         LDD #0x0                          
  3dab  AD9FFD2E       JSR [0xfd2e]                      
  3daf  CC000A         LDD #0xa                          
  3db2  AD9FFD20       JSR [0xfd20]                      
  3db6  108E0350       LDY #0x350                        
  3dba  CC0000         LDD #0x0                          
  3dbd  AD9FFD2E       JSR [0xfd2e]                      
  3dc1  CC000A         LDD #0xa                          
  3dc4  AD9FFD20       JSR [0xfd20]                      
  3dc8  108E0142       LDY #0x142                        
  3dcc  FC73B3         LDD 0x73b3                        
  3dcf  AD9FFD2E       JSR [0xfd2e]                      
  3dd3  CC000A         LDD #0xa                          
  3dd6  AD9FFD20       JSR [0xfd20]                      
  3dda  108E0242       LDY #0x242                        
  3dde  FC73B5         LDD 0x73b5                        
  3de1  AD9FFD2E       JSR [0xfd2e]                      
  3de5  CC000A         LDD #0xa                          
  3de8  AD9FFD20       JSR [0xfd20]                      
  3dec  108E0343       LDY #0x343                        
  3df0  FC73B7         LDD 0x73b7                        
  3df3  AD9FFD2E       JSR [0xfd2e]                      
  3df7  CC000A         LDD #0xa                          
  3dfa  AD9FFD20       JSR [0xfd20]                      
  3dfe  108E0350       LDY #0x350                        
  3e02  CC0001         LDD #0x1                          
  3e05  AD9FFD2E       JSR [0xfd2e]                      
  3e09  3576           PULS  A B X Y U                   
  3e0b  39             RTS                               

; ---- function FUN_M78_r3_24000__3e0c
FUN_M78_r3_24000__3e0c:
  3e0c  3476           PSHS  U Y X B A                   
  3e0e  EC81           LDD ,X++                          
  3e10  FD73B3         STD 0x73b3                        
  3e13  EC84           LDD ,X                            
  3e15  FD73B5         STD 0x73b5                        
  3e18  CC000A         LDD #0xa                          
  3e1b  AD9FFD20       JSR [0xfd20]                      
  3e1f  108E0140       LDY #0x140                        
  3e23  CC0000         LDD #0x0                          
  3e26  AD9FFD2E       JSR [0xfd2e]                      
  3e2a  CC000A         LDD #0xa                          
  3e2d  AD9FFD20       JSR [0xfd20]                      
  3e31  108E0150       LDY #0x150                        
  3e35  CC0000         LDD #0x0                          
  3e38  AD9FFD2E       JSR [0xfd2e]                      
  3e3c  CC000A         LDD #0xa                          
  3e3f  AD9FFD20       JSR [0xfd20]                      
  3e43  108E0142       LDY #0x142                        
  3e47  FC73B3         LDD 0x73b3                        
  3e4a  AD9FFD2E       JSR [0xfd2e]                      
  3e4e  CC000A         LDD #0xa                          
  3e51  AD9FFD20       JSR [0xfd20]                      
  3e55  108E0143       LDY #0x143                        
  3e59  FC73B5         LDD 0x73b5                        
  3e5c  AD9FFD2E       JSR [0xfd2e]                      
  3e60  CC000A         LDD #0xa                          
  3e63  AD9FFD20       JSR [0xfd20]                      
  3e67  108E0150       LDY #0x150                        
  3e6b  CC0001         LDD #0x1                          
  3e6e  AD9FFD2E       JSR [0xfd2e]                      
  3e72  3576           PULS  A B X Y U                   
  3e74  39             RTS                               

; ---- function FUN_M78_r3_24000__3e75
FUN_M78_r3_24000__3e75:
  3e75  3476           PSHS  U Y X B A                   
  3e77  EC81           LDD ,X++                          
  3e79  FD73B3         STD 0x73b3                        
  3e7c  EC84           LDD ,X                            
  3e7e  FD73B5         STD 0x73b5                        
  3e81  CC000A         LDD #0xa                          
  3e84  AD9FFD20       JSR [0xfd20]                      
  3e88  108E0240       LDY #0x240                        
  3e8c  CC0000         LDD #0x0                          
  3e8f  AD9FFD2E       JSR [0xfd2e]                      
  3e93  CC000A         LDD #0xa                          
  3e96  AD9FFD20       JSR [0xfd20]                      
  3e9a  108E0250       LDY #0x250                        
  3e9e  CC0000         LDD #0x0                          
  3ea1  AD9FFD2E       JSR [0xfd2e]                      
  3ea5  CC000A         LDD #0xa                          
  3ea8  AD9FFD20       JSR [0xfd20]                      
  3eac  108E0242       LDY #0x242                        
  3eb0  FC73B3         LDD 0x73b3                        
  3eb3  AD9FFD2E       JSR [0xfd2e]                      
  3eb7  CC000A         LDD #0xa                          
  3eba  AD9FFD20       JSR [0xfd20]                      
  3ebe  108E0243       LDY #0x243                        
  3ec2  FC73B5         LDD 0x73b5                        
  3ec5  AD9FFD2E       JSR [0xfd2e]                      
  3ec9  CC000A         LDD #0xa                          
  3ecc  AD9FFD20       JSR [0xfd20]                      
  3ed0  108E0250       LDY #0x250                        
  3ed4  CC0001         LDD #0x1                          
  3ed7  AD9FFD2E       JSR [0xfd2e]                      
  3edb  3576           PULS  A B X Y U                   
  3edd  39             RTS                               

; ---- function FUN_M78_r3_24000__3ede
FUN_M78_r3_24000__3ede:
  3ede  3476           PSHS  U Y X B A                   
  3ee0  CC000A         LDD #0xa                          
  3ee3  AD9FFD20       JSR [0xfd20]                      
  3ee7  108E034F       LDY #0x34f                        
  3eeb  CC0001         LDD #0x1                          
  3eee  AD9FFD2E       JSR [0xfd2e]                      
  3ef2  CC000A         LDD #0xa                          
  3ef5  AD9FFD20       JSR [0xfd20]                      
  3ef9  108E034F       LDY #0x34f                        
  3efd  CC0000         LDD #0x0                          
  3f00  AD9FFD2E       JSR [0xfd2e]                      
  3f04  CC000A         LDD #0xa                          
  3f07  AD9FFD20       JSR [0xfd20]                      
  3f0b  108E0142       LDY #0x142                        
  3f0f  CC0000         LDD #0x0                          
  3f12  AD9FFD2E       JSR [0xfd2e]                      
  3f16  CC000A         LDD #0xa                          
  3f19  AD9FFD20       JSR [0xfd20]                      
  3f1d  108E0144       LDY #0x144                        
  3f21  FC714A         LDD 0x714a                        
  3f24  AD9FFD2E       JSR [0xfd2e]                      
  3f28  CC000A         LDD #0xa                          
  3f2b  AD9FFD20       JSR [0xfd20]                      
  3f2f  108E0145       LDY #0x145                        
  3f33  FC714C         LDD 0x714c                        
  3f36  AD9FFD2E       JSR [0xfd2e]                      
  3f3a  CC000A         LDD #0xa                          
  3f3d  AD9FFD20       JSR [0xfd20]                      
  3f41  108E015F       LDY #0x15f                        
  3f45  CC0001         LDD #0x1                          
  3f48  AD9FFD2E       JSR [0xfd2e]                      
  3f4c  CC000A         LDD #0xa                          
  3f4f  AD9FFD20       JSR [0xfd20]                      
  3f53  108E015F       LDY #0x15f                        
  3f57  CC0000         LDD #0x0                          
  3f5a  AD9FFD2E       JSR [0xfd2e]                      
  3f5e  C600           LDB #0x0                          
  3f60  AD9FFC36       JSR [0xfc36]                      
  3f64  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "       clearing sample memory .........."
  3f68  202020202020.. char[41] "       clearing sample memory .........."
LAB_M78_r3_24000__3f91:
  3f91  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0014 $7188
  3f95  0014           dw 14h                            
  3f97  7188           dw 7188h                          
LAB_M78_r3_24000__3f99:
  3f99  AD9FFD3E       JSR [0xfd3e]                      
  3f9d  10830005       CMPD #0x5                         
  3fa1  260A           BNE 0x3fad                        
  3fa3  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $000E $7188
  3fa7  000E           dw Eh                             
  3fa9  7188           dw 7188h                          
LAB_M78_r3_24000__3fab:
  3fab  20E4           BRA 0x3f91                        
LAB_M78_r3_24000__3fad:
  3fad  CC0000         LDD #0x0                          
  3fb0  FD70EC         STD 0x70ec                        
  3fb3  FD70EE         STD 0x70ee                        
  3fb6  FD70F0         STD 0x70f0                        
  3fb9  FD70F2         STD 0x70f2                        
  3fbc  FD70F4         STD 0x70f4                        
  3fbf  FD70F6         STD 0x70f6                        
  3fc2  FD70F8         STD 0x70f8                        
  3fc5  FD70FA         STD 0x70fa                        
  3fc8  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $0038 $7188
  3fcc  0038           dw 38h                            
  3fce  7188           dw 7188h                          
LAB_M78_r3_24000__3fd0:
  3fd0  AD9FFD26       JSR [0xfd26]                       ; inline[API_FD26]: $003A $7188
  3fd4  003A           dw 3Ah                            
  3fd6  7188           dw 7188h                          
LAB_M78_r3_24000__3fd8:
  3fd8  17F6B9         LBSR 0x3694                       
  3fdb  3576           PULS  A B X Y U                   
  3fdd  39             RTS                               

;; End of record chain
END_OF_CHAIN_hdr:
  3fde  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3fe6  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff6  .db FF FF FF FF FF FF FF FF FF 5C                    ; .........\
