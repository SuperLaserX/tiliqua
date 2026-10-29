; H3500  block M69_r4_24000  M69_r4_24000::0000-M69_r4_24000::3fff
; Bank r4_24000 (module id 69, sub 02)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 69 code record 02, 12811 bytes, entered at payload start
MODULE_69_02_CODE_hdr:
  0008  690232130000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_69_02_entry
MODULE_69_02_entry:
  0010  3476           PSHS  U Y X B A                   
  0012  CC0000         LDD #0x0                          
  0015  AD9FFC6C       JSR [0xfc6c]                      
  0019  AD9FFC74       JSR [0xfc74]                      
  001d  17266D         LBSR 0x268d                       
  0020  1726E5         LBSR 0x2708                       
  0023  17275D         LBSR 0x2783                       
  0026  1727D5         LBSR 0x27fe                       
  0029  3576           PULS  A B X Y U                   
  002b  39             RTS                               

; ---- function FUN_M69_r4_24000__002c
FUN_M69_r4_24000__002c:
  002c  3476           PSHS  U Y X B A                   
  002e  CC0000         LDD #0x0                          
  0031  FD7002         STD 0x7002                        
  0034  FD700A         STD 0x700a                        
  0037  FD7012         STD 0x7012                        
  003a  FD7032         STD 0x7032                        
  003d  FD704A         STD 0x704a                        
  0040  FD7042         STD 0x7042                        
  0043  FD7052         STD 0x7052                        
  0046  FD703A         STD 0x703a                        
  0049  FD7062         STD 0x7062                        
  004c  FD705A         STD 0x705a                        
  004f  FD70BE         STD 0x70be                        
  0052  FD70C6         STD 0x70c6                        
  0055  FD70CE         STD 0x70ce                        
  0058  FD70D6         STD 0x70d6                        
  005b  FD70DE         STD 0x70de                        
  005e  FD70E6         STD 0x70e6                        
  0061  FD701A         STD 0x701a                        
  0064  FD7020         STD 0x7020                        
  0067  FD7026         STD 0x7026                        
  006a  FD702C         STD 0x702c                        
  006d  3576           PULS  A B X Y U                   
  006f  39             RTS                               

; ---- function FUN_M69_r4_24000__0070
FUN_M69_r4_24000__0070:
  0070  3476           PSHS  U Y X B A                   
  0072  CCFFFF         LDD #0xffff                       
  0075  FD7068         STD 0x7068                        
  0078  CC0000         LDD #0x0                          
  007b  FD714A         STD 0x714a                        
  007e  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:18 1A:1E 1B:24 1C:2A
  0082  19             db 19h                            
  0083  18             db 18h                            
  0084  1A             db 1Ah                            
  0085  1E             db 1Eh                            
  0086  1B             db 1Bh                            
  0087  24             db 24h                            
  0088  1C             db 1Ch                            
  0089  2A             db 2Ah                            
  008a  00             db 0h                             
LAB_M69_r4_24000__008b:
  008b  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 42:72 41:70 75:B0 76:B2 77:B4 78:B6 79:B8 7A:BA
  008f  42             db 42h                            
  0090  72             db 72h                            
  0091  41             db 41h                            
  0092  70             db 70h                            
  0093  75             db 75h                            
  0094  B0             db B0h                            
  0095  76             db 76h                            
  0096  B2             db B2h                            
  0097  77             db 77h                            
  0098  B4             db B4h                            
  0099  78             db 78h                            
  009a  B6             db B6h                            
  009b  79             db 79h                            
  009c  B8             db B8h                            
  009d  7A             db 7Ah                            
  009e  BA             db BAh                            
  009f  00             db 0h                             
LAB_M69_r4_24000__00a0:
  00a0  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 69:98 6A:9A 6B:9C 6C:9E 6D:A0 6E:A2 6F:A4 70:A6 71:A8 72:AA 73:AC 74:AE
  00a4  69             db 69h                            
  00a5  98             db 98h                            
  00a6  6A             db 6Ah                            
  00a7  9A             db 9Ah                            
  00a8  6B             db 6Bh                            
  00a9  9C             db 9Ch                            
  00aa  6C             db 6Ch                            
  00ab  9E             db 9Eh                            
  00ac  6D             db 6Dh                            
  00ad  A0             db A0h                            
  00ae  6E             db 6Eh                            
  00af  A2             db A2h                            
  00b0  6F             db 6Fh                            
  00b1  A4             db A4h                            
  00b2  70             db 70h                            
  00b3  A6             db A6h                            
  00b4  71             db 71h                            
  00b5  A8             db A8h                            
  00b6  72             db 72h                            
  00b7  AA             db AAh                            
  00b8  73             db 73h                            
  00b9  AC             db ACh                            
  00ba  74             db 74h                            
  00bb  AE             db AEh                            
  00bc  00             db 0h                             
LAB_M69_r4_24000__00bd:
  00bd  AD9FFE06       JSR [0xfe06]                       ; inline[API_FE06]: 5D:74 5E:76 5F:78 60:7A 61:7C 62:7E 63:80 64:82 65:84 66:86 67:88 68:8A
  00c1  5D             db 5Dh                            
  00c2  74             db 74h                            
  00c3  5E             db 5Eh                            
  00c4  76             db 76h                            
  00c5  5F             db 5Fh                            
  00c6  78             db 78h                            
  00c7  60             db 60h                            
  00c8  7A             db 7Ah                            
  00c9  61             db 61h                            
  00ca  7C             db 7Ch                            
  00cb  62             db 62h                            
  00cc  7E             db 7Eh                            
  00cd  63             db 63h                            
  00ce  80             db 80h                            
  00cf  64             db 64h                            
  00d0  82             db 82h                            
  00d1  65             db 65h                            
  00d2  84             db 84h                            
  00d3  66             db 66h                            
  00d4  86             db 86h                            
  00d5  67             db 67h                            
  00d6  88             db 88h                            
  00d7  68             db 68h                            
  00d8  8A             db 8Ah                            
  00d9  00             db 0h                             
LAB_M69_r4_24000__00da:
  00da  AD9FFE06       JSR [0xfe06]                       ; inline[API_FE06]: 57:8C 58:8E 59:90 5A:92 5B:94 5C:96
  00de  57             db 57h                            
  00df  8C             db 8Ch                            
  00e0  58             db 58h                            
  00e1  8E             db 8Eh                            
  00e2  59             db 59h                            
  00e3  90             db 90h                            
  00e4  5A             db 5Ah                            
  00e5  92             db 92h                            
  00e6  5B             db 5Bh                            
  00e7  94             db 94h                            
  00e8  5C             db 5Ch                            
  00e9  96             db 96h                            
  00ea  00             db 0h                             
LAB_M69_r4_24000__00eb:
  00eb  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 35:DC 57:E4 37:E2 59:EA 39:00 39:08 4F:10 3B:06 3B:0E 51:16
  00ef  35             db 35h                            
  00f0  DC             db DCh                            
  00f1  57             db 57h                            
  00f2  E4             db E4h                            
  00f3  37             db 37h                            
  00f4  E2             db E2h                            
  00f5  59             db 59h                            
  00f6  EA             db EAh                            
  00f7  39             db 39h                            
  00f8  00             db 0h                             
  00f9  39             db 39h                            
  00fa  08             db 8h                             
  00fb  4F             db 4Fh                            
  00fc  10             db 10h                            
  00fd  3B             db 3Bh                            
  00fe  06             db 6h                             
  00ff  3B             db 3Bh                            
  0100  0E             db Eh                             
  0101  51             db 51h                            
  0102  16             db 16h                            
  0103  00             db 0h                             
LAB_M69_r4_24000__0104:
  0104  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 3D:38 7F:60 53:40 35:48 31:50 4F:30 7B:58 3F:3E 55:46 37:4E 33:56 7D:5E 51:36
  0108  3D             db 3Dh                            
  0109  38             db 38h                            
  010a  7F             db 7Fh                            
  010b  60             db 60h                            
  010c  53             db 53h                            
  010d  40             db 40h                            
  010e  35             db 35h                            
  010f  48             db 48h                            
  0110  31             db 31h                            
  0111  50             db 50h                            
  0112  4F             db 4Fh                            
  0113  30             db 30h                            
  0114  7B             db 7Bh                            
  0115  58             db 58h                            
  0116  3F             db 3Fh                            
  0117  3E             db 3Eh                            
  0118  55             db 55h                            
  0119  46             db 46h                            
  011a  37             db 37h                            
  011b  4E             db 4Eh                            
  011c  33             db 33h                            
  011d  56             db 56h                            
  011e  7D             db 7Dh                            
  011f  5E             db 5Eh                            
  0120  51             db 51h                            
  0121  36             db 36h                            
  0122  00             db 0h                             
LAB_M69_r4_24000__0123:
  0123  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 31:BC 31:C4 53:CC 33:C2 33:CA 55:D2 81:66
  0127  31             db 31h                            
  0128  BC             db BCh                            
  0129  31             db 31h                            
  012a  C4             db C4h                            
  012b  53             db 53h                            
  012c  CC             db CCh                            
  012d  33             db 33h                            
  012e  C2             db C2h                            
  012f  33             db 33h                            
  0130  CA             db CAh                            
  0131  55             db 55h                            
  0132  D2             db D2h                            
  0133  81             db 81h                            
  0134  66             db 66h                            
  0135  00             db 0h                             
LAB_M69_r4_24000__0136:
  0136  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 37:DA 35:D4
  013a  37             db 37h                            
  013b  DA             db DAh                            
  013c  35             db 35h                            
  013d  D4             db D4h                            
  013e  00             db 0h                             
LAB_M69_r4_24000__013f:
  013f  3576           PULS  A B X Y U                   
  0141  39             RTS                               

; ---- function FUN_M69_r4_24000__0142
FUN_M69_r4_24000__0142:
  0142  3476           PSHS  U Y X B A                   
  0144  1A40           ORCC #0x40                        
  0146  C600           LDB #0x0                          
  0148  AD9FFC58       JSR [0xfc58]                      
  014c  CC0000         LDD #0x0                          
  014f  FD7144         STD 0x7144                        
  0152  C601           LDB #0x1                          
  0154  8E1E10         LDX #0x1e10                       
  0157  AD9FFD30       JSR [0xfd30]                      
  015b  1026085C       LBNE 0x09bb                       
  015f  C602           LDB #0x2                          
  0161  8E1E11         LDX #0x1e11                       
  0164  AD9FFD30       JSR [0xfd30]                      
  0168  1026084F       LBNE 0x09bb                       
  016c  C603           LDB #0x3                          
  016e  8E1E12         LDX #0x1e12                       
  0171  AD9FFD30       JSR [0xfd30]                      
  0175  10260842       LBNE 0x09bb                       
  0179  AD9FFD7C       JSR [0xfd7c]                      
  017d  3576           PULS  A B X Y U                   
  017f  39             RTS                               

; ---- function FUN_M69_r4_24000__0180
FUN_M69_r4_24000__0180:
  0180  3476           PSHS  U Y X B A                   
  0182  1A40           ORCC #0x40                        
  0184  C600           LDB #0x0                          
  0186  AD9FFC58       JSR [0xfc58]                      
  018a  CCFFFF         LDD #0xffff                       
  018d  FD7144         STD 0x7144                        
  0190  C601           LDB #0x1                          
  0192  8E1410         LDX #0x1410                       
  0195  AD9FFD30       JSR [0xfd30]                      
  0199  1026081E       LBNE 0x09bb                       
  019d  C602           LDB #0x2                          
  019f  8E1411         LDX #0x1411                       
  01a2  AD9FFD30       JSR [0xfd30]                      
  01a6  10260811       LBNE 0x09bb                       
  01aa  C603           LDB #0x3                          
  01ac  8E1412         LDX #0x1412                       
  01af  AD9FFD30       JSR [0xfd30]                      
  01b3  10260804       LBNE 0x09bb                       
  01b7  AD9FFD7C       JSR [0xfd7c]                      
  01bb  3576           PULS  A B X Y U                   
  01bd  39             RTS                               

; ---- function FUN_M69_r4_24000__01be
FUN_M69_r4_24000__01be:
  01be  3406           PSHS  B A                         
  01c0  CC7FFF         LDD #0x7fff                       
  01c3  FD713A         STD 0x713a                        
  01c6  FD713C         STD 0x713c                        
  01c9  CC00C8         LDD #0xc8                         
  01cc  FD70A4         STD 0x70a4                        
  01cf  CC0000         LDD #0x0                          
  01d2  FD70A6         STD 0x70a6                        
  01d5  FD70A8         STD 0x70a8                        
  01d8  FD70AA         STD 0x70aa                        
  01db  FD70AC         STD 0x70ac                        
  01de  FD70AE         STD 0x70ae                        
  01e1  FD7074         STD 0x7074                        
  01e4  FD7080         STD 0x7080                        
  01e7  FD7098         STD 0x7098                        
  01ea  172DB1         LBSR 0x2f9e                       
  01ed  172D3A         LBSR 0x2f2a                       
  01f0  172E39         LBSR 0x302c                       
  01f3  3506           PULS  A B                         
  01f5  39             RTS                               

; ---- function FUN_M69_r4_24000__01f6
FUN_M69_r4_24000__01f6:
  01f6  3406           PSHS  B A                         
  01f8  CC7FFF         LDD #0x7fff                       
  01fb  FD713A         STD 0x713a                        
  01fe  FD713C         STD 0x713c                        
  0201  FD713E         STD 0x713e                        
  0204  CC0064         LDD #0x64                         
  0207  FD70A4         STD 0x70a4                        
  020a  FD70AA         STD 0x70aa                        
  020d  CC0000         LDD #0x0                          
  0210  FD70A6         STD 0x70a6                        
  0213  FD70A8         STD 0x70a8                        
  0216  FD70AC         STD 0x70ac                        
  0219  FD70AE         STD 0x70ae                        
  021c  FD7074         STD 0x7074                        
  021f  FD707A         STD 0x707a                        
  0222  FD7080         STD 0x7080                        
  0225  FD7086         STD 0x7086                        
  0228  CCFFF6         LDD #0xfff6                       
  022b  FD7098         STD 0x7098                        
  022e  CC000A         LDD #0xa                          
  0231  FD709E         STD 0x709e                        
  0234  172D67         LBSR 0x2f9e                       
  0237  172CF0         LBSR 0x2f2a                       
  023a  172DEF         LBSR 0x302c                       
  023d  3506           PULS  A B                         
  023f  39             RTS                               

; ---- function FUN_M69_r4_24000__0240
FUN_M69_r4_24000__0240:
  0240  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l delay " 21 $2915 $2921
  0244  00             db 0h                             
  0245  80             db 80h                            
  0246  6C2064656C61.. ds "l delay "                     
  024e  21             db 21h                            
  024f  2915           addr M69_r4_24000::2915           
  0251  2921           addr M69_r4_24000::2921           
LAB_M69_r4_24000__0253:
  0253  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r delay " 25 $29CF $29DB
  0257  01             db 1h                             
  0258  80             db 80h                            
  0259  722064656C61.. ds "r delay "                     
  0261  25             db 25h                            
  0262  29CF           addr M69_r4_24000::29cf           
  0264  29DB           addr M69_r4_24000::29db           
LAB_M69_r4_24000__0266:
  0266  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l fdback" 29 $2B37 $2B43
  026a  02             db 2h                             
  026b  80             db 80h                            
  026c  6C2066646261.. ds "l fdback"                     
  0274  29             db 29h                            
  0275  2B37           addr M69_r4_24000::2b37           
  0277  2B43           addr M69_r4_24000::2b43           
LAB_M69_r4_24000__0279:
  0279  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r fdback" 2D $2BE5 $2BF1
  027d  03             db 3h                             
  027e  80             db 80h                            
  027f  722066646261.. ds "r fdback"                     
  0287  2D             db 2Dh                            
  0288  2BE5           addr M69_r4_24000::2be5           
  028a  2BF1           addr M69_r4_24000::2bf1           
LAB_M69_r4_24000__028c:
  028c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "left mix" 43 $251C $2528
  0290  04             db 4h                             
  0291  80             db 80h                            
  0292  6C656674206D.. ds "left mix"                     
  029a  43             db 43h                            
  029b  251C           addr M69_r4_24000::251c           
  029d  2528           addr M69_r4_24000::2528           
LAB_M69_r4_24000__029f:
  029f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "rightmix" 47 $25CA $25D6
  02a3  05             db 5h                             
  02a4  80             db 80h                            
  02a5  72696768746D.. ds "rightmix"                     
  02ad  47             db 47h                            
  02ae  25CA           addr M69_r4_24000::25ca           
  02b0  25D6           addr M69_r4_24000::25d6           
LAB_M69_r4_24000__02b2:
  02b2  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "glide sp" 4B $141E $142A
  02b6  06             db 6h                             
  02b7  80             db 80h                            
  02b8  676C69646520.. ds "glide sp"                     
  02c0  4B             db 4Bh                            
  02c1  141E           addr M69_r4_24000::141e           
  02c3  142A           addr M69_r4_24000::142a           
LAB_M69_r4_24000__02c5:
  02c5  CC02D4         LDD #0x2d4                        
  02c8  FD60F5         STD 0x60f5                        
  02cb  CC0066         LDD #0x66                         
  02ce  47             ASRA                              
  02cf  56             RORB                              
  02d0  FD60F7         STD 0x60f7                        
  02d3  39             RTS                               
  02d4  033A03450350.. addr[51]                          

; ---- function FUN_M69_r4_24000__033a
FUN_M69_r4_24000__033a:
  033a  1721BB         LBSR 0x24f8                       
  033d  170983         LBSR 0x0cc3                       
  0340  AD9FFE14       JSR [0xfe14]                      
  0344  39             RTS                               

; ---- function FUN_M69_r4_24000__0345
FUN_M69_r4_24000__0345:
  0345  17225E         LBSR 0x25a6                       
  0348  1709AD         LBSR 0x0cf8                       
  034b  AD9FFE14       JSR [0xfe14]                      
  034f  39             RTS                               

; ---- function FUN_M69_r4_24000__0350
FUN_M69_r4_24000__0350:
  0350  17259E         LBSR 0x28f1                       
  0353  17096D         LBSR 0x0cc3                       
  0356  AD9FFE10       JSR [0xfe10]                      
  035a  39             RTS                               

; ---- function FUN_M69_r4_24000__035b
FUN_M69_r4_24000__035b:
  035b  1727B5         LBSR 0x2b13                       
  035e  170962         LBSR 0x0cc3                       
  0361  AD9FFE16       JSR [0xfe16]                      
  0365  39             RTS                               

; ---- function FUN_M69_r4_24000__0366
FUN_M69_r4_24000__0366:
  0366  171091         LBSR 0x13fa                       
  0369  1709F2         LBSR 0x0d5e                       
  036c  AD9FFE10       JSR [0xfe10]                      
  0370  39             RTS                               

; ---- function FUN_M69_r4_24000__0371
FUN_M69_r4_24000__0371:
  0371  17116E         LBSR 0x14e2                       
  0374  1709E7         LBSR 0x0d5e                       
  0377  AD9FFE12       JSR [0xfe12]                      
  037b  39             RTS                               

; ---- function FUN_M69_r4_24000__037c
FUN_M69_r4_24000__037c:
  037c  1713E8         LBSR 0x1767                       
  037f  1709DC         LBSR 0x0d5e                       
  0382  AD9FFE14       JSR [0xfe14]                      
  0386  39             RTS                               

; ---- function FUN_M69_r4_24000__0387
FUN_M69_r4_24000__0387:
  0387  1714DF         LBSR 0x1869                       
  038a  171515         LBSR 0x18a2                       
  038d  170933         LBSR 0x0cc3                       
  0390  AD9FFDEA       JSR [0xfdea]                      
  0394  39             RTS                               

; ---- function FUN_M69_r4_24000__0395
FUN_M69_r4_24000__0395:
  0395  172613         LBSR 0x29ab                       
  0398  17095D         LBSR 0x0cf8                       
  039b  AD9FFE10       JSR [0xfe10]                      
  039f  39             RTS                               

; ---- function FUN_M69_r4_24000__03a0
FUN_M69_r4_24000__03a0:
  03a0  17281E         LBSR 0x2bc1                       
  03a3  170952         LBSR 0x0cf8                       
  03a6  AD9FFE16       JSR [0xfe16]                      
  03aa  39             RTS                               

; ---- function FUN_M69_r4_24000__03ab
FUN_M69_r4_24000__03ab:
  03ab  1722A6         LBSR 0x2654                       
  03ae  170CB2         LBSR 0x1063                       
  03b1  AD9FFE10       JSR [0xfe10]                      
  03b5  39             RTS                               

; ---- function FUN_M69_r4_24000__03b6
FUN_M69_r4_24000__03b6:
  03b6  172316         LBSR 0x26cf                       
  03b9  170CA7         LBSR 0x1063                       
  03bc  AD9FFE12       JSR [0xfe12]                      
  03c0  39             RTS                               

; ---- function FUN_M69_r4_24000__03c1
FUN_M69_r4_24000__03c1:
  03c1  172386         LBSR 0x274a                       
  03c4  170CD7         LBSR 0x109e                       
  03c7  AD9FFE10       JSR [0xfe10]                      
  03cb  39             RTS                               

; ---- function FUN_M69_r4_24000__03cc
FUN_M69_r4_24000__03cc:
  03cc  1723F6         LBSR 0x27c5                       
  03cf  170CCC         LBSR 0x109e                       
  03d2  AD9FFE12       JSR [0xfe12]                      
  03d6  39             RTS                               

; ---- function FUN_M69_r4_24000__03d7
FUN_M69_r4_24000__03d7:
  03d7  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " delay  " 21 $2864 $2870
  03db  00             db 0h                             
  03dc  80             db 80h                            
  03dd  2064656C6179.. ds " delay  "                     
  03e5  21             db 21h                            
  03e6  2864           addr M69_r4_24000::2864           
  03e8  2870           addr M69_r4_24000::2870           
LAB_M69_r4_24000__03ea:
  03ea  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "feedback" 25 $2A89 $2A95
  03ee  01             db 1h                             
  03ef  80             db 80h                            
  03f0  666565646261.. ds "feedback"                     
  03f8  25             db 25h                            
  03f9  2A89           addr M69_r4_24000::2a89           
  03fb  2A95           addr M69_r4_24000::2a95           
LAB_M69_r4_24000__03fd:
  03fd  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "  mix   " 29 $246A $2476
  0401  02             db 2h                             
  0402  80             db 80h                            
  0403  20206D697820.. ds "  mix   "                     
  040b  29             db 29h                            
  040c  246A           addr M69_r4_24000::246a           
  040e  2476           addr M69_r4_24000::2476           
LAB_M69_r4_24000__0410:
  0410  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "glide sp" 2D $141E $142A
  0414  03             db 3h                             
  0415  80             db 80h                            
  0416  676C69646520.. ds "glide sp"                     
  041e  2D             db 2Dh                            
  041f  141E           addr M69_r4_24000::141e           
  0421  142A           addr M69_r4_24000::142a           
LAB_M69_r4_24000__0423:
  0423  CC0432         LDD #0x432                        
  0426  FD60F5         STD 0x60f5                        
  0429  CC0066         LDD #0x66                         
  042c  47             ASRA                              
  042d  56             RORB                              
  042e  FD60F7         STD 0x60f7                        
  0431  39             RTS                               
  0432  .db 04 98 04 A3 04 A4 04 AF 04 BA 04 C5 04 D0 04 D1  ; ................
  0442  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9  ; ................
  0452  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9  ; ................
  0462  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9  ; ................
  0472  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9  ; ................
  0482  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 04 DF  ; ................
  0492  .db 04 EA 04 F5 05 00 17 1F AB 17 07 8D AD 9F FE 14  ; ................
  04a2  .db 39 39 17 23 99 17 07 81 AD 9F FE 10 39 17 25 B3  ; 99.#........9.%.
  04b2  .db 17 07 76 AD 9F FE 16 39 17 0F 3D 17 07 D1 AD 9F  ; ..v....9..=.....
  04c2  .db FE 10 39 17 10 1A 17 07 C6 AD 9F FE 12 39 39 17  ; ..9..........99.
  04d2  .db 13 95 17 13 CB 17 07 51 AD 9F FD EA 39 17 21 72  ; .......Q....9.!r
  04e2  .db 17 0B 7E AD 9F FE 10 39 17 21 E2 17 0B 73 AD 9F  ; ..~....9.!...s..
  04f2  .db FE 12 39 17 22 52 17 0B A3 AD 9F FE 10 39 17 22  ; ..9."R.......9."
  0502  .db C2 17 0B 98 AD 9F FE 12 39                       ; ........9

; ---- function FUN_M69_r4_24000__050b
FUN_M69_r4_24000__050b:
  050b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "m fdback" 21 $15FF $160B
  050f  00             db 0h                             
  0510  80             db 80h                            
  0511  6D2066646261.. ds "m fdback"                     
  0519  21             db 21h                            
  051a  15FF           addr M69_r4_24000::15ff           
  051c  160B           addr M69_r4_24000::160b           
LAB_M69_r4_24000__051e:
  051e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " m rate " 25 $121D $1229
  0522  01             db 1h                             
  0523  80             db 80h                            
  0524  206D20726174.. ds " m rate "                     
  052c  25             db 25h                            
  052d  121D           addr M69_r4_24000::121d           
  052f  1229           addr M69_r4_24000::1229           
LAB_M69_r4_24000__0531:
  0531  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "m depth " 29 $12D4 $12E0
  0535  02             db 2h                             
  0536  80             db 80h                            
  0537  6D2064657074.. ds "m depth "                     
  053f  29             db 29h                            
  0540  12D4           addr M69_r4_24000::12d4           
  0542  12E0           addr M69_r4_24000::12e0           
LAB_M69_r4_24000__0544:
  0544  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "m delay " 2D $1379 $1385
  0548  03             db 3h                             
  0549  80             db 80h                            
  054a  6D2064656C61.. ds "m delay "                     
  0552  2D             db 2Dh                            
  0553  1379           addr M69_r4_24000::1379           
  0555  1385           addr M69_r4_24000::1385           
LAB_M69_r4_24000__0557:
  0557  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "  image " 43 $16D2 $16DE
  055b  04             db 4h                             
  055c  80             db 80h                            
  055d  2020696D6167.. ds "  image "                     
  0565  43             db 43h                            
  0566  16D2           addr M69_r4_24000::16d2           
  0568  16DE           addr M69_r4_24000::16de           
LAB_M69_r4_24000__056a:
  056a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "  mix   " 47 $246A $2476
  056e  05             db 5h                             
  056f  80             db 80h                            
  0570  20206D697820.. ds "  mix   "                     
  0578  47             db 47h                            
  0579  246A           addr M69_r4_24000::246a           
  057b  2476           addr M69_r4_24000::2476           
LAB_M69_r4_24000__057d:
  057d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "glide sp" 4B $141E $142A
  0581  06             db 6h                             
  0582  80             db 80h                            
  0583  676C69646520.. ds "glide sp"                     
  058b  4B             db 4Bh                            
  058c  141E           addr M69_r4_24000::141e           
  058e  142A           addr M69_r4_24000::142a           
LAB_M69_r4_24000__0590:
  0590  CC05A5         LDD #0x5a5                        
  0593  FD60F5         STD 0x60f5                        
  0596  CC0066         LDD #0x66                         
  0599  47             ASRA                              
  059a  56             RORB                              
  059b  FD60F7         STD 0x60f7                        
  059e  FC0BAD         LDD 0x0bad                        
  05a1  FD7142         STD 0x7142                        
  05a4  39             RTS                               
  05a5  .db 06 0B 06 16 06 17 06 22 06 2D 06 38 06 43 06 4E  ; .......".-.8.C.N
  05b5  .db 06 5C 06 67 06 72 06 7D 06 88 06 93 06 9E 06 A9  ; .\.g.r.}........
  05c5  .db 06 B4 06 BF 06 CA 06 D5 06 E0 06 EB 06 F6 07 01  ; ................
  05d5  .db 07 0C 07 17 07 22 07 2D 07 38 07 43 07 4E 07 59  ; .....".-.8.C.N.Y
  05e5  .db 07 64 07 6F 07 7A 07 85 07 90 07 9B 07 A6 07 B1  ; .d.o.z..........
  05f5  .db 07 BC 07 C7 07 D2 07 DD 07 E8 07 F3 07 FE 08 09  ; ................
  0605  .db 08 14 08 1F 08 2A 17 1E 38 17 04 FE AD 9F FE 14  ; .....*..8.......
  0615  .db 39 39 17 0D 3B 17 04 B9 AD 9F FE 10 39 17 0B D4  ; 99..;.......9...
  0625  .db 17 04 AE AD 9F FE 12 39 17 0D CA 17 05 41 AD 9F  ; .......9.....A..
  0635  .db FE 10 39 17 0E A7 17 05 36 AD 9F FE 12 39 17 11  ; ..9.....6....9..
  0645  .db 21 17 05 2B AD 9F FE 14 39 17 12 18 17 12 4E 17  ; !..+....9.....N.
  0655  .db 04 B8 AD 9F FD EA 39 17 0C 51 17 04 74 AD 9F FE  ; ......9..Q..t...
  0665  .db 14 39 17 0F 71 17 04 69 AD 9F FE 16 39 17 10 39  ; .9..q..i....9..9
  0675  .db 17 04 97 AD 9F FE 10 39 17 13 B9 17 07 14 AD 9F  ; .......9........
  0685  .db FE 10 39 17 13 B5 17 07 09 AD 9F FE 12 39 17 13  ; ..9..........9..
  0695  .db B1 17 06 FE AD 9F FE 14 39 17 13 AD 17 06 F3 AD  ; ........9.......
  06a5  .db 9F FE 16 39 17 13 A9 17 07 21 AD 9F FE 10 39 17  ; ...9.....!....9.
  06b5  .db 13 A5 17 07 16 AD 9F FE 12 39 17 17 2A 17 07 BA  ; .........9..*...
  06c5  .db AD 9F FE 10 39 17 17 26 17 07 AF AD 9F FE 12 39  ; ....9..&.......9
  06d5  .db 17 17 22 17 07 A4 AD 9F FE 14 39 17 17 1E 17 07  ; ..".......9.....
  06e5  .db 99 AD 9F FE 16 39 17 17 1A 17 07 C7 AD 9F FE 10  ; .....9..........
  06f5  .db 39 17 17 16 17 07 BC AD 9F FE 12 39 17 15 6D 17  ; 9..........9..m.
  0705  .db 07 04 AD 9F FE 10 39 17 15 69 17 06 F9 AD 9F FE  ; ......9..i......
  0715  .db 12 39 17 15 65 17 06 EE AD 9F FE 14 39 17 15 61  ; .9..e.......9..a
  0725  .db 17 06 E3 AD 9F FE 16 39 17 15 5D 17 07 11 AD 9F  ; .......9..].....
  0735  .db FE 10 39 17 15 59 17 07 06 AD 9F FE 12 39 17 18  ; ..9..Y.......9..
  0745  .db 0E 17 07 AA AD 9F FE 10 39 17 18 0A 17 07 9F AD  ; ........9.......
  0755  .db 9F FE 12 39 17 18 06 17 07 94 AD 9F FE 14 39 17  ; ...9..........9.
  0765  .db 18 02 17 07 89 AD 9F FE 16 39 17 17 FE 17 07 B7  ; .........9......
  0775  .db AD 9F FE 10 39 17 17 FA 17 07 AC AD 9F FE 12 39  ; ....9..........9
  0785  .db 17 1B 14 17 08 50 AD 9F FE 10 39 17 1B 10 17 08  ; .....P....9.....
  0795  .db 45 AD 9F FE 12 39 17 1B 0C 17 08 3A AD 9F FE 14  ; E....9.....:....
  07a5  .db 39 17 1B 08 17 08 2F AD 9F FE 16 39 17 1B 04 17  ; 9...../....9....
  07b5  .db 08 5D AD 9F FE 10 39 17 1B 00 17 08 52 AD 9F FE  ; .]....9.....R...
  07c5  .db 12 39 17 19 51 17 07 9A AD 9F FE 10 39 17 19 4D  ; .9..Q.......9..M
  07d5  .db 17 07 8F AD 9F FE 12 39 17 19 49 17 07 84 AD 9F  ; .......9..I.....
  07e5  .db FE 14 39 17 19 45 17 07 79 AD 9F FE 16 39 17 19  ; ..9..E..y....9..
  07f5  .db 41 17 07 A7 AD 9F FE 10 39 17 19 3D 17 07 9C AD  ; A.......9..=....
  0805  .db 9F FE 12 39 17 1E 48 17 08 54 AD 9F FE 10 39 17  ; ...9..H..T....9.
  0815  .db 1E B8 17 08 49 AD 9F FE 12 39 17 1F 28 17 08 79  ; ....I....9..(..y
  0825  .db AD 9F FE 10 39 17 1F 98 17 08 6E AD 9F FE 12 39  ; ....9.....n....9

; ---- function FUN_M69_r4_24000__0835
FUN_M69_r4_24000__0835:
  0835  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " m delay" 21 $1379 $1385
  0839  00             db 0h                             
  083a  80             db 80h                            
  083b  206D2064656C.. ds " m delay"                     
  0843  21             db 21h                            
  0844  1379           addr M69_r4_24000::1379           
  0846  1385           addr M69_r4_24000::1385           
LAB_M69_r4_24000__0848:
  0848  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " m depth" 25 $12D4 $12E0
  084c  01             db 1h                             
  084d  80             db 80h                            
  084e  206D20646570.. ds " m depth"                     
  0856  25             db 25h                            
  0857  12D4           addr M69_r4_24000::12d4           
  0859  12E0           addr M69_r4_24000::12e0           
LAB_M69_r4_24000__085b:
  085b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 " m rate " 29 $121D $1229
  085f  02             db 2h                             
  0860  80             db 80h                            
  0861  206D20726174.. ds " m rate "                     
  0869  29             db 29h                            
  086a  121D           addr M69_r4_24000::121d           
  086c  1229           addr M69_r4_24000::1229           
LAB_M69_r4_24000__086e:
  086e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "m fdback" 2D $1130 $113C
  0872  03             db 3h                             
  0873  80             db 80h                            
  0874  6D2066646261.. ds "m fdback"                     
  087c  2D             db 2Dh                            
  087d  1130           addr M69_r4_24000::1130           
  087f  113C           addr M69_r4_24000::113c           
LAB_M69_r4_24000__0881:
  0881  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "  mix   " 43 $246A $2476
  0885  04             db 4h                             
  0886  80             db 80h                            
  0887  20206D697820.. ds "  mix   "                     
  088f  43             db 43h                            
  0890  246A           addr M69_r4_24000::246a           
  0892  2476           addr M69_r4_24000::2476           
LAB_M69_r4_24000__0894:
  0894  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "glide sp" 47 $141E $142A
  0898  05             db 5h                             
  0899  80             db 80h                            
  089a  676C69646520.. ds "glide sp"                     
  08a2  47             db 47h                            
  08a3  141E           addr M69_r4_24000::141e           
  08a5  142A           addr M69_r4_24000::142a           
LAB_M69_r4_24000__08a7:
  08a7  CC08BC         LDD #0x8bc                        
  08aa  FD60F5         STD 0x60f5                        
  08ad  CC0066         LDD #0x66                         
  08b0  47             ASRA                              
  08b1  56             RORB                              
  08b2  FD60F7         STD 0x60f7                        
  08b5  CC0A97         LDD #0xa97                        
  08b8  FD7142         STD 0x7142                        
  08bb  39             RTS                               
  08bc  0922092D0938.. addr[9]                           
  08ce  .db 09 88 09 89 06 7D 06 88 06 93 06 9E 06 A9 06 B4  ; .....}..........
  08de  .db 06 BF 06 CA 06 D5 06 E0 06 EB 06 F6 07 01 07 0C  ; ................
  08ee  .db 07 17 07 22 07 2D 07 38 10 D9 10 D9 10 D9 10 D9  ; ...".-.8........
  08fe  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9  ; ................
  090e  .db 10 D9 10 D9 10 D9 10 D9 10 D9 10 D9 09 8A 09 95  ; ................
  091e  .db 09 A0 09 AB                                      ; ....

