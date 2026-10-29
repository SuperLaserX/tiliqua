; H3500  block M76_r4_0c000  M76_r4_0c000::0000-M76_r4_0c000::3fff
; Bank r4_0c000 (module id 76, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 76 parameter/preset table "STRING MODELLER", 251 bytes
MODULE_76_TABLE_STRING_MODELLER_hdr:
  0008  760001030000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_76_TABLE_STRING_MODELLER:
  0010  76             ?? 76h    v                       
  0011  .db 01                                               ; .
  0012  535452494E47.. ds "STRING MODELLER"              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0054  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0064  .db 00 09 60 00 00 00 3C 00 00 00 00 00 00 00 3C 00  ; ..`...<.......<.
  0074  .db 00 00 00 00 00 00 00 00 00 00 28 00 00 00 00 00  ; ..........(.....
  0084  .db 00 00 64 00 00 00 00 00 00 23 28 00 00 00 00 00  ; ..d......#(.....
  0094  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 19 00  ; ................
  00a4  .db 00 00 08 00 28 00 00 00 64 00 00 00 00 00 64 00  ; ....(...d.....d.
  00b4  .db 64 00 00 00 00 00 00 00 00 02 00 1A 00 1C 00 1E  ; d...............
  00c4  .db 00 20 00 22 00 24 00 00 00 00 00 00 00 00 00     ; . .".$.........
  00d3  204B6E6F6220.. ds " Knob 1  Knob 2  Knob 3  Knob 4 "
  00f4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0104  .db 00 00 00 00 00 00 00                             ; .......

;; Module 76 code record 01, 8531 bytes, entered at payload start
MODULE_76_01_CODE_hdr:
  010b  7601215B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_76_01_entry
MODULE_76_01_entry:
  0113  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0117
  0117  0117           dw 117h                           
LAB_M76_r4_0c000__0119:
  0119  3477           PSHS  U Y X B A CC                
  011b  108E7000       LDY #0x7000                       
  011f  CC0000         LDD #0x0                          
  0122  8E0512         LDX #0x512                        
LAB_M76_r4_0c000__0125:
  0125  EDA1           STD ,Y++                          
  0127  301F           LEAX -0x1,X                       
  0129  2EFA           BGT 0x0125                        
  012b  1700AB         LBSR 0x01d9                       
  012e  17007E         LBSR 0x01af                       
  0131  170086         LBSR 0x01ba                       
  0134  C600           LDB #0x0                          
  0136  AD9FFC58       JSR [0xfc58]                      
  013a  8603           LDA #0x3                          
  013c  B760DA         STA 0x60da                        
  013f  AD9FFE38       JSR [0xfe38]                      
  0143  B6600A         LDA 0x600a                        
  0146  8176           CMPA #0x76                        
  0148  2703           BEQ 0x014d                        
  014a  17002A         LBSR 0x0177                       
LAB_M76_r4_0c000__014d:
  014d  170177         LBSR 0x02c7                       
  0150  170249         LBSR 0x039c                       
  0153  B6600A         LDA 0x600a                        
  0156  8176           CMPA #0x76                        
  0158  2707           BEQ 0x0161                        
  015a  CC4E20         LDD #0x4e20                       
  015d  AD9FFD20       JSR [0xfd20]                      
LAB_M76_r4_0c000__0161:
  0161  AD9FFE36       JSR [0xfe36]                      
  0165  AD9FFDF6       JSR [0xfdf6]                      
  0169  AD9FFE18       JSR [0xfe18]                      
  016d  1705E1         LBSR 0x0751                       
  0170  AD9FFE10       JSR [0xfe10]                      
  0174  3577           PULS CC A B X Y U                 
  0176  39             RTS                               

; ---- function FUN_M76_r4_0c000__0177
FUN_M76_r4_0c000__0177:
  0177  3476           PSHS  U Y X B A                   
  0179  AD9FFDFA       JSR [0xfdfa]                      
  017d  AD9FFED0       JSR [0xfed0]                      
  0181  C601           LDB #0x1                          
  0183  8E7610         LDX #0x7610                       
  0186  AD9FFD30       JSR [0xfd30]                      
  018a  1026058D       LBNE 0x071b                       
  018e  C602           LDB #0x2                          
  0190  8E7611         LDX #0x7611                       
  0193  AD9FFD30       JSR [0xfd30]                      
  0197  10260580       LBNE 0x071b                       
  019b  C603           LDB #0x3                          
  019d  8E7612         LDX #0x7612                       
  01a0  AD9FFD30       JSR [0xfd30]                      
  01a4  10260573       LBNE 0x071b                       
  01a8  AD9FFD7C       JSR [0xfd7c]                      
  01ac  3576           PULS  A B X Y U                   
  01ae  39             RTS                               

; ---- function FUN_M76_r4_0c000__01af
FUN_M76_r4_0c000__01af:
  01af  3406           PSHS  B A                         
  01b1  CC0000         LDD #0x0                          
  01b4  FD7126         STD 0x7126                        
  01b7  3506           PULS  A B                         
  01b9  39             RTS                               

; ---- function FUN_M76_r4_0c000__01ba
FUN_M76_r4_0c000__01ba:
  01ba  3476           PSHS  U Y X B A                   
  01bc  CC0000         LDD #0x0                          
  01bf  AD9FFC6C       JSR [0xfc6c]                      
  01c3  AD9FFC74       JSR [0xfc74]                      
  01c7  171E6C         LBSR 0x2036                       
  01ca  171EE4         LBSR 0x20b1                       
  01cd  171F5C         LBSR 0x212c                       
  01d0  171FD4         LBSR 0x21a7                       
  01d3  171DC6         LBSR 0x1f9c                       
  01d6  3576           PULS  A B X Y U                   
  01d8  39             RTS                               

; ---- function FUN_M76_r4_0c000__01d9
FUN_M76_r4_0c000__01d9:
  01d9  3476           PSHS  U Y X B A                   
  01db  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 61:00 63:06 65:0A 67:14
  01df  61             db 61h                            
  01e0  00             db 0h                             
  01e1  63             db 63h                            
  01e2  06             db 6h                             
  01e3  65             db 65h                            
  01e4  0A             db Ah                             
  01e5  67             db 67h                            
  01e6  14             db 14h                            
  01e7  00             db 0h                             
LAB_M76_r4_0c000__01e8:
  01e8  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 69:1E 6B:24 6D:28 6F:32
  01ec  69             db 69h                            
  01ed  1E             db 1Eh                            
  01ee  6B             db 6Bh                            
  01ef  24             db 24h                            
  01f0  6D             db 6Dh                            
  01f1  28             db 28h                            
  01f2  6F             db 6Fh                            
  01f3  32             db 32h                            
  01f4  00             db 0h                             
LAB_M76_r4_0c000__01f5:
  01f5  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 75:5A 77:60 79:64 7B:6E
  01f9  75             db 75h                            
  01fa  5A             db 5Ah                            
  01fb  77             db 77h                            
  01fc  60             db 60h                            
  01fd  79             db 79h                            
  01fe  64             db 64h                            
  01ff  7B             db 7Bh                            
  0200  6E             db 6Eh                            
  0201  00             db 0h                             
LAB_M76_r4_0c000__0202:
  0202  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 85:A6 87:A8
  0206  85             db 85h                            
  0207  A6             db A6h                            
  0208  87             db 87h                            
  0209  A8             db A8h                            
  020a  00             db 0h                             
LAB_M76_r4_0c000__020b:
  020b  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 89:AA 8B:AC
  020f  89             db 89h                            
  0210  AA             db AAh                            
  0211  8B             db 8Bh                            
  0212  AC             db ACh                            
  0213  00             db 0h                             
LAB_M76_r4_0c000__0214:
  0214  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 8D:AE 8F:B0
  0218  8D             db 8Dh                            
  0219  AE             db AEh                            
  021a  8F             db 8Fh                            
  021b  B0             db B0h                            
  021c  00             db 0h                             
LAB_M76_r4_0c000__021d:
  021d  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 91:B6 93:B8
  0221  91             db 91h                            
  0222  B6             db B6h                            
  0223  93             db 93h                            
  0224  B8             db B8h                            
  0225  00             db 0h                             
LAB_M76_r4_0c000__0226:
  0226  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 95:B2 97:B4
  022a  95             db 95h                            
  022b  B2             db B2h                            
  022c  97             db 97h                            
  022d  B4             db B4h                            
  022e  00             db 0h                             
LAB_M76_r4_0c000__022f:
  022f  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 5D:96 5F:98
  0233  5D             db 5Dh                            
  0234  96             db 96h                            
  0235  5F             db 5Fh                            
  0236  98             db 98h                            
  0237  00             db 0h                             
LAB_M76_r4_0c000__0238:
  0238  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: AD:9A AF:9C
  023c  AD             db ADh                            
  023d  9A             db 9Ah                            
  023e  AF             db AFh                            
  023f  9C             db 9Ch                            
  0240  00             db 0h                             
LAB_M76_r4_0c000__0241:
  0241  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: B1:A2 B3:A4
  0245  B1             db B1h                            
  0246  A2             db A2h                            
  0247  B3             db B3h                            
  0248  A4             db A4h                            
  0249  00             db 0h                             
LAB_M76_r4_0c000__024a:
  024a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 71:9E 73:A0
  024e  71             db 71h                            
  024f  9E             db 9Eh                            
  0250  73             db 73h                            
  0251  A0             db A0h                            
  0252  00             db 0h                             
LAB_M76_r4_0c000__0253:
  0253  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 7D:3C 7F:42 81:46 83:50
  0257  7D             db 7Dh                            
  0258  3C             db 3Ch                            
  0259  7F             db 7Fh                            
  025a  42             db 42h                            
  025b  81             db 81h                            
  025c  46             db 46h                            
  025d  83             db 83h                            
  025e  50             db 50h                            
  025f  00             db 0h                             
LAB_M76_r4_0c000__0260:
  0260  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 99:BA 9B:BC
  0264  99             db 99h                            
  0265  BA             db BAh                            
  0266  9B             db 9Bh                            
  0267  BC             db BCh                            
  0268  00             db 0h                             
LAB_M76_r4_0c000__0269:
  0269  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A9:BE AB:C0
  026d  A9             db A9h                            
  026e  BE             db BEh                            
  026f  AB             db ABh                            
  0270  C0             db C0h                            
  0271  00             db 0h                             
LAB_M76_r4_0c000__0272:
  0272  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A3:CC
  0276  A3             db A3h                            
  0277  CC             db CCh                            
  0278  00             db 0h                             
LAB_M76_r4_0c000__0279:
  0279  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9F:D0
  027d  9F             db 9Fh                            
  027e  D0             db D0h                            
  027f  00             db 0h                             
LAB_M76_r4_0c000__0280:
  0280  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9D:CE
  0284  9D             db 9Dh                            
  0285  CE             db CEh                            
  0286  00             db 0h                             
LAB_M76_r4_0c000__0287:
  0287  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: B5:CA
  028b  B5             db B5h                            
  028c  CA             db CAh                            
  028d  00             db 0h                             
LAB_M76_r4_0c000__028e:
  028e  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A5:82
  0292  A5             db A5h                            
  0293  82             db 82h                            
  0294  00             db 0h                             
LAB_M76_r4_0c000__0295:
  0295  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: B7:D2 B9:D6 BB:DA BD:DE BF:E2 C1:E6
  0299  B7             db B7h                            
  029a  D2             db D2h                            
  029b  B9             db B9h                            
  029c  D6             db D6h                            
  029d  BB             db BBh                            
  029e  DA             db DAh                            
  029f  BD             db BDh                            
  02a0  DE             db DEh                            
  02a1  BF             db BFh                            
  02a2  E2             db E2h                            
  02a3  C1             db C1h                            
  02a4  E6             db E6h                            
  02a5  00             db 0h                             
LAB_M76_r4_0c000__02a6:
  02a6  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: B8:D4 BA:D8 BC:DC BE:E0 C0:E4 C2:E8
  02aa  B8             db B8h                            
  02ab  D4             db D4h                            
  02ac  BA             db BAh                            
  02ad  D8             db D8h                            
  02ae  BC             db BCh                            
  02af  DC             db DCh                            
  02b0  BE             db BEh                            
  02b1  E0             db E0h                            
  02b2  C0             db C0h                            
  02b3  E4             db E4h                            
  02b4  C2             db C2h                            
  02b5  E8             db E8h                            
  02b6  00             db 0h                             
LAB_M76_r4_0c000__02b7:
  02b7  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:C2 1A:C4 1B:C6 1C:C8
  02bb  19             db 19h                            
  02bc  C2             db C2h                            
  02bd  1A             db 1Ah                            
  02be  C4             db C4h                            
  02bf  1B             db 1Bh                            
  02c0  C6             db C6h                            
  02c1  1C             db 1Ch                            
  02c2  C8             db C8h                            
  02c3  00             db 0h                             
LAB_M76_r4_0c000__02c4:
  02c4  3576           PULS  A B X Y U                   
  02c6  39             RTS                               

; ---- function FUN_M76_r4_0c000__02c7
FUN_M76_r4_0c000__02c7:
  02c7  3476           PSHS  U Y X B A                   
  02c9  CC0000         LDD #0x0                          
  02cc  F7713F         STB 0x713f                        
  02cf  108E0007       LDY #0x7                          
  02d3  AD9FFD2E       JSR [0xfd2e]                      
  02d7  108E0005       LDY #0x5                          
  02db  AD9FFD2E       JSR [0xfd2e]                      
  02df  108E0004       LDY #0x4                          
  02e3  AD9FFD2E       JSR [0xfd2e]                      
  02e7  108E0003       LDY #0x3                          
  02eb  AD9FFD2E       JSR [0xfd2e]                      
  02ef  172408         LBSR 0x26fa                       
  02f2  171F80         LBSR 0x2275                       
  02f5  8E0A78         LDX #0xa78                        
  02f8  AD9FFE76       JSR [0xfe76]                      
  02fc  170891         LBSR 0x0b90                       
  02ff  170B9F         LBSR 0x0ea1                       
  0302  8E0BD3         LDX #0xbd3                        
  0305  AD9FFE76       JSR [0xfe76]                      
  0309  8E0CF4         LDX #0xcf4                        
  030c  AD9FFE76       JSR [0xfe76]                      
  0310  1709D5         LBSR 0x0ce8                       
  0313  170C1A         LBSR 0x0f30                       
  0316  170D35         LBSR 0x104e                       
  0319  170DC4         LBSR 0x10e0                       
  031c  8E1337         LDX #0x1337                       
  031f  AD9FFE76       JSR [0xfe76]                      
  0323  8E142B         LDX #0x142b                       
  0326  AD9FFE76       JSR [0xfe76]                      
  032a  1710EF         LBSR 0x141c                       
  032d  170AD9         LBSR 0x0e09                       
  0330  171453         LBSR 0x1786                       
  0333  1715CA         LBSR 0x1900                       
  0336  1714CB         LBSR 0x1804                       
  0339  1713CC         LBSR 0x1708                       
  033c  171543         LBSR 0x1882                       
  033f  17124C         LBSR 0x158e                       
  0342  1712C7         LBSR 0x160c                       
  0345  1711C8         LBSR 0x1510                       
  0348  17133F         LBSR 0x168a                       
  034b  8E1913         LDX #0x1913                       
  034e  AD9FFE76       JSR [0xfe76]                      
  0352  1716AE         LBSR 0x1a03                       
  0355  8E1A14         LDX #0x1a14                       
  0358  AD9FFE76       JSR [0xfe76]                      
  035c  1717A5         LBSR 0x1b04                       
  035f  8E1B15         LDX #0x1b15                       
  0362  AD9FFE76       JSR [0xfe76]                      
  0366  17189C         LBSR 0x1c05                       
  0369  8E1C16         LDX #0x1c16                       
  036c  AD9FFE76       JSR [0xfe76]                      
  0370  171993         LBSR 0x1d06                       
  0373  8E1D17         LDX #0x1d17                       
  0376  AD9FFE76       JSR [0xfe76]                      
  037a  171A8A         LBSR 0x1e07                       
  037d  8E1E18         LDX #0x1e18                       
  0380  AD9FFE76       JSR [0xfe76]                      
  0384  171B81         LBSR 0x1f08                       
  0387  170DE8         LBSR 0x1172                       
  038a  170E77         LBSR 0x1204                       
  038d  170F06         LBSR 0x1296                       
  0390  170F95         LBSR 0x1328                       
  0393  170C11         LBSR 0x0fa7                       
  0396  171ED5         LBSR 0x226e                       
  0399  3576           PULS  A B X Y U                   
  039b  39             RTS                               

; ---- function FUN_M76_r4_0c000__039c
FUN_M76_r4_0c000__039c:
  039c  3476           PSHS  U Y X B A                   
  039e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " pitch  " 21 $0ACE $0ADA
  03a2  00             db 0h                             
  03a3  80             db 80h                            
  03a4  207069746368.. ds " pitch  "                     
  03ac  21             db 21h                            
  03ad  0ACE           addr M76_r4_0c000::0ace           
  03af  0ADA           addr M76_r4_0c000::0ada           
LAB_M76_r4_0c000__03b1:
  03b1  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " offset " 25 $0B63 $0B6F
  03b5  01             db 1h                             
  03b6  80             db 80h                            
  03b7  206F66667365.. ds " offset "                     
  03bf  25             db 25h                            
  03c0  0B63           addr M76_r4_0c000::0b63           
  03c2  0B6F           addr M76_r4_0c000::0b6f           
LAB_M76_r4_0c000__03c4:
  03c4  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "  gate  " 29 $0F03 $0F0F
  03c8  02             db 2h                             
  03c9  80             db 80h                            
  03ca  202067617465.. ds "  gate  "                     
  03d2  29             db 29h                            
  03d3  0F03           addr M76_r4_0c000::0f03           
  03d5  0F0F           addr M76_r4_0c000::0f0f           
LAB_M76_r4_0c000__03d7:
  03d7  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 " decay  " 2D $0C29 $0C35
  03db  03             db 3h                             
  03dc  80             db 80h                            
  03dd  206465636179.. ds " decay  "                     
  03e5  2D             db 2Dh                            
  03e6  0C29           addr M76_r4_0c000::0c29           
  03e8  0C35           addr M76_r4_0c000::0c35           
LAB_M76_r4_0c000__03ea:
  03ea  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "release " 31 $0D4A $0D56
  03ee  04             db 4h                             
  03ef  80             db 80h                            
  03f0  72656C656173.. ds "release "                     
  03f8  31             db 31h                            
  03f9  0D4A           addr M76_r4_0c000::0d4a           
  03fb  0D56           addr M76_r4_0c000::0d56           
LAB_M76_r4_0c000__03fd:
  03fd  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "high amt" 35 $1145 $1151
  0401  05             db 5h                             
  0402  80             db 80h                            
  0403  686967682061.. ds "high amt"                     
  040b  35             db 35h                            
  040c  1145           addr M76_r4_0c000::1145           
  040e  1151           addr M76_r4_0c000::1151           
LAB_M76_r4_0c000__0410:
  0410  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "band amt" 39 $11D7 $11E3
  0414  06             db 6h                             
  0415  80             db 80h                            
  0416  62616E642061.. ds "band amt"                     
  041e  39             db 39h                            
  041f  11D7           addr M76_r4_0c000::11d7           
  0421  11E3           addr M76_r4_0c000::11e3           
LAB_M76_r4_0c000__0423:
  0423  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 " low amt" 3D $1269 $1275
  0427  07             db 7h                             
  0428  80             db 80h                            
  0429  206C6F772061.. ds " low amt"                     
  0431  3D             db 3Dh                            
  0432  1269           addr M76_r4_0c000::1269           
  0434  1275           addr M76_r4_0c000::1275           
LAB_M76_r4_0c000__0436:
  0436  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 " in amt " 41 $12FB $1307
  043a  08             db 8h                             
  043b  80             db 80h                            
  043c  20696E20616D.. ds " in amt "                     
  0444  41             db 41h                            
  0445  12FB           addr M76_r4_0c000::12fb           
  0447  1307           addr M76_r4_0c000::1307           
LAB_M76_r4_0c000__0449:
  0449  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 "fil freq" 45 $1021 $102D
  044d  09             db 9h                             
  044e  80             db 80h                            
  044f  66696C206672.. ds "fil freq"                     
  0457  45             db 45h                            
  0458  1021           addr M76_r4_0c000::1021           
  045a  102D           addr M76_r4_0c000::102d           
LAB_M76_r4_0c000__045c:
  045c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "filter q" 49 $10B3 $10BF
  0460  0A             db Ah                             
  0461  80             db 80h                            
  0462  66696C746572.. ds "filter q"                     
  046a  49             db 49h                            
  046b  10B3           addr M76_r4_0c000::10b3           
  046d  10BF           addr M76_r4_0c000::10bf           
LAB_M76_r4_0c000__046f:
  046f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 " bright " 4D $0CBB $0CC7
  0473  0B             db Bh                             
  0474  80             db 80h                            
  0475  206272696768.. ds " bright "                     
  047d  4D             db 4Dh                            
  047e  0CBB           addr M76_r4_0c000::0cbb           
  0480  0CC7           addr M76_r4_0c000::0cc7           
LAB_M76_r4_0c000__0482:
  0482  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0C 80 " sustain" 51 $0DDC $0DE8
  0486  0C             db Ch                             
  0487  80             db 80h                            
  0488  207375737461.. ds " sustain"                     
  0490  51             db 51h                            
  0491  0DDC           addr M76_r4_0c000::0ddc           
  0493  0DE8           addr M76_r4_0c000::0de8           
LAB_M76_r4_0c000__0495:
  0495  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0D 80 "  hold  " 55 $0E74 $0E80
  0499  0D             db Dh                             
  049a  80             db 80h                            
  049b  2020686F6C64.. ds "  hold  "                     
  04a3  55             db 55h                            
  04a4  0E74           addr M76_r4_0c000::0e74           
  04a6  0E80           addr M76_r4_0c000::0e80           
LAB_M76_r4_0c000__04a8:
  04a8  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0E 80 "  mix   " 59 $1F6F $1F7B
  04ac  0E             db Eh                             
  04ad  80             db 80h                            
  04ae  20206D697820.. ds "  mix   "                     
  04b6  59             db 59h                            
  04b7  1F6F           addr M76_r4_0c000::1f6f           
  04b9  1F7B           addr M76_r4_0c000::1f7b           
LAB_M76_r4_0c000__04bb:
  04bb  CC04D7         LDD #0x4d7                        
  04be  FD60F5         STD 0x60f5                        
  04c1  CC005A         LDD #0x5a                         
  04c4  47             ASRA                              
  04c5  56             RORB                              
  04c6  FD60F7         STD 0x60f7                        
  04c9  8601           LDA #0x1                          
  04cb  B76105         STA 0x6105                        
  04ce  CC00C3         LDD #0xc3                         
  04d1  FD6106         STD 0x6106                        
  04d4  3576           PULS  A B X Y U                   
  04d6  39             RTS                               
  04d7  0531053C0547.. addr[18]                          
  04fb  .db 05 F7 05 F8 06 03 06 0E 06 19 06 24 06 2F 06 3A  ; ...........$./.:
  050b  .db 06 45 06 50 06 5B 06 66 06 71 06 7C 06 87 06 92  ; .E.P.[.f.q.|....
  051b  .db 06 9D 06 A8 06 B3 06 BE 06 C9 06 D4 06 DF 06 EA  ; ................
  052b  .db 06 F5 07 00 07 0B                                ; ......

; ---- function FUN_M76_r4_0c000__0531
FUN_M76_r4_0c000__0531:
  0531  170576         LBSR 0x0aaa                       
  0534  17021A         LBSR 0x0751                       
  0537  AD9FFE10       JSR [0xfe10]                      
  053b  39             RTS                               

; ---- function FUN_M76_r4_0c000__053c
FUN_M76_r4_0c000__053c:
  053c  1706C6         LBSR 0x0c05                       
  053f  17020F         LBSR 0x0751                       
  0542  AD9FFE12       JSR [0xfe12]                      
  0546  39             RTS                               

; ---- function FUN_M76_r4_0c000__0547
FUN_M76_r4_0c000__0547:
  0547  1707DC         LBSR 0x0d26                       
  054a  170204         LBSR 0x0751                       
  054d  AD9FFE14       JSR [0xfe14]                      
  0551  39             RTS                               

; ---- function FUN_M76_r4_0c000__0552
FUN_M76_r4_0c000__0552:
  0552  170863         LBSR 0x0db8                       
  0555  1701F9         LBSR 0x0751                       
  0558  AD9FFE16       JSR [0xfe16]                      
  055c  39             RTS                               

; ---- function FUN_M76_r4_0c000__055d
FUN_M76_r4_0c000__055d:
  055d  17097F         LBSR 0x0edf                       
  0560  170227         LBSR 0x078a                       
  0563  AD9FFE10       JSR [0xfe10]                      
  0567  39             RTS                               

; ---- function FUN_M76_r4_0c000__0568
FUN_M76_r4_0c000__0568:
  0568  170A03         LBSR 0x0f6e                       
  056b  17021C         LBSR 0x078a                       
  056e  AD9FFE12       JSR [0xfe12]                      
  0572  39             RTS                               

; ---- function FUN_M76_r4_0c000__0573
FUN_M76_r4_0c000__0573:
  0573  1708DA         LBSR 0x0e50                       
  0576  170211         LBSR 0x078a                       
  0579  AD9FFE14       JSR [0xfe14]                      
  057d  39             RTS                               

; ---- function FUN_M76_r4_0c000__057e
FUN_M76_r4_0c000__057e:
  057e  1705BE         LBSR 0x0b3f                       
  0581  170206         LBSR 0x078a                       
  0584  AD9FFE16       JSR [0xfe16]                      
  0588  39             RTS                               

; ---- function FUN_M76_r4_0c000__0589
FUN_M76_r4_0c000__0589:
  0589  170A71         LBSR 0x0ffd                       
  058c  170234         LBSR 0x07c3                       
  058f  AD9FFE10       JSR [0xfe10]                      
  0593  39             RTS                               

; ---- function FUN_M76_r4_0c000__0594
FUN_M76_r4_0c000__0594:
  0594  170AF8         LBSR 0x108f                       
  0597  170229         LBSR 0x07c3                       
  059a  AD9FFE12       JSR [0xfe12]                      
  059e  39             RTS                               

; ---- function FUN_M76_r4_0c000__059f
FUN_M76_r4_0c000__059f:
  059f  1706F5         LBSR 0x0c97                       
  05a2  17021E         LBSR 0x07c3                       
  05a5  AD9FFE16       JSR [0xfe16]                      
  05a9  39             RTS                               

; ---- function FUN_M76_r4_0c000__05aa
FUN_M76_r4_0c000__05aa:
  05aa  170B74         LBSR 0x1121                       
  05ad  170245         LBSR 0x07f5                       
  05b0  AD9FFE10       JSR [0xfe10]                      
  05b4  39             RTS                               

; ---- function FUN_M76_r4_0c000__05b5
FUN_M76_r4_0c000__05b5:
  05b5  170BFB         LBSR 0x11b3                       
  05b8  17023A         LBSR 0x07f5                       
  05bb  AD9FFE12       JSR [0xfe12]                      
  05bf  39             RTS                               

; ---- function FUN_M76_r4_0c000__05c0
FUN_M76_r4_0c000__05c0:
  05c0  170C82         LBSR 0x1245                       
  05c3  17022F         LBSR 0x07f5                       
  05c6  AD9FFE14       JSR [0xfe14]                      
  05ca  39             RTS                               

; ---- function FUN_M76_r4_0c000__05cb
FUN_M76_r4_0c000__05cb:
  05cb  170D09         LBSR 0x12d7                       
  05ce  170224         LBSR 0x07f5                       
  05d1  AD9FFE16       JSR [0xfe16]                      
  05d5  39             RTS                               

; ---- function FUN_M76_r4_0c000__05d6
FUN_M76_r4_0c000__05d6:
  05d6  170D90         LBSR 0x1369                       
  05d9  170252         LBSR 0x082e                       
  05dc  AD9FFE10       JSR [0xfe10]                      
  05e0  39             RTS                               

; ---- function FUN_M76_r4_0c000__05e1
FUN_M76_r4_0c000__05e1:
  05e1  170DFF         LBSR 0x13e3                       
  05e4  170247         LBSR 0x082e                       
  05e7  AD9FFE12       JSR [0xfe12]                      
  05eb  39             RTS                               

; ---- function FUN_M76_r4_0c000__05ec
FUN_M76_r4_0c000__05ec:
  05ec  170E6E         LBSR 0x145d                       
  05ef  17023C         LBSR 0x082e                       
  05f2  AD9FFE14       JSR [0xfe14]                      
  05f6  39             RTS                               
  05f7  .db 39 17 19 50 17 02 62 AD 9F FE 12 39 17 11 47 17  ; 9..P..b....9..G.
  0607  .db 02 89 AD 9F FE 10 39 17 10 BE 17 02 7E AD 9F FE  ; ......9.....~...
  0617  .db 12 39 17 12 2D 17 02 73 AD 9F FE 14 39 17 11 A4  ; .9..-..s....9...
  0627  .db 17 02 68 AD 9F FE 16 39 17 0F 23 17 02 96 AD 9F  ; ..h....9..#.....
  0637  .db FE 10 39 17 0E 9A 17 02 8B AD 9F FE 12 39 17 10  ; ..9..........9..
  0647  .db 09 17 02 80 AD 9F FE 14 39 17 0F 80 17 02 75 AD  ; ........9.....u.
  0657  .db 9F FE 16 39 17 12 69 17 02 A3 AD 9F FE 10 39 17  ; ...9..i.......9.
  0667  .db 12 DC 17 02 D1 AD 9F FE 10 39 17 13 D2 17 02 C6  ; .........9......
  0677  .db AD 9F FE 12 39 17 14 C8 17 02 BB AD 9F FE 14 39  ; ....9..........9
  0687  .db 17 15 BE 17 02 B0 AD 9F FE 16 39 17 16 B4 17 02  ; ..........9.....
  0697  .db DE AD 9F FE 10 39 17 17 AA 17 02 D3 AD 9F FE 12  ; .....9..........
  06a7  .db 39 17 13 1F 17 02 FA AD 9F FE 10 39 17 14 15 17  ; 9..........9....
  06b7  .db 02 EF AD 9F FE 12 39 17 15 0B 17 02 E4 AD 9F FE  ; ......9.........
  06c7  .db 14 39 17 16 01 17 02 D9 AD 9F FE 16 39 17 16 F7  ; .9..........9...
  06d7  .db 17 03 07 AD 9F FE 10 39 17 17 ED 17 02 FC AD 9F  ; .......9........
  06e7  .db FE 12 39 17 19 10 17 03 23 AD 9F FE 10 39 17 19  ; ..9.....#....9..
  06f7  .db 80 17 03 18 AD 9F FE 12 39 17 19 F0 17 03 3F AD  ; ........9.....?.
  0707  .db 9F FE 10 39 17 1A 60 17 03 34 AD 9F FE 12 39 AD  ; ...9..`..4....9.
  0717  .db 9F FD FC 39                                      ; ...9
LAB_M76_r4_0c000__071b:
  071b  C600           LDB #0x0                          
  071d  AD9FFC36       JSR [0xfc36]                      
  0721  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0725  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M76_r4_0c000__074e:
  074e  3576           PULS  A B X Y U                   
  0750  39             RTS                               

; ---- function FUN_M76_r4_0c000__0751
FUN_M76_r4_0c000__0751:
  0751  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pitch  " " decay  " "release " "sustain "
  0755  207069746368.. ds " pitch  "                     
  075d  206465636179.. ds " decay  "                     
  0765  72656C656173.. ds "release "                     
  076d  737573746169.. ds "sustain "                     
LAB_M76_r4_0c000__0775:
  0775  AD9FFDF2       JSR [0xfdf2]                      
  0779  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A9E ->$0BF9 ->$0D1A ->$0DAC ->$078A ->$0860
  077d  0A9E           addr M76_r4_0c000::0a9e           
  077f  0BF9           addr M76_r4_0c000::0bf9           
  0781  0D1A           addr M76_r4_0c000::0d1a           
  0783  0DAC           addr M76_r4_0c000::0dac           
  0785  078A           addr M76_r4_0c000::078a           
  0787  0860           addr M76_r4_0c000::0860           
LAB_M76_r4_0c000__0789:
  0789  39             RTS                               

; ---- function FUN_M76_r4_0c000__078a
FUN_M76_r4_0c000__078a:
  078a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  gate  " "gatemode" "  hold  " " offset "
  078e  202067617465.. ds "  gate  "                     
  0796  676174656D6F.. ds "gatemode"                     
  079e  2020686F6C64.. ds "  hold  "                     
  07a6  206F66667365.. ds " offset "                     
LAB_M76_r4_0c000__07ae:
  07ae  AD9FFDF2       JSR [0xfdf2]                      
  07b2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ED3 ->$0F62 ->$0E44 ->$0B33 ->$07C3 ->$0751
  07b6  0ED3           addr M76_r4_0c000::0ed3           
  07b8  0F62           addr M76_r4_0c000::0f62           
  07ba  0E44           addr M76_r4_0c000::0e44           
  07bc  0B33           addr M76_r4_0c000::0b33           
  07be  07C3           addr M76_r4_0c000::07c3           
  07c0  0751           addr M76_r4_0c000::0751           
LAB_M76_r4_0c000__07c2:
  07c2  39             RTS                               

; ---- function FUN_M76_r4_0c000__07c3
FUN_M76_r4_0c000__07c3:
  07c3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "fil freq" "filter q" [*] " bright "
  07c7  66696C206672.. ds "fil freq"                     
  07cf  66696C746572.. ds "filter q"                     
  07d7  01             db 1h                             
  07d8  206272696768.. ds " bright "                     
LAB_M76_r4_0c000__07e0:
  07e0  AD9FFDF2       JSR [0xfdf2]                      
  07e4  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0FF1 ->$1083 ->$0A77 ->$0C8B ->$07F5 ->$078A
  07e8  0FF1           addr M76_r4_0c000::0ff1           
  07ea  1083           addr M76_r4_0c000::1083           
  07ec  0A77           addr M76_r4_0c000::0a77           
  07ee  0C8B           addr M76_r4_0c000::0c8b           
  07f0  07F5           addr M76_r4_0c000::07f5           
  07f2  078A           addr M76_r4_0c000::078a           
LAB_M76_r4_0c000__07f4:
  07f4  39             RTS                               

; ---- function FUN_M76_r4_0c000__07f5
FUN_M76_r4_0c000__07f5:
  07f5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "high amt" "band amt" "low amt " " in amt "
  07f9  686967682061.. ds "high amt"                     
  0801  62616E642061.. ds "band amt"                     
  0809  6C6F7720616D.. ds "low amt "                     
  0811  20696E20616D.. ds " in amt "                     
LAB_M76_r4_0c000__0819:
  0819  AD9FFDF2       JSR [0xfdf2]                      
  081d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1115 ->$11A7 ->$1239 ->$12CB ->$082E ->$07C3
  0821  1115           addr M76_r4_0c000::1115           
  0823  11A7           addr M76_r4_0c000::11a7           
  0825  1239           addr M76_r4_0c000::1239           
  0827  12CB           addr M76_r4_0c000::12cb           
  0829  082E           addr M76_r4_0c000::082e           
  082b  07C3           addr M76_r4_0c000::07c3           
LAB_M76_r4_0c000__082d:
  082d  39             RTS                               

; ---- function FUN_M76_r4_0c000__082e
FUN_M76_r4_0c000__082e:
  082e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " chorus " " speed  " " depth  " [*]
  0832  2063686F7275.. ds " chorus "                     
  083a  207370656564.. ds " speed  "                     
  0842  206465707468.. ds " depth  "                     
  084a  01             db 1h                             
LAB_M76_r4_0c000__084b:
  084b  AD9FFDF2       JSR [0xfdf2]                      
  084f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$135D ->$13D7 ->$1451 ->$0A77 ->$0860 ->$07F5
  0853  135D           addr M76_r4_0c000::135d           
  0855  13D7           addr M76_r4_0c000::13d7           
  0857  1451           addr M76_r4_0c000::1451           
  0859  0A77           addr M76_r4_0c000::0a77           
  085b  0860           addr M76_r4_0c000::0860           
  085d  07F5           addr M76_r4_0c000::07f5           
LAB_M76_r4_0c000__085f:
  085f  39             RTS                               

; ---- function FUN_M76_r4_0c000__0860
FUN_M76_r4_0c000__0860:
  0860  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " levels " "  mix   " [*] " expert "
  0864  206C6576656C.. ds " levels "                     
  086c  20206D697820.. ds "  mix   "                     
  0874  01             db 1h                             
  0875  206578706572.. ds " expert "                     
LAB_M76_r4_0c000__087d:
  087d  AD9FFDF2       JSR [0xfdf2]                      
  0881  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0A13 ->$1F3F ->$0A77 ->$08CB ->$0751 ->$082E
  0885  0A13           addr M76_r4_0c000::0a13           
  0887  1F3F           addr M76_r4_0c000::1f3f           
  0889  0A77           addr M76_r4_0c000::0a77           
  088b  08CB           addr M76_r4_0c000::08cb           
  088d  0751           addr M76_r4_0c000::0751           
  088f  082E           addr M76_r4_0c000::082e           
LAB_M76_r4_0c000__0891:
  0891  39             RTS                               

; ---- function FUN_M76_r4_0c000__0892
FUN_M76_r4_0c000__0892:
  0892  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "decay KS" "gate  KS" "level KS" "brightKS"
  0896  646563617920.. ds "decay KS"                     
  089e  676174652020.. ds "gate  KS"                     
  08a6  6C6576656C20.. ds "level KS"                     
  08ae  627269676874.. ds "brightKS"                     
LAB_M76_r4_0c000__08b6:
  08b6  AD9FFDF2       JSR [0xfdf2]                      
  08ba  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1741 ->$16C3 ->$183D ->$17BF ->$0904 ->$08CB
  08be  1741           addr M76_r4_0c000::1741           
  08c0  16C3           addr M76_r4_0c000::16c3           
  08c2  183D           addr M76_r4_0c000::183d           
  08c4  17BF           addr M76_r4_0c000::17bf           
  08c6  0904           addr M76_r4_0c000::0904           
  08c8  08CB           addr M76_r4_0c000::08cb           
LAB_M76_r4_0c000__08ca:
  08ca  39             RTS                               

; ---- function FUN_M76_r4_0c000__08cb
FUN_M76_r4_0c000__08cb:
  08cb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "decay VS" "gate  VS" "level VS" "brightVS"
  08cf  646563617920.. ds "decay VS"                     
  08d7  676174652020.. ds "gate  VS"                     
  08df  6C6576656C20.. ds "level VS"                     
  08e7  627269676874.. ds "brightVS"                     
LAB_M76_r4_0c000__08ef:
  08ef  AD9FFDF2       JSR [0xfdf2]                      
  08f3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1549 ->$14CB ->$1645 ->$15C7 ->$0892 ->$0904
  08f7  1549           addr M76_r4_0c000::1549           
  08f9  14CB           addr M76_r4_0c000::14cb           
  08fb  1645           addr M76_r4_0c000::1645           
  08fd  15C7           addr M76_r4_0c000::15c7           
  08ff  0892           addr M76_r4_0c000::0892           
  0901  0904           addr M76_r4_0c000::0904           
LAB_M76_r4_0c000__0903:
  0903  39             RTS                               

; ---- function FUN_M76_r4_0c000__0904
FUN_M76_r4_0c000__0904:
  0904  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "rel KS  " " notes  " "starts  " " return "
  0908  72656C204B53.. ds "rel KS  "                     
  0910  206E6F746573.. ds " notes  "                     
  0918  737461727473.. ds "starts  "                     
  0920  207265747572.. ds " return "                     
LAB_M76_r4_0c000__0928:
  0928  AD9FFDF2       JSR [0xfdf2]                      
  092c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$18BB ->$093D ->$09A8 ->$0860 ->$08CB ->$0892
  0930  18BB           addr M76_r4_0c000::18bb           
  0932  093D           addr M76_r4_0c000::093d           
  0934  09A8           addr M76_r4_0c000::09a8           
  0936  0860           addr M76_r4_0c000::0860           
  0938  08CB           addr M76_r4_0c000::08cb           
  093a  0892           addr M76_r4_0c000::0892           
LAB_M76_r4_0c000__093c:
  093c  39             RTS                               

; ---- function FUN_M76_r4_0c000__093d
FUN_M76_r4_0c000__093d:
  093d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " note 1 " " note 2 " " note 3 " " note 4 "
  0941  206E6F746520.. ds " note 1 "                     
  0949  206E6F746520.. ds " note 2 "                     
  0951  206E6F746520.. ds " note 3 "                     
  0959  206E6F746520.. ds " note 4 "                     
LAB_M76_r4_0c000__0961:
  0961  AD9FFDF2       JSR [0xfdf2]                      
  0965  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1939 ->$1A3A ->$1B3B ->$1C3C ->$0976 ->$0976
  0969  1939           addr M76_r4_0c000::1939           
  096b  1A3A           addr M76_r4_0c000::1a3a           
  096d  1B3B           addr M76_r4_0c000::1b3b           
  096f  1C3C           addr M76_r4_0c000::1c3c           
  0971  0976           addr M76_r4_0c000::0976           
  0973  0976           addr M76_r4_0c000::0976           
LAB_M76_r4_0c000__0975:
  0975  39             RTS                               

; ---- function FUN_M76_r4_0c000__0976
FUN_M76_r4_0c000__0976:
  0976  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " note 5 " " note 6 " [*] " return "
  097a  206E6F746520.. ds " note 5 "                     
  0982  206E6F746520.. ds " note 6 "                     
  098a  01             db 1h                             
  098b  207265747572.. ds " return "                     
LAB_M76_r4_0c000__0993:
  0993  AD9FFDF2       JSR [0xfdf2]                      
  0997  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D3D ->$1E3E ->$0A77 ->$0904 ->$093D ->$093D
  099b  1D3D           addr M76_r4_0c000::1d3d           
  099d  1E3E           addr M76_r4_0c000::1e3e           
  099f  0A77           addr M76_r4_0c000::0a77           
  09a1  0904           addr M76_r4_0c000::0904           
  09a3  093D           addr M76_r4_0c000::093d           
  09a5  093D           addr M76_r4_0c000::093d           
LAB_M76_r4_0c000__09a7:
  09a7  39             RTS                               

; ---- function FUN_M76_r4_0c000__09a8
FUN_M76_r4_0c000__09a8:
  09a8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "start 1 " "start 2 " "start 3 " "start 4 "
  09ac  737461727420.. ds "start 1 "                     
  09b4  737461727420.. ds "start 2 "                     
  09bc  737461727420.. ds "start 3 "                     
  09c4  737461727420.. ds "start 4 "                     
LAB_M76_r4_0c000__09cc:
  09cc  AD9FFDF2       JSR [0xfdf2]                      
  09d0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$19BE ->$1ABF ->$1BC0 ->$1CC1 ->$09E1 ->$09E1
  09d4  19BE           addr M76_r4_0c000::19be           
  09d6  1ABF           addr M76_r4_0c000::1abf           
  09d8  1BC0           addr M76_r4_0c000::1bc0           
  09da  1CC1           addr M76_r4_0c000::1cc1           
  09dc  09E1           addr M76_r4_0c000::09e1           
  09de  09E1           addr M76_r4_0c000::09e1           
LAB_M76_r4_0c000__09e0:
  09e0  39             RTS                               

; ---- function FUN_M76_r4_0c000__09e1
FUN_M76_r4_0c000__09e1:
  09e1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "start 5 " "start 6 " [*] " return "
  09e5  737461727420.. ds "start 5 "                     
  09ed  737461727420.. ds "start 6 "                     
  09f5  01             db 1h                             
  09f6  207265747572.. ds " return "                     
LAB_M76_r4_0c000__09fe:
  09fe  AD9FFDF2       JSR [0xfdf2]                      
  0a02  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1DC2 ->$1EC3 ->$0A77 ->$0904 ->$09A8 ->$09A8
  0a06  1DC2           addr M76_r4_0c000::1dc2           
  0a08  1EC3           addr M76_r4_0c000::1ec3           
  0a0a  0A77           addr M76_r4_0c000::0a77           
  0a0c  0904           addr M76_r4_0c000::0904           
  0a0e  09A8           addr M76_r4_0c000::09a8           
  0a10  09A8           addr M76_r4_0c000::09a8           
LAB_M76_r4_0c000__0a12:
  0a12  39             RTS                               

; ---- function FUN_M76_r4_0c000__0a13
FUN_M76_r4_0c000__0a13:
  0a13  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] "return  "
  0a17  6C6566742069.. ds "left in "                     
  0a1f  726967687420.. ds "right in"                     
  0a27  01             db 1h                             
  0a28  72657475726E.. ds "return  "                     
