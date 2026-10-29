; H3500  block M7B_r3_08000  M7B_r3_08000::0000-M7B_r3_08000::3fff
; Bank r3_08000 (module id 7B, sub 01)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 7B code record 01, 16345 bytes, entered at payload start
MODULE_7B_01_CODE_hdr:
  0008  7B013FE10000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_7B_01_entry
MODULE_7B_01_entry:
  0010  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $0014
  0014  0014           dw 14h                            
LAB_M7B_r3_08000__0016:
  0016  3477           PSHS  U Y X B A CC                
  0018  1702EA         LBSR 0x0305                       
  001b  173E77         LBSR 0x3e95                       
  001e  170499         LBSR 0x04ba                       
  0021  C600           LDB #0x0                          
  0023  AD9FFC58       JSR [0xfc58]                      
  0027  8603           LDA #0x3                          
  0029  B760DA         STA 0x60da                        
  002c  AD9FFE38       JSR [0xfe38]                      
  0030  170154         LBSR 0x0187                       
  0033  FC70D2         LDD 0x70d2                        
  0036  2707           BEQ 0x003f                        
  0038  B6600A         LDA 0x600a                        
  003b  817B           CMPA #0x7b                        
  003d  2744           BEQ 0x0083                        
LAB_M7B_r3_08000__003f:
  003f  AD9FFED0       JSR [0xfed0]                      
  0043  8601           LDA #0x1                          
  0045  B77218         STA 0x7218                        
  0048  170164         LBSR 0x01af                       
  004b  2736           BEQ 0x0083                        
  004d  C600           LDB #0x0                          
  004f  AD9FFC36       JSR [0xfc36]                      
  0053  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0057  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M7B_r3_08000__0080:
  0080  160101         LBRA 0x0184                       
LAB_M7B_r3_08000__0083:
  0083  173EC0         LBSR 0x3f46                       
  0086  17044E         LBSR 0x04d7                       
  0089  FC70D2         LDD 0x70d2                        
  008c  2707           BEQ 0x0095                        
  008e  B6600A         LDA 0x600a                        
  0091  817B           CMPA #0x7b                        
  0093  2707           BEQ 0x009c                        
LAB_M7B_r3_08000__0095:
  0095  CC7530         LDD #0x7530                       
  0098  AD9FFD20       JSR [0xfd20]                      
LAB_M7B_r3_08000__009c:
  009c  AD9FFE36       JSR [0xfe36]                      
  00a0  AD9FFDF6       JSR [0xfdf6]                      
  00a4  AD9FFE18       JSR [0xfe18]                      
  00a8  17015A         LBSR 0x0205                       
  00ab  171855         LBSR 0x1903                       
  00ae  1718EF         LBSR 0x19a0                       
  00b1  171F4A         LBSR 0x1ffe                       
  00b4  172004         LBSR 0x20bb                       
  00b7  FC7000         LDD 0x7000                        
  00ba  C100           CMPB #0x0                         
  00bc  274C           BEQ 0x010a                        
  00be  C101           CMPB #0x1                         
  00c0  274D           BEQ 0x010f                        
  00c2  C102           CMPB #0x2                         
  00c4  274E           BEQ 0x0114                        
  00c6  C103           CMPB #0x3                         
  00c8  274F           BEQ 0x0119                        
  00ca  C104           CMPB #0x4                         
  00cc  2750           BEQ 0x011e                        
  00ce  C105           CMPB #0x5                         
  00d0  2751           BEQ 0x0123                        
  00d2  C106           CMPB #0x6                         
  00d4  2752           BEQ 0x0128                        
  00d6  C107           CMPB #0x7                         
  00d8  2753           BEQ 0x012d                        
  00da  C108           CMPB #0x8                         
  00dc  2754           BEQ 0x0132                        
  00de  C109           CMPB #0x9                         
  00e0  2755           BEQ 0x0137                        
  00e2  C10A           CMPB #0xa                         
  00e4  2756           BEQ 0x013c                        
  00e6  C10B           CMPB #0xb                         
  00e8  2757           BEQ 0x0141                        
  00ea  C10D           CMPB #0xd                         
  00ec  2758           BEQ 0x0146                        
  00ee  C10E           CMPB #0xe                         
  00f0  2759           BEQ 0x014b                        
  00f2  C10F           CMPB #0xf                         
  00f4  275A           BEQ 0x0150                        
  00f6  C110           CMPB #0x10                        
  00f8  275B           BEQ 0x0155                        
  00fa  C111           CMPB #0x11                        
  00fc  275C           BEQ 0x015a                        
  00fe  C112           CMPB #0x12                        
  0100  275D           BEQ 0x015f                        
  0102  C114           CMPB #0x14                        
  0104  275E           BEQ 0x0164                        
  0106  C115           CMPB #0x15                        
  0108  275F           BEQ 0x0169                        
LAB_M7B_r3_08000__010a:
  010a  170938         LBSR 0x0a45                       
  010d  2071           BRA 0x0180                        
LAB_M7B_r3_08000__010f:
  010f  17096B         LBSR 0x0a7d                       
  0112  205A           BRA 0x016e                        
LAB_M7B_r3_08000__0114:
  0114  1709A5         LBSR 0x0abc                       
  0117  2055           BRA 0x016e                        
LAB_M7B_r3_08000__0119:
  0119  1709DF         LBSR 0x0afb                       
  011c  2062           BRA 0x0180                        
LAB_M7B_r3_08000__011e:
  011e  170A19         LBSR 0x0b3a                       
  0121  205D           BRA 0x0180                        
LAB_M7B_r3_08000__0123:
  0123  170A53         LBSR 0x0b79                       
  0126  2058           BRA 0x0180                        
LAB_M7B_r3_08000__0128:
  0128  170A8D         LBSR 0x0bb8                       
  012b  2053           BRA 0x0180                        
LAB_M7B_r3_08000__012d:
  012d  170AB2         LBSR 0x0be2                       
  0130  204E           BRA 0x0180                        
LAB_M7B_r3_08000__0132:
  0132  170AEC         LBSR 0x0c21                       
  0135  2049           BRA 0x0180                        
LAB_M7B_r3_08000__0137:
  0137  170B26         LBSR 0x0c60                       
  013a  2044           BRA 0x0180                        
LAB_M7B_r3_08000__013c:
  013c  170B59         LBSR 0x0c98                       
  013f  203F           BRA 0x0180                        
LAB_M7B_r3_08000__0141:
  0141  170B93         LBSR 0x0cd7                       
  0144  203A           BRA 0x0180                        
LAB_M7B_r3_08000__0146:
  0146  170BB8         LBSR 0x0d01                       
  0149  2035           BRA 0x0180                        
LAB_M7B_r3_08000__014b:
  014b  170BF2         LBSR 0x0d40                       
  014e  2030           BRA 0x0180                        
LAB_M7B_r3_08000__0150:
  0150  170C2C         LBSR 0x0d7f                       
  0153  202B           BRA 0x0180                        
LAB_M7B_r3_08000__0155:
  0155  170C66         LBSR 0x0dbe                       
  0158  2026           BRA 0x0180                        
LAB_M7B_r3_08000__015a:
  015a  170C99         LBSR 0x0df6                       
  015d  2021           BRA 0x0180                        
LAB_M7B_r3_08000__015f:
  015f  170CD3         LBSR 0x0e35                       
  0162  201C           BRA 0x0180                        
LAB_M7B_r3_08000__0164:
  0164  170CFF         LBSR 0x0e66                       
  0167  2017           BRA 0x0180                        
LAB_M7B_r3_08000__0169:
  0169  170D39         LBSR 0x0ea5                       
  016c  2012           BRA 0x0180                        
LAB_M7B_r3_08000__016e:
  016e  AD9FFDFC       JSR [0xfdfc]                      
  0172  C613           LDB #0x13                         
  0174  AD9FFC36       JSR [0xfc36]                      
  0178  C60A           LDB #0xa                          
  017a  AD9FFC2A       JSR [0xfc2a]                      
  017e  2004           BRA 0x0184                        
LAB_M7B_r3_08000__0180:
  0180  AD9FFE10       JSR [0xfe10]                      
LAB_M7B_r3_08000__0184:
  0184  3577           PULS CC A B X Y U                 
  0186  39             RTS                               

; ---- function FUN_M7B_r3_08000__0187
FUN_M7B_r3_08000__0187:
  0187  3476           PSHS  U Y X B A                   
  0189  1A40           ORCC #0x40                        
  018b  3440           PSHS  U                           
  018d  CC3E90         LDD #0x3e90                       
  0190  F3600D         ADDD 0x600d                       
  0193  1F01           TFR D,X                           
  0195  CC3E95         LDD #0x3e95                       
  0198  F3600D         ADDD 0x600d                       
  019b  1F03           TFR D,U                           
  019d  108E6600       LDY #0x6600                       
  01a1  AD9FFD08       JSR [0xfd08]                      
  01a5  3540           PULS  U                           
  01a7  AD9FFD76       JSR [0xfd76]                      
  01ab  1CBF           ANDCC #0xbf                       
  01ad  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__01af
FUN_M7B_r3_08000__01af:
  01af  3476           PSHS  U Y X B A                   
  01b1  C601           LDB #0x1                          
  01b3  8E7A13         LDX #0x7a13                       
  01b6  AD9FFD30       JSR [0xfd30]                      
  01ba  10260042       LBNE 0x0200                       
  01be  C602           LDB #0x2                          
  01c0  8E7A14         LDX #0x7a14                       
  01c3  AD9FFD30       JSR [0xfd30]                      
  01c7  10260035       LBNE 0x0200                       
  01cb  C603           LDB #0x3                          
  01cd  8E7A15         LDX #0x7a15                       
  01d0  AD9FFD30       JSR [0xfd30]                      
  01d4  10260028       LBNE 0x0200                       
  01d8  4F             CLRA                              
  01d9  5F             CLRB                              
  01da  AD9FFD3C       JSR [0xfd3c]                      
  01de  AD9FFD40       JSR [0xfd40]                      
  01e2  AD9FFD44       JSR [0xfd44]                      
  01e6  CC000A         LDD #0xa                          
  01e9  AD9FFD20       JSR [0xfd20]                      
  01ed  108E0000       LDY #0x0                          
  01f1  FC70D6         LDD 0x70d6                        
  01f4  AD9FFD2E       JSR [0xfd2e]                      
  01f8  AD9FFD7C       JSR [0xfd7c]                      
  01fc  4F             CLRA                              
  01fd  5F             CLRB                              
  01fe  2003           BRA 0x0203                        
LAB_M7B_r3_08000__0200:
  0200  CCFFFF         LDD #0xffff                       
LAB_M7B_r3_08000__0203:
  0203  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__0205
FUN_M7B_r3_08000__0205:
  0205  3476           PSHS  U Y X B A                   
  0207  AD9FFD3E       JSR [0xfd3e]                      
  020b  10830000       CMPD #0x0                         
  020f  2735           BEQ 0x0246                        
  0211  10830001       CMPD #0x1                         
  0215  276E           BEQ 0x0285                        
  0217  10830002       CMPD #0x2                         
  021b  102700A5       LBEQ 0x02c4                       
  021f  C614           LDB #0x14                         
  0221  AD9FFC36       JSR [0xfc36]                      
  0225  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "MEMORY ERROR        "
  0229  4D454D4F5259.. char[21] "MEMORY ERROR        "   
LAB_M7B_r3_08000__023e:
  023e  4F             CLRA                              
  023f  5F             CLRB                              
  0240  FD70D4         STD 0x70d4                        
  0243  1600BD         LBRA 0x0303                       
LAB_M7B_r3_08000__0246:
  0246  C614           LDB #0x14                         
  0248  AD9FFC36       JSR [0xfc36]                      
  024c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "NO SAMPLER          "
  0250  4E4F2053414D.. char[21] "NO SAMPLER          "   
LAB_M7B_r3_08000__0265:
  0265  4F             CLRA                              
  0266  5F             CLRB                              
  0267  FD70D4         STD 0x70d4                        
  026a  CC1F40         LDD #0x1f40                       
  026d  FD7110         STD 0x7110                        
  0270  CC1FFF         LDD #0x1fff                       
  0273  FD7112         STD 0x7112                        
  0276  CC00AF         LDD #0xaf                         
  0279  FD7116         STD 0x7116                        
  027c  CC0226         LDD #0x226                        
  027f  FD7114         STD 0x7114                        
  0282  16007E         LBRA 0x0303                       
LAB_M7B_r3_08000__0285:
  0285  C614           LDB #0x14                         
  0287  AD9FFC36       JSR [0xfc36]                      
  028b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "HS322 BOARD, 23 SECS"
  028f  485333323220.. char[21] "HS322 BOARD, 23 SECS"   
LAB_M7B_r3_08000__02a4:
  02a4  CC0001         LDD #0x1                          
  02a7  FD70D4         STD 0x70d4                        
  02aa  CC7C00         LDD #0x7c00                       
  02ad  FD7110         STD 0x7110                        
  02b0  CC7FFF         LDD #0x7fff                       
  02b3  FD7112         STD 0x7112                        
  02b6  CC02BC         LDD #0x2bc                        
  02b9  FD7116         STD 0x7116                        
  02bc  CC2AF8         LDD #0x2af8                       
  02bf  FD7114         STD 0x7114                        
  02c2  203F           BRA 0x0303                        
LAB_M7B_r3_08000__02c4:
  02c4  C614           LDB #0x14                         
  02c6  AD9FFC36       JSR [0xfc36]                      
  02ca  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "HS396 BOARD, 95 SECS"
  02ce  485333393620.. char[21] "HS396 BOARD, 95 SECS"   
LAB_M7B_r3_08000__02e3:
  02e3  CC0002         LDD #0x2                          
  02e6  FD70D4         STD 0x70d4                        
  02e9  CC7C00         LDD #0x7c00                       
  02ec  FD7110         STD 0x7110                        
  02ef  CC7FFF         LDD #0x7fff                       
  02f2  FD7112         STD 0x7112                        
  02f5  CC02BC         LDD #0x2bc                        
  02f8  FD7116         STD 0x7116                        
  02fb  CC7D00         LDD #0x7d00                       
  02fe  FD7114         STD 0x7114                        
  0301  2000           BRA 0x0303                        
LAB_M7B_r3_08000__0303:
  0303  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__0305
FUN_M7B_r3_08000__0305:
  0305  3476           PSHS  U Y X B A                   
  0307  CC4110         LDD #0x4110                       
  030a  833FE9         SUBD #0x3fe9                      
  030d  1F01           TFR D,X                           
  030f  AD9FFC7C       JSR [0xfc7c]                      
  0313  1D             SEX                               
  0314  FD7046         STD 0x7046                        
  0317  CC4131         LDD #0x4131                       
  031a  833FE9         SUBD #0x3fe9                      
  031d  1F01           TFR D,X                           
  031f  AD9FFC7E       JSR [0xfc7e]                      
  0323  FD7000         STD 0x7000                        
  0326  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 19:CA 1A:CC 1B:CE 1C:D0
  032a  19             db 19h                            
  032b  CA             db CAh                            
  032c  1A             db 1Ah                            
  032d  CC             db CCh                            
  032e  1B             db 1Bh                            
  032f  CE             db CEh                            
  0330  1C             db 1Ch                            
  0331  D0             db D0h                            
  0332  00             db 0h                             
LAB_M7B_r3_08000__0333:
  0333  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 61:0A 62:0C 7A:3C
  0337  61             db 61h                            
  0338  0A             db Ah                             
  0339  62             db 62h                            
  033a  0C             db Ch                             
  033b  7A             db 7Ah                            
  033c  3C             db 3Ch                            
  033d  00             db 0h                             
LAB_M7B_r3_08000__033e:
  033e  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 6B:1E 6C:20 6D:22 6E:24
  0342  6B             db 6Bh                            
  0343  1E             db 1Eh                            
  0344  6C             db 6Ch                            
  0345  20             db 20h                            
  0346  6D             db 6Dh                            
  0347  22             db 22h                            
  0348  6E             db 6Eh                            
  0349  24             db 24h                            
  034a  00             db 0h                             
LAB_M7B_r3_08000__034b:
  034b  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 6F:26 70:28 72:2C 73:2E
  034f  6F             db 6Fh                            
  0350  26             db 26h                            
  0351  70             db 70h                            
  0352  28             db 28h                            
  0353  72             db 72h                            
  0354  2C             db 2Ch                            
  0355  73             db 73h                            
  0356  2E             db 2Eh                            
  0357  00             db 0h                             
LAB_M7B_r3_08000__0358:
  0358  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 71:2A 74:30
  035c  71             db 71h                            
  035d  2A             db 2Ah                            
  035e  74             db 74h                            
  035f  30             db 30h                            
  0360  00             db 0h                             
LAB_M7B_r3_08000__0361:
  0361  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 63:0E 64:10 65:12 66:14
  0365  63             db 63h                            
  0366  0E             db Eh                             
  0367  64             db 64h                            
  0368  10             db 10h                            
  0369  65             db 65h                            
  036a  12             db 12h                            
  036b  66             db 66h                            
  036c  14             db 14h                            
  036d  00             db 0h                             
LAB_M7B_r3_08000__036e:
  036e  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 67:16 68:18 69:1A 6A:1C
  0372  67             db 67h                            
  0373  16             db 16h                            
  0374  68             db 68h                            
  0375  18             db 18h                            
  0376  69             db 69h                            
  0377  1A             db 1Ah                            
  0378  6A             db 6Ah                            
  0379  1C             db 1Ch                            
  037a  00             db 0h                             
LAB_M7B_r3_08000__037b:
  037b  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 79:3A 7B:3E 7C:40
  037f  79             db 79h                            
  0380  3A             db 3Ah                            
  0381  7B             db 7Bh                            
  0382  3E             db 3Eh                            
  0383  7C             db 7Ch                            
  0384  40             db 40h                            
  0385  00             db 0h                             
LAB_M7B_r3_08000__0386:
  0386  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 75:32 76:34 77:36 78:38
  038a  75             db 75h                            
  038b  32             db 32h                            
  038c  76             db 76h                            
  038d  34             db 34h                            
  038e  77             db 77h                            
  038f  36             db 36h                            
  0390  78             db 78h                            
  0391  38             db 38h                            
  0392  00             db 0h                             
LAB_M7B_r3_08000__0393:
  0393  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9B:64 9D:66
  0397  9B             db 9Bh                            
  0398  64             db 64h                            
  0399  9D             db 9Dh                            
  039a  66             db 66h                            
  039b  00             db 0h                             
LAB_M7B_r3_08000__039c:
  039c  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 9F:7C A1:7E 7F:C4 81:C8
  03a0  9F             db 9Fh                            
  03a1  7C             db 7Ch                            
  03a2  A1             db A1h                            
  03a3  7E             db 7Eh                            
  03a4  7F             db 7Fh                            
  03a5  C4             db C4h                            
  03a6  81             db 81h                            
  03a7  C8             db C8h                            
  03a8  00             db 0h                             
LAB_M7B_r3_08000__03a9:
  03a9  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: B8:84 87:86
  03ad  B8             db B8h                            
  03ae  84             db 84h                            
  03af  87             db 87h                            
  03b0  86             db 86h                            
  03b1  00             db 0h                             
LAB_M7B_r3_08000__03b2:
  03b2  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: BA:8E BC:8C
  03b6  BA             db BAh                            
  03b7  8E             db 8Eh                            
  03b8  BC             db BCh                            
  03b9  8C             db 8Ch                            
  03ba  00             db 0h                             
LAB_M7B_r3_08000__03bb:
  03bb  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: A3:74 97:76 A5:78 99:7A
  03bf  A3             db A3h                            
  03c0  74             db 74h                            
  03c1  97             db 97h                            
  03c2  76             db 76h                            
  03c3  A5             db A5h                            
  03c4  78             db 78h                            
  03c5  99             db 99h                            
  03c6  7A             db 7Ah                            
  03c7  00             db 0h                             
LAB_M7B_r3_08000__03c8:
  03c8  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: B7:8A
  03cc  B7             db B7h                            
  03cd  8A             db 8Ah                            
  03ce  00             db 0h                             
LAB_M7B_r3_08000__03cf:
  03cf  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: AF:68 B1:6A B3:48 B5:4A
  03d3  AF             db AFh                            
  03d4  68             db 68h                            
  03d5  B1             db B1h                            
  03d6  6A             db 6Ah                            
  03d7  B3             db B3h                            
  03d8  48             db 48h                            
  03d9  B5             db B5h                            
  03da  4A             db 4Ah                            
  03db  00             db 0h                             
LAB_M7B_r3_08000__03dc:
  03dc  CC410D         LDD #0x410d                       
  03df  833FE9         SUBD #0x3fe9                      
  03e2  1F01           TFR D,X                           
  03e4  AD9FFC7E       JSR [0xfc7e]                      
  03e8  FD7088         STD 0x7088                        
  03eb  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: AB:6C AD:6E A7:70 A9:72
  03ef  AB             db ABh                            
  03f0  6C             db 6Ch                            
  03f1  AD             db ADh                            
  03f2  6E             db 6Eh                            
  03f3  A7             db A7h                            
  03f4  70             db 70h                            
  03f5  A9             db A9h                            
  03f6  72             db 72h                            
  03f7  00             db 0h                             
LAB_M7B_r3_08000__03f8:
  03f8  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 93:44
  03fc  93             db 93h                            
  03fd  44             db 44h                            
  03fe  00             db 0h                             
LAB_M7B_r3_08000__03ff:
  03ff  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 83:AC 85:B0 8B:B4 8D:B8 8F:BC 91:C0
  0403  83             db 83h                            
  0404  AC             db ACh                            
  0405  85             db 85h                            
  0406  B0             db B0h                            
  0407  8B             db 8Bh                            
  0408  B4             db B4h                            
  0409  8D             db 8Dh                            
  040a  B8             db B8h                            
  040b  8F             db 8Fh                            
  040c  BC             db BCh                            
  040d  91             db 91h                            
  040e  C0             db C0h                            
  040f  00             db 0h                             
LAB_M7B_r3_08000__0410:
  0410  CC40E7         LDD #0x40e7                       
  0413  833FE9         SUBD #0x3fe9                      
  0416  1F01           TFR D,X                           
  0418  AD9FFC7E       JSR [0xfc7e]                      
  041c  FD7080         STD 0x7080                        
  041f  CC40E9         LDD #0x40e9                       
  0422  833FE9         SUBD #0x3fe9                      
  0425  1F01           TFR D,X                           
  0427  AD9FFC7E       JSR [0xfc7e]                      
  042b  FD7082         STD 0x7082                        
  042e  170067         LBSR 0x0498                        ; inline[at:M7B_r3_08000::0498]: 02:9A 04:9C 06:9E 08:A0 28:42
  0431  02             db 2h                             
  0432  9A             db 9Ah                            
  0433  04             db 4h                             
  0434  9C             db 9Ch                            
  0435  06             db 6h                             
  0436  9E             db 9Eh                            
  0437  08             db 8h                             
  0438  A0             db A0h                            
  0439  28             db 28h                            
  043a  42             db 42h                            
  043b  00             db 0h                             
LAB_M7B_r3_08000__043c:
  043c  170059         LBSR 0x0498                        ; inline[at:M7B_r3_08000::0498]: 2C:A2 2E:A6 30:AA 32:AE 34:B2 36:B6 38:BA 3A:BE 44:A4 46:A8
  043f  2C             db 2Ch                            
  0440  A2             db A2h                            
  0441  2E             db 2Eh                            
  0442  A6             db A6h                            
  0443  30             db 30h                            
  0444  AA             db AAh                            
  0445  32             db 32h                            
  0446  AE             db AEh                            
  0447  34             db 34h                            
  0448  B2             db B2h                            
  0449  36             db 36h                            
  044a  B6             db B6h                            
  044b  38             db 38h                            
  044c  BA             db BAh                            
  044d  3A             db 3Ah                            
  044e  BE             db BEh                            
  044f  44             db 44h                            
  0450  A4             db A4h                            
  0451  46             db 46h                            
  0452  A8             db A8h                            
  0453  00             db 0h                             
LAB_M7B_r3_08000__0454:
  0454  170041         LBSR 0x0498                        ; inline[at:M7B_r3_08000::0498]: 0A:4C 0C:4E 16:58 18:5A 1E:5C 20:5E
  0457  0A             db Ah                             
  0458  4C             db 4Ch                            
  0459  0C             db Ch                             
  045a  4E             db 4Eh                            
  045b  16             db 16h                            
  045c  58             db 58h                            
  045d  18             db 18h                            
  045e  5A             db 5Ah                            
  045f  1E             db 1Eh                            
  0460  5C             db 5Ch                            
  0461  20             db 20h                            
  0462  5E             db 5Eh                            
  0463  00             db 0h                             
LAB_M7B_r3_08000__0464:
  0464  170031         LBSR 0x0498                        ; inline[at:M7B_r3_08000::0498]: 0E:50 10:52 12:54 14:56 1A:60 1C:62 22:98
  0467  0E             db Eh                             
  0468  50             db 50h                            
  0469  10             db 10h                            
  046a  52             db 52h                            
  046b  12             db 12h                            
  046c  54             db 54h                            
  046d  14             db 14h                            
  046e  56             db 56h                            
  046f  1A             db 1Ah                            
  0470  60             db 60h                            
  0471  1C             db 1Ch                            
  0472  62             db 62h                            
  0473  22             db 22h                            
  0474  98             db 98h                            
  0475  00             db 0h                             
LAB_M7B_r3_08000__0476:
  0476  17001F         LBSR 0x0498                        ; inline[at:M7B_r3_08000::0498]: 3C:90 3E:92 40:94 42:96 4A:C2 4C:C6
  0479  3C             db 3Ch                            
  047a  90             db 90h                            
  047b  3E             db 3Eh                            
  047c  92             db 92h                            
  047d  40             db 40h                            
  047e  94             db 94h                            
  047f  42             db 42h                            
  0480  96             db 96h                            
  0481  4A             db 4Ah                            
  0482  C2             db C2h                            
  0483  4C             db 4Ch                            
  0484  C6             db C6h                            
  0485  00             db 0h                             
LAB_M7B_r3_08000__0486:
  0486  CC410F         LDD #0x410f                       
  0489  833FE9         SUBD #0x3fe9                      
  048c  1F01           TFR D,X                           
  048e  AD9FFC7C       JSR [0xfc7c]                      
  0492  1D             SEX                               
  0493  FD70D2         STD 0x70d2                        
  0496  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__0498
FUN_M7B_r3_08000__0498:
  0498  3476           PSHS  U Y X B A                   
  049a  EE68           LDU 0x8,S                         
LAB_M7B_r3_08000__049c:
  049c  E6C0           LDB ,U+                           
  049e  2716           BEQ 0x04b6                        
  04a0  4F             CLRA                              
  04a1  C30100         ADDD #0x100                       
  04a4  1F01           TFR D,X                           
  04a6  E6C0           LDB ,U+                           
  04a8  4F             CLRA                              
  04a9  C37000         ADDD #0x7000                      
  04ac  1F02           TFR D,Y                           
  04ae  AD9FFC7E       JSR [0xfc7e]                      
  04b2  EDA4           STD ,Y                            
  04b4  20E6           BRA 0x049c                        
LAB_M7B_r3_08000__04b6:
  04b6  EF68           STU 0x8,S                         
  04b8  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__04ba
FUN_M7B_r3_08000__04ba:
  04ba  3476           PSHS  U Y X B A                   
  04bc  4F             CLRA                              
  04bd  5F             CLRB                              
  04be  AD9FFC6C       JSR [0xfc6c]                      
  04c2  AD9FFC74       JSR [0xfc74]                      
  04c6  173607         LBSR 0x3ad0                       
  04c9  17367E         LBSR 0x3b4a                       
  04cc  1736F5         LBSR 0x3bc4                       
  04cf  17376C         LBSR 0x3c3e                       
  04d2  170F73         LBSR 0x1448                       
  04d5  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__04d7
FUN_M7B_r3_08000__04d7:
  04d7  3476           PSHS  U Y X B A                   
  04d9  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "modknob " 21 $1310 $131C
  04dd  00             db 0h                             
  04de  80             db 80h                            
  04df  6D6F646B6E6F.. ds "modknob "                     
  04e7  21             db 21h                            
  04e8  1310           addr M7B_r3_08000::1310           
  04ea  131C           addr M7B_r3_08000::131c           
LAB_M7B_r3_08000__04ec:
  04ec  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "dly1loop" 25 $25D1 $25DD
  04f0  01             db 1h                             
  04f1  80             db 80h                            
  04f2  646C79316C6F.. ds "dly1loop"                     
  04fa  25             db 25h                            
  04fb  25D1           addr M7B_r3_08000::25d1           
  04fd  25DD           addr M7B_r3_08000::25dd           
LAB_M7B_r3_08000__04ff:
  04ff  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "dly2loop" 29 $269C $26A8
  0503  02             db 2h                             
  0504  80             db 80h                            
  0505  646C79326C6F.. ds "dly2loop"                     
  050d  29             db 29h                            
  050e  269C           addr M7B_r3_08000::269c           
  0510  26A8           addr M7B_r3_08000::26a8           
LAB_M7B_r3_08000__0512:
  0512  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "lfo freq" 2D $2A29 $2A35
  0516  03             db 3h                             
  0517  80             db 80h                            
  0518  6C666F206672.. ds "lfo freq"                     
  0520  2D             db 2Dh                            
  0521  2A29           addr M7B_r3_08000::2a29           
  0523  2A35           addr M7B_r3_08000::2a35           
LAB_M7B_r3_08000__0525:
  0525  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "mscale 1" 31 $396F $397B
  0529  04             db 4h                             
  052a  80             db 80h                            
  052b  6D7363616C65.. ds "mscale 1"                     
  0533  31             db 31h                            
  0534  396F           addr M7B_r3_08000::396f           
  0536  397B           addr M7B_r3_08000::397b           
LAB_M7B_r3_08000__0538:
  0538  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "mscale 2" 35 $3A15 $3A21
  053c  05             db 5h                             
  053d  80             db 80h                            
  053e  6D7363616C65.. ds "mscale 2"                     
  0546  35             db 35h                            
  0547  3A15           addr M7B_r3_08000::3a15           
  0549  3A21           addr M7B_r3_08000::3a21           
LAB_M7B_r3_08000__054b:
  054b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "mix 1a  " 39 $343F $344B
  054f  06             db 6h                             
  0550  80             db 80h                            
  0551  6D6978203161.. ds "mix 1a  "                     
  0559  39             db 39h                            
  055a  343F           addr M7B_r3_08000::343f           
  055c  344B           addr M7B_r3_08000::344b           
LAB_M7B_r3_08000__055e:
  055e  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 07 80 "mix 1b  " 3D $34E5 $34F1
  0562  07             db 7h                             
  0563  80             db 80h                            
  0564  6D6978203162.. ds "mix 1b  "                     
  056c  3D             db 3Dh                            
  056d  34E5           addr M7B_r3_08000::34e5           
  056f  34F1           addr M7B_r3_08000::34f1           
LAB_M7B_r3_08000__0571:
  0571  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 08 80 "mix 2a  " 41 $358B $3597
  0575  08             db 8h                             
  0576  80             db 80h                            
  0577  6D6978203261.. ds "mix 2a  "                     
  057f  41             db 41h                            
  0580  358B           addr M7B_r3_08000::358b           
  0582  3597           addr M7B_r3_08000::3597           
LAB_M7B_r3_08000__0584:
  0584  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 09 80 "mix 2b  " 45 $3631 $363D
  0588  09             db 9h                             
  0589  80             db 80h                            
  058a  6D6978203262.. ds "mix 2b  "                     
  0592  45             db 45h                            
  0593  3631           addr M7B_r3_08000::3631           
  0595  363D           addr M7B_r3_08000::363d           
LAB_M7B_r3_08000__0597:
  0597  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0A 80 "mix 3a  " 49 $36D7 $36E3
  059b  0A             db Ah                             
  059c  80             db 80h                            
  059d  6D6978203361.. ds "mix 3a  "                     
  05a5  49             db 49h                            
  05a6  36D7           addr M7B_r3_08000::36d7           
  05a8  36E3           addr M7B_r3_08000::36e3           
LAB_M7B_r3_08000__05aa:
  05aa  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0B 80 "mix 3b  " 4D $377D $3789
  05ae  0B             db Bh                             
  05af  80             db 80h                            
  05b0  6D6978203362.. ds "mix 3b  "                     
  05b8  4D             db 4Dh                            
  05b9  377D           addr M7B_r3_08000::377d           
  05bb  3789           addr M7B_r3_08000::3789           
LAB_M7B_r3_08000__05bd:
  05bd  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0C 80 "mix 4a  " 51 $3823 $382F
  05c1  0C             db Ch                             
  05c2  80             db 80h                            
  05c3  6D6978203461.. ds "mix 4a  "                     
  05cb  51             db 51h                            
  05cc  3823           addr M7B_r3_08000::3823           
  05ce  382F           addr M7B_r3_08000::382f           
LAB_M7B_r3_08000__05d0:
  05d0  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0D 80 "mix 4b  " 55 $38C9 $38D5
  05d4  0D             db Dh                             
  05d5  80             db 80h                            
  05d6  6D6978203462.. ds "mix 4b  "                     
  05de  55             db 55h                            
  05df  38C9           addr M7B_r3_08000::38c9           
  05e1  38D5           addr M7B_r3_08000::38d5           
LAB_M7B_r3_08000__05e3:
  05e3  AD9FFE78       JSR [0xfe78]                       ; inline[API_FE78]: 0E 80 "  bpm   " 59 $14ED $0F33
  05e7  0E             db Eh                             
  05e8  80             db 80h                            
  05e9  202062706D20.. ds "  bpm   "                     
  05f1  59             db 59h                            
  05f2  14ED           addr M7B_r3_08000::14ed           
  05f4  0F33           addr M7B_r3_08000::0f33           
LAB_M7B_r3_08000__05f6:
  05f6  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 0F 80 " ratio  " 5D $313C $3148
  05fa  0F             db Fh                             
  05fb  80             db 80h                            
  05fc  20726174696F.. ds " ratio  "                     
  0604  5D             db 5Dh                            
  0605  313C           addr M7B_r3_08000::313c           
  0607  3148           addr M7B_r3_08000::3148           
