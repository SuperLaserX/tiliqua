; H3500  block MF8_r1_08000  MF8_r1_08000::0000-MF8_r1_08000::3fff
; Bank r1_08000 (module id F8, sub 03)


;; Bank header record
BANK_HEADER_hdr:
  0000  AA550008F900.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

;; Module F8 code record 03, 30 bytes, entered at payload start
MODULE_F8_03_CODE_hdr:
  0008  F80300260000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_F8_03_entry
MODULE_F8_03_entry:
  0010  0014           NEG <0x14                         

; ---- function FUN_MF8_r1_08000__0012
FUN_MF8_r1_08000__0012:
  0012  0017           NEG <0x17                         
  0014  001A           NEG <0x1a                         
  0016  001D           NEG <0x1d                         
  0018  0020           NEG <0x20                         
  001a  0023           NEG <0x23                         
  001c  160017         LBRA 0x0036                       
  001f  .db 16 00 64 16 0D C6 16 0F 7B 16 0E DE 16 0F DC     ; ..d.....{......

;; Module F8 code record 04, 2659 bytes, entered at payload start
MODULE_F8_04_CODE_hdr:
  002e  F8040A6B0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_F8_04_entry
MODULE_F8_04_entry:
  0036  3477           PSHS  U Y X B A CC                
  0038  AD9FFC8C       JSR [0xfc8c]                      
  003c  AD9FFC88       JSR [0xfc88]                      
  0040  CC6980         LDD #0x6980                       
  0043  AD9FFDC0       JSR [0xfdc0]                      
  0047  35F7           PULS CC A B X Y U PC              

; ---- function FUN_MF8_r1_08000__0049
FUN_MF8_r1_08000__0049:
  0049  3406           PSHS  B A                         
  004b  C690           LDB #0x90                         
  004d  F760FB         STB 0x60fb                        
  0050  AD9FFC88       JSR [0xfc88]                      
  0054  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}{2:13}| Soft Functions     "
  0058  0102137C2053.. char[25] 01h,02h,13h,"| Soft Functions     "
LAB_MF8_r1_08000__0071:
  0071  AD9FFDFC       JSR [0xfdfc]                      
  0075  1700A1         LBSR 0x0119                       
  0078  FCFDC6         LDD 0xfdc6                        
  007b  FD6030         STD 0x6030                        
  007e  FCFDC4         LDD 0xfdc4                        
  0081  FD6036         STD 0x6036                        
  0084  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__0086
FUN_MF8_r1_08000__0086:
  0086  3436           PSHS  Y X B A                     
  0088  327C           LEAS -0x4,S                       
  008a  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$009E(rel)
  008e  0010           dw 10h                            
LAB_MF8_r1_08000__0090:
  0090  1F01           TFR D,X                           
  0092  108E6980       LDY #0x6980                       
  0096  AD9FFDA6       JSR [0xfda6]                      
  009a  3264           LEAS 0x4,S                        
  009c  35B6           PULS  A B X Y PC                  
DAT_MF8_r1_08000__009e:
  009e  FF             ?? FFh                            
  009f  .db AB 00 5A 00 5B 00 5C 00 5D 00 B3 01 2B 02 4B 02  ; ..Z.[.\.]...+.K.
  00af  .db 4C 01 E2 02 6F 02 9E 03 A7 03 4A 04 0B 00 54 00  ; L...o.....J...T.
  00bf  .db 48 00 4A 00 4B 00 52 00 00 00 00 00 00 00 00 00  ; H.J.K.R.........
  00cf  .db 00 08 32 08 DE 09 B0 09 39 00 3B 00 00 00 00 00  ; ..2.....9.;.....
  00df  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  00ef  .db 00 00 00 00 00 00 00 00 00 FF FF 16 0C 7B 16 0C  ; .............{..
  00ff  .db 7E 16 0C 81 16 0C 84 6E 9F FE AC 16 12 A0 16 14  ; ~......n........
  010f  .db 61 16 12 44 16 14 EF 16 13 BB                    ; a..D......

; ---- function FUN_MF8_r1_08000__0119
FUN_MF8_r1_08000__0119:
  0119  3436           PSHS  Y X B A                     
  011b  8E0283         LDX #0x283                        
  011e  AD9FFC7C       JSR [0xfc7c]                      
  0122  4F             CLRA                              
  0123  3404           PSHS  B                           
  0125  C63F           LDB #0x3f                         
  0127  E0E0           SUBB ,S+                          
  0129  FD6074         STD 0x6074                        
  012c  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 08 02 0A 00 00 03 00 $003F $0000 $0000 ->$0000 ->$000A $0001 $0001 $0000
  0130  01             db 1h                             
  0131  08             db 8h                             
  0132  02             db 2h                             
  0133  0A             db Ah                             
  0134  00             db 0h                             
  0135  00             db 0h                             
  0136  03             db 3h                             
  0137  00             db 0h                             
  0138  003F           dw 3Fh                            
  013a  0000           dw 0h                             
  013c  0000           dw 0h                             
  013e  0000           addr MF8_r1_08000::0000           
  0140  000A           addr MF8_r1_08000::000a           
  0142  0001           dw 1h                             
  0144  0001           dw 1h                             
  0146  0000           dw 0h                             
LAB_MF8_r1_08000__0148:
  0148  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__014a
FUN_MF8_r1_08000__014a:
  014a  3436           PSHS  Y X B A                     
  014c  FC6074         LDD 0x6074                        
  014f  3404           PSHS  B                           
  0151  C63F           LDB #0x3f                         
  0153  E0E0           SUBB ,S+                          
  0155  AD9FFC4A       JSR [0xfc4a]                      
  0159  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__015b
FUN_MF8_r1_08000__015b:
  015b  3436           PSHS  Y X B A                     
  015d  C691           LDB #0x91                         
  015f  F760FB         STB 0x60fb                        
  0162  AD9FFC88       JSR [0xfc88]                      
  0166  170774         LBSR 0x08dd                       
  0169  2622           BNE 0x018d                        
  016b  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1} Modulation of Parameters "
  016f  01204D6F6475.. char[28] 01h," Modulation of Parameters "
LAB_MF8_r1_08000__018b:
  018b  2037           BRA 0x01c4                        
LAB_MF8_r1_08000__018d:
  018d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Parameter Modulation not Available."
  0191  01506172616D.. char[37] 01h,"Parameter Modulation not Available."
LAB_MF8_r1_08000__01b6:
  01b6  8E698C         LDX #0x698c                       
  01b9  CC0000         LDD #0x0                          
  01bc  ED81           STD ,X++                          
  01be  ED81           STD ,X++                          
  01c0  ED81           STD ,X++                          
  01c2  ED81           STD ,X++                          
LAB_MF8_r1_08000__01c4:
  01c4  FCFDC6         LDD 0xfdc6                        
  01c7  FD6030         STD 0x6030                        
  01ca  FCFDC4         LDD 0xfdc4                        
  01cd  FD6036         STD 0x6036                        
  01d0  17FF46         LBSR 0x0119                       
  01d3  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__01d5
FUN_MF8_r1_08000__01d5:
  01d5  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$01E6(rel) "( Patch  )"
  01d9  000D           dw Dh                             
  01db  282050617463.. ds "( Patch  )"                   
LAB_MF8_r1_08000__01e5:
  01e5  39             RTS                               

; ---- function thunk_FUN_de7e
thunk_FUN_de7e:
  01e6  6E9FFE8A       JMP [0xfe8a]                      

; ---- function FUN_MF8_r1_08000__01ea
FUN_MF8_r1_08000__01ea:
  01ea  3436           PSHS  Y X B A                     
  01ec  F660B9         LDB 0x60b9                        
  01ef  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0210(rel) "(Mod=    )"
  01f3  001D           dw 1Dh                            
  01f5  284D6F643D20.. ds "(Mod=    )"                   

; ---- function FUN_MF8_r1_08000__01ff
FUN_MF8_r1_08000__01ff:
  01ff  AD9FFE80       JSR [0xfe80]                      
  0203  CB06           ADDB #0x6                         
  0205  1F98           TFR B,A                           
  0207  F660FC         LDB 0x60fc                        
  020a  AD9FFEAE       JSR [0xfeae]                      
  020e  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0210
FUN_MF8_r1_08000__0210:
  0210  3436           PSHS  Y X B A                     
  0212  F660FC         LDB 0x60fc                        
  0215  AD9FFE7E       JSR [0xfe7e]                      
  0219  F760FC         STB 0x60fc                        
  021c  AD9FFE7C       JSR [0xfe7c]                      
  0220  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Parameter Modulation {6}"
  0224  020005285061.. char[27] 02h                      
LAB_MF8_r1_08000__023f:
  023f  7D60FC         TST 0x60fc                        
  0242  27BB           BEQ 0x01ff                        
  0244  170DC3         LBSR 0x100a                       
  0247  20B6           BRA 0x01ff                        

; ---- function FUN_MF8_r1_08000__0249
FUN_MF8_r1_08000__0249:
  0249  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$025A(rel) "(ModReset)"
  024d  000D           dw Dh                             
  024f  284D6F645265.. ds "(ModReset)"                   
LAB_MF8_r1_08000__0259:
  0259  39             RTS                               

; ---- function FUN_MF8_r1_08000__025a
FUN_MF8_r1_08000__025a:
  025a  3406           PSHS  B A                         
  025c  AD9FFE48       JSR [0xfe48]                      
  0260  170DA7         LBSR 0x100a                       
  0263  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Parameter Modulation has been Reset "
  0267  020005285061.. char[41] 02h                      
LAB_MF8_r1_08000__0290:
  0290  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__0292
FUN_MF8_r1_08000__0292:
  0292  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$02A3(rel) "(Control )"
  0296  000D           dw Dh                             
  0298  28436F6E7472.. ds "(Control )"                   
LAB_MF8_r1_08000__02a2:
  02a2  39             RTS                               

; ---- function FUN_MF8_r1_08000__02a3
FUN_MF8_r1_08000__02a3:
  02a3  3436           PSHS  Y X B A                     
  02a5  7D6105         TST 0x6105                        
  02a8  270C           BEQ 0x02b6                        
  02aa  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$02EB(rel)
  02ae  003D           dw 3Dh                            
LAB_MF8_r1_08000__02b0:
  02b0  AD9FFDC8       JSR [0xfdc8]                      
  02b4  2003           BRA 0x02b9                        
LAB_MF8_r1_08000__02b6:
  02b6  17FBD1         LBSR 0xfe8a                       
LAB_MF8_r1_08000__02b9:
  02b9  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__02bb
FUN_MF8_r1_08000__02bb:
  02bb  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Control of Parameter Modulation "
  02bf  01436F6E7472.. char[34] 01h,"Control of Parameter Modulation "
LAB_MF8_r1_08000__02e1:
  02e1  FCFDCA         LDD 0xfdca                        
  02e4  FD6030         STD 0x6030                        
  02e7  FD6036         STD 0x6036                        
  02ea  39             RTS                               
DAT_MF8_r1_08000__02eb:
  02eb  FF             ?? FFh                            
  02ec  .db D0 FE FD FF 5A 00 00 00 00 FF FF 16 0D 8B 6E 9F  ; ....Z.........n.
  02fc  .db FE 88 AD 9F FC 8A 00 0D 20 20 20 20 20 20 20 20  ; ........        
  030c  .db 20 20 39 6E 9F FE 8C                             ;   9n...

; ---- function FUN_MF8_r1_08000__0313
FUN_MF8_r1_08000__0313:
  0313  3416           PSHS  X B A                       
  0315  8E028C         LDX #0x28c                        
  0318  AD9FFC7C       JSR [0xfc7c]                      
  031c  F7608A         STB 0x608a                        
  031f  3596           PULS  A B X PC                    

; ---- function FUN_MF8_r1_08000__0321
FUN_MF8_r1_08000__0321:
  0321  3406           PSHS  B A                         
  0323  C692           LDB #0x92                         
  0325  F760FB         STB 0x60fb                        
  0328  AD9FFC88       JSR [0xfc88]                      
  032c  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}MIDI Functions "
  0330  014D49444920.. char[17] 01h,"MIDI Functions "    
LAB_MF8_r1_08000__0341:
  0341  FCFDC6         LDD 0xfdc6                        
  0344  FD6030         STD 0x6030                        
  0347  FCFDC4         LDD 0xfdc4                        
  034a  FD6036         STD 0x6036                        
  034d  17FDC9         LBSR 0x0119                       
  0350  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__0352
FUN_MF8_r1_08000__0352:
  0352  3406           PSHS  B A                         
  0354  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$037E(rel) "(Base=   )"
  0358  0026           dw 26h                            
  035a  28426173653D.. ds "(Base=   )"                   
LAB_MF8_r1_08000__0364:
  0364  F6608A         LDB 0x608a                        
  0367  4F             CLRA                              
  0368  C40F           ANDB #0xf                         
  036a  C30001         ADDD #0x1                         
  036d  3606           PSHU  B A                         
  036f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}"
  0373  022F04200003.. char[9] 02h,"/",04h," "           
LAB_MF8_r1_08000__037c:
  037c  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__037e
FUN_MF8_r1_08000__037e:
  037e  3406           PSHS  B A                         
  0380  C692           LDB #0x92                         
  0382  F760FB         STB 0x60fb                        
  0385  AD9FFDF2       JSR [0xfdf2]                      
  0389  F660B9         LDB 0x60b9                        
  038c  AD9FFE32       JSR [0xfe32]                      
  0390  F6608A         LDB 0x608a                        
  0393  C40F           ANDB #0xf                         
  0395  4F             CLRA                              
  0396  C30001         ADDD #0x1                         
  0399  FD6074         STD 0x6074                        
  039c  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 10 02 64 01 00 02 00 $0010 $0001 $0000 ->$000E ->$0034 $0001 $0001 $0000
  03a0  01             db 1h                             
  03a1  10             db 10h                            
  03a2  02             db 2h                             
  03a3  64             db 64h                            
  03a4  01             db 1h                             
  03a5  00             db 0h                             
  03a6  02             db 2h                             
  03a7  00             db 0h                             
  03a8  0010           dw 10h                            
  03aa  0001           dw 1h                             
  03ac  0000           dw 0h                             
  03ae  000E           addr MF8_r1_08000::000e           
  03b0  0034           addr MF8_r1_08000::0034           
  03b2  0001           dw 1h                             
  03b4  0001           dw 1h                             
  03b6  0000           dw 0h                             
