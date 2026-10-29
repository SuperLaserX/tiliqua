; H3500  block M65_r2_08000  M65_r2_08000::0000-M65_r2_08000::3fff
; Bank r2_08000 (module id 65, sub 02)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 65 code record 02, 13365 bytes, entered at payload start
MODULE_65_02_CODE_hdr:
  0008  6502343D0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_65_02_entry
MODULE_65_02_entry:
  0010  3476           PSHS  U Y X B A                   
  0012  1A40           ORCC #0x40                        
  0014  CC002F         LDD #0x2f                         
  0017  F3600D         ADDD 0x600d                       
  001a  1F01           TFR D,X                           
  001c  CC005E         LDD #0x5e                         
  001f  F3600D         ADDD 0x600d                       
  0022  1F03           TFR D,U                           
  0024  108E6600       LDY #0x6600                       
  0028  AD9FFD08       JSR [0xfd08]                      
  002c  3576           PULS  A B X Y U                   
  002e  39             RTS                               

; ---- function FUN_M65_r2_08000__002f
FUN_M65_r2_08000__002f:
  002f  3436           PSHS  Y X B A                     
  0031  3401           PSHS  CC                          
  0033  AD9FFC54       JSR [0xfc54]                      
  0037  FC710A         LDD 0x710a                        
  003a  2615           BNE 0x0051                        
  003c  CC005E         LDD #0x5e                         
  003f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  0043  6013           addr 6013                         
LAB_M65_r2_08000__0045:
  0045  AD9FFC56       JSR [0xfc56]                      
  0049  3501           PULS CC                           
  004b  3536           PULS  A B X Y                     
  004d  3261           LEAS 0x1,S                        
  004f  3580           PULS  PC                          
LAB_M65_r2_08000__0051:
  0051  AD9FFD76       JSR [0xfd76]                      
  0055  AD9FFC56       JSR [0xfc56]                      
  0059  3501           PULS CC                           
  005b  3536           PULS  A B X Y                     
  005d  3B             RTI                               

; ---- function FUN_M65_r2_08000__005e
FUN_M65_r2_08000__005e:
  005e  3436           PSHS  Y X B A                     
  0060  CC000A         LDD #0xa                          
  0063  AD9FFD20       JSR [0xfd20]                      
  0067  108E0428       LDY #0x428                        
  006b  FC7120         LDD 0x7120                        
  006e  AD9FFD2E       JSR [0xfd2e]                      
  0072  CC000A         LDD #0xa                          
  0075  AD9FFD20       JSR [0xfd20]                      
  0079  108E0429       LDY #0x429                        
  007d  FC7122         LDD 0x7122                        
  0080  AD9FFD2E       JSR [0xfd2e]                      
  0084  CC000A         LDD #0xa                          
  0087  AD9FFD20       JSR [0xfd20]                      
  008b  108E042A       LDY #0x42a                        
  008f  FC7124         LDD 0x7124                        
  0092  AD9FFD2E       JSR [0xfd2e]                      
  0096  CC000A         LDD #0xa                          
  0099  AD9FFD20       JSR [0xfd20]                      
  009d  108E042B       LDY #0x42b                        
  00a1  FC7126         LDD 0x7126                        
  00a4  AD9FFD2E       JSR [0xfd2e]                      
  00a8  CC000A         LDD #0xa                          
  00ab  AD9FFD20       JSR [0xfd20]                      
  00af  108E042C       LDY #0x42c                        
  00b3  FC7128         LDD 0x7128                        
  00b6  AD9FFD2E       JSR [0xfd2e]                      
  00ba  CC000A         LDD #0xa                          
  00bd  AD9FFD20       JSR [0xfd20]                      
  00c1  108E0426       LDY #0x426                        
  00c5  FC713C         LDD 0x713c                        
  00c8  AD9FFD2E       JSR [0xfd2e]                      
  00cc  CC000A         LDD #0xa                          
  00cf  AD9FFD20       JSR [0xfd20]                      
  00d3  108E0421       LDY #0x421                        
  00d7  FC712E         LDD 0x712e                        
  00da  AD9FFD2E       JSR [0xfd2e]                      
  00de  CC000A         LDD #0xa                          
  00e1  AD9FFD20       JSR [0xfd20]                      
  00e5  108E0422       LDY #0x422                        
  00e9  FC7130         LDD 0x7130                        
  00ec  AD9FFD2E       JSR [0xfd2e]                      
  00f0  CC000A         LDD #0xa                          
  00f3  AD9FFD20       JSR [0xfd20]                      
  00f7  108E0423       LDY #0x423                        
  00fb  FC7136         LDD 0x7136                        
  00fe  AD9FFD2E       JSR [0xfd2e]                      
  0102  CC000A         LDD #0xa                          
  0105  AD9FFD20       JSR [0xfd20]                      
  0109  108E0424       LDY #0x424                        
  010d  FC7138         LDD 0x7138                        
  0110  AD9FFD2E       JSR [0xfd2e]                      
  0114  CC000A         LDD #0xa                          
  0117  AD9FFD20       JSR [0xfd20]                      
  011b  108E0420       LDY #0x420                        
  011f  FC713A         LDD 0x713a                        
  0122  AD9FFD2E       JSR [0xfd2e]                      
  0126  CC000A         LDD #0xa                          
  0129  AD9FFD20       JSR [0xfd20]                      
  012d  108E042D       LDY #0x42d                        
  0131  FC70C4         LDD 0x70c4                        
  0134  AD9FFD2E       JSR [0xfd2e]                      
  0138  FC7154         LDD 0x7154                        
  013b  10830000       CMPD #0x0                         
  013f  10270026       LBEQ 0x0169                       
  0143  CC000A         LDD #0xa                          
  0146  AD9FFD20       JSR [0xfd20]                      
  014a  108E0425       LDY #0x425                        
  014e  FC711E         LDD 0x711e                        
  0151  AD9FFD2E       JSR [0xfd2e]                      
  0155  CC000A         LDD #0xa                          
  0158  AD9FFD20       JSR [0xfd20]                      
  015c  108E0427       LDY #0x427                        
  0160  FC70C6         LDD 0x70c6                        
  0163  AD9FFD2E       JSR [0xfd2e]                      
  0167  2024           BRA 0x018d                        
LAB_M65_r2_08000__0169:
  0169  CC000A         LDD #0xa                          
  016c  AD9FFD20       JSR [0xfd20]                      
  0170  108E0425       LDY #0x425                        
  0174  FC7132         LDD 0x7132                        
  0177  AD9FFD2E       JSR [0xfd2e]                      
  017b  CC000A         LDD #0xa                          
  017e  AD9FFD20       JSR [0xfd20]                      
  0182  108E0427       LDY #0x427                        
  0186  FC7134         LDD 0x7134                        
  0189  AD9FFD2E       JSR [0xfd2e]                      
LAB_M65_r2_08000__018d:
  018d  CC0F0C         LDD #0xf0c                        
  0190  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  0194  6013           addr 6013                         
LAB_M65_r2_08000__0196:
  0196  CCFFFF         LDD #0xffff                       
  0199  FD710A         STD 0x710a                        
  019c  AD9FFD76       JSR [0xfd76]                      
  01a0  1CBF           ANDCC #0xbf                       
  01a2  3536           PULS  A B X Y                     
  01a4  39             RTS                               

; ---- function FUN_M65_r2_08000__01a5
FUN_M65_r2_08000__01a5:
  01a5  3476           PSHS  U Y X B A                   
  01a7  CC0000         LDD #0x0                          
  01aa  FD7048         STD 0x7048                        
  01ad  FD7050         STD 0x7050                        
  01b0  FD7058         STD 0x7058                        
  01b3  FD7060         STD 0x7060                        
  01b6  FD7068         STD 0x7068                        
  01b9  FD7070         STD 0x7070                        
  01bc  FD7078         STD 0x7078                        
  01bf  FD7098         STD 0x7098                        
  01c2  FD70A0         STD 0x70a0                        
  01c5  FD70A8         STD 0x70a8                        
  01c8  FD70B0         STD 0x70b0                        
  01cb  FD70B8         STD 0x70b8                        
  01ce  FD7080         STD 0x7080                        
  01d1  FD7086         STD 0x7086                        
  01d4  FD708C         STD 0x708c                        
  01d7  FD7092         STD 0x7092                        
  01da  3576           PULS  A B X Y U                   
  01dc  39             RTS                               

; ---- function FUN_M65_r2_08000__01dd
FUN_M65_r2_08000__01dd:
  01dd  3476           PSHS  U Y X B A                   
  01df  CC0000         LDD #0x0                          
  01e2  FD7008         STD 0x7008                        
  01e5  CC0064         LDD #0x64                         
  01e8  FD70C4         STD 0x70c4                        
  01eb  CCFFFF         LDD #0xffff                       
  01ee  FD70F4         STD 0x70f4                        
  01f1  CCFFFF         LDD #0xffff                       
  01f4  FD70CA         STD 0x70ca                        
  01f7  CC0003         LDD #0x3                          
  01fa  .db FD 71                                            ; .q

; ---- function FUN_M65_r2_08000__01fc
FUN_M65_r2_08000__01fc:
  01fc  34CC           PSHS  PC U DP B                   
  01fe  079C           ASR <0x9c                         
  0200  FD7144         STD 0x7144                        
  0203  CC78D0         LDD #0x78d0                       
  0206  FD7146         STD 0x7146                        
  0209  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:7E 1A:84 1B:8A 1C:90
  020d  19             db 19h                            
  020e  7E             db 7Eh                            
  020f  1A             db 1Ah                            
  0210  84             db 84h                            
  0211  1B             db 1Bh                            
  0212  8A             db 8Ah                            
  0213  1C             db 1Ch                            
  0214  90             db 90h                            
  0215  00             db 0h                             
LAB_M65_r2_08000__0216:
  0216  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 45:46 47:4C 31:4E 33:54 49:56 4B:5C 35:5E 37:64 49:AE 35:B6 4B:B4 59:06
  021a  45             db 45h                            
  021b  46             db 46h                            
  021c  47             db 47h                            
  021d  4C             db 4Ch                            
  021e  31             db 31h                            
  021f  4E             db 4Eh                            
  0220  33             db 33h                            
  0221  54             db 54h                            
  0222  49             db 49h                            
  0223  56             db 56h                            
  0224  4B             db 4Bh                            
  0225  5C             db 5Ch                            
  0226  35             db 35h                            
  0227  5E             db 5Eh                            
  0228  37             db 37h                            
  0229  64             db 64h                            
  022a  49             db 49h                            
  022b  AE             db AEh                            
  022c  35             db 35h                            
  022d  B6             db B6h                            
  022e  4B             db 4Bh                            
  022f  B4             db B4h                            
  0230  59             db 59h                            
  0231  06             db 6h                             
  0232  00             db 0h                             
LAB_M65_r2_08000__0233:
  0233  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 51:6E 53:74 3D:76 3F:7C 4D:9E 4F:A4 39:A6 3B:AC 3D:66 3F:6C 39:96 3B:9C 37:BC
  0237  51             db 51h                            
  0238  6E             db 6Eh                            
  0239  53             db 53h                            
  023a  74             db 74h                            
  023b  3D             db 3Dh                            
  023c  76             db 76h                            
  023d  3F             db 3Fh                            
  023e  7C             db 7Ch                            
  023f  4D             db 4Dh                            
  0240  9E             db 9Eh                            
  0241  4F             db 4Fh                            
  0242  A4             db A4h                            
  0243  39             db 39h                            
  0244  A6             db A6h                            
  0245  3B             db 3Bh                            
  0246  AC             db ACh                            
  0247  3D             db 3Dh                            
  0248  66             db 66h                            
  0249  3F             db 3Fh                            
  024a  6C             db 6Ch                            
  024b  39             db 39h                            
  024c  96             db 96h                            
  024d  3B             db 3Bh                            
  024e  9C             db 9Ch                            
  024f  37             db 37h                            
  0250  BC             db BCh                            
  0251  00             db 0h                             
LAB_M65_r2_08000__0252:
  0252  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 5B:16 5D:18 5F:1A 61:1C 63:1E 65:20 67:22 69:24 6B:26 6D:28 6F:2A 71:2C
  0256  5B             db 5Bh                            
  0257  16             db 16h                            
  0258  5D             db 5Dh                            
  0259  18             db 18h                            
  025a  5F             db 5Fh                            
  025b  1A             db 1Ah                            
  025c  61             db 61h                            
  025d  1C             db 1Ch                            
  025e  63             db 63h                            
  025f  1E             db 1Eh                            
  0260  65             db 65h                            
  0261  20             db 20h                            
  0262  67             db 67h                            
  0263  22             db 22h                            
  0264  69             db 69h                            
  0265  24             db 24h                            
  0266  6B             db 6Bh                            
  0267  26             db 26h                            
  0268  6D             db 6Dh                            
  0269  28             db 28h                            
  026a  6F             db 6Fh                            
  026b  2A             db 2Ah                            
  026c  71             db 71h                            
  026d  2C             db 2Ch                            
  026e  00             db 0h                             
LAB_M65_r2_08000__026f:
  026f  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 73:2E 75:30 77:32 79:34 7B:36 7D:38 7F:3A 81:3C 83:3E 85:40 87:42 89:44
  0273  73             db 73h                            
  0274  2E             db 2Eh                            
  0275  75             db 75h                            
  0276  30             db 30h                            
  0277  77             db 77h                            
  0278  32             db 32h                            
  0279  79             db 79h                            
  027a  34             db 34h                            
  027b  7B             db 7Bh                            
  027c  36             db 36h                            
  027d  7D             db 7Dh                            
  027e  38             db 38h                            
  027f  7F             db 7Fh                            
  0280  3A             db 3Ah                            
  0281  81             db 81h                            
  0282  3C             db 3Ch                            
  0283  83             db 83h                            
  0284  3E             db 3Eh                            
  0285  85             db 85h                            
  0286  40             db 40h                            
  0287  87             db 87h                            
  0288  42             db 42h                            
  0289  89             db 89h                            
  028a  44             db 44h                            
  028b  00             db 0h                             
LAB_M65_r2_08000__028c:
  028c  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 41:BE 42:C0 43:C8 44:C2 31:00 32:02 33:04 8B:CC
  0290  41             db 41h                            
  0291  BE             db BEh                            
  0292  42             db 42h                            
  0293  C0             db C0h                            
  0294  43             db 43h                            
  0295  C8             db C8h                            
  0296  44             db 44h                            
  0297  C2             db C2h                            
  0298  31             db 31h                            
  0299  00             db 0h                             
  029a  32             db 32h                            
  029b  02             db 2h                             
  029c  33             db 33h                            
  029d  04             db 4h                             
  029e  8B             db 8Bh                            
  029f  CC             db CCh                            
  02a0  00             db 0h                             
LAB_M65_r2_08000__02a1:
  02a1  3576           PULS  A B X Y U                   
  02a3  39             RTS                               

; ---- function FUN_M65_r2_08000__02a4
FUN_M65_r2_08000__02a4:
  02a4  3476           PSHS  U Y X B A                   
  02a6  1724A8         LBSR 0x2751                       
  02a9  172520         LBSR 0x27cc                       
  02ac  172598         LBSR 0x2847                       
  02af  172610         LBSR 0x28c2                       
  02b2  172358         LBSR 0x260d                       
  02b5  172403         LBSR 0x26bb                       
  02b8  17214A         LBSR 0x2405                       
  02bb  1721F2         LBSR 0x24b0                       
  02be  3576           PULS  A B X Y U                   
  02c0  39             RTS                               

; ---- function FUN_M65_r2_08000__02c1
FUN_M65_r2_08000__02c1:
  02c1  3476           PSHS  U Y X B A                   
  02c3  1700D9         LBSR 0x039f                       
  02c6  C603           LDB #0x3                          
  02c8  8E0312         LDX #0x312                        
  02cb  AD9FFD30       JSR [0xfd30]                      
  02cf  1026075C       LBNE 0x0a2f                       
  02d3  1700F5         LBSR 0x03cb                       
  02d6  3576           PULS  A B X Y U                   
  02d8  39             RTS                               

; ---- function FUN_M65_r2_08000__02d9
FUN_M65_r2_08000__02d9:
  02d9  3476           PSHS  U Y X B A                   
  02db  1700C1         LBSR 0x039f                       
  02de  C603           LDB #0x3                          
  02e0  8E0412         LDX #0x412                        
  02e3  AD9FFD30       JSR [0xfd30]                      
  02e7  10260744       LBNE 0x0a2f                       
  02eb  1700DD         LBSR 0x03cb                       
  02ee  3576           PULS  A B X Y U                   
  02f0  39             RTS                               

; ---- function FUN_M65_r2_08000__02f1
FUN_M65_r2_08000__02f1:
  02f1  3476           PSHS  U Y X B A                   
  02f3  1700A9         LBSR 0x039f                       
  02f6  C603           LDB #0x3                          
  02f8  8E0412         LDX #0x412                        
  02fb  AD9FFD30       JSR [0xfd30]                      
  02ff  1026072C       LBNE 0x0a2f                       
  0303  1700C5         LBSR 0x03cb                       
  0306  3576           PULS  A B X Y U                   
  0308  39             RTS                               

; ---- function FUN_M65_r2_08000__0309
FUN_M65_r2_08000__0309:
  0309  3476           PSHS  U Y X B A                   
  030b  C601           LDB #0x1                          
  030d  8E0410         LDX #0x410                        
  0310  AD9FFD30       JSR [0xfd30]                      
  0314  10260717       LBNE 0x0a2f                       
  0318  C602           LDB #0x2                          
  031a  8E0411         LDX #0x411                        
  031d  AD9FFD30       JSR [0xfd30]                      
  0321  1026070A       LBNE 0x0a2f                       
  0325  C603           LDB #0x3                          
  0327  8E0812         LDX #0x812                        
  032a  AD9FFD30       JSR [0xfd30]                      
  032e  102606FD       LBNE 0x0a2f                       
  0332  AD9FFD76       JSR [0xfd76]                      
  0336  1CBF           ANDCC #0xbf                       
  0338  AD9FFD7C       JSR [0xfd7c]                      
  033c  CC000A         LDD #0xa                          
  033f  AD9FFD20       JSR [0xfd20]                      
  0343  108E0343       LDY #0x343                        
  0347  FC7154         LDD 0x7154                        
  034a  AD9FFD2E       JSR [0xfd2e]                      
  034e  CC000A         LDD #0xa                          
  0351  AD9FFD20       JSR [0xfd20]                      
  0355  108E0344       LDY #0x344                        
  0359  FC714E         LDD 0x714e                        
  035c  AD9FFD2E       JSR [0xfd2e]                      
  0360  CC000A         LDD #0xa                          
  0363  AD9FFD20       JSR [0xfd20]                      
  0367  108E0345       LDY #0x345                        
  036b  FC714A         LDD 0x714a                        
  036e  AD9FFD2E       JSR [0xfd2e]                      
  0372  CC000A         LDD #0xa                          
  0375  AD9FFD20       JSR [0xfd20]                      
  0379  108E0346       LDY #0x346                        
  037d  FC7150         LDD 0x7150                        
  0380  AD9FFD2E       JSR [0xfd2e]                      
  0384  3576           PULS  A B X Y U                   
  0386  39             RTS                               

; ---- function FUN_M65_r2_08000__0387
FUN_M65_r2_08000__0387:
  0387  3476           PSHS  U Y X B A                   
  0389  170013         LBSR 0x039f                       
  038c  C603           LDB #0x3                          
  038e  8E0212         LDX #0x212                        
  0391  AD9FFD30       JSR [0xfd30]                      
  0395  10260696       LBNE 0x0a2f                       
  0399  17002F         LBSR 0x03cb                       
  039c  3576           PULS  A B X Y U                   
  039e  39             RTS                               

; ---- function FUN_M65_r2_08000__039f
FUN_M65_r2_08000__039f:
  039f  3476           PSHS  U Y X B A                   
  03a1  C601           LDB #0x1                          
  03a3  8E0410         LDX #0x410                        
  03a6  AD9FFD30       JSR [0xfd30]                      
  03aa  10260681       LBNE 0x0a2f                       
  03ae  C602           LDB #0x2                          
  03b0  8E0411         LDX #0x411                        
  03b3  AD9FFD30       JSR [0xfd30]                      
  03b7  10260674       LBNE 0x0a2f                       
  03bb  C603           LDB #0x3                          
  03bd  8E0012         LDX #0x12                         
  03c0  AD9FFD30       JSR [0xfd30]                      
  03c4  10260667       LBNE 0x0a2f                       
  03c8  3576           PULS  A B X Y U                   
  03ca  39             RTS                               

; ---- function FUN_M65_r2_08000__03cb
FUN_M65_r2_08000__03cb:
  03cb  3476           PSHS  U Y X B A                   
  03cd  172602         LBSR 0x29d2                       
  03d0  1726C7         LBSR 0x2a9a                       
  03d3  1728DD         LBSR 0x2cb3                       
  03d6  AD9FFD76       JSR [0xfd76]                      
  03da  1CBF           ANDCC #0xbf                       
  03dc  AD9FFD7C       JSR [0xfd7c]                      
  03e0  CC000A         LDD #0xa                          
  03e3  AD9FFD20       JSR [0xfd20]                      
  03e7  108E0343       LDY #0x343                        
  03eb  FC7154         LDD 0x7154                        
  03ee  AD9FFD2E       JSR [0xfd2e]                      
  03f2  CC000A         LDD #0xa                          
  03f5  AD9FFD20       JSR [0xfd20]                      
  03f9  108E0344       LDY #0x344                        
  03fd  FC714E         LDD 0x714e                        
  0400  AD9FFD2E       JSR [0xfd2e]                      
  0404  CC000A         LDD #0xa                          
  0407  AD9FFD20       JSR [0xfd20]                      
  040b  108E0345       LDY #0x345                        
  040f  FC714A         LDD 0x714a                        
  0412  AD9FFD2E       JSR [0xfd2e]                      
  0416  CC000A         LDD #0xa                          
  0419  AD9FFD20       JSR [0xfd20]                      
  041d  108E0346       LDY #0x346                        
  0421  FC7150         LDD 0x7150                        
  0424  AD9FFD2E       JSR [0xfd2e]                      
  0428  3576           PULS  A B X Y U                   
  042a  39             RTS                               

; ---- function FUN_M65_r2_08000__042b
FUN_M65_r2_08000__042b:
  042b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l pitch " 21 $11C6 $11D2
  042f  00             db 0h                             
  0430  80             db 80h                            
  0431  6C2070697463.. ds "l pitch "                     
  0439  21             db 21h                            
  043a  11C6           addr M65_r2_08000::11c6           
  043c  11D2           addr M65_r2_08000::11d2           
LAB_M65_r2_08000__043e:
  043e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r pitch " 25 $12B5 $12C1
  0442  01             db 1h                             
  0443  80             db 80h                            
  0444  722070697463.. ds "r pitch "                     
  044c  25             db 25h                            
  044d  12B5           addr M65_r2_08000::12b5           
  044f  12C1           addr M65_r2_08000::12c1           
LAB_M65_r2_08000__0451:
  0451  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l delay " 29 $13AD $13B9
  0455  02             db 2h                             
  0456  80             db 80h                            
  0457  6C2064656C61.. ds "l delay "                     
  045f  29             db 29h                            
  0460  13AD           addr M65_r2_08000::13ad           
  0462  13B9           addr M65_r2_08000::13b9           
LAB_M65_r2_08000__0464:
  0464  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r delay " 2D $14AC $14B8
  0468  03             db 3h                             
  0469  80             db 80h                            
  046a  722064656C61.. ds "r delay "                     
  0472  2D             db 2Dh                            
  0473  14AC           addr M65_r2_08000::14ac           
  0475  14B8           addr M65_r2_08000::14b8           
LAB_M65_r2_08000__0477:
  0477  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "left mix" 55 $25E0 $25EC
  047b  04             db 4h                             
  047c  80             db 80h                            
  047d  6C656674206D.. ds "left mix"                     
  0485  55             db 55h                            
  0486  25E0           addr M65_r2_08000::25e0           
  0488  25EC           addr M65_r2_08000::25ec           
LAB_M65_r2_08000__048a:
  048a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "rightmix" 59 $268E $269A
  048e  05             db 5h                             
  048f  80             db 80h                            
  0490  72696768746D.. ds "rightmix"                     
  0498  59             db 59h                            
  0499  268E           addr M65_r2_08000::268e           
  049b  269A           addr M65_r2_08000::269a           
LAB_M65_r2_08000__049d:
  049d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "l fdback" 5D $23D8 $23E4
  04a1  06             db 6h                             
  04a2  80             db 80h                            
  04a3  6C2066646261.. ds "l fdback"                     
  04ab  5D             db 5Dh                            
  04ac  23D8           addr M65_r2_08000::23d8           
  04ae  23E4           addr M65_r2_08000::23e4           
LAB_M65_r2_08000__04b0:
  04b0  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "r fdback" 61 $2483 $248F
  04b4  07             db 7h                             
  04b5  80             db 80h                            
  04b6  722066646261.. ds "r fdback"                     
  04be  61             db 61h                            
  04bf  2483           addr M65_r2_08000::2483           
  04c1  248F           addr M65_r2_08000::248f           
LAB_M65_r2_08000__04c3:
  04c3  CC04D8         LDD #0x4d8                        
  04c6  FD60F5         STD 0x60f5                        
  04c9  CC0050         LDD #0x50                         
  04cc  47             ASRA                              
  04cd  56             RORB                              
  04ce  FD60F7         STD 0x60f7                        
  04d1  CC0AD7         LDD #0xad7                        
  04d4  FD7164         STD 0x7164                        
  04d7  39             RTS                               
  04d8  05280533053E.. addr[41]                          
  052a  .db 91 17 05 A9 AD 9F FE 10 39                       ; ........9

; ---- function FUN_M65_r2_08000__0533
FUN_M65_r2_08000__0533:
  0533  172134         LBSR 0x266a                       
  0536  17059E         LBSR 0x0ad7                       
  0539  AD9FFE12       JSR [0xfe12]                      
  053d  39             RTS                               

; ---- function FUN_M65_r2_08000__053e
FUN_M65_r2_08000__053e:
  053e  171E73         LBSR 0x23b4                       
  0541  170521         LBSR 0x0a65                       
  0544  AD9FFE16       JSR [0xfe16]                      
  0548  39             RTS                               

; ---- function FUN_M65_r2_08000__0549
FUN_M65_r2_08000__0549:
  0549  171F13         LBSR 0x245f                       
  054c  17054F         LBSR 0x0a9e                       
  054f  AD9FFE16       JSR [0xfe16]                      
  0553  39             RTS                               

; ---- function FUN_M65_r2_08000__0554
FUN_M65_r2_08000__0554:
  0554  170C4B         LBSR 0x11a2                       
  0557  17050B         LBSR 0x0a65                       
  055a  AD9FFE12       JSR [0xfe12]                      
  055e  39             RTS                               

; ---- function FUN_M65_r2_08000__055f
FUN_M65_r2_08000__055f:
  055f  170E27         LBSR 0x1389                       
  0562  170500         LBSR 0x0a65                       
  0565  AD9FFE14       JSR [0xfe14]                      
  0569  39             RTS                               

; ---- function FUN_M65_r2_08000__056a
FUN_M65_r2_08000__056a:
  056a  170D24         LBSR 0x1291                       
  056d  17052E         LBSR 0x0a9e                       
  0570  AD9FFE12       JSR [0xfe12]                      
  0574  39             RTS                               

; ---- function FUN_M65_r2_08000__0575
FUN_M65_r2_08000__0575:
  0575  170F10         LBSR 0x1488                       
  0578  170523         LBSR 0x0a9e                       
  057b  AD9FFE14       JSR [0xfe14]                      
  057f  39             RTS                               

; ---- function FUN_M65_r2_08000__0580
FUN_M65_r2_08000__0580:
  0580  172453         LBSR 0x29d6                       
  0583  1705B6         LBSR 0x0b3c                       
  0586  AD9FFE10       JSR [0xfe10]                      
  058a  39             RTS                               

; ---- function FUN_M65_r2_08000__058b
FUN_M65_r2_08000__058b:
  058b  172344         LBSR 0x28d2                       
  058e  1705AB         LBSR 0x0b3c                       
  0591  AD9FFE12       JSR [0xfe12]                      
  0595  39             RTS                               

; ---- function FUN_M65_r2_08000__0596
FUN_M65_r2_08000__0596:
  0596  172636         LBSR 0x2bcf                       
  0599  1705A0         LBSR 0x0b3c                       
  059c  AD9FFE14       JSR [0xfe14]                      
  05a0  39             RTS                               

; ---- function FUN_M65_r2_08000__05a1
FUN_M65_r2_08000__05a1:
  05a1  170969         LBSR 0x0f0d                       
  05a4  17098F         LBSR 0x0f36                       
  05a7  17052D         LBSR 0x0ad7                       
  05aa  AD9FFDEC       JSR [0xfdec]                      
  05ae  39             RTS                               

; ---- function FUN_M65_r2_08000__05af
FUN_M65_r2_08000__05af:
  05af  172166         LBSR 0x2718                       
  05b2  1708E1         LBSR 0x0e96                       
  05b5  AD9FFE10       JSR [0xfe10]                      
  05b9  39             RTS                               

; ---- function FUN_M65_r2_08000__05ba
FUN_M65_r2_08000__05ba:
  05ba  1721D6         LBSR 0x2793                       
  05bd  1708D6         LBSR 0x0e96                       
  05c0  AD9FFE12       JSR [0xfe12]                      
  05c4  39             RTS                               

; ---- function FUN_M65_r2_08000__05c5
FUN_M65_r2_08000__05c5:
  05c5  172246         LBSR 0x280e                       
  05c8  170906         LBSR 0x0ed1                       
  05cb  AD9FFE10       JSR [0xfe10]                      
  05cf  39             RTS                               

; ---- function FUN_M65_r2_08000__05d0
FUN_M65_r2_08000__05d0:
  05d0  1722B6         LBSR 0x2889                       
  05d3  1708FB         LBSR 0x0ed1                       
  05d6  AD9FFE12       JSR [0xfe12]                      
  05da  39             RTS                               

; ---- function FUN_M65_r2_08000__05db
FUN_M65_r2_08000__05db:
  05db  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " pitch  " 21 $12B5 $12C1
  05df  00             db 0h                             
  05e0  80             db 80h                            
  05e1  207069746368.. ds " pitch  "                     
  05e9  21             db 21h                            
  05ea  12B5           addr M65_r2_08000::12b5           
  05ec  12C1           addr M65_r2_08000::12c1           
LAB_M65_r2_08000__05ee:
  05ee  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " delay  " 25 $14AC $14B8
  05f2  01             db 1h                             
  05f3  80             db 80h                            
  05f4  2064656C6179.. ds " delay  "                     
  05fc  25             db 25h                            
  05fd  14AC           addr M65_r2_08000::14ac           
  05ff  14B8           addr M65_r2_08000::14b8           
LAB_M65_r2_08000__0601:
  0601  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "  mix   " 29 $252E $253A
  0605  02             db 2h                             
  0606  80             db 80h                            
  0607  20206D697820.. ds "  mix   "                     
  060f  29             db 29h                            
  0610  252E           addr M65_r2_08000::252e           
  0612  253A           addr M65_r2_08000::253a           
LAB_M65_r2_08000__0614:
  0614  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "feedback" 2D $2329 $2335
  0618  03             db 3h                             
  0619  80             db 80h                            
  061a  666565646261.. ds "feedback"                     
  0622  2D             db 2Dh                            
  0623  2329           addr M65_r2_08000::2329           
  0625  2335           addr M65_r2_08000::2335           
