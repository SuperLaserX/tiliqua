; H3500  block M73_r4_3c000  M73_r4_3c000::0000-M73_r4_3c000::3fff
; Bank r4_3c000 (module id 73, sub 00)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module 73 parameter/preset table "VOCODER", 142 bytes
MODULE_73_TABLE_VOCODER_hdr:
  0008  730000960000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
MODULE_73_TABLE_VOCODER:
  0010  73             ?? 73h    s                       
  0011  .db 01                                               ; .
  0012  564F434F4445.. ds "VOCODER        "              
  0024  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  0034  .db 00 00 00 00 00 00 64 00 0A 00 14 14 00 14 00 64  ; ......d........d
  0044  .db 00 05 00 64 00 00 03 E8 00 32 00 0A 00 64 00 64  ; ...d.....2...d.d
  0054  .db 03 E7 00 14 00 64 00 40 00 80 02 02 02 02 02 32  ; .....d.@.......2
  0064  .db 00                                               ; .
  0065  64204B6E6F62.. ds "d Knob 1  Knob 2  Knob 3  Knob 4 dd"
  008c  .db 00 00 00 00 00 00 00 00 00 00 13 88 13 88 13 88  ; ................
  009c  .db 13 88                                            ; ..

;; Module 73 code record 01, 3330 bytes, entered at payload start
MODULE_73_01_CODE_hdr:
  009e  73010D0A0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_73_01_entry
MODULE_73_01_entry:
  00a6  AD9FFC60       JSR [0xfc60]                       ; inline[API_FC60]: $00AA
  00aa  00AA           dw AAh                            
LAB_M73_r4_3c000__00ac:
  00ac  3477           PSHS  U Y X B A CC                
  00ae  170141         LBSR 0x01f2                       
  00b1  1700ED         LBSR 0x01a1                       
  00b4  17011C         LBSR 0x01d3                       
  00b7  C600           LDB #0x0                          
  00b9  AD9FFC58       JSR [0xfc58]                      
  00bd  8603           LDA #0x3                          
  00bf  B760DA         STA 0x60da                        
  00c2  AD9FFE38       JSR [0xfe38]                      
  00c6  170038         LBSR 0x0101                       
  00c9  B6600A         LDA 0x600a                        
  00cc  8173           CMPA #0x73                        
  00ce  2707           BEQ 0x00d7                        
  00d0  AD9FFED0       JSR [0xfed0]                      
  00d4  170053         LBSR 0x012a                       
LAB_M73_r4_3c000__00d7:
  00d7  17015D         LBSR 0x0237                       
  00da  170177         LBSR 0x0254                       
  00dd  B6600A         LDA 0x600a                        
  00e0  8173           CMPA #0x73                        
  00e2  2707           BEQ 0x00eb                        
  00e4  CC4E20         LDD #0x4e20                       
  00e7  AD9FFD20       JSR [0xfd20]                      
LAB_M73_r4_3c000__00eb:
  00eb  AD9FFE36       JSR [0xfe36]                      
  00ef  AD9FFDF6       JSR [0xfdf6]                      
  00f3  AD9FFE18       JSR [0xfe18]                      
  00f7  170272         LBSR 0x036c                       
  00fa  AD9FFE10       JSR [0xfe10]                      
  00fe  3577           PULS CC A B X Y U                 
  0100  39             RTS                               

; ---- function FUN_M73_r4_3c000__0101
FUN_M73_r4_3c000__0101:
  0101  3476           PSHS  U Y X B A                   
  0103  1A40           ORCC #0x40                        
  0105  3440           PSHS  U                           
  0107  CC0D17         LDD #0xd17                        
  010a  F3600D         ADDD 0x600d                       
  010d  1F01           TFR D,X                           
  010f  CC0D46         LDD #0xd46                        
  0112  F3600D         ADDD 0x600d                       
  0115  1F03           TFR D,U                           
  0117  108E6600       LDY #0x6600                       
  011b  AD9FFD08       JSR [0xfd08]                      
  011f  3540           PULS  U                           
  0121  AD9FFD76       JSR [0xfd76]                      
  0125  1CBF           ANDCC #0xbf                       
  0127  3576           PULS  A B X Y U                   
  0129  39             RTS                               

; ---- function FUN_M73_r4_3c000__012a
FUN_M73_r4_3c000__012a:
  012a  3476           PSHS  U Y X B A                   
  012c  C601           LDB #0x1                          
  012e  8E7310         LDX #0x7310                       
  0131  AD9FFD30       JSR [0xfd30]                      
  0135  10260032       LBNE 0x016b                       
  0139  C602           LDB #0x2                          
  013b  8E7311         LDX #0x7311                       
  013e  AD9FFD30       JSR [0xfd30]                      
  0142  10260025       LBNE 0x016b                       
  0146  C603           LDB #0x3                          
  0148  8E7312         LDX #0x7312                       
  014b  AD9FFD30       JSR [0xfd30]                      
  014f  10260018       LBNE 0x016b                       
  0153  CC000A         LDD #0xa                          
  0156  AD9FFD20       JSR [0xfd20]                      
  015a  108E0000       LDY #0x0                          
  015e  FC7076         LDD 0x7076                        
  0161  AD9FFD2E       JSR [0xfd2e]                      
  0165  AD9FFD7C       JSR [0xfd7c]                      
  0169  2033           BRA 0x019e                        
LAB_M73_r4_3c000__016b:
  016b  C600           LDB #0x0                          
  016d  AD9FFC36       JSR [0xfc36]                      
  0171  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "UH OH....          TMS320 LOADING ERROR "
  0175  5548204F482E.. char[41] "UH OH....          TMS320 LOADING ERROR "
LAB_M73_r4_3c000__019e:
  019e  3576           PULS  A B X Y U                   
  01a0  39             RTS                               

; ---- function FUN_M73_r4_3c000__01a1
FUN_M73_r4_3c000__01a1:
  01a1  3406           PSHS  B A                         
  01a3  CC0000         LDD #0x0                          
  01a6  FD7002         STD 0x7002                        
  01a9  FD700A         STD 0x700a                        
  01ac  FD7042         STD 0x7042                        
  01af  FD7012         STD 0x7012                        
  01b2  FD701A         STD 0x701a                        
  01b5  FD7024         STD 0x7024                        
  01b8  FD702E         STD 0x702e                        
  01bb  FD7038         STD 0x7038                        
  01be  FD704A         STD 0x704a                        
  01c1  FD7052         STD 0x7052                        
  01c4  FD7060         STD 0x7060                        
  01c7  FD706C         STD 0x706c                        
  01ca  FD7066         STD 0x7066                        
  01cd  FD7072         STD 0x7072                        
  01d0  3506           PULS  A B                         
  01d2  39             RTS                               

; ---- function FUN_M73_r4_3c000__01d3
FUN_M73_r4_3c000__01d3:
  01d3  3476           PSHS  U Y X B A                   
  01d5  CC0000         LDD #0x0                          
  01d8  AD9FFC6C       JSR [0xfc6c]                      
  01dc  AD9FFC74       JSR [0xfc74]                      
  01e0  1709B3         LBSR 0x0b96                       
  01e3  170A2B         LBSR 0x0c11                       
  01e6  170AA3         LBSR 0x0c8c                       
  01e9  170B1B         LBSR 0x0d07                       
  01ec  17090D         LBSR 0x0afc                       
  01ef  3576           PULS  A B X Y U                   
  01f1  39             RTS                               

; ---- function FUN_M73_r4_3c000__01f2
FUN_M73_r4_3c000__01f2:
  01f2  3476           PSHS  U Y X B A                   
  01f4  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 33:08 35:40 52:0E 54:46 31:00 50:06
  01f8  33             db 33h                            
  01f9  08             db 8h                             
  01fa  35             db 35h                            
  01fb  40             db 40h                            
  01fc  52             db 52h                            
  01fd  0E             db Eh                             
  01fe  54             db 54h                            
  01ff  46             db 46h                            
  0200  31             db 31h                            
  0201  00             db 0h                             
  0202  50             db 50h                            
  0203  06             db 6h                             
  0204  00             db 0h                             
LAB_M73_r4_3c000__0205:
  0205  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 38:10 3A:16 40:22 42:28
  0209  38             db 38h                            
  020a  10             db 10h                            
  020b  3A             db 3Ah                            
  020c  16             db 16h                            
  020d  40             db 40h                            
  020e  22             db 22h                            
  020f  42             db 42h                            
  0210  28             db 28h                            
  0211  00             db 0h                             
LAB_M73_r4_3c000__0212:
  0212  AD9FFE08       JSR [0xfe08]                       ; inline[API_FE08]: 3C:18 4C:2C 4E:36 44:48 46:4E 48:50 4A:56
  0216  3C             db 3Ch                            
  0217  18             db 18h                            
  0218  4C             db 4Ch                            
  0219  2C             db 2Ch                            
  021a  4E             db 4Eh                            
  021b  36             db 36h                            
  021c  44             db 44h                            
  021d  48             db 48h                            
  021e  46             db 46h                            
  021f  4E             db 4Eh                            
  0220  48             db 48h                            
  0221  50             db 50h                            
  0222  4A             db 4Ah                            
  0223  56             db 56h                            
  0224  00             db 0h                             
LAB_M73_r4_3c000__0225:
  0225  AD9FFE04       JSR [0xfe04]                       ; inline[API_FE04]: 37:58 19:5E 1A:6A 1B:64 1C:70
  0229  37             db 37h                            
  022a  58             db 58h                            
  022b  19             db 19h                            
  022c  5E             db 5Eh                            
  022d  1A             db 1Ah                            
  022e  6A             db 6Ah                            
  022f  1B             db 1Bh                            
  0230  64             db 64h                            
  0231  1C             db 1Ch                            
  0232  70             db 70h                            
  0233  00             db 0h                             