LAB_MF8_r1_08000__03b8:
  03b8  8D02           BSR 0x03bc                        
  03ba  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__03bc
FUN_MF8_r1_08000__03bc:
  03bc  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}MIDI Base Channel = {5:14}{2:14}{3:60A1}{2:2F}{3:60A1}"
  03c0  02004D494449.. char[35] 02h                      
LAB_MF8_r1_08000__03e3:
  03e3  39             RTS                               

; ---- function FUN_MF8_r1_08000__03e4
FUN_MF8_r1_08000__03e4:
  03e4  3426           PSHS  Y B A                       
  03e6  F6608A         LDB 0x608a                        
  03e9  C4F0           ANDB #0xf0                        
  03eb  3404           PSHS  B                           
  03ed  F66075         LDB 0x6075                        
  03f0  5A             DECB                              
  03f1  C40F           ANDB #0xf                         
  03f3  EAE0           ORB ,S+                           
  03f5  F7608A         STB 0x608a                        
  03f8  108E028C       LDY #0x28c                        
  03fc  AD9FFC80       JSR [0xfc80]                      
  0400  35A6           PULS  A B Y PC                    

; ---- function FUN_MF8_r1_08000__0402
FUN_MF8_r1_08000__0402:
  0402  3404           PSHS  B                           
  0404  F660B9         LDB 0x60b9                        
  0407  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0428(rel) "( Rcv=   )"
  040b  001D           dw 1Dh                            
  040d  28205263763D.. ds "( Rcv=   )"                   
LAB_MF8_r1_08000__0417:
  0417  AD9FFE80       JSR [0xfe80]                      
  041b  CB06           ADDB #0x6                         
  041d  1F98           TFR B,A                           
  041f  F66116         LDB 0x6116                        
  0422  AD9FFEAE       JSR [0xfeae]                      
  0426  3584           PULS  B PC                        

; ---- function FUN_MF8_r1_08000__0428
FUN_MF8_r1_08000__0428:
  0428  3436           PSHS  Y X B A                     
  042a  F66116         LDB 0x6116                        
  042d  AD9FFE7E       JSR [0xfe7e]                      
  0431  F76116         STB 0x6116                        
  0434  AD9FFE7C       JSR [0xfe7c]                      
  0438  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}All MIDI input {6}"
  043c  02000528416C.. char[21] 02h                      
LAB_MF8_r1_08000__0451:
  0451  108E0296       LDY #0x296                        
  0455  AD9FFC80       JSR [0xfc80]                      
  0459  8DA7           BSR 0x0402                        
  045b  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__045d
FUN_MF8_r1_08000__045d:
  045d  3426           PSHS  Y B A                       
  045f  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0484(rel) "(Omni=   )"
  0463  0021           dw 21h                            
  0465  284F6D6E693D.. ds "(Omni=   )"                   

; ---- function FUN_MF8_r1_08000__046f
FUN_MF8_r1_08000__046f:
  046f  F6608A         LDB 0x608a                        
  0472  C480           ANDB #0x80                        
  0474  AD9FFE8E       JSR [0xfe8e]                      
  0478  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:38}{5:03}{6}"
  047c  023805030600   char[6] 02h,"8",05h,03h,06h       
LAB_MF8_r1_08000__0482:
  0482  35A6           PULS  A B Y PC                    

; ---- function FUN_MF8_r1_08000__0484
FUN_MF8_r1_08000__0484:
  0484  3426           PSHS  Y B A                       
  0486  F6608A         LDB 0x608a                        
  0489  C880           EORB #0x80                        
  048b  F7608A         STB 0x608a                        
  048e  3404           PSHS  B                           
  0490  C480           ANDB #0x80                        
  0492  AD9FFE8E       JSR [0xfe8e]                      
  0496  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}We are now in Omni {6} Mode "
  049a  020005285765.. char[31] 02h                      
LAB_MF8_r1_08000__04b9:
  04b9  3504           PULS  B                           
  04bb  108E028C       LDY #0x28c                        
  04bf  AD9FFC80       JSR [0xfc80]                      
  04c3  20AA           BRA 0x046f                        

; ---- function FUN_MF8_r1_08000__04c5
FUN_MF8_r1_08000__04c5:
  04c5  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$04D6(rel) "( Expert )"
  04c9  000D           dw Dh                             
  04cb  282045787065.. ds "( Expert )"                   
LAB_MF8_r1_08000__04d5:
  04d5  39             RTS                               

; ---- function FUN_MF8_r1_08000__04d6
FUN_MF8_r1_08000__04d6:
  04d6  3406           PSHS  B A                         
  04d8  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$04E4(rel)
  04dc  0008           dw 8h                             
LAB_MF8_r1_08000__04de:
  04de  AD9FFDC8       JSR [0xfdc8]                      
  04e2  3586           PULS  A B PC                      
DAT_MF8_r1_08000__04e4:
  04e4  00             ?? 00h                            
  04e5  .db 24 00 51 01 07 00 00 01 61 01 75 00 14 01 9B 00  ; $.Q.....a.u.....
  04f5  .db 00 01 57 01 ED 02 17 03 2D 00 00 01 4D FF FF 6E  ; ..W.....-...M..n
  0505  .db 9F FE 86                                         ; ...

; ---- function FUN_MF8_r1_08000__0508
FUN_MF8_r1_08000__0508:
  0508  3406           PSHS  B A                         
  050a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}System Exclusive Functions "
  050e  015379737465.. char[29] 01h,"System Exclusive Functions "
LAB_MF8_r1_08000__052b:
  052b  FCFDCA         LDD 0xfdca                        
  052e  FD6030         STD 0x6030                        
  0531  AD9FFE92       JSR [0xfe92]                      
  0535  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__0537
FUN_MF8_r1_08000__0537:
  0537  3436           PSHS  Y X B A                     
  0539  F660B9         LDB 0x60b9                        
  053c  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0567(rel) "(Dev =   )"
  0540  0027           dw 27h                            
  0542  28446576203D.. ds "(Dev =   )"                   
LAB_MF8_r1_08000__054c:
  054c  8E0290         LDX #0x290                        
  054f  AD9FFC7C       JSR [0xfc7c]                      
  0553  4F             CLRA                              
  0554  C4FF           ANDB #0xff                        
  0556  3606           PSHU  B A                         
  0558  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:2F}{4:2000}{3:60AB}"
  055c  022F04200003.. char[9] 02h,"/",04h," "           
LAB_MF8_r1_08000__0565:
  0565  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0567
FUN_MF8_r1_08000__0567:
  0567  3406           PSHS  B A                         
  0569  C693           LDB #0x93                         
  056b  F760FB         STB 0x60fb                        
  056e  AD9FFDF2       JSR [0xfdf2]                      
  0572  F660B9         LDB 0x60b9                        
  0575  AD9FFE32       JSR [0xfe32]                      
  0579  8E0290         LDX #0x290                        
  057c  AD9FFC7C       JSR [0xfc7c]                      
  0580  C47F           ANDB #0x7f                        
  0582  4F             CLRA                              
  0583  FD6074         STD 0x6074                        
  0586  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 01 02 1E 01 00 02 00 $0063 $0000 $0000 ->$000E ->$0046 $0001 $0001 $0000
  058a  01             db 1h                             
  058b  01             db 1h                             
  058c  02             db 2h                             
  058d  1E             db 1Eh                            
  058e  01             db 1h                             
  058f  00             db 0h                             
  0590  02             db 2h                             
  0591  00             db 0h                             
  0592  0063           dw 63h                            
  0594  0000           dw 0h                             
  0596  0000           dw 0h                             
  0598  000E           addr MF8_r1_08000::000e           
  059a  0046           addr MF8_r1_08000::0046           
  059c  0001           dw 1h                             
  059e  0001           dw 1h                             
  05a0  0000           dw 0h                             
LAB_MF8_r1_08000__05a2:
  05a2  8D02           BSR 0x05a6                        
  05a4  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__05a6
FUN_MF8_r1_08000__05a6:
  05a6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}Device Number =    ( System Exclusive ) {2:10}{3:60A1}{2:2F}{3:60A1}"
  05aa  020044657669.. char[53] 02h                      
LAB_MF8_r1_08000__05df:
  05df  39             RTS                               

; ---- function FUN_MF8_r1_08000__05e0
FUN_MF8_r1_08000__05e0:
  05e0  3426           PSHS  Y B A                       
  05e2  F66075         LDB 0x6075                        
  05e5  108E0290       LDY #0x290                        
  05e9  AD9FFC80       JSR [0xfc80]                      
  05ed  35A6           PULS  A B Y PC                    

; ---- function FUN_MF8_r1_08000__05ef
FUN_MF8_r1_08000__05ef:
  05ef  3436           PSHS  Y X B A                     
  05f1  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0612(rel) "(SysX=   )"
  05f5  001D           dw 1Dh                            
  05f7  28537973583D.. ds "(SysX=   )"                   

; ---- function FUN_MF8_r1_08000__0601
FUN_MF8_r1_08000__0601:
  0601  AD9FFE80       JSR [0xfe80]                      
  0605  CB06           ADDB #0x6                         
  0607  1F98           TFR B,A                           
  0609  F66136         LDB 0x6136                        
  060c  AD9FFEAE       JSR [0xfeae]                      
  0610  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0612
FUN_MF8_r1_08000__0612:
  0612  3436           PSHS  Y X B A                     
  0614  F66136         LDB 0x6136                        
  0617  AD9FFE7E       JSR [0xfe7e]                      
  061b  F76136         STB 0x6136                        
  061e  AD9FFE7C       JSR [0xfe7c]                      
  0622  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}System Exclusive Input {6}"
  0626  020005285379.. char[29] 02h                      
LAB_MF8_r1_08000__0643:
  0643  108E028F       LDY #0x28f                        
  0647  AD9FFC80       JSR [0xfc80]                      
  064b  20B4           BRA 0x0601                        

; ---- function FUN_MF8_r1_08000__064d
FUN_MF8_r1_08000__064d:
  064d  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$065E(rel) "(  more  )"
  0651  000D           dw Dh                             
  0653  2820206D6F72.. ds "(  more  )"                   
LAB_MF8_r1_08000__065d:
  065d  39             RTS                               

; ---- function FUN_MF8_r1_08000__065e
FUN_MF8_r1_08000__065e:
  065e  AD9FFDC6       JSR [0xfdc6]                      
  0662  39             RTS                               

; ---- function FUN_MF8_r1_08000__0663
FUN_MF8_r1_08000__0663:
  0663  3406           PSHS  B A                         
  0665  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Expert MIDI Functions "
  0669  014578706572.. char[24] 01h,"Expert MIDI Functions "
LAB_MF8_r1_08000__0681:
  0681  FCFDCA         LDD 0xfdca                        
  0684  FD6030         STD 0x6030                        
  0687  AD9FFE92       JSR [0xfe92]                      
  068b  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__068d
FUN_MF8_r1_08000__068d:
  068d  3406           PSHS  B A                         
  068f  F660B9         LDB 0x60b9                        
  0692  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$06B3(rel) "(Err=    )"
  0696  001D           dw 1Dh                            
  0698  284572723D20.. ds "(Err=    )"                   
LAB_MF8_r1_08000__06a2:
  06a2  AD9FFE80       JSR [0xfe80]                      
  06a6  CB06           ADDB #0x6                         
  06a8  1F98           TFR B,A                           
  06aa  F66087         LDB 0x6087                        
  06ad  AD9FFEAE       JSR [0xfeae]                      
  06b1  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__06b3
FUN_MF8_r1_08000__06b3:
  06b3  7F6087         CLR 0x6087                        
  06b6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}MIDI Overrun Catcher Has been Reset"
  06ba  020005284D49.. char[40] 02h                      
LAB_MF8_r1_08000__06e2:
  06e2  8DA9           BSR 0x068d                        
  06e4  39             RTS                               

; ---- function FUN_MF8_r1_08000__06e5
FUN_MF8_r1_08000__06e5:
  06e5  3406           PSHS  B A                         
  06e7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Fixes for MIDI Problems "
  06eb  014669786573.. char[26] 01h,"Fixes for MIDI Problems "
LAB_MF8_r1_08000__0705:
  0705  FCFDCA         LDD 0xfdca                        
  0708  FD6030         STD 0x6030                        
  070b  AD9FFE92       JSR [0xfe92]                      
  070f  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__0711
FUN_MF8_r1_08000__0711:
  0711  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0758(rel) "(Off=    )"
  0715  0043           dw 43h                            
  0717  284F66663D20.. ds "(Off=    )"                   
LAB_MF8_r1_08000__0721:
  0721  8D01           BSR 0x0724                        
  0723  39             RTS                               

; ---- function FUN_MF8_r1_08000__0724
FUN_MF8_r1_08000__0724:
  0724  3406           PSHS  B A                         
  0726  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$0744(rel)
  072a  001A           dw 1Ah                            
LAB_MF8_r1_08000__072c:
  072c  3406           PSHS  B A                         
  072e  F66117         LDB 0x6117                        
  0731  C403           ANDB #0x3                         
  0733  8605           LDA #0x5                          
  0735  3D             MUL                               
  0736  E3E1           ADDD ,S++                         
  0738  3606           PSHU  B A                         
  073a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:2D}{6}"
  073e  022D0600       char[4] 02h,"-",06h               
LAB_MF8_r1_08000__0742:
  0742  3586           PULS  A B PC                      
DAT_MF8_r1_08000__0744:
  0744  4E             ?? 4Eh    N                       
  0745  .db 6F 6E 65 00 4F 66 66 20 00 5A 65 72 6F 00 42 6F  ; one.Off .Zero.Bo
  0755  .db 74 68 00                                         ; th.