LAB_M76_r4_0c000__0a30:
  0a30  AD9FFDF2       JSR [0xfdf2]                      
  0a34  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FF1 ->$206C ->$0A77 ->$0860 ->$0A45 ->$0A45
  0a38  1FF1           addr M76_r4_0c000::1ff1           
  0a3a  206C           addr M76_r4_0c000::206c           
  0a3c  0A77           addr M76_r4_0c000::0a77           
  0a3e  0860           addr M76_r4_0c000::0860           
  0a40  0A45           addr M76_r4_0c000::0a45           
  0a42  0A45           addr M76_r4_0c000::0a45           
LAB_M76_r4_0c000__0a44:
  0a44  39             RTS                               

; ---- function FUN_M76_r4_0c000__0a45
FUN_M76_r4_0c000__0a45:
  0a45  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] "return  "
  0a49  6C656674206F.. ds "left out"                     
  0a51  72696768746F.. ds "rightout"                     
  0a59  01             db 1h                             
  0a5a  72657475726E.. ds "return  "                     
LAB_M76_r4_0c000__0a62:
  0a62  AD9FFDF2       JSR [0xfdf2]                      
  0a66  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$20E7 ->$2162 ->$0A77 ->$0860 ->$0A13 ->$0A13
  0a6a  20E7           addr M76_r4_0c000::20e7           
  0a6c  2162           addr M76_r4_0c000::2162           
  0a6e  0A77           addr M76_r4_0c000::0a77           
  0a70  0860           addr M76_r4_0c000::0860           
  0a72  0A13           addr M76_r4_0c000::0a13           
  0a74  0A13           addr M76_r4_0c000::0a13           
LAB_M76_r4_0c000__0a76:
  0a76  39             RTS                               

; ---- function FUN_M76_r4_0c000__0a77
FUN_M76_r4_0c000__0a77:
  0a77  39             RTS                               
PTR_FUN_M76_r4_0c000__0afb_M76_r4_0c000__0a78:
  0a78  0AFB           addr M76_r4_0c000::0afb           
  0a7a  0AC2           addr M76_r4_0c000::0ac2           
  0a7c  .db 0A B6 70 96 70 EA 00 00 70 EC 00 08 00 65 00 D8  ; ..p.p...p....e..
  0a8c  .db F0 27 10 00 01 02 07 1B 0A E6 00 00 00 00 70 98  ; .'............p.
  0a9c  .db 00 67                                            ; .g

; ---- function FUN_M76_r4_0c000__0a9e
FUN_M76_r4_0c000__0a9e:
  0a9e  3410           PSHS  X                           
  0aa0  8E0A78         LDX #0xa78                         ; desc[API_FE6A]: ->$0AFB ->$0AC2
  0aa3  AD9FFE6A       JSR [0xfe6a]                      
  0aa7  3510           PULS  X                           
  0aa9  39             RTS                               

; ---- function FUN_M76_r4_0c000__0aaa
FUN_M76_r4_0c000__0aaa:
  0aaa  3410           PSHS  X                           
  0aac  8E0A78         LDX #0xa78                         ; desc[API_FDBC]: ->$0AFB ->$0AC2
  0aaf  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...x"
  0ab3  3510           PULS  X                           
  0ab5  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ab6
FUN_M76_r4_0c000__0ab6:
  0ab6  3410           PSHS  X                           
  0ab8  8E0A78         LDX #0xa78                         ; desc[API_FE6C]: ->$0AFB ->$0AC2
  0abb  AD9FFE6C       JSR [0xfe6c]                      
  0abf  3510           PULS  X                           
  0ac1  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ac2
FUN_M76_r4_0c000__0ac2:
  0ac2  3410           PSHS  X                           
  0ac4  8E0A78         LDX #0xa78                         ; desc[API_FE6E]: ->$0AFB ->$0AC2
  0ac7  AD9FFE6E       JSR [0xfe6e]                      
  0acb  3510           PULS  X                           
  0acd  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ace
FUN_M76_r4_0c000__0ace:
  0ace  3410           PSHS  X                           
  0ad0  8E0A78         LDX #0xa78                         ; desc[API_FE1C]: ->$0AFB ->$0AC2
  0ad3  AD9FFE1C       JSR [0xfe1c]                      
  0ad7  3510           PULS  X                           
  0ad9  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ada
FUN_M76_r4_0c000__0ada:
  0ada  3410           PSHS  X                           
  0adc  8E0A78         LDX #0xa78                         ; desc[API_FE1A]: ->$0AFB ->$0AC2 $0AB6
  0adf  AD9FFE1A       JSR [0xfe1a]                      
  0ae3  3510           PULS  X                           
  0ae5  39             RTS                               
  0ae6  .db 14 70 69 74 63 68 3A 20 20 20 20 20 20 20 20 20  ; .pitch:         
  0af6  .db 6E 6F 74 65 73                                   ; notes

; ---- function FUN_M76_r4_0c000__0afb
FUN_M76_r4_0c000__0afb:
  0afb  3476           PSHS  U Y X B A                   
  0afd  8E0A78         LDX #0xa78                        
  0b00  AD9FFE76       JSR [0xfe76]                      
  0b04  170098         LBSR 0x0b9f                       
  0b07  1719CB         LBSR 0x24d5                       
  0b0a  3576           PULS  A B X Y U                   
  0b0c  39             RTS                               
PTR_FUN_M76_r4_0c000__0b90_M76_r4_0c000__0b0d:
  0b0d  0B90           addr M76_r4_0c000::0b90           
  0b0f  0B57           addr M76_r4_0c000::0b57           
  0b11  .db 0B 4B 70 9A 70 F0 00 00 70 F2 00 08 00 B5 07 D8  ; .Kp.p...p.......
  0b21  .db F0 27 10 00 01 02 07 21 0B 7B 00 00 00 00 70 9C  ; .'.....!.{....p.
  0b31  .db 00 B7                                            ; ..

; ---- function FUN_M76_r4_0c000__0b33
FUN_M76_r4_0c000__0b33:
  0b33  3410           PSHS  X                           
  0b35  8E0B0D         LDX #0xb0d                         ; desc[API_FE6A]: ->$0B90 ->$0B57
  0b38  AD9FFE6A       JSR [0xfe6a]                      
  0b3c  3510           PULS  X                           
  0b3e  39             RTS                               

; ---- function FUN_M76_r4_0c000__0b3f
FUN_M76_r4_0c000__0b3f:
  0b3f  3410           PSHS  X                           
  0b41  8E0B0D         LDX #0xb0d                         ; desc[API_FDBC]: ->$0B90 ->$0B57
  0b44  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0b48  3510           PULS  X                           
  0b4a  39             RTS                               

; ---- function FUN_M76_r4_0c000__0b4b
FUN_M76_r4_0c000__0b4b:
  0b4b  3410           PSHS  X                           
  0b4d  8E0B0D         LDX #0xb0d                         ; desc[API_FE6C]: ->$0B90 ->$0B57
  0b50  AD9FFE6C       JSR [0xfe6c]                      
  0b54  3510           PULS  X                           
  0b56  39             RTS                               

; ---- function FUN_M76_r4_0c000__0b57
FUN_M76_r4_0c000__0b57:
  0b57  3410           PSHS  X                           
  0b59  8E0B0D         LDX #0xb0d                         ; desc[API_FE6E]: ->$0B90 ->$0B57
  0b5c  AD9FFE6E       JSR [0xfe6e]                      
  0b60  3510           PULS  X                           
  0b62  39             RTS                               

; ---- function FUN_M76_r4_0c000__0b63
FUN_M76_r4_0c000__0b63:
  0b63  3410           PSHS  X                           
  0b65  8E0B0D         LDX #0xb0d                         ; desc[API_FE1C]: ->$0B90 ->$0B57
  0b68  AD9FFE1C       JSR [0xfe1c]                      
  0b6c  3510           PULS  X                           
  0b6e  39             RTS                               

; ---- function FUN_M76_r4_0c000__0b6f
FUN_M76_r4_0c000__0b6f:
  0b6f  3410           PSHS  X                           
  0b71  8E0B0D         LDX #0xb0d                         ; desc[API_FE1A]: ->$0B90 ->$0B57 $0B4B
  0b74  AD9FFE1A       JSR [0xfe1a]                      
  0b78  3510           PULS  X                           
  0b7a  39             RTS                               
  0b7b  .db 14 70 69 74 63 68 20 6F 66 66 73 65 74 3A 20 20  ; .pitch offset:  
  0b8b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0b90
FUN_M76_r4_0c000__0b90:
  0b90  3476           PSHS  U Y X B A                   
  0b92  8E0B0D         LDX #0xb0d                        
  0b95  AD9FFE76       JSR [0xfe76]                      
  0b99  170003         LBSR 0x0b9f                       
  0b9c  3576           PULS  A B X Y U                   
  0b9e  39             RTS                               

; ---- function FUN_M76_r4_0c000__0b9f
FUN_M76_r4_0c000__0b9f:
  0b9f  3436           PSHS  Y X B A                     
  0ba1  FC70EC         LDD 0x70ec                        
  0ba4  F370F2         ADDD 0x70f2                       
  0ba7  10832710       CMPD #0x2710                      
  0bab  2D03           BLT 0x0bb0                        
  0bad  CC2710         LDD #0x2710                       
LAB_M76_r4_0c000__0bb0:
  0bb0  1083D8F0       CMPD #0xd8f0                      
  0bb4  2E03           BGT 0x0bb9                        
  0bb6  CCD8F0         LDD #0xd8f0                       
LAB_M76_r4_0c000__0bb9:
  0bb9  FD717C         STD 0x717c                        
  0bbc  3606           PSHU  B A                         
  0bbe  CC47AD         LDD #0x47ad                       
  0bc1  3606           PSHU  B A                         
  0bc3  AD9FFCF2       JSR [0xfcf2]                      
  0bc7  FC717C         LDD 0x717c                        
  0bca  58             LSLB                              
  0bcb  49             ROLA                              
  0bcc  E3C1           ADDD ,U++                         
  0bce  FD70EE         STD 0x70ee                        
  0bd1  35B6           PULS  A B X Y PC                  
PTR_FUN_M76_r4_0c000__0c56_M76_r4_0c000__0bd3:
  0bd3  0C56           addr M76_r4_0c000::0c56           
  0bd5  0C1D           addr M76_r4_0c000::0c1d           
  0bd7  .db 0C 11 70 00 70 02 00 00 70 04 00 08 00 69 01 00  ; ..p.p...p....i..
  0be7  .db 00 00 64 00 01 00 04 1B 0C 41 00 00 00 00 70 06  ; ..d......A....p.
  0bf7  .db 00 6B                                            ; .k

; ---- function FUN_M76_r4_0c000__0bf9
FUN_M76_r4_0c000__0bf9:
  0bf9  3410           PSHS  X                           
  0bfb  8E0BD3         LDX #0xbd3                         ; desc[API_FE6A]: ->$0C56 ->$0C1D
  0bfe  AD9FFE6A       JSR [0xfe6a]                      
  0c02  3510           PULS  X                           
  0c04  39             RTS                               