LAB_M73_r4_3c000__0234:
  0234  3576           PULS  A B X Y U                   
  0236  39             RTS                               

; ---- function FUN_M73_r4_3c000__0237
FUN_M73_r4_3c000__0237:
  0237  3476           PSHS  U Y X B A                   
  0239  1702C3         LBSR 0x04ff                       
  023c  17038A         LBSR 0x05c9                       
  023f  170451         LBSR 0x0693                       
  0242  1704FF         LBSR 0x0744                       
  0245  170786         LBSR 0x09ce                       
  0248  17080E         LBSR 0x0a59                       
  024b  17059D         LBSR 0x07eb                       
  024e  170649         LBSR 0x089a                       
  0251  3576           PULS  A B X Y U                   
  0253  39             RTS                               

; ---- function FUN_M73_r4_3c000__0254
FUN_M73_r4_3c000__0254:
  0254  3476           PSHS  U Y X B A                   
  0256  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 00 80 "  mix   " 21 $0ACF $0ADB
  025a  00             db 0h                             
  025b  80             db 80h                            
  025c  20206D697820.. ds "  mix   "                     
  0264  21             db 21h                            
  0265  0ACF           addr M73_r4_3c000::0acf           
  0267  0ADB           addr M73_r4_3c000::0adb           
LAB_M73_r4_3c000__0269:
  0269  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 01 80 "formants" 25 $0666 $0672
  026d  01             db 1h                             
  026e  80             db 80h                            
  026f  666F726D616E.. ds "formants"                     
  0277  25             db 25h                            
  0278  0666           addr M73_r4_3c000::0666           
  027a  0672           addr M73_r4_3c000::0672           
LAB_M73_r4_3c000__027c:
  027c  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 02 80 " width  " 29 $086D $0879
  0280  02             db 2h                             
  0281  80             db 80h                            
  0282  207769647468.. ds " width  "                     
  028a  29             db 29h                            
  028b  086D           addr M73_r4_3c000::086d           
  028d  0879           addr M73_r4_3c000::0879           
LAB_M73_r4_3c000__028f:
  028f  AD9FFD84       JSR [0xfd84]                       ; inline[API_FD84]: 03 80 " depth  " 2D $07BE $07CA
  0293  03             db 3h                             
  0294  80             db 80h                            
  0295  206465707468.. ds " depth  "                     
  029d  2D             db 2Dh                            
  029e  07BE           addr M73_r4_3c000::07be           
  02a0  07CA           addr M73_r4_3c000::07ca           
LAB_M73_r4_3c000__02a2:
  02a2  CC02BE         LDD #0x2be                        
  02a5  FD60F5         STD 0x60f5                        
  02a8  CC001A         LDD #0x1a                         
  02ab  47             ASRA                              
  02ac  56             RORB                              
  02ad  FD60F7         STD 0x60f7                        
  02b0  8601           LDA #0x1                          
  02b2  B76105         STA 0x6105                        
  02b5  CC0056         LDD #0x56                         
  02b8  FD6106         STD 0x6106                        
  02bb  3576           PULS  A B X Y U                   
  02bd  39             RTS                               
  02be  02D802E302EE.. addr[13]                          

; ---- function FUN_M73_r4_3c000__02d8
FUN_M73_r4_3c000__02d8:
  02d8  1701D3         LBSR 0x04ae                       
  02db  17008E         LBSR 0x036c                       
  02de  AD9FFE10       JSR [0xfe10]                      
  02e2  39             RTS                               

; ---- function FUN_M73_r4_3c000__02e3
FUN_M73_r4_3c000__02e3:
  02e3  170292         LBSR 0x0578                       
  02e6  170083         LBSR 0x036c                       
  02e9  AD9FFE12       JSR [0xfe12]                      
  02ed  39             RTS                               

; ---- function FUN_M73_r4_3c000__02ee
FUN_M73_r4_3c000__02ee:
  02ee  170351         LBSR 0x0642                       
  02f1  170078         LBSR 0x036c                       
  02f4  AD9FFE14       JSR [0xfe14]                      
  02f8  39             RTS                               

; ---- function FUN_M73_r4_3c000__02f9
FUN_M73_r4_3c000__02f9:
  02f9  17049E         LBSR 0x079a                       
  02fc  17006D         LBSR 0x036c                       
  02ff  AD9FFE16       JSR [0xfe16]                      
  0303  39             RTS                               

; ---- function FUN_M73_r4_3c000__0304
FUN_M73_r4_3c000__0304:
  0304  170542         LBSR 0x0849                       
  0307  17009B         LBSR 0x03a5                       
  030a  AD9FFE10       JSR [0xfe10]                      
  030e  39             RTS                               

; ---- function FUN_M73_r4_3c000__030f
FUN_M73_r4_3c000__030f:
  030f  170799         LBSR 0x0aab                       
  0312  170090         LBSR 0x03a5                       
  0315  AD9FFE12       JSR [0xfe12]                      
  0319  39             RTS                               

; ---- function FUN_M73_r4_3c000__031a
FUN_M73_r4_3c000__031a:
  031a  170840         LBSR 0x0b5d                       
  031d  1700BE         LBSR 0x03de                       
  0320  AD9FFE10       JSR [0xfe10]                      
  0324  39             RTS                               

; ---- function FUN_M73_r4_3c000__0325
FUN_M73_r4_3c000__0325:
  0325  1708B0         LBSR 0x0bd8                       
  0328  1700B3         LBSR 0x03de                       
  032b  AD9FFE12       JSR [0xfe12]                      
  032f  39             RTS                               

; ---- function FUN_M73_r4_3c000__0330
FUN_M73_r4_3c000__0330:
  0330  170920         LBSR 0x0c53                       
  0333  1700DA         LBSR 0x0410                       
  0336  AD9FFE10       JSR [0xfe10]                      
  033a  39             RTS                               

; ---- function FUN_M73_r4_3c000__033b
FUN_M73_r4_3c000__033b:
  033b  170990         LBSR 0x0cce                       
  033e  1700CF         LBSR 0x0410                       
  0341  AD9FFE12       JSR [0xfe12]                      
  0345  39             RTS                               

; ---- function FUN_M73_r4_3c000__0346
FUN_M73_r4_3c000__0346:
  0346  17064C         LBSR 0x0995                       
  0349  1700F6         LBSR 0x0442                       
  034c  AD9FFE10       JSR [0xfe10]                      
  0350  39             RTS                               

; ---- function FUN_M73_r4_3c000__0351
FUN_M73_r4_3c000__0351:
  0351  1706CC         LBSR 0x0a20                       
  0354  1700EB         LBSR 0x0442                       
  0357  AD9FFE12       JSR [0xfe12]                      
  035b  39             RTS                               

; ---- function FUN_M73_r4_3c000__035c
FUN_M73_r4_3c000__035c:
  035c  170394         LBSR 0x06f3                       
  035f  1700E0         LBSR 0x0442                       
  0362  AD9FFE14       JSR [0xfe14]                      
  0366  39             RTS                               

; ---- function FUN_M73_r4_3c000__0367
FUN_M73_r4_3c000__0367:
  0367  AD9FFDFC       JSR [0xfdfc]                      
  036b  39             RTS                               

; ---- function FUN_M73_r4_3c000__036c
FUN_M73_r4_3c000__036c:
  036c  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "f speed " "envspeed" "f shift " " depth  "
  0370  662073706565.. ds "f speed "                     
  0378  656E76737065.. ds "envspeed"                     
  0380  662073686966.. ds "f shift "                     
  0388  206465707468.. ds " depth  "                     
LAB_M73_r4_3c000__0390:
  0390  AD9FFDF2       JSR [0xfdf2]                      
  0394  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$04A2 ->$056C ->$0636 ->$078E ->$03A5 ->$03A5
  0398  04A2           addr M73_r4_3c000::04a2           
  039a  056C           addr M73_r4_3c000::056c           
  039c  0636           addr M73_r4_3c000::0636           
  039e  078E           addr M73_r4_3c000::078e           
  03a0  03A5           addr M73_r4_3c000::03a5           
  03a2  03A5           addr M73_r4_3c000::03a5           
LAB_M73_r4_3c000__03a4:
  03a4  39             RTS                               

; ---- function FUN_M73_r4_3c000__03a5
FUN_M73_r4_3c000__03a5:
  03a5  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: " width  " "  mix   " " levels " " expert "
  03a9  207769647468.. ds " width  "                     
  03b1  20206D697820.. ds "  mix   "                     
  03b9  206C6576656C.. ds " levels "                     
  03c1  206578706572.. ds " expert "                     
LAB_M73_r4_3c000__03c9:
  03c9  AD9FFDF2       JSR [0xfdf2]                      
  03cd  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$083D ->$0A9F ->$03DE ->$0442 ->$036C ->$036C
  03d1  083D           addr M73_r4_3c000::083d           
  03d3  0A9F           addr M73_r4_3c000::0a9f           
  03d5  03DE           addr M73_r4_3c000::03de           
  03d7  0442           addr M73_r4_3c000::0442           
  03d9  036C           addr M73_r4_3c000::036c           
  03db  036C           addr M73_r4_3c000::036c           
LAB_M73_r4_3c000__03dd:
  03dd  39             RTS                               