; ---- function FUN_M69_r4_24000__0922
FUN_M69_r4_24000__0922:
  0922  171B21         LBSR 0x2446                       
  0925  170102         LBSR 0x0a2a                       
  0928  AD9FFE10       JSR [0xfe10]                      
  092c  39             RTS                               

; ---- function FUN_M69_r4_24000__092d
FUN_M69_r4_24000__092d:
  092d  1707DC         LBSR 0x110c                       
  0930  1700BE         LBSR 0x09f1                       
  0933  AD9FFE16       JSR [0xfe16]                      
  0937  39             RTS                               

; ---- function FUN_M69_r4_24000__0938
FUN_M69_r4_24000__0938:
  0938  170A1A         LBSR 0x1355                       
  093b  1700B3         LBSR 0x09f1                       
  093e  AD9FFE10       JSR [0xfe10]                      
  0942  39             RTS                               

; ---- function FUN_M69_r4_24000__0943
FUN_M69_r4_24000__0943:
  0943  1708B3         LBSR 0x11f9                       
  0946  1700A8         LBSR 0x09f1                       
  0949  AD9FFE12       JSR [0xfe12]                      
  094d  39             RTS                               

; ---- function FUN_M69_r4_24000__094e
FUN_M69_r4_24000__094e:
  094e  170AA9         LBSR 0x13fa                       
  0951  170111         LBSR 0x0a65                       
  0954  AD9FFE10       JSR [0xfe10]                      
  0958  39             RTS                               

; ---- function FUN_M69_r4_24000__0959
FUN_M69_r4_24000__0959:
  0959  170B86         LBSR 0x14e2                       
  095c  170106         LBSR 0x0a65                       
  095f  AD9FFE12       JSR [0xfe12]                      
  0963  39             RTS                               

; ---- function FUN_M69_r4_24000__0964
FUN_M69_r4_24000__0964:
  0964  170E00         LBSR 0x1767                       
  0967  1700FB         LBSR 0x0a65                       
  096a  AD9FFE14       JSR [0xfe14]                      
  096e  39             RTS                               

; ---- function FUN_M69_r4_24000__096f
FUN_M69_r4_24000__096f:
  096f  170EF7         LBSR 0x1869                       
  0972  170F2D         LBSR 0x18a2                       
  0975  1700B2         LBSR 0x0a2a                       
  0978  AD9FFDEA       JSR [0xfdea]                      
  097c  39             RTS                               

; ---- function FUN_M69_r4_24000__097d
FUN_M69_r4_24000__097d:
  097d  170930         LBSR 0x12b0                       
  0980  17006E         LBSR 0x09f1                       
  0983  AD9FFE14       JSR [0xfe14]                      
  0987  39             RTS                               
  0988  .db 39 39 17 1C C7 17 06 D3 AD 9F FE 10 39 17 1D 37  ; 99..........9..7
  0998  .db 17 06 C8 AD 9F FE 12 39 17 1D A7 17 06 F8 AD 9F  ; .......9........
  09a8  .db FE 10 39 17 1E 17 17 06 ED AD 9F FE 12 39        ; ..9..........9

; ---- function FUN_M69_r4_24000__09b6
FUN_M69_r4_24000__09b6:
  09b6  AD9FFDFC       JSR [0xfdfc]                      
  09ba  39             RTS                               
LAB_M69_r4_24000__09bb:
  09bb  C600           LDB #0x0                          
  09bd  AD9FFC36       JSR [0xfc36]                      
  09c1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  09c5  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M69_r4_24000__09ee:
  09ee  3577           PULS CC A B X Y U                 
  09f0  39             RTS                               

; ---- function FUN_M69_r4_24000__09f1
FUN_M69_r4_24000__09f1:
  09f1  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback"
  09f5  6D2064656C61.. ds "m delay "                     
  09fd  206D20726174.. ds " m rate "                     
  0a05  6D2064657074.. ds "m depth "                     
  0a0d  6D2066646261.. ds "m fdback"                     
LAB_M69_r4_24000__0a15:
  0a15  AD9FFDF2       JSR [0xfdf2]                      
  0a19  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1349 ->$11ED ->$12A4 ->$1100 ->$0A2A ->$0A2A
  0a1d  1349           addr M69_r4_24000::1349           
  0a1f  11ED           addr M69_r4_24000::11ed           
  0a21  12A4           addr M69_r4_24000::12a4           
  0a23  1100           addr M69_r4_24000::1100           
  0a25  0A2A           addr M69_r4_24000::0a2a           
  0a27  0A2A           addr M69_r4_24000::0a2a           
LAB_M69_r4_24000__0a29:
  0a29  39             RTS                               

; ---- function FUN_M69_r4_24000__0a2a
FUN_M69_r4_24000__0a2a:
  0a2a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [-] " levels " " expert "
  0a2e  20206D697820.. ds "  mix   "                     
  0a36  00             db 0h                             
  0a37  206C6576656C.. ds " levels "                     
  0a3f  206578706572.. ds " expert "                     
LAB_M69_r4_24000__0a47:
  0a47  AD9FFDF2       JSR [0xfdf2]                      
  0a4b  CC0A2A         LDD #0xa2a                        
  0a4e  FD7142         STD 0x7142                        
  0a51  170EDF         LBSR 0x1933                       
  0a54  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$243A ->$187E ->$1063 ->$0A65 ->$09F1 ->$09F1
  0a58  243A           addr M69_r4_24000::243a           
  0a5a  187E           addr M69_r4_24000::187e           
  0a5c  1063           addr M69_r4_24000::1063           
  0a5e  0A65           addr M69_r4_24000::0a65           
  0a60  09F1           addr M69_r4_24000::09f1           
  0a62  09F1           addr M69_r4_24000::09f1           
LAB_M69_r4_24000__0a64:
  0a64  39             RTS                               

; ---- function FUN_M69_r4_24000__0a65
FUN_M69_r4_24000__0a65:
  0a65  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" [*] " return "
  0a69  676C69646520.. ds "glide sp"                     
  0a71  676C69646520.. ds "glide en"                     
  0a79  01             db 1h                             
  0a7a  207265747572.. ds " return "                     
LAB_M69_r4_24000__0a82:
  0a82  AD9FFDF2       JSR [0xfdf2]                      
  0a86  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$144B ->$1506 ->$10D9 ->$0A2A ->$0A97 ->$0A97
  0a8a  144B           addr M69_r4_24000::144b           
  0a8c  1506           addr M69_r4_24000::1506           
  0a8e  10D9           addr M69_r4_24000::10d9           
  0a90  0A2A           addr M69_r4_24000::0a2a           
  0a92  0A97           addr M69_r4_24000::0a97           
  0a94  0A97           addr M69_r4_24000::0a97           
LAB_M69_r4_24000__0a96:
  0a96  39             RTS                               

; ---- function FUN_M69_r4_24000__0a97
FUN_M69_r4_24000__0a97:
  0a97  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rates  " " depths " " delays " " return "
  0a9b  207261746573.. ds " rates  "                     
  0aa3  206465707468.. ds " depths "                     
  0aab  2064656C6179.. ds " delays "                     
  0ab3  207265747572.. ds " return "                     
LAB_M69_r4_24000__0abb:
  0abb  AD9FFDF2       JSR [0xfdf2]                      
  0abf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0E0B ->$0E7F ->$0D97 ->$0A2A ->$0A65 ->$0A65
  0ac3  0E0B           addr M69_r4_24000::0e0b           
  0ac5  0E7F           addr M69_r4_24000::0e7f           
  0ac7  0D97           addr M69_r4_24000::0d97           
  0ac9  0A2A           addr M69_r4_24000::0a2a           
  0acb  0A65           addr M69_r4_24000::0a65           
  0acd  0A65           addr M69_r4_24000::0a65           
LAB_M69_r4_24000__0acf:
  0acf  CC0A97         LDD #0xa97                        
  0ad2  FD7142         STD 0x7142                        
  0ad5  39             RTS                               

; ---- function FUN_M69_r4_24000__0ad6
FUN_M69_r4_24000__0ad6:
  0ad6  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback"
  0ada  6D2064656C61.. ds "m delay "                     
  0ae2  206D20726174.. ds " m rate "                     
  0aea  6D2064657074.. ds "m depth "                     
  0af2  6D2066646261.. ds "m fdback"                     
LAB_M69_r4_24000__0afa:
  0afa  AD9FFDF2       JSR [0xfdf2]                      
  0afe  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1349 ->$11ED ->$12A4 ->$15CF ->$0B0F ->$0B0F
  0b02  1349           addr M69_r4_24000::1349           
  0b04  11ED           addr M69_r4_24000::11ed           
  0b06  12A4           addr M69_r4_24000::12a4           
  0b08  15CF           addr M69_r4_24000::15cf           
  0b0a  0B0F           addr M69_r4_24000::0b0f           
  0b0c  0B0F           addr M69_r4_24000::0b0f           
LAB_M69_r4_24000__0b0e:
  0b0e  39             RTS                               

; ---- function FUN_M69_r4_24000__0b0f
FUN_M69_r4_24000__0b0f:
  0b0f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " width  " [-] "  mix   " " levels "
  0b13  207769647468.. ds " width  "                     
  0b1b  00             db 0h                             
  0b1c  20206D697820.. ds "  mix   "                     
  0b24  206C6576656C.. ds " levels "                     
LAB_M69_r4_24000__0b2c:
  0b2c  AD9FFDF2       JSR [0xfdf2]                      
  0b30  CC0B0F         LDD #0xb0f                        
  0b33  FD7142         STD 0x7142                        
  0b36  170DFA         LBSR 0x1933                       
  0b39  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$16BA ->$187E ->$243A ->$1063 ->$0B4A ->$0AD6
  0b3d  16BA           addr M69_r4_24000::16ba           
  0b3f  187E           addr M69_r4_24000::187e           
  0b41  243A           addr M69_r4_24000::243a           
  0b43  1063           addr M69_r4_24000::1063           
  0b45  0B4A           addr M69_r4_24000::0b4a           
  0b47  0AD6           addr M69_r4_24000::0ad6           
LAB_M69_r4_24000__0b49:
  0b49  39             RTS                               

; ---- function FUN_M69_r4_24000__0b4a
FUN_M69_r4_24000__0b4a:
  0b4a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " expert "
  0b4e  01             db 1h                             
  0b4f  01             db 1h                             
  0b50  01             db 1h                             
  0b51  206578706572.. ds " expert "                     
LAB_M69_r4_24000__0b59:
  0b59  AD9FFDF2       JSR [0xfdf2]                      
  0b5d  CC0B4A         LDD #0xb4a                        
  0b60  FD7142         STD 0x7142                        
  0b63  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$10D9 ->$10D9 ->$10D9 ->$0B74 ->$0AD6 ->$0B0F
  0b67  10D9           addr M69_r4_24000::10d9           
  0b69  10D9           addr M69_r4_24000::10d9           
  0b6b  10D9           addr M69_r4_24000::10d9           
  0b6d  0B74           addr M69_r4_24000::0b74           
  0b6f  0AD6           addr M69_r4_24000::0ad6           
  0b71  0B0F           addr M69_r4_24000::0b0f           
LAB_M69_r4_24000__0b73:
  0b73  39             RTS                               

; ---- function FUN_M69_r4_24000__0b74
FUN_M69_r4_24000__0b74:
  0b74  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" "st/mono " " return "
  0b78  676C69646520.. ds "glide sp"                     
  0b80  676C69646520.. ds "glide en"                     
  0b88  73742F6D6F6E.. ds "st/mono "                     
  0b90  207265747572.. ds " return "                     
LAB_M69_r4_24000__0b98:
  0b98  AD9FFDF2       JSR [0xfdf2]                      
  0b9c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$144B ->$1506 ->$178B ->$0B4A ->$0BAD ->$0BAD
  0ba0  144B           addr M69_r4_24000::144b           
  0ba2  1506           addr M69_r4_24000::1506           
  0ba4  178B           addr M69_r4_24000::178b           
  0ba6  0B4A           addr M69_r4_24000::0b4a           
  0ba8  0BAD           addr M69_r4_24000::0bad           
  0baa  0BAD           addr M69_r4_24000::0bad           
LAB_M69_r4_24000__0bac:
  0bac  39             RTS                               

; ---- function FUN_M69_r4_24000__0bad
FUN_M69_r4_24000__0bad:
  0bad  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rates  " " depths " " delays " " return "
  0bb1  207261746573.. ds " rates  "                     
  0bb9  206465707468.. ds " depths "                     
  0bc1  2064656C6179.. ds " delays "                     
  0bc9  207265747572.. ds " return "                     
LAB_M69_r4_24000__0bd1:
  0bd1  AD9FFDF2       JSR [0xfdf2]                      
  0bd5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0E0B ->$0E7F ->$0D97 ->$0B4A ->$0BEC ->$0B74
  0bd9  0E0B           addr M69_r4_24000::0e0b           
  0bdb  0E7F           addr M69_r4_24000::0e7f           
  0bdd  0D97           addr M69_r4_24000::0d97           
  0bdf  0B4A           addr M69_r4_24000::0b4a           
  0be1  0BEC           addr M69_r4_24000::0bec           
  0be3  0B74           addr M69_r4_24000::0b74           
LAB_M69_r4_24000__0be5:
  0be5  CC0BAD         LDD #0xbad                        
  0be8  FD7142         STD 0x7142                        
  0beb  39             RTS                               

; ---- function FUN_M69_r4_24000__0bec
FUN_M69_r4_24000__0bec:
  0bec  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "fdbacks " " pans   " " levels " " return "
  0bf0  66646261636B.. ds "fdbacks "                     
  0bf8  2070616E7320.. ds " pans   "                     
  0c00  206C6576656C.. ds " levels "                     
  0c08  207265747572.. ds " return "                     
LAB_M69_r4_24000__0c10:
  0c10  AD9FFDF2       JSR [0xfdf2]                      
  0c14  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0FDB ->$0F67 ->$0EF3 ->$0B4A ->$0B74 ->$0BAD
  0c18  0FDB           addr M69_r4_24000::0fdb           
  0c1a  0F67           addr M69_r4_24000::0f67           
  0c1c  0EF3           addr M69_r4_24000::0ef3           
  0c1e  0B4A           addr M69_r4_24000::0b4a           
  0c20  0B74           addr M69_r4_24000::0b74           
  0c22  0BAD           addr M69_r4_24000::0bad           
LAB_M69_r4_24000__0c24:
  0c24  CC0BEC         LDD #0xbec                        
  0c27  FD7142         STD 0x7142                        
  0c2a  39             RTS                               

; ---- function FUN_M69_r4_24000__0c2b
FUN_M69_r4_24000__0c2b:
  0c2b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " delay  " [-] "  mix   " "feedback"
  0c2f  2064656C6179.. ds " delay  "                     
  0c37  00             db 0h                             
  0c38  20206D697820.. ds "  mix   "                     
  0c40  666565646261.. ds "feedback"                     
LAB_M69_r4_24000__0c48:
  0c48  AD9FFDF2       JSR [0xfdf2]                      
  0c4c  170CE4         LBSR 0x1933                       
  0c4f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2834 ->$187E ->$243A ->$2A59 ->$0C60 ->$0C60
  0c53  2834           addr M69_r4_24000::2834           
  0c55  187E           addr M69_r4_24000::187e           
  0c57  243A           addr M69_r4_24000::243a           
  0c59  2A59           addr M69_r4_24000::2a59           
  0c5b  0C60           addr M69_r4_24000::0c60           
  0c5d  0C60           addr M69_r4_24000::0c60           
LAB_M69_r4_24000__0c5f:
  0c5f  39             RTS                               

; ---- function FUN_M69_r4_24000__0c60
FUN_M69_r4_24000__0c60:
  0c60  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] " levels " " expert "
  0c64  01             db 1h                             
  0c65  01             db 1h                             
  0c66  206C6576656C.. ds " levels "                     
  0c6e  206578706572.. ds " expert "                     
LAB_M69_r4_24000__0c76:
  0c76  AD9FFDF2       JSR [0xfdf2]                      
  0c7a  CC0C60         LDD #0xc60                        
  0c7d  FD7142         STD 0x7142                        
  0c80  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$10D9 ->$10D9 ->$1063 ->$0C91 ->$0C2B ->$0C2B
  0c84  10D9           addr M69_r4_24000::10d9           
  0c86  10D9           addr M69_r4_24000::10d9           
  0c88  1063           addr M69_r4_24000::1063           
  0c8a  0C91           addr M69_r4_24000::0c91           
  0c8c  0C2B           addr M69_r4_24000::0c2b           
  0c8e  0C2B           addr M69_r4_24000::0c2b           
LAB_M69_r4_24000__0c90:
  0c90  39             RTS                               

; ---- function FUN_M69_r4_24000__0c91
FUN_M69_r4_24000__0c91:
  0c91  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" [*] " return "
  0c95  676C69646520.. ds "glide sp"                     
  0c9d  676C69646520.. ds "glide en"                     
  0ca5  01             db 1h                             
  0ca6  207265747572.. ds " return "                     
LAB_M69_r4_24000__0cae:
  0cae  AD9FFDF2       JSR [0xfdf2]                      
  0cb2  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$144B ->$1506 ->$10D9 ->$0C60 ->$0C91 ->$0C91
  0cb6  144B           addr M69_r4_24000::144b           
  0cb8  1506           addr M69_r4_24000::1506           
  0cba  10D9           addr M69_r4_24000::10d9           
  0cbc  0C60           addr M69_r4_24000::0c60           
  0cbe  0C91           addr M69_r4_24000::0c91           
  0cc0  0C91           addr M69_r4_24000::0c91           
LAB_M69_r4_24000__0cc2:
  0cc2  39             RTS                               

; ---- function FUN_M69_r4_24000__0cc3
FUN_M69_r4_24000__0cc3:
  0cc3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l delay " [-] "l mix   " "l fdback"
  0cc7  6C2064656C61.. ds "l delay "                     
  0ccf  00             db 0h                             
  0cd0  6C206D697820.. ds "l mix   "                     
  0cd8  6C2066646261.. ds "l fdback"                     
LAB_M69_r4_24000__0ce0:
  0ce0  AD9FFDF2       JSR [0xfdf2]                      
  0ce4  170C4C         LBSR 0x1933                       
  0ce7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$28E5 ->$187E ->$24EC ->$2B07 ->$0CF8 ->$0D2D
  0ceb  28E5           addr M69_r4_24000::28e5           
  0ced  187E           addr M69_r4_24000::187e           
  0cef  24EC           addr M69_r4_24000::24ec           
  0cf1  2B07           addr M69_r4_24000::2b07           
  0cf3  0CF8           addr M69_r4_24000::0cf8           
  0cf5  0D2D           addr M69_r4_24000::0d2d           
LAB_M69_r4_24000__0cf7:
  0cf7  39             RTS                               

; ---- function FUN_M69_r4_24000__0cf8
FUN_M69_r4_24000__0cf8:
  0cf8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r delay " [-] "r mix   " "r fdback"
  0cfc  722064656C61.. ds "r delay "                     
  0d04  00             db 0h                             
  0d05  72206D697820.. ds "r mix   "                     
  0d0d  722066646261.. ds "r fdback"                     
LAB_M69_r4_24000__0d15:
  0d15  AD9FFDF2       JSR [0xfdf2]                      
  0d19  170C17         LBSR 0x1933                       
  0d1c  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$299F ->$187E ->$259A ->$2BB5 ->$0D2D ->$0CC3
  0d20  299F           addr M69_r4_24000::299f           
  0d22  187E           addr M69_r4_24000::187e           
  0d24  259A           addr M69_r4_24000::259a           
  0d26  2BB5           addr M69_r4_24000::2bb5           
  0d28  0D2D           addr M69_r4_24000::0d2d           
  0d2a  0CC3           addr M69_r4_24000::0cc3           
LAB_M69_r4_24000__0d2c:
  0d2c  39             RTS                               

; ---- function FUN_M69_r4_24000__0d2d
FUN_M69_r4_24000__0d2d:
  0d2d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] " levels " " expert "
  0d31  01             db 1h                             
  0d32  01             db 1h                             
  0d33  206C6576656C.. ds " levels "                     
  0d3b  206578706572.. ds " expert "                     
LAB_M69_r4_24000__0d43:
  0d43  AD9FFDF2       JSR [0xfdf2]                      
  0d47  CC0D2D         LDD #0xd2d                        
  0d4a  FD7142         STD 0x7142                        
  0d4d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$10D9 ->$10D9 ->$1063 ->$0D5E ->$0CC3 ->$0CF8
  0d51  10D9           addr M69_r4_24000::10d9           
  0d53  10D9           addr M69_r4_24000::10d9           
  0d55  1063           addr M69_r4_24000::1063           
  0d57  0D5E           addr M69_r4_24000::0d5e           
  0d59  0CC3           addr M69_r4_24000::0cc3           
  0d5b  0CF8           addr M69_r4_24000::0cf8           
LAB_M69_r4_24000__0d5d:
  0d5d  39             RTS                               

; ---- function FUN_M69_r4_24000__0d5e
FUN_M69_r4_24000__0d5e:
  0d5e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" "st/mono " " return "
  0d62  676C69646520.. ds "glide sp"                     
  0d6a  676C69646520.. ds "glide en"                     
  0d72  73742F6D6F6E.. ds "st/mono "                     
  0d7a  207265747572.. ds " return "                     
LAB_M69_r4_24000__0d82:
  0d82  AD9FFDF2       JSR [0xfdf2]                      
  0d86  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$144B ->$1506 ->$178B ->$0D2D ->$0D5E ->$0D5E
  0d8a  144B           addr M69_r4_24000::144b           
  0d8c  1506           addr M69_r4_24000::1506           
  0d8e  178B           addr M69_r4_24000::178b           
  0d90  0D2D           addr M69_r4_24000::0d2d           
  0d92  0D5E           addr M69_r4_24000::0d5e           
  0d94  0D5E           addr M69_r4_24000::0d5e           
LAB_M69_r4_24000__0d96:
  0d96  39             RTS                               

; ---- function FUN_M69_r4_24000__0d97
FUN_M69_r4_24000__0d97:
  0d97  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 "
  0d9b  64656C617920.. ds "delay 1 "                     
  0da3  64656C617920.. ds "delay 2 "                     
  0dab  64656C617920.. ds "delay 3 "                     
  0db3  64656C617920.. ds "delay 4 "                     
LAB_M69_r4_24000__0dbb:
  0dbb  AD9FFDF2       JSR [0xfdf2]                      
  0dbf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1A8F ->$1A9D ->$1AAB ->$1AB9 ->$0DD0 ->$0DD0
  0dc3  1A8F           addr M69_r4_24000::1a8f           
  0dc5  1A9D           addr M69_r4_24000::1a9d           
  0dc7  1AAB           addr M69_r4_24000::1aab           
  0dc9  1AB9           addr M69_r4_24000::1ab9           
  0dcb  0DD0           addr M69_r4_24000::0dd0           
  0dcd  0DD0           addr M69_r4_24000::0dd0           
LAB_M69_r4_24000__0dcf:
  0dcf  39             RTS                               

; ---- function FUN_M69_r4_24000__0dd0
FUN_M69_r4_24000__0dd0:
  0dd0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 5 " "delay 6 " [*] " return "
  0dd4  64656C617920.. ds "delay 5 "                     
  0ddc  64656C617920.. ds "delay 6 "                     
  0de4  01             db 1h                             
  0de5  207265747572.. ds " return "                     
LAB_M69_r4_24000__0ded:
  0ded  AD9FFDF2       JSR [0xfdf2]                      
  0df1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1AC7 ->$1AD5 ->$10D9 ->$10D9 ->$0D97 ->$0D97
  0df5  1AC7           addr M69_r4_24000::1ac7           
  0df7  1AD5           addr M69_r4_24000::1ad5           
  0df9  10D9           addr M69_r4_24000::10d9           
  0dfb  10D9           addr M69_r4_24000::10d9           
  0dfd  0D97           addr M69_r4_24000::0d97           
  0dff  0D97           addr M69_r4_24000::0d97           
LAB_M69_r4_24000__0e01:
  0e01  FC7142         LDD 0x7142                        
  0e04  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0e08  60E9           addr 60e9                         
LAB_M69_r4_24000__0e0a:
  0e0a  39             RTS                               

; ---- function FUN_M69_r4_24000__0e0b
FUN_M69_r4_24000__0e0b:
  0e0b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rate 1 " " rate 2 " " rate 3 " " rate 4 "
  0e0f  207261746520.. ds " rate 1 "                     
  0e17  207261746520.. ds " rate 2 "                     
  0e1f  207261746520.. ds " rate 3 "                     
  0e27  207261746520.. ds " rate 4 "                     
LAB_M69_r4_24000__0e2f:
  0e2f  AD9FFDF2       JSR [0xfdf2]                      
  0e33  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1CC7 ->$1CD1 ->$1CDB ->$1CE5 ->$0E44 ->$0E44
  0e37  1CC7           addr M69_r4_24000::1cc7           
  0e39  1CD1           addr M69_r4_24000::1cd1           
  0e3b  1CDB           addr M69_r4_24000::1cdb           
  0e3d  1CE5           addr M69_r4_24000::1ce5           
  0e3f  0E44           addr M69_r4_24000::0e44           
  0e41  0E44           addr M69_r4_24000::0e44           
LAB_M69_r4_24000__0e43:
  0e43  39             RTS                               

; ---- function FUN_M69_r4_24000__0e44
FUN_M69_r4_24000__0e44:
  0e44  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rate 5 " " rate 6 " [*] " return "
  0e48  207261746520.. ds " rate 5 "                     
  0e50  207261746520.. ds " rate 6 "                     
  0e58  01             db 1h                             
  0e59  207265747572.. ds " return "                     
LAB_M69_r4_24000__0e61:
  0e61  AD9FFDF2       JSR [0xfdf2]                      
  0e65  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1CEF ->$1CF9 ->$10D9 ->$10D9 ->$0E0B ->$0E0B
  0e69  1CEF           addr M69_r4_24000::1cef           
  0e6b  1CF9           addr M69_r4_24000::1cf9           
  0e6d  10D9           addr M69_r4_24000::10d9           
  0e6f  10D9           addr M69_r4_24000::10d9           
  0e71  0E0B           addr M69_r4_24000::0e0b           
  0e73  0E0B           addr M69_r4_24000::0e0b           
LAB_M69_r4_24000__0e75:
  0e75  FC7142         LDD 0x7142                        
  0e78  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0e7c  60E9           addr 60e9                         
LAB_M69_r4_24000__0e7e:
  0e7e  39             RTS                               

; ---- function FUN_M69_r4_24000__0e7f
FUN_M69_r4_24000__0e7f:
  0e7f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " depth 1" " depth 2" " depth 3" " depth4 "
  0e83  206465707468.. ds " depth 1"                     
  0e8b  206465707468.. ds " depth 2"                     
  0e93  206465707468.. ds " depth 3"                     
  0e9b  206465707468.. ds " depth4 "                     
LAB_M69_r4_24000__0ea3:
  0ea3  AD9FFDF2       JSR [0xfdf2]                      
  0ea7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1E42 ->$1E4C ->$1E56 ->$1E60 ->$0EB8 ->$0EB8
  0eab  1E42           addr M69_r4_24000::1e42           
  0ead  1E4C           addr M69_r4_24000::1e4c           
  0eaf  1E56           addr M69_r4_24000::1e56           
  0eb1  1E60           addr M69_r4_24000::1e60           
  0eb3  0EB8           addr M69_r4_24000::0eb8           
  0eb5  0EB8           addr M69_r4_24000::0eb8           
LAB_M69_r4_24000__0eb7:
  0eb7  39             RTS                               

; ---- function FUN_M69_r4_24000__0eb8
FUN_M69_r4_24000__0eb8:
  0eb8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " depth 5" " depth6 " [*] " return "
  0ebc  206465707468.. ds " depth 5"                     
  0ec4  206465707468.. ds " depth6 "                     
  0ecc  01             db 1h                             
  0ecd  207265747572.. ds " return "                     
LAB_M69_r4_24000__0ed5:
  0ed5  AD9FFDF2       JSR [0xfdf2]                      
  0ed9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1E6A ->$1E74 ->$10D9 ->$10D9 ->$0E7F ->$0E7F
  0edd  1E6A           addr M69_r4_24000::1e6a           
  0edf  1E74           addr M69_r4_24000::1e74           
  0ee1  10D9           addr M69_r4_24000::10d9           
  0ee3  10D9           addr M69_r4_24000::10d9           
  0ee5  0E7F           addr M69_r4_24000::0e7f           
  0ee7  0E7F           addr M69_r4_24000::0e7f           
LAB_M69_r4_24000__0ee9:
  0ee9  FC7142         LDD 0x7142                        
  0eec  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0ef0  60E9           addr 60e9                         
LAB_M69_r4_24000__0ef2:
  0ef2  39             RTS                               

; ---- function FUN_M69_r4_24000__0ef3
FUN_M69_r4_24000__0ef3:
  0ef3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " level 1" " level 2" " level 3" " level 4"
  0ef7  206C6576656C.. ds " level 1"                     
  0eff  206C6576656C.. ds " level 2"                     
  0f07  206C6576656C.. ds " level 3"                     
  0f0f  206C6576656C.. ds " level 4"                     
LAB_M69_r4_24000__0f17:
  0f17  AD9FFDF2       JSR [0xfdf2]                      
  0f1b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FAA ->$1FB8 ->$1FC6 ->$1FD4 ->$0F2C ->$0F2C
  0f1f  1FAA           addr M69_r4_24000::1faa           
  0f21  1FB8           addr M69_r4_24000::1fb8           
  0f23  1FC6           addr M69_r4_24000::1fc6           
  0f25  1FD4           addr M69_r4_24000::1fd4           
  0f27  0F2C           addr M69_r4_24000::0f2c           
  0f29  0F2C           addr M69_r4_24000::0f2c           
LAB_M69_r4_24000__0f2b:
  0f2b  39             RTS                               

; ---- function FUN_M69_r4_24000__0f2c
FUN_M69_r4_24000__0f2c:
  0f2c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " level 5" " level 6" [*] " return "
  0f30  206C6576656C.. ds " level 5"                     
  0f38  206C6576656C.. ds " level 6"                     
  0f40  01             db 1h                             
  0f41  207265747572.. ds " return "                     
LAB_M69_r4_24000__0f49:
  0f49  AD9FFDF2       JSR [0xfdf2]                      
  0f4d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FE2 ->$1FF0 ->$10D9 ->$10D9 ->$0EF3 ->$0EF3
  0f51  1FE2           addr M69_r4_24000::1fe2           
  0f53  1FF0           addr M69_r4_24000::1ff0           
  0f55  10D9           addr M69_r4_24000::10d9           
  0f57  10D9           addr M69_r4_24000::10d9           
  0f59  0EF3           addr M69_r4_24000::0ef3           
  0f5b  0EF3           addr M69_r4_24000::0ef3           
