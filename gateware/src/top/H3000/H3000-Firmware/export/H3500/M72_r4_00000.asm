; H3500  block M72_r4_00000  M72_r4_00000::0000-M72_r4_00000::3fff
; Bank r4_00000 (module id 72, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 72 parameter/preset table "DENSE ROOM", 233 bytes
MODULE_72_TABLE_DENSE_ROOM_hdr:
  0008  720000F10000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_72_TABLE_DENSE_ROOM:
  0010  72             ?? 72h    r                       
  0011  .db 01                                               ; .
  0012  44454E534520.. ds "DENSE ROOM     "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0044  .db 00 00 00 00 00 00 00 00 00 00 64 00 64 00 19 00  ; ..........d.d...
  0054  .db 4A 00 32 00 64 00 19 01 F4 00 0C 00 18 00 0A 00  ; J.2.d...........
  0064  .db 14 00 32 00 64 03 E8 03 E8 05 81 06 65 07 27 07  ; ..2.d.......e.'.
  0074  .db E1 09 05 09 EF 01 C9 02 65 03 09 01 F4 02 26 02  ; ........e.....&.
  0084  .db 58 00 0A 00 0A 00 00 00 14 00 00 00 14 00 14 00  ; X...............
  0094  .db 14 00 14 00 14 00 14 00 14 00 19 00 19 00 32 00  ; ..............2.
  00a4  .db 32 00 64 00 64 00 64 00 64 00 64 00 64 00 64 00  ; 2.d.d.d.d.d.d.d.
  00b4  .db 64 03 E8 03 E8 02 02 02 02 02 32 00              ; d.........2.
  00c0  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  00e4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13  ; ................
  00f4  .db 88 13 88 13 88                                   ; .....

;; Module 72 code record 01, 9592 bytes, entered at payload start
MODULE_72_01_CODE_hdr:
  00f9  720125800000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_72_01_entry
MODULE_72_01_entry:
  0101  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0105
  0105  0105           dw 105h                           
LAB_M72_r4_00000__0107:
  0107  3477           PSHS  U Y X B A CC                
  0109  1700E7         LBSR 0x01f3                       
  010c  17007F         LBSR 0x018e                       
  010f  17018C         LBSR 0x029e                       
  0112  8603           LDA #0x3                          
  0114  B760DA         STA 0x60da                        
  0117  AD9FFE38       JSR [0xfe38]                      
  011b  B6600A         LDA 0x600a                        
  011e  8172           CMPA #0x72                        
  0120  2707           BEQ 0x0129                        
  0122  AD9FFED0       JSR [0xfed0]                      
  0126  170035         LBSR 0x015e                       
LAB_M72_r4_00000__0129:
  0129  170191         LBSR 0x02bd                       
  012c  1701DB         LBSR 0x030a                       
  012f  8601           LDA #0x1                          
  0131  B76105         STA 0x6105                        
  0134  CC00B1         LDD #0xb1                         
  0137  FD6106         STD 0x6106                        
  013a  B6600A         LDA 0x600a                        
  013d  8172           CMPA #0x72                        
  013f  2707           BEQ 0x0148                        
  0141  CC4E20         LDD #0x4e20                       
  0144  AD9FFD20       JSR [0xfd20]                      
LAB_M72_r4_00000__0148:
  0148  AD9FFE36       JSR [0xfe36]                      
  014c  AD9FFDF6       JSR [0xfdf6]                      
  0150  AD9FFE18       JSR [0xfe18]                      
  0154  17047A         LBSR 0x05d1                       
  0157  AD9FFE10       JSR [0xfe10]                      
  015b  3577           PULS CC A B X Y U                 
  015d  39             RTS                               

; ---- function FUN_M72_r4_00000__015e
FUN_M72_r4_00000__015e:
  015e  3476           PSHS  U Y X B A                   
  0160  C601           LDB #0x1                          
  0162  8E7210         LDX #0x7210                       
  0165  AD9FFD30       JSR [0xfd30]                      
  0169  1026042E       LBNE 0x059b                       
  016d  C602           LDB #0x2                          
  016f  8E7211         LDX #0x7211                       
  0172  AD9FFD30       JSR [0xfd30]                      
  0176  10260421       LBNE 0x059b                       
  017a  C603           LDB #0x3                          
  017c  8E7212         LDX #0x7212                       
  017f  AD9FFD30       JSR [0xfd30]                      
  0183  10260414       LBNE 0x059b                       
  0187  AD9FFD7C       JSR [0xfd7c]                      
  018b  3576           PULS  A B X Y U                   
  018d  39             RTS                               

; ---- function FUN_M72_r4_00000__018e
FUN_M72_r4_00000__018e:
  018e  3476           PSHS  U Y X B A                   
  0190  CC0000         LDD #0x0                          
  0193  FD7002         STD 0x7002                        
  0196  FD7022         STD 0x7022                        
  0199  FD702A         STD 0x702a                        
  019c  FD7032         STD 0x7032                        
  019f  FD7066         STD 0x7066                        
  01a2  FD703A         STD 0x703a                        
  01a5  FD7046         STD 0x7046                        
  01a8  FD7052         STD 0x7052                        
  01ab  FD7082         STD 0x7082                        
  01ae  FD700A         STD 0x700a                        
  01b1  FD7010         STD 0x7010                        
  01b4  FD7016         STD 0x7016                        
  01b7  FD701C         STD 0x701c                        
  01ba  FD708A         STD 0x708a                        
  01bd  FD708C         STD 0x708c                        
  01c0  FD708E         STD 0x708e                        
  01c3  FD709C         STD 0x709c                        
  01c6  FD709E         STD 0x709e                        
  01c9  FD70A0         STD 0x70a0                        
  01cc  FD70D8         STD 0x70d8                        
  01cf  FD70DA         STD 0x70da                        
  01d2  FD70DC         STD 0x70dc                        
  01d5  FD70DE         STD 0x70de                        
  01d8  FD70E0         STD 0x70e0                        
  01db  FD70E2         STD 0x70e2                        
  01de  FD70E4         STD 0x70e4                        
  01e1  FD70E6         STD 0x70e6                        
  01e4  FD70E8         STD 0x70e8                        
  01e7  FD70EA         STD 0x70ea                        
  01ea  FD70EC         STD 0x70ec                        
  01ed  FD70EE         STD 0x70ee                        
  01f0  3576           PULS  A B X Y U                   
  01f2  39             RTS                               

; ---- function FUN_M72_r4_00000__01f3
FUN_M72_r4_00000__01f3:
  01f3  3476           PSHS  U Y X B A                   
  01f5  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:08 1A:0E 1B:14 1C:1A
  01f9  19             db 19h                            
  01fa  08             db 8h                             
  01fb  1A             db 1Ah                            
  01fc  0E             db Eh                             
  01fd  1B             db 1Bh                            
  01fe  14             db 14h                            
  01ff  1C             db 1Ch                            
  0200  1A             db 1Ah                            
  0201  00             db 0h                             
LAB_M72_r4_00000__0202:
  0202  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 51:30 65:6E 67:70 69:72 6B:74 6D:76 6F:78 45:00 47:06
  0206  51             db 51h                            
  0207  30             db 30h                            
  0208  65             db 65h                            
  0209  6E             db 6Eh                            
  020a  67             db 67h                            
  020b  70             db 70h                            
  020c  69             db 69h                            
  020d  72             db 72h                            
  020e  6B             db 6Bh                            
  020f  74             db 74h                            
  0210  6D             db 6Dh                            
  0211  76             db 76h                            
  0212  6F             db 6Fh                            
  0213  78             db 78h                            
  0214  45             db 45h                            
  0215  00             db 0h                             
  0216  47             db 47h                            
  0217  06             db 6h                             
  0218  00             db 0h                             
LAB_M72_r4_00000__0219:
  0219  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 4B:26 4F:2E 53:36 49:20 4D:28
  021d  4B             db 4Bh                            
  021e  26             db 26h                            
  021f  4F             db 4Fh                            
  0220  2E             db 2Eh                            
  0221  53             db 53h                            
  0222  36             db 36h                            
  0223  49             db 49h                            
  0224  20             db 20h                            
  0225  4D             db 4Dh                            
  0226  28             db 28h                            
  0227  00             db 0h                             
LAB_M72_r4_00000__0228:
  0228  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 71:7A 73:7C 75:7E 77:96 79:98 7B:9A
  022c  71             db 71h                            
  022d  7A             db 7Ah                            
  022e  73             db 73h                            
  022f  7C             db 7Ch                            
  0230  75             db 75h                            
  0231  7E             db 7Eh                            
  0232  77             db 77h                            
  0233  96             db 96h                            
  0234  79             db 79h                            
  0235  98             db 98h                            
  0236  7B             db 7Bh                            
  0237  9A             db 9Ah                            
  0238  00             db 0h                             
LAB_M72_r4_00000__0239:
  0239  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 7D:A8 7F:AA 81:AC 83:AE 85:B0 87:B2
  023d  7D             db 7Dh                            
  023e  A8             db A8h                            
  023f  7F             db 7Fh                            
  0240  AA             db AAh                            
  0241  81             db 81h                            
  0242  AC             db ACh                            
  0243  83             db 83h                            
  0244  AE             db AEh                            
  0245  85             db 85h                            
  0246  B0             db B0h                            
  0247  87             db 87h                            
  0248  B2             db B2h                            
  0249  00             db 0h                             
LAB_M72_r4_00000__024a:
  024a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 89:B4 8B:B6 8D:B8 8F:BA 91:BC 93:BE
  024e  89             db 89h                            
  024f  B4             db B4h                            
  0250  8B             db 8Bh                            
  0251  B6             db B6h                            
  0252  8D             db 8Dh                            
  0253  B8             db B8h                            
  0254  8F             db 8Fh                            
  0255  BA             db BAh                            
  0256  91             db 91h                            
  0257  BC             db BCh                            
  0258  93             db 93h                            
  0259  BE             db BEh                            
  025a  00             db 0h                             
LAB_M72_r4_00000__025b:
  025b  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 95:C0 97:C2 99:C4 9B:C6 9D:C8 9F:CA
  025f  95             db 95h                            
  0260  C0             db C0h                            
  0261  97             db 97h                            
  0262  C2             db C2h                            
  0263  99             db 99h                            
  0264  C4             db C4h                            
  0265  9B             db 9Bh                            
  0266  C6             db C6h                            
  0267  9D             db 9Dh                            
  0268  C8             db C8h                            
  0269  9F             db 9Fh                            
  026a  CA             db CAh                            
  026b  00             db 0h                             
LAB_M72_r4_00000__026c:
  026c  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A1:CC A3:CE A5:D0 A7:D2 A9:D4 AB:D6
  0270  A1             db A1h                            
  0271  CC             db CCh                            
  0272  A3             db A3h                            
  0273  CE             db CEh                            
  0274  A5             db A5h                            
  0275  D0             db D0h                            
  0276  A7             db A7h                            
  0277  D2             db D2h                            
  0278  A9             db A9h                            
  0279  D4             db D4h                            
  027a  AB             db ABh                            
  027b  D6             db D6h                            
  027c  00             db 0h                             
LAB_M72_r4_00000__027d:
  027d  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 55:38 59:44 5D:50 61:64 AD:80
  0281  55             db 55h                            
  0282  38             db 38h                            
  0283  59             db 59h                            
  0284  44             db 44h                            
  0285  5D             db 5Dh                            
  0286  50             db 50h                            
  0287  61             db 61h                            
  0288  64             db 64h                            
  0289  AD             db ADh                            
  028a  80             db 80h                            
  028b  00             db 0h                             
LAB_M72_r4_00000__028c:
  028c  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 57:3E 5B:4A 5F:56 63:6A AF:86
  0290  57             db 57h                            
  0291  3E             db 3Eh                            
  0292  5B             db 5Bh                            
  0293  4A             db 4Ah                            
  0294  5F             db 5Fh                            
  0295  56             db 56h                            
  0296  63             db 63h                            
  0297  6A             db 6Ah                            
  0298  AF             db AFh                            
  0299  86             db 86h                            
  029a  00             db 0h                             
LAB_M72_r4_00000__029b:
  029b  3576           PULS  A B X Y U                   
  029d  39             RTS                               

; ---- function FUN_M72_r4_00000__029e
FUN_M72_r4_00000__029e:
  029e  3476           PSHS  U Y X B A                   
  02a0  CC0000         LDD #0x0                          
  02a3  AD9FFC6C       JSR [0xfc6c]                      
  02a7  AD9FFC74       JSR [0xfc74]                      
  02ab  17205E         LBSR 0x230c                       
  02ae  1720D6         LBSR 0x2387                       
  02b1  17214E         LBSR 0x2402                       
  02b4  1721C6         LBSR 0x247d                       
  02b7  171FB8         LBSR 0x2272                       
  02ba  3576           PULS  A B X Y U                   
  02bc  39             RTS                               

; ---- function FUN_M72_r4_00000__02bd
FUN_M72_r4_00000__02bd:
  02bd  3476           PSHS  U Y X B A                   
  02bf  1721ED         LBSR 0x24af                       
  02c2  171803         LBSR 0x1ac8                       
  02c5  171A45         LBSR 0x1d0d                       
  02c8  171ADE         LBSR 0x1da9                       
  02cb  171B77         LBSR 0x1e45                       
  02ce  1716A8         LBSR 0x1979                       
  02d1  1706B0         LBSR 0x0984                       
  02d4  1709A5         LBSR 0x0c7c                       
  02d7  170A79         LBSR 0x0d53                       
  02da  171742         LBSR 0x1a1f                       
  02dd  1718A1         LBSR 0x1b81                       
  02e0  171930         LBSR 0x1c13                       
  02e3  170DA7         LBSR 0x108d                       
  02e6  170E32         LBSR 0x111b                       
  02e9  170EBD         LBSR 0x11a9                       
  02ec  170F48         LBSR 0x1237                       
  02ef  170FD3         LBSR 0x12c5                       
  02f2  17105E         LBSR 0x1353                       
  02f5  1710ED         LBSR 0x13e5                       
  02f8  1711D8         LBSR 0x14d3                       
  02fb  1712C3         LBSR 0x15c1                       
  02fe  1713AE         LBSR 0x16af                       
  0301  171499         LBSR 0x179d                       
  0304  171584         LBSR 0x188b                       
  0307  3576           PULS  A B X Y U                   
  0309  39             RTS                               

; ---- function FUN_M72_r4_00000__030a
FUN_M72_r4_00000__030a:
  030a  3476           PSHS  U Y X B A                   
  030c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "rev time" 21 $1B54 $1B60
  0310  00             db 0h                             
  0311  80             db 80h                            
  0312  726576207469.. ds "rev time"                     
  031a  21             db 21h                            
  031b  1B54           addr M72_r4_00000::1b54           
  031d  1B60           addr M72_r4_00000::1b60           
LAB_M72_r4_00000__031f:
  031f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "high cut" 25 $1BE6 $1BF2
  0323  01             db 1h                             
  0324  80             db 80h                            
  0325  686967682063.. ds "high cut"                     
  032d  25             db 25h                            
  032e  1BE6           addr M72_r4_00000::1be6           
  0330  1BF2           addr M72_r4_00000::1bf2           
LAB_M72_r4_00000__0332:
  0332  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "predelay" 29 $1A9B $1AA7
  0336  02             db 2h                             
  0337  80             db 80h                            
  0338  70726564656C.. ds "predelay"                     
  0340  29             db 29h                            
  0341  1A9B           addr M72_r4_00000::1a9b           
  0343  1AA7           addr M72_r4_00000::1aa7           
LAB_M72_r4_00000__0345:
  0345  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "frnt/bck" 2D $0948 $0954
  0349  03             db 3h                             
  034a  80             db 80h                            
  034b  66726E742F62.. ds "frnt/bck"                     
  0353  2D             db 2Dh                            
  0354  0948           addr M72_r4_00000::0948           
  0356  0954           addr M72_r4_00000::0954           
LAB_M72_r4_00000__0358:
  0358  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "imagepan" 31 $0D2A $0D36
  035c  04             db 4h                             
  035d  80             db 80h                            
  035e  696D61676570.. ds "imagepan"                     
  0366  31             db 31h                            
  0367  0D2A           addr M72_r4_00000::0d2a           
  0369  0D36           addr M72_r4_00000::0d36           
LAB_M72_r4_00000__036b:
  036b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "earlymix" 35 $0C4F $0C5B
  036f  05             db 5h                             
  0370  80             db 80h                            
  0371  6561726C796D.. ds "earlymix"                     
  0379  35             db 35h                            
  037a  0C4F           addr M72_r4_00000::0c4f           
  037c  0C5B           addr M72_r4_00000::0c5b           
LAB_M72_r4_00000__037e:
  037e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "diffusor" 39 $194C $1958
  0382  06             db 6h                             
  0383  80             db 80h                            
  0384  646966667573.. ds "diffusor"                     
  038c  39             db 39h                            
  038d  194C           addr M72_r4_00000::194c           
  038f  1958           addr M72_r4_00000::1958           
LAB_M72_r4_00000__0391:
  0391  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "  mix   " 3D $2245 $2251
  0395  07             db 7h                             
  0396  80             db 80h                            
  0397  20206D697820.. ds "  mix   "                     
  039f  3D             db 3Dh                            
  03a0  2245           addr M72_r4_00000::2245           
  03a2  2251           addr M72_r4_00000::2251           
LAB_M72_r4_00000__03a4:
  03a4  CC03B5         LDD #0x3b5                        
  03a7  FD60F5         STD 0x60f5                        
  03aa  CC004A         LDD #0x4a                         
  03ad  47             ASRA                              
  03ae  56             RORB                              
  03af  FD60F7         STD 0x60f7                        
  03b2  3576           PULS  A B X Y U                   
  03b4  39             RTS                               
  03b5  03FF040A0415.. addr[37]                          

; ---- function FUN_M72_r4_00000__03ff
FUN_M72_r4_00000__03ff:
  03ff  171675         LBSR 0x1a77                       
  0402  1701CC         LBSR 0x05d1                       
  0405  AD9FFE10       JSR [0xfe10]                      
  0409  39             RTS                               

; ---- function FUN_M72_r4_00000__040a
FUN_M72_r4_00000__040a:
  040a  171723         LBSR 0x1b30                       
  040d  1701C1         LBSR 0x05d1                       
  0410  AD9FFE12       JSR [0xfe12]                      
  0414  39             RTS                               

; ---- function FUN_M72_r4_00000__0415
FUN_M72_r4_00000__0415:
  0415  1717AA         LBSR 0x1bc2                       
  0418  1701B6         LBSR 0x05d1                       
  041b  AD9FFE14       JSR [0xfe14]                      
  041f  39             RTS                               

; ---- function FUN_M72_r4_00000__0420
FUN_M72_r4_00000__0420:
  0420  1715AB         LBSR 0x19ce                       
  0423  1701AB         LBSR 0x05d1                       
  0426  AD9FFE16       JSR [0xfe16]                      
  042a  39             RTS                               

; ---- function FUN_M72_r4_00000__042b
FUN_M72_r4_00000__042b:
  042b  1704F6         LBSR 0x0924                       
  042e  1701D9         LBSR 0x060a                       
  0431  AD9FFE10       JSR [0xfe10]                      
  0435  39             RTS                               

; ---- function FUN_M72_r4_00000__0436
FUN_M72_r4_00000__0436:
  0436  1708CD         LBSR 0x0d06                       
  0439  1701CE         LBSR 0x060a                       
  043c  AD9FFE12       JSR [0xfe12]                      
  0440  39             RTS                               

; ---- function FUN_M72_r4_00000__0441
FUN_M72_r4_00000__0441:
  0441  1707E7         LBSR 0x0c2b                       
  0444  1701C3         LBSR 0x060a                       
  0447  AD9FFE14       JSR [0xfe14]                      
  044b  39             RTS                               

; ---- function FUN_M72_r4_00000__044c
FUN_M72_r4_00000__044c:
  044c  1714D9         LBSR 0x1928                       
  044f  1701B8         LBSR 0x060a                       
  0452  AD9FFE16       JSR [0xfe16]                      
  0456  39             RTS                               

; ---- function FUN_M72_r4_00000__0457
FUN_M72_r4_00000__0457:
  0457  171DC7         LBSR 0x2221                       
  045a  1701E6         LBSR 0x0643                       
  045d  AD9FFE10       JSR [0xfe10]                      
  0461  39             RTS                               

; ---- function FUN_M72_r4_00000__0462
FUN_M72_r4_00000__0462:
  0462  171E6E         LBSR 0x22d3                       
  0465  17040E         LBSR 0x0876                       
  0468  AD9FFE10       JSR [0xfe10]                      
  046c  39             RTS                               

; ---- function FUN_M72_r4_00000__046d
FUN_M72_r4_00000__046d:
  046d  171EDE         LBSR 0x234e                       
  0470  170403         LBSR 0x0876                       
  0473  AD9FFE12       JSR [0xfe12]                      
  0477  39             RTS                               

; ---- function FUN_M72_r4_00000__0478
FUN_M72_r4_00000__0478:
  0478  171F4E         LBSR 0x23c9                       
  047b  17042A         LBSR 0x08a8                       
  047e  AD9FFE10       JSR [0xfe10]                      
  0482  39             RTS                               

; ---- function FUN_M72_r4_00000__0483
FUN_M72_r4_00000__0483:
  0483  171FBE         LBSR 0x2444                       
  0486  17041F         LBSR 0x08a8                       
  0489  AD9FFE12       JSR [0xfe12]                      
  048d  39             RTS                               

; ---- function FUN_M72_r4_00000__048e
FUN_M72_r4_00000__048e:
  048e  171C0A         LBSR 0x209b                       
  0491  170370         LBSR 0x0804                       
  0494  AD9FFE10       JSR [0xfe10]                      
  0498  39             RTS                               

; ---- function FUN_M72_r4_00000__0499
FUN_M72_r4_00000__0499:
  0499  171C06         LBSR 0x20a2                       
  049c  170365         LBSR 0x0804                       
  049f  AD9FFE12       JSR [0xfe12]                      
  04a3  39             RTS                               

; ---- function FUN_M72_r4_00000__04a4
FUN_M72_r4_00000__04a4:
  04a4  171C02         LBSR 0x20a9                       
  04a7  17035A         LBSR 0x0804                       
  04aa  AD9FFE14       JSR [0xfe14]                      
  04ae  39             RTS                               

; ---- function FUN_M72_r4_00000__04af
FUN_M72_r4_00000__04af:
  04af  171BFE         LBSR 0x20b0                       
  04b2  170388         LBSR 0x083d                       
  04b5  AD9FFE10       JSR [0xfe10]                      
  04b9  39             RTS                               

; ---- function FUN_M72_r4_00000__04ba
FUN_M72_r4_00000__04ba:
  04ba  171BFA         LBSR 0x20b7                       
  04bd  17037D         LBSR 0x083d                       
  04c0  AD9FFE12       JSR [0xfe12]                      
  04c4  39             RTS                               

; ---- function FUN_M72_r4_00000__04c5
FUN_M72_r4_00000__04c5:
  04c5  171BF6         LBSR 0x20be                       
  04c8  170372         LBSR 0x083d                       
  04cb  AD9FFE14       JSR [0xfe14]                      
  04cf  39             RTS                               

; ---- function FUN_M72_r4_00000__04d0
FUN_M72_r4_00000__04d0:
  04d0  171801         LBSR 0x1cd4                       
  04d3  1702BC         LBSR 0x0792                       
  04d6  AD9FFE10       JSR [0xfe10]                      
  04da  39             RTS                               

; ---- function FUN_M72_r4_00000__04db
FUN_M72_r4_00000__04db:
  04db  171892         LBSR 0x1d70                       
  04de  1702B1         LBSR 0x0792                       
  04e1  AD9FFE12       JSR [0xfe12]                      
  04e5  39             RTS                               

; ---- function FUN_M72_r4_00000__04e6
FUN_M72_r4_00000__04e6:
  04e6  171923         LBSR 0x1e0c                       
  04e9  1702A6         LBSR 0x0792                       
  04ec  AD9FFE14       JSR [0xfe14]                      
  04f0  39             RTS                               

; ---- function FUN_M72_r4_00000__04f1
FUN_M72_r4_00000__04f1:
  04f1  1719B4         LBSR 0x1ea8                       
  04f4  1702D4         LBSR 0x07cb                       
  04f7  AD9FFE10       JSR [0xfe10]                      
  04fb  39             RTS                               

; ---- function FUN_M72_r4_00000__04fc
FUN_M72_r4_00000__04fc:
  04fc  171A60         LBSR 0x1f5f                       
  04ff  1702C9         LBSR 0x07cb                       
  0502  AD9FFE12       JSR [0xfe12]                      
  0506  39             RTS                               

; ---- function FUN_M72_r4_00000__0507
FUN_M72_r4_00000__0507:
  0507  171B0C         LBSR 0x2016                       
  050a  1702BE         LBSR 0x07cb                       
  050d  AD9FFE14       JSR [0xfe14]                      
  0511  39             RTS                               

; ---- function FUN_M72_r4_00000__0512
FUN_M72_r4_00000__0512:
  0512  170B2B         LBSR 0x1040                       
  0515  170196         LBSR 0x06ae                       
  0518  AD9FFE10       JSR [0xfe10]                      
  051c  39             RTS                               

; ---- function FUN_M72_r4_00000__051d
FUN_M72_r4_00000__051d:
  051d  170BAE         LBSR 0x10ce                       
  0520  17018B         LBSR 0x06ae                       
  0523  AD9FFE12       JSR [0xfe12]                      
  0527  39             RTS                               

; ---- function FUN_M72_r4_00000__0528
FUN_M72_r4_00000__0528:
  0528  170C31         LBSR 0x115c                       
  052b  170180         LBSR 0x06ae                       
  052e  AD9FFE14       JSR [0xfe14]                      
  0532  39             RTS                               

; ---- function FUN_M72_r4_00000__0533
FUN_M72_r4_00000__0533:
  0533  170CB4         LBSR 0x11ea                       
  0536  1701AE         LBSR 0x06e7                       
  0539  AD9FFE10       JSR [0xfe10]                      
  053d  39             RTS                               

; ---- function FUN_M72_r4_00000__053e
FUN_M72_r4_00000__053e:
  053e  170D37         LBSR 0x1278                       
  0541  1701A3         LBSR 0x06e7                       
  0544  AD9FFE12       JSR [0xfe12]                      
  0548  39             RTS                               

; ---- function FUN_M72_r4_00000__0549
FUN_M72_r4_00000__0549:
  0549  170DBA         LBSR 0x1306                       
  054c  170198         LBSR 0x06e7                       
  054f  AD9FFE14       JSR [0xfe14]                      
  0553  39             RTS                               

; ---- function FUN_M72_r4_00000__0554
FUN_M72_r4_00000__0554:
  0554  170E3D         LBSR 0x1394                       
  0557  1701C6         LBSR 0x0720                       
  055a  AD9FFE10       JSR [0xfe10]                      
  055e  39             RTS                               

; ---- function FUN_M72_r4_00000__055f
FUN_M72_r4_00000__055f:
  055f  170F20         LBSR 0x1482                       
  0562  1701BB         LBSR 0x0720                       
  0565  AD9FFE12       JSR [0xfe12]                      
  0569  39             RTS                               

; ---- function FUN_M72_r4_00000__056a
FUN_M72_r4_00000__056a:
  056a  171003         LBSR 0x1570                       
  056d  1701B0         LBSR 0x0720                       
  0570  AD9FFE14       JSR [0xfe14]                      
  0574  39             RTS                               

; ---- function FUN_M72_r4_00000__0575
FUN_M72_r4_00000__0575:
  0575  1710E6         LBSR 0x165e                       
  0578  1701DE         LBSR 0x0759                       
  057b  AD9FFE10       JSR [0xfe10]                      
  057f  39             RTS                               

; ---- function FUN_M72_r4_00000__0580
FUN_M72_r4_00000__0580:
  0580  1711C9         LBSR 0x174c                       
  0583  1701D3         LBSR 0x0759                       
  0586  AD9FFE12       JSR [0xfe12]                      
  058a  39             RTS                               

; ---- function FUN_M72_r4_00000__058b
FUN_M72_r4_00000__058b:
  058b  1712AC         LBSR 0x183a                       
  058e  1701C8         LBSR 0x0759                       
  0591  AD9FFE14       JSR [0xfe14]                      
  0595  39             RTS                               

; ---- function FUN_M72_r4_00000__0596
FUN_M72_r4_00000__0596:
  0596  AD9FFDFC       JSR [0xfdfc]                      
  059a  39             RTS                               
LAB_M72_r4_00000__059b:
  059b  C600           LDB #0x0                          
  059d  AD9FFC36       JSR [0xfc36]                      
  05a1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  05a5  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M72_r4_00000__05ce:
  05ce  3577           PULS CC A B X Y U                 
  05d0  39             RTS                               

; ---- function FUN_M72_r4_00000__05d1
FUN_M72_r4_00000__05d1:
  05d1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "predelay" "rev time" "high cut" "  size  "
  05d5  70726564656C.. ds "predelay"                     
  05dd  726576207469.. ds "rev time"                     
  05e5  686967682063.. ds "high cut"                     
  05ed  202073697A65.. ds "  size  "                     
LAB_M72_r4_00000__05f5:
  05f5  AD9FFDF2       JSR [0xfdf2]                      
  05f9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1A6B ->$1B24 ->$1BB6 ->$19C2 ->$060A ->$0643
  05fd  1A6B           addr M72_r4_00000::1a6b           
  05ff  1B24           addr M72_r4_00000::1b24           
  0601  1BB6           addr M72_r4_00000::1bb6           
  0603  19C2           addr M72_r4_00000::19c2           
  0605  060A           addr M72_r4_00000::060a           
  0607  0643           addr M72_r4_00000::0643           
LAB_M72_r4_00000__0609:
  0609  39             RTS                               

; ---- function FUN_M72_r4_00000__060a
FUN_M72_r4_00000__060a:
  060a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "position" "  pan   " "earlymix" "diffusor"
  060e  706F73697469.. ds "position"                     
  0616  202070616E20.. ds "  pan   "                     
  061e  6561726C796D.. ds "earlymix"                     
  0626  646966667573.. ds "diffusor"                     
LAB_M72_r4_00000__062e:
  062e  AD9FFDF2       JSR [0xfdf2]                      
  0632  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0918 ->$0CFA ->$0C1F ->$191C ->$0643 ->$05D1
  0636  0918           addr M72_r4_00000::0918           
  0638  0CFA           addr M72_r4_00000::0cfa           
  063a  0C1F           addr M72_r4_00000::0c1f           
  063c  191C           addr M72_r4_00000::191c           
  063e  0643           addr M72_r4_00000::0643           
  0640  05D1           addr M72_r4_00000::05d1           
LAB_M72_r4_00000__0642:
  0642  39             RTS                               

; ---- function FUN_M72_r4_00000__0643
FUN_M72_r4_00000__0643:
  0643  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [*] " levels " " expert "
  0647  20206D697820.. ds "  mix   "                     
  064f  01             db 1h                             
  0650  206C6576656C.. ds " levels "                     
  0658  206578706572.. ds " expert "                     
LAB_M72_r4_00000__0660:
  0660  AD9FFDF2       JSR [0xfdf2]                      
  0664  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2215 ->$08DA ->$0876 ->$0675 ->$05D1 ->$060A
  0668  2215           addr M72_r4_00000::2215           
  066a  08DA           addr M72_r4_00000::08da           
  066c  0876           addr M72_r4_00000::0876           
  066e  0675           addr M72_r4_00000::0675           
  0670  05D1           addr M72_r4_00000::05d1           
  0672  060A           addr M72_r4_00000::060a           
LAB_M72_r4_00000__0674:
  0674  39             RTS                               

; ---- function FUN_M72_r4_00000__0675
FUN_M72_r4_00000__0675:
  0675  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " delays " "allpass " "  taps  " " return "
  0679  2064656C6179.. ds " delays "                     
  0681  616C6C706173.. ds "allpass "                     
  0689  202074617073.. ds "  taps  "                     
  0691  207265747572.. ds " return "                     
LAB_M72_r4_00000__0699:
  0699  AD9FFDF2       JSR [0xfdf2]                      
  069d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0804 ->$0792 ->$06AE ->$05D1 ->$08DA ->$08DA
  06a1  0804           addr M72_r4_00000::0804           
  06a3  0792           addr M72_r4_00000::0792           
  06a5  06AE           addr M72_r4_00000::06ae           
  06a7  05D1           addr M72_r4_00000::05d1           
  06a9  08DA           addr M72_r4_00000::08da           
  06ab  08DA           addr M72_r4_00000::08da           
LAB_M72_r4_00000__06ad:
  06ad  39             RTS                               

; ---- function FUN_M72_r4_00000__06ae
FUN_M72_r4_00000__06ae:
  06ae  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  pan 1 " "  pan 2 " "  pan 3 " " return "
  06b2  202070616E20.. ds "  pan 1 "                     
  06ba  202070616E20.. ds "  pan 2 "                     
  06c2  202070616E20.. ds "  pan 3 "                     
  06ca  207265747572.. ds " return "                     
LAB_M72_r4_00000__06d2:
  06d2  AD9FFDF2       JSR [0xfdf2]                      
  06d6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1034 ->$10C2 ->$1150 ->$0675 ->$06E7 ->$0759
  06da  1034           addr M72_r4_00000::1034           
  06dc  10C2           addr M72_r4_00000::10c2           
  06de  1150           addr M72_r4_00000::1150           
  06e0  0675           addr M72_r4_00000::0675           
  06e2  06E7           addr M72_r4_00000::06e7           
  06e4  0759           addr M72_r4_00000::0759           
LAB_M72_r4_00000__06e6:
  06e6  39             RTS                               

; ---- function FUN_M72_r4_00000__06e7
FUN_M72_r4_00000__06e7:
  06e7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  pan 4 " "  pan 5 " "  pan 6 " " return "
  06eb  202070616E20.. ds "  pan 4 "                     
  06f3  202070616E20.. ds "  pan 5 "                     
  06fb  202070616E20.. ds "  pan 6 "                     
  0703  207265747572.. ds " return "                     
LAB_M72_r4_00000__070b:
  070b  AD9FFDF2       JSR [0xfdf2]                      
  070f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$11DE ->$126C ->$12FA ->$0675 ->$0720 ->$06AE
  0713  11DE           addr M72_r4_00000::11de           
  0715  126C           addr M72_r4_00000::126c           
  0717  12FA           addr M72_r4_00000::12fa           
  0719  0675           addr M72_r4_00000::0675           
  071b  0720           addr M72_r4_00000::0720           
  071d  06AE           addr M72_r4_00000::06ae           
LAB_M72_r4_00000__071f:
  071f  39             RTS                               

; ---- function FUN_M72_r4_00000__0720
FUN_M72_r4_00000__0720:
  0720  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "level 1 " "level 2 " "level 3 " " return "
  0724  6C6576656C20.. ds "level 1 "                     
  072c  6C6576656C20.. ds "level 2 "                     
  0734  6C6576656C20.. ds "level 3 "                     
  073c  207265747572.. ds " return "                     
LAB_M72_r4_00000__0744:
  0744  AD9FFDF2       JSR [0xfdf2]                      
  0748  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1388 ->$1476 ->$1564 ->$0675 ->$0759 ->$06E7
  074c  1388           addr M72_r4_00000::1388           
  074e  1476           addr M72_r4_00000::1476           
  0750  1564           addr M72_r4_00000::1564           
  0752  0675           addr M72_r4_00000::0675           
  0754  0759           addr M72_r4_00000::0759           
  0756  06E7           addr M72_r4_00000::06e7           
LAB_M72_r4_00000__0758:
  0758  39             RTS                               

; ---- function FUN_M72_r4_00000__0759
FUN_M72_r4_00000__0759:
  0759  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "level 4 " "level 5 " "level 6 " " return "
  075d  6C6576656C20.. ds "level 4 "                     
  0765  6C6576656C20.. ds "level 5 "                     
  076d  6C6576656C20.. ds "level 6 "                     
  0775  207265747572.. ds " return "                     
LAB_M72_r4_00000__077d:
  077d  AD9FFDF2       JSR [0xfdf2]                      
  0781  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1652 ->$1740 ->$182E ->$0675 ->$06AE ->$0720
  0785  1652           addr M72_r4_00000::1652           
  0787  1740           addr M72_r4_00000::1740           
  0789  182E           addr M72_r4_00000::182e           
  078b  0675           addr M72_r4_00000::0675           
  078d  06AE           addr M72_r4_00000::06ae           
  078f  0720           addr M72_r4_00000::0720           
LAB_M72_r4_00000__0791:
  0791  39             RTS                               

; ---- function FUN_M72_r4_00000__0792
FUN_M72_r4_00000__0792:
  0792  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " " return "
  0796  64656C617920.. ds "delay 1 "                     
  079e  64656C617920.. ds "delay 2 "                     
  07a6  64656C617920.. ds "delay 3 "                     
  07ae  207265747572.. ds " return "                     
LAB_M72_r4_00000__07b6:
  07b6  AD9FFDF2       JSR [0xfdf2]                      
  07ba  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1CC8 ->$1D64 ->$1E00 ->$0675 ->$07CB ->$07CB
  07be  1CC8           addr M72_r4_00000::1cc8           
  07c0  1D64           addr M72_r4_00000::1d64           
  07c2  1E00           addr M72_r4_00000::1e00           
  07c4  0675           addr M72_r4_00000::0675           
  07c6  07CB           addr M72_r4_00000::07cb           
  07c8  07CB           addr M72_r4_00000::07cb           
LAB_M72_r4_00000__07ca:
  07ca  39             RTS                               

; ---- function FUN_M72_r4_00000__07cb
FUN_M72_r4_00000__07cb:
  07cb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "   g1   " "   g2   " "   g3   " " return "
  07cf  202020673120.. ds "   g1   "                     
  07d7  202020673220.. ds "   g2   "                     
  07df  202020673320.. ds "   g3   "                     
  07e7  207265747572.. ds " return "                     
LAB_M72_r4_00000__07ef:
  07ef  AD9FFDF2       JSR [0xfdf2]                      
  07f3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1E9C ->$1F53 ->$200A ->$0675 ->$0792 ->$0792
  07f7  1E9C           addr M72_r4_00000::1e9c           
  07f9  1F53           addr M72_r4_00000::1f53           
  07fb  200A           addr M72_r4_00000::200a           
  07fd  0675           addr M72_r4_00000::0675           
  07ff  0792           addr M72_r4_00000::0792           
  0801  0792           addr M72_r4_00000::0792           
LAB_M72_r4_00000__0803:
  0803  39             RTS                               

; ---- function FUN_M72_r4_00000__0804
FUN_M72_r4_00000__0804:
  0804  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " " return "
  0808  64656C617920.. ds "delay 1 "                     
  0810  64656C617920.. ds "delay 2 "                     
  0818  64656C617920.. ds "delay 3 "                     
  0820  207265747572.. ds " return "                     
LAB_M72_r4_00000__0828:
  0828  AD9FFDF2       JSR [0xfdf2]                      
  082c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$20F1 ->$20FB ->$2105 ->$0675 ->$083D ->$083D
  0830  20F1           addr M72_r4_00000::20f1           
  0832  20FB           addr M72_r4_00000::20fb           
  0834  2105           addr M72_r4_00000::2105           
  0836  0675           addr M72_r4_00000::0675           
  0838  083D           addr M72_r4_00000::083d           
  083a  083D           addr M72_r4_00000::083d           
LAB_M72_r4_00000__083c:
  083c  39             RTS                               

; ---- function FUN_M72_r4_00000__083d
FUN_M72_r4_00000__083d:
  083d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 4 " "delay 5 " "delay 6 " " return "
  0841  64656C617920.. ds "delay 4 "                     
  0849  64656C617920.. ds "delay 5 "                     
  0851  64656C617920.. ds "delay 6 "                     
  0859  207265747572.. ds " return "                     
LAB_M72_r4_00000__0861:
  0861  AD9FFDF2       JSR [0xfdf2]                      
  0865  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$210F ->$2119 ->$2123 ->$0675 ->$0804 ->$0804
  0869  210F           addr M72_r4_00000::210f           
  086b  2119           addr M72_r4_00000::2119           
  086d  2123           addr M72_r4_00000::2123           
  086f  0675           addr M72_r4_00000::0675           
  0871  0804           addr M72_r4_00000::0804           
  0873  0804           addr M72_r4_00000::0804           
LAB_M72_r4_00000__0875:
  0875  39             RTS                               

; ---- function FUN_M72_r4_00000__0876
FUN_M72_r4_00000__0876:
  0876  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  087a  6C6566742069.. ds "left in "                     
  0882  726967687420.. ds "right in"                     
  088a  01             db 1h                             
  088b  207265747572.. ds " return "                     
LAB_M72_r4_00000__0893:
  0893  AD9FFDF2       JSR [0xfdf2]                      
  0897  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$22C7 ->$2342 ->$08DA ->$060A ->$08A8 ->$08A8
  089b  22C7           addr M72_r4_00000::22c7           
  089d  2342           addr M72_r4_00000::2342           
  089f  08DA           addr M72_r4_00000::08da           
  08a1  060A           addr M72_r4_00000::060a           
  08a3  08A8           addr M72_r4_00000::08a8           
  08a5  08A8           addr M72_r4_00000::08a8           
LAB_M72_r4_00000__08a7:
  08a7  39             RTS                               

; ---- function FUN_M72_r4_00000__08a8
FUN_M72_r4_00000__08a8:
  08a8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  08ac  6C656674206F.. ds "left out"                     
  08b4  72696768746F.. ds "rightout"                     
  08bc  01             db 1h                             
  08bd  207265747572.. ds " return "                     
LAB_M72_r4_00000__08c5:
  08c5  AD9FFDF2       JSR [0xfdf2]                      
  08c9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$23BD ->$2438 ->$08DA ->$060A ->$0876 ->$0876
  08cd  23BD           addr M72_r4_00000::23bd           
  08cf  2438           addr M72_r4_00000::2438           
  08d1  08DA           addr M72_r4_00000::08da           
  08d3  060A           addr M72_r4_00000::060a           
  08d5  0876           addr M72_r4_00000::0876           
  08d7  0876           addr M72_r4_00000::0876           
LAB_M72_r4_00000__08d9:
  08d9  39             RTS                               

; ---- function FUN_M72_r4_00000__08da
FUN_M72_r4_00000__08da:
  08da  39             RTS                               

; ---- function FUN_M72_r4_00000__08db
FUN_M72_r4_00000__08db:
  08db  3476           PSHS  U Y X B A                   
  08dd  170B05         LBSR 0x13e5                       
  08e0  170BF0         LBSR 0x14d3                       
  08e3  170CDB         LBSR 0x15c1                       
  08e6  170DC6         LBSR 0x16af                       
  08e9  170EB1         LBSR 0x179d                       
  08ec  170F9C         LBSR 0x188b                       
  08ef  3576           PULS  A B X Y U                   
  08f1  39             RTS                               
PTR_FUN_M72_r4_00000__0984_M72_r4_00000__08f2:
  08f2  0984           addr M72_r4_00000::0984           
  08f4  093C           addr M72_r4_00000::093c           
  08f6  .db 09 30 70 38 70 3A 00 00 70 3C 00 08 00 5D 04 00  ; .0p8p:..p<...]..
  0906  .db 00 00 17 00 01 00 18 0B 09 60 00 00 09 B9 70 3E  ; .........`....p>
  0916  .db 00 5F                                            ; ._

; ---- function FUN_M72_r4_00000__0918
FUN_M72_r4_00000__0918:
  0918  3410           PSHS  X                           
  091a  8E08F2         LDX #0x8f2                        
  091d  AD9FFC4E       JSR [0xfc4e]                      
  0921  3510           PULS  X                           
  0923  39             RTS                               

; ---- function FUN_M72_r4_00000__0924
FUN_M72_r4_00000__0924:
  0924  3410           PSHS  X                           
  0926  8E08F2         LDX #0x8f2                         ; desc[API_FDBC]: ->$0984 ->$093C
  0929  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  092d  3510           PULS  X                           
  092f  39             RTS                               

; ---- function FUN_M72_r4_00000__0930
FUN_M72_r4_00000__0930:
  0930  3410           PSHS  X                           
  0932  8E08F2         LDX #0x8f2                         ; desc[API_FE6C]: ->$0984 ->$093C
  0935  AD9FFE6C       JSR [0xfe6c]                      
  0939  3510           PULS  X                           
  093b  39             RTS                               

; ---- function FUN_M72_r4_00000__093c
FUN_M72_r4_00000__093c:
  093c  3410           PSHS  X                           
  093e  8E08F2         LDX #0x8f2                        
  0941  AD9FFC52       JSR [0xfc52]                      
  0945  3510           PULS  X                           
  0947  39             RTS                               

; ---- function FUN_M72_r4_00000__0948
FUN_M72_r4_00000__0948:
  0948  3410           PSHS  X                           
  094a  8E08F2         LDX #0x8f2                         ; desc[API_FE1C]: ->$0984 ->$093C
  094d  AD9FFE1C       JSR [0xfe1c]                      
  0951  3510           PULS  X                           
  0953  39             RTS                               

; ---- function FUN_M72_r4_00000__0954
FUN_M72_r4_00000__0954:
  0954  3410           PSHS  X                           
  0956  8E08F2         LDX #0x8f2                         ; desc[API_FE1A]: ->$0984 ->$093C $0930
  0959  AD9FFE1A       JSR [0xfe1a]                      
  095d  3510           PULS  X                           
  095f  39             RTS                               
  0960  .db 05 46 52 4F 4E 54 7C 20 20 20 20 20 20 20 20 20  ; .FRONT|         
  0970  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7C  ;                |
  0980  .db 42 41 43 4B                                      ; BACK

; ---- function FUN_M72_r4_00000__0984
FUN_M72_r4_00000__0984:
  0984  3476           PSHS  U Y X B A                   
  0986  8E08F2         LDX #0x8f2                        
  0989  AD9FFE76       JSR [0xfe76]                      
  098d  FC703C         LDD 0x703c                        
  0990  C30002         ADDD #0x2                         
  0993  3606           PSHU  B A                         
  0995  CC0004         LDD #0x4                          
  0998  3606           PSHU  B A                         
  099a  AD9FFCEE       JSR [0xfcee]                      
  099e  AD9FFEC4       JSR [0xfec4]                      
  09a2  3706           PULU  A B                         
  09a4  FD7042         STD 0x7042                        
  09a7  CC7FFF         LDD #0x7fff                       
  09aa  B37042         SUBD 0x7042                       
  09ad  FD7040         STD 0x7040                        
  09b0  1703A0         LBSR 0x0d53                       
  09b3  17FF25         LBSR 0x08db                       
  09b6  3576           PULS  A B X Y U                   
  09b8  39             RTS                               
  09b9  .db 0C 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  09c9  .db 20 20 20 20 20 20 20 20 20 0C 20 20 20 20 20 20  ;          .      
  09d9  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  09e9  .db 20 20 0C 20 20 20 20 20 20 20 20 20 20 20 20 20  ;   .             
  09f9  .db 20 20 20 20 20 20 20 20 20 20 20 0C 20 20 20 20  ;            .    
  0a09  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0a19  .db 20 20 20 20 0C 20 20 20 20 20 20 20 20 20 20 20  ;     .           
  0a29  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 0C 20 20  ;              .  
  0a39  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0a49  .db 20 20 20 20 20 20 0C 20 20 20 20 20 20 20 20 20  ;       .         
  0a59  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 0C  ;                .
  0a69  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0a79  .db 20 20 20 20 20 20 20 20 0C 20 20 20 20 20 20 20  ;         .       
  0a89  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0a99  .db 20 0C 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;  .              
  0aa9  .db 20 20 20 20 20 20 20 20 20 20 0C 20 20 20 20 20  ;           .     
  0ab9  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0ac9  .db 20 20 20 0C 20 20 20 20 20 20 20 20 20 20 20 20  ;    .            
  0ad9  .db 20 20 20 20 20 20 20 20 20 20 20 20 0C 20 20 20  ;             .   
  0ae9  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0af9  .db 20 20 20 20 20 0C 20 20 20 20 20 20 20 20 20 20  ;      .          
  0b09  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 0C 20  ;               . 
  0b19  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0b29  .db 20 20 20 20 20 20 20 0C 20 20 20 20 20 20 20 20  ;        .        
  0b39  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0b49  .db 0C 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  0b59  .db 20 20 20 20 20 20 20 20 20 0C 20 20 20 20 20 20  ;          .      
  0b69  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0b79  .db 20 20 0C 20 20 20 20 20 20 20 20 20 20 20 20 20  ;   .             
  0b89  .db 20 20 20 20 20 20 20 20 20 20 20 0C 20 20 20 20  ;            .    
  0b99  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0ba9  .db 20 20 20 20 0C 20 20 20 20 20 20 20 20 20 20 20  ;     .           
  0bb9  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 0C 20 20  ;              .  
  0bc9  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  0bd9  .db 20 20 20 20 20 20 0C 20 20 20 20 20 20 20 20 20  ;       .         
  0be9  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 0C  ;                .
PTR_FUN_M72_r4_00000__0c7c_M72_r4_00000__0bf9:
  0bf9  0C7C           addr M72_r4_00000::0c7c           
  0bfb  0C43           addr M72_r4_00000::0c43           
  0bfd  .db 0C 37 70 50 70 52 00 00 70 54 00 08 00 65 06 00  ; .7pPpR..pT...e..
  0c0d  .db 00 00 64 00 01 00 03 1E 0C 67 00 00 00 00 70 56  ; ..d......g....pV
  0c1d  .db 00 67                                            ; .g

; ---- function FUN_M72_r4_00000__0c1f
FUN_M72_r4_00000__0c1f:
  0c1f  3410           PSHS  X                           
  0c21  8E0BF9         LDX #0xbf9                         ; desc[API_FE6A]: ->$0C7C ->$0C43
  0c24  AD9FFE6A       JSR [0xfe6a]                      
  0c28  3510           PULS  X                           
  0c2a  39             RTS                               

; ---- function FUN_M72_r4_00000__0c2b
FUN_M72_r4_00000__0c2b:
  0c2b  3410           PSHS  X                           
  0c2d  8E0BF9         LDX #0xbf9                         ; desc[API_FDBC]: ->$0C7C ->$0C43
  0c30  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0c34  3510           PULS  X                           
  0c36  39             RTS                               

; ---- function FUN_M72_r4_00000__0c37
FUN_M72_r4_00000__0c37:
  0c37  3410           PSHS  X                           
  0c39  8E0BF9         LDX #0xbf9                         ; desc[API_FE6C]: ->$0C7C ->$0C43
  0c3c  AD9FFE6C       JSR [0xfe6c]                      
  0c40  3510           PULS  X                           
  0c42  39             RTS                               

; ---- function FUN_M72_r4_00000__0c43
FUN_M72_r4_00000__0c43:
  0c43  3410           PSHS  X                           
  0c45  8E0BF9         LDX #0xbf9                         ; desc[API_FE6E]: ->$0C7C ->$0C43
  0c48  AD9FFE6E       JSR [0xfe6e]                      
  0c4c  3510           PULS  X                           
  0c4e  39             RTS                               

; ---- function FUN_M72_r4_00000__0c4f
FUN_M72_r4_00000__0c4f:
  0c4f  3410           PSHS  X                           
  0c51  8E0BF9         LDX #0xbf9                         ; desc[API_FE1C]: ->$0C7C ->$0C43
  0c54  AD9FFE1C       JSR [0xfe1c]                      
  0c58  3510           PULS  X                           
  0c5a  39             RTS                               

; ---- function FUN_M72_r4_00000__0c5b
FUN_M72_r4_00000__0c5b:
  0c5b  3410           PSHS  X                           
  0c5d  8E0BF9         LDX #0xbf9                         ; desc[API_FE1A]: ->$0C7C ->$0C43 $0C37
  0c60  AD9FFE1A       JSR [0xfe1a]                      
  0c64  3510           PULS  X                           
  0c66  39             RTS                               
  0c67  .db 14 65 61 72 6C 79 20 6D 69 78 3A 20 20 20 20 20  ; .early mix:     
  0c77  .db 25 20 20 20 20                                   ; %    

; ---- function FUN_M72_r4_00000__0c7c
FUN_M72_r4_00000__0c7c:
  0c7c  3476           PSHS  U Y X B A                   
  0c7e  8E0BF9         LDX #0xbf9                        
  0c81  AD9FFE76       JSR [0xfe76]                      
  0c85  FC7054         LDD 0x7054                        
  0c88  3606           PSHU  B A                         
  0c8a  AD9FFEC4       JSR [0xfec4]                      
  0c8e  3706           PULU  A B                         
  0c90  FD7116         STD 0x7116                        
  0c93  CC7FFF         LDD #0x7fff                       
  0c96  B37116         SUBD 0x7116                       
  0c99  FD7118         STD 0x7118                        
  0c9c  FC7116         LDD 0x7116                        
  0c9f  3606           PSHU  B A                         
  0ca1  3606           PSHU  B A                         
  0ca3  AD9FFCF2       JSR [0xfcf2]                      
  0ca7  3706           PULU  A B                         
  0ca9  FD7116         STD 0x7116                        
  0cac  CC7FFF         LDD #0x7fff                       
  0caf  B37116         SUBD 0x7116                       
  0cb2  FD705A         STD 0x705a                        
  0cb5  FC7118         LDD 0x7118                        
  0cb8  3606           PSHU  B A                         
  0cba  3606           PSHU  B A                         
  0cbc  AD9FFCF2       JSR [0xfcf2]                      
  0cc0  3706           PULU  A B                         
  0cc2  FD7118         STD 0x7118                        
  0cc5  CC7FFF         LDD #0x7fff                       
  0cc8  B37118         SUBD 0x7118                       
  0ccb  FD7058         STD 0x7058                        
  0cce  170082         LBSR 0x0d53                       
  0cd1  3576           PULS  A B X Y U                   
  0cd3  39             RTS                               
PTR_FUN_M72_r4_00000__0d53_M72_r4_00000__0cd4:
  0cd4  0D53           addr M72_r4_00000::0d53           
  0cd6  0D1E           addr M72_r4_00000::0d1e           
  0cd8  .db 0D 12 70 44 70 46 00 00 70 48 00 08 00 61 05 00  ; ..pDpF..pH...a..
  0ce8  .db 00 00 14 00 01 00 15 13 0D 42 00 00 0E 55 70 4A  ; .........B...UpJ
  0cf8  .db 00 63                                            ; .c

; ---- function FUN_M72_r4_00000__0cfa
FUN_M72_r4_00000__0cfa:
  0cfa  3410           PSHS  X                           
  0cfc  8E0CD4         LDX #0xcd4                        
  0cff  AD9FFC4E       JSR [0xfc4e]                      
  0d03  3510           PULS  X                           
  0d05  39             RTS                               

; ---- function FUN_M72_r4_00000__0d06
FUN_M72_r4_00000__0d06:
  0d06  3410           PSHS  X                           
  0d08  8E0CD4         LDX #0xcd4                         ; desc[API_FDBC]: ->$0D53 ->$0D1E
  0d0b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0d0f  3510           PULS  X                           
  0d11  39             RTS                               

; ---- function FUN_M72_r4_00000__0d12
FUN_M72_r4_00000__0d12:
  0d12  3410           PSHS  X                           
  0d14  8E0CD4         LDX #0xcd4                         ; desc[API_FE6C]: ->$0D53 ->$0D1E
  0d17  AD9FFE6C       JSR [0xfe6c]                      
  0d1b  3510           PULS  X                           
  0d1d  39             RTS                               

; ---- function FUN_M72_r4_00000__0d1e
FUN_M72_r4_00000__0d1e:
  0d1e  3410           PSHS  X                           
  0d20  8E0CD4         LDX #0xcd4                        
  0d23  AD9FFC52       JSR [0xfc52]                      
  0d27  3510           PULS  X                           
  0d29  39             RTS                               

; ---- function FUN_M72_r4_00000__0d2a
FUN_M72_r4_00000__0d2a:
  0d2a  3410           PSHS  X                           
  0d2c  8E0CD4         LDX #0xcd4                         ; desc[API_FE1C]: ->$0D53 ->$0D1E
  0d2f  AD9FFE1C       JSR [0xfe1c]                      
  0d33  3510           PULS  X                           
  0d35  39             RTS                               

; ---- function FUN_M72_r4_00000__0d36
FUN_M72_r4_00000__0d36:
  0d36  3410           PSHS  X                           
  0d38  8E0CD4         LDX #0xcd4                         ; desc[API_FE1A]: ->$0D53 ->$0D1E $0D12
  0d3b  AD9FFE1A       JSR [0xfe1a]                      
  0d3f  3510           PULS  X                           
  0d41  39             RTS                               
  0d42  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  0d52  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__0d53
FUN_M72_r4_00000__0d53:
  0d53  3476           PSHS  U Y X B A                   
  0d55  8E0CD4         LDX #0xcd4                        
  0d58  AD9FFE76       JSR [0xfe76]                      
  0d5c  FC7048         LDD 0x7048                        
  0d5f  3606           PSHU  B A                         
  0d61  CC0005         LDD #0x5                          
  0d64  3606           PSHU  B A                         
  0d66  AD9FFCEE       JSR [0xfcee]                      
  0d6a  AD9FFEC4       JSR [0xfec4]                      
  0d6e  3706           PULU  A B                         
  0d70  FD7116         STD 0x7116                        
  0d73  CC7FFF         LDD #0x7fff                       
  0d76  B37116         SUBD 0x7116                       
  0d79  FD7118         STD 0x7118                        
  0d7c  FC7116         LDD 0x7116                        
  0d7f  3606           PSHU  B A                         
  0d81  3606           PSHU  B A                         
  0d83  AD9FFCF2       JSR [0xfcf2]                      
  0d87  3706           PULU  A B                         
  0d89  FD7116         STD 0x7116                        
  0d8c  CC7FFF         LDD #0x7fff                       
  0d8f  B37116         SUBD 0x7116                       
  0d92  FD704E         STD 0x704e                        
  0d95  FC7118         LDD 0x7118                        
  0d98  3606           PSHU  B A                         
  0d9a  3606           PSHU  B A                         
  0d9c  AD9FFCF2       JSR [0xfcf2]                      
  0da0  3706           PULU  A B                         
  0da2  FD7118         STD 0x7118                        
  0da5  CC7FFF         LDD #0x7fff                       
  0da8  B37118         SUBD 0x7118                       
  0dab  FD704C         STD 0x704c                        
  0dae  FC705A         LDD 0x705a                        
  0db1  3606           PSHU  B A                         
  0db3  FC7040         LDD 0x7040                        
  0db6  3606           PSHU  B A                         
  0db8  AD9FFCF2       JSR [0xfcf2]                      
  0dbc  ECC4           LDD ,U                            
  0dbe  3606           PSHU  B A                         
  0dc0  FC704C         LDD 0x704c                        
  0dc3  3606           PSHU  B A                         
  0dc5  AD9FFCF2       JSR [0xfcf2]                      
  0dc9  3706           PULU  A B                         
  0dcb  FD705C         STD 0x705c                        
  0dce  FC704E         LDD 0x704e                        
  0dd1  3606           PSHU  B A                         
  0dd3  AD9FFCF2       JSR [0xfcf2]                      
  0dd7  3706           PULU  A B                         
  0dd9  FD705E         STD 0x705e                        
  0ddc  FC7058         LDD 0x7058                        
  0ddf  3606           PSHU  B A                         
  0de1  FC7040         LDD 0x7040                        
  0de4  3606           PSHU  B A                         
  0de6  AD9FFCF2       JSR [0xfcf2]                      
  0dea  ECC4           LDD ,U                            
  0dec  3606           PSHU  B A                         
  0dee  FC704C         LDD 0x704c                        
  0df1  3606           PSHU  B A                         
  0df3  AD9FFCF2       JSR [0xfcf2]                      
  0df7  3706           PULU  A B                         
  0df9  FD7060         STD 0x7060                        
  0dfc  FC704E         LDD 0x704e                        
  0dff  3606           PSHU  B A                         
  0e01  AD9FFCF2       JSR [0xfcf2]                      
  0e05  3706           PULU  A B                         
  0e07  FD7062         STD 0x7062                        
  0e0a  CC000A         LDD #0xa                          
  0e0d  AD9FFD20       JSR [0xfd20]                      
  0e11  108E0142       LDY #0x142                        
  0e15  FC705C         LDD 0x705c                        
  0e18  AD9FFD2E       JSR [0xfd2e]                      
  0e1c  CC000A         LDD #0xa                          
  0e1f  AD9FFD20       JSR [0xfd20]                      
  0e23  108E014A       LDY #0x14a                        
  0e27  FC705E         LDD 0x705e                        
  0e2a  AD9FFD2E       JSR [0xfd2e]                      
  0e2e  CC000A         LDD #0xa                          
  0e31  AD9FFD20       JSR [0xfd20]                      
  0e35  108E0143       LDY #0x143                        
  0e39  FC7060         LDD 0x7060                        
  0e3c  AD9FFD2E       JSR [0xfd2e]                      
  0e40  CC000A         LDD #0xa                          
  0e43  AD9FFD20       JSR [0xfd20]                      
  0e47  108E014B       LDY #0x14b                        
  0e4b  FC7062         LDD 0x7062                        
  0e4e  AD9FFD2E       JSR [0xfd2e]                      
  0e52  3576           PULS  A B X Y U                   
  0e54  39             RTS                               
  0e55  .db 0C 20 20 20 20 20 20 20 20 20 7C 20 20 20 20 20  ; .         |     
  0e65  .db 20 20 20 20 52 4C 0C 20 20 20 20 20 20 20 20 7C  ;     RL.        |
  0e75  .db 20 20 20 20 20 20 20 20 20 52 4C 20 0C 20 20 20  ;          RL .   
  0e85  .db 20 20 20 20 7C 20 20 20 20 20 20 20 20 20 52 4C  ;     |         RL
  0e95  .db 20 20 0C 20 20 20 20 20 20 7C 20 20 20 20 20 20  ;   .      |      
  0ea5  .db 20 20 20 52 4C 20 20 20 0C 20 20 20 20 20 7C 20  ;    RL   .     | 
  0eb5  .db 20 20 20 20 20 20 20 20 52 4C 20 20 20 20 0C 20  ;         RL    . 
  0ec5  .db 20 20 20 7C 20 20 20 20 20 20 20 20 20 52 4C 20  ;    |         RL 
  0ed5  .db 20 20 20 20 0C 20 20 20 7C 20 20 20 20 20 20 20  ;     .   |       
  0ee5  .db 20 20 52 4C 20 20 20 20 20 20 0C 20 20 7C 20 20  ;   RL      .  |  
  0ef5  .db 20 20 20 20 20 20 20 52 4C 20 20 20 20 20 20 20  ;        RL       
  0f05  .db 0C 20 7C 20 20 20 20 20 20 20 20 20 52 4C 20 20  ; . |         RL  
  0f15  .db 20 20 20 20 20 20 0C 7C 20 20 20 20 20 20 20 20  ;       .|        
  0f25  .db 20 52 4C 20 20 20 20 20 20 20 20 20 0C 20 20 20  ;  RL         .   
  0f35  .db 20 20 20 20 20 20 52 4C 20 20 20 20 20 20 20 20  ;       RL        
  0f45  .db 20 7C 0C 20 20 20 20 20 20 20 20 52 4C 20 20 20  ;  |.        RL   
  0f55  .db 20 20 20 20 20 20 7C 20 0C 20 20 20 20 20 20 20  ;       | .       
  0f65  .db 52 4C 20 20 20 20 20 20 20 20 20 7C 20 20 0C 20  ; RL         |  . 
  0f75  .db 20 20 20 20 20 52 4C 20 20 20 20 20 20 20 20 20  ;      RL         
  0f85  .db 7C 20 20 20 0C 20 20 20 20 20 52 4C 20 20 20 20  ; |   .     RL    
  0f95  .db 20 20 20 20 20 7C 20 20 20 20 0C 20 20 20 20 52  ;      |    .    R
  0fa5  .db 4C 20 20 20 20 20 20 20 20 20 7C 20 20 20 20 20  ; L         |     
  0fb5  .db 0C 20 20 20 52 4C 20 20 20 20 20 20 20 20 20 7C  ; .   RL         |
  0fc5  .db 20 20 20 20 20 20 0C 20 20 52 4C 20 20 20 20 20  ;       .  RL     
  0fd5  .db 20 20 20 20 7C 20 20 20 20 20 20 20 0C 20 52 4C  ;     |       . RL
  0fe5  .db 20 20 20 20 20 20 20 20 20 7C 20 20 20 20 20 20  ;          |      
  0ff5  .db 20 20 0C 52 4C 20 20 20 20 20 20 20 20 20 7C 20  ;   .RL         | 
  1005  .db 20 20 20 20 20 20 20 20 0C                       ;         .
PTR_FUN_M72_r4_00000__108d_M72_r4_00000__100e:
  100e  108D           addr M72_r4_00000::108d           
  1010  1058           addr M72_r4_00000::1058           
  1012  .db 10 4C 70 A8 70 D8 00 00 70 F0 00 08 00 85 19 00  ; .Lp.p...p.......
  1022  .db 00 00 14 00 01 00 15 13 10 7C 00 00 0E 55 70 B4  ; .........|...Up.
  1032  .db 00 91                                            ; ..

; ---- function FUN_M72_r4_00000__1034
FUN_M72_r4_00000__1034:
  1034  3410           PSHS  X                           
  1036  8E100E         LDX #0x100e                       
  1039  AD9FFC4E       JSR [0xfc4e]                      
  103d  3510           PULS  X                           
  103f  39             RTS                               

; ---- function FUN_M72_r4_00000__1040
FUN_M72_r4_00000__1040:
  1040  3410           PSHS  X                           
  1042  8E100E         LDX #0x100e                        ; desc[API_FDBC]: ->$108D ->$1058
  1045  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1049  3510           PULS  X                           
  104b  39             RTS                               

; ---- function FUN_M72_r4_00000__104c
FUN_M72_r4_00000__104c:
  104c  3410           PSHS  X                           
  104e  8E100E         LDX #0x100e                        ; desc[API_FE6C]: ->$108D ->$1058
  1051  AD9FFE6C       JSR [0xfe6c]                      
  1055  3510           PULS  X                           
  1057  39             RTS                               

; ---- function FUN_M72_r4_00000__1058
FUN_M72_r4_00000__1058:
  1058  3410           PSHS  X                           
  105a  8E100E         LDX #0x100e                       
  105d  AD9FFC52       JSR [0xfc52]                      
  1061  3510           PULS  X                           
  1063  39             RTS                               

; ---- function FUN_M72_r4_00000__1064
FUN_M72_r4_00000__1064:
  1064  3410           PSHS  X                           
  1066  8E100E         LDX #0x100e                        ; desc[API_FE1C]: ->$108D ->$1058
  1069  AD9FFE1C       JSR [0xfe1c]                      
  106d  3510           PULS  X                           
  106f  39             RTS                               

; ---- function FUN_M72_r4_00000__1070
FUN_M72_r4_00000__1070:
  1070  3410           PSHS  X                           
  1072  8E100E         LDX #0x100e                        ; desc[API_FE1A]: ->$108D ->$1058 $104C
  1075  AD9FFE1A       JSR [0xfe1a]                      
  1079  3510           PULS  X                           
  107b  39             RTS                               
  107c  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  108c  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__108d
FUN_M72_r4_00000__108d:
  108d  3476           PSHS  U Y X B A                   
  108f  8E100E         LDX #0x100e                       
  1092  AD9FFE76       JSR [0xfe76]                      
  1096  17034C         LBSR 0x13e5                       
  1099  3576           PULS  A B X Y U                   
  109b  39             RTS                               
PTR_FUN_M72_r4_00000__111b_M72_r4_00000__109c:
  109c  111B           addr M72_r4_00000::111b           
  109e  10E6           addr M72_r4_00000::10e6           
  10a0  .db 10 DA 70 AA 70 DA 00 00 70 F2 00 08 00 87 1A 00  ; ..p.p...p.......
  10b0  .db 00 00 14 00 01 00 15 13 11 0A 00 00 0E 55 70 B6  ; .............Up.
  10c0  .db 00 93                                            ; ..

; ---- function FUN_M72_r4_00000__10c2
FUN_M72_r4_00000__10c2:
  10c2  3410           PSHS  X                           
  10c4  8E109C         LDX #0x109c                       
  10c7  AD9FFC4E       JSR [0xfc4e]                      
  10cb  3510           PULS  X                           
  10cd  39             RTS                               

; ---- function FUN_M72_r4_00000__10ce
FUN_M72_r4_00000__10ce:
  10ce  3410           PSHS  X                           
  10d0  8E109C         LDX #0x109c                        ; desc[API_FDBC]: ->$111B ->$10E6
  10d3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  10d7  3510           PULS  X                           
  10d9  39             RTS                               

; ---- function FUN_M72_r4_00000__10da
FUN_M72_r4_00000__10da:
  10da  3410           PSHS  X                           
  10dc  8E109C         LDX #0x109c                        ; desc[API_FE6C]: ->$111B ->$10E6
  10df  AD9FFE6C       JSR [0xfe6c]                      
  10e3  3510           PULS  X                           
  10e5  39             RTS                               

; ---- function FUN_M72_r4_00000__10e6
FUN_M72_r4_00000__10e6:
  10e6  3410           PSHS  X                           
  10e8  8E109C         LDX #0x109c                       
  10eb  AD9FFC52       JSR [0xfc52]                      
  10ef  3510           PULS  X                           
  10f1  39             RTS                               

; ---- function FUN_M72_r4_00000__10f2
FUN_M72_r4_00000__10f2:
  10f2  3410           PSHS  X                           
  10f4  8E109C         LDX #0x109c                        ; desc[API_FE1C]: ->$111B ->$10E6
  10f7  AD9FFE1C       JSR [0xfe1c]                      
  10fb  3510           PULS  X                           
  10fd  39             RTS                               

; ---- function FUN_M72_r4_00000__10fe
FUN_M72_r4_00000__10fe:
  10fe  3410           PSHS  X                           
  1100  8E109C         LDX #0x109c                        ; desc[API_FE1A]: ->$111B ->$10E6 $10DA
  1103  AD9FFE1A       JSR [0xfe1a]                      
  1107  3510           PULS  X                           
  1109  39             RTS                               
  110a  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  111a  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__111b
FUN_M72_r4_00000__111b:
  111b  3476           PSHS  U Y X B A                   
  111d  8E109C         LDX #0x109c                       
  1120  AD9FFE76       JSR [0xfe76]                      
  1124  1703AC         LBSR 0x14d3                       
  1127  3576           PULS  A B X Y U                   
  1129  39             RTS                               
PTR_FUN_M72_r4_00000__11a9_M72_r4_00000__112a:
  112a  11A9           addr M72_r4_00000::11a9           
  112c  1174           addr M72_r4_00000::1174           
  112e  .db 11 68 70 AC 70 DC 00 00 70 F4 00 08 00 89 1B 00  ; .hp.p...p.......
  113e  .db 00 00 14 00 01 00 15 13 11 98 00 00 0E 55 70 B8  ; .............Up.
  114e  .db 00 95                                            ; ..

; ---- function FUN_M72_r4_00000__1150
FUN_M72_r4_00000__1150:
  1150  3410           PSHS  X                           
  1152  8E112A         LDX #0x112a                       
  1155  AD9FFC4E       JSR [0xfc4e]                      
  1159  3510           PULS  X                           
  115b  39             RTS                               

; ---- function FUN_M72_r4_00000__115c
FUN_M72_r4_00000__115c:
  115c  3410           PSHS  X                           
  115e  8E112A         LDX #0x112a                        ; desc[API_FDBC]: ->$11A9 ->$1174
  1161  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...*"
  1165  3510           PULS  X                           
  1167  39             RTS                               

; ---- function FUN_M72_r4_00000__1168
FUN_M72_r4_00000__1168:
  1168  3410           PSHS  X                           
  116a  8E112A         LDX #0x112a                        ; desc[API_FE6C]: ->$11A9 ->$1174
  116d  AD9FFE6C       JSR [0xfe6c]                      
  1171  3510           PULS  X                           
  1173  39             RTS                               

; ---- function FUN_M72_r4_00000__1174
FUN_M72_r4_00000__1174:
  1174  3410           PSHS  X                           
  1176  8E112A         LDX #0x112a                       
  1179  AD9FFC52       JSR [0xfc52]                      
  117d  3510           PULS  X                           
  117f  39             RTS                               

; ---- function FUN_M72_r4_00000__1180
FUN_M72_r4_00000__1180:
  1180  3410           PSHS  X                           
  1182  8E112A         LDX #0x112a                        ; desc[API_FE1C]: ->$11A9 ->$1174
  1185  AD9FFE1C       JSR [0xfe1c]                      
  1189  3510           PULS  X                           
  118b  39             RTS                               

; ---- function FUN_M72_r4_00000__118c
FUN_M72_r4_00000__118c:
  118c  3410           PSHS  X                           
  118e  8E112A         LDX #0x112a                        ; desc[API_FE1A]: ->$11A9 ->$1174 $1168
  1191  AD9FFE1A       JSR [0xfe1a]                      
  1195  3510           PULS  X                           
  1197  39             RTS                               
  1198  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  11a8  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__11a9
FUN_M72_r4_00000__11a9:
  11a9  3476           PSHS  U Y X B A                   
  11ab  8E112A         LDX #0x112a                       
  11ae  AD9FFE76       JSR [0xfe76]                      
  11b2  17040C         LBSR 0x15c1                       
  11b5  3576           PULS  A B X Y U                   
  11b7  39             RTS                               
PTR_FUN_M72_r4_00000__1237_M72_r4_00000__11b8:
  11b8  1237           addr M72_r4_00000::1237           
  11ba  1202           addr M72_r4_00000::1202           
  11bc  .db 11 F6 70 AE 70 DE 00 00 70 F6 00 08 00 8B 1C 00  ; ..p.p...p.......
  11cc  .db 00 00 14 00 01 00 15 13 12 26 00 00 0E 55 70 BA  ; .........&...Up.
  11dc  .db 00 97                                            ; ..

; ---- function FUN_M72_r4_00000__11de
FUN_M72_r4_00000__11de:
  11de  3410           PSHS  X                           
  11e0  8E11B8         LDX #0x11b8                       
  11e3  AD9FFC4E       JSR [0xfc4e]                      
  11e7  3510           PULS  X                           
  11e9  39             RTS                               

; ---- function FUN_M72_r4_00000__11ea
FUN_M72_r4_00000__11ea:
  11ea  3410           PSHS  X                           
  11ec  8E11B8         LDX #0x11b8                        ; desc[API_FDBC]: ->$1237 ->$1202
  11ef  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  11f3  3510           PULS  X                           
  11f5  39             RTS                               

; ---- function FUN_M72_r4_00000__11f6
FUN_M72_r4_00000__11f6:
  11f6  3410           PSHS  X                           
  11f8  8E11B8         LDX #0x11b8                        ; desc[API_FE6C]: ->$1237 ->$1202
  11fb  AD9FFE6C       JSR [0xfe6c]                      
  11ff  3510           PULS  X                           
  1201  39             RTS                               

; ---- function FUN_M72_r4_00000__1202
FUN_M72_r4_00000__1202:
  1202  3410           PSHS  X                           
  1204  8E11B8         LDX #0x11b8                       
  1207  AD9FFC52       JSR [0xfc52]                      
  120b  3510           PULS  X                           
  120d  39             RTS                               

; ---- function FUN_M72_r4_00000__120e
FUN_M72_r4_00000__120e:
  120e  3410           PSHS  X                           
  1210  8E11B8         LDX #0x11b8                        ; desc[API_FE1C]: ->$1237 ->$1202
  1213  AD9FFE1C       JSR [0xfe1c]                      
  1217  3510           PULS  X                           
  1219  39             RTS                               

; ---- function FUN_M72_r4_00000__121a
FUN_M72_r4_00000__121a:
  121a  3410           PSHS  X                           
  121c  8E11B8         LDX #0x11b8                        ; desc[API_FE1A]: ->$1237 ->$1202 $11F6
  121f  AD9FFE1A       JSR [0xfe1a]                      
  1223  3510           PULS  X                           
  1225  39             RTS                               
  1226  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  1236  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__1237
FUN_M72_r4_00000__1237:
  1237  3476           PSHS  U Y X B A                   
  1239  8E11B8         LDX #0x11b8                       
  123c  AD9FFE76       JSR [0xfe76]                      
  1240  17046C         LBSR 0x16af                       
  1243  3576           PULS  A B X Y U                   
  1245  39             RTS                               
PTR_FUN_M72_r4_00000__12c5_M72_r4_00000__1246:
  1246  12C5           addr M72_r4_00000::12c5           
  1248  1290           addr M72_r4_00000::1290           
  124a  .db 12 84 70 B0 70 E0 00 00 70 F8 00 08 00 8D 1D 00  ; ..p.p...p.......
  125a  .db 00 00 14 00 01 00 15 13 12 B4 00 00 0E 55 70 BC  ; .............Up.
  126a  .db 00 99                                            ; ..

; ---- function FUN_M72_r4_00000__126c
FUN_M72_r4_00000__126c:
  126c  3410           PSHS  X                           
  126e  8E1246         LDX #0x1246                       
  1271  AD9FFC4E       JSR [0xfc4e]                      
  1275  3510           PULS  X                           
  1277  39             RTS                               

; ---- function FUN_M72_r4_00000__1278
FUN_M72_r4_00000__1278:
  1278  3410           PSHS  X                           
  127a  8E1246         LDX #0x1246                        ; desc[API_FDBC]: ->$12C5 ->$1290
  127d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...F"
  1281  3510           PULS  X                           
  1283  39             RTS                               

; ---- function FUN_M72_r4_00000__1284
FUN_M72_r4_00000__1284:
  1284  3410           PSHS  X                           
  1286  8E1246         LDX #0x1246                        ; desc[API_FE6C]: ->$12C5 ->$1290
  1289  AD9FFE6C       JSR [0xfe6c]                      
  128d  3510           PULS  X                           
  128f  39             RTS                               

; ---- function FUN_M72_r4_00000__1290
FUN_M72_r4_00000__1290:
  1290  3410           PSHS  X                           
  1292  8E1246         LDX #0x1246                       
  1295  AD9FFC52       JSR [0xfc52]                      
  1299  3510           PULS  X                           
  129b  39             RTS                               

; ---- function FUN_M72_r4_00000__129c
FUN_M72_r4_00000__129c:
  129c  3410           PSHS  X                           
  129e  8E1246         LDX #0x1246                        ; desc[API_FE1C]: ->$12C5 ->$1290
  12a1  AD9FFE1C       JSR [0xfe1c]                      
  12a5  3510           PULS  X                           
  12a7  39             RTS                               

; ---- function FUN_M72_r4_00000__12a8
FUN_M72_r4_00000__12a8:
  12a8  3410           PSHS  X                           
  12aa  8E1246         LDX #0x1246                        ; desc[API_FE1A]: ->$12C5 ->$1290 $1284
  12ad  AD9FFE1A       JSR [0xfe1a]                      
  12b1  3510           PULS  X                           
  12b3  39             RTS                               
  12b4  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  12c4  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__12c5
FUN_M72_r4_00000__12c5:
  12c5  3476           PSHS  U Y X B A                   
  12c7  8E1246         LDX #0x1246                       
  12ca  AD9FFE76       JSR [0xfe76]                      
  12ce  1704CC         LBSR 0x179d                       
  12d1  3576           PULS  A B X Y U                   
  12d3  39             RTS                               
PTR_FUN_M72_r4_00000__1353_M72_r4_00000__12d4:
  12d4  1353           addr M72_r4_00000::1353           
  12d6  131E           addr M72_r4_00000::131e           
  12d8  .db 13 12 70 B2 70 E2 00 00 70 FA 00 08 00 8F 1E 00  ; ..p.p...p.......
  12e8  .db 00 00 14 00 01 00 15 13 13 42 00 00 0E 55 70 BE  ; .........B...Up.
  12f8  .db 00 9B                                            ; ..

; ---- function FUN_M72_r4_00000__12fa
FUN_M72_r4_00000__12fa:
  12fa  3410           PSHS  X                           
  12fc  8E12D4         LDX #0x12d4                       
  12ff  AD9FFC4E       JSR [0xfc4e]                      
  1303  3510           PULS  X                           
  1305  39             RTS                               

; ---- function FUN_M72_r4_00000__1306
FUN_M72_r4_00000__1306:
  1306  3410           PSHS  X                           
  1308  8E12D4         LDX #0x12d4                        ; desc[API_FDBC]: ->$1353 ->$131E
  130b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  130f  3510           PULS  X                           
  1311  39             RTS                               

; ---- function FUN_M72_r4_00000__1312
FUN_M72_r4_00000__1312:
  1312  3410           PSHS  X                           
  1314  8E12D4         LDX #0x12d4                        ; desc[API_FE6C]: ->$1353 ->$131E
  1317  AD9FFE6C       JSR [0xfe6c]                      
  131b  3510           PULS  X                           
  131d  39             RTS                               

; ---- function FUN_M72_r4_00000__131e
FUN_M72_r4_00000__131e:
  131e  3410           PSHS  X                           
  1320  8E12D4         LDX #0x12d4                       
  1323  AD9FFC52       JSR [0xfc52]                      
  1327  3510           PULS  X                           
  1329  39             RTS                               

; ---- function FUN_M72_r4_00000__132a
FUN_M72_r4_00000__132a:
  132a  3410           PSHS  X                           
  132c  8E12D4         LDX #0x12d4                        ; desc[API_FE1C]: ->$1353 ->$131E
  132f  AD9FFE1C       JSR [0xfe1c]                      
  1333  3510           PULS  X                           
  1335  39             RTS                               

; ---- function FUN_M72_r4_00000__1336
FUN_M72_r4_00000__1336:
  1336  3410           PSHS  X                           
  1338  8E12D4         LDX #0x12d4                        ; desc[API_FE1A]: ->$1353 ->$131E $1312
  133b  AD9FFE1A       JSR [0xfe1a]                      
  133f  3510           PULS  X                           
  1341  39             RTS                               
  1342  .db 13 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; .               
  1352  .db 20                                               ;  

; ---- function FUN_M72_r4_00000__1353
FUN_M72_r4_00000__1353:
  1353  3476           PSHS  U Y X B A                   
  1355  8E12D4         LDX #0x12d4                       
  1358  AD9FFE76       JSR [0xfe76]                      
  135c  17052C         LBSR 0x188b                       
  135f  3576           PULS  A B X Y U                   
  1361  39             RTS                               
PTR_FUN_M72_r4_00000__13e5_M72_r4_00000__1362:
  1362  13E5           addr M72_r4_00000::13e5           
  1364  13AC           addr M72_r4_00000::13ac           
  1366  .db 13 A0 70 C0 70 E4 00 00 70 FC 00 08 00 9D 1F FF  ; ..p.p...p.......
  1376  .db 9C 00 64 00 01 00 04 1B 13 D0 00 00 00 00 70 CC  ; ..d...........p.
  1386  .db 00 A9                                            ; ..

; ---- function FUN_M72_r4_00000__1388
FUN_M72_r4_00000__1388:
  1388  3410           PSHS  X                           
  138a  8E1362         LDX #0x1362                        ; desc[API_FE6A]: ->$13E5 ->$13AC
  138d  AD9FFE6A       JSR [0xfe6a]                      
  1391  3510           PULS  X                           
  1393  39             RTS                               

; ---- function FUN_M72_r4_00000__1394
FUN_M72_r4_00000__1394:
  1394  3410           PSHS  X                           
  1396  8E1362         LDX #0x1362                        ; desc[API_FDBC]: ->$13E5 ->$13AC
  1399  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...b"
  139d  3510           PULS  X                           
  139f  39             RTS                               

; ---- function FUN_M72_r4_00000__13a0
FUN_M72_r4_00000__13a0:
  13a0  3410           PSHS  X                           
  13a2  8E1362         LDX #0x1362                        ; desc[API_FE6C]: ->$13E5 ->$13AC
  13a5  AD9FFE6C       JSR [0xfe6c]                      
  13a9  3510           PULS  X                           
  13ab  39             RTS                               

; ---- function FUN_M72_r4_00000__13ac
FUN_M72_r4_00000__13ac:
  13ac  3410           PSHS  X                           
  13ae  8E1362         LDX #0x1362                        ; desc[API_FE6E]: ->$13E5 ->$13AC
  13b1  AD9FFE6E       JSR [0xfe6e]                      
  13b5  3510           PULS  X                           
  13b7  39             RTS                               

; ---- function FUN_M72_r4_00000__13b8
FUN_M72_r4_00000__13b8:
  13b8  3410           PSHS  X                           
  13ba  8E1362         LDX #0x1362                        ; desc[API_FE1C]: ->$13E5 ->$13AC
  13bd  AD9FFE1C       JSR [0xfe1c]                      
  13c1  3510           PULS  X                           
  13c3  39             RTS                               

; ---- function FUN_M72_r4_00000__13c4
FUN_M72_r4_00000__13c4:
  13c4  3410           PSHS  X                           
  13c6  8E1362         LDX #0x1362                        ; desc[API_FE1A]: ->$13E5 ->$13AC $13A0
  13c9  AD9FFE1A       JSR [0xfe1a]                      
  13cd  3510           PULS  X                           
  13cf  39             RTS                               
  13d0  .db 14 6C 65 76 65 6C 31 3A 20 20 20 20 20 25 20 20  ; .level1:     %  
  13e0  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M72_r4_00000__13e5
FUN_M72_r4_00000__13e5:
  13e5  3476           PSHS  U Y X B A                   
  13e7  8E1362         LDX #0x1362                       
  13ea  AD9FFE76       JSR [0xfe76]                      
  13ee  FC70F0         LDD 0x70f0                        
  13f1  3606           PSHU  B A                         
  13f3  CC0005         LDD #0x5                          
  13f6  3606           PSHU  B A                         
  13f8  AD9FFCEE       JSR [0xfcee]                      
  13fc  AD9FFEC4       JSR [0xfec4]                      
  1400  FC70FC         LDD 0x70fc                        
  1403  3606           PSHU  B A                         
  1405  AD9FFEC4       JSR [0xfec4]                      
  1409  FC7042         LDD 0x7042                        
  140c  3606           PSHU  B A                         
  140e  AD9FFCF2       JSR [0xfcf2]                      
  1412  ECC4           LDD ,U                            
  1414  FD7118         STD 0x7118                        
  1417  AD9FFCF2       JSR [0xfcf2]                      
  141b  3706           PULU  A B                         
  141d  FD7116         STD 0x7116                        
  1420  FC7118         LDD 0x7118                        
  1423  B37116         SUBD 0x7116                       
  1426  FD7118         STD 0x7118                        
  1429  CC000A         LDD #0xa                          
  142c  AD9FFD20       JSR [0xfd20]                      
  1430  108E0144       LDY #0x144                        
  1434  FC7116         LDD 0x7116                        
  1437  AD9FFD2E       JSR [0xfd2e]                      
  143b  CC000A         LDD #0xa                          
  143e  AD9FFD20       JSR [0xfd20]                      
  1442  108E014C       LDY #0x14c                        
  1446  FC7118         LDD 0x7118                        
  1449  AD9FFD2E       JSR [0xfd2e]                      
  144d  3576           PULS  A B X Y U                   
  144f  39             RTS                               
PTR_FUN_M72_r4_00000__14d3_M72_r4_00000__1450:
  1450  14D3           addr M72_r4_00000::14d3           
  1452  149A           addr M72_r4_00000::149a           
  1454  .db 14 8E 70 C2 70 E6 00 00 70 FE 00 08 00 9F 20 FF  ; ..p.p...p..... .
  1464  .db 9C 00 64 00 01 00 04 1B 14 BE 00 00 00 00 70 CE  ; ..d...........p.
  1474  .db 00 AB                                            ; ..

; ---- function FUN_M72_r4_00000__1476
FUN_M72_r4_00000__1476:
  1476  3410           PSHS  X                           
  1478  8E1450         LDX #0x1450                        ; desc[API_FE6A]: ->$14D3 ->$149A
  147b  AD9FFE6A       JSR [0xfe6a]                      
  147f  3510           PULS  X                           
  1481  39             RTS                               

; ---- function FUN_M72_r4_00000__1482
FUN_M72_r4_00000__1482:
  1482  3410           PSHS  X                           
  1484  8E1450         LDX #0x1450                        ; desc[API_FDBC]: ->$14D3 ->$149A
  1487  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...P"
  148b  3510           PULS  X                           
  148d  39             RTS                               

; ---- function FUN_M72_r4_00000__148e
FUN_M72_r4_00000__148e:
  148e  3410           PSHS  X                           
  1490  8E1450         LDX #0x1450                        ; desc[API_FE6C]: ->$14D3 ->$149A
  1493  AD9FFE6C       JSR [0xfe6c]                      
  1497  3510           PULS  X                           
  1499  39             RTS                               

; ---- function FUN_M72_r4_00000__149a
FUN_M72_r4_00000__149a:
  149a  3410           PSHS  X                           
  149c  8E1450         LDX #0x1450                        ; desc[API_FE6E]: ->$14D3 ->$149A
  149f  AD9FFE6E       JSR [0xfe6e]                      
  14a3  3510           PULS  X                           
  14a5  39             RTS                               

; ---- function FUN_M72_r4_00000__14a6
FUN_M72_r4_00000__14a6:
  14a6  3410           PSHS  X                           
  14a8  8E1450         LDX #0x1450                        ; desc[API_FE1C]: ->$14D3 ->$149A
  14ab  AD9FFE1C       JSR [0xfe1c]                      
  14af  3510           PULS  X                           
  14b1  39             RTS                               

; ---- function FUN_M72_r4_00000__14b2
FUN_M72_r4_00000__14b2:
  14b2  3410           PSHS  X                           
  14b4  8E1450         LDX #0x1450                        ; desc[API_FE1A]: ->$14D3 ->$149A $148E
  14b7  AD9FFE1A       JSR [0xfe1a]                      
  14bb  3510           PULS  X                           
  14bd  39             RTS                               
  14be  .db 14 6C 65 76 65 6C 32 3A 20 20 20 20 20 25 20 20  ; .level2:     %  
  14ce  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__14d3
FUN_M72_r4_00000__14d3:
  14d3  3476           PSHS  U Y X B A                   
  14d5  8E1450         LDX #0x1450                       
  14d8  AD9FFE76       JSR [0xfe76]                      
  14dc  FC70F2         LDD 0x70f2                        
  14df  3606           PSHU  B A                         
  14e1  CC0005         LDD #0x5                          
  14e4  3606           PSHU  B A                         
  14e6  AD9FFCEE       JSR [0xfcee]                      
  14ea  AD9FFEC4       JSR [0xfec4]                      
  14ee  FC70FE         LDD 0x70fe                        
  14f1  3606           PSHU  B A                         
  14f3  AD9FFEC4       JSR [0xfec4]                      
  14f7  FC7042         LDD 0x7042                        
  14fa  3606           PSHU  B A                         
  14fc  AD9FFCF2       JSR [0xfcf2]                      
  1500  ECC4           LDD ,U                            
  1502  FD7118         STD 0x7118                        
  1505  AD9FFCF2       JSR [0xfcf2]                      
  1509  3706           PULU  A B                         
  150b  FD7116         STD 0x7116                        
  150e  FC7118         LDD 0x7118                        
  1511  B37116         SUBD 0x7116                       
  1514  FD7118         STD 0x7118                        
  1517  CC000A         LDD #0xa                          
  151a  AD9FFD20       JSR [0xfd20]                      
  151e  108E0145       LDY #0x145                        
  1522  FC7116         LDD 0x7116                        
  1525  AD9FFD2E       JSR [0xfd2e]                      
  1529  CC000A         LDD #0xa                          
  152c  AD9FFD20       JSR [0xfd20]                      
  1530  108E014D       LDY #0x14d                        
  1534  FC7118         LDD 0x7118                        
  1537  AD9FFD2E       JSR [0xfd2e]                      
  153b  3576           PULS  A B X Y U                   
  153d  39             RTS                               
PTR_FUN_M72_r4_00000__15c1_M72_r4_00000__153e:
  153e  15C1           addr M72_r4_00000::15c1           
  1540  1588           addr M72_r4_00000::1588           
  1542  .db 15 7C 70 C4 70 E8 00 00 71 00 00 08 00 A1 21 FF  ; .|p.p...q.....!.
  1552  .db 9C 00 64 00 01 00 04 1B 15 AC 00 00 00 00 70 D0  ; ..d...........p.
  1562  .db 00 AD                                            ; ..

; ---- function FUN_M72_r4_00000__1564
FUN_M72_r4_00000__1564:
  1564  3410           PSHS  X                           
  1566  8E153E         LDX #0x153e                        ; desc[API_FE6A]: ->$15C1 ->$1588
  1569  AD9FFE6A       JSR [0xfe6a]                      
  156d  3510           PULS  X                           
  156f  39             RTS                               

; ---- function FUN_M72_r4_00000__1570
FUN_M72_r4_00000__1570:
  1570  3410           PSHS  X                           
  1572  8E153E         LDX #0x153e                        ; desc[API_FDBC]: ->$15C1 ->$1588
  1575  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...>"
  1579  3510           PULS  X                           
  157b  39             RTS                               

; ---- function FUN_M72_r4_00000__157c
FUN_M72_r4_00000__157c:
  157c  3410           PSHS  X                           
  157e  8E153E         LDX #0x153e                        ; desc[API_FE6C]: ->$15C1 ->$1588
  1581  AD9FFE6C       JSR [0xfe6c]                      
  1585  3510           PULS  X                           
  1587  39             RTS                               

; ---- function FUN_M72_r4_00000__1588
FUN_M72_r4_00000__1588:
  1588  3410           PSHS  X                           
  158a  8E153E         LDX #0x153e                        ; desc[API_FE6E]: ->$15C1 ->$1588
  158d  AD9FFE6E       JSR [0xfe6e]                      
  1591  3510           PULS  X                           
  1593  39             RTS                               

; ---- function FUN_M72_r4_00000__1594
FUN_M72_r4_00000__1594:
  1594  3410           PSHS  X                           
  1596  8E153E         LDX #0x153e                        ; desc[API_FE1C]: ->$15C1 ->$1588
  1599  AD9FFE1C       JSR [0xfe1c]                      
  159d  3510           PULS  X                           
  159f  39             RTS                               

; ---- function FUN_M72_r4_00000__15a0
FUN_M72_r4_00000__15a0:
  15a0  3410           PSHS  X                           
  15a2  8E153E         LDX #0x153e                        ; desc[API_FE1A]: ->$15C1 ->$1588 $157C
  15a5  AD9FFE1A       JSR [0xfe1a]                      
  15a9  3510           PULS  X                           
  15ab  39             RTS                               
  15ac  .db 14 6C 65 76 65 6C 33 3A 20 20 20 20 20 25 20 20  ; .level3:     %  
  15bc  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__15c1
FUN_M72_r4_00000__15c1:
  15c1  3476           PSHS  U Y X B A                   
  15c3  8E153E         LDX #0x153e                       
  15c6  AD9FFE76       JSR [0xfe76]                      
  15ca  FC70F4         LDD 0x70f4                        
  15cd  3606           PSHU  B A                         
  15cf  CC0005         LDD #0x5                          
  15d2  3606           PSHU  B A                         
  15d4  AD9FFCEE       JSR [0xfcee]                      
  15d8  AD9FFEC4       JSR [0xfec4]                      
  15dc  FC7100         LDD 0x7100                        
  15df  3606           PSHU  B A                         
  15e1  AD9FFEC4       JSR [0xfec4]                      
  15e5  FC7042         LDD 0x7042                        
  15e8  3606           PSHU  B A                         
  15ea  AD9FFCF2       JSR [0xfcf2]                      
  15ee  ECC4           LDD ,U                            
  15f0  FD7118         STD 0x7118                        
  15f3  AD9FFCF2       JSR [0xfcf2]                      
  15f7  3706           PULU  A B                         
  15f9  FD7116         STD 0x7116                        
  15fc  FC7118         LDD 0x7118                        
  15ff  B37116         SUBD 0x7116                       
  1602  FD7118         STD 0x7118                        
  1605  CC000A         LDD #0xa                          
  1608  AD9FFD20       JSR [0xfd20]                      
  160c  108E0146       LDY #0x146                        
  1610  FC7116         LDD 0x7116                        
  1613  AD9FFD2E       JSR [0xfd2e]                      
  1617  CC000A         LDD #0xa                          
  161a  AD9FFD20       JSR [0xfd20]                      
  161e  108E014E       LDY #0x14e                        
  1622  FC7118         LDD 0x7118                        
  1625  AD9FFD2E       JSR [0xfd2e]                      
  1629  3576           PULS  A B X Y U                   
  162b  39             RTS                               
PTR_FUN_M72_r4_00000__16af_M72_r4_00000__162c:
  162c  16AF           addr M72_r4_00000::16af           
  162e  1676           addr M72_r4_00000::1676           
  1630  .db 16 6A 70 C6 70 EA 00 00 71 02 00 08 00 A3 22 FF  ; .jp.p...q.....".
  1640  .db 9C 00 64 00 01 00 04 1B 16 9A 00 00 00 00 70 D2  ; ..d...........p.
  1650  .db 00 AF                                            ; ..

; ---- function FUN_M72_r4_00000__1652
FUN_M72_r4_00000__1652:
  1652  3410           PSHS  X                           
  1654  8E162C         LDX #0x162c                        ; desc[API_FE6A]: ->$16AF ->$1676
  1657  AD9FFE6A       JSR [0xfe6a]                      
  165b  3510           PULS  X                           
  165d  39             RTS                               

; ---- function FUN_M72_r4_00000__165e
FUN_M72_r4_00000__165e:
  165e  3410           PSHS  X                           
  1660  8E162C         LDX #0x162c                        ; desc[API_FDBC]: ->$16AF ->$1676
  1663  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...,"
  1667  3510           PULS  X                           
  1669  39             RTS                               

; ---- function FUN_M72_r4_00000__166a
FUN_M72_r4_00000__166a:
  166a  3410           PSHS  X                           
  166c  8E162C         LDX #0x162c                        ; desc[API_FE6C]: ->$16AF ->$1676
  166f  AD9FFE6C       JSR [0xfe6c]                      
  1673  3510           PULS  X                           
  1675  39             RTS                               

; ---- function FUN_M72_r4_00000__1676
FUN_M72_r4_00000__1676:
  1676  3410           PSHS  X                           
  1678  8E162C         LDX #0x162c                        ; desc[API_FE6E]: ->$16AF ->$1676
  167b  AD9FFE6E       JSR [0xfe6e]                      
  167f  3510           PULS  X                           
  1681  39             RTS                               

; ---- function FUN_M72_r4_00000__1682
FUN_M72_r4_00000__1682:
  1682  3410           PSHS  X                           
  1684  8E162C         LDX #0x162c                        ; desc[API_FE1C]: ->$16AF ->$1676
  1687  AD9FFE1C       JSR [0xfe1c]                      
  168b  3510           PULS  X                           
  168d  39             RTS                               

; ---- function FUN_M72_r4_00000__168e
FUN_M72_r4_00000__168e:
  168e  3410           PSHS  X                           
  1690  8E162C         LDX #0x162c                        ; desc[API_FE1A]: ->$16AF ->$1676 $166A
  1693  AD9FFE1A       JSR [0xfe1a]                      
  1697  3510           PULS  X                           
  1699  39             RTS                               
  169a  .db 14 6C 65 76 65 6C 34 3A 20 20 20 20 20 25 20 20  ; .level4:     %  
  16aa  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__16af
FUN_M72_r4_00000__16af:
  16af  3476           PSHS  U Y X B A                   
  16b1  8E162C         LDX #0x162c                       
  16b4  AD9FFE76       JSR [0xfe76]                      
  16b8  FC70F6         LDD 0x70f6                        
  16bb  3606           PSHU  B A                         
  16bd  CC0005         LDD #0x5                          
  16c0  3606           PSHU  B A                         
  16c2  AD9FFCEE       JSR [0xfcee]                      
  16c6  AD9FFEC4       JSR [0xfec4]                      
  16ca  FC7102         LDD 0x7102                        
  16cd  3606           PSHU  B A                         
  16cf  AD9FFEC4       JSR [0xfec4]                      
  16d3  FC7042         LDD 0x7042                        
  16d6  3606           PSHU  B A                         
  16d8  AD9FFCF2       JSR [0xfcf2]                      
  16dc  ECC4           LDD ,U                            
  16de  FD7118         STD 0x7118                        
  16e1  AD9FFCF2       JSR [0xfcf2]                      
  16e5  3706           PULU  A B                         
  16e7  FD7116         STD 0x7116                        
  16ea  FC7118         LDD 0x7118                        
  16ed  B37116         SUBD 0x7116                       
  16f0  FD7118         STD 0x7118                        
  16f3  CC000A         LDD #0xa                          
  16f6  AD9FFD20       JSR [0xfd20]                      
  16fa  108E0147       LDY #0x147                        
  16fe  FC7116         LDD 0x7116                        
  1701  AD9FFD2E       JSR [0xfd2e]                      
  1705  CC000A         LDD #0xa                          
  1708  AD9FFD20       JSR [0xfd20]                      
  170c  108E014F       LDY #0x14f                        
  1710  FC7118         LDD 0x7118                        
  1713  AD9FFD2E       JSR [0xfd2e]                      
  1717  3576           PULS  A B X Y U                   
  1719  39             RTS                               
PTR_FUN_M72_r4_00000__179d_M72_r4_00000__171a:
  171a  179D           addr M72_r4_00000::179d           
  171c  1764           addr M72_r4_00000::1764           
  171e  .db 17 58 70 C8 70 EC 00 00 71 04 00 08 00 A5 23 FF  ; .Xp.p...q.....#.
  172e  .db 9C 00 64 00 01 00 04 1B 17 88 00 00 00 00 70 D4  ; ..d...........p.
  173e  .db 00 B1                                            ; ..

; ---- function FUN_M72_r4_00000__1740
FUN_M72_r4_00000__1740:
  1740  3410           PSHS  X                           
  1742  8E171A         LDX #0x171a                        ; desc[API_FE6A]: ->$179D ->$1764
  1745  AD9FFE6A       JSR [0xfe6a]                      
  1749  3510           PULS  X                           
  174b  39             RTS                               

; ---- function FUN_M72_r4_00000__174c
FUN_M72_r4_00000__174c:
  174c  3410           PSHS  X                           
  174e  8E171A         LDX #0x171a                        ; desc[API_FDBC]: ->$179D ->$1764
  1751  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1755  3510           PULS  X                           
  1757  39             RTS                               

; ---- function FUN_M72_r4_00000__1758
FUN_M72_r4_00000__1758:
  1758  3410           PSHS  X                           
  175a  8E171A         LDX #0x171a                        ; desc[API_FE6C]: ->$179D ->$1764
  175d  AD9FFE6C       JSR [0xfe6c]                      
  1761  3510           PULS  X                           
  1763  39             RTS                               

; ---- function FUN_M72_r4_00000__1764
FUN_M72_r4_00000__1764:
  1764  3410           PSHS  X                           
  1766  8E171A         LDX #0x171a                        ; desc[API_FE6E]: ->$179D ->$1764
  1769  AD9FFE6E       JSR [0xfe6e]                      
  176d  3510           PULS  X                           
  176f  39             RTS                               

; ---- function FUN_M72_r4_00000__1770
FUN_M72_r4_00000__1770:
  1770  3410           PSHS  X                           
  1772  8E171A         LDX #0x171a                        ; desc[API_FE1C]: ->$179D ->$1764
  1775  AD9FFE1C       JSR [0xfe1c]                      
  1779  3510           PULS  X                           
  177b  39             RTS                               

; ---- function FUN_M72_r4_00000__177c
FUN_M72_r4_00000__177c:
  177c  3410           PSHS  X                           
  177e  8E171A         LDX #0x171a                        ; desc[API_FE1A]: ->$179D ->$1764 $1758
  1781  AD9FFE1A       JSR [0xfe1a]                      
  1785  3510           PULS  X                           
  1787  39             RTS                               
  1788  .db 14 6C 65 76 65 6C 35 3A 20 20 20 20 20 25 20 20  ; .level5:     %  
  1798  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__179d
FUN_M72_r4_00000__179d:
  179d  3476           PSHS  U Y X B A                   
  179f  8E171A         LDX #0x171a                       
  17a2  AD9FFE76       JSR [0xfe76]                      
  17a6  FC70F8         LDD 0x70f8                        
  17a9  3606           PSHU  B A                         
  17ab  CC0005         LDD #0x5                          
  17ae  3606           PSHU  B A                         
  17b0  AD9FFCEE       JSR [0xfcee]                      
  17b4  AD9FFEC4       JSR [0xfec4]                      
  17b8  FC7104         LDD 0x7104                        
  17bb  3606           PSHU  B A                         
  17bd  AD9FFEC4       JSR [0xfec4]                      
  17c1  FC7042         LDD 0x7042                        
  17c4  3606           PSHU  B A                         
  17c6  AD9FFCF2       JSR [0xfcf2]                      
  17ca  ECC4           LDD ,U                            
  17cc  FD7118         STD 0x7118                        
  17cf  AD9FFCF2       JSR [0xfcf2]                      
  17d3  3706           PULU  A B                         
  17d5  FD7116         STD 0x7116                        
  17d8  FC7118         LDD 0x7118                        
  17db  B37116         SUBD 0x7116                       
  17de  FD7118         STD 0x7118                        
  17e1  CC000A         LDD #0xa                          
  17e4  AD9FFD20       JSR [0xfd20]                      
  17e8  108E0148       LDY #0x148                        
  17ec  FC7116         LDD 0x7116                        
  17ef  AD9FFD2E       JSR [0xfd2e]                      
  17f3  CC000A         LDD #0xa                          
  17f6  AD9FFD20       JSR [0xfd20]                      
  17fa  108E0150       LDY #0x150                        
  17fe  FC7118         LDD 0x7118                        
  1801  AD9FFD2E       JSR [0xfd2e]                      
  1805  3576           PULS  A B X Y U                   
  1807  39             RTS                               
PTR_FUN_M72_r4_00000__188b_M72_r4_00000__1808:
  1808  188B           addr M72_r4_00000::188b           
  180a  1852           addr M72_r4_00000::1852           
  180c  .db 18 46 70 CA 70 EE 00 00 71 06 00 08 00 A7 24 FF  ; .Fp.p...q.....$.
  181c  .db 9C 00 64 00 01 00 04 1B 18 76 00 00 00 00 70 D6  ; ..d......v....p.
  182c  .db 00 B3                                            ; ..

; ---- function FUN_M72_r4_00000__182e
FUN_M72_r4_00000__182e:
  182e  3410           PSHS  X                           
  1830  8E1808         LDX #0x1808                        ; desc[API_FE6A]: ->$188B ->$1852
  1833  AD9FFE6A       JSR [0xfe6a]                      
  1837  3510           PULS  X                           
  1839  39             RTS                               

; ---- function FUN_M72_r4_00000__183a
FUN_M72_r4_00000__183a:
  183a  3410           PSHS  X                           
  183c  8E1808         LDX #0x1808                        ; desc[API_FDBC]: ->$188B ->$1852
  183f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1843  3510           PULS  X                           
  1845  39             RTS                               

; ---- function FUN_M72_r4_00000__1846
FUN_M72_r4_00000__1846:
  1846  3410           PSHS  X                           
  1848  8E1808         LDX #0x1808                        ; desc[API_FE6C]: ->$188B ->$1852
  184b  AD9FFE6C       JSR [0xfe6c]                      
  184f  3510           PULS  X                           
  1851  39             RTS                               

; ---- function FUN_M72_r4_00000__1852
FUN_M72_r4_00000__1852:
  1852  3410           PSHS  X                           
  1854  8E1808         LDX #0x1808                        ; desc[API_FE6E]: ->$188B ->$1852
  1857  AD9FFE6E       JSR [0xfe6e]                      
  185b  3510           PULS  X                           
  185d  39             RTS                               

; ---- function FUN_M72_r4_00000__185e
FUN_M72_r4_00000__185e:
  185e  3410           PSHS  X                           
  1860  8E1808         LDX #0x1808                        ; desc[API_FE1C]: ->$188B ->$1852
  1863  AD9FFE1C       JSR [0xfe1c]                      
  1867  3510           PULS  X                           
  1869  39             RTS                               

; ---- function FUN_M72_r4_00000__186a
FUN_M72_r4_00000__186a:
  186a  3410           PSHS  X                           
  186c  8E1808         LDX #0x1808                        ; desc[API_FE1A]: ->$188B ->$1852 $1846
  186f  AD9FFE1A       JSR [0xfe1a]                      
  1873  3510           PULS  X                           
  1875  39             RTS                               
  1876  .db 14 6C 65 76 65 6C 36 3A 20 20 20 20 20 25 20 20  ; .level6:     %  
  1886  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__188b
FUN_M72_r4_00000__188b:
  188b  3476           PSHS  U Y X B A                   
  188d  8E1808         LDX #0x1808                       
  1890  AD9FFE76       JSR [0xfe76]                      
  1894  FC70FA         LDD 0x70fa                        
  1897  3606           PSHU  B A                         
  1899  CC0005         LDD #0x5                          
  189c  3606           PSHU  B A                         
  189e  AD9FFCEE       JSR [0xfcee]                      
  18a2  AD9FFEC4       JSR [0xfec4]                      
  18a6  FC7106         LDD 0x7106                        
  18a9  3606           PSHU  B A                         
  18ab  AD9FFEC4       JSR [0xfec4]                      
  18af  FC7042         LDD 0x7042                        
  18b2  3606           PSHU  B A                         
  18b4  AD9FFCF2       JSR [0xfcf2]                      
  18b8  ECC4           LDD ,U                            
  18ba  FD7118         STD 0x7118                        
  18bd  AD9FFCF2       JSR [0xfcf2]                      
  18c1  3706           PULU  A B                         
  18c3  FD7116         STD 0x7116                        
  18c6  FC7118         LDD 0x7118                        
  18c9  B37116         SUBD 0x7116                       
  18cc  FD7118         STD 0x7118                        
  18cf  CC000A         LDD #0xa                          
  18d2  AD9FFD20       JSR [0xfd20]                      
  18d6  108E0149       LDY #0x149                        
  18da  FC7116         LDD 0x7116                        
  18dd  AD9FFD2E       JSR [0xfd2e]                      
  18e1  CC000A         LDD #0xa                          
  18e4  AD9FFD20       JSR [0xfd20]                      
  18e8  108E0151       LDY #0x151                        
  18ec  FC7118         LDD 0x7118                        
  18ef  AD9FFD2E       JSR [0xfd2e]                      
  18f3  3576           PULS  A B X Y U                   
  18f5  39             RTS                               
PTR_FUN_M72_r4_00000__1979_M72_r4_00000__18f6:
  18f6  1979           addr M72_r4_00000::1979           
  18f8  1940           addr M72_r4_00000::1940           
  18fa  .db 19 34 70 64 70 66 00 00 70 68 00 08 00 69 07 00  ; .4pdpf..ph...i..
  190a  .db 00 00 64 00 01 00 03 1F 19 64 00 00 00 00 70 6A  ; ..d......d....pj
  191a  .db 00 6B                                            ; .k

; ---- function FUN_M72_r4_00000__191c
FUN_M72_r4_00000__191c:
  191c  3410           PSHS  X                           
  191e  8E18F6         LDX #0x18f6                        ; desc[API_FE6A]: ->$1979 ->$1940
  1921  AD9FFE6A       JSR [0xfe6a]                      
  1925  3510           PULS  X                           
  1927  39             RTS                               

; ---- function FUN_M72_r4_00000__1928
FUN_M72_r4_00000__1928:
  1928  3410           PSHS  X                           
  192a  8E18F6         LDX #0x18f6                        ; desc[API_FDBC]: ->$1979 ->$1940
  192d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1931  3510           PULS  X                           
  1933  39             RTS                               

; ---- function FUN_M72_r4_00000__1934
FUN_M72_r4_00000__1934:
  1934  3410           PSHS  X                           
  1936  8E18F6         LDX #0x18f6                        ; desc[API_FE6C]: ->$1979 ->$1940
  1939  AD9FFE6C       JSR [0xfe6c]                      
  193d  3510           PULS  X                           
  193f  39             RTS                               

; ---- function FUN_M72_r4_00000__1940
FUN_M72_r4_00000__1940:
  1940  3410           PSHS  X                           
  1942  8E18F6         LDX #0x18f6                        ; desc[API_FE6E]: ->$1979 ->$1940
  1945  AD9FFE6E       JSR [0xfe6e]                      
  1949  3510           PULS  X                           
  194b  39             RTS                               

; ---- function FUN_M72_r4_00000__194c
FUN_M72_r4_00000__194c:
  194c  3410           PSHS  X                           
  194e  8E18F6         LDX #0x18f6                        ; desc[API_FE1C]: ->$1979 ->$1940
  1951  AD9FFE1C       JSR [0xfe1c]                      
  1955  3510           PULS  X                           
  1957  39             RTS                               

; ---- function FUN_M72_r4_00000__1958
FUN_M72_r4_00000__1958:
  1958  3410           PSHS  X                           
  195a  8E18F6         LDX #0x18f6                        ; desc[API_FE1A]: ->$1979 ->$1940 $1934
  195d  AD9FFE1A       JSR [0xfe1a]                      
  1961  3510           PULS  X                           
  1963  39             RTS                               
  1964  .db 14 64 69 66 66 75 73 69 6F 6E 3A 20 20 20 20 20  ; .diffusion:     
  1974  .db 25 20 20 20 20                                   ; %    

; ---- function FUN_M72_r4_00000__1979
FUN_M72_r4_00000__1979:
  1979  3476           PSHS  U Y X B A                   
  197b  8E18F6         LDX #0x18f6                       
  197e  AD9FFE76       JSR [0xfe76]                      
  1982  FC7068         LDD 0x7068                        
  1985  3606           PSHU  B A                         
  1987  AD9FFEC4       JSR [0xfec4]                      
  198b  3706           PULU  A B                         
  198d  FD706C         STD 0x706c                        
  1990  17054E         LBSR 0x1ee1                       
  1993  170602         LBSR 0x1f98                       
  1996  1706B6         LBSR 0x204f                       
  1999  3576           PULS  A B X Y U                   
  199b  39             RTS                               
PTR_FUN_M72_r4_00000__1a1f_M72_r4_00000__199c:
  199c  1A1F           addr M72_r4_00000::1a1f           
  199e  19E6           addr M72_r4_00000::19e6           
  19a0  .db 19 DA 70 80 70 82 00 00 70 84 00 08 00 B5 03 00  ; ..p.p...p.......
  19b0  .db 01 03 E8 00 01 01 05 1F 1A 0A 00 00 00 00 70 86  ; ..............p.
  19c0  .db 00 B7                                            ; ..

; ---- function FUN_M72_r4_00000__19c2
FUN_M72_r4_00000__19c2:
  19c2  3410           PSHS  X                           
  19c4  8E199C         LDX #0x199c                        ; desc[API_FE6A]: ->$1A1F ->$19E6
  19c7  AD9FFE6A       JSR [0xfe6a]                      
  19cb  3510           PULS  X                           
  19cd  39             RTS                               

; ---- function FUN_M72_r4_00000__19ce
FUN_M72_r4_00000__19ce:
  19ce  3410           PSHS  X                           
  19d0  8E199C         LDX #0x199c                        ; desc[API_FDBC]: ->$1A1F ->$19E6
  19d3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  19d7  3510           PULS  X                           
  19d9  39             RTS                               

; ---- function FUN_M72_r4_00000__19da
FUN_M72_r4_00000__19da:
  19da  3410           PSHS  X                           
  19dc  8E199C         LDX #0x199c                        ; desc[API_FE6C]: ->$1A1F ->$19E6
  19df  AD9FFE6C       JSR [0xfe6c]                      
  19e3  3510           PULS  X                           
  19e5  39             RTS                               

; ---- function FUN_M72_r4_00000__19e6
FUN_M72_r4_00000__19e6:
  19e6  3410           PSHS  X                           
  19e8  8E199C         LDX #0x199c                        ; desc[API_FE6E]: ->$1A1F ->$19E6
  19eb  AD9FFE6E       JSR [0xfe6e]                      
  19ef  3510           PULS  X                           
  19f1  39             RTS                               

; ---- function FUN_M72_r4_00000__19f2
FUN_M72_r4_00000__19f2:
  19f2  3410           PSHS  X                           
  19f4  8E199C         LDX #0x199c                        ; desc[API_FE1C]: ->$1A1F ->$19E6
  19f7  AD9FFE1C       JSR [0xfe1c]                      
  19fb  3510           PULS  X                           
  19fd  39             RTS                               

; ---- function FUN_M72_r4_00000__19fe
FUN_M72_r4_00000__19fe:
  19fe  3410           PSHS  X                           
  1a00  8E199C         LDX #0x199c                        ; desc[API_FE1A]: ->$1A1F ->$19E6 $19DA
  1a03  AD9FFE1A       JSR [0xfe1a]                      
  1a07  3510           PULS  X                           
  1a09  39             RTS                               
  1a0a  .db 14 72 6F 6F 6D 20 73 69 7A 65 3A 20 20 20 20 20  ; .room size:     
  1a1a  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M72_r4_00000__1a1f
FUN_M72_r4_00000__1a1f:
  1a1f  3476           PSHS  U Y X B A                   
  1a21  8E199C         LDX #0x199c                       
  1a24  AD9FFE76       JSR [0xfe76]                      
  1a28  FC7084         LDD 0x7084                        
  1a2b  3606           PSHU  B A                         
  1a2d  AD9FFEC6       JSR [0xfec6]                      
  1a31  3706           PULU  A B                         
  1a33  FD7088         STD 0x7088                        
  1a36  170A76         LBSR 0x24af                       
  1a39  1702D1         LBSR 0x1d0d                       
  1a3c  17036A         LBSR 0x1da9                       
  1a3f  170403         LBSR 0x1e45                       
  1a42  3576           PULS  A B X Y U                   
  1a44  39             RTS                               
PTR_FUN_M72_r4_00000__1ac8_M72_r4_00000__1a45:
  1a45  1AC8           addr M72_r4_00000::1ac8           
  1a47  1A8F           addr M72_r4_00000::1a8f           
  1a49  .db 1A 83 70 30 70 32 00 00 70 34 00 08 00 59 00 00  ; ..p0p2..p4...Y..
  1a59  .db 00 01 F4 00 01 00 03 1E 1A B3 00 00 00 00 70 36  ; ..............p6
  1a69  .db 00 5B                                            ; .[

; ---- function FUN_M72_r4_00000__1a6b
FUN_M72_r4_00000__1a6b:
  1a6b  3410           PSHS  X                           
  1a6d  8E1A45         LDX #0x1a45                        ; desc[API_FE6A]: ->$1AC8 ->$1A8F
  1a70  AD9FFE6A       JSR [0xfe6a]                      
  1a74  3510           PULS  X                           
  1a76  39             RTS                               

; ---- function FUN_M72_r4_00000__1a77
FUN_M72_r4_00000__1a77:
  1a77  3410           PSHS  X                           
  1a79  8E1A45         LDX #0x1a45                        ; desc[API_FDBC]: ->$1AC8 ->$1A8F
  1a7c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...E"
  1a80  3510           PULS  X                           
  1a82  39             RTS                               

; ---- function FUN_M72_r4_00000__1a83
FUN_M72_r4_00000__1a83:
  1a83  3410           PSHS  X                           
  1a85  8E1A45         LDX #0x1a45                        ; desc[API_FE6C]: ->$1AC8 ->$1A8F
  1a88  AD9FFE6C       JSR [0xfe6c]                      
  1a8c  3510           PULS  X                           
  1a8e  39             RTS                               

; ---- function FUN_M72_r4_00000__1a8f
FUN_M72_r4_00000__1a8f:
  1a8f  3410           PSHS  X                           
  1a91  8E1A45         LDX #0x1a45                        ; desc[API_FE6E]: ->$1AC8 ->$1A8F
  1a94  AD9FFE6E       JSR [0xfe6e]                      
  1a98  3510           PULS  X                           
  1a9a  39             RTS                               

; ---- function FUN_M72_r4_00000__1a9b
FUN_M72_r4_00000__1a9b:
  1a9b  3410           PSHS  X                           
  1a9d  8E1A45         LDX #0x1a45                        ; desc[API_FE1C]: ->$1AC8 ->$1A8F
  1aa0  AD9FFE1C       JSR [0xfe1c]                      
  1aa4  3510           PULS  X                           
  1aa6  39             RTS                               

; ---- function FUN_M72_r4_00000__1aa7
FUN_M72_r4_00000__1aa7:
  1aa7  3410           PSHS  X                           
  1aa9  8E1A45         LDX #0x1a45                        ; desc[API_FE1A]: ->$1AC8 ->$1A8F $1A83
  1aac  AD9FFE1A       JSR [0xfe1a]                      
  1ab0  3510           PULS  X                           
  1ab2  39             RTS                               
  1ab3  .db 14 70 72 65 64 65 6C 61 79 3A 20 20 20 20 20 6D  ; .predelay:     m
  1ac3  .db 73 20 20 20 20                                   ; s    

; ---- function FUN_M72_r4_00000__1ac8
FUN_M72_r4_00000__1ac8:
  1ac8  3476           PSHS  U Y X B A                   
  1aca  8E1A45         LDX #0x1a45                       
  1acd  AD9FFE76       JSR [0xfe76]                      
  1ad1  FC7034         LDD 0x7034                        
  1ad4  3606           PSHU  B A                         
  1ad6  CC002C         LDD #0x2c                         
  1ad9  3606           PSHU  B A                         
  1adb  AD9FFCF0       JSR [0xfcf0]                      
  1adf  3706           PULU  A B                         
  1ae1  3706           PULU  A B                         
  1ae3  C30001         ADDD #0x1                         
  1ae6  FD7116         STD 0x7116                        
  1ae9  CC000A         LDD #0xa                          
  1aec  AD9FFD20       JSR [0xfd20]                      
  1af0  108E0451       LDY #0x451                        
  1af4  FC7116         LDD 0x7116                        
  1af7  AD9FFD2E       JSR [0xfd2e]                      
  1afb  3576           PULS  A B X Y U                   
  1afd  39             RTS                               
PTR_FUN_M72_r4_00000__1b81_M72_r4_00000__1afe:
  1afe  1B81           addr M72_r4_00000::1b81           
  1b00  1B48           addr M72_r4_00000::1b48           
  1b02  .db 1B 3C 70 20 70 22 00 00 70 24 00 08 00 51 01 00  ; .<p p"..p$...Q..
  1b12  .db 00 00 45 00 01 00 03 21 1B 6C 00 00 25 02 70 26  ; ..E....!.l..%.p&
  1b22  .db 00 53                                            ; .S

; ---- function FUN_M72_r4_00000__1b24
FUN_M72_r4_00000__1b24:
  1b24  3410           PSHS  X                           
  1b26  8E1AFE         LDX #0x1afe                       
  1b29  AD9FFC4E       JSR [0xfc4e]                      
  1b2d  3510           PULS  X                           
  1b2f  39             RTS                               

; ---- function FUN_M72_r4_00000__1b30
FUN_M72_r4_00000__1b30:
  1b30  3410           PSHS  X                           
  1b32  8E1AFE         LDX #0x1afe                        ; desc[API_FDBC]: ->$1B81 ->$1B48
  1b35  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1b39  3510           PULS  X                           
  1b3b  39             RTS                               

; ---- function FUN_M72_r4_00000__1b3c
FUN_M72_r4_00000__1b3c:
  1b3c  3410           PSHS  X                           
  1b3e  8E1AFE         LDX #0x1afe                        ; desc[API_FE6C]: ->$1B81 ->$1B48
  1b41  AD9FFE6C       JSR [0xfe6c]                      
  1b45  3510           PULS  X                           
  1b47  39             RTS                               

; ---- function FUN_M72_r4_00000__1b48
FUN_M72_r4_00000__1b48:
  1b48  3410           PSHS  X                           
  1b4a  8E1AFE         LDX #0x1afe                       
  1b4d  AD9FFC52       JSR [0xfc52]                      
  1b51  3510           PULS  X                           
  1b53  39             RTS                               

; ---- function FUN_M72_r4_00000__1b54
FUN_M72_r4_00000__1b54:
  1b54  3410           PSHS  X                           
  1b56  8E1AFE         LDX #0x1afe                        ; desc[API_FE1C]: ->$1B81 ->$1B48
  1b59  AD9FFE1C       JSR [0xfe1c]                      
  1b5d  3510           PULS  X                           
  1b5f  39             RTS                               

; ---- function FUN_M72_r4_00000__1b60
FUN_M72_r4_00000__1b60:
  1b60  3410           PSHS  X                           
  1b62  8E1AFE         LDX #0x1afe                        ; desc[API_FE1A]: ->$1B81 ->$1B48 $1B3C
  1b65  AD9FFE1A       JSR [0xfe1a]                      
  1b69  3510           PULS  X                           
  1b6b  39             RTS                               
  1b6c  .db 14 72 65 76 65 72 62 20 74 69 6D 65 3A 20 20 20  ; .reverb time:   
  1b7c  .db 20 20 73 65 63                                   ;   sec

; ---- function FUN_M72_r4_00000__1b81
FUN_M72_r4_00000__1b81:
  1b81  3476           PSHS  U Y X B A                   
  1b83  8E1AFE         LDX #0x1afe                       
  1b86  AD9FFE76       JSR [0xfe76]                      
  1b8a  170095         LBSR 0x1c22                       
  1b8d  3576           PULS  A B X Y U                   
  1b8f  39             RTS                               
PTR_FUN_M72_r4_00000__1c13_M72_r4_00000__1b90:
  1b90  1C13           addr M72_r4_00000::1c13           
  1b92  1BDA           addr M72_r4_00000::1bda           
  1b94  .db 1B CE 70 28 70 2A 00 00 70 2C 00 08 00 55 02 00  ; ..p(p*..p,...U..
  1ba4  .db 00 00 64 00 01 00 03 1E 1B FE 00 00 00 00 70 2E  ; ..d...........p.
  1bb4  .db 00 57                                            ; .W

; ---- function FUN_M72_r4_00000__1bb6
FUN_M72_r4_00000__1bb6:
  1bb6  3410           PSHS  X                           
  1bb8  8E1B90         LDX #0x1b90                        ; desc[API_FE6A]: ->$1C13 ->$1BDA
  1bbb  AD9FFE6A       JSR [0xfe6a]                      
  1bbf  3510           PULS  X                           
  1bc1  39             RTS                               

; ---- function FUN_M72_r4_00000__1bc2
FUN_M72_r4_00000__1bc2:
  1bc2  3410           PSHS  X                           
  1bc4  8E1B90         LDX #0x1b90                        ; desc[API_FDBC]: ->$1C13 ->$1BDA
  1bc7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1bcb  3510           PULS  X                           
  1bcd  39             RTS                               

; ---- function FUN_M72_r4_00000__1bce
FUN_M72_r4_00000__1bce:
  1bce  3410           PSHS  X                           
  1bd0  8E1B90         LDX #0x1b90                        ; desc[API_FE6C]: ->$1C13 ->$1BDA
  1bd3  AD9FFE6C       JSR [0xfe6c]                      
  1bd7  3510           PULS  X                           
  1bd9  39             RTS                               

; ---- function FUN_M72_r4_00000__1bda
FUN_M72_r4_00000__1bda:
  1bda  3410           PSHS  X                           
  1bdc  8E1B90         LDX #0x1b90                        ; desc[API_FE6E]: ->$1C13 ->$1BDA
  1bdf  AD9FFE6E       JSR [0xfe6e]                      
  1be3  3510           PULS  X                           
  1be5  39             RTS                               

; ---- function FUN_M72_r4_00000__1be6
FUN_M72_r4_00000__1be6:
  1be6  3410           PSHS  X                           
  1be8  8E1B90         LDX #0x1b90                        ; desc[API_FE1C]: ->$1C13 ->$1BDA
  1beb  AD9FFE1C       JSR [0xfe1c]                      
  1bef  3510           PULS  X                           
  1bf1  39             RTS                               

; ---- function FUN_M72_r4_00000__1bf2
FUN_M72_r4_00000__1bf2:
  1bf2  3410           PSHS  X                           
  1bf4  8E1B90         LDX #0x1b90                        ; desc[API_FE1A]: ->$1C13 ->$1BDA $1BCE
  1bf7  AD9FFE1A       JSR [0xfe1a]                      
  1bfb  3510           PULS  X                           
  1bfd  39             RTS                               
  1bfe  .db 14 68 69 67 68 20 63 75 74 3A 20 20 20 20 20 25  ; .high cut:     %
  1c0e  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__1c13
FUN_M72_r4_00000__1c13:
  1c13  3476           PSHS  U Y X B A                   
  1c15  8E1B90         LDX #0x1b90                       
  1c18  AD9FFE76       JSR [0xfe76]                      
  1c1c  170003         LBSR 0x1c22                       
  1c1f  3576           PULS  A B X Y U                   
  1c21  39             RTS                               

; ---- function FUN_M72_r4_00000__1c22
FUN_M72_r4_00000__1c22:
  1c22  3476           PSHS  U Y X B A                   
  1c24  FC702C         LDD 0x702c                        
  1c27  3606           PSHU  B A                         
  1c29  AD9FFEC4       JSR [0xfec4]                      
  1c2d  3706           PULU  A B                         
  1c2f  47             ASRA                              
  1c30  56             RORB                              
  1c31  FD7116         STD 0x7116                        
  1c34  FC7024         LDD 0x7024                        
  1c37  F37024         ADDD 0x7024                       
  1c3a  C325E3         ADDD #0x25e3                      
  1c3d  F3600D         ADDD 0x600d                       
  1c40  1F01           TFR D,X                           
  1c42  EC84           LDD ,X                            
  1c44  FD7118         STD 0x7118                        
  1c47  CC7FFF         LDD #0x7fff                       
  1c4a  B37116         SUBD 0x7116                       
  1c4d  3606           PSHU  B A                         
  1c4f  FC7118         LDD 0x7118                        
  1c52  3606           PSHU  B A                         
  1c54  AD9FFCF2       JSR [0xfcf2]                      
  1c58  3706           PULU  A B                         
  1c5a  FD710A         STD 0x710a                        
  1c5d  FC7116         LDD 0x7116                        
  1c60  FD7108         STD 0x7108                        
  1c63  CC000A         LDD #0xa                          
  1c66  AD9FFD20       JSR [0xfd20]                      
  1c6a  108E0340       LDY #0x340                        
  1c6e  FC7108         LDD 0x7108                        
  1c71  AD9FFD2E       JSR [0xfd2e]                      
  1c75  CC000A         LDD #0xa                          
  1c78  AD9FFD20       JSR [0xfd20]                      
  1c7c  108E0341       LDY #0x341                        
  1c80  FC710A         LDD 0x710a                        
  1c83  AD9FFD2E       JSR [0xfd2e]                      
  1c87  CC4E20         LDD #0x4e20                       
  1c8a  FD7116         STD 0x7116                        
  1c8d  CC000A         LDD #0xa                          
  1c90  AD9FFD20       JSR [0xfd20]                      
  1c94  108E024D       LDY #0x24d                        
  1c98  FC7116         LDD 0x7116                        
  1c9b  AD9FFD2E       JSR [0xfd2e]                      
  1c9f  3576           PULS  A B X Y U                   
  1ca1  39             RTS                               
PTR_FUN_M72_r4_00000__1d0d_M72_r4_00000__1ca2:
  1ca2  1D0D           addr M72_r4_00000::1d0d           
  1ca4  1CEC           addr M72_r4_00000::1cec           
  1ca6  .db 1C E0 70 7A 70 8A 00 00 70 90 00 08 00 79 13 00  ; ..pzp...p....y..
  1cb6  .db 00 13 88 00 01 00 04 1F 1C F8 00 00 00 00 00 00  ; ................
  1cc6  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__1cc8
FUN_M72_r4_00000__1cc8:
  1cc8  3410           PSHS  X                           
  1cca  8E1CA2         LDX #0x1ca2                        ; desc[API_FE6A]: ->$1D0D ->$1CEC
  1ccd  AD9FFE6A       JSR [0xfe6a]                      
  1cd1  3510           PULS  X                           
  1cd3  39             RTS                               

; ---- function FUN_M72_r4_00000__1cd4
FUN_M72_r4_00000__1cd4:
  1cd4  3410           PSHS  X                           
  1cd6  8E1CA2         LDX #0x1ca2                        ; desc[API_FDBC]: ->$1D0D ->$1CEC
  1cd9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1cdd  3510           PULS  X                           
  1cdf  39             RTS                               

; ---- function FUN_M72_r4_00000__1ce0
FUN_M72_r4_00000__1ce0:
  1ce0  3410           PSHS  X                           
  1ce2  8E1CA2         LDX #0x1ca2                        ; desc[API_FE6C]: ->$1D0D ->$1CEC
  1ce5  AD9FFE6C       JSR [0xfe6c]                      
  1ce9  3510           PULS  X                           
  1ceb  39             RTS                               

; ---- function FUN_M72_r4_00000__1cec
FUN_M72_r4_00000__1cec:
  1cec  3410           PSHS  X                           
  1cee  8E1CA2         LDX #0x1ca2                        ; desc[API_FE6E]: ->$1D0D ->$1CEC
  1cf1  AD9FFE6E       JSR [0xfe6e]                      
  1cf5  3510           PULS  X                           
  1cf7  39             RTS                               
  1cf8  .db 14 61 70 20 64 65 6C 61 79 31 3A 20 20 20 20 20  ; .ap delay1:     
  1d08  .db 20 73 61 6D 70                                   ;  samp

; ---- function FUN_M72_r4_00000__1d0d
FUN_M72_r4_00000__1d0d:
  1d0d  3476           PSHS  U Y X B A                   
  1d0f  8E1CA2         LDX #0x1ca2                       
  1d12  AD9FFE76       JSR [0xfe76]                      
  1d16  FC7090         LDD 0x7090                        
  1d19  3606           PSHU  B A                         
  1d1b  FC7088         LDD 0x7088                        
  1d1e  3606           PSHU  B A                         
  1d20  AD9FFCF2       JSR [0xfcf2]                      
  1d24  3706           PULU  A B                         
  1d26  FD7116         STD 0x7116                        
  1d29  CC000A         LDD #0xa                          
  1d2c  AD9FFD20       JSR [0xfd20]                      
  1d30  108E0452       LDY #0x452                        
  1d34  FC7116         LDD 0x7116                        
  1d37  AD9FFD2E       JSR [0xfd2e]                      
  1d3b  3576           PULS  A B X Y U                   
  1d3d  39             RTS                               
PTR_FUN_M72_r4_00000__1da9_M72_r4_00000__1d3e:
  1d3e  1DA9           addr M72_r4_00000::1da9           
  1d40  1D88           addr M72_r4_00000::1d88           
  1d42  .db 1D 7C 70 7C 70 8C 00 00 70 92 00 08 00 7B 14 00  ; .|p|p...p....{..
  1d52  .db 00 13 88 00 01 00 04 1F 1D 94 00 00 00 00 00 00  ; ................
  1d62  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__1d64
FUN_M72_r4_00000__1d64:
  1d64  3410           PSHS  X                           
  1d66  8E1D3E         LDX #0x1d3e                        ; desc[API_FE6A]: ->$1DA9 ->$1D88
  1d69  AD9FFE6A       JSR [0xfe6a]                      
  1d6d  3510           PULS  X                           
  1d6f  39             RTS                               

; ---- function FUN_M72_r4_00000__1d70
FUN_M72_r4_00000__1d70:
  1d70  3410           PSHS  X                           
  1d72  8E1D3E         LDX #0x1d3e                        ; desc[API_FDBC]: ->$1DA9 ->$1D88
  1d75  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...>"
  1d79  3510           PULS  X                           
  1d7b  39             RTS                               

; ---- function FUN_M72_r4_00000__1d7c
FUN_M72_r4_00000__1d7c:
  1d7c  3410           PSHS  X                           
  1d7e  8E1D3E         LDX #0x1d3e                        ; desc[API_FE6C]: ->$1DA9 ->$1D88
  1d81  AD9FFE6C       JSR [0xfe6c]                      
  1d85  3510           PULS  X                           
  1d87  39             RTS                               

; ---- function FUN_M72_r4_00000__1d88
FUN_M72_r4_00000__1d88:
  1d88  3410           PSHS  X                           
  1d8a  8E1D3E         LDX #0x1d3e                        ; desc[API_FE6E]: ->$1DA9 ->$1D88
  1d8d  AD9FFE6E       JSR [0xfe6e]                      
  1d91  3510           PULS  X                           
  1d93  39             RTS                               
  1d94  .db 14 61 70 20 64 65 6C 61 79 32 3A 20 20 20 20 20  ; .ap delay2:     
  1da4  .db 20 73 61 6D 70                                   ;  samp

; ---- function FUN_M72_r4_00000__1da9
FUN_M72_r4_00000__1da9:
  1da9  3476           PSHS  U Y X B A                   
  1dab  8E1D3E         LDX #0x1d3e                       
  1dae  AD9FFE76       JSR [0xfe76]                      
  1db2  FC7092         LDD 0x7092                        
  1db5  3606           PSHU  B A                         
  1db7  FC7088         LDD 0x7088                        
  1dba  3606           PSHU  B A                         
  1dbc  AD9FFCF2       JSR [0xfcf2]                      
  1dc0  3706           PULU  A B                         
  1dc2  FD7116         STD 0x7116                        
  1dc5  CC000A         LDD #0xa                          
  1dc8  AD9FFD20       JSR [0xfd20]                      
  1dcc  108E0453       LDY #0x453                        
  1dd0  FC7116         LDD 0x7116                        
  1dd3  AD9FFD2E       JSR [0xfd2e]                      
  1dd7  3576           PULS  A B X Y U                   
  1dd9  39             RTS                               
PTR_FUN_M72_r4_00000__1e45_M72_r4_00000__1dda:
  1dda  1E45           addr M72_r4_00000::1e45           
  1ddc  1E24           addr M72_r4_00000::1e24           
  1dde  .db 1E 18 70 7E 70 8E 00 00 70 94 00 08 00 7D 15 00  ; ..p~p...p....}..
  1dee  .db 00 13 88 00 01 00 04 1F 1E 30 00 00 00 00 00 00  ; .........0......
  1dfe  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__1e00
FUN_M72_r4_00000__1e00:
  1e00  3410           PSHS  X                           
  1e02  8E1DDA         LDX #0x1dda                        ; desc[API_FE6A]: ->$1E45 ->$1E24
  1e05  AD9FFE6A       JSR [0xfe6a]                      
  1e09  3510           PULS  X                           
  1e0b  39             RTS                               

; ---- function FUN_M72_r4_00000__1e0c
FUN_M72_r4_00000__1e0c:
  1e0c  3410           PSHS  X                           
  1e0e  8E1DDA         LDX #0x1dda                        ; desc[API_FDBC]: ->$1E45 ->$1E24
  1e11  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1e15  3510           PULS  X                           
  1e17  39             RTS                               

; ---- function FUN_M72_r4_00000__1e18
FUN_M72_r4_00000__1e18:
  1e18  3410           PSHS  X                           
  1e1a  8E1DDA         LDX #0x1dda                        ; desc[API_FE6C]: ->$1E45 ->$1E24
  1e1d  AD9FFE6C       JSR [0xfe6c]                      
  1e21  3510           PULS  X                           
  1e23  39             RTS                               

; ---- function FUN_M72_r4_00000__1e24
FUN_M72_r4_00000__1e24:
  1e24  3410           PSHS  X                           
  1e26  8E1DDA         LDX #0x1dda                        ; desc[API_FE6E]: ->$1E45 ->$1E24
  1e29  AD9FFE6E       JSR [0xfe6e]                      
  1e2d  3510           PULS  X                           
  1e2f  39             RTS                               
  1e30  .db 14 61 70 20 64 65 6C 61 79 33 3A 20 20 20 20 20  ; .ap delay3:     
  1e40  .db 20 73 61 6D 70                                   ;  samp

; ---- function FUN_M72_r4_00000__1e45
FUN_M72_r4_00000__1e45:
  1e45  3476           PSHS  U Y X B A                   
  1e47  8E1DDA         LDX #0x1dda                       
  1e4a  AD9FFE76       JSR [0xfe76]                      
  1e4e  FC7094         LDD 0x7094                        
  1e51  3606           PSHU  B A                         
  1e53  FC7088         LDD 0x7088                        
  1e56  3606           PSHU  B A                         
  1e58  AD9FFCF2       JSR [0xfcf2]                      
  1e5c  3706           PULU  A B                         
  1e5e  FD7116         STD 0x7116                        
  1e61  CC000A         LDD #0xa                          
  1e64  AD9FFD20       JSR [0xfd20]                      
  1e68  108E0454       LDY #0x454                        
  1e6c  FC7116         LDD 0x7116                        
  1e6f  AD9FFD2E       JSR [0xfd2e]                      
  1e73  3576           PULS  A B X Y U                   
  1e75  39             RTS                               
PTR_FUN_M72_r4_00000__1ee1_M72_r4_00000__1e76:
  1e76  1EE1           addr M72_r4_00000::1ee1           
  1e78  1EC0           addr M72_r4_00000::1ec0           
  1e7a  .db 1E B4 70 96 70 9C 00 00 70 A2 00 08 00 7F 16 FC  ; ..p.p...p.......
  1e8a  .db 18 03 E8 00 01 01 06 1F 1E CC 00 00 00 00 00 00  ; ................
  1e9a  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__1e9c
FUN_M72_r4_00000__1e9c:
  1e9c  3410           PSHS  X                           
  1e9e  8E1E76         LDX #0x1e76                        ; desc[API_FE6A]: ->$1EE1 ->$1EC0
  1ea1  AD9FFE6A       JSR [0xfe6a]                      
  1ea5  3510           PULS  X                           
  1ea7  39             RTS                               

; ---- function FUN_M72_r4_00000__1ea8
FUN_M72_r4_00000__1ea8:
  1ea8  3410           PSHS  X                           
  1eaa  8E1E76         LDX #0x1e76                        ; desc[API_FDBC]: ->$1EE1 ->$1EC0
  1ead  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...v"
  1eb1  3510           PULS  X                           
  1eb3  39             RTS                               

; ---- function FUN_M72_r4_00000__1eb4
FUN_M72_r4_00000__1eb4:
  1eb4  3410           PSHS  X                           
  1eb6  8E1E76         LDX #0x1e76                        ; desc[API_FE6C]: ->$1EE1 ->$1EC0
  1eb9  AD9FFE6C       JSR [0xfe6c]                      
  1ebd  3510           PULS  X                           
  1ebf  39             RTS                               

; ---- function FUN_M72_r4_00000__1ec0
FUN_M72_r4_00000__1ec0:
  1ec0  3410           PSHS  X                           
  1ec2  8E1E76         LDX #0x1e76                        ; desc[API_FE6E]: ->$1EE1 ->$1EC0
  1ec5  AD9FFE6E       JSR [0xfe6e]                      
  1ec9  3510           PULS  X                           
  1ecb  39             RTS                               
  1ecc  .db 14 61 70 20 67 61 69 6E 20 31 3A 20 20 20 20 20  ; .ap gain 1:     
  1edc  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M72_r4_00000__1ee1
FUN_M72_r4_00000__1ee1:
  1ee1  3476           PSHS  U Y X B A                   
  1ee3  8E1E76         LDX #0x1e76                       
  1ee6  AD9FFE76       JSR [0xfe76]                      
  1eea  FC70A2         LDD 0x70a2                        
  1eed  3606           PSHU  B A                         
  1eef  CC0020         LDD #0x20                         
  1ef2  3606           PSHU  B A                         
  1ef4  AD9FFCEC       JSR [0xfcec]                      
  1ef8  FC70A2         LDD 0x70a2                        
  1efb  3606           PSHU  B A                         
  1efd  CC622C         LDD #0x622c                       
  1f00  3606           PSHU  B A                         
  1f02  AD9FFCF2       JSR [0xfcf2]                      
  1f06  AD9FFCE2       JSR [0xfce2]                      
  1f0a  FC706C         LDD 0x706c                        
  1f0d  3606           PSHU  B A                         
  1f0f  AD9FFCF2       JSR [0xfcf2]                      
  1f13  3706           PULU  A B                         
  1f15  FD7116         STD 0x7116                        
  1f18  CC000A         LDD #0xa                          
  1f1b  AD9FFD20       JSR [0xfd20]                      
  1f1f  108E0455       LDY #0x455                        
  1f23  FC7116         LDD 0x7116                        
  1f26  AD9FFD2E       JSR [0xfd2e]                      
  1f2a  3576           PULS  A B X Y U                   
  1f2c  39             RTS                               
PTR_FUN_M72_r4_00000__1f98_M72_r4_00000__1f2d:
  1f2d  1F98           addr M72_r4_00000::1f98           
  1f2f  1F77           addr M72_r4_00000::1f77           
  1f31  .db 1F 6B 70 98 70 9E 00 00 70 A4 00 08 00 81 17 FC  ; .kp.p...p.......
  1f41  .db 18 03 E8 00 01 01 06 1F 1F 83 00 00 00 00 00 00  ; ................
  1f51  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__1f53
FUN_M72_r4_00000__1f53:
  1f53  3410           PSHS  X                           
  1f55  8E1F2D         LDX #0x1f2d                        ; desc[API_FE6A]: ->$1F98 ->$1F77
  1f58  AD9FFE6A       JSR [0xfe6a]                      
  1f5c  3510           PULS  X                           
  1f5e  39             RTS                               

; ---- function FUN_M72_r4_00000__1f5f
FUN_M72_r4_00000__1f5f:
  1f5f  3410           PSHS  X                           
  1f61  8E1F2D         LDX #0x1f2d                        ; desc[API_FDBC]: ->$1F98 ->$1F77
  1f64  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...-"
  1f68  3510           PULS  X                           
  1f6a  39             RTS                               

; ---- function FUN_M72_r4_00000__1f6b
FUN_M72_r4_00000__1f6b:
  1f6b  3410           PSHS  X                           
  1f6d  8E1F2D         LDX #0x1f2d                        ; desc[API_FE6C]: ->$1F98 ->$1F77
  1f70  AD9FFE6C       JSR [0xfe6c]                      
  1f74  3510           PULS  X                           
  1f76  39             RTS                               

; ---- function FUN_M72_r4_00000__1f77
FUN_M72_r4_00000__1f77:
  1f77  3410           PSHS  X                           
  1f79  8E1F2D         LDX #0x1f2d                        ; desc[API_FE6E]: ->$1F98 ->$1F77
  1f7c  AD9FFE6E       JSR [0xfe6e]                      
  1f80  3510           PULS  X                           
  1f82  39             RTS                               
  1f83  .db 14 61 70 20 67 61 69 6E 20 32 3A 20 20 20 20 20  ; .ap gain 2:     
  1f93  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M72_r4_00000__1f98
FUN_M72_r4_00000__1f98:
  1f98  3476           PSHS  U Y X B A                   
  1f9a  8E1F2D         LDX #0x1f2d                       
  1f9d  AD9FFE76       JSR [0xfe76]                      
  1fa1  FC70A4         LDD 0x70a4                        
  1fa4  3606           PSHU  B A                         
  1fa6  CC0020         LDD #0x20                         
  1fa9  3606           PSHU  B A                         
  1fab  AD9FFCEC       JSR [0xfcec]                      
  1faf  FC70A4         LDD 0x70a4                        
  1fb2  3606           PSHU  B A                         
  1fb4  CC622C         LDD #0x622c                       
  1fb7  3606           PSHU  B A                         
  1fb9  AD9FFCF2       JSR [0xfcf2]                      
  1fbd  AD9FFCE2       JSR [0xfce2]                      
  1fc1  FC706C         LDD 0x706c                        
  1fc4  3606           PSHU  B A                         
  1fc6  AD9FFCF2       JSR [0xfcf2]                      
  1fca  3706           PULU  A B                         
  1fcc  FD7116         STD 0x7116                        
  1fcf  CC000A         LDD #0xa                          
  1fd2  AD9FFD20       JSR [0xfd20]                      
  1fd6  108E0456       LDY #0x456                        
  1fda  FC7116         LDD 0x7116                        
  1fdd  AD9FFD2E       JSR [0xfd2e]                      
  1fe1  3576           PULS  A B X Y U                   
  1fe3  39             RTS                               
PTR_FUN_M72_r4_00000__204f_M72_r4_00000__1fe4:
  1fe4  204F           addr M72_r4_00000::204f           
  1fe6  202E           addr M72_r4_00000::202e           
  1fe8  .db 20 22 70 9A 70 A0 00 00 70 A6 00 08 00 83 18 FC  ;  "p.p...p.......
  1ff8  .db 18 03 E8 00 01 01 06 1F 20 3A 00 00 00 00 00 00  ; ........ :......
  2008  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__200a
FUN_M72_r4_00000__200a:
  200a  3410           PSHS  X                           
  200c  8E1FE4         LDX #0x1fe4                        ; desc[API_FE6A]: ->$204F ->$202E
  200f  AD9FFE6A       JSR [0xfe6a]                      
  2013  3510           PULS  X                           
  2015  39             RTS                               

; ---- function FUN_M72_r4_00000__2016
FUN_M72_r4_00000__2016:
  2016  3410           PSHS  X                           
  2018  8E1FE4         LDX #0x1fe4                        ; desc[API_FDBC]: ->$204F ->$202E
  201b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  201f  3510           PULS  X                           
  2021  39             RTS                               

; ---- function FUN_M72_r4_00000__2022
FUN_M72_r4_00000__2022:
  2022  3410           PSHS  X                           
  2024  8E1FE4         LDX #0x1fe4                        ; desc[API_FE6C]: ->$204F ->$202E
  2027  AD9FFE6C       JSR [0xfe6c]                      
  202b  3510           PULS  X                           
  202d  39             RTS                               

; ---- function FUN_M72_r4_00000__202e
FUN_M72_r4_00000__202e:
  202e  3410           PSHS  X                           
  2030  8E1FE4         LDX #0x1fe4                        ; desc[API_FE6E]: ->$204F ->$202E
  2033  AD9FFE6E       JSR [0xfe6e]                      
  2037  3510           PULS  X                           
  2039  39             RTS                               
  203a  .db 14 61 70 20 67 61 69 6E 20 33 3A 20 20 20 20 20  ; .ap gain 3:     
  204a  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M72_r4_00000__204f
FUN_M72_r4_00000__204f:
  204f  3476           PSHS  U Y X B A                   
  2051  8E1FE4         LDX #0x1fe4                       
  2054  AD9FFE76       JSR [0xfe76]                      
  2058  FC70A6         LDD 0x70a6                        
  205b  3606           PSHU  B A                         
  205d  CC0020         LDD #0x20                         
  2060  3606           PSHU  B A                         
  2062  AD9FFCEC       JSR [0xfcec]                      
  2066  FC70A6         LDD 0x70a6                        
  2069  3606           PSHU  B A                         
  206b  CC622C         LDD #0x622c                       
  206e  3606           PSHU  B A                         
  2070  AD9FFCF2       JSR [0xfcf2]                      
  2074  AD9FFCE2       JSR [0xfce2]                      
  2078  FC706C         LDD 0x706c                        
  207b  3606           PSHU  B A                         
  207d  AD9FFCF2       JSR [0xfcf2]                      
  2081  3706           PULU  A B                         
  2083  FD7116         STD 0x7116                        
  2086  CC000A         LDD #0xa                          
  2089  AD9FFD20       JSR [0xfd20]                      
  208d  108E0457       LDY #0x457                        
  2091  FC7116         LDD 0x7116                        
  2094  AD9FFD2E       JSR [0xfd2e]                      
  2098  3576           PULS  A B X Y U                   
  209a  39             RTS                               

; ---- function FUN_M72_r4_00000__209b
FUN_M72_r4_00000__209b:
  209b  3436           PSHS  Y X B A                     
  209d  CC0000         LDD #0x0                          
  20a0  2021           BRA 0x20c3                        

; ---- function FUN_M72_r4_00000__20a2
FUN_M72_r4_00000__20a2:
  20a2  3436           PSHS  Y X B A                     
  20a4  CC0001         LDD #0x1                          
  20a7  201A           BRA 0x20c3                        

; ---- function FUN_M72_r4_00000__20a9
FUN_M72_r4_00000__20a9:
  20a9  3436           PSHS  Y X B A                     
  20ab  CC0002         LDD #0x2                          
  20ae  2013           BRA 0x20c3                        

; ---- function FUN_M72_r4_00000__20b0
FUN_M72_r4_00000__20b0:
  20b0  3436           PSHS  Y X B A                     
  20b2  CC0003         LDD #0x3                          
  20b5  200C           BRA 0x20c3                        

; ---- function FUN_M72_r4_00000__20b7
FUN_M72_r4_00000__20b7:
  20b7  3436           PSHS  Y X B A                     
  20b9  CC0004         LDD #0x4                          
  20bc  2005           BRA 0x20c3                        

; ---- function FUN_M72_r4_00000__20be
FUN_M72_r4_00000__20be:
  20be  3436           PSHS  Y X B A                     
  20c0  CC0005         LDD #0x5                          
LAB_M72_r4_00000__20c3:
  20c3  1703C7         LBSR 0x248d                       
  20c6  FC60F9         LDD 0x60f9                        
  20c9  ED9F710C       STD [0x710c]                      
  20cd  FD6074         STD 0x6074                        
  20d0  10BE710E       LDY 0x710e                        
  20d4  AD9FFC80       JSR [0xfc80]                      
  20d8  FC7114         LDD 0x7114                        
  20db  860A           LDA #0xa                          
  20dd  3D             MUL                               
  20de  C320F1         ADDD #0x20f1                      
  20e1  F3600D         ADDD 0x600d                       
  20e4  1F01           TFR D,X                           
  20e6  AD84           JSR ,X                            
  20e8  1700C4         LBSR 0x21af                       
  20eb  1700D6         LBSR 0x21c4                       
  20ee  3536           PULS  A B X Y                     
  20f0  39             RTS                               

; ---- function FUN_M72_r4_00000__20f1
FUN_M72_r4_00000__20f1:
  20f1  3416           PSHS  X B A                       
  20f3  CC0000         LDD #0x0                          
  20f6  8E044B         LDX #0x44b                        
  20f9  2030           BRA 0x212b                        

; ---- function FUN_M72_r4_00000__20fb
FUN_M72_r4_00000__20fb:
  20fb  3416           PSHS  X B A                       
  20fd  CC0001         LDD #0x1                          
  2100  8E044C         LDX #0x44c                        
  2103  2026           BRA 0x212b                        

; ---- function FUN_M72_r4_00000__2105
FUN_M72_r4_00000__2105:
  2105  3416           PSHS  X B A                       
  2107  CC0002         LDD #0x2                          
  210a  8E044D         LDX #0x44d                        
  210d  201C           BRA 0x212b                        

; ---- function FUN_M72_r4_00000__210f
FUN_M72_r4_00000__210f:
  210f  3416           PSHS  X B A                       
  2111  CC0003         LDD #0x3                          
  2114  8E044E         LDX #0x44e                        
  2117  2012           BRA 0x212b                        

; ---- function FUN_M72_r4_00000__2119
FUN_M72_r4_00000__2119:
  2119  3416           PSHS  X B A                       
  211b  CC0004         LDD #0x4                          
  211e  8E044F         LDX #0x44f                        
  2121  2008           BRA 0x212b                        

; ---- function FUN_M72_r4_00000__2123
FUN_M72_r4_00000__2123:
  2123  3416           PSHS  X B A                       
  2125  CC0005         LDD #0x5                          
  2128  8E0450         LDX #0x450                        
LAB_M72_r4_00000__212b:
  212b  17035F         LBSR 0x248d                       
  212e  EC9F710C       LDD [0x710c]                      
  2132  FD6074         STD 0x6074                        
  2135  17E45E         LBSR 0x0596                       
  2138  C613           LDB #0x13                         
  213a  AD9FFC36       JSR [0xfc36]                      
  213e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay  :     samples"
  2142  0A64656C6179.. char[22] "\ndelay  :     samples" 
LAB_M72_r4_00000__2158:
  2158  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $1388 $0000 $0000 ->$21AF ->$2189 $0001 $0001 $0000
  215c  01             db 1h                             
  215d  01             db 1h                             
  215e  02             db 2h                             
  215f  01             db 1h                             
  2160  01             db 1h                             
  2161  00             db 0h                             
  2162  04             db 4h                             
  2163  80             db 80h                            
  2164  1388           dw 1388h                          
  2166  0000           dw 0h                             
  2168  0000           dw 0h                             
  216a  21AF           addr M72_r4_00000::21af           
  216c  2189           addr M72_r4_00000::2189           
  216e  0001           dw 1h                             
  2170  0001           dw 1h                             
  2172  0000           dw 0h                             
LAB_M72_r4_00000__2174:
  2174  170038         LBSR 0x21af                       
  2177  C61A           LDB #0x1a                         
  2179  AD9FFC36       JSR [0xfc36]                      
  217d  FC7114         LDD 0x7114                        
  2180  CB31           ADDB #0x31                        
  2182  AD9FFC2A       JSR [0xfc2a]                      
  2186  3516           PULS  A B X                       
  2188  39             RTS                               

; ---- function FUN_M72_r4_00000__2189
FUN_M72_r4_00000__2189:
  2189  3426           PSHS  Y B A                       
  218b  FC6074         LDD 0x6074                        
  218e  ED9F710C       STD [0x710c]                      
  2192  10BE710E       LDY 0x710e                        
  2196  AD9FFC82       JSR [0xfc82]                      
  219a  FC7114         LDD 0x7114                        
  219d  C3000D         ADDD #0xd                         
  21a0  1F02           TFR D,Y                           
  21a2  EC9F710C       LDD [0x710c]                      
  21a6  AD9FFE40       JSR [0xfe40]                      
  21aa  8D18           BSR 0x21c4                        
  21ac  3526           PULS  A B Y                       
  21ae  39             RTS                               

; ---- function FUN_M72_r4_00000__21af
FUN_M72_r4_00000__21af:
  21af  3456           PSHS  U X B A                     
  21b1  C61C           LDB #0x1c                         
  21b3  AD9FFC36       JSR [0xfc36]                      
  21b7  CC0004         LDD #0x4                          
  21ba  8E609F         LDX #0x609f                       
  21bd  AD9FFC3A       JSR [0xfc3a]                      
  21c1  3556           PULS  A B X U                     
  21c3  39             RTS                               

; ---- function FUN_M72_r4_00000__21c4
FUN_M72_r4_00000__21c4:
  21c4  3440           PSHS  U                           
  21c6  EC9F710C       LDD [0x710c]                      
  21ca  3606           PSHU  B A                         
  21cc  FC7088         LDD 0x7088                        
  21cf  3606           PSHU  B A                         
  21d1  AD9FFCF2       JSR [0xfcf2]                      
  21d5  3706           PULU  A B                         
  21d7  FD7116         STD 0x7116                        
  21da  CC000A         LDD #0xa                          
  21dd  AD9FFD20       JSR [0xfd20]                      
  21e1  10BE7112       LDY 0x7112                        
  21e5  FC7116         LDD 0x7116                        
  21e8  AD9FFD2E       JSR [0xfd2e]                      
  21ec  3540           PULS  U                           
  21ee  39             RTS                               
PTR_FUN_M72_r4_00000__2272_M72_r4_00000__21ef:
  21ef  2272           addr M72_r4_00000::2272           
  21f1  2239           addr M72_r4_00000::2239           
  21f3  .db 22 2D 70 00 70 02 00 00 70 04 00 08 00 4D 08 00  ; "-p.p...p....M..
  2203  .db 00 00 64 00 01 00 03 19 22 5D 00 00 00 00 70 06  ; ..d....."]....p.
  2213  .db 00 4F                                            ; .O

; ---- function FUN_M72_r4_00000__2215
FUN_M72_r4_00000__2215:
  2215  3410           PSHS  X                           
  2217  8E21EF         LDX #0x21ef                        ; desc[API_FE6A]: ->$2272 ->$2239
  221a  AD9FFE6A       JSR [0xfe6a]                      
  221e  3510           PULS  X                           
  2220  39             RTS                               

; ---- function FUN_M72_r4_00000__2221
FUN_M72_r4_00000__2221:
  2221  3410           PSHS  X                           
  2223  8E21EF         LDX #0x21ef                        ; desc[API_FDBC]: ->$2272 ->$2239
  2226  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..!."
  222a  3510           PULS  X                           
  222c  39             RTS                               

; ---- function FUN_M72_r4_00000__222d
FUN_M72_r4_00000__222d:
  222d  3410           PSHS  X                           
  222f  8E21EF         LDX #0x21ef                        ; desc[API_FE6C]: ->$2272 ->$2239
  2232  AD9FFE6C       JSR [0xfe6c]                      
  2236  3510           PULS  X                           
  2238  39             RTS                               

; ---- function FUN_M72_r4_00000__2239
FUN_M72_r4_00000__2239:
  2239  3410           PSHS  X                           
  223b  8E21EF         LDX #0x21ef                        ; desc[API_FE6E]: ->$2272 ->$2239
  223e  AD9FFE6E       JSR [0xfe6e]                      
  2242  3510           PULS  X                           
  2244  39             RTS                               

; ---- function FUN_M72_r4_00000__2245
FUN_M72_r4_00000__2245:
  2245  3410           PSHS  X                           
  2247  8E21EF         LDX #0x21ef                        ; desc[API_FE1C]: ->$2272 ->$2239
  224a  AD9FFE1C       JSR [0xfe1c]                      
  224e  3510           PULS  X                           
  2250  39             RTS                               

; ---- function FUN_M72_r4_00000__2251
FUN_M72_r4_00000__2251:
  2251  3410           PSHS  X                           
  2253  8E21EF         LDX #0x21ef                        ; desc[API_FE1A]: ->$2272 ->$2239 $222D
  2256  AD9FFE1A       JSR [0xfe1a]                      
  225a  3510           PULS  X                           
  225c  39             RTS                               
  225d  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  226d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__2272
FUN_M72_r4_00000__2272:
  2272  3476           PSHS  U Y X B A                   
  2274  8E21EF         LDX #0x21ef                       
  2277  AD9FFE76       JSR [0xfe76]                      
  227b  CC0064         LDD #0x64                         
  227e  B37004         SUBD 0x7004                       
  2281  3606           PSHU  B A                         
  2283  58             LSLB                              
  2284  49             ROLA                              
  2285  FD7116         STD 0x7116                        
  2288  CC4666         LDD #0x4666                       
  228b  3606           PSHU  B A                         
  228d  AD9FFCF2       JSR [0xfcf2]                      
  2291  3706           PULU  A B                         
  2293  F37116         ADDD 0x7116                       
  2296  AD9FFC6A       JSR [0xfc6a]                      
  229a  AD9FFC72       JSR [0xfc72]                      
  229e  3576           PULS  A B X Y U                   
  22a0  39             RTS                               
PTR_FUN_M72_r4_00000__230c_M72_r4_00000__22a1:
  22a1  230C           addr M72_r4_00000::230c           
  22a3  22EB           addr M72_r4_00000::22eb           
  22a5  .db 22 DF 70 08 70 0A 00 00 70 0C 00 08 00 21 09 FF  ; ".p.p...p....!..
  22b5  .db D0 00 30 00 01 00 03 1C 22 F7 00 00 00 00 00 00  ; ..0.....".......
  22c5  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__22c7
FUN_M72_r4_00000__22c7:
  22c7  3410           PSHS  X                           
  22c9  8E22A1         LDX #0x22a1                       
  22cc  AD9FFE74       JSR [0xfe74]                      
  22d0  3510           PULS  X                           
  22d2  39             RTS                               

; ---- function FUN_M72_r4_00000__22d3
FUN_M72_r4_00000__22d3:
  22d3  3410           PSHS  X                           
  22d5  8E22A1         LDX #0x22a1                        ; desc[API_FE22]: ->$230C ->$22EB
  22d8  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  22dc  3510           PULS  X                           
  22de  39             RTS                               

; ---- function FUN_M72_r4_00000__22df
FUN_M72_r4_00000__22df:
  22df  3410           PSHS  X                           
  22e1  8E22A1         LDX #0x22a1                       
  22e4  AD9FFE70       JSR [0xfe70]                      
  22e8  3510           PULS  X                           
  22ea  39             RTS                               

; ---- function FUN_M72_r4_00000__22eb
FUN_M72_r4_00000__22eb:
  22eb  3410           PSHS  X                           
  22ed  8E22A1         LDX #0x22a1                       
  22f0  AD9FFE72       JSR [0xfe72]                      
  22f4  3510           PULS  X                           
  22f6  39             RTS                               
  22f7  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  2307  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__230c
FUN_M72_r4_00000__230c:
  230c  3476           PSHS  U Y X B A                   
  230e  8E22A1         LDX #0x22a1                       
  2311  AD9FFE76       JSR [0xfe76]                      
  2315  AD9FFE52       JSR [0xfe52]                      
  2319  3576           PULS  A B X Y U                   
  231b  39             RTS                               
PTR_FUN_M72_r4_00000__2387_M72_r4_00000__231c:
  231c  2387           addr M72_r4_00000::2387           
  231e  2366           addr M72_r4_00000::2366           
  2320  .db 23 5A 70 0E 70 10 00 00 70 12 00 08 00 22 0A FF  ; #Zp.p...p...."..
  2330  .db D0 00 30 00 01 00 03 1D 23 72 00 00 00 00 00 00  ; ..0.....#r......
  2340  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__2342
FUN_M72_r4_00000__2342:
  2342  3410           PSHS  X                           
  2344  8E231C         LDX #0x231c                       
  2347  AD9FFE74       JSR [0xfe74]                      
  234b  3510           PULS  X                           
  234d  39             RTS                               

; ---- function FUN_M72_r4_00000__234e
FUN_M72_r4_00000__234e:
  234e  3410           PSHS  X                           
  2350  8E231C         LDX #0x231c                        ; desc[API_FE22]: ->$2387 ->$2366
  2353  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2357  3510           PULS  X                           
  2359  39             RTS                               

; ---- function FUN_M72_r4_00000__235a
FUN_M72_r4_00000__235a:
  235a  3410           PSHS  X                           
  235c  8E231C         LDX #0x231c                       
  235f  AD9FFE70       JSR [0xfe70]                      
  2363  3510           PULS  X                           
  2365  39             RTS                               

; ---- function FUN_M72_r4_00000__2366
FUN_M72_r4_00000__2366:
  2366  3410           PSHS  X                           
  2368  8E231C         LDX #0x231c                       
  236b  AD9FFE72       JSR [0xfe72]                      
  236f  3510           PULS  X                           
  2371  39             RTS                               
  2372  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  2382  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__2387
FUN_M72_r4_00000__2387:
  2387  3476           PSHS  U Y X B A                   
  2389  8E231C         LDX #0x231c                       
  238c  AD9FFE76       JSR [0xfe76]                      
  2390  AD9FFE54       JSR [0xfe54]                      
  2394  3576           PULS  A B X Y U                   
  2396  39             RTS                               
PTR_FUN_M72_r4_00000__2402_M72_r4_00000__2397:
  2397  2402           addr M72_r4_00000::2402           
  2399  23E1           addr M72_r4_00000::23e1           
  239b  .db 23 D5 70 14 70 16 00 00 70 18 00 08 00 23 0B FF  ; #.p.p...p....#..
  23ab  .db D0 00 30 00 01 00 03 1D 23 ED 00 00 00 00 00 00  ; ..0.....#.......
  23bb  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__23bd
FUN_M72_r4_00000__23bd:
  23bd  3410           PSHS  X                           
  23bf  8E2397         LDX #0x2397                       
  23c2  AD9FFE74       JSR [0xfe74]                      
  23c6  3510           PULS  X                           
  23c8  39             RTS                               

; ---- function FUN_M72_r4_00000__23c9
FUN_M72_r4_00000__23c9:
  23c9  3410           PSHS  X                           
  23cb  8E2397         LDX #0x2397                        ; desc[API_FE22]: ->$2402 ->$23E1
  23ce  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  23d2  3510           PULS  X                           
  23d4  39             RTS                               

; ---- function FUN_M72_r4_00000__23d5
FUN_M72_r4_00000__23d5:
  23d5  3410           PSHS  X                           
  23d7  8E2397         LDX #0x2397                       
  23da  AD9FFE70       JSR [0xfe70]                      
  23de  3510           PULS  X                           
  23e0  39             RTS                               

; ---- function FUN_M72_r4_00000__23e1
FUN_M72_r4_00000__23e1:
  23e1  3410           PSHS  X                           
  23e3  8E2397         LDX #0x2397                       
  23e6  AD9FFE72       JSR [0xfe72]                      
  23ea  3510           PULS  X                           
  23ec  39             RTS                               
  23ed  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  23fd  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M72_r4_00000__2402
FUN_M72_r4_00000__2402:
  2402  3476           PSHS  U Y X B A                   
  2404  8E2397         LDX #0x2397                       
  2407  AD9FFE76       JSR [0xfe76]                      
  240b  AD9FFE56       JSR [0xfe56]                      
  240f  3576           PULS  A B X Y U                   
  2411  39             RTS                               
PTR_FUN_M72_r4_00000__247d_M72_r4_00000__2412:
  2412  247D           addr M72_r4_00000::247d           
  2414  245C           addr M72_r4_00000::245c           
  2416  .db 24 50 70 1A 70 1C 00 00 70 1E 00 08 00 24 0C FF  ; $Pp.p...p....$..
  2426  .db D0 00 30 00 01 00 03 1E 24 68 00 00 00 00 00 00  ; ..0.....$h......
  2436  .db 00 00                                            ; ..

; ---- function FUN_M72_r4_00000__2438
FUN_M72_r4_00000__2438:
  2438  3410           PSHS  X                           
  243a  8E2412         LDX #0x2412                       
  243d  AD9FFE74       JSR [0xfe74]                      
  2441  3510           PULS  X                           
  2443  39             RTS                               

; ---- function FUN_M72_r4_00000__2444
FUN_M72_r4_00000__2444:
  2444  3410           PSHS  X                           
  2446  8E2412         LDX #0x2412                        ; desc[API_FE22]: ->$247D ->$245C
  2449  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  244d  3510           PULS  X                           
  244f  39             RTS                               

; ---- function FUN_M72_r4_00000__2450
FUN_M72_r4_00000__2450:
  2450  3410           PSHS  X                           
  2452  8E2412         LDX #0x2412                       
  2455  AD9FFE70       JSR [0xfe70]                      
  2459  3510           PULS  X                           
  245b  39             RTS                               

; ---- function FUN_M72_r4_00000__245c
FUN_M72_r4_00000__245c:
  245c  3410           PSHS  X                           
  245e  8E2412         LDX #0x2412                       
  2461  AD9FFE72       JSR [0xfe72]                      
  2465  3510           PULS  X                           
  2467  39             RTS                               
  2468  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  2478  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M72_r4_00000__247d
FUN_M72_r4_00000__247d:
  247d  3476           PSHS  U Y X B A                   
  247f  8E2412         LDX #0x2412                       
  2482  AD9FFE76       JSR [0xfe76]                      
  2486  AD9FFE58       JSR [0xfe58]                      
  248a  3576           PULS  A B X Y U                   
  248c  39             RTS                               

; ---- function FUN_M72_r4_00000__248d
FUN_M72_r4_00000__248d:
  248d  3406           PSHS  B A                         
  248f  FD7114         STD 0x7114                        
  2492  BF7112         STX 0x7112                        
  2495  FC7114         LDD 0x7114                        
  2498  58             LSLB                              
  2499  C3706E         ADDD #0x706e                      
  249c  FD710C         STD 0x710c                        
  249f  FC7114         LDD 0x7114                        
  24a2  58             LSLB                              
  24a3  C3006D         ADDD #0x6d                        
  24a6  830008         SUBD #0x8                         
  24a9  FD710E         STD 0x710e                        
  24ac  3506           PULS  A B                         
  24ae  39             RTS                               

; ---- function FUN_M72_r4_00000__24af
FUN_M72_r4_00000__24af:
  24af  3416           PSHS  X B A                       
  24b1  CC0000         LDD #0x0                          
  24b4  8E044B         LDX #0x44b                        
  24b7  170030         LBSR 0x24ea                       
  24ba  CC0001         LDD #0x1                          
  24bd  8E044C         LDX #0x44c                        
  24c0  170027         LBSR 0x24ea                       
  24c3  CC0002         LDD #0x2                          
  24c6  8E044D         LDX #0x44d                        
  24c9  17001E         LBSR 0x24ea                       
  24cc  CC0003         LDD #0x3                          
  24cf  8E044E         LDX #0x44e                        
  24d2  170015         LBSR 0x24ea                       
  24d5  CC0004         LDD #0x4                          
  24d8  8E044F         LDX #0x44f                        
  24db  17000C         LBSR 0x24ea                       
  24de  CC0005         LDD #0x5                          
  24e1  8E0450         LDX #0x450                        
  24e4  170003         LBSR 0x24ea                       
  24e7  3516           PULS  A B X                       
  24e9  39             RTS                               

; ---- function FUN_M72_r4_00000__24ea
FUN_M72_r4_00000__24ea:
  24ea  3406           PSHS  B A                         
  24ec  FD7114         STD 0x7114                        
  24ef  BF7112         STX 0x7112                        
  24f2  FC7114         LDD 0x7114                        
  24f5  58             LSLB                              
  24f6  C3706E         ADDD #0x706e                      
  24f9  FD710C         STD 0x710c                        
  24fc  17FCC5         LBSR 0x21c4                       
  24ff  3506           PULS  A B                         
  2501  39             RTS                               
  2502  .db 30 2E 31 30 2E 32 30 2E 33 30 2E 34 30 2E 35 30  ; 0.10.20.30.40.50
  2512  .db 2E 36 30 2E 37 30 2E 38 30 2E 39 31 2E 30 31 2E  ; .60.70.80.91.01.
  2522  .db 31 31 2E 32 31 2E 33 31 2E 34 31 2E 35 31 2E 36  ; 11.21.31.41.51.6
  2532  .db 31 2E 37 31 2E 38 31 2E 39 32 2E 30 32 2E 31 32  ; 1.71.81.92.02.12
  2542  .db 2E 32 32 2E 33 32 2E 34 32 2E 35 32 2E 36 32 2E  ; .22.32.42.52.62.
  2552  .db 37 32 2E 38 32 2E 39 33 2E 30 33 2E 32 33 2E 34  ; 72.82.93.03.23.4
  2562  .db 33 2E 36 33 2E 38 34 2E 30 34 2E 32 34 2E 34 34  ; 3.63.84.04.24.44
  2572  .db 2E 36 34 2E 38 35 2E 30 35 2E 35 36 2E 30 36 2E  ; .64.85.05.56.06.
  2582  .db 35 37 2E 30 37 2E 35 38 2E 30 38 2E 35 39 2E 30  ; 57.07.58.08.59.0
  2592  .db 39 2E 35 20 31 30 20 31 35 20 32 30 20 32 35 20  ; 9.5 10 15 20 25 
  25a2  .db 33 30 20 34 30 20 35 30 20 36 30 20 37 30 20 38  ; 30 40 50 60 70 8
  25b2  .db 30 20 39 30 31 30 30 32 30 30 33 30 30 34 30 30  ; 0 90100200300400
  25c2  .db 35 30 30 36 30 30 37 30 30 38 30 30 62 69 67 20  ; 500600700800big 
  25d2  .db F3 20 F3 2B 31 F3 2B 32 F3 2B 33 F3 2B 34 F3 2B  ; . .+1.+2.+3.+4.+
  25e2  .db 35 02 3E 10 72 1F F6 2C 8D 36 61 3E 1B 44 49 49  ; 5.>.r..,.6a>.DII
  25f2  .db 53 4D 7F 51 02 53 FF 56 92 58 D0 5A C7 5C 85 5E  ; SM.Q.S.V.X.Z.\.^
  2602  .db 11 5F 75 60 B5 61 D7 62 E0 63 D1 64 AF 65 7A 66  ; ._u`.a.b.c.d.ezf
  2612  .db 37 66 E5 67 87 68 1E 68 AB 69 2F 69 AA 6A 8C 6B  ; 7f.g.h.h.i/i.j.k
  2622  .db 55 6C 08 6C AA 6D 3B 6D C1 6E 3A 6E AA 6F 10 6F  ; Ul.l.m;m.n:n.o.o
  2632  .db 6E 70 3E 70 EC 71 81 72 00 72 6F 72 D0 73 27 73  ; np>p.q.r.ror.s's
  2642  .db 73 73 B9 73 F6 75 84 76 4C 76 C5 77 16 77 7B 77  ; ss.s.u.vLv.w.w{w
  2652  .db B8 77 E1 77 FE 78 14 78 25 78 33 78 70 78 84 78  ; .w.w.x.x%x3xpx.x
  2662  .db 8F 78 95 78 99 78 9C 78 9F 78 A6 78 AE 78 E6 79  ; .x.x.x.x.x.x.x.y
  2672  .db 4A 79 E0 7A 4D 7F FF                             ; Jy.zM..

;; TMS32010 program 72 for DSP 1: 175 words loaded at $800 (written via bank latch $81)
DSPPROG_72_DSP1_hdr:
  2679  721001680000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_72_DSP1:
  2681  08006E007F8B.. dw[176]                           

;; TMS32010 program 72 for DSP 2: 180 words loaded at $800 (written via bank latch $82)
DSPPROG_72_DSP2_hdr:
  27e1  721101720000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_72_DSP2:
  27e9  08006E007F8B.. dw[181]                           

;; TMS32010 program 72 for DSP 3: 174 words loaded at $800 (written via bank latch $83)
DSPPROG_72_DSP3_hdr:
  2953  721201660000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_72_DSP3:
  295b  08006E007F8B.. dw[175]                           

;; End of record chain
END_OF_CHAIN_hdr:
  2ab9  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  2ac1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ad1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ae1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2af1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ba1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2be1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bf1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ca1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ce1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cf1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2da1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2db1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2de1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2df1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ea1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2eb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ec1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ed1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ee1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ef1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fa1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fe1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ff1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3001  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3011  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3021  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3031  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3041  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3051  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3061  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3071  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3081  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3091  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3101  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3111  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3121  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3131  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3141  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3151  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3161  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3171  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3181  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3191  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3201  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3211  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3221  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3231  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3241  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3251  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3261  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3271  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3281  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3291  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3301  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3311  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3321  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3331  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3341  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3351  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3361  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3371  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3381  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3391  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3401  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3411  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3421  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3431  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3441  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3451  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3461  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3471  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3481  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3491  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3501  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3511  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3521  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3531  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3541  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3551  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3561  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3571  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3581  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3591  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3601  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3611  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3621  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3631  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3641  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3651  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3661  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3671  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3681  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3691  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3701  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3711  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3721  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3731  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3741  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3751  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3761  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3771  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3781  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3791  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3801  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3811  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3821  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3831  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3841  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3851  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3861  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3871  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3881  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3891  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3901  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3911  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3921  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3931  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3941  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3951  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3961  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3971  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3981  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3991  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39a1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39b1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39c1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39d1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39e1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39f1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aa1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ab1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ac1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ad1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ae1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3af1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ba1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3be1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bf1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ca1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ce1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cf1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3da1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3db1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3de1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3df1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ea1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ec1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ed1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ee1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f01  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f11  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f21  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f31  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f41  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f51  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f61  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f71  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f81  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f91  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF     ; ...............
