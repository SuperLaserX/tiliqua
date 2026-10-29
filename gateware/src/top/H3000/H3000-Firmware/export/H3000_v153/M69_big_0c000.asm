; H3000_v153  block M69_big_0c000  M69_big_0c000::0000-M69_big_0c000::3fff
; Bank big_0c000 (module id 69)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 69 code record 02, 12600 bytes, entered at payload start
MODULE_69_02_CODE_hdr:
  0008  690231400000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_69_02_entry
MODULE_69_02_entry:
  0010  CC0000         LDD #0x0                          
  0013  FD7002         STD 0x7002                        
  0016  FD700A         STD 0x700a                        
  0019  FD7012         STD 0x7012                        
  001c  FD701A         STD 0x701a                        
  001f  FD7032         STD 0x7032                        
  0022  FD702A         STD 0x702a                        
  0025  FD703A         STD 0x703a                        
  0028  FD7022         STD 0x7022                        
  002b  FD704A         STD 0x704a                        
  002e  FD7042         STD 0x7042                        
  0031  FD70A6         STD 0x70a6                        
  0034  FD70AE         STD 0x70ae                        
  0037  FD70B6         STD 0x70b6                        
  003a  FD70BE         STD 0x70be                        
  003d  FD70C6         STD 0x70c6                        
  0040  CCFFFF         LDD #0xffff                       
  0043  FD7050         STD 0x7050                        
  0046  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 42:5A 41:58 75:98 76:9A 77:9C 78:9E 79:A0 7A:A2
  004a  42             db 42h                            
  004b  5A             db 5Ah                            
  004c  41             db 41h                            
  004d  58             db 58h                            
  004e  75             db 75h                            
  004f  98             db 98h                            
  0050  76             db 76h                            
  0051  9A             db 9Ah                            
  0052  77             db 77h                            
  0053  9C             db 9Ch                            
  0054  78             db 78h                            
  0055  9E             db 9Eh                            
  0056  79             db 79h                            
  0057  A0             db A0h                            
  0058  7A             db 7Ah                            
  0059  A2             db A2h                            
  005a  00             db 0h                             
LAB_M69_big_0c000__005b:
  005b  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 69:80 6A:82 6B:84 6C:86 6D:88 6E:8A 6F:8C 70:8E 71:90 72:92 73:94 74:96
  005f  69             db 69h                            
  0060  80             db 80h                            
  0061  6A             db 6Ah                            
  0062  82             db 82h                            
  0063  6B             db 6Bh                            
  0064  84             db 84h                            
  0065  6C             db 6Ch                            
  0066  86             db 86h                            
  0067  6D             db 6Dh                            
  0068  88             db 88h                            
  0069  6E             db 6Eh                            
  006a  8A             db 8Ah                            
  006b  6F             db 6Fh                            
  006c  8C             db 8Ch                            
  006d  70             db 70h                            
  006e  8E             db 8Eh                            
  006f  71             db 71h                            
  0070  90             db 90h                            
  0071  72             db 72h                            
  0072  92             db 92h                            
  0073  73             db 73h                            
  0074  94             db 94h                            
  0075  74             db 74h                            
  0076  96             db 96h                            
  0077  00             db 0h                             
LAB_M69_big_0c000__0078:
  0078  AD9FFE06       JSR [0xfe06]                       ; inline[API_FE06]: 5D:5C 5E:5E 5F:60 60:62 61:64 62:66 63:68 64:6A 65:6C 66:6E 67:70 68:72
  007c  5D             db 5Dh                            
  007d  5C             db 5Ch                            
  007e  5E             db 5Eh                            
  007f  5E             db 5Eh                            
  0080  5F             db 5Fh                            
  0081  60             db 60h                            
  0082  60             db 60h                            
  0083  62             db 62h                            
  0084  61             db 61h                            
  0085  64             db 64h                            
  0086  62             db 62h                            
  0087  66             db 66h                            
  0088  63             db 63h                            
  0089  68             db 68h                            
  008a  64             db 64h                            
  008b  6A             db 6Ah                            
  008c  65             db 65h                            
  008d  6C             db 6Ch                            
  008e  66             db 66h                            
  008f  6E             db 6Eh                            
  0090  67             db 67h                            
  0091  70             db 70h                            
  0092  68             db 68h                            
  0093  72             db 72h                            
  0094  00             db 0h                             
LAB_M69_big_0c000__0095:
  0095  AD9FFE06       JSR [0xfe06]                       ; inline[API_FE06]: 57:74 58:76 59:78 5A:7A 5B:7C 5C:7E
  0099  57             db 57h                            
  009a  74             db 74h                            
  009b  58             db 58h                            
  009c  76             db 76h                            
  009d  59             db 59h                            
  009e  78             db 78h                            
  009f  5A             db 5Ah                            
  00a0  7A             db 7Ah                            
  00a1  5B             db 5Bh                            
  00a2  7C             db 7Ch                            
  00a3  5C             db 5Ch                            
  00a4  7E             db 7Eh                            
  00a5  00             db 0h                             
LAB_M69_big_0c000__00a6:
  00a6  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 35:BC 57:C4 37:C2 59:CA 39:00 39:08 4F:10 3B:06 3B:0E 51:16
  00aa  35             db 35h                            
  00ab  BC             db BCh                            
  00ac  57             db 57h                            
  00ad  C4             db C4h                            
  00ae  37             db 37h                            
  00af  C2             db C2h                            
  00b0  59             db 59h                            
  00b1  CA             db CAh                            
  00b2  39             db 39h                            
  00b3  00             db 0h                             
  00b4  39             db 39h                            
  00b5  08             db 8h                             
  00b6  4F             db 4Fh                            
  00b7  10             db 10h                            
  00b8  3B             db 3Bh                            
  00b9  06             db 6h                             
  00ba  3B             db 3Bh                            
  00bb  0E             db Eh                             
  00bc  51             db 51h                            
  00bd  16             db 16h                            
  00be  00             db 0h                             
LAB_M69_big_0c000__00bf:
  00bf  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 3D:20 7F:48 53:28 35:30 31:38 4F:18 7B:40 3F:26 55:2E 37:36 33:3E 7D:46 51:1E
  00c3  3D             db 3Dh                            
  00c4  20             db 20h                            
  00c5  7F             db 7Fh                            
  00c6  48             db 48h                            
  00c7  53             db 53h                            
  00c8  28             db 28h                            
  00c9  35             db 35h                            
  00ca  30             db 30h                            
  00cb  31             db 31h                            
  00cc  38             db 38h                            
  00cd  4F             db 4Fh                            
  00ce  18             db 18h                            
  00cf  7B             db 7Bh                            
  00d0  40             db 40h                            
  00d1  3F             db 3Fh                            
  00d2  26             db 26h                            
  00d3  55             db 55h                            
  00d4  2E             db 2Eh                            
  00d5  37             db 37h                            
  00d6  36             db 36h                            
  00d7  33             db 33h                            
  00d8  3E             db 3Eh                            
  00d9  7D             db 7Dh                            
  00da  46             db 46h                            
  00db  51             db 51h                            
  00dc  1E             db 1Eh                            
  00dd  00             db 0h                             
LAB_M69_big_0c000__00de:
  00de  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 31:A4 31:AC 53:B4 33:AA 33:B2 55:BA 81:4E
  00e2  31             db 31h                            
  00e3  A4             db A4h                            
  00e4  31             db 31h                            
  00e5  AC             db ACh                            
  00e6  53             db 53h                            
  00e7  B4             db B4h                            
  00e8  33             db 33h                            
  00e9  AA             db AAh                            
  00ea  33             db 33h                            
  00eb  B2             db B2h                            
  00ec  55             db 55h                            
  00ed  BA             db BAh                            
  00ee  81             db 81h                            
  00ef  4E             db 4Eh                            
  00f0  00             db 0h                             
LAB_M69_big_0c000__00f1:
  00f1  CC2CD4         LDD #0x2cd4                       
  00f4  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6097
  00f8  6097           addr 6097                         
LAB_M69_big_0c000__00fa:
  00fa  AD9FFE18       JSR [0xfe18]                      
  00fe  AD9FFD7C       JSR [0xfd7c]                      
  0102  39             RTS                               

; ---- function FUN_M69_big_0c000__0103
FUN_M69_big_0c000__0103:
  0103  3406           PSHS  B A                         
  0105  CC7FFF         LDD #0x7fff                       
  0108  FD7118         STD 0x7118                        
  010b  FD711A         STD 0x711a                        
  010e  CC00C8         LDD #0xc8                         
  0111  FD708C         STD 0x708c                        
  0114  CC0000         LDD #0x0                          
  0117  FD708E         STD 0x708e                        
  011a  FD7090         STD 0x7090                        
  011d  FD7092         STD 0x7092                        
  0120  FD7094         STD 0x7094                        
  0123  FD7096         STD 0x7096                        
  0126  FD705C         STD 0x705c                        
  0129  FD7068         STD 0x7068                        
  012c  FD7080         STD 0x7080                        
  012f  172E96         LBSR 0x2fc8                       
  0132  172E25         LBSR 0x2f5a                       
  0135  172F18         LBSR 0x3050                       
  0138  3506           PULS  A B                         
  013a  39             RTS                               

; ---- function FUN_M69_big_0c000__013b
FUN_M69_big_0c000__013b:
  013b  3406           PSHS  B A                         
  013d  CC7FFF         LDD #0x7fff                       
  0140  FD7118         STD 0x7118                        
  0143  FD711A         STD 0x711a                        
  0146  FD711C         STD 0x711c                        
  0149  CC0064         LDD #0x64                         
  014c  FD708C         STD 0x708c                        
  014f  FD7092         STD 0x7092                        
  0152  CC0000         LDD #0x0                          
  0155  FD708E         STD 0x708e                        
  0158  FD7090         STD 0x7090                        
  015b  FD7094         STD 0x7094                        
  015e  FD7096         STD 0x7096                        
  0161  FD705C         STD 0x705c                        
  0164  FD7068         STD 0x7068                        
  0167  FD706E         STD 0x706e                        
  016a  CCFFF6         LDD #0xfff6                       
  016d  FD7080         STD 0x7080                        
  0170  CC000A         LDD #0xa                          
  0173  FD7086         STD 0x7086                        
  0176  172E4F         LBSR 0x2fc8                       
  0179  172DDE         LBSR 0x2f5a                       
  017c  172ED1         LBSR 0x3050                       
  017f  3506           PULS  A B                         
  0181  39             RTS                               

; ---- function FUN_M69_big_0c000__0182
FUN_M69_big_0c000__0182:
  0182  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "l delay " 21 $277E $278A
  0186  00             db 0h                             
  0187  80             db 80h                            
  0188  6C2064656C61.. ds "l delay "                     
  0190  21             db 21h                            
  0191  277E           addr M69_big_0c000::277e          
  0193  278A           addr M69_big_0c000::278a          
LAB_M69_big_0c000__0195:
  0195  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "r delay " 25 $28A0 $28AC
  0199  01             db 1h                             
  019a  80             db 80h                            
  019b  722064656C61.. ds "r delay "                     
  01a3  25             db 25h                            
  01a4  28A0           addr M69_big_0c000::28a0          
  01a6  28AC           addr M69_big_0c000::28ac          
LAB_M69_big_0c000__01a8:
  01a8  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "l fdback" 29 $2A4C $2A58
  01ac  02             db 2h                             
  01ad  80             db 80h                            
  01ae  6C2066646261.. ds "l fdback"                     
  01b6  29             db 29h                            
  01b7  2A4C           addr M69_big_0c000::2a4c          
  01b9  2A58           addr M69_big_0c000::2a58          
LAB_M69_big_0c000__01bb:
  01bb  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "r fdback" 2D $2B6C $2B78
  01bf  03             db 3h                             
  01c0  80             db 80h                            
  01c1  722066646261.. ds "r fdback"                     
  01c9  2D             db 2Dh                            
  01ca  2B6C           addr M69_big_0c000::2b6c          
  01cc  2B78           addr M69_big_0c000::2b78          
LAB_M69_big_0c000__01ce:
  01ce  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "left mix" 43 $244A $2456
  01d2  04             db 4h                             
  01d3  80             db 80h                            
  01d4  6C656674206D.. ds "left mix"                     
  01dc  43             db 43h                            
  01dd  244A           addr M69_big_0c000::244a          
  01df  2456           addr M69_big_0c000::2456          
LAB_M69_big_0c000__01e1:
  01e1  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "rightmix" 47 $2564 $2570
  01e5  05             db 5h                             
  01e6  80             db 80h                            
  01e7  72696768746D.. ds "rightmix"                     
  01ef  47             db 47h                            
  01f0  2564           addr M69_big_0c000::2564          
  01f2  2570           addr M69_big_0c000::2570          
LAB_M69_big_0c000__01f4:
  01f4  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "glide sp" 4B $125C $1268
  01f8  06             db 6h                             
  01f9  80             db 80h                            
  01fa  676C69646520.. ds "glide sp"                     
  0202  4B             db 4Bh                            
  0203  125C           addr M69_big_0c000::125c          
  0205  1268           addr M69_big_0c000::1268          
LAB_M69_big_0c000__0207:
  0207  CC0216         LDD #0x216                        
  020a  FD60F5         STD 0x60f5                        
  020d  CC0014         LDD #0x14                         
  0210  47             ASRA                              
  0211  56             RORB                              
  0212  FD60F7         STD 0x60f7                        
  0215  39             RTS                               
  0216  022A02350240.. addr[10]                          

; ---- function FUN_M69_big_0c000__022a
FUN_M69_big_0c000__022a:
  022a  172235         LBSR 0x2462                       
  022d  170806         LBSR 0x0a36                       
  0230  AD9FFE14       JSR [0xfe14]                      
  0234  39             RTS                               

; ---- function FUN_M69_big_0c000__0235
FUN_M69_big_0c000__0235:
  0235  172344         LBSR 0x257c                       
  0238  170830         LBSR 0x0a6b                       
  023b  AD9FFE14       JSR [0xfe14]                      
  023f  39             RTS                               

; ---- function FUN_M69_big_0c000__0240
FUN_M69_big_0c000__0240:
  0240  172553         LBSR 0x2796                       
  0243  1707F0         LBSR 0x0a36                       
  0246  AD9FFE10       JSR [0xfe10]                      
  024a  39             RTS                               

; ---- function FUN_M69_big_0c000__024b
FUN_M69_big_0c000__024b:
  024b  172816         LBSR 0x2a64                       
  024e  1707E5         LBSR 0x0a36                       
  0251  AD9FFE12       JSR [0xfe12]                      
  0255  39             RTS                               

; ---- function FUN_M69_big_0c000__0256
FUN_M69_big_0c000__0256:
  0256  17101B         LBSR 0x1274                       
  0259  170868         LBSR 0x0ac4                       
  025c  AD9FFE10       JSR [0xfe10]                      
  0260  39             RTS                               

; ---- function FUN_M69_big_0c000__0261
FUN_M69_big_0c000__0261:
  0261  171114         LBSR 0x1378                       
  0264  17085D         LBSR 0x0ac4                       
  0267  AD9FFE12       JSR [0xfe12]                      
  026b  39             RTS                               

; ---- function FUN_M69_big_0c000__026c
FUN_M69_big_0c000__026c:
  026c  171459         LBSR 0x16c8                       
  026f  170852         LBSR 0x0ac4                       
  0272  AD9FFE14       JSR [0xfe14]                      
  0276  39             RTS                               

; ---- function FUN_M69_big_0c000__0277
FUN_M69_big_0c000__0277:
  0277  171550         LBSR 0x17ca                       
  027a  171574         LBSR 0x17f1                       
  027d  1707B6         LBSR 0x0a36                       
  0280  AD9FFDEE       JSR [0xfdee]                      
  0284  39             RTS                               

; ---- function FUN_M69_big_0c000__0285
FUN_M69_big_0c000__0285:
  0285  172630         LBSR 0x28b8                       
  0288  1707E0         LBSR 0x0a6b                       
  028b  AD9FFE10       JSR [0xfe10]                      
  028f  39             RTS                               

; ---- function FUN_M69_big_0c000__0290
FUN_M69_big_0c000__0290:
  0290  1728F1         LBSR 0x2b84                       
  0293  1707D5         LBSR 0x0a6b                       
  0296  AD9FFE12       JSR [0xfe12]                      
  029a  39             RTS                               

; ---- function FUN_M69_big_0c000__029b
FUN_M69_big_0c000__029b:
  029b  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " delay  " 21 $267E $268A
  029f  00             db 0h                             
  02a0  80             db 80h                            
  02a1  2064656C6179.. ds " delay  "                     
  02a9  21             db 21h                            
  02aa  267E           addr M69_big_0c000::267e          
  02ac  268A           addr M69_big_0c000::268a          
LAB_M69_big_0c000__02ae:
  02ae  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "feedback" 25 $2A4C $2A58
  02b2  01             db 1h                             
  02b3  80             db 80h                            
  02b4  666565646261.. ds "feedback"                     
  02bc  25             db 25h                            
  02bd  2A4C           addr M69_big_0c000::2a4c          
  02bf  2A58           addr M69_big_0c000::2a58          
LAB_M69_big_0c000__02c1:
  02c1  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "  mix   " 29 $232C $2338
  02c5  02             db 2h                             
  02c6  80             db 80h                            
  02c7  20206D697820.. ds "  mix   "                     
  02cf  29             db 29h                            
  02d0  232C           addr M69_big_0c000::232c          
  02d2  2338           addr M69_big_0c000::2338          
LAB_M69_big_0c000__02d4:
  02d4  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "glide sp" 2D $125C $1268
  02d8  03             db 3h                             
  02d9  80             db 80h                            
  02da  676C69646520.. ds "glide sp"                     
  02e2  2D             db 2Dh                            
  02e3  125C           addr M69_big_0c000::125c          
  02e5  1268           addr M69_big_0c000::1268          