; ---- function FUN_M76_r4_0c000__0c05
FUN_M76_r4_0c000__0c05:
  0c05  3410           PSHS  X                           
  0c07  8E0BD3         LDX #0xbd3                         ; desc[API_FDBC]: ->$0C56 ->$0C1D
  0c0a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0c0e  3510           PULS  X                           
  0c10  39             RTS                               

; ---- function FUN_M76_r4_0c000__0c11
FUN_M76_r4_0c000__0c11:
  0c11  3410           PSHS  X                           
  0c13  8E0BD3         LDX #0xbd3                         ; desc[API_FE6C]: ->$0C56 ->$0C1D
  0c16  AD9FFE6C       JSR [0xfe6c]                      
  0c1a  3510           PULS  X                           
  0c1c  39             RTS                               

; ---- function FUN_M76_r4_0c000__0c1d
FUN_M76_r4_0c000__0c1d:
  0c1d  3410           PSHS  X                           
  0c1f  8E0BD3         LDX #0xbd3                         ; desc[API_FE6E]: ->$0C56 ->$0C1D
  0c22  AD9FFE6E       JSR [0xfe6e]                      
  0c26  3510           PULS  X                           
  0c28  39             RTS                               

; ---- function FUN_M76_r4_0c000__0c29
FUN_M76_r4_0c000__0c29:
  0c29  3410           PSHS  X                           
  0c2b  8E0BD3         LDX #0xbd3                         ; desc[API_FE1C]: ->$0C56 ->$0C1D
  0c2e  AD9FFE1C       JSR [0xfe1c]                      
  0c32  3510           PULS  X                           
  0c34  39             RTS                               

; ---- function FUN_M76_r4_0c000__0c35
FUN_M76_r4_0c000__0c35:
  0c35  3410           PSHS  X                           
  0c37  8E0BD3         LDX #0xbd3                         ; desc[API_FE1A]: ->$0C56 ->$0C1D $0C11
  0c3a  AD9FFE1A       JSR [0xfe1a]                      
  0c3e  3510           PULS  X                           
  0c40  39             RTS                               
  0c41  .db 14 64 65 63 61 79 3A 20 20 20 20 20 20 20 20 20  ; .decay:         
  0c51  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0c56
FUN_M76_r4_0c000__0c56:
  0c56  3476           PSHS  U Y X B A                   
  0c58  8E0BD3         LDX #0xbd3                        
  0c5b  AD9FFE76       JSR [0xfe76]                      
  0c5f  171862         LBSR 0x24c4                       
  0c62  3576           PULS  A B X Y U                   
  0c64  39             RTS                               
PTR_FUN_M76_r4_0c000__0ce8_M76_r4_0c000__0c65:
  0c65  0CE8           addr M76_r4_0c000::0ce8           
  0c67  0CAF           addr M76_r4_0c000::0caf           
  0c69  .db 0C A3 70 3C 70 3E 00 00 70 40 00 08 00 85 0A 00  ; ..p<p>..p@......
  0c79  .db 00 00 64 00 01 00 04 23 0C D3 00 00 00 00 70 42  ; ..d....#......pB
  0c89  .db 00 87                                            ; ..

; ---- function FUN_M76_r4_0c000__0c8b
FUN_M76_r4_0c000__0c8b:
  0c8b  3410           PSHS  X                           
  0c8d  8E0C65         LDX #0xc65                         ; desc[API_FE6A]: ->$0CE8 ->$0CAF
  0c90  AD9FFE6A       JSR [0xfe6a]                      
  0c94  3510           PULS  X                           
  0c96  39             RTS                               

; ---- function FUN_M76_r4_0c000__0c97
FUN_M76_r4_0c000__0c97:
  0c97  3410           PSHS  X                           
  0c99  8E0C65         LDX #0xc65                         ; desc[API_FDBC]: ->$0CE8 ->$0CAF
  0c9c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...e"
  0ca0  3510           PULS  X                           
  0ca2  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ca3
FUN_M76_r4_0c000__0ca3:
  0ca3  3410           PSHS  X                           
  0ca5  8E0C65         LDX #0xc65                         ; desc[API_FE6C]: ->$0CE8 ->$0CAF
  0ca8  AD9FFE6C       JSR [0xfe6c]                      
  0cac  3510           PULS  X                           
  0cae  39             RTS                               

; ---- function FUN_M76_r4_0c000__0caf
FUN_M76_r4_0c000__0caf:
  0caf  3410           PSHS  X                           
  0cb1  8E0C65         LDX #0xc65                         ; desc[API_FE6E]: ->$0CE8 ->$0CAF
  0cb4  AD9FFE6E       JSR [0xfe6e]                      
  0cb8  3510           PULS  X                           
  0cba  39             RTS                               

; ---- function FUN_M76_r4_0c000__0cbb
FUN_M76_r4_0c000__0cbb:
  0cbb  3410           PSHS  X                           
  0cbd  8E0C65         LDX #0xc65                         ; desc[API_FE1C]: ->$0CE8 ->$0CAF
  0cc0  AD9FFE1C       JSR [0xfe1c]                      
  0cc4  3510           PULS  X                           
  0cc6  39             RTS                               

; ---- function FUN_M76_r4_0c000__0cc7
FUN_M76_r4_0c000__0cc7:
  0cc7  3410           PSHS  X                           
  0cc9  8E0C65         LDX #0xc65                         ; desc[API_FE1A]: ->$0CE8 ->$0CAF $0CA3
  0ccc  AD9FFE1A       JSR [0xfe1a]                      
  0cd0  3510           PULS  X                           
  0cd2  39             RTS                               
  0cd3  .db 14 62 69 74 65 20 6F 66 20 61 74 74 61 63 6B 3A  ; .bite of attack:
  0ce3  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0ce8
FUN_M76_r4_0c000__0ce8:
  0ce8  3476           PSHS  U Y X B A                   
  0cea  8E0C65         LDX #0xc65                        
  0ced  AD9FFE76       JSR [0xfe76]                      
  0cf1  3576           PULS  A B X Y U                   
  0cf3  39             RTS                               
PTR_FUN_M76_r4_0c000__0d77_M76_r4_0c000__0cf4:
  0cf4  0D77           addr M76_r4_0c000::0d77           
  0cf6  0D3E           addr M76_r4_0c000::0d3e           
  0cf8  .db 0D 32 70 1E 70 20 00 00 70 22 00 08 00 71 02 00  ; .2p.p ..p"...q..
  0d08  .db 00 00 64 00 01 00 04 1D 0D 62 00 00 00 00 70 24  ; ..d......b....p$
  0d18  .db 00 73                                            ; .s

; ---- function FUN_M76_r4_0c000__0d1a
FUN_M76_r4_0c000__0d1a:
  0d1a  3410           PSHS  X                           
  0d1c  8E0CF4         LDX #0xcf4                         ; desc[API_FE6A]: ->$0D77 ->$0D3E
  0d1f  AD9FFE6A       JSR [0xfe6a]                      
  0d23  3510           PULS  X                           
  0d25  39             RTS                               

; ---- function FUN_M76_r4_0c000__0d26
FUN_M76_r4_0c000__0d26:
  0d26  3410           PSHS  X                           
  0d28  8E0CF4         LDX #0xcf4                         ; desc[API_FDBC]: ->$0D77 ->$0D3E
  0d2b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0d2f  3510           PULS  X                           
  0d31  39             RTS                               

; ---- function FUN_M76_r4_0c000__0d32
FUN_M76_r4_0c000__0d32:
  0d32  3410           PSHS  X                           
  0d34  8E0CF4         LDX #0xcf4                         ; desc[API_FE6C]: ->$0D77 ->$0D3E
  0d37  AD9FFE6C       JSR [0xfe6c]                      
  0d3b  3510           PULS  X                           
  0d3d  39             RTS                               

; ---- function FUN_M76_r4_0c000__0d3e
FUN_M76_r4_0c000__0d3e:
  0d3e  3410           PSHS  X                           
  0d40  8E0CF4         LDX #0xcf4                         ; desc[API_FE6E]: ->$0D77 ->$0D3E
  0d43  AD9FFE6E       JSR [0xfe6e]                      
  0d47  3510           PULS  X                           
  0d49  39             RTS                               

; ---- function FUN_M76_r4_0c000__0d4a
FUN_M76_r4_0c000__0d4a:
  0d4a  3410           PSHS  X                           
  0d4c  8E0CF4         LDX #0xcf4                         ; desc[API_FE1C]: ->$0D77 ->$0D3E
  0d4f  AD9FFE1C       JSR [0xfe1c]                      
  0d53  3510           PULS  X                           
  0d55  39             RTS                               

; ---- function FUN_M76_r4_0c000__0d56
FUN_M76_r4_0c000__0d56:
  0d56  3410           PSHS  X                           
  0d58  8E0CF4         LDX #0xcf4                         ; desc[API_FE1A]: ->$0D77 ->$0D3E $0D32
  0d5b  AD9FFE1A       JSR [0xfe1a]                      
  0d5f  3510           PULS  X                           
  0d61  39             RTS                               
  0d62  .db 14 72 65 6C 65 61 73 65 3A 20 20 20 20 20 20 20  ; .release:       
  0d72  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0d77
FUN_M76_r4_0c000__0d77:
  0d77  3476           PSHS  U Y X B A                   
  0d79  8E0CF4         LDX #0xcf4                        
  0d7c  AD9FFE76       JSR [0xfe76]                      
  0d80  171741         LBSR 0x24c4                       
  0d83  3576           PULS  A B X Y U                   
  0d85  39             RTS                               
