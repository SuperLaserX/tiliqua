; H3000_v153  block M65_small_00000  M65_small_00000::0000-M65_small_00000::3fff
; Bank small_00000 (module id 65)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 65 code record 02, 13399 bytes, entered at payload start
MODULE_65_02_CODE_hdr:
  0008  6502345F0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

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

; ---- function FUN_M65_small_00000__002f
FUN_M65_small_00000__002f:
  002f  3436           PSHS  Y X B A                     
  0031  3401           PSHS  CC                          
  0033  AD9FFC54       JSR [0xfc54]                      
  0037  FC70F2         LDD 0x70f2                        
  003a  2615           BNE 0x0051                        
  003c  CC005E         LDD #0x5e                         
  003f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  0043  6013           addr 6013                         
LAB_M65_small_00000__0045:
  0045  AD9FFC56       JSR [0xfc56]                      
  0049  3501           PULS CC                           
  004b  3536           PULS  A B X Y                     
  004d  3261           LEAS 0x1,S                        
  004f  3580           PULS  PC                          
LAB_M65_small_00000__0051:
  0051  AD9FFD76       JSR [0xfd76]                      
  0055  AD9FFC56       JSR [0xfc56]                      
  0059  3501           PULS CC                           
  005b  3536           PULS  A B X Y                     
  005d  3B             RTI                               

; ---- function FUN_M65_small_00000__005e
FUN_M65_small_00000__005e:
  005e  3436           PSHS  Y X B A                     
  0060  CC000A         LDD #0xa                          
  0063  AD9FFD20       JSR [0xfd20]                      
  0067  108E0428       LDY #0x428                        
  006b  FC7108         LDD 0x7108                        
  006e  AD9FFD2E       JSR [0xfd2e]                      
  0072  CC000A         LDD #0xa                          
  0075  AD9FFD20       JSR [0xfd20]                      
  0079  108E0429       LDY #0x429                        
  007d  FC710A         LDD 0x710a                        
  0080  AD9FFD2E       JSR [0xfd2e]                      
  0084  CC000A         LDD #0xa                          
  0087  AD9FFD20       JSR [0xfd20]                      
  008b  108E042A       LDY #0x42a                        
  008f  FC710C         LDD 0x710c                        
  0092  AD9FFD2E       JSR [0xfd2e]                      
  0096  CC000A         LDD #0xa                          
  0099  AD9FFD20       JSR [0xfd20]                      
  009d  108E042B       LDY #0x42b                        
  00a1  FC710E         LDD 0x710e                        
  00a4  AD9FFD2E       JSR [0xfd2e]                      
  00a8  CC000A         LDD #0xa                          
  00ab  AD9FFD20       JSR [0xfd20]                      
  00af  108E042C       LDY #0x42c                        
  00b3  FC7110         LDD 0x7110                        
  00b6  AD9FFD2E       JSR [0xfd2e]                      
  00ba  CC000A         LDD #0xa                          
  00bd  AD9FFD20       JSR [0xfd20]                      
  00c1  108E0426       LDY #0x426                        
  00c5  FC7124         LDD 0x7124                        
  00c8  AD9FFD2E       JSR [0xfd2e]                      
  00cc  CC000A         LDD #0xa                          
  00cf  AD9FFD20       JSR [0xfd20]                      
  00d3  108E0421       LDY #0x421                        
  00d7  FC7116         LDD 0x7116                        
  00da  AD9FFD2E       JSR [0xfd2e]                      
  00de  CC000A         LDD #0xa                          
  00e1  AD9FFD20       JSR [0xfd20]                      
  00e5  108E0422       LDY #0x422                        
  00e9  FC7118         LDD 0x7118                        
  00ec  AD9FFD2E       JSR [0xfd2e]                      
  00f0  CC000A         LDD #0xa                          
  00f3  AD9FFD20       JSR [0xfd20]                      
  00f7  108E0423       LDY #0x423                        
  00fb  FC711E         LDD 0x711e                        
  00fe  AD9FFD2E       JSR [0xfd2e]                      
  0102  CC000A         LDD #0xa                          
  0105  AD9FFD20       JSR [0xfd20]                      
  0109  108E0424       LDY #0x424                        
  010d  FC7120         LDD 0x7120                        
  0110  AD9FFD2E       JSR [0xfd2e]                      
  0114  CC000A         LDD #0xa                          
  0117  AD9FFD20       JSR [0xfd20]                      
  011b  108E0420       LDY #0x420                        
  011f  FC7122         LDD 0x7122                        
  0122  AD9FFD2E       JSR [0xfd2e]                      
  0126  CC000A         LDD #0xa                          
  0129  AD9FFD20       JSR [0xfd20]                      
  012d  108E042D       LDY #0x42d                        
  0131  FC70AC         LDD 0x70ac                        
  0134  AD9FFD2E       JSR [0xfd2e]                      
  0138  FC713A         LDD 0x713a                        
  013b  10830000       CMPD #0x0                         
  013f  10270026       LBEQ 0x0169                       
  0143  CC000A         LDD #0xa                          
  0146  AD9FFD20       JSR [0xfd20]                      
  014a  108E0425       LDY #0x425                        
  014e  FC7106         LDD 0x7106                        
  0151  AD9FFD2E       JSR [0xfd2e]                      
  0155  CC000A         LDD #0xa                          
  0158  AD9FFD20       JSR [0xfd20]                      
  015c  108E0427       LDY #0x427                        
  0160  FC70AE         LDD 0x70ae                        
  0163  AD9FFD2E       JSR [0xfd2e]                      
  0167  2024           BRA 0x018d                        
LAB_M65_small_00000__0169:
  0169  CC000A         LDD #0xa                          
  016c  AD9FFD20       JSR [0xfd20]                      
  0170  108E0425       LDY #0x425                        
  0174  FC711A         LDD 0x711a                        
  0177  AD9FFD2E       JSR [0xfd2e]                      
  017b  CC000A         LDD #0xa                          
  017e  AD9FFD20       JSR [0xfd20]                      
  0182  108E0427       LDY #0x427                        
  0186  FC711C         LDD 0x711c                        
  0189  AD9FFD2E       JSR [0xfd2e]                      
LAB_M65_small_00000__018d:
  018d  CC0B62         LDD #0xb62                        
  0190  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  0194  6013           addr 6013                         
LAB_M65_small_00000__0196:
  0196  CCFFFF         LDD #0xffff                       
  0199  FD70F2         STD 0x70f2                        
  019c  AD9FFD76       JSR [0xfd76]                      
  01a0  1CBF           ANDCC #0xbf                       
  01a2  3536           PULS  A B X Y                     
  01a4  39             RTS                               

; ---- function FUN_M65_small_00000__01a5
FUN_M65_small_00000__01a5:
  01a5  CC079C         LDD #0x79c                        
  01a8  FD712C         STD 0x712c                        
  01ab  CC78D0         LDD #0x78d0                       
  01ae  FD712E         STD 0x712e                        
  01b1  CC0000         LDD #0x0                          
  01b4  FD7048         STD 0x7048                        
  01b7  FD7050         STD 0x7050                        
  01ba  FD7058         STD 0x7058                        
  01bd  FD7060         STD 0x7060                        
  01c0  FD7068         STD 0x7068                        
  01c3  FD7070         STD 0x7070                        
  01c6  FD7078         STD 0x7078                        
  01c9  FD7080         STD 0x7080                        
  01cc  FD7088         STD 0x7088                        
  01cf  FD7090         STD 0x7090                        
  01d2  FD7098         STD 0x7098                        
  01d5  FD70A0         STD 0x70a0                        
  01d8  FD7008         STD 0x7008                        
  01db  CC0064         LDD #0x64                         
  01de  FD70AC         STD 0x70ac                        
  01e1  CCFFFF         LDD #0xffff                       
  01e4  FD70DC         STD 0x70dc                        
  01e7  CCFFFF         LDD #0xffff                       
  01ea  FD70B2         STD 0x70b2                        
  01ed  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 45:46 47:4C 31:4E 33:54 49:56 4B:5C 35:5E 37:64 49:96 35:9E 4B:9C 59:06
  01f1  45             db 45h                            
  01f2  46             db 46h                            
  01f3  47             db 47h                            
  01f4  4C             db 4Ch                            
  01f5  31             db 31h                            
  01f6  4E             db 4Eh                            
  01f7  33             db 33h                            
  01f8  54             db 54h                            
  01f9  49             db 49h                            
  01fa  56             db 56h                            
  01fb  4B             db 4Bh                            
  01fc  5C             db 5Ch                            
  01fd  35             db 35h                            
  01fe  5E             db 5Eh                            
  01ff  37             db 37h                            
  0200  64             db 64h                            
  0201  49             db 49h                            
  0202  96             db 96h                            
  0203  35             db 35h                            
  0204  9E             db 9Eh                            
  0205  4B             db 4Bh                            
  0206  9C             db 9Ch                            
  0207  59             db 59h                            
  0208  06             db 6h                             
  0209  00             db 0h                             
LAB_M65_small_00000__020a:
  020a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 51:6E 53:74 3D:76 3F:7C 4D:86 4F:8C 39:8E 3B:94 3D:66 3F:6C 39:7E 3B:84 37:A4
  020e  51             db 51h                            
  020f  6E             db 6Eh                            
  0210  53             db 53h                            
  0211  74             db 74h                            
  0212  3D             db 3Dh                            
  0213  76             db 76h                            
  0214  3F             db 3Fh                            
  0215  7C             db 7Ch                            
  0216  4D             db 4Dh                            
  0217  86             db 86h                            
  0218  4F             db 4Fh                            
  0219  8C             db 8Ch                            
  021a  39             db 39h                            
  021b  8E             db 8Eh                            
  021c  3B             db 3Bh                            
  021d  94             db 94h                            
  021e  3D             db 3Dh                            
  021f  66             db 66h                            
  0220  3F             db 3Fh                            
  0221  6C             db 6Ch                            
  0222  39             db 39h                            
  0223  7E             db 7Eh                            
  0224  3B             db 3Bh                            
  0225  84             db 84h                            
  0226  37             db 37h                            
  0227  A4             db A4h                            
  0228  00             db 0h                             
LAB_M65_small_00000__0229:
  0229  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 5B:16 5D:18 5F:1A 61:1C 63:1E 65:20 67:22 69:24 6B:26 6D:28 6F:2A 71:2C
  022d  5B             db 5Bh                            
  022e  16             db 16h                            
  022f  5D             db 5Dh                            
  0230  18             db 18h                            
  0231  5F             db 5Fh                            
  0232  1A             db 1Ah                            
  0233  61             db 61h                            
  0234  1C             db 1Ch                            
  0235  63             db 63h                            
  0236  1E             db 1Eh                            
  0237  65             db 65h                            
  0238  20             db 20h                            
  0239  67             db 67h                            
  023a  22             db 22h                            
  023b  69             db 69h                            
  023c  24             db 24h                            
  023d  6B             db 6Bh                            
  023e  26             db 26h                            
  023f  6D             db 6Dh                            
  0240  28             db 28h                            
  0241  6F             db 6Fh                            
  0242  2A             db 2Ah                            
  0243  71             db 71h                            
  0244  2C             db 2Ch                            
  0245  00             db 0h                             
LAB_M65_small_00000__0246:
  0246  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 73:2E 75:30 77:32 79:34 7B:36 7D:38 7F:3A 81:3C 83:3E 85:40 87:42 89:44
  024a  73             db 73h                            
  024b  2E             db 2Eh                            
  024c  75             db 75h                            
  024d  30             db 30h                            
  024e  77             db 77h                            
  024f  32             db 32h                            
  0250  79             db 79h                            
  0251  34             db 34h                            
  0252  7B             db 7Bh                            
  0253  36             db 36h                            
  0254  7D             db 7Dh                            
  0255  38             db 38h                            
  0256  7F             db 7Fh                            
  0257  3A             db 3Ah                            
  0258  81             db 81h                            
  0259  3C             db 3Ch                            
  025a  83             db 83h                            
  025b  3E             db 3Eh                            
  025c  85             db 85h                            
  025d  40             db 40h                            
  025e  87             db 87h                            
  025f  42             db 42h                            
  0260  89             db 89h                            
  0261  44             db 44h                            
  0262  00             db 0h                             
LAB_M65_small_00000__0263:
  0263  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 41:A6 42:A8 43:B0 44:AA 31:00 32:02 33:04 8B:B4
  0267  41             db 41h                            
  0268  A6             db A6h                            
  0269  42             db 42h                            
  026a  A8             db A8h                            
  026b  43             db 43h                            
  026c  B0             db B0h                            
  026d  44             db 44h                            
  026e  AA             db AAh                            
  026f  31             db 31h                            
  0270  00             db 0h                             
  0271  32             db 32h                            
  0272  02             db 2h                             
  0273  33             db 33h                            
  0274  04             db 4h                             
  0275  8B             db 8Bh                            
  0276  B4             db B4h                            
  0277  00             db 0h                             
LAB_M65_small_00000__0278:
  0278  172779         LBSR 0x29f4                       
  027b  17283E         LBSR 0x2abc                       
  027e  172A54         LBSR 0x2cd5                       
  0281  1721CE         LBSR 0x2452                       
  0284  1722E5         LBSR 0x256c                       
  0287  172517         LBSR 0x27a1                       
  028a  17262B         LBSR 0x28b8                       
  028d  CC0000         LDD #0x0                          
  0290  FD70F2         STD 0x70f2                        
  0293  AD9FFD76       JSR [0xfd76]                      
  0297  1CBF           ANDCC #0xbf                       
  0299  AD9FFE18       JSR [0xfe18]                      
  029d  AD9FFD7C       JSR [0xfd7c]                      
  02a1  CC000A         LDD #0xa                          
  02a4  AD9FFD20       JSR [0xfd20]                      
  02a8  108E0343       LDY #0x343                        
  02ac  FC713A         LDD 0x713a                        
  02af  AD9FFD2E       JSR [0xfd2e]                      
  02b3  CC000A         LDD #0xa                          
  02b6  AD9FFD20       JSR [0xfd20]                      
  02ba  108E0344       LDY #0x344                        
  02be  FC7136         LDD 0x7136                        
  02c1  AD9FFD2E       JSR [0xfd2e]                      
  02c5  CC000A         LDD #0xa                          
  02c8  AD9FFD20       JSR [0xfd20]                      
  02cc  108E0345       LDY #0x345                        
  02d0  FC7132         LDD 0x7132                        
  02d3  AD9FFD2E       JSR [0xfd2e]                      
  02d7  39             RTS                               

; ---- function FUN_M65_small_00000__02d8
FUN_M65_small_00000__02d8:
  02d8  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l pitch " 21 $0E06 $0E12
  02dc  00             db 0h                             
  02dd  80             db 80h                            
  02de  6C2070697463.. ds "l pitch "                     
  02e6  21             db 21h                            
  02e7  0E06           addr M65_small_00000::0e06        
  02e9  0E12           addr M65_small_00000::0e12        
LAB_M65_small_00000__02eb:
  02eb  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r pitch " 25 $0FEB $0FF7
  02ef  01             db 1h                             
  02f0  80             db 80h                            
  02f1  722070697463.. ds "r pitch "                     
  02f9  25             db 25h                            
  02fa  0FEB           addr M65_small_00000::0feb        
  02fc  0FF7           addr M65_small_00000::0ff7        
LAB_M65_small_00000__02fe:
  02fe  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l delay " 29 $1175 $1181
  0302  02             db 2h                             
  0303  80             db 80h                            
  0304  6C2064656C61.. ds "l delay "                     
  030c  29             db 29h                            
  030d  1175           addr M65_small_00000::1175        
  030f  1181           addr M65_small_00000::1181        
LAB_M65_small_00000__0311:
  0311  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r delay " 2D $12D8 $12E4
  0315  03             db 3h                             
  0316  80             db 80h                            
  0317  722064656C61.. ds "r delay "                     
  031f  2D             db 2Dh                            
  0320  12D8           addr M65_small_00000::12d8        
  0322  12E4           addr M65_small_00000::12e4        
LAB_M65_small_00000__0324:
  0324  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "left mix" 55 $2385 $2391
  0328  04             db 4h                             
  0329  80             db 80h                            
  032a  6C656674206D.. ds "left mix"                     
  0332  55             db 55h                            
  0333  2385           addr M65_small_00000::2385        
  0335  2391           addr M65_small_00000::2391        
LAB_M65_small_00000__0337:
  0337  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "rightmix" 59 $249F $24AB
  033b  05             db 5h                             
  033c  80             db 80h                            
  033d  72696768746D.. ds "rightmix"                     
  0345  59             db 59h                            
  0346  249F           addr M65_small_00000::249f        
  0348  24AB           addr M65_small_00000::24ab        
LAB_M65_small_00000__034a:
  034a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "l fdback" 5D $26D4 $26E0
  034e  06             db 6h                             
  034f  80             db 80h                            
  0350  6C2066646261.. ds "l fdback"                     
  0358  5D             db 5Dh                            
  0359  26D4           addr M65_small_00000::26d4        
  035b  26E0           addr M65_small_00000::26e0        
LAB_M65_small_00000__035d:
  035d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "r fdback" 61 $27EB $27F7
  0361  07             db 7h                             
  0362  80             db 80h                            
  0363  722066646261.. ds "r fdback"                     
  036b  61             db 61h                            
  036c  27EB           addr M65_small_00000::27eb        
  036e  27F7           addr M65_small_00000::27f7        
LAB_M65_small_00000__0370:
  0370  CC0385         LDD #0x385                        
  0373  FD60F5         STD 0x60f5                        
  0376  CC0018         LDD #0x18                         
  0379  47             ASRA                              
  037a  56             RORB                              
  037b  FD60F7         STD 0x60f7                        
  037e  CC080E         LDD #0x80e                        
  0381  FD714A         STD 0x714a                        
  0384  39             RTS                               
  0385  039D03A803B3.. addr[13]                          
  039f  .db FD 17 04 6B AD 9F FE 10 39                       ; ...k....9

; ---- function FUN_M65_small_00000__03a8
FUN_M65_small_00000__03a8:
  03a8  17210C         LBSR 0x24b7                       
  03ab  170460         LBSR 0x080e                       
  03ae  AD9FFE12       JSR [0xfe12]                      
  03b2  39             RTS                               

; ---- function FUN_M65_small_00000__03b3
FUN_M65_small_00000__03b3:
  03b3  172336         LBSR 0x26ec                       
  03b6  1703E3         LBSR 0x079c                       
  03b9  AD9FFE16       JSR [0xfe16]                      
  03bd  39             RTS                               

; ---- function FUN_M65_small_00000__03be
FUN_M65_small_00000__03be:
  03be  172442         LBSR 0x2803                       
  03c1  170411         LBSR 0x07d5                       
  03c4  AD9FFE16       JSR [0xfe16]                      
  03c8  39             RTS                               

; ---- function FUN_M65_small_00000__03c9
FUN_M65_small_00000__03c9:
  03c9  170A52         LBSR 0x0e1e                       
  03cc  1703CD         LBSR 0x079c                       
  03cf  AD9FFE12       JSR [0xfe12]                      
  03d3  39             RTS                               

; ---- function FUN_M65_small_00000__03d4
FUN_M65_small_00000__03d4:
  03d4  170DB6         LBSR 0x118d                       
  03d7  1703C2         LBSR 0x079c                       
  03da  AD9FFE14       JSR [0xfe14]                      
  03de  39             RTS                               

; ---- function FUN_M65_small_00000__03df
FUN_M65_small_00000__03df:
  03df  170C21         LBSR 0x1003                       
  03e2  1703F0         LBSR 0x07d5                       
  03e5  AD9FFE12       JSR [0xfe12]                      
  03e9  39             RTS                               

; ---- function FUN_M65_small_00000__03ea
FUN_M65_small_00000__03ea:
  03ea  170F03         LBSR 0x12f0                       
  03ed  1703E5         LBSR 0x07d5                       
  03f0  AD9FFE14       JSR [0xfe14]                      
  03f4  39             RTS                               

; ---- function FUN_M65_small_00000__03f5
FUN_M65_small_00000__03f5:
  03f5  172600         LBSR 0x29f8                       
  03f8  17044E         LBSR 0x0849                       
  03fb  AD9FFE10       JSR [0xfe10]                      
  03ff  39             RTS                               

; ---- function FUN_M65_small_00000__0400
FUN_M65_small_00000__0400:
  0400  1724F1         LBSR 0x28f4                       
  0403  170443         LBSR 0x0849                       
  0406  AD9FFE12       JSR [0xfe12]                      
  040a  39             RTS                               

; ---- function FUN_M65_small_00000__040b
FUN_M65_small_00000__040b:
  040b  1727E3         LBSR 0x2bf1                       
  040e  170438         LBSR 0x0849                       
  0411  AD9FFE14       JSR [0xfe14]                      
  0415  39             RTS                               

; ---- function FUN_M65_small_00000__0416
FUN_M65_small_00000__0416:
  0416  17074A         LBSR 0x0b63                       
  0419  170770         LBSR 0x0b8c                       
  041c  1703EF         LBSR 0x080e                       
  041f  AD9FFDEC       JSR [0xfdec]                      
  0423  39             RTS                               

; ---- function FUN_M65_small_00000__0424
FUN_M65_small_00000__0424:
  0424  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " pitch  " 21 $0FEB $0FF7
  0428  00             db 0h                             
  0429  80             db 80h                            
  042a  207069746368.. ds " pitch  "                     
  0432  21             db 21h                            
  0433  0FEB           addr M65_small_00000::0feb        
  0435  0FF7           addr M65_small_00000::0ff7        
LAB_M65_small_00000__0437:
  0437  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " delay  " 25 $12D8 $12E4
  043b  01             db 1h                             
  043c  80             db 80h                            
  043d  2064656C6179.. ds " delay  "                     
  0445  25             db 25h                            
  0446  12D8           addr M65_small_00000::12d8        
  0448  12E4           addr M65_small_00000::12e4        
LAB_M65_small_00000__044a:
  044a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "  mix   " 29 $2267 $2273
  044e  02             db 2h                             
  044f  80             db 80h                            
  0450  20206D697820.. ds "  mix   "                     
  0458  29             db 29h                            
  0459  2267           addr M65_small_00000::2267        
  045b  2273           addr M65_small_00000::2273        
LAB_M65_small_00000__045d:
  045d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "feedback" 2D $25B9 $25C5
  0461  03             db 3h                             
  0462  80             db 80h                            
  0463  666565646261.. ds "feedback"                     
  046b  2D             db 2Dh                            
  046c  25B9           addr M65_small_00000::25b9        
  046e  25C5           addr M65_small_00000::25c5        