; ---- function FUN_M73_r4_3c000__03de
FUN_M73_r4_3c000__03de:
  03de  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left in " "right in" [*] "return  "
  03e2  6C6566742069.. ds "left in "                     
  03ea  726967687420.. ds "right in"                     
  03f2  01             db 1h                             
  03f3  72657475726E.. ds "return  "                     
LAB_M73_r4_3c000__03fb:
  03fb  AD9FFDF2       JSR [0xfdf2]                      
  03ff  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0B51 ->$0BCC ->$047B ->$036C ->$0410 ->$0410
  0403  0B51           addr M73_r4_3c000::0b51           
  0405  0BCC           addr M73_r4_3c000::0bcc           
  0407  047B           addr M73_r4_3c000::047b           
  0409  036C           addr M73_r4_3c000::036c           
  040b  0410           addr M73_r4_3c000::0410           
  040d  0410           addr M73_r4_3c000::0410           
LAB_M73_r4_3c000__040f:
  040f  39             RTS                               

; ---- function FUN_M73_r4_3c000__0410
FUN_M73_r4_3c000__0410:
  0410  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "left out" "rightout" [*] "return  "
  0414  6C656674206F.. ds "left out"                     
  041c  72696768746F.. ds "rightout"                     
  0424  01             db 1h                             
  0425  72657475726E.. ds "return  "                     
LAB_M73_r4_3c000__042d:
  042d  AD9FFDF2       JSR [0xfdf2]                      
  0431  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0C47 ->$0CC2 ->$047B ->$036C ->$03DE ->$03DE
  0435  0C47           addr M73_r4_3c000::0c47           
  0437  0CC2           addr M73_r4_3c000::0cc2           
  0439  047B           addr M73_r4_3c000::047b           
  043b  036C           addr M73_r4_3c000::036c           
  043d  03DE           addr M73_r4_3c000::03de           
  043f  03DE           addr M73_r4_3c000::03de           
LAB_M73_r4_3c000__0441:
  0441  39             RTS                               

; ---- function FUN_M73_r4_3c000__0442
FUN_M73_r4_3c000__0442:
  0442  AD9FFE02       JSR [0xfe02]                       ; inline[API_FE02]: "max res " "min err " "  gate  " " return "
  0446  6D6178207265.. ds "max res "                     
  044e  6D696E206572.. ds "min err "                     
  0456  202067617465.. ds "  gate  "                     
  045e  207265747572.. ds " return "                     
LAB_M73_r4_3c000__0466:
  0466  AD9FFDF2       JSR [0xfdf2]                      
  046a  AD9FFE00       JSR [0xfe00]                       ; inline[API_FE00]: ->$0989 ->$0A14 ->$06E7 ->$036C ->$0442 ->$0442
  046e  0989           addr M73_r4_3c000::0989           
  0470  0A14           addr M73_r4_3c000::0a14           
  0472  06E7           addr M73_r4_3c000::06e7           
  0474  036C           addr M73_r4_3c000::036c           
  0476  0442           addr M73_r4_3c000::0442           
  0478  0442           addr M73_r4_3c000::0442           
LAB_M73_r4_3c000__047a:
  047a  39             RTS                               

; ---- function FUN_M73_r4_3c000__047b
FUN_M73_r4_3c000__047b:
  047b  39             RTS                               
PTR_FUN_M73_r4_3c000__04ff_M73_r4_3c000__047c:
  047c  04FF           addr M73_r4_3c000::04ff           
  047e  04C6           addr M73_r4_3c000::04c6           
  0480  .db 04 BA 70 08 70 0A 00 00 70 0C 00 08 00 3B 00 00  ; ..p.p...p....;..
  0490  .db 00 00 64 00 01 00 04 22 04 EA 00 00 00 00 70 0E  ; ..d...."......p.
  04a0  .db 00 5A                                            ; .Z

; ---- function FUN_M73_r4_3c000__04a2
FUN_M73_r4_3c000__04a2:
  04a2  3410           PSHS  X                           
  04a4  8E047C         LDX #0x47c                         ; desc[API_FE6A]: ->$04FF ->$04C6
  04a7  AD9FFE6A       JSR [0xfe6a]                      
  04ab  3510           PULS  X                           
  04ad  39             RTS                               

; ---- function FUN_M73_r4_3c000__04ae
FUN_M73_r4_3c000__04ae:
  04ae  3410           PSHS  X                           
  04b0  8E047C         LDX #0x47c                         ; desc[API_FDBC]: ->$04FF ->$04C6
  04b3  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...|"
  04b7  3510           PULS  X                           
  04b9  39             RTS                               

; ---- function FUN_M73_r4_3c000__04ba
FUN_M73_r4_3c000__04ba:
  04ba  3410           PSHS  X                           
  04bc  8E047C         LDX #0x47c                         ; desc[API_FE6C]: ->$04FF ->$04C6
  04bf  AD9FFE6C       JSR [0xfe6c]                      
  04c3  3510           PULS  X                           
  04c5  39             RTS                               

; ---- function FUN_M73_r4_3c000__04c6
FUN_M73_r4_3c000__04c6:
  04c6  3410           PSHS  X                           
  04c8  8E047C         LDX #0x47c                         ; desc[API_FE6E]: ->$04FF ->$04C6
  04cb  AD9FFE6E       JSR [0xfe6e]                      
  04cf  3510           PULS  X                           
  04d1  39             RTS                               

; ---- function FUN_M73_r4_3c000__04d2
FUN_M73_r4_3c000__04d2:
  04d2  3410           PSHS  X                           
  04d4  8E047C         LDX #0x47c                         ; desc[API_FE1C]: ->$04FF ->$04C6
  04d7  AD9FFE1C       JSR [0xfe1c]                      
  04db  3510           PULS  X                           
  04dd  39             RTS                               

; ---- function FUN_M73_r4_3c000__04de
FUN_M73_r4_3c000__04de:
  04de  3410           PSHS  X                           
  04e0  8E047C         LDX #0x47c                         ; desc[API_FE1A]: ->$04FF ->$04C6 $04BA
  04e3  AD9FFE1A       JSR [0xfe1a]                      
  04e7  3510           PULS  X                           
  04e9  39             RTS                               
  04ea  .db 14 66 6F 72 6D 61 6E 74 20 73 70 65 65 64 3A 20  ; .formant speed: 
  04fa  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M73_r4_3c000__04ff
FUN_M73_r4_3c000__04ff:
  04ff  3476           PSHS  U Y X B A                   
  0501  8E047C         LDX #0x47c                        
  0504  AD9FFE76       JSR [0xfe76]                      
  0508  FC700C         LDD 0x700c                        
  050b  3606           PSHU  B A                         
  050d  AD9FFEC6       JSR [0xfec6]                      
  0511  3706           PULU  A B                         
  0513  FD7076         STD 0x7076                        
  0516  CC000A         LDD #0xa                          
  0519  AD9FFD20       JSR [0xfd20]                      
  051d  108E0140       LDY #0x140                        
  0521  FC7076         LDD 0x7076                        
  0524  AD9FFD2E       JSR [0xfd2e]                      
  0528  CC7FFF         LDD #0x7fff                       
  052b  B37076         SUBD 0x7076                       
  052e  FD7076         STD 0x7076                        
  0531  CC000A         LDD #0xa                          
  0534  AD9FFD20       JSR [0xfd20]                      
  0538  108E0141       LDY #0x141                        
  053c  FC7076         LDD 0x7076                        
  053f  AD9FFD2E       JSR [0xfd2e]                      
  0543  3576           PULS  A B X Y U                   
  0545  39             RTS                               
PTR_FUN_M73_r4_3c000__05c9_M73_r4_3c000__0546:
  0546  05C9           addr M73_r4_3c000::05c9           
  0548  0590           addr M73_r4_3c000::0590           
  054a  .db 05 84 70 10 70 12 00 00 70 14 00 08 00 40 01 00  ; ..p.p...p....@..
  055a  .db 00 00 64 00 01 00 03 23 05 B4 00 00 00 00 70 16  ; ..d....#......p.
  056a  .db 00 42                                            ; .B

; ---- function FUN_M73_r4_3c000__056c
FUN_M73_r4_3c000__056c:
  056c  3410           PSHS  X                           
  056e  8E0546         LDX #0x546                         ; desc[API_FE6A]: ->$05C9 ->$0590
  0571  AD9FFE6A       JSR [0xfe6a]                      
  0575  3510           PULS  X                           
  0577  39             RTS                               

; ---- function FUN_M73_r4_3c000__0578
FUN_M73_r4_3c000__0578:
  0578  3410           PSHS  X                           
  057a  8E0546         LDX #0x546                         ; desc[API_FDBC]: ->$05C9 ->$0590
  057d  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...F"
  0581  3510           PULS  X                           
  0583  39             RTS                               

; ---- function FUN_M73_r4_3c000__0584
FUN_M73_r4_3c000__0584:
  0584  3410           PSHS  X                           
  0586  8E0546         LDX #0x546                         ; desc[API_FE6C]: ->$05C9 ->$0590
  0589  AD9FFE6C       JSR [0xfe6c]                      
  058d  3510           PULS  X                           
  058f  39             RTS                               

; ---- function FUN_M73_r4_3c000__0590
FUN_M73_r4_3c000__0590:
  0590  3410           PSHS  X                           
  0592  8E0546         LDX #0x546                         ; desc[API_FE6E]: ->$05C9 ->$0590
  0595  AD9FFE6E       JSR [0xfe6e]                      
  0599  3510           PULS  X                           
  059b  39             RTS                               

