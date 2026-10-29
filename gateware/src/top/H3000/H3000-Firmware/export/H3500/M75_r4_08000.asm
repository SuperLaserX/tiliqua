; H3500  block M75_r4_08000  M75_r4_08000::0000-M75_r4_08000::3fff
; Bank r4_08000 (module id 75, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 75 parameter/preset table "BAND DELAY", 234 bytes
MODULE_75_TABLE_BAND_DELAY_hdr:
  0008  750000F20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_75_TABLE_BAND_DELAY:
  0010  75             ?? 75h    u                       
  0011  .db 01                                               ; .
  0012  42414E442044.. ds "BAND DELAY     "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 03 E7 00 00 00 64 00 1E 00  ; ............d...
  0054  .db 00 03 E7 07 D0 FF 9C 03 25 00 00 03 E7 0F A0 00  ; ........%.......
  0064  .db 64 06 2A 00 00 03 E7 17 70 FF 9C 09 31 00 00 03  ; d.*.....p...1...
  0074  .db E7 1F 40 00 64 0D 36 00 00 03 E7 27 10 FF 9C 10  ; ..@.d.6....'....
  0084  .db 3D 00 00 03 E7 2E E0 00 64 13 42 00 00 03 E7 36  ; =.......d.B....6
  0094  .db B0 FF 9C 16 49 27 10 00 00 00 00 00 00 13 88 00  ; ....I'..........
  00a4  .db 00 00 64 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ..d.............
  00b4  .db 00 00 00 64 00 64 00 00 00 00 00 32 00           ; ...d.d.....2.
  00c1  64206B6E6F62.. ds "d knob 1  knob 2  knob 3  knob 4 "
  00e4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  00f4  .db 00 00 00 00 00 00                                ; ......

;; Module 75 code record 01, 13347 bytes, entered at payload start
MODULE_75_01_CODE_hdr:
  00fa  7501342B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_75_01_entry
MODULE_75_01_entry:
  0102  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0106
  0106  0106           dw 106h                           
LAB_M75_r4_08000__0108:
  0108  3477           PSHS  U Y X B A CC                
  010a  1700A4         LBSR 0x01b1                       
  010d  17007E         LBSR 0x018e                       
  0110  17007F         LBSR 0x0192                       
  0113  C600           LDB #0x0                          
  0115  AD9FFC58       JSR [0xfc58]                      
  0119  8603           LDA #0x3                          
  011b  B760DA         STA 0x60da                        
  011e  AD9FFE38       JSR [0xfe38]                      
  0122  B6600A         LDA 0x600a                        
  0125  8175           CMPA #0x75                        
  0127  2703           BEQ 0x012c                        
  0129  17002A         LBSR 0x0156                       
LAB_M75_r4_08000__012c:
  012c  17017C         LBSR 0x02ab                       
  012f  1702DB         LBSR 0x040d                       
  0132  B6600A         LDA 0x600a                        
  0135  8175           CMPA #0x75                        
  0137  2707           BEQ 0x0140                        
  0139  CC4E20         LDD #0x4e20                       
  013c  AD9FFD20       JSR [0xfd20]                      
LAB_M75_r4_08000__0140:
  0140  AD9FFE36       JSR [0xfe36]                      
  0144  AD9FFDF6       JSR [0xfdf6]                      
  0148  AD9FFE18       JSR [0xfe18]                      
  014c  1706A8         LBSR 0x07f7                       
  014f  AD9FFE10       JSR [0xfe10]                      
  0153  3577           PULS CC A B X Y U                 
  0155  39             RTS                               

; ---- function FUN_M75_r4_08000__0156
FUN_M75_r4_08000__0156:
  0156  3476           PSHS  U Y X B A                   
  0158  AD9FFED0       JSR [0xfed0]                      
  015c  AD9FFDFA       JSR [0xfdfa]                      
  0160  C601           LDB #0x1                          
  0162  8E7510         LDX #0x7510                       
  0165  AD9FFD30       JSR [0xfd30]                      
  0169  10260654       LBNE 0x07c1                       
  016d  C602           LDB #0x2                          
  016f  8E7511         LDX #0x7511                       
  0172  AD9FFD30       JSR [0xfd30]                      
  0176  10260647       LBNE 0x07c1                       
  017a  C603           LDB #0x3                          
  017c  8E7512         LDX #0x7512                       
  017f  AD9FFD30       JSR [0xfd30]                      
  0183  1026063A       LBNE 0x07c1                       
  0187  AD9FFD7C       JSR [0xfd7c]                      
  018b  3576           PULS  A B X Y U                   
  018d  39             RTS                               

; ---- function FUN_M75_r4_08000__018e
FUN_M75_r4_08000__018e:
  018e  3436           PSHS  Y X B A                     
  0190  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__0192
FUN_M75_r4_08000__0192:
  0192  3476           PSHS  U Y X B A                   
  0194  CC0000         LDD #0x0                          
  0197  AD9FFC6C       JSR [0xfc6c]                      
  019b  AD9FFC74       JSR [0xfc74]                      
  019f  1730F3         LBSR 0x3295                       
  01a2  17316B         LBSR 0x3310                       
  01a5  1731E3         LBSR 0x338b                       
  01a8  17325B         LBSR 0x3406                       
  01ab  17304D         LBSR 0x31fb                       
  01ae  3576           PULS  A B X Y U                   
  01b0  39             RTS                               

; ---- function FUN_M75_r4_08000__01b1
FUN_M75_r4_08000__01b1:
  01b1  3476           PSHS  U Y X B A                   
  01b3  8E7000         LDX #0x7000                       
  01b6  108E0400       LDY #0x400                        
  01ba  CC0000         LDD #0x0                          
LAB_M75_r4_08000__01bd:
  01bd  ED81           STD ,X++                          
  01bf  313E           LEAY -0x2,Y                       
  01c1  26FA           BNE 0x01bd                        
  01c3  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 41:5E 43:60 45:62 47:64
  01c7  41             db 41h                            
  01c8  5E             db 5Eh                            
  01c9  43             db 43h                            
  01ca  60             db 60h                            
  01cb  45             db 45h                            
  01cc  62             db 62h                            
  01cd  47             db 47h                            
  01ce  64             db 64h                            
  01cf  00             db 0h                             
LAB_M75_r4_08000__01d0:
  01d0  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 4B:6A 4D:6C 4F:6E 51:70
  01d4  4B             db 4Bh                            
  01d5  6A             db 6Ah                            
  01d6  4D             db 4Dh                            
  01d7  6C             db 6Ch                            
  01d8  4F             db 4Fh                            
  01d9  6E             db 6Eh                            
  01da  51             db 51h                            
  01db  70             db 70h                            
  01dc  00             db 0h                             
LAB_M75_r4_08000__01dd:
  01dd  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 55:76 57:78 59:7A 5B:7C
  01e1  55             db 55h                            
  01e2  76             db 76h                            
  01e3  57             db 57h                            
  01e4  78             db 78h                            
  01e5  59             db 59h                            
  01e6  7A             db 7Ah                            
  01e7  5B             db 5Bh                            
  01e8  7C             db 7Ch                            
  01e9  00             db 0h                             
LAB_M75_r4_08000__01ea:
  01ea  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 5F:82 61:84 63:86 65:88
  01ee  5F             db 5Fh                            
  01ef  82             db 82h                            
  01f0  61             db 61h                            
  01f1  84             db 84h                            
  01f2  63             db 63h                            
  01f3  86             db 86h                            
  01f4  65             db 65h                            
  01f5  88             db 88h                            
  01f6  00             db 0h                             
LAB_M75_r4_08000__01f7:
  01f7  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 69:8E 6B:90 6D:92 6F:94
  01fb  69             db 69h                            
  01fc  8E             db 8Eh                            
  01fd  6B             db 6Bh                            
  01fe  90             db 90h                            
  01ff  6D             db 6Dh                            
  0200  92             db 92h                            
  0201  6F             db 6Fh                            
  0202  94             db 94h                            
  0203  00             db 0h                             
LAB_M75_r4_08000__0204:
  0204  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 73:9A 75:9C 77:9E 79:A0
  0208  73             db 73h                            
  0209  9A             db 9Ah                            
  020a  75             db 75h                            
  020b  9C             db 9Ch                            
  020c  77             db 77h                            
  020d  9E             db 9Eh                            
  020e  79             db 79h                            
  020f  A0             db A0h                            
  0210  00             db 0h                             
LAB_M75_r4_08000__0211:
  0211  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 7D:A6 7F:A8 81:AA 83:AC
  0215  7D             db 7Dh                            
  0216  A6             db A6h                            
  0217  7F             db 7Fh                            
  0218  A8             db A8h                            
  0219  81             db 81h                            
  021a  AA             db AAh                            
  021b  83             db 83h                            
  021c  AC             db ACh                            
  021d  00             db 0h                             
LAB_M75_r4_08000__021e:
  021e  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 87:B2 89:B4 8B:B6 8D:B8
  0222  87             db 87h                            
  0223  B2             db B2h                            
  0224  89             db 89h                            
  0225  B4             db B4h                            
  0226  8B             db 8Bh                            
  0227  B6             db B6h                            
  0228  8D             db 8Dh                            
  0229  B8             db B8h                            
  022a  00             db 0h                             
LAB_M75_r4_08000__022b:
  022b  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 49:66 53:72 5D:7E 67:8A 71:96 7B:A2 85:AE 8F:BA
  022f  49             db 49h                            
  0230  66             db 66h                            
  0231  53             db 53h                            
  0232  72             db 72h                            
  0233  5D             db 5Dh                            
  0234  7E             db 7Eh                            
  0235  67             db 67h                            
  0236  8A             db 8Ah                            
  0237  71             db 71h                            
  0238  96             db 96h                            
  0239  7B             db 7Bh                            
  023a  A2             db A2h                            
  023b  85             db 85h                            
  023c  AE             db AEh                            
  023d  8F             db 8Fh                            
  023e  BA             db BAh                            
  023f  00             db 0h                             
LAB_M75_r4_08000__0240:
  0240  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 4A:68 54:74 5E:80 68:8C 72:98 7C:A4 86:B0 90:BC
  0244  4A             db 4Ah                            
  0245  68             db 68h                            
  0246  54             db 54h                            
  0247  74             db 74h                            
  0248  5E             db 5Eh                            
  0249  80             db 80h                            
  024a  68             db 68h                            
  024b  8C             db 8Ch                            
  024c  72             db 72h                            
  024d  98             db 98h                            
  024e  7C             db 7Ch                            
  024f  A4             db A4h                            
  0250  86             db 86h                            
  0251  B0             db B0h                            
  0252  90             db 90h                            
  0253  BC             db BCh                            
  0254  00             db 0h                             
LAB_M75_r4_08000__0255:
  0255  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 91:08 93:0E
  0259  91             db 91h                            
  025a  08             db 8h                             
  025b  93             db 93h                            
  025c  0E             db Eh                             
  025d  00             db 0h                             
LAB_M75_r4_08000__025e:
  025e  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 95:12 97:18
  0262  95             db 95h                            
  0263  12             db 12h                            
  0264  97             db 97h                            
  0265  18             db 18h                            
  0266  00             db 0h                             
LAB_M75_r4_08000__0267:
  0267  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 99:26 9B:2C
  026b  99             db 99h                            
  026c  26             db 26h                            
  026d  9B             db 9Bh                            
  026e  2C             db 2Ch                            
  026f  00             db 0h                             
LAB_M75_r4_08000__0270:
  0270  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9D:1C 9F:22
  0274  9D             db 9Dh                            
  0275  1C             db 1Ch                            
  0276  9F             db 9Fh                            
  0277  22             db 22h                            
  0278  00             db 0h                             
LAB_M75_r4_08000__0279:
  0279  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A1:30 A3:36
  027d  A1             db A1h                            
  027e  30             db 30h                            
  027f  A3             db A3h                            
  0280  36             db 36h                            
  0281  00             db 0h                             
LAB_M75_r4_08000__0282:
  0282  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A5:38 A7:3E
  0286  A5             db A5h                            
  0287  38             db 38h                            
  0288  A7             db A7h                            
  0289  3E             db 3Eh                            
  028a  00             db 0h                             
LAB_M75_r4_08000__028b:
  028b  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: AD:40
  028f  AD             db ADh                            
  0290  40             db 40h                            
  0291  00             db 0h                             
LAB_M75_r4_08000__0292:
  0292  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: B0:00 AE:06
  0296  B0             db B0h                            
  0297  00             db 0h                             
  0298  AE             db AEh                            
  0299  06             db 6h                             
  029a  00             db 0h                             
LAB_M75_r4_08000__029b:
  029b  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:46 1A:4C 1B:52 1C:58
  029f  19             db 19h                            
  02a0  46             db 46h                            
  02a1  1A             db 1Ah                            
  02a2  4C             db 4Ch                            
  02a3  1B             db 1Bh                            
  02a4  52             db 52h                            
  02a5  1C             db 1Ch                            
  02a6  58             db 58h                            
  02a7  00             db 0h                             
LAB_M75_r4_08000__02a8:
  02a8  3576           PULS  A B X Y U                   
  02aa  39             RTS                               

; ---- function FUN_M75_r4_08000__02ab
FUN_M75_r4_08000__02ab:
  02ab  3476           PSHS  U Y X B A                   
  02ad  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$1D5B(rel)
  02b1  1AAA           dw 1AAAh                          
LAB_M75_r4_08000__02b3:
  02b3  FD600F         STD 0x600f                        
  02b6  CC000A         LDD #0xa                          
  02b9  AD9FFD20       JSR [0xfd20]                      
  02bd  108E0032       LDY #0x32                         
  02c1  CC0000         LDD #0x0                          
  02c4  AD9FFD2E       JSR [0xfd2e]                      
  02c8  CC000A         LDD #0xa                          
  02cb  AD9FFD20       JSR [0xfd20]                      
  02cf  108E0033       LDY #0x33                         
  02d3  CC0000         LDD #0x0                          
  02d6  AD9FFD2E       JSR [0xfd2e]                      
  02da  8E27D8         LDX #0x27d8                       
  02dd  AD9FFE76       JSR [0xfe76]                      
  02e1  8E12EE         LDX #0x12ee                       
  02e4  AD9FFE76       JSR [0xfe76]                      
  02e8  8E2C3E         LDX #0x2c3e                       
  02eb  AD9FFE76       JSR [0xfe76]                      
  02ef  8E1D5F         LDX #0x1d5f                       
  02f2  AD9FFE76       JSR [0xfe76]                      
  02f6  8E216F         LDX #0x216f                       
  02f9  AD9FFE76       JSR [0xfe76]                      
  02fd  8E136F         LDX #0x136f                       
  0300  AD9FFE76       JSR [0xfe76]                      
  0304  8E2859         LDX #0x2859                       
  0307  AD9FFE76       JSR [0xfe76]                      
  030b  8E2CD2         LDX #0x2cd2                       
  030e  AD9FFE76       JSR [0xfe76]                      
  0312  8E1DE1         LDX #0x1de1                       
  0315  AD9FFE76       JSR [0xfe76]                      
  0319  8E21FA         LDX #0x21fa                       
  031c  AD9FFE76       JSR [0xfe76]                      
  0320  8E13F0         LDX #0x13f0                       
  0323  AD9FFE76       JSR [0xfe76]                      
  0327  8E28DA         LDX #0x28da                       
  032a  AD9FFE76       JSR [0xfe76]                      
  032e  8E2D66         LDX #0x2d66                       
  0331  AD9FFE76       JSR [0xfe76]                      
  0335  8E1E63         LDX #0x1e63                       
  0338  AD9FFE76       JSR [0xfe76]                      
  033c  8E2285         LDX #0x2285                       
  033f  AD9FFE76       JSR [0xfe76]                      
  0343  8E1471         LDX #0x1471                       
  0346  AD9FFE76       JSR [0xfe76]                      
  034a  8E295B         LDX #0x295b                       
  034d  AD9FFE76       JSR [0xfe76]                      
  0351  8E2DFA         LDX #0x2dfa                       
  0354  AD9FFE76       JSR [0xfe76]                      
  0358  8E1EE5         LDX #0x1ee5                       
  035b  AD9FFE76       JSR [0xfe76]                      
  035f  8E2310         LDX #0x2310                       
  0362  AD9FFE76       JSR [0xfe76]                      
  0366  8E14F2         LDX #0x14f2                       
  0369  AD9FFE76       JSR [0xfe76]                      
  036d  8E29DC         LDX #0x29dc                       
  0370  AD9FFE76       JSR [0xfe76]                      
  0374  8E2E8E         LDX #0x2e8e                       
  0377  AD9FFE76       JSR [0xfe76]                      
  037b  8E1F67         LDX #0x1f67                       
  037e  AD9FFE76       JSR [0xfe76]                      
  0382  8E239B         LDX #0x239b                       
  0385  AD9FFE76       JSR [0xfe76]                      
  0389  8E1573         LDX #0x1573                       
  038c  AD9FFE76       JSR [0xfe76]                      
  0390  8E2A5D         LDX #0x2a5d                       
  0393  AD9FFE76       JSR [0xfe76]                      
  0397  8E2F22         LDX #0x2f22                       
  039a  AD9FFE76       JSR [0xfe76]                      
  039e  8E1FE9         LDX #0x1fe9                       
  03a1  AD9FFE76       JSR [0xfe76]                      
  03a5  8E2426         LDX #0x2426                       
  03a8  AD9FFE76       JSR [0xfe76]                      
  03ac  8E15F4         LDX #0x15f4                       
  03af  AD9FFE76       JSR [0xfe76]                      
  03b3  8E2ADE         LDX #0x2ade                       
  03b6  AD9FFE76       JSR [0xfe76]                      
  03ba  8E2FB6         LDX #0x2fb6                       
  03bd  AD9FFE76       JSR [0xfe76]                      
  03c1  8E206B         LDX #0x206b                       
  03c4  AD9FFE76       JSR [0xfe76]                      
  03c8  8E24B1         LDX #0x24b1                       
  03cb  AD9FFE76       JSR [0xfe76]                      
  03cf  8E1675         LDX #0x1675                       
  03d2  AD9FFE76       JSR [0xfe76]                      
  03d6  8E2B5F         LDX #0x2b5f                       
  03d9  AD9FFE76       JSR [0xfe76]                      
  03dd  8E304A         LDX #0x304a                       
  03e0  AD9FFE76       JSR [0xfe76]                      
  03e4  8E20ED         LDX #0x20ed                       
  03e7  AD9FFE76       JSR [0xfe76]                      
  03eb  8E253C         LDX #0x253c                       
  03ee  AD9FFE76       JSR [0xfe76]                      
  03f2  1718AA         LBSR 0x1c9f                       
  03f5  1709D4         LBSR 0x0dcc                       
  03f8  170A87         LBSR 0x0e82                       
  03fb  170B37         LBSR 0x0f35                       
  03fe  170C42         LBSR 0x1043                       
  0401  170E9A         LBSR 0x129e                       
  0404  170D56         LBSR 0x115d                       
  0407  170E02         LBSR 0x120c                       
  040a  3576           PULS  A B X Y U                   
  040c  39             RTS                               

; ---- function FUN_M75_r4_08000__040d
FUN_M75_r4_08000__040d:
  040d  3476           PSHS  U Y X B A                   
  040f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " delay  " 21 $0D9F $0DAB
  0413  00             db 0h                             
  0414  80             db 80h                            
  0415  2064656C6179.. ds " delay  "                     
  041d  21             db 21h                            
  041e  0D9F           addr M75_r4_08000::0d9f           
  0420  0DAB           addr M75_r4_08000::0dab           
LAB_M75_r4_08000__0422:
  0422  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "  freq  " 25 $0E55 $0E61
  0426  01             db 1h                             
  0427  80             db 80h                            
  0428  202066726571.. ds "  freq  "                     
  0430  25             db 25h                            
  0431  0E55           addr M75_r4_08000::0e55           
  0433  0E61           addr M75_r4_08000::0e61           
LAB_M75_r4_08000__0435:
  0435  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "q factor" 29 $0F08 $0F14
  0439  02             db 2h                             
  043a  80             db 80h                            
  043b  712066616374.. ds "q factor"                     
  0443  29             db 29h                            
  0444  0F08           addr M75_r4_08000::0f08           
  0446  0F14           addr M75_r4_08000::0f14           
LAB_M75_r4_08000__0448:
  0448  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "  pan   " 2D $0FD0 $0FDC
  044c  03             db 3h                             
  044d  80             db 80h                            
  044e  202070616E20.. ds "  pan   "                     
  0456  2D             db 2Dh                            
  0457  0FD0           addr M75_r4_08000::0fd0           
  0459  0FDC           addr M75_r4_08000::0fdc           
LAB_M75_r4_08000__045b:
  045b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "fbk dly " 31 $111D $1129
  045f  04             db 4h                             
  0460  80             db 80h                            
  0461  66626B20646C.. ds "fbk dly "                     
  0469  31             db 31h                            
  046a  111D           addr M75_r4_08000::111d           
  046c  1129           addr M75_r4_08000::1129           
LAB_M75_r4_08000__046e:
  046e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "feedback" 35 $11DF $11EB
  0472  05             db 5h                             
  0473  80             db 80h                            
  0474  666565646261.. ds "feedback"                     
  047c  35             db 35h                            
  047d  11DF           addr M75_r4_08000::11df           
  047f  11EB           addr M75_r4_08000::11eb           
LAB_M75_r4_08000__0481:
  0481  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "  mix   " 3D $31CE $31DA
  0485  07             db 7h                             
  0486  80             db 80h                            
  0487  20206D697820.. ds "  mix   "                     
  048f  3D             db 3Dh                            
  0490  31CE           addr M75_r4_08000::31ce           
  0492  31DA           addr M75_r4_08000::31da           
LAB_M75_r4_08000__0494:
  0494  CC04B0         LDD #0x4b0                        
  0497  FD60F5         STD 0x60f5                        
  049a  CC0078         LDD #0x78                         
  049d  47             ASRA                              
  049e  56             RORB                              
  049f  FD60F7         STD 0x60f7                        
  04a2  8601           LDA #0x1                          
  04a4  B76105         STA 0x6105                        
  04a7  CC00B2         LDD #0xb2                         
  04aa  FD6106         STD 0x6106                        
  04ad  3576           PULS  A B X Y U                   
  04af  39             RTS                               
  04b0  05280533053E.. addr[61]                          
  052a  .db 4A 17 02 C9 AD 9F FE 10 39                       ; J.......9

; ---- function FUN_M75_r4_08000__0533
FUN_M75_r4_08000__0533:
  0533  1708F5         LBSR 0x0e2b                       
  0536  1702BE         LBSR 0x07f7                       
  0539  AD9FFE12       JSR [0xfe12]                      
  053d  39             RTS                               

; ---- function FUN_M75_r4_08000__053e
FUN_M75_r4_08000__053e:
  053e  17099D         LBSR 0x0ede                       
  0541  1702B3         LBSR 0x07f7                       
  0544  AD9FFE14       JSR [0xfe14]                      
  0548  39             RTS                               

; ---- function FUN_M75_r4_08000__0549
FUN_M75_r4_08000__0549:
  0549  172C5E         LBSR 0x31aa                       
  054c  17030C         LBSR 0x085b                       
  054f  AD9FFE12       JSR [0xfe12]                      
  0553  39             RTS                               

; ---- function FUN_M75_r4_08000__0554
FUN_M75_r4_08000__0554:
  0554  172D05         LBSR 0x325c                       
  0557  170784         LBSR 0x0cde                       
  055a  AD9FFE10       JSR [0xfe10]                      
  055e  39             RTS                               

; ---- function FUN_M75_r4_08000__055f
FUN_M75_r4_08000__055f:
  055f  172D75         LBSR 0x32d7                       
  0562  170779         LBSR 0x0cde                       
  0565  AD9FFE12       JSR [0xfe12]                      
  0569  39             RTS                               

; ---- function FUN_M75_r4_08000__056a
FUN_M75_r4_08000__056a:
  056a  172DE5         LBSR 0x3352                       
  056d  1707A0         LBSR 0x0d10                       
  0570  AD9FFE10       JSR [0xfe10]                      
  0574  39             RTS                               

; ---- function FUN_M75_r4_08000__0575
FUN_M75_r4_08000__0575:
  0575  172E55         LBSR 0x33cd                       
  0578  170795         LBSR 0x0d10                       
  057b  AD9FFE12       JSR [0xfe12]                      
  057f  39             RTS                               

; ---- function FUN_M75_r4_08000__0580
FUN_M75_r4_08000__0580:
  0580  170A29         LBSR 0x0fac                       
  0583  170271         LBSR 0x07f7                       
  0586  AD9FFE16       JSR [0xfe16]                      
  058a  39             RTS                               

; ---- function FUN_M75_r4_08000__058b
FUN_M75_r4_08000__058b:
  058b  170D92         LBSR 0x1320                       
  058e  17036E         LBSR 0x08ff                       
  0591  AD9FFE10       JSR [0xfe10]                      
  0595  39             RTS                               

; ---- function FUN_M75_r4_08000__0596
FUN_M75_r4_08000__0596:
  0596  172271         LBSR 0x280a                       
  0599  1704B2         LBSR 0x0a4e                       
  059c  AD9FFE10       JSR [0xfe10]                      
  05a0  39             RTS                               

; ---- function FUN_M75_r4_08000__05a1
FUN_M75_r4_08000__05a1:
  05a1  1726CC         LBSR 0x2c70                       
  05a4  1705EF         LBSR 0x0b96                       
  05a7  AD9FFE10       JSR [0xfe10]                      
  05ab  39             RTS                               

; ---- function FUN_M75_r4_08000__05ac
FUN_M75_r4_08000__05ac:
  05ac  1717E2         LBSR 0x1d91                       
  05af  170688         LBSR 0x0c3a                       
  05b2  AD9FFE10       JSR [0xfe10]                      
  05b6  39             RTS                               

; ---- function FUN_M75_r4_08000__05b7
FUN_M75_r4_08000__05b7:
  05b7  171BE7         LBSR 0x21a1                       
  05ba  170535         LBSR 0x0af2                       
  05bd  AD9FFE10       JSR [0xfe10]                      
  05c1  39             RTS                               

; ---- function FUN_M75_r4_08000__05c2
FUN_M75_r4_08000__05c2:
  05c2  1712BC         LBSR 0x1881                       
  05c5  1703DB         LBSR 0x09a3                       
  05c8  AD9FFE10       JSR [0xfe10]                      
  05cc  39             RTS                               

; ---- function FUN_M75_r4_08000__05cd
FUN_M75_r4_08000__05cd:
  05cd  170DD1         LBSR 0x13a1                       
  05d0  17032C         LBSR 0x08ff                       
  05d3  AD9FFE12       JSR [0xfe12]                      
  05d7  39             RTS                               

; ---- function FUN_M75_r4_08000__05d8
FUN_M75_r4_08000__05d8:
  05d8  1722B0         LBSR 0x288b                       
  05db  170470         LBSR 0x0a4e                       
  05de  AD9FFE12       JSR [0xfe12]                      
  05e2  39             RTS                               

; ---- function FUN_M75_r4_08000__05e3
FUN_M75_r4_08000__05e3:
  05e3  17271E         LBSR 0x2d04                       
  05e6  1705AD         LBSR 0x0b96                       
  05e9  AD9FFE12       JSR [0xfe12]                      
  05ed  39             RTS                               

; ---- function FUN_M75_r4_08000__05ee
FUN_M75_r4_08000__05ee:
  05ee  171822         LBSR 0x1e13                       
  05f1  170646         LBSR 0x0c3a                       
  05f4  AD9FFE12       JSR [0xfe12]                      
  05f8  39             RTS                               

; ---- function FUN_M75_r4_08000__05f9
FUN_M75_r4_08000__05f9:
  05f9  171C30         LBSR 0x222c                       
  05fc  1704F3         LBSR 0x0af2                       
  05ff  AD9FFE12       JSR [0xfe12]                      
  0603  39             RTS                               

; ---- function FUN_M75_r4_08000__0604
FUN_M75_r4_08000__0604:
  0604  171304         LBSR 0x190b                       
  0607  170399         LBSR 0x09a3                       
  060a  AD9FFE12       JSR [0xfe12]                      
  060e  39             RTS                               

; ---- function FUN_M75_r4_08000__060f
FUN_M75_r4_08000__060f:
  060f  170E10         LBSR 0x1422                       
  0612  1702EA         LBSR 0x08ff                       
  0615  AD9FFE14       JSR [0xfe14]                      
  0619  39             RTS                               

; ---- function FUN_M75_r4_08000__061a
FUN_M75_r4_08000__061a:
  061a  1722EF         LBSR 0x290c                       
  061d  17042E         LBSR 0x0a4e                       
  0620  AD9FFE14       JSR [0xfe14]                      
  0624  39             RTS                               

; ---- function FUN_M75_r4_08000__0625
FUN_M75_r4_08000__0625:
  0625  172770         LBSR 0x2d98                       
  0628  17056B         LBSR 0x0b96                       
  062b  AD9FFE14       JSR [0xfe14]                      
  062f  39             RTS                               

; ---- function FUN_M75_r4_08000__0630
FUN_M75_r4_08000__0630:
  0630  171862         LBSR 0x1e95                       
  0633  170604         LBSR 0x0c3a                       
  0636  AD9FFE14       JSR [0xfe14]                      
  063a  39             RTS                               

; ---- function FUN_M75_r4_08000__063b
FUN_M75_r4_08000__063b:
  063b  171C79         LBSR 0x22b7                       
  063e  1704B1         LBSR 0x0af2                       
  0641  AD9FFE14       JSR [0xfe14]                      
  0645  39             RTS                               

; ---- function FUN_M75_r4_08000__0646
FUN_M75_r4_08000__0646:
  0646  17134C         LBSR 0x1995                       
  0649  170357         LBSR 0x09a3                       
  064c  AD9FFE14       JSR [0xfe14]                      
  0650  39             RTS                               

; ---- function FUN_M75_r4_08000__0651
FUN_M75_r4_08000__0651:
  0651  170E4F         LBSR 0x14a3                       
  0654  1702E1         LBSR 0x0938                       
  0657  AD9FFE10       JSR [0xfe10]                      
  065b  39             RTS                               

; ---- function FUN_M75_r4_08000__065c
FUN_M75_r4_08000__065c:
  065c  17232E         LBSR 0x298d                       
  065f  170425         LBSR 0x0a87                       
  0662  AD9FFE10       JSR [0xfe10]                      
  0666  39             RTS                               

; ---- function FUN_M75_r4_08000__0667
FUN_M75_r4_08000__0667:
  0667  1727C2         LBSR 0x2e2c                       
  066a  170562         LBSR 0x0bcf                       
  066d  AD9FFE10       JSR [0xfe10]                      
  0671  39             RTS                               

; ---- function FUN_M75_r4_08000__0672
FUN_M75_r4_08000__0672:
  0672  1718A2         LBSR 0x1f17                       
  0675  1705FB         LBSR 0x0c73                       
  0678  AD9FFE10       JSR [0xfe10]                      
  067c  39             RTS                               

; ---- function FUN_M75_r4_08000__067d
FUN_M75_r4_08000__067d:
  067d  171CC2         LBSR 0x2342                       
  0680  1704A8         LBSR 0x0b2b                       
  0683  AD9FFE10       JSR [0xfe10]                      
  0687  39             RTS                               

; ---- function FUN_M75_r4_08000__0688
FUN_M75_r4_08000__0688:
  0688  171394         LBSR 0x1a1f                       
  068b  17034E         LBSR 0x09dc                       
  068e  AD9FFE10       JSR [0xfe10]                      
  0692  39             RTS                               

; ---- function FUN_M75_r4_08000__0693
FUN_M75_r4_08000__0693:
  0693  170E8E         LBSR 0x1524                       
  0696  17029F         LBSR 0x0938                       
  0699  AD9FFE12       JSR [0xfe12]                      
  069d  39             RTS                               

; ---- function FUN_M75_r4_08000__069e
FUN_M75_r4_08000__069e:
  069e  17236D         LBSR 0x2a0e                       
  06a1  1703E3         LBSR 0x0a87                       
  06a4  AD9FFE12       JSR [0xfe12]                      
  06a8  39             RTS                               

; ---- function FUN_M75_r4_08000__06a9
FUN_M75_r4_08000__06a9:
  06a9  172814         LBSR 0x2ec0                       
  06ac  170520         LBSR 0x0bcf                       
  06af  AD9FFE12       JSR [0xfe12]                      
  06b3  39             RTS                               

; ---- function FUN_M75_r4_08000__06b4
FUN_M75_r4_08000__06b4:
  06b4  1718E2         LBSR 0x1f99                       
  06b7  1705B9         LBSR 0x0c73                       
  06ba  AD9FFE12       JSR [0xfe12]                      
  06be  39             RTS                               

; ---- function FUN_M75_r4_08000__06bf
FUN_M75_r4_08000__06bf:
  06bf  171D0B         LBSR 0x23cd                       
  06c2  170466         LBSR 0x0b2b                       
  06c5  AD9FFE12       JSR [0xfe12]                      
  06c9  39             RTS                               

; ---- function FUN_M75_r4_08000__06ca
FUN_M75_r4_08000__06ca:
  06ca  1713DC         LBSR 0x1aa9                       
  06cd  17030C         LBSR 0x09dc                       
  06d0  AD9FFE12       JSR [0xfe12]                      
  06d4  39             RTS                               

; ---- function FUN_M75_r4_08000__06d5
FUN_M75_r4_08000__06d5:
  06d5  170ECD         LBSR 0x15a5                       
  06d8  17025D         LBSR 0x0938                       
  06db  AD9FFE14       JSR [0xfe14]                      
  06df  39             RTS                               

; ---- function FUN_M75_r4_08000__06e0
FUN_M75_r4_08000__06e0:
  06e0  1723AC         LBSR 0x2a8f                       
  06e3  1703A1         LBSR 0x0a87                       
  06e6  AD9FFE14       JSR [0xfe14]                      
  06ea  39             RTS                               

; ---- function FUN_M75_r4_08000__06eb
FUN_M75_r4_08000__06eb:
  06eb  172866         LBSR 0x2f54                       
  06ee  1704DE         LBSR 0x0bcf                       
  06f1  AD9FFE14       JSR [0xfe14]                      
  06f5  39             RTS                               

; ---- function FUN_M75_r4_08000__06f6
FUN_M75_r4_08000__06f6:
  06f6  171922         LBSR 0x201b                       
  06f9  170577         LBSR 0x0c73                       
  06fc  AD9FFE14       JSR [0xfe14]                      
  0700  39             RTS                               

; ---- function FUN_M75_r4_08000__0701
FUN_M75_r4_08000__0701:
  0701  171D54         LBSR 0x2458                       
  0704  170424         LBSR 0x0b2b                       
  0707  AD9FFE14       JSR [0xfe14]                      
  070b  39             RTS                               

; ---- function FUN_M75_r4_08000__070c
FUN_M75_r4_08000__070c:
  070c  171424         LBSR 0x1b33                       
  070f  1702CA         LBSR 0x09dc                       
  0712  AD9FFE14       JSR [0xfe14]                      
  0716  39             RTS                               

; ---- function FUN_M75_r4_08000__0717
FUN_M75_r4_08000__0717:
  0717  170F0C         LBSR 0x1626                       
  071a  170254         LBSR 0x0971                       
  071d  AD9FFE10       JSR [0xfe10]                      
  0721  39             RTS                               

; ---- function FUN_M75_r4_08000__0722
FUN_M75_r4_08000__0722:
  0722  1723EB         LBSR 0x2b10                       
  0725  170398         LBSR 0x0ac0                       
  0728  AD9FFE10       JSR [0xfe10]                      
  072c  39             RTS                               

; ---- function FUN_M75_r4_08000__072d
FUN_M75_r4_08000__072d:
  072d  1728B8         LBSR 0x2fe8                       
  0730  1704D5         LBSR 0x0c08                       
  0733  AD9FFE10       JSR [0xfe10]                      
  0737  39             RTS                               

; ---- function FUN_M75_r4_08000__0738
FUN_M75_r4_08000__0738:
  0738  171962         LBSR 0x209d                       
  073b  17056E         LBSR 0x0cac                       
  073e  AD9FFE10       JSR [0xfe10]                      
  0742  39             RTS                               

; ---- function FUN_M75_r4_08000__0743
FUN_M75_r4_08000__0743:
  0743  171D9D         LBSR 0x24e3                       
  0746  17041B         LBSR 0x0b64                       
  0749  AD9FFE10       JSR [0xfe10]                      
  074d  39             RTS                               

; ---- function FUN_M75_r4_08000__074e
FUN_M75_r4_08000__074e:
  074e  17146C         LBSR 0x1bbd                       
  0751  1702C1         LBSR 0x0a15                       
  0754  AD9FFE10       JSR [0xfe10]                      
  0758  39             RTS                               

; ---- function FUN_M75_r4_08000__0759
FUN_M75_r4_08000__0759:
  0759  170F4B         LBSR 0x16a7                       
  075c  170212         LBSR 0x0971                       
  075f  AD9FFE12       JSR [0xfe12]                      
  0763  39             RTS                               

; ---- function FUN_M75_r4_08000__0764
FUN_M75_r4_08000__0764:
  0764  17242A         LBSR 0x2b91                       
  0767  170356         LBSR 0x0ac0                       
  076a  AD9FFE12       JSR [0xfe12]                      
  076e  39             RTS                               

; ---- function FUN_M75_r4_08000__076f
FUN_M75_r4_08000__076f:
  076f  17290A         LBSR 0x307c                       
  0772  170493         LBSR 0x0c08                       
  0775  AD9FFE12       JSR [0xfe12]                      
  0779  39             RTS                               

; ---- function FUN_M75_r4_08000__077a
FUN_M75_r4_08000__077a:
  077a  1719A2         LBSR 0x211f                       
  077d  17052C         LBSR 0x0cac                       
  0780  AD9FFE12       JSR [0xfe12]                      
  0784  39             RTS                               

; ---- function FUN_M75_r4_08000__0785
FUN_M75_r4_08000__0785:
  0785  171DE6         LBSR 0x256e                       
  0788  1703D9         LBSR 0x0b64                       
  078b  AD9FFE12       JSR [0xfe12]                      
  078f  39             RTS                               

; ---- function FUN_M75_r4_08000__0790
FUN_M75_r4_08000__0790:
  0790  1714B4         LBSR 0x1c47                       
  0793  17027F         LBSR 0x0a15                       
  0796  AD9FFE12       JSR [0xfe12]                      
  079a  39             RTS                               

; ---- function FUN_M75_r4_08000__079b
FUN_M75_r4_08000__079b:
  079b  170AC7         LBSR 0x1265                       
  079e  170274         LBSR 0x0a15                       
  07a1  AD9FFE14       JSR [0xfe14]                      
  07a5  39             RTS                               

; ---- function FUN_M75_r4_08000__07a6
FUN_M75_r4_08000__07a6:
  07a6  17094A         LBSR 0x10f3                       
  07a9  170084         LBSR 0x0830                       
  07ac  AD9FFE10       JSR [0xfe10]                      
  07b0  39             RTS                               

; ---- function FUN_M75_r4_08000__07b1
FUN_M75_r4_08000__07b1:
  07b1  170A01         LBSR 0x11b5                       
  07b4  170079         LBSR 0x0830                       
  07b7  AD9FFE12       JSR [0xfe12]                      
  07bb  39             RTS                               

; ---- function FUN_M75_r4_08000__07bc
FUN_M75_r4_08000__07bc:
  07bc  AD9FFDFC       JSR [0xfdfc]                      
  07c0  39             RTS                               
LAB_M75_r4_08000__07c1:
  07c1  C600           LDB #0x0                          
  07c3  AD9FFC36       JSR [0xfc36]                      
  07c7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  07cb  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M75_r4_08000__07f4:
  07f4  3576           PULS  A B X Y U                   
  07f6  39             RTS                               

; ---- function FUN_M75_r4_08000__07f7
FUN_M75_r4_08000__07f7:
  07f7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " delay  " "  freq  " "q factor" "  pan   "
  07fb  2064656C6179.. ds " delay  "                     
  0803  202066726571.. ds "  freq  "                     
  080b  712066616374.. ds "q factor"                     
  0813  202070616E20.. ds "  pan   "                     
LAB_M75_r4_08000__081b:
  081b  AD9FFDF2       JSR [0xfdf2]                      
  081f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D69 ->$0E1F ->$0ED2 ->$0FB8 ->$0830 ->$0830
  0823  0D69           addr M75_r4_08000::0d69           
  0825  0E1F           addr M75_r4_08000::0e1f           
  0827  0ED2           addr M75_r4_08000::0ed2           
  0829  0FB8           addr M75_r4_08000::0fb8           
  082b  0830           addr M75_r4_08000::0830           
  082d  0830           addr M75_r4_08000::0830           
LAB_M75_r4_08000__082f:
  082f  39             RTS                               

; ---- function FUN_M75_r4_08000__0830
FUN_M75_r4_08000__0830:
  0830  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "fbk dly " "feedback" [*] [*]
  0834  66626B20646C.. ds "fbk dly "                     
  083c  666565646261.. ds "feedback"                     
  0844  01             db 1h                             
  0845  01             db 1h                             
LAB_M75_r4_08000__0846:
  0846  AD9FFDF2       JSR [0xfdf2]                      
  084a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$10E7 ->$11A9 ->$0D42 ->$0D42 ->$085B ->$07F7
  084e  10E7           addr M75_r4_08000::10e7           
  0850  11A9           addr M75_r4_08000::11a9           
  0852  0D42           addr M75_r4_08000::0d42           
  0854  0D42           addr M75_r4_08000::0d42           
  0856  085B           addr M75_r4_08000::085b           
  0858  07F7           addr M75_r4_08000::07f7           
LAB_M75_r4_08000__085a:
  085a  39             RTS                               

; ---- function FUN_M75_r4_08000__085b
FUN_M75_r4_08000__085b:
  085b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " levels " "  mix   " [*] " expert "
  085f  206C6576656C.. ds " levels "                     
  0867  20206D697820.. ds "  mix   "                     
  086f  01             db 1h                             
  0870  206578706572.. ds " expert "                     
LAB_M75_r4_08000__0878:
  0878  AD9FFDF2       JSR [0xfdf2]                      
  087c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0CDE ->$319E ->$0D42 ->$088D ->$07F7 ->$0830
  0880  0CDE           addr M75_r4_08000::0cde           
  0882  319E           addr M75_r4_08000::319e           
  0884  0D42           addr M75_r4_08000::0d42           
  0886  088D           addr M75_r4_08000::088d           
  0888  07F7           addr M75_r4_08000::07f7           
  088a  0830           addr M75_r4_08000::0830           
LAB_M75_r4_08000__088c:
  088c  39             RTS                               

; ---- function FUN_M75_r4_08000__088d
FUN_M75_r4_08000__088d:
  088d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " freqs  " "q factor" " delays " " return "
  0891  206672657173.. ds " freqs  "                     
  0899  712066616374.. ds "q factor"                     
  08a1  2064656C6179.. ds " delays "                     
  08a9  207265747572.. ds " return "                     
LAB_M75_r4_08000__08b1:
  08b1  AD9FFDF2       JSR [0xfdf2]                      
  08b5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$08FF ->$0A4E ->$0B96 ->$085B ->$08C6 ->$08C6
  08b9  08FF           addr M75_r4_08000::08ff           
  08bb  0A4E           addr M75_r4_08000::0a4e           
  08bd  0B96           addr M75_r4_08000::0b96           
  08bf  085B           addr M75_r4_08000::085b           
  08c1  08C6           addr M75_r4_08000::08c6           
  08c3  08C6           addr M75_r4_08000::08c6           
LAB_M75_r4_08000__08c5:
  08c5  39             RTS                               

; ---- function FUN_M75_r4_08000__08c6
FUN_M75_r4_08000__08c6:
  08c6  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "outputs " "  pans  " " notes  " " return "
  08ca  6F7574707574.. ds "outputs "                     
  08d2  202070616E73.. ds "  pans  "                     
  08da  206E6F746573.. ds " notes  "                     
  08e2  207265747572.. ds " return "                     
LAB_M75_r4_08000__08ea:
  08ea  AD9FFDF2       JSR [0xfdf2]                      
  08ee  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C3A ->$0AF2 ->$09A3 ->$085B ->$088D ->$088D
  08f2  0C3A           addr M75_r4_08000::0c3a           
  08f4  0AF2           addr M75_r4_08000::0af2           
  08f6  09A3           addr M75_r4_08000::09a3           
  08f8  085B           addr M75_r4_08000::085b           
  08fa  088D           addr M75_r4_08000::088d           
  08fc  088D           addr M75_r4_08000::088d           
LAB_M75_r4_08000__08fe:
  08fe  39             RTS                               

; ---- function FUN_M75_r4_08000__08ff
FUN_M75_r4_08000__08ff:
  08ff  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F1 freq " "F2 freq " "F3 freq " " return "
  0903  463120667265.. ds "F1 freq "                     
  090b  463220667265.. ds "F2 freq "                     
  0913  463320667265.. ds "F3 freq "                     
  091b  207265747572.. ds " return "                     
LAB_M75_r4_08000__0923:
  0923  AD9FFDF2       JSR [0xfdf2]                      
  0927  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1314 ->$1395 ->$1416 ->$088D ->$0938 ->$0971
  092b  1314           addr M75_r4_08000::1314           
  092d  1395           addr M75_r4_08000::1395           
  092f  1416           addr M75_r4_08000::1416           
  0931  088D           addr M75_r4_08000::088d           
  0933  0938           addr M75_r4_08000::0938           
  0935  0971           addr M75_r4_08000::0971           
LAB_M75_r4_08000__0937:
  0937  39             RTS                               

; ---- function FUN_M75_r4_08000__0938
FUN_M75_r4_08000__0938:
  0938  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F4 freq " "F5 freq " "F6 freq " " return "
  093c  463420667265.. ds "F4 freq "                     
  0944  463520667265.. ds "F5 freq "                     
  094c  463620667265.. ds "F6 freq "                     
  0954  207265747572.. ds " return "                     
LAB_M75_r4_08000__095c:
  095c  AD9FFDF2       JSR [0xfdf2]                      
  0960  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1497 ->$1518 ->$1599 ->$088D ->$0971 ->$08FF
  0964  1497           addr M75_r4_08000::1497           
  0966  1518           addr M75_r4_08000::1518           
  0968  1599           addr M75_r4_08000::1599           
  096a  088D           addr M75_r4_08000::088d           
  096c  0971           addr M75_r4_08000::0971           
  096e  08FF           addr M75_r4_08000::08ff           
LAB_M75_r4_08000__0970:
  0970  39             RTS                               

; ---- function FUN_M75_r4_08000__0971
FUN_M75_r4_08000__0971:
  0971  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F7 freq " "F8 freq " [*] " return "
  0975  463720667265.. ds "F7 freq "                     
  097d  463820667265.. ds "F8 freq "                     
  0985  01             db 1h                             
  0986  207265747572.. ds " return "                     
LAB_M75_r4_08000__098e:
  098e  AD9FFDF2       JSR [0xfdf2]                      
  0992  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$161A ->$169B ->$0D42 ->$088D ->$08FF ->$0938
  0996  161A           addr M75_r4_08000::161a           
  0998  169B           addr M75_r4_08000::169b           
  099a  0D42           addr M75_r4_08000::0d42           
  099c  088D           addr M75_r4_08000::088d           
  099e  08FF           addr M75_r4_08000::08ff           
  09a0  0938           addr M75_r4_08000::0938           
LAB_M75_r4_08000__09a2:
  09a2  39             RTS                               

; ---- function FUN_M75_r4_08000__09a3
FUN_M75_r4_08000__09a3:
  09a3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F1 note " "F2 note " "F3 note " " return "
  09a7  4631206E6F74.. ds "F1 note "                     
  09af  4632206E6F74.. ds "F2 note "                     
  09b7  4633206E6F74.. ds "F3 note "                     
  09bf  207265747572.. ds " return "                     
LAB_M75_r4_08000__09c7:
  09c7  AD9FFDF2       JSR [0xfdf2]                      
  09cb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1875 ->$18FF ->$1989 ->$08C6 ->$09DC ->$0A15
  09cf  1875           addr M75_r4_08000::1875           
  09d1  18FF           addr M75_r4_08000::18ff           
  09d3  1989           addr M75_r4_08000::1989           
  09d5  08C6           addr M75_r4_08000::08c6           
  09d7  09DC           addr M75_r4_08000::09dc           
  09d9  0A15           addr M75_r4_08000::0a15           
LAB_M75_r4_08000__09db:
  09db  39             RTS                               

; ---- function FUN_M75_r4_08000__09dc
FUN_M75_r4_08000__09dc:
  09dc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F4 note " "F5 note " "F6 note " " return "
  09e0  4634206E6F74.. ds "F4 note "                     
  09e8  4635206E6F74.. ds "F5 note "                     
  09f0  4636206E6F74.. ds "F6 note "                     
  09f8  207265747572.. ds " return "                     
LAB_M75_r4_08000__0a00:
  0a00  AD9FFDF2       JSR [0xfdf2]                      
  0a04  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1A13 ->$1A9D ->$1B27 ->$08C6 ->$0A15 ->$09A3
  0a08  1A13           addr M75_r4_08000::1a13           
  0a0a  1A9D           addr M75_r4_08000::1a9d           
  0a0c  1B27           addr M75_r4_08000::1b27           
  0a0e  08C6           addr M75_r4_08000::08c6           
  0a10  0A15           addr M75_r4_08000::0a15           
  0a12  09A3           addr M75_r4_08000::09a3           
LAB_M75_r4_08000__0a14:
  0a14  39             RTS                               

; ---- function FUN_M75_r4_08000__0a15
FUN_M75_r4_08000__0a15:
  0a15  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F7 note " "F8 note " "notemode" " return "
  0a19  4637206E6F74.. ds "F7 note "                     
  0a21  4638206E6F74.. ds "F8 note "                     
  0a29  6E6F74656D6F.. ds "notemode"                     
  0a31  207265747572.. ds " return "                     
LAB_M75_r4_08000__0a39:
  0a39  AD9FFDF2       JSR [0xfdf2]                      
  0a3d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1BB1 ->$1C3B ->$1259 ->$08C6 ->$09A3 ->$09DC
  0a41  1BB1           addr M75_r4_08000::1bb1           
  0a43  1C3B           addr M75_r4_08000::1c3b           
  0a45  1259           addr M75_r4_08000::1259           
  0a47  08C6           addr M75_r4_08000::08c6           
  0a49  09A3           addr M75_r4_08000::09a3           
  0a4b  09DC           addr M75_r4_08000::09dc           
LAB_M75_r4_08000__0a4d:
  0a4d  39             RTS                               

; ---- function FUN_M75_r4_08000__0a4e
FUN_M75_r4_08000__0a4e:
  0a4e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F1 q fac" "F2 q fac" "F3 q fac" " return "
  0a52  463120712066.. ds "F1 q fac"                     
  0a5a  463220712066.. ds "F2 q fac"                     
  0a62  463320712066.. ds "F3 q fac"                     
  0a6a  207265747572.. ds " return "                     
LAB_M75_r4_08000__0a72:
  0a72  AD9FFDF2       JSR [0xfdf2]                      
  0a76  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$27FE ->$287F ->$2900 ->$088D ->$0A87 ->$0AC0
  0a7a  27FE           addr M75_r4_08000::27fe           
  0a7c  287F           addr M75_r4_08000::287f           
  0a7e  2900           addr M75_r4_08000::2900           
  0a80  088D           addr M75_r4_08000::088d           
  0a82  0A87           addr M75_r4_08000::0a87           
  0a84  0AC0           addr M75_r4_08000::0ac0           
LAB_M75_r4_08000__0a86:
  0a86  39             RTS                               

; ---- function FUN_M75_r4_08000__0a87
FUN_M75_r4_08000__0a87:
  0a87  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F4 q fac" "F5 q fac" "F6 q fac" " return "
  0a8b  463420712066.. ds "F4 q fac"                     
  0a93  463520712066.. ds "F5 q fac"                     
  0a9b  463620712066.. ds "F6 q fac"                     
  0aa3  207265747572.. ds " return "                     
LAB_M75_r4_08000__0aab:
  0aab  AD9FFDF2       JSR [0xfdf2]                      
  0aaf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2981 ->$2A02 ->$2A83 ->$088D ->$0AC0 ->$0A4E
  0ab3  2981           addr M75_r4_08000::2981           
  0ab5  2A02           addr M75_r4_08000::2a02           
  0ab7  2A83           addr M75_r4_08000::2a83           
  0ab9  088D           addr M75_r4_08000::088d           
  0abb  0AC0           addr M75_r4_08000::0ac0           
  0abd  0A4E           addr M75_r4_08000::0a4e           
LAB_M75_r4_08000__0abf:
  0abf  39             RTS                               

; ---- function FUN_M75_r4_08000__0ac0
FUN_M75_r4_08000__0ac0:
  0ac0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F7 q fac" "F8 q fac" [*] " return "
  0ac4  463720712066.. ds "F7 q fac"                     
  0acc  463820712066.. ds "F8 q fac"                     
  0ad4  01             db 1h                             
  0ad5  207265747572.. ds " return "                     
LAB_M75_r4_08000__0add:
  0add  AD9FFDF2       JSR [0xfdf2]                      
  0ae1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2B04 ->$2B85 ->$0D42 ->$088D ->$0A4E ->$0A87
  0ae5  2B04           addr M75_r4_08000::2b04           
  0ae7  2B85           addr M75_r4_08000::2b85           
  0ae9  0D42           addr M75_r4_08000::0d42           
  0aeb  088D           addr M75_r4_08000::088d           
  0aed  0A4E           addr M75_r4_08000::0a4e           
  0aef  0A87           addr M75_r4_08000::0a87           
LAB_M75_r4_08000__0af1:
  0af1  39             RTS                               

; ---- function FUN_M75_r4_08000__0af2
FUN_M75_r4_08000__0af2:
  0af2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F1 pan  " "F2 pan  " "F3 pan  " " return "
  0af6  46312070616E.. ds "F1 pan  "                     
  0afe  46322070616E.. ds "F2 pan  "                     
  0b06  46332070616E.. ds "F3 pan  "                     
  0b0e  207265747572.. ds " return "                     
LAB_M75_r4_08000__0b16:
  0b16  AD9FFDF2       JSR [0xfdf2]                      
  0b1a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2195 ->$2220 ->$22AB ->$08C6 ->$0B2B ->$0B64
  0b1e  2195           addr M75_r4_08000::2195           
  0b20  2220           addr M75_r4_08000::2220           
  0b22  22AB           addr M75_r4_08000::22ab           
  0b24  08C6           addr M75_r4_08000::08c6           
  0b26  0B2B           addr M75_r4_08000::0b2b           
  0b28  0B64           addr M75_r4_08000::0b64           
LAB_M75_r4_08000__0b2a:
  0b2a  39             RTS                               

; ---- function FUN_M75_r4_08000__0b2b
FUN_M75_r4_08000__0b2b:
  0b2b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F4 pan  " "F5 pan  " "F6 pan  " " return "
  0b2f  46342070616E.. ds "F4 pan  "                     
  0b37  46352070616E.. ds "F5 pan  "                     
  0b3f  46362070616E.. ds "F6 pan  "                     
  0b47  207265747572.. ds " return "                     
LAB_M75_r4_08000__0b4f:
  0b4f  AD9FFDF2       JSR [0xfdf2]                      
  0b53  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2336 ->$23C1 ->$244C ->$08C6 ->$0B64 ->$0AF2
  0b57  2336           addr M75_r4_08000::2336           
  0b59  23C1           addr M75_r4_08000::23c1           
  0b5b  244C           addr M75_r4_08000::244c           
  0b5d  08C6           addr M75_r4_08000::08c6           
  0b5f  0B64           addr M75_r4_08000::0b64           
  0b61  0AF2           addr M75_r4_08000::0af2           
LAB_M75_r4_08000__0b63:
  0b63  39             RTS                               

; ---- function FUN_M75_r4_08000__0b64
FUN_M75_r4_08000__0b64:
  0b64  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F7 pan  " "F8 pan  " [*] " return "
  0b68  46372070616E.. ds "F7 pan  "                     
  0b70  46382070616E.. ds "F8 pan  "                     
  0b78  01             db 1h                             
  0b79  207265747572.. ds " return "                     
LAB_M75_r4_08000__0b81:
  0b81  AD9FFDF2       JSR [0xfdf2]                      
  0b85  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$24D7 ->$2562 ->$0D42 ->$08C6 ->$0AF2 ->$0B2B
  0b89  24D7           addr M75_r4_08000::24d7           
  0b8b  2562           addr M75_r4_08000::2562           
  0b8d  0D42           addr M75_r4_08000::0d42           
  0b8f  08C6           addr M75_r4_08000::08c6           
  0b91  0AF2           addr M75_r4_08000::0af2           
  0b93  0B2B           addr M75_r4_08000::0b2b           
LAB_M75_r4_08000__0b95:
  0b95  39             RTS                               

; ---- function FUN_M75_r4_08000__0b96
FUN_M75_r4_08000__0b96:
  0b96  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F1 delay" "F2 delay" "F3 delay" " return "
  0b9a  46312064656C.. ds "F1 delay"                     
  0ba2  46322064656C.. ds "F2 delay"                     
  0baa  46332064656C.. ds "F3 delay"                     
  0bb2  207265747572.. ds " return "                     
LAB_M75_r4_08000__0bba:
  0bba  AD9FFDF2       JSR [0xfdf2]                      
  0bbe  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2C64 ->$2CF8 ->$2D8C ->$088D ->$0BCF ->$0C08
  0bc2  2C64           addr M75_r4_08000::2c64           
  0bc4  2CF8           addr M75_r4_08000::2cf8           
  0bc6  2D8C           addr M75_r4_08000::2d8c           
  0bc8  088D           addr M75_r4_08000::088d           
  0bca  0BCF           addr M75_r4_08000::0bcf           
  0bcc  0C08           addr M75_r4_08000::0c08           
LAB_M75_r4_08000__0bce:
  0bce  39             RTS                               

; ---- function FUN_M75_r4_08000__0bcf
FUN_M75_r4_08000__0bcf:
  0bcf  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F4 delay" "F5 delay" "F6 delay" " return "
  0bd3  46342064656C.. ds "F4 delay"                     
  0bdb  46352064656C.. ds "F5 delay"                     
  0be3  46362064656C.. ds "F6 delay"                     
  0beb  207265747572.. ds " return "                     
LAB_M75_r4_08000__0bf3:
  0bf3  AD9FFDF2       JSR [0xfdf2]                      
  0bf7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2E20 ->$2EB4 ->$2F48 ->$088D ->$0C08 ->$0B96
  0bfb  2E20           addr M75_r4_08000::2e20           
  0bfd  2EB4           addr M75_r4_08000::2eb4           
  0bff  2F48           addr M75_r4_08000::2f48           
  0c01  088D           addr M75_r4_08000::088d           
  0c03  0C08           addr M75_r4_08000::0c08           
  0c05  0B96           addr M75_r4_08000::0b96           
LAB_M75_r4_08000__0c07:
  0c07  39             RTS                               

; ---- function FUN_M75_r4_08000__0c08
FUN_M75_r4_08000__0c08:
  0c08  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F7 delay" "F8 delay" [*] " return "
  0c0c  46372064656C.. ds "F7 delay"                     
  0c14  46382064656C.. ds "F8 delay"                     
  0c1c  01             db 1h                             
  0c1d  207265747572.. ds " return "                     
LAB_M75_r4_08000__0c25:
  0c25  AD9FFDF2       JSR [0xfdf2]                      
  0c29  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2FDC ->$3070 ->$0D42 ->$088D ->$0B96 ->$0BCF
  0c2d  2FDC           addr M75_r4_08000::2fdc           
  0c2f  3070           addr M75_r4_08000::3070           
  0c31  0D42           addr M75_r4_08000::0d42           
  0c33  088D           addr M75_r4_08000::088d           
  0c35  0B96           addr M75_r4_08000::0b96           
  0c37  0BCF           addr M75_r4_08000::0bcf           
LAB_M75_r4_08000__0c39:
  0c39  39             RTS                               

; ---- function FUN_M75_r4_08000__0c3a
FUN_M75_r4_08000__0c3a:
  0c3a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F1 out  " "F2 out  " "F3 out  " " return "
  0c3e  4631206F7574.. ds "F1 out  "                     
  0c46  4632206F7574.. ds "F2 out  "                     
  0c4e  4633206F7574.. ds "F3 out  "                     
  0c56  207265747572.. ds " return "                     
LAB_M75_r4_08000__0c5e:
  0c5e  AD9FFDF2       JSR [0xfdf2]                      
  0c62  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D85 ->$1E07 ->$1E89 ->$08C6 ->$0C73 ->$0CAC
  0c66  1D85           addr M75_r4_08000::1d85           
  0c68  1E07           addr M75_r4_08000::1e07           
  0c6a  1E89           addr M75_r4_08000::1e89           
  0c6c  08C6           addr M75_r4_08000::08c6           
  0c6e  0C73           addr M75_r4_08000::0c73           
  0c70  0CAC           addr M75_r4_08000::0cac           
LAB_M75_r4_08000__0c72:
  0c72  39             RTS                               

; ---- function FUN_M75_r4_08000__0c73
FUN_M75_r4_08000__0c73:
  0c73  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F4 out  " "F5 out  " "F6 out  " " return "
  0c77  4634206F7574.. ds "F4 out  "                     
  0c7f  4635206F7574.. ds "F5 out  "                     
  0c87  4636206F7574.. ds "F6 out  "                     
  0c8f  207265747572.. ds " return "                     
LAB_M75_r4_08000__0c97:
  0c97  AD9FFDF2       JSR [0xfdf2]                      
  0c9b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1F0B ->$1F8D ->$200F ->$08C6 ->$0CAC ->$0C3A
  0c9f  1F0B           addr M75_r4_08000::1f0b           
  0ca1  1F8D           addr M75_r4_08000::1f8d           
  0ca3  200F           addr M75_r4_08000::200f           
  0ca5  08C6           addr M75_r4_08000::08c6           
  0ca7  0CAC           addr M75_r4_08000::0cac           
  0ca9  0C3A           addr M75_r4_08000::0c3a           
LAB_M75_r4_08000__0cab:
  0cab  39             RTS                               

; ---- function FUN_M75_r4_08000__0cac
FUN_M75_r4_08000__0cac:
  0cac  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "F7 out  " "F8 out  " [*] " return "
  0cb0  4637206F7574.. ds "F7 out  "                     
  0cb8  4638206F7574.. ds "F8 out  "                     
  0cc0  01             db 1h                             
  0cc1  207265747572.. ds " return "                     
LAB_M75_r4_08000__0cc9:
  0cc9  AD9FFDF2       JSR [0xfdf2]                      
  0ccd  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2091 ->$2113 ->$0D42 ->$08C6 ->$0C3A ->$0C73
  0cd1  2091           addr M75_r4_08000::2091           
  0cd3  2113           addr M75_r4_08000::2113           
  0cd5  0D42           addr M75_r4_08000::0d42           
  0cd7  08C6           addr M75_r4_08000::08c6           
  0cd9  0C3A           addr M75_r4_08000::0c3a           
  0cdb  0C73           addr M75_r4_08000::0c73           
LAB_M75_r4_08000__0cdd:
  0cdd  39             RTS                               

; ---- function FUN_M75_r4_08000__0cde
FUN_M75_r4_08000__0cde:
  0cde  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] "return  "
  0ce2  6C6566742069.. ds "left in "                     
  0cea  726967687420.. ds "right in"                     
  0cf2  01             db 1h                             
  0cf3  72657475726E.. ds "return  "                     