LAB_M69_big_0c000__02e7:
  02e7  CC02F6         LDD #0x2f6                        
  02ea  FD60F5         STD 0x60f5                        
  02ed  CC0010         LDD #0x10                         
  02f0  47             ASRA                              
  02f1  56             RORB                              
  02f2  FD60F7         STD 0x60f7                        
  02f5  39             RTS                               
  02f6  .db 03 06 03 11 03 12 03 1D 03 28 03 33 03 3E 03 3F  ; .........(.3.>.?
  0306  .db 17 20 3B 17 06 CD AD 9F FE 10 39 39 17 23 81 17  ; . ;.......99.#..
  0316  .db 06 8C AD 9F FE 10 39 17 26 94 17 06 81 AD 9F FE  ; ......9.&.......
  0326  .db 12 39 17 0F 49 17 06 D6 AD 9F FE 10 39 17 10 42  ; .9..I.......9..B
  0336  .db 17 06 CB AD 9F FE 12 39 39 17 14 88 17 14 AC 17  ; .......99.......
  0346  .db 06 5C AD 9F FD EC 39                             ; .\....9

; ---- function FUN_M69_big_0c000__034d
FUN_M69_big_0c000__034d:
  034d  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "m fdback" 21 $144D $1459
  0351  00             db 0h                             
  0352  80             db 80h                            
  0353  6D2066646261.. ds "m fdback"                     
  035b  21             db 21h                            
  035c  144D           addr M69_big_0c000::144d          
  035e  1459           addr M69_big_0c000::1459          
LAB_M69_big_0c000__0360:
  0360  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " m rate " 25 $0F2F $0F3B
  0364  01             db 1h                             
  0365  80             db 80h                            
  0366  206D20726174.. ds " m rate "                     
  036e  25             db 25h                            
  036f  0F2F           addr M69_big_0c000::0f2f          
  0371  0F3B           addr M69_big_0c000::0f3b          
LAB_M69_big_0c000__0373:
  0373  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 "m depth " 29 $103E $104A
  0377  02             db 2h                             
  0378  80             db 80h                            
  0379  6D2064657074.. ds "m depth "                     
  0381  29             db 29h                            
  0382  103E           addr M69_big_0c000::103e          
  0384  104A           addr M69_big_0c000::104a          
LAB_M69_big_0c000__0386:
  0386  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "m delay " 2D $114D $1159
  038a  03             db 3h                             
  038b  80             db 80h                            
  038c  6D2064656C61.. ds "m delay "                     
  0394  2D             db 2Dh                            
  0395  114D           addr M69_big_0c000::114d          
  0397  1159           addr M69_big_0c000::1159          
LAB_M69_big_0c000__0399:
  0399  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "  image " 43 $1572 $157E
  039d  04             db 4h                             
  039e  80             db 80h                            
  039f  2020696D6167.. ds "  image "                     
  03a7  43             db 43h                            
  03a8  1572           addr M69_big_0c000::1572          
  03aa  157E           addr M69_big_0c000::157e          
LAB_M69_big_0c000__03ac:
  03ac  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "  mix   " 47 $232C $2338
  03b0  05             db 5h                             
  03b1  80             db 80h                            
  03b2  20206D697820.. ds "  mix   "                     
  03ba  47             db 47h                            
  03bb  232C           addr M69_big_0c000::232c          
  03bd  2338           addr M69_big_0c000::2338          
LAB_M69_big_0c000__03bf:
  03bf  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 06 80 "glide sp" 4B $125C $1268
  03c3  06             db 6h                             
  03c4  80             db 80h                            
  03c5  676C69646520.. ds "glide sp"                     
  03cd  4B             db 4Bh                            
  03ce  125C           addr M69_big_0c000::125c          
  03d0  1268           addr M69_big_0c000::1268          
LAB_M69_big_0c000__03d2:
  03d2  CC03E7         LDD #0x3e7                        
  03d5  FD60F5         STD 0x60f5                        
  03d8  CC005E         LDD #0x5e                         
  03db  47             ASRA                              
  03dc  56             RORB                              
  03dd  FD60F7         STD 0x60f7                        
  03e0  FC0926         LDD 0x0926                        
  03e3  FD7120         STD 0x7120                        
  03e6  39             RTS                               
  03e7  .db 04 45 04 50 04 51 04 5C 04 67 04 72 04 7D 04 88  ; .E.P.Q.\.g.r.}..
  03f7  .db 04 96 04 A1 04 AC 04 B7 04 C2 04 CD 04 D8 04 E3  ; ................
  0407  .db 04 EE 04 F9 05 04 05 0F 05 1A 05 25 05 30 05 3B  ; ...........%.0.;
  0417  .db 05 46 05 51 05 5C 05 67 05 72 05 7D 05 88 05 93  ; .F.Q.\.g.r.}....
  0427  .db 05 9E 05 A9 05 B4 05 BF 05 CA 05 D5 05 E0 05 EB  ; ................
  0437  .db 05 F6 06 01 06 0C 06 17 06 22 06 2D 06 38 17 1E  ; .........".-.8..
  0447  .db FC 17 04 6D AD 9F FE 14 39 39 17 0D 11 17 04 28  ; ...m....99.....(
  0457  .db AD 9F FE 10 39 17 0A E8 17 04 1D AD 9F FE 12 39  ; ....9..........9
  0467  .db 17 0E 0A 17 04 80 AD 9F FE 10 39 17 0F 03 17 04  ; ..........9.....
  0477  .db 75 AD 9F FE 12 39 17 12 48 17 04 6A AD 9F FE 14  ; u....9..H..j....
  0487  .db 39 17 13 3F 17 13 63 17 04 27 AD 9F FD EA 39 17  ; 9..?..c..'....9.
  0497  .db 0B BD 17 03 E3 AD 9F FE 14 39 17 0F C1 17 03 D8  ; .........9......
  04a7  .db AD 9F FE 16 39 17 10 DB 17 04 06 AD 9F FE 10 39  ; ....9..........9
  04b7  .db 17 14 CE 17 06 40 AD 9F FE 10 39 17 14 CA 17 06  ; .....@....9.....
  04c7  .db 35 AD 9F FE 12 39 17 14 C6 17 06 2A AD 9F FE 14  ; 5....9.....*....
  04d7  .db 39 17 14 C2 17 06 1F AD 9F FE 16 39 17 14 BE 17  ; 9..........9....
  04e7  .db 06 4D AD 9F FE 10 39 17 14 BA 17 06 42 AD 9F FE  ; .M....9.....B...
  04f7  .db 12 39 17 18 15 17 06 E6 AD 9F FE 10 39 17 18 11  ; .9..........9...
  0507  .db 17 06 DB AD 9F FE 12 39 17 18 0D 17 06 D0 AD 9F  ; .......9........
  0517  .db FE 14 39 17 18 09 17 06 C5 AD 9F FE 16 39 17 18  ; ..9..........9..
  0527  .db 05 17 06 F3 AD 9F FE 10 39 17 18 01 17 06 E8 AD  ; ........9.......
  0537  .db 9F FE 12 39 17 16 76 17 06 30 AD 9F FE 10 39 17  ; ...9..v..0....9.
  0547  .db 16 72 17 06 25 AD 9F FE 12 39 17 16 6E 17 06 1A  ; .r..%....9..n...
  0557  .db AD 9F FE 14 39 17 16 6A 17 06 0F AD 9F FE 16 39  ; ....9..j.......9
  0567  .db 17 16 66 17 06 3D AD 9F FE 10 39 17 16 62 17 06  ; ..f..=....9..b..
  0577  .db 32 AD 9F FE 12 39 17 18 EE 17 06 D6 AD 9F FE 10  ; 2....9..........
  0587  .db 39 17 18 EA 17 06 CB AD 9F FE 12 39 17 18 E6 17  ; 9..........9....
  0597  .db 06 C0 AD 9F FE 14 39 17 18 E2 17 06 B5 AD 9F FE  ; ......9.........
  05a7  .db 16 39 17 18 DE 17 06 E3 AD 9F FE 10 39 17 18 DA  ; .9..........9...
  05b7  .db 17 06 D8 AD 9F FE 12 39 17 1B E4 17 07 7C AD 9F  ; .......9.....|..
  05c7  .db FE 10 39 17 1B E0 17 07 71 AD 9F FE 12 39 17 1B  ; ..9.....q....9..
  05d7  .db DC 17 07 66 AD 9F FE 14 39 17 1B D8 17 07 5B AD  ; ...f....9.....[.
  05e7  .db 9F FE 16 39 17 1B D4 17 07 89 AD 9F FE 10 39 17  ; ...9..........9.
  05f7  .db 1B D0 17 07 7E AD 9F FE 12 39 17 1A 28 17 06 C6  ; ....~....9..(...
  0607  .db AD 9F FE 10 39 17 1A 24 17 06 BB AD 9F FE 12 39  ; ....9..$.......9
  0617  .db 17 1A 20 17 06 B0 AD 9F FE 14 39 17 1A 1C 17 06  ; .. .......9.....
  0627  .db A5 AD 9F FE 16 39 17 1A 18 17 06 D3 AD 9F FE 10  ; .....9..........
  0637  .db 39 17 1A 14 17 06 C8 AD 9F FE 12 39              ; 9..........9

; ---- function FUN_M69_big_0c000__0643
FUN_M69_big_0c000__0643:
  0643  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 " m delay" 21 $114D $1159
  0647  00             db 0h                             
  0648  80             db 80h                            
  0649  206D2064656C.. ds " m delay"                     
  0651  21             db 21h                            
  0652  114D           addr M69_big_0c000::114d          
  0654  1159           addr M69_big_0c000::1159          
LAB_M69_big_0c000__0656:
  0656  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 " m depth" 25 $103E $104A
  065a  01             db 1h                             
  065b  80             db 80h                            
  065c  206D20646570.. ds " m depth"                     
  0664  25             db 25h                            
  0665  103E           addr M69_big_0c000::103e          
  0667  104A           addr M69_big_0c000::104a          
LAB_M69_big_0c000__0669:
  0669  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 " m rate " 29 $0F2F $0F3B
  066d  02             db 2h                             
  066e  80             db 80h                            
  066f  206D20726174.. ds " m rate "                     
  0677  29             db 29h                            
  0678  0F2F           addr M69_big_0c000::0f2f          
  067a  0F3B           addr M69_big_0c000::0f3b          
LAB_M69_big_0c000__067c:
  067c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 "m fdback" 2D $0DD8 $0DE4
  0680  03             db 3h                             
  0681  80             db 80h                            
  0682  6D2066646261.. ds "m fdback"                     
  068a  2D             db 2Dh                            
  068b  0DD8           addr M69_big_0c000::0dd8          
  068d  0DE4           addr M69_big_0c000::0de4          
LAB_M69_big_0c000__068f:
  068f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 04 80 "  mix   " 43 $232C $2338
  0693  04             db 4h                             
  0694  80             db 80h                            
  0695  20206D697820.. ds "  mix   "                     
  069d  43             db 43h                            
  069e  232C           addr M69_big_0c000::232c          
  06a0  2338           addr M69_big_0c000::2338          
LAB_M69_big_0c000__06a2:
  06a2  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 05 80 "glide sp" 47 $125C $1268
  06a6  05             db 5h                             
  06a7  80             db 80h                            
  06a8  676C69646520.. ds "glide sp"                     
  06b0  47             db 47h                            
  06b1  125C           addr M69_big_0c000::125c          
  06b3  1268           addr M69_big_0c000::1268          
LAB_M69_big_0c000__06b5:
  06b5  CC06CA         LDD #0x6ca                        
  06b8  FD60F5         STD 0x60f5                        
  06bb  CC003A         LDD #0x3a                         
  06be  47             ASRA                              
  06bf  56             RORB                              
  06c0  FD60F7         STD 0x60f7                        
  06c3  CC0840         LDD #0x840                        
  06c6  FD7120         STD 0x7120                        
  06c9  39             RTS                               
  06ca  0704070F071A.. addr[9]                           
  06dc  .db 07 6A 07 6B 04 B7 04 C2 04 CD 04 D8 04 E3 04 EE  ; .j.k............
  06ec  .db 04 F9 05 04 05 0F 05 1A 05 25 05 30 05 3B 05 46  ; .........%.0.;.F
  06fc  .db 05 51 05 5C 05 67 05 72                          ; .Q.\.g.r

; ---- function FUN_M69_big_0c000__0704
FUN_M69_big_0c000__0704:
  0704  171C3D         LBSR 0x2344                       
  0707  1700D6         LBSR 0x07e0                       
  070a  AD9FFE10       JSR [0xfe10]                      
  070e  39             RTS                               

; ---- function FUN_M69_big_0c000__070f
FUN_M69_big_0c000__070f:
  070f  1706DE         LBSR 0x0df0                       
  0712  170092         LBSR 0x07a7                       
  0715  AD9FFE16       JSR [0xfe16]                      
  0719  39             RTS                               

; ---- function FUN_M69_big_0c000__071a
FUN_M69_big_0c000__071a:
  071a  170A48         LBSR 0x1165                       
  071d  170087         LBSR 0x07a7                       
  0720  AD9FFE10       JSR [0xfe10]                      
  0724  39             RTS                               

; ---- function FUN_M69_big_0c000__0725
FUN_M69_big_0c000__0725:
  0725  17081F         LBSR 0x0f47                       
  0728  17007C         LBSR 0x07a7                       
  072b  AD9FFE12       JSR [0xfe12]                      
  072f  39             RTS                               

; ---- function FUN_M69_big_0c000__0730
FUN_M69_big_0c000__0730:
  0730  170B41         LBSR 0x1274                       
  0733  1700D8         LBSR 0x080e                       
  0736  AD9FFE10       JSR [0xfe10]                      
  073a  39             RTS                               

; ---- function FUN_M69_big_0c000__073b
FUN_M69_big_0c000__073b:
  073b  170C3A         LBSR 0x1378                       
  073e  1700CD         LBSR 0x080e                       
  0741  AD9FFE12       JSR [0xfe12]                      
  0745  39             RTS                               

; ---- function FUN_M69_big_0c000__0746
FUN_M69_big_0c000__0746:
  0746  170F7F         LBSR 0x16c8                       
  0749  1700C2         LBSR 0x080e                       
  074c  AD9FFE14       JSR [0xfe14]                      
  0750  39             RTS                               

; ---- function FUN_M69_big_0c000__0751
FUN_M69_big_0c000__0751:
  0751  171076         LBSR 0x17ca                       
  0754  17109A         LBSR 0x17f1                       
  0757  170086         LBSR 0x07e0                       
  075a  AD9FFDEA       JSR [0xfdea]                      
  075e  39             RTS                               

; ---- function FUN_M69_big_0c000__075f
FUN_M69_big_0c000__075f:
  075f  1708F4         LBSR 0x1056                       
  0762  170042         LBSR 0x07a7                       
  0765  AD9FFE14       JSR [0xfe14]                      
  0769  39             RTS                               
  076a  .db 39 39                                            ; 99

; ---- function FUN_M69_big_0c000__076c
FUN_M69_big_0c000__076c:
  076c  AD9FFDFC       JSR [0xfdfc]                      
  0770  39             RTS                               

; ---- function FUN_M69_big_0c000__0771
FUN_M69_big_0c000__0771:
  0771  C600           LDB #0x0                          
  0773  AD9FFC36       JSR [0xfc36]                      
  0777  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  077b  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M69_big_0c000__07a4:
  07a4  3577           PULS CC A B X Y U                 
  07a6  39             RTS                               

; ---- function FUN_M69_big_0c000__07a7
FUN_M69_big_0c000__07a7:
  07a7  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback"
  07ab  6D2064656C61.. ds "m delay "                     
  07b3  206D20726174.. ds " m rate "                     
  07bb  6D2064657074.. ds "m depth "                     
  07c3  6D2066646261.. ds "m fdback"                     
LAB_M69_big_0c000__07cb:
  07cb  AD9FFDF2       JSR [0xfdf2]                      
  07cf  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$118C ->$0F6E ->$107D ->$0E17 ->$07E0 ->$07E0
  07d3  118C           addr M69_big_0c000::118c          
  07d5  0F6E           addr M69_big_0c000::0f6e          
  07d7  107D           addr M69_big_0c000::107d          
  07d9  0E17           addr M69_big_0c000::0e17          
  07db  07E0           addr M69_big_0c000::07e0          
  07dd  07E0           addr M69_big_0c000::07e0          
LAB_M69_big_0c000__07df:
  07df  39             RTS                               

; ---- function FUN_M69_big_0c000__07e0
FUN_M69_big_0c000__07e0:
  07e0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [-] [*] " expert "
  07e4  20206D697820.. ds "  mix   "                     
  07ec  00             db 0h                             
  07ed  01             db 1h                             
  07ee  206578706572.. ds " expert "                     
LAB_M69_big_0c000__07f6:
  07f6  AD9FFDF2       JSR [0xfdf2]                      
  07fa  171085         LBSR 0x1882                       
  07fd  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$236B ->$17DF ->$0DC9 ->$080E ->$07A7 ->$07A7
  0801  236B           addr M69_big_0c000::236b          
  0803  17DF           addr M69_big_0c000::17df          
  0805  0DC9           addr M69_big_0c000::0dc9          
  0807  080E           addr M69_big_0c000::080e          
  0809  07A7           addr M69_big_0c000::07a7          
  080b  07A7           addr M69_big_0c000::07a7          
LAB_M69_big_0c000__080d:
  080d  39             RTS                               

; ---- function FUN_M69_big_0c000__080e
FUN_M69_big_0c000__080e:
  080e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" [*] " return "
  0812  676C69646520.. ds "glide sp"                     
  081a  676C69646520.. ds "glide en"                     
  0822  01             db 1h                             
  0823  207265747572.. ds " return "                     
LAB_M69_big_0c000__082b:
  082b  AD9FFDF2       JSR [0xfdf2]                      
  082f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$129B ->$139C ->$0DC9 ->$07E0 ->$0840 ->$0840
  0833  129B           addr M69_big_0c000::129b          
  0835  139C           addr M69_big_0c000::139c          
  0837  0DC9           addr M69_big_0c000::0dc9          
  0839  07E0           addr M69_big_0c000::07e0          
  083b  0840           addr M69_big_0c000::0840          
  083d  0840           addr M69_big_0c000::0840          
LAB_M69_big_0c000__083f:
  083f  39             RTS                               

; ---- function FUN_M69_big_0c000__0840
FUN_M69_big_0c000__0840:
  0840  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rates  " " depths " " delays " " return "
  0844  207261746573.. ds " rates  "                     
  084c  206465707468.. ds " depths "                     
  0854  2064656C6179.. ds " delays "                     
  085c  207265747572.. ds " return "                     
LAB_M69_big_0c000__0864:
  0864  AD9FFDF2       JSR [0xfdf2]                      
  0868  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0B71 ->$0BE5 ->$0AFD ->$07E0 ->$080E ->$080E
  086c  0B71           addr M69_big_0c000::0b71          
  086e  0BE5           addr M69_big_0c000::0be5          
  0870  0AFD           addr M69_big_0c000::0afd          
  0872  07E0           addr M69_big_0c000::07e0          
  0874  080E           addr M69_big_0c000::080e          
  0876  080E           addr M69_big_0c000::080e          
LAB_M69_big_0c000__0878:
  0878  CC0840         LDD #0x840                        
  087b  FD7120         STD 0x7120                        
  087e  39             RTS                               

; ---- function FUN_M69_big_0c000__087f
FUN_M69_big_0c000__087f:
  087f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "m delay " " m rate " "m depth " "m fdback"
  0883  6D2064656C61.. ds "m delay "                     
  088b  206D20726174.. ds " m rate "                     
  0893  6D2064657074.. ds "m depth "                     
  089b  6D2066646261.. ds "m fdback"                     
LAB_M69_big_0c000__08a3:
  08a3  AD9FFDF2       JSR [0xfdf2]                      
  08a7  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$118C ->$0F6E ->$107D ->$148C ->$08B8 ->$08B8
  08ab  118C           addr M69_big_0c000::118c          
  08ad  0F6E           addr M69_big_0c000::0f6e          
  08af  107D           addr M69_big_0c000::107d          
  08b1  148C           addr M69_big_0c000::148c          
  08b3  08B8           addr M69_big_0c000::08b8          
  08b5  08B8           addr M69_big_0c000::08b8          
LAB_M69_big_0c000__08b7:
  08b7  39             RTS                               

; ---- function FUN_M69_big_0c000__08b8
FUN_M69_big_0c000__08b8:
  08b8  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " width  " [-] "  mix   " " expert "
  08bc  207769647468.. ds " width  "                     
  08c4  00             db 0h                             
  08c5  20206D697820.. ds "  mix   "                     
  08cd  206578706572.. ds " expert "                     
LAB_M69_big_0c000__08d5:
  08d5  AD9FFDF2       JSR [0xfdf2]                      
  08d9  170FA6         LBSR 0x1882                       
  08dc  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$15B1 ->$17DF ->$236B ->$08ED ->$087F ->$087F
  08e0  15B1           addr M69_big_0c000::15b1          
  08e2  17DF           addr M69_big_0c000::17df          
  08e4  236B           addr M69_big_0c000::236b          
  08e6  08ED           addr M69_big_0c000::08ed          
  08e8  087F           addr M69_big_0c000::087f          
  08ea  087F           addr M69_big_0c000::087f          
LAB_M69_big_0c000__08ec:
  08ec  39             RTS                               

; ---- function FUN_M69_big_0c000__08ed
FUN_M69_big_0c000__08ed:
  08ed  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" "st/mono " " return "
  08f1  676C69646520.. ds "glide sp"                     
  08f9  676C69646520.. ds "glide en"                     
  0901  73742F6D6F6E.. ds "st/mono "                     
  0909  207265747572.. ds " return "                     
LAB_M69_big_0c000__0911:
  0911  AD9FFDF2       JSR [0xfdf2]                      
  0915  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$129B ->$139C ->$16EC ->$08B8 ->$0926 ->$0926
  0919  129B           addr M69_big_0c000::129b          
  091b  139C           addr M69_big_0c000::139c          
  091d  16EC           addr M69_big_0c000::16ec          
  091f  08B8           addr M69_big_0c000::08b8          
  0921  0926           addr M69_big_0c000::0926          
  0923  0926           addr M69_big_0c000::0926          
LAB_M69_big_0c000__0925:
  0925  39             RTS                               

; ---- function FUN_M69_big_0c000__0926
FUN_M69_big_0c000__0926:
  0926  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rates  " " depths " " delays " " return "
  092a  207261746573.. ds " rates  "                     
  0932  206465707468.. ds " depths "                     
  093a  2064656C6179.. ds " delays "                     
  0942  207265747572.. ds " return "                     
LAB_M69_big_0c000__094a:
  094a  AD9FFDF2       JSR [0xfdf2]                      
  094e  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0B71 ->$0BE5 ->$0AFD ->$08B8 ->$0965 ->$08ED
  0952  0B71           addr M69_big_0c000::0b71          
  0954  0BE5           addr M69_big_0c000::0be5          
  0956  0AFD           addr M69_big_0c000::0afd          
  0958  08B8           addr M69_big_0c000::08b8          
  095a  0965           addr M69_big_0c000::0965          
  095c  08ED           addr M69_big_0c000::08ed          
LAB_M69_big_0c000__095e:
  095e  CC0926         LDD #0x926                        
  0961  FD7120         STD 0x7120                        
  0964  39             RTS                               

; ---- function FUN_M69_big_0c000__0965
FUN_M69_big_0c000__0965:
  0965  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "fdbacks " " pans   " " levels " " return "
  0969  66646261636B.. ds "fdbacks "                     
  0971  2070616E7320.. ds " pans   "                     
  0979  206C6576656C.. ds " levels "                     
  0981  207265747572.. ds " return "                     
LAB_M69_big_0c000__0989:
  0989  AD9FFDF2       JSR [0xfdf2]                      
  098d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0D41 ->$0CCD ->$0C59 ->$08B8 ->$08ED ->$0926
  0991  0D41           addr M69_big_0c000::0d41          
  0993  0CCD           addr M69_big_0c000::0ccd          
  0995  0C59           addr M69_big_0c000::0c59          
  0997  08B8           addr M69_big_0c000::08b8          
  0999  08ED           addr M69_big_0c000::08ed          
  099b  0926           addr M69_big_0c000::0926          
LAB_M69_big_0c000__099d:
  099d  CC0965         LDD #0x965                        
  09a0  FD7120         STD 0x7120                        
  09a3  39             RTS                               

; ---- function FUN_M69_big_0c000__09a4
FUN_M69_big_0c000__09a4:
  09a4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " delay  " [-] "feedback" " expert "
  09a8  2064656C6179.. ds " delay  "                     
  09b0  00             db 0h                             
  09b1  666565646261.. ds "feedback"                     
  09b9  206578706572.. ds " expert "                     
LAB_M69_big_0c000__09c1:
  09c1  AD9FFDF2       JSR [0xfdf2]                      
  09c5  170EBA         LBSR 0x1882                       
  09c8  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$26BD ->$17DF ->$29DB ->$0A04 ->$09D9 ->$09D9
  09cc  26BD           addr M69_big_0c000::26bd          
  09ce  17DF           addr M69_big_0c000::17df          
  09d0  29DB           addr M69_big_0c000::29db          
  09d2  0A04           addr M69_big_0c000::0a04          
  09d4  09D9           addr M69_big_0c000::09d9          
  09d6  09D9           addr M69_big_0c000::09d9          
LAB_M69_big_0c000__09d8:
  09d8  39             RTS                               

; ---- function FUN_M69_big_0c000__09d9
FUN_M69_big_0c000__09d9:
  09d9  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  mix   " [*] [*] " expert "
  09dd  20206D697820.. ds "  mix   "                     
  09e5  01             db 1h                             
  09e6  01             db 1h                             
  09e7  206578706572.. ds " expert "                     
LAB_M69_big_0c000__09ef:
  09ef  AD9FFDF2       JSR [0xfdf2]                      
  09f3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$236B ->$0DC9 ->$0DC9 ->$0A04 ->$09A4 ->$09A4
  09f7  236B           addr M69_big_0c000::236b          
  09f9  0DC9           addr M69_big_0c000::0dc9          
  09fb  0DC9           addr M69_big_0c000::0dc9          
  09fd  0A04           addr M69_big_0c000::0a04          
  09ff  09A4           addr M69_big_0c000::09a4          
  0a01  09A4           addr M69_big_0c000::09a4          
LAB_M69_big_0c000__0a03:
  0a03  39             RTS                               

; ---- function FUN_M69_big_0c000__0a04
FUN_M69_big_0c000__0a04:
  0a04  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" [*] " return "
  0a08  676C69646520.. ds "glide sp"                     
  0a10  676C69646520.. ds "glide en"                     
  0a18  01             db 1h                             
  0a19  207265747572.. ds " return "                     
LAB_M69_big_0c000__0a21:
  0a21  AD9FFDF2       JSR [0xfdf2]                      
  0a25  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$129B ->$139C ->$0DC9 ->$09A4 ->$0A04 ->$0A04
  0a29  129B           addr M69_big_0c000::129b          
  0a2b  139C           addr M69_big_0c000::139c          
  0a2d  0DC9           addr M69_big_0c000::0dc9          
  0a2f  09A4           addr M69_big_0c000::09a4          
  0a31  0A04           addr M69_big_0c000::0a04          
  0a33  0A04           addr M69_big_0c000::0a04          
LAB_M69_big_0c000__0a35:
  0a35  39             RTS                               

; ---- function FUN_M69_big_0c000__0a36
FUN_M69_big_0c000__0a36:
  0a36  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "l delay " [-] "l mix   " "l fdback"
  0a3a  6C2064656C61.. ds "l delay "                     
  0a42  00             db 0h                             
  0a43  6C206D697820.. ds "l mix   "                     
  0a4b  6C2066646261.. ds "l fdback"                     
LAB_M69_big_0c000__0a53:
  0a53  AD9FFDF2       JSR [0xfdf2]                      
  0a57  170E28         LBSR 0x1882                       
  0a5a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$27BD ->$17DF ->$2489 ->$2A7C ->$0A6B ->$0AA0
  0a5e  27BD           addr M69_big_0c000::27bd          
  0a60  17DF           addr M69_big_0c000::17df          
  0a62  2489           addr M69_big_0c000::2489          
  0a64  2A7C           addr M69_big_0c000::2a7c          
  0a66  0A6B           addr M69_big_0c000::0a6b          
  0a68  0AA0           addr M69_big_0c000::0aa0          
LAB_M69_big_0c000__0a6a:
  0a6a  39             RTS                               

; ---- function FUN_M69_big_0c000__0a6b
FUN_M69_big_0c000__0a6b:
  0a6b  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "r delay " [-] "r mix   " "r fdback"
  0a6f  722064656C61.. ds "r delay "                     
  0a77  00             db 0h                             
  0a78  72206D697820.. ds "r mix   "                     
  0a80  722066646261.. ds "r fdback"                     
LAB_M69_big_0c000__0a88:
  0a88  AD9FFDF2       JSR [0xfdf2]                      
  0a8c  170DF3         LBSR 0x1882                       
  0a8f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$28DF ->$17DF ->$25A3 ->$2BAB ->$0AA0 ->$0A36
  0a93  28DF           addr M69_big_0c000::28df          
  0a95  17DF           addr M69_big_0c000::17df          
  0a97  25A3           addr M69_big_0c000::25a3          
  0a99  2BAB           addr M69_big_0c000::2bab          
  0a9b  0AA0           addr M69_big_0c000::0aa0          
  0a9d  0A36           addr M69_big_0c000::0a36          
LAB_M69_big_0c000__0a9f:
  0a9f  39             RTS                               

; ---- function FUN_M69_big_0c000__0aa0
FUN_M69_big_0c000__0aa0:
  0aa0  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [*] [*] [*] " expert "
  0aa4  01             db 1h                             
  0aa5  01             db 1h                             
  0aa6  01             db 1h                             
  0aa7  206578706572.. ds " expert "                     
LAB_M69_big_0c000__0aaf:
  0aaf  AD9FFDF2       JSR [0xfdf2]                      
  0ab3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0DC9 ->$0DC9 ->$0DC9 ->$0AC4 ->$0A36 ->$0A6B
  0ab7  0DC9           addr M69_big_0c000::0dc9          
  0ab9  0DC9           addr M69_big_0c000::0dc9          
  0abb  0DC9           addr M69_big_0c000::0dc9          
  0abd  0AC4           addr M69_big_0c000::0ac4          
  0abf  0A36           addr M69_big_0c000::0a36          
  0ac1  0A6B           addr M69_big_0c000::0a6b          
LAB_M69_big_0c000__0ac3:
  0ac3  39             RTS                               

; ---- function FUN_M69_big_0c000__0ac4
FUN_M69_big_0c000__0ac4:
  0ac4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "glide sp" "glide en" "st/mono " " return "
  0ac8  676C69646520.. ds "glide sp"                     
  0ad0  676C69646520.. ds "glide en"                     
  0ad8  73742F6D6F6E.. ds "st/mono "                     
  0ae0  207265747572.. ds " return "                     
LAB_M69_big_0c000__0ae8:
  0ae8  AD9FFDF2       JSR [0xfdf2]                      
  0aec  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$129B ->$139C ->$16EC ->$0A36 ->$0AC4 ->$0AC4
  0af0  129B           addr M69_big_0c000::129b          
  0af2  139C           addr M69_big_0c000::139c          
  0af4  16EC           addr M69_big_0c000::16ec          
  0af6  0A36           addr M69_big_0c000::0a36          
  0af8  0AC4           addr M69_big_0c000::0ac4          
  0afa  0AC4           addr M69_big_0c000::0ac4          
LAB_M69_big_0c000__0afc:
  0afc  39             RTS                               

; ---- function FUN_M69_big_0c000__0afd
FUN_M69_big_0c000__0afd:
  0afd  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 1 " "delay 2 " "delay 3 " "delay 4 "
  0b01  64656C617920.. ds "delay 1 "                     
  0b09  64656C617920.. ds "delay 2 "                     
  0b11  64656C617920.. ds "delay 3 "                     
  0b19  64656C617920.. ds "delay 4 "                     
LAB_M69_big_0c000__0b21:
  0b21  AD9FFDF2       JSR [0xfdf2]                      
  0b25  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$19DE ->$19EC ->$19FA ->$1A08 ->$0B36 ->$0B36
  0b29  19DE           addr M69_big_0c000::19de          
  0b2b  19EC           addr M69_big_0c000::19ec          
  0b2d  19FA           addr M69_big_0c000::19fa          
  0b2f  1A08           addr M69_big_0c000::1a08          
  0b31  0B36           addr M69_big_0c000::0b36          
  0b33  0B36           addr M69_big_0c000::0b36          
LAB_M69_big_0c000__0b35:
  0b35  39             RTS                               

; ---- function FUN_M69_big_0c000__0b36
FUN_M69_big_0c000__0b36:
  0b36  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "delay 5 " "delay 6 " [*] " return "
  0b3a  64656C617920.. ds "delay 5 "                     
  0b42  64656C617920.. ds "delay 6 "                     
  0b4a  01             db 1h                             
  0b4b  207265747572.. ds " return "                     
LAB_M69_big_0c000__0b53:
  0b53  AD9FFDF2       JSR [0xfdf2]                      
  0b57  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1A16 ->$1A24 ->$0DC9 ->$0DC9 ->$0AFD ->$0AFD
  0b5b  1A16           addr M69_big_0c000::1a16          
  0b5d  1A24           addr M69_big_0c000::1a24          
  0b5f  0DC9           addr M69_big_0c000::0dc9          
  0b61  0DC9           addr M69_big_0c000::0dc9          
  0b63  0AFD           addr M69_big_0c000::0afd          
  0b65  0AFD           addr M69_big_0c000::0afd          
LAB_M69_big_0c000__0b67:
  0b67  FC7120         LDD 0x7120                        
  0b6a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0b6e  60E9           addr 60e9                         
LAB_M69_big_0c000__0b70:
  0b70  39             RTS                               

; ---- function FUN_M69_big_0c000__0b71
FUN_M69_big_0c000__0b71:
  0b71  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rate 1 " " rate 2 " " rate 3 " " rate 4 "
  0b75  207261746520.. ds " rate 1 "                     
  0b7d  207261746520.. ds " rate 2 "                     
  0b85  207261746520.. ds " rate 3 "                     
  0b8d  207261746520.. ds " rate 4 "                     
LAB_M69_big_0c000__0b95:
  0b95  AD9FFDF2       JSR [0xfdf2]                      
  0b99  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1C0A ->$1C14 ->$1C1E ->$1C28 ->$0BAA ->$0BAA
  0b9d  1C0A           addr M69_big_0c000::1c0a          
  0b9f  1C14           addr M69_big_0c000::1c14          
  0ba1  1C1E           addr M69_big_0c000::1c1e          
  0ba3  1C28           addr M69_big_0c000::1c28          
  0ba5  0BAA           addr M69_big_0c000::0baa          
  0ba7  0BAA           addr M69_big_0c000::0baa          
LAB_M69_big_0c000__0ba9:
  0ba9  39             RTS                               

; ---- function FUN_M69_big_0c000__0baa
FUN_M69_big_0c000__0baa:
  0baa  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " rate 5 " " rate 6 " [*] " return "
  0bae  207261746520.. ds " rate 5 "                     
  0bb6  207261746520.. ds " rate 6 "                     
  0bbe  01             db 1h                             
  0bbf  207265747572.. ds " return "                     
LAB_M69_big_0c000__0bc7:
  0bc7  AD9FFDF2       JSR [0xfdf2]                      
  0bcb  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1C32 ->$1C3C ->$0DC9 ->$0DC9 ->$0B71 ->$0B71
  0bcf  1C32           addr M69_big_0c000::1c32          
  0bd1  1C3C           addr M69_big_0c000::1c3c          
  0bd3  0DC9           addr M69_big_0c000::0dc9          
  0bd5  0DC9           addr M69_big_0c000::0dc9          
  0bd7  0B71           addr M69_big_0c000::0b71          
  0bd9  0B71           addr M69_big_0c000::0b71          
LAB_M69_big_0c000__0bdb:
  0bdb  FC7120         LDD 0x7120                        
  0bde  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0be2  60E9           addr 60e9                         
LAB_M69_big_0c000__0be4:
  0be4  39             RTS                               

; ---- function FUN_M69_big_0c000__0be5
FUN_M69_big_0c000__0be5:
  0be5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " depth 1" " depth 2" " depth 3" " depth4 "
  0be9  206465707468.. ds " depth 1"                     
  0bf1  206465707468.. ds " depth 2"                     
  0bf9  206465707468.. ds " depth 3"                     
  0c01  206465707468.. ds " depth4 "                     
LAB_M69_big_0c000__0c09:
  0c09  AD9FFDF2       JSR [0xfdf2]                      
  0c0d  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D67 ->$1D71 ->$1D7B ->$1D85 ->$0C1E ->$0C1E
  0c11  1D67           addr M69_big_0c000::1d67          
  0c13  1D71           addr M69_big_0c000::1d71          
  0c15  1D7B           addr M69_big_0c000::1d7b          
  0c17  1D85           addr M69_big_0c000::1d85          
  0c19  0C1E           addr M69_big_0c000::0c1e          
  0c1b  0C1E           addr M69_big_0c000::0c1e          
LAB_M69_big_0c000__0c1d:
  0c1d  39             RTS                               

; ---- function FUN_M69_big_0c000__0c1e
FUN_M69_big_0c000__0c1e:
  0c1e  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " depth 5" " depth6 " [*] " return "
  0c22  206465707468.. ds " depth 5"                     
  0c2a  206465707468.. ds " depth6 "                     
  0c32  01             db 1h                             
  0c33  207265747572.. ds " return "                     
LAB_M69_big_0c000__0c3b:
  0c3b  AD9FFDF2       JSR [0xfdf2]                      
  0c3f  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1D8F ->$1D99 ->$0DC9 ->$0DC9 ->$0BE5 ->$0BE5
  0c43  1D8F           addr M69_big_0c000::1d8f          
  0c45  1D99           addr M69_big_0c000::1d99          
  0c47  0DC9           addr M69_big_0c000::0dc9          
  0c49  0DC9           addr M69_big_0c000::0dc9          
  0c4b  0BE5           addr M69_big_0c000::0be5          
  0c4d  0BE5           addr M69_big_0c000::0be5          
LAB_M69_big_0c000__0c4f:
  0c4f  FC7120         LDD 0x7120                        
  0c52  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0c56  60E9           addr 60e9                         
LAB_M69_big_0c000__0c58:
  0c58  39             RTS                               

; ---- function FUN_M69_big_0c000__0c59
FUN_M69_big_0c000__0c59:
  0c59  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " level 1" " level 2" " level 3" " level 4"
  0c5d  206C6576656C.. ds " level 1"                     
  0c65  206C6576656C.. ds " level 2"                     
  0c6d  206C6576656C.. ds " level 3"                     
  0c75  206C6576656C.. ds " level 4"                     
LAB_M69_big_0c000__0c7d:
  0c7d  AD9FFDF2       JSR [0xfdf2]                      
  0c81  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1EC4 ->$1ED2 ->$1EE0 ->$1EEE ->$0C92 ->$0C92
  0c85  1EC4           addr M69_big_0c000::1ec4          
  0c87  1ED2           addr M69_big_0c000::1ed2          
  0c89  1EE0           addr M69_big_0c000::1ee0          
  0c8b  1EEE           addr M69_big_0c000::1eee          
  0c8d  0C92           addr M69_big_0c000::0c92          
  0c8f  0C92           addr M69_big_0c000::0c92          
LAB_M69_big_0c000__0c91:
  0c91  39             RTS                               

; ---- function FUN_M69_big_0c000__0c92
FUN_M69_big_0c000__0c92:
  0c92  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " level 5" " level 6" [*] " return "
  0c96  206C6576656C.. ds " level 5"                     
  0c9e  206C6576656C.. ds " level 6"                     
  0ca6  01             db 1h                             
  0ca7  207265747572.. ds " return "                     
LAB_M69_big_0c000__0caf:
  0caf  AD9FFDF2       JSR [0xfdf2]                      
  0cb3  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$1EFC ->$1F0A ->$0DC9 ->$0DC9 ->$0C59 ->$0C59
  0cb7  1EFC           addr M69_big_0c000::1efc          
  0cb9  1F0A           addr M69_big_0c000::1f0a          
  0cbb  0DC9           addr M69_big_0c000::0dc9          
  0cbd  0DC9           addr M69_big_0c000::0dc9          
  0cbf  0C59           addr M69_big_0c000::0c59          
  0cc1  0C59           addr M69_big_0c000::0c59          
LAB_M69_big_0c000__0cc3:
  0cc3  FC7120         LDD 0x7120                        
  0cc6  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0cca  60E9           addr 60e9                         
LAB_M69_big_0c000__0ccc:
  0ccc  39             RTS                               

; ---- function FUN_M69_big_0c000__0ccd
FUN_M69_big_0c000__0ccd:
  0ccd  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 1  " " pan 2  " " pan 3  " " pan 4  "
  0cd1  2070616E2031.. ds " pan 1  "                     
  0cd9  2070616E2032.. ds " pan 2  "                     
  0ce1  2070616E2033.. ds " pan 3  "                     
  0ce9  2070616E2034.. ds " pan 4  "                     
LAB_M69_big_0c000__0cf1:
  0cf1  AD9FFDF2       JSR [0xfdf2]                      
  0cf5  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2082 ->$2090 ->$209E ->$20AC ->$0D06 ->$0D06
  0cf9  2082           addr M69_big_0c000::2082          
  0cfb  2090           addr M69_big_0c000::2090          
  0cfd  209E           addr M69_big_0c000::209e          
  0cff  20AC           addr M69_big_0c000::20ac          
  0d01  0D06           addr M69_big_0c000::0d06          
  0d03  0D06           addr M69_big_0c000::0d06          
LAB_M69_big_0c000__0d05:
  0d05  39             RTS                               

; ---- function FUN_M69_big_0c000__0d06
FUN_M69_big_0c000__0d06:
  0d06  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " pan 5  " " pan 6  " [*] " return "
  0d0a  2070616E2035.. ds " pan 5  "                     
  0d12  2070616E2036.. ds " pan 6  "                     
  0d1a  01             db 1h                             
  0d1b  207265747572.. ds " return "                     
LAB_M69_big_0c000__0d23:
  0d23  AD9FFDF2       JSR [0xfdf2]                      
  0d27  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$20BA ->$20C8 ->$0DC9 ->$0DC9 ->$0CCD ->$0CCD
  0d2b  20BA           addr M69_big_0c000::20ba          
  0d2d  20C8           addr M69_big_0c000::20c8          
  0d2f  0DC9           addr M69_big_0c000::0dc9          
  0d31  0DC9           addr M69_big_0c000::0dc9          
  0d33  0CCD           addr M69_big_0c000::0ccd          
  0d35  0CCD           addr M69_big_0c000::0ccd          
LAB_M69_big_0c000__0d37:
  0d37  FC7120         LDD 0x7120                        
  0d3a  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0d3e  60E9           addr 60e9                         
LAB_M69_big_0c000__0d40:
  0d40  39             RTS                               

; ---- function FUN_M69_big_0c000__0d41
FUN_M69_big_0c000__0d41:
  0d41  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  fb   1" "  fb   2" "  fb   3" "  fb  4 "
  0d45  202066622020.. ds "  fb   1"                     
  0d4d  202066622020.. ds "  fb   2"                     
  0d55  202066622020.. ds "  fb   3"                     
  0d5d  202066622020.. ds "  fb  4 "                     
LAB_M69_big_0c000__0d65:
  0d65  AD9FFDF2       JSR [0xfdf2]                      
  0d69  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$21FC ->$2206 ->$2210 ->$221A ->$0D7A ->$0D7A
  0d6d  21FC           addr M69_big_0c000::21fc          
  0d6f  2206           addr M69_big_0c000::2206          
  0d71  2210           addr M69_big_0c000::2210          
  0d73  221A           addr M69_big_0c000::221a          
  0d75  0D7A           addr M69_big_0c000::0d7a          
  0d77  0D7A           addr M69_big_0c000::0d7a          
LAB_M69_big_0c000__0d79:
  0d79  39             RTS                               

; ---- function FUN_M69_big_0c000__0d7a
FUN_M69_big_0c000__0d7a:
  0d7a  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "  fb   5" "  fb  6 " [*] " return "
  0d7e  202066622020.. ds "  fb   5"                     
  0d86  202066622020.. ds "  fb  6 "                     
  0d8e  01             db 1h                             
  0d8f  207265747572.. ds " return "                     
LAB_M69_big_0c000__0d97:
  0d97  AD9FFDF2       JSR [0xfdf2]                      
  0d9b  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$2224 ->$222E ->$0DC9 ->$0DC9 ->$0D41 ->$0D41
  0d9f  2224           addr M69_big_0c000::2224          
  0da1  222E           addr M69_big_0c000::222e          
  0da3  0DC9           addr M69_big_0c000::0dc9          
  0da5  0DC9           addr M69_big_0c000::0dc9          
  0da7  0D41           addr M69_big_0c000::0d41          
  0da9  0D41           addr M69_big_0c000::0d41          
LAB_M69_big_0c000__0dab:
  0dab  FC7120         LDD 0x7120                        
  0dae  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $60E9
  0db2  60E9           addr 60e9                         
LAB_M69_big_0c000__0db4:
  0db4  39             RTS                               

; ---- function FUN_M69_big_0c000__0db5
FUN_M69_big_0c000__0db5:
  0db5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] " range  " [-] [-]
  0db9  00             db 0h                             
  0dba  2072616E6765.. ds " range  "                     
  0dc2  00             db 0h                             
  0dc3  00             db 0h                             
LAB_M69_big_0c000__0dc4:
  0dc4  AD9FFDF2       JSR [0xfdf2]                      
  0dc8  39             RTS                               

; ---- function FUN_M69_big_0c000__0dc9
FUN_M69_big_0c000__0dc9:
  0dc9  39             RTS                               
PTR_FUN_M69_big_0c000__0e8e_M69_big_0c000__0dca:
  0dca  0E8E           addr M69_big_0c000::0e8e          
  0dcc  0EA3           addr M69_big_0c000::0ea3          
  0dce  7018           addr 7018                         
  0dd0  .db 00 51 F8 00 08 00 00 05                          ; .Q......

; ---- function FUN_M69_big_0c000__0dd8
FUN_M69_big_0c000__0dd8:
  0dd8  3410           PSHS  X                           
  0dda  8E0DCA         LDX #0xdca                         ; desc[API_FE1C]: ->$0E8E ->$0EA3 $7018
  0ddd  AD9FFE1C       JSR [0xfe1c]                      
  0de1  3510           PULS  X                           
  0de3  39             RTS                               

; ---- function FUN_M69_big_0c000__0de4
FUN_M69_big_0c000__0de4:
  0de4  3410           PSHS  X                           
  0de6  8E0DCA         LDX #0xdca                         ; desc[API_FE1A]: ->$0E8E ->$0EA3 $7018
  0de9  AD9FFE1A       JSR [0xfe1a]                      
  0ded  3510           PULS  X                           
  0def  39             RTS                               

; ---- function FUN_M69_big_0c000__0df0
FUN_M69_big_0c000__0df0:
  0df0  3426           PSHS  Y B A                       
  0df2  AD9FFC8E       JSR [0xfc8e]                      
  0df6  FC60F9         LDD 0x60f9                        
  0df9  FD6074         STD 0x6074                        
  0dfc  B3701A         SUBD 0x701a                       
  0dff  FD7018         STD 0x7018                        
  0e02  17009E         LBSR 0x0ea3                       
  0e05  CC7175         LDD #0x7175                       
  0e08  837126         SUBD #0x7126                      
  0e0b  1F02           TFR D,Y                           
  0e0d  FC7018         LDD 0x7018                        
  0e10  AD9FFC82       JSR [0xfc82]                      
  0e14  3526           PULS  A B Y                       
  0e16  39             RTS                               

; ---- function FUN_M69_big_0c000__0e17
FUN_M69_big_0c000__0e17:
  0e17  3406           PSHS  B A                         
  0e19  FC701C         LDD 0x701c                        
  0e1c  FD6074         STD 0x6074                        
  0e1f  17F94A         LBSR 0x076c                       
  0e22  C613           LDB #0x13                         
  0e24  AD9FFC36       JSR [0xfc36]                      
  0e28  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " master fdback:     %"
  0e2c  0A6D61737465.. char[22] "\nmaster fdback:     %" 
LAB_M69_big_0c000__0e42:
  0e42  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$0E8E ->$0E64 $0001 $0001 $0000
  0e46  01             db 1h                             
  0e47  01             db 1h                             
  0e48  02             db 2h                             
  0e49  01             db 1h                             
  0e4a  01             db 1h                             
  0e4b  00             db 0h                             
  0e4c  04             db 4h                             
  0e4d  80             db 80h                            
  0e4e  0064           dw 64h                            
  0e50  FF9C           dw FF9Ch                          
  0e52  0000           dw 0h                             
  0e54  0E8E           addr M69_big_0c000::0e8e          
  0e56  0E64           addr M69_big_0c000::0e64          
  0e58  0001           dw 1h                             
  0e5a  0001           dw 1h                             
  0e5c  0000           dw 0h                             
LAB_M69_big_0c000__0e5e:
  0e5e  17002D         LBSR 0x0e8e                       
  0e61  3506           PULS  A B                         
  0e63  39             RTS                               

; ---- function FUN_M69_big_0c000__0e64
FUN_M69_big_0c000__0e64:
  0e64  3426           PSHS  Y B A                       
  0e66  FC6074         LDD 0x6074                        
  0e69  B3701A         SUBD 0x701a                       
  0e6c  FD7018         STD 0x7018                        
  0e6f  CC7175         LDD #0x7175                       
  0e72  837126         SUBD #0x7126                      
  0e75  1F02           TFR D,Y                           
  0e77  FC7018         LDD 0x7018                        
  0e7a  AD9FFC82       JSR [0xfc82]                      
  0e7e  108E0001       LDY #0x1                          
  0e82  FC7018         LDD 0x7018                        
  0e85  AD9FFE40       JSR [0xfe40]                      
  0e89  8D18           BSR 0x0ea3                        
  0e8b  3526           PULS  A B Y                       
  0e8d  39             RTS                               

; ---- function FUN_M69_big_0c000__0e8e
FUN_M69_big_0c000__0e8e:
  0e8e  3456           PSHS  U X B A                     
  0e90  C622           LDB #0x22                         
  0e92  AD9FFC36       JSR [0xfc36]                      
  0e96  CC0004         LDD #0x4                          
  0e99  8E609F         LDX #0x609f                       
  0e9c  AD9FFC3A       JSR [0xfc3a]                      
  0ea0  3556           PULS  A B X U                     
  0ea2  39             RTS                               

; ---- function FUN_M69_big_0c000__0ea3
FUN_M69_big_0c000__0ea3:
  0ea3  3466           PSHS  U Y B A                     
  0ea5  CCFF9C         LDD #0xff9c                       
  0ea8  3606           PSHU  B A                         
  0eaa  CC0064         LDD #0x64                         
  0ead  3606           PSHU  B A                         
  0eaf  FC7018         LDD 0x7018                        
  0eb2  F3701A         ADDD 0x701a                       
  0eb5  3606           PSHU  B A                         
  0eb7  AD9FFCD8       JSR [0xfcd8]                      
  0ebb  3706           PULU  A B                         
  0ebd  FD701C         STD 0x701c                        
  0ec0  FC7050         LDD 0x7050                        
  0ec3  10830000       CMPD #0x0                         
  0ec7  10270053       LBEQ 0x0f1e                       
  0ecb  FC701C         LDD 0x701c                        
  0ece  3606           PSHU  B A                         
  0ed0  CC0134         LDD #0x134                        
  0ed3  3606           PSHU  B A                         
  0ed5  AD9FFCEC       JSR [0xfcec]                      
  0ed9  3706           PULU  A B                         
  0edb  FD70FA         STD 0x70fa                        
  0ede  FC701C         LDD 0x701c                        
  0ee1  3606           PSHU  B A                         
  0ee3  CC7851         LDD #0x7851                       
  0ee6  3606           PSHU  B A                         
  0ee8  AD9FFCF2       JSR [0xfcf2]                      
  0eec  3706           PULU  A B                         
  0eee  F370FA         ADDD 0x70fa                       
  0ef1  FD7124         STD 0x7124                        
  0ef4  CC000A         LDD #0xa                          
  0ef7  AD9FFD20       JSR [0xfd20]                      
  0efb  108E0240       LDY #0x240                        
  0eff  FC7124         LDD 0x7124                        
  0f02  AD9FFD2E       JSR [0xfd2e]                      
  0f06  CC7FFF         LDD #0x7fff                       
  0f09  FD70FC         STD 0x70fc                        
  0f0c  CC000A         LDD #0xa                          
  0f0f  AD9FFD20       JSR [0xfd20]                      
  0f13  108E0241       LDY #0x241                        
  0f17  FC70FC         LDD 0x70fc                        
  0f1a  AD9FFD2E       JSR [0xfd2e]                      
LAB_M69_big_0c000__0f1e:
  0f1e  3566           PULS  A B Y U                     
  0f20  39             RTS                               
PTR_FUN_M69_big_0c000__0fe5_M69_big_0c000__0f21:
  0f21  0FE5           addr M69_big_0c000::0fe5          
  0f23  0FFA           addr M69_big_0c000::0ffa          
  0f25  7030           addr 7030                         
  0f27  .db 00 37 FC 00 04 00 00 04                          ; .7......

; ---- function FUN_M69_big_0c000__0f2f
FUN_M69_big_0c000__0f2f:
  0f2f  3410           PSHS  X                           
  0f31  8E0F21         LDX #0xf21                         ; desc[API_FE1C]: ->$0FE5 ->$0FFA $7030
  0f34  AD9FFE1C       JSR [0xfe1c]                      
  0f38  3510           PULS  X                           
  0f3a  39             RTS                               

; ---- function FUN_M69_big_0c000__0f3b
FUN_M69_big_0c000__0f3b:
  0f3b  3410           PSHS  X                           
  0f3d  8E0F21         LDX #0xf21                         ; desc[API_FE1A]: ->$0FE5 ->$0FFA $7030
  0f40  AD9FFE1A       JSR [0xfe1a]                      
  0f44  3510           PULS  X                           
  0f46  39             RTS                               

; ---- function FUN_M69_big_0c000__0f47
FUN_M69_big_0c000__0f47:
  0f47  3426           PSHS  Y B A                       
  0f49  AD9FFC8E       JSR [0xfc8e]                      
  0f4d  FC60F9         LDD 0x60f9                        
  0f50  FD6074         STD 0x6074                        
  0f53  B37032         SUBD 0x7032                       
  0f56  FD7030         STD 0x7030                        
  0f59  17009E         LBSR 0x0ffa                       
  0f5c  CC715B         LDD #0x715b                       
  0f5f  837126         SUBD #0x7126                      
  0f62  1F02           TFR D,Y                           
  0f64  FC7030         LDD 0x7030                        
  0f67  AD9FFC82       JSR [0xfc82]                      
  0f6b  3526           PULS  A B Y                       
  0f6d  39             RTS                               

; ---- function FUN_M69_big_0c000__0f6e
FUN_M69_big_0c000__0f6e:
  0f6e  3406           PSHS  B A                         
  0f70  FC7034         LDD 0x7034                        
  0f73  FD6074         STD 0x6074                        
  0f76  17F7F3         LBSR 0x076c                       
  0f79  C613           LDB #0x13                         
  0f7b  AD9FFC36       JSR [0xfc36]                      
  0f7f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " master rate:     %  "
  0f83  0A6D61737465.. char[22] "\nmaster rate:     %  " 
LAB_M69_big_0c000__0f99:
  0f99  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$0FE5 ->$0FBB $0001 $0001 $0000
  0f9d  01             db 1h                             
  0f9e  01             db 1h                             
  0f9f  02             db 2h                             
  0fa0  01             db 1h                             
  0fa1  01             db 1h                             
  0fa2  00             db 0h                             
  0fa3  03             db 3h                             
  0fa4  80             db 80h                            
  0fa5  0064           dw 64h                            
  0fa7  0000           dw 0h                             
  0fa9  0000           dw 0h                             
  0fab  0FE5           addr M69_big_0c000::0fe5          
  0fad  0FBB           addr M69_big_0c000::0fbb          
  0faf  0001           dw 1h                             
  0fb1  0001           dw 1h                             
  0fb3  0000           dw 0h                             
LAB_M69_big_0c000__0fb5:
  0fb5  17002D         LBSR 0x0fe5                       
  0fb8  3506           PULS  A B                         
  0fba  39             RTS                               

; ---- function FUN_M69_big_0c000__0fbb
FUN_M69_big_0c000__0fbb:
  0fbb  3426           PSHS  Y B A                       
  0fbd  FC6074         LDD 0x6074                        
  0fc0  B37032         SUBD 0x7032                       
  0fc3  FD7030         STD 0x7030                        
  0fc6  CC715B         LDD #0x715b                       
  0fc9  837126         SUBD #0x7126                      
  0fcc  1F02           TFR D,Y                           
  0fce  FC7030         LDD 0x7030                        
  0fd1  AD9FFC82       JSR [0xfc82]                      
  0fd5  108E0003       LDY #0x3                          
  0fd9  FC7030         LDD 0x7030                        
  0fdc  AD9FFE40       JSR [0xfe40]                      
  0fe0  8D18           BSR 0x0ffa                        
  0fe2  3526           PULS  A B Y                       
  0fe4  39             RTS                               

; ---- function FUN_M69_big_0c000__0fe5
FUN_M69_big_0c000__0fe5:
  0fe5  3456           PSHS  U X B A                     
  0fe7  C620           LDB #0x20                         
  0fe9  AD9FFC36       JSR [0xfc36]                      
  0fed  CC0003         LDD #0x3                          
  0ff0  8E60A0         LDX #0x60a0                       
  0ff3  AD9FFC3A       JSR [0xfc3a]                      
  0ff7  3556           PULS  A B X U                     
  0ff9  39             RTS                               

; ---- function FUN_M69_big_0c000__0ffa
FUN_M69_big_0c000__0ffa:
  0ffa  3466           PSHS  U Y B A                     
  0ffc  CC0000         LDD #0x0                          
  0fff  3606           PSHU  B A                         
  1001  CC0064         LDD #0x64                         
  1004  3606           PSHU  B A                         
  1006  FC7030         LDD 0x7030                        
  1009  F37032         ADDD 0x7032                       
  100c  3606           PSHU  B A                         
  100e  AD9FFCD8       JSR [0xfcd8]                      
  1012  3706           PULU  A B                         
  1014  FD7034         STD 0x7034                        
  1017  FC7034         LDD 0x7034                        
  101a  3606           PSHU  B A                         
  101c  CC0147         LDD #0x147                        
  101f  3606           PSHU  B A                         
  1021  AD9FFCEE       JSR [0xfcee]                      
  1025  3706           PULU  A B                         
  1027  FD7116         STD 0x7116                        
  102a  171F2D         LBSR 0x2f5a                       
  102d  3566           PULS  A B Y U                     
  102f  39             RTS                               
PTR_FUN_M69_big_0c000__10f4_M69_big_0c000__1030:
  1030  10F4           addr M69_big_0c000::10f4          
  1032  1109           addr M69_big_0c000::1109          
  1034  7028           addr 7028                         
  1036  .db 00 55 FC 00 04 00 00 04                          ; .U......

; ---- function FUN_M69_big_0c000__103e
FUN_M69_big_0c000__103e:
  103e  3410           PSHS  X                           
  1040  8E1030         LDX #0x1030                        ; desc[API_FE1C]: ->$10F4 ->$1109 $7028
  1043  AD9FFE1C       JSR [0xfe1c]                      
  1047  3510           PULS  X                           
  1049  39             RTS                               

; ---- function FUN_M69_big_0c000__104a
FUN_M69_big_0c000__104a:
  104a  3410           PSHS  X                           
  104c  8E1030         LDX #0x1030                        ; desc[API_FE1A]: ->$10F4 ->$1109 $7028
  104f  AD9FFE1A       JSR [0xfe1a]                      
  1053  3510           PULS  X                           
  1055  39             RTS                               

; ---- function FUN_M69_big_0c000__1056
FUN_M69_big_0c000__1056:
  1056  3426           PSHS  Y B A                       
  1058  AD9FFC8E       JSR [0xfc8e]                      
  105c  FC60F9         LDD 0x60f9                        
  105f  FD6074         STD 0x6074                        
  1062  B3702A         SUBD 0x702a                       
  1065  FD7028         STD 0x7028                        
  1068  17009E         LBSR 0x1109                       
  106b  CC7179         LDD #0x7179                       
  106e  837126         SUBD #0x7126                      
  1071  1F02           TFR D,Y                           
  1073  FC7028         LDD 0x7028                        
  1076  AD9FFC82       JSR [0xfc82]                      
  107a  3526           PULS  A B Y                       
  107c  39             RTS                               

; ---- function FUN_M69_big_0c000__107d
FUN_M69_big_0c000__107d:
  107d  3406           PSHS  B A                         
  107f  FC702C         LDD 0x702c                        
  1082  FD6074         STD 0x6074                        
  1085  17F6E4         LBSR 0x076c                       
  1088  C613           LDB #0x13                         
  108a  AD9FFC36       JSR [0xfc36]                      
  108e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " master depth:     % "
  1092  0A6D61737465.. char[22] "\nmaster depth:     % " 
LAB_M69_big_0c000__10a8:
  10a8  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$10F4 ->$10CA $0001 $0001 $0000
  10ac  01             db 1h                             
  10ad  01             db 1h                             
  10ae  02             db 2h                             
  10af  01             db 1h                             
  10b0  01             db 1h                             
  10b1  00             db 0h                             
  10b2  03             db 3h                             
  10b3  80             db 80h                            
  10b4  0064           dw 64h                            
  10b6  0000           dw 0h                             
  10b8  0000           dw 0h                             
  10ba  10F4           addr M69_big_0c000::10f4          
  10bc  10CA           addr M69_big_0c000::10ca          
  10be  0001           dw 1h                             
  10c0  0001           dw 1h                             
  10c2  0000           dw 0h                             
LAB_M69_big_0c000__10c4:
  10c4  17002D         LBSR 0x10f4                       
  10c7  3506           PULS  A B                         
  10c9  39             RTS                               

; ---- function FUN_M69_big_0c000__10ca
FUN_M69_big_0c000__10ca:
  10ca  3426           PSHS  Y B A                       
  10cc  FC6074         LDD 0x6074                        
  10cf  B3702A         SUBD 0x702a                       
  10d2  FD7028         STD 0x7028                        
  10d5  CC7179         LDD #0x7179                       
  10d8  837126         SUBD #0x7126                      
  10db  1F02           TFR D,Y                           
  10dd  FC7028         LDD 0x7028                        
  10e0  AD9FFC82       JSR [0xfc82]                      
  10e4  108E0008       LDY #0x8                          
  10e8  FC7028         LDD 0x7028                        
  10eb  AD9FFE40       JSR [0xfe40]                      
  10ef  8D18           BSR 0x1109                        
  10f1  3526           PULS  A B Y                       
  10f3  39             RTS                               

; ---- function FUN_M69_big_0c000__10f4
FUN_M69_big_0c000__10f4:
  10f4  3456           PSHS  U X B A                     
  10f6  C621           LDB #0x21                         
  10f8  AD9FFC36       JSR [0xfc36]                      
  10fc  CC0003         LDD #0x3                          
  10ff  8E60A0         LDX #0x60a0                       
  1102  AD9FFC3A       JSR [0xfc3a]                      
  1106  3556           PULS  A B X U                     
  1108  39             RTS                               

; ---- function FUN_M69_big_0c000__1109
FUN_M69_big_0c000__1109:
  1109  3466           PSHS  U Y B A                     
  110b  CC0000         LDD #0x0                          
  110e  3606           PSHU  B A                         
  1110  CC0064         LDD #0x64                         
  1113  3606           PSHU  B A                         
  1115  FC7028         LDD 0x7028                        
  1118  F3702A         ADDD 0x702a                       
  111b  3606           PSHU  B A                         
  111d  AD9FFCD8       JSR [0xfcd8]                      
  1121  3706           PULU  A B                         
  1123  FD702C         STD 0x702c                        
  1126  FC702C         LDD 0x702c                        
  1129  3606           PSHU  B A                         
  112b  CC0147         LDD #0x147                        
  112e  3606           PSHU  B A                         
  1130  AD9FFCEE       JSR [0xfcee]                      
  1134  3706           PULU  A B                         
  1136  FD7114         STD 0x7114                        
  1139  171E8C         LBSR 0x2fc8                       
  113c  3566           PULS  A B Y U                     
  113e  39             RTS                               
PTR_FUN_M69_big_0c000__1203_M69_big_0c000__113f:
  113f  1203           addr M69_big_0c000::1203          
  1141  1218           addr M69_big_0c000::1218          
  1143  7038           addr 7038                         
  1145  .db 00 33 FC 00 04 00 00 04                          ; .3......

; ---- function FUN_M69_big_0c000__114d
FUN_M69_big_0c000__114d:
  114d  3410           PSHS  X                           
  114f  8E113F         LDX #0x113f                        ; desc[API_FE1C]: ->$1203 ->$1218 $7038
  1152  AD9FFE1C       JSR [0xfe1c]                      
  1156  3510           PULS  X                           
  1158  39             RTS                               

; ---- function FUN_M69_big_0c000__1159
FUN_M69_big_0c000__1159:
  1159  3410           PSHS  X                           
  115b  8E113F         LDX #0x113f                        ; desc[API_FE1A]: ->$1203 ->$1218 $7038
  115e  AD9FFE1A       JSR [0xfe1a]                      
  1162  3510           PULS  X                           
  1164  39             RTS                               

; ---- function FUN_M69_big_0c000__1165
FUN_M69_big_0c000__1165:
  1165  3426           PSHS  Y B A                       
  1167  AD9FFC8E       JSR [0xfc8e]                      
  116b  FC60F9         LDD 0x60f9                        
  116e  FD6074         STD 0x6074                        
  1171  B3703A         SUBD 0x703a                       
  1174  FD7038         STD 0x7038                        
  1177  17009E         LBSR 0x1218                       
  117a  CC7157         LDD #0x7157                       
  117d  837126         SUBD #0x7126                      
  1180  1F02           TFR D,Y                           
  1182  FC7038         LDD 0x7038                        
  1185  AD9FFC82       JSR [0xfc82]                      
  1189  3526           PULS  A B Y                       
  118b  39             RTS                               

; ---- function FUN_M69_big_0c000__118c
FUN_M69_big_0c000__118c:
  118c  3406           PSHS  B A                         
  118e  FC703C         LDD 0x703c                        
  1191  FD6074         STD 0x6074                        
  1194  17F5D5         LBSR 0x076c                       
  1197  C613           LDB #0x13                         
  1199  AD9FFC36       JSR [0xfc36]                      
  119d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " master delay:     % "
  11a1  0A6D61737465.. char[22] "\nmaster delay:     % " 
LAB_M69_big_0c000__11b7:
  11b7  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1203 ->$11D9 $0001 $0001 $0000
  11bb  01             db 1h                             
  11bc  01             db 1h                             
  11bd  02             db 2h                             
  11be  01             db 1h                             
  11bf  01             db 1h                             
  11c0  00             db 0h                             
  11c1  03             db 3h                             
  11c2  80             db 80h                            
  11c3  0064           dw 64h                            
  11c5  0000           dw 0h                             
  11c7  0000           dw 0h                             
  11c9  1203           addr M69_big_0c000::1203          
  11cb  11D9           addr M69_big_0c000::11d9          
  11cd  0001           dw 1h                             
  11cf  0001           dw 1h                             
  11d1  0000           dw 0h                             
LAB_M69_big_0c000__11d3:
  11d3  17002D         LBSR 0x1203                       
  11d6  3506           PULS  A B                         
  11d8  39             RTS                               

; ---- function FUN_M69_big_0c000__11d9
FUN_M69_big_0c000__11d9:
  11d9  3426           PSHS  Y B A                       
  11db  FC6074         LDD 0x6074                        
  11de  B3703A         SUBD 0x703a                       
  11e1  FD7038         STD 0x7038                        
  11e4  CC7157         LDD #0x7157                       
  11e7  837126         SUBD #0x7126                      
  11ea  1F02           TFR D,Y                           
  11ec  FC7038         LDD 0x7038                        
  11ef  AD9FFC82       JSR [0xfc82]                      
  11f3  108E0002       LDY #0x2                          
  11f7  FC7038         LDD 0x7038                        
  11fa  AD9FFE40       JSR [0xfe40]                      
  11fe  8D18           BSR 0x1218                        
  1200  3526           PULS  A B Y                       
  1202  39             RTS                               

; ---- function FUN_M69_big_0c000__1203
FUN_M69_big_0c000__1203:
  1203  3456           PSHS  U X B A                     
  1205  C622           LDB #0x22                         
  1207  AD9FFC36       JSR [0xfc36]                      
  120b  CC0003         LDD #0x3                          
  120e  8E60A0         LDX #0x60a0                       
  1211  AD9FFC3A       JSR [0xfc3a]                      
  1215  3556           PULS  A B X U                     
  1217  39             RTS                               

; ---- function FUN_M69_big_0c000__1218
FUN_M69_big_0c000__1218:
  1218  3466           PSHS  U Y B A                     
  121a  CC0000         LDD #0x0                          
  121d  3606           PSHU  B A                         
  121f  CC0064         LDD #0x64                         
  1222  3606           PSHU  B A                         
  1224  FC7038         LDD 0x7038                        
  1227  F3703A         ADDD 0x703a                       
  122a  3606           PSHU  B A                         
  122c  AD9FFCD8       JSR [0xfcd8]                      
  1230  3706           PULU  A B                         
  1232  FD703C         STD 0x703c                        
  1235  FC703C         LDD 0x703c                        
  1238  3606           PSHU  B A                         
  123a  CC0147         LDD #0x147                        
  123d  3606           PSHU  B A                         
  123f  AD9FFCEE       JSR [0xfcee]                      
  1243  3706           PULU  A B                         
  1245  FD7118         STD 0x7118                        
  1248  171C70         LBSR 0x2ebb                       
  124b  3566           PULS  A B Y U                     
  124d  39             RTS                               
PTR_FUN_M69_big_0c000__1312_M69_big_0c000__124e:
  124e  1312           addr M69_big_0c000::1312          
  1250  1327           addr M69_big_0c000::1327          
  1252  7020           addr 7020                         
  1254  .db 00 3F FC 00 04 00 00 04                          ; .?......

; ---- function FUN_M69_big_0c000__125c
FUN_M69_big_0c000__125c:
  125c  3410           PSHS  X                           
  125e  8E124E         LDX #0x124e                        ; desc[API_FE1C]: ->$1312 ->$1327 $7020
  1261  AD9FFE1C       JSR [0xfe1c]                      
  1265  3510           PULS  X                           
  1267  39             RTS                               

; ---- function FUN_M69_big_0c000__1268
FUN_M69_big_0c000__1268:
  1268  3410           PSHS  X                           
  126a  8E124E         LDX #0x124e                        ; desc[API_FE1A]: ->$1312 ->$1327 $7020
  126d  AD9FFE1A       JSR [0xfe1a]                      
  1271  3510           PULS  X                           
  1273  39             RTS                               

; ---- function FUN_M69_big_0c000__1274
FUN_M69_big_0c000__1274:
  1274  3426           PSHS  Y B A                       
  1276  AD9FFC8E       JSR [0xfc8e]                      
  127a  FC60F9         LDD 0x60f9                        
  127d  FD6074         STD 0x6074                        
  1280  B37022         SUBD 0x7022                       
  1283  FD7020         STD 0x7020                        
  1286  17009E         LBSR 0x1327                       
  1289  CC7163         LDD #0x7163                       
  128c  837126         SUBD #0x7126                      
  128f  1F02           TFR D,Y                           
  1291  FC7020         LDD 0x7020                        
  1294  AD9FFC82       JSR [0xfc82]                      
  1298  3526           PULS  A B Y                       
  129a  39             RTS                               

; ---- function FUN_M69_big_0c000__129b
FUN_M69_big_0c000__129b:
  129b  3406           PSHS  B A                         
  129d  FC7024         LDD 0x7024                        
  12a0  FD6074         STD 0x6074                        
  12a3  17F4C6         LBSR 0x076c                       
  12a6  C613           LDB #0x13                         
  12a8  AD9FFC36       JSR [0xfc36]                      
  12ac  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " glide rate:         "
  12b0  0A676C696465.. char[22] "\nglide rate:         " 
LAB_M69_big_0c000__12c6:
  12c6  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1312 ->$12E8 $0001 $0001 $0000
  12ca  01             db 1h                             
  12cb  01             db 1h                             
  12cc  02             db 2h                             
  12cd  01             db 1h                             
  12ce  01             db 1h                             
  12cf  00             db 0h                             
  12d0  03             db 3h                             
  12d1  80             db 80h                            
  12d2  0064           dw 64h                            
  12d4  0000           dw 0h                             
  12d6  0000           dw 0h                             
  12d8  1312           addr M69_big_0c000::1312          
  12da  12E8           addr M69_big_0c000::12e8          
  12dc  0001           dw 1h                             
  12de  0001           dw 1h                             
  12e0  0000           dw 0h                             
LAB_M69_big_0c000__12e2:
  12e2  17002D         LBSR 0x1312                       
  12e5  3506           PULS  A B                         
  12e7  39             RTS                               

; ---- function FUN_M69_big_0c000__12e8
FUN_M69_big_0c000__12e8:
  12e8  3466           PSHS  U Y B A                     
  12ea  FC6074         LDD 0x6074                        
  12ed  B37022         SUBD 0x7022                       
  12f0  FD7020         STD 0x7020                        
  12f3  CC7163         LDD #0x7163                       
  12f6  837126         SUBD #0x7126                      
  12f9  1F02           TFR D,Y                           
  12fb  FC7020         LDD 0x7020                        
  12fe  AD9FFC82       JSR [0xfc82]                      
  1302  108E0004       LDY #0x4                          
  1306  FC7020         LDD 0x7020                        
  1309  AD9FFE40       JSR [0xfe40]                      
  130d  8D18           BSR 0x1327                        
  130f  3566           PULS  A B Y U                     
  1311  39             RTS                               

; ---- function FUN_M69_big_0c000__1312
FUN_M69_big_0c000__1312:
  1312  3456           PSHS  U X B A                     
  1314  C620           LDB #0x20                         
  1316  AD9FFC36       JSR [0xfc36]                      
  131a  CC0003         LDD #0x3                          
  131d  8E60A0         LDX #0x60a0                       
  1320  AD9FFC3A       JSR [0xfc3a]                      
  1324  3556           PULS  A B X U                     
  1326  39             RTS                               

; ---- function FUN_M69_big_0c000__1327
FUN_M69_big_0c000__1327:
  1327  3476           PSHS  U Y X B A                   
  1329  CC0000         LDD #0x0                          
  132c  3606           PSHU  B A                         
  132e  CC0064         LDD #0x64                         
  1331  3606           PSHU  B A                         
  1333  FC7020         LDD 0x7020                        
  1336  F37022         ADDD 0x7022                       
  1339  3606           PSHU  B A                         
  133b  AD9FFCD8       JSR [0xfcd8]                      
  133f  3706           PULU  A B                         
  1341  FD7024         STD 0x7024                        
  1344  FC7024         LDD 0x7024                        
  1347  3606           PSHU  B A                         
  1349  CC012C         LDD #0x12c                        
  134c  3606           PSHU  B A                         
  134e  AD9FFCEE       JSR [0xfcee]                      
  1352  3706           PULU  A B                         
  1354  FD7110         STD 0x7110                        
  1357  CC0087         LDD #0x87                         
  135a  3606           PSHU  B A                         
  135c  FC711E         LDD 0x711e                        
  135f  3606           PSHU  B A                         
  1361  AD9FFCEE       JSR [0xfcee]                      
  1365  FC7024         LDD 0x7024                        
  1368  3606           PSHU  B A                         
  136a  AD9FFCE6       JSR [0xfce6]                      
  136e  3706           PULU  A B                         
  1370  58             LSLB                              
  1371  49             ROLA                              
  1372  FD7112         STD 0x7112                        
  1375  3576           PULS  A B X Y U                   
  1377  39             RTS                               

; ---- function FUN_M69_big_0c000__1378
FUN_M69_big_0c000__1378:
  1378  3426           PSHS  Y B A                       
  137a  AD9FFC8E       JSR [0xfc8e]                      
  137e  FC60F9         LDD 0x60f9                        
  1381  FD7058         STD 0x7058                        
  1384  FD6074         STD 0x6074                        
  1387  1700B4         LBSR 0x143e                       
  138a  CC7167         LDD #0x7167                       
  138d  837126         SUBD #0x7126                      
  1390  1F02           TFR D,Y                           
  1392  FC7058         LDD 0x7058                        
  1395  AD9FFC80       JSR [0xfc80]                      
  1399  3526           PULS  A B Y                       
  139b  39             RTS                               

; ---- function FUN_M69_big_0c000__139c
FUN_M69_big_0c000__139c:
  139c  3406           PSHS  B A                         
  139e  FC7058         LDD 0x7058                        
  13a1  FD6074         STD 0x6074                        
  13a4  17F3C5         LBSR 0x076c                       
  13a7  C613           LDB #0x13                         
  13a9  AD9FFC36       JSR [0xfc36]                      
  13ad  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay gliding:      "
  13b1  0A64656C6179.. char[22] "\ndelay gliding:      " 
LAB_M69_big_0c000__13c7:
  13c7  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$1410 ->$13E9 $0001 $0001 $0000
  13cb  01             db 1h                             
  13cc  01             db 1h                             
  13cd  02             db 2h                             
  13ce  01             db 1h                             
  13cf  01             db 1h                             
  13d0  00             db 0h                             
  13d1  02             db 2h                             
  13d2  80             db 80h                            
  13d3  0000           dw 0h                             
  13d5  FFFF           dw FFFFh                          
  13d7  0000           dw 0h                             
  13d9  1410           addr M69_big_0c000::1410          
  13db  13E9           addr M69_big_0c000::13e9          
  13dd  0001           dw 1h                             
  13df  0001           dw 1h                             
  13e1  0000           dw 0h                             
LAB_M69_big_0c000__13e3:
  13e3  17002A         LBSR 0x1410                       
  13e6  3506           PULS  A B                         
  13e8  39             RTS                               

; ---- function FUN_M69_big_0c000__13e9
FUN_M69_big_0c000__13e9:
  13e9  3426           PSHS  Y B A                       
  13eb  FC6074         LDD 0x6074                        
  13ee  FD7058         STD 0x7058                        
  13f1  CC7167         LDD #0x7167                       
  13f4  837126         SUBD #0x7126                      
  13f7  1F02           TFR D,Y                           
  13f9  FC7058         LDD 0x7058                        
  13fc  AD9FFC80       JSR [0xfc80]                      
  1400  108E0005       LDY #0x5                          
  1404  FC7058         LDD 0x7058                        
  1407  AD9FFE40       JSR [0xfe40]                      
  140b  8D31           BSR 0x143e                        
  140d  3526           PULS  A B Y                       
  140f  39             RTS                               

; ---- function FUN_M69_big_0c000__1410
FUN_M69_big_0c000__1410:
  1410  3456           PSHS  U X B A                     
  1412  FC7058         LDD 0x7058                        
  1415  10830000       CMPD #0x0                         
  1419  10270010       LBEQ 0x142d                       
  141d  C623           LDB #0x23                         
  141f  AD9FFC36       JSR [0xfc36]                      
  1423  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "off"
  1427  6F666600       char[4] "off"                     
LAB_M69_big_0c000__142b:
  142b  200E           BRA 0x143b                        
LAB_M69_big_0c000__142d:
  142d  C623           LDB #0x23                         
  142f  AD9FFC36       JSR [0xfc36]                      
  1433  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "on "
  1437  6F6E2000       char[4] "on "                     
LAB_M69_big_0c000__143b:
  143b  3556           PULS  A B X U                     
  143d  39             RTS                               

; ---- function FUN_M69_big_0c000__143e
FUN_M69_big_0c000__143e:
  143e  39             RTS                               
PTR_FUN_M69_big_0c000__1503_M69_big_0c000__143f:
  143f  1503           addr M69_big_0c000::1503          
  1441  1518           addr M69_big_0c000::1518          
  1443  7040           addr 7040                         
  1445  .db 00 7D F8 00 08 00 00 04                          ; .}......

; ---- function FUN_M69_big_0c000__144d
FUN_M69_big_0c000__144d:
  144d  3410           PSHS  X                           
  144f  8E143F         LDX #0x143f                        ; desc[API_FE1C]: ->$1503 ->$1518 $7040
  1452  AD9FFE1C       JSR [0xfe1c]                      
  1456  3510           PULS  X                           
  1458  39             RTS                               

; ---- function FUN_M69_big_0c000__1459
FUN_M69_big_0c000__1459:
  1459  3410           PSHS  X                           
  145b  8E143F         LDX #0x143f                        ; desc[API_FE1A]: ->$1503 ->$1518 $7040
  145e  AD9FFE1A       JSR [0xfe1a]                      
  1462  3510           PULS  X                           
  1464  39             RTS                               

; ---- function FUN_M69_big_0c000__1465
FUN_M69_big_0c000__1465:
  1465  3426           PSHS  Y B A                       
  1467  AD9FFC8E       JSR [0xfc8e]                      
  146b  FC60F9         LDD 0x60f9                        
  146e  FD6074         STD 0x6074                        
  1471  B37042         SUBD 0x7042                       
  1474  FD7040         STD 0x7040                        
  1477  17009E         LBSR 0x1518                       
  147a  CC71A1         LDD #0x71a1                       
  147d  837126         SUBD #0x7126                      
  1480  1F02           TFR D,Y                           
  1482  FC7040         LDD 0x7040                        
  1485  AD9FFC82       JSR [0xfc82]                      
  1489  3526           PULS  A B Y                       
  148b  39             RTS                               

; ---- function FUN_M69_big_0c000__148c
FUN_M69_big_0c000__148c:
  148c  3406           PSHS  B A                         
  148e  FC7044         LDD 0x7044                        
  1491  FD6074         STD 0x6074                        
  1494  17F2D5         LBSR 0x076c                       
  1497  C613           LDB #0x13                         
  1499  AD9FFC36       JSR [0xfc36]                      
  149d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " master fdback:     %"
  14a1  0A6D61737465.. char[22] "\nmaster fdback:     %" 
LAB_M69_big_0c000__14b7:
  14b7  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$1503 ->$14D9 $0001 $0001 $0000
  14bb  01             db 1h                             
  14bc  01             db 1h                             
  14bd  02             db 2h                             
  14be  01             db 1h                             
  14bf  01             db 1h                             
  14c0  00             db 0h                             
  14c1  04             db 4h                             
  14c2  80             db 80h                            
  14c3  0064           dw 64h                            
  14c5  FF9C           dw FF9Ch                          
  14c7  0000           dw 0h                             
  14c9  1503           addr M69_big_0c000::1503          
  14cb  14D9           addr M69_big_0c000::14d9          
  14cd  0001           dw 1h                             
  14cf  0001           dw 1h                             
  14d1  0000           dw 0h                             
LAB_M69_big_0c000__14d3:
  14d3  17002D         LBSR 0x1503                       
  14d6  3506           PULS  A B                         
  14d8  39             RTS                               

; ---- function FUN_M69_big_0c000__14d9
FUN_M69_big_0c000__14d9:
  14d9  3426           PSHS  Y B A                       
  14db  FC6074         LDD 0x6074                        
  14de  B37042         SUBD 0x7042                       
  14e1  FD7040         STD 0x7040                        
  14e4  CC71A1         LDD #0x71a1                       
  14e7  837126         SUBD #0x7126                      
  14ea  1F02           TFR D,Y                           
  14ec  FC7040         LDD 0x7040                        
  14ef  AD9FFC82       JSR [0xfc82]                      
  14f3  108E0009       LDY #0x9                          
  14f7  FC7040         LDD 0x7040                        
  14fa  AD9FFE40       JSR [0xfe40]                      
  14fe  8D18           BSR 0x1518                        
  1500  3526           PULS  A B Y                       
  1502  39             RTS                               

; ---- function FUN_M69_big_0c000__1503
FUN_M69_big_0c000__1503:
  1503  3456           PSHS  U X B A                     
  1505  C622           LDB #0x22                         
  1507  AD9FFC36       JSR [0xfc36]                      
  150b  CC0004         LDD #0x4                          
  150e  8E609F         LDX #0x609f                       
  1511  AD9FFC3A       JSR [0xfc3a]                      
  1515  3556           PULS  A B X U                     
  1517  39             RTS                               

; ---- function FUN_M69_big_0c000__1518
FUN_M69_big_0c000__1518:
  1518  3476           PSHS  U Y X B A                   
  151a  CCFF9C         LDD #0xff9c                       
  151d  3606           PSHU  B A                         
  151f  CC0064         LDD #0x64                         
  1522  3606           PSHU  B A                         
  1524  FC7040         LDD 0x7040                        
  1527  F37042         ADDD 0x7042                       
  152a  3606           PSHU  B A                         
  152c  AD9FFCD8       JSR [0xfcd8]                      
  1530  3706           PULU  A B                         
  1532  FD7044         STD 0x7044                        
  1535  FC7044         LDD 0x7044                        
  1538  3606           PSHU  B A                         
  153a  CC0147         LDD #0x147                        
  153d  3606           PSHU  B A                         
  153f  AD9FFCEC       JSR [0xfcec]                      
  1543  3706           PULU  A B                         
  1545  FD70FA         STD 0x70fa                        
  1548  FC7044         LDD 0x7044                        
  154b  3606           PSHU  B A                         
  154d  CC55C1         LDD #0x55c1                       
  1550  3606           PSHU  B A                         
  1552  AD9FFCF2       JSR [0xfcf2]                      
  1556  3706           PULU  A B                         
  1558  F370FA         ADDD 0x70fa                       
  155b  FD711A         STD 0x711a                        
  155e  171B74         LBSR 0x30d5                       
  1561  3576           PULS  A B X Y U                   
  1563  39             RTS                               
PTR_FUN_M69_big_0c000__1637_M69_big_0c000__1564:
  1564  1637           addr M69_big_0c000::1637          
  1566  1692           addr M69_big_0c000::1692          
  1568  7048           addr 7048                         
  156a  .db 00 81 F8 00 08 00 00 04                          ; ........

; ---- function FUN_M69_big_0c000__1572
FUN_M69_big_0c000__1572:
  1572  3410           PSHS  X                           
  1574  8E1564         LDX #0x1564                        ; desc[API_FE1C]: ->$1637 ->$1692 $7048
  1577  AD9FFE1C       JSR [0xfe1c]                      
  157b  3510           PULS  X                           
  157d  39             RTS                               

; ---- function FUN_M69_big_0c000__157e
FUN_M69_big_0c000__157e:
  157e  3410           PSHS  X                           
  1580  8E1564         LDX #0x1564                        ; desc[API_FE1A]: ->$1637 ->$1692 $7048
  1583  AD9FFE1A       JSR [0xfe1a]                      
  1587  3510           PULS  X                           
  1589  39             RTS                               

; ---- function FUN_M69_big_0c000__158a
FUN_M69_big_0c000__158a:
  158a  3426           PSHS  Y B A                       
  158c  AD9FFC8E       JSR [0xfc8e]                      
  1590  FC60F9         LDD 0x60f9                        
  1593  FD6074         STD 0x6074                        
  1596  B3704A         SUBD 0x704a                       
  1599  FD7048         STD 0x7048                        
  159c  1700F3         LBSR 0x1692                       
  159f  CC71A5         LDD #0x71a5                       
  15a2  837126         SUBD #0x7126                      
  15a5  1F02           TFR D,Y                           
  15a7  FC7048         LDD 0x7048                        
  15aa  AD9FFC82       JSR [0xfc82]                      
  15ae  3526           PULS  A B Y                       
  15b0  39             RTS                               

; ---- function FUN_M69_big_0c000__15b1
FUN_M69_big_0c000__15b1:
  15b1  3406           PSHS  B A                         
  15b3  FC704C         LDD 0x704c                        
  15b6  FD6074         STD 0x6074                        
  15b9  17F1B0         LBSR 0x076c                       
  15bc  C604           LDB #0x4                          
  15be  AD9FFC36       JSR [0xfc36]                      
  15c2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " image width:-                     -"
  15c6  0A696D616765.. char[37] "\nimage width:-                     -"
LAB_M69_big_0c000__15eb:
  15eb  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0064 $FF9C $0000 ->$1637 ->$160D $0001 $0001 $0000
  15ef  01             db 1h                             
  15f0  01             db 1h                             
  15f1  02             db 2h                             
  15f2  01             db 1h                             
  15f3  01             db 1h                             
  15f4  00             db 0h                             
  15f5  04             db 4h                             
  15f6  80             db 80h                            
  15f7  0064           dw 64h                            
  15f9  FF9C           dw FF9Ch                          
  15fb  0000           dw 0h                             
  15fd  1637           addr M69_big_0c000::1637          
  15ff  160D           addr M69_big_0c000::160d          
  1601  0001           dw 1h                             
  1603  0001           dw 1h                             
  1605  0000           dw 0h                             
LAB_M69_big_0c000__1607:
  1607  17002D         LBSR 0x1637                       
  160a  3506           PULS  A B                         
  160c  39             RTS                               

; ---- function FUN_M69_big_0c000__160d
FUN_M69_big_0c000__160d:
  160d  3426           PSHS  Y B A                       
  160f  FC6074         LDD 0x6074                        
  1612  B3704A         SUBD 0x704a                       
  1615  FD7048         STD 0x7048                        
  1618  CC71A5         LDD #0x71a5                       
  161b  837126         SUBD #0x7126                      
  161e  1F02           TFR D,Y                           
  1620  FC7048         LDD 0x7048                        
  1623  AD9FFC82       JSR [0xfc82]                      
  1627  108E000A       LDY #0xa                          
  162b  FC7048         LDD 0x7048                        
  162e  AD9FFE40       JSR [0xfe40]                      
  1632  8D5E           BSR 0x1692                        
  1634  3526           PULS  A B Y                       
  1636  39             RTS                               

; ---- function FUN_M69_big_0c000__1637
FUN_M69_big_0c000__1637:
  1637  3456           PSHS  U X B A                     
  1639  C612           LDB #0x12                         
  163b  AD9FFC36       JSR [0xfc36]                      
  163f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "                     "
  1643  202020202020.. char[22] "                     "  
LAB_M69_big_0c000__1659:
  1659  FC704C         LDD 0x704c                        
  165c  C30064         ADDD #0x64                        
  165f  3606           PSHU  B A                         
  1661  CC000A         LDD #0xa                          
  1664  3606           PSHU  B A                         
  1666  AD9FFCEA       JSR [0xfcea]                      
  166a  3706           PULU  A B                         
  166c  FD70FA         STD 0x70fa                        
  166f  C30012         ADDD #0x12                        
  1672  AD9FFC36       JSR [0xfc36]                      
  1676  C652           LDB #0x52                         
  1678  AD9FFC2A       JSR [0xfc2a]                      
  167c  CC0014         LDD #0x14                         
  167f  B370FA         SUBD 0x70fa                       
  1682  C30012         ADDD #0x12                        
  1685  AD9FFC36       JSR [0xfc36]                      
  1689  C64C           LDB #0x4c                         
  168b  AD9FFC2A       JSR [0xfc2a]                      
  168f  3556           PULS  A B X U                     
  1691  39             RTS                               

; ---- function FUN_M69_big_0c000__1692
FUN_M69_big_0c000__1692:
  1692  3476           PSHS  U Y X B A                   
  1694  CCFF9C         LDD #0xff9c                       
  1697  3606           PSHU  B A                         
  1699  CC0064         LDD #0x64                         
  169c  3606           PSHU  B A                         
  169e  FC7048         LDD 0x7048                        
  16a1  F3704A         ADDD 0x704a                       
  16a4  3606           PSHU  B A                         
  16a6  AD9FFCD8       JSR [0xfcd8]                      
  16aa  3706           PULU  A B                         
  16ac  FD704C         STD 0x704c                        
  16af  FC704C         LDD 0x704c                        
  16b2  3606           PSHU  B A                         
  16b4  CC0147         LDD #0x147                        
  16b7  3606           PSHU  B A                         
  16b9  AD9FFCEC       JSR [0xfcec]                      
  16bd  3706           PULU  A B                         
  16bf  FD711C         STD 0x711c                        
  16c2  17198B         LBSR 0x3050                       
  16c5  3576           PULS  A B X Y U                   
  16c7  39             RTS                               

; ---- function FUN_M69_big_0c000__16c8
FUN_M69_big_0c000__16c8:
  16c8  3426           PSHS  Y B A                       
  16ca  AD9FFC8E       JSR [0xfc8e]                      
  16ce  FC60F9         LDD 0x60f9                        
  16d1  FD705A         STD 0x705a                        
  16d4  FD6074         STD 0x6074                        
  16d7  1700BA         LBSR 0x1794                       
  16da  CC7168         LDD #0x7168                       
  16dd  837126         SUBD #0x7126                      
  16e0  1F02           TFR D,Y                           
  16e2  FC705A         LDD 0x705a                        
  16e5  AD9FFC80       JSR [0xfc80]                      
  16e9  3526           PULS  A B Y                       
  16eb  39             RTS                               

; ---- function FUN_M69_big_0c000__16ec
FUN_M69_big_0c000__16ec:
  16ec  3406           PSHS  B A                         
  16ee  FC705A         LDD 0x705a                        
  16f1  FD6074         STD 0x6074                        
  16f4  17F075         LBSR 0x076c                       
  16f7  C613           LDB #0x13                         
  16f9  AD9FFC36       JSR [0xfc36]                      
  16fd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " input mode:         "
  1701  0A696E707574.. char[22] "\ninput mode:         " 
LAB_M69_big_0c000__1717:
  1717  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0000 $FFFF $0000 ->$1760 ->$1739 $0001 $0001 $0000
  171b  01             db 1h                             
  171c  01             db 1h                             
  171d  02             db 2h                             
  171e  01             db 1h                             
  171f  01             db 1h                             
  1720  00             db 0h                             
  1721  02             db 2h                             
  1722  80             db 80h                            
  1723  0000           dw 0h                             
  1725  FFFF           dw FFFFh                          
  1727  0000           dw 0h                             
  1729  1760           addr M69_big_0c000::1760          
  172b  1739           addr M69_big_0c000::1739          
  172d  0001           dw 1h                             
  172f  0001           dw 1h                             
  1731  0000           dw 0h                             
LAB_M69_big_0c000__1733:
  1733  17002A         LBSR 0x1760                       
  1736  3506           PULS  A B                         
  1738  39             RTS                               

; ---- function FUN_M69_big_0c000__1739
FUN_M69_big_0c000__1739:
  1739  3426           PSHS  Y B A                       
  173b  FC6074         LDD 0x6074                        
  173e  FD705A         STD 0x705a                        
  1741  CC7168         LDD #0x7168                       
  1744  837126         SUBD #0x7126                      
  1747  1F02           TFR D,Y                           
  1749  FC705A         LDD 0x705a                        
  174c  AD9FFC80       JSR [0xfc80]                      
  1750  108E0006       LDY #0x6                          
  1754  FC705A         LDD 0x705a                        
  1757  AD9FFE40       JSR [0xfe40]                      
  175b  8D37           BSR 0x1794                        
  175d  3526           PULS  A B Y                       
  175f  39             RTS                               

; ---- function FUN_M69_big_0c000__1760
FUN_M69_big_0c000__1760:
  1760  3456           PSHS  U X B A                     
  1762  FC705A         LDD 0x705a                        
  1765  10830000       CMPD #0x0                         
  1769  10270013       LBEQ 0x1780                       
  176d  C620           LDB #0x20                         
  176f  AD9FFC36       JSR [0xfc36]                      
  1773  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "mono  "
  1777  6D6F6E6F2020.. char[7] "mono  "                  
LAB_M69_big_0c000__177e:
  177e  2011           BRA 0x1791                        
LAB_M69_big_0c000__1780:
  1780  C620           LDB #0x20                         
  1782  AD9FFC36       JSR [0xfc36]                      
  1786  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "stereo"
  178a  73746572656F.. char[7] "stereo"                  
LAB_M69_big_0c000__1791:
  1791  3556           PULS  A B X U                     
  1793  39             RTS                               

; ---- function FUN_M69_big_0c000__1794
FUN_M69_big_0c000__1794:
  1794  3476           PSHS  U Y X B A                   
  1796  FC705A         LDD 0x705a                        
  1799  10830000       CMPD #0x0                         
  179d  10270014       LBEQ 0x17b5                       
  17a1  CC000A         LDD #0xa                          
  17a4  AD9FFD20       JSR [0xfd20]                      
  17a8  108E0349       LDY #0x349                        
  17ac  CCFFFF         LDD #0xffff                       
  17af  AD9FFD2E       JSR [0xfd2e]                      
  17b3  2012           BRA 0x17c7                        
LAB_M69_big_0c000__17b5:
  17b5  CC000A         LDD #0xa                          
  17b8  AD9FFD20       JSR [0xfd20]                      
  17bc  108E0349       LDY #0x349                        
  17c0  CC0000         LDD #0x0                          
  17c3  AD9FFD2E       JSR [0xfd2e]                      
LAB_M69_big_0c000__17c7:
  17c7  3576           PULS  A B X Y U                   
  17c9  39             RTS                               

; ---- function FUN_M69_big_0c000__17ca
FUN_M69_big_0c000__17ca:
  17ca  3426           PSHS  Y B A                       
  17cc  AD9FFC8E       JSR [0xfc8e]                      
  17d0  FC60F9         LDD 0x60f9                        
  17d3  FD7050         STD 0x7050                        
  17d6  FD6074         STD 0x6074                        
  17d9  1700DE         LBSR 0x18ba                       
  17dc  3526           PULS  A B Y                       
  17de  39             RTS                               

; ---- function FUN_M69_big_0c000__17df
FUN_M69_big_0c000__17df:
  17df  3406           PSHS  B A                         
  17e1  FC7050         LDD 0x7050                        
  17e4  88FF           EORA #0xff                        
  17e6  C8FF           EORB #0xff                        
  17e8  FD7050         STD 0x7050                        
  17eb  170020         LBSR 0x180e                       
  17ee  3506           PULS  A B                         
  17f0  39             RTS                               

; ---- function FUN_M69_big_0c000__17f1
FUN_M69_big_0c000__17f1:
  17f1  3406           PSHS  B A                         
  17f3  1700C4         LBSR 0x18ba                       
  17f6  170031         LBSR 0x182a                       
  17f9  CC0DC9         LDD #0xdc9                        
  17fc  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6070
  1800  6070           addr 6070                         
LAB_M69_big_0c000__1802:
  1802  CC0DC9         LDD #0xdc9                        
  1805  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6072
  1809  6072           addr 6072                         
LAB_M69_big_0c000__180b:
  180b  3506           PULS  A B                         
  180d  39             RTS                               

; ---- function FUN_M69_big_0c000__180e
FUN_M69_big_0c000__180e:
  180e  3426           PSHS  Y B A                       
  1810  108E0007       LDY #0x7                          
  1814  FC7050         LDD 0x7050                        
  1817  AD9FFE40       JSR [0xfe40]                      
  181b  17009C         LBSR 0x18ba                       
  181e  8D0A           BSR 0x182a                        
  1820  17005F         LBSR 0x1882                       
  1823  AD9FFDEA       JSR [0xfdea]                      
  1827  3526           PULS  A B Y                       
  1829  39             RTS                               

; ---- function FUN_M69_big_0c000__182a
FUN_M69_big_0c000__182a:
  182a  3456           PSHS  U X B A                     
  182c  FC7050         LDD 0x7050                        
  182f  10830000       CMPD #0x0                         
  1833  10270025       LBEQ 0x185c                       
  1837  17EF32         LBSR 0x076c                       
  183a  C613           LDB #0x13                         
  183c  AD9FFC36       JSR [0xfc36]                      
  1840  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " --normal operation--"
  1844  0A2D2D6E6F72.. char[22] "\n--normal operation--" 
LAB_M69_big_0c000__185a:
  185a  2023           BRA 0x187f                        
LAB_M69_big_0c000__185c:
  185c  17EF0D         LBSR 0x076c                       
  185f  C613           LDB #0x13                         
  1861  AD9FFC36       JSR [0xfc36]                      
  1865  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " ---repeat looping---"
  1869  0A2D2D2D7265.. char[22] "\n---repeat looping---" 
LAB_M69_big_0c000__187f:
  187f  3556           PULS  A B X U                     
  1881  39             RTS                               

; ---- function FUN_M69_big_0c000__1882
FUN_M69_big_0c000__1882:
  1882  3456           PSHS  U X B A                     
  1884  FC7050         LDD 0x7050                        
  1887  10830000       CMPD #0x0                         
  188b  10270015       LBEQ 0x18a4                       
  188f  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "rept=off" [-] [-]
  1893  00             db 0h                             
  1894  726570743D6F.. ds "rept=off"                     
  189c  00             db 0h                             
  189d  00             db 0h                             
LAB_M69_big_0c000__189e:
  189e  AD9FFDF2       JSR [0xfdf2]                      
  18a2  2013           BRA 0x18b7                        
LAB_M69_big_0c000__18a4:
  18a4  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: [-] "rept=on " [-] [-]
  18a8  00             db 0h                             
  18a9  726570743D6F.. ds "rept=on "                     
  18b1  00             db 0h                             
  18b2  00             db 0h                             
LAB_M69_big_0c000__18b3:
  18b3  AD9FFDF2       JSR [0xfdf2]                      
LAB_M69_big_0c000__18b7:
  18b7  3556           PULS  A B X U                     
  18b9  39             RTS                               

; ---- function FUN_M69_big_0c000__18ba
FUN_M69_big_0c000__18ba:
  18ba  3476           PSHS  U Y X B A                   
  18bc  FC7122         LDD 0x7122                        
  18bf  10830000       CMPD #0x0                         
  18c3  10270035       LBEQ 0x18fc                       
  18c7  FC7050         LDD 0x7050                        
  18ca  10830000       CMPD #0x0                         
  18ce  10270015       LBEQ 0x18e7                       
  18d2  CC000A         LDD #0xa                          
  18d5  AD9FFD20       JSR [0xfd20]                      
  18d9  108E034A       LDY #0x34a                        
  18dd  CCFFFF         LDD #0xffff                       
  18e0  AD9FFD2E       JSR [0xfd2e]                      
  18e4  16009E         LBRA 0x1985                       
LAB_M69_big_0c000__18e7:
  18e7  CC000A         LDD #0xa                          
  18ea  AD9FFD20       JSR [0xfd20]                      
  18ee  108E034A       LDY #0x34a                        
  18f2  CC0000         LDD #0x0                          
  18f5  AD9FFD2E       JSR [0xfd2e]                      
  18f9  160089         LBRA 0x1985                       
LAB_M69_big_0c000__18fc:
  18fc  FC7050         LDD 0x7050                        
  18ff  10830000       CMPD #0x0                         
  1903  10270006       LBEQ 0x190d                       
  1907  17F599         LBSR 0x0ea3                       
  190a  160078         LBRA 0x1985                       
LAB_M69_big_0c000__190d:
  190d  CC7FFF         LDD #0x7fff                       
  1910  FD70FA         STD 0x70fa                        
  1913  CC7124         LDD #0x7124                       
  1916  FD70FC         STD 0x70fc                        
  1919  CC0064         LDD #0x64                         
  191c  FD70FE         STD 0x70fe                        
  191f  CC00C8         LDD #0xc8                         
  1922  FD7100         STD 0x7100                        
LAB_M69_big_0c000__1925:
  1925  FC70FA         LDD 0x70fa                        
  1928  B370FE         SUBD 0x70fe                       
  192b  FD70FA         STD 0x70fa                        
  192e  10830000       CMPD #0x0                         
  1932  2E06           BGT 0x193a                        
  1934  CC0000         LDD #0x0                          
  1937  FD70FA         STD 0x70fa                        
LAB_M69_big_0c000__193a:
  193a  CC000A         LDD #0xa                          
  193d  AD9FFD20       JSR [0xfd20]                      
  1941  108E0241       LDY #0x241                        
  1945  FC70FA         LDD 0x70fa                        
  1948  AD9FFD2E       JSR [0xfd2e]                      
  194c  FC70FC         LDD 0x70fc                        
  194f  F37100         ADDD 0x7100                       
  1952  FD70FC         STD 0x70fc                        
  1955  108378AF       CMPD #0x78af                      
  1959  2D06           BLT 0x1961                        
  195b  CC78AF         LDD #0x78af                       
  195e  FD70FC         STD 0x70fc                        
LAB_M69_big_0c000__1961:
  1961  CC000A         LDD #0xa                          
  1964  AD9FFD20       JSR [0xfd20]                      
  1968  108E0240       LDY #0x240                        
  196c  FC70FC         LDD 0x70fc                        
  196f  AD9FFD2E       JSR [0xfd2e]                      
  1973  FC70FA         LDD 0x70fa                        
  1976  10830000       CMPD #0x0                         
  197a  2EA9           BGT 0x1925                        
  197c  FC70FC         LDD 0x70fc                        
  197f  108378AF       CMPD #0x78af                      
  1983  2DA0           BLT 0x1925                        
LAB_M69_big_0c000__1985:
  1985  3576           PULS  A B X Y U                   
  1987  39             RTS                               

; ---- function FUN_M69_big_0c000__1988
FUN_M69_big_0c000__1988:
  1988  3406           PSHS  B A                         
  198a  CC0000         LDD #0x0                          
  198d  2021           BRA 0x19b0                        

; ---- function FUN_M69_big_0c000__198f
FUN_M69_big_0c000__198f:
  198f  3406           PSHS  B A                         
  1991  CC0001         LDD #0x1                          
  1994  201A           BRA 0x19b0                        

; ---- function FUN_M69_big_0c000__1996
FUN_M69_big_0c000__1996:
  1996  3406           PSHS  B A                         
  1998  CC0002         LDD #0x2                          
  199b  2013           BRA 0x19b0                        

; ---- function FUN_M69_big_0c000__199d
FUN_M69_big_0c000__199d:
  199d  3406           PSHS  B A                         
  199f  CC0003         LDD #0x3                          
  19a2  200C           BRA 0x19b0                        

; ---- function FUN_M69_big_0c000__19a4
FUN_M69_big_0c000__19a4:
  19a4  3406           PSHS  B A                         
  19a6  CC0004         LDD #0x4                          
  19a9  2005           BRA 0x19b0                        

; ---- function FUN_M69_big_0c000__19ab
FUN_M69_big_0c000__19ab:
  19ab  3406           PSHS  B A                         
  19ad  CC0005         LDD #0x5                          
LAB_M69_big_0c000__19b0:
  19b0  1714C6         LBSR 0x2e79                       
  19b3  FC60F9         LDD 0x60f9                        
  19b6  ED9F70CC       STD [0x70cc]                      
  19ba  FD6074         STD 0x6074                        
  19bd  10BE70D8       LDY 0x70d8                        
  19c1  AD9FFC80       JSR [0xfc80]                      
  19c5  FC70F8         LDD 0x70f8                        
  19c8  860E           LDA #0xe                          
  19ca  3D             MUL                               
  19cb  C319DE         ADDD #0x19de                      
  19ce  F3600D         ADDD 0x600d                       
  19d1  1F01           TFR D,X                           
  19d3  AD84           JSR ,X                            
  19d5  1700E2         LBSR 0x1aba                       
  19d8  1700F4         LBSR 0x1acf                       
  19db  3506           PULS  A B                         
  19dd  39             RTS                               

; ---- function FUN_M69_big_0c000__19de
FUN_M69_big_0c000__19de:
  19de  3436           PSHS  Y X B A                     
  19e0  CC0000         LDD #0x0                          
  19e3  8E044C         LDX #0x44c                        
  19e6  108E0440       LDY #0x440                        
  19ea  2044           BRA 0x1a30                        

; ---- function FUN_M69_big_0c000__19ec
FUN_M69_big_0c000__19ec:
  19ec  3436           PSHS  Y X B A                     
  19ee  CC0001         LDD #0x1                          
  19f1  8E044D         LDX #0x44d                        
  19f4  108E0441       LDY #0x441                        
  19f8  2036           BRA 0x1a30                        

; ---- function FUN_M69_big_0c000__19fa
FUN_M69_big_0c000__19fa:
  19fa  3436           PSHS  Y X B A                     
  19fc  CC0002         LDD #0x2                          
  19ff  8E044E         LDX #0x44e                        
  1a02  108E0442       LDY #0x442                        
  1a06  2028           BRA 0x1a30                        

; ---- function FUN_M69_big_0c000__1a08
FUN_M69_big_0c000__1a08:
  1a08  3436           PSHS  Y X B A                     
  1a0a  CC0003         LDD #0x3                          
  1a0d  8E044F         LDX #0x44f                        
  1a10  108E0443       LDY #0x443                        
  1a14  201A           BRA 0x1a30                        

; ---- function FUN_M69_big_0c000__1a16
FUN_M69_big_0c000__1a16:
  1a16  3436           PSHS  Y X B A                     
  1a18  CC0004         LDD #0x4                          
  1a1b  8E0450         LDX #0x450                        
  1a1e  108E0444       LDY #0x444                        
  1a22  200C           BRA 0x1a30                        

; ---- function FUN_M69_big_0c000__1a24
FUN_M69_big_0c000__1a24:
  1a24  3436           PSHS  Y X B A                     
  1a26  CC0005         LDD #0x5                          
  1a29  8E0451         LDX #0x451                        
  1a2c  108E0445       LDY #0x445                        
LAB_M69_big_0c000__1a30:
  1a30  171446         LBSR 0x2e79                       
  1a33  EC9F70CC       LDD [0x70cc]                      
  1a37  FD6074         STD 0x6074                        
  1a3a  17ED2F         LBSR 0x076c                       
  1a3d  C613           LDB #0x13                         
  1a3f  AD9FFC36       JSR [0xfc36]                      
  1a43  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " delay  :     mS     "
  1a47  0A64656C6179.. char[22] "\ndelay  :     mS     " 
LAB_M69_big_0c000__1a5d:
  1a5d  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $00C8 $0000 $0000 ->$1ABA ->$1A8E $0001 $0001 $0000
  1a61  01             db 1h                             
  1a62  01             db 1h                             
  1a63  02             db 2h                             
  1a64  01             db 1h                             
  1a65  01             db 1h                             
  1a66  00             db 0h                             
  1a67  03             db 3h                             
  1a68  80             db 80h                            
  1a69  00C8           dw C8h                            
  1a6b  0000           dw 0h                             
  1a6d  0000           dw 0h                             
  1a6f  1ABA           addr M69_big_0c000::1aba          
  1a71  1A8E           addr M69_big_0c000::1a8e          
  1a73  0001           dw 1h                             
  1a75  0001           dw 1h                             
  1a77  0000           dw 0h                             
LAB_M69_big_0c000__1a79:
  1a79  17003E         LBSR 0x1aba                       
  1a7c  C61A           LDB #0x1a                         
  1a7e  AD9FFC36       JSR [0xfc36]                      
  1a82  FC70F8         LDD 0x70f8                        
  1a85  CB31           ADDB #0x31                        
  1a87  AD9FFC2A       JSR [0xfc2a]                      
  1a8b  3536           PULS  A B X Y                     
  1a8d  39             RTS                               

; ---- function FUN_M69_big_0c000__1a8e
FUN_M69_big_0c000__1a8e:
  1a8e  3426           PSHS  Y B A                       
  1a90  FC6074         LDD 0x6074                        
  1a93  ED9F70CC       STD [0x70cc]                      
  1a97  10BE70D8       LDY 0x70d8                        
  1a9b  AD9FFC80       JSR [0xfc80]                      
  1a9f  FC70F8         LDD 0x70f8                        
  1aa2  C3000B         ADDD #0xb                         
  1aa5  1F02           TFR D,Y                           
  1aa7  EC9F70CC       LDD [0x70cc]                      
  1aab  AD9FFE40       JSR [0xfe40]                      
  1aaf  CC00E1         LDD #0xe1                         
  1ab2  FD711E         STD 0x711e                        
  1ab5  8D18           BSR 0x1acf                        
  1ab7  3526           PULS  A B Y                       
  1ab9  39             RTS                               

; ---- function FUN_M69_big_0c000__1aba
FUN_M69_big_0c000__1aba:
  1aba  3456           PSHS  U X B A                     
  1abc  C61D           LDB #0x1d                         
  1abe  AD9FFC36       JSR [0xfc36]                      
  1ac2  CC0003         LDD #0x3                          
  1ac5  8E60A0         LDX #0x60a0                       
  1ac8  AD9FFC3A       JSR [0xfc3a]                      
  1acc  3556           PULS  A B X U                     
  1ace  39             RTS                               

; ---- function FUN_M69_big_0c000__1acf
FUN_M69_big_0c000__1acf:
  1acf  3466           PSHS  U Y B A                     
  1ad1  EC9F70CC       LDD [0x70cc]                      
  1ad5  3606           PSHU  B A                         
  1ad7  CC002C         LDD #0x2c                         
  1ada  3606           PSHU  B A                         
  1adc  AD9FFCEE       JSR [0xfcee]                      
  1ae0  FC7118         LDD 0x7118                        
  1ae3  3606           PSHU  B A                         
  1ae5  AD9FFCF2       JSR [0xfcf2]                      
  1ae9  3706           PULU  A B                         
  1aeb  E39F70E4       ADDD [0x70e4]                     
  1aef  FD70FA         STD 0x70fa                        
  1af2  FC7058         LDD 0x7058                        
  1af5  1083FFFF       CMPD #0xffff                      
  1af9  10270063       LBEQ 0x1b60                       
  1afd  CC000A         LDD #0xa                          
  1b00  AD9FFD20       JSR [0xfd20]                      
  1b04  10BE70E8       LDY 0x70e8                        
  1b08  FC70FA         LDD 0x70fa                        
  1b0b  AD9FFD2E       JSR [0xfd2e]                      
  1b0f  CC000A         LDD #0xa                          
  1b12  AD9FFD20       JSR [0xfd20]                      
  1b16  10BE70F4       LDY 0x70f4                        
  1b1a  FC7110         LDD 0x7110                        
  1b1d  AD9FFD2E       JSR [0xfd2e]                      
  1b21  CC000A         LDD #0xa                          
  1b24  AD9FFD20       JSR [0xfd20]                      
  1b28  10BE70F6       LDY 0x70f6                        
  1b2c  CC0000         LDD #0x0                          
  1b2f  AD9FFD2E       JSR [0xfd2e]                      
  1b33  FC70E8         LDD 0x70e8                        
  1b36  C30012         ADDD #0x12                        
  1b39  FD70E8         STD 0x70e8                        
  1b3c  CC000A         LDD #0xa                          
  1b3f  AD9FFD20       JSR [0xfd20]                      
  1b43  10BE70E8       LDY 0x70e8                        
  1b47  FC70FA         LDD 0x70fa                        
  1b4a  AD9FFD2E       JSR [0xfd2e]                      
  1b4e  FC70E8         LDD 0x70e8                        
  1b51  830012         SUBD #0x12                        
  1b54  FD70E8         STD 0x70e8                        
  1b57  FC7112         LDD 0x7112                        
  1b5a  AD9FFCC4       JSR [0xfcc4]                      
  1b5e  2051           BRA 0x1bb1                        
LAB_M69_big_0c000__1b60:
  1b60  CC000A         LDD #0xa                          
  1b63  AD9FFD20       JSR [0xfd20]                      
  1b67  10BE70E8       LDY 0x70e8                        
  1b6b  FC70FA         LDD 0x70fa                        
  1b6e  AD9FFD2E       JSR [0xfd2e]                      
  1b72  FC70E8         LDD 0x70e8                        
  1b75  C3000C         ADDD #0xc                         
  1b78  FD70E8         STD 0x70e8                        
  1b7b  CC000A         LDD #0xa                          
  1b7e  AD9FFD20       JSR [0xfd20]                      
  1b82  10BE70E8       LDY 0x70e8                        
  1b86  FC70FA         LDD 0x70fa                        
  1b89  AD9FFD2E       JSR [0xfd2e]                      
  1b8d  FC70E8         LDD 0x70e8                        
  1b90  C30006         ADDD #0x6                         
  1b93  FD70E8         STD 0x70e8                        
  1b96  CC000A         LDD #0xa                          
  1b99  AD9FFD20       JSR [0xfd20]                      
  1b9d  10BE70E8       LDY 0x70e8                        
  1ba1  FC70FA         LDD 0x70fa                        
  1ba4  AD9FFD2E       JSR [0xfd2e]                      
  1ba8  FC70E8         LDD 0x70e8                        
  1bab  830012         SUBD #0x12                        
  1bae  FD70E8         STD 0x70e8                        
LAB_M69_big_0c000__1bb1:
  1bb1  3566           PULS  A B Y U                     
  1bb3  39             RTS                               

; ---- function FUN_M69_big_0c000__1bb4
FUN_M69_big_0c000__1bb4:
  1bb4  3406           PSHS  B A                         
  1bb6  CC0000         LDD #0x0                          
  1bb9  2021           BRA 0x1bdc                        

; ---- function FUN_M69_big_0c000__1bbb
FUN_M69_big_0c000__1bbb:
  1bbb  3406           PSHS  B A                         
  1bbd  CC0001         LDD #0x1                          
  1bc0  201A           BRA 0x1bdc                        

; ---- function FUN_M69_big_0c000__1bc2
FUN_M69_big_0c000__1bc2:
  1bc2  3406           PSHS  B A                         
  1bc4  CC0002         LDD #0x2                          
  1bc7  2013           BRA 0x1bdc                        

; ---- function FUN_M69_big_0c000__1bc9
FUN_M69_big_0c000__1bc9:
  1bc9  3406           PSHS  B A                         
  1bcb  CC0003         LDD #0x3                          
  1bce  200C           BRA 0x1bdc                        

; ---- function FUN_M69_big_0c000__1bd0
FUN_M69_big_0c000__1bd0:
  1bd0  3406           PSHS  B A                         
  1bd2  CC0004         LDD #0x4                          
  1bd5  2005           BRA 0x1bdc                        

; ---- function FUN_M69_big_0c000__1bd7
FUN_M69_big_0c000__1bd7:
  1bd7  3406           PSHS  B A                         
  1bd9  CC0005         LDD #0x5                          
LAB_M69_big_0c000__1bdc:
  1bdc  17135A         LBSR 0x2f39                       
  1bdf  FC60F9         LDD 0x60f9                        
  1be2  ED9F70CE       STD [0x70ce]                      
  1be6  FD6074         STD 0x6074                        
  1be9  10BE70DA       LDY 0x70da                        
  1bed  AD9FFC80       JSR [0xfc80]                      
  1bf1  FC70F8         LDD 0x70f8                        
  1bf4  860A           LDA #0xa                          
  1bf6  3D             MUL                               
  1bf7  C31C0A         ADDD #0x1c0a                      
  1bfa  F3600D         ADDD 0x600d                       
  1bfd  1F01           TFR D,X                           
  1bff  AD84           JSR ,X                            
  1c01  1700C4         LBSR 0x1cc8                       
  1c04  1700D6         LBSR 0x1cdd                       
  1c07  3506           PULS  A B                         
  1c09  39             RTS                               

; ---- function FUN_M69_big_0c000__1c0a
FUN_M69_big_0c000__1c0a:
  1c0a  3416           PSHS  X B A                       
  1c0c  CC0000         LDD #0x0                          
  1c0f  8E0440         LDX #0x440                        
  1c12  2030           BRA 0x1c44                        

; ---- function FUN_M69_big_0c000__1c14
FUN_M69_big_0c000__1c14:
  1c14  3416           PSHS  X B A                       
  1c16  CC0001         LDD #0x1                          
  1c19  8E0441         LDX #0x441                        
  1c1c  2026           BRA 0x1c44                        

; ---- function FUN_M69_big_0c000__1c1e
FUN_M69_big_0c000__1c1e:
  1c1e  3416           PSHS  X B A                       
  1c20  CC0002         LDD #0x2                          
  1c23  8E0442         LDX #0x442                        
  1c26  201C           BRA 0x1c44                        

; ---- function FUN_M69_big_0c000__1c28
FUN_M69_big_0c000__1c28:
  1c28  3416           PSHS  X B A                       
  1c2a  CC0003         LDD #0x3                          
  1c2d  8E0443         LDX #0x443                        
  1c30  2012           BRA 0x1c44                        

; ---- function FUN_M69_big_0c000__1c32
FUN_M69_big_0c000__1c32:
  1c32  3416           PSHS  X B A                       
  1c34  CC0004         LDD #0x4                          
  1c37  8E0444         LDX #0x444                        
  1c3a  2008           BRA 0x1c44                        

; ---- function FUN_M69_big_0c000__1c3c
FUN_M69_big_0c000__1c3c:
  1c3c  3416           PSHS  X B A                       
  1c3e  CC0005         LDD #0x5                          
  1c41  8E0445         LDX #0x445                        
LAB_M69_big_0c000__1c44:
  1c44  1712F2         LBSR 0x2f39                       
  1c47  EC9F70CE       LDD [0x70ce]                      
  1c4b  FD6074         STD 0x6074                        
  1c4e  17EB1B         LBSR 0x076c                       
  1c51  C613           LDB #0x13                         
  1c53  AD9FFC36       JSR [0xfc36]                      
  1c57  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " rate  :             "
  1c5b  0A7261746520.. char[22] "\nrate  :             " 
LAB_M69_big_0c000__1c71:
  1c71  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1CC8 ->$1CA2 $0001 $0001 $0000
  1c75  01             db 1h                             
  1c76  01             db 1h                             
  1c77  02             db 2h                             
  1c78  01             db 1h                             
  1c79  01             db 1h                             
  1c7a  00             db 0h                             
  1c7b  03             db 3h                             
  1c7c  80             db 80h                            
  1c7d  0064           dw 64h                            
  1c7f  0000           dw 0h                             
  1c81  0000           dw 0h                             
  1c83  1CC8           addr M69_big_0c000::1cc8          
  1c85  1CA2           addr M69_big_0c000::1ca2          
  1c87  0001           dw 1h                             
  1c89  0001           dw 1h                             
  1c8b  0000           dw 0h                             
LAB_M69_big_0c000__1c8d:
  1c8d  170038         LBSR 0x1cc8                       
  1c90  C619           LDB #0x19                         
  1c92  AD9FFC36       JSR [0xfc36]                      
  1c96  FC70F8         LDD 0x70f8                        
  1c99  CB31           ADDB #0x31                        
  1c9b  AD9FFC2A       JSR [0xfc2a]                      
  1c9f  3516           PULS  A B X                       
  1ca1  39             RTS                               

; ---- function FUN_M69_big_0c000__1ca2
FUN_M69_big_0c000__1ca2:
  1ca2  3426           PSHS  Y B A                       
  1ca4  FC6074         LDD 0x6074                        
  1ca7  ED9F70CE       STD [0x70ce]                      
  1cab  10BE70DA       LDY 0x70da                        
  1caf  AD9FFC80       JSR [0xfc80]                      
  1cb3  FC70F8         LDD 0x70f8                        
  1cb6  C30017         ADDD #0x17                        
  1cb9  1F02           TFR D,Y                           
  1cbb  EC9F70CE       LDD [0x70ce]                      
  1cbf  AD9FFE40       JSR [0xfe40]                      
  1cc3  8D18           BSR 0x1cdd                        
  1cc5  3526           PULS  A B Y                       
  1cc7  39             RTS                               

; ---- function FUN_M69_big_0c000__1cc8
FUN_M69_big_0c000__1cc8:
  1cc8  3456           PSHS  U X B A                     
  1cca  C61C           LDB #0x1c                         
  1ccc  AD9FFC36       JSR [0xfc36]                      
  1cd0  CC0003         LDD #0x3                          
  1cd3  8E60A0         LDX #0x60a0                       
  1cd6  AD9FFC3A       JSR [0xfc3a]                      
  1cda  3556           PULS  A B X U                     
  1cdc  39             RTS                               

; ---- function FUN_M69_big_0c000__1cdd
FUN_M69_big_0c000__1cdd:
  1cdd  3466           PSHS  U Y B A                     
  1cdf  EC9F70CE       LDD [0x70ce]                      
  1ce3  3606           PSHU  B A                         
  1ce5  CC0147         LDD #0x147                        
  1ce8  3606           PSHU  B A                         
  1cea  AD9FFCEE       JSR [0xfcee]                      
  1cee  FC7116         LDD 0x7116                        
  1cf1  3606           PSHU  B A                         
  1cf3  AD9FFCF2       JSR [0xfcf2]                      
  1cf7  3706           PULU  A B                         
  1cf9  FD70FA         STD 0x70fa                        
  1cfc  CC000A         LDD #0xa                          
  1cff  AD9FFD20       JSR [0xfd20]                      
  1d03  10BE70EA       LDY 0x70ea                        
  1d07  FC70FA         LDD 0x70fa                        
  1d0a  AD9FFD2E       JSR [0xfd2e]                      
  1d0e  3566           PULS  A B Y U                     
  1d10  39             RTS                               

; ---- function FUN_M69_big_0c000__1d11
FUN_M69_big_0c000__1d11:
  1d11  3406           PSHS  B A                         
  1d13  CC0000         LDD #0x0                          
  1d16  2021           BRA 0x1d39                        

; ---- function FUN_M69_big_0c000__1d18
FUN_M69_big_0c000__1d18:
  1d18  3406           PSHS  B A                         
  1d1a  CC0001         LDD #0x1                          
  1d1d  201A           BRA 0x1d39                        

; ---- function FUN_M69_big_0c000__1d1f
FUN_M69_big_0c000__1d1f:
  1d1f  3406           PSHS  B A                         
  1d21  CC0002         LDD #0x2                          
  1d24  2013           BRA 0x1d39                        

; ---- function FUN_M69_big_0c000__1d26
FUN_M69_big_0c000__1d26:
  1d26  3406           PSHS  B A                         
  1d28  CC0003         LDD #0x3                          
  1d2b  200C           BRA 0x1d39                        

; ---- function FUN_M69_big_0c000__1d2d
FUN_M69_big_0c000__1d2d:
  1d2d  3406           PSHS  B A                         
  1d2f  CC0004         LDD #0x4                          
  1d32  2005           BRA 0x1d39                        

; ---- function FUN_M69_big_0c000__1d34
FUN_M69_big_0c000__1d34:
  1d34  3406           PSHS  B A                         
  1d36  CC0005         LDD #0x5                          
LAB_M69_big_0c000__1d39:
  1d39  17126B         LBSR 0x2fa7                       
  1d3c  FC60F9         LDD 0x60f9                        
  1d3f  ED9F70D0       STD [0x70d0]                      
  1d43  FD6074         STD 0x6074                        
  1d46  10BE70DC       LDY 0x70dc                        
  1d4a  AD9FFC80       JSR [0xfc80]                      
  1d4e  FC70F8         LDD 0x70f8                        
  1d51  860A           LDA #0xa                          
  1d53  3D             MUL                               
  1d54  C31D67         ADDD #0x1d67                      
  1d57  F3600D         ADDD 0x600d                       
  1d5a  1F01           TFR D,X                           
  1d5c  AD84           JSR ,X                            
  1d5e  1700C4         LBSR 0x1e25                       
  1d61  1700D6         LBSR 0x1e3a                       
  1d64  3506           PULS  A B                         
  1d66  39             RTS                               

; ---- function FUN_M69_big_0c000__1d67
FUN_M69_big_0c000__1d67:
  1d67  3416           PSHS  X B A                       
  1d69  CC0000         LDD #0x0                          
  1d6c  8E0452         LDX #0x452                        
  1d6f  2030           BRA 0x1da1                        

; ---- function FUN_M69_big_0c000__1d71
FUN_M69_big_0c000__1d71:
  1d71  3416           PSHS  X B A                       
  1d73  CC0001         LDD #0x1                          
  1d76  8E0453         LDX #0x453                        
  1d79  2026           BRA 0x1da1                        

; ---- function FUN_M69_big_0c000__1d7b
FUN_M69_big_0c000__1d7b:
  1d7b  3416           PSHS  X B A                       
  1d7d  CC0002         LDD #0x2                          
  1d80  8E0454         LDX #0x454                        
  1d83  201C           BRA 0x1da1                        

; ---- function FUN_M69_big_0c000__1d85
FUN_M69_big_0c000__1d85:
  1d85  3416           PSHS  X B A                       
  1d87  CC0003         LDD #0x3                          
  1d8a  8E0455         LDX #0x455                        
  1d8d  2012           BRA 0x1da1                        

; ---- function FUN_M69_big_0c000__1d8f
FUN_M69_big_0c000__1d8f:
  1d8f  3416           PSHS  X B A                       
  1d91  CC0004         LDD #0x4                          
  1d94  8E0456         LDX #0x456                        
  1d97  2008           BRA 0x1da1                        

; ---- function FUN_M69_big_0c000__1d99
FUN_M69_big_0c000__1d99:
  1d99  3416           PSHS  X B A                       
  1d9b  CC0005         LDD #0x5                          
  1d9e  8E0457         LDX #0x457                        
LAB_M69_big_0c000__1da1:
  1da1  171203         LBSR 0x2fa7                       
  1da4  EC9F70D0       LDD [0x70d0]                      
  1da8  FD6074         STD 0x6074                        
  1dab  17E9BE         LBSR 0x076c                       
  1dae  C613           LDB #0x13                         
  1db0  AD9FFC36       JSR [0xfc36]                      
  1db4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " depth  :    mS      "
  1db8  0A6465707468.. char[22] "\ndepth  :    mS      " 
LAB_M69_big_0c000__1dce:
  1dce  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 02 80 $0028 $0000 $0000 ->$1E25 ->$1DFF $0001 $0001 $0000
  1dd2  01             db 1h                             
  1dd3  01             db 1h                             
  1dd4  02             db 2h                             
  1dd5  01             db 1h                             
  1dd6  01             db 1h                             
  1dd7  00             db 0h                             
  1dd8  02             db 2h                             
  1dd9  80             db 80h                            
  1dda  0028           dw 28h                            
  1ddc  0000           dw 0h                             
  1dde  0000           dw 0h                             
  1de0  1E25           addr M69_big_0c000::1e25          
  1de2  1DFF           addr M69_big_0c000::1dff          
  1de4  0001           dw 1h                             
  1de6  0001           dw 1h                             
  1de8  0000           dw 0h                             
LAB_M69_big_0c000__1dea:
  1dea  170038         LBSR 0x1e25                       
  1ded  C61A           LDB #0x1a                         
  1def  AD9FFC36       JSR [0xfc36]                      
  1df3  FC70F8         LDD 0x70f8                        
  1df6  CB31           ADDB #0x31                        
  1df8  AD9FFC2A       JSR [0xfc2a]                      
  1dfc  3516           PULS  A B X                       
  1dfe  39             RTS                               

; ---- function FUN_M69_big_0c000__1dff
FUN_M69_big_0c000__1dff:
  1dff  3426           PSHS  Y B A                       
  1e01  FC6074         LDD 0x6074                        
  1e04  ED9F70D0       STD [0x70d0]                      
  1e08  10BE70DC       LDY 0x70dc                        
  1e0c  AD9FFC80       JSR [0xfc80]                      
  1e10  FC70F8         LDD 0x70f8                        
  1e13  C30011         ADDD #0x11                        
  1e16  1F02           TFR D,Y                           
  1e18  EC9F70D0       LDD [0x70d0]                      
  1e1c  AD9FFE40       JSR [0xfe40]                      
  1e20  8D18           BSR 0x1e3a                        
  1e22  3526           PULS  A B Y                       
  1e24  39             RTS                               

; ---- function FUN_M69_big_0c000__1e25
FUN_M69_big_0c000__1e25:
  1e25  3456           PSHS  U X B A                     
  1e27  C61D           LDB #0x1d                         
  1e29  AD9FFC36       JSR [0xfc36]                      
  1e2d  CC0002         LDD #0x2                          
  1e30  8E60A1         LDX #0x60a1                       
  1e33  AD9FFC3A       JSR [0xfc3a]                      
  1e37  3556           PULS  A B X U                     
  1e39  39             RTS                               

; ---- function FUN_M69_big_0c000__1e3a
FUN_M69_big_0c000__1e3a:
  1e3a  3466           PSHS  U Y B A                     
  1e3c  EC9F70D0       LDD [0x70d0]                      
  1e40  3606           PSHU  B A                         
  1e42  CC002C         LDD #0x2c                         
  1e45  3606           PSHU  B A                         
  1e47  AD9FFCEE       JSR [0xfcee]                      
  1e4b  FC7114         LDD 0x7114                        
  1e4e  3606           PSHU  B A                         
  1e50  AD9FFCF2       JSR [0xfcf2]                      
  1e54  3706           PULU  A B                         
  1e56  FD70FA         STD 0x70fa                        
  1e59  CC000A         LDD #0xa                          
  1e5c  AD9FFD20       JSR [0xfd20]                      
  1e60  10BE70EC       LDY 0x70ec                        
  1e64  FC70FA         LDD 0x70fa                        
  1e67  AD9FFD2E       JSR [0xfd2e]                      
  1e6b  3566           PULS  A B Y U                     
  1e6d  39             RTS                               

; ---- function FUN_M69_big_0c000__1e6e
FUN_M69_big_0c000__1e6e:
  1e6e  3406           PSHS  B A                         
  1e70  CC0000         LDD #0x0                          
  1e73  2021           BRA 0x1e96                        

; ---- function FUN_M69_big_0c000__1e75
FUN_M69_big_0c000__1e75:
  1e75  3406           PSHS  B A                         
  1e77  CC0001         LDD #0x1                          
  1e7a  201A           BRA 0x1e96                        

; ---- function FUN_M69_big_0c000__1e7c
FUN_M69_big_0c000__1e7c:
  1e7c  3406           PSHS  B A                         
  1e7e  CC0002         LDD #0x2                          
  1e81  2013           BRA 0x1e96                        

; ---- function FUN_M69_big_0c000__1e83
FUN_M69_big_0c000__1e83:
  1e83  3406           PSHS  B A                         
  1e85  CC0003         LDD #0x3                          
  1e88  200C           BRA 0x1e96                        

; ---- function FUN_M69_big_0c000__1e8a
FUN_M69_big_0c000__1e8a:
  1e8a  3406           PSHS  B A                         
  1e8c  CC0004         LDD #0x4                          
  1e8f  2005           BRA 0x1e96                        

; ---- function FUN_M69_big_0c000__1e91
FUN_M69_big_0c000__1e91:
  1e91  3406           PSHS  B A                         
  1e93  CC0005         LDD #0x5                          
LAB_M69_big_0c000__1e96:
  1e96  17117C         LBSR 0x3015                       
  1e99  FC60F9         LDD 0x60f9                        
  1e9c  ED9F70D2       STD [0x70d2]                      
  1ea0  FD6074         STD 0x6074                        
  1ea3  10BE70DE       LDY 0x70de                        
  1ea7  AD9FFC80       JSR [0xfc80]                      
  1eab  FC70F8         LDD 0x70f8                        
  1eae  860E           LDA #0xe                          
  1eb0  3D             MUL                               
  1eb1  C31EC4         ADDD #0x1ec4                      
  1eb4  F3600D         ADDD 0x600d                       
  1eb7  1F01           TFR D,X                           
  1eb9  AD84           JSR ,X                            
  1ebb  1700DC         LBSR 0x1f9a                       
  1ebe  1700EE         LBSR 0x1faf                       
  1ec1  3506           PULS  A B                         
  1ec3  39             RTS                               

; ---- function FUN_M69_big_0c000__1ec4
FUN_M69_big_0c000__1ec4:
  1ec4  3436           PSHS  Y X B A                     
  1ec6  CC0000         LDD #0x0                          
  1ec9  8E0140         LDX #0x140                        
  1ecc  108E0143       LDY #0x143                        
  1ed0  2044           BRA 0x1f16                        

; ---- function FUN_M69_big_0c000__1ed2
FUN_M69_big_0c000__1ed2:
  1ed2  3436           PSHS  Y X B A                     
  1ed4  CC0001         LDD #0x1                          
  1ed7  8E0141         LDX #0x141                        
  1eda  108E0144       LDY #0x144                        
  1ede  2036           BRA 0x1f16                        

; ---- function FUN_M69_big_0c000__1ee0
FUN_M69_big_0c000__1ee0:
  1ee0  3436           PSHS  Y X B A                     
  1ee2  CC0002         LDD #0x2                          
  1ee5  8E0142         LDX #0x142                        
  1ee8  108E0145       LDY #0x145                        
  1eec  2028           BRA 0x1f16                        

; ---- function FUN_M69_big_0c000__1eee
FUN_M69_big_0c000__1eee:
  1eee  3436           PSHS  Y X B A                     
  1ef0  CC0003         LDD #0x3                          
  1ef3  8E0240         LDX #0x240                        
  1ef6  108E0243       LDY #0x243                        
  1efa  201A           BRA 0x1f16                        

; ---- function FUN_M69_big_0c000__1efc
FUN_M69_big_0c000__1efc:
  1efc  3436           PSHS  Y X B A                     
  1efe  CC0004         LDD #0x4                          
  1f01  8E0241         LDX #0x241                        
  1f04  108E0244       LDY #0x244                        
  1f08  200C           BRA 0x1f16                        

; ---- function FUN_M69_big_0c000__1f0a
FUN_M69_big_0c000__1f0a:
  1f0a  3436           PSHS  Y X B A                     
  1f0c  CC0005         LDD #0x5                          
  1f0f  8E0242         LDX #0x242                        
  1f12  108E0245       LDY #0x245                        
LAB_M69_big_0c000__1f16:
  1f16  1710FC         LBSR 0x3015                       
  1f19  EC9F70D2       LDD [0x70d2]                      
  1f1d  FD6074         STD 0x6074                        
  1f20  17E849         LBSR 0x076c                       
  1f23  C613           LDB #0x13                         
  1f25  AD9FFC36       JSR [0xfc36]                      
  1f29  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " level  :     %      "
  1f2d  0A6C6576656C.. char[22] "\nlevel  :     %      " 
LAB_M69_big_0c000__1f43:
  1f43  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$1F9A ->$1F74 $0001 $0001 $0000
  1f47  01             db 1h                             
  1f48  01             db 1h                             
  1f49  02             db 2h                             
  1f4a  01             db 1h                             
  1f4b  01             db 1h                             
  1f4c  00             db 0h                             
  1f4d  03             db 3h                             
  1f4e  80             db 80h                            
  1f4f  0064           dw 64h                            
  1f51  0000           dw 0h                             
  1f53  0000           dw 0h                             
  1f55  1F9A           addr M69_big_0c000::1f9a          
  1f57  1F74           addr M69_big_0c000::1f74          
  1f59  0001           dw 1h                             
  1f5b  0001           dw 1h                             
  1f5d  0000           dw 0h                             
LAB_M69_big_0c000__1f5f:
  1f5f  170038         LBSR 0x1f9a                       
  1f62  C61A           LDB #0x1a                         
  1f64  AD9FFC36       JSR [0xfc36]                      
  1f68  FC70F8         LDD 0x70f8                        
  1f6b  CB31           ADDB #0x31                        
  1f6d  AD9FFC2A       JSR [0xfc2a]                      
  1f71  3536           PULS  A B X Y                     
  1f73  39             RTS                               

; ---- function FUN_M69_big_0c000__1f74
FUN_M69_big_0c000__1f74:
  1f74  3426           PSHS  Y B A                       
  1f76  FC6074         LDD 0x6074                        
  1f79  ED9F70D2       STD [0x70d2]                      
  1f7d  10BE70DE       LDY 0x70de                        
  1f81  AD9FFC80       JSR [0xfc80]                      
  1f85  FC70F8         LDD 0x70f8                        
  1f88  C3001D         ADDD #0x1d                        
  1f8b  1F02           TFR D,Y                           
  1f8d  EC9F70D2       LDD [0x70d2]                      
  1f91  AD9FFE40       JSR [0xfe40]                      
  1f95  8D18           BSR 0x1faf                        
  1f97  3526           PULS  A B Y                       
  1f99  39             RTS                               

; ---- function FUN_M69_big_0c000__1f9a
FUN_M69_big_0c000__1f9a:
  1f9a  3456           PSHS  U X B A                     
  1f9c  C61D           LDB #0x1d                         
  1f9e  AD9FFC36       JSR [0xfc36]                      
  1fa2  CC0003         LDD #0x3                          
  1fa5  8E60A0         LDX #0x60a0                       
  1fa8  AD9FFC3A       JSR [0xfc3a]                      
  1fac  3556           PULS  A B X U                     
  1fae  39             RTS                               

; ---- function FUN_M69_big_0c000__1faf
FUN_M69_big_0c000__1faf:
  1faf  3476           PSHS  U Y X B A                   
  1fb1  EC9F70D2       LDD [0x70d2]                      
  1fb5  3606           PSHU  B A                         
  1fb7  CC000E         LDD #0xe                          
  1fba  3606           PSHU  B A                         
  1fbc  AD9FFCEE       JSR [0xfcee]                      
  1fc0  3706           PULU  A B                         
  1fc2  FD70FA         STD 0x70fa                        
  1fc5  EC9F70D4       LDD [0x70d4]                      
  1fc9  3606           PSHU  B A                         
  1fcb  FC711C         LDD 0x711c                        
  1fce  3606           PSHU  B A                         
  1fd0  AD9FFCF2       JSR [0xfcf2]                      
  1fd4  3706           PULU  A B                         
  1fd6  FD70FC         STD 0x70fc                        
  1fd9  FC70FC         LDD 0x70fc                        
  1fdc  C3000B         ADDD #0xb                         
  1fdf  3606           PSHU  B A                         
  1fe1  FC70FA         LDD 0x70fa                        
  1fe4  3606           PSHU  B A                         
  1fe6  AD9FFCEE       JSR [0xfcee]                      
  1fea  3706           PULU  A B                         
  1fec  FD70FE         STD 0x70fe                        
  1fef  CC000A         LDD #0xa                          
  1ff2  AD9FFD20       JSR [0xfd20]                      
  1ff6  10BE70EE       LDY 0x70ee                        
  1ffa  FC70FE         LDD 0x70fe                        
  1ffd  AD9FFD2E       JSR [0xfd2e]                      
  2001  CC000B         LDD #0xb                          
  2004  B370FC         SUBD 0x70fc                       
  2007  3606           PSHU  B A                         
  2009  FC70FA         LDD 0x70fa                        
  200c  3606           PSHU  B A                         
  200e  AD9FFCEE       JSR [0xfcee]                      
  2012  3706           PULU  A B                         
  2014  FD70FE         STD 0x70fe                        
  2017  CC000A         LDD #0xa                          
  201a  AD9FFD20       JSR [0xfd20]                      
  201e  10BE70F0       LDY 0x70f0                        
  2022  FC70FE         LDD 0x70fe                        
  2025  AD9FFD2E       JSR [0xfd2e]                      
  2029  3576           PULS  A B X Y U                   
  202b  39             RTS                               

; ---- function FUN_M69_big_0c000__202c
FUN_M69_big_0c000__202c:
  202c  3406           PSHS  B A                         
  202e  CC0000         LDD #0x0                          
  2031  2021           BRA 0x2054                        

; ---- function FUN_M69_big_0c000__2033
FUN_M69_big_0c000__2033:
  2033  3406           PSHS  B A                         
  2035  CC0001         LDD #0x1                          
  2038  201A           BRA 0x2054                        

; ---- function FUN_M69_big_0c000__203a
FUN_M69_big_0c000__203a:
  203a  3406           PSHS  B A                         
  203c  CC0002         LDD #0x2                          
  203f  2013           BRA 0x2054                        

; ---- function FUN_M69_big_0c000__2041
FUN_M69_big_0c000__2041:
  2041  3406           PSHS  B A                         
  2043  CC0003         LDD #0x3                          
  2046  200C           BRA 0x2054                        

; ---- function FUN_M69_big_0c000__2048
FUN_M69_big_0c000__2048:
  2048  3406           PSHS  B A                         
  204a  CC0004         LDD #0x4                          
  204d  2005           BRA 0x2054                        

; ---- function FUN_M69_big_0c000__204f
FUN_M69_big_0c000__204f:
  204f  3406           PSHS  B A                         
  2051  CC0005         LDD #0x5                          
LAB_M69_big_0c000__2054:
  2054  170FBE         LBSR 0x3015                       
  2057  FC60F9         LDD 0x60f9                        
  205a  ED9F70D4       STD [0x70d4]                      
  205e  FD6074         STD 0x6074                        
  2061  10BE70E0       LDY 0x70e0                        
  2065  AD9FFC80       JSR [0xfc80]                      
  2069  FC70F8         LDD 0x70f8                        
  206c  860E           LDA #0xe                          
  206e  3D             MUL                               
  206f  C32082         ADDD #0x2082                      
  2072  F3600D         ADDD 0x600d                       
  2075  1F01           TFR D,X                           
  2077  AD84           JSR ,X                            
  2079  1700EB         LBSR 0x2167                       
  207c  170123         LBSR 0x21a2                       
  207f  3506           PULS  A B                         
  2081  39             RTS                               

; ---- function FUN_M69_big_0c000__2082
FUN_M69_big_0c000__2082:
  2082  3436           PSHS  Y X B A                     
  2084  CC0000         LDD #0x0                          
  2087  8E0140         LDX #0x140                        
  208a  108E0143       LDY #0x143                        
  208e  2044           BRA 0x20d4                        

; ---- function FUN_M69_big_0c000__2090
FUN_M69_big_0c000__2090:
  2090  3436           PSHS  Y X B A                     
  2092  CC0001         LDD #0x1                          
  2095  8E0141         LDX #0x141                        
  2098  108E0144       LDY #0x144                        
  209c  2036           BRA 0x20d4                        

; ---- function FUN_M69_big_0c000__209e
FUN_M69_big_0c000__209e:
  209e  3436           PSHS  Y X B A                     
  20a0  CC0002         LDD #0x2                          
  20a3  8E0142         LDX #0x142                        
  20a6  108E0145       LDY #0x145                        
  20aa  2028           BRA 0x20d4                        

; ---- function FUN_M69_big_0c000__20ac
FUN_M69_big_0c000__20ac:
  20ac  3436           PSHS  Y X B A                     
  20ae  CC0003         LDD #0x3                          
  20b1  8E0240         LDX #0x240                        
  20b4  108E0243       LDY #0x243                        
  20b8  201A           BRA 0x20d4                        

; ---- function FUN_M69_big_0c000__20ba
FUN_M69_big_0c000__20ba:
  20ba  3436           PSHS  Y X B A                     
  20bc  CC0004         LDD #0x4                          
  20bf  8E0241         LDX #0x241                        
  20c2  108E0244       LDY #0x244                        
  20c6  200C           BRA 0x20d4                        

; ---- function FUN_M69_big_0c000__20c8
FUN_M69_big_0c000__20c8:
  20c8  3436           PSHS  Y X B A                     
  20ca  CC0005         LDD #0x5                          
  20cd  8E0242         LDX #0x242                        
  20d0  108E0245       LDY #0x245                        
LAB_M69_big_0c000__20d4:
  20d4  170F3E         LBSR 0x3015                       
  20d7  EC9F70D4       LDD [0x70d4]                      
  20db  FD6074         STD 0x6074                        
  20de  17E68B         LBSR 0x076c                       
  20e1  C604           LDB #0x4                          
  20e3  AD9FFC36       JSR [0xfc36]                      
  20e7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " pan  : L-           C           -R "
  20eb  0A70616E2020.. char[37] "\npan  : L-           C           -R "
LAB_M69_big_0c000__2110:
  2110  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $000B $FFF5 $0000 ->$2167 ->$2141 $0001 $0001 $0000
  2114  01             db 1h                             
  2115  01             db 1h                             
  2116  02             db 2h                             
  2117  01             db 1h                             
  2118  01             db 1h                             
  2119  00             db 0h                             
  211a  03             db 3h                             
  211b  80             db 80h                            
  211c  000B           dw Bh                             
  211e  FFF5           dw FFF5h                          
  2120  0000           dw 0h                             
  2122  2167           addr M69_big_0c000::2167          
  2124  2141           addr M69_big_0c000::2141          
  2126  0001           dw 1h                             
  2128  0001           dw 1h                             
  212a  0000           dw 0h                             
LAB_M69_big_0c000__212c:
  212c  170038         LBSR 0x2167                       
  212f  C609           LDB #0x9                          
  2131  AD9FFC36       JSR [0xfc36]                      
  2135  FC70F8         LDD 0x70f8                        
  2138  CB31           ADDB #0x31                        
  213a  AD9FFC2A       JSR [0xfc2a]                      
  213e  3536           PULS  A B X Y                     
  2140  39             RTS                               

; ---- function FUN_M69_big_0c000__2141
FUN_M69_big_0c000__2141:
  2141  3426           PSHS  Y B A                       
  2143  FC6074         LDD 0x6074                        
  2146  ED9F70D4       STD [0x70d4]                      
  214a  10BE70E0       LDY 0x70e0                        
  214e  AD9FFC80       JSR [0xfc80]                      
  2152  FC70F8         LDD 0x70f8                        
  2155  C30029         ADDD #0x29                        
  2158  1F02           TFR D,Y                           
  215a  EC9F70D4       LDD [0x70d4]                      
  215e  AD9FFE40       JSR [0xfe40]                      
  2162  8D3E           BSR 0x21a2                        
  2164  3526           PULS  A B Y                       
  2166  39             RTS                               

; ---- function FUN_M69_big_0c000__2167
FUN_M69_big_0c000__2167:
  2167  3456           PSHS  U X B A                     
  2169  C60E           LDB #0xe                          
  216b  AD9FFC36       JSR [0xfc36]                      
  216f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "           C           "
  2173  202020202020.. char[24] "           C           "
LAB_M69_big_0c000__218b:
  218b  EC9F70D4       LDD [0x70d4]                      
  218f  C3000B         ADDD #0xb                         
  2192  C3000E         ADDD #0xe                         
  2195  AD9FFC36       JSR [0xfc36]                      
  2199  C62A           LDB #0x2a                         
  219b  AD9FFC2A       JSR [0xfc2a]                      
  219f  3556           PULS  A B X U                     
  21a1  39             RTS                               

; ---- function FUN_M69_big_0c000__21a2
FUN_M69_big_0c000__21a2:
  21a2  17FE0A         LBSR 0x1faf                       
  21a5  39             RTS                               

; ---- function FUN_M69_big_0c000__21a6
FUN_M69_big_0c000__21a6:
  21a6  3406           PSHS  B A                         
  21a8  CC0000         LDD #0x0                          
  21ab  2021           BRA 0x21ce                        

; ---- function FUN_M69_big_0c000__21ad
FUN_M69_big_0c000__21ad:
  21ad  3406           PSHS  B A                         
  21af  CC0001         LDD #0x1                          
  21b2  201A           BRA 0x21ce                        

; ---- function FUN_M69_big_0c000__21b4
FUN_M69_big_0c000__21b4:
  21b4  3406           PSHS  B A                         
  21b6  CC0002         LDD #0x2                          
  21b9  2013           BRA 0x21ce                        

; ---- function FUN_M69_big_0c000__21bb
FUN_M69_big_0c000__21bb:
  21bb  3406           PSHS  B A                         
  21bd  CC0003         LDD #0x3                          
  21c0  200C           BRA 0x21ce                        

; ---- function FUN_M69_big_0c000__21c2
FUN_M69_big_0c000__21c2:
  21c2  3406           PSHS  B A                         
  21c4  CC0004         LDD #0x4                          
  21c7  2005           BRA 0x21ce                        

; ---- function FUN_M69_big_0c000__21c9
FUN_M69_big_0c000__21c9:
  21c9  3406           PSHS  B A                         
  21cb  CC0005         LDD #0x5                          
LAB_M69_big_0c000__21ce:
  21ce  170EE3         LBSR 0x30b4                       
  21d1  FC60F9         LDD 0x60f9                        
  21d4  ED9F70D6       STD [0x70d6]                      
  21d8  FD6074         STD 0x6074                        
  21db  10BE70E2       LDY 0x70e2                        
  21df  AD9FFC80       JSR [0xfc80]                      
  21e3  FC70F8         LDD 0x70f8                        
  21e6  860A           LDA #0xa                          
  21e8  3D             MUL                               
  21e9  C321FC         ADDD #0x21fc                      
  21ec  F3600D         ADDD 0x600d                       
  21ef  1F01           TFR D,X                           
  21f1  AD84           JSR ,X                            
  21f3  1700C4         LBSR 0x22ba                       
  21f6  1700D6         LBSR 0x22cf                       
  21f9  3506           PULS  A B                         
  21fb  39             RTS                               

; ---- function FUN_M69_big_0c000__21fc
FUN_M69_big_0c000__21fc:
  21fc  3416           PSHS  X B A                       
  21fe  CC0000         LDD #0x0                          
  2201  8E0146         LDX #0x146                        
  2204  2030           BRA 0x2236                        

; ---- function FUN_M69_big_0c000__2206
FUN_M69_big_0c000__2206:
  2206  3416           PSHS  X B A                       
  2208  CC0001         LDD #0x1                          
  220b  8E0147         LDX #0x147                        
  220e  2026           BRA 0x2236                        

; ---- function FUN_M69_big_0c000__2210
FUN_M69_big_0c000__2210:
  2210  3416           PSHS  X B A                       
  2212  CC0002         LDD #0x2                          
  2215  8E0148         LDX #0x148                        
  2218  201C           BRA 0x2236                        

; ---- function FUN_M69_big_0c000__221a
FUN_M69_big_0c000__221a:
  221a  3416           PSHS  X B A                       
  221c  CC0003         LDD #0x3                          
  221f  8E0246         LDX #0x246                        
  2222  2012           BRA 0x2236                        

; ---- function FUN_M69_big_0c000__2224
FUN_M69_big_0c000__2224:
  2224  3416           PSHS  X B A                       
  2226  CC0004         LDD #0x4                          
  2229  8E0247         LDX #0x247                        
  222c  2008           BRA 0x2236                        

; ---- function FUN_M69_big_0c000__222e
FUN_M69_big_0c000__222e:
  222e  3416           PSHS  X B A                       
  2230  CC0005         LDD #0x5                          
  2233  8E0248         LDX #0x248                        
LAB_M69_big_0c000__2236:
  2236  170E7B         LBSR 0x30b4                       
  2239  EC9F70D6       LDD [0x70d6]                      
  223d  FD6074         STD 0x6074                        
  2240  17E529         LBSR 0x076c                       
  2243  C613           LDB #0x13                         
  2245  AD9FFC36       JSR [0xfc36]                      
  2249  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " feedback  :     %   "
  224d  0A6665656462.. char[22] "\nfeedback  :     %   " 
LAB_M69_big_0c000__2263:
  2263  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$22BA ->$2294 $0001 $0001 $0000
  2267  01             db 1h                             
  2268  01             db 1h                             
  2269  02             db 2h                             
  226a  01             db 1h                             
  226b  01             db 1h                             
  226c  00             db 0h                             
  226d  04             db 4h                             
  226e  80             db 80h                            
  226f  0063           dw 63h                            
  2271  FF9C           dw FF9Ch                          
  2273  0000           dw 0h                             
  2275  22BA           addr M69_big_0c000::22ba          
  2277  2294           addr M69_big_0c000::2294          
  2279  0001           dw 1h                             
  227b  0001           dw 1h                             
  227d  0000           dw 0h                             
LAB_M69_big_0c000__227f:
  227f  170038         LBSR 0x22ba                       
  2282  C61D           LDB #0x1d                         
  2284  AD9FFC36       JSR [0xfc36]                      
  2288  FC70F8         LDD 0x70f8                        
  228b  CB31           ADDB #0x31                        
  228d  AD9FFC2A       JSR [0xfc2a]                      
  2291  3516           PULS  A B X                       
  2293  39             RTS                               

; ---- function FUN_M69_big_0c000__2294
FUN_M69_big_0c000__2294:
  2294  3426           PSHS  Y B A                       
  2296  FC6074         LDD 0x6074                        
  2299  ED9F70D6       STD [0x70d6]                      
  229d  10BE70E2       LDY 0x70e2                        
  22a1  AD9FFC80       JSR [0xfc80]                      
  22a5  FC70F8         LDD 0x70f8                        
  22a8  C30023         ADDD #0x23                        
  22ab  1F02           TFR D,Y                           
  22ad  EC9F70D6       LDD [0x70d6]                      
  22b1  AD9FFE40       JSR [0xfe40]                      
  22b5  8D18           BSR 0x22cf                        
  22b7  3526           PULS  A B Y                       
  22b9  39             RTS                               

; ---- function FUN_M69_big_0c000__22ba
FUN_M69_big_0c000__22ba:
  22ba  3456           PSHS  U X B A                     
  22bc  C620           LDB #0x20                         
  22be  AD9FFC36       JSR [0xfc36]                      
  22c2  CC0004         LDD #0x4                          
  22c5  8E609F         LDX #0x609f                       
  22c8  AD9FFC3A       JSR [0xfc3a]                      
  22cc  3556           PULS  A B X U                     
  22ce  39             RTS                               

; ---- function FUN_M69_big_0c000__22cf
FUN_M69_big_0c000__22cf:
  22cf  3476           PSHS  U Y X B A                   
  22d1  EC9F70D6       LDD [0x70d6]                      
  22d5  3606           PSHU  B A                         
  22d7  CC0147         LDD #0x147                        
  22da  3606           PSHU  B A                         
  22dc  AD9FFCEC       JSR [0xfcec]                      
  22e0  3706           PULU  A B                         
  22e2  FD70FA         STD 0x70fa                        
  22e5  EC9F70D6       LDD [0x70d6]                      
  22e9  3606           PSHU  B A                         
  22eb  CC55C1         LDD #0x55c1                       
  22ee  3606           PSHU  B A                         
  22f0  AD9FFCF2       JSR [0xfcf2]                      
  22f4  3706           PULU  A B                         
  22f6  F370FA         ADDD 0x70fa                       
  22f9  3606           PSHU  B A                         
  22fb  FC711A         LDD 0x711a                        
  22fe  3606           PSHU  B A                         
  2300  AD9FFCF2       JSR [0xfcf2]                      
  2304  3706           PULU  A B                         
  2306  FD70FA         STD 0x70fa                        
  2309  CC000A         LDD #0xa                          
  230c  AD9FFD20       JSR [0xfd20]                      
  2310  10BE70F2       LDY 0x70f2                        
  2314  FC70FA         LDD 0x70fa                        
  2317  AD9FFD2E       JSR [0xfd2e]                      
  231b  3576           PULS  A B X Y U                   
  231d  39             RTS                               
PTR_FUN_M69_big_0c000__23e4_M69_big_0c000__231e:
  231e  23E4           addr M69_big_0c000::23e4          
  2320  23F9           addr M69_big_0c000::23f9          
  2322  7000           addr 7000                         
  2324  .db 00 3B FF 9C 00 64 00 04                          ; .;...d..

; ---- function FUN_M69_big_0c000__232c
FUN_M69_big_0c000__232c:
  232c  3410           PSHS  X                           
  232e  8E231E         LDX #0x231e                        ; desc[API_FE1C]: ->$23E4 ->$23F9 $7000
  2331  AD9FFE1C       JSR [0xfe1c]                      
  2335  3510           PULS  X                           
  2337  39             RTS                               

; ---- function FUN_M69_big_0c000__2338
FUN_M69_big_0c000__2338:
  2338  3410           PSHS  X                           
  233a  8E231E         LDX #0x231e                        ; desc[API_FE1A]: ->$23E4 ->$23F9 $7000
  233d  AD9FFE1A       JSR [0xfe1a]                      
  2341  3510           PULS  X                           
  2343  39             RTS                               

; ---- function FUN_M69_big_0c000__2344
FUN_M69_big_0c000__2344:
  2344  3426           PSHS  Y B A                       
  2346  AD9FFC8E       JSR [0xfc8e]                      
  234a  FC60F9         LDD 0x60f9                        
  234d  FD6074         STD 0x6074                        
  2350  B37002         SUBD 0x7002                       
  2353  FD7000         STD 0x7000                        
  2356  1700A0         LBSR 0x23f9                       
  2359  CC715F         LDD #0x715f                       
  235c  837126         SUBD #0x7126                      
  235f  1F02           TFR D,Y                           
  2361  FC7000         LDD 0x7000                        
  2364  AD9FFC82       JSR [0xfc82]                      
  2368  3526           PULS  A B Y                       
  236a  39             RTS                               

; ---- function FUN_M69_big_0c000__236b
FUN_M69_big_0c000__236b:
  236b  3406           PSHS  B A                         
  236d  FC7004         LDD 0x7004                        
  2370  FD6074         STD 0x6074                        
  2373  17E3F6         LBSR 0x076c                       
  2376  C613           LDB #0x13                         
  2378  AD9FFC36       JSR [0xfc36]                      
  237c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " mix:     % wet      "
  2380  0A6D69783A20.. char[22] "\nmix:     % wet      " 
LAB_M69_big_0c000__2396:
  2396  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$23E4 ->$23B8 $0001 $0001 $0000
  239a  01             db 1h                             
  239b  01             db 1h                             
  239c  02             db 2h                             
  239d  01             db 1h                             
  239e  01             db 1h                             
  239f  00             db 0h                             
  23a0  03             db 3h                             
  23a1  80             db 80h                            
  23a2  0064           dw 64h                            
  23a4  0000           dw 0h                             
  23a6  0000           dw 0h                             
  23a8  23E4           addr M69_big_0c000::23e4          
  23aa  23B8           addr M69_big_0c000::23b8          
  23ac  0001           dw 1h                             
  23ae  0001           dw 1h                             
  23b0  0000           dw 0h                             
LAB_M69_big_0c000__23b2:
  23b2  17002F         LBSR 0x23e4                       
  23b5  3506           PULS  A B                         
  23b7  39             RTS                               

; ---- function FUN_M69_big_0c000__23b8
FUN_M69_big_0c000__23b8:
  23b8  3426           PSHS  Y B A                       
  23ba  FC6074         LDD 0x6074                        
  23bd  B37002         SUBD 0x7002                       
  23c0  FD7000         STD 0x7000                        
  23c3  CC715F         LDD #0x715f                       
  23c6  837126         SUBD #0x7126                      
  23c9  1F02           TFR D,Y                           
  23cb  FC7000         LDD 0x7000                        
  23ce  AD9FFC82       JSR [0xfc82]                      
  23d2  8D25           BSR 0x23f9                        
  23d4  8D0E           BSR 0x23e4                        
  23d6  108E0000       LDY #0x0                          
  23da  FC7000         LDD 0x7000                        
  23dd  AD9FFE40       JSR [0xfe40]                      
  23e1  3526           PULS  A B Y                       
  23e3  39             RTS                               

; ---- function FUN_M69_big_0c000__23e4
FUN_M69_big_0c000__23e4:
  23e4  3416           PSHS  X B A                       
  23e6  C619           LDB #0x19                         
  23e8  AD9FFC36       JSR [0xfc36]                      
  23ec  CC0003         LDD #0x3                          
  23ef  8E60A0         LDX #0x60a0                       
  23f2  AD9FFC3A       JSR [0xfc3a]                      
  23f6  3516           PULS  A B X                       
  23f8  39             RTS                               

; ---- function FUN_M69_big_0c000__23f9
FUN_M69_big_0c000__23f9:
  23f9  3476           PSHS  U Y X B A                   
  23fb  CC0000         LDD #0x0                          
  23fe  3606           PSHU  B A                         
  2400  CC0064         LDD #0x64                         
  2403  3606           PSHU  B A                         
  2405  FC7000         LDD 0x7000                        
  2408  F37002         ADDD 0x7002                       
  240b  3606           PSHU  B A                         
  240d  AD9FFCD8       JSR [0xfcd8]                      
  2411  3706           PULU  A B                         
  2413  FD7004         STD 0x7004                        
  2416  CC0064         LDD #0x64                         
  2419  B37004         SUBD 0x7004                       
  241c  3606           PSHU  B A                         
  241e  58             LSLB                              
  241f  49             ROLA                              
  2420  FD70FA         STD 0x70fa                        
  2423  CC4666         LDD #0x4666                       
  2426  3606           PSHU  B A                         
  2428  AD9FFCF2       JSR [0xfcf2]                      
  242c  3706           PULU  A B                         
  242e  F370FA         ADDD 0x70fa                       
  2431  AD9FFC6A       JSR [0xfc6a]                      
  2435  AD9FFC72       JSR [0xfc72]                      
  2439  3576           PULS  A B X Y U                   
  243b  39             RTS                               
PTR_FUN_M69_big_0c000__2502_M69_big_0c000__243c:
  243c  2502           addr M69_big_0c000::2502          
  243e  2517           addr M69_big_0c000::2517          
  2440  7008           addr 7008                         
  2442  .db 00 3B FF 9C 00 64 00 04                          ; .;...d..

; ---- function FUN_M69_big_0c000__244a
FUN_M69_big_0c000__244a:
  244a  3410           PSHS  X                           
  244c  8E243C         LDX #0x243c                        ; desc[API_FE1C]: ->$2502 ->$2517 $7008
  244f  AD9FFE1C       JSR [0xfe1c]                      
  2453  3510           PULS  X                           
  2455  39             RTS                               

; ---- function FUN_M69_big_0c000__2456
FUN_M69_big_0c000__2456:
  2456  3410           PSHS  X                           
  2458  8E243C         LDX #0x243c                        ; desc[API_FE1A]: ->$2502 ->$2517 $7008
  245b  AD9FFE1A       JSR [0xfe1a]                      
  245f  3510           PULS  X                           
  2461  39             RTS                               

; ---- function FUN_M69_big_0c000__2462
FUN_M69_big_0c000__2462:
  2462  3426           PSHS  Y B A                       
  2464  AD9FFC8E       JSR [0xfc8e]                      
  2468  FC60F9         LDD 0x60f9                        
  246b  FD6074         STD 0x6074                        
  246e  B3700A         SUBD 0x700a                       
  2471  FD7008         STD 0x7008                        
  2474  1700A0         LBSR 0x2517                       
  2477  CC715F         LDD #0x715f                       
  247a  837126         SUBD #0x7126                      
  247d  1F02           TFR D,Y                           
  247f  FC7008         LDD 0x7008                        
  2482  AD9FFC82       JSR [0xfc82]                      
  2486  3526           PULS  A B Y                       
  2488  39             RTS                               

; ---- function FUN_M69_big_0c000__2489
FUN_M69_big_0c000__2489:
  2489  3406           PSHS  B A                         
  248b  FC700C         LDD 0x700c                        
  248e  FD6074         STD 0x6074                        
  2491  17E2D8         LBSR 0x076c                       
  2494  C613           LDB #0x13                         
  2496  AD9FFC36       JSR [0xfc36]                      
  249a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left mix:     % wet "
  249e  0A6C65667420.. char[22] "\nleft mix:     % wet " 
LAB_M69_big_0c000__24b4:
  24b4  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$2502 ->$24D6 $0001 $0001 $0000
  24b8  01             db 1h                             
  24b9  01             db 1h                             
  24ba  02             db 2h                             
  24bb  01             db 1h                             
  24bc  01             db 1h                             
  24bd  00             db 0h                             
  24be  03             db 3h                             
  24bf  80             db 80h                            
  24c0  0064           dw 64h                            
  24c2  0000           dw 0h                             
  24c4  0000           dw 0h                             
  24c6  2502           addr M69_big_0c000::2502          
  24c8  24D6           addr M69_big_0c000::24d6          
  24ca  0001           dw 1h                             
  24cc  0001           dw 1h                             
  24ce  0000           dw 0h                             
LAB_M69_big_0c000__24d0:
  24d0  17002F         LBSR 0x2502                       
  24d3  3506           PULS  A B                         
  24d5  39             RTS                               

; ---- function FUN_M69_big_0c000__24d6
FUN_M69_big_0c000__24d6:
  24d6  3426           PSHS  Y B A                       
  24d8  FC6074         LDD 0x6074                        
  24db  B3700A         SUBD 0x700a                       
  24de  FD7008         STD 0x7008                        
  24e1  CC715F         LDD #0x715f                       
  24e4  837126         SUBD #0x7126                      
  24e7  1F02           TFR D,Y                           
  24e9  FC7008         LDD 0x7008                        
  24ec  AD9FFC82       JSR [0xfc82]                      
  24f0  108E0000       LDY #0x0                          
  24f4  FC7008         LDD 0x7008                        
  24f7  AD9FFE40       JSR [0xfe40]                      
  24fb  8D1A           BSR 0x2517                        
  24fd  8D03           BSR 0x2502                        
  24ff  3526           PULS  A B Y                       
  2501  39             RTS                               

; ---- function FUN_M69_big_0c000__2502
FUN_M69_big_0c000__2502:
  2502  3416           PSHS  X B A                       
  2504  C61E           LDB #0x1e                         
  2506  AD9FFC36       JSR [0xfc36]                      
  250a  CC0003         LDD #0x3                          
  250d  8E60A0         LDX #0x60a0                       
  2510  AD9FFC3A       JSR [0xfc3a]                      
  2514  3516           PULS  A B X                       
  2516  39             RTS                               

; ---- function FUN_M69_big_0c000__2517
FUN_M69_big_0c000__2517:
  2517  3476           PSHS  U Y X B A                   
  2519  CC0000         LDD #0x0                          
  251c  3606           PSHU  B A                         
  251e  CC0064         LDD #0x64                         
  2521  3606           PSHU  B A                         
  2523  FC7008         LDD 0x7008                        
  2526  F3700A         ADDD 0x700a                       
  2529  3606           PSHU  B A                         
  252b  AD9FFCD8       JSR [0xfcd8]                      
  252f  3706           PULU  A B                         
  2531  FD700C         STD 0x700c                        
  2534  CC0064         LDD #0x64                         
  2537  B3700C         SUBD 0x700c                       
  253a  3606           PSHU  B A                         
  253c  58             LSLB                              
  253d  49             ROLA                              
  253e  FD70FA         STD 0x70fa                        
  2541  CC4666         LDD #0x4666                       
  2544  3606           PSHU  B A                         
  2546  AD9FFCF2       JSR [0xfcf2]                      
  254a  3706           PULU  A B                         
  254c  F370FA         ADDD 0x70fa                       
  254f  AD9FFC6A       JSR [0xfc6a]                      
  2553  3576           PULS  A B X Y U                   
  2555  39             RTS                               
PTR_FUN_M69_big_0c000__261c_M69_big_0c000__2556:
  2556  261C           addr M69_big_0c000::261c          
  2558  2631           addr M69_big_0c000::2631          
  255a  7010           addr 7010                         
  255c  .db 00 51 FF 9C 00 64 00 04                          ; .Q...d..

; ---- function FUN_M69_big_0c000__2564
FUN_M69_big_0c000__2564:
  2564  3410           PSHS  X                           
  2566  8E2556         LDX #0x2556                        ; desc[API_FE1C]: ->$261C ->$2631 $7010
  2569  AD9FFE1C       JSR [0xfe1c]                      
  256d  3510           PULS  X                           
  256f  39             RTS                               

; ---- function FUN_M69_big_0c000__2570
FUN_M69_big_0c000__2570:
  2570  3410           PSHS  X                           
  2572  8E2556         LDX #0x2556                        ; desc[API_FE1A]: ->$261C ->$2631 $7010
  2575  AD9FFE1A       JSR [0xfe1a]                      
  2579  3510           PULS  X                           
  257b  39             RTS                               

; ---- function FUN_M69_big_0c000__257c
FUN_M69_big_0c000__257c:
  257c  3426           PSHS  Y B A                       
  257e  AD9FFC8E       JSR [0xfc8e]                      
  2582  FC60F9         LDD 0x60f9                        
  2585  FD6074         STD 0x6074                        
  2588  B37012         SUBD 0x7012                       
  258b  FD7010         STD 0x7010                        
  258e  1700A0         LBSR 0x2631                       
  2591  CC7175         LDD #0x7175                       
  2594  837126         SUBD #0x7126                      
  2597  1F02           TFR D,Y                           
  2599  FC7010         LDD 0x7010                        
  259c  AD9FFC82       JSR [0xfc82]                      
  25a0  3526           PULS  A B Y                       
  25a2  39             RTS                               

; ---- function FUN_M69_big_0c000__25a3
FUN_M69_big_0c000__25a3:
  25a3  3406           PSHS  B A                         
  25a5  FC7014         LDD 0x7014                        
  25a8  FD6074         STD 0x6074                        
  25ab  17E1BE         LBSR 0x076c                       
  25ae  C613           LDB #0x13                         
  25b0  AD9FFC36       JSR [0xfc36]                      
  25b4  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right mix:    % wet "
  25b8  0A7269676874.. char[22] "\nright mix:    % wet " 
LAB_M69_big_0c000__25ce:
  25ce  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 03 80 $0064 $0000 $0000 ->$261C ->$25F0 $0001 $0001 $0000
  25d2  01             db 1h                             
  25d3  01             db 1h                             
  25d4  02             db 2h                             
  25d5  01             db 1h                             
  25d6  01             db 1h                             
  25d7  00             db 0h                             
  25d8  03             db 3h                             
  25d9  80             db 80h                            
  25da  0064           dw 64h                            
  25dc  0000           dw 0h                             
  25de  0000           dw 0h                             
  25e0  261C           addr M69_big_0c000::261c          
  25e2  25F0           addr M69_big_0c000::25f0          
  25e4  0001           dw 1h                             
  25e6  0001           dw 1h                             
  25e8  0000           dw 0h                             
LAB_M69_big_0c000__25ea:
  25ea  17002F         LBSR 0x261c                       
  25ed  3506           PULS  A B                         
  25ef  39             RTS                               

; ---- function FUN_M69_big_0c000__25f0
FUN_M69_big_0c000__25f0:
  25f0  3426           PSHS  Y B A                       
  25f2  FC6074         LDD 0x6074                        
  25f5  B37012         SUBD 0x7012                       
  25f8  FD7010         STD 0x7010                        
  25fb  CC7175         LDD #0x7175                       
  25fe  837126         SUBD #0x7126                      
  2601  1F02           TFR D,Y                           
  2603  FC7010         LDD 0x7010                        
  2606  AD9FFC82       JSR [0xfc82]                      
  260a  108E0001       LDY #0x1                          
  260e  FC7010         LDD 0x7010                        
  2611  AD9FFE40       JSR [0xfe40]                      
  2615  8D1A           BSR 0x2631                        
  2617  8D03           BSR 0x261c                        
  2619  3526           PULS  A B Y                       
  261b  39             RTS                               

; ---- function FUN_M69_big_0c000__261c
FUN_M69_big_0c000__261c:
  261c  3416           PSHS  X B A                       
  261e  C61E           LDB #0x1e                         
  2620  AD9FFC36       JSR [0xfc36]                      
  2624  CC0003         LDD #0x3                          
  2627  8E60A0         LDX #0x60a0                       
  262a  AD9FFC3A       JSR [0xfc3a]                      
  262e  3516           PULS  A B X                       
  2630  39             RTS                               

; ---- function FUN_M69_big_0c000__2631
FUN_M69_big_0c000__2631:
  2631  3476           PSHS  U Y X B A                   
  2633  CC0000         LDD #0x0                          
  2636  3606           PSHU  B A                         
  2638  CC0064         LDD #0x64                         
  263b  3606           PSHU  B A                         
  263d  FC7010         LDD 0x7010                        
  2640  F37012         ADDD 0x7012                       
  2643  3606           PSHU  B A                         
  2645  AD9FFCD8       JSR [0xfcd8]                      
  2649  3706           PULU  A B                         
  264b  FD7014         STD 0x7014                        
  264e  CC0064         LDD #0x64                         
  2651  B37014         SUBD 0x7014                       
  2654  3606           PSHU  B A                         
  2656  58             LSLB                              
  2657  49             ROLA                              
  2658  FD70FA         STD 0x70fa                        
  265b  CC4666         LDD #0x4666                       
  265e  3606           PSHU  B A                         
  2660  AD9FFCF2       JSR [0xfcf2]                      
  2664  3706           PULU  A B                         
  2666  F370FA         ADDD 0x70fa                       
  2669  AD9FFC72       JSR [0xfc72]                      
  266d  3576           PULS  A B X Y U                   
  266f  39             RTS                               
PTR_FUN_M69_big_0c000__287d_M69_big_0c000__2670:
  2670  287D           addr M69_big_0c000::287d          
  2672  2741           addr M69_big_0c000::2741          
  2674  70A4           addr 70a4                         
  2676  .db 00 33 C5 68 3A 98 00 06                          ; .3.h:...

; ---- function FUN_M69_big_0c000__267e
FUN_M69_big_0c000__267e:
  267e  3410           PSHS  X                           
  2680  8E2670         LDX #0x2670                        ; desc[API_FE1C]: ->$287D ->$2741 $70A4
  2683  AD9FFE1C       JSR [0xfe1c]                      
  2687  3510           PULS  X                           
  2689  39             RTS                               

; ---- function FUN_M69_big_0c000__268a
FUN_M69_big_0c000__268a:
  268a  3410           PSHS  X                           
  268c  8E2670         LDX #0x2670                        ; desc[API_FE1A]: ->$287D ->$2741 $70A4
  268f  AD9FFE1A       JSR [0xfe1a]                      
  2693  3510           PULS  X                           
  2695  39             RTS                               

; ---- function FUN_M69_big_0c000__2696
FUN_M69_big_0c000__2696:
  2696  3426           PSHS  Y B A                       
  2698  AD9FFC8E       JSR [0xfc8e]                      
  269c  FC60F9         LDD 0x60f9                        
  269f  FD6074         STD 0x6074                        
  26a2  B370A6         SUBD 0x70a6                       
  26a5  FD70A4         STD 0x70a4                        
  26a8  170096         LBSR 0x2741                       
  26ab  CC7157         LDD #0x7157                       
  26ae  837126         SUBD #0x7126                      
  26b1  1F02           TFR D,Y                           
  26b3  FC70A4         LDD 0x70a4                        
  26b6  AD9FFC82       JSR [0xfc82]                      
  26ba  3526           PULS  A B Y                       
  26bc  39             RTS                               

; ---- function FUN_M69_big_0c000__26bd
FUN_M69_big_0c000__26bd:
  26bd  3436           PSHS  Y X B A                     
  26bf  CC0000         LDD #0x0                          
  26c2  8E044C         LDX #0x44c                        
  26c5  108E0440       LDY #0x440                        
  26c9  1707AD         LBSR 0x2e79                       
  26cc  FC70A8         LDD 0x70a8                        
  26cf  FD6074         STD 0x6074                        
  26d2  17E097         LBSR 0x076c                       
  26d5  C613           LDB #0x13                         
  26d7  AD9FFC36       JSR [0xfc36]                      
  26db  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " loop delay:      mS "
  26df  0A6C6F6F7020.. char[22] "\nloop delay:      mS " 
LAB_M69_big_0c000__26f5:
  26f5  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0578 $0000 $0000 ->$287D ->$2717 $0001 $0001 $0000
  26f9  01             db 1h                             
  26fa  01             db 1h                             
  26fb  02             db 2h                             
  26fc  01             db 1h                             
  26fd  01             db 1h                             
  26fe  00             db 0h                             
  26ff  04             db 4h                             
  2700  80             db 80h                            
  2701  0578           dw 578h                           
  2703  0000           dw 0h                             
  2705  0000           dw 0h                             
  2707  287D           addr M69_big_0c000::287d          
  2709  2717           addr M69_big_0c000::2717          
  270b  0001           dw 1h                             
  270d  0001           dw 1h                             
  270f  0000           dw 0h                             
LAB_M69_big_0c000__2711:
  2711  170169         LBSR 0x287d                       
  2714  3536           PULS  A B X Y                     
  2716  39             RTS                               

; ---- function FUN_M69_big_0c000__2717
FUN_M69_big_0c000__2717:
  2717  3426           PSHS  Y B A                       
  2719  FC6074         LDD 0x6074                        
  271c  B370A6         SUBD 0x70a6                       
  271f  FD70A4         STD 0x70a4                        
  2722  CC7157         LDD #0x7157                       
  2725  837126         SUBD #0x7126                      
  2728  1F02           TFR D,Y                           
  272a  FC70A4         LDD 0x70a4                        
  272d  AD9FFC82       JSR [0xfc82]                      
  2731  108E0002       LDY #0x2                          
  2735  FC70A4         LDD 0x70a4                        
  2738  AD9FFE40       JSR [0xfe40]                      
  273c  8D03           BSR 0x2741                        
  273e  3526           PULS  A B Y                       
  2740  39             RTS                               

; ---- function FUN_M69_big_0c000__2741
FUN_M69_big_0c000__2741:
  2741  3476           PSHS  U Y X B A                   
  2743  CC7FFF         LDD #0x7fff                       
  2746  FD7112         STD 0x7112                        
  2749  CC0000         LDD #0x0                          
  274c  3606           PSHU  B A                         
  274e  CC0578         LDD #0x578                        
  2751  3606           PSHU  B A                         
  2753  FC70A4         LDD 0x70a4                        
  2756  F370A6         ADDD 0x70a6                       
  2759  3606           PSHU  B A                         
  275b  AD9FFCD8       JSR [0xfcd8]                      
  275f  3706           PULU  A B                         
  2761  FD70A8         STD 0x70a8                        
  2764  FC70A8         LDD 0x70a8                        
  2767  FD7074         STD 0x7074                        
  276a  17F362         LBSR 0x1acf                       
  276d  3576           PULS  A B X Y U                   
  276f  39             RTS                               
PTR_FUN_M69_big_0c000__287d_M69_big_0c000__2770:
  2770  287D           addr M69_big_0c000::287d          
  2772  2841           addr M69_big_0c000::2841          
  2774  70AC           addr 70ac                         
  2776  .db 00 33 E2 B4 1D 4C 00 05                          ; .3...L..

; ---- function FUN_M69_big_0c000__277e
FUN_M69_big_0c000__277e:
  277e  3410           PSHS  X                           
  2780  8E2770         LDX #0x2770                        ; desc[API_FE1C]: ->$287D ->$2841 $70AC
  2783  AD9FFE1C       JSR [0xfe1c]                      
  2787  3510           PULS  X                           
  2789  39             RTS                               

; ---- function FUN_M69_big_0c000__278a
FUN_M69_big_0c000__278a:
  278a  3410           PSHS  X                           
  278c  8E2770         LDX #0x2770                        ; desc[API_FE1A]: ->$287D ->$2841 $70AC
  278f  AD9FFE1A       JSR [0xfe1a]                      
  2793  3510           PULS  X                           
  2795  39             RTS                               

; ---- function FUN_M69_big_0c000__2796
FUN_M69_big_0c000__2796:
  2796  3426           PSHS  Y B A                       
  2798  AD9FFC8E       JSR [0xfc8e]                      
  279c  FC60F9         LDD 0x60f9                        
  279f  FD6074         STD 0x6074                        
  27a2  B370AE         SUBD 0x70ae                       
  27a5  FD70AC         STD 0x70ac                        
  27a8  170096         LBSR 0x2841                       
  27ab  CC7157         LDD #0x7157                       
  27ae  837126         SUBD #0x7126                      
  27b1  1F02           TFR D,Y                           
  27b3  FC70AC         LDD 0x70ac                        
  27b6  AD9FFC82       JSR [0xfc82]                      
  27ba  3526           PULS  A B Y                       
  27bc  39             RTS                               

; ---- function FUN_M69_big_0c000__27bd
FUN_M69_big_0c000__27bd:
  27bd  3436           PSHS  Y X B A                     
  27bf  CC0000         LDD #0x0                          
  27c2  8E044C         LDX #0x44c                        
  27c5  108E0440       LDY #0x440                        
  27c9  1706AD         LBSR 0x2e79                       
  27cc  FC70B0         LDD 0x70b0                        
  27cf  FD6074         STD 0x6074                        
  27d2  17DF97         LBSR 0x076c                       
  27d5  C613           LDB #0x13                         
  27d7  AD9FFC36       JSR [0xfc36]                      
  27db  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left delay:      mS "
  27df  0A6C65667420.. char[22] "\nleft delay:      mS " 
LAB_M69_big_0c000__27f5:
  27f5  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $02BC $0000 $0000 ->$287D ->$2817 $0001 $0001 $0000
  27f9  01             db 1h                             
  27fa  01             db 1h                             
  27fb  02             db 2h                             
  27fc  01             db 1h                             
  27fd  01             db 1h                             
  27fe  00             db 0h                             
  27ff  04             db 4h                             
  2800  80             db 80h                            
  2801  02BC           dw 2BCh                           
  2803  0000           dw 0h                             
  2805  0000           dw 0h                             
  2807  287D           addr M69_big_0c000::287d          
  2809  2817           addr M69_big_0c000::2817          
  280b  0001           dw 1h                             
  280d  0001           dw 1h                             
  280f  0000           dw 0h                             
LAB_M69_big_0c000__2811:
  2811  170069         LBSR 0x287d                       
  2814  3536           PULS  A B X Y                     
  2816  39             RTS                               

; ---- function FUN_M69_big_0c000__2817
FUN_M69_big_0c000__2817:
  2817  3426           PSHS  Y B A                       
  2819  FC6074         LDD 0x6074                        
  281c  B370AE         SUBD 0x70ae                       
  281f  FD70AC         STD 0x70ac                        
  2822  CC7157         LDD #0x7157                       
  2825  837126         SUBD #0x7126                      
  2828  1F02           TFR D,Y                           
  282a  FC70AC         LDD 0x70ac                        
  282d  AD9FFC82       JSR [0xfc82]                      
  2831  108E0002       LDY #0x2                          
  2835  FC70AC         LDD 0x70ac                        
  2838  AD9FFE40       JSR [0xfe40]                      
  283c  8D03           BSR 0x2841                        
  283e  3526           PULS  A B Y                       
  2840  39             RTS                               

; ---- function FUN_M69_big_0c000__2841
FUN_M69_big_0c000__2841:
  2841  3476           PSHS  U Y X B A                   
  2843  CC0000         LDD #0x0                          
  2846  8E044C         LDX #0x44c                        
  2849  108E0440       LDY #0x440                        
  284d  170629         LBSR 0x2e79                       
  2850  CC7FFF         LDD #0x7fff                       
  2853  FD7112         STD 0x7112                        
  2856  CC0000         LDD #0x0                          
  2859  3606           PSHU  B A                         
  285b  CC02BC         LDD #0x2bc                        
  285e  3606           PSHU  B A                         
  2860  FC70AC         LDD 0x70ac                        
  2863  F370AE         ADDD 0x70ae                       
  2866  3606           PSHU  B A                         
  2868  AD9FFCD8       JSR [0xfcd8]                      
  286c  3706           PULU  A B                         
  286e  FD70B0         STD 0x70b0                        
  2871  FC70B0         LDD 0x70b0                        
  2874  FD7074         STD 0x7074                        
  2877  17F255         LBSR 0x1acf                       
  287a  3576           PULS  A B X Y U                   
  287c  39             RTS                               

; ---- function FUN_M69_big_0c000__287d
FUN_M69_big_0c000__287d:
  287d  3456           PSHS  U X B A                     
  287f  C620           LDB #0x20                         
  2881  AD9FFC36       JSR [0xfc36]                      
  2885  CC0004         LDD #0x4                          
  2888  8E609F         LDX #0x609f                       
  288b  AD9FFC3A       JSR [0xfc3a]                      
  288f  3556           PULS  A B X U                     
  2891  39             RTS                               
PTR_FUN_M69_big_0c000__299f_M69_big_0c000__2892:
  2892  299F           addr M69_big_0c000::299f          
  2894  2963           addr M69_big_0c000::2963          
  2896  70B4           addr 70b4                         
  2898  .db 00 55 E2 B4 1D 4C 00 05                          ; .U...L..

; ---- function FUN_M69_big_0c000__28a0
FUN_M69_big_0c000__28a0:
  28a0  3410           PSHS  X                           
  28a2  8E2892         LDX #0x2892                        ; desc[API_FE1C]: ->$299F ->$2963 $70B4
  28a5  AD9FFE1C       JSR [0xfe1c]                      
  28a9  3510           PULS  X                           
  28ab  39             RTS                               

; ---- function FUN_M69_big_0c000__28ac
FUN_M69_big_0c000__28ac:
  28ac  3410           PSHS  X                           
  28ae  8E2892         LDX #0x2892                        ; desc[API_FE1A]: ->$299F ->$2963 $70B4
  28b1  AD9FFE1A       JSR [0xfe1a]                      
  28b5  3510           PULS  X                           
  28b7  39             RTS                               

; ---- function FUN_M69_big_0c000__28b8
FUN_M69_big_0c000__28b8:
  28b8  3426           PSHS  Y B A                       
  28ba  AD9FFC8E       JSR [0xfc8e]                      
  28be  FC60F9         LDD 0x60f9                        
  28c1  FD6074         STD 0x6074                        
  28c4  B370B6         SUBD 0x70b6                       
  28c7  FD70B4         STD 0x70b4                        
  28ca  170096         LBSR 0x2963                       
  28cd  CC7179         LDD #0x7179                       
  28d0  837126         SUBD #0x7126                      
  28d3  1F02           TFR D,Y                           
  28d5  FC70B4         LDD 0x70b4                        
  28d8  AD9FFC82       JSR [0xfc82]                      
  28dc  3526           PULS  A B Y                       
  28de  39             RTS                               

; ---- function FUN_M69_big_0c000__28df
FUN_M69_big_0c000__28df:
  28df  3436           PSHS  Y X B A                     
  28e1  CC0003         LDD #0x3                          
  28e4  8E044F         LDX #0x44f                        
  28e7  108E0443       LDY #0x443                        
  28eb  17058B         LBSR 0x2e79                       
  28ee  FC70B8         LDD 0x70b8                        
  28f1  FD6074         STD 0x6074                        
  28f4  17DE75         LBSR 0x076c                       
  28f7  C613           LDB #0x13                         
  28f9  AD9FFC36       JSR [0xfc36]                      
  28fd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right delay:      mS"
  2901  0A7269676874.. char[22] "\nright delay:      mS" 
LAB_M69_big_0c000__2917:
  2917  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $02BC $0000 $0000 ->$299F ->$2939 $0001 $0001 $0000
  291b  01             db 1h                             
  291c  01             db 1h                             
  291d  02             db 2h                             
  291e  01             db 1h                             
  291f  01             db 1h                             
  2920  00             db 0h                             
  2921  04             db 4h                             
  2922  80             db 80h                            
  2923  02BC           dw 2BCh                           
  2925  0000           dw 0h                             
  2927  0000           dw 0h                             
  2929  299F           addr M69_big_0c000::299f          
  292b  2939           addr M69_big_0c000::2939          
  292d  0001           dw 1h                             
  292f  0001           dw 1h                             
  2931  0000           dw 0h                             
LAB_M69_big_0c000__2933:
  2933  170069         LBSR 0x299f                       
  2936  3536           PULS  A B X Y                     
  2938  39             RTS                               

; ---- function FUN_M69_big_0c000__2939
FUN_M69_big_0c000__2939:
  2939  3426           PSHS  Y B A                       
  293b  FC6074         LDD 0x6074                        
  293e  B370B6         SUBD 0x70b6                       
  2941  FD70B4         STD 0x70b4                        
  2944  CC7179         LDD #0x7179                       
  2947  837126         SUBD #0x7126                      
  294a  1F02           TFR D,Y                           
  294c  FC70B4         LDD 0x70b4                        
  294f  AD9FFC82       JSR [0xfc82]                      
  2953  108E0008       LDY #0x8                          
  2957  FC70B4         LDD 0x70b4                        
  295a  AD9FFE40       JSR [0xfe40]                      
  295e  8D03           BSR 0x2963                        
  2960  3526           PULS  A B Y                       
  2962  39             RTS                               

; ---- function FUN_M69_big_0c000__2963
FUN_M69_big_0c000__2963:
  2963  3476           PSHS  U Y X B A                   
  2965  CC0003         LDD #0x3                          
  2968  8E044F         LDX #0x44f                        
  296b  108E0443       LDY #0x443                        
  296f  170507         LBSR 0x2e79                       
  2972  CC7FFF         LDD #0x7fff                       
  2975  FD7112         STD 0x7112                        
  2978  CC0000         LDD #0x0                          
  297b  3606           PSHU  B A                         
  297d  CC02BC         LDD #0x2bc                        
  2980  3606           PSHU  B A                         
  2982  FC70B4         LDD 0x70b4                        
  2985  F370B6         ADDD 0x70b6                       
  2988  3606           PSHU  B A                         
  298a  AD9FFCD8       JSR [0xfcd8]                      
  298e  3706           PULU  A B                         
  2990  FD70B8         STD 0x70b8                        
  2993  FC70B8         LDD 0x70b8                        
  2996  FD707A         STD 0x707a                        
  2999  17F133         LBSR 0x1acf                       
  299c  3576           PULS  A B X Y U                   
  299e  39             RTS                               

; ---- function FUN_M69_big_0c000__299f
FUN_M69_big_0c000__299f:
  299f  3456           PSHS  U X B A                     
  29a1  C621           LDB #0x21                         
  29a3  AD9FFC36       JSR [0xfc36]                      
  29a7  CC0004         LDD #0x4                          
  29aa  8E609F         LDX #0x609f                       
  29ad  AD9FFC3A       JSR [0xfc3a]                      
  29b1  3556           PULS  A B X U                     
  29b3  39             RTS                               

; ---- function FUN_M69_big_0c000__29b4
FUN_M69_big_0c000__29b4:
  29b4  3426           PSHS  Y B A                       
  29b6  AD9FFC8E       JSR [0xfc8e]                      
  29ba  FC60F9         LDD 0x60f9                        
  29bd  FD6074         STD 0x6074                        
  29c0  B370BE         SUBD 0x70be                       
  29c3  FD70BC         STD 0x70bc                        
  29c6  170141         LBSR 0x2b0a                       
  29c9  CC715B         LDD #0x715b                       
  29cc  837126         SUBD #0x7126                      
  29cf  1F02           TFR D,Y                           
  29d1  FC70BC         LDD 0x70bc                        
  29d4  AD9FFC82       JSR [0xfc82]                      
  29d8  3526           PULS  A B Y                       
  29da  39             RTS                               

; ---- function FUN_M69_big_0c000__29db
FUN_M69_big_0c000__29db:
  29db  3416           PSHS  X B A                       
  29dd  CC0000         LDD #0x0                          
  29e0  8E0146         LDX #0x146                        
  29e3  FD70F8         STD 0x70f8                        
  29e6  BF70F2         STX 0x70f2                        
  29e9  FC70F8         LDD 0x70f8                        
  29ec  58             LSLB                              
  29ed  C37098         ADDD #0x7098                      
  29f0  FD70D6         STD 0x70d6                        
  29f3  FC70C0         LDD 0x70c0                        
  29f6  FD6074         STD 0x6074                        
  29f9  17DD70         LBSR 0x076c                       
  29fc  C613           LDB #0x13                         
  29fe  AD9FFC36       JSR [0xfc36]                      
  2a02  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " loop feedback:     %"
  2a06  0A6C6F6F7020.. char[22] "\nloop feedback:     %" 
LAB_M69_big_0c000__2a1c:
  2a1c  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$2B49 ->$2ADF $0001 $0001 $0000
  2a20  01             db 1h                             
  2a21  01             db 1h                             
  2a22  02             db 2h                             
  2a23  01             db 1h                             
  2a24  01             db 1h                             
  2a25  00             db 0h                             
  2a26  04             db 4h                             
  2a27  80             db 80h                            
  2a28  0063           dw 63h                            
  2a2a  FF9C           dw FF9Ch                          
  2a2c  0000           dw 0h                             
  2a2e  2B49           addr M69_big_0c000::2b49          
  2a30  2ADF           addr M69_big_0c000::2adf          
  2a32  0001           dw 1h                             
  2a34  0001           dw 1h                             
  2a36  0000           dw 0h                             
LAB_M69_big_0c000__2a38:
  2a38  17010E         LBSR 0x2b49                       
  2a3b  3516           PULS  A B X                       
  2a3d  39             RTS                               
PTR_FUN_M69_big_0c000__2b49_M69_big_0c000__2a3e:
  2a3e  2B49           addr M69_big_0c000::2b49          
  2a40  2B0A           addr M69_big_0c000::2b0a          
  2a42  70BC           addr 70bc                         
  2a44  .db 00 37 F8 00 08 00 00 05                          ; .7......

; ---- function FUN_M69_big_0c000__2a4c
FUN_M69_big_0c000__2a4c:
  2a4c  3410           PSHS  X                           
  2a4e  8E2A3E         LDX #0x2a3e                        ; desc[API_FE1C]: ->$2B49 ->$2B0A $70BC
  2a51  AD9FFE1C       JSR [0xfe1c]                      
  2a55  3510           PULS  X                           
  2a57  39             RTS                               

; ---- function FUN_M69_big_0c000__2a58
FUN_M69_big_0c000__2a58:
  2a58  3410           PSHS  X                           
  2a5a  8E2A3E         LDX #0x2a3e                        ; desc[API_FE1A]: ->$2B49 ->$2B0A $70BC
  2a5d  AD9FFE1A       JSR [0xfe1a]                      
  2a61  3510           PULS  X                           
  2a63  39             RTS                               

; ---- function FUN_M69_big_0c000__2a64
FUN_M69_big_0c000__2a64:
  2a64  3426           PSHS  Y B A                       
  2a66  AD9FFC8E       JSR [0xfc8e]                      
  2a6a  FC60F9         LDD 0x60f9                        
  2a6d  FD6074         STD 0x6074                        
  2a70  B370BE         SUBD 0x70be                       
  2a73  FD70BC         STD 0x70bc                        
  2a76  170091         LBSR 0x2b0a                       
  2a79  3526           PULS  A B Y                       
  2a7b  39             RTS                               

; ---- function FUN_M69_big_0c000__2a7c
FUN_M69_big_0c000__2a7c:
  2a7c  3416           PSHS  X B A                       
  2a7e  CC0000         LDD #0x0                          
  2a81  8E0146         LDX #0x146                        
  2a84  FD70F8         STD 0x70f8                        
  2a87  BF70F2         STX 0x70f2                        
  2a8a  FC70F8         LDD 0x70f8                        
  2a8d  58             LSLB                              
  2a8e  C37098         ADDD #0x7098                      
  2a91  FD70D6         STD 0x70d6                        
  2a94  FC70C0         LDD 0x70c0                        
  2a97  FD6074         STD 0x6074                        
  2a9a  17DCCF         LBSR 0x076c                       
  2a9d  C613           LDB #0x13                         
  2a9f  AD9FFC36       JSR [0xfc36]                      
  2aa3  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " left feedback:     %"
  2aa7  0A6C65667420.. char[22] "\nleft feedback:     %" 
LAB_M69_big_0c000__2abd:
  2abd  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$2B49 ->$2ADF $0001 $0001 $0000
  2ac1  01             db 1h                             
  2ac2  01             db 1h                             
  2ac3  02             db 2h                             
  2ac4  01             db 1h                             
  2ac5  01             db 1h                             
  2ac6  00             db 0h                             
  2ac7  04             db 4h                             
  2ac8  80             db 80h                            
  2ac9  0063           dw 63h                            
  2acb  FF9C           dw FF9Ch                          
  2acd  0000           dw 0h                             
  2acf  2B49           addr M69_big_0c000::2b49          
  2ad1  2ADF           addr M69_big_0c000::2adf          
  2ad3  0001           dw 1h                             
  2ad5  0001           dw 1h                             
  2ad7  0000           dw 0h                             
LAB_M69_big_0c000__2ad9:
  2ad9  17006D         LBSR 0x2b49                       
  2adc  3516           PULS  A B X                       
  2ade  39             RTS                               

; ---- function FUN_M69_big_0c000__2adf
FUN_M69_big_0c000__2adf:
  2adf  3426           PSHS  Y B A                       
  2ae1  FC6074         LDD 0x6074                        
  2ae4  B370BE         SUBD 0x70be                       
  2ae7  FD70BC         STD 0x70bc                        
  2aea  CC715B         LDD #0x715b                       
  2aed  837126         SUBD #0x7126                      
  2af0  1F02           TFR D,Y                           
  2af2  FC70BC         LDD 0x70bc                        
  2af5  AD9FFC82       JSR [0xfc82]                      
  2af9  108E0003       LDY #0x3                          
  2afd  FC70BC         LDD 0x70bc                        
  2b00  AD9FFE40       JSR [0xfe40]                      
  2b04  170003         LBSR 0x2b0a                       
  2b07  3526           PULS  A B Y                       
  2b09  39             RTS                               

; ---- function FUN_M69_big_0c000__2b0a
FUN_M69_big_0c000__2b0a:
  2b0a  3476           PSHS  U Y X B A                   
  2b0c  CC0000         LDD #0x0                          
  2b0f  8E0146         LDX #0x146                        
  2b12  FD70F8         STD 0x70f8                        
  2b15  BF70F2         STX 0x70f2                        
  2b18  FC70F8         LDD 0x70f8                        
  2b1b  58             LSLB                              
  2b1c  C37098         ADDD #0x7098                      
  2b1f  FD70D6         STD 0x70d6                        
  2b22  CCFF9C         LDD #0xff9c                       
  2b25  3606           PSHU  B A                         
  2b27  CC0063         LDD #0x63                         
  2b2a  3606           PSHU  B A                         
  2b2c  FC70BC         LDD 0x70bc                        
  2b2f  F370BE         ADDD 0x70be                       
  2b32  3606           PSHU  B A                         
  2b34  AD9FFCD8       JSR [0xfcd8]                      
  2b38  3706           PULU  A B                         
  2b3a  FD70C0         STD 0x70c0                        
  2b3d  FC70C0         LDD 0x70c0                        
  2b40  FD7098         STD 0x7098                        
  2b43  17F789         LBSR 0x22cf                       
  2b46  3576           PULS  A B X Y U                   
  2b48  39             RTS                               

; ---- function FUN_M69_big_0c000__2b49
FUN_M69_big_0c000__2b49:
  2b49  3456           PSHS  U X B A                     
  2b4b  C622           LDB #0x22                         
  2b4d  AD9FFC36       JSR [0xfc36]                      
  2b51  CC0004         LDD #0x4                          
  2b54  8E609F         LDX #0x609f                       
  2b57  AD9FFC3A       JSR [0xfc3a]                      
  2b5b  3556           PULS  A B X U                     
  2b5d  39             RTS                               
PTR_FUN_M69_big_0c000__2c78_M69_big_0c000__2b5e:
  2b5e  2C78           addr M69_big_0c000::2c78          
  2b60  2C39           addr M69_big_0c000::2c39          
  2b62  70C4           addr 70c4                         
  2b64  .db 00 59 F8 00 08 00 00 05                          ; .Y......

; ---- function FUN_M69_big_0c000__2b6c
FUN_M69_big_0c000__2b6c:
  2b6c  3410           PSHS  X                           
  2b6e  8E2B5E         LDX #0x2b5e                        ; desc[API_FE1C]: ->$2C78 ->$2C39 $70C4
  2b71  AD9FFE1C       JSR [0xfe1c]                      
  2b75  3510           PULS  X                           
  2b77  39             RTS                               

; ---- function FUN_M69_big_0c000__2b78
FUN_M69_big_0c000__2b78:
  2b78  3410           PSHS  X                           
  2b7a  8E2B5E         LDX #0x2b5e                        ; desc[API_FE1A]: ->$2C78 ->$2C39 $70C4
  2b7d  AD9FFE1A       JSR [0xfe1a]                      
  2b81  3510           PULS  X                           
  2b83  39             RTS                               

; ---- function FUN_M69_big_0c000__2b84
FUN_M69_big_0c000__2b84:
  2b84  3426           PSHS  Y B A                       
  2b86  AD9FFC8E       JSR [0xfc8e]                      
  2b8a  FC60F9         LDD 0x60f9                        
  2b8d  FD6074         STD 0x6074                        
  2b90  B370C6         SUBD 0x70c6                       
  2b93  FD70C4         STD 0x70c4                        
  2b96  1700A0         LBSR 0x2c39                       
  2b99  CC717D         LDD #0x717d                       
  2b9c  837126         SUBD #0x7126                      
  2b9f  1F02           TFR D,Y                           
  2ba1  FC70C4         LDD 0x70c4                        
  2ba4  AD9FFC82       JSR [0xfc82]                      
  2ba8  3526           PULS  A B Y                       
  2baa  39             RTS                               

; ---- function FUN_M69_big_0c000__2bab
FUN_M69_big_0c000__2bab:
  2bab  3416           PSHS  X B A                       
  2bad  CC0003         LDD #0x3                          
  2bb0  8E0246         LDX #0x246                        
  2bb3  FD70F8         STD 0x70f8                        
  2bb6  BF70F2         STX 0x70f2                        
  2bb9  FC70F8         LDD 0x70f8                        
  2bbc  58             LSLB                              
  2bbd  C37098         ADDD #0x7098                      
  2bc0  FD70D6         STD 0x70d6                        
  2bc3  FC70C8         LDD 0x70c8                        
  2bc6  FD6074         STD 0x6074                        
  2bc9  17DBA0         LBSR 0x076c                       
  2bcc  C613           LDB #0x13                         
  2bce  AD9FFC36       JSR [0xfc36]                      
  2bd2  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: " right fdback:     % "
  2bd6  0A7269676874.. char[22] "\nright fdback:     % " 
LAB_M69_big_0c000__2bec:
  2bec  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 01 01 00 04 80 $0063 $FF9C $0000 ->$2C78 ->$2C0E $0001 $0001 $0000
  2bf0  01             db 1h                             
  2bf1  01             db 1h                             
  2bf2  02             db 2h                             
  2bf3  01             db 1h                             
  2bf4  01             db 1h                             
  2bf5  00             db 0h                             
  2bf6  04             db 4h                             
  2bf7  80             db 80h                            
  2bf8  0063           dw 63h                            
  2bfa  FF9C           dw FF9Ch                          
  2bfc  0000           dw 0h                             
  2bfe  2C78           addr M69_big_0c000::2c78          
  2c00  2C0E           addr M69_big_0c000::2c0e          
  2c02  0001           dw 1h                             
  2c04  0001           dw 1h                             
  2c06  0000           dw 0h                             
LAB_M69_big_0c000__2c08:
  2c08  17006D         LBSR 0x2c78                       
  2c0b  3516           PULS  A B X                       
  2c0d  39             RTS                               

; ---- function FUN_M69_big_0c000__2c0e
FUN_M69_big_0c000__2c0e:
  2c0e  3426           PSHS  Y B A                       
  2c10  FC6074         LDD 0x6074                        
  2c13  B370C6         SUBD 0x70c6                       
  2c16  FD70C4         STD 0x70c4                        
  2c19  CC717D         LDD #0x717d                       
  2c1c  837126         SUBD #0x7126                      
  2c1f  1F02           TFR D,Y                           
  2c21  FC70C4         LDD 0x70c4                        
  2c24  AD9FFC82       JSR [0xfc82]                      
  2c28  108E0009       LDY #0x9                          
  2c2c  FC70C4         LDD 0x70c4                        
  2c2f  AD9FFE40       JSR [0xfe40]                      
  2c33  170003         LBSR 0x2c39                       
  2c36  3526           PULS  A B Y                       
  2c38  39             RTS                               

; ---- function FUN_M69_big_0c000__2c39
FUN_M69_big_0c000__2c39:
  2c39  3476           PSHS  U Y X B A                   
  2c3b  CC0003         LDD #0x3                          
  2c3e  8E0246         LDX #0x246                        
  2c41  FD70F8         STD 0x70f8                        
  2c44  BF70F2         STX 0x70f2                        
  2c47  FC70F8         LDD 0x70f8                        
  2c4a  58             LSLB                              
  2c4b  C37098         ADDD #0x7098                      
  2c4e  FD70D6         STD 0x70d6                        
  2c51  CCFF9C         LDD #0xff9c                       
  2c54  3606           PSHU  B A                         
  2c56  CC0063         LDD #0x63                         
  2c59  3606           PSHU  B A                         
  2c5b  FC70C4         LDD 0x70c4                        
  2c5e  F370C6         ADDD 0x70c6                       
  2c61  3606           PSHU  B A                         
  2c63  AD9FFCD8       JSR [0xfcd8]                      
  2c67  3706           PULU  A B                         
  2c69  FD70C8         STD 0x70c8                        
  2c6c  FC70C8         LDD 0x70c8                        
  2c6f  FD709E         STD 0x709e                        
  2c72  17F65A         LBSR 0x22cf                       
  2c75  3576           PULS  A B X Y U                   
  2c77  39             RTS                               

; ---- function FUN_M69_big_0c000__2c78
FUN_M69_big_0c000__2c78:
  2c78  3456           PSHS  U X B A                     
  2c7a  C621           LDB #0x21                         
  2c7c  AD9FFC36       JSR [0xfc36]                      
  2c80  CC0004         LDD #0x4                          
  2c83  8E609F         LDX #0x609f                       
  2c86  AD9FFC3A       JSR [0xfc3a]                      
  2c8a  3556           PULS  A B X U                     
  2c8c  39             RTS                               

; ---- function FUN_M69_big_0c000__2c8d
FUN_M69_big_0c000__2c8d:
  2c8d  3406           PSHS  B A                         
  2c8f  FC7074         LDD 0x7074                        
  2c92  FD711E         STD 0x711e                        
  2c95  10B37076       CMPD 0x7076                       
  2c99  2E06           BGT 0x2ca1                        
  2c9b  FC7076         LDD 0x7076                        
  2c9e  FD711E         STD 0x711e                        
LAB_M69_big_0c000__2ca1:
  2ca1  10B37078       CMPD 0x7078                       
  2ca5  2E06           BGT 0x2cad                        
  2ca7  FC7078         LDD 0x7078                        
  2caa  FD711E         STD 0x711e                        
LAB_M69_big_0c000__2cad:
  2cad  10B3707A       CMPD 0x707a                       
  2cb1  2E06           BGT 0x2cb9                        
  2cb3  FC707A         LDD 0x707a                        
  2cb6  FD711E         STD 0x711e                        
LAB_M69_big_0c000__2cb9:
  2cb9  10B3707C       CMPD 0x707c                       
  2cbd  2E06           BGT 0x2cc5                        
  2cbf  FC707C         LDD 0x707c                        
  2cc2  FD711E         STD 0x711e                        
LAB_M69_big_0c000__2cc5:
  2cc5  10B3707E       CMPD 0x707e                       
  2cc9  2E06           BGT 0x2cd1                        
  2ccb  FC707E         LDD 0x707e                        
  2cce  FD711E         STD 0x711e                        
LAB_M69_big_0c000__2cd1:
  2cd1  3506           PULS  A B                         
  2cd3  39             RTS                               

; ---- function FUN_M69_big_0c000__2cd4
FUN_M69_big_0c000__2cd4:
  2cd4  170283         LBSR 0x2f5a                       
  2cd7  1702EE         LBSR 0x2fc8                       
  2cda  17FFB0         LBSR 0x2c8d                       
  2cdd  17E647         LBSR 0x1327                       
  2ce0  39             RTS                               

; ---- function FUN_M69_big_0c000__2ce1
FUN_M69_big_0c000__2ce1:
  2ce1  3426           PSHS  Y B A                       
  2ce3  CC0000         LDD #0x0                          
  2ce6  FD70FA         STD 0x70fa                        
  2ce9  CC000A         LDD #0xa                          
  2cec  AD9FFD20       JSR [0xfd20]                      
  2cf0  108E0446       LDY #0x446                        
  2cf4  FC70FA         LDD 0x70fa                        
  2cf7  AD9FFD2E       JSR [0xfd2e]                      
  2cfb  CCFFFE         LDD #0xfffe                       
  2cfe  FD70FA         STD 0x70fa                        
  2d01  CC000A         LDD #0xa                          
  2d04  AD9FFD20       JSR [0xfd20]                      
  2d08  108E0447       LDY #0x447                        
  2d0c  FC70FA         LDD 0x70fa                        
  2d0f  AD9FFD2E       JSR [0xfd2e]                      
  2d13  CC000A         LDD #0xa                          
  2d16  AD9FFD20       JSR [0xfd20]                      
  2d1a  108E0448       LDY #0x448                        
  2d1e  FC70FA         LDD 0x70fa                        
  2d21  AD9FFD2E       JSR [0xfd2e]                      
  2d25  CC000A         LDD #0xa                          
  2d28  AD9FFD20       JSR [0xfd20]                      
  2d2c  108E0449       LDY #0x449                        
  2d30  FC70FA         LDD 0x70fa                        
  2d33  AD9FFD2E       JSR [0xfd2e]                      
  2d37  CC000A         LDD #0xa                          
  2d3a  AD9FFD20       JSR [0xfd20]                      
  2d3e  108E044A       LDY #0x44a                        
  2d42  FC70FA         LDD 0x70fa                        
  2d45  AD9FFD2E       JSR [0xfd2e]                      
  2d49  CC000A         LDD #0xa                          
  2d4c  AD9FFD20       JSR [0xfd20]                      
  2d50  108E044B       LDY #0x44b                        
  2d54  FC70FA         LDD 0x70fa                        
  2d57  AD9FFD2E       JSR [0xfd2e]                      
  2d5b  3526           PULS  A B Y                       
  2d5d  39             RTS                               

; ---- function FUN_M69_big_0c000__2d5e
FUN_M69_big_0c000__2d5e:
  2d5e  3426           PSHS  Y B A                       
  2d60  CC0000         LDD #0x0                          
  2d63  FD70FA         STD 0x70fa                        
  2d66  CC000A         LDD #0xa                          
  2d69  AD9FFD20       JSR [0xfd20]                      
  2d6d  108E0446       LDY #0x446                        
  2d71  FC70FA         LDD 0x70fa                        
  2d74  AD9FFD2E       JSR [0xfd2e]                      
  2d78  CC7FFF         LDD #0x7fff                       
  2d7b  FD70FA         STD 0x70fa                        
  2d7e  CC000A         LDD #0xa                          
  2d81  AD9FFD20       JSR [0xfd20]                      
  2d85  108E0447       LDY #0x447                        
  2d89  FC70FA         LDD 0x70fa                        
  2d8c  AD9FFD2E       JSR [0xfd2e]                      
  2d90  CC000A         LDD #0xa                          
  2d93  AD9FFD20       JSR [0xfd20]                      
  2d97  108E0448       LDY #0x448                        
  2d9b  FC70FA         LDD 0x70fa                        
  2d9e  AD9FFD2E       JSR [0xfd2e]                      
  2da2  CC8000         LDD #0x8000                       
  2da5  FD70FA         STD 0x70fa                        
  2da8  CC000A         LDD #0xa                          
  2dab  AD9FFD20       JSR [0xfd20]                      
  2daf  108E0449       LDY #0x449                        
  2db3  FC70FA         LDD 0x70fa                        
  2db6  AD9FFD2E       JSR [0xfd2e]                      
  2dba  CCFFFE         LDD #0xfffe                       
  2dbd  FD70FA         STD 0x70fa                        
  2dc0  CC000A         LDD #0xa                          
  2dc3  AD9FFD20       JSR [0xfd20]                      
  2dc7  108E044A       LDY #0x44a                        
  2dcb  FC70FA         LDD 0x70fa                        
  2dce  AD9FFD2E       JSR [0xfd2e]                      
  2dd2  CC000A         LDD #0xa                          
  2dd5  AD9FFD20       JSR [0xfd20]                      
  2dd9  108E044B       LDY #0x44b                        
  2ddd  FC70FA         LDD 0x70fa                        
  2de0  AD9FFD2E       JSR [0xfd2e]                      
  2de4  3526           PULS  A B Y                       
  2de6  39             RTS                               

; ---- function FUN_M69_big_0c000__2de7
FUN_M69_big_0c000__2de7:
  2de7  CC313C         LDD #0x313c                       
  2dea  F3600D         ADDD 0x600d                       
  2ded  1F01           TFR D,X                           
  2def  EC81           LDD ,X++                          
  2df1  FD70FA         STD 0x70fa                        
  2df4  CC000A         LDD #0xa                          
  2df7  AD9FFD20       JSR [0xfd20]                      
  2dfb  108E0446       LDY #0x446                        
  2dff  FC70FA         LDD 0x70fa                        
  2e02  AD9FFD2E       JSR [0xfd2e]                      
  2e06  EC81           LDD ,X++                          
  2e08  FD70FA         STD 0x70fa                        
  2e0b  CC000A         LDD #0xa                          
  2e0e  AD9FFD20       JSR [0xfd20]                      
  2e12  108E0447       LDY #0x447                        
  2e16  FC70FA         LDD 0x70fa                        
  2e19  AD9FFD2E       JSR [0xfd2e]                      
  2e1d  EC81           LDD ,X++                          
  2e1f  FD70FA         STD 0x70fa                        
  2e22  CC000A         LDD #0xa                          
  2e25  AD9FFD20       JSR [0xfd20]                      
  2e29  108E0448       LDY #0x448                        
  2e2d  FC70FA         LDD 0x70fa                        
  2e30  AD9FFD2E       JSR [0xfd2e]                      
  2e34  EC81           LDD ,X++                          
  2e36  FD70FA         STD 0x70fa                        
  2e39  CC000A         LDD #0xa                          
  2e3c  AD9FFD20       JSR [0xfd20]                      
  2e40  108E0449       LDY #0x449                        
  2e44  FC70FA         LDD 0x70fa                        
  2e47  AD9FFD2E       JSR [0xfd2e]                      
  2e4b  EC81           LDD ,X++                          
  2e4d  FD70FA         STD 0x70fa                        
  2e50  CC000A         LDD #0xa                          
  2e53  AD9FFD20       JSR [0xfd20]                      
  2e57  108E044A       LDY #0x44a                        
  2e5b  FC70FA         LDD 0x70fa                        
  2e5e  AD9FFD2E       JSR [0xfd2e]                      
  2e62  EC81           LDD ,X++                          
  2e64  FD70FA         STD 0x70fa                        
  2e67  CC000A         LDD #0xa                          
  2e6a  AD9FFD20       JSR [0xfd20]                      
  2e6e  108E044B       LDY #0x44b                        
  2e72  FC70FA         LDD 0x70fa                        
  2e75  AD9FFD2E       JSR [0xfd2e]                      

; ---- function FUN_M69_big_0c000__2e79
FUN_M69_big_0c000__2e79:
  2e79  3406           PSHS  B A                         
  2e7b  FD70F8         STD 0x70f8                        
  2e7e  BF70E8         STX 0x70e8                        
  2e81  10BF70EA       STY 0x70ea                        
  2e85  10BF70F4       STY 0x70f4                        
  2e89  FC70F4         LDD 0x70f4                        
  2e8c  C30012         ADDD #0x12                        
  2e8f  FD70F6         STD 0x70f6                        
  2e92  FD70EC         STD 0x70ec                        
  2e95  FC70F8         LDD 0x70f8                        
  2e98  58             LSLB                              
  2e99  C37074         ADDD #0x7074                      
  2e9c  FD70CC         STD 0x70cc                        
  2e9f  FC70F8         LDD 0x70f8                        
  2ea2  C3717D         ADDD #0x717d                      
  2ea5  837126         SUBD #0x7126                      
  2ea8  FD70D8         STD 0x70d8                        
  2eab  FC70F8         LDD 0x70f8                        
  2eae  58             LSLB                              
  2eaf  C33122         ADDD #0x3122                      
  2eb2  F3600D         ADDD 0x600d                       
  2eb5  FD70E4         STD 0x70e4                        
  2eb8  3506           PULS  A B                         
  2eba  39             RTS                               

; ---- function FUN_M69_big_0c000__2ebb
FUN_M69_big_0c000__2ebb:
  2ebb  3436           PSHS  Y X B A                     
  2ebd  FC7058         LDD 0x7058                        
  2ec0  3606           PSHU  B A                         
  2ec2  200D           BRA 0x2ed1                        

; ---- function FUN_M69_big_0c000__2ec4
FUN_M69_big_0c000__2ec4:
  2ec4  3436           PSHS  Y X B A                     
  2ec6  FC7058         LDD 0x7058                        
  2ec9  3606           PSHU  B A                         
  2ecb  CCFFFF         LDD #0xffff                       
  2ece  FD7058         STD 0x7058                        
LAB_M69_big_0c000__2ed1:
  2ed1  CC0000         LDD #0x0                          
  2ed4  8E044C         LDX #0x44c                        
  2ed7  108E0440       LDY #0x440                        
  2edb  17FF9B         LBSR 0x2e79                       
  2ede  17EBEE         LBSR 0x1acf                       
  2ee1  CC0001         LDD #0x1                          
  2ee4  8E044D         LDX #0x44d                        
  2ee7  108E0441       LDY #0x441                        
  2eeb  17FF8B         LBSR 0x2e79                       
  2eee  17EBDE         LBSR 0x1acf                       
  2ef1  CC0002         LDD #0x2                          
  2ef4  8E044E         LDX #0x44e                        
  2ef7  108E0442       LDY #0x442                        
  2efb  17FF7B         LBSR 0x2e79                       
  2efe  17EBCE         LBSR 0x1acf                       
  2f01  CC0003         LDD #0x3                          
  2f04  8E044F         LDX #0x44f                        
  2f07  108E0443       LDY #0x443                        
  2f0b  17FF6B         LBSR 0x2e79                       
  2f0e  17EBBE         LBSR 0x1acf                       
  2f11  CC0004         LDD #0x4                          
  2f14  8E0450         LDX #0x450                        
  2f17  108E0444       LDY #0x444                        
  2f1b  17FF5B         LBSR 0x2e79                       
  2f1e  17EBAE         LBSR 0x1acf                       
  2f21  CC0005         LDD #0x5                          
  2f24  8E0451         LDX #0x451                        
  2f27  108E0445       LDY #0x445                        
  2f2b  17FF4B         LBSR 0x2e79                       
  2f2e  17EB9E         LBSR 0x1acf                       
  2f31  3706           PULU  A B                         
  2f33  FD7058         STD 0x7058                        
  2f36  3536           PULS  A B X Y                     
  2f38  39             RTS                               

; ---- function FUN_M69_big_0c000__2f39
FUN_M69_big_0c000__2f39:
  2f39  3406           PSHS  B A                         
  2f3b  FD70F8         STD 0x70f8                        
  2f3e  BF70EA         STX 0x70ea                        
  2f41  FC70F8         LDD 0x70f8                        
  2f44  58             LSLB                              
  2f45  C37068         ADDD #0x7068                      
  2f48  FD70CE         STD 0x70ce                        
  2f4b  FC70F8         LDD 0x70f8                        
  2f4e  C37189         ADDD #0x7189                      
  2f51  837126         SUBD #0x7126                      
  2f54  FD70DA         STD 0x70da                        
  2f57  3506           PULS  A B                         
  2f59  39             RTS                               

; ---- function FUN_M69_big_0c000__2f5a
FUN_M69_big_0c000__2f5a:
  2f5a  3416           PSHS  X B A                       
  2f5c  CC0000         LDD #0x0                          
  2f5f  8E0440         LDX #0x440                        
  2f62  17FFD4         LBSR 0x2f39                       
  2f65  17ED75         LBSR 0x1cdd                       
  2f68  CC0001         LDD #0x1                          
  2f6b  8E0441         LDX #0x441                        
  2f6e  17FFC8         LBSR 0x2f39                       
  2f71  17ED69         LBSR 0x1cdd                       
  2f74  CC0002         LDD #0x2                          
  2f77  8E0442         LDX #0x442                        
  2f7a  17FFBC         LBSR 0x2f39                       
  2f7d  17ED5D         LBSR 0x1cdd                       
  2f80  CC0003         LDD #0x3                          
  2f83  8E0443         LDX #0x443                        
  2f86  17FFB0         LBSR 0x2f39                       
  2f89  17ED51         LBSR 0x1cdd                       
  2f8c  CC0004         LDD #0x4                          
  2f8f  8E0444         LDX #0x444                        
  2f92  17FFA4         LBSR 0x2f39                       
  2f95  17ED45         LBSR 0x1cdd                       
  2f98  CC0005         LDD #0x5                          
  2f9b  8E0445         LDX #0x445                        
  2f9e  17FF98         LBSR 0x2f39                       
  2fa1  17ED39         LBSR 0x1cdd                       
  2fa4  3516           PULS  A B X                       
  2fa6  39             RTS                               

; ---- function FUN_M69_big_0c000__2fa7
FUN_M69_big_0c000__2fa7:
  2fa7  3406           PSHS  B A                         
  2fa9  FD70F8         STD 0x70f8                        
  2fac  BF70EC         STX 0x70ec                        
  2faf  FC70F8         LDD 0x70f8                        
  2fb2  58             LSLB                              
  2fb3  C3705C         ADDD #0x705c                      
  2fb6  FD70D0         STD 0x70d0                        
  2fb9  FC70F8         LDD 0x70f8                        
  2fbc  C37183         ADDD #0x7183                      
  2fbf  837126         SUBD #0x7126                      
  2fc2  FD70DC         STD 0x70dc                        
  2fc5  3506           PULS  A B                         
  2fc7  39             RTS                               

; ---- function FUN_M69_big_0c000__2fc8
FUN_M69_big_0c000__2fc8:
  2fc8  3416           PSHS  X B A                       
  2fca  CC0000         LDD #0x0                          
  2fcd  8E0452         LDX #0x452                        
  2fd0  17FFD4         LBSR 0x2fa7                       
  2fd3  17EE64         LBSR 0x1e3a                       
  2fd6  CC0001         LDD #0x1                          
  2fd9  8E0453         LDX #0x453                        
  2fdc  17FFC8         LBSR 0x2fa7                       
  2fdf  17EE58         LBSR 0x1e3a                       
  2fe2  CC0002         LDD #0x2                          
  2fe5  8E0454         LDX #0x454                        
  2fe8  17FFBC         LBSR 0x2fa7                       
  2feb  17EE4C         LBSR 0x1e3a                       
  2fee  CC0003         LDD #0x3                          
  2ff1  8E0455         LDX #0x455                        
  2ff4  17FFB0         LBSR 0x2fa7                       
  2ff7  17EE40         LBSR 0x1e3a                       
  2ffa  CC0004         LDD #0x4                          
  2ffd  8E0456         LDX #0x456                        
  3000  17FFA4         LBSR 0x2fa7                       
  3003  17EE34         LBSR 0x1e3a                       
  3006  CC0005         LDD #0x5                          
  3009  8E0457         LDX #0x457                        
  300c  17FF98         LBSR 0x2fa7                       
  300f  17EE28         LBSR 0x1e3a                       
  3012  3516           PULS  A B X                       
  3014  39             RTS                               

; ---- function FUN_M69_big_0c000__3015
FUN_M69_big_0c000__3015:
  3015  3406           PSHS  B A                         
  3017  FD70F8         STD 0x70f8                        
  301a  BF70EE         STX 0x70ee                        
  301d  10BF70F0       STY 0x70f0                        
  3021  FC70F8         LDD 0x70f8                        
  3024  58             LSLB                              
  3025  C3708C         ADDD #0x708c                      
  3028  FD70D2         STD 0x70d2                        
  302b  FC70F8         LDD 0x70f8                        
  302e  58             LSLB                              
  302f  C37080         ADDD #0x7080                      
  3032  FD70D4         STD 0x70d4                        
  3035  FC70F8         LDD 0x70f8                        
  3038  C37195         ADDD #0x7195                      
  303b  837126         SUBD #0x7126                      
  303e  FD70DE         STD 0x70de                        
  3041  FC70F8         LDD 0x70f8                        
  3044  C3718F         ADDD #0x718f                      
  3047  837126         SUBD #0x7126                      
  304a  FD70E0         STD 0x70e0                        
  304d  3506           PULS  A B                         
  304f  39             RTS                               

; ---- function FUN_M69_big_0c000__3050
FUN_M69_big_0c000__3050:
  3050  3436           PSHS  Y X B A                     
  3052  CC0000         LDD #0x0                          
  3055  8E0140         LDX #0x140                        
  3058  108E0143       LDY #0x143                        
  305c  17FFB6         LBSR 0x3015                       
  305f  17EF4D         LBSR 0x1faf                       
  3062  CC0001         LDD #0x1                          
  3065  8E0141         LDX #0x141                        
  3068  108E0144       LDY #0x144                        
  306c  17FFA6         LBSR 0x3015                       
  306f  17EF3D         LBSR 0x1faf                       
  3072  CC0002         LDD #0x2                          
  3075  8E0142         LDX #0x142                        
  3078  108E0145       LDY #0x145                        
  307c  17FF96         LBSR 0x3015                       
  307f  17EF2D         LBSR 0x1faf                       
  3082  CC0003         LDD #0x3                          
  3085  8E0240         LDX #0x240                        
  3088  108E0243       LDY #0x243                        
  308c  17FF86         LBSR 0x3015                       
  308f  17EF1D         LBSR 0x1faf                       
  3092  CC0004         LDD #0x4                          
  3095  8E0241         LDX #0x241                        
  3098  108E0244       LDY #0x244                        
  309c  17FF76         LBSR 0x3015                       
  309f  17EF0D         LBSR 0x1faf                       
  30a2  CC0005         LDD #0x5                          
  30a5  8E0242         LDX #0x242                        
  30a8  108E0245       LDY #0x245                        
  30ac  17FF66         LBSR 0x3015                       
  30af  17EEFD         LBSR 0x1faf                       
  30b2  3536           PULS  A B X Y                     

; ---- function FUN_M69_big_0c000__30b4
FUN_M69_big_0c000__30b4:
  30b4  3406           PSHS  B A                         
  30b6  FD70F8         STD 0x70f8                        
  30b9  BF70F2         STX 0x70f2                        
  30bc  FC70F8         LDD 0x70f8                        
  30bf  58             LSLB                              
  30c0  C37098         ADDD #0x7098                      
  30c3  FD70D6         STD 0x70d6                        
  30c6  FC70F8         LDD 0x70f8                        
  30c9  C3719B         ADDD #0x719b                      
  30cc  837126         SUBD #0x7126                      
  30cf  FD70E2         STD 0x70e2                        
  30d2  3506           PULS  A B                         
  30d4  39             RTS                               

; ---- function FUN_M69_big_0c000__30d5
FUN_M69_big_0c000__30d5:
  30d5  3416           PSHS  X B A                       
  30d7  CC0000         LDD #0x0                          
  30da  8E0146         LDX #0x146                        
  30dd  17FFD4         LBSR 0x30b4                       
  30e0  17F1EC         LBSR 0x22cf                       
  30e3  CC0001         LDD #0x1                          
  30e6  8E0147         LDX #0x147                        
  30e9  17FFC8         LBSR 0x30b4                       
  30ec  17F1E0         LBSR 0x22cf                       
  30ef  CC0002         LDD #0x2                          
  30f2  8E0148         LDX #0x148                        
  30f5  17FFBC         LBSR 0x30b4                       
  30f8  17F1D4         LBSR 0x22cf                       
  30fb  CC0003         LDD #0x3                          
  30fe  8E0246         LDX #0x246                        
  3101  17FFB0         LBSR 0x30b4                       
  3104  17F1C8         LBSR 0x22cf                       
  3107  CC0004         LDD #0x4                          
  310a  8E0247         LDX #0x247                        
  310d  17FFA4         LBSR 0x30b4                       
  3110  17F1BC         LBSR 0x22cf                       
  3113  CC0005         LDD #0x5                          
  3116  8E0248         LDX #0x248                        
  3119  17FF98         LBSR 0x30b4                       
  311c  17F1B0         LBSR 0x22cf                       
  311f  3516           PULS  A B X                       
  3121  39             RTS                               
  3122  .db 00 2F 00 0D 00 05 00 01 00 17 00 11 00 25 00 29  ; ./...........%.)
  3132  .db 00 0B 00 07 00 1F 00 13 00 1D                    ; ..........