; ---- function FUN_M73_r4_3c000__059c
FUN_M73_r4_3c000__059c:
  059c  3410           PSHS  X                           
  059e  8E0546         LDX #0x546                         ; desc[API_FE1C]: ->$05C9 ->$0590
  05a1  AD9FFE1C       JSR [0xfe1c]                      
  05a5  3510           PULS  X                           
  05a7  39             RTS                               

; ---- function FUN_M73_r4_3c000__05a8
FUN_M73_r4_3c000__05a8:
  05a8  3410           PSHS  X                           
  05aa  8E0546         LDX #0x546                         ; desc[API_FE1A]: ->$05C9 ->$0590 $0584
  05ad  AD9FFE1A       JSR [0xfe1a]                      
  05b1  3510           PULS  X                           
  05b3  39             RTS                               
  05b4  .db 14 65 6E 76 65 6C 6F 70 65 20 73 70 65 65 64 3A  ; .envelope speed:
  05c4  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M73_r4_3c000__05c9
FUN_M73_r4_3c000__05c9:
  05c9  3476           PSHS  U Y X B A                   
  05cb  8E0546         LDX #0x546                        
  05ce  AD9FFE76       JSR [0xfe76]                      
  05d2  FC7014         LDD 0x7014                        
  05d5  3606           PSHU  B A                         
  05d7  AD9FFEC6       JSR [0xfec6]                      
  05db  3706           PULU  A B                         
  05dd  FD7076         STD 0x7076                        
  05e0  CC000A         LDD #0xa                          
  05e3  AD9FFD20       JSR [0xfd20]                      
  05e7  108E0142       LDY #0x142                        
  05eb  FC7076         LDD 0x7076                        
  05ee  AD9FFD2E       JSR [0xfd2e]                      
  05f2  CC7FFF         LDD #0x7fff                       
  05f5  B37076         SUBD 0x7076                       
  05f8  FD7076         STD 0x7076                        
  05fb  CC000A         LDD #0xa                          
  05fe  AD9FFD20       JSR [0xfd20]                      
  0602  108E0143       LDY #0x143                        
  0606  FC7076         LDD 0x7076                        
  0609  AD9FFD2E       JSR [0xfd2e]                      
  060d  3576           PULS  A B X Y U                   
  060f  39             RTS                               
PTR_FUN_M73_r4_3c000__0693_M73_r4_3c000__0610:
  0610  0693           addr M73_r4_3c000::0693           
  0612  065A           addr M73_r4_3c000::065a           
  0614  .db 06 4E 70 22 70 24 00 00 70 26 00 08 00 48 02 00  ; .Np"p$..p&...H..
  0624  .db 00 03 E8 00 01 01 05 22 06 7E 00 00 00 00 70 28  ; .......".~....p(
  0634  .db 00 4A                                            ; .J

; ---- function FUN_M73_r4_3c000__0636
FUN_M73_r4_3c000__0636:
  0636  3410           PSHS  X                           
  0638  8E0610         LDX #0x610                         ; desc[API_FE6A]: ->$0693 ->$065A
  063b  AD9FFE6A       JSR [0xfe6a]                      
  063f  3510           PULS  X                           
  0641  39             RTS                               

; ---- function FUN_M73_r4_3c000__0642
FUN_M73_r4_3c000__0642:
  0642  3410           PSHS  X                           
  0644  8E0610         LDX #0x610                         ; desc[API_FDBC]: ->$0693 ->$065A
  0647  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  064b  3510           PULS  X                           
  064d  39             RTS                               

; ---- function FUN_M73_r4_3c000__064e
FUN_M73_r4_3c000__064e:
  064e  3410           PSHS  X                           
  0650  8E0610         LDX #0x610                         ; desc[API_FE6C]: ->$0693 ->$065A
  0653  AD9FFE6C       JSR [0xfe6c]                      
  0657  3510           PULS  X                           
  0659  39             RTS                               

; ---- function FUN_M73_r4_3c000__065a
FUN_M73_r4_3c000__065a:
  065a  3410           PSHS  X                           
  065c  8E0610         LDX #0x610                         ; desc[API_FE6E]: ->$0693 ->$065A
  065f  AD9FFE6E       JSR [0xfe6e]                      
  0663  3510           PULS  X                           
  0665  39             RTS                               

; ---- function FUN_M73_r4_3c000__0666
FUN_M73_r4_3c000__0666:
  0666  3410           PSHS  X                           
  0668  8E0610         LDX #0x610                         ; desc[API_FE1C]: ->$0693 ->$065A
  066b  AD9FFE1C       JSR [0xfe1c]                      
  066f  3510           PULS  X                           
  0671  39             RTS                               

; ---- function FUN_M73_r4_3c000__0672
FUN_M73_r4_3c000__0672:
  0672  3410           PSHS  X                           
  0674  8E0610         LDX #0x610                         ; desc[API_FE1A]: ->$0693 ->$065A $064E
  0677  AD9FFE1A       JSR [0xfe1a]                      
  067b  3510           PULS  X                           
  067d  39             RTS                               
  067e  .db 14 66 6F 72 6D 61 6E 74 20 73 68 69 66 74 3A 20  ; .formant shift: 
  068e  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M73_r4_3c000__0693
FUN_M73_r4_3c000__0693:
  0693  3476           PSHS  U Y X B A                   
  0695  8E0610         LDX #0x610                        
  0698  AD9FFE76       JSR [0xfe76]                      
  069c  FC7026         LDD 0x7026                        
  069f  47             ASRA                              
  06a0  56             RORB                              
  06a1  3606           PSHU  B A                         
  06a3  AD9FFEC6       JSR [0xfec6]                      
  06a7  3706           PULU  A B                         
  06a9  FD702A         STD 0x702a                        
  06ac  CC000A         LDD #0xa                          
  06af  AD9FFD20       JSR [0xfd20]                      
  06b3  108E0144       LDY #0x144                        
  06b7  FC702A         LDD 0x702a                        
  06ba  AD9FFD2E       JSR [0xfd2e]                      
  06be  3576           PULS  A B X Y U                   
  06c0  39             RTS                               
PTR_FUN_M73_r4_3c000__0744_M73_r4_3c000__06c1:
  06c1  0744           addr M73_r4_3c000::0744           
  06c3  070B           addr M73_r4_3c000::070b           
  06c5  .db 06 FF 70 18 70 1A 00 00 70 1C 00 08 00 44 0C 00  ; ..p.p...p....D..
  06d5  .db 00 00 64 00 01 00 03 23 07 2F 00 00 00 00 70 1E  ; ..d....#./....p.
  06e5  .db 00 46                                            ; .F

; ---- function FUN_M73_r4_3c000__06e7
FUN_M73_r4_3c000__06e7:
  06e7  3410           PSHS  X                           
  06e9  8E06C1         LDX #0x6c1                         ; desc[API_FE6A]: ->$0744 ->$070B
  06ec  AD9FFE6A       JSR [0xfe6a]                      
  06f0  3510           PULS  X                           
  06f2  39             RTS                               

; ---- function FUN_M73_r4_3c000__06f3
FUN_M73_r4_3c000__06f3:
  06f3  3410           PSHS  X                           
  06f5  8E06C1         LDX #0x6c1                         ; desc[API_FDBC]: ->$0744 ->$070B
  06f8  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  06fc  3510           PULS  X                           
  06fe  39             RTS                               

; ---- function FUN_M73_r4_3c000__06ff
FUN_M73_r4_3c000__06ff:
  06ff  3410           PSHS  X                           
  0701  8E06C1         LDX #0x6c1                         ; desc[API_FE6C]: ->$0744 ->$070B
  0704  AD9FFE6C       JSR [0xfe6c]                      
  0708  3510           PULS  X                           
  070a  39             RTS                               

; ---- function FUN_M73_r4_3c000__070b
FUN_M73_r4_3c000__070b:
  070b  3410           PSHS  X                           
  070d  8E06C1         LDX #0x6c1                         ; desc[API_FE6E]: ->$0744 ->$070B
  0710  AD9FFE6E       JSR [0xfe6e]                      
  0714  3510           PULS  X                           
  0716  39             RTS                               

; ---- function FUN_M73_r4_3c000__0717
FUN_M73_r4_3c000__0717:
  0717  3410           PSHS  X                           
  0719  8E06C1         LDX #0x6c1                         ; desc[API_FE1C]: ->$0744 ->$070B
  071c  AD9FFE1C       JSR [0xfe1c]                      
  0720  3510           PULS  X                           
  0722  39             RTS                               

; ---- function FUN_M73_r4_3c000__0723
FUN_M73_r4_3c000__0723:
  0723  3410           PSHS  X                           
  0725  8E06C1         LDX #0x6c1                         ; desc[API_FE1A]: ->$0744 ->$070B $06FF
  0728  AD9FFE1A       JSR [0xfe1a]                      
  072c  3510           PULS  X                           
  072e  39             RTS                               
  072f  .db 14 67 61 74 65 20 74 68 72 65 73 68 6F 6C 64 3A  ; .gate threshold:
  073f  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M73_r4_3c000__0744
FUN_M73_r4_3c000__0744:
  0744  3476           PSHS  U Y X B A                   
  0746  8E06C1         LDX #0x6c1                        
  0749  AD9FFE76       JSR [0xfe76]                      
  074d  FC701C         LDD 0x701c                        
  0750  47             ASRA                              
  0751  56             RORB                              
  0752  47             ASRA                              
  0753  56             RORB                              
  0754  3606           PSHU  B A                         
  0756  AD9FFEC4       JSR [0xfec4]                      
  075a  3706           PULU  A B                         
  075c  FD7020         STD 0x7020                        
  075f  CC0001         LDD #0x1                          
  0762  FD7086         STD 0x7086                        
  0765  3576           PULS  A B X Y U                   
  0767  39             RTS                               