LAB_M7B_r3_08000__0609:
  0609  CC0624         LDD #0x624                        
  060c  FD60F5         STD 0x60f5                        
  060f  CC00B2         LDD #0xb2                         
  0612  47             ASRA                              
  0613  56             RORB                              
  0614  FD60F7         STD 0x60f7                        
  0617  8601           LDA #0x1                          
  0619  B76105         STA 0x6105                        
  061c  CC00BE         LDD #0xbe                         
  061f  FD6106         STD 0x6106                        
  0622  35F6           PULS  A B X Y U PC                
  0624  .db 06 D6 06 DB 06 E1 06 E7 06 ED 06 F3 06 F9 06 FF  ; ................
  0634  .db 07 05 07 0B 07 11 07 17 07 1D 07 23 07 29 07 2F  ; ...........#.)./
  0644  .db 07 35 07 3B 07 41 07 47 07 4D 07 53 07 59 07 5F  ; .5.;.A.G.M.S.Y._
  0654  .db 07 65 07 6B 07 71 07 77 07 7D 07 7E 07 8A 07 95  ; .e.k.q.w.}.~....
  0664  .db 07 A0 07 A7 07 B2 07 BD 07 C8 07 D3 07 DE 07 E9  ; ................
  0674  .db 07 F4 07 FF 08 0A 08 15 08 20 08 2B 08 2C 08 2D  ; ......... .+.,.-
  0684  .db 08 38 08 43 08 4E 08 59 08 64 08 6F 08 7A 08 85  ; .8.C.N.Y.d.o.z..
  0694  .db 08 90 08 9B 08 A6 08 B1 08 BC 08 C7 08 D2 08 DD  ; ................
  06a4  .db 08 E8 08 F3 08 FE 09 09 09 14 09 1F 09 2A 09 35  ; .............*.5
  06b4  .db 09 40 09 4B 09 56 09 61 09 6C 09 77 09 82 09 8D  ; .@.K.V.a.l.w....
  06c4  .db 09 98 09 A3 09 AE 09 B9 09 C4 09 CF 09 DA 09 E5  ; ................
  06d4  .db 09 F0 4F 5F 16 00 A4 CC 00 01 16 00 9E CC 00 02  ; ..O_............
  06e4  .db 16 00 98 CC 00 03 16 00 92 CC 00 04 16 00 8C CC  ; ................
  06f4  .db 00 05 16 00 86 CC 00 06 16 00 80 CC 00 07 16 00  ; ................
  0704  .db 7A CC 00 08 16 00 74 CC 00 09 16 00 6E CC 00 0A  ; z.....t.....n...
  0714  .db 16 00 68 CC 00 0B 16 00 62 CC 00 0C 16 00 5C CC  ; ..h.....b.....\.
  0724  .db 00 0D 16 00 56 CC 00 0E 16 00 50 CC 00 0F 16 00  ; ....V.....P.....
  0734  .db 4A CC 00 10 16 00 44 CC 00 11 16 00 3E CC 00 12  ; J.....D.....>...
  0744  .db 16 00 38 CC 00 13 16 00 32 CC 00 14 16 00 2C CC  ; ..8.....2.....,.
  0754  .db 00 15 16 00 26 CC 00 16 16 00 20 CC 00 17 16 00  ; ....&..... .....
  0764  .db 1A CC 00 18 16 00 14 CC 00 19 16 00 0E CC 00 1A  ; ................
  0774  .db 16 00 08 CC 00 1B 16 00 02 39 39 17 08 2F 17 02  ; .........99../..
  0784  .db 7B AD 9F FE 12 39 17 0B 5F 17 02 B5 AD 9F FE 14  ; {....9.._.......
  0794  .db 39 17 0C 77 17 02 AA AD 9F FE 12 39 17 0D 1A 17  ; 9..w.......9....
  07a4  .db 02 9F 39 17 0F C5 17 03 4E AD 9F FE 10 39 17 10  ; ..9.....N....9..
  07b4  .db 74 17 03 82 AD 9F FE 10 39 17 10 F9 17 03 38 AD  ; t.......9.....8.
  07c4  .db 9F FE 12 39 17 11 8B 17 03 6C AD 9F FE 12 39 17  ; ...9.....l....9.
  07d4  .db 13 47 17 03 22 AD 9F FE 14 39 17 13 E3 17 03 56  ; .G.."....9.....V
  07e4  .db AD 9F FE 14 39 17 14 7F 17 03 0C AD 9F FE 16 39  ; ....9..........9
  07f4  .db 17 15 04 17 03 40 AD 9F FE 16 39 17 15 89 17 03  ; .....@....9.....
  0804  .db 74 AD 9F FE 12 39 17 16 0A 17 03 69 AD 9F FE 16  ; t....9.....i....
  0814  .db 39 17 16 8B 17 03 5E AD 9F FE 10 39 17 17 07 17  ; 9.....^....9....
  0824  .db 03 53 AD 9F FE 14 39 39 39 17 17 84 17 04 CE AD  ; .S....999.......
  0834  .db 9F FE 10 39 17 18 36 17 04 C3 AD 9F FE 14 39 17  ; ...9..6.......9.
  0844  .db 18 E8 17 04 B8 AD 9F FE 12 39 17 19 84 17 04 AD  ; .........9......
  0854  .db AD 9F FE 16 39 17 1A 20 17 04 E1 AD 9F FE 10 39  ; ....9.. .......9
  0864  .db 17 1A B6 17 04 D6 AD 9F FE 14 39 17 1B 4C 17 05  ; ..........9..L..
  0874  .db 0A AD 9F FE 14 39 17 1B CA 17 04 FF AD 9F FE 16  ; .....9..........
  0884  .db 39 17 1D 25 17 04 F4 AD 9F FE 10 39 17 1D E5 17  ; 9..%.......9....
  0894  .db 04 E9 AD 9F FE 12 39 17 1E 99 17 04 9F AD 9F FE  ; ......9.........
  08a4  .db 12 39 17 1F 46 17 04 94 AD 9F FE 16 39 17 1F F3  ; .9..F.......9...
  08b4  .db 17 05 07 AD 9F FE 10 39 17 20 97 17 04 FC AD 9F  ; .......9. ......
  08c4  .db FE 12 39 17 21 3B 17 05 29 AD 9F FE 10 39 17 21  ; ..9.!;..)....9.!
  08d4  .db F1 17 05 1E AD 9F FE 12 39 17 22 85 17 05 13 AD  ; ........9.".....
  08e4  .db 9F FE 16 39 17 23 EE 17 05 47 AD 9F FE 10 39 17  ; ...9.#...G....9.
  08f4  .db 24 CE 17 04 FD AD 9F FE 14 39 17 25 56 17 03 94  ; $........9.%V...
  0904  .db AD 9F FE 10 39 17 26 DE 17 03 89 AD 9F FE 12 39  ; ....9.&........9
  0914  .db 17 27 6E 17 03 7E AD 9F FE 14 39 17 27 F6 17 03  ; .'n..~....9.'...
  0924  .db 73 AD 9F FE 16 39 17 28 A2 17 05 36 AD 9F FE 10  ; s....9.(...6....
  0934  .db 39 17 29 2A 17 05 2B AD 9F FE 14 39 17 29 B2 17  ; 9.)*..+....9.)..
  0944  .db 05 20 AD 9F FE 12 39 17 2A 3A 17 05 15 AD 9F FE  ; . ....9.*:......
  0954  .db 16 39 17 2A C2 17 02 86 AD 9F FE 10 39 17 2B 5D  ; .9.*........9.+]
  0964  .db 17 02 7B AD 9F FE 12 39 17 2B F8 17 02 70 AD 9F  ; ..{....9.+...p..
  0974  .db FE 14 39 17 2C 93 17 02 65 AD 9F FE 16 39 17 2D  ; ..9.,...e....9.-
  0984  .db 2E 17 02 99 AD 9F FE 10 39 17 2D C9 17 02 8E AD  ; ........9.-.....
  0994  .db 9F FE 12 39 17 2E 64 17 02 83 AD 9F FE 14 39 17  ; ...9..d.......9.
  09a4  .db 2E FF 17 02 78 AD 9F FE 16 39 17 2F 9A 17 02 AC  ; ....x....9./....
  09b4  .db AD 9F FE 10 39 17 30 35 17 02 A1 AD 9F FE 12 39  ; ....9.05.......9
  09c4  .db 17 30 D0 17 05 05 AD 9F FE 10 39 17 31 3F 17 04  ; .0........9.1?..
  09d4  .db FA AD 9F FE 12 39 17 31 AE 17 05 21 AD 9F FE 10  ; .....9.1...!....
  09e4  .db 39 17 32 1D 17 05 16 AD 9F FE 12 39 17 32 8C 17  ; 9.2........9.2..
  09f4  .db 00 0A AD 9F FE 14 39 AD 9F FD FC 39              ; ......9....9

; ---- function FUN_M7B_r3_08000__0a00
FUN_M7B_r3_08000__0a00:
  0a00  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " input  " " output " "prg load" " return "
  0a04  20696E707574.. ds " input  "                     
  0a0c  206F75747075.. ds " output "                     
  0a14  707267206C6F.. ds "prg load"                     
  0a1c  207265747572.. ds " return "                     
LAB_M7B_r3_08000__0a24:
  0a24  AD9FFDF2       JSR [0xfdf2]                      
  0a28  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$102A ->$0F42 ->$3C73 ->$0ABC ->$0A00 ->$0A00
  0a2c  102A           addr M7B_r3_08000::102a           
  0a2e  0F42           addr M7B_r3_08000::0f42           
  0a30  3C73           addr M7B_r3_08000::3c73           
  0a32  0ABC           addr M7B_r3_08000::0abc           
  0a34  0A00           addr M7B_r3_08000::0a00           
  0a36  0A00           addr M7B_r3_08000::0a00           
LAB_M7B_r3_08000__0a38:
  0a38  39             RTS                               

; ---- function FUN_M7B_r3_08000__0a39
FUN_M7B_r3_08000__0a39:
  0a39  3420           PSHS  Y                           
  0a3b  108E0148       LDY #0x148                        
  0a3f  AD9FFC82       JSR [0xfc82]                      
  0a43  35A0           PULS  Y PC                        

; ---- function FUN_M7B_r3_08000__0a45
FUN_M7B_r3_08000__0a45:
  0a45  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  bpm   " "  mix   " "modknob " [*]
  0a49  202062706D20.. ds "  bpm   "                     
  0a51  20206D697820.. ds "  mix   "                     
  0a59  6D6F646B6E6F.. ds "modknob "                     
  0a61  01             db 1h                             
LAB_M7B_r3_08000__0a62:
  0a62  AD9FFDF2       JSR [0xfdf2]                      
  0a66  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$15E6 ->$1403 ->$12E0 ->$0F33 ->$0A7D ->$0ABC
  0a6a  15E6           addr M7B_r3_08000::15e6           
  0a6c  1403           addr M7B_r3_08000::1403           
  0a6e  12E0           addr M7B_r3_08000::12e0           
  0a70  0F33           addr M7B_r3_08000::0f33           
  0a72  0A7D           addr M7B_r3_08000::0a7d           
  0a74  0ABC           addr M7B_r3_08000::0abc           
LAB_M7B_r3_08000__0a76:
  0a76  CC0000         LDD #0x0                          
  0a79  17FFBD         LBSR 0x0a39                       
  0a7c  39             RTS                               

; ---- function FUN_M7B_r3_08000__0a7d
FUN_M7B_r3_08000__0a7d:
  0a7d  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "detuners" " delays " "  lfo   " "envelope"
  0a81  646574756E65.. ds "detuners"                     
  0a89  2064656C6179.. ds " delays "                     
  0a91  20206C666F20.. ds "  lfo   "                     
  0a99  656E76656C6F.. ds "envelope"                     
LAB_M7B_r3_08000__0aa1:
  0aa1  AD9FFDF2       JSR [0xfdf2]                      
  0aa5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0AFB ->$0D01 ->$0DF6 ->$0C98 ->$0ABC ->$0A45
  0aa9  0AFB           addr M7B_r3_08000::0afb           
  0aab  0D01           addr M7B_r3_08000::0d01           
  0aad  0DF6           addr M7B_r3_08000::0df6           
  0aaf  0C98           addr M7B_r3_08000::0c98           
  0ab1  0ABC           addr M7B_r3_08000::0abc           
  0ab3  0A45           addr M7B_r3_08000::0a45           
LAB_M7B_r3_08000__0ab5:
  0ab5  CC0001         LDD #0x1                          
  0ab8  17FF7E         LBSR 0x0a39                       
  0abb  39             RTS                               

; ---- function FUN_M7B_r3_08000__0abc
FUN_M7B_r3_08000__0abc:
  0abc  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " mixers " "ampmods " " levels " "patching"
  0ac0  206D69786572.. ds " mixers "                     
  0ac8  616D706D6F64.. ds "ampmods "                     
  0ad0  206C6576656C.. ds " levels "                     
  0ad8  706174636869.. ds "patching"                     
LAB_M7B_r3_08000__0ae0:
  0ae0  AD9FFDF2       JSR [0xfdf2]                      
  0ae4  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0BE2 ->$0E66 ->$0ECF ->$0A00 ->$0A45 ->$0A7D
  0ae8  0BE2           addr M7B_r3_08000::0be2           
  0aea  0E66           addr M7B_r3_08000::0e66           
  0aec  0ECF           addr M7B_r3_08000::0ecf           
  0aee  0A00           addr M7B_r3_08000::0a00           
  0af0  0A45           addr M7B_r3_08000::0a45           
  0af2  0A7D           addr M7B_r3_08000::0a7d           
LAB_M7B_r3_08000__0af4:
  0af4  CC0002         LDD #0x2                          
  0af7  17FF3F         LBSR 0x0a39                       
  0afa  39             RTS                               

; ---- function FUN_M7B_r3_08000__0afb
FUN_M7B_r3_08000__0afb:
  0afb  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "detune 1" "delay 1 " " bpm 1  " "modamt 1"
  0aff  646574756E65.. ds "detune 1"                     
  0b07  64656C617920.. ds "delay 1 "                     
  0b0f  2062706D2031.. ds " bpm 1  "                     
  0b17  6D6F64616D74.. ds "modamt 1"                     
LAB_M7B_r3_08000__0b1f:
  0b1f  AD9FFDF2       JSR [0xfdf2]                      
  0b23  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1763 ->$18F2 ->$1B11 ->$1C5F ->$0B3A ->$0BB8
  0b27  1763           addr M7B_r3_08000::1763           
  0b29  18F2           addr M7B_r3_08000::18f2           
  0b2b  1B11           addr M7B_r3_08000::1b11           
  0b2d  1C5F           addr M7B_r3_08000::1c5f           
  0b2f  0B3A           addr M7B_r3_08000::0b3a           
  0b31  0BB8           addr M7B_r3_08000::0bb8           
LAB_M7B_r3_08000__0b33:
  0b33  CC0003         LDD #0x3                          
  0b36  17FF00         LBSR 0x0a39                       
  0b39  39             RTS                               

; ---- function FUN_M7B_r3_08000__0b3a
FUN_M7B_r3_08000__0b3a:
  0b3a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "detune 2" "delay 2 " " bpm 2  " "modamt 2"
  0b3e  646574756E65.. ds "detune 2"                     
  0b46  64656C617920.. ds "delay 2 "                     
  0b4e  2062706D2032.. ds " bpm 2  "                     
  0b56  6D6F64616D74.. ds "modamt 2"                     
LAB_M7B_r3_08000__0b5e:
  0b5e  AD9FFDF2       JSR [0xfdf2]                      
  0b62  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$181D ->$198F ->$1BB8 ->$1CEF ->$0B79 ->$0AFB
  0b66  181D           addr M7B_r3_08000::181d           
  0b68  198F           addr M7B_r3_08000::198f           
  0b6a  1BB8           addr M7B_r3_08000::1bb8           
  0b6c  1CEF           addr M7B_r3_08000::1cef           
  0b6e  0B79           addr M7B_r3_08000::0b79           
  0b70  0AFB           addr M7B_r3_08000::0afb           
LAB_M7B_r3_08000__0b72:
  0b72  CC0004         LDD #0x4                          
  0b75  17FEC1         LBSR 0x0a39                       
  0b78  39             RTS                               

; ---- function FUN_M7B_r3_08000__0b79
FUN_M7B_r3_08000__0b79:
  0b79  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "splice 1" "xfade 1 " "splice 2" "xfade 2 "
  0b7d  73706C696365.. ds "splice 1"                     
  0b85  786661646520.. ds "xfade 1 "                     
  0b8d  73706C696365.. ds "splice 2"                     
  0b95  786661646520.. ds "xfade 2 "                     
LAB_M7B_r3_08000__0b9d:
  0b9d  AD9FFDF2       JSR [0xfdf2]                      
  0ba1  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1E97 ->$1D7F ->$1F1E ->$1E0B ->$0BB8 ->$0B3A
  0ba5  1E97           addr M7B_r3_08000::1e97           
  0ba7  1D7F           addr M7B_r3_08000::1d7f           
  0ba9  1F1E           addr M7B_r3_08000::1f1e           
  0bab  1E0B           addr M7B_r3_08000::1e0b           
  0bad  0BB8           addr M7B_r3_08000::0bb8           
  0baf  0B3A           addr M7B_r3_08000::0b3a           
LAB_M7B_r3_08000__0bb1:
  0bb1  CC0005         LDD #0x5                          
  0bb4  17FE82         LBSR 0x0a39                       
  0bb7  39             RTS                               

; ---- function FUN_M7B_r3_08000__0bb8
FUN_M7B_r3_08000__0bb8:
  0bb8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] "return  "
  0bbc  01             db 1h                             
  0bbd  01             db 1h                             
  0bbe  01             db 1h                             
  0bbf  72657475726E.. ds "return  "                     
LAB_M7B_r3_08000__0bc7:
  0bc7  AD9FFDF2       JSR [0xfdf2]                      
  0bcb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F33 ->$0F33 ->$0F33 ->$0A7D ->$0AFB ->$0B79
  0bcf  0F33           addr M7B_r3_08000::0f33           
  0bd1  0F33           addr M7B_r3_08000::0f33           
  0bd3  0F33           addr M7B_r3_08000::0f33           
  0bd5  0A7D           addr M7B_r3_08000::0a7d           
  0bd7  0AFB           addr M7B_r3_08000::0afb           
  0bd9  0B79           addr M7B_r3_08000::0b79           
LAB_M7B_r3_08000__0bdb:
  0bdb  CC0006         LDD #0x6                          
  0bde  17FE58         LBSR 0x0a39                       
  0be1  39             RTS                               

; ---- function FUN_M7B_r3_08000__0be2
FUN_M7B_r3_08000__0be2:
  0be2  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " mix1 a " " mix1 b " " mix2 a " " mix2 b "
  0be6  206D69783120.. ds " mix1 a "                     
  0bee  206D69783120.. ds " mix1 b "                     
  0bf6  206D69783220.. ds " mix2 a "                     
  0bfe  206D69783220.. ds " mix2 b "                     
LAB_M7B_r3_08000__0c06:
  0c06  AD9FFDF2       JSR [0xfdf2]                      
  0c0a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$340F ->$34B5 ->$355B ->$3601 ->$0C21 ->$0C60
  0c0e  340F           addr M7B_r3_08000::340f           
  0c10  34B5           addr M7B_r3_08000::34b5           
  0c12  355B           addr M7B_r3_08000::355b           
  0c14  3601           addr M7B_r3_08000::3601           
  0c16  0C21           addr M7B_r3_08000::0c21           
  0c18  0C60           addr M7B_r3_08000::0c60           
LAB_M7B_r3_08000__0c1a:
  0c1a  CC0007         LDD #0x7                          
  0c1d  17FE19         LBSR 0x0a39                       
  0c20  39             RTS                               

; ---- function FUN_M7B_r3_08000__0c21
FUN_M7B_r3_08000__0c21:
  0c21  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " mix3 a " " mix3 b " " mix4 a " " mix4 b "
  0c25  206D69783320.. ds " mix3 a "                     
  0c2d  206D69783320.. ds " mix3 b "                     
  0c35  206D69783420.. ds " mix4 a "                     
  0c3d  206D69783420.. ds " mix4 b "                     
LAB_M7B_r3_08000__0c45:
  0c45  AD9FFDF2       JSR [0xfdf2]                      
  0c49  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$36A7 ->$374D ->$37F3 ->$3899 ->$0C60 ->$0BE2
  0c4d  36A7           addr M7B_r3_08000::36a7           
  0c4f  374D           addr M7B_r3_08000::374d           
  0c51  37F3           addr M7B_r3_08000::37f3           
  0c53  3899           addr M7B_r3_08000::3899           
  0c55  0C60           addr M7B_r3_08000::0c60           
  0c57  0BE2           addr M7B_r3_08000::0be2           
LAB_M7B_r3_08000__0c59:
  0c59  CC0008         LDD #0x8                          
  0c5c  17FDDA         LBSR 0x0a39                       
  0c5f  39             RTS                               

; ---- function FUN_M7B_r3_08000__0c60
FUN_M7B_r3_08000__0c60:
  0c60  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "mscale 1" "mscale 2" [*] "return  "
  0c64  6D7363616C65.. ds "mscale 1"                     
  0c6c  6D7363616C65.. ds "mscale 2"                     
  0c74  01             db 1h                             
  0c75  72657475726E.. ds "return  "                     
LAB_M7B_r3_08000__0c7d:
  0c7d  AD9FFDF2       JSR [0xfdf2]                      
  0c81  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$393F ->$39E5 ->$0F33 ->$0ABC ->$0BE2 ->$0C21
  0c85  393F           addr M7B_r3_08000::393f           
  0c87  39E5           addr M7B_r3_08000::39e5           
  0c89  0F33           addr M7B_r3_08000::0f33           
  0c8b  0ABC           addr M7B_r3_08000::0abc           
  0c8d  0BE2           addr M7B_r3_08000::0be2           
  0c8f  0C21           addr M7B_r3_08000::0c21           
LAB_M7B_r3_08000__0c91:
  0c91  CC0009         LDD #0x9                          
  0c94  17FDA2         LBSR 0x0a39                       
  0c97  39             RTS                               

; ---- function FUN_M7B_r3_08000__0c98
FUN_M7B_r3_08000__0c98:
  0c98  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "env  att" "env  dec" " thresh " " ratio  "
  0c9c  656E76202061.. ds "env  att"                     
  0ca4  656E76202064.. ds "env  dec"                     
  0cac  207468726573.. ds " thresh "                     
  0cb4  20726174696F.. ds " ratio  "                     
LAB_M7B_r3_08000__0cbc:
  0cbc  AD9FFDF2       JSR [0xfdf2]                      
  0cc0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2E90 ->$3023 ->$3079 ->$310C ->$0CD7 ->$0CD7
  0cc4  2E90           addr M7B_r3_08000::2e90           
  0cc6  3023           addr M7B_r3_08000::3023           
  0cc8  3079           addr M7B_r3_08000::3079           
  0cca  310C           addr M7B_r3_08000::310c           
  0ccc  0CD7           addr M7B_r3_08000::0cd7           
  0cce  0CD7           addr M7B_r3_08000::0cd7           
LAB_M7B_r3_08000__0cd0:
  0cd0  CC000A         LDD #0xa                          
  0cd3  17FD63         LBSR 0x0a39                       
  0cd6  39             RTS                               

; ---- function FUN_M7B_r3_08000__0cd7
FUN_M7B_r3_08000__0cd7:
  0cd7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] "return  "
  0cdb  01             db 1h                             
  0cdc  01             db 1h                             
  0cdd  01             db 1h                             
  0cde  72657475726E.. ds "return  "                     
LAB_M7B_r3_08000__0ce6:
  0ce6  AD9FFDF2       JSR [0xfdf2]                      
  0cea  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F33 ->$0F33 ->$0F33 ->$0A7D ->$0C98 ->$0C98
  0cee  0F33           addr M7B_r3_08000::0f33           
  0cf0  0F33           addr M7B_r3_08000::0f33           
  0cf2  0F33           addr M7B_r3_08000::0f33           
  0cf4  0A7D           addr M7B_r3_08000::0a7d           
  0cf6  0C98           addr M7B_r3_08000::0c98           
  0cf8  0C98           addr M7B_r3_08000::0c98           
LAB_M7B_r3_08000__0cfa:
  0cfa  CC000B         LDD #0xb                          
  0cfd  17FD39         LBSR 0x0a39                       
  0d00  39             RTS                               

; ---- function FUN_M7B_r3_08000__0d01
FUN_M7B_r3_08000__0d01:
  0d01  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "dly1 bpm" "delay 2 " "dly2 bpm"
  0d05  64656C617920.. ds "delay 1 "                     
  0d0d  646C79312062.. ds "dly1 bpm"                     
  0d15  64656C617920.. ds "delay 2 "                     
  0d1d  646C79322062.. ds "dly2 bpm"                     
LAB_M7B_r3_08000__0d25:
  0d25  AD9FFDF2       JSR [0xfdf2]                      
  0d29  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1FED ->$2122 ->$20AA ->$21C9 ->$0D40 ->$0DBE
  0d2d  1FED           addr M7B_r3_08000::1fed           
  0d2f  2122           addr M7B_r3_08000::2122           
  0d31  20AA           addr M7B_r3_08000::20aa           
  0d33  21C9           addr M7B_r3_08000::21c9           
  0d35  0D40           addr M7B_r3_08000::0d40           
  0d37  0DBE           addr M7B_r3_08000::0dbe           
LAB_M7B_r3_08000__0d39:
  0d39  CC000D         LDD #0xd                          
  0d3c  17FCFA         LBSR 0x0a39                       
  0d3f  39             RTS                               

; ---- function FUN_M7B_r3_08000__0d40
FUN_M7B_r3_08000__0d40:
  0d40  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay1fb" "delay1 m" "delay2fb" "delay2 m"
  0d44  64656C617931.. ds "delay1fb"                     
  0d4c  64656C617931.. ds "delay1 m"                     
  0d54  64656C617932.. ds "delay2fb"                     
  0d5c  64656C617932.. ds "delay2 m"                     
LAB_M7B_r3_08000__0d64:
  0d64  AD9FFDF2       JSR [0xfdf2]                      
  0d68  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2270 ->$272B ->$2311 ->$27E3 ->$0D7F ->$0D01
  0d6c  2270           addr M7B_r3_08000::2270           
  0d6e  272B           addr M7B_r3_08000::272b           
  0d70  2311           addr M7B_r3_08000::2311           
  0d72  27E3           addr M7B_r3_08000::27e3           
  0d74  0D7F           addr M7B_r3_08000::0d7f           
  0d76  0D01           addr M7B_r3_08000::0d01           
LAB_M7B_r3_08000__0d78:
  0d78  CC000E         LDD #0xe                          
  0d7b  17FCBB         LBSR 0x0a39                       
  0d7e  39             RTS                               

; ---- function FUN_M7B_r3_08000__0d7f
FUN_M7B_r3_08000__0d7f:
  0d7f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " loop 1 " " loop 2 " "highcut1" "highcut2"
  0d83  206C6F6F7020.. ds " loop 1 "                     
  0d8b  206C6F6F7020.. ds " loop 2 "                     
  0d93  686967686375.. ds "highcut1"                     
  0d9b  686967686375.. ds "highcut2"                     
LAB_M7B_r3_08000__0da3:
  0da3  AD9FFDF2       JSR [0xfdf2]                      
  0da7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$25A1 ->$266C ->$23B2 ->$243B ->$0DBE ->$0D40
  0dab  25A1           addr M7B_r3_08000::25a1           
  0dad  266C           addr M7B_r3_08000::266c           
  0daf  23B2           addr M7B_r3_08000::23b2           
  0db1  243B           addr M7B_r3_08000::243b           
  0db3  0DBE           addr M7B_r3_08000::0dbe           
  0db5  0D40           addr M7B_r3_08000::0d40           
LAB_M7B_r3_08000__0db7:
  0db7  CC000F         LDD #0xf                          
  0dba  17FC7C         LBSR 0x0a39                       
  0dbd  39             RTS                               

; ---- function FUN_M7B_r3_08000__0dbe
FUN_M7B_r3_08000__0dbe:
  0dbe  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "cutmod 1" "cutmod 2" [*] " return "
  0dc2  6375746D6F64.. ds "cutmod 1"                     
  0dca  6375746D6F64.. ds "cutmod 2"                     
  0dd2  01             db 1h                             
  0dd3  207265747572.. ds " return "                     
LAB_M7B_r3_08000__0ddb:
  0ddb  AD9FFDF2       JSR [0xfdf2]                      
  0ddf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$289B ->$294A ->$0F33 ->$0A7D ->$0D01 ->$0D7F
  0de3  289B           addr M7B_r3_08000::289b           
  0de5  294A           addr M7B_r3_08000::294a           
  0de7  0F33           addr M7B_r3_08000::0f33           
  0de9  0A7D           addr M7B_r3_08000::0a7d           
  0deb  0D01           addr M7B_r3_08000::0d01           
  0ded  0D7F           addr M7B_r3_08000::0d7f           
LAB_M7B_r3_08000__0def:
  0def  CC0010         LDD #0x10                         
  0df2  17FC44         LBSR 0x0a39                       
  0df5  39             RTS                               

; ---- function FUN_M7B_r3_08000__0df6
FUN_M7B_r3_08000__0df6:
  0df6  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "lfo freq" "lfo bpm " "lfo mod " "lfo wave"
  0dfa  6C666F206672.. ds "lfo freq"                     
  0e02  6C666F206270.. ds "lfo bpm "                     
  0e0a  6C666F206D6F.. ds "lfo mod "                     
  0e12  6C666F207761.. ds "lfo wave"                     
LAB_M7B_r3_08000__0e1a:
  0e1a  AD9FFDF2       JSR [0xfdf2]                      
  0e1e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$29F9 ->$2ABA ->$2DB8 ->$2B59 ->$0E35 ->$0E35
  0e22  29F9           addr M7B_r3_08000::29f9           
  0e24  2ABA           addr M7B_r3_08000::2aba           
  0e26  2DB8           addr M7B_r3_08000::2db8           
  0e28  2B59           addr M7B_r3_08000::2b59           
  0e2a  0E35           addr M7B_r3_08000::0e35           
  0e2c  0E35           addr M7B_r3_08000::0e35           
LAB_M7B_r3_08000__0e2e:
  0e2e  CC0011         LDD #0x11                         
  0e31  17FC05         LBSR 0x0a39                       
  0e34  39             RTS                               

; ---- function FUN_M7B_r3_08000__0e35
FUN_M7B_r3_08000__0e35:
  0e35  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " thresh " [*] [*] " return "
  0e39  207468726573.. ds " thresh "                     
  0e41  01             db 1h                             
  0e42  01             db 1h                             
  0e43  207265747572.. ds " return "                     
LAB_M7B_r3_08000__0e4b:
  0e4b  AD9FFDF2       JSR [0xfdf2]                      
  0e4f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2CCD ->$0F33 ->$0F33 ->$0A7D ->$0DF6 ->$0DF6
  0e53  2CCD           addr M7B_r3_08000::2ccd           
  0e55  0F33           addr M7B_r3_08000::0f33           
  0e57  0F33           addr M7B_r3_08000::0f33           
  0e59  0A7D           addr M7B_r3_08000::0a7d           
  0e5b  0DF6           addr M7B_r3_08000::0df6           
  0e5d  0DF6           addr M7B_r3_08000::0df6           
LAB_M7B_r3_08000__0e5f:
  0e5f  CC0012         LDD #0x12                         
  0e62  17FBD4         LBSR 0x0a39                       
  0e65  39             RTS                               

; ---- function FUN_M7B_r3_08000__0e66
FUN_M7B_r3_08000__0e66:
  0e66  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "am1 amt " "am1 ofs " "am2 amt " "am2 ofs "
  0e6a  616D3120616D.. ds "am1 amt "                     
  0e72  616D31206F66.. ds "am1 ofs "                     
  0e7a  616D3220616D.. ds "am2 amt "                     
  0e82  616D32206F66.. ds "am2 ofs "                     
LAB_M7B_r3_08000__0e8a:
  0e8a  AD9FFDF2       JSR [0xfdf2]                      
  0e8e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$31C3 ->$32E9 ->$3256 ->$337C ->$0EA5 ->$0EA5
  0e92  31C3           addr M7B_r3_08000::31c3           
  0e94  32E9           addr M7B_r3_08000::32e9           
  0e96  3256           addr M7B_r3_08000::3256           
  0e98  337C           addr M7B_r3_08000::337c           
  0e9a  0EA5           addr M7B_r3_08000::0ea5           
  0e9c  0EA5           addr M7B_r3_08000::0ea5           
LAB_M7B_r3_08000__0e9e:
  0e9e  CC0014         LDD #0x14                         
  0ea1  17FB95         LBSR 0x0a39                       
  0ea4  39             RTS                               

; ---- function FUN_M7B_r3_08000__0ea5
FUN_M7B_r3_08000__0ea5:
  0ea5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " return "
  0ea9  01             db 1h                             
  0eaa  01             db 1h                             
  0eab  01             db 1h                             
  0eac  207265747572.. ds " return "                     
LAB_M7B_r3_08000__0eb4:
  0eb4  AD9FFDF2       JSR [0xfdf2]                      
  0eb8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0F33 ->$0F33 ->$0F33 ->$0ABC ->$0E66 ->$0E66
  0ebc  0F33           addr M7B_r3_08000::0f33           
  0ebe  0F33           addr M7B_r3_08000::0f33           
  0ec0  0F33           addr M7B_r3_08000::0f33           
  0ec2  0ABC           addr M7B_r3_08000::0abc           
  0ec4  0E66           addr M7B_r3_08000::0e66           
  0ec6  0E66           addr M7B_r3_08000::0e66           
LAB_M7B_r3_08000__0ec8:
  0ec8  CC0015         LDD #0x15                         
  0ecb  17FB6B         LBSR 0x0a39                       
  0ece  39             RTS                               

; ---- function FUN_M7B_r3_08000__0ecf
FUN_M7B_r3_08000__0ecf:
  0ecf  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] "return  "
  0ed3  6C6566742069.. ds "left in "                     
  0edb  726967687420.. ds "right in"                     
  0ee3  01             db 1h                             
  0ee4  72657475726E.. ds "return  "                     
LAB_M7B_r3_08000__0eec:
  0eec  AD9FFDF2       JSR [0xfdf2]                      
  0ef0  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3A8B ->$3B05 ->$0F33 ->$0ABC ->$0F01 ->$0F01
  0ef4  3A8B           addr M7B_r3_08000::3a8b           
  0ef6  3B05           addr M7B_r3_08000::3b05           
  0ef8  0F33           addr M7B_r3_08000::0f33           
  0efa  0ABC           addr M7B_r3_08000::0abc           
  0efc  0F01           addr M7B_r3_08000::0f01           
  0efe  0F01           addr M7B_r3_08000::0f01           
LAB_M7B_r3_08000__0f00:
  0f00  39             RTS                               

; ---- function FUN_M7B_r3_08000__0f01
FUN_M7B_r3_08000__0f01:
  0f01  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] "return  "
  0f05  6C656674206F.. ds "left out"                     
  0f0d  72696768746F.. ds "rightout"                     
  0f15  01             db 1h                             
  0f16  72657475726E.. ds "return  "                     
LAB_M7B_r3_08000__0f1e:
  0f1e  AD9FFDF2       JSR [0xfdf2]                      
  0f22  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$3B7F ->$3BF9 ->$0F33 ->$0ABC ->$0ECF ->$0ECF
  0f26  3B7F           addr M7B_r3_08000::3b7f           
  0f28  3BF9           addr M7B_r3_08000::3bf9           
  0f2a  0F33           addr M7B_r3_08000::0f33           
  0f2c  0ABC           addr M7B_r3_08000::0abc           
  0f2e  0ECF           addr M7B_r3_08000::0ecf           
  0f30  0ECF           addr M7B_r3_08000::0ecf           
LAB_M7B_r3_08000__0f32:
  0f32  39             RTS                               

; ---- function FUN_M7B_r3_08000__0f33
FUN_M7B_r3_08000__0f33:
  0f33  39             RTS                               

; ---- function FUN_M7B_r3_08000__0f34
FUN_M7B_r3_08000__0f34:
  0f34  CC000A         LDD #0xa                          
  0f37  AD9FFD20       JSR [0xfd20]                      
  0f3b  1F10           TFR X,D                           
  0f3d  AD9FFD2E       JSR [0xfd2e]                      
  0f41  39             RTS                               

; ---- function FUN_M7B_r3_08000__0f42
FUN_M7B_r3_08000__0f42:
  0f42  3476           PSHS  U Y X B A                   
  0f44  FC7008         LDD 0x7008                        
  0f47  FD6074         STD 0x6074                        
  0f4a  AD9FFDFC       JSR [0xfdfc]                      
  0f4e  C613           LDB #0x13                         
  0f50  AD9FFC36       JSR [0xfc36]                      
  0f54  C60A           LDB #0xa                          
  0f56  AD9FFC2A       JSR [0xfc2a]                      
  0f5a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 10 02 01 01 00 0B 80 $0015 $0000 $0000 ->$0FE6 ->$0F7B $0001 $0001 $0000
  0f5e  01             db 1h                             
  0f5f  10             db 10h                            
  0f60  02             db 2h                             
  0f61  01             db 1h                             
  0f62  01             db 1h                             
  0f63  00             db 0h                             
  0f64  0B             db Bh                             
  0f65  80             db 80h                            
  0f66  0015           dw 15h                            
  0f68  0000           dw 0h                             
  0f6a  0000           dw 0h                             
  0f6c  0FE6           addr M7B_r3_08000::0fe6           
  0f6e  0F7B           addr M7B_r3_08000::0f7b           
  0f70  0001           dw 1h                             
  0f72  0001           dw 1h                             
  0f74  0000           dw 0h                             
LAB_M7B_r3_08000__0f76:
  0f76  17006D         LBSR 0x0fe6                       
  0f79  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__0f7b
FUN_M7B_r3_08000__0f7b:
  0f7b  3476           PSHS  U Y X B A                   
  0f7d  FC6074         LDD 0x6074                        
  0f80  FD7008         STD 0x7008                        
  0f83  FC7006         LDD 0x7006                        
  0f86  58             LSLB                              
  0f87  49             ROLA                              
  0f88  1F01           TFR D,X                           
  0f8a  FC7008         LDD 0x7008                        
  0f8d  ED89700A       STD 0x700a,X                      
  0f91  10BE7006       LDY 0x7006                        
  0f95  AD9FFE40       JSR [0xfe40]                      
  0f99  17004E         LBSR 0x0fea                       
  0f9c  170047         LBSR 0x0fe6                       
  0f9f  108E0061       LDY #0x61                         
  0fa3  FC7006         LDD 0x7006                        
  0fa6  31AB           LEAY D,Y                          
  0fa8  FC7008         LDD 0x7008                        
  0fab  AD9FFC80       JSR [0xfc80]                      
  0faf  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__0fb1
FUN_M7B_r3_08000__0fb1:
  0fb1  3476           PSHS  U Y X B A                   
  0fb3  FD7006         STD 0x7006                        
  0fb6  AD9FFC8E       JSR [0xfc8e]                      
  0fba  FC60F9         LDD 0x60f9                        
  0fbd  FD7008         STD 0x7008                        
  0fc0  FC7006         LDD 0x7006                        
  0fc3  58             LSLB                              
  0fc4  49             ROLA                              
  0fc5  1F01           TFR D,X                           
  0fc7  FC7008         LDD 0x7008                        
  0fca  ED89700A       STD 0x700a,X                      
  0fce  170019         LBSR 0x0fea                       
  0fd1  170012         LBSR 0x0fe6                       
  0fd4  108E0061       LDY #0x61                         
  0fd8  FC7006         LDD 0x7006                        
  0fdb  31AB           LEAY D,Y                          
  0fdd  FC7008         LDD 0x7008                        
  0fe0  AD9FFC80       JSR [0xfc80]                      
  0fe4  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__0fe6
FUN_M7B_r3_08000__0fe6:
  0fe6  170094         LBSR 0x107d                       
  0fe9  39             RTS                               

; ---- function FUN_M7B_r3_08000__0fea
FUN_M7B_r3_08000__0fea:
  0fea  3476           PSHS  U Y X B A                   
  0fec  CC0028         LDD #0x28                         
  0fef  AD9FFD20       JSR [0xfd20]                      
  0ff3  108E3F2C       LDY #0x3f2c                       
  0ff7  FC7006         LDD 0x7006                        
  0ffa  31AB           LEAY D,Y                          
  0ffc  FC7006         LDD 0x7006                        
  0fff  58             LSLB                              
  1000  49             ROLA                              
  1001  1F01           TFR D,X                           
  1003  EC89700A       LDD 0x700a,X                      
  1007  C30001         ADDD #0x1                         
  100a  AD9FFD2E       JSR [0xfd2e]                      
  100e  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__1010
FUN_M7B_r3_08000__1010:
  1010  3476           PSHS  U Y X B A                   
  1012  4F             CLRA                              
  1013  5F             CLRB                              
LAB_M7B_r3_08000__1014:
  1014  FD7006         STD 0x7006                        
  1017  17FFD0         LBSR 0x0fea                       
  101a  C30001         ADDD #0x1                         
  101d  1083001B       CMPD #0x1b                        
  1021  2FF1           BLE 0x1014                        
  1023  4F             CLRA                              
  1024  5F             CLRB                              
  1025  FD7006         STD 0x7006                        
  1028  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__102a
FUN_M7B_r3_08000__102a:
  102a  3476           PSHS  U Y X B A                   
  102c  FC7006         LDD 0x7006                        
  102f  FD6074         STD 0x6074                        
  1032  AD9FFDFC       JSR [0xfdfc]                      
  1036  C613           LDB #0x13                         
  1038  AD9FFC36       JSR [0xfc36]                      
  103c  C60A           LDB #0xa                          
  103e  AD9FFC2A       JSR [0xfc2a]                      
  1042  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 10 02 01 01 00 09 80 $001B $0000 $0000 ->$107D ->$1063 $0001 $0001 $0000
  1046  01             db 1h                             
  1047  10             db 10h                            
  1048  02             db 2h                             
  1049  01             db 1h                             
  104a  01             db 1h                             
  104b  00             db 0h                             
  104c  09             db 9h                             
  104d  80             db 80h                            
  104e  001B           dw 1Bh                            
  1050  0000           dw 0h                             
  1052  0000           dw 0h                             
  1054  107D           addr M7B_r3_08000::107d           
  1056  1063           addr M7B_r3_08000::1063           
  1058  0001           dw 1h                             
  105a  0001           dw 1h                             
  105c  0000           dw 0h                             
LAB_M7B_r3_08000__105e:
  105e  170002         LBSR 0x1063                       
  1061  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__1063
FUN_M7B_r3_08000__1063:
  1063  3476           PSHS  U Y X B A                   
  1065  FC6074         LDD 0x6074                        
  1068  FD7006         STD 0x7006                        
  106b  8E700A         LDX #0x700a                       
  106e  58             LSLB                              
  106f  49             ROLA                              
  1070  EC8B           LDD D,X                           
  1072  FD7008         STD 0x7008                        
  1075  17003D         LBSR 0x10b5                       
  1078  170002         LBSR 0x107d                       
  107b  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__107d