PTR_FUN_M76_r4_0c000__0e09_M76_r4_0c000__0d86:
  0d86  0E09           addr M76_r4_0c000::0e09           
  0d88  0DD0           addr M76_r4_0c000::0dd0           
  0d8a  .db 0D C4 70 9E 70 F6 00 00 70 F8 00 08 00 79 03 00  ; ..p.p...p....y..
  0d9a  .db 00 00 01 00 01 00 03 24 0D F4 00 00 0E 18 70 A0  ; .......$......p.
  0daa  .db 00 7B                                            ; .{

; ---- function FUN_M76_r4_0c000__0dac
FUN_M76_r4_0c000__0dac:
  0dac  3410           PSHS  X                           
  0dae  8E0D86         LDX #0xd86                         ; desc[API_FE6A]: ->$0E09 ->$0DD0
  0db1  AD9FFE6A       JSR [0xfe6a]                      
  0db5  3510           PULS  X                           
  0db7  39             RTS                               

; ---- function FUN_M76_r4_0c000__0db8
FUN_M76_r4_0c000__0db8:
  0db8  3410           PSHS  X                           
  0dba  8E0D86         LDX #0xd86                         ; desc[API_FDBC]: ->$0E09 ->$0DD0
  0dbd  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0dc1  3510           PULS  X                           
  0dc3  39             RTS                               

; ---- function FUN_M76_r4_0c000__0dc4
FUN_M76_r4_0c000__0dc4:
  0dc4  3410           PSHS  X                           
  0dc6  8E0D86         LDX #0xd86                         ; desc[API_FE6C]: ->$0E09 ->$0DD0
  0dc9  AD9FFE6C       JSR [0xfe6c]                      
  0dcd  3510           PULS  X                           
  0dcf  39             RTS                               

; ---- function FUN_M76_r4_0c000__0dd0
FUN_M76_r4_0c000__0dd0:
  0dd0  3410           PSHS  X                           
  0dd2  8E0D86         LDX #0xd86                        
  0dd5  AD9FFC52       JSR [0xfc52]                      
  0dd9  3510           PULS  X                           
  0ddb  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ddc
FUN_M76_r4_0c000__0ddc:
  0ddc  3410           PSHS  X                           
  0dde  8E0D86         LDX #0xd86                         ; desc[API_FE1C]: ->$0E09 ->$0DD0
  0de1  AD9FFE1C       JSR [0xfe1c]                      
  0de5  3510           PULS  X                           
  0de7  39             RTS                               

; ---- function FUN_M76_r4_0c000__0de8
FUN_M76_r4_0c000__0de8:
  0de8  3410           PSHS  X                           
  0dea  8E0D86         LDX #0xd86                         ; desc[API_FE1A]: ->$0E09 ->$0DD0 $0DC4
  0ded  AD9FFE1A       JSR [0xfe1a]                      
  0df1  3510           PULS  X                           
  0df3  39             RTS                               
  0df4  .db 14 73 75 73 74 61 69 6E 20 28 68 6F 6C 64 29 3A  ; .sustain (hold):
  0e04  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0e09
FUN_M76_r4_0c000__0e09:
  0e09  3476           PSHS  U Y X B A                   
  0e0b  8E0D86         LDX #0xd86                        
  0e0e  AD9FFE76       JSR [0xfe76]                      
  0e12  171687         LBSR 0x249c                       
  0e15  3576           PULS  A B X Y U                   
  0e17  39             RTS                               
  0e18  .db 6F 66 66 20 6F 6E                                ; off on
PTR_FUN_M76_r4_0c000__0ea1_M76_r4_0c000__0e1e:
  0e1e  0EA1           addr M76_r4_0c000::0ea1           
  0e20  0E68           addr M76_r4_0c000::0e68           
  0e22  .db 0E 5C 70 A2 70 FC 00 00 70 FE 00 08 00 B9 06 00  ; .\p.p...p.......
  0e32  .db 00 00 01 00 01 00 03 1F 0E 8C 00 00 0E 18 70 A4  ; ..............p.
  0e42  .db 00 BB                                            ; ..

; ---- function FUN_M76_r4_0c000__0e44
FUN_M76_r4_0c000__0e44:
  0e44  3410           PSHS  X                           
  0e46  8E0E1E         LDX #0xe1e                         ; desc[API_FE6A]: ->$0EA1 ->$0E68
  0e49  AD9FFE6A       JSR [0xfe6a]                      
  0e4d  3510           PULS  X                           
  0e4f  39             RTS                               

; ---- function FUN_M76_r4_0c000__0e50
FUN_M76_r4_0c000__0e50:
  0e50  3410           PSHS  X                           
  0e52  8E0E1E         LDX #0xe1e                         ; desc[API_FDBC]: ->$0EA1 ->$0E68
  0e55  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0e59  3510           PULS  X                           
  0e5b  39             RTS                               

; ---- function FUN_M76_r4_0c000__0e5c
FUN_M76_r4_0c000__0e5c:
  0e5c  3410           PSHS  X                           
  0e5e  8E0E1E         LDX #0xe1e                         ; desc[API_FE6C]: ->$0EA1 ->$0E68
  0e61  AD9FFE6C       JSR [0xfe6c]                      
  0e65  3510           PULS  X                           
  0e67  39             RTS                               

; ---- function FUN_M76_r4_0c000__0e68
FUN_M76_r4_0c000__0e68:
  0e68  3410           PSHS  X                           
  0e6a  8E0E1E         LDX #0xe1e                        
  0e6d  AD9FFC52       JSR [0xfc52]                      
  0e71  3510           PULS  X                           
  0e73  39             RTS                               

; ---- function FUN_M76_r4_0c000__0e74
FUN_M76_r4_0c000__0e74:
  0e74  3410           PSHS  X                           
  0e76  8E0E1E         LDX #0xe1e                         ; desc[API_FE1C]: ->$0EA1 ->$0E68
  0e79  AD9FFE1C       JSR [0xfe1c]                      
  0e7d  3510           PULS  X                           
  0e7f  39             RTS                               

; ---- function FUN_M76_r4_0c000__0e80
FUN_M76_r4_0c000__0e80:
  0e80  3410           PSHS  X                           
  0e82  8E0E1E         LDX #0xe1e                         ; desc[API_FE1A]: ->$0EA1 ->$0E68 $0E5C
  0e85  AD9FFE1A       JSR [0xfe1a]                      
  0e89  3510           PULS  X                           
  0e8b  39             RTS                               
  0e8c  .db 14 6E 6F 74 65 20 68 6F 6C 64 3A 20 20 20 20 20  ; .note hold:     
  0e9c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0ea1
FUN_M76_r4_0c000__0ea1:
  0ea1  3476           PSHS  U Y X B A                   
  0ea3  8E0E1E         LDX #0xe1e                        
  0ea6  AD9FFE76       JSR [0xfe76]                      
  0eaa  3576           PULS  A B X Y U                   
  0eac  39             RTS                               
PTR_FUN_M76_r4_0c000__0f30_M76_r4_0c000__0ead:
  0ead  0F30           addr M76_r4_0c000::0f30           
  0eaf  0EF7           addr M76_r4_0c000::0ef7           
  0eb1  .db 0E EB 70 5A 70 5C 00 00 70 5E 00 08 00 7D 04 00  ; ..pZp\..p^...}..
  0ec1  .db 01 00 64 00 01 00 04 1E 0F 1B 00 00 00 00 70 60  ; ..d...........p`
  0ed1  .db 00 7F                                            ; ..

; ---- function FUN_M76_r4_0c000__0ed3
FUN_M76_r4_0c000__0ed3:
  0ed3  3410           PSHS  X                           
  0ed5  8E0EAD         LDX #0xead                         ; desc[API_FE6A]: ->$0F30 ->$0EF7
  0ed8  AD9FFE6A       JSR [0xfe6a]                      
  0edc  3510           PULS  X                           
  0ede  39             RTS                               

; ---- function FUN_M76_r4_0c000__0edf
FUN_M76_r4_0c000__0edf:
  0edf  3410           PSHS  X                           
  0ee1  8E0EAD         LDX #0xead                         ; desc[API_FDBC]: ->$0F30 ->$0EF7
  0ee4  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0ee8  3510           PULS  X                           
  0eea  39             RTS                               

; ---- function FUN_M76_r4_0c000__0eeb
FUN_M76_r4_0c000__0eeb:
  0eeb  3410           PSHS  X                           
  0eed  8E0EAD         LDX #0xead                         ; desc[API_FE6C]: ->$0F30 ->$0EF7
  0ef0  AD9FFE6C       JSR [0xfe6c]                      
  0ef4  3510           PULS  X                           
  0ef6  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ef7
FUN_M76_r4_0c000__0ef7:
  0ef7  3410           PSHS  X                           
  0ef9  8E0EAD         LDX #0xead                         ; desc[API_FE6E]: ->$0F30 ->$0EF7
  0efc  AD9FFE6E       JSR [0xfe6e]                      
  0f00  3510           PULS  X                           
  0f02  39             RTS                               

; ---- function FUN_M76_r4_0c000__0f03
FUN_M76_r4_0c000__0f03:
  0f03  3410           PSHS  X                           
  0f05  8E0EAD         LDX #0xead                         ; desc[API_FE1C]: ->$0F30 ->$0EF7
  0f08  AD9FFE1C       JSR [0xfe1c]                      
  0f0c  3510           PULS  X                           
  0f0e  39             RTS                               

; ---- function FUN_M76_r4_0c000__0f0f
FUN_M76_r4_0c000__0f0f:
  0f0f  3410           PSHS  X                           
  0f11  8E0EAD         LDX #0xead                         ; desc[API_FE1A]: ->$0F30 ->$0EF7 $0EEB
  0f14  AD9FFE1A       JSR [0xfe1a]                      
  0f18  3510           PULS  X                           
  0f1a  39             RTS                               
  0f1b  .db 14 67 61 74 65 20 74 69 6D 65 3A 20 20 20 20 20  ; .gate time:     
  0f2b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0f30
FUN_M76_r4_0c000__0f30:
  0f30  3476           PSHS  U Y X B A                   
  0f32  8E0EAD         LDX #0xead                        
  0f35  AD9FFE76       JSR [0xfe76]                      
  0f39  3576           PULS  A B X Y U                   
  0f3b  39             RTS                               
  0f3c  0FA70F860F7A   addr[3]                           
  0f42  .db 70 CA 71 3C 00 00 71 3E 00 08 00 BD 05 00 00 00  ; p.q<..q>........
  0f52  .db 02 00 01 00 07 1F 0F 92 00 00 0F B6 00 00 00 00  ; ................

; ---- function FUN_M76_r4_0c000__0f62
FUN_M76_r4_0c000__0f62:
  0f62  3410           PSHS  X                           
  0f64  8E0F3C         LDX #0xf3c                        
  0f67  AD9FFC4E       JSR [0xfc4e]                      
  0f6b  3510           PULS  X                           
  0f6d  39             RTS                               

; ---- function FUN_M76_r4_0c000__0f6e
FUN_M76_r4_0c000__0f6e:
  0f6e  3410           PSHS  X                           
  0f70  8E0F3C         LDX #0xf3c                        
  0f73  AD9FFC4C       JSR [0xfc4c]                      
  0f77  3510           PULS  X                           
  0f79  39             RTS                               

; ---- function FUN_M76_r4_0c000__0f7a
FUN_M76_r4_0c000__0f7a:
  0f7a  3410           PSHS  X                           
  0f7c  8E0F3C         LDX #0xf3c                        
  0f7f  AD9FFC50       JSR [0xfc50]                      
  0f83  3510           PULS  X                           
  0f85  39             RTS                               

; ---- function FUN_M76_r4_0c000__0f86
FUN_M76_r4_0c000__0f86:
  0f86  3410           PSHS  X                           
  0f88  8E0F3C         LDX #0xf3c                        
  0f8b  AD9FFC52       JSR [0xfc52]                      
  0f8f  3510           PULS  X                           
  0f91  39             RTS                               
  0f92  .db 14 67 61 74 65 20 6D 6F 64 65 3A 20 20 20 20 20  ; .gate mode:     
  0fa2  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__0fa7
FUN_M76_r4_0c000__0fa7:
  0fa7  3476           PSHS  U Y X B A                   
  0fa9  8E0F3C         LDX #0xf3c                        
  0fac  AD9FFE76       JSR [0xfe76]                      
  0fb0  1717AF         LBSR 0x2762                       
  0fb3  3576           PULS  A B X Y U                   
  0fb5  39             RTS                               
  0fb6  .db 6E 6F 72 6D 61 6C 20 6B 65 79 65 64 20 20 6F 70  ; normal keyed  op
  0fc6  .db 65 6E 20 20 20                                   ; en   
PTR_FUN_M76_r4_0c000__104e_M76_r4_0c000__0fcb:
  0fcb  104E           addr M76_r4_0c000::104e           
  0fcd  1015           addr M76_r4_0c000::1015           
  0fcf  .db 10 09 70 A6 71 02 00 00 71 04 00 08 00 8D 08 00  ; ..p.q...q.......
  0fdf  .db 00 27 10 00 64 02 07 20 10 39 00 00 00 00 70 A8  ; .'..d.. .9....p.
  0fef  .db 00 8F                                            ; ..

; ---- function FUN_M76_r4_0c000__0ff1
FUN_M76_r4_0c000__0ff1:
  0ff1  3410           PSHS  X                           
  0ff3  8E0FCB         LDX #0xfcb                         ; desc[API_FE6A]: ->$104E ->$1015
  0ff6  AD9FFE6A       JSR [0xfe6a]                      
  0ffa  3510           PULS  X                           
  0ffc  39             RTS                               

; ---- function FUN_M76_r4_0c000__0ffd
FUN_M76_r4_0c000__0ffd:
  0ffd  3410           PSHS  X                           
  0fff  8E0FCB         LDX #0xfcb                         ; desc[API_FDBC]: ->$104E ->$1015
  1002  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1006  3510           PULS  X                           
  1008  39             RTS                               

; ---- function FUN_M76_r4_0c000__1009
FUN_M76_r4_0c000__1009:
  1009  3410           PSHS  X                           
  100b  8E0FCB         LDX #0xfcb                         ; desc[API_FE6C]: ->$104E ->$1015
  100e  AD9FFE6C       JSR [0xfe6c]                      
  1012  3510           PULS  X                           
  1014  39             RTS                               

; ---- function FUN_M76_r4_0c000__1015
FUN_M76_r4_0c000__1015:
  1015  3410           PSHS  X                           
  1017  8E0FCB         LDX #0xfcb                         ; desc[API_FE6E]: ->$104E ->$1015
  101a  AD9FFE6E       JSR [0xfe6e]                      
  101e  3510           PULS  X                           
  1020  39             RTS                               

; ---- function FUN_M76_r4_0c000__1021
FUN_M76_r4_0c000__1021:
  1021  3410           PSHS  X                           
  1023  8E0FCB         LDX #0xfcb                         ; desc[API_FE1C]: ->$104E ->$1015
  1026  AD9FFE1C       JSR [0xfe1c]                      
  102a  3510           PULS  X                           
  102c  39             RTS                               

; ---- function FUN_M76_r4_0c000__102d
FUN_M76_r4_0c000__102d:
  102d  3410           PSHS  X                           
  102f  8E0FCB         LDX #0xfcb                         ; desc[API_FE1A]: ->$104E ->$1015 $1009
  1032  AD9FFE1A       JSR [0xfe1a]                      
  1036  3510           PULS  X                           
  1038  39             RTS                               
  1039  .db 14 66 69 6C 74 65 72 20 66 72 65 71 3A 20 20 20  ; .filter freq:   
  1049  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__104e
FUN_M76_r4_0c000__104e:
  104e  3476           PSHS  U Y X B A                   
  1050  8E0FCB         LDX #0xfcb                        
  1053  AD9FFE76       JSR [0xfe76]                      
  1057  1716D4         LBSR 0x272e                       
  105a  3576           PULS  A B X Y U                   
  105c  39             RTS                               
PTR_FUN_M76_r4_0c000__10e0_M76_r4_0c000__105d:
  105d  10E0           addr M76_r4_0c000::10e0           
  105f  10A7           addr M76_r4_0c000::10a7           
  1061  .db 10 9B 70 AA 71 08 00 00 71 0A 00 08 00 91 09 00  ; ..p.q...q.......
  1071  .db 00 00 64 00 01 00 04 24 10 CB 00 00 00 00 70 AC  ; ..d....$......p.
  1081  .db 00 93                                            ; ..

; ---- function FUN_M76_r4_0c000__1083
FUN_M76_r4_0c000__1083:
  1083  3410           PSHS  X                           
  1085  8E105D         LDX #0x105d                        ; desc[API_FE6A]: ->$10E0 ->$10A7
  1088  AD9FFE6A       JSR [0xfe6a]                      
  108c  3510           PULS  X                           
  108e  39             RTS                               

; ---- function FUN_M76_r4_0c000__108f
FUN_M76_r4_0c000__108f:
  108f  3410           PSHS  X                           
  1091  8E105D         LDX #0x105d                        ; desc[API_FDBC]: ->$10E0 ->$10A7
  1094  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...]"
  1098  3510           PULS  X                           
  109a  39             RTS                               

; ---- function FUN_M76_r4_0c000__109b
FUN_M76_r4_0c000__109b:
  109b  3410           PSHS  X                           
  109d  8E105D         LDX #0x105d                        ; desc[API_FE6C]: ->$10E0 ->$10A7
  10a0  AD9FFE6C       JSR [0xfe6c]                      
  10a4  3510           PULS  X                           
  10a6  39             RTS                               

; ---- function FUN_M76_r4_0c000__10a7
FUN_M76_r4_0c000__10a7:
  10a7  3410           PSHS  X                           
  10a9  8E105D         LDX #0x105d                        ; desc[API_FE6E]: ->$10E0 ->$10A7
  10ac  AD9FFE6E       JSR [0xfe6e]                      
  10b0  3510           PULS  X                           
  10b2  39             RTS                               

; ---- function FUN_M76_r4_0c000__10b3
FUN_M76_r4_0c000__10b3:
  10b3  3410           PSHS  X                           
  10b5  8E105D         LDX #0x105d                        ; desc[API_FE1C]: ->$10E0 ->$10A7
  10b8  AD9FFE1C       JSR [0xfe1c]                      
  10bc  3510           PULS  X                           
  10be  39             RTS                               

; ---- function FUN_M76_r4_0c000__10bf
FUN_M76_r4_0c000__10bf:
  10bf  3410           PSHS  X                           
  10c1  8E105D         LDX #0x105d                        ; desc[API_FE1A]: ->$10E0 ->$10A7 $109B
  10c4  AD9FFE1A       JSR [0xfe1a]                      
  10c8  3510           PULS  X                           
  10ca  39             RTS                               
  10cb  .db 14 66 69 6C 74 65 72 20 71 20 66 61 63 74 6F 72  ; .filter q factor
  10db  .db 3A 20 20 20 20                                   ; :    

; ---- function FUN_M76_r4_0c000__10e0
FUN_M76_r4_0c000__10e0:
  10e0  3476           PSHS  U Y X B A                   
  10e2  8E105D         LDX #0x105d                       
  10e5  AD9FFE76       JSR [0xfe76]                      
  10e9  17165B         LBSR 0x2747                       
  10ec  3576           PULS  A B X Y U                   
  10ee  39             RTS                               
PTR_FUN_M76_r4_0c000__1172_M76_r4_0c000__10ef:
  10ef  1172           addr M76_r4_0c000::1172           
  10f1  1139           addr M76_r4_0c000::1139           
  10f3  .db 11 2D 70 AE 71 0E 00 00 71 10 00 08 00 95 0B FF  ; .-p.q...q.......
  1103  .db 9C 00 64 00 01 00 04 20 11 5D 00 00 00 00 70 B0  ; ..d.... .]....p.
  1113  .db 00 97                                            ; ..

; ---- function FUN_M76_r4_0c000__1115
FUN_M76_r4_0c000__1115:
  1115  3410           PSHS  X                           
  1117  8E10EF         LDX #0x10ef                        ; desc[API_FE6A]: ->$1172 ->$1139
  111a  AD9FFE6A       JSR [0xfe6a]                      
  111e  3510           PULS  X                           
  1120  39             RTS                               

; ---- function FUN_M76_r4_0c000__1121
FUN_M76_r4_0c000__1121:
  1121  3410           PSHS  X                           
  1123  8E10EF         LDX #0x10ef                        ; desc[API_FDBC]: ->$1172 ->$1139
  1126  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  112a  3510           PULS  X                           
  112c  39             RTS                               

; ---- function FUN_M76_r4_0c000__112d
FUN_M76_r4_0c000__112d:
  112d  3410           PSHS  X                           
  112f  8E10EF         LDX #0x10ef                        ; desc[API_FE6C]: ->$1172 ->$1139
  1132  AD9FFE6C       JSR [0xfe6c]                      
  1136  3510           PULS  X                           
  1138  39             RTS                               

; ---- function FUN_M76_r4_0c000__1139
FUN_M76_r4_0c000__1139:
  1139  3410           PSHS  X                           
  113b  8E10EF         LDX #0x10ef                        ; desc[API_FE6E]: ->$1172 ->$1139
  113e  AD9FFE6E       JSR [0xfe6e]                      
  1142  3510           PULS  X                           
  1144  39             RTS                               

; ---- function FUN_M76_r4_0c000__1145
FUN_M76_r4_0c000__1145:
  1145  3410           PSHS  X                           
  1147  8E10EF         LDX #0x10ef                        ; desc[API_FE1C]: ->$1172 ->$1139
  114a  AD9FFE1C       JSR [0xfe1c]                      
  114e  3510           PULS  X                           
  1150  39             RTS                               

; ---- function FUN_M76_r4_0c000__1151
FUN_M76_r4_0c000__1151:
  1151  3410           PSHS  X                           
  1153  8E10EF         LDX #0x10ef                        ; desc[API_FE1A]: ->$1172 ->$1139 $112D
  1156  AD9FFE1A       JSR [0xfe1a]                      
  115a  3510           PULS  X                           
  115c  39             RTS                               
  115d  .db 14 68 69 67 68 20 6E 6F 69 73 65 3A 20 20 20 20  ; .high noise:    
  116d  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M76_r4_0c000__1172
FUN_M76_r4_0c000__1172:
  1172  3476           PSHS  U Y X B A                   
  1174  8E10EF         LDX #0x10ef                       
  1177  AD9FFE76       JSR [0xfe76]                      
  117b  171609         LBSR 0x2787                       
  117e  3576           PULS  A B X Y U                   
  1180  39             RTS                               
PTR_FUN_M76_r4_0c000__1204_M76_r4_0c000__1181:
  1181  1204           addr M76_r4_0c000::1204           
  1183  11CB           addr M76_r4_0c000::11cb           
  1185  .db 11 BF 70 B2 71 14 00 00 71 16 00 08 00 9D 0C FF  ; ..p.q...q.......
  1195  .db 9C 00 64 00 01 00 04 20 11 EF 00 00 00 00 70 B4  ; ..d.... ......p.
  11a5  .db 00 9F                                            ; ..

; ---- function FUN_M76_r4_0c000__11a7
FUN_M76_r4_0c000__11a7:
  11a7  3410           PSHS  X                           
  11a9  8E1181         LDX #0x1181                        ; desc[API_FE6A]: ->$1204 ->$11CB
  11ac  AD9FFE6A       JSR [0xfe6a]                      
  11b0  3510           PULS  X                           
  11b2  39             RTS                               

; ---- function FUN_M76_r4_0c000__11b3
FUN_M76_r4_0c000__11b3:
  11b3  3410           PSHS  X                           
  11b5  8E1181         LDX #0x1181                        ; desc[API_FDBC]: ->$1204 ->$11CB
  11b8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  11bc  3510           PULS  X                           
  11be  39             RTS                               

; ---- function FUN_M76_r4_0c000__11bf
FUN_M76_r4_0c000__11bf:
  11bf  3410           PSHS  X                           
  11c1  8E1181         LDX #0x1181                        ; desc[API_FE6C]: ->$1204 ->$11CB
  11c4  AD9FFE6C       JSR [0xfe6c]                      
  11c8  3510           PULS  X                           
  11ca  39             RTS                               

; ---- function FUN_M76_r4_0c000__11cb
FUN_M76_r4_0c000__11cb:
  11cb  3410           PSHS  X                           
  11cd  8E1181         LDX #0x1181                        ; desc[API_FE6E]: ->$1204 ->$11CB
  11d0  AD9FFE6E       JSR [0xfe6e]                      
  11d4  3510           PULS  X                           
  11d6  39             RTS                               

; ---- function FUN_M76_r4_0c000__11d7
FUN_M76_r4_0c000__11d7:
  11d7  3410           PSHS  X                           
  11d9  8E1181         LDX #0x1181                        ; desc[API_FE1C]: ->$1204 ->$11CB
  11dc  AD9FFE1C       JSR [0xfe1c]                      
  11e0  3510           PULS  X                           
  11e2  39             RTS                               

; ---- function FUN_M76_r4_0c000__11e3
FUN_M76_r4_0c000__11e3:
  11e3  3410           PSHS  X                           
  11e5  8E1181         LDX #0x1181                        ; desc[API_FE1A]: ->$1204 ->$11CB $11BF
  11e8  AD9FFE1A       JSR [0xfe1a]                      
  11ec  3510           PULS  X                           
  11ee  39             RTS                               
  11ef  .db 14 62 61 6E 64 20 6E 6F 69 73 65 3A 20 20 20 20  ; .band noise:    
  11ff  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M76_r4_0c000__1204
FUN_M76_r4_0c000__1204:
  1204  3476           PSHS  U Y X B A                   
  1206  8E1181         LDX #0x1181                       
  1209  AD9FFE76       JSR [0xfe76]                      
  120d  171594         LBSR 0x27a4                       
  1210  3576           PULS  A B X Y U                   
  1212  39             RTS                               
PTR_FUN_M76_r4_0c000__1296_M76_r4_0c000__1213:
  1213  1296           addr M76_r4_0c000::1296           
  1215  125D           addr M76_r4_0c000::125d           
  1217  .db 12 51 70 B6 71 1A 00 00 71 1C 00 08 00 99 0D FF  ; .Qp.q...q.......
  1227  .db 9C 00 64 00 01 00 04 1F 12 81 00 00 00 00 70 B8  ; ..d...........p.
  1237  .db 00 9B                                            ; ..

; ---- function FUN_M76_r4_0c000__1239
FUN_M76_r4_0c000__1239:
  1239  3410           PSHS  X                           
  123b  8E1213         LDX #0x1213                        ; desc[API_FE6A]: ->$1296 ->$125D
  123e  AD9FFE6A       JSR [0xfe6a]                      
  1242  3510           PULS  X                           
  1244  39             RTS                               

; ---- function FUN_M76_r4_0c000__1245
FUN_M76_r4_0c000__1245:
  1245  3410           PSHS  X                           
  1247  8E1213         LDX #0x1213                        ; desc[API_FDBC]: ->$1296 ->$125D
  124a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  124e  3510           PULS  X                           
  1250  39             RTS                               

; ---- function FUN_M76_r4_0c000__1251
FUN_M76_r4_0c000__1251:
  1251  3410           PSHS  X                           
  1253  8E1213         LDX #0x1213                        ; desc[API_FE6C]: ->$1296 ->$125D
  1256  AD9FFE6C       JSR [0xfe6c]                      
  125a  3510           PULS  X                           
  125c  39             RTS                               

; ---- function FUN_M76_r4_0c000__125d
FUN_M76_r4_0c000__125d:
  125d  3410           PSHS  X                           
  125f  8E1213         LDX #0x1213                        ; desc[API_FE6E]: ->$1296 ->$125D
  1262  AD9FFE6E       JSR [0xfe6e]                      
  1266  3510           PULS  X                           
  1268  39             RTS                               

; ---- function FUN_M76_r4_0c000__1269
FUN_M76_r4_0c000__1269:
  1269  3410           PSHS  X                           
  126b  8E1213         LDX #0x1213                        ; desc[API_FE1C]: ->$1296 ->$125D
  126e  AD9FFE1C       JSR [0xfe1c]                      
  1272  3510           PULS  X                           
  1274  39             RTS                               

; ---- function FUN_M76_r4_0c000__1275
FUN_M76_r4_0c000__1275:
  1275  3410           PSHS  X                           
  1277  8E1213         LDX #0x1213                        ; desc[API_FE1A]: ->$1296 ->$125D $1251
  127a  AD9FFE1A       JSR [0xfe1a]                      
  127e  3510           PULS  X                           
  1280  39             RTS                               
  1281  .db 14 6C 6F 77 20 6E 6F 69 73 65 3A 20 20 20 20 20  ; .low noise:     
  1291  .db 20 25 20 20 20                                   ;  %   

; ---- function FUN_M76_r4_0c000__1296
FUN_M76_r4_0c000__1296:
  1296  3476           PSHS  U Y X B A                   
  1298  8E1213         LDX #0x1213                       
  129b  AD9FFE76       JSR [0xfe76]                      
  129f  17151F         LBSR 0x27c1                       
  12a2  3576           PULS  A B X Y U                   
  12a4  39             RTS                               
PTR_FUN_M76_r4_0c000__1328_M76_r4_0c000__12a5:
  12a5  1328           addr M76_r4_0c000::1328           
  12a7  12EF           addr M76_r4_0c000::12ef           
  12a9  .db 12 E3 70 BA 71 20 00 00 71 22 00 08 00 A1 0E FF  ; ..p.q ..q"......
  12b9  .db 9C 00 64 00 01 00 04 20 13 13 00 00 00 00 70 BC  ; ..d.... ......p.
  12c9  .db 00 A3                                            ; ..

; ---- function FUN_M76_r4_0c000__12cb
FUN_M76_r4_0c000__12cb:
  12cb  3410           PSHS  X                           
  12cd  8E12A5         LDX #0x12a5                        ; desc[API_FE6A]: ->$1328 ->$12EF
  12d0  AD9FFE6A       JSR [0xfe6a]                      
  12d4  3510           PULS  X                           
  12d6  39             RTS                               

; ---- function FUN_M76_r4_0c000__12d7
FUN_M76_r4_0c000__12d7:
  12d7  3410           PSHS  X                           
  12d9  8E12A5         LDX #0x12a5                        ; desc[API_FDBC]: ->$1328 ->$12EF
  12dc  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  12e0  3510           PULS  X                           
  12e2  39             RTS                               

; ---- function FUN_M76_r4_0c000__12e3
FUN_M76_r4_0c000__12e3:
  12e3  3410           PSHS  X                           
  12e5  8E12A5         LDX #0x12a5                        ; desc[API_FE6C]: ->$1328 ->$12EF
  12e8  AD9FFE6C       JSR [0xfe6c]                      
  12ec  3510           PULS  X                           
  12ee  39             RTS                               

; ---- function FUN_M76_r4_0c000__12ef
FUN_M76_r4_0c000__12ef:
  12ef  3410           PSHS  X                           
  12f1  8E12A5         LDX #0x12a5                        ; desc[API_FE6E]: ->$1328 ->$12EF
  12f4  AD9FFE6E       JSR [0xfe6e]                      
  12f8  3510           PULS  X                           
  12fa  39             RTS                               

; ---- function FUN_M76_r4_0c000__12fb
FUN_M76_r4_0c000__12fb:
  12fb  3410           PSHS  X                           
  12fd  8E12A5         LDX #0x12a5                        ; desc[API_FE1C]: ->$1328 ->$12EF
  1300  AD9FFE1C       JSR [0xfe1c]                      
  1304  3510           PULS  X                           
  1306  39             RTS                               

; ---- function FUN_M76_r4_0c000__1307
FUN_M76_r4_0c000__1307:
  1307  3410           PSHS  X                           
  1309  8E12A5         LDX #0x12a5                        ; desc[API_FE1A]: ->$1328 ->$12EF $12E3
  130c  AD9FFE1A       JSR [0xfe1a]                      
  1310  3510           PULS  X                           
  1312  39             RTS                               
  1313  .db 14 65 78 74 2E 20 69 6E 70 75 74 3A 20 20 20 20  ; .ext. input:    
  1323  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M76_r4_0c000__1328
FUN_M76_r4_0c000__1328:
  1328  3476           PSHS  U Y X B A                   
  132a  8E12A5         LDX #0x12a5                       
  132d  AD9FFE76       JSR [0xfe76]                      
  1331  1714AA         LBSR 0x27de                       
  1334  3576           PULS  A B X Y U                   
  1336  39             RTS                               
PTR_FUN_M76_r4_0c000__13a2_M76_r4_0c000__1337:
  1337  13A2           addr M76_r4_0c000::13a2           
  1339  1381           addr M76_r4_0c000::1381           
  133b  .db 13 75 70 CC 71 40 00 00 71 42 00 08 00 AB 0F 00  ; .up.q@..qB......
  134b  .db 00 00 64 00 01 00 04 22 13 8D 00 00 00 00 00 00  ; ..d...."........
  135b  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__135d
FUN_M76_r4_0c000__135d:
  135d  3410           PSHS  X                           
  135f  8E1337         LDX #0x1337                        ; desc[API_FE6A]: ->$13A2 ->$1381
  1362  AD9FFE6A       JSR [0xfe6a]                      
  1366  3510           PULS  X                           
  1368  39             RTS                               

; ---- function FUN_M76_r4_0c000__1369
FUN_M76_r4_0c000__1369:
  1369  3410           PSHS  X                           
  136b  8E1337         LDX #0x1337                        ; desc[API_FDBC]: ->$13A2 ->$1381
  136e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...7"
  1372  3510           PULS  X                           
  1374  39             RTS                               

; ---- function FUN_M76_r4_0c000__1375
FUN_M76_r4_0c000__1375:
  1375  3410           PSHS  X                           
  1377  8E1337         LDX #0x1337                        ; desc[API_FE6C]: ->$13A2 ->$1381
  137a  AD9FFE6C       JSR [0xfe6c]                      
  137e  3510           PULS  X                           
  1380  39             RTS                               

; ---- function FUN_M76_r4_0c000__1381
FUN_M76_r4_0c000__1381:
  1381  3410           PSHS  X                           
  1383  8E1337         LDX #0x1337                        ; desc[API_FE6E]: ->$13A2 ->$1381
  1386  AD9FFE6E       JSR [0xfe6e]                      
  138a  3510           PULS  X                           
  138c  39             RTS                               
  138d  .db 14 63 68 6F 72 75 73 20 61 6D 6F 75 6E 74 3A 20  ; .chorus amount: 
  139d  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M76_r4_0c000__13a2
FUN_M76_r4_0c000__13a2:
  13a2  3476           PSHS  U Y X B A                   
  13a4  8E1337         LDX #0x1337                       
  13a7  AD9FFE76       JSR [0xfe76]                      
  13ab  17144F         LBSR 0x27fd                       
  13ae  3576           PULS  A B X Y U                   
  13b0  39             RTS                               
PTR_FUN_M76_r4_0c000__141c_M76_r4_0c000__13b1:
  13b1  141C           addr M76_r4_0c000::141c           
  13b3  13FB           addr M76_r4_0c000::13fb           
  13b5  .db 13 EF 70 D0 71 48 00 00 71 4A 00 08 00 A7 10 00  ; ..p.qH..qJ......
  13c5  .db 00 00 64 00 01 00 04 21 14 07 00 00 00 00 00 00  ; ..d....!........
  13d5  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__13d7
FUN_M76_r4_0c000__13d7:
  13d7  3410           PSHS  X                           
  13d9  8E13B1         LDX #0x13b1                        ; desc[API_FE6A]: ->$141C ->$13FB
  13dc  AD9FFE6A       JSR [0xfe6a]                      
  13e0  3510           PULS  X                           
  13e2  39             RTS                               

; ---- function FUN_M76_r4_0c000__13e3
FUN_M76_r4_0c000__13e3:
  13e3  3410           PSHS  X                           
  13e5  8E13B1         LDX #0x13b1                        ; desc[API_FDBC]: ->$141C ->$13FB
  13e8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  13ec  3510           PULS  X                           
  13ee  39             RTS                               

; ---- function FUN_M76_r4_0c000__13ef
FUN_M76_r4_0c000__13ef:
  13ef  3410           PSHS  X                           
  13f1  8E13B1         LDX #0x13b1                        ; desc[API_FE6C]: ->$141C ->$13FB
  13f4  AD9FFE6C       JSR [0xfe6c]                      
  13f8  3510           PULS  X                           
  13fa  39             RTS                               

; ---- function FUN_M76_r4_0c000__13fb
FUN_M76_r4_0c000__13fb:
  13fb  3410           PSHS  X                           
  13fd  8E13B1         LDX #0x13b1                        ; desc[API_FE6E]: ->$141C ->$13FB
  1400  AD9FFE6E       JSR [0xfe6e]                      
  1404  3510           PULS  X                           
  1406  39             RTS                               
  1407  .db 14 63 68 6F 72 75 73 20 73 70 65 65 64 3A 20 20  ; .chorus speed:  
  1417  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__141c
FUN_M76_r4_0c000__141c:
  141c  3476           PSHS  U Y X B A                   
  141e  8E13B1         LDX #0x13b1                       
  1421  AD9FFE76       JSR [0xfe76]                      
  1425  1713D5         LBSR 0x27fd                       
  1428  3576           PULS  A B X Y U                   
  142a  39             RTS                               
PTR_FUN_M76_r4_0c000__1496_M76_r4_0c000__142b:
  142b  1496           addr M76_r4_0c000::1496           
  142d  1475           addr M76_r4_0c000::1475           
  142f  .db 14 69 70 CE 71 44 00 00 71 46 00 08 00 A5 11 00  ; .ip.qD..qF......
  143f  .db 00 00 64 00 01 00 04 21 14 81 00 00 00 00 00 00  ; ..d....!........
  144f  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1451
FUN_M76_r4_0c000__1451:
  1451  3410           PSHS  X                           
  1453  8E142B         LDX #0x142b                        ; desc[API_FE6A]: ->$1496 ->$1475
  1456  AD9FFE6A       JSR [0xfe6a]                      
  145a  3510           PULS  X                           
  145c  39             RTS                               

; ---- function FUN_M76_r4_0c000__145d
FUN_M76_r4_0c000__145d:
  145d  3410           PSHS  X                           
  145f  8E142B         LDX #0x142b                        ; desc[API_FDBC]: ->$1496 ->$1475
  1462  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...+"
  1466  3510           PULS  X                           
  1468  39             RTS                               

; ---- function FUN_M76_r4_0c000__1469
FUN_M76_r4_0c000__1469:
  1469  3410           PSHS  X                           
  146b  8E142B         LDX #0x142b                        ; desc[API_FE6C]: ->$1496 ->$1475
  146e  AD9FFE6C       JSR [0xfe6c]                      
  1472  3510           PULS  X                           
  1474  39             RTS                               

; ---- function FUN_M76_r4_0c000__1475
FUN_M76_r4_0c000__1475:
  1475  3410           PSHS  X                           
  1477  8E142B         LDX #0x142b                        ; desc[API_FE6E]: ->$1496 ->$1475
  147a  AD9FFE6E       JSR [0xfe6e]                      
  147e  3510           PULS  X                           
  1480  39             RTS                               
  1481  .db 14 63 68 6F 72 75 73 20 64 65 70 74 68 3A 20 20  ; .chorus depth:  
  1491  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1496
FUN_M76_r4_0c000__1496:
  1496  3476           PSHS  U Y X B A                   
  1498  8E142B         LDX #0x142b                       
  149b  AD9FFE76       JSR [0xfe76]                      
  149f  17135B         LBSR 0x27fd                       
  14a2  3576           PULS  A B X Y U                   
  14a4  39             RTS                               
PTR_FUN_M76_r4_0c000__1510_M76_r4_0c000__14a5:
  14a5  1510           addr M76_r4_0c000::1510           
  14a7  14EF           addr M76_r4_0c000::14ef           
  14a9  .db 14 E3 70 6E 70 70 00 00 70 72 00 08 00 83 19 FF  ; ..pnpp..pr......
  14b9  .db 9C 00 64 00 01 00 04 23 14 FB 00 00 00 00 00 00  ; ..d....#........
  14c9  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__14cb
FUN_M76_r4_0c000__14cb:
  14cb  3410           PSHS  X                           
  14cd  8E14A5         LDX #0x14a5                        ; desc[API_FE6A]: ->$1510 ->$14EF
  14d0  AD9FFE6A       JSR [0xfe6a]                      
  14d4  3510           PULS  X                           
  14d6  39             RTS                               

; ---- function FUN_M76_r4_0c000__14d7
FUN_M76_r4_0c000__14d7:
  14d7  3410           PSHS  X                           
  14d9  8E14A5         LDX #0x14a5                        ; desc[API_FDBC]: ->$1510 ->$14EF
  14dc  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  14e0  3510           PULS  X                           
  14e2  39             RTS                               

; ---- function FUN_M76_r4_0c000__14e3
FUN_M76_r4_0c000__14e3:
  14e3  3410           PSHS  X                           
  14e5  8E14A5         LDX #0x14a5                        ; desc[API_FE6C]: ->$1510 ->$14EF
  14e8  AD9FFE6C       JSR [0xfe6c]                      
  14ec  3510           PULS  X                           
  14ee  39             RTS                               

; ---- function FUN_M76_r4_0c000__14ef
FUN_M76_r4_0c000__14ef:
  14ef  3410           PSHS  X                           
  14f1  8E14A5         LDX #0x14a5                        ; desc[API_FE6E]: ->$1510 ->$14EF
  14f4  AD9FFE6E       JSR [0xfe6e]                      
  14f8  3510           PULS  X                           
  14fa  39             RTS                               
  14fb  .db 14 67 61 74 65 20 76 65 6C 6F 63 69 74 79 3A 20  ; .gate velocity: 
  150b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1510
FUN_M76_r4_0c000__1510:
  1510  3476           PSHS  U Y X B A                   
  1512  8E14A5         LDX #0x14a5                       
  1515  AD9FFE76       JSR [0xfe76]                      
  1519  108E705A       LDY #0x705a                       
  151d  170CD3         LBSR 0x21f3                       
  1520  3576           PULS  A B X Y U                   
  1522  39             RTS                               
PTR_FUN_M76_r4_0c000__158e_M76_r4_0c000__1523:
  1523  158E           addr M76_r4_0c000::158e           
  1525  156D           addr M76_r4_0c000::156d           
  1527  .db 15 61 70 14 70 16 00 00 70 18 00 08 00 6F 18 FF  ; .ap.p...p....o..
  1537  .db 9C 00 64 00 01 00 04 24 15 79 00 00 00 00 00 00  ; ..d....$.y......
  1547  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1549
FUN_M76_r4_0c000__1549:
  1549  3410           PSHS  X                           
  154b  8E1523         LDX #0x1523                        ; desc[API_FE6A]: ->$158E ->$156D
  154e  AD9FFE6A       JSR [0xfe6a]                      
  1552  3510           PULS  X                           
  1554  39             RTS                               

; ---- function FUN_M76_r4_0c000__1555
FUN_M76_r4_0c000__1555:
  1555  3410           PSHS  X                           
  1557  8E1523         LDX #0x1523                        ; desc[API_FDBC]: ->$158E ->$156D
  155a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...#"
  155e  3510           PULS  X                           
  1560  39             RTS                               

; ---- function FUN_M76_r4_0c000__1561
FUN_M76_r4_0c000__1561:
  1561  3410           PSHS  X                           
  1563  8E1523         LDX #0x1523                        ; desc[API_FE6C]: ->$158E ->$156D
  1566  AD9FFE6C       JSR [0xfe6c]                      
  156a  3510           PULS  X                           
  156c  39             RTS                               

; ---- function FUN_M76_r4_0c000__156d
FUN_M76_r4_0c000__156d:
  156d  3410           PSHS  X                           
  156f  8E1523         LDX #0x1523                        ; desc[API_FE6E]: ->$158E ->$156D
  1572  AD9FFE6E       JSR [0xfe6e]                      
  1576  3510           PULS  X                           
  1578  39             RTS                               
  1579  .db 14 64 65 63 61 79 20 76 65 6C 6F 63 69 74 79 3A  ; .decay velocity:
  1589  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__158e
FUN_M76_r4_0c000__158e:
  158e  3476           PSHS  U Y X B A                   
  1590  8E1523         LDX #0x1523                       
  1593  AD9FFE76       JSR [0xfe76]                      
  1597  108E7000       LDY #0x7000                       
  159b  170C55         LBSR 0x21f3                       
  159e  3576           PULS  A B X Y U                   
  15a0  39             RTS                               
PTR_FUN_M76_r4_0c000__160c_M76_r4_0c000__15a1:
  15a1  160C           addr M76_r4_0c000::160c           
  15a3  15EB           addr M76_r4_0c000::15eb           
  15a5  .db 15 DF 70 50 70 52 00 00 70 54 00 08 00 8B 1B FF  ; ..pPpR..pT......
  15b5  .db 9C 00 64 00 01 00 04 24 15 F7 00 00 00 00 00 00  ; ..d....$........
  15c5  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__15c7
FUN_M76_r4_0c000__15c7:
  15c7  3410           PSHS  X                           
  15c9  8E15A1         LDX #0x15a1                        ; desc[API_FE6A]: ->$160C ->$15EB
  15cc  AD9FFE6A       JSR [0xfe6a]                      
  15d0  3510           PULS  X                           
  15d2  39             RTS                               

; ---- function FUN_M76_r4_0c000__15d3
FUN_M76_r4_0c000__15d3:
  15d3  3410           PSHS  X                           
  15d5  8E15A1         LDX #0x15a1                        ; desc[API_FDBC]: ->$160C ->$15EB
  15d8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  15dc  3510           PULS  X                           
  15de  39             RTS                               

; ---- function FUN_M76_r4_0c000__15df
FUN_M76_r4_0c000__15df:
  15df  3410           PSHS  X                           
  15e1  8E15A1         LDX #0x15a1                        ; desc[API_FE6C]: ->$160C ->$15EB
  15e4  AD9FFE6C       JSR [0xfe6c]                      
  15e8  3510           PULS  X                           
  15ea  39             RTS                               

; ---- function FUN_M76_r4_0c000__15eb
FUN_M76_r4_0c000__15eb:
  15eb  3410           PSHS  X                           
  15ed  8E15A1         LDX #0x15a1                        ; desc[API_FE6E]: ->$160C ->$15EB
  15f0  AD9FFE6E       JSR [0xfe6e]                      
  15f4  3510           PULS  X                           
  15f6  39             RTS                               
  15f7  .db 14 62 72 69 67 68 74 20 76 65 6C 6F 63 69 74 79  ; .bright velocity
  1607  .db 3A 20 20 20 20                                   ; :    

; ---- function FUN_M76_r4_0c000__160c
FUN_M76_r4_0c000__160c:
  160c  3476           PSHS  U Y X B A                   
  160e  8E15A1         LDX #0x15a1                       
  1611  AD9FFE76       JSR [0xfe76]                      
  1615  108E703C       LDY #0x703c                       
  1619  170BD7         LBSR 0x21f3                       
  161c  3576           PULS  A B X Y U                   
  161e  39             RTS                               
PTR_FUN_M76_r4_0c000__168a_M76_r4_0c000__161f:
  161f  168A           addr M76_r4_0c000::168a           
  1621  1669           addr M76_r4_0c000::1669           
  1623  .db 16 5D 70 8C 70 8E 00 00 70 90 00 08 00 AF 1A FF  ; .]p.p...p.......
  1633  .db 9C 00 64 00 01 00 04 24 16 75 00 00 00 00 00 00  ; ..d....$.u......
  1643  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1645
FUN_M76_r4_0c000__1645:
  1645  3410           PSHS  X                           
  1647  8E161F         LDX #0x161f                        ; desc[API_FE6A]: ->$168A ->$1669
  164a  AD9FFE6A       JSR [0xfe6a]                      
  164e  3510           PULS  X                           
  1650  39             RTS                               

; ---- function FUN_M76_r4_0c000__1651
FUN_M76_r4_0c000__1651:
  1651  3410           PSHS  X                           
  1653  8E161F         LDX #0x161f                        ; desc[API_FDBC]: ->$168A ->$1669
  1656  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  165a  3510           PULS  X                           
  165c  39             RTS                               

; ---- function FUN_M76_r4_0c000__165d
FUN_M76_r4_0c000__165d:
  165d  3410           PSHS  X                           
  165f  8E161F         LDX #0x161f                        ; desc[API_FE6C]: ->$168A ->$1669
  1662  AD9FFE6C       JSR [0xfe6c]                      
  1666  3510           PULS  X                           
  1668  39             RTS                               

; ---- function FUN_M76_r4_0c000__1669
FUN_M76_r4_0c000__1669:
  1669  3410           PSHS  X                           
  166b  8E161F         LDX #0x161f                        ; desc[API_FE6E]: ->$168A ->$1669
  166e  AD9FFE6E       JSR [0xfe6e]                      
  1672  3510           PULS  X                           
  1674  39             RTS                               
  1675  .db 14 6C 65 76 65 6C 20 76 65 6C 6F 63 69 74 79 3A  ; .level velocity:
  1685  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__168a
FUN_M76_r4_0c000__168a:
  168a  3476           PSHS  U Y X B A                   
  168c  8E161F         LDX #0x161f                       
  168f  AD9FFE76       JSR [0xfe76]                      
  1693  108E7078       LDY #0x7078                       
  1697  170B59         LBSR 0x21f3                       
  169a  3576           PULS  A B X Y U                   
  169c  39             RTS                               
PTR_FUN_M76_r4_0c000__1708_M76_r4_0c000__169d:
  169d  1708           addr M76_r4_0c000::1708           
  169f  16E7           addr M76_r4_0c000::16e7           
  16a1  .db 16 DB 70 64 70 66 00 00 70 68 00 08 00 81 15 FF  ; ..pdpf..ph......
  16b1  .db 9C 00 64 00 01 00 04 1E 16 F3 00 00 00 00 00 00  ; ..d.............
  16c1  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__16c3
FUN_M76_r4_0c000__16c3:
  16c3  3410           PSHS  X                           
  16c5  8E169D         LDX #0x169d                        ; desc[API_FE6A]: ->$1708 ->$16E7
  16c8  AD9FFE6A       JSR [0xfe6a]                      
  16cc  3510           PULS  X                           
  16ce  39             RTS                               

; ---- function FUN_M76_r4_0c000__16cf
FUN_M76_r4_0c000__16cf:
  16cf  3410           PSHS  X                           
  16d1  8E169D         LDX #0x169d                        ; desc[API_FDBC]: ->$1708 ->$16E7
  16d4  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  16d8  3510           PULS  X                           
  16da  39             RTS                               

; ---- function FUN_M76_r4_0c000__16db
FUN_M76_r4_0c000__16db:
  16db  3410           PSHS  X                           
  16dd  8E169D         LDX #0x169d                        ; desc[API_FE6C]: ->$1708 ->$16E7
  16e0  AD9FFE6C       JSR [0xfe6c]                      
  16e4  3510           PULS  X                           
  16e6  39             RTS                               

; ---- function FUN_M76_r4_0c000__16e7
FUN_M76_r4_0c000__16e7:
  16e7  3410           PSHS  X                           
  16e9  8E169D         LDX #0x169d                        ; desc[API_FE6E]: ->$1708 ->$16E7
  16ec  AD9FFE6E       JSR [0xfe6e]                      
  16f0  3510           PULS  X                           
  16f2  39             RTS                               
  16f3  .db 14 67 61 74 65 20 6B 65 79 3A 20 20 20 20 20 20  ; .gate key:      
  1703  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1708
FUN_M76_r4_0c000__1708:
  1708  3476           PSHS  U Y X B A                   
  170a  8E169D         LDX #0x169d                       
  170d  AD9FFE76       JSR [0xfe76]                      
  1711  108E705A       LDY #0x705a                       
  1715  170AC3         LBSR 0x21db                       
  1718  3576           PULS  A B X Y U                   
  171a  39             RTS                               
PTR_FUN_M76_r4_0c000__1786_M76_r4_0c000__171b:
  171b  1786           addr M76_r4_0c000::1786           
  171d  1765           addr M76_r4_0c000::1765           
  171f  .db 17 59 70 0A 70 0C 00 00 70 0E 00 08 00 6D 14 FF  ; .Yp.p...p....m..
  172f  .db 9C 00 64 00 01 00 04 1F 17 71 00 00 00 00 00 00  ; ..d......q......
  173f  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1741
FUN_M76_r4_0c000__1741:
  1741  3410           PSHS  X                           
  1743  8E171B         LDX #0x171b                        ; desc[API_FE6A]: ->$1786 ->$1765
  1746  AD9FFE6A       JSR [0xfe6a]                      
  174a  3510           PULS  X                           
  174c  39             RTS                               

; ---- function FUN_M76_r4_0c000__174d
FUN_M76_r4_0c000__174d:
  174d  3410           PSHS  X                           
  174f  8E171B         LDX #0x171b                        ; desc[API_FDBC]: ->$1786 ->$1765
  1752  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1756  3510           PULS  X                           
  1758  39             RTS                               

; ---- function FUN_M76_r4_0c000__1759
FUN_M76_r4_0c000__1759:
  1759  3410           PSHS  X                           
  175b  8E171B         LDX #0x171b                        ; desc[API_FE6C]: ->$1786 ->$1765
  175e  AD9FFE6C       JSR [0xfe6c]                      
  1762  3510           PULS  X                           
  1764  39             RTS                               

; ---- function FUN_M76_r4_0c000__1765
FUN_M76_r4_0c000__1765:
  1765  3410           PSHS  X                           
  1767  8E171B         LDX #0x171b                        ; desc[API_FE6E]: ->$1786 ->$1765
  176a  AD9FFE6E       JSR [0xfe6e]                      
  176e  3510           PULS  X                           
  1770  39             RTS                               
  1771  .db 14 64 65 63 61 79 20 6B 65 79 3A 20 20 20 20 20  ; .decay key:     
  1781  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1786
FUN_M76_r4_0c000__1786:
  1786  3476           PSHS  U Y X B A                   
  1788  8E171B         LDX #0x171b                       
  178b  AD9FFE76       JSR [0xfe76]                      
  178f  108E7000       LDY #0x7000                       
  1793  170A45         LBSR 0x21db                       
  1796  3576           PULS  A B X Y U                   
  1798  39             RTS                               
PTR_FUN_M76_r4_0c000__1804_M76_r4_0c000__1799:
  1799  1804           addr M76_r4_0c000::1804           
  179b  17E3           addr M76_r4_0c000::17e3           
  179d  .db 17 D7 70 46 70 48 00 00 70 4A 00 08 00 89 17 FF  ; ..pFpH..pJ......
  17ad  .db 9C 00 64 00 01 00 04 20 17 EF 00 00 00 00 00 00  ; ..d.... ........
  17bd  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__17bf
FUN_M76_r4_0c000__17bf:
  17bf  3410           PSHS  X                           
  17c1  8E1799         LDX #0x1799                        ; desc[API_FE6A]: ->$1804 ->$17E3
  17c4  AD9FFE6A       JSR [0xfe6a]                      
  17c8  3510           PULS  X                           
  17ca  39             RTS                               

; ---- function FUN_M76_r4_0c000__17cb
FUN_M76_r4_0c000__17cb:
  17cb  3410           PSHS  X                           
  17cd  8E1799         LDX #0x1799                        ; desc[API_FDBC]: ->$1804 ->$17E3
  17d0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  17d4  3510           PULS  X                           
  17d6  39             RTS                               

; ---- function FUN_M76_r4_0c000__17d7
FUN_M76_r4_0c000__17d7:
  17d7  3410           PSHS  X                           
  17d9  8E1799         LDX #0x1799                        ; desc[API_FE6C]: ->$1804 ->$17E3
  17dc  AD9FFE6C       JSR [0xfe6c]                      
  17e0  3510           PULS  X                           
  17e2  39             RTS                               

; ---- function FUN_M76_r4_0c000__17e3
FUN_M76_r4_0c000__17e3:
  17e3  3410           PSHS  X                           
  17e5  8E1799         LDX #0x1799                        ; desc[API_FE6E]: ->$1804 ->$17E3
  17e8  AD9FFE6E       JSR [0xfe6e]                      
  17ec  3510           PULS  X                           
  17ee  39             RTS                               
  17ef  .db 14 62 72 69 67 68 74 20 6B 65 79 3A 20 20 20 20  ; .bright key:    
  17ff  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1804
FUN_M76_r4_0c000__1804:
  1804  3476           PSHS  U Y X B A                   
  1806  8E1799         LDX #0x1799                       
  1809  AD9FFE76       JSR [0xfe76]                      
  180d  108E703C       LDY #0x703c                       
  1811  1709C7         LBSR 0x21db                       
  1814  3576           PULS  A B X Y U                   
  1816  39             RTS                               
PTR_FUN_M76_r4_0c000__1882_M76_r4_0c000__1817:
  1817  1882           addr M76_r4_0c000::1882           
  1819  1861           addr M76_r4_0c000::1861           
  181b  .db 18 55 70 82 70 84 00 00 70 86 00 08 00 AD 16 FF  ; .Up.p...p.......
  182b  .db 9C 00 64 00 01 00 04 1F 18 6D 00 00 00 00 00 00  ; ..d......m......
  183b  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__183d
FUN_M76_r4_0c000__183d:
  183d  3410           PSHS  X                           
  183f  8E1817         LDX #0x1817                        ; desc[API_FE6A]: ->$1882 ->$1861
  1842  AD9FFE6A       JSR [0xfe6a]                      
  1846  3510           PULS  X                           
  1848  39             RTS                               

; ---- function FUN_M76_r4_0c000__1849
FUN_M76_r4_0c000__1849:
  1849  3410           PSHS  X                           
  184b  8E1817         LDX #0x1817                        ; desc[API_FDBC]: ->$1882 ->$1861
  184e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1852  3510           PULS  X                           
  1854  39             RTS                               

; ---- function FUN_M76_r4_0c000__1855
FUN_M76_r4_0c000__1855:
  1855  3410           PSHS  X                           
  1857  8E1817         LDX #0x1817                        ; desc[API_FE6C]: ->$1882 ->$1861
  185a  AD9FFE6C       JSR [0xfe6c]                      
  185e  3510           PULS  X                           
  1860  39             RTS                               

; ---- function FUN_M76_r4_0c000__1861
FUN_M76_r4_0c000__1861:
  1861  3410           PSHS  X                           
  1863  8E1817         LDX #0x1817                        ; desc[API_FE6E]: ->$1882 ->$1861
  1866  AD9FFE6E       JSR [0xfe6e]                      
  186a  3510           PULS  X                           
  186c  39             RTS                               
  186d  .db 14 6C 65 76 65 6C 20 6B 65 79 3A 20 20 20 20 20  ; .level key:     
  187d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1882
FUN_M76_r4_0c000__1882:
  1882  3476           PSHS  U Y X B A                   
  1884  8E1817         LDX #0x1817                       
  1887  AD9FFE76       JSR [0xfe76]                      
  188b  108E7078       LDY #0x7078                       
  188f  170949         LBSR 0x21db                       
  1892  3576           PULS  A B X Y U                   
  1894  39             RTS                               
PTR_FUN_M76_r4_0c000__1900_M76_r4_0c000__1895:
  1895  1900           addr M76_r4_0c000::1900           
  1897  18DF           addr M76_r4_0c000::18df           
  1899  .db 18 D3 70 28 70 2A 00 00 70 2C 00 08 00 75 1C FF  ; ..p(p*..p,...u..
  18a9  .db 9C 00 64 00 01 00 04 24 18 EB 00 00 00 00 00 00  ; ..d....$........
  18b9  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__18bb
FUN_M76_r4_0c000__18bb:
  18bb  3410           PSHS  X                           
  18bd  8E1895         LDX #0x1895                        ; desc[API_FE6A]: ->$1900 ->$18DF
  18c0  AD9FFE6A       JSR [0xfe6a]                      
  18c4  3510           PULS  X                           
  18c6  39             RTS                               

; ---- function FUN_M76_r4_0c000__18c7
FUN_M76_r4_0c000__18c7:
  18c7  3410           PSHS  X                           
  18c9  8E1895         LDX #0x1895                        ; desc[API_FDBC]: ->$1900 ->$18DF
  18cc  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  18d0  3510           PULS  X                           
  18d2  39             RTS                               

; ---- function FUN_M76_r4_0c000__18d3
FUN_M76_r4_0c000__18d3:
  18d3  3410           PSHS  X                           
  18d5  8E1895         LDX #0x1895                        ; desc[API_FE6C]: ->$1900 ->$18DF
  18d8  AD9FFE6C       JSR [0xfe6c]                      
  18dc  3510           PULS  X                           
  18de  39             RTS                               

; ---- function FUN_M76_r4_0c000__18df
FUN_M76_r4_0c000__18df:
  18df  3410           PSHS  X                           
  18e1  8E1895         LDX #0x1895                        ; desc[API_FE6E]: ->$1900 ->$18DF
  18e4  AD9FFE6E       JSR [0xfe6e]                      
  18e8  3510           PULS  X                           
  18ea  39             RTS                               
  18eb  .db 14 52 65 6C 65 61 73 65 20 6B 65 79 20 73 63 6C  ; .Release key scl
  18fb  .db 3A 20 20 20 20                                   ; :    

; ---- function FUN_M76_r4_0c000__1900
FUN_M76_r4_0c000__1900:
  1900  3476           PSHS  U Y X B A                   
  1902  8E1895         LDX #0x1895                       
  1905  AD9FFE76       JSR [0xfe76]                      
  1909  108E701E       LDY #0x701e                       
  190d  1708CB         LBSR 0x21db                       
  1910  3576           PULS  A B X Y U                   
  1912  39             RTS                               
PTR_FUN_M76_r4_0c000__1987_M76_r4_0c000__1913:
  1913  1987           addr M76_r4_0c000::1987           
  1915  1972           addr M76_r4_0c000::1972           
  1917  .db 19 51 70 D2 71 4C 00 00 71 4E 00 08 00 BF 1D 00  ; .Qp.qL..qN......
  1927  .db 00 00 7F 00 01 00 04 20 19 5D 00 00 00 00 00 00  ; ....... .]......
  1937  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1939
FUN_M76_r4_0c000__1939:
  1939  3410           PSHS  X                           
  193b  8E1913         LDX #0x1913                       
  193e  AD9FFE74       JSR [0xfe74]                      
  1942  3510           PULS  X                           
  1944  39             RTS                               

; ---- function FUN_M76_r4_0c000__1945
FUN_M76_r4_0c000__1945:
  1945  3410           PSHS  X                           
  1947  8E1913         LDX #0x1913                        ; desc[API_FE22]: ->$1987 ->$1972
  194a  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  194e  3510           PULS  X                           
  1950  39             RTS                               

; ---- function FUN_M76_r4_0c000__1951
FUN_M76_r4_0c000__1951:
  1951  3410           PSHS  X                           
  1953  8E1913         LDX #0x1913                       
  1956  AD9FFE70       JSR [0xfe70]                      
  195a  3510           PULS  X                           
  195c  39             RTS                               
  195d  .db 14 76 6F 69 63 65 20 31 20 6E 6F 74 65 3A 20 20  ; .voice 1 note:  
  196d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1972
FUN_M76_r4_0c000__1972:
  1972  3436           PSHS  Y X B A                     
  1974  F6714F         LDB 0x714f                        
  1977  AD9FFE0A       JSR [0xfe0a]                      
  197b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:24}{3:60AB}"
  197f  02240360AB00   char[6] 02h,"$",03h,"`",ABh       