PTR_FUN_M73_r4_3c000__07eb_M73_r4_3c000__0768:
  0768  07EB           addr M73_r4_3c000::07eb           
  076a  07B2           addr M73_r4_3c000::07b2           
  076c  .db 07 A6 70 50 70 52 00 00 70 54 00 08 00 50 03 00  ; ..pPpR..pT...P..
  077c  .db 00 00 64 00 01 00 03 22 07 D6 00 00 00 00 70 56  ; ..d...."......pV
  078c  .db 00 52                                            ; .R

; ---- function FUN_M73_r4_3c000__078e
FUN_M73_r4_3c000__078e:
  078e  3410           PSHS  X                           
  0790  8E0768         LDX #0x768                         ; desc[API_FE6A]: ->$07EB ->$07B2
  0793  AD9FFE6A       JSR [0xfe6a]                      
  0797  3510           PULS  X                           
  0799  39             RTS                               

; ---- function FUN_M73_r4_3c000__079a
FUN_M73_r4_3c000__079a:
  079a  3410           PSHS  X                           
  079c  8E0768         LDX #0x768                         ; desc[API_FDBC]: ->$07EB ->$07B2
  079f  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...h"
  07a3  3510           PULS  X                           
  07a5  39             RTS                               

; ---- function FUN_M73_r4_3c000__07a6
FUN_M73_r4_3c000__07a6:
  07a6  3410           PSHS  X                           
  07a8  8E0768         LDX #0x768                         ; desc[API_FE6C]: ->$07EB ->$07B2
  07ab  AD9FFE6C       JSR [0xfe6c]                      
  07af  3510           PULS  X                           
  07b1  39             RTS                               

; ---- function FUN_M73_r4_3c000__07b2
FUN_M73_r4_3c000__07b2:
  07b2  3410           PSHS  X                           
  07b4  8E0768         LDX #0x768                         ; desc[API_FE6E]: ->$07EB ->$07B2
  07b7  AD9FFE6E       JSR [0xfe6e]                      
  07bb  3510           PULS  X                           
  07bd  39             RTS                               

; ---- function FUN_M73_r4_3c000__07be
FUN_M73_r4_3c000__07be:
  07be  3410           PSHS  X                           
  07c0  8E0768         LDX #0x768                         ; desc[API_FE1C]: ->$07EB ->$07B2
  07c3  AD9FFE1C       JSR [0xfe1c]                      
  07c7  3510           PULS  X                           
  07c9  39             RTS                               

; ---- function FUN_M73_r4_3c000__07ca
FUN_M73_r4_3c000__07ca:
  07ca  3410           PSHS  X                           
  07cc  8E0768         LDX #0x768                         ; desc[API_FE1A]: ->$07EB ->$07B2 $07A6
  07cf  AD9FFE1A       JSR [0xfe1a]                      
  07d3  3510           PULS  X                           
  07d5  39             RTS                               
  07d6  .db 14 73 74 65 72 65 6F 20 64 65 70 74 68 3A 20 20  ; .stereo depth:  
  07e6  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M73_r4_3c000__07eb
FUN_M73_r4_3c000__07eb:
  07eb  3476           PSHS  U Y X B A                   
  07ed  8E0768         LDX #0x768                        
  07f0  AD9FFE76       JSR [0xfe76]                      
  07f4  FC7054         LDD 0x7054                        
  07f7  3606           PSHU  B A                         
  07f9  AD9FFEC4       JSR [0xfec4]                      
  07fd  3706           PULU  A B                         
  07ff  FD7076         STD 0x7076                        
  0802  CC000A         LDD #0xa                          
  0805  AD9FFD20       JSR [0xfd20]                      
  0809  108E0146       LDY #0x146                        
  080d  FC7076         LDD 0x7076                        
  0810  AD9FFD2E       JSR [0xfd2e]                      
  0814  3576           PULS  A B X Y U                   
  0816  39             RTS                               
PTR_FUN_M73_r4_3c000__089a_M73_r4_3c000__0817:
  0817  089A           addr M73_r4_3c000::089a           
  0819  0861           addr M73_r4_3c000::0861           
  081b  .db 08 55 70 48 70 4A 00 00 70 4C 00 08 00 4C 04 00  ; .UpHpJ..pL...L..
  082b  .db 00 00 64 00 01 01 04 21 08 85 00 00 00 00 70 4E  ; ..d....!......pN
  083b  .db 00 4E                                            ; .N

; ---- function FUN_M73_r4_3c000__083d
FUN_M73_r4_3c000__083d:
  083d  3410           PSHS  X                           
  083f  8E0817         LDX #0x817                         ; desc[API_FE6A]: ->$089A ->$0861
  0842  AD9FFE6A       JSR [0xfe6a]                      
  0846  3510           PULS  X                           
  0848  39             RTS                               

; ---- function FUN_M73_r4_3c000__0849
FUN_M73_r4_3c000__0849:
  0849  3410           PSHS  X                           
  084b  8E0817         LDX #0x817                         ; desc[API_FDBC]: ->$089A ->$0861
  084e  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0852  3510           PULS  X                           
  0854  39             RTS                               

; ---- function FUN_M73_r4_3c000__0855
FUN_M73_r4_3c000__0855:
  0855  3410           PSHS  X                           
  0857  8E0817         LDX #0x817                         ; desc[API_FE6C]: ->$089A ->$0861
  085a  AD9FFE6C       JSR [0xfe6c]                      
  085e  3510           PULS  X                           
  0860  39             RTS                               

; ---- function FUN_M73_r4_3c000__0861
FUN_M73_r4_3c000__0861:
  0861  3410           PSHS  X                           
  0863  8E0817         LDX #0x817                         ; desc[API_FE6E]: ->$089A ->$0861
  0866  AD9FFE6E       JSR [0xfe6e]                      
  086a  3510           PULS  X                           
  086c  39             RTS                               

; ---- function FUN_M73_r4_3c000__086d
FUN_M73_r4_3c000__086d:
  086d  3410           PSHS  X                           
  086f  8E0817         LDX #0x817                         ; desc[API_FE1C]: ->$089A ->$0861
  0872  AD9FFE1C       JSR [0xfe1c]                      
  0876  3510           PULS  X                           
  0878  39             RTS                               

; ---- function FUN_M73_r4_3c000__0879
FUN_M73_r4_3c000__0879:
  0879  3410           PSHS  X                           
  087b  8E0817         LDX #0x817                         ; desc[API_FE1A]: ->$089A ->$0861 $0855
  087e  AD9FFE1A       JSR [0xfe1a]                      
  0882  3510           PULS  X                           
  0884  39             RTS                               
  0885  .db 14 73 74 65 72 65 6F 20 77 69 64 74 68 3A 20 20  ; .stereo width:  
  0895  .db 20 20 20 6D 73                                   ;    ms

; ---- function FUN_M73_r4_3c000__089a
FUN_M73_r4_3c000__089a:
  089a  3476           PSHS  U Y X B A                   
  089c  8E0817         LDX #0x817                        
  089f  AD9FFE76       JSR [0xfe76]                      
  08a3  FC704C         LDD 0x704c                        
  08a6  3606           PSHU  B A                         
  08a8  AD9FFECC       JSR [0xfecc]                      
  08ac  3706           PULU  A B                         
  08ae  FD7076         STD 0x7076                        
  08b1  CC000A         LDD #0xa                          
  08b4  AD9FFD20       JSR [0xfd20]                      
  08b8  108E0145       LDY #0x145                        
  08bc  FC7076         LDD 0x7076                        
  08bf  AD9FFD2E       JSR [0xfd2e]                      
  08c3  3576           PULS  A B X Y U                   
  08c5  39             RTS                               
PTR_FUN_M73_r4_3c000__0949_M73_r4_3c000__08c6:
  08c6  0949           addr M73_r4_3c000::0949           
  08c8  0910           addr M73_r4_3c000::0910           
  08ca  .db 09 04 70 40 70 42 00 00 70 44 00 08 00 3D 01 FF  ; ..p@pB..pD...=..
  08da  .db 9C 00 64 00 01 00 04 1F 09 34 00 00 00 00 70 46  ; ..d......4....pF
  08ea  .db 00 5C                                            ; .\

; ---- function FUN_M73_r4_3c000__08ec
FUN_M73_r4_3c000__08ec:
  08ec  3410           PSHS  X                           
  08ee  8E08C6         LDX #0x8c6                         ; desc[API_FE6A]: ->$0949 ->$0910
  08f1  AD9FFE6A       JSR [0xfe6a]                      
  08f5  3510           PULS  X                           
  08f7  39             RTS                               

; ---- function FUN_M73_r4_3c000__08f8
FUN_M73_r4_3c000__08f8:
  08f8  3410           PSHS  X                           
  08fa  8E08C6         LDX #0x8c6                         ; desc[API_FDBC]: ->$0949 ->$0910
  08fd  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0901  3510           PULS  X                           
  0903  39             RTS                               

; ---- function FUN_M73_r4_3c000__0904
FUN_M73_r4_3c000__0904:
  0904  3410           PSHS  X                           
  0906  8E08C6         LDX #0x8c6                         ; desc[API_FE6C]: ->$0949 ->$0910
  0909  AD9FFE6C       JSR [0xfe6c]                      
  090d  3510           PULS  X                           
  090f  39             RTS                               