FUN_M7B_r3_08000__107d:
  107d  3476           PSHS  U Y X B A                   
  107f  C614           LDB #0x14                         
  1081  AD9FFC36       JSR [0xfc36]                      
  1085  FC7006         LDD 0x7006                        
  1088  8609           LDA #0x9                          
  108a  3D             MUL                               
  108b  F3600D         ADDD 0x600d                       
  108e  C310B6         ADDD #0x10b6                      
  1091  1F01           TFR D,X                           
  1093  C609           LDB #0x9                          
  1095  AD9FFC3A       JSR [0xfc3a]                      
  1099  C61D           LDB #0x1d                         
  109b  AD9FFC36       JSR [0xfc36]                      
  109f  FC7008         LDD 0x7008                        
  10a2  860B           LDA #0xb                          
  10a4  3D             MUL                               
  10a5  F3600D         ADDD 0x600d                       
  10a8  C311B2         ADDD #0x11b2                      
  10ab  1F01           TFR D,X                           
  10ad  C60B           LDB #0xb                          
  10af  AD9FFC3A       JSR [0xfc3a]                      
  10b3  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__10b5
FUN_M7B_r3_08000__10b5:
  10b5  39             RTS                               
  10b6  .db 6C 65 66 74 20 6F 75 74 3C 72 69 67 68 74 6F 75  ; left out<rightou
  10c6  .db 74 3C 6D 69 78 31 61 20 69 6E 3C 6D 69 78 31 62  ; t<mix1a in<mix1b
  10d6  .db 20 69 6E 3C 6D 69 78 32 61 20 69 6E 3C 6D 69 78  ;  in<mix2a in<mix
  10e6  .db 32 62 20 69 6E 3C 6D 69 78 33 61 20 69 6E 3C 6D  ; 2b in<mix3a in<m
  10f6  .db 69 78 33 62 20 69 6E 3C 6D 69 78 34 61 20 69 6E  ; ix3b in<mix4a in
  1106  .db 3C 6D 69 78 34 62 20 69 6E 3C 61 6D 31 20 69 6E  ; <mix4b in<am1 in
  1116  .db 20 20 3C 61 6D 31 20 6D 6F 64 20 3C 61 6D 32 20  ;   <am1 mod <am2 
  1126  .db 69 6E 20 20 3C 61 6D 32 20 6D 6F 64 20 3C 64 6C  ; in  <am2 mod <dl
  1136  .db 79 20 31 20 69 6E 3C 64 6C 79 31 20 6D 6F 64 3C  ; y 1 in<dly1 mod<
  1146  .db 64 6C 79 31 63 74 6D 64 3C 64 6C 79 20 32 20 69  ; dly1ctmd<dly 2 i
  1156  .db 6E 3C 64 6C 79 32 20 6D 6F 64 3C 64 6C 79 32 63  ; n<dly2 mod<dly2c
  1166  .db 74 6D 64 3C 64 74 75 6E 65 31 69 6E 3C 64 74 75  ; tmd<dtune1in<dtu
  1176  .db 6E 31 6D 6F 64 3C 64 74 75 6E 65 32 69 6E 3C 64  ; n1mod<dtune2in<d
  1186  .db 74 75 6E 32 6D 6F 64 3C 65 6E 76 20 69 6E 20 20  ; tun2mod<env in  
  1196  .db 3C 6C 66 6F 20 69 6E 20 20 3C 6D 64 73 63 6C 31  ; <lfo in  <mdscl1
  11a6  .db 69 6E 3C 6D 64 73 63 6C 32 69 6E 3C 7A 65 72 6F  ; in<mdscl2in<zero
  11b6  .db 20 20 20 20 20 20 20 6C 65 66 74 20 69 6E 70 75  ;        left inpu
  11c6  .db 74 20 72 69 67 68 74 20 69 6E 70 75 74 6D 69 78  ; t right inputmix
  11d6  .db 65 72 20 31 20 20 20 20 6D 69 78 65 72 20 32 20  ; er 1    mixer 2 
  11e6  .db 20 20 20 6D 69 78 65 72 20 33 20 20 20 20 6D 69  ;    mixer 3    mi
  11f6  .db 78 65 72 20 34 20 20 20 20 61 6D 70 20 6D 6F 64  ; xer 4    amp mod
  1206  .db 20 31 20 20 61 6D 70 20 6D 6F 64 20 32 20 20 64  ;  1  amp mod 2  d
  1216  .db 65 6C 61 79 20 31 20 20 20 20 64 65 6C 61 79 20  ; elay 1    delay 
  1226  .db 32 20 20 20 20 64 65 74 75 6E 65 20 31 20 20 20  ; 2    detune 1   
  1236  .db 64 65 74 75 6E 65 20 32 20 20 20 64 75 63 6B 65  ; detune 2   ducke
  1246  .db 72 20 20 20 20 20 65 6E 76 65 6C 6F 70 65 20 20  ; r     envelope  
  1256  .db 20 6C 66 6F 20 20 20 20 20 20 20 20 6D 6F 64 20  ;  lfo        mod 
  1266  .db 6B 6E 6F 62 20 20 20 6E 6F 69 73 65 20 67 65 6E  ; knob   noise gen
  1276  .db 2E 20 66 75 6C 6C 73 63 61 6C 65 20 20 2D 66 75  ; . fullscale  -fu
  1286  .db 6C 6C 73 63 61 6C 65 20 6D 6F 64 73 63 61 6C 65  ; llscale modscale
  1296  .db 20 31 20 6D 6F 64 73 63 61 6C 65 20 32 20 74 65  ;  1 modscale 2 te
  12a6  .db 73 74 20 31 20 20 20 20 20 74 65 73 74 20 32 20  ; st 1     test 2 
  12b6  .db 20 20 20 20                                      ;     
PTR_FUN_M7B_r3_08000__133d_M7B_r3_08000__12ba:
  12ba  133D           addr M7B_r3_08000::133d           
  12bc  1304           addr M7B_r3_08000::1304           
  12be  .db 12 F8 70 42 70 EA 00 00 70 EC 3F E9 41 11 1E 00  ; ..pBp...p.?.A...
  12ce  .db 00 03 E8 00 01 01 05 1E 13 28 00 00 00 00 70 44  ; .........(....pD
  12de  .db 40 7C                                            ; @|

; ---- function FUN_M7B_r3_08000__12e0
FUN_M7B_r3_08000__12e0:
  12e0  3410           PSHS  X                           
  12e2  8E12BA         LDX #0x12ba                        ; desc[API_FE6A]: ->$133D ->$1304
  12e5  AD9FFE6A       JSR [0xfe6a]                      
  12e9  3510           PULS  X                           
  12eb  39             RTS                               

; ---- function FUN_M7B_r3_08000__12ec
FUN_M7B_r3_08000__12ec:
  12ec  3410           PSHS  X                           
  12ee  8E12BA         LDX #0x12ba                        ; desc[API_FDBC]: ->$133D ->$1304
  12f1  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  12f5  3510           PULS  X                           
  12f7  39             RTS                               

; ---- function FUN_M7B_r3_08000__12f8
FUN_M7B_r3_08000__12f8:
  12f8  3410           PSHS  X                           
  12fa  8E12BA         LDX #0x12ba                        ; desc[API_FE6C]: ->$133D ->$1304
  12fd  AD9FFE6C       JSR [0xfe6c]                      
  1301  3510           PULS  X                           
  1303  39             RTS                               

; ---- function FUN_M7B_r3_08000__1304
FUN_M7B_r3_08000__1304:
  1304  3410           PSHS  X                           
  1306  8E12BA         LDX #0x12ba                        ; desc[API_FE6E]: ->$133D ->$1304
  1309  AD9FFE6E       JSR [0xfe6e]                      
  130d  3510           PULS  X                           
  130f  39             RTS                               

; ---- function FUN_M7B_r3_08000__1310
FUN_M7B_r3_08000__1310:
  1310  3410           PSHS  X                           
  1312  8E12BA         LDX #0x12ba                        ; desc[API_FE1C]: ->$133D ->$1304
  1315  AD9FFE1C       JSR [0xfe1c]                      
  1319  3510           PULS  X                           
  131b  39             RTS                               

; ---- function FUN_M7B_r3_08000__131c
FUN_M7B_r3_08000__131c:
  131c  3410           PSHS  X                           
  131e  8E12BA         LDX #0x12ba                        ; desc[API_FE1A]: ->$133D ->$1304 $12F8
  1321  AD9FFE1A       JSR [0xfe1a]                      
  1325  3510           PULS  X                           
  1327  39             RTS                               
  1328  .db 14 6D 6F 64 20 6B 6E 6F 62 3A 20 20 20 20 20 20  ; .mod knob:      
  1338  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__133d
FUN_M7B_r3_08000__133d:
  133d  3476           PSHS  U Y X B A                   
  133f  8E12BA         LDX #0x12ba                       
  1342  AD9FFE76       JSR [0xfe76]                      
  1346  B67218         LDA 0x7218                        
  1349  270F           BEQ 0x135a                        
  134b  4F             CLRA                              
  134c  B77218         STA 0x7218                        
  134f  5F             CLRB                              
  1350  FD7214         STD 0x7214                        
  1353  C601           LDB #0x1                          
  1355  FD7216         STD 0x7216                        
  1358  2033           BRA 0x138d                        
LAB_M7B_r3_08000__135a:
  135a  8E0001         LDX #0x1                          
  135d  108E3F4B       LDY #0x3f4b                       
  1361  17FBD0         LBSR 0x0f34                       
  1364  CC0064         LDD #0x64                         
  1367  AD9FFD20       JSR [0xfd20]                      
  136b  AD9FFD42       JSR [0xfd42]                      
  136f  1F89           TFR A,B                           
  1371  4F             CLRA                              
  1372  FD7216         STD 0x7216                        
  1375  10270062       LBEQ 0x13db                       
  1379  8E0000         LDX #0x0                          
  137c  108E3F77       LDY #0x3f77                       
  1380  17FBB1         LBSR 0x0f34                       
  1383  8E0000         LDX #0x0                          
  1386  108E0000       LDY #0x0                          
  138a  17FBA7         LBSR 0x0f34                       
LAB_M7B_r3_08000__138d:
  138d  FC70EC         LDD 0x70ec                        
  1390  3606           PSHU  B A                         
  1392  AD9FFEC6       JSR [0xfec6]                      
  1396  3706           PULU  A B                         
  1398  FD7212         STD 0x7212                        
  139b  FC7212         LDD 0x7212                        
  139e  B37214         SUBD 0x7214                       
  13a1  10270036       LBEQ 0x13db                       
  13a5  3606           PSHU  B A                         
  13a7  AD9FFCC8       JSR [0xfcc8]                      
  13ab  FC7216         LDD 0x7216                        
  13ae  3606           PSHU  B A                         
  13b0  AD9FFCEA       JSR [0xfcea]                      
  13b4  3706           PULU  A B                         
  13b6  FD70D6         STD 0x70d6                        
  13b9  2606           BNE 0x13c1                        
  13bb  CC0001         LDD #0x1                          
  13be  FD70D6         STD 0x70d6                        
LAB_M7B_r3_08000__13c1:
  13c1  BE7212         LDX 0x7212                        
  13c4  108E3F75       LDY #0x3f75                       
  13c8  17FB69         LBSR 0x0f34                       
  13cb  BE70D6         LDX 0x70d6                        
  13ce  108E3F76       LDY #0x3f76                       
  13d2  17FB5F         LBSR 0x0f34                       
  13d5  FC7212         LDD 0x7212                        
  13d8  FD7214         STD 0x7214                        
LAB_M7B_r3_08000__13db:
  13db  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1448_M7B_r3_08000__13dd:
  13dd  1448           addr M7B_r3_08000::1448           
  13df  1427           addr M7B_r3_08000::1427           
  13e1  .db 14 1B 70 46 70 EE 00 00 70 F0 3F E9 41 10 1F 00  ; ..pFp...p.?.A...
  13f1  .db 00 00 64 00 01 00 03 19 14 33 00 00 00 00 00 00  ; ..d......3......
  1401  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1403
FUN_M7B_r3_08000__1403:
  1403  3410           PSHS  X                           
  1405  8E13DD         LDX #0x13dd                       
  1408  AD9FFE74       JSR [0xfe74]                      
  140c  3510           PULS  X                           
  140e  39             RTS                               

; ---- function FUN_M7B_r3_08000__140f
FUN_M7B_r3_08000__140f:
  140f  3410           PSHS  X                           
  1411  8E13DD         LDX #0x13dd                        ; desc[API_FE22]: ->$1448 ->$1427
  1414  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  1418  3510           PULS  X                           
  141a  39             RTS                               

; ---- function FUN_M7B_r3_08000__141b
FUN_M7B_r3_08000__141b:
  141b  3410           PSHS  X                           
  141d  8E13DD         LDX #0x13dd                       
  1420  AD9FFE70       JSR [0xfe70]                      
  1424  3510           PULS  X                           
  1426  39             RTS                               

; ---- function FUN_M7B_r3_08000__1427
FUN_M7B_r3_08000__1427:
  1427  3410           PSHS  X                           
  1429  8E13DD         LDX #0x13dd                       
  142c  AD9FFE72       JSR [0xfe72]                      
  1430  3510           PULS  X                           
  1432  39             RTS                               
  1433  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  1443  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__1448
FUN_M7B_r3_08000__1448:
  1448  3476           PSHS  U Y X B A                   
  144a  8E13DD         LDX #0x13dd                       
  144d  AD9FFE76       JSR [0xfe76]                      
  1451  CC0064         LDD #0x64                         
  1454  B370F0         SUBD 0x70f0                       
  1457  3606           PSHU  B A                         
  1459  58             LSLB                              
  145a  49             ROLA                              
  145b  FD70D6         STD 0x70d6                        
  145e  CC4666         LDD #0x4666                       
  1461  3606           PSHU  B A                         
  1463  AD9FFCF2       JSR [0xfcf2]                      
  1467  3706           PULU  A B                         
  1469  F370D6         ADDD 0x70d6                       
  146c  AD9FFC6A       JSR [0xfc6a]                      
  1470  AD9FFC72       JSR [0xfc72]                      
  1474  35F6           PULS  A B X Y U PC                
  1476  .db 14 74 65 6D 70 6F 3A 20 20 20 20 62 65 61 74 73  ; .tempo:    beats
  1486  .db 2F 6D 69 6E 20                                   ; /min 
PTR_FUN_M7B_r3_08000__170b_M7B_r3_08000__148b:
  148b  170B           addr M7B_r3_08000::170b           
  148d  14D5           addr M7B_r3_08000::14d5           
  148f  .db 14 C9 70 48 70 FC 00 00 70 FE 3F E9 40 9C 20 00  ; ..pHp...p.?.@. .
  149f  .db 1E 00 C8 00 01 00 03 1A 14 76 00 00 00 00 70 4A  ; .........v....pJ
  14af  .db 40 9E                                            ; @.

; ---- function FUN_M7B_r3_08000__14b1
FUN_M7B_r3_08000__14b1:
  14b1  3410           PSHS  X                           
  14b3  8E148B         LDX #0x148b                        ; desc[API_FE6A]: ->$170B ->$14D5
  14b6  AD9FFE6A       JSR [0xfe6a]                      
  14ba  3510           PULS  X                           
  14bc  39             RTS                               

; ---- function FUN_M7B_r3_08000__14bd
FUN_M7B_r3_08000__14bd:
  14bd  3410           PSHS  X                           
  14bf  8E148B         LDX #0x148b                        ; desc[API_FDBC]: ->$170B ->$14D5
  14c2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  14c6  3510           PULS  X                           
  14c8  39             RTS                               

; ---- function FUN_M7B_r3_08000__14c9
FUN_M7B_r3_08000__14c9:
  14c9  3410           PSHS  X                           
  14cb  8E148B         LDX #0x148b                        ; desc[API_FE6C]: ->$170B ->$14D5
  14ce  AD9FFE6C       JSR [0xfe6c]                      
  14d2  3510           PULS  X                           
  14d4  39             RTS                               

; ---- function FUN_M7B_r3_08000__14d5
FUN_M7B_r3_08000__14d5:
  14d5  3410           PSHS  X                           
  14d7  8E148B         LDX #0x148b                        ; desc[API_FE6E]: ->$170B ->$14D5
  14da  AD9FFE6E       JSR [0xfe6e]                      
  14de  3510           PULS  X                           
  14e0  39             RTS                               

; ---- function FUN_M7B_r3_08000__14e1
FUN_M7B_r3_08000__14e1:
  14e1  3410           PSHS  X                           
  14e3  8E148B         LDX #0x148b                        ; desc[API_FE1A]: ->$170B ->$14D5 $14C9
  14e6  AD9FFE1A       JSR [0xfe1a]                      
  14ea  3510           PULS  X                           
  14ec  39             RTS                               

; ---- function FUN_M7B_r3_08000__14ed
FUN_M7B_r3_08000__14ed:
  14ed  3476           PSHS  U Y X B A                   
  14ef  FC70FA         LDD 0x70fa                        
  14f2  2709           BEQ 0x14fd                        
  14f4  C30001         ADDD #0x1                         
  14f7  FD70FA         STD 0x70fa                        
  14fa  1600D9         LBRA 0x15d6                       
LAB_M7B_r3_08000__14fd:
  14fd  C30001         ADDD #0x1                         
  1500  FD70FA         STD 0x70fa                        
  1503  CC14D5         LDD #0x14d5                       
  1506  F3600D         ADDD 0x600d                       
  1509  10B36070       CMPD 0x6070                       
  150d  260E           BNE 0x151d                        
  150f  C61A           LDB #0x1a                         
  1511  AD9FFC36       JSR [0xfc36]                      
  1515  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".  "
  1519  2E202000       char[4] ".  "                     
LAB_M7B_r3_08000__151d:
  151d  8E0000         LDX #0x0                          
  1520  108E3F4A       LDY #0x3f4a                       
  1524  17FA0D         LBSR 0x0f34                       
  1527  8E0000         LDX #0x0                          
  152a  108E0000       LDY #0x0                          
  152e  17FA03         LBSR 0x0f34                       
LAB_M7B_r3_08000__1531:
  1531  AD9FFE2A       JSR [0xfe2a]                      
  1535  FC70FA         LDD 0x70fa                        
  1538  10830002       CMPD #0x2                         
  153c  271F           BEQ 0x155d                        
  153e  8E0004         LDX #0x4                          
  1541  108E3F4B       LDY #0x3f4b                       
  1545  17F9EC         LBSR 0x0f34                       
  1548  CC0064         LDD #0x64                         
  154b  AD9FFD20       JSR [0xfd20]                      
  154f  AD9FFD42       JSR [0xfd42]                      
  1553  10837FFF       CMPD #0x7fff                      
  1557  102C0076       LBGE 0x15d1                       
  155b  20D4           BRA 0x1531                        
LAB_M7B_r3_08000__155d:
  155d  8E0000         LDX #0x0                          
  1560  108E3F4A       LDY #0x3f4a                       
  1564  17F9CD         LBSR 0x0f34                       
  1567  8E0000         LDX #0x0                          
  156a  108E0000       LDY #0x0                          
  156e  17F9C3         LBSR 0x0f34                       
  1571  CC14D5         LDD #0x14d5                       
  1574  F3600D         ADDD 0x600d                       
  1577  10B36070       CMPD 0x6070                       
  157b  260E           BNE 0x158b                        
  157d  C61A           LDB #0x1a                         
  157f  AD9FFC36       JSR [0xfc36]                      
  1583  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".. "
  1587  2E2E2000       char[4] ".. "                     
LAB_M7B_r3_08000__158b:
  158b  AD9FFE2A       JSR [0xfe2a]                      
  158f  FC70FA         LDD 0x70fa                        
  1592  10830003       CMPD #0x3                         
  1596  2722           BEQ 0x15ba                        
  1598  8E0004         LDX #0x4                          
  159b  108E3F4B       LDY #0x3f4b                       
  159f  17F992         LBSR 0x0f34                       
  15a2  CC0064         LDD #0x64                         
  15a5  AD9FFD20       JSR [0xfd20]                      
  15a9  AD9FFD42       JSR [0xfd42]                      
  15ad  FD70F8         STD 0x70f8                        
  15b0  10837FFF       CMPD #0x7fff                      
  15b4  102C0019       LBGE 0x15d1                       
  15b8  20D1           BRA 0x158b                        
LAB_M7B_r3_08000__15ba:
  15ba  170115         LBSR 0x16d2                       
  15bd  CC14D5         LDD #0x14d5                       
  15c0  F3600D         ADDD 0x600d                       
  15c3  10B36070       CMPD 0x6070                       
  15c7  2603           BNE 0x15cc                        
  15c9  17FEE5         LBSR 0x14b1                       
LAB_M7B_r3_08000__15cc:
  15cc  17013C         LBSR 0x170b                       
  15cf  2000           BRA 0x15d1                        
LAB_M7B_r3_08000__15d1:
  15d1  4F             CLRA                              
  15d2  5F             CLRB                              
  15d3  FD70FA         STD 0x70fa                        
LAB_M7B_r3_08000__15d6:
  15d6  FC70FA         LDD 0x70fa                        
  15d9  10830003       CMPD #0x3                         
  15dd  2F05           BLE 0x15e4                        
  15df  4F             CLRA                              
  15e0  5F             CLRB                              
  15e1  FD70FA         STD 0x70fa                        
LAB_M7B_r3_08000__15e4:
  15e4  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__15e6
FUN_M7B_r3_08000__15e6:
  15e6  3476           PSHS  U Y X B A                   
  15e8  CC14D5         LDD #0x14d5                       
  15eb  F3600D         ADDD 0x600d                       
  15ee  10B36070       CMPD 0x6070                       
  15f2  10270008       LBEQ 0x15fe                       
  15f6  4F             CLRA                              
  15f7  5F             CLRB                              
  15f8  FD70F6         STD 0x70f6                        
  15fb  160015         LBRA 0x1613                       
LAB_M7B_r3_08000__15fe:
  15fe  FC70F6         LDD 0x70f6                        
  1601  C30001         ADDD #0x1                         
  1604  FD70F6         STD 0x70f6                        
  1607  10830001       CMPD #0x1                         
  160b  2C00           BGE 0x160d                        
LAB_M7B_r3_08000__160d:
  160d  170008         LBSR 0x1618                       
  1610  1700F8         LBSR 0x170b                       
LAB_M7B_r3_08000__1613:
  1613  17FE9B         LBSR 0x14b1                       
  1616  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__1618
FUN_M7B_r3_08000__1618:
  1618  3436           PSHS  Y X B A                     
  161a  C61A           LDB #0x1a                         
  161c  AD9FFC36       JSR [0xfc36]                      
  1620  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".  "
  1624  2E202000       char[4] ".  "                     
LAB_M7B_r3_08000__1628:
  1628  8E0000         LDX #0x0                          
  162b  108E3F4A       LDY #0x3f4a                       
  162f  17F902         LBSR 0x0f34                       
  1632  8E0000         LDX #0x0                          
  1635  108E0000       LDY #0x0                          
  1639  17F8F8         LBSR 0x0f34                       
LAB_M7B_r3_08000__163c:
  163c  AD9FFC1A       JSR [0xfc1a]                      
  1640  5D             TSTB                              
  1641  26F9           BNE 0x163c                        
LAB_M7B_r3_08000__1643:
  1643  AD9FFC1A       JSR [0xfc1a]                      
  1647  C101           CMPB #0x1                         
  1649  2725           BEQ 0x1670                        
  164b  C100           CMPB #0x0                         
  164d  1026007B       LBNE 0x16cc                       
  1651  8E0004         LDX #0x4                          
  1654  108E3F4B       LDY #0x3f4b                       
  1658  17F8D9         LBSR 0x0f34                       
  165b  CC0064         LDD #0x64                         
  165e  AD9FFD20       JSR [0xfd20]                      
  1662  AD9FFD42       JSR [0xfd42]                      
  1666  10837FFF       CMPD #0x7fff                      
  166a  102C0062       LBGE 0x16d0                       
  166e  20D3           BRA 0x1643                        
LAB_M7B_r3_08000__1670:
  1670  8E0000         LDX #0x0                          
  1673  108E3F4A       LDY #0x3f4a                       
  1677  17F8BA         LBSR 0x0f34                       
  167a  8E0000         LDX #0x0                          
  167d  108E0000       LDY #0x0                          
  1681  17F8B0         LBSR 0x0f34                       
  1684  C61A           LDB #0x1a                         
  1686  AD9FFC36       JSR [0xfc36]                      
  168a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: ".. "
  168e  2E2E2000       char[4] ".. "                     
LAB_M7B_r3_08000__1692:
  1692  AD9FFC1A       JSR [0xfc1a]                      
  1696  5D             TSTB                              
  1697  26F9           BNE 0x1692                        
LAB_M7B_r3_08000__1699:
  1699  AD9FFC1A       JSR [0xfc1a]                      
  169d  C101           CMPB #0x1                         
  169f  2726           BEQ 0x16c7                        
  16a1  C100           CMPB #0x0                         
  16a3  10260025       LBNE 0x16cc                       
  16a7  8E0004         LDX #0x4                          
  16aa  108E3F4B       LDY #0x3f4b                       
  16ae  17F883         LBSR 0x0f34                       
  16b1  CC0064         LDD #0x64                         
  16b4  AD9FFD20       JSR [0xfd20]                      
  16b8  AD9FFD42       JSR [0xfd42]                      
  16bc  FD70F8         STD 0x70f8                        
  16bf  10837FFF       CMPD #0x7fff                      
  16c3  2C0B           BGE 0x16d0                        
  16c5  20D2           BRA 0x1699                        
LAB_M7B_r3_08000__16c7:
  16c7  170008         LBSR 0x16d2                       
  16ca  2004           BRA 0x16d0                        
LAB_M7B_r3_08000__16cc:
  16cc  AD9FFEA2       JSR [0xfea2]                      
LAB_M7B_r3_08000__16d0:
  16d0  35B6           PULS  A B X Y PC                  

; ---- function FUN_M7B_r3_08000__16d2
FUN_M7B_r3_08000__16d2:
  16d2  CC50C0         LDD #0x50c0                       
  16d5  3606           PSHU  B A                         
  16d7  FC70F8         LDD 0x70f8                        
  16da  47             ASRA                              
  16db  56             RORB                              
  16dc  47             ASRA                              
  16dd  56             RORB                              
  16de  47             ASRA                              
  16df  56             RORB                              
  16e0  47             ASRA                              
  16e1  56             RORB                              
  16e2  47             ASRA                              
  16e3  56             RORB                              
  16e4  3606           PSHU  B A                         
  16e6  AD9FFCEA       JSR [0xfcea]                      
  16ea  3706           PULU  A B                         
  16ec  FD70D6         STD 0x70d6                        
  16ef  CC001E         LDD #0x1e                         
  16f2  3606           PSHU  B A                         
  16f4  CC00C8         LDD #0xc8                         
  16f7  3606           PSHU  B A                         
  16f9  FC70D6         LDD 0x70d6                        
  16fc  3606           PSHU  B A                         
  16fe  AD9FFCD8       JSR [0xfcd8]                      
  1702  3706           PULU  A B                         
  1704  FD7048         STD 0x7048                        
  1707  FD70FE         STD 0x70fe                        
  170a  39             RTS                               

; ---- function FUN_M7B_r3_08000__170b
FUN_M7B_r3_08000__170b:
  170b  3476           PSHS  U Y X B A                   
  170d  8E148B         LDX #0x148b                       
  1710  AD9FFE76       JSR [0xfe76]                      
  1714  CC09C4         LDD #0x9c4                        
  1717  3606           PSHU  B A                         
  1719  FC70FE         LDD 0x70fe                        
  171c  3606           PSHU  B A                         
  171e  AD9FFCEA       JSR [0xfcea]                      
  1722  3706           PULU  A B                         
  1724  FD70F2         STD 0x70f2                        
  1727  3706           PULU  A B                         
  1729  FD70F4         STD 0x70f4                        
  172c  170A38         LBSR 0x2167                       
  172f  170ADC         LBSR 0x220e                       
  1732  170421         LBSR 0x1b56                       
  1735  1704C5         LBSR 0x1bfd                       
  1738  1713C4         LBSR 0x2aff                       
  173b  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__17a8_M7B_r3_08000__173d:
  173d  17A8           addr M7B_r3_08000::17a8           
  173f  1787           addr M7B_r3_08000::1787           
  1741  .db 17 7B 70 4C 71 00 00 00 71 02 3F E9 40 F3 21 FF  ; .{pLq...q.?.@.!.
  1751  .db 9C 00 64 00 01 00 05 1D 17 93 00 00 00 00 00 00  ; ..d.............
  1761  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1763
FUN_M7B_r3_08000__1763:
  1763  3410           PSHS  X                           
  1765  8E173D         LDX #0x173d                        ; desc[API_FE6A]: ->$17A8 ->$1787
  1768  AD9FFE6A       JSR [0xfe6a]                      
  176c  3510           PULS  X                           
  176e  39             RTS                               

; ---- function FUN_M7B_r3_08000__176f
FUN_M7B_r3_08000__176f:
  176f  3410           PSHS  X                           
  1771  8E173D         LDX #0x173d                        ; desc[API_FDBC]: ->$17A8 ->$1787
  1774  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...="
  1778  3510           PULS  X                           
  177a  39             RTS                               

; ---- function FUN_M7B_r3_08000__177b
FUN_M7B_r3_08000__177b:
  177b  3410           PSHS  X                           
  177d  8E173D         LDX #0x173d                        ; desc[API_FE6C]: ->$17A8 ->$1787
  1780  AD9FFE6C       JSR [0xfe6c]                      
  1784  3510           PULS  X                           
  1786  39             RTS                               

; ---- function FUN_M7B_r3_08000__1787
FUN_M7B_r3_08000__1787:
  1787  3410           PSHS  X                           
  1789  8E173D         LDX #0x173d                        ; desc[API_FE6E]: ->$17A8 ->$1787
  178c  AD9FFE6E       JSR [0xfe6e]                      
  1790  3510           PULS  X                           
  1792  39             RTS                               
  1793  .db 14 64 65 74 75 6E 65 20 31 3A 20 20 20 20 20 20  ; .detune 1:      
  17a3  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M7B_r3_08000__17a8
FUN_M7B_r3_08000__17a8:
  17a8  3476           PSHS  U Y X B A                   
  17aa  8E173D         LDX #0x173d                       
  17ad  AD9FFE76       JSR [0xfe76]                      
  17b1  FC7102         LDD 0x7102                        
  17b4  3606           PSHU  B A                         
  17b6  170014         LBSR 0x17cd                       
  17b9  3706           PULU  A B                         
  17bb  FD711C         STD 0x711c                        
  17be  BE711C         LDX 0x711c                        
  17c1  108E3F60       LDY #0x3f60                       
  17c5  17F76C         LBSR 0x0f34                       
  17c8  1701F6         LBSR 0x19c1                       
  17cb  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__17cd
FUN_M7B_r3_08000__17cd:
  17cd  CC0064         LDD #0x64                         
  17d0  3606           PSHU  B A                         
  17d2  AD9FFCE6       JSR [0xfce6]                      
  17d6  335E           LEAU -0x2,U                       
  17d8  1724EF         LBSR 0x3cca                       
  17db  3706           PULU  A B                         
  17dd  FD70D8         STD 0x70d8                        
  17e0  CC03E8         LDD #0x3e8                        
  17e3  B370D8         SUBD 0x70d8                       
  17e6  FD70D6         STD 0x70d6                        
  17e9  47             ASRA                              
  17ea  56             RORB                              
  17eb  47             ASRA                              
  17ec  56             RORB                              
  17ed  F370D6         ADDD 0x70d6                       
  17f0  3606           PSHU  B A                         
  17f2  AD9FFEC8       JSR [0xfec8]                      
  17f6  39             RTS                               
PTR_FUN_M7B_r3_08000__1862_M7B_r3_08000__17f7:
  17f7  1862           addr M7B_r3_08000::1862           
  17f9  1841           addr M7B_r3_08000::1841           
  17fb  .db 18 35 70 4E 71 04 00 00 71 06 3F E9 40 F5 22 FF  ; .5pNq...q.?.@.".
  180b  .db 9C 00 64 00 01 00 05 1D 18 4D 00 00 00 00 00 00  ; ..d......M......
  181b  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__181d
FUN_M7B_r3_08000__181d:
  181d  3410           PSHS  X                           
  181f  8E17F7         LDX #0x17f7                        ; desc[API_FE6A]: ->$1862 ->$1841
  1822  AD9FFE6A       JSR [0xfe6a]                      
  1826  3510           PULS  X                           
  1828  39             RTS                               

; ---- function FUN_M7B_r3_08000__1829
FUN_M7B_r3_08000__1829:
  1829  3410           PSHS  X                           
  182b  8E17F7         LDX #0x17f7                        ; desc[API_FDBC]: ->$1862 ->$1841
  182e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1832  3510           PULS  X                           
  1834  39             RTS                               

; ---- function FUN_M7B_r3_08000__1835
FUN_M7B_r3_08000__1835:
  1835  3410           PSHS  X                           
  1837  8E17F7         LDX #0x17f7                        ; desc[API_FE6C]: ->$1862 ->$1841
  183a  AD9FFE6C       JSR [0xfe6c]                      
  183e  3510           PULS  X                           
  1840  39             RTS                               

; ---- function FUN_M7B_r3_08000__1841
FUN_M7B_r3_08000__1841:
  1841  3410           PSHS  X                           
  1843  8E17F7         LDX #0x17f7                        ; desc[API_FE6E]: ->$1862 ->$1841
  1846  AD9FFE6E       JSR [0xfe6e]                      
  184a  3510           PULS  X                           
  184c  39             RTS                               
  184d  .db 14 64 65 74 75 6E 65 20 32 3A 20 20 20 20 20 20  ; .detune 2:      
  185d  .db 63 65 6E 74 73                                   ; cents

; ---- function FUN_M7B_r3_08000__1862
FUN_M7B_r3_08000__1862:
  1862  3476           PSHS  U Y X B A                   
  1864  8E17F7         LDX #0x17f7                       
  1867  AD9FFE76       JSR [0xfe76]                      
  186b  FC7106         LDD 0x7106                        
  186e  3606           PSHU  B A                         
  1870  17FF5A         LBSR 0x17cd                       
  1873  3706           PULU  A B                         
  1875  FD7132         STD 0x7132                        
  1878  BE7132         LDX 0x7132                        
  187b  108E3F66       LDY #0x3f66                       
  187f  17F6B2         LBSR 0x0f34                       
  1882  170171         LBSR 0x19f6                       
  1885  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1903_M7B_r3_08000__1887:
  1887  1903           addr M7B_r3_08000::1903           
  1889  18D1           addr M7B_r3_08000::18d1           
  188b  .db 18 C5 70 50 71 08 00 00 71 0A 3F E9 40 F7 23 00  ; ..pPq...q.?.@.#.
  189b  .db 00 02 BC 00 01 00 03 22 18 DD 00 00 00 00 00 00  ; ......."........
  18ab  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__18ad
FUN_M7B_r3_08000__18ad:
  18ad  3410           PSHS  X                           
  18af  8E1887         LDX #0x1887                        ; desc[API_FE6A]: ->$1903 ->$18D1
  18b2  AD9FFE6A       JSR [0xfe6a]                      
  18b6  3510           PULS  X                           
  18b8  39             RTS                               

; ---- function FUN_M7B_r3_08000__18b9
FUN_M7B_r3_08000__18b9:
  18b9  3410           PSHS  X                           
  18bb  8E1887         LDX #0x1887                        ; desc[API_FDBC]: ->$1903 ->$18D1
  18be  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  18c2  3510           PULS  X                           
  18c4  39             RTS                               

; ---- function FUN_M7B_r3_08000__18c5
FUN_M7B_r3_08000__18c5:
  18c5  3410           PSHS  X                           
  18c7  8E1887         LDX #0x1887                        ; desc[API_FE6C]: ->$1903 ->$18D1
  18ca  AD9FFE6C       JSR [0xfe6c]                      
  18ce  3510           PULS  X                           
  18d0  39             RTS                               

; ---- function FUN_M7B_r3_08000__18d1
FUN_M7B_r3_08000__18d1:
  18d1  3410           PSHS  X                           
  18d3  8E1887         LDX #0x1887                        ; desc[API_FE6E]: ->$1903 ->$18D1
  18d6  AD9FFE6E       JSR [0xfe6e]                      
  18da  3510           PULS  X                           
  18dc  39             RTS                               
  18dd  .db 14 64 65 74 75 6E 65 31 20 64 65 6C 61 79 3A 20  ; .detune1 delay: 
  18ed  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__18f2
FUN_M7B_r3_08000__18f2:
  18f2  3406           PSHS  B A                         
  18f4  17FFB6         LBSR 0x18ad                       
  18f7  FC7116         LDD 0x7116                        
  18fa  FD606C         STD 0x606c                        
  18fd  AD9FFC14       JSR [0xfc14]                      
  1901  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__1903
FUN_M7B_r3_08000__1903:
  1903  3476           PSHS  U Y X B A                   
  1905  4F             CLRA                              
  1906  5F             CLRB                              
  1907  3606           PSHU  B A                         
  1909  FC7116         LDD 0x7116                        
  190c  3606           PSHU  B A                         
  190e  FC7050         LDD 0x7050                        
  1911  F37108         ADDD 0x7108                       
  1914  3606           PSHU  B A                         
  1916  AD9FFCD8       JSR [0xfcd8]                      
  191a  3706           PULU  A B                         
  191c  FD710A         STD 0x710a                        
  191f  17009F         LBSR 0x19c1                       
  1922  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__19a0_M7B_r3_08000__1924:
  1924  19A0           addr M7B_r3_08000::19a0           
  1926  196E           addr M7B_r3_08000::196e           
  1928  .db 19 62 70 52 71 0C 00 00 71 0E 3F E9 40 F9 24 00  ; .bpRq...q.?.@.$.
  1938  .db 00 02 BC 00 01 00 03 22 19 7A 00 00 00 00 00 00  ; .......".z......
  1948  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__194a
FUN_M7B_r3_08000__194a:
  194a  3410           PSHS  X                           
  194c  8E1924         LDX #0x1924                        ; desc[API_FE6A]: ->$19A0 ->$196E
  194f  AD9FFE6A       JSR [0xfe6a]                      
  1953  3510           PULS  X                           
  1955  39             RTS                               

; ---- function FUN_M7B_r3_08000__1956
FUN_M7B_r3_08000__1956:
  1956  3410           PSHS  X                           
  1958  8E1924         LDX #0x1924                        ; desc[API_FDBC]: ->$19A0 ->$196E
  195b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...$"
  195f  3510           PULS  X                           
  1961  39             RTS                               

; ---- function FUN_M7B_r3_08000__1962
FUN_M7B_r3_08000__1962:
  1962  3410           PSHS  X                           
  1964  8E1924         LDX #0x1924                        ; desc[API_FE6C]: ->$19A0 ->$196E
  1967  AD9FFE6C       JSR [0xfe6c]                      
  196b  3510           PULS  X                           
  196d  39             RTS                               

; ---- function FUN_M7B_r3_08000__196e
FUN_M7B_r3_08000__196e:
  196e  3410           PSHS  X                           
  1970  8E1924         LDX #0x1924                        ; desc[API_FE6E]: ->$19A0 ->$196E
  1973  AD9FFE6E       JSR [0xfe6e]                      
  1977  3510           PULS  X                           
  1979  39             RTS                               
  197a  .db 14 64 65 74 75 6E 65 32 20 64 65 6C 61 79 3A 20  ; .detune2 delay: 
  198a  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__198f
FUN_M7B_r3_08000__198f:
  198f  3406           PSHS  B A                         
  1991  17FFB6         LBSR 0x194a                       
  1994  FC7116         LDD 0x7116                        
  1997  FD606C         STD 0x606c                        
  199a  AD9FFC14       JSR [0xfc14]                      
  199e  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__19a0
FUN_M7B_r3_08000__19a0:
  19a0  3476           PSHS  U Y X B A                   
  19a2  4F             CLRA                              
  19a3  5F             CLRB                              
  19a4  3606           PSHU  B A                         
  19a6  FC7116         LDD 0x7116                        
  19a9  3606           PSHU  B A                         
  19ab  FC7052         LDD 0x7052                        
  19ae  F3710C         ADDD 0x710c                       
  19b1  3606           PSHU  B A                         
  19b3  AD9FFCD8       JSR [0xfcd8]                      
  19b7  3706           PULU  A B                         
  19b9  FD710E         STD 0x710e                        
  19bc  170037         LBSR 0x19f6                       
  19bf  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__19c1
FUN_M7B_r3_08000__19c1:
  19c1  3476           PSHS  U Y X B A                   
  19c3  8E7118         LDX #0x7118                       
  19c6  FC710A         LDD 0x710a                        
  19c9  17005F         LBSR 0x1a2b                       
  19cc  BE7118         LDX 0x7118                        
  19cf  108E3F61       LDY #0x3f61                       
  19d3  17F55E         LBSR 0x0f34                       
  19d6  BE711A         LDX 0x711a                        
  19d9  108E3F62       LDY #0x3f62                       
  19dd  17F554         LBSR 0x0f34                       
  19e0  BE712C         LDX 0x712c                        
  19e3  108E3F64       LDY #0x3f64                       
  19e7  17F54A         LBSR 0x0f34                       
  19ea  BE7128         LDX 0x7128                        
  19ed  108E3F63       LDY #0x3f63                       
  19f1  17F540         LBSR 0x0f34                       
  19f4  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__19f6
FUN_M7B_r3_08000__19f6:
  19f6  3476           PSHS  U Y X B A                   
  19f8  8E712E         LDX #0x712e                       
  19fb  FC710E         LDD 0x710e                        
  19fe  17002A         LBSR 0x1a2b                       
  1a01  BE712E         LDX 0x712e                        
  1a04  108E3F67       LDY #0x3f67                       
  1a08  17F529         LBSR 0x0f34                       
  1a0b  BE7130         LDX 0x7130                        
  1a0e  108E3F68       LDY #0x3f68                       
  1a12  17F51F         LBSR 0x0f34                       
  1a15  BE7142         LDX 0x7142                        
  1a18  108E3F6A       LDY #0x3f6a                       
  1a1c  17F515         LBSR 0x0f34                       
  1a1f  BE713E         LDX 0x713e                        
  1a22  108E3F69       LDY #0x3f69                       
  1a26  17F50B         LBSR 0x0f34                       
  1a29  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__1a2b
FUN_M7B_r3_08000__1a2b:
  1a2b  3476           PSHS  U Y X B A                   
  1a2d  2603           BNE 0x1a32                        
  1a2f  CC0001         LDD #0x1                          
LAB_M7B_r3_08000__1a32:
  1a32  3606           PSHU  B A                         
  1a34  AD9FFECA       JSR [0xfeca]                      
  1a38  3706           PULU  A B                         
  1a3a  ED84           STD ,X                            
  1a3c  E38812         ADDD 0x12,X                       
  1a3f  ED02           STD 0x2,X                         
  1a41  2F06           BLE 0x1a49                        
  1a43  10B37110       CMPD 0x7110                       
  1a47  2F0E           BLE 0x1a57                        
LAB_M7B_r3_08000__1a49:
  1a49  FC7110         LDD 0x7110                        
  1a4c  ED02           STD 0x2,X                         
  1a4e  EC02           LDD 0x2,X                         
  1a50  A384           SUBD ,X                           
  1a52  ED8814         STD 0x14,X                        
  1a55  2006           BRA 0x1a5d                        
LAB_M7B_r3_08000__1a57:
  1a57  EC8812         LDD 0x12,X                        
  1a5a  ED8814         STD 0x14,X                        
LAB_M7B_r3_08000__1a5d:
  1a5d  EC84           LDD ,X                            
  1a5f  10A38814       CMPD 0x14,X                       
  1a63  2D03           BLT 0x1a68                        
  1a65  EC8814         LDD 0x14,X                        
LAB_M7B_r3_08000__1a68:
  1a68  ED0A           STD 0xa,X                         
  1a6a  FC7112         LDD 0x7112                        
  1a6d  A302           SUBD 0x2,X                        
  1a6f  10A30A         CMPD 0xa,X                        
  1a72  2E02           BGT 0x1a76                        
  1a74  ED0A           STD 0xa,X                         
LAB_M7B_r3_08000__1a76:
  1a76  170002         LBSR 0x1a7b                       
  1a79  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__1a7b
FUN_M7B_r3_08000__1a7b:
  1a7b  3476           PSHS  U Y X B A                   
  1a7d  EC06           LDD 0x6,X                         
  1a7f  3606           PSHU  B A                         
  1a81  AD9FFCC8       JSR [0xfcc8]                      
  1a85  EC04           LDD 0x4,X                         
  1a87  3606           PSHU  B A                         
  1a89  AD9FFCC8       JSR [0xfcc8]                      
  1a8d  AD9FFCE2       JSR [0xfce2]                      
  1a91  3706           PULU  A B                         
  1a93  ED08           STD 0x8,X                         
  1a95  EC08           LDD 0x8,X                         
  1a97  2606           BNE 0x1a9f                        
  1a99  4F             CLRA                              
  1a9a  5F             CLRB                              
  1a9b  ED0C           STD 0xc,X                         
  1a9d  203E           BRA 0x1add                        
LAB_M7B_r3_08000__1a9f:
  1a9f  EC08           LDD 0x8,X                         
  1aa1  10830400       CMPD #0x400                       
  1aa5  2D1C           BLT 0x1ac3                        
  1aa7  58             LSLB                              
  1aa8  49             ROLA                              
  1aa9  58             LSLB                              
  1aaa  49             ROLA                              
  1aab  3606           PSHU  B A                         
  1aad  EC0A           LDD 0xa,X                         
  1aaf  3606           PSHU  B A                         
  1ab1  AD9FFCEA       JSR [0xfcea]                      
  1ab5  3706           PULU  A B                         
  1ab7  58             LSLB                              
  1ab8  49             ROLA                              
  1ab9  58             LSLB                              
  1aba  49             ROLA                              
  1abb  58             LSLB                              
  1abc  49             ROLA                              
  1abd  58             LSLB                              
  1abe  49             ROLA                              
  1abf  ED0C           STD 0xc,X                         
  1ac1  201A           BRA 0x1add                        
LAB_M7B_r3_08000__1ac3:
  1ac3  58             LSLB                              
  1ac4  49             ROLA                              
  1ac5  58             LSLB                              
  1ac6  49             ROLA                              
  1ac7  58             LSLB                              
  1ac8  49             ROLA                              
  1ac9  58             LSLB                              
  1aca  49             ROLA                              
  1acb  58             LSLB                              
  1acc  49             ROLA                              
  1acd  3606           PSHU  B A                         
  1acf  EC0A           LDD 0xa,X                         
  1ad1  3606           PSHU  B A                         
  1ad3  AD9FFCEA       JSR [0xfcea]                      
  1ad7  3706           PULU  A B                         
  1ad9  58             LSLB                              
  1ada  49             ROLA                              
  1adb  ED0C           STD 0xc,X                         
LAB_M7B_r3_08000__1add:
  1add  EC0E           LDD 0xe,X                         
  1adf  10A30C         CMPD 0xc,X                        
  1ae2  2C02           BGE 0x1ae6                        
  1ae4  EC0C           LDD 0xc,X                         
LAB_M7B_r3_08000__1ae6:
  1ae6  ED8810         STD 0x10,X                        
  1ae9  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1b56_M7B_r3_08000__1aeb:
  1aeb  1B56           addr M7B_r3_08000::1b56           
  1aed  1B35           addr M7B_r3_08000::1b35           
  1aef  .db 1B 29 70 54 71 44 00 00 71 46 3F E9 40 FB 25 00  ; .)pTqD..qF?.@.%.
  1aff  .db 00 00 60 00 01 00 02 22 1B 41 00 00 00 00 00 00  ; ..`....".A......
  1b0f  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1b11
FUN_M7B_r3_08000__1b11:
  1b11  3410           PSHS  X                           
  1b13  8E1AEB         LDX #0x1aeb                        ; desc[API_FE6A]: ->$1B56 ->$1B35
  1b16  AD9FFE6A       JSR [0xfe6a]                      
  1b1a  3510           PULS  X                           
  1b1c  39             RTS                               

; ---- function FUN_M7B_r3_08000__1b1d
FUN_M7B_r3_08000__1b1d:
  1b1d  3410           PSHS  X                           
  1b1f  8E1AEB         LDX #0x1aeb                        ; desc[API_FDBC]: ->$1B56 ->$1B35
  1b22  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1b26  3510           PULS  X                           
  1b28  39             RTS                               

; ---- function FUN_M7B_r3_08000__1b29
FUN_M7B_r3_08000__1b29:
  1b29  3410           PSHS  X                           
  1b2b  8E1AEB         LDX #0x1aeb                        ; desc[API_FE6C]: ->$1B56 ->$1B35
  1b2e  AD9FFE6C       JSR [0xfe6c]                      
  1b32  3510           PULS  X                           
  1b34  39             RTS                               

; ---- function FUN_M7B_r3_08000__1b35
FUN_M7B_r3_08000__1b35:
  1b35  3410           PSHS  X                           
  1b37  8E1AEB         LDX #0x1aeb                        ; desc[API_FE6E]: ->$1B56 ->$1B35
  1b3a  AD9FFE6E       JSR [0xfe6e]                      
  1b3e  3510           PULS  X                           
  1b40  39             RTS                               
  1b41  .db 14 64 74 75 6E 65 31 20 62 65 61 74 73 3A 20 20  ; .dtune1 beats:  
  1b51  .db 20 2F 32 34 20                                   ;  /24 

; ---- function FUN_M7B_r3_08000__1b56
FUN_M7B_r3_08000__1b56:
  1b56  3476           PSHS  U Y X B A                   
  1b58  8E1AEB         LDX #0x1aeb                       
  1b5b  AD9FFE76       JSR [0xfe76]                      
  1b5f  FC70F4         LDD 0x70f4                        
  1b62  3606           PSHU  B A                         
  1b64  FC7146         LDD 0x7146                        
  1b67  3606           PSHU  B A                         
  1b69  AD9FFCEE       JSR [0xfcee]                      
  1b6d  FC70FE         LDD 0x70fe                        
  1b70  3606           PSHU  B A                         
  1b72  AD9FFCEA       JSR [0xfcea]                      
  1b76  FC70F2         LDD 0x70f2                        
  1b79  3606           PSHU  B A                         
  1b7b  FC7146         LDD 0x7146                        
  1b7e  3606           PSHU  B A                         
  1b80  AD9FFCEE       JSR [0xfcee]                      
  1b84  AD9FFCE2       JSR [0xfce2]                      
  1b88  3706           PULU  A B                         
  1b8a  FD7108         STD 0x7108                        
  1b8d  17FD73         LBSR 0x1903                       
  1b90  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1bfd_M7B_r3_08000__1b92:
  1b92  1BFD           addr M7B_r3_08000::1bfd           
  1b94  1BDC           addr M7B_r3_08000::1bdc           
  1b96  .db 1B D0 70 56 71 48 00 00 71 4A 3F E9 40 FD 26 00  ; ..pVqH..qJ?.@.&.
  1ba6  .db 00 00 60 00 01 00 02 22 1B E8 00 00 00 00 00 00  ; ..`...."........
  1bb6  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1bb8
FUN_M7B_r3_08000__1bb8:
  1bb8  3410           PSHS  X                           
  1bba  8E1B92         LDX #0x1b92                        ; desc[API_FE6A]: ->$1BFD ->$1BDC
  1bbd  AD9FFE6A       JSR [0xfe6a]                      
  1bc1  3510           PULS  X                           
  1bc3  39             RTS                               

; ---- function FUN_M7B_r3_08000__1bc4
FUN_M7B_r3_08000__1bc4:
  1bc4  3410           PSHS  X                           
  1bc6  8E1B92         LDX #0x1b92                        ; desc[API_FDBC]: ->$1BFD ->$1BDC
  1bc9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1bcd  3510           PULS  X                           
  1bcf  39             RTS                               

; ---- function FUN_M7B_r3_08000__1bd0
FUN_M7B_r3_08000__1bd0:
  1bd0  3410           PSHS  X                           
  1bd2  8E1B92         LDX #0x1b92                        ; desc[API_FE6C]: ->$1BFD ->$1BDC
  1bd5  AD9FFE6C       JSR [0xfe6c]                      
  1bd9  3510           PULS  X                           
  1bdb  39             RTS                               

; ---- function FUN_M7B_r3_08000__1bdc
FUN_M7B_r3_08000__1bdc:
  1bdc  3410           PSHS  X                           
  1bde  8E1B92         LDX #0x1b92                        ; desc[API_FE6E]: ->$1BFD ->$1BDC
  1be1  AD9FFE6E       JSR [0xfe6e]                      
  1be5  3510           PULS  X                           
  1be7  39             RTS                               
  1be8  .db 14 64 74 75 6E 65 32 20 62 65 61 74 73 3A 20 20  ; .dtune2 beats:  
  1bf8  .db 20 2F 32 34 20                                   ;  /24 

; ---- function FUN_M7B_r3_08000__1bfd
FUN_M7B_r3_08000__1bfd:
  1bfd  3476           PSHS  U Y X B A                   
  1bff  8E1B92         LDX #0x1b92                       
  1c02  AD9FFE76       JSR [0xfe76]                      
  1c06  FC70F4         LDD 0x70f4                        
  1c09  3606           PSHU  B A                         
  1c0b  FC714A         LDD 0x714a                        
  1c0e  3606           PSHU  B A                         
  1c10  AD9FFCEE       JSR [0xfcee]                      
  1c14  FC70FE         LDD 0x70fe                        
  1c17  3606           PSHU  B A                         
  1c19  AD9FFCEA       JSR [0xfcea]                      
  1c1d  FC70F2         LDD 0x70f2                        
  1c20  3606           PSHU  B A                         
  1c22  FC714A         LDD 0x714a                        
  1c25  3606           PSHU  B A                         
  1c27  AD9FFCEE       JSR [0xfcee]                      
  1c2b  AD9FFCE2       JSR [0xfce2]                      
  1c2f  3706           PULU  A B                         
  1c31  FD710C         STD 0x710c                        
  1c34  17FD69         LBSR 0x19a0                       
  1c37  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1ca4_M7B_r3_08000__1c39:
  1c39  1CA4           addr M7B_r3_08000::1ca4           
  1c3b  1C83           addr M7B_r3_08000::1c83           
  1c3d  .db 1C 77 70 58 71 4C 00 00 71 4E 3F E9 40 FF 27 FB  ; .wpXqL..qN?.@.'.
  1c4d  .db 50 04 B0 00 01 00 05 1F 1C 8F 00 00 00 00 00 00  ; P...............
  1c5d  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1c5f
FUN_M7B_r3_08000__1c5f:
  1c5f  3410           PSHS  X                           
  1c61  8E1C39         LDX #0x1c39                        ; desc[API_FE6A]: ->$1CA4 ->$1C83
  1c64  AD9FFE6A       JSR [0xfe6a]                      
  1c68  3510           PULS  X                           
  1c6a  39             RTS                               

; ---- function FUN_M7B_r3_08000__1c6b
FUN_M7B_r3_08000__1c6b:
  1c6b  3410           PSHS  X                           
  1c6d  8E1C39         LDX #0x1c39                        ; desc[API_FDBC]: ->$1CA4 ->$1C83
  1c70  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...9"
  1c74  3510           PULS  X                           
  1c76  39             RTS                               

; ---- function FUN_M7B_r3_08000__1c77
FUN_M7B_r3_08000__1c77:
  1c77  3410           PSHS  X                           
  1c79  8E1C39         LDX #0x1c39                        ; desc[API_FE6C]: ->$1CA4 ->$1C83
  1c7c  AD9FFE6C       JSR [0xfe6c]                      
  1c80  3510           PULS  X                           
  1c82  39             RTS                               

; ---- function FUN_M7B_r3_08000__1c83
FUN_M7B_r3_08000__1c83:
  1c83  3410           PSHS  X                           
  1c85  8E1C39         LDX #0x1c39                        ; desc[API_FE6E]: ->$1CA4 ->$1C83
  1c88  AD9FFE6E       JSR [0xfe6e]                      
  1c8c  3510           PULS  X                           
  1c8e  39             RTS                               
  1c8f  .db 14 64 65 74 75 6E 65 31 6D 6F 64 3A 20 20 20 20  ; .detune1mod:    
  1c9f  .db 20 63 6E 74 73                                   ;  cnts

; ---- function FUN_M7B_r3_08000__1ca4
FUN_M7B_r3_08000__1ca4:
  1ca4  3476           PSHS  U Y X B A                   
  1ca6  8E1C39         LDX #0x1c39                       
  1ca9  AD9FFE76       JSR [0xfe76]                      
  1cad  FC714E         LDD 0x714e                        
  1cb0  3606           PSHU  B A                         
  1cb2  17FB18         LBSR 0x17cd                       
  1cb5  3706           PULU  A B                         
  1cb7  FD711E         STD 0x711e                        
  1cba  BE711E         LDX 0x711e                        
  1cbd  108E3F65       LDY #0x3f65                       
  1cc1  17F270         LBSR 0x0f34                       
  1cc4  17FCFA         LBSR 0x19c1                       
  1cc7  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1d34_M7B_r3_08000__1cc9:
  1cc9  1D34           addr M7B_r3_08000::1d34           
  1ccb  1D13           addr M7B_r3_08000::1d13           
  1ccd  .db 1D 07 70 5A 71 50 00 00 71 52 3F E9 41 01 28 FB  ; ..pZqP..qR?.A.(.
  1cdd  .db 50 04 B0 00 01 00 05 1F 1D 1F 00 00 00 00 00 00  ; P...............
  1ced  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1cef
FUN_M7B_r3_08000__1cef:
  1cef  3410           PSHS  X                           
  1cf1  8E1CC9         LDX #0x1cc9                        ; desc[API_FE6A]: ->$1D34 ->$1D13
  1cf4  AD9FFE6A       JSR [0xfe6a]                      
  1cf8  3510           PULS  X                           
  1cfa  39             RTS                               

; ---- function FUN_M7B_r3_08000__1cfb
FUN_M7B_r3_08000__1cfb:
  1cfb  3410           PSHS  X                           
  1cfd  8E1CC9         LDX #0x1cc9                        ; desc[API_FDBC]: ->$1D34 ->$1D13
  1d00  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1d04  3510           PULS  X                           
  1d06  39             RTS                               

; ---- function FUN_M7B_r3_08000__1d07
FUN_M7B_r3_08000__1d07:
  1d07  3410           PSHS  X                           
  1d09  8E1CC9         LDX #0x1cc9                        ; desc[API_FE6C]: ->$1D34 ->$1D13
  1d0c  AD9FFE6C       JSR [0xfe6c]                      
  1d10  3510           PULS  X                           
  1d12  39             RTS                               

; ---- function FUN_M7B_r3_08000__1d13
FUN_M7B_r3_08000__1d13:
  1d13  3410           PSHS  X                           
  1d15  8E1CC9         LDX #0x1cc9                        ; desc[API_FE6E]: ->$1D34 ->$1D13
  1d18  AD9FFE6E       JSR [0xfe6e]                      
  1d1c  3510           PULS  X                           
  1d1e  39             RTS                               
  1d1f  .db 14 64 65 74 75 6E 65 32 6D 6F 64 3A 20 20 20 20  ; .detune2mod:    
  1d2f  .db 20 63 6E 74 73                                   ;  cnts

; ---- function FUN_M7B_r3_08000__1d34
FUN_M7B_r3_08000__1d34:
  1d34  3476           PSHS  U Y X B A                   
  1d36  8E1CC9         LDX #0x1cc9                       
  1d39  AD9FFE76       JSR [0xfe76]                      
  1d3d  FC7152         LDD 0x7152                        
  1d40  3606           PSHU  B A                         
  1d42  17FA88         LBSR 0x17cd                       
  1d45  3706           PULU  A B                         
  1d47  FD7134         STD 0x7134                        
  1d4a  BE7134         LDX 0x7134                        
  1d4d  108E3F6B       LDY #0x3f6b                       
  1d51  17F1E0         LBSR 0x0f34                       
  1d54  17FC9F         LBSR 0x19f6                       
  1d57  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1dc4_M7B_r3_08000__1d59:
  1d59  1DC4           addr M7B_r3_08000::1dc4           
  1d5b  1DA3           addr M7B_r3_08000::1da3           
  1d5d  .db 1D 97 70 5C 71 54 00 00 71 56 3F E9 41 07 29 00  ; ..p\qT..qV?.A.).
  1d6d  .db 01 03 E8 00 01 00 04 21 1D AF 00 00 00 00 00 00  ; .......!........
  1d7d  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1d7f
FUN_M7B_r3_08000__1d7f:
  1d7f  3410           PSHS  X                           
  1d81  8E1D59         LDX #0x1d59                        ; desc[API_FE6A]: ->$1DC4 ->$1DA3
  1d84  AD9FFE6A       JSR [0xfe6a]                      
  1d88  3510           PULS  X                           
  1d8a  39             RTS                               

; ---- function FUN_M7B_r3_08000__1d8b
FUN_M7B_r3_08000__1d8b:
  1d8b  3410           PSHS  X                           
  1d8d  8E1D59         LDX #0x1d59                        ; desc[API_FDBC]: ->$1DC4 ->$1DA3
  1d90  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...Y"
  1d94  3510           PULS  X                           
  1d96  39             RTS                               

; ---- function FUN_M7B_r3_08000__1d97
FUN_M7B_r3_08000__1d97:
  1d97  3410           PSHS  X                           
  1d99  8E1D59         LDX #0x1d59                        ; desc[API_FE6C]: ->$1DC4 ->$1DA3
  1d9c  AD9FFE6C       JSR [0xfe6c]                      
  1da0  3510           PULS  X                           
  1da2  39             RTS                               

; ---- function FUN_M7B_r3_08000__1da3
FUN_M7B_r3_08000__1da3:
  1da3  3410           PSHS  X                           
  1da5  8E1D59         LDX #0x1d59                        ; desc[API_FE6E]: ->$1DC4 ->$1DA3
  1da8  AD9FFE6E       JSR [0xfe6e]                      
  1dac  3510           PULS  X                           
  1dae  39             RTS                               
  1daf  .db 14 66 61 64 65 6C 65 6E 67 74 68 20 31 3A 20 20  ; .fadelength 1:  
  1dbf  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__1dc4
FUN_M7B_r3_08000__1dc4:
  1dc4  3476           PSHS  U Y X B A                   
  1dc6  8E1D59         LDX #0x1d59                       
  1dc9  AD9FFE76       JSR [0xfe76]                      
  1dcd  CC0B9C         LDD #0xb9c                        
  1dd0  3606           PSHU  B A                         
  1dd2  FC7156         LDD 0x7156                        
  1dd5  3606           PSHU  B A                         
  1dd7  AD9FFCEA       JSR [0xfcea]                      
  1ddb  3706           PULU  A B                         
  1ddd  FD7126         STD 0x7126                        
  1de0  17FBDE         LBSR 0x19c1                       
  1de3  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1e50_M7B_r3_08000__1de5:
  1de5  1E50           addr M7B_r3_08000::1e50           
  1de7  1E2F           addr M7B_r3_08000::1e2f           
  1de9  .db 1E 23 70 5E 71 58 00 00 71 5A 3F E9 41 09 2A 00  ; .#p^qX..qZ?.A.*.
  1df9  .db 01 03 E8 00 01 00 04 21 1E 3B 00 00 00 00 00 00  ; .......!.;......
  1e09  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1e0b
FUN_M7B_r3_08000__1e0b:
  1e0b  3410           PSHS  X                           
  1e0d  8E1DE5         LDX #0x1de5                        ; desc[API_FE6A]: ->$1E50 ->$1E2F
  1e10  AD9FFE6A       JSR [0xfe6a]                      
  1e14  3510           PULS  X                           
  1e16  39             RTS                               

; ---- function FUN_M7B_r3_08000__1e17
FUN_M7B_r3_08000__1e17:
  1e17  3410           PSHS  X                           
  1e19  8E1DE5         LDX #0x1de5                        ; desc[API_FDBC]: ->$1E50 ->$1E2F
  1e1c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1e20  3510           PULS  X                           
  1e22  39             RTS                               

; ---- function FUN_M7B_r3_08000__1e23
FUN_M7B_r3_08000__1e23:
  1e23  3410           PSHS  X                           
  1e25  8E1DE5         LDX #0x1de5                        ; desc[API_FE6C]: ->$1E50 ->$1E2F
  1e28  AD9FFE6C       JSR [0xfe6c]                      
  1e2c  3510           PULS  X                           
  1e2e  39             RTS                               

; ---- function FUN_M7B_r3_08000__1e2f
FUN_M7B_r3_08000__1e2f:
  1e2f  3410           PSHS  X                           
  1e31  8E1DE5         LDX #0x1de5                        ; desc[API_FE6E]: ->$1E50 ->$1E2F
  1e34  AD9FFE6E       JSR [0xfe6e]                      
  1e38  3510           PULS  X                           
  1e3a  39             RTS                               
  1e3b  .db 14 66 61 64 65 6C 65 6E 67 74 68 20 32 3A 20 20  ; .fadelength 2:  
  1e4b  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__1e50
FUN_M7B_r3_08000__1e50:
  1e50  3476           PSHS  U Y X B A                   
  1e52  8E1DE5         LDX #0x1de5                       
  1e55  AD9FFE76       JSR [0xfe76]                      
  1e59  CC0B9C         LDD #0xb9c                        
  1e5c  3606           PSHU  B A                         
  1e5e  FC715A         LDD 0x715a                        
  1e61  3606           PSHU  B A                         
  1e63  AD9FFCEA       JSR [0xfcea]                      
  1e67  3706           PULU  A B                         
  1e69  FD713C         STD 0x713c                        
  1e6c  17FB87         LBSR 0x19f6                       
  1e6f  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1edc_M7B_r3_08000__1e71:
  1e71  1EDC           addr M7B_r3_08000::1edc           
  1e73  1EBB           addr M7B_r3_08000::1ebb           
  1e75  .db 1E AF 70 60 71 5C 00 00 71 5E 3F E9 41 03 2B 00  ; ..p`q\..q^?.A.+.
  1e85  .db 01 02 BC 00 01 00 04 22 1E C7 00 00 00 00 00 00  ; ......."........
  1e95  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1e97
FUN_M7B_r3_08000__1e97:
  1e97  3410           PSHS  X                           
  1e99  8E1E71         LDX #0x1e71                        ; desc[API_FE6A]: ->$1EDC ->$1EBB
  1e9c  AD9FFE6A       JSR [0xfe6a]                      
  1ea0  3510           PULS  X                           
  1ea2  39             RTS                               

; ---- function FUN_M7B_r3_08000__1ea3
FUN_M7B_r3_08000__1ea3:
  1ea3  3410           PSHS  X                           
  1ea5  8E1E71         LDX #0x1e71                        ; desc[API_FDBC]: ->$1EDC ->$1EBB
  1ea8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...q"
  1eac  3510           PULS  X                           
  1eae  39             RTS                               

; ---- function FUN_M7B_r3_08000__1eaf
FUN_M7B_r3_08000__1eaf:
  1eaf  3410           PSHS  X                           
  1eb1  8E1E71         LDX #0x1e71                        ; desc[API_FE6C]: ->$1EDC ->$1EBB
  1eb4  AD9FFE6C       JSR [0xfe6c]                      
  1eb8  3510           PULS  X                           
  1eba  39             RTS                               

; ---- function FUN_M7B_r3_08000__1ebb
FUN_M7B_r3_08000__1ebb:
  1ebb  3410           PSHS  X                           
  1ebd  8E1E71         LDX #0x1e71                        ; desc[API_FE6E]: ->$1EDC ->$1EBB
  1ec0  AD9FFE6E       JSR [0xfe6e]                      
  1ec4  3510           PULS  X                           
  1ec6  39             RTS                               
  1ec7  .db 14 73 70 6C 69 63 65 6C 65 6E 67 74 68 31 3A 20  ; .splicelength1: 
  1ed7  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__1edc
FUN_M7B_r3_08000__1edc:
  1edc  3476           PSHS  U Y X B A                   
  1ede  8E1E71         LDX #0x1e71                       
  1ee1  AD9FFE76       JSR [0xfe76]                      
  1ee5  FC715E         LDD 0x715e                        
  1ee8  3606           PSHU  B A                         
  1eea  AD9FFECA       JSR [0xfeca]                      
  1eee  3706           PULU  A B                         
  1ef0  FD712A         STD 0x712a                        
  1ef3  17FACB         LBSR 0x19c1                       
  1ef6  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1f63_M7B_r3_08000__1ef8:
  1ef8  1F63           addr M7B_r3_08000::1f63           
  1efa  1F42           addr M7B_r3_08000::1f42           
  1efc  .db 1F 36 70 62 71 60 00 00 71 62 3F E9 41 05 2C 00  ; .6pbq`..qb?.A.,.
  1f0c  .db 01 02 BC 00 01 00 04 22 1F 4E 00 00 00 00 00 00  ; .......".N......
  1f1c  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1f1e
FUN_M7B_r3_08000__1f1e:
  1f1e  3410           PSHS  X                           
  1f20  8E1EF8         LDX #0x1ef8                        ; desc[API_FE6A]: ->$1F63 ->$1F42
  1f23  AD9FFE6A       JSR [0xfe6a]                      
  1f27  3510           PULS  X                           
  1f29  39             RTS                               

; ---- function FUN_M7B_r3_08000__1f2a
FUN_M7B_r3_08000__1f2a:
  1f2a  3410           PSHS  X                           
  1f2c  8E1EF8         LDX #0x1ef8                        ; desc[API_FDBC]: ->$1F63 ->$1F42
  1f2f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1f33  3510           PULS  X                           
  1f35  39             RTS                               

; ---- function FUN_M7B_r3_08000__1f36
FUN_M7B_r3_08000__1f36:
  1f36  3410           PSHS  X                           
  1f38  8E1EF8         LDX #0x1ef8                        ; desc[API_FE6C]: ->$1F63 ->$1F42
  1f3b  AD9FFE6C       JSR [0xfe6c]                      
  1f3f  3510           PULS  X                           
  1f41  39             RTS                               

; ---- function FUN_M7B_r3_08000__1f42
FUN_M7B_r3_08000__1f42:
  1f42  3410           PSHS  X                           
  1f44  8E1EF8         LDX #0x1ef8                        ; desc[API_FE6E]: ->$1F63 ->$1F42
  1f47  AD9FFE6E       JSR [0xfe6e]                      
  1f4b  3510           PULS  X                           
  1f4d  39             RTS                               
  1f4e  .db 14 73 70 6C 69 63 65 6C 65 6E 67 74 68 32 3A 20  ; .splicelength2: 
  1f5e  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__1f63
FUN_M7B_r3_08000__1f63:
  1f63  3476           PSHS  U Y X B A                   
  1f65  8E1EF8         LDX #0x1ef8                       
  1f68  AD9FFE76       JSR [0xfe76]                      
  1f6c  FC7162         LDD 0x7162                        
  1f6f  3606           PSHU  B A                         
  1f71  AD9FFECA       JSR [0xfeca]                      
  1f75  3706           PULU  A B                         
  1f77  FD7140         STD 0x7140                        
  1f7a  17FA23         LBSR 0x19a0                       
  1f7d  17FA76         LBSR 0x19f6                       
  1f80  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__1ffe_M7B_r3_08000__1f82:
  1f82  1FFE           addr M7B_r3_08000::1ffe           
  1f84  1FCC           addr M7B_r3_08000::1fcc           
  1f86  .db 1F C0 70 64 71 66 00 00 71 68 3F E9 40 84 2F 00  ; ..pdqf..qh?.@./.
  1f96  .db 00 7D 00 00 01 00 05 1D 1F D8 00 00 00 00 00 00  ; .}..............
  1fa6  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__1fa8