LAB_M65_small_00000__0470:
  0470  CC0485         LDD #0x485                        
  0473  FD60F5         STD 0x60f5                        
  0476  CC0018         LDD #0x18                         
  0479  47             ASRA                              
  047a  56             RORB                              
  047b  FD60F7         STD 0x60f7                        
  047e  CC08C4         LDD #0x8c4                        
  0481  FD714A         STD 0x714a                        
  0484  39             RTS                               
  0485  .db 04 9D 04 A8 04 B3 04 B4 04 B5 04 B6 04 B7 04 C2  ; ................
  0495  .db 04 CD 04 D8 04 E3 04 EE 17 1D DF 17 04 21 AD 9F  ; .............!..
  04a5  .db FE 10 39 17 21 26 17 03 DD AD 9F FE 16 39 39 39  ; ..9.!&.......999
  04b5  .db 39 39 17 0B 49 17 03 CE AD 9F FE 12 39 17 0E 2B  ; 99..I.......9..+
  04c5  .db 17 03 C3 AD 9F FE 14 39 17 25 28 17 04 22 AD 9F  ; .......9.%(.."..
  04d5  .db FE 10 39 17 24 19 17 04 17 AD 9F FE 12 39 17 27  ; ..9.$........9.'
  04e5  .db 0B 17 04 0C AD 9F FE 14 39 17 25 F2 17 04 43 AD  ; ........9.%...C.
  04f5  .db 9F FE 10 39                                      ; ...9

; ---- function FUN_M65_small_00000__04f9
FUN_M65_small_00000__04f9:
  04f9  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l pitch " 21 $0E06 $0E12
  04fd  00             db 0h                             
  04fe  80             db 80h                            
  04ff  6C2070697463.. ds "l pitch "                     
  0507  21             db 21h                            
  0508  0E06           addr M65_small_00000::0e06        
  050a  0E12           addr M65_small_00000::0e12        
LAB_M65_small_00000__050c:
  050c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r pitch " 25 $0FEB $0FF7
  0510  01             db 1h                             
  0511  80             db 80h                            
  0512  722070697463.. ds "r pitch "                     
  051a  25             db 25h                            
  051b  0FEB           addr M65_small_00000::0feb        
  051d  0FF7           addr M65_small_00000::0ff7        
LAB_M65_small_00000__051f:
  051f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l length" 29 $149D $14A9
  0523  02             db 2h                             
  0524  80             db 80h                            
  0525  6C206C656E67.. ds "l length"                     
  052d  29             db 29h                            
  052e  149D           addr M65_small_00000::149d        
  0530  14A9           addr M65_small_00000::14a9        
LAB_M65_small_00000__0532:
  0532  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r length" 2D $15E5 $15F1
  0536  03             db 3h                             
  0537  80             db 80h                            
  0538  72206C656E67.. ds "r length"                     
  0540  2D             db 2Dh                            
  0541  15E5           addr M65_small_00000::15e5        
  0543  15F1           addr M65_small_00000::15f1        
LAB_M65_small_00000__0545:
  0545  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "left mix" 55 $2385 $2391
  0549  04             db 4h                             
  054a  80             db 80h                            
  054b  6C656674206D.. ds "left mix"                     
  0553  55             db 55h                            
  0554  2385           addr M65_small_00000::2385        
  0556  2391           addr M65_small_00000::2391        
LAB_M65_small_00000__0558:
  0558  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "rightmix" 59 $249F $24AB
  055c  05             db 5h                             
  055d  80             db 80h                            
  055e  72696768746D.. ds "rightmix"                     
  0566  59             db 59h                            
  0567  249F           addr M65_small_00000::249f        
  0569  24AB           addr M65_small_00000::24ab        
LAB_M65_small_00000__056b:
  056b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "l fdback" 5D $26D4 $26E0
  056f  06             db 6h                             
  0570  80             db 80h                            
  0571  6C2066646261.. ds "l fdback"                     
  0579  5D             db 5Dh                            
  057a  26D4           addr M65_small_00000::26d4        
  057c  26E0           addr M65_small_00000::26e0        
LAB_M65_small_00000__057e:
  057e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "r fdback" 61 $27EB $27F7
  0582  07             db 7h                             
  0583  80             db 80h                            
  0584  722066646261.. ds "r fdback"                     
  058c  61             db 61h                            
  058d  27EB           addr M65_small_00000::27eb        
  058f  27F7           addr M65_small_00000::27f7        
LAB_M65_small_00000__0591:
  0591  CC05A0         LDD #0x5a0                        
  0594  FD60F5         STD 0x60f5                        
  0597  CC0010         LDD #0x10                         
  059a  47             ASRA                              
  059b  56             RORB                              
  059c  FD60F7         STD 0x60f7                        
  059f  39             RTS                               
  05a0  05B005BB05C6.. addr[8]                           

; ---- function FUN_M65_small_00000__05b0
FUN_M65_small_00000__05b0:
  05b0  171DEA         LBSR 0x239d                       
  05b3  170427         LBSR 0x09dd                       
  05b6  AD9FFE10       JSR [0xfe10]                      
  05ba  39             RTS                               

; ---- function FUN_M65_small_00000__05bb
FUN_M65_small_00000__05bb:
  05bb  171EF9         LBSR 0x24b7                       
  05be  17041C         LBSR 0x09dd                       
  05c1  AD9FFE12       JSR [0xfe12]                      
  05c5  39             RTS                               

; ---- function FUN_M65_small_00000__05c6
FUN_M65_small_00000__05c6:
  05c6  172123         LBSR 0x26ec                       
  05c9  17039F         LBSR 0x096b                       
  05cc  AD9FFE16       JSR [0xfe16]                      
  05d0  39             RTS                               

; ---- function FUN_M65_small_00000__05d1
FUN_M65_small_00000__05d1:
  05d1  17222F         LBSR 0x2803                       
  05d4  1703CD         LBSR 0x09a4                       
  05d7  AD9FFE16       JSR [0xfe16]                      
  05db  39             RTS                               

; ---- function FUN_M65_small_00000__05dc
FUN_M65_small_00000__05dc:
  05dc  17083F         LBSR 0x0e1e                       
  05df  170389         LBSR 0x096b                       
  05e2  AD9FFE12       JSR [0xfe12]                      
  05e6  39             RTS                               

; ---- function FUN_M65_small_00000__05e7
FUN_M65_small_00000__05e7:
  05e7  170ECB         LBSR 0x14b5                       
  05ea  17037E         LBSR 0x096b                       
  05ed  AD9FFE14       JSR [0xfe14]                      
  05f1  39             RTS                               

; ---- function FUN_M65_small_00000__05f2
FUN_M65_small_00000__05f2:
  05f2  170A0E         LBSR 0x1003                       
  05f5  1703AC         LBSR 0x09a4                       
  05f8  AD9FFE12       JSR [0xfe12]                      
  05fc  39             RTS                               

; ---- function FUN_M65_small_00000__05fd
FUN_M65_small_00000__05fd:
  05fd  170FFD         LBSR 0x15fd                       
  0600  1703A1         LBSR 0x09a4                       
  0603  AD9FFE14       JSR [0xfe14]                      
  0607  39             RTS                               

; ---- function FUN_M65_small_00000__0608
FUN_M65_small_00000__0608:
  0608  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " delay  " 21 $12D8 $12E4
  060c  00             db 0h                             
  060d  80             db 80h                            
  060e  2064656C6179.. ds " delay  "                     
  0616  21             db 21h                            
  0617  12D8           addr M65_small_00000::12d8        
  0619  12E4           addr M65_small_00000::12e4        
LAB_M65_small_00000__061b:
  061b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "left mix" 25 $2385 $2391
  061f  01             db 1h                             
  0620  80             db 80h                            
  0621  6C656674206D.. ds "left mix"                     
  0629  25             db 25h                            
  062a  2385           addr M65_small_00000::2385        
  062c  2391           addr M65_small_00000::2391        
LAB_M65_small_00000__062e:
  062e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "rightmix" 29 $249F $24AB
  0632  02             db 2h                             
  0633  80             db 80h                            
  0634  72696768746D.. ds "rightmix"                     
  063c  29             db 29h                            
  063d  249F           addr M65_small_00000::249f        
  063f  24AB           addr M65_small_00000::24ab        
LAB_M65_small_00000__0641:
  0641  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "l fdback" 2D $26D4 $26E0
  0645  03             db 3h                             
  0646  80             db 80h                            
  0647  6C2066646261.. ds "l fdback"                     
  064f  2D             db 2Dh                            
  0650  26D4           addr M65_small_00000::26d4        
  0652  26E0           addr M65_small_00000::26e0        
LAB_M65_small_00000__0654:
  0654  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "r fdback" 55 $27EB $27F7
  0658  04             db 4h                             
  0659  80             db 80h                            
  065a  722066646261.. ds "r fdback"                     
  0662  55             db 55h                            
  0663  27EB           addr M65_small_00000::27eb        
  0665  27F7           addr M65_small_00000::27f7        
LAB_M65_small_00000__0667:
  0667  CC067C         LDD #0x67c                        
  066a  FD60F5         STD 0x60f5                        
  066d  CC0048         LDD #0x48                         
  0670  47             ASRA                              
  0671  56             RORB                              
  0672  FD60F7         STD 0x60f7                        
  0675  CC0A76         LDD #0xa76                        
  0678  FD714A         STD 0x714a                        
  067b  39             RTS                               
  067c  06C406CF06DA.. addr[37]                          
  06c6  .db D6 17 03 73 AD 9F FE 10 39                       ; ...s....9

; ---- function FUN_M65_small_00000__06cf
FUN_M65_small_00000__06cf:
  06cf  171DE5         LBSR 0x24b7                       
  06d2  170368         LBSR 0x0a3d                       
  06d5  AD9FFE12       JSR [0xfe12]                      
  06d9  39             RTS                               

; ---- function FUN_M65_small_00000__06da
FUN_M65_small_00000__06da:
  06da  17200F         LBSR 0x26ec                       
  06dd  17035D         LBSR 0x0a3d                       
  06e0  AD9FFE14       JSR [0xfe14]                      
  06e4  39             RTS                               

; ---- function FUN_M65_small_00000__06e5
FUN_M65_small_00000__06e5:
  06e5  17211B         LBSR 0x2803                       
  06e8  170352         LBSR 0x0a3d                       
  06eb  AD9FFE16       JSR [0xfe16]                      
  06ef  39             RTS                               

; ---- function FUN_M65_small_00000__06f0
FUN_M65_small_00000__06f0:
  06f0  17102C         LBSR 0x171f                       
  06f3  170312         LBSR 0x0a08                       
  06f6  AD9FFE16       JSR [0xfe16]                      
  06fa  39             RTS                               

; ---- function FUN_M65_small_00000__06fb
FUN_M65_small_00000__06fb:
  06fb  171272         LBSR 0x1970                       
  06fe  170307         LBSR 0x0a08                       
  0701  AD9FFE10       JSR [0xfe10]                      
  0705  39             RTS                               

; ---- function FUN_M65_small_00000__0706
FUN_M65_small_00000__0706:
  0706  171352         LBSR 0x1a5b                       
  0709  1702FC         LBSR 0x0a08                       
  070c  AD9FFE12       JSR [0xfe12]                      
  0710  39             RTS                               

; ---- function FUN_M65_small_00000__0711
FUN_M65_small_00000__0711:
  0711  170BDC         LBSR 0x12f0                       
  0714  17035F         LBSR 0x0a76                       
  0717  AD9FFE14       JSR [0xfe14]                      
  071b  39             RTS                               

; ---- function FUN_M65_small_00000__071c
FUN_M65_small_00000__071c:
  071c  1722D9         LBSR 0x29f8                       
  071f  170393         LBSR 0x0ab5                       
  0722  AD9FFE14       JSR [0xfe14]                      
  0726  39             RTS                               

; ---- function FUN_M65_small_00000__0727
FUN_M65_small_00000__0727:
  0727  1721CA         LBSR 0x28f4                       
  072a  170388         LBSR 0x0ab5                       
  072d  AD9FFE16       JSR [0xfe16]                      
  0731  39             RTS                               

; ---- function FUN_M65_small_00000__0732
FUN_M65_small_00000__0732:
  0732  1724BC         LBSR 0x2bf1                       
  0735  1703B6         LBSR 0x0aee                       
  0738  AD9FFE10       JSR [0xfe10]                      
  073c  39             RTS                               

; ---- function FUN_M65_small_00000__073d
FUN_M65_small_00000__073d:
  073d  17114E         LBSR 0x188e                       
  0740  1703DF         LBSR 0x0b22                       
  0743  AD9FFE12       JSR [0xfe12]                      
  0747  39             RTS                               

; ---- function FUN_M65_small_00000__0748
FUN_M65_small_00000__0748:
  0748  171143         LBSR 0x188e                       
  074b  1703DC         LBSR 0x0b2a                       
  074e  AD9FFE12       JSR [0xfe12]                      
  0752  39             RTS                               

; ---- function FUN_M65_small_00000__0753
FUN_M65_small_00000__0753:
  0753  170536         LBSR 0x0c8c                       
  0756  17056B         LBSR 0x0cc4                       
  0759  1702AC         LBSR 0x0a08                       
  075c  AD9FFDEC       JSR [0xfdec]                      
  0760  39             RTS                               

; ---- function FUN_M65_small_00000__0761
FUN_M65_small_00000__0761:
  0761  AD9FFDFC       JSR [0xfdfc]                      
  0765  39             RTS                               

; ---- function FUN_M65_small_00000__0766
FUN_M65_small_00000__0766:
  0766  C600           LDB #0x0                          
  0768  AD9FFC36       JSR [0xfc36]                      
  076c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0770  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M65_small_00000__0799:
  0799  3577           PULS CC A B X Y U                 
  079b  39             RTS                               

; ---- function FUN_M65_small_00000__079c
FUN_M65_small_00000__079c:
  079c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l coarse" "l fine  " "l delay " "l fdback"
  07a0  6C20636F6172.. ds "l coarse"                     
  07a8  6C2066696E65.. ds "l fine  "                     
  07b0  6C2064656C61.. ds "l delay "                     
  07b8  6C2066646261.. ds "l fdback"                     
LAB_M65_small_00000__07c0:
  07c0  AD9FFDF2       JSR [0xfdf2]                      
  07c4  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D9D ->$0E45 ->$11B4 ->$2713 ->$07D5 ->$080E
  07c8  0D9D           addr M65_small_00000::0d9d        
  07ca  0E45           addr M65_small_00000::0e45        
  07cc  11B4           addr M65_small_00000::11b4        
  07ce  2713           addr M65_small_00000::2713        
  07d0  07D5           addr M65_small_00000::07d5        
  07d2  080E           addr M65_small_00000::080e        
LAB_M65_small_00000__07d4:
  07d4  39             RTS                               

; ---- function FUN_M65_small_00000__07d5
FUN_M65_small_00000__07d5:
  07d5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r coarse" "r fine  " "r delay " "r fdback"
  07d9  7220636F6172.. ds "r coarse"                     
  07e1  722066696E65.. ds "r fine  "                     
  07e9  722064656C61.. ds "r delay "                     
  07f1  722066646261.. ds "r fdback"                     
LAB_M65_small_00000__07f9:
  07f9  AD9FFDF2       JSR [0xfdf2]                      
  07fd  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F45 ->$102A ->$1317 ->$282A ->$080E ->$079C
  0801  0F45           addr M65_small_00000::0f45        
  0803  102A           addr M65_small_00000::102a        
  0805  1317           addr M65_small_00000::1317        
  0807  282A           addr M65_small_00000::282a        
  0809  080E           addr M65_small_00000::080e        
  080b  079C           addr M65_small_00000::079c        
LAB_M65_small_00000__080d:
  080d  39             RTS                               

; ---- function FUN_M65_small_00000__080e
FUN_M65_small_00000__080e:
  080e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" [-] " expert "
  0812  6C656674206D.. ds "left mix"                     
  081a  72696768746D.. ds "rightmix"                     
  0822  00             db 0h                             
  0823  206578706572.. ds " expert "                     
LAB_M65_small_00000__082b:
  082b  AD9FFDF2       JSR [0xfdf2]                      
  082f  170394         LBSR 0x0bc6                       
  0832  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$23C4 ->$24DE ->$0B78 ->$0849 ->$079C ->$07D5
  0836  23C4           addr M65_small_00000::23c4        
  0838  24DE           addr M65_small_00000::24de        
  083a  0B78           addr M65_small_00000::0b78        
  083c  0849           addr M65_small_00000::0849        
  083e  079C           addr M65_small_00000::079c        
  0840  07D5           addr M65_small_00000::07d5        
LAB_M65_small_00000__0842:
  0842  CC080E         LDD #0x80e                        
  0845  FD714A         STD 0x714a                        
  0848  39             RTS                               

; ---- function FUN_M65_small_00000__0849
FUN_M65_small_00000__0849:
  0849  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "low note" "highnote" " source " " return "
  084d  6C6F77206E6F.. ds "low note"                     
  0855  686967686E6F.. ds "highnote"                     
  085d  20736F757263.. ds " source "                     
  0865  207265747572.. ds " return "                     
LAB_M65_small_00000__086d:
  086d  AD9FFDF2       JSR [0xfdf2]                      
  0871  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2A1C ->$2918 ->$2C15 ->$0B62 ->$0B62 ->$0B62
  0875  2A1C           addr M65_small_00000::2a1c        
  0877  2918           addr M65_small_00000::2918        
  0879  2C15           addr M65_small_00000::2c15        
  087b  0B62           addr M65_small_00000::0b62        
  087d  0B62           addr M65_small_00000::0b62        
  087f  0B62           addr M65_small_00000::0b62        
LAB_M65_small_00000__0881:
  0881  FC714A         LDD 0x714a                        
  0884  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0888  60E9           addr 60e9                         
LAB_M65_small_00000__088a:
  088a  39             RTS                               

; ---- function FUN_M65_small_00000__088b
FUN_M65_small_00000__088b:
  088b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " coarse " "  fine  " " delay  " "feedback"
  088f  20636F617273.. ds " coarse "                     
  0897  202066696E65.. ds "  fine  "                     
  089f  2064656C6179.. ds " delay  "                     
  08a7  666565646261.. ds "feedback"                     
LAB_M65_small_00000__08af:
  08af  AD9FFDF2       JSR [0xfdf2]                      
  08b3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F45 ->$102A ->$1317 ->$25F8 ->$08C4 ->$08C4
  08b7  0F45           addr M65_small_00000::0f45        
  08b9  102A           addr M65_small_00000::102a        
  08bb  1317           addr M65_small_00000::1317        
  08bd  25F8           addr M65_small_00000::25f8        
  08bf  08C4           addr M65_small_00000::08c4        
  08c1  08C4           addr M65_small_00000::08c4        
LAB_M65_small_00000__08c3:
  08c3  39             RTS                               

; ---- function FUN_M65_small_00000__08c4
FUN_M65_small_00000__08c4:
  08c4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [*] [*] " expert "
  08c8  20206D697820.. ds "  mix   "                     
  08d0  01             db 1h                             
  08d1  01             db 1h                             
  08d2  206578706572.. ds " expert "                     
LAB_M65_small_00000__08da:
  08da  AD9FFDF2       JSR [0xfdf2]                      
  08de  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$22A6 ->$0B62 ->$0B62 ->$08F5 ->$088B ->$088B
  08e2  22A6           addr M65_small_00000::22a6        
  08e4  0B62           addr M65_small_00000::0b62        
  08e6  0B62           addr M65_small_00000::0b62        
  08e8  08F5           addr M65_small_00000::08f5        
  08ea  088B           addr M65_small_00000::088b        
  08ec  088B           addr M65_small_00000::088b        
LAB_M65_small_00000__08ee:
  08ee  CC08C4         LDD #0x8c4                        
  08f1  FD714A         STD 0x714a                        
  08f4  39             RTS                               

; ---- function FUN_M65_small_00000__08f5
FUN_M65_small_00000__08f5:
  08f5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "low note" "highnote" " source " " return "
  08f9  6C6F77206E6F.. ds "low note"                     
  0901  686967686E6F.. ds "highnote"                     
  0909  20736F757263.. ds " source "                     
  0911  207265747572.. ds " return "                     
LAB_M65_small_00000__0919:
  0919  AD9FFDF2       JSR [0xfdf2]                      
  091d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2A1C ->$2918 ->$2C15 ->$0B62 ->$0937 ->$0937
  0921  2A1C           addr M65_small_00000::2a1c        
  0923  2918           addr M65_small_00000::2918        
  0925  2C15           addr M65_small_00000::2c15        
  0927  0B62           addr M65_small_00000::0b62        
  0929  0937           addr M65_small_00000::0937        
  092b  0937           addr M65_small_00000::0937        
LAB_M65_small_00000__092d:
  092d  FC714A         LDD 0x714a                        
  0930  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0934  60E9           addr 60e9                         
LAB_M65_small_00000__0936:
  0936  39             RTS                               

; ---- function FUN_M65_small_00000__0937
FUN_M65_small_00000__0937:
  0937  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "deg mode" [*] [*] " return "
  093b  646567206D6F.. ds "deg mode"                     
  0943  01             db 1h                             
  0944  01             db 1h                             
  0945  207265747572.. ds " return "                     
LAB_M65_small_00000__094d:
  094d  AD9FFDF2       JSR [0xfdf2]                      
  0951  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2B07 ->$0B62 ->$0B62 ->$0B62 ->$08F5 ->$08F5
  0955  2B07           addr M65_small_00000::2b07        
  0957  0B62           addr M65_small_00000::0b62        
  0959  0B62           addr M65_small_00000::0b62        
  095b  0B62           addr M65_small_00000::0b62        
  095d  08F5           addr M65_small_00000::08f5        
  095f  08F5           addr M65_small_00000::08f5        
LAB_M65_small_00000__0961:
  0961  FC714A         LDD 0x714a                        
  0964  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0968  60E9           addr 60e9                         
LAB_M65_small_00000__096a:
  096a  39             RTS                               

; ---- function FUN_M65_small_00000__096b
FUN_M65_small_00000__096b:
  096b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l coarse" "l fine  " "l length" "l fdback"
  096f  6C20636F6172.. ds "l coarse"                     
  0977  6C2066696E65.. ds "l fine  "                     
  097f  6C206C656E67.. ds "l length"                     
  0987  6C2066646261.. ds "l fdback"                     
LAB_M65_small_00000__098f:
  098f  AD9FFDF2       JSR [0xfdf2]                      
  0993  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D9D ->$0E45 ->$14DC ->$2713 ->$09A4 ->$09DD
  0997  0D9D           addr M65_small_00000::0d9d        
  0999  0E45           addr M65_small_00000::0e45        
  099b  14DC           addr M65_small_00000::14dc        
  099d  2713           addr M65_small_00000::2713        
  099f  09A4           addr M65_small_00000::09a4        
  09a1  09DD           addr M65_small_00000::09dd        
LAB_M65_small_00000__09a3:
  09a3  39             RTS                               

; ---- function FUN_M65_small_00000__09a4
FUN_M65_small_00000__09a4:
  09a4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r coarse" "r fine  " "r length" "r fdback"
  09a8  7220636F6172.. ds "r coarse"                     
  09b0  722066696E65.. ds "r fine  "                     
  09b8  72206C656E67.. ds "r length"                     
  09c0  722066646261.. ds "r fdback"                     
LAB_M65_small_00000__09c8:
  09c8  AD9FFDF2       JSR [0xfdf2]                      
  09cc  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F45 ->$102A ->$1624 ->$282A ->$09DD ->$096B
  09d0  0F45           addr M65_small_00000::0f45        
  09d2  102A           addr M65_small_00000::102a        
  09d4  1624           addr M65_small_00000::1624        
  09d6  282A           addr M65_small_00000::282a        
  09d8  09DD           addr M65_small_00000::09dd        
  09da  096B           addr M65_small_00000::096b        
LAB_M65_small_00000__09dc:
  09dc  39             RTS                               

; ---- function FUN_M65_small_00000__09dd
FUN_M65_small_00000__09dd:
  09dd  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" [*] [*]
  09e1  6C656674206D.. ds "left mix"                     
  09e9  72696768746D.. ds "rightmix"                     
  09f1  01             db 1h                             
  09f2  01             db 1h                             
LAB_M65_small_00000__09f3:
  09f3  AD9FFDF2       JSR [0xfdf2]                      
  09f7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$23C4 ->$24DE ->$0B62 ->$0B62 ->$096B ->$09A4
  09fb  23C4           addr M65_small_00000::23c4        
  09fd  24DE           addr M65_small_00000::24de        
  09ff  0B62           addr M65_small_00000::0b62        
  0a01  0B62           addr M65_small_00000::0b62        
  0a03  096B           addr M65_small_00000::096b        
  0a05  09A4           addr M65_small_00000::09a4        
LAB_M65_small_00000__0a07:
  0a07  39             RTS                               

; ---- function FUN_M65_small_00000__0a08
FUN_M65_small_00000__0a08:
  0a08  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l voice " "r voice " [-] "  key   "
  0a0c  6C20766F6963.. ds "l voice "                     
  0a14  7220766F6963.. ds "r voice "                     
  0a1c  00             db 0h                             
  0a1d  20206B657920.. ds "  key   "                     
LAB_M65_small_00000__0a25:
  0a25  AD9FFDF2       JSR [0xfdf2]                      
  0a29  170338         LBSR 0x0d64                       
  0a2c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1994 ->$1A7F ->$0CB0 ->$1743 ->$0A3D ->$0A76
  0a30  1994           addr M65_small_00000::1994        
  0a32  1A7F           addr M65_small_00000::1a7f        
  0a34  0CB0           addr M65_small_00000::0cb0        
  0a36  1743           addr M65_small_00000::1743        
  0a38  0A3D           addr M65_small_00000::0a3d        
  0a3a  0A76           addr M65_small_00000::0a76        
LAB_M65_small_00000__0a3c:
  0a3c  39             RTS                               

; ---- function FUN_M65_small_00000__0a3d
FUN_M65_small_00000__0a3d:
  0a3d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left mix" "rightmix" "l fdback" "r fdback"
  0a41  6C656674206D.. ds "left mix"                     
  0a49  72696768746D.. ds "rightmix"                     
  0a51  6C2066646261.. ds "l fdback"                     
  0a59  722066646261.. ds "r fdback"                     
LAB_M65_small_00000__0a61:
  0a61  AD9FFDF2       JSR [0xfdf2]                      
  0a65  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$23C4 ->$24DE ->$2713 ->$282A ->$0A76 ->$0A08
  0a69  23C4           addr M65_small_00000::23c4        
  0a6b  24DE           addr M65_small_00000::24de        
  0a6d  2713           addr M65_small_00000::2713        
  0a6f  282A           addr M65_small_00000::282a        
  0a71  0A76           addr M65_small_00000::0a76        
  0a73  0A08           addr M65_small_00000::0a08        
LAB_M65_small_00000__0a75:
  0a75  39             RTS                               

; ---- function FUN_M65_small_00000__0a76
FUN_M65_small_00000__0a76:
  0a76  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  tune  " "shownote" "  delay " " expert "
  0a7a  202074756E65.. ds "  tune  "                     
  0a82  73686F776E6F.. ds "shownote"                     
  0a8a  202064656C61.. ds "  delay "                     
  0a92  206578706572.. ds " expert "                     
LAB_M65_small_00000__0a9a:
  0a9a  AD9FFDF2       JSR [0xfdf2]                      
  0a9e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1C41 ->$1D8A ->$1317 ->$0AB5 ->$0A08 ->$0A3D
  0aa2  1C41           addr M65_small_00000::1c41        
  0aa4  1D8A           addr M65_small_00000::1d8a        
  0aa6  1317           addr M65_small_00000::1317        
  0aa8  0AB5           addr M65_small_00000::0ab5        
  0aaa  0A08           addr M65_small_00000::0a08        
  0aac  0A3D           addr M65_small_00000::0a3d        
LAB_M65_small_00000__0aae:
  0aae  CC0A76         LDD #0xa76                        
  0ab1  FD714A         STD 0x714a                        
  0ab4  39             RTS                               

; ---- function FUN_M65_small_00000__0ab5
FUN_M65_small_00000__0ab5:
  0ab5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " scale1 " "scale2  " "lownote " "highnote"
  0ab9  207363616C65.. ds " scale1 "                     
  0ac1  7363616C6532.. ds "scale2  "                     
  0ac9  6C6F776E6F74.. ds "lownote "                     
  0ad1  686967686E6F.. ds "highnote"                     
LAB_M65_small_00000__0ad9:
  0ad9  AD9FFDF2       JSR [0xfdf2]                      
  0add  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0B22 ->$0B2A ->$2A1C ->$2918 ->$0AEE ->$0AEE
  0ae1  0B22           addr M65_small_00000::0b22        
  0ae3  0B2A           addr M65_small_00000::0b2a        
  0ae5  2A1C           addr M65_small_00000::2a1c        
  0ae7  2918           addr M65_small_00000::2918        
  0ae9  0AEE           addr M65_small_00000::0aee        
  0aeb  0AEE           addr M65_small_00000::0aee        
LAB_M65_small_00000__0aed:
  0aed  39             RTS                               

; ---- function FUN_M65_small_00000__0aee
FUN_M65_small_00000__0aee:
  0aee  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " source " [*] [*] " return "
  0af2  20736F757263.. ds " source "                     
  0afa  01             db 1h                             
  0afb  01             db 1h                             
  0afc  207265747572.. ds " return "                     
LAB_M65_small_00000__0b04:
  0b04  AD9FFDF2       JSR [0xfdf2]                      
  0b08  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2C15 ->$0B62 ->$0B62 ->$0B62 ->$0AB5 ->$0AB5
  0b0c  2C15           addr M65_small_00000::2c15        
  0b0e  0B62           addr M65_small_00000::0b62        
  0b10  0B62           addr M65_small_00000::0b62        
  0b12  0B62           addr M65_small_00000::0b62        
  0b14  0AB5           addr M65_small_00000::0ab5        
  0b16  0AB5           addr M65_small_00000::0ab5        
LAB_M65_small_00000__0b18:
  0b18  FC714A         LDD 0x714a                        
  0b1b  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0b1f  60E9           addr 60e9                         
LAB_M65_small_00000__0b21:
  0b21  39             RTS                               

; ---- function FUN_M65_small_00000__0b22
FUN_M65_small_00000__0b22:
  0b22  CC7016         LDD #0x7016                       
  0b25  FD7014         STD 0x7014                        
  0b28  2006           BRA 0x0b30                        

; ---- function FUN_M65_small_00000__0b2a
FUN_M65_small_00000__0b2a:
  0b2a  CC702E         LDD #0x702e                       
  0b2d  FD7014         STD 0x7014                        
LAB_M65_small_00000__0b30:
  0b30  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  note  " "interval" [*] " return "
  0b34  20206E6F7465.. ds "  note  "                     
  0b3c  696E74657276.. ds "interval"                     
  0b44  01             db 1h                             
  0b45  207265747572.. ds " return "                     
LAB_M65_small_00000__0b4d:
  0b4d  AD9FFDF2       JSR [0xfdf2]                      
  0b51  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$17F1 ->$18C5 ->$0B62 ->$0AB5 ->$0B62 ->$0B62
  0b55  17F1           addr M65_small_00000::17f1        
  0b57  18C5           addr M65_small_00000::18c5        
  0b59  0B62           addr M65_small_00000::0b62        
  0b5b  0AB5           addr M65_small_00000::0ab5        
  0b5d  0B62           addr M65_small_00000::0b62        
  0b5f  0B62           addr M65_small_00000::0b62        
LAB_M65_small_00000__0b61:
  0b61  39             RTS                               

; ---- function FUN_M65_small_00000__0b62
FUN_M65_small_00000__0b62:
  0b62  39             RTS                               

; ---- function FUN_M65_small_00000__0b63
FUN_M65_small_00000__0b63:
  0b63  3426           PSHS  Y B A                       
  0b65  AD9FFC8E       JSR [0xfc8e]                      
  0b69  FC60F9         LDD 0x60f9                        
  0b6c  FD70B2         STD 0x70b2                        
  0b6f  FD6074         STD 0x6074                        
  0b72  1700E1         LBSR 0x0c56                       
  0b75  3526           PULS  A B Y                       
  0b77  39             RTS                               

; ---- function FUN_M65_small_00000__0b78
FUN_M65_small_00000__0b78:
  0b78  3406           PSHS  B A                         
  0b7a  FC70B2         LDD 0x70b2                        
  0b7d  88FF           EORA #0xff                        
  0b7f  C8FF           EORB #0xff                        
  0b81  FD70B2         STD 0x70b2                        
  0b84  170005         LBSR 0x0b8c                       
  0b87  17001F         LBSR 0x0ba9                       
  0b8a  3506           PULS  A B                         

; ---- function FUN_M65_small_00000__0b8c
FUN_M65_small_00000__0b8c:
  0b8c  3406           PSHS  B A                         
  0b8e  1700C5         LBSR 0x0c56                       
  0b91  17006A         LBSR 0x0bfe                       
  0b94  CC0B62         LDD #0xb62                        
  0b97  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  0b9b  6070           addr 6070                         
LAB_M65_small_00000__0b9d:
  0b9d  CC0B62         LDD #0xb62                        
  0ba0  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  0ba4  6072           addr 6072                         
LAB_M65_small_00000__0ba6:
  0ba6  3506           PULS  A B                         
  0ba8  39             RTS                               

; ---- function FUN_M65_small_00000__0ba9
FUN_M65_small_00000__0ba9:
  0ba9  3426           PSHS  Y B A                       
  0bab  108E000B       LDY #0xb                          
  0baf  FC70B2         LDD 0x70b2                        
  0bb2  AD9FFE40       JSR [0xfe40]                      
  0bb6  17009D         LBSR 0x0c56                       
  0bb9  170042         LBSR 0x0bfe                       
  0bbc  170007         LBSR 0x0bc6                       
  0bbf  AD9FFDEC       JSR [0xfdec]                      
  0bc3  3526           PULS  A B Y                       
  0bc5  39             RTS                               

; ---- function FUN_M65_small_00000__0bc6
FUN_M65_small_00000__0bc6:
  0bc6  3456           PSHS  U X B A                     
  0bc8  FC70B2         LDD 0x70b2                        
  0bcb  10830000       CMPD #0x0                         
  0bcf  10270015       LBEQ 0x0be8                       
  0bd3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "sust=off" [-]
  0bd7  00             db 0h                             
  0bd8  00             db 0h                             
  0bd9  737573743D6F.. ds "sust=off"                     
  0be1  00             db 0h                             
LAB_M65_small_00000__0be2:
  0be2  AD9FFDF2       JSR [0xfdf2]                      
  0be6  2013           BRA 0x0bfb                        
LAB_M65_small_00000__0be8:
  0be8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "sust=on " [-]
  0bec  00             db 0h                             
  0bed  00             db 0h                             
  0bee  737573743D6F.. ds "sust=on "                     
  0bf6  00             db 0h                             
LAB_M65_small_00000__0bf7:
  0bf7  AD9FFDF2       JSR [0xfdf2]                      
LAB_M65_small_00000__0bfb:
  0bfb  3556           PULS  A B X U                     
  0bfd  39             RTS                               

; ---- function FUN_M65_small_00000__0bfe
FUN_M65_small_00000__0bfe:
  0bfe  3456           PSHS  U X B A                     
  0c00  FC70B2         LDD 0x70b2                        
  0c03  10830000       CMPD #0x0                         
  0c07  10270025       LBEQ 0x0c30                       
  0c0b  17FB53         LBSR 0x0761                       
  0c0e  C613           LDB #0x13                         
  0c10  AD9FFC36       JSR [0xfc36]                      
  0c14  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "  --normal operation-"
  0c18  0A202D2D6E6F.. char[22] "\n --normal operation-" 
LAB_M65_small_00000__0c2e:
  0c2e  2023           BRA 0x0c53                        
LAB_M65_small_00000__0c30:
  0c30  17FB2E         LBSR 0x0761                       
  0c33  C613           LDB #0x13                         
  0c35  AD9FFC36       JSR [0xfc36]                      
  0c39  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "  --sustain looping--"
  0c3d  0A202D2D7375.. char[22] "\n --sustain looping--" 
LAB_M65_small_00000__0c53:
  0c53  3556           PULS  A B X U                     
  0c55  39             RTS                               

; ---- function FUN_M65_small_00000__0c56
FUN_M65_small_00000__0c56:
  0c56  3476           PSHS  U Y X B A                   
  0c58  FC70B2         LDD 0x70b2                        
  0c5b  10830000       CMPD #0x0                         
  0c5f  10270014       LBEQ 0x0c77                       
  0c63  CC000A         LDD #0xa                          
  0c66  AD9FFD20       JSR [0xfd20]                      
  0c6a  108E0346       LDY #0x346                        
  0c6e  CC0001         LDD #0x1                          
  0c71  AD9FFD2E       JSR [0xfd2e]                      
  0c75  2012           BRA 0x0c89                        
LAB_M65_small_00000__0c77:
  0c77  CC000A         LDD #0xa                          
  0c7a  AD9FFD20       JSR [0xfd20]                      
  0c7e  108E0346       LDY #0x346                        
  0c82  CC0000         LDD #0x0                          
  0c85  AD9FFD2E       JSR [0xfd2e]                      
LAB_M65_small_00000__0c89:
  0c89  3576           PULS  A B X Y U                   
  0c8b  39             RTS                               

; ---- function FUN_M65_small_00000__0c8c
FUN_M65_small_00000__0c8c:
  0c8c  3426           PSHS  Y B A                       
  0c8e  AD9FFC8E       JSR [0xfc8e]                      
  0c92  FC60F9         LDD 0x60f9                        
  0c95  FD70B4         STD 0x70b4                        
  0c98  FD6074         STD 0x6074                        
  0c9b  1700FE         LBSR 0x0d9c                       
  0c9e  CC71E1         LDD #0x71e1                       
  0ca1  837156         SUBD #0x7156                      
  0ca4  1F02           TFR D,Y                           
  0ca6  FC70B4         LDD 0x70b4                        
  0ca9  AD9FFC80       JSR [0xfc80]                      
  0cad  3526           PULS  A B Y                       
  0caf  39             RTS                               

; ---- function FUN_M65_small_00000__0cb0
FUN_M65_small_00000__0cb0:
  0cb0  3406           PSHS  B A                         
  0cb2  FC70B4         LDD 0x70b4                        
  0cb5  88FF           EORA #0xff                        
  0cb7  C8FF           EORB #0xff                        
  0cb9  FD70B4         STD 0x70b4                        
  0cbc  170005         LBSR 0x0cc4                       
  0cbf  17001F         LBSR 0x0ce1                       
  0cc2  3506           PULS  A B                         

; ---- function FUN_M65_small_00000__0cc4
FUN_M65_small_00000__0cc4:
  0cc4  3406           PSHS  B A                         
  0cc6  1700D3         LBSR 0x0d9c                       
  0cc9  170040         LBSR 0x0d0c                       
  0ccc  CC0D0C         LDD #0xd0c                        
  0ccf  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  0cd3  6070           addr 6070                         
LAB_M65_small_00000__0cd5:
  0cd5  CC0D9C         LDD #0xd9c                        
  0cd8  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  0cdc  6072           addr 6072                         
LAB_M65_small_00000__0cde:
  0cde  3506           PULS  A B                         
  0ce0  39             RTS                               

; ---- function FUN_M65_small_00000__0ce1
FUN_M65_small_00000__0ce1:
  0ce1  3426           PSHS  Y B A                       
  0ce3  CC71E1         LDD #0x71e1                       
  0ce6  837156         SUBD #0x7156                      
  0ce9  1F02           TFR D,Y                           
  0ceb  FC70B4         LDD 0x70b4                        
  0cee  AD9FFC80       JSR [0xfc80]                      
  0cf2  108E0023       LDY #0x23                         
  0cf6  FC70B4         LDD 0x70b4                        
  0cf9  AD9FFE40       JSR [0xfe40]                      
  0cfd  17009C         LBSR 0x0d9c                       
  0d00  8D0A           BSR 0x0d0c                        
  0d02  17005F         LBSR 0x0d64                       
  0d05  AD9FFDEC       JSR [0xfdec]                      
  0d09  3526           PULS  A B Y                       
  0d0b  39             RTS                               

; ---- function FUN_M65_small_00000__0d0c
FUN_M65_small_00000__0d0c:
  0d0c  3456           PSHS  U X B A                     
  0d0e  FC70B4         LDD 0x70b4                        
  0d11  10830000       CMPD #0x0                         
  0d15  10270025       LBEQ 0x0d3e                       
  0d19  17FA45         LBSR 0x0761                       
  0d1c  C613           LDB #0x13                         
  0d1e  AD9FFC36       JSR [0xfc36]                      
  0d22  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " ---normal output----"
  0d26  0A2D2D2D6E6F.. char[22] "\n---normal output----" 
LAB_M65_small_00000__0d3c:
  0d3c  2023           BRA 0x0d61                        
LAB_M65_small_00000__0d3e:
  0d3e  17FA20         LBSR 0x0761                       
  0d41  C613           LDB #0x13                         
  0d43  AD9FFC36       JSR [0xfc36]                      
  0d47  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " --pitch quantizing--"
  0d4b  0A2D2D706974.. char[22] "\n--pitch quantizing--" 
LAB_M65_small_00000__0d61:
  0d61  3556           PULS  A B X U                     
  0d63  39             RTS                               

; ---- function FUN_M65_small_00000__0d64
FUN_M65_small_00000__0d64:
  0d64  3456           PSHS  U X B A                     
  0d66  FC70B4         LDD 0x70b4                        
  0d69  10830000       CMPD #0x0                         
  0d6d  10270015       LBEQ 0x0d86                       
  0d71  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "quan=off" [-]
  0d75  00             db 0h                             
  0d76  00             db 0h                             
  0d77  7175616E3D6F.. ds "quan=off"                     
  0d7f  00             db 0h                             
LAB_M65_small_00000__0d80:
  0d80  AD9FFDF2       JSR [0xfdf2]                      
  0d84  2013           BRA 0x0d99                        
LAB_M65_small_00000__0d86:
  0d86  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] [-] "quan=on " [-]
  0d8a  00             db 0h                             
  0d8b  00             db 0h                             
  0d8c  7175616E3D6F.. ds "quan=on "                     
  0d94  00             db 0h                             
LAB_M65_small_00000__0d95:
  0d95  AD9FFDF2       JSR [0xfdf2]                      