LAB_M65_r2_08000__0627:
  0627  CC063C         LDD #0x63c                        
  062a  FD60F5         STD 0x60f5                        
  062d  CC0050         LDD #0x50                         
  0630  47             ASRA                              
  0631  56             RORB                              
  0632  FD60F7         STD 0x60f7                        
  0635  CC0BB7         LDD #0xbb7                        
  0638  FD7164         STD 0x7164                        
  063b  39             RTS                               
  063c  .db 06 8C 06 97 06 A2 06 A3 06 A4 06 A5 06 A6 06 B1  ; ................
  064c  .db 06 BC 06 C7 06 D2 06 DD 0F 0C 0F 0C 0F 0C 0F 0C  ; ................
  065c  .db 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C  ; ................
  066c  .db 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C 0F 0C  ; ................
  067c  .db 0F 0C 0F 0C 0F 0C 0F 0C 06 E8 06 F3 06 FE 07 09  ; ................
  068c  .db 17 1E 7B 17 05 25 AD 9F FE 10 39 17 1C 6B 17 04  ; ..{..%....9..k..
  069c  .db E1 AD 9F FE 16 39 39 39 39 39 17 0B E8 17 04 D2  ; .....99999......
  06ac  .db AD 9F FE 12 39 17 0D D4 17 04 C7 AD 9F FE 14 39  ; ....9..........9
  06bc  .db 17 23 17 17 05 2D AD 9F FE 10                    ; .#...-....
DAT_M65_r2_08000__06c6:
  06c6  39             undefined1 39h                    
  06c7  .db 17 22 08 17 05 22 AD 9F FE 12 39 17 24 FA 17 05  ; ."..."....9.$...
  06d7  .db 17 AD 9F FE 14 39 17 23 E1 17 05 4E AD 9F FE 10  ; .....9.#...N....
  06e7  .db 39 17 20 2D 17 07 A8 AD 9F FE 10 39 17 20 9D 17  ; 9. -.......9. ..
  06f7  .db 07 9D AD 9F FE 12 39 17 21 0D 17 07 CD AD 9F FE  ; ......9.!.......
  0707  .db 10 39 17 21 7D 17 07 C2 AD 9F FE 12 39           ; .9.!}.......9

; ---- function FUN_M65_r2_08000__0714
FUN_M65_r2_08000__0714:
  0714  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l pitch " 21 $11C6 $11D2
  0718  00             db 0h                             
  0719  80             db 80h                            
  071a  6C2070697463.. ds "l pitch "                     
  0722  21             db 21h                            
  0723  11C6           addr M65_r2_08000::11c6           
  0725  11D2           addr M65_r2_08000::11d2           
LAB_M65_r2_08000__0727:
  0727  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r pitch " 25 $12B5 $12C1
  072b  01             db 1h                             
  072c  80             db 80h                            
  072d  722070697463.. ds "r pitch "                     
  0735  25             db 25h                            
  0736  12B5           addr M65_r2_08000::12b5           
  0738  12C1           addr M65_r2_08000::12c1           
LAB_M65_r2_08000__073a:
  073a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l length" 29 $15E5 $15F1
  073e  02             db 2h                             
  073f  80             db 80h                            
  0740  6C206C656E67.. ds "l length"                     
  0748  29             db 29h                            
  0749  15E5           addr M65_r2_08000::15e5           
  074b  15F1           addr M65_r2_08000::15f1           
LAB_M65_r2_08000__074d:
  074d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r length" 2D $16EA $16F6
  0751  03             db 3h                             
  0752  80             db 80h                            
  0753  72206C656E67.. ds "r length"                     
  075b  2D             db 2Dh                            
  075c  16EA           addr M65_r2_08000::16ea           
  075e  16F6           addr M65_r2_08000::16f6           
LAB_M65_r2_08000__0760:
  0760  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "left mix" 55 $25E0 $25EC
  0764  04             db 4h                             
  0765  80             db 80h                            
  0766  6C656674206D.. ds "left mix"                     
  076e  55             db 55h                            
  076f  25E0           addr M65_r2_08000::25e0           
  0771  25EC           addr M65_r2_08000::25ec           
LAB_M65_r2_08000__0773:
  0773  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "rightmix" 59 $268E $269A
  0777  05             db 5h                             
  0778  80             db 80h                            
  0779  72696768746D.. ds "rightmix"                     
  0781  59             db 59h                            
  0782  268E           addr M65_r2_08000::268e           
  0784  269A           addr M65_r2_08000::269a           
LAB_M65_r2_08000__0786:
  0786  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "l fdback" 5D $23D8 $23E4
  078a  06             db 6h                             
  078b  80             db 80h                            
  078c  6C2066646261.. ds "l fdback"                     
  0794  5D             db 5Dh                            
  0795  23D8           addr M65_r2_08000::23d8           
  0797  23E4           addr M65_r2_08000::23e4           
LAB_M65_r2_08000__0799:
  0799  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "r fdback" 61 $2483 $248F
  079d  07             db 7h                             
  079e  80             db 80h                            
  079f  722066646261.. ds "r fdback"                     
  07a7  61             db 61h                            
  07a8  2483           addr M65_r2_08000::2483           
  07aa  248F           addr M65_r2_08000::248f           
LAB_M65_r2_08000__07ac:
  07ac  CC07BB         LDD #0x7bb                        
  07af  FD60F5         STD 0x60f5                        
  07b2  CC0050         LDD #0x50                         
  07b5  47             ASRA                              
  07b6  56             RORB                              
  07b7  FD60F7         STD 0x60f7                        
  07ba  39             RTS                               
  07bb  080B08160821.. addr[40]                          

; ---- function FUN_M65_r2_08000__080b
FUN_M65_r2_08000__080b:
  080b  171DAE         LBSR 0x25bc                       
  080e  1704C6         LBSR 0x0cd7                       
  0811  AD9FFE10       JSR [0xfe10]                      
  0815  39             RTS                               

; ---- function FUN_M65_r2_08000__0816
FUN_M65_r2_08000__0816:
  0816  171E51         LBSR 0x266a                       
  0819  1704BB         LBSR 0x0cd7                       
  081c  AD9FFE12       JSR [0xfe12]                      
  0820  39             RTS                               

; ---- function FUN_M65_r2_08000__0821
FUN_M65_r2_08000__0821:
  0821  171B90         LBSR 0x23b4                       
  0824  17043E         LBSR 0x0c65                       
  0827  AD9FFE16       JSR [0xfe16]                      
  082b  39             RTS                               

; ---- function FUN_M65_r2_08000__082c
FUN_M65_r2_08000__082c:
  082c  171C30         LBSR 0x245f                       
  082f  17046C         LBSR 0x0c9e                       
  0832  AD9FFE16       JSR [0xfe16]                      
  0836  39             RTS                               

; ---- function FUN_M65_r2_08000__0837
FUN_M65_r2_08000__0837:
  0837  170968         LBSR 0x11a2                       
  083a  170428         LBSR 0x0c65                       
  083d  AD9FFE12       JSR [0xfe12]                      
  0841  39             RTS                               

; ---- function FUN_M65_r2_08000__0842
FUN_M65_r2_08000__0842:
  0842  170D7C         LBSR 0x15c1                       
  0845  17041D         LBSR 0x0c65                       
  0848  AD9FFE14       JSR [0xfe14]                      
  084c  39             RTS                               

; ---- function FUN_M65_r2_08000__084d
FUN_M65_r2_08000__084d:
  084d  170A41         LBSR 0x1291                       
  0850  17044B         LBSR 0x0c9e                       
  0853  AD9FFE12       JSR [0xfe12]                      
  0857  39             RTS                               

; ---- function FUN_M65_r2_08000__0858
FUN_M65_r2_08000__0858:
  0858  170E6B         LBSR 0x16c6                       
  085b  170440         LBSR 0x0c9e                       
  085e  AD9FFE14       JSR [0xfe14]                      
  0862  39             RTS                               

; ---- function FUN_M65_r2_08000__0863
FUN_M65_r2_08000__0863:
  0863  1706A7         LBSR 0x0f0d                       
  0866  1706CD         LBSR 0x0f36                       
  0869  17046B         LBSR 0x0cd7                       
  086c  AD9FFDEC       JSR [0xfdec]                      
  0870  39             RTS                               

; ---- function FUN_M65_r2_08000__0871
FUN_M65_r2_08000__0871:
  0871  171EA4         LBSR 0x2718                       
  0874  17061F         LBSR 0x0e96                       
  0877  AD9FFE10       JSR [0xfe10]                      
  087b  39             RTS                               

; ---- function FUN_M65_r2_08000__087c
FUN_M65_r2_08000__087c:
  087c  171F14         LBSR 0x2793                       
  087f  170614         LBSR 0x0e96                       
  0882  AD9FFE12       JSR [0xfe12]                      
  0886  39             RTS                               

; ---- function FUN_M65_r2_08000__0887
FUN_M65_r2_08000__0887:
  0887  171F84         LBSR 0x280e                       
  088a  170644         LBSR 0x0ed1                       
  088d  AD9FFE10       JSR [0xfe10]                      
  0891  39             RTS                               

; ---- function FUN_M65_r2_08000__0892
FUN_M65_r2_08000__0892:
  0892  171FF4         LBSR 0x2889                       
  0895  170639         LBSR 0x0ed1                       
  0898  AD9FFE12       JSR [0xfe12]                      
  089c  39             RTS                               

; ---- function FUN_M65_r2_08000__089d
FUN_M65_r2_08000__089d:
  089d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " delay  " 21 $14AC $14B8
  08a1  00             db 0h                             
  08a2  80             db 80h                            
  08a3  2064656C6179.. ds " delay  "                     
  08ab  21             db 21h                            
  08ac  14AC           addr M65_r2_08000::14ac           
  08ae  14B8           addr M65_r2_08000::14b8           
LAB_M65_r2_08000__08b0:
  08b0  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "left mix" 25 $25E0 $25EC
  08b4  01             db 1h                             
  08b5  80             db 80h                            
  08b6  6C656674206D.. ds "left mix"                     
  08be  25             db 25h                            
  08bf  25E0           addr M65_r2_08000::25e0           
  08c1  25EC           addr M65_r2_08000::25ec           
LAB_M65_r2_08000__08c3:
  08c3  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "rightmix" 29 $268E $269A
  08c7  02             db 2h                             
  08c8  80             db 80h                            
  08c9  72696768746D.. ds "rightmix"                     
  08d1  29             db 29h                            
  08d2  268E           addr M65_r2_08000::268e           
  08d4  269A           addr M65_r2_08000::269a           
LAB_M65_r2_08000__08d6:
  08d6  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "l fdback" 2D $23D8 $23E4
  08da  03             db 3h                             
  08db  80             db 80h                            
  08dc  6C2066646261.. ds "l fdback"                     
  08e4  2D             db 2Dh                            
  08e5  23D8           addr M65_r2_08000::23d8           
  08e7  23E4           addr M65_r2_08000::23e4           
LAB_M65_r2_08000__08e9:
  08e9  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "r fdback" 55 $2483 $248F
  08ed  04             db 4h                             
  08ee  80             db 80h                            
  08ef  722066646261.. ds "r fdback"                     
  08f7  55             db 55h                            
  08f8  2483           addr M65_r2_08000::2483           
  08fa  248F           addr M65_r2_08000::248f           
LAB_M65_r2_08000__08fc:
  08fc  CC0911         LDD #0x911                        
  08ff  FD60F5         STD 0x60f5                        
  0902  CC0050         LDD #0x50                         
  0905  47             ASRA                              
  0906  56             RORB                              
  0907  FD60F7         STD 0x60f7                        
  090a  CC0D80         LDD #0xd80                        
  090d  FD7164         STD 0x7164                        
  0910  39             RTS                               
  0911  0961096C0977.. addr[41]                          
  0963  .db 58 17 03 E0 AD 9F FE 10 39                       ; X.......9

; ---- function FUN_M65_r2_08000__096c
FUN_M65_r2_08000__096c:
  096c  171CFB         LBSR 0x266a                       
  096f  1703D5         LBSR 0x0d47                       
  0972  AD9FFE12       JSR [0xfe12]                      
  0976  39             RTS                               

; ---- function FUN_M65_r2_08000__0977
FUN_M65_r2_08000__0977:
  0977  171A3A         LBSR 0x23b4                       
  097a  1703CA         LBSR 0x0d47                       
  097d  AD9FFE14       JSR [0xfe14]                      
  0981  39             RTS                               

; ---- function FUN_M65_r2_08000__0982
FUN_M65_r2_08000__0982:
  0982  171ADA         LBSR 0x245f                       
  0985  1703BF         LBSR 0x0d47                       
  0988  AD9FFE16       JSR [0xfe16]                      
  098c  39             RTS                               

; ---- function FUN_M65_r2_08000__098d
FUN_M65_r2_08000__098d:
  098d  170E09         LBSR 0x1799                       
  0990  17037F         LBSR 0x0d12                       
  0993  AD9FFE16       JSR [0xfe16]                      
  0997  39             RTS                               

; ---- function FUN_M65_r2_08000__0998
FUN_M65_r2_08000__0998:
  0998  17104F         LBSR 0x19ea                       
  099b  170374         LBSR 0x0d12                       
  099e  AD9FFE10       JSR [0xfe10]                      
  09a2  39             RTS                               

; ---- function FUN_M65_r2_08000__09a3
FUN_M65_r2_08000__09a3:
  09a3  17112F         LBSR 0x1ad5                       
  09a6  170369         LBSR 0x0d12                       
  09a9  AD9FFE12       JSR [0xfe12]                      
  09ad  39             RTS                               

; ---- function FUN_M65_r2_08000__09ae
FUN_M65_r2_08000__09ae:
  09ae  170AD7         LBSR 0x1488                       
  09b1  1703CC         LBSR 0x0d80                       
  09b4  AD9FFE14       JSR [0xfe14]                      
  09b8  39             RTS                               

; ---- function FUN_M65_r2_08000__09b9
FUN_M65_r2_08000__09b9:
  09b9  17201A         LBSR 0x29d6                       
  09bc  17042A         LBSR 0x0de9                       
  09bf  AD9FFE14       JSR [0xfe14]                      
  09c3  39             RTS                               

; ---- function FUN_M65_r2_08000__09c4
FUN_M65_r2_08000__09c4:
  09c4  171F0B         LBSR 0x28d2                       
  09c7  17041F         LBSR 0x0de9                       
  09ca  AD9FFE16       JSR [0xfe16]                      
  09ce  39             RTS                               

; ---- function FUN_M65_r2_08000__09cf
FUN_M65_r2_08000__09cf:
  09cf  1721FD         LBSR 0x2bcf                       
  09d2  17044D         LBSR 0x0e22                       
  09d5  AD9FFE10       JSR [0xfe10]                      
  09d9  39             RTS                               

; ---- function FUN_M65_r2_08000__09da
FUN_M65_r2_08000__09da:
  09da  170479         LBSR 0x0e56                       
  09dd  170F28         LBSR 0x1908                       
  09e0  AD9FFE12       JSR [0xfe12]                      
  09e4  39             RTS                               

; ---- function FUN_M65_r2_08000__09e5
FUN_M65_r2_08000__09e5:
  09e5  170476         LBSR 0x0e5e                       
  09e8  170F1D         LBSR 0x1908                       
  09eb  AD9FFE12       JSR [0xfe12]                      
  09ef  39             RTS                               

; ---- function FUN_M65_r2_08000__09f0
FUN_M65_r2_08000__09f0:
  09f0  170643         LBSR 0x1036                       
  09f3  170678         LBSR 0x106e                       
  09f6  170319         LBSR 0x0d12                       
  09f9  AD9FFDEC       JSR [0xfdec]                      
  09fd  39             RTS                               

; ---- function FUN_M65_r2_08000__09fe
FUN_M65_r2_08000__09fe:
  09fe  171D17         LBSR 0x2718                       
  0a01  170492         LBSR 0x0e96                       
  0a04  AD9FFE10       JSR [0xfe10]                      
  0a08  39             RTS                               

; ---- function FUN_M65_r2_08000__0a09
FUN_M65_r2_08000__0a09:
  0a09  171D87         LBSR 0x2793                       
  0a0c  170487         LBSR 0x0e96                       
  0a0f  AD9FFE12       JSR [0xfe12]                      
  0a13  39             RTS                               

; ---- function FUN_M65_r2_08000__0a14
FUN_M65_r2_08000__0a14:
  0a14  171DF7         LBSR 0x280e                       
  0a17  1704B7         LBSR 0x0ed1                       
  0a1a  AD9FFE10       JSR [0xfe10]                      
  0a1e  39             RTS                               

; ---- function FUN_M65_r2_08000__0a1f
FUN_M65_r2_08000__0a1f:
  0a1f  171E67         LBSR 0x2889                       
  0a22  1704AC         LBSR 0x0ed1                       
  0a25  AD9FFE12       JSR [0xfe12]                      
  0a29  39             RTS                               

; ---- function FUN_M65_r2_08000__0a2a
FUN_M65_r2_08000__0a2a:
  0a2a  AD9FFDFC       JSR [0xfdfc]                      
  0a2e  39             RTS                               
LAB_M65_r2_08000__0a2f:
  0a2f  C600           LDB #0x0                          
  0a31  AD9FFC36       JSR [0xfc36]                      
  0a35  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0a39  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M65_r2_08000__0a62:
  0a62  3577           PULS CC A B X Y U                 
  0a64  39             RTS                               

; ---- function FUN_M65_r2_08000__0a65
FUN_M65_r2_08000__0a65:
  0a65  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l coarse" "l fine  " "l delay " "l fdback"
  0a69  6C20636F6172.. ds "l coarse"                     
  0a71  6C2066696E65.. ds "l fine  "                     
  0a79  6C2064656C61.. ds "l delay "                     
  0a81  6C2066646261.. ds "l fdback"                     
LAB_M65_r2_08000__0a89:
  0a89  AD9FFDF2       JSR [0xfdf2]                      
  0a8d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1147 ->$11AE ->$13C5 ->$23A8 ->$0A9E ->$0AD7
  0a91  1147           addr M65_r2_08000::1147           
  0a93  11AE           addr M65_r2_08000::11ae           
  0a95  13C5           addr M65_r2_08000::13c5           
  0a97  23A8           addr M65_r2_08000::23a8           
  0a99  0A9E           addr M65_r2_08000::0a9e           
  0a9b  0AD7           addr M65_r2_08000::0ad7           
LAB_M65_r2_08000__0a9d:
  0a9d  39             RTS                               

; ---- function FUN_M65_r2_08000__0a9e
FUN_M65_r2_08000__0a9e:
  0a9e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r coarse" "r fine  " "r delay " "r fdback"
  0aa2  7220636F6172.. ds "r coarse"                     
  0aaa  722066696E65.. ds "r fine  "                     
  0ab2  722064656C61.. ds "r delay "                     
  0aba  722066646261.. ds "r fdback"                     
LAB_M65_r2_08000__0ac2:
  0ac2  AD9FFDF2       JSR [0xfdf2]                      
  0ac6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1236 ->$129D ->$14C4 ->$2453 ->$0AD7 ->$0A65
  0aca  1236           addr M65_r2_08000::1236           
  0acc  129D           addr M65_r2_08000::129d           
  0ace  14C4           addr M65_r2_08000::14c4           
  0ad0  2453           addr M65_r2_08000::2453           
  0ad2  0AD7           addr M65_r2_08000::0ad7           
  0ad4  0A65           addr M65_r2_08000::0a65           
LAB_M65_r2_08000__0ad6:
  0ad6  39             RTS                               

; ---- function FUN_M65_r2_08000__0ad7
FUN_M65_r2_08000__0ad7:
  0ad7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" [-] " levels "
  0adb  6C656674206D.. ds "left mix"                     
  0ae3  72696768746D.. ds "rightmix"                     
  0aeb  00             db 0h                             
  0aec  206C6576656C.. ds " levels "                     
LAB_M65_r2_08000__0af4:
  0af4  AD9FFDF2       JSR [0xfdf2]                      
  0af8  170475         LBSR 0x0f70                       
  0afb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$25B0 ->$265E ->$0F22 ->$0E96 ->$0B12 ->$0A9E
  0aff  25B0           addr M65_r2_08000::25b0           
  0b01  265E           addr M65_r2_08000::265e           
  0b03  0F22           addr M65_r2_08000::0f22           
  0b05  0E96           addr M65_r2_08000::0e96           
  0b07  0B12           addr M65_r2_08000::0b12           
  0b09  0A9E           addr M65_r2_08000::0a9e           
LAB_M65_r2_08000__0b0b:
  0b0b  CC0AD7         LDD #0xad7                        
  0b0e  FD7164         STD 0x7164                        
  0b11  39             RTS                               

; ---- function FUN_M65_r2_08000__0b12
FUN_M65_r2_08000__0b12:
  0b12  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " expert "
  0b16  01             db 1h                             
  0b17  01             db 1h                             
  0b18  01             db 1h                             
  0b19  206578706572.. ds " expert "                     
LAB_M65_r2_08000__0b21:
  0b21  AD9FFDF2       JSR [0xfdf2]                      
  0b25  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F0C ->$0F0C ->$0F0C ->$0B3C ->$0A65 ->$0AD7
  0b29  0F0C           addr M65_r2_08000::0f0c           
  0b2b  0F0C           addr M65_r2_08000::0f0c           
  0b2d  0F0C           addr M65_r2_08000::0f0c           
  0b2f  0B3C           addr M65_r2_08000::0b3c           
  0b31  0A65           addr M65_r2_08000::0a65           
  0b33  0AD7           addr M65_r2_08000::0ad7           
LAB_M65_r2_08000__0b35:
  0b35  CC0B12         LDD #0xb12                        
  0b38  FD7164         STD 0x7164                        
  0b3b  39             RTS                               

; ---- function FUN_M65_r2_08000__0b3c
FUN_M65_r2_08000__0b3c:
  0b3c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "low note" "highnote" " source " " return "
  0b40  6C6F77206E6F.. ds "low note"                     
  0b48  686967686E6F.. ds "highnote"                     
  0b50  20736F757263.. ds " source "                     
  0b58  207265747572.. ds " return "                     
LAB_M65_r2_08000__0b60:
  0b60  AD9FFDF2       JSR [0xfdf2]                      
  0b64  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$29FA ->$28F6 ->$2BF3 ->$0F0C ->$0F0C ->$0F0C
  0b68  29FA           addr M65_r2_08000::29fa           
  0b6a  28F6           addr M65_r2_08000::28f6           
  0b6c  2BF3           addr M65_r2_08000::2bf3           
  0b6e  0F0C           addr M65_r2_08000::0f0c           
  0b70  0F0C           addr M65_r2_08000::0f0c           
  0b72  0F0C           addr M65_r2_08000::0f0c           
LAB_M65_r2_08000__0b74:
  0b74  FC7164         LDD 0x7164                        
  0b77  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0b7b  60E9           addr 60e9                         
LAB_M65_r2_08000__0b7d:
  0b7d  39             RTS                               

; ---- function FUN_M65_r2_08000__0b7e
FUN_M65_r2_08000__0b7e:
  0b7e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " coarse " "  fine  " " delay  " "feedback"
  0b82  20636F617273.. ds " coarse "                     
  0b8a  202066696E65.. ds "  fine  "                     
  0b92  2064656C6179.. ds " delay  "                     
  0b9a  666565646261.. ds "feedback"                     
LAB_M65_r2_08000__0ba2:
  0ba2  AD9FFDF2       JSR [0xfdf2]                      
  0ba6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$12E5 ->$12CD ->$14C4 ->$22F9 ->$0BB7 ->$0BB7
  0baa  12E5           addr M65_r2_08000::12e5           
  0bac  12CD           addr M65_r2_08000::12cd           
  0bae  14C4           addr M65_r2_08000::14c4           
  0bb0  22F9           addr M65_r2_08000::22f9           
  0bb2  0BB7           addr M65_r2_08000::0bb7           
  0bb4  0BB7           addr M65_r2_08000::0bb7           
LAB_M65_r2_08000__0bb6:
  0bb6  39             RTS                               

; ---- function FUN_M65_r2_08000__0bb7
FUN_M65_r2_08000__0bb7:
  0bb7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [*] " levels " " expert "
  0bbb  20206D697820.. ds "  mix   "                     
  0bc3  01             db 1h                             
  0bc4  206C6576656C.. ds " levels "                     
  0bcc  206578706572.. ds " expert "                     
LAB_M65_r2_08000__0bd4:
  0bd4  AD9FFDF2       JSR [0xfdf2]                      
  0bd8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$24FE ->$0F0C ->$0E96 ->$0BEF ->$0B7E ->$0B7E
  0bdc  24FE           addr M65_r2_08000::24fe           
  0bde  0F0C           addr M65_r2_08000::0f0c           
  0be0  0E96           addr M65_r2_08000::0e96           
  0be2  0BEF           addr M65_r2_08000::0bef           
  0be4  0B7E           addr M65_r2_08000::0b7e           
  0be6  0B7E           addr M65_r2_08000::0b7e           
LAB_M65_r2_08000__0be8:
  0be8  CC0BB7         LDD #0xbb7                        
  0beb  FD7164         STD 0x7164                        
  0bee  39             RTS                               

; ---- function FUN_M65_r2_08000__0bef
FUN_M65_r2_08000__0bef:
  0bef  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "low note" "highnote" " source " " return "
  0bf3  6C6F77206E6F.. ds "low note"                     
  0bfb  686967686E6F.. ds "highnote"                     
  0c03  20736F757263.. ds " source "                     
  0c0b  207265747572.. ds " return "                     
LAB_M65_r2_08000__0c13:
  0c13  AD9FFDF2       JSR [0xfdf2]                      
  0c17  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$29FA ->$28F6 ->$2BF3 ->$0F0C ->$0C31 ->$0C31
  0c1b  29FA           addr M65_r2_08000::29fa           
  0c1d  28F6           addr M65_r2_08000::28f6           
  0c1f  2BF3           addr M65_r2_08000::2bf3           
  0c21  0F0C           addr M65_r2_08000::0f0c           
  0c23  0C31           addr M65_r2_08000::0c31           
  0c25  0C31           addr M65_r2_08000::0c31           
LAB_M65_r2_08000__0c27:
  0c27  FC7164         LDD 0x7164                        
  0c2a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0c2e  60E9           addr 60e9                         
LAB_M65_r2_08000__0c30:
  0c30  39             RTS                               

; ---- function FUN_M65_r2_08000__0c31
FUN_M65_r2_08000__0c31:
  0c31  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "deg mode" [*] [*] " return "
  0c35  646567206D6F.. ds "deg mode"                     
  0c3d  01             db 1h                             
  0c3e  01             db 1h                             
  0c3f  207265747572.. ds " return "                     
LAB_M65_r2_08000__0c47:
  0c47  AD9FFDF2       JSR [0xfdf2]                      
  0c4b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2AE5 ->$0F0C ->$0F0C ->$0F0C ->$0BEF ->$0BEF
  0c4f  2AE5           addr M65_r2_08000::2ae5           
  0c51  0F0C           addr M65_r2_08000::0f0c           
  0c53  0F0C           addr M65_r2_08000::0f0c           
  0c55  0F0C           addr M65_r2_08000::0f0c           
  0c57  0BEF           addr M65_r2_08000::0bef           
  0c59  0BEF           addr M65_r2_08000::0bef           
LAB_M65_r2_08000__0c5b:
  0c5b  FC7164         LDD 0x7164                        
  0c5e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0c62  60E9           addr 60e9                         
LAB_M65_r2_08000__0c64:
  0c64  39             RTS                               

; ---- function FUN_M65_r2_08000__0c65
FUN_M65_r2_08000__0c65:
  0c65  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l coarse" "l fine  " "l length" "l fdback"
  0c69  6C20636F6172.. ds "l coarse"                     
  0c71  6C2066696E65.. ds "l fine  "                     
  0c79  6C206C656E67.. ds "l length"                     
  0c81  6C2066646261.. ds "l fdback"                     
LAB_M65_r2_08000__0c89:
  0c89  AD9FFDF2       JSR [0xfdf2]                      
  0c8d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1147 ->$11AE ->$15B5 ->$23A8 ->$0C9E ->$0CD7
  0c91  1147           addr M65_r2_08000::1147           
  0c93  11AE           addr M65_r2_08000::11ae           
  0c95  15B5           addr M65_r2_08000::15b5           
  0c97  23A8           addr M65_r2_08000::23a8           
  0c99  0C9E           addr M65_r2_08000::0c9e           
  0c9b  0CD7           addr M65_r2_08000::0cd7           
LAB_M65_r2_08000__0c9d:
  0c9d  39             RTS                               

; ---- function FUN_M65_r2_08000__0c9e
FUN_M65_r2_08000__0c9e:
  0c9e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r coarse" "r fine  " "r length" "r fdback"
  0ca2  7220636F6172.. ds "r coarse"                     
  0caa  722066696E65.. ds "r fine  "                     
  0cb2  72206C656E67.. ds "r length"                     
  0cba  722066646261.. ds "r fdback"                     
LAB_M65_r2_08000__0cc2:
  0cc2  AD9FFDF2       JSR [0xfdf2]                      
  0cc6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1236 ->$129D ->$16BA ->$2453 ->$0CD7 ->$0C65
  0cca  1236           addr M65_r2_08000::1236           
  0ccc  129D           addr M65_r2_08000::129d           
  0cce  16BA           addr M65_r2_08000::16ba           
  0cd0  2453           addr M65_r2_08000::2453           
  0cd2  0CD7           addr M65_r2_08000::0cd7           
  0cd4  0C65           addr M65_r2_08000::0c65           
LAB_M65_r2_08000__0cd6:
  0cd6  39             RTS                               

; ---- function FUN_M65_r2_08000__0cd7
FUN_M65_r2_08000__0cd7:
  0cd7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" [-] " levels "
  0cdb  6C656674206D.. ds "left mix"                     
  0ce3  72696768746D.. ds "rightmix"                     
  0ceb  00             db 0h                             
  0cec  206C6576656C.. ds " levels "                     
LAB_M65_r2_08000__0cf4:
  0cf4  AD9FFDF2       JSR [0xfdf2]                      
  0cf8  CC0CD7         LDD #0xcd7                        
  0cfb  FD7164         STD 0x7164                        
  0cfe  17026F         LBSR 0x0f70                       
  0d01  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$25B0 ->$265E ->$0F22 ->$0E96 ->$0C65 ->$0C9E
  0d05  25B0           addr M65_r2_08000::25b0           
  0d07  265E           addr M65_r2_08000::265e           
  0d09  0F22           addr M65_r2_08000::0f22           
  0d0b  0E96           addr M65_r2_08000::0e96           
  0d0d  0C65           addr M65_r2_08000::0c65           
  0d0f  0C9E           addr M65_r2_08000::0c9e           
LAB_M65_r2_08000__0d11:
  0d11  39             RTS                               

; ---- function FUN_M65_r2_08000__0d12
FUN_M65_r2_08000__0d12:
  0d12  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l voice " "r voice " [-] "  key   "
  0d16  6C20766F6963.. ds "l voice "                     
  0d1e  7220766F6963.. ds "r voice "                     
  0d26  00             db 0h                             
  0d27  20206B657920.. ds "  key   "                     
LAB_M65_r2_08000__0d2f:
  0d2f  AD9FFDF2       JSR [0xfdf2]                      
  0d33  1703D8         LBSR 0x110e                       
  0d36  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1A0E ->$1AF9 ->$105A ->$17BD ->$0D47 ->$0D80
  0d3a  1A0E           addr M65_r2_08000::1a0e           
  0d3c  1AF9           addr M65_r2_08000::1af9           
  0d3e  105A           addr M65_r2_08000::105a           
  0d40  17BD           addr M65_r2_08000::17bd           
  0d42  0D47           addr M65_r2_08000::0d47           
  0d44  0D80           addr M65_r2_08000::0d80           
LAB_M65_r2_08000__0d46:
  0d46  39             RTS                               

; ---- function FUN_M65_r2_08000__0d47
FUN_M65_r2_08000__0d47:
  0d47  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" "l fdback" "r fdback"
  0d4b  6C656674206D.. ds "left mix"                     
  0d53  72696768746D.. ds "rightmix"                     
  0d5b  6C2066646261.. ds "l fdback"                     
  0d63  722066646261.. ds "r fdback"                     
LAB_M65_r2_08000__0d6b:
  0d6b  AD9FFDF2       JSR [0xfdf2]                      
  0d6f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$25B0 ->$265E ->$23A8 ->$2453 ->$0D80 ->$0D12
  0d73  25B0           addr M65_r2_08000::25b0           
  0d75  265E           addr M65_r2_08000::265e           
  0d77  23A8           addr M65_r2_08000::23a8           
  0d79  2453           addr M65_r2_08000::2453           
  0d7b  0D80           addr M65_r2_08000::0d80           
  0d7d  0D12           addr M65_r2_08000::0d12           
LAB_M65_r2_08000__0d7f:
  0d7f  39             RTS                               

; ---- function FUN_M65_r2_08000__0d80
FUN_M65_r2_08000__0d80:
  0d80  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  tune  " "shownote" "  delay " " levels "
  0d84  202074756E65.. ds "  tune  "                     
  0d8c  73686F776E6F.. ds "shownote"                     
  0d94  202064656C61.. ds "  delay "                     
  0d9c  206C6576656C.. ds " levels "                     