FUN_M7B_r3_08000__1fa8:
  1fa8  3410           PSHS  X                           
  1faa  8E1F82         LDX #0x1f82                        ; desc[API_FE6A]: ->$1FFE ->$1FCC
  1fad  AD9FFE6A       JSR [0xfe6a]                      
  1fb1  3510           PULS  X                           
  1fb3  39             RTS                               

; ---- function FUN_M7B_r3_08000__1fb4
FUN_M7B_r3_08000__1fb4:
  1fb4  3410           PSHS  X                           
  1fb6  8E1F82         LDX #0x1f82                        ; desc[API_FDBC]: ->$1FFE ->$1FCC
  1fb9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  1fbd  3510           PULS  X                           
  1fbf  39             RTS                               

; ---- function FUN_M7B_r3_08000__1fc0
FUN_M7B_r3_08000__1fc0:
  1fc0  3410           PSHS  X                           
  1fc2  8E1F82         LDX #0x1f82                        ; desc[API_FE6C]: ->$1FFE ->$1FCC
  1fc5  AD9FFE6C       JSR [0xfe6c]                      
  1fc9  3510           PULS  X                           
  1fcb  39             RTS                               

; ---- function FUN_M7B_r3_08000__1fcc
FUN_M7B_r3_08000__1fcc:
  1fcc  3410           PSHS  X                           
  1fce  8E1F82         LDX #0x1f82                        ; desc[API_FE6E]: ->$1FFE ->$1FCC
  1fd1  AD9FFE6E       JSR [0xfe6e]                      
  1fd5  3510           PULS  X                           
  1fd7  39             RTS                               
  1fd8  .db 14 64 65 6C 61 79 20 31 3A 20 20 20 20 20 20 20  ; .delay 1:       
  1fe8  .db 20 6D 73 20 20                                   ;  ms  

; ---- function FUN_M7B_r3_08000__1fed
FUN_M7B_r3_08000__1fed:
  1fed  3406           PSHS  B A                         
  1fef  17FFB6         LBSR 0x1fa8                       
  1ff2  FC7114         LDD 0x7114                        
  1ff5  FD606C         STD 0x606c                        
  1ff8  AD9FFC14       JSR [0xfc14]                      
  1ffc  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__1ffe
FUN_M7B_r3_08000__1ffe:
  1ffe  3476           PSHS  U Y X B A                   
  2000  4F             CLRA                              
  2001  5F             CLRB                              
  2002  3606           PSHU  B A                         
  2004  FC7114         LDD 0x7114                        
  2007  3606           PSHU  B A                         
  2009  FC7064         LDD 0x7064                        
  200c  F37166         ADDD 0x7166                       
  200f  3606           PSHU  B A                         
  2011  AD9FFCD8       JSR [0xfcd8]                      
  2015  3706           PULU  A B                         
  2017  FD7168         STD 0x7168                        
  201a  FC7168         LDD 0x7168                        
  201d  3606           PSHU  B A                         
  201f  CC5833         LDD #0x5833                       
  2022  3606           PSHU  B A                         
  2024  AD9FFCF2       JSR [0xfcf2]                      
  2028  3706           PULU  A B                         
  202a  FD70D6         STD 0x70d6                        
  202d  FD7164         STD 0x7164                        
  2030  BE70D6         LDX 0x70d6                        
  2033  108E3F58       LDY #0x3f58                       
  2037  17EEFA         LBSR 0x0f34                       
  203a  170733         LBSR 0x2770                       
  203d  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__20bb_M7B_r3_08000__203f:
  203f  20BB           addr M7B_r3_08000::20bb           
  2041  2089           addr M7B_r3_08000::2089           
  2043  .db 20 7D 70 66 71 6C 00 00 71 6E 3F E9 40 86 30 00  ;  }pfql..qn?.@.0.
  2053  .db 00 7D 00 00 01 00 05 1D 20 95 00 00 00 00 00 00  ; .}...... .......
  2063  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2065
FUN_M7B_r3_08000__2065:
  2065  3410           PSHS  X                           
  2067  8E203F         LDX #0x203f                        ; desc[API_FE6A]: ->$20BB ->$2089
  206a  AD9FFE6A       JSR [0xfe6a]                      
  206e  3510           PULS  X                           
  2070  39             RTS                               

; ---- function FUN_M7B_r3_08000__2071
FUN_M7B_r3_08000__2071:
  2071  3410           PSHS  X                           
  2073  8E203F         LDX #0x203f                        ; desc[API_FDBC]: ->$20BB ->$2089
  2076  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.. ?"
  207a  3510           PULS  X                           
  207c  39             RTS                               

; ---- function FUN_M7B_r3_08000__207d
FUN_M7B_r3_08000__207d:
  207d  3410           PSHS  X                           
  207f  8E203F         LDX #0x203f                        ; desc[API_FE6C]: ->$20BB ->$2089
  2082  AD9FFE6C       JSR [0xfe6c]                      
  2086  3510           PULS  X                           
  2088  39             RTS                               

; ---- function FUN_M7B_r3_08000__2089
FUN_M7B_r3_08000__2089:
  2089  3410           PSHS  X                           
  208b  8E203F         LDX #0x203f                        ; desc[API_FE6E]: ->$20BB ->$2089
  208e  AD9FFE6E       JSR [0xfe6e]                      
  2092  3510           PULS  X                           
  2094  39             RTS                               
  2095  .db 14 64 65 6C 61 79 20 32 3A 20 20 20 20 20 20 20  ; .delay 2:       
  20a5  .db 20 6D 73 20 20                                   ;  ms  