LAB_M69_r4_24000__0f5d:
  0f5d  FC7142         LDD 0x7142                        
  0f60  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0f64  60E9           addr 60e9                         
LAB_M69_r4_24000__0f66:
  0f66  39             RTS                               

; ---- function FUN_M69_r4_24000__0f67
FUN_M69_r4_24000__0f67:
  0f67  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  "
  0f6b  2070616E2031.. ds " pan 1  "                     
  0f73  2070616E2032.. ds " pan 2  "                     
  0f7b  2070616E2033.. ds " pan 3  "                     
  0f83  2070616E2034.. ds " pan 4  "                     
LAB_M69_r4_24000__0f8b:
  0f8b  AD9FFDF2       JSR [0xfdf2]                      
  0f8f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2171 ->$217F ->$218D ->$219B ->$0FA0 ->$0FA0
  0f93  2171           addr M69_r4_24000::2171           
  0f95  217F           addr M69_r4_24000::217f           
  0f97  218D           addr M69_r4_24000::218d           
  0f99  219B           addr M69_r4_24000::219b           
  0f9b  0FA0           addr M69_r4_24000::0fa0           
  0f9d  0FA0           addr M69_r4_24000::0fa0           
LAB_M69_r4_24000__0f9f:
  0f9f  39             RTS                               

; ---- function FUN_M69_r4_24000__0fa0
FUN_M69_r4_24000__0fa0:
  0fa0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 5  " " pan 6  " [*] " return "
  0fa4  2070616E2035.. ds " pan 5  "                     
  0fac  2070616E2036.. ds " pan 6  "                     
  0fb4  01             db 1h                             
  0fb5  207265747572.. ds " return "                     
LAB_M69_r4_24000__0fbd:
  0fbd  AD9FFDF2       JSR [0xfdf2]                      
  0fc1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$21A9 ->$21B7 ->$10D9 ->$10D9 ->$0F67 ->$0F67
  0fc5  21A9           addr M69_r4_24000::21a9           
  0fc7  21B7           addr M69_r4_24000::21b7           
  0fc9  10D9           addr M69_r4_24000::10d9           
  0fcb  10D9           addr M69_r4_24000::10d9           
  0fcd  0F67           addr M69_r4_24000::0f67           
  0fcf  0F67           addr M69_r4_24000::0f67           
LAB_M69_r4_24000__0fd1:
  0fd1  FC7142         LDD 0x7142                        
  0fd4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0fd8  60E9           addr 60e9                         
LAB_M69_r4_24000__0fda:
  0fda  39             RTS                               

; ---- function FUN_M69_r4_24000__0fdb
FUN_M69_r4_24000__0fdb:
  0fdb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  fb   1" "  fb   2" "  fb   3" "  fb  4 "
  0fdf  202066622020.. ds "  fb   1"                     
  0fe7  202066622020.. ds "  fb   2"                     
  0fef  202066622020.. ds "  fb   3"                     
  0ff7  202066622020.. ds "  fb  4 "                     
LAB_M69_r4_24000__0fff:
  0fff  AD9FFDF2       JSR [0xfdf2]                      
  1003  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$22F2 ->$22FC ->$2306 ->$2310 ->$1014 ->$1014
  1007  22F2           addr M69_r4_24000::22f2           
  1009  22FC           addr M69_r4_24000::22fc           
  100b  2306           addr M69_r4_24000::2306           
  100d  2310           addr M69_r4_24000::2310           
  100f  1014           addr M69_r4_24000::1014           
  1011  1014           addr M69_r4_24000::1014           
LAB_M69_r4_24000__1013:
  1013  39             RTS                               

; ---- function FUN_M69_r4_24000__1014
FUN_M69_r4_24000__1014:
  1014  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  fb   5" "  fb  6 " [*] " return "
  1018  202066622020.. ds "  fb   5"                     
  1020  202066622020.. ds "  fb  6 "                     
  1028  01             db 1h                             
  1029  207265747572.. ds " return "                     
LAB_M69_r4_24000__1031:
  1031  AD9FFDF2       JSR [0xfdf2]                      
  1035  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$231A ->$2324 ->$10D9 ->$10D9 ->$0FDB ->$0FDB
  1039  231A           addr M69_r4_24000::231a           
  103b  2324           addr M69_r4_24000::2324           
  103d  10D9           addr M69_r4_24000::10d9           
  103f  10D9           addr M69_r4_24000::10d9           
  1041  0FDB           addr M69_r4_24000::0fdb           
  1043  0FDB           addr M69_r4_24000::0fdb           
LAB_M69_r4_24000__1045:
  1045  FC7142         LDD 0x7142                        
  1048  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  104c  60E9           addr 60e9                         
LAB_M69_r4_24000__104e:
  104e  39             RTS                               

; ---- function FUN_M69_r4_24000__104f
FUN_M69_r4_24000__104f:
  104f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] " range  " [-] [-]
  1053  00             db 0h                             
  1054  2072616E6765.. ds " range  "                     
  105c  00             db 0h                             
  105d  00             db 0h                             
LAB_M69_r4_24000__105e:
  105e  AD9FFDF2       JSR [0xfdf2]                      
  1062  39             RTS                               

; ---- function FUN_M69_r4_24000__1063
FUN_M69_r4_24000__1063:
  1063  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] " return "
  1067  6C6566742069.. ds "left in "                     
  106f  726967687420.. ds "right in"                     
  1077  01             db 1h                             
  1078  207265747572.. ds " return "                     
LAB_M69_r4_24000__1080:
  1080  AD9FFDF2       JSR [0xfdf2]                      
  1084  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2648 ->$26C3 ->$10D9 ->$10D9 ->$109E ->$109E
  1088  2648           addr M69_r4_24000::2648           
  108a  26C3           addr M69_r4_24000::26c3           
  108c  10D9           addr M69_r4_24000::10d9           
  108e  10D9           addr M69_r4_24000::10d9           
  1090  109E           addr M69_r4_24000::109e           
  1092  109E           addr M69_r4_24000::109e           
LAB_M69_r4_24000__1094:
  1094  FC7142         LDD 0x7142                        
  1097  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  109b  60E9           addr 60e9                         
LAB_M69_r4_24000__109d:
  109d  39             RTS                               

; ---- function FUN_M69_r4_24000__109e
FUN_M69_r4_24000__109e:
  109e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] " return "
  10a2  6C656674206F.. ds "left out"                     
  10aa  72696768746F.. ds "rightout"                     
  10b2  01             db 1h                             
  10b3  207265747572.. ds " return "                     
LAB_M69_r4_24000__10bb:
  10bb  AD9FFDF2       JSR [0xfdf2]                      
  10bf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$273E ->$27B9 ->$10D9 ->$10D9 ->$1063 ->$1063
  10c3  273E           addr M69_r4_24000::273e           
  10c5  27B9           addr M69_r4_24000::27b9           
  10c7  10D9           addr M69_r4_24000::10d9           
  10c9  10D9           addr M69_r4_24000::10d9           
  10cb  1063           addr M69_r4_24000::1063           
  10cd  1063           addr M69_r4_24000::1063           
LAB_M69_r4_24000__10cf:
  10cf  FC7142         LDD 0x7142                        
  10d2  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  10d6  60E9           addr 60e9                         
LAB_M69_r4_24000__10d8:
  10d8  39             RTS                               

; ---- function FUN_M69_r4_24000__10d9
FUN_M69_r4_24000__10d9:
  10d9  39             RTS                               
PTR_FUN_M69_r4_24000__115d_M69_r4_24000__10da:
  10da  115D           addr M69_r4_24000::115d           
  10dc  1124           addr M69_r4_24000::1124           
  10de  .db 11 18 70 30 70 32 00 00 70 34 71 4C 71 9B 01 FF  ; ..p0p2..p4qLq...
  10ee  .db 9C 00 64 00 01 00 04 22 11 48 00 00 00 00 70 36  ; ..d....".H....p6
  10fe  .db 71 9D                                            ; q.

; ---- function FUN_M69_r4_24000__1100
FUN_M69_r4_24000__1100:
  1100  3410           PSHS  X                           
  1102  8E10DA         LDX #0x10da                        ; desc[API_FE6A]: ->$115D ->$1124
  1105  AD9FFE6A       JSR [0xfe6a]                      
  1109  3510           PULS  X                           
  110b  39             RTS                               

; ---- function FUN_M69_r4_24000__110c
FUN_M69_r4_24000__110c:
  110c  3410           PSHS  X                           
  110e  8E10DA         LDX #0x10da                        ; desc[API_FDBC]: ->$115D ->$1124
  1111  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1115  3510           PULS  X                           
  1117  39             RTS                               

; ---- function FUN_M69_r4_24000__1118
FUN_M69_r4_24000__1118:
  1118  3410           PSHS  X                           
  111a  8E10DA         LDX #0x10da                        ; desc[API_FE6C]: ->$115D ->$1124
  111d  AD9FFE6C       JSR [0xfe6c]                      
  1121  3510           PULS  X                           
  1123  39             RTS                               

; ---- function FUN_M69_r4_24000__1124
FUN_M69_r4_24000__1124:
  1124  3410           PSHS  X                           
  1126  8E10DA         LDX #0x10da                        ; desc[API_FE6E]: ->$115D ->$1124
  1129  AD9FFE6E       JSR [0xfe6e]                      
  112d  3510           PULS  X                           
  112f  39             RTS                               

; ---- function FUN_M69_r4_24000__1130
FUN_M69_r4_24000__1130:
  1130  3410           PSHS  X                           
  1132  8E10DA         LDX #0x10da                        ; desc[API_FE1C]: ->$115D ->$1124
  1135  AD9FFE1C       JSR [0xfe1c]                      
  1139  3510           PULS  X                           
  113b  39             RTS                               

; ---- function FUN_M69_r4_24000__113c
FUN_M69_r4_24000__113c:
  113c  3410           PSHS  X                           
  113e  8E10DA         LDX #0x10da                        ; desc[API_FE1A]: ->$115D ->$1124 $1118
  1141  AD9FFE1A       JSR [0xfe1a]                      
  1145  3510           PULS  X                           
  1147  39             RTS                               
  1148  .db 14 6D 61 73 74 65 72 20 66 64 62 61 63 6B 3A 20  ; .master fdback: 
  1158  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M69_r4_24000__115d
FUN_M69_r4_24000__115d:
  115d  3466           PSHS  U Y B A                     
  115f  8E10DA         LDX #0x10da                       
  1162  AD9FFE76       JSR [0xfe76]                      
  1166  FC7068         LDD 0x7068                        
  1169  10830000       CMPD #0x0                         
  116d  10270053       LBEQ 0x11c4                       
  1171  FC7034         LDD 0x7034                        
  1174  3606           PSHU  B A                         
  1176  CC0134         LDD #0x134                        
  1179  3606           PSHU  B A                         
  117b  AD9FFCEC       JSR [0xfcec]                      
  117f  3706           PULU  A B                         
  1181  FD711A         STD 0x711a                        
  1184  FC7034         LDD 0x7034                        
  1187  3606           PSHU  B A                         
  1189  CC7851         LDD #0x7851                       
  118c  3606           PSHU  B A                         
  118e  AD9FFCF2       JSR [0xfcf2]                      
  1192  3706           PULU  A B                         
  1194  F3711A         ADDD 0x711a                       
  1197  FD7146         STD 0x7146                        
  119a  CC000A         LDD #0xa                          
  119d  AD9FFD20       JSR [0xfd20]                      
  11a1  108E0240       LDY #0x240                        
  11a5  FC7146         LDD 0x7146                        
  11a8  AD9FFD2E       JSR [0xfd2e]                      
  11ac  CC7FFF         LDD #0x7fff                       
  11af  FD711C         STD 0x711c                        
  11b2  CC000A         LDD #0xa                          
  11b5  AD9FFD20       JSR [0xfd20]                      
  11b9  108E0241       LDY #0x241                        
  11bd  FC711C         LDD 0x711c                        
  11c0  AD9FFD2E       JSR [0xfd2e]                      
LAB_M69_r4_24000__11c4:
  11c4  3566           PULS  A B Y U                     
  11c6  39             RTS                               
PTR_FUN_M69_r4_24000__124a_M69_r4_24000__11c7:
  11c7  124A           addr M69_r4_24000::124a           
  11c9  1211           addr M69_r4_24000::1211           
  11cb  .db 12 05 70 48 70 4A 00 00 70 4C 71 4C 71 81 03 00  ; ..pHpJ..pLqLq...
  11db  .db 00 00 64 00 01 00 03 20 12 35 00 00 00 00 70 4E  ; ..d.... .5....pN
  11eb  .db 71 83                                            ; q.

; ---- function FUN_M69_r4_24000__11ed
FUN_M69_r4_24000__11ed:
  11ed  3410           PSHS  X                           
  11ef  8E11C7         LDX #0x11c7                        ; desc[API_FE6A]: ->$124A ->$1211
  11f2  AD9FFE6A       JSR [0xfe6a]                      
  11f6  3510           PULS  X                           
  11f8  39             RTS                               

; ---- function FUN_M69_r4_24000__11f9
FUN_M69_r4_24000__11f9:
  11f9  3410           PSHS  X                           
  11fb  8E11C7         LDX #0x11c7                        ; desc[API_FDBC]: ->$124A ->$1211
  11fe  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1202  3510           PULS  X                           
  1204  39             RTS                               

; ---- function FUN_M69_r4_24000__1205
FUN_M69_r4_24000__1205:
  1205  3410           PSHS  X                           
  1207  8E11C7         LDX #0x11c7                        ; desc[API_FE6C]: ->$124A ->$1211
  120a  AD9FFE6C       JSR [0xfe6c]                      
  120e  3510           PULS  X                           
  1210  39             RTS                               

; ---- function FUN_M69_r4_24000__1211
FUN_M69_r4_24000__1211:
  1211  3410           PSHS  X                           
  1213  8E11C7         LDX #0x11c7                        ; desc[API_FE6E]: ->$124A ->$1211
  1216  AD9FFE6E       JSR [0xfe6e]                      
  121a  3510           PULS  X                           
  121c  39             RTS                               

; ---- function FUN_M69_r4_24000__121d
FUN_M69_r4_24000__121d:
  121d  3410           PSHS  X                           
  121f  8E11C7         LDX #0x11c7                        ; desc[API_FE1C]: ->$124A ->$1211
  1222  AD9FFE1C       JSR [0xfe1c]                      
  1226  3510           PULS  X                           
  1228  39             RTS                               

; ---- function FUN_M69_r4_24000__1229
FUN_M69_r4_24000__1229:
  1229  3410           PSHS  X                           
  122b  8E11C7         LDX #0x11c7                        ; desc[API_FE1A]: ->$124A ->$1211 $1205
  122e  AD9FFE1A       JSR [0xfe1a]                      
  1232  3510           PULS  X                           
  1234  39             RTS                               
  1235  .db 14 6D 61 73 74 65 72 20 72 61 74 65 3A 20 20 20  ; .master rate:   
  1245  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M69_r4_24000__124a
FUN_M69_r4_24000__124a:
  124a  3466           PSHS  U Y B A                     
  124c  8E11C7         LDX #0x11c7                       
  124f  AD9FFE76       JSR [0xfe76]                      
  1253  FC704C         LDD 0x704c                        
  1256  3606           PSHU  B A                         
  1258  CC0147         LDD #0x147                        
  125b  3606           PSHU  B A                         
  125d  AD9FFCEE       JSR [0xfcee]                      
  1261  FC704C         LDD 0x704c                        
  1264  3606           PSHU  B A                         
  1266  CC55C2         LDD #0x55c2                       
  1269  3606           PSHU  B A                         
  126b  AD9FFCF2       JSR [0xfcf2]                      
  126f  AD9FFCE2       JSR [0xfce2]                      
  1273  3706           PULU  A B                         
  1275  FD7138         STD 0x7138                        
  1278  171CAF         LBSR 0x2f2a                       
  127b  3566           PULS  A B Y U                     
  127d  39             RTS                               
PTR_FUN_M69_r4_24000__1301_M69_r4_24000__127e:
  127e  1301           addr M69_r4_24000::1301           
  1280  12C8           addr M69_r4_24000::12c8           
  1282  .db 12 BC 70 40 70 42 00 00 70 44 71 4C 71 9F 08 00  ; ..p@pB..pDqLq...
  1292  .db 00 00 64 00 01 00 03 21 12 EC 00 00 00 00 70 46  ; ..d....!......pF
  12a2  .db 71 A1                                            ; q.

; ---- function FUN_M69_r4_24000__12a4
FUN_M69_r4_24000__12a4:
  12a4  3410           PSHS  X                           
  12a6  8E127E         LDX #0x127e                        ; desc[API_FE6A]: ->$1301 ->$12C8
  12a9  AD9FFE6A       JSR [0xfe6a]                      
  12ad  3510           PULS  X                           
  12af  39             RTS                               

; ---- function FUN_M69_r4_24000__12b0
FUN_M69_r4_24000__12b0:
  12b0  3410           PSHS  X                           
  12b2  8E127E         LDX #0x127e                        ; desc[API_FDBC]: ->$1301 ->$12C8
  12b5  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...~"
  12b9  3510           PULS  X                           
  12bb  39             RTS                               

; ---- function FUN_M69_r4_24000__12bc
FUN_M69_r4_24000__12bc:
  12bc  3410           PSHS  X                           
  12be  8E127E         LDX #0x127e                        ; desc[API_FE6C]: ->$1301 ->$12C8
  12c1  AD9FFE6C       JSR [0xfe6c]                      
  12c5  3510           PULS  X                           
  12c7  39             RTS                               

; ---- function FUN_M69_r4_24000__12c8
FUN_M69_r4_24000__12c8:
  12c8  3410           PSHS  X                           
  12ca  8E127E         LDX #0x127e                        ; desc[API_FE6E]: ->$1301 ->$12C8
  12cd  AD9FFE6E       JSR [0xfe6e]                      
  12d1  3510           PULS  X                           
  12d3  39             RTS                               

; ---- function FUN_M69_r4_24000__12d4
FUN_M69_r4_24000__12d4:
  12d4  3410           PSHS  X                           
  12d6  8E127E         LDX #0x127e                        ; desc[API_FE1C]: ->$1301 ->$12C8
  12d9  AD9FFE1C       JSR [0xfe1c]                      
  12dd  3510           PULS  X                           
  12df  39             RTS                               

; ---- function FUN_M69_r4_24000__12e0
FUN_M69_r4_24000__12e0:
  12e0  3410           PSHS  X                           
  12e2  8E127E         LDX #0x127e                        ; desc[API_FE1A]: ->$1301 ->$12C8 $12BC
  12e5  AD9FFE1A       JSR [0xfe1a]                      
  12e9  3510           PULS  X                           
  12eb  39             RTS                               
  12ec  .db 14 6D 61 73 74 65 72 20 64 65 70 74 68 3A 20 20  ; .master depth:  
  12fc  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M69_r4_24000__1301
FUN_M69_r4_24000__1301:
  1301  3466           PSHS  U Y B A                     
  1303  8E127E         LDX #0x127e                       
  1306  AD9FFE76       JSR [0xfe76]                      
  130a  FC7044         LDD 0x7044                        
  130d  3606           PSHU  B A                         
  130f  CC0147         LDD #0x147                        
  1312  3606           PSHU  B A                         
  1314  AD9FFCEE       JSR [0xfcee]                      
  1318  3706           PULU  A B                         
  131a  FD7136         STD 0x7136                        
  131d  171C7E         LBSR 0x2f9e                       
  1320  3566           PULS  A B Y U                     
  1322  39             RTS                               
PTR_FUN_M69_r4_24000__13a6_M69_r4_24000__1323:
  1323  13A6           addr M69_r4_24000::13a6           
  1325  136D           addr M69_r4_24000::136d           
  1327  .db 13 61 70 50 70 52 00 00 70 54 71 4C 71 7D 02 00  ; .apPpR..pTqLq}..
  1337  .db 00 00 64 00 01 00 03 22 13 91 00 00 00 00 70 56  ; ..d...."......pV
  1347  .db 71 7F                                            ; q.

; ---- function FUN_M69_r4_24000__1349
FUN_M69_r4_24000__1349:
  1349  3410           PSHS  X                           
  134b  8E1323         LDX #0x1323                        ; desc[API_FE6A]: ->$13A6 ->$136D
  134e  AD9FFE6A       JSR [0xfe6a]                      
  1352  3510           PULS  X                           
  1354  39             RTS                               

; ---- function FUN_M69_r4_24000__1355
FUN_M69_r4_24000__1355:
  1355  3410           PSHS  X                           
  1357  8E1323         LDX #0x1323                        ; desc[API_FDBC]: ->$13A6 ->$136D
  135a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...#"
  135e  3510           PULS  X                           
  1360  39             RTS                               

; ---- function FUN_M69_r4_24000__1361
FUN_M69_r4_24000__1361:
  1361  3410           PSHS  X                           
  1363  8E1323         LDX #0x1323                        ; desc[API_FE6C]: ->$13A6 ->$136D
  1366  AD9FFE6C       JSR [0xfe6c]                      
  136a  3510           PULS  X                           
  136c  39             RTS                               

; ---- function FUN_M69_r4_24000__136d
FUN_M69_r4_24000__136d:
  136d  3410           PSHS  X                           
  136f  8E1323         LDX #0x1323                        ; desc[API_FE6E]: ->$13A6 ->$136D
  1372  AD9FFE6E       JSR [0xfe6e]                      
  1376  3510           PULS  X                           
  1378  39             RTS                               

; ---- function FUN_M69_r4_24000__1379
FUN_M69_r4_24000__1379:
  1379  3410           PSHS  X                           
  137b  8E1323         LDX #0x1323                        ; desc[API_FE1C]: ->$13A6 ->$136D
  137e  AD9FFE1C       JSR [0xfe1c]                      
  1382  3510           PULS  X                           
  1384  39             RTS                               

; ---- function FUN_M69_r4_24000__1385
FUN_M69_r4_24000__1385:
  1385  3410           PSHS  X                           
  1387  8E1323         LDX #0x1323                        ; desc[API_FE1A]: ->$13A6 ->$136D $1361
  138a  AD9FFE1A       JSR [0xfe1a]                      
  138e  3510           PULS  X                           
  1390  39             RTS                               
  1391  .db 14 6D 61 73 74 65 72 20 64 65 6C 61 79 3A 20 20  ; .master delay:  
  13a1  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M69_r4_24000__13a6
FUN_M69_r4_24000__13a6:
  13a6  3466           PSHS  U Y B A                     
  13a8  8E1323         LDX #0x1323                       
  13ab  AD9FFE76       JSR [0xfe76]                      
  13af  FC7054         LDD 0x7054                        
  13b2  3606           PSHU  B A                         
  13b4  CC0147         LDD #0x147                        
  13b7  3606           PSHU  B A                         
  13b9  AD9FFCEE       JSR [0xfcee]                      
  13bd  3706           PULU  A B                         
  13bf  FD713A         STD 0x713a                        
  13c2  171ABD         LBSR 0x2e82                       
  13c5  3566           PULS  A B Y U                     
  13c7  39             RTS                               
PTR_FUN_M69_r4_24000__145e_M69_r4_24000__13c8:
  13c8  145E           addr M69_r4_24000::145e           
  13ca  1412           addr M69_r4_24000::1412           
  13cc  .db 14 06 70 38 70 3A 00 00 70 3C 71 4C 71 89 04 00  ; ..p8p:..p<qLq...
  13dc  .db 00 27 10 00 01 02 06 20 14 36 00 00 00 00 70 3E  ; .'..... .6....p>
  13ec  .db 71 8B                                            ; q.

; ---- function FUN_M69_r4_24000__13ee
FUN_M69_r4_24000__13ee:
  13ee  3410           PSHS  X                           
  13f0  8E13C8         LDX #0x13c8                        ; desc[API_FE6A]: ->$145E ->$1412
  13f3  AD9FFE6A       JSR [0xfe6a]                      
  13f7  3510           PULS  X                           
  13f9  39             RTS                               

; ---- function FUN_M69_r4_24000__13fa
FUN_M69_r4_24000__13fa:
  13fa  3410           PSHS  X                           
  13fc  8E13C8         LDX #0x13c8                        ; desc[API_FDBC]: ->$145E ->$1412
  13ff  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1403  3510           PULS  X                           
  1405  39             RTS                               

; ---- function FUN_M69_r4_24000__1406
FUN_M69_r4_24000__1406:
  1406  3410           PSHS  X                           
  1408  8E13C8         LDX #0x13c8                        ; desc[API_FE6C]: ->$145E ->$1412
  140b  AD9FFE6C       JSR [0xfe6c]                      
  140f  3510           PULS  X                           
  1411  39             RTS                               

; ---- function FUN_M69_r4_24000__1412
FUN_M69_r4_24000__1412:
  1412  3410           PSHS  X                           
  1414  8E13C8         LDX #0x13c8                        ; desc[API_FE6E]: ->$145E ->$1412
  1417  AD9FFE6E       JSR [0xfe6e]                      
  141b  3510           PULS  X                           
  141d  39             RTS                               

; ---- function FUN_M69_r4_24000__141e
FUN_M69_r4_24000__141e:
  141e  3410           PSHS  X                           
  1420  8E13C8         LDX #0x13c8                        ; desc[API_FE1C]: ->$145E ->$1412
  1423  AD9FFE1C       JSR [0xfe1c]                      
  1427  3510           PULS  X                           
  1429  39             RTS                               

; ---- function FUN_M69_r4_24000__142a
FUN_M69_r4_24000__142a:
  142a  3410           PSHS  X                           
  142c  8E13C8         LDX #0x13c8                        ; desc[API_FE1A]: ->$145E ->$1412 $1406
  142f  AD9FFE1A       JSR [0xfe1a]                      
  1433  3510           PULS  X                           
  1435  39             RTS                               
  1436  .db 14 67 6C 69 64 65 20 72 61 74 65 3A 20 20 20 20  ; .glide rate:    
  1446  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M69_r4_24000__144b
FUN_M69_r4_24000__144b:
  144b  3406           PSHS  B A                         
  144d  17FF9E         LBSR 0x13ee                       
  1450  C605           LDB #0x5                          
  1452  F76066         STB 0x6066                        
  1455  CC0064         LDD #0x64                         
  1458  FD60DC         STD 0x60dc                        
  145b  3506           PULS  A B                         
  145d  39             RTS                               

; ---- function FUN_M69_r4_24000__145e
FUN_M69_r4_24000__145e:
  145e  3476           PSHS  U Y X B A                   
  1460  8E13C8         LDX #0x13c8                       
  1463  AD9FFE76       JSR [0xfe76]                      
  1467  FC703C         LDD 0x703c                        
  146a  3606           PSHU  B A                         
  146c  CC0003         LDD #0x3                          
  146f  3606           PSHU  B A                         
  1471  AD9FFCEE       JSR [0xfcee]                      
  1475  FC703C         LDD 0x703c                        
  1478  3606           PSHU  B A                         
  147a  CC236B         LDD #0x236b                       
  147d  3606           PSHU  B A                         
  147f  AD9FFCF2       JSR [0xfcf2]                      
  1483  AD9FFCE2       JSR [0xfce2]                      
  1487  3706           PULU  A B                         
  1489  FD7130         STD 0x7130                        
  148c  FC703C         LDD 0x703c                        
  148f  10830064       CMPD #0x64                        
  1493  102C000B       LBGE 0x14a2                       
  1497  CC0064         LDD #0x64                         
  149a  FD7134         STD 0x7134                        
  149d  CC010E         LDD #0x10e                        
  14a0  2009           BRA 0x14ab                        
LAB_M69_r4_24000__14a2:
  14a2  CC0000         LDD #0x0                          
  14a5  FD7134         STD 0x7134                        
  14a8  CC6978         LDD #0x6978                       
LAB_M69_r4_24000__14ab:
  14ab  3606           PSHU  B A                         
  14ad  FC703C         LDD 0x703c                        
  14b0  3606           PSHU  B A                         
  14b2  AD9FFCE6       JSR [0xfce6]                      
  14b6  FC7140         LDD 0x7140                        
  14b9  3606           PSHU  B A                         
  14bb  AD9FFCEE       JSR [0xfcee]                      
  14bf  3706           PULU  A B                         
  14c1  FD7132         STD 0x7132                        
  14c4  FC7148         LDD 0x7148                        
  14c7  1083FFFF       CMPD #0xffff                      
  14cb  10270010       LBEQ 0x14df                       
  14cf  FC7134         LDD 0x7134                        
  14d2  FD714A         STD 0x714a                        
  14d5  FC7132         LDD 0x7132                        
  14d8  AD9FFCC4       JSR [0xfcc4]                      
  14dc  1719A3         LBSR 0x2e82                       
LAB_M69_r4_24000__14df:
  14df  3576           PULS  A B X Y U                   
  14e1  39             RTS                               

; ---- function FUN_M69_r4_24000__14e2
FUN_M69_r4_24000__14e2:
  14e2  3426           PSHS  Y B A                       
  14e4  AD9FFC8E       JSR [0xfc8e]                      
  14e8  FC60F9         LDD 0x60f9                        
  14eb  FD7070         STD 0x7070                        
  14ee  FD6074         STD 0x6074                        
  14f1  1700B4         LBSR 0x15a8                       
  14f4  CC718D         LDD #0x718d                       
  14f7  83714C         SUBD #0x714c                      
  14fa  1F02           TFR D,Y                           
  14fc  FC7070         LDD 0x7070                        
  14ff  AD9FFC80       JSR [0xfc80]                      
  1503  3526           PULS  A B Y                       
  1505  39             RTS                               

; ---- function FUN_M69_r4_24000__1506
FUN_M69_r4_24000__1506:
  1506  3406           PSHS  B A                         
  1508  FC7070         LDD 0x7070                        
  150b  FD6074         STD 0x6074                        
  150e  17F4A5         LBSR 0x09b6                       
  1511  C613           LDB #0x13                         
  1513  AD9FFC36       JSR [0xfc36]                      
  1517  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay gliding:      "
  151b  0A64656C6179.. char[22] "\ndelay gliding:      " 
LAB_M69_r4_24000__1531:
  1531  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$157A ->$1553 $0001 $0001 $0000
  1535  01             db 1h                             
  1536  01             db 1h                             
  1537  02             db 2h                             
  1538  01             db 1h                             
  1539  01             db 1h                             
  153a  00             db 0h                             
  153b  02             db 2h                             
  153c  80             db 80h                            
  153d  0000           dw 0h                             
  153f  FFFF           dw FFFFh                          
  1541  0000           dw 0h                             
  1543  157A           addr M69_r4_24000::157a           
  1545  1553           addr M69_r4_24000::1553           
  1547  0001           dw 1h                             
  1549  0001           dw 1h                             
  154b  0000           dw 0h                             
LAB_M69_r4_24000__154d:
  154d  17002A         LBSR 0x157a                       
  1550  3506           PULS  A B                         
  1552  39             RTS                               

; ---- function FUN_M69_r4_24000__1553
FUN_M69_r4_24000__1553:
  1553  3426           PSHS  Y B A                       
  1555  FC6074         LDD 0x6074                        
  1558  FD7070         STD 0x7070                        
  155b  CC718D         LDD #0x718d                       
  155e  83714C         SUBD #0x714c                      
  1561  1F02           TFR D,Y                           
  1563  FC7070         LDD 0x7070                        
  1566  AD9FFC80       JSR [0xfc80]                      
  156a  108E0005       LDY #0x5                          
  156e  FC7070         LDD 0x7070                        
  1571  AD9FFE40       JSR [0xfe40]                      
  1575  8D31           BSR 0x15a8                        
  1577  3526           PULS  A B Y                       
  1579  39             RTS                               

; ---- function FUN_M69_r4_24000__157a
FUN_M69_r4_24000__157a:
  157a  3456           PSHS  U X B A                     
  157c  FC7070         LDD 0x7070                        
  157f  10830000       CMPD #0x0                         
  1583  10270010       LBEQ 0x1597                       
  1587  C623           LDB #0x23                         
  1589  AD9FFC36       JSR [0xfc36]                      
  158d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "off"
  1591  6F666600       char[4] "off"                     
LAB_M69_r4_24000__1595:
  1595  200E           BRA 0x15a5                        
LAB_M69_r4_24000__1597:
  1597  C623           LDB #0x23                         
  1599  AD9FFC36       JSR [0xfc36]                      
  159d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "on "
  15a1  6F6E2000       char[4] "on "                     
LAB_M69_r4_24000__15a5:
  15a5  3556           PULS  A B X U                     
  15a7  39             RTS                               

; ---- function FUN_M69_r4_24000__15a8
FUN_M69_r4_24000__15a8:
  15a8  39             RTS                               
PTR_FUN_M69_r4_24000__162c_M69_r4_24000__15a9:
  15a9  162C           addr M69_r4_24000::162c           
  15ab  15F3           addr M69_r4_24000::15f3           
  15ad  .db 15 E7 70 58 70 5A 00 00 70 5C 71 4C 71 C7 09 FF  ; ..pXpZ..p\qLq...
  15bd  .db 9C 00 64 00 01 00 04 22 16 17 00 00 00 00 70 5E  ; ..d...."......p^
  15cd  .db 71 C9                                            ; q.