; ---- function FUN_MF8_r1_08000__0758
FUN_MF8_r1_08000__0758:
  0758  3406           PSHS  B A                         
  075a  AD9FFDF2       JSR [0xfdf2]                      
  075e  F660B9         LDB 0x60b9                        
  0761  AD9FFE32       JSR [0xfe32]                      
  0765  F66117         LDB 0x6117                        
  0768  5A             DECB                              
  0769  C403           ANDB #0x3                         
  076b  4F             CLRA                              
  076c  FD6074         STD 0x6074                        
  076f  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 40 01 1E 00 00 01 00 $0002 $0000 $0000 ->$0000 ->$0010 $0001 $0001 $0000
  0773  01             db 1h                             
  0774  40             db 40h                            
  0775  01             db 1h                             
  0776  1E             db 1Eh                            
  0777  00             db 0h                             
  0778  00             db 0h                             
  0779  01             db 1h                             
  077a  00             db 0h                             
  077b  0002           dw 2h                             
  077d  0000           dw 0h                             
  077f  0000           dw 0h                             
  0781  0000           addr MF8_r1_08000::0000           
  0783  0010           addr MF8_r1_08000::0010           
  0785  0001           dw 1h                             
  0787  0001           dw 1h                             
  0789  0000           dw 0h                             
LAB_MF8_r1_08000__078b:
  078b  17001E         LBSR 0x07ac                       
  078e  17FF93         LBSR 0x0724                       
  0791  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__0793
FUN_MF8_r1_08000__0793:
  0793  3426           PSHS  Y B A                       
  0795  F66075         LDB 0x6075                        
  0798  5C             INCB                              
  0799  F76117         STB 0x6117                        
  079c  108E0297       LDY #0x297                        
  07a0  AD9FFC80       JSR [0xfc80]                      
  07a4  170005         LBSR 0x07ac                       
  07a7  17FF7A         LBSR 0x0724                       
  07aa  35A6           PULS  A B Y PC                    

; ---- function FUN_MF8_r1_08000__07ac
FUN_MF8_r1_08000__07ac:
  07ac  3406           PSHS  B A                         
  07ae  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}MIDI Note Off is "
  07b2  020005284D49.. char[22] 02h                      
LAB_MF8_r1_08000__07c8:
  07c8  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$07E7(rel)
  07cc  001B           dw 1Bh                            
LAB_MF8_r1_08000__07ce:
  07ce  3406           PSHS  B A                         
  07d0  F66117         LDB 0x6117                        
  07d3  5A             DECB                              
  07d4  C403           ANDB #0x3                         
  07d6  8616           LDA #0x16                         
  07d8  3D             MUL                               
  07d9  E3E1           ADDD ,S++                         
  07db  3606           PSHU  B A                         
  07dd  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:11}{6}"
  07e1  02110600       char[4] 02h,11h,06h               
LAB_MF8_r1_08000__07e5:
  07e5  3586           PULS  A B PC                      
s_Note_Off_Command_MF8_r1_08000__07e7:
  07e7  4E6F7465204F.. ds "Note Off Command     "        
  07fd  4E6F7465204F.. ds "Note On Zero Velocity"        
  0813  426F74682020.. ds "Both  Off and Zero   "        

; ---- function FUN_MF8_r1_08000__0829
FUN_MF8_r1_08000__0829:
  0829  3436           PSHS  Y X B A                     
  082b  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0863(rel) "(bank=   )"
  082f  0034           dw 34h                            
  0831  2862616E6B3D.. ds "(bank=   )"                   

; ---- function FUN_MF8_r1_08000__083b
FUN_MF8_r1_08000__083b:
  083b  AD9FFE80       JSR [0xfe80]                      
  083f  CB06           ADDB #0x6                         
  0841  AD9FFC36       JSR [0xfc36]                      
  0845  8E0288         LDX #0x288                        
  0848  AD9FFC7C       JSR [0xfc7c]                      
  084c  5D             TSTB                              
  084d  270A           BEQ 0x0859                        
  084f  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "Par"
  0853  50617200       char[4] "Par"                     
LAB_MF8_r1_08000__0857:
  0857  2008           BRA 0x0861                        
LAB_MF8_r1_08000__0859:
  0859  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "SyX"
  085d  53795800       char[4] "SyX"                     
LAB_MF8_r1_08000__0861:
  0861  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0863
FUN_MF8_r1_08000__0863:
  0863  3436           PSHS  Y X B A                     
  0865  8E0288         LDX #0x288                        
  0868  AD9FFC7C       JSR [0xfc7c]                      
  086c  AD9FFE7E       JSR [0xfe7e]                      
  0870  1F12           TFR X,Y                           
  0872  AD9FFC80       JSR [0xfc80]                      
  0876  5D             TSTB                              
  0877  2632           BNE 0x08ab                        
  0879  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}Bank Select uses System Exclusive (SyX) "
  087d  020042616E6B.. char[43] 02h                      
LAB_MF8_r1_08000__08a8:
  08a8  16FF90         LBRA 0x083b                       
LAB_MF8_r1_08000__08ab:
  08ab  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}Bank Select uses MIDI Parameter   (Par) "
  08af  020042616E6B.. char[43] 02h                      
LAB_MF8_r1_08000__08da:
  08da  16FF5E         LBRA 0x083b                       

; ---- function FUN_MF8_r1_08000__08dd
FUN_MF8_r1_08000__08dd:
  08dd  3436           PSHS  Y X B A                     
  08df  3406           PSHS  B A                         
  08e1  8613           LDA #0x13                         
  08e3  A7E4           STA ,S                            
  08e5  8E6B00         LDX #0x6b00                       
  08e8  C6FF           LDB #0xff                         
LAB_MF8_r1_08000__08ea:
  08ea  E1890000       CMPB 0x0,X                        
  08ee  260C           BNE 0x08fc                        
  08f0  30890030       LEAX 0x30,X                       
  08f4  6AE4           DEC ,S                            
  08f6  26F2           BNE 0x08ea                        
  08f8  1CFB           ANDCC #0xfb                       
  08fa  2002           BRA 0x08fe                        
LAB_MF8_r1_08000__08fc:
  08fc  1A04           ORCC #0x4                         
LAB_MF8_r1_08000__08fe:
  08fe  3262           LEAS 0x2,S                        
  0900  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0902
FUN_MF8_r1_08000__0902:
  0902  3436           PSHS  Y X B A                     
  0904  AD9FFC88       JSR [0xfc88]                      
  0908  FCFDC6         LDD 0xfdc6                        
  090b  FD6030         STD 0x6030                        
  090e  FCFDC4         LDD 0xfdc4                        
  0911  FD6036         STD 0x6036                        
  0914  17F802         LBSR 0x0119                       
  0917  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}MIDI Computer and Sequencer Functions"
  091b  020005284D49.. char[42] 02h                      
LAB_MF8_r1_08000__0945:
  0945  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0947
FUN_MF8_r1_08000__0947:
  0947  3436           PSHS  Y X B A                     
  0949  8E029A         LDX #0x29a                        
  094c  AD9FFC7C       JSR [0xfc7c]                      
  0950  5D             TSTB                              
  0951  2605           BNE 0x0958                        
  0953  CC0969         LDD #0x969                        
  0956  2003           BRA 0x095b                        
LAB_MF8_r1_08000__0958:
  0958  CC098D         LDD #0x98d                        
LAB_MF8_r1_08000__095b:
  095b  3606           PSHU  B A                         
  095d  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}{6}"
  0961  020005280600   char[6] 02h                       
LAB_MF8_r1_08000__0967:
  0967  35B6           PULS  A B X Y PC                  
  0969  4D4944492053.. ds "MIDI Sequence mode is now Disabled "
  098d  4D4944492053.. ds "MIDI Sequence mode is now Enabled "

; ---- function FUN_MF8_r1_08000__09b0
FUN_MF8_r1_08000__09b0:
  09b0  3436           PSHS  Y X B A                     
  09b2  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$09D7(rel) "(Seq=    )"
  09b6  0021           dw 21h                            
  09b8  285365713D20.. ds "(Seq=    )"                   
LAB_MF8_r1_08000__09c2:
  09c2  AD9FFE80       JSR [0xfe80]                      
  09c6  CB06           ADDB #0x6                         
  09c8  1F98           TFR B,A                           
  09ca  8E029A         LDX #0x29a                        
  09cd  AD9FFC7C       JSR [0xfc7c]                      
  09d1  AD9FFEAE       JSR [0xfeae]                      
  09d5  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__09d7
FUN_MF8_r1_08000__09d7:
  09d7  3436           PSHS  Y X B A                     
  09d9  8E029A         LDX #0x29a                        
  09dc  AD9FFC7C       JSR [0xfc7c]                      
  09e0  AD9FFE7E       JSR [0xfe7e]                      
  09e4  1F12           TFR X,Y                           
  09e6  AD9FFC80       JSR [0xfc80]                      
  09ea  1700B4         LBSR 0x0aa1                       
  09ed  AD9FFDC2       JSR [0xfdc2]                      
  09f1  AD9FFE7C       JSR [0xfe7c]                      
  09f5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Sequence Mode {6}"
  09f9  020005285365.. char[20] 02h                      
LAB_MF8_r1_08000__0a0d:
  0a0d  35B6           PULS  A B X Y PC                  
  0a0f  .db 7D 61 1A 27 10 AD 9F FC 8A 00 0D 28 20 20 4E 6F  ; }a.'.......(  No
  0a1f  .db 74 65 20 20 29 39 AD 9F FC 38 01                 ; te  )9...8.
  0a2a  456E61626C69.. ds "Enabling Sequence mode has forced MIDI  Program Loading to \"Enabled\" and \"ID\"   "
  0a7b  .db AD 9F FE 4A AD 9F FD C2 39 AD 9F FC 8A 00 0D 28  ; ...J....9......(
  0a8b  .db 45 6E 61 62 6C 65 73 20 29 39 17 00 11 39        ; Enables )9...9

;; Module F8 code record 05, 630 bytes, entered at payload start
MODULE_F8_05_CODE_hdr:
  0a99  F805027E0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_F8_05_entry
MODULE_F8_05_entry:
  0aa1  3436           PSHS  Y X B A                     
  0aa3  AD9FFE50       JSR [0xfe50]                      
  0aa7  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0aa9
FUN_MF8_r1_08000__0aa9:
  0aa9  3436           PSHS  Y X B A                     
  0aab  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$0AB7(rel)
  0aaf  0008           dw 8h                             
LAB_MF8_r1_08000__0ab1:
  0ab1  AD9FFDC8       JSR [0xfdc8]                      
  0ab5  35B6           PULS  A B X Y PC                  
DAT_MF8_r1_08000__0ab7:
  0ab7  00             ?? 00h                            
  0ab8  .db 3D 00 7D 00 E4 00 00 00 1F 01 45 01 81 01 E8 00  ; =.}.......E.....
  0ac8  .db 00 00 04 FF FF AD 9F FC 8A 00 1E 28 20 20 4D 6F  ; ...........(  Mo
  0ad8  .db 72 65 20 20 29 39 AD 9F FC 8A 00 0D 28 20 20 4D  ; re  )9......(  M
  0ae8  .db 6F 72 65 20 20 29 39 AD 9F FD C6 39              ; ore  )9....9

; ---- function FUN_MF8_r1_08000__0af4
FUN_MF8_r1_08000__0af4:
  0af4  3436           PSHS  Y X B A                     
  0af6  AD9FFC88       JSR [0xfc88]                      
  0afa  FCFDCA         LDD 0xfdca                        
  0afd  FD6030         STD 0x6030                        
  0b00  FCFDC4         LDD 0xfdc4                        
  0b03  FD6036         STD 0x6036                        
  0b06  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Enables for Transmitting MIDI Sequences "
  0b0a  01456E61626C.. char[42] 01h,"Enables for Transmitting MIDI Sequences "
LAB_MF8_r1_08000__0b34:
  0b34  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0b36
FUN_MF8_r1_08000__0b36:
  0b36  3436           PSHS  Y X B A                     
  0b38  F660B9         LDB 0x60b9                        
  0b3b  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0B60(rel) "(Lvls=   )"
  0b3f  0021           dw 21h                            
  0b41  284C766C733D.. ds "(Lvls=   )"                   
LAB_MF8_r1_08000__0b4b:
  0b4b  AD9FFE80       JSR [0xfe80]                      
  0b4f  CB06           ADDB #0x6                         
  0b51  1F98           TFR B,A                           
  0b53  8E0293         LDX #0x293                        
  0b56  AD9FFC7C       JSR [0xfc7c]                      
  0b5a  AD9FFEAE       JSR [0xfeae]                      
  0b5e  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0b60
FUN_MF8_r1_08000__0b60:
  0b60  3436           PSHS  Y X B A                     
  0b62  8E0293         LDX #0x293                        
  0b65  AD9FFC7C       JSR [0xfc7c]                      
  0b69  AD9FFE7E       JSR [0xfe7e]                      
  0b6d  1F12           TFR X,Y                           
  0b6f  AD9FFC80       JSR [0xfc80]                      
  0b73  AD9FFE7C       JSR [0xfe7c]                      
  0b77  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Outputing Levels Info {6}"
  0b7b  020005284F75.. char[28] 02h                      
LAB_MF8_r1_08000__0b97:
  0b97  AD9FFE50       JSR [0xfe50]                      
  0b9b  8D99           BSR 0x0b36                        
  0b9d  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0b9f
FUN_MF8_r1_08000__0b9f:
  0b9f  3436           PSHS  Y X B A                     
  0ba1  F660B9         LDB 0x60b9                        
  0ba4  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0BC9(rel) "(Pgm=    )"
  0ba8  0021           dw 21h                            
  0baa  2850676D3D20.. ds "(Pgm=    )"                   
LAB_MF8_r1_08000__0bb4:
  0bb4  AD9FFE80       JSR [0xfe80]                      
  0bb8  CB06           ADDB #0x6                         
  0bba  1F98           TFR B,A                           
  0bbc  8E0292         LDX #0x292                        
  0bbf  AD9FFC7C       JSR [0xfc7c]                      
  0bc3  AD9FFEAE       JSR [0xfeae]                      
  0bc7  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0bc9
FUN_MF8_r1_08000__0bc9:
  0bc9  3436           PSHS  Y X B A                     
  0bcb  8E0292         LDX #0x292                        
  0bce  AD9FFC7C       JSR [0xfc7c]                      
  0bd2  AD9FFE7E       JSR [0xfe7e]                      
  0bd6  1F12           TFR X,Y                           
  0bd8  AD9FFC80       JSR [0xfc80]                      
  0bdc  AD9FFE7C       JSR [0xfe7c]                      
  0be0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Program Info Output {6}"
  0be4  020005285072.. char[26] 02h                      