; ---- function FUN_M7B_r3_08000__20aa
FUN_M7B_r3_08000__20aa:
  20aa  3406           PSHS  B A                         
  20ac  17FFB6         LBSR 0x2065                       
  20af  FC7114         LDD 0x7114                        
  20b2  FD606C         STD 0x606c                        
  20b5  AD9FFC14       JSR [0xfc14]                      
  20b9  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__20bb
FUN_M7B_r3_08000__20bb:
  20bb  3476           PSHS  U Y X B A                   
  20bd  4F             CLRA                              
  20be  5F             CLRB                              
  20bf  3606           PSHU  B A                         
  20c1  FC7114         LDD 0x7114                        
  20c4  3606           PSHU  B A                         
  20c6  FC7066         LDD 0x7066                        
  20c9  F3716C         ADDD 0x716c                       
  20cc  3606           PSHU  B A                         
  20ce  AD9FFCD8       JSR [0xfcd8]                      
  20d2  3706           PULU  A B                         
  20d4  FD716E         STD 0x716e                        
  20d7  FC716E         LDD 0x716e                        
  20da  3606           PSHU  B A                         
  20dc  CC5833         LDD #0x5833                       
  20df  3606           PSHU  B A                         
  20e1  AD9FFCF2       JSR [0xfcf2]                      
  20e5  3706           PULU  A B                         
  20e7  FD70D6         STD 0x70d6                        
  20ea  FD716A         STD 0x716a                        
  20ed  BE70D6         LDX 0x70d6                        
  20f0  108E3F5C       LDY #0x3f5c                       
  20f4  17EE3D         LBSR 0x0f34                       
  20f7  17072E         LBSR 0x2828                       
  20fa  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2167_M7B_r3_08000__20fc:
  20fc  2167           addr M7B_r3_08000::2167           
  20fe  2146           addr M7B_r3_08000::2146           
  2100  .db 21 3A 70 68 71 70 00 00 71 72 3F E9 40 98 31 00  ; !:phqp..qr?.@.1.
  2110  .db 00 00 60 00 01 00 02 22 21 52 00 00 00 00 00 00  ; ..`...."!R......
  2120  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2122
FUN_M7B_r3_08000__2122:
  2122  3410           PSHS  X                           
  2124  8E20FC         LDX #0x20fc                        ; desc[API_FE6A]: ->$2167 ->$2146
  2127  AD9FFE6A       JSR [0xfe6a]                      
  212b  3510           PULS  X                           
  212d  39             RTS                               

; ---- function FUN_M7B_r3_08000__212e
FUN_M7B_r3_08000__212e:
  212e  3410           PSHS  X                           
  2130  8E20FC         LDX #0x20fc                        ; desc[API_FDBC]: ->$2167 ->$2146
  2133  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.. ."
  2137  3510           PULS  X                           
  2139  39             RTS                               

; ---- function FUN_M7B_r3_08000__213a
FUN_M7B_r3_08000__213a:
  213a  3410           PSHS  X                           
  213c  8E20FC         LDX #0x20fc                        ; desc[API_FE6C]: ->$2167 ->$2146
  213f  AD9FFE6C       JSR [0xfe6c]                      
  2143  3510           PULS  X                           
  2145  39             RTS                               

; ---- function FUN_M7B_r3_08000__2146
FUN_M7B_r3_08000__2146:
  2146  3410           PSHS  X                           
  2148  8E20FC         LDX #0x20fc                        ; desc[API_FE6E]: ->$2167 ->$2146
  214b  AD9FFE6E       JSR [0xfe6e]                      
  214f  3510           PULS  X                           
  2151  39             RTS                               
  2152  .db 14 64 65 6C 61 79 31 20 62 65 61 74 73 3A 20 20  ; .delay1 beats:  
  2162  .db 20 2F 32 34 20                                   ;  /24 

; ---- function FUN_M7B_r3_08000__2167
FUN_M7B_r3_08000__2167:
  2167  3476           PSHS  U Y X B A                   
  2169  8E20FC         LDX #0x20fc                       
  216c  AD9FFE76       JSR [0xfe76]                      
  2170  FC70F4         LDD 0x70f4                        
  2173  3606           PSHU  B A                         
  2175  FC7172         LDD 0x7172                        
  2178  3606           PSHU  B A                         
  217a  AD9FFCEE       JSR [0xfcee]                      
  217e  FC70FE         LDD 0x70fe                        
  2181  3606           PSHU  B A                         
  2183  AD9FFCEA       JSR [0xfcea]                      
  2187  FC70F2         LDD 0x70f2                        
  218a  3606           PSHU  B A                         
  218c  FC7172         LDD 0x7172                        
  218f  3606           PSHU  B A                         
  2191  AD9FFCEE       JSR [0xfcee]                      
  2195  AD9FFCE2       JSR [0xfce2]                      
  2199  3706           PULU  A B                         
  219b  FD7166         STD 0x7166                        
  219e  17FE5D         LBSR 0x1ffe                       
  21a1  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__220e_M7B_r3_08000__21a3:
  21a3  220E           addr M7B_r3_08000::220e           
  21a5  21ED           addr M7B_r3_08000::21ed           
  21a7  .db 21 E1 70 6A 71 74 00 00 71 76 3F E9 40 9A 32 00  ; !.pjqt..qv?.@.2.
  21b7  .db 00 00 60 00 01 00 02 22 21 F9 00 00 00 00 00 00  ; ..`...."!.......
  21c7  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__21c9
FUN_M7B_r3_08000__21c9:
  21c9  3410           PSHS  X                           
  21cb  8E21A3         LDX #0x21a3                        ; desc[API_FE6A]: ->$220E ->$21ED
  21ce  AD9FFE6A       JSR [0xfe6a]                      
  21d2  3510           PULS  X                           
  21d4  39             RTS                               

; ---- function FUN_M7B_r3_08000__21d5
FUN_M7B_r3_08000__21d5:
  21d5  3410           PSHS  X                           
  21d7  8E21A3         LDX #0x21a3                        ; desc[API_FDBC]: ->$220E ->$21ED
  21da  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..!."
  21de  3510           PULS  X                           
  21e0  39             RTS                               

; ---- function FUN_M7B_r3_08000__21e1
FUN_M7B_r3_08000__21e1:
  21e1  3410           PSHS  X                           
  21e3  8E21A3         LDX #0x21a3                        ; desc[API_FE6C]: ->$220E ->$21ED
  21e6  AD9FFE6C       JSR [0xfe6c]                      
  21ea  3510           PULS  X                           
  21ec  39             RTS                               

; ---- function FUN_M7B_r3_08000__21ed
FUN_M7B_r3_08000__21ed:
  21ed  3410           PSHS  X                           
  21ef  8E21A3         LDX #0x21a3                        ; desc[API_FE6E]: ->$220E ->$21ED
  21f2  AD9FFE6E       JSR [0xfe6e]                      
  21f6  3510           PULS  X                           
  21f8  39             RTS                               
  21f9  .db 14 64 65 6C 61 79 32 20 62 65 61 74 73 3A 20 20  ; .delay2 beats:  
  2209  .db 20 2F 32 34 20                                   ;  /24 

; ---- function FUN_M7B_r3_08000__220e
FUN_M7B_r3_08000__220e:
  220e  3476           PSHS  U Y X B A                   
  2210  8E21A3         LDX #0x21a3                       
  2213  AD9FFE76       JSR [0xfe76]                      
  2217  FC70F4         LDD 0x70f4                        
  221a  3606           PSHU  B A                         
  221c  FC7176         LDD 0x7176                        
  221f  3606           PSHU  B A                         
  2221  AD9FFCEE       JSR [0xfcee]                      
  2225  FC70FE         LDD 0x70fe                        
  2228  3606           PSHU  B A                         
  222a  AD9FFCEA       JSR [0xfcea]                      
  222e  FC70F2         LDD 0x70f2                        
  2231  3606           PSHU  B A                         
  2233  FC7176         LDD 0x7176                        
  2236  3606           PSHU  B A                         
  2238  AD9FFCEE       JSR [0xfcee]                      
  223c  AD9FFCE2       JSR [0xfce2]                      
  2240  3706           PULU  A B                         
  2242  FD716C         STD 0x716c                        
  2245  17FE73         LBSR 0x20bb                       
  2248  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__22b5_M7B_r3_08000__224a:
  224a  22B5           addr M7B_r3_08000::22b5           
  224c  2294           addr M7B_r3_08000::2294           
  224e  .db 22 88 70 6C 71 78 00 00 71 7A 3F E9 40 94 33 FF  ; ".plqx..qz?.@.3.
  225e  .db 9C 00 64 00 01 00 04 23 22 A0 00 00 00 00 00 00  ; ..d....#".......
  226e  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2270
FUN_M7B_r3_08000__2270:
  2270  3410           PSHS  X                           
  2272  8E224A         LDX #0x224a                        ; desc[API_FE6A]: ->$22B5 ->$2294
  2275  AD9FFE6A       JSR [0xfe6a]                      
  2279  3510           PULS  X                           
  227b  39             RTS                               

; ---- function FUN_M7B_r3_08000__227c
FUN_M7B_r3_08000__227c:
  227c  3410           PSHS  X                           
  227e  8E224A         LDX #0x224a                        ; desc[API_FDBC]: ->$22B5 ->$2294
  2281  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.."J"
  2285  3510           PULS  X                           
  2287  39             RTS                               

; ---- function FUN_M7B_r3_08000__2288
FUN_M7B_r3_08000__2288:
  2288  3410           PSHS  X                           
  228a  8E224A         LDX #0x224a                        ; desc[API_FE6C]: ->$22B5 ->$2294
  228d  AD9FFE6C       JSR [0xfe6c]                      
  2291  3510           PULS  X                           
  2293  39             RTS                               

; ---- function FUN_M7B_r3_08000__2294
FUN_M7B_r3_08000__2294:
  2294  3410           PSHS  X                           
  2296  8E224A         LDX #0x224a                        ; desc[API_FE6E]: ->$22B5 ->$2294
  2299  AD9FFE6E       JSR [0xfe6e]                      
  229d  3510           PULS  X                           
  229f  39             RTS                               
  22a0  .db 14 64 65 6C 61 79 20 31 20 66 64 62 61 63 6B 3A  ; .delay 1 fdback:
  22b0  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7B_r3_08000__22b5
FUN_M7B_r3_08000__22b5:
  22b5  3476           PSHS  U Y X B A                   
  22b7  8E224A         LDX #0x224a                       
  22ba  AD9FFE76       JSR [0xfe76]                      
  22be  FC717A         LDD 0x717a                        
  22c1  3606           PSHU  B A                         
  22c3  AD9FFEC4       JSR [0xfec4]                      
  22c7  3706           PULU  A B                         
  22c9  FD70D6         STD 0x70d6                        
  22cc  FC718A         LDD 0x718a                        
  22cf  C101           CMPB #0x1                         
  22d1  270C           BEQ 0x22df                        
  22d3  BE70D6         LDX 0x70d6                        
  22d6  108E3F5A       LDY #0x3f5a                       
  22da  17EC57         LBSR 0x0f34                       
  22dd  200A           BRA 0x22e9                        
LAB_M7B_r3_08000__22df:
  22df  8E8000         LDX #0x8000                       
  22e2  108E3F5A       LDY #0x3f5a                       
  22e6  17EC4B         LBSR 0x0f34                       
LAB_M7B_r3_08000__22e9:
  22e9  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2356_M7B_r3_08000__22eb:
  22eb  2356           addr M7B_r3_08000::2356           
  22ed  2335           addr M7B_r3_08000::2335           
  22ef  .db 23 29 70 6E 71 7C 00 00 71 7E 3F E9 40 96 34 FF  ; #)pnq|..q~?.@.4.
  22ff  .db 9C 00 64 00 01 00 04 23 23 41 00 00 00 00 00 00  ; ..d....##A......
  230f  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2311
FUN_M7B_r3_08000__2311:
  2311  3410           PSHS  X                           
  2313  8E22EB         LDX #0x22eb                        ; desc[API_FE6A]: ->$2356 ->$2335
  2316  AD9FFE6A       JSR [0xfe6a]                      
  231a  3510           PULS  X                           
  231c  39             RTS                               

; ---- function FUN_M7B_r3_08000__231d
FUN_M7B_r3_08000__231d:
  231d  3410           PSHS  X                           
  231f  8E22EB         LDX #0x22eb                        ; desc[API_FDBC]: ->$2356 ->$2335
  2322  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94.."."
  2326  3510           PULS  X                           
  2328  39             RTS                               

; ---- function FUN_M7B_r3_08000__2329
FUN_M7B_r3_08000__2329:
  2329  3410           PSHS  X                           
  232b  8E22EB         LDX #0x22eb                        ; desc[API_FE6C]: ->$2356 ->$2335
  232e  AD9FFE6C       JSR [0xfe6c]                      
  2332  3510           PULS  X                           
  2334  39             RTS                               

; ---- function FUN_M7B_r3_08000__2335
FUN_M7B_r3_08000__2335:
  2335  3410           PSHS  X                           
  2337  8E22EB         LDX #0x22eb                        ; desc[API_FE6E]: ->$2356 ->$2335
  233a  AD9FFE6E       JSR [0xfe6e]                      
  233e  3510           PULS  X                           
  2340  39             RTS                               
  2341  .db 14 64 65 6C 61 79 20 32 20 66 64 62 61 63 6B 3A  ; .delay 2 fdback:
  2351  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M7B_r3_08000__2356
FUN_M7B_r3_08000__2356:
  2356  3476           PSHS  U Y X B A                   
  2358  8E22EB         LDX #0x22eb                       
  235b  AD9FFE76       JSR [0xfe76]                      
  235f  FC717E         LDD 0x717e                        
  2362  3606           PSHU  B A                         
  2364  AD9FFEC4       JSR [0xfec4]                      
  2368  3706           PULU  A B                         
  236a  FD70D6         STD 0x70d6                        
  236d  FC718E         LDD 0x718e                        
  2370  C101           CMPB #0x1                         
  2372  270C           BEQ 0x2380                        
  2374  BE70D6         LDX 0x70d6                        
  2377  108E3F5E       LDY #0x3f5e                       
  237b  17EBB6         LBSR 0x0f34                       
  237e  200A           BRA 0x238a                        
LAB_M7B_r3_08000__2380:
  2380  8E8000         LDX #0x8000                       
  2383  108E3F5E       LDY #0x3f5e                       
  2387  17EBAA         LBSR 0x0f34                       
LAB_M7B_r3_08000__238a:
  238a  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__23f7_M7B_r3_08000__238c:
  238c  23F7           addr M7B_r3_08000::23f7           
  238e  23D6           addr M7B_r3_08000::23d6           
  2390  .db 23 CA 70 70 71 80 00 00 71 82 3F E9 40 90 35 00  ; #.ppq...q.?.@.5.
  23a0  .db 00 4E 20 00 01 00 05 20 23 E2 00 00 00 00 00 00  ; .N .... #.......
  23b0  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__23b2
FUN_M7B_r3_08000__23b2:
  23b2  3410           PSHS  X                           
  23b4  8E238C         LDX #0x238c                        ; desc[API_FE6A]: ->$23F7 ->$23D6
  23b7  AD9FFE6A       JSR [0xfe6a]                      
  23bb  3510           PULS  X                           
  23bd  39             RTS                               

; ---- function FUN_M7B_r3_08000__23be
FUN_M7B_r3_08000__23be:
  23be  3410           PSHS  X                           
  23c0  8E238C         LDX #0x238c                        ; desc[API_FDBC]: ->$23F7 ->$23D6
  23c3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..#."
  23c7  3510           PULS  X                           
  23c9  39             RTS                               

; ---- function FUN_M7B_r3_08000__23ca
FUN_M7B_r3_08000__23ca:
  23ca  3410           PSHS  X                           
  23cc  8E238C         LDX #0x238c                        ; desc[API_FE6C]: ->$23F7 ->$23D6
  23cf  AD9FFE6C       JSR [0xfe6c]                      
  23d3  3510           PULS  X                           
  23d5  39             RTS                               

; ---- function FUN_M7B_r3_08000__23d6
FUN_M7B_r3_08000__23d6:
  23d6  3410           PSHS  X                           
  23d8  8E238C         LDX #0x238c                        ; desc[API_FE6E]: ->$23F7 ->$23D6
  23db  AD9FFE6E       JSR [0xfe6e]                      
  23df  3510           PULS  X                           
  23e1  39             RTS                               
  23e2  .db 14 64 65 6C 61 79 20 31 20 63 75 74 3A 20 20 20  ; .delay 1 cut:   
  23f2  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7B_r3_08000__23f7
FUN_M7B_r3_08000__23f7:
  23f7  3476           PSHS  U Y X B A                   
  23f9  8E238C         LDX #0x238c                       
  23fc  AD9FFE76       JSR [0xfe76]                      
  2400  FC7182         LDD 0x7182                        
  2403  170098         LBSR 0x249e                       
  2406  FD70D6         STD 0x70d6                        
  2409  BE70D6         LDX 0x70d6                        
  240c  108E3F5B       LDY #0x3f5b                       
  2410  17EB21         LBSR 0x0f34                       
  2413  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2480_M7B_r3_08000__2415:
  2415  2480           addr M7B_r3_08000::2480           
  2417  245F           addr M7B_r3_08000::245f           
  2419  .db 24 53 70 72 71 84 00 00 71 86 3F E9 40 92 36 00  ; $Sprq...q.?.@.6.
  2429  .db 00 4E 20 00 01 00 05 20 24 6B 00 00 00 00 00 00  ; .N .... $k......
  2439  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__243b
FUN_M7B_r3_08000__243b:
  243b  3410           PSHS  X                           
  243d  8E2415         LDX #0x2415                        ; desc[API_FE6A]: ->$2480 ->$245F
  2440  AD9FFE6A       JSR [0xfe6a]                      
  2444  3510           PULS  X                           
  2446  39             RTS                               

; ---- function FUN_M7B_r3_08000__2447
FUN_M7B_r3_08000__2447:
  2447  3410           PSHS  X                           
  2449  8E2415         LDX #0x2415                        ; desc[API_FDBC]: ->$2480 ->$245F
  244c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..$."
  2450  3510           PULS  X                           
  2452  39             RTS                               

; ---- function FUN_M7B_r3_08000__2453
FUN_M7B_r3_08000__2453:
  2453  3410           PSHS  X                           
  2455  8E2415         LDX #0x2415                        ; desc[API_FE6C]: ->$2480 ->$245F
  2458  AD9FFE6C       JSR [0xfe6c]                      
  245c  3510           PULS  X                           
  245e  39             RTS                               

; ---- function FUN_M7B_r3_08000__245f
FUN_M7B_r3_08000__245f:
  245f  3410           PSHS  X                           
  2461  8E2415         LDX #0x2415                        ; desc[API_FE6E]: ->$2480 ->$245F
  2464  AD9FFE6E       JSR [0xfe6e]                      
  2468  3510           PULS  X                           
  246a  39             RTS                               
  246b  .db 14 64 65 6C 61 79 20 32 20 63 75 74 3A 20 20 20  ; .delay 2 cut:   
  247b  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7B_r3_08000__2480
FUN_M7B_r3_08000__2480:
  2480  3476           PSHS  U Y X B A                   
  2482  8E2415         LDX #0x2415                       
  2485  AD9FFE76       JSR [0xfe76]                      
  2489  FC7186         LDD 0x7186                        
  248c  17000F         LBSR 0x249e                       
  248f  FD70D6         STD 0x70d6                        
  2492  BE70D6         LDX 0x70d6                        
  2495  108E3F5F       LDY #0x3f5f                       
  2499  17EA98         LBSR 0x0f34                       
  249c  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__249e
FUN_M7B_r3_08000__249e:
  249e  3470           PSHS  U Y X                       
  24a0  FD70D6         STD 0x70d6                        
  24a3  FC70D6         LDD 0x70d6                        
  24a6  1083000A       CMPD #0xa                         
  24aa  2D36           BLT 0x24e2                        
  24ac  10830064       CMPD #0x64                        
  24b0  2D22           BLT 0x24d4                        
  24b2  108303E8       CMPD #0x3e8                       
  24b6  2D0E           BLT 0x24c6                        
  24b8  CC03E8         LDD #0x3e8                        
  24bb  FD70D8         STD 0x70d8                        
  24be  CC2553         LDD #0x2553                       
  24c1  FD70DA         STD 0x70da                        
  24c4  2031           BRA 0x24f7                        
LAB_M7B_r3_08000__24c6:
  24c6  CC0064         LDD #0x64                         
  24c9  FD70D8         STD 0x70d8                        
  24cc  CC2541         LDD #0x2541                       
  24cf  FD70DA         STD 0x70da                        
  24d2  2023           BRA 0x24f7                        
LAB_M7B_r3_08000__24d4:
  24d4  CC000A         LDD #0xa                          
  24d7  FD70D8         STD 0x70d8                        
  24da  CC252F         LDD #0x252f                       
  24dd  FD70DA         STD 0x70da                        
  24e0  2015           BRA 0x24f7                        
LAB_M7B_r3_08000__24e2:
  24e2  FC70D6         LDD 0x70d6                        
  24e5  58             LSLB                              
  24e6  49             ROLA                              
  24e7  C3251B         ADDD #0x251b                      
  24ea  F3600D         ADDD 0x600d                       
  24ed  1F01           TFR D,X                           
  24ef  EC84           LDD ,X                            
  24f1  FD70D6         STD 0x70d6                        
  24f4  160022         LBRA 0x2519                       
LAB_M7B_r3_08000__24f7:
  24f7  FC70D6         LDD 0x70d6                        
  24fa  3606           PSHU  B A                         
  24fc  FC70D8         LDD 0x70d8                        
  24ff  3606           PSHU  B A                         
  2501  AD9FFCEA       JSR [0xfcea]                      
  2505  3706           PULU  A B                         
  2507  830001         SUBD #0x1                         
  250a  58             LSLB                              
  250b  49             ROLA                              
  250c  F370DA         ADDD 0x70da                       
  250f  F3600D         ADDD 0x600d                       
  2512  1F01           TFR D,X                           
  2514  EC84           LDD ,X                            
  2516  FD70D6         STD 0x70d6                        
LAB_M7B_r3_08000__2519:
  2519  35F0           PULS  X Y U PC                    

; ---- function FUN_M7B_r3_08000__251b
FUN_M7B_r3_08000__251b:
  251b  7FFF7F         CLR 0xff7f                        
  251e  FA7FF6         ORB 0x7ff6                        
  2521  7FF17F         CLR 0xf17f                        
  2524  EC7F           LDD -0x1,S                        
  2526  E87F           EORB -0x1,S                       
  2528  E37F           ADDD -0x1,S                       
  252a  DE7F           LDU <0x7f                         
  252c  DA7F           ORB <0x7f                         
  252e  D57F           BITB <0x7f                        
  2530  D07F           SUBB <0x7f                        
  2532  A27F           SBCA -0x1,S                       
  2534  737F45         COM 0x7f45                        
  2537  7F167E         CLR 0x167e                        
  253a  E87E           EORB -0x2,S                       
  253c  BA7E8C         ORA 0x7e8c                        
  253f  7E5E7E         JMP 0x5e7e                        
  2542  .db 2F 7C 66 7A A4 78 E8 77 32 75 82 73 D9 72 35 70  ; /|fz.x.w2u.s.r5p
  2552  .db 98 6F 00 60 42 53 7A 48 64 3E C7 36 71 2F 37 28  ; .o.`BSzHd>.6q/7(
  2562  .db F2 23 82 1E CB 1A B4 17 28 14 15 11 6A 0F 1A 0D  ; .#......(...j...
  2572  .db 19 0B 5C 09 DA 08 8B 00 00                       ; ..\......
PTR_FUN_M7B_r3_08000__260a_M7B_r3_08000__257b:
  257b  260A           addr M7B_r3_08000::260a           
  257d  25C5           addr M7B_r3_08000::25c5           
  257f  .db 25 B9 70 74 71 88 00 00 71 8A 3F E9 40 8C 37 00  ; %.ptq...q.?.@.7.
  258f  .db 00 00 01 00 01 00 06 22 25 E9 00 00 25 FE 70 76  ; ......."%...%.pv
  259f  .db 40 80                                            ; @.

; ---- function FUN_M7B_r3_08000__25a1
FUN_M7B_r3_08000__25a1:
  25a1  3410           PSHS  X                           
  25a3  8E257B         LDX #0x257b                       
  25a6  AD9FFC4E       JSR [0xfc4e]                      
  25aa  3510           PULS  X                           
  25ac  39             RTS                               

; ---- function FUN_M7B_r3_08000__25ad
FUN_M7B_r3_08000__25ad:
  25ad  3410           PSHS  X                           
  25af  8E257B         LDX #0x257b                        ; desc[API_FDBC]: ->$260A ->$25C5
  25b2  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..%{"
  25b6  3510           PULS  X                           
  25b8  39             RTS                               

; ---- function FUN_M7B_r3_08000__25b9
FUN_M7B_r3_08000__25b9:
  25b9  3410           PSHS  X                           
  25bb  8E257B         LDX #0x257b                        ; desc[API_FE6C]: ->$260A ->$25C5
  25be  AD9FFE6C       JSR [0xfe6c]                      
  25c2  3510           PULS  X                           
  25c4  39             RTS                               

; ---- function FUN_M7B_r3_08000__25c5
FUN_M7B_r3_08000__25c5:
  25c5  3410           PSHS  X                           
  25c7  8E257B         LDX #0x257b                       
  25ca  AD9FFC52       JSR [0xfc52]                      
  25ce  3510           PULS  X                           
  25d0  39             RTS                               

; ---- function FUN_M7B_r3_08000__25d1
FUN_M7B_r3_08000__25d1:
  25d1  3410           PSHS  X                           
  25d3  8E257B         LDX #0x257b                        ; desc[API_FE1C]: ->$260A ->$25C5
  25d6  AD9FFE1C       JSR [0xfe1c]                      
  25da  3510           PULS  X                           
  25dc  39             RTS                               

; ---- function FUN_M7B_r3_08000__25dd
FUN_M7B_r3_08000__25dd:
  25dd  3410           PSHS  X                           
  25df  8E257B         LDX #0x257b                        ; desc[API_FE1A]: ->$260A ->$25C5 $25B9
  25e2  AD9FFE1A       JSR [0xfe1a]                      
  25e6  3510           PULS  X                           
  25e8  39             RTS                               
  25e9  .db 14 64 65 6C 61 79 20 31 20 6C 6F 6F 70 3A 20 20  ; .delay 1 loop:  
  25f9  .db 20 20 20 20 20 20 6F 66 66 20 20 2D 2D 6F 6E 2D  ;       off  --on-
  2609  .db 2D                                               ; -

; ---- function FUN_M7B_r3_08000__260a
FUN_M7B_r3_08000__260a:
  260a  3476           PSHS  U Y X B A                   
  260c  8E257B         LDX #0x257b                       
  260f  AD9FFE76       JSR [0xfe76]                      
  2613  17FC9F         LBSR 0x22b5                       
  2616  FC718A         LDD 0x718a                        
  2619  10830001       CMPD #0x1                         
  261d  10270018       LBEQ 0x2639                       
  2621  108E3F3A       LDY #0x3f3a                       
  2625  CC000E         LDD #0xe                          
  2628  58             LSLB                              
  2629  49             ROLA                              
  262a  1F01           TFR D,X                           
  262c  EC89700A       LDD 0x700a,X                      
  2630  C30001         ADDD #0x1                         
  2633  AD9FFD2E       JSR [0xfd2e]                      
  2637  200B           BRA 0x2644                        
LAB_M7B_r3_08000__2639:
  2639  108E3F3A       LDY #0x3f3a                       
  263d  CC0001         LDD #0x1                          
  2640  AD9FFD2E       JSR [0xfd2e]                      
LAB_M7B_r3_08000__2644:
  2644  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__26c9_M7B_r3_08000__2646:
  2646  26C9           addr M7B_r3_08000::26c9           
  2648  2690           addr M7B_r3_08000::2690           
  264a  .db 26 84 70 78 71 8C 00 00 71 8E 3F E9 40 8E 38 00  ; &.pxq...q.?.@.8.
  265a  .db 00 00 01 00 01 00 06 22 26 B4 00 00 25 FE 70 7A  ; ......."&...%.pz
  266a  .db 40 82                                            ; @.

; ---- function FUN_M7B_r3_08000__266c
FUN_M7B_r3_08000__266c:
  266c  3410           PSHS  X                           
  266e  8E2646         LDX #0x2646                       
  2671  AD9FFC4E       JSR [0xfc4e]                      
  2675  3510           PULS  X                           
  2677  39             RTS                               

; ---- function FUN_M7B_r3_08000__2678
FUN_M7B_r3_08000__2678:
  2678  3410           PSHS  X                           
  267a  8E2646         LDX #0x2646                        ; desc[API_FDBC]: ->$26C9 ->$2690
  267d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..&F"
  2681  3510           PULS  X                           
  2683  39             RTS                               

; ---- function FUN_M7B_r3_08000__2684
FUN_M7B_r3_08000__2684:
  2684  3410           PSHS  X                           
  2686  8E2646         LDX #0x2646                        ; desc[API_FE6C]: ->$26C9 ->$2690
  2689  AD9FFE6C       JSR [0xfe6c]                      
  268d  3510           PULS  X                           
  268f  39             RTS                               

; ---- function FUN_M7B_r3_08000__2690
FUN_M7B_r3_08000__2690:
  2690  3410           PSHS  X                           
  2692  8E2646         LDX #0x2646                       
  2695  AD9FFC52       JSR [0xfc52]                      
  2699  3510           PULS  X                           
  269b  39             RTS                               

; ---- function FUN_M7B_r3_08000__269c
FUN_M7B_r3_08000__269c:
  269c  3410           PSHS  X                           
  269e  8E2646         LDX #0x2646                        ; desc[API_FE1C]: ->$26C9 ->$2690
  26a1  AD9FFE1C       JSR [0xfe1c]                      
  26a5  3510           PULS  X                           
  26a7  39             RTS                               

; ---- function FUN_M7B_r3_08000__26a8
FUN_M7B_r3_08000__26a8:
  26a8  3410           PSHS  X                           
  26aa  8E2646         LDX #0x2646                        ; desc[API_FE1A]: ->$26C9 ->$2690 $2684
  26ad  AD9FFE1A       JSR [0xfe1a]                      
  26b1  3510           PULS  X                           
  26b3  39             RTS                               
  26b4  .db 14 64 65 6C 61 79 20 32 20 6C 6F 6F 70 3A 20 20  ; .delay 2 loop:  
  26c4  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__26c9
FUN_M7B_r3_08000__26c9:
  26c9  3476           PSHS  U Y X B A                   
  26cb  8E2646         LDX #0x2646                       
  26ce  AD9FFE76       JSR [0xfe76]                      
  26d2  17FC81         LBSR 0x2356                       
  26d5  FC718E         LDD 0x718e                        
  26d8  10830001       CMPD #0x1                         
  26dc  10270018       LBEQ 0x26f8                       
  26e0  108E3F3D       LDY #0x3f3d                       
  26e4  CC0011         LDD #0x11                         
  26e7  58             LSLB                              
  26e8  49             ROLA                              
  26e9  1F01           TFR D,X                           
  26eb  EC89700A       LDD 0x700a,X                      
  26ef  C30001         ADDD #0x1                         
  26f2  AD9FFD2E       JSR [0xfd2e]                      
  26f6  200B           BRA 0x2703                        
LAB_M7B_r3_08000__26f8:
  26f8  108E3F3D       LDY #0x3f3d                       
  26fc  CC0001         LDD #0x1                          
  26ff  AD9FFD2E       JSR [0xfd2e]                      
LAB_M7B_r3_08000__2703:
  2703  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2770_M7B_r3_08000__2705:
  2705  2770           addr M7B_r3_08000::2770           
  2707  274F           addr M7B_r3_08000::274f           
  2709  .db 27 43 70 7C 71 90 00 00 71 92 3F E9 40 88 39 EC  ; 'Cp|q...q.?.@.9.
  2719  .db 78 13 88 00 01 01 06 1F 27 5B 00 00 00 00 00 00  ; x.......'[......
  2729  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__272b
FUN_M7B_r3_08000__272b:
  272b  3410           PSHS  X                           
  272d  8E2705         LDX #0x2705                        ; desc[API_FE6A]: ->$2770 ->$274F
  2730  AD9FFE6A       JSR [0xfe6a]                      
  2734  3510           PULS  X                           
  2736  39             RTS                               

; ---- function FUN_M7B_r3_08000__2737
FUN_M7B_r3_08000__2737:
  2737  3410           PSHS  X                           
  2739  8E2705         LDX #0x2705                        ; desc[API_FDBC]: ->$2770 ->$274F
  273c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..'."
  2740  3510           PULS  X                           
  2742  39             RTS                               

; ---- function FUN_M7B_r3_08000__2743
FUN_M7B_r3_08000__2743:
  2743  3410           PSHS  X                           
  2745  8E2705         LDX #0x2705                        ; desc[API_FE6C]: ->$2770 ->$274F
  2748  AD9FFE6C       JSR [0xfe6c]                      
  274c  3510           PULS  X                           
  274e  39             RTS                               

; ---- function FUN_M7B_r3_08000__274f
FUN_M7B_r3_08000__274f:
  274f  3410           PSHS  X                           
  2751  8E2705         LDX #0x2705                        ; desc[API_FE6E]: ->$2770 ->$274F
  2754  AD9FFE6E       JSR [0xfe6e]                      
  2758  3510           PULS  X                           
  275a  39             RTS                               
  275b  .db 14 64 65 6C 61 79 20 31 20 6D 6F 64 3A 20 20 20  ; .delay 1 mod:   
  276b  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__2770
FUN_M7B_r3_08000__2770:
  2770  3476           PSHS  U Y X B A                   
  2772  8E2705         LDX #0x2705                       
  2775  AD9FFE76       JSR [0xfe76]                      
  2779  FC7192         LDD 0x7192                        
  277c  3606           PSHU  B A                         
  277e  AD9FFECC       JSR [0xfecc]                      
  2782  3706           PULU  A B                         
  2784  FD70D6         STD 0x70d6                        
  2787  2C28           BGE 0x27b1                        
  2789  FC7164         LDD 0x7164                        
  278c  108301FF       CMPD #0x1ff                       
  2790  2C1F           BGE 0x27b1                        
  2792  58             LSLB                              
  2793  49             ROLA                              
  2794  58             LSLB                              
  2795  49             ROLA                              
  2796  58             LSLB                              
  2797  49             ROLA                              
  2798  58             LSLB                              
  2799  49             ROLA                              
  279a  58             LSLB                              
  279b  49             ROLA                              
  279c  58             LSLB                              
  279d  49             ROLA                              
  279e  FD70D8         STD 0x70d8                        
  27a1  F370D6         ADDD 0x70d6                       
  27a4  2E0B           BGT 0x27b1                        
  27a6  4F             CLRA                              
  27a7  5F             CLRB                              
  27a8  B370D8         SUBD 0x70d8                       
  27ab  C30001         ADDD #0x1                         
  27ae  FD70D6         STD 0x70d6                        
LAB_M7B_r3_08000__27b1:
  27b1  BE70D6         LDX 0x70d6                        
  27b4  108E3F59       LDY #0x3f59                       
  27b8  17E779         LBSR 0x0f34                       
  27bb  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2828_M7B_r3_08000__27bd:
  27bd  2828           addr M7B_r3_08000::2828           
  27bf  2807           addr M7B_r3_08000::2807           
  27c1  .db 27 FB 70 7E 71 94 00 00 71 96 3F E9 40 8A 3A EC  ; '.p~q...q.?.@.:.
  27d1  .db 78 13 88 00 01 01 06 1F 28 13 00 00 00 00 00 00  ; x.......(.......
  27e1  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__27e3
FUN_M7B_r3_08000__27e3:
  27e3  3410           PSHS  X                           
  27e5  8E27BD         LDX #0x27bd                        ; desc[API_FE6A]: ->$2828 ->$2807
  27e8  AD9FFE6A       JSR [0xfe6a]                      
  27ec  3510           PULS  X                           
  27ee  39             RTS                               

; ---- function FUN_M7B_r3_08000__27ef
FUN_M7B_r3_08000__27ef:
  27ef  3410           PSHS  X                           
  27f1  8E27BD         LDX #0x27bd                        ; desc[API_FDBC]: ->$2828 ->$2807
  27f4  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..'."
  27f8  3510           PULS  X                           
  27fa  39             RTS                               

; ---- function FUN_M7B_r3_08000__27fb
FUN_M7B_r3_08000__27fb:
  27fb  3410           PSHS  X                           
  27fd  8E27BD         LDX #0x27bd                        ; desc[API_FE6C]: ->$2828 ->$2807
  2800  AD9FFE6C       JSR [0xfe6c]                      
  2804  3510           PULS  X                           
  2806  39             RTS                               

; ---- function FUN_M7B_r3_08000__2807
FUN_M7B_r3_08000__2807:
  2807  3410           PSHS  X                           
  2809  8E27BD         LDX #0x27bd                        ; desc[API_FE6E]: ->$2828 ->$2807
  280c  AD9FFE6E       JSR [0xfe6e]                      
  2810  3510           PULS  X                           
  2812  39             RTS                               
  2813  .db 14 64 65 6C 61 79 20 32 20 6D 6F 64 3A 20 20 20  ; .delay 2 mod:   
  2823  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M7B_r3_08000__2828
FUN_M7B_r3_08000__2828:
  2828  3476           PSHS  U Y X B A                   
  282a  8E27BD         LDX #0x27bd                       
  282d  AD9FFE76       JSR [0xfe76]                      
  2831  FC7196         LDD 0x7196                        
  2834  3606           PSHU  B A                         
  2836  AD9FFECC       JSR [0xfecc]                      
  283a  3706           PULU  A B                         
  283c  FD70D6         STD 0x70d6                        
  283f  2C28           BGE 0x2869                        
  2841  FC716A         LDD 0x716a                        
  2844  108301FF       CMPD #0x1ff                       
  2848  2C1F           BGE 0x2869                        
  284a  58             LSLB                              
  284b  49             ROLA                              
  284c  58             LSLB                              
  284d  49             ROLA                              
  284e  58             LSLB                              
  284f  49             ROLA                              
  2850  58             LSLB                              
  2851  49             ROLA                              
  2852  58             LSLB                              
  2853  49             ROLA                              
  2854  58             LSLB                              
  2855  49             ROLA                              
  2856  FD70D8         STD 0x70d8                        
  2859  F370D6         ADDD 0x70d6                       
  285c  2E0B           BGT 0x2869                        
  285e  4F             CLRA                              
  285f  5F             CLRB                              
  2860  B370D8         SUBD 0x70d8                       
  2863  C30001         ADDD #0x1                         
  2866  FD70D6         STD 0x70d6                        
LAB_M7B_r3_08000__2869:
  2869  BE70D6         LDX 0x70d6                        
  286c  108E3F5D       LDY #0x3f5d                       
  2870  17E6C1         LBSR 0x0f34                       
  2873  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__28e0_M7B_r3_08000__2875:
  2875  28E0           addr M7B_r3_08000::28e0           
  2877  28BF           addr M7B_r3_08000::28bf           
  2879  .db 28 B3 70 80 71 98 00 00 71 9A 3F E9 40 E7 3B 00  ; (.p.q...q.?.@.;.
  2889  .db 00 4E 20 00 01 00 05 21 28 CB 00 00 00 00 00 00  ; .N ....!(.......
  2899  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__289b
FUN_M7B_r3_08000__289b:
  289b  3410           PSHS  X                           
  289d  8E2875         LDX #0x2875                        ; desc[API_FE6A]: ->$28E0 ->$28BF
  28a0  AD9FFE6A       JSR [0xfe6a]                      
  28a4  3510           PULS  X                           
  28a6  39             RTS                               

; ---- function FUN_M7B_r3_08000__28a7
FUN_M7B_r3_08000__28a7:
  28a7  3410           PSHS  X                           
  28a9  8E2875         LDX #0x2875                        ; desc[API_FDBC]: ->$28E0 ->$28BF
  28ac  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..(u"
  28b0  3510           PULS  X                           
  28b2  39             RTS                               

; ---- function FUN_M7B_r3_08000__28b3
FUN_M7B_r3_08000__28b3:
  28b3  3410           PSHS  X                           
  28b5  8E2875         LDX #0x2875                        ; desc[API_FE6C]: ->$28E0 ->$28BF
  28b8  AD9FFE6C       JSR [0xfe6c]                      
  28bc  3510           PULS  X                           
  28be  39             RTS                               

; ---- function FUN_M7B_r3_08000__28bf
FUN_M7B_r3_08000__28bf:
  28bf  3410           PSHS  X                           
  28c1  8E2875         LDX #0x2875                        ; desc[API_FE6E]: ->$28E0 ->$28BF
  28c4  AD9FFE6E       JSR [0xfe6e]                      
  28c8  3510           PULS  X                           
  28ca  39             RTS                               
  28cb  .db 14 64 65 6C 61 79 31 63 75 74 6D 6F 64 3A 20 20  ; .delay1cutmod:  
  28db  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7B_r3_08000__28e0
FUN_M7B_r3_08000__28e0:
  28e0  3476           PSHS  U Y X B A                   
  28e2  8E2875         LDX #0x2875                       
  28e5  AD9FFE76       JSR [0xfe76]                      
  28e9  4F             CLRA                              
  28ea  5F             CLRB                              
  28eb  3606           PSHU  B A                         
  28ed  CC4E20         LDD #0x4e20                       
  28f0  3606           PSHU  B A                         
  28f2  FC719A         LDD 0x719a                        
  28f5  F37182         ADDD 0x7182                       
  28f8  3606           PSHU  B A                         
  28fa  AD9FFCD8       JSR [0xfcd8]                      
  28fe  3706           PULU  A B                         
  2900  17FB9B         LBSR 0x249e                       
  2903  FD70D8         STD 0x70d8                        
  2906  FC7182         LDD 0x7182                        
  2909  17FB92         LBSR 0x249e                       
  290c  FD70D6         STD 0x70d6                        
  290f  FC70D8         LDD 0x70d8                        
  2912  B370D6         SUBD 0x70d6                       
  2915  FD70D6         STD 0x70d6                        
  2918  BE70D6         LDX 0x70d6                        
  291b  108E3F48       LDY #0x3f48                       
  291f  17E612         LBSR 0x0f34                       
  2922  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__298f_M7B_r3_08000__2924:
  2924  298F           addr M7B_r3_08000::298f           
  2926  296E           addr M7B_r3_08000::296e           
  2928  .db 29 62 70 82 71 9C 00 00 71 9E 3F E9 40 E9 3C 00  ; )bp.q...q.?.@.<.
  2938  .db 00 4E 20 00 01 00 05 21 29 7A 00 00 00 00 00 00  ; .N ....!)z......
  2948  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__294a
FUN_M7B_r3_08000__294a:
  294a  3410           PSHS  X                           
  294c  8E2924         LDX #0x2924                        ; desc[API_FE6A]: ->$298F ->$296E
  294f  AD9FFE6A       JSR [0xfe6a]                      
  2953  3510           PULS  X                           
  2955  39             RTS                               

; ---- function FUN_M7B_r3_08000__2956
FUN_M7B_r3_08000__2956:
  2956  3410           PSHS  X                           
  2958  8E2924         LDX #0x2924                        ; desc[API_FDBC]: ->$298F ->$296E
  295b  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)$"
  295f  3510           PULS  X                           
  2961  39             RTS                               

; ---- function FUN_M7B_r3_08000__2962
FUN_M7B_r3_08000__2962:
  2962  3410           PSHS  X                           
  2964  8E2924         LDX #0x2924                        ; desc[API_FE6C]: ->$298F ->$296E
  2967  AD9FFE6C       JSR [0xfe6c]                      
  296b  3510           PULS  X                           
  296d  39             RTS                               

; ---- function FUN_M7B_r3_08000__296e
FUN_M7B_r3_08000__296e:
  296e  3410           PSHS  X                           
  2970  8E2924         LDX #0x2924                        ; desc[API_FE6E]: ->$298F ->$296E
  2973  AD9FFE6E       JSR [0xfe6e]                      
  2977  3510           PULS  X                           
  2979  39             RTS                               
  297a  .db 14 64 65 6C 61 79 32 63 75 74 6D 6F 64 3A 20 20  ; .delay2cutmod:  
  298a  .db 20 20 20 48 7A                                   ;    Hz

; ---- function FUN_M7B_r3_08000__298f
FUN_M7B_r3_08000__298f:
  298f  3476           PSHS  U Y X B A                   
  2991  8E2924         LDX #0x2924                       
  2994  AD9FFE76       JSR [0xfe76]                      
  2998  4F             CLRA                              
  2999  5F             CLRB                              
  299a  3606           PSHU  B A                         
  299c  CC4E20         LDD #0x4e20                       
  299f  3606           PSHU  B A                         
  29a1  FC719E         LDD 0x719e                        
  29a4  F37186         ADDD 0x7186                       
  29a7  3606           PSHU  B A                         
  29a9  AD9FFCD8       JSR [0xfcd8]                      
  29ad  3706           PULU  A B                         
  29af  17FAEC         LBSR 0x249e                       
  29b2  FD70D8         STD 0x70d8                        
  29b5  FC7186         LDD 0x7186                        
  29b8  17FAE3         LBSR 0x249e                       
  29bb  FD70D6         STD 0x70d6                        
  29be  FC70D8         LDD 0x70d8                        
  29c1  B370D6         SUBD 0x70d6                       
  29c4  FD70D6         STD 0x70d6                        
  29c7  BE70D6         LDX 0x70d6                        
  29ca  108E3F49       LDY #0x3f49                       
  29ce  17E563         LBSR 0x0f34                       
  29d1  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2a56_M7B_r3_08000__29d3:
  29d3  2A56           addr M7B_r3_08000::2a56           
  29d5  2A1D           addr M7B_r3_08000::2a1d           
  29d7  .db 2A 11 70 84 71 A0 00 00 71 A2 3F E9 40 A1 3D 00  ; *.p.q...q.?.@.=.
  29e7  .db 00 75 30 00 01 02 06 1D 2A 41 00 00 00 00 70 86  ; .u0.....*A....p.
  29f7  .db 40 70                                            ; @p

; ---- function FUN_M7B_r3_08000__29f9
FUN_M7B_r3_08000__29f9:
  29f9  3410           PSHS  X                           
  29fb  8E29D3         LDX #0x29d3                        ; desc[API_FE6A]: ->$2A56 ->$2A1D
  29fe  AD9FFE6A       JSR [0xfe6a]                      
  2a02  3510           PULS  X                           
  2a04  39             RTS                               

; ---- function FUN_M7B_r3_08000__2a05
FUN_M7B_r3_08000__2a05:
  2a05  3410           PSHS  X                           
  2a07  8E29D3         LDX #0x29d3                        ; desc[API_FDBC]: ->$2A56 ->$2A1D
  2a0a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..)."
  2a0e  3510           PULS  X                           
  2a10  39             RTS                               

; ---- function FUN_M7B_r3_08000__2a11
FUN_M7B_r3_08000__2a11:
  2a11  3410           PSHS  X                           
  2a13  8E29D3         LDX #0x29d3                        ; desc[API_FE6C]: ->$2A56 ->$2A1D
  2a16  AD9FFE6C       JSR [0xfe6c]                      
  2a1a  3510           PULS  X                           
  2a1c  39             RTS                               

; ---- function FUN_M7B_r3_08000__2a1d
FUN_M7B_r3_08000__2a1d:
  2a1d  3410           PSHS  X                           
  2a1f  8E29D3         LDX #0x29d3                        ; desc[API_FE6E]: ->$2A56 ->$2A1D
  2a22  AD9FFE6E       JSR [0xfe6e]                      
  2a26  3510           PULS  X                           
  2a28  39             RTS                               

; ---- function FUN_M7B_r3_08000__2a29
FUN_M7B_r3_08000__2a29:
  2a29  3410           PSHS  X                           
  2a2b  8E29D3         LDX #0x29d3                        ; desc[API_FE1C]: ->$2A56 ->$2A1D
  2a2e  AD9FFE1C       JSR [0xfe1c]                      
  2a32  3510           PULS  X                           
  2a34  39             RTS                               

; ---- function FUN_M7B_r3_08000__2a35
FUN_M7B_r3_08000__2a35:
  2a35  3410           PSHS  X                           
  2a37  8E29D3         LDX #0x29d3                        ; desc[API_FE1A]: ->$2A56 ->$2A1D $2A11
  2a3a  AD9FFE1A       JSR [0xfe1a]                      
  2a3e  3510           PULS  X                           
  2a40  39             RTS                               
  2a41  .db 14 6C 66 6F 20 66 72 65 71 3A 20 20 20 20 20 20  ; .lfo freq:      
  2a51  .db 20 20 48 7A 20                                   ;   Hz 

; ---- function FUN_M7B_r3_08000__2a56
FUN_M7B_r3_08000__2a56:
  2a56  3476           PSHS  U Y X B A                   
  2a58  4F             CLRA                              
  2a59  5F             CLRB                              
  2a5a  3606           PSHU  B A                         
  2a5c  CC7530         LDD #0x7530                       
  2a5f  3606           PSHU  B A                         
  2a61  FC7084         LDD 0x7084                        
  2a64  F371A0         ADDD 0x71a0                       
  2a67  F371A4         ADDD 0x71a4                       
  2a6a  3606           PSHU  B A                         
  2a6c  AD9FFCD8       JSR [0xfcd8]                      
  2a70  3706           PULU  A B                         
  2a72  FD71A2         STD 0x71a2                        
  2a75  FC71A2         LDD 0x71a2                        
  2a78  3606           PSHU  B A                         
  2a7a  CC0F38         LDD #0xf38                        
  2a7d  3606           PSHU  B A                         
  2a7f  AD9FFCF2       JSR [0xfcf2]                      
  2a83  3706           PULU  A B                         
  2a85  FD70D6         STD 0x70d6                        
  2a88  BE70D6         LDX 0x70d6                        
  2a8b  108E3F70       LDY #0x3f70                       
  2a8f  17E4A2         LBSR 0x0f34                       
  2a92  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2aff_M7B_r3_08000__2a94:
  2a94  2AFF           addr M7B_r3_08000::2aff           
  2a96  2ADE           addr M7B_r3_08000::2ade           
  2a98  .db 2A D2 70 88 71 A6 00 00 71 A8 3F E9 41 0D 3E 00  ; *.p.q...q.?.A.>.
  2aa8  .db 00 00 60 00 01 00 02 1F 2A EA 00 00 00 00 00 00  ; ..`.....*.......
  2ab8  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2aba