; ---- function FUN_M69_r4_24000__15cf
FUN_M69_r4_24000__15cf:
  15cf  3410           PSHS  X                           
  15d1  8E15A9         LDX #0x15a9                        ; desc[API_FE6A]: ->$162C ->$15F3
  15d4  AD9FFE6A       JSR [0xfe6a]                      
  15d8  3510           PULS  X                           
  15da  39             RTS                               

; ---- function FUN_M69_r4_24000__15db
FUN_M69_r4_24000__15db:
  15db  3410           PSHS  X                           
  15dd  8E15A9         LDX #0x15a9                        ; desc[API_FDBC]: ->$162C ->$15F3
  15e0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  15e4  3510           PULS  X                           
  15e6  39             RTS                               

; ---- function FUN_M69_r4_24000__15e7
FUN_M69_r4_24000__15e7:
  15e7  3410           PSHS  X                           
  15e9  8E15A9         LDX #0x15a9                        ; desc[API_FE6C]: ->$162C ->$15F3
  15ec  AD9FFE6C       JSR [0xfe6c]                      
  15f0  3510           PULS  X                           
  15f2  39             RTS                               

; ---- function FUN_M69_r4_24000__15f3
FUN_M69_r4_24000__15f3:
  15f3  3410           PSHS  X                           
  15f5  8E15A9         LDX #0x15a9                        ; desc[API_FE6E]: ->$162C ->$15F3
  15f8  AD9FFE6E       JSR [0xfe6e]                      
  15fc  3510           PULS  X                           
  15fe  39             RTS                               

; ---- function FUN_M69_r4_24000__15ff
FUN_M69_r4_24000__15ff:
  15ff  3410           PSHS  X                           
  1601  8E15A9         LDX #0x15a9                        ; desc[API_FE1C]: ->$162C ->$15F3
  1604  AD9FFE1C       JSR [0xfe1c]                      
  1608  3510           PULS  X                           
  160a  39             RTS                               

; ---- function FUN_M69_r4_24000__160b
FUN_M69_r4_24000__160b:
  160b  3410           PSHS  X                           
  160d  8E15A9         LDX #0x15a9                        ; desc[API_FE1A]: ->$162C ->$15F3 $15E7
  1610  AD9FFE1A       JSR [0xfe1a]                      
  1614  3510           PULS  X                           
  1616  39             RTS                               
  1617  .db 14 6D 61 73 74 65 72 20 66 64 62 61 63 6B 3A 20  ; .master fdback: 
  1627  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M69_r4_24000__162c
FUN_M69_r4_24000__162c:
  162c  3476           PSHS  U Y X B A                   
  162e  8E15A9         LDX #0x15a9                       
  1631  AD9FFE76       JSR [0xfe76]                      
  1635  FC705C         LDD 0x705c                        
  1638  3606           PSHU  B A                         
  163a  CC0147         LDD #0x147                        
  163d  3606           PSHU  B A                         
  163f  AD9FFCEC       JSR [0xfcec]                      
  1643  3706           PULU  A B                         
  1645  FD711A         STD 0x711a                        
  1648  FC705C         LDD 0x705c                        
  164b  3606           PSHU  B A                         
  164d  CC55C1         LDD #0x55c1                       
  1650  3606           PSHU  B A                         
  1652  AD9FFCF2       JSR [0xfcf2]                      
  1656  3706           PULU  A B                         
  1658  F3711A         ADDD 0x711a                       
  165b  FD713C         STD 0x713c                        
  165e  171A57         LBSR 0x30b8                       
  1661  3576           PULS  A B X Y U                   
  1663  39             RTS                               