LAB_MF8_r1_08000__0bfe:
  0bfe  AD9FFE50       JSR [0xfe50]                      
  0c02  8D9B           BSR 0x0b9f                        
  0c04  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0c06
FUN_MF8_r1_08000__0c06:
  0c06  3436           PSHS  Y X B A                     
  0c08  AD9FFC88       JSR [0xfc88]                      
  0c0c  FCFDCA         LDD 0xfdca                        
  0c0f  FD6030         STD 0x6030                        
  0c12  FCFDC4         LDD 0xfdc4                        
  0c15  FD6036         STD 0x6036                        
  0c18  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Enables for Receiving MIDI Sequences"
  0c1c  01456E61626C.. char[38] 01h,"Enables for Receiving MIDI Sequences"
LAB_MF8_r1_08000__0c42:
  0c42  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0c44
FUN_MF8_r1_08000__0c44:
  0c44  3436           PSHS  Y X B A                     
  0c46  F660B9         LDB 0x60b9                        
  0c49  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0C6E(rel) "(Lvls=   )"
  0c4d  0021           dw 21h                            
  0c4f  284C766C733D.. ds "(Lvls=   )"                   
LAB_MF8_r1_08000__0c59:
  0c59  AD9FFE80       JSR [0xfe80]                      
  0c5d  CB06           ADDB #0x6                         
  0c5f  1F98           TFR B,A                           
  0c61  8E0295         LDX #0x295                        
  0c64  AD9FFC7C       JSR [0xfc7c]                      
  0c68  AD9FFEAE       JSR [0xfeae]                      
  0c6c  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0c6e
FUN_MF8_r1_08000__0c6e:
  0c6e  3436           PSHS  Y X B A                     
  0c70  8E0295         LDX #0x295                        
  0c73  AD9FFC7C       JSR [0xfc7c]                      
  0c77  AD9FFE7E       JSR [0xfe7e]                      
  0c7b  1F12           TFR X,Y                           
  0c7d  AD9FFC80       JSR [0xfc80]                      
  0c81  AD9FFE7C       JSR [0xfe7c]                      
  0c85  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Receiving Levels Info {6}"
  0c89  020005285265.. char[28] 02h                      
LAB_MF8_r1_08000__0ca5:
  0ca5  AD9FFE50       JSR [0xfe50]                      
  0ca9  8D99           BSR 0x0c44                        
  0cab  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0cad
FUN_MF8_r1_08000__0cad:
  0cad  3436           PSHS  Y X B A                     
  0caf  F660B9         LDB 0x60b9                        
  0cb2  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$0CD7(rel) "(Pgm=    )"
  0cb6  0021           dw 21h                            
  0cb8  2850676D3D20.. ds "(Pgm=    )"                   
LAB_MF8_r1_08000__0cc2:
  0cc2  AD9FFE80       JSR [0xfe80]                      
  0cc6  CB06           ADDB #0x6                         
  0cc8  1F98           TFR B,A                           
  0cca  8E0294         LDX #0x294                        
  0ccd  AD9FFC7C       JSR [0xfc7c]                      
  0cd1  AD9FFEAE       JSR [0xfeae]                      
  0cd5  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0cd7
FUN_MF8_r1_08000__0cd7:
  0cd7  3436           PSHS  Y X B A                     
  0cd9  8E0294         LDX #0x294                        
  0cdc  AD9FFC7C       JSR [0xfc7c]                      
  0ce0  AD9FFE7E       JSR [0xfe7e]                      
  0ce4  1F12           TFR X,Y                           
  0ce6  AD9FFC80       JSR [0xfc80]                      
  0cea  AD9FFE7C       JSR [0xfe7c]                      
  0cee  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}Program Info Receiving {6}"
  0cf2  020005285072.. char[29] 02h                      
LAB_MF8_r1_08000__0d0f:
  0d0f  AD9FFE50       JSR [0xfe50]                      
  0d13  8D98           BSR 0x0cad                        
  0d15  35B6           PULS  A B X Y PC                  

;; Record F806, 1584 bytes
REC_F806_hdr:
  0d17  F80606380000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
REC_F806:
  0d1f  2C             ?? 2Ch    ,                       
  0d20  .db 46 00 00 20 53 6F 66 74 20 31 20 00 E3 20 10 20  ; F.. Soft 1 .. . 
  0d30  .db 14 2D 47 00 00 20 53 6F 66 74 20 32 20 00 D7 20  ; .-G.. Soft 2 .. 
  0d40  .db 11 20 15 2E 48 00 00 20 53 6F 66 74 20 33 20 00  ; . ..H.. Soft 3 .
  0d50  .db CB 20 12 20 16 2F 49 00 00 20 53 6F 66 74 20 34  ; . . ./I.. Soft 4
  0d60  .db 20 00 BF 20 13 20 17                             ;  .. . .

; ---- function FUN_MF8_r1_08000__0d67
FUN_MF8_r1_08000__0d67:
  0d67  B6611C         LDA 0x611c                        
  0d6a  C612           LDB #0x12                         
  0d6c  3D             MUL                               
  0d6d  3406           PSHS  B A                         
  0d6f  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$0D1F(rel)
  0d73  FFAC           dw FFACh                          
LAB_MF8_r1_08000__0d75:
  0d75  E3E1           ADDD ,S++                         
  0d77  39             RTS                               

; ---- function FUN_MF8_r1_08000__0d78
FUN_MF8_r1_08000__0d78:
  0d78  3436           PSHS  Y X B A                     
  0d7a  C600           LDB #0x0                          
  0d7c  2010           BRA 0x0d8e                        

; ---- function FUN_MF8_r1_08000__0d7e
FUN_MF8_r1_08000__0d7e:
  0d7e  3436           PSHS  Y X B A                     
  0d80  C601           LDB #0x1                          
  0d82  200A           BRA 0x0d8e                        

; ---- function FUN_MF8_r1_08000__0d84
FUN_MF8_r1_08000__0d84:
  0d84  3436           PSHS  Y X B A                     
  0d86  C602           LDB #0x2                          
  0d88  2004           BRA 0x0d8e                        

; ---- function FUN_MF8_r1_08000__0d8a
FUN_MF8_r1_08000__0d8a:
  0d8a  3436           PSHS  Y X B A                     
  0d8c  C603           LDB #0x3                          
LAB_MF8_r1_08000__0d8e:
  0d8e  F7611C         STB 0x611c                        
  0d91  C6FF           LDB #0xff                         
  0d93  F76125         STB 0x6125                        
  0d96  17FFCE         LBSR 0x0d67                       
  0d99  1F01           TFR D,X                           
  0d9b  1702A0         LBSR 0x103e                       
  0d9e  10260047       LBNE 0x0de9                       
  0da2  AD9FFDD6       JSR [0xfdd6]                       ; inline[API_FDD6]: $6021
  0da6  6021           addr 6021                         
LAB_MF8_r1_08000__0da8:
  0da8  108E603C       LDY #0x603c                       
  0dac  F6611C         LDB 0x611c                        
  0daf  C403           ANDB #0x3                         
  0db1  58             LSLB                              
  0db2  31A5           LEAY B,Y                          
  0db4  1F10           TFR X,D                           
  0db6  C3000C         ADDD #0xc                         
  0db9  E30C           ADDD 0xc,X                        
  0dbb  EDA4           STD ,Y                            
  0dbd  7D6105         TST 0x6105                        
  0dc0  2727           BEQ 0x0de9                        
  0dc2  F6611C         LDB 0x611c                        
  0dc5  860A           LDA #0xa                          
  0dc7  3D             MUL                               
  0dc8  CB28           ADDB #0x28                        
  0dca  3404           PSHS  B                           
  0dcc  AD9FFDB8       JSR [0xfdb8]                      
  0dd0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "(        )"
  0dd4  282020202020.. char[11] "(        )"             
LAB_MF8_r1_08000__0ddf:
  0ddf  3504           PULS  B                           
  0de1  5C             INCB                              
  0de2  AD9FFDB8       JSR [0xfdb8]                      
  0de6  170002         LBSR 0x0deb                       
LAB_MF8_r1_08000__0de9:
  0de9  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0deb
FUN_MF8_r1_08000__0deb:
  0deb  3436           PSHS  Y X B A                     
  0ded  7D6105         TST 0x6105                        
  0df0  270D           BEQ 0x0dff                        
  0df2  170523         LBSR 0x1318                       
  0df5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{3:60C6}"
  0df9  0360C600       char[4] 03h,"`",C6h               
LAB_MF8_r1_08000__0dfd:
  0dfd  200D           BRA 0x0e0c                        
LAB_MF8_r1_08000__0dff:
  0dff  17FF65         LBSR 0x0d67                       
  0e02  1F01           TFR D,X                           
  0e04  3004           LEAX 0x4,X                        
  0e06  C608           LDB #0x8                          
  0e08  AD9FFC3A       JSR [0xfc3a]                      
LAB_MF8_r1_08000__0e0c:
  0e0c  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0e0e
FUN_MF8_r1_08000__0e0e:
  0e0e  3436           PSHS  Y X B A                     
  0e10  8600           LDA #0x0                          
  0e12  2010           BRA 0x0e24                        

; ---- function FUN_MF8_r1_08000__0e14
FUN_MF8_r1_08000__0e14:
  0e14  3436           PSHS  Y X B A                     
  0e16  8601           LDA #0x1                          
  0e18  200A           BRA 0x0e24                        

; ---- function FUN_MF8_r1_08000__0e1a
FUN_MF8_r1_08000__0e1a:
  0e1a  3436           PSHS  Y X B A                     
  0e1c  8602           LDA #0x2                          
  0e1e  2004           BRA 0x0e24                        

; ---- function FUN_MF8_r1_08000__0e20
FUN_MF8_r1_08000__0e20:
  0e20  3436           PSHS  Y X B A                     
  0e22  8603           LDA #0x3                          
LAB_MF8_r1_08000__0e24:
  0e24  B7611C         STA 0x611c                        
  0e27  17FF3D         LBSR 0x0d67                       
  0e2a  1F01           TFR D,X                           
  0e2c  10AE8810       LDY 0x10,X                        
  0e30  CC0000         LDD #0x0                          
  0e33  AD9FFE40       JSR [0xfe40]                      
  0e37  17010B         LBSR 0x0f45                       
  0e3a  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}{2:13}|"
  0e3e  020005280213.. char[8] 02h                       
LAB_MF8_r1_08000__0e46:
  0e46  AD9FFDFC       JSR [0xfdfc]                      
  0e4a  1701FA         LBSR 0x1047                       
  0e4d  1026005B       LBNE 0x0eac                       
  0e51  F6611C         LDB 0x611c                        
  0e54  C1FF           CMPB #0xff                        
  0e56  2754           BEQ 0x0eac                        
  0e58  F76125         STB 0x6125                        
  0e5b  F6611C         LDB 0x611c                        
  0e5e  CBB0           ADDB #0xb0                        
  0e60  F760FB         STB 0x60fb                        
  0e63  17FF01         LBSR 0x0d67                       
  0e66  1F01           TFR D,X                           
  0e68  AD9FFDF2       JSR [0xfdf2]                      
  0e6c  F6611C         LDB 0x611c                        
  0e6f  AD9FFE32       JSR [0xfe32]                      
  0e73  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1F}="
  0e77  021F3D00       char[4] 02h,1Fh,"="               
LAB_MF8_r1_08000__0e7b:
  0e7b  C615           LDB #0x15                         
  0e7d  AD9FFDB8       JSR [0xfdb8]                      
  0e81  17FF67         LBSR 0x0deb                       
  0e84  170091         LBSR 0x0f18                       
  0e87  FD6074         STD 0x6074                        
  0e8a  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 04 02 00 01 02 07 00 $2710 $D8F0 $0000 ->$0012 ->$001B $0064 $0001 $0000
  0e8e  01             db 1h                             
  0e8f  04             db 4h                             
  0e90  02             db 2h                             
  0e91  00             db 0h                             
  0e92  01             db 1h                             
  0e93  02             db 2h                             
  0e94  07             db 7h                             
  0e95  00             db 0h                             
  0e96  2710           dw 2710h                          
  0e98  D8F0           dw D8F0h                          
  0e9a  0000           dw 0h                             
  0e9c  0012           addr MF8_r1_08000::0012           
  0e9e  001B           addr MF8_r1_08000::001b           
  0ea0  0064           dw 64h                            
  0ea2  0001           dw 1h                             
  0ea4  0000           dw 0h                             
LAB_MF8_r1_08000__0ea6:
  0ea6  17037F         LBSR 0x1228                       
  0ea9  170002         LBSR 0x0eae                       
LAB_MF8_r1_08000__0eac:
  0eac  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0eae
FUN_MF8_r1_08000__0eae:
  0eae  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:21}{3:609C}"
  0eb2  022103609C00   char[6] 02h,"!",03h,"`",9Ch       
LAB_MF8_r1_08000__0eb8:
  0eb8  39             RTS                               

; ---- function FUN_MF8_r1_08000__0eb9
FUN_MF8_r1_08000__0eb9:
  0eb9  3476           PSHS  U Y X B A                   
  0ebb  327C           LEAS -0x4,S                       
  0ebd  17FEA7         LBSR 0x0d67                       
  0ec0  1F02           TFR D,Y                           
  0ec2  FC6074         LDD 0x6074                        
  0ec5  170065         LBSR 0x0f2d                       
  0ec8  1F21           TFR Y,X                           
  0eca  10AE0E         LDY 0xe,X                         
  0ecd  47             ASRA                              
  0ece  56             RORB                              
  0ecf  AD9FFE40       JSR [0xfe40]                      
  0ed3  1F12           TFR X,Y                           
  0ed5  FC6074         LDD 0x6074                        
  0ed8  8D21           BSR 0x0efb                        
  0eda  8E6B00         LDX #0x6b00                       
  0edd  8613           LDA #0x13                         
  0edf  A7E4           STA ,S                            
