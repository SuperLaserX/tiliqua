; H3500  block M7A_r3_00000  M7A_r3_00000::0000-M7A_r3_00000::3fff
; Bank r3_00000 (module id 7A, sub 01)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 7A code record 01, 16072 bytes, entered at payload start
MODULE_7A_01_CODE_hdr:
  0008  7A013ED00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_7A_01_entry
MODULE_7A_01_entry:
  0010  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0014
  0014  0014           dw 14h                            
LAB_M7A_r3_00000__0016:
  0016  3477           PSHS  U Y X B A CC                
  0018  1702B5         LBSR 0x02d0                       
  001b  173D59         LBSR 0x3d77                       
  001e  17043E         LBSR 0x045f                       
  0021  C600           LDB #0x0                          
  0023  AD9FFC58       JSR [0xfc58]                      
  0027  8603           LDA #0x3                          
  0029  B760DA         STA 0x60da                        
  002c  AD9FFE38       JSR [0xfe38]                      
  0030  170151         LBSR 0x0184                       
  0033  FC70D8         LDD 0x70d8                        
  0036  2707           BEQ 0x003f                        
  0038  B6600A         LDA 0x600a                        
  003b  817A           CMPA #0x7a                        
  003d  2747           BEQ 0x0086                        
LAB_M7A_r3_00000__003f:
  003f  AD9FFED0       JSR [0xfed0]                      
  0043  8601           LDA #0x1                          
  0045  B771F2         STA 0x71f2                        
  0048  B771F9         STA 0x71f9                        
  004b  17015E         LBSR 0x01ac                       
  004e  2736           BEQ 0x0086                        
  0050  C600           LDB #0x0                          
  0052  AD9FFC36       JSR [0xfc36]                      
  0056  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  005a  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M7A_r3_00000__0083:
  0083  1600FB         LBRA 0x0181                       
LAB_M7A_r3_00000__0086:
  0086  173DA6         LBSR 0x3e2f                       
  0089  1703F1         LBSR 0x047d                       
  008c  FC70D8         LDD 0x70d8                        
  008f  2707           BEQ 0x0098                        
  0091  B6600A         LDA 0x600a                        
  0094  817A           CMPA #0x7a                        
  0096  2707           BEQ 0x009f                        
LAB_M7A_r3_00000__0098:
  0098  CC4E20         LDD #0x4e20                       
  009b  AD9FFD20       JSR [0xfd20]                      
LAB_M7A_r3_00000__009f:
  009f  AD9FFE36       JSR [0xfe36]                      
  00a3  AD9FFDF6       JSR [0xfdf6]                      
  00a7  AD9FFE18       JSR [0xfe18]                      
  00ab  170156         LBSR 0x0204                       
  00ae  171D6C         LBSR 0x1e1d                       
  00b1  171E27         LBSR 0x1edb                       
  00b4  FC7000         LDD 0x7000                        
  00b7  C100           CMPB #0x0                         
  00b9  274C           BEQ 0x0107                        
  00bb  C101           CMPB #0x1                         
  00bd  274D           BEQ 0x010c                        
  00bf  C102           CMPB #0x2                         
  00c1  274E           BEQ 0x0111                        
  00c3  C103           CMPB #0x3                         
  00c5  274F           BEQ 0x0116                        
  00c7  C104           CMPB #0x4                         
  00c9  2750           BEQ 0x011b                        
  00cb  C105           CMPB #0x5                         
  00cd  2751           BEQ 0x0120                        
  00cf  C106           CMPB #0x6                         
  00d1  2752           BEQ 0x0125                        
  00d3  C107           CMPB #0x7                         
  00d5  2753           BEQ 0x012a                        
  00d7  C108           CMPB #0x8                         
  00d9  2754           BEQ 0x012f                        
  00db  C109           CMPB #0x9                         
  00dd  2755           BEQ 0x0134                        
  00df  C10A           CMPB #0xa                         
  00e1  2756           BEQ 0x0139                        
  00e3  C10B           CMPB #0xb                         
  00e5  2757           BEQ 0x013e                        
  00e7  C10C           CMPB #0xc                         
  00e9  2758           BEQ 0x0143                        
  00eb  C10D           CMPB #0xd                         
  00ed  2759           BEQ 0x0148                        
  00ef  C10E           CMPB #0xe                         
  00f1  275A           BEQ 0x014d                        
  00f3  C10F           CMPB #0xf                         
  00f5  275B           BEQ 0x0152                        
  00f7  C110           CMPB #0x10                        
  00f9  275C           BEQ 0x0157                        
  00fb  C111           CMPB #0x11                        
  00fd  275D           BEQ 0x015c                        
  00ff  C112           CMPB #0x12                        
  0101  275E           BEQ 0x0161                        
  0103  C113           CMPB #0x13                        
  0105  275F           BEQ 0x0166                        
LAB_M7A_r3_00000__0107:
  0107  1708F6         LBSR 0x0a00                       
  010a  2071           BRA 0x017d                        
LAB_M7A_r3_00000__010c:
  010c  170930         LBSR 0x0a3f                       
  010f  205A           BRA 0x016b                        
LAB_M7A_r3_00000__0111:
  0111  17096A         LBSR 0x0a7e                       
  0114  2055           BRA 0x016b                        
LAB_M7A_r3_00000__0116:
  0116  1709A4         LBSR 0x0abd                       
  0119  2062           BRA 0x017d                        
LAB_M7A_r3_00000__011b:
  011b  1709DE         LBSR 0x0afc                       
  011e  205D           BRA 0x017d                        
LAB_M7A_r3_00000__0120:
  0120  170A18         LBSR 0x0b3b                       
  0123  2058           BRA 0x017d                        
LAB_M7A_r3_00000__0125:
  0125  170A3D         LBSR 0x0b65                       
  0128  2053           BRA 0x017d                        
LAB_M7A_r3_00000__012a:
  012a  170A77         LBSR 0x0ba4                       
  012d  204E           BRA 0x017d                        
LAB_M7A_r3_00000__012f:
  012f  170AB1         LBSR 0x0be3                       
  0132  2049           BRA 0x017d                        
LAB_M7A_r3_00000__0134:
  0134  170AE4         LBSR 0x0c1b                       
  0137  2044           BRA 0x017d                        
LAB_M7A_r3_00000__0139:
  0139  170B1E         LBSR 0x0c5a                       
  013c  203F           BRA 0x017d                        
LAB_M7A_r3_00000__013e:
  013e  170B58         LBSR 0x0c99                       
  0141  203A           BRA 0x017d                        
LAB_M7A_r3_00000__0143:
  0143  170B7D         LBSR 0x0cc3                       
  0146  2035           BRA 0x017d                        
LAB_M7A_r3_00000__0148:
  0148  170BB7         LBSR 0x0d02                       
  014b  2030           BRA 0x017d                        
LAB_M7A_r3_00000__014d:
  014d  170BF1         LBSR 0x0d41                       
  0150  202B           BRA 0x017d                        
LAB_M7A_r3_00000__0152:
  0152  170C24         LBSR 0x0d79                       
  0155  2026           BRA 0x017d                        
LAB_M7A_r3_00000__0157:
  0157  170C5E         LBSR 0x0db8                       
  015a  2021           BRA 0x017d                        
LAB_M7A_r3_00000__015c:
  015c  170C98         LBSR 0x0df7                       
  015f  201C           BRA 0x017d                        
LAB_M7A_r3_00000__0161:
  0161  170CCB         LBSR 0x0e2f                       
  0164  2017           BRA 0x017d                        
LAB_M7A_r3_00000__0166:
  0166  170D05         LBSR 0x0e6e                       
  0169  2012           BRA 0x017d                        
LAB_M7A_r3_00000__016b:
  016b  AD9FFDFC       JSR [0xfdfc]                      
  016f  C613           LDB #0x13                         
  0171  AD9FFC36       JSR [0xfc36]                      
  0175  C60A           LDB #0xa                          
  0177  AD9FFC2A       JSR [0xfc2a]                      
  017b  2004           BRA 0x0181                        
LAB_M7A_r3_00000__017d:
  017d  AD9FFE10       JSR [0xfe10]                      
LAB_M7A_r3_00000__0181:
  0181  3577           PULS CC A B X Y U                 
  0183  39             RTS                               

; ---- function FUN_M7A_r3_00000__0184
FUN_M7A_r3_00000__0184:
  0184  3476           PSHS  U Y X B A                   
  0186  1A40           ORCC #0x40                        
  0188  3440           PSHS  U                           
  018a  CC3D72         LDD #0x3d72                       
  018d  F3600D         ADDD 0x600d                       
  0190  1F01           TFR D,X                           
  0192  CC3D77         LDD #0x3d77                       
  0195  F3600D         ADDD 0x600d                       
  0198  1F03           TFR D,U                           
  019a  108E6600       LDY #0x6600                       
  019e  AD9FFD08       JSR [0xfd08]                      
  01a2  3540           PULS  U                           
  01a4  AD9FFD76       JSR [0xfd76]                      
  01a8  1CBF           ANDCC #0xbf                       
  01aa  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__01ac
FUN_M7A_r3_00000__01ac:
  01ac  3476           PSHS  U Y X B A                   
  01ae  C601           LDB #0x1                          
  01b0  8E7A10         LDX #0x7a10                       
  01b3  AD9FFD30       JSR [0xfd30]                      
  01b7  10260044       LBNE 0x01ff                       
  01bb  C602           LDB #0x2                          
  01bd  8E7A11         LDX #0x7a11                       
  01c0  AD9FFD30       JSR [0xfd30]                      
  01c4  10260037       LBNE 0x01ff                       
  01c8  C603           LDB #0x3                          
  01ca  8E7A12         LDX #0x7a12                       
  01cd  AD9FFD30       JSR [0xfd30]                      
  01d1  1026002A       LBNE 0x01ff                       
  01d5  CC0000         LDD #0x0                          
  01d8  AD9FFD3C       JSR [0xfd3c]                      
  01dc  AD9FFD40       JSR [0xfd40]                      
  01e0  AD9FFD44       JSR [0xfd44]                      
  01e4  CC000A         LDD #0xa                          
  01e7  AD9FFD20       JSR [0xfd20]                      
  01eb  108E0000       LDY #0x0                          
  01ef  FC70DE         LDD 0x70de                        
  01f2  AD9FFD2E       JSR [0xfd2e]                      
  01f6  AD9FFD7C       JSR [0xfd7c]                      
  01fa  CC0000         LDD #0x0                          
  01fd  2003           BRA 0x0202                        
LAB_M7A_r3_00000__01ff:
  01ff  CCFFFF         LDD #0xffff                       
LAB_M7A_r3_00000__0202:
  0202  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__0204
FUN_M7A_r3_00000__0204:
  0204  3476           PSHS  U Y X B A                   
  0206  AD9FFD3E       JSR [0xfd3e]                      
  020a  10830000       CMPD #0x0                         
  020e  2736           BEQ 0x0246                        
  0210  10830001       CMPD #0x1                         
  0214  275E           BEQ 0x0274                        
  0216  10830002       CMPD #0x2                         
  021a  10270083       LBEQ 0x02a1                       
  021e  C614           LDB #0x14                         
  0220  AD9FFC36       JSR [0xfc36]                      
  0224  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "MEMORY ERROR        "
  0228  4D454D4F5259.. char[21] "MEMORY ERROR        "   
LAB_M7A_r3_00000__023d:
  023d  CC0000         LDD #0x0                          
  0240  FD70DA         STD 0x70da                        
  0243  160088         LBRA 0x02ce                       
LAB_M7A_r3_00000__0246:
  0246  C614           LDB #0x14                         
  0248  AD9FFC36       JSR [0xfc36]                      
  024c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "NO SAMPLER          "
  0250  4E4F2053414D.. char[21] "NO SAMPLER          "   
LAB_M7A_r3_00000__0265:
  0265  CC0000         LDD #0x0                          
  0268  FD70DA         STD 0x70da                        
  026b  CC02BC         LDD #0x2bc                        
  026e  FD70DC         STD 0x70dc                        
  0271  16005A         LBRA 0x02ce                       
LAB_M7A_r3_00000__0274:
  0274  C614           LDB #0x14                         
  0276  AD9FFC36       JSR [0xfc36]                      
  027a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "HS322 BOARD, 23 SECS"
  027e  485333323220.. char[21] "HS322 BOARD, 23 SECS"   
LAB_M7A_r3_00000__0293:
  0293  CC0001         LDD #0x1                          
  0296  FD70DA         STD 0x70da                        
  0299  CC2AF8         LDD #0x2af8                       
  029c  FD70DC         STD 0x70dc                        
  029f  202D           BRA 0x02ce                        
LAB_M7A_r3_00000__02a1:
  02a1  C614           LDB #0x14                         
  02a3  AD9FFC36       JSR [0xfc36]                      
  02a7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "HS396 BOARD, 95 SECS"
  02ab  485333393620.. char[21] "HS396 BOARD, 95 SECS"   
LAB_M7A_r3_00000__02c0:
  02c0  CC0002         LDD #0x2                          
  02c3  FD70DA         STD 0x70da                        
  02c6  CC7D00         LDD #0x7d00                       
  02c9  FD70DC         STD 0x70dc                        
  02cc  2000           BRA 0x02ce                        
LAB_M7A_r3_00000__02ce:
  02ce  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__02d0
FUN_M7A_r3_00000__02d0:
  02d0  3476           PSHS  U Y X B A                   
  02d2  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:D0 1A:D2 1B:D4 1C:D6
  02d6  19             db 19h                            
  02d7  D0             db D0h                            
  02d8  1A             db 1Ah                            
  02d9  D2             db D2h                            
  02da  1B             db 1Bh                            
  02db  D4             db D4h                            
  02dc  1C             db 1Ch                            
  02dd  D6             db D6h                            
  02de  00             db 0h                             
LAB_M7A_r3_00000__02df:
  02df  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 61:0A 62:0C 79:3A 7A:3C
  02e3  61             db 61h                            
  02e4  0A             db Ah                             
  02e5  62             db 62h                            
  02e6  0C             db Ch                             
  02e7  79             db 79h                            
  02e8  3A             db 3Ah                            
  02e9  7A             db 7Ah                            
  02ea  3C             db 3Ch                            
  02eb  00             db 0h                             
LAB_M7A_r3_00000__02ec:
  02ec  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 6B:1E 6C:20 6D:22 6E:24
  02f0  6B             db 6Bh                            
  02f1  1E             db 1Eh                            
  02f2  6C             db 6Ch                            
  02f3  20             db 20h                            
  02f4  6D             db 6Dh                            
  02f5  22             db 22h                            
  02f6  6E             db 6Eh                            
  02f7  24             db 24h                            
  02f8  00             db 0h                             
LAB_M7A_r3_00000__02f9:
  02f9  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 6F:26 70:28 71:2A 72:2C
  02fd  6F             db 6Fh                            
  02fe  26             db 26h                            
  02ff  70             db 70h                            
  0300  28             db 28h                            
  0301  71             db 71h                            
  0302  2A             db 2Ah                            
  0303  72             db 72h                            
  0304  2C             db 2Ch                            
  0305  00             db 0h                             
LAB_M7A_r3_00000__0306:
  0306  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 63:0E 64:10 65:12 66:14
  030a  63             db 63h                            
  030b  0E             db Eh                             
  030c  64             db 64h                            
  030d  10             db 10h                            
  030e  65             db 65h                            
  030f  12             db 12h                            
  0310  66             db 66h                            
  0311  14             db 14h                            
  0312  00             db 0h                             
LAB_M7A_r3_00000__0313:
  0313  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 67:16 68:18 69:1A 6A:1C
  0317  67             db 67h                            
  0318  16             db 16h                            
  0319  68             db 68h                            
  031a  18             db 18h                            
  031b  69             db 69h                            
  031c  1A             db 1Ah                            
  031d  6A             db 6Ah                            
  031e  1C             db 1Ch                            
  031f  00             db 0h                             
LAB_M7A_r3_00000__0320:
  0320  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 77:36 78:38 7B:3E 7C:40
  0324  77             db 77h                            
  0325  36             db 36h                            
  0326  78             db 78h                            
  0327  38             db 38h                            
  0328  7B             db 7Bh                            
  0329  3E             db 3Eh                            
  032a  7C             db 7Ch                            
  032b  40             db 40h                            
  032c  00             db 0h                             
LAB_M7A_r3_00000__032d:
  032d  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 73:2E 74:30 75:32 76:34
  0331  73             db 73h                            
  0332  2E             db 2Eh                            
  0333  74             db 74h                            
  0334  30             db 30h                            
  0335  75             db 75h                            
  0336  32             db 32h                            
  0337  76             db 76h                            
  0338  34             db 34h                            
  0339  00             db 0h                             
LAB_M7A_r3_00000__033a:
  033a  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9B:60 9D:62 FD:A0 FF:A2
  033e  9B             db 9Bh                            
  033f  60             db 60h                            
  0340  9D             db 9Dh                            
  0341  62             db 62h                            
  0342  FD             db FDh                            
  0343  A0             db A0h                            
  0344  FF             db FFh                            
  0345  A2             db A2h                            
  0346  00             db 0h                             
LAB_M7A_r3_00000__0347:
  0347  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9F:74 A1:76 7F:CA 81:CE
  034b  9F             db 9Fh                            
  034c  74             db 74h                            
  034d  A1             db A1h                            
  034e  76             db 76h                            
  034f  7F             db 7Fh                            
  0350  CA             db CAh                            
  0351  81             db 81h                            
  0352  CE             db CEh                            
  0353  00             db 0h                             
LAB_M7A_r3_00000__0354:
  0354  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: B1:78 87:7A B3:7C 89:7E
  0358  B1             db B1h                            
  0359  78             db 78h                            
  035a  87             db 87h                            
  035b  7A             db 7Ah                            
  035c  B3             db B3h                            
  035d  7C             db 7Ch                            
  035e  89             db 89h                            
  035f  7E             db 7Eh                            
  0360  00             db 0h                             
LAB_M7A_r3_00000__0361:
  0361  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: B5:8C B7:8E B9:88 BB:8A
  0365  B5             db B5h                            
  0366  8C             db 8Ch                            
  0367  B7             db B7h                            
  0368  8E             db 8Eh                            
  0369  B9             db B9h                            
  036a  88             db 88h                            
  036b  BB             db BBh                            
  036c  8A             db 8Ah                            
  036d  00             db 0h                             
LAB_M7A_r3_00000__036e:
  036e  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A3:6C 97:6E A5:70 99:72 A7:64 A9:66 AB:4C AD:4E
  0372  A3             db A3h                            
  0373  6C             db 6Ch                            
  0374  97             db 97h                            
  0375  6E             db 6Eh                            
  0376  A5             db A5h                            
  0377  70             db 70h                            
  0378  99             db 99h                            
  0379  72             db 72h                            
  037a  A7             db A7h                            
  037b  64             db 64h                            
  037c  A9             db A9h                            
  037d  66             db 66h                            
  037e  AB             db ABh                            
  037f  4C             db 4Ch                            
  0380  AD             db ADh                            
  0381  4E             db 4Eh                            
  0382  00             db 0h                             
LAB_M7A_r3_00000__0383:
  0383  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 83:B2 85:B6 8B:BA 8D:BE 8F:C2 91:C6 93:44 95:48
  0387  83             db 83h                            
  0388  B2             db B2h                            
  0389  85             db 85h                            
  038a  B6             db B6h                            
  038b  8B             db 8Bh                            
  038c  BA             db BAh                            
  038d  8D             db 8Dh                            
  038e  BE             db BEh                            
  038f  8F             db 8Fh                            
  0390  C2             db C2h                            
  0391  91             db 91h                            
  0392  C6             db C6h                            
  0393  93             db 93h                            
  0394  44             db 44h                            
  0395  95             db 95h                            
  0396  48             db 48h                            
  0397  00             db 0h                             
LAB_M7A_r3_00000__0398:
  0398  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: AF:84 B0:86
  039c  AF             db AFh                            
  039d  84             db 84h                            
  039e  B0             db B0h                            
  039f  86             db 86h                            
  03a0  00             db 0h                             
LAB_M7A_r3_00000__03a1:
  03a1  CC3FED         LDD #0x3fed                       
  03a4  833ED8         SUBD #0x3ed8                      
  03a7  1F01           TFR D,X                           
  03a9  AD9FFC7C       JSR [0xfc7c]                      
  03ad  1D             SEX                               
  03ae  FD7058         STD 0x7058                        
  03b1  CC3FEE         LDD #0x3fee                       
  03b4  833ED8         SUBD #0x3ed8                      
  03b7  1F01           TFR D,X                           
  03b9  AD9FFC7C       JSR [0xfc7c]                      
  03bd  1D             SEX                               
  03be  FD705A         STD 0x705a                        
  03c1  CC3FF0         LDD #0x3ff0                       
  03c4  833ED8         SUBD #0x3ed8                      
  03c7  1F01           TFR D,X                           
  03c9  AD9FFC7C       JSR [0xfc7c]                      
  03cd  1D             SEX                               
  03ce  FD704A         STD 0x704a                        
  03d1  CC3FEF         LDD #0x3fef                       
  03d4  833ED8         SUBD #0x3ed8                      
  03d7  1F01           TFR D,X                           
  03d9  AD9FFC7C       JSR [0xfc7c]                      
  03dd  1D             SEX                               
  03de  FD70D8         STD 0x70d8                        
  03e1  170059         LBSR 0x043d                        ; inline[at:M7A_r3_00000::043D]: 45:00 11:80 13:82 01:A4 03:A6
  03e4  45             db 45h                            
  03e5  00             db 0h                             
  03e6  11             db 11h                            
  03e7  80             db 80h                            
  03e8  13             db 13h                            
  03e9  82             db 82h                            
  03ea  01             db 1h                             
  03eb  A4             db A4h                            
  03ec  03             db 3h                             
  03ed  A6             db A6h                            
  03ee  00             db 0h                             
LAB_M7A_r3_00000__03ef:
  03ef  17004B         LBSR 0x043d                        ; inline[at:M7A_r3_00000::043D]: 1D:A8 1F:AC 21:B0 23:B4 25:B8 27:BC 29:C0 2B:C4
  03f2  1D             db 1Dh                            
  03f3  A8             db A8h                            
  03f4  1F             db 1Fh                            
  03f5  AC             db ACh                            
  03f6  21             db 21h                            
  03f7  B0             db B0h                            
  03f8  23             db 23h                            
  03f9  B4             db B4h                            
  03fa  25             db 25h                            
  03fb  B8             db B8h                            
  03fc  27             db 27h                            
  03fd  BC             db BCh                            
  03fe  29             db 29h                            
  03ff  C0             db C0h                            
  0400  2B             db 2Bh                            
  0401  C4             db C4h                            
  0402  00             db 0h                             
LAB_M7A_r3_00000__0403:
  0403  170037         LBSR 0x043d                        ; inline[at:M7A_r3_00000::043D]: 05:50 07:52 09:54 0B:56 0D:5C 0F:5E
  0406  05             db 5h                             
  0407  50             db 50h                            
  0408  07             db 7h                             
  0409  52             db 52h                            
  040a  09             db 9h                             
  040b  54             db 54h                            
  040c  0B             db Bh                             
  040d  56             db 56h                            
  040e  0D             db Dh                             
  040f  5C             db 5Ch                            
  0410  0F             db Fh                             
  0411  5E             db 5Eh                            
  0412  00             db 0h                             
LAB_M7A_r3_00000__0413:
  0413  170027         LBSR 0x043d                        ; inline[at:M7A_r3_00000::043D]: 19:42 1B:46 47:C8 49:CC 3D:AA 3F:AE 41:68 43:6A
  0416  19             db 19h                            
  0417  42             db 42h                            
  0418  1B             db 1Bh                            
  0419  46             db 46h                            
  041a  47             db 47h                            
  041b  C8             db C8h                            
  041c  49             db 49h                            
  041d  CC             db CCh                            
  041e  3D             db 3Dh                            
  041f  AA             db AAh                            
  0420  3F             db 3Fh                            
  0421  AE             db AEh                            
  0422  41             db 41h                            
  0423  68             db 68h                            
  0424  43             db 43h                            
  0425  6A             db 6Ah                            
  0426  00             db 0h                             
LAB_M7A_r3_00000__0427:
  0427  170013         LBSR 0x043d                        ; inline[at:M7A_r3_00000::043D]: 2D:90 2F:92 31:94 33:96 35:98 37:9A 39:9C 3B:9E
  042a  2D             db 2Dh                            
  042b  90             db 90h                            
  042c  2F             db 2Fh                            
  042d  92             db 92h                            
  042e  31             db 31h                            
  042f  94             db 94h                            
  0430  33             db 33h                            
  0431  96             db 96h                            
  0432  35             db 35h                            
  0433  98             db 98h                            
  0434  37             db 37h                            
  0435  9A             db 9Ah                            
  0436  39             db 39h                            
  0437  9C             db 9Ch                            
  0438  3B             db 3Bh                            
  0439  9E             db 9Eh                            
  043a  00             db 0h                             
LAB_M7A_r3_00000__043b:
  043b  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__043d
FUN_M7A_r3_00000__043d:
  043d  3476           PSHS  U Y X B A                   
  043f  EE68           LDU 0x8,S                         
LAB_M7A_r3_00000__0441:
  0441  E6C0           LDB ,U+                           
  0443  2716           BEQ 0x045b                        
  0445  4F             CLRA                              
  0446  C30100         ADDD #0x100                       
  0449  1F01           TFR D,X                           
  044b  E6C0           LDB ,U+                           
  044d  4F             CLRA                              
  044e  C37000         ADDD #0x7000                      
  0451  1F02           TFR D,Y                           
  0453  AD9FFC7E       JSR [0xfc7e]                      
  0457  EDA4           STD ,Y                            
  0459  20E6           BRA 0x0441                        
LAB_M7A_r3_00000__045b:
  045b  EF68           STU 0x8,S                         
  045d  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__045f
FUN_M7A_r3_00000__045f:
  045f  3476           PSHS  U Y X B A                   
  0461  CC0000         LDD #0x0                          
  0464  AD9FFC6C       JSR [0xfc6c]                      
  0468  AD9FFC74       JSR [0xfc74]                      
  046c  173709         LBSR 0x3b78                       
  046f  173780         LBSR 0x3bf2                       
  0472  1737F7         LBSR 0x3c6c                       
  0475  17386E         LBSR 0x3ce6                       
  0478  1710D1         LBSR 0x154c                       
  047b  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__047d
FUN_M7A_r3_00000__047d:
  047d  3476           PSHS  U Y X B A                   
  047f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "modknob1" 21 $12F1 $12FD
  0483  00             db 0h                             
  0484  80             db 80h                            
  0485  6D6F646B6E6F.. ds "modknob1"                     
  048d  21             db 21h                            
  048e  12F1           addr M7A_r3_00000::12f1           
  0490  12FD           addr M7A_r3_00000::12fd           
LAB_M7A_r3_00000__0492:
  0492  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "modknob2" 25 $1414 $1420
  0496  01             db 1h                             
  0497  80             db 80h                            
  0498  6D6F646B6E6F.. ds "modknob2"                     
  04a0  25             db 25h                            
  04a1  1414           addr M7A_r3_00000::1414           
  04a3  1420           addr M7A_r3_00000::1420           
LAB_M7A_r3_00000__04a5:
  04a5  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "dly1loop" 29 $220B $2217
  04a9  02             db 2h                             
  04aa  80             db 80h                            
  04ab  646C79316C6F.. ds "dly1loop"                     
  04b3  29             db 29h                            
  04b4  220B           addr M7A_r3_00000::220b           
  04b6  2217           addr M7A_r3_00000::2217           
LAB_M7A_r3_00000__04b8:
  04b8  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "dly2loop" 2D $22D6 $22E2
  04bc  03             db 3h                             
  04bd  80             db 80h                            
  04be  646C79326C6F.. ds "dly2loop"                     
  04c6  2D             db 2Dh                            
  04c7  22D6           addr M7A_r3_00000::22d6           
  04c9  22E2           addr M7A_r3_00000::22e2           
LAB_M7A_r3_00000__04cb:
  04cb  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "lfo1 frq" 31 $2505 $2511
  04cf  04             db 4h                             
  04d0  80             db 80h                            
  04d1  6C666F312066.. ds "lfo1 frq"                     
  04d9  31             db 31h                            
  04da  2505           addr M7A_r3_00000::2505           
  04dc  2511           addr M7A_r3_00000::2511           
LAB_M7A_r3_00000__04de:
  04de  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 05 80 "  bpm   " 35 $15F1 $0EFC
  04e2  05             db 5h                             
  04e3  80             db 80h                            
  04e4  202062706D20.. ds "  bpm   "                     
  04ec  35             db 35h                            
  04ed  15F1           addr M7A_r3_00000::15f1           
  04ef  0EFC           addr M7A_r3_00000::0efc           
LAB_M7A_r3_00000__04f1:
  04f1  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "mscale 1" 39 $3A17 $3A23
  04f5  06             db 6h                             
  04f6  80             db 80h                            
  04f7  6D7363616C65.. ds "mscale 1"                     
  04ff  39             db 39h                            
  0500  3A17           addr M7A_r3_00000::3a17           
  0502  3A23           addr M7A_r3_00000::3a23           
LAB_M7A_r3_00000__0504:
  0504  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "mscale 2" 3D $3ABD $3AC9
  0508  07             db 7h                             
  0509  80             db 80h                            
  050a  6D7363616C65.. ds "mscale 2"                     
  0512  3D             db 3Dh                            
  0513  3ABD           addr M7A_r3_00000::3abd           
  0515  3AC9           addr M7A_r3_00000::3ac9           
LAB_M7A_r3_00000__0517:
  0517  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 "mix 1a  " 41 $34E7 $34F3
  051b  08             db 8h                             
  051c  80             db 80h                            
  051d  6D6978203161.. ds "mix 1a  "                     
  0525  41             db 41h                            
  0526  34E7           addr M7A_r3_00000::34e7           
  0528  34F3           addr M7A_r3_00000::34f3           
LAB_M7A_r3_00000__052a:
  052a  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 "mix 1b  " 45 $358D $3599
  052e  09             db 9h                             
  052f  80             db 80h                            
  0530  6D6978203162.. ds "mix 1b  "                     
  0538  45             db 45h                            
  0539  358D           addr M7A_r3_00000::358d           
  053b  3599           addr M7A_r3_00000::3599           
LAB_M7A_r3_00000__053d:
  053d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "mix 2a  " 49 $3633 $363F
  0541  0A             db Ah                             
  0542  80             db 80h                            
  0543  6D6978203261.. ds "mix 2a  "                     
  054b  49             db 49h                            
  054c  3633           addr M7A_r3_00000::3633           
  054e  363F           addr M7A_r3_00000::363f           
LAB_M7A_r3_00000__0550:
  0550  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 "mix 2b  " 4D $36D9 $36E5
  0554  0B             db Bh                             
  0555  80             db 80h                            
  0556  6D6978203262.. ds "mix 2b  "                     
  055e  4D             db 4Dh                            
  055f  36D9           addr M7A_r3_00000::36d9           
  0561  36E5           addr M7A_r3_00000::36e5           
LAB_M7A_r3_00000__0563:
  0563  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0C 80 "mix 3a  " 51 $377F $378B
  0567  0C             db Ch                             
  0568  80             db 80h                            
  0569  6D6978203361.. ds "mix 3a  "                     
  0571  51             db 51h                            
  0572  377F           addr M7A_r3_00000::377f           
  0574  378B           addr M7A_r3_00000::378b           
LAB_M7A_r3_00000__0576:
  0576  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0D 80 "mix 3b  " 55 $3825 $3831
  057a  0D             db Dh                             
  057b  80             db 80h                            
  057c  6D6978203362.. ds "mix 3b  "                     
  0584  55             db 55h                            
  0585  3825           addr M7A_r3_00000::3825           
  0587  3831           addr M7A_r3_00000::3831           
LAB_M7A_r3_00000__0589:
  0589  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0E 80 "mix 4a  " 59 $38CB $38D7
  058d  0E             db Eh                             
  058e  80             db 80h                            
  058f  6D6978203461.. ds "mix 4a  "                     
  0597  59             db 59h                            
  0598  38CB           addr M7A_r3_00000::38cb           
  059a  38D7           addr M7A_r3_00000::38d7           
LAB_M7A_r3_00000__059c:
  059c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0F 80 "mix 4b  " 5D $3971 $397D
  05a0  0F             db Fh                             
  05a1  80             db 80h                            
  05a2  6D6978203462.. ds "mix 4b  "                     
  05aa  5D             db 5Dh                            
  05ab  3971           addr M7A_r3_00000::3971           
  05ad  397D           addr M7A_r3_00000::397d           
LAB_M7A_r3_00000__05af:
  05af  CC05CA         LDD #0x5ca                        
  05b2  FD60F5         STD 0x60f5                        
  05b5  CC00B2         LDD #0xb2                         
  05b8  47             ASRA                              
  05b9  56             RORB                              
  05ba  FD60F7         STD 0x60f7                        
  05bd  8601           LDA #0x1                          
  05bf  B76105         STA 0x6105                        
  05c2  CC00BD         LDD #0xbd                         
  05c5  FD6106         STD 0x6106                        
  05c8  35F6           PULS  A B X Y U PC                
  05ca  067C06820688.. addr[28]                          
  0602  .db 07 24 07 25 07 31 07 3C 07 47 07 52 07 59 07 64  ; .$.%.1.<.G.R.Y.d
  0612  .db 07 6F 07 7A 07 85 07 90 07 9B 07 A6 07 B1 07 BC  ; .o.z............
  0622  .db 07 C7 07 D2 07 DD 07 E8 07 F3 07 FE 08 09 08 14  ; ................
  0632  .db 08 1F 08 2A 08 35 08 40 08 4B 08 56 08 61 08 6C  ; ...*.5.@.K.V.a.l
  0642  .db 08 77 08 82 08 8D 08 98 08 A3 08 AE 08 B9 08 C4  ; .w..............
  0652  .db 08 CF 08 DA 08 E5 08 F0 08 FB 09 06 09 11 09 1C  ; ................
  0662  .db 09 27 09 32 09 3D 09 48 09 53 09 5E 09 69 09 74  ; .'.2.=.H.S.^.i.t
  0672  .db 09 7F 09 8A 09 95 09 A0 09 AB                    ; ..........

; ---- function FUN_M7A_r3_00000__067c
FUN_M7A_r3_00000__067c:
  067c  CC0000         LDD #0x0                          
  067f  1600A4         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0682
FUN_M7A_r3_00000__0682:
  0682  CC0001         LDD #0x1                          
  0685  16009E         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0688
FUN_M7A_r3_00000__0688:
  0688  CC0002         LDD #0x2                          
  068b  160098         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__068e
FUN_M7A_r3_00000__068e:
  068e  CC0003         LDD #0x3                          
  0691  160092         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0694
FUN_M7A_r3_00000__0694:
  0694  CC0004         LDD #0x4                          
  0697  16008C         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__069a
FUN_M7A_r3_00000__069a:
  069a  CC0005         LDD #0x5                          
  069d  160086         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06a0
FUN_M7A_r3_00000__06a0:
  06a0  CC0006         LDD #0x6                          
  06a3  160080         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06a6
FUN_M7A_r3_00000__06a6:
  06a6  CC0007         LDD #0x7                          
  06a9  16007A         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06ac
FUN_M7A_r3_00000__06ac:
  06ac  CC0008         LDD #0x8                          
  06af  160074         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06b2
FUN_M7A_r3_00000__06b2:
  06b2  CC0009         LDD #0x9                          
  06b5  16006E         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06b8
FUN_M7A_r3_00000__06b8:
  06b8  CC000A         LDD #0xa                          
  06bb  160068         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06be
FUN_M7A_r3_00000__06be:
  06be  CC000B         LDD #0xb                          
  06c1  160062         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06c4
FUN_M7A_r3_00000__06c4:
  06c4  CC000C         LDD #0xc                          
  06c7  16005C         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06ca
FUN_M7A_r3_00000__06ca:
  06ca  CC000D         LDD #0xd                          
  06cd  160056         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06d0
FUN_M7A_r3_00000__06d0:
  06d0  CC000E         LDD #0xe                          
  06d3  160050         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06d6
FUN_M7A_r3_00000__06d6:
  06d6  CC000F         LDD #0xf                          
  06d9  16004A         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06dc
FUN_M7A_r3_00000__06dc:
  06dc  CC0010         LDD #0x10                         
  06df  160044         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06e2
FUN_M7A_r3_00000__06e2:
  06e2  CC0011         LDD #0x11                         
  06e5  16003E         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06e8
FUN_M7A_r3_00000__06e8:
  06e8  CC0012         LDD #0x12                         
  06eb  160038         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06ee
FUN_M7A_r3_00000__06ee:
  06ee  CC0013         LDD #0x13                         
  06f1  160032         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06f4
FUN_M7A_r3_00000__06f4:
  06f4  CC0014         LDD #0x14                         
  06f7  16002C         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__06fa
FUN_M7A_r3_00000__06fa:
  06fa  CC0015         LDD #0x15                         
  06fd  160026         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0700
FUN_M7A_r3_00000__0700:
  0700  CC0016         LDD #0x16                         
  0703  160020         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0706
FUN_M7A_r3_00000__0706:
  0706  CC0017         LDD #0x17                         
  0709  16001A         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__070c
FUN_M7A_r3_00000__070c:
  070c  CC0018         LDD #0x18                         
  070f  160014         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0712
FUN_M7A_r3_00000__0712:
  0712  CC0019         LDD #0x19                         
  0715  16000E         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__0718
FUN_M7A_r3_00000__0718:
  0718  CC001A         LDD #0x1a                         
  071b  160008         LBRA 0x0726                       

; ---- function FUN_M7A_r3_00000__071e
FUN_M7A_r3_00000__071e:
  071e  CC001B         LDD #0x1b                         
  0721  160002         LBRA 0x0726                       
  0724  .db 39 39                                            ; 99

; ---- function FUN_M7A_r3_00000__0726
FUN_M7A_r3_00000__0726:
  0726  170851         LBSR 0x0f7a                       
  0729  17028F         LBSR 0x09bb                       
  072c  AD9FFE12       JSR [0xfe12]                      
  0730  39             RTS                               

; ---- function FUN_M7A_r3_00000__0731
FUN_M7A_r3_00000__0731:
  0731  170B99         LBSR 0x12cd                       
  0734  1702C9         LBSR 0x0a00                       
  0737  AD9FFE14       JSR [0xfe14]                      
  073b  39             RTS                               

; ---- function FUN_M7A_r3_00000__073c
FUN_M7A_r3_00000__073c:
  073c  170CB1         LBSR 0x13f0                       
  073f  1702BE         LBSR 0x0a00                       
  0742  AD9FFE16       JSR [0xfe16]                      
  0746  39             RTS                               

; ---- function FUN_M7A_r3_00000__0747
FUN_M7A_r3_00000__0747:
  0747  170DC9         LBSR 0x1513                       
  074a  1702B3         LBSR 0x0a00                       
  074d  AD9FFE12       JSR [0xfe12]                      
  0751  39             RTS                               

; ---- function FUN_M7A_r3_00000__0752
FUN_M7A_r3_00000__0752:
  0752  170E6C         LBSR 0x15c1                       
  0755  1702A8         LBSR 0x0a00                       
  0758  39             RTS                               

; ---- function FUN_M7A_r3_00000__0759
FUN_M7A_r3_00000__0759:
  0759  171118         LBSR 0x1874                       
  075c  17035E         LBSR 0x0abd                       
  075f  AD9FFE10       JSR [0xfe10]                      
  0763  39             RTS                               

; ---- function FUN_M7A_r3_00000__0764
FUN_M7A_r3_00000__0764:
  0764  1711C4         LBSR 0x192b                       
  0767  170392         LBSR 0x0afc                       
  076a  AD9FFE10       JSR [0xfe10]                      
  076e  39             RTS                               

; ---- function FUN_M7A_r3_00000__076f
FUN_M7A_r3_00000__076f:
  076f  171270         LBSR 0x19e2                       
  0772  170348         LBSR 0x0abd                       
  0775  AD9FFE12       JSR [0xfe12]                      
  0779  39             RTS                               

; ---- function FUN_M7A_r3_00000__077a
FUN_M7A_r3_00000__077a:
  077a  171311         LBSR 0x1a8e                       
  077d  17037C         LBSR 0x0afc                       
  0780  AD9FFE12       JSR [0xfe12]                      
  0784  39             RTS                               

; ---- function FUN_M7A_r3_00000__0785
FUN_M7A_r3_00000__0785:
  0785  1713B2         LBSR 0x1b3a                       
  0788  170332         LBSR 0x0abd                       
  078b  AD9FFE16       JSR [0xfe16]                      
  078f  39             RTS                               

; ---- function FUN_M7A_r3_00000__0790
FUN_M7A_r3_00000__0790:
  0790  17142F         LBSR 0x1bc2                       
  0793  170366         LBSR 0x0afc                       
  0796  AD9FFE16       JSR [0xfe16]                      
  079a  39             RTS                               

; ---- function FUN_M7A_r3_00000__079b
FUN_M7A_r3_00000__079b:
  079b  1714C7         LBSR 0x1c65                       
  079e  17031C         LBSR 0x0abd                       
  07a1  AD9FFE14       JSR [0xfe14]                      
  07a5  39             RTS                               

; ---- function FUN_M7A_r3_00000__07a6
FUN_M7A_r3_00000__07a6:
  07a6  171573         LBSR 0x1d1c                       
  07a9  170350         LBSR 0x0afc                       
  07ac  AD9FFE14       JSR [0xfe14]                      
  07b0  39             RTS                               

; ---- function FUN_M7A_r3_00000__07b1
FUN_M7A_r3_00000__07b1:
  07b1  17161F         LBSR 0x1dd3                       
  07b4  17050C         LBSR 0x0cc3                       
  07b7  AD9FFE10       JSR [0xfe10]                      
  07bb  39             RTS                               

; ---- function FUN_M7A_r3_00000__07bc
FUN_M7A_r3_00000__07bc:
  07bc  1716D2         LBSR 0x1e91                       
  07bf  170501         LBSR 0x0cc3                       
  07c2  AD9FFE14       JSR [0xfe14]                      
  07c6  39             RTS                               

; ---- function FUN_M7A_r3_00000__07c7
FUN_M7A_r3_00000__07c7:
  07c7  171785         LBSR 0x1f4f                       
  07ca  1704F6         LBSR 0x0cc3                       
  07cd  AD9FFE12       JSR [0xfe12]                      
  07d1  39             RTS                               

; ---- function FUN_M7A_r3_00000__07d2
FUN_M7A_r3_00000__07d2:
  07d2  171821         LBSR 0x1ff6                       
  07d5  1704EB         LBSR 0x0cc3                       
  07d8  AD9FFE16       JSR [0xfe16]                      
  07dc  39             RTS                               

; ---- function FUN_M7A_r3_00000__07dd
FUN_M7A_r3_00000__07dd:
  07dd  1718BD         LBSR 0x209d                       
  07e0  17051F         LBSR 0x0d02                       
  07e3  AD9FFE10       JSR [0xfe10]                      
  07e7  39             RTS                               

; ---- function FUN_M7A_r3_00000__07e8
FUN_M7A_r3_00000__07e8:
  07e8  171957         LBSR 0x2142                       
  07eb  170514         LBSR 0x0d02                       
  07ee  AD9FFE14       JSR [0xfe14]                      
  07f2  39             RTS                               

; ---- function FUN_M7A_r3_00000__07f3
FUN_M7A_r3_00000__07f3:
  07f3  1719F1         LBSR 0x21e7                       
  07f6  170548         LBSR 0x0d41                       
  07f9  AD9FFE10       JSR [0xfe10]                      
  07fd  39             RTS                               

; ---- function FUN_M7A_r3_00000__07fe
FUN_M7A_r3_00000__07fe:
  07fe  171AB1         LBSR 0x22b2                       
  0801  17053D         LBSR 0x0d41                       
  0804  AD9FFE12       JSR [0xfe12]                      
  0808  39             RTS                               

; ---- function FUN_M7A_r3_00000__0809
FUN_M7A_r3_00000__0809:
  0809  171B65         LBSR 0x2371                       
  080c  1704F3         LBSR 0x0d02                       
  080f  AD9FFE12       JSR [0xfe12]                      
  0813  39             RTS                               

; ---- function FUN_M7A_r3_00000__0814
FUN_M7A_r3_00000__0814:
  0814  171C12         LBSR 0x2429                       
  0817  1704E8         LBSR 0x0d02                       
  081a  AD9FFE16       JSR [0xfe16]                      
  081e  39             RTS                               

; ---- function FUN_M7A_r3_00000__081f
FUN_M7A_r3_00000__081f:
  081f  171CBF         LBSR 0x24e1                       
  0822  170554         LBSR 0x0d79                       
  0825  AD9FFE10       JSR [0xfe10]                      
  0829  39             RTS                               

; ---- function FUN_M7A_r3_00000__082a
FUN_M7A_r3_00000__082a:
  082a  171D75         LBSR 0x25a2                       
  082d  170549         LBSR 0x0d79                       
  0830  AD9FFE14       JSR [0xfe14]                      
  0834  39             RTS                               

; ---- function FUN_M7A_r3_00000__0835
FUN_M7A_r3_00000__0835:
  0835  171E2B         LBSR 0x2663                       
  0838  17053E         LBSR 0x0d79                       
  083b  AD9FFE12       JSR [0xfe12]                      
  083f  39             RTS                               

; ---- function FUN_M7A_r3_00000__0840
FUN_M7A_r3_00000__0840:
  0840  171EBF         LBSR 0x2702                       
  0843  170533         LBSR 0x0d79                       
  0846  AD9FFE16       JSR [0xfe16]                      
  084a  39             RTS                               

; ---- function FUN_M7A_r3_00000__084b
FUN_M7A_r3_00000__084b:
  084b  171F53         LBSR 0x27a1                       
  084e  170567         LBSR 0x0db8                       
  0851  AD9FFE12       JSR [0xfe12]                      
  0855  39             RTS                               

; ---- function FUN_M7A_r3_00000__0856
FUN_M7A_r3_00000__0856:
  0856  17203A         LBSR 0x2893                       
  0859  17055C         LBSR 0x0db8                       
  085c  AD9FFE16       JSR [0xfe16]                      
  0860  39             RTS                               

; ---- function FUN_M7A_r3_00000__0861
FUN_M7A_r3_00000__0861:
  0861  1721A3         LBSR 0x2a07                       
  0864  170590         LBSR 0x0df7                       
  0867  AD9FFE10       JSR [0xfe10]                      
  086b  39             RTS                               

; ---- function FUN_M7A_r3_00000__086c
FUN_M7A_r3_00000__086c:
  086c  17222F         LBSR 0x2a9e                       
  086f  170585         LBSR 0x0df7                       
  0872  AD9FFE12       JSR [0xfe12]                      
  0876  39             RTS                               

; ---- function FUN_M7A_r3_00000__0877
FUN_M7A_r3_00000__0877:
  0877  17230F         LBSR 0x2b89                       
  087a  17053B         LBSR 0x0db8                       
  087d  AD9FFE10       JSR [0xfe10]                      
  0881  39             RTS                               

; ---- function FUN_M7A_r3_00000__0882
FUN_M7A_r3_00000__0882:
  0882  172397         LBSR 0x2c1c                       
  0885  170530         LBSR 0x0db8                       
  0888  AD9FFE14       JSR [0xfe14]                      
  088c  39             RTS                               

; ---- function FUN_M7A_r3_00000__088d
FUN_M7A_r3_00000__088d:
  088d  17241F         LBSR 0x2caf                       
  0890  170388         LBSR 0x0c1b                       
  0893  AD9FFE10       JSR [0xfe10]                      
  0897  39             RTS                               

; ---- function FUN_M7A_r3_00000__0898
FUN_M7A_r3_00000__0898:
  0898  1724AF         LBSR 0x2d4a                       
  089b  1703BC         LBSR 0x0c5a                       
  089e  AD9FFE10       JSR [0xfe10]                      
  08a2  39             RTS                               

; ---- function FUN_M7A_r3_00000__08a3
FUN_M7A_r3_00000__08a3:
  08a3  17253F         LBSR 0x2de5                       
  08a6  170372         LBSR 0x0c1b                       
  08a9  AD9FFE12       JSR [0xfe12]                      
  08ad  39             RTS                               

; ---- function FUN_M7A_r3_00000__08ae
FUN_M7A_r3_00000__08ae:
  08ae  1725CF         LBSR 0x2e80                       
  08b1  1703A6         LBSR 0x0c5a                       
  08b4  AD9FFE12       JSR [0xfe12]                      
  08b8  39             RTS                               

; ---- function FUN_M7A_r3_00000__08b9
FUN_M7A_r3_00000__08b9:
  08b9  172757         LBSR 0x3013                       
  08bc  17035C         LBSR 0x0c1b                       
  08bf  AD9FFE14       JSR [0xfe14]                      
  08c3  39             RTS                               

; ---- function FUN_M7A_r3_00000__08c4
FUN_M7A_r3_00000__08c4:
  08c4  1727DF         LBSR 0x30a6                       
  08c7  170390         LBSR 0x0c5a                       
  08ca  AD9FFE14       JSR [0xfe14]                      
  08ce  39             RTS                               

; ---- function FUN_M7A_r3_00000__08cf
FUN_M7A_r3_00000__08cf:
  08cf  172867         LBSR 0x3139                       
  08d2  170346         LBSR 0x0c1b                       
  08d5  AD9FFE16       JSR [0xfe16]                      
  08d9  39             RTS                               

; ---- function FUN_M7A_r3_00000__08da
FUN_M7A_r3_00000__08da:
  08da  1728FB         LBSR 0x31d8                       
  08dd  17037A         LBSR 0x0c5a                       
  08e0  AD9FFE16       JSR [0xfe16]                      
  08e4  39             RTS                               

; ---- function FUN_M7A_r3_00000__08e5
FUN_M7A_r3_00000__08e5:
  08e5  17298F         LBSR 0x3277                       
  08e8  170544         LBSR 0x0e2f                       
  08eb  AD9FFE10       JSR [0xfe10]                      
  08ef  39             RTS                               

; ---- function FUN_M7A_r3_00000__08f0
FUN_M7A_r3_00000__08f0:
  08f0  172A17         LBSR 0x330a                       
  08f3  170539         LBSR 0x0e2f                       
  08f6  AD9FFE14       JSR [0xfe14]                      
  08fa  39             RTS                               

; ---- function FUN_M7A_r3_00000__08fb
FUN_M7A_r3_00000__08fb:
  08fb  172A9F         LBSR 0x339d                       
  08fe  17052E         LBSR 0x0e2f                       
  0901  AD9FFE12       JSR [0xfe12]                      
  0905  39             RTS                               

; ---- function FUN_M7A_r3_00000__0906
FUN_M7A_r3_00000__0906:
  0906  172B27         LBSR 0x3430                       
  0909  170523         LBSR 0x0e2f                       
  090c  AD9FFE16       JSR [0xfe16]                      
  0910  39             RTS                               

; ---- function FUN_M7A_r3_00000__0911
FUN_M7A_r3_00000__0911:
  0911  172BAF         LBSR 0x34c3                       
  0914  17024E         LBSR 0x0b65                       
  0917  AD9FFE10       JSR [0xfe10]                      
  091b  39             RTS                               

; ---- function FUN_M7A_r3_00000__091c
FUN_M7A_r3_00000__091c:
  091c  172C4A         LBSR 0x3569                       
  091f  170243         LBSR 0x0b65                       
  0922  AD9FFE12       JSR [0xfe12]                      
  0926  39             RTS                               

; ---- function FUN_M7A_r3_00000__0927
FUN_M7A_r3_00000__0927:
  0927  172CE5         LBSR 0x360f                       
  092a  170238         LBSR 0x0b65                       
  092d  AD9FFE14       JSR [0xfe14]                      
  0931  39             RTS                               

; ---- function FUN_M7A_r3_00000__0932
FUN_M7A_r3_00000__0932:
  0932  172D80         LBSR 0x36b5                       
  0935  17022D         LBSR 0x0b65                       
  0938  AD9FFE16       JSR [0xfe16]                      
  093c  39             RTS                               

; ---- function FUN_M7A_r3_00000__093d
FUN_M7A_r3_00000__093d:
  093d  172E1B         LBSR 0x375b                       
  0940  170261         LBSR 0x0ba4                       
  0943  AD9FFE10       JSR [0xfe10]                      
  0947  39             RTS                               

; ---- function FUN_M7A_r3_00000__0948
FUN_M7A_r3_00000__0948:
  0948  172EB6         LBSR 0x3801                       
  094b  170256         LBSR 0x0ba4                       
  094e  AD9FFE12       JSR [0xfe12]                      
  0952  39             RTS                               

; ---- function FUN_M7A_r3_00000__0953
FUN_M7A_r3_00000__0953:
  0953  172F51         LBSR 0x38a7                       
  0956  17024B         LBSR 0x0ba4                       
  0959  AD9FFE14       JSR [0xfe14]                      
  095d  39             RTS                               

; ---- function FUN_M7A_r3_00000__095e
FUN_M7A_r3_00000__095e:
  095e  172FEC         LBSR 0x394d                       
  0961  170240         LBSR 0x0ba4                       
  0964  AD9FFE16       JSR [0xfe16]                      
  0968  39             RTS                               

; ---- function FUN_M7A_r3_00000__0969
FUN_M7A_r3_00000__0969:
  0969  173087         LBSR 0x39f3                       
  096c  170274         LBSR 0x0be3                       
  096f  AD9FFE10       JSR [0xfe10]                      
  0973  39             RTS                               

; ---- function FUN_M7A_r3_00000__0974
FUN_M7A_r3_00000__0974:
  0974  173122         LBSR 0x3a99                       
  0977  170269         LBSR 0x0be3                       
  097a  AD9FFE12       JSR [0xfe12]                      
  097e  39             RTS                               

; ---- function FUN_M7A_r3_00000__097f
FUN_M7A_r3_00000__097f:
  097f  1731BD         LBSR 0x3b3f                       
  0982  170513         LBSR 0x0e98                       
  0985  AD9FFE10       JSR [0xfe10]                      
  0989  39             RTS                               

; ---- function FUN_M7A_r3_00000__098a
FUN_M7A_r3_00000__098a:
  098a  17322C         LBSR 0x3bb9                       
  098d  170508         LBSR 0x0e98                       
  0990  AD9FFE12       JSR [0xfe12]                      
  0994  39             RTS                               

; ---- function FUN_M7A_r3_00000__0995
FUN_M7A_r3_00000__0995:
  0995  17329B         LBSR 0x3c33                       
  0998  17052F         LBSR 0x0eca                       
  099b  AD9FFE10       JSR [0xfe10]                      
  099f  39             RTS                               

; ---- function FUN_M7A_r3_00000__09a0
FUN_M7A_r3_00000__09a0:
  09a0  17330A         LBSR 0x3cad                       
  09a3  170524         LBSR 0x0eca                       
  09a6  AD9FFE12       JSR [0xfe12]                      
  09aa  39             RTS                               

; ---- function FUN_M7A_r3_00000__09ab
FUN_M7A_r3_00000__09ab:
  09ab  173379         LBSR 0x3d27                       
  09ae  17000A         LBSR 0x09bb                       
  09b1  AD9FFE14       JSR [0xfe14]                      
  09b5  39             RTS                               

; ---- function FUN_M7A_r3_00000__09b6
FUN_M7A_r3_00000__09b6:
  09b6  AD9FFDFC       JSR [0xfdfc]                      
  09ba  39             RTS                               

; ---- function FUN_M7A_r3_00000__09bb
FUN_M7A_r3_00000__09bb:
  09bb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " input  " " output " "prg load" " return "
  09bf  20696E707574.. ds " input  "                     
  09c7  206F75747075.. ds " output "                     
  09cf  707267206C6F.. ds "prg load"                     
  09d7  207265747572.. ds " return "                     
LAB_M7A_r3_00000__09df:
  09df  AD9FFDF2       JSR [0xfdf2]                      
  09e3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0FF5 ->$0F0B ->$3D1B ->$0A7E ->$09BB ->$09BB
  09e7  0FF5           addr M7A_r3_00000::0ff5           
  09e9  0F0B           addr M7A_r3_00000::0f0b           
  09eb  3D1B           addr M7A_r3_00000::3d1b           
  09ed  0A7E           addr M7A_r3_00000::0a7e           
  09ef  09BB           addr M7A_r3_00000::09bb           
  09f1  09BB           addr M7A_r3_00000::09bb           
LAB_M7A_r3_00000__09f3:
  09f3  39             RTS                               

; ---- function FUN_M7A_r3_00000__09f4
FUN_M7A_r3_00000__09f4:
  09f4  3420           PSHS  Y                           
  09f6  108E0145       LDY #0x145                        
  09fa  AD9FFC82       JSR [0xfc82]                      
  09fe  35A0           PULS  Y PC                        

; ---- function FUN_M7A_r3_00000__0a00
FUN_M7A_r3_00000__0a00:
  0a00  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  bpm   " "  mix   " "modknob1" "modknob2"
  0a04  202062706D20.. ds "  bpm   "                     
  0a0c  20206D697820.. ds "  mix   "                     
  0a14  6D6F646B6E6F.. ds "modknob1"                     
  0a1c  6D6F646B6E6F.. ds "modknob2"                     
LAB_M7A_r3_00000__0a24:
  0a24  AD9FFDF2       JSR [0xfdf2]                      
  0a28  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$16ED ->$1507 ->$12C1 ->$13E4 ->$0A3F ->$0A7E
  0a2c  16ED           addr M7A_r3_00000::16ed           
  0a2e  1507           addr M7A_r3_00000::1507           
  0a30  12C1           addr M7A_r3_00000::12c1           
  0a32  13E4           addr M7A_r3_00000::13e4           
  0a34  0A3F           addr M7A_r3_00000::0a3f           
  0a36  0A7E           addr M7A_r3_00000::0a7e           
LAB_M7A_r3_00000__0a38:
  0a38  CC0000         LDD #0x0                          
  0a3b  17FFB6         LBSR 0x09f4                       
  0a3e  39             RTS                               

; ---- function FUN_M7A_r3_00000__0a3f
FUN_M7A_r3_00000__0a3f:
  0a3f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "filters " " delays " "  lfos  " "envelope"
  0a43  66696C746572.. ds "filters "                     
  0a4b  2064656C6179.. ds " delays "                     
  0a53  20206C666F73.. ds "  lfos  "                     
  0a5b  656E76656C6F.. ds "envelope"                     
LAB_M7A_r3_00000__0a63:
  0a63  AD9FFDF2       JSR [0xfdf2]                      
  0a67  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0ABD ->$0CC3 ->$0D79 ->$0C1B ->$0A7E ->$0A00
  0a6b  0ABD           addr M7A_r3_00000::0abd           
  0a6d  0CC3           addr M7A_r3_00000::0cc3           
  0a6f  0D79           addr M7A_r3_00000::0d79           
  0a71  0C1B           addr M7A_r3_00000::0c1b           
  0a73  0A7E           addr M7A_r3_00000::0a7e           
  0a75  0A00           addr M7A_r3_00000::0a00           
LAB_M7A_r3_00000__0a77:
  0a77  CC0001         LDD #0x1                          
  0a7a  17FF77         LBSR 0x09f4                       
  0a7d  39             RTS                               

; ---- function FUN_M7A_r3_00000__0a7e
FUN_M7A_r3_00000__0a7e:
  0a7e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " mixers " "ampmods " " levels " "patching"
  0a82  206D69786572.. ds " mixers "                     
  0a8a  616D706D6F64.. ds "ampmods "                     
  0a92  206C6576656C.. ds " levels "                     
  0a9a  706174636869.. ds "patching"                     
LAB_M7A_r3_00000__0aa2:
  0aa2  AD9FFDF2       JSR [0xfdf2]                      
  0aa6  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0B65 ->$0E2F ->$0E98 ->$09BB ->$0A00 ->$0A3F
  0aaa  0B65           addr M7A_r3_00000::0b65           
  0aac  0E2F           addr M7A_r3_00000::0e2f           
  0aae  0E98           addr M7A_r3_00000::0e98           
  0ab0  09BB           addr M7A_r3_00000::09bb           
  0ab2  0A00           addr M7A_r3_00000::0a00           
  0ab4  0A3F           addr M7A_r3_00000::0a3f           
LAB_M7A_r3_00000__0ab6:
  0ab6  CC0002         LDD #0x2                          
  0ab9  17FF38         LBSR 0x09f4                       
  0abc  39             RTS                               

; ---- function FUN_M7A_r3_00000__0abd
FUN_M7A_r3_00000__0abd:
  0abd  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "cutoff 1" "  q1    " "modamt 1" " type 1 "
  0ac1  6375746F6666.. ds "cutoff 1"                     
  0ac9  202071312020.. ds "  q1    "                     
  0ad1  6D6F64616D74.. ds "modamt 1"                     
  0ad9  207479706520.. ds " type 1 "                     
LAB_M7A_r3_00000__0ae1:
  0ae1  AD9FFDF2       JSR [0xfdf2]                      
  0ae5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$18AD ->$19D6 ->$1C9E ->$1B2E ->$0AFC ->$0B3B
  0ae9  18AD           addr M7A_r3_00000::18ad           
  0aeb  19D6           addr M7A_r3_00000::19d6           
  0aed  1C9E           addr M7A_r3_00000::1c9e           
  0aef  1B2E           addr M7A_r3_00000::1b2e           
  0af1  0AFC           addr M7A_r3_00000::0afc           
  0af3  0B3B           addr M7A_r3_00000::0b3b           
LAB_M7A_r3_00000__0af5:
  0af5  CC0003         LDD #0x3                          
  0af8  17FEF9         LBSR 0x09f4                       
  0afb  39             RTS                               

; ---- function FUN_M7A_r3_00000__0afc
FUN_M7A_r3_00000__0afc:
  0afc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "cutoff 2" "  q2    " "modamt 2" " type 2 "
  0b00  6375746F6666.. ds "cutoff 2"                     
  0b08  202071322020.. ds "  q2    "                     
  0b10  6D6F64616D74.. ds "modamt 2"                     
  0b18  207479706520.. ds " type 2 "                     
LAB_M7A_r3_00000__0b20:
  0b20  AD9FFDF2       JSR [0xfdf2]                      
  0b24  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1964 ->$1A82 ->$1D55 ->$1BB6 ->$0B3B ->$0ABD
  0b28  1964           addr M7A_r3_00000::1964           
  0b2a  1A82           addr M7A_r3_00000::1a82           
  0b2c  1D55           addr M7A_r3_00000::1d55           
  0b2e  1BB6           addr M7A_r3_00000::1bb6           
  0b30  0B3B           addr M7A_r3_00000::0b3b           
  0b32  0ABD           addr M7A_r3_00000::0abd           
LAB_M7A_r3_00000__0b34:
  0b34  CC0004         LDD #0x4                          
  0b37  17FEBA         LBSR 0x09f4                       
  0b3a  39             RTS                               

; ---- function FUN_M7A_r3_00000__0b3b
FUN_M7A_r3_00000__0b3b:
  0b3b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] "return  "
  0b3f  01             db 1h                             
  0b40  01             db 1h                             
  0b41  01             db 1h                             
  0b42  72657475726E.. ds "return  "                     
LAB_M7A_r3_00000__0b4a:
  0b4a  AD9FFDF2       JSR [0xfdf2]                      
  0b4e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0EFC ->$0EFC ->$0EFC ->$0A3F ->$0ABD ->$0AFC
  0b52  0EFC           addr M7A_r3_00000::0efc           
  0b54  0EFC           addr M7A_r3_00000::0efc           
  0b56  0EFC           addr M7A_r3_00000::0efc           
  0b58  0A3F           addr M7A_r3_00000::0a3f           
  0b5a  0ABD           addr M7A_r3_00000::0abd           
  0b5c  0AFC           addr M7A_r3_00000::0afc           
LAB_M7A_r3_00000__0b5e:
  0b5e  CC0005         LDD #0x5                          
  0b61  17FE90         LBSR 0x09f4                       
  0b64  39             RTS                               

; ---- function FUN_M7A_r3_00000__0b65
FUN_M7A_r3_00000__0b65:
  0b65  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " mix1 a " " mix1 b " " mix2 a " " mix2 b "
  0b69  206D69783120.. ds " mix1 a "                     
  0b71  206D69783120.. ds " mix1 b "                     
  0b79  206D69783220.. ds " mix2 a "                     
  0b81  206D69783220.. ds " mix2 b "                     
LAB_M7A_r3_00000__0b89:
  0b89  AD9FFDF2       JSR [0xfdf2]                      
  0b8d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$34B7 ->$355D ->$3603 ->$36A9 ->$0BA4 ->$0BE3
  0b91  34B7           addr M7A_r3_00000::34b7           
  0b93  355D           addr M7A_r3_00000::355d           
  0b95  3603           addr M7A_r3_00000::3603           
  0b97  36A9           addr M7A_r3_00000::36a9           
  0b99  0BA4           addr M7A_r3_00000::0ba4           
  0b9b  0BE3           addr M7A_r3_00000::0be3           
LAB_M7A_r3_00000__0b9d:
  0b9d  CC0006         LDD #0x6                          
  0ba0  17FE51         LBSR 0x09f4                       
  0ba3  39             RTS                               

; ---- function FUN_M7A_r3_00000__0ba4
FUN_M7A_r3_00000__0ba4:
  0ba4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " mix3 a " " mix3 b " " mix4 a " " mix4 b "
  0ba8  206D69783320.. ds " mix3 a "                     
  0bb0  206D69783320.. ds " mix3 b "                     
  0bb8  206D69783420.. ds " mix4 a "                     
  0bc0  206D69783420.. ds " mix4 b "                     
LAB_M7A_r3_00000__0bc8:
  0bc8  AD9FFDF2       JSR [0xfdf2]                      
  0bcc  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$374F ->$37F5 ->$389B ->$3941 ->$0BE3 ->$0B65
  0bd0  374F           addr M7A_r3_00000::374f           
  0bd2  37F5           addr M7A_r3_00000::37f5           
  0bd4  389B           addr M7A_r3_00000::389b           
  0bd6  3941           addr M7A_r3_00000::3941           
  0bd8  0BE3           addr M7A_r3_00000::0be3           
  0bda  0B65           addr M7A_r3_00000::0b65           
LAB_M7A_r3_00000__0bdc:
  0bdc  CC0007         LDD #0x7                          
  0bdf  17FE12         LBSR 0x09f4                       
  0be2  39             RTS                               

; ---- function FUN_M7A_r3_00000__0be3
FUN_M7A_r3_00000__0be3:
  0be3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "mscale 1" "mscale 2" [*] "return  "
  0be7  6D7363616C65.. ds "mscale 1"                     
  0bef  6D7363616C65.. ds "mscale 2"                     
  0bf7  01             db 1h                             
  0bf8  72657475726E.. ds "return  "                     
LAB_M7A_r3_00000__0c00:
  0c00  AD9FFDF2       JSR [0xfdf2]                      
  0c04  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$39E7 ->$3A8D ->$0EFC ->$0A7E ->$0B65 ->$0BA4
  0c08  39E7           addr M7A_r3_00000::39e7           
  0c0a  3A8D           addr M7A_r3_00000::3a8d           
  0c0c  0EFC           addr M7A_r3_00000::0efc           
  0c0e  0A7E           addr M7A_r3_00000::0a7e           
  0c10  0B65           addr M7A_r3_00000::0b65           
  0c12  0BA4           addr M7A_r3_00000::0ba4           
LAB_M7A_r3_00000__0c14:
  0c14  CC0008         LDD #0x8                          
  0c17  17FDDA         LBSR 0x09f4                       
  0c1a  39             RTS                               

; ---- function FUN_M7A_r3_00000__0c1b
FUN_M7A_r3_00000__0c1b:
  0c1b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "env1 att" "env1 dec" "thresh 1" "ratio 1 "
  0c1f  656E76312061.. ds "env1 att"                     
  0c27  656E76312064.. ds "env1 dec"                     
  0c2f  746872657368.. ds "thresh 1"                     
  0c37  726174696F20.. ds "ratio 1 "                     
LAB_M7A_r3_00000__0c3f:
  0c3f  AD9FFDF2       JSR [0xfdf2]                      
  0c43  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2CE8 ->$2E1E ->$3007 ->$312D ->$0C5A ->$0C99
  0c47  2CE8           addr M7A_r3_00000::2ce8           
  0c49  2E1E           addr M7A_r3_00000::2e1e           
  0c4b  3007           addr M7A_r3_00000::3007           
  0c4d  312D           addr M7A_r3_00000::312d           
  0c4f  0C5A           addr M7A_r3_00000::0c5a           
  0c51  0C99           addr M7A_r3_00000::0c99           
LAB_M7A_r3_00000__0c53:
  0c53  CC0009         LDD #0x9                          
  0c56  17FD9B         LBSR 0x09f4                       
  0c59  39             RTS                               

; ---- function FUN_M7A_r3_00000__0c5a
FUN_M7A_r3_00000__0c5a:
  0c5a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "env2 att" "env2 dec" "thresh 2" "ratio 2 "
  0c5e  656E76322061.. ds "env2 att"                     
  0c66  656E76322064.. ds "env2 dec"                     
  0c6e  746872657368.. ds "thresh 2"                     
  0c76  726174696F20.. ds "ratio 2 "                     
LAB_M7A_r3_00000__0c7e:
  0c7e  AD9FFDF2       JSR [0xfdf2]                      
  0c82  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2D83 ->$2EB9 ->$309A ->$31CC ->$0C99 ->$0C1B
  0c86  2D83           addr M7A_r3_00000::2d83           
  0c88  2EB9           addr M7A_r3_00000::2eb9           
  0c8a  309A           addr M7A_r3_00000::309a           
  0c8c  31CC           addr M7A_r3_00000::31cc           
  0c8e  0C99           addr M7A_r3_00000::0c99           
  0c90  0C1B           addr M7A_r3_00000::0c1b           
LAB_M7A_r3_00000__0c92:
  0c92  CC000A         LDD #0xa                          
  0c95  17FD5C         LBSR 0x09f4                       
  0c98  39             RTS                               

; ---- function FUN_M7A_r3_00000__0c99
FUN_M7A_r3_00000__0c99:
  0c99  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] "return  "
  0c9d  01             db 1h                             
  0c9e  01             db 1h                             
  0c9f  01             db 1h                             
  0ca0  72657475726E.. ds "return  "                     
LAB_M7A_r3_00000__0ca8:
  0ca8  AD9FFDF2       JSR [0xfdf2]                      
  0cac  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0EFC ->$0EFC ->$0EFC ->$0A3F ->$0C1B ->$0C5A
  0cb0  0EFC           addr M7A_r3_00000::0efc           
  0cb2  0EFC           addr M7A_r3_00000::0efc           
  0cb4  0EFC           addr M7A_r3_00000::0efc           
  0cb6  0A3F           addr M7A_r3_00000::0a3f           
  0cb8  0C1B           addr M7A_r3_00000::0c1b           
  0cba  0C5A           addr M7A_r3_00000::0c5a           
LAB_M7A_r3_00000__0cbc:
  0cbc  CC000B         LDD #0xb                          
  0cbf  17FD32         LBSR 0x09f4                       
  0cc2  39             RTS                               

; ---- function FUN_M7A_r3_00000__0cc3
FUN_M7A_r3_00000__0cc3:
  0cc3  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "dly1 bpm" "delay 2 " "dly2 bpm"
  0cc7  64656C617920.. ds "delay 1 "                     
  0ccf  646C79312062.. ds "dly1 bpm"                     
  0cd7  64656C617920.. ds "delay 2 "                     
  0cdf  646C79322062.. ds "dly2 bpm"                     
LAB_M7A_r3_00000__0ce7:
  0ce7  AD9FFDF2       JSR [0xfdf2]                      
  0ceb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1E0C ->$1F43 ->$1ECA ->$1FEA ->$0D02 ->$0D41
  0cef  1E0C           addr M7A_r3_00000::1e0c           
  0cf1  1F43           addr M7A_r3_00000::1f43           
  0cf3  1ECA           addr M7A_r3_00000::1eca           
  0cf5  1FEA           addr M7A_r3_00000::1fea           
  0cf7  0D02           addr M7A_r3_00000::0d02           
  0cf9  0D41           addr M7A_r3_00000::0d41           
LAB_M7A_r3_00000__0cfb:
  0cfb  CC000C         LDD #0xc                          
  0cfe  17FCF3         LBSR 0x09f4                       
  0d01  39             RTS                               

; ---- function FUN_M7A_r3_00000__0d02
FUN_M7A_r3_00000__0d02:
  0d02  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay1fb" "delay1 m" "delay2fb" "delay2 m"
  0d06  64656C617931.. ds "delay1fb"                     
  0d0e  64656C617931.. ds "delay1 m"                     
  0d16  64656C617932.. ds "delay2fb"                     
  0d1e  64656C617932.. ds "delay2 m"                     
LAB_M7A_r3_00000__0d26:
  0d26  AD9FFDF2       JSR [0xfdf2]                      
  0d2a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2091 ->$2365 ->$2136 ->$241D ->$0D41 ->$0CC3
  0d2e  2091           addr M7A_r3_00000::2091           
  0d30  2365           addr M7A_r3_00000::2365           
  0d32  2136           addr M7A_r3_00000::2136           
  0d34  241D           addr M7A_r3_00000::241d           
  0d36  0D41           addr M7A_r3_00000::0d41           
  0d38  0CC3           addr M7A_r3_00000::0cc3           
LAB_M7A_r3_00000__0d3a:
  0d3a  CC000D         LDD #0xd                          
  0d3d  17FCB4         LBSR 0x09f4                       
  0d40  39             RTS                               

; ---- function FUN_M7A_r3_00000__0d41
FUN_M7A_r3_00000__0d41:
  0d41  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " loop 1 " " loop 2 " [*] " return "
  0d45  206C6F6F7020.. ds " loop 1 "                     
  0d4d  206C6F6F7020.. ds " loop 2 "                     
  0d55  01             db 1h                             
  0d56  207265747572.. ds " return "                     
LAB_M7A_r3_00000__0d5e:
  0d5e  AD9FFDF2       JSR [0xfdf2]                      
  0d62  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$21DB ->$22A6 ->$0EFC ->$0A3F ->$0CC3 ->$0D02
  0d66  21DB           addr M7A_r3_00000::21db           
  0d68  22A6           addr M7A_r3_00000::22a6           
  0d6a  0EFC           addr M7A_r3_00000::0efc           
  0d6c  0A3F           addr M7A_r3_00000::0a3f           
  0d6e  0CC3           addr M7A_r3_00000::0cc3           
  0d70  0D02           addr M7A_r3_00000::0d02           
LAB_M7A_r3_00000__0d72:
  0d72  CC000E         LDD #0xe                          
  0d75  17FC7C         LBSR 0x09f4                       
  0d78  39             RTS                               

; ---- function FUN_M7A_r3_00000__0d79
FUN_M7A_r3_00000__0d79:
  0d79  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "lfo1 frq" "lfo1 bpm" "lfo2 frq" "lfo2 bpm"
  0d7d  6C666F312066.. ds "lfo1 frq"                     
  0d85  6C666F312062.. ds "lfo1 bpm"                     
  0d8d  6C666F322066.. ds "lfo2 frq"                     
  0d95  6C666F322062.. ds "lfo2 bpm"                     
LAB_M7A_r3_00000__0d9d:
  0d9d  AD9FFDF2       JSR [0xfdf2]                      
  0da1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$24D5 ->$2657 ->$2596 ->$26F6 ->$0DB8 ->$0DF7
  0da5  24D5           addr M7A_r3_00000::24d5           
  0da7  2657           addr M7A_r3_00000::2657           
  0da9  2596           addr M7A_r3_00000::2596           
  0dab  26F6           addr M7A_r3_00000::26f6           
  0dad  0DB8           addr M7A_r3_00000::0db8           
  0daf  0DF7           addr M7A_r3_00000::0df7           
LAB_M7A_r3_00000__0db1:
  0db1  CC000F         LDD #0xf                          
  0db4  17FC3D         LBSR 0x09f4                       
  0db7  39             RTS                               

; ---- function FUN_M7A_r3_00000__0db8
FUN_M7A_r3_00000__0db8:
  0db8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "lfo1 mod" "lfo1wave" "lfo2 mod" "lfo2wave"
  0dbc  6C666F31206D.. ds "lfo1 mod"                     
  0dc4  6C666F317761.. ds "lfo1wave"                     
  0dcc  6C666F32206D.. ds "lfo2 mod"                     
  0dd4  6C666F327761.. ds "lfo2wave"                     
LAB_M7A_r3_00000__0ddc:
  0ddc  AD9FFDF2       JSR [0xfdf2]                      
  0de0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2B7D ->$2795 ->$2C10 ->$2887 ->$0DF7 ->$0D79
  0de4  2B7D           addr M7A_r3_00000::2b7d           
  0de6  2795           addr M7A_r3_00000::2795           
  0de8  2C10           addr M7A_r3_00000::2c10           
  0dea  2887           addr M7A_r3_00000::2887           
  0dec  0DF7           addr M7A_r3_00000::0df7           
  0dee  0D79           addr M7A_r3_00000::0d79           
LAB_M7A_r3_00000__0df0:
  0df0  CC0010         LDD #0x10                         
  0df3  17FBFE         LBSR 0x09f4                       
  0df6  39             RTS                               

; ---- function FUN_M7A_r3_00000__0df7
FUN_M7A_r3_00000__0df7:
  0df7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "thresh 1" "thresh 2" [*] " return "
  0dfb  746872657368.. ds "thresh 1"                     
  0e03  746872657368.. ds "thresh 2"                     
  0e0b  01             db 1h                             
  0e0c  207265747572.. ds " return "                     
LAB_M7A_r3_00000__0e14:
  0e14  AD9FFDF2       JSR [0xfdf2]                      
  0e18  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$29FB ->$2A92 ->$0EFC ->$0A3F ->$0D79 ->$0DB8
  0e1c  29FB           addr M7A_r3_00000::29fb           
  0e1e  2A92           addr M7A_r3_00000::2a92           
  0e20  0EFC           addr M7A_r3_00000::0efc           
  0e22  0A3F           addr M7A_r3_00000::0a3f           
  0e24  0D79           addr M7A_r3_00000::0d79           
  0e26  0DB8           addr M7A_r3_00000::0db8           
LAB_M7A_r3_00000__0e28:
  0e28  CC0011         LDD #0x11                         
  0e2b  17FBC6         LBSR 0x09f4                       
  0e2e  39             RTS                               

; ---- function FUN_M7A_r3_00000__0e2f
FUN_M7A_r3_00000__0e2f:
  0e2f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "am1 amt " "am1 ofs " "am2 amt " "amt ofs "
  0e33  616D3120616D.. ds "am1 amt "                     
  0e3b  616D31206F66.. ds "am1 ofs "                     
  0e43  616D3220616D.. ds "am2 amt "                     
  0e4b  616D74206F66.. ds "amt ofs "                     
LAB_M7A_r3_00000__0e53:
  0e53  AD9FFDF2       JSR [0xfdf2]                      
  0e57  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$326B ->$3391 ->$32FE ->$3424 ->$0E6E ->$0E6E
  0e5b  326B           addr M7A_r3_00000::326b           
  0e5d  3391           addr M7A_r3_00000::3391           
  0e5f  32FE           addr M7A_r3_00000::32fe           
  0e61  3424           addr M7A_r3_00000::3424           
  0e63  0E6E           addr M7A_r3_00000::0e6e           
  0e65  0E6E           addr M7A_r3_00000::0e6e           
LAB_M7A_r3_00000__0e67:
  0e67  CC0012         LDD #0x12                         
  0e6a  17FB87         LBSR 0x09f4                       
  0e6d  39             RTS                               

; ---- function FUN_M7A_r3_00000__0e6e
FUN_M7A_r3_00000__0e6e:
  0e6e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0e72  01             db 1h                             
  0e73  01             db 1h                             
  0e74  01             db 1h                             
  0e75  207265747572.. ds " return "                     
LAB_M7A_r3_00000__0e7d:
  0e7d  AD9FFDF2       JSR [0xfdf2]                      
  0e81  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0EFC ->$0EFC ->$0EFC ->$0A7E ->$0E2F ->$0E2F
  0e85  0EFC           addr M7A_r3_00000::0efc           
  0e87  0EFC           addr M7A_r3_00000::0efc           
  0e89  0EFC           addr M7A_r3_00000::0efc           
  0e8b  0A7E           addr M7A_r3_00000::0a7e           
  0e8d  0E2F           addr M7A_r3_00000::0e2f           
  0e8f  0E2F           addr M7A_r3_00000::0e2f           
LAB_M7A_r3_00000__0e91:
  0e91  CC0013         LDD #0x13                         
  0e94  17FB5D         LBSR 0x09f4                       
  0e97  39             RTS                               

; ---- function FUN_M7A_r3_00000__0e98
FUN_M7A_r3_00000__0e98:
  0e98  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] "return  "
  0e9c  6C6566742069.. ds "left in "                     
  0ea4  726967687420.. ds "right in"                     
  0eac  01             db 1h                             
  0ead  72657475726E.. ds "return  "                     
LAB_M7A_r3_00000__0eb5:
  0eb5  AD9FFDF2       JSR [0xfdf2]                      
  0eb9  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3B33 ->$3BAD ->$0EFC ->$0A7E ->$0ECA ->$0ECA
  0ebd  3B33           addr M7A_r3_00000::3b33           
  0ebf  3BAD           addr M7A_r3_00000::3bad           
  0ec1  0EFC           addr M7A_r3_00000::0efc           
  0ec3  0A7E           addr M7A_r3_00000::0a7e           
  0ec5  0ECA           addr M7A_r3_00000::0eca           
  0ec7  0ECA           addr M7A_r3_00000::0eca           
LAB_M7A_r3_00000__0ec9:
  0ec9  39             RTS                               

; ---- function FUN_M7A_r3_00000__0eca
FUN_M7A_r3_00000__0eca:
  0eca  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] "return  "
  0ece  6C656674206F.. ds "left out"                     
  0ed6  72696768746F.. ds "rightout"                     
  0ede  01             db 1h                             
  0edf  72657475726E.. ds "return  "                     
LAB_M7A_r3_00000__0ee7:
  0ee7  AD9FFDF2       JSR [0xfdf2]                      
  0eeb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3C27 ->$3CA1 ->$0EFC ->$0A7E ->$0E98 ->$0E98
  0eef  3C27           addr M7A_r3_00000::3c27           
  0ef1  3CA1           addr M7A_r3_00000::3ca1           
  0ef3  0EFC           addr M7A_r3_00000::0efc           
  0ef5  0A7E           addr M7A_r3_00000::0a7e           
  0ef7  0E98           addr M7A_r3_00000::0e98           
  0ef9  0E98           addr M7A_r3_00000::0e98           
LAB_M7A_r3_00000__0efb:
  0efb  39             RTS                               

; ---- function FUN_M7A_r3_00000__0efc
FUN_M7A_r3_00000__0efc:
  0efc  39             RTS                               

; ---- function FUN_M7A_r3_00000__0efd
FUN_M7A_r3_00000__0efd:
  0efd  CC000A         LDD #0xa                          
  0f00  AD9FFD20       JSR [0xfd20]                      
  0f04  1F10           TFR X,D                           
  0f06  AD9FFD2E       JSR [0xfd2e]                      
  0f0a  39             RTS                               

; ---- function FUN_M7A_r3_00000__0f0b
FUN_M7A_r3_00000__0f0b:
  0f0b  3476           PSHS  U Y X B A                   
  0f0d  FC7008         LDD 0x7008                        
  0f10  FD6074         STD 0x6074                        
  0f13  AD9FFDFC       JSR [0xfdfc]                      
  0f17  C613           LDB #0x13                         
  0f19  AD9FFC36       JSR [0xfc36]                      
  0f1d  C60A           LDB #0xa                          
  0f1f  AD9FFC2A       JSR [0xfc2a]                      
  0f23  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 10 02 01 01 00 0B 80 $0019 $0000 $0000 ->$0FAF ->$0F44 $0001 $0001 $0000
  0f27  01             db 1h                             
  0f28  10             db 10h                            
  0f29  02             db 2h                             
  0f2a  01             db 1h                             
  0f2b  01             db 1h                             
  0f2c  00             db 0h                             
  0f2d  0B             db Bh                             
  0f2e  80             db 80h                            
  0f2f  0019           dw 19h                            
  0f31  0000           dw 0h                             
  0f33  0000           dw 0h                             
  0f35  0FAF           addr M7A_r3_00000::0faf           
  0f37  0F44           addr M7A_r3_00000::0f44           
  0f39  0001           dw 1h                             
  0f3b  0001           dw 1h                             
  0f3d  0000           dw 0h                             
LAB_M7A_r3_00000__0f3f:
  0f3f  17006D         LBSR 0x0faf                       
  0f42  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__0f44
FUN_M7A_r3_00000__0f44:
  0f44  3476           PSHS  U Y X B A                   
  0f46  FC6074         LDD 0x6074                        
  0f49  FD7008         STD 0x7008                        
  0f4c  FC7006         LDD 0x7006                        
  0f4f  58             LSLB                              
  0f50  49             ROLA                              
  0f51  1F01           TFR D,X                           
  0f53  FC7008         LDD 0x7008                        
  0f56  ED89700A       STD 0x700a,X                      
  0f5a  10BE7006       LDY 0x7006                        
  0f5e  AD9FFE40       JSR [0xfe40]                      
  0f62  17004E         LBSR 0x0fb3                       
  0f65  170047         LBSR 0x0faf                       
  0f68  108E0061       LDY #0x61                         
  0f6c  FC7006         LDD 0x7006                        
  0f6f  31AB           LEAY D,Y                          
  0f71  FC7008         LDD 0x7008                        
  0f74  AD9FFC80       JSR [0xfc80]                      
  0f78  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__0f7a
FUN_M7A_r3_00000__0f7a:
  0f7a  3476           PSHS  U Y X B A                   
  0f7c  FD7006         STD 0x7006                        
  0f7f  AD9FFC8E       JSR [0xfc8e]                      
  0f83  FC60F9         LDD 0x60f9                        
  0f86  FD7008         STD 0x7008                        
  0f89  FC7006         LDD 0x7006                        
  0f8c  58             LSLB                              
  0f8d  49             ROLA                              
  0f8e  1F01           TFR D,X                           
  0f90  FC7008         LDD 0x7008                        
  0f93  ED89700A       STD 0x700a,X                      
  0f97  170019         LBSR 0x0fb3                       
  0f9a  170012         LBSR 0x0faf                       
  0f9d  108E0061       LDY #0x61                         
  0fa1  FC7006         LDD 0x7006                        
  0fa4  31AB           LEAY D,Y                          
  0fa6  FC7008         LDD 0x7008                        
  0fa9  AD9FFC80       JSR [0xfc80]                      
  0fad  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__0faf
FUN_M7A_r3_00000__0faf:
  0faf  170096         LBSR 0x1048                       
  0fb2  39             RTS                               

; ---- function FUN_M7A_r3_00000__0fb3
FUN_M7A_r3_00000__0fb3:
  0fb3  3476           PSHS  U Y X B A                   
  0fb5  CC0028         LDD #0x28                         
  0fb8  AD9FFD20       JSR [0xfd20]                      
  0fbc  108E0730       LDY #0x730                        
  0fc0  FC7006         LDD 0x7006                        
  0fc3  31AB           LEAY D,Y                          
  0fc5  FC7006         LDD 0x7006                        
  0fc8  58             LSLB                              
  0fc9  49             ROLA                              
  0fca  1F01           TFR D,X                           
  0fcc  EC89700A       LDD 0x700a,X                      
  0fd0  C30001         ADDD #0x1                         
  0fd3  AD9FFD2E       JSR [0xfd2e]                      
  0fd7  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__0fd9
FUN_M7A_r3_00000__0fd9:
  0fd9  3476           PSHS  U Y X B A                   
  0fdb  CC0000         LDD #0x0                          
LAB_M7A_r3_00000__0fde:
  0fde  FD7006         STD 0x7006                        
  0fe1  17FFCF         LBSR 0x0fb3                       
  0fe4  C30001         ADDD #0x1                         
  0fe7  1083001B       CMPD #0x1b                        
  0feb  2FF1           BLE 0x0fde                        
  0fed  CC0000         LDD #0x0                          
  0ff0  FD7006         STD 0x7006                        
  0ff3  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__0ff5
FUN_M7A_r3_00000__0ff5:
  0ff5  3476           PSHS  U Y X B A                   
  0ff7  FC7006         LDD 0x7006                        
  0ffa  FD6074         STD 0x6074                        
  0ffd  AD9FFDFC       JSR [0xfdfc]                      
  1001  C613           LDB #0x13                         
  1003  AD9FFC36       JSR [0xfc36]                      
  1007  C60A           LDB #0xa                          
  1009  AD9FFC2A       JSR [0xfc2a]                      
  100d  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 10 02 01 01 00 09 80 $001B $0000 $0000 ->$1048 ->$102E $0001 $0001 $0000
  1011  01             db 1h                             
  1012  10             db 10h                            
  1013  02             db 2h                             
  1014  01             db 1h                             
  1015  01             db 1h                             
  1016  00             db 0h                             
  1017  09             db 9h                             
  1018  80             db 80h                            
  1019  001B           dw 1Bh                            
  101b  0000           dw 0h                             
  101d  0000           dw 0h                             
  101f  1048           addr M7A_r3_00000::1048           
  1021  102E           addr M7A_r3_00000::102e           
  1023  0001           dw 1h                             
  1025  0001           dw 1h                             
  1027  0000           dw 0h                             
LAB_M7A_r3_00000__1029:
  1029  170002         LBSR 0x102e                       
  102c  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__102e
FUN_M7A_r3_00000__102e:
  102e  3476           PSHS  U Y X B A                   
  1030  FC6074         LDD 0x6074                        
  1033  FD7006         STD 0x7006                        
  1036  8E700A         LDX #0x700a                       
  1039  58             LSLB                              
  103a  49             ROLA                              
  103b  EC8B           LDD D,X                           
  103d  FD7008         STD 0x7008                        
  1040  17003D         LBSR 0x1080                       
  1043  170002         LBSR 0x1048                       
  1046  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__1048
FUN_M7A_r3_00000__1048:
  1048  3476           PSHS  U Y X B A                   
  104a  C614           LDB #0x14                         
  104c  AD9FFC36       JSR [0xfc36]                      
  1050  FC7006         LDD 0x7006                        
  1053  8609           LDA #0x9                          
  1055  3D             MUL                               
  1056  F3600D         ADDD 0x600d                       
  1059  C31081         ADDD #0x1081                      
  105c  1F01           TFR D,X                           
  105e  C609           LDB #0x9                          
  1060  AD9FFC3A       JSR [0xfc3a]                      
  1064  C61D           LDB #0x1d                         
  1066  AD9FFC36       JSR [0xfc36]                      
  106a  FC7008         LDD 0x7008                        
  106d  860B           LDA #0xb                          
  106f  3D             MUL                               
  1070  F3600D         ADDD 0x600d                       
  1073  C3117D         ADDD #0x117d                      
  1076  1F01           TFR D,X                           
  1078  C60B           LDB #0xb                          
  107a  AD9FFC3A       JSR [0xfc3a]                      
  107e  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__1080
FUN_M7A_r3_00000__1080:
  1080  39             RTS                               
  1081  .db 6C 65 66 74 20 6F 75 74 3C 72 69 67 68 74 6F 75  ; left out<rightou
  1091  .db 74 3C 6D 69 78 31 61 20 69 6E 3C 6D 69 78 31 62  ; t<mix1a in<mix1b
  10a1  .db 20 69 6E 3C 6D 69 78 32 61 20 69 6E 3C 6D 69 78  ;  in<mix2a in<mix
  10b1  .db 32 62 20 69 6E 3C 6D 69 78 33 61 20 69 6E 3C 6D  ; 2b in<mix3a in<m
  10c1  .db 69 78 33 62 20 69 6E 3C 6D 69 78 34 61 20 69 6E  ; ix3b in<mix4a in
  10d1  .db 3C 6D 69 78 34 62 20 69 6E 3C 61 6D 31 20 69 6E  ; <mix4b in<am1 in
  10e1  .db 20 20 3C 61 6D 31 20 6D 6F 64 20 3C 61 6D 32 20  ;   <am1 mod <am2 
  10f1  .db 69 6E 20 20 3C 61 6D 32 20 6D 6F 64 20 3C 64 6C  ; in  <am2 mod <dl
  1101  .db 79 20 31 20 69 6E 3C 64 6C 79 31 20 6D 6F 64 3C  ; y 1 in<dly1 mod<
  1111  .db 64 6C 79 20 32 20 69 6E 3C 64 6C 79 32 20 6D 6F  ; dly 2 in<dly2 mo
  1121  .db 64 3C 66 69 6C 74 31 20 69 6E 3C 66 69 6C 74 31  ; d<filt1 in<filt1
  1131  .db 6D 6F 64 3C 66 69 6C 74 32 20 69 6E 3C 66 69 6C  ; mod<filt2 in<fil
  1141  .db 74 32 6D 6F 64 3C 65 6E 76 31 20 69 6E 20 3C 65  ; t2mod<env1 in <e
  1151  .db 6E 76 32 20 69 6E 20 3C 6C 66 6F 31 20 69 6E 20  ; nv2 in <lfo1 in 
  1161  .db 3C 6C 66 6F 32 20 69 6E 20 3C 6D 64 73 63 6C 31  ; <lfo2 in <mdscl1
  1171  .db 69 6E 3C 6D 64 73 63 6C 32 69 6E 3C 7A 65 72 6F  ; in<mdscl2in<zero
  1181  .db 20 20 20 20 20 20 20 6C 65 66 74 20 69 6E 70 75  ;        left inpu
  1191  .db 74 20 72 69 67 68 74 20 69 6E 70 75 74 6D 69 78  ; t right inputmix
  11a1  .db 65 72 20 31 20 20 20 20 6D 69 78 65 72 20 32 20  ; er 1    mixer 2 
  11b1  .db 20 20 20 6D 69 78 65 72 20 33 20 20 20 20 6D 69  ;    mixer 3    mi
  11c1  .db 78 65 72 20 34 20 20 20 20 61 6D 70 20 6D 6F 64  ; xer 4    amp mod
  11d1  .db 20 31 20 20 61 6D 70 20 6D 6F 64 20 32 20 20 64  ;  1  amp mod 2  d
  11e1  .db 65 6C 61 79 20 31 20 20 20 20 64 65 6C 61 79 20  ; elay 1    delay 
  11f1  .db 32 20 20 20 20 66 69 6C 74 65 72 20 31 20 20 20  ; 2    filter 1   
  1201  .db 66 69 6C 74 65 72 20 32 20 20 20 64 75 63 6B 65  ; filter 2   ducke
  1211  .db 72 20 31 20 20 20 64 75 63 6B 65 72 20 32 20 20  ; r 1   ducker 2  
  1221  .db 20 65 6E 76 65 6C 6F 70 65 20 31 20 65 6E 76 65  ;  envelope 1 enve
  1231  .db 6C 6F 70 65 20 32 20 6C 66 6F 20 31 20 20 20 20  ; lope 2 lfo 1    
  1241  .db 20 20 6C 66 6F 20 32 20 20 20 20 20 20 6B 6E 6F  ;   lfo 2      kno
  1251  .db 62 20 31 20 20 20 20 20 6B 6E 6F 62 20 32 20 20  ; b 1     knob 2  
  1261  .db 20 20 20 6E 6F 69 73 65 20 67 65 6E 2E 20 66 75  ;    noise gen. fu
  1271  .db 6C 6C 73 63 61 6C 65 20 20 2D 66 75 6C 6C 73 63  ; llscale  -fullsc
  1281  .db 61 6C 65 20 6D 6F 64 73 63 61 6C 65 20 31 20 6D  ; ale modscale 1 m
  1291  .db 6F 64 73 63 61 6C 65 20 32 20                    ; odscale 2 
PTR_FUN_M7A_r3_00000__131e_M7A_r3_00000__129b:
  129b  131E           addr M7A_r3_00000::131e           
  129d  12E5           addr M7A_r3_00000::12e5           
  129f  .db 12 D9 70 42 70 EE 00 00 70 F0 3E D8 3F F1 1E 00  ; ..pBp...p.>.?...
  12af  .db 00 03 E8 00 01 01 05 20 13 09 00 00 00 00 70 44  ; ....... ......pD
  12bf  .db 3F 6B                                            ; ?k

; ---- function FUN_M7A_r3_00000__12c1
FUN_M7A_r3_00000__12c1:
  12c1  3410           PSHS  X                           
  12c3  8E129B         LDX #0x129b                        ; desc[API_FE6A]: ->$131E ->$12E5
  12c6  AD9FFE6A       JSR [0xfe6a]                      
  12ca  3510           PULS  X                           
  12cc  39             RTS                               

; ---- function FUN_M7A_r3_00000__12cd
FUN_M7A_r3_00000__12cd:
  12cd  3410           PSHS  X                           
  12cf  8E129B         LDX #0x129b                        ; desc[API_FDBC]: ->$131E ->$12E5
  12d2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  12d6  3510           PULS  X                           
  12d8  39             RTS                               

; ---- function FUN_M7A_r3_00000__12d9
FUN_M7A_r3_00000__12d9:
  12d9  3410           PSHS  X                           
  12db  8E129B         LDX #0x129b                        ; desc[API_FE6C]: ->$131E ->$12E5
  12de  AD9FFE6C       JSR [0xfe6c]                      
  12e2  3510           PULS  X                           
  12e4  39             RTS                               

; ---- function FUN_M7A_r3_00000__12e5
FUN_M7A_r3_00000__12e5:
  12e5  3410           PSHS  X                           
  12e7  8E129B         LDX #0x129b                        ; desc[API_FE6E]: ->$131E ->$12E5
  12ea  AD9FFE6E       JSR [0xfe6e]                      
  12ee  3510           PULS  X                           
  12f0  39             RTS                               

; ---- function FUN_M7A_r3_00000__12f1
FUN_M7A_r3_00000__12f1:
  12f1  3410           PSHS  X                           
  12f3  8E129B         LDX #0x129b                        ; desc[API_FE1C]: ->$131E ->$12E5
  12f6  AD9FFE1C       JSR [0xfe1c]                      
  12fa  3510           PULS  X                           
  12fc  39             RTS                               

; ---- function FUN_M7A_r3_00000__12fd
FUN_M7A_r3_00000__12fd:
  12fd  3410           PSHS  X                           
  12ff  8E129B         LDX #0x129b                        ; desc[API_FE1A]: ->$131E ->$12E5 $12D9
  1302  AD9FFE1A       JSR [0xfe1a]                      
  1306  3510           PULS  X                           
  1308  39             RTS                               
  1309  .db 14 6D 6F 64 20 6B 6E 6F 62 20 31 3A 20 20 20 20  ; .mod knob 1:    
  1319  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__131e
FUN_M7A_r3_00000__131e:
  131e  3476           PSHS  U Y X B A                   
  1320  8E129B         LDX #0x129b                       
  1323  AD9FFE76       JSR [0xfe76]                      
  1327  B671F2         LDA 0x71f2                        
  132a  270F           BEQ 0x133b                        
  132c  4F             CLRA                              
  132d  B771F2         STA 0x71f2                        
  1330  5F             CLRB                              
  1331  FD71EE         STD 0x71ee                        
  1334  C601           LDB #0x1                          
  1336  FD71F0         STD 0x71f0                        
  1339  2033           BRA 0x136e                        
LAB_M7A_r3_00000__133b:
  133b  8E0001         LDX #0x1                          
  133e  108E074F       LDY #0x74f                        
  1342  17FBB8         LBSR 0x0efd                       
  1345  CC0064         LDD #0x64                         
  1348  AD9FFD20       JSR [0xfd20]                      
  134c  AD9FFD42       JSR [0xfd42]                      
  1350  1F89           TFR A,B                           
  1352  4F             CLRA                              
  1353  FD71F0         STD 0x71f0                        
  1356  10270062       LBEQ 0x13bc                       
  135a  8E0000         LDX #0x0                          
  135d  108E077C       LDY #0x77c                        
  1361  17FB99         LBSR 0x0efd                       
  1364  8E0000         LDX #0x0                          
  1367  108E0000       LDY #0x0                          
  136b  17FB8F         LBSR 0x0efd                       
LAB_M7A_r3_00000__136e:
  136e  FC70F0         LDD 0x70f0                        
  1371  3606           PSHU  B A                         
  1373  AD9FFEC6       JSR [0xfec6]                      
  1377  3706           PULU  A B                         
  1379  FD71EC         STD 0x71ec                        
  137c  FC71EC         LDD 0x71ec                        
  137f  B371EE         SUBD 0x71ee                       
  1382  10270036       LBEQ 0x13bc                       
  1386  3606           PSHU  B A                         
  1388  AD9FFCC8       JSR [0xfcc8]                      
  138c  FC71F0         LDD 0x71f0                        
  138f  3606           PSHU  B A                         
  1391  AD9FFCEA       JSR [0xfcea]                      
  1395  3706           PULU  A B                         
  1397  FD70DE         STD 0x70de                        
  139a  2606           BNE 0x13a2                        
  139c  CC0001         LDD #0x1                          
  139f  FD70DE         STD 0x70de                        
LAB_M7A_r3_00000__13a2:
  13a2  BE71EC         LDX 0x71ec                        
  13a5  108E077A       LDY #0x77a                        
  13a9  17FB51         LBSR 0x0efd                       
  13ac  BE70DE         LDX 0x70de                        
  13af  108E077B       LDY #0x77b                        
  13b3  17FB47         LBSR 0x0efd                       
  13b6  FC71EC         LDD 0x71ec                        
  13b9  FD71EE         STD 0x71ee                        
LAB_M7A_r3_00000__13bc:
  13bc  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1441_M7A_r3_00000__13be:
  13be  1441           addr M7A_r3_00000::1441           
  13c0  1408           addr M7A_r3_00000::1408           
  13c2  .db 13 FC 70 46 70 F2 00 00 70 F4 3E D8 3F F3 1F 00  ; ..pFp...p.>.?...
  13d2  .db 00 03 E8 00 01 01 05 20 14 2C 00 00 00 00 70 48  ; ....... .,....pH
  13e2  .db 3F 6D                                            ; ?m

; ---- function FUN_M7A_r3_00000__13e4
FUN_M7A_r3_00000__13e4:
  13e4  3410           PSHS  X                           
  13e6  8E13BE         LDX #0x13be                        ; desc[API_FE6A]: ->$1441 ->$1408
  13e9  AD9FFE6A       JSR [0xfe6a]                      
  13ed  3510           PULS  X                           
  13ef  39             RTS                               

; ---- function FUN_M7A_r3_00000__13f0
FUN_M7A_r3_00000__13f0:
  13f0  3410           PSHS  X                           
  13f2  8E13BE         LDX #0x13be                        ; desc[API_FDBC]: ->$1441 ->$1408
  13f5  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  13f9  3510           PULS  X                           
  13fb  39             RTS                               

; ---- function FUN_M7A_r3_00000__13fc
FUN_M7A_r3_00000__13fc:
  13fc  3410           PSHS  X                           
  13fe  8E13BE         LDX #0x13be                        ; desc[API_FE6C]: ->$1441 ->$1408
  1401  AD9FFE6C       JSR [0xfe6c]                      
  1405  3510           PULS  X                           
  1407  39             RTS                               

; ---- function FUN_M7A_r3_00000__1408
FUN_M7A_r3_00000__1408:
  1408  3410           PSHS  X                           
  140a  8E13BE         LDX #0x13be                        ; desc[API_FE6E]: ->$1441 ->$1408
  140d  AD9FFE6E       JSR [0xfe6e]                      
  1411  3510           PULS  X                           
  1413  39             RTS                               

; ---- function FUN_M7A_r3_00000__1414
FUN_M7A_r3_00000__1414:
  1414  3410           PSHS  X                           
  1416  8E13BE         LDX #0x13be                        ; desc[API_FE1C]: ->$1441 ->$1408
  1419  AD9FFE1C       JSR [0xfe1c]                      
  141d  3510           PULS  X                           
  141f  39             RTS                               

; ---- function FUN_M7A_r3_00000__1420
FUN_M7A_r3_00000__1420:
  1420  3410           PSHS  X                           
  1422  8E13BE         LDX #0x13be                        ; desc[API_FE1A]: ->$1441 ->$1408 $13FC
  1425  AD9FFE1A       JSR [0xfe1a]                      
  1429  3510           PULS  X                           
  142b  39             RTS                               
  142c  .db 14 6D 6F 64 20 6B 6E 6F 62 20 32 3A 20 20 20 20  ; .mod knob 2:    
  143c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__1441
FUN_M7A_r3_00000__1441:
  1441  3476           PSHS  U Y X B A                   
  1443  8E13BE         LDX #0x13be                       
  1446  AD9FFE76       JSR [0xfe76]                      
  144a  B671F9         LDA 0x71f9                        
  144d  270F           BEQ 0x145e                        
  144f  4F             CLRA                              
  1450  B771F9         STA 0x71f9                        
  1453  5F             CLRB                              
  1454  FD71F5         STD 0x71f5                        
  1457  C601           LDB #0x1                          
  1459  FD71F7         STD 0x71f7                        
  145c  2033           BRA 0x1491                        
LAB_M7A_r3_00000__145e:
  145e  8E0002         LDX #0x2                          
  1461  108E074F       LDY #0x74f                        
  1465  17FA95         LBSR 0x0efd                       
  1468  CC0064         LDD #0x64                         
  146b  AD9FFD20       JSR [0xfd20]                      
  146f  AD9FFD42       JSR [0xfd42]                      
  1473  1F89           TFR A,B                           
  1475  4F             CLRA                              
  1476  FD71F7         STD 0x71f7                        
  1479  10270062       LBEQ 0x14df                       
  147d  8E0000         LDX #0x0                          
  1480  108E077F       LDY #0x77f                        
  1484  17FA76         LBSR 0x0efd                       
  1487  8E0000         LDX #0x0                          
  148a  108E0000       LDY #0x0                          
  148e  17FA6C         LBSR 0x0efd                       
LAB_M7A_r3_00000__1491:
  1491  FC70F4         LDD 0x70f4                        
  1494  3606           PSHU  B A                         
  1496  AD9FFEC6       JSR [0xfec6]                      
  149a  3706           PULU  A B                         
  149c  FD71F3         STD 0x71f3                        
  149f  FC71F3         LDD 0x71f3                        
  14a2  B371F5         SUBD 0x71f5                       
  14a5  10270036       LBEQ 0x14df                       
  14a9  3606           PSHU  B A                         
  14ab  AD9FFCC8       JSR [0xfcc8]                      
  14af  FC71F7         LDD 0x71f7                        
  14b2  3606           PSHU  B A                         
  14b4  AD9FFCEA       JSR [0xfcea]                      
  14b8  3706           PULU  A B                         
  14ba  FD70DE         STD 0x70de                        
  14bd  2606           BNE 0x14c5                        
  14bf  CC0001         LDD #0x1                          
  14c2  FD70DE         STD 0x70de                        
LAB_M7A_r3_00000__14c5:
  14c5  BE71F3         LDX 0x71f3                        
  14c8  108E077D       LDY #0x77d                        
  14cc  17FA2E         LBSR 0x0efd                       
  14cf  BE70DE         LDX 0x70de                        
  14d2  108E077E       LDY #0x77e                        
  14d6  17FA24         LBSR 0x0efd                       
  14d9  FC71F3         LDD 0x71f3                        
  14dc  FD71F5         STD 0x71f5                        
LAB_M7A_r3_00000__14df:
  14df  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__154c_M7A_r3_00000__14e1:
  14e1  154C           addr M7A_r3_00000::154c           
  14e3  152B           addr M7A_r3_00000::152b           
  14e5  .db 15 1F 70 4A 70 F6 00 00 70 F8 3E D8 3F F0 20 00  ; ..pJp...p.>.?. .
  14f5  .db 00 00 64 00 01 00 03 19 15 37 00 00 00 00 00 00  ; ..d......7......
  1505  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1507
FUN_M7A_r3_00000__1507:
  1507  3410           PSHS  X                           
  1509  8E14E1         LDX #0x14e1                       
  150c  AD9FFE74       JSR [0xfe74]                      
  1510  3510           PULS  X                           
  1512  39             RTS                               

; ---- function FUN_M7A_r3_00000__1513
FUN_M7A_r3_00000__1513:
  1513  3410           PSHS  X                           
  1515  8E14E1         LDX #0x14e1                        ; desc[API_FE22]: ->$154C ->$152B
  1518  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  151c  3510           PULS  X                           
  151e  39             RTS                               

; ---- function FUN_M7A_r3_00000__151f
FUN_M7A_r3_00000__151f:
  151f  3410           PSHS  X                           
  1521  8E14E1         LDX #0x14e1                       
  1524  AD9FFE70       JSR [0xfe70]                      
  1528  3510           PULS  X                           
  152a  39             RTS                               

; ---- function FUN_M7A_r3_00000__152b
FUN_M7A_r3_00000__152b:
  152b  3410           PSHS  X                           
  152d  8E14E1         LDX #0x14e1                       
  1530  AD9FFE72       JSR [0xfe72]                      
  1534  3510           PULS  X                           
  1536  39             RTS                               
  1537  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  1547  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__154c
FUN_M7A_r3_00000__154c:
  154c  3476           PSHS  U Y X B A                   
  154e  8E14E1         LDX #0x14e1                       
  1551  AD9FFE76       JSR [0xfe76]                      
  1555  CC0064         LDD #0x64                         
  1558  B370F8         SUBD 0x70f8                       
  155b  3606           PSHU  B A                         
  155d  58             LSLB                              
  155e  49             ROLA                              
  155f  FD70DE         STD 0x70de                        
  1562  CC4666         LDD #0x4666                       
  1565  3606           PSHU  B A                         
  1567  AD9FFCF2       JSR [0xfcf2]                      
  156b  3706           PULU  A B                         
  156d  F370DE         ADDD 0x70de                       
  1570  AD9FFC6A       JSR [0xfc6a]                      
  1574  AD9FFC72       JSR [0xfc72]                      
  1578  35F6           PULS  A B X Y U PC                
  157a  .db 14 74 65 6D 70 6F 3A 20 20 20 20 62 65 61 74 73  ; .tempo:    beats
  158a  .db 2F 6D 69 6E 20                                   ; /min 
PTR_FUN_M7A_r3_00000__17da_M7A_r3_00000__158f:
  158f  17DA           addr M7A_r3_00000::17da           
  1591  15D9           addr M7A_r3_00000::15d9           
  1593  .db 15 CD 70 4C 71 04 00 00 71 06 3E D8 3F 83 20 00  ; ..pLq...q.>.?. .
  15a3  .db 1E 00 C8 00 01 00 03 1A 15 7A 00 00 00 00 70 4E  ; .........z....pN
  15b3  .db 3F 85                                            ; ?.

; ---- function FUN_M7A_r3_00000__15b5
FUN_M7A_r3_00000__15b5:
  15b5  3410           PSHS  X                           
  15b7  8E158F         LDX #0x158f                        ; desc[API_FE6A]: ->$17DA ->$15D9
  15ba  AD9FFE6A       JSR [0xfe6a]                      
  15be  3510           PULS  X                           
  15c0  39             RTS                               

; ---- function FUN_M7A_r3_00000__15c1
FUN_M7A_r3_00000__15c1:
  15c1  3410           PSHS  X                           
  15c3  8E158F         LDX #0x158f                        ; desc[API_FDBC]: ->$17DA ->$15D9
  15c6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  15ca  3510           PULS  X                           
  15cc  39             RTS                               

; ---- function FUN_M7A_r3_00000__15cd
FUN_M7A_r3_00000__15cd:
  15cd  3410           PSHS  X                           
  15cf  8E158F         LDX #0x158f                        ; desc[API_FE6C]: ->$17DA ->$15D9
  15d2  AD9FFE6C       JSR [0xfe6c]                      
  15d6  3510           PULS  X                           
  15d8  39             RTS                               

; ---- function FUN_M7A_r3_00000__15d9
FUN_M7A_r3_00000__15d9:
  15d9  3410           PSHS  X                           
  15db  8E158F         LDX #0x158f                        ; desc[API_FE6E]: ->$17DA ->$15D9
  15de  AD9FFE6E       JSR [0xfe6e]                      
  15e2  3510           PULS  X                           
  15e4  39             RTS                               

; ---- function FUN_M7A_r3_00000__15e5
FUN_M7A_r3_00000__15e5:
  15e5  3410           PSHS  X                           
  15e7  8E158F         LDX #0x158f                        ; desc[API_FE1A]: ->$17DA ->$15D9 $15CD
  15ea  AD9FFE1A       JSR [0xfe1a]                      
  15ee  3510           PULS  X                           
  15f0  39             RTS                               

; ---- function FUN_M7A_r3_00000__15f1
FUN_M7A_r3_00000__15f1:
  15f1  3476           PSHS  U Y X B A                   
  15f3  FC7102         LDD 0x7102                        
  15f6  2709           BEQ 0x1601                        
  15f8  C30001         ADDD #0x1                         
  15fb  FD7102         STD 0x7102                        
  15fe  1600DA         LBRA 0x16db                       
LAB_M7A_r3_00000__1601:
  1601  C30001         ADDD #0x1                         
  1604  FD7102         STD 0x7102                        
  1607  CC15D9         LDD #0x15d9                       
  160a  F3600D         ADDD 0x600d                       
  160d  10B36070       CMPD 0x6070                       
  1611  260E           BNE 0x1621                        
  1613  C61A           LDB #0x1a                         
  1615  AD9FFC36       JSR [0xfc36]                      
  1619  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".  "
  161d  2E202000       char[4] ".  "                     
LAB_M7A_r3_00000__1621:
  1621  8E0000         LDX #0x0                          
  1624  108E074C       LDY #0x74c                        
  1628  17F8D2         LBSR 0x0efd                       
  162b  8E0000         LDX #0x0                          
  162e  108E0000       LDY #0x0                          
  1632  17F8C8         LBSR 0x0efd                       
LAB_M7A_r3_00000__1635:
  1635  AD9FFE2A       JSR [0xfe2a]                      
  1639  FC7102         LDD 0x7102                        
  163c  10830002       CMPD #0x2                         
  1640  271F           BEQ 0x1661                        
  1642  8E0004         LDX #0x4                          
  1645  108E074F       LDY #0x74f                        
  1649  17F8B1         LBSR 0x0efd                       
  164c  CC0064         LDD #0x64                         
  164f  AD9FFD20       JSR [0xfd20]                      
  1653  AD9FFD42       JSR [0xfd42]                      
  1657  10837FFF       CMPD #0x7fff                      
  165b  102C0076       LBGE 0x16d5                       
  165f  20D4           BRA 0x1635                        
LAB_M7A_r3_00000__1661:
  1661  8E0000         LDX #0x0                          
  1664  108E074C       LDY #0x74c                        
  1668  17F892         LBSR 0x0efd                       
  166b  8E0000         LDX #0x0                          
  166e  108E0000       LDY #0x0                          
  1672  17F888         LBSR 0x0efd                       
  1675  CC15D9         LDD #0x15d9                       
  1678  F3600D         ADDD 0x600d                       
  167b  10B36070       CMPD 0x6070                       
  167f  260E           BNE 0x168f                        
  1681  C61A           LDB #0x1a                         
  1683  AD9FFC36       JSR [0xfc36]                      
  1687  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".. "
  168b  2E2E2000       char[4] ".. "                     
LAB_M7A_r3_00000__168f:
  168f  AD9FFE2A       JSR [0xfe2a]                      
  1693  FC7102         LDD 0x7102                        
  1696  10830003       CMPD #0x3                         
  169a  2722           BEQ 0x16be                        
  169c  8E0004         LDX #0x4                          
  169f  108E074F       LDY #0x74f                        
  16a3  17F857         LBSR 0x0efd                       
  16a6  CC0064         LDD #0x64                         
  16a9  AD9FFD20       JSR [0xfd20]                      
  16ad  AD9FFD42       JSR [0xfd42]                      
  16b1  FD7100         STD 0x7100                        
  16b4  10837FFF       CMPD #0x7fff                      
  16b8  102C0019       LBGE 0x16d5                       
  16bc  20D1           BRA 0x168f                        
LAB_M7A_r3_00000__16be:
  16be  170148         LBSR 0x1809                       
  16c1  CC15D9         LDD #0x15d9                       
  16c4  F3600D         ADDD 0x600d                       
  16c7  10B36070       CMPD 0x6070                       
  16cb  2603           BNE 0x16d0                        
  16cd  17FEE5         LBSR 0x15b5                       
LAB_M7A_r3_00000__16d0:
  16d0  170107         LBSR 0x17da                       
  16d3  2000           BRA 0x16d5                        
LAB_M7A_r3_00000__16d5:
  16d5  CC0000         LDD #0x0                          
  16d8  FD7102         STD 0x7102                        
LAB_M7A_r3_00000__16db:
  16db  FC7102         LDD 0x7102                        
  16de  10830003       CMPD #0x3                         
  16e2  2F06           BLE 0x16ea                        
  16e4  CC0000         LDD #0x0                          
  16e7  FD7102         STD 0x7102                        
LAB_M7A_r3_00000__16ea:
  16ea  3576           PULS  A B X Y U                   
  16ec  39             RTS                               

; ---- function FUN_M7A_r3_00000__16ed
FUN_M7A_r3_00000__16ed:
  16ed  3476           PSHS  U Y X B A                   
  16ef  CC15D9         LDD #0x15d9                       
  16f2  F3600D         ADDD 0x600d                       
  16f5  10B36070       CMPD 0x6070                       
  16f9  10270009       LBEQ 0x1706                       
  16fd  CC0000         LDD #0x0                          
  1700  FD70FE         STD 0x70fe                        
  1703  160015         LBRA 0x171b                       
LAB_M7A_r3_00000__1706:
  1706  FC70FE         LDD 0x70fe                        
  1709  C30001         ADDD #0x1                         
  170c  FD70FE         STD 0x70fe                        
  170f  10830001       CMPD #0x1                         
  1713  2C00           BGE 0x1715                        
LAB_M7A_r3_00000__1715:
  1715  170008         LBSR 0x1720                       
  1718  1700BF         LBSR 0x17da                       
LAB_M7A_r3_00000__171b:
  171b  17FE97         LBSR 0x15b5                       
  171e  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__1720
FUN_M7A_r3_00000__1720:
  1720  3436           PSHS  Y X B A                     
  1722  C61A           LDB #0x1a                         
  1724  AD9FFC36       JSR [0xfc36]                      
  1728  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".  "
  172c  2E202000       char[4] ".  "                     
LAB_M7A_r3_00000__1730:
  1730  8E0000         LDX #0x0                          
  1733  108E074C       LDY #0x74c                        
  1737  17F7C3         LBSR 0x0efd                       
  173a  8E0000         LDX #0x0                          
  173d  108E0000       LDY #0x0                          
  1741  17F7B9         LBSR 0x0efd                       
LAB_M7A_r3_00000__1744:
  1744  AD9FFC1A       JSR [0xfc1a]                      
  1748  5D             TSTB                              
  1749  26F9           BNE 0x1744                        
LAB_M7A_r3_00000__174b:
  174b  AD9FFC1A       JSR [0xfc1a]                      
  174f  C101           CMPB #0x1                         
  1751  2725           BEQ 0x1778                        
  1753  C100           CMPB #0x0                         
  1755  1026007B       LBNE 0x17d4                       
  1759  8E0004         LDX #0x4                          
  175c  108E074F       LDY #0x74f                        
  1760  17F79A         LBSR 0x0efd                       
  1763  CC0064         LDD #0x64                         
  1766  AD9FFD20       JSR [0xfd20]                      
  176a  AD9FFD42       JSR [0xfd42]                      
  176e  10837FFF       CMPD #0x7fff                      
  1772  102C0062       LBGE 0x17d8                       
  1776  20D3           BRA 0x174b                        
LAB_M7A_r3_00000__1778:
  1778  8E0000         LDX #0x0                          
  177b  108E074C       LDY #0x74c                        
  177f  17F77B         LBSR 0x0efd                       
  1782  8E0000         LDX #0x0                          
  1785  108E0000       LDY #0x0                          
  1789  17F771         LBSR 0x0efd                       
  178c  C61A           LDB #0x1a                         
  178e  AD9FFC36       JSR [0xfc36]                      
  1792  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".. "
  1796  2E2E2000       char[4] ".. "                     
LAB_M7A_r3_00000__179a:
  179a  AD9FFC1A       JSR [0xfc1a]                      
  179e  5D             TSTB                              
  179f  26F9           BNE 0x179a                        
LAB_M7A_r3_00000__17a1:
  17a1  AD9FFC1A       JSR [0xfc1a]                      
  17a5  C101           CMPB #0x1                         
  17a7  2726           BEQ 0x17cf                        
  17a9  C100           CMPB #0x0                         
  17ab  10260025       LBNE 0x17d4                       
  17af  8E0004         LDX #0x4                          
  17b2  108E074F       LDY #0x74f                        
  17b6  17F744         LBSR 0x0efd                       
  17b9  CC0064         LDD #0x64                         
  17bc  AD9FFD20       JSR [0xfd20]                      
  17c0  AD9FFD42       JSR [0xfd42]                      
  17c4  FD7100         STD 0x7100                        
  17c7  10837FFF       CMPD #0x7fff                      
  17cb  2C0B           BGE 0x17d8                        
  17cd  20D2           BRA 0x17a1                        
LAB_M7A_r3_00000__17cf:
  17cf  170037         LBSR 0x1809                       
  17d2  2004           BRA 0x17d8                        
LAB_M7A_r3_00000__17d4:
  17d4  AD9FFEA2       JSR [0xfea2]                      
LAB_M7A_r3_00000__17d8:
  17d8  35B6           PULS  A B X Y PC                  

; ---- function FUN_M7A_r3_00000__17da
FUN_M7A_r3_00000__17da:
  17da  3476           PSHS  U Y X B A                   
  17dc  8E158F         LDX #0x158f                       
  17df  AD9FFE76       JSR [0xfe76]                      
  17e3  CC09C4         LDD #0x9c4                        
  17e6  3606           PSHU  B A                         
  17e8  FC7106         LDD 0x7106                        
  17eb  3606           PSHU  B A                         
  17ed  AD9FFCEA       JSR [0xfcea]                      
  17f1  3706           PULU  A B                         
  17f3  FD70FA         STD 0x70fa                        
  17f6  3706           PULU  A B                         
  17f8  FD70FC         STD 0x70fc                        
  17fb  17078A         LBSR 0x1f88                       
  17fe  17082E         LBSR 0x202f                       
  1801  170E98         LBSR 0x269c                       
  1804  170F34         LBSR 0x273b                       
  1807  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__1809
FUN_M7A_r3_00000__1809:
  1809  CC50C0         LDD #0x50c0                       
  180c  3606           PSHU  B A                         
  180e  FC7100         LDD 0x7100                        
  1811  47             ASRA                              
  1812  56             RORB                              
  1813  47             ASRA                              
  1814  56             RORB                              
  1815  47             ASRA                              
  1816  56             RORB                              
  1817  47             ASRA                              
  1818  56             RORB                              
  1819  47             ASRA                              
  181a  56             RORB                              
  181b  3606           PSHU  B A                         
  181d  AD9FFCEA       JSR [0xfcea]                      
  1821  3706           PULU  A B                         
  1823  FD70DE         STD 0x70de                        
  1826  CC001E         LDD #0x1e                         
  1829  3606           PSHU  B A                         
  182b  CC00C8         LDD #0xc8                         
  182e  3606           PSHU  B A                         
  1830  FC70DE         LDD 0x70de                        
  1833  3606           PSHU  B A                         
  1835  AD9FFCD8       JSR [0xfcd8]                      
  1839  3706           PULU  A B                         
  183b  FD704C         STD 0x704c                        
  183e  FD7106         STD 0x7106                        
  1841  39             RTS                               
PTR_FUN_M7A_r3_00000__18bf_M7A_r3_00000__1842:
  1842  18BF           addr M7A_r3_00000::18bf           
  1844  188C           addr M7A_r3_00000::188c           
  1846  .db 18 80 70 50 71 08 00 00 71 0A 3E D8 3F DD 22 00  ; ..pPq...q.>.?.".
  1856  .db 00 1B 58 00 01 00 04 1E 18 98 00 00 00 00 00 00  ; ..X.............
  1866  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1868
FUN_M7A_r3_00000__1868:
  1868  3410           PSHS  X                           
  186a  8E1842         LDX #0x1842                        ; desc[API_FE6A]: ->$18BF ->$188C
  186d  AD9FFE6A       JSR [0xfe6a]                      
  1871  3510           PULS  X                           
  1873  39             RTS                               

; ---- function FUN_M7A_r3_00000__1874
FUN_M7A_r3_00000__1874:
  1874  3410           PSHS  X                           
  1876  8E1842         LDX #0x1842                        ; desc[API_FDBC]: ->$18BF ->$188C
  1879  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...B"
  187d  3510           PULS  X                           
  187f  39             RTS                               

; ---- function FUN_M7A_r3_00000__1880
FUN_M7A_r3_00000__1880:
  1880  3410           PSHS  X                           
  1882  8E1842         LDX #0x1842                        ; desc[API_FE6C]: ->$18BF ->$188C
  1885  AD9FFE6C       JSR [0xfe6c]                      
  1889  3510           PULS  X                           
  188b  39             RTS                               

; ---- function FUN_M7A_r3_00000__188c
FUN_M7A_r3_00000__188c:
  188c  3410           PSHS  X                           
  188e  8E1842         LDX #0x1842                        ; desc[API_FE6E]: ->$18BF ->$188C
  1891  AD9FFE6E       JSR [0xfe6e]                      
  1895  3510           PULS  X                           
  1897  39             RTS                               
  1898  .db 14 63 75 74 6F 66 66 20 31 3A 20 20 20 20 20 20  ; .cutoff 1:      
  18a8  .db 48 7A 20 20 20                                   ; Hz   

; ---- function FUN_M7A_r3_00000__18ad
FUN_M7A_r3_00000__18ad:
  18ad  3406           PSHS  B A                         
  18af  17FFB6         LBSR 0x1868                       
  18b2  C605           LDB #0x5                          
  18b4  F76066         STB 0x6066                        
  18b7  CC0064         LDD #0x64                         
  18ba  FD60DC         STD 0x60dc                        
  18bd  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__18bf
FUN_M7A_r3_00000__18bf:
  18bf  3476           PSHS  U Y X B A                   
  18c1  8E1842         LDX #0x1842                       
  18c4  AD9FFE76       JSR [0xfe76]                      
  18c8  FC710A         LDD 0x710a                        
  18cb  3606           PSHU  B A                         
  18cd  CC0004         LDD #0x4                          
  18d0  3606           PSHU  B A                         
  18d2  AD9FFCEE       JSR [0xfcee]                      
  18d6  FC710A         LDD 0x710a                        
  18d9  3606           PSHU  B A                         
  18db  CC5591         LDD #0x5591                       
  18de  3606           PSHU  B A                         
  18e0  AD9FFCF2       JSR [0xfcf2]                      
  18e4  AD9FFCE2       JSR [0xfce2]                      
  18e8  3706           PULU  A B                         
  18ea  FD70DE         STD 0x70de                        
  18ed  BE70DE         LDX 0x70de                        
  18f0  108E0760       LDY #0x760                        
  18f4  17F606         LBSR 0x0efd                       
  18f7  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1976_M7A_r3_00000__18f9:
  18f9  1976           addr M7A_r3_00000::1976           
  18fb  1943           addr M7A_r3_00000::1943           
  18fd  .db 19 37 70 52 71 0C 00 00 71 0E 3E D8 3F DF 23 00  ; .7pRq...q.>.?.#.
  190d  .db 00 1B 58 00 01 00 04 1E 19 4F 00 00 00 00 00 00  ; ..X......O......
  191d  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__191f
FUN_M7A_r3_00000__191f:
  191f  3410           PSHS  X                           
  1921  8E18F9         LDX #0x18f9                        ; desc[API_FE6A]: ->$1976 ->$1943
  1924  AD9FFE6A       JSR [0xfe6a]                      
  1928  3510           PULS  X                           
  192a  39             RTS                               

; ---- function FUN_M7A_r3_00000__192b
FUN_M7A_r3_00000__192b:
  192b  3410           PSHS  X                           
  192d  8E18F9         LDX #0x18f9                        ; desc[API_FDBC]: ->$1976 ->$1943
  1930  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1934  3510           PULS  X                           
  1936  39             RTS                               

; ---- function FUN_M7A_r3_00000__1937
FUN_M7A_r3_00000__1937:
  1937  3410           PSHS  X                           
  1939  8E18F9         LDX #0x18f9                        ; desc[API_FE6C]: ->$1976 ->$1943
  193c  AD9FFE6C       JSR [0xfe6c]                      
  1940  3510           PULS  X                           
  1942  39             RTS                               

; ---- function FUN_M7A_r3_00000__1943
FUN_M7A_r3_00000__1943:
  1943  3410           PSHS  X                           
  1945  8E18F9         LDX #0x18f9                        ; desc[API_FE6E]: ->$1976 ->$1943
  1948  AD9FFE6E       JSR [0xfe6e]                      
  194c  3510           PULS  X                           
  194e  39             RTS                               
  194f  .db 14 63 75 74 6F 66 66 20 32 3A 20 20 20 20 20 20  ; .cutoff 2:      
  195f  .db 48 7A 20 20 20                                   ; Hz   

; ---- function FUN_M7A_r3_00000__1964
FUN_M7A_r3_00000__1964:
  1964  3406           PSHS  B A                         
  1966  17FFB6         LBSR 0x191f                       
  1969  C605           LDB #0x5                          
  196b  F76066         STB 0x6066                        
  196e  CC0064         LDD #0x64                         
  1971  FD60DC         STD 0x60dc                        
  1974  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__1976
FUN_M7A_r3_00000__1976:
  1976  3476           PSHS  U Y X B A                   
  1978  8E18F9         LDX #0x18f9                       
  197b  AD9FFE76       JSR [0xfe76]                      
  197f  FC710E         LDD 0x710e                        
  1982  3606           PSHU  B A                         
  1984  CC0004         LDD #0x4                          
  1987  3606           PSHU  B A                         
  1989  AD9FFCEE       JSR [0xfcee]                      
  198d  FC710E         LDD 0x710e                        
  1990  3606           PSHU  B A                         
  1992  CC5591         LDD #0x5591                       
  1995  3606           PSHU  B A                         
  1997  AD9FFCF2       JSR [0xfcf2]                      
  199b  AD9FFCE2       JSR [0xfce2]                      
  199f  3706           PULU  A B                         
  19a1  FD70DE         STD 0x70de                        
  19a4  BE70DE         LDX 0x70de                        
  19a7  108E0764       LDY #0x764                        
  19ab  17F54F         LBSR 0x0efd                       
  19ae  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1a1b_M7A_r3_00000__19b0:
  19b0  1A1B           addr M7A_r3_00000::1a1b           
  19b2  19FA           addr M7A_r3_00000::19fa           
  19b4  .db 19 EE 70 54 71 10 00 00 71 12 3E D8 3F E1 24 00  ; ..pTq...q.>.?.$.
  19c4  .db 01 03 E8 00 01 00 04 1F 1A 06 00 00 00 00 00 00  ; ................
  19d4  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__19d6
FUN_M7A_r3_00000__19d6:
  19d6  3410           PSHS  X                           
  19d8  8E19B0         LDX #0x19b0                        ; desc[API_FE6A]: ->$1A1B ->$19FA
  19db  AD9FFE6A       JSR [0xfe6a]                      
  19df  3510           PULS  X                           
  19e1  39             RTS                               

; ---- function FUN_M7A_r3_00000__19e2
FUN_M7A_r3_00000__19e2:
  19e2  3410           PSHS  X                           
  19e4  8E19B0         LDX #0x19b0                        ; desc[API_FDBC]: ->$1A1B ->$19FA
  19e7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  19eb  3510           PULS  X                           
  19ed  39             RTS                               

; ---- function FUN_M7A_r3_00000__19ee
FUN_M7A_r3_00000__19ee:
  19ee  3410           PSHS  X                           
  19f0  8E19B0         LDX #0x19b0                        ; desc[API_FE6C]: ->$1A1B ->$19FA
  19f3  AD9FFE6C       JSR [0xfe6c]                      
  19f7  3510           PULS  X                           
  19f9  39             RTS                               

; ---- function FUN_M7A_r3_00000__19fa
FUN_M7A_r3_00000__19fa:
  19fa  3410           PSHS  X                           
  19fc  8E19B0         LDX #0x19b0                        ; desc[API_FE6E]: ->$1A1B ->$19FA
  19ff  AD9FFE6E       JSR [0xfe6e]                      
  1a03  3510           PULS  X                           
  1a05  39             RTS                               
  1a06  .db 14 71 20 66 61 63 74 6F 72 20 31 3A 20 20 20 20  ; .q factor 1:    
  1a16  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__1a1b
FUN_M7A_r3_00000__1a1b:
  1a1b  3476           PSHS  U Y X B A                   
  1a1d  8E19B0         LDX #0x19b0                       
  1a20  AD9FFE76       JSR [0xfe76]                      
  1a24  FC7112         LDD 0x7112                        
  1a27  3606           PSHU  B A                         
  1a29  CC0020         LDD #0x20                         
  1a2c  3606           PSHU  B A                         
  1a2e  AD9FFCEE       JSR [0xfcee]                      
  1a32  3706           PULU  A B                         
  1a34  FD70DE         STD 0x70de                        
  1a37  FC7112         LDD 0x7112                        
  1a3a  3606           PSHU  B A                         
  1a3c  CC622C         LDD #0x622c                       
  1a3f  3606           PSHU  B A                         
  1a41  AD9FFCF2       JSR [0xfcf2]                      
  1a45  3706           PULU  A B                         
  1a47  F370DE         ADDD 0x70de                       
  1a4a  837FFF         SUBD #0x7fff                      
  1a4d  FD70DE         STD 0x70de                        
  1a50  BE70DE         LDX 0x70de                        
  1a53  108E0761       LDY #0x761                        
  1a57  17F4A3         LBSR 0x0efd                       
  1a5a  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1ac7_M7A_r3_00000__1a5c:
  1a5c  1AC7           addr M7A_r3_00000::1ac7           
  1a5e  1AA6           addr M7A_r3_00000::1aa6           
  1a60  .db 1A 9A 70 56 71 14 00 00 71 16 3E D8 3F E3 25 00  ; ..pVq...q.>.?.%.
  1a70  .db 01 03 E8 00 01 00 04 1F 1A B2 00 00 00 00 00 00  ; ................
  1a80  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1a82
FUN_M7A_r3_00000__1a82:
  1a82  3410           PSHS  X                           
  1a84  8E1A5C         LDX #0x1a5c                        ; desc[API_FE6A]: ->$1AC7 ->$1AA6
  1a87  AD9FFE6A       JSR [0xfe6a]                      
  1a8b  3510           PULS  X                           
  1a8d  39             RTS                               

; ---- function FUN_M7A_r3_00000__1a8e
FUN_M7A_r3_00000__1a8e:
  1a8e  3410           PSHS  X                           
  1a90  8E1A5C         LDX #0x1a5c                        ; desc[API_FDBC]: ->$1AC7 ->$1AA6
  1a93  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...\"
  1a97  3510           PULS  X                           
  1a99  39             RTS                               

; ---- function FUN_M7A_r3_00000__1a9a
FUN_M7A_r3_00000__1a9a:
  1a9a  3410           PSHS  X                           
  1a9c  8E1A5C         LDX #0x1a5c                        ; desc[API_FE6C]: ->$1AC7 ->$1AA6
  1a9f  AD9FFE6C       JSR [0xfe6c]                      
  1aa3  3510           PULS  X                           
  1aa5  39             RTS                               

; ---- function FUN_M7A_r3_00000__1aa6
FUN_M7A_r3_00000__1aa6:
  1aa6  3410           PSHS  X                           
  1aa8  8E1A5C         LDX #0x1a5c                        ; desc[API_FE6E]: ->$1AC7 ->$1AA6
  1aab  AD9FFE6E       JSR [0xfe6e]                      
  1aaf  3510           PULS  X                           
  1ab1  39             RTS                               
  1ab2  .db 14 71 20 66 61 63 74 6F 72 20 32 3A 20 20 20 20  ; .q factor 2:    
  1ac2  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__1ac7
FUN_M7A_r3_00000__1ac7:
  1ac7  3476           PSHS  U Y X B A                   
  1ac9  8E1A5C         LDX #0x1a5c                       
  1acc  AD9FFE76       JSR [0xfe76]                      
  1ad0  FC7116         LDD 0x7116                        
  1ad3  3606           PSHU  B A                         
  1ad5  CC0020         LDD #0x20                         
  1ad8  3606           PSHU  B A                         
  1ada  AD9FFCEE       JSR [0xfcee]                      
  1ade  3706           PULU  A B                         
  1ae0  FD70DE         STD 0x70de                        
  1ae3  FC7116         LDD 0x7116                        
  1ae6  3606           PSHU  B A                         
  1ae8  CC622C         LDD #0x622c                       
  1aeb  3606           PSHU  B A                         
  1aed  AD9FFCF2       JSR [0xfcf2]                      
  1af1  3706           PULU  A B                         
  1af3  F370DE         ADDD 0x70de                       
  1af6  837FFF         SUBD #0x7fff                      
  1af9  FD70DE         STD 0x70de                        
  1afc  BE70DE         LDX 0x70de                        
  1aff  108E0765       LDY #0x765                        
  1b03  17F3F7         LBSR 0x0efd                       
  1b06  35F6           PULS  A B X Y U PC                
  1b08  1B721B521B46   addr[3]                           
  1b0e  .db 70 58 71 18 00 00 71 1A 3E D8 3F ED 26 00 00 00  ; pXq...q.>.?.&...
  1b1e  .db 02 00 01 00 09 1F 1B 5E 00 00 1C 18 00 00 00 00  ; .......^........

; ---- function FUN_M7A_r3_00000__1b2e
FUN_M7A_r3_00000__1b2e:
  1b2e  3410           PSHS  X                           
  1b30  8E1B08         LDX #0x1b08                       
  1b33  AD9FFC4E       JSR [0xfc4e]                      
  1b37  3510           PULS  X                           
  1b39  39             RTS                               

; ---- function FUN_M7A_r3_00000__1b3a
FUN_M7A_r3_00000__1b3a:
  1b3a  3410           PSHS  X                           
  1b3c  8E1B08         LDX #0x1b08                       
  1b3f  AD9FFC4C       JSR [0xfc4c]                      
  1b43  3510           PULS  X                           
  1b45  39             RTS                               

; ---- function FUN_M7A_r3_00000__1b46
FUN_M7A_r3_00000__1b46:
  1b46  3410           PSHS  X                           
  1b48  8E1B08         LDX #0x1b08                       
  1b4b  AD9FFC50       JSR [0xfc50]                      
  1b4f  3510           PULS  X                           
  1b51  39             RTS                               

; ---- function FUN_M7A_r3_00000__1b52
FUN_M7A_r3_00000__1b52:
  1b52  3410           PSHS  X                           
  1b54  8E1B08         LDX #0x1b08                       
  1b57  AD9FFC52       JSR [0xfc52]                      
  1b5b  3510           PULS  X                           
  1b5d  39             RTS                               
  1b5e  .db 14 66 69 6C 74 31 20 74 79 70 65 3A 20 20 20 20  ; .filt1 type:    
  1b6e  .db 20 20 20 20                                      ;     

; ---- function FUN_M7A_r3_00000__1b72
FUN_M7A_r3_00000__1b72:
  1b72  3476           PSHS  U Y X B A                   
  1b74  8E1B08         LDX #0x1b08                       
  1b77  AD9FFE76       JSR [0xfe76]                      
  1b7b  FC711A         LDD 0x711a                        
  1b7e  C30015         ADDD #0x15                        
  1b81  FD70DE         STD 0x70de                        
  1b84  BE70DE         LDX 0x70de                        
  1b87  108E0763       LDY #0x763                        
  1b8b  17F36F         LBSR 0x0efd                       
  1b8e  35F6           PULS  A B X Y U PC                
  1b90  1BFA1BDA1BCE   addr[3]                           
  1b96  .db 70 5A 71 1C 00 00 71 1E 3E D8 3F EE 27 00 00 00  ; pZq...q.>.?.'...
  1ba6  .db 02 00 01 00 09 1F 1B E6 00 00 1C 18 00 00 00 00  ; ................

; ---- function FUN_M7A_r3_00000__1bb6
FUN_M7A_r3_00000__1bb6:
  1bb6  3410           PSHS  X                           
  1bb8  8E1B90         LDX #0x1b90                       
  1bbb  AD9FFC4E       JSR [0xfc4e]                      
  1bbf  3510           PULS  X                           
  1bc1  39             RTS                               

; ---- function FUN_M7A_r3_00000__1bc2
FUN_M7A_r3_00000__1bc2:
  1bc2  3410           PSHS  X                           
  1bc4  8E1B90         LDX #0x1b90                       
  1bc7  AD9FFC4C       JSR [0xfc4c]                      
  1bcb  3510           PULS  X                           
  1bcd  39             RTS                               

; ---- function FUN_M7A_r3_00000__1bce
FUN_M7A_r3_00000__1bce:
  1bce  3410           PSHS  X                           
  1bd0  8E1B90         LDX #0x1b90                       
  1bd3  AD9FFC50       JSR [0xfc50]                      
  1bd7  3510           PULS  X                           
  1bd9  39             RTS                               

; ---- function FUN_M7A_r3_00000__1bda
FUN_M7A_r3_00000__1bda:
  1bda  3410           PSHS  X                           
  1bdc  8E1B90         LDX #0x1b90                       
  1bdf  AD9FFC52       JSR [0xfc52]                      
  1be3  3510           PULS  X                           
  1be5  39             RTS                               
  1be6  .db 14 66 69 6C 74 32 20 74 79 70 65 3A 20 20 20 20  ; .filt2 type:    
  1bf6  .db 20 20 20 20                                      ;     

; ---- function FUN_M7A_r3_00000__1bfa
FUN_M7A_r3_00000__1bfa:
  1bfa  3476           PSHS  U Y X B A                   
  1bfc  8E1B90         LDX #0x1b90                       
  1bff  AD9FFE76       JSR [0xfe76]                      
  1c03  FC711E         LDD 0x711e                        
  1c06  C30019         ADDD #0x19                        
  1c09  FD70DE         STD 0x70de                        
  1c0c  BE70DE         LDX 0x70de                        
  1c0f  108E0767       LDY #0x767                        
  1c13  17F2E7         LBSR 0x0efd                       
  1c16  35F6           PULS  A B X Y U PC                
  1c18  .db 6C 6F 77 70 61 73 73 20 20 62 61 6E 64 70 61 73  ; lowpass  bandpas
  1c28  .db 73 20 68 69 67 68 70 61 73 73 20                 ; s highpass 
PTR_FUN_M7A_r3_00000__1cb0_M7A_r3_00000__1c33:
  1c33  1CB0           addr M7A_r3_00000::1cb0           
  1c35  1C7D           addr M7A_r3_00000::1c7d           
  1c37  .db 1C 71 70 5C 71 20 00 00 71 22 3E D8 3F E5 28 E4  ; .qp\q ..q">.?.(.
  1c47  .db A8 1B 58 00 01 00 05 1F 1C 89 00 00 00 00 00 00  ; ..X.............
  1c57  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1c59
FUN_M7A_r3_00000__1c59:
  1c59  3410           PSHS  X                           
  1c5b  8E1C33         LDX #0x1c33                        ; desc[API_FE6A]: ->$1CB0 ->$1C7D
  1c5e  AD9FFE6A       JSR [0xfe6a]                      
  1c62  3510           PULS  X                           
  1c64  39             RTS                               

; ---- function FUN_M7A_r3_00000__1c65
FUN_M7A_r3_00000__1c65:
  1c65  3410           PSHS  X                           
  1c67  8E1C33         LDX #0x1c33                        ; desc[API_FDBC]: ->$1CB0 ->$1C7D
  1c6a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...3"
  1c6e  3510           PULS  X                           
  1c70  39             RTS                               

; ---- function FUN_M7A_r3_00000__1c71
FUN_M7A_r3_00000__1c71:
  1c71  3410           PSHS  X                           
  1c73  8E1C33         LDX #0x1c33                        ; desc[API_FE6C]: ->$1CB0 ->$1C7D
  1c76  AD9FFE6C       JSR [0xfe6c]                      
  1c7a  3510           PULS  X                           
  1c7c  39             RTS                               

; ---- function FUN_M7A_r3_00000__1c7d
FUN_M7A_r3_00000__1c7d:
  1c7d  3410           PSHS  X                           
  1c7f  8E1C33         LDX #0x1c33                        ; desc[API_FE6E]: ->$1CB0 ->$1C7D
  1c82  AD9FFE6E       JSR [0xfe6e]                      
  1c86  3510           PULS  X                           
  1c88  39             RTS                               
  1c89  .db 14 66 69 6C 74 20 31 20 6D 6F 64 3A 20 20 20 20  ; .filt 1 mod:    
  1c99  .db 20 20 48 7A 20                                   ;   Hz 

; ---- function FUN_M7A_r3_00000__1c9e
FUN_M7A_r3_00000__1c9e:
  1c9e  3406           PSHS  B A                         
  1ca0  17FFB6         LBSR 0x1c59                       
  1ca3  C605           LDB #0x5                          
  1ca5  F76066         STB 0x6066                        
  1ca8  CC0064         LDD #0x64                         
  1cab  FD60DC         STD 0x60dc                        
  1cae  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__1cb0
FUN_M7A_r3_00000__1cb0:
  1cb0  3476           PSHS  U Y X B A                   
  1cb2  8E1C33         LDX #0x1c33                       
  1cb5  AD9FFE76       JSR [0xfe76]                      
  1cb9  FC7122         LDD 0x7122                        
  1cbc  3606           PSHU  B A                         
  1cbe  CC0004         LDD #0x4                          
  1cc1  3606           PSHU  B A                         
  1cc3  AD9FFCEC       JSR [0xfcec]                      
  1cc7  FC7122         LDD 0x7122                        
  1cca  3606           PSHU  B A                         
  1ccc  CC5591         LDD #0x5591                       
  1ccf  3606           PSHU  B A                         
  1cd1  AD9FFCF2       JSR [0xfcf2]                      
  1cd5  AD9FFCE2       JSR [0xfce2]                      
  1cd9  3706           PULU  A B                         
  1cdb  FD70DE         STD 0x70de                        
  1cde  BE70DE         LDX 0x70de                        
  1ce1  108E0762       LDY #0x762                        
  1ce5  17F215         LBSR 0x0efd                       
  1ce8  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1d67_M7A_r3_00000__1cea:
  1cea  1D67           addr M7A_r3_00000::1d67           
  1cec  1D34           addr M7A_r3_00000::1d34           
  1cee  .db 1D 28 70 5E 71 24 00 00 71 26 3E D8 3F E7 29 E4  ; .(p^q$..q&>.?.).
  1cfe  .db A8 1B 58 00 01 00 05 1F 1D 40 00 00 00 00 00 00  ; ..X......@......
  1d0e  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1d10
FUN_M7A_r3_00000__1d10:
  1d10  3410           PSHS  X                           
  1d12  8E1CEA         LDX #0x1cea                        ; desc[API_FE6A]: ->$1D67 ->$1D34
  1d15  AD9FFE6A       JSR [0xfe6a]                      
  1d19  3510           PULS  X                           
  1d1b  39             RTS                               

; ---- function FUN_M7A_r3_00000__1d1c
FUN_M7A_r3_00000__1d1c:
  1d1c  3410           PSHS  X                           
  1d1e  8E1CEA         LDX #0x1cea                        ; desc[API_FDBC]: ->$1D67 ->$1D34
  1d21  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1d25  3510           PULS  X                           
  1d27  39             RTS                               

; ---- function FUN_M7A_r3_00000__1d28
FUN_M7A_r3_00000__1d28:
  1d28  3410           PSHS  X                           
  1d2a  8E1CEA         LDX #0x1cea                        ; desc[API_FE6C]: ->$1D67 ->$1D34
  1d2d  AD9FFE6C       JSR [0xfe6c]                      
  1d31  3510           PULS  X                           
  1d33  39             RTS                               

; ---- function FUN_M7A_r3_00000__1d34
FUN_M7A_r3_00000__1d34:
  1d34  3410           PSHS  X                           
  1d36  8E1CEA         LDX #0x1cea                        ; desc[API_FE6E]: ->$1D67 ->$1D34
  1d39  AD9FFE6E       JSR [0xfe6e]                      
  1d3d  3510           PULS  X                           
  1d3f  39             RTS                               
  1d40  .db 14 66 69 6C 74 20 32 20 6D 6F 64 3A 20 20 20 20  ; .filt 2 mod:    
  1d50  .db 20 20 48 7A 20                                   ;   Hz 

; ---- function FUN_M7A_r3_00000__1d55
FUN_M7A_r3_00000__1d55:
  1d55  3406           PSHS  B A                         
  1d57  17FFB6         LBSR 0x1d10                       
  1d5a  C605           LDB #0x5                          
  1d5c  F76066         STB 0x6066                        
  1d5f  CC0064         LDD #0x64                         
  1d62  FD60DC         STD 0x60dc                        
  1d65  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__1d67
FUN_M7A_r3_00000__1d67:
  1d67  3476           PSHS  U Y X B A                   
  1d69  8E1CEA         LDX #0x1cea                       
  1d6c  AD9FFE76       JSR [0xfe76]                      
  1d70  FC7126         LDD 0x7126                        
  1d73  3606           PSHU  B A                         
  1d75  CC0004         LDD #0x4                          
  1d78  3606           PSHU  B A                         
  1d7a  AD9FFCEC       JSR [0xfcec]                      
  1d7e  FC7126         LDD 0x7126                        
  1d81  3606           PSHU  B A                         
  1d83  CC5591         LDD #0x5591                       
  1d86  3606           PSHU  B A                         
  1d88  AD9FFCF2       JSR [0xfcf2]                      
  1d8c  AD9FFCE2       JSR [0xfce2]                      
  1d90  3706           PULU  A B                         
  1d92  FD70DE         STD 0x70de                        
  1d95  BE70DE         LDX 0x70de                        
  1d98  108E0766       LDY #0x766                        
  1d9c  17F15E         LBSR 0x0efd                       
  1d9f  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1e1d_M7A_r3_00000__1da1:
  1da1  1E1D           addr M7A_r3_00000::1e1d           
  1da3  1DEB           addr M7A_r3_00000::1deb           
  1da5  .db 1D DF 70 60 71 2A 00 00 71 2C 3E D8 3F 73 2A 00  ; ..p`q*..q,>.?s*.
  1db5  .db 00 7D 00 00 01 00 05 1D 1D F7 00 00 00 00 00 00  ; .}..............
  1dc5  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1dc7
FUN_M7A_r3_00000__1dc7:
  1dc7  3410           PSHS  X                           
  1dc9  8E1DA1         LDX #0x1da1                        ; desc[API_FE6A]: ->$1E1D ->$1DEB
  1dcc  AD9FFE6A       JSR [0xfe6a]                      
  1dd0  3510           PULS  X                           
  1dd2  39             RTS                               

; ---- function FUN_M7A_r3_00000__1dd3
FUN_M7A_r3_00000__1dd3:
  1dd3  3410           PSHS  X                           
  1dd5  8E1DA1         LDX #0x1da1                        ; desc[API_FDBC]: ->$1E1D ->$1DEB
  1dd8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1ddc  3510           PULS  X                           
  1dde  39             RTS                               

; ---- function FUN_M7A_r3_00000__1ddf
FUN_M7A_r3_00000__1ddf:
  1ddf  3410           PSHS  X                           
  1de1  8E1DA1         LDX #0x1da1                        ; desc[API_FE6C]: ->$1E1D ->$1DEB
  1de4  AD9FFE6C       JSR [0xfe6c]                      
  1de8  3510           PULS  X                           
  1dea  39             RTS                               

; ---- function FUN_M7A_r3_00000__1deb
FUN_M7A_r3_00000__1deb:
  1deb  3410           PSHS  X                           
  1ded  8E1DA1         LDX #0x1da1                        ; desc[API_FE6E]: ->$1E1D ->$1DEB
  1df0  AD9FFE6E       JSR [0xfe6e]                      
  1df4  3510           PULS  X                           
  1df6  39             RTS                               
  1df7  .db 14 64 65 6C 61 79 20 31 3A 20 20 20 20 20 20 20  ; .delay 1:       
  1e07  .db 20 6D 73 20 20                                   ;  ms  

; ---- function FUN_M7A_r3_00000__1e0c
FUN_M7A_r3_00000__1e0c:
  1e0c  3406           PSHS  B A                         
  1e0e  17FFB6         LBSR 0x1dc7                       
  1e11  FC70DC         LDD 0x70dc                        
  1e14  FD606C         STD 0x606c                        
  1e17  AD9FFC14       JSR [0xfc14]                      
  1e1b  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__1e1d
FUN_M7A_r3_00000__1e1d:
  1e1d  3476           PSHS  U Y X B A                   
  1e1f  CC0000         LDD #0x0                          
  1e22  3606           PSHU  B A                         
  1e24  FC70DC         LDD 0x70dc                        
  1e27  3606           PSHU  B A                         
  1e29  FC7060         LDD 0x7060                        
  1e2c  F3712A         ADDD 0x712a                       
  1e2f  3606           PSHU  B A                         
  1e31  AD9FFCD8       JSR [0xfcd8]                      
  1e35  3706           PULU  A B                         
  1e37  FD712C         STD 0x712c                        
  1e3a  FC712C         LDD 0x712c                        
  1e3d  3606           PSHU  B A                         
  1e3f  CC5833         LDD #0x5833                       
  1e42  3606           PSHU  B A                         
  1e44  AD9FFCF2       JSR [0xfcf2]                      
  1e48  3706           PULU  A B                         
  1e4a  FD70DE         STD 0x70de                        
  1e4d  FD7128         STD 0x7128                        
  1e50  BE70DE         LDX 0x70de                        
  1e53  108E075C       LDY #0x75c                        
  1e57  17F0A3         LBSR 0x0efd                       
  1e5a  17054D         LBSR 0x23aa                       
  1e5d  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1edb_M7A_r3_00000__1e5f:
  1e5f  1EDB           addr M7A_r3_00000::1edb           
  1e61  1EA9           addr M7A_r3_00000::1ea9           
  1e63  .db 1E 9D 70 62 71 30 00 00 71 32 3E D8 3F 75 2B 00  ; ..pbq0..q2>.?u+.
  1e73  .db 00 7D 00 00 01 00 05 1D 1E B5 00 00 00 00 00 00  ; .}..............
  1e83  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1e85
FUN_M7A_r3_00000__1e85:
  1e85  3410           PSHS  X                           
  1e87  8E1E5F         LDX #0x1e5f                        ; desc[API_FE6A]: ->$1EDB ->$1EA9
  1e8a  AD9FFE6A       JSR [0xfe6a]                      
  1e8e  3510           PULS  X                           
  1e90  39             RTS                               

; ---- function FUN_M7A_r3_00000__1e91
FUN_M7A_r3_00000__1e91:
  1e91  3410           PSHS  X                           
  1e93  8E1E5F         LDX #0x1e5f                        ; desc[API_FDBC]: ->$1EDB ->$1EA9
  1e96  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..._"
  1e9a  3510           PULS  X                           
  1e9c  39             RTS                               

; ---- function FUN_M7A_r3_00000__1e9d
FUN_M7A_r3_00000__1e9d:
  1e9d  3410           PSHS  X                           
  1e9f  8E1E5F         LDX #0x1e5f                        ; desc[API_FE6C]: ->$1EDB ->$1EA9
  1ea2  AD9FFE6C       JSR [0xfe6c]                      
  1ea6  3510           PULS  X                           
  1ea8  39             RTS                               

; ---- function FUN_M7A_r3_00000__1ea9
FUN_M7A_r3_00000__1ea9:
  1ea9  3410           PSHS  X                           
  1eab  8E1E5F         LDX #0x1e5f                        ; desc[API_FE6E]: ->$1EDB ->$1EA9
  1eae  AD9FFE6E       JSR [0xfe6e]                      
  1eb2  3510           PULS  X                           
  1eb4  39             RTS                               
  1eb5  .db 14 64 65 6C 61 79 20 32 3A 20 20 20 20 20 20 20  ; .delay 2:       
  1ec5  .db 20 6D 73 20 20                                   ;  ms  

; ---- function FUN_M7A_r3_00000__1eca
FUN_M7A_r3_00000__1eca:
  1eca  3406           PSHS  B A                         
  1ecc  17FFB6         LBSR 0x1e85                       
  1ecf  FC70DC         LDD 0x70dc                        
  1ed2  FD606C         STD 0x606c                        
  1ed5  AD9FFC14       JSR [0xfc14]                      
  1ed9  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__1edb
FUN_M7A_r3_00000__1edb:
  1edb  3476           PSHS  U Y X B A                   
  1edd  CC0000         LDD #0x0                          
  1ee0  3606           PSHU  B A                         
  1ee2  FC70DC         LDD 0x70dc                        
  1ee5  3606           PSHU  B A                         
  1ee7  FC7062         LDD 0x7062                        
  1eea  F37130         ADDD 0x7130                       
  1eed  3606           PSHU  B A                         
  1eef  AD9FFCD8       JSR [0xfcd8]                      
  1ef3  3706           PULU  A B                         
  1ef5  FD7132         STD 0x7132                        
  1ef8  FC7132         LDD 0x7132                        
  1efb  3606           PSHU  B A                         
  1efd  CC5833         LDD #0x5833                       
  1f00  3606           PSHU  B A                         
  1f02  AD9FFCF2       JSR [0xfcf2]                      
  1f06  3706           PULU  A B                         
  1f08  FD70DE         STD 0x70de                        
  1f0b  FD712E         STD 0x712e                        
  1f0e  BE70DE         LDX 0x70de                        
  1f11  108E075E       LDY #0x75e                        
  1f15  17EFE5         LBSR 0x0efd                       
  1f18  170547         LBSR 0x2462                       
  1f1b  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__1f88_M7A_r3_00000__1f1d:
  1f1d  1F88           addr M7A_r3_00000::1f88           
  1f1f  1F67           addr M7A_r3_00000::1f67           
  1f21  .db 1F 5B 70 64 71 34 00 00 71 36 3E D8 3F 7F 2C 00  ; .[pdq4..q6>.?.,.
  1f31  .db 00 00 60 00 01 00 02 22 1F 73 00 00 00 00 00 00  ; ..`....".s......
  1f41  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1f43
FUN_M7A_r3_00000__1f43:
  1f43  3410           PSHS  X                           
  1f45  8E1F1D         LDX #0x1f1d                        ; desc[API_FE6A]: ->$1F88 ->$1F67
  1f48  AD9FFE6A       JSR [0xfe6a]                      
  1f4c  3510           PULS  X                           
  1f4e  39             RTS                               

; ---- function FUN_M7A_r3_00000__1f4f
FUN_M7A_r3_00000__1f4f:
  1f4f  3410           PSHS  X                           
  1f51  8E1F1D         LDX #0x1f1d                        ; desc[API_FDBC]: ->$1F88 ->$1F67
  1f54  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1f58  3510           PULS  X                           
  1f5a  39             RTS                               

; ---- function FUN_M7A_r3_00000__1f5b
FUN_M7A_r3_00000__1f5b:
  1f5b  3410           PSHS  X                           
  1f5d  8E1F1D         LDX #0x1f1d                        ; desc[API_FE6C]: ->$1F88 ->$1F67
  1f60  AD9FFE6C       JSR [0xfe6c]                      
  1f64  3510           PULS  X                           
  1f66  39             RTS                               

; ---- function FUN_M7A_r3_00000__1f67
FUN_M7A_r3_00000__1f67:
  1f67  3410           PSHS  X                           
  1f69  8E1F1D         LDX #0x1f1d                        ; desc[API_FE6E]: ->$1F88 ->$1F67
  1f6c  AD9FFE6E       JSR [0xfe6e]                      
  1f70  3510           PULS  X                           
  1f72  39             RTS                               
  1f73  .db 14 64 65 6C 61 79 31 20 62 65 61 74 73 3A 20 20  ; .delay1 beats:  
  1f83  .db 20 2F 32 34 20                                   ;  /24 

; ---- function FUN_M7A_r3_00000__1f88
FUN_M7A_r3_00000__1f88:
  1f88  3476           PSHS  U Y X B A                   
  1f8a  8E1F1D         LDX #0x1f1d                       
  1f8d  AD9FFE76       JSR [0xfe76]                      
  1f91  FC70FC         LDD 0x70fc                        
  1f94  3606           PSHU  B A                         
  1f96  FC7136         LDD 0x7136                        
  1f99  3606           PSHU  B A                         
  1f9b  AD9FFCEE       JSR [0xfcee]                      
  1f9f  FC7106         LDD 0x7106                        
  1fa2  3606           PSHU  B A                         
  1fa4  AD9FFCEA       JSR [0xfcea]                      
  1fa8  FC70FA         LDD 0x70fa                        
  1fab  3606           PSHU  B A                         
  1fad  FC7136         LDD 0x7136                        
  1fb0  3606           PSHU  B A                         
  1fb2  AD9FFCEE       JSR [0xfcee]                      
  1fb6  AD9FFCE2       JSR [0xfce2]                      
  1fba  3706           PULU  A B                         
  1fbc  FD712A         STD 0x712a                        
  1fbf  17FE5B         LBSR 0x1e1d                       
  1fc2  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__202f_M7A_r3_00000__1fc4:
  1fc4  202F           addr M7A_r3_00000::202f           
  1fc6  200E           addr M7A_r3_00000::200e           
  1fc8  .db 20 02 70 66 71 38 00 00 71 3A 3E D8 3F 81 2D 00  ;  .pfq8..q:>.?.-.
  1fd8  .db 00 00 60 00 01 00 02 22 20 1A 00 00 00 00 00 00  ; ..`...." .......
  1fe8  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__1fea
FUN_M7A_r3_00000__1fea:
  1fea  3410           PSHS  X                           
  1fec  8E1FC4         LDX #0x1fc4                        ; desc[API_FE6A]: ->$202F ->$200E
  1fef  AD9FFE6A       JSR [0xfe6a]                      
  1ff3  3510           PULS  X                           
  1ff5  39             RTS                               

; ---- function FUN_M7A_r3_00000__1ff6
FUN_M7A_r3_00000__1ff6:
  1ff6  3410           PSHS  X                           
  1ff8  8E1FC4         LDX #0x1fc4                        ; desc[API_FDBC]: ->$202F ->$200E
  1ffb  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1fff  3510           PULS  X                           
  2001  39             RTS                               

; ---- function FUN_M7A_r3_00000__2002
FUN_M7A_r3_00000__2002:
  2002  3410           PSHS  X                           
  2004  8E1FC4         LDX #0x1fc4                        ; desc[API_FE6C]: ->$202F ->$200E
  2007  AD9FFE6C       JSR [0xfe6c]                      
  200b  3510           PULS  X                           
  200d  39             RTS                               

; ---- function FUN_M7A_r3_00000__200e
FUN_M7A_r3_00000__200e:
  200e  3410           PSHS  X                           
  2010  8E1FC4         LDX #0x1fc4                        ; desc[API_FE6E]: ->$202F ->$200E
  2013  AD9FFE6E       JSR [0xfe6e]                      
  2017  3510           PULS  X                           
  2019  39             RTS                               
  201a  .db 14 64 65 6C 61 79 32 20 62 65 61 74 73 3A 20 20  ; .delay2 beats:  
  202a  .db 20 2F 32 34 20                                   ;  /24 

; ---- function FUN_M7A_r3_00000__202f
FUN_M7A_r3_00000__202f:
  202f  3476           PSHS  U Y X B A                   
  2031  8E1FC4         LDX #0x1fc4                       
  2034  AD9FFE76       JSR [0xfe76]                      
  2038  FC70FC         LDD 0x70fc                        
  203b  3606           PSHU  B A                         
  203d  FC713A         LDD 0x713a                        
  2040  3606           PSHU  B A                         
  2042  AD9FFCEE       JSR [0xfcee]                      
  2046  FC7106         LDD 0x7106                        
  2049  3606           PSHU  B A                         
  204b  AD9FFCEA       JSR [0xfcea]                      
  204f  FC70FA         LDD 0x70fa                        
  2052  3606           PSHU  B A                         
  2054  FC713A         LDD 0x713a                        
  2057  3606           PSHU  B A                         
  2059  AD9FFCEE       JSR [0xfcee]                      
  205d  AD9FFCE2       JSR [0xfce2]                      
  2061  3706           PULU  A B                         
  2063  FD7130         STD 0x7130                        
  2066  17FE72         LBSR 0x1edb                       
  2069  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__20d6_M7A_r3_00000__206b:
  206b  20D6           addr M7A_r3_00000::20d6           
  206d  20B5           addr M7A_r3_00000::20b5           
  206f  .db 20 A9 70 68 71 3C 00 00 71 3E 3E D8 40 19 2E FF  ;  .phq<..q>>.@...
  207f  .db 9C 00 64 00 01 00 04 22 20 C1 00 00 00 00 00 00  ; ..d...." .......
  208f  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2091
FUN_M7A_r3_00000__2091:
  2091  3410           PSHS  X                           
  2093  8E206B         LDX #0x206b                        ; desc[API_FE6A]: ->$20D6 ->$20B5
  2096  AD9FFE6A       JSR [0xfe6a]                      
  209a  3510           PULS  X                           
  209c  39             RTS                               

; ---- function FUN_M7A_r3_00000__209d
FUN_M7A_r3_00000__209d:
  209d  3410           PSHS  X                           
  209f  8E206B         LDX #0x206b                        ; desc[API_FDBC]: ->$20D6 ->$20B5
  20a2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.. k"
  20a6  3510           PULS  X                           
  20a8  39             RTS                               

; ---- function FUN_M7A_r3_00000__20a9
FUN_M7A_r3_00000__20a9:
  20a9  3410           PSHS  X                           
  20ab  8E206B         LDX #0x206b                        ; desc[API_FE6C]: ->$20D6 ->$20B5
  20ae  AD9FFE6C       JSR [0xfe6c]                      
  20b2  3510           PULS  X                           
  20b4  39             RTS                               

; ---- function FUN_M7A_r3_00000__20b5
FUN_M7A_r3_00000__20b5:
  20b5  3410           PSHS  X                           
  20b7  8E206B         LDX #0x206b                        ; desc[API_FE6E]: ->$20D6 ->$20B5
  20ba  AD9FFE6E       JSR [0xfe6e]                      
  20be  3510           PULS  X                           
  20c0  39             RTS                               
  20c1  .db 14 64 65 6C 61 79 31 20 66 64 62 61 63 6B 3A 20  ; .delay1 fdback: 
  20d1  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__20d6
FUN_M7A_r3_00000__20d6:
  20d6  3476           PSHS  U Y X B A                   
  20d8  8E206B         LDX #0x206b                       
  20db  AD9FFE76       JSR [0xfe76]                      
  20df  FC713E         LDD 0x713e                        
  20e2  3606           PSHU  B A                         
  20e4  AD9FFEC4       JSR [0xfec4]                      
  20e8  3706           PULU  A B                         
  20ea  FD70DE         STD 0x70de                        
  20ed  FC7146         LDD 0x7146                        
  20f0  10830001       CMPD #0x1                         
  20f4  1027000C       LBEQ 0x2104                       
  20f8  BE70DE         LDX 0x70de                        
  20fb  108E074D       LDY #0x74d                        
  20ff  17EDFB         LBSR 0x0efd                       
  2102  200A           BRA 0x210e                        
LAB_M7A_r3_00000__2104:
  2104  8E8000         LDX #0x8000                       
  2107  108E074D       LDY #0x74d                        
  210b  17EDEF         LBSR 0x0efd                       
LAB_M7A_r3_00000__210e:
  210e  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__217b_M7A_r3_00000__2110:
  2110  217B           addr M7A_r3_00000::217b           
  2112  215A           addr M7A_r3_00000::215a           
  2114  .db 21 4E 70 6A 71 40 00 00 71 42 3E D8 40 1B 2F FF  ; !Npjq@..qB>.@./.
  2124  .db 9C 00 64 00 01 00 04 22 21 66 00 00 00 00 00 00  ; ..d...."!f......
  2134  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2136
FUN_M7A_r3_00000__2136:
  2136  3410           PSHS  X                           
  2138  8E2110         LDX #0x2110                        ; desc[API_FE6A]: ->$217B ->$215A
  213b  AD9FFE6A       JSR [0xfe6a]                      
  213f  3510           PULS  X                           
  2141  39             RTS                               

; ---- function FUN_M7A_r3_00000__2142
FUN_M7A_r3_00000__2142:
  2142  3410           PSHS  X                           
  2144  8E2110         LDX #0x2110                        ; desc[API_FDBC]: ->$217B ->$215A
  2147  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..!."
  214b  3510           PULS  X                           
  214d  39             RTS                               

; ---- function FUN_M7A_r3_00000__214e
FUN_M7A_r3_00000__214e:
  214e  3410           PSHS  X                           
  2150  8E2110         LDX #0x2110                        ; desc[API_FE6C]: ->$217B ->$215A
  2153  AD9FFE6C       JSR [0xfe6c]                      
  2157  3510           PULS  X                           
  2159  39             RTS                               

; ---- function FUN_M7A_r3_00000__215a
FUN_M7A_r3_00000__215a:
  215a  3410           PSHS  X                           
  215c  8E2110         LDX #0x2110                        ; desc[API_FE6E]: ->$217B ->$215A
  215f  AD9FFE6E       JSR [0xfe6e]                      
  2163  3510           PULS  X                           
  2165  39             RTS                               
  2166  .db 14 64 65 6C 61 79 32 20 66 64 62 61 63 6B 3A 20  ; .delay2 fdback: 
  2176  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__217b
FUN_M7A_r3_00000__217b:
  217b  3476           PSHS  U Y X B A                   
  217d  8E2110         LDX #0x2110                       
  2180  AD9FFE76       JSR [0xfe76]                      
  2184  FC7142         LDD 0x7142                        
  2187  3606           PSHU  B A                         
  2189  AD9FFEC4       JSR [0xfec4]                      
  218d  3706           PULU  A B                         
  218f  FD70DE         STD 0x70de                        
  2192  FC714A         LDD 0x714a                        
  2195  10830001       CMPD #0x1                         
  2199  1027000C       LBEQ 0x21a9                       
  219d  BE70DE         LDX 0x70de                        
  21a0  108E074E       LDY #0x74e                        
  21a4  17ED56         LBSR 0x0efd                       
  21a7  200A           BRA 0x21b3                        
LAB_M7A_r3_00000__21a9:
  21a9  8E8000         LDX #0x8000                       
  21ac  108E074E       LDY #0x74e                        
  21b0  17ED4A         LBSR 0x0efd                       
LAB_M7A_r3_00000__21b3:
  21b3  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2244_M7A_r3_00000__21b5:
  21b5  2244           addr M7A_r3_00000::2244           
  21b7  21FF           addr M7A_r3_00000::21ff           
  21b9  .db 21 F3 70 6C 71 44 00 00 71 46 3E D8 3F 7B 30 00  ; !.plqD..qF>.?{0.
  21c9  .db 00 00 01 00 01 00 06 22 22 23 00 00 22 38 70 6E  ; .......""#.."8pn
  21d9  .db 3F 6F                                            ; ?o

; ---- function FUN_M7A_r3_00000__21db
FUN_M7A_r3_00000__21db:
  21db  3410           PSHS  X                           
  21dd  8E21B5         LDX #0x21b5                       
  21e0  AD9FFC4E       JSR [0xfc4e]                      
  21e4  3510           PULS  X                           
  21e6  39             RTS                               

; ---- function FUN_M7A_r3_00000__21e7
FUN_M7A_r3_00000__21e7:
  21e7  3410           PSHS  X                           
  21e9  8E21B5         LDX #0x21b5                        ; desc[API_FDBC]: ->$2244 ->$21FF
  21ec  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..!."
  21f0  3510           PULS  X                           
  21f2  39             RTS                               

; ---- function FUN_M7A_r3_00000__21f3
FUN_M7A_r3_00000__21f3:
  21f3  3410           PSHS  X                           
  21f5  8E21B5         LDX #0x21b5                        ; desc[API_FE6C]: ->$2244 ->$21FF
  21f8  AD9FFE6C       JSR [0xfe6c]                      
  21fc  3510           PULS  X                           
  21fe  39             RTS                               

; ---- function FUN_M7A_r3_00000__21ff
FUN_M7A_r3_00000__21ff:
  21ff  3410           PSHS  X                           
  2201  8E21B5         LDX #0x21b5                       
  2204  AD9FFC52       JSR [0xfc52]                      
  2208  3510           PULS  X                           
  220a  39             RTS                               

; ---- function FUN_M7A_r3_00000__220b
FUN_M7A_r3_00000__220b:
  220b  3410           PSHS  X                           
  220d  8E21B5         LDX #0x21b5                        ; desc[API_FE1C]: ->$2244 ->$21FF
  2210  AD9FFE1C       JSR [0xfe1c]                      
  2214  3510           PULS  X                           
  2216  39             RTS                               

; ---- function FUN_M7A_r3_00000__2217
FUN_M7A_r3_00000__2217:
  2217  3410           PSHS  X                           
  2219  8E21B5         LDX #0x21b5                        ; desc[API_FE1A]: ->$2244 ->$21FF $21F3
  221c  AD9FFE1A       JSR [0xfe1a]                      
  2220  3510           PULS  X                           
  2222  39             RTS                               
  2223  .db 14 64 65 6C 61 79 20 31 20 6C 6F 6F 70 3A 20 20  ; .delay 1 loop:  
  2233  .db 20 20 20 20 20 20 6F 66 66 20 20 2D 2D 6F 6E 2D  ;       off  --on-
  2243  .db 2D                                               ; -

; ---- function FUN_M7A_r3_00000__2244
FUN_M7A_r3_00000__2244:
  2244  3476           PSHS  U Y X B A                   
  2246  8E21B5         LDX #0x21b5                       
  2249  AD9FFE76       JSR [0xfe76]                      
  224d  17FE86         LBSR 0x20d6                       
  2250  FC7146         LDD 0x7146                        
  2253  10830001       CMPD #0x1                         
  2257  10270018       LBEQ 0x2273                       
  225b  108E073E       LDY #0x73e                        
  225f  CC000E         LDD #0xe                          
  2262  58             LSLB                              
  2263  49             ROLA                              
  2264  1F01           TFR D,X                           
  2266  EC89700A       LDD 0x700a,X                      
  226a  C30001         ADDD #0x1                         
  226d  AD9FFD2E       JSR [0xfd2e]                      
  2271  200B           BRA 0x227e                        
LAB_M7A_r3_00000__2273:
  2273  108E073E       LDY #0x73e                        
  2277  CC0001         LDD #0x1                          
  227a  AD9FFD2E       JSR [0xfd2e]                      
LAB_M7A_r3_00000__227e:
  227e  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2303_M7A_r3_00000__2280:
  2280  2303           addr M7A_r3_00000::2303           
  2282  22CA           addr M7A_r3_00000::22ca           
  2284  .db 22 BE 70 70 71 48 00 00 71 4A 3E D8 3F 7D 31 00  ; ".ppqH..qJ>.?}1.
  2294  .db 00 00 01 00 01 00 06 22 22 EE 00 00 22 38 70 72  ; .......""..."8pr
  22a4  .db 3F 71                                            ; ?q

; ---- function FUN_M7A_r3_00000__22a6
FUN_M7A_r3_00000__22a6:
  22a6  3410           PSHS  X                           
  22a8  8E2280         LDX #0x2280                       
  22ab  AD9FFC4E       JSR [0xfc4e]                      
  22af  3510           PULS  X                           
  22b1  39             RTS                               

; ---- function FUN_M7A_r3_00000__22b2
FUN_M7A_r3_00000__22b2:
  22b2  3410           PSHS  X                           
  22b4  8E2280         LDX #0x2280                        ; desc[API_FDBC]: ->$2303 ->$22CA
  22b7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.."."
  22bb  3510           PULS  X                           
  22bd  39             RTS                               

; ---- function FUN_M7A_r3_00000__22be
FUN_M7A_r3_00000__22be:
  22be  3410           PSHS  X                           
  22c0  8E2280         LDX #0x2280                        ; desc[API_FE6C]: ->$2303 ->$22CA
  22c3  AD9FFE6C       JSR [0xfe6c]                      
  22c7  3510           PULS  X                           
  22c9  39             RTS                               

; ---- function FUN_M7A_r3_00000__22ca
FUN_M7A_r3_00000__22ca:
  22ca  3410           PSHS  X                           
  22cc  8E2280         LDX #0x2280                       
  22cf  AD9FFC52       JSR [0xfc52]                      
  22d3  3510           PULS  X                           
  22d5  39             RTS                               

; ---- function FUN_M7A_r3_00000__22d6
FUN_M7A_r3_00000__22d6:
  22d6  3410           PSHS  X                           
  22d8  8E2280         LDX #0x2280                        ; desc[API_FE1C]: ->$2303 ->$22CA
  22db  AD9FFE1C       JSR [0xfe1c]                      
  22df  3510           PULS  X                           
  22e1  39             RTS                               

; ---- function FUN_M7A_r3_00000__22e2
FUN_M7A_r3_00000__22e2:
  22e2  3410           PSHS  X                           
  22e4  8E2280         LDX #0x2280                        ; desc[API_FE1A]: ->$2303 ->$22CA $22BE
  22e7  AD9FFE1A       JSR [0xfe1a]                      
  22eb  3510           PULS  X                           
  22ed  39             RTS                               
  22ee  .db 14 64 65 6C 61 79 20 32 20 6C 6F 6F 70 3A 20 20  ; .delay 2 loop:  
  22fe  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__2303
FUN_M7A_r3_00000__2303:
  2303  3476           PSHS  U Y X B A                   
  2305  8E2280         LDX #0x2280                       
  2308  AD9FFE76       JSR [0xfe76]                      
  230c  17FE6C         LBSR 0x217b                       
  230f  FC714A         LDD 0x714a                        
  2312  10830001       CMPD #0x1                         
  2316  10270018       LBEQ 0x2332                       
  231a  108E0740       LDY #0x740                        
  231e  CC0010         LDD #0x10                         
  2321  58             LSLB                              
  2322  49             ROLA                              
  2323  1F01           TFR D,X                           
  2325  EC89700A       LDD 0x700a,X                      
  2329  C30001         ADDD #0x1                         
  232c  AD9FFD2E       JSR [0xfd2e]                      
  2330  200B           BRA 0x233d                        
LAB_M7A_r3_00000__2332:
  2332  108E0740       LDY #0x740                        
  2336  CC0001         LDD #0x1                          
  2339  AD9FFD2E       JSR [0xfd2e]                      
LAB_M7A_r3_00000__233d:
  233d  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__23aa_M7A_r3_00000__233f:
  233f  23AA           addr M7A_r3_00000::23aa           
  2341  2389           addr M7A_r3_00000::2389           
  2343  .db 23 7D 70 74 71 4C 00 00 71 4E 3E D8 3F 77 32 EC  ; #}ptqL..qN>.?w2.
  2353  .db 78 13 88 00 01 01 06 1F 23 95 00 00 00 00 00 00  ; x.......#.......
  2363  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2365
FUN_M7A_r3_00000__2365:
  2365  3410           PSHS  X                           
  2367  8E233F         LDX #0x233f                        ; desc[API_FE6A]: ->$23AA ->$2389
  236a  AD9FFE6A       JSR [0xfe6a]                      
  236e  3510           PULS  X                           
  2370  39             RTS                               

; ---- function FUN_M7A_r3_00000__2371
FUN_M7A_r3_00000__2371:
  2371  3410           PSHS  X                           
  2373  8E233F         LDX #0x233f                        ; desc[API_FDBC]: ->$23AA ->$2389
  2376  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..#?"
  237a  3510           PULS  X                           
  237c  39             RTS                               

; ---- function FUN_M7A_r3_00000__237d
FUN_M7A_r3_00000__237d:
  237d  3410           PSHS  X                           
  237f  8E233F         LDX #0x233f                        ; desc[API_FE6C]: ->$23AA ->$2389
  2382  AD9FFE6C       JSR [0xfe6c]                      
  2386  3510           PULS  X                           
  2388  39             RTS                               

; ---- function FUN_M7A_r3_00000__2389
FUN_M7A_r3_00000__2389:
  2389  3410           PSHS  X                           
  238b  8E233F         LDX #0x233f                        ; desc[API_FE6E]: ->$23AA ->$2389
  238e  AD9FFE6E       JSR [0xfe6e]                      
  2392  3510           PULS  X                           
  2394  39             RTS                               
  2395  .db 14 64 65 6C 61 79 31 20 6D 6F 64 3A 20 20 20 20  ; .delay1 mod:    
  23a5  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7A_r3_00000__23aa
FUN_M7A_r3_00000__23aa:
  23aa  3476           PSHS  U Y X B A                   
  23ac  8E233F         LDX #0x233f                       
  23af  AD9FFE76       JSR [0xfe76]                      
  23b3  FC714E         LDD 0x714e                        
  23b6  3606           PSHU  B A                         
  23b8  AD9FFECC       JSR [0xfecc]                      
  23bc  3706           PULU  A B                         
  23be  FD70DE         STD 0x70de                        
  23c1  2C28           BGE 0x23eb                        
  23c3  FC7128         LDD 0x7128                        
  23c6  108301FF       CMPD #0x1ff                       
  23ca  2C1F           BGE 0x23eb                        
  23cc  58             LSLB                              
  23cd  49             ROLA                              
  23ce  58             LSLB                              
  23cf  49             ROLA                              
  23d0  58             LSLB                              
  23d1  49             ROLA                              
  23d2  58             LSLB                              
  23d3  49             ROLA                              
  23d4  58             LSLB                              
  23d5  49             ROLA                              
  23d6  58             LSLB                              
  23d7  49             ROLA                              
  23d8  FD70E0         STD 0x70e0                        
  23db  F370DE         ADDD 0x70de                       
  23de  2E0B           BGT 0x23eb                        
  23e0  4F             CLRA                              
  23e1  5F             CLRB                              
  23e2  B370E0         SUBD 0x70e0                       
  23e5  C30001         ADDD #0x1                         
  23e8  FD70DE         STD 0x70de                        
LAB_M7A_r3_00000__23eb:
  23eb  BE70DE         LDX 0x70de                        
  23ee  108E075D       LDY #0x75d                        
  23f2  17EB08         LBSR 0x0efd                       
  23f5  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2462_M7A_r3_00000__23f7:
  23f7  2462           addr M7A_r3_00000::2462           
  23f9  2441           addr M7A_r3_00000::2441           
  23fb  .db 24 35 70 76 71 50 00 00 71 52 3E D8 3F 79 33 EC  ; $5pvqP..qR>.?y3.
  240b  .db 78 13 88 00 01 01 06 1F 24 4D 00 00 00 00 00 00  ; x.......$M......
  241b  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__241d
FUN_M7A_r3_00000__241d:
  241d  3410           PSHS  X                           
  241f  8E23F7         LDX #0x23f7                        ; desc[API_FE6A]: ->$2462 ->$2441
  2422  AD9FFE6A       JSR [0xfe6a]                      
  2426  3510           PULS  X                           
  2428  39             RTS                               

; ---- function FUN_M7A_r3_00000__2429
FUN_M7A_r3_00000__2429:
  2429  3410           PSHS  X                           
  242b  8E23F7         LDX #0x23f7                        ; desc[API_FDBC]: ->$2462 ->$2441
  242e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..#."
  2432  3510           PULS  X                           
  2434  39             RTS                               

; ---- function FUN_M7A_r3_00000__2435
FUN_M7A_r3_00000__2435:
  2435  3410           PSHS  X                           
  2437  8E23F7         LDX #0x23f7                        ; desc[API_FE6C]: ->$2462 ->$2441
  243a  AD9FFE6C       JSR [0xfe6c]                      
  243e  3510           PULS  X                           
  2440  39             RTS                               

; ---- function FUN_M7A_r3_00000__2441
FUN_M7A_r3_00000__2441:
  2441  3410           PSHS  X                           
  2443  8E23F7         LDX #0x23f7                        ; desc[API_FE6E]: ->$2462 ->$2441
  2446  AD9FFE6E       JSR [0xfe6e]                      
  244a  3510           PULS  X                           
  244c  39             RTS                               
  244d  .db 14 64 65 6C 61 79 32 20 6D 6F 64 3A 20 20 20 20  ; .delay2 mod:    
  245d  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7A_r3_00000__2462
FUN_M7A_r3_00000__2462:
  2462  3476           PSHS  U Y X B A                   
  2464  8E23F7         LDX #0x23f7                       
  2467  AD9FFE76       JSR [0xfe76]                      
  246b  FC7152         LDD 0x7152                        
  246e  3606           PSHU  B A                         
  2470  AD9FFECC       JSR [0xfecc]                      
  2474  3706           PULU  A B                         
  2476  FD70DE         STD 0x70de                        
  2479  2C28           BGE 0x24a3                        
  247b  FC712E         LDD 0x712e                        
  247e  108301FF       CMPD #0x1ff                       
  2482  2C1F           BGE 0x24a3                        
  2484  58             LSLB                              
  2485  49             ROLA                              
  2486  58             LSLB                              
  2487  49             ROLA                              
  2488  58             LSLB                              
  2489  49             ROLA                              
  248a  58             LSLB                              
  248b  49             ROLA                              
  248c  58             LSLB                              
  248d  49             ROLA                              
  248e  58             LSLB                              
  248f  49             ROLA                              
  2490  FD70E0         STD 0x70e0                        
  2493  F370DE         ADDD 0x70de                       
  2496  2E0B           BGT 0x24a3                        
  2498  4F             CLRA                              
  2499  5F             CLRB                              
  249a  B370E0         SUBD 0x70e0                       
  249d  C30001         ADDD #0x1                         
  24a0  FD70DE         STD 0x70de                        
LAB_M7A_r3_00000__24a3:
  24a3  BE70DE         LDX 0x70de                        
  24a6  108E075F       LDY #0x75f                        
  24aa  17EA50         LBSR 0x0efd                       
  24ad  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2532_M7A_r3_00000__24af:
  24af  2532           addr M7A_r3_00000::2532           
  24b1  24F9           addr M7A_r3_00000::24f9           
  24b3  .db 24 ED 70 78 71 54 00 00 71 56 3E D8 3F 89 34 00  ; $.pxqT..qV>.?.4.
  24c3  .db 00 75 30 00 01 02 06 1F 25 1D 00 00 00 00 70 7A  ; .u0.....%.....pz
  24d3  .db 3F 5F                                            ; ?_

; ---- function FUN_M7A_r3_00000__24d5
FUN_M7A_r3_00000__24d5:
  24d5  3410           PSHS  X                           
  24d7  8E24AF         LDX #0x24af                        ; desc[API_FE6A]: ->$2532 ->$24F9
  24da  AD9FFE6A       JSR [0xfe6a]                      
  24de  3510           PULS  X                           
  24e0  39             RTS                               

; ---- function FUN_M7A_r3_00000__24e1
FUN_M7A_r3_00000__24e1:
  24e1  3410           PSHS  X                           
  24e3  8E24AF         LDX #0x24af                        ; desc[API_FDBC]: ->$2532 ->$24F9
  24e6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$."
  24ea  3510           PULS  X                           
  24ec  39             RTS                               

; ---- function FUN_M7A_r3_00000__24ed
FUN_M7A_r3_00000__24ed:
  24ed  3410           PSHS  X                           
  24ef  8E24AF         LDX #0x24af                        ; desc[API_FE6C]: ->$2532 ->$24F9
  24f2  AD9FFE6C       JSR [0xfe6c]                      
  24f6  3510           PULS  X                           
  24f8  39             RTS                               

; ---- function FUN_M7A_r3_00000__24f9
FUN_M7A_r3_00000__24f9:
  24f9  3410           PSHS  X                           
  24fb  8E24AF         LDX #0x24af                        ; desc[API_FE6E]: ->$2532 ->$24F9
  24fe  AD9FFE6E       JSR [0xfe6e]                      
  2502  3510           PULS  X                           
  2504  39             RTS                               

; ---- function FUN_M7A_r3_00000__2505
FUN_M7A_r3_00000__2505:
  2505  3410           PSHS  X                           
  2507  8E24AF         LDX #0x24af                        ; desc[API_FE1C]: ->$2532 ->$24F9
  250a  AD9FFE1C       JSR [0xfe1c]                      
  250e  3510           PULS  X                           
  2510  39             RTS                               

; ---- function FUN_M7A_r3_00000__2511
FUN_M7A_r3_00000__2511:
  2511  3410           PSHS  X                           
  2513  8E24AF         LDX #0x24af                        ; desc[API_FE1A]: ->$2532 ->$24F9 $24ED
  2516  AD9FFE1A       JSR [0xfe1a]                      
  251a  3510           PULS  X                           
  251c  39             RTS                               
  251d  .db 14 6C 66 6F 20 31 20 66 72 65 71 3A 20 20 20 20  ; .lfo 1 freq:    
  252d  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7A_r3_00000__2532
FUN_M7A_r3_00000__2532:
  2532  3476           PSHS  U Y X B A                   
  2534  4F             CLRA                              
  2535  5F             CLRB                              
  2536  3606           PSHU  B A                         
  2538  CC7530         LDD #0x7530                       
  253b  3606           PSHU  B A                         
  253d  FC7078         LDD 0x7078                        
  2540  F37154         ADDD 0x7154                       
  2543  F3715C         ADDD 0x715c                       
  2546  3606           PSHU  B A                         
  2548  AD9FFCD8       JSR [0xfcd8]                      
  254c  3706           PULU  A B                         
  254e  FD7156         STD 0x7156                        
  2551  FC7156         LDD 0x7156                        
  2554  3606           PSHU  B A                         
  2556  CC0F38         LDD #0xf38                        
  2559  3606           PSHU  B A                         
  255b  AD9FFCF2       JSR [0xfcf2]                      
  255f  3706           PULU  A B                         
  2561  FD70DE         STD 0x70de                        
  2564  BE70DE         LDX 0x70de                        
  2567  108E0770       LDY #0x770                        
  256b  17E98F         LBSR 0x0efd                       
  256e  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__25f3_M7A_r3_00000__2570:
  2570  25F3           addr M7A_r3_00000::25f3           
  2572  25BA           addr M7A_r3_00000::25ba           
  2574  .db 25 AE 70 7C 71 58 00 00 71 5A 3E D8 3F 8B 35 00  ; %.p|qX..qZ>.?.5.
  2584  .db 00 75 30 00 01 02 06 1F 25 DE 00 00 00 00 70 7E  ; .u0.....%.....p~
  2594  .db 3F 61                                            ; ?a

; ---- function FUN_M7A_r3_00000__2596
FUN_M7A_r3_00000__2596:
  2596  3410           PSHS  X                           
  2598  8E2570         LDX #0x2570                        ; desc[API_FE6A]: ->$25F3 ->$25BA
  259b  AD9FFE6A       JSR [0xfe6a]                      
  259f  3510           PULS  X                           
  25a1  39             RTS                               

; ---- function FUN_M7A_r3_00000__25a2
FUN_M7A_r3_00000__25a2:
  25a2  3410           PSHS  X                           
  25a4  8E2570         LDX #0x2570                        ; desc[API_FDBC]: ->$25F3 ->$25BA
  25a7  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..%p"
  25ab  3510           PULS  X                           
  25ad  39             RTS                               

; ---- function FUN_M7A_r3_00000__25ae
FUN_M7A_r3_00000__25ae:
  25ae  3410           PSHS  X                           
  25b0  8E2570         LDX #0x2570                        ; desc[API_FE6C]: ->$25F3 ->$25BA
  25b3  AD9FFE6C       JSR [0xfe6c]                      
  25b7  3510           PULS  X                           
  25b9  39             RTS                               

; ---- function FUN_M7A_r3_00000__25ba
FUN_M7A_r3_00000__25ba:
  25ba  3410           PSHS  X                           
  25bc  8E2570         LDX #0x2570                        ; desc[API_FE6E]: ->$25F3 ->$25BA
  25bf  AD9FFE6E       JSR [0xfe6e]                      
  25c3  3510           PULS  X                           
  25c5  39             RTS                               

; ---- function FUN_M7A_r3_00000__25c6
FUN_M7A_r3_00000__25c6:
  25c6  3410           PSHS  X                           
  25c8  8E2570         LDX #0x2570                        ; desc[API_FE1C]: ->$25F3 ->$25BA
  25cb  AD9FFE1C       JSR [0xfe1c]                      
  25cf  3510           PULS  X                           
  25d1  39             RTS                               

; ---- function FUN_M7A_r3_00000__25d2
FUN_M7A_r3_00000__25d2:
  25d2  3410           PSHS  X                           
  25d4  8E2570         LDX #0x2570                        ; desc[API_FE1A]: ->$25F3 ->$25BA $25AE
  25d7  AD9FFE1A       JSR [0xfe1a]                      
  25db  3510           PULS  X                           
  25dd  39             RTS                               
  25de  .db 14 6C 66 6F 20 32 20 66 72 65 71 3A 20 20 20 20  ; .lfo 2 freq:    
  25ee  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7A_r3_00000__25f3
FUN_M7A_r3_00000__25f3:
  25f3  3476           PSHS  U Y X B A                   
  25f5  4F             CLRA                              
  25f6  5F             CLRB                              
  25f7  3606           PSHU  B A                         
  25f9  CC7530         LDD #0x7530                       
  25fc  3606           PSHU  B A                         
  25fe  FC707C         LDD 0x707c                        
  2601  F37158         ADDD 0x7158                       
  2604  F37162         ADDD 0x7162                       
  2607  3606           PSHU  B A                         
  2609  AD9FFCD8       JSR [0xfcd8]                      
  260d  3706           PULU  A B                         
  260f  FD715A         STD 0x715a                        
  2612  FC715A         LDD 0x715a                        
  2615  3606           PSHU  B A                         
  2617  CC0F38         LDD #0xf38                        
  261a  3606           PSHU  B A                         
  261c  AD9FFCF2       JSR [0xfcf2]                      
  2620  3706           PULU  A B                         
  2622  FD70DE         STD 0x70de                        
  2625  BE70DE         LDX 0x70de                        
  2628  108E0774       LDY #0x774                        
  262c  17E8CE         LBSR 0x0efd                       
  262f  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__269c_M7A_r3_00000__2631:
  2631  269C           addr M7A_r3_00000::269c           
  2633  267B           addr M7A_r3_00000::267b           
  2635  .db 26 6F 70 80 71 5E 00 00 71 60 3E D8 3F E9 36 00  ; &op.q^..q`>.?.6.
  2645  .db 00 00 60 00 01 00 02 21 26 87 00 00 00 00 00 00  ; ..`....!&.......
  2655  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2657
FUN_M7A_r3_00000__2657:
  2657  3410           PSHS  X                           
  2659  8E2631         LDX #0x2631                        ; desc[API_FE6A]: ->$269C ->$267B
  265c  AD9FFE6A       JSR [0xfe6a]                      
  2660  3510           PULS  X                           
  2662  39             RTS                               

; ---- function FUN_M7A_r3_00000__2663
FUN_M7A_r3_00000__2663:
  2663  3410           PSHS  X                           
  2665  8E2631         LDX #0x2631                        ; desc[API_FDBC]: ->$269C ->$267B
  2668  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..&1"
  266c  3510           PULS  X                           
  266e  39             RTS                               

; ---- function FUN_M7A_r3_00000__266f
FUN_M7A_r3_00000__266f:
  266f  3410           PSHS  X                           
  2671  8E2631         LDX #0x2631                        ; desc[API_FE6C]: ->$269C ->$267B
  2674  AD9FFE6C       JSR [0xfe6c]                      
  2678  3510           PULS  X                           
  267a  39             RTS                               

; ---- function FUN_M7A_r3_00000__267b
FUN_M7A_r3_00000__267b:
  267b  3410           PSHS  X                           
  267d  8E2631         LDX #0x2631                        ; desc[API_FE6E]: ->$269C ->$267B
  2680  AD9FFE6E       JSR [0xfe6e]                      
  2684  3510           PULS  X                           
  2686  39             RTS                               
  2687  .db 14 6C 66 6F 20 31 20 62 65 61 74 73 3A 20 20 20  ; .lfo 1 beats:   
  2697  .db 2F 32 34 20 20                                   ; /24  

; ---- function FUN_M7A_r3_00000__269c
FUN_M7A_r3_00000__269c:
  269c  3476           PSHS  U Y X B A                   
  269e  8E2631         LDX #0x2631                       
  26a1  AD9FFE76       JSR [0xfe76]                      
  26a5  FC7160         LDD 0x7160                        
  26a8  2605           BNE 0x26af                        
  26aa  FD715C         STD 0x715c                        
  26ad  201C           BRA 0x26cb                        
LAB_M7A_r3_00000__26af:
  26af  FC7106         LDD 0x7106                        
  26b2  3606           PSHU  B A                         
  26b4  CC0028         LDD #0x28                         
  26b7  3606           PSHU  B A                         
  26b9  AD9FFCEE       JSR [0xfcee]                      
  26bd  FC7160         LDD 0x7160                        
  26c0  3606           PSHU  B A                         
  26c2  AD9FFCEA       JSR [0xfcea]                      
  26c6  3706           PULU  A B                         
  26c8  FD715C         STD 0x715c                        
LAB_M7A_r3_00000__26cb:
  26cb  17FE64         LBSR 0x2532                       
  26ce  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__273b_M7A_r3_00000__26d0:
  26d0  273B           addr M7A_r3_00000::273b           
  26d2  271A           addr M7A_r3_00000::271a           
  26d4  .db 27 0E 70 82 71 64 00 00 71 66 3E D8 3F EB 37 00  ; '.p.qd..qf>.?.7.
  26e4  .db 00 00 60 00 01 00 02 21 27 26 00 00 00 00 00 00  ; ..`....!'&......
  26f4  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__26f6
FUN_M7A_r3_00000__26f6:
  26f6  3410           PSHS  X                           
  26f8  8E26D0         LDX #0x26d0                        ; desc[API_FE6A]: ->$273B ->$271A
  26fb  AD9FFE6A       JSR [0xfe6a]                      
  26ff  3510           PULS  X                           
  2701  39             RTS                               

; ---- function FUN_M7A_r3_00000__2702
FUN_M7A_r3_00000__2702:
  2702  3410           PSHS  X                           
  2704  8E26D0         LDX #0x26d0                        ; desc[API_FDBC]: ->$273B ->$271A
  2707  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..&."
  270b  3510           PULS  X                           
  270d  39             RTS                               

; ---- function FUN_M7A_r3_00000__270e
FUN_M7A_r3_00000__270e:
  270e  3410           PSHS  X                           
  2710  8E26D0         LDX #0x26d0                        ; desc[API_FE6C]: ->$273B ->$271A
  2713  AD9FFE6C       JSR [0xfe6c]                      
  2717  3510           PULS  X                           
  2719  39             RTS                               

; ---- function FUN_M7A_r3_00000__271a
FUN_M7A_r3_00000__271a:
  271a  3410           PSHS  X                           
  271c  8E26D0         LDX #0x26d0                        ; desc[API_FE6E]: ->$273B ->$271A
  271f  AD9FFE6E       JSR [0xfe6e]                      
  2723  3510           PULS  X                           
  2725  39             RTS                               
  2726  .db 14 6C 66 6F 20 32 20 62 65 61 74 73 3A 20 20 20  ; .lfo 2 beats:   
  2736  .db 2F 32 34 20 20                                   ; /24  

; ---- function FUN_M7A_r3_00000__273b
FUN_M7A_r3_00000__273b:
  273b  3476           PSHS  U Y X B A                   
  273d  8E26D0         LDX #0x26d0                       
  2740  AD9FFE76       JSR [0xfe76]                      
  2744  FC7166         LDD 0x7166                        
  2747  2605           BNE 0x274e                        
  2749  FD7162         STD 0x7162                        
  274c  201C           BRA 0x276a                        
LAB_M7A_r3_00000__274e:
  274e  FC7106         LDD 0x7106                        
  2751  3606           PSHU  B A                         
  2753  CC0028         LDD #0x28                         
  2756  3606           PSHU  B A                         
  2758  AD9FFCEE       JSR [0xfcee]                      
  275c  FC7166         LDD 0x7166                        
  275f  3606           PSHU  B A                         
  2761  AD9FFCEA       JSR [0xfcea]                      
  2765  3706           PULU  A B                         
  2767  FD7162         STD 0x7162                        
LAB_M7A_r3_00000__276a:
  276a  17FE86         LBSR 0x25f3                       
  276d  35F6           PULS  A B X Y U PC                
  276f  27DA27B927AD   addr[3]                           
  2775  .db 70 84 71 68 00 00 71 6A 3E D8 3F 87 38 00 00 00  ; p.qh..qj>.?.8...
  2785  .db 0C 00 01 00 0A 1E 27 C5 00 00 29 53 00 00 00 00  ; ......'...)S....

; ---- function FUN_M7A_r3_00000__2795
FUN_M7A_r3_00000__2795:
  2795  3410           PSHS  X                           
  2797  8E276F         LDX #0x276f                       
  279a  AD9FFC4E       JSR [0xfc4e]                      
  279e  3510           PULS  X                           
  27a0  39             RTS                               

; ---- function FUN_M7A_r3_00000__27a1
FUN_M7A_r3_00000__27a1:
  27a1  3410           PSHS  X                           
  27a3  8E276F         LDX #0x276f                       
  27a6  AD9FFC4C       JSR [0xfc4c]                      
  27aa  3510           PULS  X                           
  27ac  39             RTS                               

; ---- function FUN_M7A_r3_00000__27ad
FUN_M7A_r3_00000__27ad:
  27ad  3410           PSHS  X                           
  27af  8E276F         LDX #0x276f                       
  27b2  AD9FFC50       JSR [0xfc50]                      
  27b6  3510           PULS  X                           
  27b8  39             RTS                               

; ---- function FUN_M7A_r3_00000__27b9
FUN_M7A_r3_00000__27b9:
  27b9  3410           PSHS  X                           
  27bb  8E276F         LDX #0x276f                       
  27be  AD9FFC52       JSR [0xfc52]                      
  27c2  3510           PULS  X                           
  27c4  39             RTS                               
  27c5  .db 14 6C 66 6F 31 20 77 61 76 65 3A 20 20 20 20 20  ; .lfo1 wave:     
  27d5  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__27da
FUN_M7A_r3_00000__27da:
  27da  3476           PSHS  U Y X B A                   
  27dc  8E276F         LDX #0x276f                       
  27df  AD9FFE76       JSR [0xfe76]                      
  27e3  FC716A         LDD 0x716a                        
  27e6  C105           CMPB #0x5                         
  27e8  2F41           BLE 0x282b                        
  27ea  C106           CMPB #0x6                         
  27ec  2731           BEQ 0x281f                        
  27ee  C10A           CMPB #0xa                         
  27f0  2F1C           BLE 0x280e                        
  27f2  C10B           CMPB #0xb                         
  27f4  270D           BEQ 0x2803                        
  27f6  4F             CLRA                              
  27f7  C604           LDB #0x4                          
  27f9  FD70DE         STD 0x70de                        
  27fc  C602           LDB #0x2                          
  27fe  FD70E0         STD 0x70e0                        
  2801  2035           BRA 0x2838                        
LAB_M7A_r3_00000__2803:
  2803  4F             CLRA                              
  2804  C602           LDB #0x2                          
  2806  FD70DE         STD 0x70de                        
  2809  FD70E0         STD 0x70e0                        
  280c  202A           BRA 0x2838                        
LAB_M7A_r3_00000__280e:
  280e  FC716A         LDD 0x716a                        
  2811  830005         SUBD #0x5                         
  2814  FD70DE         STD 0x70de                        
  2817  CC0001         LDD #0x1                          
  281a  FD70E0         STD 0x70e0                        
  281d  2019           BRA 0x2838                        
LAB_M7A_r3_00000__281f:
  281f  4F             CLRA                              
  2820  5F             CLRB                              
  2821  FD70DE         STD 0x70de                        
  2824  C601           LDB #0x1                          
  2826  FD70E0         STD 0x70e0                        
  2829  200D           BRA 0x2838                        
LAB_M7A_r3_00000__282b:
  282b  FC716A         LDD 0x716a                        
  282e  FD70DE         STD 0x70de                        
  2831  4F             CLRA                              
  2832  5F             CLRB                              
  2833  FD70E0         STD 0x70e0                        
  2836  2000           BRA 0x2838                        
LAB_M7A_r3_00000__2838:
  2838  FC70DE         LDD 0x70de                        
  283b  3606           PSHU  B A                         
  283d  CC0041         LDD #0x41                         
  2840  3606           PSHU  B A                         
  2842  AD9FFCEE       JSR [0xfcee]                      
  2846  3706           PULU  A B                         
  2848  FD70DE         STD 0x70de                        
  284b  BE70DE         LDX 0x70de                        
  284e  108E0771       LDY #0x771                        
  2852  17E6A8         LBSR 0x0efd                       
  2855  BE70E0         LDX 0x70e0                        
  2858  108E0773       LDY #0x773                        
  285c  17E69E         LBSR 0x0efd                       
  285f  35F6           PULS  A B X Y U PC                
  2861  28CC28AB289F   addr[3]                           
  2867  .db 70 86 71 6C 00 00 71 6E 3E D8 3F 88 39 00 00 00  ; p.ql..qn>.?.9...
  2877  .db 0C 00 01 00 0A 1E 28 B7 00 00 29 53 00 00 00 00  ; ......(...)S....

; ---- function FUN_M7A_r3_00000__2887
FUN_M7A_r3_00000__2887:
  2887  3410           PSHS  X                           
  2889  8E2861         LDX #0x2861                       
  288c  AD9FFC4E       JSR [0xfc4e]                      
  2890  3510           PULS  X                           
  2892  39             RTS                               

; ---- function FUN_M7A_r3_00000__2893
FUN_M7A_r3_00000__2893:
  2893  3410           PSHS  X                           
  2895  8E2861         LDX #0x2861                       
  2898  AD9FFC4C       JSR [0xfc4c]                      
  289c  3510           PULS  X                           
  289e  39             RTS                               

; ---- function FUN_M7A_r3_00000__289f
FUN_M7A_r3_00000__289f:
  289f  3410           PSHS  X                           
  28a1  8E2861         LDX #0x2861                       
  28a4  AD9FFC50       JSR [0xfc50]                      
  28a8  3510           PULS  X                           
  28aa  39             RTS                               

; ---- function FUN_M7A_r3_00000__28ab
FUN_M7A_r3_00000__28ab:
  28ab  3410           PSHS  X                           
  28ad  8E2861         LDX #0x2861                       
  28b0  AD9FFC52       JSR [0xfc52]                      
  28b4  3510           PULS  X                           
  28b6  39             RTS                               
  28b7  .db 14 6C 66 6F 32 20 77 61 76 65 3A 20 20 20 20 20  ; .lfo2 wave:     
  28c7  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__28cc
FUN_M7A_r3_00000__28cc:
  28cc  3476           PSHS  U Y X B A                   
  28ce  8E2861         LDX #0x2861                       
  28d1  AD9FFE76       JSR [0xfe76]                      
  28d5  FC716E         LDD 0x716e                        
  28d8  C105           CMPB #0x5                         
  28da  2F41           BLE 0x291d                        
  28dc  C106           CMPB #0x6                         
  28de  2731           BEQ 0x2911                        
  28e0  C10A           CMPB #0xa                         
  28e2  2F1C           BLE 0x2900                        
  28e4  C10B           CMPB #0xb                         
  28e6  270D           BEQ 0x28f5                        
  28e8  4F             CLRA                              
  28e9  C604           LDB #0x4                          
  28eb  FD70DE         STD 0x70de                        
  28ee  C602           LDB #0x2                          
  28f0  FD70E0         STD 0x70e0                        
  28f3  2035           BRA 0x292a                        
LAB_M7A_r3_00000__28f5:
  28f5  4F             CLRA                              
  28f6  C602           LDB #0x2                          
  28f8  FD70DE         STD 0x70de                        
  28fb  FD70E0         STD 0x70e0                        
  28fe  202A           BRA 0x292a                        
LAB_M7A_r3_00000__2900:
  2900  FC716E         LDD 0x716e                        
  2903  830005         SUBD #0x5                         
  2906  FD70DE         STD 0x70de                        
  2909  CC0001         LDD #0x1                          
  290c  FD70E0         STD 0x70e0                        
  290f  2019           BRA 0x292a                        
LAB_M7A_r3_00000__2911:
  2911  4F             CLRA                              
  2912  5F             CLRB                              
  2913  FD70DE         STD 0x70de                        
  2916  C601           LDB #0x1                          
  2918  FD70E0         STD 0x70e0                        
  291b  200D           BRA 0x292a                        
LAB_M7A_r3_00000__291d:
  291d  FC716E         LDD 0x716e                        
  2920  FD70DE         STD 0x70de                        
  2923  4F             CLRA                              
  2924  5F             CLRB                              
  2925  FD70E0         STD 0x70e0                        
  2928  2000           BRA 0x292a                        
LAB_M7A_r3_00000__292a:
  292a  FC70DE         LDD 0x70de                        
  292d  3606           PSHU  B A                         
  292f  CC0041         LDD #0x41                         
  2932  3606           PSHU  B A                         
  2934  AD9FFCEE       JSR [0xfcee]                      
  2938  3706           PULU  A B                         
  293a  FD70DE         STD 0x70de                        
  293d  BE70DE         LDX 0x70de                        
  2940  108E0775       LDY #0x775                        
  2944  17E5B6         LBSR 0x0efd                       
  2947  BE70E0         LDX 0x70e0                        
  294a  108E0777       LDY #0x777                        
  294e  17E5AC         LBSR 0x0efd                       
  2951  35F6           PULS  A B X Y U PC                
  2953  .db 73 69 6E 65 20 20 20 20 20 20 73 71 75 61 72 65  ; sine      square
  2963  .db 20 20 20 20 73 61 77 74 6F 6F 74 68 20 20 74 72  ;     sawtooth  tr
  2973  .db 69 61 6E 67 6C 65 20 20 65 78 70 20 73 61 77 20  ; iangle  exp saw 
  2983  .db 20 20 65 78 70 20 74 72 69 20 20 20 74 72 67 20  ;   exp tri   trg 
  2993  .db 73 69 6E 65 20 20 74 72 67 20 73 61 77 20 20 20  ; sine  trg saw   
  29a3  .db 74 72 67 20 74 72 69 61 6E 67 74 72 67 20 65 78  ; trg triangtrg ex
  29b3  .db 70 73 61 77 74 72 67 20 65 78 70 74 72 69 74 6F  ; psawtrg exptrito
  29c3  .db 67 67 6C 65 20 6C 69 6E 74 6F 67 67 6C 65 20 65  ; ggle lintoggle e
  29d3  .db 78 70                                            ; xp
PTR_FUN_M7A_r3_00000__2a40_M7A_r3_00000__29d5:
  29d5  2A40           addr M7A_r3_00000::2a40           
  29d7  2A1F           addr M7A_r3_00000::2a1f           
  29d9  .db 2A 13 70 88 71 70 00 00 71 72 3E D8 3F 91 3A FF  ; *.p.qp..qr>.?.:.
  29e9  .db D8 00 00 00 01 00 03 20 2A 2B 00 00 00 00 00 00  ; ....... *+......
  29f9  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__29fb
FUN_M7A_r3_00000__29fb:
  29fb  3410           PSHS  X                           
  29fd  8E29D5         LDX #0x29d5                        ; desc[API_FE6A]: ->$2A40 ->$2A1F
  2a00  AD9FFE6A       JSR [0xfe6a]                      
  2a04  3510           PULS  X                           
  2a06  39             RTS                               

; ---- function FUN_M7A_r3_00000__2a07
FUN_M7A_r3_00000__2a07:
  2a07  3410           PSHS  X                           
  2a09  8E29D5         LDX #0x29d5                        ; desc[API_FDBC]: ->$2A40 ->$2A1F
  2a0c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)."
  2a10  3510           PULS  X                           
  2a12  39             RTS                               

; ---- function FUN_M7A_r3_00000__2a13
FUN_M7A_r3_00000__2a13:
  2a13  3410           PSHS  X                           
  2a15  8E29D5         LDX #0x29d5                        ; desc[API_FE6C]: ->$2A40 ->$2A1F
  2a18  AD9FFE6C       JSR [0xfe6c]                      
  2a1c  3510           PULS  X                           
  2a1e  39             RTS                               

; ---- function FUN_M7A_r3_00000__2a1f
FUN_M7A_r3_00000__2a1f:
  2a1f  3410           PSHS  X                           
  2a21  8E29D5         LDX #0x29d5                        ; desc[API_FE6E]: ->$2A40 ->$2A1F
  2a24  AD9FFE6E       JSR [0xfe6e]                      
  2a28  3510           PULS  X                           
  2a2a  39             RTS                               
  2a2b  .db 14 6C 66 6F 31 20 74 68 72 65 73 68 3A 20 20 20  ; .lfo1 thresh:   
  2a3b  .db 20 64 42 20 20                                   ;  dB  

; ---- function FUN_M7A_r3_00000__2a40
FUN_M7A_r3_00000__2a40:
  2a40  3476           PSHS  U Y X B A                   
  2a42  8E29D5         LDX #0x29d5                       
  2a45  AD9FFE76       JSR [0xfe76]                      
  2a49  FC7172         LDD 0x7172                        
  2a4c  C30029         ADDD #0x29                        
  2a4f  58             LSLB                              
  2a50  49             ROLA                              
  2a51  C32B03         ADDD #0x2b03                      
  2a54  1F01           TFR D,X                           
  2a56  FC600D         LDD 0x600d                        
  2a59  308B           LEAX D,X                          
  2a5b  EC84           LDD ,X                            
  2a5d  FD70DE         STD 0x70de                        
  2a60  BE70DE         LDX 0x70de                        
  2a63  108E0778       LDY #0x778                        
  2a67  17E493         LBSR 0x0efd                       
  2a6a  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2ad7_M7A_r3_00000__2a6c:
  2a6c  2AD7           addr M7A_r3_00000::2ad7           
  2a6e  2AB6           addr M7A_r3_00000::2ab6           
  2a70  .db 2A AA 70 8A 71 74 00 00 71 76 3E D8 3F 93 3B FF  ; *.p.qt..qv>.?.;.
  2a80  .db D8 00 00 00 01 00 03 20 2A C2 00 00 00 00 00 00  ; ....... *.......
  2a90  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2a92
FUN_M7A_r3_00000__2a92:
  2a92  3410           PSHS  X                           
  2a94  8E2A6C         LDX #0x2a6c                        ; desc[API_FE6A]: ->$2AD7 ->$2AB6
  2a97  AD9FFE6A       JSR [0xfe6a]                      
  2a9b  3510           PULS  X                           
  2a9d  39             RTS                               

; ---- function FUN_M7A_r3_00000__2a9e
FUN_M7A_r3_00000__2a9e:
  2a9e  3410           PSHS  X                           
  2aa0  8E2A6C         LDX #0x2a6c                        ; desc[API_FDBC]: ->$2AD7 ->$2AB6
  2aa3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..*l"
  2aa7  3510           PULS  X                           
  2aa9  39             RTS                               

; ---- function FUN_M7A_r3_00000__2aaa
FUN_M7A_r3_00000__2aaa:
  2aaa  3410           PSHS  X                           
  2aac  8E2A6C         LDX #0x2a6c                        ; desc[API_FE6C]: ->$2AD7 ->$2AB6
  2aaf  AD9FFE6C       JSR [0xfe6c]                      
  2ab3  3510           PULS  X                           
  2ab5  39             RTS                               

; ---- function FUN_M7A_r3_00000__2ab6
FUN_M7A_r3_00000__2ab6:
  2ab6  3410           PSHS  X                           
  2ab8  8E2A6C         LDX #0x2a6c                        ; desc[API_FE6E]: ->$2AD7 ->$2AB6
  2abb  AD9FFE6E       JSR [0xfe6e]                      
  2abf  3510           PULS  X                           
  2ac1  39             RTS                               
  2ac2  .db 14 6C 66 6F 32 20 74 68 72 65 73 68 3A 20 20 20  ; .lfo2 thresh:   
  2ad2  .db 20 64 42 20 20                                   ;  dB  

; ---- function FUN_M7A_r3_00000__2ad7
FUN_M7A_r3_00000__2ad7:
  2ad7  3476           PSHS  U Y X B A                   
  2ad9  8E2A6C         LDX #0x2a6c                       
  2adc  AD9FFE76       JSR [0xfe76]                      
  2ae0  FC7176         LDD 0x7176                        
  2ae3  C30029         ADDD #0x29                        
  2ae6  58             LSLB                              
  2ae7  49             ROLA                              
  2ae8  C32B03         ADDD #0x2b03                      
  2aeb  1F01           TFR D,X                           
  2aed  FC600D         LDD 0x600d                        
  2af0  308B           LEAX D,X                          
  2af2  EC84           LDD ,X                            
  2af4  FD70DE         STD 0x70de                        
  2af7  BE70DE         LDX 0x70de                        
  2afa  108E0779       LDY #0x779                        
  2afe  17E3FC         LBSR 0x0efd                       
  2b01  35F6           PULS  A B X Y U PC                
  2b03  .db 01 48 01 70 01 9D 01 CF 02 07 02 47 02 8E 02 DE  ; .H.p.......G....
  2b13  .db 03 37 03 9B 04 0C 04 8B 05 18 05 B8 06 6A 07 33  ; .7...........j.3
  2b23  .db 08 13 09 10 0A 2B 0B 68 0C CD 0E 5D 10 1D 12 14  ; .....+.h...]....
  2b33  .db 14 49 16 C3 19 8A 1C A8 20 27 24 13 28 7A 2D 6A  ; .I...... '$.(z-j
  2b43  .db 32 F5 39 2C 40 26 47 FA 50 C3 5A 9D 65 AC 72 14  ; 2.9,@&G.P.Z.e.r.
  2b53  .db 7F FF 7F FF                                      ; ....
PTR_FUN_M7A_r3_00000__2bc2_M7A_r3_00000__2b57:
  2b57  2BC2           addr M7A_r3_00000::2bc2           
  2b59  2BA1           addr M7A_r3_00000::2ba1           
  2b5b  .db 2B 95 70 8C 71 78 00 00 71 7A 3E D8 3F 8D 3C 00  ; +.p.qx..qz>.?.<.
  2b6b  .db 00 75 30 00 01 02 06 1F 2B AD 00 00 00 00 00 00  ; .u0.....+.......
  2b7b  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2b7d
FUN_M7A_r3_00000__2b7d:
  2b7d  3410           PSHS  X                           
  2b7f  8E2B57         LDX #0x2b57                        ; desc[API_FE6A]: ->$2BC2 ->$2BA1
  2b82  AD9FFE6A       JSR [0xfe6a]                      
  2b86  3510           PULS  X                           
  2b88  39             RTS                               

; ---- function FUN_M7A_r3_00000__2b89
FUN_M7A_r3_00000__2b89:
  2b89  3410           PSHS  X                           
  2b8b  8E2B57         LDX #0x2b57                        ; desc[API_FDBC]: ->$2BC2 ->$2BA1
  2b8e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..+W"
  2b92  3510           PULS  X                           
  2b94  39             RTS                               

; ---- function FUN_M7A_r3_00000__2b95
FUN_M7A_r3_00000__2b95:
  2b95  3410           PSHS  X                           
  2b97  8E2B57         LDX #0x2b57                        ; desc[API_FE6C]: ->$2BC2 ->$2BA1
  2b9a  AD9FFE6C       JSR [0xfe6c]                      
  2b9e  3510           PULS  X                           
  2ba0  39             RTS                               

; ---- function FUN_M7A_r3_00000__2ba1
FUN_M7A_r3_00000__2ba1:
  2ba1  3410           PSHS  X                           
  2ba3  8E2B57         LDX #0x2b57                        ; desc[API_FE6E]: ->$2BC2 ->$2BA1
  2ba6  AD9FFE6E       JSR [0xfe6e]                      
  2baa  3510           PULS  X                           
  2bac  39             RTS                               
  2bad  .db 14 6C 66 6F 20 31 20 6D 6F 64 3A 20 20 20 20 20  ; .lfo 1 mod:     
  2bbd  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7A_r3_00000__2bc2
FUN_M7A_r3_00000__2bc2:
  2bc2  3476           PSHS  U Y X B A                   
  2bc4  8E2B57         LDX #0x2b57                       
  2bc7  AD9FFE76       JSR [0xfe76]                      
  2bcb  FC717A         LDD 0x717a                        
  2bce  3606           PSHU  B A                         
  2bd0  CC0F38         LDD #0xf38                        
  2bd3  3606           PSHU  B A                         
  2bd5  AD9FFCF2       JSR [0xfcf2]                      
  2bd9  3706           PULU  A B                         
  2bdb  FD70DE         STD 0x70de                        
  2bde  BE70DE         LDX 0x70de                        
  2be1  108E0772       LDY #0x772                        
  2be5  17E315         LBSR 0x0efd                       
  2be8  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2c55_M7A_r3_00000__2bea:
  2bea  2C55           addr M7A_r3_00000::2c55           
  2bec  2C34           addr M7A_r3_00000::2c34           
  2bee  .db 2C 28 70 8E 71 7C 00 00 71 7E 3E D8 3F 8F 3D 00  ; ,(p.q|..q~>.?.=.
  2bfe  .db 00 75 30 00 01 02 06 1F 2C 40 00 00 00 00 00 00  ; .u0.....,@......
  2c0e  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2c10
FUN_M7A_r3_00000__2c10:
  2c10  3410           PSHS  X                           
  2c12  8E2BEA         LDX #0x2bea                        ; desc[API_FE6A]: ->$2C55 ->$2C34
  2c15  AD9FFE6A       JSR [0xfe6a]                      
  2c19  3510           PULS  X                           
  2c1b  39             RTS                               

; ---- function FUN_M7A_r3_00000__2c1c
FUN_M7A_r3_00000__2c1c:
  2c1c  3410           PSHS  X                           
  2c1e  8E2BEA         LDX #0x2bea                        ; desc[API_FDBC]: ->$2C55 ->$2C34
  2c21  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..+."
  2c25  3510           PULS  X                           
  2c27  39             RTS                               

; ---- function FUN_M7A_r3_00000__2c28
FUN_M7A_r3_00000__2c28:
  2c28  3410           PSHS  X                           
  2c2a  8E2BEA         LDX #0x2bea                        ; desc[API_FE6C]: ->$2C55 ->$2C34
  2c2d  AD9FFE6C       JSR [0xfe6c]                      
  2c31  3510           PULS  X                           
  2c33  39             RTS                               

; ---- function FUN_M7A_r3_00000__2c34
FUN_M7A_r3_00000__2c34:
  2c34  3410           PSHS  X                           
  2c36  8E2BEA         LDX #0x2bea                        ; desc[API_FE6E]: ->$2C55 ->$2C34
  2c39  AD9FFE6E       JSR [0xfe6e]                      
  2c3d  3510           PULS  X                           
  2c3f  39             RTS                               
  2c40  .db 14 6C 66 6F 20 32 20 6D 6F 64 3A 20 20 20 20 20  ; .lfo 2 mod:     
  2c50  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7A_r3_00000__2c55
FUN_M7A_r3_00000__2c55:
  2c55  3476           PSHS  U Y X B A                   
  2c57  8E2BEA         LDX #0x2bea                       
  2c5a  AD9FFE76       JSR [0xfe76]                      
  2c5e  FC717E         LDD 0x717e                        
  2c61  3606           PSHU  B A                         
  2c63  CC0F38         LDD #0xf38                        
  2c66  3606           PSHU  B A                         
  2c68  AD9FFCF2       JSR [0xfcf2]                      
  2c6c  3706           PULU  A B                         
  2c6e  FD70DE         STD 0x70de                        
  2c71  BE70DE         LDX 0x70de                        
  2c74  108E0776       LDY #0x776                        
  2c78  17E282         LBSR 0x0efd                       
  2c7b  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2cfa_M7A_r3_00000__2c7d:
  2c7d  2CFA           addr M7A_r3_00000::2cfa           
  2c7f  2CC7           addr M7A_r3_00000::2cc7           
  2c81  .db 2C BB 70 90 71 80 00 00 71 82 3E D8 40 05 3E 00  ; ,.p.q...q.>.@.>.
  2c91  .db 00 27 10 00 01 01 06 20 2C D3 00 00 00 00 00 00  ; .'..... ,.......
  2ca1  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2ca3
FUN_M7A_r3_00000__2ca3:
  2ca3  3410           PSHS  X                           
  2ca5  8E2C7D         LDX #0x2c7d                        ; desc[API_FE6A]: ->$2CFA ->$2CC7
  2ca8  AD9FFE6A       JSR [0xfe6a]                      
  2cac  3510           PULS  X                           
  2cae  39             RTS                               

; ---- function FUN_M7A_r3_00000__2caf
FUN_M7A_r3_00000__2caf:
  2caf  3410           PSHS  X                           
  2cb1  8E2C7D         LDX #0x2c7d                        ; desc[API_FDBC]: ->$2CFA ->$2CC7
  2cb4  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..,}"
  2cb8  3510           PULS  X                           
  2cba  39             RTS                               

; ---- function FUN_M7A_r3_00000__2cbb
FUN_M7A_r3_00000__2cbb:
  2cbb  3410           PSHS  X                           
  2cbd  8E2C7D         LDX #0x2c7d                        ; desc[API_FE6C]: ->$2CFA ->$2CC7
  2cc0  AD9FFE6C       JSR [0xfe6c]                      
  2cc4  3510           PULS  X                           
  2cc6  39             RTS                               

; ---- function FUN_M7A_r3_00000__2cc7
FUN_M7A_r3_00000__2cc7:
  2cc7  3410           PSHS  X                           
  2cc9  8E2C7D         LDX #0x2c7d                        ; desc[API_FE6E]: ->$2CFA ->$2CC7
  2ccc  AD9FFE6E       JSR [0xfe6e]                      
  2cd0  3510           PULS  X                           
  2cd2  39             RTS                               
  2cd3  .db 14 65 6E 76 31 20 61 74 74 61 63 6B 3A 20 20 20  ; .env1 attack:   
  2ce3  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7A_r3_00000__2ce8
FUN_M7A_r3_00000__2ce8:
  2ce8  3406           PSHS  B A                         
  2cea  17FFB6         LBSR 0x2ca3                       
  2ced  C605           LDB #0x5                          
  2cef  F76066         STB 0x6066                        
  2cf2  CC0064         LDD #0x64                         
  2cf5  FD60DC         STD 0x60dc                        
  2cf8  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__2cfa
FUN_M7A_r3_00000__2cfa:
  2cfa  3476           PSHS  U Y X B A                   
  2cfc  8E2C7D         LDX #0x2c7d                       
  2cff  AD9FFE76       JSR [0xfe76]                      
  2d03  FC7182         LDD 0x7182                        
  2d06  1701E0         LBSR 0x2ee9                       
  2d09  FD70DE         STD 0x70de                        
  2d0c  BE70DE         LDX 0x70de                        
  2d0f  108E0768       LDY #0x768                        
  2d13  17E1E7         LBSR 0x0efd                       
  2d16  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2d95_M7A_r3_00000__2d18:
  2d18  2D95           addr M7A_r3_00000::2d95           
  2d1a  2D62           addr M7A_r3_00000::2d62           
  2d1c  .db 2D 56 70 92 71 84 00 00 71 86 3E D8 40 07 3F 00  ; -Vp.q...q.>.@.?.
  2d2c  .db 00 27 10 00 01 01 06 20 2D 6E 00 00 00 00 00 00  ; .'..... -n......
  2d3c  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2d3e
FUN_M7A_r3_00000__2d3e:
  2d3e  3410           PSHS  X                           
  2d40  8E2D18         LDX #0x2d18                        ; desc[API_FE6A]: ->$2D95 ->$2D62
  2d43  AD9FFE6A       JSR [0xfe6a]                      
  2d47  3510           PULS  X                           
  2d49  39             RTS                               

; ---- function FUN_M7A_r3_00000__2d4a
FUN_M7A_r3_00000__2d4a:
  2d4a  3410           PSHS  X                           
  2d4c  8E2D18         LDX #0x2d18                        ; desc[API_FDBC]: ->$2D95 ->$2D62
  2d4f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..-."
  2d53  3510           PULS  X                           
  2d55  39             RTS                               

; ---- function FUN_M7A_r3_00000__2d56
FUN_M7A_r3_00000__2d56:
  2d56  3410           PSHS  X                           
  2d58  8E2D18         LDX #0x2d18                        ; desc[API_FE6C]: ->$2D95 ->$2D62
  2d5b  AD9FFE6C       JSR [0xfe6c]                      
  2d5f  3510           PULS  X                           
  2d61  39             RTS                               

; ---- function FUN_M7A_r3_00000__2d62
FUN_M7A_r3_00000__2d62:
  2d62  3410           PSHS  X                           
  2d64  8E2D18         LDX #0x2d18                        ; desc[API_FE6E]: ->$2D95 ->$2D62
  2d67  AD9FFE6E       JSR [0xfe6e]                      
  2d6b  3510           PULS  X                           
  2d6d  39             RTS                               
  2d6e  .db 14 65 6E 76 32 20 61 74 74 61 63 6B 3A 20 20 20  ; .env2 attack:   
  2d7e  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7A_r3_00000__2d83
FUN_M7A_r3_00000__2d83:
  2d83  3406           PSHS  B A                         
  2d85  17FFB6         LBSR 0x2d3e                       
  2d88  C605           LDB #0x5                          
  2d8a  F76066         STB 0x6066                        
  2d8d  CC0064         LDD #0x64                         
  2d90  FD60DC         STD 0x60dc                        
  2d93  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__2d95
FUN_M7A_r3_00000__2d95:
  2d95  3476           PSHS  U Y X B A                   
  2d97  8E2D18         LDX #0x2d18                       
  2d9a  AD9FFE76       JSR [0xfe76]                      
  2d9e  FC7186         LDD 0x7186                        
  2da1  170145         LBSR 0x2ee9                       
  2da4  FD70DE         STD 0x70de                        
  2da7  BE70DE         LDX 0x70de                        
  2daa  108E076C       LDY #0x76c                        
  2dae  17E14C         LBSR 0x0efd                       
  2db1  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2e30_M7A_r3_00000__2db3:
  2db3  2E30           addr M7A_r3_00000::2e30           
  2db5  2DFD           addr M7A_r3_00000::2dfd           
  2db7  .db 2D F1 70 94 71 88 00 00 71 8A 3E D8 40 09 40 00  ; -.p.q...q.>.@.@.
  2dc7  .db 00 27 10 00 01 01 06 1F 2E 09 00 00 00 00 00 00  ; .'..............
  2dd7  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2dd9
FUN_M7A_r3_00000__2dd9:
  2dd9  3410           PSHS  X                           
  2ddb  8E2DB3         LDX #0x2db3                        ; desc[API_FE6A]: ->$2E30 ->$2DFD
  2dde  AD9FFE6A       JSR [0xfe6a]                      
  2de2  3510           PULS  X                           
  2de4  39             RTS                               

; ---- function FUN_M7A_r3_00000__2de5
FUN_M7A_r3_00000__2de5:
  2de5  3410           PSHS  X                           
  2de7  8E2DB3         LDX #0x2db3                        ; desc[API_FDBC]: ->$2E30 ->$2DFD
  2dea  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..-."
  2dee  3510           PULS  X                           
  2df0  39             RTS                               

; ---- function FUN_M7A_r3_00000__2df1
FUN_M7A_r3_00000__2df1:
  2df1  3410           PSHS  X                           
  2df3  8E2DB3         LDX #0x2db3                        ; desc[API_FE6C]: ->$2E30 ->$2DFD
  2df6  AD9FFE6C       JSR [0xfe6c]                      
  2dfa  3510           PULS  X                           
  2dfc  39             RTS                               

; ---- function FUN_M7A_r3_00000__2dfd
FUN_M7A_r3_00000__2dfd:
  2dfd  3410           PSHS  X                           
  2dff  8E2DB3         LDX #0x2db3                        ; desc[API_FE6E]: ->$2E30 ->$2DFD
  2e02  AD9FFE6E       JSR [0xfe6e]                      
  2e06  3510           PULS  X                           
  2e08  39             RTS                               
  2e09  .db 14 65 6E 76 31 20 64 65 63 61 79 3A 20 20 20 20  ; .env1 decay:    
  2e19  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7A_r3_00000__2e1e
FUN_M7A_r3_00000__2e1e:
  2e1e  3406           PSHS  B A                         
  2e20  17FFB6         LBSR 0x2dd9                       
  2e23  C605           LDB #0x5                          
  2e25  F76066         STB 0x6066                        
  2e28  CC0064         LDD #0x64                         
  2e2b  FD60DC         STD 0x60dc                        
  2e2e  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__2e30
FUN_M7A_r3_00000__2e30:
  2e30  3476           PSHS  U Y X B A                   
  2e32  8E2DB3         LDX #0x2db3                       
  2e35  AD9FFE76       JSR [0xfe76]                      
  2e39  FC718A         LDD 0x718a                        
  2e3c  1700AA         LBSR 0x2ee9                       
  2e3f  FD70DE         STD 0x70de                        
  2e42  BE70DE         LDX 0x70de                        
  2e45  108E0769       LDY #0x769                        
  2e49  17E0B1         LBSR 0x0efd                       
  2e4c  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__2ecb_M7A_r3_00000__2e4e:
  2e4e  2ECB           addr M7A_r3_00000::2ecb           
  2e50  2E98           addr M7A_r3_00000::2e98           
  2e52  .db 2E 8C 70 96 71 8C 00 00 71 8E 3E D8 40 0B 41 00  ; ..p.q...q.>.@.A.
  2e62  .db 00 27 10 00 01 01 06 1F 2E A4 00 00 00 00 00 00  ; .'..............
  2e72  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__2e74
FUN_M7A_r3_00000__2e74:
  2e74  3410           PSHS  X                           
  2e76  8E2E4E         LDX #0x2e4e                        ; desc[API_FE6A]: ->$2ECB ->$2E98
  2e79  AD9FFE6A       JSR [0xfe6a]                      
  2e7d  3510           PULS  X                           
  2e7f  39             RTS                               

; ---- function FUN_M7A_r3_00000__2e80
FUN_M7A_r3_00000__2e80:
  2e80  3410           PSHS  X                           
  2e82  8E2E4E         LDX #0x2e4e                        ; desc[API_FDBC]: ->$2ECB ->$2E98
  2e85  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...N"
  2e89  3510           PULS  X                           
  2e8b  39             RTS                               

; ---- function FUN_M7A_r3_00000__2e8c
FUN_M7A_r3_00000__2e8c:
  2e8c  3410           PSHS  X                           
  2e8e  8E2E4E         LDX #0x2e4e                        ; desc[API_FE6C]: ->$2ECB ->$2E98
  2e91  AD9FFE6C       JSR [0xfe6c]                      
  2e95  3510           PULS  X                           
  2e97  39             RTS                               

; ---- function FUN_M7A_r3_00000__2e98
FUN_M7A_r3_00000__2e98:
  2e98  3410           PSHS  X                           
  2e9a  8E2E4E         LDX #0x2e4e                        ; desc[API_FE6E]: ->$2ECB ->$2E98
  2e9d  AD9FFE6E       JSR [0xfe6e]                      
  2ea1  3510           PULS  X                           
  2ea3  39             RTS                               
  2ea4  .db 14 65 6E 76 32 20 64 65 63 61 79 3A 20 20 20 20  ; .env2 decay:    
  2eb4  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7A_r3_00000__2eb9
FUN_M7A_r3_00000__2eb9:
  2eb9  3406           PSHS  B A                         
  2ebb  17FFB6         LBSR 0x2e74                       
  2ebe  C605           LDB #0x5                          
  2ec0  F76066         STB 0x6066                        
  2ec3  CC0064         LDD #0x64                         
  2ec6  FD60DC         STD 0x60dc                        
  2ec9  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__2ecb
FUN_M7A_r3_00000__2ecb:
  2ecb  3476           PSHS  U Y X B A                   
  2ecd  8E2E4E         LDX #0x2e4e                       
  2ed0  AD9FFE76       JSR [0xfe76]                      
  2ed4  FC718E         LDD 0x718e                        
  2ed7  17000F         LBSR 0x2ee9                       
  2eda  FD70DE         STD 0x70de                        
  2edd  BE70DE         LDX 0x70de                        
  2ee0  108E076D       LDY #0x76d                        
  2ee4  17E016         LBSR 0x0efd                       
  2ee7  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7A_r3_00000__2ee9
FUN_M7A_r3_00000__2ee9:
  2ee9  3470           PSHS  U Y X                       
  2eeb  FD70DE         STD 0x70de                        
  2eee  FC70DE         LDD 0x70de                        
  2ef1  1083000A       CMPD #0xa                         
  2ef5  102D0085       LBLT 0x2f7e                       
  2ef9  FC70DE         LDD 0x70de                        
  2efc  10830064       CMPD #0x64                        
  2f00  102D0055       LBLT 0x2f59                       
  2f04  FC70DE         LDD 0x70de                        
  2f07  108303E8       CMPD #0x3e8                       
  2f0b  102D0025       LBLT 0x2f34                       
  2f0f  FC70DE         LDD 0x70de                        
  2f12  3606           PSHU  B A                         
  2f14  CC03E8         LDD #0x3e8                        
  2f17  3606           PSHU  B A                         
  2f19  AD9FFCEA       JSR [0xfcea]                      
  2f1d  3706           PULU  A B                         
  2f1f  830001         SUBD #0x1                         
  2f22  58             LSLB                              
  2f23  49             ROLA                              
  2f24  C32FCD         ADDD #0x2fcd                      
  2f27  F3600D         ADDD 0x600d                       
  2f2a  1F01           TFR D,X                           
  2f2c  EC84           LDD ,X                            
  2f2e  FD70DE         STD 0x70de                        
  2f31  16005F         LBRA 0x2f93                       
LAB_M7A_r3_00000__2f34:
  2f34  FC70DE         LDD 0x70de                        
  2f37  3606           PSHU  B A                         
  2f39  CC0064         LDD #0x64                         
  2f3c  3606           PSHU  B A                         
  2f3e  AD9FFCEA       JSR [0xfcea]                      
  2f42  3706           PULU  A B                         
  2f44  830001         SUBD #0x1                         
  2f47  58             LSLB                              
  2f48  49             ROLA                              
  2f49  C32FBB         ADDD #0x2fbb                      
  2f4c  F3600D         ADDD 0x600d                       
  2f4f  1F01           TFR D,X                           
  2f51  EC84           LDD ,X                            
  2f53  FD70DE         STD 0x70de                        
  2f56  16003A         LBRA 0x2f93                       
LAB_M7A_r3_00000__2f59:
  2f59  FC70DE         LDD 0x70de                        
  2f5c  3606           PSHU  B A                         
  2f5e  CC000A         LDD #0xa                          
  2f61  3606           PSHU  B A                         
  2f63  AD9FFCEA       JSR [0xfcea]                      
  2f67  3706           PULU  A B                         
  2f69  830001         SUBD #0x1                         
  2f6c  58             LSLB                              
  2f6d  49             ROLA                              
  2f6e  C32FA9         ADDD #0x2fa9                      
  2f71  F3600D         ADDD 0x600d                       
  2f74  1F01           TFR D,X                           
  2f76  EC84           LDD ,X                            
  2f78  FD70DE         STD 0x70de                        
  2f7b  160015         LBRA 0x2f93                       
LAB_M7A_r3_00000__2f7e:
  2f7e  FC70DE         LDD 0x70de                        
  2f81  58             LSLB                              
  2f82  49             ROLA                              
  2f83  C32F95         ADDD #0x2f95                      
  2f86  F3600D         ADDD 0x600d                       
  2f89  1F01           TFR D,X                           
  2f8b  EC84           LDD ,X                            
  2f8d  FD70DE         STD 0x70de                        
  2f90  160000         LBRA 0x2f93                       
LAB_M7A_r3_00000__2f93:
  2f93  35F0           PULS  X Y U PC                    

; ---- function FUN_M7A_r3_00000__2f95
FUN_M7A_r3_00000__2f95:
  2f95  7FFF4D         CLR 0xff4d                        
  2f98  B82A5E         EORA 0x2a5e                       
  2f9b  1D             SEX                               
  2f9c  161624         LBRA 0x45c3                       
  2f9f  .db 11 DF 0E FB 0C E5 0B 52 0A 16 09 19 04 97 03 12  ; .......R........
  2faf  .db 02 4E 01 D9 01 8A 01 52 01 28 01 07 00 ED 00 76  ; .N.....R.(.....v
  2fbf  .db 00 4F 00 3B 00 2F 00 28 00 22 00 1E 00 1A 00 18  ; .O.;./.(."......
  2fcf  .db 00 0C 00 08 00 06 00 05 00 04 00 03 00 03 00 03  ; ................
  2fdf  .db 00 02                                            ; ..
PTR_FUN_M7A_r3_00000__304c_M7A_r3_00000__2fe1:
  2fe1  304C           addr M7A_r3_00000::304c           
  2fe3  302B           addr M7A_r3_00000::302b           
  2fe5  .db 30 1F 70 98 71 90 00 00 71 92 3E D8 40 0D 42 FF  ; 0.p.q...q.>.@.B.
  2ff5  .db D8 00 00 00 01 00 03 21 30 37 00 00 00 00 00 00  ; .......!07......
  3005  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3007
FUN_M7A_r3_00000__3007:
  3007  3410           PSHS  X                           
  3009  8E2FE1         LDX #0x2fe1                        ; desc[API_FE6A]: ->$304C ->$302B
  300c  AD9FFE6A       JSR [0xfe6a]                      
  3010  3510           PULS  X                           
  3012  39             RTS                               

; ---- function FUN_M7A_r3_00000__3013
FUN_M7A_r3_00000__3013:
  3013  3410           PSHS  X                           
  3015  8E2FE1         LDX #0x2fe1                        ; desc[API_FDBC]: ->$304C ->$302B
  3018  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94../."
  301c  3510           PULS  X                           
  301e  39             RTS                               

; ---- function FUN_M7A_r3_00000__301f
FUN_M7A_r3_00000__301f:
  301f  3410           PSHS  X                           
  3021  8E2FE1         LDX #0x2fe1                        ; desc[API_FE6C]: ->$304C ->$302B
  3024  AD9FFE6C       JSR [0xfe6c]                      
  3028  3510           PULS  X                           
  302a  39             RTS                               

; ---- function FUN_M7A_r3_00000__302b
FUN_M7A_r3_00000__302b:
  302b  3410           PSHS  X                           
  302d  8E2FE1         LDX #0x2fe1                        ; desc[API_FE6E]: ->$304C ->$302B
  3030  AD9FFE6E       JSR [0xfe6e]                      
  3034  3510           PULS  X                           
  3036  39             RTS                               
  3037  .db 14 74 68 72 65 73 68 6F 6C 64 20 31 3A 20 20 20  ; .threshold 1:   
  3047  .db 20 20 64 42 20                                   ;   dB 

; ---- function FUN_M7A_r3_00000__304c
FUN_M7A_r3_00000__304c:
  304c  3476           PSHS  U Y X B A                   
  304e  8E2FE1         LDX #0x2fe1                       
  3051  AD9FFE76       JSR [0xfe76]                      
  3055  FC7192         LDD 0x7192                        
  3058  3606           PSHU  B A                         
  305a  CC0155         LDD #0x155                        
  305d  3606           PSHU  B A                         
  305f  AD9FFCEC       JSR [0xfcec]                      
  3063  3706           PULU  A B                         
  3065  FD70DE         STD 0x70de                        
  3068  BE70DE         LDX 0x70de                        
  306b  108E076A       LDY #0x76a                        
  306f  17DE8B         LBSR 0x0efd                       
  3072  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__30df_M7A_r3_00000__3074:
  3074  30DF           addr M7A_r3_00000::30df           
  3076  30BE           addr M7A_r3_00000::30be           
  3078  .db 30 B2 70 9A 71 94 00 00 71 96 3E D8 40 0F 43 FF  ; 0.p.q...q.>.@.C.
  3088  .db D8 00 00 00 01 00 03 21 30 CA 00 00 00 00 00 00  ; .......!0.......
  3098  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__309a
FUN_M7A_r3_00000__309a:
  309a  3410           PSHS  X                           
  309c  8E3074         LDX #0x3074                        ; desc[API_FE6A]: ->$30DF ->$30BE
  309f  AD9FFE6A       JSR [0xfe6a]                      
  30a3  3510           PULS  X                           
  30a5  39             RTS                               

; ---- function FUN_M7A_r3_00000__30a6
FUN_M7A_r3_00000__30a6:
  30a6  3410           PSHS  X                           
  30a8  8E3074         LDX #0x3074                        ; desc[API_FDBC]: ->$30DF ->$30BE
  30ab  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..0t"
  30af  3510           PULS  X                           
  30b1  39             RTS                               

; ---- function FUN_M7A_r3_00000__30b2
FUN_M7A_r3_00000__30b2:
  30b2  3410           PSHS  X                           
  30b4  8E3074         LDX #0x3074                        ; desc[API_FE6C]: ->$30DF ->$30BE
  30b7  AD9FFE6C       JSR [0xfe6c]                      
  30bb  3510           PULS  X                           
  30bd  39             RTS                               

; ---- function FUN_M7A_r3_00000__30be
FUN_M7A_r3_00000__30be:
  30be  3410           PSHS  X                           
  30c0  8E3074         LDX #0x3074                        ; desc[API_FE6E]: ->$30DF ->$30BE
  30c3  AD9FFE6E       JSR [0xfe6e]                      
  30c7  3510           PULS  X                           
  30c9  39             RTS                               
  30ca  .db 14 74 68 72 65 73 68 6F 6C 64 20 32 3A 20 20 20  ; .threshold 2:   
  30da  .db 20 20 64 42 20                                   ;   dB 

; ---- function FUN_M7A_r3_00000__30df
FUN_M7A_r3_00000__30df:
  30df  3476           PSHS  U Y X B A                   
  30e1  8E3074         LDX #0x3074                       
  30e4  AD9FFE76       JSR [0xfe76]                      
  30e8  FC7196         LDD 0x7196                        
  30eb  3606           PSHU  B A                         
  30ed  CC0155         LDD #0x155                        
  30f0  3606           PSHU  B A                         
  30f2  AD9FFCEC       JSR [0xfcec]                      
  30f6  3706           PULU  A B                         
  30f8  FD70DE         STD 0x70de                        
  30fb  BE70DE         LDX 0x70de                        
  30fe  108E076E       LDY #0x76e                        
  3102  17DDF8         LBSR 0x0efd                       
  3105  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3172_M7A_r3_00000__3107:
  3107  3172           addr M7A_r3_00000::3172           
  3109  3151           addr M7A_r3_00000::3151           
  310b  .db 31 45 70 9C 71 98 00 00 71 9A 3E D8 40 11 44 00  ; 1Ep.q...q.>.@.D.
  311b  .db 0A 03 E8 00 01 01 05 1C 31 5D 00 00 00 00 00 00  ; ........1]......
  312b  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__312d
FUN_M7A_r3_00000__312d:
  312d  3410           PSHS  X                           
  312f  8E3107         LDX #0x3107                        ; desc[API_FE6A]: ->$3172 ->$3151
  3132  AD9FFE6A       JSR [0xfe6a]                      
  3136  3510           PULS  X                           
  3138  39             RTS                               

; ---- function FUN_M7A_r3_00000__3139
FUN_M7A_r3_00000__3139:
  3139  3410           PSHS  X                           
  313b  8E3107         LDX #0x3107                        ; desc[API_FDBC]: ->$3172 ->$3151
  313e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..1."
  3142  3510           PULS  X                           
  3144  39             RTS                               

; ---- function FUN_M7A_r3_00000__3145
FUN_M7A_r3_00000__3145:
  3145  3410           PSHS  X                           
  3147  8E3107         LDX #0x3107                        ; desc[API_FE6C]: ->$3172 ->$3151
  314a  AD9FFE6C       JSR [0xfe6c]                      
  314e  3510           PULS  X                           
  3150  39             RTS                               

; ---- function FUN_M7A_r3_00000__3151
FUN_M7A_r3_00000__3151:
  3151  3410           PSHS  X                           
  3153  8E3107         LDX #0x3107                        ; desc[API_FE6E]: ->$3172 ->$3151
  3156  AD9FFE6E       JSR [0xfe6e]                      
  315a  3510           PULS  X                           
  315c  39             RTS                               
  315d  .db 14 72 61 74 69 6F 20 31 3A 20 20 20 20 20 20 3A  ; .ratio 1:      :
  316d  .db 31 20 20 20 20                                   ; 1    

; ---- function FUN_M7A_r3_00000__3172
FUN_M7A_r3_00000__3172:
  3172  3476           PSHS  U Y X B A                   
  3174  8E3107         LDX #0x3107                       
  3177  AD9FFE76       JSR [0xfe76]                      
  317b  CC7FFF         LDD #0x7fff                       
  317e  3606           PSHU  B A                         
  3180  FC719A         LDD 0x719a                        
  3183  3606           PSHU  B A                         
  3185  AD9FFCE6       JSR [0xfce6]                      
  3189  CC000A         LDD #0xa                          
  318c  3606           PSHU  B A                         
  318e  AD9FFCEC       JSR [0xfcec]                      
  3192  3706           PULU  A B                         
  3194  837FFF         SUBD #0x7fff                      
  3197  FD70DE         STD 0x70de                        
  319a  BE70DE         LDX 0x70de                        
  319d  108E076B       LDY #0x76b                        
  31a1  17DD59         LBSR 0x0efd                       
  31a4  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3211_M7A_r3_00000__31a6:
  31a6  3211           addr M7A_r3_00000::3211           
  31a8  31F0           addr M7A_r3_00000::31f0           
  31aa  .db 31 E4 70 9E 71 9C 00 00 71 9E 3E D8 40 13 45 00  ; 1.p.q...q.>.@.E.
  31ba  .db 0A 03 E8 00 01 01 05 1C 31 FC 00 00 00 00 00 00  ; ........1.......
  31ca  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__31cc
FUN_M7A_r3_00000__31cc:
  31cc  3410           PSHS  X                           
  31ce  8E31A6         LDX #0x31a6                        ; desc[API_FE6A]: ->$3211 ->$31F0
  31d1  AD9FFE6A       JSR [0xfe6a]                      
  31d5  3510           PULS  X                           
  31d7  39             RTS                               

; ---- function FUN_M7A_r3_00000__31d8
FUN_M7A_r3_00000__31d8:
  31d8  3410           PSHS  X                           
  31da  8E31A6         LDX #0x31a6                        ; desc[API_FDBC]: ->$3211 ->$31F0
  31dd  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..1."
  31e1  3510           PULS  X                           
  31e3  39             RTS                               

; ---- function FUN_M7A_r3_00000__31e4
FUN_M7A_r3_00000__31e4:
  31e4  3410           PSHS  X                           
  31e6  8E31A6         LDX #0x31a6                        ; desc[API_FE6C]: ->$3211 ->$31F0
  31e9  AD9FFE6C       JSR [0xfe6c]                      
  31ed  3510           PULS  X                           
  31ef  39             RTS                               

; ---- function FUN_M7A_r3_00000__31f0
FUN_M7A_r3_00000__31f0:
  31f0  3410           PSHS  X                           
  31f2  8E31A6         LDX #0x31a6                        ; desc[API_FE6E]: ->$3211 ->$31F0
  31f5  AD9FFE6E       JSR [0xfe6e]                      
  31f9  3510           PULS  X                           
  31fb  39             RTS                               
  31fc  .db 14 72 61 74 69 6F 20 32 3A 20 20 20 20 20 20 3A  ; .ratio 2:      :
  320c  .db 31 20 20 20 20                                   ; 1    

; ---- function FUN_M7A_r3_00000__3211
FUN_M7A_r3_00000__3211:
  3211  3476           PSHS  U Y X B A                   
  3213  8E31A6         LDX #0x31a6                       
  3216  AD9FFE76       JSR [0xfe76]                      
  321a  CC7FFF         LDD #0x7fff                       
  321d  3606           PSHU  B A                         
  321f  FC719E         LDD 0x719e                        
  3222  3606           PSHU  B A                         
  3224  AD9FFCE6       JSR [0xfce6]                      
  3228  CC000A         LDD #0xa                          
  322b  3606           PSHU  B A                         
  322d  AD9FFCEC       JSR [0xfcec]                      
  3231  3706           PULU  A B                         
  3233  837FFF         SUBD #0x7fff                      
  3236  FD70DE         STD 0x70de                        
  3239  BE70DE         LDX 0x70de                        
  323c  108E076F       LDY #0x76f                        
  3240  17DCBA         LBSR 0x0efd                       
  3243  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__32b0_M7A_r3_00000__3245:
  3245  32B0           addr M7A_r3_00000::32b0           
  3247  328F           addr M7A_r3_00000::328f           
  3249  .db 32 83 70 A0 71 A0 00 00 71 A2 3E D8 3F D5 46 FF  ; 2.p.q...q.>.?.F.
  3259  .db 38 00 C8 00 01 00 04 21 32 9B 00 00 00 00 00 00  ; 8......!2.......
  3269  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__326b
FUN_M7A_r3_00000__326b:
  326b  3410           PSHS  X                           
  326d  8E3245         LDX #0x3245                        ; desc[API_FE6A]: ->$32B0 ->$328F
  3270  AD9FFE6A       JSR [0xfe6a]                      
  3274  3510           PULS  X                           
  3276  39             RTS                               

; ---- function FUN_M7A_r3_00000__3277
FUN_M7A_r3_00000__3277:
  3277  3410           PSHS  X                           
  3279  8E3245         LDX #0x3245                        ; desc[API_FDBC]: ->$32B0 ->$328F
  327c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..2E"
  3280  3510           PULS  X                           
  3282  39             RTS                               

; ---- function FUN_M7A_r3_00000__3283
FUN_M7A_r3_00000__3283:
  3283  3410           PSHS  X                           
  3285  8E3245         LDX #0x3245                        ; desc[API_FE6C]: ->$32B0 ->$328F
  3288  AD9FFE6C       JSR [0xfe6c]                      
  328c  3510           PULS  X                           
  328e  39             RTS                               

; ---- function FUN_M7A_r3_00000__328f
FUN_M7A_r3_00000__328f:
  328f  3410           PSHS  X                           
  3291  8E3245         LDX #0x3245                        ; desc[API_FE6E]: ->$32B0 ->$328F
  3294  AD9FFE6E       JSR [0xfe6e]                      
  3298  3510           PULS  X                           
  329a  39             RTS                               
  329b  .db 14 61 6D 20 31 20 61 6D 6F 75 6E 74 3A 20 20 20  ; .am 1 amount:   
  32ab  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7A_r3_00000__32b0
FUN_M7A_r3_00000__32b0:
  32b0  3476           PSHS  U Y X B A                   
  32b2  8E3245         LDX #0x3245                       
  32b5  AD9FFE76       JSR [0xfe76]                      
  32b9  FC71A2         LDD 0x71a2                        
  32bc  3606           PSHU  B A                         
  32be  CC00A3         LDD #0xa3                         
  32c1  3606           PSHU  B A                         
  32c3  AD9FFCEC       JSR [0xfcec]                      
  32c7  3706           PULU  A B                         
  32c9  FD70DE         STD 0x70de                        
  32cc  BE70DE         LDX 0x70de                        
  32cf  108E0758       LDY #0x758                        
  32d3  17DC27         LBSR 0x0efd                       
  32d6  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3343_M7A_r3_00000__32d8:
  32d8  3343           addr M7A_r3_00000::3343           
  32da  3322           addr M7A_r3_00000::3322           
  32dc  .db 33 16 70 A2 71 A4 00 00 71 A6 3E D8 3F D7 47 FF  ; 3.p.q...q.>.?.G.
  32ec  .db 38 00 C8 00 01 00 04 21 33 2E 00 00 00 00 00 00  ; 8......!3.......
  32fc  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__32fe
FUN_M7A_r3_00000__32fe:
  32fe  3410           PSHS  X                           
  3300  8E32D8         LDX #0x32d8                        ; desc[API_FE6A]: ->$3343 ->$3322
  3303  AD9FFE6A       JSR [0xfe6a]                      
  3307  3510           PULS  X                           
  3309  39             RTS                               

; ---- function FUN_M7A_r3_00000__330a
FUN_M7A_r3_00000__330a:
  330a  3410           PSHS  X                           
  330c  8E32D8         LDX #0x32d8                        ; desc[API_FDBC]: ->$3343 ->$3322
  330f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..2."
  3313  3510           PULS  X                           
  3315  39             RTS                               

; ---- function FUN_M7A_r3_00000__3316
FUN_M7A_r3_00000__3316:
  3316  3410           PSHS  X                           
  3318  8E32D8         LDX #0x32d8                        ; desc[API_FE6C]: ->$3343 ->$3322
  331b  AD9FFE6C       JSR [0xfe6c]                      
  331f  3510           PULS  X                           
  3321  39             RTS                               

; ---- function FUN_M7A_r3_00000__3322
FUN_M7A_r3_00000__3322:
  3322  3410           PSHS  X                           
  3324  8E32D8         LDX #0x32d8                        ; desc[API_FE6E]: ->$3343 ->$3322
  3327  AD9FFE6E       JSR [0xfe6e]                      
  332b  3510           PULS  X                           
  332d  39             RTS                               
  332e  .db 14 61 6D 20 32 20 61 6D 6F 75 6E 74 3A 20 20 20  ; .am 2 amount:   
  333e  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7A_r3_00000__3343
FUN_M7A_r3_00000__3343:
  3343  3476           PSHS  U Y X B A                   
  3345  8E32D8         LDX #0x32d8                       
  3348  AD9FFE76       JSR [0xfe76]                      
  334c  FC71A6         LDD 0x71a6                        
  334f  3606           PSHU  B A                         
  3351  CC00A3         LDD #0xa3                         
  3354  3606           PSHU  B A                         
  3356  AD9FFCEC       JSR [0xfcec]                      
  335a  3706           PULU  A B                         
  335c  FD70DE         STD 0x70de                        
  335f  BE70DE         LDX 0x70de                        
  3362  108E0759       LDY #0x759                        
  3366  17DB94         LBSR 0x0efd                       
  3369  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__33d6_M7A_r3_00000__336b:
  336b  33D6           addr M7A_r3_00000::33d6           
  336d  33B5           addr M7A_r3_00000::33b5           
  336f  .db 33 A9 70 A4 71 A8 00 00 71 AA 3E D8 3F D9 48 FF  ; 3.p.q...q.>.?.H.
  337f  .db 38 00 C8 00 01 00 04 21 33 C1 00 00 00 00 00 00  ; 8......!3.......
  338f  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3391
FUN_M7A_r3_00000__3391:
  3391  3410           PSHS  X                           
  3393  8E336B         LDX #0x336b                        ; desc[API_FE6A]: ->$33D6 ->$33B5
  3396  AD9FFE6A       JSR [0xfe6a]                      
  339a  3510           PULS  X                           
  339c  39             RTS                               

; ---- function FUN_M7A_r3_00000__339d
FUN_M7A_r3_00000__339d:
  339d  3410           PSHS  X                           
  339f  8E336B         LDX #0x336b                        ; desc[API_FDBC]: ->$33D6 ->$33B5
  33a2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..3k"
  33a6  3510           PULS  X                           
  33a8  39             RTS                               

; ---- function FUN_M7A_r3_00000__33a9
FUN_M7A_r3_00000__33a9:
  33a9  3410           PSHS  X                           
  33ab  8E336B         LDX #0x336b                        ; desc[API_FE6C]: ->$33D6 ->$33B5
  33ae  AD9FFE6C       JSR [0xfe6c]                      
  33b2  3510           PULS  X                           
  33b4  39             RTS                               

; ---- function FUN_M7A_r3_00000__33b5
FUN_M7A_r3_00000__33b5:
  33b5  3410           PSHS  X                           
  33b7  8E336B         LDX #0x336b                        ; desc[API_FE6E]: ->$33D6 ->$33B5
  33ba  AD9FFE6E       JSR [0xfe6e]                      
  33be  3510           PULS  X                           
  33c0  39             RTS                               
  33c1  .db 14 61 6D 20 31 20 6F 66 66 73 65 74 3A 20 20 20  ; .am 1 offset:   
  33d1  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7A_r3_00000__33d6
FUN_M7A_r3_00000__33d6:
  33d6  3476           PSHS  U Y X B A                   
  33d8  8E336B         LDX #0x336b                       
  33db  AD9FFE76       JSR [0xfe76]                      
  33df  FC71AA         LDD 0x71aa                        
  33e2  3606           PSHU  B A                         
  33e4  CC00A3         LDD #0xa3                         
  33e7  3606           PSHU  B A                         
  33e9  AD9FFCEC       JSR [0xfcec]                      
  33ed  3706           PULU  A B                         
  33ef  FD70DE         STD 0x70de                        
  33f2  BE70DE         LDX 0x70de                        
  33f5  108E075A       LDY #0x75a                        
  33f9  17DB01         LBSR 0x0efd                       
  33fc  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3469_M7A_r3_00000__33fe:
  33fe  3469           addr M7A_r3_00000::3469           
  3400  3448           addr M7A_r3_00000::3448           
  3402  .db 34 3C 70 A6 71 AC 00 00 71 AE 3E D8 3F DB 49 FF  ; 4<p.q...q.>.?.I.
  3412  .db 38 00 C8 00 01 00 04 21 34 54 00 00 00 00 00 00  ; 8......!4T......
  3422  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3424
FUN_M7A_r3_00000__3424:
  3424  3410           PSHS  X                           
  3426  8E33FE         LDX #0x33fe                        ; desc[API_FE6A]: ->$3469 ->$3448
  3429  AD9FFE6A       JSR [0xfe6a]                      
  342d  3510           PULS  X                           
  342f  39             RTS                               

; ---- function FUN_M7A_r3_00000__3430
FUN_M7A_r3_00000__3430:
  3430  3410           PSHS  X                           
  3432  8E33FE         LDX #0x33fe                        ; desc[API_FDBC]: ->$3469 ->$3448
  3435  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..3."
  3439  3510           PULS  X                           
  343b  39             RTS                               

; ---- function FUN_M7A_r3_00000__343c
FUN_M7A_r3_00000__343c:
  343c  3410           PSHS  X                           
  343e  8E33FE         LDX #0x33fe                        ; desc[API_FE6C]: ->$3469 ->$3448
  3441  AD9FFE6C       JSR [0xfe6c]                      
  3445  3510           PULS  X                           
  3447  39             RTS                               

; ---- function FUN_M7A_r3_00000__3448
FUN_M7A_r3_00000__3448:
  3448  3410           PSHS  X                           
  344a  8E33FE         LDX #0x33fe                        ; desc[API_FE6E]: ->$3469 ->$3448
  344d  AD9FFE6E       JSR [0xfe6e]                      
  3451  3510           PULS  X                           
  3453  39             RTS                               
  3454  .db 14 61 6D 20 32 20 6F 66 66 73 65 74 3A 20 20 20  ; .am 2 offset:   
  3464  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7A_r3_00000__3469
FUN_M7A_r3_00000__3469:
  3469  3476           PSHS  U Y X B A                   
  346b  8E33FE         LDX #0x33fe                       
  346e  AD9FFE76       JSR [0xfe76]                      
  3472  FC71AE         LDD 0x71ae                        
  3475  3606           PSHU  B A                         
  3477  CC00A3         LDD #0xa3                         
  347a  3606           PSHU  B A                         
  347c  AD9FFCEC       JSR [0xfcec]                      
  3480  3706           PULU  A B                         
  3482  FD70DE         STD 0x70de                        
  3485  BE70DE         LDX 0x70de                        
  3488  108E075B       LDY #0x75b                        
  348c  17DA6E         LBSR 0x0efd                       
  348f  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3514_M7A_r3_00000__3491:
  3491  3514           addr M7A_r3_00000::3514           
  3493  34DB           addr M7A_r3_00000::34db           
  3495  .db 34 CF 70 A8 71 B0 00 00 71 B2 3E D8 3F F5 4A FF  ; 4.p.q...q.>.?.J.
  34a5  .db 9C 00 64 00 01 00 04 22 34 FF 00 00 00 00 70 AA  ; ..d...."4.....p.
  34b5  .db 40 15                                            ; @.

; ---- function FUN_M7A_r3_00000__34b7
FUN_M7A_r3_00000__34b7:
  34b7  3410           PSHS  X                           
  34b9  8E3491         LDX #0x3491                        ; desc[API_FE6A]: ->$3514 ->$34DB
  34bc  AD9FFE6A       JSR [0xfe6a]                      
  34c0  3510           PULS  X                           
  34c2  39             RTS                               

; ---- function FUN_M7A_r3_00000__34c3
FUN_M7A_r3_00000__34c3:
  34c3  3410           PSHS  X                           
  34c5  8E3491         LDX #0x3491                        ; desc[API_FDBC]: ->$3514 ->$34DB
  34c8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..4."
  34cc  3510           PULS  X                           
  34ce  39             RTS                               

; ---- function FUN_M7A_r3_00000__34cf
FUN_M7A_r3_00000__34cf:
  34cf  3410           PSHS  X                           
  34d1  8E3491         LDX #0x3491                        ; desc[API_FE6C]: ->$3514 ->$34DB
  34d4  AD9FFE6C       JSR [0xfe6c]                      
  34d8  3510           PULS  X                           
  34da  39             RTS                               

; ---- function FUN_M7A_r3_00000__34db
FUN_M7A_r3_00000__34db:
  34db  3410           PSHS  X                           
  34dd  8E3491         LDX #0x3491                        ; desc[API_FE6E]: ->$3514 ->$34DB
  34e0  AD9FFE6E       JSR [0xfe6e]                      
  34e4  3510           PULS  X                           
  34e6  39             RTS                               

; ---- function FUN_M7A_r3_00000__34e7
FUN_M7A_r3_00000__34e7:
  34e7  3410           PSHS  X                           
  34e9  8E3491         LDX #0x3491                        ; desc[API_FE1C]: ->$3514 ->$34DB
  34ec  AD9FFE1C       JSR [0xfe1c]                      
  34f0  3510           PULS  X                           
  34f2  39             RTS                               

; ---- function FUN_M7A_r3_00000__34f3
FUN_M7A_r3_00000__34f3:
  34f3  3410           PSHS  X                           
  34f5  8E3491         LDX #0x3491                        ; desc[API_FE1A]: ->$3514 ->$34DB $34CF
  34f8  AD9FFE1A       JSR [0xfe1a]                      
  34fc  3510           PULS  X                           
  34fe  39             RTS                               
  34ff  .db 14 6D 69 78 20 31 61 20 61 6D 6F 75 6E 74 3A 20  ; .mix 1a amount: 
  350f  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__3514
FUN_M7A_r3_00000__3514:
  3514  3476           PSHS  U Y X B A                   
  3516  8E3491         LDX #0x3491                       
  3519  AD9FFE76       JSR [0xfe76]                      
  351d  FC71B2         LDD 0x71b2                        
  3520  3606           PSHU  B A                         
  3522  AD9FFEC4       JSR [0xfec4]                      
  3526  3706           PULU  A B                         
  3528  FD70DE         STD 0x70de                        
  352b  BE70DE         LDX 0x70de                        
  352e  108E0750       LDY #0x750                        
  3532  17D9C8         LBSR 0x0efd                       
  3535  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__35ba_M7A_r3_00000__3537:
  3537  35BA           addr M7A_r3_00000::35ba           
  3539  3581           addr M7A_r3_00000::3581           
  353b  .db 35 75 70 AC 71 B4 00 00 71 B6 3E D8 3F F7 4B FF  ; 5up.q...q.>.?.K.
  354b  .db 9C 00 64 00 01 00 04 22 35 A5 00 00 00 00 70 AE  ; ..d...."5.....p.
  355b  .db 40 17                                            ; @.

; ---- function FUN_M7A_r3_00000__355d
FUN_M7A_r3_00000__355d:
  355d  3410           PSHS  X                           
  355f  8E3537         LDX #0x3537                        ; desc[API_FE6A]: ->$35BA ->$3581
  3562  AD9FFE6A       JSR [0xfe6a]                      
  3566  3510           PULS  X                           
  3568  39             RTS                               

; ---- function FUN_M7A_r3_00000__3569
FUN_M7A_r3_00000__3569:
  3569  3410           PSHS  X                           
  356b  8E3537         LDX #0x3537                        ; desc[API_FDBC]: ->$35BA ->$3581
  356e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..57"
  3572  3510           PULS  X                           
  3574  39             RTS                               

; ---- function FUN_M7A_r3_00000__3575
FUN_M7A_r3_00000__3575:
  3575  3410           PSHS  X                           
  3577  8E3537         LDX #0x3537                        ; desc[API_FE6C]: ->$35BA ->$3581
  357a  AD9FFE6C       JSR [0xfe6c]                      
  357e  3510           PULS  X                           
  3580  39             RTS                               

; ---- function FUN_M7A_r3_00000__3581
FUN_M7A_r3_00000__3581:
  3581  3410           PSHS  X                           
  3583  8E3537         LDX #0x3537                        ; desc[API_FE6E]: ->$35BA ->$3581
  3586  AD9FFE6E       JSR [0xfe6e]                      
  358a  3510           PULS  X                           
  358c  39             RTS                               

; ---- function FUN_M7A_r3_00000__358d
FUN_M7A_r3_00000__358d:
  358d  3410           PSHS  X                           
  358f  8E3537         LDX #0x3537                        ; desc[API_FE1C]: ->$35BA ->$3581
  3592  AD9FFE1C       JSR [0xfe1c]                      
  3596  3510           PULS  X                           
  3598  39             RTS                               

; ---- function FUN_M7A_r3_00000__3599
FUN_M7A_r3_00000__3599:
  3599  3410           PSHS  X                           
  359b  8E3537         LDX #0x3537                        ; desc[API_FE1A]: ->$35BA ->$3581 $3575
  359e  AD9FFE1A       JSR [0xfe1a]                      
  35a2  3510           PULS  X                           
  35a4  39             RTS                               
  35a5  .db 14 6D 69 78 20 31 62 20 61 6D 6F 75 6E 74 3A 20  ; .mix 1b amount: 
  35b5  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__35ba
FUN_M7A_r3_00000__35ba:
  35ba  3476           PSHS  U Y X B A                   
  35bc  8E3537         LDX #0x3537                       
  35bf  AD9FFE76       JSR [0xfe76]                      
  35c3  FC71B6         LDD 0x71b6                        
  35c6  3606           PSHU  B A                         
  35c8  AD9FFEC4       JSR [0xfec4]                      
  35cc  3706           PULU  A B                         
  35ce  FD70DE         STD 0x70de                        
  35d1  BE70DE         LDX 0x70de                        
  35d4  108E0751       LDY #0x751                        
  35d8  17D922         LBSR 0x0efd                       
  35db  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3660_M7A_r3_00000__35dd:
  35dd  3660           addr M7A_r3_00000::3660           
  35df  3627           addr M7A_r3_00000::3627           
  35e1  .db 36 1B 70 B0 71 B8 00 00 71 BA 3E D8 3F F9 4C FF  ; 6.p.q...q.>.?.L.
  35f1  .db 9C 00 64 00 01 00 04 22 36 4B 00 00 00 00 70 B2  ; ..d...."6K....p.
  3601  .db 3F 5B                                            ; ?[

; ---- function FUN_M7A_r3_00000__3603
FUN_M7A_r3_00000__3603:
  3603  3410           PSHS  X                           
  3605  8E35DD         LDX #0x35dd                        ; desc[API_FE6A]: ->$3660 ->$3627
  3608  AD9FFE6A       JSR [0xfe6a]                      
  360c  3510           PULS  X                           
  360e  39             RTS                               

; ---- function FUN_M7A_r3_00000__360f
FUN_M7A_r3_00000__360f:
  360f  3410           PSHS  X                           
  3611  8E35DD         LDX #0x35dd                        ; desc[API_FDBC]: ->$3660 ->$3627
  3614  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..5."
  3618  3510           PULS  X                           
  361a  39             RTS                               

; ---- function FUN_M7A_r3_00000__361b
FUN_M7A_r3_00000__361b:
  361b  3410           PSHS  X                           
  361d  8E35DD         LDX #0x35dd                        ; desc[API_FE6C]: ->$3660 ->$3627
  3620  AD9FFE6C       JSR [0xfe6c]                      
  3624  3510           PULS  X                           
  3626  39             RTS                               

; ---- function FUN_M7A_r3_00000__3627
FUN_M7A_r3_00000__3627:
  3627  3410           PSHS  X                           
  3629  8E35DD         LDX #0x35dd                        ; desc[API_FE6E]: ->$3660 ->$3627
  362c  AD9FFE6E       JSR [0xfe6e]                      
  3630  3510           PULS  X                           
  3632  39             RTS                               

; ---- function FUN_M7A_r3_00000__3633
FUN_M7A_r3_00000__3633:
  3633  3410           PSHS  X                           
  3635  8E35DD         LDX #0x35dd                        ; desc[API_FE1C]: ->$3660 ->$3627
  3638  AD9FFE1C       JSR [0xfe1c]                      
  363c  3510           PULS  X                           
  363e  39             RTS                               

; ---- function FUN_M7A_r3_00000__363f
FUN_M7A_r3_00000__363f:
  363f  3410           PSHS  X                           
  3641  8E35DD         LDX #0x35dd                        ; desc[API_FE1A]: ->$3660 ->$3627 $361B
  3644  AD9FFE1A       JSR [0xfe1a]                      
  3648  3510           PULS  X                           
  364a  39             RTS                               
  364b  .db 14 6D 69 78 20 32 61 20 61 6D 6F 75 6E 74 3A 20  ; .mix 2a amount: 
  365b  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__3660
FUN_M7A_r3_00000__3660:
  3660  3476           PSHS  U Y X B A                   
  3662  8E35DD         LDX #0x35dd                       
  3665  AD9FFE76       JSR [0xfe76]                      
  3669  FC71BA         LDD 0x71ba                        
  366c  3606           PSHU  B A                         
  366e  AD9FFEC4       JSR [0xfec4]                      
  3672  3706           PULU  A B                         
  3674  FD70DE         STD 0x70de                        
  3677  BE70DE         LDX 0x70de                        
  367a  108E0752       LDY #0x752                        
  367e  17D87C         LBSR 0x0efd                       
  3681  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3706_M7A_r3_00000__3683:
  3683  3706           addr M7A_r3_00000::3706           
  3685  36CD           addr M7A_r3_00000::36cd           
  3687  .db 36 C1 70 B4 71 BC 00 00 71 BE 3E D8 3F FB 4D FF  ; 6.p.q...q.>.?.M.
  3697  .db 9C 00 64 00 01 00 04 22 36 F1 00 00 00 00 70 B6  ; ..d...."6.....p.
  36a7  .db 3F 5D                                            ; ?]

; ---- function FUN_M7A_r3_00000__36a9
FUN_M7A_r3_00000__36a9:
  36a9  3410           PSHS  X                           
  36ab  8E3683         LDX #0x3683                        ; desc[API_FE6A]: ->$3706 ->$36CD
  36ae  AD9FFE6A       JSR [0xfe6a]                      
  36b2  3510           PULS  X                           
  36b4  39             RTS                               

; ---- function FUN_M7A_r3_00000__36b5
FUN_M7A_r3_00000__36b5:
  36b5  3410           PSHS  X                           
  36b7  8E3683         LDX #0x3683                        ; desc[API_FDBC]: ->$3706 ->$36CD
  36ba  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..6."
  36be  3510           PULS  X                           
  36c0  39             RTS                               

; ---- function FUN_M7A_r3_00000__36c1
FUN_M7A_r3_00000__36c1:
  36c1  3410           PSHS  X                           
  36c3  8E3683         LDX #0x3683                        ; desc[API_FE6C]: ->$3706 ->$36CD
  36c6  AD9FFE6C       JSR [0xfe6c]                      
  36ca  3510           PULS  X                           
  36cc  39             RTS                               

; ---- function FUN_M7A_r3_00000__36cd
FUN_M7A_r3_00000__36cd:
  36cd  3410           PSHS  X                           
  36cf  8E3683         LDX #0x3683                        ; desc[API_FE6E]: ->$3706 ->$36CD
  36d2  AD9FFE6E       JSR [0xfe6e]                      
  36d6  3510           PULS  X                           
  36d8  39             RTS                               

; ---- function FUN_M7A_r3_00000__36d9
FUN_M7A_r3_00000__36d9:
  36d9  3410           PSHS  X                           
  36db  8E3683         LDX #0x3683                        ; desc[API_FE1C]: ->$3706 ->$36CD
  36de  AD9FFE1C       JSR [0xfe1c]                      
  36e2  3510           PULS  X                           
  36e4  39             RTS                               

; ---- function FUN_M7A_r3_00000__36e5
FUN_M7A_r3_00000__36e5:
  36e5  3410           PSHS  X                           
  36e7  8E3683         LDX #0x3683                        ; desc[API_FE1A]: ->$3706 ->$36CD $36C1
  36ea  AD9FFE1A       JSR [0xfe1a]                      
  36ee  3510           PULS  X                           
  36f0  39             RTS                               
  36f1  .db 14 6D 69 78 20 32 62 20 61 6D 6F 75 6E 74 3A 20  ; .mix 2b amount: 
  3701  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__3706
FUN_M7A_r3_00000__3706:
  3706  3476           PSHS  U Y X B A                   
  3708  8E3683         LDX #0x3683                       
  370b  AD9FFE76       JSR [0xfe76]                      
  370f  FC71BE         LDD 0x71be                        
  3712  3606           PSHU  B A                         
  3714  AD9FFEC4       JSR [0xfec4]                      
  3718  3706           PULU  A B                         
  371a  FD70DE         STD 0x70de                        
  371d  BE70DE         LDX 0x70de                        
  3720  108E0753       LDY #0x753                        
  3724  17D7D6         LBSR 0x0efd                       
  3727  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__37ac_M7A_r3_00000__3729:
  3729  37AC           addr M7A_r3_00000::37ac           
  372b  3773           addr M7A_r3_00000::3773           
  372d  .db 37 67 70 B8 71 C0 00 00 71 C2 3E D8 3F FD 4E FF  ; 7gp.q...q.>.?.N.
  373d  .db 9C 00 64 00 01 00 04 22 37 97 00 00 00 00 70 BA  ; ..d...."7.....p.
  374d  .db 3F 63                                            ; ?c

; ---- function FUN_M7A_r3_00000__374f
FUN_M7A_r3_00000__374f:
  374f  3410           PSHS  X                           
  3751  8E3729         LDX #0x3729                        ; desc[API_FE6A]: ->$37AC ->$3773
  3754  AD9FFE6A       JSR [0xfe6a]                      
  3758  3510           PULS  X                           
  375a  39             RTS                               

; ---- function FUN_M7A_r3_00000__375b
FUN_M7A_r3_00000__375b:
  375b  3410           PSHS  X                           
  375d  8E3729         LDX #0x3729                        ; desc[API_FDBC]: ->$37AC ->$3773
  3760  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..7)"
  3764  3510           PULS  X                           
  3766  39             RTS                               

; ---- function FUN_M7A_r3_00000__3767
FUN_M7A_r3_00000__3767:
  3767  3410           PSHS  X                           
  3769  8E3729         LDX #0x3729                        ; desc[API_FE6C]: ->$37AC ->$3773
  376c  AD9FFE6C       JSR [0xfe6c]                      
  3770  3510           PULS  X                           
  3772  39             RTS                               

; ---- function FUN_M7A_r3_00000__3773
FUN_M7A_r3_00000__3773:
  3773  3410           PSHS  X                           
  3775  8E3729         LDX #0x3729                        ; desc[API_FE6E]: ->$37AC ->$3773
  3778  AD9FFE6E       JSR [0xfe6e]                      
  377c  3510           PULS  X                           
  377e  39             RTS                               

; ---- function FUN_M7A_r3_00000__377f
FUN_M7A_r3_00000__377f:
  377f  3410           PSHS  X                           
  3781  8E3729         LDX #0x3729                        ; desc[API_FE1C]: ->$37AC ->$3773
  3784  AD9FFE1C       JSR [0xfe1c]                      
  3788  3510           PULS  X                           
  378a  39             RTS                               

; ---- function FUN_M7A_r3_00000__378b
FUN_M7A_r3_00000__378b:
  378b  3410           PSHS  X                           
  378d  8E3729         LDX #0x3729                        ; desc[API_FE1A]: ->$37AC ->$3773 $3767
  3790  AD9FFE1A       JSR [0xfe1a]                      
  3794  3510           PULS  X                           
  3796  39             RTS                               
  3797  .db 14 6D 69 78 20 33 61 20 61 6D 6F 75 6E 74 3A 20  ; .mix 3a amount: 
  37a7  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__37ac
FUN_M7A_r3_00000__37ac:
  37ac  3476           PSHS  U Y X B A                   
  37ae  8E3729         LDX #0x3729                       
  37b1  AD9FFE76       JSR [0xfe76]                      
  37b5  FC71C2         LDD 0x71c2                        
  37b8  3606           PSHU  B A                         
  37ba  AD9FFEC4       JSR [0xfec4]                      
  37be  3706           PULU  A B                         
  37c0  FD70DE         STD 0x70de                        
  37c3  BE70DE         LDX 0x70de                        
  37c6  108E0754       LDY #0x754                        
  37ca  17D730         LBSR 0x0efd                       
  37cd  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3852_M7A_r3_00000__37cf:
  37cf  3852           addr M7A_r3_00000::3852           
  37d1  3819           addr M7A_r3_00000::3819           
  37d3  .db 38 0D 70 BC 71 C4 00 00 71 C6 3E D8 3F FF 4F FF  ; 8.p.q...q.>.?.O.
  37e3  .db 9C 00 64 00 01 00 04 22 38 3D 00 00 00 00 70 BE  ; ..d...."8=....p.
  37f3  .db 3F 65                                            ; ?e

; ---- function FUN_M7A_r3_00000__37f5
FUN_M7A_r3_00000__37f5:
  37f5  3410           PSHS  X                           
  37f7  8E37CF         LDX #0x37cf                        ; desc[API_FE6A]: ->$3852 ->$3819
  37fa  AD9FFE6A       JSR [0xfe6a]                      
  37fe  3510           PULS  X                           
  3800  39             RTS                               

; ---- function FUN_M7A_r3_00000__3801
FUN_M7A_r3_00000__3801:
  3801  3410           PSHS  X                           
  3803  8E37CF         LDX #0x37cf                        ; desc[API_FDBC]: ->$3852 ->$3819
  3806  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..7."
  380a  3510           PULS  X                           
  380c  39             RTS                               

; ---- function FUN_M7A_r3_00000__380d
FUN_M7A_r3_00000__380d:
  380d  3410           PSHS  X                           
  380f  8E37CF         LDX #0x37cf                        ; desc[API_FE6C]: ->$3852 ->$3819
  3812  AD9FFE6C       JSR [0xfe6c]                      
  3816  3510           PULS  X                           
  3818  39             RTS                               

; ---- function FUN_M7A_r3_00000__3819
FUN_M7A_r3_00000__3819:
  3819  3410           PSHS  X                           
  381b  8E37CF         LDX #0x37cf                        ; desc[API_FE6E]: ->$3852 ->$3819
  381e  AD9FFE6E       JSR [0xfe6e]                      
  3822  3510           PULS  X                           
  3824  39             RTS                               

; ---- function FUN_M7A_r3_00000__3825
FUN_M7A_r3_00000__3825:
  3825  3410           PSHS  X                           
  3827  8E37CF         LDX #0x37cf                        ; desc[API_FE1C]: ->$3852 ->$3819
  382a  AD9FFE1C       JSR [0xfe1c]                      
  382e  3510           PULS  X                           
  3830  39             RTS                               

; ---- function FUN_M7A_r3_00000__3831
FUN_M7A_r3_00000__3831:
  3831  3410           PSHS  X                           
  3833  8E37CF         LDX #0x37cf                        ; desc[API_FE1A]: ->$3852 ->$3819 $380D
  3836  AD9FFE1A       JSR [0xfe1a]                      
  383a  3510           PULS  X                           
  383c  39             RTS                               
  383d  .db 14 6D 69 78 20 33 62 20 61 6D 6F 75 6E 74 3A 20  ; .mix 3b amount: 
  384d  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__3852
FUN_M7A_r3_00000__3852:
  3852  3476           PSHS  U Y X B A                   
  3854  8E37CF         LDX #0x37cf                       
  3857  AD9FFE76       JSR [0xfe76]                      
  385b  FC71C6         LDD 0x71c6                        
  385e  3606           PSHU  B A                         
  3860  AD9FFEC4       JSR [0xfec4]                      
  3864  3706           PULU  A B                         
  3866  FD70DE         STD 0x70de                        
  3869  BE70DE         LDX 0x70de                        
  386c  108E0755       LDY #0x755                        
  3870  17D68A         LBSR 0x0efd                       
  3873  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__38f8_M7A_r3_00000__3875:
  3875  38F8           addr M7A_r3_00000::38f8           
  3877  38BF           addr M7A_r3_00000::38bf           
  3879  .db 38 B3 70 C0 71 C8 00 00 71 CA 3E D8 40 01 50 FF  ; 8.p.q...q.>.@.P.
  3889  .db 9C 00 64 00 01 00 04 22 38 E3 00 00 00 00 70 C2  ; ..d...."8.....p.
  3899  .db 3F 67                                            ; ?g

; ---- function FUN_M7A_r3_00000__389b
FUN_M7A_r3_00000__389b:
  389b  3410           PSHS  X                           
  389d  8E3875         LDX #0x3875                        ; desc[API_FE6A]: ->$38F8 ->$38BF
  38a0  AD9FFE6A       JSR [0xfe6a]                      
  38a4  3510           PULS  X                           
  38a6  39             RTS                               

; ---- function FUN_M7A_r3_00000__38a7
FUN_M7A_r3_00000__38a7:
  38a7  3410           PSHS  X                           
  38a9  8E3875         LDX #0x3875                        ; desc[API_FDBC]: ->$38F8 ->$38BF
  38ac  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..8u"
  38b0  3510           PULS  X                           
  38b2  39             RTS                               

; ---- function FUN_M7A_r3_00000__38b3
FUN_M7A_r3_00000__38b3:
  38b3  3410           PSHS  X                           
  38b5  8E3875         LDX #0x3875                        ; desc[API_FE6C]: ->$38F8 ->$38BF
  38b8  AD9FFE6C       JSR [0xfe6c]                      
  38bc  3510           PULS  X                           
  38be  39             RTS                               

; ---- function FUN_M7A_r3_00000__38bf
FUN_M7A_r3_00000__38bf:
  38bf  3410           PSHS  X                           
  38c1  8E3875         LDX #0x3875                        ; desc[API_FE6E]: ->$38F8 ->$38BF
  38c4  AD9FFE6E       JSR [0xfe6e]                      
  38c8  3510           PULS  X                           
  38ca  39             RTS                               

; ---- function FUN_M7A_r3_00000__38cb
FUN_M7A_r3_00000__38cb:
  38cb  3410           PSHS  X                           
  38cd  8E3875         LDX #0x3875                        ; desc[API_FE1C]: ->$38F8 ->$38BF
  38d0  AD9FFE1C       JSR [0xfe1c]                      
  38d4  3510           PULS  X                           
  38d6  39             RTS                               

; ---- function FUN_M7A_r3_00000__38d7
FUN_M7A_r3_00000__38d7:
  38d7  3410           PSHS  X                           
  38d9  8E3875         LDX #0x3875                        ; desc[API_FE1A]: ->$38F8 ->$38BF $38B3
  38dc  AD9FFE1A       JSR [0xfe1a]                      
  38e0  3510           PULS  X                           
  38e2  39             RTS                               
  38e3  .db 14 6D 69 78 20 34 61 20 61 6D 6F 75 6E 74 3A 20  ; .mix 4a amount: 
  38f3  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__38f8
FUN_M7A_r3_00000__38f8:
  38f8  3476           PSHS  U Y X B A                   
  38fa  8E3875         LDX #0x3875                       
  38fd  AD9FFE76       JSR [0xfe76]                      
  3901  FC71CA         LDD 0x71ca                        
  3904  3606           PSHU  B A                         
  3906  AD9FFEC4       JSR [0xfec4]                      
  390a  3706           PULU  A B                         
  390c  FD70DE         STD 0x70de                        
  390f  BE70DE         LDX 0x70de                        
  3912  108E0756       LDY #0x756                        
  3916  17D5E4         LBSR 0x0efd                       
  3919  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__399e_M7A_r3_00000__391b:
  391b  399E           addr M7A_r3_00000::399e           
  391d  3965           addr M7A_r3_00000::3965           
  391f  .db 39 59 70 C4 71 CC 00 00 71 CE 3E D8 40 03 51 FF  ; 9Yp.q...q.>.@.Q.
  392f  .db 9C 00 64 00 01 00 04 22 39 89 00 00 00 00 70 C6  ; ..d...."9.....p.
  393f  .db 3F 69                                            ; ?i

; ---- function FUN_M7A_r3_00000__3941
FUN_M7A_r3_00000__3941:
  3941  3410           PSHS  X                           
  3943  8E391B         LDX #0x391b                        ; desc[API_FE6A]: ->$399E ->$3965
  3946  AD9FFE6A       JSR [0xfe6a]                      
  394a  3510           PULS  X                           
  394c  39             RTS                               

; ---- function FUN_M7A_r3_00000__394d
FUN_M7A_r3_00000__394d:
  394d  3410           PSHS  X                           
  394f  8E391B         LDX #0x391b                        ; desc[API_FDBC]: ->$399E ->$3965
  3952  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..9."
  3956  3510           PULS  X                           
  3958  39             RTS                               

; ---- function FUN_M7A_r3_00000__3959
FUN_M7A_r3_00000__3959:
  3959  3410           PSHS  X                           
  395b  8E391B         LDX #0x391b                        ; desc[API_FE6C]: ->$399E ->$3965
  395e  AD9FFE6C       JSR [0xfe6c]                      
  3962  3510           PULS  X                           
  3964  39             RTS                               

; ---- function FUN_M7A_r3_00000__3965
FUN_M7A_r3_00000__3965:
  3965  3410           PSHS  X                           
  3967  8E391B         LDX #0x391b                        ; desc[API_FE6E]: ->$399E ->$3965
  396a  AD9FFE6E       JSR [0xfe6e]                      
  396e  3510           PULS  X                           
  3970  39             RTS                               

; ---- function FUN_M7A_r3_00000__3971
FUN_M7A_r3_00000__3971:
  3971  3410           PSHS  X                           
  3973  8E391B         LDX #0x391b                        ; desc[API_FE1C]: ->$399E ->$3965
  3976  AD9FFE1C       JSR [0xfe1c]                      
  397a  3510           PULS  X                           
  397c  39             RTS                               

; ---- function FUN_M7A_r3_00000__397d
FUN_M7A_r3_00000__397d:
  397d  3410           PSHS  X                           
  397f  8E391B         LDX #0x391b                        ; desc[API_FE1A]: ->$399E ->$3965 $3959
  3982  AD9FFE1A       JSR [0xfe1a]                      
  3986  3510           PULS  X                           
  3988  39             RTS                               
  3989  .db 14 6D 69 78 20 34 62 20 61 6D 6F 75 6E 74 3A 20  ; .mix 4b amount: 
  3999  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7A_r3_00000__399e
FUN_M7A_r3_00000__399e:
  399e  3476           PSHS  U Y X B A                   
  39a0  8E391B         LDX #0x391b                       
  39a3  AD9FFE76       JSR [0xfe76]                      
  39a7  FC71CE         LDD 0x71ce                        
  39aa  3606           PSHU  B A                         
  39ac  AD9FFEC4       JSR [0xfec4]                      
  39b0  3706           PULU  A B                         
  39b2  FD70DE         STD 0x70de                        
  39b5  BE70DE         LDX 0x70de                        
  39b8  108E0757       LDY #0x757                        
  39bc  17D53E         LBSR 0x0efd                       
  39bf  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3a44_M7A_r3_00000__39c1:
  39c1  3A44           addr M7A_r3_00000::3a44           
  39c3  3A0B           addr M7A_r3_00000::3a0b           
  39c5  .db 39 FF 70 C8 71 D0 00 00 71 D2 3E D8 40 1F 52 FC  ; 9.p.q...q.>.@.R.
  39d5  .db 18 03 E8 00 01 01 06 20 3A 2F 00 00 00 00 70 CA  ; ....... :/....p.
  39e5  .db 3F 57                                            ; ?W

; ---- function FUN_M7A_r3_00000__39e7
FUN_M7A_r3_00000__39e7:
  39e7  3410           PSHS  X                           
  39e9  8E39C1         LDX #0x39c1                        ; desc[API_FE6A]: ->$3A44 ->$3A0B
  39ec  AD9FFE6A       JSR [0xfe6a]                      
  39f0  3510           PULS  X                           
  39f2  39             RTS                               

; ---- function FUN_M7A_r3_00000__39f3
FUN_M7A_r3_00000__39f3:
  39f3  3410           PSHS  X                           
  39f5  8E39C1         LDX #0x39c1                        ; desc[API_FDBC]: ->$3A44 ->$3A0B
  39f8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..9."
  39fc  3510           PULS  X                           
  39fe  39             RTS                               

; ---- function FUN_M7A_r3_00000__39ff
FUN_M7A_r3_00000__39ff:
  39ff  3410           PSHS  X                           
  3a01  8E39C1         LDX #0x39c1                        ; desc[API_FE6C]: ->$3A44 ->$3A0B
  3a04  AD9FFE6C       JSR [0xfe6c]                      
  3a08  3510           PULS  X                           
  3a0a  39             RTS                               

; ---- function FUN_M7A_r3_00000__3a0b
FUN_M7A_r3_00000__3a0b:
  3a0b  3410           PSHS  X                           
  3a0d  8E39C1         LDX #0x39c1                        ; desc[API_FE6E]: ->$3A44 ->$3A0B
  3a10  AD9FFE6E       JSR [0xfe6e]                      
  3a14  3510           PULS  X                           
  3a16  39             RTS                               

; ---- function FUN_M7A_r3_00000__3a17
FUN_M7A_r3_00000__3a17:
  3a17  3410           PSHS  X                           
  3a19  8E39C1         LDX #0x39c1                        ; desc[API_FE1C]: ->$3A44 ->$3A0B
  3a1c  AD9FFE1C       JSR [0xfe1c]                      
  3a20  3510           PULS  X                           
  3a22  39             RTS                               

; ---- function FUN_M7A_r3_00000__3a23
FUN_M7A_r3_00000__3a23:
  3a23  3410           PSHS  X                           
  3a25  8E39C1         LDX #0x39c1                        ; desc[API_FE1A]: ->$3A44 ->$3A0B $39FF
  3a28  AD9FFE1A       JSR [0xfe1a]                      
  3a2c  3510           PULS  X                           
  3a2e  39             RTS                               
  3a2f  .db 14 6D 6F 64 20 73 63 61 6C 65 20 31 3A 20 20 20  ; .mod scale 1:   
  3a3f  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7A_r3_00000__3a44
FUN_M7A_r3_00000__3a44:
  3a44  3476           PSHS  U Y X B A                   
  3a46  8E39C1         LDX #0x39c1                       
  3a49  AD9FFE76       JSR [0xfe76]                      
  3a4d  FC71D2         LDD 0x71d2                        
  3a50  3606           PSHU  B A                         
  3a52  AD9FFEC6       JSR [0xfec6]                      
  3a56  3706           PULU  A B                         
  3a58  FD70DE         STD 0x70de                        
  3a5b  BE70DE         LDX 0x70de                        
  3a5e  108E0788       LDY #0x788                        
  3a62  17D498         LBSR 0x0efd                       
  3a65  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3aea_M7A_r3_00000__3a67:
  3a67  3AEA           addr M7A_r3_00000::3aea           
  3a69  3AB1           addr M7A_r3_00000::3ab1           
  3a6b  .db 3A A5 70 CC 71 D4 00 00 71 D6 3E D8 40 21 53 FC  ; :.p.q...q.>.@!S.
  3a7b  .db 18 03 E8 00 01 01 06 20 3A D5 00 00 00 00 70 CE  ; ....... :.....p.
  3a8b  .db 3F 59                                            ; ?Y

; ---- function FUN_M7A_r3_00000__3a8d
FUN_M7A_r3_00000__3a8d:
  3a8d  3410           PSHS  X                           
  3a8f  8E3A67         LDX #0x3a67                        ; desc[API_FE6A]: ->$3AEA ->$3AB1
  3a92  AD9FFE6A       JSR [0xfe6a]                      
  3a96  3510           PULS  X                           
  3a98  39             RTS                               

; ---- function FUN_M7A_r3_00000__3a99
FUN_M7A_r3_00000__3a99:
  3a99  3410           PSHS  X                           
  3a9b  8E3A67         LDX #0x3a67                        ; desc[API_FDBC]: ->$3AEA ->$3AB1
  3a9e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..:g"
  3aa2  3510           PULS  X                           
  3aa4  39             RTS                               

; ---- function FUN_M7A_r3_00000__3aa5
FUN_M7A_r3_00000__3aa5:
  3aa5  3410           PSHS  X                           
  3aa7  8E3A67         LDX #0x3a67                        ; desc[API_FE6C]: ->$3AEA ->$3AB1
  3aaa  AD9FFE6C       JSR [0xfe6c]                      
  3aae  3510           PULS  X                           
  3ab0  39             RTS                               

; ---- function FUN_M7A_r3_00000__3ab1
FUN_M7A_r3_00000__3ab1:
  3ab1  3410           PSHS  X                           
  3ab3  8E3A67         LDX #0x3a67                        ; desc[API_FE6E]: ->$3AEA ->$3AB1
  3ab6  AD9FFE6E       JSR [0xfe6e]                      
  3aba  3510           PULS  X                           
  3abc  39             RTS                               

; ---- function FUN_M7A_r3_00000__3abd
FUN_M7A_r3_00000__3abd:
  3abd  3410           PSHS  X                           
  3abf  8E3A67         LDX #0x3a67                        ; desc[API_FE1C]: ->$3AEA ->$3AB1
  3ac2  AD9FFE1C       JSR [0xfe1c]                      
  3ac6  3510           PULS  X                           
  3ac8  39             RTS                               

; ---- function FUN_M7A_r3_00000__3ac9
FUN_M7A_r3_00000__3ac9:
  3ac9  3410           PSHS  X                           
  3acb  8E3A67         LDX #0x3a67                        ; desc[API_FE1A]: ->$3AEA ->$3AB1 $3AA5
  3ace  AD9FFE1A       JSR [0xfe1a]                      
  3ad2  3510           PULS  X                           
  3ad4  39             RTS                               
  3ad5  .db 14 6D 6F 64 20 73 63 61 6C 65 20 32 3A 20 20 20  ; .mod scale 2:   
  3ae5  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7A_r3_00000__3aea
FUN_M7A_r3_00000__3aea:
  3aea  3476           PSHS  U Y X B A                   
  3aec  8E3A67         LDX #0x3a67                       
  3aef  AD9FFE76       JSR [0xfe76]                      
  3af3  FC71D6         LDD 0x71d6                        
  3af6  3606           PSHU  B A                         
  3af8  AD9FFEC6       JSR [0xfec6]                      
  3afc  3706           PULU  A B                         
  3afe  FD70DE         STD 0x70de                        
  3b01  BE70DE         LDX 0x70de                        
  3b04  108E0789       LDY #0x789                        
  3b08  17D3F2         LBSR 0x0efd                       
  3b0b  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3b78_M7A_r3_00000__3b0d:
  3b0d  3B78           addr M7A_r3_00000::3b78           
  3b0f  3B57           addr M7A_r3_00000::3b57           
  3b11  .db 3B 4B 70 D0 71 D8 00 00 71 DA 3E D8 3E F1 54 FF  ; ;Kp.q...q.>.>.T.
  3b21  .db D0 00 30 00 01 00 03 1C 3B 63 00 00 00 00 00 00  ; ..0.....;c......
  3b31  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3b33
FUN_M7A_r3_00000__3b33:
  3b33  3410           PSHS  X                           
  3b35  8E3B0D         LDX #0x3b0d                       
  3b38  AD9FFE74       JSR [0xfe74]                      
  3b3c  3510           PULS  X                           
  3b3e  39             RTS                               

; ---- function FUN_M7A_r3_00000__3b3f
FUN_M7A_r3_00000__3b3f:
  3b3f  3410           PSHS  X                           
  3b41  8E3B0D         LDX #0x3b0d                        ; desc[API_FE22]: ->$3B78 ->$3B57
  3b44  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3b48  3510           PULS  X                           
  3b4a  39             RTS                               

; ---- function FUN_M7A_r3_00000__3b4b
FUN_M7A_r3_00000__3b4b:
  3b4b  3410           PSHS  X                           
  3b4d  8E3B0D         LDX #0x3b0d                       
  3b50  AD9FFE70       JSR [0xfe70]                      
  3b54  3510           PULS  X                           
  3b56  39             RTS                               

; ---- function FUN_M7A_r3_00000__3b57
FUN_M7A_r3_00000__3b57:
  3b57  3410           PSHS  X                           
  3b59  8E3B0D         LDX #0x3b0d                       
  3b5c  AD9FFE72       JSR [0xfe72]                      
  3b60  3510           PULS  X                           
  3b62  39             RTS                               
  3b63  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  3b73  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__3b78
FUN_M7A_r3_00000__3b78:
  3b78  3476           PSHS  U Y X B A                   
  3b7a  8E3B0D         LDX #0x3b0d                       
  3b7d  AD9FFE76       JSR [0xfe76]                      
  3b81  AD9FFE52       JSR [0xfe52]                      
  3b85  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3bf2_M7A_r3_00000__3b87:
  3b87  3BF2           addr M7A_r3_00000::3bf2           
  3b89  3BD1           addr M7A_r3_00000::3bd1           
  3b8b  .db 3B C5 70 D2 71 DC 00 00 71 DE 3E D8 3E F2 55 FF  ; ;.p.q...q.>.>.U.
  3b9b  .db D0 00 30 00 01 00 03 1D 3B DD 00 00 00 00 00 00  ; ..0.....;.......
  3bab  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3bad
FUN_M7A_r3_00000__3bad:
  3bad  3410           PSHS  X                           
  3baf  8E3B87         LDX #0x3b87                       
  3bb2  AD9FFE74       JSR [0xfe74]                      
  3bb6  3510           PULS  X                           
  3bb8  39             RTS                               

; ---- function FUN_M7A_r3_00000__3bb9
FUN_M7A_r3_00000__3bb9:
  3bb9  3410           PSHS  X                           
  3bbb  8E3B87         LDX #0x3b87                        ; desc[API_FE22]: ->$3BF2 ->$3BD1
  3bbe  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3bc2  3510           PULS  X                           
  3bc4  39             RTS                               

; ---- function FUN_M7A_r3_00000__3bc5
FUN_M7A_r3_00000__3bc5:
  3bc5  3410           PSHS  X                           
  3bc7  8E3B87         LDX #0x3b87                       
  3bca  AD9FFE70       JSR [0xfe70]                      
  3bce  3510           PULS  X                           
  3bd0  39             RTS                               

; ---- function FUN_M7A_r3_00000__3bd1
FUN_M7A_r3_00000__3bd1:
  3bd1  3410           PSHS  X                           
  3bd3  8E3B87         LDX #0x3b87                       
  3bd6  AD9FFE72       JSR [0xfe72]                      
  3bda  3510           PULS  X                           
  3bdc  39             RTS                               
  3bdd  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  3bed  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__3bf2
FUN_M7A_r3_00000__3bf2:
  3bf2  3476           PSHS  U Y X B A                   
  3bf4  8E3B87         LDX #0x3b87                       
  3bf7  AD9FFE76       JSR [0xfe76]                      
  3bfb  AD9FFE54       JSR [0xfe54]                      
  3bff  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3c6c_M7A_r3_00000__3c01:
  3c01  3C6C           addr M7A_r3_00000::3c6c           
  3c03  3C4B           addr M7A_r3_00000::3c4b           
  3c05  .db 3C 3F 70 D4 71 E0 00 00 71 E2 3E D8 3E F3 56 FF  ; <?p.q...q.>.>.V.
  3c15  .db D0 00 30 00 01 00 03 1D 3C 57 00 00 00 00 00 00  ; ..0.....<W......
  3c25  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3c27
FUN_M7A_r3_00000__3c27:
  3c27  3410           PSHS  X                           
  3c29  8E3C01         LDX #0x3c01                       
  3c2c  AD9FFE74       JSR [0xfe74]                      
  3c30  3510           PULS  X                           
  3c32  39             RTS                               

; ---- function FUN_M7A_r3_00000__3c33
FUN_M7A_r3_00000__3c33:
  3c33  3410           PSHS  X                           
  3c35  8E3C01         LDX #0x3c01                        ; desc[API_FE22]: ->$3C6C ->$3C4B
  3c38  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3c3c  3510           PULS  X                           
  3c3e  39             RTS                               

; ---- function FUN_M7A_r3_00000__3c3f
FUN_M7A_r3_00000__3c3f:
  3c3f  3410           PSHS  X                           
  3c41  8E3C01         LDX #0x3c01                       
  3c44  AD9FFE70       JSR [0xfe70]                      
  3c48  3510           PULS  X                           
  3c4a  39             RTS                               

; ---- function FUN_M7A_r3_00000__3c4b
FUN_M7A_r3_00000__3c4b:
  3c4b  3410           PSHS  X                           
  3c4d  8E3C01         LDX #0x3c01                       
  3c50  AD9FFE72       JSR [0xfe72]                      
  3c54  3510           PULS  X                           
  3c56  39             RTS                               
  3c57  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  3c67  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7A_r3_00000__3c6c
FUN_M7A_r3_00000__3c6c:
  3c6c  3476           PSHS  U Y X B A                   
  3c6e  8E3C01         LDX #0x3c01                       
  3c71  AD9FFE76       JSR [0xfe76]                      
  3c75  AD9FFE56       JSR [0xfe56]                      
  3c79  35F6           PULS  A B X Y U PC                
PTR_FUN_M7A_r3_00000__3ce6_M7A_r3_00000__3c7b:
  3c7b  3CE6           addr M7A_r3_00000::3ce6           
  3c7d  3CC5           addr M7A_r3_00000::3cc5           
  3c7f  .db 3C B9 70 D6 71 E4 00 00 71 E6 3E D8 3E F4 57 FF  ; <.p.q...q.>.>.W.
  3c8f  .db D0 00 30 00 01 00 03 1E 3C D1 00 00 00 00 00 00  ; ..0.....<.......
  3c9f  .db 00 00                                            ; ..

; ---- function FUN_M7A_r3_00000__3ca1
FUN_M7A_r3_00000__3ca1:
  3ca1  3410           PSHS  X                           
  3ca3  8E3C7B         LDX #0x3c7b                       
  3ca6  AD9FFE74       JSR [0xfe74]                      
  3caa  3510           PULS  X                           
  3cac  39             RTS                               

; ---- function FUN_M7A_r3_00000__3cad
FUN_M7A_r3_00000__3cad:
  3cad  3410           PSHS  X                           
  3caf  8E3C7B         LDX #0x3c7b                        ; desc[API_FE22]: ->$3CE6 ->$3CC5
  3cb2  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3cb6  3510           PULS  X                           
  3cb8  39             RTS                               

; ---- function FUN_M7A_r3_00000__3cb9
FUN_M7A_r3_00000__3cb9:
  3cb9  3410           PSHS  X                           
  3cbb  8E3C7B         LDX #0x3c7b                       
  3cbe  AD9FFE70       JSR [0xfe70]                      
  3cc2  3510           PULS  X                           
  3cc4  39             RTS                               

; ---- function FUN_M7A_r3_00000__3cc5
FUN_M7A_r3_00000__3cc5:
  3cc5  3410           PSHS  X                           
  3cc7  8E3C7B         LDX #0x3c7b                       
  3cca  AD9FFE72       JSR [0xfe72]                      
  3cce  3510           PULS  X                           
  3cd0  39             RTS                               
  3cd1  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  3ce1  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M7A_r3_00000__3ce6
FUN_M7A_r3_00000__3ce6:
  3ce6  3476           PSHS  U Y X B A                   
  3ce8  8E3C7B         LDX #0x3c7b                       
  3ceb  AD9FFE76       JSR [0xfe76]                      
  3cef  AD9FFE58       JSR [0xfe58]                      
  3cf3  35F6           PULS  A B X Y U PC                
  3cf5  3D5F3D3F3D33   addr[3]                           
  3cfb  .db 70 D8 71 E8 00 00 71 EA 3E D8 3F EF 58 00 00 00  ; p.q...q.>.?.X...
  3d0b  .db 01 00 01 00 04 24 3D 4B 00 00 3D 6A 00 00 00 00  ; .....$=K..=j....

; ---- function FUN_M7A_r3_00000__3d1b
FUN_M7A_r3_00000__3d1b:
  3d1b  3410           PSHS  X                           
  3d1d  8E3CF5         LDX #0x3cf5                       
  3d20  AD9FFC4E       JSR [0xfc4e]                      
  3d24  3510           PULS  X                           
  3d26  39             RTS                               

; ---- function FUN_M7A_r3_00000__3d27
FUN_M7A_r3_00000__3d27:
  3d27  3410           PSHS  X                           
  3d29  8E3CF5         LDX #0x3cf5                       
  3d2c  AD9FFC4C       JSR [0xfc4c]                      
  3d30  3510           PULS  X                           
  3d32  39             RTS                               

; ---- function FUN_M7A_r3_00000__3d33
FUN_M7A_r3_00000__3d33:
  3d33  3410           PSHS  X                           
  3d35  8E3CF5         LDX #0x3cf5                       
  3d38  AD9FFC50       JSR [0xfc50]                      
  3d3c  3510           PULS  X                           
  3d3e  39             RTS                               

; ---- function FUN_M7A_r3_00000__3d3f
FUN_M7A_r3_00000__3d3f:
  3d3f  3410           PSHS  X                           
  3d41  8E3CF5         LDX #0x3cf5                       
  3d44  AD9FFC52       JSR [0xfc52]                      
  3d48  3510           PULS  X                           
  3d4a  39             RTS                               
  3d4b  .db 14 70 72 67 20 6C 6F 61 64 20 73 70 65 65 64 3A  ; .prg load speed:
  3d5b  .db 20 20 20 20                                      ;     

; ---- function FUN_M7A_r3_00000__3d5f
FUN_M7A_r3_00000__3d5f:
  3d5f  3476           PSHS  U Y X B A                   
  3d61  8E3CF5         LDX #0x3cf5                       
  3d64  AD9FFE76       JSR [0xfe76]                      
  3d68  35F6           PULS  A B X Y U PC                
  3d6a  .db 73 6C 6F 77 66 61 73 74                          ; slowfast
DAT_M7A_r3_00000__3d72:
  3d72  AD             ?? ADh                            
  3d73  .db 9F FD 76 3B                                      ; ..v;

; ---- function FUN_M7A_r3_00000__3d77
FUN_M7A_r3_00000__3d77:
  3d77  3406           PSHS  B A                         
  3d79  CC0000         LDD #0x0                          
  3d7c  FD70EE         STD 0x70ee                        
  3d7f  FD70F2         STD 0x70f2                        
  3d82  FD70F6         STD 0x70f6                        
  3d85  FD7104         STD 0x7104                        
  3d88  FD7108         STD 0x7108                        
  3d8b  FD710C         STD 0x710c                        
  3d8e  FD7110         STD 0x7110                        
  3d91  FD7114         STD 0x7114                        
  3d94  FD7118         STD 0x7118                        
  3d97  FD711C         STD 0x711c                        
  3d9a  FD7120         STD 0x7120                        
  3d9d  FD7124         STD 0x7124                        
  3da0  FD712A         STD 0x712a                        
  3da3  FD7130         STD 0x7130                        
  3da6  FD7134         STD 0x7134                        
  3da9  FD7138         STD 0x7138                        
  3dac  FD713C         STD 0x713c                        
  3daf  FD7140         STD 0x7140                        
  3db2  FD7144         STD 0x7144                        
  3db5  FD7148         STD 0x7148                        
  3db8  FD714C         STD 0x714c                        
  3dbb  FD7150         STD 0x7150                        
  3dbe  FD7154         STD 0x7154                        
  3dc1  FD7158         STD 0x7158                        
  3dc4  FD715E         STD 0x715e                        
  3dc7  FD7164         STD 0x7164                        
  3dca  FD7168         STD 0x7168                        
  3dcd  FD716C         STD 0x716c                        
  3dd0  FD7170         STD 0x7170                        
  3dd3  FD7174         STD 0x7174                        
  3dd6  FD7178         STD 0x7178                        
  3dd9  FD717C         STD 0x717c                        
  3ddc  FD7180         STD 0x7180                        
  3ddf  FD7184         STD 0x7184                        
  3de2  FD7188         STD 0x7188                        
  3de5  FD718C         STD 0x718c                        
  3de8  FD7190         STD 0x7190                        
  3deb  FD7194         STD 0x7194                        
  3dee  FD7198         STD 0x7198                        
  3df1  FD719C         STD 0x719c                        
  3df4  FD71A0         STD 0x71a0                        
  3df7  FD71A4         STD 0x71a4                        
  3dfa  FD71A8         STD 0x71a8                        
  3dfd  FD71AC         STD 0x71ac                        
  3e00  FD71B0         STD 0x71b0                        
  3e03  FD71B4         STD 0x71b4                        
  3e06  FD71B8         STD 0x71b8                        
  3e09  FD71BC         STD 0x71bc                        
  3e0c  FD71C0         STD 0x71c0                        
  3e0f  FD71C4         STD 0x71c4                        
  3e12  FD71C8         STD 0x71c8                        
  3e15  FD71CC         STD 0x71cc                        
  3e18  FD71D0         STD 0x71d0                        
  3e1b  FD71D4         STD 0x71d4                        
  3e1e  FD71D8         STD 0x71d8                        
  3e21  FD71DC         STD 0x71dc                        
  3e24  FD71E0         STD 0x71e0                        
  3e27  FD71E4         STD 0x71e4                        
  3e2a  FD71E8         STD 0x71e8                        
  3e2d  3586           PULS  A B PC                      

; ---- function FUN_M7A_r3_00000__3e2f
FUN_M7A_r3_00000__3e2f:
  3e2f  3476           PSHS  U Y X B A                   
  3e31  17D1A5         LBSR 0x0fd9                       
  3e34  17D4E7         LBSR 0x131e                       
  3e37  17D607         LBSR 0x1441                       
  3e3a  17D99D         LBSR 0x17da                       
  3e3d  17DA7F         LBSR 0x18bf                       
  3e40  17DB33         LBSR 0x1976                       
  3e43  17DBD5         LBSR 0x1a1b                       
  3e46  17DC7E         LBSR 0x1ac7                       
  3e49  17DD26         LBSR 0x1b72                       
  3e4c  17DDAB         LBSR 0x1bfa                       
  3e4f  17DE5E         LBSR 0x1cb0                       
  3e52  17DF12         LBSR 0x1d67                       
  3e55  17DFC5         LBSR 0x1e1d                       
  3e58  17E080         LBSR 0x1edb                       
  3e5b  17E12A         LBSR 0x1f88                       
  3e5e  17E1CE         LBSR 0x202f                       
  3e61  17E272         LBSR 0x20d6                       
  3e64  17E314         LBSR 0x217b                       
  3e67  17E3DA         LBSR 0x2244                       
  3e6a  17E496         LBSR 0x2303                       
  3e6d  17E53A         LBSR 0x23aa                       
  3e70  17E5EF         LBSR 0x2462                       
  3e73  17E6BC         LBSR 0x2532                       
  3e76  17E77A         LBSR 0x25f3                       
  3e79  17E820         LBSR 0x269c                       
  3e7c  17E8BC         LBSR 0x273b                       
  3e7f  17E958         LBSR 0x27da                       
  3e82  17EA47         LBSR 0x28cc                       
  3e85  17EBB8         LBSR 0x2a40                       
  3e88  17EC4C         LBSR 0x2ad7                       
  3e8b  17ED34         LBSR 0x2bc2                       
  3e8e  17EDC4         LBSR 0x2c55                       
  3e91  17EE66         LBSR 0x2cfa                       
  3e94  17EEFE         LBSR 0x2d95                       
  3e97  17EF96         LBSR 0x2e30                       
  3e9a  17F02E         LBSR 0x2ecb                       
  3e9d  17F1AC         LBSR 0x304c                       
  3ea0  17F23C         LBSR 0x30df                       
  3ea3  17F2CC         LBSR 0x3172                       
  3ea6  17F368         LBSR 0x3211                       
  3ea9  17F404         LBSR 0x32b0                       
  3eac  17F494         LBSR 0x3343                       
  3eaf  17F524         LBSR 0x33d6                       
  3eb2  17F5B4         LBSR 0x3469                       
  3eb5  17F65C         LBSR 0x3514                       
  3eb8  17F6FF         LBSR 0x35ba                       
  3ebb  17F7A2         LBSR 0x3660                       
  3ebe  17F845         LBSR 0x3706                       
  3ec1  17F8E8         LBSR 0x37ac                       
  3ec4  17F98B         LBSR 0x3852                       
  3ec7  17FA2E         LBSR 0x38f8                       
  3eca  17FAD1         LBSR 0x399e                       
  3ecd  17FB74         LBSR 0x3a44                       
  3ed0  17FC17         LBSR 0x3aea                       
  3ed3  17FE89         LBSR 0x3d5f                       
  3ed6  35F6           PULS  A B X Y U PC                

;; End of record chain
END_OF_CHAIN_hdr:
  3ed8  FFFFFFFFFFFF.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3ee0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f00  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f10  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f20  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f30  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f40  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f50  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f60  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f70  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f80  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f90  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff0  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 78  ; ...............x