LAB_M65_small_00000__0d99:
  0d99  3556           PULS  A B X U                     
  0d9b  39             RTS                               

; ---- function FUN_M65_small_00000__0d9c
FUN_M65_small_00000__0d9c:
  0d9c  39             RTS                               

; ---- function FUN_M65_small_00000__0d9d
FUN_M65_small_00000__0d9d:
  0d9d  FC704A         LDD 0x704a                        
  0da0  FD6074         STD 0x6074                        
  0da3  17F9BB         LBSR 0x0761                       
  0da6  C604           LDB #0x4                          
  0da8  AD9FFC36       JSR [0xfc36]                      
  0dac  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left pitch:       cents,  [     :1]"
  0db0  0A6C65667420.. char[37] "\nleft pitch:       cents,  [     :1]"
LAB_M65_small_00000__0dd5:
  0dd5  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$0ED0 ->$0EA4 $0064 $0064 $0000
  0dd9  01             db 1h                             
  0dda  01             db 1h                             
  0ddb  02             db 2h                             
  0ddc  01             db 1h                             
  0ddd  01             db 1h                             
  0dde  00             db 0h                             
  0ddf  05             db 5h                             
  0de0  80             db 80h                            
  0de1  04B0           dw 4B0h                           
  0de3  F6A0           dw F6A0h                          
  0de5  0000           dw 0h                             
  0de7  0ED0           addr M65_small_00000::0ed0        
  0de9  0EA4           addr M65_small_00000::0ea4        
  0deb  0064           dw 64h                            
  0ded  0064           dw 64h                            
  0def  0000           dw 0h                             
LAB_M65_small_00000__0df1:
  0df1  1700DC         LBSR 0x0ed0                       
  0df4  1700D9         LBSR 0x0ed0                       
  0df7  39             RTS                               
PTR_FUN_M65_small_00000__0ed0_M65_small_00000__0df8:
  0df8  0ED0           addr M65_small_00000::0ed0        
  0dfa  0F04           addr M65_small_00000::0f04        
  0dfc  7046           addr 7046                         
  0dfe  .db 00 47 CE 00 32 00 00 06                          ; .G..2...

; ---- function FUN_M65_small_00000__0e06
FUN_M65_small_00000__0e06:
  0e06  3410           PSHS  X                           
  0e08  8E0DF8         LDX #0xdf8                         ; desc[API_FE1C]: ->$0ED0 ->$0F04 $7046
  0e0b  AD9FFE1C       JSR [0xfe1c]                      
  0e0f  3510           PULS  X                           
  0e11  39             RTS                               

; ---- function FUN_M65_small_00000__0e12
FUN_M65_small_00000__0e12:
  0e12  3410           PSHS  X                           
  0e14  8E0DF8         LDX #0xdf8                         ; desc[API_FE1A]: ->$0ED0 ->$0F04 $7046
  0e17  AD9FFE1A       JSR [0xfe1a]                      
  0e1b  3510           PULS  X                           
  0e1d  39             RTS                               

; ---- function FUN_M65_small_00000__0e1e
FUN_M65_small_00000__0e1e:
  0e1e  3426           PSHS  Y B A                       
  0e20  AD9FFC8E       JSR [0xfc8e]                      
  0e24  FC60F9         LDD 0x60f9                        
  0e27  FD6074         STD 0x6074                        
  0e2a  B37048         SUBD 0x7048                       
  0e2d  FD7046         STD 0x7046                        
  0e30  1700D1         LBSR 0x0f04                       
  0e33  CC719B         LDD #0x719b                       
  0e36  837156         SUBD #0x7156                      
  0e39  1F02           TFR D,Y                           
  0e3b  FC7046         LDD 0x7046                        
  0e3e  AD9FFC82       JSR [0xfc82]                      
  0e42  3526           PULS  A B Y                       
  0e44  39             RTS                               

; ---- function FUN_M65_small_00000__0e45
FUN_M65_small_00000__0e45:
  0e45  3406           PSHS  B A                         
  0e47  FC704A         LDD 0x704a                        
  0e4a  FD6074         STD 0x6074                        
  0e4d  17F911         LBSR 0x0761                       
  0e50  C604           LDB #0x4                          
  0e52  AD9FFC36       JSR [0xfc36]                      
  0e56  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left pitch:       cents,  [     :1]"
  0e5a  0A6C65667420.. char[37] "\nleft pitch:       cents,  [     :1]"
LAB_M65_small_00000__0e7f:
  0e7f  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$0ED0 ->$0EA4 $0001 $0001 $0000
  0e83  01             db 1h                             
  0e84  01             db 1h                             
  0e85  02             db 2h                             
  0e86  01             db 1h                             
  0e87  01             db 1h                             
  0e88  00             db 0h                             
  0e89  05             db 5h                             
  0e8a  80             db 80h                            
  0e8b  04B0           dw 4B0h                           
  0e8d  F6A0           dw F6A0h                          
  0e8f  0000           dw 0h                             
  0e91  0ED0           addr M65_small_00000::0ed0        
  0e93  0EA4           addr M65_small_00000::0ea4        
  0e95  0001           dw 1h                             
  0e97  0001           dw 1h                             
  0e99  0000           dw 0h                             
LAB_M65_small_00000__0e9b:
  0e9b  170032         LBSR 0x0ed0                       
  0e9e  17002F         LBSR 0x0ed0                       
  0ea1  3506           PULS  A B                         
  0ea3  39             RTS                               

; ---- function FUN_M65_small_00000__0ea4
FUN_M65_small_00000__0ea4:
  0ea4  3426           PSHS  Y B A                       
  0ea6  FC6074         LDD 0x6074                        
  0ea9  B37048         SUBD 0x7048                       
  0eac  FD7046         STD 0x7046                        
  0eaf  CC719B         LDD #0x719b                       
  0eb2  837156         SUBD #0x7156                      
  0eb5  1F02           TFR D,Y                           
  0eb7  FC7046         LDD 0x7046                        
  0eba  AD9FFC82       JSR [0xfc82]                      
  0ebe  108E0004       LDY #0x4                          
  0ec2  FC7046         LDD 0x7046                        
  0ec5  AD9FFE40       JSR [0xfe40]                      
  0ec9  8D39           BSR 0x0f04                        
  0ecb  8D03           BSR 0x0ed0                        
  0ecd  3526           PULS  A B Y                       
  0ecf  39             RTS                               

; ---- function FUN_M65_small_00000__0ed0
FUN_M65_small_00000__0ed0:
  0ed0  3456           PSHS  U X B A                     
  0ed2  C611           LDB #0x11                         
  0ed4  AD9FFC36       JSR [0xfc36]                      
  0ed8  CC0005         LDD #0x5                          
  0edb  8E609E         LDX #0x609e                       
  0ede  AD9FFC3A       JSR [0xfc3a]                      
  0ee2  FC70B6         LDD 0x70b6                        
  0ee5  3606           PSHU  B A                         
  0ee7  108E714C       LDY #0x714c                       
  0eeb  8603           LDA #0x3                          
  0eed  AD9FFC40       JSR [0xfc40]                      
  0ef1  C620           LDB #0x20                         
  0ef3  AD9FFC36       JSR [0xfc36]                      
  0ef7  CC0005         LDD #0x5                          
  0efa  8E7150         LDX #0x7150                       
  0efd  AD9FFC3A       JSR [0xfc3a]                      
  0f01  3556           PULS  A B X U                     
  0f03  39             RTS                               

; ---- function FUN_M65_small_00000__0f04
FUN_M65_small_00000__0f04:
  0f04  3477           PSHS  U Y X B A CC                
  0f06  CCF6A0         LDD #0xf6a0                       
  0f09  3606           PSHU  B A                         
  0f0b  CC04B0         LDD #0x4b0                        
  0f0e  3606           PSHU  B A                         
  0f10  FC7046         LDD 0x7046                        
  0f13  F37048         ADDD 0x7048                       
  0f16  3606           PSHU  B A                         
  0f18  AD9FFCD8       JSR [0xfcd8]                      
  0f1c  3706           PULU  A B                         
  0f1e  FD704A         STD 0x704a                        
  0f21  FC704A         LDD 0x704a                        
  0f24  3606           PSHU  B A                         
  0f26  CC0064         LDD #0x64                         
  0f29  3606           PSHU  B A                         
  0f2b  AD9FFCE6       JSR [0xfce6]                      
  0f2f  335E           LEAU -0x2,U                       
  0f31  17200F         LBSR 0x2f43                       
  0f34  3706           PULU  A B                         
  0f36  FD70EE         STD 0x70ee                        
  0f39  AD9FFD52       JSR [0xfd52]                      
  0f3d  3706           PULU  A B                         
  0f3f  FD70B6         STD 0x70b6                        
  0f42  3577           PULS CC A B X Y U                 
  0f44  39             RTS                               

; ---- function FUN_M65_small_00000__0f45
FUN_M65_small_00000__0f45:
  0f45  FC7052         LDD 0x7052                        
  0f48  FD6074         STD 0x6074                        
  0f4b  17F813         LBSR 0x0761                       
  0f4e  C604           LDB #0x4                          
  0f50  AD9FFC36       JSR [0xfc36]                      
  0f54  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right pitch:       cents, [     :1]"
  0f58  0A7269676874.. char[37] "\nright pitch:       cents, [     :1]"
LAB_M65_small_00000__0f7d:
  0f7d  FC7132         LDD 0x7132                        
  0f80  1083FFFF       CMPD #0xffff                      
  0f84  10270032       LBEQ 0x0fba                       
  0f88  17F7D6         LBSR 0x0761                       
  0f8b  C604           LDB #0x4                          
  0f8d  AD9FFC36       JSR [0xfc36]                      
  0f91  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l & r pitch:       cents, [     :1]"
  0f95  0A6C20262072.. char[37] "\nl & r pitch:       cents, [     :1]"
LAB_M65_small_00000__0fba:
  0fba  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$10F2 ->$10C6 $0064 $0064 $0000
  0fbe  01             db 1h                             
  0fbf  01             db 1h                             
  0fc0  02             db 2h                             
  0fc1  01             db 1h                             
  0fc2  01             db 1h                             
  0fc3  00             db 0h                             
  0fc4  05             db 5h                             
  0fc5  80             db 80h                            
  0fc6  04B0           dw 4B0h                           
  0fc8  F6A0           dw F6A0h                          
  0fca  0000           dw 0h                             
  0fcc  10F2           addr M65_small_00000::10f2        
  0fce  10C6           addr M65_small_00000::10c6        
  0fd0  0064           dw 64h                            
  0fd2  0064           dw 64h                            
  0fd4  0000           dw 0h                             
LAB_M65_small_00000__0fd6:
  0fd6  170119         LBSR 0x10f2                       
  0fd9  170116         LBSR 0x10f2                       
  0fdc  39             RTS                               
PTR_FUN_M65_small_00000__10f2_M65_small_00000__0fdd:
  0fdd  10F2           addr M65_small_00000::10f2        
  0fdf  1126           addr M65_small_00000::1126        
  0fe1  704E           addr 704e                         
  0fe3  .db 00 33 CE 00 32 00 00 06                          ; .3..2...

; ---- function FUN_M65_small_00000__0feb
FUN_M65_small_00000__0feb:
  0feb  3410           PSHS  X                           
  0fed  8E0FDD         LDX #0xfdd                         ; desc[API_FE1C]: ->$10F2 ->$1126 $704E
  0ff0  AD9FFE1C       JSR [0xfe1c]                      
  0ff4  3510           PULS  X                           
  0ff6  39             RTS                               

; ---- function FUN_M65_small_00000__0ff7
FUN_M65_small_00000__0ff7:
  0ff7  3410           PSHS  X                           
  0ff9  8E0FDD         LDX #0xfdd                         ; desc[API_FE1A]: ->$10F2 ->$1126 $704E
  0ffc  AD9FFE1A       JSR [0xfe1a]                      
  1000  3510           PULS  X                           
  1002  39             RTS                               

; ---- function FUN_M65_small_00000__1003
FUN_M65_small_00000__1003:
  1003  3426           PSHS  Y B A                       
  1005  AD9FFC8E       JSR [0xfc8e]                      
  1009  FC60F9         LDD 0x60f9                        
  100c  FD6074         STD 0x6074                        
  100f  B37050         SUBD 0x7050                       
  1012  FD704E         STD 0x704e                        
  1015  17010E         LBSR 0x1126                       
  1018  CC7187         LDD #0x7187                       
  101b  837156         SUBD #0x7156                      
  101e  1F02           TFR D,Y                           
  1020  FC704E         LDD 0x704e                        
  1023  AD9FFC82       JSR [0xfc82]                      
  1027  3526           PULS  A B Y                       
  1029  39             RTS                               

; ---- function FUN_M65_small_00000__102a
FUN_M65_small_00000__102a:
  102a  3406           PSHS  B A                         
  102c  FC7052         LDD 0x7052                        
  102f  FD6074         STD 0x6074                        
  1032  17F72C         LBSR 0x0761                       
  1035  C604           LDB #0x4                          
  1037  AD9FFC36       JSR [0xfc36]                      
  103b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right pitch:       cents, [     :1]"
  103f  0A7269676874.. char[37] "\nright pitch:       cents, [     :1]"
LAB_M65_small_00000__1064:
  1064  FC7132         LDD 0x7132                        
  1067  1083FFFF       CMPD #0xffff                      
  106b  10270032       LBEQ 0x10a1                       
  106f  17F6EF         LBSR 0x0761                       
  1072  C604           LDB #0x4                          
  1074  AD9FFC36       JSR [0xfc36]                      
  1078  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l & r pitch:       cents, [     :1]"
  107c  0A6C20262072.. char[37] "\nl & r pitch:       cents, [     :1]"
LAB_M65_small_00000__10a1:
  10a1  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$10F2 ->$10C6 $0001 $0001 $0000
  10a5  01             db 1h                             
  10a6  01             db 1h                             
  10a7  02             db 2h                             
  10a8  01             db 1h                             
  10a9  01             db 1h                             
  10aa  00             db 0h                             
  10ab  05             db 5h                             
  10ac  80             db 80h                            
  10ad  04B0           dw 4B0h                           
  10af  F6A0           dw F6A0h                          
  10b1  0000           dw 0h                             
  10b3  10F2           addr M65_small_00000::10f2        
  10b5  10C6           addr M65_small_00000::10c6        
  10b7  0001           dw 1h                             
  10b9  0001           dw 1h                             
  10bb  0000           dw 0h                             
LAB_M65_small_00000__10bd:
  10bd  170032         LBSR 0x10f2                       
  10c0  17002F         LBSR 0x10f2                       
  10c3  3506           PULS  A B                         
  10c5  39             RTS                               

; ---- function FUN_M65_small_00000__10c6
FUN_M65_small_00000__10c6:
  10c6  3426           PSHS  Y B A                       
  10c8  FC6074         LDD 0x6074                        
  10cb  B37050         SUBD 0x7050                       
  10ce  FD704E         STD 0x704e                        
  10d1  CC7187         LDD #0x7187                       
  10d4  837156         SUBD #0x7156                      
  10d7  1F02           TFR D,Y                           
  10d9  FC704E         LDD 0x704e                        
  10dc  AD9FFC82       JSR [0xfc82]                      
  10e0  108E0006       LDY #0x6                          
  10e4  FC704E         LDD 0x704e                        
  10e7  AD9FFE40       JSR [0xfe40]                      
  10eb  8D39           BSR 0x1126                        
  10ed  8D03           BSR 0x10f2                        
  10ef  3526           PULS  A B Y                       
  10f1  39             RTS                               

; ---- function FUN_M65_small_00000__10f2
FUN_M65_small_00000__10f2:
  10f2  3416           PSHS  X B A                       
  10f4  C612           LDB #0x12                         
  10f6  AD9FFC36       JSR [0xfc36]                      
  10fa  CC0005         LDD #0x5                          
  10fd  8E609E         LDX #0x609e                       
  1100  AD9FFC3A       JSR [0xfc3a]                      
  1104  FC70B8         LDD 0x70b8                        
  1107  3606           PSHU  B A                         
  1109  108E714C       LDY #0x714c                       
  110d  8603           LDA #0x3                          
  110f  AD9FFC40       JSR [0xfc40]                      
  1113  C620           LDB #0x20                         
  1115  AD9FFC36       JSR [0xfc36]                      
  1119  CC0005         LDD #0x5                          
  111c  8E7150         LDX #0x7150                       
  111f  AD9FFC3A       JSR [0xfc3a]                      
  1123  3516           PULS  A B X                       
  1125  39             RTS                               

; ---- function FUN_M65_small_00000__1126
FUN_M65_small_00000__1126:
  1126  3477           PSHS  U Y X B A CC                
  1128  CCF6A0         LDD #0xf6a0                       
  112b  3606           PSHU  B A                         
  112d  CC04B0         LDD #0x4b0                        
  1130  3606           PSHU  B A                         
  1132  FC704E         LDD 0x704e                        
  1135  F37050         ADDD 0x7050                       
  1138  3606           PSHU  B A                         
  113a  AD9FFCD8       JSR [0xfcd8]                      
  113e  3706           PULU  A B                         
  1140  FD7052         STD 0x7052                        
  1143  FC7052         LDD 0x7052                        
  1146  3606           PSHU  B A                         
  1148  CC0064         LDD #0x64                         
  114b  3606           PSHU  B A                         
  114d  AD9FFCE6       JSR [0xfce6]                      
  1151  335E           LEAU -0x2,U                       
  1153  171DED         LBSR 0x2f43                       
  1156  3706           PULU  A B                         
  1158  FD70F0         STD 0x70f0                        
  115b  AD9FFD54       JSR [0xfd54]                      
  115f  3706           PULU  A B                         
  1161  FD70B8         STD 0x70b8                        
  1164  3577           PULS CC A B X Y U                 
  1166  39             RTS                               
PTR_FUN_M65_small_00000__1257_M65_small_00000__1167:
  1167  1257           addr M65_small_00000::1257        
  1169  126C           addr M65_small_00000::126c        
  116b  7056           addr 7056                         
  116d  .db 00 4B EB E0 14 20 00 05                          ; .K... ..

; ---- function FUN_M65_small_00000__1175
FUN_M65_small_00000__1175:
  1175  3410           PSHS  X                           
  1177  8E1167         LDX #0x1167                        ; desc[API_FE1C]: ->$1257 ->$126C $7056
  117a  AD9FFE1C       JSR [0xfe1c]                      
  117e  3510           PULS  X                           
  1180  39             RTS                               

; ---- function FUN_M65_small_00000__1181
FUN_M65_small_00000__1181:
  1181  3410           PSHS  X                           
  1183  8E1167         LDX #0x1167                        ; desc[API_FE1A]: ->$1257 ->$126C $7056
  1186  AD9FFE1A       JSR [0xfe1a]                      
  118a  3510           PULS  X                           
  118c  39             RTS                               

; ---- function FUN_M65_small_00000__118d
FUN_M65_small_00000__118d:
  118d  3426           PSHS  Y B A                       
  118f  AD9FFC8E       JSR [0xfc8e]                      
  1193  FC60F9         LDD 0x60f9                        
  1196  FD6074         STD 0x6074                        
  1199  B37058         SUBD 0x7058                       
  119c  FD7056         STD 0x7056                        
  119f  1700CA         LBSR 0x126c                       
  11a2  CC719F         LDD #0x719f                       
  11a5  837156         SUBD #0x7156                      
  11a8  1F02           TFR D,Y                           
  11aa  FC7056         LDD 0x7056                        
  11ad  AD9FFC82       JSR [0xfc82]                      
  11b1  3526           PULS  A B Y                       
  11b3  39             RTS                               

; ---- function FUN_M65_small_00000__11b4
FUN_M65_small_00000__11b4:
  11b4  3406           PSHS  B A                         
  11b6  FC705A         LDD 0x705a                        
  11b9  FD6074         STD 0x6074                        
  11bc  17F5A2         LBSR 0x0761                       
  11bf  C613           LDB #0x13                         
  11c1  AD9FFC36       JSR [0xfc36]                      
  11c5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left delay:      mS "
  11c9  0A6C65667420.. char[22] "\nleft delay:      mS " 
LAB_M65_small_00000__11df:
  11df  FC7134         LDD 0x7134                        
  11e2  1083FFFF       CMPD #0xffff                      
  11e6  10270021       LBEQ 0x120b                       
  11ea  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $03E8 $0000 $0000 ->$1257 ->$122D $0001 $0001 $0000
  11ee  01             db 1h                             
  11ef  01             db 1h                             
  11f0  02             db 2h                             
  11f1  01             db 1h                             
  11f2  01             db 1h                             
  11f3  00             db 0h                             
  11f4  04             db 4h                             
  11f5  80             db 80h                            
  11f6  03E8           dw 3E8h                           
  11f8  0000           dw 0h                             
  11fa  0000           dw 0h                             
  11fc  1257           addr M65_small_00000::1257        
  11fe  122D           addr M65_small_00000::122d        
  1200  0001           dw 1h                             
  1202  0001           dw 1h                             
  1204  0000           dw 0h                             
LAB_M65_small_00000__1206:
  1206  17004E         LBSR 0x1257                       
  1209  201F           BRA 0x122a                        
LAB_M65_small_00000__120b:
  120b  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $01F4 $0000 $0000 ->$1257 ->$122D $0001 $0001 $0000
  120f  01             db 1h                             
  1210  01             db 1h                             
  1211  02             db 2h                             
  1212  01             db 1h                             
  1213  01             db 1h                             
  1214  00             db 0h                             
  1215  04             db 4h                             
  1216  80             db 80h                            
  1217  01F4           dw 1F4h                           
  1219  0000           dw 0h                             
  121b  0000           dw 0h                             
  121d  1257           addr M65_small_00000::1257        
  121f  122D           addr M65_small_00000::122d        
  1221  0001           dw 1h                             
  1223  0001           dw 1h                             
  1225  0000           dw 0h                             
LAB_M65_small_00000__1227:
  1227  17002D         LBSR 0x1257                       
LAB_M65_small_00000__122a:
  122a  3506           PULS  A B                         
  122c  39             RTS                               

; ---- function FUN_M65_small_00000__122d
FUN_M65_small_00000__122d:
  122d  3426           PSHS  Y B A                       
  122f  FC6074         LDD 0x6074                        
  1232  B37058         SUBD 0x7058                       
  1235  FD7056         STD 0x7056                        
  1238  CC719F         LDD #0x719f                       
  123b  837156         SUBD #0x7156                      
  123e  1F02           TFR D,Y                           
  1240  FC7056         LDD 0x7056                        
  1243  AD9FFC82       JSR [0xfc82]                      
  1247  108E0005       LDY #0x5                          
  124b  FC7056         LDD 0x7056                        
  124e  AD9FFE40       JSR [0xfe40]                      
  1252  8D18           BSR 0x126c                        
  1254  3526           PULS  A B Y                       
  1256  39             RTS                               

; ---- function FUN_M65_small_00000__1257
FUN_M65_small_00000__1257:
  1257  3416           PSHS  X B A                       
  1259  C620           LDB #0x20                         
  125b  AD9FFC36       JSR [0xfc36]                      
  125f  CC0004         LDD #0x4                          
  1262  8E609F         LDX #0x609f                       
  1265  AD9FFC3A       JSR [0xfc3a]                      
  1269  3516           PULS  A B X                       
  126b  39             RTS                               

; ---- function FUN_M65_small_00000__126c
FUN_M65_small_00000__126c:
  126c  3476           PSHS  U Y X B A                   
  126e  FC7134         LDD 0x7134                        
  1271  10830000       CMPD #0x0                         
  1275  1027001D       LBEQ 0x1296                       
  1279  CC0000         LDD #0x0                          
  127c  3606           PSHU  B A                         
  127e  CC01F4         LDD #0x1f4                        
  1281  3606           PSHU  B A                         
  1283  FC7056         LDD 0x7056                        
  1286  F37058         ADDD 0x7058                       
  1289  3606           PSHU  B A                         
  128b  AD9FFCD8       JSR [0xfcd8]                      
  128f  3706           PULU  A B                         
  1291  FD705A         STD 0x705a                        
  1294  201B           BRA 0x12b1                        
LAB_M65_small_00000__1296:
  1296  CC0000         LDD #0x0                          
  1299  3606           PSHU  B A                         
  129b  CC03E8         LDD #0x3e8                        
  129e  3606           PSHU  B A                         
  12a0  FC7056         LDD 0x7056                        
  12a3  F37058         ADDD 0x7058                       
  12a6  3606           PSHU  B A                         
  12a8  AD9FFCD8       JSR [0xfcd8]                      
  12ac  3706           PULU  A B                         
  12ae  FD705A         STD 0x705a                        
LAB_M65_small_00000__12b1:
  12b1  CC002C         LDD #0x2c                         
  12b4  3606           PSHU  B A                         
  12b6  FC705A         LDD 0x705a                        
  12b9  3606           PSHU  B A                         
  12bb  AD9FFCEE       JSR [0xfcee]                      
  12bf  3706           PULU  A B                         
  12c1  FD70BA         STD 0x70ba                        
  12c4  171A2C         LBSR 0x2cf3                       
  12c7  3576           PULS  A B X Y U                   
  12c9  39             RTS                               
PTR_FUN_M65_small_00000__13ed_M65_small_00000__12ca:
  12ca  13ED           addr M65_small_00000::13ed        
  12cc  1402           addr M65_small_00000::1402        
  12ce  705E           addr 705e                         
  12d0  .db 00 37 EB E0 14 20 00 05                          ; .7... ..

; ---- function FUN_M65_small_00000__12d8
FUN_M65_small_00000__12d8:
  12d8  3410           PSHS  X                           
  12da  8E12CA         LDX #0x12ca                        ; desc[API_FE1C]: ->$13ED ->$1402 $705E
  12dd  AD9FFE1C       JSR [0xfe1c]                      
  12e1  3510           PULS  X                           
  12e3  39             RTS                               

; ---- function FUN_M65_small_00000__12e4
FUN_M65_small_00000__12e4:
  12e4  3410           PSHS  X                           
  12e6  8E12CA         LDX #0x12ca                        ; desc[API_FE1A]: ->$13ED ->$1402 $705E
  12e9  AD9FFE1A       JSR [0xfe1a]                      
  12ed  3510           PULS  X                           
  12ef  39             RTS                               

; ---- function FUN_M65_small_00000__12f0
FUN_M65_small_00000__12f0:
  12f0  3426           PSHS  Y B A                       
  12f2  AD9FFC8E       JSR [0xfc8e]                      
  12f6  FC60F9         LDD 0x60f9                        
  12f9  FD6074         STD 0x6074                        
  12fc  B37060         SUBD 0x7060                       
  12ff  FD705E         STD 0x705e                        
  1302  1700FD         LBSR 0x1402                       
  1305  CC718B         LDD #0x718b                       
  1308  837156         SUBD #0x7156                      
  130b  1F02           TFR D,Y                           
  130d  FC705E         LDD 0x705e                        
  1310  AD9FFC82       JSR [0xfc82]                      
  1314  3526           PULS  A B Y                       
  1316  39             RTS                               

; ---- function FUN_M65_small_00000__1317
FUN_M65_small_00000__1317:
  1317  3406           PSHS  B A                         
  1319  FC7062         LDD 0x7062                        
  131c  FD6074         STD 0x6074                        
  131f  17F43F         LBSR 0x0761                       
  1322  C613           LDB #0x13                         
  1324  AD9FFC36       JSR [0xfc36]                      
  1328  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right delay:      mS"
  132c  0A7269676874.. char[22] "\nright delay:      mS" 
LAB_M65_small_00000__1342:
  1342  FC7132         LDD 0x7132                        
  1345  10830000       CMPD #0x0                         
  1349  1027000D       LBEQ 0x135a                       
  134d  FC713A         LDD 0x713a                        
  1350  10830000       CMPD #0x0                         
  1354  10270002       LBEQ 0x135a                       
  1358  2010           BRA 0x136a                        
LAB_M65_small_00000__135a:
  135a  C614           LDB #0x14                         
  135c  AD9FFC36       JSR [0xfc36]                      
  1360  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "l & r"
  1364  6C2026207200   char[6] "l & r"                   
LAB_M65_small_00000__136a:
  136a  FC7134         LDD 0x7134                        
  136d  10830000       CMPD #0x0                         
  1371  1027002C       LBEQ 0x13a1                       
  1375  FC713A         LDD 0x713a                        
  1378  10830000       CMPD #0x0                         
  137c  10270021       LBEQ 0x13a1                       
  1380  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $01F4 $0000 $0000 ->$13ED ->$13C3 $0001 $0001 $0000
  1384  01             db 1h                             
  1385  01             db 1h                             
  1386  02             db 2h                             
  1387  01             db 1h                             
  1388  01             db 1h                             
  1389  00             db 0h                             
  138a  04             db 4h                             
  138b  80             db 80h                            
  138c  01F4           dw 1F4h                           
  138e  0000           dw 0h                             
  1390  0000           dw 0h                             
  1392  13ED           addr M65_small_00000::13ed        
  1394  13C3           addr M65_small_00000::13c3        
  1396  0001           dw 1h                             
  1398  0001           dw 1h                             
  139a  0000           dw 0h                             
LAB_M65_small_00000__139c:
  139c  17004E         LBSR 0x13ed                       
  139f  201F           BRA 0x13c0                        
LAB_M65_small_00000__13a1:
  13a1  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $03E8 $0000 $0000 ->$13ED ->$13C3 $0001 $0001 $0000
  13a5  01             db 1h                             
  13a6  01             db 1h                             
  13a7  02             db 2h                             
  13a8  01             db 1h                             
  13a9  01             db 1h                             
  13aa  00             db 0h                             
  13ab  04             db 4h                             
  13ac  80             db 80h                            
  13ad  03E8           dw 3E8h                           
  13af  0000           dw 0h                             
  13b1  0000           dw 0h                             
  13b3  13ED           addr M65_small_00000::13ed        
  13b5  13C3           addr M65_small_00000::13c3        
  13b7  0001           dw 1h                             
  13b9  0001           dw 1h                             
  13bb  0000           dw 0h                             
LAB_M65_small_00000__13bd:
  13bd  17002D         LBSR 0x13ed                       
LAB_M65_small_00000__13c0:
  13c0  3506           PULS  A B                         
  13c2  39             RTS                               

; ---- function FUN_M65_small_00000__13c3
FUN_M65_small_00000__13c3:
  13c3  3426           PSHS  Y B A                       
  13c5  FC6074         LDD 0x6074                        
  13c8  B37060         SUBD 0x7060                       
  13cb  FD705E         STD 0x705e                        
  13ce  CC718B         LDD #0x718b                       
  13d1  837156         SUBD #0x7156                      
  13d4  1F02           TFR D,Y                           
  13d6  FC705E         LDD 0x705e                        
  13d9  AD9FFC82       JSR [0xfc82]                      
  13dd  108E0007       LDY #0x7                          
  13e1  FC705E         LDD 0x705e                        
  13e4  AD9FFE40       JSR [0xfe40]                      
  13e8  8D18           BSR 0x1402                        
  13ea  3526           PULS  A B Y                       
  13ec  39             RTS                               

; ---- function FUN_M65_small_00000__13ed
FUN_M65_small_00000__13ed:
  13ed  3416           PSHS  X B A                       
  13ef  C621           LDB #0x21                         
  13f1  AD9FFC36       JSR [0xfc36]                      
  13f5  CC0004         LDD #0x4                          
  13f8  8E609F         LDX #0x609f                       
  13fb  AD9FFC3A       JSR [0xfc3a]                      
  13ff  3516           PULS  A B X                       
  1401  39             RTS                               

; ---- function FUN_M65_small_00000__1402
FUN_M65_small_00000__1402:
  1402  3476           PSHS  U Y X B A                   
  1404  FC7134         LDD 0x7134                        
  1407  10830000       CMPD #0x0                         
  140b  10270028       LBEQ 0x1437                       
  140f  FC713A         LDD 0x713a                        
  1412  10830000       CMPD #0x0                         
  1416  1027001D       LBEQ 0x1437                       
  141a  CC0000         LDD #0x0                          
  141d  3606           PSHU  B A                         
  141f  CC01F4         LDD #0x1f4                        
  1422  3606           PSHU  B A                         
  1424  FC705E         LDD 0x705e                        
  1427  F37060         ADDD 0x7060                       
  142a  3606           PSHU  B A                         
  142c  AD9FFCD8       JSR [0xfcd8]                      
  1430  3706           PULU  A B                         
  1432  FD7062         STD 0x7062                        
  1435  203F           BRA 0x1476                        