LAB_MF8_r1_08000__0ee1:
  0ee1  E6A4           LDB ,Y                            
  0ee3  E1890000       CMPB 0x0,X                        
  0ee7  2606           BNE 0x0eef                        
  0ee9  ECC4           LDD ,U                            
  0eeb  ED890016       STD 0x16,X                        
LAB_MF8_r1_08000__0eef:
  0eef  30890030       LEAX 0x30,X                       
  0ef3  6AE4           DEC ,S                            
  0ef5  26EA           BNE 0x0ee1                        
  0ef7  3264           LEAS 0x4,S                        
  0ef9  35F6           PULS  A B X Y U PC                

; ---- function FUN_MF8_r1_08000__0efb
FUN_MF8_r1_08000__0efb:
  0efb  58             LSLB                              
  0efc  49             ROLA                              
  0efd  3606           PSHU  B A                         
  0eff  CC68DA         LDD #0x68da                       
  0f02  3606           PSHU  B A                         
  0f04  AD9FFCF2       JSR [0xfcf2]                      
  0f08  39             RTS                               

; ---- function FUN_MF8_r1_08000__0f09
FUN_MF8_r1_08000__0f09:
  0f09  3436           PSHS  Y X B A                     
  0f0b  17000A         LBSR 0x0f18                       
  0f0e  8DEB           BSR 0x0efb                        
  0f10  3706           PULU  A B                         
  0f12  ED890016       STD 0x16,X                        
  0f16  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0f18
FUN_MF8_r1_08000__0f18:
  0f18  3430           PSHS  Y X                         
  0f1a  F6611C         LDB 0x611c                        
  0f1d  58             LSLB                              
  0f1e  BE6106         LDX 0x6106                        
  0f21  30890038       LEAX 0x38,X                       
  0f25  3085           LEAX B,X                          
  0f27  AD9FFC7E       JSR [0xfc7e]                      
  0f2b  35B0           PULS  X Y PC                      

; ---- function FUN_MF8_r1_08000__0f2d
FUN_MF8_r1_08000__0f2d:
  0f2d  3436           PSHS  Y X B A                     
  0f2f  F6611C         LDB 0x611c                        
  0f32  58             LSLB                              
  0f33  10BE6106       LDY 0x6106                        
  0f37  31A90038       LEAY 0x38,Y                       
  0f3b  31A5           LEAY B,Y                          
  0f3d  ECE4           LDD ,S                            
  0f3f  AD9FFC82       JSR [0xfc82]                      
  0f43  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0f45
FUN_MF8_r1_08000__0f45:
  0f45  3436           PSHS  Y X B A                     
  0f47  17010B         LBSR 0x1055                       
  0f4a  2655           BNE 0x0fa1                        
  0f4c  327E           LEAS -0x2,S                       
  0f4e  1F12           TFR X,Y                           
  0f50  8E6B00         LDX #0x6b00                       
  0f53  8613           LDA #0x13                         
  0f55  A7E4           STA ,S                            
LAB_MF8_r1_08000__0f57:
  0f57  E621           LDB 0x1,Y                         
  0f59  E1890000       CMPB 0x0,X                        
  0f5d  260F           BNE 0x0f6e                        
  0f5f  EC890011       LDD 0x11,X                        
  0f63  3406           PSHS  B A                         
  0f65  F66024         LDB 0x6024                        
  0f68  3404           PSHS  B                           
  0f6a  AD9FFE4E       JSR [0xfe4e]                      
LAB_MF8_r1_08000__0f6e:
  0f6e  30890030       LEAX 0x30,X                       
  0f72  6AE4           DEC ,S                            
  0f74  26E1           BNE 0x0f57                        
  0f76  3262           LEAS 0x2,S                        
  0f78  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:15} --- Triggered --- "
  0f7c  0215202D2D2D.. char[22] 02h,15h," --- Triggered --- "
LAB_MF8_r1_08000__0f92:
  0f92  AD9FFE4A       JSR [0xfe4a]                      
  0f96  1700AE         LBSR 0x1047                       
  0f99  2706           BEQ 0x0fa1                        
  0f9b  F66125         LDB 0x6125                        
  0f9e  F7611C         STB 0x611c                        
LAB_MF8_r1_08000__0fa1:
  0fa1  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__0fa3
FUN_MF8_r1_08000__0fa3:
  0fa3  3436           PSHS  Y X B A                     
  0fa5  327C           LEAS -0x4,S                       
  0fa7  C6FF           LDB #0xff                         
  0fa9  E761           STB 0x1,S                         
  0fab  C600           LDB #0x0                          
LAB_MF8_r1_08000__0fad:
  0fad  F7611C         STB 0x611c                        
  0fb0  17FDB4         LBSR 0x0d67                       
  0fb3  1F02           TFR D,Y                           
  0fb5  8613           LDA #0x13                         
  0fb7  A7E4           STA ,S                            
  0fb9  8E6B00         LDX #0x6b00                       
LAB_MF8_r1_08000__0fbc:
  0fbc  E6890000       LDB 0x0,X                         
  0fc0  E121           CMPB 0x1,Y                        
  0fc2  2602           BNE 0x0fc6                        
  0fc4  6F61           CLR 0x1,S                         
LAB_MF8_r1_08000__0fc6:
  0fc6  E1A4           CMPB ,Y                           
  0fc8  2605           BNE 0x0fcf                        
  0fca  6F61           CLR 0x1,S                         
  0fcc  17FF3A         LBSR 0x0f09                       
LAB_MF8_r1_08000__0fcf:
  0fcf  30890030       LEAX 0x30,X                       
  0fd3  6AE4           DEC ,S                            
  0fd5  26E5           BNE 0x0fbc                        
  0fd7  F6611C         LDB 0x611c                        
  0fda  5C             INCB                              
  0fdb  C104           CMPB #0x4                         
  0fdd  26CE           BNE 0x0fad                        
  0fdf  6D61           TST 0x1,S                         
  0fe1  2623           BNE 0x1006                        
  0fe3  17F050         LBSR 0x0036                       
  0fe6  AD9FFE92       JSR [0xfe92]                      
  0fea  C600           LDB #0x0                          
LAB_MF8_r1_08000__0fec:
  0fec  F7611C         STB 0x611c                        
  0fef  170055         LBSR 0x1047                       
  0ff2  2605           BNE 0x0ff9                        
  0ff4  17005E         LBSR 0x1055                       
  0ff7  2607           BNE 0x1000                        
LAB_MF8_r1_08000__0ff9:
  0ff9  5C             INCB                              
  0ffa  C104           CMPB #0x4                         
  0ffc  26EE           BNE 0x0fec                        
  0ffe  2006           BRA 0x1006                        
LAB_MF8_r1_08000__1000:
  1000  58             LSLB                              
  1001  8E603C         LDX #0x603c                       
  1004  AD95           JSR [B,X]                         
LAB_MF8_r1_08000__1006:
  1006  3264           LEAS 0x4,S                        
  1008  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__100a
FUN_MF8_r1_08000__100a:
  100a  3436           PSHS  Y X B A                     
  100c  327E           LEAS -0x2,S                       
  100e  C600           LDB #0x0                          
LAB_MF8_r1_08000__1010:
  1010  F7611C         STB 0x611c                        
  1013  17FD51         LBSR 0x0d67                       
  1016  1F02           TFR D,Y                           
  1018  8613           LDA #0x13                         
  101a  A7E4           STA ,S                            
  101c  8E6B00         LDX #0x6b00                       
LAB_MF8_r1_08000__101f:
  101f  E6890000       LDB 0x0,X                         
  1023  E1A4           CMPB ,Y                           
  1025  2603           BNE 0x102a                        
  1027  17FEDF         LBSR 0x0f09                       
LAB_MF8_r1_08000__102a:
  102a  30890030       LEAX 0x30,X                       
  102e  6AE4           DEC ,S                            
  1030  26ED           BNE 0x101f                        
  1032  F6611C         LDB 0x611c                        
  1035  5C             INCB                              
  1036  C104           CMPB #0x4                         
  1038  26D6           BNE 0x1010                        
  103a  3262           LEAS 0x2,S                        
  103c  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__103e
FUN_MF8_r1_08000__103e:
  103e  170006         LBSR 0x1047                       
  1041  2703           BEQ 0x1046                        
  1043  17000F         LBSR 0x1055                       
LAB_MF8_r1_08000__1046:
  1046  39             RTS                               

; ---- function FUN_MF8_r1_08000__1047
FUN_MF8_r1_08000__1047:
  1047  3436           PSHS  Y X B A                     
  1049  17FD1B         LBSR 0x0d67                       
  104c  1F02           TFR D,Y                           
  104e  E6A4           LDB ,Y                            
  1050  170010         LBSR 0x1063                       
  1053  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1055
FUN_MF8_r1_08000__1055:
  1055  3436           PSHS  Y X B A                     
  1057  17FD0D         LBSR 0x0d67                       
  105a  1F02           TFR D,Y                           
  105c  E621           LDB 0x1,Y                         
  105e  170002         LBSR 0x1063                       
  1061  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1063
FUN_MF8_r1_08000__1063:
  1063  3436           PSHS  Y X B A                     
  1065  3406           PSHS  B A                         
  1067  8613           LDA #0x13                         
  1069  A7E4           STA ,S                            
  106b  8E6B00         LDX #0x6b00                       
LAB_MF8_r1_08000__106e:
  106e  E6890000       LDB 0x0,X                         
  1072  E161           CMPB 0x1,S                        
  1074  270A           BEQ 0x1080                        
  1076  30890030       LEAX 0x30,X                       
  107a  6AE4           DEC ,S                            
  107c  26F0           BNE 0x106e                        
  107e  1CFB           ANDCC #0xfb                       
LAB_MF8_r1_08000__1080:
  1080  3262           LEAS 0x2,S                        
  1082  3536           PULS  A B X Y                     
  1084  39             RTS                               

; ---- function FUN_MF8_r1_08000__1085
FUN_MF8_r1_08000__1085:
  1085  3404           PSHS  B                           
  1087  7D6105         TST 0x6105                        
  108a  2713           BEQ 0x109f                        
  108c  F660B9         LDB 0x60b9                        
  108f  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$10A2(rel) "(SoftFunc)"
  1093  000F           dw Fh                             
  1095  28536F667446.. ds "(SoftFunc)"                   
LAB_MF8_r1_08000__109f:
  109f  3504           PULS  B                           
  10a1  39             RTS                               

; ---- function FUN_MF8_r1_08000__10a2
FUN_MF8_r1_08000__10a2:
  10a2  3436           PSHS  Y X B A                     
  10a4  FCFDC4         LDD 0xfdc4                        
  10a7  FD6036         STD 0x6036                        
  10aa  CC0000         LDD #0x0                          
  10ad  F7611C         STB 0x611c                        
  10b0  4F             CLRA                              
  10b1  FD6074         STD 0x6074                        
  10b4  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$10D1(rel)
  10b8  0019           dw 19h                            
LAB_MF8_r1_08000__10ba:
  10ba  AD9FFDC8       JSR [0xfdc8]                      
  10be  C600           LDB #0x0                          
  10c0  F760B9         STB 0x60b9                        
  10c3  170039         LBSR 0x10ff                       
  10c6  7F611C         CLR 0x611c                        
  10c9  FCFDCA         LDD 0xfdca                        
  10cc  FD6030         STD 0x6030                        
  10cf  35B6           PULS  A B X Y PC                  
DAT_MF8_r1_08000__10d1:
  10d1  00             ?? 00h                            
  10d2  .db 00 00 14 00 6E 00 94 00 F4 00 00 00 00 00 00 00  ; ....n...........
  10e2  .db 00 01 14 FF FF                                   ; .....

; ---- function FUN_MF8_r1_08000__10e7
FUN_MF8_r1_08000__10e7:
  10e7  3416           PSHS  X B A                       
  10e9  F660B9         LDB 0x60b9                        
  10ec  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$10FF(rel) "( Select )"
  10f0  000F           dw Fh                             
  10f2  282053656C65.. ds "( Select )"                   
LAB_MF8_r1_08000__10fc:
  10fc  3516           PULS  A B X                       
  10fe  39             RTS                               

; ---- function FUN_MF8_r1_08000__10ff
FUN_MF8_r1_08000__10ff:
  10ff  3436           PSHS  Y X B A                     
  1101  AD9FFDF2       JSR [0xfdf2]                      
  1105  F660B9         LDB 0x60b9                        
  1108  AD9FFE32       JSR [0xfe32]                      
  110c  F6611C         LDB 0x611c                        
  110f  5C             INCB                              
  1110  1D             SEX                               
  1111  FD6074         STD 0x6074                        
  1114  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 50 01 64 03 00 01 00 $0004 $0001 $0000 ->$0000 ->$000D $0001 $0001 $0000
  1118  01             db 1h                             
  1119  50             db 50h                            
  111a  01             db 1h                             
  111b  64             db 64h                            
  111c  03             db 3h                             
  111d  00             db 0h                             
  111e  01             db 1h                             
  111f  00             db 0h                             
  1120  0004           dw 4h                             
  1122  0001           dw 1h                             
  1124  0000           dw 0h                             
  1126  0000           addr MF8_r1_08000::0000           
  1128  000D           addr MF8_r1_08000::000d           
  112a  0001           dw 1h                             
  112c  0001           dw 1h                             
  112e  0000           dw 0h                             
LAB_MF8_r1_08000__1130:
  1130  8D03           BSR 0x1135                        
  1132  3536           PULS  A B X Y                     
  1134  39             RTS                               

; ---- function FUN_MF8_r1_08000__1135
FUN_MF8_r1_08000__1135:
  1135  3406           PSHS  B A                         
  1137  FC6074         LDD 0x6074                        
  113a  5A             DECB                              
  113b  F7611C         STB 0x611c                        
  113e  170176         LBSR 0x12b7                       
  1141  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__1143
FUN_MF8_r1_08000__1143:
  1143  3416           PSHS  X B A                       
  1145  F660B9         LDB 0x60b9                        
  1148  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$115B(rel) "(  Name  )"
  114c  000F           dw Fh                             
  114e  2820204E616D.. ds "(  Name  )"                   
LAB_MF8_r1_08000__1158:
  1158  3516           PULS  A B X                       
  115a  39             RTS                               