LAB_M65_r2_08000__0da4:
  0da4  AD9FFDF2       JSR [0xfdf2]                      
  0da8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1CBB ->$1E04 ->$14C4 ->$0E96 ->$0DBF ->$0D47
  0dac  1CBB           addr M65_r2_08000::1cbb           
  0dae  1E04           addr M65_r2_08000::1e04           
  0db0  14C4           addr M65_r2_08000::14c4           
  0db2  0E96           addr M65_r2_08000::0e96           
  0db4  0DBF           addr M65_r2_08000::0dbf           
  0db6  0D47           addr M65_r2_08000::0d47           
LAB_M65_r2_08000__0db8:
  0db8  CC0D80         LDD #0xd80                        
  0dbb  FD7164         STD 0x7164                        
  0dbe  39             RTS                               

; ---- function FUN_M65_r2_08000__0dbf
FUN_M65_r2_08000__0dbf:
  0dbf  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " expert "
  0dc3  01             db 1h                             
  0dc4  01             db 1h                             
  0dc5  01             db 1h                             
  0dc6  206578706572.. ds " expert "                     
LAB_M65_r2_08000__0dce:
  0dce  AD9FFDF2       JSR [0xfdf2]                      
  0dd2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F0C ->$0F0C ->$0F0C ->$0DE9 ->$0D12 ->$0D80
  0dd6  0F0C           addr M65_r2_08000::0f0c           
  0dd8  0F0C           addr M65_r2_08000::0f0c           
  0dda  0F0C           addr M65_r2_08000::0f0c           
  0ddc  0DE9           addr M65_r2_08000::0de9           
  0dde  0D12           addr M65_r2_08000::0d12           
  0de0  0D80           addr M65_r2_08000::0d80           
LAB_M65_r2_08000__0de2:
  0de2  CC0DBF         LDD #0xdbf                        
  0de5  FD7164         STD 0x7164                        
  0de8  39             RTS                               

; ---- function FUN_M65_r2_08000__0de9
FUN_M65_r2_08000__0de9:
  0de9  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " scale1 " "scale2  " "lownote " "highnote"
  0ded  207363616C65.. ds " scale1 "                     
  0df5  7363616C6532.. ds "scale2  "                     
  0dfd  6C6F776E6F74.. ds "lownote "                     
  0e05  686967686E6F.. ds "highnote"                     
LAB_M65_r2_08000__0e0d:
  0e0d  AD9FFDF2       JSR [0xfdf2]                      
  0e11  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0E56 ->$0E5E ->$29FA ->$28F6 ->$0E22 ->$0E22
  0e15  0E56           addr M65_r2_08000::0e56           
  0e17  0E5E           addr M65_r2_08000::0e5e           
  0e19  29FA           addr M65_r2_08000::29fa           
  0e1b  28F6           addr M65_r2_08000::28f6           
  0e1d  0E22           addr M65_r2_08000::0e22           
  0e1f  0E22           addr M65_r2_08000::0e22           
LAB_M65_r2_08000__0e21:
  0e21  39             RTS                               

; ---- function FUN_M65_r2_08000__0e22
FUN_M65_r2_08000__0e22:
  0e22  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " source " [*] [*] " return "
  0e26  20736F757263.. ds " source "                     
  0e2e  01             db 1h                             
  0e2f  01             db 1h                             
  0e30  207265747572.. ds " return "                     
LAB_M65_r2_08000__0e38:
  0e38  AD9FFDF2       JSR [0xfdf2]                      
  0e3c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2BF3 ->$0F0C ->$0F0C ->$0F0C ->$0DE9 ->$0DE9
  0e40  2BF3           addr M65_r2_08000::2bf3           
  0e42  0F0C           addr M65_r2_08000::0f0c           
  0e44  0F0C           addr M65_r2_08000::0f0c           
  0e46  0F0C           addr M65_r2_08000::0f0c           
  0e48  0DE9           addr M65_r2_08000::0de9           
  0e4a  0DE9           addr M65_r2_08000::0de9           
LAB_M65_r2_08000__0e4c:
  0e4c  FC7164         LDD 0x7164                        
  0e4f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0e53  60E9           addr 60e9                         
LAB_M65_r2_08000__0e55:
  0e55  39             RTS                               

; ---- function FUN_M65_r2_08000__0e56
FUN_M65_r2_08000__0e56:
  0e56  CC7016         LDD #0x7016                       
  0e59  FD7014         STD 0x7014                        
  0e5c  2006           BRA 0x0e64                        

; ---- function FUN_M65_r2_08000__0e5e
FUN_M65_r2_08000__0e5e:
  0e5e  CC702E         LDD #0x702e                       
  0e61  FD7014         STD 0x7014                        
LAB_M65_r2_08000__0e64:
  0e64  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  note  " "interval" [*] " return "
  0e68  20206E6F7465.. ds "  note  "                     
  0e70  696E74657276.. ds "interval"                     
  0e78  01             db 1h                             
  0e79  207265747572.. ds " return "                     
LAB_M65_r2_08000__0e81:
  0e81  AD9FFDF2       JSR [0xfdf2]                      
  0e85  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$186B ->$193F ->$0F0C ->$0DE9 ->$0F0C ->$0F0C
  0e89  186B           addr M65_r2_08000::186b           
  0e8b  193F           addr M65_r2_08000::193f           
  0e8d  0F0C           addr M65_r2_08000::0f0c           
  0e8f  0DE9           addr M65_r2_08000::0de9           
  0e91  0F0C           addr M65_r2_08000::0f0c           
  0e93  0F0C           addr M65_r2_08000::0f0c           
LAB_M65_r2_08000__0e95:
  0e95  39             RTS                               

; ---- function FUN_M65_r2_08000__0e96
FUN_M65_r2_08000__0e96:
  0e96  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  0e9a  6C6566742069.. ds "left in "                     
  0ea2  726967687420.. ds "right in"                     
  0eaa  01             db 1h                             
  0eab  207265747572.. ds " return "                     
LAB_M65_r2_08000__0eb3:
  0eb3  AD9FFDF2       JSR [0xfdf2]                      
  0eb7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$270C ->$2787 ->$0F0C ->$0F0C ->$0ED1 ->$0ED1
  0ebb  270C           addr M65_r2_08000::270c           
  0ebd  2787           addr M65_r2_08000::2787           
  0ebf  0F0C           addr M65_r2_08000::0f0c           
  0ec1  0F0C           addr M65_r2_08000::0f0c           
  0ec3  0ED1           addr M65_r2_08000::0ed1           
  0ec5  0ED1           addr M65_r2_08000::0ed1           
LAB_M65_r2_08000__0ec7:
  0ec7  FC7164         LDD 0x7164                        
  0eca  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0ece  60E9           addr 60e9                         
LAB_M65_r2_08000__0ed0:
  0ed0  39             RTS                               

; ---- function FUN_M65_r2_08000__0ed1
FUN_M65_r2_08000__0ed1:
  0ed1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  0ed5  6C656674206F.. ds "left out"                     
  0edd  72696768746F.. ds "rightout"                     
  0ee5  01             db 1h                             
  0ee6  207265747572.. ds " return "                     
LAB_M65_r2_08000__0eee:
  0eee  AD9FFDF2       JSR [0xfdf2]                      
  0ef2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2802 ->$287D ->$0F0C ->$0F0C ->$0E96 ->$0E96
  0ef6  2802           addr M65_r2_08000::2802           
  0ef8  287D           addr M65_r2_08000::287d           
  0efa  0F0C           addr M65_r2_08000::0f0c           
  0efc  0F0C           addr M65_r2_08000::0f0c           
  0efe  0E96           addr M65_r2_08000::0e96           
  0f00  0E96           addr M65_r2_08000::0e96           
LAB_M65_r2_08000__0f02:
  0f02  FC7164         LDD 0x7164                        
  0f05  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0f09  60E9           addr 60e9                         
LAB_M65_r2_08000__0f0b:
  0f0b  39             RTS                               

; ---- function FUN_M65_r2_08000__0f0c
FUN_M65_r2_08000__0f0c:
  0f0c  39             RTS                               

; ---- function FUN_M65_r2_08000__0f0d
FUN_M65_r2_08000__0f0d:
  0f0d  3426           PSHS  Y B A                       
  0f0f  AD9FFC8E       JSR [0xfc8e]                      
  0f13  FC60F9         LDD 0x60f9                        
  0f16  FD70CA         STD 0x70ca                        
  0f19  FD6074         STD 0x6074                        
  0f1c  1700E1         LBSR 0x1000                       
  0f1f  3526           PULS  A B Y                       
  0f21  39             RTS                               

; ---- function FUN_M65_r2_08000__0f22
FUN_M65_r2_08000__0f22:
  0f22  3406           PSHS  B A                         
  0f24  FC70CA         LDD 0x70ca                        
  0f27  88FF           EORA #0xff                        
  0f29  C8FF           EORB #0xff                        
  0f2b  FD70CA         STD 0x70ca                        
  0f2e  170005         LBSR 0x0f36                       
  0f31  17001F         LBSR 0x0f53                       
  0f34  3506           PULS  A B                         

; ---- function FUN_M65_r2_08000__0f36
FUN_M65_r2_08000__0f36:
  0f36  3406           PSHS  B A                         
  0f38  1700C5         LBSR 0x1000                       
  0f3b  17006A         LBSR 0x0fa8                       
  0f3e  CC0F0C         LDD #0xf0c                        
  0f41  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  0f45  6070           addr 6070                         
LAB_M65_r2_08000__0f47:
  0f47  CC0F0C         LDD #0xf0c                        
  0f4a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  0f4e  6072           addr 6072                         
LAB_M65_r2_08000__0f50:
  0f50  3506           PULS  A B                         
  0f52  39             RTS                               

; ---- function FUN_M65_r2_08000__0f53
FUN_M65_r2_08000__0f53:
  0f53  3426           PSHS  Y B A                       
  0f55  108E000B       LDY #0xb                          
  0f59  FC70CA         LDD 0x70ca                        
  0f5c  AD9FFE40       JSR [0xfe40]                      
  0f60  17009D         LBSR 0x1000                       
  0f63  170042         LBSR 0x0fa8                       
  0f66  170007         LBSR 0x0f70                       
  0f69  AD9FFDEC       JSR [0xfdec]                      
  0f6d  3526           PULS  A B Y                       
  0f6f  39             RTS                               

; ---- function FUN_M65_r2_08000__0f70
FUN_M65_r2_08000__0f70:
  0f70  3456           PSHS  U X B A                     
  0f72  FC70CA         LDD 0x70ca                        
  0f75  10830000       CMPD #0x0                         
  0f79  10270015       LBEQ 0x0f92                       
  0f7d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "sust=off" [-]
  0f81  00             db 0h                             
  0f82  00             db 0h                             
  0f83  737573743D6F.. ds "sust=off"                     
  0f8b  00             db 0h                             
LAB_M65_r2_08000__0f8c:
  0f8c  AD9FFDF2       JSR [0xfdf2]                      
  0f90  2013           BRA 0x0fa5                        
LAB_M65_r2_08000__0f92:
  0f92  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "sust=on " [-]
  0f96  00             db 0h                             
  0f97  00             db 0h                             
  0f98  737573743D6F.. ds "sust=on "                     
  0fa0  00             db 0h                             
LAB_M65_r2_08000__0fa1:
  0fa1  AD9FFDF2       JSR [0xfdf2]                      
LAB_M65_r2_08000__0fa5:
  0fa5  3556           PULS  A B X U                     
  0fa7  39             RTS                               

; ---- function FUN_M65_r2_08000__0fa8
FUN_M65_r2_08000__0fa8:
  0fa8  3456           PSHS  U X B A                     
  0faa  FC70CA         LDD 0x70ca                        
  0fad  10830000       CMPD #0x0                         
  0fb1  10270025       LBEQ 0x0fda                       
  0fb5  17FA72         LBSR 0x0a2a                       
  0fb8  C613           LDB #0x13                         
  0fba  AD9FFC36       JSR [0xfc36]                      
  0fbe  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "  --normal operation-"
  0fc2  0A202D2D6E6F.. char[22] "\n --normal operation-" 
LAB_M65_r2_08000__0fd8:
  0fd8  2023           BRA 0x0ffd                        
LAB_M65_r2_08000__0fda:
  0fda  17FA4D         LBSR 0x0a2a                       
  0fdd  C613           LDB #0x13                         
  0fdf  AD9FFC36       JSR [0xfc36]                      
  0fe3  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "  --sustain looping--"
  0fe7  0A202D2D7375.. char[22] "\n --sustain looping--" 
LAB_M65_r2_08000__0ffd:
  0ffd  3556           PULS  A B X U                     
  0fff  39             RTS                               

; ---- function FUN_M65_r2_08000__1000
FUN_M65_r2_08000__1000:
  1000  3476           PSHS  U Y X B A                   
  1002  FC70CA         LDD 0x70ca                        
  1005  10830000       CMPD #0x0                         
  1009  10270014       LBEQ 0x1021                       
  100d  CC000A         LDD #0xa                          
  1010  AD9FFD20       JSR [0xfd20]                      
  1014  108E0347       LDY #0x347                        
  1018  CC0001         LDD #0x1                          
  101b  AD9FFD2E       JSR [0xfd2e]                      
  101f  2012           BRA 0x1033                        
LAB_M65_r2_08000__1021:
  1021  CC000A         LDD #0xa                          
  1024  AD9FFD20       JSR [0xfd20]                      
  1028  108E0347       LDY #0x347                        
  102c  CC0000         LDD #0x0                          
  102f  AD9FFD2E       JSR [0xfd2e]                      
LAB_M65_r2_08000__1033:
  1033  3576           PULS  A B X Y U                   
  1035  39             RTS                               

; ---- function FUN_M65_r2_08000__1036
FUN_M65_r2_08000__1036:
  1036  3426           PSHS  Y B A                       
  1038  AD9FFC8E       JSR [0xfc8e]                      
  103c  FC60F9         LDD 0x60f9                        
  103f  FD70CC         STD 0x70cc                        
  1042  FD6074         STD 0x6074                        
  1045  1700FE         LBSR 0x1146                       
  1048  CC71FB         LDD #0x71fb                       
  104b  837170         SUBD #0x7170                      
  104e  1F02           TFR D,Y                           
  1050  FC70CC         LDD 0x70cc                        
  1053  AD9FFC80       JSR [0xfc80]                      
  1057  3526           PULS  A B Y                       
  1059  39             RTS                               

; ---- function FUN_M65_r2_08000__105a
FUN_M65_r2_08000__105a:
  105a  3406           PSHS  B A                         
  105c  FC70CC         LDD 0x70cc                        
  105f  88FF           EORA #0xff                        
  1061  C8FF           EORB #0xff                        
  1063  FD70CC         STD 0x70cc                        
  1066  170005         LBSR 0x106e                       
  1069  17001F         LBSR 0x108b                       
  106c  3506           PULS  A B                         

; ---- function FUN_M65_r2_08000__106e
FUN_M65_r2_08000__106e:
  106e  3406           PSHS  B A                         
  1070  1700D3         LBSR 0x1146                       
  1073  170040         LBSR 0x10b6                       
  1076  CC10B6         LDD #0x10b6                       
  1079  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  107d  6070           addr 6070                         
LAB_M65_r2_08000__107f:
  107f  CC1146         LDD #0x1146                       
  1082  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1086  6072           addr 6072                         
LAB_M65_r2_08000__1088:
  1088  3506           PULS  A B                         
  108a  39             RTS                               

; ---- function FUN_M65_r2_08000__108b
FUN_M65_r2_08000__108b:
  108b  3426           PSHS  Y B A                       
  108d  CC71FB         LDD #0x71fb                       
  1090  837170         SUBD #0x7170                      
  1093  1F02           TFR D,Y                           
  1095  FC70CC         LDD 0x70cc                        
  1098  AD9FFC80       JSR [0xfc80]                      
  109c  108E0023       LDY #0x23                         
  10a0  FC70CC         LDD 0x70cc                        
  10a3  AD9FFE40       JSR [0xfe40]                      
  10a7  17009C         LBSR 0x1146                       
  10aa  8D0A           BSR 0x10b6                        
  10ac  17005F         LBSR 0x110e                       
  10af  AD9FFDEC       JSR [0xfdec]                      
  10b3  3526           PULS  A B Y                       
  10b5  39             RTS                               

; ---- function FUN_M65_r2_08000__10b6
FUN_M65_r2_08000__10b6:
  10b6  3456           PSHS  U X B A                     
  10b8  FC70CC         LDD 0x70cc                        
  10bb  10830000       CMPD #0x0                         
  10bf  10270025       LBEQ 0x10e8                       
  10c3  17F964         LBSR 0x0a2a                       
  10c6  C613           LDB #0x13                         
  10c8  AD9FFC36       JSR [0xfc36]                      
  10cc  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " ---normal output----"
  10d0  0A2D2D2D6E6F.. char[22] "\n---normal output----" 
LAB_M65_r2_08000__10e6:
  10e6  2023           BRA 0x110b                        
LAB_M65_r2_08000__10e8:
  10e8  17F93F         LBSR 0x0a2a                       
  10eb  C613           LDB #0x13                         
  10ed  AD9FFC36       JSR [0xfc36]                      
  10f1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " --pitch quantizing--"
  10f5  0A2D2D706974.. char[22] "\n--pitch quantizing--" 
LAB_M65_r2_08000__110b:
  110b  3556           PULS  A B X U                     
  110d  39             RTS                               

; ---- function FUN_M65_r2_08000__110e
FUN_M65_r2_08000__110e:
  110e  3456           PSHS  U X B A                     
  1110  FC70CC         LDD 0x70cc                        
  1113  10830000       CMPD #0x0                         
  1117  10270015       LBEQ 0x1130                       
  111b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "quan=off" [-]
  111f  00             db 0h                             
  1120  00             db 0h                             
  1121  7175616E3D6F.. ds "quan=off"                     
  1129  00             db 0h                             
LAB_M65_r2_08000__112a:
  112a  AD9FFDF2       JSR [0xfdf2]                      
  112e  2013           BRA 0x1143                        
LAB_M65_r2_08000__1130:
  1130  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "quan=on " [-]
  1134  00             db 0h                             
  1135  00             db 0h                             
  1136  7175616E3D6F.. ds "quan=on "                     
  113e  00             db 0h                             
LAB_M65_r2_08000__113f:
  113f  AD9FFDF2       JSR [0xfdf2]                      
LAB_M65_r2_08000__1143:
  1143  3556           PULS  A B X U                     
  1145  39             RTS                               

; ---- function FUN_M65_r2_08000__1146
FUN_M65_r2_08000__1146:
  1146  39             RTS                               

; ---- function FUN_M65_r2_08000__1147
FUN_M65_r2_08000__1147:
  1147  3476           PSHS  U Y X B A                   
  1149  170062         LBSR 0x11ae                       
  114c  CC0064         LDD #0x64                         
  114f  FD60DC         STD 0x60dc                        
  1152  FD60DE         STD 0x60de                        
  1155  3576           PULS  A B X Y U                   
  1157  39             RTS                               