LAB_M65_small_00000__1437:
  1437  CC0000         LDD #0x0                          
  143a  3606           PSHU  B A                         
  143c  CC03E8         LDD #0x3e8                        
  143f  3606           PSHU  B A                         
  1441  FC705E         LDD 0x705e                        
  1444  F37060         ADDD 0x7060                       
  1447  3606           PSHU  B A                         
  1449  AD9FFCD8       JSR [0xfcd8]                      
  144d  3706           PULU  A B                         
  144f  FD7062         STD 0x7062                        
  1452  FC713A         LDD 0x713a                        
  1455  1083FFFF       CMPD #0xffff                      
  1459  10270019       LBEQ 0x1476                       
  145d  FC7062         LDD 0x7062                        
  1460  FD705A         STD 0x705a                        
  1463  CC002C         LDD #0x2c                         
  1466  3606           PSHU  B A                         
  1468  FC705A         LDD 0x705a                        
  146b  3606           PSHU  B A                         
  146d  AD9FFCEE       JSR [0xfcee]                      
  1471  3706           PULU  A B                         
  1473  FD70BA         STD 0x70ba                        
LAB_M65_small_00000__1476:
  1476  CC002C         LDD #0x2c                         
  1479  3606           PSHU  B A                         
  147b  FC7062         LDD 0x7062                        
  147e  3606           PSHU  B A                         
  1480  AD9FFCEE       JSR [0xfcee]                      
  1484  3706           PULU  A B                         
  1486  FD70BC         STD 0x70bc                        
  1489  171867         LBSR 0x2cf3                       
  148c  3576           PULS  A B X Y U                   
  148e  39             RTS                               
PTR_FUN_M65_small_00000__1553_M65_small_00000__148f:
  148f  1553           addr M65_small_00000::1553        
  1491  1568           addr M65_small_00000::1568        
  1493  7096           addr 7096                         
  1495  .db 00 4B C3 E0 3C 20 00 06                          ; .K..< ..

; ---- function FUN_M65_small_00000__149d
FUN_M65_small_00000__149d:
  149d  3410           PSHS  X                           
  149f  8E148F         LDX #0x148f                        ; desc[API_FE1C]: ->$1553 ->$1568 $7096
  14a2  AD9FFE1C       JSR [0xfe1c]                      
  14a6  3510           PULS  X                           
  14a8  39             RTS                               

; ---- function FUN_M65_small_00000__14a9
FUN_M65_small_00000__14a9:
  14a9  3410           PSHS  X                           
  14ab  8E148F         LDX #0x148f                        ; desc[API_FE1A]: ->$1553 ->$1568 $7096
  14ae  AD9FFE1A       JSR [0xfe1a]                      
  14b2  3510           PULS  X                           
  14b4  39             RTS                               

; ---- function FUN_M65_small_00000__14b5
FUN_M65_small_00000__14b5:
  14b5  3426           PSHS  Y B A                       
  14b7  AD9FFC8E       JSR [0xfc8e]                      
  14bb  FC60F9         LDD 0x60f9                        
  14be  FD6074         STD 0x6074                        
  14c1  B37098         SUBD 0x7098                       
  14c4  FD7096         STD 0x7096                        
  14c7  17009E         LBSR 0x1568                       
  14ca  CC719F         LDD #0x719f                       
  14cd  837156         SUBD #0x7156                      
  14d0  1F02           TFR D,Y                           
  14d2  FC7096         LDD 0x7096                        
  14d5  AD9FFC82       JSR [0xfc82]                      
  14d9  3526           PULS  A B Y                       
  14db  39             RTS                               

; ---- function FUN_M65_small_00000__14dc
FUN_M65_small_00000__14dc:
  14dc  3406           PSHS  B A                         
  14de  FC709A         LDD 0x709a                        
  14e1  FD6074         STD 0x6074                        
  14e4  17F27A         LBSR 0x0761                       
  14e7  C613           LDB #0x13                         
  14e9  AD9FFC36       JSR [0xfc36]                      
  14ed  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l length =      mS  "
  14f1  0A6C206C656E.. char[22] "\nl length =      mS  " 
LAB_M65_small_00000__1507:
  1507  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0578 $0001 $0000 ->$1553 ->$1529 $0001 $0001 $0000
  150b  01             db 1h                             
  150c  01             db 1h                             
  150d  02             db 2h                             
  150e  01             db 1h                             
  150f  01             db 1h                             
  1510  00             db 0h                             
  1511  04             db 4h                             
  1512  80             db 80h                            
  1513  0578           dw 578h                           
  1515  0001           dw 1h                             
  1517  0000           dw 0h                             
  1519  1553           addr M65_small_00000::1553        
  151b  1529           addr M65_small_00000::1529        
  151d  0001           dw 1h                             
  151f  0001           dw 1h                             
  1521  0000           dw 0h                             
LAB_M65_small_00000__1523:
  1523  17002D         LBSR 0x1553                       
  1526  3506           PULS  A B                         
  1528  39             RTS                               

; ---- function FUN_M65_small_00000__1529
FUN_M65_small_00000__1529:
  1529  3426           PSHS  Y B A                       
  152b  FC6074         LDD 0x6074                        
  152e  B37098         SUBD 0x7098                       
  1531  FD7096         STD 0x7096                        
  1534  CC719F         LDD #0x719f                       
  1537  837156         SUBD #0x7156                      
  153a  1F02           TFR D,Y                           
  153c  FC7096         LDD 0x7096                        
  153f  AD9FFC82       JSR [0xfc82]                      
  1543  108E0005       LDY #0x5                          
  1547  FC7096         LDD 0x7096                        
  154a  AD9FFE40       JSR [0xfe40]                      
  154e  8D18           BSR 0x1568                        
  1550  3526           PULS  A B Y                       
  1552  39             RTS                               

; ---- function FUN_M65_small_00000__1553
FUN_M65_small_00000__1553:
  1553  3416           PSHS  X B A                       
  1555  C61F           LDB #0x1f                         
  1557  AD9FFC36       JSR [0xfc36]                      
  155b  CC0004         LDD #0x4                          
  155e  8E609F         LDX #0x609f                       
  1561  AD9FFC3A       JSR [0xfc3a]                      
  1565  3516           PULS  A B X                       
  1567  39             RTS                               

; ---- function FUN_M65_small_00000__1568
FUN_M65_small_00000__1568:
  1568  3476           PSHS  U Y X B A                   
  156a  CC0001         LDD #0x1                          
  156d  3606           PSHU  B A                         
  156f  CC0578         LDD #0x578                        
  1572  3606           PSHU  B A                         
  1574  FC7096         LDD 0x7096                        
  1577  F37098         ADDD 0x7098                       
  157a  3606           PSHU  B A                         
  157c  AD9FFCD8       JSR [0xfcd8]                      
  1580  3706           PULU  A B                         
  1582  FD709A         STD 0x709a                        
  1585  FC709A         LDD 0x709a                        
  1588  3606           PSHU  B A                         
  158a  CC002C         LDD #0x2c                         
  158d  3606           PSHU  B A                         
  158f  AD9FFCEE       JSR [0xfcee]                      
  1593  3706           PULU  A B                         
  1595  FD70DE         STD 0x70de                        
  1598  AD9FFD3C       JSR [0xfd3c]                      
  159c  CC7FFF         LDD #0x7fff                       
  159f  3606           PSHU  B A                         
  15a1  FC70DE         LDD 0x70de                        
  15a4  2C08           BGE 0x15ae                        
  15a6  3606           PSHU  B A                         
  15a8  AD9FFCC8       JSR [0xfcc8]                      
  15ac  3706           PULU  A B                         
LAB_M65_small_00000__15ae:
  15ae  44             LSRA                              
  15af  56             RORB                              
  15b0  44             LSRA                              
  15b1  56             RORB                              
  15b2  44             LSRA                              
  15b3  56             RORB                              
  15b4  3606           PSHU  B A                         
  15b6  AD9FFCEA       JSR [0xfcea]                      
  15ba  CCFFFF         LDD #0xffff                       
  15bd  A3C4           SUBD ,U                           
  15bf  FD70DE         STD 0x70de                        
  15c2  CC000A         LDD #0xa                          
  15c5  AD9FFD20       JSR [0xfd20]                      
  15c9  108E0142       LDY #0x142                        
  15cd  FC70DE         LDD 0x70de                        
  15d0  AD9FFD2E       JSR [0xfd2e]                      
  15d4  3576           PULS  A B X Y U                   
  15d6  39             RTS                               
PTR_FUN_M65_small_00000__169b_M65_small_00000__15d7:
  15d7  169B           addr M65_small_00000::169b        
  15d9  16B0           addr M65_small_00000::16b0        
  15db  709E           addr 709e                         
  15dd  .db 00 37 C3 E0 3C 20 00 06                          ; .7..< ..

; ---- function FUN_M65_small_00000__15e5
FUN_M65_small_00000__15e5:
  15e5  3410           PSHS  X                           
  15e7  8E15D7         LDX #0x15d7                        ; desc[API_FE1C]: ->$169B ->$16B0 $709E
  15ea  AD9FFE1C       JSR [0xfe1c]                      
  15ee  3510           PULS  X                           
  15f0  39             RTS                               

; ---- function FUN_M65_small_00000__15f1
FUN_M65_small_00000__15f1:
  15f1  3410           PSHS  X                           
  15f3  8E15D7         LDX #0x15d7                        ; desc[API_FE1A]: ->$169B ->$16B0 $709E
  15f6  AD9FFE1A       JSR [0xfe1a]                      
  15fa  3510           PULS  X                           
  15fc  39             RTS                               

; ---- function FUN_M65_small_00000__15fd
FUN_M65_small_00000__15fd:
  15fd  3426           PSHS  Y B A                       
  15ff  AD9FFC8E       JSR [0xfc8e]                      
  1603  FC60F9         LDD 0x60f9                        
  1606  FD6074         STD 0x6074                        
  1609  B370A0         SUBD 0x70a0                       
  160c  FD709E         STD 0x709e                        
  160f  17009E         LBSR 0x16b0                       
  1612  CC718B         LDD #0x718b                       
  1615  837156         SUBD #0x7156                      
  1618  1F02           TFR D,Y                           
  161a  FC709E         LDD 0x709e                        
  161d  AD9FFC82       JSR [0xfc82]                      
  1621  3526           PULS  A B Y                       
  1623  39             RTS                               

; ---- function FUN_M65_small_00000__1624
FUN_M65_small_00000__1624:
  1624  3406           PSHS  B A                         
  1626  FC70A2         LDD 0x70a2                        
  1629  FD6074         STD 0x6074                        
  162c  17F132         LBSR 0x0761                       
  162f  C613           LDB #0x13                         
  1631  AD9FFC36       JSR [0xfc36]                      
  1635  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " r length =      mS  "
  1639  0A72206C656E.. char[22] "\nr length =      mS  " 
LAB_M65_small_00000__164f:
  164f  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0578 $0001 $0000 ->$169B ->$1671 $0001 $0001 $0000
  1653  01             db 1h                             
  1654  01             db 1h                             
  1655  02             db 2h                             
  1656  01             db 1h                             
  1657  01             db 1h                             
  1658  00             db 0h                             
  1659  04             db 4h                             
  165a  80             db 80h                            
  165b  0578           dw 578h                           
  165d  0001           dw 1h                             
  165f  0000           dw 0h                             
  1661  169B           addr M65_small_00000::169b        
  1663  1671           addr M65_small_00000::1671        
  1665  0001           dw 1h                             
  1667  0001           dw 1h                             
  1669  0000           dw 0h                             
LAB_M65_small_00000__166b:
  166b  17002D         LBSR 0x169b                       
  166e  3506           PULS  A B                         
  1670  39             RTS                               

; ---- function FUN_M65_small_00000__1671
FUN_M65_small_00000__1671:
  1671  3426           PSHS  Y B A                       
  1673  FC6074         LDD 0x6074                        
  1676  B370A0         SUBD 0x70a0                       
  1679  FD709E         STD 0x709e                        
  167c  CC718B         LDD #0x718b                       
  167f  837156         SUBD #0x7156                      
  1682  1F02           TFR D,Y                           
  1684  FC709E         LDD 0x709e                        
  1687  AD9FFC82       JSR [0xfc82]                      
  168b  108E0007       LDY #0x7                          
  168f  FC709E         LDD 0x709e                        
  1692  AD9FFE40       JSR [0xfe40]                      
  1696  8D18           BSR 0x16b0                        
  1698  3526           PULS  A B Y                       
  169a  39             RTS                               

; ---- function FUN_M65_small_00000__169b
FUN_M65_small_00000__169b:
  169b  3416           PSHS  X B A                       
  169d  C61F           LDB #0x1f                         
  169f  AD9FFC36       JSR [0xfc36]                      
  16a3  CC0004         LDD #0x4                          
  16a6  8E609F         LDX #0x609f                       
  16a9  AD9FFC3A       JSR [0xfc3a]                      
  16ad  3516           PULS  A B X                       
  16af  39             RTS                               

; ---- function FUN_M65_small_00000__16b0
FUN_M65_small_00000__16b0:
  16b0  3476           PSHS  U Y X B A                   
  16b2  CC0001         LDD #0x1                          
  16b5  3606           PSHU  B A                         
  16b7  CC0578         LDD #0x578                        
  16ba  3606           PSHU  B A                         
  16bc  FC709E         LDD 0x709e                        
  16bf  F370A0         ADDD 0x70a0                       
  16c2  3606           PSHU  B A                         
  16c4  AD9FFCD8       JSR [0xfcd8]                      
  16c8  3706           PULU  A B                         
  16ca  FD70A2         STD 0x70a2                        
  16cd  FC70A2         LDD 0x70a2                        
  16d0  3606           PSHU  B A                         
  16d2  CC002C         LDD #0x2c                         
  16d5  3606           PSHU  B A                         
  16d7  AD9FFCEE       JSR [0xfcee]                      
  16db  3706           PULU  A B                         
  16dd  FD70DE         STD 0x70de                        
  16e0  AD9FFD44       JSR [0xfd44]                      
  16e4  CC7FFF         LDD #0x7fff                       
  16e7  3606           PSHU  B A                         
  16e9  FC70DE         LDD 0x70de                        
  16ec  2C08           BGE 0x16f6                        
  16ee  3606           PSHU  B A                         
  16f0  AD9FFCC8       JSR [0xfcc8]                      
  16f4  3706           PULU  A B                         
LAB_M65_small_00000__16f6:
  16f6  44             LSRA                              
  16f7  56             RORB                              
  16f8  44             LSRA                              
  16f9  56             RORB                              
  16fa  44             LSRA                              
  16fb  56             RORB                              
  16fc  3606           PSHU  B A                         
  16fe  AD9FFCEA       JSR [0xfcea]                      
  1702  CCFFFF         LDD #0xffff                       
  1705  A3C4           SUBD ,U                           
  1707  FD70DE         STD 0x70de                        
  170a  CC000A         LDD #0xa                          
  170d  AD9FFD20       JSR [0xfd20]                      
  1711  108E0242       LDY #0x242                        
  1715  FC70DE         LDD 0x70de                        
  1718  AD9FFD2E       JSR [0xfd2e]                      

; ---- function FUN_M65_small_00000__171c
FUN_M65_small_00000__171c:
  171c  3576           PULS  A B X Y U                   
  171e  39             RTS                               

; ---- function FUN_M65_small_00000__171f
FUN_M65_small_00000__171f:
  171f  3426           PSHS  Y B A                       
  1721  AD9FFC8E       JSR [0xfc8e]                      
  1725  FC60F9         LDD 0x60f9                        
  1728  FD7004         STD 0x7004                        
  172b  FD6074         STD 0x6074                        
  172e  1700A3         LBSR 0x17d4                       
  1731  CC7189         LDD #0x7189                       
  1734  837156         SUBD #0x7156                      
  1737  1F02           TFR D,Y                           
  1739  FC7004         LDD 0x7004                        
  173c  AD9FFC80       JSR [0xfc80]                      
  1740  3526           PULS  A B Y                       
  1742  39             RTS                               

; ---- function FUN_M65_small_00000__1743
FUN_M65_small_00000__1743:
  1743  3406           PSHS  B A                         
  1745  FC7004         LDD 0x7004                        
  1748  FD6074         STD 0x6074                        
  174b  17F013         LBSR 0x0761                       
  174e  C613           LDB #0x13                         
  1750  AD9FFC36       JSR [0xfc36]                      
  1754  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " major key:          "
  1758  0A6D616A6F72.. char[22] "\nmajor key:          " 
LAB_M65_small_00000__176e:
  176e  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $000B $0000 $0000 ->$17B9 ->$1790 $0001 $0001 $0000
  1772  01             db 1h                             
  1773  01             db 1h                             
  1774  02             db 2h                             
  1775  01             db 1h                             
  1776  01             db 1h                             
  1777  00             db 0h                             
  1778  02             db 2h                             
  1779  80             db 80h                            
  177a  000B           dw Bh                             
  177c  0000           dw 0h                             
  177e  0000           dw 0h                             
  1780  17B9           addr M65_small_00000::17b9        
  1782  1790           addr M65_small_00000::1790        
  1784  0001           dw 1h                             
  1786  0001           dw 1h                             
  1788  0000           dw 0h                             
LAB_M65_small_00000__178a:
  178a  17002C         LBSR 0x17b9                       
  178d  3506           PULS  A B                         
  178f  39             RTS                               

; ---- function FUN_M65_small_00000__1790
FUN_M65_small_00000__1790:
  1790  3426           PSHS  Y B A                       
  1792  FC6074         LDD 0x6074                        
  1795  FD7004         STD 0x7004                        
  1798  CC7189         LDD #0x7189                       
  179b  837156         SUBD #0x7156                      
  179e  1F02           TFR D,Y                           
  17a0  FC7004         LDD 0x7004                        
  17a3  AD9FFC80       JSR [0xfc80]                      
  17a7  108E0004       LDY #0x4                          
  17ab  FC7004         LDD 0x7004                        
  17ae  AD9FFE40       JSR [0xfe40]                      
  17b2  8D05           BSR 0x17b9                        
  17b4  8D1E           BSR 0x17d4                        
  17b6  3526           PULS  A B Y                       
  17b8  39             RTS                               

; ---- function FUN_M65_small_00000__17b9
FUN_M65_small_00000__17b9:
  17b9  C61F           LDB #0x1f                         
  17bb  AD9FFC36       JSR [0xfc36]                      
  17bf  FC7004         LDD 0x7004                        
  17c2  8602           LDA #0x2                          
  17c4  3D             MUL                               
  17c5  C317D9         ADDD #0x17d9                      
  17c8  F3600D         ADDD 0x600d                       
  17cb  1F01           TFR D,X                           
  17cd  C602           LDB #0x2                          
  17cf  AD9FFC3A       JSR [0xfc3a]                      
  17d3  39             RTS                               

; ---- function FUN_M65_small_00000__17d4
FUN_M65_small_00000__17d4:
  17d4  3416           PSHS  X B A                       
  17d6  3516           PULS  A B X                       
  17d8  39             RTS                               
  17d9  .db 43 20 43 23 44 20 45 62 45 20 46 20 46 23 47 20  ; C C#D EbE F F#G 
  17e9  .db 41 62 41 20 42 62 42 20                          ; AbA BbB 

; ---- function FUN_M65_small_00000__17f1
FUN_M65_small_00000__17f1:
  17f1  3406           PSHS  B A                         
  17f3  FC7008         LDD 0x7008                        
  17f6  FD6074         STD 0x6074                        
  17f9  17EF65         LBSR 0x0761                       
  17fc  C613           LDB #0x13                         
  17fe  AD9FFC36       JSR [0xfc36]                      
  1802  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " note    :      cents"
  1806  0A6E6F746520.. char[22] "\nnote    :      cents" 
LAB_M65_small_00000__181c:
  181c  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0016 $0000 $0000 ->$184D ->$183E $0002 $0002 $0000
  1820  01             db 1h                             
  1821  01             db 1h                             
  1822  02             db 2h                             
  1823  01             db 1h                             
  1824  01             db 1h                             
  1825  00             db 0h                             
  1826  02             db 2h                             
  1827  80             db 80h                            
  1828  0016           dw 16h                            
  182a  0000           dw 0h                             
  182c  0000           dw 0h                             
  182e  184D           addr M65_small_00000::184d        
  1830  183E           addr M65_small_00000::183e        
  1832  0002           dw 2h                             
  1834  0002           dw 2h                             
  1836  0000           dw 0h                             
LAB_M65_small_00000__1838:
  1838  170012         LBSR 0x184d                       
  183b  3506           PULS  A B                         
  183d  39             RTS                               

; ---- function FUN_M65_small_00000__183e
FUN_M65_small_00000__183e:
  183e  3426           PSHS  Y B A                       
  1840  FC6074         LDD 0x6074                        
  1843  FD7008         STD 0x7008                        
  1846  8D05           BSR 0x184d                        
  1848  8D43           BSR 0x188d                        
  184a  3526           PULS  A B Y                       
  184c  39             RTS                               

; ---- function FUN_M65_small_00000__184d
FUN_M65_small_00000__184d:
  184d  C61A           LDB #0x1a                         
  184f  AD9FFC36       JSR [0xfc36]                      
  1853  FC7008         LDD 0x7008                        
  1856  FD70DE         STD 0x70de                        
  1859  C317D9         ADDD #0x17d9                      
  185c  F3600D         ADDD 0x600d                       
  185f  1F01           TFR D,X                           
  1861  C602           LDB #0x2                          
  1863  AD9FFC3A       JSR [0xfc3a]                      
  1867  FC7008         LDD 0x7008                        
  186a  F37014         ADDD 0x7014                       
  186d  1F01           TFR D,X                           
  186f  EC84           LDD ,X                            
  1871  3606           PSHU  B A                         
  1873  8600           LDA #0x0                          
  1875  108E70FA       LDY #0x70fa                       
  1879  AD9FFC40       JSR [0xfc40]                      
  187d  C61D           LDB #0x1d                         
  187f  AD9FFC36       JSR [0xfc36]                      
  1883  C605           LDB #0x5                          
  1885  8E70FE         LDX #0x70fe                       
  1888  AD9FFC3A       JSR [0xfc3a]                      
  188c  39             RTS                               

; ---- function FUN_M65_small_00000__188d
FUN_M65_small_00000__188d:
  188d  39             RTS                               

; ---- function FUN_M65_small_00000__188e
FUN_M65_small_00000__188e:
  188e  3436           PSHS  Y X B A                     
  1890  AD9FFC8E       JSR [0xfc8e]                      
  1894  FC6103         LDD 0x6103                        
  1897  83000B         SUBD #0xb                         
  189a  58             LSLB                              
  189b  49             ROLA                              
  189c  10830018       CMPD #0x18                        
  18a0  2C0B           BGE 0x18ad                        
  18a2  FD7008         STD 0x7008                        
  18a5  CC7016         LDD #0x7016                       
  18a8  FD7014         STD 0x7014                        
  18ab  200C           BRA 0x18b9                        
LAB_M65_small_00000__18ad:
  18ad  830018         SUBD #0x18                        
  18b0  FD7008         STD 0x7008                        
  18b3  CC7016         LDD #0x7016                       
  18b6  FD7014         STD 0x7014                        
LAB_M65_small_00000__18b9:
  18b9  FC60F9         LDD 0x60f9                        
  18bc  FD6074         STD 0x6074                        
  18bf  170053         LBSR 0x1915                       
  18c2  3536           PULS  A B X Y                     
  18c4  39             RTS                               

; ---- function FUN_M65_small_00000__18c5
FUN_M65_small_00000__18c5:
  18c5  3406           PSHS  B A                         
  18c7  FC700E         LDD 0x700e                        
  18ca  FD6074         STD 0x6074                        
  18cd  17EE91         LBSR 0x0761                       
  18d0  C613           LDB #0x13                         
  18d2  AD9FFC36       JSR [0xfc36]                      
  18d6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " note    :      cents"
  18da  0A6E6F746520.. char[22] "\nnote    :      cents" 
LAB_M65_small_00000__18f0:
  18f0  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 05 80 $04B0 $F6A0 $0000 ->$195A ->$1915 $0064 $0064 $0000
  18f4  01             db 1h                             
  18f5  01             db 1h                             
  18f6  02             db 2h                             
  18f7  01             db 1h                             
  18f8  01             db 1h                             
  18f9  00             db 0h                             
  18fa  05             db 5h                             
  18fb  80             db 80h                            
  18fc  04B0           dw 4B0h                           
  18fe  F6A0           dw F6A0h                          
  1900  0000           dw 0h                             
  1902  195A           addr M65_small_00000::195a        
  1904  1915           addr M65_small_00000::1915        
  1906  0064           dw 64h                            
  1908  0064           dw 64h                            
  190a  0000           dw 0h                             
LAB_M65_small_00000__190c:
  190c  17004B         LBSR 0x195a                       
  190f  17FF3B         LBSR 0x184d                       
  1912  3506           PULS  A B                         
  1914  39             RTS                               

; ---- function FUN_M65_small_00000__1915
FUN_M65_small_00000__1915:
  1915  3436           PSHS  Y X B A                     
  1917  FC6074         LDD 0x6074                        
  191a  FD700E         STD 0x700e                        
  191d  FC7008         LDD 0x7008                        
  1920  F37014         ADDD 0x7014                       
  1923  1F01           TFR D,X                           
  1925  FC6074         LDD 0x6074                        
  1928  ED84           STD ,X                            
  192a  1F10           TFR X,D                           
  192c  837016         SUBD #0x7016                      
  192f  C371B1         ADDD #0x71b1                      
  1932  837156         SUBD #0x7156                      
  1935  1F02           TFR D,Y                           
  1937  EC84           LDD ,X                            
  1939  AD9FFC82       JSR [0xfc82]                      
  193d  FC7008         LDD 0x7008                        
  1940  F37014         ADDD 0x7014                       
  1943  837016         SUBD #0x7016                      
  1946  47             ASRA                              
  1947  56             RORB                              
  1948  C3000B         ADDD #0xb                         
  194b  1F02           TFR D,Y                           
  194d  EC84           LDD ,X                            
  194f  AD9FFE40       JSR [0xfe40]                      
  1953  8D05           BSR 0x195a                        
  1955  8D18           BSR 0x196f                        
  1957  3536           PULS  A B X Y                     
  1959  39             RTS                               

; ---- function FUN_M65_small_00000__195a
FUN_M65_small_00000__195a:
  195a  3416           PSHS  X B A                       
  195c  C61D           LDB #0x1d                         
  195e  AD9FFC36       JSR [0xfc36]                      
  1962  CC0005         LDD #0x5                          
  1965  8E609E         LDX #0x609e                       
  1968  AD9FFC3A       JSR [0xfc3a]                      
  196c  3516           PULS  A B X                       
  196e  39             RTS                               

; ---- function FUN_M65_small_00000__196f
FUN_M65_small_00000__196f:
  196f  39             RTS                               

; ---- function FUN_M65_small_00000__1970
FUN_M65_small_00000__1970:
  1970  3426           PSHS  Y B A                       
  1972  AD9FFC8E       JSR [0xfc8e]                      
  1976  FC60F9         LDD 0x60f9                        
  1979  FD7000         STD 0x7000                        
  197c  FD6074         STD 0x6074                        
  197f  1700A3         LBSR 0x1a25                       
  1982  CC7187         LDD #0x7187                       
  1985  837156         SUBD #0x7156                      
  1988  1F02           TFR D,Y                           
  198a  FC7000         LDD 0x7000                        
  198d  AD9FFC80       JSR [0xfc80]                      
  1991  3526           PULS  A B Y                       
  1993  39             RTS                               

; ---- function FUN_M65_small_00000__1994
FUN_M65_small_00000__1994:
  1994  3406           PSHS  B A                         
  1996  FC7000         LDD 0x7000                        
  1999  FD6074         STD 0x6074                        
  199c  17EDC2         LBSR 0x0761                       
  199f  C613           LDB #0x13                         
  19a1  AD9FFC36       JSR [0xfc36]                      
  19a5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l voice:            "
  19a9  0A6C20766F69.. char[22] "\nl voice:            " 
LAB_M65_small_00000__19bf:
  19bf  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1A0A ->$19E1 $0001 $0001 $0000
  19c3  01             db 1h                             
  19c4  01             db 1h                             
  19c5  02             db 2h                             
  19c6  01             db 1h                             
  19c7  01             db 1h                             
  19c8  00             db 0h                             
  19c9  02             db 2h                             
  19ca  80             db 80h                            
  19cb  0014           dw 14h                            
  19cd  0000           dw 0h                             
  19cf  0000           dw 0h                             
  19d1  1A0A           addr M65_small_00000::1a0a        
  19d3  19E1           addr M65_small_00000::19e1        
  19d5  0001           dw 1h                             
  19d7  0001           dw 1h                             
  19d9  0000           dw 0h                             
LAB_M65_small_00000__19db:
  19db  17002C         LBSR 0x1a0a                       
  19de  3506           PULS  A B                         
  19e0  39             RTS                               

; ---- function FUN_M65_small_00000__19e1
FUN_M65_small_00000__19e1:
  19e1  3426           PSHS  Y B A                       
  19e3  FC6074         LDD 0x6074                        
  19e6  FD7000         STD 0x7000                        
  19e9  CC7187         LDD #0x7187                       
  19ec  837156         SUBD #0x7156                      
  19ef  1F02           TFR D,Y                           
  19f1  FC7000         LDD 0x7000                        
  19f4  AD9FFC80       JSR [0xfc80]                      
  19f8  108E0005       LDY #0x5                          
  19fc  FC7000         LDD 0x7000                        
  19ff  AD9FFE40       JSR [0xfe40]                      
  1a03  8D05           BSR 0x1a0a                        
  1a05  8D1E           BSR 0x1a25                        
  1a07  3526           PULS  A B Y                       
  1a09  39             RTS                               

; ---- function FUN_M65_small_00000__1a0a
FUN_M65_small_00000__1a0a:
  1a0a  C61C           LDB #0x1c                         
  1a0c  AD9FFC36       JSR [0xfc36]                      
  1a10  FC7000         LDD 0x7000                        
  1a13  860A           LDA #0xa                          
  1a15  3D             MUL                               
  1a16  C31B6F         ADDD #0x1b6f                      
  1a19  F3600D         ADDD 0x600d                       
  1a1c  1F01           TFR D,X                           
  1a1e  C60A           LDB #0xa                          
  1a20  AD9FFC3A       JSR [0xfc3a]                      
  1a24  39             RTS                               

; ---- function FUN_M65_small_00000__1a25
FUN_M65_small_00000__1a25:
  1a25  3416           PSHS  X B A                       
  1a27  FC7000         LDD 0x7000                        
  1a2a  10830012       CMPD #0x12                        
  1a2e  2F16           BLE 0x1a46                        
  1a30  10830014       CMPD #0x14                        
  1a34  2708           BEQ 0x1a3e                        
  1a36  CC7016         LDD #0x7016                       
  1a39  FD70D8         STD 0x70d8                        
  1a3c  201A           BRA 0x1a58                        
LAB_M65_small_00000__1a3e:
  1a3e  CC702E         LDD #0x702e                       
  1a41  FD70D8         STD 0x70d8                        
  1a44  2012           BRA 0x1a58                        
LAB_M65_small_00000__1a46:
  1a46  58             LSLB                              
  1a47  49             ROLA                              
  1a48  C31B49         ADDD #0x1b49                      
  1a4b  F3600D         ADDD 0x600d                       
  1a4e  1F01           TFR D,X                           
  1a50  EC84           LDD ,X                            
  1a52  F3600D         ADDD 0x600d                       
  1a55  FD70D8         STD 0x70d8                        
LAB_M65_small_00000__1a58:
  1a58  3516           PULS  A B X                       
  1a5a  39             RTS                               

; ---- function FUN_M65_small_00000__1a5b
FUN_M65_small_00000__1a5b:
  1a5b  3426           PSHS  Y B A                       
  1a5d  AD9FFC8E       JSR [0xfc8e]                      
  1a61  FC60F9         LDD 0x60f9                        
  1a64  FD7002         STD 0x7002                        
  1a67  FD6074         STD 0x6074                        
  1a6a  1700A3         LBSR 0x1b10                       
  1a6d  CC7188         LDD #0x7188                       
  1a70  837156         SUBD #0x7156                      
  1a73  1F02           TFR D,Y                           
  1a75  FC7002         LDD 0x7002                        
  1a78  AD9FFC80       JSR [0xfc80]                      
  1a7c  3526           PULS  A B Y                       
  1a7e  39             RTS                               