; ---- function FUN_MF8_r1_08000__115b
FUN_MF8_r1_08000__115b:
  115b  3436           PSHS  Y X B A                     
  115d  AD9FFDC6       JSR [0xfdc6]                      
  1161  860B           LDA #0xb                          
  1163  C608           LDB #0x8                          
  1165  AD9FFE64       JSR [0xfe64]                      
  1169  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__116b
FUN_MF8_r1_08000__116b:
  116b  3416           PSHS  X B A                       
  116d  F660B9         LDB 0x60b9                        
  1170  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$1183(rel) "(  Sens  )"
  1174  000F           dw Fh                             
  1176  28202053656E.. ds "(  Sens  )"                   
LAB_MF8_r1_08000__1180:
  1180  3516           PULS  A B X                       
  1182  39             RTS                               

; ---- function FUN_MF8_r1_08000__1183
FUN_MF8_r1_08000__1183:
  1183  3436           PSHS  Y X B A                     
  1185  AD9FFDF2       JSR [0xfdf2]                      
  1189  F660B9         LDB 0x60b9                        
  118c  AD9FFE32       JSR [0xfe32]                      
  1190  1700D6         LBSR 0x1269                       
  1193  C407           ANDB #0x7                         
  1195  1D             SEX                               
  1196  FD6074         STD 0x6074                        
  1199  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 28 01 64 02 00 01 00 $0007 $0000 $0000 ->$0000 ->$000B $0001 $0001 $0000
  119d  01             db 1h                             
  119e  28             db 28h                            
  119f  01             db 1h                             
  11a0  64             db 64h                            
  11a1  02             db 2h                             
  11a2  00             db 0h                             
  11a3  01             db 1h                             
  11a4  00             db 0h                             
  11a5  0007           dw 7h                             
  11a7  0000           dw 0h                             
  11a9  0000           dw 0h                             
  11ab  0000           addr MF8_r1_08000::0000           
  11ad  000B           addr MF8_r1_08000::000b           
  11af  0001           dw 1h                             
  11b1  0001           dw 1h                             
  11b3  0000           dw 0h                             
LAB_MF8_r1_08000__11b5:
  11b5  3536           PULS  A B X Y                     
  11b7  39             RTS                               

; ---- function FUN_MF8_r1_08000__11b8
FUN_MF8_r1_08000__11b8:
  11b8  3436           PSHS  Y X B A                     
  11ba  1700AC         LBSR 0x1269                       
  11bd  C408           ANDB #0x8                         
  11bf  FA6075         ORB 0x6075                        
  11c2  1700B9         LBSR 0x127e                       
  11c5  1700EF         LBSR 0x12b7                       
  11c8  1700EB         LBSR 0x12b6                       
  11cb  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__11cd
FUN_MF8_r1_08000__11cd:
  11cd  3416           PSHS  X B A                       
  11cf  F660B9         LDB 0x60b9                        
  11d2  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$11E5(rel) "(Polarity)"
  11d6  000F           dw Fh                             
  11d8  28506F6C6172.. ds "(Polarity)"                   
LAB_MF8_r1_08000__11e2:
  11e2  3516           PULS  A B X                       
  11e4  39             RTS                               

; ---- function FUN_MF8_r1_08000__11e5
FUN_MF8_r1_08000__11e5:
  11e5  3436           PSHS  Y X B A                     
  11e7  17007F         LBSR 0x1269                       
  11ea  C808           EORB #0x8                         
  11ec  17008F         LBSR 0x127e                       
  11ef  1700C5         LBSR 0x12b7                       
  11f2  1700C1         LBSR 0x12b6                       
  11f5  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__11f7
FUN_MF8_r1_08000__11f7:
  11f7  3404           PSHS  B                           
  11f9  F660B9         LDB 0x60b9                        
  11fc  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$120E(rel) "(  Done  )"
  1200  000E           dw Eh                             
  1202  282020446F6E.. ds "(  Done  )"                   
LAB_MF8_r1_08000__120c:
  120c  3584           PULS  B PC                        

; ---- function FUN_MF8_r1_08000__120e
FUN_MF8_r1_08000__120e:
  120e  3436           PSHS  Y X B A                     
  1210  AD9FFE66       JSR [0xfe66]                      
  1214  170126         LBSR 0x133d                       
  1217  170112         LBSR 0x132c                       
  121a  AD9FFDC6       JSR [0xfdc6]                      
  121e  C600           LDB #0x0                          
  1220  F760B9         STB 0x60b9                        
  1223  17FED9         LBSR 0x10ff                       
  1226  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1228
FUN_MF8_r1_08000__1228:
  1228  3436           PSHS  Y X B A                     
  122a  327C           LEAS -0x4,S                       
  122c  7D6105         TST 0x6105                        
  122f  2734           BEQ 0x1265                        
  1231  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$1296(rel)
  1235  0061           dw 61h                            
LAB_MF8_r1_08000__1237:
  1237  1F01           TFR D,X                           
  1239  17002D         LBSR 0x1269                       
  123c  E7E4           STB ,S                            
  123e  C407           ANDB #0x7                         
  1240  58             LSLB                              
  1241  58             LSLB                              
  1242  CB02           ADDB #0x2                         
  1244  3085           LEAX B,X                          
  1246  EC84           LDD ,X                            
  1248  ED62           STD 0x2,S                         
  124a  C608           LDB #0x8                          
  124c  E5E4           BITB ,S                           
  124e  260C           BNE 0x125c                        
  1250  CC0000         LDD #0x0                          
  1253  FD606E         STD 0x606e                        
  1256  EC62           LDD 0x2,S                         
  1258  44             LSRA                              
  1259  56             RORB                              
  125a  ED62           STD 0x2,S                         
LAB_MF8_r1_08000__125c:
  125c  EC62           LDD 0x2,S                         
  125e  FD60DC         STD 0x60dc                        
  1261  AD9FFC14       JSR [0xfc14]                      
LAB_MF8_r1_08000__1265:
  1265  3264           LEAS 0x4,S                        
  1267  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1269
FUN_MF8_r1_08000__1269:
  1269  3432           PSHS  Y X A                       
  126b  BE6106         LDX 0x6106                        
  126e  CC0000         LDD #0x0                          
  1271  308B           LEAX D,X                          
  1273  F6611C         LDB 0x611c                        
  1276  308B           LEAX D,X                          
  1278  AD9FFC7C       JSR [0xfc7c]                      
  127c  35B2           PULS  A X Y PC                    

; ---- function FUN_MF8_r1_08000__127e
FUN_MF8_r1_08000__127e:
  127e  3436           PSHS  Y X B A                     
  1280  10BE6106       LDY 0x6106                        
  1284  CC0000         LDD #0x0                          
  1287  31AB           LEAY D,Y                          
  1289  F6611C         LDB 0x611c                        
  128c  31A5           LEAY B,Y                          
  128e  E661           LDB 0x1,S                         
  1290  AD9FFC80       JSR [0xfc80]                      
  1294  35B6           PULS  A B X Y PC                  
DAT_MF8_r1_08000__1296:
  1296  00             ?? 00h                            
  1297  .db 14 03 E8 00 32 01 90 00 64 00 C8 00 C8 00 64 01  ; ....2...d.....d.
  12a7  .db F4 00 28 03 E8 00 14 07 D0 00 0A 13 88 00 04     ; ..(............

; ---- function FUN_MF8_r1_08000__12b6
FUN_MF8_r1_08000__12b6:
  12b6  39             RTS                               

; ---- function FUN_MF8_r1_08000__12b7
FUN_MF8_r1_08000__12b7:
  12b7  3436           PSHS  Y X B A                     
  12b9  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$1296(rel)
  12bd  FFD9           dw FFD9h                          
LAB_MF8_r1_08000__12bf:
  12bf  1F01           TFR D,X                           
  12c1  17FFA5         LBSR 0x1269                       
  12c4  C407           ANDB #0x7                         
  12c6  58             LSLB                              
  12c7  58             LSLB                              
  12c8  EC85           LDD B,X                           
  12ca  3606           PSHU  B A                         
  12cc  170049         LBSR 0x1318                       
  12cf  F6611C         LDB 0x611c                        
  12d2  5C             INCB                              
  12d3  4F             CLRA                              
  12d4  3606           PSHU  B A                         
  12d6  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}Soft {4:2000}{3:60AC} is "{2:0B}{3:60C6}" Sens= {4:0000}{3:60A9} Pol= +{5:01}"
  12da  0200536F6674.. char[47] 02h                      
LAB_MF8_r1_08000__1309:
  1309  17FF5D         LBSR 0x1269                       
  130c  C508           BITB #0x8                         
  130e  2706           BEQ 0x1316                        
  1310  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "-"
  1314  2D00           char[2] "-"                       
LAB_MF8_r1_08000__1316:
  1316  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1318
FUN_MF8_r1_08000__1318:
  1318  3436           PSHS  Y X B A                     
  131a  170020         LBSR 0x133d                       
  131d  108E60C6       LDY #0x60c6                       
  1321  CC0008         LDD #0x8                          
  1324  AD9FFE82       JSR [0xfe82]                      
  1328  6FA4           CLR ,Y                            
  132a  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__132c
FUN_MF8_r1_08000__132c:
  132c  3436           PSHS  Y X B A                     
  132e  108E60C6       LDY #0x60c6                       
  1332  1E12           EXG X,Y                           
  1334  CC0008         LDD #0x8                          
  1337  AD9FFE84       JSR [0xfe84]                      
  133b  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__133d
FUN_MF8_r1_08000__133d:
  133d  3406           PSHS  B A                         
  133f  BE6106         LDX 0x6106                        
  1342  F6611C         LDB 0x611c                        
  1345  8608           LDA #0x8                          
  1347  3D             MUL                               
  1348  C30008         ADDD #0x8                         
  134b  308B           LEAX D,X                          
  134d  3586           PULS  A B PC                      

;; Module F8 code record 05, 1112 bytes, entered at payload start
MODULE_F8_05_CODE_hdr:
  134f  F80504600000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end

; ---- function MODULE_F8_05_entry
MODULE_F8_05_entry:
  1357  3406           PSHS  B A                         
  1359  C6A2           LDB #0xa2                         
  135b  F760FB         STB 0x60fb                        
  135e  AD9FFC88       JSR [0xfc88]                      
  1362  FCFDC4         LDD 0xfdc4                        
  1365  FD6036         STD 0x6036                        
  1368  FCFDC6         LDD 0xfdc6                        
  136b  FD6030         STD 0x6030                        
  136e  17EDA8         LBSR 0x0119                       
  1371  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}MIDI Program Change Functions"
  1375  014D49444920.. char[31] 01h,"MIDI Program Change Functions"
LAB_MF8_r1_08000__1394:
  1394  7D611A         TST 0x611a                        
  1397  2712           BEQ 0x13ab                        
  1399  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:1C}<SEQUENCED>"
  139d  021C3C534551.. char[14] 02h,1Ch,"<SEQUENCED>"    
LAB_MF8_r1_08000__13ab:
  13ab  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__13ad
FUN_MF8_r1_08000__13ad:
  13ad  3406           PSHS  B A                         
  13af  F660B9         LDB 0x60b9                        
  13b2  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$13C7(rel) "( Pgm=   )"
  13b6  0011           dw 11h                            
  13b8  282050676D3D.. ds "( Pgm=   )"                   
LAB_MF8_r1_08000__13c2:
  13c2  1700E4         LBSR 0x14a9                       
  13c5  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__13c7
FUN_MF8_r1_08000__13c7:
  13c7  3436           PSHS  Y X B A                     
  13c9  7D611A         TST 0x611a                        
  13cc  2628           BNE 0x13f6                        
  13ce  8E028D         LDX #0x28d                        
  13d1  AD9FFC7C       JSR [0xfc7c]                      
  13d5  AD9FFE7E       JSR [0xfe7e]                      
  13d9  1F12           TFR X,Y                           
  13db  AD9FFC80       JSR [0xfc80]                      
  13df  AD9FFE5E       JSR [0xfe5e]                       ; inline[API_FE5E]: $1482 $1459
  13e3  1482           dw 1482h                          
  13e5  1459           dw 1459h                          
LAB_MF8_r1_08000__13e7:
  13e7  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}{6}"
  13eb  020005280600   char[6] 02h                       
LAB_MF8_r1_08000__13f1:
  13f1  1700B5         LBSR 0x14a9                       
LAB_MF8_r1_08000__13f4:
  13f4  35B6           PULS  A B X Y PC                  
LAB_MF8_r1_08000__13f6:
  13f6  8D02           BSR 0x13fa                        
  13f8  20FA           BRA 0x13f4                        

; ---- function FUN_MF8_r1_08000__13fa
FUN_MF8_r1_08000__13fa:
  13fa  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Changing this is not allowed because    Program Sequencing Reception is Enabled "
  13fe  014368616E67.. char[82] 01h,"Changing this is not allowed because    Program Sequencing Reception is Enabled "
LAB_MF8_r1_08000__1450:
  1450  AD9FFE4A       JSR [0xfe4a]                      
  1454  AD9FFDC2       JSR [0xfdc2]                      
  1458  39             RTS                               
  1459  .db 49 44 20 4E 75 6D 62 65 72 73 20 61 72 65 20 75  ; ID Numbers are u
  1469  .db 73 65 64 20 66 6F 72 20 50 72 6F 67 72 61 6D 20  ; sed for Program 
  1479  .db 43 68 61 6E 67 69 6E 67 00                       ; Changing.
  1482  50726F677261.. ds "Program Map Table is used for Changing"

; ---- function FUN_MF8_r1_08000__14a9
FUN_MF8_r1_08000__14a9:
  14a9  3436           PSHS  Y X B A                     
  14ab  C638           LDB #0x38                         
  14ad  AD9FFC36       JSR [0xfc36]                      
  14b1  7D611A         TST 0x611a                        
  14b4  260A           BNE 0x14c0                        
  14b6  8E028D         LDX #0x28d                        
  14b9  AD9FFC7C       JSR [0xfc7c]                      
  14bd  5D             TSTB                              
  14be  260A           BNE 0x14ca                        
LAB_MF8_r1_08000__14c0:
  14c0  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "ID "
  14c4  49442000       char[4] "ID "                     
LAB_MF8_r1_08000__14c8:
  14c8  2008           BRA 0x14d2                        