PTR_FUN_M69_r4_24000__1745_M69_r4_24000__1664:
  1664  1745           addr M69_r4_24000::1745           
  1666  16EA           addr M69_r4_24000::16ea           
  1668  .db 16 C6 70 60 70 62 00 00 70 64 71 4C 71 CB 0A FF  ; ..p`pb..pdqLq...
  1678  .db 9C 00 64 00 01 00 04 22 16 8A 00 00 00 00 70 66  ; ..d...."......pf
  1688  .db 71 CD 05 69 6D 61 67 65 20 77 69 64 74 68 3A 2D  ; q..image width:-
  1698  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  16a8  .db 20 20 20 20 20 2D                                ;      -

; ---- function FUN_M69_r4_24000__16ae
FUN_M69_r4_24000__16ae:
  16ae  3410           PSHS  X                           
  16b0  8E1664         LDX #0x1664                        ; desc[API_FDBC]: ->$1745 ->$16EA
  16b3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...d"
  16b7  3510           PULS  X                           
  16b9  39             RTS                               

; ---- function FUN_M69_r4_24000__16ba
FUN_M69_r4_24000__16ba:
  16ba  3410           PSHS  X                           
  16bc  8E1664         LDX #0x1664                        ; desc[API_FE6A]: ->$1745 ->$16EA
  16bf  AD9FFE6A       JSR [0xfe6a]                      
  16c3  3510           PULS  X                           
  16c5  39             RTS                               

; ---- function FUN_M69_r4_24000__16c6
FUN_M69_r4_24000__16c6:
  16c6  3410           PSHS  X                           
  16c8  8E1664         LDX #0x1664                        ; desc[API_FE6C]: ->$1745 ->$16EA
  16cb  AD9FFE6C       JSR [0xfe6c]                      
  16cf  3510           PULS  X                           
  16d1  39             RTS                               

; ---- function FUN_M69_r4_24000__16d2
FUN_M69_r4_24000__16d2:
  16d2  3410           PSHS  X                           
  16d4  8E1664         LDX #0x1664                        ; desc[API_FE1C]: ->$1745 ->$16EA
  16d7  AD9FFE1C       JSR [0xfe1c]                      
  16db  3510           PULS  X                           
  16dd  39             RTS                               

; ---- function FUN_M69_r4_24000__16de
FUN_M69_r4_24000__16de:
  16de  3410           PSHS  X                           
  16e0  8E1664         LDX #0x1664                        ; desc[API_FE1A]: ->$1745 ->$16EA $16C6
  16e3  AD9FFE1A       JSR [0xfe1a]                      
  16e7  3510           PULS  X                           
  16e9  39             RTS                               

; ---- function FUN_M69_r4_24000__16ea
FUN_M69_r4_24000__16ea:
  16ea  3456           PSHS  U X B A                     
  16ec  C612           LDB #0x12                         
  16ee  AD9FFC36       JSR [0xfc36]                      
  16f2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                     "
  16f6  202020202020.. char[22] "                     "  
LAB_M69_r4_24000__170c:
  170c  FC7064         LDD 0x7064                        
  170f  C30064         ADDD #0x64                        
  1712  3606           PSHU  B A                         
  1714  CC000A         LDD #0xa                          
  1717  3606           PSHU  B A                         
  1719  AD9FFCEA       JSR [0xfcea]                      
  171d  3706           PULU  A B                         
  171f  FD711A         STD 0x711a                        
  1722  C30012         ADDD #0x12                        
  1725  AD9FFC36       JSR [0xfc36]                      
  1729  C652           LDB #0x52                         
  172b  AD9FFC2A       JSR [0xfc2a]                      
  172f  CC0014         LDD #0x14                         
  1732  B3711A         SUBD 0x711a                       
  1735  C30012         ADDD #0x12                        
  1738  AD9FFC36       JSR [0xfc36]                      
  173c  C64C           LDB #0x4c                         
  173e  AD9FFC2A       JSR [0xfc2a]                      
  1742  3556           PULS  A B X U                     
  1744  39             RTS                               

; ---- function FUN_M69_r4_24000__1745
FUN_M69_r4_24000__1745:
  1745  3476           PSHS  U Y X B A                   
  1747  8E1664         LDX #0x1664                       
  174a  AD9FFE76       JSR [0xfe76]                      
  174e  FC7064         LDD 0x7064                        
  1751  3606           PSHU  B A                         
  1753  CC0147         LDD #0x147                        
  1756  3606           PSHU  B A                         
  1758  AD9FFCEC       JSR [0xfcec]                      
  175c  3706           PULU  A B                         
  175e  FD713E         STD 0x713e                        
  1761  1718C8         LBSR 0x302c                       
  1764  3576           PULS  A B X Y U                   
  1766  39             RTS                               

; ---- function FUN_M69_r4_24000__1767
FUN_M69_r4_24000__1767:
  1767  3426           PSHS  Y B A                       
  1769  AD9FFC8E       JSR [0xfc8e]                      
  176d  FC60F9         LDD 0x60f9                        
  1770  FD7072         STD 0x7072                        
  1773  FD6074         STD 0x6074                        
  1776  1700BA         LBSR 0x1833                       
  1779  CC718E         LDD #0x718e                       
  177c  83714C         SUBD #0x714c                      
  177f  1F02           TFR D,Y                           
  1781  FC7072         LDD 0x7072                        
  1784  AD9FFC80       JSR [0xfc80]                      
  1788  3526           PULS  A B Y                       
  178a  39             RTS                               

; ---- function FUN_M69_r4_24000__178b
FUN_M69_r4_24000__178b:
  178b  3406           PSHS  B A                         
  178d  FC7072         LDD 0x7072                        
  1790  FD6074         STD 0x6074                        
  1793  17F220         LBSR 0x09b6                       
  1796  C613           LDB #0x13                         
  1798  AD9FFC36       JSR [0xfc36]                      
  179c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " input mode:         "
  17a0  0A696E707574.. char[22] "\ninput mode:         " 
LAB_M69_r4_24000__17b6:
  17b6  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$17FF ->$17D8 $0001 $0001 $0000
  17ba  01             db 1h                             
  17bb  01             db 1h                             
  17bc  02             db 2h                             
  17bd  01             db 1h                             
  17be  01             db 1h                             
  17bf  00             db 0h                             
  17c0  02             db 2h                             
  17c1  80             db 80h                            
  17c2  0000           dw 0h                             
  17c4  FFFF           dw FFFFh                          
  17c6  0000           dw 0h                             
  17c8  17FF           addr M69_r4_24000::17ff           
  17ca  17D8           addr M69_r4_24000::17d8           
  17cc  0001           dw 1h                             
  17ce  0001           dw 1h                             
  17d0  0000           dw 0h                             
LAB_M69_r4_24000__17d2:
  17d2  17002A         LBSR 0x17ff                       
  17d5  3506           PULS  A B                         
  17d7  39             RTS                               

; ---- function FUN_M69_r4_24000__17d8
FUN_M69_r4_24000__17d8:
  17d8  3426           PSHS  Y B A                       
  17da  FC6074         LDD 0x6074                        
  17dd  FD7072         STD 0x7072                        
  17e0  CC718E         LDD #0x718e                       
  17e3  83714C         SUBD #0x714c                      
  17e6  1F02           TFR D,Y                           
  17e8  FC7072         LDD 0x7072                        
  17eb  AD9FFC80       JSR [0xfc80]                      
  17ef  108E0006       LDY #0x6                          
  17f3  FC7072         LDD 0x7072                        
  17f6  AD9FFE40       JSR [0xfe40]                      
  17fa  8D37           BSR 0x1833                        
  17fc  3526           PULS  A B Y                       
  17fe  39             RTS                               

; ---- function FUN_M69_r4_24000__17ff
FUN_M69_r4_24000__17ff:
  17ff  3456           PSHS  U X B A                     
  1801  FC7072         LDD 0x7072                        
  1804  10830000       CMPD #0x0                         
  1808  10270013       LBEQ 0x181f                       
  180c  C620           LDB #0x20                         
  180e  AD9FFC36       JSR [0xfc36]                      
  1812  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "mono  "
  1816  6D6F6E6F2020.. char[7] "mono  "                  
LAB_M69_r4_24000__181d:
  181d  2011           BRA 0x1830                        
LAB_M69_r4_24000__181f:
  181f  C620           LDB #0x20                         
  1821  AD9FFC36       JSR [0xfc36]                      
  1825  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stereo"
  1829  73746572656F.. char[7] "stereo"                  
LAB_M69_r4_24000__1830:
  1830  3556           PULS  A B X U                     
  1832  39             RTS                               

; ---- function FUN_M69_r4_24000__1833
FUN_M69_r4_24000__1833:
  1833  3476           PSHS  U Y X B A                   
  1835  FC7072         LDD 0x7072                        
  1838  10830000       CMPD #0x0                         
  183c  10270014       LBEQ 0x1854                       
  1840  CC000A         LDD #0xa                          
  1843  AD9FFD20       JSR [0xfd20]                      
  1847  108E0349       LDY #0x349                        
  184b  CCFFFF         LDD #0xffff                       
  184e  AD9FFD2E       JSR [0xfd2e]                      
  1852  2012           BRA 0x1866                        
LAB_M69_r4_24000__1854:
  1854  CC000A         LDD #0xa                          
  1857  AD9FFD20       JSR [0xfd20]                      
  185b  108E0349       LDY #0x349                        
  185f  CC0000         LDD #0x0                          
  1862  AD9FFD2E       JSR [0xfd2e]                      
LAB_M69_r4_24000__1866:
  1866  3576           PULS  A B X Y U                   
  1868  39             RTS                               

; ---- function FUN_M69_r4_24000__1869
FUN_M69_r4_24000__1869:
  1869  3426           PSHS  Y B A                       
  186b  AD9FFC8E       JSR [0xfc8e]                      
  186f  FC60F9         LDD 0x60f9                        
  1872  FD7068         STD 0x7068                        
  1875  FD6074         STD 0x6074                        
  1878  1700F0         LBSR 0x196b                       
  187b  3526           PULS  A B Y                       
  187d  39             RTS                               

; ---- function FUN_M69_r4_24000__187e
FUN_M69_r4_24000__187e:
  187e  3406           PSHS  B A                         
  1880  CC10D9         LDD #0x10d9                       
  1883  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1887  6070           addr 6070                         
LAB_M69_r4_24000__1889:
  1889  CC10D9         LDD #0x10d9                       
  188c  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1890  6072           addr 6072                         
LAB_M69_r4_24000__1892:
  1892  FC7068         LDD 0x7068                        
  1895  88FF           EORA #0xff                        
  1897  C8FF           EORB #0xff                        
  1899  FD7068         STD 0x7068                        
  189c  170020         LBSR 0x18bf                       
  189f  3506           PULS  A B                         
  18a1  39             RTS                               

; ---- function FUN_M69_r4_24000__18a2
FUN_M69_r4_24000__18a2:
  18a2  3406           PSHS  B A                         
  18a4  1700C4         LBSR 0x196b                       
  18a7  170031         LBSR 0x18db                       
  18aa  CC10D9         LDD #0x10d9                       
  18ad  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  18b1  6070           addr 6070                         
LAB_M69_r4_24000__18b3:
  18b3  CC10D9         LDD #0x10d9                       
  18b6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  18ba  6072           addr 6072                         
LAB_M69_r4_24000__18bc:
  18bc  3506           PULS  A B                         
  18be  39             RTS                               

; ---- function FUN_M69_r4_24000__18bf
FUN_M69_r4_24000__18bf:
  18bf  3426           PSHS  Y B A                       
  18c1  108E0007       LDY #0x7                          
  18c5  FC7068         LDD 0x7068                        
  18c8  AD9FFE40       JSR [0xfe40]                      
  18cc  17009C         LBSR 0x196b                       
  18cf  8D0A           BSR 0x18db                        
  18d1  17005F         LBSR 0x1933                       
  18d4  AD9FFDEA       JSR [0xfdea]                      
  18d8  3526           PULS  A B Y                       
  18da  39             RTS                               

; ---- function FUN_M69_r4_24000__18db
FUN_M69_r4_24000__18db:
  18db  3456           PSHS  U X B A                     
  18dd  FC7068         LDD 0x7068                        
  18e0  10830000       CMPD #0x0                         
  18e4  10270025       LBEQ 0x190d                       
  18e8  17F0CB         LBSR 0x09b6                       
  18eb  C613           LDB #0x13                         
  18ed  AD9FFC36       JSR [0xfc36]                      
  18f1  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " --normal operation--"
  18f5  0A2D2D6E6F72.. char[22] "\n--normal operation--" 
LAB_M69_r4_24000__190b:
  190b  2023           BRA 0x1930                        
LAB_M69_r4_24000__190d:
  190d  17F0A6         LBSR 0x09b6                       
  1910  C613           LDB #0x13                         
  1912  AD9FFC36       JSR [0xfc36]                      
  1916  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " ---repeat looping---"
  191a  0A2D2D2D7265.. char[22] "\n---repeat looping---" 
LAB_M69_r4_24000__1930:
  1930  3556           PULS  A B X U                     
  1932  39             RTS                               

; ---- function FUN_M69_r4_24000__1933
FUN_M69_r4_24000__1933:
  1933  3456           PSHS  U X B A                     
  1935  FC7068         LDD 0x7068                        
  1938  10830000       CMPD #0x0                         
  193c  10270015       LBEQ 0x1955                       
  1940  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "rept=off" [-] [-]
  1944  00             db 0h                             
  1945  726570743D6F.. ds "rept=off"                     
  194d  00             db 0h                             
  194e  00             db 0h                             
LAB_M69_r4_24000__194f:
  194f  AD9FFDF2       JSR [0xfdf2]                      
  1953  2013           BRA 0x1968                        
LAB_M69_r4_24000__1955:
  1955  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "rept=on " [-] [-]
  1959  00             db 0h                             
  195a  726570743D6F.. ds "rept=on "                     
  1962  00             db 0h                             
  1963  00             db 0h                             
LAB_M69_r4_24000__1964:
  1964  AD9FFDF2       JSR [0xfdf2]                      
LAB_M69_r4_24000__1968:
  1968  3556           PULS  A B X U                     
  196a  39             RTS                               

; ---- function FUN_M69_r4_24000__196b
FUN_M69_r4_24000__196b:
  196b  3476           PSHS  U Y X B A                   
  196d  FC7144         LDD 0x7144                        
  1970  10830000       CMPD #0x0                         
  1974  10270035       LBEQ 0x19ad                       
  1978  FC7068         LDD 0x7068                        
  197b  10830000       CMPD #0x0                         
  197f  10270015       LBEQ 0x1998                       
  1983  CC000A         LDD #0xa                          
  1986  AD9FFD20       JSR [0xfd20]                      
  198a  108E034A       LDY #0x34a                        
  198e  CCFFFF         LDD #0xffff                       
  1991  AD9FFD2E       JSR [0xfd2e]                      
  1995  16009E         LBRA 0x1a36                       
LAB_M69_r4_24000__1998:
  1998  CC000A         LDD #0xa                          
  199b  AD9FFD20       JSR [0xfd20]                      
  199f  108E034A       LDY #0x34a                        
  19a3  CC0000         LDD #0x0                          
  19a6  AD9FFD2E       JSR [0xfd2e]                      
  19aa  160089         LBRA 0x1a36                       
LAB_M69_r4_24000__19ad:
  19ad  FC7068         LDD 0x7068                        
  19b0  10830000       CMPD #0x0                         
  19b4  10270006       LBEQ 0x19be                       
  19b8  17F7A2         LBSR 0x115d                       
  19bb  160078         LBRA 0x1a36                       
LAB_M69_r4_24000__19be:
  19be  CC7FFF         LDD #0x7fff                       
  19c1  FD711A         STD 0x711a                        
  19c4  CC7146         LDD #0x7146                       
  19c7  FD711C         STD 0x711c                        
  19ca  CC0064         LDD #0x64                         
  19cd  FD711E         STD 0x711e                        
  19d0  CC00C8         LDD #0xc8                         
  19d3  FD7120         STD 0x7120                        
LAB_M69_r4_24000__19d6:
  19d6  FC711A         LDD 0x711a                        
  19d9  B3711E         SUBD 0x711e                       
  19dc  FD711A         STD 0x711a                        
  19df  10830000       CMPD #0x0                         
  19e3  2E06           BGT 0x19eb                        
  19e5  CC0000         LDD #0x0                          
  19e8  FD711A         STD 0x711a                        
LAB_M69_r4_24000__19eb:
  19eb  CC000A         LDD #0xa                          
  19ee  AD9FFD20       JSR [0xfd20]                      
  19f2  108E0241       LDY #0x241                        
  19f6  FC711A         LDD 0x711a                        
  19f9  AD9FFD2E       JSR [0xfd2e]                      
  19fd  FC711C         LDD 0x711c                        
  1a00  F37120         ADDD 0x7120                       
  1a03  FD711C         STD 0x711c                        
  1a06  108378AF       CMPD #0x78af                      
  1a0a  2D06           BLT 0x1a12                        
  1a0c  CC78AF         LDD #0x78af                       
  1a0f  FD711C         STD 0x711c                        
LAB_M69_r4_24000__1a12:
  1a12  CC000A         LDD #0xa                          
  1a15  AD9FFD20       JSR [0xfd20]                      
  1a19  108E0240       LDY #0x240                        
  1a1d  FC711C         LDD 0x711c                        
  1a20  AD9FFD2E       JSR [0xfd2e]                      
  1a24  FC711A         LDD 0x711a                        
  1a27  10830000       CMPD #0x0                         
  1a2b  2EA9           BGT 0x19d6                        
  1a2d  FC711C         LDD 0x711c                        
  1a30  108378AF       CMPD #0x78af                      
  1a34  2DA0           BLT 0x19d6                        
LAB_M69_r4_24000__1a36:
  1a36  3576           PULS  A B X Y U                   
  1a38  39             RTS                               

; ---- function FUN_M69_r4_24000__1a39
FUN_M69_r4_24000__1a39:
  1a39  3406           PSHS  B A                         
  1a3b  CC0000         LDD #0x0                          
  1a3e  2021           BRA 0x1a61                        

; ---- function FUN_M69_r4_24000__1a40
FUN_M69_r4_24000__1a40:
  1a40  3406           PSHS  B A                         
  1a42  CC0001         LDD #0x1                          
  1a45  201A           BRA 0x1a61                        

; ---- function FUN_M69_r4_24000__1a47
FUN_M69_r4_24000__1a47:
  1a47  3406           PSHS  B A                         
  1a49  CC0002         LDD #0x2                          
  1a4c  2013           BRA 0x1a61                        

; ---- function FUN_M69_r4_24000__1a4e
FUN_M69_r4_24000__1a4e:
  1a4e  3406           PSHS  B A                         
  1a50  CC0003         LDD #0x3                          
  1a53  200C           BRA 0x1a61                        

; ---- function FUN_M69_r4_24000__1a55
FUN_M69_r4_24000__1a55:
  1a55  3406           PSHS  B A                         
  1a57  CC0004         LDD #0x4                          
  1a5a  2005           BRA 0x1a61                        

; ---- function FUN_M69_r4_24000__1a5c
FUN_M69_r4_24000__1a5c:
  1a5c  3406           PSHS  B A                         
  1a5e  CC0005         LDD #0x5                          
LAB_M69_r4_24000__1a61:
  1a61  1713DC         LBSR 0x2e40                       
  1a64  FC60F9         LDD 0x60f9                        
  1a67  ED9F70EC       STD [0x70ec]                      
  1a6b  FD6074         STD 0x6074                        
  1a6e  10BE70F8       LDY 0x70f8                        
  1a72  AD9FFC80       JSR [0xfc80]                      
  1a76  FC7118         LDD 0x7118                        
  1a79  860E           LDA #0xe                          
  1a7b  3D             MUL                               
  1a7c  C31A8F         ADDD #0x1a8f                      
  1a7f  F3600D         ADDD 0x600d                       
  1a82  1F01           TFR D,X                           
  1a84  AD84           JSR ,X                            
  1a86  1700E2         LBSR 0x1b6b                       
  1a89  1700F4         LBSR 0x1b80                       
  1a8c  3506           PULS  A B                         
  1a8e  39             RTS                               

; ---- function FUN_M69_r4_24000__1a8f
FUN_M69_r4_24000__1a8f:
  1a8f  3436           PSHS  Y X B A                     
  1a91  CC0000         LDD #0x0                          
  1a94  8E044C         LDX #0x44c                        
  1a97  108E0440       LDY #0x440                        
  1a9b  2044           BRA 0x1ae1                        

; ---- function FUN_M69_r4_24000__1a9d
FUN_M69_r4_24000__1a9d:
  1a9d  3436           PSHS  Y X B A                     
  1a9f  CC0001         LDD #0x1                          
  1aa2  8E044D         LDX #0x44d                        
  1aa5  108E0441       LDY #0x441                        
  1aa9  2036           BRA 0x1ae1                        

; ---- function FUN_M69_r4_24000__1aab
FUN_M69_r4_24000__1aab:
  1aab  3436           PSHS  Y X B A                     
  1aad  CC0002         LDD #0x2                          
  1ab0  8E044E         LDX #0x44e                        
  1ab3  108E0442       LDY #0x442                        
  1ab7  2028           BRA 0x1ae1                        

; ---- function FUN_M69_r4_24000__1ab9
FUN_M69_r4_24000__1ab9:
  1ab9  3436           PSHS  Y X B A                     
  1abb  CC0003         LDD #0x3                          
  1abe  8E044F         LDX #0x44f                        
  1ac1  108E0443       LDY #0x443                        
  1ac5  201A           BRA 0x1ae1                        

; ---- function FUN_M69_r4_24000__1ac7
FUN_M69_r4_24000__1ac7:
  1ac7  3436           PSHS  Y X B A                     
  1ac9  CC0004         LDD #0x4                          
  1acc  8E0450         LDX #0x450                        
  1acf  108E0444       LDY #0x444                        
  1ad3  200C           BRA 0x1ae1                        

; ---- function FUN_M69_r4_24000__1ad5
FUN_M69_r4_24000__1ad5:
  1ad5  3436           PSHS  Y X B A                     
  1ad7  CC0005         LDD #0x5                          
  1ada  8E0451         LDX #0x451                        
  1add  108E0445       LDY #0x445                        
LAB_M69_r4_24000__1ae1:
  1ae1  17135C         LBSR 0x2e40                       
  1ae4  EC9F70EC       LDD [0x70ec]                      
  1ae8  FD6074         STD 0x6074                        
  1aeb  17EEC8         LBSR 0x09b6                       
  1aee  C613           LDB #0x13                         
  1af0  AD9FFC36       JSR [0xfc36]                      
  1af4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay  :     mS     "
  1af8  0A64656C6179.. char[22] "\ndelay  :     mS     " 
LAB_M69_r4_24000__1b0e:
  1b0e  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $00C8 $0000 $0000 ->$1B6B ->$1B3F $0001 $0001 $0000
  1b12  01             db 1h                             
  1b13  01             db 1h                             
  1b14  02             db 2h                             
  1b15  01             db 1h                             
  1b16  01             db 1h                             
  1b17  00             db 0h                             
  1b18  03             db 3h                             
  1b19  80             db 80h                            
  1b1a  00C8           dw C8h                            
  1b1c  0000           dw 0h                             
  1b1e  0000           dw 0h                             
  1b20  1B6B           addr M69_r4_24000::1b6b           
  1b22  1B3F           addr M69_r4_24000::1b3f           
  1b24  0001           dw 1h                             
  1b26  0001           dw 1h                             
  1b28  0000           dw 0h                             
LAB_M69_r4_24000__1b2a:
  1b2a  17003E         LBSR 0x1b6b                       
  1b2d  C61A           LDB #0x1a                         
  1b2f  AD9FFC36       JSR [0xfc36]                      
  1b33  FC7118         LDD 0x7118                        
  1b36  CB31           ADDB #0x31                        
  1b38  AD9FFC2A       JSR [0xfc2a]                      
  1b3c  3536           PULS  A B X Y                     
  1b3e  39             RTS                               

; ---- function FUN_M69_r4_24000__1b3f
FUN_M69_r4_24000__1b3f:
  1b3f  3426           PSHS  Y B A                       
  1b41  FC6074         LDD 0x6074                        
  1b44  ED9F70EC       STD [0x70ec]                      
  1b48  10BE70F8       LDY 0x70f8                        
  1b4c  AD9FFC80       JSR [0xfc80]                      
  1b50  FC7118         LDD 0x7118                        
  1b53  C3000B         ADDD #0xb                         
  1b56  1F02           TFR D,Y                           
  1b58  EC9F70EC       LDD [0x70ec]                      
  1b5c  AD9FFE40       JSR [0xfe40]                      
  1b60  CC00E1         LDD #0xe1                         
  1b63  FD7140         STD 0x7140                        
  1b66  8D18           BSR 0x1b80                        
  1b68  3526           PULS  A B Y                       
  1b6a  39             RTS                               

; ---- function FUN_M69_r4_24000__1b6b
FUN_M69_r4_24000__1b6b:
  1b6b  3456           PSHS  U X B A                     
  1b6d  C61D           LDB #0x1d                         
  1b6f  AD9FFC36       JSR [0xfc36]                      
  1b73  CC0003         LDD #0x3                          
  1b76  8E60A0         LDX #0x60a0                       
  1b79  AD9FFC3A       JSR [0xfc3a]                      
  1b7d  3556           PULS  A B X U                     
  1b7f  39             RTS                               

; ---- function FUN_M69_r4_24000__1b80
FUN_M69_r4_24000__1b80:
  1b80  3466           PSHS  U Y B A                     
  1b82  EC9F70EC       LDD [0x70ec]                      
  1b86  3606           PSHU  B A                         
  1b88  CC002C         LDD #0x2c                         
  1b8b  3606           PSHU  B A                         
  1b8d  AD9FFCEE       JSR [0xfcee]                      
  1b91  FC713A         LDD 0x713a                        
  1b94  3606           PSHU  B A                         
  1b96  AD9FFCF2       JSR [0xfcf2]                      
  1b9a  3706           PULU  A B                         
  1b9c  E39F7104       ADDD [0x7104]                     
  1ba0  FD711A         STD 0x711a                        
  1ba3  FC7070         LDD 0x7070                        
  1ba6  1083FFFF       CMPD #0xffff                      
  1baa  1027006F       LBEQ 0x1c1d                       
  1bae  CC000A         LDD #0xa                          
  1bb1  AD9FFD20       JSR [0xfd20]                      
  1bb5  10BE7108       LDY 0x7108                        
  1bb9  FC711A         LDD 0x711a                        
  1bbc  AD9FFD2E       JSR [0xfd2e]                      
  1bc0  CC000A         LDD #0xa                          
  1bc3  AD9FFD20       JSR [0xfd20]                      
  1bc7  10BE7114       LDY 0x7114                        
  1bcb  FC7130         LDD 0x7130                        
  1bce  AD9FFD2E       JSR [0xfd2e]                      
  1bd2  CC000A         LDD #0xa                          
  1bd5  AD9FFD20       JSR [0xfd20]                      
  1bd9  10BE7116       LDY 0x7116                        
  1bdd  CC0000         LDD #0x0                          
  1be0  AD9FFD2E       JSR [0xfd2e]                      
  1be4  FC7108         LDD 0x7108                        
  1be7  C30012         ADDD #0x12                        
  1bea  FD7108         STD 0x7108                        
  1bed  CC000A         LDD #0xa                          
  1bf0  AD9FFD20       JSR [0xfd20]                      
  1bf4  10BE7108       LDY 0x7108                        
  1bf8  FC711A         LDD 0x711a                        
  1bfb  AD9FFD2E       JSR [0xfd2e]                      
  1bff  FC7108         LDD 0x7108                        
  1c02  830012         SUBD #0x12                        
  1c05  FD7108         STD 0x7108                        
  1c08  CC0000         LDD #0x0                          
  1c0b  FD7148         STD 0x7148                        
  1c0e  FC7134         LDD 0x7134                        
  1c11  FD714A         STD 0x714a                        
  1c14  FC7132         LDD 0x7132                        
  1c17  AD9FFCC4       JSR [0xfcc4]                      
  1c1b  2051           BRA 0x1c6e                        
LAB_M69_r4_24000__1c1d:
  1c1d  CC000A         LDD #0xa                          
  1c20  AD9FFD20       JSR [0xfd20]                      
  1c24  10BE7108       LDY 0x7108                        
  1c28  FC711A         LDD 0x711a                        
  1c2b  AD9FFD2E       JSR [0xfd2e]                      
  1c2f  FC7108         LDD 0x7108                        
  1c32  C3000C         ADDD #0xc                         
  1c35  FD7108         STD 0x7108                        
  1c38  CC000A         LDD #0xa                          
  1c3b  AD9FFD20       JSR [0xfd20]                      
  1c3f  10BE7108       LDY 0x7108                        
  1c43  FC711A         LDD 0x711a                        
  1c46  AD9FFD2E       JSR [0xfd2e]                      
  1c4a  FC7108         LDD 0x7108                        
  1c4d  C30006         ADDD #0x6                         
  1c50  FD7108         STD 0x7108                        
  1c53  CC000A         LDD #0xa                          
  1c56  AD9FFD20       JSR [0xfd20]                      
  1c5a  10BE7108       LDY 0x7108                        
  1c5e  FC711A         LDD 0x711a                        
  1c61  AD9FFD2E       JSR [0xfd2e]                      
  1c65  FC7108         LDD 0x7108                        
  1c68  830012         SUBD #0x12                        
  1c6b  FD7108         STD 0x7108                        
LAB_M69_r4_24000__1c6e:
  1c6e  3566           PULS  A B Y U                     
  1c70  39             RTS                               

; ---- function FUN_M69_r4_24000__1c71
FUN_M69_r4_24000__1c71:
  1c71  3406           PSHS  B A                         
  1c73  CC0000         LDD #0x0                          
  1c76  2021           BRA 0x1c99                        

; ---- function FUN_M69_r4_24000__1c78
FUN_M69_r4_24000__1c78:
  1c78  3406           PSHS  B A                         
  1c7a  CC0001         LDD #0x1                          
  1c7d  201A           BRA 0x1c99                        

; ---- function FUN_M69_r4_24000__1c7f
FUN_M69_r4_24000__1c7f:
  1c7f  3406           PSHS  B A                         
  1c81  CC0002         LDD #0x2                          
  1c84  2013           BRA 0x1c99                        

; ---- function FUN_M69_r4_24000__1c86
FUN_M69_r4_24000__1c86:
  1c86  3406           PSHS  B A                         
  1c88  CC0003         LDD #0x3                          
  1c8b  200C           BRA 0x1c99                        

; ---- function FUN_M69_r4_24000__1c8d
FUN_M69_r4_24000__1c8d:
  1c8d  3406           PSHS  B A                         
  1c8f  CC0004         LDD #0x4                          
  1c92  2005           BRA 0x1c99                        

; ---- function FUN_M69_r4_24000__1c94
FUN_M69_r4_24000__1c94:
  1c94  3406           PSHS  B A                         
  1c96  CC0005         LDD #0x5                          
LAB_M69_r4_24000__1c99:
  1c99  17126D         LBSR 0x2f09                       
  1c9c  FC60F9         LDD 0x60f9                        
  1c9f  ED9F70EE       STD [0x70ee]                      
  1ca3  FD6074         STD 0x6074                        
  1ca6  10BE70FA       LDY 0x70fa                        
  1caa  AD9FFC80       JSR [0xfc80]                      
  1cae  FC7118         LDD 0x7118                        
  1cb1  860A           LDA #0xa                          
  1cb3  3D             MUL                               
  1cb4  C31CC7         ADDD #0x1cc7                      
  1cb7  F3600D         ADDD 0x600d                       
  1cba  1F01           TFR D,X                           
  1cbc  AD84           JSR ,X                            
  1cbe  1700C4         LBSR 0x1d85                       
  1cc1  1700D6         LBSR 0x1d9a                       
  1cc4  3506           PULS  A B                         
  1cc6  39             RTS                               

; ---- function FUN_M69_r4_24000__1cc7
FUN_M69_r4_24000__1cc7:
  1cc7  3416           PSHS  X B A                       
  1cc9  CC0000         LDD #0x0                          
  1ccc  8E0440         LDX #0x440                        
  1ccf  2030           BRA 0x1d01                        

; ---- function FUN_M69_r4_24000__1cd1
FUN_M69_r4_24000__1cd1:
  1cd1  3416           PSHS  X B A                       
  1cd3  CC0001         LDD #0x1                          
  1cd6  8E0441         LDX #0x441                        
  1cd9  2026           BRA 0x1d01                        

; ---- function FUN_M69_r4_24000__1cdb
FUN_M69_r4_24000__1cdb:
  1cdb  3416           PSHS  X B A                       
  1cdd  CC0002         LDD #0x2                          
  1ce0  8E0442         LDX #0x442                        
  1ce3  201C           BRA 0x1d01                        

; ---- function FUN_M69_r4_24000__1ce5
FUN_M69_r4_24000__1ce5:
  1ce5  3416           PSHS  X B A                       
  1ce7  CC0003         LDD #0x3                          
  1cea  8E0443         LDX #0x443                        
  1ced  2012           BRA 0x1d01                        

; ---- function FUN_M69_r4_24000__1cef
FUN_M69_r4_24000__1cef:
  1cef  3416           PSHS  X B A                       
  1cf1  CC0004         LDD #0x4                          
  1cf4  8E0444         LDX #0x444                        
  1cf7  2008           BRA 0x1d01                        

; ---- function FUN_M69_r4_24000__1cf9
FUN_M69_r4_24000__1cf9:
  1cf9  3416           PSHS  X B A                       
  1cfb  CC0005         LDD #0x5                          
  1cfe  8E0445         LDX #0x445                        
LAB_M69_r4_24000__1d01:
  1d01  171205         LBSR 0x2f09                       
  1d04  EC9F70EE       LDD [0x70ee]                      
  1d08  FD6074         STD 0x6074                        
  1d0b  17ECA8         LBSR 0x09b6                       
  1d0e  C613           LDB #0x13                         
  1d10  AD9FFC36       JSR [0xfc36]                      
  1d14  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " rate  :             "
  1d18  0A7261746520.. char[22] "\nrate  :             " 
LAB_M69_r4_24000__1d2e:
  1d2e  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1D85 ->$1D5F $0001 $0001 $0000
  1d32  01             db 1h                             
  1d33  01             db 1h                             
  1d34  02             db 2h                             
  1d35  01             db 1h                             
  1d36  01             db 1h                             
  1d37  00             db 0h                             
  1d38  03             db 3h                             
  1d39  80             db 80h                            
  1d3a  0064           dw 64h                            
  1d3c  0000           dw 0h                             
  1d3e  0000           dw 0h                             
  1d40  1D85           addr M69_r4_24000::1d85           
  1d42  1D5F           addr M69_r4_24000::1d5f           
  1d44  0001           dw 1h                             
  1d46  0001           dw 1h                             
  1d48  0000           dw 0h                             
LAB_M69_r4_24000__1d4a:
  1d4a  170038         LBSR 0x1d85                       
  1d4d  C619           LDB #0x19                         
  1d4f  AD9FFC36       JSR [0xfc36]                      
  1d53  FC7118         LDD 0x7118                        
  1d56  CB31           ADDB #0x31                        
  1d58  AD9FFC2A       JSR [0xfc2a]                      
  1d5c  3516           PULS  A B X                       
  1d5e  39             RTS                               

; ---- function FUN_M69_r4_24000__1d5f
FUN_M69_r4_24000__1d5f:
  1d5f  3426           PSHS  Y B A                       
  1d61  FC6074         LDD 0x6074                        
  1d64  ED9F70EE       STD [0x70ee]                      
  1d68  10BE70FA       LDY 0x70fa                        
  1d6c  AD9FFC80       JSR [0xfc80]                      
  1d70  FC7118         LDD 0x7118                        
  1d73  C30017         ADDD #0x17                        
  1d76  1F02           TFR D,Y                           
  1d78  EC9F70EE       LDD [0x70ee]                      
  1d7c  AD9FFE40       JSR [0xfe40]                      
  1d80  8D18           BSR 0x1d9a                        
  1d82  3526           PULS  A B Y                       
  1d84  39             RTS                               

; ---- function FUN_M69_r4_24000__1d85
FUN_M69_r4_24000__1d85:
  1d85  3456           PSHS  U X B A                     
  1d87  C61C           LDB #0x1c                         
  1d89  AD9FFC36       JSR [0xfc36]                      
  1d8d  CC0003         LDD #0x3                          
  1d90  8E60A0         LDX #0x60a0                       
  1d93  AD9FFC3A       JSR [0xfc3a]                      
  1d97  3556           PULS  A B X U                     
  1d99  39             RTS                               

; ---- function FUN_M69_r4_24000__1d9a
FUN_M69_r4_24000__1d9a:
  1d9a  3466           PSHS  U Y B A                     
  1d9c  EC9F70EE       LDD [0x70ee]                      
  1da0  3606           PSHU  B A                         
  1da2  CC0147         LDD #0x147                        
  1da5  3606           PSHU  B A                         
  1da7  AD9FFCEE       JSR [0xfcee]                      
  1dab  EC9F70EE       LDD [0x70ee]                      
  1daf  3606           PSHU  B A                         
  1db1  CC55C2         LDD #0x55c2                       
  1db4  3606           PSHU  B A                         
  1db6  AD9FFCF2       JSR [0xfcf2]                      
  1dba  AD9FFCE2       JSR [0xfce2]                      
  1dbe  FC7138         LDD 0x7138                        
  1dc1  3606           PSHU  B A                         
  1dc3  AD9FFCF2       JSR [0xfcf2]                      
  1dc7  3706           PULU  A B                         
  1dc9  FD711A         STD 0x711a                        
  1dcc  FC7148         LDD 0x7148                        
  1dcf  10830000       CMPD #0x0                         
  1dd3  10270012       LBEQ 0x1de9                       
  1dd7  CC000A         LDD #0xa                          
  1dda  AD9FFD20       JSR [0xfd20]                      
  1dde  10BE710A       LDY 0x710a                        
  1de2  FC711A         LDD 0x711a                        
  1de5  AD9FFD2E       JSR [0xfd2e]                      
LAB_M69_r4_24000__1de9:
  1de9  3566           PULS  A B Y U                     
  1deb  39             RTS                               

; ---- function FUN_M69_r4_24000__1dec
FUN_M69_r4_24000__1dec:
  1dec  3406           PSHS  B A                         
  1dee  CC0000         LDD #0x0                          
  1df1  2021           BRA 0x1e14                        

; ---- function FUN_M69_r4_24000__1df3
FUN_M69_r4_24000__1df3:
  1df3  3406           PSHS  B A                         
  1df5  CC0001         LDD #0x1                          
  1df8  201A           BRA 0x1e14                        

; ---- function FUN_M69_r4_24000__1dfa
FUN_M69_r4_24000__1dfa:
  1dfa  3406           PSHS  B A                         
  1dfc  CC0002         LDD #0x2                          
  1dff  2013           BRA 0x1e14                        

; ---- function FUN_M69_r4_24000__1e01
FUN_M69_r4_24000__1e01:
  1e01  3406           PSHS  B A                         
  1e03  CC0003         LDD #0x3                          
  1e06  200C           BRA 0x1e14                        

; ---- function FUN_M69_r4_24000__1e08
FUN_M69_r4_24000__1e08:
  1e08  3406           PSHS  B A                         
  1e0a  CC0004         LDD #0x4                          
  1e0d  2005           BRA 0x1e14                        

; ---- function FUN_M69_r4_24000__1e0f
FUN_M69_r4_24000__1e0f:
  1e0f  3406           PSHS  B A                         
  1e11  CC0005         LDD #0x5                          
LAB_M69_r4_24000__1e14:
  1e14  171166         LBSR 0x2f7d                       
  1e17  FC60F9         LDD 0x60f9                        
  1e1a  ED9F70F0       STD [0x70f0]                      
  1e1e  FD6074         STD 0x6074                        
  1e21  10BE70FC       LDY 0x70fc                        
  1e25  AD9FFC80       JSR [0xfc80]                      
  1e29  FC7118         LDD 0x7118                        
  1e2c  860A           LDA #0xa                          
  1e2e  3D             MUL                               
  1e2f  C31E42         ADDD #0x1e42                      
  1e32  F3600D         ADDD 0x600d                       
  1e35  1F01           TFR D,X                           
  1e37  AD84           JSR ,X                            
  1e39  1700C4         LBSR 0x1f00                       
  1e3c  1700D6         LBSR 0x1f15                       
  1e3f  3506           PULS  A B                         
  1e41  39             RTS                               

; ---- function FUN_M69_r4_24000__1e42
FUN_M69_r4_24000__1e42:
  1e42  3416           PSHS  X B A                       
  1e44  CC0000         LDD #0x0                          
  1e47  8E0452         LDX #0x452                        
  1e4a  2030           BRA 0x1e7c                        

; ---- function FUN_M69_r4_24000__1e4c
FUN_M69_r4_24000__1e4c:
  1e4c  3416           PSHS  X B A                       
  1e4e  CC0001         LDD #0x1                          
  1e51  8E0453         LDX #0x453                        
  1e54  2026           BRA 0x1e7c                        

; ---- function FUN_M69_r4_24000__1e56
FUN_M69_r4_24000__1e56:
  1e56  3416           PSHS  X B A                       
  1e58  CC0002         LDD #0x2                          
  1e5b  8E0454         LDX #0x454                        
  1e5e  201C           BRA 0x1e7c                        

; ---- function FUN_M69_r4_24000__1e60
FUN_M69_r4_24000__1e60:
  1e60  3416           PSHS  X B A                       
  1e62  CC0003         LDD #0x3                          
  1e65  8E0455         LDX #0x455                        
  1e68  2012           BRA 0x1e7c                        

; ---- function FUN_M69_r4_24000__1e6a
FUN_M69_r4_24000__1e6a:
  1e6a  3416           PSHS  X B A                       
  1e6c  CC0004         LDD #0x4                          
  1e6f  8E0456         LDX #0x456                        
  1e72  2008           BRA 0x1e7c                        

; ---- function FUN_M69_r4_24000__1e74
FUN_M69_r4_24000__1e74:
  1e74  3416           PSHS  X B A                       
  1e76  CC0005         LDD #0x5                          
  1e79  8E0457         LDX #0x457                        
LAB_M69_r4_24000__1e7c:
  1e7c  1710FE         LBSR 0x2f7d                       
  1e7f  EC9F70F0       LDD [0x70f0]                      
  1e83  FD6074         STD 0x6074                        
  1e86  17EB2D         LBSR 0x09b6                       
  1e89  C613           LDB #0x13                         
  1e8b  AD9FFC36       JSR [0xfc36]                      
  1e8f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " depth  :    mS      "
  1e93  0A6465707468.. char[22] "\ndepth  :    mS      " 
LAB_M69_r4_24000__1ea9:
  1ea9  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0028 $0000 $0000 ->$1F00 ->$1EDA $0001 $0001 $0000
  1ead  01             db 1h                             
  1eae  01             db 1h                             
  1eaf  02             db 2h                             
  1eb0  01             db 1h                             
  1eb1  01             db 1h                             
  1eb2  00             db 0h                             
  1eb3  02             db 2h                             
  1eb4  80             db 80h                            
  1eb5  0028           dw 28h                            
  1eb7  0000           dw 0h                             
  1eb9  0000           dw 0h                             
  1ebb  1F00           addr M69_r4_24000::1f00           
  1ebd  1EDA           addr M69_r4_24000::1eda           
  1ebf  0001           dw 1h                             
  1ec1  0001           dw 1h                             
  1ec3  0000           dw 0h                             
LAB_M69_r4_24000__1ec5:
  1ec5  170038         LBSR 0x1f00                       
  1ec8  C61A           LDB #0x1a                         
  1eca  AD9FFC36       JSR [0xfc36]                      
  1ece  FC7118         LDD 0x7118                        
  1ed1  CB31           ADDB #0x31                        
  1ed3  AD9FFC2A       JSR [0xfc2a]                      
  1ed7  3516           PULS  A B X                       
  1ed9  39             RTS                               

; ---- function FUN_M69_r4_24000__1eda
FUN_M69_r4_24000__1eda:
  1eda  3426           PSHS  Y B A                       
  1edc  FC6074         LDD 0x6074                        
  1edf  ED9F70F0       STD [0x70f0]                      
  1ee3  10BE70FC       LDY 0x70fc                        
  1ee7  AD9FFC80       JSR [0xfc80]                      
  1eeb  FC7118         LDD 0x7118                        
  1eee  C30011         ADDD #0x11                        
  1ef1  1F02           TFR D,Y                           
  1ef3  EC9F70F0       LDD [0x70f0]                      
  1ef7  AD9FFE40       JSR [0xfe40]                      
  1efb  8D18           BSR 0x1f15                        
  1efd  3526           PULS  A B Y                       
  1eff  39             RTS                               

; ---- function FUN_M69_r4_24000__1f00
FUN_M69_r4_24000__1f00:
  1f00  3456           PSHS  U X B A                     
  1f02  C61D           LDB #0x1d                         
  1f04  AD9FFC36       JSR [0xfc36]                      
  1f08  CC0002         LDD #0x2                          
  1f0b  8E60A1         LDX #0x60a1                       
  1f0e  AD9FFC3A       JSR [0xfc3a]                      
  1f12  3556           PULS  A B X U                     
  1f14  39             RTS                               

; ---- function FUN_M69_r4_24000__1f15
FUN_M69_r4_24000__1f15:
  1f15  3466           PSHS  U Y B A                     
  1f17  EC9F70F0       LDD [0x70f0]                      
  1f1b  3606           PSHU  B A                         
  1f1d  CC002C         LDD #0x2c                         
  1f20  3606           PSHU  B A                         
  1f22  AD9FFCEE       JSR [0xfcee]                      
  1f26  FC7136         LDD 0x7136                        
  1f29  3606           PSHU  B A                         
  1f2b  AD9FFCF2       JSR [0xfcf2]                      
  1f2f  3706           PULU  A B                         
  1f31  FD711A         STD 0x711a                        
  1f34  FC7148         LDD 0x7148                        
  1f37  10830000       CMPD #0x0                         
  1f3b  10270012       LBEQ 0x1f51                       
  1f3f  CC000A         LDD #0xa                          
  1f42  AD9FFD20       JSR [0xfd20]                      
  1f46  10BE710C       LDY 0x710c                        
  1f4a  FC711A         LDD 0x711a                        
  1f4d  AD9FFD2E       JSR [0xfd2e]                      
LAB_M69_r4_24000__1f51:
  1f51  3566           PULS  A B Y U                     
  1f53  39             RTS                               

; ---- function FUN_M69_r4_24000__1f54
FUN_M69_r4_24000__1f54:
  1f54  3406           PSHS  B A                         
  1f56  CC0000         LDD #0x0                          
  1f59  2021           BRA 0x1f7c                        

; ---- function FUN_M69_r4_24000__1f5b
FUN_M69_r4_24000__1f5b:
  1f5b  3406           PSHS  B A                         
  1f5d  CC0001         LDD #0x1                          
  1f60  201A           BRA 0x1f7c                        

; ---- function FUN_M69_r4_24000__1f62
FUN_M69_r4_24000__1f62:
  1f62  3406           PSHS  B A                         
  1f64  CC0002         LDD #0x2                          
  1f67  2013           BRA 0x1f7c                        

; ---- function FUN_M69_r4_24000__1f69
FUN_M69_r4_24000__1f69:
  1f69  3406           PSHS  B A                         
  1f6b  CC0003         LDD #0x3                          
  1f6e  200C           BRA 0x1f7c                        

; ---- function FUN_M69_r4_24000__1f70
FUN_M69_r4_24000__1f70:
  1f70  3406           PSHS  B A                         
  1f72  CC0004         LDD #0x4                          
  1f75  2005           BRA 0x1f7c                        

; ---- function FUN_M69_r4_24000__1f77
FUN_M69_r4_24000__1f77:
  1f77  3406           PSHS  B A                         
  1f79  CC0005         LDD #0x5                          
LAB_M69_r4_24000__1f7c:
  1f7c  171072         LBSR 0x2ff1                       
  1f7f  FC60F9         LDD 0x60f9                        
  1f82  ED9F70F2       STD [0x70f2]                      
  1f86  FD6074         STD 0x6074                        
  1f89  10BE70FE       LDY 0x70fe                        
  1f8d  AD9FFC80       JSR [0xfc80]                      
  1f91  FC7118         LDD 0x7118                        
  1f94  860E           LDA #0xe                          
  1f96  3D             MUL                               
  1f97  C31FAA         ADDD #0x1faa                      
  1f9a  F3600D         ADDD 0x600d                       
  1f9d  1F01           TFR D,X                           
  1f9f  AD84           JSR ,X                            
  1fa1  1700DC         LBSR 0x2080                       
  1fa4  1700EE         LBSR 0x2095                       
  1fa7  3506           PULS  A B                         
  1fa9  39             RTS                               

; ---- function FUN_M69_r4_24000__1faa
FUN_M69_r4_24000__1faa:
  1faa  3436           PSHS  Y X B A                     
  1fac  CC0000         LDD #0x0                          
  1faf  8E0140         LDX #0x140                        
  1fb2  108E0143       LDY #0x143                        
  1fb6  2044           BRA 0x1ffc                        

; ---- function FUN_M69_r4_24000__1fb8
FUN_M69_r4_24000__1fb8:
  1fb8  3436           PSHS  Y X B A                     
  1fba  CC0001         LDD #0x1                          
  1fbd  8E0141         LDX #0x141                        
  1fc0  108E0144       LDY #0x144                        
  1fc4  2036           BRA 0x1ffc                        

; ---- function FUN_M69_r4_24000__1fc6
FUN_M69_r4_24000__1fc6:
  1fc6  3436           PSHS  Y X B A                     
  1fc8  CC0002         LDD #0x2                          
  1fcb  8E0142         LDX #0x142                        
  1fce  108E0145       LDY #0x145                        
  1fd2  2028           BRA 0x1ffc                        

; ---- function FUN_M69_r4_24000__1fd4
FUN_M69_r4_24000__1fd4:
  1fd4  3436           PSHS  Y X B A                     
  1fd6  CC0003         LDD #0x3                          
  1fd9  8E0240         LDX #0x240                        
  1fdc  108E0243       LDY #0x243                        
  1fe0  201A           BRA 0x1ffc                        

; ---- function FUN_M69_r4_24000__1fe2
FUN_M69_r4_24000__1fe2:
  1fe2  3436           PSHS  Y X B A                     
  1fe4  CC0004         LDD #0x4                          
  1fe7  8E0241         LDX #0x241                        
  1fea  108E0244       LDY #0x244                        
  1fee  200C           BRA 0x1ffc                        

; ---- function FUN_M69_r4_24000__1ff0
FUN_M69_r4_24000__1ff0:
  1ff0  3436           PSHS  Y X B A                     
  1ff2  CC0005         LDD #0x5                          
  1ff5  8E0242         LDX #0x242                        
  1ff8  108E0245       LDY #0x245                        
LAB_M69_r4_24000__1ffc:
  1ffc  170FF2         LBSR 0x2ff1                       
  1fff  EC9F70F2       LDD [0x70f2]                      
  2003  FD6074         STD 0x6074                        
  2006  17E9AD         LBSR 0x09b6                       
  2009  C613           LDB #0x13                         
  200b  AD9FFC36       JSR [0xfc36]                      
  200f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " level  :     %      "
  2013  0A6C6576656C.. char[22] "\nlevel  :     %      " 
LAB_M69_r4_24000__2029:
  2029  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2080 ->$205A $0001 $0001 $0000
  202d  01             db 1h                             
  202e  01             db 1h                             
  202f  02             db 2h                             
  2030  01             db 1h                             
  2031  01             db 1h                             
  2032  00             db 0h                             
  2033  03             db 3h                             
  2034  80             db 80h                            
  2035  0064           dw 64h                            
  2037  0000           dw 0h                             
  2039  0000           dw 0h                             
  203b  2080           addr M69_r4_24000::2080           
  203d  205A           addr M69_r4_24000::205a           
  203f  0001           dw 1h                             
  2041  0001           dw 1h                             
  2043  0000           dw 0h                             
LAB_M69_r4_24000__2045:
  2045  170038         LBSR 0x2080                       
  2048  C61A           LDB #0x1a                         
  204a  AD9FFC36       JSR [0xfc36]                      
  204e  FC7118         LDD 0x7118                        
  2051  CB31           ADDB #0x31                        
  2053  AD9FFC2A       JSR [0xfc2a]                      
  2057  3536           PULS  A B X Y                     
  2059  39             RTS                               

; ---- function FUN_M69_r4_24000__205a
FUN_M69_r4_24000__205a:
  205a  3426           PSHS  Y B A                       
  205c  FC6074         LDD 0x6074                        
  205f  ED9F70F2       STD [0x70f2]                      
  2063  10BE70FE       LDY 0x70fe                        
  2067  AD9FFC80       JSR [0xfc80]                      
  206b  FC7118         LDD 0x7118                        
  206e  C3001D         ADDD #0x1d                        
  2071  1F02           TFR D,Y                           
  2073  EC9F70F2       LDD [0x70f2]                      
  2077  AD9FFE40       JSR [0xfe40]                      
  207b  8D18           BSR 0x2095                        
  207d  3526           PULS  A B Y                       
  207f  39             RTS                               

; ---- function FUN_M69_r4_24000__2080
FUN_M69_r4_24000__2080:
  2080  3456           PSHS  U X B A                     
  2082  C61D           LDB #0x1d                         
  2084  AD9FFC36       JSR [0xfc36]                      
  2088  CC0003         LDD #0x3                          
  208b  8E60A0         LDX #0x60a0                       
  208e  AD9FFC3A       JSR [0xfc3a]                      
  2092  3556           PULS  A B X U                     
  2094  39             RTS                               

; ---- function FUN_M69_r4_24000__2095
FUN_M69_r4_24000__2095:
  2095  3476           PSHS  U Y X B A                   
  2097  EC9F70F2       LDD [0x70f2]                      
  209b  2608           BNE 0x20a5                        
  209d  FD711E         STD 0x711e                        
  20a0  FD7120         STD 0x7120                        
  20a3  204F           BRA 0x20f4                        
LAB_M69_r4_24000__20a5:
  20a5  3606           PSHU  B A                         
  20a7  CC000E         LDD #0xe                          
  20aa  3606           PSHU  B A                         
  20ac  AD9FFCEC       JSR [0xfcec]                      
  20b0  3706           PULU  A B                         
  20b2  FD711C         STD 0x711c                        
  20b5  3606           PSHU  B A                         
  20b7  CC000B         LDD #0xb                          
  20ba  3606           PSHU  B A                         
  20bc  AD9FFCEC       JSR [0xfcec]                      
  20c0  3706           PULU  A B                         
  20c2  FD711A         STD 0x711a                        
  20c5  FC711C         LDD 0x711c                        
  20c8  3606           PSHU  B A                         
  20ca  EC9F70F4       LDD [0x70f4]                      
  20ce  3606           PSHU  B A                         
  20d0  AD9FFCEC       JSR [0xfcec]                      
  20d4  FC713E         LDD 0x713e                        
  20d7  3606           PSHU  B A                         
  20d9  AD9FFCF2       JSR [0xfcf2]                      
  20dd  3706           PULU  A B                         
  20df  FD711C         STD 0x711c                        
  20e2  FC711A         LDD 0x711a                        
  20e5  F3711C         ADDD 0x711c                       
  20e8  FD711E         STD 0x711e                        
  20eb  FC711A         LDD 0x711a                        
  20ee  B3711C         SUBD 0x711c                       
  20f1  FD7120         STD 0x7120                        
LAB_M69_r4_24000__20f4:
  20f4  CC000A         LDD #0xa                          
  20f7  AD9FFD20       JSR [0xfd20]                      
  20fb  10BE710E       LDY 0x710e                        
  20ff  FC711E         LDD 0x711e                        
  2102  AD9FFD2E       JSR [0xfd2e]                      
  2106  CC000A         LDD #0xa                          
  2109  AD9FFD20       JSR [0xfd20]                      
  210d  10BE7110       LDY 0x7110                        
  2111  FC7120         LDD 0x7120                        
  2114  AD9FFD2E       JSR [0xfd2e]                      
  2118  3576           PULS  A B X Y U                   
  211a  39             RTS                               

; ---- function FUN_M69_r4_24000__211b
FUN_M69_r4_24000__211b:
  211b  3406           PSHS  B A                         
  211d  CC0000         LDD #0x0                          
  2120  2021           BRA 0x2143                        

; ---- function FUN_M69_r4_24000__2122
FUN_M69_r4_24000__2122:
  2122  3406           PSHS  B A                         
  2124  CC0001         LDD #0x1                          
  2127  201A           BRA 0x2143                        

; ---- function FUN_M69_r4_24000__2129
FUN_M69_r4_24000__2129:
  2129  3406           PSHS  B A                         
  212b  CC0002         LDD #0x2                          
  212e  2013           BRA 0x2143                        

; ---- function FUN_M69_r4_24000__2130
FUN_M69_r4_24000__2130:
  2130  3406           PSHS  B A                         
  2132  CC0003         LDD #0x3                          
  2135  200C           BRA 0x2143                        

; ---- function FUN_M69_r4_24000__2137
FUN_M69_r4_24000__2137:
  2137  3406           PSHS  B A                         
  2139  CC0004         LDD #0x4                          
  213c  2005           BRA 0x2143                        

; ---- function FUN_M69_r4_24000__213e
FUN_M69_r4_24000__213e:
  213e  3406           PSHS  B A                         
  2140  CC0005         LDD #0x5                          
LAB_M69_r4_24000__2143:
  2143  170EAB         LBSR 0x2ff1                       
  2146  FC60F9         LDD 0x60f9                        
  2149  ED9F70F4       STD [0x70f4]                      
  214d  FD6074         STD 0x6074                        
  2150  10BE7100       LDY 0x7100                        
  2154  AD9FFC80       JSR [0xfc80]                      
  2158  FC7118         LDD 0x7118                        
  215b  860E           LDA #0xe                          
  215d  3D             MUL                               
  215e  C32171         ADDD #0x2171                      
  2161  F3600D         ADDD 0x600d                       
  2164  1F01           TFR D,X                           
  2166  AD84           JSR ,X                            
  2168  1700F1         LBSR 0x225c                       
  216b  1700EF         LBSR 0x225d                       
  216e  3506           PULS  A B                         
  2170  39             RTS                               

; ---- function FUN_M69_r4_24000__2171
FUN_M69_r4_24000__2171:
  2171  3436           PSHS  Y X B A                     
  2173  CC0000         LDD #0x0                          
  2176  8E0140         LDX #0x140                        
  2179  108E0143       LDY #0x143                        
  217d  2044           BRA 0x21c3                        

; ---- function FUN_M69_r4_24000__217f
FUN_M69_r4_24000__217f:
  217f  3436           PSHS  Y X B A                     
  2181  CC0001         LDD #0x1                          
  2184  8E0141         LDX #0x141                        
  2187  108E0144       LDY #0x144                        
  218b  2036           BRA 0x21c3                        

; ---- function FUN_M69_r4_24000__218d
FUN_M69_r4_24000__218d:
  218d  3436           PSHS  Y X B A                     
  218f  CC0002         LDD #0x2                          
  2192  8E0142         LDX #0x142                        
  2195  108E0145       LDY #0x145                        
  2199  2028           BRA 0x21c3                        

; ---- function FUN_M69_r4_24000__219b
FUN_M69_r4_24000__219b:
  219b  3436           PSHS  Y X B A                     
  219d  CC0003         LDD #0x3                          
  21a0  8E0240         LDX #0x240                        
  21a3  108E0243       LDY #0x243                        
  21a7  201A           BRA 0x21c3                        

; ---- function FUN_M69_r4_24000__21a9
FUN_M69_r4_24000__21a9:
  21a9  3436           PSHS  Y X B A                     
  21ab  CC0004         LDD #0x4                          
  21ae  8E0241         LDX #0x241                        
  21b1  108E0244       LDY #0x244                        
  21b5  200C           BRA 0x21c3                        

; ---- function FUN_M69_r4_24000__21b7
FUN_M69_r4_24000__21b7:
  21b7  3436           PSHS  Y X B A                     
  21b9  CC0005         LDD #0x5                          
  21bc  8E0242         LDX #0x242                        
  21bf  108E0245       LDY #0x245                        
LAB_M69_r4_24000__21c3:
  21c3  170E2B         LBSR 0x2ff1                       
  21c6  EC9F70F4       LDD [0x70f4]                      
  21ca  FD6074         STD 0x6074                        
  21cd  17E7E6         LBSR 0x09b6                       
  21d0  C604           LDB #0x4                          
  21d2  AD9FFC36       JSR [0xfc36]                      
  21d6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " pan  : L-           C           -R "
  21da  0A70616E2020.. char[37] "\npan  : L-           C           -R "
LAB_M69_r4_24000__21ff:
  21ff  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$225C ->$2233 $0001 $0001 $0000
  2203  01             db 1h                             
  2204  01             db 1h                             
  2205  02             db 2h                             
  2206  01             db 1h                             
  2207  01             db 1h                             
  2208  00             db 0h                             
  2209  03             db 3h                             
  220a  80             db 80h                            
  220b  000B           dw Bh                             
  220d  FFF5           dw FFF5h                          
  220f  0000           dw 0h                             
  2211  225C           addr M69_r4_24000::225c           
  2213  2233           addr M69_r4_24000::2233           
  2215  0001           dw 1h                             
  2217  0001           dw 1h                             
  2219  0000           dw 0h                             
LAB_M69_r4_24000__221b:
  221b  17003E         LBSR 0x225c                       
  221e  C609           LDB #0x9                          
  2220  AD9FFC36       JSR [0xfc36]                      
  2224  FC7118         LDD 0x7118                        
  2227  CB31           ADDB #0x31                        
  2229  AD9FFC2A       JSR [0xfc2a]                      
  222d  170031         LBSR 0x2261                       
  2230  3536           PULS  A B X Y                     
  2232  39             RTS                               

; ---- function FUN_M69_r4_24000__2233
FUN_M69_r4_24000__2233:
  2233  3426           PSHS  Y B A                       
  2235  FC6074         LDD 0x6074                        
  2238  ED9F70F4       STD [0x70f4]                      
  223c  10BE7100       LDY 0x7100                        
  2240  AD9FFC80       JSR [0xfc80]                      
  2244  FC7118         LDD 0x7118                        
  2247  C30029         ADDD #0x29                        
  224a  1F02           TFR D,Y                           
  224c  EC9F70F4       LDD [0x70f4]                      
  2250  AD9FFE40       JSR [0xfe40]                      
  2254  8D07           BSR 0x225d                        
  2256  170008         LBSR 0x2261                       
  2259  3526           PULS  A B Y                       
  225b  39             RTS                               

; ---- function FUN_M69_r4_24000__225c
FUN_M69_r4_24000__225c:
  225c  39             RTS                               

; ---- function FUN_M69_r4_24000__225d
FUN_M69_r4_24000__225d:
  225d  17FE35         LBSR 0x2095                       
  2260  39             RTS                               

; ---- function FUN_M69_r4_24000__2261
FUN_M69_r4_24000__2261:
  2261  3456           PSHS  U X B A                     
  2263  C60E           LDB #0xe                          
  2265  AD9FFC36       JSR [0xfc36]                      
  2269  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "           C           "
  226d  202020202020.. char[24] "           C           "
LAB_M69_r4_24000__2285:
  2285  EC9F70F4       LDD [0x70f4]                      
  2289  C3000B         ADDD #0xb                         
  228c  C3000E         ADDD #0xe                         
  228f  AD9FFC36       JSR [0xfc36]                      
  2293  C62A           LDB #0x2a                         
  2295  AD9FFC2A       JSR [0xfc2a]                      
  2299  3556           PULS  A B X U                     
  229b  39             RTS                               

; ---- function FUN_M69_r4_24000__229c
FUN_M69_r4_24000__229c:
  229c  3406           PSHS  B A                         
  229e  CC0000         LDD #0x0                          
  22a1  2021           BRA 0x22c4                        

; ---- function FUN_M69_r4_24000__22a3
FUN_M69_r4_24000__22a3:
  22a3  3406           PSHS  B A                         
  22a5  CC0001         LDD #0x1                          
  22a8  201A           BRA 0x22c4                        

; ---- function FUN_M69_r4_24000__22aa
FUN_M69_r4_24000__22aa:
  22aa  3406           PSHS  B A                         
  22ac  CC0002         LDD #0x2                          
  22af  2013           BRA 0x22c4                        

; ---- function FUN_M69_r4_24000__22b1
FUN_M69_r4_24000__22b1:
  22b1  3406           PSHS  B A                         
  22b3  CC0003         LDD #0x3                          
  22b6  200C           BRA 0x22c4                        

; ---- function FUN_M69_r4_24000__22b8
FUN_M69_r4_24000__22b8:
  22b8  3406           PSHS  B A                         
  22ba  CC0004         LDD #0x4                          
  22bd  2005           BRA 0x22c4                        

; ---- function FUN_M69_r4_24000__22bf
FUN_M69_r4_24000__22bf:
  22bf  3406           PSHS  B A                         
  22c1  CC0005         LDD #0x5                          
LAB_M69_r4_24000__22c4:
  22c4  170DD0         LBSR 0x3097                       
  22c7  FC60F9         LDD 0x60f9                        
  22ca  ED9F70F6       STD [0x70f6]                      
  22ce  FD6074         STD 0x6074                        
  22d1  10BE7102       LDY 0x7102                        
  22d5  AD9FFC80       JSR [0xfc80]                      
  22d9  FC7118         LDD 0x7118                        
  22dc  860A           LDA #0xa                          
  22de  3D             MUL                               
  22df  C322F2         ADDD #0x22f2                      
  22e2  F3600D         ADDD 0x600d                       
  22e5  1F01           TFR D,X                           
  22e7  AD84           JSR ,X                            
  22e9  1700C4         LBSR 0x23b0                       
  22ec  1700D6         LBSR 0x23c5                       
  22ef  3506           PULS  A B                         
  22f1  39             RTS                               

; ---- function FUN_M69_r4_24000__22f2
FUN_M69_r4_24000__22f2:
  22f2  3416           PSHS  X B A                       
  22f4  CC0000         LDD #0x0                          
  22f7  8E0146         LDX #0x146                        
  22fa  2030           BRA 0x232c                        

; ---- function FUN_M69_r4_24000__22fc
FUN_M69_r4_24000__22fc:
  22fc  3416           PSHS  X B A                       
  22fe  CC0001         LDD #0x1                          
  2301  8E0147         LDX #0x147                        
  2304  2026           BRA 0x232c                        

; ---- function FUN_M69_r4_24000__2306
FUN_M69_r4_24000__2306:
  2306  3416           PSHS  X B A                       
  2308  CC0002         LDD #0x2                          
  230b  8E0148         LDX #0x148                        
  230e  201C           BRA 0x232c                        

; ---- function FUN_M69_r4_24000__2310
FUN_M69_r4_24000__2310:
  2310  3416           PSHS  X B A                       
  2312  CC0003         LDD #0x3                          
  2315  8E0246         LDX #0x246                        
  2318  2012           BRA 0x232c                        

; ---- function FUN_M69_r4_24000__231a
FUN_M69_r4_24000__231a:
  231a  3416           PSHS  X B A                       
  231c  CC0004         LDD #0x4                          
  231f  8E0247         LDX #0x247                        
  2322  2008           BRA 0x232c                        

; ---- function FUN_M69_r4_24000__2324
FUN_M69_r4_24000__2324:
  2324  3416           PSHS  X B A                       
  2326  CC0005         LDD #0x5                          
  2329  8E0248         LDX #0x248                        
LAB_M69_r4_24000__232c:
  232c  170D68         LBSR 0x3097                       
  232f  EC9F70F6       LDD [0x70f6]                      
  2333  FD6074         STD 0x6074                        
  2336  17E67D         LBSR 0x09b6                       
  2339  C613           LDB #0x13                         
  233b  AD9FFC36       JSR [0xfc36]                      
  233f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " feedback  :     %   "
  2343  0A6665656462.. char[22] "\nfeedback  :     %   " 
LAB_M69_r4_24000__2359:
  2359  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$23B0 ->$238A $0001 $0001 $0000
  235d  01             db 1h                             
  235e  01             db 1h                             
  235f  02             db 2h                             
  2360  01             db 1h                             
  2361  01             db 1h                             
  2362  00             db 0h                             
  2363  04             db 4h                             
  2364  80             db 80h                            
  2365  0063           dw 63h                            
  2367  FF9C           dw FF9Ch                          
  2369  0000           dw 0h                             
  236b  23B0           addr M69_r4_24000::23b0           
  236d  238A           addr M69_r4_24000::238a           
  236f  0001           dw 1h                             
  2371  0001           dw 1h                             
  2373  0000           dw 0h                             
LAB_M69_r4_24000__2375:
  2375  170038         LBSR 0x23b0                       
  2378  C61D           LDB #0x1d                         
  237a  AD9FFC36       JSR [0xfc36]                      
  237e  FC7118         LDD 0x7118                        
  2381  CB31           ADDB #0x31                        
  2383  AD9FFC2A       JSR [0xfc2a]                      
  2387  3516           PULS  A B X                       
  2389  39             RTS                               

; ---- function FUN_M69_r4_24000__238a
FUN_M69_r4_24000__238a:
  238a  3426           PSHS  Y B A                       
  238c  FC6074         LDD 0x6074                        
  238f  ED9F70F6       STD [0x70f6]                      
  2393  10BE7102       LDY 0x7102                        
  2397  AD9FFC80       JSR [0xfc80]                      
  239b  FC7118         LDD 0x7118                        
  239e  C30023         ADDD #0x23                        
  23a1  1F02           TFR D,Y                           
  23a3  EC9F70F6       LDD [0x70f6]                      
  23a7  AD9FFE40       JSR [0xfe40]                      
  23ab  8D18           BSR 0x23c5                        
  23ad  3526           PULS  A B Y                       
  23af  39             RTS                               

; ---- function FUN_M69_r4_24000__23b0
FUN_M69_r4_24000__23b0:
  23b0  3456           PSHS  U X B A                     
  23b2  C620           LDB #0x20                         
  23b4  AD9FFC36       JSR [0xfc36]                      
  23b8  CC0004         LDD #0x4                          
  23bb  8E609F         LDX #0x609f                       
  23be  AD9FFC3A       JSR [0xfc3a]                      
  23c2  3556           PULS  A B X U                     
  23c4  39             RTS                               

; ---- function FUN_M69_r4_24000__23c5
FUN_M69_r4_24000__23c5:
  23c5  3476           PSHS  U Y X B A                   
  23c7  EC9F70F6       LDD [0x70f6]                      
  23cb  3606           PSHU  B A                         
  23cd  CC0147         LDD #0x147                        
  23d0  3606           PSHU  B A                         
  23d2  AD9FFCEC       JSR [0xfcec]                      
  23d6  3706           PULU  A B                         
  23d8  FD711A         STD 0x711a                        
  23db  EC9F70F6       LDD [0x70f6]                      
  23df  3606           PSHU  B A                         
  23e1  CC55C1         LDD #0x55c1                       
  23e4  3606           PSHU  B A                         
  23e6  AD9FFCF2       JSR [0xfcf2]                      
  23ea  3706           PULU  A B                         
  23ec  F3711A         ADDD 0x711a                       
  23ef  3606           PSHU  B A                         
  23f1  FC713C         LDD 0x713c                        
  23f4  3606           PSHU  B A                         
  23f6  AD9FFCF2       JSR [0xfcf2]                      
  23fa  3706           PULU  A B                         
  23fc  FD711A         STD 0x711a                        
  23ff  CC000A         LDD #0xa                          
  2402  AD9FFD20       JSR [0xfd20]                      
  2406  10BE7112       LDY 0x7112                        
  240a  FC711A         LDD 0x711a                        
  240d  AD9FFD2E       JSR [0xfd2e]                      
  2411  3576           PULS  A B X Y U                   
  2413  39             RTS                               
PTR_FUN_M69_r4_24000__2497_M69_r4_24000__2414:
  2414  2497           addr M69_r4_24000::2497           
  2416  245E           addr M69_r4_24000::245e           
  2418  .db 24 52 70 00 70 02 00 00 70 04 71 4C 71 85 00 00  ; $Rp.p...p.qLq...
  2428  .db 00 00 64 00 01 00 03 19 24 82 00 00 00 00 70 06  ; ..d.....$.....p.
  2438  .db 71 87                                            ; q.

; ---- function FUN_M69_r4_24000__243a
FUN_M69_r4_24000__243a:
  243a  3410           PSHS  X                           
  243c  8E2414         LDX #0x2414                        ; desc[API_FE6A]: ->$2497 ->$245E
  243f  AD9FFE6A       JSR [0xfe6a]                      
  2443  3510           PULS  X                           
  2445  39             RTS                               

; ---- function FUN_M69_r4_24000__2446
FUN_M69_r4_24000__2446:
  2446  3410           PSHS  X                           
  2448  8E2414         LDX #0x2414                        ; desc[API_FDBC]: ->$2497 ->$245E
  244b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$."
  244f  3510           PULS  X                           
  2451  39             RTS                               

; ---- function FUN_M69_r4_24000__2452
FUN_M69_r4_24000__2452:
  2452  3410           PSHS  X                           
  2454  8E2414         LDX #0x2414                        ; desc[API_FE6C]: ->$2497 ->$245E
  2457  AD9FFE6C       JSR [0xfe6c]                      
  245b  3510           PULS  X                           
  245d  39             RTS                               

; ---- function FUN_M69_r4_24000__245e
FUN_M69_r4_24000__245e:
  245e  3410           PSHS  X                           
  2460  8E2414         LDX #0x2414                        ; desc[API_FE6E]: ->$2497 ->$245E
  2463  AD9FFE6E       JSR [0xfe6e]                      
  2467  3510           PULS  X                           
  2469  39             RTS                               

; ---- function FUN_M69_r4_24000__246a
FUN_M69_r4_24000__246a:
  246a  3410           PSHS  X                           
  246c  8E2414         LDX #0x2414                        ; desc[API_FE1C]: ->$2497 ->$245E
  246f  AD9FFE1C       JSR [0xfe1c]                      
  2473  3510           PULS  X                           
  2475  39             RTS                               

; ---- function FUN_M69_r4_24000__2476
FUN_M69_r4_24000__2476:
  2476  3410           PSHS  X                           
  2478  8E2414         LDX #0x2414                        ; desc[API_FE1A]: ->$2497 ->$245E $2452
  247b  AD9FFE1A       JSR [0xfe1a]                      
  247f  3510           PULS  X                           
  2481  39             RTS                               
  2482  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  2492  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M69_r4_24000__2497
FUN_M69_r4_24000__2497:
  2497  3476           PSHS  U Y X B A                   
  2499  8E2414         LDX #0x2414                       
  249c  AD9FFE76       JSR [0xfe76]                      
  24a0  CC0064         LDD #0x64                         
  24a3  B37004         SUBD 0x7004                       
  24a6  3606           PSHU  B A                         
  24a8  58             LSLB                              
  24a9  49             ROLA                              
  24aa  FD711A         STD 0x711a                        
  24ad  CC4666         LDD #0x4666                       
  24b0  3606           PSHU  B A                         
  24b2  AD9FFCF2       JSR [0xfcf2]                      
  24b6  3706           PULU  A B                         
  24b8  F3711A         ADDD 0x711a                       
  24bb  AD9FFC6A       JSR [0xfc6a]                      
  24bf  AD9FFC72       JSR [0xfc72]                      
  24c3  3576           PULS  A B X Y U                   
  24c5  39             RTS                               
PTR_FUN_M69_r4_24000__2549_M69_r4_24000__24c6:
  24c6  2549           addr M69_r4_24000::2549           
  24c8  2510           addr M69_r4_24000::2510           
  24ca  .db 25 04 70 08 70 0A 00 00 70 0C 71 4C 71 85 00 00  ; %.p.p...p.qLq...
  24da  .db 00 00 64 00 01 00 03 1D 25 34 00 00 00 00 70 0E  ; ..d.....%4....p.
  24ea  .db 71 87                                            ; q.

; ---- function FUN_M69_r4_24000__24ec
FUN_M69_r4_24000__24ec:
  24ec  3410           PSHS  X                           
  24ee  8E24C6         LDX #0x24c6                        ; desc[API_FE6A]: ->$2549 ->$2510
  24f1  AD9FFE6A       JSR [0xfe6a]                      
  24f5  3510           PULS  X                           
  24f7  39             RTS                               

; ---- function FUN_M69_r4_24000__24f8
FUN_M69_r4_24000__24f8:
  24f8  3410           PSHS  X                           
  24fa  8E24C6         LDX #0x24c6                        ; desc[API_FDBC]: ->$2549 ->$2510
  24fd  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$."
  2501  3510           PULS  X                           
  2503  39             RTS                               

; ---- function FUN_M69_r4_24000__2504
FUN_M69_r4_24000__2504:
  2504  3410           PSHS  X                           
  2506  8E24C6         LDX #0x24c6                        ; desc[API_FE6C]: ->$2549 ->$2510
  2509  AD9FFE6C       JSR [0xfe6c]                      
  250d  3510           PULS  X                           
  250f  39             RTS                               

; ---- function FUN_M69_r4_24000__2510
FUN_M69_r4_24000__2510:
  2510  3410           PSHS  X                           
  2512  8E24C6         LDX #0x24c6                        ; desc[API_FE6E]: ->$2549 ->$2510
  2515  AD9FFE6E       JSR [0xfe6e]                      
  2519  3510           PULS  X                           
  251b  39             RTS                               

; ---- function FUN_M69_r4_24000__251c
FUN_M69_r4_24000__251c:
  251c  3410           PSHS  X                           
  251e  8E24C6         LDX #0x24c6                        ; desc[API_FE1C]: ->$2549 ->$2510
  2521  AD9FFE1C       JSR [0xfe1c]                      
  2525  3510           PULS  X                           
  2527  39             RTS                               

; ---- function FUN_M69_r4_24000__2528
FUN_M69_r4_24000__2528:
  2528  3410           PSHS  X                           
  252a  8E24C6         LDX #0x24c6                        ; desc[API_FE1A]: ->$2549 ->$2510 $2504
  252d  AD9FFE1A       JSR [0xfe1a]                      
  2531  3510           PULS  X                           
  2533  39             RTS                               
  2534  .db 14 6C 65 66 74 20 6D 69 78 3A 20 20 20 20 25 20  ; .left mix:    % 
  2544  .db 77 65 74 20 20                                   ; wet  

; ---- function FUN_M69_r4_24000__2549
FUN_M69_r4_24000__2549:
  2549  3476           PSHS  U Y X B A                   
  254b  8E24C6         LDX #0x24c6                       
  254e  AD9FFE76       JSR [0xfe76]                      
  2552  CC0064         LDD #0x64                         
  2555  B3700C         SUBD 0x700c                       
  2558  3606           PSHU  B A                         
  255a  58             LSLB                              
  255b  49             ROLA                              
  255c  FD711A         STD 0x711a                        
  255f  CC4666         LDD #0x4666                       
  2562  3606           PSHU  B A                         
  2564  AD9FFCF2       JSR [0xfcf2]                      
  2568  3706           PULU  A B                         
  256a  F3711A         ADDD 0x711a                       
  256d  AD9FFC6A       JSR [0xfc6a]                      
  2571  3576           PULS  A B X Y U                   
  2573  39             RTS                               
PTR_FUN_M69_r4_24000__25f7_M69_r4_24000__2574:
  2574  25F7           addr M69_r4_24000::25f7           
  2576  25BE           addr M69_r4_24000::25be           
  2578  .db 25 B2 70 10 70 12 00 00 70 14 71 4C 71 9B 01 00  ; %.p.p...p.qLq...
  2588  .db 00 00 64 00 01 00 03 1E 25 E2 00 00 00 00 70 16  ; ..d.....%.....p.
  2598  .db 71 9D                                            ; q.

; ---- function FUN_M69_r4_24000__259a
FUN_M69_r4_24000__259a:
  259a  3410           PSHS  X                           
  259c  8E2574         LDX #0x2574                        ; desc[API_FE6A]: ->$25F7 ->$25BE
  259f  AD9FFE6A       JSR [0xfe6a]                      
  25a3  3510           PULS  X                           
  25a5  39             RTS                               

; ---- function FUN_M69_r4_24000__25a6
FUN_M69_r4_24000__25a6:
  25a6  3410           PSHS  X                           
  25a8  8E2574         LDX #0x2574                        ; desc[API_FDBC]: ->$25F7 ->$25BE
  25ab  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..%t"
  25af  3510           PULS  X                           
  25b1  39             RTS                               

; ---- function FUN_M69_r4_24000__25b2
FUN_M69_r4_24000__25b2:
  25b2  3410           PSHS  X                           
  25b4  8E2574         LDX #0x2574                        ; desc[API_FE6C]: ->$25F7 ->$25BE
  25b7  AD9FFE6C       JSR [0xfe6c]                      
  25bb  3510           PULS  X                           
  25bd  39             RTS                               

; ---- function FUN_M69_r4_24000__25be
FUN_M69_r4_24000__25be:
  25be  3410           PSHS  X                           
  25c0  8E2574         LDX #0x2574                        ; desc[API_FE6E]: ->$25F7 ->$25BE
  25c3  AD9FFE6E       JSR [0xfe6e]                      
  25c7  3510           PULS  X                           
  25c9  39             RTS                               

; ---- function FUN_M69_r4_24000__25ca
FUN_M69_r4_24000__25ca:
  25ca  3410           PSHS  X                           
  25cc  8E2574         LDX #0x2574                        ; desc[API_FE1C]: ->$25F7 ->$25BE
  25cf  AD9FFE1C       JSR [0xfe1c]                      
  25d3  3510           PULS  X                           
  25d5  39             RTS                               

; ---- function FUN_M69_r4_24000__25d6
FUN_M69_r4_24000__25d6:
  25d6  3410           PSHS  X                           
  25d8  8E2574         LDX #0x2574                        ; desc[API_FE1A]: ->$25F7 ->$25BE $25B2
  25db  AD9FFE1A       JSR [0xfe1a]                      
  25df  3510           PULS  X                           
  25e1  39             RTS                               
  25e2  .db 14 72 69 67 68 74 20 6D 69 78 3A 20 20 20 20 25  ; .right mix:    %
  25f2  .db 20 77 65 74 20                                   ;  wet 

; ---- function FUN_M69_r4_24000__25f7
FUN_M69_r4_24000__25f7:
  25f7  3476           PSHS  U Y X B A                   
  25f9  8E2574         LDX #0x2574                       
  25fc  AD9FFE76       JSR [0xfe76]                      
  2600  CC0064         LDD #0x64                         
  2603  B37014         SUBD 0x7014                       
  2606  3606           PSHU  B A                         
  2608  58             LSLB                              
  2609  49             ROLA                              
  260a  FD711A         STD 0x711a                        
  260d  CC4666         LDD #0x4666                       
  2610  3606           PSHU  B A                         
  2612  AD9FFCF2       JSR [0xfcf2]                      
  2616  3706           PULU  A B                         
  2618  F3711A         ADDD 0x711a                       
  261b  AD9FFC72       JSR [0xfc72]                      
  261f  3576           PULS  A B X Y U                   
  2621  39             RTS                               
PTR_FUN_M69_r4_24000__268d_M69_r4_24000__2622:
  2622  268D           addr M69_r4_24000::268d           
  2624  266C           addr M69_r4_24000::266c           
  2626  .db 26 60 70 18 70 1A 00 00 70 1C 71 4C 71 65 2F FF  ; &`p.p...p.qLqe/.
  2636  .db D0 00 30 00 01 00 03 1C 26 78 00 00 00 00 00 00  ; ..0.....&x......
  2646  .db 00 00                                            ; ..