; ---- function FUN_M65_small_00000__1a7f
FUN_M65_small_00000__1a7f:
  1a7f  3406           PSHS  B A                         
  1a81  FC7002         LDD 0x7002                        
  1a84  FD6074         STD 0x6074                        
  1a87  17ECD7         LBSR 0x0761                       
  1a8a  C613           LDB #0x13                         
  1a8c  AD9FFC36       JSR [0xfc36]                      
  1a90  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " r voice:            "
  1a94  0A7220766F69.. char[22] "\nr voice:            " 
LAB_M65_small_00000__1aaa:
  1aaa  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0014 $0000 $0000 ->$1AF5 ->$1ACC $0001 $0001 $0000
  1aae  01             db 1h                             
  1aaf  01             db 1h                             
  1ab0  02             db 2h                             
  1ab1  01             db 1h                             
  1ab2  01             db 1h                             
  1ab3  00             db 0h                             
  1ab4  02             db 2h                             
  1ab5  80             db 80h                            
  1ab6  0014           dw 14h                            
  1ab8  0000           dw 0h                             
  1aba  0000           dw 0h                             
  1abc  1AF5           addr M65_small_00000::1af5        
  1abe  1ACC           addr M65_small_00000::1acc        
  1ac0  0001           dw 1h                             
  1ac2  0001           dw 1h                             
  1ac4  0000           dw 0h                             
LAB_M65_small_00000__1ac6:
  1ac6  17002C         LBSR 0x1af5                       
  1ac9  3506           PULS  A B                         
  1acb  39             RTS                               

; ---- function FUN_M65_small_00000__1acc
FUN_M65_small_00000__1acc:
  1acc  3426           PSHS  Y B A                       
  1ace  FC6074         LDD 0x6074                        
  1ad1  FD7002         STD 0x7002                        
  1ad4  CC7188         LDD #0x7188                       
  1ad7  837156         SUBD #0x7156                      
  1ada  1F02           TFR D,Y                           
  1adc  FC7002         LDD 0x7002                        
  1adf  AD9FFC80       JSR [0xfc80]                      
  1ae3  108E0006       LDY #0x6                          
  1ae7  FC7002         LDD 0x7002                        
  1aea  AD9FFE40       JSR [0xfe40]                      
  1aee  8D05           BSR 0x1af5                        
  1af0  8D1E           BSR 0x1b10                        
  1af2  3526           PULS  A B Y                       
  1af4  39             RTS                               

; ---- function FUN_M65_small_00000__1af5
FUN_M65_small_00000__1af5:
  1af5  C61C           LDB #0x1c                         
  1af7  AD9FFC36       JSR [0xfc36]                      
  1afb  FC7002         LDD 0x7002                        
  1afe  860A           LDA #0xa                          
  1b00  3D             MUL                               
  1b01  C31B6F         ADDD #0x1b6f                      
  1b04  F3600D         ADDD 0x600d                       
  1b07  1F01           TFR D,X                           
  1b09  C60A           LDB #0xa                          
  1b0b  AD9FFC3A       JSR [0xfc3a]                      
  1b0f  39             RTS                               

; ---- function FUN_M65_small_00000__1b10
FUN_M65_small_00000__1b10:
  1b10  3416           PSHS  X B A                       
  1b12  FC7002         LDD 0x7002                        
  1b15  10830012       CMPD #0x12                        
  1b19  2F16           BLE 0x1b31                        
  1b1b  10830014       CMPD #0x14                        
  1b1f  2708           BEQ 0x1b29                        
  1b21  CC7016         LDD #0x7016                       
  1b24  FD70DA         STD 0x70da                        
  1b27  201D           BRA 0x1b46                        
LAB_M65_small_00000__1b29:
  1b29  CC702E         LDD #0x702e                       
  1b2c  FD70DA         STD 0x70da                        
  1b2f  2015           BRA 0x1b46                        
LAB_M65_small_00000__1b31:
  1b31  FC7002         LDD 0x7002                        
  1b34  58             LSLB                              
  1b35  49             ROLA                              
  1b36  C31B49         ADDD #0x1b49                      
  1b39  F3600D         ADDD 0x600d                       
  1b3c  1F01           TFR D,X                           
  1b3e  EC84           LDD ,X                            
  1b40  F3600D         ADDD 0x600d                       
  1b43  FD70DA         STD 0x70da                        
LAB_M65_small_00000__1b46:
  1b46  3516           PULS  A B X                       
  1b48  39             RTS                               
  1b49  .db 21 1F 21 07 20 EF 20 D7 20 BF 20 A7 20 8F 1F CF  ; !.!. . . . . ...
  1b59  .db 1F E7 1F FF 20 17 20 2F 20 47 20 5F 20 77 21 37  ; .... . / G _ w!7
  1b69  .db 21 4F 21 67 21 7F 20 2D 6F 63 74 61 76 65 20 20  ; !O!g!. -octave  
  1b79  .db 20 2D 73 65 76 65 6E 74 68 20 20 2D 73 69 78 74  ;  -seventh  -sixt
  1b89  .db 68 20 20 20 20 2D 66 69 66 74 68 20 20 20 20 2D  ; h    -fifth    -
  1b99  .db 66 6F 75 72 74 68 20 20 20 2D 74 68 69 72 64 20  ; fourth   -third 
  1ba9  .db 20 20 20 2D 73 65 63 6F 6E 64 20 20 20 75 6E 69  ;    -second   uni
  1bb9  .db 73 6F 6E 20 20 20 20 2B 73 65 63 6F 6E 64 20 20  ; son    +second  
  1bc9  .db 20 2B 74 68 69 72 64 20 20 20 20 2B 66 6F 75 72  ;  +third    +four
  1bd9  .db 74 68 20 20 20 2B 66 69 66 74 68 20 20 20 20 2B  ; th   +fifth    +
  1be9  .db 73 69 78 74 68 20 20 20 20 2B 73 65 76 65 6E 74  ; sixth    +sevent
  1bf9  .db 68 20 20 2B 6F 63 74 61 76 65 20 20 6C 6F 20 74  ; h  +octave  lo t
  1c09  .db 6F 6E 20 70 65 64 6C 6F 20 64 6F 6D 20 70 65 64  ; on pedlo dom ped
  1c19  .db 68 69 20 74 6F 6E 20 70 65 64 68 69 20 64 6F 6D  ; hi ton pedhi dom
  1c29  .db 20 70 65 64 75 73 65 72 73 63 61 6C 65 31 75 73  ;  peduserscale1us
  1c39  .db 65 72 73 63 61 6C 65 32                          ; erscale2

; ---- function FUN_M65_small_00000__1c41
FUN_M65_small_00000__1c41:
  1c41  3436           PSHS  Y X B A                     
  1c43  CC0000         LDD #0x0                          
  1c46  FD70DC         STD 0x70dc                        
  1c49  C600           LDB #0x0                          
  1c4b  AD9FFC36       JSR [0xfc36]                      
  1c4f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "Play note - enter retunes:         cents"
  1c53  506C6179206E.. char[41] "Play note - enter retunes:         cents"
LAB_M65_small_00000__1c7c:
  1c7c  CC1DE3         LDD #0x1de3                       
  1c7f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1c83  600F           addr 600f                         
LAB_M65_small_00000__1c85:
  1c85  CC0B62         LDD #0xb62                        
  1c88  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1c8c  6072           addr 6072                         
LAB_M65_small_00000__1c8e:
  1c8e  CC0B62         LDD #0xb62                        
  1c91  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1c95  6070           addr 6070                         
LAB_M65_small_00000__1c97:
  1c97  CC1CA3         LDD #0x1ca3                       
  1c9a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1c9e  6038           addr 6038                         
LAB_M65_small_00000__1ca0:
  1ca0  3536           PULS  A B X Y                     
  1ca2  39             RTS                               

; ---- function FUN_M65_small_00000__1ca3
FUN_M65_small_00000__1ca3:
  1ca3  170069         LBSR 0x1d0f                       
  1ca6  170010         LBSR 0x1cb9                       
  1ca9  CC71AF         LDD #0x71af                       
  1cac  837156         SUBD #0x7156                      
  1caf  1F02           TFR D,Y                           
  1cb1  FC7006         LDD 0x7006                        
  1cb4  AD9FFC82       JSR [0xfc82]                      
  1cb8  39             RTS                               

; ---- function FUN_M65_small_00000__1cb9
FUN_M65_small_00000__1cb9:
  1cb9  3416           PSHS  X B A                       
  1cbb  C600           LDB #0x0                          
  1cbd  AD9FFC36       JSR [0xfc36]                      
  1cc1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "You are now tuned     cents from A440   "
  1cc5  596F75206172.. char[41] "You are now tuned     cents from A440   "
LAB_M65_small_00000__1cee:
  1cee  C612           LDB #0x12                         
  1cf0  AD9FFC36       JSR [0xfc36]                      
  1cf4  FC70F8         LDD 0x70f8                        
  1cf7  3606           PSHU  B A                         
  1cf9  8600           LDA #0x0                          
  1cfb  108E70FA       LDY #0x70fa                       
  1cff  AD9FFC40       JSR [0xfc40]                      
  1d03  C603           LDB #0x3                          
  1d05  8E7100         LDX #0x7100                       
  1d08  AD9FFC3A       JSR [0xfc3a]                      
  1d0c  3516           PULS  A B X                       
  1d0e  39             RTS                               

; ---- function FUN_M65_small_00000__1d0f
FUN_M65_small_00000__1d0f:
  1d0f  3476           PSHS  U Y X B A                   
  1d11  CC1E3D         LDD #0x1e3d                       
  1d14  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1d18  600F           addr 600f                         
LAB_M65_small_00000__1d1a:
  1d1a  CC0B62         LDD #0xb62                        
  1d1d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1d21  6072           addr 6072                         
LAB_M65_small_00000__1d23:
  1d23  CC0B62         LDD #0xb62                        
  1d26  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1d2a  6070           addr 6070                         
LAB_M65_small_00000__1d2c:
  1d2c  CC0B62         LDD #0xb62                        
  1d2f  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1d33  6038           addr 6038                         
LAB_M65_small_00000__1d35:
  1d35  FC70F8         LDD 0x70f8                        
  1d38  C30032         ADDD #0x32                        
  1d3b  3606           PSHU  B A                         
  1d3d  CC0005         LDD #0x5                          
  1d40  3606           PSHU  B A                         
  1d42  AD9FFCEA       JSR [0xfcea]                      
  1d46  3706           PULU  A B                         
  1d48  58             LSLB                              
  1d49  49             ROLA                              
  1d4a  C31D60         ADDD #0x1d60                      
  1d4d  F3600D         ADDD 0x600d                       
  1d50  1F01           TFR D,X                           
  1d52  EC84           LDD ,X                            
  1d54  FD7006         STD 0x7006                        
  1d57  CCFFFF         LDD #0xffff                       
  1d5a  FD70DC         STD 0x70dc                        
  1d5d  3576           PULS  A B X Y U                   
  1d5f  39             RTS                               

; ---- function FUN_M65_small_00000__1d60
FUN_M65_small_00000__1d60:
  1d60  FC40FC         LDD 0x40fc                        
  1d63  A1FD02FD       CMPA [0x2064,PCR]                 
  1d67  63FDC3FE       COM [-0x1e97,PCR]                 
LAB_M65_small_00000__1d6b:
  1d6b  23FE           BLS 0x1d6b                        
  1d6d  83FEE3         SUBD #0xfee3                      
  1d70  FF42FF         STU 0x42ff                        
  1d73  A100           CMPA 0x0,X                        
  1d75  0000           NEG <0x0                          
  1d77  5F             CLRB                              
  1d78  00BE           NEG <0xbe                         
  1d7a  .db 01 1D 01 7D 01 DD 02 3D 02 9D 02 FE 03 5F 03 C0  ; ...}...=....._..

; ---- function FUN_M65_small_00000__1d8a
FUN_M65_small_00000__1d8a:
  1d8a  17E9D4         LBSR 0x0761                       
  1d8d  C613           LDB #0x13                         
  1d8f  AD9FFC36       JSR [0xfc36]                      
  1d93  CCFFFF         LDD #0xffff                       
  1d96  FD70DC         STD 0x70dc                        
  1d99  CC0B62         LDD #0xb62                        
  1d9c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1da0  6038           addr 6038                         
LAB_M65_small_00000__1da2:
  1da2  CC1DE3         LDD #0x1de3                       
  1da5  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  1da9  600F           addr 600f                         
LAB_M65_small_00000__1dab:
  1dab  CC0B62         LDD #0xb62                        
  1dae  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1db2  6072           addr 6072                         
LAB_M65_small_00000__1db4:
  1db4  CC0B62         LDD #0xb62                        
  1db7  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1dbb  6070           addr 6070                         
LAB_M65_small_00000__1dbd:
  1dbd  17E9A1         LBSR 0x0761                       
  1dc0  C613           LDB #0x13                         
  1dc2  AD9FFC36       JSR [0xfc36]                      
  1dc6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " pitch:         cents"
  1dca  0A7069746368.. char[22] "\npitch:         cents" 
LAB_M65_small_00000__1de0:
  1de0  8D01           BSR 0x1de3                        
  1de2  39             RTS                               

; ---- function FUN_M65_small_00000__1de3
FUN_M65_small_00000__1de3:
  1de3  3416           PSHS  X B A                       
  1de5  CC0B62         LDD #0xb62                        
  1de8  F3600D         ADDD 0x600d                       
  1deb  10B36072       CMPD 0x6072                       
  1def  2713           BEQ 0x1e04                        
  1df1  CCFFFF         LDD #0xffff                       
  1df4  FD70DC         STD 0x70dc                        
  1df7  CC0B62         LDD #0xb62                        
  1dfa  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6038
  1dfe  6038           addr 6038                         
LAB_M65_small_00000__1e00:
  1e00  8D3B           BSR 0x1e3d                        
  1e02  2004           BRA 0x1e08                        
LAB_M65_small_00000__1e04:
  1e04  8D37           BSR 0x1e3d                        
  1e06  8D03           BSR 0x1e0b                        
LAB_M65_small_00000__1e08:
  1e08  3516           PULS  A B X                       
  1e0a  39             RTS                               

; ---- function FUN_M65_small_00000__1e0b
FUN_M65_small_00000__1e0b:
  1e0b  3476           PSHS  U Y X B A                   
  1e0d  C61F           LDB #0x1f                         
  1e0f  AD9FFC36       JSR [0xfc36]                      
  1e13  FC70F8         LDD 0x70f8                        
  1e16  3606           PSHU  B A                         
  1e18  8600           LDA #0x0                          
  1e1a  108E70FA       LDY #0x70fa                       
  1e1e  AD9FFC40       JSR [0xfc40]                      
  1e22  C603           LDB #0x3                          
  1e24  8E7100         LDX #0x7100                       
  1e27  AD9FFC3A       JSR [0xfc3a]                      
  1e2b  C61B           LDB #0x1b                         
  1e2d  AD9FFC36       JSR [0xfc36]                      
  1e31  C604           LDB #0x4                          
  1e33  BE70D6         LDX 0x70d6                        
  1e36  AD9FFC3A       JSR [0xfc3a]                      
  1e3a  3576           PULS  A B X Y U                   
  1e3c  39             RTS                               

; ---- function FUN_M65_small_00000__1e3d
FUN_M65_small_00000__1e3d:
  1e3d  3476           PSHS  U Y X B A                   
  1e3f  AD9FFD42       JSR [0xfd42]                      
  1e43  FD70CA         STD 0x70ca                        
  1e46  AD9FFD3A       JSR [0xfd3a]                      
  1e4a  FD70CC         STD 0x70cc                        
  1e4d  10B370CA       CMPD 0x70ca                       
  1e51  2F41           BLE 0x1e94                        
  1e53  FC70CA         LDD 0x70ca                        
  1e56  47             ASRA                              
  1e57  56             RORB                              
  1e58  47             ASRA                              
  1e59  56             RORB                              
  1e5a  FD70E4         STD 0x70e4                        
  1e5d  F370CC         ADDD 0x70cc                       
  1e60  3606           PSHU  B A                         
  1e62  FC70CA         LDD 0x70ca                        
  1e65  3606           PSHU  B A                         
  1e67  AD9FFCEA       JSR [0xfcea]                      
  1e6b  3706           PULU  A B                         
  1e6d  FD70E2         STD 0x70e2                        
  1e70  FC70CC         LDD 0x70cc                        
  1e73  3606           PSHU  B A                         
  1e75  CC000A         LDD #0xa                          
  1e78  3606           PSHU  B A                         
  1e7a  AD9FFCEE       JSR [0xfcee]                      
  1e7e  FC70E2         LDD 0x70e2                        
  1e81  3606           PSHU  B A                         
  1e83  AD9FFCEA       JSR [0xfcea]                      
  1e87  3706           PULU  A B                         
  1e89  FD70E2         STD 0x70e2                        
  1e8c  FC70E2         LDD 0x70e2                        
  1e8f  FD70CE         STD 0x70ce                        
  1e92  2013           BRA 0x1ea7                        
LAB_M65_small_00000__1e94:
  1e94  FC70CA         LDD 0x70ca                        
  1e97  3606           PSHU  B A                         
  1e99  CC000A         LDD #0xa                          
  1e9c  3606           PSHU  B A                         
  1e9e  AD9FFCEE       JSR [0xfcee]                      
  1ea2  3706           PULU  A B                         
  1ea4  FD70CE         STD 0x70ce                        
LAB_M65_small_00000__1ea7:
  1ea7  FC70DC         LDD 0x70dc                        
  1eaa  1083FFFF       CMPD #0xffff                      
  1eae  10270008       LBEQ 0x1eba                       
  1eb2  FC70CE         LDD 0x70ce                        
  1eb5  FD70F6         STD 0x70f6                        
  1eb8  2016           BRA 0x1ed0                        
LAB_M65_small_00000__1eba:
  1eba  FC70CE         LDD 0x70ce                        
  1ebd  3606           PSHU  B A                         
  1ebf  FC7006         LDD 0x7006                        
  1ec2  3606           PSHU  B A                         
  1ec4  AD9FFCF2       JSR [0xfcf2]                      
  1ec8  3706           PULU  A B                         
  1eca  F370CE         ADDD 0x70ce                       
  1ecd  FD70F6         STD 0x70f6                        
LAB_M65_small_00000__1ed0:
  1ed0  CC21AF         LDD #0x21af                       
  1ed3  F3600D         ADDD 0x600d                       
  1ed6  1F01           TFR D,X                           
LAB_M65_small_00000__1ed8:
  1ed8  EC81           LDD ,X++                          
  1eda  10B370F6       CMPD 0x70f6                       
  1ede  2D02           BLT 0x1ee2                        
  1ee0  20F6           BRA 0x1ed8                        
LAB_M65_small_00000__1ee2:
  1ee2  301E           LEAX -0x2,X                       
  1ee4  CC0032         LDD #0x32                         
  1ee7  FD70F8         STD 0x70f8                        
  1eea  CCFFFB         LDD #0xfffb                       
  1eed  FD70E0         STD 0x70e0                        
  1ef0  EC84           LDD ,X                            
  1ef2  3606           PSHU  B A                         
  1ef4  FC70F6         LDD 0x70f6                        
  1ef7  A384           SUBD ,X                           
  1ef9  2602           BNE 0x1efd                        
  1efb  204E           BRA 0x1f4b                        
LAB_M65_small_00000__1efd:
  1efd  3606           PSHU  B A                         
  1eff  AD9FFCEA       JSR [0xfcea]                      
  1f03  3706           PULU  A B                         
  1f05  FD70DE         STD 0x70de                        
  1f08  10830022       CMPD #0x22                        
  1f0c  2E22           BGT 0x1f30                        
  1f0e  CCFFCE         LDD #0xffce                       
  1f11  FD70F8         STD 0x70f8                        
  1f14  CC0005         LDD #0x5                          
  1f17  FD70E0         STD 0x70e0                        
  1f1a  EC1E           LDD -0x2,X                        
  1f1c  3606           PSHU  B A                         
  1f1e  B370F6         SUBD 0x70f6                       
  1f21  2602           BNE 0x1f25                        
  1f23  2026           BRA 0x1f4b                        
LAB_M65_small_00000__1f25:
  1f25  3606           PSHU  B A                         
  1f27  AD9FFCEA       JSR [0xfcea]                      
  1f2b  3706           PULU  A B                         
  1f2d  FD70DE         STD 0x70de                        
LAB_M65_small_00000__1f30:
  1f30  CC2197         LDD #0x2197                       
  1f33  F3600D         ADDD 0x600d                       
  1f36  1F02           TFR D,Y                           
LAB_M65_small_00000__1f38:
  1f38  ECA1           LDD ,Y++                          
  1f3a  10B370DE       CMPD 0x70de                       
  1f3e  2D0B           BLT 0x1f4b                        
  1f40  FC70F8         LDD 0x70f8                        
  1f43  F370E0         ADDD 0x70e0                       
  1f46  FD70F8         STD 0x70f8                        
  1f49  20ED           BRA 0x1f38                        
LAB_M65_small_00000__1f4b:
  1f4b  1F10           TFR X,D                           
  1f4d  8321AF         SUBD #0x21af                      
  1f50  B3600D         SUBD 0x600d                       
  1f53  58             LSLB                              
  1f54  49             ROLA                              
  1f55  C33217         ADDD #0x3217                      
  1f58  C30060         ADDD #0x60                        
  1f5b  F3600D         ADDD 0x600d                       
  1f5e  FD70D6         STD 0x70d6                        
  1f61  1F10           TFR X,D                           
  1f63  8321AF         SUBD #0x21af                      
  1f66  B3600D         SUBD 0x600d                       
  1f69  B37004         SUBD 0x7004                       
  1f6c  B37004         SUBD 0x7004                       
  1f6f  C30018         ADDD #0x18                        
  1f72  3606           PSHU  B A                         
  1f74  CC0018         LDD #0x18                         
  1f77  3606           PSHU  B A                         
  1f79  AD9FFCE8       JSR [0xfce8]                      
  1f7d  3706           PULU  A B                         
  1f7f  F370D8         ADDD 0x70d8                       
  1f82  1F02           TFR D,Y                           
  1f84  CC0000         LDD #0x0                          
  1f87  FC70B4         LDD 0x70b4                        
  1f8a  1083FFFF       CMPD #0xffff                      
  1f8e  10270003       LBEQ 0x1f95                       
  1f92  B370F8         SUBD 0x70f8                       
LAB_M65_small_00000__1f95:
  1f95  E3A4           ADDD ,Y                           
  1f97  10B37046       CMPD 0x7046                       
  1f9b  2706           BEQ 0x1fa3                        
  1f9d  FD7046         STD 0x7046                        
  1fa0  17EF61         LBSR 0x0f04                       
LAB_M65_small_00000__1fa3:
  1fa3  1F20           TFR Y,D                           
  1fa5  B370D8         SUBD 0x70d8                       
  1fa8  F370DA         ADDD 0x70da                       
  1fab  1F02           TFR D,Y                           
  1fad  CC0000         LDD #0x0                          
  1fb0  FC70B4         LDD 0x70b4                        
  1fb3  1083FFFF       CMPD #0xffff                      
  1fb7  10270003       LBEQ 0x1fbe                       
  1fbb  B370F8         SUBD 0x70f8                       
LAB_M65_small_00000__1fbe:
  1fbe  E3A4           ADDD ,Y                           
  1fc0  10B3704E       CMPD 0x704e                       
  1fc4  2706           BEQ 0x1fcc                        
  1fc6  FD704E         STD 0x704e                        
  1fc9  17F15A         LBSR 0x1126                       
LAB_M65_small_00000__1fcc:
  1fcc  3576           PULS  A B X Y U                   
  1fce  39             RTS                               
  1fcf  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  1fdf  .db 00 00 00 00 00 00 00 00 00 C8 00 C8 00 C8 00 96  ; ................
  1fef  .db 00 64 00 96 00 C8 00 C8 00 C8 00 C8 00 96 00 64  ; .d.............d
  1fff  .db 01 90 01 5E 01 2C 01 2C 01 2C 01 90 01 90 01 90  ; ...^.,.,.,......
  200f  .db 01 5E 01 2C 01 2C 01 2C 01 F4 01 F4 01 F4 01 F4  ; .^.,.,.,........
  201f  .db 01 F4 02 58 02 26 01 F4 01 F4 01 F4 01 F4 01 F4  ; ...X.&..........
  202f  .db 02 BC 02 BC 02 BC 02 BC 02 BC 02 BC 02 BC 02 BC  ; ................
  203f  .db 02 BC 02 BC 02 8A 02 58 03 84 03 84 03 84 03 52  ; .......X.......R
  204f  .db 03 20 03 84 03 84 03 84 03 52 03 20 03 20 03 20  ; . .......R. . . 
  205f  .db 04 4C 04 1A 03                                   ; .L...
DAT_M65_small_00000__2064:
  2064  E803           undefined2 E803h                  
  2066  .db E8 03 E8 04 4C 04 1A 03 E8 03 E8 03 E8 03 E8 03  ; ....L...........
  2076  .db E8 04 B0 04 B0 04 B0 04 B0 04 B0 04 B0 04 B0 04  ; ................
  2086  .db B0 04 B0 04 B0 04 B0 04 B0 FF 9C FF 6A FF 38 FF  ; ............j.8.
  2096  .db 38 FF 38 FF 9C FF 6A FF 38 FF 38 FF 38 FF 38 FF  ; 8.8...j.8.8.8.8.
  20a6  .db 38 FE D4 FE D4 FE D4 FE A2 FE 70 FE D4 FE D4 FE  ; 8.........p.....
  20b6  .db D4 FE A2 FE 70 FE 70 FE 70 FE 0C FE 0C FE 0C FE  ; ....p.p.p.......
  20c6  .db 0C FE 0C FE 0C FE 0C FE 0C FE 0C FE 0C FD DA FD  ; ................
  20d6  .db A8 FD 44 FD 44 FD 44 FD 44 FD 44 FD A8 FD 76 FD  ; ..D.D.D.D.D...v.
  20e6  .db 44 FD 44 FD 44 FD 44 FD 44 FC E0 FC AE FC 7C FC  ; D.D.D.D.D.....|.
  20f6  .db 7C FC 7C FC E0 FC E0 FC E0 FC AE FC 7C FC 7C FC  ; |.|.........|.|.
  2106  .db 7C FC 18 FC 18 FC 18 FB E6 FB B4 FC 18 FC 18 FC  ; |...............
  2116  .db 18 FC 18 FC 18 FB E6 FB B4 FB 50 FB 50 FB 50 FB  ; ..........P.P.P.
  2126  .db 50 FB 50 FB 50 FB 50 FB 50 FB 50 FB 50 FB 50 FB  ; P.P.P.P.P.P.P.P.
  2136  .db 50 00 05 FF 9C FF 38 FE D4 FE 70 FE 0C FD A8 FD  ; P.....8...p.....
  2146  .db 44 FC E0 FC 7C FC 18 FB B4 FE 0C FD A8 FD 44 FC  ; D...|.........D.
  2156  .db E0 FC 7C FC 18 FB B4 FB 50 FA EC FA 88 FA 24 F9  ; ..|.....P.....$.
  2166  .db C0 04 B0 04 4C 03 E8 03 84 03 20 02 BC 02 58 01  ; ....L..... ...X.
  2176  .db F4 01 90 01 2C 00 C8 00 64 02 BC 02 58 01 F4 01  ; ....,...d...X...
  2186  .db 90 01 2C 00 C8 00 64 00 05 FF 9C FF 38 FE D4 FE  ; ..,...d.....8...
  2196  .db 70                                               ; p
DAT_M65_small_00000__2197:
  2197  02             ?? 02h                            
  2198  .db B4                                               ; .