LAB_MF8_r1_08000__14ca:
  14ca  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "Map"
  14ce  4D617000       char[4] "Map"                     
LAB_MF8_r1_08000__14d2:
  14d2  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__14d4
FUN_MF8_r1_08000__14d4:
  14d4  3436           PSHS  Y X B A                     
  14d6  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$14FE(rel) "(Bank=   )"
  14da  0024           dw 24h                            
  14dc  2842616E6B3D.. ds "(Bank=   )"                   
LAB_MF8_r1_08000__14e6:
  14e6  8E029B         LDX #0x29b                        
  14e9  AD9FFC7E       JSR [0xfc7e]                      
  14ed  3606           PSHU  B A                         
  14ef  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:4D}{4:2000}{3:60AB}"
  14f3  024D04200003.. char[9] 02h,"M",04h," "           
LAB_MF8_r1_08000__14fc:
  14fc  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__14fe
FUN_MF8_r1_08000__14fe:
  14fe  3436           PSHS  Y X B A                     
  1500  AD9FFDF2       JSR [0xfdf2]                      
  1504  F660B9         LDB 0x60b9                        
  1507  AD9FFE32       JSR [0xfe32]                      
  150b  8E029B         LDX #0x29b                        
  150e  AD9FFC7E       JSR [0xfc7e]                      
  1512  FD6074         STD 0x6074                        
  1515  AD9FFC16       JSR [0xfc16]                       ; inline[API_FC16]: 01 10 02 64 01 00 02 00 $000A $0000 $0000 ->$000E ->$0039 $0001 $0001 $0000
  1519  01             db 1h                             
  151a  10             db 10h                            
  151b  02             db 2h                             
  151c  64             db 64h                            
  151d  01             db 1h                             
  151e  00             db 0h                             
  151f  02             db 2h                             
  1520  00             db 0h                             
  1521  000A           dw Ah                             
  1523  0000           dw 0h                             
  1525  0000           dw 0h                             
  1527  000E           addr MF8_r1_08000::000e           
  1529  0039           addr MF8_r1_08000::0039           
  152b  0001           dw 1h                             
  152d  0001           dw 1h                             
  152f  0000           dw 0h                             
LAB_MF8_r1_08000__1531:
  1531  8D02           BSR 0x1535                        
  1533  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1535
FUN_MF8_r1_08000__1535:
  1535  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}MIDI Program Change Bank = {5:0D}{3:60A1}{2:4D}{3:60A1}"
  1539  02004D494449.. char[40] 02h                      
LAB_MF8_r1_08000__1561:
  1561  39             RTS                               

; ---- function FUN_MF8_r1_08000__1562
FUN_MF8_r1_08000__1562:
  1562  3426           PSHS  Y B A                       
  1564  FC6074         LDD 0x6074                        
  1567  108E029B       LDY #0x29b                        
  156b  AD9FFC82       JSR [0xfc82]                      
  156f  35A6           PULS  A B Y PC                    

; ---- function FUN_MF8_r1_08000__1571
FUN_MF8_r1_08000__1571:
  1571  3436           PSHS  Y X B A                     
  1573  F660B9         LDB 0x60b9                        
  1576  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$1588(rel) "(        )"
  157a  000E           dw Eh                             
  157c  282020202020.. ds "(        )"                   
LAB_MF8_r1_08000__1586:
  1586  203B           BRA 0x15c3                        

; ---- function FUN_MF8_r1_08000__1588
FUN_MF8_r1_08000__1588:
  1588  3436           PSHS  Y X B A                     
  158a  7D611A         TST 0x611a                        
  158d  2671           BNE 0x1600                        
  158f  8E028E         LDX #0x28e                        
  1592  AD9FFC7C       JSR [0xfc7c]                      
  1596  AD9FFE7E       JSR [0xfe7e]                      
  159a  1F12           TFR X,Y                           
  159c  AD9FFC80       JSR [0xfc80]                      
  15a0  53             COMB                              
  15a1  AD9FFE7C       JSR [0xfe7c]                      
  15a5  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}{5:28}MIDI Program Change {6}"
  15a9  020005284D49.. char[26] 02h                      

; ---- function FUN_MF8_r1_08000__15c3
FUN_MF8_r1_08000__15c3:
  15c3  8E028E         LDX #0x28e                        
  15c6  AD9FFC7C       JSR [0xfc7c]                      
  15ca  5D             TSTB                              
  15cb  2720           BEQ 0x15ed                        
  15cd  7D611A         TST 0x611a                        
  15d0  261B           BNE 0x15ed                        
  15d2  C601           LDB #0x1                          
  15d4  1F12           TFR X,Y                           
  15d6  AD9FFC80       JSR [0xfc80]                      
  15da  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:3C}( Pgm=Off)"
  15de  023C28205067.. char[13] 02h,"<( Pgm=Off)"        
LAB_MF8_r1_08000__15eb:
  15eb  2011           BRA 0x15fe                        
LAB_MF8_r1_08000__15ed:
  15ed  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:3C}( Pgm=On )"
  15f1  023C28205067.. char[13] 02h,"<( Pgm=On )"        
LAB_MF8_r1_08000__15fe:
  15fe  35B6           PULS  A B X Y PC                  
LAB_MF8_r1_08000__1600:
  1600  17FDF7         LBSR 0x13fa                       
  1603  20F9           BRA 0x15fe                        

; ---- function FUN_MF8_r1_08000__1605
FUN_MF8_r1_08000__1605:
  1605  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$1616(rel) "( Dumps  )"
  1609  000D           dw Dh                             
  160b  282044756D70.. ds "( Dumps  )"                   
LAB_MF8_r1_08000__1615:
  1615  39             RTS                               

; ---- function FUN_MF8_r1_08000__1616
FUN_MF8_r1_08000__1616:
  1616  3436           PSHS  Y X B A                     
  1618  AD9FFE90       JSR [0xfe90]                       ; inline[addr:9CDD]: ->$1624(rel)
  161c  0008           dw 8h                             
LAB_MF8_r1_08000__161e:
  161e  AD9FFDC8       JSR [0xfdc8]                      
  1622  35B6           PULS  A B X Y PC                  
DAT_MF8_r1_08000__1624:
  1624  00             ?? 00h                            
  1625  .db 0C 00 3A 00 B1 01 19 00 00 FF FF                 ; ..:........

; ---- function FUN_MF8_r1_08000__1630
FUN_MF8_r1_08000__1630:
  1630  3406           PSHS  B A                         
  1632  C6A6           LDB #0xa6                         
  1634  F760FB         STB 0x60fb                        
  1637  AD9FFC88       JSR [0xfc88]                      
  163b  FCFDCA         LDD 0xfdca                        
  163e  FD6036         STD 0x6036                        
  1641  FD6030         STD 0x6030                        
  1644  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Dump Data Functions "
  1648  0144756D7020.. char[22] 01h,"Dump Data Functions "
LAB_MF8_r1_08000__165e:
  165e  3586           PULS  A B PC                      

; ---- function FUN_MF8_r1_08000__1660
FUN_MF8_r1_08000__1660:
  1660  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$1671(rel) "(DumpEdit)"
  1664  000D           dw Dh                             
  1666  2844756D7045.. ds "(DumpEdit)"                   
LAB_MF8_r1_08000__1670:
  1670  39             RTS                               

; ---- function FUN_MF8_r1_08000__1671
FUN_MF8_r1_08000__1671:
  1671  3436           PSHS  Y X B A                     
  1673  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Sending Current Edited Program to MIDI "
  1677  0153656E6469.. char[41] 01h,"Sending Current Edited Program to MIDI "
LAB_MF8_r1_08000__16a0:
  16a0  AD9FFE46       JSR [0xfe46]                      
  16a4  AD9FFDC2       JSR [0xfdc2]                      
  16a8  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}Current Edit has been sent to MIDI      "
  16ac  020043757272.. char[43] 02h                      
LAB_MF8_r1_08000__16d7:
  16d7  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__16d9
FUN_MF8_r1_08000__16d9:
  16d9  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$16EA(rel) "(Dump Pre)"
  16dd  000D           dw Dh                             
  16df  2844756D7020.. ds "(Dump Pre)"                   
LAB_MF8_r1_08000__16e9:
  16e9  39             RTS                               

; ---- function FUN_MF8_r1_08000__16ea
FUN_MF8_r1_08000__16ea:
  16ea  3436           PSHS  Y X B A                     
  16ec  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Sending Presets to MIDI "
  16f0  0153656E6469.. char[26] 01h,"Sending Presets to MIDI "
LAB_MF8_r1_08000__170a:
  170a  AD9FFE42       JSR [0xfe42]                      
  170e  AD9FFDC2       JSR [0xfdc2]                      
  1712  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}The Presets have been sent to MIDI      "
  1716  020054686520.. char[43] 02h                      
LAB_MF8_r1_08000__1741:
  1741  35B6           PULS  A B X Y PC                  

; ---- function FUN_MF8_r1_08000__1743
FUN_MF8_r1_08000__1743:
  1743  AD9FFC8A       JSR [0xfc8a]                       ; inline[API_FC8A]: ->$1754(rel) "(Dump Map)"
  1747  000D           dw Dh                             
  1749  2844756D7020.. ds "(Dump Map)"                   
LAB_MF8_r1_08000__1753:
  1753  39             RTS                               

; ---- function FUN_MF8_r1_08000__1754
FUN_MF8_r1_08000__1754:
  1754  3436           PSHS  Y X B A                     
  1756  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{1}Sending Map Table to MIDI "
  175a  0153656E6469.. char[28] 01h,"Sending Map Table to MIDI "
LAB_MF8_r1_08000__1776:
  1776  AD9FFE44       JSR [0xfe44]                      
  177a  AD9FFDC2       JSR [0xfdc2]                      
  177e  AD9FFC38       JSR [0xfc38]                       ; inline[API_FC38]: "{2:00}The Map Table has been sent to MIDI     "
  1782  020054686520.. char[43] 02h                      
LAB_MF8_r1_08000__17ad:
  17ad  35B6           PULS  A B X Y PC                  

;; Record FFF0, 1540 bytes
REC_FFF0_hdr:
  17af  FFF0060C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