FUN_M7B_r3_08000__2aba:
  2aba  3410           PSHS  X                           
  2abc  8E2A94         LDX #0x2a94                        ; desc[API_FE6A]: ->$2AFF ->$2ADE
  2abf  AD9FFE6A       JSR [0xfe6a]                      
  2ac3  3510           PULS  X                           
  2ac5  39             RTS                               

; ---- function FUN_M7B_r3_08000__2ac6
FUN_M7B_r3_08000__2ac6:
  2ac6  3410           PSHS  X                           
  2ac8  8E2A94         LDX #0x2a94                        ; desc[API_FDBC]: ->$2AFF ->$2ADE
  2acb  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..*."
  2acf  3510           PULS  X                           
  2ad1  39             RTS                               

; ---- function FUN_M7B_r3_08000__2ad2
FUN_M7B_r3_08000__2ad2:
  2ad2  3410           PSHS  X                           
  2ad4  8E2A94         LDX #0x2a94                        ; desc[API_FE6C]: ->$2AFF ->$2ADE
  2ad7  AD9FFE6C       JSR [0xfe6c]                      
  2adb  3510           PULS  X                           
  2add  39             RTS                               

; ---- function FUN_M7B_r3_08000__2ade
FUN_M7B_r3_08000__2ade:
  2ade  3410           PSHS  X                           
  2ae0  8E2A94         LDX #0x2a94                        ; desc[API_FE6E]: ->$2AFF ->$2ADE
  2ae3  AD9FFE6E       JSR [0xfe6e]                      
  2ae7  3510           PULS  X                           
  2ae9  39             RTS                               
  2aea  .db 14 6C 66 6F 20 62 65 61 74 73 3A 20 20 20 2F 32  ; .lfo beats:   /2
  2afa  .db 34 20 20 20 20                                   ; 4    

; ---- function FUN_M7B_r3_08000__2aff
FUN_M7B_r3_08000__2aff:
  2aff  3476           PSHS  U Y X B A                   
  2b01  8E2A94         LDX #0x2a94                       
  2b04  AD9FFE76       JSR [0xfe76]                      
  2b08  FC71A8         LDD 0x71a8                        
  2b0b  2605           BNE 0x2b12                        
  2b0d  FD71A4         STD 0x71a4                        
  2b10  201C           BRA 0x2b2e                        
LAB_M7B_r3_08000__2b12:
  2b12  FC70FE         LDD 0x70fe                        
  2b15  3606           PSHU  B A                         
  2b17  CC0028         LDD #0x28                         
  2b1a  3606           PSHU  B A                         
  2b1c  AD9FFCEE       JSR [0xfcee]                      
  2b20  FC71A8         LDD 0x71a8                        
  2b23  3606           PSHU  B A                         
  2b25  AD9FFCEA       JSR [0xfcea]                      
  2b29  3706           PULU  A B                         
  2b2b  FD71A4         STD 0x71a4                        
LAB_M7B_r3_08000__2b2e:
  2b2e  17FF25         LBSR 0x2a56                       
  2b31  35F6           PULS  A B X Y U PC                
  2b33  2B9E2B7D2B71   addr[3]                           
  2b39  .db 70 8A 71 AA 00 00 71 AC 3F E9 40 A0 3F 00 00 00  ; p.q...q.?.@.?...
  2b49  .db 0C 00 01 00 0A 1D 2B 89 00 00 2C 25 00 00 00 00  ; ......+...,%....

; ---- function FUN_M7B_r3_08000__2b59
FUN_M7B_r3_08000__2b59:
  2b59  3410           PSHS  X                           
  2b5b  8E2B33         LDX #0x2b33                       
  2b5e  AD9FFC4E       JSR [0xfc4e]                      
  2b62  3510           PULS  X                           
  2b64  39             RTS                               

; ---- function FUN_M7B_r3_08000__2b65
FUN_M7B_r3_08000__2b65:
  2b65  3410           PSHS  X                           
  2b67  8E2B33         LDX #0x2b33                       
  2b6a  AD9FFC4C       JSR [0xfc4c]                      
  2b6e  3510           PULS  X                           
  2b70  39             RTS                               

; ---- function FUN_M7B_r3_08000__2b71
FUN_M7B_r3_08000__2b71:
  2b71  3410           PSHS  X                           
  2b73  8E2B33         LDX #0x2b33                       
  2b76  AD9FFC50       JSR [0xfc50]                      
  2b7a  3510           PULS  X                           
  2b7c  39             RTS                               

; ---- function FUN_M7B_r3_08000__2b7d
FUN_M7B_r3_08000__2b7d:
  2b7d  3410           PSHS  X                           
  2b7f  8E2B33         LDX #0x2b33                       
  2b82  AD9FFC52       JSR [0xfc52]                      
  2b86  3510           PULS  X                           
  2b88  39             RTS                               
  2b89  .db 14 6C 66 6F 20 77 61 76 65 3A 20 20 20 20 20 20  ; .lfo wave:      
  2b99  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__2b9e
FUN_M7B_r3_08000__2b9e:
  2b9e  3476           PSHS  U Y X B A                   
  2ba0  8E2B33         LDX #0x2b33                       
  2ba3  AD9FFE76       JSR [0xfe76]                      
  2ba7  FC71AC         LDD 0x71ac                        
  2baa  C105           CMPB #0x5                         
  2bac  2F41           BLE 0x2bef                        
  2bae  C106           CMPB #0x6                         
  2bb0  2731           BEQ 0x2be3                        
  2bb2  C10A           CMPB #0xa                         
  2bb4  2F1C           BLE 0x2bd2                        
  2bb6  C10B           CMPB #0xb                         
  2bb8  270D           BEQ 0x2bc7                        
  2bba  4F             CLRA                              
  2bbb  C604           LDB #0x4                          
  2bbd  FD70D6         STD 0x70d6                        
  2bc0  C602           LDB #0x2                          
  2bc2  FD70D8         STD 0x70d8                        
  2bc5  2035           BRA 0x2bfc                        
LAB_M7B_r3_08000__2bc7:
  2bc7  4F             CLRA                              
  2bc8  C602           LDB #0x2                          
  2bca  FD70D6         STD 0x70d6                        
  2bcd  FD70D8         STD 0x70d8                        
  2bd0  202A           BRA 0x2bfc                        
LAB_M7B_r3_08000__2bd2:
  2bd2  FC71AC         LDD 0x71ac                        
  2bd5  830005         SUBD #0x5                         
  2bd8  FD70D6         STD 0x70d6                        
  2bdb  CC0001         LDD #0x1                          
  2bde  FD70D8         STD 0x70d8                        
  2be1  2019           BRA 0x2bfc                        
LAB_M7B_r3_08000__2be3:
  2be3  4F             CLRA                              
  2be4  5F             CLRB                              
  2be5  FD70D6         STD 0x70d6                        
  2be8  C601           LDB #0x1                          
  2bea  FD70D8         STD 0x70d8                        
  2bed  200D           BRA 0x2bfc                        
LAB_M7B_r3_08000__2bef:
  2bef  FC71AC         LDD 0x71ac                        
  2bf2  FD70D6         STD 0x70d6                        
  2bf5  4F             CLRA                              
  2bf6  5F             CLRB                              
  2bf7  FD70D8         STD 0x70d8                        
  2bfa  2000           BRA 0x2bfc                        
LAB_M7B_r3_08000__2bfc:
  2bfc  FC70D6         LDD 0x70d6                        
  2bff  3606           PSHU  B A                         
  2c01  CC0041         LDD #0x41                         
  2c04  3606           PSHU  B A                         
  2c06  AD9FFCEE       JSR [0xfcee]                      
  2c0a  3706           PULU  A B                         
  2c0c  FD70D6         STD 0x70d6                        
  2c0f  BE70D6         LDX 0x70d6                        
  2c12  108E3F71       LDY #0x3f71                       
  2c16  17E31B         LBSR 0x0f34                       
  2c19  BE70D8         LDX 0x70d8                        
  2c1c  108E3F73       LDY #0x3f73                       
  2c20  17E311         LBSR 0x0f34                       
  2c23  35F6           PULS  A B X Y U PC                
  2c25  .db 73 69 6E 65 20 20 20 20 20 20 73 71 75 61 72 65  ; sine      square
  2c35  .db 20 20 20 20 73 61 77 74 6F 6F 74 68 20 20 74 72  ;     sawtooth  tr
  2c45  .db 69 61 6E 67 6C 65 20 20 65 78 70 20 73 61 77 20  ; iangle  exp saw 
  2c55  .db 20 20 65 78 70 20 74 72 69 20 20 20 74 72 67 20  ;   exp tri   trg 
  2c65  .db 73 69 6E 65 20 20 74 72 67 20 73 61 77 20 20 20  ; sine  trg saw   
  2c75  .db 74 72 67 20 74 72 69 61 6E 67 74 72 67 20 65 78  ; trg triangtrg ex
  2c85  .db 70 73 61 77 74 72 67 20 65 78 70 74 72 69 74 6F  ; psawtrg exptrito
  2c95  .db 67 67 6C 65 20 6C 69 6E 74 6F 67 67 6C 65 20 65  ; ggle lintoggle e
  2ca5  .db 78 70                                            ; xp
PTR_FUN_M7B_r3_08000__2d12_M7B_r3_08000__2ca7:
  2ca7  2D12           addr M7B_r3_08000::2d12           
  2ca9  2CF1           addr M7B_r3_08000::2cf1           
  2cab  .db 2C E5 70 8C 71 AE 00 00 71 B0 3F E9 40 A5 40 FF  ; ,.p.q...q.?.@.@.
  2cbb  .db D8 00 00 00 01 00 03 1E 2C FD 00 00 00 00 00 00  ; ........,.......
  2ccb  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2ccd
FUN_M7B_r3_08000__2ccd:
  2ccd  3410           PSHS  X                           
  2ccf  8E2CA7         LDX #0x2ca7                        ; desc[API_FE6A]: ->$2D12 ->$2CF1
  2cd2  AD9FFE6A       JSR [0xfe6a]                      
  2cd6  3510           PULS  X                           
  2cd8  39             RTS                               

; ---- function FUN_M7B_r3_08000__2cd9
FUN_M7B_r3_08000__2cd9:
  2cd9  3410           PSHS  X                           
  2cdb  8E2CA7         LDX #0x2ca7                        ; desc[API_FDBC]: ->$2D12 ->$2CF1
  2cde  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..,."
  2ce2  3510           PULS  X                           
  2ce4  39             RTS                               

; ---- function FUN_M7B_r3_08000__2ce5
FUN_M7B_r3_08000__2ce5:
  2ce5  3410           PSHS  X                           
  2ce7  8E2CA7         LDX #0x2ca7                        ; desc[API_FE6C]: ->$2D12 ->$2CF1
  2cea  AD9FFE6C       JSR [0xfe6c]                      
  2cee  3510           PULS  X                           
  2cf0  39             RTS                               

; ---- function FUN_M7B_r3_08000__2cf1
FUN_M7B_r3_08000__2cf1:
  2cf1  3410           PSHS  X                           
  2cf3  8E2CA7         LDX #0x2ca7                        ; desc[API_FE6E]: ->$2D12 ->$2CF1
  2cf6  AD9FFE6E       JSR [0xfe6e]                      
  2cfa  3510           PULS  X                           
  2cfc  39             RTS                               
  2cfd  .db 14 6C 66 6F 20 74 68 72 65 73 68 3A 20 20 20 20  ; .lfo thresh:    
  2d0d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__2d12
FUN_M7B_r3_08000__2d12:
  2d12  3476           PSHS  U Y X B A                   
  2d14  8E2CA7         LDX #0x2ca7                       
  2d17  AD9FFE76       JSR [0xfe76]                      
  2d1b  FC71B0         LDD 0x71b0                        
  2d1e  C30029         ADDD #0x29                        
  2d21  58             LSLB                              
  2d22  49             ROLA                              
  2d23  C32D3E         ADDD #0x2d3e                      
  2d26  1F01           TFR D,X                           
  2d28  FC600D         LDD 0x600d                        
  2d2b  308B           LEAX D,X                          
  2d2d  EC84           LDD ,X                            
  2d2f  FD70D6         STD 0x70d6                        
  2d32  BE70D6         LDX 0x70d6                        
  2d35  108E3F74       LDY #0x3f74                       
  2d39  17E1F8         LBSR 0x0f34                       
  2d3c  35F6           PULS  A B X Y U PC                
  2d3e  .db 01 48 01 70 01 9D 01 CF 02 07 02 47 02 8E 02 DE  ; .H.p.......G....
  2d4e  .db 03 37 03 9B 04 0C 04 8B 05 18 05 B8 06 6A 07 33  ; .7...........j.3
  2d5e  .db 08 13 09 10 0A 2B 0B 68 0C CD 0E 5D 10 1D 12 14  ; .....+.h...]....
  2d6e  .db 14 49 16 C3 19 8A 1C A8 20 27 24 13 28 7A 2D 6A  ; .I...... '$.(z-j
  2d7e  .db 32 F5 39 2C 40 26 47 FA 50 C3 5A 9D 65 AC 72 14  ; 2.9,@&G.P.Z.e.r.
  2d8e  .db 7F FF 7F FF                                      ; ....
PTR_FUN_M7B_r3_08000__2dfd_M7B_r3_08000__2d92:
  2d92  2DFD           addr M7B_r3_08000::2dfd           
  2d94  2DDC           addr M7B_r3_08000::2ddc           
  2d96  .db 2D D0 70 8E 71 B2 00 00 71 B4 3F E9 40 A3 41 00  ; -.p.q...q.?.@.A.
  2da6  .db 00 75 30 00 01 02 06 1D 2D E8 00 00 00 00 00 00  ; .u0.....-.......
  2db6  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2db8
FUN_M7B_r3_08000__2db8:
  2db8  3410           PSHS  X                           
  2dba  8E2D92         LDX #0x2d92                        ; desc[API_FE6A]: ->$2DFD ->$2DDC
  2dbd  AD9FFE6A       JSR [0xfe6a]                      
  2dc1  3510           PULS  X                           
  2dc3  39             RTS                               

; ---- function FUN_M7B_r3_08000__2dc4
FUN_M7B_r3_08000__2dc4:
  2dc4  3410           PSHS  X                           
  2dc6  8E2D92         LDX #0x2d92                        ; desc[API_FDBC]: ->$2DFD ->$2DDC
  2dc9  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..-."
  2dcd  3510           PULS  X                           
  2dcf  39             RTS                               

; ---- function FUN_M7B_r3_08000__2dd0
FUN_M7B_r3_08000__2dd0:
  2dd0  3410           PSHS  X                           
  2dd2  8E2D92         LDX #0x2d92                        ; desc[API_FE6C]: ->$2DFD ->$2DDC
  2dd5  AD9FFE6C       JSR [0xfe6c]                      
  2dd9  3510           PULS  X                           
  2ddb  39             RTS                               

; ---- function FUN_M7B_r3_08000__2ddc
FUN_M7B_r3_08000__2ddc:
  2ddc  3410           PSHS  X                           
  2dde  8E2D92         LDX #0x2d92                        ; desc[API_FE6E]: ->$2DFD ->$2DDC
  2de1  AD9FFE6E       JSR [0xfe6e]                      
  2de5  3510           PULS  X                           
  2de7  39             RTS                               
  2de8  .db 14 6C 66 6F 20 6D 6F 64 3A 20 20 20 20 20 20 20  ; .lfo mod:       
  2df8  .db 20 20 48 7A 20                                   ;   Hz 

; ---- function FUN_M7B_r3_08000__2dfd
FUN_M7B_r3_08000__2dfd:
  2dfd  3476           PSHS  U Y X B A                   
  2dff  8E2D92         LDX #0x2d92                       
  2e02  AD9FFE76       JSR [0xfe76]                      
  2e06  FC71B4         LDD 0x71b4                        
  2e09  3606           PSHU  B A                         
  2e0b  CC0F38         LDD #0xf38                        
  2e0e  3606           PSHU  B A                         
  2e10  AD9FFCF2       JSR [0xfcf2]                      
  2e14  3706           PULU  A B                         
  2e16  FD70D6         STD 0x70d6                        
  2e19  BE70D6         LDX 0x70d6                        
  2e1c  108E3F72       LDY #0x3f72                       
  2e20  17E111         LBSR 0x0f34                       
  2e23  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__2ea2_M7B_r3_08000__2e25:
  2e25  2EA2           addr M7B_r3_08000::2ea2           
  2e27  2E6F           addr M7B_r3_08000::2e6f           
  2e29  .db 2E 63 70 90 71 B6 00 00 71 B8 3F E9 41 25 42 00  ; .cp.q...q.?.A%B.
  2e39  .db 00 27 10 00 01 01 06 1F 2E 7B 00 00 00 00 00 00  ; .'.......{......
  2e49  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2e4b
FUN_M7B_r3_08000__2e4b:
  2e4b  3410           PSHS  X                           
  2e4d  8E2E25         LDX #0x2e25                        ; desc[API_FE6A]: ->$2EA2 ->$2E6F
  2e50  AD9FFE6A       JSR [0xfe6a]                      
  2e54  3510           PULS  X                           
  2e56  39             RTS                               

; ---- function FUN_M7B_r3_08000__2e57
FUN_M7B_r3_08000__2e57:
  2e57  3410           PSHS  X                           
  2e59  8E2E25         LDX #0x2e25                        ; desc[API_FDBC]: ->$2EA2 ->$2E6F
  2e5c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...%"
  2e60  3510           PULS  X                           
  2e62  39             RTS                               

; ---- function FUN_M7B_r3_08000__2e63
FUN_M7B_r3_08000__2e63:
  2e63  3410           PSHS  X                           
  2e65  8E2E25         LDX #0x2e25                        ; desc[API_FE6C]: ->$2EA2 ->$2E6F
  2e68  AD9FFE6C       JSR [0xfe6c]                      
  2e6c  3510           PULS  X                           
  2e6e  39             RTS                               

; ---- function FUN_M7B_r3_08000__2e6f
FUN_M7B_r3_08000__2e6f:
  2e6f  3410           PSHS  X                           
  2e71  8E2E25         LDX #0x2e25                        ; desc[API_FE6E]: ->$2EA2 ->$2E6F
  2e74  AD9FFE6E       JSR [0xfe6e]                      
  2e78  3510           PULS  X                           
  2e7a  39             RTS                               
  2e7b  .db 14 65 6E 76 20 61 74 74 61 63 6B 3A 20 20 20 20  ; .env attack:    
  2e8b  .db 20 20 6D 73 20                                   ;   ms 

; ---- function FUN_M7B_r3_08000__2e90
FUN_M7B_r3_08000__2e90:
  2e90  3406           PSHS  B A                         
  2e92  17FFB6         LBSR 0x2e4b                       
  2e95  C605           LDB #0x5                          
  2e97  F76066         STB 0x6066                        
  2e9a  CC0064         LDD #0x64                         
  2e9d  FD60DC         STD 0x60dc                        
  2ea0  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__2ea2
FUN_M7B_r3_08000__2ea2:
  2ea2  3476           PSHS  U Y X B A                   
  2ea4  8E2E25         LDX #0x2e25                       
  2ea7  AD9FFE76       JSR [0xfe76]                      
  2eab  FC71B8         LDD 0x71b8                        
  2eae  17000F         LBSR 0x2ec0                       
  2eb1  FD70D6         STD 0x70d6                        
  2eb4  BE70D6         LDX 0x70d6                        
  2eb7  108E3F6C       LDY #0x3f6c                       
  2ebb  17E076         LBSR 0x0f34                       
  2ebe  35F6           PULS  A B X Y U PC                

; ---- function FUN_M7B_r3_08000__2ec0
FUN_M7B_r3_08000__2ec0:
  2ec0  3470           PSHS  U Y X                       
  2ec2  FD70D6         STD 0x70d6                        
  2ec5  FC70D6         LDD 0x70d6                        
  2ec8  1083000A       CMPD #0xa                         
  2ecc  102D0085       LBLT 0x2f55                       
  2ed0  FC70D6         LDD 0x70d6                        
  2ed3  10830064       CMPD #0x64                        
  2ed7  102D0055       LBLT 0x2f30                       
  2edb  FC70D6         LDD 0x70d6                        
  2ede  108303E8       CMPD #0x3e8                       
  2ee2  102D0025       LBLT 0x2f0b                       
  2ee6  FC70D6         LDD 0x70d6                        
  2ee9  3606           PSHU  B A                         
  2eeb  CC03E8         LDD #0x3e8                        
  2eee  3606           PSHU  B A                         
  2ef0  AD9FFCEA       JSR [0xfcea]                      
  2ef4  3706           PULU  A B                         
  2ef6  830001         SUBD #0x1                         
  2ef9  58             LSLB                              
  2efa  49             ROLA                              
  2efb  C32FA4         ADDD #0x2fa4                      
  2efe  F3600D         ADDD 0x600d                       
  2f01  1F01           TFR D,X                           
  2f03  EC84           LDD ,X                            
  2f05  FD70D6         STD 0x70d6                        
  2f08  16005F         LBRA 0x2f6a                       
LAB_M7B_r3_08000__2f0b:
  2f0b  FC70D6         LDD 0x70d6                        
  2f0e  3606           PSHU  B A                         
  2f10  CC0064         LDD #0x64                         
  2f13  3606           PSHU  B A                         
  2f15  AD9FFCEA       JSR [0xfcea]                      
  2f19  3706           PULU  A B                         
  2f1b  830001         SUBD #0x1                         
  2f1e  58             LSLB                              
  2f1f  49             ROLA                              
  2f20  C32F92         ADDD #0x2f92                      
  2f23  F3600D         ADDD 0x600d                       
  2f26  1F01           TFR D,X                           
  2f28  EC84           LDD ,X                            
  2f2a  FD70D6         STD 0x70d6                        
  2f2d  16003A         LBRA 0x2f6a                       
LAB_M7B_r3_08000__2f30:
  2f30  FC70D6         LDD 0x70d6                        
  2f33  3606           PSHU  B A                         
  2f35  CC000A         LDD #0xa                          
  2f38  3606           PSHU  B A                         
  2f3a  AD9FFCEA       JSR [0xfcea]                      
  2f3e  3706           PULU  A B                         
  2f40  830001         SUBD #0x1                         
  2f43  58             LSLB                              
  2f44  49             ROLA                              
  2f45  C32F80         ADDD #0x2f80                      
  2f48  F3600D         ADDD 0x600d                       
  2f4b  1F01           TFR D,X                           
  2f4d  EC84           LDD ,X                            
  2f4f  FD70D6         STD 0x70d6                        
  2f52  160015         LBRA 0x2f6a                       
LAB_M7B_r3_08000__2f55:
  2f55  FC70D6         LDD 0x70d6                        
  2f58  58             LSLB                              
  2f59  49             ROLA                              
  2f5a  C32F6C         ADDD #0x2f6c                      
  2f5d  F3600D         ADDD 0x600d                       
  2f60  1F01           TFR D,X                           
  2f62  EC84           LDD ,X                            
  2f64  FD70D6         STD 0x70d6                        
  2f67  160000         LBRA 0x2f6a                       
LAB_M7B_r3_08000__2f6a:
  2f6a  35F0           PULS  X Y U PC                    