LAB_M76_r4_0c000__1985:
  1985  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__1987
FUN_M76_r4_0c000__1987:
  1987  3476           PSHS  U Y X B A                   
  1989  8E1913         LDX #0x1913                       
  198c  AD9FFE76       JSR [0xfe76]                      
  1990  C600           LDB #0x0                          
  1992  170AE4         LBSR 0x2479                       
  1995  3576           PULS  A B X Y U                   
  1997  39             RTS                               
PTR_FUN_M76_r4_0c000__1a03_M76_r4_0c000__1998:
  1998  1A03           addr M76_r4_0c000::1a03           
  199a  19E2           addr M76_r4_0c000::19e2           
  199c  .db 19 D6 70 D4 71 50 00 00 71 52 00 08 00 C0 23 00  ; ..p.qP..qR....#.
  19ac  .db 00 00 7F 00 01 00 04 22 19 EE 00 00 00 00 00 00  ; ......."........
  19bc  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__19be
FUN_M76_r4_0c000__19be:
  19be  3410           PSHS  X                           
  19c0  8E1998         LDX #0x1998                       
  19c3  AD9FFE74       JSR [0xfe74]                      
  19c7  3510           PULS  X                           
  19c9  39             RTS                               

; ---- function FUN_M76_r4_0c000__19ca
FUN_M76_r4_0c000__19ca:
  19ca  3410           PSHS  X                           
  19cc  8E1998         LDX #0x1998                        ; desc[API_FE22]: ->$1A03 ->$19E2
  19cf  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  19d3  3510           PULS  X                           
  19d5  39             RTS                               

; ---- function FUN_M76_r4_0c000__19d6
FUN_M76_r4_0c000__19d6:
  19d6  3410           PSHS  X                           
  19d8  8E1998         LDX #0x1998                       
  19db  AD9FFE70       JSR [0xfe70]                      
  19df  3510           PULS  X                           
  19e1  39             RTS                               

; ---- function FUN_M76_r4_0c000__19e2
FUN_M76_r4_0c000__19e2:
  19e2  3410           PSHS  X                           
  19e4  8E1998         LDX #0x1998                       
  19e7  AD9FFE72       JSR [0xfe72]                      
  19eb  3510           PULS  X                           
  19ed  39             RTS                               
  19ee  .db 14 76 6F 69 63 65 20 31 20 73 74 61 72 74 3A 20  ; .voice 1 start: 
  19fe  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1a03
FUN_M76_r4_0c000__1a03:
  1a03  3476           PSHS  U Y X B A                   
  1a05  8E1998         LDX #0x1998                       
  1a08  AD9FFE76       JSR [0xfe76]                      
  1a0c  C600           LDB #0x0                          
  1a0e  170A68         LBSR 0x2479                       
  1a11  3576           PULS  A B X Y U                   
  1a13  39             RTS                               
PTR_FUN_M76_r4_0c000__1a88_M76_r4_0c000__1a14:
  1a14  1A88           addr M76_r4_0c000::1a88           
  1a16  1A73           addr M76_r4_0c000::1a73           
  1a18  .db 1A 52 70 D6 71 54 00 00 71 56 00 08 00 C1 1E 00  ; .Rp.qT..qV......
  1a28  .db 00 00 7F 00 01 00 04 20 1A 5E 00 00 00 00 00 00  ; ....... .^......
  1a38  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1a3a
FUN_M76_r4_0c000__1a3a:
  1a3a  3410           PSHS  X                           
  1a3c  8E1A14         LDX #0x1a14                       
  1a3f  AD9FFE74       JSR [0xfe74]                      
  1a43  3510           PULS  X                           
  1a45  39             RTS                               

; ---- function FUN_M76_r4_0c000__1a46
FUN_M76_r4_0c000__1a46:
  1a46  3410           PSHS  X                           
  1a48  8E1A14         LDX #0x1a14                        ; desc[API_FE22]: ->$1A88 ->$1A73
  1a4b  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1a4f  3510           PULS  X                           
  1a51  39             RTS                               

; ---- function FUN_M76_r4_0c000__1a52
FUN_M76_r4_0c000__1a52:
  1a52  3410           PSHS  X                           
  1a54  8E1A14         LDX #0x1a14                       
  1a57  AD9FFE70       JSR [0xfe70]                      
  1a5b  3510           PULS  X                           
  1a5d  39             RTS                               
  1a5e  .db 14 76 6F 69 63 65 20 32 20 6E 6F 74 65 3A 20 20  ; .voice 2 note:  
  1a6e  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1a73
FUN_M76_r4_0c000__1a73:
  1a73  3436           PSHS  Y X B A                     
  1a75  F67157         LDB 0x7157                        
  1a78  AD9FFE0A       JSR [0xfe0a]                      
  1a7c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:24}{3:60AB}"
  1a80  02240360AB00   char[6] 02h,"$",03h,"`",ABh       
LAB_M76_r4_0c000__1a86:
  1a86  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__1a88
FUN_M76_r4_0c000__1a88:
  1a88  3476           PSHS  U Y X B A                   
  1a8a  8E1A14         LDX #0x1a14                       
  1a8d  AD9FFE76       JSR [0xfe76]                      
  1a91  C601           LDB #0x1                          
  1a93  1709E3         LBSR 0x2479                       
  1a96  3576           PULS  A B X Y U                   
  1a98  39             RTS                               
PTR_FUN_M76_r4_0c000__1b04_M76_r4_0c000__1a99:
  1a99  1B04           addr M76_r4_0c000::1b04           
  1a9b  1AE3           addr M76_r4_0c000::1ae3           
  1a9d  .db 1A D7 70 D8 71 58 00 00 71 5A 00 08 00 C2 24 00  ; ..p.qX..qZ....$.
  1aad  .db 00 00 7F 00 01 00 04 22 1A EF 00 00 00 00 00 00  ; ......."........
  1abd  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1abf
FUN_M76_r4_0c000__1abf:
  1abf  3410           PSHS  X                           
  1ac1  8E1A99         LDX #0x1a99                       
  1ac4  AD9FFE74       JSR [0xfe74]                      
  1ac8  3510           PULS  X                           
  1aca  39             RTS                               

; ---- function FUN_M76_r4_0c000__1acb
FUN_M76_r4_0c000__1acb:
  1acb  3410           PSHS  X                           
  1acd  8E1A99         LDX #0x1a99                        ; desc[API_FE22]: ->$1B04 ->$1AE3
  1ad0  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1ad4  3510           PULS  X                           
  1ad6  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ad7
FUN_M76_r4_0c000__1ad7:
  1ad7  3410           PSHS  X                           
  1ad9  8E1A99         LDX #0x1a99                       
  1adc  AD9FFE70       JSR [0xfe70]                      
  1ae0  3510           PULS  X                           
  1ae2  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ae3
FUN_M76_r4_0c000__1ae3:
  1ae3  3410           PSHS  X                           
  1ae5  8E1A99         LDX #0x1a99                       
  1ae8  AD9FFE72       JSR [0xfe72]                      
  1aec  3510           PULS  X                           
  1aee  39             RTS                               
  1aef  .db 14 76 6F 69 63 65 20 32 20 73 74 61 72 74 3A 20  ; .voice 2 start: 
  1aff  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1b04
FUN_M76_r4_0c000__1b04:
  1b04  3476           PSHS  U Y X B A                   
  1b06  8E1A99         LDX #0x1a99                       
  1b09  AD9FFE76       JSR [0xfe76]                      
  1b0d  C601           LDB #0x1                          
  1b0f  170967         LBSR 0x2479                       
  1b12  3576           PULS  A B X Y U                   
  1b14  39             RTS                               
PTR_FUN_M76_r4_0c000__1b89_M76_r4_0c000__1b15:
  1b15  1B89           addr M76_r4_0c000::1b89           
  1b17  1B74           addr M76_r4_0c000::1b74           
  1b19  .db 1B 53 70 DA 71 5C 00 00 71 5E 00 08 00 C3 1F 00  ; .Sp.q\..q^......
  1b29  .db 00 00 7F 00 01 00 04 20 1B 5F 00 00 00 00 00 00  ; ....... ._......
  1b39  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1b3b
FUN_M76_r4_0c000__1b3b:
  1b3b  3410           PSHS  X                           
  1b3d  8E1B15         LDX #0x1b15                       
  1b40  AD9FFE74       JSR [0xfe74]                      
  1b44  3510           PULS  X                           
  1b46  39             RTS                               

; ---- function FUN_M76_r4_0c000__1b47
FUN_M76_r4_0c000__1b47:
  1b47  3410           PSHS  X                           
  1b49  8E1B15         LDX #0x1b15                        ; desc[API_FE22]: ->$1B89 ->$1B74
  1b4c  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1b50  3510           PULS  X                           
  1b52  39             RTS                               

; ---- function FUN_M76_r4_0c000__1b53
FUN_M76_r4_0c000__1b53:
  1b53  3410           PSHS  X                           
  1b55  8E1B15         LDX #0x1b15                       
  1b58  AD9FFE70       JSR [0xfe70]                      
  1b5c  3510           PULS  X                           
  1b5e  39             RTS                               
  1b5f  .db 14 76 6F 69 63 65 20 33 20 6E 6F 74 65 3A 20 20  ; .voice 3 note:  
  1b6f  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1b74
FUN_M76_r4_0c000__1b74:
  1b74  3436           PSHS  Y X B A                     
  1b76  F6715F         LDB 0x715f                        
  1b79  AD9FFE0A       JSR [0xfe0a]                      
  1b7d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:24}{3:60AB}"
  1b81  02240360AB00   char[6] 02h,"$",03h,"`",ABh       
LAB_M76_r4_0c000__1b87:
  1b87  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__1b89
FUN_M76_r4_0c000__1b89:
  1b89  3476           PSHS  U Y X B A                   
  1b8b  8E1B15         LDX #0x1b15                       
  1b8e  AD9FFE76       JSR [0xfe76]                      
  1b92  C602           LDB #0x2                          
  1b94  1708E2         LBSR 0x2479                       
  1b97  3576           PULS  A B X Y U                   
  1b99  39             RTS                               