; ---- function FUN_M69_r4_24000__2648
FUN_M69_r4_24000__2648:
  2648  3410           PSHS  X                           
  264a  8E2622         LDX #0x2622                       
  264d  AD9FFE74       JSR [0xfe74]                      
  2651  3510           PULS  X                           
  2653  39             RTS                               

; ---- function FUN_M69_r4_24000__2654
FUN_M69_r4_24000__2654:
  2654  3410           PSHS  X                           
  2656  8E2622         LDX #0x2622                        ; desc[API_FE22]: ->$268D ->$266C
  2659  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  265d  3510           PULS  X                           
  265f  39             RTS                               

; ---- function FUN_M69_r4_24000__2660
FUN_M69_r4_24000__2660:
  2660  3410           PSHS  X                           
  2662  8E2622         LDX #0x2622                       
  2665  AD9FFE70       JSR [0xfe70]                      
  2669  3510           PULS  X                           
  266b  39             RTS                               

; ---- function FUN_M69_r4_24000__266c
FUN_M69_r4_24000__266c:
  266c  3410           PSHS  X                           
  266e  8E2622         LDX #0x2622                       
  2671  AD9FFE72       JSR [0xfe72]                      
  2675  3510           PULS  X                           
  2677  39             RTS                               
  2678  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  2688  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M69_r4_24000__268d
FUN_M69_r4_24000__268d:
  268d  3476           PSHS  U Y X B A                   
  268f  8E2622         LDX #0x2622                       
  2692  AD9FFE76       JSR [0xfe76]                      
  2696  AD9FFE52       JSR [0xfe52]                      
  269a  3576           PULS  A B X Y U                   
  269c  39             RTS                               
PTR_FUN_M69_r4_24000__2708_M69_r4_24000__269d:
  269d  2708           addr M69_r4_24000::2708           
  269f  26E7           addr M69_r4_24000::26e7           
  26a1  .db 26 DB 70 1E 70 20 00 00 70 22 71 4C 71 66 30 FF  ; &.p.p ..p"qLqf0.
  26b1  .db D0 00 30 00 01 00 03 1D 26 F3 00 00 00 00 00 00  ; ..0.....&.......
  26c1  .db 00 00                                            ; ..

; ---- function FUN_M69_r4_24000__26c3
FUN_M69_r4_24000__26c3:
  26c3  3410           PSHS  X                           
  26c5  8E269D         LDX #0x269d                       
  26c8  AD9FFE74       JSR [0xfe74]                      
  26cc  3510           PULS  X                           
  26ce  39             RTS                               

; ---- function FUN_M69_r4_24000__26cf
FUN_M69_r4_24000__26cf:
  26cf  3410           PSHS  X                           
  26d1  8E269D         LDX #0x269d                        ; desc[API_FE22]: ->$2708 ->$26E7
  26d4  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  26d8  3510           PULS  X                           
  26da  39             RTS                               

; ---- function FUN_M69_r4_24000__26db
FUN_M69_r4_24000__26db:
  26db  3410           PSHS  X                           
  26dd  8E269D         LDX #0x269d                       
  26e0  AD9FFE70       JSR [0xfe70]                      
  26e4  3510           PULS  X                           
  26e6  39             RTS                               

; ---- function FUN_M69_r4_24000__26e7
FUN_M69_r4_24000__26e7:
  26e7  3410           PSHS  X                           
  26e9  8E269D         LDX #0x269d                       
  26ec  AD9FFE72       JSR [0xfe72]                      
  26f0  3510           PULS  X                           
  26f2  39             RTS                               
  26f3  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  2703  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M69_r4_24000__2708
FUN_M69_r4_24000__2708:
  2708  3476           PSHS  U Y X B A                   
  270a  8E269D         LDX #0x269d                       
  270d  AD9FFE76       JSR [0xfe76]                      
  2711  AD9FFE54       JSR [0xfe54]                      
  2715  3576           PULS  A B X Y U                   
  2717  39             RTS                               
PTR_FUN_M69_r4_24000__2783_M69_r4_24000__2718:
  2718  2783           addr M69_r4_24000::2783           
  271a  2762           addr M69_r4_24000::2762           
  271c  .db 27 56 70 24 70 26 00 00 70 28 71 4C 71 67 31 FF  ; 'Vp$p&..p(qLqg1.
  272c  .db D0 00 30 00 01 00 03 1D 27 6E 00 00 00 00 00 00  ; ..0.....'n......
  273c  .db 00 00                                            ; ..

; ---- function FUN_M69_r4_24000__273e
FUN_M69_r4_24000__273e:
  273e  3410           PSHS  X                           
  2740  8E2718         LDX #0x2718                       
  2743  AD9FFE74       JSR [0xfe74]                      
  2747  3510           PULS  X                           
  2749  39             RTS                               

; ---- function FUN_M69_r4_24000__274a
FUN_M69_r4_24000__274a:
  274a  3410           PSHS  X                           
  274c  8E2718         LDX #0x2718                        ; desc[API_FE22]: ->$2783 ->$2762
  274f  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  2753  3510           PULS  X                           
  2755  39             RTS                               

; ---- function FUN_M69_r4_24000__2756
FUN_M69_r4_24000__2756:
  2756  3410           PSHS  X                           
  2758  8E2718         LDX #0x2718                       
  275b  AD9FFE70       JSR [0xfe70]                      
  275f  3510           PULS  X                           
  2761  39             RTS                               

; ---- function FUN_M69_r4_24000__2762
FUN_M69_r4_24000__2762:
  2762  3410           PSHS  X                           
  2764  8E2718         LDX #0x2718                       
  2767  AD9FFE72       JSR [0xfe72]                      
  276b  3510           PULS  X                           
  276d  39             RTS                               
  276e  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  277e  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M69_r4_24000__2783
FUN_M69_r4_24000__2783:
  2783  3476           PSHS  U Y X B A                   
  2785  8E2718         LDX #0x2718                       
  2788  AD9FFE76       JSR [0xfe76]                      
  278c  AD9FFE56       JSR [0xfe56]                      
  2790  3576           PULS  A B X Y U                   
  2792  39             RTS                               
PTR_FUN_M69_r4_24000__27fe_M69_r4_24000__2793:
  2793  27FE           addr M69_r4_24000::27fe           
  2795  27DD           addr M69_r4_24000::27dd           
  2797  .db 27 D1 70 2A 70 2C 00 00 70 2E 71 4C 71 68 32 FF  ; '.p*p,..p.qLqh2.
  27a7  .db D0 00 30 00 01 00 03 1E 27 E9 00 00 00 00 00 00  ; ..0.....'.......
  27b7  .db 00 00                                            ; ..

; ---- function FUN_M69_r4_24000__27b9
FUN_M69_r4_24000__27b9:
  27b9  3410           PSHS  X                           
  27bb  8E2793         LDX #0x2793                       
  27be  AD9FFE74       JSR [0xfe74]                      
  27c2  3510           PULS  X                           
  27c4  39             RTS                               

; ---- function FUN_M69_r4_24000__27c5
FUN_M69_r4_24000__27c5:
  27c5  3410           PSHS  X                           
  27c7  8E2793         LDX #0x2793                        ; desc[API_FE22]: ->$27FE ->$27DD
  27ca  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  27ce  3510           PULS  X                           
  27d0  39             RTS                               

; ---- function FUN_M69_r4_24000__27d1
FUN_M69_r4_24000__27d1:
  27d1  3410           PSHS  X                           
  27d3  8E2793         LDX #0x2793                       
  27d6  AD9FFE70       JSR [0xfe70]                      
  27da  3510           PULS  X                           
  27dc  39             RTS                               

; ---- function FUN_M69_r4_24000__27dd
FUN_M69_r4_24000__27dd:
  27dd  3410           PSHS  X                           
  27df  8E2793         LDX #0x2793                       
  27e2  AD9FFE72       JSR [0xfe72]                      
  27e6  3510           PULS  X                           
  27e8  39             RTS                               
  27e9  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  27f9  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M69_r4_24000__27fe
FUN_M69_r4_24000__27fe:
  27fe  3476           PSHS  U Y X B A                   
  2800  8E2793         LDX #0x2793                       
  2803  AD9FFE76       JSR [0xfe76]                      
  2807  AD9FFE58       JSR [0xfe58]                      
  280b  3576           PULS  A B X Y U                   
  280d  39             RTS                               
PTR_FUN_M69_r4_24000__2891_M69_r4_24000__280e:
  280e  2891           addr M69_r4_24000::2891           
  2810  2858           addr M69_r4_24000::2858           
  2812  .db 28 4C 70 BC 70 BE 00 00 70 C0 71 4C 71 7D 02 00  ; (Lp.p...p.qLq}..
  2822  .db 00 05 78 00 01 00 04 20 28 7C 00 00 00 00 70 C2  ; ..x.... (|....p.
  2832  .db 71 7F                                            ; q.

; ---- function FUN_M69_r4_24000__2834
FUN_M69_r4_24000__2834:
  2834  3410           PSHS  X                           
  2836  8E280E         LDX #0x280e                        ; desc[API_FE6A]: ->$2891 ->$2858
  2839  AD9FFE6A       JSR [0xfe6a]                      
  283d  3510           PULS  X                           
  283f  39             RTS                               

; ---- function FUN_M69_r4_24000__2840
FUN_M69_r4_24000__2840:
  2840  3410           PSHS  X                           
  2842  8E280E         LDX #0x280e                        ; desc[API_FDBC]: ->$2891 ->$2858
  2845  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..(."
  2849  3510           PULS  X                           
  284b  39             RTS                               

; ---- function FUN_M69_r4_24000__284c
FUN_M69_r4_24000__284c:
  284c  3410           PSHS  X                           
  284e  8E280E         LDX #0x280e                        ; desc[API_FE6C]: ->$2891 ->$2858
  2851  AD9FFE6C       JSR [0xfe6c]                      
  2855  3510           PULS  X                           
  2857  39             RTS                               

; ---- function FUN_M69_r4_24000__2858
FUN_M69_r4_24000__2858:
  2858  3410           PSHS  X                           
  285a  8E280E         LDX #0x280e                        ; desc[API_FE6E]: ->$2891 ->$2858
  285d  AD9FFE6E       JSR [0xfe6e]                      
  2861  3510           PULS  X                           
  2863  39             RTS                               

; ---- function FUN_M69_r4_24000__2864
FUN_M69_r4_24000__2864:
  2864  3410           PSHS  X                           
  2866  8E280E         LDX #0x280e                        ; desc[API_FE1C]: ->$2891 ->$2858
  2869  AD9FFE1C       JSR [0xfe1c]                      
  286d  3510           PULS  X                           
  286f  39             RTS                               

; ---- function FUN_M69_r4_24000__2870
FUN_M69_r4_24000__2870:
  2870  3410           PSHS  X                           
  2872  8E280E         LDX #0x280e                        ; desc[API_FE1A]: ->$2891 ->$2858 $284C
  2875  AD9FFE1A       JSR [0xfe1a]                      
  2879  3510           PULS  X                           
  287b  39             RTS                               
  287c  .db 14 6C 6F 6F 70 20 64 65 6C 61 79 3A 20 20 20 20  ; .loop delay:    
  288c  .db 20 20 6D 53 20                                   ;   mS 

; ---- function FUN_M69_r4_24000__2891
FUN_M69_r4_24000__2891:
  2891  3476           PSHS  U Y X B A                   
  2893  CC0000         LDD #0x0                          
  2896  8E044C         LDX #0x44c                        
  2899  108E0440       LDY #0x440                        
  289d  1705A0         LBSR 0x2e40                       
  28a0  CC7FFF         LDD #0x7fff                       
  28a3  FD7132         STD 0x7132                        
  28a6  CC0064         LDD #0x64                         
  28a9  FD7134         STD 0x7134                        
  28ac  8E280E         LDX #0x280e                       
  28af  AD9FFE76       JSR [0xfe76]                      
  28b3  FC70C0         LDD 0x70c0                        
  28b6  FD708C         STD 0x708c                        
  28b9  17F2C4         LBSR 0x1b80                       
  28bc  3576           PULS  A B X Y U                   
  28be  39             RTS                               
PTR_FUN_M69_r4_24000__2942_M69_r4_24000__28bf:
  28bf  2942           addr M69_r4_24000::2942           
  28c1  2909           addr M69_r4_24000::2909           
  28c3  .db 28 FD 70 C4 70 C6 00 00 70 C8 71 4C 71 7D 02 00  ; (.p.p...p.qLq}..
  28d3  .db 00 02 BC 00 01 00 03 20 29 2D 00 00 00 00 70 CA  ; ....... )-....p.
  28e3  .db 71 7F                                            ; q.

; ---- function FUN_M69_r4_24000__28e5
FUN_M69_r4_24000__28e5:
  28e5  3410           PSHS  X                           
  28e7  8E28BF         LDX #0x28bf                        ; desc[API_FE6A]: ->$2942 ->$2909
  28ea  AD9FFE6A       JSR [0xfe6a]                      
  28ee  3510           PULS  X                           
  28f0  39             RTS                               

; ---- function FUN_M69_r4_24000__28f1
FUN_M69_r4_24000__28f1:
  28f1  3410           PSHS  X                           
  28f3  8E28BF         LDX #0x28bf                        ; desc[API_FDBC]: ->$2942 ->$2909
  28f6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..(."
  28fa  3510           PULS  X                           
  28fc  39             RTS                               

; ---- function FUN_M69_r4_24000__28fd
FUN_M69_r4_24000__28fd:
  28fd  3410           PSHS  X                           
  28ff  8E28BF         LDX #0x28bf                        ; desc[API_FE6C]: ->$2942 ->$2909
  2902  AD9FFE6C       JSR [0xfe6c]                      
  2906  3510           PULS  X                           
  2908  39             RTS                               

; ---- function FUN_M69_r4_24000__2909
FUN_M69_r4_24000__2909:
  2909  3410           PSHS  X                           
  290b  8E28BF         LDX #0x28bf                        ; desc[API_FE6E]: ->$2942 ->$2909
  290e  AD9FFE6E       JSR [0xfe6e]                      
  2912  3510           PULS  X                           
  2914  39             RTS                               

; ---- function FUN_M69_r4_24000__2915
FUN_M69_r4_24000__2915:
  2915  3410           PSHS  X                           
  2917  8E28BF         LDX #0x28bf                        ; desc[API_FE1C]: ->$2942 ->$2909
  291a  AD9FFE1C       JSR [0xfe1c]                      
  291e  3510           PULS  X                           
  2920  39             RTS                               

; ---- function FUN_M69_r4_24000__2921
FUN_M69_r4_24000__2921:
  2921  3410           PSHS  X                           
  2923  8E28BF         LDX #0x28bf                        ; desc[API_FE1A]: ->$2942 ->$2909 $28FD
  2926  AD9FFE1A       JSR [0xfe1a]                      
  292a  3510           PULS  X                           
  292c  39             RTS                               
  292d  .db 14 6C 65 66 74 20 64 65 6C 61 79 3A 20 20 20 20  ; .left delay:    
  293d  .db 20 20 6D 53 20                                   ;   mS 

; ---- function FUN_M69_r4_24000__2942
FUN_M69_r4_24000__2942:
  2942  3476           PSHS  U Y X B A                   
  2944  CC0000         LDD #0x0                          
  2947  8E044C         LDX #0x44c                        
  294a  108E0440       LDY #0x440                        
  294e  1704EF         LBSR 0x2e40                       
  2951  CC320B         LDD #0x320b                       
  2954  F3600D         ADDD 0x600d                       
  2957  FD7104         STD 0x7104                        
  295a  CC7FFF         LDD #0x7fff                       
  295d  FD7132         STD 0x7132                        
  2960  CC0064         LDD #0x64                         
  2963  FD7134         STD 0x7134                        
  2966  8E28BF         LDX #0x28bf                       
  2969  AD9FFE76       JSR [0xfe76]                      
  296d  FC70C8         LDD 0x70c8                        
  2970  FD708C         STD 0x708c                        
  2973  17F20A         LBSR 0x1b80                       
  2976  3576           PULS  A B X Y U                   
  2978  39             RTS                               
PTR_FUN_M69_r4_24000__29fc_M69_r4_24000__2979:
  2979  29FC           addr M69_r4_24000::29fc           
  297b  29C3           addr M69_r4_24000::29c3           
  297d  .db 29 B7 70 CC 70 CE 00 00 70 D0 71 4C 71 9F 08 00  ; ).p.p...p.qLq...
  298d  .db 00 02 BC 00 01 00 03 21 29 E7 00 00 00 00 70 D2  ; .......!).....p.
  299d  .db 71 A1                                            ; q.