PTR_FUN_M65_r2_08000__1209_M65_r2_08000__1158:
  1158  1209           addr M65_r2_08000::1209           
  115a  11DE           addr M65_r2_08000::11de           
  115c  .db 11 BA 70 46 70 48 00 00 70 4A 71 70 71 B5 04 F6  ; ..pFpH..pJqpq...
  116c  .db A0 04 B0 00 01 00 05 11 11 7E 00 00 00 00 70 4C  ; .........~....pL
  117c  .db 71 B7 05 6C 65 66 74 20 70 69 74 63 68 3A 20 20  ; q..left pitch:  
  118c  .db 20 20 20 20 20 63 65 6E 74 73 2C 20 20 5B 20 20  ;      cents,  [  
  119c  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M65_r2_08000__11a2
FUN_M65_r2_08000__11a2:
  11a2  3410           PSHS  X                           
  11a4  8E1158         LDX #0x1158                        ; desc[API_FDBC]: ->$1209 ->$11DE
  11a7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...X"
  11ab  3510           PULS  X                           
  11ad  39             RTS                               

; ---- function FUN_M65_r2_08000__11ae
FUN_M65_r2_08000__11ae:
  11ae  3410           PSHS  X                           
  11b0  8E1158         LDX #0x1158                        ; desc[API_FE6A]: ->$1209 ->$11DE
  11b3  AD9FFE6A       JSR [0xfe6a]                      
  11b7  3510           PULS  X                           
  11b9  39             RTS                               

; ---- function FUN_M65_r2_08000__11ba
FUN_M65_r2_08000__11ba:
  11ba  3410           PSHS  X                           
  11bc  8E1158         LDX #0x1158                        ; desc[API_FE6C]: ->$1209 ->$11DE
  11bf  AD9FFE6C       JSR [0xfe6c]                      
  11c3  3510           PULS  X                           
  11c5  39             RTS                               

; ---- function FUN_M65_r2_08000__11c6
FUN_M65_r2_08000__11c6:
  11c6  3410           PSHS  X                           
  11c8  8E1158         LDX #0x1158                        ; desc[API_FE1C]: ->$1209 ->$11DE
  11cb  AD9FFE1C       JSR [0xfe1c]                      
  11cf  3510           PULS  X                           
  11d1  39             RTS                               

; ---- function FUN_M65_r2_08000__11d2
FUN_M65_r2_08000__11d2:
  11d2  3410           PSHS  X                           
  11d4  8E1158         LDX #0x1158                        ; desc[API_FE1A]: ->$1209 ->$11DE $11BA
  11d7  AD9FFE1A       JSR [0xfe1a]                      
  11db  3510           PULS  X                           
  11dd  39             RTS                               

; ---- function FUN_M65_r2_08000__11de
FUN_M65_r2_08000__11de:
  11de  3456           PSHS  U X B A                     
  11e0  8E1158         LDX #0x1158                        ; desc[API_FE6E]: ->$1209 ->$11DE
  11e3  AD9FFE6E       JSR [0xfe6e]                      
  11e7  FC70CE         LDD 0x70ce                        
  11ea  3606           PSHU  B A                         
  11ec  108E7166       LDY #0x7166                       
  11f0  8603           LDA #0x3                          
  11f2  AD9FFC40       JSR [0xfc40]                      
  11f6  C620           LDB #0x20                         
  11f8  AD9FFC36       JSR [0xfc36]                      
  11fc  CC0005         LDD #0x5                          
  11ff  8E716A         LDX #0x716a                       
  1202  AD9FFC3A       JSR [0xfc3a]                      
  1206  3556           PULS  A B X U                     
  1208  39             RTS                               

; ---- function FUN_M65_r2_08000__1209
FUN_M65_r2_08000__1209:
  1209  3477           PSHS  U Y X B A CC                
  120b  8E1158         LDX #0x1158                       
  120e  AD9FFE76       JSR [0xfe76]                      
  1212  FC704A         LDD 0x704a                        
  1215  3606           PSHU  B A                         
  1217  CC0064         LDD #0x64                         
  121a  3606           PSHU  B A                         
  121c  AD9FFCE6       JSR [0xfce6]                      
  1220  335E           LEAU -0x2,U                       
  1222  171CFC         LBSR 0x2f21                       
  1225  3706           PULU  A B                         
  1227  FD7106         STD 0x7106                        
  122a  AD9FFD52       JSR [0xfd52]                      
  122e  3706           PULU  A B                         
  1230  FD70CE         STD 0x70ce                        
  1233  3577           PULS CC A B X Y U                 
  1235  39             RTS                               

; ---- function FUN_M65_r2_08000__1236
FUN_M65_r2_08000__1236:
  1236  3476           PSHS  U Y X B A                   
  1238  170062         LBSR 0x129d                       
  123b  CC0064         LDD #0x64                         
  123e  FD60DC         STD 0x60dc                        
  1241  FD60DE         STD 0x60de                        
  1244  3576           PULS  A B X Y U                   
  1246  39             RTS                               
PTR_FUN_M65_r2_08000__1321_M65_r2_08000__1247:
  1247  1321           addr M65_r2_08000::1321           
  1249  12F6           addr M65_r2_08000::12f6           
  124b  .db 12 A9 70 4E 70 50 00 00 70 52 71 70 71 A1 06 F6  ; ..pNpP..pRqpq...
  125b  .db A0 04 B0 00 01 00 05 12 12 6D 00 00 00 00 70 54  ; .........m....pT
  126b  .db 71 A3 05 72 69 67 68 74 20 70 69 74 63 68 3A 20  ; q..right pitch: 
  127b  .db 20 20 20 20 20 20 63 65 6E 74 73 2C 20 5B 20 20  ;       cents, [  
  128b  .db 20 20 20 3A 31 5D                                ;    :1]

; ---- function FUN_M65_r2_08000__1291
FUN_M65_r2_08000__1291:
  1291  3410           PSHS  X                           
  1293  8E1247         LDX #0x1247                        ; desc[API_FDBC]: ->$1321 ->$12F6
  1296  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...G"
  129a  3510           PULS  X                           
  129c  39             RTS                               

; ---- function FUN_M65_r2_08000__129d
FUN_M65_r2_08000__129d:
  129d  3410           PSHS  X                           
  129f  8E1247         LDX #0x1247                        ; desc[API_FE6A]: ->$1321 ->$12F6
  12a2  AD9FFE6A       JSR [0xfe6a]                      
  12a6  3510           PULS  X                           
  12a8  39             RTS                               

; ---- function FUN_M65_r2_08000__12a9
FUN_M65_r2_08000__12a9:
  12a9  3410           PSHS  X                           
  12ab  8E1247         LDX #0x1247                        ; desc[API_FE6C]: ->$1321 ->$12F6
  12ae  AD9FFE6C       JSR [0xfe6c]                      
  12b2  3510           PULS  X                           
  12b4  39             RTS                               

; ---- function FUN_M65_r2_08000__12b5
FUN_M65_r2_08000__12b5:
  12b5  3410           PSHS  X                           
  12b7  8E1247         LDX #0x1247                        ; desc[API_FE1C]: ->$1321 ->$12F6
  12ba  AD9FFE1C       JSR [0xfe1c]                      
  12be  3510           PULS  X                           
  12c0  39             RTS                               

; ---- function FUN_M65_r2_08000__12c1
FUN_M65_r2_08000__12c1:
  12c1  3410           PSHS  X                           
  12c3  8E1247         LDX #0x1247                        ; desc[API_FE1A]: ->$1321 ->$12F6 $12A9
  12c6  AD9FFE1A       JSR [0xfe1a]                      
  12ca  3510           PULS  X                           
  12cc  39             RTS                               

; ---- function FUN_M65_r2_08000__12cd
FUN_M65_r2_08000__12cd:
  12cd  3476           PSHS  U Y X B A                   
  12cf  17FFCB         LBSR 0x129d                       
  12d2  C605           LDB #0x5                          
  12d4  AD9FFC36       JSR [0xfc36]                      
  12d8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "l & r"
  12dc  6C2026207200   char[6] "l & r"                   
LAB_M65_r2_08000__12e2:
  12e2  3576           PULS  A B X Y U                   
  12e4  39             RTS                               

; ---- function FUN_M65_r2_08000__12e5
FUN_M65_r2_08000__12e5:
  12e5  3476           PSHS  U Y X B A                   
  12e7  17FFE3         LBSR 0x12cd                       
  12ea  CC0064         LDD #0x64                         
  12ed  FD60DC         STD 0x60dc                        
  12f0  FD60DE         STD 0x60de                        
  12f3  3576           PULS  A B X Y U                   
  12f5  39             RTS                               

; ---- function FUN_M65_r2_08000__12f6
FUN_M65_r2_08000__12f6:
  12f6  3416           PSHS  X B A                       
  12f8  8E1247         LDX #0x1247                        ; desc[API_FE6E]: ->$1321 ->$12F6
  12fb  AD9FFE6E       JSR [0xfe6e]                      
  12ff  FC70D0         LDD 0x70d0                        
  1302  3606           PSHU  B A                         
  1304  108E7166       LDY #0x7166                       
  1308  8603           LDA #0x3                          
  130a  AD9FFC40       JSR [0xfc40]                      
  130e  C620           LDB #0x20                         
  1310  AD9FFC36       JSR [0xfc36]                      
  1314  CC0005         LDD #0x5                          
  1317  8E716A         LDX #0x716a                       
  131a  AD9FFC3A       JSR [0xfc3a]                      
  131e  3516           PULS  A B X                       
  1320  39             RTS                               

; ---- function FUN_M65_r2_08000__1321
FUN_M65_r2_08000__1321:
  1321  3477           PSHS  U Y X B A CC                
  1323  8E1247         LDX #0x1247                       
  1326  AD9FFE76       JSR [0xfe76]                      
  132a  FC7052         LDD 0x7052                        
  132d  3606           PSHU  B A                         
  132f  CC0064         LDD #0x64                         
  1332  3606           PSHU  B A                         
  1334  AD9FFCE6       JSR [0xfce6]                      
  1338  335E           LEAU -0x2,U                       
  133a  171BE4         LBSR 0x2f21                       
  133d  3706           PULU  A B                         
  133f  FD7108         STD 0x7108                        
  1342  AD9FFD54       JSR [0xfd54]                      
  1346  3706           PULU  A B                         
  1348  FD70D0         STD 0x70d0                        
  134b  3577           PULS CC A B X Y U                 
  134d  39             RTS                               
PTR_FUN_M65_r2_08000__1403_M65_r2_08000__134e:
  134e  1403           addr M65_r2_08000::1403           
  1350  13A1           addr M65_r2_08000::13a1           
  1352  .db 13 95 70 56 70 58 00 00 70 5A 71 70 71 B9 05 00  ; ..pVpX..pZqpq...
  1362  .db 00 03 E8 00 01 00 04 20 13 74 00 00 00 00 70 5C  ; ....... .t....p\
  1372  .db 71 BB 14 6C 65 66 74 20 64 65 6C 61 79 3A 20 20  ; q..left delay:  
  1382  .db 20 20 20 20 6D 53 20                             ;     mS 

; ---- function FUN_M65_r2_08000__1389
FUN_M65_r2_08000__1389:
  1389  3410           PSHS  X                           
  138b  8E134E         LDX #0x134e                        ; desc[API_FDBC]: ->$1403 ->$13A1
  138e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...N"
  1392  3510           PULS  X                           
  1394  39             RTS                               

; ---- function FUN_M65_r2_08000__1395
FUN_M65_r2_08000__1395:
  1395  3410           PSHS  X                           
  1397  8E134E         LDX #0x134e                        ; desc[API_FE6C]: ->$1403 ->$13A1
  139a  AD9FFE6C       JSR [0xfe6c]                      
  139e  3510           PULS  X                           
  13a0  39             RTS                               

; ---- function FUN_M65_r2_08000__13a1
FUN_M65_r2_08000__13a1:
  13a1  3410           PSHS  X                           
  13a3  8E134E         LDX #0x134e                        ; desc[API_FE6E]: ->$1403 ->$13A1
  13a6  AD9FFE6E       JSR [0xfe6e]                      
  13aa  3510           PULS  X                           
  13ac  39             RTS                               

; ---- function FUN_M65_r2_08000__13ad
FUN_M65_r2_08000__13ad:
  13ad  3410           PSHS  X                           
  13af  8E134E         LDX #0x134e                        ; desc[API_FE1C]: ->$1403 ->$13A1
  13b2  AD9FFE1C       JSR [0xfe1c]                      
  13b6  3510           PULS  X                           
  13b8  39             RTS                               

; ---- function FUN_M65_r2_08000__13b9
FUN_M65_r2_08000__13b9:
  13b9  3410           PSHS  X                           
  13bb  8E134E         LDX #0x134e                        ; desc[API_FE1A]: ->$1403 ->$13A1 $1395
  13be  AD9FFE1A       JSR [0xfe1a]                      
  13c2  3510           PULS  X                           
  13c4  39             RTS                               

; ---- function FUN_M65_r2_08000__13c5
FUN_M65_r2_08000__13c5:
  13c5  3406           PSHS  B A                         
  13c7  8E134E         LDX #0x134e                        ; desc[API_FE6A]: ->$1403 ->$13A1
  13ca  AD9FFE6A       JSR [0xfe6a]                      
  13ce  FC714C         LDD 0x714c                        
  13d1  1083FFFF       CMPD #0xffff                      
  13d5  10270002       LBEQ 0x13db                       
  13d9  2025           BRA 0x1400                        
LAB_M65_r2_08000__13db:
  13db  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $01F4 $0000 $0000 ->$13A1 ->$1395 $0001 $0001 $0000
  13df  01             db 1h                             
  13e0  01             db 1h                             
  13e1  02             db 2h                             
  13e2  01             db 1h                             
  13e3  01             db 1h                             
  13e4  00             db 0h                             
  13e5  04             db 4h                             
  13e6  80             db 80h                            
  13e7  01F4           dw 1F4h                           
  13e9  0000           dw 0h                             
  13eb  0000           dw 0h                             
  13ed  13A1           addr M65_r2_08000::13a1           
  13ef  1395           addr M65_r2_08000::1395           
  13f1  0001           dw 1h                             
  13f3  0001           dw 1h                             
  13f5  0000           dw 0h                             
LAB_M65_r2_08000__13f7:
  13f7  17FFA7         LBSR 0x13a1                       
  13fa  CC01F4         LDD #0x1f4                        
  13fd  FD606C         STD 0x606c                        
LAB_M65_r2_08000__1400:
  1400  3506           PULS  A B                         
  1402  39             RTS                               

; ---- function FUN_M65_r2_08000__1403
FUN_M65_r2_08000__1403:
  1403  3476           PSHS  U Y X B A                   
  1405  FC714C         LDD 0x714c                        
  1408  10830000       CMPD #0x0                         
  140c  1027001D       LBEQ 0x142d                       
  1410  CC0000         LDD #0x0                          
  1413  3606           PSHU  B A                         
  1415  CC01F4         LDD #0x1f4                        
  1418  3606           PSHU  B A                         
  141a  FC7056         LDD 0x7056                        
  141d  F37058         ADDD 0x7058                       
  1420  3606           PSHU  B A                         
  1422  AD9FFCD8       JSR [0xfcd8]                      
  1426  3706           PULU  A B                         
  1428  FD705A         STD 0x705a                        
  142b  2007           BRA 0x1434                        
LAB_M65_r2_08000__142d:
  142d  8E134E         LDX #0x134e                       
  1430  AD9FFE76       JSR [0xfe76]                      
LAB_M65_r2_08000__1434:
  1434  CC002C         LDD #0x2c                         
  1437  3606           PSHU  B A                         
  1439  FC705A         LDD 0x705a                        
  143c  3606           PSHU  B A                         
  143e  AD9FFCEE       JSR [0xfcee]                      
  1442  3706           PULU  A B                         
  1444  FD70D2         STD 0x70d2                        
  1447  171887         LBSR 0x2cd1                       
  144a  3576           PULS  A B X Y U                   
  144c  39             RTS                               
PTR_FUN_M65_r2_08000__1516_M65_r2_08000__144d:
  144d  1516           addr M65_r2_08000::1516           
  144f  14A0           addr M65_r2_08000::14a0           
  1451  .db 14 94 70 5E 70 60 00 00 70 62 71 70 71 A5 07 00  ; ..p^p`..pbqpq...
  1461  .db 00 03 E8 00 01 00 04 20 14 73 00 00 00 00 70 64  ; ....... .s....pd
  1471  .db 71 A7 14 72 69 67 68 74 20 64 65 6C 61 79 3A 20  ; q..right delay: 
  1481  .db 20 20 20 20 20 6D 53                             ;      mS

; ---- function FUN_M65_r2_08000__1488
FUN_M65_r2_08000__1488:
  1488  3410           PSHS  X                           
  148a  8E144D         LDX #0x144d                        ; desc[API_FDBC]: ->$1516 ->$14A0
  148d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...M"
  1491  3510           PULS  X                           
  1493  39             RTS                               

; ---- function FUN_M65_r2_08000__1494
FUN_M65_r2_08000__1494:
  1494  3410           PSHS  X                           
  1496  8E144D         LDX #0x144d                        ; desc[API_FE6C]: ->$1516 ->$14A0
  1499  AD9FFE6C       JSR [0xfe6c]                      
  149d  3510           PULS  X                           
  149f  39             RTS                               

; ---- function FUN_M65_r2_08000__14a0
FUN_M65_r2_08000__14a0:
  14a0  3410           PSHS  X                           
  14a2  8E144D         LDX #0x144d                        ; desc[API_FE6E]: ->$1516 ->$14A0
  14a5  AD9FFE6E       JSR [0xfe6e]                      
  14a9  3510           PULS  X                           
  14ab  39             RTS                               

; ---- function FUN_M65_r2_08000__14ac
FUN_M65_r2_08000__14ac:
  14ac  3410           PSHS  X                           
  14ae  8E144D         LDX #0x144d                        ; desc[API_FE1C]: ->$1516 ->$14A0
  14b1  AD9FFE1C       JSR [0xfe1c]                      
  14b5  3510           PULS  X                           
  14b7  39             RTS                               

; ---- function FUN_M65_r2_08000__14b8
FUN_M65_r2_08000__14b8:
  14b8  3410           PSHS  X                           
  14ba  8E144D         LDX #0x144d                        ; desc[API_FE1A]: ->$1516 ->$14A0 $1494
  14bd  AD9FFE1A       JSR [0xfe1a]                      
  14c1  3510           PULS  X                           
  14c3  39             RTS                               

; ---- function FUN_M65_r2_08000__14c4
FUN_M65_r2_08000__14c4:
  14c4  3406           PSHS  B A                         
  14c6  8E144D         LDX #0x144d                        ; desc[API_FE6A]: ->$1516 ->$14A0
  14c9  AD9FFE6A       JSR [0xfe6a]                      
  14cd  FC714A         LDD 0x714a                        
  14d0  10830000       CMPD #0x0                         
  14d4  1027000D       LBEQ 0x14e5                       
  14d8  FC7154         LDD 0x7154                        
  14db  10830000       CMPD #0x0                         
  14df  10270002       LBEQ 0x14e5                       
  14e3  2010           BRA 0x14f5                        
LAB_M65_r2_08000__14e5:
  14e5  C614           LDB #0x14                         
  14e7  AD9FFC36       JSR [0xfc36]                      
  14eb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "l & r"
  14ef  6C2026207200   char[6] "l & r"                   
LAB_M65_r2_08000__14f5:
  14f5  FC714C         LDD 0x714c                        
  14f8  10830000       CMPD #0x0                         
  14fc  10270013       LBEQ 0x1513                       
  1500  FC7154         LDD 0x7154                        
  1503  10830000       CMPD #0x0                         
  1507  10270008       LBEQ 0x1513                       
  150b  CC01F4         LDD #0x1f4                        
  150e  FD606C         STD 0x606c                        
  1511  2000           BRA 0x1513                        
LAB_M65_r2_08000__1513:
  1513  3506           PULS  A B                         
  1515  39             RTS                               

; ---- function FUN_M65_r2_08000__1516
FUN_M65_r2_08000__1516:
  1516  3476           PSHS  U Y X B A                   
  1518  FC714C         LDD 0x714c                        
  151b  10830000       CMPD #0x0                         
  151f  10270028       LBEQ 0x154b                       
  1523  FC7154         LDD 0x7154                        
  1526  10830000       CMPD #0x0                         
  152a  1027001D       LBEQ 0x154b                       
  152e  CC0000         LDD #0x0                          
  1531  3606           PSHU  B A                         
  1533  CC01F4         LDD #0x1f4                        
  1536  3606           PSHU  B A                         
  1538  FC705E         LDD 0x705e                        
  153b  F37060         ADDD 0x7060                       
  153e  3606           PSHU  B A                         
  1540  AD9FFCD8       JSR [0xfcd8]                      
  1544  3706           PULU  A B                         
  1546  FD7062         STD 0x7062                        
  1549  202B           BRA 0x1576                        
LAB_M65_r2_08000__154b:
  154b  8E144D         LDX #0x144d                       
  154e  AD9FFE76       JSR [0xfe76]                      
  1552  FC7154         LDD 0x7154                        
  1555  1083FFFF       CMPD #0xffff                      
  1559  10270019       LBEQ 0x1576                       
  155d  FC7062         LDD 0x7062                        
  1560  FD705A         STD 0x705a                        
  1563  CC002C         LDD #0x2c                         
  1566  3606           PSHU  B A                         
  1568  FC705A         LDD 0x705a                        
  156b  3606           PSHU  B A                         
  156d  AD9FFCEE       JSR [0xfcee]                      
  1571  3706           PULU  A B                         
  1573  FD70D2         STD 0x70d2                        
LAB_M65_r2_08000__1576:
  1576  CC002C         LDD #0x2c                         
  1579  3606           PSHU  B A                         
  157b  FC7062         LDD 0x7062                        
  157e  3606           PSHU  B A                         
  1580  AD9FFCEE       JSR [0xfcee]                      
  1584  3706           PULU  A B                         
  1586  FD70D4         STD 0x70d4                        
  1589  171745         LBSR 0x2cd1                       
  158c  3576           PULS  A B X Y U                   
  158e  39             RTS                               
PTR_FUN_M65_r2_08000__1612_M65_r2_08000__158f:
  158f  1612           addr M65_r2_08000::1612           
  1591  15D9           addr M65_r2_08000::15d9           
  1593  .db 15 CD 70 AE 70 B0 00 00 70 B2 71 70 71 B9 05 00  ; ..p.p...p.qpq...
  15a3  .db 01 05 78 00 01 00 04 1F 15 FD 00 00 00 00 70 B4  ; ..x...........p.
  15b3  .db 71 BB                                            ; q.

; ---- function FUN_M65_r2_08000__15b5
FUN_M65_r2_08000__15b5:
  15b5  3410           PSHS  X                           
  15b7  8E158F         LDX #0x158f                        ; desc[API_FE6A]: ->$1612 ->$15D9
  15ba  AD9FFE6A       JSR [0xfe6a]                      
  15be  3510           PULS  X                           
  15c0  39             RTS                               

; ---- function FUN_M65_r2_08000__15c1
FUN_M65_r2_08000__15c1:
  15c1  3410           PSHS  X                           
  15c3  8E158F         LDX #0x158f                        ; desc[API_FDBC]: ->$1612 ->$15D9
  15c6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  15ca  3510           PULS  X                           
  15cc  39             RTS                               

; ---- function FUN_M65_r2_08000__15cd
FUN_M65_r2_08000__15cd:
  15cd  3410           PSHS  X                           
  15cf  8E158F         LDX #0x158f                        ; desc[API_FE6C]: ->$1612 ->$15D9
  15d2  AD9FFE6C       JSR [0xfe6c]                      
  15d6  3510           PULS  X                           
  15d8  39             RTS                               

; ---- function FUN_M65_r2_08000__15d9
FUN_M65_r2_08000__15d9:
  15d9  3410           PSHS  X                           
  15db  8E158F         LDX #0x158f                        ; desc[API_FE6E]: ->$1612 ->$15D9
  15de  AD9FFE6E       JSR [0xfe6e]                      
  15e2  3510           PULS  X                           
  15e4  39             RTS                               

; ---- function FUN_M65_r2_08000__15e5
FUN_M65_r2_08000__15e5:
  15e5  3410           PSHS  X                           
  15e7  8E158F         LDX #0x158f                        ; desc[API_FE1C]: ->$1612 ->$15D9
  15ea  AD9FFE1C       JSR [0xfe1c]                      
  15ee  3510           PULS  X                           
  15f0  39             RTS                               

; ---- function FUN_M65_r2_08000__15f1
FUN_M65_r2_08000__15f1:
  15f1  3410           PSHS  X                           
  15f3  8E158F         LDX #0x158f                        ; desc[API_FE1A]: ->$1612 ->$15D9 $15CD
  15f6  AD9FFE1A       JSR [0xfe1a]                      
  15fa  3510           PULS  X                           
  15fc  39             RTS                               
  15fd  .db 14 6C 20 6C 65 6E 67 74 68 3A 20 20 20 20 20 20  ; .l length:      
  160d  .db 6D 53 20 20 20                                   ; mS   

; ---- function FUN_M65_r2_08000__1612
FUN_M65_r2_08000__1612:
  1612  3476           PSHS  U Y X B A                   
  1614  8E158F         LDX #0x158f                       
  1617  AD9FFE76       JSR [0xfe76]                      
  161b  FC70B2         LDD 0x70b2                        
  161e  3606           PSHU  B A                         
  1620  CC002C         LDD #0x2c                         
  1623  3606           PSHU  B A                         
  1625  AD9FFCEE       JSR [0xfcee]                      
  1629  3706           PULU  A B                         
  162b  FD70F6         STD 0x70f6                        
  162e  CC7FFF         LDD #0x7fff                       
  1631  3606           PSHU  B A                         
  1633  FC70F6         LDD 0x70f6                        
  1636  2C08           BGE 0x1640                        
  1638  3606           PSHU  B A                         
  163a  AD9FFCC8       JSR [0xfcc8]                      
  163e  3706           PULU  A B                         
LAB_M65_r2_08000__1640:
  1640  44             LSRA                              
  1641  56             RORB                              
  1642  44             LSRA                              
  1643  56             RORB                              
  1644  44             LSRA                              
  1645  56             RORB                              
  1646  3606           PSHU  B A                         
  1648  AD9FFCEA       JSR [0xfcea]                      
  164c  3706           PULU  A B                         
  164e  C30001         ADDD #0x1                         
  1651  FD70F8         STD 0x70f8                        
  1654  CC000A         LDD #0xa                          
  1657  AD9FFD20       JSR [0xfd20]                      
  165b  108E0141       LDY #0x141                        
  165f  CC0000         LDD #0x0                          
  1662  AD9FFD2E       JSR [0xfd2e]                      
  1666  CC000A         LDD #0xa                          
  1669  AD9FFD20       JSR [0xfd20]                      
  166d  108E0142       LDY #0x142                        
  1671  FC70F8         LDD 0x70f8                        
  1674  AD9FFD2E       JSR [0xfd2e]                      
  1678  CC000A         LDD #0xa                          
  167b  AD9FFD20       JSR [0xfd20]                      
  167f  108E0142       LDY #0x142                        
  1683  FC70F8         LDD 0x70f8                        
  1686  AD9FFD2E       JSR [0xfd2e]                      
  168a  FC70F6         LDD 0x70f6                        
  168d  AD9FFD3C       JSR [0xfd3c]                      
  1691  3576           PULS  A B X Y U                   
  1693  39             RTS                               
PTR_FUN_M65_r2_08000__1717_M65_r2_08000__1694:
  1694  1717           addr M65_r2_08000::1717           
  1696  16DE           addr M65_r2_08000::16de           
  1698  .db 16 D2 70 B6 70 B8 00 00 70 BA 71 70 71 A5 07 00  ; ..p.p...p.qpq...
  16a8  .db 01 05 78 00 01 00 04 1F 17 02 00 00 00 00 70 BC  ; ..x...........p.
  16b8  .db 71 A7                                            ; q.

; ---- function FUN_M65_r2_08000__16ba
FUN_M65_r2_08000__16ba:
  16ba  3410           PSHS  X                           
  16bc  8E1694         LDX #0x1694                        ; desc[API_FE6A]: ->$1717 ->$16DE
  16bf  AD9FFE6A       JSR [0xfe6a]                      
  16c3  3510           PULS  X                           
  16c5  39             RTS                               

; ---- function FUN_M65_r2_08000__16c6
FUN_M65_r2_08000__16c6:
  16c6  3410           PSHS  X                           
  16c8  8E1694         LDX #0x1694                        ; desc[API_FDBC]: ->$1717 ->$16DE
  16cb  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  16cf  3510           PULS  X                           
  16d1  39             RTS                               

; ---- function FUN_M65_r2_08000__16d2
FUN_M65_r2_08000__16d2:
  16d2  3410           PSHS  X                           
  16d4  8E1694         LDX #0x1694                        ; desc[API_FE6C]: ->$1717 ->$16DE
  16d7  AD9FFE6C       JSR [0xfe6c]                      
  16db  3510           PULS  X                           
  16dd  39             RTS                               

; ---- function FUN_M65_r2_08000__16de
FUN_M65_r2_08000__16de:
  16de  3410           PSHS  X                           
  16e0  8E1694         LDX #0x1694                        ; desc[API_FE6E]: ->$1717 ->$16DE
  16e3  AD9FFE6E       JSR [0xfe6e]                      
  16e7  3510           PULS  X                           
  16e9  39             RTS                               

; ---- function FUN_M65_r2_08000__16ea
FUN_M65_r2_08000__16ea:
  16ea  3410           PSHS  X                           
  16ec  8E1694         LDX #0x1694                        ; desc[API_FE1C]: ->$1717 ->$16DE
  16ef  AD9FFE1C       JSR [0xfe1c]                      
  16f3  3510           PULS  X                           
  16f5  39             RTS                               

; ---- function FUN_M65_r2_08000__16f6
FUN_M65_r2_08000__16f6:
  16f6  3410           PSHS  X                           
  16f8  8E1694         LDX #0x1694                        ; desc[API_FE1A]: ->$1717 ->$16DE $16D2
  16fb  AD9FFE1A       JSR [0xfe1a]                      
  16ff  3510           PULS  X                           
  1701  39             RTS                               
  1702  .db 14 72 20 6C 65 6E 67 74 68 3A 20 20 20 20 20 20  ; .r length:      
  1712  .db 6D 53 20 20 20                                   ; mS   

; ---- function FUN_M65_r2_08000__1717
FUN_M65_r2_08000__1717:
  1717  3476           PSHS  U Y X B A                   
  1719  8E1694         LDX #0x1694                       

; ---- function FUN_M65_r2_08000__171c
FUN_M65_r2_08000__171c:
  171c  AD9FFE76       JSR [0xfe76]                      

; ---- function FUN_M65_r2_08000__1720
FUN_M65_r2_08000__1720:
  1720  FC70BA         LDD 0x70ba                        
  1723  3606           PSHU  B A                         
  1725  CC002C         LDD #0x2c                         
  1728  3606           PSHU  B A                         
  172a  AD9FFCEE       JSR [0xfcee]                      
  172e  3706           PULU  A B                         
  1730  FD70F6         STD 0x70f6                        
  1733  CC7FFF         LDD #0x7fff                       
  1736  3606           PSHU  B A                         
  1738  FC70F6         LDD 0x70f6                        
  173b  2C08           BGE 0x1745                        
  173d  3606           PSHU  B A                         
  173f  AD9FFCC8       JSR [0xfcc8]                      
  1743  3706           PULU  A B                         
LAB_M65_r2_08000__1745:
  1745  44             LSRA                              
  1746  56             RORB                              
  1747  44             LSRA                              
  1748  56             RORB                              
  1749  44             LSRA                              
  174a  56             RORB                              
  174b  3606           PSHU  B A                         
  174d  AD9FFCEA       JSR [0xfcea]                      
  1751  3706           PULU  A B                         
  1753  C30001         ADDD #0x1                         
  1756  FD70F8         STD 0x70f8                        
  1759  CC000A         LDD #0xa                          
  175c  AD9FFD20       JSR [0xfd20]                      
  1760  108E0241       LDY #0x241                        
  1764  CC0000         LDD #0x0                          
  1767  AD9FFD2E       JSR [0xfd2e]                      
  176b  CC000A         LDD #0xa                          
  176e  AD9FFD20       JSR [0xfd20]                      
  1772  108E0242       LDY #0x242                        
  1776  FC70F8         LDD 0x70f8                        
  1779  AD9FFD2E       JSR [0xfd2e]                      
  177d  CC000A         LDD #0xa                          
  1780  AD9FFD20       JSR [0xfd20]                      
  1784  108E0242       LDY #0x242                        
  1788  FC70F8         LDD 0x70f8                        
  178b  AD9FFD2E       JSR [0xfd2e]                      
  178f  FC70F6         LDD 0x70f6                        
  1792  AD9FFD44       JSR [0xfd44]                      
  1796  3576           PULS  A B X Y U                   
  1798  39             RTS                               

; ---- function FUN_M65_r2_08000__1799
FUN_M65_r2_08000__1799:
  1799  3426           PSHS  Y B A                       
  179b  AD9FFC8E       JSR [0xfc8e]                      
  179f  FC60F9         LDD 0x60f9                        
  17a2  FD7004         STD 0x7004                        
  17a5  FD6074         STD 0x6074                        
  17a8  1700A3         LBSR 0x184e                       
  17ab  CC71A3         LDD #0x71a3                       
  17ae  837170         SUBD #0x7170                      
  17b1  1F02           TFR D,Y                           
  17b3  FC7004         LDD 0x7004                        
  17b6  AD9FFC80       JSR [0xfc80]                      
  17ba  3526           PULS  A B Y                       
  17bc  39             RTS                               

; ---- function FUN_M65_r2_08000__17bd
FUN_M65_r2_08000__17bd:
  17bd  3406           PSHS  B A                         
  17bf  FC7004         LDD 0x7004                        
  17c2  FD6074         STD 0x6074                        
  17c5  17F262         LBSR 0x0a2a                       
  17c8  C613           LDB #0x13                         
  17ca  AD9FFC36       JSR [0xfc36]                      
  17ce  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " major key:          "
  17d2  0A6D616A6F72.. char[22] "\nmajor key:          " 
LAB_M65_r2_08000__17e8:
  17e8  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $000B $0000 $0000 ->$1833 ->$180A $0001 $0001 $0000
  17ec  01             db 1h                             
  17ed  01             db 1h                             
  17ee  02             db 2h                             
  17ef  01             db 1h                             
  17f0  01             db 1h                             
  17f1  00             db 0h                             
  17f2  02             db 2h                             
  17f3  80             db 80h                            
  17f4  000B           dw Bh                             
  17f6  0000           dw 0h                             
  17f8  0000           dw 0h                             
  17fa  1833           addr M65_r2_08000::1833           
  17fc  180A           addr M65_r2_08000::180a           
  17fe  0001           dw 1h                             
  1800  0001           dw 1h                             
  1802  0000           dw 0h                             
LAB_M65_r2_08000__1804:
  1804  17002C         LBSR 0x1833                       
  1807  3506           PULS  A B                         
  1809  39             RTS                               

; ---- function FUN_M65_r2_08000__180a
FUN_M65_r2_08000__180a:
  180a  3426           PSHS  Y B A                       
  180c  FC6074         LDD 0x6074                        
  180f  FD7004         STD 0x7004                        
  1812  CC71A3         LDD #0x71a3                       
  1815  837170         SUBD #0x7170                      
  1818  1F02           TFR D,Y                           
  181a  FC7004         LDD 0x7004                        
  181d  AD9FFC80       JSR [0xfc80]                      
  1821  108E0004       LDY #0x4                          
  1825  FC7004         LDD 0x7004                        
  1828  AD9FFE40       JSR [0xfe40]                      
  182c  8D05           BSR 0x1833                        
  182e  8D1E           BSR 0x184e                        
  1830  3526           PULS  A B Y                       
  1832  39             RTS                               

; ---- function FUN_M65_r2_08000__1833
FUN_M65_r2_08000__1833:
  1833  C61F           LDB #0x1f                         
  1835  AD9FFC36       JSR [0xfc36]                      
  1839  FC7004         LDD 0x7004                        
  183c  8602           LDA #0x2                          
  183e  3D             MUL                               
  183f  C31853         ADDD #0x1853                      
  1842  F3600D         ADDD 0x600d                       
  1845  1F01           TFR D,X                           
  1847  C602           LDB #0x2                          
  1849  AD9FFC3A       JSR [0xfc3a]                      
  184d  39             RTS                               

; ---- function FUN_M65_r2_08000__184e
FUN_M65_r2_08000__184e:
  184e  3416           PSHS  X B A                       
  1850  3516           PULS  A B X                       
  1852  39             RTS                               
  1853  .db 43 20 43 23 44 20 45 62 45 20 46 20 46 23 47 20  ; C C#D EbE F F#G 
  1863  .db 41 62 41 20 42 62 42 20                          ; AbA BbB 

; ---- function FUN_M65_r2_08000__186b
FUN_M65_r2_08000__186b:
  186b  3406           PSHS  B A                         
  186d  FC7008         LDD 0x7008                        
  1870  FD6074         STD 0x6074                        
  1873  17F1B4         LBSR 0x0a2a                       
  1876  C613           LDB #0x13                         
  1878  AD9FFC36       JSR [0xfc36]                      
  187c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " note    :      cents"
  1880  0A6E6F746520.. char[22] "\nnote    :      cents" 
LAB_M65_r2_08000__1896:
  1896  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0016 $0000 $0000 ->$18C7 ->$18B8 $0002 $0002 $0000
  189a  01             db 1h                             
  189b  01             db 1h                             
  189c  02             db 2h                             
  189d  01             db 1h                             
  189e  01             db 1h                             
  189f  00             db 0h                             
  18a0  02             db 2h                             
  18a1  80             db 80h                            
  18a2  0016           dw 16h                            
  18a4  0000           dw 0h                             
  18a6  0000           dw 0h                             
  18a8  18C7           addr M65_r2_08000::18c7           
  18aa  18B8           addr M65_r2_08000::18b8           
  18ac  0002           dw 2h                             
  18ae  0002           dw 2h                             
  18b0  0000           dw 0h                             
LAB_M65_r2_08000__18b2:
  18b2  170012         LBSR 0x18c7                       
  18b5  3506           PULS  A B                         
  18b7  39             RTS                               

; ---- function FUN_M65_r2_08000__18b8
FUN_M65_r2_08000__18b8:
  18b8  3426           PSHS  Y B A                       
  18ba  FC6074         LDD 0x6074                        
  18bd  FD7008         STD 0x7008                        
  18c0  8D05           BSR 0x18c7                        
  18c2  8D43           BSR 0x1907                        
  18c4  3526           PULS  A B Y                       
  18c6  39             RTS                               

; ---- function FUN_M65_r2_08000__18c7
FUN_M65_r2_08000__18c7:
  18c7  C61A           LDB #0x1a                         
  18c9  AD9FFC36       JSR [0xfc36]                      
  18cd  FC7008         LDD 0x7008                        
  18d0  FD70F6         STD 0x70f6                        
  18d3  C31853         ADDD #0x1853                      
  18d6  F3600D         ADDD 0x600d                       
  18d9  1F01           TFR D,X                           
  18db  C602           LDB #0x2                          
  18dd  AD9FFC3A       JSR [0xfc3a]                      
  18e1  FC7008         LDD 0x7008                        
  18e4  F37014         ADDD 0x7014                       
  18e7  1F01           TFR D,X                           
  18e9  EC84           LDD ,X                            
  18eb  3606           PSHU  B A                         
  18ed  8600           LDA #0x0                          
  18ef  108E7112       LDY #0x7112                       
  18f3  AD9FFC40       JSR [0xfc40]                      
  18f7  C61D           LDB #0x1d                         
  18f9  AD9FFC36       JSR [0xfc36]                      
  18fd  C605           LDB #0x5                          
  18ff  8E7116         LDX #0x7116                       
  1902  AD9FFC3A       JSR [0xfc3a]                      
  1906  39             RTS                               

; ---- function FUN_M65_r2_08000__1907
FUN_M65_r2_08000__1907:
  1907  39             RTS                               

; ---- function FUN_M65_r2_08000__1908
FUN_M65_r2_08000__1908:
  1908  3436           PSHS  Y X B A                     
  190a  AD9FFC8E       JSR [0xfc8e]                      
  190e  FC6103         LDD 0x6103                        
  1911  83000B         SUBD #0xb                         
  1914  58             LSLB                              
  1915  49             ROLA                              
  1916  10830018       CMPD #0x18                        
  191a  2C0B           BGE 0x1927                        
  191c  FD7008         STD 0x7008                        
  191f  CC7016         LDD #0x7016                       
  1922  FD7014         STD 0x7014                        
  1925  200C           BRA 0x1933                        
LAB_M65_r2_08000__1927:
  1927  830018         SUBD #0x18                        
  192a  FD7008         STD 0x7008                        
  192d  CC7016         LDD #0x7016                       
  1930  FD7014         STD 0x7014                        
LAB_M65_r2_08000__1933:
  1933  FC60F9         LDD 0x60f9                        
  1936  FD6074         STD 0x6074                        
  1939  170053         LBSR 0x198f                       
  193c  3536           PULS  A B X Y                     
  193e  39             RTS                               

; ---- function FUN_M65_r2_08000__193f
FUN_M65_r2_08000__193f:
  193f  3406           PSHS  B A                         
  1941  FC700E         LDD 0x700e                        
  1944  FD6074         STD 0x6074                        
  1947  17F0E0         LBSR 0x0a2a                       
  194a  C613           LDB #0x13                         
  194c  AD9FFC36       JSR [0xfc36]                      
  1950  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " note    :      cents"
  1954  0A6E6F746520.. char[22] "\nnote    :      cents" 
LAB_M65_r2_08000__196a:
  196a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$19D4 ->$198F $0064 $0064 $0000
  196e  01             db 1h                             
  196f  01             db 1h                             
  1970  02             db 2h                             
  1971  01             db 1h                             
  1972  01             db 1h                             
  1973  00             db 0h                             
  1974  05             db 5h                             
  1975  80             db 80h                            
  1976  04B0           dw 4B0h                           
  1978  F6A0           dw F6A0h                          
  197a  0000           dw 0h                             
  197c  19D4           addr M65_r2_08000::19d4           
  197e  198F           addr M65_r2_08000::198f           
  1980  0064           dw 64h                            
  1982  0064           dw 64h                            
  1984  0000           dw 0h                             
LAB_M65_r2_08000__1986:
  1986  17004B         LBSR 0x19d4                       
  1989  17FF3B         LBSR 0x18c7                       
  198c  3506           PULS  A B                         
  198e  39             RTS                               

; ---- function FUN_M65_r2_08000__198f
FUN_M65_r2_08000__198f:
  198f  3436           PSHS  Y X B A                     
  1991  FC6074         LDD 0x6074                        
  1994  FD700E         STD 0x700e                        
  1997  FC7008         LDD 0x7008                        
  199a  F37014         ADDD 0x7014                       
  199d  1F01           TFR D,X                           
  199f  FC6074         LDD 0x6074                        
  19a2  ED84           STD ,X                            
  19a4  1F10           TFR X,D                           
  19a6  837016         SUBD #0x7016                      
  19a9  C371CB         ADDD #0x71cb                      
  19ac  837170         SUBD #0x7170                      
  19af  1F02           TFR D,Y                           
  19b1  EC84           LDD ,X                            
  19b3  AD9FFC82       JSR [0xfc82]                      
  19b7  FC7008         LDD 0x7008                        
  19ba  F37014         ADDD 0x7014                       
  19bd  837016         SUBD #0x7016                      
  19c0  47             ASRA                              
  19c1  56             RORB                              
  19c2  C3000B         ADDD #0xb                         
  19c5  1F02           TFR D,Y                           
  19c7  EC84           LDD ,X                            
  19c9  AD9FFE40       JSR [0xfe40]                      
  19cd  8D05           BSR 0x19d4                        
  19cf  8D18           BSR 0x19e9                        
  19d1  3536           PULS  A B X Y                     
  19d3  39             RTS                               

; ---- function FUN_M65_r2_08000__19d4
FUN_M65_r2_08000__19d4:
  19d4  3416           PSHS  X B A                       
  19d6  C61D           LDB #0x1d                         
  19d8  AD9FFC36       JSR [0xfc36]                      
  19dc  CC0005         LDD #0x5                          
  19df  8E609E         LDX #0x609e                       
  19e2  AD9FFC3A       JSR [0xfc3a]                      
  19e6  3516           PULS  A B X                       
  19e8  39             RTS                               

; ---- function FUN_M65_r2_08000__19e9
FUN_M65_r2_08000__19e9:
  19e9  39             RTS                               

; ---- function FUN_M65_r2_08000__19ea
FUN_M65_r2_08000__19ea:
  19ea  3426           PSHS  Y B A                       
  19ec  AD9FFC8E       JSR [0xfc8e]                      
  19f0  FC60F9         LDD 0x60f9                        
  19f3  FD7000         STD 0x7000                        
  19f6  FD6074         STD 0x6074                        
  19f9  1700A3         LBSR 0x1a9f                       
  19fc  CC71A1         LDD #0x71a1                       
  19ff  837170         SUBD #0x7170                      
  1a02  1F02           TFR D,Y                           
  1a04  FC7000         LDD 0x7000                        
  1a07  AD9FFC80       JSR [0xfc80]                      
  1a0b  3526           PULS  A B Y                       
  1a0d  39             RTS                               

; ---- function FUN_M65_r2_08000__1a0e
FUN_M65_r2_08000__1a0e:
  1a0e  3406           PSHS  B A                         
  1a10  FC7000         LDD 0x7000                        
  1a13  FD6074         STD 0x6074                        
  1a16  17F011         LBSR 0x0a2a                       
  1a19  C613           LDB #0x13                         
  1a1b  AD9FFC36       JSR [0xfc36]                      
  1a1f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l voice:            "
  1a23  0A6C20766F69.. char[22] "\nl voice:            " 
LAB_M65_r2_08000__1a39:
  1a39  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1A84 ->$1A5B $0001 $0001 $0000
  1a3d  01             db 1h                             
  1a3e  01             db 1h                             
  1a3f  02             db 2h                             
  1a40  01             db 1h                             
  1a41  01             db 1h                             
  1a42  00             db 0h                             
  1a43  02             db 2h                             
  1a44  80             db 80h                            
  1a45  0014           dw 14h                            
  1a47  0000           dw 0h                             
  1a49  0000           dw 0h                             
  1a4b  1A84           addr M65_r2_08000::1a84           
  1a4d  1A5B           addr M65_r2_08000::1a5b           
  1a4f  0001           dw 1h                             
  1a51  0001           dw 1h                             
  1a53  0000           dw 0h                             
LAB_M65_r2_08000__1a55:
  1a55  17002C         LBSR 0x1a84                       
  1a58  3506           PULS  A B                         
  1a5a  39             RTS                               

; ---- function FUN_M65_r2_08000__1a5b
FUN_M65_r2_08000__1a5b:
  1a5b  3426           PSHS  Y B A                       
  1a5d  FC6074         LDD 0x6074                        
  1a60  FD7000         STD 0x7000                        
  1a63  CC71A1         LDD #0x71a1                       
  1a66  837170         SUBD #0x7170                      
  1a69  1F02           TFR D,Y                           
  1a6b  FC7000         LDD 0x7000                        
  1a6e  AD9FFC80       JSR [0xfc80]                      
  1a72  108E0005       LDY #0x5                          
  1a76  FC7000         LDD 0x7000                        
  1a79  AD9FFE40       JSR [0xfe40]                      
  1a7d  8D05           BSR 0x1a84                        
  1a7f  8D1E           BSR 0x1a9f                        
  1a81  3526           PULS  A B Y                       
  1a83  39             RTS                               

; ---- function FUN_M65_r2_08000__1a84
FUN_M65_r2_08000__1a84:
  1a84  C61C           LDB #0x1c                         
  1a86  AD9FFC36       JSR [0xfc36]                      
  1a8a  FC7000         LDD 0x7000                        
  1a8d  860A           LDA #0xa                          
  1a8f  3D             MUL                               
  1a90  C31BE9         ADDD #0x1be9                      
  1a93  F3600D         ADDD 0x600d                       
  1a96  1F01           TFR D,X                           
  1a98  C60A           LDB #0xa                          
  1a9a  AD9FFC3A       JSR [0xfc3a]                      
  1a9e  39             RTS                               

; ---- function FUN_M65_r2_08000__1a9f
FUN_M65_r2_08000__1a9f:
  1a9f  3416           PSHS  X B A                       
  1aa1  FC7000         LDD 0x7000                        
  1aa4  10830012       CMPD #0x12                        
  1aa8  2F16           BLE 0x1ac0                        
  1aaa  10830014       CMPD #0x14                        
  1aae  2708           BEQ 0x1ab8                        
  1ab0  CC7016         LDD #0x7016                       
  1ab3  FD70F0         STD 0x70f0                        
  1ab6  201A           BRA 0x1ad2                        
LAB_M65_r2_08000__1ab8:
  1ab8  CC702E         LDD #0x702e                       
  1abb  FD70F0         STD 0x70f0                        
  1abe  2012           BRA 0x1ad2                        
LAB_M65_r2_08000__1ac0:
  1ac0  58             LSLB                              
  1ac1  49             ROLA                              
  1ac2  C31BC3         ADDD #0x1bc3                      
  1ac5  F3600D         ADDD 0x600d                       
  1ac8  1F01           TFR D,X                           
  1aca  EC84           LDD ,X                            
  1acc  F3600D         ADDD 0x600d                       
  1acf  FD70F0         STD 0x70f0                        
LAB_M65_r2_08000__1ad2:
  1ad2  3516           PULS  A B X                       
  1ad4  39             RTS                               

; ---- function FUN_M65_r2_08000__1ad5
FUN_M65_r2_08000__1ad5:
  1ad5  3426           PSHS  Y B A                       
  1ad7  AD9FFC8E       JSR [0xfc8e]                      
  1adb  FC60F9         LDD 0x60f9                        
  1ade  FD7002         STD 0x7002                        
  1ae1  FD6074         STD 0x6074                        
  1ae4  1700A3         LBSR 0x1b8a                       
  1ae7  CC71A2         LDD #0x71a2                       
  1aea  837170         SUBD #0x7170                      
  1aed  1F02           TFR D,Y                           
  1aef  FC7002         LDD 0x7002                        
  1af2  AD9FFC80       JSR [0xfc80]                      
  1af6  3526           PULS  A B Y                       
  1af8  39             RTS                               

; ---- function FUN_M65_r2_08000__1af9
FUN_M65_r2_08000__1af9:
  1af9  3406           PSHS  B A                         
  1afb  FC7002         LDD 0x7002                        
  1afe  FD6074         STD 0x6074                        
  1b01  17EF26         LBSR 0x0a2a                       
  1b04  C613           LDB #0x13                         
  1b06  AD9FFC36       JSR [0xfc36]                      
  1b0a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " r voice:            "
  1b0e  0A7220766F69.. char[22] "\nr voice:            " 
LAB_M65_r2_08000__1b24:
  1b24  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1B6F ->$1B46 $0001 $0001 $0000
  1b28  01             db 1h                             
  1b29  01             db 1h                             
  1b2a  02             db 2h                             
  1b2b  01             db 1h                             
  1b2c  01             db 1h                             
  1b2d  00             db 0h                             
  1b2e  02             db 2h                             
  1b2f  80             db 80h                            
  1b30  0014           dw 14h                            
  1b32  0000           dw 0h                             
  1b34  0000           dw 0h                             
  1b36  1B6F           addr M65_r2_08000::1b6f           
  1b38  1B46           addr M65_r2_08000::1b46           
  1b3a  0001           dw 1h                             
  1b3c  0001           dw 1h                             
  1b3e  0000           dw 0h                             
LAB_M65_r2_08000__1b40:
  1b40  17002C         LBSR 0x1b6f                       
  1b43  3506           PULS  A B                         
  1b45  39             RTS                               

; ---- function FUN_M65_r2_08000__1b46
FUN_M65_r2_08000__1b46:
  1b46  3426           PSHS  Y B A                       
  1b48  FC6074         LDD 0x6074                        
  1b4b  FD7002         STD 0x7002                        
  1b4e  CC71A2         LDD #0x71a2                       
  1b51  837170         SUBD #0x7170                      
  1b54  1F02           TFR D,Y                           
  1b56  FC7002         LDD 0x7002                        
  1b59  AD9FFC80       JSR [0xfc80]                      
  1b5d  108E0006       LDY #0x6                          
  1b61  FC7002         LDD 0x7002                        
  1b64  AD9FFE40       JSR [0xfe40]                      
  1b68  8D05           BSR 0x1b6f                        
  1b6a  8D1E           BSR 0x1b8a                        
  1b6c  3526           PULS  A B Y                       
  1b6e  39             RTS                               

; ---- function FUN_M65_r2_08000__1b6f
FUN_M65_r2_08000__1b6f:
  1b6f  C61C           LDB #0x1c                         
  1b71  AD9FFC36       JSR [0xfc36]                      
  1b75  FC7002         LDD 0x7002                        
  1b78  860A           LDA #0xa                          
  1b7a  3D             MUL                               
  1b7b  C31BE9         ADDD #0x1be9                      
  1b7e  F3600D         ADDD 0x600d                       
  1b81  1F01           TFR D,X                           
  1b83  C60A           LDB #0xa                          
  1b85  AD9FFC3A       JSR [0xfc3a]                      
  1b89  39             RTS                               

; ---- function FUN_M65_r2_08000__1b8a
FUN_M65_r2_08000__1b8a:
  1b8a  3416           PSHS  X B A                       
  1b8c  FC7002         LDD 0x7002                        
  1b8f  10830012       CMPD #0x12                        
  1b93  2F16           BLE 0x1bab                        
  1b95  10830014       CMPD #0x14                        
  1b99  2708           BEQ 0x1ba3                        
  1b9b  CC7016         LDD #0x7016                       
  1b9e  FD70F2         STD 0x70f2                        
  1ba1  201D           BRA 0x1bc0                        
LAB_M65_r2_08000__1ba3:
  1ba3  CC702E         LDD #0x702e                       
  1ba6  FD70F2         STD 0x70f2                        
  1ba9  2015           BRA 0x1bc0                        
LAB_M65_r2_08000__1bab:
  1bab  FC7002         LDD 0x7002                        
  1bae  58             LSLB                              
  1baf  49             ROLA                              
  1bb0  C31BC3         ADDD #0x1bc3                      
  1bb3  F3600D         ADDD 0x600d                       
  1bb6  1F01           TFR D,X                           
  1bb8  EC84           LDD ,X                            
  1bba  F3600D         ADDD 0x600d                       
  1bbd  FD70F2         STD 0x70f2                        
LAB_M65_r2_08000__1bc0:
  1bc0  3516           PULS  A B X                       
  1bc2  39             RTS                               
  1bc3  .db 21 99 21 81 21 69 21 51 21 39 21 21 21 09 20 49  ; !.!.!i!Q!9!!!. I
  1bd3  .db 20 61 20 79 20 91 20 A9 20 C1 20 D9 20 F1 21 B1  ;  a y . . . . .!.
  1be3  .db 21 C9 21 E1 21 F9 20 2D 6F 63 74 61 76 65 20 20  ; !.!.!. -octave  
  1bf3  .db 20 2D 73 65 76 65 6E 74 68 20 20 2D 73 69 78 74  ;  -seventh  -sixt
  1c03  .db 68 20 20 20 20 2D 66 69 66 74 68 20 20 20 20 2D  ; h    -fifth    -
  1c13  .db 66 6F 75 72 74 68 20 20 20 2D 74 68 69 72 64 20  ; fourth   -third 
  1c23  .db 20 20 20 2D 73 65 63 6F 6E 64 20 20 20 75 6E 69  ;    -second   uni
  1c33  .db 73 6F 6E 20 20 20 20 2B 73 65 63 6F 6E 64 20 20  ; son    +second  
  1c43  .db 20 2B 74 68 69 72 64 20 20 20 20 2B 66 6F 75 72  ;  +third    +four
  1c53  .db 74 68 20 20 20 2B 66 69 66 74 68 20 20 20 20 2B  ; th   +fifth    +
  1c63  .db 73 69 78 74 68 20 20 20 20 2B 73 65 76 65 6E 74  ; sixth    +sevent
  1c73  .db 68 20 20 2B 6F 63 74 61 76 65 20 20 6C 6F 20 74  ; h  +octave  lo t
  1c83  .db 6F 6E 20 70 65 64 6C 6F 20 64 6F 6D 20 70 65 64  ; on pedlo dom ped
  1c93  .db 68 69 20 74 6F 6E 20 70 65 64 68 69 20 64 6F 6D  ; hi ton pedhi dom
  1ca3  .db 20 70 65 64 75 73 65 72 73 63 61 6C 65 31 75 73  ;  peduserscale1us
  1cb3  .db 65 72 73 63 61 6C 65 32                          ; erscale2

; ---- function FUN_M65_r2_08000__1cbb
FUN_M65_r2_08000__1cbb:
  1cbb  3436           PSHS  Y X B A                     
  1cbd  CC0000         LDD #0x0                          
  1cc0  FD70F4         STD 0x70f4                        
  1cc3  C600           LDB #0x0                          
  1cc5  AD9FFC36       JSR [0xfc36]                      
  1cc9  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "Play note - enter retunes:         cents"
  1ccd  506C6179206E.. char[41] "Play note - enter retunes:         cents"
LAB_M65_r2_08000__1cf6:
  1cf6  CC1E5D         LDD #0x1e5d                       
  1cf9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1cfd  600F           addr 600f                         
LAB_M65_r2_08000__1cff:
  1cff  CC0F0C         LDD #0xf0c                        
  1d02  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1d06  6072           addr 6072                         
LAB_M65_r2_08000__1d08:
  1d08  CC0F0C         LDD #0xf0c                        
  1d0b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1d0f  6070           addr 6070                         
LAB_M65_r2_08000__1d11:
  1d11  CC1D1D         LDD #0x1d1d                       
  1d14  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1d18  6038           addr 6038                         
LAB_M65_r2_08000__1d1a:
  1d1a  3536           PULS  A B X Y                     
  1d1c  39             RTS                               

; ---- function FUN_M65_r2_08000__1d1d
FUN_M65_r2_08000__1d1d:
  1d1d  170069         LBSR 0x1d89                       
  1d20  170010         LBSR 0x1d33                       
  1d23  CC71C9         LDD #0x71c9                       
  1d26  837170         SUBD #0x7170                      
  1d29  1F02           TFR D,Y                           
  1d2b  FC7006         LDD 0x7006                        
  1d2e  AD9FFC82       JSR [0xfc82]                      
  1d32  39             RTS                               

; ---- function FUN_M65_r2_08000__1d33
FUN_M65_r2_08000__1d33:
  1d33  3416           PSHS  X B A                       
  1d35  C600           LDB #0x0                          
  1d37  AD9FFC36       JSR [0xfc36]                      
  1d3b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "You are now tuned     cents from A440   "
  1d3f  596F75206172.. char[41] "You are now tuned     cents from A440   "
LAB_M65_r2_08000__1d68:
  1d68  C612           LDB #0x12                         
  1d6a  AD9FFC36       JSR [0xfc36]                      
  1d6e  FC7110         LDD 0x7110                        
  1d71  3606           PSHU  B A                         
  1d73  8600           LDA #0x0                          
  1d75  108E7112       LDY #0x7112                       
  1d79  AD9FFC40       JSR [0xfc40]                      
  1d7d  C603           LDB #0x3                          
  1d7f  8E7118         LDX #0x7118                       
  1d82  AD9FFC3A       JSR [0xfc3a]                      
  1d86  3516           PULS  A B X                       
  1d88  39             RTS                               

; ---- function FUN_M65_r2_08000__1d89
FUN_M65_r2_08000__1d89:
  1d89  3476           PSHS  U Y X B A                   
  1d8b  CC1EB7         LDD #0x1eb7                       
  1d8e  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1d92  600F           addr 600f                         
LAB_M65_r2_08000__1d94:
  1d94  CC0F0C         LDD #0xf0c                        
  1d97  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1d9b  6072           addr 6072                         
LAB_M65_r2_08000__1d9d:
  1d9d  CC0F0C         LDD #0xf0c                        
  1da0  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1da4  6070           addr 6070                         
LAB_M65_r2_08000__1da6:
  1da6  CC0F0C         LDD #0xf0c                        
  1da9  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1dad  6038           addr 6038                         
LAB_M65_r2_08000__1daf:
  1daf  FC7110         LDD 0x7110                        
  1db2  C30032         ADDD #0x32                        
  1db5  3606           PSHU  B A                         
  1db7  CC0005         LDD #0x5                          
  1dba  3606           PSHU  B A                         
  1dbc  AD9FFCEA       JSR [0xfcea]                      
  1dc0  3706           PULU  A B                         
  1dc2  58             LSLB                              
  1dc3  49             ROLA                              
  1dc4  C31DDA         ADDD #0x1dda                      
  1dc7  F3600D         ADDD 0x600d                       
  1dca  1F01           TFR D,X                           
  1dcc  EC84           LDD ,X                            
  1dce  FD7006         STD 0x7006                        
  1dd1  CCFFFF         LDD #0xffff                       
  1dd4  FD70F4         STD 0x70f4                        
  1dd7  3576           PULS  A B X Y U                   
  1dd9  39             RTS                               

; ---- function FUN_M65_r2_08000__1dda
FUN_M65_r2_08000__1dda:
  1dda  FC40FC         LDD 0x40fc                        
  1ddd  A1FD02FD       CMPA [0x20de,PCR]                 
  1de1  63FDC3FE       COM [-0x1e1d,PCR]                 
LAB_M65_r2_08000__1de5:
  1de5  23FE           BLS 0x1de5                        
  1de7  83FEE3         SUBD #0xfee3                      
  1dea  FF42FF         STU 0x42ff                        
  1ded  A100           CMPA 0x0,X                        
  1def  0000           NEG <0x0                          
  1df1  5F             CLRB                              
  1df2  00BE           NEG <0xbe                         
  1df4  .db 01 1D 01 7D 01 DD 02 3D 02 9D 02 FE 03 5F 03 C0  ; ...}...=....._..

; ---- function FUN_M65_r2_08000__1e04
FUN_M65_r2_08000__1e04:
  1e04  17EC23         LBSR 0x0a2a                       
  1e07  C613           LDB #0x13                         
  1e09  AD9FFC36       JSR [0xfc36]                      
  1e0d  CCFFFF         LDD #0xffff                       
  1e10  FD70F4         STD 0x70f4                        
  1e13  CC0F0C         LDD #0xf0c                        
  1e16  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1e1a  6038           addr 6038                         
LAB_M65_r2_08000__1e1c:
  1e1c  CC1E5D         LDD #0x1e5d                       
  1e1f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1e23  600F           addr 600f                         
LAB_M65_r2_08000__1e25:
  1e25  CC0F0C         LDD #0xf0c                        
  1e28  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1e2c  6072           addr 6072                         
LAB_M65_r2_08000__1e2e:
  1e2e  CC0F0C         LDD #0xf0c                        
  1e31  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1e35  6070           addr 6070                         
LAB_M65_r2_08000__1e37:
  1e37  17EBF0         LBSR 0x0a2a                       
  1e3a  C613           LDB #0x13                         
  1e3c  AD9FFC36       JSR [0xfc36]                      
  1e40  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " pitch:         cents"
  1e44  0A7069746368.. char[22] "\npitch:         cents" 
LAB_M65_r2_08000__1e5a:
  1e5a  8D01           BSR 0x1e5d                        
  1e5c  39             RTS                               

; ---- function FUN_M65_r2_08000__1e5d
FUN_M65_r2_08000__1e5d:
  1e5d  3416           PSHS  X B A                       
  1e5f  CC0F0C         LDD #0xf0c                        
  1e62  F3600D         ADDD 0x600d                       
  1e65  10B36072       CMPD 0x6072                       
  1e69  2713           BEQ 0x1e7e                        
  1e6b  CCFFFF         LDD #0xffff                       
  1e6e  FD70F4         STD 0x70f4                        
  1e71  CC0F0C         LDD #0xf0c                        
  1e74  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1e78  6038           addr 6038                         
LAB_M65_r2_08000__1e7a:
  1e7a  8D3B           BSR 0x1eb7                        
  1e7c  2004           BRA 0x1e82                        
LAB_M65_r2_08000__1e7e:
  1e7e  8D37           BSR 0x1eb7                        
  1e80  8D03           BSR 0x1e85                        
LAB_M65_r2_08000__1e82:
  1e82  3516           PULS  A B X                       
  1e84  39             RTS                               

; ---- function FUN_M65_r2_08000__1e85
FUN_M65_r2_08000__1e85:
  1e85  3476           PSHS  U Y X B A                   
  1e87  C61F           LDB #0x1f                         
  1e89  AD9FFC36       JSR [0xfc36]                      
  1e8d  FC7110         LDD 0x7110                        
  1e90  3606           PSHU  B A                         
  1e92  8600           LDA #0x0                          
  1e94  108E7112       LDY #0x7112                       
  1e98  AD9FFC40       JSR [0xfc40]                      
  1e9c  C603           LDB #0x3                          
  1e9e  8E7118         LDX #0x7118                       
  1ea1  AD9FFC3A       JSR [0xfc3a]                      
  1ea5  C61B           LDB #0x1b                         
  1ea7  AD9FFC36       JSR [0xfc36]                      
  1eab  C604           LDB #0x4                          
  1ead  BE70EE         LDX 0x70ee                        
  1eb0  AD9FFC3A       JSR [0xfc3a]                      
  1eb4  3576           PULS  A B X Y U                   
  1eb6  39             RTS                               

; ---- function FUN_M65_r2_08000__1eb7
FUN_M65_r2_08000__1eb7:
  1eb7  3476           PSHS  U Y X B A                   
  1eb9  AD9FFD42       JSR [0xfd42]                      
  1ebd  FD70E2         STD 0x70e2                        
  1ec0  AD9FFD3A       JSR [0xfd3a]                      
  1ec4  FD70E4         STD 0x70e4                        
  1ec7  10B370E2       CMPD 0x70e2                       
  1ecb  2F41           BLE 0x1f0e                        
  1ecd  FC70E2         LDD 0x70e2                        
  1ed0  47             ASRA                              
  1ed1  56             RORB                              
  1ed2  47             ASRA                              
  1ed3  56             RORB                              
  1ed4  FD70FC         STD 0x70fc                        
  1ed7  F370E4         ADDD 0x70e4                       
  1eda  3606           PSHU  B A                         
  1edc  FC70E2         LDD 0x70e2                        
  1edf  3606           PSHU  B A                         
  1ee1  AD9FFCEA       JSR [0xfcea]                      
  1ee5  3706           PULU  A B                         
  1ee7  FD70FA         STD 0x70fa                        
  1eea  FC70E4         LDD 0x70e4                        
  1eed  3606           PSHU  B A                         
  1eef  CC000A         LDD #0xa                          
  1ef2  3606           PSHU  B A                         
  1ef4  AD9FFCEE       JSR [0xfcee]                      
  1ef8  FC70FA         LDD 0x70fa                        
  1efb  3606           PSHU  B A                         
  1efd  AD9FFCEA       JSR [0xfcea]                      
  1f01  3706           PULU  A B                         
  1f03  FD70FA         STD 0x70fa                        
  1f06  FC70FA         LDD 0x70fa                        
  1f09  FD70E6         STD 0x70e6                        
  1f0c  2013           BRA 0x1f21                        
LAB_M65_r2_08000__1f0e:
  1f0e  FC70E2         LDD 0x70e2                        
  1f11  3606           PSHU  B A                         
  1f13  CC000A         LDD #0xa                          
  1f16  3606           PSHU  B A                         
  1f18  AD9FFCEE       JSR [0xfcee]                      
  1f1c  3706           PULU  A B                         
  1f1e  FD70E6         STD 0x70e6                        
LAB_M65_r2_08000__1f21:
  1f21  FC70F4         LDD 0x70f4                        
  1f24  1083FFFF       CMPD #0xffff                      
  1f28  10270008       LBEQ 0x1f34                       
  1f2c  FC70E6         LDD 0x70e6                        
  1f2f  FD710E         STD 0x710e                        
  1f32  2016           BRA 0x1f4a                        
LAB_M65_r2_08000__1f34:
  1f34  FC70E6         LDD 0x70e6                        
  1f37  3606           PSHU  B A                         
  1f39  FC7006         LDD 0x7006                        
  1f3c  3606           PSHU  B A                         
  1f3e  AD9FFCF2       JSR [0xfcf2]                      
  1f42  3706           PULU  A B                         
  1f44  F370E6         ADDD 0x70e6                       
  1f47  FD710E         STD 0x710e                        
LAB_M65_r2_08000__1f4a:
  1f4a  CC2229         LDD #0x2229                       
  1f4d  F3600D         ADDD 0x600d                       
  1f50  1F01           TFR D,X                           
LAB_M65_r2_08000__1f52:
  1f52  EC81           LDD ,X++                          
  1f54  10B3710E       CMPD 0x710e                       
  1f58  2D02           BLT 0x1f5c                        
  1f5a  20F6           BRA 0x1f52                        
LAB_M65_r2_08000__1f5c:
  1f5c  301E           LEAX -0x2,X                       
  1f5e  CC0032         LDD #0x32                         
  1f61  FD7110         STD 0x7110                        
  1f64  CCFFFB         LDD #0xfffb                       
  1f67  FD70F8         STD 0x70f8                        
  1f6a  EC84           LDD ,X                            
  1f6c  3606           PSHU  B A                         
  1f6e  FC710E         LDD 0x710e                        
  1f71  A384           SUBD ,X                           
  1f73  2602           BNE 0x1f77                        
  1f75  204E           BRA 0x1fc5                        
LAB_M65_r2_08000__1f77:
  1f77  3606           PSHU  B A                         
  1f79  AD9FFCEA       JSR [0xfcea]                      
  1f7d  3706           PULU  A B                         
  1f7f  FD70F6         STD 0x70f6                        
  1f82  10830022       CMPD #0x22                        
  1f86  2E22           BGT 0x1faa                        
  1f88  CCFFCE         LDD #0xffce                       
  1f8b  FD7110         STD 0x7110                        
  1f8e  CC0005         LDD #0x5                          
  1f91  FD70F8         STD 0x70f8                        
  1f94  EC1E           LDD -0x2,X                        
  1f96  3606           PSHU  B A                         
  1f98  B3710E         SUBD 0x710e                       
  1f9b  2602           BNE 0x1f9f                        
  1f9d  2026           BRA 0x1fc5                        
LAB_M65_r2_08000__1f9f:
  1f9f  3606           PSHU  B A                         
  1fa1  AD9FFCEA       JSR [0xfcea]                      
  1fa5  3706           PULU  A B                         
  1fa7  FD70F6         STD 0x70f6                        
LAB_M65_r2_08000__1faa:
  1faa  CC2211         LDD #0x2211                       
  1fad  F3600D         ADDD 0x600d                       
  1fb0  1F02           TFR D,Y                           
LAB_M65_r2_08000__1fb2:
  1fb2  ECA1           LDD ,Y++                          
  1fb4  10B370F6       CMPD 0x70f6                       
  1fb8  2D0B           BLT 0x1fc5                        
  1fba  FC7110         LDD 0x7110                        
  1fbd  F370F8         ADDD 0x70f8                       
  1fc0  FD7110         STD 0x7110                        
  1fc3  20ED           BRA 0x1fb2                        
LAB_M65_r2_08000__1fc5:
  1fc5  1F10           TFR X,D                           
  1fc7  832229         SUBD #0x2229                      
  1fca  B3600D         SUBD 0x600d                       
  1fcd  58             LSLB                              
  1fce  49             ROLA                              
  1fcf  C331F5         ADDD #0x31f5                      
  1fd2  C30060         ADDD #0x60                        
  1fd5  F3600D         ADDD 0x600d                       
  1fd8  FD70EE         STD 0x70ee                        
  1fdb  1F10           TFR X,D                           
  1fdd  832229         SUBD #0x2229                      
  1fe0  B3600D         SUBD 0x600d                       
  1fe3  B37004         SUBD 0x7004                       
  1fe6  B37004         SUBD 0x7004                       
  1fe9  C30018         ADDD #0x18                        
  1fec  3606           PSHU  B A                         
  1fee  CC0018         LDD #0x18                         
  1ff1  3606           PSHU  B A                         
  1ff3  AD9FFCE8       JSR [0xfce8]                      
  1ff7  3706           PULU  A B                         
  1ff9  F370F0         ADDD 0x70f0                       
  1ffc  1F02           TFR D,Y                           
  1ffe  CC0000         LDD #0x0                          
  2001  FC70CC         LDD 0x70cc                        
  2004  1083FFFF       CMPD #0xffff                      
  2008  10270003       LBEQ 0x200f                       
  200c  B37110         SUBD 0x7110                       
LAB_M65_r2_08000__200f:
  200f  E3A4           ADDD ,Y                           
  2011  10B37046       CMPD 0x7046                       
  2015  2706           BEQ 0x201d                        
  2017  FD7046         STD 0x7046                        
  201a  17F1EC         LBSR 0x1209                       
LAB_M65_r2_08000__201d:
  201d  1F20           TFR Y,D                           
  201f  B370F0         SUBD 0x70f0                       
  2022  F370F2         ADDD 0x70f2                       
  2025  1F02           TFR D,Y                           
  2027  CC0000         LDD #0x0                          
  202a  FC70CC         LDD 0x70cc                        
  202d  1083FFFF       CMPD #0xffff                      
  2031  10270003       LBEQ 0x2038                       
  2035  B37110         SUBD 0x7110                       
LAB_M65_r2_08000__2038:
  2038  E3A4           ADDD ,Y                           
  203a  10B3704E       CMPD 0x704e                       
  203e  2706           BEQ 0x2046                        
  2040  FD704E         STD 0x704e                        
  2043  17F2DB         LBSR 0x1321                       
LAB_M65_r2_08000__2046:
  2046  3576           PULS  A B X Y U                   
  2048  39             RTS                               
  2049  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  2059  .db 00 00 00 00 00 00 00 00 00 C8 00 C8 00 C8 00 96  ; ................
  2069  .db 00 64 00 96 00 C8 00 C8 00 C8 00 C8 00 96 00 64  ; .d.............d
  2079  .db 01 90 01 5E 01 2C 01 2C 01 2C 01 90 01 90 01 90  ; ...^.,.,.,......
  2089  .db 01 5E 01 2C 01 2C 01 2C 01 F4 01 F4 01 F4 01 F4  ; .^.,.,.,........
  2099  .db 01 F4 02 58 02 26 01 F4 01 F4 01 F4 01 F4 01 F4  ; ...X.&..........
  20a9  .db 02 BC 02 BC 02 BC 02 BC 02 BC 02 BC 02 BC 02 BC  ; ................
  20b9  .db 02 BC 02 BC 02 8A 02 58 03 84 03 84 03 84 03 52  ; .......X.......R
  20c9  .db 03 20 03 84 03 84 03 84 03 52 03 20 03 20 03 20  ; . .......R. . . 
  20d9  .db 04 4C 04 1A 03                                   ; .L...
DAT_M65_r2_08000__20de:
  20de  E803           undefined2 E803h                  
  20e0  .db E8 03 E8 04 4C 04 1A 03 E8 03 E8 03 E8 03 E8 03  ; ....L...........
  20f0  .db E8 04 B0 04 B0 04 B0 04 B0 04 B0 04 B0 04 B0 04  ; ................
  2100  .db B0 04 B0 04 B0 04 B0 04 B0 FF 9C FF 6A FF 38 FF  ; ............j.8.
  2110  .db 38 FF 38 FF 9C FF 6A FF 38 FF 38 FF 38 FF 38 FF  ; 8.8...j.8.8.8.8.
  2120  .db 38 FE D4 FE D4 FE D4 FE A2 FE 70 FE D4 FE D4 FE  ; 8.........p.....
  2130  .db D4 FE A2 FE 70 FE 70 FE 70 FE 0C FE 0C FE 0C FE  ; ....p.p.p.......
  2140  .db 0C FE 0C FE 0C FE 0C FE 0C FE 0C FE 0C FD DA FD  ; ................
  2150  .db A8 FD 44 FD 44 FD 44 FD 44 FD 44 FD A8 FD 76 FD  ; ..D.D.D.D.D...v.
  2160  .db 44 FD 44 FD 44 FD 44 FD 44 FC E0 FC AE FC 7C FC  ; D.D.D.D.D.....|.
  2170  .db 7C FC 7C FC E0 FC E0 FC E0 FC AE FC 7C FC 7C FC  ; |.|.........|.|.
  2180  .db 7C FC 18 FC 18 FC 18 FB E6 FB B4 FC 18 FC 18 FC  ; |...............
  2190  .db 18 FC 18 FC 18 FB E6 FB B4 FB 50 FB 50 FB 50 FB  ; ..........P.P.P.
  21a0  .db 50 FB 50 FB 50 FB 50 FB 50 FB 50 FB 50 FB 50 FB  ; P.P.P.P.P.P.P.P.
  21b0  .db 50 00 05 FF 9C FF 38 FE D4 FE 70 FE 0C FD A8 FD  ; P.....8...p.....
  21c0  .db 44 FC E0 FC 7C FC 18 FB B4 FE 0C FD A8 FD 44 FC  ; D...|.........D.
  21d0  .db E0 FC 7C FC 18 FB B4 FB 50 FA EC FA 88 FA 24 F9  ; ..|.....P.....$.
  21e0  .db C0 04 B0 04 4C 03 E8 03 84 03 20 02 BC 02 58 01  ; ....L..... ...X.
  21f0  .db F4 01 90 01 2C 00 C8 00 64 02 BC 02 58 01 F4 01  ; ....,...d...X...
  2200  .db 90 01 2C 00 C8 00 64 00 05 FF 9C FF 38 FE D4 FE  ; ..,...d.....8...
  2210  .db 70                                               ; p
DAT_M65_r2_08000__2211:
  2211  02             ?? 02h                            
  2212  .db B4                                               ; .
DAT_M65_r2_08000__2213:
  2213  00             ?? 00h                            
  2214  .db E6 00 8A 00 62 00 4C 00 3E 00 35 00 2E 00 28 00  ; ....b.L.>.5...(.
  2224  .db 24 FF FF 7F FF                                   ; $....
DAT_M65_r2_08000__2229:
  2229  33             ?? 33h    3                       
  222a  .db 2D                                               ; -
DAT_M65_r2_08000__222b:
  222b  30             ?? 30h    0                       
  222c  .db 4E 2D 98 2B 09 28 9E 26 57 24 30 22 28 20 3D 1E  ; N-.+.(.&W$0"( =.
  223c  .db 6E 1C B9 1B 1C 19 97 18 27 16 CC 15 84 14 4F 13  ; n.......'.....O.
  224c  .db 2B 12 18 11 14 10 1F 0F 37 0E 5C 0D 8E 0C CB 0C  ; +.......7.\.....
  225c  .db 13 0B 66 0A C2 0A 28 09 96 09 0C 08 8A 08 0F 07  ; ..f...(.........
  226c  .db 9B 07 2E 06 C7 06 66 06 0A 05 B3 05 61 05 14 04  ; ......f.....a...
  227c  .db CB 04 86 04 45 04 08 03 CE 03 97 03 64 03 33 03  ; ....E.......d.3.
  228c  .db 05 02 D9 02 B1 02 8A 02 65 02 43 02 22 02 04 01  ; ........e.C."...
  229c  .db E7 01 CC 01 B2 01 99 01 82 01 6D 01 58 01 45 01  ; ..........m.X.E.
  22ac  .db 33 01 21 01 11 01 02 00 F3 00 E6 00 D9 00 CD 00  ; 3.!.............
  22bc  .db C1 00 B6 00 AC 00 A2 00 99 00 91 00 89 00 81 00  ; ................
  22cc  .db 7A 00 73 00 6C FF FF                             ; z.s.l..
PTR_FUN_M65_r2_08000__2356_M65_r2_08000__22d3:
  22d3  2356           addr M65_r2_08000::2356           
  22d5  231D           addr M65_r2_08000::231d           
  22d7  .db 23 11 70 96 70 98 00 00 70 9A 71 70 71 A9 01 00  ; #.p.p...p.qpq...
  22e7  .db 00 00 64 00 01 00 03 22 23 41 00 00 00 00 70 9C  ; ..d...."#A....p.
  22f7  .db 71 AB                                            ; q.

; ---- function FUN_M65_r2_08000__22f9
FUN_M65_r2_08000__22f9:
  22f9  3410           PSHS  X                           
  22fb  8E22D3         LDX #0x22d3                        ; desc[API_FE6A]: ->$2356 ->$231D
  22fe  AD9FFE6A       JSR [0xfe6a]                      
  2302  3510           PULS  X                           
  2304  39             RTS                               

; ---- function FUN_M65_r2_08000__2305
FUN_M65_r2_08000__2305:
  2305  3410           PSHS  X                           
  2307  8E22D3         LDX #0x22d3                        ; desc[API_FDBC]: ->$2356 ->$231D
  230a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.."."
  230e  3510           PULS  X                           
  2310  39             RTS                               

; ---- function FUN_M65_r2_08000__2311
FUN_M65_r2_08000__2311:
  2311  3410           PSHS  X                           
  2313  8E22D3         LDX #0x22d3                        ; desc[API_FE6C]: ->$2356 ->$231D
  2316  AD9FFE6C       JSR [0xfe6c]                      
  231a  3510           PULS  X                           
  231c  39             RTS                               

; ---- function FUN_M65_r2_08000__231d
FUN_M65_r2_08000__231d:
  231d  3410           PSHS  X                           
  231f  8E22D3         LDX #0x22d3                        ; desc[API_FE6E]: ->$2356 ->$231D
  2322  AD9FFE6E       JSR [0xfe6e]                      
  2326  3510           PULS  X                           
  2328  39             RTS                               

; ---- function FUN_M65_r2_08000__2329
FUN_M65_r2_08000__2329:
  2329  3410           PSHS  X                           
  232b  8E22D3         LDX #0x22d3                        ; desc[API_FE1C]: ->$2356 ->$231D
  232e  AD9FFE1C       JSR [0xfe1c]                      
  2332  3510           PULS  X                           
  2334  39             RTS                               

; ---- function FUN_M65_r2_08000__2335
FUN_M65_r2_08000__2335:
  2335  3410           PSHS  X                           
  2337  8E22D3         LDX #0x22d3                        ; desc[API_FE1A]: ->$2356 ->$231D $2311
  233a  AD9FFE1A       JSR [0xfe1a]                      
  233e  3510           PULS  X                           
  2340  39             RTS                               
  2341  .db 14 6C 20 26 20 72 20 66 64 62 61 63 6B 3A 20 20  ; .l & r fdback:  
  2351  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M65_r2_08000__2356
FUN_M65_r2_08000__2356:
  2356  3476           PSHS  U Y X B A                   
  2358  8E22D3         LDX #0x22d3                       
  235b  AD9FFE76       JSR [0xfe76]                      
  235f  FC709A         LDD 0x709a                        
  2362  3606           PSHU  B A                         
  2364  58             LSLB                              
  2365  49             ROLA                              
  2366  FD70F6         STD 0x70f6                        
  2369  CC4666         LDD #0x4666                       
  236c  3606           PSHU  B A                         
  236e  AD9FFCF2       JSR [0xfcf2]                      
  2372  3706           PULU  A B                         
  2374  F370F6         ADDD 0x70f6                       
  2377  AD9FFC6C       JSR [0xfc6c]                      
  237b  AD9FFC74       JSR [0xfc74]                      
  237f  3576           PULS  A B X Y U                   
  2381  39             RTS                               
PTR_FUN_M65_r2_08000__2405_M65_r2_08000__2382:
  2382  2405           addr M65_r2_08000::2405           
  2384  23CC           addr M65_r2_08000::23cc           
  2386  .db 23 C0 70 9E 70 A0 00 00 70 A2 71 70 71 BD 02 00  ; #.p.p...p.qpq...
  2396  .db 00 00 64 00 01 00 03 21 23 F0 00 00 00 00 70 A4  ; ..d....!#.....p.
  23a6  .db 71 BF                                            ; q.

; ---- function FUN_M65_r2_08000__23a8
FUN_M65_r2_08000__23a8:
  23a8  3410           PSHS  X                           
  23aa  8E2382         LDX #0x2382                        ; desc[API_FE6A]: ->$2405 ->$23CC
  23ad  AD9FFE6A       JSR [0xfe6a]                      
  23b1  3510           PULS  X                           
  23b3  39             RTS                               

; ---- function FUN_M65_r2_08000__23b4
FUN_M65_r2_08000__23b4:
  23b4  3410           PSHS  X                           
  23b6  8E2382         LDX #0x2382                        ; desc[API_FDBC]: ->$2405 ->$23CC
  23b9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..#."
  23bd  3510           PULS  X                           
  23bf  39             RTS                               

; ---- function FUN_M65_r2_08000__23c0
FUN_M65_r2_08000__23c0:
  23c0  3410           PSHS  X                           
  23c2  8E2382         LDX #0x2382                        ; desc[API_FE6C]: ->$2405 ->$23CC
  23c5  AD9FFE6C       JSR [0xfe6c]                      
  23c9  3510           PULS  X                           
  23cb  39             RTS                               

; ---- function FUN_M65_r2_08000__23cc
FUN_M65_r2_08000__23cc:
  23cc  3410           PSHS  X                           
  23ce  8E2382         LDX #0x2382                        ; desc[API_FE6E]: ->$2405 ->$23CC
  23d1  AD9FFE6E       JSR [0xfe6e]                      
  23d5  3510           PULS  X                           
  23d7  39             RTS                               

; ---- function FUN_M65_r2_08000__23d8
FUN_M65_r2_08000__23d8:
  23d8  3410           PSHS  X                           
  23da  8E2382         LDX #0x2382                        ; desc[API_FE1C]: ->$2405 ->$23CC
  23dd  AD9FFE1C       JSR [0xfe1c]                      
  23e1  3510           PULS  X                           
  23e3  39             RTS                               

; ---- function FUN_M65_r2_08000__23e4
FUN_M65_r2_08000__23e4:
  23e4  3410           PSHS  X                           
  23e6  8E2382         LDX #0x2382                        ; desc[API_FE1A]: ->$2405 ->$23CC $23C0
  23e9  AD9FFE1A       JSR [0xfe1a]                      
  23ed  3510           PULS  X                           
  23ef  39             RTS                               
  23f0  .db 14 6C 65 66 74 20 66 64 62 61 63 6B 3A 20 20 20  ; .left fdback:   
  2400  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M65_r2_08000__2405
FUN_M65_r2_08000__2405:
  2405  3476           PSHS  U Y X B A                   
  2407  8E2382         LDX #0x2382                       
  240a  AD9FFE76       JSR [0xfe76]                      
  240e  FC70A2         LDD 0x70a2                        
  2411  3606           PSHU  B A                         
  2413  58             LSLB                              
  2414  49             ROLA                              
  2415  FD70F6         STD 0x70f6                        
  2418  CC4666         LDD #0x4666                       
  241b  3606           PSHU  B A                         
  241d  AD9FFCF2       JSR [0xfcf2]                      
  2421  3706           PULU  A B                         
  2423  F370F6         ADDD 0x70f6                       
  2426  AD9FFC6C       JSR [0xfc6c]                      
  242a  3576           PULS  A B X Y U                   
  242c  39             RTS                               
PTR_FUN_M65_r2_08000__24b0_M65_r2_08000__242d:
  242d  24B0           addr M65_r2_08000::24b0           
  242f  2477           addr M65_r2_08000::2477           
  2431  .db 24 6B 70 A6 70 A8 00 00 70 AA 71 70 71 A9 03 00  ; $kp.p...p.qpq...
  2441  .db 00 00 64 00 01 00 03 22 24 9B 00 00 00 00 70 AC  ; ..d...."$.....p.
  2451  .db 71 AB                                            ; q.

; ---- function FUN_M65_r2_08000__2453
FUN_M65_r2_08000__2453:
  2453  3410           PSHS  X                           
  2455  8E242D         LDX #0x242d                        ; desc[API_FE6A]: ->$24B0 ->$2477
  2458  AD9FFE6A       JSR [0xfe6a]                      
  245c  3510           PULS  X                           
  245e  39             RTS                               

; ---- function FUN_M65_r2_08000__245f
FUN_M65_r2_08000__245f:
  245f  3410           PSHS  X                           
  2461  8E242D         LDX #0x242d                        ; desc[API_FDBC]: ->$24B0 ->$2477
  2464  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$-"
  2468  3510           PULS  X                           
  246a  39             RTS                               

; ---- function FUN_M65_r2_08000__246b
FUN_M65_r2_08000__246b:
  246b  3410           PSHS  X                           
  246d  8E242D         LDX #0x242d                        ; desc[API_FE6C]: ->$24B0 ->$2477
  2470  AD9FFE6C       JSR [0xfe6c]                      
  2474  3510           PULS  X                           
  2476  39             RTS                               

; ---- function FUN_M65_r2_08000__2477
FUN_M65_r2_08000__2477:
  2477  3410           PSHS  X                           
  2479  8E242D         LDX #0x242d                        ; desc[API_FE6E]: ->$24B0 ->$2477
  247c  AD9FFE6E       JSR [0xfe6e]                      
  2480  3510           PULS  X                           
  2482  39             RTS                               

; ---- function FUN_M65_r2_08000__2483
FUN_M65_r2_08000__2483:
  2483  3410           PSHS  X                           
  2485  8E242D         LDX #0x242d                        ; desc[API_FE1C]: ->$24B0 ->$2477
  2488  AD9FFE1C       JSR [0xfe1c]                      
  248c  3510           PULS  X                           
  248e  39             RTS                               

; ---- function FUN_M65_r2_08000__248f
FUN_M65_r2_08000__248f:
  248f  3410           PSHS  X                           
  2491  8E242D         LDX #0x242d                        ; desc[API_FE1A]: ->$24B0 ->$2477 $246B
  2494  AD9FFE1A       JSR [0xfe1a]                      
  2498  3510           PULS  X                           
  249a  39             RTS                               
  249b  .db 14 72 69 67 68 74 20 66 64 62 61 63 6B 3A 20 20  ; .right fdback:  
  24ab  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M65_r2_08000__24b0
FUN_M65_r2_08000__24b0:
  24b0  3476           PSHS  U Y X B A                   
  24b2  8E242D         LDX #0x242d                       
  24b5  AD9FFE76       JSR [0xfe76]                      
  24b9  FC70AA         LDD 0x70aa                        
  24bc  3606           PSHU  B A                         
  24be  58             LSLB                              
  24bf  49             ROLA                              
  24c0  FD70F6         STD 0x70f6                        
  24c3  CC4666         LDD #0x4666                       
  24c6  3606           PSHU  B A                         
  24c8  AD9FFCF2       JSR [0xfcf2]                      
  24cc  3706           PULU  A B                         
  24ce  F370F6         ADDD 0x70f6                       
  24d1  AD9FFC74       JSR [0xfc74]                      
  24d5  3576           PULS  A B X Y U                   
  24d7  39             RTS                               
PTR_FUN_M65_r2_08000__255b_M65_r2_08000__24d8:
  24d8  255B           addr M65_r2_08000::255b           
  24da  2522           addr M65_r2_08000::2522           
  24dc  .db 25 16 70 66 70 68 00 00 70 6A 71 70 71 AD 00 00  ; %.pfph..pjqpq...
  24ec  .db 00 00 64 00 01 00 03 19 25 46 00 00 00 00 70 6C  ; ..d.....%F....pl
  24fc  .db 71 AF                                            ; q.

; ---- function FUN_M65_r2_08000__24fe
FUN_M65_r2_08000__24fe:
  24fe  3410           PSHS  X                           
  2500  8E24D8         LDX #0x24d8                        ; desc[API_FE6A]: ->$255B ->$2522
  2503  AD9FFE6A       JSR [0xfe6a]                      
  2507  3510           PULS  X                           
  2509  39             RTS                               

; ---- function FUN_M65_r2_08000__250a
FUN_M65_r2_08000__250a:
  250a  3410           PSHS  X                           
  250c  8E24D8         LDX #0x24d8                        ; desc[API_FDBC]: ->$255B ->$2522
  250f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$."
  2513  3510           PULS  X                           
  2515  39             RTS                               

; ---- function FUN_M65_r2_08000__2516
FUN_M65_r2_08000__2516:
  2516  3410           PSHS  X                           
  2518  8E24D8         LDX #0x24d8                        ; desc[API_FE6C]: ->$255B ->$2522
  251b  AD9FFE6C       JSR [0xfe6c]                      
  251f  3510           PULS  X                           
  2521  39             RTS                               

; ---- function FUN_M65_r2_08000__2522
FUN_M65_r2_08000__2522:
  2522  3410           PSHS  X                           
  2524  8E24D8         LDX #0x24d8                        ; desc[API_FE6E]: ->$255B ->$2522
  2527  AD9FFE6E       JSR [0xfe6e]                      
  252b  3510           PULS  X                           
  252d  39             RTS                               

; ---- function FUN_M65_r2_08000__252e
FUN_M65_r2_08000__252e:
  252e  3410           PSHS  X                           
  2530  8E24D8         LDX #0x24d8                        ; desc[API_FE1C]: ->$255B ->$2522
  2533  AD9FFE1C       JSR [0xfe1c]                      
  2537  3510           PULS  X                           
  2539  39             RTS                               

; ---- function FUN_M65_r2_08000__253a
FUN_M65_r2_08000__253a:
  253a  3410           PSHS  X                           
  253c  8E24D8         LDX #0x24d8                        ; desc[API_FE1A]: ->$255B ->$2522 $2516
  253f  AD9FFE1A       JSR [0xfe1a]                      
  2543  3510           PULS  X                           
  2545  39             RTS                               
  2546  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  2556  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M65_r2_08000__255b
FUN_M65_r2_08000__255b:
  255b  3476           PSHS  U Y X B A                   
  255d  8E24D8         LDX #0x24d8                       
  2560  AD9FFE76       JSR [0xfe76]                      
  2564  CC0064         LDD #0x64                         
  2567  B3706A         SUBD 0x706a                       
  256a  3606           PSHU  B A                         
  256c  58             LSLB                              
  256d  49             ROLA                              
  256e  FD70F6         STD 0x70f6                        
  2571  CC4666         LDD #0x4666                       
  2574  3606           PSHU  B A                         
  2576  AD9FFCF2       JSR [0xfcf2]                      
  257a  3706           PULU  A B                         
  257c  F370F6         ADDD 0x70f6                       
  257f  AD9FFC6A       JSR [0xfc6a]                      
  2583  AD9FFC72       JSR [0xfc72]                      
  2587  3576           PULS  A B X Y U                   
  2589  39             RTS                               
PTR_FUN_M65_r2_08000__260d_M65_r2_08000__258a:
  258a  260D           addr M65_r2_08000::260d           
  258c  25D4           addr M65_r2_08000::25d4           
  258e  .db 25 C8 70 6E 70 70 00 00 70 72 71 70 71 C1 00 00  ; %.pnpp..prqpq...
  259e  .db 00 00 64 00 01 00 03 1D 25 F8 00 00 00 00 70 74  ; ..d.....%.....pt
  25ae  .db 71 C3                                            ; q.

; ---- function FUN_M65_r2_08000__25b0
FUN_M65_r2_08000__25b0:
  25b0  3410           PSHS  X                           
  25b2  8E258A         LDX #0x258a                        ; desc[API_FE6A]: ->$260D ->$25D4
  25b5  AD9FFE6A       JSR [0xfe6a]                      
  25b9  3510           PULS  X                           
  25bb  39             RTS                               

; ---- function FUN_M65_r2_08000__25bc
FUN_M65_r2_08000__25bc:
  25bc  3410           PSHS  X                           
  25be  8E258A         LDX #0x258a                        ; desc[API_FDBC]: ->$260D ->$25D4
  25c1  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..%."
  25c5  3510           PULS  X                           
  25c7  39             RTS                               

; ---- function FUN_M65_r2_08000__25c8
FUN_M65_r2_08000__25c8:
  25c8  3410           PSHS  X                           
  25ca  8E258A         LDX #0x258a                        ; desc[API_FE6C]: ->$260D ->$25D4
  25cd  AD9FFE6C       JSR [0xfe6c]                      
  25d1  3510           PULS  X                           
  25d3  39             RTS                               

; ---- function FUN_M65_r2_08000__25d4
FUN_M65_r2_08000__25d4:
  25d4  3410           PSHS  X                           
  25d6  8E258A         LDX #0x258a                        ; desc[API_FE6E]: ->$260D ->$25D4
  25d9  AD9FFE6E       JSR [0xfe6e]                      
  25dd  3510           PULS  X                           
  25df  39             RTS                               

; ---- function FUN_M65_r2_08000__25e0
FUN_M65_r2_08000__25e0:
  25e0  3410           PSHS  X                           
  25e2  8E258A         LDX #0x258a                        ; desc[API_FE1C]: ->$260D ->$25D4
  25e5  AD9FFE1C       JSR [0xfe1c]                      
  25e9  3510           PULS  X                           
  25eb  39             RTS                               

; ---- function FUN_M65_r2_08000__25ec
FUN_M65_r2_08000__25ec:
  25ec  3410           PSHS  X                           
  25ee  8E258A         LDX #0x258a                        ; desc[API_FE1A]: ->$260D ->$25D4 $25C8
  25f1  AD9FFE1A       JSR [0xfe1a]                      
  25f5  3510           PULS  X                           
  25f7  39             RTS                               
  25f8  .db 14 6C 65 66 74 20 6D 69 78 3A 20 20 20 20 25 20  ; .left mix:    % 
  2608  .db 77 65 74 20 20                                   ; wet  

; ---- function FUN_M65_r2_08000__260d
FUN_M65_r2_08000__260d:
  260d  3476           PSHS  U Y X B A                   
  260f  8E258A         LDX #0x258a                       
  2612  AD9FFE76       JSR [0xfe76]                      
  2616  CC0064         LDD #0x64                         
  2619  B37072         SUBD 0x7072                       
  261c  3606           PSHU  B A                         
  261e  58             LSLB                              
  261f  49             ROLA                              
  2620  FD70F6         STD 0x70f6                        
  2623  CC4666         LDD #0x4666                       
  2626  3606           PSHU  B A                         
  2628  AD9FFCF2       JSR [0xfcf2]                      
  262c  3706           PULU  A B                         
  262e  F370F6         ADDD 0x70f6                       
  2631  AD9FFC6A       JSR [0xfc6a]                      
  2635  3576           PULS  A B X Y U                   
  2637  39             RTS                               
PTR_FUN_M65_r2_08000__26bb_M65_r2_08000__2638:
  2638  26BB           addr M65_r2_08000::26bb           
  263a  2682           addr M65_r2_08000::2682           
  263c  .db 26 76 70 76 70 78 00 00 70 7A 71 70 71 AD 01 00  ; &vpvpx..pzqpq...
  264c  .db 00 00 64 00 01 00 03 1E 26 A6 00 00 00 00 70 7C  ; ..d.....&.....p|
  265c  .db 71 AF                                            ; q.

; ---- function FUN_M65_r2_08000__265e
FUN_M65_r2_08000__265e:
  265e  3410           PSHS  X                           
  2660  8E2638         LDX #0x2638                        ; desc[API_FE6A]: ->$26BB ->$2682
  2663  AD9FFE6A       JSR [0xfe6a]                      
  2667  3510           PULS  X                           
  2669  39             RTS                               

; ---- function FUN_M65_r2_08000__266a
FUN_M65_r2_08000__266a:
  266a  3410           PSHS  X                           
  266c  8E2638         LDX #0x2638                        ; desc[API_FDBC]: ->$26BB ->$2682
  266f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..&8"
  2673  3510           PULS  X                           
  2675  39             RTS                               

; ---- function FUN_M65_r2_08000__2676
FUN_M65_r2_08000__2676:
  2676  3410           PSHS  X                           
  2678  8E2638         LDX #0x2638                        ; desc[API_FE6C]: ->$26BB ->$2682
  267b  AD9FFE6C       JSR [0xfe6c]                      
  267f  3510           PULS  X                           
  2681  39             RTS                               

; ---- function FUN_M65_r2_08000__2682
FUN_M65_r2_08000__2682:
  2682  3410           PSHS  X                           
  2684  8E2638         LDX #0x2638                        ; desc[API_FE6E]: ->$26BB ->$2682
  2687  AD9FFE6E       JSR [0xfe6e]                      
  268b  3510           PULS  X                           
  268d  39             RTS                               

; ---- function FUN_M65_r2_08000__268e
FUN_M65_r2_08000__268e:
  268e  3410           PSHS  X                           
  2690  8E2638         LDX #0x2638                        ; desc[API_FE1C]: ->$26BB ->$2682
  2693  AD9FFE1C       JSR [0xfe1c]                      
  2697  3510           PULS  X                           
  2699  39             RTS                               

; ---- function FUN_M65_r2_08000__269a
FUN_M65_r2_08000__269a:
  269a  3410           PSHS  X                           
  269c  8E2638         LDX #0x2638                        ; desc[API_FE1A]: ->$26BB ->$2682 $2676
  269f  AD9FFE1A       JSR [0xfe1a]                      
  26a3  3510           PULS  X                           
  26a5  39             RTS                               
  26a6  .db 14 72 69 67 68 74 20 6D 69 78 3A 20 20 20 20 25  ; .right mix:    %
  26b6  .db 20 77 65 74 20                                   ;  wet 

; ---- function FUN_M65_r2_08000__26bb
FUN_M65_r2_08000__26bb:
  26bb  3476           PSHS  U Y X B A                   
  26bd  8E2638         LDX #0x2638                       
  26c0  AD9FFE76       JSR [0xfe76]                      
  26c4  CC0064         LDD #0x64                         
  26c7  B3707A         SUBD 0x707a                       
  26ca  3606           PSHU  B A                         
  26cc  58             LSLB                              
  26cd  49             ROLA                              
  26ce  FD70F6         STD 0x70f6                        
  26d1  CC4666         LDD #0x4666                       
  26d4  3606           PSHU  B A                         
  26d6  AD9FFCF2       JSR [0xfcf2]                      
  26da  3706           PULU  A B                         
  26dc  F370F6         ADDD 0x70f6                       
  26df  AD9FFC72       JSR [0xfc72]                      
  26e3  3576           PULS  A B X Y U                   
  26e5  39             RTS                               
PTR_FUN_M65_r2_08000__2751_M65_r2_08000__26e6:
  26e6  2751           addr M65_r2_08000::2751           
  26e8  2730           addr M65_r2_08000::2730           
  26ea  .db 27 24 70 7E 70 80 00 00 70 82 71 70 71 89 24 FF  ; '$p~p...p.qpq.$.
  26fa  .db D0 00 30 00 01 00 03 1C 27 3C 00 00 00 00 00 00  ; ..0.....'<......
  270a  .db 00 00                                            ; ..

; ---- function FUN_M65_r2_08000__270c
FUN_M65_r2_08000__270c:
  270c  3410           PSHS  X                           
  270e  8E26E6         LDX #0x26e6                       
  2711  AD9FFE74       JSR [0xfe74]                      
  2715  3510           PULS  X                           
  2717  39             RTS                               

; ---- function FUN_M65_r2_08000__2718
FUN_M65_r2_08000__2718:
  2718  3410           PSHS  X                           
  271a  8E26E6         LDX #0x26e6                        ; desc[API_FE22]: ->$2751 ->$2730
  271d  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2721  3510           PULS  X                           
  2723  39             RTS                               

; ---- function FUN_M65_r2_08000__2724
FUN_M65_r2_08000__2724:
  2724  3410           PSHS  X                           
  2726  8E26E6         LDX #0x26e6                       
  2729  AD9FFE70       JSR [0xfe70]                      
  272d  3510           PULS  X                           
  272f  39             RTS                               

; ---- function FUN_M65_r2_08000__2730
FUN_M65_r2_08000__2730:
  2730  3410           PSHS  X                           
  2732  8E26E6         LDX #0x26e6                       
  2735  AD9FFE72       JSR [0xfe72]                      
  2739  3510           PULS  X                           
  273b  39             RTS                               
  273c  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  274c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M65_r2_08000__2751
FUN_M65_r2_08000__2751:
  2751  3476           PSHS  U Y X B A                   
  2753  8E26E6         LDX #0x26e6                       
  2756  AD9FFE76       JSR [0xfe76]                      
  275a  AD9FFE52       JSR [0xfe52]                      
  275e  3576           PULS  A B X Y U                   
  2760  39             RTS                               
PTR_FUN_M65_r2_08000__27cc_M65_r2_08000__2761:
  2761  27CC           addr M65_r2_08000::27cc           
  2763  27AB           addr M65_r2_08000::27ab           
  2765  .db 27 9F 70 84 70 86 00 00 70 88 71 70 71 8A 25 FF  ; '.p.p...p.qpq.%.
  2775  .db D0 00 30 00 01 00 03 1D 27 B7 00 00 00 00 00 00  ; ..0.....'.......
  2785  .db 00 00                                            ; ..

; ---- function FUN_M65_r2_08000__2787
FUN_M65_r2_08000__2787:
  2787  3410           PSHS  X                           
  2789  8E2761         LDX #0x2761                       
  278c  AD9FFE74       JSR [0xfe74]                      
  2790  3510           PULS  X                           
  2792  39             RTS                               

; ---- function FUN_M65_r2_08000__2793
FUN_M65_r2_08000__2793:
  2793  3410           PSHS  X                           
  2795  8E2761         LDX #0x2761                        ; desc[API_FE22]: ->$27CC ->$27AB
  2798  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  279c  3510           PULS  X                           
  279e  39             RTS                               

; ---- function FUN_M65_r2_08000__279f
FUN_M65_r2_08000__279f:
  279f  3410           PSHS  X                           
  27a1  8E2761         LDX #0x2761                       
  27a4  AD9FFE70       JSR [0xfe70]                      
  27a8  3510           PULS  X                           
  27aa  39             RTS                               

; ---- function FUN_M65_r2_08000__27ab
FUN_M65_r2_08000__27ab:
  27ab  3410           PSHS  X                           
  27ad  8E2761         LDX #0x2761                       
  27b0  AD9FFE72       JSR [0xfe72]                      
  27b4  3510           PULS  X                           
  27b6  39             RTS                               
  27b7  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  27c7  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M65_r2_08000__27cc
FUN_M65_r2_08000__27cc:
  27cc  3476           PSHS  U Y X B A                   
  27ce  8E2761         LDX #0x2761                       
  27d1  AD9FFE76       JSR [0xfe76]                      
  27d5  AD9FFE54       JSR [0xfe54]                      
  27d9  3576           PULS  A B X Y U                   
  27db  39             RTS                               
PTR_FUN_M65_r2_08000__2847_M65_r2_08000__27dc:
  27dc  2847           addr M65_r2_08000::2847           
  27de  2826           addr M65_r2_08000::2826           
  27e0  .db 28 1A 70 8A 70 8C 00 00 70 8E 71 70 71 8B 26 FF  ; (.p.p...p.qpq.&.
  27f0  .db D0 00 30 00 01 00 03 1D 28 32 00 00 00 00 00 00  ; ..0.....(2......
  2800  .db 00 00                                            ; ..

; ---- function FUN_M65_r2_08000__2802
FUN_M65_r2_08000__2802:
  2802  3410           PSHS  X                           
  2804  8E27DC         LDX #0x27dc                       
  2807  AD9FFE74       JSR [0xfe74]                      
  280b  3510           PULS  X                           
  280d  39             RTS                               

; ---- function FUN_M65_r2_08000__280e
FUN_M65_r2_08000__280e:
  280e  3410           PSHS  X                           
  2810  8E27DC         LDX #0x27dc                        ; desc[API_FE22]: ->$2847 ->$2826
  2813  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2817  3510           PULS  X                           
  2819  39             RTS                               

; ---- function FUN_M65_r2_08000__281a
FUN_M65_r2_08000__281a:
  281a  3410           PSHS  X                           
  281c  8E27DC         LDX #0x27dc                       
  281f  AD9FFE70       JSR [0xfe70]                      
  2823  3510           PULS  X                           
  2825  39             RTS                               

; ---- function FUN_M65_r2_08000__2826
FUN_M65_r2_08000__2826:
  2826  3410           PSHS  X                           
  2828  8E27DC         LDX #0x27dc                       
  282b  AD9FFE72       JSR [0xfe72]                      
  282f  3510           PULS  X                           
  2831  39             RTS                               
  2832  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  2842  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M65_r2_08000__2847
FUN_M65_r2_08000__2847:
  2847  3476           PSHS  U Y X B A                   
  2849  8E27DC         LDX #0x27dc                       
  284c  AD9FFE76       JSR [0xfe76]                      
  2850  AD9FFE56       JSR [0xfe56]                      
  2854  3576           PULS  A B X Y U                   
  2856  39             RTS                               
PTR_FUN_M65_r2_08000__28c2_M65_r2_08000__2857:
  2857  28C2           addr M65_r2_08000::28c2           
  2859  28A1           addr M65_r2_08000::28a1           
  285b  .db 28 95 70 90 70 92 00 00 70 94 71 70 71 8C 27 FF  ; (.p.p...p.qpq.'.
  286b  .db D0 00 30 00 01 00 03 1E 28 AD 00 00 00 00 00 00  ; ..0.....(.......
  287b  .db 00 00                                            ; ..

; ---- function FUN_M65_r2_08000__287d
FUN_M65_r2_08000__287d:
  287d  3410           PSHS  X                           
  287f  8E2857         LDX #0x2857                       
  2882  AD9FFE74       JSR [0xfe74]                      
  2886  3510           PULS  X                           
  2888  39             RTS                               

; ---- function FUN_M65_r2_08000__2889
FUN_M65_r2_08000__2889:
  2889  3410           PSHS  X                           
  288b  8E2857         LDX #0x2857                        ; desc[API_FE22]: ->$28C2 ->$28A1
  288e  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2892  3510           PULS  X                           
  2894  39             RTS                               

; ---- function FUN_M65_r2_08000__2895
FUN_M65_r2_08000__2895:
  2895  3410           PSHS  X                           
  2897  8E2857         LDX #0x2857                       
  289a  AD9FFE70       JSR [0xfe70]                      
  289e  3510           PULS  X                           
  28a0  39             RTS                               

; ---- function FUN_M65_r2_08000__28a1
FUN_M65_r2_08000__28a1:
  28a1  3410           PSHS  X                           
  28a3  8E2857         LDX #0x2857                       
  28a6  AD9FFE72       JSR [0xfe72]                      
  28aa  3510           PULS  X                           
  28ac  39             RTS                               
  28ad  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  28bd  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M65_r2_08000__28c2
FUN_M65_r2_08000__28c2:
  28c2  3476           PSHS  U Y X B A                   
  28c4  8E2857         LDX #0x2857                       
  28c7  AD9FFE76       JSR [0xfe76]                      
  28cb  AD9FFE58       JSR [0xfe58]                      
  28cf  3576           PULS  A B X Y U                   
  28d1  39             RTS                               

; ---- function FUN_M65_r2_08000__28d2
FUN_M65_r2_08000__28d2:
  28d2  3426           PSHS  Y B A                       
  28d4  AD9FFC8E       JSR [0xfc8e]                      
  28d8  FC60F9         LDD 0x60f9                        
  28db  FD70C0         STD 0x70c0                        
  28de  FD6074         STD 0x6074                        
  28e1  1700EE         LBSR 0x29d2                       
  28e4  CC71B2         LDD #0x71b2                       
  28e7  837170         SUBD #0x7170                      
  28ea  1F02           TFR D,Y                           
  28ec  FC70C0         LDD 0x70c0                        
  28ef  AD9FFC80       JSR [0xfc80]                      
  28f3  3526           PULS  A B Y                       
  28f5  39             RTS                               

; ---- function FUN_M65_r2_08000__28f6
FUN_M65_r2_08000__28f6:
  28f6  3406           PSHS  B A                         
  28f8  FC70C0         LDD 0x70c0                        
  28fb  FD6074         STD 0x6074                        
  28fe  17E129         LBSR 0x0a2a                       
  2901  C613           LDB #0x13                         
  2903  AD9FFC36       JSR [0xfc36]                      
  2907  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  290b  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M65_r2_08000__2921:
  2921  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$2972 ->$2946 $0001 $0001 $0000
  2925  01             db 1h                             
  2926  01             db 1h                             
  2927  02             db 2h                             
  2928  01             db 1h                             
  2929  01             db 1h                             
  292a  00             db 0h                             
  292b  01             db 1h                             
  292c  80             db 80h                            
  292d  0004           dw 4h                             
  292f  0000           dw 0h                             
  2931  0000           dw 0h                             
  2933  2972           addr M65_r2_08000::2972           
  2935  2946           addr M65_r2_08000::2946           
  2937  0001           dw 1h                             
  2939  0001           dw 1h                             
  293b  0000           dw 0h                             
LAB_M65_r2_08000__293d:
  293d  170032         LBSR 0x2972                       
  2940  170133         LBSR 0x2a76                       
  2943  3506           PULS  A B                         
  2945  39             RTS                               

; ---- function FUN_M65_r2_08000__2946
FUN_M65_r2_08000__2946:
  2946  3426           PSHS  Y B A                       
  2948  FC6062         LDD 0x6062                        
  294b  FD70C0         STD 0x70c0                        
  294e  CC71B2         LDD #0x71b2                       
  2951  837170         SUBD #0x7170                      
  2954  1F02           TFR D,Y                           
  2956  FC70C0         LDD 0x70c0                        
  2959  AD9FFC80       JSR [0xfc80]                      
  295d  108E0009       LDY #0x9                          
  2961  FC70C0         LDD 0x70c0                        
  2964  AD9FFE40       JSR [0xfe40]                      
  2968  8D08           BSR 0x2972                        
  296a  170109         LBSR 0x2a76                       
  296d  8D63           BSR 0x29d2                        
  296f  3526           PULS  A B Y                       
  2971  39             RTS                               

; ---- function FUN_M65_r2_08000__2972
FUN_M65_r2_08000__2972:
  2972  C626           LDB #0x26                         
  2974  AD9FFC36       JSR [0xfc36]                      
  2978  FC70C0         LDD 0x70c0                        
  297b  10830000       CMPD #0x0                         
  297f  10270045       LBEQ 0x29c8                       
  2983  FC70C0         LDD 0x70c0                        
  2986  10830001       CMPD #0x1                         
  298a  10270031       LBEQ 0x29bf                       
  298e  FC70C0         LDD 0x70c0                        
  2991  10830002       CMPD #0x2                         
  2995  1027001D       LBEQ 0x29b6                       
  2999  FC70C0         LDD 0x70c0                        
  299c  10830003       CMPD #0x3                         
  29a0  10270009       LBEQ 0x29ad                       
  29a4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C8"
  29a8  433800         char[3] "C8"                      
LAB_M65_r2_08000__29ab:
  29ab  2024           BRA 0x29d1                        
LAB_M65_r2_08000__29ad:
  29ad  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C7"
  29b1  433700         char[3] "C7"                      
LAB_M65_r2_08000__29b4:
  29b4  201B           BRA 0x29d1                        
LAB_M65_r2_08000__29b6:
  29b6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C6"
  29ba  433600         char[3] "C6"                      
LAB_M65_r2_08000__29bd:
  29bd  2012           BRA 0x29d1                        
LAB_M65_r2_08000__29bf:
  29bf  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C5"
  29c3  433500         char[3] "C5"                      
LAB_M65_r2_08000__29c6:
  29c6  2009           BRA 0x29d1                        
LAB_M65_r2_08000__29c8:
  29c8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C4"
  29cc  433400         char[3] "C4"                      
LAB_M65_r2_08000__29cf:
  29cf  2000           BRA 0x29d1                        
LAB_M65_r2_08000__29d1:
  29d1  39             RTS                               

; ---- function FUN_M65_r2_08000__29d2
FUN_M65_r2_08000__29d2:
  29d2  1700C5         LBSR 0x2a9a                       
  29d5  39             RTS                               

; ---- function FUN_M65_r2_08000__29d6
FUN_M65_r2_08000__29d6:
  29d6  3426           PSHS  Y B A                       
  29d8  AD9FFC8E       JSR [0xfc8e]                      
  29dc  FC60F9         LDD 0x60f9                        
  29df  FD70BE         STD 0x70be                        
  29e2  FD6074         STD 0x6074                        
  29e5  1700B2         LBSR 0x2a9a                       
  29e8  CC71B1         LDD #0x71b1                       
  29eb  837170         SUBD #0x7170                      
  29ee  1F02           TFR D,Y                           
  29f0  FC70BE         LDD 0x70be                        
  29f3  AD9FFC80       JSR [0xfc80]                      
  29f7  3526           PULS  A B Y                       
  29f9  39             RTS                               

; ---- function FUN_M65_r2_08000__29fa
FUN_M65_r2_08000__29fa:
  29fa  3406           PSHS  B A                         
  29fc  FC70BE         LDD 0x70be                        
  29ff  FD6074         STD 0x6074                        
  2a02  17E025         LBSR 0x0a2a                       
  2a05  C613           LDB #0x13                         
  2a07  AD9FFC36       JSR [0xfc36]                      
  2a0b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  2a0f  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M65_r2_08000__2a25:
  2a25  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$2A76 ->$2A4A $0001 $0001 $0000
  2a29  01             db 1h                             
  2a2a  01             db 1h                             
  2a2b  02             db 2h                             
  2a2c  01             db 1h                             
  2a2d  01             db 1h                             
  2a2e  00             db 0h                             
  2a2f  02             db 2h                             
  2a30  80             db 80h                            
  2a31  002E           dw 2Eh                            
  2a33  0000           dw 0h                             
  2a35  0000           dw 0h                             
  2a37  2A76           addr M65_r2_08000::2a76           
  2a39  2A4A           addr M65_r2_08000::2a4a           
  2a3b  0001           dw 1h                             
  2a3d  0001           dw 1h                             
  2a3f  0000           dw 0h                             
LAB_M65_r2_08000__2a41:
  2a41  170032         LBSR 0x2a76                       
  2a44  17FF2B         LBSR 0x2972                       
  2a47  3506           PULS  A B                         
  2a49  39             RTS                               

; ---- function FUN_M65_r2_08000__2a4a
FUN_M65_r2_08000__2a4a:
  2a4a  3426           PSHS  Y B A                       
  2a4c  FC6062         LDD 0x6062                        
  2a4f  FD70BE         STD 0x70be                        
  2a52  CC71B1         LDD #0x71b1                       
  2a55  837170         SUBD #0x7170                      
  2a58  1F02           TFR D,Y                           
  2a5a  FC70BE         LDD 0x70be                        
  2a5d  AD9FFC80       JSR [0xfc80]                      
  2a61  108E0008       LDY #0x8                          
  2a65  FC70BE         LDD 0x70be                        
  2a68  AD9FFE40       JSR [0xfe40]                      
  2a6c  8D08           BSR 0x2a76                        
  2a6e  17FF01         LBSR 0x2972                       
  2a71  8D27           BSR 0x2a9a                        
  2a73  3526           PULS  A B Y                       
  2a75  39             RTS                               

; ---- function FUN_M65_r2_08000__2a76
FUN_M65_r2_08000__2a76:
  2a76  C61C           LDB #0x1c                         
  2a78  AD9FFC36       JSR [0xfc36]                      
  2a7c  FC70C0         LDD 0x70c0                        
  2a7f  860C           LDA #0xc                          
  2a81  3D             MUL                               
  2a82  C30002         ADDD #0x2                         
  2a85  F370BE         ADDD 0x70be                       
  2a88  8604           LDA #0x4                          
  2a8a  3D             MUL                               
  2a8b  C331F5         ADDD #0x31f5                      
  2a8e  F3600D         ADDD 0x600d                       
  2a91  1F01           TFR D,X                           
  2a93  C604           LDB #0x4                          
  2a95  AD9FFC3A       JSR [0xfc3a]                      
  2a99  39             RTS                               

; ---- function FUN_M65_r2_08000__2a9a
FUN_M65_r2_08000__2a9a:
  2a9a  3476           PSHS  U Y X B A                   
  2a9c  170232         LBSR 0x2cd1                       
  2a9f  FC714A         LDD 0x714a                        
  2aa2  10830000       CMPD #0x0                         
  2aa6  1027000D       LBEQ 0x2ab7                       
  2aaa  FC7162         LDD 0x7162                        
  2aad  AD9FFD3C       JSR [0xfd3c]                      
  2ab1  AD9FFD44       JSR [0xfd44]                      
  2ab5  2007           BRA 0x2abe                        
LAB_M65_r2_08000__2ab7:
  2ab7  FC7162         LDD 0x7162                        
  2aba  AD9FFD3C       JSR [0xfd3c]                      
LAB_M65_r2_08000__2abe:
  2abe  3576           PULS  A B X Y U                   
  2ac0  39             RTS                               

; ---- function FUN_M65_r2_08000__2ac1
FUN_M65_r2_08000__2ac1:
  2ac1  3426           PSHS  Y B A                       
  2ac3  AD9FFC8E       JSR [0xfc8e]                      
  2ac7  FC60F9         LDD 0x60f9                        
  2aca  FD70C8         STD 0x70c8                        
  2acd  FD6074         STD 0x6074                        
  2ad0  1700EB         LBSR 0x2bbe                       
  2ad3  CC71B3         LDD #0x71b3                       
  2ad6  837170         SUBD #0x7170                      
  2ad9  1F02           TFR D,Y                           
  2adb  FC70C8         LDD 0x70c8                        
  2ade  AD9FFC80       JSR [0xfc80]                      
  2ae2  3526           PULS  A B Y                       
  2ae4  39             RTS                               

; ---- function FUN_M65_r2_08000__2ae5
FUN_M65_r2_08000__2ae5:
  2ae5  3406           PSHS  B A                         
  2ae7  FC70C8         LDD 0x70c8                        
  2aea  FD6074         STD 0x6074                        
  2aed  17DF3A         LBSR 0x0a2a                       
  2af0  C604           LDB #0x4                          
  2af2  AD9FFC36       JSR [0xfc36]                      
  2af6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " deglitch:                          "
  2afa  0A6465676C69.. char[37] "\ndeglitch:                          "
LAB_M65_r2_08000__2b1f:
  2b1f  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$2B68 ->$2B41 $0001 $0001 $0000
  2b23  01             db 1h                             
  2b24  01             db 1h                             
  2b25  02             db 2h                             
  2b26  01             db 1h                             
  2b27  01             db 1h                             
  2b28  00             db 0h                             
  2b29  02             db 2h                             
  2b2a  80             db 80h                            
  2b2b  0000           dw 0h                             
  2b2d  FFFF           dw FFFFh                          
  2b2f  0000           dw 0h                             
  2b31  2B68           addr M65_r2_08000::2b68           
  2b33  2B41           addr M65_r2_08000::2b41           
  2b35  0001           dw 1h                             
  2b37  0001           dw 1h                             
  2b39  0000           dw 0h                             
LAB_M65_r2_08000__2b3b:
  2b3b  17002A         LBSR 0x2b68                       
  2b3e  3506           PULS  A B                         
  2b40  39             RTS                               

; ---- function FUN_M65_r2_08000__2b41
FUN_M65_r2_08000__2b41:
  2b41  3426           PSHS  Y B A                       
  2b43  FC6074         LDD 0x6074                        
  2b46  FD70C8         STD 0x70c8                        
  2b49  CC71B3         LDD #0x71b3                       
  2b4c  837170         SUBD #0x7170                      
  2b4f  1F02           TFR D,Y                           
  2b51  FC70C8         LDD 0x70c8                        
  2b54  AD9FFC80       JSR [0xfc80]                      
  2b58  108E000B       LDY #0xb                          
  2b5c  FC70C8         LDD 0x70c8                        
  2b5f  AD9FFE40       JSR [0xfe40]                      
  2b63  8D59           BSR 0x2bbe                        
  2b65  3526           PULS  A B Y                       
  2b67  39             RTS                               

; ---- function FUN_M65_r2_08000__2b68
FUN_M65_r2_08000__2b68:
  2b68  3456           PSHS  U X B A                     
  2b6a  FC70C8         LDD 0x70c8                        
  2b6d  10830000       CMPD #0x0                         
  2b71  10270024       LBEQ 0x2b99                       
  2b75  C60F           LDB #0xf                          
  2b77  AD9FFC36       JSR [0xfc36]                      
  2b7b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "channel 1 and channel 2"
  2b7f  6368616E6E65.. char[24] "channel 1 and channel 2"
LAB_M65_r2_08000__2b97:
  2b97  2022           BRA 0x2bbb                        
LAB_M65_r2_08000__2b99:
  2b99  C60F           LDB #0xf                          
  2b9b  AD9FFC36       JSR [0xfc36]                      
  2b9f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "lock to channel 1      "
  2ba3  6C6F636B2074.. char[24] "lock to channel 1      "
LAB_M65_r2_08000__2bbb:
  2bbb  3556           PULS  A B X U                     
  2bbd  39             RTS                               

; ---- function FUN_M65_r2_08000__2bbe
FUN_M65_r2_08000__2bbe:
  2bbe  3476           PSHS  U Y X B A                   
  2bc0  FC70C8         LDD 0x70c8                        
  2bc3  FD70C6         STD 0x70c6                        
  2bc6  CC0000         LDD #0x0                          
  2bc9  FD710A         STD 0x710a                        
  2bcc  3576           PULS  A B X Y U                   
  2bce  39             RTS                               

; ---- function FUN_M65_r2_08000__2bcf
FUN_M65_r2_08000__2bcf:
  2bcf  3426           PSHS  Y B A                       
  2bd1  AD9FFC8E       JSR [0xfc8e]                      
  2bd5  FC60F9         LDD 0x60f9                        
  2bd8  FD70C2         STD 0x70c2                        
  2bdb  FD6074         STD 0x6074                        
  2bde  1700D2         LBSR 0x2cb3                       
  2be1  CC71B4         LDD #0x71b4                       
  2be4  837170         SUBD #0x7170                      
  2be7  1F02           TFR D,Y                           
  2be9  FC70C2         LDD 0x70c2                        
  2bec  AD9FFC80       JSR [0xfc80]                      
  2bf0  3526           PULS  A B Y                       
  2bf2  39             RTS                               

; ---- function FUN_M65_r2_08000__2bf3
FUN_M65_r2_08000__2bf3:
  2bf3  FC70C2         LDD 0x70c2                        
  2bf6  FD6074         STD 0x6074                        
  2bf9  17DE2E         LBSR 0x0a2a                       
  2bfc  C604           LDB #0x4                          
  2bfe  AD9FFC36       JSR [0xfc36]                      
  2c02  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " polyphonic-                   -solo"
  2c06  0A706F6C7970.. char[37] "\npolyphonic-                   -solo"
LAB_M65_r2_08000__2c2b:
  2c2b  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$2C70 ->$2C4B $0005 $0005 $0000
  2c2f  01             db 1h                             
  2c30  01             db 1h                             
  2c31  02             db 2h                             
  2c32  01             db 1h                             
  2c33  01             db 1h                             
  2c34  00             db 0h                             
  2c35  03             db 3h                             
  2c36  80             db 80h                            
  2c37  005F           dw 5Fh                            
  2c39  0005           dw 5h                             
  2c3b  0000           dw 0h                             
  2c3d  2C70           addr M65_r2_08000::2c70           
  2c3f  2C4B           addr M65_r2_08000::2c4b           
  2c41  0005           dw 5h                             
  2c43  0005           dw 5h                             
  2c45  0000           dw 0h                             
LAB_M65_r2_08000__2c47:
  2c47  170026         LBSR 0x2c70                       
  2c4a  39             RTS                               

; ---- function FUN_M65_r2_08000__2c4b
FUN_M65_r2_08000__2c4b:
  2c4b  FC6074         LDD 0x6074                        
  2c4e  FD70C2         STD 0x70c2                        
  2c51  CC71B4         LDD #0x71b4                       
  2c54  837170         SUBD #0x7170                      
  2c57  1F02           TFR D,Y                           
  2c59  FC70C2         LDD 0x70c2                        
  2c5c  AD9FFC80       JSR [0xfc80]                      
  2c60  108E000A       LDY #0xa                          
  2c64  FC70C2         LDD 0x70c2                        
  2c67  AD9FFE40       JSR [0xfe40]                      
  2c6b  8D46           BSR 0x2cb3                        
  2c6d  8D01           BSR 0x2c70                        
  2c6f  39             RTS                               

; ---- function FUN_M65_r2_08000__2c70
FUN_M65_r2_08000__2c70:
  2c70  3466           PSHS  U Y B A                     
  2c72  C610           LDB #0x10                         
  2c74  AD9FFC36       JSR [0xfc36]                      
  2c78  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                   "
  2c7c  202020202020.. char[20] "                   "    
LAB_M65_r2_08000__2c90:
  2c90  FC70C2         LDD 0x70c2                        
  2c93  830005         SUBD #0x5                         
  2c96  3606           PSHU  B A                         
  2c98  CC0005         LDD #0x5                          
  2c9b  3606           PSHU  B A                         
  2c9d  AD9FFCEA       JSR [0xfcea]                      
  2ca1  3706           PULU  A B                         
  2ca3  C30010         ADDD #0x10                        
  2ca6  AD9FFC36       JSR [0xfc36]                      
  2caa  C62A           LDB #0x2a                         
  2cac  AD9FFC2A       JSR [0xfc2a]                      
  2cb0  3566           PULS  A B Y U                     
  2cb2  39             RTS                               

; ---- function FUN_M65_r2_08000__2cb3
FUN_M65_r2_08000__2cb3:
  2cb3  3456           PSHS  U X B A                     
  2cb5  FC70C2         LDD 0x70c2                        
  2cb8  3606           PSHU  B A                         
  2cba  CC0147         LDD #0x147                        
  2cbd  3606           PSHU  B A                         
  2cbf  AD9FFCEE       JSR [0xfcee]                      
  2cc3  3706           PULU  A B                         
  2cc5  FD713C         STD 0x713c                        
  2cc8  CC0000         LDD #0x0                          
  2ccb  FD710A         STD 0x710a                        
  2cce  3556           PULS  A B X U                     
  2cd0  39             RTS                               

; ---- function FUN_M65_r2_08000__2cd1
FUN_M65_r2_08000__2cd1:
  2cd1  3476           PSHS  U Y X B A                   
  2cd3  FC70BE         LDD 0x70be                        
  2cd6  8602           LDA #0x2                          
  2cd8  3D             MUL                               
  2cd9  C333A5         ADDD #0x33a5                      
  2cdc  F3600D         ADDD 0x600d                       
  2cdf  1F01           TFR D,X                           
  2ce1  EC84           LDD ,X                            
  2ce3  FD712E         STD 0x712e                        
  2ce6  3606           PSHU  B A                         
  2ce8  CCFFFF         LDD #0xffff                       
  2ceb  3606           PSHU  B A                         
  2ced  AD9FFCDE       JSR [0xfcde]                      
  2cf1  3706           PULU  A B                         
  2cf3  830002         SUBD #0x2                         
  2cf6  FD7130         STD 0x7130                        
  2cf9  FD7132         STD 0x7132                        
  2cfc  FC70C0         LDD 0x70c0                        
  2cff  10830000       CMPD #0x0                         
  2d03  10270041       LBEQ 0x2d48                       
  2d07  FC70C0         LDD 0x70c0                        
  2d0a  10830001       CMPD #0x1                         
  2d0e  1027002E       LBEQ 0x2d40                       
  2d12  FC70C0         LDD 0x70c0                        
  2d15  10830002       CMPD #0x2                         
  2d19  1027001B       LBEQ 0x2d38                       
  2d1d  FC70C0         LDD 0x70c0                        
  2d20  10830003       CMPD #0x3                         
  2d24  10270008       LBEQ 0x2d30                       
  2d28  CC0001         LDD #0x1                          
  2d2b  FD7136         STD 0x7136                        
  2d2e  2045           BRA 0x2d75                        
LAB_M65_r2_08000__2d30:
  2d30  CC0002         LDD #0x2                          
  2d33  FD7136         STD 0x7136                        
  2d36  2016           BRA 0x2d4e                        
LAB_M65_r2_08000__2d38:
  2d38  CC0004         LDD #0x4                          
  2d3b  FD7136         STD 0x7136                        
  2d3e  200E           BRA 0x2d4e                        
LAB_M65_r2_08000__2d40:
  2d40  CC0008         LDD #0x8                          
  2d43  FD7136         STD 0x7136                        
  2d46  2006           BRA 0x2d4e                        
LAB_M65_r2_08000__2d48:
  2d48  CC0010         LDD #0x10                         
  2d4b  FD7136         STD 0x7136                        
LAB_M65_r2_08000__2d4e:
  2d4e  FC70C0         LDD 0x70c0                        
  2d51  860A           LDA #0xa                          
  2d53  3D             MUL                               
  2d54  C3341D         ADDD #0x341d                      
  2d57  F3600D         ADDD 0x600d                       
  2d5a  1F01           TFR D,X                           
  2d5c  EC81           LDD ,X++                          
  2d5e  FD7120         STD 0x7120                        
  2d61  EC81           LDD ,X++                          
  2d63  FD7122         STD 0x7122                        
  2d66  EC81           LDD ,X++                          
  2d68  FD7124         STD 0x7124                        
  2d6b  EC81           LDD ,X++                          
  2d6d  FD7126         STD 0x7126                        
  2d70  EC81           LDD ,X++                          
  2d72  FD7128         STD 0x7128                        
LAB_M65_r2_08000__2d75:
  2d75  FC70C0         LDD 0x70c0                        
  2d78  8630           LDA #0x30                         
  2d7a  3D             MUL                               
  2d7b  FD70F6         STD 0x70f6                        
  2d7e  CC002E         LDD #0x2e                         
  2d81  B370BE         SUBD 0x70be                       
  2d84  C4FC           ANDB #0xfc                        
  2d86  F370F6         ADDD 0x70f6                       
  2d89  C33105         ADDD #0x3105                      
  2d8c  F3600D         ADDD 0x600d                       
  2d8f  1F01           TFR D,X                           
  2d91  EC81           LDD ,X++                          
  2d93  FD7160         STD 0x7160                        
  2d96  EC84           LDD ,X                            
  2d98  FD715E         STD 0x715e                        
  2d9b  FC712E         LDD 0x712e                        
  2d9e  3606           PSHU  B A                         
  2da0  FC7136         LDD 0x7136                        
  2da3  58             LSLB                              
  2da4  3606           PSHU  B A                         
  2da6  AD9FFCF0       JSR [0xfcf0]                      
  2daa  3706           PULU  A B                         
  2dac  3706           PULU  A B                         
  2dae  FD70F6         STD 0x70f6                        
  2db1  FC705A         LDD 0x705a                        
  2db4  3606           PSHU  B A                         
  2db6  CC002C         LDD #0x2c                         
  2db9  3606           PSHU  B A                         
  2dbb  AD9FFCEE       JSR [0xfcee]                      
  2dbf  3706           PULU  A B                         
  2dc1  FD70F8         STD 0x70f8                        
  2dc4  2B0C           BMI 0x2dd2                        
  2dc6  FC715E         LDD 0x715e                        
  2dc9  B37160         SUBD 0x7160                       
  2dcc  10B370F8       CMPD 0x70f8                       
  2dd0  2E0E           BGT 0x2de0                        
LAB_M65_r2_08000__2dd2:
  2dd2  FC70F6         LDD 0x70f6                        
  2dd5  F370F8         ADDD 0x70f8                       
  2dd8  B3715E         SUBD 0x715e                       
  2ddb  FD713A         STD 0x713a                        
  2dde  2009           BRA 0x2de9                        
LAB_M65_r2_08000__2de0:
  2de0  FC70F6         LDD 0x70f6                        
  2de3  B37160         SUBD 0x7160                       
  2de6  FD713A         STD 0x713a                        
LAB_M65_r2_08000__2de9:
  2de9  FC7062         LDD 0x7062                        
  2dec  3606           PSHU  B A                         
  2dee  CC002C         LDD #0x2c                         
  2df1  3606           PSHU  B A                         
  2df3  AD9FFCEE       JSR [0xfcee]                      
  2df7  3706           PULU  A B                         
  2df9  FD70F8         STD 0x70f8                        
  2dfc  2B0C           BMI 0x2e0a                        
  2dfe  FC715E         LDD 0x715e                        
  2e01  B37160         SUBD 0x7160                       
  2e04  10B370F8       CMPD 0x70f8                       
  2e08  2E11           BGT 0x2e1b                        
LAB_M65_r2_08000__2e0a:
  2e0a  FC70F6         LDD 0x70f6                        
  2e0d  F370F8         ADDD 0x70f8                       
  2e10  C38000         ADDD #0x8000                      
  2e13  B3715E         SUBD 0x715e                       
  2e16  FD711E         STD 0x711e                        
  2e19  200C           BRA 0x2e27                        
LAB_M65_r2_08000__2e1b:
  2e1b  FC70F6         LDD 0x70f6                        
  2e1e  C38000         ADDD #0x8000                      
  2e21  B37160         SUBD 0x7160                       
  2e24  FD711E         STD 0x711e                        
LAB_M65_r2_08000__2e27:
  2e27  CCFFFF         LDD #0xffff                       
  2e2a  FD70C6         STD 0x70c6                        
  2e2d  FC714C         LDD 0x714c                        
  2e30  1083FFFF       CMPD #0xffff                      
  2e34  10270025       LBEQ 0x2e5d                       
  2e38  FC711E         LDD 0x711e                        
  2e3b  C38000         ADDD #0x8000                      
  2e3e  FD711E         STD 0x711e                        
  2e41  FC705A         LDD 0x705a                        
  2e44  B37062         SUBD 0x7062                       
  2e47  3606           PSHU  B A                         
  2e49  AD9FFCC8       JSR [0xfcc8]                      
  2e4d  3706           PULU  A B                         
  2e4f  1083000A       CMPD #0xa                         
  2e53  2E1C           BGT 0x2e71                        
  2e55  CC0000         LDD #0x0                          
  2e58  FD70C6         STD 0x70c6                        
  2e5b  2014           BRA 0x2e71                        
LAB_M65_r2_08000__2e5d:
  2e5d  FC714A         LDD 0x714a                        
  2e60  1083FFFF       CMPD #0xffff                      
  2e64  10270009       LBEQ 0x2e71                       
  2e68  FC711E         LDD 0x711e                        
  2e6b  C38000         ADDD #0x8000                      
  2e6e  FD713A         STD 0x713a                        
LAB_M65_r2_08000__2e71:
  2e71  FC7130         LDD 0x7130                        
  2e74  3606           PSHU  B A                         
  2e76  FC7136         LDD 0x7136                        
  2e79  3606           PSHU  B A                         
  2e7b  AD9FFCF0       JSR [0xfcf0]                      
  2e7f  3706           PULU  A B                         
  2e81  CCFFFF         LDD #0xffff                       
  2e84  3606           PSHU  B A                         
  2e86  AD9FFCDE       JSR [0xfcde]                      
  2e8a  3706           PULU  A B                         
  2e8c  FD70F6         STD 0x70f6                        
  2e8f  FD7162         STD 0x7162                        
  2e92  F370D2         ADDD 0x70d2                       
  2e95  FD70D6         STD 0x70d6                        
  2e98  FC70F6         LDD 0x70f6                        
  2e9b  F370D4         ADDD 0x70d4                       
  2e9e  FD70DC         STD 0x70dc                        
  2ea1  CC7FFF         LDD #0x7fff                       
  2ea4  3606           PSHU  B A                         
  2ea6  FC70F6         LDD 0x70f6                        
  2ea9  3606           PSHU  B A                         
  2eab  AD9FFCEA       JSR [0xfcea]                      
  2eaf  3706           PULU  A B                         
  2eb1  C30005         ADDD #0x5                         
  2eb4  FD713E         STD 0x713e                        
  2eb7  CC000A         LDD #0xa                          
  2eba  AD9FFD20       JSR [0xfd20]                      
  2ebe  108E0342       LDY #0x342                        
  2ec2  FC713E         LDD 0x713e                        
  2ec5  AD9FFD2E       JSR [0xfd2e]                      
  2ec9  FC714A         LDD 0x714a                        
  2ecc  10830000       CMPD #0x0                         
  2ed0  10270026       LBEQ 0x2efa                       
  2ed4  CC000A         LDD #0xa                          
  2ed7  AD9FFD20       JSR [0xfd20]                      
  2edb  108E0241       LDY #0x241                        
  2edf  FC70DC         LDD 0x70dc                        
  2ee2  AD9FFD2E       JSR [0xfd2e]                      
  2ee6  CC000A         LDD #0xa                          
  2ee9  AD9FFD20       JSR [0xfd20]                      
  2eed  108E0141       LDY #0x141                        
  2ef1  FC70D6         LDD 0x70d6                        
  2ef4  AD9FFD2E       JSR [0xfd2e]                      
  2ef8  2012           BRA 0x2f0c                        
LAB_M65_r2_08000__2efa:
  2efa  CC000A         LDD #0xa                          
  2efd  AD9FFD20       JSR [0xfd20]                      
  2f01  108E0341       LDY #0x341                        
  2f05  FC70DC         LDD 0x70dc                        
  2f08  AD9FFD2E       JSR [0xfd2e]                      
LAB_M65_r2_08000__2f0c:
  2f0c  FC70C8         LDD 0x70c8                        
  2f0f  B470C6         ANDA 0x70c6                       
  2f12  F470C6         ANDB 0x70c6                       
  2f15  FD70C6         STD 0x70c6                        
  2f18  CC0000         LDD #0x0                          
  2f1b  FD710A         STD 0x710a                        
  2f1e  3576           PULS  A B X Y U                   
  2f20  39             RTS                               

; ---- function FUN_M65_r2_08000__2f21
FUN_M65_r2_08000__2f21:
  2f21  3437           PSHS  Y X B A CC                  
  2f23  3706           PULU  A B                         
  2f25  FD70FA         STD 0x70fa                        
  2f28  3706           PULU  A B                         
  2f2a  FD70FC         STD 0x70fc                        
  2f2d  FC70FC         LDD 0x70fc                        
  2f30  C30018         ADDD #0x18                        
  2f33  58             LSLB                              
  2f34  49             ROLA                              
  2f35  F3600D         ADDD 0x600d                       
  2f38  C32F9F         ADDD #0x2f9f                      
  2f3b  1F01           TFR D,X                           
  2f3d  FC70FA         LDD 0x70fa                        
  2f40  FD70F8         STD 0x70f8                        
  2f43  2E08           BGT 0x2f4d                        
  2f45  CC0000         LDD #0x0                          
  2f48  B370F8         SUBD 0x70f8                       
  2f4b  2008           BRA 0x2f55                        
LAB_M65_r2_08000__2f4d:
  2f4d  CC0064         LDD #0x64                         
  2f50  B370F8         SUBD 0x70f8                       
  2f53  3002           LEAX 0x2,X                        
LAB_M65_r2_08000__2f55:
  2f55  58             LSLB                              
  2f56  49             ROLA                              
  2f57  F3600D         ADDD 0x600d                       
  2f5a  C33039         ADDD #0x3039                      
  2f5d  1F02           TFR D,Y                           
  2f5f  EC84           LDD ,X                            
  2f61  3606           PSHU  B A                         
  2f63  ECA4           LDD ,Y                            
  2f65  3606           PSHU  B A                         
  2f67  AD9FFCF2       JSR [0xfcf2]                      
  2f6b  3083           LEAX ,--X                         
  2f6d  FC70F8         LDD 0x70f8                        
  2f70  2E03           BGT 0x2f75                        
  2f72  C30064         ADDD #0x64                        
LAB_M65_r2_08000__2f75:
  2f75  58             LSLB                              
  2f76  49             ROLA                              
  2f77  F3600D         ADDD 0x600d                       
  2f7a  C33039         ADDD #0x3039                      
  2f7d  1F02           TFR D,Y                           
  2f7f  EC89004E       LDD 0x4e,X                        
  2f83  3606           PSHU  B A                         
  2f85  ECA4           LDD ,Y                            
  2f87  3606           PSHU  B A                         
  2f89  AD9FFCF2       JSR [0xfcf2]                      
  2f8d  3706           PULU  A B                         
  2f8f  FD70F6         STD 0x70f6                        
  2f92  CC1000         LDD #0x1000                       
  2f95  B370F6         SUBD 0x70f6                       
  2f98  3606           PSHU  B A                         
  2f9a  3537           PULS CC A B X Y                   
  2f9c  39             RTS                               
  2f9d  .db 00 EC                                            ; ..
DAT_M65_r2_08000__2f9f:
  2f9f  00             ?? 00h                            
  2fa0  .db FA                                               ; .
DAT_M65_r2_08000__2fa1:
  2fa1  01             ?? 01h                            
  2fa2  .db 09 01 19 01 29 01 3B 01 4E 01 62 01 77 01 8D 01  ; ....).;.N.b.w...
  2fb2  .db A4 01 BD 01 D8 01 F4 02 12 02 31 02 53 02 76 02  ; ..........1.S.v.
  2fc2  .db 9B 02 C3 02 ED 03 1A 03 49 03 7B 03 B0 03 E8 04  ; ........I.{.....
  2fd2  .db 23 04 62 04 A5 04 EC 05 37 05 86 05 DA 06 33 06  ; #.b.....7.....3.
  2fe2  .db 92 06 F6 07 60 07 D0 08 47                       ; ....`...G
DAT_M65_r2_08000__2feb:
  2feb  0D             ?? 0Dh                            
  2fec  .db C5 0D 00 0C 45 0B 95 0A EF 0A 51 09 BD 09 31 08  ; ....E.....Q...1.
  2ffc  .db AD 08 31 07 BB 07 4C 06 E3 06 80 06 23 05 CA 05  ; ..1...L.....#...
  300c  .db 77 05 29 04 DF 04 99 04 57 04 18 03 DD 03 A6 03  ; w.).....W.......
  301c  .db 71 03 40 03 11 02 E5 02 BC 02 94 02 6F 02 4C 02  ; q.@.........o.L.
  302c  .db 2B 02 0C 01 EF 01 D3 01 B9 01 A0 01 88           ; +............