LAB_M75_r4_08000__0cfb:
  0cfb  AD9FFDF2       JSR [0xfdf2]                      
  0cff  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3250 ->$32CB ->$0D42 ->$0830 ->$0D10 ->$0D10
  0d03  3250           addr M75_r4_08000::3250           
  0d05  32CB           addr M75_r4_08000::32cb           
  0d07  0D42           addr M75_r4_08000::0d42           
  0d09  0830           addr M75_r4_08000::0830           
  0d0b  0D10           addr M75_r4_08000::0d10           
  0d0d  0D10           addr M75_r4_08000::0d10           
LAB_M75_r4_08000__0d0f:
  0d0f  39             RTS                               

; ---- function FUN_M75_r4_08000__0d10
FUN_M75_r4_08000__0d10:
  0d10  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] "return  "
  0d14  6C656674206F.. ds "left out"                     
  0d1c  72696768746F.. ds "rightout"                     
  0d24  01             db 1h                             
  0d25  72657475726E.. ds "return  "                     
LAB_M75_r4_08000__0d2d:
  0d2d  AD9FFDF2       JSR [0xfdf2]                      
  0d31  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3346 ->$33C1 ->$0D42 ->$0830 ->$0CDE ->$0CDE
  0d35  3346           addr M75_r4_08000::3346           
  0d37  33C1           addr M75_r4_08000::33c1           
  0d39  0D42           addr M75_r4_08000::0d42           
  0d3b  0830           addr M75_r4_08000::0830           
  0d3d  0CDE           addr M75_r4_08000::0cde           
  0d3f  0CDE           addr M75_r4_08000::0cde           