; ---- function FUN_M69_r4_24000__299f
FUN_M69_r4_24000__299f:
  299f  3410           PSHS  X                           
  29a1  8E2979         LDX #0x2979                        ; desc[API_FE6A]: ->$29FC ->$29C3
  29a4  AD9FFE6A       JSR [0xfe6a]                      
  29a8  3510           PULS  X                           
  29aa  39             RTS                               

; ---- function FUN_M69_r4_24000__29ab
FUN_M69_r4_24000__29ab:
  29ab  3410           PSHS  X                           
  29ad  8E2979         LDX #0x2979                        ; desc[API_FDBC]: ->$29FC ->$29C3
  29b0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)y"
  29b4  3510           PULS  X                           
  29b6  39             RTS                               

; ---- function FUN_M69_r4_24000__29b7
FUN_M69_r4_24000__29b7:
  29b7  3410           PSHS  X                           
  29b9  8E2979         LDX #0x2979                        ; desc[API_FE6C]: ->$29FC ->$29C3
  29bc  AD9FFE6C       JSR [0xfe6c]                      
  29c0  3510           PULS  X                           
  29c2  39             RTS                               

; ---- function FUN_M69_r4_24000__29c3
FUN_M69_r4_24000__29c3:
  29c3  3410           PSHS  X                           
  29c5  8E2979         LDX #0x2979                        ; desc[API_FE6E]: ->$29FC ->$29C3
  29c8  AD9FFE6E       JSR [0xfe6e]                      
  29cc  3510           PULS  X                           
  29ce  39             RTS                               

; ---- function FUN_M69_r4_24000__29cf
FUN_M69_r4_24000__29cf:
  29cf  3410           PSHS  X                           
  29d1  8E2979         LDX #0x2979                        ; desc[API_FE1C]: ->$29FC ->$29C3
  29d4  AD9FFE1C       JSR [0xfe1c]                      
  29d8  3510           PULS  X                           
  29da  39             RTS                               

; ---- function FUN_M69_r4_24000__29db
FUN_M69_r4_24000__29db:
  29db  3410           PSHS  X                           
  29dd  8E2979         LDX #0x2979                        ; desc[API_FE1A]: ->$29FC ->$29C3 $29B7
  29e0  AD9FFE1A       JSR [0xfe1a]                      
  29e4  3510           PULS  X                           
  29e6  39             RTS                               
  29e7  .db 14 72 69 67 68 74 20 64 65 6C 61 79 3A 20 20 20  ; .right delay:   
  29f7  .db 20 20 20 6D 53                                   ;    mS

; ---- function FUN_M69_r4_24000__29fc
FUN_M69_r4_24000__29fc:
  29fc  3476           PSHS  U Y X B A                   
  29fe  CC0003         LDD #0x3                          
  2a01  8E044F         LDX #0x44f                        
  2a04  108E0443       LDY #0x443                        
  2a08  170435         LBSR 0x2e40                       
  2a0b  CC320D         LDD #0x320d                       
  2a0e  F3600D         ADDD 0x600d                       
  2a11  FD7104         STD 0x7104                        
  2a14  CC7FFF         LDD #0x7fff                       
  2a17  FD7132         STD 0x7132                        
  2a1a  CC0064         LDD #0x64                         
  2a1d  FD7134         STD 0x7134                        
  2a20  8E2979         LDX #0x2979                       
  2a23  AD9FFE76       JSR [0xfe76]                      
  2a27  FC70D0         LDD 0x70d0                        
  2a2a  FD7092         STD 0x7092                        
  2a2d  17F150         LBSR 0x1b80                       
  2a30  3576           PULS  A B X Y U                   
  2a32  39             RTS                               
PTR_FUN_M69_r4_24000__2ab6_M69_r4_24000__2a33:
  2a33  2AB6           addr M69_r4_24000::2ab6           
  2a35  2A7D           addr M69_r4_24000::2a7d           
  2a37  .db 2A 71 70 D4 70 D6 00 00 70 D8 71 4C 71 81 03 FF  ; *qp.p...p.qLq...
  2a47  .db 9C 00 63 00 01 00 04 21 2A A1 00 00 00 00 70 DA  ; ..c....!*.....p.
  2a57  .db 71 83                                            ; q.

; ---- function FUN_M69_r4_24000__2a59
FUN_M69_r4_24000__2a59:
  2a59  3410           PSHS  X                           
  2a5b  8E2A33         LDX #0x2a33                        ; desc[API_FE6A]: ->$2AB6 ->$2A7D
  2a5e  AD9FFE6A       JSR [0xfe6a]                      
  2a62  3510           PULS  X                           
  2a64  39             RTS                               

; ---- function FUN_M69_r4_24000__2a65
FUN_M69_r4_24000__2a65:
  2a65  3410           PSHS  X                           
  2a67  8E2A33         LDX #0x2a33                        ; desc[API_FDBC]: ->$2AB6 ->$2A7D
  2a6a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..*3"
  2a6e  3510           PULS  X                           
  2a70  39             RTS                               

; ---- function FUN_M69_r4_24000__2a71
FUN_M69_r4_24000__2a71:
  2a71  3410           PSHS  X                           
  2a73  8E2A33         LDX #0x2a33                        ; desc[API_FE6C]: ->$2AB6 ->$2A7D
  2a76  AD9FFE6C       JSR [0xfe6c]                      
  2a7a  3510           PULS  X                           
  2a7c  39             RTS                               

; ---- function FUN_M69_r4_24000__2a7d
FUN_M69_r4_24000__2a7d:
  2a7d  3410           PSHS  X                           
  2a7f  8E2A33         LDX #0x2a33                        ; desc[API_FE6E]: ->$2AB6 ->$2A7D
  2a82  AD9FFE6E       JSR [0xfe6e]                      
  2a86  3510           PULS  X                           
  2a88  39             RTS                               

; ---- function FUN_M69_r4_24000__2a89
FUN_M69_r4_24000__2a89:
  2a89  3410           PSHS  X                           
  2a8b  8E2A33         LDX #0x2a33                        ; desc[API_FE1C]: ->$2AB6 ->$2A7D
  2a8e  AD9FFE1C       JSR [0xfe1c]                      
  2a92  3510           PULS  X                           
  2a94  39             RTS                               

; ---- function FUN_M69_r4_24000__2a95
FUN_M69_r4_24000__2a95:
  2a95  3410           PSHS  X                           
  2a97  8E2A33         LDX #0x2a33                        ; desc[API_FE1A]: ->$2AB6 ->$2A7D $2A71
  2a9a  AD9FFE1A       JSR [0xfe1a]                      
  2a9e  3510           PULS  X                           
  2aa0  39             RTS                               
  2aa1  .db 14 6C 6F 6F 70 20 66 65 65 64 62 61 63 6B 20 20  ; .loop feedback  
  2ab1  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M69_r4_24000__2ab6
FUN_M69_r4_24000__2ab6:
  2ab6  3476           PSHS  U Y X B A                   
  2ab8  CC0000         LDD #0x0                          
  2abb  8E0146         LDX #0x146                        
  2abe  FD7118         STD 0x7118                        
  2ac1  BF7112         STX 0x7112                        
  2ac4  FC7118         LDD 0x7118                        
  2ac7  58             LSLB                              
  2ac8  C370B0         ADDD #0x70b0                      
  2acb  FD70F6         STD 0x70f6                        
  2ace  8E2A33         LDX #0x2a33                       
  2ad1  AD9FFE76       JSR [0xfe76]                      
  2ad5  FC70D8         LDD 0x70d8                        
  2ad8  FD70B0         STD 0x70b0                        
  2adb  17F8E7         LBSR 0x23c5                       
  2ade  3576           PULS  A B X Y U                   
  2ae0  39             RTS                               
PTR_FUN_M69_r4_24000__2b64_M69_r4_24000__2ae1:
  2ae1  2B64           addr M69_r4_24000::2b64           
  2ae3  2B2B           addr M69_r4_24000::2b2b           
  2ae5  .db 2B 1F 70 DC 70 DE 00 00 70 E0 71 4C 71 81 03 FF  ; +.p.p...p.qLq...
  2af5  .db 9C 00 63 00 01 00 04 21 2B 4F 00 00 00 00 70 E2  ; ..c....!+O....p.
  2b05  .db 71 83                                            ; q.

; ---- function FUN_M69_r4_24000__2b07
FUN_M69_r4_24000__2b07:
  2b07  3410           PSHS  X                           
  2b09  8E2AE1         LDX #0x2ae1                        ; desc[API_FE6A]: ->$2B64 ->$2B2B
  2b0c  AD9FFE6A       JSR [0xfe6a]                      
  2b10  3510           PULS  X                           
  2b12  39             RTS                               

; ---- function FUN_M69_r4_24000__2b13
FUN_M69_r4_24000__2b13:
  2b13  3410           PSHS  X                           
  2b15  8E2AE1         LDX #0x2ae1                        ; desc[API_FDBC]: ->$2B64 ->$2B2B
  2b18  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..*."
  2b1c  3510           PULS  X                           
  2b1e  39             RTS                               

; ---- function FUN_M69_r4_24000__2b1f
FUN_M69_r4_24000__2b1f:
  2b1f  3410           PSHS  X                           
  2b21  8E2AE1         LDX #0x2ae1                        ; desc[API_FE6C]: ->$2B64 ->$2B2B
  2b24  AD9FFE6C       JSR [0xfe6c]                      
  2b28  3510           PULS  X                           
  2b2a  39             RTS                               

; ---- function FUN_M69_r4_24000__2b2b
FUN_M69_r4_24000__2b2b:
  2b2b  3410           PSHS  X                           
  2b2d  8E2AE1         LDX #0x2ae1                        ; desc[API_FE6E]: ->$2B64 ->$2B2B
  2b30  AD9FFE6E       JSR [0xfe6e]                      
  2b34  3510           PULS  X                           
  2b36  39             RTS                               

; ---- function FUN_M69_r4_24000__2b37
FUN_M69_r4_24000__2b37:
  2b37  3410           PSHS  X                           
  2b39  8E2AE1         LDX #0x2ae1                        ; desc[API_FE1C]: ->$2B64 ->$2B2B
  2b3c  AD9FFE1C       JSR [0xfe1c]                      
  2b40  3510           PULS  X                           
  2b42  39             RTS                               

; ---- function FUN_M69_r4_24000__2b43
FUN_M69_r4_24000__2b43:
  2b43  3410           PSHS  X                           
  2b45  8E2AE1         LDX #0x2ae1                        ; desc[API_FE1A]: ->$2B64 ->$2B2B $2B1F
  2b48  AD9FFE1A       JSR [0xfe1a]                      
  2b4c  3510           PULS  X                           
  2b4e  39             RTS                               
  2b4f  .db 14 6C 65 66 74 20 66 65 65 64 62 61 63 6B 20 20  ; .left feedback  
  2b5f  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M69_r4_24000__2b64
FUN_M69_r4_24000__2b64:
  2b64  3476           PSHS  U Y X B A                   
  2b66  CC0000         LDD #0x0                          
  2b69  8E0146         LDX #0x146                        
  2b6c  FD7118         STD 0x7118                        
  2b6f  BF7112         STX 0x7112                        
  2b72  FC7118         LDD 0x7118                        
  2b75  58             LSLB                              
  2b76  C370B0         ADDD #0x70b0                      
  2b79  FD70F6         STD 0x70f6                        
  2b7c  8E2AE1         LDX #0x2ae1                       
  2b7f  AD9FFE76       JSR [0xfe76]                      
  2b83  FC70E0         LDD 0x70e0                        
  2b86  FD70B0         STD 0x70b0                        
  2b89  17F839         LBSR 0x23c5                       
  2b8c  3576           PULS  A B X Y U                   
  2b8e  39             RTS                               
PTR_FUN_M69_r4_24000__2c12_M69_r4_24000__2b8f:
  2b8f  2C12           addr M69_r4_24000::2c12           
  2b91  2BD9           addr M69_r4_24000::2bd9           
  2b93  .db 2B CD 70 E4 70 E6 00 00 70 E8 71 4C 71 A3 09 FF  ; +.p.p...p.qLq...
  2ba3  .db 9C 00 63 00 01 00 04 23 2B FD 00 00 00 00 70 EA  ; ..c....#+.....p.
  2bb3  .db 71 A5                                            ; q.

; ---- function FUN_M69_r4_24000__2bb5
FUN_M69_r4_24000__2bb5:
  2bb5  3410           PSHS  X                           
  2bb7  8E2B8F         LDX #0x2b8f                        ; desc[API_FE6A]: ->$2C12 ->$2BD9
  2bba  AD9FFE6A       JSR [0xfe6a]                      
  2bbe  3510           PULS  X                           
  2bc0  39             RTS                               

; ---- function FUN_M69_r4_24000__2bc1
FUN_M69_r4_24000__2bc1:
  2bc1  3410           PSHS  X                           
  2bc3  8E2B8F         LDX #0x2b8f                        ; desc[API_FDBC]: ->$2C12 ->$2BD9
  2bc6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..+."
  2bca  3510           PULS  X                           
  2bcc  39             RTS                               

; ---- function FUN_M69_r4_24000__2bcd
FUN_M69_r4_24000__2bcd:
  2bcd  3410           PSHS  X                           
  2bcf  8E2B8F         LDX #0x2b8f                        ; desc[API_FE6C]: ->$2C12 ->$2BD9
  2bd2  AD9FFE6C       JSR [0xfe6c]                      
  2bd6  3510           PULS  X                           
  2bd8  39             RTS                               

; ---- function FUN_M69_r4_24000__2bd9
FUN_M69_r4_24000__2bd9:
  2bd9  3410           PSHS  X                           
  2bdb  8E2B8F         LDX #0x2b8f                        ; desc[API_FE6E]: ->$2C12 ->$2BD9
  2bde  AD9FFE6E       JSR [0xfe6e]                      
  2be2  3510           PULS  X                           
  2be4  39             RTS                               

; ---- function FUN_M69_r4_24000__2be5
FUN_M69_r4_24000__2be5:
  2be5  3410           PSHS  X                           
  2be7  8E2B8F         LDX #0x2b8f                        ; desc[API_FE1C]: ->$2C12 ->$2BD9
  2bea  AD9FFE1C       JSR [0xfe1c]                      
  2bee  3510           PULS  X                           
  2bf0  39             RTS                               

; ---- function FUN_M69_r4_24000__2bf1
FUN_M69_r4_24000__2bf1:
  2bf1  3410           PSHS  X                           
  2bf3  8E2B8F         LDX #0x2b8f                        ; desc[API_FE1A]: ->$2C12 ->$2BD9 $2BCD
  2bf6  AD9FFE1A       JSR [0xfe1a]                      
  2bfa  3510           PULS  X                           
  2bfc  39             RTS                               
  2bfd  .db 14 72 69 67 68 74 20 66 65 65 64 62 61 63 6B 3A  ; .right feedback:
  2c0d  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M69_r4_24000__2c12
FUN_M69_r4_24000__2c12:
  2c12  3476           PSHS  U Y X B A                   
  2c14  CC0003         LDD #0x3                          
  2c17  8E0246         LDX #0x246                        
  2c1a  FD7118         STD 0x7118                        
  2c1d  BF7112         STX 0x7112                        
  2c20  FC7118         LDD 0x7118                        
  2c23  58             LSLB                              
  2c24  C370B0         ADDD #0x70b0                      
  2c27  FD70F6         STD 0x70f6                        
  2c2a  8E2B8F         LDX #0x2b8f                       
  2c2d  AD9FFE76       JSR [0xfe76]                      
  2c31  FC70E8         LDD 0x70e8                        
  2c34  FD70B6         STD 0x70b6                        
  2c37  17F78B         LBSR 0x23c5                       
  2c3a  3576           PULS  A B X Y U                   
  2c3c  39             RTS                               

; ---- function FUN_M69_r4_24000__2c3d
FUN_M69_r4_24000__2c3d:
  2c3d  3406           PSHS  B A                         
  2c3f  FC708C         LDD 0x708c                        
  2c42  FD7140         STD 0x7140                        
  2c45  10B3708E       CMPD 0x708e                       
  2c49  2E06           BGT 0x2c51                        
  2c4b  FC708E         LDD 0x708e                        
  2c4e  FD7140         STD 0x7140                        
LAB_M69_r4_24000__2c51:
  2c51  10B37090       CMPD 0x7090                       
  2c55  2E06           BGT 0x2c5d                        
  2c57  FC7090         LDD 0x7090                        
  2c5a  FD7140         STD 0x7140                        
LAB_M69_r4_24000__2c5d:
  2c5d  10B37092       CMPD 0x7092                       
  2c61  2E06           BGT 0x2c69                        
  2c63  FC7092         LDD 0x7092                        
  2c66  FD7140         STD 0x7140                        
LAB_M69_r4_24000__2c69:
  2c69  10B37094       CMPD 0x7094                       
  2c6d  2E06           BGT 0x2c75                        
  2c6f  FC7094         LDD 0x7094                        
  2c72  FD7140         STD 0x7140                        
LAB_M69_r4_24000__2c75:
  2c75  10B37096       CMPD 0x7096                       
  2c79  2E06           BGT 0x2c81                        
  2c7b  FC7096         LDD 0x7096                        
  2c7e  FD7140         STD 0x7140                        
LAB_M69_r4_24000__2c81:
  2c81  3506           PULS  A B                         
  2c83  39             RTS                               

; ---- function FUN_M69_r4_24000__2c84
FUN_M69_r4_24000__2c84:
  2c84  FC714A         LDD 0x714a                        
  2c87  10830000       CMPD #0x0                         
  2c8b  2F08           BLE 0x2c95                        
  2c8d  830001         SUBD #0x1                         
  2c90  FD714A         STD 0x714a                        
  2c93  2012           BRA 0x2ca7                        
LAB_M69_r4_24000__2c95:
  2c95  CCFFFF         LDD #0xffff                       
  2c98  FD7148         STD 0x7148                        
  2c9b  17028C         LBSR 0x2f2a                       
  2c9e  1702FD         LBSR 0x2f9e                       
  2ca1  17FF99         LBSR 0x2c3d                       
  2ca4  17E7B7         LBSR 0x145e                       
LAB_M69_r4_24000__2ca7:
  2ca7  39             RTS                               

; ---- function FUN_M69_r4_24000__2ca8
FUN_M69_r4_24000__2ca8:
  2ca8  3426           PSHS  Y B A                       
  2caa  CC0000         LDD #0x0                          
  2cad  FD711A         STD 0x711a                        
  2cb0  CC000A         LDD #0xa                          
  2cb3  AD9FFD20       JSR [0xfd20]                      
  2cb7  108E0446       LDY #0x446                        
  2cbb  FC711A         LDD 0x711a                        
  2cbe  AD9FFD2E       JSR [0xfd2e]                      
  2cc2  CCFFFE         LDD #0xfffe                       
  2cc5  FD711A         STD 0x711a                        
  2cc8  CC000A         LDD #0xa                          
  2ccb  AD9FFD20       JSR [0xfd20]                      
  2ccf  108E0447       LDY #0x447                        
  2cd3  FC711A         LDD 0x711a                        
  2cd6  AD9FFD2E       JSR [0xfd2e]                      
  2cda  CC000A         LDD #0xa                          
  2cdd  AD9FFD20       JSR [0xfd20]                      
  2ce1  108E0448       LDY #0x448                        
  2ce5  FC711A         LDD 0x711a                        
  2ce8  AD9FFD2E       JSR [0xfd2e]                      
  2cec  CC000A         LDD #0xa                          
  2cef  AD9FFD20       JSR [0xfd20]                      
  2cf3  108E0449       LDY #0x449                        
  2cf7  FC711A         LDD 0x711a                        
  2cfa  AD9FFD2E       JSR [0xfd2e]                      
  2cfe  CC000A         LDD #0xa                          
  2d01  AD9FFD20       JSR [0xfd20]                      
  2d05  108E044A       LDY #0x44a                        
  2d09  FC711A         LDD 0x711a                        
  2d0c  AD9FFD2E       JSR [0xfd2e]                      
  2d10  CC000A         LDD #0xa                          
  2d13  AD9FFD20       JSR [0xfd20]                      
  2d17  108E044B       LDY #0x44b                        
  2d1b  FC711A         LDD 0x711a                        
  2d1e  AD9FFD2E       JSR [0xfd2e]                      
  2d22  3526           PULS  A B Y                       
  2d24  39             RTS                               

; ---- function FUN_M69_r4_24000__2d25
FUN_M69_r4_24000__2d25:
  2d25  3426           PSHS  Y B A                       
  2d27  CC0000         LDD #0x0                          
  2d2a  FD711A         STD 0x711a                        
  2d2d  CC000A         LDD #0xa                          
  2d30  AD9FFD20       JSR [0xfd20]                      
  2d34  108E0446       LDY #0x446                        
  2d38  FC711A         LDD 0x711a                        
  2d3b  AD9FFD2E       JSR [0xfd2e]                      
  2d3f  CC7FFF         LDD #0x7fff                       
  2d42  FD711A         STD 0x711a                        
  2d45  CC000A         LDD #0xa                          
  2d48  AD9FFD20       JSR [0xfd20]                      
  2d4c  108E0447       LDY #0x447                        
  2d50  FC711A         LDD 0x711a                        
  2d53  AD9FFD2E       JSR [0xfd2e]                      
  2d57  CC000A         LDD #0xa                          
  2d5a  AD9FFD20       JSR [0xfd20]                      
  2d5e  108E0448       LDY #0x448                        
  2d62  FC711A         LDD 0x711a                        
  2d65  AD9FFD2E       JSR [0xfd2e]                      
  2d69  CC8000         LDD #0x8000                       
  2d6c  FD711A         STD 0x711a                        
  2d6f  CC000A         LDD #0xa                          
  2d72  AD9FFD20       JSR [0xfd20]                      
  2d76  108E0449       LDY #0x449                        
  2d7a  FC711A         LDD 0x711a                        
  2d7d  AD9FFD2E       JSR [0xfd2e]                      
  2d81  CCFFFE         LDD #0xfffe                       
  2d84  FD711A         STD 0x711a                        
  2d87  CC000A         LDD #0xa                          
  2d8a  AD9FFD20       JSR [0xfd20]                      
  2d8e  108E044A       LDY #0x44a                        
  2d92  FC711A         LDD 0x711a                        
  2d95  AD9FFD2E       JSR [0xfd2e]                      
  2d99  CC000A         LDD #0xa                          
  2d9c  AD9FFD20       JSR [0xfd20]                      
  2da0  108E044B       LDY #0x44b                        
  2da4  FC711A         LDD 0x711a                        
  2da7  AD9FFD2E       JSR [0xfd2e]                      
  2dab  3526           PULS  A B Y                       
  2dad  39             RTS                               

; ---- function FUN_M69_r4_24000__2dae
FUN_M69_r4_24000__2dae:
  2dae  CC320F         LDD #0x320f                       
  2db1  F3600D         ADDD 0x600d                       
  2db4  1F01           TFR D,X                           
  2db6  EC81           LDD ,X++                          
  2db8  FD711A         STD 0x711a                        
  2dbb  CC000A         LDD #0xa                          
  2dbe  AD9FFD20       JSR [0xfd20]                      
  2dc2  108E0446       LDY #0x446                        
  2dc6  FC711A         LDD 0x711a                        
  2dc9  AD9FFD2E       JSR [0xfd2e]                      
  2dcd  EC81           LDD ,X++                          
  2dcf  FD711A         STD 0x711a                        
  2dd2  CC000A         LDD #0xa                          
  2dd5  AD9FFD20       JSR [0xfd20]                      
  2dd9  108E0447       LDY #0x447                        
  2ddd  FC711A         LDD 0x711a                        
  2de0  AD9FFD2E       JSR [0xfd2e]                      
  2de4  EC81           LDD ,X++                          
  2de6  FD711A         STD 0x711a                        
  2de9  CC000A         LDD #0xa                          
  2dec  AD9FFD20       JSR [0xfd20]                      
  2df0  108E0448       LDY #0x448                        
  2df4  FC711A         LDD 0x711a                        
  2df7  AD9FFD2E       JSR [0xfd2e]                      
  2dfb  EC81           LDD ,X++                          
  2dfd  FD711A         STD 0x711a                        
  2e00  CC000A         LDD #0xa                          
  2e03  AD9FFD20       JSR [0xfd20]                      
  2e07  108E0449       LDY #0x449                        
  2e0b  FC711A         LDD 0x711a                        
  2e0e  AD9FFD2E       JSR [0xfd2e]                      
  2e12  EC81           LDD ,X++                          
  2e14  FD711A         STD 0x711a                        
  2e17  CC000A         LDD #0xa                          
  2e1a  AD9FFD20       JSR [0xfd20]                      
  2e1e  108E044A       LDY #0x44a                        
  2e22  FC711A         LDD 0x711a                        
  2e25  AD9FFD2E       JSR [0xfd2e]                      
  2e29  EC81           LDD ,X++                          
  2e2b  FD711A         STD 0x711a                        
  2e2e  CC000A         LDD #0xa                          
  2e31  AD9FFD20       JSR [0xfd20]                      
  2e35  108E044B       LDY #0x44b                        
  2e39  FC711A         LDD 0x711a                        
  2e3c  AD9FFD2E       JSR [0xfd2e]                      

; ---- function FUN_M69_r4_24000__2e40
FUN_M69_r4_24000__2e40:
  2e40  3406           PSHS  B A                         
  2e42  FD7118         STD 0x7118                        
  2e45  BF7108         STX 0x7108                        
  2e48  10BF710A       STY 0x710a                        
  2e4c  10BF7114       STY 0x7114                        
  2e50  FC7114         LDD 0x7114                        
  2e53  C30012         ADDD #0x12                        
  2e56  FD7116         STD 0x7116                        
  2e59  FD710C         STD 0x710c                        
  2e5c  FC7118         LDD 0x7118                        
  2e5f  58             LSLB                              
  2e60  C3708C         ADDD #0x708c                      
  2e63  FD70EC         STD 0x70ec                        
  2e66  FC7118         LDD 0x7118                        
  2e69  C371A3         ADDD #0x71a3                      
  2e6c  83714C         SUBD #0x714c                      
  2e6f  FD70F8         STD 0x70f8                        
  2e72  FC7118         LDD 0x7118                        
  2e75  58             LSLB                              
  2e76  C331F1         ADDD #0x31f1                      
  2e79  F3600D         ADDD 0x600d                       
  2e7c  FD7104         STD 0x7104                        
  2e7f  3506           PULS  A B                         
  2e81  39             RTS                               

; ---- function FUN_M69_r4_24000__2e82
FUN_M69_r4_24000__2e82:
  2e82  3476           PSHS  U Y X B A                   
  2e84  170284         LBSR 0x310b                       
  2e87  FC7070         LDD 0x7070                        
  2e8a  3606           PSHU  B A                         
  2e8c  2010           BRA 0x2e9e                        

; ---- function FUN_M69_r4_24000__2e8e
FUN_M69_r4_24000__2e8e:
  2e8e  3476           PSHS  U Y X B A                   
  2e90  170278         LBSR 0x310b                       
  2e93  FC7070         LDD 0x7070                        
  2e96  3606           PSHU  B A                         
  2e98  CCFFFF         LDD #0xffff                       
  2e9b  FD7070         STD 0x7070                        
LAB_M69_r4_24000__2e9e:
  2e9e  CC0000         LDD #0x0                          
  2ea1  8E044C         LDX #0x44c                        
  2ea4  108E0440       LDY #0x440                        
  2ea8  17FF95         LBSR 0x2e40                       
  2eab  17ECD2         LBSR 0x1b80                       
  2eae  CC0001         LDD #0x1                          
  2eb1  8E044D         LDX #0x44d                        
  2eb4  108E0441       LDY #0x441                        
  2eb8  17FF85         LBSR 0x2e40                       
  2ebb  17ECC2         LBSR 0x1b80                       
  2ebe  CC0002         LDD #0x2                          
  2ec1  8E044E         LDX #0x44e                        
  2ec4  108E0442       LDY #0x442                        
  2ec8  17FF75         LBSR 0x2e40                       
  2ecb  17ECB2         LBSR 0x1b80                       
  2ece  CC0003         LDD #0x3                          
  2ed1  8E044F         LDX #0x44f                        
  2ed4  108E0443       LDY #0x443                        
  2ed8  17FF65         LBSR 0x2e40                       
  2edb  17ECA2         LBSR 0x1b80                       
  2ede  CC0004         LDD #0x4                          
  2ee1  8E0450         LDX #0x450                        
  2ee4  108E0444       LDY #0x444                        
  2ee8  17FF55         LBSR 0x2e40                       
  2eeb  17EC92         LBSR 0x1b80                       
  2eee  CC0005         LDD #0x5                          
  2ef1  8E0451         LDX #0x451                        
  2ef4  108E0445       LDY #0x445                        
  2ef8  17FF45         LBSR 0x2e40                       
  2efb  17EC82         LBSR 0x1b80                       
  2efe  3706           PULU  A B                         
  2f00  FD7070         STD 0x7070                        
  2f03  170278         LBSR 0x317e                       
  2f06  3576           PULS  A B X Y U                   
  2f08  39             RTS                               

; ---- function FUN_M69_r4_24000__2f09
FUN_M69_r4_24000__2f09:
  2f09  3406           PSHS  B A                         
  2f0b  FD7118         STD 0x7118                        
  2f0e  BF710A         STX 0x710a                        
  2f11  FC7118         LDD 0x7118                        
  2f14  58             LSLB                              
  2f15  C37080         ADDD #0x7080                      
  2f18  FD70EE         STD 0x70ee                        
  2f1b  FC7118         LDD 0x7118                        
  2f1e  C371AF         ADDD #0x71af                      
  2f21  83714C         SUBD #0x714c                      
  2f24  FD70FA         STD 0x70fa                        
  2f27  3506           PULS  A B                         
  2f29  39             RTS                               