DAT_M65_r2_08000__3039:
  3039  7F             ?? 7Fh                           
  303a  .db FF 7F EC 7F D9 7F C6 7F B3 7F A0 7F 8D 7F 7A 7F  ; ..............z.
  304a  .db 67 7F 55 7F 42 7F 39 7F 1C 7F 09 7E F7 7E E4 7E  ; g.U.B.9....~.~.~
  305a  .db D1 7E BE 7E AC 7E 99 7E 86 7E 73 7E 61 7E 4E 7E  ; .~.~.~.~.~s~a~N~
  306a  .db 3B 7E 29 7E 16 7E 03 7D F1 7D DE 7D CC 7D B9 7D  ; ;~)~.~.}.}.}.}.}
  307a  .db A6 7D 94 7D 81 7D 6F 7D 52 7D 4A 7D 37 7D 25 7D  ; .}.}.}o}R}J}7}%}
  308a  .db 12 7D 00 7C ED 7C DB 7C C8 7C B6 7C A3 7C 91 7C  ; .}.|.|.|.|.|.|.|
  309a  .db 7E 7C 6C 7C 5A 7C 48 7C 35 7C 23 7C 11 7B FE 7B  ; ~|l|Z|H|5|#|.{.{
  30aa  .db EC 7B DA 7B C7 7B B5 7B A3 7B 90 7B 7E 7B 6C 7B  ; .{.{.{.{.{.{~{l{
  30ba  .db 5A 7B 47 7B 35 7B 23 7B 11 7A FF 7A EC 7A DA 7A  ; Z{G{5{#{.z.z.z.z
  30ca  .db C8 7A B6 7A A4 7A 92 7A 7F 7A 6D 7A 5B 7A 49 7A  ; .z.z.z.z.zmz[zIz
  30da  .db 37 7A 25 7A 13 7A 01 79 EF 79 DD 79 CB 79 B9 79  ; 7z%z.z.y.y.y.y.y
  30ea  .db A7 79 95 79 83 79 71 79 5F 79 4D 79 3B 79 29 79  ; .y.y.yqy_yMy;y)y
  30fa  .db 17 79 05 78 F3 78 E2 78 D0 78 BE 00 00 01 F4 00  ; .y.x.x.x.x......
  310a  .db 00 02 3F 00 32 02 BC 00 96 03 52 01 2C 03 CF 01  ; ..?.2.....R.,...
  311a  .db C2 04 E2 02 58 06 0E 03 84 07 3A 04 B0 09 2E 06  ; ....X.....:.....
  312a  .db 40 0C 1C 08 34 0F 3C 0F A0 13 EC 00 00 01 2C 00  ; @...4.<.......,.
  313a  .db 00 01 5E 00 32 01 C2 00 64 02 0D 00 AF 02 3F 00  ; ..^.2...d.....?.
  314a  .db FA 02 EE 01 5E 03 E8 01 C2 04 B0 02 8A 06 0E 03  ; ....^...........
  315a  .db 20 08 34 04 4C 0A 8C 08 66 0E 10 00 00 00 AF 00  ;  .4.L...f.......
  316a  .db 00 00 AF 00 32 00 E1 00 32 01 2C 00 64 01 90 00  ; ....2...2.,.d...
  317a  .db 96 02 0D 00 AF 02 BC 00 FA 03 52 01 5E 04 4C 01  ; ..........R.^.L.
  318a  .db 90 06 0E 02 26 07 E9 04 1A 0A BE 00 00 00 AF 00  ; ....&...........
  319a  .db 00 00 E1 00 00 00 E1 00 32 01 13 00 4B 01 13 00  ; ........2...K...
  31aa  .db 64 01 90 00 7D 02 3F 00 AF 02 A3 00 C8 03 52 00  ; d...}.?.......R.
  31ba  .db FA 04 FB 01 2C 06 8B 02 58 08 FC 00 00 00 64 00  ; ....,...X.....d.
  31ca  .db 00 00 7D 00 00 00 7D 00 00 00 AF 00 00 00 AF 00  ; ..}...}.........
  31da  .db 00 01 13 00 00 01 90 00 32 01 F4 00 4B 02 A3 00  ; ........2...K...
  31ea  .db 64 04 1A 00 7D 05 78 00 FA 07 D0 38 20 48 7A 39  ; d...}.x....8 Hz9
  31fa  .db 20 48 7A 39 20 48 7A 31 30 48 7A 31 30 48 7A 31  ;  Hz9 Hz10Hz10Hz1
  320a  .db 31 48 7A 31 32 48 7A 31 32 48 7A 31 33 48 7A 31  ; 1Hz12Hz12Hz13Hz1
  321a  .db 34 48 7A 31 34 48 7A 31 35 48 7A 43 30 20 20 43  ; 4Hz14Hz15HzC0  C
  322a  .db 30 23 20 44 30 20 20 44 30 23 20 45 30 20 20 46  ; 0# D0  D0# E0  F
  323a  .db 30 20 20 46 30 23 20 47 30 20 20 47 30 23 20 41  ; 0  F0# G0  G0# A
  324a  .db 30 20 20 41 30 23 20 42 30 20 20 43 31 20 20 43  ; 0  A0# B0  C1  C
  325a  .db 31 23 20 44 31 20 20 44 31 23 20 45 31 20 20 46  ; 1# D1  D1# E1  F
  326a  .db 31 20 20 46 31 23 20 47 31 20 20 47 31 23 20 41  ; 1  F1# G1  G1# A
  327a  .db 31 20 20 41 31 23 20 42 31 20 20 43 32 20 20 43  ; 1  A1# B1  C2  C
  328a  .db 32 23 20 44 32 20 20 44 32 23 20 45 32 20 20 46  ; 2# D2  D2# E2  F
  329a  .db 32 20 20 46 32 23 20 47 32 20 20 47 32 23 20 41  ; 2  F2# G2  G2# A
  32aa  .db 32 20 20 41 32 23 20 42 32 20 20 43 33 20 20 43  ; 2  A2# B2  C3  C
  32ba  .db 33 23 20 44 33 20 20 44 33 23 20 45 33 20 20 46  ; 3# D3  D3# E3  F
  32ca  .db 33 20 20 46 33 23 20 47 33 20 20 47 33 23 20 41  ; 3  F3# G3  G3# A
  32da  .db 33 20 20 41 33 23 20 42 33 20 20 43 34 20 20 43  ; 3  A3# B3  C4  C
  32ea  .db 34 23 20 44 34 20 20 44 34 23 20 45 34 20 20 46  ; 4# D4  D4# E4  F
  32fa  .db 34 20 20 46 34 23 20 47 34 20 20 47 34 23 20 41  ; 4  F4# G4  G4# A
  330a  .db 34 20 20 41 34 23 20 42 34 20 20 43 35 20 20 43  ; 4  A4# B4  C5  C
  331a  .db 35 23 20 44 35 20 20 44 35 23 20 45 35 20 20 46  ; 5# D5  D5# E5  F
  332a  .db 35 20 20 46 35 23 20 47 35 20 20 47 35 23 20 41  ; 5  F5# G5  G5# A
  333a  .db 35 20 20 41 35 23 20 42 35 20 20 43 36 20 20 43  ; 5  A5# B5  C6  C
  334a  .db 36 23 20 44 36 20 20 44 36 23 20 45 36 20 20 46  ; 6# D6  D6# E6  F
  335a  .db 36 20 20 46 36 23 20 47 36 20 20 47 36 23 20 41  ; 6  F6# G6  G6# A
  336a  .db 36 20 20 41 36 23 20 42 36 20 20 43 37 20 20 43  ; 6  A6# B6  C7  C
  337a  .db 37 23 20 44 37 20 20 44 37 23 20 45 37 20 20 46  ; 7# D7  D7# E7  F
  338a  .db 37 20 20 46 37 23 20 47 37 20 20 47 37 23 20 41  ; 7  F7# G7  G7# A
  339a  .db 37 20 20 41 37 23 20 42 37 20 20 01 3F 01 2D 01  ; 7  A7# B7  .?.-.
  33aa  .db 1C 01 0C 00 FD 00 EF 00 E1 00 D5 00 C9 00 BE 00  ; ................
  33ba  .db B3 00 A9 00 A0 00 97 00 8E 00 86 00 7F 00 78 00  ; ..............x.
  33ca  .db 71 00 6B 00 65 00 5F 00 5A 00 55 00 50 00 4C 00  ; q.k.e._.Z.U.P.L.
  33da  .db 47 00 43 00 40 00 3C 00 39 00 36 00 33 00 30 00  ; G.C.@.<.9.6.3.0.
  33ea  .db 2D 00 2B 00 28 00 26 00 24 00 22 00 20 00 1E 00  ; -.+.(.&.$.". ...
  33fa  .db 1D 00 1B 00 1A 00 18 00 17 00 16 00 14 00 13 00  ; ................
  340a  .db 12 00 11 00 10 00 0F 00 0F 00 0E 00 0D 00 0C 00  ; ................
  341a  .db 0C 00 0B 78 CF 86 D8 00 16 00 2C 00 16 71 57 8D  ; ...x......,..qW.
  342a  .db 52 00 56 00 AC 00 56 61 AD 99 39 01 46 02 8C 01  ; R.V...Va..9.F...
  343a  .db 46 40 10 AD 4B 04 A9 09 52 04 A9                 ; F@..K...R..

;; Module 66 parameter/preset table "DUAL SHIFT", 157 bytes
MODULE_66_TABLE_DUAL_SHIFT_hdr:
  3445  660000A50000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_66_TABLE_DUAL_SHIFT:
  344d  66             ?? 66h    f                       
  344e  .db 01                                               ; .
  344f  4455414C2053.. ds "DUAL SHIFT     "              
  3460  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3470  .db 00 00 00 00 00 00 02 BC 04 B0 00 19 01 F4 00 00  ; ................
  3480  .db 00 64 00 64 00 64 0C 02 FF 5E 04 B0 04 B0 00 19  ; .d.d.d...^......
  3490  .db 01 F4 00 00 00 64 00 64 00 64 00 00 00 00 00 00  ; .....d.d.d......
  34a0  .db 00 00 00 00 00 00 00 00 00 00 02 02 02 02 02 32  ; ...............2
  34b0  .db 00                                               ; .
  34b1  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  34d8  .db 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13 88  ; ................
  34e8  .db 13 88                                            ; ..

;; Module 66 code record 01, 150 bytes, entered at payload start
MODULE_66_01_CODE_hdr:
  34ea  6601009E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_66_01_entry
MODULE_66_01_entry:
  34f2  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $34F6
  34f6  34F6           dw 34F6h                          
LAB_M65_r2_08000__34f8:
  34f8  3477           PSHS  U Y X B A CC                
  34fa  CC0000         LDD #0x0                          
  34fd  FD714E         STD 0x714e                        
  3500  CCFFFF         LDD #0xffff                       
  3503  FD714A         STD 0x714a                        
  3506  FD714C         STD 0x714c                        
  3509  FD7154         STD 0x7154                        
  350c  FD7150         STD 0x7150                        
  350f  CC0BB8         LDD #0xbb8                        
  3512  FD7138         STD 0x7138                        
  3515  17CCC5         LBSR 0x01dd                       
  3518  17CC8A         LBSR 0x01a5                       
  351b  17CD86         LBSR 0x02a4                       
  351e  17CAEF         LBSR 0x0010                       
  3521  C602           LDB #0x2                          
  3523  AD9FFC58       JSR [0xfc58]                      
  3527  B6600A         LDA 0x600a                        
  352a  8166           CMPA #0x66                        
  352c  2710           BEQ 0x353e                        
  352e  8603           LDA #0x3                          
  3530  B760DA         STA 0x60da                        
  3533  AD9FFE38       JSR [0xfe38]                      
  3537  AD9FFED0       JSR [0xfed0]                      
  353b  17CDB3         LBSR 0x02f1                       
LAB_M65_r2_08000__353e:
  353e  17DABF         LBSR 0x1000                       
  3541  17DCC5         LBSR 0x1209                       
  3544  17DDDA         LBSR 0x1321                       
  3547  17DEB9         LBSR 0x1403                       
  354a  17DFC9         LBSR 0x1516                       
  354d  17F54A         LBSR 0x2a9a                       
  3550  17F47F         LBSR 0x29d2                       
  3553  17F75D         LBSR 0x2cb3                       
  3556  17CED2         LBSR 0x042b                       
  3559  8601           LDA #0x1                          
  355b  B76105         STA 0x6105                        
  355e  CC0065         LDD #0x65                         
  3561  FD6106         STD 0x6106                        
  3564  B6600A         LDA 0x600a                        
  3567  8166           CMPA #0x66                        
  3569  270B           BEQ 0x3576                        
  356b  CC4E20         LDD #0x4e20                       
  356e  AD9FFD20       JSR [0xfd20]                      
  3572  AD9FFE36       JSR [0xfe36]                      
LAB_M65_r2_08000__3576:
  3576  AD9FFDF6       JSR [0xfdf6]                      
  357a  AD9FFE18       JSR [0xfe18]                      
  357e  17D4E4         LBSR 0x0a65                       
  3581  AD9FFE10       JSR [0xfe10]                      
  3585  3577           PULS CC A B X Y U                 
  3587  39             RTS                               

;; Module 65 parameter/preset table "LAYERED SHIFT", 157 bytes
MODULE_65_TABLE_LAYERED_SHIFT_hdr:
  3588  650000A50000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_65_TABLE_LAYERED_SHIFT:
  3590  65             ?? 65h    e                       
  3591  .db 01                                               ; .
  3592  4C4159455245.. ds "LAYERED SHIFT  "              
  35a4  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  35b4  .db 00 00 00 00 00 FF F4 04 B0 00 19 03 E8 00 00 00  ; ................
  35c4  .db 64 00 64 00 64 0C 02 FF 5E 00 0C 04 B0 00 19 03  ; d.d.d...^.......
  35d4  .db E8 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00  ; ....d.d.d.......
  35e4  .db 00 00 00 00 00 00 00 00 00 02 02 02 02 02 32 00  ; ..............2.
  35f4  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  3618  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13  ; ................
  3628  .db 88 13 88 13 88                                   ; .....

;; Module 65 code record 01, 150 bytes, entered at payload start
MODULE_65_01_CODE_hdr:
  362d  6501009E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_65_01_entry
MODULE_65_01_entry:
  3635  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $3639
  3639  3639           dw 3639h                          
LAB_M65_r2_08000__363b:
  363b  3477           PSHS  U Y X B A CC                
  363d  CC0000         LDD #0x0                          
  3640  FD714C         STD 0x714c                        
  3643  CCFFFF         LDD #0xffff                       
  3646  FD714A         STD 0x714a                        
  3649  FD714E         STD 0x714e                        
  364c  FD7154         STD 0x7154                        
  364f  FD7150         STD 0x7150                        
  3652  CC0BB8         LDD #0xbb8                        
  3655  FD7138         STD 0x7138                        
  3658  17CB82         LBSR 0x01dd                       
  365b  17CB47         LBSR 0x01a5                       
  365e  17CC43         LBSR 0x02a4                       
  3661  17C9AC         LBSR 0x0010                       
  3664  C602           LDB #0x2                          
  3666  AD9FFC58       JSR [0xfc58]                      
  366a  B6600A         LDA 0x600a                        
  366d  8165           CMPA #0x65                        
  366f  2710           BEQ 0x3681                        
  3671  8603           LDA #0x3                          
  3673  B760DA         STA 0x60da                        
  3676  AD9FFE38       JSR [0xfe38]                      
  367a  AD9FFED0       JSR [0xfed0]                      
  367e  17CC58         LBSR 0x02d9                       
LAB_M65_r2_08000__3681:
  3681  17D97C         LBSR 0x1000                       
  3684  17DB82         LBSR 0x1209                       
  3687  17DC97         LBSR 0x1321                       
  368a  17DD76         LBSR 0x1403                       
  368d  17DE86         LBSR 0x1516                       
  3690  17F33F         LBSR 0x29d2                       
  3693  17F404         LBSR 0x2a9a                       
  3696  17F61A         LBSR 0x2cb3                       
  3699  17CD8F         LBSR 0x042b                       
  369c  8601           LDA #0x1                          
  369e  B76105         STA 0x6105                        
  36a1  CC0065         LDD #0x65                         
  36a4  FD6106         STD 0x6106                        
  36a7  B6600A         LDA 0x600a                        
  36aa  8165           CMPA #0x65                        
  36ac  270B           BEQ 0x36b9                        
  36ae  CC4E20         LDD #0x4e20                       
  36b1  AD9FFD20       JSR [0xfd20]                      
  36b5  AD9FFE36       JSR [0xfe36]                      
LAB_M65_r2_08000__36b9:
  36b9  AD9FFDF6       JSR [0xfdf6]                      
  36bd  AD9FFE18       JSR [0xfe18]                      
  36c1  17D3A1         LBSR 0x0a65                       
  36c4  AD9FFE10       JSR [0xfe10]                      
  36c8  3577           PULS CC A B X Y U                 
  36ca  39             RTS                               

;; Module 67 parameter/preset table "STEREO SHIFT", 125 bytes
MODULE_67_TABLE_STEREO_SHIFT_hdr:
  36cb  670000850000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_67_TABLE_STEREO_SHIFT:
  36d3  67             ?? 67h    g                       
  36d4  .db 01                                               ; .
  36d5  53544552454F.. ds "STEREO SHIFT   "              
  36e8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  36f8  .db 00 00 00 00 02 BC 04 B0 00 19 01 F4 00 00 00 64  ; ...............d
  3708  .db 00 64 00 64 0C 02 00 5A 02 02 02 02 02 32 00     ; .d.d...Z.....2.
  3717  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  373c  .db 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13 88  ; ................
  374c  .db 13 88 13 88                                      ; ....

;; Module 67 code record 01, 153 bytes, entered at payload start
MODULE_67_01_CODE_hdr:
  3750  670100A10000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_67_01_entry
MODULE_67_01_entry:
  3758  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $375C
  375c  375C           dw 375Ch                          
LAB_M65_r2_08000__375e:
  375e  3477           PSHS  U Y X B A CC                
  3760  CC0000         LDD #0x0                          
  3763  FD714A         STD 0x714a                        
  3766  CCFFFF         LDD #0xffff                       
  3769  FD714E         STD 0x714e                        
  376c  FD714C         STD 0x714c                        
  376f  FD7154         STD 0x7154                        
  3772  FD7150         STD 0x7150                        
  3775  CC05DC         LDD #0x5dc                        
  3778  FD7138         STD 0x7138                        
  377b  17CA5F         LBSR 0x01dd                       
  377e  17CA24         LBSR 0x01a5                       
  3781  17CB20         LBSR 0x02a4                       
  3784  17EDD4         LBSR 0x255b                       
  3787  17EBCC         LBSR 0x2356                       
  378a  17C883         LBSR 0x0010                       
  378d  C601           LDB #0x1                          
  378f  AD9FFC58       JSR [0xfc58]                      
  3793  B6600A         LDA 0x600a                        
  3796  8167           CMPA #0x67                        
  3798  2710           BEQ 0x37aa                        
  379a  8603           LDA #0x3                          
  379c  B760DA         STA 0x60da                        
  379f  AD9FFE38       JSR [0xfe38]                      
  37a3  AD9FFED0       JSR [0xfed0]                      
  37a7  17CBDD         LBSR 0x0387                       
LAB_M65_r2_08000__37aa:
  37aa  17D853         LBSR 0x1000                       
  37ad  17DB71         LBSR 0x1321                       
  37b0  17DD63         LBSR 0x1516                       
  37b3  17F2E4         LBSR 0x2a9a                       
  37b6  17F219         LBSR 0x29d2                       
  37b9  17F4F7         LBSR 0x2cb3                       
  37bc  17F3FF         LBSR 0x2bbe                       
  37bf  17CE19         LBSR 0x05db                       
  37c2  8601           LDA #0x1                          
  37c4  B76105         STA 0x6105                        
  37c7  CC0045         LDD #0x45                         
  37ca  FD6106         STD 0x6106                        
  37cd  B6600A         LDA 0x600a                        
  37d0  8167           CMPA #0x67                        
  37d2  270B           BEQ 0x37df                        
  37d4  CC4E20         LDD #0x4e20                       
  37d7  AD9FFD20       JSR [0xfd20]                      
  37db  AD9FFE36       JSR [0xfe36]                      
LAB_M65_r2_08000__37df:
  37df  AD9FFDF6       JSR [0xfdf6]                      
  37e3  AD9FFE18       JSR [0xfe18]                      
  37e7  17D394         LBSR 0x0b7e                       
  37ea  AD9FFE10       JSR [0xfe10]                      
  37ee  3577           PULS CC A B X Y U                 
  37f0  39             RTS                               

;; Module 68 parameter/preset table "REVERSE SHIFT", 157 bytes
MODULE_68_TABLE_REVERSE_SHIFT_hdr:
  37f1  680000A50000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_68_TABLE_REVERSE_SHIFT:
  37f9  68             ?? 68h    h                       
  37fa  .db 01                                               ; .
  37fb  524556455253.. ds "REVERSE SHIFT  "              
  380c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  381c  .db 00 00 00 00 00 00 00 00 04 B0 05 78 05 78 00 00  ; ...........x.x..
  382c  .db 00 64 00 64 00 64 00 00 00 00 00 00 04 B0 05 77  ; .d.d.d.........w
  383c  .db 05 78 00 00 00 64 00 64 00 64 00 00 00 00 00 00  ; .x...d.d.d......
  384c  .db 00 00 00 00 00 00 00 00 00 00 02 02 02 02 02 32  ; ...............2
  385c  .db 00                                               ; .
  385d  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  3884  .db 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13 88  ; ................
  3894  .db 13 88                                            ; ..

;; Module 68 code record 01, 150 bytes, entered at payload start
MODULE_68_01_CODE_hdr:
  3896  6801009E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_68_01_entry
MODULE_68_01_entry:
  389e  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $38A2
  38a2  38A2           dw 38A2h                          
LAB_M65_r2_08000__38a4:
  38a4  3477           PSHS  U Y X B A CC                
  38a6  CC0000         LDD #0x0                          
  38a9  FD7150         STD 0x7150                        
  38ac  CCFFFF         LDD #0xffff                       
  38af  FD714E         STD 0x714e                        
  38b2  FD714A         STD 0x714a                        
  38b5  FD714C         STD 0x714c                        
  38b8  FD7154         STD 0x7154                        
  38bb  CCFFF6         LDD #0xfff6                       
  38be  FD7158         STD 0x7158                        
  38c1  CC0DAC         LDD #0xdac                        
  38c4  FD715A         STD 0x715a                        
  38c7  17C913         LBSR 0x01dd                       
  38ca  17C8D8         LBSR 0x01a5                       
  38cd  17C9D4         LBSR 0x02a4                       
  38d0  C602           LDB #0x2                          
  38d2  AD9FFC58       JSR [0xfc58]                      
  38d6  B6600A         LDA 0x600a                        
  38d9  8168           CMPA #0x68                        
  38db  2710           BEQ 0x38ed                        
  38dd  8603           LDA #0x3                          
  38df  B760DA         STA 0x60da                        
  38e2  AD9FFE38       JSR [0xfe38]                      
  38e6  AD9FFED0       JSR [0xfed0]                      
  38ea  17CA1C         LBSR 0x0309                       
LAB_M65_r2_08000__38ed:
  38ed  17D710         LBSR 0x1000                       
  38f0  17D916         LBSR 0x1209                       
  38f3  17DA2B         LBSR 0x1321                       
  38f6  17DD19         LBSR 0x1612                       
  38f9  17DE1B         LBSR 0x1717                       
  38fc  17DD13         LBSR 0x1612                       
  38ff  17DE15         LBSR 0x1717                       
  3902  17CE0F         LBSR 0x0714                       
  3905  8601           LDA #0x1                          
  3907  B76105         STA 0x6105                        
  390a  CC0065         LDD #0x65                         
  390d  FD6106         STD 0x6106                        
  3910  B6600A         LDA 0x600a                        
  3913  8168           CMPA #0x68                        
  3915  270B           BEQ 0x3922                        
  3917  CC4E20         LDD #0x4e20                       
  391a  AD9FFD20       JSR [0xfd20]                      
  391e  AD9FFE36       JSR [0xfe36]                      
LAB_M65_r2_08000__3922:
  3922  AD9FFDF6       JSR [0xfdf6]                      
  3926  AD9FFE18       JSR [0xfe18]                      
  392a  17D338         LBSR 0x0c65                       
  392d  AD9FFE10       JSR [0xfe10]                      
  3931  3577           PULS CC A B X Y U                 
  3933  39             RTS                               

;; Module 64 parameter/preset table "DIATONIC SHIFT", 198 bytes
MODULE_64_TABLE_DIATONIC_SHIFT_hdr:
  3934  640000CE0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_64_TABLE_DIATONIC_SHIFT:
  393c  64             ?? 64h    d                       
  393d  .db 01                                               ; .
  393e  444941544F4E.. ds "DIATONIC SHIFT "              
  3950  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3960  .db 00 00 00 00 00 09 0B 00 00 00 19 03 E8 00 00 00  ; ................
  3970  .db 64 00 64 00 64 0C 02 FF 46 00 00 00 00 00 00 00  ; d.d.d...F.......
  3980  .db 00 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00  ; ....d.d.d.......
  3990  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  39a0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  39b0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF  ; ................
  39c0  .db 00 14 02 02 02 02 02 32 00                       ; .......2.
  39c9  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  39f0  .db 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13 88  ; ................
  3a00  .db 13 88                                            ; ..

;; Module 64 code record 01, 165 bytes, entered at payload start
MODULE_64_01_CODE_hdr:
  3a02  640100AD0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_64_01_entry
MODULE_64_01_entry:
  3a0a  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $3A0E
  3a0e  3A0E           dw 3A0Eh                          
LAB_M65_r2_08000__3a10:
  3a10  3477           PSHS  U Y X B A CC                
  3a12  CC0000         LDD #0x0                          
  3a15  FD7154         STD 0x7154                        
  3a18  CCFFFF         LDD #0xffff                       
  3a1b  FD714A         STD 0x714a                        
  3a1e  FD714E         STD 0x714e                        
  3a21  FD714C         STD 0x714c                        
  3a24  FD7150         STD 0x7150                        
  3a27  CC0BB8         LDD #0xbb8                        
  3a2a  FD7138         STD 0x7138                        
  3a2d  CC1EB7         LDD #0x1eb7                       
  3a30  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  3a34  600F           addr 600f                         
LAB_M65_r2_08000__3a36:
  3a36  17C7A4         LBSR 0x01dd                       
  3a39  17C769         LBSR 0x01a5                       
  3a3c  17C865         LBSR 0x02a4                       
  3a3f  17C5CE         LBSR 0x0010                       
  3a42  C602           LDB #0x2                          
  3a44  AD9FFC58       JSR [0xfc58]                      
  3a48  B6600A         LDA 0x600a                        
  3a4b  8164           CMPA #0x64                        
  3a4d  2710           BEQ 0x3a5f                        
  3a4f  8603           LDA #0x3                          
  3a51  B760DA         STA 0x60da                        
  3a54  AD9FFE38       JSR [0xfe38]                      
  3a58  AD9FFED0       JSR [0xfed0]                      
  3a5c  17C862         LBSR 0x02c1                       
LAB_M65_r2_08000__3a5f:
  3a5f  17D59E         LBSR 0x1000                       
  3a62  17DDE9         LBSR 0x184e                       
  3a65  17E037         LBSR 0x1a9f                       
  3a68  17E11F         LBSR 0x1b8a                       
  3a6b  17D6D8         LBSR 0x1146                       
  3a6e  17DAA5         LBSR 0x1516                       
  3a71  17F026         LBSR 0x2a9a                       
  3a74  17EF5B         LBSR 0x29d2                       
  3a77  17F239         LBSR 0x2cb3                       
  3a7a  17CE20         LBSR 0x089d                       
  3a7d  8601           LDA #0x1                          
  3a7f  B76105         STA 0x6105                        
  3a82  CC008E         LDD #0x8e                         
  3a85  FD6106         STD 0x6106                        
  3a88  B6600A         LDA 0x600a                        
  3a8b  8164           CMPA #0x64                        
  3a8d  270B           BEQ 0x3a9a                        
  3a8f  CC4E20         LDD #0x4e20                       
  3a92  AD9FFD20       JSR [0xfd20]                      
  3a96  AD9FFE36       JSR [0xfe36]                      
LAB_M65_r2_08000__3a9a:
  3a9a  AD9FFDF6       JSR [0xfdf6]                      
  3a9e  AD9FFE18       JSR [0xfe18]                      
  3aa2  17D2DB         LBSR 0x0d80                       
  3aa5  AD9FFE12       JSR [0xfe12]                      
  3aa9  17D266         LBSR 0x0d12                       
  3aac  3577           PULS CC A B X Y U                 
  3aae  39             RTS                               

;; TMS32010 program 04 for DSP 1: 539 words loaded at $800 (written via bank latch $81)
DSPPROG_04_DSP1_hdr:
  3aaf  041004400000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_04_DSP1:
  3ab7  080068807F8B.. dw[540]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3eef  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3ef7  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f07  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f17  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f27  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f37  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f47  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f57  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f67  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f77  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f87  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f97  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa7  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb7  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc7  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd7  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe7  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff7  .db FF FF FF FF FF FF FF FF FF                       ; .........