; ---- function FUN_M73_r4_3c000__0910
FUN_M73_r4_3c000__0910:
  0910  3410           PSHS  X                           
  0912  8E08C6         LDX #0x8c6                         ; desc[API_FE6E]: ->$0949 ->$0910
  0915  AD9FFE6E       JSR [0xfe6e]                      
  0919  3510           PULS  X                           
  091b  39             RTS                               

; ---- function FUN_M73_r4_3c000__091c
FUN_M73_r4_3c000__091c:
  091c  3410           PSHS  X                           
  091e  8E08C6         LDX #0x8c6                         ; desc[API_FE1C]: ->$0949 ->$0910
  0921  AD9FFE1C       JSR [0xfe1c]                      
  0925  3510           PULS  X                           
  0927  39             RTS                               

; ---- function FUN_M73_r4_3c000__0928
FUN_M73_r4_3c000__0928:
  0928  3410           PSHS  X                           
  092a  8E08C6         LDX #0x8c6                         ; desc[API_FE1A]: ->$0949 ->$0910 $0904
  092d  AD9FFE1A       JSR [0xfe1a]                      
  0931  3510           PULS  X                           
  0933  39             RTS                               
  0934  .db 14 66 69 6C 74 65 72 20 73 70 65 65 64 3A 20 20  ; .filter speed:  
  0944  .db 20 20 20 25 20                                   ;    % 

; ---- function FUN_M73_r4_3c000__0949
FUN_M73_r4_3c000__0949:
  0949  3476           PSHS  U Y X B A                   
  094b  8E08C6         LDX #0x8c6                        
  094e  AD9FFE76       JSR [0xfe76]                      
  0952  FC7044         LDD 0x7044                        
  0955  3606           PSHU  B A                         
  0957  AD9FFEC4       JSR [0xfec4]                      
  095b  3706           PULU  A B                         
  095d  FD7076         STD 0x7076                        
  0960  3576           PULS  A B X Y U                   
  0962  39             RTS                               
PTR_FUN_M73_r4_3c000__09ce_M73_r4_3c000__0963:
  0963  09CE           addr M73_r4_3c000::09ce           
  0965  09AD           addr M73_r4_3c000::09ad           
  0967  .db 09 A1 70 2C 70 2E 00 00 70 30 00 08 00 54 0A 00  ; ..p,p...p0...T..
  0977  .db 00 03 E8 00 01 01 05 22 09 B9 00 00 00 00 00 00  ; ......."........
  0987  .db 00 00                                            ; ..

; ---- function FUN_M73_r4_3c000__0989
FUN_M73_r4_3c000__0989:
  0989  3410           PSHS  X                           
  098b  8E0963         LDX #0x963                         ; desc[API_FE6A]: ->$09CE ->$09AD
  098e  AD9FFE6A       JSR [0xfe6a]                      
  0992  3510           PULS  X                           
  0994  39             RTS                               

; ---- function FUN_M73_r4_3c000__0995
FUN_M73_r4_3c000__0995:
  0995  3410           PSHS  X                           
  0997  8E0963         LDX #0x963                         ; desc[API_FDBC]: ->$09CE ->$09AD
  099a  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...c"
  099e  3510           PULS  X                           
  09a0  39             RTS                               

; ---- function FUN_M73_r4_3c000__09a1
FUN_M73_r4_3c000__09a1:
  09a1  3410           PSHS  X                           
  09a3  8E0963         LDX #0x963                         ; desc[API_FE6C]: ->$09CE ->$09AD
  09a6  AD9FFE6C       JSR [0xfe6c]                      
  09aa  3510           PULS  X                           
  09ac  39             RTS                               

; ---- function FUN_M73_r4_3c000__09ad
FUN_M73_r4_3c000__09ad:
  09ad  3410           PSHS  X                           
  09af  8E0963         LDX #0x963                         ; desc[API_FE6E]: ->$09CE ->$09AD
  09b2  AD9FFE6E       JSR [0xfe6e]                      
  09b6  3510           PULS  X                           
  09b8  39             RTS                               
  09b9  .db 14 6D 61 78 20 72 65 73 6F 6E 61 6E 63 65 3A 20  ; .max resonance: 
  09c9  .db 20 20 20 20 25                                   ;     %

; ---- function FUN_M73_r4_3c000__09ce
FUN_M73_r4_3c000__09ce:
  09ce  3476           PSHS  U Y X B A                   
  09d0  8E0963         LDX #0x963                        
  09d3  AD9FFE76       JSR [0xfe76]                      
  09d7  FC7030         LDD 0x7030                        
  09da  3606           PSHU  B A                         
  09dc  AD9FFEC6       JSR [0xfec6]                      
  09e0  3706           PULU  A B                         
  09e2  FD7034         STD 0x7034                        
  09e5  CC0001         LDD #0x1                          
  09e8  FD7086         STD 0x7086                        
  09eb  3576           PULS  A B X Y U                   
  09ed  39             RTS                               
PTR_FUN_M73_r4_3c000__0a59_M73_r4_3c000__09ee:
  09ee  0A59           addr M73_r4_3c000::0a59           
  09f0  0A38           addr M73_r4_3c000::0a38           
  09f2  .db 0A 2C 70 36 70 38 00 00 70 3A 00 08 00 56 0B 00  ; .,p6p8..p:...V..
  0a02  .db 00 03 E8 00 01 01 05 1E 0A 44 00 00 00 00 00 00  ; .........D......
  0a12  .db 00 00                                            ; ..

; ---- function FUN_M73_r4_3c000__0a14
FUN_M73_r4_3c000__0a14:
  0a14  3410           PSHS  X                           
  0a16  8E09EE         LDX #0x9ee                         ; desc[API_FE6A]: ->$0A59 ->$0A38
  0a19  AD9FFE6A       JSR [0xfe6a]                      
  0a1d  3510           PULS  X                           
  0a1f  39             RTS                               

; ---- function FUN_M73_r4_3c000__0a20
FUN_M73_r4_3c000__0a20:
  0a20  3410           PSHS  X                           
  0a22  8E09EE         LDX #0x9ee                         ; desc[API_FDBC]: ->$0A59 ->$0A38
  0a25  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...."
  0a29  3510           PULS  X                           
  0a2b  39             RTS                               

; ---- function FUN_M73_r4_3c000__0a2c
FUN_M73_r4_3c000__0a2c:
  0a2c  3410           PSHS  X                           
  0a2e  8E09EE         LDX #0x9ee                         ; desc[API_FE6C]: ->$0A59 ->$0A38
  0a31  AD9FFE6C       JSR [0xfe6c]                      
  0a35  3510           PULS  X                           
  0a37  39             RTS                               

; ---- function FUN_M73_r4_3c000__0a38
FUN_M73_r4_3c000__0a38:
  0a38  3410           PSHS  X                           
  0a3a  8E09EE         LDX #0x9ee                         ; desc[API_FE6E]: ->$0A59 ->$0A38
  0a3d  AD9FFE6E       JSR [0xfe6e]                      
  0a41  3510           PULS  X                           
  0a43  39             RTS                               
  0a44  .db 14 6D 69 6E 20 65 72 72 6F 72 3A 20 20 20 20 20  ; .min error:     
  0a54  .db 20 25 20 20 20                                   ;  %   

; ---- function FUN_M73_r4_3c000__0a59
FUN_M73_r4_3c000__0a59:
  0a59  3476           PSHS  U Y X B A                   
  0a5b  8E09EE         LDX #0x9ee                        
  0a5e  AD9FFE76       JSR [0xfe76]                      
  0a62  FC703A         LDD 0x703a                        
  0a65  3606           PSHU  B A                         
  0a67  AD9FFEC6       JSR [0xfec6]                      
  0a6b  3706           PULU  A B                         
  0a6d  FD703E         STD 0x703e                        
  0a70  CC0001         LDD #0x1                          
  0a73  FD7086         STD 0x7086                        
  0a76  3576           PULS  A B X Y U                   
  0a78  39             RTS                               
PTR_FUN_M73_r4_3c000__0afc_M73_r4_3c000__0a79:
  0a79  0AFC           addr M73_r4_3c000::0afc           
  0a7b  0AC3           addr M73_r4_3c000::0ac3           
  0a7d  .db 0A B7 70 00 70 02 00 00 70 04 00 08 00 39 05 00  ; ..p.p...p....9..
  0a8d  .db 00 00 64 00 01 00 03 19 0A E7 00 00 00 00 70 06  ; ..d...........p.
  0a9d  .db 00 58                                            ; .X

; ---- function FUN_M73_r4_3c000__0a9f
FUN_M73_r4_3c000__0a9f:
  0a9f  3410           PSHS  X                           
  0aa1  8E0A79         LDX #0xa79                         ; desc[API_FE6A]: ->$0AFC ->$0AC3
  0aa4  AD9FFE6A       JSR [0xfe6a]                      
  0aa8  3510           PULS  X                           
  0aaa  39             RTS                               

; ---- function FUN_M73_r4_3c000__0aab
FUN_M73_r4_3c000__0aab:
  0aab  3410           PSHS  X                           
  0aad  8E0A79         LDX #0xa79                         ; desc[API_FDBC]: ->$0AFC ->$0AC3
  0ab0  AD9FFDBC       JSR [0xfdbc]                       ; inline[API_FDBC]: "5.94...y"
  0ab4  3510           PULS  X                           
  0ab6  39             RTS                               

; ---- function FUN_M73_r4_3c000__0ab7
FUN_M73_r4_3c000__0ab7:
  0ab7  3410           PSHS  X                           
  0ab9  8E0A79         LDX #0xa79                         ; desc[API_FE6C]: ->$0AFC ->$0AC3
  0abc  AD9FFE6C       JSR [0xfe6c]                      
  0ac0  3510           PULS  X                           
  0ac2  39             RTS                               