PTR_FUN_M76_r4_0c000__1c05_M76_r4_0c000__1b9a:
  1b9a  1C05           addr M76_r4_0c000::1c05           
  1b9c  1BE4           addr M76_r4_0c000::1be4           
  1b9e  .db 1B D8 70 DC 71 60 00 00 71 62 00 08 00 C4 25 00  ; ..p.q`..qb....%.
  1bae  .db 00 00 7F 00 01 00 04 22 1B F0 00 00 00 00 00 00  ; ......."........
  1bbe  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1bc0
FUN_M76_r4_0c000__1bc0:
  1bc0  3410           PSHS  X                           
  1bc2  8E1B9A         LDX #0x1b9a                       
  1bc5  AD9FFE74       JSR [0xfe74]                      
  1bc9  3510           PULS  X                           
  1bcb  39             RTS                               

; ---- function FUN_M76_r4_0c000__1bcc
FUN_M76_r4_0c000__1bcc:
  1bcc  3410           PSHS  X                           
  1bce  8E1B9A         LDX #0x1b9a                        ; desc[API_FE22]: ->$1C05 ->$1BE4
  1bd1  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1bd5  3510           PULS  X                           
  1bd7  39             RTS                               

; ---- function FUN_M76_r4_0c000__1bd8
FUN_M76_r4_0c000__1bd8:
  1bd8  3410           PSHS  X                           
  1bda  8E1B9A         LDX #0x1b9a                       
  1bdd  AD9FFE70       JSR [0xfe70]                      
  1be1  3510           PULS  X                           
  1be3  39             RTS                               

; ---- function FUN_M76_r4_0c000__1be4
FUN_M76_r4_0c000__1be4:
  1be4  3410           PSHS  X                           
  1be6  8E1B9A         LDX #0x1b9a                       
  1be9  AD9FFE72       JSR [0xfe72]                      
  1bed  3510           PULS  X                           
  1bef  39             RTS                               
  1bf0  .db 14 76 6F 69 63 65 20 33 20 73 74 61 72 74 3A 20  ; .voice 3 start: 
  1c00  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1c05
FUN_M76_r4_0c000__1c05:
  1c05  3476           PSHS  U Y X B A                   
  1c07  8E1B9A         LDX #0x1b9a                       
  1c0a  AD9FFE76       JSR [0xfe76]                      
  1c0e  C602           LDB #0x2                          
  1c10  170866         LBSR 0x2479                       
  1c13  3576           PULS  A B X Y U                   
  1c15  39             RTS                               
PTR_FUN_M76_r4_0c000__1c8a_M76_r4_0c000__1c16:
  1c16  1C8A           addr M76_r4_0c000::1c8a           
  1c18  1C75           addr M76_r4_0c000::1c75           
  1c1a  .db 1C 54 70 DE 71 64 00 00 71 66 00 08 00 C5 20 00  ; .Tp.qd..qf.... .
  1c2a  .db 00 00 7F 00 01 00 04 20 1C 60 00 00 00 00 00 00  ; ....... .`......
  1c3a  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1c3c
FUN_M76_r4_0c000__1c3c:
  1c3c  3410           PSHS  X                           
  1c3e  8E1C16         LDX #0x1c16                       
  1c41  AD9FFE74       JSR [0xfe74]                      
  1c45  3510           PULS  X                           
  1c47  39             RTS                               

; ---- function FUN_M76_r4_0c000__1c48
FUN_M76_r4_0c000__1c48:
  1c48  3410           PSHS  X                           
  1c4a  8E1C16         LDX #0x1c16                        ; desc[API_FE22]: ->$1C8A ->$1C75
  1c4d  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1c51  3510           PULS  X                           
  1c53  39             RTS                               

; ---- function FUN_M76_r4_0c000__1c54
FUN_M76_r4_0c000__1c54:
  1c54  3410           PSHS  X                           
  1c56  8E1C16         LDX #0x1c16                       
  1c59  AD9FFE70       JSR [0xfe70]                      
  1c5d  3510           PULS  X                           
  1c5f  39             RTS                               
  1c60  .db 14 76 6F 69 63 65 20 34 20 6E 6F 74 65 3A 20 20  ; .voice 4 note:  
  1c70  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1c75
FUN_M76_r4_0c000__1c75:
  1c75  3436           PSHS  Y X B A                     
  1c77  F67167         LDB 0x7167                        
  1c7a  AD9FFE0A       JSR [0xfe0a]                      
  1c7e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:24}{3:60AB}"
  1c82  02240360AB00   char[6] 02h,"$",03h,"`",ABh       
LAB_M76_r4_0c000__1c88:
  1c88  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__1c8a
FUN_M76_r4_0c000__1c8a:
  1c8a  3476           PSHS  U Y X B A                   
  1c8c  8E1C16         LDX #0x1c16                       
  1c8f  AD9FFE76       JSR [0xfe76]                      
  1c93  C603           LDB #0x3                          
  1c95  1707E1         LBSR 0x2479                       
  1c98  3576           PULS  A B X Y U                   
  1c9a  39             RTS                               
PTR_FUN_M76_r4_0c000__1d06_M76_r4_0c000__1c9b:
  1c9b  1D06           addr M76_r4_0c000::1d06           
  1c9d  1CE5           addr M76_r4_0c000::1ce5           
  1c9f  .db 1C D9 70 E0 71 68 00 00 71 6A 00 08 00 C6 26 00  ; ..p.qh..qj....&.
  1caf  .db 00 00 7F 00 01 00 04 22 1C F1 00 00 00 00 00 00  ; ......."........
  1cbf  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1cc1
FUN_M76_r4_0c000__1cc1:
  1cc1  3410           PSHS  X                           
  1cc3  8E1C9B         LDX #0x1c9b                       
  1cc6  AD9FFE74       JSR [0xfe74]                      
  1cca  3510           PULS  X                           
  1ccc  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ccd
FUN_M76_r4_0c000__1ccd:
  1ccd  3410           PSHS  X                           
  1ccf  8E1C9B         LDX #0x1c9b                        ; desc[API_FE22]: ->$1D06 ->$1CE5
  1cd2  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1cd6  3510           PULS  X                           
  1cd8  39             RTS                               

; ---- function FUN_M76_r4_0c000__1cd9
FUN_M76_r4_0c000__1cd9:
  1cd9  3410           PSHS  X                           
  1cdb  8E1C9B         LDX #0x1c9b                       
  1cde  AD9FFE70       JSR [0xfe70]                      
  1ce2  3510           PULS  X                           
  1ce4  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ce5
FUN_M76_r4_0c000__1ce5:
  1ce5  3410           PSHS  X                           
  1ce7  8E1C9B         LDX #0x1c9b                       
  1cea  AD9FFE72       JSR [0xfe72]                      
  1cee  3510           PULS  X                           
  1cf0  39             RTS                               
  1cf1  .db 14 76 6F 69 63 65 20 34 20 73 74 61 72 74 3A 20  ; .voice 4 start: 
  1d01  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1d06
FUN_M76_r4_0c000__1d06:
  1d06  3476           PSHS  U Y X B A                   
  1d08  8E1C9B         LDX #0x1c9b                       
  1d0b  AD9FFE76       JSR [0xfe76]                      
  1d0f  C603           LDB #0x3                          
  1d11  170765         LBSR 0x2479                       
  1d14  3576           PULS  A B X Y U                   
  1d16  39             RTS                               
PTR_FUN_M76_r4_0c000__1d8b_M76_r4_0c000__1d17:
  1d17  1D8B           addr M76_r4_0c000::1d8b           
  1d19  1D76           addr M76_r4_0c000::1d76           
  1d1b  .db 1D 55 70 E2 71 6C 00 00 71 6E 00 08 00 C7 21 00  ; .Up.ql..qn....!.
  1d2b  .db 00 00 7F 00 01 00 04 20 1D 61 00 00 00 00 00 00  ; ....... .a......
  1d3b  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1d3d
FUN_M76_r4_0c000__1d3d:
  1d3d  3410           PSHS  X                           
  1d3f  8E1D17         LDX #0x1d17                       
  1d42  AD9FFE74       JSR [0xfe74]                      
  1d46  3510           PULS  X                           
  1d48  39             RTS                               

; ---- function FUN_M76_r4_0c000__1d49
FUN_M76_r4_0c000__1d49:
  1d49  3410           PSHS  X                           
  1d4b  8E1D17         LDX #0x1d17                        ; desc[API_FE22]: ->$1D8B ->$1D76
  1d4e  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1d52  3510           PULS  X                           
  1d54  39             RTS                               

; ---- function FUN_M76_r4_0c000__1d55
FUN_M76_r4_0c000__1d55:
  1d55  3410           PSHS  X                           
  1d57  8E1D17         LDX #0x1d17                       
  1d5a  AD9FFE70       JSR [0xfe70]                      
  1d5e  3510           PULS  X                           
  1d60  39             RTS                               
  1d61  .db 14 76 6F 69 63 65 20 35 20 6E 6F 74 65 3A 20 20  ; .voice 5 note:  
  1d71  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1d76
FUN_M76_r4_0c000__1d76:
  1d76  3436           PSHS  Y X B A                     
  1d78  F6716F         LDB 0x716f                        
  1d7b  AD9FFE0A       JSR [0xfe0a]                      
  1d7f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:24}{3:60AB}"
  1d83  02240360AB00   char[6] 02h,"$",03h,"`",ABh       
LAB_M76_r4_0c000__1d89:
  1d89  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__1d8b
FUN_M76_r4_0c000__1d8b:
  1d8b  3476           PSHS  U Y X B A                   
  1d8d  8E1D17         LDX #0x1d17                       
  1d90  AD9FFE76       JSR [0xfe76]                      
  1d94  C604           LDB #0x4                          
  1d96  1706E0         LBSR 0x2479                       
  1d99  3576           PULS  A B X Y U                   
  1d9b  39             RTS                               
PTR_FUN_M76_r4_0c000__1e07_M76_r4_0c000__1d9c:
  1d9c  1E07           addr M76_r4_0c000::1e07           
  1d9e  1DE6           addr M76_r4_0c000::1de6           
  1da0  .db 1D DA 70 E4 71 70 00 00 71 72 00 08 00 C8 27 00  ; ..p.qp..qr....'.
  1db0  .db 00 00 7F 00 01 00 04 22 1D F2 00 00 00 00 00 00  ; ......."........
  1dc0  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1dc2
FUN_M76_r4_0c000__1dc2:
  1dc2  3410           PSHS  X                           
  1dc4  8E1D9C         LDX #0x1d9c                       
  1dc7  AD9FFE74       JSR [0xfe74]                      
  1dcb  3510           PULS  X                           
  1dcd  39             RTS                               

; ---- function FUN_M76_r4_0c000__1dce
FUN_M76_r4_0c000__1dce:
  1dce  3410           PSHS  X                           
  1dd0  8E1D9C         LDX #0x1d9c                        ; desc[API_FE22]: ->$1E07 ->$1DE6
  1dd3  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1dd7  3510           PULS  X                           
  1dd9  39             RTS                               

; ---- function FUN_M76_r4_0c000__1dda
FUN_M76_r4_0c000__1dda:
  1dda  3410           PSHS  X                           
  1ddc  8E1D9C         LDX #0x1d9c                       
  1ddf  AD9FFE70       JSR [0xfe70]                      
  1de3  3510           PULS  X                           
  1de5  39             RTS                               

; ---- function FUN_M76_r4_0c000__1de6
FUN_M76_r4_0c000__1de6:
  1de6  3410           PSHS  X                           
  1de8  8E1D9C         LDX #0x1d9c                       
  1deb  AD9FFE72       JSR [0xfe72]                      
  1def  3510           PULS  X                           
  1df1  39             RTS                               
  1df2  .db 14 76 6F 69 63 65 20 35 20 73 74 61 72 74 3A 20  ; .voice 5 start: 
  1e02  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1e07
FUN_M76_r4_0c000__1e07:
  1e07  3476           PSHS  U Y X B A                   
  1e09  8E1D9C         LDX #0x1d9c                       
  1e0c  AD9FFE76       JSR [0xfe76]                      
  1e10  C604           LDB #0x4                          
  1e12  170664         LBSR 0x2479                       
  1e15  3576           PULS  A B X Y U                   
  1e17  39             RTS                               
PTR_FUN_M76_r4_0c000__1e8c_M76_r4_0c000__1e18:
  1e18  1E8C           addr M76_r4_0c000::1e8c           
  1e1a  1E77           addr M76_r4_0c000::1e77           
  1e1c  .db 1E 56 70 E6 71 74 00 00 71 76 00 08 00 C9 22 00  ; .Vp.qt..qv....".
  1e2c  .db 00 00 7F 00 01 00 04 20 1E 62 00 00 00 00 00 00  ; ....... .b......
  1e3c  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1e3e
FUN_M76_r4_0c000__1e3e:
  1e3e  3410           PSHS  X                           
  1e40  8E1E18         LDX #0x1e18                       
  1e43  AD9FFE74       JSR [0xfe74]                      
  1e47  3510           PULS  X                           
  1e49  39             RTS                               

; ---- function FUN_M76_r4_0c000__1e4a
FUN_M76_r4_0c000__1e4a:
  1e4a  3410           PSHS  X                           
  1e4c  8E1E18         LDX #0x1e18                        ; desc[API_FE22]: ->$1E8C ->$1E77
  1e4f  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1e53  3510           PULS  X                           
  1e55  39             RTS                               

; ---- function FUN_M76_r4_0c000__1e56
FUN_M76_r4_0c000__1e56:
  1e56  3410           PSHS  X                           
  1e58  8E1E18         LDX #0x1e18                       
  1e5b  AD9FFE70       JSR [0xfe70]                      
  1e5f  3510           PULS  X                           
  1e61  39             RTS                               
  1e62  .db 14 76 6F 69 63 65 20 36 20 6E 6F 74 65 3A 20 20  ; .voice 6 note:  
  1e72  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1e77
FUN_M76_r4_0c000__1e77:
  1e77  3436           PSHS  Y X B A                     
  1e79  F67177         LDB 0x7177                        
  1e7c  AD9FFE0A       JSR [0xfe0a]                      
  1e80  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:24}{3:60AB}"
  1e84  02240360AB00   char[6] 02h,"$",03h,"`",ABh       
LAB_M76_r4_0c000__1e8a:
  1e8a  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__1e8c
FUN_M76_r4_0c000__1e8c:
  1e8c  3476           PSHS  U Y X B A                   
  1e8e  8E1E18         LDX #0x1e18                       
  1e91  AD9FFE76       JSR [0xfe76]                      
  1e95  C605           LDB #0x5                          
  1e97  1705DF         LBSR 0x2479                       
  1e9a  3576           PULS  A B X Y U                   
  1e9c  39             RTS                               