; ---- function FUN_M7B_r3_08000__2f6c
FUN_M7B_r3_08000__2f6c:
  2f6c  7FFF4D         CLR 0xff4d                        
  2f6f  B82A5E         EORA 0x2a5e                       
  2f72  1D             SEX                               
  2f73  161624         LBRA 0x459a                       
  2f76  .db 11 DF 0E FB 0C E5 0B 52 0A 16 09 19 04 97 03 12  ; .......R........
  2f86  .db 02 4E 01 D9 01 8A 01 52 01 28 01 07 00 ED 00 76  ; .N.....R.(.....v
  2f96  .db 00 4F 00 3B 00 2F 00 28 00 22 00 1E 00 1A 00 18  ; .O.;./.(."......
  2fa6  .db 00 0C 00 08 00 06 00 05 00 04 00 03 00 03 00 03  ; ................
  2fb6  .db 00 02                                            ; ..
PTR_FUN_M7B_r3_08000__3035_M7B_r3_08000__2fb8:
  2fb8  3035           addr M7B_r3_08000::3035           
  2fba  3002           addr M7B_r3_08000::3002           
  2fbc  .db 2F F6 70 92 71 BA 00 00 71 BC 3F E9 41 27 43 00  ; /.p.q...q.?.A'C.
  2fcc  .db 00 27 10 00 01 01 06 1F 30 0E 00 00 00 00 00 00  ; .'......0.......
  2fdc  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__2fde
FUN_M7B_r3_08000__2fde:
  2fde  3410           PSHS  X                           
  2fe0  8E2FB8         LDX #0x2fb8                        ; desc[API_FE6A]: ->$3035 ->$3002
  2fe3  AD9FFE6A       JSR [0xfe6a]                      
  2fe7  3510           PULS  X                           
  2fe9  39             RTS                               

; ---- function FUN_M7B_r3_08000__2fea
FUN_M7B_r3_08000__2fea:
  2fea  3410           PSHS  X                           
  2fec  8E2FB8         LDX #0x2fb8                        ; desc[API_FDBC]: ->$3035 ->$3002
  2fef  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94../."
  2ff3  3510           PULS  X                           
  2ff5  39             RTS                               

; ---- function FUN_M7B_r3_08000__2ff6
FUN_M7B_r3_08000__2ff6:
  2ff6  3410           PSHS  X                           
  2ff8  8E2FB8         LDX #0x2fb8                        ; desc[API_FE6C]: ->$3035 ->$3002
  2ffb  AD9FFE6C       JSR [0xfe6c]                      
  2fff  3510           PULS  X                           
  3001  39             RTS                               

; ---- function FUN_M7B_r3_08000__3002
FUN_M7B_r3_08000__3002:
  3002  3410           PSHS  X                           
  3004  8E2FB8         LDX #0x2fb8                        ; desc[API_FE6E]: ->$3035 ->$3002
  3007  AD9FFE6E       JSR [0xfe6e]                      
  300b  3510           PULS  X                           
  300d  39             RTS                               
  300e  .db 14 65 6E 76 20 64 65 63 61 79 3A 20 20 20 20 20  ; .env decay:     
  301e  .db 20 20 6D 73 20                                   ;   ms 

; ---- function FUN_M7B_r3_08000__3023
FUN_M7B_r3_08000__3023:
  3023  3406           PSHS  B A                         
  3025  17FFB6         LBSR 0x2fde                       
  3028  C605           LDB #0x5                          
  302a  F76066         STB 0x6066                        
  302d  CC0064         LDD #0x64                         
  3030  FD60DC         STD 0x60dc                        
  3033  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__3035
FUN_M7B_r3_08000__3035:
  3035  3476           PSHS  U Y X B A                   
  3037  8E2FB8         LDX #0x2fb8                       
  303a  AD9FFE76       JSR [0xfe76]                      
  303e  FC71BC         LDD 0x71bc                        
  3041  17FE7C         LBSR 0x2ec0                       
  3044  FD70D6         STD 0x70d6                        
  3047  BE70D6         LDX 0x70d6                        
  304a  108E3F6D       LDY #0x3f6d                       
  304e  17DEE3         LBSR 0x0f34                       
  3051  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__30be_M7B_r3_08000__3053:
  3053  30BE           addr M7B_r3_08000::30be           
  3055  309D           addr M7B_r3_08000::309d           
  3057  .db 30 91 70 94 71 BE 00 00 71 C0 3F E9 41 29 44 FF  ; 0.p.q...q.?.A)D.
  3067  .db D8 00 00 00 01 00 03 1F 30 A9 00 00 00 00 00 00  ; ........0.......
  3077  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__3079
FUN_M7B_r3_08000__3079:
  3079  3410           PSHS  X                           
  307b  8E3053         LDX #0x3053                        ; desc[API_FE6A]: ->$30BE ->$309D
  307e  AD9FFE6A       JSR [0xfe6a]                      
  3082  3510           PULS  X                           
  3084  39             RTS                               

; ---- function FUN_M7B_r3_08000__3085
FUN_M7B_r3_08000__3085:
  3085  3410           PSHS  X                           
  3087  8E3053         LDX #0x3053                        ; desc[API_FDBC]: ->$30BE ->$309D
  308a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..0S"
  308e  3510           PULS  X                           
  3090  39             RTS                               

; ---- function FUN_M7B_r3_08000__3091
FUN_M7B_r3_08000__3091:
  3091  3410           PSHS  X                           
  3093  8E3053         LDX #0x3053                        ; desc[API_FE6C]: ->$30BE ->$309D
  3096  AD9FFE6C       JSR [0xfe6c]                      
  309a  3510           PULS  X                           
  309c  39             RTS                               

; ---- function FUN_M7B_r3_08000__309d
FUN_M7B_r3_08000__309d:
  309d  3410           PSHS  X                           
  309f  8E3053         LDX #0x3053                        ; desc[API_FE6E]: ->$30BE ->$309D
  30a2  AD9FFE6E       JSR [0xfe6e]                      
  30a6  3510           PULS  X                           
  30a8  39             RTS                               
  30a9  .db 14 74 68 72 65 73 68 6F 6C 64 3A 20 20 20 20 20  ; .threshold:     
  30b9  .db 64 42 20 20 20                                   ; dB   

; ---- function FUN_M7B_r3_08000__30be
FUN_M7B_r3_08000__30be:
  30be  3476           PSHS  U Y X B A                   
  30c0  8E3053         LDX #0x3053                       
  30c3  AD9FFE76       JSR [0xfe76]                      
  30c7  FC71C0         LDD 0x71c0                        
  30ca  3606           PSHU  B A                         
  30cc  CC0155         LDD #0x155                        
  30cf  3606           PSHU  B A                         
  30d1  AD9FFCEC       JSR [0xfcec]                      
  30d5  3706           PULU  A B                         
  30d7  FD70D6         STD 0x70d6                        
  30da  BE70D6         LDX 0x70d6                        
  30dd  108E3F6E       LDY #0x3f6e                       
  30e1  17DE50         LBSR 0x0f34                       
  30e4  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3169_M7B_r3_08000__30e6:
  30e6  3169           addr M7B_r3_08000::3169           
  30e8  3130           addr M7B_r3_08000::3130           
  30ea  .db 31 24 70 96 71 C2 00 00 71 C4 3F E9 41 2B 45 00  ; 1$p.q...q.?.A+E.
  30fa  .db 0A 03 E8 00 01 01 05 1A 31 54 00 00 00 00 70 98  ; ........1T....p.
  310a  .db 41 0B                                            ; A.

; ---- function FUN_M7B_r3_08000__310c
FUN_M7B_r3_08000__310c:
  310c  3410           PSHS  X                           
  310e  8E30E6         LDX #0x30e6                        ; desc[API_FE6A]: ->$3169 ->$3130
  3111  AD9FFE6A       JSR [0xfe6a]                      
  3115  3510           PULS  X                           
  3117  39             RTS                               

; ---- function FUN_M7B_r3_08000__3118
FUN_M7B_r3_08000__3118:
  3118  3410           PSHS  X                           
  311a  8E30E6         LDX #0x30e6                        ; desc[API_FDBC]: ->$3169 ->$3130
  311d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..0."
  3121  3510           PULS  X                           
  3123  39             RTS                               

; ---- function FUN_M7B_r3_08000__3124
FUN_M7B_r3_08000__3124:
  3124  3410           PSHS  X                           
  3126  8E30E6         LDX #0x30e6                        ; desc[API_FE6C]: ->$3169 ->$3130
  3129  AD9FFE6C       JSR [0xfe6c]                      
  312d  3510           PULS  X                           
  312f  39             RTS                               

; ---- function FUN_M7B_r3_08000__3130
FUN_M7B_r3_08000__3130:
  3130  3410           PSHS  X                           
  3132  8E30E6         LDX #0x30e6                        ; desc[API_FE6E]: ->$3169 ->$3130
  3135  AD9FFE6E       JSR [0xfe6e]                      
  3139  3510           PULS  X                           
  313b  39             RTS                               

; ---- function FUN_M7B_r3_08000__313c
FUN_M7B_r3_08000__313c:
  313c  3410           PSHS  X                           
  313e  8E30E6         LDX #0x30e6                        ; desc[API_FE1C]: ->$3169 ->$3130
  3141  AD9FFE1C       JSR [0xfe1c]                      
  3145  3510           PULS  X                           
  3147  39             RTS                               

; ---- function FUN_M7B_r3_08000__3148
FUN_M7B_r3_08000__3148:
  3148  3410           PSHS  X                           
  314a  8E30E6         LDX #0x30e6                        ; desc[API_FE1A]: ->$3169 ->$3130 $3124
  314d  AD9FFE1A       JSR [0xfe1a]                      
  3151  3510           PULS  X                           
  3153  39             RTS                               
  3154  .db 14 72 61 74 69 6F 3A 20 20 20 20 20 20 3A 31 20  ; .ratio:      :1 
  3164  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3169
FUN_M7B_r3_08000__3169:
  3169  3476           PSHS  U Y X B A                   
  316b  8E30E6         LDX #0x30e6                       
  316e  AD9FFE76       JSR [0xfe76]                      
  3172  CC7FFF         LDD #0x7fff                       
  3175  3606           PSHU  B A                         
  3177  FC71C4         LDD 0x71c4                        
  317a  3606           PSHU  B A                         
  317c  AD9FFCE6       JSR [0xfce6]                      
  3180  CC000A         LDD #0xa                          
  3183  3606           PSHU  B A                         
  3185  AD9FFCEC       JSR [0xfcec]                      
  3189  3706           PULU  A B                         
  318b  837FFF         SUBD #0x7fff                      
  318e  FD70D6         STD 0x70d6                        
  3191  BE70D6         LDX 0x70d6                        
  3194  108E3F6F       LDY #0x3f6f                       
  3198  17DD99         LBSR 0x0f34                       
  319b  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3208_M7B_r3_08000__319d:
  319d  3208           addr M7B_r3_08000::3208           
  319f  31E7           addr M7B_r3_08000::31e7           
  31a1  .db 31 DB 70 9A 71 C6 00 00 71 C8 3F E9 40 EB 46 FF  ; 1.p.q...q.?.@.F.
  31b1  .db 38 00 C8 00 01 00 04 1F 31 F3 00 00 00 00 00 00  ; 8.......1.......
  31c1  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__31c3
FUN_M7B_r3_08000__31c3:
  31c3  3410           PSHS  X                           
  31c5  8E319D         LDX #0x319d                        ; desc[API_FE6A]: ->$3208 ->$31E7
  31c8  AD9FFE6A       JSR [0xfe6a]                      
  31cc  3510           PULS  X                           
  31ce  39             RTS                               

; ---- function FUN_M7B_r3_08000__31cf
FUN_M7B_r3_08000__31cf:
  31cf  3410           PSHS  X                           
  31d1  8E319D         LDX #0x319d                        ; desc[API_FDBC]: ->$3208 ->$31E7
  31d4  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..1."
  31d8  3510           PULS  X                           
  31da  39             RTS                               

; ---- function FUN_M7B_r3_08000__31db
FUN_M7B_r3_08000__31db:
  31db  3410           PSHS  X                           
  31dd  8E319D         LDX #0x319d                        ; desc[API_FE6C]: ->$3208 ->$31E7
  31e0  AD9FFE6C       JSR [0xfe6c]                      
  31e4  3510           PULS  X                           
  31e6  39             RTS                               

; ---- function FUN_M7B_r3_08000__31e7
FUN_M7B_r3_08000__31e7:
  31e7  3410           PSHS  X                           
  31e9  8E319D         LDX #0x319d                        ; desc[API_FE6E]: ->$3208 ->$31E7
  31ec  AD9FFE6E       JSR [0xfe6e]                      
  31f0  3510           PULS  X                           
  31f2  39             RTS                               
  31f3  .db 14 61 6D 20 31 20 61 6D 6F 75 6E 74 3A 20 20 20  ; .am 1 amount:   
  3203  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7B_r3_08000__3208
FUN_M7B_r3_08000__3208:
  3208  3476           PSHS  U Y X B A                   
  320a  8E319D         LDX #0x319d                       
  320d  AD9FFE76       JSR [0xfe76]                      
  3211  FC71C8         LDD 0x71c8                        
  3214  3606           PSHU  B A                         
  3216  CC00A3         LDD #0xa3                         
  3219  3606           PSHU  B A                         
  321b  AD9FFCEC       JSR [0xfcec]                      
  321f  3706           PULU  A B                         
  3221  FD70D6         STD 0x70d6                        
  3224  BE70D6         LDX 0x70d6                        
  3227  108E3F54       LDY #0x3f54                       
  322b  17DD06         LBSR 0x0f34                       
  322e  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__329b_M7B_r3_08000__3230:
  3230  329B           addr M7B_r3_08000::329b           
  3232  327A           addr M7B_r3_08000::327a           
  3234  .db 32 6E 70 9C 71 CA 00 00 71 CC 3F E9 40 ED 47 FF  ; 2np.q...q.?.@.G.
  3244  .db 38 00 C8 00 01 00 04 1F 32 86 00 00 00 00 00 00  ; 8.......2.......
  3254  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__3256
FUN_M7B_r3_08000__3256:
  3256  3410           PSHS  X                           
  3258  8E3230         LDX #0x3230                        ; desc[API_FE6A]: ->$329B ->$327A
  325b  AD9FFE6A       JSR [0xfe6a]                      
  325f  3510           PULS  X                           
  3261  39             RTS                               

; ---- function FUN_M7B_r3_08000__3262
FUN_M7B_r3_08000__3262:
  3262  3410           PSHS  X                           
  3264  8E3230         LDX #0x3230                        ; desc[API_FDBC]: ->$329B ->$327A
  3267  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..20"
  326b  3510           PULS  X                           
  326d  39             RTS                               

; ---- function FUN_M7B_r3_08000__326e
FUN_M7B_r3_08000__326e:
  326e  3410           PSHS  X                           
  3270  8E3230         LDX #0x3230                        ; desc[API_FE6C]: ->$329B ->$327A
  3273  AD9FFE6C       JSR [0xfe6c]                      
  3277  3510           PULS  X                           
  3279  39             RTS                               

; ---- function FUN_M7B_r3_08000__327a
FUN_M7B_r3_08000__327a:
  327a  3410           PSHS  X                           
  327c  8E3230         LDX #0x3230                        ; desc[API_FE6E]: ->$329B ->$327A
  327f  AD9FFE6E       JSR [0xfe6e]                      
  3283  3510           PULS  X                           
  3285  39             RTS                               
  3286  .db 14 61 6D 20 32 20 61 6D 6F 75 6E 74 3A 20 20 20  ; .am 2 amount:   
  3296  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7B_r3_08000__329b
FUN_M7B_r3_08000__329b:
  329b  3476           PSHS  U Y X B A                   
  329d  8E3230         LDX #0x3230                       
  32a0  AD9FFE76       JSR [0xfe76]                      
  32a4  FC71CC         LDD 0x71cc                        
  32a7  3606           PSHU  B A                         
  32a9  CC00A3         LDD #0xa3                         
  32ac  3606           PSHU  B A                         
  32ae  AD9FFCEC       JSR [0xfcec]                      
  32b2  3706           PULU  A B                         
  32b4  FD70D6         STD 0x70d6                        
  32b7  BE70D6         LDX 0x70d6                        
  32ba  108E3F55       LDY #0x3f55                       
  32be  17DC73         LBSR 0x0f34                       
  32c1  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__332e_M7B_r3_08000__32c3:
  32c3  332E           addr M7B_r3_08000::332e           
  32c5  330D           addr M7B_r3_08000::330d           
  32c7  .db 33 01 70 9E 71 CE 00 00 71 D0 3F E9 40 EF 48 FF  ; 3.p.q...q.?.@.H.
  32d7  .db 38 00 C8 00 01 00 04 1F 33 19 00 00 00 00 00 00  ; 8.......3.......
  32e7  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__32e9
FUN_M7B_r3_08000__32e9:
  32e9  3410           PSHS  X                           
  32eb  8E32C3         LDX #0x32c3                        ; desc[API_FE6A]: ->$332E ->$330D
  32ee  AD9FFE6A       JSR [0xfe6a]                      
  32f2  3510           PULS  X                           
  32f4  39             RTS                               

; ---- function FUN_M7B_r3_08000__32f5
FUN_M7B_r3_08000__32f5:
  32f5  3410           PSHS  X                           
  32f7  8E32C3         LDX #0x32c3                        ; desc[API_FDBC]: ->$332E ->$330D
  32fa  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..2."
  32fe  3510           PULS  X                           
  3300  39             RTS                               

; ---- function FUN_M7B_r3_08000__3301
FUN_M7B_r3_08000__3301:
  3301  3410           PSHS  X                           
  3303  8E32C3         LDX #0x32c3                        ; desc[API_FE6C]: ->$332E ->$330D
  3306  AD9FFE6C       JSR [0xfe6c]                      
  330a  3510           PULS  X                           
  330c  39             RTS                               

; ---- function FUN_M7B_r3_08000__330d
FUN_M7B_r3_08000__330d:
  330d  3410           PSHS  X                           
  330f  8E32C3         LDX #0x32c3                        ; desc[API_FE6E]: ->$332E ->$330D
  3312  AD9FFE6E       JSR [0xfe6e]                      
  3316  3510           PULS  X                           
  3318  39             RTS                               
  3319  .db 14 61 6D 20 31 20 6F 66 66 73 65 74 3A 20 20 20  ; .am 1 offset:   
  3329  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7B_r3_08000__332e
FUN_M7B_r3_08000__332e:
  332e  3476           PSHS  U Y X B A                   
  3330  8E32C3         LDX #0x32c3                       
  3333  AD9FFE76       JSR [0xfe76]                      
  3337  FC71D0         LDD 0x71d0                        
  333a  3606           PSHU  B A                         
  333c  CC00A3         LDD #0xa3                         
  333f  3606           PSHU  B A                         
  3341  AD9FFCEC       JSR [0xfcec]                      
  3345  3706           PULU  A B                         
  3347  FD70D6         STD 0x70d6                        
  334a  BE70D6         LDX 0x70d6                        
  334d  108E3F56       LDY #0x3f56                       
  3351  17DBE0         LBSR 0x0f34                       
  3354  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__33c1_M7B_r3_08000__3356:
  3356  33C1           addr M7B_r3_08000::33c1           
  3358  33A0           addr M7B_r3_08000::33a0           
  335a  .db 33 94 70 A0 71 D2 00 00 71 D4 3F E9 40 F1 49 FF  ; 3.p.q...q.?.@.I.
  336a  .db 38 00 C8 00 01 00 04 1F 33 AC 00 00 00 00 00 00  ; 8.......3.......
  337a  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__337c
FUN_M7B_r3_08000__337c:
  337c  3410           PSHS  X                           
  337e  8E3356         LDX #0x3356                        ; desc[API_FE6A]: ->$33C1 ->$33A0
  3381  AD9FFE6A       JSR [0xfe6a]                      
  3385  3510           PULS  X                           
  3387  39             RTS                               

; ---- function FUN_M7B_r3_08000__3388
FUN_M7B_r3_08000__3388:
  3388  3410           PSHS  X                           
  338a  8E3356         LDX #0x3356                        ; desc[API_FDBC]: ->$33C1 ->$33A0
  338d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..3V"
  3391  3510           PULS  X                           
  3393  39             RTS                               

; ---- function FUN_M7B_r3_08000__3394
FUN_M7B_r3_08000__3394:
  3394  3410           PSHS  X                           
  3396  8E3356         LDX #0x3356                        ; desc[API_FE6C]: ->$33C1 ->$33A0
  3399  AD9FFE6C       JSR [0xfe6c]                      
  339d  3510           PULS  X                           
  339f  39             RTS                               

; ---- function FUN_M7B_r3_08000__33a0
FUN_M7B_r3_08000__33a0:
  33a0  3410           PSHS  X                           
  33a2  8E3356         LDX #0x3356                        ; desc[API_FE6E]: ->$33C1 ->$33A0
  33a5  AD9FFE6E       JSR [0xfe6e]                      
  33a9  3510           PULS  X                           
  33ab  39             RTS                               
  33ac  .db 14 61 6D 20 32 20 6F 66 66 73 65 74 3A 20 20 20  ; .am 2 offset:   
  33bc  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M7B_r3_08000__33c1
FUN_M7B_r3_08000__33c1:
  33c1  3476           PSHS  U Y X B A                   
  33c3  8E3356         LDX #0x3356                       
  33c6  AD9FFE76       JSR [0xfe76]                      
  33ca  FC71D4         LDD 0x71d4                        
  33cd  3606           PSHU  B A                         
  33cf  CC00A3         LDD #0xa3                         
  33d2  3606           PSHU  B A                         
  33d4  AD9FFCEC       JSR [0xfcec]                      
  33d8  3706           PULU  A B                         
  33da  FD70D6         STD 0x70d6                        
  33dd  BE70D6         LDX 0x70d6                        
  33e0  108E3F57       LDY #0x3f57                       
  33e4  17DB4D         LBSR 0x0f34                       
  33e7  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__346c_M7B_r3_08000__33e9:
  33e9  346C           addr M7B_r3_08000::346c           
  33eb  3433           addr M7B_r3_08000::3433           
  33ed  .db 34 27 70 A2 71 D6 00 00 71 D8 3F E9 41 15 4A FF  ; 4'p.q...q.?.A.J.
  33fd  .db 9C 00 64 00 01 00 04 1F 34 57 00 00 00 00 70 A4  ; ..d.....4W....p.
  340d  .db 41 2D                                            ; A-

; ---- function FUN_M7B_r3_08000__340f
FUN_M7B_r3_08000__340f:
  340f  3410           PSHS  X                           
  3411  8E33E9         LDX #0x33e9                        ; desc[API_FE6A]: ->$346C ->$3433
  3414  AD9FFE6A       JSR [0xfe6a]                      
  3418  3510           PULS  X                           
  341a  39             RTS                               

; ---- function FUN_M7B_r3_08000__341b
FUN_M7B_r3_08000__341b:
  341b  3410           PSHS  X                           
  341d  8E33E9         LDX #0x33e9                        ; desc[API_FDBC]: ->$346C ->$3433
  3420  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..3."
  3424  3510           PULS  X                           
  3426  39             RTS                               

; ---- function FUN_M7B_r3_08000__3427
FUN_M7B_r3_08000__3427:
  3427  3410           PSHS  X                           
  3429  8E33E9         LDX #0x33e9                        ; desc[API_FE6C]: ->$346C ->$3433
  342c  AD9FFE6C       JSR [0xfe6c]                      
  3430  3510           PULS  X                           
  3432  39             RTS                               

; ---- function FUN_M7B_r3_08000__3433
FUN_M7B_r3_08000__3433:
  3433  3410           PSHS  X                           
  3435  8E33E9         LDX #0x33e9                        ; desc[API_FE6E]: ->$346C ->$3433
  3438  AD9FFE6E       JSR [0xfe6e]                      
  343c  3510           PULS  X                           
  343e  39             RTS                               

; ---- function FUN_M7B_r3_08000__343f
FUN_M7B_r3_08000__343f:
  343f  3410           PSHS  X                           
  3441  8E33E9         LDX #0x33e9                        ; desc[API_FE1C]: ->$346C ->$3433
  3444  AD9FFE1C       JSR [0xfe1c]                      
  3448  3510           PULS  X                           
  344a  39             RTS                               

; ---- function FUN_M7B_r3_08000__344b
FUN_M7B_r3_08000__344b:
  344b  3410           PSHS  X                           
  344d  8E33E9         LDX #0x33e9                        ; desc[API_FE1A]: ->$346C ->$3433 $3427
  3450  AD9FFE1A       JSR [0xfe1a]                      
  3454  3510           PULS  X                           
  3456  39             RTS                               
  3457  .db 14 6D 69 78 31 20 61 3A 20 20 20 20 20 20 20 20  ; .mix1 a:        
  3467  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__346c
FUN_M7B_r3_08000__346c:
  346c  3476           PSHS  U Y X B A                   
  346e  8E33E9         LDX #0x33e9                       
  3471  AD9FFE76       JSR [0xfe76]                      
  3475  FC71D8         LDD 0x71d8                        
  3478  3606           PSHU  B A                         
  347a  AD9FFEC4       JSR [0xfec4]                      
  347e  3706           PULU  A B                         
  3480  FD70D6         STD 0x70d6                        
  3483  BE70D6         LDX 0x70d6                        
  3486  108E3F4C       LDY #0x3f4c                       
  348a  17DAA7         LBSR 0x0f34                       
  348d  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3512_M7B_r3_08000__348f:
  348f  3512           addr M7B_r3_08000::3512           
  3491  34D9           addr M7B_r3_08000::34d9           
  3493  .db 34 CD 70 A6 71 DA 00 00 71 DC 3F E9 41 17 4B FF  ; 4.p.q...q.?.A.K.
  34a3  .db 9C 00 64 00 01 00 04 1F 34 FD 00 00 00 00 70 A8  ; ..d.....4.....p.
  34b3  .db 41 2F                                            ; A/

; ---- function FUN_M7B_r3_08000__34b5
FUN_M7B_r3_08000__34b5:
  34b5  3410           PSHS  X                           
  34b7  8E348F         LDX #0x348f                        ; desc[API_FE6A]: ->$3512 ->$34D9
  34ba  AD9FFE6A       JSR [0xfe6a]                      
  34be  3510           PULS  X                           
  34c0  39             RTS                               

; ---- function FUN_M7B_r3_08000__34c1
FUN_M7B_r3_08000__34c1:
  34c1  3410           PSHS  X                           
  34c3  8E348F         LDX #0x348f                        ; desc[API_FDBC]: ->$3512 ->$34D9
  34c6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..4."
  34ca  3510           PULS  X                           
  34cc  39             RTS                               

; ---- function FUN_M7B_r3_08000__34cd
FUN_M7B_r3_08000__34cd:
  34cd  3410           PSHS  X                           
  34cf  8E348F         LDX #0x348f                        ; desc[API_FE6C]: ->$3512 ->$34D9
  34d2  AD9FFE6C       JSR [0xfe6c]                      
  34d6  3510           PULS  X                           
  34d8  39             RTS                               

; ---- function FUN_M7B_r3_08000__34d9
FUN_M7B_r3_08000__34d9:
  34d9  3410           PSHS  X                           
  34db  8E348F         LDX #0x348f                        ; desc[API_FE6E]: ->$3512 ->$34D9
  34de  AD9FFE6E       JSR [0xfe6e]                      
  34e2  3510           PULS  X                           
  34e4  39             RTS                               

; ---- function FUN_M7B_r3_08000__34e5
FUN_M7B_r3_08000__34e5:
  34e5  3410           PSHS  X                           
  34e7  8E348F         LDX #0x348f                        ; desc[API_FE1C]: ->$3512 ->$34D9
  34ea  AD9FFE1C       JSR [0xfe1c]                      
  34ee  3510           PULS  X                           
  34f0  39             RTS                               

; ---- function FUN_M7B_r3_08000__34f1
FUN_M7B_r3_08000__34f1:
  34f1  3410           PSHS  X                           
  34f3  8E348F         LDX #0x348f                        ; desc[API_FE1A]: ->$3512 ->$34D9 $34CD
  34f6  AD9FFE1A       JSR [0xfe1a]                      
  34fa  3510           PULS  X                           
  34fc  39             RTS                               
  34fd  .db 14 6D 69 78 31 20 62 3A 20 20 20 20 20 20 20 20  ; .mix1 b:        
  350d  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3512
FUN_M7B_r3_08000__3512:
  3512  3476           PSHS  U Y X B A                   
  3514  8E348F         LDX #0x348f                       
  3517  AD9FFE76       JSR [0xfe76]                      
  351b  FC71DC         LDD 0x71dc                        
  351e  3606           PSHU  B A                         
  3520  AD9FFEC4       JSR [0xfec4]                      
  3524  3706           PULU  A B                         
  3526  FD70D6         STD 0x70d6                        
  3529  BE70D6         LDX 0x70d6                        
  352c  108E3F4D       LDY #0x3f4d                       
  3530  17DA01         LBSR 0x0f34                       
  3533  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__35b8_M7B_r3_08000__3535:
  3535  35B8           addr M7B_r3_08000::35b8           
  3537  357F           addr M7B_r3_08000::357f           
  3539  .db 35 73 70 AA 71 DE 00 00 71 E0 3F E9 41 19 4C FF  ; 5sp.q...q.?.A.L.
  3549  .db 9C 00 64 00 01 00 04 1F 35 A3 00 00 00 00 70 AC  ; ..d.....5.....p.
  3559  .db 40 6C                                            ; @l

; ---- function FUN_M7B_r3_08000__355b
FUN_M7B_r3_08000__355b:
  355b  3410           PSHS  X                           
  355d  8E3535         LDX #0x3535                        ; desc[API_FE6A]: ->$35B8 ->$357F
  3560  AD9FFE6A       JSR [0xfe6a]                      
  3564  3510           PULS  X                           
  3566  39             RTS                               

; ---- function FUN_M7B_r3_08000__3567
FUN_M7B_r3_08000__3567:
  3567  3410           PSHS  X                           
  3569  8E3535         LDX #0x3535                        ; desc[API_FDBC]: ->$35B8 ->$357F
  356c  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..55"
  3570  3510           PULS  X                           
  3572  39             RTS                               

; ---- function FUN_M7B_r3_08000__3573
FUN_M7B_r3_08000__3573:
  3573  3410           PSHS  X                           
  3575  8E3535         LDX #0x3535                        ; desc[API_FE6C]: ->$35B8 ->$357F
  3578  AD9FFE6C       JSR [0xfe6c]                      
  357c  3510           PULS  X                           
  357e  39             RTS                               

; ---- function FUN_M7B_r3_08000__357f
FUN_M7B_r3_08000__357f:
  357f  3410           PSHS  X                           
  3581  8E3535         LDX #0x3535                        ; desc[API_FE6E]: ->$35B8 ->$357F
  3584  AD9FFE6E       JSR [0xfe6e]                      
  3588  3510           PULS  X                           
  358a  39             RTS                               

; ---- function FUN_M7B_r3_08000__358b
FUN_M7B_r3_08000__358b:
  358b  3410           PSHS  X                           
  358d  8E3535         LDX #0x3535                        ; desc[API_FE1C]: ->$35B8 ->$357F
  3590  AD9FFE1C       JSR [0xfe1c]                      
  3594  3510           PULS  X                           
  3596  39             RTS                               

; ---- function FUN_M7B_r3_08000__3597
FUN_M7B_r3_08000__3597:
  3597  3410           PSHS  X                           
  3599  8E3535         LDX #0x3535                        ; desc[API_FE1A]: ->$35B8 ->$357F $3573
  359c  AD9FFE1A       JSR [0xfe1a]                      
  35a0  3510           PULS  X                           
  35a2  39             RTS                               
  35a3  .db 14 6D 69 78 32 20 61 3A 20 20 20 20 20 20 20 20  ; .mix2 a:        
  35b3  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__35b8
FUN_M7B_r3_08000__35b8:
  35b8  3476           PSHS  U Y X B A                   
  35ba  8E3535         LDX #0x3535                       
  35bd  AD9FFE76       JSR [0xfe76]                      
  35c1  FC71E0         LDD 0x71e0                        
  35c4  3606           PSHU  B A                         
  35c6  AD9FFEC4       JSR [0xfec4]                      
  35ca  3706           PULU  A B                         
  35cc  FD70D6         STD 0x70d6                        
  35cf  BE70D6         LDX 0x70d6                        
  35d2  108E3F4E       LDY #0x3f4e                       
  35d6  17D95B         LBSR 0x0f34                       
  35d9  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__365e_M7B_r3_08000__35db:
  35db  365E           addr M7B_r3_08000::365e           
  35dd  3625           addr M7B_r3_08000::3625           
  35df  .db 36 19 70 AE 71 E2 00 00 71 E4 3F E9 41 1B 4D FF  ; 6.p.q...q.?.A.M.
  35ef  .db 9C 00 64 00 01 00 04 1F 36 49 00 00 00 00 70 B0  ; ..d.....6I....p.
  35ff  .db 40 6E                                            ; @n

; ---- function FUN_M7B_r3_08000__3601
FUN_M7B_r3_08000__3601:
  3601  3410           PSHS  X                           
  3603  8E35DB         LDX #0x35db                        ; desc[API_FE6A]: ->$365E ->$3625
  3606  AD9FFE6A       JSR [0xfe6a]                      
  360a  3510           PULS  X                           
  360c  39             RTS                               

; ---- function FUN_M7B_r3_08000__360d
FUN_M7B_r3_08000__360d:
  360d  3410           PSHS  X                           
  360f  8E35DB         LDX #0x35db                        ; desc[API_FDBC]: ->$365E ->$3625
  3612  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..5."
  3616  3510           PULS  X                           
  3618  39             RTS                               

; ---- function FUN_M7B_r3_08000__3619
FUN_M7B_r3_08000__3619:
  3619  3410           PSHS  X                           
  361b  8E35DB         LDX #0x35db                        ; desc[API_FE6C]: ->$365E ->$3625
  361e  AD9FFE6C       JSR [0xfe6c]                      
  3622  3510           PULS  X                           
  3624  39             RTS                               

; ---- function FUN_M7B_r3_08000__3625
FUN_M7B_r3_08000__3625:
  3625  3410           PSHS  X                           
  3627  8E35DB         LDX #0x35db                        ; desc[API_FE6E]: ->$365E ->$3625
  362a  AD9FFE6E       JSR [0xfe6e]                      
  362e  3510           PULS  X                           
  3630  39             RTS                               

; ---- function FUN_M7B_r3_08000__3631
FUN_M7B_r3_08000__3631:
  3631  3410           PSHS  X                           
  3633  8E35DB         LDX #0x35db                        ; desc[API_FE1C]: ->$365E ->$3625
  3636  AD9FFE1C       JSR [0xfe1c]                      
  363a  3510           PULS  X                           
  363c  39             RTS                               

; ---- function FUN_M7B_r3_08000__363d
FUN_M7B_r3_08000__363d:
  363d  3410           PSHS  X                           
  363f  8E35DB         LDX #0x35db                        ; desc[API_FE1A]: ->$365E ->$3625 $3619
  3642  AD9FFE1A       JSR [0xfe1a]                      
  3646  3510           PULS  X                           
  3648  39             RTS                               
  3649  .db 14 6D 69 78 32 20 62 3A 20 20 20 20 20 20 20 20  ; .mix2 b:        
  3659  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__365e
FUN_M7B_r3_08000__365e:
  365e  3476           PSHS  U Y X B A                   
  3660  8E35DB         LDX #0x35db                       
  3663  AD9FFE76       JSR [0xfe76]                      
  3667  FC71E4         LDD 0x71e4                        
  366a  3606           PSHU  B A                         
  366c  AD9FFEC4       JSR [0xfec4]                      
  3670  3706           PULU  A B                         
  3672  FD70D6         STD 0x70d6                        
  3675  BE70D6         LDX 0x70d6                        
  3678  108E3F4F       LDY #0x3f4f                       
  367c  17D8B5         LBSR 0x0f34                       
  367f  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3704_M7B_r3_08000__3681:
  3681  3704           addr M7B_r3_08000::3704           
  3683  36CB           addr M7B_r3_08000::36cb           
  3685  .db 36 BF 70 B2 71 E6 00 00 71 E8 3F E9 41 1D 4E FF  ; 6.p.q...q.?.A.N.
  3695  .db 9C 00 64 00 01 00 04 1F 36 EF 00 00 00 00 70 B4  ; ..d.....6.....p.
  36a5  .db 40 74                                            ; @t

; ---- function FUN_M7B_r3_08000__36a7
FUN_M7B_r3_08000__36a7:
  36a7  3410           PSHS  X                           
  36a9  8E3681         LDX #0x3681                        ; desc[API_FE6A]: ->$3704 ->$36CB
  36ac  AD9FFE6A       JSR [0xfe6a]                      
  36b0  3510           PULS  X                           
  36b2  39             RTS                               

; ---- function FUN_M7B_r3_08000__36b3
FUN_M7B_r3_08000__36b3:
  36b3  3410           PSHS  X                           
  36b5  8E3681         LDX #0x3681                        ; desc[API_FDBC]: ->$3704 ->$36CB
  36b8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..6."
  36bc  3510           PULS  X                           
  36be  39             RTS                               

; ---- function FUN_M7B_r3_08000__36bf
FUN_M7B_r3_08000__36bf:
  36bf  3410           PSHS  X                           
  36c1  8E3681         LDX #0x3681                        ; desc[API_FE6C]: ->$3704 ->$36CB
  36c4  AD9FFE6C       JSR [0xfe6c]                      
  36c8  3510           PULS  X                           
  36ca  39             RTS                               

; ---- function FUN_M7B_r3_08000__36cb
FUN_M7B_r3_08000__36cb:
  36cb  3410           PSHS  X                           
  36cd  8E3681         LDX #0x3681                        ; desc[API_FE6E]: ->$3704 ->$36CB
  36d0  AD9FFE6E       JSR [0xfe6e]                      
  36d4  3510           PULS  X                           
  36d6  39             RTS                               

; ---- function FUN_M7B_r3_08000__36d7
FUN_M7B_r3_08000__36d7:
  36d7  3410           PSHS  X                           
  36d9  8E3681         LDX #0x3681                        ; desc[API_FE1C]: ->$3704 ->$36CB
  36dc  AD9FFE1C       JSR [0xfe1c]                      
  36e0  3510           PULS  X                           
  36e2  39             RTS                               

; ---- function FUN_M7B_r3_08000__36e3
FUN_M7B_r3_08000__36e3:
  36e3  3410           PSHS  X                           
  36e5  8E3681         LDX #0x3681                        ; desc[API_FE1A]: ->$3704 ->$36CB $36BF
  36e8  AD9FFE1A       JSR [0xfe1a]                      
  36ec  3510           PULS  X                           
  36ee  39             RTS                               
  36ef  .db 14 6D 69 78 33 20 61 3A 20 20 20 20 20 20 20 20  ; .mix3 a:        
  36ff  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3704
FUN_M7B_r3_08000__3704:
  3704  3476           PSHS  U Y X B A                   
  3706  8E3681         LDX #0x3681                       
  3709  AD9FFE76       JSR [0xfe76]                      
  370d  FC71E8         LDD 0x71e8                        
  3710  3606           PSHU  B A                         
  3712  AD9FFEC4       JSR [0xfec4]                      
  3716  3706           PULU  A B                         
  3718  FD70D6         STD 0x70d6                        
  371b  BE70D6         LDX 0x70d6                        
  371e  108E3F50       LDY #0x3f50                       
  3722  17D80F         LBSR 0x0f34                       
  3725  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__37aa_M7B_r3_08000__3727:
  3727  37AA           addr M7B_r3_08000::37aa           
  3729  3771           addr M7B_r3_08000::3771           
  372b  .db 37 65 70 B6 71 EA 00 00 71 EC 3F E9 41 1F 4F FF  ; 7ep.q...q.?.A.O.
  373b  .db 9C 00 64 00 01 00 04 1F 37 95 00 00 00 00 70 B8  ; ..d.....7.....p.
  374b  .db 40 76                                            ; @v

; ---- function FUN_M7B_r3_08000__374d
FUN_M7B_r3_08000__374d:
  374d  3410           PSHS  X                           
  374f  8E3727         LDX #0x3727                        ; desc[API_FE6A]: ->$37AA ->$3771
  3752  AD9FFE6A       JSR [0xfe6a]                      
  3756  3510           PULS  X                           
  3758  39             RTS                               

; ---- function FUN_M7B_r3_08000__3759
FUN_M7B_r3_08000__3759:
  3759  3410           PSHS  X                           
  375b  8E3727         LDX #0x3727                        ; desc[API_FDBC]: ->$37AA ->$3771
  375e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..7'"
  3762  3510           PULS  X                           
  3764  39             RTS                               

; ---- function FUN_M7B_r3_08000__3765
FUN_M7B_r3_08000__3765:
  3765  3410           PSHS  X                           
  3767  8E3727         LDX #0x3727                        ; desc[API_FE6C]: ->$37AA ->$3771
  376a  AD9FFE6C       JSR [0xfe6c]                      
  376e  3510           PULS  X                           
  3770  39             RTS                               

; ---- function FUN_M7B_r3_08000__3771
FUN_M7B_r3_08000__3771:
  3771  3410           PSHS  X                           
  3773  8E3727         LDX #0x3727                        ; desc[API_FE6E]: ->$37AA ->$3771
  3776  AD9FFE6E       JSR [0xfe6e]                      
  377a  3510           PULS  X                           
  377c  39             RTS                               

; ---- function FUN_M7B_r3_08000__377d
FUN_M7B_r3_08000__377d:
  377d  3410           PSHS  X                           
  377f  8E3727         LDX #0x3727                        ; desc[API_FE1C]: ->$37AA ->$3771
  3782  AD9FFE1C       JSR [0xfe1c]                      
  3786  3510           PULS  X                           
  3788  39             RTS                               

; ---- function FUN_M7B_r3_08000__3789
FUN_M7B_r3_08000__3789:
  3789  3410           PSHS  X                           
  378b  8E3727         LDX #0x3727                        ; desc[API_FE1A]: ->$37AA ->$3771 $3765
  378e  AD9FFE1A       JSR [0xfe1a]                      
  3792  3510           PULS  X                           
  3794  39             RTS                               
  3795  .db 14 6D 69 78 33 20 62 3A 20 20 20 20 20 20 20 20  ; .mix3 b:        
  37a5  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__37aa
FUN_M7B_r3_08000__37aa:
  37aa  3476           PSHS  U Y X B A                   
  37ac  8E3727         LDX #0x3727                       
  37af  AD9FFE76       JSR [0xfe76]                      
  37b3  FC71EC         LDD 0x71ec                        
  37b6  3606           PSHU  B A                         
  37b8  AD9FFEC4       JSR [0xfec4]                      
  37bc  3706           PULU  A B                         
  37be  FD70D6         STD 0x70d6                        
  37c1  BE70D6         LDX 0x70d6                        
  37c4  108E3F51       LDY #0x3f51                       
  37c8  17D769         LBSR 0x0f34                       
  37cb  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3850_M7B_r3_08000__37cd:
  37cd  3850           addr M7B_r3_08000::3850           
  37cf  3817           addr M7B_r3_08000::3817           
  37d1  .db 38 0B 70 BA 71 EE 00 00 71 F0 3F E9 41 21 50 FF  ; 8.p.q...q.?.A!P.
  37e1  .db 9C 00 64 00 01 00 04 1F 38 3B 00 00 00 00 70 BC  ; ..d.....8;....p.
  37f1  .db 40 78                                            ; @x

; ---- function FUN_M7B_r3_08000__37f3
FUN_M7B_r3_08000__37f3:
  37f3  3410           PSHS  X                           
  37f5  8E37CD         LDX #0x37cd                        ; desc[API_FE6A]: ->$3850 ->$3817
  37f8  AD9FFE6A       JSR [0xfe6a]                      
  37fc  3510           PULS  X                           
  37fe  39             RTS                               

; ---- function FUN_M7B_r3_08000__37ff
FUN_M7B_r3_08000__37ff:
  37ff  3410           PSHS  X                           
  3801  8E37CD         LDX #0x37cd                        ; desc[API_FDBC]: ->$3850 ->$3817
  3804  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..7."
  3808  3510           PULS  X                           
  380a  39             RTS                               

; ---- function FUN_M7B_r3_08000__380b
FUN_M7B_r3_08000__380b:
  380b  3410           PSHS  X                           
  380d  8E37CD         LDX #0x37cd                        ; desc[API_FE6C]: ->$3850 ->$3817
  3810  AD9FFE6C       JSR [0xfe6c]                      
  3814  3510           PULS  X                           
  3816  39             RTS                               

; ---- function FUN_M7B_r3_08000__3817
FUN_M7B_r3_08000__3817:
  3817  3410           PSHS  X                           
  3819  8E37CD         LDX #0x37cd                        ; desc[API_FE6E]: ->$3850 ->$3817
  381c  AD9FFE6E       JSR [0xfe6e]                      
  3820  3510           PULS  X                           
  3822  39             RTS                               

; ---- function FUN_M7B_r3_08000__3823
FUN_M7B_r3_08000__3823:
  3823  3410           PSHS  X                           
  3825  8E37CD         LDX #0x37cd                        ; desc[API_FE1C]: ->$3850 ->$3817
  3828  AD9FFE1C       JSR [0xfe1c]                      
  382c  3510           PULS  X                           
  382e  39             RTS                               

; ---- function FUN_M7B_r3_08000__382f
FUN_M7B_r3_08000__382f:
  382f  3410           PSHS  X                           
  3831  8E37CD         LDX #0x37cd                        ; desc[API_FE1A]: ->$3850 ->$3817 $380B
  3834  AD9FFE1A       JSR [0xfe1a]                      
  3838  3510           PULS  X                           
  383a  39             RTS                               
  383b  .db 14 6D 69 78 34 20 61 3A 20 20 20 20 20 20 20 20  ; .mix4 a:        
  384b  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3850
FUN_M7B_r3_08000__3850:
  3850  3476           PSHS  U Y X B A                   
  3852  8E37CD         LDX #0x37cd                       
  3855  AD9FFE76       JSR [0xfe76]                      
  3859  FC71F0         LDD 0x71f0                        
  385c  3606           PSHU  B A                         
  385e  AD9FFEC4       JSR [0xfec4]                      
  3862  3706           PULU  A B                         
  3864  FD70D6         STD 0x70d6                        
  3867  BE70D6         LDX 0x70d6                        
  386a  108E3F52       LDY #0x3f52                       
  386e  17D6C3         LBSR 0x0f34                       
  3871  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__38f6_M7B_r3_08000__3873:
  3873  38F6           addr M7B_r3_08000::38f6           
  3875  38BD           addr M7B_r3_08000::38bd           
  3877  .db 38 B1 70 BE 71 F2 00 00 71 F4 3F E9 41 23 51 FF  ; 8.p.q...q.?.A#Q.
  3887  .db 9C 00 64 00 01 00 04 1F 38 E1 00 00 00 00 70 C0  ; ..d.....8.....p.
  3897  .db 40 7A                                            ; @z

; ---- function FUN_M7B_r3_08000__3899
FUN_M7B_r3_08000__3899:
  3899  3410           PSHS  X                           
  389b  8E3873         LDX #0x3873                        ; desc[API_FE6A]: ->$38F6 ->$38BD
  389e  AD9FFE6A       JSR [0xfe6a]                      
  38a2  3510           PULS  X                           
  38a4  39             RTS                               

; ---- function FUN_M7B_r3_08000__38a5
FUN_M7B_r3_08000__38a5:
  38a5  3410           PSHS  X                           
  38a7  8E3873         LDX #0x3873                        ; desc[API_FDBC]: ->$38F6 ->$38BD
  38aa  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..8s"
  38ae  3510           PULS  X                           
  38b0  39             RTS                               

; ---- function FUN_M7B_r3_08000__38b1
FUN_M7B_r3_08000__38b1:
  38b1  3410           PSHS  X                           
  38b3  8E3873         LDX #0x3873                        ; desc[API_FE6C]: ->$38F6 ->$38BD
  38b6  AD9FFE6C       JSR [0xfe6c]                      
  38ba  3510           PULS  X                           
  38bc  39             RTS                               

; ---- function FUN_M7B_r3_08000__38bd
FUN_M7B_r3_08000__38bd:
  38bd  3410           PSHS  X                           
  38bf  8E3873         LDX #0x3873                        ; desc[API_FE6E]: ->$38F6 ->$38BD
  38c2  AD9FFE6E       JSR [0xfe6e]                      
  38c6  3510           PULS  X                           
  38c8  39             RTS                               

; ---- function FUN_M7B_r3_08000__38c9
FUN_M7B_r3_08000__38c9:
  38c9  3410           PSHS  X                           
  38cb  8E3873         LDX #0x3873                        ; desc[API_FE1C]: ->$38F6 ->$38BD
  38ce  AD9FFE1C       JSR [0xfe1c]                      
  38d2  3510           PULS  X                           
  38d4  39             RTS                               

; ---- function FUN_M7B_r3_08000__38d5
FUN_M7B_r3_08000__38d5:
  38d5  3410           PSHS  X                           
  38d7  8E3873         LDX #0x3873                        ; desc[API_FE1A]: ->$38F6 ->$38BD $38B1
  38da  AD9FFE1A       JSR [0xfe1a]                      
  38de  3510           PULS  X                           
  38e0  39             RTS                               
  38e1  .db 14 6D 69 78 34 20 62 3A 20 20 20 20 20 20 20 20  ; .mix4 b:        
  38f1  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__38f6
FUN_M7B_r3_08000__38f6:
  38f6  3476           PSHS  U Y X B A                   
  38f8  8E3873         LDX #0x3873                       
  38fb  AD9FFE76       JSR [0xfe76]                      
  38ff  FC71F4         LDD 0x71f4                        
  3902  3606           PSHU  B A                         
  3904  AD9FFEC4       JSR [0xfec4]                      
  3908  3706           PULU  A B                         
  390a  FD70D6         STD 0x70d6                        
  390d  BE70D6         LDX 0x70d6                        
  3910  108E3F53       LDY #0x3f53                       
  3914  17D61D         LBSR 0x0f34                       
  3917  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__399c_M7B_r3_08000__3919:
  3919  399C           addr M7B_r3_08000::399c           
  391b  3963           addr M7B_r3_08000::3963           
  391d  .db 39 57 70 C2 71 F6 00 00 71 F8 3F E9 41 33 52 FC  ; 9Wp.q...q.?.A3R.
  392d  .db 18 03 E8 00 01 01 06 1F 39 87 00 00 00 00 70 C4  ; ........9.....p.
  393d  .db 40 68                                            ; @h

; ---- function FUN_M7B_r3_08000__393f
FUN_M7B_r3_08000__393f:
  393f  3410           PSHS  X                           
  3941  8E3919         LDX #0x3919                        ; desc[API_FE6A]: ->$399C ->$3963
  3944  AD9FFE6A       JSR [0xfe6a]                      
  3948  3510           PULS  X                           
  394a  39             RTS                               

; ---- function FUN_M7B_r3_08000__394b
FUN_M7B_r3_08000__394b:
  394b  3410           PSHS  X                           
  394d  8E3919         LDX #0x3919                        ; desc[API_FDBC]: ->$399C ->$3963
  3950  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..9."
  3954  3510           PULS  X                           
  3956  39             RTS                               

; ---- function FUN_M7B_r3_08000__3957
FUN_M7B_r3_08000__3957:
  3957  3410           PSHS  X                           
  3959  8E3919         LDX #0x3919                        ; desc[API_FE6C]: ->$399C ->$3963
  395c  AD9FFE6C       JSR [0xfe6c]                      
  3960  3510           PULS  X                           
  3962  39             RTS                               

; ---- function FUN_M7B_r3_08000__3963
FUN_M7B_r3_08000__3963:
  3963  3410           PSHS  X                           
  3965  8E3919         LDX #0x3919                        ; desc[API_FE6E]: ->$399C ->$3963
  3968  AD9FFE6E       JSR [0xfe6e]                      
  396c  3510           PULS  X                           
  396e  39             RTS                               

; ---- function FUN_M7B_r3_08000__396f
FUN_M7B_r3_08000__396f:
  396f  3410           PSHS  X                           
  3971  8E3919         LDX #0x3919                        ; desc[API_FE1C]: ->$399C ->$3963
  3974  AD9FFE1C       JSR [0xfe1c]                      
  3978  3510           PULS  X                           
  397a  39             RTS                               

; ---- function FUN_M7B_r3_08000__397b
FUN_M7B_r3_08000__397b:
  397b  3410           PSHS  X                           
  397d  8E3919         LDX #0x3919                        ; desc[API_FE1A]: ->$399C ->$3963 $3957
  3980  AD9FFE1A       JSR [0xfe1a]                      
  3984  3510           PULS  X                           
  3986  39             RTS                               
  3987  .db 14 6D 6F 64 20 73 63 61 6C 65 20 31 3A 20 20 20  ; .mod scale 1:   
  3997  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M7B_r3_08000__399c
FUN_M7B_r3_08000__399c:
  399c  3476           PSHS  U Y X B A                   
  399e  8E3919         LDX #0x3919                       
  39a1  AD9FFE76       JSR [0xfe76]                      
  39a5  FC71F8         LDD 0x71f8                        
  39a8  3606           PSHU  B A                         
  39aa  AD9FFEC6       JSR [0xfec6]                      
  39ae  3706           PULU  A B                         
  39b0  FD70D6         STD 0x70d6                        
  39b3  BE70D6         LDX 0x70d6                        
  39b6  108E3F8A       LDY #0x3f8a                       
  39ba  17D577         LBSR 0x0f34                       
  39bd  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3a42_M7B_r3_08000__39bf:
  39bf  3A42           addr M7B_r3_08000::3a42           
  39c1  3A09           addr M7B_r3_08000::3a09           
  39c3  .db 39 FD 70 C6 71 FA 00 00 71 FC 3F E9 41 35 53 FC  ; 9.p.q...q.?.A5S.
  39d3  .db 18 03 E8 00 01 01 06 1F 3A 2D 00 00 00 00 70 C8  ; ........:-....p.
  39e3  .db 40 6A                                            ; @j

; ---- function FUN_M7B_r3_08000__39e5
FUN_M7B_r3_08000__39e5:
  39e5  3410           PSHS  X                           
  39e7  8E39BF         LDX #0x39bf                        ; desc[API_FE6A]: ->$3A42 ->$3A09
  39ea  AD9FFE6A       JSR [0xfe6a]                      
  39ee  3510           PULS  X                           
  39f0  39             RTS                               

; ---- function FUN_M7B_r3_08000__39f1
FUN_M7B_r3_08000__39f1:
  39f1  3410           PSHS  X                           
  39f3  8E39BF         LDX #0x39bf                        ; desc[API_FDBC]: ->$3A42 ->$3A09
  39f6  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94..9."
  39fa  3510           PULS  X                           
  39fc  39             RTS                               

; ---- function FUN_M7B_r3_08000__39fd
FUN_M7B_r3_08000__39fd:
  39fd  3410           PSHS  X                           
  39ff  8E39BF         LDX #0x39bf                        ; desc[API_FE6C]: ->$3A42 ->$3A09
  3a02  AD9FFE6C       JSR [0xfe6c]                      
  3a06  3510           PULS  X                           
  3a08  39             RTS                               

; ---- function FUN_M7B_r3_08000__3a09
FUN_M7B_r3_08000__3a09:
  3a09  3410           PSHS  X                           
  3a0b  8E39BF         LDX #0x39bf                        ; desc[API_FE6E]: ->$3A42 ->$3A09
  3a0e  AD9FFE6E       JSR [0xfe6e]                      
  3a12  3510           PULS  X                           
  3a14  39             RTS                               

; ---- function FUN_M7B_r3_08000__3a15
FUN_M7B_r3_08000__3a15:
  3a15  3410           PSHS  X                           
  3a17  8E39BF         LDX #0x39bf                        ; desc[API_FE1C]: ->$3A42 ->$3A09
  3a1a  AD9FFE1C       JSR [0xfe1c]                      
  3a1e  3510           PULS  X                           
  3a20  39             RTS                               

; ---- function FUN_M7B_r3_08000__3a21
FUN_M7B_r3_08000__3a21:
  3a21  3410           PSHS  X                           
  3a23  8E39BF         LDX #0x39bf                        ; desc[API_FE1A]: ->$3A42 ->$3A09 $39FD
  3a26  AD9FFE1A       JSR [0xfe1a]                      
  3a2a  3510           PULS  X                           
  3a2c  39             RTS                               
  3a2d  .db 14 6D 6F 64 20 73 63 61 6C 65 20 32 3A 20 20 20  ; .mod scale 2:   
  3a3d  .db 20 20 25 20 20                                   ;   %  

; ---- function FUN_M7B_r3_08000__3a42
FUN_M7B_r3_08000__3a42:
  3a42  3476           PSHS  U Y X B A                   
  3a44  8E39BF         LDX #0x39bf                       
  3a47  AD9FFE76       JSR [0xfe76]                      
  3a4b  FC71FC         LDD 0x71fc                        
  3a4e  3606           PSHU  B A                         
  3a50  AD9FFEC6       JSR [0xfec6]                      
  3a54  3706           PULU  A B                         
  3a56  FD70D6         STD 0x70d6                        
  3a59  BE70D6         LDX 0x70d6                        
  3a5c  108E3F8B       LDY #0x3f8b                       
  3a60  17D4D1         LBSR 0x0f34                       
  3a63  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3ad0_M7B_r3_08000__3a65:
  3a65  3AD0           addr M7B_r3_08000::3ad0           
  3a67  3AAF           addr M7B_r3_08000::3aaf           
  3a69  .db 3A A3 70 CA 71 FE 00 00 72 00 3F E9 40 02 54 FF  ; :.p.q...r.?.@.T.
  3a79  .db D0 00 30 00 01 00 03 1C 3A BB 00 00 00 00 00 00  ; ..0.....:.......
  3a89  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__3a8b
FUN_M7B_r3_08000__3a8b:
  3a8b  3410           PSHS  X                           
  3a8d  8E3A65         LDX #0x3a65                       
  3a90  AD9FFE74       JSR [0xfe74]                      
  3a94  3510           PULS  X                           
  3a96  39             RTS                               

; ---- function FUN_M7B_r3_08000__3a97
FUN_M7B_r3_08000__3a97:
  3a97  3410           PSHS  X                           
  3a99  8E3A65         LDX #0x3a65                        ; desc[API_FE22]: ->$3AD0 ->$3AAF
  3a9c  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3aa0  3510           PULS  X                           
  3aa2  39             RTS                               

; ---- function FUN_M7B_r3_08000__3aa3
FUN_M7B_r3_08000__3aa3:
  3aa3  3410           PSHS  X                           
  3aa5  8E3A65         LDX #0x3a65                       
  3aa8  AD9FFE70       JSR [0xfe70]                      
  3aac  3510           PULS  X                           
  3aae  39             RTS                               

; ---- function FUN_M7B_r3_08000__3aaf
FUN_M7B_r3_08000__3aaf:
  3aaf  3410           PSHS  X                           
  3ab1  8E3A65         LDX #0x3a65                       
  3ab4  AD9FFE72       JSR [0xfe72]                      
  3ab8  3510           PULS  X                           
  3aba  39             RTS                               
  3abb  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  3acb  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3ad0
FUN_M7B_r3_08000__3ad0:
  3ad0  3476           PSHS  U Y X B A                   
  3ad2  8E3A65         LDX #0x3a65                       
  3ad5  AD9FFE76       JSR [0xfe76]                      
  3ad9  AD9FFE52       JSR [0xfe52]                      
  3add  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3b4a_M7B_r3_08000__3adf:
  3adf  3B4A           addr M7B_r3_08000::3b4a           
  3ae1  3B29           addr M7B_r3_08000::3b29           
  3ae3  .db 3B 1D 70 CC 72 02 00 00 72 04 3F E9 40 03 55 FF  ; ;.p.r...r.?.@.U.
  3af3  .db D0 00 30 00 01 00 03 1D 3B 35 00 00 00 00 00 00  ; ..0.....;5......
  3b03  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__3b05
FUN_M7B_r3_08000__3b05:
  3b05  3410           PSHS  X                           
  3b07  8E3ADF         LDX #0x3adf                       
  3b0a  AD9FFE74       JSR [0xfe74]                      
  3b0e  3510           PULS  X                           
  3b10  39             RTS                               

; ---- function FUN_M7B_r3_08000__3b11
FUN_M7B_r3_08000__3b11:
  3b11  3410           PSHS  X                           
  3b13  8E3ADF         LDX #0x3adf                        ; desc[API_FE22]: ->$3B4A ->$3B29
  3b16  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3b1a  3510           PULS  X                           
  3b1c  39             RTS                               

; ---- function FUN_M7B_r3_08000__3b1d
FUN_M7B_r3_08000__3b1d:
  3b1d  3410           PSHS  X                           
  3b1f  8E3ADF         LDX #0x3adf                       
  3b22  AD9FFE70       JSR [0xfe70]                      
  3b26  3510           PULS  X                           
  3b28  39             RTS                               

; ---- function FUN_M7B_r3_08000__3b29
FUN_M7B_r3_08000__3b29:
  3b29  3410           PSHS  X                           
  3b2b  8E3ADF         LDX #0x3adf                       
  3b2e  AD9FFE72       JSR [0xfe72]                      
  3b32  3510           PULS  X                           
  3b34  39             RTS                               
  3b35  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  3b45  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3b4a
FUN_M7B_r3_08000__3b4a:
  3b4a  3476           PSHS  U Y X B A                   
  3b4c  8E3ADF         LDX #0x3adf                       
  3b4f  AD9FFE76       JSR [0xfe76]                      
  3b53  AD9FFE54       JSR [0xfe54]                      
  3b57  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3bc4_M7B_r3_08000__3b59:
  3b59  3BC4           addr M7B_r3_08000::3bc4           
  3b5b  3BA3           addr M7B_r3_08000::3ba3           
  3b5d  .db 3B 97 70 CE 72 06 00 00 72 08 3F E9 40 04 56 FF  ; ;.p.r...r.?.@.V.
  3b6d  .db D0 00 30 00 01 00 03 1D 3B AF 00 00 00 00 00 00  ; ..0.....;.......
  3b7d  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__3b7f
FUN_M7B_r3_08000__3b7f:
  3b7f  3410           PSHS  X                           
  3b81  8E3B59         LDX #0x3b59                       
  3b84  AD9FFE74       JSR [0xfe74]                      
  3b88  3510           PULS  X                           
  3b8a  39             RTS                               

; ---- function FUN_M7B_r3_08000__3b8b
FUN_M7B_r3_08000__3b8b:
  3b8b  3410           PSHS  X                           
  3b8d  8E3B59         LDX #0x3b59                        ; desc[API_FE22]: ->$3BC4 ->$3BA3
  3b90  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3b94  3510           PULS  X                           
  3b96  39             RTS                               

; ---- function FUN_M7B_r3_08000__3b97
FUN_M7B_r3_08000__3b97:
  3b97  3410           PSHS  X                           
  3b99  8E3B59         LDX #0x3b59                       
  3b9c  AD9FFE70       JSR [0xfe70]                      
  3ba0  3510           PULS  X                           
  3ba2  39             RTS                               

; ---- function FUN_M7B_r3_08000__3ba3
FUN_M7B_r3_08000__3ba3:
  3ba3  3410           PSHS  X                           
  3ba5  8E3B59         LDX #0x3b59                       
  3ba8  AD9FFE72       JSR [0xfe72]                      
  3bac  3510           PULS  X                           
  3bae  39             RTS                               
  3baf  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  3bbf  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M7B_r3_08000__3bc4
FUN_M7B_r3_08000__3bc4:
  3bc4  3476           PSHS  U Y X B A                   
  3bc6  8E3B59         LDX #0x3b59                       
  3bc9  AD9FFE76       JSR [0xfe76]                      
  3bcd  AD9FFE56       JSR [0xfe56]                      
  3bd1  35F6           PULS  A B X Y U PC                
PTR_FUN_M7B_r3_08000__3c3e_M7B_r3_08000__3bd3:
  3bd3  3C3E           addr M7B_r3_08000::3c3e           
  3bd5  3C1D           addr M7B_r3_08000::3c1d           
  3bd7  .db 3C 11 70 D0 72 0A 00 00 72 0C 3F E9 40 05 57 FF  ; <.p.r...r.?.@.W.
  3be7  .db D0 00 30 00 01 00 03 1E 3C 29 00 00 00 00 00 00  ; ..0.....<)......
  3bf7  .db 00 00                                            ; ..