; ---- function FUN_M69_r4_24000__2f2a
FUN_M69_r4_24000__2f2a:
  2f2a  3476           PSHS  U Y X B A                   
  2f2c  1701DC         LBSR 0x310b                       
  2f2f  CC0000         LDD #0x0                          
  2f32  8E0440         LDX #0x440                        
  2f35  17FFD1         LBSR 0x2f09                       
  2f38  17EE5F         LBSR 0x1d9a                       
  2f3b  CC0001         LDD #0x1                          
  2f3e  8E0441         LDX #0x441                        
  2f41  17FFC5         LBSR 0x2f09                       
  2f44  17EE53         LBSR 0x1d9a                       
  2f47  CC0002         LDD #0x2                          
  2f4a  8E0442         LDX #0x442                        
  2f4d  17FFB9         LBSR 0x2f09                       
  2f50  17EE47         LBSR 0x1d9a                       
  2f53  CC0003         LDD #0x3                          
  2f56  8E0443         LDX #0x443                        
  2f59  17FFAD         LBSR 0x2f09                       
  2f5c  17EE3B         LBSR 0x1d9a                       
  2f5f  CC0004         LDD #0x4                          
  2f62  8E0444         LDX #0x444                        
  2f65  17FFA1         LBSR 0x2f09                       
  2f68  17EE2F         LBSR 0x1d9a                       
  2f6b  CC0005         LDD #0x5                          
  2f6e  8E0445         LDX #0x445                        
  2f71  17FF95         LBSR 0x2f09                       
  2f74  17EE23         LBSR 0x1d9a                       
  2f77  170204         LBSR 0x317e                       
  2f7a  3576           PULS  A B X Y U                   
  2f7c  39             RTS                               

; ---- function FUN_M69_r4_24000__2f7d
FUN_M69_r4_24000__2f7d:
  2f7d  3406           PSHS  B A                         
  2f7f  FD7118         STD 0x7118                        
  2f82  BF710C         STX 0x710c                        
  2f85  FC7118         LDD 0x7118                        
  2f88  58             LSLB                              
  2f89  C37074         ADDD #0x7074                      
  2f8c  FD70F0         STD 0x70f0                        
  2f8f  FC7118         LDD 0x7118                        
  2f92  C371A9         ADDD #0x71a9                      
  2f95  83714C         SUBD #0x714c                      
  2f98  FD70FC         STD 0x70fc                        
  2f9b  3506           PULS  A B                         
  2f9d  39             RTS                               

; ---- function FUN_M69_r4_24000__2f9e
FUN_M69_r4_24000__2f9e:
  2f9e  3476           PSHS  U Y X B A                   
  2fa0  170168         LBSR 0x310b                       
  2fa3  CC0000         LDD #0x0                          
  2fa6  8E0452         LDX #0x452                        
  2fa9  17FFD1         LBSR 0x2f7d                       
  2fac  17EF66         LBSR 0x1f15                       
  2faf  CC0001         LDD #0x1                          
  2fb2  8E0453         LDX #0x453                        
  2fb5  17FFC5         LBSR 0x2f7d                       
  2fb8  17EF5A         LBSR 0x1f15                       
  2fbb  CC0002         LDD #0x2                          
  2fbe  8E0454         LDX #0x454                        
  2fc1  17FFB9         LBSR 0x2f7d                       
  2fc4  17EF4E         LBSR 0x1f15                       
  2fc7  CC0003         LDD #0x3                          
  2fca  8E0455         LDX #0x455                        
  2fcd  17FFAD         LBSR 0x2f7d                       
  2fd0  17EF42         LBSR 0x1f15                       
  2fd3  CC0004         LDD #0x4                          
  2fd6  8E0456         LDX #0x456                        
  2fd9  17FFA1         LBSR 0x2f7d                       
  2fdc  17EF36         LBSR 0x1f15                       
  2fdf  CC0005         LDD #0x5                          
  2fe2  8E0457         LDX #0x457                        
  2fe5  17FF95         LBSR 0x2f7d                       
  2fe8  17EF2A         LBSR 0x1f15                       
  2feb  170190         LBSR 0x317e                       
  2fee  3576           PULS  A B X Y U                   
  2ff0  39             RTS                               

; ---- function FUN_M69_r4_24000__2ff1
FUN_M69_r4_24000__2ff1:
  2ff1  3406           PSHS  B A                         
  2ff3  FD7118         STD 0x7118                        
  2ff6  BF710E         STX 0x710e                        
  2ff9  10BF7110       STY 0x7110                        
  2ffd  FC7118         LDD 0x7118                        
  3000  58             LSLB                              
  3001  C370A4         ADDD #0x70a4                      
  3004  FD70F2         STD 0x70f2                        
  3007  FC7118         LDD 0x7118                        
  300a  58             LSLB                              
  300b  C37098         ADDD #0x7098                      
  300e  FD70F4         STD 0x70f4                        
  3011  FC7118         LDD 0x7118                        
  3014  C371BB         ADDD #0x71bb                      
  3017  83714C         SUBD #0x714c                      
  301a  FD70FE         STD 0x70fe                        
  301d  FC7118         LDD 0x7118                        
  3020  C371B5         ADDD #0x71b5                      
  3023  83714C         SUBD #0x714c                      
  3026  FD7100         STD 0x7100                        
  3029  3506           PULS  A B                         
  302b  39             RTS                               

; ---- function FUN_M69_r4_24000__302c
FUN_M69_r4_24000__302c:
  302c  3476           PSHS  U Y X B A                   
  302e  1700DA         LBSR 0x310b                       
  3031  CC0000         LDD #0x0                          
  3034  8E0140         LDX #0x140                        
  3037  108E0143       LDY #0x143                        
  303b  17FFB3         LBSR 0x2ff1                       
  303e  17F054         LBSR 0x2095                       
  3041  CC0001         LDD #0x1                          
  3044  8E0141         LDX #0x141                        
  3047  108E0144       LDY #0x144                        
  304b  17FFA3         LBSR 0x2ff1                       
  304e  17F044         LBSR 0x2095                       
  3051  CC0002         LDD #0x2                          
  3054  8E0142         LDX #0x142                        
  3057  108E0145       LDY #0x145                        
  305b  17FF93         LBSR 0x2ff1                       
  305e  17F034         LBSR 0x2095                       
  3061  CC0003         LDD #0x3                          
  3064  8E0240         LDX #0x240                        
  3067  108E0243       LDY #0x243                        
  306b  17FF83         LBSR 0x2ff1                       
  306e  17F024         LBSR 0x2095                       
  3071  CC0004         LDD #0x4                          
  3074  8E0241         LDX #0x241                        
  3077  108E0244       LDY #0x244                        
  307b  17FF73         LBSR 0x2ff1                       
  307e  17F014         LBSR 0x2095                       
  3081  CC0005         LDD #0x5                          
  3084  8E0242         LDX #0x242                        
  3087  108E0245       LDY #0x245                        
  308b  17FF63         LBSR 0x2ff1                       
  308e  17F004         LBSR 0x2095                       
  3091  1700EA         LBSR 0x317e                       
  3094  3576           PULS  A B X Y U                   
  3096  39             RTS                               

; ---- function FUN_M69_r4_24000__3097
FUN_M69_r4_24000__3097:
  3097  3406           PSHS  B A                         
  3099  FD7118         STD 0x7118                        
  309c  BF7112         STX 0x7112                        
  309f  FC7118         LDD 0x7118                        
  30a2  58             LSLB                              
  30a3  C370B0         ADDD #0x70b0                      
  30a6  FD70F6         STD 0x70f6                        
  30a9  FC7118         LDD 0x7118                        
  30ac  C371C1         ADDD #0x71c1                      
  30af  83714C         SUBD #0x714c                      
  30b2  FD7102         STD 0x7102                        
  30b5  3506           PULS  A B                         
  30b7  39             RTS                               

; ---- function FUN_M69_r4_24000__30b8
FUN_M69_r4_24000__30b8:
  30b8  3476           PSHS  U Y X B A                   
  30ba  17004E         LBSR 0x310b                       
  30bd  CC0000         LDD #0x0                          
  30c0  8E0146         LDX #0x146                        
  30c3  17FFD1         LBSR 0x3097                       
  30c6  17F2FC         LBSR 0x23c5                       
  30c9  CC0001         LDD #0x1                          
  30cc  8E0147         LDX #0x147                        
  30cf  17FFC5         LBSR 0x3097                       
  30d2  17F2F0         LBSR 0x23c5                       
  30d5  CC0002         LDD #0x2                          
  30d8  8E0148         LDX #0x148                        
  30db  17FFB9         LBSR 0x3097                       
  30de  17F2E4         LBSR 0x23c5                       
  30e1  CC0003         LDD #0x3                          
  30e4  8E0246         LDX #0x246                        
  30e7  17FFAD         LBSR 0x3097                       
  30ea  17F2D8         LBSR 0x23c5                       
  30ed  CC0004         LDD #0x4                          
  30f0  8E0247         LDX #0x247                        
  30f3  17FFA1         LBSR 0x3097                       
  30f6  17F2CC         LBSR 0x23c5                       
  30f9  CC0005         LDD #0x5                          
  30fc  8E0248         LDX #0x248                        
  30ff  17FF95         LBSR 0x3097                       
  3102  17F2C0         LBSR 0x23c5                       
  3105  170076         LBSR 0x317e                       
  3108  3576           PULS  A B X Y U                   
  310a  39             RTS                               

; ---- function FUN_M69_r4_24000__310b
FUN_M69_r4_24000__310b:
  310b  3436           PSHS  Y X B A                     
  310d  FC7118         LDD 0x7118                        
  3110  3606           PSHU  B A                         
  3112  FC7108         LDD 0x7108                        
  3115  3606           PSHU  B A                         
  3117  FC70EC         LDD 0x70ec                        
  311a  3606           PSHU  B A                         
  311c  FC70F8         LDD 0x70f8                        
  311f  3606           PSHU  B A                         
  3121  FC7114         LDD 0x7114                        
  3124  3606           PSHU  B A                         
  3126  FC7116         LDD 0x7116                        
  3129  3606           PSHU  B A                         
  312b  FC7104         LDD 0x7104                        
  312e  3606           PSHU  B A                         
  3130  FC710A         LDD 0x710a                        
  3133  3606           PSHU  B A                         
  3135  FC70EE         LDD 0x70ee                        
  3138  3606           PSHU  B A                         
  313a  FC70FA         LDD 0x70fa                        
  313d  3606           PSHU  B A                         
  313f  FC710C         LDD 0x710c                        
  3142  3606           PSHU  B A                         
  3144  FC70F0         LDD 0x70f0                        
  3147  3606           PSHU  B A                         
  3149  FC70FC         LDD 0x70fc                        
  314c  3606           PSHU  B A                         
  314e  FC710E         LDD 0x710e                        
  3151  3606           PSHU  B A                         
  3153  FC7110         LDD 0x7110                        
  3156  3606           PSHU  B A                         
  3158  FC70F2         LDD 0x70f2                        
  315b  3606           PSHU  B A                         
  315d  FC70FE         LDD 0x70fe                        
  3160  3606           PSHU  B A                         
  3162  FC70F4         LDD 0x70f4                        
  3165  3606           PSHU  B A                         
  3167  FC7100         LDD 0x7100                        
  316a  3606           PSHU  B A                         
  316c  FC7112         LDD 0x7112                        
  316f  3606           PSHU  B A                         
  3171  FC70F6         LDD 0x70f6                        
  3174  3606           PSHU  B A                         
  3176  FC7102         LDD 0x7102                        
  3179  3606           PSHU  B A                         
  317b  3536           PULS  A B X Y                     
  317d  39             RTS                               

; ---- function FUN_M69_r4_24000__317e
FUN_M69_r4_24000__317e:
  317e  3436           PSHS  Y X B A                     
  3180  3706           PULU  A B                         
  3182  FD7102         STD 0x7102                        
  3185  3706           PULU  A B                         
  3187  FD70F6         STD 0x70f6                        
  318a  3706           PULU  A B                         
  318c  FD7112         STD 0x7112                        
  318f  3706           PULU  A B                         
  3191  FD7100         STD 0x7100                        
  3194  3706           PULU  A B                         
  3196  FD70F4         STD 0x70f4                        
  3199  3706           PULU  A B                         
  319b  FD70FE         STD 0x70fe                        
  319e  3706           PULU  A B                         
  31a0  FD70F2         STD 0x70f2                        
  31a3  3706           PULU  A B                         
  31a5  FD7110         STD 0x7110                        
  31a8  3706           PULU  A B                         
  31aa  FD710E         STD 0x710e                        
  31ad  3706           PULU  A B                         
  31af  FD70FC         STD 0x70fc                        
  31b2  3706           PULU  A B                         
  31b4  FD70F0         STD 0x70f0                        
  31b7  3706           PULU  A B                         
  31b9  FD710C         STD 0x710c                        
  31bc  3706           PULU  A B                         
  31be  FD70FA         STD 0x70fa                        
  31c1  3706           PULU  A B                         
  31c3  FD70EE         STD 0x70ee                        
  31c6  3706           PULU  A B                         
  31c8  FD710A         STD 0x710a                        
  31cb  3706           PULU  A B                         
  31cd  FD7104         STD 0x7104                        
  31d0  3706           PULU  A B                         
  31d2  FD7116         STD 0x7116                        
  31d5  3706           PULU  A B                         
  31d7  FD7116         STD 0x7116                        
  31da  3706           PULU  A B                         
  31dc  FD70F8         STD 0x70f8                        
  31df  3706           PULU  A B                         
  31e1  FD70EC         STD 0x70ec                        
  31e4  3706           PULU  A B                         
  31e6  FD7108         STD 0x7108                        
  31e9  3706           PULU  A B                         
  31eb  FD7118         STD 0x7118                        
  31ee  3536           PULS  A B X Y                     
  31f0  39             RTS                               
  31f1  .db 00 2F 00 0D 00 05 00 01 00 17 00 11 00 25 00 29  ; ./...........%.)
  3201  .db 00 0B 00 07 00 1F 00 13 00 1D                    ; ..........
DAT_M69_r4_24000__320b:
  320b  00             ?? 00h                            
  320c  .db 01                                               ; .
DAT_M69_r4_24000__320d:
  320d  00             ?? 00h                            
  320e  .db 02                                               ; .
DAT_M69_r4_24000__320f:
  320f  00             ?? 00h                            
  3210  .db 00                                               ; .
DAT_M69_r4_24000__3211:
  3211  2A             ?? 2Ah    *                       
  3212  .db 94                                               ; .
DAT_M69_r4_24000__3213:
  3213  55             ?? 55h    U                       
  3214  .db 28                                               ; (
DAT_M69_r4_24000__3215:
  3215  7F             ?? 7Fh                           
  3216  .db BC                                               ; .
DAT_M69_r4_24000__3217:
  3217  AA             ?? AAh                            
  3218  .db 50                                               ; P
DAT_M69_r4_24000__3219:
  3219  D4             ?? D4h                            
  321a  .db E4                                               ; .

;; Module 6D parameter/preset table "LONG DIGIPLEX", 123 bytes
MODULE_6D_TABLE_LONG_DIGIPLEX_hdr:
  321b  6D0000830000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6D_TABLE_LONG_DIGIPLEX:
  3223  6D             ?? 6Dh    m                       
  3224  .db 01                                               ; .
  3225  4C4F4E472044.. ds "LONG DIGIPLEX  "              
  3238  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3248  .db 00 00 00 00 03 E8 05 78 00 19 00 64 00 64 00 64  ; .......x...d.d.d
  3258  .db 07 D0 27 10 00 00 02 02 02 02 02 32 00           ; ..'........2.
  3265  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  328c  .db 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13 88  ; ................
  329c  .db 13 88                                            ; ..

;; Module 6D code record 01, 156 bytes, entered at payload start
MODULE_6D_01_CODE_hdr:
  329e  6D0100A40000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6D_01_entry
MODULE_6D_01_entry:
  32a6  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $32AA
  32aa  32AA           dw 32AAh                          
LAB_M69_r4_24000__32ac:
  32ac  3477           PSHS  U Y X B A CC                
  32ae  17CDBF         LBSR 0x0070                       
  32b1  17CD78         LBSR 0x002c                       
  32b4  17F1E0         LBSR 0x2497                       
  32b7  17CD56         LBSR 0x0010                       
  32ba  8603           LDA #0x3                          
  32bc  B760DA         STA 0x60da                        
  32bf  AD9FFE38       JSR [0xfe38]                      
  32c3  B6600A         LDA 0x600a                        
  32c6  8169           CMPA #0x69                        
  32c8  270F           BEQ 0x32d9                        
  32ca  816E           CMPA #0x6e                        
  32cc  270B           BEQ 0x32d9                        
  32ce  816D           CMPA #0x6d                        
  32d0  2707           BEQ 0x32d9                        
  32d2  AD9FFED0       JSR [0xfed0]                      
  32d6  17CEA7         LBSR 0x0180                       
LAB_M69_r4_24000__32d9:
  32d9  B6600A         LDA 0x600a                        
  32dc  816D           CMPA #0x6d                        
  32de  2703           BEQ 0x32e3                        
  32e0  17CEDB         LBSR 0x01be                       
LAB_M69_r4_24000__32e3:
  32e3  FC7070         LDD 0x7070                        
  32e6  3606           PSHU  B A                         
  32e8  CCFFFF         LDD #0xffff                       
  32eb  FD7070         STD 0x7070                        
  32ee  17F9B7         LBSR 0x2ca8                       
  32f1  17F59D         LBSR 0x2891                       
  32f4  17E674         LBSR 0x196b                       
  32f7  3706           PULU  A B                         
  32f9  FD7070         STD 0x7070                        
  32fc  17E15F         LBSR 0x145e                       
  32ff  17E531         LBSR 0x1833                       
  3302  17F7B1         LBSR 0x2ab6                       
  3305  17F97C         LBSR 0x2c84                       
  3308  17D0CC         LBSR 0x03d7                       
  330b  8601           LDA #0x1                          
  330d  B76105         STA 0x6105                        
  3310  CC0043         LDD #0x43                         
  3313  FD6106         STD 0x6106                        
  3316  B6600A         LDA 0x600a                        
  3319  8169           CMPA #0x69                        
  331b  270F           BEQ 0x332c                        
  331d  816E           CMPA #0x6e                        
  331f  270B           BEQ 0x332c                        
  3321  816D           CMPA #0x6d                        
  3323  2707           BEQ 0x332c                        
  3325  CC0FA0         LDD #0xfa0                        
  3328  AD9FFD20       JSR [0xfd20]                      
LAB_M69_r4_24000__332c:
  332c  AD9FFE36       JSR [0xfe36]                      
  3330  AD9FFDF6       JSR [0xfdf6]                      
  3334  AD9FFE18       JSR [0xfe18]                      
  3338  17D8F0         LBSR 0x0c2b                       
  333b  AD9FFE10       JSR [0xfe10]                      
  333f  3577           PULS CC A B X Y U                 
  3341  39             RTS                               

;; Module 6E parameter/preset table "DUAL DIGIPLEX", 147 bytes
MODULE_6E_TABLE_DUAL_DIGIPLEX_hdr:
  3342  6E00009B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6E_TABLE_DUAL_DIGIPLEX:
  334a  6E             ?? 6Eh    n                       
  334b  .db 01                                               ; .
  334c  4455414C2044.. ds "DUAL DIGIPLEX  "              
  335c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  336c  .db 00 00 00 00 00 00 00 01 F4 02 BC 00 19 00 64 00  ; ..............d.
  337c  .db 64 00 64 07 D0 27 10 00 00 00 00 00 00 00 00 00  ; d.d..'..........
  338c  .db 00 00 00 00 00 00 64 00 64 02 58 02 BC 00 19 00  ; ......d.d.X.....
  339c  .db 64 02 02 02 02 02 32 00                          ; d.....2.
  33a4  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  33c8  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13  ; ................
  33d8  .db 88 13 88 13 88                                   ; .....

;; Module 6E code record 01, 158 bytes, entered at payload start
MODULE_6E_01_CODE_hdr:
  33dd  6E0100A60000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6E_01_entry
MODULE_6E_01_entry:
  33e5  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $33E9
  33e9  33E9           dw 33E9h                          
LAB_M69_r4_24000__33eb:
  33eb  3477           PSHS  U Y X B A CC                
  33ed  17CC80         LBSR 0x0070                       
  33f0  17CC39         LBSR 0x002c                       
  33f3  17F153         LBSR 0x2549                       
  33f6  17F1FE         LBSR 0x25f7                       
  33f9  17CC14         LBSR 0x0010                       
  33fc  8603           LDA #0x3                          
  33fe  B760DA         STA 0x60da                        
  3401  AD9FFE38       JSR [0xfe38]                      
  3405  B6600A         LDA 0x600a                        
  3408  8169           CMPA #0x69                        
  340a  270F           BEQ 0x341b                        
  340c  816E           CMPA #0x6e                        
  340e  270B           BEQ 0x341b                        
  3410  816D           CMPA #0x6d                        
  3412  2707           BEQ 0x341b                        
  3414  AD9FFED0       JSR [0xfed0]                      
  3418  17CD65         LBSR 0x0180                       
LAB_M69_r4_24000__341b:
  341b  17CDD8         LBSR 0x01f6                       
  341e  FC7070         LDD 0x7070                        
  3421  3606           PSHU  B A                         
  3423  CCFFFF         LDD #0xffff                       
  3426  FD7070         STD 0x7070                        
  3429  17F8F9         LBSR 0x2d25                       
  342c  17F513         LBSR 0x2942                       
  342f  17F5CA         LBSR 0x29fc                       
  3432  17E536         LBSR 0x196b                       
  3435  3706           PULU  A B                         
  3437  FD7070         STD 0x7070                        
  343a  17E021         LBSR 0x145e                       
  343d  17E3F3         LBSR 0x1833                       
  3440  17F721         LBSR 0x2b64                       
  3443  17F7CC         LBSR 0x2c12                       
  3446  17F83B         LBSR 0x2c84                       
  3449  17CDF4         LBSR 0x0240                       
  344c  8601           LDA #0x1                          
  344e  B76105         STA 0x6105                        
  3451  CC005B         LDD #0x5b                         
  3454  FD6106         STD 0x6106                        
  3457  B6600A         LDA 0x600a                        
  345a  8169           CMPA #0x69                        
  345c  270F           BEQ 0x346d                        
  345e  816E           CMPA #0x6e                        
  3460  270B           BEQ 0x346d                        
  3462  816D           CMPA #0x6d                        
  3464  2707           BEQ 0x346d                        
  3466  CC0FA0         LDD #0xfa0                        
  3469  AD9FFD20       JSR [0xfd20]                      
LAB_M69_r4_24000__346d:
  346d  AD9FFE36       JSR [0xfe36]                      
  3471  AD9FFDF6       JSR [0xfdf6]                      
  3475  AD9FFE18       JSR [0xfe18]                      
  3479  17D847         LBSR 0x0cc3                       
  347c  AD9FFE10       JSR [0xfe10]                      
  3480  3577           PULS CC A B X Y U                 
  3482  39             RTS                               

;; Module 69 parameter/preset table "SWEPT COMBS", 191 bytes
MODULE_69_TABLE_SWEPT_COMBS_hdr:
  3483  690000C70000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_69_TABLE_SWEPT_COMBS:
  348b  69             ?? 69h    i                       
  348c  .db 01                                               ; .
  348d  535745505420.. ds "SWEPT COMBS    "              
  34a0  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  34b0  .db 00 00 00 00 00 00 00 64 00 0A 00 64 00 64 00 64  ; .......d...d.d.d
  34c0  .db 07 D0 27 10 00 00 00 00 00 00 00 00 00 00 00 00  ; ..'.............
  34d0  .db 00 00 00 64 00 64 00 32 00 64 B3 B7 BF BC B9 B8  ; ...d.d.2.d......
  34e0  .db 28 28 28 28 28 28 09 08 08 07 09 08 F5 0B F5 0B  ; ((((((..........
  34f0  .db F5 0B 28 28 28 28 28 28 64 64 64 64 64 64 00 50  ; ..((((((dddddd.P
  3500  .db 00 64 00 64 00 C8 00 00 00 00 02 02 02 02 02 32  ; .d.d...........2
  3510  .db 00                                               ; .
  3511  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  3538  .db 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13 88  ; ................
  3548  .db 13 88                                            ; ..

;; Module 69 code record 01, 170 bytes, entered at payload start
MODULE_69_01_CODE_hdr:
  354a  690100B20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_69_01_entry
MODULE_69_01_entry:
  3552  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $3556
  3556  3556           dw 3556h                          
LAB_M69_r4_24000__3558:
  3558  3477           PSHS  U Y X B A CC                
  355a  17CB13         LBSR 0x0070                       
  355d  17CACC         LBSR 0x002c                       
  3560  17CAAD         LBSR 0x0010                       
  3563  17EF31         LBSR 0x2497                       
  3566  8604           LDA #0x4                          
  3568  B760DA         STA 0x60da                        
  356b  AD9FFE38       JSR [0xfe38]                      
  356f  CC2C84         LDD #0x2c84                       
  3572  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  3576  6097           addr 6097                         
LAB_M69_r4_24000__3578:
  3578  CCFFFF         LDD #0xffff                       
  357b  FD7148         STD 0x7148                        
  357e  B6600A         LDA 0x600a                        
  3581  8169           CMPA #0x69                        
  3583  270F           BEQ 0x3594                        
  3585  816D           CMPA #0x6d                        
  3587  270B           BEQ 0x3594                        
  3589  816E           CMPA #0x6e                        
  358b  2707           BEQ 0x3594                        
  358d  AD9FFED0       JSR [0xfed0]                      
  3591  17CBEC         LBSR 0x0180                       
LAB_M69_r4_24000__3594:
  3594  FC7070         LDD 0x7070                        
  3597  3606           PSHU  B A                         
  3599  CCFFFF         LDD #0xffff                       
  359c  FD7070         STD 0x7070                        
  359f  17F80C         LBSR 0x2dae                       
  35a2  17DE01         LBSR 0x13a6                       
  35a5  17E3C3         LBSR 0x196b                       
  35a8  17E288         LBSR 0x1833                       
  35ab  17E07E         LBSR 0x162c                       
  35ae  17E194         LBSR 0x1745                       
  35b1  17DC96         LBSR 0x124a                       
  35b4  17DD4A         LBSR 0x1301                       
  35b7  17DEA4         LBSR 0x145e                       
  35ba  3706           PULU  A B                         
  35bc  FD7070         STD 0x7070                        
  35bf  17F6C2         LBSR 0x2c84                       
  35c2  17CF46         LBSR 0x050b                       
  35c5  8601           LDA #0x1                          
  35c7  B76105         STA 0x6105                        
  35ca  CC0087         LDD #0x87                         
  35cd  FD6106         STD 0x6106                        
  35d0  B6600A         LDA 0x600a                        
  35d3  8169           CMPA #0x69                        
  35d5  270F           BEQ 0x35e6                        
  35d7  816D           CMPA #0x6d                        
  35d9  270B           BEQ 0x35e6                        
  35db  816E           CMPA #0x6e                        
  35dd  2707           BEQ 0x35e6                        
  35df  CC0FA0         LDD #0xfa0                        
  35e2  AD9FFD20       JSR [0xfd20]                      
LAB_M69_r4_24000__35e6:
  35e6  AD9FFE36       JSR [0xfe36]                      
  35ea  AD9FFDF6       JSR [0xfdf6]                      
  35ee  AD9FFE18       JSR [0xfe18]                      
  35f2  17D4E1         LBSR 0x0ad6                       
  35f5  AD9FFE10       JSR [0xfe10]                      
  35f9  3577           PULS CC A B X Y U                 
  35fb  39             RTS                               

;; Module 6A parameter/preset table "SWEPT REVERB", 161 bytes
MODULE_6A_TABLE_SWEPT_REVERB_hdr:
  35fc  6A0000A90000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6A_TABLE_SWEPT_REVERB:
  3604  6A             ?? 6Ah    j                       
  3605  .db 01                                               ; .
  3606  535745505420.. ds "SWEPT REVERB   "              
  3618  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3628  .db 00 00 00 00 00 00 64 00 64 00 0A 00 64 00 64 00  ; ......d.d...d.d.
  3638  .db 64 07 D0 27 10 00 00 00 00 00 00 00 00 00 00 00  ; d..'............
  3648  .db 00 00 00 00 46 00 64 00 02 00 64 2D 33 39 3F 4F  ; ....F.d...d-39?O
  3658  .db 5B 28 28 28 28 28 28 09 08 07 0A 06 05 02 02 02  ; [((((((.........
  3668  .db 02 02 32 00                                      ; ..2.
  366c  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  3690  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 13 88 13  ; ................
  36a0  .db 88 13 88 13 88                                   ; .....

;; Module 6A code record 01, 148 bytes, entered at payload start
MODULE_6A_01_CODE_hdr:
  36a5  6A01009C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6A_01_entry
MODULE_6A_01_entry:
  36ad  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $36B1
  36b1  36B1           dw 36B1h                          
LAB_M69_r4_24000__36b3:
  36b3  3477           PSHS  U Y X B A CC                
  36b5  17C9B8         LBSR 0x0070                       
  36b8  17C971         LBSR 0x002c                       
  36bb  17C952         LBSR 0x0010                       
  36be  17EDD6         LBSR 0x2497                       
  36c1  8603           LDA #0x3                          
  36c3  B760DA         STA 0x60da                        
  36c6  AD9FFE38       JSR [0xfe38]                      
  36ca  CC2C84         LDD #0x2c84                       
  36cd  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  36d1  6097           addr 6097                         
LAB_M69_r4_24000__36d3:
  36d3  CCFFFF         LDD #0xffff                       
  36d6  FD7148         STD 0x7148                        
  36d9  B6600A         LDA 0x600a                        
  36dc  816A           CMPA #0x6a                        
  36de  2707           BEQ 0x36e7                        
  36e0  AD9FFED0       JSR [0xfed0]                      
  36e4  17CA5B         LBSR 0x0142                       
LAB_M69_r4_24000__36e7:
  36e7  FC7070         LDD 0x7070                        
  36ea  3606           PSHU  B A                         
  36ec  CCFFFF         LDD #0xffff                       
  36ef  FD7070         STD 0x7070                        
  36f2  17E276         LBSR 0x196b                       
  36f5  17F6B6         LBSR 0x2dae                       
  36f8  17DCAB         LBSR 0x13a6                       
  36fb  17DA5F         LBSR 0x115d                       
  36fe  17DD5D         LBSR 0x145e                       
  3701  17DB46         LBSR 0x124a                       
  3704  17DBFA         LBSR 0x1301                       
  3707  3706           PULU  A B                         
  3709  FD7070         STD 0x7070                        
  370c  17F575         LBSR 0x2c84                       
  370f  17D123         LBSR 0x0835                       
  3712  8601           LDA #0x1                          
  3714  B76105         STA 0x6105                        
  3717  CC0069         LDD #0x69                         
  371a  FD6106         STD 0x6106                        
  371d  B6600A         LDA 0x600a                        
  3720  816A           CMPA #0x6a                        
  3722  2707           BEQ 0x372b                        
  3724  CC0FA0         LDD #0xfa0                        
  3727  AD9FFD20       JSR [0xfd20]                      
LAB_M69_r4_24000__372b:
  372b  AD9FFE36       JSR [0xfe36]                      
  372f  AD9FFDF6       JSR [0xfdf6]                      
  3733  AD9FFE18       JSR [0xfe18]                      
  3737  17D2B7         LBSR 0x09f1                       
  373a  AD9FFE10       JSR [0xfe10]                      
  373e  3577           PULS CC A B X Y U                 
  3740  39             RTS                               

;; End of record chain
END_OF_CHAIN_hdr:
  3741  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3749  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3759  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3769  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3779  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3789  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3799  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37a9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37b9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37c9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37d9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37e9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37f9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3809  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3819  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3829  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3839  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3849  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3859  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3869  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3879  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3889  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3899  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38a9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38b9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38c9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38d9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38e9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38f9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3909  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3919  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3929  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3939  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3949  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3959  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3969  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3979  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3989  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3999  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39a9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39b9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39c9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39d9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39e9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39f9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a09  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a19  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a29  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a39  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a49  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a59  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a69  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a79  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a89  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a99  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aa9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ab9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ac9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ad9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ae9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3af9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b09  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b19  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b29  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b39  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b49  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b59  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b69  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b79  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b89  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b99  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ba9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bb9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bc9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bd9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3be9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bf9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c09  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c19  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c29  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c39  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c49  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c59  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c69  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c79  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c89  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c99  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ca9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cb9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cc9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cd9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ce9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cf9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d09  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d19  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d29  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d39  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d49  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d59  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d69  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d79  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d89  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d99  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3da9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3db9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dc9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dd9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3de9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3df9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e09  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e19  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e29  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e39  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e49  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e59  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e69  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e79  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e89  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e99  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ea9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eb9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ec9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ed9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ee9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f09  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f19  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f29  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f39  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f49  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f59  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f69  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f79  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f89  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f99  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe9  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff9  .db FF FF FF FF FF FF FF                             ; .......