PTR_FUN_M76_r4_0c000__1f08_M76_r4_0c000__1e9d:
  1e9d  1F08           addr M76_r4_0c000::1f08           
  1e9f  1EE7           addr M76_r4_0c000::1ee7           
  1ea1  .db 1E DB 70 E8 71 78 00 00 71 7A 00 08 00 CA 28 00  ; ..p.qx..qz....(.
  1eb1  .db 00 00 7F 00 01 00 04 22 1E F3 00 00 00 00 00 00  ; ......."........
  1ec1  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1ec3
FUN_M76_r4_0c000__1ec3:
  1ec3  3410           PSHS  X                           
  1ec5  8E1E9D         LDX #0x1e9d                       
  1ec8  AD9FFE74       JSR [0xfe74]                      
  1ecc  3510           PULS  X                           
  1ece  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ecf
FUN_M76_r4_0c000__1ecf:
  1ecf  3410           PSHS  X                           
  1ed1  8E1E9D         LDX #0x1e9d                        ; desc[API_FE22]: ->$1F08 ->$1EE7
  1ed4  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1ed8  3510           PULS  X                           
  1eda  39             RTS                               

; ---- function FUN_M76_r4_0c000__1edb
FUN_M76_r4_0c000__1edb:
  1edb  3410           PSHS  X                           
  1edd  8E1E9D         LDX #0x1e9d                       
  1ee0  AD9FFE70       JSR [0xfe70]                      
  1ee4  3510           PULS  X                           
  1ee6  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ee7
FUN_M76_r4_0c000__1ee7:
  1ee7  3410           PSHS  X                           
  1ee9  8E1E9D         LDX #0x1e9d                       
  1eec  AD9FFE72       JSR [0xfe72]                      
  1ef0  3510           PULS  X                           
  1ef2  39             RTS                               
  1ef3  .db 14 76 6F 69 63 65 20 36 20 73 74 61 72 74 3A 20  ; .voice 6 start: 
  1f03  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1f08
FUN_M76_r4_0c000__1f08:
  1f08  3476           PSHS  U Y X B A                   
  1f0a  8E1E9D         LDX #0x1e9d                       
  1f0d  AD9FFE76       JSR [0xfe76]                      
  1f11  C605           LDB #0x5                          
  1f13  170563         LBSR 0x2479                       
  1f16  3576           PULS  A B X Y U                   
  1f18  39             RTS                               
PTR_FUN_M76_r4_0c000__1f9c_M76_r4_0c000__1f19:
  1f19  1F9C           addr M76_r4_0c000::1f9c           
  1f1b  1F63           addr M76_r4_0c000::1f63           
  1f1d  .db 1F 57 70 BE 71 26 00 00 71 28 00 08 00 B1 13 00  ; .Wp.q&..q(......
  1f2d  .db 00 00 64 00 01 00 03 19 1F 87 00 00 00 00 70 C0  ; ..d...........p.
  1f3d  .db 00 B3                                            ; ..

; ---- function FUN_M76_r4_0c000__1f3f
FUN_M76_r4_0c000__1f3f:
  1f3f  3410           PSHS  X                           
  1f41  8E1F19         LDX #0x1f19                        ; desc[API_FE6A]: ->$1F9C ->$1F63
  1f44  AD9FFE6A       JSR [0xfe6a]                      
  1f48  3510           PULS  X                           
  1f4a  39             RTS                               

; ---- function FUN_M76_r4_0c000__1f4b
FUN_M76_r4_0c000__1f4b:
  1f4b  3410           PSHS  X                           
  1f4d  8E1F19         LDX #0x1f19                        ; desc[API_FDBC]: ->$1F9C ->$1F63
  1f50  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1f54  3510           PULS  X                           
  1f56  39             RTS                               

; ---- function FUN_M76_r4_0c000__1f57
FUN_M76_r4_0c000__1f57:
  1f57  3410           PSHS  X                           
  1f59  8E1F19         LDX #0x1f19                        ; desc[API_FE6C]: ->$1F9C ->$1F63
  1f5c  AD9FFE6C       JSR [0xfe6c]                      
  1f60  3510           PULS  X                           
  1f62  39             RTS                               

; ---- function FUN_M76_r4_0c000__1f63
FUN_M76_r4_0c000__1f63:
  1f63  3410           PSHS  X                           
  1f65  8E1F19         LDX #0x1f19                        ; desc[API_FE6E]: ->$1F9C ->$1F63
  1f68  AD9FFE6E       JSR [0xfe6e]                      
  1f6c  3510           PULS  X                           
  1f6e  39             RTS                               

; ---- function FUN_M76_r4_0c000__1f6f
FUN_M76_r4_0c000__1f6f:
  1f6f  3410           PSHS  X                           
  1f71  8E1F19         LDX #0x1f19                        ; desc[API_FE1C]: ->$1F9C ->$1F63
  1f74  AD9FFE1C       JSR [0xfe1c]                      
  1f78  3510           PULS  X                           
  1f7a  39             RTS                               

; ---- function FUN_M76_r4_0c000__1f7b
FUN_M76_r4_0c000__1f7b:
  1f7b  3410           PSHS  X                           
  1f7d  8E1F19         LDX #0x1f19                        ; desc[API_FE1A]: ->$1F9C ->$1F63 $1F57
  1f80  AD9FFE1A       JSR [0xfe1a]                      
  1f84  3510           PULS  X                           
  1f86  39             RTS                               
  1f87  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  1f97  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__1f9c
FUN_M76_r4_0c000__1f9c:
  1f9c  3476           PSHS  U Y X B A                   
  1f9e  8E1F19         LDX #0x1f19                       
  1fa1  AD9FFE76       JSR [0xfe76]                      
  1fa5  CC0064         LDD #0x64                         
  1fa8  B37128         SUBD 0x7128                       
  1fab  3606           PSHU  B A                         
  1fad  58             LSLB                              
  1fae  49             ROLA                              
  1faf  FD717C         STD 0x717c                        
  1fb2  CC4666         LDD #0x4666                       
  1fb5  3606           PSHU  B A                         
  1fb7  AD9FFCF2       JSR [0xfcf2]                      
  1fbb  3706           PULU  A B                         
  1fbd  F3717C         ADDD 0x717c                       
  1fc0  AD9FFC6A       JSR [0xfc6a]                      
  1fc4  AD9FFC72       JSR [0xfc72]                      
  1fc8  3576           PULS  A B X Y U                   
  1fca  39             RTS                               
PTR_FUN_M76_r4_0c000__2036_M76_r4_0c000__1fcb:
  1fcb  2036           addr M76_r4_0c000::2036           
  1fcd  2015           addr M76_r4_0c000::2015           
  1fcf  .db 20 09 70 C2 71 2C 00 00 71 2E 00 08 00 21 29 FF  ;  .p.q,..q....!).
  1fdf  .db D0 00 30 00 01 00 03 1C 20 21 00 00 00 00 00 00  ; ..0..... !......
  1fef  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__1ff1
FUN_M76_r4_0c000__1ff1:
  1ff1  3410           PSHS  X                           
  1ff3  8E1FCB         LDX #0x1fcb                       
  1ff6  AD9FFE74       JSR [0xfe74]                      
  1ffa  3510           PULS  X                           
  1ffc  39             RTS                               

; ---- function FUN_M76_r4_0c000__1ffd
FUN_M76_r4_0c000__1ffd:
  1ffd  3410           PSHS  X                           
  1fff  8E1FCB         LDX #0x1fcb                        ; desc[API_FE22]: ->$2036 ->$2015
  2002  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2006  3510           PULS  X                           
  2008  39             RTS                               

; ---- function FUN_M76_r4_0c000__2009
FUN_M76_r4_0c000__2009:
  2009  3410           PSHS  X                           
  200b  8E1FCB         LDX #0x1fcb                       
  200e  AD9FFE70       JSR [0xfe70]                      
  2012  3510           PULS  X                           
  2014  39             RTS                               

; ---- function FUN_M76_r4_0c000__2015
FUN_M76_r4_0c000__2015:
  2015  3410           PSHS  X                           
  2017  8E1FCB         LDX #0x1fcb                       
  201a  AD9FFE72       JSR [0xfe72]                      
  201e  3510           PULS  X                           
  2020  39             RTS                               
  2021  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  2031  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__2036
FUN_M76_r4_0c000__2036:
  2036  3476           PSHS  U Y X B A                   
  2038  8E1FCB         LDX #0x1fcb                       
  203b  AD9FFE76       JSR [0xfe76]                      
  203f  AD9FFE52       JSR [0xfe52]                      
  2043  3576           PULS  A B X Y U                   
  2045  39             RTS                               
PTR_FUN_M76_r4_0c000__20b1_M76_r4_0c000__2046:
  2046  20B1           addr M76_r4_0c000::20b1           
  2048  2090           addr M76_r4_0c000::2090           
  204a  .db 20 84 70 C4 71 30 00 00 71 32 00 08 00 22 2A FF  ;  .p.q0..q2..."*.
  205a  .db D0 00 30 00 01 00 03 1D 20 9C 00 00 00 00 00 00  ; ..0..... .......
  206a  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__206c
FUN_M76_r4_0c000__206c:
  206c  3410           PSHS  X                           
  206e  8E2046         LDX #0x2046                       
  2071  AD9FFE74       JSR [0xfe74]                      
  2075  3510           PULS  X                           
  2077  39             RTS                               

; ---- function FUN_M76_r4_0c000__2078
FUN_M76_r4_0c000__2078:
  2078  3410           PSHS  X                           
  207a  8E2046         LDX #0x2046                        ; desc[API_FE22]: ->$20B1 ->$2090
  207d  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2081  3510           PULS  X                           
  2083  39             RTS                               

; ---- function FUN_M76_r4_0c000__2084
FUN_M76_r4_0c000__2084:
  2084  3410           PSHS  X                           
  2086  8E2046         LDX #0x2046                       
  2089  AD9FFE70       JSR [0xfe70]                      
  208d  3510           PULS  X                           
  208f  39             RTS                               

; ---- function FUN_M76_r4_0c000__2090
FUN_M76_r4_0c000__2090:
  2090  3410           PSHS  X                           
  2092  8E2046         LDX #0x2046                       
  2095  AD9FFE72       JSR [0xfe72]                      
  2099  3510           PULS  X                           
  209b  39             RTS                               
  209c  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  20ac  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__20b1
FUN_M76_r4_0c000__20b1:
  20b1  3476           PSHS  U Y X B A                   
  20b3  8E2046         LDX #0x2046                       
  20b6  AD9FFE76       JSR [0xfe76]                      
  20ba  AD9FFE54       JSR [0xfe54]                      
  20be  3576           PULS  A B X Y U                   
  20c0  39             RTS                               
PTR_FUN_M76_r4_0c000__212c_M76_r4_0c000__20c1:
  20c1  212C           addr M76_r4_0c000::212c           
  20c3  210B           addr M76_r4_0c000::210b           
  20c5  .db 20 FF 70 C6 71 34 00 00 71 36 00 08 00 23 2B FF  ;  .p.q4..q6...#+.
  20d5  .db D0 00 30 00 01 00 03 1D 21 17 00 00 00 00 00 00  ; ..0.....!.......
  20e5  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__20e7
FUN_M76_r4_0c000__20e7:
  20e7  3410           PSHS  X                           
  20e9  8E20C1         LDX #0x20c1                       
  20ec  AD9FFE74       JSR [0xfe74]                      
  20f0  3510           PULS  X                           
  20f2  39             RTS                               

; ---- function FUN_M76_r4_0c000__20f3
FUN_M76_r4_0c000__20f3:
  20f3  3410           PSHS  X                           
  20f5  8E20C1         LDX #0x20c1                        ; desc[API_FE22]: ->$212C ->$210B
  20f8  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  20fc  3510           PULS  X                           
  20fe  39             RTS                               

; ---- function FUN_M76_r4_0c000__20ff
FUN_M76_r4_0c000__20ff:
  20ff  3410           PSHS  X                           
  2101  8E20C1         LDX #0x20c1                       
  2104  AD9FFE70       JSR [0xfe70]                      
  2108  3510           PULS  X                           
  210a  39             RTS                               

; ---- function FUN_M76_r4_0c000__210b
FUN_M76_r4_0c000__210b:
  210b  3410           PSHS  X                           
  210d  8E20C1         LDX #0x20c1                       
  2110  AD9FFE72       JSR [0xfe72]                      
  2114  3510           PULS  X                           
  2116  39             RTS                               
  2117  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  2127  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M76_r4_0c000__212c
FUN_M76_r4_0c000__212c:
  212c  3476           PSHS  U Y X B A                   
  212e  8E20C1         LDX #0x20c1                       
  2131  AD9FFE76       JSR [0xfe76]                      
  2135  AD9FFE56       JSR [0xfe56]                      
  2139  3576           PULS  A B X Y U                   
  213b  39             RTS                               
PTR_FUN_M76_r4_0c000__21a7_M76_r4_0c000__213c:
  213c  21A7           addr M76_r4_0c000::21a7           
  213e  2186           addr M76_r4_0c000::2186           
  2140  .db 21 7A 70 C8 71 38 00 00 71 3A 00 08 00 24 2C FF  ; !zp.q8..q:...$,.
  2150  .db D0 00 30 00 01 00 03 1E 21 92 00 00 00 00 00 00  ; ..0.....!.......
  2160  .db 00 00                                            ; ..

; ---- function FUN_M76_r4_0c000__2162
FUN_M76_r4_0c000__2162:
  2162  3410           PSHS  X                           
  2164  8E213C         LDX #0x213c                       
  2167  AD9FFE74       JSR [0xfe74]                      
  216b  3510           PULS  X                           
  216d  39             RTS                               

; ---- function FUN_M76_r4_0c000__216e
FUN_M76_r4_0c000__216e:
  216e  3410           PSHS  X                           
  2170  8E213C         LDX #0x213c                        ; desc[API_FE22]: ->$21A7 ->$2186
  2173  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2177  3510           PULS  X                           
  2179  39             RTS                               

; ---- function FUN_M76_r4_0c000__217a
FUN_M76_r4_0c000__217a:
  217a  3410           PSHS  X                           
  217c  8E213C         LDX #0x213c                       
  217f  AD9FFE70       JSR [0xfe70]                      
  2183  3510           PULS  X                           
  2185  39             RTS                               

; ---- function FUN_M76_r4_0c000__2186
FUN_M76_r4_0c000__2186:
  2186  3410           PSHS  X                           
  2188  8E213C         LDX #0x213c                       
  218b  AD9FFE72       JSR [0xfe72]                      
  218f  3510           PULS  X                           
  2191  39             RTS                               
  2192  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  21a2  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M76_r4_0c000__21a7
FUN_M76_r4_0c000__21a7:
  21a7  3476           PSHS  U Y X B A                   
  21a9  8E213C         LDX #0x213c                       
  21ac  AD9FFE76       JSR [0xfe76]                      
  21b0  AD9FFE58       JSR [0xfe58]                      
  21b4  3576           PULS  A B X Y U                   
  21b6  39             RTS                               

; ---- function FUN_M76_r4_0c000__21b7
FUN_M76_r4_0c000__21b7:
  21b7  3430           PSHS  Y X                         
  21b9  3606           PSHU  B A                         
  21bb  3606           PSHU  B A                         
  21bd  CC0003         LDD #0x3                          
  21c0  3606           PSHU  B A                         
  21c2  AD9FFCEC       JSR [0xfcec]                      
  21c6  AD9FFCFC       JSR [0xfcfc]                      
  21ca  CC236B         LDD #0x236b                       
  21cd  3606           PSHU  B A                         
  21cf  AD9FFCF2       JSR [0xfcf2]                      
  21d3  AD9FFCE2       JSR [0xfce2]                      
  21d7  3706           PULU  A B                         
  21d9  35B0           PULS  X Y PC                      

; ---- function FUN_M76_r4_0c000__21db
FUN_M76_r4_0c000__21db:
  21db  3430           PSHS  Y X                         
  21dd  EC2E           LDD 0xe,Y                         
  21df  3606           PSHU  B A                         
  21e1  CC0064         LDD #0x64                         
  21e4  3606           PSHU  B A                         
  21e6  AD9FFCEC       JSR [0xfcec]                      
  21ea  3706           PULU  A B                         
  21ec  8DC9           BSR 0x21b7                        
  21ee  A7A812         STA 0x12,Y                        
  21f1  35B0           PULS  X Y PC                      

; ---- function FUN_M76_r4_0c000__21f3
FUN_M76_r4_0c000__21f3:
  21f3  3430           PSHS  Y X                         
  21f5  ECA818         LDD 0x18,Y                        
  21f8  3606           PSHU  B A                         
  21fa  CC0064         LDD #0x64                         
  21fd  3606           PSHU  B A                         
  21ff  AD9FFCEC       JSR [0xfcec]                      
  2203  3706           PULU  A B                         
  2205  8DB0           BSR 0x21b7                        
  2207  A7A81C         STA 0x1c,Y                        
  220a  35B0           PULS  X Y PC                      

; ---- function FUN_M76_r4_0c000__220c
FUN_M76_r4_0c000__220c:
  220c  3430           PSHS  Y X                         
  220e  3606           PSHU  B A                         
  2210  58             LSLB                              
  2211  49             ROLA                              
  2212  58             LSLB                              
  2213  49             ROLA                              
  2214  3606           PSHU  B A                         
  2216  AD9FFCFC       JSR [0xfcfc]                      
  221a  CC347F         LDD #0x347f                       
  221d  3606           PSHU  B A                         
  221f  AD9FFCF2       JSR [0xfcf2]                      
  2223  AD9FFCE2       JSR [0xfce2]                      
  2227  3706           PULU  A B                         
  2229  C30001         ADDD #0x1                         
  222c  35B0           PULS  X Y PC                      

; ---- function FUN_M76_r4_0c000__222e
FUN_M76_r4_0c000__222e:
  222e  3416           PSHS  X B A                       
  2230  327C           LEAS -0x4,S                       
  2232  CC0000         LDD #0x0                          
  2235  ED62           STD 0x2,S                         
  2237  3706           PULU  A B                         
  2239  47             ASRA                              
  223a  56             RORB                              
  223b  EDE4           STD ,S                            
  223d  3706           PULU  A B                         
  223f  8E000F         LDX #0xf                          
LAB_M76_r4_0c000__2242:
  2242  10A3E4         CMPD ,S                           
  2245  250C           BCS 0x2253                        
  2247  A3E4           SUBD ,S                           
  2249  6863           LSL 0x3,S                         
  224b  6962           ROL 0x2,S                         
  224d  59             ROLB                              
  224e  49             ROLA                              
  224f  6C63           INC 0x3,S                         
  2251  2006           BRA 0x2259                        
LAB_M76_r4_0c000__2253:
  2253  6863           LSL 0x3,S                         
  2255  6962           ROL 0x2,S                         
  2257  59             ROLB                              
  2258  49             ROLA                              
LAB_M76_r4_0c000__2259:
  2259  301F           LEAX -0x1,X                       
  225b  26E5           BNE 0x2242                        
  225d  EC62           LDD 0x2,S                         
  225f  3606           PSHU  B A                         
  2261  3264           LEAS 0x4,S                        
  2263  3596           PULS  A B X PC                    
  2265  .db 3B                                               ; ;

;; Module 7A code record 02, 3408 bytes, entered at payload start
MODULE_7A_02_CODE_hdr:
  2266  7A020D580000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_7A_02_entry
MODULE_7A_02_entry:
  226e  3436           PSHS  Y X B A                     
  2270  170098         LBSR 0x230b                       
  2273  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2275
FUN_M76_r4_0c000__2275:
  2275  3436           PSHS  Y X B A                     
  2277  327C           LEAS -0x4,S                       
  2279  C600           LDB #0x0                          
  227b  E7E4           STB ,S                            
  227d  108E6E28       LDY #0x6e28                       
  2281  10AF62         STY 0x2,S                         
LAB_M76_r4_0c000__2284:
  2284  E6E4           LDB ,S                            
  2286  17065C         LBSR 0x28e5                       
  2289  C6FF           LDB #0xff                         
  228b  E7A90005       STB 0x5,Y                         
  228f  10AE890000     LDY 0x0,X                         
  2294  CC0000         LDD #0x0                          
  2297  AD9FFD2E       JSR [0xfd2e]                      
  229b  10AE890004     LDY 0x4,X                         
  22a0  CC0000         LDD #0x0                          
  22a3  AD9FFD2E       JSR [0xfd2e]                      
  22a7  10AE890006     LDY 0x6,X                         
  22ac  CC0000         LDD #0x0                          
  22af  AD9FFD2E       JSR [0xfd2e]                      
  22b3  10AE890008     LDY 0x8,X                         
  22b8  CC0000         LDD #0x0                          
  22bb  AD9FFD2E       JSR [0xfd2e]                      
  22bf  10AE89000A     LDY 0xa,X                         
  22c4  CC0000         LDD #0x0                          
  22c7  AD9FFD2E       JSR [0xfd2e]                      
  22cb  10AE89000C     LDY 0xc,X                         
  22d0  CC0000         LDD #0x0                          
  22d3  AD9FFD2E       JSR [0xfd2e]                      
  22d7  10AE89000E     LDY 0xe,X                         
  22dc  EC62           LDD 0x2,S                         
  22de  AD9FFD2E       JSR [0xfd2e]                      
  22e2  10AE890002     LDY 0x2,X                         
  22e7  EC62           LDD 0x2,S                         
  22e9  C30064         ADDD #0x64                        
  22ec  AD9FFD2E       JSR [0xfd2e]                      
  22f0  C31770         ADDD #0x1770                      
  22f3  ED62           STD 0x2,S                         
  22f5  E6E4           LDB ,S                            
  22f7  CB01           ADDB #0x1                         
  22f9  E7E4           STB ,S                            
  22fb  C106           CMPB #0x6                         
  22fd  1026FF83       LBNE 0x2284                       
  2301  3264           LEAS 0x4,S                        
  2303  7F74CC         CLR 0x74cc                        
  2306  1705CF         LBSR 0x28d8                       
  2309  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__230b
FUN_M76_r4_0c000__230b:
  230b  3436           PSHS  Y X B A                     
  230d  1700A4         LBSR 0x23b4                       
  2310  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$23B3(rel)
  2314  009F           dw 9Fh                            
LAB_M76_r4_0c000__2316:
  2316  EDA90003       STD 0x3,Y                         
  231a  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$232C(rel)
  231e  000E           dw Eh                             
LAB_M76_r4_0c000__2320:
  2320  EDA90001       STD 0x1,Y                         
  2324  CC0000         LDD #0x0                          
  2327  F774CC         STB 0x74cc                        
  232a  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__232c
FUN_M76_r4_0c000__232c:
  232c  3436           PSHS  Y X B A                     
  232e  7D608A         TST 0x608a                        
  2331  2B0B           BMI 0x233e                        
  2333  E661           LDB 0x1,S                         
  2335  C40F           ANDB #0xf                         
  2337  F1608A         CMPB 0x608a                       
  233a  1026000C       LBNE 0x234a                       
LAB_M76_r4_0c000__233e:
  233e  E661           LDB 0x1,S                         
  2340  C4F0           ANDB #0xf0                        
  2342  C190           CMPB #0x90                        
  2344  2713           BEQ 0x2359                        
  2346  C180           CMPB #0x80                        
  2348  2740           BEQ 0x238a                        
LAB_M76_r4_0c000__234a:
  234a  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$23B3(rel)
  234e  0065           dw 65h                            

; ---- function FUN_M76_r4_0c000__2350
FUN_M76_r4_0c000__2350:
  2350  170061         LBSR 0x23b4                       
  2353  EDA90003       STD 0x3,Y                         
  2357  35B6           PULS  A B X Y PC                  
LAB_M76_r4_0c000__2359:
  2359  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2361(rel)
  235d  0004           dw 4h                             
LAB_M76_r4_0c000__235f:
  235f  20EF           BRA 0x2350                        

; ---- function FUN_M76_r4_0c000__2361
FUN_M76_r4_0c000__2361:
  2361  3436           PSHS  Y X B A                     
  2363  F77214         STB 0x7214                        
  2366  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$236E(rel)
  236a  0004           dw 4h                             
LAB_M76_r4_0c000__236c:
  236c  20E2           BRA 0x2350                        

; ---- function FUN_M76_r4_0c000__236e
FUN_M76_r4_0c000__236e:
  236e  3436           PSHS  Y X B A                     
  2370  5D             TSTB                              
  2371  270B           BEQ 0x237e                        
  2373  17004C         LBSR 0x23c2                       
LAB_M76_r4_0c000__2376:
  2376  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2361(rel)
  237a  FFE7           dw FFE7h                          
LAB_M76_r4_0c000__237c:
  237c  20D2           BRA 0x2350                        
LAB_M76_r4_0c000__237e:
  237e  C602           LDB #0x2                          
  2380  F56117         BITB 0x6117                       
  2383  27F1           BEQ 0x2376                        
  2385  1700C0         LBSR 0x2448                       
  2388  20EC           BRA 0x2376                        
LAB_M76_r4_0c000__238a:
  238a  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2392(rel)
  238e  0004           dw 4h                             
LAB_M76_r4_0c000__2390:
  2390  20BE           BRA 0x2350                        

; ---- function FUN_M76_r4_0c000__2392
FUN_M76_r4_0c000__2392:
  2392  3436           PSHS  Y X B A                     
  2394  F77214         STB 0x7214                        
  2397  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$239F(rel)
  239b  0004           dw 4h                             
LAB_M76_r4_0c000__239d:
  239d  20B1           BRA 0x2350                        

; ---- function FUN_M76_r4_0c000__239f
FUN_M76_r4_0c000__239f:
  239f  3436           PSHS  Y X B A                     
  23a1  C601           LDB #0x1                          
  23a3  F56117         BITB 0x6117                       
  23a6  2703           BEQ 0x23ab                        
  23a8  17009D         LBSR 0x2448                       
LAB_M76_r4_0c000__23ab:
  23ab  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2392(rel)
  23af  FFE3           dw FFE3h                          
LAB_M76_r4_0c000__23b1:
  23b1  209D           BRA 0x2350                        
DAT_M76_r4_0c000__23b3:
  23b3  39             ?? 39h    9                       

; ---- function FUN_M76_r4_0c000__23b4
FUN_M76_r4_0c000__23b4:
  23b4  3416           PSHS  X B A                       
  23b6  C60F           LDB #0xf                          
  23b8  8630           LDA #0x30                         
  23ba  3D             MUL                               
  23bb  C36B00         ADDD #0x6b00                      
  23be  1F02           TFR D,Y                           
  23c0  3596           PULS  A B X PC                    

; ---- function FUN_M76_r4_0c000__23c2
FUN_M76_r4_0c000__23c2:
  23c2  3436           PSHS  Y X B A                     
  23c4  7D70FF         TST 0x70ff                        
  23c7  2657           BNE 0x2420                        
  23c9  170056         LBSR 0x2422                       
  23cc  C1FF           CMPB #0xff                        
  23ce  2750           BEQ 0x2420                        
  23d0  170512         LBSR 0x28e5                       
  23d3  170348         LBSR 0x271e                       
  23d6  E661           LDB 0x1,S                         
  23d8  F774CD         STB 0x74cd                        
  23db  E7A90021       STB 0x21,Y                        
  23df  4F             CLRA                              
  23e0  ED990020       STD [0x20,X]                      
  23e4  ED99001E       STD [0x1e,X]                      
  23e8  10AE89001C     LDY 0x1c,X                        
  23ed  AD9FFC80       JSR [0xfc80]                      
  23f1  10BE74D0       LDY 0x74d0                        
  23f5  F67214         LDB 0x7214                        
  23f8  E7A90005       STB 0x5,Y                         
  23fc  E7A90004       STB 0x4,Y                         
  2400  ED99001A       STD [0x1a,X]                      
  2404  ED990018       STD [0x18,X]                      
  2408  10AE890016     LDY 0x16,X                        
  240d  AD9FFC80       JSR [0xfc80]                      
  2411  10BE74D0       LDY 0x74d0                        
  2415  1700D8         LBSR 0x24f0                       
  2418  1702A1         LBSR 0x26bc                       
  241b  E661           LDB 0x1,S                         
  241d  17026E         LBSR 0x268e                       
LAB_M76_r4_0c000__2420:
  2420  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2422
FUN_M76_r4_0c000__2422:
  2422  3432           PSHS  Y X A                       
  2424  F674CC         LDB 0x74cc                        
LAB_M76_r4_0c000__2427:
  2427  5C             INCB                              
  2428  C106           CMPB #0x6                         
  242a  2601           BNE 0x242d                        
  242c  5F             CLRB                              
LAB_M76_r4_0c000__242d:
  242d  1704B5         LBSR 0x28e5                       
  2430  86FF           LDA #0xff                         
  2432  A1A90005       CMPA 0x5,Y                        
  2436  2707           BEQ 0x243f                        
  2438  F174CC         CMPB 0x74cc                       
  243b  2707           BEQ 0x2444                        
  243d  20E8           BRA 0x2427                        
LAB_M76_r4_0c000__243f:
  243f  F774CC         STB 0x74cc                        
  2442  2002           BRA 0x2446                        
LAB_M76_r4_0c000__2444:
  2444  C6FF           LDB #0xff                         
LAB_M76_r4_0c000__2446:
  2446  35B2           PULS  A X Y PC                    

; ---- function FUN_M76_r4_0c000__2448
FUN_M76_r4_0c000__2448:
  2448  3436           PSHS  Y X B A                     
  244a  C600           LDB #0x0                          
LAB_M76_r4_0c000__244c:
  244c  170496         LBSR 0x28e5                       
  244f  A6A90005       LDA 0x5,Y                         
  2453  B17214         CMPA 0x7214                       
  2456  2707           BEQ 0x245f                        
  2458  5C             INCB                              
  2459  C106           CMPB #0x6                         
  245b  26EF           BNE 0x244c                        
  245d  2018           BRA 0x2477                        
LAB_M76_r4_0c000__245f:
  245f  86FF           LDA #0xff                         
  2461  A7A90005       STA 0x5,Y                         
  2465  7D70F9         TST 0x70f9                        
  2468  260D           BNE 0x2477                        
  246a  17012A         LBSR 0x2597                       
  246d  F6713F         LDB 0x713f                        
  2470  C102           CMPB #0x2                         
  2472  2703           BEQ 0x2477                        
  2474  1702A7         LBSR 0x271e                       
LAB_M76_r4_0c000__2477:
  2477  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2479
FUN_M76_r4_0c000__2479:
  2479  3436           PSHS  Y X B A                     
  247b  170467         LBSR 0x28e5                       
  247e  EC990020       LDD [0x20,X]                      
  2482  F774CD         STB 0x74cd                        
  2485  E7A90021       STB 0x21,Y                        
  2489  EC99001A       LDD [0x1a,X]                      
  248d  F77214         STB 0x7214                        
  2490  E7A90004       STB 0x4,Y                         
  2494  170059         LBSR 0x24f0                       
  2497  170222         LBSR 0x26bc                       
  249a  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__249c
FUN_M76_r4_0c000__249c:
  249c  3436           PSHS  Y X B A                     
  249e  7D70F9         TST 0x70f9                        
  24a1  261F           BNE 0x24c2                        
  24a3  C600           LDB #0x0                          
LAB_M76_r4_0c000__24a5:
  24a5  17043D         LBSR 0x28e5                       
  24a8  A6A90005       LDA 0x5,Y                         
  24ac  81FF           CMPA #0xff                        
  24ae  260D           BNE 0x24bd                        
  24b0  1700E4         LBSR 0x2597                       
  24b3  B6713F         LDA 0x713f                        
  24b6  8102           CMPA #0x2                         
  24b8  2703           BEQ 0x24bd                        
  24ba  170261         LBSR 0x271e                       
LAB_M76_r4_0c000__24bd:
  24bd  5C             INCB                              
  24be  C106           CMPB #0x6                         
  24c0  26E3           BNE 0x24a5                        
LAB_M76_r4_0c000__24c2:
  24c2  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__24c4
FUN_M76_r4_0c000__24c4:
  24c4  3436           PSHS  Y X B A                     
  24c6  C600           LDB #0x0                          
LAB_M76_r4_0c000__24c8:
  24c8  17041A         LBSR 0x28e5                       
  24cb  1700C9         LBSR 0x2597                       
  24ce  5C             INCB                              
  24cf  C106           CMPB #0x6                         
  24d1  26F5           BNE 0x24c8                        
  24d3  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__24d5
FUN_M76_r4_0c000__24d5:
  24d5  3436           PSHS  Y X B A                     
  24d7  C606           LDB #0x6                          
  24d9  3404           PSHS  B                           
LAB_M76_r4_0c000__24db:
  24db  E6E4           LDB ,S                            
  24dd  5A             DECB                              
  24de  170404         LBSR 0x28e5                       
  24e1  E6A90004       LDB 0x4,Y                         
  24e5  170008         LBSR 0x24f0                       
  24e8  6AE4           DEC ,S                            
  24ea  26EF           BNE 0x24db                        
  24ec  3261           LEAS 0x1,S                        
  24ee  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__24f0
FUN_M76_r4_0c000__24f0:
  24f0  3436           PSHS  Y X B A                     
  24f2  170179         LBSR 0x266e                       
  24f5  A6A90002       LDA 0x2,Y                         
  24f9  5F             CLRB                              
LAB_M76_r4_0c000__24fa:
  24fa  810C           CMPA #0xc                         
  24fc  2505           BCS 0x2503                        
  24fe  5C             INCB                              
  24ff  800C           SUBA #0xc                         
  2501  20F7           BRA 0x24fa                        
LAB_M76_r4_0c000__2503:
  2503  3402           PSHS  A                           
  2505  4F             CLRA                              
  2506  3606           PSHU  B A                         
  2508  3502           PULS  A                           
  250a  E6A90003       LDB 0x3,Y                         
  250e  3606           PSHU  B A                         
  2510  CC0003         LDD #0x3                          
  2513  3606           PSHU  B A                         
  2515  AD9FFCDE       JSR [0xfcde]                      
  2519  1704B6         LBSR 0x29d2                       
  251c  AD9FFCFC       JSR [0xfcfc]                      
  2520  3706           PULU  A B                         
  2522  CB02           ADDB #0x2                         
  2524  3406           PSHS  B A                         
  2526  CC0000         LDD #0x0                          
  2529  3606           PSHU  B A                         
  252b  3506           PULS  A B                         
LAB_M76_r4_0c000__252d:
  252d  6442           LSR 0x2,U                         
  252f  6643           ROR 0x3,U                         
  2531  66C4           ROR ,U                            
  2533  6641           ROR 0x1,U                         
  2535  5A             DECB                              
  2536  26F5           BNE 0x252d                        
  2538  3706           PULU  A B                         
  253a  44             LSRA                              
  253b  56             RORB                              
  253c  10AE64         LDY 0x4,S                         
  253f  EDA90000       STD 0x0,Y                         
  2543  3706           PULU  A B                         
  2545  EDA90008       STD 0x8,Y                         
  2549  ECA90000       LDD 0x0,Y                         
  254d  10833FFF       CMPD #0x3fff                      
  2551  2514           BCS 0x2567                        
  2553  833FFF         SUBD #0x3fff                      
  2556  EDA90000       STD 0x0,Y                         
  255a  ECA90008       LDD 0x8,Y                         
  255e  830002         SUBD #0x2                         
  2561  EDA90008       STD 0x8,Y                         
  2565  2016           BRA 0x257d                        
LAB_M76_r4_0c000__2567:
  2567  C33FFF         ADDD #0x3fff                      
  256a  EDA90000       STD 0x0,Y                         
  256e  ECA90008       LDD 0x8,Y                         
  2572  830003         SUBD #0x3                         
  2575  EDA90008       STD 0x8,Y                         
  2579  E3890014       ADDD 0x14,X                       
LAB_M76_r4_0c000__257d:
  257d  10830000       CMPD #0x0                         
  2581  2E03           BGT 0x2586                        
  2583  CC0001         LDD #0x1                          
LAB_M76_r4_0c000__2586:
  2586  10AE890002     LDY 0x2,X                         
  258b  AD9FFD2E       JSR [0xfd2e]                      
  258f  10AE64         LDY 0x4,S                         
  2592  170002         LBSR 0x2597                       
  2595  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2597
FUN_M76_r4_0c000__2597:
  2597  3436           PSHS  Y X B A                     
  2599  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2C96(rel)
  259d  06F9           dw 6F9h                           
LAB_M76_r4_0c000__259f:
  259f  1F01           TFR D,X                           
  25a1  7D70F9         TST 0x70f9                        
  25a4  260E           BNE 0x25b4                        
  25a6  E6A90005       LDB 0x5,Y                         
  25aa  C1FF           CMPB #0xff                        
  25ac  2606           BNE 0x25b4                        
  25ae  108E701E       LDY #0x701e                       
  25b2  2004           BRA 0x25b8                        
LAB_M76_r4_0c000__25b4:
  25b4  108E7000       LDY #0x7000                       
LAB_M76_r4_0c000__25b8:
  25b8  170291         LBSR 0x284c                       
  25bb  58             LSLB                              
  25bc  4F             CLRA                              
  25bd  EC8B           LDD D,X                           
  25bf  3606           PSHU  B A                         
  25c1  3606           PSHU  B A                         
  25c3  108E703C       LDY #0x703c                       
  25c7  170282         LBSR 0x284c                       
  25ca  50             NEGB                              
  25cb  CB64           ADDB #0x64                        
  25cd  58             LSLB                              
  25ce  4F             CLRA                              
  25cf  10AE64         LDY 0x4,S                         
  25d2  EDA90006       STD 0x6,Y                         
  25d6  CC0000         LDD #0x0                          
  25d9  EDA90014       STD 0x14,Y                        
  25dd  EDA9000A       STD 0xa,Y                         
  25e1  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2E2A(rel)
  25e5  0845           dw 845h                           
LAB_M76_r4_0c000__25e7:
  25e7  1F01           TFR D,X                           
  25e9  ECA90006       LDD 0x6,Y                         
  25ed  EC8B           LDD D,X                           
  25ef  3606           PSHU  B A                         
  25f1  AD9FFCF2       JSR [0xfcf2]                      
  25f5  3706           PULU  A B                         
  25f7  EDA9000C       STD 0xc,Y                         
  25fb  EDA90012       STD 0x12,Y                        
  25ff  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2EF4(rel)
  2603  08F1           dw 8F1h                           
LAB_M76_r4_0c000__2605:
  2605  1F01           TFR D,X                           
  2607  ECA90006       LDD 0x6,Y                         
  260b  EC8B           LDD D,X                           
  260d  3606           PSHU  B A                         
  260f  AD9FFCF2       JSR [0xfcf2]                      
  2613  3706           PULU  A B                         
  2615  EDA9000E       STD 0xe,Y                         
  2619  EDA90010       STD 0x10,Y                        
  261d  ECA90000       LDD 0x0,Y                         
  2621  3606           PSHU  B A                         
  2623  3606           PSHU  B A                         
  2625  3606           PSHU  B A                         
  2627  3606           PSHU  B A                         
  2629  3606           PSHU  B A                         
  262b  AE62           LDX 0x2,S                         
  262d  10AE64         LDY 0x4,S                         
  2630  30890004       LEAX 0x4,X                        
  2634  31A90016       LEAY 0x16,Y                       
  2638  3420           PSHS  Y                           
  263a  10AE66         LDY 0x6,S                         
  263d  31A9000A       LEAY 0xa,Y                        
  2641  C605           LDB #0x5                          
  2643  3404           PSHS  B                           
LAB_M76_r4_0c000__2645:
  2645  ECA1           LDD ,Y++                          
  2647  A3A4           SUBD ,Y                           
  2649  3606           PSHU  B A                         
  264b  AD9FFCF2       JSR [0xfcf2]                      
  264f  3706           PULU  A B                         
  2651  E3A4           ADDD ,Y                           
  2653  3420           PSHS  Y                           
  2655  10AE63         LDY 0x3,S                         
  2658  EDA1           STD ,Y++                          
  265a  10AF63         STY 0x3,S                         
  265d  10AE81         LDY ,X++                          
  2660  AD9FFD2E       JSR [0xfd2e]                      
  2664  3520           PULS  Y                           
  2666  6AE4           DEC ,S                            
  2668  26DB           BNE 0x2645                        
  266a  3263           LEAS 0x3,S                        
  266c  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__266e
FUN_M76_r4_0c000__266e:
  266e  3436           PSHS  Y X B A                     
  2670  1F98           TFR B,A                           
  2672  5F             CLRB                              
  2673  F370EE         ADDD 0x70ee                       
  2676  2C0D           BGE 0x2685                        
  2678  7D70EE         TST 0x70ee                        
  267b  2B05           BMI 0x2682                        
  267d  CC7F00         LDD #0x7f00                       
  2680  2003           BRA 0x2685                        
LAB_M76_r4_0c000__2682:
  2682  CC0000         LDD #0x0                          
LAB_M76_r4_0c000__2685:
  2685  FD722E         STD 0x722e                        
  2688  EDA90002       STD 0x2,Y                         
  268c  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__268e
FUN_M76_r4_0c000__268e:
  268e  3436           PSHS  Y X B A                     
  2690  E6A90020       LDB 0x20,Y                        
  2694  3404           PSHS  B                           
  2696  57             ASRB                              
  2697  EBE0           ADDB ,S+                          
  2699  CB19           ADDB #0x19                        
  269b  4F             CLRA                              
  269c  FD707C         STD 0x707c                        
  269f  108E7078       LDY #0x7078                       
  26a3  1701A6         LBSR 0x284c                       
  26a6  17021B         LBSR 0x28c4                       
  26a9  10AE890000     LDY 0x0,X                         
  26ae  AD9FFD2E       JSR [0xfd2e]                      
  26b2  108E0000       LDY #0x0                          
  26b6  AD9FFD2E       JSR [0xfd2e]                      
  26ba  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__26bc
FUN_M76_r4_0c000__26bc:
  26bc  3436           PSHS  Y X B A                     
  26be  CC0000         LDD #0x0                          
  26c1  10B3713E       CMPD 0x713e                       
  26c5  2626           BNE 0x26ed                        
  26c7  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2BCC(rel)
  26cb  0501           dw 501h                           
LAB_M76_r4_0c000__26cd:
  26cd  1F01           TFR D,X                           
  26cf  108E705A       LDY #0x705a                       
  26d3  170176         LBSR 0x284c                       
  26d6  50             NEGB                              
  26d7  CB65           ADDB #0x65                        
  26d9  10AE64         LDY 0x4,S                         
  26dc  E7A90020       STB 0x20,Y                        
  26e0  58             LSLB                              
  26e1  4F             CLRA                              
  26e2  EC8B           LDD D,X                           
  26e4  10830000       CMPD #0x0                         
  26e8  2603           BNE 0x26ed                        
  26ea  CC0001         LDD #0x1                          
LAB_M76_r4_0c000__26ed:
  26ed  AE62           LDX 0x2,S                         
  26ef  10AE890012     LDY 0x12,X                        
  26f4  AD9FFD2E       JSR [0xfd2e]                      
  26f8  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__26fa
FUN_M76_r4_0c000__26fa:
  26fa  3436           PSHS  Y X B A                     
  26fc  C600           LDB #0x0                          
LAB_M76_r4_0c000__26fe:
  26fe  1701E4         LBSR 0x28e5                       
  2701  17FFB8         LBSR 0x26bc                       
  2704  B6713F         LDA 0x713f                        
  2707  8101           CMPA #0x1                         
  2709  270E           BEQ 0x2719                        
  270b  8102           CMPA #0x2                         
  270d  2603           BNE 0x2712                        
  270f  17FF7C         LBSR 0x268e                       
LAB_M76_r4_0c000__2712:
  2712  5C             INCB                              
  2713  C106           CMPB #0x6                         
  2715  26E7           BNE 0x26fe                        
  2717  35B6           PULS  A B X Y PC                  
LAB_M76_r4_0c000__2719:
  2719  170002         LBSR 0x271e                       
  271c  20F4           BRA 0x2712                        

; ---- function FUN_M76_r4_0c000__271e
FUN_M76_r4_0c000__271e:
  271e  3436           PSHS  Y X B A                     
  2720  CC0000         LDD #0x0                          
  2723  10AE890000     LDY 0x0,X                         
  2728  AD9FFD2E       JSR [0xfd2e]                      
  272c  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__272e
FUN_M76_r4_0c000__272e:
  272e  3436           PSHS  Y X B A                     
  2730  FC7104         LDD 0x7104                        
  2733  17FA81         LBSR 0x21b7                       
  2736  3606           PSHU  B A                         
  2738  1702BF         LBSR 0x29fa                       
  273b  3706           PULU  A B                         
  273d  108E0002       LDY #0x2                          
  2741  AD9FFD2E       JSR [0xfd2e]                      
  2745  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2747
FUN_M76_r4_0c000__2747:
  2747  3436           PSHS  Y X B A                     
  2749  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2B02(rel)
  274d  03B5           dw 3B5h                           
LAB_M76_r4_0c000__274f:
  274f  1F02           TFR D,Y                           
  2751  FC710A         LDD 0x710a                        
  2754  59             ROLB                              
  2755  49             ROLA                              
  2756  ECAB           LDD D,Y                           
  2758  108E0001       LDY #0x1                          
  275c  AD9FFD2E       JSR [0xfd2e]                      
  2760  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2762
FUN_M76_r4_0c000__2762:
  2762  3436           PSHS  Y X B A                     
  2764  170020         LBSR 0x2787                       
  2767  17003A         LBSR 0x27a4                       
  276a  170054         LBSR 0x27c1                       
  276d  17006E         LBSR 0x27de                       
  2770  17FF87         LBSR 0x26fa                       
  2773  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__2775
FUN_M76_r4_0c000__2775:
  2775  8602           LDA #0x2                          
  2777  B1713F         CMPA 0x713f                       
  277a  2705           BEQ 0x2781                        
  277c  CC0064         LDD #0x64                         
  277f  2003           BRA 0x2784                        
LAB_M76_r4_0c000__2781:
  2781  CC000A         LDD #0xa                          
LAB_M76_r4_0c000__2784:
  2784  3606           PSHU  B A                         
  2786  39             RTS                               

; ---- function FUN_M76_r4_0c000__2787
FUN_M76_r4_0c000__2787:
  2787  3436           PSHS  Y X B A                     
  2789  FC7110         LDD 0x7110                        
  278c  3606           PSHU  B A                         
  278e  17FFE4         LBSR 0x2775                       
  2791  AD9FFCEC       JSR [0xfcec]                      
  2795  3706           PULU  A B                         
  2797  17FA1D         LBSR 0x21b7                       
  279a  108E0003       LDY #0x3                          
  279e  AD9FFD2E       JSR [0xfd2e]                      
  27a2  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__27a4
FUN_M76_r4_0c000__27a4:
  27a4  3436           PSHS  Y X B A                     
  27a6  FC7116         LDD 0x7116                        
  27a9  3606           PSHU  B A                         
  27ab  17FFC7         LBSR 0x2775                       
  27ae  AD9FFCEC       JSR [0xfcec]                      
  27b2  3706           PULU  A B                         
  27b4  17FA00         LBSR 0x21b7                       
  27b7  108E0004       LDY #0x4                          
  27bb  AD9FFD2E       JSR [0xfd2e]                      
  27bf  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__27c1
FUN_M76_r4_0c000__27c1:
  27c1  3436           PSHS  Y X B A                     
  27c3  FC711C         LDD 0x711c                        
  27c6  3606           PSHU  B A                         
  27c8  17FFAA         LBSR 0x2775                       
  27cb  AD9FFCEC       JSR [0xfcec]                      
  27cf  3706           PULU  A B                         
  27d1  17F9E3         LBSR 0x21b7                       
  27d4  108E0005       LDY #0x5                          
  27d8  AD9FFD2E       JSR [0xfd2e]                      
  27dc  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__27de
FUN_M76_r4_0c000__27de:
  27de  3436           PSHS  Y X B A                     
  27e0  FC7122         LDD 0x7122                        
  27e3  3606           PSHU  B A                         
  27e5  CC0064         LDD #0x64                         
  27e8  3606           PSHU  B A                         
  27ea  AD9FFCEC       JSR [0xfcec]                      
  27ee  3706           PULU  A B                         
  27f0  17F9C4         LBSR 0x21b7                       
  27f3  108E0007       LDY #0x7                          
  27f7  AD9FFD2E       JSR [0xfd2e]                      
  27fb  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__27fd
FUN_M76_r4_0c000__27fd:
  27fd  3436           PSHS  Y X B A                     
  27ff  FC7142         LDD 0x7142                        
  2802  8664           LDA #0x64                         
  2804  3D             MUL                               
  2805  17F9AF         LBSR 0x21b7                       
  2808  108E000D       LDY #0xd                          
  280c  AD9FFD2E       JSR [0xfd2e]                      
  2810  FC714A         LDD 0x714a                        
  2813  860A           LDA #0xa                          
  2815  3D             MUL                               
  2816  3406           PSHS  B A                         
  2818  108E0009       LDY #0x9                          
  281c  AD9FFD2E       JSR [0xfd2e]                      
  2820  CC0000         LDD #0x0                          
  2823  A3E1           SUBD ,S++                         
  2825  108E000A       LDY #0xa                          
  2829  AD9FFD2E       JSR [0xfd2e]                      
  282d  CC0064         LDD #0x64                         
  2830  108E000C       LDY #0xc                          
  2834  AD9FFD2E       JSR [0xfd2e]                      
  2838  3406           PSHS  B A                         
  283a  FC7146         LDD 0x7146                        
  283d  868C           LDA #0x8c                         
  283f  3D             MUL                               
  2840  E3E1           ADDD ,S++                         
  2842  108E000B       LDY #0xb                          
  2846  AD9FFD2E       JSR [0xfd2e]                      
  284a  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__284c
FUN_M76_r4_0c000__284c:
  284c  3432           PSHS  Y X A                       
  284e  10BE74D0       LDY 0x74d0                        
  2852  E6A90021       LDB 0x21,Y                        
  2856  58             LSLB                              
  2857  10AE63         LDY 0x3,S                         
  285a  A6A9001C       LDA 0x1c,Y                        
  285e  C07F           SUBB #0x7f                        
  2860  17003E         LBSR 0x28a1                       
  2863  1F89           TFR A,B                           
  2865  1D             SEX                               
  2866  58             LSLB                              
  2867  49             ROLA                              
  2868  58             LSLB                              
  2869  49             ROLA                              
  286a  3406           PSHS  B A                         
  286c  A6A90012       LDA 0x12,Y                        
  2870  10BE74D0       LDY 0x74d0                        
  2874  E6A90002       LDB 0x2,Y                         
  2878  10AE65         LDY 0x5,S                         
  287b  58             LSLB                              
  287c  C07F           SUBB #0x7f                        
  287e  170020         LBSR 0x28a1                       
  2881  1F89           TFR A,B                           
  2883  1D             SEX                               
  2884  58             LSLB                              
  2885  49             ROLA                              
  2886  58             LSLB                              
  2887  49             ROLA                              
  2888  E3E1           ADDD ,S++                         
  288a  E3A90004       ADDD 0x4,Y                        
  288e  4D             TSTA                              
  288f  2B0B           BMI 0x289c                        
  2891  10830064       CMPD #0x64                        
  2895  2F08           BLE 0x289f                        
  2897  CC0064         LDD #0x64                         
  289a  2003           BRA 0x289f                        
LAB_M76_r4_0c000__289c:
  289c  CC0000         LDD #0x0                          
LAB_M76_r4_0c000__289f:
  289f  35B2           PULS  A X Y PC                    

; ---- function FUN_M76_r4_0c000__28a1
FUN_M76_r4_0c000__28a1:
  28a1  3406           PSHS  B A                         
  28a3  4D             TSTA                              
  28a4  2A01           BPL 0x28a7                        
  28a6  40             NEGA                              
LAB_M76_r4_0c000__28a7:
  28a7  5D             TSTB                              
  28a8  2A01           BPL 0x28ab                        
  28aa  50             NEGB                              
LAB_M76_r4_0c000__28ab:
  28ab  3D             MUL                               
  28ac  6DE4           TST ,S                            
  28ae  2B06           BMI 0x28b6                        
  28b0  6D61           TST 0x1,S                         
  28b2  2B06           BMI 0x28ba                        
  28b4  200B           BRA 0x28c1                        
LAB_M76_r4_0c000__28b6:
  28b6  6D61           TST 0x1,S                         
  28b8  2B07           BMI 0x28c1                        
LAB_M76_r4_0c000__28ba:
  28ba  3406           PSHS  B A                         
  28bc  CC0000         LDD #0x0                          
  28bf  A3E1           SUBD ,S++                         
LAB_M76_r4_0c000__28c1:
  28c1  3262           LEAS 0x2,S                        
  28c3  39             RTS                               

; ---- function FUN_M76_r4_0c000__28c4
FUN_M76_r4_0c000__28c4:
  28c4  3430           PSHS  Y X                         
  28c6  10BE74D2       LDY 0x74d2                        
  28ca  50             NEGB                              
  28cb  CB64           ADDB #0x64                        
  28cd  4F             CLRA                              
  28ce  58             LSLB                              
  28cf  31AB           LEAY D,Y                          
  28d1  CC0000         LDD #0x0                          
  28d4  A3A4           SUBD ,Y                           
  28d6  35B0           PULS  X Y PC                      

; ---- function FUN_M76_r4_0c000__28d8
FUN_M76_r4_0c000__28d8:
  28d8  3436           PSHS  Y X B A                     
  28da  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2B02(rel)
  28de  0224           dw 224h                           
LAB_M76_r4_0c000__28e0:
  28e0  FD74D2         STD 0x74d2                        
  28e3  35B6           PULS  A B X Y PC                  

; ---- function FUN_M76_r4_0c000__28e5
FUN_M76_r4_0c000__28e5:
  28e5  3406           PSHS  B A                         
  28e7  8622           LDA #0x22                         
  28e9  3D             MUL                               
  28ea  1F01           TFR D,X                           
  28ec  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$2906(rel)
  28f0  0016           dw 16h                            
LAB_M76_r4_0c000__28f2:
  28f2  308B           LEAX D,X                          
  28f4  BF74CE         STX 0x74ce                        
  28f7  CC7400         LDD #0x7400                       
  28fa  E3890010       ADDD 0x10,X                       
  28fe  1F02           TFR D,Y                           
  2900  10BF74D0       STY 0x74d0                        
  2904  3586           PULS  A B PC                      
DAT_M76_r4_0c000__2906:
  2906  00             ?? 00h                            
  2907  .db 0E 00 0F 00 10 00 11 00 12 00 13 00 14 00 15 00  ; ................
  2917  .db 00 00 16 00 00 00 B7 70 D2 71 4E 00 B8 70 D4 71  ; .......p.qN..p.q
  2927  .db 52 00 17 00 18 00 19 00 1A 00 1B 00 1C 00 1D 00  ; R...............
  2937  .db 1E 00 22 00 1F 00 00 00 B9 70 D6 71 56 00 BA 70  ; .."......p.qV..p
  2947  .db D8 71 5A 00 20 00 21 00 22 00 23 00 24 00 25 00  ; .qZ. .!.".#.$.%.
  2957  .db 26 00 27 00 44 00 28 00 00 00 BB 70 DA 71 5E 00  ; &.'.D.(....p.q^.
  2967  .db BC 70 DC 71 62 00 29 00 2A 00 2B 00 2C 00 2D 00  ; .p.qb.).*.+.,.-.
  2977  .db 2E 00 2F 00 30 00 66 00 31 00 00 00 BD 70 DE 71  ; ../.0.f.1....p.q
  2987  .db 66 00 BE 70 E0 71 6A 00 32 00 33 00 34 00 35 00  ; f..p.qj.2.3.4.5.
  2997  .db 36 00 37 00 38 00 39 00 88 00 3A 00 00 00 BF 70  ; 6.7.8.9...:....p
  29a7  .db E2 71 6E 00 C0 70 E4 71 72 00 3B 00 3C 00 3D 00  ; .qn..p.qr.;.<.=.
  29b7  .db 3E 00 3F 00 40 00 41 00 42 00 AA 00 43 00 00 00  ; >.?.@.A.B...C...
  29c7  .db C1 70 E6 71 76 00 C2 70 E8 71 7A                 ; .p.qv..p.qz