DAT_M69_big_0c000__313c:
  313c  00             ?? 00h                            
  313d  .db 00                                               ; .
DAT_M69_big_0c000__313e:
  313e  2A             ?? 2Ah    *                       
  313f  .db 94                                               ; .
DAT_M69_big_0c000__3140:
  3140  55             ?? 55h    U                       
  3141  .db 28                                               ; (
DAT_M69_big_0c000__3142:
  3142  7F             ?? 7Fh                           
  3143  .db BC                                               ; .
DAT_M69_big_0c000__3144:
  3144  AA             ?? AAh                            
  3145  .db 50                                               ; P
DAT_M69_big_0c000__3146:
  3146  D4             ?? D4h                            
  3147  .db E4                                               ; .

;; Module 6D parameter/preset table "LONG DIGIPLEX", 59 bytes
MODULE_6D_TABLE_LONG_DIGIPLEX_hdr:
  3148  6D0000430000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6D_TABLE_LONG_DIGIPLEX:
  3150  6D             ?? 6Dh    m                       
  3151  .db 01                                               ; .
  3152  4C4F4E472044.. ds "LONG DIGIPLEX  "              
  3164  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3174  .db 00 00 00 00 00 03 E8 05 00 00 19 00 80 00 64 00  ; ..............d.
  3184  .db 64 00 14 00 64 00 00                             ; d...d..

;; Module 6D code record 01, 132 bytes, entered at payload start
MODULE_6D_01_CODE_hdr:
  318b  6D01008C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6D_01_entry
MODULE_6D_01_entry:
  3193  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $3197
  3197  3197           dw 3197h                          
LAB_M69_big_0c000__3199:
  3199  3477           PSHS  U Y X B A CC                
  319b  1A40           ORCC #0x40                        
  319d  C600           LDB #0x0                          
  319f  AD9FFC58       JSR [0xfc58]                      
  31a3  CCFFFF         LDD #0xffff                       
  31a6  FD7122         STD 0x7122                        
  31a9  C601           LDB #0x1                          
  31ab  8E1410         LDX #0x1410                       
  31ae  AD9FFD30       JSR [0xfd30]                      
  31b2  1026D5BB       LBNE 0x0771                       
  31b6  C602           LDB #0x2                          
  31b8  8E1411         LDX #0x1411                       
  31bb  AD9FFD30       JSR [0xfd30]                      
  31bf  1026D5AE       LBNE 0x0771                       
  31c3  C603           LDB #0x3                          
  31c5  8E1412         LDX #0x1412                       
  31c8  AD9FFD30       JSR [0xfd30]                      
  31cc  1026D5A1       LBNE 0x0771                       
  31d0  17CE3D         LBSR 0x0010                       
  31d3  17CF2D         LBSR 0x0103                       
  31d6  17E6E1         LBSR 0x18ba                       
  31d9  17F21D         LBSR 0x23f9                       
  31dc  17E148         LBSR 0x1327                       
  31df  17E5B2         LBSR 0x1794                       
  31e2  17F925         LBSR 0x2b0a                       
  31e5  17F559         LBSR 0x2741                       
  31e8  17FEEA         LBSR 0x30d5                       
  31eb  17FCD6         LBSR 0x2ec4                       
  31ee  17FAF0         LBSR 0x2ce1                       
  31f1  17FAE0         LBSR 0x2cd4                       
  31f4  CC0000         LDD #0x0                          
  31f7  AD9FFC6C       JSR [0xfc6c]                      
  31fb  AD9FFC74       JSR [0xfc74]                      
  31ff  AD9FFDF6       JSR [0xfdf6]                      
  3203  17D79E         LBSR 0x09a4                       
  3206  AD9FFE10       JSR [0xfe10]                      
  320a  17D08E         LBSR 0x029b                       
  320d  CC4E20         LDD #0x4e20                       
  3210  AD9FFD20       JSR [0xfd20]                      
  3214  3577           PULS CC A B X Y U                 
  3216  39             RTS                               

;; Module 6E parameter/preset table "DUAL DIGIPLEX", 83 bytes
MODULE_6E_TABLE_DUAL_DIGIPLEX_hdr:
  3217  6E00005B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6E_TABLE_DUAL_DIGIPLEX:
  321f  6E             ?? 6Eh    n                       
  3220  .db 01                                               ; .
  3221  4455414C2044.. ds "DUAL DIGIPLEX  "              
  3234  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3244  .db 00 00 00 00 01 F4 08 00 00 19 00 80 00 64 00 64  ; .............d.d
  3254  .db 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00 00  ; ...d............
  3264  .db 00 00 00 64 00 64 02 58 08 00 00 19 00 64        ; ...d.d.X.....d

;; Module 6E code record 01, 141 bytes, entered at payload start
MODULE_6E_01_CODE_hdr:
  3272  6E0100950000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6E_01_entry
MODULE_6E_01_entry:
  327a  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $327E
  327e  327E           dw 327Eh                          
LAB_M69_big_0c000__3280:
  3280  3477           PSHS  U Y X B A CC                
  3282  1A40           ORCC #0x40                        
  3284  C600           LDB #0x0                          
  3286  AD9FFC58       JSR [0xfc58]                      
  328a  CCFFFF         LDD #0xffff                       
  328d  FD7122         STD 0x7122                        
  3290  C601           LDB #0x1                          
  3292  8E1410         LDX #0x1410                       
  3295  AD9FFD30       JSR [0xfd30]                      
  3299  1026D4D4       LBNE 0x0771                       
  329d  C602           LDB #0x2                          
  329f  8E1411         LDX #0x1411                       
  32a2  AD9FFD30       JSR [0xfd30]                      
  32a6  1026D4C7       LBNE 0x0771                       
  32aa  C603           LDB #0x3                          
  32ac  8E1412         LDX #0x1412                       
  32af  AD9FFD30       JSR [0xfd30]                      
  32b3  1026D4BA       LBNE 0x0771                       
  32b7  17CD56         LBSR 0x0010                       
  32ba  17CE7E         LBSR 0x013b                       
  32bd  17E5FA         LBSR 0x18ba                       
  32c0  17F254         LBSR 0x2517                       
  32c3  17F36B         LBSR 0x2631                       
  32c6  17E05E         LBSR 0x1327                       
  32c9  17E4C8         LBSR 0x1794                       
  32cc  17F572         LBSR 0x2841                       
  32cf  17F691         LBSR 0x2963                       
  32d2  17F835         LBSR 0x2b0a                       
  32d5  17F961         LBSR 0x2c39                       
  32d8  17FDFA         LBSR 0x30d5                       
  32db  17FA80         LBSR 0x2d5e                       
  32de  17FBE3         LBSR 0x2ec4                       
  32e1  17F9F0         LBSR 0x2cd4                       
  32e4  CC0000         LDD #0x0                          
  32e7  AD9FFC6C       JSR [0xfc6c]                      
  32eb  AD9FFC74       JSR [0xfc74]                      
  32ef  AD9FFDF6       JSR [0xfdf6]                      
  32f3  17D740         LBSR 0x0a36                       
  32f6  AD9FFE10       JSR [0xfe10]                      
  32fa  17CE85         LBSR 0x0182                       
  32fd  CC4E20         LDD #0x4e20                       
  3300  AD9FFD20       JSR [0xfd20]                      
  3304  3577           PULS CC A B X Y U                 
  3306  39             RTS                               

;; Module 69 parameter/preset table "SWEPT COMBS", 127 bytes
MODULE_69_TABLE_SWEPT_COMBS_hdr:
  3307  690000870000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_69_TABLE_SWEPT_COMBS:
  330f  69             ?? 69h    i                       
  3310  .db 01                                               ; .
  3311  535745505420.. ds "SWEPT COMBS    "              
  3324  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3334  .db 00 00 00 00 00 00 00 64 00 0A 00 64 00 64 00 64  ; .......d...d.d.d
  3344  .db 00 14 00 64 00 00 00 00 00 00 00 00 00 00 00 00  ; ...d............
  3354  .db 00 00 00 64 00 64 00 32 00 64 B3 B7 BF BC B9 B8  ; ...d.d.2.d......
  3364  .db 28 28 28 28 28 28 09 08 08 07 09 08 F5 0B F5 0B  ; ((((((..........
  3374  .db F5 0B 28 28 28 28 28 28 64 64 64 64 64 64 00 50  ; ..((((((dddddd.P
  3384  .db 00 64 00 64 00 64 00 00 00 00                    ; .d.d.d....

;; Module 69 code record 01, 147 bytes, entered at payload start
MODULE_69_01_CODE_hdr:
  338e  6901009B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_69_01_entry
MODULE_69_01_entry:
  3396  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $339A
  339a  339A           dw 339Ah                          
LAB_M69_big_0c000__339c:
  339c  3477           PSHS  U Y X B A CC                
  339e  1A40           ORCC #0x40                        
  33a0  C600           LDB #0x0                          
  33a2  AD9FFC58       JSR [0xfc58]                      
  33a6  CCFFFF         LDD #0xffff                       
  33a9  FD7122         STD 0x7122                        
  33ac  C601           LDB #0x1                          
  33ae  8E1410         LDX #0x1410                       
  33b1  AD9FFD30       JSR [0xfd30]                      
  33b5  1026D3B8       LBNE 0x0771                       
  33b9  C602           LDB #0x2                          
  33bb  8E1411         LDX #0x1411                       
  33be  AD9FFD30       JSR [0xfd30]                      
  33c2  1026D3AB       LBNE 0x0771                       
  33c6  C603           LDB #0x3                          
  33c8  8E1412         LDX #0x1412                       
  33cb  AD9FFD30       JSR [0xfd30]                      
  33cf  1026D39E       LBNE 0x0771                       
  33d3  17CC3A         LBSR 0x0010                       
  33d6  17E4E1         LBSR 0x18ba                       
  33d9  17F01D         LBSR 0x23f9                       
  33dc  17E139         LBSR 0x1518                       
  33df  17E2B0         LBSR 0x1692                       
  33e2  17DC15         LBSR 0x0ffa                       
  33e5  17DD21         LBSR 0x1109                       
  33e8  17DE2D         LBSR 0x1218                       
  33eb  17DF39         LBSR 0x1327                       
  33ee  17E3A3         LBSR 0x1794                       
  33f1  17FBD4         LBSR 0x2fc8                       
  33f4  17FB63         LBSR 0x2f5a                       
  33f7  17FCDB         LBSR 0x30d5                       
  33fa  17F9EA         LBSR 0x2de7                       
  33fd  17FAC4         LBSR 0x2ec4                       
  3400  17FC4D         LBSR 0x3050                       
  3403  17F8CE         LBSR 0x2cd4                       
  3406  CC0000         LDD #0x0                          
  3409  AD9FFC6C       JSR [0xfc6c]                      
  340d  AD9FFC74       JSR [0xfc74]                      
  3411  AD9FFDF6       JSR [0xfdf6]                      
  3415  17D467         LBSR 0x087f                       
  3418  AD9FFE10       JSR [0xfe10]                      
  341c  17CF2E         LBSR 0x034d                       
  341f  CC4E20         LDD #0x4e20                       
  3422  AD9FFD20       JSR [0xfd20]                      
  3426  3577           PULS CC A B X Y U                 
  3428  39             RTS                               

;; Module 6A parameter/preset table "SWEPT REVERB", 97 bytes
MODULE_6A_TABLE_SWEPT_REVERB_hdr:
  3429  6A0000690000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_6A_TABLE_SWEPT_REVERB:
  3431  6A             ?? 6Ah    j                       
  3432  .db 01                                               ; .
  3433  535745505420.. ds "SWEPT REVERB   "              
  3444  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  3454  .db 00 00 00 00 00 00 00 64 00 64 00 0A 00 64 00 64  ; .......d.d...d.d
  3464  .db 00 64 00 14 00 64 00 00 00 00 00 00 00 00 00 00  ; .d...d..........
  3474  .db 00 00 00 00 00 46 00 64 00 02 00 02 2D 33 39 3F  ; .....F.d....-39?
  3484  .db 4F 5B 28 28 28 28 28 28 09 08 07 0A 06 05        ; O[((((((......

;; Module 6A code record 01, 135 bytes, entered at payload start
MODULE_6A_01_CODE_hdr:
  3492  6A01008F0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_6A_01_entry
MODULE_6A_01_entry:
  349a  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $349E
  349e  349E           dw 349Eh                          
LAB_M69_big_0c000__34a0:
  34a0  3477           PSHS  U Y X B A CC                
  34a2  1A40           ORCC #0x40                        
  34a4  C600           LDB #0x0                          
  34a6  AD9FFC58       JSR [0xfc58]                      
  34aa  CC0000         LDD #0x0                          
  34ad  FD7122         STD 0x7122                        
  34b0  C601           LDB #0x1                          
  34b2  8E1E10         LDX #0x1e10                       
  34b5  AD9FFD30       JSR [0xfd30]                      
  34b9  1026D2B4       LBNE 0x0771                       
  34bd  C602           LDB #0x2                          
  34bf  8E1E11         LDX #0x1e11                       
  34c2  AD9FFD30       JSR [0xfd30]                      
  34c6  1026D2A7       LBNE 0x0771                       
  34ca  C603           LDB #0x3                          
  34cc  8E1E12         LDX #0x1e12                       
  34cf  AD9FFD30       JSR [0xfd30]                      
  34d3  1026D29A       LBNE 0x0771                       
  34d7  17CB36         LBSR 0x0010                       
  34da  17E3DD         LBSR 0x18ba                       
  34dd  17EF19         LBSR 0x23f9                       
  34e0  17D9C0         LBSR 0x0ea3                       
  34e3  17DE41         LBSR 0x1327                       
  34e6  17DB11         LBSR 0x0ffa                       
  34e9  17DC1D         LBSR 0x1109                       
  34ec  17DD29         LBSR 0x1218                       
  34ef  17FAD6         LBSR 0x2fc8                       
  34f2  17FA65         LBSR 0x2f5a                       
  34f5  17F8EF         LBSR 0x2de7                       
  34f8  17F9C9         LBSR 0x2ec4                       
  34fb  17F7D6         LBSR 0x2cd4                       
  34fe  CC0000         LDD #0x0                          
  3501  AD9FFC6C       JSR [0xfc6c]                      
  3505  AD9FFC74       JSR [0xfc74]                      
  3509  AD9FFDF6       JSR [0xfdf6]                      
  350d  17D297         LBSR 0x07a7                       
  3510  AD9FFE10       JSR [0xfe10]                      
  3514  17D12C         LBSR 0x0643                       
  3517  CC4E20         LDD #0x4e20                       
  351a  AD9FFD20       JSR [0xfd20]                      
  351e  3577           PULS CC A B X Y U                 
  3520  39             RTS                               

;; Preset 035 "SWEEP RIGHT" (algorithm 6C01), 152 bytes
PRESET_035_SWEEP_RIGHT_hdr:
  3521  C83500A00000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
PRESET_035_SWEEP_RIGHT:
  3529  6C             ?? 6Ch    l                       
  352a  .db 01                                               ; .
  352b  535745455020.. ds "SWEEP RIGHT    "              
  353c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  354c  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  355c  .db 00 00 00 64 00 64 00 19 00 00 00 37 00 32 00 64  ; ...d.d.....7.2.d
  356c  .db 00 00 00 00 00 00 00 00 00 32 00 64 00 C8 00 00  ; .........2.d....
  357c  .db B5 01 6A 02 1F 02 D4 03 89 04 3E 04 F3 05 A8 06  ; ..j.......>.....
  358c  .db 5D 07 12 07 C7 08 7C 01 90 01 90 01 90 01 90 01  ; ].....|.........
  359c  .db 90 01 90 01 90 01 90 01 90 01 90 01 90 01 90 F5  ; ................
  35ac  .db F7 F9 FB FD FF 01 03 05 07 09 0B 00 52 00 73 00  ; ............R.s.
  35bc  .db 2A 00 67 00 0C                                   ; *.g..

;; TMS32010 program 14 for DSP 2: 303 words loaded at $800 (written via bank latch $82)
DSPPROG_14_DSP2_hdr:
  35c1  141102680000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_14_DSP2:
  35c9  08006E007F8B.. dw[304]                           

;; TMS32010 program 14 for DSP 3: 478 words loaded at $800 (written via bank latch $83)
DSPPROG_14_DSP3_hdr:
  3829  141203C60000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_14_DSP3:
  3831  08006E007F8B.. dw[479]                           

;; TMS32010 program 04 for DSP 2: 449 words loaded at $800 (written via bank latch $82)
DSPPROG_04_DSP2_hdr:
  3bef  0411038C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_04_DSP2:
  3bf7  080068807F8B.. dw[450]                           

;; End of record chain
END_OF_CHAIN_hdr:
  3f7b  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  3f83  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f93  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff3  .db FF FF FF FF FF FF FF FF FF FF FF FF FF           ; .............