DAT_M65_small_00000__2199:
  2199  00             ?? 00h                            
  219a  .db E6 00 8A 00 62 00 4C 00 3E 00 35 00 2E 00 28 00  ; ....b.L.>.5...(.
  21aa  .db 24 FF FF 7F FF                                   ; $....
DAT_M65_small_00000__21af:
  21af  33             ?? 33h    3                       
  21b0  .db 2D                                               ; -
DAT_M65_small_00000__21b1:
  21b1  30             ?? 30h    0                       
  21b2  .db 4E 2D 98 2B 09 28 9E 26 57 24 30 22 28 20 3D 1E  ; N-.+.(.&W$0"( =.
  21c2  .db 6E 1C B9 1B 1C 19 97 18 27 16 CC 15 84 14 4F 13  ; n.......'.....O.
  21d2  .db 2B 12 18 11 14 10 1F 0F 37 0E 5C 0D 8E 0C CB 0C  ; +.......7.\.....
  21e2  .db 13 0B 66 0A C2 0A 28 09 96 09 0C 08 8A 08 0F 07  ; ..f...(.........
  21f2  .db 9B 07 2E 06 C7 06 66 06 0A 05 B3 05 61 05 14 04  ; ......f.....a...
  2202  .db CB 04 86 04 45 04 08 03 CE 03 97 03 64 03 33 03  ; ....E.......d.3.
  2212  .db 05 02 D9 02 B1 02 8A 02 65 02 43 02 22 02 04 01  ; ........e.C."...
  2222  .db E7 01 CC 01 B2 01 99 01 82 01 6D 01 58 01 45 01  ; ..........m.X.E.
  2232  .db 33 01 21 01 11 01 02 00 F3 00 E6 00 D9 00 CD 00  ; 3.!.............
  2242  .db C1 00 B6 00 AC 00 A2 00 99 00 91 00 89 00 81 00  ; ................
  2252  .db 7A 00 73 00 6C FF FF                             ; z.s.l..
PTR_FUN_M65_small_00000__231f_M65_small_00000__2259:
  2259  231F           addr M65_small_00000::231f        
  225b  2334           addr M65_small_00000::2334        
  225d  7066           addr 7066                         
  225f  .db 00 3F FF 9C 00 64 00 04                          ; .?...d..

; ---- function FUN_M65_small_00000__2267
FUN_M65_small_00000__2267:
  2267  3410           PSHS  X                           
  2269  8E2259         LDX #0x2259                        ; desc[API_FE1C]: ->$231F ->$2334 $7066
  226c  AD9FFE1C       JSR [0xfe1c]                      
  2270  3510           PULS  X                           
  2272  39             RTS                               

; ---- function FUN_M65_small_00000__2273
FUN_M65_small_00000__2273:
  2273  3410           PSHS  X                           
  2275  8E2259         LDX #0x2259                        ; desc[API_FE1A]: ->$231F ->$2334 $7066
  2278  AD9FFE1A       JSR [0xfe1a]                      
  227c  3510           PULS  X                           
  227e  39             RTS                               

; ---- function FUN_M65_small_00000__227f
FUN_M65_small_00000__227f:
  227f  3426           PSHS  Y B A                       
  2281  AD9FFC8E       JSR [0xfc8e]                      
  2285  FC60F9         LDD 0x60f9                        
  2288  FD6074         STD 0x6074                        
  228b  B37068         SUBD 0x7068                       
  228e  FD7066         STD 0x7066                        
  2291  1700A0         LBSR 0x2334                       
  2294  CC7193         LDD #0x7193                       
  2297  837156         SUBD #0x7156                      
  229a  1F02           TFR D,Y                           
  229c  FC7066         LDD 0x7066                        
  229f  AD9FFC82       JSR [0xfc82]                      
  22a3  3526           PULS  A B Y                       
  22a5  39             RTS                               

; ---- function FUN_M65_small_00000__22a6
FUN_M65_small_00000__22a6:
  22a6  3406           PSHS  B A                         
  22a8  FC706A         LDD 0x706a                        
  22ab  FD6074         STD 0x6074                        
  22ae  17E4B0         LBSR 0x0761                       
  22b1  C613           LDB #0x13                         
  22b3  AD9FFC36       JSR [0xfc36]                      
  22b7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " mix:     % wet      "
  22bb  0A6D69783A20.. char[22] "\nmix:     % wet      " 
LAB_M65_small_00000__22d1:
  22d1  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$231F ->$22F3 $0001 $0001 $0000
  22d5  01             db 1h                             
  22d6  01             db 1h                             
  22d7  02             db 2h                             
  22d8  01             db 1h                             
  22d9  01             db 1h                             
  22da  00             db 0h                             
  22db  03             db 3h                             
  22dc  80             db 80h                            
  22dd  0064           dw 64h                            
  22df  0000           dw 0h                             
  22e1  0000           dw 0h                             
  22e3  231F           addr M65_small_00000::231f        
  22e5  22F3           addr M65_small_00000::22f3        
  22e7  0001           dw 1h                             
  22e9  0001           dw 1h                             
  22eb  0000           dw 0h                             
LAB_M65_small_00000__22ed:
  22ed  17002F         LBSR 0x231f                       
  22f0  3506           PULS  A B                         
  22f2  39             RTS                               

; ---- function FUN_M65_small_00000__22f3
FUN_M65_small_00000__22f3:
  22f3  3426           PSHS  Y B A                       
  22f5  FC6074         LDD 0x6074                        
  22f8  B37068         SUBD 0x7068                       
  22fb  FD7066         STD 0x7066                        
  22fe  CC7193         LDD #0x7193                       
  2301  837156         SUBD #0x7156                      
  2304  1F02           TFR D,Y                           
  2306  FC7066         LDD 0x7066                        
  2309  AD9FFC82       JSR [0xfc82]                      
  230d  8D25           BSR 0x2334                        
  230f  8D0E           BSR 0x231f                        
  2311  108E0000       LDY #0x0                          
  2315  FC7066         LDD 0x7066                        
  2318  AD9FFE40       JSR [0xfe40]                      
  231c  3526           PULS  A B Y                       
  231e  39             RTS                               

; ---- function FUN_M65_small_00000__231f
FUN_M65_small_00000__231f:
  231f  3416           PSHS  X B A                       
  2321  C619           LDB #0x19                         
  2323  AD9FFC36       JSR [0xfc36]                      
  2327  CC0003         LDD #0x3                          
  232a  8E60A0         LDX #0x60a0                       
  232d  AD9FFC3A       JSR [0xfc3a]                      
  2331  3516           PULS  A B X                       
  2333  39             RTS                               

; ---- function FUN_M65_small_00000__2334
FUN_M65_small_00000__2334:
  2334  3476           PSHS  U Y X B A                   
  2336  CC0000         LDD #0x0                          
  2339  3606           PSHU  B A                         
  233b  CC0064         LDD #0x64                         
  233e  3606           PSHU  B A                         
  2340  FC7066         LDD 0x7066                        
  2343  F37068         ADDD 0x7068                       
  2346  3606           PSHU  B A                         
  2348  AD9FFCD8       JSR [0xfcd8]                      
  234c  3706           PULU  A B                         
  234e  FD706A         STD 0x706a                        
  2351  CC0064         LDD #0x64                         
  2354  B3706A         SUBD 0x706a                       
  2357  3606           PSHU  B A                         
  2359  58             LSLB                              
  235a  49             ROLA                              
  235b  FD70DE         STD 0x70de                        
  235e  CC4666         LDD #0x4666                       
  2361  3606           PSHU  B A                         
  2363  AD9FFCF2       JSR [0xfcf2]                      
  2367  3706           PULU  A B                         
  2369  F370DE         ADDD 0x70de                       
  236c  AD9FFC6A       JSR [0xfc6a]                      
  2370  AD9FFC72       JSR [0xfc72]                      
  2374  3576           PULS  A B X Y U                   
  2376  39             RTS                               
PTR_FUN_M65_small_00000__243d_M65_small_00000__2377:
  2377  243D           addr M65_small_00000::243d        
  2379  2452           addr M65_small_00000::2452        
  237b  706E           addr 706e                         
  237d  .db 00 53 FF 9C 00 64 00 04                          ; .S...d..

; ---- function FUN_M65_small_00000__2385
FUN_M65_small_00000__2385:
  2385  3410           PSHS  X                           
  2387  8E2377         LDX #0x2377                        ; desc[API_FE1C]: ->$243D ->$2452 $706E
  238a  AD9FFE1C       JSR [0xfe1c]                      
  238e  3510           PULS  X                           
  2390  39             RTS                               

; ---- function FUN_M65_small_00000__2391
FUN_M65_small_00000__2391:
  2391  3410           PSHS  X                           
  2393  8E2377         LDX #0x2377                        ; desc[API_FE1A]: ->$243D ->$2452 $706E
  2396  AD9FFE1A       JSR [0xfe1a]                      
  239a  3510           PULS  X                           
  239c  39             RTS                               

; ---- function FUN_M65_small_00000__239d
FUN_M65_small_00000__239d:
  239d  3426           PSHS  Y B A                       
  239f  AD9FFC8E       JSR [0xfc8e]                      
  23a3  FC60F9         LDD 0x60f9                        
  23a6  FD6074         STD 0x6074                        
  23a9  B37070         SUBD 0x7070                       
  23ac  FD706E         STD 0x706e                        
  23af  1700A0         LBSR 0x2452                       
  23b2  CC71A7         LDD #0x71a7                       
  23b5  837156         SUBD #0x7156                      
  23b8  1F02           TFR D,Y                           
  23ba  FC706E         LDD 0x706e                        
  23bd  AD9FFC82       JSR [0xfc82]                      
  23c1  3526           PULS  A B Y                       
  23c3  39             RTS                               

; ---- function FUN_M65_small_00000__23c4
FUN_M65_small_00000__23c4:
  23c4  3406           PSHS  B A                         
  23c6  FC7072         LDD 0x7072                        
  23c9  FD6074         STD 0x6074                        
  23cc  17E392         LBSR 0x0761                       
  23cf  C613           LDB #0x13                         
  23d1  AD9FFC36       JSR [0xfc36]                      
  23d5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left mix:     % wet "
  23d9  0A6C65667420.. char[22] "\nleft mix:     % wet " 
LAB_M65_small_00000__23ef:
  23ef  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$243D ->$2411 $0001 $0001 $0000
  23f3  01             db 1h                             
  23f4  01             db 1h                             
  23f5  02             db 2h                             
  23f6  01             db 1h                             
  23f7  01             db 1h                             
  23f8  00             db 0h                             
  23f9  03             db 3h                             
  23fa  80             db 80h                            
  23fb  0064           dw 64h                            
  23fd  0000           dw 0h                             
  23ff  0000           dw 0h                             
  2401  243D           addr M65_small_00000::243d        
  2403  2411           addr M65_small_00000::2411        
  2405  0001           dw 1h                             
  2407  0001           dw 1h                             
  2409  0000           dw 0h                             
LAB_M65_small_00000__240b:
  240b  17002F         LBSR 0x243d                       
  240e  3506           PULS  A B                         
  2410  39             RTS                               

; ---- function FUN_M65_small_00000__2411
FUN_M65_small_00000__2411:
  2411  3426           PSHS  Y B A                       
  2413  FC6074         LDD 0x6074                        
  2416  B37070         SUBD 0x7070                       
  2419  FD706E         STD 0x706e                        
  241c  CC71A7         LDD #0x71a7                       
  241f  837156         SUBD #0x7156                      
  2422  1F02           TFR D,Y                           
  2424  FC706E         LDD 0x706e                        
  2427  AD9FFC82       JSR [0xfc82]                      
  242b  108E0000       LDY #0x0                          
  242f  FC706E         LDD 0x706e                        
  2432  AD9FFE40       JSR [0xfe40]                      
  2436  8D1A           BSR 0x2452                        
  2438  8D03           BSR 0x243d                        
  243a  3526           PULS  A B Y                       
  243c  39             RTS                               

; ---- function FUN_M65_small_00000__243d
FUN_M65_small_00000__243d:
  243d  3416           PSHS  X B A                       
  243f  C61E           LDB #0x1e                         
  2441  AD9FFC36       JSR [0xfc36]                      
  2445  CC0003         LDD #0x3                          
  2448  8E60A0         LDX #0x60a0                       
  244b  AD9FFC3A       JSR [0xfc3a]                      
  244f  3516           PULS  A B X                       
  2451  39             RTS                               

; ---- function FUN_M65_small_00000__2452
FUN_M65_small_00000__2452:
  2452  3476           PSHS  U Y X B A                   
  2454  CC0000         LDD #0x0                          
  2457  3606           PSHU  B A                         
  2459  CC0064         LDD #0x64                         
  245c  3606           PSHU  B A                         
  245e  FC706E         LDD 0x706e                        
  2461  F37070         ADDD 0x7070                       
  2464  3606           PSHU  B A                         
  2466  AD9FFCD8       JSR [0xfcd8]                      
  246a  3706           PULU  A B                         
  246c  FD7072         STD 0x7072                        
  246f  CC0064         LDD #0x64                         
  2472  B37072         SUBD 0x7072                       
  2475  3606           PSHU  B A                         
  2477  58             LSLB                              
  2478  49             ROLA                              
  2479  FD70DE         STD 0x70de                        
  247c  CC4666         LDD #0x4666                       
  247f  3606           PSHU  B A                         
  2481  AD9FFCF2       JSR [0xfcf2]                      
  2485  3706           PULU  A B                         
  2487  F370DE         ADDD 0x70de                       
  248a  AD9FFC6A       JSR [0xfc6a]                      
  248e  3576           PULS  A B X Y U                   
  2490  39             RTS                               
PTR_FUN_M65_small_00000__2557_M65_small_00000__2491:
  2491  2557           addr M65_small_00000::2557        
  2493  256C           addr M65_small_00000::256c        
  2495  7076           addr 7076                         
  2497  .db 00 3F FF 9C 00 64 00 04                          ; .?...d..

; ---- function FUN_M65_small_00000__249f
FUN_M65_small_00000__249f:
  249f  3410           PSHS  X                           
  24a1  8E2491         LDX #0x2491                        ; desc[API_FE1C]: ->$2557 ->$256C $7076
  24a4  AD9FFE1C       JSR [0xfe1c]                      
  24a8  3510           PULS  X                           
  24aa  39             RTS                               

; ---- function FUN_M65_small_00000__24ab
FUN_M65_small_00000__24ab:
  24ab  3410           PSHS  X                           
  24ad  8E2491         LDX #0x2491                        ; desc[API_FE1A]: ->$2557 ->$256C $7076
  24b0  AD9FFE1A       JSR [0xfe1a]                      
  24b4  3510           PULS  X                           
  24b6  39             RTS                               

; ---- function FUN_M65_small_00000__24b7
FUN_M65_small_00000__24b7:
  24b7  3426           PSHS  Y B A                       
  24b9  AD9FFC8E       JSR [0xfc8e]                      
  24bd  FC60F9         LDD 0x60f9                        
  24c0  FD6074         STD 0x6074                        
  24c3  B37078         SUBD 0x7078                       
  24c6  FD7076         STD 0x7076                        
  24c9  1700A0         LBSR 0x256c                       
  24cc  CC7193         LDD #0x7193                       
  24cf  837156         SUBD #0x7156                      
  24d2  1F02           TFR D,Y                           
  24d4  FC7076         LDD 0x7076                        
  24d7  AD9FFC82       JSR [0xfc82]                      
  24db  3526           PULS  A B Y                       
  24dd  39             RTS                               

; ---- function FUN_M65_small_00000__24de
FUN_M65_small_00000__24de:
  24de  3406           PSHS  B A                         
  24e0  FC707A         LDD 0x707a                        
  24e3  FD6074         STD 0x6074                        
  24e6  17E278         LBSR 0x0761                       
  24e9  C613           LDB #0x13                         
  24eb  AD9FFC36       JSR [0xfc36]                      
  24ef  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right mix:    % wet "
  24f3  0A7269676874.. char[22] "\nright mix:    % wet " 
LAB_M65_small_00000__2509:
  2509  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2557 ->$252B $0001 $0001 $0000
  250d  01             db 1h                             
  250e  01             db 1h                             
  250f  02             db 2h                             
  2510  01             db 1h                             
  2511  01             db 1h                             
  2512  00             db 0h                             
  2513  03             db 3h                             
  2514  80             db 80h                            
  2515  0064           dw 64h                            
  2517  0000           dw 0h                             
  2519  0000           dw 0h                             
  251b  2557           addr M65_small_00000::2557        
  251d  252B           addr M65_small_00000::252b        
  251f  0001           dw 1h                             
  2521  0001           dw 1h                             
  2523  0000           dw 0h                             
LAB_M65_small_00000__2525:
  2525  17002F         LBSR 0x2557                       
  2528  3506           PULS  A B                         
  252a  39             RTS                               

; ---- function FUN_M65_small_00000__252b
FUN_M65_small_00000__252b:
  252b  3426           PSHS  Y B A                       
  252d  FC6074         LDD 0x6074                        
  2530  B37078         SUBD 0x7078                       
  2533  FD7076         STD 0x7076                        
  2536  CC7193         LDD #0x7193                       
  2539  837156         SUBD #0x7156                      
  253c  1F02           TFR D,Y                           
  253e  FC7076         LDD 0x7076                        
  2541  AD9FFC82       JSR [0xfc82]                      
  2545  108E0001       LDY #0x1                          
  2549  FC7076         LDD 0x7076                        
  254c  AD9FFE40       JSR [0xfe40]                      
  2550  8D1A           BSR 0x256c                        
  2552  8D03           BSR 0x2557                        
  2554  3526           PULS  A B Y                       
  2556  39             RTS                               

; ---- function FUN_M65_small_00000__2557
FUN_M65_small_00000__2557:
  2557  3416           PSHS  X B A                       
  2559  C61E           LDB #0x1e                         
  255b  AD9FFC36       JSR [0xfc36]                      
  255f  CC0003         LDD #0x3                          
  2562  8E60A0         LDX #0x60a0                       
  2565  AD9FFC3A       JSR [0xfc3a]                      
  2569  3516           PULS  A B X                       
  256b  39             RTS                               

; ---- function FUN_M65_small_00000__256c
FUN_M65_small_00000__256c:
  256c  3476           PSHS  U Y X B A                   
  256e  CC0000         LDD #0x0                          
  2571  3606           PSHU  B A                         
  2573  CC0064         LDD #0x64                         
  2576  3606           PSHU  B A                         
  2578  FC7076         LDD 0x7076                        
  257b  F37078         ADDD 0x7078                       
  257e  3606           PSHU  B A                         
  2580  AD9FFCD8       JSR [0xfcd8]                      
  2584  3706           PULU  A B                         
  2586  FD707A         STD 0x707a                        
  2589  CC0064         LDD #0x64                         
  258c  B3707A         SUBD 0x707a                       
  258f  3606           PSHU  B A                         
  2591  58             LSLB                              
  2592  49             ROLA                              
  2593  FD70DE         STD 0x70de                        
  2596  CC4666         LDD #0x4666                       
  2599  3606           PSHU  B A                         
  259b  AD9FFCF2       JSR [0xfcf2]                      
  259f  3706           PULU  A B                         
  25a1  F370DE         ADDD 0x70de                       
  25a4  AD9FFC72       JSR [0xfc72]                      
  25a8  3576           PULS  A B X Y U                   
  25aa  39             RTS                               
PTR_FUN_M65_small_00000__2671_M65_small_00000__25ab:
  25ab  2671           addr M65_small_00000::2671        
  25ad  2686           addr M65_small_00000::2686        
  25af  707E           addr 707e                         
  25b1  .db 00 3B FF 9C 00 64 00 04                          ; .;...d..

; ---- function FUN_M65_small_00000__25b9
FUN_M65_small_00000__25b9:
  25b9  3410           PSHS  X                           
  25bb  8E25AB         LDX #0x25ab                        ; desc[API_FE1C]: ->$2671 ->$2686 $707E
  25be  AD9FFE1C       JSR [0xfe1c]                      
  25c2  3510           PULS  X                           
  25c4  39             RTS                               

; ---- function FUN_M65_small_00000__25c5
FUN_M65_small_00000__25c5:
  25c5  3410           PSHS  X                           
  25c7  8E25AB         LDX #0x25ab                        ; desc[API_FE1A]: ->$2671 ->$2686 $707E
  25ca  AD9FFE1A       JSR [0xfe1a]                      
  25ce  3510           PULS  X                           
  25d0  39             RTS                               

; ---- function FUN_M65_small_00000__25d1
FUN_M65_small_00000__25d1:
  25d1  3426           PSHS  Y B A                       
  25d3  AD9FFC8E       JSR [0xfc8e]                      
  25d7  FC60F9         LDD 0x60f9                        
  25da  FD6074         STD 0x6074                        
  25dd  B37080         SUBD 0x7080                       
  25e0  FD707E         STD 0x707e                        
  25e3  1700A0         LBSR 0x2686                       
  25e6  CC718F         LDD #0x718f                       
  25e9  837156         SUBD #0x7156                      
  25ec  1F02           TFR D,Y                           
  25ee  FC707E         LDD 0x707e                        
  25f1  AD9FFC82       JSR [0xfc82]                      
  25f5  3526           PULS  A B Y                       
  25f7  39             RTS                               

; ---- function FUN_M65_small_00000__25f8
FUN_M65_small_00000__25f8:
  25f8  3406           PSHS  B A                         
  25fa  FC7082         LDD 0x7082                        
  25fd  FD6074         STD 0x6074                        
  2600  17E15E         LBSR 0x0761                       
  2603  C613           LDB #0x13                         
  2605  AD9FFC36       JSR [0xfc36]                      
  2609  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " l & r fdback:     % "
  260d  0A6C20262072.. char[22] "\nl & r fdback:     % " 
LAB_M65_small_00000__2623:
  2623  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2671 ->$2645 $0001 $0001 $0000
  2627  01             db 1h                             
  2628  01             db 1h                             
  2629  02             db 2h                             
  262a  01             db 1h                             
  262b  01             db 1h                             
  262c  00             db 0h                             
  262d  03             db 3h                             
  262e  80             db 80h                            
  262f  0064           dw 64h                            
  2631  0000           dw 0h                             
  2633  0000           dw 0h                             
  2635  2671           addr M65_small_00000::2671        
  2637  2645           addr M65_small_00000::2645        
  2639  0001           dw 1h                             
  263b  0001           dw 1h                             
  263d  0000           dw 0h                             
LAB_M65_small_00000__263f:
  263f  17002F         LBSR 0x2671                       
  2642  3506           PULS  A B                         
  2644  39             RTS                               

; ---- function FUN_M65_small_00000__2645
FUN_M65_small_00000__2645:
  2645  3426           PSHS  Y B A                       
  2647  FC6074         LDD 0x6074                        
  264a  B37080         SUBD 0x7080                       
  264d  FD707E         STD 0x707e                        
  2650  CC718F         LDD #0x718f                       
  2653  837156         SUBD #0x7156                      
  2656  1F02           TFR D,Y                           
  2658  FC707E         LDD 0x707e                        
  265b  AD9FFC82       JSR [0xfc82]                      
  265f  108E0001       LDY #0x1                          
  2663  FC707E         LDD 0x707e                        
  2666  AD9FFE40       JSR [0xfe40]                      
  266a  8D1A           BSR 0x2686                        
  266c  8D03           BSR 0x2671                        
  266e  3526           PULS  A B Y                       
  2670  39             RTS                               

; ---- function FUN_M65_small_00000__2671
FUN_M65_small_00000__2671:
  2671  3416           PSHS  X B A                       
  2673  C622           LDB #0x22                         
  2675  AD9FFC36       JSR [0xfc36]                      
  2679  CC0003         LDD #0x3                          
  267c  8E60A0         LDX #0x60a0                       
  267f  AD9FFC3A       JSR [0xfc3a]                      
  2683  3516           PULS  A B X                       
  2685  39             RTS                               

; ---- function FUN_M65_small_00000__2686
FUN_M65_small_00000__2686:
  2686  3476           PSHS  U Y X B A                   
  2688  CC0000         LDD #0x0                          
  268b  3606           PSHU  B A                         
  268d  CC0064         LDD #0x64                         
  2690  3606           PSHU  B A                         
  2692  FC707E         LDD 0x707e                        
  2695  F37080         ADDD 0x7080                       
  2698  3606           PSHU  B A                         
  269a  AD9FFCD8       JSR [0xfcd8]                      
  269e  3706           PULU  A B                         
  26a0  FD7082         STD 0x7082                        
  26a3  FC7082         LDD 0x7082                        
  26a6  3606           PSHU  B A                         
  26a8  58             LSLB                              
  26a9  49             ROLA                              
  26aa  FD70DE         STD 0x70de                        
  26ad  CC4666         LDD #0x4666                       
  26b0  3606           PSHU  B A                         
  26b2  AD9FFCF2       JSR [0xfcf2]                      
  26b6  3706           PULU  A B                         
  26b8  F370DE         ADDD 0x70de                       
  26bb  AD9FFC6C       JSR [0xfc6c]                      
  26bf  AD9FFC74       JSR [0xfc74]                      
  26c3  3576           PULS  A B X Y U                   
  26c5  39             RTS                               
PTR_FUN_M65_small_00000__278c_M65_small_00000__26c6:
  26c6  278C           addr M65_small_00000::278c        
  26c8  27A1           addr M65_small_00000::27a1        
  26ca  7086           addr 7086                         
  26cc  .db 00 4F FF 9C 00 64 00 04                          ; .O...d..

; ---- function FUN_M65_small_00000__26d4
FUN_M65_small_00000__26d4:
  26d4  3410           PSHS  X                           
  26d6  8E26C6         LDX #0x26c6                        ; desc[API_FE1C]: ->$278C ->$27A1 $7086
  26d9  AD9FFE1C       JSR [0xfe1c]                      
  26dd  3510           PULS  X                           
  26df  39             RTS                               

; ---- function FUN_M65_small_00000__26e0
FUN_M65_small_00000__26e0:
  26e0  3410           PSHS  X                           
  26e2  8E26C6         LDX #0x26c6                        ; desc[API_FE1A]: ->$278C ->$27A1 $7086
  26e5  AD9FFE1A       JSR [0xfe1a]                      
  26e9  3510           PULS  X                           
  26eb  39             RTS                               

; ---- function FUN_M65_small_00000__26ec
FUN_M65_small_00000__26ec:
  26ec  3426           PSHS  Y B A                       
  26ee  AD9FFC8E       JSR [0xfc8e]                      
  26f2  FC60F9         LDD 0x60f9                        
  26f5  FD6074         STD 0x6074                        
  26f8  B37088         SUBD 0x7088                       
  26fb  FD7086         STD 0x7086                        
  26fe  1700A0         LBSR 0x27a1                       
  2701  CC71A3         LDD #0x71a3                       
  2704  837156         SUBD #0x7156                      
  2707  1F02           TFR D,Y                           
  2709  FC7086         LDD 0x7086                        
  270c  AD9FFC82       JSR [0xfc82]                      
  2710  3526           PULS  A B Y                       
  2712  39             RTS                               

; ---- function FUN_M65_small_00000__2713
FUN_M65_small_00000__2713:
  2713  3406           PSHS  B A                         
  2715  FC708A         LDD 0x708a                        
  2718  FD6074         STD 0x6074                        
  271b  17E043         LBSR 0x0761                       
  271e  C613           LDB #0x13                         
  2720  AD9FFC36       JSR [0xfc36]                      
  2724  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left fdback:     %  "
  2728  0A6C65667420.. char[22] "\nleft fdback:     %  " 
LAB_M65_small_00000__273e:
  273e  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$278C ->$2760 $0001 $0001 $0000
  2742  01             db 1h                             
  2743  01             db 1h                             
  2744  02             db 2h                             
  2745  01             db 1h                             
  2746  01             db 1h                             
  2747  00             db 0h                             
  2748  03             db 3h                             
  2749  80             db 80h                            
  274a  0064           dw 64h                            
  274c  0000           dw 0h                             
  274e  0000           dw 0h                             
  2750  278C           addr M65_small_00000::278c        
  2752  2760           addr M65_small_00000::2760        
  2754  0001           dw 1h                             
  2756  0001           dw 1h                             
  2758  0000           dw 0h                             
LAB_M65_small_00000__275a:
  275a  17002F         LBSR 0x278c                       
  275d  3506           PULS  A B                         
  275f  39             RTS                               

; ---- function FUN_M65_small_00000__2760
FUN_M65_small_00000__2760:
  2760  3426           PSHS  Y B A                       
  2762  FC6074         LDD 0x6074                        
  2765  B37088         SUBD 0x7088                       
  2768  FD7086         STD 0x7086                        
  276b  CC71A3         LDD #0x71a3                       
  276e  837156         SUBD #0x7156                      
  2771  1F02           TFR D,Y                           
  2773  FC7086         LDD 0x7086                        
  2776  AD9FFC82       JSR [0xfc82]                      
  277a  108E0002       LDY #0x2                          
  277e  FC7086         LDD 0x7086                        
  2781  AD9FFE40       JSR [0xfe40]                      
  2785  8D1A           BSR 0x27a1                        
  2787  8D03           BSR 0x278c                        
  2789  3526           PULS  A B Y                       
  278b  39             RTS                               

; ---- function FUN_M65_small_00000__278c
FUN_M65_small_00000__278c:
  278c  3416           PSHS  X B A                       
  278e  C621           LDB #0x21                         
  2790  AD9FFC36       JSR [0xfc36]                      
  2794  CC0003         LDD #0x3                          
  2797  8E60A0         LDX #0x60a0                       
  279a  AD9FFC3A       JSR [0xfc3a]                      
  279e  3516           PULS  A B X                       
  27a0  39             RTS                               

; ---- function FUN_M65_small_00000__27a1
FUN_M65_small_00000__27a1:
  27a1  3476           PSHS  U Y X B A                   
  27a3  CC0000         LDD #0x0                          
  27a6  3606           PSHU  B A                         
  27a8  CC0064         LDD #0x64                         
  27ab  3606           PSHU  B A                         
  27ad  FC7086         LDD 0x7086                        
  27b0  F37088         ADDD 0x7088                       
  27b3  3606           PSHU  B A                         
  27b5  AD9FFCD8       JSR [0xfcd8]                      
  27b9  3706           PULU  A B                         
  27bb  FD708A         STD 0x708a                        
  27be  FC708A         LDD 0x708a                        
  27c1  3606           PSHU  B A                         
  27c3  58             LSLB                              
  27c4  49             ROLA                              
  27c5  FD70DE         STD 0x70de                        
  27c8  CC4666         LDD #0x4666                       
  27cb  3606           PSHU  B A                         
  27cd  AD9FFCF2       JSR [0xfcf2]                      
  27d1  3706           PULU  A B                         
  27d3  F370DE         ADDD 0x70de                       
  27d6  AD9FFC6C       JSR [0xfc6c]                      
  27da  3576           PULS  A B X Y U                   
  27dc  39             RTS                               
PTR_FUN_M65_small_00000__28a3_M65_small_00000__27dd:
  27dd  28A3           addr M65_small_00000::28a3        
  27df  28B8           addr M65_small_00000::28b8        
  27e1  708E           addr 708e                         
  27e3  .db 00 3B FF 9C 00 64 00 04                          ; .;...d..

; ---- function FUN_M65_small_00000__27eb
FUN_M65_small_00000__27eb:
  27eb  3410           PSHS  X                           
  27ed  8E27DD         LDX #0x27dd                        ; desc[API_FE1C]: ->$28A3 ->$28B8 $708E
  27f0  AD9FFE1C       JSR [0xfe1c]                      
  27f4  3510           PULS  X                           
  27f6  39             RTS                               

; ---- function FUN_M65_small_00000__27f7
FUN_M65_small_00000__27f7:
  27f7  3410           PSHS  X                           
  27f9  8E27DD         LDX #0x27dd                        ; desc[API_FE1A]: ->$28A3 ->$28B8 $708E
  27fc  AD9FFE1A       JSR [0xfe1a]                      
  2800  3510           PULS  X                           
  2802  39             RTS                               

; ---- function FUN_M65_small_00000__2803
FUN_M65_small_00000__2803:
  2803  3426           PSHS  Y B A                       
  2805  AD9FFC8E       JSR [0xfc8e]                      
  2809  FC60F9         LDD 0x60f9                        
  280c  FD6074         STD 0x6074                        
  280f  B37090         SUBD 0x7090                       
  2812  FD708E         STD 0x708e                        
  2815  1700A0         LBSR 0x28b8                       
  2818  CC718F         LDD #0x718f                       
  281b  837156         SUBD #0x7156                      
  281e  1F02           TFR D,Y                           
  2820  FC708E         LDD 0x708e                        
  2823  AD9FFC82       JSR [0xfc82]                      
  2827  3526           PULS  A B Y                       
  2829  39             RTS                               

; ---- function FUN_M65_small_00000__282a
FUN_M65_small_00000__282a:
  282a  3406           PSHS  B A                         
  282c  FC7092         LDD 0x7092                        
  282f  FD6074         STD 0x6074                        
  2832  17DF2C         LBSR 0x0761                       
  2835  C613           LDB #0x13                         
  2837  AD9FFC36       JSR [0xfc36]                      
  283b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right fdback:     % "
  283f  0A7269676874.. char[22] "\nright fdback:     % " 
LAB_M65_small_00000__2855:
  2855  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$28A3 ->$2877 $0001 $0001 $0000
  2859  01             db 1h                             
  285a  01             db 1h                             
  285b  02             db 2h                             
  285c  01             db 1h                             
  285d  01             db 1h                             
  285e  00             db 0h                             
  285f  03             db 3h                             
  2860  80             db 80h                            
  2861  0064           dw 64h                            
  2863  0000           dw 0h                             
  2865  0000           dw 0h                             
  2867  28A3           addr M65_small_00000::28a3        
  2869  2877           addr M65_small_00000::2877        
  286b  0001           dw 1h                             
  286d  0001           dw 1h                             
  286f  0000           dw 0h                             
LAB_M65_small_00000__2871:
  2871  17002F         LBSR 0x28a3                       
  2874  3506           PULS  A B                         
  2876  39             RTS                               

; ---- function FUN_M65_small_00000__2877
FUN_M65_small_00000__2877:
  2877  3426           PSHS  Y B A                       
  2879  FC6074         LDD 0x6074                        
  287c  B37090         SUBD 0x7090                       
  287f  FD708E         STD 0x708e                        
  2882  CC718F         LDD #0x718f                       
  2885  837156         SUBD #0x7156                      
  2888  1F02           TFR D,Y                           
  288a  FC708E         LDD 0x708e                        
  288d  AD9FFC82       JSR [0xfc82]                      
  2891  108E0003       LDY #0x3                          
  2895  FC708E         LDD 0x708e                        
  2898  AD9FFE40       JSR [0xfe40]                      
  289c  8D1A           BSR 0x28b8                        
  289e  8D03           BSR 0x28a3                        
  28a0  3526           PULS  A B Y                       
  28a2  39             RTS                               

; ---- function FUN_M65_small_00000__28a3
FUN_M65_small_00000__28a3:
  28a3  3416           PSHS  X B A                       
  28a5  C622           LDB #0x22                         
  28a7  AD9FFC36       JSR [0xfc36]                      
  28ab  CC0003         LDD #0x3                          
  28ae  8E60A0         LDX #0x60a0                       
  28b1  AD9FFC3A       JSR [0xfc3a]                      
  28b5  3516           PULS  A B X                       
  28b7  39             RTS                               

; ---- function FUN_M65_small_00000__28b8
FUN_M65_small_00000__28b8:
  28b8  3476           PSHS  U Y X B A                   
  28ba  CC0000         LDD #0x0                          
  28bd  3606           PSHU  B A                         
  28bf  CC0064         LDD #0x64                         
  28c2  3606           PSHU  B A                         
  28c4  FC708E         LDD 0x708e                        
  28c7  F37090         ADDD 0x7090                       
  28ca  3606           PSHU  B A                         
  28cc  AD9FFCD8       JSR [0xfcd8]                      
  28d0  3706           PULU  A B                         
  28d2  FD7092         STD 0x7092                        
  28d5  FC7092         LDD 0x7092                        
  28d8  3606           PSHU  B A                         
  28da  58             LSLB                              
  28db  49             ROLA                              
  28dc  FD70DE         STD 0x70de                        
  28df  CC4666         LDD #0x4666                       
  28e2  3606           PSHU  B A                         
  28e4  AD9FFCF2       JSR [0xfcf2]                      
  28e8  3706           PULU  A B                         
  28ea  F370DE         ADDD 0x70de                       
  28ed  AD9FFC74       JSR [0xfc74]                      
  28f1  3576           PULS  A B X Y U                   
  28f3  39             RTS                               

; ---- function FUN_M65_small_00000__28f4
FUN_M65_small_00000__28f4:
  28f4  3426           PSHS  Y B A                       
  28f6  AD9FFC8E       JSR [0xfc8e]                      
  28fa  FC60F9         LDD 0x60f9                        
  28fd  FD70A8         STD 0x70a8                        
  2900  FD6074         STD 0x6074                        
  2903  1700EE         LBSR 0x29f4                       
  2906  CC7198         LDD #0x7198                       
  2909  837156         SUBD #0x7156                      
  290c  1F02           TFR D,Y                           
  290e  FC70A8         LDD 0x70a8                        
  2911  AD9FFC80       JSR [0xfc80]                      
  2915  3526           PULS  A B Y                       
  2917  39             RTS                               

; ---- function FUN_M65_small_00000__2918
FUN_M65_small_00000__2918:
  2918  3406           PSHS  B A                         
  291a  FC70A8         LDD 0x70a8                        
  291d  FD6074         STD 0x6074                        
  2920  17DE3E         LBSR 0x0761                       
  2923  C613           LDB #0x13                         
  2925  AD9FFC36       JSR [0xfc36]                      
  2929  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  292d  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M65_small_00000__2943:
  2943  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 01 80 $0004 $0000 $0000 ->$2994 ->$2968 $0001 $0001 $0000
  2947  01             db 1h                             
  2948  01             db 1h                             
  2949  02             db 2h                             
  294a  01             db 1h                             
  294b  01             db 1h                             
  294c  00             db 0h                             
  294d  01             db 1h                             
  294e  80             db 80h                            
  294f  0004           dw 4h                             
  2951  0000           dw 0h                             
  2953  0000           dw 0h                             
  2955  2994           addr M65_small_00000::2994        
  2957  2968           addr M65_small_00000::2968        
  2959  0001           dw 1h                             
  295b  0001           dw 1h                             
  295d  0000           dw 0h                             
LAB_M65_small_00000__295f:
  295f  170032         LBSR 0x2994                       
  2962  170133         LBSR 0x2a98                       
  2965  3506           PULS  A B                         
  2967  39             RTS                               

; ---- function FUN_M65_small_00000__2968
FUN_M65_small_00000__2968:
  2968  3426           PSHS  Y B A                       
  296a  FC6062         LDD 0x6062                        
  296d  FD70A8         STD 0x70a8                        
  2970  CC7198         LDD #0x7198                       
  2973  837156         SUBD #0x7156                      
  2976  1F02           TFR D,Y                           
  2978  FC70A8         LDD 0x70a8                        
  297b  AD9FFC80       JSR [0xfc80]                      
  297f  108E0009       LDY #0x9                          
  2983  FC70A8         LDD 0x70a8                        
  2986  AD9FFE40       JSR [0xfe40]                      
  298a  8D08           BSR 0x2994                        
  298c  170109         LBSR 0x2a98                       
  298f  8D63           BSR 0x29f4                        
  2991  3526           PULS  A B Y                       
  2993  39             RTS                               

; ---- function FUN_M65_small_00000__2994
FUN_M65_small_00000__2994:
  2994  C626           LDB #0x26                         
  2996  AD9FFC36       JSR [0xfc36]                      
  299a  FC70A8         LDD 0x70a8                        
  299d  10830000       CMPD #0x0                         
  29a1  10270045       LBEQ 0x29ea                       
  29a5  FC70A8         LDD 0x70a8                        
  29a8  10830001       CMPD #0x1                         
  29ac  10270031       LBEQ 0x29e1                       
  29b0  FC70A8         LDD 0x70a8                        
  29b3  10830002       CMPD #0x2                         
  29b7  1027001D       LBEQ 0x29d8                       
  29bb  FC70A8         LDD 0x70a8                        
  29be  10830003       CMPD #0x3                         
  29c2  10270009       LBEQ 0x29cf                       
  29c6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C8"
  29ca  433800         char[3] "C8"                      
LAB_M65_small_00000__29cd:
  29cd  2024           BRA 0x29f3                        
LAB_M65_small_00000__29cf:
  29cf  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C7"
  29d3  433700         char[3] "C7"                      
LAB_M65_small_00000__29d6:
  29d6  201B           BRA 0x29f3                        
LAB_M65_small_00000__29d8:
  29d8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C6"
  29dc  433600         char[3] "C6"                      
LAB_M65_small_00000__29df:
  29df  2012           BRA 0x29f3                        
LAB_M65_small_00000__29e1:
  29e1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C5"
  29e5  433500         char[3] "C5"                      
LAB_M65_small_00000__29e8:
  29e8  2009           BRA 0x29f3                        
LAB_M65_small_00000__29ea:
  29ea  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "C4"
  29ee  433400         char[3] "C4"                      
LAB_M65_small_00000__29f1:
  29f1  2000           BRA 0x29f3                        
LAB_M65_small_00000__29f3:
  29f3  39             RTS                               

; ---- function FUN_M65_small_00000__29f4
FUN_M65_small_00000__29f4:
  29f4  1700C5         LBSR 0x2abc                       
  29f7  39             RTS                               

; ---- function FUN_M65_small_00000__29f8
FUN_M65_small_00000__29f8:
  29f8  3426           PSHS  Y B A                       
  29fa  AD9FFC8E       JSR [0xfc8e]                      
  29fe  FC60F9         LDD 0x60f9                        
  2a01  FD70A6         STD 0x70a6                        
  2a04  FD6074         STD 0x6074                        
  2a07  1700B2         LBSR 0x2abc                       
  2a0a  CC7197         LDD #0x7197                       
  2a0d  837156         SUBD #0x7156                      
  2a10  1F02           TFR D,Y                           
  2a12  FC70A6         LDD 0x70a6                        
  2a15  AD9FFC80       JSR [0xfc80]                      
  2a19  3526           PULS  A B Y                       
  2a1b  39             RTS                               

; ---- function FUN_M65_small_00000__2a1c
FUN_M65_small_00000__2a1c:
  2a1c  3406           PSHS  B A                         
  2a1e  FC70A6         LDD 0x70a6                        
  2a21  FD6074         STD 0x6074                        
  2a24  17DD3A         LBSR 0x0761                       
  2a27  C613           LDB #0x13                         
  2a29  AD9FFC36       JSR [0xfc36]                      
  2a2d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " range=      thru    "
  2a31  0A72616E6765.. char[22] "\nrange=      thru    " 
LAB_M65_small_00000__2a47:
  2a47  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $002E $0000 $0000 ->$2A98 ->$2A6C $0001 $0001 $0000
  2a4b  01             db 1h                             
  2a4c  01             db 1h                             
  2a4d  02             db 2h                             
  2a4e  01             db 1h                             
  2a4f  01             db 1h                             
  2a50  00             db 0h                             
  2a51  02             db 2h                             
  2a52  80             db 80h                            
  2a53  002E           dw 2Eh                            
  2a55  0000           dw 0h                             
  2a57  0000           dw 0h                             
  2a59  2A98           addr M65_small_00000::2a98        
  2a5b  2A6C           addr M65_small_00000::2a6c        
  2a5d  0001           dw 1h                             
  2a5f  0001           dw 1h                             
  2a61  0000           dw 0h                             
LAB_M65_small_00000__2a63:
  2a63  170032         LBSR 0x2a98                       
  2a66  17FF2B         LBSR 0x2994                       
  2a69  3506           PULS  A B                         
  2a6b  39             RTS                               

; ---- function FUN_M65_small_00000__2a6c
FUN_M65_small_00000__2a6c:
  2a6c  3426           PSHS  Y B A                       
  2a6e  FC6062         LDD 0x6062                        
  2a71  FD70A6         STD 0x70a6                        
  2a74  CC7197         LDD #0x7197                       
  2a77  837156         SUBD #0x7156                      
  2a7a  1F02           TFR D,Y                           
  2a7c  FC70A6         LDD 0x70a6                        
  2a7f  AD9FFC80       JSR [0xfc80]                      
  2a83  108E0008       LDY #0x8                          
  2a87  FC70A6         LDD 0x70a6                        
  2a8a  AD9FFE40       JSR [0xfe40]                      
  2a8e  8D08           BSR 0x2a98                        
  2a90  17FF01         LBSR 0x2994                       
  2a93  8D27           BSR 0x2abc                        
  2a95  3526           PULS  A B Y                       
  2a97  39             RTS                               

; ---- function FUN_M65_small_00000__2a98
FUN_M65_small_00000__2a98:
  2a98  C61C           LDB #0x1c                         
  2a9a  AD9FFC36       JSR [0xfc36]                      
  2a9e  FC70A8         LDD 0x70a8                        
  2aa1  860C           LDA #0xc                          
  2aa3  3D             MUL                               
  2aa4  C30002         ADDD #0x2                         
  2aa7  F370A6         ADDD 0x70a6                       
  2aaa  8604           LDA #0x4                          
  2aac  3D             MUL                               
  2aad  C33217         ADDD #0x3217                      
  2ab0  F3600D         ADDD 0x600d                       
  2ab3  1F01           TFR D,X                           
  2ab5  C604           LDB #0x4                          
  2ab7  AD9FFC3A       JSR [0xfc3a]                      
  2abb  39             RTS                               

; ---- function FUN_M65_small_00000__2abc
FUN_M65_small_00000__2abc:
  2abc  3476           PSHS  U Y X B A                   
  2abe  170232         LBSR 0x2cf3                       
  2ac1  FC7132         LDD 0x7132                        
  2ac4  10830000       CMPD #0x0                         
  2ac8  1027000D       LBEQ 0x2ad9                       
  2acc  FC7148         LDD 0x7148                        
  2acf  AD9FFD3C       JSR [0xfd3c]                      
  2ad3  AD9FFD44       JSR [0xfd44]                      
  2ad7  2007           BRA 0x2ae0                        
LAB_M65_small_00000__2ad9:
  2ad9  FC7148         LDD 0x7148                        
  2adc  AD9FFD3C       JSR [0xfd3c]                      
LAB_M65_small_00000__2ae0:
  2ae0  3576           PULS  A B X Y U                   
  2ae2  39             RTS                               

; ---- function FUN_M65_small_00000__2ae3
FUN_M65_small_00000__2ae3:
  2ae3  3426           PSHS  Y B A                       
  2ae5  AD9FFC8E       JSR [0xfc8e]                      
  2ae9  FC60F9         LDD 0x60f9                        
  2aec  FD70B0         STD 0x70b0                        
  2aef  FD6074         STD 0x6074                        
  2af2  1700EB         LBSR 0x2be0                       
  2af5  CC7199         LDD #0x7199                       
  2af8  837156         SUBD #0x7156                      
  2afb  1F02           TFR D,Y                           
  2afd  FC70B0         LDD 0x70b0                        
  2b00  AD9FFC80       JSR [0xfc80]                      
  2b04  3526           PULS  A B Y                       
  2b06  39             RTS                               

; ---- function FUN_M65_small_00000__2b07
FUN_M65_small_00000__2b07:
  2b07  3406           PSHS  B A                         
  2b09  FC70B0         LDD 0x70b0                        
  2b0c  FD6074         STD 0x6074                        
  2b0f  17DC4F         LBSR 0x0761                       
  2b12  C604           LDB #0x4                          
  2b14  AD9FFC36       JSR [0xfc36]                      
  2b18  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " deglitch:                          "
  2b1c  0A6465676C69.. char[37] "\ndeglitch:                          "
LAB_M65_small_00000__2b41:
  2b41  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$2B8A ->$2B63 $0001 $0001 $0000
  2b45  01             db 1h                             
  2b46  01             db 1h                             
  2b47  02             db 2h                             
  2b48  01             db 1h                             
  2b49  01             db 1h                             
  2b4a  00             db 0h                             
  2b4b  02             db 2h                             
  2b4c  80             db 80h                            
  2b4d  0000           dw 0h                             
  2b4f  FFFF           dw FFFFh                          
  2b51  0000           dw 0h                             
  2b53  2B8A           addr M65_small_00000::2b8a        
  2b55  2B63           addr M65_small_00000::2b63        
  2b57  0001           dw 1h                             
  2b59  0001           dw 1h                             
  2b5b  0000           dw 0h                             
LAB_M65_small_00000__2b5d:
  2b5d  17002A         LBSR 0x2b8a                       
  2b60  3506           PULS  A B                         
  2b62  39             RTS                               

; ---- function FUN_M65_small_00000__2b63
FUN_M65_small_00000__2b63:
  2b63  3426           PSHS  Y B A                       
  2b65  FC6074         LDD 0x6074                        
  2b68  FD70B0         STD 0x70b0                        
  2b6b  CC7199         LDD #0x7199                       
  2b6e  837156         SUBD #0x7156                      
  2b71  1F02           TFR D,Y                           
  2b73  FC70B0         LDD 0x70b0                        
  2b76  AD9FFC80       JSR [0xfc80]                      
  2b7a  108E000B       LDY #0xb                          
  2b7e  FC70B0         LDD 0x70b0                        
  2b81  AD9FFE40       JSR [0xfe40]                      
  2b85  8D59           BSR 0x2be0                        
  2b87  3526           PULS  A B Y                       
  2b89  39             RTS                               

; ---- function FUN_M65_small_00000__2b8a
FUN_M65_small_00000__2b8a:
  2b8a  3456           PSHS  U X B A                     
  2b8c  FC70B0         LDD 0x70b0                        
  2b8f  10830000       CMPD #0x0                         
  2b93  10270024       LBEQ 0x2bbb                       
  2b97  C60F           LDB #0xf                          
  2b99  AD9FFC36       JSR [0xfc36]                      
  2b9d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "channel 1 and channel 2"
  2ba1  6368616E6E65.. char[24] "channel 1 and channel 2"
LAB_M65_small_00000__2bb9:
  2bb9  2022           BRA 0x2bdd                        
LAB_M65_small_00000__2bbb:
  2bbb  C60F           LDB #0xf                          
  2bbd  AD9FFC36       JSR [0xfc36]                      
  2bc1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "lock to channel 1      "
  2bc5  6C6F636B2074.. char[24] "lock to channel 1      "
LAB_M65_small_00000__2bdd:
  2bdd  3556           PULS  A B X U                     
  2bdf  39             RTS                               

; ---- function FUN_M65_small_00000__2be0
FUN_M65_small_00000__2be0:
  2be0  3476           PSHS  U Y X B A                   
  2be2  FC70B0         LDD 0x70b0                        
  2be5  FD70AE         STD 0x70ae                        
  2be8  CC0000         LDD #0x0                          
  2beb  FD70F2         STD 0x70f2                        
  2bee  3576           PULS  A B X Y U                   
  2bf0  39             RTS                               

; ---- function FUN_M65_small_00000__2bf1
FUN_M65_small_00000__2bf1:
  2bf1  3426           PSHS  Y B A                       
  2bf3  AD9FFC8E       JSR [0xfc8e]                      
  2bf7  FC60F9         LDD 0x60f9                        
  2bfa  FD70AA         STD 0x70aa                        
  2bfd  FD6074         STD 0x6074                        
  2c00  1700D2         LBSR 0x2cd5                       
  2c03  CC719A         LDD #0x719a                       
  2c06  837156         SUBD #0x7156                      
  2c09  1F02           TFR D,Y                           
  2c0b  FC70AA         LDD 0x70aa                        
  2c0e  AD9FFC80       JSR [0xfc80]                      
  2c12  3526           PULS  A B Y                       
  2c14  39             RTS                               

; ---- function FUN_M65_small_00000__2c15
FUN_M65_small_00000__2c15:
  2c15  FC70AA         LDD 0x70aa                        
  2c18  FD6074         STD 0x6074                        
  2c1b  17DB43         LBSR 0x0761                       
  2c1e  C604           LDB #0x4                          
  2c20  AD9FFC36       JSR [0xfc36]                      
  2c24  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " polyphonic-                   -solo"
  2c28  0A706F6C7970.. char[37] "\npolyphonic-                   -solo"
LAB_M65_small_00000__2c4d:
  2c4d  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $005F $0005 $0000 ->$2C92 ->$2C6D $0005 $0005 $0000
  2c51  01             db 1h                             
  2c52  01             db 1h                             
  2c53  02             db 2h                             
  2c54  01             db 1h                             
  2c55  01             db 1h                             
  2c56  00             db 0h                             
  2c57  03             db 3h                             
  2c58  80             db 80h                            
  2c59  005F           dw 5Fh                            
  2c5b  0005           dw 5h                             
  2c5d  0000           dw 0h                             
  2c5f  2C92           addr M65_small_00000::2c92        
  2c61  2C6D           addr M65_small_00000::2c6d        
  2c63  0005           dw 5h                             
  2c65  0005           dw 5h                             
  2c67  0000           dw 0h                             
LAB_M65_small_00000__2c69:
  2c69  170026         LBSR 0x2c92                       
  2c6c  39             RTS                               

; ---- function FUN_M65_small_00000__2c6d
FUN_M65_small_00000__2c6d:
  2c6d  FC6074         LDD 0x6074                        
  2c70  FD70AA         STD 0x70aa                        
  2c73  CC719A         LDD #0x719a                       
  2c76  837156         SUBD #0x7156                      
  2c79  1F02           TFR D,Y                           
  2c7b  FC70AA         LDD 0x70aa                        
  2c7e  AD9FFC80       JSR [0xfc80]                      
  2c82  108E000A       LDY #0xa                          
  2c86  FC70AA         LDD 0x70aa                        
  2c89  AD9FFE40       JSR [0xfe40]                      
  2c8d  8D46           BSR 0x2cd5                        
  2c8f  8D01           BSR 0x2c92                        
  2c91  39             RTS                               

; ---- function FUN_M65_small_00000__2c92
FUN_M65_small_00000__2c92:
  2c92  3466           PSHS  U Y B A                     
  2c94  C610           LDB #0x10                         
  2c96  AD9FFC36       JSR [0xfc36]                      
  2c9a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                   "
  2c9e  202020202020.. char[20] "                   "    
LAB_M65_small_00000__2cb2:
  2cb2  FC70AA         LDD 0x70aa                        
  2cb5  830005         SUBD #0x5                         
  2cb8  3606           PSHU  B A                         
  2cba  CC0005         LDD #0x5                          
  2cbd  3606           PSHU  B A                         
  2cbf  AD9FFCEA       JSR [0xfcea]                      
  2cc3  3706           PULU  A B                         
  2cc5  C30010         ADDD #0x10                        
  2cc8  AD9FFC36       JSR [0xfc36]                      
  2ccc  C62A           LDB #0x2a                         
  2cce  AD9FFC2A       JSR [0xfc2a]                      
  2cd2  3566           PULS  A B Y U                     
  2cd4  39             RTS                               

; ---- function FUN_M65_small_00000__2cd5
FUN_M65_small_00000__2cd5:
  2cd5  3456           PSHS  U X B A                     
  2cd7  FC70AA         LDD 0x70aa                        
  2cda  3606           PSHU  B A                         
  2cdc  CC0147         LDD #0x147                        
  2cdf  3606           PSHU  B A                         
  2ce1  AD9FFCEE       JSR [0xfcee]                      
  2ce5  3706           PULU  A B                         
  2ce7  FD7124         STD 0x7124                        
  2cea  CC0000         LDD #0x0                          
  2ced  FD70F2         STD 0x70f2                        
  2cf0  3556           PULS  A B X U                     
  2cf2  39             RTS                               

; ---- function FUN_M65_small_00000__2cf3
FUN_M65_small_00000__2cf3:
  2cf3  3476           PSHS  U Y X B A                   
  2cf5  FC70A6         LDD 0x70a6                        
  2cf8  8602           LDA #0x2                          
  2cfa  3D             MUL                               
  2cfb  C333C7         ADDD #0x33c7                      
  2cfe  F3600D         ADDD 0x600d                       
  2d01  1F01           TFR D,X                           
  2d03  EC84           LDD ,X                            
  2d05  FD7116         STD 0x7116                        
  2d08  3606           PSHU  B A                         
  2d0a  CCFFFF         LDD #0xffff                       
  2d0d  3606           PSHU  B A                         
  2d0f  AD9FFCDE       JSR [0xfcde]                      
  2d13  3706           PULU  A B                         
  2d15  830002         SUBD #0x2                         
  2d18  FD7118         STD 0x7118                        
  2d1b  FD711A         STD 0x711a                        
  2d1e  FC70A8         LDD 0x70a8                        
  2d21  10830000       CMPD #0x0                         
  2d25  10270041       LBEQ 0x2d6a                       
  2d29  FC70A8         LDD 0x70a8                        
  2d2c  10830001       CMPD #0x1                         
  2d30  1027002E       LBEQ 0x2d62                       
  2d34  FC70A8         LDD 0x70a8                        
  2d37  10830002       CMPD #0x2                         
  2d3b  1027001B       LBEQ 0x2d5a                       
  2d3f  FC70A8         LDD 0x70a8                        
  2d42  10830003       CMPD #0x3                         
  2d46  10270008       LBEQ 0x2d52                       
  2d4a  CC0001         LDD #0x1                          
  2d4d  FD711E         STD 0x711e                        
  2d50  2045           BRA 0x2d97                        
LAB_M65_small_00000__2d52:
  2d52  CC0002         LDD #0x2                          
  2d55  FD711E         STD 0x711e                        
  2d58  2016           BRA 0x2d70                        
LAB_M65_small_00000__2d5a:
  2d5a  CC0004         LDD #0x4                          
  2d5d  FD711E         STD 0x711e                        
  2d60  200E           BRA 0x2d70                        
LAB_M65_small_00000__2d62:
  2d62  CC0008         LDD #0x8                          
  2d65  FD711E         STD 0x711e                        
  2d68  2006           BRA 0x2d70                        
LAB_M65_small_00000__2d6a:
  2d6a  CC0010         LDD #0x10                         
  2d6d  FD711E         STD 0x711e                        
LAB_M65_small_00000__2d70:
  2d70  FC70A8         LDD 0x70a8                        
  2d73  860A           LDA #0xa                          
  2d75  3D             MUL                               
  2d76  C3343F         ADDD #0x343f                      
  2d79  F3600D         ADDD 0x600d                       
  2d7c  1F01           TFR D,X                           
  2d7e  EC81           LDD ,X++                          
  2d80  FD7108         STD 0x7108                        
  2d83  EC81           LDD ,X++                          
  2d85  FD710A         STD 0x710a                        
  2d88  EC81           LDD ,X++                          
  2d8a  FD710C         STD 0x710c                        
  2d8d  EC81           LDD ,X++                          
  2d8f  FD710E         STD 0x710e                        
  2d92  EC81           LDD ,X++                          
  2d94  FD7110         STD 0x7110                        
LAB_M65_small_00000__2d97:
  2d97  FC70A8         LDD 0x70a8                        
  2d9a  8630           LDA #0x30                         
  2d9c  3D             MUL                               
  2d9d  FD70DE         STD 0x70de                        
  2da0  CC002E         LDD #0x2e                         
  2da3  B370A6         SUBD 0x70a6                       
  2da6  C4FC           ANDB #0xfc                        
  2da8  F370DE         ADDD 0x70de                       
  2dab  C33127         ADDD #0x3127                      
  2dae  F3600D         ADDD 0x600d                       
  2db1  1F01           TFR D,X                           
  2db3  EC81           LDD ,X++                          
  2db5  FD7146         STD 0x7146                        
  2db8  EC84           LDD ,X                            
  2dba  FD7144         STD 0x7144                        
  2dbd  FC7116         LDD 0x7116                        
  2dc0  3606           PSHU  B A                         
  2dc2  FC711E         LDD 0x711e                        
  2dc5  58             LSLB                              
  2dc6  3606           PSHU  B A                         
  2dc8  AD9FFCF0       JSR [0xfcf0]                      
  2dcc  3706           PULU  A B                         
  2dce  3706           PULU  A B                         
  2dd0  FD70DE         STD 0x70de                        
  2dd3  FC705A         LDD 0x705a                        
  2dd6  3606           PSHU  B A                         
  2dd8  CC002C         LDD #0x2c                         
  2ddb  3606           PSHU  B A                         
  2ddd  AD9FFCEE       JSR [0xfcee]                      
  2de1  3706           PULU  A B                         
  2de3  FD70E0         STD 0x70e0                        
  2de6  2B0C           BMI 0x2df4                        
  2de8  FC7144         LDD 0x7144                        
  2deb  B37146         SUBD 0x7146                       
  2dee  10B370E0       CMPD 0x70e0                       
  2df2  2E0E           BGT 0x2e02                        
LAB_M65_small_00000__2df4:
  2df4  FC70DE         LDD 0x70de                        
  2df7  F370E0         ADDD 0x70e0                       
  2dfa  B37144         SUBD 0x7144                       
  2dfd  FD7122         STD 0x7122                        
  2e00  2009           BRA 0x2e0b                        
LAB_M65_small_00000__2e02:
  2e02  FC70DE         LDD 0x70de                        
  2e05  B37146         SUBD 0x7146                       
  2e08  FD7122         STD 0x7122                        
LAB_M65_small_00000__2e0b:
  2e0b  FC7062         LDD 0x7062                        
  2e0e  3606           PSHU  B A                         
  2e10  CC002C         LDD #0x2c                         
  2e13  3606           PSHU  B A                         
  2e15  AD9FFCEE       JSR [0xfcee]                      
  2e19  3706           PULU  A B                         
  2e1b  FD70E0         STD 0x70e0                        
  2e1e  2B0C           BMI 0x2e2c                        
  2e20  FC7144         LDD 0x7144                        
  2e23  B37146         SUBD 0x7146                       
  2e26  10B370E0       CMPD 0x70e0                       
  2e2a  2E11           BGT 0x2e3d                        
LAB_M65_small_00000__2e2c:
  2e2c  FC70DE         LDD 0x70de                        
  2e2f  F370E0         ADDD 0x70e0                       
  2e32  C38000         ADDD #0x8000                      
  2e35  B37144         SUBD 0x7144                       
  2e38  FD7106         STD 0x7106                        
  2e3b  200C           BRA 0x2e49                        
LAB_M65_small_00000__2e3d:
  2e3d  FC70DE         LDD 0x70de                        
  2e40  C38000         ADDD #0x8000                      
  2e43  B37146         SUBD 0x7146                       
  2e46  FD7106         STD 0x7106                        
LAB_M65_small_00000__2e49:
  2e49  CCFFFF         LDD #0xffff                       
  2e4c  FD70AE         STD 0x70ae                        
  2e4f  FC7134         LDD 0x7134                        
  2e52  1083FFFF       CMPD #0xffff                      
  2e56  10270025       LBEQ 0x2e7f                       
  2e5a  FC7106         LDD 0x7106                        
  2e5d  C38000         ADDD #0x8000                      
  2e60  FD7106         STD 0x7106                        
  2e63  FC705A         LDD 0x705a                        
  2e66  B37062         SUBD 0x7062                       
  2e69  3606           PSHU  B A                         
  2e6b  AD9FFCC8       JSR [0xfcc8]                      
  2e6f  3706           PULU  A B                         
  2e71  1083000A       CMPD #0xa                         
  2e75  2E1C           BGT 0x2e93                        
  2e77  CC0000         LDD #0x0                          
  2e7a  FD70AE         STD 0x70ae                        
  2e7d  2014           BRA 0x2e93                        
LAB_M65_small_00000__2e7f:
  2e7f  FC7132         LDD 0x7132                        
  2e82  1083FFFF       CMPD #0xffff                      
  2e86  10270009       LBEQ 0x2e93                       
  2e8a  FC7106         LDD 0x7106                        
  2e8d  C38000         ADDD #0x8000                      
  2e90  FD7122         STD 0x7122                        
LAB_M65_small_00000__2e93:
  2e93  FC7118         LDD 0x7118                        
  2e96  3606           PSHU  B A                         
  2e98  FC711E         LDD 0x711e                        
  2e9b  3606           PSHU  B A                         
  2e9d  AD9FFCF0       JSR [0xfcf0]                      
  2ea1  3706           PULU  A B                         
  2ea3  CCFFFF         LDD #0xffff                       
  2ea6  3606           PSHU  B A                         
  2ea8  AD9FFCDE       JSR [0xfcde]                      
  2eac  3706           PULU  A B                         
  2eae  FD70DE         STD 0x70de                        
  2eb1  FD7148         STD 0x7148                        
  2eb4  F370BA         ADDD 0x70ba                       
  2eb7  FD70BE         STD 0x70be                        
  2eba  FC70DE         LDD 0x70de                        
  2ebd  F370BC         ADDD 0x70bc                       
  2ec0  FD70C4         STD 0x70c4                        
  2ec3  CC7FFF         LDD #0x7fff                       
  2ec6  3606           PSHU  B A                         
  2ec8  FC70DE         LDD 0x70de                        
  2ecb  3606           PSHU  B A                         
  2ecd  AD9FFCEA       JSR [0xfcea]                      
  2ed1  3706           PULU  A B                         
  2ed3  C30005         ADDD #0x5                         
  2ed6  FD7126         STD 0x7126                        
  2ed9  CC000A         LDD #0xa                          
  2edc  AD9FFD20       JSR [0xfd20]                      
  2ee0  108E0342       LDY #0x342                        
  2ee4  FC7126         LDD 0x7126                        
  2ee7  AD9FFD2E       JSR [0xfd2e]                      
  2eeb  FC7132         LDD 0x7132                        
  2eee  10830000       CMPD #0x0                         
  2ef2  10270026       LBEQ 0x2f1c                       
  2ef6  CC000A         LDD #0xa                          
  2ef9  AD9FFD20       JSR [0xfd20]                      
  2efd  108E0241       LDY #0x241                        
  2f01  FC70C4         LDD 0x70c4                        
  2f04  AD9FFD2E       JSR [0xfd2e]                      
  2f08  CC000A         LDD #0xa                          
  2f0b  AD9FFD20       JSR [0xfd20]                      
  2f0f  108E0141       LDY #0x141                        
  2f13  FC70BE         LDD 0x70be                        
  2f16  AD9FFD2E       JSR [0xfd2e]                      
  2f1a  2012           BRA 0x2f2e                        
LAB_M65_small_00000__2f1c:
  2f1c  CC000A         LDD #0xa                          
  2f1f  AD9FFD20       JSR [0xfd20]                      
  2f23  108E0341       LDY #0x341                        
  2f27  FC70C4         LDD 0x70c4                        
  2f2a  AD9FFD2E       JSR [0xfd2e]                      
LAB_M65_small_00000__2f2e:
  2f2e  FC70B0         LDD 0x70b0                        
  2f31  B470AE         ANDA 0x70ae                       
  2f34  F470AE         ANDB 0x70ae                       
  2f37  FD70AE         STD 0x70ae                        
  2f3a  CC0000         LDD #0x0                          
  2f3d  FD70F2         STD 0x70f2                        
  2f40  3576           PULS  A B X Y U                   
  2f42  39             RTS                               

; ---- function FUN_M65_small_00000__2f43
FUN_M65_small_00000__2f43:
  2f43  3437           PSHS  Y X B A CC                  
  2f45  3706           PULU  A B                         
  2f47  FD70E2         STD 0x70e2                        
  2f4a  3706           PULU  A B                         
  2f4c  FD70E4         STD 0x70e4                        
  2f4f  FC70E4         LDD 0x70e4                        
  2f52  C30018         ADDD #0x18                        
  2f55  58             LSLB                              
  2f56  49             ROLA                              
  2f57  F3600D         ADDD 0x600d                       
  2f5a  C32FC1         ADDD #0x2fc1                      
  2f5d  1F01           TFR D,X                           
  2f5f  FC70E2         LDD 0x70e2                        
  2f62  FD70E0         STD 0x70e0                        
  2f65  2E08           BGT 0x2f6f                        
  2f67  CC0000         LDD #0x0                          
  2f6a  B370E0         SUBD 0x70e0                       
  2f6d  2008           BRA 0x2f77                        
LAB_M65_small_00000__2f6f:
  2f6f  CC0064         LDD #0x64                         
  2f72  B370E0         SUBD 0x70e0                       
  2f75  3002           LEAX 0x2,X                        
LAB_M65_small_00000__2f77:
  2f77  58             LSLB                              
  2f78  49             ROLA                              
  2f79  F3600D         ADDD 0x600d                       
  2f7c  C3305B         ADDD #0x305b                      
  2f7f  1F02           TFR D,Y                           
  2f81  EC84           LDD ,X                            
  2f83  3606           PSHU  B A                         
  2f85  ECA4           LDD ,Y                            
  2f87  3606           PSHU  B A                         
  2f89  AD9FFCF2       JSR [0xfcf2]                      
  2f8d  3083           LEAX ,--X                         
  2f8f  FC70E0         LDD 0x70e0                        
  2f92  2E03           BGT 0x2f97                        
  2f94  C30064         ADDD #0x64                        
LAB_M65_small_00000__2f97:
  2f97  58             LSLB                              
  2f98  49             ROLA                              
  2f99  F3600D         ADDD 0x600d                       
  2f9c  C3305B         ADDD #0x305b                      
  2f9f  1F02           TFR D,Y                           
  2fa1  EC89004E       LDD 0x4e,X                        
  2fa5  3606           PSHU  B A                         
  2fa7  ECA4           LDD ,Y                            
  2fa9  3606           PSHU  B A                         
  2fab  AD9FFCF2       JSR [0xfcf2]                      
  2faf  3706           PULU  A B                         
  2fb1  FD70DE         STD 0x70de                        
  2fb4  CC1000         LDD #0x1000                       
  2fb7  B370DE         SUBD 0x70de                       
  2fba  3606           PSHU  B A                         
  2fbc  3537           PULS CC A B X Y                   
  2fbe  39             RTS                               
  2fbf  .db 00 EC                                            ; ..
DAT_M65_small_00000__2fc1:
  2fc1  00             ?? 00h                            
  2fc2  .db FA                                               ; .
DAT_M65_small_00000__2fc3:
  2fc3  01             ?? 01h                            
  2fc4  .db 09 01 19 01 29 01 3B 01 4E 01 62 01 77 01 8D 01  ; ....).;.N.b.w...
  2fd4  .db A4 01 BD 01 D8 01 F4 02 12 02 31 02 53 02 76 02  ; ..........1.S.v.
  2fe4  .db 9B 02 C3 02 ED 03 1A 03 49 03 7B 03 B0 03 E8 04  ; ........I.{.....
  2ff4  .db 23 04 62 04 A5 04 EC 05 37 05 86 05 DA 06 33 06  ; #.b.....7.....3.
  3004  .db 92 06 F6 07 60 07 D0 08 47                       ; ....`...G
DAT_M65_small_00000__300d:
  300d  0D             ?? 0Dh                            
  300e  .db C5 0D 00 0C 45 0B 95 0A EF 0A 51 09 BD 09 31 08  ; ....E.....Q...1.
  301e  .db AD 08 31 07 BB 07 4C 06 E3 06 80 06 23 05 CA 05  ; ..1...L.....#...
  302e  .db 77 05 29 04 DF 04 99 04 57 04 18 03 DD 03 A6 03  ; w.).....W.......
  303e  .db 71 03 40 03 11 02 E5 02 BC 02 94 02 6F 02 4C 02  ; q.@.........o.L.
  304e  .db 2B 02 0C 01 EF 01 D3 01 B9 01 A0 01 88           ; +............
DAT_M65_small_00000__305b:
  305b  7F             ?? 7Fh                           
  305c  .db FF 7F EC 7F D9 7F C6 7F B3 7F A0 7F 8D 7F 7A 7F  ; ..............z.
  306c  .db 67 7F 55 7F 42 7F 39 7F 1C 7F 09 7E F7 7E E4 7E  ; g.U.B.9....~.~.~
  307c  .db D1 7E BE 7E AC 7E 99 7E 86 7E 73 7E 61 7E 4E 7E  ; .~.~.~.~.~s~a~N~
  308c  .db 3B 7E 29 7E 16 7E 03 7D F1 7D DE 7D CC 7D B9 7D  ; ;~)~.~.}.}.}.}.}
  309c  .db A6 7D 94 7D 81 7D 6F 7D 52 7D 4A 7D 37 7D 25 7D  ; .}.}.}o}R}J}7}%}
  30ac  .db 12 7D 00 7C ED 7C DB 7C C8 7C B6 7C A3 7C 91 7C  ; .}.|.|.|.|.|.|.|
  30bc  .db 7E 7C 6C 7C 5A 7C 48 7C 35 7C 23 7C 11 7B FE 7B  ; ~|l|Z|H|5|#|.{.{
  30cc  .db EC 7B DA 7B C7 7B B5 7B A3 7B 90 7B 7E 7B 6C 7B  ; .{.{.{.{.{.{~{l{
  30dc  .db 5A 7B 47 7B 35 7B 23 7B 11 7A FF 7A EC 7A DA 7A  ; Z{G{5{#{.z.z.z.z
  30ec  .db C8 7A B6 7A A4 7A 92 7A 7F 7A 6D 7A 5B 7A 49 7A  ; .z.z.z.z.zmz[zIz
  30fc  .db 37 7A 25 7A 13 7A 01 79 EF 79 DD 79 CB 79 B9 79  ; 7z%z.z.y.y.y.y.y
  310c  .db A7 79 95 79 83 79 71 79 5F 79 4D 79 3B 79 29 79  ; .y.y.yqy_yMy;y)y
  311c  .db 17 79 05 78 F3 78 E2 78 D0 78 BE 00 00 01 F4 00  ; .y.x.x.x.x......
  312c  .db 00 02 3F 00 32 02 BC 00 96 03 52 01 2C 03 CF 01  ; ..?.2.....R.,...
  313c  .db C2 04 E2 02 58 06 0E 03 84 07 3A 04 B0 09 2E 06  ; ....X.....:.....
  314c  .db 40 0C 1C 08 34 0F 3C 0F A0 13 EC 00 00 01 2C 00  ; @...4.<.......,.
  315c  .db 00 01 5E 00 32 01 C2 00 64 02 0D 00 AF 02 3F 00  ; ..^.2...d.....?.
  316c  .db FA 02 EE 01 5E 03 E8 01 C2 04 B0 02 8A 06 0E 03  ; ....^...........
  317c  .db 20 08 34 04 4C 0A 8C 08 66 0E 10 00 00 00 AF 00  ;  .4.L...f.......
  318c  .db 00 00 AF 00 32 00 E1 00 32 01 2C 00 64 01 90 00  ; ....2...2.,.d...
  319c  .db 96 02 0D 00 AF 02 BC 00 FA 03 52 01 5E 04 4C 01  ; ..........R.^.L.
  31ac  .db 90 06 0E 02 26 07 E9 04 1A 0A BE 00 00 00 AF 00  ; ....&...........
  31bc  .db 00 00 E1 00 00 00 E1 00 32 01 13 00 4B 01 13 00  ; ........2...K...
  31cc  .db 64 01 90 00 7D 02 3F 00 AF 02 A3 00 C8 03 52 00  ; d...}.?.......R.
  31dc  .db FA 04 FB 01 2C 06 8B 02 58 08 FC 00 00 00 64 00  ; ....,...X.....d.
  31ec  .db 00 00 7D 00 00 00 7D 00 00 00 AF 00 00 00 AF 00  ; ..}...}.........
  31fc  .db 00 01 13 00 00 01 90 00 32 01 F4 00 4B 02 A3 00  ; ........2...K...
  320c  .db 64 04 1A 00 7D 05 78 00 FA 07 D0 38 20 48 7A 39  ; d...}.x....8 Hz9
  321c  .db 20 48 7A 39 20 48 7A 31 30 48 7A 31 30 48 7A 31  ;  Hz9 Hz10Hz10Hz1
  322c  .db 31 48 7A 31 32 48 7A 31 32 48 7A 31 33 48 7A 31  ; 1Hz12Hz12Hz13Hz1
  323c  .db 34 48 7A 31 34 48 7A 31 35 48 7A 43 30 20 20 43  ; 4Hz14Hz15HzC0  C
  324c  .db 30 23 20 44 30 20 20 44 30 23 20 45 30 20 20 46  ; 0# D0  D0# E0  F
  325c  .db 30 20 20 46 30 23 20 47 30 20 20 47 30 23 20 41  ; 0  F0# G0  G0# A
  326c  .db 30 20 20 41 30 23 20 42 30 20 20 43 31 20 20 43  ; 0  A0# B0  C1  C
  327c  .db 31 23 20 44 31 20 20 44 31 23 20 45 31 20 20 46  ; 1# D1  D1# E1  F
  328c  .db 31 20 20 46 31 23 20 47 31 20 20 47 31 23 20 41  ; 1  F1# G1  G1# A
  329c  .db 31 20 20 41 31 23 20 42 31 20 20 43 32 20 20 43  ; 1  A1# B1  C2  C
  32ac  .db 32 23 20 44 32 20 20 44 32 23 20 45 32 20 20 46  ; 2# D2  D2# E2  F
  32bc  .db 32 20 20 46 32 23 20 47 32 20 20 47 32 23 20 41  ; 2  F2# G2  G2# A
  32cc  .db 32 20 20 41 32 23 20 42 32 20 20 43 33 20 20 43  ; 2  A2# B2  C3  C
  32dc  .db 33 23 20 44 33 20 20 44 33 23 20 45 33 20 20 46  ; 3# D3  D3# E3  F
  32ec  .db 33 20 20 46 33 23 20 47 33 20 20 47 33 23 20 41  ; 3  F3# G3  G3# A
  32fc  .db 33 20 20 41 33 23 20 42 33 20 20 43 34 20 20 43  ; 3  A3# B3  C4  C
  330c  .db 34 23 20 44 34 20 20 44 34 23 20 45 34 20 20 46  ; 4# D4  D4# E4  F
  331c  .db 34 20 20 46 34 23 20 47 34 20 20 47 34 23 20 41  ; 4  F4# G4  G4# A
  332c  .db 34 20 20 41 34 23 20 42 34 20 20 43 35 20 20 43  ; 4  A4# B4  C5  C
  333c  .db 35 23 20 44 35 20 20 44 35 23 20 45 35 20 20 46  ; 5# D5  D5# E5  F
  334c  .db 35 20 20 46 35 23 20 47 35 20 20 47 35 23 20 41  ; 5  F5# G5  G5# A
  335c  .db 35 20 20 41 35 23 20 42 35 20 20 43 36 20 20 43  ; 5  A5# B5  C6  C
  336c  .db 36 23 20 44 36 20 20 44 36 23 20 45 36 20 20 46  ; 6# D6  D6# E6  F
  337c  .db 36 20 20 46 36 23 20 47 36 20 20 47 36 23 20 41  ; 6  F6# G6  G6# A
  338c  .db 36 20 20 41 36 23 20 42 36 20 20 43 37 20 20 43  ; 6  A6# B6  C7  C
  339c  .db 37 23 20 44 37 20 20 44 37 23 20 45 37 20 20 46  ; 7# D7  D7# E7  F
  33ac  .db 37 20 20 46 37 23 20 47 37 20 20 47 37 23 20 41  ; 7  F7# G7  G7# A
  33bc  .db 37 20 20 41 37 23 20 42 37 20 20 01 3F 01 2D 01  ; 7  A7# B7  .?.-.
  33cc  .db 1C 01 0C 00 FD 00 EF 00 E1 00 D5 00 C9 00 BE 00  ; ................
  33dc  .db B3 00 A9 00 A0 00 97 00 8E 00 86 00 7F 00 78 00  ; ..............x.
  33ec  .db 71 00 6B 00 65 00 5F 00 5A 00 55 00 50 00 4C 00  ; q.k.e._.Z.U.P.L.
  33fc  .db 47 00 43 00 40 00 3C 00 39 00 36 00 33 00 30 00  ; G.C.@.<.9.6.3.0.
  340c  .db 2D 00 2B 00 28 00 26 00 24 00 22 00 20 00 1E 00  ; -.+.(.&.$.". ...
  341c  .db 1D 00 1B 00 1A 00 18 00 17 00 16 00 14 00 13 00  ; ................
  342c  .db 12 00 11 00 10 00 0F 00 0F 00 0E 00 0D 00 0C 00  ; ................
  343c  .db 0C 00 0B 78 CF 86 D8 00 16 00 2C 00 16 71 57 8D  ; ...x......,..qW.
  344c  .db 52 00 56 00 AC 00 56 61 AD 99 39 01 46 02 8C 01  ; R.V...Va..9.F...
  345c  .db 46 40 10 AD 4B 04 A9 09 52 04 A9                 ; F@..K...R..

;; Module 66 parameter/preset table "DUAL SHIFT", 93 bytes
MODULE_66_TABLE_DUAL_SHIFT_hdr:
  3467  660000650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_66_TABLE_DUAL_SHIFT:
  346f  66             ?? 66h    f                       
  3470  .db 01                                               ; .
  3471  4455414C2053.. ds "DUAL SHIFT     "              
  3484  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3494  .db 00 00 00 00 02 BC 32 00 00 19 00 80 00 00 00 64  ; ......2........d
  34a4  .db 00 64 00 64 0C 02 FF 5E 04 B0 32 00 00 19 00 80  ; .d.d...^..2.....
  34b4  .db 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00 00  ; ...d.d.d........
  34c4  .db 00 00 00 00 00 00 00 00                          ; ........

;; Module 66 code record 01, 152 bytes, entered at payload start
MODULE_66_01_CODE_hdr:
  34cc  660100A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_66_01_entry
MODULE_66_01_entry:
  34d4  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $34D8
  34d8  34D8           dw 34D8h                          
LAB_M65_small_00000__34da:
  34da  3477           PSHS  U Y X B A CC                
  34dc  17CB31         LBSR 0x0010                       
  34df  AD9FFC54       JSR [0xfc54]                      
  34e3  C602           LDB #0x2                          
  34e5  AD9FFC58       JSR [0xfc58]                      
  34e9  C601           LDB #0x1                          
  34eb  8E0410         LDX #0x410                        
  34ee  AD9FFD30       JSR [0xfd30]                      
  34f2  1026D270       LBNE 0x0766                       
  34f6  C602           LDB #0x2                          
  34f8  8E0411         LDX #0x411                        
  34fb  AD9FFD30       JSR [0xfd30]                      
  34ff  1026D263       LBNE 0x0766                       
  3503  C603           LDB #0x3                          
  3505  8E0012         LDX #0x12                         
  3508  AD9FFD30       JSR [0xfd30]                      
  350c  1026D256       LBNE 0x0766                       
  3510  C603           LDB #0x3                          
  3512  8E0412         LDX #0x412                        
  3515  AD9FFD30       JSR [0xfd30]                      
  3519  1026D249       LBNE 0x0766                       
  351d  CC0000         LDD #0x0                          
  3520  FD7136         STD 0x7136                        
  3523  CCFFFF         LDD #0xffff                       
  3526  FD7132         STD 0x7132                        
  3529  FD7134         STD 0x7134                        
  352c  FD713A         STD 0x713a                        
  352f  CC0001         LDD #0x1                          
  3532  FD7138         STD 0x7138                        
  3535  17CC6D         LBSR 0x01a5                       
  3538  CC0BB8         LDD #0xbb8                        
  353b  FD7120         STD 0x7120                        
  353e  CC0064         LDD #0x64                         
  3541  FD70AC         STD 0x70ac                        
  3544  17D9BD         LBSR 0x0f04                       
  3547  17DBDC         LBSR 0x1126                       
  354a  17DD1F         LBSR 0x126c                       
  354d  17DEB2         LBSR 0x1402                       
  3550  AD9FFC56       JSR [0xfc56]                      
  3554  AD9FFDF6       JSR [0xfdf6]                      
  3558  17D241         LBSR 0x079c                       
  355b  AD9FFE10       JSR [0xfe10]                      
  355f  17CD76         LBSR 0x02d8                       
  3562  CC4E20         LDD #0x4e20                       
  3565  AD9FFD20       JSR [0xfd20]                      
  3569  3577           PULS CC A B X Y U                 
  356b  39             RTS                               

;; Module 65 parameter/preset table "LAYERED SHIFT", 93 bytes
MODULE_65_TABLE_LAYERED_SHIFT_hdr:
  356c  650000650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_65_TABLE_LAYERED_SHIFT:
  3574  65             ?? 65h    e                       
  3575  .db 01                                               ; .
  3576  4C4159455245.. ds "LAYERED SHIFT  "              
  3588  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3598  .db 00 00 00 00 00 FF F4 32 00 00 19 00 80 00 00 00  ; .......2........
  35a8  .db 64 00 64 00 64 0C 02 FF 5E 00 0C 32 00 00 19 00  ; d.d.d...^..2....
  35b8  .db 80 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00  ; ....d.d.d.......
  35c8  .db 00 00 00 00 00 00 00 00 00                       ; .........

;; Module 65 code record 01, 152 bytes, entered at payload start
MODULE_65_01_CODE_hdr:
  35d1  650100A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_65_01_entry
MODULE_65_01_entry:
  35d9  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $35DD
  35dd  35DD           dw 35DDh                          
LAB_M65_small_00000__35df:
  35df  3477           PSHS  U Y X B A CC                
  35e1  17CA2C         LBSR 0x0010                       
  35e4  AD9FFC54       JSR [0xfc54]                      
  35e8  C602           LDB #0x2                          
  35ea  AD9FFC58       JSR [0xfc58]                      
  35ee  C601           LDB #0x1                          
  35f0  8E0410         LDX #0x410                        
  35f3  AD9FFD30       JSR [0xfd30]                      
  35f7  1026D16B       LBNE 0x0766                       
  35fb  C602           LDB #0x2                          
  35fd  8E0411         LDX #0x411                        
  3600  AD9FFD30       JSR [0xfd30]                      
  3604  1026D15E       LBNE 0x0766                       
  3608  C603           LDB #0x3                          
  360a  8E0012         LDX #0x12                         
  360d  AD9FFD30       JSR [0xfd30]                      
  3611  1026D151       LBNE 0x0766                       
  3615  C603           LDB #0x3                          
  3617  8E0412         LDX #0x412                        
  361a  AD9FFD30       JSR [0xfd30]                      
  361e  1026D144       LBNE 0x0766                       
  3622  CC0000         LDD #0x0                          
  3625  FD7134         STD 0x7134                        
  3628  CCFFFF         LDD #0xffff                       
  362b  FD7132         STD 0x7132                        
  362e  FD7136         STD 0x7136                        
  3631  FD713A         STD 0x713a                        
  3634  CC0001         LDD #0x1                          
  3637  FD7138         STD 0x7138                        
  363a  CC0064         LDD #0x64                         
  363d  FD70AC         STD 0x70ac                        
  3640  CC0BB8         LDD #0xbb8                        
  3643  FD7120         STD 0x7120                        
  3646  17CB5C         LBSR 0x01a5                       
  3649  17D8B8         LBSR 0x0f04                       
  364c  17DAD7         LBSR 0x1126                       
  364f  17DC1A         LBSR 0x126c                       
  3652  17DDAD         LBSR 0x1402                       
  3655  AD9FFC56       JSR [0xfc56]                      
  3659  AD9FFDF6       JSR [0xfdf6]                      
  365d  17D13C         LBSR 0x079c                       
  3660  AD9FFE10       JSR [0xfe10]                      
  3664  17CC71         LBSR 0x02d8                       
  3667  CC4E20         LDD #0x4e20                       
  366a  AD9FFD20       JSR [0xfd20]                      
  366e  3577           PULS CC A B X Y U                 
  3670  39             RTS                               

;; Module 67 parameter/preset table "STEREO SHIFT", 61 bytes
MODULE_67_TABLE_STEREO_SHIFT_hdr:
  3671  670000450000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_67_TABLE_STEREO_SHIFT:
  3679  67             ?? 67h    g                       
  367a  .db 01                                               ; .
  367b  53544552454F.. ds "STEREO SHIFT   "              
  368c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  369c  .db 00 00 00 00 00 00 02 BC 32 00 00 19 00 80 00 00  ; ........2.......
  36ac  .db 00 64 00 64 00 64 0C 02 00 5A                    ; .d.d.d...Z

;; Module 67 code record 01, 152 bytes, entered at payload start
MODULE_67_01_CODE_hdr:
  36b6  670100A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_67_01_entry
MODULE_67_01_entry:
  36be  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $36C2
  36c2  36C2           dw 36C2h                          
LAB_M65_small_00000__36c4:
  36c4  3477           PSHS  U Y X B A CC                
  36c6  17C947         LBSR 0x0010                       
  36c9  AD9FFC54       JSR [0xfc54]                      
  36cd  C601           LDB #0x1                          
  36cf  AD9FFC58       JSR [0xfc58]                      
  36d3  C601           LDB #0x1                          
  36d5  8E0410         LDX #0x410                        
  36d8  AD9FFD30       JSR [0xfd30]                      
  36dc  1026D086       LBNE 0x0766                       
  36e0  C602           LDB #0x2                          
  36e2  8E0411         LDX #0x411                        
  36e5  AD9FFD30       JSR [0xfd30]                      
  36e9  1026D079       LBNE 0x0766                       
  36ed  C603           LDB #0x3                          
  36ef  8E0012         LDX #0x12                         
  36f2  AD9FFD30       JSR [0xfd30]                      
  36f6  1026D06C       LBNE 0x0766                       
  36fa  C603           LDB #0x3                          
  36fc  8E0212         LDX #0x212                        
  36ff  AD9FFD30       JSR [0xfd30]                      
  3703  1026D05F       LBNE 0x0766                       
  3707  CC0000         LDD #0x0                          
  370a  FD7132         STD 0x7132                        
  370d  CCFFFF         LDD #0xffff                       
  3710  FD7136         STD 0x7136                        
  3713  FD7134         STD 0x7134                        
  3716  FD713A         STD 0x713a                        
  3719  CC0001         LDD #0x1                          
  371c  FD7138         STD 0x7138                        
  371f  CC0064         LDD #0x64                         
  3722  FD70AC         STD 0x70ac                        
  3725  CC05DC         LDD #0x5dc                        
  3728  FD7120         STD 0x7120                        
  372b  17CA77         LBSR 0x01a5                       
  372e  17D9F5         LBSR 0x1126                       
  3731  17DCCE         LBSR 0x1402                       
  3734  17EBFD         LBSR 0x2334                       
  3737  17EF4C         LBSR 0x2686                       
  373a  AD9FFC56       JSR [0xfc56]                      
  373e  AD9FFDF6       JSR [0xfdf6]                      
  3742  17D146         LBSR 0x088b                       
  3745  AD9FFE10       JSR [0xfe10]                      
  3749  17CCD8         LBSR 0x0424                       
  374c  CC4E20         LDD #0x4e20                       
  374f  AD9FFD20       JSR [0xfd20]                      
  3753  3577           PULS CC A B X Y U                 
  3755  39             RTS                               

;; Module 68 parameter/preset table "REVERSE SHIFT", 93 bytes
MODULE_68_TABLE_REVERSE_SHIFT_hdr:
  3756  680000650000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_68_TABLE_REVERSE_SHIFT:
  375e  68             ?? 68h    h                       
  375f  .db 01                                               ; .
  3760  524556455253.. ds "REVERSE SHIFT  "              
  3770  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3780  .db 00 00 00 00 00 00 00 00 00 32 00 05 78 00 80 00  ; .........2..x...
  3790  .db 00 00 64 00 64 00 64 00 00 00 00 00 00 32 00 05  ; ..d.d.d......2..
  37a0  .db 77 00 80 00 00 00 64 00 64 00 64 00 00 00 00 00  ; w.....d.d.d.....
  37b0  .db 00 00 00 00 00 00 00 00 00 00 00                 ; ...........

;; Module 68 code record 01, 145 bytes, entered at payload start
MODULE_68_01_CODE_hdr:
  37bb  680100990000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_68_01_entry
MODULE_68_01_entry:
  37c3  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $37C7
  37c7  37C7           dw 37C7h                          
LAB_M65_small_00000__37c9:
  37c9  3477           PSHS  U Y X B A CC                
  37cb  17C842         LBSR 0x0010                       
  37ce  AD9FFC54       JSR [0xfc54]                      
  37d2  C602           LDB #0x2                          
  37d4  AD9FFC58       JSR [0xfc58]                      
  37d8  C601           LDB #0x1                          
  37da  8E0810         LDX #0x810                        
  37dd  AD9FFD30       JSR [0xfd30]                      
  37e1  1026CF81       LBNE 0x0766                       
  37e5  C602           LDB #0x2                          
  37e7  8E0811         LDX #0x811                        
  37ea  AD9FFD30       JSR [0xfd30]                      
  37ee  1026CF74       LBNE 0x0766                       
  37f2  C603           LDB #0x3                          
  37f4  8E0812         LDX #0x812                        
  37f7  AD9FFD30       JSR [0xfd30]                      
  37fb  1026CF67       LBNE 0x0766                       
  37ff  CC0000         LDD #0x0                          
  3802  FD7136         STD 0x7136                        
  3805  CCFFFF         LDD #0xffff                       
  3808  FD7132         STD 0x7132                        
  380b  FD7134         STD 0x7134                        
  380e  FD713A         STD 0x713a                        
  3811  CCFFFF         LDD #0xffff                       
  3814  FD7138         STD 0x7138                        
  3817  CCFFF6         LDD #0xfff6                       
  381a  FD713E         STD 0x713e                        
  381d  CC0DAC         LDD #0xdac                        
  3820  FD7140         STD 0x7140                        
  3823  17C97F         LBSR 0x01a5                       
  3826  17D6DB         LBSR 0x0f04                       
  3829  17D8FA         LBSR 0x1126                       
  382c  17DA3D         LBSR 0x126c                       
  382f  17DBD0         LBSR 0x1402                       
  3832  17DD33         LBSR 0x1568                       
  3835  17DE78         LBSR 0x16b0                       
  3838  AD9FFC56       JSR [0xfc56]                      
  383c  AD9FFDF6       JSR [0xfdf6]                      
  3840  17D128         LBSR 0x096b                       
  3843  AD9FFE10       JSR [0xfe10]                      
  3847  17CCAF         LBSR 0x04f9                       
  384a  CC4E20         LDD #0x4e20                       
  384d  AD9FFD20       JSR [0xfd20]                      
  3851  3577           PULS CC A B X Y U                 
  3853  39             RTS                               

;; Module 64 parameter/preset table "DIATONIC SHIFT", 132 bytes
MODULE_64_TABLE_DIATONIC_SHIFT_hdr:
  3854  6400008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_64_TABLE_DIATONIC_SHIFT:
  385c  64             ?? 64h    d                       
  385d  .db 01                                               ; .
  385e  444941544F4E.. ds "DIATONIC SHIFT "              
  3870  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3880  .db 00 00 00 00 00 09 0B 00 00 00 19 00 80 00 00 00  ; ................
  3890  .db 64 00 64 00 64 0C 02 FF 46 00 00 00 00 00 00 00  ; d.d.d...F.......
  38a0  .db 00 00 00 00 64 00 64 00 64 00 00 00 00 00 00 00  ; ....d.d.d.......
  38b0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  38c0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  38d0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF  ; ................

;; Module 64 code record 01, 173 bytes, entered at payload start
MODULE_64_01_CODE_hdr:
  38e0  640100B50000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_64_01_entry
MODULE_64_01_entry:
  38e8  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $38EC
  38ec  38EC           dw 38ECh                          
LAB_M65_small_00000__38ee:
  38ee  3477           PSHS  U Y X B A CC                
  38f0  17C71D         LBSR 0x0010                       
  38f3  AD9FFC54       JSR [0xfc54]                      
  38f7  C602           LDB #0x2                          
  38f9  AD9FFC58       JSR [0xfc58]                      
  38fd  C601           LDB #0x1                          
  38ff  8E0410         LDX #0x410                        
  3902  AD9FFD30       JSR [0xfd30]                      
  3906  1026CE5C       LBNE 0x0766                       
  390a  C602           LDB #0x2                          
  390c  8E0411         LDX #0x411                        
  390f  AD9FFD30       JSR [0xfd30]                      
  3913  1026CE4F       LBNE 0x0766                       
  3917  C603           LDB #0x3                          
  3919  8E0012         LDX #0x12                         
  391c  AD9FFD30       JSR [0xfd30]                      
  3920  1026CE42       LBNE 0x0766                       
  3924  C603           LDB #0x3                          
  3926  8E0312         LDX #0x312                        
  3929  AD9FFD30       JSR [0xfd30]                      
  392d  1026CE35       LBNE 0x0766                       
  3931  CC0000         LDD #0x0                          
  3934  FD713A         STD 0x713a                        
  3937  CCFFFF         LDD #0xffff                       
  393a  FD7132         STD 0x7132                        
  393d  FD7136         STD 0x7136                        
  3940  FD7134         STD 0x7134                        
  3943  CC0001         LDD #0x1                          
  3946  FD7138         STD 0x7138                        
  3949  CC0064         LDD #0x64                         
  394c  FD70AC         STD 0x70ac                        
  394f  CC0BB8         LDD #0xbb8                        
  3952  FD7120         STD 0x7120                        
  3955  CC0003         LDD #0x3                          
  3958  FD711C         STD 0x711c                        
  395b  17C847         LBSR 0x01a5                       
  395e  17DE73         LBSR 0x17d4                       
  3961  17E0C1         LBSR 0x1a25                       
  3964  17E1A9         LBSR 0x1b10                       
  3967  17D432         LBSR 0x0d9c                       
  396a  CC1E3D         LDD #0x1e3d                       
  396d  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $600F
  3971  600F           addr 600f                         
LAB_M65_small_00000__3973:
  3973  17DA8C         LBSR 0x1402                       
  3976  AD9FFC56       JSR [0xfc56]                      
  397a  AD9FFDF6       JSR [0xfdf6]                      
  397e  17D0F5         LBSR 0x0a76                       
  3981  AD9FFE12       JSR [0xfe12]                      
  3985  17D080         LBSR 0x0a08                       
  3988  17CC7D         LBSR 0x0608                       
  398b  CC4E20         LDD #0x4e20                       
  398e  AD9FFD20       JSR [0xfd20]                      
  3992  3577           PULS CC A B X Y U                 
  3994  39             RTS                               

;; Preset 036 "CIRCLES" (algorithm 6C01), 152 bytes
PRESET_036_CIRCLES_hdr:
  3995  C83600A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_036_CIRCLES:
  399d  6C             ?? 6Ch    l                       
  399e  .db 01                                               ; .
  399f  434952434C45.. ds "CIRCLES        "              
  39b0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  39c0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  39d0  .db 00 00 00 64 00 64 00 28 00 00 00 00 00 64 00 64  ; ...d.d.(.....d.d
  39e0  .db 00 00 00 00 00 00 00 00 00 00 00 64 00 C8 00 00  ; ...........d....
  39f0  .db 00 08 FC 08 FC 08 FC 08 FC 08 FC 08 FC 00 00 00  ; ................
  3a00  .db 00 00 00 00 00 00 00 03 52 03 E8 03 E8 03 52 02  ; ........R.....R.
  3a10  .db 26 02 26 00 00 00 00 00 00 00 00 00 00 00 00 F5  ; &.&.............
  3a20  .db FC 04 0B 04 FC 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3a30  .db 00 00 00 00 07                                   ; .....

;; Preset 037 "GENERIC HALL" (algorithm 6C01), 152 bytes
PRESET_037_GENERIC_HALL_hdr:
  3a35  C83700A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_037_GENERIC_HALL:
  3a3d  6C             ?? 6Ch    l                       
  3a3e  .db 01                                               ; .
  3a3f  47454E455249.. ds "GENERIC HALL   "              
  3a50  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3a60  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3a70  .db 00 00 00 64 00 64 00 3C 00 00 00 36 00 14 00 64  ; ...d.d.<...6...d
  3a80  .db 00 00 00 00 00 00 00 00 00 32 00 64 00 C8 00 02  ; .........2.d....
  3a90  .db 45 02 51 03 79 01 C4 02 EB 01 E5 02 FF 02 6B 02  ; E.Q.y.........k.
  3aa0  .db 6D 04 2C 02 87 01 DD 03 84 03 20 02 BC 03 84 02  ; m.,....... .....
  3ab0  .db 94 02 BC 02 58 01 F4 02 58 02 A8 02 58 01 E0 00  ; ....X...X...X...
  3ac0  .db FF 02 FD 04 FB 06 F9 08 F7 0A F5 00 62 00 2A 00  ; ............b.*.
  3ad0  .db 67 00 91 00 0C                                   ; g....

;; Preset 039 "MIDI 3 ON 2" (algorithm 6E01), 83 bytes
PRESET_039_MIDI_3_ON_2_hdr:
  3ad5  C839005B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_039_MIDI_3_ON_2:
  3add  6E             ?? 6Eh    n                       
  3ade  .db 01                                               ; .
  3adf  4D4944492033.. ds "MIDI 3 ON 2    "              
  3af0  .db 00 00 00 00 00 00 29 00 00 00 29 00 00 00 00 00  ; ......)...).....
  3b00  .db 00 00 00 00 00 00 00 00 04 00 FF CE 00 64 00 64  ; .............d.d
  3b10  .db 00 64 00 14 00 64 FF 00 00 00 00 00 00 00 00 00  ; .d...d..........
  3b20  .db 00 00 00 00 00 64 00 64 00 00 02 AB FF CE 00 64  ; .....d.d.......d

;; TMS32010 program 04 for DSP 1: 450 words loaded at $800 (written via bank latch $81)
DSPPROG_04_DSP1_hdr:
  3b30  0410038E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_04_DSP1:
  3b38  080068807F8B.. dw[451]                           

;; TMS32010 program 04 for DSP 3: 119 words loaded at $800 (written via bank latch $83)
DSPPROG_04_DSP3_hdr:
  3ebe  041200F80000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_04_DSP3:
  3ec6  08007F8B6E00.. dw[120]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3fb6  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3fbe  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fce  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fde  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fee  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ffe  .db FF FF                                            ; ..