LAB_M75_r4_08000__0d41:
  0d41  39             RTS                               

; ---- function FUN_M75_r4_08000__0d42
FUN_M75_r4_08000__0d42:
  0d42  39             RTS                               
PTR_FUN_M75_r4_08000__0dcc_M75_r4_08000__0d43:
  0d43  0DCC           addr M75_r4_08000::0dcc           
  0d45  0D8D           addr M75_r4_08000::0d8d           
  0d47  .db 0D 81 70 08 70 0A 00 00 70 0C 00 08 00 99 00 00  ; ..p.p...p.......
  0d57  .db 00 27 10 00 64 02 06 21 0D B7 00 00 00 00 70 0E  ; .'..d..!......p.
  0d67  .db 00 9B                                            ; ..

; ---- function FUN_M75_r4_08000__0d69
FUN_M75_r4_08000__0d69:
  0d69  3410           PSHS  X                           
  0d6b  8E0D43         LDX #0xd43                         ; desc[API_FE6A]: ->$0DCC ->$0D8D
  0d6e  AD9FFE6A       JSR [0xfe6a]                      
  0d72  3510           PULS  X                           
  0d74  39             RTS                               

; ---- function FUN_M75_r4_08000__0d75
FUN_M75_r4_08000__0d75:
  0d75  3410           PSHS  X                           
  0d77  8E0D43         LDX #0xd43                         ; desc[API_FDBC]: ->$0DCC ->$0D8D
  0d7a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...C"
  0d7e  3510           PULS  X                           
  0d80  39             RTS                               

; ---- function FUN_M75_r4_08000__0d81
FUN_M75_r4_08000__0d81:
  0d81  3410           PSHS  X                           
  0d83  8E0D43         LDX #0xd43                         ; desc[API_FE6C]: ->$0DCC ->$0D8D
  0d86  AD9FFE6C       JSR [0xfe6c]                      
  0d8a  3510           PULS  X                           
  0d8c  39             RTS                               

; ---- function FUN_M75_r4_08000__0d8d
FUN_M75_r4_08000__0d8d:
  0d8d  3410           PSHS  X                           
  0d8f  8E0D43         LDX #0xd43                         ; desc[API_FE6E]: ->$0DCC ->$0D8D
  0d92  AD9FFE6E       JSR [0xfe6e]                      
  0d96  CC0001         LDD #0x1                          
  0d99  FD60DE         STD 0x60de                        
  0d9c  3510           PULS  X                           
  0d9e  39             RTS                               

; ---- function FUN_M75_r4_08000__0d9f
FUN_M75_r4_08000__0d9f:
  0d9f  3410           PSHS  X                           
  0da1  8E0D43         LDX #0xd43                         ; desc[API_FE1C]: ->$0DCC ->$0D8D
  0da4  AD9FFE1C       JSR [0xfe1c]                      
  0da8  3510           PULS  X                           
  0daa  39             RTS                               

; ---- function FUN_M75_r4_08000__0dab
FUN_M75_r4_08000__0dab:
  0dab  3410           PSHS  X                           
  0dad  8E0D43         LDX #0xd43                         ; desc[API_FE1A]: ->$0DCC ->$0D8D $0D81
  0db0  AD9FFE1A       JSR [0xfe1a]                      
  0db4  3510           PULS  X                           
  0db6  39             RTS                               
  0db7  .db 14 67 6C 6F 62 61 6C 20 64 65 6C 61 79 3A 20 20  ; .global delay:  
  0dc7  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M75_r4_08000__0dcc
FUN_M75_r4_08000__0dcc:
  0dcc  3476           PSHS  U Y X B A                   
  0dce  8E0D43         LDX #0xd43                        
  0dd1  AD9FFE76       JSR [0xfe76]                      
  0dd5  FC700C         LDD 0x700c                        
  0dd8  1726CC         LBSR 0x34a7                       
  0ddb  FD7010         STD 0x7010                        
  0dde  171EDB         LBSR 0x2cbc                       
  0de1  171F6C         LBSR 0x2d50                       
  0de4  171FFD         LBSR 0x2de4                       
  0de7  17208E         LBSR 0x2e78                       
  0dea  17211F         LBSR 0x2f0c                       
  0ded  1721B0         LBSR 0x2fa0                       
  0df0  172241         LBSR 0x3034                       
  0df3  1722D2         LBSR 0x30c8                       
  0df6  3576           PULS  A B X Y U                   
  0df8  39             RTS                               
PTR_FUN_M75_r4_08000__0e82_M75_r4_08000__0df9:
  0df9  0E82           addr M75_r4_08000::0e82           
  0dfb  0E43           addr M75_r4_08000::0e43           
  0dfd  .db 0E 37 70 12 70 14 00 00 70 16 00 08 00 9D 01 CE  ; .7p.p...p.......
  0e0d  .db 00 32 00 00 64 02 07 20 0E 6D 00 00 00 00 70 18  ; .2..d.. .m....p.
  0e1d  .db 00 9F                                            ; ..

; ---- function FUN_M75_r4_08000__0e1f
FUN_M75_r4_08000__0e1f:
  0e1f  3410           PSHS  X                           
  0e21  8E0DF9         LDX #0xdf9                         ; desc[API_FE6A]: ->$0E82 ->$0E43
  0e24  AD9FFE6A       JSR [0xfe6a]                      
  0e28  3510           PULS  X                           
  0e2a  39             RTS                               

; ---- function FUN_M75_r4_08000__0e2b
FUN_M75_r4_08000__0e2b:
  0e2b  3410           PSHS  X                           
  0e2d  8E0DF9         LDX #0xdf9                         ; desc[API_FDBC]: ->$0E82 ->$0E43
  0e30  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0e34  3510           PULS  X                           
  0e36  39             RTS                               

; ---- function FUN_M75_r4_08000__0e37
FUN_M75_r4_08000__0e37:
  0e37  3410           PSHS  X                           
  0e39  8E0DF9         LDX #0xdf9                         ; desc[API_FE6C]: ->$0E82 ->$0E43
  0e3c  AD9FFE6C       JSR [0xfe6c]                      
  0e40  3510           PULS  X                           
  0e42  39             RTS                               

; ---- function FUN_M75_r4_08000__0e43
FUN_M75_r4_08000__0e43:
  0e43  3410           PSHS  X                           
  0e45  8E0DF9         LDX #0xdf9                         ; desc[API_FE6E]: ->$0E82 ->$0E43
  0e48  AD9FFE6E       JSR [0xfe6e]                      
  0e4c  CC0001         LDD #0x1                          
  0e4f  FD60DE         STD 0x60de                        
  0e52  3510           PULS  X                           
  0e54  39             RTS                               

; ---- function FUN_M75_r4_08000__0e55
FUN_M75_r4_08000__0e55:
  0e55  3410           PSHS  X                           
  0e57  8E0DF9         LDX #0xdf9                         ; desc[API_FE1C]: ->$0E82 ->$0E43
  0e5a  AD9FFE1C       JSR [0xfe1c]                      
  0e5e  3510           PULS  X                           
  0e60  39             RTS                               

; ---- function FUN_M75_r4_08000__0e61
FUN_M75_r4_08000__0e61:
  0e61  3410           PSHS  X                           
  0e63  8E0DF9         LDX #0xdf9                         ; desc[API_FE1A]: ->$0E82 ->$0E43 $0E37
  0e66  AD9FFE1A       JSR [0xfe1a]                      
  0e6a  3510           PULS  X                           
  0e6c  39             RTS                               
  0e6d  .db 14 67 6C 6F 62 61 6C 20 66 72 65 71 3A 20 20 20  ; .global freq:   
  0e7d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__0e82
FUN_M75_r4_08000__0e82:
  0e82  3476           PSHS  U Y X B A                   
  0e84  8E0DF9         LDX #0xdf9                        
  0e87  AD9FFE76       JSR [0xfe76]                      
  0e8b  FC7016         LDD 0x7016                        
  0e8e  FD701A         STD 0x701a                        
  0e91  1704C5         LBSR 0x1359                       
  0e94  170543         LBSR 0x13da                       
  0e97  1705C1         LBSR 0x145b                       
  0e9a  17063F         LBSR 0x14dc                       
  0e9d  1706BD         LBSR 0x155d                       
  0ea0  17073B         LBSR 0x15de                       
  0ea3  1707B9         LBSR 0x165f                       
  0ea6  170837         LBSR 0x16e0                       
  0ea9  3576           PULS  A B X Y U                   
  0eab  39             RTS                               