; ---- function FUN_M73_r4_3c000__0ac3
FUN_M73_r4_3c000__0ac3:
  0ac3  3410           PSHS  X                           
  0ac5  8E0A79         LDX #0xa79                         ; desc[API_FE6E]: ->$0AFC ->$0AC3
  0ac8  AD9FFE6E       JSR [0xfe6e]                      
  0acc  3510           PULS  X                           
  0ace  39             RTS                               

; ---- function FUN_M73_r4_3c000__0acf
FUN_M73_r4_3c000__0acf:
  0acf  3410           PSHS  X                           
  0ad1  8E0A79         LDX #0xa79                         ; desc[API_FE1C]: ->$0AFC ->$0AC3
  0ad4  AD9FFE1C       JSR [0xfe1c]                      
  0ad8  3510           PULS  X                           
  0ada  39             RTS                               

; ---- function FUN_M73_r4_3c000__0adb
FUN_M73_r4_3c000__0adb:
  0adb  3410           PSHS  X                           
  0add  8E0A79         LDX #0xa79                         ; desc[API_FE1A]: ->$0AFC ->$0AC3 $0AB7
  0ae0  AD9FFE1A       JSR [0xfe1a]                      
  0ae4  3510           PULS  X                           
  0ae6  39             RTS                               
  0ae7  .db 14 6D 69 78 3A 20 20 20 20 20 25 20 77 65 74 20  ; .mix:     % wet 
  0af7  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M73_r4_3c000__0afc
FUN_M73_r4_3c000__0afc:
  0afc  3476           PSHS  U Y X B A                   
  0afe  8E0A79         LDX #0xa79                        
  0b01  AD9FFE76       JSR [0xfe76]                      
  0b05  CC0064         LDD #0x64                         
  0b08  B37004         SUBD 0x7004                       
  0b0b  3606           PSHU  B A                         
  0b0d  58             LSLB                              
  0b0e  49             ROLA                              
  0b0f  FD7076         STD 0x7076                        
  0b12  CC4666         LDD #0x4666                       
  0b15  3606           PSHU  B A                         
  0b17  AD9FFCF2       JSR [0xfcf2]                      
  0b1b  3706           PULU  A B                         
  0b1d  F37076         ADDD 0x7076                       
  0b20  AD9FFC6A       JSR [0xfc6a]                      
  0b24  AD9FFC72       JSR [0xfc72]                      
  0b28  3576           PULS  A B X Y U                   
  0b2a  39             RTS                               