REC_FFF0:
  17b7  50             ?? 50h    P                       
  17b8  .db 61 74 63 68 20 69 73 20 64 69 73 61 62 6C 65 64  ; atch is disabled
  17c8  .db 20 20 20 20 20 20 20 20 20 20 20 4D 6F 64 75 6C  ;            Modul
  17d8  .db 61 74 69 6F 6E 20 57 68 65 65 6C 20 20 20 20 20  ; ation Wheel     
  17e8  .db 20 20 20 20 20 20 20 50 69 74 63 68 20 57 68 65  ;        Pitch Whe
  17f8  .db 65 6C 20 6F 6E 6C 79 20 20 20 20 20 20 20 20 20  ; el only         
  1808  .db 20 20 20 50 69 74 63 68 20 57 68 65 65 6C 20 50  ;    Pitch Wheel P
  1818  .db 6F 73 69 74 69 76 65 20 20 20 20 20 20 20 20 46  ; ositive        F
  1828  .db 69 72 73 74 20 4E 6F 74 65 20 26 20 50 57 3D 20  ; irst Note & PW= 
  1838  .db 20 20 20 20 20 20 20 20 20 20 20 4C 61 73 74 20  ;            Last 
  1848  .db 4E 6F 74 65 20 26 20 20 50 57 3D 20 20 20 20 20  ; Note &  PW=     
  1858  .db 20 20 20 20 20 20 20 48 69 67 68 20 4E 6F 74 65  ;        High Note
  1868  .db 20 26 20 20 50 57 3D 20 20 20 20 20 20 20 20 20  ;  &  PW=         
  1878  .db 20 20 20 4C 6F 77 20 4E 6F 74 65 20 61 6E 64 20  ;    Low Note and 
  1888  .db 50 57 3D 20 20 20 20 20 20 20 20 20 20 20 20 4E  ; PW=            N
  1898  .db 6F 74 65 20 4F 66 66 73 65 74 20 20 50 57 3D 20  ; ote Offset  PW= 
  18a8  .db 20 20 20 20 20 20 20 20 20 20 20 51 75 61 6E 74  ;            Quant
  18b8  .db 69 74 79 20 6F 66 20 4E 6F 74 65 73 20 44 6F 77  ; ity of Notes Dow
  18c8  .db 6E 20 20 20 20 20 20 46 69 72 73 74 20 4E 6F 74  ; n      First Not
  18d8  .db 65 20 56 65 6C 6F 63 69 74 79 20 20 20 20 20 20  ; e Velocity      
  18e8  .db 20 20 20 4C 61 73 74 20 4E 6F 74 65 20 56 65 6C  ;    Last Note Vel
  18f8  .db 6F 63 69 74 79 20 20 20 20 20 20 20 20 20 20 48  ; ocity          H
  1908  .db 69 67 68 20 4E 6F 74 65 20 56 65 6C 6F 63 69 74  ; igh Note Velocit
  1918  .db 79 20 20 20 20 20 20 20 20 20 20 4C 6F 77 20 4E  ; y          Low N
  1928  .db 6F 74 65 20 56 65 6C 6F 63 69 74 79 20 20 20 20  ; ote Velocity    
  1938  .db 20 20 20 20 20 20 20 4E 6F 74 65 20 20 20 20 20  ;        Note     
  1948  .db 20 20 20 20 20 56 65 6C 6F 63 69 74 79 20 20 20  ;      Velocity   
  1958  .db 20 20 20 46 69 72 73 74 20 4E 6F 74 65 20 50 72  ;    First Note Pr
  1968  .db 65 73 73 75 72 65 20 20 20 20 20 20 20 20 20 4C  ; essure         L
  1978  .db 61 73 74 20 4E 6F 74 65 20 50 72 65 73 73 75 72  ; ast Note Pressur
  1988  .db 65 20 20 20 20 20 20 20 20 20 20 48 69 67 68 20  ; e          High 
  1998  .db 4E 6F 74 65 20 50 72 65 73 73 75 72 65 20 20 20  ; Note Pressure   
  19a8  .db 20 20 20 20 20 20 20 4C 6F 77 20 4E 6F 74 65 20  ;        Low Note 
  19b8  .db 50 72 65 73 73 75 72 65 20 20 20 20 20 20 20 20  ; Pressure        
  19c8  .db 20 20 20 4E 6F 74 65 20 20 20 20 20 20 20 20 20  ;    Note         
  19d8  .db 20 50 72 65 73 73 75 72 65 20 20 20 20 20 20 47  ;  Pressure      G
  19e8  .db 6C 6F 62 61 6C 20 50 72 65 73 73 75 72 65 20 20  ; lobal Pressure  
  19f8  .db 20 20 20 20 20 20 20 20 20 20 20 4C 61 73 74 20  ;            Last 
  1a08  .db 4E 6F 74 65 20 52 65 6C 65 61 73 65 20 20 20 20  ; Note Release    
  1a18  .db 20 20 20 20 20 20 20 4E 6F 74 65 20 20 20 20 20  ;        Note     
  1a28  .db 20 20 20 20 20 52 65 6C 65 61 73 65 20 20 20 20  ;      Release    
  1a38  .db 20 20 20 56 65 6C 6F 63 69 74 79 20 61 6E 64 20  ;    Velocity and 
  1a48  .db 52 65 6C 65 61 73 65 20 20 20 20 20 20 20 20 42  ; Release        B
  1a58  .db 72 65 61 74 68 20 43 6F 6E 74 72 6F 6C 6C 65 72  ; reath Controller
  1a68  .db 20 20 20 20 20 20 20 20 20 20 20 46 6F 6F 74 20  ;            Foot 
  1a78  .db 43 6F 6E 74 72 6F 6C 6C 65 72 20 20 20 20 20 20  ; Controller      
  1a88  .db 20 20 20 20 20 20 20 45 78 70 72 65 73 73 69 6F  ;        Expressio
  1a98  .db 6E 20 43 6F 6E 74 72 6F 6C 6C 65 72 20 20 20 20  ; n Controller    
  1aa8  .db 20 20 20 47 50 20 43 6F 6E 74 72 6F 6C 6C 65 72  ;    GP Controller
  1ab8  .db 20 23 20 31 20 20 20 20 20 20 20 20 20 20 20 47  ;  # 1           G
  1ac8  .db 50 20 43 6F 6E 74 72 6F 6C 6C 65 72 20 23 20 32  ; P Controller # 2
  1ad8  .db 20 20 20 20 20 20 20 20 20 20 20 47 50 20 43 6F  ;            GP Co
  1ae8  .db 6E 74 72 6F 6C 6C 65 72 20 23 20 33 20 20 20 20  ; ntroller # 3    
  1af8  .db 20 20 20 20 20 20 20 47 50 20 43 6F 6E 74 72 6F  ;        GP Contro
  1b08  .db 6C 6C 65 72 20 23 20 34 20 20 20 20 20 20 20 20  ; ller # 4        
  1b18  .db 20 20 20 47 50 20 43 6F 6E 74 72 6F 6C 6C 65 72  ;    GP Controller
  1b28  .db 20 23 20 35 20 20 20 20 20 20 20 20 20 20 20 47  ;  # 5           G
  1b38  .db 50 20 43 6F 6E 74 72 6F 6C 6C 65 72 20 23 20 36  ; P Controller # 6
  1b48  .db 20 20 20 20 20 20 20 20 20 20 20 47 50 20 43 6F  ;            GP Co
  1b58  .db 6E 74 72 6F 6C 6C 65 72 20 23 20 37 20 20 20 20  ; ntroller # 7    
  1b68  .db 20 20 20 20 20 20 20 47 50 20 43 6F 6E 74 72 6F  ;        GP Contro
  1b78  .db 6C 6C 65 72 20 23 20 38 20 20 20 20 20 20 20 20  ; ller # 8        
  1b88  .db 20 20 20 44 61 6D 70 65 72 20 50 65 64 61 6C 20  ;    Damper Pedal 
  1b98  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4E  ;                N
  1ba8  .db 6F 74 65 73 20 44 6F 77 6E 20 20 20 20 54 68 3D  ; otes Down    Th=
  1bb8  .db 20 20 20 20 20 20 20 20 20 20 20 4C 61 73 74 20  ;            Last 
  1bc8  .db 56 65 6C 6F 63 69 74 79 20 54 68 3D 20 20 20 20  ; Velocity Th=    
  1bd8  .db 20 20 20 20 20 20 20 47 6C 6F 62 61 6C 20 50 72  ;        Global Pr
  1be8  .db 65 73 73 2E 20 54 68 3D 20 20 20 20 20 20 20 20  ; ess. Th=        
  1bf8  .db 20 20 20 50 6F 72 74 61 6D 65 6E 74 6F 20 50 65  ;    Portamento Pe
  1c08  .db 64 61 6C 20 20 20 20 20 20 20 20 20 20 20 20 4D  ; dal            M
  1c18  .db 49 44 49 20 43 6C 6F 63 6B 20 46 72 65 71 75 65  ; IDI Clock Freque
  1c28  .db 6E 63 79 20 20 20 20 20 20 20 20 4D 49 44 49 20  ; ncy        MIDI 
  1c38  .db 43 6C 6F 63 6B 20 50 65 72 69 6F 64 20 20 20 20  ; Clock Period    
  1c48  .db 20 20 20 20 20 20 20 55 6E 64 65 66 69 6E 65 64  ;        Undefined
  1c58  .db 20 53 6D 61 6C 6C 3D 20 20 20 20 20 20 20 20 20  ;  Small=         
  1c68  .db 20 20 20 55 6E 64 65 66 69 6E 65 64 20 4C 61 72  ;    Undefined Lar
  1c78  .db 67 65 3D 20 20 20 20 20 20 20 20 20 20 20 20 53  ; ge=            S
  1c88  .db 6F 66 74 20 46 75 6E 63 74 69 6F 6E 20 31 20 20  ; oft Function 1  
  1c98  .db 20 20 20 20 20 20 20 20 20 20 20 53 6F 66 74 20  ;            Soft 
  1ca8  .db 46 75 6E 63 74 69 6F 6E 20 32 20 20 20 20 20 20  ; Function 2      
  1cb8  .db 20 20 20 20 20 20 20 53 6F 66 74 20 46 75 6E 63  ;        Soft Func
  1cc8  .db 74 69 6F 6E 20 33 20 20 20 20 20 20 20 20 20 20  ; tion 3          
  1cd8  .db 20 20 20 53 6F 66 74 20 46 75 6E 63 74 69 6F 6E  ;    Soft Function
  1ce8  .db 20 34 20 20 20 20 20 20 20 20 20 20 20 20 20 46  ;  4             F
  1cf8  .db 75 6E 63 74 69 6F 6E 20 47 65 6E 65 72 61 74 6F  ; unction Generato
  1d08  .db 72 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ; r               
  1d18  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d28  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d38  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d48  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d58  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d68  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d78  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d88  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1d98  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1da8  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1db8  .db 20 20 20                                         ;    

;; Record FFF1, 532 bytes
REC_FFF1_hdr:
  1dbb  FFF1021C0000.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
REC_FFF1:
  1dc3  50             ?? 50h    P                       
  1dc4  .db 61 74 63 68 20 69 73 20 64 69 73 61 62 6C 65 64  ; atch is disabled
  1dd4  .db 20 20 20 20 20 20 20 20 20 20 20 46 69 72 73 74  ;            First
  1de4  .db 20 6E 6F 74 65 20 20 20 20 20 20 20 20 20 20 20  ;  note           
  1df4  .db 20 20 20 20 20 20 20 4C 61 73 74 20 4E 6F 74 65  ;        Last Note
  1e04  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1e14  .db 20 20 20 4E 6F 74 65 20 20 20 20 20 20 20 20 20  ;    Note         
  1e24  .db 20 6F 6E 6C 79 20 20 20 20 20 20 20 20 20 20 4E  ;  only          N
  1e34  .db 6F 74 65 20 20 20 20 20 20 20 20 20 20 61 62 6F  ; ote          abo
  1e44  .db 76 65 20 20 20 20 20 20 20 20 20 4E 6F 74 65 20  ; ve         Note 
  1e54  .db 20 20 20 20 20 20 20 20 20 62 65 6C 6F 77 20 20  ;          below  
  1e64  .db 20 20 20 20 20 20 20 53 6F 66 74 20 46 75 6E 63  ;        Soft Func
  1e74  .db 74 69 6F 6E 20 31 20 20 20 20 20 20 20 20 20 20  ; tion 1          
  1e84  .db 20 20 20 53 6F 66 74 20 46 75 6E 63 74 69 6F 6E  ;    Soft Function
  1e94  .db 20 32 20 20 20 20 20 20 20 20 20 20 20 20 20 53  ;  2             S
  1ea4  .db 6F 66 74 20 46 75 6E 63 74 69 6F 6E 20 33 20 20  ; oft Function 3  
  1eb4  .db 20 20 20 20 20 20 20 20 20 20 20 53 6F 66 74 20  ;            Soft 
  1ec4  .db 46 75 6E 63 74 69 6F 6E 20 34 20 20 20 20 20 20  ; Function 4      
  1ed4  .db 20 20 20 20 20 20 20 46 75 6E 63 74 69 6F 6E 20  ;        Function 
  1ee4  .db 47 65 6E 2E 20 54 68 3D 20 58 58 58 58 20 20 58  ; Gen. Th= XXXX  X
  1ef4  .db 58 58 58 20 20 20 20 20 20 20 20 20 20 20 20 20  ; XXX             
  1f04  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1f14  .db 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20  ;                 
  1f24  .db 20 20 20 20 20 20 20 20 20 20 20 44 61 6D 70 65  ;            Dampe
  1f34  .db 72 20 50 65 64 61 6C 20 20 20 20 20 20 20 20 20  ; r Pedal         
  1f44  .db 20 20 20 20 20 20 20 50 6F 72 74 61 6D 65 6E 74  ;        Portament
  1f54  .db 6F 20 50 65 64 61 6C 20 20 20 20 20 20 20 20 20  ; o Pedal         
  1f64  .db 20 20 20 4E 6F 74 65 73 20 44 6F 77 6E 20 20 20  ;    Notes Down   
  1f74  .db 20 54 68 3D 20 20 20 20 20 20 20 20 20 20 20 4C  ;  Th=           L
  1f84  .db 61 73 74 20 56 65 6C 6F 63 69 74 79 20 54 68 3D  ; ast Velocity Th=
  1f94  .db 20 20 20 20 20 20 20 20 20 20 20 47 6C 6F 62 61  ;            Globa
  1fa4  .db 6C 20 50 72 65 73 73 2E 20 54 68 3D 20 20 20 20  ; l Press. Th=    
  1fb4  .db 20 20 20 20 20 20 20 55 6E 64 65 66 69 6E 65 64  ;        Undefined
  1fc4  .db 20 53 6D 61 6C 6C 3D 20 20 20 20 20 20 20 20 20  ;  Small=         
  1fd4  .db 20 20 20                                         ;    

;; End of record chain
END_OF_CHAIN_hdr:
  1fd7  FFFF0008FA00.. RomRecordHeader                    ; module id (hi) / sub id (lo); AA55 bank header, FFFF end
  1fdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  1fef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  1fff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  200f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  201f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  202f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  203f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  204f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  205f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  206f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  207f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  208f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  209f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  20af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  20bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  20cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  20df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  20ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  20ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  210f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  211f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  212f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  213f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  214f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  215f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  216f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  217f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  218f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  219f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  21af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  21bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  21cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  21df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  21ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  21ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  220f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  221f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  222f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  223f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  224f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  225f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  226f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  227f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  228f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  229f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  22ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  230f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  231f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  232f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  233f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  234f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  235f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  236f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  237f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  238f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  239f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  23ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  240f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  241f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  242f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  243f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  244f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  245f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  246f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  247f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  248f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  249f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  24ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  250f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  251f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  252f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  253f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  254f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  255f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  256f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  257f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  258f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  259f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  25ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  260f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  261f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  262f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  263f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  264f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  265f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  266f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  267f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  268f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  269f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  26ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  270f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  271f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  272f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  273f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  274f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  275f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  276f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  277f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  278f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  279f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  27ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  280f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  281f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  282f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  283f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  284f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  285f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  286f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  287f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  288f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  289f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  28ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  290f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  291f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  292f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  293f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  294f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  295f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  296f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  297f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  298f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  299f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  29ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2a9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2aaf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2abf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2acf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2adf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2aef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2aff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2b9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2baf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bcf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2bff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2c9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2caf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ccf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2cff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2d9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2daf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dcf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ddf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2def  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2dff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2e9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2eaf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ebf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2ecf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2edf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2eef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2eff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2f9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2faf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fcf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  2fff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  300f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  301f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  302f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  303f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  304f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  305f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  306f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  307f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  308f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  309f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  30ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  310f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  311f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  312f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  313f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  314f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  315f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  316f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  317f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  318f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  319f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  31ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  320f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  321f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  322f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  323f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  324f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  325f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  326f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  327f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  328f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  329f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  32ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  330f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  331f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  332f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  333f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  334f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  335f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  336f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  337f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  338f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  339f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  33ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  340f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  341f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  342f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  343f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  344f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  345f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  346f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  347f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  348f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  349f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  34ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  350f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  351f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  352f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  353f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  354f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  355f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  356f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  357f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  358f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  359f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  35ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  360f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  361f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  362f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  363f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  364f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  365f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  366f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  367f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  368f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  369f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  36ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  370f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  371f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  372f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  373f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  374f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  375f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  376f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  377f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  378f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  379f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  37ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  380f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  381f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  382f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  383f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  384f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  385f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  386f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  387f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  388f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  389f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  38ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  390f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  391f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  392f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  393f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  394f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  395f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  396f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  397f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  398f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  399f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39af  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39bf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39cf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39df  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39ef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  39ff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3a9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aaf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3abf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3acf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3adf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3aff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3b9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3baf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bcf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3bff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3c9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3caf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ccf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3cff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3d9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3daf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dcf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ddf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3def  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3dff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3e9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eaf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ebf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3ecf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3edf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3eff  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f0f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f1f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f2f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f3f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f4f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f5f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f6f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f7f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f8f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3f9f  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3faf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fbf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fcf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fdf  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fef  .db FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ; ................
  3fff  .db FF                                               ; .