; ---- function FUN_M7B_r3_08000__3bf9
FUN_M7B_r3_08000__3bf9:
  3bf9  3410           PSHS  X                           
  3bfb  8E3BD3         LDX #0x3bd3                       
  3bfe  AD9FFE74       JSR [0xfe74]                      
  3c02  3510           PULS  X                           
  3c04  39             RTS                               

; ---- function FUN_M7B_r3_08000__3c05
FUN_M7B_r3_08000__3c05:
  3c05  3410           PSHS  X                           
  3c07  8E3BD3         LDX #0x3bd3                        ; desc[API_FE22]: ->$3C3E ->$3C1D
  3c0a  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  3c0e  3510           PULS  X                           
  3c10  39             RTS                               

; ---- function FUN_M7B_r3_08000__3c11
FUN_M7B_r3_08000__3c11:
  3c11  3410           PSHS  X                           
  3c13  8E3BD3         LDX #0x3bd3                       
  3c16  AD9FFE70       JSR [0xfe70]                      
  3c1a  3510           PULS  X                           
  3c1c  39             RTS                               

; ---- function FUN_M7B_r3_08000__3c1d
FUN_M7B_r3_08000__3c1d:
  3c1d  3410           PSHS  X                           
  3c1f  8E3BD3         LDX #0x3bd3                       
  3c22  AD9FFE72       JSR [0xfe72]                      
  3c26  3510           PULS  X                           
  3c28  39             RTS                               
  3c29  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  3c39  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M7B_r3_08000__3c3e
FUN_M7B_r3_08000__3c3e:
  3c3e  3476           PSHS  U Y X B A                   
  3c40  8E3BD3         LDX #0x3bd3                       
  3c43  AD9FFE76       JSR [0xfe76]                      
  3c47  AD9FFE58       JSR [0xfe58]                      
  3c4b  35F6           PULS  A B X Y U PC                
  3c4d  3CB73C973C8B   addr[3]                           
  3c53  .db 70 D2 72 0E 00 00 72 10 3F E9 41 0F 58 00 00 00  ; p.r...r.?.A.X...
  3c63  .db 01 00 01 00 04 24 3C A3 00 00 3C C2 00 00 00 00  ; .....$<...<.....

; ---- function FUN_M7B_r3_08000__3c73
FUN_M7B_r3_08000__3c73:
  3c73  3410           PSHS  X                           
  3c75  8E3C4D         LDX #0x3c4d                       
  3c78  AD9FFC4E       JSR [0xfc4e]                      
  3c7c  3510           PULS  X                           
  3c7e  39             RTS                               

; ---- function FUN_M7B_r3_08000__3c7f
FUN_M7B_r3_08000__3c7f:
  3c7f  3410           PSHS  X                           
  3c81  8E3C4D         LDX #0x3c4d                       
  3c84  AD9FFC4C       JSR [0xfc4c]                      
  3c88  3510           PULS  X                           
  3c8a  39             RTS                               

; ---- function FUN_M7B_r3_08000__3c8b
FUN_M7B_r3_08000__3c8b:
  3c8b  3410           PSHS  X                           
  3c8d  8E3C4D         LDX #0x3c4d                       
  3c90  AD9FFC50       JSR [0xfc50]                      
  3c94  3510           PULS  X                           
  3c96  39             RTS                               

; ---- function FUN_M7B_r3_08000__3c97
FUN_M7B_r3_08000__3c97:
  3c97  3410           PSHS  X                           
  3c99  8E3C4D         LDX #0x3c4d                       
  3c9c  AD9FFC52       JSR [0xfc52]                      
  3ca0  3510           PULS  X                           
  3ca2  39             RTS                               
  3ca3  .db 14 70 72 67 20 6C 6F 61 64 20 73 70 65 65 64 3A  ; .prg load speed:
  3cb3  .db 20 20 20 20                                      ;     

; ---- function FUN_M7B_r3_08000__3cb7
FUN_M7B_r3_08000__3cb7:
  3cb7  3476           PSHS  U Y X B A                   
  3cb9  8E3C4D         LDX #0x3c4d                       
  3cbc  AD9FFE76       JSR [0xfe76]                      
  3cc0  35F6           PULS  A B X Y U PC                
  3cc2  .db 73 6C 6F 77 66 61 73 74                          ; slowfast

; ---- function FUN_M7B_r3_08000__3cca
FUN_M7B_r3_08000__3cca:
  3cca  3437           PSHS  Y X B A CC                  
  3ccc  3706           PULU  A B                         
  3cce  FD70DA         STD 0x70da                        
  3cd1  3706           PULU  A B                         
  3cd3  FD70DC         STD 0x70dc                        
  3cd6  FC70DC         LDD 0x70dc                        
  3cd9  C30030         ADDD #0x30                        
  3cdc  58             LSLB                              
  3cdd  49             ROLA                              
  3cde  F3600D         ADDD 0x600d                       
  3ce1  C33D18         ADDD #0x3d18                      
  3ce4  1F01           TFR D,X                           
  3ce6  FC70DA         LDD 0x70da                        
  3ce9  FD70D8         STD 0x70d8                        
  3cec  2E07           BGT 0x3cf5                        
  3cee  4F             CLRA                              
  3cef  5F             CLRB                              
  3cf0  B370D8         SUBD 0x70d8                       
  3cf3  2008           BRA 0x3cfd                        
LAB_M7B_r3_08000__3cf5:
  3cf5  CC0064         LDD #0x64                         
  3cf8  B370D8         SUBD 0x70d8                       
  3cfb  3002           LEAX 0x2,X                        
LAB_M7B_r3_08000__3cfd:
  3cfd  58             LSLB                              
  3cfe  49             ROLA                              
  3cff  F3600D         ADDD 0x600d                       
  3d02  C33DC4         ADDD #0x3dc4                      
  3d05  1F02           TFR D,Y                           
  3d07  EC84           LDD ,X                            
  3d09  3606           PSHU  B A                         
  3d0b  ECA4           LDD ,Y                            
  3d0d  3606           PSHU  B A                         
  3d0f  AD9FFCF2       JSR [0xfcf2]                      
  3d13  3537           PULS CC A B X Y                   
  3d15  39             RTS                               
  3d16  .db 00 3B                                            ; .;
DAT_M7B_r3_08000__3d18:
  3d18  00             ?? 00h                            
  3d19  .db 3F                                               ; ?
DAT_M7B_r3_08000__3d1a:
  3d1a  00             ?? 00h                            
  3d1b  .db 42 00 46 00 4A 00 4F 00 54 00 59 00 5E 00 63 00  ; B.F.J.O.T.Y.^.c.
  3d2b  .db 69 00 6F 00 76 00 7D 00 85 00 8C 00 95 00 9E 00  ; i.o.v.}.........
  3d3b  .db A7 00 B1 00 BC 00 C6 00 D2 00 DF 00 EC 00 FA 01  ; ................
  3d4b  .db 09 01 19 01 29 01 3B 01 4E 01 62 01 77 01 8D 01  ; ....).;.N.b.w...
  3d5b  .db A4 01 BD 01 D8 01 F4 02 12 02 31 02 53 02 76 02  ; ..........1.S.v.
  3d6b  .db 9B 02 C3 02 ED 03 1A 03 49 03 7B 03 B0 03 E8 04  ; ........I.{.....
  3d7b  .db 23 04 62 04 A5 04 EC 05 37 05 86 05 DA 06 33 06  ; #.b.....7.....3.
  3d8b  .db 92 06 F6 07 60 07 D0 08 47 08 C4 09 4A 09 D8 0A  ; ....`...G...J...
  3d9b  .db 6E 0B 0C 0B B4 0C 66 0D 24 0D EC 0E C0 0F A0 10  ; n.....f.$.......
  3dab  .db 8E 11 88 12 94 13 B0 14 DC 16 18 17 68 18 CC 1A  ; ............h...
  3dbb  .db 48 1B D8 1D 80 1F 40 21 1C                       ; H.....@!.
DAT_M7B_r3_08000__3dc4:
  3dc4  7F             ?? 7Fh                           
  3dc5  .db FF 7F EC 7F D9 7F C6 7F B3 7F A0 7F 8D 7F 7A 7F  ; ..............z.
  3dd5  .db 67 7F 55 7F 42 7F 39 7F 1C 7F 09 7E F7 7E E4 7E  ; g.U.B.9....~.~.~
  3de5  .db D1 7E BE 7E AC 7E 99 7E 86 7E 73 7E 61 7E 4E 7E  ; .~.~.~.~.~s~a~N~
  3df5  .db 3B 7E 29 7E 16 7E 03 7D F1 7D DE 7D CC 7D B9 7D  ; ;~)~.~.}.}.}.}.}
  3e05  .db A6 7D 94 7D 81 7D 6F 7D 52 7D 4A 7D 37 7D 25 7D  ; .}.}.}o}R}J}7}%}
  3e15  .db 12 7D 00 7C ED 7C DB 7C C8 7C B6 7C A3 7C 91 7C  ; .}.|.|.|.|.|.|.|
  3e25  .db 7E 7C 6C 7C 5A 7C 48 7C 35 7C 23 7C 11 7B FE 7B  ; ~|l|Z|H|5|#|.{.{
  3e35  .db EC 7B DA 7B C7 7B B5 7B A3 7B 90 7B 7E 7B 6C 7B  ; .{.{.{.{.{.{~{l{
  3e45  .db 5A 7B 47 7B 35 7B 23 7B 11 7A FF 7A EC 7A DA 7A  ; Z{G{5{#{.z.z.z.z
  3e55  .db C8 7A B6 7A A4 7A 92 7A 7F 7A 6D 7A 5B 7A 49 7A  ; .z.z.z.z.zmz[zIz
  3e65  .db 37 7A 25 7A 13 7A 01 79 EF 79 DD 79 CB 79 B9 79  ; 7z%z.z.y.y.y.y.y
  3e75  .db A7 79 95 79 83 79 71 79 5F 79 4D 79 3B 79 29 79  ; .y.y.yqy_yMy;y)y
  3e85  .db 17 79 05 78 F3 78 E2 78 D0 78 BE                 ; .y.x.x.x.x.
DAT_M7B_r3_08000__3e90:
  3e90  AD             ?? ADh                            
  3e91  .db 9F FD 76 3B                                      ; ..v;

; ---- function FUN_M7B_r3_08000__3e95
FUN_M7B_r3_08000__3e95:
  3e95  3406           PSHS  B A                         
  3e97  4F             CLRA                              
  3e98  5F             CLRB                              
  3e99  FD70EA         STD 0x70ea                        
  3e9c  FD70EE         STD 0x70ee                        
  3e9f  FD70FC         STD 0x70fc                        
  3ea2  FD7100         STD 0x7100                        
  3ea5  FD7104         STD 0x7104                        
  3ea8  FD7108         STD 0x7108                        
  3eab  FD710C         STD 0x710c                        
  3eae  FD7144         STD 0x7144                        
  3eb1  FD7148         STD 0x7148                        
  3eb4  FD714C         STD 0x714c                        
  3eb7  FD7150         STD 0x7150                        
  3eba  FD7154         STD 0x7154                        
  3ebd  FD7158         STD 0x7158                        
  3ec0  FD715C         STD 0x715c                        
  3ec3  FD7160         STD 0x7160                        
  3ec6  FD7166         STD 0x7166                        
  3ec9  FD716C         STD 0x716c                        
  3ecc  FD7170         STD 0x7170                        
  3ecf  FD7174         STD 0x7174                        
  3ed2  FD7178         STD 0x7178                        
  3ed5  FD717C         STD 0x717c                        
  3ed8  FD7180         STD 0x7180                        
  3edb  FD7184         STD 0x7184                        
  3ede  FD7188         STD 0x7188                        
  3ee1  FD718C         STD 0x718c                        
  3ee4  FD7190         STD 0x7190                        
  3ee7  FD7194         STD 0x7194                        
  3eea  FD7198         STD 0x7198                        
  3eed  FD719C         STD 0x719c                        
  3ef0  FD71A0         STD 0x71a0                        
  3ef3  FD71A6         STD 0x71a6                        
  3ef6  FD71AA         STD 0x71aa                        
  3ef9  FD71AE         STD 0x71ae                        
  3efc  FD71B2         STD 0x71b2                        
  3eff  FD71B6         STD 0x71b6                        
  3f02  FD71BA         STD 0x71ba                        
  3f05  FD71BE         STD 0x71be                        
  3f08  FD71C2         STD 0x71c2                        
  3f0b  FD71C6         STD 0x71c6                        
  3f0e  FD71CA         STD 0x71ca                        
  3f11  FD71CE         STD 0x71ce                        
  3f14  FD71D2         STD 0x71d2                        
  3f17  FD71D6         STD 0x71d6                        
  3f1a  FD71DA         STD 0x71da                        
  3f1d  FD71DE         STD 0x71de                        
  3f20  FD71E2         STD 0x71e2                        
  3f23  FD71E6         STD 0x71e6                        
  3f26  FD71EA         STD 0x71ea                        
  3f29  FD71EE         STD 0x71ee                        
  3f2c  FD71F2         STD 0x71f2                        
  3f2f  FD71F6         STD 0x71f6                        
  3f32  FD71FA         STD 0x71fa                        
  3f35  FD71FE         STD 0x71fe                        
  3f38  FD7202         STD 0x7202                        
  3f3b  FD7206         STD 0x7206                        
  3f3e  FD720A         STD 0x720a                        
  3f41  FD720E         STD 0x720e                        
  3f44  3586           PULS  A B PC                      

; ---- function FUN_M7B_r3_08000__3f46
FUN_M7B_r3_08000__3f46:
  3f46  3476           PSHS  U Y X B A                   
  3f48  17D0C5         LBSR 0x1010                       
  3f4b  17D3EF         LBSR 0x133d                       
  3f4e  17D7BA         LBSR 0x170b                       
  3f51  17D854         LBSR 0x17a8                       
  3f54  17D90B         LBSR 0x1862                       
  3f57  17D9A9         LBSR 0x1903                       
  3f5a  17DA43         LBSR 0x19a0                       
  3f5d  17DBF6         LBSR 0x1b56                       
  3f60  17DC9A         LBSR 0x1bfd                       
  3f63  17DD3E         LBSR 0x1ca4                       
  3f66  17DDCB         LBSR 0x1d34                       
  3f69  17DE58         LBSR 0x1dc4                       
  3f6c  17DEE1         LBSR 0x1e50                       
  3f6f  17DF6A         LBSR 0x1edc                       
  3f72  17DFEE         LBSR 0x1f63                       
  3f75  17E086         LBSR 0x1ffe                       
  3f78  17E140         LBSR 0x20bb                       
  3f7b  17E1E9         LBSR 0x2167                       
  3f7e  17E28D         LBSR 0x220e                       
  3f81  17E331         LBSR 0x22b5                       
  3f84  17E3CF         LBSR 0x2356                       
  3f87  17E46D         LBSR 0x23f7                       
  3f8a  17E4F3         LBSR 0x2480                       
  3f8d  17E67A         LBSR 0x260a                       
  3f90  17E736         LBSR 0x26c9                       
  3f93  17E7DA         LBSR 0x2770                       
  3f96  17E88F         LBSR 0x2828                       
  3f99  17E944         LBSR 0x28e0                       
  3f9c  17E9F0         LBSR 0x298f                       
  3f9f  17EAB4         LBSR 0x2a56                       
  3fa2  17EB5A         LBSR 0x2aff                       
  3fa5  17EBF6         LBSR 0x2b9e                       
  3fa8  17ED67         LBSR 0x2d12                       
  3fab  17EE4F         LBSR 0x2dfd                       
  3fae  17EEF1         LBSR 0x2ea2                       
  3fb1  17F081         LBSR 0x3035                       
  3fb4  17F107         LBSR 0x30be                       
  3fb7  17F1AF         LBSR 0x3169                       
  3fba  17F24B         LBSR 0x3208                       
  3fbd  17F2DB         LBSR 0x329b                       
  3fc0  17F36B         LBSR 0x332e                       
  3fc3  17F3FB         LBSR 0x33c1                       
  3fc6  17F4A3         LBSR 0x346c                       
  3fc9  17F546         LBSR 0x3512                       
  3fcc  17F5E9         LBSR 0x35b8                       
  3fcf  17F68C         LBSR 0x365e                       
  3fd2  17F72F         LBSR 0x3704                       
  3fd5  17F7D2         LBSR 0x37aa                       
  3fd8  17F875         LBSR 0x3850                       
  3fdb  17F918         LBSR 0x38f6                       
  3fde  17F9BB         LBSR 0x399c                       
  3fe1  17FA5E         LBSR 0x3a42                       
  3fe4  17FCD0         LBSR 0x3cb7                       
  3fe7  35F6           PULS  A B X Y U PC                

;; End of record chain
END_OF_CHAIN_hdr:
  3fe9  FFFFFFFFFFFF.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3ff1  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF 06     ; ...............