PTR_FUN_M73_r4_3c000__0b96_M73_r4_3c000__0b2b:
  0b2b  0B96           addr M73_r4_3c000::0b96           
  0b2d  0B75           addr M73_r4_3c000::0b75           
  0b2f  .db 0B 69 70 5E 70 60 00 00 70 62 00 08 00 21 06 FF  ; .ip^p`..pb...!..
  0b3f  .db D0 00 30 00 01 00 03 1C 0B 81 00 00 00 00 00 00  ; ..0.............
  0b4f  .db 00 00                                            ; ..

; ---- function FUN_M73_r4_3c000__0b51
FUN_M73_r4_3c000__0b51:
  0b51  3410           PSHS  X                           
  0b53  8E0B2B         LDX #0xb2b                        
  0b56  AD9FFE74       JSR [0xfe74]                      
  0b5a  3510           PULS  X                           
  0b5c  39             RTS                               

; ---- function FUN_M73_r4_3c000__0b5d
FUN_M73_r4_3c000__0b5d:
  0b5d  3410           PSHS  X                           
  0b5f  8E0B2B         LDX #0xb2b                         ; desc[API_FE22]: ->$0B96 ->$0B75
  0b62  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0b66  3510           PULS  X                           
  0b68  39             RTS                               

; ---- function FUN_M73_r4_3c000__0b69
FUN_M73_r4_3c000__0b69:
  0b69  3410           PSHS  X                           
  0b6b  8E0B2B         LDX #0xb2b                        
  0b6e  AD9FFE70       JSR [0xfe70]                      
  0b72  3510           PULS  X                           
  0b74  39             RTS                               

; ---- function FUN_M73_r4_3c000__0b75
FUN_M73_r4_3c000__0b75:
  0b75  3410           PSHS  X                           
  0b77  8E0B2B         LDX #0xb2b                        
  0b7a  AD9FFE72       JSR [0xfe72]                      
  0b7e  3510           PULS  X                           
  0b80  39             RTS                               
  0b81  .db 14 6C 65 66 74 20 69 6E 3A 20 20 20 20 64 42 20  ; .left in:    dB 
  0b91  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M73_r4_3c000__0b96
FUN_M73_r4_3c000__0b96:
  0b96  3476           PSHS  U Y X B A                   
  0b98  8E0B2B         LDX #0xb2b                        
  0b9b  AD9FFE76       JSR [0xfe76]                      
  0b9f  AD9FFE52       JSR [0xfe52]                      
  0ba3  3576           PULS  A B X Y U                   
  0ba5  39             RTS                               
PTR_FUN_M73_r4_3c000__0c11_M73_r4_3c000__0ba6:
  0ba6  0C11           addr M73_r4_3c000::0c11           
  0ba8  0BF0           addr M73_r4_3c000::0bf0           
  0baa  .db 0B E4 70 6A 70 6C 00 00 70 6E 00 08 00 22 07 FF  ; ..pjpl..pn..."..
  0bba  .db D0 00 30 00 01 00 03 1D 0B FC 00 00 00 00 00 00  ; ..0.............
  0bca  .db 00 00                                            ; ..

; ---- function FUN_M73_r4_3c000__0bcc
FUN_M73_r4_3c000__0bcc:
  0bcc  3410           PSHS  X                           
  0bce  8E0BA6         LDX #0xba6                        
  0bd1  AD9FFE74       JSR [0xfe74]                      
  0bd5  3510           PULS  X                           
  0bd7  39             RTS                               

; ---- function FUN_M73_r4_3c000__0bd8
FUN_M73_r4_3c000__0bd8:
  0bd8  3410           PSHS  X                           
  0bda  8E0BA6         LDX #0xba6                         ; desc[API_FE22]: ->$0C11 ->$0BF0
  0bdd  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0be1  3510           PULS  X                           
  0be3  39             RTS                               

; ---- function FUN_M73_r4_3c000__0be4
FUN_M73_r4_3c000__0be4:
  0be4  3410           PSHS  X                           
  0be6  8E0BA6         LDX #0xba6                        
  0be9  AD9FFE70       JSR [0xfe70]                      
  0bed  3510           PULS  X                           
  0bef  39             RTS                               

; ---- function FUN_M73_r4_3c000__0bf0
FUN_M73_r4_3c000__0bf0:
  0bf0  3410           PSHS  X                           
  0bf2  8E0BA6         LDX #0xba6                        
  0bf5  AD9FFE72       JSR [0xfe72]                      
  0bf9  3510           PULS  X                           
  0bfb  39             RTS                               
  0bfc  .db 14 72 69 67 68 74 20 69 6E 3A 20 20 20 20 64 42  ; .right in:    dB
  0c0c  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M73_r4_3c000__0c11
FUN_M73_r4_3c000__0c11:
  0c11  3476           PSHS  U Y X B A                   
  0c13  8E0BA6         LDX #0xba6                        
  0c16  AD9FFE76       JSR [0xfe76]                      
  0c1a  AD9FFE54       JSR [0xfe54]                      
  0c1e  3576           PULS  A B X Y U                   
  0c20  39             RTS                               
PTR_FUN_M73_r4_3c000__0c8c_M73_r4_3c000__0c21:
  0c21  0C8C           addr M73_r4_3c000::0c8c           
  0c23  0C6B           addr M73_r4_3c000::0c6b           
  0c25  .db 0C 5F 70 64 70 66 00 00 70 68 00 08 00 23 08 FF  ; ._pdpf..ph...#..
  0c35  .db D0 00 30 00 01 00 03 1D 0C 77 00 00 00 00 00 00  ; ..0......w......
  0c45  .db 00 00                                            ; ..

; ---- function FUN_M73_r4_3c000__0c47
FUN_M73_r4_3c000__0c47:
  0c47  3410           PSHS  X                           
  0c49  8E0C21         LDX #0xc21                        
  0c4c  AD9FFE74       JSR [0xfe74]                      
  0c50  3510           PULS  X                           
  0c52  39             RTS                               

; ---- function FUN_M73_r4_3c000__0c53
FUN_M73_r4_3c000__0c53:
  0c53  3410           PSHS  X                           
  0c55  8E0C21         LDX #0xc21                         ; desc[API_FE22]: ->$0C8C ->$0C6B
  0c58  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0c5c  3510           PULS  X                           
  0c5e  39             RTS                               

; ---- function FUN_M73_r4_3c000__0c5f
FUN_M73_r4_3c000__0c5f:
  0c5f  3410           PSHS  X                           
  0c61  8E0C21         LDX #0xc21                        
  0c64  AD9FFE70       JSR [0xfe70]                      
  0c68  3510           PULS  X                           
  0c6a  39             RTS                               

; ---- function FUN_M73_r4_3c000__0c6b
FUN_M73_r4_3c000__0c6b:
  0c6b  3410           PSHS  X                           
  0c6d  8E0C21         LDX #0xc21                        
  0c70  AD9FFE72       JSR [0xfe72]                      
  0c74  3510           PULS  X                           
  0c76  39             RTS                               
  0c77  .db 14 6C 65 66 74 20 6F 75 74 3A 20 20 20 20 64 42  ; .left out:    dB
  0c87  .db 20 20 20 20 20                                   ;      

; ---- function FUN_M73_r4_3c000__0c8c
FUN_M73_r4_3c000__0c8c:
  0c8c  3476           PSHS  U Y X B A                   
  0c8e  8E0C21         LDX #0xc21                        
  0c91  AD9FFE76       JSR [0xfe76]                      
  0c95  AD9FFE56       JSR [0xfe56]                      
  0c99  3576           PULS  A B X Y U                   
  0c9b  39             RTS                               
PTR_FUN_M73_r4_3c000__0d07_M73_r4_3c000__0c9c:
  0c9c  0D07           addr M73_r4_3c000::0d07           
  0c9e  0CE6           addr M73_r4_3c000::0ce6           
  0ca0  .db 0C DA 70 70 70 72 00 00 70 74 00 08 00 24 09 FF  ; ..pppr..pt...$..
  0cb0  .db D0 00 30 00 01 00 03 1E 0C F2 00 00 00 00 00 00  ; ..0.............
  0cc0  .db 00 00                                            ; ..

; ---- function FUN_M73_r4_3c000__0cc2
FUN_M73_r4_3c000__0cc2:
  0cc2  3410           PSHS  X                           
  0cc4  8E0C9C         LDX #0xc9c                        
  0cc7  AD9FFE74       JSR [0xfe74]                      
  0ccb  3510           PULS  X                           
  0ccd  39             RTS                               

; ---- function FUN_M73_r4_3c000__0cce
FUN_M73_r4_3c000__0cce:
  0cce  3410           PSHS  X                           
  0cd0  8E0C9C         LDX #0xc9c                         ; desc[API_FE22]: ->$0D07 ->$0CE6
  0cd3  AD9FFE22       JSR [0xfe22]                       ; inline[API_FE22]: $3510 39
  0cd7  3510           PULS  X                           
  0cd9  39             RTS                               

; ---- function FUN_M73_r4_3c000__0cda
FUN_M73_r4_3c000__0cda:
  0cda  3410           PSHS  X                           
  0cdc  8E0C9C         LDX #0xc9c                        
  0cdf  AD9FFE70       JSR [0xfe70]                      
  0ce3  3510           PULS  X                           
  0ce5  39             RTS                               

; ---- function FUN_M73_r4_3c000__0ce6
FUN_M73_r4_3c000__0ce6:
  0ce6  3410           PSHS  X                           
  0ce8  8E0C9C         LDX #0xc9c                        
  0ceb  AD9FFE72       JSR [0xfe72]                      
  0cef  3510           PULS  X                           
  0cf1  39             RTS                               
  0cf2  .db 14 72 69 67 68 74 20 6F 75 74 3A 20 20 20 20 64  ; .right out:    d
  0d02  .db 42 20 20 20 20                                   ; B    

; ---- function FUN_M73_r4_3c000__0d07
FUN_M73_r4_3c000__0d07:
  0d07  3476           PSHS  U Y X B A                   
  0d09  8E0C9C         LDX #0xc9c                        
  0d0c  AD9FFE76       JSR [0xfe76]                      
  0d10  AD9FFE58       JSR [0xfe58]                      
  0d14  3576           PULS  A B X Y U                   
  0d16  39             RTS                               

; ---- function FUN_M73_r4_3c000__0d17
FUN_M73_r4_3c000__0d17:
  0d17  3436           PSHS  Y X B A                     
  0d19  3401           PSHS  CC                          
  0d1b  AD9FFC54       JSR [0xfc54]                      
  0d1f  FC7086         LDD 0x7086                        
  0d22  2715           BEQ 0x0d39                        
  0d24  CC0D46         LDD #0xd46                        
  0d27  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  0d2b  6013           addr 6013                         
LAB_M73_r4_3c000__0d2d:
  0d2d  AD9FFC56       JSR [0xfc56]                      
  0d31  3501           PULS CC                           
  0d33  3536           PULS  A B X Y                     
  0d35  3261           LEAS 0x1,S                        
  0d37  3580           PULS  PC                          
LAB_M73_r4_3c000__0d39:
  0d39  AD9FFD76       JSR [0xfd76]                      
  0d3d  AD9FFC56       JSR [0xfc56]                      
  0d41  3501           PULS CC                           
  0d43  3536           PULS  A B X Y                     
  0d45  3B             RTI                               

; ---- function FUN_M73_r4_3c000__0d46
FUN_M73_r4_3c000__0d46:
  0d46  3436           PSHS  Y X B A                     
  0d48  CC000A         LDD #0xa                          
  0d4b  AD9FFD20       JSR [0xfd20]                      
  0d4f  108E0144       LDY #0x144                        
  0d53  FC702A         LDD 0x702a                        
  0d56  AD9FFD2E       JSR [0xfd2e]                      
  0d5a  CC000A         LDD #0xa                          
  0d5d  AD9FFD20       JSR [0xfd20]                      
  0d61  108E0478       LDY #0x478                        
  0d65  FC7020         LDD 0x7020                        
  0d68  AD9FFD2E       JSR [0xfd2e]                      
  0d6c  CC000A         LDD #0xa                          
  0d6f  AD9FFD20       JSR [0xfd20]                      
  0d73  108E047A       LDY #0x47a                        
  0d77  FC7034         LDD 0x7034                        
  0d7a  AD9FFD2E       JSR [0xfd2e]                      
  0d7e  CC000A         LDD #0xa                          
  0d81  AD9FFD20       JSR [0xfd20]                      
  0d85  108E047B       LDY #0x47b                        
  0d89  FC703E         LDD 0x703e                        
  0d8c  AD9FFD2E       JSR [0xfd2e]                      
  0d90  CC047B         LDD #0x47b                        
  0d93  AD9FFC62       JSR [0xfc62]                       ; inline[API_FC62]: $6013
  0d97  6013           addr 6013                         
LAB_M73_r4_3c000__0d99:
  0d99  CC0000         LDD #0x0                          
  0d9c  FD7086         STD 0x7086                        
  0d9f  AD9FFD76       JSR [0xfd76]                      
  0da3  1CBF           ANDCC #0xbf                       
  0da5  3536           PULS  A B X Y                     
  0da7  39             RTS                               

;; TMS32010 program 73 for DSP 1: 784 words loaded at $800 (written via bank latch $81)
DSPPROG_73_DSP1_hdr:
  0da8  7310062A0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_73_DSP1:
  0db0  08007F8B6E00.. dw[785]                           

;; TMS32010 program 73 for DSP 2: 460 words loaded at $800 (written via bank latch $82)
DSPPROG_73_DSP2_hdr:
  13d2  731103A20000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_73_DSP2:
  13da  08007F8B6E00.. dw[461]                           

;; TMS32010 program 73 for DSP 3: 1431 words loaded at $800 (written via bank latch $83)
DSPPROG_73_DSP3_hdr:
  1774  73120B380000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
DSPPROG_73_DSP3:
  177c  08007F8B6E00.. dw[1432]                          

;; End of record chain
END_OF_CHAIN_hdr:
  22ac  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  22b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2304  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2314  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2324  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2334  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2344  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2354  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2364  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2374  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2384  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2394  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2404  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2414  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2424  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2434  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2444  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2454  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2464  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2474  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2484  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2494  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2504  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2514  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2524  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2534  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2544  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2554  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2564  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2574  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2584  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2594  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2604  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2614  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2624  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2634  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2644  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2654  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2664  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2674  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2684  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2694  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2704  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2714  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2724  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2734  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2744  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2754  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2764  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2774  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2784  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2794  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2804  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2814  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2824  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2834  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2844  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2854  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2864  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2874  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2884  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2894  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2904  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2914  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2924  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2934  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2944  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2954  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2964  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2974  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2984  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2994  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2aa4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ab4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ac4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ad4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ae4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2af4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ba4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2be4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bf4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ca4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ce4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cf4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2da4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2db4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2de4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2df4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ea4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2eb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ec4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ed4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ee4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ef4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fa4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fe4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ff4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3004  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3014  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3024  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3034  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3044  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3054  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3064  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3074  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3084  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3094  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3104  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3114  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3124  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3134  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3144  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3154  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3164  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3174  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3184  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3194  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3204  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3214  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3224  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3234  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3244  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3254  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3264  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3274  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3284  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3294  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3304  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3314  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3324  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3334  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3344  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3354  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3364  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3374  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3384  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3394  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3404  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3414  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3424  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3434  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3444  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3454  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3464  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3474  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3484  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3494  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3504  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3514  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3524  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3534  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3544  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3554  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3564  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3574  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3584  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3594  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3604  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3614  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3624  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3634  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3644  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3654  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3664  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3674  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3684  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3694  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3704  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3714  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3724  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3734  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3744  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3754  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3764  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3774  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3784  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3794  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3804  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3814  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3824  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3834  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3844  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3854  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3864  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3874  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3884  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3894  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3904  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3914  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3924  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3934  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3944  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3954  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3964  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3974  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3984  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3994  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39a4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39b4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39c4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39d4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39e4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39f4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aa4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ab4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ac4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ad4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ae4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3af4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ba4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3be4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bf4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ca4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ce4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cf4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3da4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3db4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3de4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3df4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ea4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ec4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ed4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ee4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ef4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f04  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f14  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f24  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f34  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f44  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f54  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f64  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f74  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f84  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f94  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fa4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fb4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fc4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fd4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fe4  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ff4  .db FF FF FF FF FF FF FF FF FF FF FF B7              ; ............