PTR_FUN_M75_r4_08000__0f35_M75_r4_08000__0eac:
  0eac  0F35           addr M75_r4_08000::0f35           
  0eae  0EF6           addr M75_r4_08000::0ef6           
  0eb0  .db 0E EA 70 26 70 28 00 00 70 2A 00 08 00 A1 02 00  ; ..p&p(..p*......
  0ec0  .db 00 27 10 00 64 02 06 1D 0F 20 00 00 00 00 70 2C  ; .'..d.... ....p,
  0ed0  .db 00 A3                                            ; ..

; ---- function FUN_M75_r4_08000__0ed2
FUN_M75_r4_08000__0ed2:
  0ed2  3410           PSHS  X                           
  0ed4  8E0EAC         LDX #0xeac                         ; desc[API_FE6A]: ->$0F35 ->$0EF6
  0ed7  AD9FFE6A       JSR [0xfe6a]                      
  0edb  3510           PULS  X                           
  0edd  39             RTS                               

; ---- function FUN_M75_r4_08000__0ede
FUN_M75_r4_08000__0ede:
  0ede  3410           PSHS  X                           
  0ee0  8E0EAC         LDX #0xeac                         ; desc[API_FDBC]: ->$0F35 ->$0EF6
  0ee3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0ee7  3510           PULS  X                           
  0ee9  39             RTS                               

; ---- function FUN_M75_r4_08000__0eea
FUN_M75_r4_08000__0eea:
  0eea  3410           PSHS  X                           
  0eec  8E0EAC         LDX #0xeac                         ; desc[API_FE6C]: ->$0F35 ->$0EF6
  0eef  AD9FFE6C       JSR [0xfe6c]                      
  0ef3  3510           PULS  X                           
  0ef5  39             RTS                               

; ---- function FUN_M75_r4_08000__0ef6
FUN_M75_r4_08000__0ef6:
  0ef6  3410           PSHS  X                           
  0ef8  8E0EAC         LDX #0xeac                         ; desc[API_FE6E]: ->$0F35 ->$0EF6
  0efb  AD9FFE6E       JSR [0xfe6e]                      
  0eff  CC0001         LDD #0x1                          
  0f02  FD60DE         STD 0x60de                        
  0f05  3510           PULS  X                           
  0f07  39             RTS                               

; ---- function FUN_M75_r4_08000__0f08
FUN_M75_r4_08000__0f08:
  0f08  3410           PSHS  X                           
  0f0a  8E0EAC         LDX #0xeac                         ; desc[API_FE1C]: ->$0F35 ->$0EF6
  0f0d  AD9FFE1C       JSR [0xfe1c]                      
  0f11  3510           PULS  X                           
  0f13  39             RTS                               

; ---- function FUN_M75_r4_08000__0f14
FUN_M75_r4_08000__0f14:
  0f14  3410           PSHS  X                           
  0f16  8E0EAC         LDX #0xeac                         ; desc[API_FE1A]: ->$0F35 ->$0EF6 $0EEA
  0f19  AD9FFE1A       JSR [0xfe1a]                      
  0f1d  3510           PULS  X                           
  0f1f  39             RTS                               
  0f20  .db 14 67 6C 6F 62 61 6C 20 71 3A 20 20 20 20 20 20  ; .global q:      
  0f30  .db 20 25 20 20 20                                   ;  %   

; ---- function FUN_M75_r4_08000__0f35
FUN_M75_r4_08000__0f35:
  0f35  3476           PSHS  U Y X B A                   
  0f37  8E0EAC         LDX #0xeac                        
  0f3a  AD9FFE76       JSR [0xfe76]                      
  0f3e  FC702A         LDD 0x702a                        
  0f41  172563         LBSR 0x34a7                       
  0f44  FD702E         STD 0x702e                        
  0f47  1718F9         LBSR 0x2843                       
  0f4a  171977         LBSR 0x28c4                       
  0f4d  1719F5         LBSR 0x2945                       
  0f50  171A73         LBSR 0x29c6                       
  0f53  171AF1         LBSR 0x2a47                       
  0f56  171B6F         LBSR 0x2ac8                       
  0f59  171BED         LBSR 0x2b49                       
  0f5c  171C6B         LBSR 0x2bca                       
  0f5f  3576           PULS  A B X Y U                   
  0f61  39             RTS                               
PTR_FUN_M75_r4_08000__1043_M75_r4_08000__0f62:
  0f62  1043           addr M75_r4_08000::1043           
  0f64  0FE8           addr M75_r4_08000::0fe8           
  0f66  .db 0F C4 70 1C 70 1E 00 00 70 20 00 08 00 A5 08 FF  ; ..p.p...p ......
  0f76  .db 9C 00 64 00 01 00 04 22 0F 88 00 00 00 00 70 22  ; ..d...."......p"
  0f86  .db 00 A7 05 69 6D 61 67 65 20 77 69 64 74 68 3A 2D  ; ...image width:-
  0f96  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0fa6  .db 20 20 20 20 20 2D                                ;      -

; ---- function FUN_M75_r4_08000__0fac
FUN_M75_r4_08000__0fac:
  0fac  3410           PSHS  X                           
  0fae  8E0F62         LDX #0xf62                         ; desc[API_FDBC]: ->$1043 ->$0FE8
  0fb1  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...b"
  0fb5  3510           PULS  X                           
  0fb7  39             RTS                               

; ---- function FUN_M75_r4_08000__0fb8
FUN_M75_r4_08000__0fb8:
  0fb8  3410           PSHS  X                           
  0fba  8E0F62         LDX #0xf62                         ; desc[API_FE6A]: ->$1043 ->$0FE8
  0fbd  AD9FFE6A       JSR [0xfe6a]                      
  0fc1  3510           PULS  X                           
  0fc3  39             RTS                               

; ---- function FUN_M75_r4_08000__0fc4
FUN_M75_r4_08000__0fc4:
  0fc4  3410           PSHS  X                           
  0fc6  8E0F62         LDX #0xf62                         ; desc[API_FE6C]: ->$1043 ->$0FE8
  0fc9  AD9FFE6C       JSR [0xfe6c]                      
  0fcd  3510           PULS  X                           
  0fcf  39             RTS                               

; ---- function FUN_M75_r4_08000__0fd0
FUN_M75_r4_08000__0fd0:
  0fd0  3410           PSHS  X                           
  0fd2  8E0F62         LDX #0xf62                         ; desc[API_FE1C]: ->$1043 ->$0FE8
  0fd5  AD9FFE1C       JSR [0xfe1c]                      
  0fd9  3510           PULS  X                           
  0fdb  39             RTS                               

; ---- function FUN_M75_r4_08000__0fdc
FUN_M75_r4_08000__0fdc:
  0fdc  3410           PSHS  X                           
  0fde  8E0F62         LDX #0xf62                         ; desc[API_FE1A]: ->$1043 ->$0FE8 $0FC4
  0fe1  AD9FFE1A       JSR [0xfe1a]                      
  0fe5  3510           PULS  X                           
  0fe7  39             RTS                               

; ---- function FUN_M75_r4_08000__0fe8
FUN_M75_r4_08000__0fe8:
  0fe8  3456           PSHS  U X B A                     
  0fea  C612           LDB #0x12                         
  0fec  AD9FFC36       JSR [0xfc36]                      
  0ff0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                     "
  0ff4  202020202020.. char[22] "                     "  
LAB_M75_r4_08000__100a:
  100a  FC7020         LDD 0x7020                        
  100d  C30064         ADDD #0x64                        
  1010  3606           PSHU  B A                         
  1012  CC000A         LDD #0xa                          
  1015  3606           PSHU  B A                         
  1017  AD9FFCEA       JSR [0xfcea]                      
  101b  3706           PULU  A B                         
  101d  FD717E         STD 0x717e                        
  1020  C30012         ADDD #0x12                        
  1023  AD9FFC36       JSR [0xfc36]                      
  1027  C652           LDB #0x52                         
  1029  AD9FFC2A       JSR [0xfc2a]                      
  102d  CC0014         LDD #0x14                         
  1030  B3717E         SUBD 0x717e                       
  1033  C30012         ADDD #0x12                        
  1036  AD9FFC36       JSR [0xfc36]                      
  103a  C64C           LDB #0x4c                         
  103c  AD9FFC2A       JSR [0xfc2a]                      
  1040  3556           PULS  A B X U                     
  1042  39             RTS                               

; ---- function FUN_M75_r4_08000__1043
FUN_M75_r4_08000__1043:
  1043  3476           PSHS  U Y X B A                   
  1045  8E0F62         LDX #0xf62                        
  1048  AD9FFE76       JSR [0xfe76]                      
  104c  FC7020         LDD 0x7020                        
  104f  3606           PSHU  B A                         
  1051  CC0147         LDD #0x147                        
  1054  3606           PSHU  B A                         
  1056  AD9FFCEC       JSR [0xfcec]                      
  105a  3706           PULU  A B                         
  105c  FD7024         STD 0x7024                        
  105f  170003         LBSR 0x1065                       
  1062  3576           PULS  A B X Y U                   
  1064  39             RTS                               

; ---- function FUN_M75_r4_08000__1065
FUN_M75_r4_08000__1065:
  1065  3436           PSHS  Y X B A                     
  1067  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  106b  20AD           dw 20ADh                          
LAB_M75_r4_08000__106d:
  106d  1F01           TFR D,X                           
  106f  1723A4         LBSR 0x3416                       
  1072  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  1076  20AE           dw 20AEh                          
LAB_M75_r4_08000__1078:
  1078  1F01           TFR D,X                           
  107a  172399         LBSR 0x3416                       
  107d  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  1081  20AF           dw 20AFh                          
LAB_M75_r4_08000__1083:
  1083  1F01           TFR D,X                           
  1085  17238E         LBSR 0x3416                       
  1088  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  108c  20B0           dw 20B0h                          
LAB_M75_r4_08000__108e:
  108e  1F01           TFR D,X                           
  1090  172383         LBSR 0x3416                       
  1093  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  1097  20B1           dw 20B1h                          
LAB_M75_r4_08000__1099:
  1099  1F01           TFR D,X                           
  109b  172378         LBSR 0x3416                       
  109e  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  10a2  20B2           dw 20B2h                          
LAB_M75_r4_08000__10a4:
  10a4  1F01           TFR D,X                           
  10a6  17236D         LBSR 0x3416                       
  10a9  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  10ad  20B3           dw 20B3h                          
LAB_M75_r4_08000__10af:
  10af  1F01           TFR D,X                           
  10b1  172362         LBSR 0x3416                       
  10b4  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  10b8  20B4           dw 20B4h                          
LAB_M75_r4_08000__10ba:
  10ba  1F01           TFR D,X                           
  10bc  172357         LBSR 0x3416                       
  10bf  35B6           PULS  A B X Y PC                  
PTR_FUN_M75_r4_08000__115d_M75_r4_08000__10c1:
  10c1  115D           addr M75_r4_08000::115d           
  10c3  110B           addr M75_r4_08000::110b           
  10c5  .db 10 FF 70 30 70 32 00 00 70 34 00 08 00 A9 3A 00  ; ..p0p2..p4....:.
  10d5  .db 00 3A 0C 00 64 01 06 1F 11 35 00 00 00 00 70 36  ; .:..d....5....p6
  10e5  .db 00 AB                                            ; ..

; ---- function FUN_M75_r4_08000__10e7
FUN_M75_r4_08000__10e7:
  10e7  3410           PSHS  X                           
  10e9  8E10C1         LDX #0x10c1                        ; desc[API_FE6A]: ->$115D ->$110B
  10ec  AD9FFE6A       JSR [0xfe6a]                      
  10f0  3510           PULS  X                           
  10f2  39             RTS                               

; ---- function FUN_M75_r4_08000__10f3
FUN_M75_r4_08000__10f3:
  10f3  3410           PSHS  X                           
  10f5  8E10C1         LDX #0x10c1                        ; desc[API_FDBC]: ->$115D ->$110B
  10f8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  10fc  3510           PULS  X                           
  10fe  39             RTS                               

; ---- function FUN_M75_r4_08000__10ff
FUN_M75_r4_08000__10ff:
  10ff  3410           PSHS  X                           
  1101  8E10C1         LDX #0x10c1                        ; desc[API_FE6C]: ->$115D ->$110B
  1104  AD9FFE6C       JSR [0xfe6c]                      
  1108  3510           PULS  X                           
  110a  39             RTS                               

; ---- function FUN_M75_r4_08000__110b
FUN_M75_r4_08000__110b:
  110b  3410           PSHS  X                           
  110d  8E10C1         LDX #0x10c1                        ; desc[API_FE6E]: ->$115D ->$110B
  1110  AD9FFE6E       JSR [0xfe6e]                      
  1114  CC0001         LDD #0x1                          
  1117  FD60DE         STD 0x60de                        
  111a  3510           PULS  X                           
  111c  39             RTS                               

; ---- function FUN_M75_r4_08000__111d
FUN_M75_r4_08000__111d:
  111d  3410           PSHS  X                           
  111f  8E10C1         LDX #0x10c1                        ; desc[API_FE1C]: ->$115D ->$110B
  1122  AD9FFE1C       JSR [0xfe1c]                      
  1126  3510           PULS  X                           
  1128  39             RTS                               

; ---- function FUN_M75_r4_08000__1129
FUN_M75_r4_08000__1129:
  1129  3410           PSHS  X                           
  112b  8E10C1         LDX #0x10c1                        ; desc[API_FE1A]: ->$115D ->$110B $10FF
  112e  AD9FFE1A       JSR [0xfe1a]                      
  1132  3510           PULS  X                           
  1134  39             RTS                               
  1135  .db 14 66 62 6B 20 64 65 6C 61 79 3A 20 20 20 20 20  ; .fbk delay:     
  1145  .db 20 20 20 6D 73 34 06 17 FF 98 C6 05 F7 60 66 CC  ;    ms4.......`f.
  1155  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__115d
FUN_M75_r4_08000__115d:
  115d  3476           PSHS  U Y X B A                   
  115f  8E10C1         LDX #0x10c1                       
  1162  AD9FFE76       JSR [0xfe76]                      
  1166  FC7034         LDD 0x7034                        
  1169  17235F         LBSR 0x34cb                       
  116c  FD717E         STD 0x717e                        
  116f  CC000A         LDD #0xa                          
  1172  AD9FFD20       JSR [0xfd20]                      
  1176  108E0031       LDY #0x31                         
  117a  FC717E         LDD 0x717e                        
  117d  AD9FFD2E       JSR [0xfd2e]                      
  1181  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__120c_M75_r4_08000__1183:
  1183  120C           addr M75_r4_08000::120c           
  1185  11CD           addr M75_r4_08000::11cd           
  1187  .db 11 C1 70 38 70 3A 00 00 70 3C 00 08 00 AD 3B D8  ; ..p8p:..p<....;.
  1197  .db F0 27 10 00 64 02 07 1E 11 F7 00 00 00 00 70 3E  ; .'..d.........p>
  11a7  .db 00 AF                                            ; ..

; ---- function FUN_M75_r4_08000__11a9
FUN_M75_r4_08000__11a9:
  11a9  3410           PSHS  X                           
  11ab  8E1183         LDX #0x1183                        ; desc[API_FE6A]: ->$120C ->$11CD
  11ae  AD9FFE6A       JSR [0xfe6a]                      
  11b2  3510           PULS  X                           
  11b4  39             RTS                               

; ---- function FUN_M75_r4_08000__11b5
FUN_M75_r4_08000__11b5:
  11b5  3410           PSHS  X                           
  11b7  8E1183         LDX #0x1183                        ; desc[API_FDBC]: ->$120C ->$11CD
  11ba  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  11be  3510           PULS  X                           
  11c0  39             RTS                               

; ---- function FUN_M75_r4_08000__11c1
FUN_M75_r4_08000__11c1:
  11c1  3410           PSHS  X                           
  11c3  8E1183         LDX #0x1183                        ; desc[API_FE6C]: ->$120C ->$11CD
  11c6  AD9FFE6C       JSR [0xfe6c]                      
  11ca  3510           PULS  X                           
  11cc  39             RTS                               

; ---- function FUN_M75_r4_08000__11cd
FUN_M75_r4_08000__11cd:
  11cd  3410           PSHS  X                           
  11cf  8E1183         LDX #0x1183                        ; desc[API_FE6E]: ->$120C ->$11CD
  11d2  AD9FFE6E       JSR [0xfe6e]                      
  11d6  CC0001         LDD #0x1                          
  11d9  FD60DE         STD 0x60de                        
  11dc  3510           PULS  X                           
  11de  39             RTS                               

; ---- function FUN_M75_r4_08000__11df
FUN_M75_r4_08000__11df:
  11df  3410           PSHS  X                           
  11e1  8E1183         LDX #0x1183                        ; desc[API_FE1C]: ->$120C ->$11CD
  11e4  AD9FFE1C       JSR [0xfe1c]                      
  11e8  3510           PULS  X                           
  11ea  39             RTS                               

; ---- function FUN_M75_r4_08000__11eb
FUN_M75_r4_08000__11eb:
  11eb  3410           PSHS  X                           
  11ed  8E1183         LDX #0x1183                        ; desc[API_FE1A]: ->$120C ->$11CD $11C1
  11f0  AD9FFE1A       JSR [0xfe1a]                      
  11f4  3510           PULS  X                           
  11f6  39             RTS                               
  11f7  .db 14 66 65 65 64 62 61 63 6B 3A 20 20 20 20 20 20  ; .feedback:      
  1207  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M75_r4_08000__120c
FUN_M75_r4_08000__120c:
  120c  3476           PSHS  U Y X B A                   
  120e  8E1183         LDX #0x1183                       
  1211  AD9FFE76       JSR [0xfe76]                      
  1215  FC703C         LDD 0x703c                        
  1218  17228C         LBSR 0x34a7                       
  121b  FD717E         STD 0x717e                        
  121e  CC000A         LDD #0xa                          
  1221  AD9FFD20       JSR [0xfd20]                      
  1225  108E0032       LDY #0x32                         
  1229  FC717E         LDD 0x717e                        
  122c  AD9FFD2E       JSR [0xfd2e]                      
  1230  3576           PULS  A B X Y U                   
  1232  39             RTS                               
  1233  129E127D1271   addr[3]                           
  1239  .db 70 40 70 42 00 00 70 44 00 08 00 B5 39 00 00 00  ; p@pB..pD....9...
  1249  .db 03 00 01 00 0A 1E 12 89 00 00 12 B2 00 00 00 00  ; ................

; ---- function FUN_M75_r4_08000__1259
FUN_M75_r4_08000__1259:
  1259  3410           PSHS  X                           
  125b  8E1233         LDX #0x1233                       
  125e  AD9FFC4E       JSR [0xfc4e]                      
  1262  3510           PULS  X                           
  1264  39             RTS                               

; ---- function FUN_M75_r4_08000__1265
FUN_M75_r4_08000__1265:
  1265  3410           PSHS  X                           
  1267  8E1233         LDX #0x1233                       
  126a  AD9FFC4C       JSR [0xfc4c]                      
  126e  3510           PULS  X                           
  1270  39             RTS                               

; ---- function FUN_M75_r4_08000__1271
FUN_M75_r4_08000__1271:
  1271  3410           PSHS  X                           
  1273  8E1233         LDX #0x1233                       
  1276  AD9FFC50       JSR [0xfc50]                      
  127a  3510           PULS  X                           
  127c  39             RTS                               

; ---- function FUN_M75_r4_08000__127d
FUN_M75_r4_08000__127d:
  127d  3410           PSHS  X                           
  127f  8E1233         LDX #0x1233                       
  1282  AD9FFC52       JSR [0xfc52]                      
  1286  3510           PULS  X                           
  1288  39             RTS                               
  1289  .db 14 6E 6F 74 65 20 6D 6F 64 65 3A 20 20 20 20 20  ; .note mode:     
  1299  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__129e
FUN_M75_r4_08000__129e:
  129e  3476           PSHS  U Y X B A                   
  12a0  8E1233         LDX #0x1233                       
  12a3  AD9FFE76       JSR [0xfe76]                      
  12a7  FC7044         LDD 0x7044                        
  12aa  F7722A         STB 0x722a                        
  12ad  172360         LBSR 0x3610                       
  12b0  35F6           PULS  A B X Y U PC                
  12b2  .db 20 20 20 20 6F 66 66 20 20 20 20 20 72 6F 75 74  ;     off     rout
  12c2  .db 65 64 20 20 20 6F 72 64 65 72 65 64 20 20 20 63  ; ed   ordered   c
  12d2  .db 69 72 63 75 6C 61 72 20 78 78 78 78 78 78 78 78  ; ircular xxxxxxxx
  12e2  .db 78 78 78 78 78 78 78 78 78 78 78 78              ; xxxxxxxxxxxx
PTR_FUN_M75_r4_08000__1359_M75_r4_08000__12ee:
  12ee  1359           addr M75_r4_08000::1359           
  12f0  1338           addr M75_r4_08000::1338           
  12f2  .db 13 2C 70 5E 70 BE 00 00 71 1E 00 08 00 49 09 00  ; .,p^p...q....I..
  1302  .db 00 32 00 00 64 00 05 1D 13 44 00 00 00 00 00 00  ; .2..d....D......
  1312  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1314
FUN_M75_r4_08000__1314:
  1314  3410           PSHS  X                           
  1316  8E12EE         LDX #0x12ee                        ; desc[API_FE6A]: ->$1359 ->$1338
  1319  AD9FFE6A       JSR [0xfe6a]                      
  131d  3510           PULS  X                           
  131f  39             RTS                               

; ---- function FUN_M75_r4_08000__1320
FUN_M75_r4_08000__1320:
  1320  3410           PSHS  X                           
  1322  8E12EE         LDX #0x12ee                        ; desc[API_FDBC]: ->$1359 ->$1338
  1325  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1329  3510           PULS  X                           
  132b  39             RTS                               

; ---- function FUN_M75_r4_08000__132c
FUN_M75_r4_08000__132c:
  132c  3410           PSHS  X                           
  132e  8E12EE         LDX #0x12ee                        ; desc[API_FE6C]: ->$1359 ->$1338
  1331  AD9FFE6C       JSR [0xfe6c]                      
  1335  3510           PULS  X                           
  1337  39             RTS                               

; ---- function FUN_M75_r4_08000__1338
FUN_M75_r4_08000__1338:
  1338  3410           PSHS  X                           
  133a  8E12EE         LDX #0x12ee                        ; desc[API_FE6E]: ->$1359 ->$1338
  133d  AD9FFE6E       JSR [0xfe6e]                      
  1341  3510           PULS  X                           
  1343  39             RTS                               
  1344  .db 14 46 31 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F1 freq:       
  1354  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__1359
FUN_M75_r4_08000__1359:
  1359  3476           PSHS  U Y X B A                   
  135b  8E12EE         LDX #0x12ee                       
  135e  AD9FFE76       JSR [0xfe76]                      
  1362  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  1366  1DB2           dw 1DB2h                          
LAB_M75_r4_08000__1368:
  1368  1F01           TFR D,X                           
  136a  170389         LBSR 0x16f6                       
  136d  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__13da_M75_r4_08000__136f:
  136f  13DA           addr M75_r4_08000::13da           
  1371  13B9           addr M75_r4_08000::13b9           
  1373  .db 13 AD 70 6A 70 CA 00 00 71 2A 00 08 00 53 0F 00  ; ..pjp...q*...S..
  1383  .db 00 32 00 00 64 00 05 1D 13 C5 00 00 00 00 00 00  ; .2..d...........
  1393  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1395
FUN_M75_r4_08000__1395:
  1395  3410           PSHS  X                           
  1397  8E136F         LDX #0x136f                        ; desc[API_FE6A]: ->$13DA ->$13B9
  139a  AD9FFE6A       JSR [0xfe6a]                      
  139e  3510           PULS  X                           
  13a0  39             RTS                               

; ---- function FUN_M75_r4_08000__13a1
FUN_M75_r4_08000__13a1:
  13a1  3410           PSHS  X                           
  13a3  8E136F         LDX #0x136f                        ; desc[API_FDBC]: ->$13DA ->$13B9
  13a6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...o"
  13aa  3510           PULS  X                           
  13ac  39             RTS                               

; ---- function FUN_M75_r4_08000__13ad
FUN_M75_r4_08000__13ad:
  13ad  3410           PSHS  X                           
  13af  8E136F         LDX #0x136f                        ; desc[API_FE6C]: ->$13DA ->$13B9
  13b2  AD9FFE6C       JSR [0xfe6c]                      
  13b6  3510           PULS  X                           
  13b8  39             RTS                               

; ---- function FUN_M75_r4_08000__13b9
FUN_M75_r4_08000__13b9:
  13b9  3410           PSHS  X                           
  13bb  8E136F         LDX #0x136f                        ; desc[API_FE6E]: ->$13DA ->$13B9
  13be  AD9FFE6E       JSR [0xfe6e]                      
  13c2  3510           PULS  X                           
  13c4  39             RTS                               
  13c5  .db 14 46 32 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F2 freq:       
  13d5  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__13da
FUN_M75_r4_08000__13da:
  13da  3476           PSHS  U Y X B A                   
  13dc  8E136F         LDX #0x136f                       
  13df  AD9FFE76       JSR [0xfe76]                      
  13e3  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  13e7  1D3D           dw 1D3Dh                          
LAB_M75_r4_08000__13e9:
  13e9  1F01           TFR D,X                           
  13eb  170308         LBSR 0x16f6                       
  13ee  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__145b_M75_r4_08000__13f0:
  13f0  145B           addr M75_r4_08000::145b           
  13f2  143A           addr M75_r4_08000::143a           
  13f4  .db 14 2E 70 76 70 D6 00 00 71 36 00 08 00 5D 15 00  ; ..pvp...q6...]..
  1404  .db 00 32 00 00 64 00 05 1D 14 46 00 00 00 00 00 00  ; .2..d....F......
  1414  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1416
FUN_M75_r4_08000__1416:
  1416  3410           PSHS  X                           
  1418  8E13F0         LDX #0x13f0                        ; desc[API_FE6A]: ->$145B ->$143A
  141b  AD9FFE6A       JSR [0xfe6a]                      
  141f  3510           PULS  X                           
  1421  39             RTS                               

; ---- function FUN_M75_r4_08000__1422
FUN_M75_r4_08000__1422:
  1422  3410           PSHS  X                           
  1424  8E13F0         LDX #0x13f0                        ; desc[API_FDBC]: ->$145B ->$143A
  1427  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  142b  3510           PULS  X                           
  142d  39             RTS                               

; ---- function FUN_M75_r4_08000__142e
FUN_M75_r4_08000__142e:
  142e  3410           PSHS  X                           
  1430  8E13F0         LDX #0x13f0                        ; desc[API_FE6C]: ->$145B ->$143A
  1433  AD9FFE6C       JSR [0xfe6c]                      
  1437  3510           PULS  X                           
  1439  39             RTS                               

; ---- function FUN_M75_r4_08000__143a
FUN_M75_r4_08000__143a:
  143a  3410           PSHS  X                           
  143c  8E13F0         LDX #0x13f0                        ; desc[API_FE6E]: ->$145B ->$143A
  143f  AD9FFE6E       JSR [0xfe6e]                      
  1443  3510           PULS  X                           
  1445  39             RTS                               
  1446  .db 14 46 33 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F3 freq:       
  1456  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__145b
FUN_M75_r4_08000__145b:
  145b  3476           PSHS  U Y X B A                   
  145d  8E13F0         LDX #0x13f0                       
  1460  AD9FFE76       JSR [0xfe76]                      
  1464  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  1468  1CC8           dw 1CC8h                          
LAB_M75_r4_08000__146a:
  146a  1F01           TFR D,X                           
  146c  170287         LBSR 0x16f6                       
  146f  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__14dc_M75_r4_08000__1471:
  1471  14DC           addr M75_r4_08000::14dc           
  1473  14BB           addr M75_r4_08000::14bb           
  1475  .db 14 AF 70 82 70 E2 00 00 71 42 00 08 00 67 1B 00  ; ..p.p...qB...g..
  1485  .db 00 32 00 00 64 00 05 1D 14 C7 00 00 00 00 00 00  ; .2..d...........
  1495  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1497
FUN_M75_r4_08000__1497:
  1497  3410           PSHS  X                           
  1499  8E1471         LDX #0x1471                        ; desc[API_FE6A]: ->$14DC ->$14BB
  149c  AD9FFE6A       JSR [0xfe6a]                      
  14a0  3510           PULS  X                           
  14a2  39             RTS                               

; ---- function FUN_M75_r4_08000__14a3
FUN_M75_r4_08000__14a3:
  14a3  3410           PSHS  X                           
  14a5  8E1471         LDX #0x1471                        ; desc[API_FDBC]: ->$14DC ->$14BB
  14a8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...q"
  14ac  3510           PULS  X                           
  14ae  39             RTS                               

; ---- function FUN_M75_r4_08000__14af
FUN_M75_r4_08000__14af:
  14af  3410           PSHS  X                           
  14b1  8E1471         LDX #0x1471                        ; desc[API_FE6C]: ->$14DC ->$14BB
  14b4  AD9FFE6C       JSR [0xfe6c]                      
  14b8  3510           PULS  X                           
  14ba  39             RTS                               

; ---- function FUN_M75_r4_08000__14bb
FUN_M75_r4_08000__14bb:
  14bb  3410           PSHS  X                           
  14bd  8E1471         LDX #0x1471                        ; desc[API_FE6E]: ->$14DC ->$14BB
  14c0  AD9FFE6E       JSR [0xfe6e]                      
  14c4  3510           PULS  X                           
  14c6  39             RTS                               
  14c7  .db 14 46 34 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F4 freq:       
  14d7  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__14dc
FUN_M75_r4_08000__14dc:
  14dc  3476           PSHS  U Y X B A                   
  14de  8E1471         LDX #0x1471                       
  14e1  AD9FFE76       JSR [0xfe76]                      
  14e5  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  14e9  1C53           dw 1C53h                          
LAB_M75_r4_08000__14eb:
  14eb  1F01           TFR D,X                           
  14ed  170206         LBSR 0x16f6                       
  14f0  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__155d_M75_r4_08000__14f2:
  14f2  155D           addr M75_r4_08000::155d           
  14f4  153C           addr M75_r4_08000::153c           
  14f6  .db 15 30 70 8E 70 EE 00 00 71 4E 00 08 00 71 21 00  ; .0p.p...qN...q!.
  1506  .db 00 32 00 00 64 00 05 1D 15 48 00 00 00 00 00 00  ; .2..d....H......
  1516  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1518
FUN_M75_r4_08000__1518:
  1518  3410           PSHS  X                           
  151a  8E14F2         LDX #0x14f2                        ; desc[API_FE6A]: ->$155D ->$153C
  151d  AD9FFE6A       JSR [0xfe6a]                      
  1521  3510           PULS  X                           
  1523  39             RTS                               

; ---- function FUN_M75_r4_08000__1524
FUN_M75_r4_08000__1524:
  1524  3410           PSHS  X                           
  1526  8E14F2         LDX #0x14f2                        ; desc[API_FDBC]: ->$155D ->$153C
  1529  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  152d  3510           PULS  X                           
  152f  39             RTS                               

; ---- function FUN_M75_r4_08000__1530
FUN_M75_r4_08000__1530:
  1530  3410           PSHS  X                           
  1532  8E14F2         LDX #0x14f2                        ; desc[API_FE6C]: ->$155D ->$153C
  1535  AD9FFE6C       JSR [0xfe6c]                      
  1539  3510           PULS  X                           
  153b  39             RTS                               

; ---- function FUN_M75_r4_08000__153c
FUN_M75_r4_08000__153c:
  153c  3410           PSHS  X                           
  153e  8E14F2         LDX #0x14f2                        ; desc[API_FE6E]: ->$155D ->$153C
  1541  AD9FFE6E       JSR [0xfe6e]                      
  1545  3510           PULS  X                           
  1547  39             RTS                               
  1548  .db 14 46 35 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F5 freq:       
  1558  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__155d
FUN_M75_r4_08000__155d:
  155d  3476           PSHS  U Y X B A                   
  155f  8E14F2         LDX #0x14f2                       
  1562  AD9FFE76       JSR [0xfe76]                      
  1566  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  156a  1BDE           dw 1BDEh                          
LAB_M75_r4_08000__156c:
  156c  1F01           TFR D,X                           
  156e  170185         LBSR 0x16f6                       
  1571  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__15de_M75_r4_08000__1573:
  1573  15DE           addr M75_r4_08000::15de           
  1575  15BD           addr M75_r4_08000::15bd           
  1577  .db 15 B1 70 9A 70 FA 00 00 71 5A 00 08 00 7B 27 00  ; ..p.p...qZ...{'.
  1587  .db 00 32 00 00 64 00 05 1D 15 C9 00 00 00 00 00 00  ; .2..d...........
  1597  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1599
FUN_M75_r4_08000__1599:
  1599  3410           PSHS  X                           
  159b  8E1573         LDX #0x1573                        ; desc[API_FE6A]: ->$15DE ->$15BD
  159e  AD9FFE6A       JSR [0xfe6a]                      
  15a2  3510           PULS  X                           
  15a4  39             RTS                               

; ---- function FUN_M75_r4_08000__15a5
FUN_M75_r4_08000__15a5:
  15a5  3410           PSHS  X                           
  15a7  8E1573         LDX #0x1573                        ; desc[API_FDBC]: ->$15DE ->$15BD
  15aa  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...s"
  15ae  3510           PULS  X                           
  15b0  39             RTS                               

; ---- function FUN_M75_r4_08000__15b1
FUN_M75_r4_08000__15b1:
  15b1  3410           PSHS  X                           
  15b3  8E1573         LDX #0x1573                        ; desc[API_FE6C]: ->$15DE ->$15BD
  15b6  AD9FFE6C       JSR [0xfe6c]                      
  15ba  3510           PULS  X                           
  15bc  39             RTS                               

; ---- function FUN_M75_r4_08000__15bd
FUN_M75_r4_08000__15bd:
  15bd  3410           PSHS  X                           
  15bf  8E1573         LDX #0x1573                        ; desc[API_FE6E]: ->$15DE ->$15BD
  15c2  AD9FFE6E       JSR [0xfe6e]                      
  15c6  3510           PULS  X                           
  15c8  39             RTS                               
  15c9  .db 14 46 36 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F6 freq:       
  15d9  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__15de
FUN_M75_r4_08000__15de:
  15de  3476           PSHS  U Y X B A                   
  15e0  8E1573         LDX #0x1573                       
  15e3  AD9FFE76       JSR [0xfe76]                      
  15e7  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  15eb  1B69           dw 1B69h                          
LAB_M75_r4_08000__15ed:
  15ed  1F01           TFR D,X                           
  15ef  170104         LBSR 0x16f6                       
  15f2  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__165f_M75_r4_08000__15f4:
  15f4  165F           addr M75_r4_08000::165f           
  15f6  163E           addr M75_r4_08000::163e           
  15f8  .db 16 32 70 A6 71 06 00 00 71 66 00 08 00 85 2D 00  ; .2p.q...qf....-.
  1608  .db 00 32 00 00 64 00 05 1D 16 4A 00 00 00 00 00 00  ; .2..d....J......
  1618  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__161a
FUN_M75_r4_08000__161a:
  161a  3410           PSHS  X                           
  161c  8E15F4         LDX #0x15f4                        ; desc[API_FE6A]: ->$165F ->$163E
  161f  AD9FFE6A       JSR [0xfe6a]                      
  1623  3510           PULS  X                           
  1625  39             RTS                               

; ---- function FUN_M75_r4_08000__1626
FUN_M75_r4_08000__1626:
  1626  3410           PSHS  X                           
  1628  8E15F4         LDX #0x15f4                        ; desc[API_FDBC]: ->$165F ->$163E
  162b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  162f  3510           PULS  X                           
  1631  39             RTS                               

; ---- function FUN_M75_r4_08000__1632
FUN_M75_r4_08000__1632:
  1632  3410           PSHS  X                           
  1634  8E15F4         LDX #0x15f4                        ; desc[API_FE6C]: ->$165F ->$163E
  1637  AD9FFE6C       JSR [0xfe6c]                      
  163b  3510           PULS  X                           
  163d  39             RTS                               

; ---- function FUN_M75_r4_08000__163e
FUN_M75_r4_08000__163e:
  163e  3410           PSHS  X                           
  1640  8E15F4         LDX #0x15f4                        ; desc[API_FE6E]: ->$165F ->$163E
  1643  AD9FFE6E       JSR [0xfe6e]                      
  1647  3510           PULS  X                           
  1649  39             RTS                               
  164a  .db 14 46 37 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F7 freq:       
  165a  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__165f
FUN_M75_r4_08000__165f:
  165f  3476           PSHS  U Y X B A                   
  1661  8E15F4         LDX #0x15f4                       
  1664  AD9FFE76       JSR [0xfe76]                      
  1668  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  166c  1AF4           dw 1AF4h                          
LAB_M75_r4_08000__166e:
  166e  1F01           TFR D,X                           
  1670  170083         LBSR 0x16f6                       
  1673  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__16e0_M75_r4_08000__1675:
  1675  16E0           addr M75_r4_08000::16e0           
  1677  16BF           addr M75_r4_08000::16bf           
  1679  .db 16 B3 70 B2 71 12 00 00 71 72 00 08 00 8F 33 00  ; ..p.q...qr....3.
  1689  .db 00 32 00 00 64 00 05 1D 16 CB 00 00 00 00 00 00  ; .2..d...........
  1699  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__169b
FUN_M75_r4_08000__169b:
  169b  3410           PSHS  X                           
  169d  8E1675         LDX #0x1675                        ; desc[API_FE6A]: ->$16E0 ->$16BF
  16a0  AD9FFE6A       JSR [0xfe6a]                      
  16a4  3510           PULS  X                           
  16a6  39             RTS                               

; ---- function FUN_M75_r4_08000__16a7
FUN_M75_r4_08000__16a7:
  16a7  3410           PSHS  X                           
  16a9  8E1675         LDX #0x1675                        ; desc[API_FDBC]: ->$16E0 ->$16BF
  16ac  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...u"
  16b0  3510           PULS  X                           
  16b2  39             RTS                               

; ---- function FUN_M75_r4_08000__16b3
FUN_M75_r4_08000__16b3:
  16b3  3410           PSHS  X                           
  16b5  8E1675         LDX #0x1675                        ; desc[API_FE6C]: ->$16E0 ->$16BF
  16b8  AD9FFE6C       JSR [0xfe6c]                      
  16bc  3510           PULS  X                           
  16be  39             RTS                               

; ---- function FUN_M75_r4_08000__16bf
FUN_M75_r4_08000__16bf:
  16bf  3410           PSHS  X                           
  16c1  8E1675         LDX #0x1675                        ; desc[API_FE6E]: ->$16E0 ->$16BF
  16c4  AD9FFE6E       JSR [0xfe6e]                      
  16c8  3510           PULS  X                           
  16ca  39             RTS                               
  16cb  .db 14 46 38 20 66 72 65 71 3A 20 20 20 20 20 20 20  ; .F8 freq:       
  16db  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M75_r4_08000__16e0
FUN_M75_r4_08000__16e0:
  16e0  3476           PSHS  U Y X B A                   
  16e2  8E1675         LDX #0x1675                       
  16e5  AD9FFE76       JSR [0xfe76]                      
  16e9  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  16ed  1A7F           dw 1A7Fh                          
LAB_M75_r4_08000__16ef:
  16ef  1F01           TFR D,X                           
  16f1  170002         LBSR 0x16f6                       
  16f4  35F6           PULS  A B X Y U PC                

; ---- function FUN_M75_r4_08000__16f6
FUN_M75_r4_08000__16f6:
  16f6  3436           PSHS  Y X B A                     
  16f8  10AE890000     LDY 0x0,X                         
  16fd  ECA9000A       LDD 0xa,Y                         
  1701  8664           LDA #0x64                         
  1703  3D             MUL                               
  1704  E3A90000       ADDD 0x0,Y                        

; ---- function FUN_M75_r4_08000__1708
FUN_M75_r4_08000__1708:
  1708  170131         LBSR 0x183c                       
  170b  F3701A         ADDD 0x701a                       
  170e  17012B         LBSR 0x183c                       
  1711  58             LSLB                              
  1712  49             ROLA                              
  1713  3606           PSHU  B A                         
  1715  AD9FFE20       JSR [0xfe20]                       ; inline[API_FE20]: interp table, 129 points
  1719  07             db 7h                             
  171a  00260029002C.. dw[129]                           
LAB_M75_r4_08000__181c:
  181c  3706           PULU  A B                         
  181e  FD717E         STD 0x717e                        
  1821  EC890002       LDD 0x2,X                         
  1825  FD7180         STD 0x7180                        
  1828  CC000A         LDD #0xa                          
  182b  AD9FFD20       JSR [0xfd20]                      
  182f  10BE7180       LDY 0x7180                        
  1833  FC717E         LDD 0x717e                        
  1836  AD9FFD2E       JSR [0xfd2e]                      
  183a  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__183c
FUN_M75_r4_08000__183c:
  183c  10830000       CMPD #0x0                         
  1840  2E03           BGT 0x1845                        
  1842  CC0000         LDD #0x0                          
LAB_M75_r4_08000__1845:
  1845  10833200       CMPD #0x3200                      
  1849  2503           BCS 0x184e                        
  184b  CC3200         LDD #0x3200                       
LAB_M75_r4_08000__184e:
  184e  39             RTS                               
PTR_FUN_M75_r4_08000__18c3_M75_r4_08000__184f:
  184f  18C3           addr M75_r4_08000::18c3           
  1851  18AE           addr M75_r4_08000::18ae           
  1853  .db 18 8D 70 68 70 C8 00 00 71 28 00 08 00 52 0E 00  ; ..php...q(...R..
  1863  .db 00 00 80 00 01 00 04 23 18 99 00 00 00 00 00 00  ; .......#........
  1873  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1875
FUN_M75_r4_08000__1875:
  1875  3410           PSHS  X                           
  1877  8E184F         LDX #0x184f                       
  187a  AD9FFE74       JSR [0xfe74]                      
  187e  3510           PULS  X                           
  1880  39             RTS                               

; ---- function FUN_M75_r4_08000__1881
FUN_M75_r4_08000__1881:
  1881  3410           PSHS  X                           
  1883  8E184F         LDX #0x184f                        ; desc[API_FE22]: ->$18C3 ->$18AE
  1886  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  188a  3510           PULS  X                           
  188c  39             RTS                               

; ---- function FUN_M75_r4_08000__188d
FUN_M75_r4_08000__188d:
  188d  3410           PSHS  X                           
  188f  8E184F         LDX #0x184f                       
  1892  AD9FFE70       JSR [0xfe70]                      
  1896  3510           PULS  X                           
  1898  39             RTS                               
  1899  .db 14 46 31 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F1 note:       
  18a9  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__18ae
FUN_M75_r4_08000__18ae:
  18ae  3436           PSHS  Y X B A                     
  18b0  FC7128         LDD 0x7128                        
  18b3  AD9FFE0A       JSR [0xfe0a]                      
  18b7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  18bb  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__18c1:
  18c1  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__18c3
FUN_M75_r4_08000__18c3:
  18c3  3476           PSHS  U Y X B A                   
  18c5  8E184F         LDX #0x184f                       
  18c8  AD9FFE76       JSR [0xfe76]                      
  18cc  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  18d0  1848           dw 1848h                          
LAB_M75_r4_08000__18d2:
  18d2  1F01           TFR D,X                           
  18d4  17FE1F         LBSR 0x16f6                       
  18d7  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__194d_M75_r4_08000__18d9:
  18d9  194D           addr M75_r4_08000::194d           
  18db  1938           addr M75_r4_08000::1938           
  18dd  .db 19 17 70 74 70 D4 00 00 71 34 00 08 00 5C 14 00  ; ..ptp...q4...\..
  18ed  .db 00 00 80 00 01 00 04 23 19 23 00 00 00 00 00 00  ; .......#.#......
  18fd  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__18ff
FUN_M75_r4_08000__18ff:
  18ff  3410           PSHS  X                           
  1901  8E18D9         LDX #0x18d9                       
  1904  AD9FFE74       JSR [0xfe74]                      
  1908  3510           PULS  X                           
  190a  39             RTS                               

; ---- function FUN_M75_r4_08000__190b
FUN_M75_r4_08000__190b:
  190b  3410           PSHS  X                           
  190d  8E18D9         LDX #0x18d9                        ; desc[API_FE22]: ->$194D ->$1938
  1910  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1914  3510           PULS  X                           
  1916  39             RTS                               

; ---- function FUN_M75_r4_08000__1917
FUN_M75_r4_08000__1917:
  1917  3410           PSHS  X                           
  1919  8E18D9         LDX #0x18d9                       
  191c  AD9FFE70       JSR [0xfe70]                      
  1920  3510           PULS  X                           
  1922  39             RTS                               
  1923  .db 14 46 32 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F2 note:       
  1933  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1938
FUN_M75_r4_08000__1938:
  1938  3436           PSHS  Y X B A                     
  193a  FC7134         LDD 0x7134                        
  193d  AD9FFE0A       JSR [0xfe0a]                      
  1941  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  1945  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__194b:
  194b  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__194d
FUN_M75_r4_08000__194d:
  194d  3476           PSHS  U Y X B A                   
  194f  8E18D9         LDX #0x18d9                       
  1952  AD9FFE76       JSR [0xfe76]                      
  1956  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  195a  17CA           dw 17CAh                          
LAB_M75_r4_08000__195c:
  195c  1F01           TFR D,X                           
  195e  17FD95         LBSR 0x16f6                       
  1961  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__19d7_M75_r4_08000__1963:
  1963  19D7           addr M75_r4_08000::19d7           
  1965  19C2           addr M75_r4_08000::19c2           
  1967  .db 19 A1 70 80 70 E0 00 00 71 40 00 08 00 66 1A 00  ; ..p.p...q@...f..
  1977  .db 00 00 80 00 01 00 04 23 19 AD 00 00 00 00 00 00  ; .......#........
  1987  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1989
FUN_M75_r4_08000__1989:
  1989  3410           PSHS  X                           
  198b  8E1963         LDX #0x1963                       
  198e  AD9FFE74       JSR [0xfe74]                      
  1992  3510           PULS  X                           
  1994  39             RTS                               

; ---- function FUN_M75_r4_08000__1995
FUN_M75_r4_08000__1995:
  1995  3410           PSHS  X                           
  1997  8E1963         LDX #0x1963                        ; desc[API_FE22]: ->$19D7 ->$19C2
  199a  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  199e  3510           PULS  X                           
  19a0  39             RTS                               

; ---- function FUN_M75_r4_08000__19a1
FUN_M75_r4_08000__19a1:
  19a1  3410           PSHS  X                           
  19a3  8E1963         LDX #0x1963                       
  19a6  AD9FFE70       JSR [0xfe70]                      
  19aa  3510           PULS  X                           
  19ac  39             RTS                               
  19ad  .db 14 46 33 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F3 note:       
  19bd  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__19c2
FUN_M75_r4_08000__19c2:
  19c2  3436           PSHS  Y X B A                     
  19c4  FC7140         LDD 0x7140                        
  19c7  AD9FFE0A       JSR [0xfe0a]                      
  19cb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  19cf  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__19d5:
  19d5  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__19d7
FUN_M75_r4_08000__19d7:
  19d7  3476           PSHS  U Y X B A                   
  19d9  8E1963         LDX #0x1963                       
  19dc  AD9FFE76       JSR [0xfe76]                      
  19e0  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  19e4  174C           dw 174Ch                          
LAB_M75_r4_08000__19e6:
  19e6  1F01           TFR D,X                           
  19e8  17FD0B         LBSR 0x16f6                       
  19eb  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__1a61_M75_r4_08000__19ed:
  19ed  1A61           addr M75_r4_08000::1a61           
  19ef  1A4C           addr M75_r4_08000::1a4c           
  19f1  .db 1A 2B 70 8C 70 EC 00 00 71 4C 00 08 00 70 20 00  ; .+p.p...qL...p .
  1a01  .db 00 00 80 00 01 00 04 23 1A 37 00 00 00 00 00 00  ; .......#.7......
  1a11  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1a13
FUN_M75_r4_08000__1a13:
  1a13  3410           PSHS  X                           
  1a15  8E19ED         LDX #0x19ed                       
  1a18  AD9FFE74       JSR [0xfe74]                      
  1a1c  3510           PULS  X                           
  1a1e  39             RTS                               

; ---- function FUN_M75_r4_08000__1a1f
FUN_M75_r4_08000__1a1f:
  1a1f  3410           PSHS  X                           
  1a21  8E19ED         LDX #0x19ed                        ; desc[API_FE22]: ->$1A61 ->$1A4C
  1a24  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1a28  3510           PULS  X                           
  1a2a  39             RTS                               

; ---- function FUN_M75_r4_08000__1a2b
FUN_M75_r4_08000__1a2b:
  1a2b  3410           PSHS  X                           
  1a2d  8E19ED         LDX #0x19ed                       
  1a30  AD9FFE70       JSR [0xfe70]                      
  1a34  3510           PULS  X                           
  1a36  39             RTS                               
  1a37  .db 14 46 34 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F4 note:       
  1a47  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1a4c
FUN_M75_r4_08000__1a4c:
  1a4c  3436           PSHS  Y X B A                     
  1a4e  FC714C         LDD 0x714c                        
  1a51  AD9FFE0A       JSR [0xfe0a]                      
  1a55  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  1a59  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__1a5f:
  1a5f  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1a61
FUN_M75_r4_08000__1a61:
  1a61  3476           PSHS  U Y X B A                   
  1a63  8E19ED         LDX #0x19ed                       
  1a66  AD9FFE76       JSR [0xfe76]                      
  1a6a  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  1a6e  16CE           dw 16CEh                          
LAB_M75_r4_08000__1a70:
  1a70  1F01           TFR D,X                           
  1a72  17FC81         LBSR 0x16f6                       
  1a75  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__1aeb_M75_r4_08000__1a77:
  1a77  1AEB           addr M75_r4_08000::1aeb           
  1a79  1AD6           addr M75_r4_08000::1ad6           
  1a7b  .db 1A B5 70 98 70 F8 00 00 71 58 00 08 00 7A 26 00  ; ..p.p...qX...z&.
  1a8b  .db 00 00 80 00 01 00 04 23 1A C1 00 00 00 00 00 00  ; .......#........
  1a9b  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1a9d
FUN_M75_r4_08000__1a9d:
  1a9d  3410           PSHS  X                           
  1a9f  8E1A77         LDX #0x1a77                       
  1aa2  AD9FFE74       JSR [0xfe74]                      
  1aa6  3510           PULS  X                           
  1aa8  39             RTS                               

; ---- function FUN_M75_r4_08000__1aa9
FUN_M75_r4_08000__1aa9:
  1aa9  3410           PSHS  X                           
  1aab  8E1A77         LDX #0x1a77                        ; desc[API_FE22]: ->$1AEB ->$1AD6
  1aae  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1ab2  3510           PULS  X                           
  1ab4  39             RTS                               

; ---- function FUN_M75_r4_08000__1ab5
FUN_M75_r4_08000__1ab5:
  1ab5  3410           PSHS  X                           
  1ab7  8E1A77         LDX #0x1a77                       
  1aba  AD9FFE70       JSR [0xfe70]                      
  1abe  3510           PULS  X                           
  1ac0  39             RTS                               
  1ac1  .db 14 46 35 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F5 note:       
  1ad1  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1ad6
FUN_M75_r4_08000__1ad6:
  1ad6  3436           PSHS  Y X B A                     
  1ad8  FC7158         LDD 0x7158                        
  1adb  AD9FFE0A       JSR [0xfe0a]                      
  1adf  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  1ae3  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__1ae9:
  1ae9  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1aeb
FUN_M75_r4_08000__1aeb:
  1aeb  3476           PSHS  U Y X B A                   
  1aed  8E1A77         LDX #0x1a77                       
  1af0  AD9FFE76       JSR [0xfe76]                      
  1af4  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  1af8  1650           dw 1650h                          
LAB_M75_r4_08000__1afa:
  1afa  1F01           TFR D,X                           
  1afc  17FBF7         LBSR 0x16f6                       
  1aff  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__1b75_M75_r4_08000__1b01:
  1b01  1B75           addr M75_r4_08000::1b75           
  1b03  1B60           addr M75_r4_08000::1b60           
  1b05  .db 1B 3F 70 A4 71 04 00 00 71 64 00 08 00 84 2C 00  ; .?p.q...qd....,.
  1b15  .db 00 00 80 00 01 00 04 23 1B 4B 00 00 00 00 00 00  ; .......#.K......
  1b25  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1b27
FUN_M75_r4_08000__1b27:
  1b27  3410           PSHS  X                           
  1b29  8E1B01         LDX #0x1b01                       
  1b2c  AD9FFE74       JSR [0xfe74]                      
  1b30  3510           PULS  X                           
  1b32  39             RTS                               

; ---- function FUN_M75_r4_08000__1b33
FUN_M75_r4_08000__1b33:
  1b33  3410           PSHS  X                           
  1b35  8E1B01         LDX #0x1b01                        ; desc[API_FE22]: ->$1B75 ->$1B60
  1b38  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1b3c  3510           PULS  X                           
  1b3e  39             RTS                               

; ---- function FUN_M75_r4_08000__1b3f
FUN_M75_r4_08000__1b3f:
  1b3f  3410           PSHS  X                           
  1b41  8E1B01         LDX #0x1b01                       
  1b44  AD9FFE70       JSR [0xfe70]                      
  1b48  3510           PULS  X                           
  1b4a  39             RTS                               
  1b4b  .db 14 46 36 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F6 note:       
  1b5b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1b60
FUN_M75_r4_08000__1b60:
  1b60  3436           PSHS  Y X B A                     
  1b62  FC7164         LDD 0x7164                        
  1b65  AD9FFE0A       JSR [0xfe0a]                      
  1b69  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  1b6d  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__1b73:
  1b73  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1b75
FUN_M75_r4_08000__1b75:
  1b75  3476           PSHS  U Y X B A                   
  1b77  8E1B01         LDX #0x1b01                       
  1b7a  AD9FFE76       JSR [0xfe76]                      
  1b7e  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  1b82  15D2           dw 15D2h                          
LAB_M75_r4_08000__1b84:
  1b84  1F01           TFR D,X                           
  1b86  17FB6D         LBSR 0x16f6                       
  1b89  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__1bff_M75_r4_08000__1b8b:
  1b8b  1BFF           addr M75_r4_08000::1bff           
  1b8d  1BEA           addr M75_r4_08000::1bea           
  1b8f  .db 1B C9 70 B0 71 10 00 00 71 70 00 08 00 8E 32 00  ; ..p.q...qp....2.
  1b9f  .db 00 00 80 00 01 00 04 23 1B D5 00 00 00 00 00 00  ; .......#........
  1baf  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1bb1
FUN_M75_r4_08000__1bb1:
  1bb1  3410           PSHS  X                           
  1bb3  8E1B8B         LDX #0x1b8b                       
  1bb6  AD9FFE74       JSR [0xfe74]                      
  1bba  3510           PULS  X                           
  1bbc  39             RTS                               

; ---- function FUN_M75_r4_08000__1bbd
FUN_M75_r4_08000__1bbd:
  1bbd  3410           PSHS  X                           
  1bbf  8E1B8B         LDX #0x1b8b                        ; desc[API_FE22]: ->$1BFF ->$1BEA
  1bc2  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1bc6  3510           PULS  X                           
  1bc8  39             RTS                               

; ---- function FUN_M75_r4_08000__1bc9
FUN_M75_r4_08000__1bc9:
  1bc9  3410           PSHS  X                           
  1bcb  8E1B8B         LDX #0x1b8b                       
  1bce  AD9FFE70       JSR [0xfe70]                      
  1bd2  3510           PULS  X                           
  1bd4  39             RTS                               
  1bd5  .db 14 46 37 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F7 note:       
  1be5  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1bea
FUN_M75_r4_08000__1bea:
  1bea  3436           PSHS  Y X B A                     
  1bec  FC7170         LDD 0x7170                        
  1bef  AD9FFE0A       JSR [0xfe0a]                      
  1bf3  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  1bf7  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__1bfd:
  1bfd  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1bff
FUN_M75_r4_08000__1bff:
  1bff  3476           PSHS  U Y X B A                   
  1c01  8E1B8B         LDX #0x1b8b                       
  1c04  AD9FFE76       JSR [0xfe76]                      
  1c08  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  1c0c  1554           dw 1554h                          
LAB_M75_r4_08000__1c0e:
  1c0e  1F01           TFR D,X                           
  1c10  17FAE3         LBSR 0x16f6                       
  1c13  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__1c89_M75_r4_08000__1c15:
  1c15  1C89           addr M75_r4_08000::1c89           
  1c17  1C74           addr M75_r4_08000::1c74           
  1c19  .db 1C 53 70 BC 71 1C 00 00 71 7C 00 08 00 98 38 00  ; .Sp.q...q|....8.
  1c29  .db 00 00 80 00 01 00 04 23 1C 5F 00 00 00 00 00 00  ; .......#._......
  1c39  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1c3b
FUN_M75_r4_08000__1c3b:
  1c3b  3410           PSHS  X                           
  1c3d  8E1C15         LDX #0x1c15                       
  1c40  AD9FFE74       JSR [0xfe74]                      
  1c44  3510           PULS  X                           
  1c46  39             RTS                               

; ---- function FUN_M75_r4_08000__1c47
FUN_M75_r4_08000__1c47:
  1c47  3410           PSHS  X                           
  1c49  8E1C15         LDX #0x1c15                        ; desc[API_FE22]: ->$1C89 ->$1C74
  1c4c  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1c50  3510           PULS  X                           
  1c52  39             RTS                               

; ---- function FUN_M75_r4_08000__1c53
FUN_M75_r4_08000__1c53:
  1c53  3410           PSHS  X                           
  1c55  8E1C15         LDX #0x1c15                       
  1c58  AD9FFE70       JSR [0xfe70]                      
  1c5c  3510           PULS  X                           
  1c5e  39             RTS                               
  1c5f  .db 14 46 38 20 6E 6F 74 65 3A 20 20 20 20 20 20 20  ; .F8 note:       
  1c6f  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1c74
FUN_M75_r4_08000__1c74:
  1c74  3436           PSHS  Y X B A                     
  1c76  FC717C         LDD 0x717c                        
  1c79  AD9FFE0A       JSR [0xfe0a]                      
  1c7d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1E}{3:60AB}"
  1c81  021E0360AB00   char[6] 02h,1Eh,03h,"`",ABh       
LAB_M75_r4_08000__1c87:
  1c87  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1c89
FUN_M75_r4_08000__1c89:
  1c89  3476           PSHS  U Y X B A                   
  1c8b  8E1C15         LDX #0x1c15                       
  1c8e  AD9FFE76       JSR [0xfe76]                      
  1c92  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  1c96  14D6           dw 14D6h                          
LAB_M75_r4_08000__1c98:
  1c98  1F01           TFR D,X                           
  1c9a  17FA59         LBSR 0x16f6                       
  1c9d  35F6           PULS  A B X Y U PC                

; ---- function FUN_M75_r4_08000__1c9f
FUN_M75_r4_08000__1c9f:
  1c9f  3436           PSHS  Y X B A                     
  1ca1  8E184F         LDX #0x184f                       
  1ca4  AD9FFE76       JSR [0xfe76]                      
  1ca8  8E18D9         LDX #0x18d9                       
  1cab  AD9FFE76       JSR [0xfe76]                      
  1caf  8E1963         LDX #0x1963                       
  1cb2  AD9FFE76       JSR [0xfe76]                      
  1cb6  8E19ED         LDX #0x19ed                       
  1cb9  AD9FFE76       JSR [0xfe76]                      
  1cbd  8E1A77         LDX #0x1a77                       
  1cc0  AD9FFE76       JSR [0xfe76]                      
  1cc4  8E1B01         LDX #0x1b01                       
  1cc7  AD9FFE76       JSR [0xfe76]                      
  1ccb  8E1B8B         LDX #0x1b8b                       
  1cce  AD9FFE76       JSR [0xfe76]                      
  1cd2  8E1C15         LDX #0x1c15                       
  1cd5  AD9FFE76       JSR [0xfe76]                      
  1cd9  F67129         LDB 0x7129                        
  1cdc  F7721F         STB 0x721f                        
  1cdf  F67135         LDB 0x7135                        
  1ce2  F77220         STB 0x7220                        
  1ce5  F67141         LDB 0x7141                        
  1ce8  F77221         STB 0x7221                        
  1ceb  F6714D         LDB 0x714d                        
  1cee  F77222         STB 0x7222                        
  1cf1  F67159         LDB 0x7159                        
  1cf4  F77223         STB 0x7223                        
  1cf7  F67165         LDB 0x7165                        
  1cfa  F77224         STB 0x7224                        
  1cfd  F67171         LDB 0x7171                        
  1d00  F77225         STB 0x7225                        
  1d03  F6717D         LDB 0x717d                        
  1d06  F77226         STB 0x7226                        
  1d09  171821         LBSR 0x352d                       
  1d0c  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1d0e
FUN_M75_r4_08000__1d0e:
  1d0e  3436           PSHS  Y X B A                     
  1d10  4F             CLRA                              
  1d11  F6721F         LDB 0x721f                        
  1d14  FD7068         STD 0x7068                        
  1d17  17FBA9         LBSR 0x18c3                       
  1d1a  F67220         LDB 0x7220                        
  1d1d  FD7074         STD 0x7074                        
  1d20  17FC2A         LBSR 0x194d                       
  1d23  F67221         LDB 0x7221                        
  1d26  FD7080         STD 0x7080                        
  1d29  17FCAB         LBSR 0x19d7                       
  1d2c  F67222         LDB 0x7222                        
  1d2f  FD708C         STD 0x708c                        
  1d32  17FD2C         LBSR 0x1a61                       
  1d35  F67223         LDB 0x7223                        
  1d38  FD7098         STD 0x7098                        
  1d3b  17FDAD         LBSR 0x1aeb                       
  1d3e  F67224         LDB 0x7224                        
  1d41  FD70A4         STD 0x70a4                        
  1d44  17FE2E         LBSR 0x1b75                       
  1d47  F67225         LDB 0x7225                        
  1d4a  FD70B0         STD 0x70b0                        
  1d4d  17FEAF         LBSR 0x1bff                       
  1d50  F67226         LDB 0x7226                        
  1d53  FD70BC         STD 0x70bc                        
  1d56  17FF30         LBSR 0x1c89                       
  1d59  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__1d5b
FUN_M75_r4_08000__1d5b:
  1d5b  171905         LBSR 0x3663                       
  1d5e  39             RTS                               
PTR_FUN_M75_r4_08000__1dca_M75_r4_08000__1d5f:
  1d5f  1DCA           addr M75_r4_08000::1dca           
  1d61  1DA9           addr M75_r4_08000::1da9           
  1d63  .db 1D 9D 70 64 70 C4 00 00 71 24 00 08 00 4F 0C FF  ; ..pdp...q$...O..
  1d73  .db 9C 00 64 00 01 00 04 1D 1D B5 00 00 00 00 00 00  ; ..d.............
  1d83  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1d85
FUN_M75_r4_08000__1d85:
  1d85  3410           PSHS  X                           
  1d87  8E1D5F         LDX #0x1d5f                        ; desc[API_FE6A]: ->$1DCA ->$1DA9
  1d8a  AD9FFE6A       JSR [0xfe6a]                      
  1d8e  3510           PULS  X                           
  1d90  39             RTS                               

; ---- function FUN_M75_r4_08000__1d91
FUN_M75_r4_08000__1d91:
  1d91  3410           PSHS  X                           
  1d93  8E1D5F         LDX #0x1d5f                        ; desc[API_FDBC]: ->$1DCA ->$1DA9
  1d96  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..._"
  1d9a  3510           PULS  X                           
  1d9c  39             RTS                               

; ---- function FUN_M75_r4_08000__1d9d
FUN_M75_r4_08000__1d9d:
  1d9d  3410           PSHS  X                           
  1d9f  8E1D5F         LDX #0x1d5f                        ; desc[API_FE6C]: ->$1DCA ->$1DA9
  1da2  AD9FFE6C       JSR [0xfe6c]                      
  1da6  3510           PULS  X                           
  1da8  39             RTS                               

; ---- function FUN_M75_r4_08000__1da9
FUN_M75_r4_08000__1da9:
  1da9  3410           PSHS  X                           
  1dab  8E1D5F         LDX #0x1d5f                        ; desc[API_FE6E]: ->$1DCA ->$1DA9
  1dae  AD9FFE6E       JSR [0xfe6e]                      
  1db2  3510           PULS  X                           
  1db4  39             RTS                               
  1db5  .db 14 46 31 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F1 out:       %
  1dc5  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1dca
FUN_M75_r4_08000__1dca:
  1dca  3476           PSHS  U Y X B A                   
  1dcc  8E1D5F         LDX #0x1d5f                       
  1dcf  AD9FFE76       JSR [0xfe76]                      
  1dd3  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  1dd7  1341           dw 1341h                          
LAB_M75_r4_08000__1dd9:
  1dd9  1F01           TFR D,X                           
  1ddb  171638         LBSR 0x3416                       
  1dde  3576           PULS  A B X Y U                   
  1de0  39             RTS                               
PTR_FUN_M75_r4_08000__1e4c_M75_r4_08000__1de1:
  1de1  1E4C           addr M75_r4_08000::1e4c           
  1de3  1E2B           addr M75_r4_08000::1e2b           
  1de5  .db 1E 1F 70 70 70 D0 00 00 71 30 00 08 00 59 12 FF  ; ..ppp...q0...Y..
  1df5  .db 9C 00 64 00 01 00 04 1D 1E 37 00 00 00 00 00 00  ; ..d......7......
  1e05  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1e07
FUN_M75_r4_08000__1e07:
  1e07  3410           PSHS  X                           
  1e09  8E1DE1         LDX #0x1de1                        ; desc[API_FE6A]: ->$1E4C ->$1E2B
  1e0c  AD9FFE6A       JSR [0xfe6a]                      
  1e10  3510           PULS  X                           
  1e12  39             RTS                               

; ---- function FUN_M75_r4_08000__1e13
FUN_M75_r4_08000__1e13:
  1e13  3410           PSHS  X                           
  1e15  8E1DE1         LDX #0x1de1                        ; desc[API_FDBC]: ->$1E4C ->$1E2B
  1e18  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1e1c  3510           PULS  X                           
  1e1e  39             RTS                               

; ---- function FUN_M75_r4_08000__1e1f
FUN_M75_r4_08000__1e1f:
  1e1f  3410           PSHS  X                           
  1e21  8E1DE1         LDX #0x1de1                        ; desc[API_FE6C]: ->$1E4C ->$1E2B
  1e24  AD9FFE6C       JSR [0xfe6c]                      
  1e28  3510           PULS  X                           
  1e2a  39             RTS                               

; ---- function FUN_M75_r4_08000__1e2b
FUN_M75_r4_08000__1e2b:
  1e2b  3410           PSHS  X                           
  1e2d  8E1DE1         LDX #0x1de1                        ; desc[API_FE6E]: ->$1E4C ->$1E2B
  1e30  AD9FFE6E       JSR [0xfe6e]                      
  1e34  3510           PULS  X                           
  1e36  39             RTS                               
  1e37  .db 14 46 32 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F2 out:       %
  1e47  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1e4c
FUN_M75_r4_08000__1e4c:
  1e4c  3476           PSHS  U Y X B A                   
  1e4e  8E1DE1         LDX #0x1de1                       
  1e51  AD9FFE76       JSR [0xfe76]                      
  1e55  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  1e59  12CB           dw 12CBh                          
LAB_M75_r4_08000__1e5b:
  1e5b  1F01           TFR D,X                           
  1e5d  1715B6         LBSR 0x3416                       
  1e60  3576           PULS  A B X Y U                   
  1e62  39             RTS                               
PTR_FUN_M75_r4_08000__1ece_M75_r4_08000__1e63:
  1e63  1ECE           addr M75_r4_08000::1ece           
  1e65  1EAD           addr M75_r4_08000::1ead           
  1e67  .db 1E A1 70 7C 70 DC 00 00 71 3C 00 08 00 63 18 FF  ; ..p|p...q<...c..
  1e77  .db 9C 00 64 00 01 00 04 1D 1E B9 00 00 00 00 00 00  ; ..d.............
  1e87  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1e89
FUN_M75_r4_08000__1e89:
  1e89  3410           PSHS  X                           
  1e8b  8E1E63         LDX #0x1e63                        ; desc[API_FE6A]: ->$1ECE ->$1EAD
  1e8e  AD9FFE6A       JSR [0xfe6a]                      
  1e92  3510           PULS  X                           
  1e94  39             RTS                               

; ---- function FUN_M75_r4_08000__1e95
FUN_M75_r4_08000__1e95:
  1e95  3410           PSHS  X                           
  1e97  8E1E63         LDX #0x1e63                        ; desc[API_FDBC]: ->$1ECE ->$1EAD
  1e9a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...c"
  1e9e  3510           PULS  X                           
  1ea0  39             RTS                               

; ---- function FUN_M75_r4_08000__1ea1
FUN_M75_r4_08000__1ea1:
  1ea1  3410           PSHS  X                           
  1ea3  8E1E63         LDX #0x1e63                        ; desc[API_FE6C]: ->$1ECE ->$1EAD
  1ea6  AD9FFE6C       JSR [0xfe6c]                      
  1eaa  3510           PULS  X                           
  1eac  39             RTS                               

; ---- function FUN_M75_r4_08000__1ead
FUN_M75_r4_08000__1ead:
  1ead  3410           PSHS  X                           
  1eaf  8E1E63         LDX #0x1e63                        ; desc[API_FE6E]: ->$1ECE ->$1EAD
  1eb2  AD9FFE6E       JSR [0xfe6e]                      
  1eb6  3510           PULS  X                           
  1eb8  39             RTS                               
  1eb9  .db 14 46 33 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F3 out:       %
  1ec9  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1ece
FUN_M75_r4_08000__1ece:
  1ece  3476           PSHS  U Y X B A                   
  1ed0  8E1E63         LDX #0x1e63                       
  1ed3  AD9FFE76       JSR [0xfe76]                      
  1ed7  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  1edb  1255           dw 1255h                          
LAB_M75_r4_08000__1edd:
  1edd  1F01           TFR D,X                           
  1edf  171534         LBSR 0x3416                       
  1ee2  3576           PULS  A B X Y U                   
  1ee4  39             RTS                               
PTR_FUN_M75_r4_08000__1f50_M75_r4_08000__1ee5:
  1ee5  1F50           addr M75_r4_08000::1f50           
  1ee7  1F2F           addr M75_r4_08000::1f2f           
  1ee9  .db 1F 23 70 88 70 E8 00 00 71 48 00 08 00 6D 1E FF  ; .#p.p...qH...m..
  1ef9  .db 9C 00 64 00 01 00 04 1D 1F 3B 00 00 00 00 00 00  ; ..d......;......
  1f09  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1f0b
FUN_M75_r4_08000__1f0b:
  1f0b  3410           PSHS  X                           
  1f0d  8E1EE5         LDX #0x1ee5                        ; desc[API_FE6A]: ->$1F50 ->$1F2F
  1f10  AD9FFE6A       JSR [0xfe6a]                      
  1f14  3510           PULS  X                           
  1f16  39             RTS                               

; ---- function FUN_M75_r4_08000__1f17
FUN_M75_r4_08000__1f17:
  1f17  3410           PSHS  X                           
  1f19  8E1EE5         LDX #0x1ee5                        ; desc[API_FDBC]: ->$1F50 ->$1F2F
  1f1c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1f20  3510           PULS  X                           
  1f22  39             RTS                               

; ---- function FUN_M75_r4_08000__1f23
FUN_M75_r4_08000__1f23:
  1f23  3410           PSHS  X                           
  1f25  8E1EE5         LDX #0x1ee5                        ; desc[API_FE6C]: ->$1F50 ->$1F2F
  1f28  AD9FFE6C       JSR [0xfe6c]                      
  1f2c  3510           PULS  X                           
  1f2e  39             RTS                               

; ---- function FUN_M75_r4_08000__1f2f
FUN_M75_r4_08000__1f2f:
  1f2f  3410           PSHS  X                           
  1f31  8E1EE5         LDX #0x1ee5                        ; desc[API_FE6E]: ->$1F50 ->$1F2F
  1f34  AD9FFE6E       JSR [0xfe6e]                      
  1f38  3510           PULS  X                           
  1f3a  39             RTS                               
  1f3b  .db 14 46 34 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F4 out:       %
  1f4b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1f50
FUN_M75_r4_08000__1f50:
  1f50  3476           PSHS  U Y X B A                   
  1f52  8E1EE5         LDX #0x1ee5                       
  1f55  AD9FFE76       JSR [0xfe76]                      
  1f59  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  1f5d  11DF           dw 11DFh                          
LAB_M75_r4_08000__1f5f:
  1f5f  1F01           TFR D,X                           
  1f61  1714B2         LBSR 0x3416                       
  1f64  3576           PULS  A B X Y U                   
  1f66  39             RTS                               
PTR_FUN_M75_r4_08000__1fd2_M75_r4_08000__1f67:
  1f67  1FD2           addr M75_r4_08000::1fd2           
  1f69  1FB1           addr M75_r4_08000::1fb1           
  1f6b  .db 1F A5 70 94 70 F4 00 00 71 54 00 08 00 77 24 FF  ; ..p.p...qT...w$.
  1f7b  .db 9C 00 64 00 01 00 04 1D 1F BD 00 00 00 00 00 00  ; ..d.............
  1f8b  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__1f8d
FUN_M75_r4_08000__1f8d:
  1f8d  3410           PSHS  X                           
  1f8f  8E1F67         LDX #0x1f67                        ; desc[API_FE6A]: ->$1FD2 ->$1FB1
  1f92  AD9FFE6A       JSR [0xfe6a]                      
  1f96  3510           PULS  X                           
  1f98  39             RTS                               

; ---- function FUN_M75_r4_08000__1f99
FUN_M75_r4_08000__1f99:
  1f99  3410           PSHS  X                           
  1f9b  8E1F67         LDX #0x1f67                        ; desc[API_FDBC]: ->$1FD2 ->$1FB1
  1f9e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...g"
  1fa2  3510           PULS  X                           
  1fa4  39             RTS                               

; ---- function FUN_M75_r4_08000__1fa5
FUN_M75_r4_08000__1fa5:
  1fa5  3410           PSHS  X                           
  1fa7  8E1F67         LDX #0x1f67                        ; desc[API_FE6C]: ->$1FD2 ->$1FB1
  1faa  AD9FFE6C       JSR [0xfe6c]                      
  1fae  3510           PULS  X                           
  1fb0  39             RTS                               

; ---- function FUN_M75_r4_08000__1fb1
FUN_M75_r4_08000__1fb1:
  1fb1  3410           PSHS  X                           
  1fb3  8E1F67         LDX #0x1f67                        ; desc[API_FE6E]: ->$1FD2 ->$1FB1
  1fb6  AD9FFE6E       JSR [0xfe6e]                      
  1fba  3510           PULS  X                           
  1fbc  39             RTS                               
  1fbd  .db 14 46 35 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F5 out:       %
  1fcd  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__1fd2
FUN_M75_r4_08000__1fd2:
  1fd2  3476           PSHS  U Y X B A                   
  1fd4  8E1F67         LDX #0x1f67                       
  1fd7  AD9FFE76       JSR [0xfe76]                      
  1fdb  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  1fdf  1169           dw 1169h                          
LAB_M75_r4_08000__1fe1:
  1fe1  1F01           TFR D,X                           
  1fe3  171430         LBSR 0x3416                       
  1fe6  3576           PULS  A B X Y U                   
  1fe8  39             RTS                               
PTR_FUN_M75_r4_08000__2054_M75_r4_08000__1fe9:
  1fe9  2054           addr M75_r4_08000::2054           
  1feb  2033           addr M75_r4_08000::2033           
  1fed  .db 20 27 70 A0 71 00 00 00 71 60 00 08 00 81 2A FF  ;  'p.q...q`....*.
  1ffd  .db 9C 00 64 00 01 00 04 1D 20 3F 00 00 00 00 00 00  ; ..d..... ?......
  200d  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__200f
FUN_M75_r4_08000__200f:
  200f  3410           PSHS  X                           
  2011  8E1FE9         LDX #0x1fe9                        ; desc[API_FE6A]: ->$2054 ->$2033
  2014  AD9FFE6A       JSR [0xfe6a]                      
  2018  3510           PULS  X                           
  201a  39             RTS                               

; ---- function FUN_M75_r4_08000__201b
FUN_M75_r4_08000__201b:
  201b  3410           PSHS  X                           
  201d  8E1FE9         LDX #0x1fe9                        ; desc[API_FDBC]: ->$2054 ->$2033
  2020  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  2024  3510           PULS  X                           
  2026  39             RTS                               

; ---- function FUN_M75_r4_08000__2027
FUN_M75_r4_08000__2027:
  2027  3410           PSHS  X                           
  2029  8E1FE9         LDX #0x1fe9                        ; desc[API_FE6C]: ->$2054 ->$2033
  202c  AD9FFE6C       JSR [0xfe6c]                      
  2030  3510           PULS  X                           
  2032  39             RTS                               

; ---- function FUN_M75_r4_08000__2033
FUN_M75_r4_08000__2033:
  2033  3410           PSHS  X                           
  2035  8E1FE9         LDX #0x1fe9                        ; desc[API_FE6E]: ->$2054 ->$2033
  2038  AD9FFE6E       JSR [0xfe6e]                      
  203c  3510           PULS  X                           
  203e  39             RTS                               
  203f  .db 14 46 36 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F6 out:       %
  204f  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2054
FUN_M75_r4_08000__2054:
  2054  3476           PSHS  U Y X B A                   
  2056  8E1FE9         LDX #0x1fe9                       
  2059  AD9FFE76       JSR [0xfe76]                      
  205d  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  2061  10F3           dw 10F3h                          
LAB_M75_r4_08000__2063:
  2063  1F01           TFR D,X                           
  2065  1713AE         LBSR 0x3416                       
  2068  3576           PULS  A B X Y U                   
  206a  39             RTS                               
PTR_FUN_M75_r4_08000__20d6_M75_r4_08000__206b:
  206b  20D6           addr M75_r4_08000::20d6           
  206d  20B5           addr M75_r4_08000::20b5           
  206f  .db 20 A9 70 AC 71 0C 00 00 71 6C 00 08 00 8B 30 FF  ;  .p.q...ql....0.
  207f  .db 9C 00 64 00 01 00 04 1D 20 C1 00 00 00 00 00 00  ; ..d..... .......
  208f  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2091
FUN_M75_r4_08000__2091:
  2091  3410           PSHS  X                           
  2093  8E206B         LDX #0x206b                        ; desc[API_FE6A]: ->$20D6 ->$20B5
  2096  AD9FFE6A       JSR [0xfe6a]                      
  209a  3510           PULS  X                           
  209c  39             RTS                               

; ---- function FUN_M75_r4_08000__209d
FUN_M75_r4_08000__209d:
  209d  3410           PSHS  X                           
  209f  8E206B         LDX #0x206b                        ; desc[API_FDBC]: ->$20D6 ->$20B5
  20a2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.. k"
  20a6  3510           PULS  X                           
  20a8  39             RTS                               

; ---- function FUN_M75_r4_08000__20a9
FUN_M75_r4_08000__20a9:
  20a9  3410           PSHS  X                           
  20ab  8E206B         LDX #0x206b                        ; desc[API_FE6C]: ->$20D6 ->$20B5
  20ae  AD9FFE6C       JSR [0xfe6c]                      
  20b2  3510           PULS  X                           
  20b4  39             RTS                               

; ---- function FUN_M75_r4_08000__20b5
FUN_M75_r4_08000__20b5:
  20b5  3410           PSHS  X                           
  20b7  8E206B         LDX #0x206b                        ; desc[API_FE6E]: ->$20D6 ->$20B5
  20ba  AD9FFE6E       JSR [0xfe6e]                      
  20be  3510           PULS  X                           
  20c0  39             RTS                               
  20c1  .db 14 46 37 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F7 out:       %
  20d1  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__20d6
FUN_M75_r4_08000__20d6:
  20d6  3476           PSHS  U Y X B A                   
  20d8  8E206B         LDX #0x206b                       
  20db  AD9FFE76       JSR [0xfe76]                      
  20df  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  20e3  107D           dw 107Dh                          
LAB_M75_r4_08000__20e5:
  20e5  1F01           TFR D,X                           
  20e7  17132C         LBSR 0x3416                       
  20ea  3576           PULS  A B X Y U                   
  20ec  39             RTS                               
PTR_FUN_M75_r4_08000__2158_M75_r4_08000__20ed:
  20ed  2158           addr M75_r4_08000::2158           
  20ef  2137           addr M75_r4_08000::2137           
  20f1  .db 21 2B 70 B8 71 18 00 00 71 78 00 08 00 95 36 FF  ; !+p.q...qx....6.
  2101  .db 9C 00 64 00 01 00 04 1D 21 43 00 00 00 00 00 00  ; ..d.....!C......
  2111  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2113
FUN_M75_r4_08000__2113:
  2113  3410           PSHS  X                           
  2115  8E20ED         LDX #0x20ed                        ; desc[API_FE6A]: ->$2158 ->$2137
  2118  AD9FFE6A       JSR [0xfe6a]                      
  211c  3510           PULS  X                           
  211e  39             RTS                               

; ---- function FUN_M75_r4_08000__211f
FUN_M75_r4_08000__211f:
  211f  3410           PSHS  X                           
  2121  8E20ED         LDX #0x20ed                        ; desc[API_FDBC]: ->$2158 ->$2137
  2124  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.. ."
  2128  3510           PULS  X                           
  212a  39             RTS                               

; ---- function FUN_M75_r4_08000__212b
FUN_M75_r4_08000__212b:
  212b  3410           PSHS  X                           
  212d  8E20ED         LDX #0x20ed                        ; desc[API_FE6C]: ->$2158 ->$2137
  2130  AD9FFE6C       JSR [0xfe6c]                      
  2134  3510           PULS  X                           
  2136  39             RTS                               

; ---- function FUN_M75_r4_08000__2137
FUN_M75_r4_08000__2137:
  2137  3410           PSHS  X                           
  2139  8E20ED         LDX #0x20ed                        ; desc[API_FE6E]: ->$2158 ->$2137
  213c  AD9FFE6E       JSR [0xfe6e]                      
  2140  3510           PULS  X                           
  2142  39             RTS                               
  2143  .db 14 46 38 20 6F 75 74 3A 20 20 20 20 20 20 20 25  ; .F8 out:       %
  2153  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2158
FUN_M75_r4_08000__2158:
  2158  3476           PSHS  U Y X B A                   
  215a  8E20ED         LDX #0x20ed                       
  215d  AD9FFE76       JSR [0xfe76]                      
  2161  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  2165  1007           dw 1007h                          
LAB_M75_r4_08000__2167:
  2167  1F01           TFR D,X                           
  2169  1712AA         LBSR 0x3416                       
  216c  3576           PULS  A B X Y U                   
  216e  39             RTS                               
  216f  21E421B921AD   addr[3]                           
  2175  .db 70 66 70 C6 00 00 71 26 00 08 00 51 0D 00 00 00  ; pfp...q&...Q....
  2185  .db 16 00 01 00 17 11 21 C5 00 00 25 C7 00 00 00 00  ; ......!...%.....

; ---- function FUN_M75_r4_08000__2195
FUN_M75_r4_08000__2195:
  2195  3410           PSHS  X                           
  2197  8E216F         LDX #0x216f                       
  219a  AD9FFC4E       JSR [0xfc4e]                      
  219e  3510           PULS  X                           
  21a0  39             RTS                               

; ---- function FUN_M75_r4_08000__21a1
FUN_M75_r4_08000__21a1:
  21a1  3410           PSHS  X                           
  21a3  8E216F         LDX #0x216f                       
  21a6  AD9FFC4C       JSR [0xfc4c]                      
  21aa  3510           PULS  X                           
  21ac  39             RTS                               

; ---- function FUN_M75_r4_08000__21ad
FUN_M75_r4_08000__21ad:
  21ad  3410           PSHS  X                           
  21af  8E216F         LDX #0x216f                       
  21b2  AD9FFC50       JSR [0xfc50]                      
  21b6  3510           PULS  X                           
  21b8  39             RTS                               

; ---- function FUN_M75_r4_08000__21b9
FUN_M75_r4_08000__21b9:
  21b9  3410           PSHS  X                           
  21bb  8E216F         LDX #0x216f                       
  21be  AD9FFC52       JSR [0xfc52]                      
  21c2  3510           PULS  X                           
  21c4  39             RTS                               
  21c5  .db 0A 46 31 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F1 pan         
  21d5  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__21e4
FUN_M75_r4_08000__21e4:
  21e4  3476           PSHS  U Y X B A                   
  21e6  8E216F         LDX #0x216f                       
  21e9  AD9FFE76       JSR [0xfe76]                      
  21ed  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  21f1  0F27           dw F27h                           
LAB_M75_r4_08000__21f3:
  21f3  1F01           TFR D,X                           
  21f5  17121E         LBSR 0x3416                       
  21f8  35F6           PULS  A B X Y U PC                
  21fa  226F22442238   addr[3]                           
  2200  .db 70 72 70 D2 00 00 71 32 00 08 00 5B 13 00 00 00  ; prp...q2...[....
  2210  .db 16 00 01 00 17 11 22 50 00 00 25 C7 00 00 00 00  ; ......"P..%.....

; ---- function FUN_M75_r4_08000__2220
FUN_M75_r4_08000__2220:
  2220  3410           PSHS  X                           
  2222  8E21FA         LDX #0x21fa                       
  2225  AD9FFC4E       JSR [0xfc4e]                      
  2229  3510           PULS  X                           
  222b  39             RTS                               

; ---- function FUN_M75_r4_08000__222c
FUN_M75_r4_08000__222c:
  222c  3410           PSHS  X                           
  222e  8E21FA         LDX #0x21fa                       
  2231  AD9FFC4C       JSR [0xfc4c]                      
  2235  3510           PULS  X                           
  2237  39             RTS                               

; ---- function FUN_M75_r4_08000__2238
FUN_M75_r4_08000__2238:
  2238  3410           PSHS  X                           
  223a  8E21FA         LDX #0x21fa                       
  223d  AD9FFC50       JSR [0xfc50]                      
  2241  3510           PULS  X                           
  2243  39             RTS                               

; ---- function FUN_M75_r4_08000__2244
FUN_M75_r4_08000__2244:
  2244  3410           PSHS  X                           
  2246  8E21FA         LDX #0x21fa                       
  2249  AD9FFC52       JSR [0xfc52]                      
  224d  3510           PULS  X                           
  224f  39             RTS                               
  2250  .db 0A 46 32 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F2 pan         
  2260  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__226f
FUN_M75_r4_08000__226f:
  226f  3476           PSHS  U Y X B A                   
  2271  8E21FA         LDX #0x21fa                       
  2274  AD9FFE76       JSR [0xfe76]                      
  2278  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  227c  0EA8           dw EA8h                           
LAB_M75_r4_08000__227e:
  227e  1F01           TFR D,X                           
  2280  171193         LBSR 0x3416                       
  2283  35F6           PULS  A B X Y U PC                
  2285  22FA22CF22C3   addr[3]                           
  228b  .db 70 7E 70 DE 00 00 71 3E 00 08 00 65 19 00 00 00  ; p~p...q>...e....
  229b  .db 16 00 01 00 17 11 22 DB 00 00 25 C7 00 00 00 00  ; ......"...%.....

; ---- function FUN_M75_r4_08000__22ab
FUN_M75_r4_08000__22ab:
  22ab  3410           PSHS  X                           
  22ad  8E2285         LDX #0x2285                       
  22b0  AD9FFC4E       JSR [0xfc4e]                      
  22b4  3510           PULS  X                           
  22b6  39             RTS                               

; ---- function FUN_M75_r4_08000__22b7
FUN_M75_r4_08000__22b7:
  22b7  3410           PSHS  X                           
  22b9  8E2285         LDX #0x2285                       
  22bc  AD9FFC4C       JSR [0xfc4c]                      
  22c0  3510           PULS  X                           
  22c2  39             RTS                               

; ---- function FUN_M75_r4_08000__22c3
FUN_M75_r4_08000__22c3:
  22c3  3410           PSHS  X                           
  22c5  8E2285         LDX #0x2285                       
  22c8  AD9FFC50       JSR [0xfc50]                      
  22cc  3510           PULS  X                           
  22ce  39             RTS                               

; ---- function FUN_M75_r4_08000__22cf
FUN_M75_r4_08000__22cf:
  22cf  3410           PSHS  X                           
  22d1  8E2285         LDX #0x2285                       
  22d4  AD9FFC52       JSR [0xfc52]                      
  22d8  3510           PULS  X                           
  22da  39             RTS                               
  22db  .db 0A 46 33 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F3 pan         
  22eb  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__22fa
FUN_M75_r4_08000__22fa:
  22fa  3476           PSHS  U Y X B A                   
  22fc  8E2285         LDX #0x2285                       
  22ff  AD9FFE76       JSR [0xfe76]                      
  2303  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  2307  0E29           dw E29h                           
LAB_M75_r4_08000__2309:
  2309  1F01           TFR D,X                           
  230b  171108         LBSR 0x3416                       
  230e  35F6           PULS  A B X Y U PC                
  2310  2385235A234E   addr[3]                           
  2316  .db 70 8A 70 EA 00 00 71 4A 00 08 00 6F 1F 00 00 00  ; p.p...qJ...o....
  2326  .db 16 00 01 00 17 11 23 66 00 00 25 C7 00 00 00 00  ; ......#f..%.....

; ---- function FUN_M75_r4_08000__2336
FUN_M75_r4_08000__2336:
  2336  3410           PSHS  X                           
  2338  8E2310         LDX #0x2310                       
  233b  AD9FFC4E       JSR [0xfc4e]                      
  233f  3510           PULS  X                           
  2341  39             RTS                               

; ---- function FUN_M75_r4_08000__2342
FUN_M75_r4_08000__2342:
  2342  3410           PSHS  X                           
  2344  8E2310         LDX #0x2310                       
  2347  AD9FFC4C       JSR [0xfc4c]                      
  234b  3510           PULS  X                           
  234d  39             RTS                               

; ---- function FUN_M75_r4_08000__234e
FUN_M75_r4_08000__234e:
  234e  3410           PSHS  X                           
  2350  8E2310         LDX #0x2310                       
  2353  AD9FFC50       JSR [0xfc50]                      
  2357  3510           PULS  X                           
  2359  39             RTS                               

; ---- function FUN_M75_r4_08000__235a
FUN_M75_r4_08000__235a:
  235a  3410           PSHS  X                           
  235c  8E2310         LDX #0x2310                       
  235f  AD9FFC52       JSR [0xfc52]                      
  2363  3510           PULS  X                           
  2365  39             RTS                               
  2366  .db 0A 46 34 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F4 pan         
  2376  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__2385
FUN_M75_r4_08000__2385:
  2385  3476           PSHS  U Y X B A                   
  2387  8E2310         LDX #0x2310                       
  238a  AD9FFE76       JSR [0xfe76]                      
  238e  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  2392  0DAA           dw DAAh                           
LAB_M75_r4_08000__2394:
  2394  1F01           TFR D,X                           
  2396  17107D         LBSR 0x3416                       
  2399  35F6           PULS  A B X Y U PC                
  239b  241023E523D9   addr[3]                           
  23a1  .db 70 96 70 F6 00 00 71 56 00 08 00 79 25 00 00 00  ; p.p...qV...y%...
  23b1  .db 16 00 01 00 17 11 23 F1 00 00 25 C7 00 00 00 00  ; ......#...%.....

; ---- function FUN_M75_r4_08000__23c1
FUN_M75_r4_08000__23c1:
  23c1  3410           PSHS  X                           
  23c3  8E239B         LDX #0x239b                       
  23c6  AD9FFC4E       JSR [0xfc4e]                      
  23ca  3510           PULS  X                           
  23cc  39             RTS                               

; ---- function FUN_M75_r4_08000__23cd
FUN_M75_r4_08000__23cd:
  23cd  3410           PSHS  X                           
  23cf  8E239B         LDX #0x239b                       
  23d2  AD9FFC4C       JSR [0xfc4c]                      
  23d6  3510           PULS  X                           
  23d8  39             RTS                               

; ---- function FUN_M75_r4_08000__23d9
FUN_M75_r4_08000__23d9:
  23d9  3410           PSHS  X                           
  23db  8E239B         LDX #0x239b                       
  23de  AD9FFC50       JSR [0xfc50]                      
  23e2  3510           PULS  X                           
  23e4  39             RTS                               

; ---- function FUN_M75_r4_08000__23e5
FUN_M75_r4_08000__23e5:
  23e5  3410           PSHS  X                           
  23e7  8E239B         LDX #0x239b                       
  23ea  AD9FFC52       JSR [0xfc52]                      
  23ee  3510           PULS  X                           
  23f0  39             RTS                               
  23f1  .db 0A 46 35 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F5 pan         
  2401  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__2410
FUN_M75_r4_08000__2410:
  2410  3476           PSHS  U Y X B A                   
  2412  8E239B         LDX #0x239b                       
  2415  AD9FFE76       JSR [0xfe76]                      
  2419  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  241d  0D2B           dw D2Bh                           
LAB_M75_r4_08000__241f:
  241f  1F01           TFR D,X                           
  2421  170FF2         LBSR 0x3416                       
  2424  35F6           PULS  A B X Y U PC                
  2426  249B24702464   addr[3]                           
  242c  .db 70 A2 71 02 00 00 71 62 00 08 00 83 2B 00 00 00  ; p.q...qb....+...
  243c  .db 16 00 01 00 17 11 24 7C 00 00 25 C7 00 00 00 00  ; ......$|..%.....

; ---- function FUN_M75_r4_08000__244c
FUN_M75_r4_08000__244c:
  244c  3410           PSHS  X                           
  244e  8E2426         LDX #0x2426                       
  2451  AD9FFC4E       JSR [0xfc4e]                      
  2455  3510           PULS  X                           
  2457  39             RTS                               

; ---- function FUN_M75_r4_08000__2458
FUN_M75_r4_08000__2458:
  2458  3410           PSHS  X                           
  245a  8E2426         LDX #0x2426                       
  245d  AD9FFC4C       JSR [0xfc4c]                      
  2461  3510           PULS  X                           
  2463  39             RTS                               

; ---- function FUN_M75_r4_08000__2464
FUN_M75_r4_08000__2464:
  2464  3410           PSHS  X                           
  2466  8E2426         LDX #0x2426                       
  2469  AD9FFC50       JSR [0xfc50]                      
  246d  3510           PULS  X                           
  246f  39             RTS                               

; ---- function FUN_M75_r4_08000__2470
FUN_M75_r4_08000__2470:
  2470  3410           PSHS  X                           
  2472  8E2426         LDX #0x2426                       
  2475  AD9FFC52       JSR [0xfc52]                      
  2479  3510           PULS  X                           
  247b  39             RTS                               
  247c  .db 0A 46 36 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F6 pan         
  248c  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__249b
FUN_M75_r4_08000__249b:
  249b  3476           PSHS  U Y X B A                   
  249d  8E2426         LDX #0x2426                       
  24a0  AD9FFE76       JSR [0xfe76]                      
  24a4  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  24a8  0CAC           dw CACh                           
LAB_M75_r4_08000__24aa:
  24aa  1F01           TFR D,X                           
  24ac  170F67         LBSR 0x3416                       
  24af  35F6           PULS  A B X Y U PC                
  24b1  252624FB24EF   addr[3]                           
  24b7  .db 70 AE 71 0E 00 00 71 6E 00 08 00 8D 31 00 00 00  ; p.q...qn....1...
  24c7  .db 16 00 01 00 17 11 25 07 00 00 25 C7 00 00 00 00  ; ......%...%.....

; ---- function FUN_M75_r4_08000__24d7
FUN_M75_r4_08000__24d7:
  24d7  3410           PSHS  X                           
  24d9  8E24B1         LDX #0x24b1                       
  24dc  AD9FFC4E       JSR [0xfc4e]                      
  24e0  3510           PULS  X                           
  24e2  39             RTS                               

; ---- function FUN_M75_r4_08000__24e3
FUN_M75_r4_08000__24e3:
  24e3  3410           PSHS  X                           
  24e5  8E24B1         LDX #0x24b1                       
  24e8  AD9FFC4C       JSR [0xfc4c]                      
  24ec  3510           PULS  X                           
  24ee  39             RTS                               

; ---- function FUN_M75_r4_08000__24ef
FUN_M75_r4_08000__24ef:
  24ef  3410           PSHS  X                           
  24f1  8E24B1         LDX #0x24b1                       
  24f4  AD9FFC50       JSR [0xfc50]                      
  24f8  3510           PULS  X                           
  24fa  39             RTS                               

; ---- function FUN_M75_r4_08000__24fb
FUN_M75_r4_08000__24fb:
  24fb  3410           PSHS  X                           
  24fd  8E24B1         LDX #0x24b1                       
  2500  AD9FFC52       JSR [0xfc52]                      
  2504  3510           PULS  X                           
  2506  39             RTS                               
  2507  .db 0A 46 37 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F7 pan         
  2517  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__2526
FUN_M75_r4_08000__2526:
  2526  3476           PSHS  U Y X B A                   
  2528  8E24B1         LDX #0x24b1                       
  252b  AD9FFE76       JSR [0xfe76]                      
  252f  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  2533  0C2D           dw C2Dh                           
LAB_M75_r4_08000__2535:
  2535  1F01           TFR D,X                           
  2537  170EDC         LBSR 0x3416                       
  253a  35F6           PULS  A B X Y U PC                
  253c  25B12586257A   addr[3]                           
  2542  .db 70 BA 71 1A 00 00 71 7A 00 08 00 97 37 00 00 00  ; p.q...qz....7...
  2552  .db 16 00 01 00 17 11 25 92 00 00 25 C7 00 00 00 00  ; ......%...%.....

; ---- function FUN_M75_r4_08000__2562
FUN_M75_r4_08000__2562:
  2562  3410           PSHS  X                           
  2564  8E253C         LDX #0x253c                       
  2567  AD9FFC4E       JSR [0xfc4e]                      
  256b  3510           PULS  X                           
  256d  39             RTS                               

; ---- function FUN_M75_r4_08000__256e
FUN_M75_r4_08000__256e:
  256e  3410           PSHS  X                           
  2570  8E253C         LDX #0x253c                       
  2573  AD9FFC4C       JSR [0xfc4c]                      
  2577  3510           PULS  X                           
  2579  39             RTS                               

; ---- function FUN_M75_r4_08000__257a
FUN_M75_r4_08000__257a:
  257a  3410           PSHS  X                           
  257c  8E253C         LDX #0x253c                       
  257f  AD9FFC50       JSR [0xfc50]                      
  2583  3510           PULS  X                           
  2585  39             RTS                               

; ---- function FUN_M75_r4_08000__2586
FUN_M75_r4_08000__2586:
  2586  3410           PSHS  X                           
  2588  8E253C         LDX #0x253c                       
  258b  AD9FFC52       JSR [0xfc52]                      
  258f  3510           PULS  X                           
  2591  39             RTS                               
  2592  .db 0A 46 38 20 70 61 6E 20 20 20 20 20 20 20 20 20  ; .F8 pan         
  25a2  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20     ;                

; ---- function FUN_M75_r4_08000__25b1
FUN_M75_r4_08000__25b1:
  25b1  3476           PSHS  U Y X B A                   
  25b3  8E253C         LDX #0x253c                       
  25b6  AD9FFE76       JSR [0xfe76]                      
  25ba  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  25be  0BAE           dw BAEh                           
LAB_M75_r4_08000__25c0:
  25c0  1F01           TFR D,X                           
  25c2  170E51         LBSR 0x3416                       
  25c5  35F6           PULS  A B X Y U PC                
  25c7  .db 2A 20 20 20 20 20 20 20 20 20 20 43 20 20 20 20  ; *          C    
  25d7  .db 20 20 20 20 20 20 52 4C 2A 20 20 20 20 20 20 20  ;       RL*       
  25e7  .db 20 20 43 20 20 20 20 20 20 20 20 20 20 52 4C 20  ;   C          RL 
  25f7  .db 2A 20 20 20 20 20 20 20 20 43 20 20 20 20 20 20  ; *        C      
  2607  .db 20 20 20 20 52 4C 20 20 2A 20 20 20 20 20 20 20  ;     RL  *       
  2617  .db 43 20 20 20 20 20 20 20 20 20 20 52 4C 20 20 20  ; C          RL   
  2627  .db 2A 20 20 20 20 20 20 43 20 20 20 20 20 20 20 20  ; *      C        
  2637  .db 20 20 52 4C 20 20 20 20 2A 20 20 20 20 20 43 20  ;   RL    *     C 
  2647  .db 20 20 20 20 20 20 20 20 20 52 4C 20 20 20 20 20  ;          RL     
  2657  .db 2A 20 20 20 20 43 20 20 20 20 20 20 20 20 20 20  ; *    C          
  2667  .db 52 4C 20 20 20 20 20 20 2A 20 20 20 43 20 20 20  ; RL      *   C   
  2677  .db 20 20 20 20 20 20 20 52 4C 20 20 20 20 20 20 20  ;        RL       
  2687  .db 2A 20 20 43 20 20 20 20 20 20 20 20 20 20 52 4C  ; *  C          RL
  2697  .db 20 20 20 20 20 20 20 20 2A 20 43 20 20 20 20 20  ;         * C     
  26a7  .db 20 20 20 20 20 52 4C 20 20 20 20 20 20 20 20 20  ;      RL         
  26b7  .db 2A 43 20 20 20 20 20 20 20 20 20 20 52 4C 20 20  ; *C          RL  
  26c7  .db 20 20 20 20 20 20 20 20 2A 20 20 20 20 20 20 20  ;         *       
  26d7  .db 20 20 20 52 4C 20 20 20 20 20 20 20 20 20 20 43  ;    RL          C
  26e7  .db 2A 20 20 20 20 20 20 20 20 20 52 4C 20 20 20 20  ; *         RL    
  26f7  .db 20 20 20 20 20 20 43 20 2A 20 20 20 20 20 20 20  ;       C *       
  2707  .db 20 52 4C 20 20 20 20 20 20 20 20 20 20 43 20 20  ;  RL          C  
  2717  .db 2A 20 20 20 20 20 20 20 52 4C 20 20 20 20 20 20  ; *       RL      
  2727  .db 20 20 20 20 43 20 20 20 2A 20 20 20 20 20 20 52  ;     C   *      R
  2737  .db 4C 20 20 20 20 20 20 20 20 20 20 43 20 20 20 20  ; L          C    
  2747  .db 2A 20 20 20 20 20 52 4C 20 20 20 20 20 20 20 20  ; *     RL        
  2757  .db 20 20 43 20 20 20 20 20 2A 20 20 20 20 52 4C 20  ;   C     *    RL 
  2767  .db 20 20 20 20 20 20 20 20 20 43 20 20 20 20 20 20  ;          C      
  2777  .db 2A 20 20 20 52 4C 20 20 20 20 20 20 20 20 20 20  ; *   RL          
  2787  .db 43 20 20 20 20 20 20 20 2A 20 20 52 4C 20 20 20  ; C       *  RL   
  2797  .db 20 20 20 20 20 20 20 43 20 20 20 20 20 20 20 20  ;        C        
  27a7  .db 2A 20 52 4C 20 20 20 20 20 20 20 20 20 20 43 20  ; * RL          C 
  27b7  .db 20 20 20 20 20 20 20 20 2A 52 4C 20 20 20 20 20  ;         *RL     
  27c7  .db 20 20 20 20 20 43 20 20 20 20 20 20 20 20 20 20  ;      C          
  27d7  .db 2A                                               ; *
PTR_FUN_M75_r4_08000__2843_M75_r4_08000__27d8:
  27d8  2843           addr M75_r4_08000::2843           
  27da  2822           addr M75_r4_08000::2822           
  27dc  .db 28 16 70 60 70 C0 00 00 71 20 00 08 00 4B 0A 00  ; (.p`p...q ...K..
  27ec  .db 00 03 E7 00 0A 00 04 1D 28 2E 00 00 00 00 00 00  ; ........(.......
  27fc  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__27fe
FUN_M75_r4_08000__27fe:
  27fe  3410           PSHS  X                           
  2800  8E27D8         LDX #0x27d8                        ; desc[API_FE6A]: ->$2843 ->$2822
  2803  AD9FFE6A       JSR [0xfe6a]                      
  2807  3510           PULS  X                           
  2809  39             RTS                               

; ---- function FUN_M75_r4_08000__280a
FUN_M75_r4_08000__280a:
  280a  3410           PSHS  X                           
  280c  8E27D8         LDX #0x27d8                        ; desc[API_FDBC]: ->$2843 ->$2822
  280f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..'."
  2813  3510           PULS  X                           
  2815  39             RTS                               

; ---- function FUN_M75_r4_08000__2816
FUN_M75_r4_08000__2816:
  2816  3410           PSHS  X                           
  2818  8E27D8         LDX #0x27d8                        ; desc[API_FE6C]: ->$2843 ->$2822
  281b  AD9FFE6C       JSR [0xfe6c]                      
  281f  3510           PULS  X                           
  2821  39             RTS                               

; ---- function FUN_M75_r4_08000__2822
FUN_M75_r4_08000__2822:
  2822  3410           PSHS  X                           
  2824  8E27D8         LDX #0x27d8                        ; desc[API_FE6E]: ->$2843 ->$2822
  2827  AD9FFE6E       JSR [0xfe6e]                      
  282b  3510           PULS  X                           
  282d  39             RTS                               
  282e  .db 14 46 31 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F1 q fac:      
  283e  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2843
FUN_M75_r4_08000__2843:
  2843  3476           PSHS  U Y X B A                   
  2845  8E27D8         LDX #0x27d8                       
  2848  AD9FFE76       JSR [0xfe76]                      
  284c  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  2850  08C8           dw 8C8h                           
LAB_M75_r4_08000__2852:
  2852  1F01           TFR D,X                           
  2854  170389         LBSR 0x2be0                       
  2857  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__28c4_M75_r4_08000__2859:
  2859  28C4           addr M75_r4_08000::28c4           
  285b  28A3           addr M75_r4_08000::28a3           
  285d  .db 28 97 70 6C 70 CC 00 00 71 2C 00 08 00 55 10 00  ; (.plp...q,...U..
  286d  .db 00 03 E7 00 0A 00 04 1D 28 AF 00 00 00 00 00 00  ; ........(.......
  287d  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__287f
FUN_M75_r4_08000__287f:
  287f  3410           PSHS  X                           
  2881  8E2859         LDX #0x2859                        ; desc[API_FE6A]: ->$28C4 ->$28A3
  2884  AD9FFE6A       JSR [0xfe6a]                      
  2888  3510           PULS  X                           
  288a  39             RTS                               

; ---- function FUN_M75_r4_08000__288b
FUN_M75_r4_08000__288b:
  288b  3410           PSHS  X                           
  288d  8E2859         LDX #0x2859                        ; desc[API_FDBC]: ->$28C4 ->$28A3
  2890  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..(Y"
  2894  3510           PULS  X                           
  2896  39             RTS                               

; ---- function FUN_M75_r4_08000__2897
FUN_M75_r4_08000__2897:
  2897  3410           PSHS  X                           
  2899  8E2859         LDX #0x2859                        ; desc[API_FE6C]: ->$28C4 ->$28A3
  289c  AD9FFE6C       JSR [0xfe6c]                      
  28a0  3510           PULS  X                           
  28a2  39             RTS                               

; ---- function FUN_M75_r4_08000__28a3
FUN_M75_r4_08000__28a3:
  28a3  3410           PSHS  X                           
  28a5  8E2859         LDX #0x2859                        ; desc[API_FE6E]: ->$28C4 ->$28A3
  28a8  AD9FFE6E       JSR [0xfe6e]                      
  28ac  3510           PULS  X                           
  28ae  39             RTS                               
  28af  .db 14 46 32 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F2 q fac:      
  28bf  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__28c4
FUN_M75_r4_08000__28c4:
  28c4  3476           PSHS  U Y X B A                   
  28c6  8E2859         LDX #0x2859                       
  28c9  AD9FFE76       JSR [0xfe76]                      
  28cd  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  28d1  0853           dw 853h                           
LAB_M75_r4_08000__28d3:
  28d3  1F01           TFR D,X                           
  28d5  170308         LBSR 0x2be0                       
  28d8  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2945_M75_r4_08000__28da:
  28da  2945           addr M75_r4_08000::2945           
  28dc  2924           addr M75_r4_08000::2924           
  28de  .db 29 18 70 78 70 D8 00 00 71 38 00 08 00 5F 16 00  ; ).pxp...q8..._..
  28ee  .db 00 03 E7 00 0A 00 04 1D 29 30 00 00 00 00 00 00  ; ........)0......
  28fe  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2900
FUN_M75_r4_08000__2900:
  2900  3410           PSHS  X                           
  2902  8E28DA         LDX #0x28da                        ; desc[API_FE6A]: ->$2945 ->$2924
  2905  AD9FFE6A       JSR [0xfe6a]                      
  2909  3510           PULS  X                           
  290b  39             RTS                               

; ---- function FUN_M75_r4_08000__290c
FUN_M75_r4_08000__290c:
  290c  3410           PSHS  X                           
  290e  8E28DA         LDX #0x28da                        ; desc[API_FDBC]: ->$2945 ->$2924
  2911  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..(."
  2915  3510           PULS  X                           
  2917  39             RTS                               

; ---- function FUN_M75_r4_08000__2918
FUN_M75_r4_08000__2918:
  2918  3410           PSHS  X                           
  291a  8E28DA         LDX #0x28da                        ; desc[API_FE6C]: ->$2945 ->$2924
  291d  AD9FFE6C       JSR [0xfe6c]                      
  2921  3510           PULS  X                           
  2923  39             RTS                               

; ---- function FUN_M75_r4_08000__2924
FUN_M75_r4_08000__2924:
  2924  3410           PSHS  X                           
  2926  8E28DA         LDX #0x28da                        ; desc[API_FE6E]: ->$2945 ->$2924
  2929  AD9FFE6E       JSR [0xfe6e]                      
  292d  3510           PULS  X                           
  292f  39             RTS                               
  2930  .db 14 46 33 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F3 q fac:      
  2940  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2945
FUN_M75_r4_08000__2945:
  2945  3476           PSHS  U Y X B A                   
  2947  8E28DA         LDX #0x28da                       
  294a  AD9FFE76       JSR [0xfe76]                      
  294e  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  2952  07DE           dw 7DEh                           
LAB_M75_r4_08000__2954:
  2954  1F01           TFR D,X                           
  2956  170287         LBSR 0x2be0                       
  2959  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__29c6_M75_r4_08000__295b:
  295b  29C6           addr M75_r4_08000::29c6           
  295d  29A5           addr M75_r4_08000::29a5           
  295f  .db 29 99 70 84 70 E4 00 00 71 44 00 08 00 69 1C 00  ; ).p.p...qD...i..
  296f  .db 00 03 E7 00 0A 00 04 1D 29 B1 00 00 00 00 00 00  ; ........).......
  297f  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2981
FUN_M75_r4_08000__2981:
  2981  3410           PSHS  X                           
  2983  8E295B         LDX #0x295b                        ; desc[API_FE6A]: ->$29C6 ->$29A5
  2986  AD9FFE6A       JSR [0xfe6a]                      
  298a  3510           PULS  X                           
  298c  39             RTS                               

; ---- function FUN_M75_r4_08000__298d
FUN_M75_r4_08000__298d:
  298d  3410           PSHS  X                           
  298f  8E295B         LDX #0x295b                        ; desc[API_FDBC]: ->$29C6 ->$29A5
  2992  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)["
  2996  3510           PULS  X                           
  2998  39             RTS                               

; ---- function FUN_M75_r4_08000__2999
FUN_M75_r4_08000__2999:
  2999  3410           PSHS  X                           
  299b  8E295B         LDX #0x295b                        ; desc[API_FE6C]: ->$29C6 ->$29A5
  299e  AD9FFE6C       JSR [0xfe6c]                      
  29a2  3510           PULS  X                           
  29a4  39             RTS                               

; ---- function FUN_M75_r4_08000__29a5
FUN_M75_r4_08000__29a5:
  29a5  3410           PSHS  X                           
  29a7  8E295B         LDX #0x295b                        ; desc[API_FE6E]: ->$29C6 ->$29A5
  29aa  AD9FFE6E       JSR [0xfe6e]                      
  29ae  3510           PULS  X                           
  29b0  39             RTS                               
  29b1  .db 14 46 34 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F4 q fac:      
  29c1  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__29c6
FUN_M75_r4_08000__29c6:
  29c6  3476           PSHS  U Y X B A                   
  29c8  8E295B         LDX #0x295b                       
  29cb  AD9FFE76       JSR [0xfe76]                      
  29cf  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  29d3  0769           dw 769h                           
LAB_M75_r4_08000__29d5:
  29d5  1F01           TFR D,X                           
  29d7  170206         LBSR 0x2be0                       
  29da  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2a47_M75_r4_08000__29dc:
  29dc  2A47           addr M75_r4_08000::2a47           
  29de  2A26           addr M75_r4_08000::2a26           
  29e0  .db 2A 1A 70 90 70 F0 00 00 71 50 00 08 00 73 22 00  ; *.p.p...qP...s".
  29f0  .db 00 03 E7 00 0A 00 04 1D 2A 32 00 00 00 00 00 00  ; ........*2......
  2a00  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2a02
FUN_M75_r4_08000__2a02:
  2a02  3410           PSHS  X                           
  2a04  8E29DC         LDX #0x29dc                        ; desc[API_FE6A]: ->$2A47 ->$2A26
  2a07  AD9FFE6A       JSR [0xfe6a]                      
  2a0b  3510           PULS  X                           
  2a0d  39             RTS                               

; ---- function FUN_M75_r4_08000__2a0e
FUN_M75_r4_08000__2a0e:
  2a0e  3410           PSHS  X                           
  2a10  8E29DC         LDX #0x29dc                        ; desc[API_FDBC]: ->$2A47 ->$2A26
  2a13  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)."
  2a17  3510           PULS  X                           
  2a19  39             RTS                               

; ---- function FUN_M75_r4_08000__2a1a
FUN_M75_r4_08000__2a1a:
  2a1a  3410           PSHS  X                           
  2a1c  8E29DC         LDX #0x29dc                        ; desc[API_FE6C]: ->$2A47 ->$2A26
  2a1f  AD9FFE6C       JSR [0xfe6c]                      
  2a23  3510           PULS  X                           
  2a25  39             RTS                               

; ---- function FUN_M75_r4_08000__2a26
FUN_M75_r4_08000__2a26:
  2a26  3410           PSHS  X                           
  2a28  8E29DC         LDX #0x29dc                        ; desc[API_FE6E]: ->$2A47 ->$2A26
  2a2b  AD9FFE6E       JSR [0xfe6e]                      
  2a2f  3510           PULS  X                           
  2a31  39             RTS                               
  2a32  .db 14 46 35 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F5 q fac:      
  2a42  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2a47
FUN_M75_r4_08000__2a47:
  2a47  3476           PSHS  U Y X B A                   
  2a49  8E29DC         LDX #0x29dc                       
  2a4c  AD9FFE76       JSR [0xfe76]                      
  2a50  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  2a54  06F4           dw 6F4h                           
LAB_M75_r4_08000__2a56:
  2a56  1F01           TFR D,X                           
  2a58  170185         LBSR 0x2be0                       
  2a5b  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2ac8_M75_r4_08000__2a5d:
  2a5d  2AC8           addr M75_r4_08000::2ac8           
  2a5f  2AA7           addr M75_r4_08000::2aa7           
  2a61  .db 2A 9B 70 9C 70 FC 00 00 71 5C 00 08 00 7D 28 00  ; *.p.p...q\...}(.
  2a71  .db 00 03 E7 00 0A 00 04 1D 2A B3 00 00 00 00 00 00  ; ........*.......
  2a81  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2a83
FUN_M75_r4_08000__2a83:
  2a83  3410           PSHS  X                           
  2a85  8E2A5D         LDX #0x2a5d                        ; desc[API_FE6A]: ->$2AC8 ->$2AA7
  2a88  AD9FFE6A       JSR [0xfe6a]                      
  2a8c  3510           PULS  X                           
  2a8e  39             RTS                               

; ---- function FUN_M75_r4_08000__2a8f
FUN_M75_r4_08000__2a8f:
  2a8f  3410           PSHS  X                           
  2a91  8E2A5D         LDX #0x2a5d                        ; desc[API_FDBC]: ->$2AC8 ->$2AA7
  2a94  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..*]"
  2a98  3510           PULS  X                           
  2a9a  39             RTS                               

; ---- function FUN_M75_r4_08000__2a9b
FUN_M75_r4_08000__2a9b:
  2a9b  3410           PSHS  X                           
  2a9d  8E2A5D         LDX #0x2a5d                        ; desc[API_FE6C]: ->$2AC8 ->$2AA7
  2aa0  AD9FFE6C       JSR [0xfe6c]                      
  2aa4  3510           PULS  X                           
  2aa6  39             RTS                               

; ---- function FUN_M75_r4_08000__2aa7
FUN_M75_r4_08000__2aa7:
  2aa7  3410           PSHS  X                           
  2aa9  8E2A5D         LDX #0x2a5d                        ; desc[API_FE6E]: ->$2AC8 ->$2AA7
  2aac  AD9FFE6E       JSR [0xfe6e]                      
  2ab0  3510           PULS  X                           
  2ab2  39             RTS                               
  2ab3  .db 14 46 36 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F6 q fac:      
  2ac3  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2ac8
FUN_M75_r4_08000__2ac8:
  2ac8  3476           PSHS  U Y X B A                   
  2aca  8E2A5D         LDX #0x2a5d                       
  2acd  AD9FFE76       JSR [0xfe76]                      
  2ad1  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  2ad5  067F           dw 67Fh                           
LAB_M75_r4_08000__2ad7:
  2ad7  1F01           TFR D,X                           
  2ad9  170104         LBSR 0x2be0                       
  2adc  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2b49_M75_r4_08000__2ade:
  2ade  2B49           addr M75_r4_08000::2b49           
  2ae0  2B28           addr M75_r4_08000::2b28           
  2ae2  .db 2B 1C 70 A8 71 08 00 00 71 68 00 08 00 87 2E 00  ; +.p.q...qh......
  2af2  .db 00 03 E7 00 0A 00 04 1D 2B 34 00 00 00 00 00 00  ; ........+4......
  2b02  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2b04
FUN_M75_r4_08000__2b04:
  2b04  3410           PSHS  X                           
  2b06  8E2ADE         LDX #0x2ade                        ; desc[API_FE6A]: ->$2B49 ->$2B28
  2b09  AD9FFE6A       JSR [0xfe6a]                      
  2b0d  3510           PULS  X                           
  2b0f  39             RTS                               

; ---- function FUN_M75_r4_08000__2b10
FUN_M75_r4_08000__2b10:
  2b10  3410           PSHS  X                           
  2b12  8E2ADE         LDX #0x2ade                        ; desc[API_FDBC]: ->$2B49 ->$2B28
  2b15  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..*."
  2b19  3510           PULS  X                           
  2b1b  39             RTS                               

; ---- function FUN_M75_r4_08000__2b1c
FUN_M75_r4_08000__2b1c:
  2b1c  3410           PSHS  X                           
  2b1e  8E2ADE         LDX #0x2ade                        ; desc[API_FE6C]: ->$2B49 ->$2B28
  2b21  AD9FFE6C       JSR [0xfe6c]                      
  2b25  3510           PULS  X                           
  2b27  39             RTS                               

; ---- function FUN_M75_r4_08000__2b28
FUN_M75_r4_08000__2b28:
  2b28  3410           PSHS  X                           
  2b2a  8E2ADE         LDX #0x2ade                        ; desc[API_FE6E]: ->$2B49 ->$2B28
  2b2d  AD9FFE6E       JSR [0xfe6e]                      
  2b31  3510           PULS  X                           
  2b33  39             RTS                               
  2b34  .db 14 46 37 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F7 q fac:      
  2b44  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2b49
FUN_M75_r4_08000__2b49:
  2b49  3476           PSHS  U Y X B A                   
  2b4b  8E2ADE         LDX #0x2ade                       
  2b4e  AD9FFE76       JSR [0xfe76]                      
  2b52  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  2b56  060A           dw 60Ah                           
LAB_M75_r4_08000__2b58:
  2b58  1F01           TFR D,X                           
  2b5a  170083         LBSR 0x2be0                       
  2b5d  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2bca_M75_r4_08000__2b5f:
  2b5f  2BCA           addr M75_r4_08000::2bca           
  2b61  2BA9           addr M75_r4_08000::2ba9           
  2b63  .db 2B 9D 70 B4 71 14 00 00 71 74 00 08 00 91 34 00  ; +.p.q...qt....4.
  2b73  .db 00 03 E7 00 0A 00 04 1D 2B B5 00 00 00 00 00 00  ; ........+.......
  2b83  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2b85
FUN_M75_r4_08000__2b85:
  2b85  3410           PSHS  X                           
  2b87  8E2B5F         LDX #0x2b5f                        ; desc[API_FE6A]: ->$2BCA ->$2BA9
  2b8a  AD9FFE6A       JSR [0xfe6a]                      
  2b8e  3510           PULS  X                           
  2b90  39             RTS                               

; ---- function FUN_M75_r4_08000__2b91
FUN_M75_r4_08000__2b91:
  2b91  3410           PSHS  X                           
  2b93  8E2B5F         LDX #0x2b5f                        ; desc[API_FDBC]: ->$2BCA ->$2BA9
  2b96  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..+_"
  2b9a  3510           PULS  X                           
  2b9c  39             RTS                               

; ---- function FUN_M75_r4_08000__2b9d
FUN_M75_r4_08000__2b9d:
  2b9d  3410           PSHS  X                           
  2b9f  8E2B5F         LDX #0x2b5f                        ; desc[API_FE6C]: ->$2BCA ->$2BA9
  2ba2  AD9FFE6C       JSR [0xfe6c]                      
  2ba6  3510           PULS  X                           
  2ba8  39             RTS                               

; ---- function FUN_M75_r4_08000__2ba9
FUN_M75_r4_08000__2ba9:
  2ba9  3410           PSHS  X                           
  2bab  8E2B5F         LDX #0x2b5f                        ; desc[API_FE6E]: ->$2BCA ->$2BA9
  2bae  AD9FFE6E       JSR [0xfe6e]                      
  2bb2  3510           PULS  X                           
  2bb4  39             RTS                               
  2bb5  .db 14 46 38 20 71 20 66 61 63 3A 20 20 20 20 20 20  ; .F8 q fac:      
  2bc5  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__2bca
FUN_M75_r4_08000__2bca:
  2bca  3476           PSHS  U Y X B A                   
  2bcc  8E2B5F         LDX #0x2b5f                       
  2bcf  AD9FFE76       JSR [0xfe76]                      
  2bd3  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  2bd7  0595           dw 595h                           
LAB_M75_r4_08000__2bd9:
  2bd9  1F01           TFR D,X                           
  2bdb  170002         LBSR 0x2be0                       
  2bde  35F6           PULS  A B X Y U PC                

; ---- function FUN_M75_r4_08000__2be0
FUN_M75_r4_08000__2be0:
  2be0  3476           PSHS  U Y X B A                   
  2be2  10AE890000     LDY 0x0,X                         
  2be7  ECA90002       LDD 0x2,Y                         
  2beb  3606           PSHU  B A                         
  2bed  FC702E         LDD 0x702e                        
  2bf0  3606           PSHU  B A                         
  2bf2  AD9FFCF2       JSR [0xfcf2]                      
  2bf6  ECC4           LDD ,U                            
  2bf8  FD7180         STD 0x7180                        
  2bfb  CC0020         LDD #0x20                         
  2bfe  3606           PSHU  B A                         
  2c00  AD9FFCEE       JSR [0xfcee]                      
  2c04  3706           PULU  A B                         
  2c06  FD717E         STD 0x717e                        
  2c09  FC7180         LDD 0x7180                        
  2c0c  3606           PSHU  B A                         
  2c0e  CC622C         LDD #0x622c                       
  2c11  3606           PSHU  B A                         
  2c13  AD9FFCF2       JSR [0xfcf2]                      
  2c17  3706           PULU  A B                         
  2c19  F3717E         ADDD 0x717e                       
  2c1c  837FFF         SUBD #0x7fff                      
  2c1f  FD717E         STD 0x717e                        
  2c22  EC890004       LDD 0x4,X                         
  2c26  FD7180         STD 0x7180                        
  2c29  CC000A         LDD #0xa                          
  2c2c  AD9FFD20       JSR [0xfd20]                      
  2c30  10BE7180       LDY 0x7180                        
  2c34  FC717E         LDD 0x717e                        
  2c37  AD9FFD2E       JSR [0xfd2e]                      
  2c3b  3576           PULS  A B X Y U                   
  2c3d  39             RTS                               
PTR_FUN_M75_r4_08000__2cbc_M75_r4_08000__2c3e:
  2c3e  2CBC           addr M75_r4_08000::2cbc           
  2c40  2C88           addr M75_r4_08000::2c88           
  2c42  .db 2C 7C 70 62 70 C2 00 00 71 22 00 08 00 4D 0B 00  ; ,|pbp...q"...M..
  2c52  .db 00 3A 0C 00 14 01 06 1F 2C 94 00 00 00 00 00 00  ; .:......,.......
  2c62  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2c64
FUN_M75_r4_08000__2c64:
  2c64  3410           PSHS  X                           
  2c66  8E2C3E         LDX #0x2c3e                        ; desc[API_FE6A]: ->$2CBC ->$2C88
  2c69  AD9FFE6A       JSR [0xfe6a]                      
  2c6d  3510           PULS  X                           
  2c6f  39             RTS                               

; ---- function FUN_M75_r4_08000__2c70
FUN_M75_r4_08000__2c70:
  2c70  3410           PSHS  X                           
  2c72  8E2C3E         LDX #0x2c3e                        ; desc[API_FDBC]: ->$2CBC ->$2C88
  2c75  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..,>"
  2c79  3510           PULS  X                           
  2c7b  39             RTS                               

; ---- function FUN_M75_r4_08000__2c7c
FUN_M75_r4_08000__2c7c:
  2c7c  3410           PSHS  X                           
  2c7e  8E2C3E         LDX #0x2c3e                        ; desc[API_FE6C]: ->$2CBC ->$2C88
  2c81  AD9FFE6C       JSR [0xfe6c]                      
  2c85  3510           PULS  X                           
  2c87  39             RTS                               

; ---- function FUN_M75_r4_08000__2c88
FUN_M75_r4_08000__2c88:
  2c88  3410           PSHS  X                           
  2c8a  8E2C3E         LDX #0x2c3e                        ; desc[API_FE6E]: ->$2CBC ->$2C88
  2c8d  AD9FFE6E       JSR [0xfe6e]                      
  2c91  3510           PULS  X                           
  2c93  39             RTS                               
  2c94  .db 14 46 31 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F1 delay:      
  2ca4  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  2cb4  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__2cbc
FUN_M75_r4_08000__2cbc:
  2cbc  3476           PSHS  U Y X B A                   
  2cbe  8E2C3E         LDX #0x2c3e                       
  2cc1  AD9FFE76       JSR [0xfe76]                      
  2cc5  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3118(rel)
  2cc9  044F           dw 44Fh                           
LAB_M75_r4_08000__2ccb:
  2ccb  1F01           TFR D,X                           
  2ccd  17040E         LBSR 0x30de                       
  2cd0  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2d50_M75_r4_08000__2cd2:
  2cd2  2D50           addr M75_r4_08000::2d50           
  2cd4  2D1C           addr M75_r4_08000::2d1c           
  2cd6  .db 2D 10 70 6E 70 CE 00 00 71 2E 00 08 00 57 11 00  ; -.pnp...q....W..
  2ce6  .db 00 3A 0C 00 14 01 06 1F 2D 28 00 00 00 00 00 00  ; .:......-(......
  2cf6  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2cf8
FUN_M75_r4_08000__2cf8:
  2cf8  3410           PSHS  X                           
  2cfa  8E2CD2         LDX #0x2cd2                        ; desc[API_FE6A]: ->$2D50 ->$2D1C
  2cfd  AD9FFE6A       JSR [0xfe6a]                      
  2d01  3510           PULS  X                           
  2d03  39             RTS                               

; ---- function FUN_M75_r4_08000__2d04
FUN_M75_r4_08000__2d04:
  2d04  3410           PSHS  X                           
  2d06  8E2CD2         LDX #0x2cd2                        ; desc[API_FDBC]: ->$2D50 ->$2D1C
  2d09  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..,."
  2d0d  3510           PULS  X                           
  2d0f  39             RTS                               

; ---- function FUN_M75_r4_08000__2d10
FUN_M75_r4_08000__2d10:
  2d10  3410           PSHS  X                           
  2d12  8E2CD2         LDX #0x2cd2                        ; desc[API_FE6C]: ->$2D50 ->$2D1C
  2d15  AD9FFE6C       JSR [0xfe6c]                      
  2d19  3510           PULS  X                           
  2d1b  39             RTS                               

; ---- function FUN_M75_r4_08000__2d1c
FUN_M75_r4_08000__2d1c:
  2d1c  3410           PSHS  X                           
  2d1e  8E2CD2         LDX #0x2cd2                        ; desc[API_FE6E]: ->$2D50 ->$2D1C
  2d21  AD9FFE6E       JSR [0xfe6e]                      
  2d25  3510           PULS  X                           
  2d27  39             RTS                               
  2d28  .db 14 46 32 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F2 delay:      
  2d38  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  2d48  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__2d50
FUN_M75_r4_08000__2d50:
  2d50  3476           PSHS  U Y X B A                   
  2d52  8E2CD2         LDX #0x2cd2                       
  2d55  AD9FFE76       JSR [0xfe76]                      
  2d59  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3124(rel)
  2d5d  03C7           dw 3C7h                           
LAB_M75_r4_08000__2d5f:
  2d5f  1F01           TFR D,X                           
  2d61  17037A         LBSR 0x30de                       
  2d64  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2de4_M75_r4_08000__2d66:
  2d66  2DE4           addr M75_r4_08000::2de4           
  2d68  2DB0           addr M75_r4_08000::2db0           
  2d6a  .db 2D A4 70 7A 70 DA 00 00 71 3A 00 08 00 61 17 00  ; -.pzp...q:...a..
  2d7a  .db 00 3A 0C 00 14 01 06 1F 2D BC 00 00 00 00 00 00  ; .:......-.......
  2d8a  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2d8c
FUN_M75_r4_08000__2d8c:
  2d8c  3410           PSHS  X                           
  2d8e  8E2D66         LDX #0x2d66                        ; desc[API_FE6A]: ->$2DE4 ->$2DB0
  2d91  AD9FFE6A       JSR [0xfe6a]                      
  2d95  3510           PULS  X                           
  2d97  39             RTS                               

; ---- function FUN_M75_r4_08000__2d98
FUN_M75_r4_08000__2d98:
  2d98  3410           PSHS  X                           
  2d9a  8E2D66         LDX #0x2d66                        ; desc[API_FDBC]: ->$2DE4 ->$2DB0
  2d9d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..-f"
  2da1  3510           PULS  X                           
  2da3  39             RTS                               

; ---- function FUN_M75_r4_08000__2da4
FUN_M75_r4_08000__2da4:
  2da4  3410           PSHS  X                           
  2da6  8E2D66         LDX #0x2d66                        ; desc[API_FE6C]: ->$2DE4 ->$2DB0
  2da9  AD9FFE6C       JSR [0xfe6c]                      
  2dad  3510           PULS  X                           
  2daf  39             RTS                               

; ---- function FUN_M75_r4_08000__2db0
FUN_M75_r4_08000__2db0:
  2db0  3410           PSHS  X                           
  2db2  8E2D66         LDX #0x2d66                        ; desc[API_FE6E]: ->$2DE4 ->$2DB0
  2db5  AD9FFE6E       JSR [0xfe6e]                      
  2db9  3510           PULS  X                           
  2dbb  39             RTS                               
  2dbc  .db 14 46 33 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F3 delay:      
  2dcc  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  2ddc  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__2de4
FUN_M75_r4_08000__2de4:
  2de4  3476           PSHS  U Y X B A                   
  2de6  8E2D66         LDX #0x2d66                       
  2de9  AD9FFE76       JSR [0xfe76]                      
  2ded  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3130(rel)
  2df1  033F           dw 33Fh                           
LAB_M75_r4_08000__2df3:
  2df3  1F01           TFR D,X                           
  2df5  1702E6         LBSR 0x30de                       
  2df8  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2e78_M75_r4_08000__2dfa:
  2dfa  2E78           addr M75_r4_08000::2e78           
  2dfc  2E44           addr M75_r4_08000::2e44           
  2dfe  .db 2E 38 70 86 70 E6 00 00 71 46 00 08 00 6B 1D 00  ; .8p.p...qF...k..
  2e0e  .db 00 3A 0C 00 14 01 06 1F 2E 50 00 00 00 00 00 00  ; .:.......P......
  2e1e  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2e20
FUN_M75_r4_08000__2e20:
  2e20  3410           PSHS  X                           
  2e22  8E2DFA         LDX #0x2dfa                        ; desc[API_FE6A]: ->$2E78 ->$2E44
  2e25  AD9FFE6A       JSR [0xfe6a]                      
  2e29  3510           PULS  X                           
  2e2b  39             RTS                               

; ---- function FUN_M75_r4_08000__2e2c
FUN_M75_r4_08000__2e2c:
  2e2c  3410           PSHS  X                           
  2e2e  8E2DFA         LDX #0x2dfa                        ; desc[API_FDBC]: ->$2E78 ->$2E44
  2e31  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..-."
  2e35  3510           PULS  X                           
  2e37  39             RTS                               

; ---- function FUN_M75_r4_08000__2e38
FUN_M75_r4_08000__2e38:
  2e38  3410           PSHS  X                           
  2e3a  8E2DFA         LDX #0x2dfa                        ; desc[API_FE6C]: ->$2E78 ->$2E44
  2e3d  AD9FFE6C       JSR [0xfe6c]                      
  2e41  3510           PULS  X                           
  2e43  39             RTS                               

; ---- function FUN_M75_r4_08000__2e44
FUN_M75_r4_08000__2e44:
  2e44  3410           PSHS  X                           
  2e46  8E2DFA         LDX #0x2dfa                        ; desc[API_FE6E]: ->$2E78 ->$2E44
  2e49  AD9FFE6E       JSR [0xfe6e]                      
  2e4d  3510           PULS  X                           
  2e4f  39             RTS                               
  2e50  .db 14 46 34 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F4 delay:      
  2e60  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  2e70  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__2e78
FUN_M75_r4_08000__2e78:
  2e78  3476           PSHS  U Y X B A                   
  2e7a  8E2DFA         LDX #0x2dfa                       
  2e7d  AD9FFE76       JSR [0xfe76]                      
  2e81  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$313C(rel)
  2e85  02B7           dw 2B7h                           
LAB_M75_r4_08000__2e87:
  2e87  1F01           TFR D,X                           
  2e89  170252         LBSR 0x30de                       
  2e8c  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2f0c_M75_r4_08000__2e8e:
  2e8e  2F0C           addr M75_r4_08000::2f0c           
  2e90  2ED8           addr M75_r4_08000::2ed8           
  2e92  .db 2E CC 70 92 70 F2 00 00 71 52 00 08 00 75 23 00  ; ..p.p...qR...u#.
  2ea2  .db 00 3A 0C 00 14 01 06 1F 2E E4 00 00 00 00 00 00  ; .:..............
  2eb2  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2eb4
FUN_M75_r4_08000__2eb4:
  2eb4  3410           PSHS  X                           
  2eb6  8E2E8E         LDX #0x2e8e                        ; desc[API_FE6A]: ->$2F0C ->$2ED8
  2eb9  AD9FFE6A       JSR [0xfe6a]                      
  2ebd  3510           PULS  X                           
  2ebf  39             RTS                               

; ---- function FUN_M75_r4_08000__2ec0
FUN_M75_r4_08000__2ec0:
  2ec0  3410           PSHS  X                           
  2ec2  8E2E8E         LDX #0x2e8e                        ; desc[API_FDBC]: ->$2F0C ->$2ED8
  2ec5  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  2ec9  3510           PULS  X                           
  2ecb  39             RTS                               

; ---- function FUN_M75_r4_08000__2ecc
FUN_M75_r4_08000__2ecc:
  2ecc  3410           PSHS  X                           
  2ece  8E2E8E         LDX #0x2e8e                        ; desc[API_FE6C]: ->$2F0C ->$2ED8
  2ed1  AD9FFE6C       JSR [0xfe6c]                      
  2ed5  3510           PULS  X                           
  2ed7  39             RTS                               

; ---- function FUN_M75_r4_08000__2ed8
FUN_M75_r4_08000__2ed8:
  2ed8  3410           PSHS  X                           
  2eda  8E2E8E         LDX #0x2e8e                        ; desc[API_FE6E]: ->$2F0C ->$2ED8
  2edd  AD9FFE6E       JSR [0xfe6e]                      
  2ee1  3510           PULS  X                           
  2ee3  39             RTS                               
  2ee4  .db 14 46 35 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F5 delay:      
  2ef4  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  2f04  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__2f0c
FUN_M75_r4_08000__2f0c:
  2f0c  3476           PSHS  U Y X B A                   
  2f0e  8E2E8E         LDX #0x2e8e                       
  2f11  AD9FFE76       JSR [0xfe76]                      
  2f15  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3148(rel)
  2f19  022F           dw 22Fh                           
LAB_M75_r4_08000__2f1b:
  2f1b  1F01           TFR D,X                           
  2f1d  1701BE         LBSR 0x30de                       
  2f20  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__2fa0_M75_r4_08000__2f22:
  2f22  2FA0           addr M75_r4_08000::2fa0           
  2f24  2F6C           addr M75_r4_08000::2f6c           
  2f26  .db 2F 60 70 9E 70 FE 00 00 71 5E 00 08 00 7F 29 00  ; /`p.p...q^....).
  2f36  .db 00 3A 0C 00 14 01 06 1F 2F 78 00 00 00 00 00 00  ; .:....../x......
  2f46  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2f48
FUN_M75_r4_08000__2f48:
  2f48  3410           PSHS  X                           
  2f4a  8E2F22         LDX #0x2f22                        ; desc[API_FE6A]: ->$2FA0 ->$2F6C
  2f4d  AD9FFE6A       JSR [0xfe6a]                      
  2f51  3510           PULS  X                           
  2f53  39             RTS                               

; ---- function FUN_M75_r4_08000__2f54
FUN_M75_r4_08000__2f54:
  2f54  3410           PSHS  X                           
  2f56  8E2F22         LDX #0x2f22                        ; desc[API_FDBC]: ->$2FA0 ->$2F6C
  2f59  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94../""
  2f5d  3510           PULS  X                           
  2f5f  39             RTS                               

; ---- function FUN_M75_r4_08000__2f60
FUN_M75_r4_08000__2f60:
  2f60  3410           PSHS  X                           
  2f62  8E2F22         LDX #0x2f22                        ; desc[API_FE6C]: ->$2FA0 ->$2F6C
  2f65  AD9FFE6C       JSR [0xfe6c]                      
  2f69  3510           PULS  X                           
  2f6b  39             RTS                               

; ---- function FUN_M75_r4_08000__2f6c
FUN_M75_r4_08000__2f6c:
  2f6c  3410           PSHS  X                           
  2f6e  8E2F22         LDX #0x2f22                        ; desc[API_FE6E]: ->$2FA0 ->$2F6C
  2f71  AD9FFE6E       JSR [0xfe6e]                      
  2f75  3510           PULS  X                           
  2f77  39             RTS                               
  2f78  .db 14 46 36 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F6 delay:      
  2f88  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  2f98  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__2fa0
FUN_M75_r4_08000__2fa0:
  2fa0  3476           PSHS  U Y X B A                   
  2fa2  8E2F22         LDX #0x2f22                       
  2fa5  AD9FFE76       JSR [0xfe76]                      
  2fa9  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3154(rel)
  2fad  01A7           dw 1A7h                           
LAB_M75_r4_08000__2faf:
  2faf  1F01           TFR D,X                           
  2fb1  17012A         LBSR 0x30de                       
  2fb4  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__3034_M75_r4_08000__2fb6:
  2fb6  3034           addr M75_r4_08000::3034           
  2fb8  3000           addr M75_r4_08000::3000           
  2fba  .db 2F F4 70 AA 71 0A 00 00 71 6A 00 08 00 89 2F 00  ; /.p.q...qj..../.
  2fca  .db 00 3A 0C 00 14 01 06 1F 30 0C 00 00 00 00 00 00  ; .:......0.......
  2fda  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__2fdc
FUN_M75_r4_08000__2fdc:
  2fdc  3410           PSHS  X                           
  2fde  8E2FB6         LDX #0x2fb6                        ; desc[API_FE6A]: ->$3034 ->$3000
  2fe1  AD9FFE6A       JSR [0xfe6a]                      
  2fe5  3510           PULS  X                           
  2fe7  39             RTS                               

; ---- function FUN_M75_r4_08000__2fe8
FUN_M75_r4_08000__2fe8:
  2fe8  3410           PSHS  X                           
  2fea  8E2FB6         LDX #0x2fb6                        ; desc[API_FDBC]: ->$3034 ->$3000
  2fed  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94../."
  2ff1  3510           PULS  X                           
  2ff3  39             RTS                               

; ---- function FUN_M75_r4_08000__2ff4
FUN_M75_r4_08000__2ff4:
  2ff4  3410           PSHS  X                           
  2ff6  8E2FB6         LDX #0x2fb6                        ; desc[API_FE6C]: ->$3034 ->$3000
  2ff9  AD9FFE6C       JSR [0xfe6c]                      
  2ffd  3510           PULS  X                           
  2fff  39             RTS                               

; ---- function FUN_M75_r4_08000__3000
FUN_M75_r4_08000__3000:
  3000  3410           PSHS  X                           
  3002  8E2FB6         LDX #0x2fb6                        ; desc[API_FE6E]: ->$3034 ->$3000
  3005  AD9FFE6E       JSR [0xfe6e]                      
  3009  3510           PULS  X                           
  300b  39             RTS                               
  300c  .db 14 46 37 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F7 delay:      
  301c  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  302c  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__3034
FUN_M75_r4_08000__3034:
  3034  3476           PSHS  U Y X B A                   
  3036  8E2FB6         LDX #0x2fb6                       
  3039  AD9FFE76       JSR [0xfe76]                      
  303d  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3160(rel)
  3041  011F           dw 11Fh                           
LAB_M75_r4_08000__3043:
  3043  1F01           TFR D,X                           
  3045  170096         LBSR 0x30de                       
  3048  35F6           PULS  A B X Y U PC                
PTR_FUN_M75_r4_08000__30c8_M75_r4_08000__304a:
  304a  30C8           addr M75_r4_08000::30c8           
  304c  3094           addr M75_r4_08000::3094           
  304e  .db 30 88 70 B6 71 16 00 00 71 76 00 08 00 93 35 00  ; 0.p.q...qv....5.
  305e  .db 00 3A 0C 00 14 01 06 1F 30 A0 00 00 00 00 00 00  ; .:......0.......
  306e  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__3070
FUN_M75_r4_08000__3070:
  3070  3410           PSHS  X                           
  3072  8E304A         LDX #0x304a                        ; desc[API_FE6A]: ->$30C8 ->$3094
  3075  AD9FFE6A       JSR [0xfe6a]                      
  3079  3510           PULS  X                           
  307b  39             RTS                               

; ---- function FUN_M75_r4_08000__307c
FUN_M75_r4_08000__307c:
  307c  3410           PSHS  X                           
  307e  8E304A         LDX #0x304a                        ; desc[API_FDBC]: ->$30C8 ->$3094
  3081  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..0J"
  3085  3510           PULS  X                           
  3087  39             RTS                               

; ---- function FUN_M75_r4_08000__3088
FUN_M75_r4_08000__3088:
  3088  3410           PSHS  X                           
  308a  8E304A         LDX #0x304a                        ; desc[API_FE6C]: ->$30C8 ->$3094
  308d  AD9FFE6C       JSR [0xfe6c]                      
  3091  3510           PULS  X                           
  3093  39             RTS                               

; ---- function FUN_M75_r4_08000__3094
FUN_M75_r4_08000__3094:
  3094  3410           PSHS  X                           
  3096  8E304A         LDX #0x304a                        ; desc[API_FE6E]: ->$30C8 ->$3094
  3099  AD9FFE6E       JSR [0xfe6e]                      
  309d  3510           PULS  X                           
  309f  39             RTS                               
  30a0  .db 14 46 38 20 64 65 6C 61 79 3A 20 20 20 20 20 20  ; .F8 delay:      
  30b0  .db 20 20 20 6D 73 34 06 17 FF B6 C6 05 F7 60 66 CC  ;    ms4.......`f.
  30c0  .db 00 64 FD 60 DC 35 06 39                          ; .d.`.5.9

; ---- function FUN_M75_r4_08000__30c8
FUN_M75_r4_08000__30c8:
  30c8  3476           PSHS  U Y X B A                   
  30ca  8E304A         LDX #0x304a                       
  30cd  AD9FFE76       JSR [0xfe76]                      
  30d1  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$316C(rel)
  30d5  0097           dw 97h                            
LAB_M75_r4_08000__30d7:
  30d7  1F01           TFR D,X                           
  30d9  170002         LBSR 0x30de                       
  30dc  35F6           PULS  A B X Y U PC                

; ---- function FUN_M75_r4_08000__30de
FUN_M75_r4_08000__30de:
  30de  3476           PSHS  U Y X B A                   
  30e0  10AE890000     LDY 0x0,X                         
  30e5  ECA90004       LDD 0x4,Y                         
  30e9  3606           PSHU  B A                         
  30eb  FC7010         LDD 0x7010                        
  30ee  3606           PSHU  B A                         
  30f0  AD9FFCF2       JSR [0xfcf2]                      
  30f4  3706           PULU  A B                         
  30f6  1703D2         LBSR 0x34cb                       
  30f9  FD717E         STD 0x717e                        
  30fc  EC89000A       LDD 0xa,X                         
  3100  FD7180         STD 0x7180                        
  3103  CC000A         LDD #0xa                          
  3106  AD9FFD20       JSR [0xfd20]                      
  310a  10BE7180       LDY 0x7180                        
  310e  FC717E         LDD 0x717e                        
  3111  AD9FFD2E       JSR [0xfd2e]                      
  3115  3576           PULS  A B X Y U                   
  3117  39             RTS                               
DAT_M75_r4_08000__3118:
  3118  71             ?? 71h    q                       
  3119  .db 1E 00 01 00 02 00 03 00 04 00 05                 ; ...........
DAT_M75_r4_08000__3124:
  3124  71             ?? 71h    q                       
  3125  .db 2A 00 07 00 08 00 09 00 0A 00 0B                 ; *..........
DAT_M75_r4_08000__3130:
  3130  71             ?? 71h    q                       
  3131  .db 36 00 0D 00 0E 00 0F 00 10 00 11                 ; 6..........
DAT_M75_r4_08000__313c:
  313c  71             ?? 71h    q                       
  313d  .db 42 00 13 00 14 00 15 00 16 00 17                 ; B..........
DAT_M75_r4_08000__3148:
  3148  71             ?? 71h    q                       
  3149  .db 4E 00 19 00 1A 00 1B 00 1C 00 1D                 ; N..........
DAT_M75_r4_08000__3154:
  3154  71             ?? 71h    q                       
  3155  .db 5A 00 1F 00 20 00 21 00 22 00 23                 ; Z... .!.".#
DAT_M75_r4_08000__3160:
  3160  71             ?? 71h    q                       
  3161  .db 66 00 25 00 26 00 27 00 28 00 29                 ; f.%.&.'.(.)
DAT_M75_r4_08000__316c:
  316c  71             ?? 71h    q                       
  316d  .db 72 00 2B 00 2C 00 2D 00 2E 00 2F                 ; r.+.,.-.../
PTR_FUN_M75_r4_08000__31fb_M75_r4_08000__3178:
  3178  31FB           addr M75_r4_08000::31fb           
  317a  31C2           addr M75_r4_08000::31c2           
  317c  .db 31 B6 70 00 70 02 00 00 70 04 00 08 00 B8 03 00  ; 1.p.p...p.......
  318c  .db 00 00 64 00 01 00 03 1E 31 E6 00 00 00 00 70 06  ; ..d.....1.....p.
  319c  .db 00 B6                                            ; ..

; ---- function FUN_M75_r4_08000__319e
FUN_M75_r4_08000__319e:
  319e  3410           PSHS  X                           
  31a0  8E3178         LDX #0x3178                        ; desc[API_FE6A]: ->$31FB ->$31C2
  31a3  AD9FFE6A       JSR [0xfe6a]                      
  31a7  3510           PULS  X                           
  31a9  39             RTS                               

; ---- function FUN_M75_r4_08000__31aa
FUN_M75_r4_08000__31aa:
  31aa  3410           PSHS  X                           
  31ac  8E3178         LDX #0x3178                        ; desc[API_FDBC]: ->$31FB ->$31C2
  31af  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..1x"
  31b3  3510           PULS  X                           
  31b5  39             RTS                               

; ---- function FUN_M75_r4_08000__31b6
FUN_M75_r4_08000__31b6:
  31b6  3410           PSHS  X                           
  31b8  8E3178         LDX #0x3178                        ; desc[API_FE6C]: ->$31FB ->$31C2
  31bb  AD9FFE6C       JSR [0xfe6c]                      
  31bf  3510           PULS  X                           
  31c1  39             RTS                               

; ---- function FUN_M75_r4_08000__31c2
FUN_M75_r4_08000__31c2:
  31c2  3410           PSHS  X                           
  31c4  8E3178         LDX #0x3178                        ; desc[API_FE6E]: ->$31FB ->$31C2
  31c7  AD9FFE6E       JSR [0xfe6e]                      
  31cb  3510           PULS  X                           
  31cd  39             RTS                               

; ---- function FUN_M75_r4_08000__31ce
FUN_M75_r4_08000__31ce:
  31ce  3410           PSHS  X                           
  31d0  8E3178         LDX #0x3178                        ; desc[API_FE1C]: ->$31FB ->$31C2
  31d3  AD9FFE1C       JSR [0xfe1c]                      
  31d7  3510           PULS  X                           
  31d9  39             RTS                               

; ---- function FUN_M75_r4_08000__31da
FUN_M75_r4_08000__31da:
  31da  3410           PSHS  X                           
  31dc  8E3178         LDX #0x3178                        ; desc[API_FE1A]: ->$31FB ->$31C2 $31B6
  31df  AD9FFE1A       JSR [0xfe1a]                      
  31e3  3510           PULS  X                           
  31e5  39             RTS                               
  31e6  .db 14 6D 69 78 3A 20 20 20 20 20 20 20 20 20 20 25  ; .mix:          %
  31f6  .db 20 20 77 65 74                                   ;   wet

; ---- function FUN_M75_r4_08000__31fb
FUN_M75_r4_08000__31fb:
  31fb  3476           PSHS  U Y X B A                   
  31fd  8E3178         LDX #0x3178                       
  3200  AD9FFE76       JSR [0xfe76]                      
  3204  CC0064         LDD #0x64                         
  3207  B37004         SUBD 0x7004                       
  320a  3606           PSHU  B A                         
  320c  58             LSLB                              
  320d  49             ROLA                              
  320e  FD717E         STD 0x717e                        
  3211  CC4666         LDD #0x4666                       
  3214  3606           PSHU  B A                         
  3216  AD9FFCF2       JSR [0xfcf2]                      
  321a  3706           PULU  A B                         
  321c  F3717E         ADDD 0x717e                       
  321f  AD9FFC6A       JSR [0xfc6a]                      
  3223  AD9FFC72       JSR [0xfc72]                      
  3227  3576           PULS  A B X Y U                   
  3229  39             RTS                               
PTR_FUN_M75_r4_08000__3295_M75_r4_08000__322a:
  322a  3295           addr M75_r4_08000::3295           
  322c  3274           addr M75_r4_08000::3274           
  322e  .db 32 68 70 46 70 48 00 00 70 4A 00 08 00 21 04 FF  ; 2hpFpH..pJ...!..
  323e  .db D0 00 30 00 01 00 03 1C 32 80 00 00 00 00 00 00  ; ..0.....2.......
  324e  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__3250
FUN_M75_r4_08000__3250:
  3250  3410           PSHS  X                           
  3252  8E322A         LDX #0x322a                       
  3255  AD9FFE74       JSR [0xfe74]                      
  3259  3510           PULS  X                           
  325b  39             RTS                               

; ---- function FUN_M75_r4_08000__325c
FUN_M75_r4_08000__325c:
  325c  3410           PSHS  X                           
  325e  8E322A         LDX #0x322a                        ; desc[API_FE22]: ->$3295 ->$3274
  3261  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3265  3510           PULS  X                           
  3267  39             RTS                               

; ---- function FUN_M75_r4_08000__3268
FUN_M75_r4_08000__3268:
  3268  3410           PSHS  X                           
  326a  8E322A         LDX #0x322a                       
  326d  AD9FFE70       JSR [0xfe70]                      
  3271  3510           PULS  X                           
  3273  39             RTS                               

; ---- function FUN_M75_r4_08000__3274
FUN_M75_r4_08000__3274:
  3274  3410           PSHS  X                           
  3276  8E322A         LDX #0x322a                       
  3279  AD9FFE72       JSR [0xfe72]                      
  327d  3510           PULS  X                           
  327f  39             RTS                               
  3280  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  3290  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__3295
FUN_M75_r4_08000__3295:
  3295  3476           PSHS  U Y X B A                   
  3297  8E322A         LDX #0x322a                       
  329a  AD9FFE76       JSR [0xfe76]                      
  329e  AD9FFE52       JSR [0xfe52]                      
  32a2  3576           PULS  A B X Y U                   
  32a4  39             RTS                               
PTR_FUN_M75_r4_08000__3310_M75_r4_08000__32a5:
  32a5  3310           addr M75_r4_08000::3310           
  32a7  32EF           addr M75_r4_08000::32ef           
  32a9  .db 32 E3 70 4C 70 4E 00 00 70 50 00 08 00 22 05 FF  ; 2.pLpN..pP..."..
  32b9  .db D0 00 30 00 01 00 03 1D 32 FB 00 00 00 00 00 00  ; ..0.....2.......
  32c9  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__32cb
FUN_M75_r4_08000__32cb:
  32cb  3410           PSHS  X                           
  32cd  8E32A5         LDX #0x32a5                       
  32d0  AD9FFE74       JSR [0xfe74]                      
  32d4  3510           PULS  X                           
  32d6  39             RTS                               

; ---- function FUN_M75_r4_08000__32d7
FUN_M75_r4_08000__32d7:
  32d7  3410           PSHS  X                           
  32d9  8E32A5         LDX #0x32a5                        ; desc[API_FE22]: ->$3310 ->$32EF
  32dc  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  32e0  3510           PULS  X                           
  32e2  39             RTS                               

; ---- function FUN_M75_r4_08000__32e3
FUN_M75_r4_08000__32e3:
  32e3  3410           PSHS  X                           
  32e5  8E32A5         LDX #0x32a5                       
  32e8  AD9FFE70       JSR [0xfe70]                      
  32ec  3510           PULS  X                           
  32ee  39             RTS                               

; ---- function FUN_M75_r4_08000__32ef
FUN_M75_r4_08000__32ef:
  32ef  3410           PSHS  X                           
  32f1  8E32A5         LDX #0x32a5                       
  32f4  AD9FFE72       JSR [0xfe72]                      
  32f8  3510           PULS  X                           
  32fa  39             RTS                               
  32fb  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  330b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__3310
FUN_M75_r4_08000__3310:
  3310  3476           PSHS  U Y X B A                   
  3312  8E32A5         LDX #0x32a5                       
  3315  AD9FFE76       JSR [0xfe76]                      
  3319  AD9FFE54       JSR [0xfe54]                      
  331d  3576           PULS  A B X Y U                   
  331f  39             RTS                               
PTR_FUN_M75_r4_08000__338b_M75_r4_08000__3320:
  3320  338B           addr M75_r4_08000::338b           
  3322  336A           addr M75_r4_08000::336a           
  3324  .db 33 5E 70 52 70 54 00 00 70 56 00 08 00 23 06 FF  ; 3^pRpT..pV...#..
  3334  .db D0 00 30 00 01 00 03 1D 33 76 00 00 00 00 00 00  ; ..0.....3v......
  3344  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__3346
FUN_M75_r4_08000__3346:
  3346  3410           PSHS  X                           
  3348  8E3320         LDX #0x3320                       
  334b  AD9FFE74       JSR [0xfe74]                      
  334f  3510           PULS  X                           
  3351  39             RTS                               

; ---- function FUN_M75_r4_08000__3352
FUN_M75_r4_08000__3352:
  3352  3410           PSHS  X                           
  3354  8E3320         LDX #0x3320                        ; desc[API_FE22]: ->$338B ->$336A
  3357  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  335b  3510           PULS  X                           
  335d  39             RTS                               

; ---- function FUN_M75_r4_08000__335e
FUN_M75_r4_08000__335e:
  335e  3410           PSHS  X                           
  3360  8E3320         LDX #0x3320                       
  3363  AD9FFE70       JSR [0xfe70]                      
  3367  3510           PULS  X                           
  3369  39             RTS                               

; ---- function FUN_M75_r4_08000__336a
FUN_M75_r4_08000__336a:
  336a  3410           PSHS  X                           
  336c  8E3320         LDX #0x3320                       
  336f  AD9FFE72       JSR [0xfe72]                      
  3373  3510           PULS  X                           
  3375  39             RTS                               
  3376  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  3386  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M75_r4_08000__338b
FUN_M75_r4_08000__338b:
  338b  3476           PSHS  U Y X B A                   
  338d  8E3320         LDX #0x3320                       
  3390  AD9FFE76       JSR [0xfe76]                      
  3394  AD9FFE56       JSR [0xfe56]                      
  3398  3576           PULS  A B X Y U                   
  339a  39             RTS                               
PTR_FUN_M75_r4_08000__3406_M75_r4_08000__339b:
  339b  3406           addr M75_r4_08000::3406           
  339d  33E5           addr M75_r4_08000::33e5           
  339f  .db 33 D9 70 58 70 5A 00 00 70 5C 00 08 00 24 07 FF  ; 3.pXpZ..p\...$..
  33af  .db D0 00 30 00 01 00 03 1E 33 F1 00 00 00 00 00 00  ; ..0.....3.......
  33bf  .db 00 00                                            ; ..

; ---- function FUN_M75_r4_08000__33c1
FUN_M75_r4_08000__33c1:
  33c1  3410           PSHS  X                           
  33c3  8E339B         LDX #0x339b                       
  33c6  AD9FFE74       JSR [0xfe74]                      
  33ca  3510           PULS  X                           
  33cc  39             RTS                               

; ---- function FUN_M75_r4_08000__33cd
FUN_M75_r4_08000__33cd:
  33cd  3410           PSHS  X                           
  33cf  8E339B         LDX #0x339b                        ; desc[API_FE22]: ->$3406 ->$33E5
  33d2  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  33d6  3510           PULS  X                           
  33d8  39             RTS                               

; ---- function FUN_M75_r4_08000__33d9
FUN_M75_r4_08000__33d9:
  33d9  3410           PSHS  X                           
  33db  8E339B         LDX #0x339b                       
  33de  AD9FFE70       JSR [0xfe70]                      
  33e2  3510           PULS  X                           
  33e4  39             RTS                               

; ---- function FUN_M75_r4_08000__33e5
FUN_M75_r4_08000__33e5:
  33e5  3410           PSHS  X                           
  33e7  8E339B         LDX #0x339b                       
  33ea  AD9FFE72       JSR [0xfe72]                      
  33ee  3510           PULS  X                           
  33f0  39             RTS                               
  33f1  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  3401  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M75_r4_08000__3406
FUN_M75_r4_08000__3406:
  3406  3476           PSHS  U Y X B A                   
  3408  8E339B         LDX #0x339b                       
  340b  AD9FFE76       JSR [0xfe76]                      
  340f  AD9FFE58       JSR [0xfe58]                      
  3413  3576           PULS  A B X Y U                   
  3415  39             RTS                               

; ---- function FUN_M75_r4_08000__3416
FUN_M75_r4_08000__3416:
  3416  3476           PSHS  U Y X B A                   
  3418  10AE84         LDY ,X                            
  341b  EC26           LDD 0x6,Y                         
  341d  2608           BNE 0x3427                        
  341f  FD7182         STD 0x7182                        
  3422  FD7184         STD 0x7184                        
  3425  2050           BRA 0x3477                        
LAB_M75_r4_08000__3427:
  3427  3606           PSHU  B A                         
  3429  CC000E         LDD #0xe                          
  342c  3606           PSHU  B A                         
  342e  AD9FFCEC       JSR [0xfcec]                      
  3432  3706           PULU  A B                         
  3434  FD7180         STD 0x7180                        
  3437  3606           PSHU  B A                         
  3439  CC000B         LDD #0xb                          
  343c  3606           PSHU  B A                         
  343e  AD9FFCEC       JSR [0xfcec]                      
  3442  3706           PULU  A B                         
  3444  FD717E         STD 0x717e                        
  3447  FC7180         LDD 0x7180                        
  344a  3606           PSHU  B A                         
  344c  EC28           LDD 0x8,Y                         
  344e  83000B         SUBD #0xb                         
  3451  3606           PSHU  B A                         
  3453  AD9FFCEC       JSR [0xfcec]                      
  3457  FC7024         LDD 0x7024                        
  345a  3606           PSHU  B A                         
  345c  AD9FFCF2       JSR [0xfcf2]                      
  3460  3706           PULU  A B                         
  3462  FD7180         STD 0x7180                        
  3465  FC717E         LDD 0x717e                        
  3468  F37180         ADDD 0x7180                       
  346b  FD7182         STD 0x7182                        
  346e  FC717E         LDD 0x717e                        
  3471  B37180         SUBD 0x7180                       
  3474  FD7184         STD 0x7184                        
LAB_M75_r4_08000__3477:
  3477  EC08           LDD 0x8,X                         
  3479  FD717E         STD 0x717e                        
  347c  EC06           LDD 0x6,X                         
  347e  FD7180         STD 0x7180                        
  3481  CC000A         LDD #0xa                          
  3484  AD9FFD20       JSR [0xfd20]                      
  3488  10BE717E       LDY 0x717e                        
  348c  FC7182         LDD 0x7182                        
  348f  AD9FFD2E       JSR [0xfd2e]                      
  3493  CC000A         LDD #0xa                          
  3496  AD9FFD20       JSR [0xfd20]                      
  349a  10BE7180       LDY 0x7180                        
  349e  FC7184         LDD 0x7184                        
  34a1  AD9FFD2E       JSR [0xfd2e]                      
  34a5  35F6           PULS  A B X Y U PC                

; ---- function FUN_M75_r4_08000__34a7
FUN_M75_r4_08000__34a7:
  34a7  3430           PSHS  Y X                         
  34a9  3606           PSHU  B A                         
  34ab  3606           PSHU  B A                         
  34ad  CC0003         LDD #0x3                          
  34b0  3606           PSHU  B A                         
  34b2  AD9FFCEC       JSR [0xfcec]                      
  34b6  AD9FFCFC       JSR [0xfcfc]                      
  34ba  CC236B         LDD #0x236b                       
  34bd  3606           PSHU  B A                         
  34bf  AD9FFCF2       JSR [0xfcf2]                      
  34c3  AD9FFCE2       JSR [0xfce2]                      
  34c7  3706           PULU  A B                         
  34c9  35B0           PULS  X Y PC                      

; ---- function FUN_M75_r4_08000__34cb
FUN_M75_r4_08000__34cb:
  34cb  3430           PSHS  Y X                         
  34cd  3606           PSHU  B A                         
  34cf  58             LSLB                              
  34d0  49             ROLA                              
  34d1  58             LSLB                              
  34d2  49             ROLA                              
  34d3  3606           PSHU  B A                         
  34d5  AD9FFCFC       JSR [0xfcfc]                      
  34d9  CC347F         LDD #0x347f                       
  34dc  3606           PSHU  B A                         
  34de  AD9FFCF2       JSR [0xfcf2]                      
  34e2  AD9FFCE2       JSR [0xfce2]                      
  34e6  3706           PULU  A B                         
  34e8  C30001         ADDD #0x1                         
  34eb  35B0           PULS  X Y PC                      

; ---- function FUN_M75_r4_08000__34ed
FUN_M75_r4_08000__34ed:
  34ed  3416           PSHS  X B A                       
  34ef  327C           LEAS -0x4,S                       
  34f1  CC0000         LDD #0x0                          
  34f4  ED62           STD 0x2,S                         
  34f6  3706           PULU  A B                         
  34f8  47             ASRA                              
  34f9  56             RORB                              
  34fa  EDE4           STD ,S                            
  34fc  3706           PULU  A B                         
  34fe  8E000F         LDX #0xf                          
LAB_M75_r4_08000__3501:
  3501  10A3E4         CMPD ,S                           
  3504  250C           BCS 0x3512                        
  3506  A3E4           SUBD ,S                           
  3508  6863           LSL 0x3,S                         
  350a  6962           ROL 0x2,S                         
  350c  59             ROLB                              
  350d  49             ROLA                              
  350e  6C63           INC 0x3,S                         
  3510  2006           BRA 0x3518                        
LAB_M75_r4_08000__3512:
  3512  6863           LSL 0x3,S                         
  3514  6962           ROL 0x2,S                         
  3516  59             ROLB                              
  3517  49             ROLA                              
LAB_M75_r4_08000__3518:
  3518  301F           LEAX -0x1,X                       
  351a  26E5           BNE 0x3501                        
  351c  EC62           LDD 0x2,S                         
  351e  3606           PSHU  B A                         
  3520  3264           LEAS 0x4,S                        
  3522  3596           PULS  A B X PC                    
  3524  .db 3B                                               ; ;

;; Module 7A code record 02, 508 bytes, entered at payload start
MODULE_7A_02_CODE_hdr:
  3525  7A0202040000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_7A_02_entry
MODULE_7A_02_entry:
  352d  3436           PSHS  Y X B A                     
  352f  170005         LBSR 0x3537                       
  3532  17E7D9         LBSR 0x1d0e                       
  3535  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__3537
FUN_M75_r4_08000__3537:
  3537  3436           PSHS  Y X B A                     
  3539  108E7196       LDY #0x7196                       
  353d  8680           LDA #0x80                         
LAB_M75_r4_08000__353f:
  353f  6FA0           CLR ,Y+                           
  3541  4A             DECA                              
  3542  26FB           BNE 0x353f                        
  3544  1700BB         LBSR 0x3602                       
  3547  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3601(rel)
  354b  00B6           dw B6h                            
LAB_M75_r4_08000__354d:
  354d  EDA90003       STD 0x3,Y                         
  3551  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3563(rel)
  3555  000E           dw Eh                             
LAB_M75_r4_08000__3557:
  3557  EDA90001       STD 0x1,Y                         
  355b  CC0000         LDD #0x0                          
  355e  FD7228         STD 0x7228                        
  3561  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__3563
FUN_M75_r4_08000__3563:
  3563  3436           PSHS  Y X B A                     
  3565  7D608A         TST 0x608a                        
  3568  2B0B           BMI 0x3575                        
  356a  E661           LDB 0x1,S                         
  356c  C40F           ANDB #0xf                         
  356e  F1608A         CMPB 0x608a                       
  3571  1026000C       LBNE 0x3581                       
LAB_M75_r4_08000__3575:
  3575  E661           LDB 0x1,S                         
  3577  C4F0           ANDB #0xf0                        
  3579  C190           CMPB #0x90                        
  357b  2713           BEQ 0x3590                        
  357d  C180           CMPB #0x80                        
  357f  2717           BEQ 0x3598                        
LAB_M75_r4_08000__3581:
  3581  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$3601(rel)
  3585  007C           dw 7Ch                            

; ---- function FUN_M75_r4_08000__3587
FUN_M75_r4_08000__3587:
  3587  170078         LBSR 0x3602                       
  358a  EDA90003       STD 0x3,Y                         
  358e  35B6           PULS  A B X Y PC                  
LAB_M75_r4_08000__3590:
  3590  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$35A0(rel)
  3594  000C           dw Ch                             
LAB_M75_r4_08000__3596:
  3596  20EF           BRA 0x3587                        
LAB_M75_r4_08000__3598:
  3598  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$35CB(rel)
  359c  002F           dw 2Fh                            
LAB_M75_r4_08000__359e:
  359e  20E7           BRA 0x3587                        

; ---- function FUN_M75_r4_08000__35a0
FUN_M75_r4_08000__35a0:
  35a0  3436           PSHS  Y X B A                     
  35a2  F77216         STB 0x7216                        
  35a5  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$35AD(rel)
  35a9  0004           dw 4h                             
LAB_M75_r4_08000__35ab:
  35ab  20DA           BRA 0x3587                        

; ---- function FUN_M75_r4_08000__35ad
FUN_M75_r4_08000__35ad:
  35ad  3436           PSHS  Y X B A                     
  35af  B67216         LDA 0x7216                        
  35b2  108E7196       LDY #0x7196                       
  35b6  5D             TSTB                              
  35b7  2707           BEQ 0x35c0                        
  35b9  E7A6           STB A,Y                           
  35bb  170056         LBSR 0x3614                       
  35be  2003           BRA 0x35c3                        
LAB_M75_r4_08000__35c0:
  35c0  170022         LBSR 0x35e5                       
LAB_M75_r4_08000__35c3:
  35c3  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$35A0(rel)
  35c7  FFD9           dw FFD9h                          
LAB_M75_r4_08000__35c9:
  35c9  20BC           BRA 0x3587                        

; ---- function FUN_M75_r4_08000__35cb
FUN_M75_r4_08000__35cb:
  35cb  3436           PSHS  Y X B A                     
  35cd  F77216         STB 0x7216                        
  35d0  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$35D8(rel)
  35d4  0004           dw 4h                             
LAB_M75_r4_08000__35d6:
  35d6  20AF           BRA 0x3587                        

; ---- function FUN_M75_r4_08000__35d8
FUN_M75_r4_08000__35d8:
  35d8  3436           PSHS  Y X B A                     
  35da  170008         LBSR 0x35e5                       
  35dd  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$35CB(rel)
  35e1  FFEA           dw FFEAh                          
LAB_M75_r4_08000__35e3:
  35e3  20A2           BRA 0x3587                        

; ---- function FUN_M75_r4_08000__35e5
FUN_M75_r4_08000__35e5:
  35e5  3436           PSHS  Y X B A                     
  35e7  B67216         LDA 0x7216                        
  35ea  108E7196       LDY #0x7196                       
  35ee  6FA6           CLR A,Y                           
  35f0  B6722A         LDA 0x722a                        
  35f3  8102           CMPA #0x2                         
  35f5  2608           BNE 0x35ff                        
  35f7  17011D         LBSR 0x3717                       
  35fa  2603           BNE 0x35ff                        
  35fc  7F7228         CLR 0x7228                        
LAB_M75_r4_08000__35ff:
  35ff  35B6           PULS  A B X Y PC                  
DAT_M75_r4_08000__3601:
  3601  39             ?? 39h    9                       

; ---- function FUN_M75_r4_08000__3602
FUN_M75_r4_08000__3602:
  3602  3416           PSHS  X B A                       
  3604  C60F           LDB #0xf                          
  3606  8630           LDA #0x30                         
  3608  3D             MUL                               
  3609  C36B00         ADDD #0x6b00                      
  360c  1F02           TFR D,Y                           
  360e  3596           PULS  A B X PC                    

; ---- function FUN_M75_r4_08000__3610
FUN_M75_r4_08000__3610:
  3610  7F7228         CLR 0x7228                        
  3613  39             RTS                               

; ---- function FUN_M75_r4_08000__3614
FUN_M75_r4_08000__3614:
  3614  3436           PSHS  Y X B A                     
  3616  C6FF           LDB #0xff                         
  3618  F7722B         STB 0x722b                        
  361b  F6722A         LDB 0x722a                        
  361e  C102           CMPB #0x2                         
  3620  2726           BEQ 0x3648                        
  3622  C103           CMPB #0x3                         
  3624  2709           BEQ 0x362f                        
  3626  CC0014         LDD #0x14                         
  3629  AD9FFCB4       JSR [0xfcb4]                      
LAB_M75_r4_08000__362d:
  362d  35B6           PULS  A B X Y PC                  
LAB_M75_r4_08000__362f:
  362f  F67228         LDB 0x7228                        
  3632  8E721F         LDX #0x721f                       
  3635  B67216         LDA 0x7216                        
  3638  A785           STA B,X                           
  363a  5C             INCB                              
  363b  C108           CMPB #0x8                         
  363d  2601           BNE 0x3640                        
  363f  5F             CLRB                              
LAB_M75_r4_08000__3640:
  3640  F77228         STB 0x7228                        
  3643  17E6C8         LBSR 0x1d0e                       
  3646  20E5           BRA 0x362d                        
LAB_M75_r4_08000__3648:
  3648  F67228         LDB 0x7228                        
  364b  C108           CMPB #0x8                         
  364d  27DE           BEQ 0x362d                        
  364f  8E7217         LDX #0x7217                       
  3652  B67216         LDA 0x7216                        
  3655  A785           STA B,X                           
  3657  5C             INCB                              
  3658  F77228         STB 0x7228                        
  365b  17004F         LBSR 0x36ad                       
  365e  17E6AD         LBSR 0x1d0e                       
  3661  20CA           BRA 0x362d                        

; ---- function FUN_M75_r4_08000__3663
FUN_M75_r4_08000__3663:
  3663  3436           PSHS  Y X B A                     
  3665  7D722B         TST 0x722b                        
  3668  2713           BEQ 0x367d                        
  366a  F6722A         LDB 0x722a                        
  366d  C101           CMPB #0x1                         
  366f  260C           BNE 0x367d                        
  3671  AD9FFCB6       JSR [0xfcb6]                      
  3675  2606           BNE 0x367d                        
  3677  7F722B         CLR 0x722b                        
  367a  170002         LBSR 0x367f                       
LAB_M75_r4_08000__367d:
  367d  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__367f
FUN_M75_r4_08000__367f:
  367f  3436           PSHS  Y X B A                     
  3681  F6722A         LDB 0x722a                        
  3684  2725           BEQ 0x36ab                        
  3686  7F7227         CLR 0x7227                        
  3689  108E7217       LDY #0x7217                       
  368d  8E7196         LDX #0x7196                       
  3690  5F             CLRB                              
  3691  4F             CLRA                              
LAB_M75_r4_08000__3692:
  3692  6D86           TST A,X                           
  3694  2703           BEQ 0x3699                        
  3696  A7A5           STA B,Y                           
  3698  5C             INCB                              
LAB_M75_r4_08000__3699:
  3699  4C             INCA                              
  369a  8180           CMPA #0x80                        
  369c  2704           BEQ 0x36a2                        
  369e  C108           CMPB #0x8                         
  36a0  26F0           BNE 0x3692                        
LAB_M75_r4_08000__36a2:
  36a2  F77227         STB 0x7227                        
  36a5  170005         LBSR 0x36ad                       
  36a8  17E663         LBSR 0x1d0e                       
LAB_M75_r4_08000__36ab:
  36ab  35B6           PULS  A B X Y PC                  

; ---- function FUN_M75_r4_08000__36ad
FUN_M75_r4_08000__36ad:
  36ad  3436           PSHS  Y X B A                     
  36af  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$36D7(rel)
  36b3  0024           dw 24h                            
LAB_M75_r4_08000__36b5:
  36b5  3406           PSHS  B A                         
  36b7  E663           LDB 0x3,S                         
  36b9  5A             DECB                              
  36ba  8608           LDA #0x8                          
  36bc  3D             MUL                               
  36bd  E3E1           ADDD ,S++                         
  36bf  1F01           TFR D,X                           
  36c1  4F             CLRA                              
LAB_M75_r4_08000__36c2:
  36c2  E686           LDB A,X                           
  36c4  108E7217       LDY #0x7217                       
  36c8  E6A5           LDB B,Y                           
  36ca  108E721F       LDY #0x721f                       
  36ce  E7A6           STB A,Y                           
  36d0  4C             INCA                              
  36d1  8108           CMPA #0x8                         
  36d3  26ED           BNE 0x36c2                        
  36d5  35B6           PULS  A B X Y PC                  
DAT_M75_r4_08000__36d7:
  36d7  00             ?? 00h                            
  36d8  .db 00 00 00 00 00 00 00 00 00 00 00 01 01 01 01 00  ; ................
  36e8  .db 00 00 01 01 02 02 02 00 00 01 01 02 02 03 03 00  ; ................
  36f8  .db 00 01 02 03 03 04 04 00 00 01 02 03 04 05 05 00  ; ................
  3708  .db 01 02 03 04 05 06 06 00 01 02 03 04 05 06 07     ; ...............

; ---- function FUN_M75_r4_08000__3717
FUN_M75_r4_08000__3717:
  3717  3436           PSHS  Y X B A                     
  3719  8E7196         LDX #0x7196                       
  371c  5F             CLRB                              
  371d  4F             CLRA                              
LAB_M75_r4_08000__371e:
  371e  6D86           TST A,X                           
  3720  2605           BNE 0x3727                        
  3722  4C             INCA                              
  3723  8180           CMPA #0x80                        
  3725  26F7           BNE 0x371e                        
LAB_M75_r4_08000__3727:
  3727  35B6           PULS  A B X Y PC                  

;; TMS32010 program 75 for DSP 1: 218 words loaded at $800 (written via bank latch $81)
DSPPROG_75_DSP1_hdr:
  3729  751001BE0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_75_DSP1:
  3731  08007F8B6E00.. dw[219]                           

;; TMS32010 program 75 for DSP 2: 231 words loaded at $800 (written via bank latch $82)
DSPPROG_75_DSP2_hdr:
  38e7  751101D80000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_75_DSP2:
  38ef  08007F8B6E00.. dw[232]                           

;; TMS32010 program 75 for DSP 3: 210 words loaded at $800 (written via bank latch $83)
DSPPROG_75_DSP3_hdr:
  3abf  751201AE0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_75_DSP3:
  3ac7  08007F8B6E00.. dw[211]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3c6d  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3c75  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c85  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c95  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ca5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cb5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cc5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cd5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ce5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cf5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d05  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d15  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d25  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d35  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d45  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d55  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d65  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d75  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d85  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d95  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3da5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3db5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dc5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dd5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3de5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3df5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e05  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e15  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e25  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e35  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e45  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e55  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e65  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e75  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e85  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e95  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ea5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eb5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ec5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ed5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ee5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f05  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f15  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f25  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f35  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f45  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f55  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f65  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f75  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f85  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f95  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe5  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff5  .db FF FF FF FF FF FF FF FF FF FF FF                 ; ...........