; ---- function FUN_M76_r4_0c000__29d2
FUN_M76_r4_0c000__29d2:
  29d2  AD9FFE20       JSR [0xfe20]                       ; inline[API_FE20]: interp table, 17 points
  29d6  04             db 4h                             
  29d7  54454F8A4B13.. dw[17]                            
LAB_M76_r4_0c000__29f9:
  29f9  39             RTS                               

; ---- function FUN_M76_r4_0c000__29fa
FUN_M76_r4_0c000__29fa:
  29fa  AD9FFE20       JSR [0xfe20]                       ; inline[API_FE20]: interp table, 129 points
  29fe  07             db 7h                             
  29ff  00800085008B.. dw[129]                           
LAB_M76_r4_0c000__2b01:
  2b01  39             RTS                               
DAT_M76_r4_0c000__2b02:
  2b02  80             ?? 80h                            
  2b03  .db 01 81 49 82 91 83 D9 85 20 86 68 87 B0 88 F7 8A  ; ..I..... .h.....
  2b13  .db 3F 8B 87 8C CE 8E 16 8F 5E 90 A5 91 ED 93 35 94  ; ?.......^.....5.
  2b23  .db 7C 95 C4 97 0C 98 53 99 9B 9A E3 9C 2A 9D 72 9E  ; |.....S.....*.r.
  2b33  .db BA A0 01 A1 49 A2 91 A3 D8 A5 20 A6 68 A7 AF A8  ; ....I..... .h...
  2b43  .db F7 AA 3F AB 86 AC CE AE 16 AF 5D B0 A5 B1 ED B3  ; ..?.......].....
  2b53  .db 34 B4 7C B5 C4 B7 0B B8 53 B9 9B BA E2 BC 2A BD  ; 4.|.....S.....*.
  2b63  .db 72 BE B9 C0 01 C1 49 C2 90 C3 D8 C5 20 C6 67 C7  ; r.....I..... .g.
  2b73  .db AF C8 F7 CA 3E CB 86 CC CE CE 15 CF 5D D0 A5 D1  ; ....>.......]...
  2b83  .db EC D3 34 D4 7C D5 C3 D7 0B D8 53 D9 9A DA E2 DC  ; ..4.|.....S.....
  2b93  .db 2A DD 71 DE B9 E0 01 E1 48 E2 90 E3 D8 E5 1F E6  ; *.q.....H.......
  2ba3  .db 67 E7 AF E8 F6 EA 3E EB 86 EC CD EE 15 EF 5D F0  ; g.....>.......].
  2bb3  .db A4 F1 EC F3 34 F4 7B F5 C3 F7 0B F8 52 F9 9A FA  ; ....4.{.....R...
  2bc3  .db E2 FC 29 FD 71 FE B9 00 00                       ; ..).q....
DAT_M76_r4_0c000__2bcc:
  2bcc  00             ?? 00h                            
  2bcd  .db 01 00 01 00 01 00 01 00 01 00 01 00 02 00 02 00  ; ................
  2bdd  .db 02 00 02 00 03 00 03 00 04 00 04 00 05 00 05 00  ; ................
  2bed  .db 06 00 07 00 08 00 08 00 0A 00 0B 00 0C 00 0E 00  ; ................
  2bfd  .db 10 00 11 00 14 00 16 00 19 00 1C 00 20 00 23 00  ; ............ .#.
  2c0d  .db 28 00 2D 00 32 00 39 00 40 00 47 00 50 00 5A 00  ; (.-.2.9.@.G.P.Z.
  2c1d  .db 65 00 72 00 80 00 8F 00 A1 00 B5 00 CB 00 E4 01  ; e.r.............
  2c2d  .db 00 01 1F 01 42 01 6A 01 96 01 C8 02 00 02 3E 02  ; ....B.j.......>.
  2c3d  .db 85 02 D4 03 2C 03 90 04 00 04 7D 05 0A 05 A8 06  ; ....,.....}.....
  2c4d  .db 59 07 20 08 00 08 FA 0A 14 0B 50 0C B2 0E 41 10  ; Y. .......P...A.
  2c5d  .db 00 11 F5 14 28 16 A0 19 65 1C 82 20 00 23 EB 28  ; ....(...e.. .#.(
  2c6d  .db 51 2D 41 32 CB 39 04 40 00 47 D6 50 A2 5A 82 65  ; Q-A2.9.@.G.P.Z.e
  2c7d  .db 97 72 08 7F FF 7F FF 7F FF 7F FF 7F FF 7F FF 7F  ; .r..............
  2c8d  .db FF 7F FF 7F FF 7F FF 7F FF                       ; .........
DAT_M76_r4_0c000__2c96:
  2c96  00             ?? 00h                            
  2c97  .db 01 00 01 00 01 00 01 00 01 00 01 00 01 00 01 00  ; ................
  2ca7  .db 01 00 01 00 01 0D F8 1A 69 25 7E 2F 5E 38 2A 40  ; ........i%~/^8*@
  2cb7  .db 00 46 FC 4D 35 52 BF 57 AF 5C 15 60 00 63 7E 66  ; .F.M5R.W.\.`.c~f
  2cc7  .db 9B 69 60 6B D8 6E 0B 70 00 71 BF 73 4E 74 B0 75  ; .i`k.n.p.q.sNt.u
  2cd7  .db EC 77 06 78 00 78 E0 79 A7 7A 58 7A F6 7B 83 7C  ; .w.x.x.y.zXz.{.|
  2ce7  .db 00 7C 70 7C D4 7D 2C 7D 7B 7D C2 7E 00 7E 38 7E  ; .|p|.},}{}.~.~8~
  2cf7  .db 6A 7E 96 7E BE 7E E1 7F 00 7F 1C 7F 35 7F 4B 7F  ; j~.~.~......5.K.
  2d07  .db 5F 7F 71 7F 80 7F 8E 7F 9B 7F A6 7F B0 7F B9 7F  ; _.q.............
  2d17  .db C0 7F C7 7F CE 7F D3 7F D8 7F DD 7F E0 7F E4 7F  ; ................
  2d27  .db E7 7F EA 7F EC 7F EF 7F F0 7F F2 7F F4 7F F5 7F  ; ................
  2d37  .db F6 7F F8 7F F8 7F F9 7F FA 7F FB 7F FB 7F FC 7F  ; ................
  2d47  .db FC 7F FD 7F FD 7F FE 7F FE 7F FE 7F FE 7F FF 7F  ; ................
  2d57  .db FF 7F FF 7F FF 7F FF 7F FF 7F FF 79 E6 74 5C 6F  ; ...........y.t\o
  2d67  .db 4D 6A A9 66 65 62 75 5E CF 5B 6C 58 45 55 54 52  ; Mj.febu^.[lXEUTR
  2d77  .db 94 4F FF 4D 92 4B 4A 49 24 47 1B 45 2F 43 5D 41  ; .O.M.KJI$G.E/C]A
  2d87  .db A3 3F FF 3E 6F 3C F3 3B 88 3A 2E 38 E3 37 A6 36  ; .?.>o<.;.:.8.7.6
  2d97  .db 77 35 54 34 3E 33 32 32 31 31 3A 30 4C 2F 67 2E  ; w5T4>32211:0L/g.
  2da7  .db 8B 2D B6 2C E9 2C 22 2B 63 2A AA 29 F7 29 4A 28  ; .-.,.,"+c*.).)J(
  2db7  .db A2 27 FF 27 62 26 C9 26 35 25 A5 25 19 24 92 24  ; .'.'b&.&5%.%.$.$
  2dc7  .db 0E 23 8D 23 11 22 97 22 21 21 AE 21 3E 20 D1 20  ; .#.#."."!!.!> . 
  2dd7  .db 67 1F FF 1F 9A 1F 37 1E D7 1E 79 1E 1D 1D C4 1D  ; g.....7...y.....
  2de7  .db 6C 1D 17 1C C3 1C 71 1C 21 1B D3 1B 86 1B 3B 1A  ; l.....q.!.....;.
  2df7  .db F2 1A AA 1A 64 1A 1F 19 DB 19 99 19 58 19 18 18  ; ....d.......X...
  2e07  .db DA 18 9D 18 61 18 26 17 EC 17 B3 17 7C 17 45 17  ; ....a.&.....|.E.
  2e17  .db 0F 16 DB 16 A7 16 74 16 42 16 11 15 E1 15 B1 15  ; ......t.B.......
  2e27  .db 83 15 55                                         ; ..U
DAT_M76_r4_0c000__2e2a:
  2e2a  00             ?? 00h                            
  2e2b  .db 00 01 44 02 83 03 BA 04 EC 06 18 07 3F 08 60 09  ; ..D.........?.`.
  2e3b  .db 7B 0A 92 0B A3 0C AF 0D B7 0E BA 0F B8 10 B2 11  ; {...............
  2e4b  .db A8 12 99 13 87 14 70 15 55 16 37 17 15 17 EF 18  ; ......p.U.7.....
  2e5b  .db C6 19 9A 1A 6A 1B 36 1C 00 1C C6 1D 8A 1E 4A 1F  ; ....j.6.......J.
  2e6b  .db 08 1F C2 20 7A 21 2F 21 E2 22 92 23 3F 23 EA 24  ; ... z!/!.".#?#.$
  2e7b  .db 92 25 38 25 DC 26 7D 27 1C 27 B9 28 54 28 ED 29  ; .%8%.&}'.'.(T(.)
  2e8b  .db 83 2A 18 2A AB 2B 3B 2B CA 2C 57 2C E2 2D 6B 2D  ; .*.*.+;+.,W,.-k-
  2e9b  .db F3 2E 79 2E FD 2F 7F 30 00 30 7F 30 FD 31 79 31  ; ..y../.0.0.0.1y1
  2eab  .db F4 32 6D 32 E4 33 5A 33 CF 34 43 34 B5 35 25 35  ; .2m2.3Z3.4C4.5%5
  2ebb  .db 95 36 03 36 70 36 DB 37 46 37 AF 38 17 38 7E 38  ; .6.6p6.7F7.8.8~8
  2ecb  .db E4 39 48 39 AC 3A 0E 3A 6F 3A D0 3B 2F 3B 8D 3B  ; .9H9.:.:o:.;/;.;
  2edb  .db EA 3C 46 3C A2 3C FC 3D 55 3D AE 3E 05 3E 5C 3E  ; .<F<.<.=U=.>.>\>
  2eeb  .db B2 3F 06 3F 5B 3F AE 40 00                       ; .?.?[?.@.
DAT_M76_r4_0c000__2ef4:
  2ef4  7F             ?? 7Fh                           
  2ef5  .db FF 7E BC 7D 7D 7C 46 7B 14 79 E8 78 C1 77 A0 76  ; .~.}}|F{.y.x.w.v
  2f05  .db 85 75 6E 74 5D 73 51 72 49 71 46 70 48 6F 4E 6E  ; .unt]sQrIqFpHoNn
  2f15  .db 58 6D 67 6C 79 6B 90 6A AB 69 C9 68 EB 68 11 67  ; Xmglyk.j.i.h.h.g
  2f25  .db 3A 66 66 65 96 64 CA 64 00 63 3A 62 76 61 B6 60  ; :ffe.d.d.c:bva.`
  2f35  .db F8 60 3E 5F 86 5E D1 5E 1E 5D 6E 5C C1 5C 16 5B  ; .`>_.^.^.]n\.\.[
  2f45  .db 6E 5A C8 5A 24 59 83 58 E4 58 47 57 AC 57 13 56  ; nZ.Z$Y.X.XGW.W.V
  2f55  .db 7D 55 E8 55 55 54 C5 54 36 53 A9 53 1E 52 95 52  ; }U.UUT.T6S.S.R.R
  2f65  .db 0D 51 87 51 03 50 81 50 00 4F 81 4F 03 4E 87 4E  ; .Q.Q.P.P.O.O.N.N
  2f75  .db 0C 4D 93 4D 1C 4C A6 4C 31 4B BD 4B 4B 4A DB 4A  ; .M.M.L.L1K.KKJ.J
  2f85  .db 6B 49 FD 49 90 49 25 48 BA 48 51 47 E9 47 82 47  ; kI.I.I%H.HQG.G.G
  2f95  .db 1C 46 B8 46 54 45 F2 45 91 45 30 44 D1 44 73 44  ; .F.FTE.E.E0D.DsD
  2fa5  .db 16 43 BA 43 5E 43 04 42 AB 42 52 41 FB 41 A4 41  ; .C.C^C.B.BRA.A.A
  2fb5  .db 4E 40 FA 40 A5 40 52 40 00                       ; N@.@.@R@.

;; TMS32010 program 76 for DSP 1: 695 words loaded at $800 (written via bank latch $81)
DSPPROG_76_DSP1_hdr:
  2fbe  761005780000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_76_DSP1:
  2fc6  08007F8B6E00.. dw[696]                           

;; TMS32010 program 76 for DSP 2: 668 words loaded at $800 (written via bank latch $82)
DSPPROG_76_DSP2_hdr:
  3536  761105420000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_76_DSP2:
  353e  08007F8B6E00.. dw[669]                           

;; TMS32010 program 76 for DSP 3: 647 words loaded at $800 (written via bank latch $83)
DSPPROG_76_DSP3_hdr:
  3a78  761205180000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_76_DSP3:
  3a80  08007F8B6E00.. dw[648]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3f90  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3f98  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa8  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb8  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc8  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd8  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe8  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff8  .db FF FF FF FF FF FF FF 89                          ; ........
