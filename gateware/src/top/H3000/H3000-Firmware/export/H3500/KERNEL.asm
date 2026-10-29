; H3500  block KERNEL  8400-ffff
; Kernel ROM D:/midi/Firmware/H3000/modules/h3500


; ---- function Reset
Reset:
API_FD82:
  8400  1A50           ORCC #0x50                        
  8402  8600           LDA #0x0                          
  8404  B780A7         STA 0x80a7                        
  8407  7F8052         CLR 0x8052                        
  840a  C600           LDB #0x0                          
  840c  F780A1         STB 0x80a1                        
  840f  8E6000         LDX #0x6000                       
  8412  108E1FFF       LDY #0x1fff                       
LAB_8416:
  8416  6F80           CLR ,X+                           
  8418  313F           LEAY -0x1,Y                       
  841a  26FA           BNE 0x8416                        
  841c  10CE6500       LDS #0x6500                       
  8420  CE6570         LDU #0x6570                       
  8423  865A           LDA #0x5a                         
  8425  B76000         STA 0x6000                        
  8428  B16000         CMPA 0x6000                       
  842b  10264502       LBNE 0xc931                       
  842f  171623         LBSR 0x9a55                       
  8432  CC1000         LDD #0x1000                       
  8435  174229         LBSR 0xc661                       
  8438  8E6600         LDX #0x6600                       
  843b  86B7           LDA #0xb7                         
  843d  A780           STA ,X+                           
  843f  CC8055         LDD #0x8055                       
  8442  ED81           STD ,X++                          
  8444  863B           LDA #0x3b                         
  8446  A780           STA ,X+                           
  8448  B76700         STA 0x6700                        
  844b  B76780         STA 0x6780                        
  844e  B767C0         STA 0x67c0                        
  8451  173E35         LBSR 0xc289                        ; inline[API_FD18]: [$600F]=$FFE8 [$6011]=$FFE8 [$6013]=$FFE8 [$6015]=$FFE8 [$6006]=$FFE8 [$6004]=$FFE8 [$6002]=$FFE8 [$608B]=$FFE8 [$60F2]=$85E3 [$608D]=$FFE8
  8454  600F           addr 600f                         
  8456  FFE8           dw FFE8h                          
  8458  6011           addr 6011                         
  845a  FFE8           dw FFE8h                          
  845c  6013           addr 6013                         
  845e  FFE8           dw FFE8h                          
  8460  6015           addr 6015                         
  8462  FFE8           dw FFE8h                          
  8464  6006           addr 6006                         
  8466  FFE8           dw FFE8h                          
  8468  6004           addr 6004                         
  846a  FFE8           dw FFE8h                          
  846c  6002           addr 6002                         
  846e  FFE8           dw FFE8h                          
  8470  608B           addr 608b                         
  8472  FFE8           dw FFE8h                          
  8474  60F2           addr 60f2                         
  8476  85E3           dw 85E3h                          
  8478  608D           addr 608d                         
  847a  FFE8           dw FFE8h                          
  847c  FFFF           dw FFFFh                          
LAB_847e:
  847e  C605           LDB #0x5                          
  8480  F7613C         STB 0x613c                        
  8483  C6FF           LDB #0xff                         
  8485  F76019         STB 0x6019                        
  8488  174267         LBSR 0xc6f2                       
  848b  17201B         LBSR 0xa4a9                       
  848e  170C1A         LBSR 0x90ab                       
  8491  173621         LBSR 0xbab5                       
  8494  1712CB         LBSR 0x9762                       
  8497  17134A         LBSR 0x97e4                        ; inline[API_FC38]: "{1}* THE H3500 DYNAMIC ULTRA-HARMONIZER *"
  849a  012A20544845.. char[40] 01h,"* THE H3500 DYNAMIC ULTRA-HARMONIZER *"
LAB_84c2:
  84c2  170FA5         LBSR 0x946a                       
  84c5  171596         LBSR 0x9a5e                       
  84c8  8E0283         LDX #0x283                        
  84cb  172237         LBSR 0xa705                       
  84ce  17155A         LBSR 0x9a2b                       
  84d1  17119E         LBSR 0x9672                       
  84d4  1746C5         LBSR 0xcb9c                       
  84d7  177719         LBSR 0xfbf3                       
  84da  17746B         LBSR 0xf948                       
  84dd  17688B         LBSR 0xed6b                       
  84e0  108E6151       LDY #0x6151                       
  84e4  CCF803         LDD #0xf803                       
  84e7  170552         LBSR 0x8a3c                       
  84ea  1722FD         LBSR 0xa7ea                       
  84ed  174B9B         LBSR 0xd08b                       
  84f0  C6FF           LDB #0xff                         
  84f2  108E0280       LDY #0x280                        
  84f6  172243         LBSR 0xa73c                       
  84f9  C6FF           LDB #0xff                         
  84fb  108E0281       LDY #0x281                        
  84ff  17223A         LBSR 0xa73c                       
  8502  C675           LDB #0x75                         
  8504  F761DC         STB 0x61dc                        
  8507  C61F           LDB #0x1f                         
  8509  F761DD         STB 0x61dd                        
  850c  C611           LDB #0x11                         
  850e  F761DE         STB 0x61de                        
  8511  170C0F         LBSR 0x9123                       
  8514  2603           BNE 0x8519                        
  8516  174423         LBSR 0xc93c                       
LAB_8519:
  8519  170A4E         LBSR 0x8f6a                       
  851c  C115           CMPB #0x15                        
  851e  2709           BEQ 0x8529                        
  8520  C106           CMPB #0x6                         
  8522  260B           BNE 0x852f                        
  8524  174440         LBSR 0xc967                       
  8527  2006           BRA 0x852f                        
LAB_8529:
  8529  174212         LBSR 0xc73e                       
  852c  16002C         LBRA 0x855b                       
LAB_852f:
  852f  174421         LBSR 0xc953                       
  8532  2707           BEQ 0x853b                        
  8534  1712AD         LBSR 0x97e4                        ; inline[API_FC38]: "{1}NV"
  8537  014E5600       char[4] 01h,"NV"                  
LAB_853b:
  853b  1CAF           ANDCC #0xaf                       
  853d  174413         LBSR 0xc953                       
  8540  1743D8         LBSR 0xc91b                       
  8543  17070A         LBSR 0x8c50                       
  8546  172AC4         LBSR 0xb00d                       
  8549  171CBA         LBSR 0xa206                       
  854c  CC0FA0         LDD #0xfa0                        
  854f  173DEC         LBSR 0xc33e                       
  8552  171568         LBSR 0x9abd                       
  8555  171820         LBSR 0x9d78                       
  8558  7F6019         CLR 0x6019                        
LAB_855b:
  855b  F66102         LDB 0x6102                        
  855e  F7600B         STB 0x600b                        
  8561  F78052         STB 0x8052                        
  8564  173695         LBSR 0xbbfc                       
  8567  260C           BNE 0x8575                        
  8569  CC001E         LDD #0x1e                         
  856c  173683         LBSR 0xbbf2                       
  856f  BD8FDB         JSR 0x8fdb                        
  8572  BD9515         JSR 0x9515                        
LAB_8575:
  8575  8D02           BSR 0x8579                        
  8577  20E2           BRA 0x855b                        

; ---- function API_FE2A
API_FE2A:
  8579  3416           PSHS  X B A                       
  857b  F66102         LDB 0x6102                        
  857e  17749F         LBSR 0xfa20                       
  8581  173569         LBSR 0xbaed                       
  8584  7D60F1         TST 0x60f1                        
  8587  2613           BNE 0x859c                        
  8589  17455A         LBSR 0xcae6                       
  858c  AD9F600F       JSR [0x600f]                      
  8590  AD9F6011       JSR [0x6011]                      
  8594  AD9F6013       JSR [0x6013]                      
  8598  AD9F6015       JSR [0x6015]                      
LAB_859c:
  859c  1739BA         LBSR 0xbf59                       
  859f  177498         LBSR 0xfa3a                       
  85a2  3596           PULS  A B X PC                    

; ---- function IRQ_Handler
IRQ_Handler:
  85a4  1A40           ORCC #0x40                        
  85a6  CE6580         LDU #0x6580                       
  85a9  8680           LDA #0x80                         
  85ab  B48053         ANDA 0x8053                       
  85ae  2707           BEQ 0x85b7                        
  85b0  AD9F6006       JSR [0x6006]                      
  85b4  174130         LBSR 0xc6e7                       
LAB_85b7:
  85b7  F68300         LDB 0x8300                        
  85ba  C501           BITB #0x1                         
  85bc  1027015E       LBEQ 0x871e                       
  85c0  C520           BITB #0x20                        
  85c2  2611           BNE 0x85d5                        
LAB_85c4:
  85c4  F68301         LDB 0x8301                        
  85c7  7D6116         TST 0x6116                        
  85ca  27EB           BEQ 0x85b7                        
  85cc  5D             TSTB                              
  85cd  2B0E           BMI 0x85dd                        
  85cf  AD9F608B       JSR [0x608b]                      
  85d3  20E2           BRA 0x85b7                        
LAB_85d5:
  85d5  F68301         LDB 0x8301                        
  85d8  170041         LBSR 0x861c                       
  85db  20DA           BRA 0x85b7                        
LAB_85dd:
  85dd  AD9F60F2       JSR [0x60f2]                      
  85e1  20D4           BRA 0x85b7                        

; ---- function FUN_85e3
FUN_85e3:
  85e3  1F98           TFR B,A                           
  85e5  84F0           ANDA #0xf0                        
  85e7  81F0           CMPA #0xf0                        
  85e9  2737           BEQ 0x8622                        
  85eb  8E85F4         LDX #0x85f4                       
  85ee  BF608B         STX 0x608b                        
  85f1  8D01           BSR 0x85f4                        
  85f3  39             RTS                               

; ---- function FUN_85f4
FUN_85f4:
  85f4  F76139         STB 0x6139                        
  85f7  7D6081         TST 0x6081                        
  85fa  2620           BNE 0x861c                        
  85fc  BE6083         LDX 0x6083                        
  85ff  E7897800       STB 0x7800,X                      
  8603  1F10           TFR X,D                           
  8605  C30001         ADDD #0x1                         
  8608  8403           ANDA #0x3                         
  860a  FD6083         STD 0x6083                        
  860d  10B36085       CMPD 0x6085                       
  8611  2605           BNE 0x8618                        
  8613  C6FF           LDB #0xff                         
  8615  F76081         STB 0x6081                        
LAB_8618:
  8618  7F6082         CLR 0x6082                        
  861b  39             RTS                               

; ---- function FUN_861c
FUN_861c:
  861c  86FF           LDA #0xff                         
  861e  B76087         STA 0x6087                        
  8621  39             RTS                               

; ---- function FUN_8622
FUN_8622:
  8622  3406           PSHS  B A                         
  8624  C1F0           CMPB #0xf0                        
  8626  2716           BEQ 0x863e                        
  8628  1F98           TFR B,A                           
  862a  84F8           ANDA #0xf8                        
  862c  81F8           CMPA #0xf8                        
  862e  2609           BNE 0x8639                        
  8630  1700F0         LBSR 0x8723                       
LAB_8633:
  8633  AD9F608D       JSR [0x608d]                      
  8637  3586           PULS  A B PC                      
LAB_8639:
  8639  170054         LBSR 0x8690                       
  863c  20F5           BRA 0x8633                        
LAB_863e:
  863e  CC8646         LDD #0x8646                       
  8641  FD608B         STD 0x608b                        
  8644  20ED           BRA 0x8633                        

; ---- function FUN_8646
FUN_8646:
  8646  3406           PSHS  B A                         
  8648  C17F           CMPB #0x7f                        
  864a  102700BE       LBEQ 0x870c                       
  864e  C11C           CMPB #0x1c                        
  8650  2640           BNE 0x8692                        
  8652  CC8657         LDD #0x8657                       
  8655  203E           BRA 0x8695                        

; ---- function FUN_8657
FUN_8657:
  8657  3406           PSHS  B A                         
  8659  C160           CMPB #0x60                        
  865b  2635           BNE 0x8692                        
  865d  CC8662         LDD #0x8662                       
  8660  2033           BRA 0x8695                        

; ---- function FUN_8662
FUN_8662:
  8662  3406           PSHS  B A                         
  8664  3404           PSHS  B                           
  8666  3410           PSHS  X                           
  8668  8E0290         LDX #0x290                        
  866b  172097         LBSR 0xa705                       
  866e  3510           PULS  X                           
  8670  E1E0           CMPB ,S+                          
  8672  261E           BNE 0x8692                        
  8674  CC867C         LDD #0x867c                       
  8677  FD608B         STD 0x608b                        
  867a  2019           BRA 0x8695                        
  867c  .db 5D 26 1B CC 85 F4 FD 60 8B C6 F0 17 FF 6A C6 1C  ; ]&.....`.....j..
  868c  .db 17 FF 65 39                                      ; ..e9

; ---- function FUN_8690
FUN_8690:
  8690  3406           PSHS  B A                         
LAB_8692:
  8692  CCFFE8         LDD #0xffe8                       
LAB_8695:
  8695  FD608B         STD 0x608b                        
  8698  3586           PULS  A B PC                      

; ---- function FUN_869a
FUN_869a:
  869a  3432           PSHS  Y X A                       
  869c  108E68C0       LDY #0x68c0                       
  86a0  1713B2         LBSR 0x9a55                       
  86a3  1A40           ORCC #0x40                        
  86a5  E6A9000B       LDB 0xb,Y                         
  86a9  177374         LBSR 0xfa20                       
  86ac  CCF472         LDD #0xf472                       
  86af  EDA90002       STD 0x2,Y                         
  86b3  8E7D00         LDX #0x7d00                       
  86b6  200E           BRA 0x86c6                        
LAB_86b8:
  86b8  ADB90002       JSR [0x2,Y]                       
  86bc  A6A9000B       LDA 0xb,Y                         
  86c0  B7600B         STA 0x600b                        
  86c3  B78052         STA 0x8052                        
LAB_86c6:
  86c6  F68300         LDB 0x8300                        
  86c9  C501           BITB #0x1                         
  86cb  271A           BEQ 0x86e7                        
  86cd  C520           BITB #0x20                        
  86cf  261A           BNE 0x86eb                        
  86d1  F68301         LDB 0x8301                        
  86d4  8E7D00         LDX #0x7d00                       
  86d7  5D             TSTB                              
  86d8  2CDE           BGE 0x86b8                        
  86da  1F98           TFR B,A                           
  86dc  84F8           ANDA #0xf8                        
  86de  81F8           CMPA #0xf8                        
  86e0  260E           BNE 0x86f0                        
  86e2  17003E         LBSR 0x8723                       
  86e5  20DF           BRA 0x86c6                        
LAB_86e7:
  86e7  301F           LEAX -0x1,X                       
  86e9  26DB           BNE 0x86c6                        
LAB_86eb:
  86eb  F68301         LDB 0x8301                        
  86ee  20D6           BRA 0x86c6                        
LAB_86f0:
  86f0  3406           PSHS  B A                         
  86f2  CCF472         LDD #0xf472                       
  86f5  EDA90002       STD 0x2,Y                         
  86f9  171362         LBSR 0x9a5e                       
  86fc  3506           PULS  A B                         
  86fe  177339         LBSR 0xfa3a                       
  8701  3532           PULS  A X Y                       
  8703  3262           LEAS 0x2,S                        
  8705  16FEBC         LBRA 0x85c4                       

; ---- function FUN_8708
FUN_8708:
  8708  171353         LBSR 0x9a5e                       
  870b  39             RTS                               
LAB_870c:
  870c  3404           PSHS  B                           
  870e  C6F0           LDB #0xf0                         
  8710  17FEE1         LBSR 0x85f4                       
  8713  3504           PULS  B                           
  8715  17FEDC         LBSR 0x85f4                       
  8718  CC85F4         LDD #0x85f4                       
  871b  16FF77         LBRA 0x8695                       
LAB_871e:
  871e  AD9F6004       JSR [0x6004]                      
  8722  3B             RTI                               

; ---- function FUN_8723
FUN_8723:
  8723  3406           PSHS  B A                         
  8725  C1F8           CMPB #0xf8                        
  8727  1026000A       LBNE 0x8735                       
  872b  7C613C         INC 0x613c                        
  872e  2605           BNE 0x8735                        
  8730  86FF           LDA #0xff                         
  8732  B7613C         STA 0x613c                        
LAB_8735:
  8735  3586           PULS  A B PC                      

; ---- function FUN_8737
FUN_8737:
  8737  3436           PSHS  Y X B A                     
  8739  327C           LEAS -0x4,S                       
  873b  F6613D         LDB 0x613d                        
  873e  F1614E         CMPB 0x614e                       
  8741  102700AD       LBEQ 0x87f2                       
  8745  F7614E         STB 0x614e                        
  8748  108E613E       LDY #0x613e                       
  874c  A6A5           LDA B,Y                           
  874e  A762           STA 0x2,S                         
  8750  5A             DECB                              
  8751  C40F           ANDB #0xf                         
  8753  A0A5           SUBA B,Y                          
  8755  8101           CMPA #0x1                         
  8757  2E71           BGT 0x87ca                        
  8759  81FF           CMPA #0xff                        
  875b  2D6D           BLT 0x87ca                        
LAB_875d:
  875d  108E613E       LDY #0x613e                       
  8761  8E0000         LDX #0x0                          
  8764  E6A0           LDB ,Y+                           
  8766  3A             ABX                               
  8767  E6A0           LDB ,Y+                           
  8769  3A             ABX                               
  876a  E6A0           LDB ,Y+                           
  876c  3A             ABX                               
  876d  E6A0           LDB ,Y+                           
  876f  3A             ABX                               
  8770  E6A0           LDB ,Y+                           
  8772  3A             ABX                               
  8773  E6A0           LDB ,Y+                           
  8775  3A             ABX                               
  8776  E6A0           LDB ,Y+                           
  8778  3A             ABX                               
  8779  E6A0           LDB ,Y+                           
  877b  3A             ABX                               
  877c  E6A0           LDB ,Y+                           
  877e  3A             ABX                               
  877f  E6A0           LDB ,Y+                           
  8781  3A             ABX                               
  8782  E6A0           LDB ,Y+                           
  8784  3A             ABX                               
  8785  E6A0           LDB ,Y+                           
  8787  3A             ABX                               
  8788  E6A0           LDB ,Y+                           
  878a  3A             ABX                               
  878b  E6A0           LDB ,Y+                           
  878d  3A             ABX                               
  878e  E6A0           LDB ,Y+                           
  8790  3A             ABX                               
  8791  E6A0           LDB ,Y+                           
  8793  3A             ABX                               
  8794  6D62           TST 0x2,S                         
  8796  275A           BEQ 0x87f2                        
  8798  1F10           TFR X,D                           
  879a  EDE4           STD ,S                            
  879c  B360EB         SUBD 0x60eb                       
  879f  10830001       CMPD #0x1                         
  87a3  234D           BLS 0x87f2                        
  87a5  1083FFFF       CMPD #0xffff                      
  87a9  2747           BEQ 0x87f2                        
  87ab  10830002       CMPD #0x2                         
  87af  230A           BLS 0x87bb                        
  87b1  1083FFFE       CMPD #0xfffe                      
  87b5  2C09           BGE 0x87c0                        
  87b7  ECE4           LDD ,S                            
  87b9  200A           BRA 0x87c5                        
LAB_87bb:
  87bb  CCFFFF         LDD #0xffff                       
  87be  2003           BRA 0x87c3                        
LAB_87c0:
  87c0  CC0001         LDD #0x1                          
LAB_87c3:
  87c3  E3E4           ADDD ,S                           
LAB_87c5:
  87c5  FD60EB         STD 0x60eb                        
  87c8  2028           BRA 0x87f2                        
LAB_87ca:
  87ca  E662           LDB 0x2,S                         
  87cc  E7A0           STB ,Y+                           
  87ce  E7A0           STB ,Y+                           
  87d0  E7A0           STB ,Y+                           
  87d2  E7A0           STB ,Y+                           
  87d4  E7A0           STB ,Y+                           
  87d6  E7A0           STB ,Y+                           
  87d8  E7A0           STB ,Y+                           
  87da  E7A0           STB ,Y+                           
  87dc  E7A0           STB ,Y+                           
  87de  E7A0           STB ,Y+                           
  87e0  E7A0           STB ,Y+                           
  87e2  E7A0           STB ,Y+                           
  87e4  E7A0           STB ,Y+                           
  87e6  E7A0           STB ,Y+                           
  87e8  E7A0           STB ,Y+                           
  87ea  E7A0           STB ,Y+                           
  87ec  16FF6E         LBRA 0x875d                       
  87ef  .db BF 60 EB                                         ; .`.
LAB_87f2:
  87f2  3264           LEAS 0x4,S                        
  87f4  35B6           PULS  A B X Y PC                  

; ---- function NMI_Handler
NMI_Handler:
  87f6  1F40           TFR S,D                           
  87f8  8164           CMPA #0x64                        
  87fa  1026FC02       LBNE 0x8400                       
  87fe  AD9F6002       JSR [0x6002]                      
  8802  170C6E         LBSR 0x9473                       
  8805  7C61B8         INC 0x61b8                        
  8808  7C613A         INC 0x613a                        
  880b  2631           BNE 0x883e                        
  880d  B6613C         LDA 0x613c                        
  8810  4D             TSTA                              
  8811  271B           BEQ 0x882e                        
  8813  7D6150         TST 0x6150                        
  8816  261D           BNE 0x8835                        
  8818  F6614F         LDB 0x614f                        
  881b  B7614F         STA 0x614f                        
  881e  B6613D         LDA 0x613d                        
  8821  8E613E         LDX #0x613e                       
  8824  4C             INCA                              
  8825  840F           ANDA #0xf                         
  8827  E786           STB A,X                           
  8829  B7613D         STA 0x613d                        
  882c  200D           BRA 0x883b                        
LAB_882e:
  882e  C602           LDB #0x2                          
  8830  F76150         STB 0x6150                        
  8833  2006           BRA 0x883b                        
LAB_8835:
  8835  B7614F         STA 0x614f                        
  8838  7A6150         DEC 0x6150                        
LAB_883b:
  883b  7F613C         CLR 0x613c                        
LAB_883e:
  883e  8600           LDA #0x0                          
  8840  B780A7         STA 0x80a7                        
  8843  4C             INCA                              
  8844  B780A7         STA 0x80a7                        
  8847  3B             RTI                               

; ---- function FIRQ_Handler
FIRQ_Handler:
  8848  1CEF           ANDCC #0xef                       
  884a  16DDB3         LBRA 0x6600                       
  884d  .db AA 55 00 08 F9 00 00 00 FF FF                    ; .U........
DAT_8857:
  8857  0008           undefined2 0008h                  
  8859  .db FA 00 00 00                                      ; ....

;; Kernel API slot $FC02: D = record key; scans the bank chains, leaves bank/ptr/len in $6079/$607A/$607D

; ---- function RomFindRecord
RomFindRecord:
  885d  3406           PSHS  B A                         
  885f  170074         LBSR 0x88d6                       
LAB_8862:
  8862  260A           BNE 0x886e                        
  8864  10A3E4         CMPD ,S                           
  8867  2705           BEQ 0x886e                        
  8869  1700CE         LBSR 0x893a                       
  886c  20F4           BRA 0x8862                        
LAB_886e:
  886e  3586           PULS  A B PC                      

;; Kernel API slot $FC04: next byte of the current record (crosses bank boundaries)

; ---- function RomStreamReadByte
RomStreamReadByte:
  8870  3433           PSHS  Y X A CC                    
  8872  7D607C         TST 0x607c                        
  8875  2643           BNE 0x88ba                        
  8877  F66079         LDB 0x6079                        
  887a  1771A3         LBSR 0xfa20                       
  887d  10BE607A       LDY 0x607a                        
  8881  E6A0           LDB ,Y+                           
  8883  3404           PSHS  B                           
  8885  10BF607A       STY 0x607a                        
  8889  BE607D         LDX 0x607d                        
  888c  301F           LEAX -0x1,X                       
  888e  2723           BEQ 0x88b3                        
  8890  BF607D         STX 0x607d                        
  8893  1F20           TFR Y,D                           
  8895  5D             TSTB                              
  8896  260C           BNE 0x88a4                        
  8898  843F           ANDA #0x3f                        
  889a  2608           BNE 0x88a4                        
  889c  1700F7         LBSR 0x8996                       
  889f  260D           BNE 0x88ae                        
  88a1  FD607A         STD 0x607a                        
LAB_88a4:
  88a4  3504           PULS  B                           
  88a6  177191         LBSR 0xfa3a                       
  88a9  3533           PULS CC A X Y                     
  88ab  1A04           ORCC #0x4                         
  88ad  39             RTS                               
LAB_88ae:
  88ae  86FF           LDA #0xff                         
  88b0  B76076         STA 0x6076                        
LAB_88b3:
  88b3  86FF           LDA #0xff                         
  88b5  B7607C         STA 0x607c                        
  88b8  20EA           BRA 0x88a4                        
LAB_88ba:
  88ba  3533           PULS CC A X Y                     
  88bc  1CFB           ANDCC #0xfb                       
  88be  39             RTS                               

; ---- function API_FD9E
API_FD9E:
  88bf  3432           PSHS  Y X A                       
  88c1  F66079         LDB 0x6079                        
  88c4  177159         LBSR 0xfa20                       
  88c7  10BE607A       LDY 0x607a                        
  88cb  1F10           TFR X,D                           
  88cd  31AB           LEAY D,Y                          
  88cf  E6A4           LDB ,Y                            
  88d1  177166         LBSR 0xfa3a                       
  88d4  35B2           PULS  A X Y PC                    

;; Kernel API slot $FDA0

; ---- function RomFirstRecord
RomFirstRecord:
  88d6  3431           PSHS  Y X CC                      
  88d8  F6600B         LDB 0x600b                        
  88db  177142         LBSR 0xfa20                       
  88de  8EFF52         LDX #0xff52                       
  88e1  BF607F         STX 0x607f                        
LAB_88e4:
  88e4  1700AF         LBSR 0x8996                       
  88e7  2616           BNE 0x88ff                        
  88e9  1F02           TFR D,Y                           
  88eb  ECA4           LDD ,Y                            
  88ed  1083AA55       CMPD #0xaa55                      
  88f1  2727           BEQ 0x891a                        
  88f3  20EF           BRA 0x88e4                        

; ---- function FUN_88f5
FUN_88f5:
  88f5  3431           PSHS  Y X CC                      
  88f7  F6600B         LDB 0x600b                        
  88fa  177123         LBSR 0xfa20                       
  88fd  20E5           BRA 0x88e4                        
LAB_88ff:
  88ff  108E0000       LDY #0x0                          
  8903  10BF607A       STY 0x607a                        
  8907  10BF6077       STY 0x6077                        
  890b  10BF607D       STY 0x607d                        
  890f  B76076         STA 0x6076                        
  8912  177125         LBSR 0xfa3a                       
  8915  3531           PULS CC X Y                       

; ---- function FUN_8917
FUN_8917:
  8917  1CFB           ANDCC #0xfb                       
  8919  39             RTS                               

; ---- function FUN_891a
FUN_891a:
  891a  10BF607A       STY 0x607a                        
  891e  FD6077         STD 0x6077                        
  8921  CC0000         LDD #0x0                          
  8924  B7607C         STA 0x607c                        
  8927  B76076         STA 0x6076                        
  892a  EC22           LDD 0x2,Y                         
  892c  FD607D         STD 0x607d                        
  892f  177108         LBSR 0xfa3a                       
  8932  FC6077         LDD 0x6077                        
  8935  3531           PULS CC X Y                       
  8937  1A04           ORCC #0x4                         
  8939  39             RTS                               

;; Kernel API slot $FDA2

; ---- function RomNextRecord
RomNextRecord:
  893a  3431           PSHS  Y X CC                      
  893c  F66079         LDB 0x6079                        
  893f  1770DE         LBSR 0xfa20                       
  8942  7D6076         TST 0x6076                        
  8945  26B8           BNE 0x88ff                        
  8947  FC6077         LDD 0x6077                        
  894a  1083FFFF       CMPD #0xffff                      
  894e  2794           BEQ 0x88e4                        
LAB_8950:
  8950  10BE607A       LDY 0x607a                        
  8954  CC0008         LDD #0x8                          
  8957  10B3607D       CMPD 0x607d                       
  895b  2287           BHI 0x88e4                        
  895d  1F20           TFR Y,D                           
  895f  843F           ANDA #0x3f                        
  8961  F3607D         ADDD 0x607d                       
  8964  84C0           ANDA #0xc0                        
  8966  2720           BEQ 0x8988                        
  8968  1F20           TFR Y,D                           
  896a  843F           ANDA #0x3f                        
  896c  3406           PSHS  B A                         
  896e  CC4000         LDD #0x4000                       
  8971  A3E1           SUBD ,S++                         
  8973  3406           PSHS  B A                         
  8975  FC607D         LDD 0x607d                        
  8978  A3E1           SUBD ,S++                         
  897a  FD607D         STD 0x607d                        
  897d  8D17           BSR 0x8996                        
  897f  1026FF7C       LBNE 0x88ff                       
  8983  FD607A         STD 0x607a                        
  8986  20C8           BRA 0x8950                        
LAB_8988:
  8988  1F20           TFR Y,D                           
  898a  F3607D         ADDD 0x607d                       
  898d  FD607A         STD 0x607a                        
  8990  1F02           TFR D,Y                           
  8992  ECA4           LDD ,Y                            
  8994  2084           BRA 0x891a                        

; ---- function FUN_8996
FUN_8996:
  8996  BE607F         LDX 0x607f                        
  8999  EC81           LDD ,X++                          
  899b  BF607F         STX 0x607f                        
  899e  1083FFFF       CMPD #0xffff                      
  89a2  270D           BEQ 0x89b1                        
  89a4  B76079         STA 0x6079                        
  89a7  B7600B         STA 0x600b                        
  89aa  B78052         STA 0x8052                        
  89ad  1F98           TFR B,A                           
  89af  5F             CLRB                              
  89b0  39             RTS                               
LAB_89b1:
  89b1  1CFB           ANDCC #0xfb                       
  89b3  39             RTS                               

; ---- function API_FDA4
API_FDA4:
  89b4  3410           PSHS  X                           
  89b6  3406           PSHS  B A                         
  89b8  FC607D         LDD 0x607d                        
  89bb  A3E4           SUBD ,S                           
  89bd  FD607D         STD 0x607d                        
  89c0  FC607A         LDD 0x607a                        
  89c3  843F           ANDA #0x3f                        
  89c5  E3E4           ADDD ,S                           
  89c7  84C0           ANDA #0xc0                        
  89c9  2714           BEQ 0x89df                        
  89cb  FD607A         STD 0x607a                        
  89ce  8DC6           BSR 0x8996                        
  89d0  2614           BNE 0x89e6                        
  89d2  F3607A         ADDD 0x607a                       
LAB_89d5:
  89d5  FD607A         STD 0x607a                        
  89d8  3506           PULS  A B                         
  89da  3510           PULS  X                           
  89dc  1A04           ORCC #0x4                         
  89de  39             RTS                               
LAB_89df:
  89df  FC607A         LDD 0x607a                        
  89e2  E3E4           ADDD ,S                           
  89e4  20EF           BRA 0x89d5                        
LAB_89e6:
  89e6  3506           PULS  A B                         
  89e8  3510           PULS  X                           
  89ea  1A04           ORCC #0x4                         
  89ec  39             RTS                               

; ---- function FUN_89ed
FUN_89ed:
  89ed  3436           PSHS  Y X B A                     
  89ef  8E6076         LDX #0x6076                       
  89f2  CC000B         LDD #0xb                          
  89f5  173790         LBSR 0xc188                       
  89f8  35B6           PULS  A B X Y PC                  

; ---- function API_FE1E
API_FE1E:
  89fa  3436           PSHS  Y X B A                     
  89fc  108E6076       LDY #0x6076                       
  8a00  CC000B         LDD #0xb                          
  8a03  173782         LBSR 0xc188                       
  8a06  35B6           PULS  A B X Y PC                  

; ---- function API_FC06
API_FC06:
  8a08  17FE52         LBSR 0x885d                       
  8a0b  2608           BNE 0x8a15                        
  8a0d  10BE607A       LDY 0x607a                        
  8a11  F66079         LDB 0x6079                        
  8a14  4F             CLRA                              
LAB_8a15:
  8a15  39             RTS                               

; ---- function API_FC08
API_FC08:
  8a16  1083FFFF       CMPD #0xffff                      
  8a1a  271B           BEQ 0x8a37                        
  8a1c  17FE3E         LBSR 0x885d                       
  8a1f  2615           BNE 0x8a36                        
  8a21  CC0008         LDD #0x8                          
  8a24  17FF8D         LBSR 0x89b4                       
  8a27  F66079         LDB 0x6079                        
  8a2a  176FF3         LBSR 0xfa20                       
  8a2d  AD9F607A       JSR [0x607a]                      
  8a31  177006         LBSR 0xfa3a                       
  8a34  1A04           ORCC #0x4                         
LAB_8a36:
  8a36  39             RTS                               
LAB_8a37:
  8a37  1CFB           ANDCC #0xfb                       
  8a39  20FB           BRA 0x8a36                        
  8a3b  .db 39                                               ; 9

; ---- function API_FD22
API_FD22:
  8a3c  3436           PSHS  Y X B A                     
  8a3e  1F21           TFR Y,X                           
  8a40  17FFC5         LBSR 0x8a08                       
  8a43  260B           BNE 0x8a50                        
  8a45  10AF84         STY ,X                            
  8a48  E702           STB 0x2,X                         
  8a4a  6F03           CLR 0x3,X                         
  8a4c  1A04           ORCC #0x4                         
  8a4e  2007           BRA 0x8a57                        
LAB_8a50:
  8a50  CC0000         LDD #0x0                          
  8a53  ED84           STD ,X                            
  8a55  1CFB           ANDCC #0xfb                       
LAB_8a57:
  8a57  35B6           PULS  A B X Y PC                  

; ---- function API_FD24
API_FD24:
  8a59  3436           PSHS  Y X B A                     
  8a5b  CC0000         LDD #0x0                          
  8a5e  10A3A4         CMPD ,Y                           
  8a61  2715           BEQ 0x8a78                        
  8a63  E622           LDB 0x2,Y                         
  8a65  176FB8         LBSR 0xfa20                       
  8a68  10AEA4         LDY ,Y                            
  8a6b  EC61           LDD 0x1,S                         
  8a6d  ECAB           LDD D,Y                           
  8a6f  ADAB           JSR D,Y                           
  8a71  176FC6         LBSR 0xfa3a                       
  8a74  1A04           ORCC #0x4                         
  8a76  2002           BRA 0x8a7a                        
LAB_8a78:
  8a78  1CFB           ANDCC #0xfb                       
LAB_8a7a:
  8a7a  35B6           PULS  A B X Y PC                  

;; Kernel API slot $FD26: inline (key, descriptor)

; ---- function FarCallInline
FarCallInline:
  8a7c  3437           PSHS  Y X B A CC                  
  8a7e  3279           LEAS -0x7,S                       
  8a80  E667           LDB 0x7,S                         
  8a82  E7E4           STB ,S                            
  8a84  EC68           LDD 0x8,S                         
  8a86  ED61           STD 0x1,S                         
  8a88  EC6A           LDD 0xa,S                         
  8a8a  ED63           STD 0x3,S                         
  8a8c  EC6C           LDD 0xc,S                         
  8a8e  ED65           STD 0x5,S                         
  8a90  10AE6E         LDY 0xe,S                         
  8a93  ECA1           LDD ,Y++                          
  8a95  ED69           STD 0x9,S                         
  8a97  ECA1           LDD ,Y++                          
  8a99  ED67           STD 0x7,S                         
  8a9b  10AF6E         STY 0xe,S                         
  8a9e  10AE67         LDY 0x7,S                         
  8aa1  CC0000         LDD #0x0                          
  8aa4  10A3A4         CMPD ,Y                           
  8aa7  272D           BEQ 0x8ad6                        
  8aa9  F6600B         LDB 0x600b                        
  8aac  E76D           STB 0xd,S                         
  8aae  10AE67         LDY 0x7,S                         
  8ab1  E622           LDB 0x2,Y                         
  8ab3  F7600B         STB 0x600b                        
  8ab6  F78052         STB 0x8052                        
  8ab9  AEA4           LDX ,Y                            
  8abb  1F10           TFR X,D                           
  8abd  E369           ADDD 0x9,S                        
  8abf  1F02           TFR D,Y                           
  8ac1  1F10           TFR X,D                           
  8ac3  E3A4           ADDD ,Y                           
  8ac5  ED6B           STD 0xb,S                         
  8ac7  3537           PULS CC A B X Y                   
  8ac9  ADF804         JSR [0x4,S]                       
  8acc  3437           PSHS  Y X B A CC                  
  8ace  E66D           LDB 0xd,S                         
  8ad0  F7600B         STB 0x600b                        
  8ad3  F78052         STB 0x8052                        
LAB_8ad6:
  8ad6  3537           PULS CC A B X Y                   
  8ad8  3267           LEAS 0x7,S                        
  8ada  39             RTS                               

; ---- function API_FC0C
API_FC0C:
  8adb  3402           PSHS  A                           
  8add  1F10           TFR X,D                           
  8adf  17FD7B         LBSR 0x885d                       
  8ae2  2612           BNE 0x8af6                        
  8ae4  CC0008         LDD #0x8                          
  8ae7  17FECA         LBSR 0x89b4                       
  8aea  1F20           TFR Y,D                           
  8aec  17FEC5         LBSR 0x89b4                       
  8aef  17FD7E         LBSR 0x8870                       
  8af2  1A04           ORCC #0x4                         
  8af4  3121           LEAY 0x1,Y                        
LAB_8af6:
  8af6  3582           PULS  A PC                        

; ---- function API_FC0E
API_FC0E:
  8af8  1F10           TFR X,D                           
  8afa  17FD60         LBSR 0x885d                       
  8afd  2619           BNE 0x8b18                        
  8aff  CC0008         LDD #0x8                          
  8b02  17FEAF         LBSR 0x89b4                       
  8b05  1F20           TFR Y,D                           
  8b07  58             LSLB                              
  8b08  49             ROLA                              
  8b09  17FEA8         LBSR 0x89b4                       
  8b0c  17FD61         LBSR 0x8870                       
  8b0f  1F98           TFR B,A                           
  8b11  17FD5C         LBSR 0x8870                       
  8b14  3121           LEAY 0x1,Y                        
  8b16  1A04           ORCC #0x4                         
LAB_8b18:
  8b18  39             RTS                               

; ---- function API_FC0A
API_FC0A:
  8b19  3416           PSHS  X B A                       
  8b1b  1F10           TFR X,D                           
  8b1d  17FD3D         LBSR 0x885d                       
  8b20  260B           BNE 0x8b2d                        
LAB_8b22:
  8b22  17FD4B         LBSR 0x8870                       
  8b25  2604           BNE 0x8b2b                        
  8b27  E7A0           STB ,Y+                           
  8b29  20F7           BRA 0x8b22                        
LAB_8b2b:
  8b2b  8600           LDA #0x0                          
LAB_8b2d:
  8b2d  3596           PULS  A B X PC                    

; ---- function API_FC10
API_FC10:
  8b2f  3416           PSHS  X B A                       
  8b31  1E01           EXG D,X                           
  8b33  17FD27         LBSR 0x885d                       
  8b36  2610           BNE 0x8b48                        
  8b38  3706           PULU  A B                         
  8b3a  17FE77         LBSR 0x89b4                       
LAB_8b3d:
  8b3d  17FD30         LBSR 0x8870                       
  8b40  2606           BNE 0x8b48                        
  8b42  E7A0           STB ,Y+                           
  8b44  301F           LEAX -0x1,X                       
  8b46  26F5           BNE 0x8b3d                        
LAB_8b48:
  8b48  3596           PULS  A B X PC                    

;; Kernel API slot $FC12: inline: 2 words

; ---- function KernelHelper_FC12
KernelHelper_FC12:
  8b4a  3456           PSHS  U X B A                     
  8b4c  3406           PSHS  B A                         
  8b4e  1F43           TFR S,U                           
  8b50  327E           LEAS -0x2,S                       
  8b52  AE6A           LDX 0xa,S                         
  8b54  EC81           LDD ,X++                          
  8b56  3606           PSHU  B A                         
  8b58  EC81           LDD ,X++                          
  8b5a  AF6A           STX 0xa,S                         
  8b5c  AE62           LDX 0x2,S                         
  8b5e  8DCF           BSR 0x8b2f                        
  8b60  3264           LEAS 0x4,S                        
  8b62  35D6           PULS  A B X U PC                  

; ---- function API_FDA8
API_FDA8:
  8b64  3436           PSHS  Y X B A                     
  8b66  17FCF4         LBSR 0x885d                       
  8b69  2626           BNE 0x8b91                        
  8b6b  BE607A         LDX 0x607a                        
  8b6e  F66079         LDB 0x6079                        
  8b71  F7600C         STB 0x600c                        
  8b74  3005           LEAX 0x5,X                        
  8b76  176ED6         LBSR 0xfa4f                       
  8b79  C401           ANDB #0x1                         
  8b7b  2712           BEQ 0x8b8f                        
  8b7d  10BE607A       LDY 0x607a                        
  8b81  3121           LEAY 0x1,Y                        
  8b83  C6FF           LDB #0xff                         
  8b85  176EE4         LBSR 0xfa6c                       
  8b88  1700C5         LBSR 0x8c50                       
  8b8b  1A04           ORCC #0x4                         
  8b8d  2002           BRA 0x8b91                        
LAB_8b8f:
  8b8f  1CFB           ANDCC #0xfb                       
LAB_8b91:
  8b91  35B6           PULS  A B X Y PC                  

; ---- function API_FDAC
API_FDAC:
  8b93  3436           PSHS  Y X B A                     
  8b95  170084         LBSR 0x8c1c                       
  8b98  10BF6155       STY 0x6155                        
  8b9c  10BF6157       STY 0x6157                        
  8ba0  CC0000         LDD #0x0                          
  8ba3  FD6159         STD 0x6159                        
  8ba6  35B6           PULS  A B X Y PC                  

; ---- function FUN_8ba8
FUN_8ba8:
  8ba8  3436           PSHS  Y X B A                     
  8baa  C6A0           LDB #0xa0                         
  8bac  176E71         LBSR 0xfa20                       
  8baf  10BE6155       LDY 0x6155                        
  8bb3  E662           LDB 0x2,S                         
  8bb5  E7A0           STB ,Y+                           
  8bb7  10BF6155       STY 0x6155                        
  8bbb  FC6159         LDD 0x6159                        
  8bbe  C30001         ADDD #0x1                         
  8bc1  FD6159         STD 0x6159                        
  8bc4  176E73         LBSR 0xfa3a                       
  8bc7  35B6           PULS  A B X Y PC                  

; ---- function FUN_8bc9
FUN_8bc9:
  8bc9  3426           PSHS  Y B A                       
  8bcb  1F02           TFR D,Y                           
LAB_8bcd:
  8bcd  E680           LDB ,X+                           
  8bcf  8DD7           BSR 0x8ba8                        
  8bd1  313F           LEAY -0x1,Y                       
  8bd3  26F8           BNE 0x8bcd                        
  8bd5  35A6           PULS  A B Y PC                    

; ---- function FUN_8bd7
FUN_8bd7:
  8bd7  3476           PSHS  U Y X B A                   
  8bd9  C6A0           LDB #0xa0                         
  8bdb  176E42         LBSR 0xfa20                       
  8bde  10BE6155       LDY 0x6155                        
  8be2  10BF6017       STY 0x6017                        
  8be6  8E8855         LDX #0x8855                       
  8be9  EC02           LDD 0x2,X                         
  8beb  176EC8         LBSR 0xfab6                       
  8bee  3420           PSHS  Y                           
  8bf0  CC1FFA         LDD #0x1ffa                       
  8bf3  A3E1           SUBD ,S++                         
  8bf5  FD60BD         STD 0x60bd                        
  8bf8  10BE6157       LDY 0x6157                        
  8bfc  E625           LDB 0x5,Y                         
  8bfe  CA01           ORB #0x1                          
  8c00  E725           STB 0x5,Y                         
  8c02  BE6159         LDX 0x6159                        
  8c05  AF22           STX 0x2,Y                         
  8c07  5F             CLRB                              
  8c08  6F24           CLR 0x4,Y                         
LAB_8c0a:
  8c0a  EBA0           ADDB ,Y+                          
  8c0c  301F           LEAX -0x1,X                       
  8c0e  26FA           BNE 0x8c0a                        
  8c10  50             NEGB                              
  8c11  10BE6157       LDY 0x6157                        
  8c15  E724           STB 0x4,Y                         
  8c17  176E20         LBSR 0xfa3a                       
  8c1a  35F6           PULS  A B X Y U PC                

; ---- function FUN_8c1c
FUN_8c1c:
  8c1c  3416           PSHS  X B A                       
  8c1e  C6A0           LDB #0xa0                         
  8c20  176DFD         LBSR 0xfa20                       
  8c23  8E0300         LDX #0x300                        
  8c26  1F12           TFR X,Y                           
LAB_8c28:
  8c28  EC84           LDD ,X                            
  8c2a  1083FFFF       CMPD #0xffff                      
  8c2e  2711           BEQ 0x8c41                        
  8c30  C1FF           CMPB #0xff                        
  8c32  2707           BEQ 0x8c3b                        
  8c34  EC02           LDD 0x2,X                         
  8c36  17354F         LBSR 0xc188                       
  8c39  20ED           BRA 0x8c28                        
LAB_8c3b:
  8c3b  EC02           LDD 0x2,X                         
  8c3d  308B           LEAX D,X                          
  8c3f  20E7           BRA 0x8c28                        
LAB_8c41:
  8c41  8E8855         LDX #0x8855                       
  8c44  EC02           LDD 0x2,X                         
  8c46  176E6D         LBSR 0xfab6                       
  8c49  3138           LEAY -0x8,Y                       
  8c4b  176DEC         LBSR 0xfa3a                       
  8c4e  3596           PULS  A B X PC                    

; ---- function FUN_8c50
FUN_8c50:
  8c50  3470           PSHS  U Y X                       
  8c52  8DC8           BSR 0x8c1c                        
  8c54  10BF6017       STY 0x6017                        
  8c58  3128           LEAY 0x8,Y                        
  8c5a  3420           PSHS  Y                           
  8c5c  CC1FFA         LDD #0x1ffa                       
  8c5f  A3E1           SUBD ,S++                         
  8c61  FD60BD         STD 0x60bd                        
  8c64  35F0           PULS  X Y U PC                    

; ---- function API_FC18
API_FC18:
  8c66  3406           PSHS  B A                         
  8c68  171051         LBSR 0x9cbc                        ; inline[API_FDD6]: $6022
  8c6b  6022           addr 6022                         
LAB_8c6d:
  8c6d  CC8C7B         LDD #0x8c7b                       
  8c70  FD6032         STD 0x6032                        
  8c73  CC8CFD         LDD #0x8cfd                       
  8c76  FD6034         STD 0x6034                        
  8c79  3586           PULS  A B PC                      

; ---- function FUN_8c7b
FUN_8c7b:
  8c7b  3406           PSHS  B A                         
  8c7d  F66022         LDB 0x6022                        
  8c80  176D9D         LBSR 0xfa20                       
  8c83  F66058         LDB 0x6058                        
  8c86  C407           ANDB #0x7                         
  8c88  4F             CLRA                              
  8c89  1735CA         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->8CAB 1->8CB6 2->8CB0 3->8CAB 4->8CAB 5->8CA4 6->8C9C 7->8CAB
  8c8c  8CAB           addr 8cab                         
  8c8e  8CB6           addr 8cb6                         
  8c90  8CB0           addr 8cb0                         
  8c92  8CAB           addr 8cab                         
  8c94  8CAB           addr 8cab                         
  8c96  8CA4           addr 8ca4                         
  8c98  8C9C           addr 8c9c                         
  8c9a  8CAB           addr 8cab                         

; ---- function FUN_8c9c
FUN_8c9c:
  8c9c  17002D         LBSR 0x8ccc                       
  8c9f  260A           BNE 0x8cab                        
  8ca1  170042         LBSR 0x8ce6                       

; ---- function FUN_8ca4
FUN_8ca4:
  8ca4  FC60DE         LDD 0x60de                        
LAB_8ca7:
  8ca7  AD9F605A       JSR [0x605a]                      

; ---- function FUN_8cab
FUN_8cab:
  8cab  176D8C         LBSR 0xfa3a                       
  8cae  3586           PULS  A B PC                      

; ---- function FUN_8cb0
FUN_8cb0:
  8cb0  8D1A           BSR 0x8ccc                        
  8cb2  26F7           BNE 0x8cab                        
  8cb4  8D30           BSR 0x8ce6                        

; ---- function FUN_8cb6
FUN_8cb6:
  8cb6  FC6054         LDD 0x6054                        
  8cb9  F360DE         ADDD 0x60de                       
  8cbc  2506           BCS 0x8cc4                        
  8cbe  10B36056       CMPD 0x6056                       
  8cc2  2303           BLS 0x8cc7                        
LAB_8cc4:
  8cc4  FC6056         LDD 0x6056                        
LAB_8cc7:
  8cc7  FD6054         STD 0x6054                        
  8cca  20DB           BRA 0x8ca7                        

; ---- function FUN_8ccc
FUN_8ccc:
  8ccc  3406           PSHS  B A                         
  8cce  7D604C         TST 0x604c                        
  8cd1  2705           BEQ 0x8cd8                        
  8cd3  172F15         LBSR 0xbbeb                       
  8cd6  260A           BNE 0x8ce2                        
LAB_8cd8:
  8cd8  FC60E0         LDD 0x60e0                        
  8cdb  172F03         LBSR 0xbbe1                       
  8cde  1A04           ORCC #0x4                         
  8ce0  2002           BRA 0x8ce4                        
LAB_8ce2:
  8ce2  1CFB           ANDCC #0xfb                       
LAB_8ce4:
  8ce4  3586           PULS  A B PC                      

; ---- function FUN_8ce6
FUN_8ce6:
  8ce6  3406           PSHS  B A                         
  8ce8  7D604C         TST 0x604c                        
  8ceb  2609           BNE 0x8cf6                        
  8ced  CC0064         LDD #0x64                         
  8cf0  F360E0         ADDD 0x60e0                       
  8cf3  172EEB         LBSR 0xbbe1                       
LAB_8cf6:
  8cf6  86FF           LDA #0xff                         
  8cf8  B7604C         STA 0x604c                        
  8cfb  3586           PULS  A B PC                      

; ---- function FUN_8cfd
FUN_8cfd:
  8cfd  3406           PSHS  B A                         
  8cff  F66022         LDB 0x6022                        
  8d02  176D1B         LBSR 0xfa20                       
  8d05  F66058         LDB 0x6058                        
  8d08  C407           ANDB #0x7                         
  8d0a  4F             CLRA                              
  8d0b  173548         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->8D30 1->8D3D 2->8D35 3->8D30 4->8D30 5->8D26 6->8D1E 7->8D30
  8d0e  8D30           addr 8d30                         
  8d10  8D3D           addr 8d3d                         
  8d12  8D35           addr 8d35                         
  8d14  8D30           addr 8d30                         
  8d16  8D30           addr 8d30                         
  8d18  8D26           addr 8d26                         
  8d1a  8D1E           addr 8d1e                         
  8d1c  8D30           addr 8d30                         

; ---- function FUN_8d1e
FUN_8d1e:
  8d1e  17FFAB         LBSR 0x8ccc                       
  8d21  260D           BNE 0x8d30                        
  8d23  17FFC0         LBSR 0x8ce6                       

; ---- function FUN_8d26
FUN_8d26:
  8d26  CC0000         LDD #0x0                          
  8d29  B360DE         SUBD 0x60de                       
LAB_8d2c:
  8d2c  AD9F605A       JSR [0x605a]                      

; ---- function FUN_8d30
FUN_8d30:
  8d30  176D07         LBSR 0xfa3a                       
  8d33  3586           PULS  A B PC                      

; ---- function FUN_8d35
FUN_8d35:
  8d35  17FF94         LBSR 0x8ccc                       
  8d38  26F6           BNE 0x8d30                        
  8d3a  17FFA9         LBSR 0x8ce6                       

; ---- function FUN_8d3d
FUN_8d3d:
  8d3d  FC6054         LDD 0x6054                        
  8d40  B360DE         SUBD 0x60de                       
  8d43  10B36054       CMPD 0x6054                       
  8d47  2303           BLS 0x8d4c                        
  8d49  CC0000         LDD #0x0                          
LAB_8d4c:
  8d4c  FD6054         STD 0x6054                        
  8d4f  20DB           BRA 0x8d2c                        

; ---- function API_FC14
API_FC14:
  8d51  3477           PSHS  U Y X B A CC                
  8d53  170F66         LBSR 0x9cbc                        ; inline[API_FDD6]: $6022
  8d56  6022           addr 6022                         
LAB_8d58:
  8d58  7F60DB         CLR 0x60db                        
  8d5b  CC0000         LDD #0x0                          
  8d5e  B3606E         SUBD 0x606e                       
  8d61  FD615D         STD 0x615d                        
  8d64  FD601F         STD 0x601f                        
  8d67  F3606C         ADDD 0x606c                       
  8d6a  FD615B         STD 0x615b                        
  8d6d  7D6066         TST 0x6066                        
  8d70  271B           BEQ 0x8d8d                        
  8d72  FC615B         LDD 0x615b                        
  8d75  FD6064         STD 0x6064                        
  8d78  FC6074         LDD 0x6074                        
  8d7b  FD615F         STD 0x615f                        
  8d7e  F3615D         ADDD 0x615d                       
  8d81  FD6062         STD 0x6062                        
  8d84  CC8DD7         LDD #0x8dd7                       
  8d87  FD605C         STD 0x605c                        
  8d8a  17077C         LBSR 0x9509                       
LAB_8d8d:
  8d8d  7D6058         TST 0x6058                        
  8d90  2718           BEQ 0x8daa                        
  8d92  FC615B         LDD 0x615b                        
  8d95  FD6056         STD 0x6056                        
  8d98  FC6074         LDD 0x6074                        
  8d9b  F3615D         ADDD 0x615d                       
  8d9e  FD6054         STD 0x6054                        
  8da1  CC8E11         LDD #0x8e11                       
  8da4  FD605A         STD 0x605a                        
  8da7  17FEBC         LBSR 0x8c66                       
LAB_8daa:
  8daa  CC8E23         LDD #0x8e23                       
  8dad  FD606A         STD 0x606a                        
  8db0  170385         LBSR 0x9138                       
  8db3  35F7           PULS CC A B X Y U PC              

; ---- function FUN_8db5
FUN_8db5:
  8db5  3406           PSHS  B A                         
  8db7  FC606E         LDD 0x606e                        
  8dba  3606           PSHU  B A                         
  8dbc  FC606C         LDD 0x606c                        
  8dbf  3606           PSHU  B A                         
  8dc1  ECE4           LDD ,S                            
  8dc3  3606           PSHU  B A                         
  8dc5  172F10         LBSR 0xbcd8                       
  8dc8  ECC4           LDD ,U                            
  8dca  F3615D         ADDD 0x615d                       
  8dcd  FD6054         STD 0x6054                        
  8dd0  FD6062         STD 0x6062                        
  8dd3  3706           PULU  A B                         
  8dd5  2010           BRA 0x8de7                        

; ---- function FUN_8dd7
FUN_8dd7:
  8dd7  3406           PSHS  B A                         
  8dd9  C601           LDB #0x1                          
  8ddb  F760DB         STB 0x60db                        
  8dde  FC6062         LDD 0x6062                        
  8de1  FD6054         STD 0x6054                        
  8de4  B3615D         SUBD 0x615d                       
LAB_8de7:
  8de7  7F604D         CLR 0x604d                        
  8dea  FD6074         STD 0x6074                        
  8ded  3606           PSHU  B A                         
  8def  108E609A       LDY #0x609a                       
  8df3  8610           LDA #0x10                         
  8df5  170A84         LBSR 0x987c                       
  8df8  17011F         LBSR 0x8f1a                       
  8dfb  F66022         LDB 0x6022                        
  8dfe  176C1F         LBSR 0xfa20                       
  8e01  FC6074         LDD 0x6074                        
  8e04  AD9F6070       JSR [0x6070]                      
  8e08  AD9F6072       JSR [0x6072]                      
  8e0c  176C2B         LBSR 0xfa3a                       
  8e0f  3586           PULS  A B PC                      

; ---- function FUN_8e11
FUN_8e11:
  8e11  3406           PSHS  B A                         
  8e13  C602           LDB #0x2                          
  8e15  F760DB         STB 0x60db                        
  8e18  FC6054         LDD 0x6054                        
  8e1b  FD6062         STD 0x6062                        
  8e1e  B3615D         SUBD 0x615d                       
  8e21  20C4           BRA 0x8de7                        

; ---- function FUN_8e23
FUN_8e23:
  8e23  3406           PSHS  B A                         
  8e25  C603           LDB #0x3                          
  8e27  F760DB         STB 0x60db                        
  8e2a  FC6074         LDD 0x6074                        
  8e2d  F3615D         ADDD 0x615d                       
  8e30  FD6062         STD 0x6062                        
  8e33  FD6054         STD 0x6054                        
  8e36  1700E1         LBSR 0x8f1a                       
  8e39  F66022         LDB 0x6022                        
  8e3c  176BE1         LBSR 0xfa20                       
  8e3f  FC6074         LDD 0x6074                        
  8e42  AD9F6072       JSR [0x6072]                      
  8e46  176BF1         LBSR 0xfa3a                       
  8e49  3506           PULS  A B                         
  8e4b  39             RTS                               

; ---- function FUN_8e4c
FUN_8e4c:
  8e4c  170018         LBSR 0x8e67                        ; inline[API_FC16]: 00 00 00 00 00 00 00 00 $0000 $0000 $0000 ->$0000 ->$0000 $0000 $0000 $0000
  8e4f  00             db 0h                             
  8e50  00             db 0h                             
  8e51  00             db 0h                             
  8e52  00             db 0h                             
  8e53  00             db 0h                             
  8e54  00             db 0h                             
  8e55  00             db 0h                             
  8e56  00             db 0h                             
  8e57  0000           dw 0h                             
  8e59  0000           dw 0h                             
  8e5b  0000           dw 0h                             
  8e5d  0000           addr 0000                         
  8e5f  0000           addr 0000                         
  8e61  0000           dw 0h                             
  8e63  0000           dw 0h                             
  8e65  0000           dw 0h                             

;; Kernel API slot $FC16: inline 24-byte record: limits + display/adjust callbacks

; ---- function SetupParamEditPage
SetupParamEditPage:
  8e67  3437           PSHS  Y X B A CC                  
  8e69  AE67           LDX 0x7,S                         
  8e6b  327C           LEAS -0x4,S                       
  8e6d  E680           LDB ,X+                           
  8e6f  F76066         STB 0x6066                        
  8e72  E680           LDB ,X+                           
  8e74  F76067         STB 0x6067                        
  8e77  E680           LDB ,X+                           
  8e79  F76058         STB 0x6058                        
  8e7c  E680           LDB ,X+                           
  8e7e  4F             CLRA                              
  8e7f  FD60E0         STD 0x60e0                        
  8e82  E680           LDB ,X+                           
  8e84  F76068         STB 0x6068                        
  8e87  E680           LDB ,X+                           
  8e89  F76099         STB 0x6099                        
  8e8c  E680           LDB ,X+                           
  8e8e  F76069         STB 0x6069                        
  8e91  CC0000         LDD #0x0                          
  8e94  EDE4           STD ,S                            
  8e96  E680           LDB ,X+                           
  8e98  E762           STB 0x2,S                         
  8e9a  2A05           BPL 0x8ea1                        
  8e9c  FC600D         LDD 0x600d                        
  8e9f  EDE4           STD ,S                            
LAB_8ea1:
  8ea1  C640           LDB #0x40                         
  8ea3  E462           ANDB 0x2,S                        
  8ea5  260C           BNE 0x8eb3                        
  8ea7  EC81           LDD ,X++                          
  8ea9  FD606C         STD 0x606c                        
  8eac  EC81           LDD ,X++                          
  8eae  FD606E         STD 0x606e                        
  8eb1  2010           BRA 0x8ec3                        
LAB_8eb3:
  8eb3  10AE81         LDY ,X++                          
  8eb6  ECA4           LDD ,Y                            
  8eb8  FD606C         STD 0x606c                        
  8ebb  10AE81         LDY ,X++                          
  8ebe  ECA4           LDD ,Y                            
  8ec0  FD606E         STD 0x606e                        
LAB_8ec3:
  8ec3  EC81           LDD ,X++                          
  8ec5  6D62           TST 0x2,S                         
  8ec7  2A10           BPL 0x8ed9                        
  8ec9  EC81           LDD ,X++                          
  8ecb  E3E4           ADDD ,S                           
  8ecd  FD6070         STD 0x6070                        
  8ed0  EC81           LDD ,X++                          
  8ed2  E3E4           ADDD ,S                           
  8ed4  FD6072         STD 0x6072                        
  8ed7  202C           BRA 0x8f05                        
LAB_8ed9:
  8ed9  CC0000         LDD #0x0                          
  8edc  10A384         CMPD ,X                           
  8edf  2706           BEQ 0x8ee7                        
  8ee1  1F10           TFR X,D                           
  8ee3  E381           ADDD ,X++                         
  8ee5  2005           BRA 0x8eec                        
LAB_8ee7:
  8ee7  CCFFE8         LDD #0xffe8                       
  8eea  3002           LEAX 0x2,X                        
LAB_8eec:
  8eec  FD6070         STD 0x6070                        
  8eef  CC0000         LDD #0x0                          
  8ef2  10A384         CMPD ,X                           
  8ef5  2706           BEQ 0x8efd                        
  8ef7  1F10           TFR X,D                           
  8ef9  E381           ADDD ,X++                         
  8efb  2005           BRA 0x8f02                        
LAB_8efd:
  8efd  CCFFE8         LDD #0xffe8                       
  8f00  3002           LEAX 0x2,X                        
LAB_8f02:
  8f02  FD6072         STD 0x6072                        
LAB_8f05:
  8f05  EC81           LDD ,X++                          
  8f07  FD60DC         STD 0x60dc                        
  8f0a  EC81           LDD ,X++                          
  8f0c  FD60DE         STD 0x60de                        
  8f0f  EC81           LDD ,X++                          
  8f11  3264           LEAS 0x4,S                        
  8f13  AF67           STX 0x7,S                         
  8f15  17FE39         LBSR 0x8d51                       
  8f18  35B7           PULS CC A B X Y PC                

; ---- function FUN_8f1a
FUN_8f1a:
  8f1a  3407           PSHS  B A CC                      
  8f1c  FC6074         LDD 0x6074                        
  8f1f  10B3615F       CMPD 0x615f                       
  8f23  2205           BHI 0x8f2a                        
  8f25  2507           BCS 0x8f2e                        
  8f27  5F             CLRB                              
  8f28  2006           BRA 0x8f30                        
LAB_8f2a:
  8f2a  C601           LDB #0x1                          
  8f2c  2002           BRA 0x8f30                        
LAB_8f2e:
  8f2e  C6FF           LDB #0xff                         
LAB_8f30:
  8f30  F760E2         STB 0x60e2                        
  8f33  FC6074         LDD 0x6074                        
  8f36  FD615F         STD 0x615f                        
  8f39  3587           PULS CC A B PC                    

; ---- function FUN_8f3b
FUN_8f3b:
  8f3b  3436           PSHS  Y X B A                     
  8f3d  CCFFE8         LDD #0xffe8                       
  8f40  FD605C         STD 0x605c                        
  8f43  FD605A         STD 0x605a                        
  8f46  FD606A         STD 0x606a                        
  8f49  FD6072         STD 0x6072                        
  8f4c  FD6070         STD 0x6070                        
  8f4f  35B6           PULS  A B X Y PC                  
DAT_8f51:
  8f51  1A             undefined1 1Ah                    
  8f52  .db 1B 10 0C 02 04 03 01 07 05 06 08 11 13 12 0A 17  ; ................
  8f62  .db 19 18 0D 14 16 15 0B 09                          ; ........

; ---- function API_FC1A
API_FC1A:
  8f6a  3412           PSHS  X A                         
  8f6c  8E604E         LDX #0x604e                       
  8f6f  8601           LDA #0x1                          
  8f71  8D3C           BSR 0x8faf                        
  8f73  8D3A           BSR 0x8faf                        
  8f75  8D38           BSR 0x8faf                        
  8f77  8D36           BSR 0x8faf                        
  8f79  8D34           BSR 0x8faf                        
  8f7b  8D32           BSR 0x8faf                        
  8f7d  8E604E         LDX #0x604e                       
  8f80  5F             CLRB                              
  8f81  8D36           BSR 0x8fb9                        
  8f83  271F           BEQ 0x8fa4                        
  8f85  8D32           BSR 0x8fb9                        
  8f87  271B           BEQ 0x8fa4                        
  8f89  8D2E           BSR 0x8fb9                        
  8f8b  2717           BEQ 0x8fa4                        
  8f8d  8D2A           BSR 0x8fb9                        
  8f8f  2713           BEQ 0x8fa4                        
  8f91  8D26           BSR 0x8fb9                        
  8f93  270F           BEQ 0x8fa4                        
  8f95  8D22           BSR 0x8fb9                        
  8f97  270B           BEQ 0x8fa4                        
  8f99  8604           LDA #0x4                          
  8f9b  B4604E         ANDA 0x604e                       
  8f9e  2704           BEQ 0x8fa4                        
  8fa0  C600           LDB #0x0                          
  8fa2  2009           BRA 0x8fad                        
LAB_8fa4:
  8fa4  8E8F51         LDX #0x8f51                       
  8fa7  A685           LDA B,X                           
  8fa9  1F89           TFR A,B                           
  8fab  86FF           LDA #0xff                         
LAB_8fad:
  8fad  3592           PULS  A X PC                      

; ---- function FUN_8faf
FUN_8faf:
  8faf  B78057         STA 0x8057                        
  8fb2  F68056         LDB 0x8056                        
  8fb5  E780           STB ,X+                           
  8fb7  48             LSLA                              
  8fb8  39             RTS                               

; ---- function FUN_8fb9
FUN_8fb9:
  8fb9  8601           LDA #0x1                          
  8fbb  A484           ANDA ,X                           
  8fbd  2716           BEQ 0x8fd5                        
  8fbf  5C             INCB                              
  8fc0  8602           LDA #0x2                          
  8fc2  A484           ANDA ,X                           
  8fc4  270F           BEQ 0x8fd5                        
  8fc6  5C             INCB                              
  8fc7  8610           LDA #0x10                         
  8fc9  A484           ANDA ,X                           
  8fcb  2708           BEQ 0x8fd5                        
  8fcd  5C             INCB                              
  8fce  8620           LDA #0x20                         
  8fd0  A484           ANDA ,X                           
  8fd2  2701           BEQ 0x8fd5                        
  8fd4  5C             INCB                              
LAB_8fd5:
  8fd5  3401           PSHS  CC                          
  8fd7  3001           LEAX 0x1,X                        
  8fd9  3581           PULS CC PC                        

; ---- function API_FC1C
API_FC1C:
  8fdb  3436           PSHS  Y X B A                     
  8fdd  17FF8A         LBSR 0x8f6a                       
  8fe0  8D02           BSR 0x8fe4                        
  8fe2  35B6           PULS  A B X Y PC                  

; ---- function FUN_8fe4
FUN_8fe4:
  8fe4  3417           PSHS  X B A CC                    
  8fe6  F66021         LDB 0x6021                        
  8fe9  176A34         LBSR 0xfa20                       
  8fec  E663           LDB 0x3,S                         
  8fee  F160FD         CMPB 0x60fd                       
  8ff1  260B           BNE 0x8ffe                        
  8ff3  7D604C         TST 0x604c                        
  8ff6  2609           BNE 0x9001                        
LAB_8ff8:
  8ff8  176A3F         LBSR 0xfa3a                       
  8ffb  3517           PULS CC A B X                     
  8ffd  39             RTS                               
LAB_8ffe:
  8ffe  7F604C         CLR 0x604c                        
LAB_9001:
  9001  F760FD         STB 0x60fd                        
  9004  C510           BITB #0x10                        
  9006  1026008D       LBNE 0x9097                       
  900a  17011F         LBSR 0x912c                       
  900d  4F             CLRA                              
  900e  C40F           ANDB #0xf                         
  9010  173243         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->9033 1->9039 2->903F 3->9045 4->904B 5->9051 6->9057 7->905D 8->9063 9->9069 10->906F 11->9075 12->907B 13->9086 14->9091 15->9094
  9013  9033           addr 9033                         
  9015  9039           addr 9039                         
  9017  903F           addr 903f                         
  9019  9045           addr 9045                         
  901b  904B           addr 904b                         
  901d  9051           addr 9051                         
  901f  9057           addr 9057                         
  9021  905D           addr 905d                         
  9023  9063           addr 9063                         
  9025  9069           addr 9069                         
  9027  906F           addr 906f                         
  9029  9075           addr 9075                         
  902b  907B           addr 907b                         
  902d  9086           addr 9086                         
  902f  9091           addr 9091                         
  9031  9094           addr 9094                         

; ---- function FUN_9033
FUN_9033:
  9033  AD9F6048       JSR [0x6048]                      
  9037  20BF           BRA 0x8ff8                        

; ---- function FUN_9039
FUN_9039:
  9039  AD9F603C       JSR [0x603c]                      
  903d  2066           BRA 0x90a5                        

; ---- function FUN_903f
FUN_903f:
  903f  AD9F603E       JSR [0x603e]                      
  9043  2060           BRA 0x90a5                        

; ---- function FUN_9045
FUN_9045:
  9045  AD9F6040       JSR [0x6040]                      
  9049  205A           BRA 0x90a5                        

; ---- function FUN_904b
FUN_904b:
  904b  AD9F6042       JSR [0x6042]                      
  904f  2054           BRA 0x90a5                        

; ---- function FUN_9051
FUN_9051:
  9051  AD9F603A       JSR [0x603a]                      
  9055  204E           BRA 0x90a5                        

; ---- function FUN_9057
FUN_9057:
  9057  AD9F6030       JSR [0x6030]                      
  905b  2048           BRA 0x90a5                        

; ---- function FUN_905d
FUN_905d:
  905d  AD9F602E       JSR [0x602e]                      
  9061  2042           BRA 0x90a5                        

; ---- function FUN_9063
FUN_9063:
  9063  AD9F602A       JSR [0x602a]                      
  9067  203C           BRA 0x90a5                        

; ---- function FUN_9069
FUN_9069:
  9069  AD9F602C       JSR [0x602c]                      
  906d  2036           BRA 0x90a5                        

; ---- function FUN_906f
FUN_906f:
  906f  AD9F6032       JSR [0x6032]                      
  9073  2030           BRA 0x90a5                        

; ---- function FUN_9075
FUN_9075:
  9075  AD9F6034       JSR [0x6034]                      
  9079  202A           BRA 0x90a5                        

; ---- function FUN_907b
FUN_907b:
  907b  7D604D         TST 0x604d                        
  907e  2604           BNE 0x9084                        
  9080  AD9F6038       JSR [0x6038]                      
LAB_9084:
  9084  2011           BRA 0x9097                        

; ---- function FUN_9086
FUN_9086:
  9086  7D604D         TST 0x604d                        
  9089  2604           BNE 0x908f                        
  908b  AD9F6036       JSR [0x6036]                      
LAB_908f:
  908f  2006           BRA 0x9097                        

; ---- function FUN_9091
FUN_9091:
  9091  16FF64         LBRA 0x8ff8                       

; ---- function FUN_9094
FUN_9094:
  9094  16FF61         LBRA 0x8ff8                       

; ---- function FUN_9097
FUN_9097:
  9097  F660FD         LDB 0x60fd                        
  909a  AD9F6044       JSR [0x6044]                      
  909e  AD9F6046       JSR [0x6046]                      
  90a2  16FF53         LBRA 0x8ff8                       

; ---- function FUN_90a5
FUN_90a5:
  90a5  7F604D         CLR 0x604d                        
  90a8  16FF4D         LBRA 0x8ff8                       

; ---- function FUN_90ab
FUN_90ab:
  90ab  3407           PSHS  B A CC                      
  90ad  1731D9         LBSR 0xc289                        ; inline[API_FD18]: [$602A]=$FFE8 [$602C]=$FFE8 [$602E]=$FFE8 [$6030]=$FFE8 [$6032]=$FFE8 [$6034]=$FFE8 [$6036]=$FFE8 [$6038]=$FFE8 [$603A]=$FFE8 [$603C]=$FFE8 [$603E]=$FFE8 [$6040]=$FFE8 [$6042]=$FFE8 [$6044]=$FFE8 [$6046]=$FFE8 [$6048]=$FFE8 [$604A]=$FFE8
  90b0  602A           addr 602a                         
  90b2  FFE8           dw FFE8h                          
  90b4  602C           addr 602c                         
  90b6  FFE8           dw FFE8h                          
  90b8  602E           addr 602e                         
  90ba  FFE8           dw FFE8h                          
  90bc  6030           addr 6030                         
  90be  FFE8           dw FFE8h                          
  90c0  6032           addr 6032                         
  90c2  FFE8           dw FFE8h                          
  90c4  6034           addr 6034                         
  90c6  FFE8           dw FFE8h                          
  90c8  6036           addr 6036                         
  90ca  FFE8           dw FFE8h                          
  90cc  6038           addr 6038                         
  90ce  FFE8           dw FFE8h                          
  90d0  603A           addr 603a                         
  90d2  FFE8           dw FFE8h                          
  90d4  603C           addr 603c                         
  90d6  FFE8           dw FFE8h                          
  90d8  603E           addr 603e                         
  90da  FFE8           dw FFE8h                          
  90dc  6040           addr 6040                         
  90de  FFE8           dw FFE8h                          
  90e0  6042           addr 6042                         
  90e2  FFE8           dw FFE8h                          
  90e4  6044           addr 6044                         
  90e6  FFE8           dw FFE8h                          
  90e8  6046           addr 6046                         
  90ea  FFE8           dw FFE8h                          
  90ec  6048           addr 6048                         
  90ee  FFE8           dw FFE8h                          
  90f0  604A           addr 604a                         
  90f2  FFE8           dw FFE8h                          
  90f4  FFFF           dw FFFFh                          
LAB_90f6:
  90f6  7F604C         CLR 0x604c                        
  90f9  7F604D         CLR 0x604d                        
  90fc  7F60FD         CLR 0x60fd                        
  90ff  3587           PULS CC A B PC                    

; ---- function FUN_9101
FUN_9101:
  9101  3436           PSHS  Y X B A                     
LAB_9103:
  9103  E680           LDB ,X+                           
  9105  2709           BEQ 0x9110                        
  9107  17FEDA         LBSR 0x8fe4                       
  910a  5F             CLRB                              
  910b  17FED6         LBSR 0x8fe4                       
  910e  20F3           BRA 0x9103                        
LAB_9110:
  9110  35B6           PULS  A B X Y PC                  

; ---- function API_FE4A
API_FE4A:
  9112  3436           PSHS  Y X B A                     
LAB_9114:
  9114  17FE53         LBSR 0x8f6a                       
  9117  F160FD         CMPB 0x60fd                       
  911a  2605           BNE 0x9121                        
  911c  17F45A         LBSR 0x8579                       
  911f  20F3           BRA 0x9114                        
LAB_9121:
  9121  35B6           PULS  A B X Y PC                  

; ---- function API_FDAE
API_FDAE:
  9123  3402           PSHS  A                           
  9125  B68056         LDA 0x8056                        
  9128  8404           ANDA #0x4                         
  912a  3582           PULS  A PC                        

; ---- function FUN_912c
FUN_912c:
  912c  3404           PSHS  B                           
  912e  C104           CMPB #0x4                         
  9130  2204           BHI 0x9136                        
  9132  5A             DECB                              
  9133  F760B9         STB 0x60b9                        
LAB_9136:
  9136  3584           PULS  B PC                        

; ---- function API_FC1E
API_FC1E:
  9138  3477           PSHS  U Y X B A CC                
  913a  170B7F         LBSR 0x9cbc                        ; inline[API_FDD6]: $6022
  913d  6022           addr 6022                         
LAB_913f:
  913f  33E4           LEAU ,S                           
  9141  327C           LEAS -0x4,S                       
  9143  108E609A       LDY #0x609a                       
  9147  FC6074         LDD 0x6074                        
  914a  3606           PSHU  B A                         
  914c  8610           LDA #0x10                         
  914e  17072B         LBSR 0x987c                       
  9151  7F60A3         CLR 0x60a3                        
  9154  CC919C         LDD #0x919c                       
  9157  FD6044         STD 0x6044                        
  915a  7F604D         CLR 0x604d                        
  915d  CC0000         LDD #0x0                          
  9160  B3606E         SUBD 0x606e                       
  9163  F3606C         ADDD 0x606c                       
  9166  3606           PSHU  B A                         
  9168  CC0009         LDD #0x9                          
  916b  3606           PSHU  B A                         
  916d  172C0F         LBSR 0xbd7f                       
  9170  3706           PULU  A B                         
  9172  FD6165         STD 0x6165                        
  9175  B66069         LDA 0x6069                        
  9178  8001           SUBA #0x1                         
  917a  B76161         STA 0x6161                        
  917d  86FF           LDA #0xff                         
  917f  B76168         STA 0x6168                        
  9182  B76167         STA 0x6167                        
  9185  7D6099         TST 0x6099                        
  9188  2603           BNE 0x918d                        
  918a  7F6168         CLR 0x6168                        
LAB_918d:
  918d  7D606E         TST 0x606e                        
  9190  2B06           BMI 0x9198                        
  9192  7F6167         CLR 0x6167                        
  9195  7C6161         INC 0x6161                        
LAB_9198:
  9198  3264           LEAS 0x4,S                        
  919a  35F7           PULS CC A B X Y U PC              

; ---- function FUN_919c
FUN_919c:
  919c  3477           PSHS  U Y X B A CC                
  919e  F66022         LDB 0x6022                        
  91a1  17687C         LBSR 0xfa20                       
  91a4  E663           LDB 0x3,S                         
  91a6  3276           LEAS -0xa,S                       
  91a8  7D604D         TST 0x604d                        
  91ab  2679           BNE 0x9226                        
  91ad  7F6163         CLR 0x6163                        
  91b0  3404           PSHS  B                           
  91b2  4F             CLRA                              
  91b3  F66068         LDB 0x6068                        
  91b6  C407           ANDB #0x7                         
  91b8  17309B         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->91E8 1->9221 2->91CB 3->91ED 4->9218 5->91E8 6->91E8 7->91E8
  91bb  91E8           addr 91e8                         
  91bd  9221           addr 9221                         
  91bf  91CB           addr 91cb                         
  91c1  91ED           addr 91ed                         
  91c3  9218           addr 9218                         
  91c5  91E8           addr 91e8                         
  91c7  91E8           addr 91e8                         
  91c9  91E8           addr 91e8                         

; ---- function FUN_91cb
FUN_91cb:
  91cb  3504           PULS  B                           
  91cd  C110           CMPB #0x10                        
  91cf  10250160       LBCS 0x9333                       
  91d3  C119           CMPB #0x19                        
  91d5  1022015A       LBHI 0x9333                       
  91d9  4F             CLRA                              
  91da  C010           SUBB #0x10                        
  91dc  10B3606C       CMPD 0x606c                       
  91e0  2303           BLS 0x91e5                        
  91e2  FC606C         LDD 0x606c                        
LAB_91e5:
  91e5  160132         LBRA 0x931a                       

; ---- function FUN_91e8
FUN_91e8:
  91e8  3504           PULS  B                           
  91ea  160146         LBRA 0x9333                       

; ---- function FUN_91ed
FUN_91ed:
  91ed  3504           PULS  B                           
  91ef  C110           CMPB #0x10                        
  91f1  1025013E       LBCS 0x9333                       
  91f5  C119           CMPB #0x19                        
  91f7  10220138       LBHI 0x9333                       
  91fb  2715           BEQ 0x9212                        
  91fd  4F             CLRA                              
  91fe  C010           SUBB #0x10                        
  9200  3606           PSHU  B A                         
  9202  FC6165         LDD 0x6165                        
  9205  3606           PSHU  B A                         
  9207  172C17         LBSR 0xbe21                       
  920a  FC606E         LDD 0x606e                        
  920d  E3C1           ADDD ,U++                         
  920f  160108         LBRA 0x931a                       
LAB_9212:
  9212  FC606C         LDD 0x606c                        
  9215  160102         LBRA 0x931a                       

; ---- function FUN_9218
FUN_9218:
  9218  C6FF           LDB #0xff                         
  921a  F76169         STB 0x6169                        
  921d  3504           PULS  B                           
  921f  2005           BRA 0x9226                        

; ---- function FUN_9221
FUN_9221:
  9221  7F6169         CLR 0x6169                        
  9224  3504           PULS  B                           
LAB_9226:
  9226  4F             CLRA                              
  9227  17303B         LBSR 0xc265                        ; inline[API_FD16]: switch(D) 000C->930E 000D->92C9 001A->927E 001B->929D
  922a  000C           dw Ch                             
  922c  930E           addr 930e                         
  922e  000D           dw Dh                             
  9230  92C9           addr 92c9                         
  9232  001A           dw 1Ah                            
  9234  927E           addr 927e                         
  9236  001B           dw 1Bh                            
  9238  929D           addr 929d                         
  923a  0000           dw 0h                             
  923c  FFFF           dw FFFFh                          
LAB_923e:
  923e  CB20           ADDB #0x20                        
LAB_9240:
  9240  7D604D         TST 0x604d                        
  9243  2603           BNE 0x9248                        
  9245  1700F2         LBSR 0x933a                       
LAB_9248:
  9248  7D6162         TST 0x6162                        
  924b  102700E4       LBEQ 0x9333                       
  924f  170107         LBSR 0x9359                       
  9252  7A6162         DEC 0x6162                        
  9255  108E6580       LDY #0x6580                       
  9259  3440           PSHS  U                           
  925b  CE0008         LDU #0x8                          
  925e  172FBD         LBSR 0xc21e                       
  9261  3540           PULS  U                           
LAB_9263:
  9263  8E6580         LDX #0x6580                       
  9266  108E609B       LDY #0x609b                       
  926a  CC0008         LDD #0x8                          
  926d  172F18         LBSR 0xc188                       
  9270  7D6169         TST 0x6169                        
  9273  1026009D       LBNE 0x9314                       
  9277  AD9F6070       JSR [0x6070]                      
  927b  1600B5         LBRA 0x9333                       

; ---- function FUN_927e
FUN_927e:
  927e  7D6168         TST 0x6168                        
  9281  102700AE       LBEQ 0x9333                       
  9285  7D604D         TST 0x604d                        
  9288  2603           BNE 0x928d                        
  928a  1700AD         LBSR 0x933a                       
LAB_928d:
  928d  7D6163         TST 0x6163                        
  9290  1026009F       LBNE 0x9333                       
  9294  86FF           LDA #0xff                         
  9296  B76163         STA 0x6163                        
  9299  C62E           LDB #0x2e                         
  929b  20A3           BRA 0x9240                        

; ---- function FUN_929d
FUN_929d:
  929d  7D6167         TST 0x6167                        
  92a0  1027008F       LBEQ 0x9333                       
  92a4  7D604D         TST 0x604d                        
  92a7  2603           BNE 0x92ac                        
  92a9  17008E         LBSR 0x933a                       
LAB_92ac:
  92ac  1700AA         LBSR 0x9359                       
  92af  108E6580       LDY #0x6580                       
  92b3  3129           LEAY 0x9,Y                        
LAB_92b5:
  92b5  E6A2           LDB ,-Y                           
  92b7  C120           CMPB #0x20                        
  92b9  270A           BEQ 0x92c5                        
  92bb  C12D           CMPB #0x2d                        
  92bd  26F6           BNE 0x92b5                        
  92bf  8620           LDA #0x20                         
LAB_92c1:
  92c1  A7A4           STA ,Y                            
  92c3  209E           BRA 0x9263                        
LAB_92c5:
  92c5  862D           LDA #0x2d                         
  92c7  20F8           BRA 0x92c1                        

; ---- function FUN_92c9
FUN_92c9:
  92c9  7D6164         TST 0x6164                        
  92cc  2765           BEQ 0x9333                        
  92ce  108E6580       LDY #0x6580                       
  92d2  3028           LEAX 0x8,Y                        
  92d4  CC0078         LDD #0x78                         
  92d7  172EAE         LBSR 0xc188                       
  92da  7A6164         DEC 0x6164                        
  92dd  2727           BEQ 0x9306                        
  92df  7F6163         CLR 0x6163                        
  92e2  8E6580         LDX #0x6580                       
  92e5  3440           PSHS  U                           
  92e7  CE0008         LDU #0x8                          
  92ea  C62E           LDB #0x2e                         
  92ec  172EF6         LBSR 0xc1e5                       
  92ef  3540           PULS  U                           
  92f1  2605           BNE 0x92f8                        
  92f3  C6FF           LDB #0xff                         
  92f5  F76163         STB 0x6163                        
LAB_92f8:
  92f8  B66580         LDA 0x6580                        
  92fb  B76162         STA 0x6162                        
  92fe  8620           LDA #0x20                         
  9300  B76580         STA 0x6580                        
  9303  16FF5D         LBRA 0x9263                       
LAB_9306:
  9306  7F604D         CLR 0x604d                        
  9309  FC616A         LDD 0x616a                        
  930c  200C           BRA 0x931a                        

; ---- function FUN_930e
FUN_930e:
  930e  7F604D         CLR 0x604d                        
  9311  7F6164         CLR 0x6164                        
LAB_9314:
  9314  8E609A         LDX #0x609a                       
  9317  170074         LBSR 0x938e                       
LAB_931a:
  931a  FD6074         STD 0x6074                        
  931d  3606           PSHU  B A                         
  931f  8610           LDA #0x10                         
  9321  108E609A       LDY #0x609a                       
  9325  170554         LBSR 0x987c                       
  9328  AD9F6070       JSR [0x6070]                      
  932c  FC6074         LDD 0x6074                        
  932f  AD9F606A       JSR [0x606a]                      
LAB_9333:
  9333  326A           LEAS 0xa,S                        
  9335  176702         LBSR 0xfa3a                       
  9338  35F7           PULS CC A B X Y U PC              

; ---- function FUN_933a
FUN_933a:
  933a  3426           PSHS  Y B A                       
  933c  B66161         LDA 0x6161                        
  933f  B76162         STA 0x6162                        
  9342  86FF           LDA #0xff                         
  9344  B7604D         STA 0x604d                        
  9347  108E6580       LDY #0x6580                       
  934b  172E84         LBSR 0xc1d2                        ; inline[API_FD0C]: $0008 20
  934e  0008           dw 8h                             
  9350  20             db 20h                            
LAB_9351:
  9351  FC6074         LDD 0x6074                        
  9354  FD616A         STD 0x616a                        
  9357  35A6           PULS  A B Y PC                    

; ---- function FUN_9359
FUN_9359:
  9359  3437           PSHS  Y X B A CC                  
  935b  B66162         LDA 0x6162                        
  935e  B76580         STA 0x6580                        
  9361  108E65F8       LDY #0x65f8                       
  9365  3038           LEAX -0x8,Y                       
  9367  C60F           LDB #0xf                          
LAB_9369:
  9369  3404           PSHS  B                           
  936b  CC0008         LDD #0x8                          
  936e  172E17         LBSR 0xc188                       
  9371  3130           LEAY -0x10,Y                      
  9373  3038           LEAX -0x8,Y                       
  9375  3504           PULS  B                           
  9377  5A             DECB                              
  9378  26EF           BNE 0x9369                        
  937a  7C6164         INC 0x6164                        
  937d  860F           LDA #0xf                          
  937f  B16164         CMPA 0x6164                       
  9382  2403           BCC 0x9387                        
  9384  B76164         STA 0x6164                        
LAB_9387:
  9387  8620           LDA #0x20                         
  9389  B76580         STA 0x6580                        
  938c  35B7           PULS CC A B X Y PC                

; ---- function API_FC20
API_FC20:
  938e  3471           PSHS  U Y X CC                    
  9390  327A           LEAS -0x6,S                       
  9392  8E609A         LDX #0x609a                       
  9395  CC0000         LDD #0x0                          
  9398  3606           PSHU  B A                         
  939a  E761           STB 0x1,S                         
  939c  E762           STB 0x2,S                         
  939e  E763           STB 0x3,S                         
  93a0  E764           STB 0x4,S                         
  93a2  E7E4           STB ,S                            
LAB_93a4:
  93a4  E680           LDB ,X+                           
  93a6  C100           CMPB #0x0                         
  93a8  2757           BEQ 0x9401                        
  93aa  C120           CMPB #0x20                        
  93ac  27F6           BEQ 0x93a4                        
  93ae  C12D           CMPB #0x2d                        
  93b0  273E           BEQ 0x93f0                        
  93b2  C12E           CMPB #0x2e                        
  93b4  2740           BEQ 0x93f6                        
  93b6  C130           CMPB #0x30                        
  93b8  1025009E       LBCS 0x945a                       
  93bc  C139           CMPB #0x39                        
  93be  10220098       LBHI 0x945a                       
  93c2  108E000A       LDY #0xa                          
  93c6  3620           PSHU  Y                           
  93c8  172A5B         LBSR 0xbe26                       
  93cb  3720           PULU  Y                           
  93cd  108C0000       CMPY #0x0                         
  93d1  10260085       LBNE 0x945a                       
  93d5  C030           SUBB #0x30                        
  93d7  4F             CLRA                              
  93d8  3606           PSHU  B A                         
  93da  17298A         LBSR 0xbd67                       
  93dd  6DC4           TST ,U                            
  93df  2B79           BMI 0x945a                        
  93e1  6D64           TST 0x4,S                         
  93e3  27BF           BEQ 0x93a4                        
  93e5  6C63           INC 0x3,S                         
  93e7  A663           LDA 0x3,S                         
  93e9  B16099         CMPA 0x6099                       
  93ec  2713           BEQ 0x9401                        
  93ee  20B4           BRA 0x93a4                        
LAB_93f0:
  93f0  86FF           LDA #0xff                         
  93f2  A7E4           STA ,S                            
  93f4  20AE           BRA 0x93a4                        
LAB_93f6:
  93f6  86FF           LDA #0xff                         
  93f8  A764           STA 0x4,S                         
  93fa  7D6099         TST 0x6099                        
  93fd  26A5           BNE 0x93a4                        
  93ff  2000           BRA 0x9401                        
LAB_9401:
  9401  A61F           LDA -0x1,X                        
  9403  2718           BEQ 0x941d                        
  9405  A684           LDA ,X                            
  9407  2714           BEQ 0x941d                        
  9409  8135           CMPA #0x35                        
  940b  2510           BCS 0x941d                        
  940d  8139           CMPA #0x39                        
  940f  220C           BHI 0x941d                        
  9411  CC0001         LDD #0x1                          
  9414  3606           PSHU  B A                         
  9416  17294E         LBSR 0xbd67                       
  9419  6DC4           TST ,U                            
  941b  2B3D           BMI 0x945a                        
LAB_941d:
  941d  A663           LDA 0x3,S                         
  941f  B16099         CMPA 0x6099                       
  9422  271A           BEQ 0x943e                        
  9424  108E000A       LDY #0xa                          
  9428  3620           PSHU  Y                           
  942a  1729F9         LBSR 0xbe26                       
  942d  3720           PULU  Y                           
  942f  108C0000       CMPY #0x0                         
  9433  2625           BNE 0x945a                        
  9435  6DC4           TST ,U                            
  9437  2B21           BMI 0x945a                        
  9439  4C             INCA                              
  943a  A763           STA 0x3,S                         
  943c  20DF           BRA 0x941d                        
LAB_943e:
  943e  6DE4           TST ,S                            
  9440  2703           BEQ 0x9445                        
  9442  172917         LBSR 0xbd5c                       
LAB_9445:
  9445  3720           PULU  Y                           
  9447  FC606E         LDD 0x606e                        
  944a  3606           PSHU  B A                         
  944c  FC606C         LDD 0x606c                        
  944f  3606           PSHU  B A                         
  9451  3620           PSHU  Y                           
  9453  172882         LBSR 0xbcd8                       
  9456  3706           PULU  A B                         
  9458  200C           BRA 0x9466                        
LAB_945a:
  945a  6DE4           TST ,S                            
  945c  2705           BEQ 0x9463                        
  945e  FC606E         LDD 0x606e                        
  9461  2003           BRA 0x9466                        
LAB_9463:
  9463  FC606C         LDD 0x606c                        
LAB_9466:
  9466  3266           LEAS 0x6,S                        
  9468  35F1           PULS CC X Y U PC                  

; ---- function API_FC22
API_FC22:
  946a  3406           PSHS  B A                         
  946c  8608           LDA #0x8                          
  946e  B76170         STA 0x6170                        
  9471  3586           PULS  A B PC                      

; ---- function API_FC24
API_FC24:
  9473  7C616C         INC 0x616c                        
  9476  2603           BNE 0x947b                        
  9478  7A616C         DEC 0x616c                        
LAB_947b:
  947b  F68056         LDB 0x8056                        
  947e  C4C0           ANDB #0xc0                        
  9480  54             LSRB                              
  9481  54             LSRB                              
  9482  FA616E         ORB 0x616e                        
  9485  54             LSRB                              
  9486  54             LSRB                              
  9487  F7616E         STB 0x616e                        
  948a  8E94C2         LDX #0x94c2                       
  948d  A685           LDA B,X                           
  948f  270D           BEQ 0x949e                        
  9491  7D6171         TST 0x6171                        
  9494  2621           BNE 0x94b7                        
  9496  B7616F         STA 0x616f                        
  9499  B76171         STA 0x6171                        
  949c  2019           BRA 0x94b7                        
LAB_949e:
  949e  C40C           ANDB #0xc                         
  94a0  2715           BEQ 0x94b7                        
  94a2  C10C           CMPB #0xc                         
  94a4  2711           BEQ 0x94b7                        
  94a6  F16170         CMPB 0x6170                       
  94a9  2712           BEQ 0x94bd                        
  94ab  B6616F         LDA 0x616f                        
  94ae  F76170         STB 0x6170                        
  94b1  BB616D         ADDA 0x616d                       
  94b4  B7616D         STA 0x616d                        
LAB_94b7:
  94b7  7D6172         TST 0x6172                        
  94ba  2616           BNE 0x94d2                        
  94bc  39             RTS                               
LAB_94bd:
  94bd  7F6171         CLR 0x6171                        
  94c0  20F5           BRA 0x94b7                        
DAT_94c2:
  94c2  00             ?? 00h                            
  94c3  .db 01 FF 00 FF 00 00 01 01 00 00 FF 00 FF 01 00     ; ...............
LAB_94d2:
  94d2  B6616D         LDA 0x616d                        
  94d5  B7605E         STA 0x605e                        
  94d8  B6616C         LDA 0x616c                        
  94db  B76060         STA 0x6060                        
  94de  4F             CLRA                              
  94df  B7616D         STA 0x616d                        
  94e2  B7616C         STA 0x616c                        
  94e5  B76172         STA 0x6172                        
  94e8  39             RTS                               

; ---- function API_FC26
API_FC26:
  94e9  3410           PSHS  X                           
  94eb  86FF           LDA #0xff                         
  94ed  B76172         STA 0x6172                        
  94f0  8E07D0         LDX #0x7d0                        
LAB_94f3:
  94f3  301F           LEAX -0x1,X                       
  94f5  270D           BEQ 0x9504                        
  94f7  7D6172         TST 0x6172                        
  94fa  26F7           BNE 0x94f3                        
  94fc  B6605E         LDA 0x605e                        
  94ff  F66060         LDB 0x6060                        
LAB_9502:
  9502  3590           PULS  X PC                        
LAB_9504:
  9504  CC0000         LDD #0x0                          
  9507  20F9           BRA 0x9502                        

; ---- function API_FC28
API_FC28:
  9509  1707B0         LBSR 0x9cbc                        ; inline[API_FDD6]: $6022
  950c  6022           addr 6022                         
LAB_950e:
  950e  17FFD8         LBSR 0x94e9                       
  9511  17010D         LBSR 0x9621                       
  9514  39             RTS                               

; ---- function FUN_9515
FUN_9515:
  9515  3406           PSHS  B A                         
  9517  F66022         LDB 0x6022                        
  951a  176503         LBSR 0xfa20                       
  951d  F66066         LDB 0x6066                        
  9520  C407           ANDB #0x7                         
  9522  4F             CLRA                              
  9523  172D30         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->9573 1->9579 2->9561 3->9563 4->9573 5->9536 6->9573 7->9573
  9526  9573           addr 9573                         
  9528  9579           addr 9579                         
  952a  9561           addr 9561                         
  952c  9563           addr 9563                         
  952e  9573           addr 9573                         
  9530  9536           addr 9536                         
  9532  9573           addr 9573                         
  9534  9573           addr 9573                         

; ---- function FUN_9536
FUN_9536:
  9536  17FFB0         LBSR 0x94e9                       
  9539  17007C         LBSR 0x95b8                       
  953c  1F89           TFR A,B                           
  953e  5D             TSTB                              
  953f  1D             SEX                               
  9540  2731           BEQ 0x9573                        
  9542  3606           PSHU  B A                         
  9544  FC6062         LDD 0x6062                        
  9547  B3601F         SUBD 0x601f                       
  954a  3606           PSHU  B A                         
  954c  172719         LBSR 0xbc68                       
  954f  FC60DC         LDD 0x60dc                        
  9552  3606           PSHU  B A                         
  9554  172828         LBSR 0xbd7f                       
  9557  CC0001         LDD #0x1                          
  955a  3606           PSHU  B A                         
  955c  172808         LBSR 0xbd67                       
  955f  202B           BRA 0x958c                        

; ---- function thunk_FUN_9579
thunk_FUN_9579:
  9561  2016           BRA 0x9579                        

; ---- function FUN_9563
FUN_9563:
  9563  17FF83         LBSR 0x94e9                       
  9566  17004F         LBSR 0x95b8                       
  9569  1F89           TFR A,B                           
  956b  5D             TSTB                              
  956c  2705           BEQ 0x9573                        
  956e  1D             SEX                               
LAB_956f:
  956f  AD9F605C       JSR [0x605c]                      

; ---- function FUN_9573
FUN_9573:
  9573  1764C4         LBSR 0xfa3a                       
  9576  3506           PULS  A B                         
  9578  39             RTS                               

; ---- function FUN_9579
FUN_9579:
  9579  17FF6D         LBSR 0x94e9                       
  957c  170039         LBSR 0x95b8                       
  957f  1F89           TFR A,B                           
  9581  5D             TSTB                              
  9582  1D             SEX                               
  9583  27EE           BEQ 0x9573                        
  9585  3606           PSHU  B A                         
  9587  FC60DC         LDD 0x60dc                        
  958a  3606           PSHU  B A                         
LAB_958c:
  958c  17288C         LBSR 0xbe1b                       
  958f  3706           PULU  A B                         
  9591  10830000       CMPD #0x0                         
  9595  2B10           BMI 0x95a7                        
  9597  F36062         ADDD 0x6062                       
  959a  2506           BCS 0x95a2                        
  959c  10B36064       CMPD 0x6064                       
  95a0  2311           BLS 0x95b3                        
LAB_95a2:
  95a2  FC6064         LDD 0x6064                        
  95a5  200C           BRA 0x95b3                        
LAB_95a7:
  95a7  F36062         ADDD 0x6062                       
  95aa  10B36062       CMPD 0x6062                       
  95ae  2303           BLS 0x95b3                        
  95b0  CC0000         LDD #0x0                          
LAB_95b3:
  95b3  FD6062         STD 0x6062                        
  95b6  20B7           BRA 0x956f                        

; ---- function FUN_95b8
FUN_95b8:
  95b8  3404           PSHS  B                           
  95ba  4D             TSTA                              
  95bb  2739           BEQ 0x95f6                        
  95bd  3402           PSHS  A                           
  95bf  F66173         LDB 0x6173                        
  95c2  C403           ANDB #0x3                         
  95c4  1D             SEX                               
  95c5  172C8E         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->95F4 1->95D0 2->95DB 3->95E7
  95c8  95F4           addr 95f4                         
  95ca  95D0           addr 95d0                         
  95cc  95DB           addr 95db                         
  95ce  95E7           addr 95e7                         

; ---- function FUN_95d0
FUN_95d0:
  95d0  170025         LBSR 0x95f8                       
  95d3  47             ASRA                              
  95d4  170032         LBSR 0x9609                       
  95d7  3261           LEAS 0x1,S                        
  95d9  201B           BRA 0x95f6                        

; ---- function FUN_95db
FUN_95db:
  95db  17001A         LBSR 0x95f8                       
  95de  47             ASRA                              
  95df  47             ASRA                              
  95e0  170026         LBSR 0x9609                       
  95e3  3261           LEAS 0x1,S                        
  95e5  200F           BRA 0x95f6                        

; ---- function FUN_95e7
FUN_95e7:
  95e7  17000E         LBSR 0x95f8                       
  95ea  47             ASRA                              
  95eb  47             ASRA                              
  95ec  47             ASRA                              
  95ed  170019         LBSR 0x9609                       
  95f0  3261           LEAS 0x1,S                        
  95f2  2002           BRA 0x95f6                        

; ---- function FUN_95f4
FUN_95f4:
  95f4  3502           PULS  A                           
LAB_95f6:
  95f6  3584           PULS  B PC                        

; ---- function FUN_95f8
FUN_95f8:
  95f8  A662           LDA 0x2,S                         
  95fa  BB6174         ADDA 0x6174                       
  95fd  2B05           BMI 0x9604                        
  95ff  7F6176         CLR 0x6176                        
  9602  2004           BRA 0x9608                        
LAB_9604:
  9604  B76176         STA 0x6176                        
  9607  40             NEGA                              
LAB_9608:
  9608  39             RTS                               

; ---- function FUN_9609
FUN_9609:
  9609  4D             TSTA                              
  960a  260B           BNE 0x9617                        
  960c  A662           LDA 0x2,S                         
  960e  BB6174         ADDA 0x6174                       
  9611  B76174         STA 0x6174                        
  9614  4F             CLRA                              
  9615  2009           BRA 0x9620                        
LAB_9617:
  9617  7F6174         CLR 0x6174                        
  961a  7D6176         TST 0x6176                        
  961d  2A01           BPL 0x9620                        
  961f  40             NEGA                              
LAB_9620:
  9620  39             RTS                               

; ---- function FUN_9621
FUN_9621:
  9621  3406           PSHS  B A                         
  9623  F66067         LDB 0x6067                        
  9626  C4F0           ANDB #0xf0                        
  9628  270C           BEQ 0x9636                        
  962a  C5C0           BITB #0xc0                        
  962c  2614           BNE 0x9642                        
  962e  C520           BITB #0x20                        
  9630  260C           BNE 0x963e                        
  9632  C510           BITB #0x10                        
  9634  2604           BNE 0x963a                        
LAB_9636:
  9636  8600           LDA #0x0                          
  9638  200A           BRA 0x9644                        
LAB_963a:
  963a  8601           LDA #0x1                          
  963c  2006           BRA 0x9644                        
LAB_963e:
  963e  8602           LDA #0x2                          
  9640  2002           BRA 0x9644                        
LAB_9642:
  9642  8603           LDA #0x3                          
LAB_9644:
  9644  B76173         STA 0x6173                        
  9647  7F6174         CLR 0x6174                        
  964a  3586           PULS  A B PC                      

; ---- function API_FC90
API_FC90:
  964c  3407           PSHS  B A CC                      
  964e  8603           LDA #0x3                          
  9650  B78300         STA 0x8300                        
  9653  8615           LDA #0x15                         
  9655  B78300         STA 0x8300                        
  9658  B68301         LDA 0x8301                        
  965b  3587           PULS CC A B PC                    

; ---- function API_FC92
API_FC92:
  965d  3403           PSHS  A CC                        
  965f  8695           LDA #0x95                         
  9661  B78300         STA 0x8300                        
  9664  B68301         LDA 0x8301                        
  9667  3583           PULS CC A PC                      

; ---- function API_FC94
API_FC94:
  9669  3403           PSHS  A CC                        
  966b  8615           LDA #0x15                         
  966d  B78300         STA 0x8300                        
  9670  3583           PULS CC A PC                      

; ---- function API_FDD8
API_FDD8:
  9672  3406           PSHS  B A                         
  9674  17FFD5         LBSR 0x964c                       
  9677  CC0000         LDD #0x0                          
  967a  FD6083         STD 0x6083                        
  967d  FD6085         STD 0x6085                        
  9680  7F6081         CLR 0x6081                        
  9683  86FF           LDA #0xff                         
  9685  B76082         STA 0x6082                        
  9688  7F6087         CLR 0x6087                        
  968b  CC9701         LDD #0x9701                       
  968e  175EF3         LBSR 0xf584                        ; inline[API_FE30]: $68A0
  9691  68A0           addr 68a0                         
LAB_9693:
  9693  175F02         LBSR 0xf598                        ; inline[API_FE2E]: $68A0
  9696  68A0           addr 68a0                         
LAB_9698:
  9698  175EFD         LBSR 0xf598                        ; inline[API_FE2E]: $68C0
  969b  68C0           addr 68c0                         
LAB_969d:
  969d  CC85E3         LDD #0x85e3                       
  96a0  FD60F2         STD 0x60f2                        
  96a3  CCFFE8         LDD #0xffe8                       
  96a6  FD608B         STD 0x608b                        
  96a9  C6A0           LDB #0xa0                         
  96ab  176372         LBSR 0xfa20                       
  96ae  F60296         LDB 0x0296                        
  96b1  F76116         STB 0x6116                        
  96b4  F6028F         LDB 0x028f                        
  96b7  F76136         STB 0x6136                        
  96ba  F60297         LDB 0x0297                        
  96bd  F76117         STB 0x6117                        
  96c0  C601           LDB #0x1                          
  96c2  F76177         STB 0x6177                        
  96c5  176372         LBSR 0xfa3a                       
  96c8  3586           PULS  A B PC                      

; ---- function API_FDDA
API_FDDA:
  96ca  3412           PSHS  X A                         
  96cc  7D6082         TST 0x6082                        
  96cf  2625           BNE 0x96f6                        
  96d1  BE6085         LDX 0x6085                        
  96d4  E6897800       LDB 0x7800,X                      
  96d8  3405           PSHS  B CC                        
  96da  1A50           ORCC #0x50                        
  96dc  1F10           TFR X,D                           
  96de  C30001         ADDD #0x1                         
  96e1  8403           ANDA #0x3                         
  96e3  FD6085         STD 0x6085                        
  96e6  10B36083       CMPD 0x6083                       
  96ea  2605           BNE 0x96f1                        
  96ec  86FF           LDA #0xff                         
  96ee  B76082         STA 0x6082                        
LAB_96f1:
  96f1  3505           PULS CC B                         
  96f3  7F6081         CLR 0x6081                        
LAB_96f6:
  96f6  3592           PULS  A X PC                      

; ---- function API_FC96
API_FC96:
  96f8  3402           PSHS  A                           
  96fa  8602           LDA #0x2                          
  96fc  B58300         BITA 0x8300                       
  96ff  3582           PULS  A PC                        

; ---- function API_FC98
API_FC98:
  9701  3406           PSHS  B A                         
  9703  8602           LDA #0x2                          
LAB_9705:
  9705  B58300         BITA 0x8300                       
  9708  27FB           BEQ 0x9705                        
  970a  F78301         STB 0x8301                        
  970d  1A04           ORCC #0x4                         
  970f  3586           PULS  A B PC                      

; ---- function API_FC9A
API_FC9A:
  9711  3406           PSHS  B A                         
LAB_9713:
  9713  E680           LDB ,X+                           
  9715  C1FF           CMPB #0xff                        
  9717  270C           BEQ 0x9725                        
  9719  8602           LDA #0x2                          
LAB_971b:
  971b  B58300         BITA 0x8300                       
  971e  27FB           BEQ 0x971b                        
  9720  F78301         STB 0x8301                        
  9723  20EE           BRA 0x9713                        
LAB_9725:
  9725  3586           PULS  A B PC                      

; ---- function API_FC2A
API_FC2A:
  9727  170026         LBSR 0x9750                       
  972a  3407           PSHS  B A CC                      
  972c  1F98           TFR B,A                           
  972e  FD8062         STD 0x8062                        
  9731  3587           PULS CC A B PC                    

; ---- function API_FC2C
API_FC2C:
  9733  17001A         LBSR 0x9750                       
  9736  3403           PSHS  A CC                        
  9738  FC8062         LDD 0x8062                        
  973b  3583           PULS CC A PC                      

; ---- function API_FC2E
API_FC2E:
  973d  170010         LBSR 0x9750                       

; ---- function FUN_9740
FUN_9740:
  9740  3407           PSHS  B A CC                      
  9742  1F98           TFR B,A                           
  9744  FD8060         STD 0x8060                        
  9747  3587           PULS CC A B PC                    

; ---- function API_FC30
API_FC30:
  9749  3403           PSHS  A CC                        
  974b  FC8060         LDD 0x8060                        
  974e  3583           PULS CC A PC                      

; ---- function API_FC32
API_FC32:
  9750  3416           PSHS  X B A                       
  9752  8E03E8         LDX #0x3e8                        
LAB_9755:
  9755  301F           LEAX -0x1,X                       
  9757  2707           BEQ 0x9760                        
  9759  FC8060         LDD 0x8060                        
  975c  C480           ANDB #0x80                        
  975e  26F5           BNE 0x9755                        
LAB_9760:
  9760  3596           PULS  A B X PC                    

; ---- function API_FC34
API_FC34:
  9762  3407           PSHS  B A CC                      
  9764  CC05DC         LDD #0x5dc                        
  9767  172BD4         LBSR 0xc33e                       
  976a  C638           LDB #0x38                         
  976c  17FFD1         LBSR 0x9740                       
  976f  3404           PSHS  B                           
  9771  CC019A         LDD #0x19a                        
  9774  172BC7         LBSR 0xc33e                       
  9777  E6E4           LDB ,S                            
  9779  17FFC4         LBSR 0x9740                       
  977c  CC000A         LDD #0xa                          
  977f  172BBC         LBSR 0xc33e                       
  9782  3504           PULS  B                           
  9784  17FFB9         LBSR 0x9740                       
  9787  17FFB3         LBSR 0x973d                       
  978a  C60C           LDB #0xc                          
  978c  17FFAE         LBSR 0x973d                       
  978f  C601           LDB #0x1                          
  9791  17FFA9         LBSR 0x973d                       
  9794  C606           LDB #0x6                          
  9796  17FFA4         LBSR 0x973d                       
  9799  3587           PULS CC A B PC                    

; ---- function API_FDB2
API_FDB2:
  979b  3405           PSHS  B CC                        
  979d  F660C1         LDB 0x60c1                        
  97a0  C403           ANDB #0x3                         
  97a2  CA0C           ORB #0xc                          
  97a4  17FF96         LBSR 0x973d                       
  97a7  3585           PULS CC B PC                      

; ---- function API_FDB0
API_FDB0:
  97a9  3405           PSHS  B CC                        
  97ab  C60C           LDB #0xc                          
  97ad  17FF8D         LBSR 0x973d                       
  97b0  3585           PULS CC B PC                      

; ---- function API_FDB8
API_FDB8:
  97b2  F760C0         STB 0x60c0                        
  97b5  8D1C           BSR 0x97d3                        
  97b7  39             RTS                               

; ---- function API_FDB4
API_FDB4:
  97b8  3405           PSHS  B CC                        
  97ba  17FF8C         LBSR 0x9749                       
  97bd  C4FF           ANDB #0xff                        
  97bf  C129           CMPB #0x29                        
  97c1  2302           BLS 0x97c5                        
  97c3  C018           SUBB #0x18                        
LAB_97c5:
  97c5  F760C0         STB 0x60c0                        
  97c8  3585           PULS CC B PC                      

; ---- function API_FDB6
API_FDB6:
  97ca  3405           PSHS  B CC                        
  97cc  F660C0         LDB 0x60c0                        
  97cf  8D02           BSR 0x97d3                        
  97d1  3585           PULS CC B PC                      

;; Kernel API slot $FC36: B = position 0-79 (2 x 40 LCD)

; ---- function LcdSetCursor
LcdSetCursor:
  97d3  3405           PSHS  B CC                        
  97d5  C47F           ANDB #0x7f                        
  97d7  C128           CMPB #0x28                        
  97d9  2D02           BLT 0x97dd                        
  97db  CB18           ADDB #0x18                        
LAB_97dd:
  97dd  CA80           ORB #0x80                         
  97df  17FF5B         LBSR 0x973d                       
  97e2  3585           PULS CC B PC                      

;; Kernel API slot $FC38: inline text with control codes 0-7

; ---- function LcdPrintInline
LcdPrintInline:
  97e4  3437           PSHS  Y X B A CC                  
  97e6  AE67           LDX 0x7,S                         

; ---- function FUN_97e8
FUN_97e8:
  97e8  E680           LDB ,X+                           
  97ea  C5F8           BITB #0xf8                        
  97ec  2705           BEQ 0x97f3                        
  97ee  17FF36         LBSR 0x9727                       
  97f1  20F5           BRA 0x97e8                        
LAB_97f3:
  97f3  4F             CLRA                              
  97f4  C407           ANDB #0x7                         
  97f6  172A5D         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->984F 1->9809 2->9810 3->981B 4->9828 5->9835 6->9817 7->97E8
  97f9  984F           addr 984f                         
  97fb  9809           addr 9809                         
  97fd  9810           addr 9810                         
  97ff  981B           addr 981b                         
  9801  9828           addr 9828                         
  9803  9835           addr 9835                         
  9805  9817           addr 9817                         
  9807  97E8           addr 97e8                         

; ---- function FUN_9809
FUN_9809:
  9809  C601           LDB #0x1                          
  980b  17FF2F         LBSR 0x973d                       
  980e  20D8           BRA 0x97e8                        

; ---- function FUN_9810
FUN_9810:
  9810  E680           LDB ,X+                           
  9812  17FFBE         LBSR 0x97d3                       
  9815  20D1           BRA 0x97e8                        

; ---- function FUN_9817
FUN_9817:
  9817  3706           PULU  A B                         
  9819  2002           BRA 0x981d                        

; ---- function FUN_981b
FUN_981b:
  981b  EC81           LDD ,X++                          
LAB_981d:
  981d  3410           PSHS  X                           
  981f  1F01           TFR D,X                           
  9821  17004B         LBSR 0x986f                       
  9824  3510           PULS  X                           
  9826  20C0           BRA 0x97e8                        

; ---- function FUN_9828
FUN_9828:
  9828  108E60A4       LDY #0x60a4                       
  982c  A680           LDA ,X+                           
  982e  E680           LDB ,X+                           
  9830  170049         LBSR 0x987c                       
  9833  20B3           BRA 0x97e8                        

; ---- function FUN_9835
FUN_9835:
  9835  17FF11         LBSR 0x9749                       
  9838  C47F           ANDB #0x7f                        
  983a  3424           PSHS  Y B                         
  983c  A680           LDA ,X+                           
  983e  C620           LDB #0x20                         
LAB_9840:
  9840  17FEE4         LBSR 0x9727                       
  9843  4A             DECA                              
  9844  26FA           BNE 0x9840                        
  9846  3524           PULS  B Y                         
  9848  CA80           ORB #0x80                         
  984a  17FEF0         LBSR 0x973d                       
  984d  2099           BRA 0x97e8                        

; ---- function FUN_984f
FUN_984f:
  984f  AF67           STX 0x7,S                         
  9851  35B7           PULS CC A B X Y PC                

; ---- function API_FC3A
API_FC3A:
  9853  3407           PSHS  B A CC                      
  9855  1F98           TFR B,A                           
LAB_9857:
  9857  E680           LDB ,X+                           
  9859  17FECB         LBSR 0x9727                       
  985c  4A             DECA                              
  985d  26F8           BNE 0x9857                        
  985f  3587           PULS CC A B PC                    

; ---- function API_FC3C
API_FC3C:
  9861  3407           PSHS  B A CC                      
  9863  1F98           TFR B,A                           
LAB_9865:
  9865  17FECB         LBSR 0x9733                       
  9868  E7A0           STB ,Y+                           
  986a  4A             DECA                              
  986b  26F8           BNE 0x9865                        
  986d  3587           PULS CC A B PC                    

; ---- function API_FC3E
API_FC3E:
  986f  3405           PSHS  B CC                        
LAB_9871:
  9871  E680           LDB ,X+                           
  9873  2705           BEQ 0x987a                        
  9875  17FEAF         LBSR 0x9727                       
  9878  20F7           BRA 0x9871                        
LAB_987a:
  987a  3585           PULS CC B PC                      

; ---- function API_FC40
API_FC40:
  987c  3436           PSHS  Y X B A                     
  987e  327E           LEAS -0x2,S                       
  9880  3402           PSHS  A                           
  9882  C600           LDB #0x0                          
  9884  E729           STB 0x9,Y                         
  9886  8608           LDA #0x8                          
  9888  C620           LDB #0x20                         
LAB_988a:
  988a  E7A6           STB A,Y                           
  988c  4A             DECA                              
  988d  2AFB           BPL 0x988a                        
  988f  E6E4           LDB ,S                            
  9891  54             LSRB                              
  9892  54             LSRB                              
  9893  54             LSRB                              
  9894  54             LSRB                              
  9895  4F             CLRA                              
  9896  1729BD         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->98A6 1->98A1 2->9908 3->994A
  9899  98A6           addr 98a6                         
  989b  98A1           addr 98a1                         
  989d  9908           addr 9908                         
  989f  994A           addr 994a                         

; ---- function FUN_98a1
FUN_98a1:
  98a1  F66099         LDB 0x6099                        
  98a4  E7E4           STB ,S                            

; ---- function FUN_98a6
FUN_98a6:
  98a6  6DE4           TST ,S                            
  98a8  2602           BNE 0x98ac                        
  98aa  3121           LEAY 0x1,Y                        
LAB_98ac:
  98ac  86FF           LDA #0xff                         
  98ae  A761           STA 0x1,S                         
  98b0  3123           LEAY 0x3,Y                        
  98b2  6F62           CLR 0x2,S                         
  98b4  6DC4           TST ,U                            
  98b6  2C05           BGE 0x98bd                        
  98b8  A762           STA 0x2,S                         
  98ba  1723AB         LBSR 0xbc68                       
LAB_98bd:
  98bd  8605           LDA #0x5                          
  98bf  A0E4           SUBA ,S                           
  98c1  30A6           LEAX A,Y                          
  98c3  8D34           BSR 0x98f9                        
  98c5  CC2710         LDD #0x2710                       
  98c8  8D62           BSR 0x992c                        
  98ca  8D2D           BSR 0x98f9                        
  98cc  CC03E8         LDD #0x3e8                        
  98cf  8D5B           BSR 0x992c                        
  98d1  8D26           BSR 0x98f9                        
  98d3  CC0064         LDD #0x64                         
  98d6  8D54           BSR 0x992c                        
  98d8  8D1F           BSR 0x98f9                        
  98da  CC000A         LDD #0xa                          
  98dd  17004C         LBSR 0x992c                       
  98e0  8D17           BSR 0x98f9                        
  98e2  6F61           CLR 0x1,S                         
  98e4  CC0001         LDD #0x1                          
  98e7  8D43           BSR 0x992c                        
  98e9  6D62           TST 0x2,S                         
  98eb  270A           BEQ 0x98f7                        
  98ed  8620           LDA #0x20                         
LAB_98ef:
  98ef  A1A2           CMPA ,-Y                          
  98f1  26FC           BNE 0x98ef                        
  98f3  C62D           LDB #0x2d                         
  98f5  E7A4           STB ,Y                            
LAB_98f7:
  98f7  206F           BRA 0x9968                        

; ---- function FUN_98f9
FUN_98f9:
  98f9  3420           PSHS  Y                           
  98fb  ACE4           CMPX ,S                           
  98fd  2606           BNE 0x9905                        
  98ff  6F65           CLR 0x5,S                         
  9901  C62E           LDB #0x2e                         
  9903  E7A0           STB ,Y+                           
LAB_9905:
  9905  3262           LEAS 0x2,S                        
  9907  39             RTS                               

; ---- function FUN_9908
FUN_9908:
  9908  86FF           LDA #0xff                         
  990a  A761           STA 0x1,S                         
  990c  3124           LEAY 0x4,Y                        
  990e  CC2710         LDD #0x2710                       
  9911  8D19           BSR 0x992c                        
  9913  CC03E8         LDD #0x3e8                        
  9916  8D14           BSR 0x992c                        
  9918  CC0064         LDD #0x64                         
  991b  8D0F           BSR 0x992c                        
  991d  CC000A         LDD #0xa                          
  9920  170009         LBSR 0x992c                       
  9923  CC0001         LDD #0x1                          
  9926  6F61           CLR 0x1,S                         
  9928  8D02           BSR 0x992c                        
  992a  203C           BRA 0x9968                        

; ---- function FUN_992c
FUN_992c:
  992c  3606           PSHU  B A                         
  992e  1724B4         LBSR 0xbde5                       
  9931  3706           PULU  A B                         
  9933  6D63           TST 0x3,S                         
  9935  2605           BNE 0x993c                        
LAB_9937:
  9937  8D37           BSR 0x9970                        
LAB_9939:
  9939  E7A0           STB ,Y+                           
  993b  39             RTS                               
LAB_993c:
  993c  10830000       CMPD #0x0                         
  9940  2704           BEQ 0x9946                        
  9942  6F63           CLR 0x3,S                         
  9944  20F1           BRA 0x9937                        
LAB_9946:
  9946  C620           LDB #0x20                         
  9948  20EF           BRA 0x9939                        

; ---- function FUN_994a
FUN_994a:
  994a  6F61           CLR 0x1,S                         
  994c  3124           LEAY 0x4,Y                        
  994e  CC1000         LDD #0x1000                       
  9951  8DD9           BSR 0x992c                        
  9953  CC0100         LDD #0x100                        
  9956  8DD4           BSR 0x992c                        
  9958  CC0010         LDD #0x10                         
  995b  8DCF           BSR 0x992c                        
  995d  CC0001         LDD #0x1                          
  9960  8DCA           BSR 0x992c                        
  9962  C648           LDB #0x48                         
  9964  E7A4           STB ,Y                            
  9966  2000           BRA 0x9968                        

; ---- function FUN_9968
FUN_9968:
  9968  3342           LEAU 0x2,U                        
  996a  3262           LEAS 0x2,S                        
  996c  3502           PULS  A                           
  996e  35B6           PULS  A B X Y PC                  

; ---- function FUN_9970
FUN_9970:
  9970  C40F           ANDB #0xf                         
  9972  C109           CMPB #0x9                         
  9974  2204           BHI 0x997a                        
  9976  CB30           ADDB #0x30                        
  9978  2002           BRA 0x997c                        
LAB_997a:
  997a  CB37           ADDB #0x37                        
LAB_997c:
  997c  39             RTS                               

; ---- function API_FC42
API_FC42:
  997d  3430           PSHS  Y X                         
  997f  108E609A       LDY #0x609a                       
  9983  17FEF6         LBSR 0x987c                       
  9986  C608           LDB #0x8                          
  9988  8E609A         LDX #0x609a                       
  998b  17FEC5         LBSR 0x9853                       
  998e  35B0           PULS  X Y PC                      

; ---- function API_FDF8
API_FDF8:
  9990  3406           PSHS  B A                         
  9992  327F           LEAS -0x1,S                       
  9994  8608           LDA #0x8                          
  9996  A7E4           STA ,S                            
  9998  1F98           TFR B,A                           
LAB_999a:
  999a  C631           LDB #0x31                         
  999c  4D             TSTA                              
  999d  2D02           BLT 0x99a1                        
  999f  C630           LDB #0x30                         
LAB_99a1:
  99a1  17FD83         LBSR 0x9727                       
  99a4  48             LSLA                              
  99a5  6AE4           DEC ,S                            
  99a7  26F1           BNE 0x999a                        
  99a9  3502           PULS  A                           
  99ab  3586           PULS  A B PC                      

; ---- function API_FC44
API_FC44:
  99ad  3407           PSHS  B A CC                      
  99af  327E           LEAS -0x2,S                       
  99b1  6FE4           CLR ,S                            
  99b3  8664           LDA #0x64                         
  99b5  A761           STA 0x1,S                         
  99b7  170014         LBSR 0x99ce                       
  99ba  860A           LDA #0xa                          
  99bc  A761           STA 0x1,S                         
  99be  17000D         LBSR 0x99ce                       
  99c1  8601           LDA #0x1                          
  99c3  A761           STA 0x1,S                         
  99c5  A7E4           STA ,S                            
  99c7  170004         LBSR 0x99ce                       
  99ca  3262           LEAS 0x2,S                        
  99cc  3587           PULS CC A B PC                    

; ---- function FUN_99ce
FUN_99ce:
  99ce  4F             CLRA                              
LAB_99cf:
  99cf  E163           CMPB 0x3,S                        
  99d1  2505           BCS 0x99d8                        
  99d3  E063           SUBB 0x3,S                        
  99d5  4C             INCA                              
  99d6  20F7           BRA 0x99cf                        
LAB_99d8:
  99d8  1E89           EXG A,B                           
  99da  CB30           ADDB #0x30                        
  99dc  6D62           TST 0x2,S                         
  99de  260A           BNE 0x99ea                        
  99e0  C130           CMPB #0x30                        
  99e2  2604           BNE 0x99e8                        
  99e4  C620           LDB #0x20                         
  99e6  2002           BRA 0x99ea                        
LAB_99e8:
  99e8  E762           STB 0x2,S                         
LAB_99ea:
  99ea  17FD3A         LBSR 0x9727                       
  99ed  1E89           EXG A,B                           
  99ef  39             RTS                               

; ---- function API_FC46
API_FC46:
  99f0  1F98           TFR B,A                           
  99f2  17FF7B         LBSR 0x9970                       
  99f5  3404           PSHS  B                           
  99f7  1F89           TFR A,B                           
  99f9  57             ASRB                              
  99fa  57             ASRB                              
  99fb  57             ASRB                              
  99fc  57             ASRB                              
  99fd  17FF70         LBSR 0x9970                       
  9a00  1F98           TFR B,A                           
  9a02  3584           PULS  B PC                        

;; Kernel API slot $FC48: inline: position byte + 8 chars

; ---- function LcdPrintAt8Inline
LcdPrintAt8Inline:
  9a04  3417           PSHS  X B A CC                    
  9a06  AE65           LDX 0x5,S                         
  9a08  E680           LDB ,X+                           
  9a0a  C008           SUBB #0x8                         
  9a0c  8608           LDA #0x8                          
  9a0e  3D             MUL                               
  9a0f  CA40           ORB #0x40                         
  9a11  17FD29         LBSR 0x973d                       
  9a14  8608           LDA #0x8                          
LAB_9a16:
  9a16  E680           LDB ,X+                           
  9a18  17FD0C         LBSR 0x9727                       
  9a1b  4A             DECA                              
  9a1c  26F8           BNE 0x9a16                        
  9a1e  AF65           STX 0x5,S                         
  9a20  3597           PULS CC A B X PC                  

; ---- function API_FDBA
API_FDBA:
  9a22  3404           PSHS  B                           
  9a24  C620           LDB #0x20                         
  9a26  17FCFE         LBSR 0x9727                       
  9a29  3584           PULS  B PC                        

; ---- function API_FC4A
API_FC4A:
  9a2b  3415           PSHS  X B CC                      
  9a2d  C43F           ANDB #0x3f                        
  9a2f  F78054         STB 0x8054                        
  9a32  108E0283       LDY #0x283                        
  9a36  170D03         LBSR 0xa73c                       
  9a39  3595           PULS CC B X PC                    
  9a3b  .db 4F 66 66 00 4F 6E 20 00                          ; Off.On .
  9a43  44697361626C.. ds "Disabled"                     
  9a4c  456E61626C65.. ds "Enabled "                     

;; Kernel API slot $FC54: $80A7 = 0

; ---- function Io80A7_Clear
Io80A7_Clear:
  9a55  3402           PSHS  A                           
  9a57  8600           LDA #0x0                          
  9a59  B780A7         STA 0x80a7                        
  9a5c  3582           PULS  A PC                        

;; Kernel API slot $FC56: $80A7 = $FF

; ---- function Io80A7_Set
Io80A7_Set:
  9a5e  3402           PSHS  A                           
  9a60  86FF           LDA #0xff                         
  9a62  B780A7         STA 0x80a7                        
  9a65  3582           PULS  A PC                        

; ---- function API_FC58
API_FC58:
  9a67  3407           PSHS  B A CC                      
  9a69  C403           ANDB #0x3                         
  9a6b  4F             CLRA                              
  9a6c  1727E7         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->9A77 1->9A83 2->9A8A 3->9A91
  9a6f  9A77           addr 9a77                         
  9a71  9A83           addr 9a83                         
  9a73  9A8A           addr 9a8a                         
  9a75  9A91           addr 9a91                         

; ---- function FUN_9a77
FUN_9a77:
  9a77  8600           LDA #0x0                          
  9a79  B780A4         STA 0x80a4                        
LAB_9a7c:
  9a7c  8600           LDA #0x0                          
  9a7e  B780A5         STA 0x80a5                        
  9a81  2018           BRA 0x9a9b                        

; ---- function FUN_9a83
FUN_9a83:
  9a83  8600           LDA #0x0                          
  9a85  B780A4         STA 0x80a4                        
  9a88  200C           BRA 0x9a96                        

; ---- function FUN_9a8a
FUN_9a8a:
  9a8a  86FF           LDA #0xff                         
  9a8c  B780A4         STA 0x80a4                        
  9a8f  20EB           BRA 0x9a7c                        

; ---- function FUN_9a91
FUN_9a91:
  9a91  86FF           LDA #0xff                         
  9a93  B780A4         STA 0x80a4                        
LAB_9a96:
  9a96  86FF           LDA #0xff                         
  9a98  B780A5         STA 0x80a5                        
LAB_9a9b:
  9a9b  3587           PULS CC A B PC                    

; ---- function API_FC5A
API_FC5A:
  9a9d  3425           PSHS  Y B CC                      
  9a9f  C6FF           LDB #0xff                         
  9aa1  F780A1         STB 0x80a1                        
  9aa4  108E0282       LDY #0x282                        
  9aa8  170C91         LBSR 0xa73c                       
  9aab  35A5           PULS CC B Y PC                    

; ---- function API_FC5C
API_FC5C:
  9aad  3425           PSHS  Y B CC                      
  9aaf  C600           LDB #0x0                          
  9ab1  F780A1         STB 0x80a1                        
  9ab4  108E0282       LDY #0x282                        
  9ab8  170C81         LBSR 0xa73c                       
  9abb  35A5           PULS CC B Y PC                    

; ---- function API_FC5E
API_FC5E:
  9abd  3415           PSHS  X B CC                      
  9abf  8E0282         LDX #0x282                        
  9ac2  170C40         LBSR 0xa705                       
  9ac5  F780A1         STB 0x80a1                        
  9ac8  3595           PULS CC B X PC                    

; ---- function API_FDBE
API_FDBE:
  9aca  3417           PSHS  X B A CC                    
  9acc  8E0282         LDX #0x282                        
  9acf  170C33         LBSR 0xa705                       
  9ad2  53             COMB                              
  9ad3  1F12           TFR X,Y                           
  9ad5  170C64         LBSR 0xa73c                       
  9ad8  108E2004       LDY #0x2004                       
  9adc  4F             CLRA                              
  9add  175AD1         LBSR 0xf5b1                       
  9ae0  F780A1         STB 0x80a1                        
  9ae3  3597           PULS CC A B X PC                  

; ---- function FUN_9ae5
FUN_9ae5:
  9ae5  3416           PSHS  X B A                       
  9ae7  108E0282       LDY #0x282                        
  9aeb  170C4E         LBSR 0xa73c                       
  9aee  F780A1         STB 0x80a1                        
  9af1  3596           PULS  A B X PC                    

; ---- function FUN_9af3
FUN_9af3:
  9af3  3430           PSHS  Y X                         
  9af5  AE64           LDX 0x4,S                         
  9af7  10AE81         LDY ,X++                          
  9afa  3620           PSHU  Y                           
  9afc  10AE81         LDY ,X++                          
  9aff  3620           PSHU  Y                           
  9b01  3606           PSHU  B A                         
  9b03  1721D2         LBSR 0xbcd8                       
  9b06  3706           PULU  A B                         
  9b08  AF64           STX 0x4,S                         
  9b0a  35B0           PULS  X Y PC                      

;; Kernel API slot $FC60: inline word: $600D = return address - word (position-independent modules)

; ---- function ModuleSetBase
ModuleSetBase:
  9b0c  3417           PSHS  X B A CC                    
  9b0e  AE65           LDX 0x5,S                         
  9b10  1F10           TFR X,D                           
  9b12  A381           SUBD ,X++                         
  9b14  FD600D         STD 0x600d                        
  9b17  AF65           STX 0x5,S                         
  9b19  3597           PULS CC A B X PC                  

;; Kernel API slot $FC62: inline ptr: [ptr] = D + module base

; ---- function ModuleStorePtr
ModuleStorePtr:
  9b1b  3437           PSHS  Y X B A CC                  
  9b1d  AE67           LDX 0x7,S                         
  9b1f  10AE81         LDY ,X++                          
  9b22  F3600D         ADDD 0x600d                       
  9b25  EDA4           STD ,Y                            
  9b27  AF67           STX 0x7,S                         
  9b29  35B7           PULS CC A B X Y PC                

; ---- function API_FDAA
API_FDAA:
  9b2b  3436           PSHS  Y X B A                     
  9b2d  58             LSLB                              
  9b2e  58             LSLB                              
  9b2f  58             LSLB                              
  9b30  58             LSLB                              
  9b31  F780E4         STB 0x80e4                        
  9b34  35B6           PULS  A B X Y PC                  

; ---- function API_FDC0
API_FDC0:
  9b36  3416           PSHS  X B A                       
  9b38  17001C         LBSR 0x9b57                       
  9b3b  17280F         LBSR 0xc34d                        ; inline[API_FD8E]: $6178
  9b3e  6178           addr 6178                         
LAB_9b40:
  9b40  FD60BB         STD 0x60bb                        
  9b43  7F60BA         CLR 0x60ba                        
  9b46  170173         LBSR 0x9cbc                        ; inline[API_FDD6]: $6023
  9b49  6023           addr 6023                         
LAB_9b4b:
  9b4b  170012         LBSR 0x9b60                       
  9b4e  2705           BEQ 0x9b55                        
  9b50  170099         LBSR 0x9bec                       
  9b53  20F6           BRA 0x9b4b                        
LAB_9b55:
  9b55  3596           PULS  A B X PC                    

; ---- function FUN_9b57
FUN_9b57:
  9b57  3405           PSHS  B CC                        
  9b59  C6FF           LDB #0xff                         
  9b5b  F760FB         STB 0x60fb                        
  9b5e  3585           PULS CC B PC                      

; ---- function API_FDC2
API_FDC2:
  9b60  3436           PSHS  Y X B A                     
  9b62  327D           LEAS -0x3,S                       
  9b64  6F61           CLR 0x1,S                         
LAB_9b66:
  9b66  1710AF         LBSR 0xac18                       
  9b69  F66023         LDB 0x6023                        
  9b6c  175EB1         LBSR 0xfa20                       
  9b6f  86FF           LDA #0xff                         
  9b71  A761           STA 0x1,S                         
  9b73  BE60BB         LDX 0x60bb                        
  9b76  B660BA         LDA 0x60ba                        
  9b79  3086           LEAX A,X                          
  9b7b  1F10           TFR X,D                           
  9b7d  E384           ADDD ,X                           
  9b7f  10AE81         LDY ,X++                          
  9b82  108C0000       CMPY #0x0                         
  9b86  270A           BEQ 0x9b92                        
  9b88  6F61           CLR 0x1,S                         
  9b8a  6D62           TST 0x2,S                         
  9b8c  2604           BNE 0x9b92                        
  9b8e  1F02           TFR D,Y                           
  9b90  ADA4           JSR ,Y                            
LAB_9b92:
  9b92  7F60B9         CLR 0x60b9                        
LAB_9b95:
  9b95  1F10           TFR X,D                           
  9b97  E384           ADDD ,X                           
  9b99  10AE81         LDY ,X++                          
  9b9c  108C0000       CMPY #0x0                         
  9ba0  2709           BEQ 0x9bab                        
  9ba2  6F61           CLR 0x1,S                         
  9ba4  1F02           TFR D,Y                           
  9ba6  F660B9         LDB 0x60b9                        
  9ba9  ADA4           JSR ,Y                            
LAB_9bab:
  9bab  7C60B9         INC 0x60b9                        
  9bae  8604           LDA #0x4                          
  9bb0  B160B9         CMPA 0x60b9                       
  9bb3  26E0           BNE 0x9b95                        
  9bb5  175E82         LBSR 0xfa3a                       
  9bb8  A6E4           LDA ,S                            
  9bba  3263           LEAS 0x3,S                        
  9bbc  35B6           PULS  A B X Y PC                  

; ---- function FUN_9bbe
FUN_9bbe:
  9bbe  3436           PSHS  Y X B A                     
  9bc0  327D           LEAS -0x3,S                       
  9bc2  86FF           LDA #0xff                         
  9bc4  A761           STA 0x1,S                         
  9bc6  209E           BRA 0x9b66                        

; ---- function API_FDC4
API_FDC4:
  9bc8  3436           PSHS  Y X B A                     
  9bca  17FF8A         LBSR 0x9b57                       
LAB_9bcd:
  9bcd  BE60BB         LDX 0x60bb                        
  9bd0  B660BA         LDA 0x60ba                        
  9bd3  260B           BNE 0x9be0                        
LAB_9bd5:
  9bd5  8B0A           ADDA #0xa                         
  9bd7  10AE86         LDY A,X                           
  9bda  108CFFFF       CMPY #0xffff                      
  9bde  26F5           BNE 0x9bd5                        
LAB_9be0:
  9be0  800A           SUBA #0xa                         
  9be2  B760BA         STA 0x60ba                        
  9be5  17FF78         LBSR 0x9b60                       
  9be8  26E3           BNE 0x9bcd                        
  9bea  35B6           PULS  A B X Y PC                  

; ---- function API_FDC6
API_FDC6:
  9bec  3436           PSHS  Y X B A                     
  9bee  17FF66         LBSR 0x9b57                       
LAB_9bf1:
  9bf1  BE60BB         LDX 0x60bb                        
  9bf4  B660BA         LDA 0x60ba                        
  9bf7  8B0A           ADDA #0xa                         
  9bf9  10AE86         LDY A,X                           
  9bfc  108CFFFF       CMPY #0xffff                      
  9c00  2601           BNE 0x9c03                        
  9c02  4F             CLRA                              
LAB_9c03:
  9c03  B760BA         STA 0x60ba                        
  9c06  17FF57         LBSR 0x9b60                       
  9c09  26E6           BNE 0x9bf1                        
  9c0b  35B6           PULS  A B X Y PC                  

; ---- function API_FDC8
API_FDC8:
  9c0d  3416           PSHS  X B A                       
  9c0f  17FF45         LBSR 0x9b57                       
  9c12  17005F         LBSR 0x9c74                       
  9c15  ECE4           LDD ,S                            
  9c17  FD60BB         STD 0x60bb                        
  9c1a  7F60BA         CLR 0x60ba                        
  9c1d  17009C         LBSR 0x9cbc                        ; inline[API_FDD6]: $6023
  9c20  6023           addr 6023                         
LAB_9c22:
  9c22  17FF3B         LBSR 0x9b60                       
  9c25  2705           BEQ 0x9c2c                        
  9c27  17FFC2         LBSR 0x9bec                       
  9c2a  20F6           BRA 0x9c22                        
LAB_9c2c:
  9c2c  3596           PULS  A B X PC                    

; ---- function API_FDCA
API_FDCA:
  9c2e  3416           PSHS  X B A                       
  9c30  17FF24         LBSR 0x9b57                       
  9c33  170062         LBSR 0x9c98                       
LAB_9c36:
  9c36  17FF27         LBSR 0x9b60                       
  9c39  2705           BEQ 0x9c40                        
  9c3b  17FFAE         LBSR 0x9bec                       
  9c3e  20F6           BRA 0x9c36                        
LAB_9c40:
  9c40  3596           PULS  A B X PC                    

; ---- function API_FE34
API_FE34:
  9c42  3416           PSHS  X B A                       
  9c44  20F0           BRA 0x9c36                        

; ---- function API_FDA6
API_FDA6:
  9c46  3436           PSHS  Y X B A                     
  9c48  327C           LEAS -0x4,S                       
  9c4a  1F10           TFR X,D                           
  9c4c  10AFE4         STY ,S                            
  9c4f  A3E4           SUBD ,S                           
  9c51  EDE4           STD ,S                            
LAB_9c53:
  9c53  EC81           LDD ,X++                          
  9c55  10830000       CMPD #0x0                         
  9c59  270C           BEQ 0x9c67                        
  9c5b  1083FFFF       CMPD #0xffff                      
  9c5f  2706           BEQ 0x9c67                        
  9c61  E3E4           ADDD ,S                           
  9c63  EDA1           STD ,Y++                          
  9c65  20EC           BRA 0x9c53                        
LAB_9c67:
  9c67  EDA1           STD ,Y++                          
  9c69  1083FFFF       CMPD #0xffff                      
  9c6d  26E4           BNE 0x9c53                        
  9c6f  3264           LEAS 0x4,S                        
  9c71  35B6           PULS  A B X Y PC                  

; ---- function API_FDCC
API_FDCC:
  9c73  39             RTS                               

; ---- function FUN_9c74
FUN_9c74:
  9c74  3404           PSHS  B                           
  9c76  F660BB         LDB 0x60bb                        
  9c79  1726E0         LBSR 0xc35c                        ; inline[API_FD90]: $6178
  9c7c  6178           addr 6178                         
LAB_9c7e:
  9c7e  F660BC         LDB 0x60bc                        
  9c81  1726D8         LBSR 0xc35c                        ; inline[API_FD90]: $6178
  9c84  6178           addr 6178                         
LAB_9c86:
  9c86  F660BA         LDB 0x60ba                        
  9c89  1726D0         LBSR 0xc35c                        ; inline[API_FD90]: $6178
  9c8c  6178           addr 6178                         
LAB_9c8e:
  9c8e  F66023         LDB 0x6023                        
  9c91  1726C8         LBSR 0xc35c                        ; inline[API_FD90]: $6178
  9c94  6178           addr 6178                         
LAB_9c96:
  9c96  3584           PULS  B PC                        

; ---- function FUN_9c98
FUN_9c98:
  9c98  3404           PSHS  B                           
  9c9a  1726D0         LBSR 0xc36d                        ; inline[API_FD92]: $6178
  9c9d  6178           addr 6178                         
LAB_9c9f:
  9c9f  F76023         STB 0x6023                        
  9ca2  1726C8         LBSR 0xc36d                        ; inline[API_FD92]: $6178
  9ca5  6178           addr 6178                         
LAB_9ca7:
  9ca7  F760BA         STB 0x60ba                        
  9caa  1726C0         LBSR 0xc36d                        ; inline[API_FD92]: $6178
  9cad  6178           addr 6178                         
LAB_9caf:
  9caf  F760BC         STB 0x60bc                        
  9cb2  1726B8         LBSR 0xc36d                        ; inline[API_FD92]: $6178
  9cb5  6178           addr 6178                         
LAB_9cb7:
  9cb7  F760BB         STB 0x60bb                        
  9cba  3584           PULS  B PC                        

; ---- function API_FDD6
API_FDD6:
  9cbc  3436           PSHS  Y X B A                     
  9cbe  AE66           LDX 0x6,S                         
  9cc0  10AE81         LDY ,X++                          
  9cc3  AF66           STX 0x6,S                         
  9cc5  F6600B         LDB 0x600b                        
  9cc8  E7A4           STB ,Y                            
  9cca  35B6           PULS  A B X Y PC                  

; ---- function FUN_9ccc
FUN_9ccc:
  9ccc  3436           PSHS  Y X B A                     
  9cce  AE66           LDX 0x6,S                         
  9cd0  1F10           TFR X,D                           
  9cd2  E381           ADDD ,X++                         
  9cd4  10AE81         LDY ,X++                          
  9cd7  EDA4           STD ,Y                            
  9cd9  AF66           STX 0x6,S                         
  9cdb  35B6           PULS  A B X Y PC                  

; ---- function FUN_9cdd
FUN_9cdd:
  9cdd  3430           PSHS  Y X                         
  9cdf  AE64           LDX 0x4,S                         
  9ce1  1F10           TFR X,D                           
  9ce3  E381           ADDD ,X++                         
  9ce5  AF64           STX 0x4,S                         
  9ce7  35B0           PULS  X Y PC                      

; ---- function FUN_9ce9
FUN_9ce9:
  9ce9  327E           LEAS -0x2,S                       
  9ceb  3436           PSHS  Y X B A                     
  9ced  3710           PULU  X                           
  9cef  CC0000         LDD #0x0                          
  9cf2  10A384         CMPD ,X                           
  9cf5  270D           BEQ 0x9d04                        
  9cf7  1F10           TFR X,D                           
  9cf9  E384           ADDD ,X                           
  9cfb  ED66           STD 0x6,S                         
  9cfd  3536           PULS  A B X Y                     
  9cff  ADF4           JSR [,S]                          
  9d01  3262           LEAS 0x2,S                        
  9d03  39             RTS                               
LAB_9d04:
  9d04  3536           PULS  A B X Y                     
  9d06  3262           LEAS 0x2,S                        
  9d08  39             RTS                               

; ---- function API_FE5C
API_FE5C:
  9d09  3430           PSHS  Y X                         
  9d0b  AE64           LDX 0x4,S                         
  9d0d  17005B         LBSR 0x9d6b                       
  9d10  7D60E2         TST 0x60e2                        
  9d13  200A           BRA 0x9d1f                        

; ---- function API_FE5A
API_FE5A:
  9d15  3430           PSHS  Y X                         
  9d17  AE64           LDX 0x4,S                         
  9d19  17004F         LBSR 0x9d6b                       
  9d1c  10A3E4         CMPD ,S                           
LAB_9d1f:
  9d1f  2C04           BGE 0x9d25                        
  9d21  8D28           BSR 0x9d4b                        
  9d23  2002           BRA 0x9d27                        
LAB_9d25:
  9d25  8D06           BSR 0x9d2d                        
LAB_9d27:
  9d27  3004           LEAX 0x4,X                        
  9d29  AF64           STX 0x4,S                         
  9d2b  35B0           PULS  X Y PC                      

; ---- function FUN_9d2d
FUN_9d2d:
  9d2d  3406           PSHS  B A                         
  9d2f  ADA4           JSR ,Y                            
  9d31  2715           BEQ 0x9d48                        
  9d33  10A384         CMPD ,X                           
  9d36  270C           BEQ 0x9d44                        
LAB_9d38:
  9d38  C30001         ADDD #0x1                         
  9d3b  ADA4           JSR ,Y                            
  9d3d  2709           BEQ 0x9d48                        
  9d3f  10A384         CMPD ,X                           
  9d42  25F4           BCS 0x9d38                        
LAB_9d44:
  9d44  ECE4           LDD ,S                            
  9d46  8D03           BSR 0x9d4b                        
LAB_9d48:
  9d48  3262           LEAS 0x2,S                        
  9d4a  39             RTS                               

; ---- function FUN_9d4b
FUN_9d4b:
  9d4b  3406           PSHS  B A                         
  9d4d  ADA4           JSR ,Y                            
  9d4f  2717           BEQ 0x9d68                        
  9d51  10830000       CMPD #0x0                         
  9d55  270D           BEQ 0x9d64                        
LAB_9d57:
  9d57  C3FFFF         ADDD #0xffff                      
  9d5a  ADA4           JSR ,Y                            
  9d5c  270A           BEQ 0x9d68                        
  9d5e  10830000       CMPD #0x0                         
  9d62  26F3           BNE 0x9d57                        
LAB_9d64:
  9d64  ECE4           LDD ,S                            
  9d66  8DC5           BSR 0x9d2d                        
LAB_9d68:
  9d68  3262           LEAS 0x2,S                        
  9d6a  39             RTS                               

; ---- function FUN_9d6b
FUN_9d6b:
  9d6b  3416           PSHS  X B A                       
  9d6d  1F10           TFR X,D                           
  9d6f  C30002         ADDD #0x2                         
  9d72  E302           ADDD 0x2,X                        
  9d74  1F02           TFR D,Y                           
  9d76  3596           PULS  A B X PC                    

; ---- function API_FC64
API_FC64:
  9d78  3437           PSHS  Y X B A CC                  
  9d7a  108E6A00       LDY #0x6a00                       
  9d7e  172451         LBSR 0xc1d2                        ; inline[API_FD0C]: $0080 FF
  9d81  0080           dw 80h                            
  9d83  FF             db FFh                            
LAB_9d84:
  9d84  C6FF           LDB #0xff                         
  9d86  F7618A         STB 0x618a                        
  9d89  17EB4A         LBSR 0x88d6                       
LAB_9d8c:
  9d8c  2615           BNE 0x9da3                        
  9d8e  17003C         LBSR 0x9dcd                       
  9d91  260B           BNE 0x9d9e                        
  9d93  1F01           TFR D,X                           
  9d95  5F             CLRB                              
  9d96  172618         LBSR 0xc3b1                       
  9d99  6A00           DEC 0x0,X                         
  9d9b  7F618A         CLR 0x618a                        
LAB_9d9e:
  9d9e  17EB99         LBSR 0x893a                       
  9da1  20E9           BRA 0x9d8c                        
LAB_9da3:
  9da3  8E03E8         LDX #0x3e8                        
  9da6  108E0000       LDY #0x0                          
LAB_9daa:
  9daa  301F           LEAX -0x1,X                       
  9dac  172638         LBSR 0xc3e7                       
  9daf  6A00           DEC 0x0,X                         
  9db1  2602           BNE 0x9db5                        
  9db3  3121           LEAY 0x1,Y                        
LAB_9db5:
  9db5  8C0000         CMPX #0x0                         
  9db8  26F0           BNE 0x9daa                        
  9dba  10BF6188       STY 0x6188                        
  9dbe  35B7           PULS CC A B X Y PC                

; ---- function FUN_9dc0
FUN_9dc0:
  9dc0  3436           PSHS  Y X B A                     
  9dc2  8403           ANDA #0x3                         
  9dc4  1F01           TFR D,X                           
  9dc6  17261E         LBSR 0xc3e7                       
  9dc9  6A00           DEC 0x0,X                         
  9dcb  35B6           PULS  A B X Y PC                  

; ---- function FUN_9dcd
FUN_9dcd:
  9dcd  81C8           CMPA #0xc8                        
  9dcf  2518           BCS 0x9de9                        
  9dd1  C1C8           CMPB #0xc8                        
  9dd3  241C           BCC 0x9df1                        
  9dd5  81CC           CMPA #0xcc                        
  9dd7  2418           BCC 0x9df1                        
  9dd9  3404           PSHS  B                           
  9ddb  8403           ANDA #0x3                         
  9ddd  C6C8           LDB #0xc8                         
  9ddf  3D             MUL                               
  9de0  C300C8         ADDD #0xc8                        
  9de3  EBE0           ADDB ,S+                          
  9de5  8900           ADCA #0x0                         
  9de7  2005           BRA 0x9dee                        
LAB_9de9:
  9de9  5D             TSTB                              
  9dea  2605           BNE 0x9df1                        
  9dec  1E89           EXG A,B                           
LAB_9dee:
  9dee  1A04           ORCC #0x4                         
  9df0  39             RTS                               
LAB_9df1:
  9df1  CCFFFF         LDD #0xffff                       
  9df4  39             RTS                               

; ---- function FUN_9df5
FUN_9df5:
  9df5  108300C8       CMPD #0xc8                        
  9df9  252E           BCS 0x9e29                        
  9dfb  8300C8         SUBD #0xc8                        
  9dfe  108300C8       CMPD #0xc8                        
  9e02  2521           BCS 0x9e25                        
  9e04  8300C8         SUBD #0xc8                        
  9e07  108300C8       CMPD #0xc8                        
  9e0b  2514           BCS 0x9e21                        
  9e0d  8300C8         SUBD #0xc8                        
  9e10  108300C8       CMPD #0xc8                        
  9e14  2507           BCS 0x9e1d                        
  9e16  8300C8         SUBD #0xc8                        
  9e19  86CB           LDA #0xcb                         
  9e1b  200E           BRA 0x9e2b                        
LAB_9e1d:
  9e1d  86CA           LDA #0xca                         
  9e1f  200A           BRA 0x9e2b                        
LAB_9e21:
  9e21  86C9           LDA #0xc9                         
  9e23  2006           BRA 0x9e2b                        
LAB_9e25:
  9e25  86C8           LDA #0xc8                         
  9e27  2002           BRA 0x9e2b                        
LAB_9e29:
  9e29  1E89           EXG A,B                           
LAB_9e2b:
  9e2b  39             RTS                               

; ---- function API_FC66
API_FC66:
  9e2c  3476           PSHS  U Y X B A                   
  9e2e  F66079         LDB 0x6079                        
  9e31  175BEC         LBSR 0xfa20                       
  9e34  EC61           LDD 0x1,S                         
  9e36  1A40           ORCC #0x40                        
  9e38  BE607A         LDX 0x607a                        
  9e3b  E6890005       LDB 0x5,X                         
  9e3f  C502           BITB #0x2                         
  9e41  262C           BNE 0x9e6f                        
  9e43  BE607A         LDX 0x607a                        
  9e46  108E0000       LDY #0x0                          
  9e4a  FC607D         LDD 0x607d                        
  9e4d  170982         LBSR 0xa7d2                       
  9e50  8E0005         LDX #0x5                          
  9e53  1708AF         LBSR 0xa705                       
  9e56  C501           BITB #0x1                         
  9e58  2608           BNE 0x9e62                        
  9e5a  8E0000         LDX #0x0                          
  9e5d  1708BB         LBSR 0xa71b                       
  9e60  2003           BRA 0x9e65                        
LAB_9e62:
  9e62  CCFFFF         LDD #0xffff                       
LAB_9e65:
  9e65  108E001D       LDY #0x1d                         
  9e69  1708E6         LBSR 0xa752                       
  9e6c  160093         LBRA 0x9f02                       
LAB_9e6f:
  9e6f  1700A0         LBSR 0x9f12                       
  9e72  10260094       LBNE 0x9f0a                       
  9e76  FC0008         LDD 0x0008                        
  9e79  108E0000       LDY #0x0                          
  9e7d  BE618F         LDX 0x618f                        
  9e80  CC0008         LDD #0x8                          
  9e83  172302         LBSR 0xc188                       
  9e86  3002           LEAX 0x2,X                        
  9e88  BF618F         STX 0x618f                        
  9e8b  CC0000         LDD #0x0                          
  9e8e  FD618D         STD 0x618d                        
  9e91  17FE49         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$9EC6(rel)
  9e94  0032           dw 32h                            
LAB_9e96:
  9e96  3606           PSHU  B A                         
  9e98  17FE42         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$9EEE(rel)
  9e9b  0053           dw 53h                            
LAB_9e9d:
  9e9d  3606           PSHU  B A                         
  9e9f  17FE3B         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$9ED9(rel)
  9ea2  0037           dw 37h                            
LAB_9ea4:
  9ea4  3606           PSHU  B A                         
  9ea6  175CE2         LBSR 0xfb8b                       
  9ea9  FC618D         LDD 0x618d                        
  9eac  C30008         ADDD #0x8                         
  9eaf  FD0002         STD 0x0002                        
  9eb2  F60005         LDB 0x0005                        
  9eb5  C4FD           ANDB #0xfd                        
  9eb7  F70005         STB 0x0005                        
  9eba  FC6137         LDD 0x6137                        
  9ebd  108E001D       LDY #0x1d                         
  9ec1  17088E         LBSR 0xa752                       
  9ec4  203C           BRA 0x9f02                        

; ---- function FUN_9ec6
FUN_9ec6:
  9ec6  3436           PSHS  Y X B A                     
  9ec8  3008           LEAX 0x8,X                        
  9eca  E784           STB ,X                            
  9ecc  FC618D         LDD 0x618d                        
  9ecf  C30001         ADDD #0x1                         
  9ed2  FD618D         STD 0x618d                        
  9ed5  1A04           ORCC #0x4                         
  9ed7  35B6           PULS  A B X Y PC                  

; ---- function FUN_9ed9
FUN_9ed9:
  9ed9  3432           PSHS  Y X A                       
  9edb  10BC6192       CMPY 0x6192                       
  9edf  2709           BEQ 0x9eea                        
  9ee1  FC618F         LDD 0x618f                        
  9ee4  E6AB           LDB D,Y                           
  9ee6  1A04           ORCC #0x4                         
  9ee8  2002           BRA 0x9eec                        
LAB_9eea:
  9eea  1CFB           ANDCC #0xfb                       
LAB_9eec:
  9eec  35B2           PULS  A X Y PC                    

; ---- function FUN_9eee
FUN_9eee:
  9eee  3432           PSHS  Y X A                       
  9ef0  F66196         LDB 0x6196                        
  9ef3  175B2A         LBSR 0xfa20                       
  9ef6  FC6194         LDD 0x6194                        
  9ef9  E68B           LDB D,X                           
  9efb  175B3C         LBSR 0xfa3a                       
  9efe  1A04           ORCC #0x4                         
  9f00  35B2           PULS  A X Y PC                    

; ---- function FUN_9f02
FUN_9f02:
  9f02  175B35         LBSR 0xfa3a                       
  9f05  3576           PULS  A B X Y U                   
  9f07  1A04           ORCC #0x4                         
  9f09  39             RTS                               
LAB_9f0a:
  9f0a  175B2D         LBSR 0xfa3a                       
  9f0d  3576           PULS  A B X Y U                   
  9f0f  1CFB           ANDCC #0xfb                       
  9f11  39             RTS                               

; ---- function FUN_9f12
FUN_9f12:
  9f12  3436           PSHS  Y X B A                     
  9f14  F66079         LDB 0x6079                        
  9f17  F76191         STB 0x6191                        
  9f1a  FC607D         LDD 0x607d                        
  9f1d  83000A         SUBD #0xa                         
  9f20  FD6192         STD 0x6192                        
  9f23  BE607A         LDX 0x607a                        
  9f26  BF618F         STX 0x618f                        
  9f29  EC890008       LDD 0x8,X                         
  9f2d  FD6137         STD 0x6137                        
  9f30  17EAD5         LBSR 0x8a08                       
  9f33  260F           BNE 0x9f44                        
  9f35  3128           LEAY 0x8,Y                        
  9f37  10BF6194       STY 0x6194                        
  9f3b  3138           LEAY -0x8,Y                       
  9f3d  F76196         STB 0x6196                        
  9f40  1A04           ORCC #0x4                         
  9f42  2002           BRA 0x9f46                        
LAB_9f44:
  9f44  1CFB           ANDCC #0xfb                       
LAB_9f46:
  9f46  35B6           PULS  A B X Y PC                  

; ---- function FUN_9f48
FUN_9f48:
  9f48  3436           PSHS  Y X B A                     
  9f4a  C6A0           LDB #0xa0                         
  9f4c  175AD1         LBSR 0xfa20                       
  9f4f  F60005         LDB 0x0005                        
  9f52  CA01           ORB #0x1                          
  9f54  F70005         STB 0x0005                        
  9f57  1700FB         LBSR 0xa055                       
  9f5a  3406           PSHS  B A                         
  9f5c  FC0002         LDD 0x0002                        
  9f5f  10A3E1         CMPD ,S++                         
  9f62  2546           BCS 0x9faa                        
  9f64  17EC2C         LBSR 0x8b93                       
  9f67  8E0000         LDX #0x0                          
  9f6a  CC0005         LDD #0x5                          
  9f6d  17EC59         LBSR 0x8bc9                       
  9f70  E684           LDB ,X                            
  9f72  CA02           ORB #0x2                          
  9f74  17EC31         LBSR 0x8ba8                       
  9f77  3001           LEAX 0x1,X                        
  9f79  CC0002         LDD #0x2                          
  9f7c  17EC4A         LBSR 0x8bc9                       
  9f7f  8E001D         LDX #0x1d                         
  9f82  CC0002         LDD #0x2                          
  9f85  17EC41         LBSR 0x8bc9                       
  9f88  17FD52         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A0CB(rel)
  9f8b  0140           dw 140h                           
LAB_9f8d:
  9f8d  3606           PSHU  B A                         
  9f8f  17FD4B         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A0B9(rel)
  9f92  0127           dw 127h                           
LAB_9f94:
  9f94  3606           PSHU  B A                         
  9f96  FC0002         LDD 0x0002                        
  9f99  830008         SUBD #0x8                         
  9f9c  3606           PSHU  B A                         
  9f9e  17FD3C         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$9FC1(rel)
  9fa1  0020           dw 20h                            
LAB_9fa3:
  9fa3  3606           PSHU  B A                         
  9fa5  175B66         LBSR 0xfb0e                       
  9fa8  200C           BRA 0x9fb6                        
LAB_9faa:
  9faa  17EBE6         LBSR 0x8b93                       
  9fad  8E0000         LDX #0x0                          
  9fb0  FC0002         LDD 0x0002                        
  9fb3  17EC13         LBSR 0x8bc9                       
LAB_9fb6:
  9fb6  17EC1E         LBSR 0x8bd7                       
  9fb9  17FDBC         LBSR 0x9d78                       
  9fbc  175A7B         LBSR 0xfa3a                       
  9fbf  35B6           PULS  A B X Y PC                  

; ---- function FUN_9fc1
FUN_9fc1:
  9fc1  3476           PSHS  U Y X B A                   
  9fc3  17EBE2         LBSR 0x8ba8                       
  9fc6  35F6           PULS  A B X Y U PC                

; ---- function FUN_9fc8
FUN_9fc8:
  9fc8  3436           PSHS  Y X B A                     
  9fca  8D0B           BSR 0x9fd7                        
  9fcc  FD6197         STD 0x6197                        
  9fcf  17001D         LBSR 0x9fef                       
  9fd2  FD6199         STD 0x6199                        
  9fd5  35B6           PULS  A B X Y PC                  

; ---- function FUN_9fd7
FUN_9fd7:
  9fd7  3430           PSHS  Y X                         
  9fd9  170079         LBSR 0xa055                       
  9fdc  3406           PSHS  B A                         
  9fde  8E0002         LDX #0x2                          
  9fe1  170737         LBSR 0xa71b                       
  9fe4  10A3E4         CMPD ,S                           
  9fe7  2502           BCS 0x9feb                        
  9fe9  ECE4           LDD ,S                            
LAB_9feb:
  9feb  3262           LEAS 0x2,S                        
  9fed  35B0           PULS  X Y PC                      

; ---- function FUN_9fef
FUN_9fef:
  9fef  3430           PSHS  Y X                         
  9ff1  8E0000         LDX #0x0                          
  9ff4  170724         LBSR 0xa71b                       
  9ff7  17EA0E         LBSR 0x8a08                       
  9ffa  262A           BNE 0xa026                        
  9ffc  8E0002         LDX #0x2                          
  9fff  17E8BD         LBSR 0x88bf                       
  a002  1F98           TFR B,A                           
  a004  3001           LEAX 0x1,X                        
  a006  17E8B6         LBSR 0x88bf                       
  a009  3406           PSHS  B A                         
  a00b  FC6197         LDD 0x6197                        
  a00e  A3E1           SUBD ,S++                         
  a010  3406           PSHS  B A                         
  a012  8E0005         LDX #0x5                          
  a015  17E8A7         LBSR 0x88bf                       
  a018  C401           ANDB #0x1                         
  a01a  2703           BEQ 0xa01f                        
  a01c  4F             CLRA                              
  a01d  2002           BRA 0xa021                        
LAB_a01f:
  a01f  86FF           LDA #0xff                         
LAB_a021:
  a021  B7619B         STA 0x619b                        
  a024  3506           PULS  A B                         
LAB_a026:
  a026  35B0           PULS  X Y PC                      

; ---- function FUN_a028
FUN_a028:
  a028  3416           PSHS  X B A                       
  a02a  F6619B         LDB 0x619b                        
  a02d  260B           BNE 0xa03a                        
  a02f  FC6199         LDD 0x6199                        
  a032  10B360BD       CMPD 0x60bd                       
  a036  2E02           BGT 0xa03a                        
  a038  2004           BRA 0xa03e                        
LAB_a03a:
  a03a  1CFB           ANDCC #0xfb                       
  a03c  2002           BRA 0xa040                        
LAB_a03e:
  a03e  1A04           ORCC #0x4                         
LAB_a040:
  a040  3596           PULS  A B X PC                    

; ---- function FUN_a042
FUN_a042:
  a042  3436           PSHS  Y X B A                     
  a044  FC6197         LDD 0x6197                        
  a047  10B360BD       CMPD 0x60bd                       
  a04b  2304           BLS 0xa051                        
  a04d  1CFB           ANDCC #0xfb                       
  a04f  2002           BRA 0xa053                        
LAB_a051:
  a051  1A04           ORCC #0x4                         
LAB_a053:
  a053  35B6           PULS  A B X Y PC                  

; ---- function FUN_a055
FUN_a055:
  a055  3470           PSHS  U Y X                       
  a057  8E001D         LDX #0x1d                         
  a05a  1706BE         LBSR 0xa71b                       
  a05d  1083FFFF       CMPD #0xffff                      
  a061  274B           BEQ 0xa0ae                        
  a063  17E9A2         LBSR 0x8a08                       
  a066  2646           BNE 0xa0ae                        
  a068  1F98           TFR B,A                           
  a06a  8E0005         LDX #0x5                          
  a06d  17E84F         LBSR 0x88bf                       
  a070  C401           ANDB #0x1                         
  a072  263A           BNE 0xa0ae                        
  a074  3128           LEAY 0x8,Y                        
  a076  10BF6194       STY 0x6194                        
  a07a  B76196         STA 0x6196                        
  a07d  CC0000         LDD #0x0                          
  a080  FD618B         STD 0x618b                        
  a083  17FC57         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A0CB(rel)
  a086  0045           dw 45h                            
LAB_a088:
  a088  3606           PSHU  B A                         
  a08a  17FC50         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A0B9(rel)
  a08d  002C           dw 2Ch                            
LAB_a08f:
  a08f  3606           PSHU  B A                         
  a091  8E0002         LDX #0x2                          
  a094  170684         LBSR 0xa71b                       
  a097  830008         SUBD #0x8                         
  a09a  3606           PSHU  B A                         
  a09c  17FC3E         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A0D4(rel)
  a09f  0035           dw 35h                            
LAB_a0a1:
  a0a1  3606           PSHU  B A                         
  a0a3  175A68         LBSR 0xfb0e                       
  a0a6  FC618B         LDD 0x618b                        
  a0a9  C3000A         ADDD #0xa                         
  a0ac  2007           BRA 0xa0b5                        
LAB_a0ae:
  a0ae  CCFFFF         LDD #0xffff                       
  a0b1  1CFB           ANDCC #0xfb                       
  a0b3  2002           BRA 0xa0b7                        
LAB_a0b5:
  a0b5  1A04           ORCC #0x4                         
LAB_a0b7:
  a0b7  35F0           PULS  X Y U PC                    

; ---- function FUN_a0b9
FUN_a0b9:
  a0b9  3430           PSHS  Y X                         
  a0bb  F66196         LDB 0x6196                        
  a0be  17595F         LBSR 0xfa20                       
  a0c1  FC6194         LDD 0x6194                        
  a0c4  E68B           LDB D,X                           
  a0c6  175971         LBSR 0xfa3a                       
  a0c9  35B0           PULS  X Y PC                      

; ---- function FUN_a0cb
FUN_a0cb:
  a0cb  3430           PSHS  Y X                         
  a0cd  3008           LEAX 0x8,X                        
  a0cf  170633         LBSR 0xa705                       
  a0d2  35B0           PULS  X Y PC                      

; ---- function FUN_a0d4
FUN_a0d4:
  a0d4  3406           PSHS  B A                         
  a0d6  FC618B         LDD 0x618b                        
  a0d9  C30001         ADDD #0x1                         
  a0dc  FD618B         STD 0x618b                        
  a0df  3586           PULS  A B PC                      

; ---- function API_FE3A
API_FE3A:
  a0e1  3436           PSHS  Y X B A                     
  a0e3  8E0000         LDX #0x0                          
  a0e6  170632         LBSR 0xa71b                       
  a0e9  17EA78         LBSR 0x8b64                       
  a0ec  17FE59         LBSR 0x9f48                       
  a0ef  35B6           PULS  A B X Y PC                  

; ---- function API_FDFC
API_FDFC:
  a0f1  3436           PSHS  Y X B A                     
  a0f3  C6A0           LDB #0xa0                         
  a0f5  175928         LBSR 0xfa20                       
  a0f8  C600           LDB #0x0                          
  a0fa  17F6D6         LBSR 0x97d3                       
  a0fd  8D1B           BSR 0xa11a                        
  a0ff  8D22           BSR 0xa123                        
  a101  8D3A           BSR 0xa13d                        
  a103  175934         LBSR 0xfa3a                       
  a106  35B6           PULS  A B X Y PC                  

; ---- function FUN_a108
FUN_a108:
  a108  3436           PSHS  Y X B A                     
  a10a  C6A0           LDB #0xa0                         
  a10c  175911         LBSR 0xfa20                       
  a10f  8D09           BSR 0xa11a                        
  a111  8D1C           BSR 0xa12f                        
  a113  8D28           BSR 0xa13d                        
  a115  175922         LBSR 0xfa3a                       
  a118  35B6           PULS  A B X Y PC                  

; ---- function FUN_a11a
FUN_a11a:
  a11a  FC0000         LDD 0x0000                        
  a11d  17FCAD         LBSR 0x9dcd                       
  a120  3606           PSHU  B A                         
  a122  39             RTS                               

; ---- function FUN_a123
FUN_a123:
  a123  17F6BE         LBSR 0x97e4                        ; inline[API_FC38]: "{4:2000}{3:60AA} "
  a126  0420000360AA.. char[8] 04h," "                   
LAB_a12e:
  a12e  39             RTS                               

; ---- function FUN_a12f
FUN_a12f:
  a12f  17F6B2         LBSR 0x97e4                        ; inline[API_FC38]: "[{4:2000}{3:60AA}] "
  a132  5B0420000360.. char[10] "[",04h," "              
LAB_a13c:
  a13c  39             RTS                               

; ---- function FUN_a13d
FUN_a13d:
  a13d  8E000A         LDX #0xa                          
  a140  CC000F         LDD #0xf                          
  a143  17F70D         LBSR 0x9853                       
  a146  39             RTS                               

; ---- function FUN_a147
FUN_a147:
  a147  3416           PSHS  X B A                       
  a149  F66079         LDB 0x6079                        
  a14c  1758D1         LBSR 0xfa20                       
  a14f  BE607A         LDX 0x607a                        
  a152  EC84           LDD ,X                            
  a154  17FC76         LBSR 0x9dcd                       
  a157  3606           PSHU  B A                         
  a159  8DD4           BSR 0xa12f                        
  a15b  EC61           LDD 0x1,S                         
  a15d  17000F         LBSR 0xa16f                       
  a160  8E60C6         LDX #0x60c6                       
  a163  3002           LEAX 0x2,X                        
  a165  C60F           LDB #0xf                          
  a167  17F6E9         LBSR 0x9853                       
  a16a  1758CD         LBSR 0xfa3a                       
  a16d  3596           PULS  A B X PC                    

; ---- function FUN_a16f
FUN_a16f:
  a16f  3436           PSHS  Y X B A                     
  a171  ECE4           LDD ,S                            
  a173  BE607A         LDX 0x607a                        
  a176  F66079         LDB 0x6079                        
  a179  1758A4         LBSR 0xfa20                       
  a17c  E6890005       LDB 0x5,X                         
  a180  C502           BITB #0x2                         
  a182  274B           BEQ 0xa1cf                        
  a184  17FD8B         LBSR 0x9f12                       
  a187  2628           BNE 0xa1b1                        
  a189  BE618F         LDX 0x618f                        
  a18c  300A           LEAX 0xa,X                        
  a18e  BF618F         STX 0x618f                        
  a191  CC0000         LDD #0x0                          
  a194  FD618D         STD 0x618d                        
  a197  17FB43         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A1EC(rel)
  a19a  0052           dw 52h                            
LAB_a19c:
  a19c  3606           PSHU  B A                         
  a19e  17FB3C         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$9EEE(rel)
  a1a1  FD4D           dw FD4Dh                          
LAB_a1a3:
  a1a3  3606           PSHU  B A                         
  a1a5  17FB35         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$9ED9(rel)
  a1a8  FD31           dw FD31h                          
LAB_a1aa:
  a1aa  3606           PSHU  B A                         
  a1ac  1759DC         LBSR 0xfb8b                       
  a1af  2026           BRA 0xa1d7                        
LAB_a1b1:
  a1b1  17E846         LBSR 0x89fa                       
  a1b4  17FB26         LBSR 0x9cdd                        ; inline[addr:9CDD]: ->$A1BE(rel)
  a1b7  0007           dw 7h                             
LAB_a1b9:
  a1b9  170020         LBSR 0xa1dc                       
  a1bc  2019           BRA 0xa1d7                        
DAT_a1be:
  a1be  FF             ?? FFh                            
  a1bf  .db FF 2A 4E 4F 20 52 4F 4D 20 50 52 45 53 45 54 2A  ; .*NO ROM PRESET*
LAB_a1cf:
  a1cf  1F10           TFR X,D                           
  a1d1  C30008         ADDD #0x8                         
  a1d4  170005         LBSR 0xa1dc                       
LAB_a1d7:
  a1d7  175860         LBSR 0xfa3a                       
  a1da  35B6           PULS  A B X Y PC                  

; ---- function FUN_a1dc
FUN_a1dc:
  a1dc  3436           PSHS  Y X B A                     
  a1de  1F01           TFR D,X                           
  a1e0  108E60C6       LDY #0x60c6                       
  a1e4  CC0012         LDD #0x12                         
  a1e7  171F9E         LBSR 0xc188                       
  a1ea  35B6           PULS  A B X Y PC                  

; ---- function FUN_a1ec
FUN_a1ec:
  a1ec  3436           PSHS  Y X B A                     
  a1ee  8E60C6         LDX #0x60c6                       
  a1f1  B6618D         LDA 0x618d                        
  a1f4  E786           STB A,X                           
  a1f6  4C             INCA                              
  a1f7  8112           CMPA #0x12                        
  a1f9  2707           BEQ 0xa202                        
  a1fb  B7618D         STA 0x618d                        
  a1fe  1A04           ORCC #0x4                         
  a200  2002           BRA 0xa204                        
LAB_a202:
  a202  1CFB           ANDCC #0xfb                       
LAB_a204:
  a204  35B6           PULS  A B X Y PC                  

; ---- function API_FDCE
API_FDCE:
  a206  3456           PSHS  U X B A                     
  a208  CE6570         LDU #0x6570                       
  a20b  1A40           ORCC #0x40                        
  a20d  C6FF           LDB #0xff                         
  a20f  F760FB         STB 0x60fb                        
  a212  F760FC         STB 0x60fc                        
  a215  C601           LDB #0x1                          
  a217  F760DA         STB 0x60da                        
  a21a  1709B2         LBSR 0xabcf                       
  a21d  7F60B8         CLR 0x60b8                        
  a220  170050         LBSR 0xa273                       
  a223  173E4F         LBSR 0xe075                       
  a226  1745D5         LBSR 0xe7fe                       
  a229  172970         LBSR 0xcb9c                       
  a22c  8E0008         LDX #0x8                          
  a22f  1704E9         LBSR 0xa71b                       
  a232  3406           PSHS  B A                         
  a234  17E7D1         LBSR 0x8a08                       
  a237  F7600B         STB 0x600b                        
  a23a  F76102         STB 0x6102                        
  a23d  F76021         STB 0x6021                        
  a240  F76022         STB 0x6022                        
  a243  F76023         STB 0x6023                        
  a246  3506           PULS  A B                         
  a248  17E7CB         LBSR 0x8a16                       
  a24b  1026001F       LBNE 0xa26e                       
  a24f  1700BA         LBSR 0xa30c                       
  a252  173E29         LBSR 0xe07e                       
  a255  1745AC         LBSR 0xe804                       
  a258  17F402         LBSR 0x965d                       
  a25b  8E0008         LDX #0x8                          
  a25e  1704BA         LBSR 0xa71b                       
  a261  B7600A         STA 0x600a                        
  a264  3556           PULS  A B X U                     
  a266  1CBF           ANDCC #0xbf                       
  a268  173DF9         LBSR 0xe064                       
  a26b  1A04           ORCC #0x4                         
  a26d  39             RTS                               
LAB_a26e:
  a26e  3556           PULS  A B X U                     
  a270  1CFB           ANDCC #0xfb                       
  a272  39             RTS                               

; ---- function API_FDD0
API_FDD0:
  a273  7F6009         CLR 0x6009                        
  a276  7F6008         CLR 0x6008                        
  a279  170953         LBSR 0xabcf                       
  a27c  17596C         LBSR 0xfbeb                       
  a27f  8E6600         LDX #0x6600                       
  a282  86B7           LDA #0xb7                         
  a284  A780           STA ,X+                           
  a286  CC8055         LDD #0x8055                       
  a289  ED81           STD ,X++                          
  a28b  863B           LDA #0x3b                         
  a28d  A780           STA ,X+                           
  a28f  B76700         STA 0x6700                        
  a292  B76780         STA 0x6780                        
  a295  B767C0         STA 0x67c0                        
  a298  171FEE         LBSR 0xc289                        ; inline[API_FD18]: [$600F]=$FFE8 [$6011]=$FFE8 [$6013]=$FFE8 [$6015]=$FFE8 [$6006]=$FFE8 [$6004]=$FFE8 [$6002]=$FFE8 [$608F]=$FFE8 [$6091]=$FFE8 [$6093]=$FFE8 [$6095]=$FFE8 [$6097]=$FFE8 [$603A]=$FFE8 [$6038]=$FFE8 [$6036]=$FFE8 [$608D]=$FFE8 [$60ED]=$FFE8 [$60EF]=$8D51
  a29b  600F           addr 600f                         
  a29d  FFE8           dw FFE8h                          
  a29f  6011           addr 6011                         
  a2a1  FFE8           dw FFE8h                          
  a2a3  6013           addr 6013                         
  a2a5  FFE8           dw FFE8h                          
  a2a7  6015           addr 6015                         
  a2a9  FFE8           dw FFE8h                          
  a2ab  6006           addr 6006                         
  a2ad  FFE8           dw FFE8h                          
  a2af  6004           addr 6004                         
  a2b1  FFE8           dw FFE8h                          
  a2b3  6002           addr 6002                         
  a2b5  FFE8           dw FFE8h                          
  a2b7  608F           addr 608f                         
  a2b9  FFE8           dw FFE8h                          
  a2bb  6091           addr 6091                         
  a2bd  FFE8           dw FFE8h                          
  a2bf  6093           addr 6093                         
  a2c1  FFE8           dw FFE8h                          
  a2c3  6095           addr 6095                         
  a2c5  FFE8           dw FFE8h                          
  a2c7  6097           addr 6097                         
  a2c9  FFE8           dw FFE8h                          
  a2cb  603A           addr 603a                         
  a2cd  FFE8           dw FFE8h                          
  a2cf  6038           addr 6038                         
  a2d1  FFE8           dw FFE8h                          
  a2d3  6036           addr 6036                         
  a2d5  FFE8           dw FFE8h                          
  a2d7  608D           addr 608d                         
  a2d9  FFE8           dw FFE8h                          
  a2db  60ED           addr 60ed                         
  a2dd  FFE8           dw FFE8h                          
  a2df  60EF           addr 60ef                         
  a2e1  8D51           dw 8D51h                          
  a2e3  FFFF           dw FFFFh                          
LAB_a2e5:
  a2e5  C600           LDB #0x0                          
  a2e7  17F77D         LBSR 0x9a67                       
  a2ea  17032D         LBSR 0xa61a                       
  a2ed  175647         LBSR 0xf937                       
  a2f0  39             RTS                               

; ---- function FUN_a2f1
FUN_a2f1:
  a2f1  3436           PSHS  Y X B A                     
  a2f3  8E0005         LDX #0x5                          
  a2f6  17040C         LBSR 0xa705                       
  a2f9  C508           BITB #0x8                         
  a2fb  2603           BNE 0xa300                        
  a2fd  172612         LBSR 0xc912                       
LAB_a300:
  a300  C504           BITB #0x4                         
  a302  2606           BNE 0xa30a                        
  a304  CC1000         LDD #0x1000                       
  a307  172357         LBSR 0xc661                       
LAB_a30a:
  a30a  35B6           PULS  A B X Y PC                  

; ---- function FUN_a30c
FUN_a30c:
  a30c  3436           PSHS  Y X B A                     
  a30e  C6A0           LDB #0xa0                         
  a310  17570D         LBSR 0xfa20                       
  a313  7D6105         TST 0x6105                        
  a316  272B           BEQ 0xa343                        
  a318  FC6106         LDD 0x6106                        
  a31b  C30040         ADDD #0x40                        
  a31e  10B30002       CMPD 0x0002                       
  a322  231F           BLS 0xa343                        
  a324  3406           PSHS  B A                         
  a326  B30002         SUBD 0x0002                       
  a329  3406           PSHS  B A                         
  a32b  CC0040         LDD #0x40                         
  a32e  A3E4           SUBD ,S                           
  a330  8EA348         LDX #0xa348                       
  a333  308B           LEAX D,X                          
  a335  10BE6106       LDY 0x6106                        
  a339  ECE1           LDD ,S++                          
  a33b  171E4A         LBSR 0xc188                       
  a33e  3506           PULS  A B                         
  a340  FD0002         STD 0x0002                        
LAB_a343:
  a343  1756F4         LBSR 0xfa3a                       
  a346  35B6           PULS  A B X Y PC                  
  a348  .db 00 00 00 00 00 00 00 00                          ; ........
  a350  20536F667420.. ds " Soft 1  Soft 2  Soft 3  Soft 4 "
  a374  .db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ; ................
  a384  .db 00 00 00 00 34 36 C6 A0 17 56 91 F6 60 89 4F 7D  ; ....46...V..`.O}
  a394  .db 61 1A 26 20 7D 02 8E 26 69 7D 02 8D 27 16 8E 01  ; a.& }..&i}..'...
  a3a4  .db 80 58 49 30 8B EC 84 10 83 FF FF 27 55 17 FA 0C  ; .XI0.......'U...
  a3b4  .db 26 50 20 20 10 83 00 64 24 1A 36 06 FC 02 9B 10  ; &P  ...d$.6.....
  a3c4  .db 83 00 0A 27 26 36 06 CC 00 64 36 06 17 1A 4E 17  ; ...'&6...d6...N.
  a3d4  .db 19 91 37 06 84 0F 17 56 5D 17 FA 15 17 E4 7A 26  ; ..7....V].....z&
  a3e4  .db 1D 17 0C 25 17 FA 41 26 15 20 08 37 06 17 56 46  ; ...%..A&. .7..VF
  a3f4  .db 17 0C 2F C6 FF F7 60 19 17 FE 07 7F 60 19 35 36  ; ../...`.....`.56
  a404  .db 20 05 17 56 31 35 36 39                          ;  ..V1569

; ---- function API_FC68
API_FC68:
  a40c  3437           PSHS  Y X B A CC                  
  a40e  8E8022         LDX #0x8022                       
  a411  1600EB         LBRA 0xa4ff                       

; ---- function API_FC6A
API_FC6A:
  a414  3436           PSHS  Y X B A                     
  a416  F761A1         STB 0x61a1                        
  a419  7D60F4         TST 0x60f4                        
  a41c  2622           BNE 0xa440                        
  a41e  F7619C         STB 0x619c                        

; ---- function FUN_a421
FUN_a421:
  a421  B6619C         LDA 0x619c                        
  a424  F6619D         LDB 0x619d                        
  a427  3D             MUL                               
  a428  1F89           TFR A,B                           
  a42a  8E8026         LDX #0x8026                       
  a42d  1700CD         LBSR 0xa4fd                       
  a430  B6619C         LDA 0x619c                        
  a433  43             COMA                              
  a434  F6619D         LDB 0x619d                        
  a437  3D             MUL                               
  a438  1F89           TFR A,B                           
  a43a  8E8036         LDX #0x8036                       
  a43d  1700BD         LBSR 0xa4fd                       
LAB_a440:
  a440  35B6           PULS  A B X Y PC                  

; ---- function API_FC6C
API_FC6C:
  a442  3437           PSHS  Y X B A CC                  
  a444  1F98           TFR B,A                           
  a446  8E0280         LDX #0x280                        
  a449  1702B9         LBSR 0xa705                       
  a44c  3D             MUL                               
  a44d  1F89           TFR A,B                           
  a44f  8E8025         LDX #0x8025                       
  a452  1600AA         LBRA 0xa4ff                       

; ---- function API_FC6E
API_FC6E:
  a455  3436           PSHS  Y X B A                     
  a457  F7619D         STB 0x619d                        
  a45a  20C5           BRA 0xa421                        

; ---- function API_FC70
API_FC70:
  a45c  3437           PSHS  Y X B A CC                  
  a45e  8E8024         LDX #0x8024                       
  a461  16009B         LBRA 0xa4ff                       

; ---- function API_FC72
API_FC72:
  a464  3436           PSHS  Y X B A                     
  a466  F761A0         STB 0x61a0                        
  a469  7D60F4         TST 0x60f4                        
  a46c  2620           BNE 0xa48e                        
  a46e  F7619E         STB 0x619e                        

; ---- function FUN_a471
FUN_a471:
  a471  F6619F         LDB 0x619f                        
  a474  B6619E         LDA 0x619e                        
  a477  3D             MUL                               
  a478  1F89           TFR A,B                           
  a47a  8E8033         LDX #0x8033                       
  a47d  8D7E           BSR 0xa4fd                        
  a47f  B6619E         LDA 0x619e                        
  a482  43             COMA                              
  a483  F6619F         LDB 0x619f                        
  a486  3D             MUL                               
  a487  1F89           TFR A,B                           
  a489  8E8023         LDX #0x8023                       
  a48c  8D6F           BSR 0xa4fd                        
LAB_a48e:
  a48e  35B6           PULS  A B X Y PC                  

; ---- function API_FC74
API_FC74:
  a490  3437           PSHS  Y X B A CC                  
  a492  1F98           TFR B,A                           
  a494  8E0281         LDX #0x281                        
  a497  17026B         LBSR 0xa705                       
  a49a  3D             MUL                               
  a49b  1F89           TFR A,B                           
  a49d  8E8027         LDX #0x8027                       
  a4a0  205D           BRA 0xa4ff                        

; ---- function API_FC76
API_FC76:
  a4a2  3436           PSHS  Y X B A                     
  a4a4  F7619F         STB 0x619f                        
  a4a7  20C8           BRA 0xa471                        

; ---- function API_FC78
API_FC78:
  a4a9  3406           PSHS  B A                         
  a4ab  8600           LDA #0x0                          
  a4ad  B78020         STA 0x8020                        
  a4b0  B780A6         STA 0x80a6                        
  a4b3  C600           LDB #0x0                          
  a4b5  17FF8A         LBSR 0xa442                       
  a4b8  17FFD5         LBSR 0xa490                       
  a4bb  86FF           LDA #0xff                         
  a4bd  17FF54         LBSR 0xa414                       
  a4c0  17FFA1         LBSR 0xa464                       
  a4c3  8E0284         LDX #0x284                        
  a4c6  17023C         LBSR 0xa705                       
  a4c9  170049         LBSR 0xa515                       
  a4cc  17FF3D         LBSR 0xa40c                       
  a4cf  8E0285         LDX #0x285                        
  a4d2  170230         LBSR 0xa705                       
  a4d5  17003D         LBSR 0xa515                       
  a4d8  17FF81         LBSR 0xa45c                       
  a4db  8E0286         LDX #0x286                        
  a4de  170224         LBSR 0xa705                       
  a4e1  170031         LBSR 0xa515                       
  a4e4  17FF6E         LBSR 0xa455                       
  a4e7  8E0287         LDX #0x287                        
  a4ea  170218         LBSR 0xa705                       
  a4ed  170025         LBSR 0xa515                       
  a4f0  17FFAF         LBSR 0xa4a2                       
  a4f3  7F60F4         CLR 0x60f4                        
  a4f6  867F           LDA #0x7f                         
  a4f8  B7601A         STA 0x601a                        
  a4fb  3586           PULS  A B PC                      

; ---- function API_FC7A
API_FC7A:
  a4fd  3437           PSHS  Y X B A CC                  
LAB_a4ff:
  a4ff  1A50           ORCC #0x50                        
  a501  E784           STB ,X                            
  a503  12             NOP                               
  a504  12             NOP                               
  a505  8601           LDA #0x1                          
  a507  B780A6         STA 0x80a6                        
  a50a  12             NOP                               
  a50b  12             NOP                               
  a50c  4F             CLRA                              
  a50d  B780A6         STA 0x80a6                        
  a510  F78020         STB 0x8020                        
  a513  35B7           PULS CC A B X Y PC                

; ---- function API_FDD2
API_FDD2:
  a515  3412           PSHS  X A                         
  a517  5D             TSTB                              
  a518  2C01           BGE 0xa51b                        
  a51a  50             NEGB                              
LAB_a51b:
  a51b  C130           CMPB #0x30                        
  a51d  2D02           BLT 0xa521                        
  a51f  C630           LDB #0x30                         
LAB_a521:
  a521  8EA52A         LDX #0xa52a                       
  a524  1F98           TFR B,A                           
  a526  E686           LDB A,X                           
  a528  3592           PULS  A X PC                      
DAT_a52a:
  a52a  FF             ?? FFh                            
  a52b  .db E4 CB B5 A1 90 80 72 66 5B 51 48 40 39 33 2E 29  ; ......rf[QH@93.)
  a53b  .db 24 20 1D 1A 17 14 12 10 0E 0B 0A 09 08 08 07 06  ; $ ..............
  a54b  .db 06 05 05 04 04 03 03 03 02 02 02 01 01 01 01     ; ...............
DAT_a55a:
  a55a  00             undefined1 00h                    

; ---- function FUN_a55b
FUN_a55b:
  a55b  3432           PSHS  Y X A                       
  a55d  CB30           ADDB #0x30                        
  a55f  B6601A         LDA 0x601a                        
  a562  4C             INCA                              
  a563  3D             MUL                               
  a564  58             LSLB                              
  a565  49             ROLA                              
  a566  1F89           TFR A,B                           
  a568  C030           SUBB #0x30                        
  a56a  35B2           PULS  A X Y PC                    
  a56c  .db 80 22                                            ; ."
DAT_a56e:
  a56e  0284           undefined2 0284h                  
  a570  .db 00 19 A4 0C 00 80 24 02 85 00 1A A4 5C 00 80 36  ; ......$.....\..6
  a580  .db 02 86 00 1B A4 55 FF 80 23 02 87 00 1C A4 A2 FF  ; .....U..#.......

; ---- function API_FD94
API_FD94:
  a590  3426           PSHS  Y B A                       
  a592  108EA56C       LDY #0xa56c                       
LAB_a596:
  a596  3420           PSHS  Y                           
  a598  10AE22         LDY 0x2,Y                         
  a59b  17019E         LBSR 0xa73c                       
  a59e  3520           PULS  Y                           
  a5a0  8D02           BSR 0xa5a4                        
  a5a2  35A6           PULS  A B Y PC                    

; ---- function FUN_a5a4
FUN_a5a4:
  a5a4  3436           PSHS  Y X B A                     
LAB_a5a6:
  a5a6  AE22           LDX 0x2,Y                         
  a5a8  17015A         LBSR 0xa705                       
  a5ab  C1D0           CMPB #0xd0                        
  a5ad  2718           BEQ 0xa5c7                        
  a5af  3404           PSHS  B                           
  a5b1  AE24           LDX 0x4,Y                         
  a5b3  17014F         LBSR 0xa705                       
  a5b6  EBE0           ADDB ,S+                          
  a5b8  17007F         LBSR 0xa63a                       
  a5bb  6D28           TST 0x8,Y                         
  a5bd  2703           BEQ 0xa5c2                        
  a5bf  17FF99         LBSR 0xa55b                       
LAB_a5c2:
  a5c2  17FF50         LBSR 0xa515                       
  a5c5  2001           BRA 0xa5c8                        
LAB_a5c7:
  a5c7  5F             CLRB                              
LAB_a5c8:
  a5c8  ADB806         JSR [0x6,Y]                       
  a5cb  35B6           PULS  A B X Y PC                  

; ---- function API_FD96
API_FD96:
  a5cd  3426           PSHS  Y B A                       
  a5cf  108EA575       LDY #0xa575                       
  a5d3  20C1           BRA 0xa596                        

; ---- function API_FD98
API_FD98:
  a5d5  3426           PSHS  Y B A                       
  a5d7  108EA57E       LDY #0xa57e                       
  a5db  20B9           BRA 0xa596                        

; ---- function API_FD9A
API_FD9A:
  a5dd  3426           PSHS  Y B A                       
  a5df  108EA587       LDY #0xa587                       
  a5e3  20B1           BRA 0xa596                        

; ---- function API_FE52
API_FE52:
  a5e5  3436           PSHS  Y X B A                     
  a5e7  108EA56C       LDY #0xa56c                       
  a5eb  20B9           BRA 0xa5a6                        

; ---- function API_FE54
API_FE54:
  a5ed  3436           PSHS  Y X B A                     
  a5ef  108EA575       LDY #0xa575                       
  a5f3  20B1           BRA 0xa5a6                        

; ---- function API_FE56
API_FE56:
  a5f5  3436           PSHS  Y X B A                     
  a5f7  108EA57E       LDY #0xa57e                       
  a5fb  20A9           BRA 0xa5a6                        

; ---- function API_FE58
API_FE58:
  a5fd  3436           PSHS  Y X B A                     
  a5ff  108EA587       LDY #0xa587                       
  a603  20A1           BRA 0xa5a6                        

; ---- function FUN_a605
FUN_a605:
  a605  3436           PSHS  Y X B A                     
  a607  F7601A         STB 0x601a                        
  a60a  108EA57E       LDY #0xa57e                       
  a60e  17FF93         LBSR 0xa5a4                       
  a611  108EA587       LDY #0xa587                       
  a615  17FF8C         LBSR 0xa5a4                       
  a618  35B6           PULS  A B X Y PC                  

; ---- function FUN_a61a
FUN_a61a:
  a61a  3426           PSHS  Y B A                       
  a61c  108EA56C       LDY #0xa56c                       
  a620  17FF81         LBSR 0xa5a4                       
  a623  108EA575       LDY #0xa575                       
  a627  17FF7A         LBSR 0xa5a4                       
  a62a  108EA57E       LDY #0xa57e                       
  a62e  17FF73         LBSR 0xa5a4                       
  a631  108EA587       LDY #0xa587                       
  a635  17FF6C         LBSR 0xa5a4                       
  a638  35A6           PULS  A B Y PC                    

; ---- function API_FD9C
API_FD9C:
  a63a  5D             TSTB                              
  a63b  2F02           BLE 0xa63f                        
  a63d  C600           LDB #0x0                          
LAB_a63f:
  a63f  C1D0           CMPB #0xd0                        
  a641  2C02           BGE 0xa645                        
  a643  C6D0           LDB #0xd0                         
LAB_a645:
  a645  1D             SEX                               
  a646  39             RTS                               

; ---- function API_FDE2
API_FDE2:
  a647  3406           PSHS  B A                         
  a649  17F187         LBSR 0x97d3                       
  a64c  1700B6         LBSR 0xa705                       
  a64f  1D             SEX                               
  a650  C1D0           CMPB #0xd0                        
  a652  2711           BEQ 0xa665                        
  a654  3606           PSHU  B A                         
  a656  17F18B         LBSR 0x97e4                        ; inline[API_FC38]: "{4:0000}{3:60AA} dB"
  a659  0400000360AA.. char[10] 04h                      
LAB_a663:
  a663  200A           BRA 0xa66f                        
LAB_a665:
  a665  17F17C         LBSR 0x97e4                        ; inline[API_FC38]: "  Off "
  a668  20204F666620.. char[7] "  Off "                  
LAB_a66f:
  a66f  3586           PULS  A B PC                      

; ---- function API_FE38
API_FE38:
  a671  3436           PSHS  Y X B A                     
LAB_a673:
  a673  F6619E         LDB 0x619e                        
  a676  C1FF           CMPB #0xff                        
  a678  2708           BEQ 0xa682                        
  a67a  8D30           BSR 0xa6ac                        
  a67c  F7619E         STB 0x619e                        
  a67f  170020         LBSR 0xa6a2                       
LAB_a682:
  a682  F6619C         LDB 0x619c                        
  a685  C1FF           CMPB #0xff                        
  a687  2708           BEQ 0xa691                        
  a689  8D21           BSR 0xa6ac                        
  a68b  F7619C         STB 0x619c                        
  a68e  170016         LBSR 0xa6a7                       
LAB_a691:
  a691  CC0001         LDD #0x1                          
  a694  C6FF           LDB #0xff                         
  a696  F1619E         CMPB 0x619e                       
  a699  26D8           BNE 0xa673                        
  a69b  F1619C         CMPB 0x619c                       
  a69e  26D3           BNE 0xa673                        
  a6a0  35B6           PULS  A B X Y PC                  

; ---- function FUN_a6a2
FUN_a6a2:
  a6a2  3436           PSHS  Y X B A                     
  a6a4  16FDCA         LBRA 0xa471                       

; ---- function FUN_a6a7
FUN_a6a7:
  a6a7  3436           PSHS  Y X B A                     
  a6a9  16FD75         LBRA 0xa421                       

; ---- function FUN_a6ac
FUN_a6ac:
  a6ac  FB60DA         ADDB 0x60da                       
  a6af  2402           BCC 0xa6b3                        
  a6b1  C6FF           LDB #0xff                         
LAB_a6b3:
  a6b3  39             RTS                               

; ---- function API_FE36
API_FE36:
  a6b4  3436           PSHS  Y X B A                     
LAB_a6b6:
  a6b6  F6619E         LDB 0x619e                        
  a6b9  F161A0         CMPB 0x61a0                       
  a6bc  2715           BEQ 0xa6d3                        
  a6be  F060DA         SUBB 0x60da                       
  a6c1  2507           BCS 0xa6ca                        
  a6c3  F161A0         CMPB 0x61a0                       
  a6c6  2502           BCS 0xa6ca                        
  a6c8  2003           BRA 0xa6cd                        
LAB_a6ca:
  a6ca  F661A0         LDB 0x61a0                        
LAB_a6cd:
  a6cd  F7619E         STB 0x619e                        
  a6d0  17FFCF         LBSR 0xa6a2                       
LAB_a6d3:
  a6d3  F6619C         LDB 0x619c                        
  a6d6  F161A1         CMPB 0x61a1                       
  a6d9  2715           BEQ 0xa6f0                        
  a6db  F060DA         SUBB 0x60da                       
  a6de  2507           BCS 0xa6e7                        
  a6e0  F161A1         CMPB 0x61a1                       
  a6e3  2502           BCS 0xa6e7                        
  a6e5  2003           BRA 0xa6ea                        
LAB_a6e7:
  a6e7  F661A1         LDB 0x61a1                        
LAB_a6ea:
  a6ea  F7619C         STB 0x619c                        
  a6ed  17FFB7         LBSR 0xa6a7                       
LAB_a6f0:
  a6f0  CC0001         LDD #0x1                          
  a6f3  F661A0         LDB 0x61a0                        
  a6f6  F1619E         CMPB 0x619e                       
  a6f9  26BB           BNE 0xa6b6                        
  a6fb  F661A1         LDB 0x61a1                        
  a6fe  F1619C         CMPB 0x619c                       
  a701  26B3           BNE 0xa6b6                        
  a703  35B6           PULS  A B X Y PC                  

; ---- function API_FC7C
API_FC7C:
  a705  3403           PSHS  A CC                        
  a707  B6600C         LDA 0x600c                        
  a70a  3402           PSHS  A                           
  a70c  86A0           LDA #0xa0                         
  a70e  B7600C         STA 0x600c                        
  a711  17533B         LBSR 0xfa4f                       
  a714  3502           PULS  A                           
  a716  B7600C         STA 0x600c                        
  a719  3583           PULS CC A PC                      

; ---- function API_FC7E
API_FC7E:
  a71b  3451           PSHS  U X CC                      
  a71d  B6600C         LDA 0x600c                        
  a720  3402           PSHS  A                           
  a722  86A0           LDA #0xa0                         
  a724  B7600C         STA 0x600c                        
  a727  175325         LBSR 0xfa4f                       
  a72a  1F98           TFR B,A                           
  a72c  3001           LEAX 0x1,X                        
  a72e  17531E         LBSR 0xfa4f                       
  a731  1F03           TFR D,U                           
  a733  3502           PULS  A                           
  a735  B7600C         STA 0x600c                        
  a738  1F30           TFR U,D                           
  a73a  35D1           PULS CC X U PC                    

; ---- function API_FC80
API_FC80:
  a73c  3423           PSHS  Y A CC                      
  a73e  B6600C         LDA 0x600c                        
  a741  3402           PSHS  A                           
  a743  86A0           LDA #0xa0                         
  a745  B7600C         STA 0x600c                        
  a748  175321         LBSR 0xfa6c                       
  a74b  3502           PULS  A                           
  a74d  B7600C         STA 0x600c                        
  a750  35A3           PULS CC A Y PC                    

; ---- function API_FC82
API_FC82:
  a752  3467           PSHS  U Y B A CC                  
  a754  1F03           TFR D,U                           
  a756  B6600C         LDA 0x600c                        
  a759  3402           PSHS  A                           
  a75b  86A0           LDA #0xa0                         
  a75d  B7600C         STA 0x600c                        
  a760  1F30           TFR U,D                           
  a762  1E89           EXG A,B                           
  a764  175305         LBSR 0xfa6c                       
  a767  1E98           EXG B,A                           
  a769  3121           LEAY 0x1,Y                        
  a76b  1752FE         LBSR 0xfa6c                       
  a76e  3502           PULS  A                           
  a770  B7600C         STA 0x600c                        
  a773  35E7           PULS CC A B Y U PC                

; ---- function API_FD88
API_FD88:
  a775  3402           PSHS  A                           
  a777  8D2E           BSR 0xa7a7                        
  a779  3402           PSHS  A                           
  a77b  17FF87         LBSR 0xa705                       
  a77e  E4E0           ANDB ,S+                          
  a780  3582           PULS  A PC                        

; ---- function API_FD8A
API_FD8A:
  a782  3413           PSHS  X A CC                      
  a784  8D21           BSR 0xa7a7                        
  a786  3402           PSHS  A                           
  a788  1F21           TFR Y,X                           
  a78a  17FF78         LBSR 0xa705                       
  a78d  EAE0           ORB ,S+                           
  a78f  17FFAA         LBSR 0xa73c                       
  a792  3593           PULS CC A X PC                    

; ---- function API_FD8C
API_FD8C:
  a794  3413           PSHS  X A CC                      
  a796  8D0F           BSR 0xa7a7                        
  a798  43             COMA                              
  a799  3402           PSHS  A                           
  a79b  1F21           TFR Y,X                           
  a79d  17FF65         LBSR 0xa705                       
  a7a0  E4E0           ANDB ,S+                          
  a7a2  17FF97         LBSR 0xa73c                       
  a7a5  3593           PULS CC A X PC                    

; ---- function FUN_a7a7
FUN_a7a7:
  a7a7  3410           PSHS  X                           
  a7a9  8EA7B2         LDX #0xa7b2                       
  a7ac  C407           ANDB #0x7                         
  a7ae  A685           LDA B,X                           
  a7b0  3590           PULS  X PC                        
DAT_a7b2:
  a7b2  01             ?? 01h                            
  a7b3  .db 02 04 08 10 20 40 80                             ; .... @.

; ---- function FUN_a7ba
FUN_a7ba:
  a7ba  3406           PSHS  B A                         
  a7bc  327C           LEAS -0x4,S                       
LAB_a7be:
  a7be  EDE4           STD ,S                            
  a7c0  17FF42         LBSR 0xa705                       
  a7c3  3001           LEAX 0x1,X                        
  a7c5  E7A0           STB ,Y+                           
  a7c7  ECE4           LDD ,S                            
  a7c9  830001         SUBD #0x1                         
  a7cc  26F0           BNE 0xa7be                        
  a7ce  3264           LEAS 0x4,S                        
  a7d0  3586           PULS  A B PC                      

; ---- function FUN_a7d2
FUN_a7d2:
  a7d2  3406           PSHS  B A                         
  a7d4  327C           LEAS -0x4,S                       
LAB_a7d6:
  a7d6  EDE4           STD ,S                            
  a7d8  E680           LDB ,X+                           
  a7da  17FF5F         LBSR 0xa73c                       
  a7dd  3121           LEAY 0x1,Y                        
  a7df  ECE4           LDD ,S                            
  a7e1  830001         SUBD #0x1                         
  a7e4  26F0           BNE 0xa7d6                        
  a7e6  3264           LEAS 0x4,S                        
  a7e8  3586           PULS  A B PC                      

; ---- function API_FC84
API_FC84:
  a7ea  3406           PSHS  B A                         
  a7ec  1703E0         LBSR 0xabcf                       
  a7ef  1753F9         LBSR 0xfbeb                       
  a7f2  86FF           LDA #0xff                         
  a7f4  B760B8         STA 0x60b8                        
  a7f7  3586           PULS  A B PC                      

; ---- function FUN_a7f9
FUN_a7f9:
  a7f9  3406           PSHS  B A                         
  a7fb  86FF           LDA #0xff                         
  a7fd  B760FB         STA 0x60fb                        
  a800  8D05           BSR 0xa807                        
  a802  170088         LBSR 0xa88d                       
  a805  3586           PULS  A B PC                      

; ---- function FUN_a807
FUN_a807:
  a807  3406           PSHS  B A                         
  a809  F660FB         LDB 0x60fb                        
  a80c  C4F8           ANDB #0xf8                        
  a80e  C180           CMPB #0x80                        
  a810  2779           BEQ 0xa88b                        
  a812  F6600B         LDB 0x600b                        
  a815  F761A6         STB 0x61a6                        
  a818  170487         LBSR 0xaca2                       
  a81b  1703B1         LBSR 0xabcf                       
  a81e  17EFC3         LBSR 0x97e4                        ; inline[API_FC38]: "{1} Left In   Right In  Left Out  Right Out(        )(        )(        )(        )"
  a821  01204C656674.. char[82] 01h," Left In   Right In  Left Out  Right Out(        )(        )(        )(        )"
LAB_a873:
  a873  170184         LBSR 0xa9fa                       
  a876  171A10         LBSR 0xc289                        ; inline[API_FD18]: [$603C]=$AA39 [$603E]=$AA73 [$6040]=$AA98 [$6042]=$AABD
  a879  603C           addr 603c                         
  a87b  AA39           dw AA39h                          
  a87d  603E           addr 603e                         
  a87f  AA73           dw AA73h                          
  a881  6040           addr 6040                         
  a883  AA98           dw AA98h                          
  a885  6042           addr 6042                         
  a887  AABD           dw AABDh                          
  a889  FFFF           dw FFFFh                          
LAB_a88b:
  a88b  3586           PULS  A B PC                      

; ---- function FUN_a88d
FUN_a88d:
  a88d  3416           PSHS  X B A                       
  a88f  C680           LDB #0x80                         
  a891  F160FB         CMPB 0x60fb                       
  a894  2736           BEQ 0xa8cc                        
  a896  F760FB         STB 0x60fb                        
  a899  8E0284         LDX #0x284                        
  a89c  17FE66         LBSR 0xa705                       
  a89f  1D             SEX                               
  a8a0  FD6074         STD 0x6074                        
  a8a3  170174         LBSR 0xaa1a                       
  a8a6  1719E0         LBSR 0xc289                        ; inline[API_FD18]: [$602A]=$A93B [$6070]=$A8CE [$6072]=$A8E6 [$605C]=$A903 [$605A]=$A903
  a8a9  602A           addr 602a                         
  a8ab  A93B           dw A93Bh                          
  a8ad  6070           addr 6070                         
  a8af  A8CE           dw A8CEh                          
  a8b1  6072           addr 6072                         
  a8b3  A8E6           dw A8E6h                          
  a8b5  605C           addr 605c                         
  a8b7  A903           dw A903h                          
  a8b9  605A           addr 605a                         
  a8bb  A903           dw A903h                          
  a8bd  FFFF           dw FFFFh                          
LAB_a8bf:
  a8bf  174470         LBSR 0xed32                       
  a8c2  C600           LDB #0x0                          
  a8c4  174428         LBSR 0xecef                       
  a8c7  C601           LDB #0x1                          
  a8c9  174423         LBSR 0xecef                       
LAB_a8cc:
  a8cc  3596           PULS  A B X PC                    

; ---- function FUN_a8ce
FUN_a8ce:
  a8ce  7D604D         TST 0x604d                        
  a8d1  2712           BEQ 0xa8e5                        
  a8d3  17EF0E         LBSR 0x97e4                        ; inline[API_FC38]: "{2:2A}{5:06}{3:60A0}{2:34}{5:06}{3:60A0}"
  a8d6  022A05060360.. char[15] 02h,"*",05h,06h,03h,"`",A0h,02h,"4",05h,06h,03h,"`",A0h
LAB_a8e5:
  a8e5  39             RTS                               

; ---- function FUN_a8e6
FUN_a8e6:
  a8e6  3436           PSHS  Y X B A                     
  a8e8  FC6074         LDD 0x6074                        
  a8eb  108EAB88       LDY #0xab88                       
  a8ef  170278         LBSR 0xab6a                       
  a8f2  ADB90000       JSR [0x0,Y]                       
  a8f6  108EAB95       LDY #0xab95                       
  a8fa  17026D         LBSR 0xab6a                       
  a8fd  ADB90000       JSR [0x0,Y]                       
  a901  2010           BRA 0xa913                        

; ---- function FUN_a903
FUN_a903:
  a903  3436           PSHS  Y X B A                     
  a905  108EAB88       LDY #0xab88                       
  a909  170017         LBSR 0xa923                       
  a90c  108EAB95       LDY #0xab95                       
  a910  170010         LBSR 0xa923                       
LAB_a913:
  a913  108EAB88       LDY #0xab88                       
  a917  1700B7         LBSR 0xa9d1                       
  a91a  108EAB95       LDY #0xab95                       
  a91e  1700B0         LBSR 0xa9d1                       
  a921  35B6           PULS  A B X Y PC                  

; ---- function FUN_a923
FUN_a923:
  a923  3406           PSHS  B A                         
  a925  AEA90002       LDX 0x2,Y                         
  a929  17FDD9         LBSR 0xa705                       
  a92c  1D             SEX                               
  a92d  E3E4           ADDD ,S                           
  a92f  17FD08         LBSR 0xa63a                       
  a932  170235         LBSR 0xab6a                       
  a935  ADB90000       JSR [0x0,Y]                       
  a939  3586           PULS  A B PC                      

; ---- function FUN_a93b
FUN_a93b:
  a93b  3416           PSHS  X B A                       
  a93d  C681           LDB #0x81                         
  a93f  F160FB         CMPB 0x60fb                       
  a942  2736           BEQ 0xa97a                        
  a944  F760FB         STB 0x60fb                        
  a947  8E0286         LDX #0x286                        
  a94a  17FDB8         LBSR 0xa705                       
  a94d  1D             SEX                               
  a94e  FD6074         STD 0x6074                        
  a951  1700C6         LBSR 0xaa1a                       
  a954  171932         LBSR 0xc289                        ; inline[API_FD18]: [$602A]=$A88D [$6070]=$A97C [$6072]=$A994 [$605C]=$A9B1 [$605A]=$A9B1
  a957  602A           addr 602a                         
  a959  A88D           dw A88Dh                          
  a95b  6070           addr 6070                         
  a95d  A97C           dw A97Ch                          
  a95f  6072           addr 6072                         
  a961  A994           dw A994h                          
  a963  605C           addr 605c                         
  a965  A9B1           dw A9B1h                          
  a967  605A           addr 605a                         
  a969  A9B1           dw A9B1h                          
  a96b  FFFF           dw FFFFh                          
LAB_a96d:
  a96d  1743C2         LBSR 0xed32                       
  a970  C602           LDB #0x2                          
  a972  17437A         LBSR 0xecef                       
  a975  C603           LDB #0x3                          
  a977  174375         LBSR 0xecef                       
LAB_a97a:
  a97a  3596           PULS  A B X PC                    

; ---- function FUN_a97c
FUN_a97c:
  a97c  7D604D         TST 0x604d                        
  a97f  2712           BEQ 0xa993                        
  a981  17EE60         LBSR 0x97e4                        ; inline[API_FC38]: "{2:3E}{5:06}{3:60A0}{2:48}{5:06}{3:60A0}"
  a984  023E05060360.. char[15] 02h,">",05h,06h,03h,"`",A0h,02h,"H",05h,06h,03h,"`",A0h
LAB_a993:
  a993  39             RTS                               

; ---- function FUN_a994
FUN_a994:
  a994  3436           PSHS  Y X B A                     
  a996  FC6074         LDD 0x6074                        
  a999  108EABA2       LDY #0xaba2                       
  a99d  1701CA         LBSR 0xab6a                       
  a9a0  ADB90000       JSR [0x0,Y]                       
  a9a4  108EABAF       LDY #0xabaf                       
  a9a8  1701BF         LBSR 0xab6a                       
  a9ab  ADB90000       JSR [0x0,Y]                       
  a9af  2010           BRA 0xa9c1                        

; ---- function FUN_a9b1
FUN_a9b1:
  a9b1  3436           PSHS  Y X B A                     
  a9b3  108EABA2       LDY #0xaba2                       
  a9b7  17FF69         LBSR 0xa923                       
  a9ba  108EABAF       LDY #0xabaf                       
  a9be  17FF62         LBSR 0xa923                       
LAB_a9c1:
  a9c1  108EABA2       LDY #0xaba2                       
  a9c5  170009         LBSR 0xa9d1                       
  a9c8  108EABAF       LDY #0xabaf                       
  a9cc  170002         LBSR 0xa9d1                       
  a9cf  35B6           PULS  A B X Y PC                  

; ---- function FUN_a9d1
FUN_a9d1:
  a9d1  3416           PSHS  X B A                       
  a9d3  AEA90002       LDX 0x2,Y                         
  a9d7  E6A90006       LDB 0x6,Y                         
  a9db  17FC69         LBSR 0xa647                       
  a9de  CB06           ADDB #0x6                         
  a9e0  17EDF0         LBSR 0x97d3                       
  a9e3  AEA9000B       LDX 0xb,Y                         
  a9e7  17FD1B         LBSR 0xa705                       
  a9ea  5D             TSTB                              
  a9eb  270B           BEQ 0xa9f8                        
  a9ed  2A04           BPL 0xa9f3                        
  a9ef  C62D           LDB #0x2d                         
  a9f1  2002           BRA 0xa9f5                        
LAB_a9f3:
  a9f3  C62B           LDB #0x2b                         
LAB_a9f5:
  a9f5  17ED2F         LBSR 0x9727                       
LAB_a9f8:
  a9f8  3596           PULS  A B X PC                    

; ---- function FUN_a9fa
FUN_a9fa:
  a9fa  3426           PSHS  Y B A                       
  a9fc  108EAB88       LDY #0xab88                       
  aa00  17FFCE         LBSR 0xa9d1                       
  aa03  108EAB95       LDY #0xab95                       
  aa07  17FFC7         LBSR 0xa9d1                       
  aa0a  108EABA2       LDY #0xaba2                       
  aa0e  17FFC0         LBSR 0xa9d1                       
  aa11  108EABAF       LDY #0xabaf                       
  aa15  17FFB9         LBSR 0xa9d1                       
  aa18  35A6           PULS  A B Y PC                    

; ---- function FUN_aa1a
FUN_aa1a:
  aa1a  3406           PSHS  B A                         
  aa1c  17E448         LBSR 0x8e67                        ; inline[API_FC16]: 03 10 06 32 01 00 03 00 $0000 $FFD0 $0000 ->$0000 ->$0000 $0001 $0001 $0000
  aa1f  03             db 3h                             
  aa20  10             db 10h                            
  aa21  06             db 6h                             
  aa22  32             db 32h                            
  aa23  01             db 1h                             
  aa24  00             db 0h                             
  aa25  03             db 3h                             
  aa26  00             db 0h                             
  aa27  0000           dw 0h                             
  aa29  FFD0           dw FFD0h                          
  aa2b  0000           dw 0h                             
  aa2d  0000           addr 0000                         
  aa2f  0000           addr 0000                         
  aa31  0001           dw 1h                             
  aa33  0001           dw 1h                             
  aa35  0000           dw 0h                             
LAB_aa37:
  aa37  3586           PULS  A B PC                      

; ---- function FUN_aa39
FUN_aa39:
  aa39  3406           PSHS  B A                         
  aa3b  C682           LDB #0x82                         
  aa3d  F160FB         CMPB 0x60fb                       
  aa40  270D           BEQ 0xaa4f                        
  aa42  F760FB         STB 0x60fb                        
  aa45  108EAB88       LDY #0xab88                       
  aa49  1700C9         LBSR 0xab15                       
  aa4c  1700F1         LBSR 0xab40                       
LAB_aa4f:
  aa4f  3586           PULS  A B PC                      

; ---- function FUN_aa51
FUN_aa51:
  aa51  3436           PSHS  Y X B A                     
  aa53  108EAB88       LDY #0xab88                       
  aa57  1700F8         LBSR 0xab52                       
  aa5a  8D02           BSR 0xaa5e                        
  aa5c  35B6           PULS  A B X Y PC                  

; ---- function FUN_aa5e
FUN_aa5e:
  aa5e  3416           PSHS  X B A                       
  aa60  FC60F9         LDD 0x60f9                        
  aa63  FD6074         STD 0x6074                        
  aa66  10BF60C2       STY 0x60c2                        
  aa6a  ADB90000       JSR [0x0,Y]                       
  aa6e  17FF60         LBSR 0xa9d1                       
  aa71  3596           PULS  A B X PC                    

; ---- function FUN_aa73
FUN_aa73:
  aa73  3406           PSHS  B A                         
  aa75  C683           LDB #0x83                         
  aa77  F160FB         CMPB 0x60fb                       
  aa7a  270D           BEQ 0xaa89                        
  aa7c  F760FB         STB 0x60fb                        
  aa7f  108EAB95       LDY #0xab95                       
  aa83  17008F         LBSR 0xab15                       
  aa86  1700B7         LBSR 0xab40                       
LAB_aa89:
  aa89  3586           PULS  A B PC                      

; ---- function FUN_aa8b
FUN_aa8b:
  aa8b  3436           PSHS  Y X B A                     
  aa8d  108EAB95       LDY #0xab95                       
  aa91  1700BE         LBSR 0xab52                       
  aa94  8DC8           BSR 0xaa5e                        
  aa96  35B6           PULS  A B X Y PC                  

; ---- function FUN_aa98
FUN_aa98:
  aa98  3406           PSHS  B A                         
  aa9a  C684           LDB #0x84                         
  aa9c  F160FB         CMPB 0x60fb                       
  aa9f  270D           BEQ 0xaaae                        
  aaa1  F760FB         STB 0x60fb                        
  aaa4  108EABA2       LDY #0xaba2                       
  aaa8  17006A         LBSR 0xab15                       
  aaab  170092         LBSR 0xab40                       
LAB_aaae:
  aaae  3586           PULS  A B PC                      

; ---- function FUN_aab0
FUN_aab0:
  aab0  3436           PSHS  Y X B A                     
  aab2  108EABA2       LDY #0xaba2                       
  aab6  170099         LBSR 0xab52                       
  aab9  8DA3           BSR 0xaa5e                        
  aabb  35B6           PULS  A B X Y PC                  

; ---- function FUN_aabd
FUN_aabd:
  aabd  3406           PSHS  B A                         
  aabf  C685           LDB #0x85                         
  aac1  F160FB         CMPB 0x60fb                       
  aac4  270D           BEQ 0xaad3                        
  aac6  F760FB         STB 0x60fb                        
  aac9  108EABAF       LDY #0xabaf                       
  aacd  170045         LBSR 0xab15                       
  aad0  17006D         LBSR 0xab40                       
LAB_aad3:
  aad3  3586           PULS  A B PC                      

; ---- function FUN_aad5
FUN_aad5:
  aad5  3436           PSHS  Y X B A                     
  aad7  108EABAF       LDY #0xabaf                       
  aadb  170074         LBSR 0xab52                       
  aade  17FF7D         LBSR 0xaa5e                       
  aae1  35B6           PULS  A B X Y PC                  

; ---- function FUN_aae3
FUN_aae3:
  aae3  3406           PSHS  B A                         
  aae5  10BE60C2       LDY 0x60c2                        
  aae9  E6A90006       LDB 0x6,Y                         
  aaed  17ECE3         LBSR 0x97d3                       
  aaf0  7D604D         TST 0x604d                        
  aaf3  2709           BEQ 0xaafe                        
  aaf5  17ECEC         LBSR 0x97e4                        ; inline[API_FC38]: "{5:06}{3:60A0}"
  aaf8  05060360A000   char[6] 05h,06h,03h,"`",A0h       
LAB_aafe:
  aafe  3586           PULS  A B PC                      

; ---- function FUN_ab00
FUN_ab00:
  ab00  3416           PSHS  X B A                       
  ab02  10BE60C2       LDY 0x60c2                        
  ab06  FC6074         LDD 0x6074                        
  ab09  17005E         LBSR 0xab6a                       
  ab0c  ADB90000       JSR [0x0,Y]                       
  ab10  17FEBE         LBSR 0xa9d1                       
  ab13  3596           PULS  A B X PC                    

; ---- function FUN_ab15
FUN_ab15:
  ab15  10BF60C2       STY 0x60c2                        
  ab19  AEA90002       LDX 0x2,Y                         
  ab1d  17FBE5         LBSR 0xa705                       
  ab20  1D             SEX                               
  ab21  FD6074         STD 0x6074                        
  ab24  17E340         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 32 01 00 03 00 $0000 $FFD0 $0000 ->$FFAE ->$FFC9 $0001 $0001 $0000
  ab27  01             db 1h                             
  ab28  10             db 10h                            
  ab29  02             db 2h                             
  ab2a  32             db 32h                            
  ab2b  01             db 1h                             
BYTE_ab2c:
  ab2c  00             db 0h                             
  ab2d  03             db 3h                             
  ab2e  00             db 0h                             
  ab2f  0000           dw 0h                             
  ab31  FFD0           dw FFD0h                          
  ab33  0000           dw 0h                             
  ab35  FFAE           addr ffae                         
  ab37  FFC9           addr ffc9                         
  ab39  0001           dw 1h                             
  ab3b  0001           dw 1h                             
  ab3d  0000           dw 0h                             
LAB_ab3f:
  ab3f  39             RTS                               

; ---- function FUN_ab40
FUN_ab40:
  ab40  3404           PSHS  B                           
  ab42  E6A90006       LDB 0x6,Y                         
  ab46  1741E9         LBSR 0xed32                       
  ab49  E6A90007       LDB 0x7,Y                         
  ab4d  17419F         LBSR 0xecef                       
  ab50  3584           PULS  B PC                        

; ---- function FUN_ab52
FUN_ab52:
  ab52  E6A9000A       LDB 0xa,Y                         
  ab56  F160FB         CMPB 0x60fb                       
  ab59  270E           BEQ 0xab69                        
  ab5b  17FCA9         LBSR 0xa807                       
  ab5e  E6A90007       LDB 0x7,Y                         
  ab62  F760B9         STB 0x60b9                        
  ab65  ADB90008       JSR [0x8,Y]                       
LAB_ab69:
  ab69  39             RTS                               

; ---- function FUN_ab6a
FUN_ab6a:
  ab6a  3436           PSHS  Y X B A                     
  ab6c  3404           PSHS  B                           
  ab6e  AEA90002       LDX 0x2,Y                         
  ab72  17FB90         LBSR 0xa705                       
  ab75  E1E4           CMPB ,S                           
  ab77  270B           BEQ 0xab84                        
  ab79  E6E4           LDB ,S                            
  ab7b  1D             SEX                               
  ab7c  10AEA90004     LDY 0x4,Y                         
  ab81  174A2D         LBSR 0xf5b1                       
LAB_ab84:
  ab84  3504           PULS  B                           
  ab86  35B6           PULS  A B X Y PC                  
DAT_ab88:
  ab88  A590           undefined2 A590h                  
  ab8a  .db 02 84 20 00 2A 00 AA 39 82 00 19                 ; .. .*..9...
DAT_ab95:
  ab95  A5CD           undefined2 A5CDh                  
  ab97  .db 02 85 20 01 34 01 AA 73 83 00 1A                 ; .. .4..s...
DAT_aba2:
  aba2  A5D5           undefined2 A5D5h                  
  aba4  .db 02 86 20 02 3E 02 AA 98 84 00 1B                 ; .. .>......
DAT_abaf:
  abaf  A5DD           undefined2 A5DDh                  
  abb1  .db 02 87 20 03 48 03 AA BD 85 00 1C 17 EF 0B 39     ; .. .H.........9

; ---- function FUN_abc0
FUN_abc0:
  abc0  3406           PSHS  B A                         
  abc2  86FF           LDA #0xff                         
  abc4  B760FB         STA 0x60fb                        
  abc7  170005         LBSR 0xabcf                       
  abca  170104         LBSR 0xacd1                       
  abcd  3586           PULS  A B PC                      

; ---- function API_FC88
API_FC88:
  abcf  17EBD7         LBSR 0x97a9                       
  abd2  1716B4         LBSR 0xc289                        ; inline[API_FD18]: [$602A]=$A7F9 [$602E]=$AD71 [$6030]=$FBDA [$602C]=$ABBC [$603C]=$FFE8 [$603E]=$FFE8 [$6040]=$FFE8 [$6042]=$FFE8 [$6038]=$FFE8 [$6036]=$FFE8 [$603A]=$ABC0 [$605C]=$FFE8 [$605A]=$FFE8 [$606A]=$FFE8 [$6072]=$FFE8 [$6070]=$FFE8
  abd5  602A           addr 602a                         
  abd7  A7F9           dw A7F9h                          
  abd9  602E           addr 602e                         
  abdb  AD71           dw AD71h                          
  abdd  6030           addr 6030                         
  abdf  FBDA           dw FBDAh                          
  abe1  602C           addr 602c                         
  abe3  ABBC           dw ABBCh                          
  abe5  603C           addr 603c                         
  abe7  FFE8           dw FFE8h                          
  abe9  603E           addr 603e                         
  abeb  FFE8           dw FFE8h                          
  abed  6040           addr 6040                         
  abef  FFE8           dw FFE8h                          
  abf1  6042           addr 6042                         
  abf3  FFE8           dw FFE8h                          
  abf5  6038           addr 6038                         
  abf7  FFE8           dw FFE8h                          
  abf9  6036           addr 6036                         
  abfb  FFE8           dw FFE8h                          
  abfd  603A           addr 603a                         
  abff  ABC0           dw ABC0h                          
  ac01  605C           addr 605c                         
  ac03  FFE8           dw FFE8h                          
  ac05  605A           addr 605a                         
  ac07  FFE8           dw FFE8h                          
  ac09  606A           addr 606a                         
  ac0b  FFE8           dw FFE8h                          
  ac0d  6072           addr 6072                         
  ac0f  FFE8           dw FFE8h                          
  ac11  6070           addr 6070                         
  ac13  FFE8           dw FFE8h                          
  ac15  FFFF           dw FFFFh                          
LAB_ac17:
  ac17  39             RTS                               

; ---- function API_FDD4
API_FDD4:
  ac18  17EBC9         LBSR 0x97e4                        ; inline[API_FC38]: "{2:28}{5:28}"
  ac1b  0228052800     char[5] 02h,"(",05h,"("           
LAB_ac20:
  ac20  171666         LBSR 0xc289                        ; inline[API_FD18]: [$603C]=$FFE8 [$603E]=$FFE8 [$6040]=$FFE8 [$6042]=$FFE8
  ac23  603C           addr 603c                         
  ac25  FFE8           dw FFE8h                          
  ac27  603E           addr 603e                         
  ac29  FFE8           dw FFE8h                          
  ac2b  6040           addr 6040                         
  ac2d  FFE8           dw FFE8h                          
  ac2f  6042           addr 6042                         
  ac31  FFE8           dw FFE8h                          
  ac33  FFFF           dw FFFFh                          
LAB_ac35:
  ac35  39             RTS                               

; ---- function API_FE3C
API_FE3C:
  ac36  3416           PSHS  X B A                       
  ac38  AE64           LDX 0x4,S                         
  ac3a  EC81           LDD ,X++                          
  ac3c  FD61A2         STD 0x61a2                        
  ac3f  EC81           LDD ,X++                          
  ac41  FD61A4         STD 0x61a4                        
  ac44  AF64           STX 0x4,S                         
  ac46  C601           LDB #0x1                          
  ac48  170027         LBSR 0xac72                        ; inline[API_FC8A]: ->$AC6A(rel) "(  Yes   )"
  ac4b  001F           dw 1Fh                            
  ac4d  282020596573.. ds "(  Yes   )"                   
LAB_ac57:
  ac57  C602           LDB #0x2                          
  ac59  170016         LBSR 0xac72                        ; inline[API_FC8A]: ->$AC6E(rel) "(   No   )"
  ac5c  0012           dw 12h                            
  ac5e  282020204E6F.. ds "(   No   )"                   
LAB_ac68:
  ac68  3596           PULS  A B X PC                    

; ---- function FUN_ac6a
FUN_ac6a:
  ac6a  6E9F61A2       JMP [0x61a2]                      

; ---- function FUN_ac6e
FUN_ac6e:
  ac6e  6E9F61A4       JMP [0x61a4]                      

;; Kernel API slot $FC8A: B = key 0-3; inline handler + 10-char label

; ---- function SoftKeyDefine
SoftKeyDefine:
  ac72  3437           PSHS  Y X B A CC                  
  ac74  C403           ANDB #0x3                         
  ac76  3604           PSHU  B                           
  ac78  58             LSLB                              
  ac79  108E603C       LDY #0x603c                       
  ac7d  31A5           LEAY B,Y                          
  ac7f  AE67           LDX 0x7,S                         
  ac81  1F10           TFR X,D                           
  ac83  E381           ADDD ,X++                         
  ac85  EDA4           STD ,Y                            
  ac87  E6C4           LDB ,U                            
  ac89  860A           LDA #0xa                          
  ac8b  3D             MUL                               
  ac8c  CB28           ADDB #0x28                        
  ac8e  17EB42         LBSR 0x97d3                       
  ac91  C60A           LDB #0xa                          
  ac93  17EBBD         LBSR 0x9853                       
  ac96  17F023         LBSR 0x9cbc                        ; inline[API_FDD6]: $6021
  ac99  6021           addr 6021                         
LAB_ac9b:
  ac9b  AF67           STX 0x7,S                         
  ac9d  3341           LEAU 0x1,U                        
  ac9f  35B7           PULS CC A B X Y PC                
  aca1  .db 39                                               ; 9

; ---- function API_FC8C
API_FC8C:
  aca2  3437           PSHS  Y X B A CC                  
  aca4  F661A6         LDB 0x61a6                        
  aca7  174D76         LBSR 0xfa20                       
  acaa  7D60B8         TST 0x60b8                        
  acad  261D           BNE 0xaccc                        
  acaf  86FF           LDA #0xff                         
  acb1  B760B8         STA 0x60b8                        
  acb4  8EACF5         LDX #0xacf5                       
  acb7  108E6800       LDY #0x6800                       
  acbb  171624         LBSR 0xc2e2                       
  acbe  C600           LDB #0x0                          
  acc0  17EB10         LBSR 0x97d3                       
  acc3  C650           LDB #0x50                         
  acc5  17EB99         LBSR 0x9861                       
  acc8  AD9F60ED       JSR [0x60ed]                      
LAB_accc:
  accc  174D6B         LBSR 0xfa3a                       
  accf  35B7           PULS CC A B X Y PC                

; ---- function API_FC8E
API_FC8E:
  acd1  3437           PSHS  Y X B A CC                  
  acd3  7D60B8         TST 0x60b8                        
  acd6  271B           BEQ 0xacf3                        
  acd8  7F60B8         CLR 0x60b8                        
  acdb  108EACF5       LDY #0xacf5                       
  acdf  8E6800         LDX #0x6800                       
  ace2  17162B         LBSR 0xc310                       
  ace5  C600           LDB #0x0                          
  ace7  17EAE9         LBSR 0x97d3                       
  acea  C650           LDB #0x50                         
  acec  17EB64         LBSR 0x9853                       
  acef  AD9F60EF       JSR [0x60ef]                      
LAB_acf3:
  acf3  35B7           PULS CC A B X Y PC                
  acf5  .db 60 3C 02 60 3E 02 60 40 02 60 42 02 60 E3 02 60  ; `<.`>.`@.`B.`..`
  ad05  .db E5 02 60 E7 02 60 E9 02 60 3A 02 60 64 02 60 62  ; ..`..`..`:.`d.`b
  ad15  .db 02 60 66 01 60 5C 02 60 38 02 60 36 02 60 54 02  ; .`f.`\.`8.`6.`T.
  ad25  .db 60 56 02 60 58 02 60 5A 02 60 60 02 60 67 02 60  ; `V.`X.`Z.``.`g.`
  ad35  .db 68 02 60 69 02 60 6A 02 60 6E 02 60 6C 02 60 74  ; h.`i.`j.`n.`l.`t
  ad45  .db 02 60 70 02 60 72 02 60 99 01 60 BA 01 60 BB 02  ; .`p.`r.`..`..`..
  ad55  .db 60 DC 02 60 DE 02 60 E0 02 60 21 01 60 22 01 60  ; `..`..`..`!.`".`
  ad65  .db 23 01 60 0B 01 61 02 01 FF FF 00 00 34 06 F6 60  ; #.`..a......4..`
  ad75  .db 0B F7 61 A6 17 FF 26 8E 00 00 17 F9 99 17 F0 48  ; ..a...&........H
  ad85  .db 17 01 5F FD 61 A7 CC AD 93 17 ED A5 35 86 00 19  ; .._.a.......5...
  ad95  .db 01 D4 02 A8 03 0D 00 00 03 7F 04 4D 03 B5 03 E1  ; ...........M....
  ada5  .db 00 04 FF FF 16 1A 36 34 36 C6 A0 F7 60 FB 17 FE  ; ......646...`...
  adb5  .db 19 CC 9B C8 FD 60 36 CC 9B EC FD 60 2E 17 FE 53  ; .....`6....`...S
  adc5  .db 17 EA 1C 02 00                                   ; .....
  adca  53656C656374.. ds "Selected Program : "          
  adde  .db FC 61 A7 17 01 03 FD 61 A7 FD 60 62 FD 60 54 CC  ; .a.....a..`b.`T.
  adee  .db 03 E8 FD 60 64 FD 60 56 FC 61 A7 FD 60 74 17 14  ; ...`d.`V.a..`t..
  adfe  .db 8A 60 6C 03 E7 60 6E 00 00 60 DE 00 01 60 DC 00  ; .`l..`n..`...`..
  ae0e  .db 01 60 E0 00 96 FF FF 17 14 A0 60 70 00 00 60 72  ; .`........`p..`r
  ae1e  .db 00 00 60 6A 00 80 60 5C 00 DE 60 5A 00 B4 FF FF  ; ..`j..`\..`Z....
  ae2e  .db 17 14 6F 60 66 01 60 67 20 60 58 02 60 68 04 60  ; ..o`f.`g `X.`h.`
  ae3e  .db 99 00 60 69 03 FF FF 17 E2 F0 17 E6 BE 17 DE 18  ; ..`i............
  ae4e  .db 17 00 05 17 00 2C 35 B6 34 06 FC 61 A7 10 83 03  ; .....,5.4..a....
  ae5e  .db E8 27 18 17 EF 91 17 DB A1 F7 61 AC 10 BF 61 AD  ; .'........a...a.
  ae6e  .db FC 60 7D FD 61 AF 7F 61 AB 20 05 86 FF B7 61 AB  ; .`}.a..a. ....a.
  ae7e  .db 35 86 34 06 C6 13 17 E9 4C 7D 61 AB 26 05 17 F2  ; 5.4.....L}a.&...
  ae8e  .db B8 20 0F 17 E9 50 4C 61 73 74 20 45 64 69 74 05  ; . ...PLast Edit.
  ae9e  .db 0C 00 35 86 34 36 F6 60 FD C1 0C 27 26 FC 60 74  ; ..5.46.`...'&.`t
  aeae  .db 17 EF 0F 27 58 FC 60 74 36 06 17 E9 29 02 28 05  ; ...'X.`t6...).(.
  aebe  .db 28 02 13 05 15 5B 04 20 00 03 60 AA 5D 00 17 FD  ; (....[. ..`.]...
  aece  .db 49 35 B6 FC 60 74 17 EE E9 26 03 17 00 A9 35 B6  ; I5..`t...&....5.
  aede  .db 34 36 FC 60 54 8D 16 20 24 17 EE D6 27 0E 10 B3  ; 46.`T.. $...'...
  aeee  .db 61 A7 25 05 17 00 2A 20 03 17 00 45 39 8D EA FD  ; a.%...* ...E9...
  aefe  .db 60 74 17 E2 35 39 34 36 FC 60 62 8D F0 FD 60 54  ; `t..5946.`b...`T
  af0e  .db FD 60 62 FD 61 A7 17 FF 3F 17 FF 66 17 EC A1 35  ; .`b.a...?..f...5
  af1e  .db B6                                               ; .

; ---- function FUN_af1f
FUN_af1f:
  af1f  3406           PSHS  B A                         
  af21  8D3C           BSR 0xaf5f                        
  af23  2717           BEQ 0xaf3c                        
  af25  108303E8       CMPD #0x3e8                       
  af29  270D           BEQ 0xaf38                        
LAB_af2b:
  af2b  C30001         ADDD #0x1                         
  af2e  8D2F           BSR 0xaf5f                        
  af30  270A           BEQ 0xaf3c                        
  af32  108303E8       CMPD #0x3e8                       
  af36  25F3           BCS 0xaf2b                        
LAB_af38:
  af38  ECE4           LDD ,S                            
  af3a  8D03           BSR 0xaf3f                        
LAB_af3c:
  af3c  3262           LEAS 0x2,S                        
  af3e  39             RTS                               

; ---- function FUN_af3f
FUN_af3f:
  af3f  3406           PSHS  B A                         
  af41  8D1C           BSR 0xaf5f                        
  af43  2717           BEQ 0xaf5c                        
  af45  10830000       CMPD #0x0                         
  af49  270D           BEQ 0xaf58                        
LAB_af4b:
  af4b  C3FFFF         ADDD #0xffff                      
  af4e  8D0F           BSR 0xaf5f                        
  af50  270A           BEQ 0xaf5c                        
  af52  10830000       CMPD #0x0                         
  af56  26F3           BNE 0xaf4b                        
LAB_af58:
  af58  ECE4           LDD ,S                            
  af5a  8DC3           BSR 0xaf1f                        
LAB_af5c:
  af5c  3262           LEAS 0x2,S                        
  af5e  39             RTS                               

; ---- function FUN_af5f
FUN_af5f:
  af5f  17EE5E         LBSR 0x9dc0                       
  af62  2704           BEQ 0xaf68                        
  af64  108303E8       CMPD #0x3e8                       
LAB_af68:
  af68  39             RTS                               

; ---- function FUN_af69
FUN_af69:
  af69  3416           PSHS  X B A                       
  af6b  F660B9         LDB 0x60b9                        
  af6e  17FD01         LBSR 0xac72                        ; inline[API_FC8A]: ->$AF85(rel) "(  Load  )"
  af71  0014           dw 14h                            
  af73  2820204C6F61.. ds "(  Load  )"                   
LAB_af7d:
  af7d  CCAF85         LDD #0xaf85                       
  af80  FD6038         STD 0x6038                        
  af83  3596           PULS  A B X PC                    

; ---- function FUN_af85
FUN_af85:
  af85  3416           PSHS  X B A                       
  af87  17E85A         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Loading Program ..."
  af8a  014C6F616469.. char[21] 01h,"Loading Program ..."
LAB_af9f:
  af9f  7D61AB         TST 0x61ab                        
  afa2  265E           BNE 0xb002                        
  afa4  FC61A7         LDD 0x61a7                        
  afa7  174786         LBSR 0xf730                       
  afaa  170060         LBSR 0xb00d                       
  afad  F661AC         LDB 0x61ac                        
  afb0  F76079         STB 0x6079                        
  afb3  FC61AF         LDD 0x61af                        
  afb6  FD607D         STD 0x607d                        
  afb9  FC61AD         LDD 0x61ad                        
  afbc  FD607A         STD 0x607a                        
  afbf  17EE6A         LBSR 0x9e2c                       
  afc2  2607           BNE 0xafcb                        
LAB_afc4:
  afc4  17F23F         LBSR 0xa206                       
  afc7  261E           BNE 0xafe7                        
LAB_afc9:
  afc9  3596           PULS  A B X PC                    
LAB_afcb:
  afcb  17E816         LBSR 0x97e4                        ; inline[API_FC38]: "{1}rom preset missing"
  afce  01726F6D2070.. char[20] 01h,"rom preset missing" 
LAB_afe2:
  afe2  17FBEA         LBSR 0xabcf                       
  afe5  20E2           BRA 0xafc9                        
LAB_afe7:
  afe7  17E7FA         LBSR 0x97e4                        ; inline[API_FC38]: "{1}algorithm missing"
  afea  01616C676F72.. char[19] 01h,"algorithm missing"  
LAB_affd:
  affd  17FBCF         LBSR 0xabcf                       
  b000  20C7           BRA 0xafc9                        
LAB_b002:
  b002  FC61A7         LDD 0x61a7                        
  b005  174728         LBSR 0xf730                       
  b008  17001B         LBSR 0xb026                       
  b00b  20B7           BRA 0xafc4                        

; ---- function FUN_b00d
FUN_b00d:
  b00d  3436           PSHS  Y X B A                     
  b00f  C6A0           LDB #0xa0                         
  b011  174A0C         LBSR 0xfa20                       
  b014  CC0180         LDD #0x180                        
  b017  8E0000         LDX #0x0                          
  b01a  108E7C00       LDY #0x7c00                       
  b01e  171167         LBSR 0xc188                       
  b021  174A16         LBSR 0xfa3a                       
  b024  35B6           PULS  A B X Y PC                  

; ---- function FUN_b026
FUN_b026:
  b026  3436           PSHS  Y X B A                     
  b028  C6A0           LDB #0xa0                         
  b02a  1749F3         LBSR 0xfa20                       
  b02d  CC0180         LDD #0x180                        
  b030  8E0000         LDX #0x0                          
  b033  108E7C00       LDY #0x7c00                       
  b037  171205         LBSR 0xc23f                       
  b03a  1749FD         LBSR 0xfa3a                       
  b03d  35B6           PULS  A B X Y PC                  

; ---- function FUN_b03f
FUN_b03f:
  b03f  17FC30         LBSR 0xac72                        ; inline[API_FC8A]: ->$B04F(rel) "( Origin )"
  b042  000D           dw Dh                             
  b044  28204F726967.. ds "( Origin )"                   
LAB_b04e:
  b04e  39             RTS                               

; ---- function FUN_b04f
FUN_b04f:
  b04f  3416           PSHS  X B A                       
  b051  FC61A7         LDD 0x61a7                        
  b054  108303E8       CMPD #0x3e8                       
  b058  2745           BEQ 0xb09f                        
  b05a  FC60C6         LDD 0x60c6                        
LAB_b05d:
  b05d  5F             CLRB                              
  b05e  17E783         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Original Program :"
  b061  014F72696769.. char[20] 01h,"Original Program :" 
LAB_b075:
  b075  17D7E5         LBSR 0x885d                       
  b078  2605           BNE 0xb07f                        
  b07a  17F0CA         LBSR 0xa147                       
  b07d  2018           BRA 0xb097                        
LAB_b07f:
  b07f  17E762         LBSR 0x97e4                        ; inline[API_FC38]: "{1}No Original Program"
  b082  014E6F204F72.. char[21] 01h,"No Original Program"
LAB_b097:
  b097  17E078         LBSR 0x9112                       
  b09a  17EAC3         LBSR 0x9b60                       
  b09d  3596           PULS  A B X PC                    
LAB_b09f:
  b09f  F67C00         LDB 0x7c00                        
  b0a2  1F98           TFR B,A                           
  b0a4  20B7           BRA 0xb05d                        

; ---- function FUN_b0a6
FUN_b0a6:
  b0a6  3416           PSHS  X B A                       
  b0a8  F661AC         LDB 0x61ac                        
  b0ab  174972         LBSR 0xfa20                       
  b0ae  BE61AD         LDX 0x61ad                        
  b0b1  E605           LDB 0x5,X                         
  b0b3  C401           ANDB #0x1                         
  b0b5  2717           BEQ 0xb0ce                        
  b0b7  174980         LBSR 0xfa3a                       
  b0ba  F660B9         LDB 0x60b9                        
  b0bd  17FBB2         LBSR 0xac72                        ; inline[API_FC8A]: ->$B0D3(rel) "( Remove )"
  b0c0  0013           dw 13h                            
  b0c2  282052656D6F.. ds "( Remove )"                   
LAB_b0cc:
  b0cc  2003           BRA 0xb0d1                        
LAB_b0ce:
  b0ce  174969         LBSR 0xfa3a                       
LAB_b0d1:
  b0d1  3596           PULS  A B X PC                    

; ---- function FUN_b0d3
FUN_b0d3:
  b0d3  3416           PSHS  X B A                       
  b0d5  17E70C         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Remove Preset "
  b0d8  0152656D6F76.. char[16] 01h,"Remove Preset "     
LAB_b0e8:
  b0e8  FC61A7         LDD 0x61a7                        
  b0eb  17ED07         LBSR 0x9df5                       
  b0ee  17D76C         LBSR 0x885d                       
  b0f1  17F053         LBSR 0xa147                       
  b0f4  C63F           LDB #0x3f                         
  b0f6  17E62E         LBSR 0x9727                       
  b0f9  17FB3A         LBSR 0xac36                        ; inline[API_FE3C]: $B102 $B118
  b0fc  B102           dw B102h                          
  b0fe  B118           dw B118h                          
LAB_b100:
  b100  3596           PULS  A B X PC                    

; ---- function FUN_b102
FUN_b102:
  b102  3416           PSHS  X B A                       
  b104  FC61A7         LDD 0x61a7                        
  b107  8E6A00         LDX #0x6a00                       
  b10a  17ECE8         LBSR 0x9df5                       
  b10d  17DA54         LBSR 0x8b64                       
  b110  17EC65         LBSR 0x9d78                       
  b113  17EB2C         LBSR 0x9c42                       
  b116  3596           PULS  A B X PC                    

; ---- function FUN_b118
FUN_b118:
  b118  17EB27         LBSR 0x9c42                       
  b11b  39             RTS                               

; ---- function FUN_b11c
FUN_b11c:
  b11c  3436           PSHS  Y X B A                     
  b11e  C6A2           LDB #0xa2                         
  b120  F760FB         STB 0x60fb                        
  b123  17FAA9         LBSR 0xabcf                       
  b126  CC9BC8         LDD #0x9bc8                       
  b129  FD6036         STD 0x6036                        
  b12c  FD605C         STD 0x605c                        
  b12f  FD6032         STD 0x6032                        
  b132  FD6034         STD 0x6034                        
  b135  CC9BEC         LDD #0x9bec                       
  b138  FD602E         STD 0x602e                        
  b13b  17E6A6         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Current Edit :"
  b13e  014375727265.. char[16] 01h,"Current Edit :"     
LAB_b14e:
  b14e  17EE77         LBSR 0x9fc8                       
  b151  17EFB4         LBSR 0xa108                       
  b154  35B6           PULS  A B X Y PC                  

; ---- function FUN_b156
FUN_b156:
  b156  17FB19         LBSR 0xac72                        ; inline[API_FC8A]: ->$B166(rel) "(  Save  )"
  b159  000D           dw Dh                             
  b15b  282020536176.. ds "(  Save  )"                   
LAB_b165:
  b165  39             RTS                               

; ---- function FUN_b166
FUN_b166:
  b166  17EED9         LBSR 0xa042                       
  b169  10270540       LBEQ 0xb6ad                       
  b16d  17E674         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Memory Full"
  b170  014D656D6F72.. char[13] 01h,"Memory Full"        
LAB_b17d:
  b17d  17DF92         LBSR 0x9112                       
  b180  17E9DD         LBSR 0x9b60                       
  b183  39             RTS                               
  b184  .db 7D 61 9B 26 0F 17 FA E6 00 0D 28 20 55 70 64 61  ; }a.&......( Upda
  b194  .db 74 65 20 29 39 34 16 17 EE 8A 26 23 17 E6 41 01  ; te )94....&#..A.
  b1a4  4F7665727772.. ds "Overwrite Program "           
  b1b7  .db 17 EF 4E 17 FA 79 B1 C8 B1 E8 35 96 17 FF A7 20  ; ..N..y....5.... 
  b1c7  .db F9 17 E6 19 01                                   ; .....
  b1cc  557064617469.. ds "Updating Program ... "        
  b1e2  .db 17 EE FC 17 EB 90 17 EA 57 39 17 FA 83 00 0D 28  ; ........W9.....(
  b1f2  .db 20 20 49 6E 66 6F 20 20 29 39 34 36 17 E5 E3 01  ;   Info  )946....
  b202  .db 41                                               ; A

; ---- function FUN_b203
FUN_b203:
  b203  6D6F           TST 0xf,S                         
  b205  .db 75 6E 74 20 6F 66 20 62 79 74 65 73 20 61 76 61  ; unt of bytes ava
  b215  .db 69 6C 61 62 6C 65 20 69 73 20 00 FC 61 99 36 06  ; ilable is ..a.6.
  b225  .db FC 61 97 36 06 FC 60 BD 36 06 17 E5 B2 04 20 00  ; .a.6..`.6..... .
  b235  .db 03 60 A7 02 28 53 61 76 65 20 6E 65 65 64 73 20  ; .`..(Save needs 
  b245  .db 04 20 00 03 60 A7 00 7D 61 9B 26 1B 17 E5 90 02  ; . ..`..}a.&.....
  b255  .db 3C 55 70 64 61 74 65 20 6E 65 65 64 73 20 04 00  ; <Update needs ..
  b265  .db 00 03 60 A7 00 20 02 37 06 17 DE A1 17 E8 EC 35  ; ..`.. .7.......5
  b275  .db B6                                               ; .

; ---- function FUN_b276
FUN_b276:
  b276  17F9F9         LBSR 0xac72                        ; inline[API_FC8A]: ->$B286(rel) "(  Map   )"
  b279  000D           dw Dh                             
  b27b  2820204D6170.. ds "(  Map   )"                   
LAB_b285:
  b285  39             RTS                               

; ---- function FUN_b286
FUN_b286:
  b286  3416           PSHS  X B A                       
  b288  CC0000         LDD #0x0                          
  b28b  C6A3           LDB #0xa3                         
  b28d  F760FB         STB 0x60fb                        
  b290  CC9BC8         LDD #0x9bc8                       
  b293  FD6036         STD 0x6036                        
  b296  F761B1         STB 0x61b1                        
  b299  4F             CLRA                              
  b29a  FD6074         STD 0x6074                        
  b29d  CCB2AD         LDD #0xb2ad                       
  b2a0  17E96A         LBSR 0x9c0d                       
  b2a3  C600           LDB #0x0                          
  b2a5  F760B9         STB 0x60b9                        
  b2a8  17014C         LBSR 0xb3f7                       
  b2ab  3596           PULS  A B X PC                    
  b2ad  .db 00 0C 01 38 00 15 02 73 00 00 FF FF 34 16 7F 61  ; ...8...s....4..a
  b2bd  .db B1 CC 9C 2E FD 60 30 35 96 17 F9 A9 00 0D 28 20  ; .....`05......( 
  b2cd  .db 20 4E 61 6D 65 20 20 29 39 34 36 C6 A4 F7 60 FB  ;  Name  )946...`.
  b2dd  .db CC 9B C8 FD 60 36 17 3A 4C F6 60 B9 17 3A 03 F6  ; ....`6.:L.`..:..
  b2ed  .db 61 B1 17 01 F6 10 83 0F FF 26 03 CC 03 E8 FD 61  ; a........&.....a
  b2fd  .db A7 FD 60 62 FD 60 54                             ; ..`b.`T

; ---- function FUN_b304
FUN_b304:
  b304  CC03E8         LDD #0x3e8                        
  b307  FD6064         STD 0x6064                        
  b30a  FD6056         STD 0x6056                        
  b30d  FC61A7         LDD 0x61a7                        
  b310  FD6074         STD 0x6074                        
  b313  170F73         LBSR 0xc289                        ; inline[API_FD18]: [$606C]=$03E7 [$606E]=$0000 [$60DE]=$0001 [$60DC]=$0001 [$60E0]=$0096
  b316  606C           addr 606c                         
  b318  03E7           dw 3E7h                           
  b31a  606E           addr 606e                         
  b31c  0000           dw 0h                             
  b31e  60DE           addr 60de                         
  b320  0001           dw 1h                             
  b322  60DC           addr 60dc                         
  b324  0001           dw 1h                             
  b326  60E0           addr 60e0                         
  b328  0096           dw 96h                            
  b32a  FFFF           dw FFFFh                          
LAB_b32c:
  b32c  170F89         LBSR 0xc2b8                        ; inline[addr:C2B8]: [$6070]=default [$6072]=default [$606A]=->$B36A(rel) [$605C]=->$B3B5(rel) [$605A]=->$B392(rel)
  b32f  6070           addr 6070                         
  b331  0000           dw 0h                             
  b333  6072           addr 6072                         
  b335  0000           dw 0h                             
  b337  606A           addr 606a                         
  b339  0031           dw 31h                            
  b33b  605C           addr 605c                         
  b33d  0078           dw 78h                            
  b33f  605A           addr 605a                         
  b341  0051           dw 51h                            
  b343  FFFF           dw FFFFh                          
LAB_b345:
  b345  170F58         LBSR 0xc2a0                        ; inline[API_FD1A]: [$6066]=$01 [$6067]=$20 [$6058]=$02 [$6068]=$04 [$6099]=$00 [$6069]=$03
  b348  6066           addr 6066                         
  b34a  01             db 1h                             
  b34b  6067           addr 6067                         
  b34d  20             db 20h                            
  b34e  6058           addr 6058                         
  b350  02             db 2h                             
  b351  6068           addr 6068                         
  b353  04             db 4h                             
  b354  6099           addr 6099                         
  b356  00             db 0h                             
  b357  6069           addr 6069                         
  b359  03             db 3h                             
  b35a  FFFF           dw FFFFh                          
LAB_b35c:
  b35c  17DDD9         LBSR 0x9138                       
  b35f  17E1A7         LBSR 0x9509                       
  b362  17D901         LBSR 0x8c66                       
  b365  1700F6         LBSR 0xb45e                       
  b368  35B6           PULS  A B X Y PC                  

; ---- function FUN_b36a
FUN_b36a:
  b36a  3436           PSHS  Y X B A                     
  b36c  FC6074         LDD 0x6074                        
  b36f  17EA4E         LBSR 0x9dc0                       
  b372  2748           BEQ 0xb3bc                        
  b374  FC6074         LDD 0x6074                        
  b377  3606           PSHU  B A                         
  b379  17E468         LBSR 0x97e4                        ; inline[API_FC38]: "{2:28}{5:28}{2:13}{5:15}[{4:2000}{3:60AA}]"
  b37c  022805280213.. char[17] 02h,"(",05h,"(",02h,13h,05h,15h,"[",04h," "
LAB_b38d:
  b38d  17F888         LBSR 0xac18                       
  b390  35B6           PULS  A B X Y PC                  

; ---- function FUN_b392
FUN_b392:
  b392  3436           PSHS  Y X B A                     
  b394  FC6054         LDD 0x6054                        
  b397  8D02           BSR 0xb39b                        
  b399  2021           BRA 0xb3bc                        

; ---- function FUN_b39b
FUN_b39b:
  b39b  17EA22         LBSR 0x9dc0                       
  b39e  270E           BEQ 0xb3ae                        
  b3a0  10B361A7       CMPD 0x61a7                       
  b3a4  2305           BLS 0xb3ab                        
  b3a6  17FB76         LBSR 0xaf1f                       
  b3a9  2003           BRA 0xb3ae                        
LAB_b3ab:
  b3ab  17FB91         LBSR 0xaf3f                       
LAB_b3ae:
  b3ae  FD6074         STD 0x6074                        
  b3b1  17DD84         LBSR 0x9138                       
  b3b4  39             RTS                               

; ---- function FUN_b3b5
FUN_b3b5:
  b3b5  3436           PSHS  Y X B A                     
  b3b7  FC6062         LDD 0x6062                        
  b3ba  8DDF           BSR 0xb39b                        
LAB_b3bc:
  b3bc  FD6054         STD 0x6054                        
  b3bf  FD6062         STD 0x6062                        
  b3c2  FD61A7         STD 0x61a7                        
  b3c5  F661B1         LDB 0x61b1                        
  b3c8  4F             CLRA                              
  b3c9  1F02           TFR D,Y                           
  b3cb  FC61A7         LDD 0x61a7                        
  b3ce  108303E8       CMPD #0x3e8                       
  b3d2  2603           BNE 0xb3d7                        
  b3d4  CCFFFF         LDD #0xffff                       
LAB_b3d7:
  b3d7  17012D         LBSR 0xb507                       
  b3da  170081         LBSR 0xb45e                       
  b3dd  17E7DE         LBSR 0x9bbe                       
  b3e0  C601           LDB #0x1                          
  b3e2  17390A         LBSR 0xecef                       
  b3e5  35B6           PULS  A B X Y PC                  

; ---- function FUN_b3e7
FUN_b3e7:
  b3e7  17F888         LBSR 0xac72                        ; inline[API_FC8A]: ->$B3F7(rel) "( Number )"
  b3ea  000D           dw Dh                             
  b3ec  28204E756D62.. ds "( Number )"                   
LAB_b3f6:
  b3f6  39             RTS                               

; ---- function FUN_b3f7
FUN_b3f7:
  b3f7  3406           PSHS  B A                         
  b3f9  C6A5           LDB #0xa5                         
  b3fb  F760FB         STB 0x60fb                        
  b3fe  CC9BC8         LDD #0x9bc8                       
  b401  FD6036         STD 0x6036                        
  b404  17392B         LBSR 0xed32                       
  b407  F660B9         LDB 0x60b9                        
  b40a  1738E2         LBSR 0xecef                       
  b40d  F661B1         LDB 0x61b1                        
  b410  4F             CLRA                              
  b411  FD6074         STD 0x6074                        
  b414  17DA50         LBSR 0x8e67                        ; inline[API_FC16]: 01 01 02 32 01 00 03 00 $007F $0000 $0000 ->$000E ->$0023 $0001 $0001 $0000
  b417  01             db 1h                             
  b418  01             db 1h                             
  b419  02             db 2h                             
  b41a  32             db 32h                            
  b41b  01             db 1h                             
  b41c  00             db 0h                             
  b41d  03             db 3h                             
  b41e  00             db 0h                             
  b41f  007F           dw 7Fh                            
  b421  0000           dw 0h                             
  b423  0000           dw 0h                             
  b425  000E           addr 000e                         
  b427  0023           addr 0023                         
  b429  0001           dw 1h                             
  b42b  0001           dw 1h                             
  b42d  0000           dw 0h                             
LAB_b42f:
  b42f  8D19           BSR 0xb44a                        
  b431  3586           PULS  A B PC                      

; ---- function FUN_b433
FUN_b433:
  b433  3406           PSHS  B A                         
  b435  17E3AC         LBSR 0x97e4                        ; inline[API_FC38]: "{2:0A}{3:60A0}{5:1B}"
  b438  020A0360A005.. char[8] 02h,"\n",03h,"`",A0h,05h,1Bh
LAB_b440:
  b440  7D604D         TST 0x604d                        
  b443  2703           BEQ 0xb448                        
  b445  17F7D0         LBSR 0xac18                       
LAB_b448:
  b448  3586           PULS  A B PC                      

; ---- function FUN_b44a
FUN_b44a:
  b44a  3406           PSHS  B A                         
  b44c  FC6074         LDD 0x6074                        
  b44f  F761B1         STB 0x61b1                        
  b452  8D0A           BSR 0xb45e                        
  b454  17E767         LBSR 0x9bbe                       
  b457  C600           LDB #0x0                          
  b459  173893         LBSR 0xecef                       
  b45c  3586           PULS  A B PC                      

; ---- function FUN_b45e
FUN_b45e:
  b45e  3416           PSHS  X B A                       
  b460  17E381         LBSR 0x97e4                        ; inline[API_FC38]: "{2:00}MIDI Pgm #    Loads"
  b463  02004D494449.. char[22] 02h                      
LAB_b479:
  b479  F661B1         LDB 0x61b1                        
  b47c  4F             CLRA                              
  b47d  3606           PSHU  B A                         
  b47f  17E362         LBSR 0x97e4                        ; inline[API_FC38]: "{2:0A}{4:2000}{3:60AA}{2:13}"
  b482  020A04200003.. char[11] 02h,"\n",04h," "         
LAB_b48d:
  b48d  170058         LBSR 0xb4e8                       
  b490  10830FFF       CMPD #0xfff                       
  b494  2737           BEQ 0xb4cd                        
  b496  17E927         LBSR 0x9dc0                       
  b499  260D           BNE 0xb4a8                        
  b49b  17E957         LBSR 0x9df5                       
  b49e  17D3BC         LBSR 0x885d                       
  b4a1  2643           BNE 0xb4e6                        
  b4a3  17ECA1         LBSR 0xa147                       
  b4a6  203E           BRA 0xb4e6                        
LAB_b4a8:
  b4a8  3606           PSHU  B A                         
  b4aa  17E337         LBSR 0x97e4                        ; inline[API_FC38]: " Missing Program     {2:24}{4:2000}{3:60AA}"
  b4ad  204D69737369.. char[30] " Missing Program     ",02h,"$",04h," "
LAB_b4cb:
  b4cb  2019           BRA 0xb4e6                        
LAB_b4cd:
  b4cd  17E314         LBSR 0x97e4                        ; inline[API_FC38]: " Nothing, Unpatched  "
  b4d0  204E6F746869.. char[22] " Nothing, Unpatched  "  
LAB_b4e6:
  b4e6  3596           PULS  A B X PC                    

; ---- function FUN_b4e8
FUN_b4e8:
  b4e8  3410           PSHS  X                           
  b4ea  F661B1         LDB 0x61b1                        
  b4ed  4F             CLRA                              
  b4ee  1F01           TFR D,X                           
  b4f0  170002         LBSR 0xb4f5                       
  b4f3  3590           PULS  X PC                        

; ---- function FUN_b4f5
FUN_b4f5:
  b4f5  3410           PSHS  X                           
  b4f7  1F10           TFR X,D                           
  b4f9  58             LSLB                              
  b4fa  49             ROLA                              
  b4fb  C30180         ADDD #0x180                       
  b4fe  1F01           TFR D,X                           
  b500  17F218         LBSR 0xa71b                       
  b503  840F           ANDA #0xf                         
  b505  3590           PULS  X PC                        

; ---- function FUN_b507
FUN_b507:
  b507  3436           PSHS  Y X B A                     
  b509  1F20           TFR Y,D                           
  b50b  58             LSLB                              
  b50c  49             ROLA                              
  b50d  C30180         ADDD #0x180                       
  b510  1F02           TFR D,Y                           
  b512  1F01           TFR D,X                           
  b514  17F204         LBSR 0xa71b                       
  b517  84F0           ANDA #0xf0                        
  b519  3402           PSHS  A                           
  b51b  EC61           LDD 0x1,S                         
  b51d  840F           ANDA #0xf                         
  b51f  AAE0           ORA ,S+                           
  b521  17F22E         LBSR 0xa752                       
  b524  35B6           PULS  A B X Y PC                  

; ---- function FUN_b526
FUN_b526:
  b526  17F749         LBSR 0xac72                        ; inline[API_FC8A]: ->$B536(rel) "( Clear  )"
  b529  000D           dw Dh                             
  b52b  2820436C6561.. ds "( Clear  )"                   
LAB_b535:
  b535  39             RTS                               

; ---- function FUN_b536
FUN_b536:
  b536  3406           PSHS  B A                         
  b538  17F6DD         LBSR 0xac18                       
  b53b  17E2A6         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Clear the entire MIDI Map Table ?"
  b53e  01436C656172.. char[35] 01h,"Clear the entire MIDI Map Table ?"
LAB_b561:
  b561  17F6D2         LBSR 0xac36                        ; inline[API_FE3C]: $B56E $B56A
  b564  B56E           dw B56Eh                          
  b566  B56A           dw B56Ah                          
LAB_b568:
  b568  3586           PULS  A B PC                      

; ---- function FUN_b56a
FUN_b56a:
  b56a  3426           PSHS  Y B A                       
  b56c  2014           BRA 0xb582                        

; ---- function FUN_b56e
FUN_b56e:
  b56e  3426           PSHS  Y B A                       
  b570  C6A0           LDB #0xa0                         
  b572  1744AB         LBSR 0xfa20                       
  b575  108E0180       LDY #0x180                        
  b579  170C56         LBSR 0xc1d2                        ; inline[API_FD0C]: $0100 FF
  b57c  0100           dw 100h                           
  b57e  FF             db FFh                            
LAB_b57f:
  b57f  1744B8         LBSR 0xfa3a                       
LAB_b582:
  b582  17E6BD         LBSR 0x9c42                       
  b585  C600           LDB #0x0                          
  b587  F760B9         STB 0x60b9                        
  b58a  17FE6A         LBSR 0xb3f7                       
  b58d  35A6           PULS  A B Y PC                    

; ---- function API_FE46
API_FE46:
  b58f  3436           PSHS  Y X B A                     
  b591  C6A0           LDB #0xa0                         
  b593  17448A         LBSR 0xfa20                       
  b596  CC000F         LDD #0xf                          
  b599  170DA2         LBSR 0xc33e                       
  b59c  C6FF           LDB #0xff                         
  b59e  F76116         STB 0x6116                        
  b5a1  1700C5         LBSR 0xb669                       
  b5a4  5F             CLRB                              
  b5a5  17E159         LBSR 0x9701                       
  b5a8  1700E8         LBSR 0xb693                       
  b5ab  8E0000         LDX #0x0                          
  b5ae  FC0002         LDD 0x0002                        
  b5b1  173D82         LBSR 0xf336                        ; inline[API_FE24]: $68A0
  b5b4  68A0           dw 68A0h                          
LAB_b5b6:
  b5b6  CCFDCE         LDD #0xfdce                       
  b5b9  173E52         LBSR 0xf40e                        ; inline[API_FE28]: $68A0
  b5bc  68A0           dw 68A0h                          
LAB_b5be:
  b5be  1700C9         LBSR 0xb68a                       
  b5c1  CC001E         LDD #0x1e                         
  b5c4  170D77         LBSR 0xc33e                       
  b5c7  8E0296         LDX #0x296                        
  b5ca  17F138         LBSR 0xa705                       
  b5cd  F76116         STB 0x6116                        
  b5d0  174467         LBSR 0xfa3a                       
  b5d3  35B6           PULS  A B X Y PC                  

; ---- function API_FE42
API_FE42:
  b5d5  3436           PSHS  Y X B A                     
  b5d7  C6A0           LDB #0xa0                         
  b5d9  174444         LBSR 0xfa20                       
  b5dc  17D671         LBSR 0x8c50                       
  b5df  C6FF           LDB #0xff                         
  b5e1  F76116         STB 0x6116                        
  b5e4  170082         LBSR 0xb669                       
  b5e7  C601           LDB #0x1                          
  b5e9  17E115         LBSR 0x9701                       
  b5ec  1700B7         LBSR 0xb6a6                       
  b5ef  8E0300         LDX #0x300                        
LAB_b5f2:
  b5f2  10AE84         LDY ,X                            
  b5f5  EC02           LDD 0x2,X                         
  b5f7  173D3C         LBSR 0xf336                        ; inline[API_FE24]: $68A0
  b5fa  68A0           dw 68A0h                          
LAB_b5fc:
  b5fc  108CFFFF       CMPY #0xffff                      
  b600  26F0           BNE 0xb5f2                        
  b602  170085         LBSR 0xb68a                       
  b605  170061         LBSR 0xb669                       
  b608  5F             CLRB                              
  b609  17E0F5         LBSR 0x9701                       
  b60c  CCFC64         LDD #0xfc64                       
  b60f  173DFC         LBSR 0xf40e                        ; inline[API_FE28]: $68A0
  b612  68A0           dw 68A0h                          
LAB_b614:
  b614  170073         LBSR 0xb68a                       
  b617  CC001E         LDD #0x1e                         
  b61a  170D21         LBSR 0xc33e                       
  b61d  8E0296         LDX #0x296                        
  b620  17F0E2         LBSR 0xa705                       
  b623  F76116         STB 0x6116                        
  b626  174411         LBSR 0xfa3a                       
  b629  35B6           PULS  A B X Y PC                  

; ---- function API_FE44
API_FE44:
  b62b  3436           PSHS  Y X B A                     
  b62d  C6A0           LDB #0xa0                         
  b62f  1743EE         LBSR 0xfa20                       
  b632  CC000F         LDD #0xf                          
  b635  170D06         LBSR 0xc33e                       
  b638  C6FF           LDB #0xff                         
  b63a  F76116         STB 0x6116                        
  b63d  170029         LBSR 0xb669                       
  b640  5F             CLRB                              
  b641  17E0BD         LBSR 0x9701                       
  b644  17004C         LBSR 0xb693                       
  b647  8E0180         LDX #0x180                        
  b64a  CC0100         LDD #0x100                        
  b64d  173CE6         LBSR 0xf336                        ; inline[API_FE24]: $68A0
  b650  68A0           dw 68A0h                          
LAB_b652:
  b652  170035         LBSR 0xb68a                       
  b655  CC001E         LDD #0x1e                         
  b658  170CE3         LBSR 0xc33e                       
  b65b  8E0296         LDX #0x296                        
  b65e  17F0A4         LBSR 0xa705                       
  b661  F76116         STB 0x6116                        
  b664  1743D3         LBSR 0xfa3a                       
  b667  35B6           PULS  A B X Y PC                  

; ---- function FUN_b669
FUN_b669:
  b669  3404           PSHS  B                           
  b66b  C6A0           LDB #0xa0                         
  b66d  1743B0         LBSR 0xfa20                       
  b670  C6F0           LDB #0xf0                         
  b672  17E08C         LBSR 0x9701                       
  b675  C61C           LDB #0x1c                         
  b677  17E087         LBSR 0x9701                       
  b67a  C660           LDB #0x60                         
  b67c  17E082         LBSR 0x9701                       
  b67f  F60290         LDB 0x0290                        
  b682  17E07C         LBSR 0x9701                       
  b685  1743B2         LBSR 0xfa3a                       
  b688  3584           PULS  B PC                        

; ---- function FUN_b68a
FUN_b68a:
  b68a  3404           PSHS  B                           
  b68c  C6F7           LDB #0xf7                         
  b68e  17E070         LBSR 0x9701                       
  b691  3584           PULS  B PC                        

; ---- function FUN_b693
FUN_b693:
  b693  3412           PSHS  X A                         
  b695  8E68AB         LDX #0x68ab                       
LAB_b698:
  b698  86A0           LDA #0xa0                         
  b69a  A784           STA ,X                            
  b69c  CC0001         LDD #0x1                          
  b69f  173C94         LBSR 0xf336                        ; inline[API_FE24]: $68A0
  b6a2  68A0           dw 68A0h                          
LAB_b6a4:
  b6a4  3592           PULS  A X PC                      

; ---- function FUN_b6a6
FUN_b6a6:
  b6a6  3412           PSHS  X A                         
  b6a8  8E68CB         LDX #0x68cb                       
  b6ab  20EB           BRA 0xb698                        

; ---- function FUN_b6ad
FUN_b6ad:
  b6ad  3436           PSHS  Y X B A                     
  b6af  FC6188         LDD 0x6188                        
  b6b2  108303E7       CMPD #0x3e7                       
  b6b6  2244           BHI 0xb6fc                        
  b6b8  CC0000         LDD #0x0                          
LAB_b6bb:
  b6bb  17E702         LBSR 0x9dc0                       
  b6be  260B           BNE 0xb6cb                        
  b6c0  C30001         ADDD #0x1                         
  b6c3  108303E8       CMPD #0x3e8                       
  b6c7  2733           BEQ 0xb6fc                        
  b6c9  20F0           BRA 0xb6bb                        
LAB_b6cb:
  b6cb  FD61B2         STD 0x61b2                        
  b6ce  7F60C4         CLR 0x60c4                        
  b6d1  108E60C6       LDY #0x60c6                       
  b6d5  170AFA         LBSR 0xc1d2                        ; inline[API_FD0C]: $0014 20
  b6d8  0014           dw 14h                            
  b6da  20             db 20h                            
LAB_b6db:
  b6db  C6A0           LDB #0xa0                         
  b6dd  F7600C         STB 0x600c                        
  b6e0  CC000F         LDD #0xf                          
  b6e3  8E000A         LDX #0xa                          
  b6e6  108E60C6       LDY #0x60c6                       
  b6ea  17439C         LBSR 0xfa89                       
  b6ed  CCB725         LDD #0xb725                       
  b6f0  17E51A         LBSR 0x9c0d                       
  b6f3  CC9C2E         LDD #0x9c2e                       
  b6f6  FD602E         STD 0x602e                        
LAB_b6f9:
  b6f9  3536           PULS  A B X Y                     
  b6fb  39             RTS                               
LAB_b6fc:
  b6fc  17E0E5         LBSR 0x97e4                        ; inline[API_FC38]: "{1}No more ID numbers available"
  b6ff  014E6F206D6F.. char[30] 01h,"No more ID numbers available"
LAB_b71d:
  b71d  17D9F2         LBSR 0x9112                       
  b720  17E43D         LBSR 0x9b60                       
  b723  20D4           BRA 0xb6f9                        
  b725  .db 00 16 00 CE 00 DC 00 00 01 FA 00 A4 00 84 00 00  ; ................
  b735  .db 00 00 02 07 FF FF 34 06 17 F4 8F C6 A8 F7 60 FB  ; ......4.......`.
  b745  .db CC 9B C8 FD 60 36 17 E0 96 01 53 61 76 65 20 61  ; ....`6....Save a
  b755  .db 73 20 5B 20 20 20 5D 02 1F 41 64 6A 20 4E 75 6D  ; s [   ]..Adj Num
  b765  .db 20 7E 00 FC 61 B2 FD 60 74 17 D6 F6 01 10 02 1E  ;  ~..a..`t.......
  b775  .db 01 00 03 00 03 E7 00 00 00 00 00 10 00 18 00 01  ; ................
  b785  .db 00 01 00 00 17 02 05 35 06 39 17 E0 52 02 09 03  ; .......5.9..R...
  b795  .db 60 A0 00 39 34 06 FC 60 74 10 B3 61 B2 23 05 17  ; `..94..`t..a.#..
  b7a5  .db 02 0D 20 03 17 02 28 FD 61 B2 17 E3 AE 35 06 39  ; .. ...(.a....5.9
  b7b5  .db 34 06 F6 60 B9 17 F4 B5 00 0F 28 20 4E 75 6D 62  ; 4..`......( Numb
  b7c5  .db 65 72 20 29 35 06 39 17 00 5B 17 E3 F6 39 34 36  ; er )5.9..[...946
  b7d5  .db 17 F3 F7 C6 A9 F7 60 FB CC 9B C8 FD 60 36 17 DF  ; ......`.....`6..
  b7e5  .db FE 02 1F 41 64 6A 20 4E 61 6D 65 7E 00 35 36 39  ; ...Adj Name~.569
  b7f5  .db 17 F4 7A 00 21 28 4E 65 77 20 4E 61 6D 65 29 39  ; ..z.!(New Name)9
  b805  .db 17 F4 6A 00 0D 28 45 64 69 74 4E 61 6D 65 29 39  ; ..j..(EditName)9
  b815  .db 34 36 20 0C 34 36 10 8E 60 C6 17 09 B0 00 0F 20  ; 46 .46..`...... 
  b825  .db 17 E3 C4 35 B6                                   ; ...5.

; ---- function API_FE66
API_FE66:
  b82a  17DF7C         LBSR 0x97a9                       
  b82d  39             RTS                               

; ---- function API_FE64
API_FE64:
  b82e  3436           PSHS  Y X B A                     
  b830  B761B6         STA 0x61b6                        
  b833  F761B7         STB 0x61b7                        
  b836  7F61B5         CLR 0x61b5                        
  b839  8E60C6         LDX #0x60c6                       
  b83c  E684           LDB ,X                            
  b83e  F761B4         STB 0x61b4                        
  b841  8602           LDA #0x2                          
  b843  B760C1         STA 0x60c1                        
  b846  17DF52         LBSR 0x979b                       
  b849  C601           LDB #0x1                          
  b84b  17F424         LBSR 0xac72                        ; inline[API_FC8A]: ->$B8F8(rel) "(  .---  )"
  b84e  00AA           dw AAh                            
  b850  2820207F2D2D.. ds "(  ",7Fh,"---  )"             
LAB_b85a:
  b85a  C602           LDB #0x2                          
  b85c  17F413         LBSR 0xac72                        ; inline[API_FC8A]: ->$B90C(rel) "(  ---~  )"
  b85f  00AD           dw ADh                            
  b861  2820202D2D2D.. ds "(  ---~  )"                   
LAB_b86b:
  b86b  8D02           BSR 0xb86f                        
  b86d  35B6           PULS  A B X Y PC                  

; ---- function FUN_b86f
FUN_b86f:
  b86f  3436           PSHS  Y X B A                     
  b871  8E60C6         LDX #0x60c6                       
  b874  B661B5         LDA 0x61b5                        
  b877  E686           LDB A,X                           
  b879  C120           CMPB #0x20                        
  b87b  2603           BNE 0xb880                        
  b87d  F661B4         LDB 0x61b4                        
LAB_b880:
  b880  170045         LBSR 0xb8c8                       
  b883  4F             CLRA                              
  b884  FD6074         STD 0x6074                        
  b887  17D5DD         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 4B 02 00 06 00 $00BC $0000 $0000 ->$0000 ->$0011 $0001 $0001 $0000
  b88a  01             db 1h                             
  b88b  10             db 10h                            
  b88c  02             db 2h                             
  b88d  4B             db 4Bh                            
  b88e  02             db 2h                             
  b88f  00             db 0h                             
  b890  06             db 6h                             
  b891  00             db 0h                             
  b892  00BC           dw BCh                            
  b894  0000           dw 0h                             
  b896  0000           dw 0h                             
  b898  0000           addr 0000                         
  b89a  0011           addr 0011                         
  b89c  0001           dw 1h                             
  b89e  0001           dw 1h                             
  b8a0  0000           dw 0h                             
LAB_b8a2:
  b8a2  170036         LBSR 0xb8db                       
  b8a5  170046         LBSR 0xb8ee                       
  b8a8  3536           PULS  A B X Y                     
  b8aa  39             RTS                               

; ---- function FUN_b8ab
FUN_b8ab:
  b8ab  3416           PSHS  X B A                       
  b8ad  FC6074         LDD 0x6074                        
  b8b0  8EB9F8         LDX #0xb9f8                       
  b8b3  E68B           LDB D,X                           
  b8b5  8E60C6         LDX #0x60c6                       
  b8b8  B661B5         LDA 0x61b5                        
  b8bb  E786           STB A,X                           
  b8bd  F761B4         STB 0x61b4                        
  b8c0  170018         LBSR 0xb8db                       
  b8c3  8D29           BSR 0xb8ee                        
  b8c5  3516           PULS  A B X                       
  b8c7  39             RTS                               

; ---- function FUN_b8c8
FUN_b8c8:
  b8c8  3452           PSHS  U X A                       
  b8ca  8EB9F8         LDX #0xb9f8                       
  b8cd  CE00BC         LDU #0xbc                         
  b8d0  170912         LBSR 0xc1e5                       
  b8d3  1F10           TFR X,D                           
  b8d5  83B9F8         SUBD #0xb9f8                      
  b8d8  3552           PULS  A X U                       
  b8da  39             RTS                               

; ---- function FUN_b8db
FUN_b8db:
  b8db  3436           PSHS  Y X B A                     
  b8dd  8E60C6         LDX #0x60c6                       
  b8e0  F661B6         LDB 0x61b6                        
  b8e3  17DEED         LBSR 0x97d3                       
  b8e6  F661B7         LDB 0x61b7                        
  b8e9  17DF67         LBSR 0x9853                       
  b8ec  35B6           PULS  A B X Y PC                  

; ---- function FUN_b8ee
FUN_b8ee:
  b8ee  F661B6         LDB 0x61b6                        
  b8f1  FB61B5         ADDB 0x61b5                       
  b8f4  17DEBB         LBSR 0x97b2                       
  b8f7  39             RTS                               

; ---- function FUN_b8f8
FUN_b8f8:
  b8f8  3406           PSHS  B A                         
  b8fa  F661B5         LDB 0x61b5                        
  b8fd  2701           BEQ 0xb900                        
  b8ff  5A             DECB                              
LAB_b900:
  b900  F761B5         STB 0x61b5                        
  b903  17FF69         LBSR 0xb86f                       
  b906  17FFE5         LBSR 0xb8ee                       
  b909  3506           PULS  A B                         
  b90b  39             RTS                               

; ---- function FUN_b90c
FUN_b90c:
  b90c  3406           PSHS  B A                         
  b90e  F661B7         LDB 0x61b7                        
  b911  5A             DECB                              
  b912  F161B5         CMPB 0x61b5                       
  b915  2707           BEQ 0xb91e                        
  b917  F661B5         LDB 0x61b5                        
  b91a  5C             INCB                              
  b91b  F761B5         STB 0x61b5                        
LAB_b91e:
  b91e  17FF4E         LBSR 0xb86f                       
  b921  17FFCA         LBSR 0xb8ee                       
  b924  3506           PULS  A B                         
  b926  39             RTS                               

; ---- function FUN_b927
FUN_b927:
  b927  3404           PSHS  B                           
  b929  F660B9         LDB 0x60b9                        
  b92c  17F343         LBSR 0xac72                        ; inline[API_FC8A]: ->$B94B(rel) "(Save It )"
  b92f  001C           dw 1Ch                            
  b931  285361766520.. ds "(Save It )"                   
LAB_b93b:
  b93b  3504           PULS  B                           
  b93d  39             RTS                               

; ---- function FUN_b93e
FUN_b93e:
  b93e  3406           PSHS  B A                         
  b940  8DE5           BSR 0xb927                        
  b942  860E           LDA #0xe                          
  b944  C60F           LDB #0xf                          
  b946  17FEE5         LBSR 0xb82e                       
  b949  3586           PULS  A B PC                      

; ---- function FUN_b94b
FUN_b94b:
  b94b  3416           PSHS  X B A                       
  b94d  17FEDA         LBSR 0xb82a                       
  b950  17DE91         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Saving Program ... "
  b953  01536176696E.. char[21] 01h,"Saving Program ... "
LAB_b968:
  b968  FC61B2         LDD 0x61b2                        
  b96b  FD61A7         STD 0x61a7                        
  b96e  17E484         LBSR 0x9df5                       
  b971  108E0000       LDY #0x0                          
  b975  17EDDA         LBSR 0xa752                       
  b978  108E000A       LDY #0xa                          
  b97c  8E60C6         LDX #0x60c6                       
  b97f  CC000F         LDD #0xf                          
  b982  17EE4D         LBSR 0xa7d2                       
  b985  17E5C0         LBSR 0x9f48                       
  b988  17E3ED         LBSR 0x9d78                       
  b98b  17E2A0         LBSR 0x9c2e                       
  b98e  3516           PULS  A B X                       
  b990  39             RTS                               

; ---- function FUN_b991
FUN_b991:
  b991  3456           PSHS  U X B A                     
  b993  CE60DA         LDU #0x60da                       
  b996  FC61B2         LDD 0x61b2                        
  b999  3606           PSHU  B A                         
  b99b  17DE46         LBSR 0x97e4                        ; inline[API_FC38]: "{2:09}{4:2000}{3:60AA}{2:0E}"
  b99e  020904200003.. char[11] 02h,"\t",04h," "         
LAB_b9a9:
  b9a9  8E60C6         LDX #0x60c6                       
  b9ac  C60F           LDB #0xf                          
  b9ae  17DEA2         LBSR 0x9853                       
  b9b1  3556           PULS  A B X U                     
  b9b3  39             RTS                               

; ---- function FUN_b9b4
FUN_b9b4:
  b9b4  3406           PSHS  B A                         
  b9b6  8D3C           BSR 0xb9f4                        
  b9b8  2617           BNE 0xb9d1                        
  b9ba  108303E7       CMPD #0x3e7                       
  b9be  270D           BEQ 0xb9cd                        
LAB_b9c0:
  b9c0  C30001         ADDD #0x1                         
  b9c3  8D2F           BSR 0xb9f4                        
  b9c5  260A           BNE 0xb9d1                        
  b9c7  108303E7       CMPD #0x3e7                       
  b9cb  25F3           BCS 0xb9c0                        
LAB_b9cd:
  b9cd  ECE4           LDD ,S                            
  b9cf  8D03           BSR 0xb9d4                        
LAB_b9d1:
  b9d1  3262           LEAS 0x2,S                        
  b9d3  39             RTS                               

; ---- function FUN_b9d4
FUN_b9d4:
  b9d4  3406           PSHS  B A                         
  b9d6  8D1C           BSR 0xb9f4                        
  b9d8  2617           BNE 0xb9f1                        
  b9da  10830000       CMPD #0x0                         
  b9de  270D           BEQ 0xb9ed                        
LAB_b9e0:
  b9e0  C3FFFF         ADDD #0xffff                      
  b9e3  8D0F           BSR 0xb9f4                        
  b9e5  260A           BNE 0xb9f1                        
  b9e7  10830000       CMPD #0x0                         
  b9eb  26F3           BNE 0xb9e0                        
LAB_b9ed:
  b9ed  ECE4           LDD ,S                            
  b9ef  8DC3           BSR 0xb9b4                        
LAB_b9f1:
  b9f1  3262           LEAS 0x2,S                        
  b9f3  39             RTS                               

; ---- function FUN_b9f4
FUN_b9f4:
  b9f4  17E3C9         LBSR 0x9dc0                       
  b9f7  39             RTS                               
DAT_b9f8:
  b9f8  30             ?? 30h    0                       
  b9f9  .db 31 32 33 34 35 36 37 38 39 20 41 42 43 44 45 46  ; 123456789 ABCDEF
  ba09  .db 47 48 49 4A 4B 4C 4D 4E 4F 50 51 52 53 54 55 56  ; GHIJKLMNOPQRSTUV
  ba19  .db 57 58 59 5A 61 62 63 64 65 66 67 68 69 6A 6B 6C  ; WXYZabcdefghijkl
  ba29  .db 6D 6E 6F 70 71 72 73 74 75 76 77 78 79 7A 21 23  ; mnopqrstuvwxyz!#
  ba39  .db 24 25 26 40 3F 2B 2D 2A FD 3D 5E 3C 3E 28 29 5B  ; $%&@?+-*.=^<>()[
  ba49  .db 5D 7B 7D 7E 7F 2E 2C 3A 3B 27 22 60 5F 2F 7C E0  ; ]{}~..,:;'"`_/|.
  ba59  .db E1 E2 E3 E4 E5 E6 E7 E8 E9 EA EB EC ED EE EF F0  ; ................
  ba69  .db F1 F2 F3 F4 F5 F6 F7 F8 F9 A0 A1 A2 A3 A4 A5 A6  ; ................
  ba79  .db A7 A8 A9 AA AB AC AD AE AF B1 B1 B2 B3 B4 B5 B6  ; ................
  ba89  .db B7 B8 B9 BC BB BC BD BE BF C0 C1 C2 C3 C7 C5 C7  ; ................
  ba99  .db C7 C8 C9 CA CB CC CD CE CF D0 D1 D2 D3 D4 D5 D6  ; ................
  baa9  .db D7 D8 D9 DA DB DC DD DE DF FA FB FC              ; ............

; ---- function API_FCA4
API_FCA4:
  bab5  1707D1         LBSR 0xc289                        ; inline[API_FD18]: [$608F]=$FFE8 [$6091]=$FFE8 [$6093]=$FFE8 [$6095]=$FFE8 [$6097]=$FFE8
  bab8  608F           addr 608f                         
  baba  FFE8           dw FFE8h                          
  babc  6091           addr 6091                         
  babe  FFE8           dw FFE8h                          
  bac0  6093           addr 6093                         
  bac2  FFE8           dw FFE8h                          
  bac4  6095           addr 6095                         
  bac6  FFE8           dw FFE8h                          
  bac8  6097           addr 6097                         
  baca  FFE8           dw FFE8h                          
  bacc  FFFF           dw FFFFh                          
LAB_bace:
  bace  7F61BB         CLR 0x61bb                        
  bad1  7F61BE         CLR 0x61be                        
  bad4  7F61C1         CLR 0x61c1                        
  bad7  7F61C4         CLR 0x61c4                        
  bada  7F61C7         CLR 0x61c7                        
  badd  7F61CA         CLR 0x61ca                        
  bae0  7F61CD         CLR 0x61cd                        
  bae3  7F61D0         CLR 0x61d0                        
  bae6  7F61D3         CLR 0x61d3                        
  bae9  7F61D6         CLR 0x61d6                        
  baec  39             RTS                               

; ---- function API_FCA6
API_FCA6:
  baed  3427           PSHS  Y B A CC                    
  baef  F66102         LDB 0x6102                        
  baf2  173F2B         LBSR 0xfa20                       
  baf5  8600           LDA #0x0                          
  baf7  F661B8         LDB 0x61b8                        
  bafa  B761B8         STA 0x61b8                        
  bafd  3406           PSHS  B A                         
  baff  7D61BB         TST 0x61bb                        
  bb02  270A           BEQ 0xbb0e                        
  bb04  FC61B9         LDD 0x61b9                        
  bb07  A3E4           SUBD ,S                           
  bb09  2E03           BGT 0xbb0e                        
  bb0b  7F61BB         CLR 0x61bb                        
LAB_bb0e:
  bb0e  FD61B9         STD 0x61b9                        
  bb11  7D61BE         TST 0x61be                        
  bb14  270A           BEQ 0xbb20                        
  bb16  FC61BC         LDD 0x61bc                        
  bb19  A3E4           SUBD ,S                           
  bb1b  2E03           BGT 0xbb20                        
  bb1d  7F61BE         CLR 0x61be                        
LAB_bb20:
  bb20  FD61BC         STD 0x61bc                        
  bb23  7D61C1         TST 0x61c1                        
  bb26  270A           BEQ 0xbb32                        
  bb28  FC61BF         LDD 0x61bf                        
  bb2b  A3E4           SUBD ,S                           
  bb2d  2E03           BGT 0xbb32                        
  bb2f  7F61C1         CLR 0x61c1                        
LAB_bb32:
  bb32  FD61BF         STD 0x61bf                        
  bb35  7D61C4         TST 0x61c4                        
  bb38  270A           BEQ 0xbb44                        
  bb3a  FC61C2         LDD 0x61c2                        
  bb3d  A3E4           SUBD ,S                           
  bb3f  2E03           BGT 0xbb44                        
  bb41  7F61C4         CLR 0x61c4                        
LAB_bb44:
  bb44  FD61C2         STD 0x61c2                        
  bb47  7D61C7         TST 0x61c7                        
  bb4a  270A           BEQ 0xbb56                        
  bb4c  FC61C5         LDD 0x61c5                        
  bb4f  A3E4           SUBD ,S                           
  bb51  2E03           BGT 0xbb56                        
  bb53  7F61C7         CLR 0x61c7                        
LAB_bb56:
  bb56  FD61C5         STD 0x61c5                        
  bb59  7D61CA         TST 0x61ca                        
  bb5c  2710           BEQ 0xbb6e                        
  bb5e  FC61C8         LDD 0x61c8                        
  bb61  A3E4           SUBD ,S                           
  bb63  2E09           BGT 0xbb6e                        
  bb65  7F61CA         CLR 0x61ca                        
  bb68  AD9F608F       JSR [0x608f]                      
  bb6c  2003           BRA 0xbb71                        
LAB_bb6e:
  bb6e  FD61C8         STD 0x61c8                        
LAB_bb71:
  bb71  7D61CD         TST 0x61cd                        
  bb74  2710           BEQ 0xbb86                        
  bb76  FC61CB         LDD 0x61cb                        
  bb79  A3E4           SUBD ,S                           
  bb7b  2E09           BGT 0xbb86                        
  bb7d  7F61CD         CLR 0x61cd                        
  bb80  AD9F6091       JSR [0x6091]                      
  bb84  2003           BRA 0xbb89                        
LAB_bb86:
  bb86  FD61CB         STD 0x61cb                        
LAB_bb89:
  bb89  7D61D0         TST 0x61d0                        
  bb8c  2710           BEQ 0xbb9e                        
  bb8e  FC61CE         LDD 0x61ce                        
  bb91  A3E4           SUBD ,S                           
  bb93  2E09           BGT 0xbb9e                        
  bb95  7F61D0         CLR 0x61d0                        
  bb98  AD9F6093       JSR [0x6093]                      
  bb9c  2003           BRA 0xbba1                        
LAB_bb9e:
  bb9e  FD61CE         STD 0x61ce                        
LAB_bba1:
  bba1  7D61D3         TST 0x61d3                        
  bba4  2710           BEQ 0xbbb6                        
  bba6  FC61D1         LDD 0x61d1                        
  bba9  A3E4           SUBD ,S                           
  bbab  2E09           BGT 0xbbb6                        
  bbad  7F61D3         CLR 0x61d3                        
  bbb0  AD9F6095       JSR [0x6095]                      
  bbb4  2003           BRA 0xbbb9                        
LAB_bbb6:
  bbb6  FD61D1         STD 0x61d1                        
LAB_bbb9:
  bbb9  7D61D6         TST 0x61d6                        
  bbbc  2710           BEQ 0xbbce                        
  bbbe  FC61D4         LDD 0x61d4                        
  bbc1  A3E4           SUBD ,S                           
  bbc3  2E09           BGT 0xbbce                        
  bbc5  7F61D6         CLR 0x61d6                        
  bbc8  AD9F6097       JSR [0x6097]                      
  bbcc  2003           BRA 0xbbd1                        
LAB_bbce:
  bbce  FD61D4         STD 0x61d4                        
LAB_bbd1:
  bbd1  FC61FE         LDD 0x61fe                        
  bbd4  E3E4           ADDD ,S                           
  bbd6  FD61FE         STD 0x61fe                        
  bbd9  3506           PULS  A B                         
  bbdb  173E5C         LBSR 0xfa3a                       
  bbde  3527           PULS CC A B Y                     
  bbe0  39             RTS                               

; ---- function API_FCA8
API_FCA8:
  bbe1  7F61BB         CLR 0x61bb                        
  bbe4  FD61B9         STD 0x61b9                        
  bbe7  7C61BB         INC 0x61bb                        
  bbea  39             RTS                               

; ---- function API_FCAA
API_FCAA:
  bbeb  17FEFF         LBSR 0xbaed                       
  bbee  7D61BB         TST 0x61bb                        
  bbf1  39             RTS                               

; ---- function API_FCAC
API_FCAC:
  bbf2  7F61BE         CLR 0x61be                        
  bbf5  FD61BC         STD 0x61bc                        
  bbf8  7C61BE         INC 0x61be                        
  bbfb  39             RTS                               

; ---- function API_FCAE
API_FCAE:
  bbfc  17FEEE         LBSR 0xbaed                       
  bbff  7D61BE         TST 0x61be                        
  bc02  39             RTS                               

; ---- function API_FCB0
API_FCB0:
  bc03  7F61C1         CLR 0x61c1                        
  bc06  FD61BF         STD 0x61bf                        
  bc09  7C61C1         INC 0x61c1                        
  bc0c  39             RTS                               

; ---- function API_FCB2
API_FCB2:
  bc0d  17FEDD         LBSR 0xbaed                       
  bc10  7D61C1         TST 0x61c1                        
  bc13  39             RTS                               

; ---- function API_FCB4
API_FCB4:
  bc14  7F61C4         CLR 0x61c4                        
  bc17  FD61C2         STD 0x61c2                        
  bc1a  7C61C4         INC 0x61c4                        
  bc1d  39             RTS                               

; ---- function API_FCB6
API_FCB6:
  bc1e  17FECC         LBSR 0xbaed                       
  bc21  7D61C4         TST 0x61c4                        
  bc24  39             RTS                               

; ---- function API_FCB8
API_FCB8:
  bc25  7F61C7         CLR 0x61c7                        
  bc28  FD61C5         STD 0x61c5                        
  bc2b  7C61C7         INC 0x61c7                        
  bc2e  39             RTS                               

; ---- function API_FCBA
API_FCBA:
  bc2f  17FEBB         LBSR 0xbaed                       
  bc32  7D61C7         TST 0x61c7                        
  bc35  39             RTS                               

; ---- function API_FCBC
API_FCBC:
  bc36  7F61CA         CLR 0x61ca                        
  bc39  FD61C8         STD 0x61c8                        
  bc3c  7C61CA         INC 0x61ca                        
  bc3f  39             RTS                               

; ---- function API_FCBE
API_FCBE:
  bc40  7F61CD         CLR 0x61cd                        
  bc43  FD61CB         STD 0x61cb                        
  bc46  7C61CD         INC 0x61cd                        
  bc49  39             RTS                               

; ---- function API_FCC0
API_FCC0:
  bc4a  7F61D0         CLR 0x61d0                        
  bc4d  FD61CE         STD 0x61ce                        
  bc50  7C61D0         INC 0x61d0                        
  bc53  39             RTS                               

; ---- function API_FCC2
API_FCC2:
  bc54  7F61D3         CLR 0x61d3                        
  bc57  FD61D1         STD 0x61d1                        
  bc5a  7C61D3         INC 0x61d3                        
  bc5d  39             RTS                               

; ---- function API_FCC4
API_FCC4:
  bc5e  7F61D6         CLR 0x61d6                        
  bc61  FD61D4         STD 0x61d4                        
  bc64  7C61D6         INC 0x61d6                        
  bc67  39             RTS                               

; ---- function API_FCC8
API_FCC8:
  bc68  3406           PSHS  B A                         
  bc6a  6DC4           TST ,U                            
  bc6c  2C08           BGE 0xbc76                        
  bc6e  4F             CLRA                              
  bc6f  5F             CLRB                              
  bc70  A3C4           SUBD ,U                           
  bc72  EDC4           STD ,U                            
  bc74  1A08           ORCC #0x8                         
LAB_bc76:
  bc76  3506           PULS  A B                         
  bc78  39             RTS                               

; ---- function API_FCCA
API_FCCA:
  bc79  3406           PSHS  B A                         
  bc7b  ECC4           LDD ,U                            
  bc7d  C30001         ADDD #0x1                         
  bc80  EDC4           STD ,U                            
  bc82  3506           PULS  A B                         
  bc84  39             RTS                               

; ---- function API_FCCC
API_FCCC:
  bc85  3406           PSHS  B A                         
  bc87  ECC4           LDD ,U                            
  bc89  830001         SUBD #0x1                         
  bc8c  EDC4           STD ,U                            
  bc8e  3506           PULS  A B                         
  bc90  39             RTS                               

; ---- function API_FCCE
API_FCCE:
  bc91  3406           PSHS  B A                         
  bc93  3706           PULU  A B                         
  bc95  A8C4           EORA ,U                           
  bc97  A7C4           STA ,U                            
  bc99  E841           EORB 0x1,U                        
  bc9b  E741           STB 0x1,U                         
  bc9d  3506           PULS  A B                         
  bc9f  39             RTS                               

; ---- function API_FCD0
API_FCD0:
  bca0  3406           PSHS  B A                         
  bca2  3706           PULU  A B                         
  bca4  A4C4           ANDA ,U                           
  bca6  A7C4           STA ,U                            
  bca8  E441           ANDB 0x1,U                        
  bcaa  E741           STB 0x1,U                         
  bcac  3506           PULS  A B                         
  bcae  39             RTS                               

; ---- function API_FCD2
API_FCD2:
  bcaf  3407           PSHS  B A CC                      
  bcb1  3706           PULU  A B                         
  bcb3  AAC4           ORA ,U                            
  bcb5  A7C4           STA ,U                            
  bcb7  EA41           ORB 0x1,U                         
  bcb9  E741           STB 0x1,U                         
  bcbb  3507           PULS CC A B                       
  bcbd  39             RTS                               

; ---- function API_FCD4
API_FCD4:
  bcbe  3410           PSHS  X                           
  bcc0  3710           PULU  X                           
  bcc2  ACC4           CMPX ,U                           
  bcc4  2C02           BGE 0xbcc8                        
  bcc6  AFC4           STX ,U                            
LAB_bcc8:
  bcc8  3510           PULS  X                           
  bcca  39             RTS                               

; ---- function API_FCD6
API_FCD6:
  bccb  3411           PSHS  X CC                        
  bccd  3710           PULU  X                           
  bccf  ACC4           CMPX ,U                           
  bcd1  2F02           BLE 0xbcd5                        
  bcd3  AFC4           STX ,U                            
LAB_bcd5:
  bcd5  3511           PULS CC X                         
  bcd7  39             RTS                               

; ---- function API_FCD8
API_FCD8:
  bcd8  3410           PSHS  X                           
  bcda  3710           PULU  X                           
  bcdc  ACC4           CMPX ,U                           
  bcde  2C02           BGE 0xbce2                        
  bce0  AFC4           STX ,U                            
LAB_bce2:
  bce2  3710           PULU  X                           
  bce4  ACC4           CMPX ,U                           
  bce6  2F02           BLE 0xbcea                        
  bce8  AFC4           STX ,U                            
LAB_bcea:
  bcea  3510           PULS  X                           
  bcec  39             RTS                               

; ---- function API_FCDA
API_FCDA:
  bced  3410           PSHS  X                           
  bcef  3710           PULU  X                           
  bcf1  ACC4           CMPX ,U                           
  bcf3  2402           BCC 0xbcf7                        
  bcf5  AFC4           STX ,U                            
LAB_bcf7:
  bcf7  3710           PULU  X                           
  bcf9  ACC4           CMPX ,U                           
  bcfb  2302           BLS 0xbcff                        
  bcfd  AFC4           STX ,U                            
LAB_bcff:
  bcff  3510           PULS  X                           
  bd01  39             RTS                               

; ---- function API_FCDC
API_FCDC:
  bd02  3416           PSHS  X B A                       
  bd04  ECC1           LDD ,U++                          
  bd06  2728           BEQ 0xbd30                        
  bd08  2A12           BPL 0xbd1c                        
  bd0a  50             NEGB                              
  bd0b  4F             CLRA                              
  bd0c  C40F           ANDB #0xf                         
  bd0e  1F01           TFR D,X                           
  bd10  3706           PULU  A B                         
LAB_bd12:
  bd12  47             ASRA                              
  bd13  56             RORB                              
  bd14  301F           LEAX -0x1,X                       
  bd16  26FA           BNE 0xbd12                        
  bd18  3606           PSHU  B A                         
  bd1a  2014           BRA 0xbd30                        
LAB_bd1c:
  bd1c  1F01           TFR D,X                           
  bd1e  3706           PULU  A B                         
LAB_bd20:
  bd20  58             LSLB                              
  bd21  49             ROLA                              
  bd22  2504           BCS 0xbd28                        
  bd24  847F           ANDA #0x7f                        
  bd26  2002           BRA 0xbd2a                        
LAB_bd28:
  bd28  8A80           ORA #0x80                         
LAB_bd2a:
  bd2a  301F           LEAX -0x1,X                       
  bd2c  26F2           BNE 0xbd20                        
  bd2e  3606           PSHU  B A                         
LAB_bd30:
  bd30  3516           PULS  A B X                       
  bd32  39             RTS                               

; ---- function API_FCDE
API_FCDE:
  bd33  3416           PSHS  X B A                       
  bd35  ECC1           LDD ,U++                          
  bd37  2720           BEQ 0xbd59                        
  bd39  2A12           BPL 0xbd4d                        
  bd3b  50             NEGB                              
  bd3c  4F             CLRA                              
  bd3d  C40F           ANDB #0xf                         
  bd3f  1F01           TFR D,X                           
  bd41  3706           PULU  A B                         
LAB_bd43:
  bd43  44             LSRA                              
  bd44  56             RORB                              
  bd45  301F           LEAX -0x1,X                       
  bd47  26FA           BNE 0xbd43                        
  bd49  3606           PSHU  B A                         
  bd4b  200C           BRA 0xbd59                        
LAB_bd4d:
  bd4d  1F01           TFR D,X                           
  bd4f  3706           PULU  A B                         
LAB_bd51:
  bd51  58             LSLB                              
  bd52  49             ROLA                              
  bd53  301F           LEAX -0x1,X                       
  bd55  26FA           BNE 0xbd51                        
  bd57  3606           PSHU  B A                         
LAB_bd59:
  bd59  3516           PULS  A B X                       
  bd5b  39             RTS                               

; ---- function API_FCE0
API_FCE0:
  bd5c  3406           PSHS  B A                         
  bd5e  4F             CLRA                              
  bd5f  5F             CLRB                              
  bd60  A3C4           SUBD ,U                           
  bd62  EDC4           STD ,U                            
  bd64  3506           PULS  A B                         
  bd66  39             RTS                               

; ---- function API_FCE2
API_FCE2:
  bd67  3407           PSHS  B A CC                      
  bd69  3706           PULU  A B                         
  bd6b  E3C4           ADDD ,U                           
  bd6d  EDC4           STD ,U                            
  bd6f  3507           PULS CC A B                       
  bd71  39             RTS                               

; ---- function API_FCE4
API_FCE4:
  bd72  3407           PSHS  B A CC                      
  bd74  EC42           LDD 0x2,U                         
  bd76  A3C4           SUBD ,U                           
  bd78  3342           LEAU 0x2,U                        
  bd7a  EDC4           STD ,U                            
  bd7c  3507           PULS CC A B                       
  bd7e  39             RTS                               

; ---- function API_FCE6
API_FCE6:
  bd7f  8D0E           BSR 0xbd8f                        
  bd81  3342           LEAU 0x2,U                        
  bd83  39             RTS                               

; ---- function API_FCE8
API_FCE8:
  bd84  3407           PSHS  B A CC                      
  bd86  8D07           BSR 0xbd8f                        
  bd88  3706           PULU  A B                         
  bd8a  EDC4           STD ,U                            
  bd8c  3507           PULS CC A B                       
  bd8e  39             RTS                               

; ---- function FUN_bd8f
FUN_bd8f:
  bd8f  7F61DB         CLR 0x61db                        
  bd92  17FED3         LBSR 0xbc68                       
  bd95  2A03           BPL 0xbd9a                        
  bd97  7361DB         COM 0x61db                        
LAB_bd9a:
  bd9a  3706           PULU  A B                         
  bd9c  FD61D7         STD 0x61d7                        
  bd9f  17FEC6         LBSR 0xbc68                       
  bda2  2A03           BPL 0xbda7                        
  bda4  7361DB         COM 0x61db                        
LAB_bda7:
  bda7  3706           PULU  A B                         
  bda9  FD61D9         STD 0x61d9                        
  bdac  4F             CLRA                              
  bdad  5F             CLRB                              
  bdae  8E0010         LDX #0x10                         
LAB_bdb1:
  bdb1  7961DA         ROL 0x61da                        
  bdb4  7961D9         ROL 0x61d9                        
  bdb7  59             ROLB                              
  bdb8  49             ROLA                              
  bdb9  10B361D7       CMPD 0x61d7                       
  bdbd  2503           BCS 0xbdc2                        
  bdbf  B361D7         SUBD 0x61d7                       
LAB_bdc2:
  bdc2  301F           LEAX -0x1,X                       
  bdc4  26EB           BNE 0xbdb1                        
  bdc6  1F01           TFR D,X                           
  bdc8  FC61D9         LDD 0x61d9                        
  bdcb  59             ROLB                              
  bdcc  49             ROLA                              
  bdcd  53             COMB                              
  bdce  43             COMA                              
  bdcf  3606           PSHU  B A                         
  bdd1  3610           PSHU  X                           
  bdd3  7D61DB         TST 0x61db                        
  bdd6  2A0C           BPL 0xbde4                        
  bdd8  4F             CLRA                              
  bdd9  5F             CLRB                              
  bdda  A3C4           SUBD ,U                           
  bddc  EDC4           STD ,U                            
  bdde  4F             CLRA                              
  bddf  5F             CLRB                              
  bde0  A342           SUBD 0x2,U                        
  bde2  ED42           STD 0x2,U                         
LAB_bde4:
  bde4  39             RTS                               

; ---- function API_FCEA
API_FCEA:
  bde5  3416           PSHS  X B A                       
  bde7  3706           PULU  A B                         
  bde9  FD61D7         STD 0x61d7                        
  bdec  3706           PULU  A B                         
  bdee  FD61D9         STD 0x61d9                        
  bdf1  4F             CLRA                              
  bdf2  5F             CLRB                              
  bdf3  8E0010         LDX #0x10                         
LAB_bdf6:
  bdf6  7961DA         ROL 0x61da                        
  bdf9  7961D9         ROL 0x61d9                        
  bdfc  59             ROLB                              
  bdfd  49             ROLA                              
  bdfe  10B361D7       CMPD 0x61d7                       
  be02  2503           BCS 0xbe07                        
  be04  B361D7         SUBD 0x61d7                       
LAB_be07:
  be07  301F           LEAX -0x1,X                       
  be09  26EB           BNE 0xbdf6                        
  be0b  1F01           TFR D,X                           
  be0d  FC61D9         LDD 0x61d9                        
  be10  59             ROLB                              
  be11  49             ROLA                              
  be12  43             COMA                              
  be13  53             COMB                              
  be14  3610           PSHU  X                           
  be16  3606           PSHU  B A                         
  be18  3516           PULS  A B X                       
  be1a  39             RTS                               

; ---- function API_FCEC
API_FCEC:
  be1b  170080         LBSR 0xbe9e                       
  be1e  3342           LEAU 0x2,U                        
  be20  39             RTS                               

; ---- function API_FCEE
API_FCEE:
  be21  8D03           BSR 0xbe26                        
  be23  3342           LEAU 0x2,U                        
  be25  39             RTS                               

; ---- function API_FCF0
API_FCF0:
  be26  3406           PSHS  B A                         
  be28  CC0000         LDD #0x0                          
  be2b  FD61D7         STD 0x61d7                        
  be2e  FD61D9         STD 0x61d9                        
  be31  A641           LDA 0x1,U                         
  be33  E643           LDB 0x3,U                         
  be35  3D             MUL                               
  be36  FD61D9         STD 0x61d9                        
  be39  A6C4           LDA ,U                            
  be3b  E643           LDB 0x3,U                         
  be3d  3D             MUL                               
  be3e  F361D8         ADDD 0x61d8                       
  be41  2403           BCC 0xbe46                        
  be43  7C61D7         INC 0x61d7                        
LAB_be46:
  be46  FD61D8         STD 0x61d8                        
  be49  A641           LDA 0x1,U                         
  be4b  E642           LDB 0x2,U                         
  be4d  3D             MUL                               
  be4e  F361D8         ADDD 0x61d8                       
  be51  2403           BCC 0xbe56                        
  be53  7C61D7         INC 0x61d7                        
LAB_be56:
  be56  FD61D8         STD 0x61d8                        
  be59  A6C4           LDA ,U                            
  be5b  E642           LDB 0x2,U                         
  be5d  3D             MUL                               
  be5e  F361D7         ADDD 0x61d7                       
  be61  EDC4           STD ,U                            
  be63  FC61D9         LDD 0x61d9                        
  be66  ED42           STD 0x2,U                         
  be68  3506           PULS  A B                         
  be6a  39             RTS                               

; ---- function API_FCF2
API_FCF2:
  be6b  3406           PSHS  B A                         
  be6d  8D2F           BSR 0xbe9e                        
  be6f  3706           PULU  A B                         
  be71  FD61D7         STD 0x61d7                        
  be74  2B10           BMI 0xbe86                        
  be76  3706           PULU  A B                         
  be78  10834000       CMPD #0x4000                      
  be7c  2D18           BLT 0xbe96                        
  be7e  FC61D7         LDD 0x61d7                        
  be81  C30001         ADDD #0x1                         
  be84  2013           BRA 0xbe99                        
LAB_be86:
  be86  3706           PULU  A B                         
  be88  1083C000       CMPD #0xc000                      
  be8c  2E08           BGT 0xbe96                        
  be8e  FC61D7         LDD 0x61d7                        
  be91  830001         SUBD #0x1                         
  be94  2003           BRA 0xbe99                        
LAB_be96:
  be96  FC61D7         LDD 0x61d7                        
LAB_be99:
  be99  3606           PSHU  B A                         
  be9b  3506           PULS  A B                         
  be9d  39             RTS                               

; ---- function API_FDE4
API_FDE4:
  be9e  7F61DB         CLR 0x61db                        
  bea1  17FDC4         LBSR 0xbc68                       
  bea4  2A03           BPL 0xbea9                        
  bea6  7361DB         COM 0x61db                        
LAB_bea9:
  bea9  3706           PULU  A B                         
  beab  FD61D7         STD 0x61d7                        
  beae  17FDB7         LBSR 0xbc68                       
  beb1  2A03           BPL 0xbeb6                        
  beb3  7361DB         COM 0x61db                        
LAB_beb6:
  beb6  3706           PULU  A B                         
  beb8  FD61D9         STD 0x61d9                        
  bebb  335C           LEAU -0x4,U                       
  bebd  6FC4           CLR ,U                            
  bebf  6F41           CLR 0x1,U                         
  bec1  B661D8         LDA 0x61d8                        
  bec4  F661DA         LDB 0x61da                        
  bec7  3D             MUL                               
  bec8  ED42           STD 0x2,U                         
  beca  B661D7         LDA 0x61d7                        
  becd  F661DA         LDB 0x61da                        
  bed0  3D             MUL                               
  bed1  E341           ADDD 0x1,U                        
  bed3  ED41           STD 0x1,U                         
  bed5  2402           BCC 0xbed9                        
  bed7  6CC4           INC ,U                            
LAB_bed9:
  bed9  B661D8         LDA 0x61d8                        
  bedc  F661D9         LDB 0x61d9                        
  bedf  3D             MUL                               
  bee0  E341           ADDD 0x1,U                        
  bee2  ED41           STD 0x1,U                         
  bee4  2402           BCC 0xbee8                        
  bee6  6CC4           INC ,U                            
LAB_bee8:
  bee8  B661D7         LDA 0x61d7                        
  beeb  F661D9         LDB 0x61d9                        
  beee  3D             MUL                               
  beef  E3C4           ADDD ,U                           
  bef1  EDC4           STD ,U                            
  bef3  EC41           LDD 0x1,U                         
  bef5  58             LSLB                              
  bef6  49             ROLA                              
  bef7  69C4           ROL ,U                            
  bef9  A741           STA 0x1,U                         
  befb  54             LSRB                              
  befc  E742           STB 0x2,U                         
  befe  7D61DB         TST 0x61db                        
  bf01  2A0C           BPL 0xbf0f                        
  bf03  4F             CLRA                              
  bf04  5F             CLRB                              
  bf05  A342           SUBD 0x2,U                        
  bf07  ED42           STD 0x2,U                         
  bf09  4F             CLRA                              
  bf0a  5F             CLRB                              
  bf0b  A3C4           SUBD ,U                           
  bf0d  EDC4           STD ,U                            
LAB_bf0f:
  bf0f  39             RTS                               
  bf10  .db 20 00                                            ;  .

; ---- function API_FCF4
API_FCF4:
  bf12  3416           PSHS  X B A                       
  bf14  7F61DB         CLR 0x61db                        
  bf17  8E0010         LDX #0x10                         
  bf1a  3706           PULU  A B                         
  bf1c  3A             ABX                               
  bf1d  17FD48         LBSR 0xbc68                       
  bf20  2A03           BPL 0xbf25                        
  bf22  7361DB         COM 0x61db                        
LAB_bf25:
  bf25  3706           PULU  A B                         
  bf27  FD61D7         STD 0x61d7                        
  bf2a  4F             CLRA                              
  bf2b  5F             CLRB                              
LAB_bf2c:
  bf2c  10B361D7       CMPD 0x61d7                       
  bf30  2503           BCS 0xbf35                        
  bf32  B361D7         SUBD 0x61d7                       
LAB_bf35:
  bf35  7961DA         ROL 0x61da                        
  bf38  7961D9         ROL 0x61d9                        
  bf3b  1A01           ORCC #0x1                         
  bf3d  59             ROLB                              
  bf3e  49             ROLA                              
  bf3f  301F           LEAX -0x1,X                       
  bf41  26E9           BNE 0xbf2c                        
  bf43  FC61D9         LDD 0x61d9                        
  bf46  43             COMA                              
  bf47  53             COMB                              
  bf48  847F           ANDA #0x7f                        
  bf4a  7D61DB         TST 0x61db                        
  bf4d  2705           BEQ 0xbf54                        
  bf4f  43             COMA                              
  bf50  53             COMB                              
  bf51  C30001         ADDD #0x1                         
LAB_bf54:
  bf54  3606           PSHU  B A                         
  bf56  3516           PULS  A B X                       
  bf58  39             RTS                               

; ---- function API_FCF6
API_FCF6:
  bf59  3403           PSHS  A CC                        
  bf5b  B661DE         LDA 0x61de                        
  bf5e  44             LSRA                              
  bf5f  44             LSRA                              
  bf60  44             LSRA                              
  bf61  B861DE         EORA 0x61de                       
  bf64  46             RORA                              
  bf65  7961DC         ROL 0x61dc                        
  bf68  7961DD         ROL 0x61dd                        
  bf6b  7961DE         ROL 0x61de                        
  bf6e  3503           PULS CC A                         
  bf70  39             RTS                               

; ---- function API_FCF8
API_FCF8:
  bf71  3417           PSHS  X B A CC                    
  bf73  4F             CLRA                              
  bf74  3402           PSHS  A                           
  bf76  ECC1           LDD ,U++                          
  bf78  2751           BEQ 0xbfcb                        
  bf7a  2A07           BPL 0xbf83                        
  bf7c  43             COMA                              
  bf7d  53             COMB                              
  bf7e  C30001         ADDD #0x1                         
  bf81  63E4           COM ,S                            
LAB_bf83:
  bf83  10830001       CMPD #0x1                         
  bf87  273A           BEQ 0xbfc3                        
  bf89  10837FFF       CMPD #0x7fff                      
  bf8d  2403           BCC 0xbf92                        
  bf8f  C30001         ADDD #0x1                         
LAB_bf92:
  bf92  4D             TSTA                              
  bf93  2712           BEQ 0xbfa7                        
  bf95  3606           PSHU  B A                         
  bf97  FC61DC         LDD 0x61dc                        
  bf9a  847F           ANDA #0x7f                        
  bf9c  3606           PSHU  B A                         
  bf9e  BDBE9E         JSR 0xbe9e                        
  bfa1  3706           PULU  A B                         
  bfa3  3342           LEAU 0x2,U                        
  bfa5  200C           BRA 0xbfb3                        
LAB_bfa7:
  bfa7  B661DD         LDA 0x61dd                        
  bfaa  3D             MUL                               
  bfab  C180           CMPB #0x80                        
  bfad  1F89           TFR A,B                           
  bfaf  2501           BCS 0xbfb2                        
  bfb1  5C             INCB                              
LAB_bfb2:
  bfb2  4F             CLRA                              
LAB_bfb3:
  bfb3  6DE0           TST ,S+                           
  bfb5  2705           BEQ 0xbfbc                        
  bfb7  43             COMA                              
  bfb8  53             COMB                              
  bfb9  C30001         ADDD #0x1                         
LAB_bfbc:
  bfbc  3606           PSHU  B A                         
  bfbe  8D99           BSR 0xbf59                        
  bfc0  3517           PULS CC A B X                     
  bfc2  39             RTS                               
LAB_bfc3:
  bfc3  4F             CLRA                              
  bfc4  F661DC         LDB 0x61dc                        
  bfc7  C401           ANDB #0x1                         
  bfc9  20E8           BRA 0xbfb3                        
LAB_bfcb:
  bfcb  FC61DC         LDD 0x61dc                        
  bfce  20E3           BRA 0xbfb3                        

; ---- function API_FCFA
API_FCFA:
  bfd0  ECC4           LDD ,U                            
  bfd2  2603           BNE 0xbfd7                        
  bfd4  C30001         ADDD #0x1                         
LAB_bfd7:
  bfd7  C38000         ADDD #0x8000                      
  bfda  EDC4           STD ,U                            
  bfdc  39             RTS                               

; ---- function API_FCFC
API_FCFC:
  bfdd  3417           PSHS  X B A CC                    
  bfdf  ECC4           LDD ,U                            
  bfe1  AE42           LDX 0x2,U                         
  bfe3  ED42           STD 0x2,U                         
  bfe5  AFC4           STX ,U                            
  bfe7  3517           PULS CC A B X                     
  bfe9  39             RTS                               

; ---- function API_FCC6
API_FCC6:
  bfea  3407           PSHS  B A CC                      
  bfec  ECC4           LDD ,U                            
  bfee  3606           PSHU  B A                         
  bff0  3507           PULS CC A B                       
  bff2  39             RTS                               

;; Kernel API slot $FE20: inline n + 2^n+1 point table

; ---- function InterpTableLookup
InterpTableLookup:
  bff3  3436           PSHS  Y X B A                     
  bff5  327A           LEAS -0x6,S                       
  bff7  AE6C           LDX 0xc,S                         
  bff9  E680           LDB ,X+                           
  bffb  E7E4           STB ,S                            
  bffd  AF62           STX 0x2,S                         
  bfff  8D42           BSR 0xc043                        
  c001  C30001         ADDD #0x1                         
  c004  58             LSLB                              
  c005  49             ROLA                              
  c006  308B           LEAX D,X                          
  c008  AF6C           STX 0xc,S                         
  c00a  E6E4           LDB ,S                            
  c00c  E761           STB 0x1,S                         
  c00e  CC0000         LDD #0x0                          
  c011  ED64           STD 0x4,S                         
  c013  ECC4           LDD ,U                            
  c015  847F           ANDA #0x7f                        
  c017  58             LSLB                              
  c018  49             ROLA                              
LAB_c019:
  c019  58             LSLB                              
  c01a  49             ROLA                              
  c01b  6965           ROL 0x5,S                         
  c01d  6964           ROL 0x4,S                         
  c01f  6A61           DEC 0x1,S                         
  c021  26F6           BNE 0xc019                        
  c023  44             LSRA                              
  c024  56             RORB                              
  c025  EDC4           STD ,U                            
  c027  EC64           LDD 0x4,S                         
  c029  58             LSLB                              
  c02a  49             ROLA                              
  c02b  AE62           LDX 0x2,S                         
  c02d  308B           LEAX D,X                          
  c02f  EC02           LDD 0x2,X                         
  c031  A384           SUBD ,X                           
  c033  3606           PSHU  B A                         
  c035  17FE33         LBSR 0xbe6b                       
  c038  ECC4           LDD ,U                            
  c03a  E384           ADDD ,X                           
  c03c  EDC4           STD ,U                            
  c03e  3266           LEAS 0x6,S                        
  c040  3536           PULS  A B X Y                     
  c042  39             RTS                               

; ---- function FUN_c043
FUN_c043:
  c043  3404           PSHS  B                           
  c045  CC0001         LDD #0x1                          
LAB_c048:
  c048  6DE4           TST ,S                            
  c04a  2706           BEQ 0xc052                        
  c04c  58             LSLB                              
  c04d  49             ROLA                              
  c04e  6AE4           DEC ,S                            
  c050  20F6           BRA 0xc048                        
LAB_c052:
  c052  3261           LEAS 0x1,S                        
  c054  39             RTS                               

; ---- function API_FE68
API_FE68:
  c055  3436           PSHS  Y X B A                     
  c057  ECC4           LDD ,U                            
  c059  847F           ANDA #0x7f                        
  c05b  8540           BITA #0x40                        
  c05d  2709           BEQ 0xc068                        
  c05f  843F           ANDA #0x3f                        
  c061  3406           PSHS  B A                         
  c063  CC3FFF         LDD #0x3fff                       
  c066  A3E1           SUBD ,S++                         
LAB_c068:
  c068  58             LSLB                              
  c069  49             ROLA                              
  c06a  3606           PSHU  B A                         
  c06c  17FF84         LBSR 0xbff3                        ; inline[API_FE20]: interp table, 9 points
  c06f  03             db 3h                             
  c070  000018F830FB.. dw[9]                             
LAB_c082:
  c082  6D42           TST 0x2,U                         
  c084  2A03           BPL 0xc089                        
  c086  17FCD3         LBSR 0xbd5c                       
LAB_c089:
  c089  17FF51         LBSR 0xbfdd                       
  c08c  3706           PULU  A B                         
  c08e  35B6           PULS  A B X Y PC                  

; ---- function FUN_c090
FUN_c090:
  c090  3436           PSHS  Y X B A                     
  c092  ECC4           LDD ,U                            
  c094  3606           PSHU  B A                         
  c096  17FBCF         LBSR 0xbc68                       
  c099  17FF57         LBSR 0xbff3                        ; inline[API_FE20]: interp table, 17 points
  c09c  04             db 4h                             
  c09d  0000008D0141.. dw[17]                            
LAB_c0bf:
  c0bf  6D42           TST 0x2,U                         
  c0c1  2A03           BPL 0xc0c6                        
  c0c3  17FC96         LBSR 0xbd5c                       
LAB_c0c6:
  c0c6  17FF14         LBSR 0xbfdd                       
  c0c9  3706           PULU  A B                         
  c0cb  35B6           PULS  A B X Y PC                  

; ---- function FUN_c0cd
FUN_c0cd:
  c0cd  3436           PSHS  Y X B A                     
  c0cf  3706           PULU  A B                         
  c0d1  3406           PSHS  B A                         
  c0d3  3606           PSHU  B A                         
  c0d5  CC0147         LDD #0x147                        
  c0d8  3606           PSHU  B A                         
  c0da  17FD3E         LBSR 0xbe1b                       
  c0dd  3506           PULS  A B                         
  c0df  3606           PSHU  B A                         
  c0e1  CC55C2         LDD #0x55c2                       
  c0e4  3606           PSHU  B A                         
  c0e6  17FD82         LBSR 0xbe6b                       
  c0e9  17FC7B         LBSR 0xbd67                       
  c0ec  3536           PULS  A B X Y                     
  c0ee  39             RTS                               

; ---- function FUN_c0ef
FUN_c0ef:
  c0ef  3436           PSHS  Y X B A                     
  c0f1  3706           PULU  A B                         
  c0f3  3406           PSHS  B A                         
  c0f5  3606           PSHU  B A                         
  c0f7  CC0020         LDD #0x20                         
  c0fa  3606           PSHU  B A                         
  c0fc  17FD1C         LBSR 0xbe1b                       
  c0ff  3506           PULS  A B                         
  c101  3606           PSHU  B A                         
  c103  CC622C         LDD #0x622c                       
  c106  3606           PSHU  B A                         
  c108  17FD60         LBSR 0xbe6b                       
  c10b  17FC59         LBSR 0xbd67                       
  c10e  3536           PULS  A B X Y                     
  c110  39             RTS                               

; ---- function FUN_c111
FUN_c111:
  c111  3436           PSHS  Y X B A                     
  c113  3706           PULU  A B                         
  c115  3406           PSHS  B A                         
  c117  3606           PSHU  B A                         
  c119  CC0003         LDD #0x3                          
  c11c  3606           PSHU  B A                         
  c11e  17FCFA         LBSR 0xbe1b                       
  c121  3506           PULS  A B                         
  c123  3606           PSHU  B A                         
  c125  CC236B         LDD #0x236b                       
  c128  3606           PSHU  B A                         
  c12a  17FD3E         LBSR 0xbe6b                       
  c12d  17FC37         LBSR 0xbd67                       
  c130  3536           PULS  A B X Y                     
  c132  39             RTS                               

; ---- function FUN_c133
FUN_c133:
  c133  3436           PSHS  Y X B A                     
  c135  3706           PULU  A B                         
  c137  3406           PSHS  B A                         
  c139  3606           PSHU  B A                         
  c13b  CC002C         LDD #0x2c                         
  c13e  3606           PSHU  B A                         
  c140  17FCDE         LBSR 0xbe21                       
  c143  3506           PULS  A B                         
  c145  3606           PSHU  B A                         
  c147  CC0CCD         LDD #0xccd                        
  c14a  3606           PSHU  B A                         
  c14c  17FD1C         LBSR 0xbe6b                       
  c14f  17FC15         LBSR 0xbd67                       
  c152  3536           PULS  A B X Y                     
  c154  39             RTS                               

; ---- function FUN_c155
FUN_c155:
  c155  3436           PSHS  Y X B A                     
  c157  3706           PULU  A B                         
  c159  3406           PSHS  B A                         
  c15b  3606           PSHU  B A                         
  c15d  CC0004         LDD #0x4                          
  c160  3606           PSHU  B A                         
  c162  17FCBC         LBSR 0xbe21                       
  c165  3506           PULS  A B                         
  c167  3606           PSHU  B A                         
  c169  CC347A         LDD #0x347a                       
  c16c  3606           PSHU  B A                         
  c16e  17FCFA         LBSR 0xbe6b                       
  c171  17FBF3         LBSR 0xbd67                       
  c174  3536           PULS  A B X Y                     
  c176  39             RTS                               

; ---- function FUN_c177
FUN_c177:
  c177  3436           PSHS  Y X B A                     
  c179  3706           PULU  A B                         
  c17b  3606           PSHU  B A                         
  c17d  CC3872         LDD #0x3872                       
  c180  3606           PSHU  B A                         
  c182  17FCE6         LBSR 0xbe6b                       
  c185  3536           PULS  A B X Y                     
  c187  39             RTS                               

; ---- function API_FD04
API_FD04:
  c188  3447           PSHS  U B A CC                    
  c18a  1F13           TFR X,U                           
  c18c  1F01           TFR D,X                           
LAB_c18e:
  c18e  A6C0           LDA ,U+                           
  c190  A7A0           STA ,Y+                           
  c192  301F           LEAX -0x1,X                       
  c194  26F8           BNE 0xc18e                        
  c196  1F31           TFR U,X                           
  c198  3547           PULS CC A B U                     
  c19a  39             RTS                               

; ---- function API_FD06
API_FD06:
  c19b  3447           PSHS  U B A CC                    
  c19d  1F13           TFR X,U                           
  c19f  1F01           TFR D,X                           
LAB_c1a1:
  c1a1  A6C4           LDA ,U                            
  c1a3  A7A4           STA ,Y                            
  c1a5  335F           LEAU -0x1,U                       
  c1a7  313F           LEAY -0x1,Y                       
  c1a9  301F           LEAX -0x1,X                       
  c1ab  26F4           BNE 0xc1a1                        
  c1ad  1F31           TFR U,X                           
  c1af  3547           PULS CC A B U                     
  c1b1  39             RTS                               

; ---- function API_FD08
API_FD08:
  c1b2  3403           PSHS  A CC                        
  c1b4  3440           PSHS  U                           
LAB_c1b6:
  c1b6  A680           LDA ,X+                           
  c1b8  A7A0           STA ,Y+                           
  c1ba  ACE4           CMPX ,S                           
  c1bc  26F8           BNE 0xc1b6                        
  c1be  3540           PULS  U                           
  c1c0  3503           PULS CC A                         
  c1c2  39             RTS                               

; ---- function API_FD0A
API_FD0A:
  c1c3  3403           PSHS  A CC                        
LAB_c1c5:
  c1c5  A680           LDA ,X+                           
  c1c7  8100           CMPA #0x0                         
  c1c9  2704           BEQ 0xc1cf                        
  c1cb  A7A0           STA ,Y+                           
  c1cd  20F6           BRA 0xc1c5                        
LAB_c1cf:
  c1cf  3503           PULS CC A                         
  c1d1  39             RTS                               

;; Kernel API slot $FD0C: inline count word + fill byte; Y = destination

; ---- function MemsetInline
MemsetInline:
  c1d2  3477           PSHS  U Y X B A CC                
  c1d4  EE69           LDU 0x9,S                         
  c1d6  AEC1           LDX ,U++                          
  c1d8  E6C0           LDB ,U+                           
LAB_c1da:
  c1da  E7A0           STB ,Y+                           
  c1dc  301F           LEAX -0x1,X                       
  c1de  26FA           BNE 0xc1da                        
  c1e0  EF69           STU 0x9,S                         
  c1e2  3577           PULS CC A B X Y U                 
  c1e4  39             RTS                               

; ---- function API_FD0E
API_FD0E:
  c1e5  3466           PSHS  U Y B A                     
  c1e7  1F32           TFR U,Y                           
LAB_c1e9:
  c1e9  E180           CMPB ,X+                          
  c1eb  270A           BEQ 0xc1f7                        
  c1ed  313F           LEAY -0x1,Y                       
  c1ef  26F8           BNE 0xc1e9                        
  c1f1  301F           LEAX -0x1,X                       
  c1f3  86FF           LDA #0xff                         
  c1f5  2003           BRA 0xc1fa                        
LAB_c1f7:
  c1f7  301F           LEAX -0x1,X                       
  c1f9  4F             CLRA                              
LAB_c1fa:
  c1fa  3566           PULS  A B Y U                     
  c1fc  39             RTS                               

; ---- function API_FD10
API_FD10:
  c1fd  3473           PSHS  U Y X A CC                  
  c1ff  3404           PSHS  B                           
  c201  3404           PSHS  B                           
  c203  1F31           TFR U,X                           
  c205  1F30           TFR U,D                           
  c207  31AB           LEAY D,Y                          
  c209  A6A4           LDA ,Y                            
  c20b  A761           STA 0x1,S                         
LAB_c20d:
  c20d  A6A2           LDA ,-Y                           
  c20f  A721           STA 0x1,Y                         
  c211  301F           LEAX -0x1,X                       
  c213  26F8           BNE 0xc20d                        
  c215  3502           PULS  A                           
  c217  A7A4           STA ,Y                            
  c219  3504           PULS  B                           
  c21b  3573           PULS CC A X Y U                   
  c21d  39             RTS                               

; ---- function API_FD12
API_FD12:
  c21e  3473           PSHS  U Y X A CC                  
  c220  3404           PSHS  B                           
  c222  3404           PSHS  B                           
  c224  1F31           TFR U,X                           
  c226  A6A0           LDA ,Y+                           
  c228  A761           STA 0x1,S                         
  c22a  301F           LEAX -0x1,X                       
  c22c  2708           BEQ 0xc236                        
LAB_c22e:
  c22e  A6A0           LDA ,Y+                           
  c230  A73E           STA -0x2,Y                        
  c232  301F           LEAX -0x1,X                       
  c234  26F8           BNE 0xc22e                        
LAB_c236:
  c236  3502           PULS  A                           
  c238  A73F           STA -0x1,Y                        
  c23a  3504           PULS  B                           
  c23c  3573           PULS CC A X Y U                   
  c23e  39             RTS                               

; ---- function FUN_c23f
FUN_c23f:
  c23f  3447           PSHS  U B A CC                    
  c241  1F13           TFR X,U                           
  c243  1F01           TFR D,X                           
LAB_c245:
  c245  A6C4           LDA ,U                            
  c247  E6A4           LDB ,Y                            
  c249  A7A0           STA ,Y+                           
  c24b  E7C0           STB ,U+                           
  c24d  301F           LEAX -0x1,X                       
  c24f  26F4           BNE 0xc245                        
  c251  1F31           TFR U,X                           
  c253  3547           PULS CC A B U                     
  c255  39             RTS                               

;; Kernel API slot $FD14: D = index into inline table of code pointers (never returns here)

; ---- function JumpTableDispatch
JumpTableDispatch:
  c256  3406           PSHS  B A                         
  c258  58             LSLB                              
  c259  49             ROLA                              
  c25a  E362           ADDD 0x2,S                        
  c25c  ED62           STD 0x2,S                         
  c25e  ECF802         LDD [0x2,S]                       
  c261  ED62           STD 0x2,S                         
  c263  3586           PULS  A B PC                      

;; Kernel API slot $FD16: inline (value, target)* list, compared with D

; ---- function SwitchInline
SwitchInline:
  c265  3437           PSHS  Y X B A CC                  
  c267  AE67           LDX 0x7,S                         
LAB_c269:
  c269  10A381         CMPD ,X++                         
  c26c  270D           BEQ 0xc27b                        
  c26e  10AE81         LDY ,X++                          
  c271  108CFFFF       CMPY #0xffff                      
  c275  26F2           BNE 0xc269                        
LAB_c277:
  c277  AF67           STX 0x7,S                         
  c279  200C           BRA 0xc287                        
LAB_c27b:
  c27b  10AE81         LDY ,X++                          
  c27e  108CFFFF       CMPY #0xffff                      
  c282  27F3           BEQ 0xc277                        
  c284  10AF67         STY 0x7,S                         
LAB_c287:
  c287  35B7           PULS CC A B X Y PC                

;; Kernel API slot $FD18: inline ([addr] = word)* until $FFFF

; ---- function StoreWordsInline
StoreWordsInline:
  c289  3437           PSHS  Y X B A CC                  
  c28b  AE67           LDX 0x7,S                         
LAB_c28d:
  c28d  10AE81         LDY ,X++                          
  c290  108CFFFF       CMPY #0xffff                      
  c294  2706           BEQ 0xc29c                        
  c296  EC81           LDD ,X++                          
  c298  EDA4           STD ,Y                            
  c29a  20F1           BRA 0xc28d                        
LAB_c29c:
  c29c  AF67           STX 0x7,S                         
  c29e  35B7           PULS CC A B X Y PC                

;; Kernel API slot $FD1A: inline ([addr] = byte)* until $FFFF

; ---- function StoreBytesInline
StoreBytesInline:
  c2a0  3437           PSHS  Y X B A CC                  
  c2a2  AE67           LDX 0x7,S                         
LAB_c2a4:
  c2a4  10AE81         LDY ,X++                          
  c2a7  108CFFFF       CMPY #0xffff                      
  c2ab  2706           BEQ 0xc2b3                        
  c2ad  A680           LDA ,X+                           
  c2af  A7A4           STA ,Y                            
  c2b1  20F1           BRA 0xc2a4                        
LAB_c2b3:
  c2b3  AF67           STX 0x7,S                         
  c2b5  35B7           PULS CC A B X Y PC                
  c2b7  .db 39                                               ; 9

; ---- function FUN_c2b8
FUN_c2b8:
  c2b8  3437           PSHS  Y X B A CC                  
  c2ba  AE67           LDX 0x7,S                         
LAB_c2bc:
  c2bc  10AE81         LDY ,X++                          
  c2bf  108CFFFF       CMPY #0xffff                      
  c2c3  2719           BEQ 0xc2de                        
  c2c5  CC0000         LDD #0x0                          
  c2c8  10A384         CMPD ,X                           
  c2cb  2609           BNE 0xc2d6                        
  c2cd  3002           LEAX 0x2,X                        
  c2cf  CCC2B7         LDD #0xc2b7                       
  c2d2  EDA4           STD ,Y                            
  c2d4  20E6           BRA 0xc2bc                        
LAB_c2d6:
  c2d6  1F10           TFR X,D                           
  c2d8  E381           ADDD ,X++                         
  c2da  EDA4           STD ,Y                            
  c2dc  20DE           BRA 0xc2bc                        
LAB_c2de:
  c2de  AF67           STX 0x7,S                         
  c2e0  35B7           PULS CC A B X Y PC                

; ---- function API_FD1C
API_FD1C:
  c2e2  3457           PSHS  U X B A CC                  
  c2e4  1F13           TFR X,U                           
LAB_c2e6:
  c2e6  ECC1           LDD ,U++                          
  c2e8  1083FFFF       CMPD #0xffff                      
  c2ec  2720           BEQ 0xc30e                        
  c2ee  1F01           TFR D,X                           
  c2f0  E6C0           LDB ,U+                           
  c2f2  27F2           BEQ 0xc2e6                        
  c2f4  C101           CMPB #0x1                         
  c2f6  270A           BEQ 0xc302                        
  c2f8  C102           CMPB #0x2                         
  c2fa  270C           BEQ 0xc308                        
  c2fc  4F             CLRA                              
  c2fd  17FE88         LBSR 0xc188                       
  c300  20E4           BRA 0xc2e6                        
LAB_c302:
  c302  A684           LDA ,X                            
  c304  A7A0           STA ,Y+                           
  c306  20DE           BRA 0xc2e6                        
LAB_c308:
  c308  EC84           LDD ,X                            
  c30a  EDA1           STD ,Y++                          
  c30c  20D8           BRA 0xc2e6                        
LAB_c30e:
  c30e  35D7           PULS CC A B X U PC                

; ---- function API_FD1E
API_FD1E:
  c310  3467           PSHS  U Y B A CC                  
  c312  1F23           TFR Y,U                           
LAB_c314:
  c314  ECC1           LDD ,U++                          
  c316  1083FFFF       CMPD #0xffff                      
  c31a  2720           BEQ 0xc33c                        
  c31c  1F02           TFR D,Y                           
  c31e  E6C0           LDB ,U+                           
  c320  27F2           BEQ 0xc314                        
  c322  C101           CMPB #0x1                         
  c324  270A           BEQ 0xc330                        
  c326  C102           CMPB #0x2                         
  c328  270C           BEQ 0xc336                        
  c32a  4F             CLRA                              
  c32b  17FE5A         LBSR 0xc188                       
  c32e  20E4           BRA 0xc314                        
LAB_c330:
  c330  A680           LDA ,X+                           
  c332  A7A4           STA ,Y                            
  c334  20DE           BRA 0xc314                        
LAB_c336:
  c336  EC81           LDD ,X++                          
  c338  EDA4           STD ,Y                            
  c33a  20D8           BRA 0xc314                        
LAB_c33c:
  c33c  35E7           PULS CC A B Y U PC                

; ---- function API_FD20
API_FD20:
  c33e  12             NOP                               
  c33f  12             NOP                               
  c340  12             NOP                               
  c341  12             NOP                               
  c342  12             NOP                               
  c343  12             NOP                               
  c344  C3FFFF         ADDD #0xffff                      
  c347  26F5           BNE 0xc33e                        
  c349  39             RTS                               
  c34a  .db 39 39 39                                         ; 999

; ---- function API_FD8E
API_FD8E:
  c34d  3436           PSHS  Y X B A                     
  c34f  AE66           LDX 0x6,S                         
  c351  10AE81         LDY ,X++                          
  c354  AF66           STX 0x6,S                         
  c356  3022           LEAX 0x2,Y                        
  c358  AFA4           STX ,Y                            
  c35a  35B6           PULS  A B X Y PC                  

; ---- function API_FD90
API_FD90:
  c35c  3436           PSHS  Y X B A                     
  c35e  AE66           LDX 0x6,S                         
  c360  10AE81         LDY ,X++                          
  c363  AF66           STX 0x6,S                         
  c365  AEA4           LDX ,Y                            
  c367  E780           STB ,X+                           
  c369  AFA4           STX ,Y                            
  c36b  35B6           PULS  A B X Y PC                  

; ---- function API_FD92
API_FD92:
  c36d  3430           PSHS  Y X                         
  c36f  AE64           LDX 0x4,S                         
  c371  10AE81         LDY ,X++                          
  c374  AF64           STX 0x4,S                         
  c376  ACA4           CMPX ,Y                           
  c378  270A           BEQ 0xc384                        
  c37a  AEA4           LDX ,Y                            
  c37c  E682           LDB ,-X                           
  c37e  AFA4           STX ,Y                            
  c380  1A04           ORCC #0x4                         
  c382  2002           BRA 0xc386                        
LAB_c384:
  c384  1CFB           ANDCC #0xfb                       
LAB_c386:
  c386  35B0           PULS  X Y PC                      

; ---- function API_FD28
API_FD28:
  c388  3420           PSHS  Y                           
  c38a  1F02           TFR D,Y                           
  c38c  5F             CLRB                              
LAB_c38d:
  c38d  EB80           ADDB ,X+                          
  c38f  313F           LEAY -0x1,Y                       
  c391  26FA           BNE 0xc38d                        
  c393  4F             CLRA                              
  c394  5D             TSTB                              
  c395  35A0           PULS  Y PC                        

;; Kernel API slot $FE0C: D = min(D, inline word)

; ---- function ClampMaxInline
ClampMaxInline:
  c397  3430           PSHS  Y X                         
  c399  327E           LEAS -0x2,S                       
  c39b  AE66           LDX 0x6,S                         
  c39d  10AE81         LDY ,X++                          
  c3a0  AF66           STX 0x6,S                         
  c3a2  10AFE4         STY ,S                            
  c3a5  10A3E4         CMPD ,S                           
  c3a8  2302           BLS 0xc3ac                        
  c3aa  ECE4           LDD ,S                            
LAB_c3ac:
  c3ac  3262           LEAS 0x2,S                        
  c3ae  35B0           PULS  X Y PC                      
  c3b0  .db 39                                               ; 9

; ---- function API_FE60
API_FE60:
  c3b1  3436           PSHS  Y X B A                     
  c3b3  8D0F           BSR 0xc3c4                        
  c3b5  6D61           TST 0x1,S                         
  c3b7  2605           BNE 0xc3be                        
  c3b9  53             COMB                              
  c3ba  E4A4           ANDB ,Y                           
  c3bc  2002           BRA 0xc3c0                        
LAB_c3be:
  c3be  EAA4           ORB ,Y                            
LAB_c3c0:
  c3c0  E7A4           STB ,Y                            
  c3c2  35B6           PULS  A B X Y PC                  

; ---- function FUN_c3c4
FUN_c3c4:
  c3c4  AE68           LDX 0x8,S                         
  c3c6  10AE81         LDY ,X++                          
  c3c9  AF68           STX 0x8,S                         
  c3cb  EC64           LDD 0x4,S                         
  c3cd  44             LSRA                              
  c3ce  56             RORB                              
  c3cf  44             LSRA                              
  c3d0  56             RORB                              
  c3d1  44             LSRA                              
  c3d2  56             RORB                              
  c3d3  31AB           LEAY D,Y                          
  c3d5  A665           LDA 0x5,S                         
  c3d7  8407           ANDA #0x7                         
  c3d9  8EC3DF         LDX #0xc3df                       
  c3dc  E686           LDB A,X                           
  c3de  39             RTS                               
DAT_c3df:
  c3df  01             ?? 01h                            
  c3e0  .db 02 04 08 10 20 40 80                             ; .... @.

; ---- function API_FE62
API_FE62:
  c3e7  3436           PSHS  Y X B A                     
  c3e9  8DD9           BSR 0xc3c4                        
  c3eb  E4A4           ANDB ,Y                           
  c3ed  2604           BNE 0xc3f3                        
  c3ef  3536           PULS  A B X Y                     
  c3f1  5F             CLRB                              
  c3f2  39             RTS                               
LAB_c3f3:
  c3f3  3536           PULS  A B X Y                     
  c3f5  C6FF           LDB #0xff                         
  c3f7  39             RTS                               

; ---- function API_FD2A
API_FD2A:
  c3f8  3427           PSHS  Y B A CC                    
  c3fa  B6600B         LDA 0x600b                        
  c3fd  3402           PSHS  A                           
  c3ff  EC64           LDD 0x4,S                         
  c401  44             LSRA                              
  c402  44             LSRA                              
  c403  44             LSRA                              
  c404  44             LSRA                              
  c405  8A80           ORA #0x80                         
  c407  B7600B         STA 0x600b                        
  c40a  B78052         STA 0x8052                        
  c40d  860F           LDA #0xf                          
  c40f  A464           ANDA 0x4,S                        
  c411  58             LSLB                              
  c412  49             ROLA                              
  c413  1F02           TFR D,Y                           
  c415  EC62           LDD 0x2,S                         
  c417  EDA4           STD ,Y                            
  c419  3502           PULS  A                           
  c41b  B7600B         STA 0x600b                        
  c41e  B78052         STA 0x8052                        
  c421  3527           PULS CC A B Y                     
  c423  39             RTS                               

; ---- function API_FD2C
API_FD2C:
  c424  3402           PSHS  A                           
  c426  B68053         LDA 0x8053                        
  c429  8441           ANDA #0x41                        
  c42b  8141           CMPA #0x41                        
  c42d  3502           PULS  A                           
  c42f  39             RTS                               

; ---- function API_FD2E
API_FD2E:
  c430  3410           PSHS  X                           
  c432  3427           PSHS  Y B A CC                    
  c434  B6600B         LDA 0x600b                        
  c437  3402           PSHS  A                           
  c439  C6FF           LDB #0xff                         
LAB_c43b:
  c43b  B68053         LDA 0x8053                        
  c43e  8441           ANDA #0x41                        
  c440  8141           CMPA #0x41                        
  c442  2703           BEQ 0xc447                        
  c444  5A             DECB                              
  c445  26F4           BNE 0xc43b                        
LAB_c447:
  c447  8680           LDA #0x80                         
  c449  B7600B         STA 0x600b                        
  c44c  B78052         STA 0x8052                        
  c44f  FC61DF         LDD 0x61df                        
  c452  FD0000         STD 0x0000                        
  c455  EC64           LDD 0x4,S                         
  c457  44             LSRA                              
  c458  44             LSRA                              
  c459  44             LSRA                              
  c45a  44             LSRA                              
  c45b  8A80           ORA #0x80                         
  c45d  B7600B         STA 0x600b                        
  c460  B78052         STA 0x8052                        
  c463  860F           LDA #0xf                          
  c465  A464           ANDA 0x4,S                        
  c467  58             LSLB                              
  c468  49             ROLA                              
  c469  1F02           TFR D,Y                           
  c46b  EC62           LDD 0x2,S                         
  c46d  FD61DF         STD 0x61df                        
  c470  EDA4           STD ,Y                            
  c472  3502           PULS  A                           
  c474  B7600B         STA 0x600b                        
  c477  B78052         STA 0x8052                        
  c47a  3527           PULS CC A B Y                     
  c47c  3510           PULS  X                           
  c47e  39             RTS                               

;; Kernel API slot $FD30: B = DSP 1-3, X = record key of TMS32010 image; writes via bank $80|B

; ---- function DspLoadProgram
DspLoadProgram:
  c47f  3476           PSHS  U Y X B A                   
  c481  3404           PSHS  B                           
  c483  17028E         LBSR 0xc714                       
  c486  1700EE         LBSR 0xc577                       
  c489  E6E4           LDB ,S                            
  c48b  CA80           ORB #0x80                         
  c48d  173590         LBSR 0xfa20                       
  c490  1F10           TFR X,D                           
  c492  17C3C8         LBSR 0x885d                       
  c495  102600C8       LBNE 0xc561                       
  c499  CC0008         LDD #0x8                          
  c49c  17C515         LBSR 0x89b4                       
  c49f  102600BE       LBNE 0xc561                       
  c4a3  17C3CA         LBSR 0x8870                       
  c4a6  102600B7       LBNE 0xc561                       
  c4aa  1F98           TFR B,A                           
  c4ac  17C3C1         LBSR 0x8870                       
  c4af  102600AE       LBNE 0xc561                       
  c4b3  840F           ANDA #0xf                         
  c4b5  58             LSLB                              
  c4b6  49             ROLA                              
  c4b7  1F02           TFR D,Y                           
LAB_c4b9:
  c4b9  FC607A         LDD 0x607a                        
  c4bc  843F           ANDA #0x3f                        
  c4be  3406           PSHS  B A                         
  c4c0  CC3FFF         LDD #0x3fff                       
  c4c3  A3E1           SUBD ,S++                         
  c4c5  10B3607D       CMPD 0x607d                       
  c4c9  2431           BCC 0xc4fc                        
  c4cb  C4FE           ANDB #0xfe                        
  c4cd  3406           PSHS  B A                         
  c4cf  BE607A         LDX 0x607a                        
  c4d2  8D51           BSR 0xc525                        
  c4d4  FC607D         LDD 0x607d                        
  c4d7  A3E4           SUBD ,S                           
  c4d9  FD607D         STD 0x607d                        
  c4dc  ECE4           LDD ,S                            
  c4de  FC607A         LDD 0x607a                        
  c4e1  E3E1           ADDD ,S++                         
  c4e3  FD607A         STD 0x607a                        
  c4e6  8D1E           BSR 0xc506                        
  c4e8  266D           BNE 0xc557                        
  c4ea  8D1A           BSR 0xc506                        
  c4ec  2669           BNE 0xc557                        
  c4ee  8D16           BSR 0xc506                        
  c4f0  2665           BNE 0xc557                        
  c4f2  8D12           BSR 0xc506                        
  c4f4  2661           BNE 0xc557                        
  c4f6  8D0E           BSR 0xc506                        
  c4f8  265D           BNE 0xc557                        
  c4fa  20BD           BRA 0xc4b9                        
LAB_c4fc:
  c4fc  FC607D         LDD 0x607d                        
  c4ff  BE607A         LDX 0x607a                        
  c502  8D21           BSR 0xc525                        
  c504  2051           BRA 0xc557                        

; ---- function FUN_c506
FUN_c506:
  c506  17C367         LBSR 0x8870                       
  c509  2617           BNE 0xc522                        
  c50b  1F98           TFR B,A                           
  c50d  2613           BNE 0xc522                        
  c50f  17C35E         LBSR 0x8870                       
  c512  1F03           TFR D,U                           
  c514  8600           LDA #0x0                          
  c516  B780A2         STA 0x80a2                        
  c519  EFA1           STU ,Y++                          
  c51b  86FF           LDA #0xff                         
  c51d  B780A2         STA 0x80a2                        
  c520  4F             CLRA                              
  c521  39             RTS                               
LAB_c522:
  c522  86FF           LDA #0xff                         
  c524  39             RTS                               

; ---- function FUN_c525
FUN_c525:
  c525  F3607A         ADDD 0x607a                       
  c528  3406           PSHS  B A                         
  c52a  B6600B         LDA 0x600b                        
  c52d  3402           PSHS  A                           
  c52f  F66079         LDB 0x6079                        
LAB_c532:
  c532  F7600B         STB 0x600b                        
  c535  F78052         STB 0x8052                        
  c538  EE81           LDU ,X++                          
  c53a  A6E4           LDA ,S                            
  c53c  B7600B         STA 0x600b                        
  c53f  B78052         STA 0x8052                        
  c542  8600           LDA #0x0                          
  c544  B780A2         STA 0x80a2                        
  c547  EFA1           STU ,Y++                          
  c549  86FF           LDA #0xff                         
  c54b  B780A2         STA 0x80a2                        
  c54e  AC61           CMPX 0x1,S                        
  c550  25E0           BCS 0xc532                        
  c552  3502           PULS  A                           
  c554  3506           PULS  A B                         
  c556  39             RTS                               

; ---- function FUN_c557
FUN_c557:
  c557  1734E0         LBSR 0xfa3a                       
  c55a  3504           PULS  B                           
  c55c  3576           PULS  A B X Y U                   
  c55e  1A04           ORCC #0x4                         
  c560  39             RTS                               
LAB_c561:
  c561  1734D6         LBSR 0xfa3a                       
  c564  3504           PULS  B                           
  c566  3576           PULS  A B X Y U                   
  c568  1CFB           ANDCC #0xfb                       
  c56a  39             RTS                               

; ---- function API_FD32
API_FD32:
  c56b  170192         LBSR 0xc700                       
  c56e  17FE87         LBSR 0xc3f8                       
  c571  170182         LBSR 0xc6f6                       
  c574  1A04           ORCC #0x4                         
  c576  39             RTS                               

; ---- function API_FD34
API_FD34:
  c577  3426           PSHS  Y B A                       
  c579  170184         LBSR 0xc700                       
  c57c  CC0000         LDD #0x0                          
  c57f  108E0000       LDY #0x0                          
  c583  17FE72         LBSR 0xc3f8                       
  c586  17016D         LBSR 0xc6f6                       
  c589  3526           PULS  A B Y                       
  c58b  39             RTS                               

; ---- function API_FD36
API_FD36:
  c58c  3406           PSHS  B A                         
  c58e  CC0032         LDD #0x32                         
LAB_c591:
  c591  830001         SUBD #0x1                         
  c594  2705           BEQ 0xc59b                        
  c596  17FE8B         LBSR 0xc424                       
  c599  26F6           BNE 0xc591                        
LAB_c59b:
  c59b  170162         LBSR 0xc700                       

;; Kernel API slot $FD38: inline ([addr] = word)* until $FFFF, through helper

; ---- function StoreWordsInline2
StoreWordsInline2:
  c59e  3437           PSHS  Y X B A CC                  
  c5a0  AE67           LDX 0x7,S                         
LAB_c5a2:
  c5a2  10AE81         LDY ,X++                          
  c5a5  108CFFFF       CMPY #0xffff                      
  c5a9  2706           BEQ 0xc5b1                        
  c5ab  EC81           LDD ,X++                          
  c5ad  8DBC           BSR 0xc56b                        
  c5af  20F1           BRA 0xc5a2                        
LAB_c5b1:
  c5b1  AF67           STX 0x7,S                         
  c5b3  3537           PULS CC A B X Y                   
  c5b5  39             RTS                               

; ---- function API_FD3A
API_FD3A:
  c5b6  3410           PSHS  X                           
  c5b8  8E8002         LDX #0x8002                       
  c5bb  8D5D           BSR 0xc61a                        
  c5bd  3510           PULS  X                           
  c5bf  39             RTS                               

; ---- function API_FD3C
API_FD3C:
  c5c0  3420           PSHS  Y                           
  c5c2  108E8002       LDY #0x8002                       
  c5c6  8D7C           BSR 0xc644                        
  c5c8  3520           PULS  Y                           
  c5ca  39             RTS                               

; ---- function API_FD3E
API_FD3E:
  c5cb  3410           PSHS  X                           
  c5cd  8E8004         LDX #0x8004                       
  c5d0  8D48           BSR 0xc61a                        
  c5d2  3510           PULS  X                           
  c5d4  39             RTS                               

; ---- function API_FD40
API_FD40:
  c5d5  3420           PSHS  Y                           
  c5d7  108E8004       LDY #0x8004                       
  c5db  8D67           BSR 0xc644                        
  c5dd  3520           PULS  Y                           
  c5df  39             RTS                               

; ---- function API_FD42
API_FD42:
  c5e0  3410           PSHS  X                           
  c5e2  8E8006         LDX #0x8006                       
  c5e5  8D33           BSR 0xc61a                        
  c5e7  3510           PULS  X                           
  c5e9  39             RTS                               

; ---- function API_FD44
API_FD44:
  c5ea  3420           PSHS  Y                           
  c5ec  108E8006       LDY #0x8006                       
  c5f0  8D52           BSR 0xc644                        
  c5f2  3520           PULS  Y                           
  c5f4  39             RTS                               

; ---- function API_FD46
API_FD46:
  c5f5  3410           PSHS  X                           
  c5f7  8E8008         LDX #0x8008                       
  c5fa  8D1E           BSR 0xc61a                        
  c5fc  3510           PULS  X                           
  c5fe  39             RTS                               

; ---- function API_FD48
API_FD48:
  c5ff  108E8008       LDY #0x8008                       
  c603  2041           BRA 0xc646                        

; ---- function API_FD4A
API_FD4A:
  c605  3410           PSHS  X                           
  c607  8E8000         LDX #0x8000                       
  c60a  8D0E           BSR 0xc61a                        
  c60c  3510           PULS  X                           
  c60e  39             RTS                               

; ---- function API_FD4C
API_FD4C:
  c60f  3420           PSHS  Y                           
  c611  108E800E       LDY #0x800e                       
  c615  8D2D           BSR 0xc644                        
  c617  3520           PULS  Y                           
  c619  39             RTS                               

; ---- function API_FD4E
API_FD4E:
  c61a  3410           PSHS  X                           
  c61c  8E0032         LDX #0x32                         
LAB_c61f:
  c61f  B68053         LDA 0x8053                        
  c622  8420           ANDA #0x20                        
  c624  2706           BEQ 0xc62c                        
  c626  301F           LEAX -0x1,X                       
  c628  26F5           BNE 0xc61f                        
  c62a  2012           BRA 0xc63e                        
LAB_c62c:
  c62c  AEE4           LDX ,S                            
  c62e  EC84           LDD ,X                            
  c630  8E0032         LDX #0x32                         
LAB_c633:
  c633  B68053         LDA 0x8053                        
  c636  8420           ANDA #0x20                        
  c638  2704           BEQ 0xc63e                        
  c63a  301F           LEAX -0x1,X                       
  c63c  26F5           BNE 0xc633                        
LAB_c63e:
  c63e  FC8050         LDD 0x8050                        
  c641  3510           PULS  X                           
  c643  39             RTS                               

; ---- function API_FDE0
API_FDE0:
  c644  3420           PSHS  Y                           
LAB_c646:
  c646  3410           PSHS  X                           
  c648  3406           PSHS  B A                         
  c64a  8E0032         LDX #0x32                         
LAB_c64d:
  c64d  B68053         LDA 0x8053                        
  c650  8420           ANDA #0x20                        
  c652  2704           BEQ 0xc658                        
  c654  301F           LEAX -0x1,X                       
  c656  26F5           BNE 0xc64d                        
LAB_c658:
  c658  3506           PULS  A B                         
  c65a  EDA4           STD ,Y                            
  c65c  3510           PULS  X                           
  c65e  3520           PULS  Y                           
  c660  39             RTS                               

; ---- function API_FD50
API_FD50:
  c661  3426           PSHS  Y B A                       
  c663  841F           ANDA #0x1f                        
  c665  108E8000       LDY #0x8000                       
  c669  8DD9           BSR 0xc644                        
  c66b  3526           PULS  A B Y                       
  c66d  39             RTS                               

; ---- function API_FD52
API_FD52:
  c66e  3426           PSHS  Y B A                       
  c670  840F           ANDA #0xf                         
  c672  8A20           ORA #0x20                         
  c674  2006           BRA 0xc67c                        

; ---- function API_FD54
API_FD54:
  c676  3426           PSHS  Y B A                       
  c678  840F           ANDA #0xf                         
  c67a  8A30           ORA #0x30                         
LAB_c67c:
  c67c  108E8000       LDY #0x8000                       
  c680  8DC2           BSR 0xc644                        
  c682  3526           PULS  A B Y                       
  c684  39             RTS                               

; ---- function API_FD56
API_FD56:
  c685  3426           PSHS  Y B A                       
  c687  CC9801         LDD #0x9801                       
  c68a  20F0           BRA 0xc67c                        

; ---- function API_FD58
API_FD58:
  c68c  3426           PSHS  Y B A                       
  c68e  CC9800         LDD #0x9800                       
  c691  20E9           BRA 0xc67c                        

; ---- function API_FD5A
API_FD5A:
  c693  3426           PSHS  Y B A                       
  c695  CC8401         LDD #0x8401                       
  c698  20E2           BRA 0xc67c                        

; ---- function API_FD5C
API_FD5C:
  c69a  3426           PSHS  Y B A                       
  c69c  CC8400         LDD #0x8400                       
  c69f  20DB           BRA 0xc67c                        

; ---- function API_FD5E
API_FD5E:
  c6a1  3426           PSHS  Y B A                       
  c6a3  CC8801         LDD #0x8801                       
  c6a6  20D4           BRA 0xc67c                        

; ---- function API_FD60
API_FD60:
  c6a8  3426           PSHS  Y B A                       
  c6aa  CC8800         LDD #0x8800                       
  c6ad  20CD           BRA 0xc67c                        

; ---- function API_FD62
API_FD62:
  c6af  3426           PSHS  Y B A                       
  c6b1  CC8C01         LDD #0x8c01                       
  c6b4  20C6           BRA 0xc67c                        

; ---- function API_FD64
API_FD64:
  c6b6  3426           PSHS  Y B A                       
  c6b8  CC8C00         LDD #0x8c00                       
  c6bb  20BF           BRA 0xc67c                        

; ---- function API_FD66
API_FD66:
  c6bd  3426           PSHS  Y B A                       
  c6bf  CC9001         LDD #0x9001                       
  c6c2  20B8           BRA 0xc67c                        

; ---- function API_FD68
API_FD68:
  c6c4  3426           PSHS  Y B A                       
  c6c6  CC9000         LDD #0x9000                       
  c6c9  20B1           BRA 0xc67c                        

; ---- function API_FD6A
API_FD6A:
  c6cb  3426           PSHS  Y B A                       
  c6cd  CC9401         LDD #0x9401                       
  c6d0  20AA           BRA 0xc67c                        

; ---- function API_FD6C
API_FD6C:
  c6d2  3426           PSHS  Y B A                       
  c6d4  CC9400         LDD #0x9400                       
  c6d7  20A3           BRA 0xc67c                        

; ---- function API_FD6E
API_FD6E:
  c6d9  3426           PSHS  Y B A                       
  c6db  CC9C01         LDD #0x9c01                       
  c6de  209C           BRA 0xc67c                        

; ---- function API_FD70
API_FD70:
  c6e0  3426           PSHS  Y B A                       
  c6e2  CC9C00         LDD #0x9c00                       
  c6e5  2095           BRA 0xc67c                        

; ---- function API_FD72
API_FD72:
  c6e7  3426           PSHS  Y B A                       
  c6e9  CC8000         LDD #0x8000                       
  c6ec  208E           BRA 0xc67c                        

; ---- function API_FD74
API_FD74:
  c6ee  F68053         LDB 0x8053                        
  c6f1  39             RTS                               

; ---- function API_FD76
API_FD76:
  c6f2  B78055         STA 0x8055                        
  c6f5  39             RTS                               

; ---- function API_FD78
API_FD78:
  c6f6  3407           PSHS  B A CC                      
  c6f8  86FF           LDA #0xff                         
  c6fa  B780A2         STA 0x80a2                        
  c6fd  3507           PULS CC A B                       
  c6ff  39             RTS                               

; ---- function API_FD7A
API_FD7A:
  c700  3407           PSHS  B A CC                      
  c702  8600           LDA #0x0                          
  c704  B780A2         STA 0x80a2                        
  c707  3507           PULS CC A B                       
  c709  39             RTS                               

; ---- function API_FD7C
API_FD7C:
  c70a  3407           PSHS  B A CC                      
  c70c  8600           LDA #0x0                          
  c70e  B780A3         STA 0x80a3                        
  c711  3507           PULS CC A B                       
  c713  39             RTS                               

; ---- function API_FD7E
API_FD7E:
  c714  3407           PSHS  B A CC                      
  c716  86FF           LDA #0xff                         
  c718  B780A3         STA 0x80a3                        
  c71b  3507           PULS CC A B                       
  c71d  39             RTS                               
  c71e  .db 00 00 00 00 43 4F 50 59 52 49 47 48 54 20 31 39  ; ....COPYRIGHT 19
  c72e  .db 38 37 20 45 56 45 4E 54 49 44 45 20 49 4E 43 20  ; 87 EVENTIDE INC 

; ---- function FUN_c73e
FUN_c73e:
  c73e  3436           PSHS  Y X B A                     
  c740  F6600B         LDB 0x600b                        
  c743  F761E6         STB 0x61e6                        
  c746  CCF0F0         LDD #0xf0f0                       
  c749  108E61E1       LDY #0x61e1                       
  c74d  F761E5         STB 0x61e5                        
  c750  17C2E9         LBSR 0x8a3c                       
  c753  2606           BNE 0xc75b                        
  c755  7F61E5         CLR 0x61e5                        
  c758  17DB18         LBSR 0xa273                       
LAB_c75b:
  c75b  CCC77B         LDD #0xc77b                       
  c75e  17D3D5         LBSR 0x9b36                       
  c761  17FB25         LBSR 0xc289                        ; inline[API_FD18]: [$602A]=$C778 [$6030]=$C778 [$602E]=$C778 [$603A]=$C778
  c764  602A           addr 602a                         
  c766  C778           dw C778h                          
  c768  6030           addr 6030                         
  c76a  C778           dw C778h                          
  c76c  602E           addr 602e                         
  c76e  C778           dw C778h                          
  c770  603A           addr 603a                         
  c772  C778           dw C778h                          
  c774  FFFF           dw FFFFh                          
LAB_c776:
  c776  35B6           PULS  A B X Y PC                  

; ---- function Reset
Reset:
  c778  16BC85         LBRA 0x8400                       
  c77b  .db 00 30 00 D6 00 7D 00 00 00 0E 00 26 01 25 01 4A  ; .0...}.....&.%.J
  c78b  .db 00 00 00 04 FF FF 34 04 F6 60 B9 17 E4 D9 00 0F  ; ......4..`......
  c79b  .db 28 20 20 4D 6F 72 65 20 20 29 35 04 39 16 D4 41  ; (  More  )5.9..A
  c7ab  .db 17 D0 36 01                                      ; ..6.
  c7af  466163746F72.. ds "Factory Functions; Service People only !"
  c7d8  .db 17 00 92 CC FF E8 FD 60 2C 39 34 04 F6 60 B9 17  ; .......`,94..`..
  c7e8  .db E4 88 FF 54 20 20 20 20 20 20 20 20 20 20 35 04  ; ...T          5.
  c7f8  .db 39 16 D3 64 34 04 F6 60 B9 17 E4 6E 00 0F 28 20  ; 9..d4..`...n..( 
  c808  .db 20 49 6E 66 6F 20 20 29 35 04 39 34 06 F6 61 E5  ;  Info  )5.94..a.
  c818  .db 17 31 E1 C8 49 C8 3E FC FF EE 36 06 17 CF BD 02  ; .1..I.>...6.....
  c828  .db 00 05 28 4F 53 20 52 65 76 20 04 02 00 03 60 A9  ; ..(OS Rev ....`.
  c838  .db 2C 20 06 00 35 86                                ; , ..5.
  c83e  576974682054.. ds "With Tests"                   
  c849  4E6F20546573.. ds "No Tests "                    
  c853  .db 34 04 F6 60 B9 17 E4 17 00 0F 28 20 56 69 72 67  ; 4..`......( Virg
  c863  .db 69 6E 20 29 35 04 39 16 00 FA 34 36 8E 02 83 17  ; in )5.9...46....
  c873  .db DE 90 4F 34 04 C6 3F E0 E0 FD 60 74 17 C5 E5 01  ; ..O4..?...`t....
  c883  .db 08 02 0A 00 00 03 00 00 3F 00 00 00 00 00 00 00  ; ........?.......
  c893  .db 0A 00 01 00 01 00 00 35 B6 34 36 FC 60 74 34 04  ; .......5.46.`t4.
  c8a3  .db C6 3F E0 E0 17 D1 81 35 B6 34 04 7D 61 E5 26 12  ; .?.....5.4.}a.&.
  c8b3  .db F6 60 B9 17 E3 B9 00 0F 28 45 78 65 72 63 69 73  ; .`......(Exercis
  c8c3  .db 65 29 35 04 39 34 36 17 C1 AF 00 08 61 E1 35 B6  ; e)5.946.....a.5.
  c8d3  .db 34 04 7D 61 E5 26 12 F6 60 B9 17 E3 92 00 0F 28  ; 4.}a.&..`......(
  c8e3  .db 53 65 6C 66 74 65 73 74 29 35 04 39 34 36 17 C1  ; Selftest)5.946..
  c8f3  .db 88 00 0A 61 E1 35 B6                             ; ...a.5.

; ---- function FUN_c8fa
FUN_c8fa:
  c8fa  3436           PSHS  Y X B A                     
  c8fc  CCF0F0         LDD #0xf0f0                       
  c8ff  108E61E1       LDY #0x61e1                       
  c903  17C136         LBSR 0x8a3c                       
  c906  2607           BNE 0xc90f                        
  c908  17C171         LBSR 0x8a7c                        ; inline[API_FD26]: $000C $61E1
  c90b  000C           dw Ch                             
  c90d  61E1           dw 61E1h                          
LAB_c90f:
  c90f  16BAEE         LBRA 0x8400                       

; ---- function FUN_c912
FUN_c912:
  c912  3416           PSHS  X B A                       
  c914  17FDFD         LBSR 0xc714                       
  c917  C604           LDB #0x4                          
  c919  2006           BRA 0xc921                        

; ---- function API_FDFA
API_FDFA:
  c91b  3416           PSHS  X B A                       
  c91d  17FDF4         LBSR 0xc714                       
  c920  5F             CLRB                              
LAB_c921:
  c921  8EFE1E         LDX #0xfe1e                       
LAB_c924:
  c924  17FB58         LBSR 0xc47f                       
  c927  2605           BNE 0xc92e                        
  c929  5C             INCB                              
  c92a  C108           CMPB #0x8                         
  c92c  26F6           BNE 0xc924                        
LAB_c92e:
  c92e  3516           PULS  A B X                       
  c930  39             RTS                               
LAB_c931:
  c931  4C             INCA                              
  c932  F65000         LDB 0x5000                        
  c935  EE80           LDU ,X+                           
  c937  B75000         STA 0x5000                        
  c93a  20F5           BRA 0xc931                        

; ---- function FUN_c93c
FUN_c93c:
  c93c  17CEA5         LBSR 0x97e4                        ; inline[API_FC38]: "{1}"
  c93f  0100           char[2] 01h                       
LAB_c941:
  c941  5C             INCB                              
  c942  F78052         STB 0x8052                        
  c945  F78054         STB 0x8054                        
  c948  F78057         STB 0x8057                        
  c94b  B68056         LDA 0x8056                        
  c94e  17CDD6         LBSR 0x9727                       
  c951  20EE           BRA 0xc941                        

; ---- function FUN_c953
FUN_c953:
  c953  3436           PSHS  Y X B A                     
  c955  8E028B         LDX #0x28b                        
  c958  1F12           TFR X,Y                           
  c95a  C65A           LDB #0x5a                         
  c95c  17DDDD         LBSR 0xa73c                       
  c95f  17DDA3         LBSR 0xa705                       
  c962  C15A           CMPB #0x5a                        
  c964  3536           PULS  A B X Y                     
  c966  39             RTS                               

; ---- function FUN_c967
FUN_c967:
  c967  17E265         LBSR 0xabcf                       
  c96a  17CE77         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Remove all presets ?"
  c96d  0152656D6F76.. char[22] 01h,"Remove all presets ?"
LAB_c983:
  c983  17E2B0         LBSR 0xac36                        ; inline[API_FE3C]: $FFE8 $FFE8
  c986  FFE8           dw FFE8h                          
  c988  FFE8           dw FFE8h                          
LAB_c98a:
  c98a  17C5DD         LBSR 0x8f6a                       
  c98d  26FB           BNE 0xc98a                        
LAB_c98f:
  c98f  17C5D8         LBSR 0x8f6a                       
  c992  27FB           BEQ 0xc98f                        
  c994  C102           CMPB #0x2                         
  c996  2603           BNE 0xc99b                        
  c998  17003F         LBSR 0xc9da                       
LAB_c99b:
  c99b  17E231         LBSR 0xabcf                       
  c99e  17CE43         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Reset the Operating System ?"
  c9a1  015265736574.. char[30] 01h,"Reset the Operating System ?"
LAB_c9bf:
  c9bf  17E274         LBSR 0xac36                        ; inline[API_FE3C]: $FFE8 $FFE8
  c9c2  FFE8           dw FFE8h                          
  c9c4  FFE8           dw FFE8h                          
LAB_c9c6:
  c9c6  17C5A1         LBSR 0x8f6a                       
  c9c9  26FB           BNE 0xc9c6                        
LAB_c9cb:
  c9cb  17C59C         LBSR 0x8f6a                       
  c9ce  27FB           BEQ 0xc9cb                        
  c9d0  C102           CMPB #0x2                         
  c9d2  2603           BNE 0xc9d7                        
  c9d4  170035         LBSR 0xca0c                       
LAB_c9d7:
  c9d7  16BA26         LBRA 0x8400                       

; ---- function FUN_c9da
FUN_c9da:
  c9da  3436           PSHS  Y X B A                     
  c9dc  C6A0           LDB #0xa0                         
  c9de  17303F         LBSR 0xfa20                       
  c9e1  108E0300       LDY #0x300                        
  c9e5  17F7EA         LBSR 0xc1d2                        ; inline[API_FD0C]: $1D00 FF
  c9e8  1D00           dw 1D00h                          
  c9ea  FF             db FFh                            
LAB_c9eb:
  c9eb  108E0180       LDY #0x180                        
  c9ef  17F7E0         LBSR 0xc1d2                        ; inline[API_FD0C]: $0100 FF
  c9f2  0100           dw 100h                           
  c9f4  FF             db FFh                            
LAB_c9f5:
  c9f5  8E884D         LDX #0x884d                       
  c9f8  86A0           LDA #0xa0                         
  c9fa  B7600C         STA 0x600c                        
  c9fd  108E0300       LDY #0x300                        
  ca01  CC0010         LDD #0x10                         
  ca04  1730AF         LBSR 0xfab6                       
  ca07  173030         LBSR 0xfa3a                       
  ca0a  35B6           PULS  A B X Y PC                  

; ---- function FUN_ca0c
FUN_ca0c:
  ca0c  C6A0           LDB #0xa0                         
  ca0e  17300F         LBSR 0xfa20                       
  ca11  108E0000       LDY #0x0                          
  ca15  17F7BA         LBSR 0xc1d2                        ; inline[API_FD0C]: $0180 00
  ca18  0180           dw 180h                           
  ca1a  00             db 0h                             
LAB_ca1b:
  ca1b  108E0118       LDY #0x118                        
  ca1f  17F7B0         LBSR 0xc1d2                        ; inline[API_FD0C]: $0080 00
  ca22  0080           dw 80h                            
  ca24  00             db 0h                             
LAB_ca25:
  ca25  17F878         LBSR 0xc2a0                        ; inline[API_FD1A]: [$028F]=$FF [$0290]=$00 [$0283]=$0A [$028C]=$80 [$028D]=$00 [$028E]=$00 [$0296]=$FF [$0284]=$F8 [$0285]=$F8 [$0286]=$F8 [$0287]=$F8 [$0292]=$FF [$0293]=$FF [$0294]=$FF [$0295]=$FF [$0297]=$03 [$029A]=$00 [$029B]=$00 [$029C]=$00 [$0288]=$00 [$0282]=$FF [$0280]=$00 [$0281]=$00 [$0289]=$00 [$028A]=$00
  ca28  028F           addr 028f                         
  ca2a  FF             db FFh                            
  ca2b  0290           addr 0290                         
  ca2d  00             db 0h                             
  ca2e  0283           addr 0283                         
  ca30  0A             db Ah                             
  ca31  028C           addr 028c                         
  ca33  80             db 80h                            
  ca34  028D           addr 028d                         
  ca36  00             db 0h                             
  ca37  028E           addr 028e                         
  ca39  00             db 0h                             
  ca3a  0296           addr 0296                         
  ca3c  FF             db FFh                            
  ca3d  0284           addr 0284                         
  ca3f  F8             db F8h                            
  ca40  0285           addr 0285                         
  ca42  F8             db F8h                            
  ca43  0286           addr 0286                         
  ca45  F8             db F8h                            
  ca46  0287           addr 0287                         
  ca48  F8             db F8h                            
  ca49  0292           addr 0292                         
  ca4b  FF             db FFh                            
  ca4c  0293           addr 0293                         
  ca4e  FF             db FFh                            
  ca4f  0294           addr 0294                         
  ca51  FF             db FFh                            
  ca52  0295           addr 0295                         
  ca54  FF             db FFh                            
  ca55  0297           addr 0297                         
  ca57  03             db 3h                             
  ca58  029A           addr 029a                         
  ca5a  00             db 0h                             
  ca5b  029B           addr 029b                         
  ca5d  00             db 0h                             
  ca5e  029C           addr 029c                         
  ca60  00             db 0h                             
  ca61  0288           addr 0288                         
  ca63  00             db 0h                             
  ca64  0282           addr 0282                         
  ca66  FF             db FFh                            
  ca67  0280           addr 0280                         
  ca69  00             db 0h                             
  ca6a  0281           addr 0281                         
  ca6c  00             db 0h                             
  ca6d  0289           addr 0289                         
  ca6f  00             db 0h                             
  ca70  028A           addr 028a                         
  ca72  00             db 0h                             
  ca73  FFFF           dw FFFFh                          
LAB_ca75:
  ca75  8E6400         LDX #0x6400                       
LAB_ca78:
  ca78  1F10           TFR X,D                           
  ca7a  17BDE0         LBSR 0x885d                       
  ca7d  270B           BEQ 0xca8a                        
  ca7f  30890100       LEAX 0x100,X                      
  ca83  8CC900         CMPX #0xc900                      
  ca86  270C           BEQ 0xca94                        
  ca88  20EE           BRA 0xca78                        
LAB_ca8a:
  ca8a  17D39F         LBSR 0x9e2c                       
  ca8d  7F0283         CLR 0x0283                        
  ca90  172FA7         LBSR 0xfa3a                       
  ca93  39             RTS                               
LAB_ca94:
  ca94  17CD4D         LBSR 0x97e4                        ; inline[API_FC38]: "{1}NO PROGRAMS"
  ca97  014E4F205052.. char[13] 01h,"NO PROGRAMS"        
LAB_caa4:
  caa4  20FE           BRA 0xcaa4                        

; ---- function FUN_caa6
FUN_caa6:
  caa6  3406           PSHS  B A                         
  caa8  17E124         LBSR 0xabcf                       
  caab  17CD36         LBSR 0x97e4                        ; inline[API_FC38]: "{1}memory still the same {2:28}Press something to escape "
  caae  016D656D6F72.. char[52] 01h,"memory still the same ",02h,"(Press something to escape "
LAB_cae2:
  cae2  3506           PULS  A B                         
  cae4  39             RTS                               

; ---- function FUN_cae5
FUN_cae5:
  cae5  39             RTS                               

; ---- function FUN_cae6
FUN_cae6:
  cae6  3437           PSHS  Y X B A CC                  
LAB_cae8:
  cae8  17CBDF         LBSR 0x96ca                       
  caeb  262F           BNE 0xcb1c                        
  caed  172C77         LBSR 0xf767                       
  caf0  C1FF           CMPB #0xff                        
  caf2  27F4           BEQ 0xcae8                        
  caf4  8E6B00         LDX #0x6b00                       
  caf7  5D             TSTB                              
  caf8  2A0B           BPL 0xcb05                        
  cafa  C1F0           CMPB #0xf0                        
  cafc  2729           BEQ 0xcb27                        
  cafe  7F61E7         CLR 0x61e7                        
  cb01  8601           LDA #0x1                          
  cb03  2007           BRA 0xcb0c                        
LAB_cb05:
  cb05  7D61E7         TST 0x61e7                        
  cb08  2622           BNE 0xcb2c                        
  cb0a  8603           LDA #0x3                          
LAB_cb0c:
  cb0c  108E0013       LDY #0x13                         
LAB_cb10:
  cb10  AD96           JSR [A,X]                         
  cb12  30890030       LEAX 0x30,X                       
  cb16  313F           LEAY -0x1,Y                       
  cb18  26F6           BNE 0xcb10                        
  cb1a  20CC           BRA 0xcae8                        
LAB_cb1c:
  cb1c  171E7D         LBSR 0xe99c                       
  cb1f  17123C         LBSR 0xdd5e                       
  cb22  17000A         LBSR 0xcb2f                       
  cb25  35B7           PULS CC A B X Y PC                
LAB_cb27:
  cb27  86FF           LDA #0xff                         
  cb29  B761E7         STA 0x61e7                        
LAB_cb2c:
  cb2c  16FFB9         LBRA 0xcae8                       

; ---- function API_FE0E
API_FE0E:
  cb2f  3406           PSHS  B A                         
  cb31  7D60FC         TST 0x60fc                        
  cb34  2706           BEQ 0xcb3c                        
  cb36  170E92         LBSR 0xd9cb                       
  cb39  170002         LBSR 0xcb3e                       
LAB_cb3c:
  cb3c  3586           PULS  A B PC                      

; ---- function FUN_cb3e
FUN_cb3e:
  cb3e  3436           PSHS  Y X B A                     
  cb40  F66024         LDB 0x6024                        
  cb43  172EDA         LBSR 0xfa20                       
  cb46  108E0013       LDY #0x13                         
  cb4a  8E6B00         LDX #0x6b00                       
LAB_cb4d:
  cb4d  E6890000       LDB 0x0,X                         
  cb51  C5C0           BITB #0xc0                        
  cb53  2613           BNE 0xcb68                        
  cb55  EC890016       LDD 0x16,X                        
  cb59  10A3890014     CMPD 0x14,X                       
  cb5e  2708           BEQ 0xcb68                        
  cb60  ED890014       STD 0x14,X                        
  cb64  AD990011       JSR [0x11,X]                      
LAB_cb68:
  cb68  30890030       LEAX 0x30,X                       
  cb6c  313F           LEAY -0x1,Y                       
  cb6e  26DD           BNE 0xcb4d                        
  cb70  172EC7         LBSR 0xfa3a                       
  cb73  35B6           PULS  A B X Y PC                  

; ---- function API_FE48
API_FE48:
  cb75  3436           PSHS  Y X B A                     
  cb77  108E6B00       LDY #0x6b00                       
  cb7b  8E0013         LDX #0x13                         
  cb7e  CC0000         LDD #0x0                          
LAB_cb81:
  cb81  EDA90016       STD 0x16,Y                        
  cb85  A7A9001F       STA 0x1f,Y                        
  cb89  31A90030       LEAY 0x30,Y                       
  cb8d  301F           LEAX -0x1,X                       
  cb8f  26F0           BNE 0xcb81                        
  cb91  17FFAA         LBSR 0xcb3e                       
  cb94  1714E7         LBSR 0xe07e                       
  cb97  171C6A         LBSR 0xe804                       
  cb9a  35B6           PULS  A B X Y PC                  

; ---- function FUN_cb9c
FUN_cb9c:
  cb9c  3437           PSHS  Y X B A CC                  
  cb9e  108E6B00       LDY #0x6b00                       
  cba2  17F62D         LBSR 0xc1d2                        ; inline[API_FD0C]: $0390 00
  cba5  0390           dw 390h                           
  cba7  00             db 0h                             
LAB_cba8:
  cba8  108ECAE5       LDY #0xcae5                       
  cbac  8613           LDA #0x13                         
  cbae  8E6B00         LDX #0x6b00                       
LAB_cbb1:
  cbb1  10AF890001     STY 0x1,X                         
  cbb6  10AF890003     STY 0x3,X                         
  cbbb  10AF890005     STY 0x5,X                         
  cbc0  10AF890007     STY 0x7,X                         
  cbc5  C6FF           LDB #0xff                         
  cbc7  E7890000       STB 0x0,X                         
  cbcb  30890030       LEAX 0x30,X                       
  cbcf  4A             DECA                              
  cbd0  26DF           BNE 0xcbb1                        
  cbd2  8DA1           BSR 0xcb75                        
  cbd4  1711EC         LBSR 0xddc3                       
  cbd7  35B7           PULS CC A B X Y PC                

;; Kernel API slot $FE78: as DefineParameter with flags |= $40

; ---- function DefineParameterAlt
DefineParameterAlt:
  cbd9  3437           PSHS  Y X B A CC                  
  cbdb  327C           LEAS -0x4,S                       
  cbdd  C640           LDB #0x40                         
  cbdf  E7E4           STB ,S                            
  cbe1  2006           BRA 0xcbe9                        

;; Kernel API slot $FD84: inline 15-byte record: index, flags, 8-char name, ?, 2 pointers

; ---- function DefineParameter
DefineParameter:
  cbe3  3437           PSHS  Y X B A CC                  
  cbe5  327C           LEAS -0x4,S                       
  cbe7  6FE4           CLR ,S                            
LAB_cbe9:
  cbe9  AE6B           LDX 0xb,S                         
  cbeb  E680           LDB ,X+                           
  cbed  8630           LDA #0x30                         
  cbef  3D             MUL                               
  cbf0  C36B00         ADDD #0x6b00                      
  cbf3  1F02           TFR D,Y                           
  cbf5  E6E4           LDB ,S                            
  cbf7  E7A90000       STB 0x0,Y                         
  cbfb  E680           LDB ,X+                           
  cbfd  E761           STB 0x1,S                         
  cbff  3420           PSHS  Y                           
  cc01  31A90009       LEAY 0x9,Y                        
  cc05  CC0008         LDD #0x8                          
  cc08  17F57D         LBSR 0xc188                       
  cc0b  E680           LDB ,X+                           
  cc0d  3520           PULS  Y                           
  cc0f  8601           LDA #0x1                          
  cc11  A561           BITA 0x1,S                        
  cc13  2704           BEQ 0xcc19                        
  cc15  4F             CLRA                              
  cc16  F36106         ADDD 0x6106                       
LAB_cc19:
  cc19  E7A90013       STB 0x13,Y                        
  cc1d  CC0000         LDD #0x0                          
  cc20  6D61           TST 0x1,S                         
  cc22  2A03           BPL 0xcc27                        
  cc24  FC600D         LDD 0x600d                        
LAB_cc27:
  cc27  ED62           STD 0x2,S                         
  cc29  EC81           LDD ,X++                          
  cc2b  E362           ADDD 0x2,S                        
  cc2d  EDA90011       STD 0x11,Y                        
  cc31  EC81           LDD ,X++                          
  cc33  E362           ADDD 0x2,S                        
  cc35  EDA90007       STD 0x7,Y                         
  cc39  CCCC4E         LDD #0xcc4e                       
  cc3c  EDA90005       STD 0x5,Y                         
  cc40  AF6B           STX 0xb,S                         
  cc42  1F21           TFR Y,X                           
  cc44  171210         LBSR 0xde57                       
  cc47  170808         LBSR 0xd452                       
  cc4a  3264           LEAS 0x4,S                        
  cc4c  35B7           PULS CC A B X Y PC                

; ---- function FUN_cc4e
FUN_cc4e:
  cc4e  3436           PSHS  Y X B A                     
  cc50  BE61F4         LDX 0x61f4                        
  cc53  170453         LBSR 0xd0a9                       
  cc56  C601           LDB #0x1                          
  cc58  17E017         LBSR 0xac72                        ; inline[API_FC8A]: ->$CC69(rel) "( Source )"
  cc5b  000E           dw Eh                             
  cc5d  2820536F7572.. ds "( Source )"                   
LAB_cc67:
  cc67  35B6           PULS  A B X Y PC                  

; ---- function FUN_cc69
FUN_cc69:
  cc69  3436           PSHS  Y X B A                     
  cc6b  BE61F4         LDX 0x61f4                        
  cc6e  17DFA7         LBSR 0xac18                       
  cc71  1712EA         LBSR 0xdf5e                       
  cc74  5F             CLRB                              
  cc75  17CB5B         LBSR 0x97d3                       
  cc78  1712D2         LBSR 0xdf4d                       
  cc7b  17042B         LBSR 0xd0a9                       
  cc7e  C600           LDB #0x0                          
  cc80  17DFEF         LBSR 0xac72                        ; inline[API_FC8A]: ->$CCAA(rel) "( Source )"
  cc83  0027           dw 27h                            
  cc85  2820536F7572.. ds "( Source )"                   
LAB_cc8f:
  cc8f  C603           LDB #0x3                          
  cc91  17DFDE         LBSR 0xac72                        ; inline[API_FC8A]: ->$DE9A(rel) "(  Done  )"
  cc94  1206           dw 1206h                          
  cc96  282020446F6E.. ds "(  Done  )"                   
LAB_cca0:
  cca0  C600           LDB #0x0                          
  cca2  F760B9         STB 0x60b9                        
  cca5  170002         LBSR 0xccaa                       
  cca8  35B6           PULS  A B X Y PC                  

; ---- function FUN_ccaa
FUN_ccaa:
  ccaa  3416           PSHS  X B A                       
  ccac  172083         LBSR 0xed32                       
  ccaf  F660B9         LDB 0x60b9                        
  ccb2  17203A         LBSR 0xecef                       
  ccb5  BE61F4         LDX 0x61f4                        
  ccb8  E6890000       LDB 0x0,X                         
  ccbc  C5C0           BITB #0xc0                        
  ccbe  2705           BEQ 0xccc5                        
  ccc0  CC0012         LDD #0x12                         
  ccc3  2003           BRA 0xccc8                        
LAB_ccc5:
  ccc5  CC0036         LDD #0x36                         
LAB_ccc8:
  ccc8  FD61E8         STD 0x61e8                        
  cccb  8600           LDA #0x0                          
  cccd  171065         LBSR 0xdd35                       
  ccd0  C43F           ANDB #0x3f                        
  ccd2  4F             CLRA                              
  ccd3  FD6074         STD 0x6074                        
  ccd6  17C18E         LBSR 0x8e67                        ; inline[API_FC16]: 01 20 02 96 03 00 03 40 $61E8 $FFF0 $0000 ->$0000 ->$000D $0001 $0001 $0000
  ccd9  01             db 1h                             
  ccda  20             db 20h                            
  ccdb  02             db 2h                             
  ccdc  96             db 96h                            
  ccdd  03             db 3h                             
  ccde  00             db 0h                             
  ccdf  03             db 3h                             
  cce0  40             db 40h                            
  cce1  61E8           dw 61E8h                          
  cce3  FFF0           dw FFF0h                          
  cce5  0000           dw 0h                             
  cce7  0000           addr 0000                         
  cce9  000D           addr 000d                         
  cceb  0001           dw 1h                             
  cced  0001           dw 1h                             
  ccef  0000           dw 0h                             
LAB_ccf1:
  ccf1  170002         LBSR 0xccf6                       
  ccf4  3596           PULS  A B X PC                    

; ---- function FUN_ccf6
FUN_ccf6:
  ccf6  3436           PSHS  Y X B A                     
  ccf8  BE61F4         LDX 0x61f4                        
  ccfb  FC6074         LDD 0x6074                        
  ccfe  17D008         LBSR 0x9d09                        ; inline[API_FE5C]: $0036 $0051
  cd01  0036           dw 36h                            
  cd03  0051           dw 51h                            
LAB_cd05:
  cd05  FD6074         STD 0x6074                        
  cd08  BE61F4         LDX 0x61f4                        
  cd0b  3404           PSHS  B                           
  cd0d  C6C0           LDB #0xc0                         
  cd0f  E4890000       ANDB 0x0,X                        
  cd13  EAE0           ORB ,S+                           
  cd15  E7890000       STB 0x0,X                         
  cd19  17C035         LBSR 0x8d51                       
  cd1c  C43F           ANDB #0x3f                        
  cd1e  8600           LDA #0x0                          
  cd20  171025         LBSR 0xdd48                       
  cd23  C601           LDB #0x1                          
  cd25  17DF4A         LBSR 0xac72                        ; inline[API_FC8A]: ->$CAE5(rel) "          "
  cd28  FDBD           dw FDBDh                          
  cd2a  202020202020.. ds "          "                   
LAB_cd34:
  cd34  C602           LDB #0x2                          
  cd36  17DF39         LBSR 0xac72                        ; inline[API_FC8A]: ->$CAE5(rel) "          "
  cd39  FDAC           dw FDACh                          
  cd3b  202020202020.. ds "          "                   
LAB_cd45:
  cd45  170361         LBSR 0xd0a9                       
  cd48  170F92         LBSR 0xdcdd                       
  cd4b  ADB90005       JSR [0x5,Y]                       
  cd4f  170755         LBSR 0xd4a7                       
  cd52  35B6           PULS  A B X Y PC                  

; ---- function FUN_cd54
FUN_cd54:
  cd54  3436           PSHS  Y X B A                     
  cd56  BE61F4         LDX 0x61f4                        
  cd59  3404           PSHS  B                           
  cd5b  C6C0           LDB #0xc0                         
  cd5d  E4890000       ANDB 0x0,X                        
  cd61  EAE4           ORB ,S                            
  cd63  E7890000       STB 0x0,X                         
  cd67  170F73         LBSR 0xdcdd                       
  cd6a  3504           PULS  B                           
  cd6c  ADB90009       JSR [0x9,Y]                       
  cd70  35B6           PULS  A B X Y PC                  

; ---- function FUN_cd72
FUN_cd72:
  cd72  3406           PSHS  B A                         
  cd74  C602           LDB #0x2                          
  cd76  17DEF9         LBSR 0xac72                        ; inline[API_FC8A]: ->$CD87(rel) "( Channel)"
  cd79  000E           dw Eh                             
  cd7b  28204368616E.. ds "( Channel)"                   
LAB_cd85:
  cd85  3586           PULS  A B PC                      

; ---- function FUN_cd87
FUN_cd87:
  cd87  3416           PSHS  X B A                       
  cd89  171FA6         LBSR 0xed32                       
  cd8c  F660B9         LDB 0x60b9                        
  cd8f  171F5D         LBSR 0xecef                       
  cd92  BE61F4         LDX 0x61f4                        
  cd95  8601           LDA #0x1                          
  cd97  170F9B         LBSR 0xdd35                       
  cd9a  4F             CLRA                              
  cd9b  FD6074         STD 0x6074                        
  cd9e  17C0C6         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 64 01 00 03 00 $000F $0000 $0000 ->$000C ->$0014 $0001 $0001 $0000
  cda1  01             db 1h                             
  cda2  10             db 10h                            
  cda3  02             db 2h                             
  cda4  64             db 64h                            
  cda5  01             db 1h                             
  cda6  00             db 0h                             
  cda7  03             db 3h                             
  cda8  00             db 0h                             
  cda9  000F           dw Fh                             
  cdab  0000           dw 0h                             
  cdad  0000           dw 0h                             
  cdaf  000C           addr 000c                         
  cdb1  0014           addr 0014                         
  cdb3  0001           dw 1h                             
  cdb5  0001           dw 1h                             
  cdb7  0000           dw 0h                             
LAB_cdb9:
  cdb9  3596           PULS  A B X PC                    

; ---- function FUN_cdbb
FUN_cdbb:
  cdbb  17CA26         LBSR 0x97e4                        ; inline[API_FC38]: "{2:26}{3:60A1}"
  cdbe  02260360A100   char[6] 02h,"&",03h,"`",A1h       
LAB_cdc4:
  cdc4  39             RTS                               

; ---- function FUN_cdc5
FUN_cdc5:
  cdc5  3416           PSHS  X B A                       
  cdc7  FC6074         LDD 0x6074                        
  cdca  BE61F4         LDX 0x61f4                        
  cdcd  8601           LDA #0x1                          
  cdcf  170F76         LBSR 0xdd48                       
  cdd2  1706D2         LBSR 0xd4a7                       
  cdd5  3596           PULS  A B X PC                    

; ---- function FUN_cdd7
FUN_cdd7:
  cdd7  3416           PSHS  X B A                       
  cdd9  8601           LDA #0x1                          
  cddb  170F57         LBSR 0xdd35                       
  cdde  C40F           ANDB #0xf                         
  cde0  4F             CLRA                              
  cde1  3606           PSHU  B A                         
  cde3  17C9FE         LBSR 0x97e4                        ; inline[API_FC38]: "{2:23}Ch+{4:2000}{3:60AB}"
  cde6  022343682B04.. char[12] 02h,"#Ch+",04h," "       
LAB_cdf2:
  cdf2  3596           PULS  A B X PC                    

; ---- function FUN_cdf4
FUN_cdf4:
  cdf4  3406           PSHS  B A                         
  cdf6  C601           LDB #0x1                          
  cdf8  17DE77         LBSR 0xac72                        ; inline[API_FC8A]: ->$CE09(rel) "(  Note  )"
  cdfb  000E           dw Eh                             
  cdfd  2820204E6F74.. ds "(  Note  )"                   
LAB_ce07:
  ce07  3586           PULS  A B PC                      

; ---- function FUN_ce09
FUN_ce09:
  ce09  3416           PSHS  X B A                       
  ce0b  171F24         LBSR 0xed32                       
  ce0e  F660B9         LDB 0x60b9                        
  ce11  171EDB         LBSR 0xecef                       
  ce14  BE61F4         LDX 0x61f4                        
  ce17  8602           LDA #0x2                          
  ce19  170F19         LBSR 0xdd35                       
  ce1c  4F             CLRA                              
  ce1d  FD6074         STD 0x6074                        
  ce20  17C044         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 64 00 00 03 00 $007F $0000 $0000 ->$000C ->$001A $0001 $0001 $0000
  ce23  01             db 1h                             
  ce24  10             db 10h                            
  ce25  02             db 2h                             
  ce26  64             db 64h                            
  ce27  00             db 0h                             
  ce28  00             db 0h                             
  ce29  03             db 3h                             
  ce2a  00             db 0h                             
  ce2b  007F           dw 7Fh                            
  ce2d  0000           dw 0h                             
  ce2f  0000           dw 0h                             
  ce31  000C           addr 000c                         
  ce33  001A           addr 001a                         
  ce35  0001           dw 1h                             
  ce37  0001           dw 1h                             
  ce39  0000           dw 0h                             
LAB_ce3b:
  ce3b  3596           PULS  A B X PC                    

; ---- function FUN_ce3d
FUN_ce3d:
  ce3d  FC6074         LDD 0x6074                        
  ce40  171139         LBSR 0xdf7c                       
  ce43  17C99E         LBSR 0x97e4                        ; inline[API_FC38]: "{2:10}{3:60A5}"
  ce46  02100360A500   char[6] 02h,10h,03h,"`",A5h       
LAB_ce4c:
  ce4c  39             RTS                               

; ---- function FUN_ce4d
FUN_ce4d:
  ce4d  3416           PSHS  X B A                       
  ce4f  FC6074         LDD 0x6074                        
  ce52  BE61F4         LDX 0x61f4                        
  ce55  8602           LDA #0x2                          
  ce57  170EEE         LBSR 0xdd48                       
  ce5a  17064A         LBSR 0xd4a7                       
  ce5d  3596           PULS  A B X PC                    

; ---- function FUN_ce5f
FUN_ce5f:
  ce5f  3416           PSHS  X B A                       
  ce61  8602           LDA #0x2                          
  ce63  170ECF         LBSR 0xdd35                       
  ce66  C47F           ANDB #0x7f                        
  ce68  171111         LBSR 0xdf7c                       
  ce6b  17C976         LBSR 0x97e4                        ; inline[API_FC38]: "{2:10}{3:60A5}"
  ce6e  02100360A500   char[6] 02h,10h,03h,"`",A5h       
LAB_ce74:
  ce74  3596           PULS  A B X PC                    

; ---- function FUN_ce76
FUN_ce76:
  ce76  17FF5E         LBSR 0xcdd7                       
  ce79  17FFE3         LBSR 0xce5f                       
  ce7c  39             RTS                               

; ---- function FUN_ce7d
FUN_ce7d:
  ce7d  17FEF2         LBSR 0xcd72                       
  ce80  17FF71         LBSR 0xcdf4                       
  ce83  39             RTS                               

; ---- function FUN_ce84
FUN_ce84:
  ce84  3406           PSHS  B A                         
  ce86  C601           LDB #0x1                          
  ce88  17DDE7         LBSR 0xac72                        ; inline[API_FC8A]: ->$CE99(rel) "( PW Sens)"
  ce8b  000E           dw Eh                             
  ce8d  282050572053.. ds "( PW Sens)"                   
LAB_ce97:
  ce97  3586           PULS  A B PC                      

; ---- function FUN_ce99
FUN_ce99:
  ce99  3416           PSHS  X B A                       
  ce9b  171E94         LBSR 0xed32                       
  ce9e  F660B9         LDB 0x60b9                        
  cea1  171E4B         LBSR 0xecef                       
  cea4  BE61F4         LDX 0x61f4                        
  cea7  8602           LDA #0x2                          
  cea9  170E89         LBSR 0xdd35                       
  ceac  4F             CLRA                              
  cead  17F4E7         LBSR 0xc397                        ; inline[API_FE0C]: $00F0
  ceb0  00F0           dw F0h                            
LAB_ceb2:
  ceb2  FD6074         STD 0x6074                        
  ceb5  17BFAF         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 1E 01 01 03 00 $00F0 $0000 $0000 ->$000C ->$FF85 $0001 $0001 $0000
  ceb8  01             db 1h                             
  ceb9  10             db 10h                            
  ceba  02             db 2h                             
  cebb  1E             db 1Eh                            
  cebc  01             db 1h                             
  cebd  01             db 1h                             
  cebe  03             db 3h                             
  cebf  00             db 0h                             
  cec0  00F0           dw F0h                            
  cec2  0000           dw 0h                             
  cec4  0000           dw 0h                             
  cec6  000C           addr 000c                         
  cec8  FF85           addr ff85                         
  ceca  0001           dw 1h                             
  cecc  0001           dw 1h                             
  cece  0000           dw 0h                             
LAB_ced0:
  ced0  3596           PULS  A B X PC                    

; ---- function FUN_ced2
FUN_ced2:
  ced2  17C90F         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{3:609E}"
  ced5  021D03609E00   char[6] 02h,1Dh,03h,"`",9Eh       
LAB_cedb:
  cedb  39             RTS                               

; ---- function FUN_cedc
FUN_cedc:
  cedc  3416           PSHS  X B A                       
  cede  8602           LDA #0x2                          
  cee0  170E52         LBSR 0xdd35                       
  cee3  4F             CLRA                              
  cee4  17F4B0         LBSR 0xc397                        ; inline[API_FE0C]: $00F0
  cee7  00F0           dw F0h                            
LAB_cee9:
  cee9  3606           PSHU  B A                         
  ceeb  17C8F6         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{4:0100}{3:60A8}"
  ceee  021D04010003.. char[9] 02h,1Dh,04h,01h           
LAB_cef7:
  cef7  3596           PULS  A B X PC                    

; ---- function FUN_cef9
FUN_cef9:
  cef9  17FEDB         LBSR 0xcdd7                       
  cefc  17FFDD         LBSR 0xcedc                       
  ceff  39             RTS                               

; ---- function FUN_cf00
FUN_cf00:
  cf00  17FE6F         LBSR 0xcd72                       
  cf03  17FF7E         LBSR 0xce84                       
  cf06  39             RTS                               

; ---- function FUN_cf07
FUN_cf07:
  cf07  3406           PSHS  B A                         
  cf09  C601           LDB #0x1                          
  cf0b  17DD64         LBSR 0xac72                        ; inline[API_FC8A]: ->$CF1C(rel) "( Cntlr. )"
  cf0e  000E           dw Eh                             
  cf10  2820436E746C.. ds "( Cntlr. )"                   
LAB_cf1a:
  cf1a  3586           PULS  A B PC                      

; ---- function FUN_cf1c
FUN_cf1c:
  cf1c  3416           PSHS  X B A                       
  cf1e  171E11         LBSR 0xed32                       
  cf21  F660B9         LDB 0x60b9                        
  cf24  171DC8         LBSR 0xecef                       
  cf27  BE61F4         LDX 0x61f4                        
  cf2a  8602           LDA #0x2                          
  cf2c  170E06         LBSR 0xdd35                       
  cf2f  4F             CLRA                              
  cf30  17F464         LBSR 0xc397                        ; inline[API_FE0C]: $0079
  cf33  0079           dw 79h                            
LAB_cf35:
  cf35  FD6074         STD 0x6074                        
  cf38  17BF2C         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 32 01 00 03 00 $0079 $0000 $0000 ->$000C ->$FF02 $0001 $0001 $0000
  cf3b  01             db 1h                             
  cf3c  10             db 10h                            
  cf3d  02             db 2h                             
  cf3e  32             db 32h                            
  cf3f  01             db 1h                             
  cf40  00             db 0h                             
  cf41  03             db 3h                             
  cf42  00             db 0h                             
  cf43  0079           dw 79h                            
  cf45  0000           dw 0h                             
  cf47  0000           dw 0h                             
  cf49  000C           addr 000c                         
  cf4b  FF02           addr ff02                         
  cf4d  0001           dw 1h                             
  cf4f  0001           dw 1h                             
  cf51  0000           dw 0h                             
LAB_cf53:
  cf53  3596           PULS  A B X PC                    

; ---- function FUN_cf55
FUN_cf55:
  cf55  17C88C         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{3:60A0}"
  cf58  021D0360A000   char[6] 02h,1Dh,03h,"`",A0h       
LAB_cf5e:
  cf5e  39             RTS                               

; ---- function FUN_cf5f
FUN_cf5f:
  cf5f  3416           PSHS  X B A                       
  cf61  8602           LDA #0x2                          
  cf63  170DCF         LBSR 0xdd35                       
  cf66  4F             CLRA                              
  cf67  17F42D         LBSR 0xc397                        ; inline[API_FE0C]: $0079
  cf6a  0079           dw 79h                            
LAB_cf6c:
  cf6c  3606           PSHU  B A                         
  cf6e  17C873         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}"
  cf71  021D04200003.. char[9] 02h,1Dh,04h," "           
LAB_cf7a:
  cf7a  3596           PULS  A B X PC                    

; ---- function FUN_cf7c
FUN_cf7c:
  cf7c  17FE58         LBSR 0xcdd7                       
  cf7f  17FFDD         LBSR 0xcf5f                       
  cf82  39             RTS                               

; ---- function FUN_cf83
FUN_cf83:
  cf83  17FDEC         LBSR 0xcd72                       
  cf86  17FF7E         LBSR 0xcf07                       
  cf89  39             RTS                               

; ---- function FUN_cf8a
FUN_cf8a:
  cf8a  3406           PSHS  B A                         
  cf8c  C601           LDB #0x1                          
  cf8e  17DCE1         LBSR 0xac72                        ; inline[API_FC8A]: ->$CF9F(rel) "( Cntlr. )"
  cf91  000E           dw Eh                             
  cf93  2820436E746C.. ds "( Cntlr. )"                   
LAB_cf9d:
  cf9d  3586           PULS  A B PC                      

; ---- function FUN_cf9f
FUN_cf9f:
  cf9f  3416           PSHS  X B A                       
  cfa1  171D8E         LBSR 0xed32                       
  cfa4  F660B9         LDB 0x60b9                        
  cfa7  171D45         LBSR 0xecef                       
  cfaa  BE61F4         LDX 0x61f4                        
  cfad  8602           LDA #0x2                          
  cfaf  170D83         LBSR 0xdd35                       
  cfb2  4F             CLRA                              
  cfb3  17F3E1         LBSR 0xc397                        ; inline[API_FE0C]: $001F
  cfb6  001F           dw 1Fh                            
LAB_cfb8:
  cfb8  FD6074         STD 0x6074                        
  cfbb  17BEA9         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 4B 01 00 03 00 $001F $0000 $0000 ->$000C ->$FE7F $0001 $0001 $0000
  cfbe  01             db 1h                             
  cfbf  10             db 10h                            
  cfc0  02             db 2h                             
  cfc1  4B             db 4Bh                            
  cfc2  01             db 1h                             
  cfc3  00             db 0h                             
  cfc4  03             db 3h                             
  cfc5  00             db 0h                             
  cfc6  001F           dw 1Fh                            
  cfc8  0000           dw 0h                             
  cfca  0000           dw 0h                             
  cfcc  000C           addr 000c                         
  cfce  FE7F           addr fe7f                         
  cfd0  0001           dw 1h                             
  cfd2  0001           dw 1h                             
  cfd4  0000           dw 0h                             
LAB_cfd6:
  cfd6  3596           PULS  A B X PC                    

; ---- function FUN_cfd8
FUN_cfd8:
  cfd8  17C809         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{3:60A0}"
  cfdb  021D0360A000   char[6] 02h,1Dh,03h,"`",A0h       
LAB_cfe1:
  cfe1  39             RTS                               

; ---- function FUN_cfe2
FUN_cfe2:
  cfe2  3416           PSHS  X B A                       
  cfe4  8602           LDA #0x2                          
  cfe6  170D4C         LBSR 0xdd35                       
  cfe9  4F             CLRA                              
  cfea  17F3AA         LBSR 0xc397                        ; inline[API_FE0C]: $001F
  cfed  001F           dw 1Fh                            
LAB_cfef:
  cfef  3606           PSHU  B A                         
  cff1  17C7F0         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}"
  cff4  021D04200003.. char[9] 02h,1Dh,04h," "           
LAB_cffd:
  cffd  3596           PULS  A B X PC                    

; ---- function FUN_cfff
FUN_cfff:
  cfff  17FDD5         LBSR 0xcdd7                       
  d002  17FFDD         LBSR 0xcfe2                       
  d005  39             RTS                               

; ---- function FUN_d006
FUN_d006:
  d006  17FD69         LBSR 0xcd72                       
  d009  17FF7E         LBSR 0xcf8a                       
  d00c  39             RTS                               

; ---- function FUN_d00d
FUN_d00d:
  d00d  3406           PSHS  B A                         
  d00f  C601           LDB #0x1                          
  d011  17DC5E         LBSR 0xac72                        ; inline[API_FC8A]: ->$D022(rel) "(Threshld)"
  d014  000E           dw Eh                             
  d016  285468726573.. ds "(Threshld)"                   
LAB_d020:
  d020  3586           PULS  A B PC                      

; ---- function FUN_d022
FUN_d022:
  d022  3416           PSHS  X B A                       
  d024  171D0B         LBSR 0xed32                       
  d027  F660B9         LDB 0x60b9                        
  d02a  171CC2         LBSR 0xecef                       
  d02d  BE61F4         LDX 0x61f4                        
  d030  8602           LDA #0x2                          
  d032  170D00         LBSR 0xdd35                       
  d035  4F             CLRA                              
  d036  FD6074         STD 0x6074                        
  d039  17BE2B         LBSR 0x8e67                        ; inline[API_FC16]: 01 10 02 32 01 00 03 00 $007F $0000 $0000 ->$000C ->$FE01 $0001 $0001 $0000
  d03c  01             db 1h                             
  d03d  10             db 10h                            
  d03e  02             db 2h                             
  d03f  32             db 32h                            
  d040  01             db 1h                             
  d041  00             db 0h                             
  d042  03             db 3h                             
  d043  00             db 0h                             
  d044  007F           dw 7Fh                            
  d046  0000           dw 0h                             
  d048  0000           dw 0h                             
  d04a  000C           addr 000c                         
  d04c  FE01           addr fe01                         
  d04e  0001           dw 1h                             
  d050  0001           dw 1h                             
  d052  0000           dw 0h                             
LAB_d054:
  d054  3596           PULS  A B X PC                    

; ---- function FUN_d056
FUN_d056:
  d056  17C78B         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{3:60A0}"
  d059  021D0360A000   char[6] 02h,1Dh,03h,"`",A0h       
LAB_d05f:
  d05f  39             RTS                               

; ---- function FUN_d060
FUN_d060:
  d060  3416           PSHS  X B A                       
  d062  8602           LDA #0x2                          
  d064  170CCE         LBSR 0xdd35                       
  d067  4F             CLRA                              
  d068  17F32C         LBSR 0xc397                        ; inline[API_FE0C]: $007F
  d06b  007F           dw 7Fh                            
LAB_d06d:
  d06d  3606           PSHU  B A                         
  d06f  17C772         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1D}{4:2000}{3:60AA}"
  d072  021D04200003.. char[9] 02h,1Dh,04h," "           
LAB_d07b:
  d07b  3596           PULS  A B X PC                    

; ---- function FUN_d07d
FUN_d07d:
  d07d  17FD57         LBSR 0xcdd7                       
  d080  17FFDD         LBSR 0xd060                       
  d083  39             RTS                               

; ---- function FUN_d084
FUN_d084:
  d084  17FCEB         LBSR 0xcd72                       
  d087  17FF83         LBSR 0xd00d                       
  d08a  39             RTS                               

; ---- function FUN_d08b
FUN_d08b:
  d08b  3436           PSHS  Y X B A                     
  d08d  CCFFF0         LDD #0xfff0                       
  d090  17B975         LBSR 0x8a08                       
  d093  10BF61EA       STY 0x61ea                        
  d097  F761EC         STB 0x61ec                        
  d09a  CCFFF1         LDD #0xfff1                       
  d09d  17B968         LBSR 0x8a08                       
  d0a0  10BF61ED       STY 0x61ed                        
  d0a4  F761EF         STB 0x61ef                        
  d0a7  35B6           PULS  A B X Y PC                  

; ---- function FUN_d0a9
FUN_d0a9:
  d0a9  3436           PSHS  Y X B A                     
  d0ab  170C2F         LBSR 0xdcdd                       
  d0ae  E6A90000       LDB 0x0,Y                         
  d0b2  D510           BITB <0x10                        
  d0b4  2604           BNE 0xd0ba                        
  d0b6  8D0B           BSR 0xd0c3                        
  d0b8  2003           BRA 0xd0bd                        
LAB_d0ba:
  d0ba  170D44         LBSR 0xde01                       
LAB_d0bd:
  d0bd  ADB90003       JSR [0x3,Y]                       
  d0c1  35B6           PULS  A B X Y PC                  

; ---- function FUN_d0c3
FUN_d0c3:
  d0c3  3436           PSHS  Y X B A                     
  d0c5  C60C           LDB #0xc                          
  d0c7  17C709         LBSR 0x97d3                       
  d0ca  8600           LDA #0x0                          
  d0cc  170C66         LBSR 0xdd35                       
  d0cf  C43F           ANDB #0x3f                        
  d0d1  170C58         LBSR 0xdd2c                       
  d0d4  861C           LDA #0x1c                         
  d0d6  3D             MUL                               
  d0d7  C30008         ADDD #0x8                         
  d0da  BE61F0         LDX 0x61f0                        
  d0dd  308B           LEAX D,X                          
  d0df  F661F2         LDB 0x61f2                        
  d0e2  17293B         LBSR 0xfa20                       
  d0e5  C61C           LDB #0x1c                         
  d0e7  17C769         LBSR 0x9853                       
  d0ea  17294D         LBSR 0xfa3a                       
  d0ed  35B6           PULS  A B X Y PC                  
  d0ef  .db 00 CA E5 CA E5 CA E5 00 00 D4 1D 00 D8 2E CD D7  ; ................
  d0ff  .db CD 72 01 00 D4 1D 00 D4 E6 CD D7 CD 72 00 00 D4  ; .r..........r...
  d10f  .db 1D 00 D5 0E CD D7 CD 72 00 00 D4 1D 00 D5 85 CE  ; .......r........
  d11f  .db F9 CF 00 00 00 D4 1D 00 D5 43 CE F9 CF 00 00 00  ; .........C......
  d12f  .db D4 1D 00 D5 99 CE F9 CF 00 00 00 D4 1D 00 D5 AD  ; ................
  d13f  .db CE F9 CF 00 00 00 D4 1D 00 D5 C1 CE F9 CF 00 00  ; ................
  d14f  .db 00 D4 1D 00 D6 21 CD D7 CD 72 00 00 D4 1D 00 D6  ; .....!...r......
  d15f  .db 8F CD D7 CD 72 00 00 D4 1D 00 D6 5B CD D7 CD 72  ; ....r......[...r
  d16f  .db 00 00 D4 1D 00 D6 A0 CD D7 CD 72 00 00 D4 1D 00  ; ..........r.....
  d17f  .db D6 B1 CD D7 CD 72 00 00 D4 1D 00 D6 C2 CE 76 CE  ; .....r........v.
  d18f  .db 7D 00 00 D4 1D 00 D7 4D CD D7 CD 72 00 00 D4 1D  ; }......M...r....
  d19f  .db 00 D6 FB CD D7 CD 72 00 00 D4 1D 00 D7 5E CD D7  ; ......r......^..
  d1af  .db CD 72 00 00 D4 1D 00 D7 6F CD D7 CD 72 00 00 D4  ; .r......o...r...
  d1bf  .db 1D 00 D7 80 CE 76 CE 7D 00 00 D4 1D 00 D8 B2 CD  ; .....v.}........
  d1cf  .db D7 CD 72 00 00 D4 1D 00 D8 E4 CD D7 CD 72 00 00  ; ..r..........r..
  d1df  .db D4 1D 00 D8 F5 CE 76 CE 7D 00 00 D4 1D 00 D9 0F  ; ......v.}.......
  d1ef  .db CD D7 CD 72 00 00 D4 1D 00 D8 2E CD D7 CD 72 02  ; ...r..........r.
  d1ff  .db 00 D4 1D 00 D8 2E CD D7 CD 72 04 00 D4 1D 00 D8  ; .........r......
  d20f  .db 2E CD D7 CD 72 0B 00 D4 1D 00 D8 2E CD D7 CD 72  ; ....r..........r
  d21f  .db 10 00 D4 1D 00 D8 2E CD D7 CD 72 11 00 D4 1D 00  ; ..........r.....
  d22f  .db D8 2E CD D7 CD 72 12 00 D4 1D 00 D8 2E CD D7 CD  ; .....r..........
  d23f  .db 72 13 00 D4 1D 00 D7 D1 CD D7 CD 72 50 00 D4 1D  ; r..........rP...
  d24f  .db 00 D7 D1 CD D7 CD 72 51 00 D4 1D 00 D7 D1 CD D7  ; ......rQ........
  d25f  .db CD 72 52 00 D4 1D 00 D7 D1 CD D7 CD 72 52 00 D4  ; .rR.........rR..
  d26f  .db 1D 00 D7 D1 CD D7 CD 72 40 00 D4 1D 00 D6 45 D0  ; .......r@.....E.
  d27f  .db 7D D0 84 00 00 D4 1D 00 D6 88 D0 7D D0 84 00 00  ; }..........}....
  d28f  .db D4 1D 00 D8 BD D0 7D D0 84 00 00 D4 1D 00 D7 D1  ; ......}.........
  d29f  .db CD D7 CD 72 41 00 D4 1D 00 D9 A7 CA E5 CA E5 00  ; ...rA...........
  d2af  .db 00 D4 1D 00 D9 B9 CA E5 CA E5 00 00 D4 1D 00 D7  ; ................
  d2bf  .db E8 CF 7C CF 83 00 00 D4 1D 00 D8 45 CF FF D0 06  ; ..|........E....
  d2cf  .db 00 00 D4 1D 00 E0 88 D4 3C CA E5 00 00 D4 1D 00  ; ........<.......
  d2df  .db E0 88 D4 3C CA E5 01 00 D4 1D 00 E0 88 D4 3C CA  ; ...<..........<.
  d2ef  .db E5 02 00 D4 1D 00 E0 88 D4 3C CA E5 03 00 D4 1D  ; .........<......
  d2ff  .db 00 E8 93 CA E5 CA E5 11 00 D4 2C 10 DD C2 CA E5  ; ..........,.....
  d30f  .db CA E5 00 00 DD F2 10 DD C2 CA E5 CA E5 07 00 DD  ; ................
  d31f  .db F2 10 DD C2 CA E5 CA E5 0E 00 DD F2 10 DD C2 CA  ; ................
  d32f  .db E5 CA E5 15 00 DD F2 10 DD C2 CA E5 CA E5 1C 00  ; ................
  d33f  .db DD F2 10 DD C2 CA E5 CA E5 23 00 DD F2 00 CA E5  ; .........#......
  d34f  .db CA E5 CA E5 00 00 D4 1D 00 D5 85 CD D7 CD 72 00  ; ..............r.
  d35f  .db 00 D4 1D 00 D5 43 CD D7 CD 72 00 00 D4 1D 00 D5  ; .....C...r......
  d36f  .db 43 CE 76 CE 7D 00 00 D4 1D 00 D5 43 CE 76 CE 7D  ; C.v.}......C.v.}
  d37f  .db 00 00 D4 1D 00 D5 43 CE 76 CE 7D 00 00 D4 1D 00  ; ......C.v.}.....
  d38f  .db CA E5 D4 3C CA E5 00 00 D4 1D 00 CA E5 D4 3C CA  ; ...<..........<.
  d39f  .db E5 01 00 D4 1D 00 CA E5 D4 3C CA E5 02 00 D4 1D  ; .........<......
  d3af  .db 00 CA E5 D4 3C CA E5 03 00 D4 1D 00 E8 93 E8 D8  ; ....<...........
  d3bf  .db E9 0E 11 00 D4 2C 10 CA E5 CA E5 CA E5 2A 00 DD  ; .....,.......*..
  d3cf  .db F2 10 CA E5 CA E5 CA E5 31 00 DD F2 00 D7 D1 CD  ; ........1.......
  d3df  .db D7 CD 72 40 00 D4 1D 00 D7 D1 CD D7 CD 72 41 00  ; ..r@.........rA.
  d3ef  .db D4 1D 00 D6 45 D0 7D D0 84 00 00 D4 1D 00 D6 88  ; ....E.}.........
  d3ff  .db D0 7D D0 84 00 00 D4 1D 00 D8 BD D0 7D D0 84 00  ; .}..........}...
  d40f  .db 00 D4 1D 00 D7 E8 CF 7C CF 83 00 00 D4 1D 1A 04  ; .......|........
  d41f  .db 39 7D 61 05 27 04 1A 04 20 02 1C FB 39 8D F2 26  ; 9}a.'... ...9..&
  d42f  .db 0B 7D FF E2 26 04 1A 04 20 02 1C FB 39 34 36 E6  ; .}..&... ...946.
  d43f  .db 27 F7 61 1C 17 C3 9E 02 27 22 02 1E 22 00 17 0C  ; '.a.....'".."...
  d44f  .db 0C 35 B6                                         ; .5.

; ---- function FUN_d452
FUN_d452:
  d452  3436           PSHS  Y X B A                     
  d454  7DFFE2         TST 0xffe2                        
  d457  274C           BEQ 0xd4a5                        
  d459  E6890000       LDB 0x0,X                         
  d45d  C130           CMPB #0x30                        
  d45f  2706           BEQ 0xd467                        
  d461  C14A           CMPB #0x4a                        
  d463  2702           BEQ 0xd467                        
  d465  203E           BRA 0xd4a5                        
LAB_d467:
  d467  C4C0           ANDB #0xc0                        
  d469  E7890000       STB 0x0,X                         
  d46d  C600           LDB #0x0                          
  d46f  8600           LDA #0x0                          
  d471  1708D4         LBSR 0xdd48                       
  d474  17C36D         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Function Generator Not Available"
  d477  0146756E6374.. char[34] 01h,"Function Generator Not Available"
LAB_d499:
  d499  CC7530         LDD #0x7530                       
  d49c  17EE9F         LBSR 0xc33e                       
  d49f  CC7530         LDD #0x7530                       
  d4a2  170002         LBSR 0xd4a7                       
LAB_d4a5:
  d4a5  35B6           PULS  A B X Y PC                  

; ---- function FUN_d4a7
FUN_d4a7:
  d4a7  3436           PSHS  Y X B A                     
  d4a9  3420           PSHS  Y                           
  d4ab  10BE61F4       LDY 0x61f4                        
  d4af  31890018       LEAY 0x18,X                       
  d4b3  17ED1C         LBSR 0xc1d2                        ; inline[API_FD0C]: $0016 00
  d4b6  0016           dw 16h                            
  d4b8  00             db 0h                             
LAB_d4b9:
  d4b9  CCDCD4         LDD #0xdcd4                       
  d4bc  ED89001B       STD 0x1b,X                        
  d4c0  1707A5         LBSR 0xdc68                        ; inline[addr:DC68]: $CAE5 $0000
  d4c3  CAE5           dw CAE5h                          
  d4c5  0000           dw 0h                             
LAB_d4c7:
  d4c7  8600           LDA #0x0                          
  d4c9  170869         LBSR 0xdd35                       
  d4cc  C43F           ANDB #0x3f                        
  d4ce  3404           PSHS  B                           
  d4d0  E6890000       LDB 0x0,X                         
  d4d4  C4C0           ANDB #0xc0                        
  d4d6  EAE0           ORB ,S+                           
  d4d8  E7890000       STB 0x0,X                         
  d4dc  3520           PULS  Y                           
  d4de  1707FC         LBSR 0xdcdd                       
  d4e1  ADB801         JSR [0x1,Y]                       
  d4e4  35B6           PULS  A B X Y PC                  

; ---- function FUN_d4e6
FUN_d4e6:
  d4e6  3436           PSHS  Y X B A                     
  d4e8  17077D         LBSR 0xdc68                        ; inline[addr:DC68]: $D4F1 $0000
  d4eb  D4F1           dw D4F1h                          
  d4ed  0000           dw 0h                             
LAB_d4ef:
  d4ef  35B6           PULS  A B X Y PC                  

; ---- function FUN_d4f1
FUN_d4f1:
  d4f1  3406           PSHS  B A                         
  d4f3  1707BD         LBSR 0xdcb3                       
  d4f6  102607DA       LBNE 0xdcd4                       
  d4fa  C1E0           CMPB #0xe0                        
  d4fc  102607D4       LBNE 0xdcd4                       
LAB_d500:
  d500  17068E         LBSR 0xdb91                       
  d503  832000         SUBD #0x2000                      
  d506  58             LSLB                              
  d507  49             ROLA                              
  d508  ED890016       STD 0x16,X                        
  d50c  20F2           BRA 0xd500                        

; ---- function FUN_d50e
FUN_d50e:
  d50e  3436           PSHS  Y X B A                     
  d510  170755         LBSR 0xdc68                        ; inline[addr:DC68]: $D519 $0000
  d513  D519           dw D519h                          
  d515  0000           dw 0h                             
LAB_d517:
  d517  35B6           PULS  A B X Y PC                  

; ---- function FUN_d519
FUN_d519:
  d519  3406           PSHS  B A                         
  d51b  170795         LBSR 0xdcb3                       
  d51e  102607B2       LBNE 0xdcd4                       
  d522  C1E0           CMPB #0xe0                        
  d524  102607AC       LBNE 0xdcd4                       
LAB_d528:
  d528  170666         LBSR 0xdb91                       
  d52b  10832000       CMPD #0x2000                      
  d52f  2407           BCC 0xd538                        
  d531  3406           PSHS  B A                         
  d533  CC4000         LDD #0x4000                       
  d536  A3E1           SUBD ,S++                         
LAB_d538:
  d538  832000         SUBD #0x2000                      
  d53b  58             LSLB                              
  d53c  49             ROLA                              
  d53d  ED890016       STD 0x16,X                        
  d541  20E5           BRA 0xd528                        

; ---- function FUN_d543
FUN_d543:
  d543  3406           PSHS  B A                         
  d545  170720         LBSR 0xdc68                        ; inline[addr:DC68]: $D557 $0000
  d548  D557           dw D557h                          
  d54a  0000           dw 0h                             
LAB_d54c:
  d54c  1706F5         LBSR 0xdc44                       
  d54f  C600           LDB #0x0                          
  d551  E7890022       STB 0x22,X                        
  d555  3586           PULS  A B PC                      

; ---- function FUN_d557
FUN_d557:
  d557  3406           PSHS  B A                         
  d559  170757         LBSR 0xdcb3                       
  d55c  10260774       LBNE 0xdcd4                       
  d560  C1E0           CMPB #0xe0                        
  d562  2715           BEQ 0xd579                        
LAB_d564:
  d564  1705A5         LBSR 0xdb0c                       
  d567  17054B         LBSR 0xdab5                       
  d56a  26F8           BNE 0xd564                        
  d56c  3404           PSHS  B                           
  d56e  170656         LBSR 0xdbc7                       
  d571  ED890016       STD 0x16,X                        
  d575  3504           PULS  B                           
  d577  20EB           BRA 0xd564                        
LAB_d579:
  d579  170615         LBSR 0xdb91                       
  d57c  170680         LBSR 0xdbff                       
  d57f  ED890016       STD 0x16,X                        
  d583  20F4           BRA 0xd579                        

; ---- function FUN_d585
FUN_d585:
  d585  3406           PSHS  B A                         
  d587  1706DE         LBSR 0xdc68                        ; inline[addr:DC68]: $D557 $0000
  d58a  D557           dw D557h                          
  d58c  0000           dw 0h                             
LAB_d58e:
  d58e  1706B3         LBSR 0xdc44                       
  d591  C602           LDB #0x2                          
  d593  E7890022       STB 0x22,X                        
  d597  3586           PULS  A B PC                      

; ---- function FUN_d599
FUN_d599:
  d599  3406           PSHS  B A                         
  d59b  1706CA         LBSR 0xdc68                        ; inline[addr:DC68]: $D557 $0000
  d59e  D557           dw D557h                          
  d5a0  0000           dw 0h                             
LAB_d5a2:
  d5a2  17069F         LBSR 0xdc44                       
  d5a5  C604           LDB #0x4                          
  d5a7  E7890022       STB 0x22,X                        
  d5ab  3586           PULS  A B PC                      

; ---- function FUN_d5ad
FUN_d5ad:
  d5ad  3406           PSHS  B A                         
  d5af  1706B6         LBSR 0xdc68                        ; inline[addr:DC68]: $D557 $0000
  d5b2  D557           dw D557h                          
  d5b4  0000           dw 0h                             
LAB_d5b6:
  d5b6  17068B         LBSR 0xdc44                       
  d5b9  C606           LDB #0x6                          
  d5bb  E7890022       STB 0x22,X                        
  d5bf  3586           PULS  A B PC                      

; ---- function FUN_d5c1
FUN_d5c1:
  d5c1  3406           PSHS  B A                         
  d5c3  1706A2         LBSR 0xdc68                        ; inline[addr:DC68]: $D5D5 $0000
  d5c6  D5D5           dw D5D5h                          
  d5c8  0000           dw 0h                             
LAB_d5ca:
  d5ca  170677         LBSR 0xdc44                       
  d5cd  C680           LDB #0x80                         
  d5cf  E7890022       STB 0x22,X                        
  d5d3  3586           PULS  A B PC                      

; ---- function FUN_d5d5
FUN_d5d5:
  d5d5  3406           PSHS  B A                         
  d5d7  1706D9         LBSR 0xdcb3                       
  d5da  102606F6       LBNE 0xdcd4                       
  d5de  C1E0           CMPB #0xe0                        
  d5e0  2733           BEQ 0xd615                        
LAB_d5e2:
  d5e2  170527         LBSR 0xdb0c                       
  d5e5  C180           CMPB #0x80                        
  d5e7  27F9           BEQ 0xd5e2                        
  d5e9  4D             TSTA                              
  d5ea  27F6           BEQ 0xd5e2                        
  d5ec  A689001F       LDA 0x1f,X                        
  d5f0  8101           CMPA #0x1                         
  d5f2  2608           BNE 0xd5fc                        
  d5f4  A6890020       LDA 0x20,X                        
  d5f8  A7890021       STA 0x21,X                        
LAB_d5fc:
  d5fc  3404           PSHS  B                           
  d5fe  A6890020       LDA 0x20,X                        
  d602  A0890021       SUBA 0x21,X                       
  d606  A789001E       STA 0x1e,X                        
  d60a  1705BA         LBSR 0xdbc7                       
  d60d  ED890016       STD 0x16,X                        
  d611  3504           PULS  B                           
  d613  20CD           BRA 0xd5e2                        
LAB_d615:
  d615  170579         LBSR 0xdb91                       
  d618  1705E4         LBSR 0xdbff                       
  d61b  ED890016       STD 0x16,X                        
  d61f  20F4           BRA 0xd615                        

; ---- function FUN_d621
FUN_d621:
  d621  3406           PSHS  B A                         
  d623  170642         LBSR 0xdc68                        ; inline[addr:DC68]: $D62C $0000
  d626  D62C           dw D62Ch                          
  d628  0000           dw 0h                             
LAB_d62a:
  d62a  3586           PULS  A B PC                      

; ---- function FUN_d62c
FUN_d62c:
  d62c  3406           PSHS  B A                         
  d62e  170682         LBSR 0xdcb3                       
  d631  1026069F       LBNE 0xdcd4                       
LAB_d635:
  d635  1704D4         LBSR 0xdb0c                       
  d638  3404           PSHS  B                           
  d63a  E689001F       LDB 0x1f,X                        
  d63e  1703F8         LBSR 0xda39                       
  d641  3504           PULS  B                           
  d643  20F0           BRA 0xd635                        

; ---- function FUN_d645
FUN_d645:
  d645  3406           PSHS  B A                         
  d647  17FFD7         LBSR 0xd621                       
LAB_d64a:
  d64a  C610           LDB #0x10                         
  d64c  E7890025       STB 0x25,X                        
  d650  8602           LDA #0x2                          
  d652  1706E0         LBSR 0xdd35                       
  d655  E789001A       STB 0x1a,X                        
  d659  3586           PULS  A B PC                      

; ---- function FUN_d65b
FUN_d65b:
  d65b  3406           PSHS  B A                         
  d65d  170608         LBSR 0xdc68                        ; inline[addr:DC68]: $D66C $0000
  d660  D66C           dw D66Ch                          
  d662  0000           dw 0h                             
LAB_d664:
  d664  C600           LDB #0x0                          
  d666  E7890022       STB 0x22,X                        
  d66a  3586           PULS  A B PC                      

; ---- function FUN_d66c
FUN_d66c:
  d66c  3406           PSHS  B A                         
  d66e  170642         LBSR 0xdcb3                       
  d671  1026065F       LBNE 0xdcd4                       
LAB_d675:
  d675  170494         LBSR 0xdb0c                       
  d678  17043A         LBSR 0xdab5                       
  d67b  26F8           BNE 0xd675                        
  d67d  E6890021       LDB 0x21,X                        
  d681  27F2           BEQ 0xd675                        
  d683  1703B3         LBSR 0xda39                       
  d686  20ED           BRA 0xd675                        

; ---- function FUN_d688
FUN_d688:
  d688  3406           PSHS  B A                         
  d68a  17FFCE         LBSR 0xd65b                       
  d68d  20BB           BRA 0xd64a                        

; ---- function FUN_d68f
FUN_d68f:
  d68f  3406           PSHS  B A                         
  d691  1705D4         LBSR 0xdc68                        ; inline[addr:DC68]: $D66C $0000
  d694  D66C           dw D66Ch                          
  d696  0000           dw 0h                             
LAB_d698:
  d698  C602           LDB #0x2                          
  d69a  E7890022       STB 0x22,X                        
  d69e  3586           PULS  A B PC                      

; ---- function FUN_d6a0
FUN_d6a0:
  d6a0  3406           PSHS  B A                         
  d6a2  1705C3         LBSR 0xdc68                        ; inline[addr:DC68]: $D66C $0000
  d6a5  D66C           dw D66Ch                          
  d6a7  0000           dw 0h                             
LAB_d6a9:
  d6a9  C604           LDB #0x4                          
  d6ab  E7890022       STB 0x22,X                        
  d6af  3586           PULS  A B PC                      

; ---- function FUN_d6b1
FUN_d6b1:
  d6b1  3406           PSHS  B A                         
  d6b3  1705B2         LBSR 0xdc68                        ; inline[addr:DC68]: $D66C $0000
  d6b6  D66C           dw D66Ch                          
  d6b8  0000           dw 0h                             
LAB_d6ba:
  d6ba  C606           LDB #0x6                          
  d6bc  E7890022       STB 0x22,X                        
  d6c0  3586           PULS  A B PC                      

; ---- function FUN_d6c2
FUN_d6c2:
  d6c2  3406           PSHS  B A                         
  d6c4  1705A1         LBSR 0xdc68                        ; inline[addr:DC68]: $D6D6 $0000
  d6c7  D6D6           dw D6D6h                          
  d6c9  0000           dw 0h                             
LAB_d6cb:
  d6cb  8602           LDA #0x2                          
  d6cd  170665         LBSR 0xdd35                       
  d6d0  E789001E       STB 0x1e,X                        
  d6d4  3586           PULS  A B PC                      

; ---- function FUN_d6d6
FUN_d6d6:
  d6d6  3406           PSHS  B A                         
  d6d8  1705D8         LBSR 0xdcb3                       
  d6db  102605F5       LBNE 0xdcd4                       
LAB_d6df:
  d6df  17042A         LBSR 0xdb0c                       
  d6e2  C180           CMPB #0x80                        
  d6e4  27F9           BEQ 0xd6df                        
  d6e6  4D             TSTA                              
  d6e7  27F6           BEQ 0xd6df                        
  d6e9  E6890020       LDB 0x20,X                        
  d6ed  E189001E       CMPB 0x1e,X                       
  d6f1  26EC           BNE 0xd6df                        
  d6f3  1F89           TFR A,B                           
  d6f5  4F             CLRA                              
  d6f6  170340         LBSR 0xda39                       
  d6f9  20E4           BRA 0xd6df                        

; ---- function FUN_d6fb
FUN_d6fb:
  d6fb  3406           PSHS  B A                         
  d6fd  170568         LBSR 0xdc68                        ; inline[addr:DC68]: $D70C $0000
  d700  D70C           dw D70Ch                          
  d702  0000           dw 0h                             
LAB_d704:
  d704  C600           LDB #0x0                          
  d706  E7890022       STB 0x22,X                        
  d70a  3586           PULS  A B PC                      

; ---- function FUN_d70c
FUN_d70c:
  d70c  3406           PSHS  B A                         
  d70e  1705A2         LBSR 0xdcb3                       
  d711  102605BF       LBNE 0xdcd4                       
  d715  C1A0           CMPB #0xa0                        
  d717  2713           BEQ 0xd72c                        
LAB_d719:
  d719  1703F0         LBSR 0xdb0c                       
  d71c  170396         LBSR 0xdab5                       
  d71f  20F8           BRA 0xd719                        

; ---- function FUN_d721
FUN_d721:
  d721  CCD72A         LDD #0xd72a                       
  d724  ED890003       STD 0x3,X                         
  d728  3586           PULS  A B PC                      

; ---- function FUN_d72a
FUN_d72a:
  d72a  3406           PSHS  B A                         
LAB_d72c:
  d72c  CCD735         LDD #0xd735                       
  d72f  ED890003       STD 0x3,X                         
  d733  3586           PULS  A B PC                      

; ---- function FUN_d735
FUN_d735:
  d735  3406           PSHS  B A                         
  d737  E189001E       CMPB 0x1e,X                       
  d73b  26E4           BNE 0xd721                        
  d73d  CCD746         LDD #0xd746                       
  d740  ED890003       STD 0x3,X                         
  d744  3586           PULS  A B PC                      

; ---- function FUN_d746
FUN_d746:
  d746  3406           PSHS  B A                         
  d748  1702EE         LBSR 0xda39                       
  d74b  20DF           BRA 0xd72c                        

; ---- function FUN_d74d
FUN_d74d:
  d74d  3406           PSHS  B A                         
  d74f  170516         LBSR 0xdc68                        ; inline[addr:DC68]: $D70C $0000
  d752  D70C           dw D70Ch                          
  d754  0000           dw 0h                             
LAB_d756:
  d756  C602           LDB #0x2                          
  d758  E7890022       STB 0x22,X                        
  d75c  3586           PULS  A B PC                      

; ---- function FUN_d75e
FUN_d75e:
  d75e  3406           PSHS  B A                         
  d760  170505         LBSR 0xdc68                        ; inline[addr:DC68]: $D70C $0000
  d763  D70C           dw D70Ch                          
  d765  0000           dw 0h                             
LAB_d767:
  d767  C604           LDB #0x4                          
  d769  E7890022       STB 0x22,X                        
  d76d  3586           PULS  A B PC                      

; ---- function FUN_d76f
FUN_d76f:
  d76f  3406           PSHS  B A                         
  d771  1704F4         LBSR 0xdc68                        ; inline[addr:DC68]: $D70C $0000
  d774  D70C           dw D70Ch                          
  d776  0000           dw 0h                             
LAB_d778:
  d778  C606           LDB #0x6                          
  d77a  E7890022       STB 0x22,X                        
  d77e  3586           PULS  A B PC                      

; ---- function FUN_d780
FUN_d780:
  d780  3406           PSHS  B A                         
  d782  1704E3         LBSR 0xdc68                        ; inline[addr:DC68]: $D794 $0000
  d785  D794           dw D794h                          
  d787  0000           dw 0h                             
LAB_d789:
  d789  C602           LDB #0x2                          
  d78b  1705A7         LBSR 0xdd35                       
  d78e  E789001E       STB 0x1e,X                        
  d792  3586           PULS  A B PC                      

; ---- function FUN_d794
FUN_d794:
  d794  3406           PSHS  B A                         
  d796  17051A         LBSR 0xdcb3                       
  d799  10260537       LBNE 0xdcd4                       
  d79d  C1A0           CMPB #0xa0                        
  d79f  10260531       LBNE 0xdcd4                       
  d7a3  200B           BRA 0xd7b0                        

; ---- function FUN_d7a5
FUN_d7a5:
  d7a5  CCD7AE         LDD #0xd7ae                       
  d7a8  ED890003       STD 0x3,X                         
  d7ac  3586           PULS  A B PC                      

; ---- function FUN_d7ae
FUN_d7ae:
  d7ae  3406           PSHS  B A                         
LAB_d7b0:
  d7b0  CCD7B9         LDD #0xd7b9                       
  d7b3  ED890003       STD 0x3,X                         
  d7b7  3586           PULS  A B PC                      

; ---- function FUN_d7b9
FUN_d7b9:
  d7b9  3406           PSHS  B A                         
  d7bb  E189001E       CMPB 0x1e,X                       
  d7bf  26E4           BNE 0xd7a5                        
  d7c1  CCD7CA         LDD #0xd7ca                       
  d7c4  ED890003       STD 0x3,X                         
  d7c8  3586           PULS  A B PC                      

; ---- function FUN_d7ca
FUN_d7ca:
  d7ca  3406           PSHS  B A                         
  d7cc  17026A         LBSR 0xda39                       
  d7cf  20DF           BRA 0xd7b0                        

; ---- function FUN_d7d1
FUN_d7d1:
  d7d1  3406           PSHS  B A                         
  d7d3  E627           LDB 0x7,Y                         
LAB_d7d5:
  d7d5  E789001E       STB 0x1e,X                        
  d7d9  17048C         LBSR 0xdc68                        ; inline[addr:DC68]: $D7F1 $0000
  d7dc  D7F1           dw D7F1h                          
  d7de  0000           dw 0h                             
LAB_d7e0:
  d7e0  C601           LDB #0x1                          
  d7e2  E7890026       STB 0x26,X                        
  d7e6  3586           PULS  A B PC                      

; ---- function FUN_d7e8
FUN_d7e8:
  d7e8  3406           PSHS  B A                         
  d7ea  8602           LDA #0x2                          
  d7ec  170546         LBSR 0xdd35                       
  d7ef  20E4           BRA 0xd7d5                        

; ---- function FUN_d7f1
FUN_d7f1:
  d7f1  3406           PSHS  B A                         
  d7f3  1704BD         LBSR 0xdcb3                       
  d7f6  102604DA       LBNE 0xdcd4                       
  d7fa  C1B0           CMPB #0xb0                        
  d7fc  102604D4       LBNE 0xdcd4                       
LAB_d800:
  d800  CCD809         LDD #0xd809                       
  d803  ED890003       STD 0x3,X                         
  d807  3586           PULS  A B PC                      

; ---- function FUN_d809
FUN_d809:
  d809  3406           PSHS  B A                         
  d80b  E189001E       CMPB 0x1e,X                       
  d80f  2610           BNE 0xd821                        
  d811  CCD81A         LDD #0xd81a                       
  d814  ED890003       STD 0x3,X                         
  d818  3586           PULS  A B PC                      

; ---- function FUN_d81a
FUN_d81a:
  d81a  3406           PSHS  B A                         
  d81c  17021A         LBSR 0xda39                       
  d81f  20DF           BRA 0xd800                        
LAB_d821:
  d821  CCD82A         LDD #0xd82a                       
  d824  ED890003       STD 0x3,X                         
  d828  3586           PULS  A B PC                      

; ---- function FUN_d82a
FUN_d82a:
  d82a  3406           PSHS  B A                         
  d82c  20D2           BRA 0xd800                        

; ---- function FUN_d82e
FUN_d82e:
  d82e  3406           PSHS  B A                         
  d830  E627           LDB 0x7,Y                         
LAB_d832:
  d832  E789001E       STB 0x1e,X                        
  d836  CB20           ADDB #0x20                        
  d838  E789001F       STB 0x1f,X                        
  d83c  170429         LBSR 0xdc68                        ; inline[addr:DC68]: $D84E $0000
  d83f  D84E           dw D84Eh                          
  d841  0000           dw 0h                             
LAB_d843:
  d843  3586           PULS  A B PC                      

; ---- function FUN_d845
FUN_d845:
  d845  3406           PSHS  B A                         
  d847  8602           LDA #0x2                          
  d849  1704E9         LBSR 0xdd35                       
  d84c  20E4           BRA 0xd832                        

; ---- function FUN_d84e
FUN_d84e:
  d84e  3406           PSHS  B A                         
  d850  170460         LBSR 0xdcb3                       
  d853  1026047D       LBNE 0xdcd4                       
  d857  C1B0           CMPB #0xb0                        
  d859  10260477       LBNE 0xdcd4                       
LAB_d85d:
  d85d  CCD866         LDD #0xd866                       
  d860  ED890003       STD 0x3,X                         
  d864  3586           PULS  A B PC                      

; ---- function FUN_d866
FUN_d866:
  d866  3406           PSHS  B A                         
  d868  E189001E       CMPB 0x1e,X                       
  d86c  2620           BNE 0xd88e                        
  d86e  CCD877         LDD #0xd877                       
  d871  ED890003       STD 0x3,X                         
  d875  3586           PULS  A B PC                      

; ---- function FUN_d877
FUN_d877:
  d877  3406           PSHS  B A                         
  d879  E7890020       STB 0x20,X                        
LAB_d87d:
  d87d  A6890020       LDA 0x20,X                        
  d881  E689001D       LDB 0x1d,X                        
  d885  58             LSLB                              
  d886  44             LSRA                              
  d887  56             RORB                              
  d888  ED890016       STD 0x16,X                        
  d88c  20CF           BRA 0xd85d                        
LAB_d88e:
  d88e  E189001F       CMPB 0x1f,X                       
  d892  2611           BNE 0xd8a5                        
  d894  CCD89D         LDD #0xd89d                       
  d897  ED890003       STD 0x3,X                         
  d89b  3586           PULS  A B PC                      

; ---- function FUN_d89d
FUN_d89d:
  d89d  3406           PSHS  B A                         
  d89f  E789001D       STB 0x1d,X                        
  d8a3  20D8           BRA 0xd87d                        
LAB_d8a5:
  d8a5  CCD8AE         LDD #0xd8ae                       
  d8a8  ED890003       STD 0x3,X                         
  d8ac  3586           PULS  A B PC                      

; ---- function FUN_d8ae
FUN_d8ae:
  d8ae  3406           PSHS  B A                         
  d8b0  20AB           BRA 0xd85d                        

; ---- function FUN_d8b2
FUN_d8b2:
  d8b2  3436           PSHS  Y X B A                     
  d8b4  1703B1         LBSR 0xdc68                        ; inline[addr:DC68]: $D8C5 $0000
  d8b7  D8C5           dw D8C5h                          
  d8b9  0000           dw 0h                             
LAB_d8bb:
  d8bb  35B6           PULS  A B X Y PC                  

; ---- function FUN_d8bd
FUN_d8bd:
  d8bd  3406           PSHS  B A                         
  d8bf  17FFF0         LBSR 0xd8b2                       
  d8c2  16FD85         LBRA 0xd64a                       

; ---- function FUN_d8c5
FUN_d8c5:
  d8c5  3406           PSHS  B A                         
  d8c7  1703E9         LBSR 0xdcb3                       
  d8ca  10260406       LBNE 0xdcd4                       
  d8ce  C1D0           CMPB #0xd0                        
  d8d0  10260400       LBNE 0xdcd4                       
LAB_d8d4:
  d8d4  CCD8DD         LDD #0xd8dd                       
  d8d7  ED890003       STD 0x3,X                         
  d8db  3586           PULS  A B PC                      

; ---- function FUN_d8dd
FUN_d8dd:
  d8dd  3406           PSHS  B A                         
  d8df  170157         LBSR 0xda39                       
  d8e2  20F0           BRA 0xd8d4                        

; ---- function FUN_d8e4
FUN_d8e4:
  d8e4  3436           PSHS  Y X B A                     
  d8e6  17037F         LBSR 0xdc68                        ; inline[addr:DC68]: $D920 $0000
  d8e9  D920           dw D920h                          
  d8eb  0000           dw 0h                             
LAB_d8ed:
  d8ed  C600           LDB #0x0                          
  d8ef  E7890022       STB 0x22,X                        
  d8f3  35B6           PULS  A B X Y PC                  

; ---- function FUN_d8f5
FUN_d8f5:
  d8f5  3436           PSHS  Y X B A                     
  d8f7  17036E         LBSR 0xdc68                        ; inline[addr:DC68]: $D920 $0000
  d8fa  D920           dw D920h                          
  d8fc  0000           dw 0h                             
LAB_d8fe:
  d8fe  C601           LDB #0x1                          
  d900  E7890022       STB 0x22,X                        
  d904  8602           LDA #0x2                          
  d906  17042C         LBSR 0xdd35                       
  d909  E789001E       STB 0x1e,X                        
  d90d  35B6           PULS  A B X Y PC                  

; ---- function FUN_d90f
FUN_d90f:
  d90f  3436           PSHS  Y X B A                     
  d911  170354         LBSR 0xdc68                        ; inline[addr:DC68]: $D920 $0000
  d914  D920           dw D920h                          
  d916  0000           dw 0h                             
LAB_d918:
  d918  C602           LDB #0x2                          
  d91a  E7890022       STB 0x22,X                        
  d91e  35B6           PULS  A B X Y PC                  

; ---- function FUN_d920
FUN_d920:
  d920  3406           PSHS  B A                         
  d922  17038E         LBSR 0xdcb3                       
  d925  102603AB       LBNE 0xdcd4                       
  d929  C190           CMPB #0x90                        
  d92b  273C           BEQ 0xd969                        
  d92d  C180           CMPB #0x80                        
  d92f  102603A1       LBNE 0xdcd4                       
LAB_d933:
  d933  CCD93C         LDD #0xd93c                       
  d936  ED890003       STD 0x3,X                         
  d93a  3586           PULS  A B PC                      

; ---- function FUN_d93c
FUN_d93c:
  d93c  3406           PSHS  B A                         
  d93e  A6890022       LDA 0x22,X                        
  d942  8101           CMPA #0x1                         
  d944  2606           BNE 0xd94c                        
  d946  E189001E       CMPB 0x1e,X                       
  d94a  2610           BNE 0xd95c                        
LAB_d94c:
  d94c  CCD955         LDD #0xd955                       
  d94f  ED890003       STD 0x3,X                         
  d953  3586           PULS  A B PC                      

; ---- function FUN_d955
FUN_d955:
  d955  3406           PSHS  B A                         
  d957  1700DF         LBSR 0xda39                       
  d95a  20D7           BRA 0xd933                        
LAB_d95c:
  d95c  CCD965         LDD #0xd965                       
  d95f  ED890003       STD 0x3,X                         
  d963  3586           PULS  A B PC                      

; ---- function FUN_d965
FUN_d965:
  d965  3406           PSHS  B A                         
  d967  20CA           BRA 0xd933                        

; ---- function FUN_d969
FUN_d969:
  d969  A6890022       LDA 0x22,X                        
  d96d  8102           CMPA #0x2                         
  d96f  261E           BNE 0xd98f                        
  d971  CCD97A         LDD #0xd97a                       
  d974  ED890003       STD 0x3,X                         
  d978  3586           PULS  A B PC                      

; ---- function FUN_d97a
FUN_d97a:
  d97a  3406           PSHS  B A                         
  d97c  CCD985         LDD #0xd985                       
  d97f  ED890003       STD 0x3,X                         
  d983  3586           PULS  A B PC                      

; ---- function FUN_d985
FUN_d985:
  d985  3406           PSHS  B A                         
  d987  5D             TSTB                              
  d988  27DF           BEQ 0xd969                        
  d98a  1700AC         LBSR 0xda39                       
  d98d  20DA           BRA 0xd969                        
LAB_d98f:
  d98f  CCD998         LDD #0xd998                       
  d992  ED890003       STD 0x3,X                         
  d996  3586           PULS  A B PC                      

; ---- function FUN_d998
FUN_d998:
  d998  3406           PSHS  B A                         
  d99a  CCD9A3         LDD #0xd9a3                       
  d99d  ED890003       STD 0x3,X                         
  d9a1  3586           PULS  A B PC                      

; ---- function FUN_d9a3
FUN_d9a3:
  d9a3  3406           PSHS  B A                         
  d9a5  20C2           BRA 0xd969                        

; ---- function FUN_d9a7
FUN_d9a7:
  d9a7  3406           PSHS  B A                         
  d9a9  1702BC         LBSR 0xdc68                        ; inline[addr:DC68]: $CAE5 $0000
  d9ac  CAE5           dw CAE5h                          
  d9ae  0000           dw 0h                             
LAB_d9b0:
  d9b0  CCCAE5         LDD #0xcae5                       
  d9b3  ED890003       STD 0x3,X                         
  d9b7  3586           PULS  A B PC                      

; ---- function FUN_d9b9
FUN_d9b9:
  d9b9  3406           PSHS  B A                         
  d9bb  1702AA         LBSR 0xdc68                        ; inline[addr:DC68]: $CAE5 $0000
  d9be  CAE5           dw CAE5h                          
  d9c0  0000           dw 0h                             
LAB_d9c2:
  d9c2  CCCAE5         LDD #0xcae5                       
  d9c5  ED890003       STD 0x3,X                         
  d9c9  3586           PULS  A B PC                      

; ---- function FUN_d9cb
FUN_d9cb:
  d9cb  3476           PSHS  U Y X B A                   
  d9cd  17AD67         LBSR 0x8737                       
  d9d0  FC60EB         LDD 0x60eb                        
  d9d3  58             LSLB                              
  d9d4  49             ROLA                              
  d9d5  58             LSLB                              
  d9d6  49             ROLA                              
  d9d7  58             LSLB                              
  d9d8  49             ROLA                              
  d9d9  3606           PSHU  B A                         
  d9db  CC50C0         LDD #0x50c0                       
  d9de  3606           PSHU  B A                         
  d9e0  17E488         LBSR 0xbe6b                       
  d9e3  3706           PULU  A B                         
  d9e5  FD60FE         STD 0x60fe                        
  d9e8  8D47           BSR 0xda31                        
  d9ea  FC60EB         LDD 0x60eb                        
  d9ed  3606           PSHU  B A                         
  d9ef  CC0006         LDD #0x6                          
  d9f2  3606           PSHU  B A                         
  d9f4  17E51B         LBSR 0xbf12                       
  d9f7  CC45A9         LDD #0x45a9                       
  d9fa  3606           PSHU  B A                         
  d9fc  17E46C         LBSR 0xbe6b                       
  d9ff  3706           PULU  A B                         
  da01  8D2E           BSR 0xda31                        
  da03  FD6100         STD 0x6100                        
  da06  108E0013       LDY #0x13                         
  da0a  8E6B00         LDX #0x6b00                       
LAB_da0d:
  da0d  E6890000       LDB 0x0,X                         
  da11  C128           CMPB #0x28                        
  da13  2706           BEQ 0xda1b                        
  da15  C129           CMPB #0x29                        
  da17  2707           BEQ 0xda20                        
  da19  200C           BRA 0xda27                        
LAB_da1b:
  da1b  FC60FE         LDD 0x60fe                        
  da1e  2003           BRA 0xda23                        
LAB_da20:
  da20  FC6100         LDD 0x6100                        
LAB_da23:
  da23  ED890016       STD 0x16,X                        
LAB_da27:
  da27  30890030       LEAX 0x30,X                       
  da2b  313F           LEAY -0x1,Y                       
  da2d  26DE           BNE 0xda0d                        
  da2f  35F6           PULS  A B X Y U PC                

; ---- function FUN_da31
FUN_da31:
  da31  85C0           BITA #0xc0                        
  da33  2703           BEQ 0xda38                        
  da35  CC3FFF         LDD #0x3fff                       
LAB_da38:
  da38  39             RTS                               

; ---- function FUN_da39
FUN_da39:
  da39  6D890025       TST 0x25,X                        
  da3d  2614           BNE 0xda53                        
  da3f  8D54           BSR 0xda95                        
  da41  260A           BNE 0xda4d                        
  da43  1F98           TFR B,A                           
  da45  58             LSLB                              
  da46  44             LSRA                              
  da47  56             RORB                              
LAB_da48:
  da48  ED890016       STD 0x16,X                        
LAB_da4c:
  da4c  39             RTS                               
LAB_da4d:
  da4d  C140           CMPB #0x40                        
  da4f  2432           BCC 0xda83                        
  da51  2019           BRA 0xda6c                        
LAB_da53:
  da53  6D890026       TST 0x26,X                        
  da57  2706           BEQ 0xda5f                        
  da59  C140           CMPB #0x40                        
  da5b  221F           BHI 0xda7c                        
  da5d  2006           BRA 0xda65                        
LAB_da5f:
  da5f  E189001A       CMPB 0x1a,X                       
  da63  2417           BCC 0xda7c                        
LAB_da65:
  da65  CC0000         LDD #0x0                          
  da68  8D2B           BSR 0xda95                        
  da6a  27DC           BEQ 0xda48                        
LAB_da6c:
  da6c  E6890025       LDB 0x25,X                        
  da70  C501           BITB #0x1                         
  da72  27D8           BEQ 0xda4c                        
  da74  C4FE           ANDB #0xfe                        
  da76  E7890025       STB 0x25,X                        
  da7a  20D0           BRA 0xda4c                        
LAB_da7c:
  da7c  CC3FFF         LDD #0x3fff                       
  da7f  8D14           BSR 0xda95                        
  da81  27C5           BEQ 0xda48                        
LAB_da83:
  da83  E6890025       LDB 0x25,X                        
  da87  C501           BITB #0x1                         
  da89  26C1           BNE 0xda4c                        
  da8b  CA01           ORB #0x1                          
  da8d  E7890025       STB 0x25,X                        
  da91  8D0C           BSR 0xda9f                        
  da93  20B7           BRA 0xda4c                        

; ---- function FUN_da95
FUN_da95:
  da95  3404           PSHS  B                           
  da97  C6C0           LDB #0xc0                         
  da99  E5890000       BITB 0x0,X                        
  da9d  3584           PULS  B PC                        

; ---- function FUN_da9f
FUN_da9f:
  da9f  3476           PSHS  U Y X B A                   
  daa1  7D60FC         TST 0x60fc                        
  daa4  270D           BEQ 0xdab3                        
  daa6  F66024         LDB 0x6024                        
  daa9  171F74         LBSR 0xfa20                       
  daac  AD990011       JSR [0x11,X]                      
  dab0  171F87         LBSR 0xfa3a                       
LAB_dab3:
  dab3  35F6           PULS  A B X Y U PC                

; ---- function FUN_dab5
FUN_dab5:
  dab5  3426           PSHS  Y B A                       
  dab7  C180           CMPB #0x80                        
  dab9  274D           BEQ 0xdb08                        
  dabb  4D             TSTA                              
  dabc  274A           BEQ 0xdb08                        
  dabe  A789001D       STA 0x1d,X                        
  dac2  108EDACE       LDY #0xdace                       
  dac6  E6890022       LDB 0x22,X                        
  daca  C406           ANDB #0x6                         
switchD:
  dacc  6EB5           JMP [B,Y]                         
switchdataD_dace:
  dace  DA             ?? DAh                            
  dacf  .db F4                                               ; .
  dad0  DAEC           addr daec                         
  dad2  DAD6           addr dad6                         
  dad4  DAE2           addr dae2                         
caseD_4:
  dad6  E689001E       LDB 0x1e,X                        
  dada  E1890020       CMPB 0x20,X                       
  dade  2514           BCS 0xdaf4                        
  dae0  200A           BRA 0xdaec                        

; ---- function caseD_6
caseD_6:
  dae2  E689001E       LDB 0x1e,X                        
  dae6  E1890020       CMPB 0x20,X                       
  daea  2208           BHI 0xdaf4                        

; ---- function caseD_2
caseD_2:
  daec  E689001F       LDB 0x1f,X                        
  daf0  C101           CMPB #0x1                         
  daf2  2612           BNE 0xdb06                        
caseD_0:
  daf4  E6890020       LDB 0x20,X                        
  daf8  E789001E       STB 0x1e,X                        
  dafc  A689001D       LDA 0x1d,X                        
  db00  A7890021       STA 0x21,X                        
  db04  1A04           ORCC #0x4                         
LAB_db06:
  db06  35A6           PULS  A B Y PC                    
LAB_db08:
  db08  1CFB           ANDCC #0xfb                       
  db0a  20FA           BRA 0xdb06                        

; ---- function FUN_db0c
FUN_db0c:
  db0c  E789001D       STB 0x1d,X                        
  db10  3506           PULS  A B                         
  db12  ED89001B       STD 0x1b,X                        
  db16  E689001D       LDB 0x1d,X                        
  db1a  C180           CMPB #0x80                        
  db1c  2743           BEQ 0xdb61                        
  db1e  C190           CMPB #0x90                        
  db20  2703           BEQ 0xdb25                        
  db22  1601AF         LBRA 0xdcd4                       
LAB_db25:
  db25  CCDB2E         LDD #0xdb2e                       
  db28  ED890003       STD 0x3,X                         
  db2c  3586           PULS  A B PC                      

; ---- function FUN_db2e
FUN_db2e:
  db2e  3406           PSHS  B A                         
  db30  E789001D       STB 0x1d,X                        
  db34  CCDB3D         LDD #0xdb3d                       
  db37  ED890003       STD 0x3,X                         
  db3b  3586           PULS  A B PC                      

; ---- function FUN_db3d
FUN_db3d:
  db3d  3406           PSHS  B A                         
  db3f  1F98           TFR B,A                           
  db41  5D             TSTB                              
  db42  2712           BEQ 0xdb56                        
  db44  6C89001F       INC 0x1f,X                        
  db48  E689001D       LDB 0x1d,X                        
  db4c  E7890020       STB 0x20,X                        
LAB_db50:
  db50  C690           LDB #0x90                         
  db52  6E99001B       JMP [0x1b,X]                      
LAB_db56:
  db56  C602           LDB #0x2                          
  db58  F56117         BITB 0x6117                       
  db5b  27F3           BEQ 0xdb50                        
  db5d  8D27           BSR 0xdb86                        
  db5f  20EF           BRA 0xdb50                        
LAB_db61:
  db61  CCDB6A         LDD #0xdb6a                       
  db64  ED890003       STD 0x3,X                         
  db68  3586           PULS  A B PC                      

; ---- function FUN_db6a
FUN_db6a:
  db6a  3406           PSHS  B A                         
  db6c  CCDB75         LDD #0xdb75                       
  db6f  ED890003       STD 0x3,X                         
  db73  3586           PULS  A B PC                      

; ---- function FUN_db75
FUN_db75:
  db75  3406           PSHS  B A                         
  db77  C601           LDB #0x1                          
  db79  F56117         BITB 0x6117                       
  db7c  2702           BEQ 0xdb80                        
  db7e  8D06           BSR 0xdb86                        
LAB_db80:
  db80  C680           LDB #0x80                         
  db82  6E99001B       JMP [0x1b,X]                      

; ---- function FUN_db86
FUN_db86:
  db86  6D89001F       TST 0x1f,X                        
  db8a  2704           BEQ 0xdb90                        
  db8c  6A89001F       DEC 0x1f,X                        
LAB_db90:
  db90  39             RTS                               

; ---- function FUN_db91
FUN_db91:
  db91  3506           PULS  A B                         
  db93  ED89001B       STD 0x1b,X                        
  db97  CCDBA0         LDD #0xdba0                       
  db9a  ED890003       STD 0x3,X                         
  db9e  3586           PULS  A B PC                      

; ---- function FUN_dba0
FUN_dba0:
  dba0  3406           PSHS  B A                         
  dba2  E789001D       STB 0x1d,X                        
  dba6  CCDBAF         LDD #0xdbaf                       
  dba9  ED890003       STD 0x3,X                         
  dbad  3586           PULS  A B PC                      

; ---- function FUN_dbaf
FUN_dbaf:
  dbaf  3406           PSHS  B A                         
  dbb1  1F98           TFR B,A                           
  dbb3  E689001D       LDB 0x1d,X                        
  dbb7  58             LSLB                              
  dbb8  44             LSRA                              
  dbb9  56             RORB                              
  dbba  10830000       CMPD #0x0                         
  dbbe  2603           BNE 0xdbc3                        
  dbc0  CC0001         LDD #0x1                          
LAB_dbc3:
  dbc3  6E99001B       JMP [0x1b,X]                      

; ---- function FUN_dbc7
FUN_dbc7:
  dbc7  17FECB         LBSR 0xda95                       
  dbca  2755           BEQ 0xdc21                        
  dbcc  A689001E       LDA 0x1e,X                        
  dbd0  E6890000       LDB 0x0,X                         
  dbd4  C143           CMPB #0x43                        
  dbd6  270A           BEQ 0xdbe2                        
  dbd8  C144           CMPB #0x44                        
  dbda  270E           BEQ 0xdbea                        
  dbdc  C145           CMPB #0x45                        
  dbde  2712           BEQ 0xdbf2                        
  dbe0  2018           BRA 0xdbfa                        
LAB_dbe2:
  dbe2  A189001A       CMPA 0x1a,X                       
  dbe6  2656           BNE 0xdc3e                        
  dbe8  2010           BRA 0xdbfa                        
LAB_dbea:
  dbea  A189001A       CMPA 0x1a,X                       
  dbee  254E           BCS 0xdc3e                        
  dbf0  2008           BRA 0xdbfa                        
LAB_dbf2:
  dbf2  A189001A       CMPA 0x1a,X                       
  dbf6  2246           BHI 0xdc3e                        
  dbf8  2000           BRA 0xdbfa                        
LAB_dbfa:
  dbfa  17FEA2         LBSR 0xda9f                       
  dbfd  203F           BRA 0xdc3e                        

; ---- function FUN_dbff
FUN_dbff:
  dbff  17FE93         LBSR 0xda95                       
  dc02  263A           BNE 0xdc3e                        
  dc04  10830000       CMPD #0x0                         
  dc08  2603           BNE 0xdc0d                        
  dc0a  CC0001         LDD #0x1                          
LAB_dc0d:
  dc0d  832000         SUBD #0x2000                      
  dc10  3606           PSHU  B A                         
  dc12  EC890025       LDD 0x25,X                        
  dc16  3606           PSHU  B A                         
  dc18  17E250         LBSR 0xbe6b                       
  dc1b  3706           PULU  A B                         
  dc1d  ED890023       STD 0x23,X                        
LAB_dc21:
  dc21  A689001E       LDA 0x1e,X                        
  dc25  5F             CLRB                              
  dc26  44             LSRA                              
  dc27  56             RORB                              
  dc28  6D890022       TST 0x22,X                        
  dc2c  2B11           BMI 0xdc3f                        
  dc2e  E3890023       ADDD 0x23,X                       
  dc32  2A03           BPL 0xdc37                        
  dc34  CC0000         LDD #0x0                          
LAB_dc37:
  dc37  8540           BITA #0x40                        
  dc39  2703           BEQ 0xdc3e                        
  dc3b  CC3FFF         LDD #0x3fff                       
LAB_dc3e:
  dc3e  39             RTS                               
LAB_dc3f:
  dc3f  E3890023       ADDD 0x23,X                       
  dc43  39             RTS                               

; ---- function FUN_dc44
FUN_dc44:
  dc44  3406           PSHS  B A                         
  dc46  8602           LDA #0x2                          
  dc48  1700EA         LBSR 0xdd35                       
  dc4b  1F98           TFR B,A                           
  dc4d  5F             CLRB                              
  dc4e  44             LSRA                              
  dc4f  56             RORB                              
  dc50  3606           PSHU  B A                         
  dc52  17E39E         LBSR 0xbff3                        ; inline[API_FE20]: interp table, 5 points
  dc55  02             db 2h                             
  dc56  00000CCD199A.. dw[5]                             
LAB_dc60:
  dc60  3706           PULU  A B                         
  dc62  ED890025       STD 0x25,X                        
  dc66  3586           PULS  A B PC                      

; ---- function FUN_dc68
FUN_dc68:
  dc68  3426           PSHS  Y B A                       
  dc6a  10AE64         LDY 0x4,S                         
  dc6d  ECA1           LDD ,Y++                          
  dc6f  ED890001       STD 0x1,X                         
  dc73  ECA1           LDD ,Y++                          
  dc75  ED890016       STD 0x16,X                        
  dc79  10AF64         STY 0x4,S                         
  dc7c  8601           LDA #0x1                          
  dc7e  1700B4         LBSR 0xdd35                       
  dc81  C40F           ANDB #0xf                         
  dc83  E7890019       STB 0x19,X                        
  dc87  8600           LDA #0x0                          
  dc89  1700A9         LBSR 0xdd35                       
  dc8c  C43F           ANDB #0x3f                        
  dc8e  3404           PSHS  B                           
  dc90  C6C0           LDB #0xc0                         
  dc92  E4890000       ANDB 0x0,X                        
  dc96  EAE0           ORB ,S+                           
  dc98  E7890000       STB 0x0,X                         
  dc9c  8602           LDA #0x2                          
  dc9e  170094         LBSR 0xdd35                       
  dca1  E789001A       STB 0x1a,X                        
  dca5  6F890022       CLR 0x22,X                        
  dca9  6F890025       CLR 0x25,X                        
  dcad  6F890026       CLR 0x26,X                        
  dcb1  35A6           PULS  A B Y PC                    

; ---- function FUN_dcb3
FUN_dcb3:
  dcb3  3404           PSHS  B                           
  dcb5  1F98           TFR B,A                           
  dcb7  C4F0           ANDB #0xf0                        
  dcb9  7D608A         TST 0x608a                        
  dcbc  2B11           BMI 0xdccf                        
  dcbe  840F           ANDA #0xf                         
  dcc0  A7E4           STA ,S                            
  dcc2  B6608A         LDA 0x608a                        
  dcc5  AB890019       ADDA 0x19,X                       
  dcc9  840F           ANDA #0xf                         
  dccb  A1E4           CMPA ,S                           
  dccd  2002           BRA 0xdcd1                        
LAB_dccf:
  dccf  1A04           ORCC #0x4                         
LAB_dcd1:
  dcd1  3261           LEAS 0x1,S                        
  dcd3  39             RTS                               

; ---- function FUN_dcd4
FUN_dcd4:
  dcd4  CCCAE5         LDD #0xcae5                       
  dcd7  ED890003       STD 0x3,X                         
  dcdb  3586           PULS  A B PC                      

; ---- function FUN_dcdd
FUN_dcdd:
  dcdd  3406           PSHS  B A                         
  dcdf  C6C0           LDB #0xc0                         
  dce1  E4890000       ANDB 0x0,X                        
  dce5  2720           BEQ 0xdd07                        
  dce7  FC61ED         LDD 0x61ed                        
  dcea  FD61F0         STD 0x61f0                        
  dced  F661EF         LDB 0x61ef                        
  dcf0  F761F2         STB 0x61f2                        
  dcf3  108ED34C       LDY #0xd34c                       
  dcf7  E6890000       LDB 0x0,X                         
  dcfb  C43F           ANDB #0x3f                        
  dcfd  4F             CLRA                              
  dcfe  17BDF2         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $0012
  dd01  0000           dw 0h                             
  dd03  0012           dw 12h                            
LAB_dd05:
  dd05  201E           BRA 0xdd25                        
LAB_dd07:
  dd07  FC61EA         LDD 0x61ea                        
  dd0a  FD61F0         STD 0x61f0                        
  dd0d  F661EC         LDB 0x61ec                        
  dd10  F761F2         STB 0x61f2                        
  dd13  108ED0EF       LDY #0xd0ef                       
  dd17  E6890000       LDB 0x0,X                         
  dd1b  C43F           ANDB #0x3f                        
  dd1d  4F             CLRA                              
  dd1e  17BDD2         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $0036
  dd21  0000           dw 0h                             
  dd23  0036           dw 36h                            
LAB_dd25:
  dd25  860B           LDA #0xb                          
  dd27  3D             MUL                               
  dd28  31AB           LEAY D,Y                          
  dd2a  3586           PULS  A B PC                      

; ---- function FUN_dd2c
FUN_dd2c:
  dd2c  C43F           ANDB #0x3f                        
  dd2e  C136           CMPB #0x36                        
  dd30  2302           BLS 0xdd34                        
  dd32  C636           LDB #0x36                         
LAB_dd34:
  dd34  39             RTS                               

; ---- function FUN_dd35
FUN_dd35:
  dd35  3412           PSHS  X A                         
  dd37  1F89           TFR A,B                           
  dd39  EB890013       ADDB 0x13,X                       
  dd3d  4F             CLRA                              
  dd3e  8E0000         LDX #0x0                          
  dd41  308B           LEAX D,X                          
  dd43  17C9BF         LBSR 0xa705                       
  dd46  3592           PULS  A X PC                      

; ---- function FUN_dd48
FUN_dd48:
  dd48  3436           PSHS  Y X B A                     
  dd4a  1F89           TFR A,B                           
  dd4c  EB890013       ADDB 0x13,X                       
  dd50  4F             CLRA                              
  dd51  108E0000       LDY #0x0                          
  dd55  31AB           LEAY D,Y                          
  dd57  E661           LDB 0x1,S                         
  dd59  17C9E0         LBSR 0xa73c                       
  dd5c  35B6           PULS  A B X Y PC                  

; ---- function FUN_dd5e
FUN_dd5e:
  dd5e  3436           PSHS  Y X B A                     
  dd60  C613           LDB #0x13                         
  dd62  8E6B00         LDX #0x6b00                       
LAB_dd65:
  dd65  3404           PSHS  B                           
  dd67  A6890000       LDA 0x0,X                         
  dd6b  C606           LDB #0x6                          
  dd6d  108EDE1F       LDY #0xde1f                       
LAB_dd71:
  dd71  3404           PSHS  B                           
  dd73  A1A90000       CMPA 0x0,Y                        
  dd77  260E           BNE 0xdd87                        
  dd79  3406           PSHS  B A                         
  dd7b  ECB90001       LDD [0x1,Y]                       
  dd7f  44             LSRA                              
  dd80  56             RORB                              
  dd81  ED890016       STD 0x16,X                        
  dd85  3506           PULS  A B                         
LAB_dd87:
  dd87  3504           PULS  B                           
  dd89  31A90007       LEAY 0x7,Y                        
  dd8d  5A             DECB                              
  dd8e  26E1           BNE 0xdd71                        
  dd90  3504           PULS  B                           
  dd92  30890030       LEAX 0x30,X                       
  dd96  5A             DECB                              
  dd97  26CC           BNE 0xdd65                        
  dd99  35B6           PULS  A B X Y PC                  

; ---- function FUN_dd9b
FUN_dd9b:
  dd9b  3436           PSHS  Y X B A                     
  dd9d  864B           LDA #0x4b                         
LAB_dd9f:
  dd9f  C613           LDB #0x13                         
  dda1  8E6B00         LDX #0x6b00                       
LAB_dda4:
  dda4  A1890000       CMPA 0x0,X                        
  dda8  2603           BNE 0xddad                        
  ddaa  17FCF2         LBSR 0xda9f                       
LAB_ddad:
  ddad  30890030       LEAX 0x30,X                       
  ddb1  5A             DECB                              
  ddb2  26F0           BNE 0xdda4                        
  ddb4  35B6           PULS  A B X Y PC                  

; ---- function FUN_ddb6
FUN_ddb6:
  ddb6  3436           PSHS  Y X B A                     
  ddb8  F66024         LDB 0x6024                        
  ddbb  171C62         LBSR 0xfa20                       
  ddbe  864C           LDA #0x4c                         
  ddc0  20DD           BRA 0xdd9f                        
  ddc2  .db 39                                               ; 9

; ---- function FUN_ddc3
FUN_ddc3:
  ddc3  3436           PSHS  Y X B A                     
  ddc5  8EDE1F         LDX #0xde1f                       
  ddc8  108E0006       LDY #0x6                          
  ddcc  CC0000         LDD #0x0                          
LAB_ddcf:
  ddcf  ED990001       STD [0x1,X]                       
  ddd3  30890007       LEAX 0x7,X                        
  ddd7  313F           LEAY -0x1,Y                       
  ddd9  26F4           BNE 0xddcf                        
  dddb  8EDE1F         LDX #0xde1f                       
  ddde  108E0008       LDY #0x8                          
LAB_dde2:
  dde2  C6FF           LDB #0xff                         
  dde4  E7990003       STB [0x3,X]                       
  dde8  30890007       LEAX 0x7,X                        
  ddec  313F           LEAY -0x1,Y                       
  ddee  26F2           BNE 0xdde2                        
  ddf0  35B6           PULS  A B X Y PC                  

; ---- function FUN_ddf2
FUN_ddf2:
  ddf2  3436           PSHS  Y X B A                     
  ddf4  E627           LDB 0x7,Y                         
  ddf6  8EDE1F         LDX #0xde1f                       
  ddf9  3085           LEAX B,X                          
  ddfb  6D990003       TST [0x3,X]                       
  ddff  35B6           PULS  A B X Y PC                  

; ---- function FUN_de01
FUN_de01:
  de01  3436           PSHS  Y X B A                     
  de03  F66102         LDB 0x6102                        
  de06  171C17         LBSR 0xfa20                       
  de09  E627           LDB 0x7,Y                         
  de0b  8EDE1F         LDX #0xde1f                       
  de0e  3085           LEAX B,X                          
  de10  AE990005       LDX [0x5,X]                       
  de14  CC001C         LDD #0x1c                         
  de17  17BA39         LBSR 0x9853                       
  de1a  171C1D         LBSR 0xfa3a                       
  de1d  35B6           PULS  A B X Y PC                  
DAT_de1f:
  de1f  31             undefined1 31h                    
DAT_de20:
  de20  6108           undefined2 6108h                  
DAT_de22:
  de22  611D           undefined2 611Dh                  
DAT_de24:
  de24  61             ?? 61h    a                       
  de25  .db 26                                               ; &
DAT_de26:
  de26  32             undefined1 32h                    
DAT_de27:
  de27  610A           undefined2 610Ah                  
DAT_de29:
  de29  611E           undefined2 611Eh                  
  de2b  .db 61 28 33 61 0C 61 1F 61 2A 34 61 0E 61 20 61 2C  ; a(3a.a.a*4a.a a,
  de3b  .db 35 61 10 61 21 61 2E 36 61 12 61 22 61 30 4B 00  ; 5a.a!a.6a.a"a0K.
  de4b  .db 00 61 23 61 32 4C 00 00 61 24 61 34              ; .a#a2L..a$a4

; ---- function API_FD86
API_FD86:
  de57  3406           PSHS  B A                         
  de59  3410           PSHS  X                           
  de5b  17BE5E         LBSR 0x9cbc                        ; inline[API_FDD6]: $6024
  de5e  6024           addr 6024                         
LAB_de60:
  de60  E6890013       LDB 0x13,X                        
  de64  4F             CLRA                              
  de65  1F01           TFR D,X                           
  de67  17C89B         LBSR 0xa705                       
  de6a  AEE4           LDX ,S                            
  de6c  CCCAE5         LDD #0xcae5                       
  de6f  ED890001       STD 0x1,X                         
  de73  ED890003       STD 0x3,X                         
  de77  17F62D         LBSR 0xd4a7                       
  de7a  3510           PULS  X                           
  de7c  3586           PULS  A B PC                      

; ---- function FUN_de7e
FUN_de7e:
  de7e  3416           PSHS  X B A                       
  de80  17CD95         LBSR 0xac18                       
  de83  CC9C42         LDD #0x9c42                       
  de86  FD6030         STD 0x6030                        
  de89  CC0000         LDD #0x0                          
  de8c  F761F3         STB 0x61f3                        
  de8f  FD61F4         STD 0x61f4                        
  de92  FD6074         STD 0x6074                        
  de95  170002         LBSR 0xde9a                       
  de98  3596           PULS  A B X PC                    

; ---- function FUN_de9a
FUN_de9a:
  de9a  3416           PSHS  X B A                       
  de9c  17CD79         LBSR 0xac18                       
  de9f  F661F3         LDB 0x61f3                        
  dea2  4F             CLRA                              
  dea3  FD6074         STD 0x6074                        
  dea6  17AFBE         LBSR 0x8e67                        ; inline[API_FC16]: 01 20 02 96 01 00 03 00 $0012 $0000 $0000 ->$0000 ->$0020 $0001 $0001 $0000
  dea9  01             db 1h                             
  deaa  20             db 20h                            
  deab  02             db 2h                             
  deac  96             db 96h                            
  dead  01             db 1h                             
  deae  00             db 0h                             
  deaf  03             db 3h                             
  deb0  00             db 0h                             
  deb1  0012           dw 12h                            
  deb3  0000           dw 0h                             
  deb5  0000           dw 0h                             
  deb7  0000           addr 0000                         
  deb9  0020           addr 0020                         
  debb  0001           dw 1h                             
  debd  0001           dw 1h                             
  debf  0000           dw 0h                             
LAB_dec1:
  dec1  17009A         LBSR 0xdf5e                       
  dec4  C600           LDB #0x0                          
  dec6  17CDA9         LBSR 0xac72                        ; inline[API_FC8A]: ->$DE9A(rel) "( Parmtr )"
  dec9  FFD1           dw FFD1h                          
  decb  28205061726D.. ds "( Parmtr )"                   
LAB_ded5:
  ded5  8D02           BSR 0xded9                        
  ded7  3596           PULS  A B X PC                    

; ---- function FUN_ded9
FUN_ded9:
  ded9  3436           PSHS  Y X B A                     
  dedb  FC6074         LDD 0x6074                        
  dede  8D4D           BSR 0xdf2d                        
  dee0  FD6074         STD 0x6074                        
  dee3  17AE6B         LBSR 0x8d51                       
  dee6  170087         LBSR 0xdf70                       
  dee9  17002C         LBSR 0xdf18                       
  deec  F761F3         STB 0x61f3                        
  deef  BF61F4         STX 0x61f4                        
  def2  3404           PSHS  B                           
  def4  5F             CLRB                              
  def5  17B8DB         LBSR 0x97d3                       
  def8  170052         LBSR 0xdf4d                       
  defb  3504           PULS  B                           
  defd  F66102         LDB 0x6102                        
  df00  171B1D         LBSR 0xfa20                       
  df03  AD990005       JSR [0x5,X]                       
  df07  AD990007       JSR [0x7,X]                       
  df0b  171B2C         LBSR 0xfa3a                       
  df0e  170E21         LBSR 0xed32                       
  df11  C600           LDB #0x0                          
  df13  170DD9         LBSR 0xecef                       
  df16  35B6           PULS  A B X Y PC                  

; ---- function FUN_df18
FUN_df18:
  df18  3436           PSHS  Y X B A                     
  df1a  CCCAE5         LDD #0xcae5                       
  df1d  FD6040         STD 0x6040                        
  df20  FD6042         STD 0x6042                        
  df23  17B8BE         LBSR 0x97e4                        ; inline[API_FC38]: "{2:3C}{5:14}"
  df26  023C051400     char[5] 02h,"<",05h,14h           
LAB_df2b:
  df2b  35B6           PULS  A B X Y PC                  

; ---- function FUN_df2d
FUN_df2d:
  df2d  3412           PSHS  X A                         
  df2f  4F             CLRA                              
  df30  17BDD6         LBSR 0x9d09                        ; inline[API_FE5C]: $0012 $0004
  df33  0012           dw 12h                            
  df35  0004           dw 4h                             
LAB_df37:
  df37  3592           PULS  A X PC                      

; ---- function FUN_df39
FUN_df39:
  df39  3436           PSHS  Y X B A                     
  df3b  8D33           BSR 0xdf70                        
  df3d  86FF           LDA #0xff                         
  df3f  A1890000       CMPA 0x0,X                        
  df43  2704           BEQ 0xdf49                        
  df45  1A04           ORCC #0x4                         
  df47  2002           BRA 0xdf4b                        
LAB_df49:
  df49  1CFB           ANDCC #0xfb                       
LAB_df4b:
  df4b  35B6           PULS  A B X Y PC                  

; ---- function FUN_df4d
FUN_df4d:
  df4d  3416           PSHS  X B A                       
  df4f  BE61F4         LDX 0x61f4                        
  df52  30890009       LEAX 0x9,X                        
  df56  CC0008         LDD #0x8                          
  df59  17B8F7         LBSR 0x9853                       
  df5c  3596           PULS  A B X PC                    

; ---- function FUN_df5e
FUN_df5e:
  df5e  17B883         LBSR 0x97e4                        ; inline[API_FC38]: "{1}         -> "
  df61  012020202020.. char[14] 01h,"         -> "       
LAB_df6f:
  df6f  39             RTS                               

; ---- function FUN_df70
FUN_df70:
  df70  3407           PSHS  B A CC                      
  df72  8630           LDA #0x30                         
  df74  3D             MUL                               
  df75  8E6B00         LDX #0x6b00                       
  df78  308B           LEAX D,X                          
  df7a  3587           PULS CC A B PC                    

; ---- function API_FE0A
API_FE0A:
  df7c  3436           PSHS  Y X B A                     
  df7e  108E60A4       LDY #0x60a4                       
  df82  17E24D         LBSR 0xc1d2                        ; inline[API_FD0C]: $0009 20
  df85  0009           dw 9h                             
  df87  20             db 20h                            
LAB_df88:
  df88  8EDFD3         LDX #0xdfd3                       
LAB_df8b:
  df8b  E184           CMPB ,X                           
  df8d  2612           BNE 0xdfa1                        
  df8f  3406           PSHS  B A                         
  df91  3001           LEAX 0x1,X                        
  df93  108E60A6       LDY #0x60a6                       
  df97  CC0005         LDD #0x5                          
  df9a  17E1EB         LBSR 0xc188                       
  df9d  3506           PULS  A B                         
  df9f  2009           BRA 0xdfaa                        
LAB_dfa1:
  dfa1  30890006       LEAX 0x6,X                        
  dfa5  8CE039         CMPX #0xe039                      
  dfa8  26E1           BNE 0xdf8b                        
LAB_dfaa:
  dfaa  4F             CLRA                              
  dfab  3606           PSHU  B A                         
  dfad  CC000C         LDD #0xc                          
  dfb0  3606           PSHU  B A                         
  dfb2  17DE30         LBSR 0xbde5                       
  dfb5  3706           PULU  A B                         
  dfb7  8EE039         LDX #0xe039                       
  dfba  E68B           LDB D,X                           
  dfbc  F760AD         STB 0x60ad                        
  dfbf  3706           PULU  A B                         
  dfc1  8EE044         LDX #0xe044                       
  dfc4  58             LSLB                              
  dfc5  308B           LEAX D,X                          
  dfc7  E680           LDB ,X+                           
  dfc9  F760AB         STB 0x60ab                        
  dfcc  E684           LDB ,X                            
  dfce  F760AC         STB 0x60ac                        
  dfd1  35B6           PULS  A B X Y PC                  
DAT_dfd3:
  dfd3  3C             undefined1 3Ch                    
  dfd4  .db 4D 69 64 2E 20                                   ; Mid. 
DAT_dfd9:
  dfd9  45             undefined1 45h                    
  dfda  .db 41 34 34 30 20 51 41 38 38 30 20 5D 41 31 37 36  ; A440 QA880 ]A176
  dfea  .db 30 69 41 33 35 32 30 75 41 37 30 34 30 39 41 32  ; 0iA3520uA70409A2
  dffa  .db 32 30 20 2D 41 31 31 30 20 21 41 35 35 20 20 15  ; 20 -A110 !A55  .
  e00a  4132372E3509.. ds "A27.5\tA13.70TenorHTreb.7Fidl.0Gamt."
  e02e  .db 42 6F 74 2E 20 7F 54 6F 70 20 20                 ; Bot. .Top  
DAT_e039:
  e039  78             ?? 78h    x                       
  e03a  .db 30 31 32 33 34 35 36 37 38 39                    ; 0123456789
DAT_e044:
  e044  20             ?? 20h                            
DAT_e045:
  e045  43             ?? 43h    C                       
  e046  .db 43 23 20 44 44 23 20 45 20 46 46 23 20 47 47 23  ; C# DD# E FF# GG#
  e056  .db 20 41 41 23 20 42 17 AA 1D 00 0C 61 51 39        ;  AA# B.....aQ9

; ---- function FUN_e064
FUN_e064:
  e064  3436           PSHS  Y X B A                     
  e066  F6600B         LDB 0x600b                        
  e069  F761A6         STB 0x61a6                        
  e06c  17AA0D         LBSR 0x8a7c                        ; inline[API_FD26]: $000E $6151
  e06f  000E           dw Eh                             
  e071  6151           dw 6151h                          
LAB_e073:
  e073  35B6           PULS  A B X Y PC                  

; ---- function FUN_e075
FUN_e075:
  e075  3436           PSHS  Y X B A                     
  e077  8D05           BSR 0xe07e                        
  e079  7F6105         CLR 0x6105                        
  e07c  35B6           PULS  A B X Y PC                  

; ---- function FUN_e07e
FUN_e07e:
  e07e  3436           PSHS  Y X B A                     
  e080  CC0000         LDD #0x0                          
  e083  7F611C         CLR 0x611c                        
  e086  35B6           PULS  A B X Y PC                  

; ---- function FUN_e088
FUN_e088:
  e088  3436           PSHS  Y X B A                     
  e08a  7D6105         TST 0x6105                        
  e08d  270E           BEQ 0xe09d                        
  e08f  E6A90007       LDB 0x7,Y                         
  e093  F7611C         STB 0x611c                        
  e096  17A9E3         LBSR 0x8a7c                        ; inline[API_FD26]: $0010 $6151
  e099  0010           dw 10h                            
  e09b  6151           dw 6151h                          
LAB_e09d:
  e09d  35B6           PULS  A B X Y PC                  

; ---- function FUN_e09f
FUN_e09f:
  e09f  3436           PSHS  Y X B A                     
  e0a1  7D6105         TST 0x6105                        
  e0a4  2707           BEQ 0xe0ad                        
  e0a6  17A9D3         LBSR 0x8a7c                        ; inline[API_FD26]: $0012 $6151
  e0a9  0012           dw 12h                            
  e0ab  6151           dw 6151h                          
LAB_e0ad:
  e0ad  35B6           PULS  A B X Y PC                  
  e0af  B001B102B203.. addr[4]                           
  e0b7  .db 34 36 C6 00 20 12 34 36 C6 01 20 0C 34 36 C6 02  ; 46.. .46.. .46..
  e0c7  .db 20 06 34 36 C6 03 20 00 F7 61 1C 8D 60 8D 4F 27  ;  .46.. ..a..`.O'
  e0d7  .db 08 17 CA F4 C6 06 17 AF 04 F6 60 FB E1 84 27 05  ; ..........`...'.
  e0e7  .db E6 01 17 AE F8 EC E4 58 49 17 AC C2 35 B6 34 36  ; .......XI...5.46
  e0f7  .db C6 00 20 12 34 36 C6 01 20 0C 34 36 C6 02 20 06  ; .. .46.. .46.. .
  e107  .db 34 36 C6 03 20 00 F7 61 1C 8D 22 8D 11 27 08 17  ; 46.. ..a.."..'..
  e117  .db CA B6 C6 06 17 AE C6 E6 01 17 AE C1 35 36 34 06  ; ............564.
  e127  .db F6 60 FB C1 90 27 04 C4 FC C1 B0 35 86 34 06 86  ; .`...'.....5.4..
  e137  .db 02 F6 61 1C 3D 8E E0 AF 30 8B 35 86              ; ..a.=...0.5.

; ---- function FUN_e143
FUN_e143:
  e143  7D6105         TST 0x6105                        
  e146  2714           BEQ 0xe15c                        
  e148  7DFFE2         TST 0xffe2                        
  e14b  260F           BNE 0xe15c                        
  e14d  17CB22         LBSR 0xac72                        ; inline[API_FC8A]: ->$E15D(rel) "(FuncGen )"
  e150  000D           dw Dh                             
  e152  2846756E6347.. ds "(FuncGen )"                   
LAB_e15c:
  e15c  39             RTS                               

; ---- function FUN_e15d
FUN_e15d:
  e15d  3436           PSHS  Y X B A                     
  e15f  C698           LDB #0x98                         
  e161  F760FB         STB 0x60fb                        
  e164  17B67D         LBSR 0x97e4                        ; inline[API_FC38]: "{1}Function Generator Parameters"
  e167  0146756E6374.. char[31] 01h,"Function Generator Parameters"
LAB_e186:
  e186  CCE19A         LDD #0xe19a                       
  e189  17BA81         LBSR 0x9c0d                       
  e18c  CC9C2E         LDD #0x9c2e                       
  e18f  FD6030         STD 0x6030                        
  e192  CC9C2E         LDD #0x9c2e                       
  e195  FD6036         STD 0x6036                        
  e198  35B6           PULS  A B X Y PC                  
  e19a  .db 00 00 00 0A 02 B9 04 39 06 1B FF FF 17 CA C9 00  ; .......9........
  e1aa  .db 0D 28 46 75 6E 63 74 69 6F 6E 29 39 34 36 C6 99  ; .(Function)946..
  e1ba  .db F7 60 FB 17 0B 72 F6 60 B9 17 0B 29 17 B6 1B 02  ; .`...r.`...)....
  e1ca  .db 00 05                                            ; ..
  e1cc  285479706520.. ds "(Type of Function is"         
  e1e1  .db BE 61                                            ; .a
DAT_e1e3:
  e1e3  06C6           undefined2 06C6h                  
  e1e5  .db 04 30 85 17 C5 1A 4F FD 60 74 17 AC 75 01 28 01  ; .0....O.`t..u.(.
  e1f5  .db 64 00 00 01 00 00 13 00 00 00 00 00 00 00 0D 00  ; d...............
  e205  .db 01 00 01 00 00 17 00 02 35 B6 34 36 10 BE 61 06  ; ........5.46..a.
  e215  .db C6 04 31 A5 FC 60 74 17 C5 1D 10 8E 20 18 17 13  ; ..1..`t..... ...
  e225  .db 83 17 02 01 8E E2 5E 86 17 3D C3 00 00 30 8B 36  ; ......^..=...0.6
  e235  .db 10 17 B5 AB 02 14 06 00 35 B6 34 36 F6 60 FB C1  ; ........5.46.`..
  e245  .db 99 27 09 17 C9 84 8E E2 58 17 AE B0 EC E4 17 AB  ; .'......X.......
  e255  .db 5F 35 B6 06 06 01 03 01 00                       ; _5.......
  e25e  5475726E6564.. ds "Turned Off          "         
DAT_e274:
  e274  00             ?? 00h                            
  e275  436F6E742E20.. ds "Cont. Ramp Wave     "         
  e28a  .db 01 01                                            ; ..
  e28c  436F6E742E20.. ds "Cont. Sine Wave     "         
  e2a1  .db 02 01                                            ; ..
  e2a3  436F6E742E20.. ds "Cont. Triangle Wave "         
  e2b8  .db 03 01                                            ; ..
  e2ba  436F6E742E20.. ds "Cont. Peak Wave     "         
  e2cf  .db 13 01                                            ; ..
  e2d1  436F6E742E20.. ds "Cont. Square Wave   "         
  e2e6  .db 04 01                                            ; ..
  e2e8  53616D706C65.. ds "Sample & Hold       "         
  e2fd  .db 05 01                                            ; ..
  e2ff  52616E646F6D.. ds "Random Waves        "         
  e314  .db 03 03                                            ; ..
  e316  4C696E656172.. ds "Linear Ramp         "         
  e32b  .db 01 02                                            ; ..
  e32d  446563617969.. ds "Decaying Ramp       "         
  e342  .db 11 02                                            ; ..
  e344  57686F6C6520.. ds "Whole Sine Wave     "         
  e359  .db 02 12                                            ; ..
  e35b  57686F6C6520.. ds "Whole Triangle Wave "         
  e370  .db 03 12                                            ; ..
  e372  57686F6C6520.. ds "Whole Peak Wave     "         
  e387  .db 13 12                                            ; ..
  e389  46756C6C2053.. ds "Full Square Wave    "         
  e39e  .db 04 12                                            ; ..
  e3a0  48616C662053.. ds "Half Sine Wave      "         
  e3b5  .db 02 02                                            ; ..
  e3b7  48616C662054.. ds "Half Triangle Wave  "         
  e3cc  .db 03 02                                            ; ..
  e3ce  48616C662050.. ds "Half Peak Wave      "         
  e3e3  .db 13 02                                            ; ..
  e3e5  50756C736520.. ds "Pulse Wave          "         
  e3fa  .db 04 02                                            ; ..
  e3fc  547269676765.. ds "Triggered S & H     "         
  e411  .db 05 02                                            ; ..
  e413  546F67676C65.. ds "Toggle Ramp         "         
  e428  .db 01 04                                            ; ..

; ---- function FUN_e42a
FUN_e42a:
  e42a  3436           PSHS  Y X B A                     
  e42c  8EE25E         LDX #0xe25e                       
  e42f  8617           LDA #0x17                         
  e431  3D             MUL                               
  e432  308B           LEAX D,X                          
  e434  E68815         LDB 0x15,X                        
  e437  F761F8         STB 0x61f8                        
  e43a  E68816         LDB 0x16,X                        
  e43d  C407           ANDB #0x7                         
  e43f  F761F9         STB 0x61f9                        
  e442  E68816         LDB 0x16,X                        
  e445  C410           ANDB #0x10                        
  e447  F76203         STB 0x6203                        
  e44a  CC0000         LDD #0x0                          
  e44d  FD6200         STD 0x6200                        
  e450  C6FF           LDB #0xff                         
  e452  F76204         STB 0x6204                        
  e455  35B6           PULS  A B X Y PC                  

; ---- function FUN_e457
FUN_e457:
  e457  17C818         LBSR 0xac72                        ; inline[API_FC8A]: ->$E467(rel) "( Amount )"
  e45a  000D           dw Dh                             
  e45c  2820416D6F75.. ds "( Amount )"                   
LAB_e466:
  e466  39             RTS                               

; ---- function FUN_e467
FUN_e467:
  e467  3436           PSHS  Y X B A                     
  e469  C69A           LDB #0x9a                         
  e46b  F760FB         STB 0x60fb                        
  e46e  1708C1         LBSR 0xed32                       
  e471  F660B9         LDB 0x60b9                        
  e474  170878         LBSR 0xecef                       
  e477  17B36A         LBSR 0x97e4                        ; inline[API_FC38]: "{2:00}{5:28}Amount of Modulation ="
  e47a  02000528416D.. char[27] 02h                      
LAB_e495:
  e495  BE6106         LDX 0x6106                        
  e498  C605           LDB #0x5                          
  e49a  3085           LEAX B,X                          
  e49c  17C266         LBSR 0xa705                       
  e49f  1D             SEX                               
  e4a0  3406           PSHS  B A                         
  e4a2  170088         LBSR 0xe52d                       
  e4a5  E3E1           ADDD ,S++                         
  e4a7  17B649         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $0064
  e4aa  0000           dw 0h                             
  e4ac  0064           dw 64h                            
LAB_e4ae:
  e4ae  FD6074         STD 0x6074                        
  e4b1  17A9B3         LBSR 0x8e67                        ; inline[API_FC16]: 01 28 02 64 01 00 03 00 $0064 $0000 $0000 ->$000F ->$001A $0001 $0001 $0000
  e4b4  01             db 1h                             
  e4b5  28             db 28h                            
  e4b6  02             db 2h                             
  e4b7  64             db 64h                            
  e4b8  01             db 1h                             
  e4b9  00             db 0h                             
  e4ba  03             db 3h                             
  e4bb  00             db 0h                             
  e4bc  0064           dw 64h                            
  e4be  0000           dw 0h                             
  e4c0  0000           dw 0h                             
  e4c2  000F           addr 000f                         
  e4c4  001A           addr 001a                         
  e4c6  0001           dw 1h                             
  e4c8  0001           dw 1h                             
  e4ca  0000           dw 0h                             
LAB_e4cc:
  e4cc  170002         LBSR 0xe4d1                       
  e4cf  35B6           PULS  A B X Y PC                  

; ---- function FUN_e4d1
FUN_e4d1:
  e4d1  3436           PSHS  Y X B A                     
  e4d3  17B30E         LBSR 0x97e4                        ; inline[API_FC38]: "{2:16}{3:609F}"
  e4d6  021603609F00   char[6] 02h,16h,03h,"`",9Fh       
LAB_e4dc:
  e4dc  35B6           PULS  A B X Y PC                  

; ---- function FUN_e4de
FUN_e4de:
  e4de  3436           PSHS  Y X B A                     
  e4e0  108E201A       LDY #0x201a                       
  e4e4  FC6074         LDD 0x6074                        
  e4e7  1710BF         LBSR 0xf5a9                       
  e4ea  10BE6106       LDY 0x6106                        
  e4ee  C605           LDB #0x5                          
  e4f0  31A5           LEAY B,Y                          
  e4f2  170038         LBSR 0xe52d                       
  e4f5  3406           PSHS  B A                         
  e4f7  FC6074         LDD 0x6074                        
  e4fa  A3E1           SUBD ,S++                         
  e4fc  17B5F4         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $0064
  e4ff  0000           dw 0h                             
  e501  0064           dw 64h                            
LAB_e503:
  e503  17C236         LBSR 0xa73c                       
  e506  FC6074         LDD 0x6074                        
  e509  1700B7         LBSR 0xe5c3                       
  e50c  35B6           PULS  A B X Y PC                  

; ---- function FUN_e50e
FUN_e50e:
  e50e  3436           PSHS  Y X B A                     
  e510  F660FB         LDB 0x60fb                        
  e513  C19A           CMPB #0x9a                        
  e515  2709           BEQ 0xe520                        
  e517  17C6B5         LBSR 0xabcf                       
  e51a  8EE527         LDX #0xe527                       
  e51d  17ABE1         LBSR 0x9101                       
LAB_e520:
  e520  ECE4           LDD ,S                            
  e522  17A890         LBSR 0x8db5                       
  e525  35B6           PULS  A B X Y PC                  
  e527  .db 06 06 01 03 02 00                                ; ......

; ---- function FUN_e52d
FUN_e52d:
  e52d  3430           PSHS  Y X                         
  e52f  BE6106         LDX 0x6106                        
  e532  C628           LDB #0x28                         
  e534  3085           LEAX B,X                          
  e536  17C1CC         LBSR 0xa705                       
  e539  1D             SEX                               
  e53a  3606           PSHU  B A                         
  e53c  FC6E14         LDD 0x6e14                        
  e53f  58             LSLB                              
  e540  49             ROLA                              
  e541  3606           PSHU  B A                         
  e543  17D925         LBSR 0xbe6b                       
  e546  3706           PULU  A B                         
  e548  35B0           PULS  X Y PC                      

; ---- function FUN_e54a
FUN_e54a:
  e54a  3436           PSHS  Y X B A                     
  e54c  8DDF           BSR 0xe52d                        
  e54e  3406           PSHS  B A                         
  e550  BE6106         LDX 0x6106                        
  e553  C605           LDB #0x5                          
  e555  3085           LEAX B,X                          
  e557  17C1AB         LBSR 0xa705                       
  e55a  1D             SEX                               
  e55b  E3E1           ADDD ,S++                         
  e55d  17B593         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $0064
  e560  0000           dw 0h                             
  e562  0064           dw 64h                            
LAB_e564:
  e564  17005C         LBSR 0xe5c3                       
  e567  869A           LDA #0x9a                         
  e569  B160FB         CMPA 0x60fb                       
  e56c  260A           BNE 0xe578                        
  e56e  1D             SEX                               
  e56f  FD6074         STD 0x6074                        
  e572  17A7DC         LBSR 0x8d51                       
  e575  17FF59         LBSR 0xe4d1                       
LAB_e578:
  e578  35B6           PULS  A B X Y PC                  

; ---- function FUN_e57a
FUN_e57a:
  e57a  3406           PSHS  B A                         
  e57c  C602           LDB #0x2                          
  e57e  17C6F1         LBSR 0xac72                        ; inline[API_FC8A]: ->$E58F(rel) "( Amount )"
  e581  000E           dw Eh                             
  e583  2820416D6F75.. ds "( Amount )"                   
LAB_e58d:
  e58d  3586           PULS  A B PC                      

; ---- function FUN_e58f
FUN_e58f:
  e58f  3436           PSHS  Y X B A                     
  e591  BE6106         LDX 0x6106                        
  e594  C628           LDB #0x28                         
  e596  3085           LEAX B,X                          
  e598  17C16A         LBSR 0xa705                       
  e59b  1D             SEX                               
  e59c  FD6074         STD 0x6074                        
  e59f  1701CA         LBSR 0xe76c                       
  e5a2  CCE5B1         LDD #0xe5b1                       
  e5a5  FD6072         STD 0x6072                        
  e5a8  17B721         LBSR 0x9ccc                        ; inline[addr:9CCC]: ->$E5B1(rel) $6072
  e5ab  0006           dw 6h                             
  e5ad  6072           addr 6072                         
LAB_e5af:
  e5af  35B6           PULS  A B X Y PC                  

; ---- function FUN_e5b1
FUN_e5b1:
  e5b1  3436           PSHS  Y X B A                     
  e5b3  10BE6106       LDY 0x6106                        
  e5b7  C628           LDB #0x28                         
  e5b9  31A5           LEAY B,Y                          
  e5bb  FC6074         LDD 0x6074                        
  e5be  17C17B         LBSR 0xa73c                       
  e5c1  35B6           PULS  A B X Y PC                  

; ---- function FUN_e5c3
FUN_e5c3:
  e5c3  3406           PSHS  B A                         
  e5c5  86C8           LDA #0xc8                         
  e5c7  3D             MUL                               
  e5c8  3606           PSHU  B A                         
  e5ca  CC68DA         LDD #0x68da                       
  e5cd  3606           PSHU  B A                         
  e5cf  17D899         LBSR 0xbe6b                       
  e5d2  3706           PULU  A B                         
  e5d4  FD61FA         STD 0x61fa                        
  e5d7  3586           PULS  A B PC                      

; ---- function FUN_e5d9
FUN_e5d9:
  e5d9  17C696         LBSR 0xac72                        ; inline[API_FC8A]: ->$E5E9(rel) "(  Rate  )"
  e5dc  000D           dw Dh                             
  e5de  282020526174.. ds "(  Rate  )"                   
LAB_e5e8:
  e5e8  39             RTS                               

; ---- function FUN_e5e9
FUN_e5e9:
  e5e9  3436           PSHS  Y X B A                     
  e5eb  170744         LBSR 0xed32                       
  e5ee  F660B9         LDB 0x60b9                        
  e5f1  1706FB         LBSR 0xecef                       
  e5f4  C69B           LDB #0x9b                         
  e5f6  F760FB         STB 0x60fb                        
  e5f9  17B1E8         LBSR 0x97e4                        ; inline[API_FC38]: "{2:00}{5:28}Rate of Modulation ={2:1A} Hz"
  e5fc  020005285261.. char[30] 02h                      
LAB_e61a:
  e61a  170094         LBSR 0xe6b1                       
  e61d  3406           PSHS  B A                         
  e61f  BE6106         LDX 0x6106                        
  e622  C606           LDB #0x6                          
  e624  3085           LEAX B,X                          
  e626  17C0F2         LBSR 0xa71b                       
  e629  E3E1           ADDD ,S++                         
  e62b  17B4C5         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $07D0
  e62e  0000           dw 0h                             
  e630  07D0           dw 7D0h                           
LAB_e632:
  e632  FD6074         STD 0x6074                        
  e635  17A82F         LBSR 0x8e67                        ; inline[API_FC16]: 05 01 02 0A 01 02 04 00 $07D0 $0000 $0000 ->$000F ->$001A $000A $0001 $0000
  e638  05             db 5h                             
  e639  01             db 1h                             
  e63a  02             db 2h                             
  e63b  0A             db Ah                             
  e63c  01             db 1h                             
  e63d  02             db 2h                             
  e63e  04             db 4h                             
  e63f  00             db 0h                             
  e640  07D0           dw 7D0h                           
  e642  0000           dw 0h                             
  e644  0000           dw 0h                             
  e646  000F           addr 000f                         
  e648  001A           addr 001a                         
  e64a  000A           dw Ah                             
  e64c  0001           dw 1h                             
  e64e  0000           dw 0h                             
LAB_e650:
  e650  170002         LBSR 0xe655                       
  e653  35B6           PULS  A B X Y PC                  

; ---- function FUN_e655
FUN_e655:
  e655  3436           PSHS  Y X B A                     
  e657  17B18A         LBSR 0x97e4                        ; inline[API_FC38]: "{2:15}{3:609E}"
  e65a  021503609E00   char[6] 02h,15h,03h,"`",9Eh       
LAB_e660:
  e660  35B6           PULS  A B X Y PC                  

; ---- function FUN_e662
FUN_e662:
  e662  3436           PSHS  Y X B A                     
  e664  FC6074         LDD 0x6074                        
  e667  108E2019       LDY #0x2019                       
  e66b  170F3B         LBSR 0xf5a9                       
  e66e  170040         LBSR 0xe6b1                       
  e671  3406           PSHS  B A                         
  e673  10BE6106       LDY 0x6106                        
  e677  C606           LDB #0x6                          
  e679  31A5           LEAY B,Y                          
  e67b  FC6074         LDD 0x6074                        
  e67e  A3E1           SUBD ,S++                         
  e680  17B470         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $07D0
  e683  0000           dw 0h                             
  e685  07D0           dw 7D0h                           
LAB_e687:
  e687  17C0C8         LBSR 0xa752                       
  e68a  FC6074         LDD 0x6074                        
  e68d  1700C9         LBSR 0xe759                       
  e690  35B6           PULS  A B X Y PC                  

; ---- function FUN_e692
FUN_e692:
  e692  3436           PSHS  Y X B A                     
  e694  F660FB         LDB 0x60fb                        
  e697  C19B           CMPB #0x9b                        
  e699  2709           BEQ 0xe6a4                        
  e69b  17C531         LBSR 0xabcf                       
  e69e  8EE6AB         LDX #0xe6ab                       
  e6a1  17AA5D         LBSR 0x9101                       
LAB_e6a4:
  e6a4  ECE4           LDD ,S                            
  e6a6  17A70C         LBSR 0x8db5                       
  e6a9  35B6           PULS  A B X Y PC                  
  e6ab  .db 06 06 01 03 03 00                                ; ......

; ---- function FUN_e6b1
FUN_e6b1:
  e6b1  3430           PSHS  Y X                         
  e6b3  BE6106         LDX 0x6106                        
  e6b6  C629           LDB #0x29                         
  e6b8  3085           LEAX B,X                          
  e6ba  17C048         LBSR 0xa705                       
  e6bd  1D             SEX                               
  e6be  3606           PSHU  B A                         
  e6c0  CC0014         LDD #0x14                         
  e6c3  3606           PSHU  B A                         
  e6c5  17D753         LBSR 0xbe1b                       
  e6c8  FC6E44         LDD 0x6e44                        
  e6cb  58             LSLB                              
  e6cc  49             ROLA                              
  e6cd  3606           PSHU  B A                         
  e6cf  17D799         LBSR 0xbe6b                       
  e6d2  3706           PULU  A B                         
  e6d4  35B0           PULS  X Y PC                      

; ---- function FUN_e6d6
FUN_e6d6:
  e6d6  3436           PSHS  Y X B A                     
  e6d8  8DD7           BSR 0xe6b1                        
  e6da  3406           PSHS  B A                         
  e6dc  BE6106         LDX 0x6106                        
  e6df  C606           LDB #0x6                          
  e6e1  3085           LEAX B,X                          
  e6e3  17C035         LBSR 0xa71b                       
  e6e6  E3E1           ADDD ,S++                         
  e6e8  17B408         LBSR 0x9af3                        ; inline[addr:9AF3]: $0000 $07D0
  e6eb  0000           dw 0h                             
  e6ed  07D0           dw 7D0h                           
LAB_e6ef:
  e6ef  170067         LBSR 0xe759                       
  e6f2  3406           PSHS  B A                         
  e6f4  869B           LDA #0x9b                         
  e6f6  B160FB         CMPA 0x60fb                       
  e6f9  3506           PULS  A B                         
  e6fb  2609           BNE 0xe706                        
  e6fd  FD6074         STD 0x6074                        
  e700  17A64E         LBSR 0x8d51                       
  e703  17FF4F         LBSR 0xe655                       
LAB_e706:
  e706  35B6           PULS  A B X Y PC                  

; ---- function FUN_e708
FUN_e708:
  e708  3406           PSHS  B A                         
  e70a  C602           LDB #0x2                          
  e70c  17C563         LBSR 0xac72                        ; inline[API_FC8A]: ->$E71D(rel) "( Amount )"
  e70f  000E           dw Eh                             
  e711  2820416D6F75.. ds "( Amount )"                   
LAB_e71b:
  e71b  3586           PULS  A B PC                      

; ---- function FUN_e71d
FUN_e71d:
  e71d  3436           PSHS  Y X B A                     
  e71f  170610         LBSR 0xed32                       
  e722  C602           LDB #0x2                          
  e724  1705C8         LBSR 0xecef                       
  e727  BE6106         LDX 0x6106                        
  e72a  C629           LDB #0x29                         
  e72c  3085           LEAX B,X                          
  e72e  17BFD4         LBSR 0xa705                       
  e731  1D             SEX                               
  e732  FD6074         STD 0x6074                        
  e735  170034         LBSR 0xe76c                       
  e738  CCE747         LDD #0xe747                       
  e73b  FD6072         STD 0x6072                        
  e73e  17B58B         LBSR 0x9ccc                        ; inline[addr:9CCC]: ->$E747(rel) $6072
  e741  0006           dw 6h                             
  e743  6072           addr 6072                         
LAB_e745:
  e745  35B6           PULS  A B X Y PC                  

; ---- function FUN_e747
FUN_e747:
  e747  3436           PSHS  Y X B A                     
  e749  10BE6106       LDY 0x6106                        
  e74d  C629           LDB #0x29                         
  e74f  31A5           LEAY B,Y                          
  e751  FC6074         LDD 0x6074                        
  e754  17BFE5         LBSR 0xa73c                       
  e757  35B6           PULS  A B X Y PC                  

; ---- function FUN_e759
FUN_e759:
  e759  3436           PSHS  Y X B A                     
  e75b  3606           PSHU  B A                         
  e75d  CC79BD         LDD #0x79bd                       
  e760  3606           PSHU  B A                         
  e762  17D706         LBSR 0xbe6b                       
  e765  3706           PULU  A B                         
  e767  FD61FC         STD 0x61fc                        
  e76a  35B6           PULS  A B X Y PC                  

; ---- function FUN_e76c
FUN_e76c:
  e76c  3436           PSHS  Y X B A                     
  e76e  FD6074         STD 0x6074                        
  e771  17B070         LBSR 0x97e4                        ; inline[API_FC38]: "{2:0B}{5:1D}Amount of Modulation = {2:27}%"
  e774  020B051D416D.. char[31] 02h,"\v",05h,1Dh,"Amount of Modulation = ",02h,"'%"
LAB_e793:
  e793  17A6D1         LBSR 0x8e67                        ; inline[API_FC16]: 01 0A 01 32 01 00 04 00 $0064 $FF9C $0000 ->$000F ->$0000 $0001 $0001 $0000
  e796  01             db 1h                             
  e797  0A             db Ah                             
  e798  01             db 1h                             
  e799  32             db 32h                            
  e79a  01             db 1h                             
  e79b  00             db 0h                             
  e79c  04             db 4h                             
  e79d  00             db 0h                             
  e79e  0064           dw 64h                            
  e7a0  FF9C           dw FF9Ch                          
  e7a2  0000           dw 0h                             
  e7a4  000F           addr 000f                         
  e7a6  0000           addr 0000                         
  e7a8  0001           dw 1h                             
  e7aa  0001           dw 1h                             
  e7ac  0000           dw 0h                             
LAB_e7ae:
  e7ae  170002         LBSR 0xe7b3                       
  e7b1  35B6           PULS  A B X Y PC                  

; ---- function FUN_e7b3
FUN_e7b3:
  e7b3  17B02E         LBSR 0x97e4                        ; inline[API_FC38]: "{2:22}{3:609F}"
  e7b6  022203609F00   char[6] 02h,"\"",03h,"`",9Fh      
LAB_e7bc:
  e7bc  39             RTS                               

; ---- function FUN_e7bd
FUN_e7bd:
  e7bd  17C4B2         LBSR 0xac72                        ; inline[API_FC8A]: ->$E7CD(rel) "(Trigger )"
  e7c0  000D           dw Dh                             
  e7c2  285472696767.. ds "(Trigger )"                   
LAB_e7cc:
  e7cc  39             RTS                               

; ---- function FUN_e7cd
FUN_e7cd:
  e7cd  3436           PSHS  Y X B A                     
  e7cf  CC0000         LDD #0x0                          
  e7d2  108E201B       LDY #0x201b                       
  e7d6  170DD0         LBSR 0xf5a9                       
  e7d9  170098         LBSR 0xe874                       
  e7dc  35B6           PULS  A B X Y PC                  

; ---- function FUN_e7de
FUN_e7de:
  e7de  3436           PSHS  Y X B A                     
  e7e0  F660FB         LDB 0x60fb                        
  e7e3  C4FC           ANDB #0xfc                        
  e7e5  C198           CMPB #0x98                        
  e7e7  2709           BEQ 0xe7f2                        
  e7e9  17C3E3         LBSR 0xabcf                       
  e7ec  8EE7F9         LDX #0xe7f9                       
  e7ef  17A90F         LBSR 0x9101                       
LAB_e7f2:
  e7f2  C604           LDB #0x4                          
  e7f4  17A7ED         LBSR 0x8fe4                       
  e7f7  35B6           PULS  A B X Y PC                  
  e7f9  .db 06 06 01 03 00                                   ; .....

; ---- function FUN_e7fe
FUN_e7fe:
  e7fe  C600           LDB #0x0                          
  e800  17FC27         LBSR 0xe42a                       
LAB_e803:
  e803  39             RTS                               

; ---- function FUN_e804
FUN_e804:
  e804  3436           PSHS  Y X B A                     
  e806  7DFFE2         TST 0xffe2                        
  e809  2667           BNE 0xe872                        
  e80b  F66024         LDB 0x6024                        
  e80e  3404           PSHS  B                           
  e810  7D6105         TST 0x6105                        
  e813  2758           BEQ 0xe86d                        
  e815  10BE6106       LDY 0x6106                        
  e819  C604           LDB #0x4                          
  e81b  30A5           LEAX B,Y                          
  e81d  17BEE5         LBSR 0xa705                       
  e820  17FC07         LBSR 0xe42a                       
  e823  C605           LDB #0x5                          
  e825  30A5           LEAX B,Y                          
  e827  17BEDB         LBSR 0xa705                       
  e82a  17FD96         LBSR 0xe5c3                       
  e82d  C606           LDB #0x6                          
  e82f  30A5           LEAX B,Y                          
  e831  17BEE7         LBSR 0xa71b                       
  e834  17FF22         LBSR 0xe759                       
  e837  17E3A9         LBSR 0xcbe3                        ; inline[API_FD84]: 10 01 "Func Amp" 2C $E54A $E57A
  e83a  10             db 10h                            
  e83b  01             db 1h                             
  e83c  46756E632041.. ds "Func Amp"                     
  e844  2C             db 2Ch                            
  e845  E54A           addr e54a                         
  e847  E57A           addr e57a                         
LAB_e849:
  e849  17E397         LBSR 0xcbe3                        ; inline[API_FD84]: 11 01 "FuncFreq" 30 $E6D6 $E708
  e84c  11             db 11h                            
  e84d  01             db 1h                             
  e84e  46756E634672.. ds "FuncFreq"                     
  e856  30             db 30h                            
  e857  E6D6           addr e6d6                         
  e859  E708           addr e708                         
LAB_e85b:
  e85b  17E37B         LBSR 0xcbd9                        ; inline[API_FE78]: 12 01 "FuncTrig" 34 $E874 $FFE8
  e85e  12             db 12h                            
  e85f  01             db 1h                             
  e860  46756E635472.. ds "FuncTrig"                     
  e868  34             db 34h                            
  e869  E874           addr e874                         
  e86b  FFE8           addr ffe8                         
LAB_e86d:
  e86d  3504           PULS  B                           
  e86f  F76024         STB 0x6024                        
LAB_e872:
  e872  35B6           PULS  A B X Y PC                  

; ---- function FUN_e874
FUN_e874:
  e874  3436           PSHS  Y X B A                     
  e876  F661F9         LDB 0x61f9                        
  e879  C407           ANDB #0x7                         
  e87b  C104           CMPB #0x4                         
  e87d  2709           BEQ 0xe888                        
  e87f  CC7FFF         LDD #0x7fff                       
  e882  FD6200         STD 0x6200                        
  e885  F76202         STB 0x6202                        
LAB_e888:
  e888  F66204         LDB 0x6204                        
  e88b  171157         LBSR 0xf9e5                       
  e88e  F76204         STB 0x6204                        
  e891  35B6           PULS  A B X Y PC                  

; ---- function FUN_e893
FUN_e893:
  e893  3436           PSHS  Y X B A                     
  e895  BE61F4         LDX 0x61f4                        
  e898  E6890000       LDB 0x0,X                         
  e89c  C130           CMPB #0x30                        
  e89e  2736           BEQ 0xe8d6                        
  e8a0  C14A           CMPB #0x4a                        
  e8a2  2632           BNE 0xe8d6                        
  e8a4  8602           LDA #0x2                          
  e8a6  17F48C         LBSR 0xdd35                       
  e8a9  1D             SEX                               
  e8aa  17B246         LBSR 0x9af3                        ; inline[addr:9AF3]: $FF9C $0064
  e8ad  FF9C           dw FF9Ch                          
  e8af  0064           dw 64h                            
LAB_e8b1:
  e8b1  3606           PSHU  B A                         
  e8b3  CC00C8         LDD #0xc8                         
  e8b6  3606           PSHU  B A                         
  e8b8  17D560         LBSR 0xbe1b                       
  e8bb  CC68DA         LDD #0x68da                       
  e8be  3606           PSHU  B A                         
  e8c0  17D5A8         LBSR 0xbe6b                       
  e8c3  3706           PULU  A B                         
  e8c5  ED89001B       STD 0x1b,X                        
  e8c9  8601           LDA #0x1                          
  e8cb  17F467         LBSR 0xdd35                       
  e8ce  E7890019       STB 0x19,X                        
  e8d2  6F89001E       CLR 0x1e,X                        
LAB_e8d6:
  e8d6  35B6           PULS  A B X Y PC                  

; ---- function FUN_e8d8
FUN_e8d8:
  e8d8  3436           PSHS  Y X B A                     
  e8da  BE61F4         LDX 0x61f4                        
  e8dd  CCE904         LDD #0xe904                       
  e8e0  6D890019       TST 0x19,X                        
  e8e4  2703           BEQ 0xe8e9                        
  e8e6  CCE909         LDD #0xe909                       
LAB_e8e9:
  e8e9  3606           PSHU  B A                         
  e8eb  8602           LDA #0x2                          
  e8ed  17F445         LBSR 0xdd35                       
  e8f0  1D             SEX                               
  e8f1  3606           PSHU  B A                         
  e8f3  17AEEE         LBSR 0x97e4                        ; inline[API_FC38]: "{2:1E}{4:0000}{3:60A9}{2:24}{6}"
  e8f6  021E04000003.. char[12] 02h,1Eh,04h              
LAB_e902:
  e902  35B6           PULS  A B X Y PC                  
  e904  .db 20 55 70 20 00 44 6F 77 6E 00 34 36 C6 01 17 C3  ;  Up .Down.46....
  e914  .db 5D 00 1F 28 54 68 72 65 73 68 6C 64 29 C6 02 17  ; ]..(Threshld)...
  e924  .db C3 4C 00 5E 28 50 6F 6C 61 72 69 74 79 29 35 B6  ; .L.^(Polarity)5.
  e934  .db 34 16 17 03 F9 F6 60 B9 17 03 B0 BE 61 F4 86 02  ; 4.....`.....a...
  e944  .db 17 F3 EE 1D FD 60 74 17 A5 19 01 01 02 14 01 00  ; .....`t.........
  e954  .db 04 00 00 64 FF 9C 00 00 00 0C 00 14 00 01 00 01  ; ...d............
  e964  .db 00 00 35 96 17 AE 79 02 1E 03 60 9F 00 39 34 16  ; ..5...y...`..94.
  e974  .db FC 60 74 BE 61 F4 86 02 17 F3 C9 17 EB 25 35 96  ; .`t.a........%5.
  e984  .db 34 36 86 01 BE 61 F4 17 F3 A7 17 10 54 17 F3 B4  ; 46...a......T...
  e994  .db 17 EB 10 17 FF 3E 35 B6                          ; .....>5.

; ---- function FUN_e99c
FUN_e99c:
  e99c  3476           PSHS  U Y X B A                   
  e99e  327E           LEAS -0x2,S                       
  e9a0  7DFFE2         TST 0xffe2                        
  e9a3  10260176       LBNE 0xeb1d                       
  e9a7  7D61F8         TST 0x61f8                        
  e9aa  1027016F       LBEQ 0xeb1d                       
  e9ae  FC61FE         LDD 0x61fe                        
  e9b1  7F61FE         CLR 0x61fe                        
  e9b4  7F61FF         CLR 0x61ff                        
  e9b7  3606           PSHU  B A                         
  e9b9  FC61FC         LDD 0x61fc                        
  e9bc  3606           PSHU  B A                         
  e9be  17D45A         LBSR 0xbe1b                       
  e9c1  F661F9         LDB 0x61f9                        
  e9c4  C407           ANDB #0x7                         
  e9c6  4F             CLRA                              
  e9c7  17D88C         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->E9DA 1->EA3C 2->EA04 3->E9EF 4->EA1F 5->E9DA 6->E9DA 7->E9DA
  e9ca  E9DA           addr e9da                         
  e9cc  EA3C           addr ea3c                         
  e9ce  EA04           addr ea04                         
  e9d0  E9EF           addr e9ef                         
  e9d2  EA1F           addr ea1f                         
  e9d4  E9DA           addr e9da                         
  e9d6  E9DA           addr e9da                         
  e9d8  E9DA           addr e9da                         

; ---- function FUN_e9da
FUN_e9da:
  e9da  F661F8         LDB 0x61f8                        
  e9dd  C105           CMPB #0x5                         
  e9df  2708           BEQ 0xe9e9                        
  e9e1  CC0000         LDD #0x0                          
  e9e4  EDC4           STD ,U                            
  e9e6  1600E2         LBRA 0xeacb                       
LAB_e9e9:
  e9e9  CC0000         LDD #0x0                          
  e9ec  160055         LBRA 0xea44                       

; ---- function FUN_e9ef
FUN_e9ef:
  e9ef  CC0000         LDD #0x0                          
  e9f2  3606           PSHU  B A                         
  e9f4  17D57A         LBSR 0xbf71                       
  e9f7  17D471         LBSR 0xbe6b                       
  e9fa  FC6200         LDD 0x6200                        
  e9fd  A3C4           SUBD ,U                           
  e9ff  FD6200         STD 0x6200                        
  ea02  2040           BRA 0xea44                        

; ---- function FUN_ea04
FUN_ea04:
  ea04  7D6202         TST 0x6202                        
  ea07  27D1           BEQ 0xe9da                        
  ea09  FC6200         LDD 0x6200                        
  ea0c  A3C4           SUBD ,U                           
  ea0e  29CA           BVS 0xe9da                        
  ea10  FD6200         STD 0x6200                        
  ea13  2A2F           BPL 0xea44                        
  ea15  7D6203         TST 0x6203                        
  ea18  262A           BNE 0xea44                        
  ea1a  7F6202         CLR 0x6202                        
  ea1d  20BB           BRA 0xe9da                        

; ---- function FUN_ea1f
FUN_ea1f:
  ea1f  FC6200         LDD 0x6200                        
  ea22  7D6204         TST 0x6204                        
  ea25  2709           BEQ 0xea30                        
  ea27  A3C4           SUBD ,U                           
  ea29  2A0C           BPL 0xea37                        
  ea2b  CC0000         LDD #0x0                          
  ea2e  2007           BRA 0xea37                        
LAB_ea30:
  ea30  E3C4           ADDD ,U                           
  ea32  2803           BVC 0xea37                        
  ea34  CC7FFF         LDD #0x7fff                       
LAB_ea37:
  ea37  FD6200         STD 0x6200                        
  ea3a  2008           BRA 0xea44                        

; ---- function FUN_ea3c
FUN_ea3c:
  ea3c  FC6200         LDD 0x6200                        
  ea3f  A3C4           SUBD ,U                           
  ea41  FD6200         STD 0x6200                        
LAB_ea44:
  ea44  EDC4           STD ,U                            
  ea46  F661F8         LDB 0x61f8                        
  ea49  C407           ANDB #0x7                         
  ea4b  4F             CLRA                              
  ea4c  17D807         LBSR 0xc256                        ; inline[API_FD14]: jump table[D]: 0->EA83 1->EAB9 2->EAB6 3->EA9A 4->EA8A 5->EA5F 6->EAB9 7->EAB9
  ea4f  EA83           addr ea83                         
  ea51  EAB9           addr eab9                         
  ea53  EAB6           addr eab6                         
  ea55  EA9A           addr ea9a                         
  ea57  EA8A           addr ea8a                         
  ea59  EA5F           addr ea5f                         
  ea5b  EAB9           addr eab9                         
  ea5d  EAB9           addr eab9                         

; ---- function FUN_ea5f
FUN_ea5f:
  ea5f  6DC4           TST ,U                            
  ea61  2B18           BMI 0xea7b                        
  ea63  7D6202         TST 0x6202                        
  ea66  102700B3       LBEQ 0xeb1d                       
  ea6a  CC0000         LDD #0x0                          
  ea6d  3606           PSHU  B A                         
  ea6f  17D4FF         LBSR 0xbf71                       
  ea72  3706           PULU  A B                         
  ea74  EDC4           STD ,U                            
  ea76  7F6202         CLR 0x6202                        
  ea79  203E           BRA 0xeab9                        
LAB_ea7b:
  ea7b  86FF           LDA #0xff                         
  ea7d  B76202         STA 0x6202                        
  ea80  16009A         LBRA 0xeb1d                       

; ---- function FUN_ea83
FUN_ea83:
  ea83  CC0000         LDD #0x0                          
  ea86  EDC4           STD ,U                            
  ea88  202F           BRA 0xeab9                        

; ---- function FUN_ea8a
FUN_ea8a:
  ea8a  6DC4           TST ,U                            
  ea8c  2A05           BPL 0xea93                        
  ea8e  CC8001         LDD #0x8001                       
  ea91  2003           BRA 0xea96                        
LAB_ea93:
  ea93  CC7FFF         LDD #0x7fff                       
LAB_ea96:
  ea96  EDC4           STD ,U                            
  ea98  201F           BRA 0xeab9                        

; ---- function FUN_ea9a
FUN_ea9a:
  ea9a  ECC4           LDD ,U                            
  ea9c  58             LSLB                              
  ea9d  49             ROLA                              
  ea9e  4D             TSTA                              
  ea9f  2A06           BPL 0xeaa7                        
  eaa1  6DC4           TST ,U                            
  eaa3  2A06           BPL 0xeaab                        
  eaa5  200B           BRA 0xeab2                        
LAB_eaa7:
  eaa7  6DC4           TST ,U                            
  eaa9  2A07           BPL 0xeab2                        
LAB_eaab:
  eaab  3406           PSHS  B A                         
  eaad  CC0000         LDD #0x0                          
  eab0  A3E1           SUBD ,S++                         
LAB_eab2:
  eab2  EDC4           STD ,U                            
  eab4  2003           BRA 0xeab9                        

; ---- function FUN_eab6
FUN_eab6:
  eab6  17D59C         LBSR 0xc055                       

; ---- function FUN_eab9
FUN_eab9:
  eab9  C610           LDB #0x10                         
  eabb  F561F8         BITB 0x61f8                       
  eabe  2703           BEQ 0xeac3                        
  eac0  17D5CD         LBSR 0xc090                       
LAB_eac3:
  eac3  FC61FA         LDD 0x61fa                        
  eac6  3606           PSHU  B A                         
  eac8  17D3A0         LBSR 0xbe6b                       
LAB_eacb:
  eacb  8E6B00         LDX #0x6b00                       
  eace  8613           LDA #0x13                         
  ead0  A7E4           STA ,S                            
LAB_ead2:
  ead2  E6890000       LDB 0x0,X                         
  ead6  C130           CMPB #0x30                        
  ead8  2735           BEQ 0xeb0f                        
  eada  C14A           CMPB #0x4a                        
  eadc  2637           BNE 0xeb15                        
  eade  ECC4           LDD ,U                            
  eae0  6D890019       TST 0x19,X                        
  eae4  2709           BEQ 0xeaef                        
  eae6  10A389001B     CMPD 0x1b,X                       
  eaeb  2E1C           BGT 0xeb09                        
  eaed  2009           BRA 0xeaf8                        
LAB_eaef:
  eaef  10A389001B     CMPD 0x1b,X                       
  eaf4  2D13           BLT 0xeb09                        
  eaf6  2000           BRA 0xeaf8                        
LAB_eaf8:
  eaf8  6D89001E       TST 0x1e,X                        
  eafc  260F           BNE 0xeb0d                        
  eafe  C6FF           LDB #0xff                         
  eb00  E789001E       STB 0x1e,X                        
  eb04  17EF98         LBSR 0xda9f                       
  eb07  2004           BRA 0xeb0d                        
LAB_eb09:
  eb09  6F89001E       CLR 0x1e,X                        
LAB_eb0d:
  eb0d  2006           BRA 0xeb15                        
LAB_eb0f:
  eb0f  ECC4           LDD ,U                            
  eb11  ED890016       STD 0x16,X                        
LAB_eb15:
  eb15  30890030       LEAX 0x30,X                       
  eb19  6AE4           DEC ,S                            
  eb1b  26B5           BNE 0xead2                        
LAB_eb1d:
  eb1d  3262           LEAS 0x2,S                        
  eb1f  35F6           PULS  A B X Y U PC                

; ---- function FUN_eb21
FUN_eb21:
  eb21  3404           PSHS  B                           
  eb23  F660B9         LDB 0x60b9                        
  eb26  17C149         LBSR 0xac72                        ; inline[API_FC8A]: ->$EB38(rel) "(MIDI-Mon)"
  eb29  000F           dw Fh                             
  eb2b  284D4944492D.. ds "(MIDI-Mon)"                   
LAB_eb35:
  eb35  3504           PULS  B                           
  eb37  39             RTS                               

; ---- function FUN_eb38
FUN_eb38:
  eb38  3436           PSHS  Y X B A                     
  eb3a  C600           LDB #0x0                          
  eb3c  17AC94         LBSR 0x97d3                       
  eb3f  17ACA2         LBSR 0x97e4                        ; inline[API_FC38]: "{1}MIDI Input in Hex, Bypass to Esc "
  eb42  014D49444920.. char[35] 01h,"MIDI Input in Hex, Bypass to Esc "
LAB_eb65:
  eb65  17AB0A         LBSR 0x9672                       
  eb68  108E6A80       LDY #0x6a80                       
  eb6c  17D663         LBSR 0xc1d2                        ; inline[API_FD0C]: $0050 20
  eb6f  0050           dw 50h                            
  eb71  20             db 20h                            
LAB_eb72:
  eb72  CCEBD8         LDD #0xebd8                       
  eb75  FD608B         STD 0x608b                        
  eb78  FD60F2         STD 0x60f2                        
  eb7b  17AADF         LBSR 0x965d                       
  eb7e  1CAF           ANDCC #0xaf                       
LAB_eb80:
  eb80  17A5A0         LBSR 0x9123                       
  eb83  2747           BEQ 0xebcc                        
  eb85  17AB42         LBSR 0x96ca                       
  eb88  26F6           BNE 0xeb80                        
  eb8a  3404           PSHS  B                           
  eb8c  8E6A83         LDX #0x6a83                       
  eb8f  108E6A80       LDY #0x6a80                       
  eb93  CC0025         LDD #0x25                         
  eb96  17D5EF         LBSR 0xc188                       
  eb99  3504           PULS  B                           
  eb9b  17AE52         LBSR 0x99f0                       
  eb9e  F76AA7         STB 0x6aa7                        
  eba1  B76AA6         STA 0x6aa6                        
  eba4  8620           LDA #0x20                         
  eba6  B76AA5         STA 0x6aa5                        
  eba9  C628           LDB #0x28                         
  ebab  17AC25         LBSR 0x97d3                       
  ebae  8E6A80         LDX #0x6a80                       
  ebb1  C628           LDB #0x28                         
  ebb3  17AC9D         LBSR 0x9853                       
  ebb6  179B7E         LBSR 0x8737                       
  ebb9  FC60EB         LDD 0x60eb                        
  ebbc  3606           PSHU  B A                         
  ebbe  17AC23         LBSR 0x97e4                        ; inline[API_FC38]: "{2:21}{4:2000}{3:60A7}"
  ebc1  022104200003.. char[9] 02h,"!",04h," "           
LAB_ebca:
  ebca  20B4           BRA 0xeb80                        
LAB_ebcc:
  ebcc  CC85E3         LDD #0x85e3                       
  ebcf  FD60F2         STD 0x60f2                        
  ebd2  3536           PULS  A B X Y                     
  ebd4  17AF89         LBSR 0x9b60                       
  ebd7  39             RTS                               

; ---- function FUN_ebd8
FUN_ebd8:
  ebd8  3404           PSHS  B                           
  ebda  179A17         LBSR 0x85f4                       
  ebdd  3504           PULS  B                           
  ebdf  179B41         LBSR 0x8723                       
  ebe2  39             RTS                               

;; Kernel API slot $FE00: inline 6 module-relative handlers -> $60E3..$60E9, $603A, $6036

; ---- function SetModuleHandlers
SetModuleHandlers:
  ebe3  3416           PSHS  X B A                       
  ebe5  AE64           LDX 0x4,S                         
  ebe7  EC81           LDD ,X++                          
  ebe9  F3600D         ADDD 0x600d                       
  ebec  FD60E3         STD 0x60e3                        
  ebef  EC81           LDD ,X++                          
  ebf1  F3600D         ADDD 0x600d                       
  ebf4  FD60E5         STD 0x60e5                        
  ebf7  EC81           LDD ,X++                          
  ebf9  F3600D         ADDD 0x600d                       
  ebfc  FD60E7         STD 0x60e7                        
  ebff  EC81           LDD ,X++                          
  ec01  F3600D         ADDD 0x600d                       
  ec04  FD60E9         STD 0x60e9                        
  ec07  EC81           LDD ,X++                          
  ec09  F3600D         ADDD 0x600d                       
  ec0c  FD603A         STD 0x603a                        
  ec0f  EC81           LDD ,X++                          
  ec11  F3600D         ADDD 0x600d                       
  ec14  FD6036         STD 0x6036                        
  ec17  AF64           STX 0x4,S                         
  ec19  3516           PULS  A B X                       
  ec1b  39             RTS                               

;; Kernel API slot $FE02: inline 4 labels (00/01 or 8 chars)

; ---- function SoftKeyLabels4Inline
SoftKeyLabels4Inline:
  ec1c  3416           PSHS  X B A                       
  ec1e  AE64           LDX 0x4,S                         
  ec20  C629           LDB #0x29                         
  ec22  170017         LBSR 0xec3c                       
  ec25  C633           LDB #0x33                         
  ec27  170012         LBSR 0xec3c                       
  ec2a  C63D           LDB #0x3d                         
  ec2c  17000D         LBSR 0xec3c                       
  ec2f  C647           LDB #0x47                         
  ec31  170008         LBSR 0xec3c                       
  ec34  1700FB         LBSR 0xed32                       
  ec37  AF64           STX 0x4,S                         
  ec39  3516           PULS  A B X                       
  ec3b  39             RTS                               

; ---- function FUN_ec3c
FUN_ec3c:
  ec3c  3406           PSHS  B A                         
  ec3e  17AB92         LBSR 0x97d3                       
  ec41  A684           LDA ,X                            
  ec43  8100           CMPA #0x0                         
  ec45  270B           BEQ 0xec52                        
  ec47  8101           CMPA #0x1                         
  ec49  270B           BEQ 0xec56                        
  ec4b  C608           LDB #0x8                          
  ec4d  17AC03         LBSR 0x9853                       
  ec50  2012           BRA 0xec64                        
LAB_ec52:
  ec52  3001           LEAX 0x1,X                        
  ec54  200E           BRA 0xec64                        
LAB_ec56:
  ec56  17AB8B         LBSR 0x97e4                        ; inline[API_FC38]: "        "
  ec59  202020202020.. char[9] "        "                
LAB_ec62:
  ec62  3001           LEAX 0x1,X                        
LAB_ec64:
  ec64  3506           PULS  A B                         
  ec66  39             RTS                               

; ---- function API_FE18
API_FE18:
  ec67  3406           PSHS  B A                         
  ec69  CCEC84         LDD #0xec84                       
  ec6c  FD603C         STD 0x603c                        
  ec6f  CCEC8C         LDD #0xec8c                       
  ec72  FD603E         STD 0x603e                        
  ec75  CCEC94         LDD #0xec94                       
  ec78  FD6040         STD 0x6040                        
  ec7b  CCEC9C         LDD #0xec9c                       
  ec7e  FD6042         STD 0x6042                        
  ec81  3506           PULS  A B                         
  ec83  39             RTS                               

; ---- function API_FE10
API_FE10:
  ec84  17001D         LBSR 0xeca4                       
  ec87  AD9F60E3       JSR [0x60e3]                      
  ec8b  39             RTS                               

; ---- function API_FE12
API_FE12:
  ec8c  17001F         LBSR 0xecae                       
  ec8f  AD9F60E5       JSR [0x60e5]                      
  ec93  39             RTS                               

; ---- function API_FE14
API_FE14:
  ec94  170021         LBSR 0xecb8                       
  ec97  AD9F60E7       JSR [0x60e7]                      
  ec9b  39             RTS                               

; ---- function API_FE16
API_FE16:
  ec9c  170023         LBSR 0xecc2                       
  ec9f  AD9F60E9       JSR [0x60e9]                      
  eca3  39             RTS                               

; ---- function API_FDE8
API_FDE8:
  eca4  3406           PSHS  B A                         
  eca6  C628           LDB #0x28                         
  eca8  170021         LBSR 0xeccc                       
  ecab  3506           PULS  A B                         
  ecad  39             RTS                               

; ---- function API_FDEA
API_FDEA:
  ecae  3406           PSHS  B A                         
  ecb0  C632           LDB #0x32                         
  ecb2  170017         LBSR 0xeccc                       
  ecb5  3506           PULS  A B                         
  ecb7  39             RTS                               

; ---- function API_FDEC
API_FDEC:
  ecb8  3406           PSHS  B A                         
  ecba  C63C           LDB #0x3c                         
  ecbc  17000D         LBSR 0xeccc                       
  ecbf  3506           PULS  A B                         
  ecc1  39             RTS                               

; ---- function API_FDEE
API_FDEE:
  ecc2  3406           PSHS  B A                         
  ecc4  C646           LDB #0x46                         
  ecc6  170003         LBSR 0xeccc                       
  ecc9  3506           PULS  A B                         
  eccb  39             RTS                               

; ---- function API_FDE6
API_FDE6:
  eccc  3406           PSHS  B A                         
  ecce  17007A         LBSR 0xed4b                       
  ecd1  2619           BNE 0xecec                        
  ecd3  17005C         LBSR 0xed32                       
LAB_ecd6:
  ecd6  1F98           TFR B,A                           
  ecd8  17AAF8         LBSR 0x97d3                       
  ecdb  C608           LDB #0x8                          
  ecdd  17AA47         LBSR 0x9727                       
  ece0  1F89           TFR A,B                           
  ece2  CB09           ADDB #0x9                         
  ece4  17AAEC         LBSR 0x97d3                       
  ece7  C609           LDB #0x9                          
  ece9  17AA3B         LBSR 0x9727                       
LAB_ecec:
  ecec  3506           PULS  A B                         
  ecee  39             RTS                               

; ---- function API_FE32
API_FE32:
  ecef  3406           PSHS  B A                         
  ecf1  C403           ANDB #0x3                         
  ecf3  860A           LDA #0xa                          
  ecf5  3D             MUL                               
  ecf6  CB28           ADDB #0x28                        
  ecf8  20DC           BRA 0xecd6                        

; ---- function API_FDF0
API_FDF0:
  ecfa  3406           PSHS  B A                         
  ecfc  17004C         LBSR 0xed4b                       
  ecff  2618           BNE 0xed19                        
  ed01  1F98           TFR B,A                           
  ed03  17AACD         LBSR 0x97d3                       
  ed06  C628           LDB #0x28                         
  ed08  17AA1C         LBSR 0x9727                       
  ed0b  1F89           TFR A,B                           
  ed0d  CB09           ADDB #0x9                         
  ed0f  17AAC1         LBSR 0x97d3                       
  ed12  C629           LDB #0x29                         
  ed14  17AA10         LBSR 0x9727                       
  ed17  2016           BRA 0xed2f                        
LAB_ed19:
  ed19  1F98           TFR B,A                           
  ed1b  17AAB5         LBSR 0x97d3                       
  ed1e  C620           LDB #0x20                         
  ed20  17AA04         LBSR 0x9727                       
  ed23  1F89           TFR A,B                           
  ed25  CB09           ADDB #0x9                         
  ed27  17AAA9         LBSR 0x97d3                       
  ed2a  C614           LDB #0x14                         
  ed2c  17A9F8         LBSR 0x9727                       
LAB_ed2f:
  ed2f  3506           PULS  A B                         
  ed31  39             RTS                               

; ---- function API_FDF2
API_FDF2:
  ed32  3406           PSHS  B A                         
  ed34  C628           LDB #0x28                         
  ed36  17FFC1         LBSR 0xecfa                       
  ed39  C632           LDB #0x32                         
  ed3b  17FFBC         LBSR 0xecfa                       
  ed3e  C63C           LDB #0x3c                         
  ed40  17FFB7         LBSR 0xecfa                       
  ed43  C646           LDB #0x46                         
  ed45  17FFB2         LBSR 0xecfa                       
  ed48  3506           PULS  A B                         
  ed4a  39             RTS                               

; ---- function API_FDF4
API_FDF4:
  ed4b  3406           PSHS  B A                         
  ed4d  CB01           ADDB #0x1                         
  ed4f  17AA81         LBSR 0x97d3                       
  ed52  8600           LDA #0x0                          
LAB_ed54:
  ed54  4C             INCA                              
  ed55  17A9DB         LBSR 0x9733                       
  ed58  C120           CMPB #0x20                        
  ed5a  2609           BNE 0xed65                        
  ed5c  8108           CMPA #0x8                         
  ed5e  2DF4           BLT 0xed54                        
  ed60  CCFFFF         LDD #0xffff                       
  ed63  2003           BRA 0xed68                        
LAB_ed65:
  ed65  CC0000         LDD #0x0                          
LAB_ed68:
  ed68  3506           PULS  A B                         
  ed6a  39             RTS                               

; ---- function API_FDF6
API_FDF6:
  ed6b  17AC96         LBSR 0x9a04                        ; inline[API_FC48]: 08 "........"
  ed6e  08             db 8h                             
  ed6f  1E1C1818181C.. ds 1Eh,1Ch,18h,18h,18h,1Ch,1Eh    
LAB_ed77:
  ed77  17AC8A         LBSR 0x9a04                        ; inline[API_FC48]: 09 "........"
  ed7a  09             db 9h                             
  ed7b  0F0703030307.. ds 0Fh,"\a",03h,03h,03h,"\a",0Fh  
LAB_ed83:
  ed83  17AC7E         LBSR 0x9a04                        ; inline[API_FC48]: 0A "........"
  ed86  0A             db Ah                             
  ed87  1C1C1C1C1C1C.. ds 1Ch,1Ch,1Ch,1Ch,1Ch,1Ch,1Ch    
LAB_ed8f:
  ed8f  17AC72         LBSR 0x9a04                        ; inline[API_FC48]: 0B "........"
  ed92  0B             db Bh                             
  ed93  070707070707.. ds "\a\a\a\a\a\a\a"               
LAB_ed9b:
  ed9b  17AC66         LBSR 0x9a04                        ; inline[API_FC48]: 0C "........"
  ed9e  0C             db Ch                             
  ed9f  0E0E041F0404.. ds 0Eh,0Eh,04h,1Fh,04h,04h,"\n",11h
LAB_eda7:
  eda7  39             RTS                               

;; Kernel API slot $FE04: inline (param, $70xx offset) pairs

; ---- function LoadParamsSigned
LoadParamsSigned:
  eda8  3476           PSHS  U Y X B A                   
  edaa  EE68           LDU 0x8,S                         
LAB_edac:
  edac  E6C0           LDB ,U+                           
  edae  2712           BEQ 0xedc2                        
  edb0  4F             CLRA                              
  edb1  1F01           TFR D,X                           
  edb3  E6C0           LDB ,U+                           
  edb5  C37000         ADDD #0x7000                      
  edb8  1F02           TFR D,Y                           
  edba  17B948         LBSR 0xa705                       
  edbd  1D             SEX                               
  edbe  EDA4           STD ,Y                            
  edc0  20EA           BRA 0xedac                        
LAB_edc2:
  edc2  EF68           STU 0x8,S                         
  edc4  3576           PULS  A B X Y U                   
  edc6  39             RTS                               

;; Kernel API slot $FE06: inline (param, $70xx offset) pairs

; ---- function LoadParamsUnsigned
LoadParamsUnsigned:
  edc7  3476           PSHS  U Y X B A                   
  edc9  EE68           LDU 0x8,S                         
LAB_edcb:
  edcb  E6C0           LDB ,U+                           
  edcd  2712           BEQ 0xede1                        
  edcf  4F             CLRA                              
  edd0  1F01           TFR D,X                           
  edd2  E6C0           LDB ,U+                           
  edd4  C37000         ADDD #0x7000                      
  edd7  1F02           TFR D,Y                           
  edd9  17B929         LBSR 0xa705                       
  eddc  4F             CLRA                              
  eddd  EDA4           STD ,Y                            
  eddf  20EA           BRA 0xedcb                        
LAB_ede1:
  ede1  EF68           STU 0x8,S                         
  ede3  3576           PULS  A B X Y U                   
  ede5  39             RTS                               

;; Kernel API slot $FE08: inline (param, $70xx offset) pairs

; ---- function LoadParamsScaled
LoadParamsScaled:
  ede6  3476           PSHS  U Y X B A                   
  ede8  EE68           LDU 0x8,S                         
LAB_edea:
  edea  E6C0           LDB ,U+                           
  edec  2711           BEQ 0xedff                        
  edee  4F             CLRA                              
  edef  1F01           TFR D,X                           
  edf1  E6C0           LDB ,U+                           
  edf3  C37000         ADDD #0x7000                      
  edf6  1F02           TFR D,Y                           
  edf8  17B920         LBSR 0xa71b                       
  edfb  EDA4           STD ,Y                            
  edfd  20EB           BRA 0xedea                        
LAB_edff:
  edff  EF68           STU 0x8,S                         
  ee01  3576           PULS  A B X Y U                   
  ee03  39             RTS                               

; ---- function API_FDFE
API_FDFE:
  ee04  39             RTS                               

; ---- function API_FE1A
API_FE1A:
  ee05  17FE14         LBSR 0xec1c                        ; inline[API_FE02]: [-] [-] " range  " "per note"
  ee08  00             db 0h                             
  ee09  00             db 0h                             
  ee0a  2072616E6765.. ds " range  "                     
  ee12  706572206E6F.. ds "per note"                     
LAB_ee1a:
  ee1a  17FF15         LBSR 0xed32                       
  ee1d  CCEE3E         LDD #0xee3e                       
  ee20  FD60E7         STD 0x60e7                        
  ee23  CCEE4E         LDD #0xee4e                       
  ee26  FD60E9         STD 0x60e9                        
  ee29  CCEC94         LDD #0xec94                       
  ee2c  FD6040         STD 0x6040                        
  ee2f  CCEC9C         LDD #0xec9c                       
  ee32  FD6042         STD 0x6042                        
  ee35  1F10           TFR X,D                           
  ee37  F3600D         ADDD 0x600d                       
  ee3a  FD6205         STD 0x6205                        
  ee3d  39             RTS                               

; ---- function FUN_ee3e
FUN_ee3e:
  ee3e  3436           PSHS  Y X B A                     
  ee40  BE6205         LDX 0x6205                        
  ee43  CC0001         LDD #0x1                          
  ee46  FD60DC         STD 0x60dc                        
  ee49  FD60DE         STD 0x60de                        
  ee4c  2010           BRA 0xee5e                        

; ---- function FUN_ee4e
FUN_ee4e:
  ee4e  3436           PSHS  Y X B A                     
  ee50  BE6205         LDX 0x6205                        
  ee53  CC0080         LDD #0x80                         
  ee56  FD60DC         STD 0x60dc                        
  ee59  FD60DE         STD 0x60de                        
  ee5c  2000           BRA 0xee5e                        

; ---- function FUN_ee5e
FUN_ee5e:
  ee5e  EC9822         LDD [0x22,X]                      
  ee61  FD6074         STD 0x6074                        
  ee64  CC0001         LDD #0x1                          
  ee67  F76066         STB 0x6066                        
  ee6a  F76067         STB 0x6067                        
  ee6d  F760E0         STB 0x60e0                        
  ee70  F76068         STB 0x6068                        
  ee73  C602           LDB #0x2                          
  ee75  F76058         STB 0x6058                        
  ee78  E68819         LDB 0x19,X                        
  ee7b  F76099         STB 0x6099                        
  ee7e  C606           LDB #0x6                          
  ee80  F76069         STB 0x6069                        
  ee83  CC7FFF         LDD #0x7fff                       
  ee86  FD606C         STD 0x606c                        
  ee89  CC8000         LDD #0x8000                       
  ee8c  FD606E         STD 0x606e                        
  ee8f  CCEEEB         LDD #0xeeeb                       
  ee92  FD6070         STD 0x6070                        
  ee95  CCEECA         LDD #0xeeca                       
  ee98  FD6072         STD 0x6072                        
  ee9b  179EB3         LBSR 0x8d51                       
  ee9e  C60B           LDB #0xb                          
  eea0  17A930         LBSR 0x97d3                       
  eea3  17A93E         LBSR 0x97e4                        ; inline[API_FC38]: "mod range:       [     /note]"
  eea6  6D6F64207261.. char[30] "mod range:       [     /note]"
LAB_eec4:
  eec4  170024         LBSR 0xeeeb                       
  eec7  3536           PULS  A B X Y                     
  eec9  39             RTS                               

; ---- function FUN_eeca
FUN_eeca:
  eeca  3436           PSHS  Y X B A                     
  eecc  BE6205         LDX 0x6205                        
  eecf  FC6074         LDD 0x6074                        
  eed2  ED9822         STD [0x22,X]                      
  eed5  EC8824         LDD 0x24,X                        
  eed8  A30E           SUBD 0xe,X                        
  eeda  1F02           TFR D,Y                           
  eedc  FC6074         LDD 0x6074                        
  eedf  ED9822         STD [0x22,X]                      
  eee2  17B86D         LBSR 0xa752                       
  eee5  170003         LBSR 0xeeeb                       
  eee8  3536           PULS  A B X Y                     
  eeea  39             RTS                               

; ---- function FUN_eeeb
FUN_eeeb:
  eeeb  3476           PSHS  U Y X B A                   
  eeed  BE6205         LDX 0x6205                        
  eef0  3410           PSHS  X                           
  eef2  C615           LDB #0x15                         
  eef4  17A8DC         LBSR 0x97d3                       
  eef7  4F             CLRA                              
  eef8  C607           LDB #0x7                          
  eefa  3406           PSHS  B A                         
  eefc  CC609A         LDD #0x609a                       
  eeff  C30009         ADDD #0x9                         
  ef02  A3E4           SUBD ,S                           
  ef04  1F01           TFR D,X                           
  ef06  3506           PULS  A B                         
  ef08  17A948         LBSR 0x9853                       
  ef0b  3510           PULS  X                           
  ef0d  C61D           LDB #0x1d                         
  ef0f  17A8C1         LBSR 0x97d3                       
  ef12  EC9822         LDD [0x22,X]                      
  ef15  47             ASRA                              
  ef16  56             RORB                              
  ef17  47             ASRA                              
  ef18  56             RORB                              
  ef19  47             ASRA                              
  ef1a  56             RORB                              
  ef1b  47             ASRA                              
  ef1c  56             RORB                              
  ef1d  47             ASRA                              
  ef1e  56             RORB                              
  ef1f  47             ASRA                              
  ef20  56             RORB                              
  ef21  47             ASRA                              
  ef22  56             RORB                              
  ef23  3606           PSHU  B A                         
  ef25  5F             CLRB                              
  ef26  A68819         LDA 0x19,X                        
  ef29  108E6207       LDY #0x6207                       
  ef2d  17A94C         LBSR 0x987c                       
  ef30  C605           LDB #0x5                          
  ef32  8E620B         LDX #0x620b                       
  ef35  17A91B         LBSR 0x9853                       
  ef38  3576           PULS  A B X Y U                   
  ef3a  39             RTS                               

;; Kernel API slot $FE1C: X = module-relative parameter descriptor

; ---- function ParamDescriptorCall
ParamDescriptorCall:
  ef3b  3476           PSHS  U Y X B A                   
  ef3d  58             LSLB                              
  ef3e  49             ROLA                              
  ef3f  3606           PSHU  B A                         
  ef41  FC600D         LDD 0x600d                        
  ef44  308B           LEAX D,X                          
  ef46  EC9822         LDD [0x22,X]                      
  ef49  3606           PSHU  B A                         
  ef4b  17CF1D         LBSR 0xbe6b                       
  ef4e  3706           PULU  A B                         
  ef50  ED9808         STD [0x8,X]                       
  ef53  EC84           LDD ,X                            
  ef55  F3600D         ADDD 0x600d                       
  ef58  1F02           TFR D,Y                           
  ef5a  ADA4           JSR ,Y                            
  ef5c  EC02           LDD 0x2,X                         
  ef5e  F3600D         ADDD 0x600d                       
  ef61  10B36070       CMPD 0x6070                       
  ef65  2602           BNE 0xef69                        
  ef67  8D24           BSR 0xef8d                        
LAB_ef69:
  ef69  3576           PULS  A B X Y U                   
  ef6b  39             RTS                               

; ---- function FUN_ef6c
FUN_ef6c:
  ef6c  3476           PSHS  U Y X B A                   
  ef6e  FC600D         LDD 0x600d                        
  ef71  308B           LEAX D,X                          
  ef73  EC8826         LDD 0x26,X                        
  ef76  F3600D         ADDD 0x600d                       
  ef79  1F02           TFR D,Y                           
  ef7b  ADA4           JSR ,Y                            
  ef7d  EC02           LDD 0x2,X                         
  ef7f  F3600D         ADDD 0x600d                       
  ef82  10B36070       CMPD 0x6070                       
  ef86  2602           BNE 0xef8a                        
  ef88  8D03           BSR 0xef8d                        
LAB_ef8a:
  ef8a  3576           PULS  A B X Y U                   
  ef8c  39             RTS                               

; ---- function FUN_ef8d
FUN_ef8d:
  ef8d  3476           PSHS  U Y X B A                   
  ef8f  EC980C         LDD [0xc,X]                       
  ef92  FD6074         STD 0x6074                        
  ef95  F3615D         ADDD 0x615d                       
  ef98  FD6062         STD 0x6062                        
  ef9b  FD6054         STD 0x6054                        
  ef9e  EC980C         LDD [0xc,X]                       
  efa1  3606           PSHU  B A                         
  efa3  108E609A       LDY #0x609a                       
  efa7  A68819         LDA 0x19,X                        
  efaa  17A8CF         LBSR 0x987c                       
  efad  EC02           LDD 0x2,X                         
  efaf  F3600D         ADDD 0x600d                       
  efb2  1F02           TFR D,Y                           
  efb4  ADA4           JSR ,Y                            
  efb6  3576           PULS  A B X Y U                   
  efb8  39             RTS                               

; ---- function FUN_efb9
FUN_efb9:
  efb9  3476           PSHS  U Y X B A                   
  efbb  FC600D         LDD 0x600d                        
  efbe  308B           LEAX D,X                          
  efc0  E6881B         LDB 0x1b,X                        
  efc3  17A80D         LBSR 0x97d3                       
  efc6  EC980C         LDD [0xc,X]                       
  efc9  A6881A         LDA 0x1a,X                        
  efcc  8B08           ADDA #0x8                         
  efce  3D             MUL                               
  efcf  F3600D         ADDD 0x600d                       
  efd2  E38820         ADDD 0x20,X                       
  efd5  C30008         ADDD #0x8                         
  efd8  1F02           TFR D,Y                           
  efda  E6881A         LDB 0x1a,X                        
  efdd  1F21           TFR Y,X                           
  efdf  17A871         LBSR 0x9853                       
  efe2  3576           PULS  A B X Y U                   
  efe4  39             RTS                               

; ---- function FUN_efe5
FUN_efe5:
  efe5  3476           PSHS  U Y X B A                   
  efe7  FC600D         LDD 0x600d                        
  efea  308B           LEAX D,X                          
  efec  C629           LDB #0x29                         
  efee  10AE881E       LDY 0x1e,X                        
  eff2  10BC60E3       CMPY 0x60e3                       
  eff6  2718           BEQ 0xf010                        
  eff8  CB0A           ADDB #0xa                         
  effa  10BC60E5       CMPY 0x60e5                       
  effe  2710           BEQ 0xf010                        
  f000  CB0A           ADDB #0xa                         
  f002  10BC60E7       CMPY 0x60e7                       
  f006  2708           BEQ 0xf010                        
  f008  CB0A           ADDB #0xa                         
  f00a  10BC60E9       CMPY 0x60e9                       
  f00e  261B           BNE 0xf02b                        
LAB_f010:
  f010  3404           PSHS  B                           
  f012  17A7BE         LBSR 0x97d3                       
  f015  EC980C         LDD [0xc,X]                       
  f018  A6881A         LDA 0x1a,X                        
  f01b  8B08           ADDA #0x8                         
  f01d  3D             MUL                               
  f01e  F3600D         ADDD 0x600d                       
  f021  E38820         ADDD 0x20,X                       
  f024  1F01           TFR D,X                           
  f026  3504           PULS  B                           
  f028  17FC11         LBSR 0xec3c                       
LAB_f02b:
  f02b  3576           PULS  A B X Y U                   
  f02d  39             RTS                               

; ---- function FUN_f02e
FUN_f02e:
  f02e  3476           PSHS  U Y X B A                   
  f030  170006         LBSR 0xf039                       
  f033  1701ED         LBSR 0xf223                       
  f036  3576           PULS  A B X Y U                   
  f038  39             RTS                               

; ---- function FUN_f039
FUN_f039:
  f039  3476           PSHS  U Y X B A                   
  f03b  3410           PSHS  X                           
  f03d  FC600D         LDD 0x600d                        
  f040  308B           LEAX D,X                          
  f042  EC980C         LDD [0xc,X]                       
  f045  A39808         SUBD [0x8,X]                      
  f048  ED9806         STD [0x6,X]                       
  f04b  EC9806         LDD [0x6,X]                       
  f04e  C30001         ADDD #0x1                         
  f051  ED9806         STD [0x6,X]                       
  f054  E39808         ADDD [0x8,X]                      
  f057  10A38815       CMPD 0x15,X                       
  f05b  2F09           BLE 0xf066                        
  f05d  CC0000         LDD #0x0                          
  f060  A39808         SUBD [0x8,X]                      
  f063  ED9806         STD [0x6,X]                       
LAB_f066:
  f066  3510           PULS  X                           
  f068  17023D         LBSR 0xf2a8                       
  f06b  EC84           LDD ,X                            
  f06d  F3600D         ADDD 0x600d                       
  f070  1F02           TFR D,Y                           
  f072  ADA4           JSR ,Y                            
  f074  FC600D         LDD 0x600d                        
  f077  308B           LEAX D,X                          
  f079  170149         LBSR 0xf1c5                       
  f07c  EC8810         LDD 0x10,X                        
  f07f  A30E           SUBD 0xe,X                        
  f081  1F02           TFR D,Y                           
  f083  EC9806         LDD [0x6,X]                       
  f086  17B6C9         LBSR 0xa752                       
  f089  3576           PULS  A B X Y U                   
  f08b  39             RTS                               

; ---- function API_FC4C
API_FC4C:
  f08c  3476           PSHS  U Y X B A                   
  f08e  170094         LBSR 0xf125                       
  f091  17B6A8         LBSR 0xa73c                       
  f094  3576           PULS  A B X Y U                   
  f096  39             RTS                               

; ---- function API_FC50
API_FC50:
  f097  3476           PSHS  U Y X B A                   
  f099  1700F7         LBSR 0xf193                       
  f09c  17B69D         LBSR 0xa73c                       
  f09f  3576           PULS  A B X Y U                   
  f0a1  39             RTS                               

; ---- function API_FC52
API_FC52:
  f0a2  3476           PSHS  U Y X B A                   
  f0a4  FC600D         LDD 0x600d                        
  f0a7  308B           LEAX D,X                          
  f0a9  E6881B         LDB 0x1b,X                        
  f0ac  17A724         LBSR 0x97d3                       
  f0af  EC980C         LDD [0xc,X]                       
  f0b2  A6881A         LDA 0x1a,X                        
  f0b5  3D             MUL                               
  f0b6  F3600D         ADDD 0x600d                       
  f0b9  E38820         ADDD 0x20,X                       
  f0bc  1F02           TFR D,Y                           
  f0be  E6881A         LDB 0x1a,X                        
  f0c1  1F21           TFR Y,X                           
  f0c3  17A78D         LBSR 0x9853                       
  f0c6  3576           PULS  A B X Y U                   
  f0c8  39             RTS                               

; ---- function API_FC4E
API_FC4E:
  f0c9  3476           PSHS  U Y X B A                   
  f0cb  170155         LBSR 0xf223                       
  f0ce  C610           LDB #0x10                         
  f0d0  F76067         STB 0x6067                        
  f0d3  17A433         LBSR 0x9509                       
  f0d6  3576           PULS  A B X Y U                   
  f0d8  39             RTS                               

; ---- function API_FDBC
API_FDBC:
  f0d9  3476           PSHS  U Y X B A                   
  f0db  170047         LBSR 0xf125                       
  f0de  17B671         LBSR 0xa752                       
  f0e1  3576           PULS  A B X Y U                   
  f0e3  39             RTS                               

; ---- function API_FE6C
API_FE6C:
  f0e4  3476           PSHS  U Y X B A                   
  f0e6  1700AA         LBSR 0xf193                       
  f0e9  17B666         LBSR 0xa752                       
  f0ec  3576           PULS  A B X Y U                   
  f0ee  39             RTS                               

; ---- function API_FE6E
API_FE6E:
  f0ef  3476           PSHS  U Y X B A                   
  f0f1  17010D         LBSR 0xf201                       
  f0f4  3576           PULS  A B X Y U                   
  f0f6  39             RTS                               

; ---- function API_FE6A
API_FE6A:
  f0f7  3476           PSHS  U Y X B A                   
  f0f9  170127         LBSR 0xf223                       
  f0fc  3576           PULS  A B X Y U                   
  f0fe  39             RTS                               

; ---- function API_FE22
API_FE22:
  f0ff  3476           PSHS  U Y X B A                   
  f101  170021         LBSR 0xf125                       
  f104  17B635         LBSR 0xa73c                       
  f107  3576           PULS  A B X Y U                   
  f109  39             RTS                               

; ---- function API_FE70
API_FE70:
  f10a  3476           PSHS  U Y X B A                   
  f10c  170084         LBSR 0xf193                       
  f10f  17B62A         LBSR 0xa73c                       
  f112  3576           PULS  A B X Y U                   
  f114  39             RTS                               

; ---- function API_FE72
API_FE72:
  f115  3476           PSHS  U Y X B A                   
  f117  1700E7         LBSR 0xf201                       
  f11a  3576           PULS  A B X Y U                   
  f11c  39             RTS                               

; ---- function API_FE74
API_FE74:
  f11d  3476           PSHS  U Y X B A                   
  f11f  170101         LBSR 0xf223                       
  f122  3576           PULS  A B X Y U                   
  f124  39             RTS                               

; ---- function FUN_f125
FUN_f125:
  f125  3440           PSHS  U                           
  f127  FC600D         LDD 0x600d                        
  f12a  308B           LEAX D,X                          
  f12c  17A67A         LBSR 0x97a9                       
  f12f  17D157         LBSR 0xc289                        ; inline[API_FD18]: [$602A]=$A7F9 [$602E]=$AD71 [$6030]=$FBDA [$603A]=$ABC0
  f132  602A           addr 602a                         
  f134  A7F9           dw A7F9h                          
  f136  602E           addr 602e                         
  f138  AD71           dw AD71h                          
  f13a  6030           addr 6030                         
  f13c  FBDA           dw FBDAh                          
  f13e  603A           addr 603a                         
  f140  ABC0           dw ABC0h                          
  f142  FFFF           dw FFFFh                          
LAB_f144:
  f144  17BB8A         LBSR 0xacd1                       
  f147  EC8815         LDD 0x15,X                        
  f14a  10831FFF       CMPD #0x1fff                      
  f14e  2E09           BGT 0xf159                        
  f150  EC8813         LDD 0x13,X                        
  f153  1083E000       CMPD #0xe000                      
  f157  2C1B           BGE 0xf174                        
LAB_f159:
  f159  EC8813         LDD 0x13,X                        
  f15c  10830000       CMPD #0x0                         
  f160  2C09           BGE 0xf16b                        
  f162  FC60F9         LDD 0x60f9                        
  f165  58             LSLB                              
  f166  49             ROLA                              
  f167  58             LSLB                              
  f168  49             ROLA                              
  f169  200C           BRA 0xf177                        
LAB_f16b:
  f16b  FC60F9         LDD 0x60f9                        
  f16e  58             LSLB                              
  f16f  49             ROLA                              
  f170  847F           ANDA #0x7f                        
  f172  2003           BRA 0xf177                        
LAB_f174:
  f174  FC60F9         LDD 0x60f9                        
LAB_f177:
  f177  FD6074         STD 0x6074                        
  f17a  ED9806         STD [0x6,X]                       
  f17d  EC84           LDD ,X                            
LAB_f17f:
  f17f  F3600D         ADDD 0x600d                       
  f182  1F02           TFR D,Y                           
  f184  ADA4           JSR ,Y                            
  f186  EC8810         LDD 0x10,X                        
  f189  A30E           SUBD 0xe,X                        
  f18b  1F02           TFR D,Y                           
  f18d  EC9806         LDD [0x6,X]                       
  f190  3540           PULS  U                           
  f192  39             RTS                               

; ---- function FUN_f193
FUN_f193:
  f193  3440           PSHS  U                           
  f195  FC600D         LDD 0x600d                        
  f198  308B           LEAX D,X                          
  f19a  FC6074         LDD 0x6074                        
  f19d  A39808         SUBD [0x8,X]                      
  f1a0  ED9806         STD [0x6,X]                       
  f1a3  17001F         LBSR 0xf1c5                       
  f1a6  EC84           LDD ,X                            
  f1a8  F3600D         ADDD 0x600d                       
  f1ab  1F02           TFR D,Y                           
  f1ad  ADA4           JSR ,Y                            
  f1af  EC02           LDD 0x2,X                         
  f1b1  F3600D         ADDD 0x600d                       
  f1b4  1F02           TFR D,Y                           
  f1b6  ADA4           JSR ,Y                            
  f1b8  EC8810         LDD 0x10,X                        
  f1bb  A30E           SUBD 0xe,X                        
  f1bd  1F02           TFR D,Y                           
  f1bf  EC9806         LDD [0x6,X]                       
  f1c2  3540           PULS  U                           
  f1c4  39             RTS                               

; ---- function FUN_f1c5
FUN_f1c5:
  f1c5  3476           PSHS  U Y X B A                   
  f1c7  E68812         LDB 0x12,X                        
  f1ca  4F             CLRA                              
  f1cb  1F02           TFR D,Y                           
  f1cd  EC8815         LDD 0x15,X                        
  f1d0  10831FFF       CMPD #0x1fff                      
  f1d4  2E09           BGT 0xf1df                        
  f1d6  EC8813         LDD 0x13,X                        
  f1d9  1083E000       CMPD #0xe000                      
  f1dd  2C19           BGE 0xf1f8                        
LAB_f1df:
  f1df  EC8813         LDD 0x13,X                        
  f1e2  10830000       CMPD #0x0                         
  f1e6  2C09           BGE 0xf1f1                        
  f1e8  EC9806         LDD [0x6,X]                       
  f1eb  47             ASRA                              
  f1ec  56             RORB                              
  f1ed  47             ASRA                              
  f1ee  56             RORB                              
  f1ef  200A           BRA 0xf1fb                        
LAB_f1f1:
  f1f1  EC9806         LDD [0x6,X]                       
  f1f4  47             ASRA                              
  f1f5  56             RORB                              
  f1f6  2003           BRA 0xf1fb                        
LAB_f1f8:
  f1f8  EC9806         LDD [0x6,X]                       
LAB_f1fb:
  f1fb  1703AB         LBSR 0xf5a9                       
  f1fe  3576           PULS  A B X Y U                   
  f200  39             RTS                               

; ---- function FUN_f201
FUN_f201:
  f201  3476           PSHS  U Y X B A                   
  f203  FC600D         LDD 0x600d                        
  f206  308B           LEAX D,X                          
  f208  E6881B         LDB 0x1b,X                        
  f20b  17A5C5         LBSR 0x97d3                       
  f20e  5F             CLRB                              
  f20f  E0881A         SUBB 0x1a,X                       
  f212  1D             SEX                               
  f213  C360A3         ADDD #0x60a3                      
  f216  1F02           TFR D,Y                           
  f218  E6881A         LDB 0x1a,X                        
  f21b  1F21           TFR Y,X                           
  f21d  17A633         LBSR 0x9853                       
  f220  3576           PULS  A B X Y U                   
  f222  39             RTS                               

; ---- function FUN_f223
FUN_f223:
  f223  3476           PSHS  U Y X B A                   
  f225  FC600D         LDD 0x600d                        
  f228  308B           LEAX D,X                          
  f22a  EC980C         LDD [0xc,X]                       
  f22d  FD6074         STD 0x6074                        
  f230  17AEBE         LBSR 0xa0f1                       
  f233  EC881C         LDD 0x1c,X                        
  f236  F3600D         ADDD 0x600d                       
  f239  1F02           TFR D,Y                           
  f23b  E6A4           LDB ,Y                            
  f23d  5A             DECB                              
  f23e  17A592         LBSR 0x97d3                       
  f241  C60A           LDB #0xa                          
  f243  17A4E1         LBSR 0x9727                       
  f246  3410           PSHS  X                           
  f248  C628           LDB #0x28                         
  f24a  E0A4           SUBB ,Y                           
  f24c  3021           LEAX 0x1,Y                        
  f24e  17A602         LBSR 0x9853                       
  f251  3510           PULS  X                           
  f253  CC0001         LDD #0x1                          
  f256  F76066         STB 0x6066                        
  f259  F76068         STB 0x6068                        
  f25c  FD60E0         STD 0x60e0                        
  f25f  F76067         STB 0x6067                        
  f262  CC0002         LDD #0x2                          
  f265  F76058         STB 0x6058                        
  f268  EC8813         LDD 0x13,X                        
  f26b  FD606E         STD 0x606e                        
  f26e  EC8815         LDD 0x15,X                        
  f271  FD606C         STD 0x606c                        
  f274  EC8817         LDD 0x17,X                        
  f277  FD60DC         STD 0x60dc                        
  f27a  FD60DE         STD 0x60de                        
  f27d  E68819         LDB 0x19,X                        
  f280  F76099         STB 0x6099                        
  f283  E6881A         LDB 0x1a,X                        
  f286  F76069         STB 0x6069                        
  f289  EC02           LDD 0x2,X                         
  f28b  F3600D         ADDD 0x600d                       
  f28e  FD6070         STD 0x6070                        
  f291  EC04           LDD 0x4,X                         
  f293  F3600D         ADDD 0x600d                       
  f296  FD6072         STD 0x6072                        
  f299  179AB5         LBSR 0x8d51                       
  f29c  EC02           LDD 0x2,X                         
  f29e  F3600D         ADDD 0x600d                       
  f2a1  1F02           TFR D,Y                           
  f2a3  ADA4           JSR ,Y                            
  f2a5  3576           PULS  A B X Y U                   
  f2a7  39             RTS                               

; ---- function API_FE76
API_FE76:
  f2a8  3476           PSHS  U Y X B A                   
  f2aa  FC600D         LDD 0x600d                        
  f2ad  308B           LEAX D,X                          
  f2af  EC8813         LDD 0x13,X                        
  f2b2  3606           PSHU  B A                         
  f2b4  EC8815         LDD 0x15,X                        
  f2b7  3606           PSHU  B A                         
  f2b9  EC9806         LDD [0x6,X]                       
  f2bc  E39808         ADDD [0x8,X]                      
  f2bf  3606           PSHU  B A                         
  f2c1  17CA14         LBSR 0xbcd8                       
  f2c4  3706           PULU  A B                         
  f2c6  ED980C         STD [0xc,X]                       
  f2c9  3576           PULS  A B X Y U                   
  f2cb  39             RTS                               

; ---- function API_FE4C
API_FE4C:
  f2cc  3436           PSHS  Y X B A                     
  f2ce  CC000F         LDD #0xf                          
  f2d1  17D06A         LBSR 0xc33e                       
  f2d4  C6FF           LDB #0xff                         
  f2d6  F76116         STB 0x6116                        
  f2d9  17C38D         LBSR 0xb669                       
  f2dc  5F             CLRB                              
  f2dd  17A421         LBSR 0x9701                       
  f2e0  3536           PULS  A B X Y                     
  f2e2  3436           PSHS  Y X B A                     
  f2e4  17004F         LBSR 0xf336                        ; inline[API_FE24]: $68A0
  f2e7  68A0           dw 68A0h                          
LAB_f2e9:
  f2e9  17C39E         LBSR 0xb68a                       
  f2ec  CC001E         LDD #0x1e                         
  f2ef  17D04C         LBSR 0xc33e                       
  f2f2  8E0296         LDX #0x296                        
  f2f5  17B40D         LBSR 0xa705                       
  f2f8  F76116         STB 0x6116                        
  f2fb  3536           PULS  A B X Y                     
  f2fd  39             RTS                               

; ---- function FUN_f2fe
FUN_f2fe:
  f2fe  3436           PSHS  Y X B A                     
  f300  CC000F         LDD #0xf                          
  f303  17D038         LBSR 0xc33e                       
  f306  C6FF           LDB #0xff                         
  f308  F76116         STB 0x6116                        
  f30b  17C35B         LBSR 0xb669                       
  f30e  5F             CLRB                              
  f30f  17A3EF         LBSR 0x9701                       
  f312  8E68A0         LDX #0x68a0                       
  f315  3089000B       LEAX 0xb,X                        
  f319  CC000A         LDD #0xa                          
  f31c  170017         LBSR 0xf336                        ; inline[API_FE24]: $68A0
  f31f  68A0           dw 68A0h                          
LAB_f321:
  f321  17C366         LBSR 0xb68a                       
  f324  CC001E         LDD #0x1e                         
  f327  17D014         LBSR 0xc33e                       
  f32a  8E0296         LDX #0x296                        
  f32d  17B3D5         LBSR 0xa705                       
  f330  F76116         STB 0x6116                        
  f333  3536           PULS  A B X Y                     
  f335  39             RTS                               

; ---- function API_FE24
API_FE24:
  f336  3426           PSHS  Y B A                       
  f338  3276           LEAS -0xa,S                       
  f33a  AF62           STX 0x2,S                         
  f33c  AE6E           LDX 0xe,S                         
  f33e  10AE81         LDY ,X++                          
  f341  AF6E           STX 0xe,S                         
  f343  AE62           LDX 0x2,S                         
  f345  ED64           STD 0x4,S                         
LAB_f347:
  f347  C63A           LDB #0x3a                         
  f349  6F67           CLR 0x7,S                         
  f34b  170087         LBSR 0xf3d5                       
  f34e  EC64           LDD 0x4,S                         
  f350  10830020       CMPD #0x20                        
  f354  2303           BLS 0xf359                        
  f356  CC0020         LDD #0x20                         
LAB_f359:
  f359  E766           STB 0x6,S                         
  f35b  ED62           STD 0x2,S                         
  f35d  EC64           LDD 0x4,S                         
  f35f  A362           SUBD 0x2,S                        
  f361  ED64           STD 0x4,S                         
  f363  E666           LDB 0x6,S                         
  f365  6F67           CLR 0x7,S                         
  f367  170036         LBSR 0xf3a0                       
  f36a  1F10           TFR X,D                           
  f36c  1E89           EXG A,B                           
  f36e  17002F         LBSR 0xf3a0                       
  f371  1E89           EXG A,B                           
  f373  17002A         LBSR 0xf3a0                       
  f376  5F             CLRB                              
  f377  170026         LBSR 0xf3a0                       
LAB_f37a:
  f37a  E680           LDB ,X+                           
  f37c  170021         LBSR 0xf3a0                       
  f37f  6A66           DEC 0x6,S                         
  f381  26F7           BNE 0xf37a                        
  f383  E667           LDB 0x7,S                         
  f385  50             NEGB                              
  f386  170017         LBSR 0xf3a0                       
  f389  C60D           LDB #0xd                          
  f38b  170047         LBSR 0xf3d5                       
  f38e  C60A           LDB #0xa                          
  f390  170042         LBSR 0xf3d5                       
  f393  EC64           LDD 0x4,S                         
  f395  10830000       CMPD #0x0                         
  f399  26AC           BNE 0xf347                        
  f39b  326A           LEAS 0xa,S                        
  f39d  3526           PULS  A B Y                       
  f39f  39             RTS                               

; ---- function FUN_f3a0
FUN_f3a0:
  f3a0  3404           PSHS  B                           
  f3a2  E66A           LDB 0xa,S                         
  f3a4  EBE4           ADDB ,S                           
  f3a6  E76A           STB 0xa,S                         
  f3a8  E6E4           LDB ,S                            
  f3aa  2002           BRA 0xf3ae                        

; ---- function FUN_f3ac
FUN_f3ac:
  f3ac  3404           PSHS  B                           
LAB_f3ae:
  f3ae  54             LSRB                              
  f3af  54             LSRB                              
  f3b0  54             LSRB                              
  f3b1  54             LSRB                              
LAB_f3b2:
  f3b2  17A5BB         LBSR 0x9970                       
  f3b5  ADB90000       JSR [0x0,Y]                       
  f3b9  2705           BEQ 0xf3c0                        
  f3bb  1791BB         LBSR 0x8579                       
  f3be  20F2           BRA 0xf3b2                        
LAB_f3c0:
  f3c0  E6E4           LDB ,S                            
  f3c2  C40F           ANDB #0xf                         
  f3c4  17A5A9         LBSR 0x9970                       
LAB_f3c7:
  f3c7  ADB90000       JSR [0x0,Y]                       
  f3cb  2705           BEQ 0xf3d2                        
  f3cd  1791A9         LBSR 0x8579                       
  f3d0  20F5           BRA 0xf3c7                        
LAB_f3d2:
  f3d2  3504           PULS  B                           
  f3d4  39             RTS                               

; ---- function FUN_f3d5
FUN_f3d5:
  f3d5  3404           PSHS  B                           
  f3d7  20EE           BRA 0xf3c7                        

; ---- function API_FE26
API_FE26:
  f3d9  3436           PSHS  Y X B A                     
  f3db  3276           LEAS -0xa,S                       
  f3dd  AEE810         LDX 0x10,S                        
  f3e0  10AE81         LDY ,X++                          
  f3e3  AFE810         STX 0x10,S                        
  f3e6  ED62           STD 0x2,S                         
  f3e8  C65C           LDB #0x5c                         
  f3ea  17FFE8         LBSR 0xf3d5                       
LAB_f3ed:
  f3ed  E662           LDB 0x2,S                         
  f3ef  17FFBA         LBSR 0xf3ac                       
  f3f2  E663           LDB 0x3,S                         
  f3f4  17FFB5         LBSR 0xf3ac                       
  f3f7  E662           LDB 0x2,S                         
  f3f9  EB63           ADDB 0x3,S                        
  f3fb  50             NEGB                              
  f3fc  17FFAD         LBSR 0xf3ac                       
  f3ff  C60D           LDB #0xd                          
  f401  17FFD1         LBSR 0xf3d5                       
  f404  C60A           LDB #0xa                          
  f406  17FFCC         LBSR 0xf3d5                       
  f409  326A           LEAS 0xa,S                        
  f40b  3536           PULS  A B X Y                     
  f40d  39             RTS                               

; ---- function API_FE28
API_FE28:
  f40e  3436           PSHS  Y X B A                     
  f410  3276           LEAS -0xa,S                       
  f412  ED62           STD 0x2,S                         
  f414  AEE810         LDX 0x10,S                        
  f417  10AE81         LDY ,X++                          
  f41a  AFE810         STX 0x10,S                        
  f41d  C67C           LDB #0x7c                         
  f41f  17FFB3         LBSR 0xf3d5                       
  f422  20C9           BRA 0xf3ed                        

; ---- function API_FE2C
API_FE2C:
  f424  3436           PSHS  Y X B A                     
  f426  AE66           LDX 0x6,S                         
  f428  10AE81         LDY ,X++                          
  f42b  AF66           STX 0x6,S                         
  f42d  1F98           TFR B,A                           
  f42f  E62B           LDB 0xb,Y                         
  f431  1705EC         LBSR 0xfa20                       
  f434  1F89           TFR A,B                           
  f436  ADB802         JSR [0x2,Y]                       
  f439  1705FE         LBSR 0xfa3a                       
  f43c  3536           PULS  A B X Y                     
  f43e  39             RTS                               

; ---- function FUN_f43f
FUN_f43f:
  f43f  3432           PSHS  Y X A                       
  f441  AE65           LDX 0x5,S                         
  f443  10AE81         LDY ,X++                          
  f446  AF65           STX 0x5,S                         
  f448  1F98           TFR B,A                           
  f44a  E62B           LDB 0xb,Y                         
  f44c  1705D1         LBSR 0xfa20                       
  f44f  1F89           TFR A,B                           
LAB_f451:
  f451  ADB802         JSR [0x2,Y]                       
  f454  17A273         LBSR 0x96ca                       
  f457  2611           BNE 0xf46a                        
  f459  5D             TSTB                              
  f45a  2C02           BGE 0xf45e                        
  f45c  200E           BRA 0xf46c                        
LAB_f45e:
  f45e  A62B           LDA 0xb,Y                         
  f460  B7600B         STA 0x600b                        
  f463  B78052         STA 0x8052                        
  f466  1F98           TFR B,A                           
  f468  20E7           BRA 0xf451                        
LAB_f46a:
  f46a  C6FF           LDB #0xff                         
LAB_f46c:
  f46c  1705CB         LBSR 0xfa3a                       
  f46f  3532           PULS  A X Y                       
  f471  39             RTS                               
SUB_f472:
  f472  C13A           CMPB #0x3a                        
  f474  102700BC       LBEQ 0xf534                       
  f478  C15C           CMPB #0x5c                        
  f47a  2714           BEQ 0xf490                        
  f47c  C17C           CMPB #0x7c                        
  f47e  2738           BEQ 0xf4b8                        
  f480  A726           STA 0x6,Y                         
  f482  AF28           STX 0x8,Y                         
  f484  CCF48A         LDD #0xf48a                       
  f487  ED22           STD 0x2,Y                         
  f489  39             RTS                               
  f48a  .db A6 26 AE 28 20 E2                                ; .&.( .
LAB_f490:
  f490  8D73           BSR 0xf505                        
  f492  1F98           TFR B,A                           
  f494  8D6F           BSR 0xf505                        
  f496  EDA815         STD 0x15,Y                        
  f499  8D6A           BSR 0xf505                        
  f49b  EBA815         ADDB 0x15,Y                       
  f49e  EBA816         ADDB 0x16,Y                       
  f4a1  2605           BNE 0xf4a8                        
  f4a3  ECA815         LDD 0x15,Y                        
  f4a6  8D2C           BSR 0xf4d4                        
LAB_f4a8:
  f4a8  A726           STA 0x6,Y                         
  f4aa  AF28           STX 0x8,Y                         
  f4ac  CCF4B2         LDD #0xf4b2                       
  f4af  ED22           STD 0x2,Y                         
  f4b1  39             RTS                               
  f4b2  .db A6 26 AE 28 20 BA                                ; .&.( .
LAB_f4b8:
  f4b8  8D4B           BSR 0xf505                        
  f4ba  1F98           TFR B,A                           
  f4bc  8D47           BSR 0xf505                        
  f4be  EDA815         STD 0x15,Y                        
  f4c1  8D42           BSR 0xf505                        
  f4c3  EBA815         ADDB 0x15,Y                       
  f4c6  EBA816         ADDB 0x16,Y                       
  f4c9  26DD           BNE 0xf4a8                        
  f4cb  AEA815         LDX 0x15,Y                        
  f4ce  EC84           LDD ,X                            
  f4d0  8D02           BSR 0xf4d4                        
  f4d2  20D4           BRA 0xf4a8                        

; ---- function FUN_f4d4
FUN_f4d4:
  f4d4  3476           PSHS  U Y X B A                   
  f4d6  327E           LEAS -0x2,S                       
  f4d8  EDE4           STD ,S                            
  f4da  EC2C           LDD 0xc,Y                         
  f4dc  AE2E           LDX 0xe,Y                         
  f4de  EEA812         LDU 0x12,Y                        
  f4e1  3420           PSHS  Y                           
  f4e3  10AEA810       LDY 0x10,Y                        
  f4e7  ADF802         JSR [0x2,S]                       
  f4ea  3421           PSHS  Y CC                        
  f4ec  10AE63         LDY 0x3,S                         
  f4ef  EFA812         STU 0x12,Y                        
  f4f2  AF2E           STX 0xe,Y                         
  f4f4  ED2C           STD 0xc,Y                         
  f4f6  3504           PULS  B                           
  f4f8  E7A814         STB 0x14,Y                        
  f4fb  ECE4           LDD ,S                            
  f4fd  EDA810         STD 0x10,Y                        
  f500  3266           LEAS 0x6,S                        
  f502  3576           PULS  A B X Y U                   
  f504  39             RTS                               

; ---- function FUN_f505
FUN_f505:
  f505  A726           STA 0x6,Y                         
  f507  3506           PULS  A B                         
  f509  ED24           STD 0x4,Y                         
  f50b  AF28           STX 0x8,Y                         
  f50d  CCF513         LDD #0xf513                       
  f510  ED22           STD 0x2,Y                         
  f512  39             RTS                               
  f513  .db AE 28 8D 50 26 F2 58 58 58 58 E7 27 AF 28 CC F5  ; .(.P&.XXXX.'.(..
  f523  .db 27 ED 22 39 A6 26 AE 28 8D 3A 26 F0 EA 27 6E B8  ; '."9.&.(.:&..'n.
  f533  .db 04                                               ; .
LAB_f534:
  f534  8DCF           BSR 0xf505                        
  f536  E72A           STB 0xa,Y                         
  f538  8DCB           BSR 0xf505                        
  f53a  1F98           TFR B,A                           
  f53c  8DC7           BSR 0xf505                        
  f53e  1F01           TFR D,X                           
  f540  8DC3           BSR 0xf505                        
  f542  260C           BNE 0xf550                        
LAB_f544:
  f544  8DBF           BSR 0xf505                        
  f546  E780           STB ,X+                           
  f548  6A2A           DEC 0xa,Y                         
  f54a  26F8           BNE 0xf544                        
  f54c  8DB7           BSR 0xf505                        
  f54e  2006           BRA 0xf556                        
LAB_f550:
  f550  8DB3           BSR 0xf505                        
  f552  6A2A           DEC 0xa,Y                         
  f554  26FA           BNE 0xf550                        
LAB_f556:
  f556  A726           STA 0x6,Y                         
  f558  AF28           STX 0x8,Y                         
  f55a  CCF560         LDD #0xf560                       
  f55d  ED22           STD 0x2,Y                         
  f55f  39             RTS                               
  f560  .db A6 26 AE 28 16 FF 0B C1 30 25 15 C1 39 22 04 C0  ; .&.(....0%..9"..
  f570  .db 30 20 0A C1 41 25 09 C1 46 22 05 C0 37 1A 04 39  ; 0 ..A%..F"..7..9
  f580  .db 5F 1C FB 39                                      ; _..9

; ---- function API_FE30
API_FE30:
  f584  3436           PSHS  Y X B A                     
  f586  AE66           LDX 0x6,S                         
  f588  10AE81         LDY ,X++                          
  f58b  AF66           STX 0x6,S                         
  f58d  EDA4           STD ,Y                            
  f58f  30A815         LEAX 0x15,Y                       
  f592  AFA812         STX 0x12,Y                        
  f595  3536           PULS  A B X Y                     
  f597  39             RTS                               

; ---- function API_FE2E
API_FE2E:
  f598  3436           PSHS  Y X B A                     
  f59a  AE66           LDX 0x6,S                         
  f59c  10AE81         LDY ,X++                          
  f59f  AF66           STX 0x6,S                         
  f5a1  CCF472         LDD #0xf472                       
  f5a4  ED22           STD 0x2,Y                         
  f5a6  3536           PULS  A B X Y                     
  f5a8  39             RTS                               

; ---- function API_FE40
API_FE40:
  f5a9  7D6118         TST 0x6118                        
  f5ac  2702           BEQ 0xf5b0                        
  f5ae  8D09           BSR 0xf5b9                        
LAB_f5b0:
  f5b0  39             RTS                               

; ---- function FUN_f5b1
FUN_f5b1:
  f5b1  7D6119         TST 0x6119                        
  f5b4  2702           BEQ 0xf5b8                        
  f5b6  8D01           BSR 0xf5b9                        
LAB_f5b8:
  f5b8  39             RTS                               

; ---- function API_FE3E
API_FE3E:
  f5b9  7D6019         TST 0x6019                        
  f5bc  266D           BNE 0xf62b                        
  f5be  3406           PSHS  B A                         
  f5c0  3420           PSHS  Y                           
  f5c2  327E           LEAS -0x2,S                       
  f5c4  6F61           CLR 0x1,S                         
  f5c6  6D62           TST 0x2,S                         
  f5c8  2A04           BPL 0xf5ce                        
  f5ca  C602           LDB #0x2                          
  f5cc  E761           STB 0x1,S                         
LAB_f5ce:
  f5ce  F6608A         LDB 0x608a                        
  f5d1  C40F           ANDB #0xf                         
  f5d3  CAB0           ORB #0xb0                         
  f5d5  E7E4           STB ,S                            
  f5d7  17A127         LBSR 0x9701                       
  f5da  C663           LDB #0x63                         
  f5dc  EB61           ADDB 0x1,S                        
  f5de  17A120         LBSR 0x9701                       
  f5e1  EC62           LDD 0x2,S                         
  f5e3  58             LSLB                              
  f5e4  49             ROLA                              
  f5e5  1F89           TFR A,B                           
  f5e7  C47F           ANDB #0x7f                        
  f5e9  17A115         LBSR 0x9701                       
  f5ec  E6E4           LDB ,S                            
  f5ee  17A110         LBSR 0x9701                       
  f5f1  C662           LDB #0x62                         
  f5f3  EB61           ADDB 0x1,S                        
  f5f5  17A109         LBSR 0x9701                       
  f5f8  E663           LDB 0x3,S                         
  f5fa  C47F           ANDB #0x7f                        
  f5fc  17A102         LBSR 0x9701                       
  f5ff  E6E4           LDB ,S                            
  f601  17A0FD         LBSR 0x9701                       
  f604  C606           LDB #0x6                          
  f606  17A0F8         LBSR 0x9701                       
  f609  EC64           LDD 0x4,S                         
  f60b  58             LSLB                              
  f60c  49             ROLA                              
  f60d  1F89           TFR A,B                           
  f60f  C47F           ANDB #0x7f                        
  f611  17A0ED         LBSR 0x9701                       
  f614  E6E4           LDB ,S                            
  f616  17A0E8         LBSR 0x9701                       
  f619  C626           LDB #0x26                         
  f61b  17A0E3         LBSR 0x9701                       
  f61e  E665           LDB 0x5,S                         
  f620  C47F           ANDB #0x7f                        
  f622  17A0DC         LBSR 0x9701                       
  f625  3506           PULS  A B                         
  f627  3520           PULS  Y                           
  f629  3506           PULS  A B                         
LAB_f62b:
  f62b  39             RTS                               

; ---- function FUN_f62c
FUN_f62c:
  f62c  3436           PSHS  Y X B A                     
  f62e  3606           PSHU  B A                         
  f630  CC0064         LDD #0x64                         
  f633  3606           PSHU  B A                         
  f635  17C7AD         LBSR 0xbde5                       
  f638  8E0288         LDX #0x288                        
  f63b  17B0C7         LBSR 0xa705                       
  f63e  5D             TSTB                              
  f63f  2645           BNE 0xf686                        
  f641  C6F0           LDB #0xf0                         
  f643  17A0BB         LBSR 0x9701                       
  f646  C67F           LDB #0x7f                         
  f648  17A0B6         LBSR 0x9701                       
  f64b  8E0290         LDX #0x290                        
  f64e  17B0B4         LBSR 0xa705                       
  f651  17A0AD         LBSR 0x9701                       
  f654  C602           LDB #0x2                          
  f656  17A0A8         LBSR 0x9701                       
  f659  C601           LDB #0x1                          
  f65b  17A0A3         LBSR 0x9701                       
  f65e  F6608A         LDB 0x608a                        
  f661  C40F           ANDB #0xf                         
  f663  17A09B         LBSR 0x9701                       
  f666  8604           LDA #0x4                          
  f668  C600           LDB #0x0                          
LAB_f66a:
  f66a  17A094         LBSR 0x9701                       
  f66d  4A             DECA                              
  f66e  26FA           BNE 0xf66a                        
  f670  3706           PULU  A B                         
  f672  58             LSLB                              
  f673  49             ROLA                              
  f674  54             LSRB                              
  f675  17A089         LBSR 0x9701                       
  f678  1F89           TFR A,B                           
  f67a  C47F           ANDB #0x7f                        
  f67c  17A082         LBSR 0x9701                       
  f67f  C6F7           LDB #0xf7                         
  f681  17A07D         LBSR 0x9701                       
  f684  2009           BRA 0xf68f                        
LAB_f686:
  f686  3706           PULU  A B                         
  f688  108E2005       LDY #0x2005                       
  f68c  17FF2A         LBSR 0xf5b9                       
LAB_f68f:
  f68f  F6608A         LDB 0x608a                        
  f692  C40F           ANDB #0xf                         
  f694  CAC0           ORB #0xc0                         
  f696  17A068         LBSR 0x9701                       
  f699  3706           PULU  A B                         
  f69b  17A063         LBSR 0x9701                       
  f69e  35B6           PULS  A B X Y PC                  

; ---- function FUN_f6a0
FUN_f6a0:
  f6a0  3436           PSHS  Y X B A                     
  f6a2  108E029B       LDY #0x29b                        
  f6a6  17B0A9         LBSR 0xa752                       
  f6a9  35B6           PULS  A B X Y PC                  
LAB_f6ab:
  f6ab  CCF6B4         LDD #0xf6b4                       
  f6ae  FD6212         STD 0x6212                        
  f6b1  1600F9         LBRA 0xf7ad                       
  f6b4  .db C1 1C 10 27 00 83 C1 7F 10 26 00 F2 CC F6 C6 16  ; ...'.....&......
  f6c4  .db 00 EF 34 04 34 10 8E 02 90 17 B0 35 35 10 E1 E0  ; ..4.4......55...
  f6d4  .db 10 26 00 DA CC F6 DE 16 00 D7 C1 02 10 26 00 CE  ; .&...........&..
  f6e4  .db CC F6 EA 16 00 CB C1 01 10 26 00 C2 CC F6 F6 16  ; .........&......
  f6f4  .db 00 BF 7D 60 8A 2B 0A C4 0F F1 60 8A 27 03 16 00  ; ..}`.+....`.'...
  f704  .db AD C6 04 F7 62 11 CC F7 10 16 00 A5 7D 62 11 27  ; ....b.......}b.'
  f714  .db 09 7A 62 11 CC F7 10 16 00 97 4F 17 FF 7E CC F7  ; .zb.......O..~..
  f724  .db 28 16 00 8D CC F6 B4 16 00 87 20 7D              ; (......... }

; ---- function FUN_f730
FUN_f730:
  f730  3406           PSHS  B A                         
  f732  7D6118         TST 0x6118                        
  f735  2703           BEQ 0xf73a                        
  f737  17FEF2         LBSR 0xf62c                       
LAB_f73a:
  f73a  3506           PULS  A B                         
  f73c  39             RTS                               
  f73d  .db 7D 61 36 10 27 00 6E CC F7 4A 16 00 6B 17 FC F2  ; }a6.'.n..J..k...
  f74d  .db 68 A0 E7 62 F6 61 02 F7 60 0B F7 80 52 CC F7 3D  ; h..b.a..`...R..=
  f75d  .db FD 62 12                                         ; .b.

; ---- function FUN_f760
FUN_f760:
  f760  E662           LDB 0x2,S                         
  f762  3262           LEAS 0x2,S                        
  f764  160004         LBRA 0xf76b                       

; ---- function FUN_f767
FUN_f767:
  f767  3402           PSHS  A                           
  f769  3404           PSHS  B                           
LAB_f76b:
  f76b  5D             TSTB                              
  f76c  2B06           BMI 0xf774                        
  f76e  AD9F6212       JSR [0x6212]                      
  f772  2039           BRA 0xf7ad                        
LAB_f774:
  f774  E6E4           LDB ,S                            
  f776  C1FF           CMPB #0xff                        
  f778  10270031       LBEQ 0xf7ad                       
  f77c  C1F0           CMPB #0xf0                        
  f77e  1027FF29       LBEQ 0xf6ab                       
  f782  C4F0           ANDB #0xf0                        
  f784  C1C0           CMPB #0xc0                        
  f786  102700B3       LBEQ 0xf83d                       
  f78a  C1B0           CMPB #0xb0                        
  f78c  2619           BNE 0xf7a7                        
  f78e  F6608A         LDB 0x608a                        
  f791  2B0C           BMI 0xf79f                        
  f793  C40F           ANDB #0xf                         
  f795  A6E4           LDA ,S                            
  f797  840F           ANDA #0xf                         
  f799  3402           PSHS  A                           
  f79b  E1E0           CMPB ,S+                          
  f79d  2608           BNE 0xf7a7                        
LAB_f79f:
  f79f  CCF7B9         LDD #0xf7b9                       
  f7a2  FD6212         STD 0x6212                        
  f7a5  2006           BRA 0xf7ad                        
LAB_f7a7:
  f7a7  CCFFE8         LDD #0xffe8                       
  f7aa  FD6212         STD 0x6212                        
LAB_f7ad:
  f7ad  3504           PULS  B                           
  f7af  3502           PULS  A                           
  f7b1  39             RTS                               

; ---- function FUN_f7b2
FUN_f7b2:
  f7b2  CCFFE8         LDD #0xffe8                       
  f7b5  FD6212         STD 0x6212                        
  f7b8  39             RTS                               
  f7b9  .db C1 63 27 2B C1 62 27 3E C1 65 27 17 C1 64 27 13  ; .c'+.b'>.e'..d'.
  f7c9  .db C1 06 27 40 C1 26 27 53 C1 07 10 27 00 86 CC F7  ; ..'@.&'S...'....
  f7d9  .db E1 20 08 7F 62 14 20 F6 CC F7 B9 FD 62 12 39 CC  ; . ..b. .....b.9.
  f7e9  .db F7 ED 20 F7 FC 61 03 58 A6 62 44 56 FD 61 03 86  ; .. ..a.X.bDV.a..
  f7f9  .db FF B7 62 14 20 E2 CC F8 04 20 E0 FC 61 03 C4 80  ; ..b. .... ..a...
  f809  .db EA 62 20 E8 7D 62 14 27 C5 CC F8 17 20 CD FC 60  ; .b .}b.'.... ..`
  f819  .db F9 58 A6 62 44 56 FD 60 F9 20 BD 7D 62 14 27 AE  ; .X.bDV.`. .}b.'.
  f829  .db CC F8 2E 20 B6 FC 60 F9 C4 80 EA 62 FD 60 F9 BD  ; ... ..`....b.`..
  f839  .db F8 68 20 A4                                      ; .h .
LAB_f83d:
  f83d  7D608A         TST 0x608a                        
  f840  2B0B           BMI 0xf84d                        
  f842  E6E4           LDB ,S                            
  f844  C40F           ANDB #0xf                         
  f846  F1608A         CMPB 0x608a                       
  f849  1026FF5A       LBNE 0xf7a7                       
LAB_f84d:
  f84d  CCF856         LDD #0xf856                       
  f850  FD6212         STD 0x6212                        
  f853  16FF57         LBRA 0xf7ad                       
  f856  F7608917AB2C   addr[3]                           
  f85c  .db 39 CC F8 62 20 82 17 AD A0 16 FF 79 34 36 FC 61  ; 9..b ......y46.a
  f86c  .db 03 85 20 27 7C 85 1F 27 03 16 00 B5 C5 10 26 07  ; .. '|..'......&.
  f87c  .db 7D 61 1B 27 29 20 05 7D 61 1A 27 22 C4 1F 58 8E  ; }a.') .}a.'"..X.
  f88c  .db F8 AD 30 85 F6 60 19 34 04 C6 FF F7 60 19 FC 60  ; ..0..`.4....`..`
  f89c  .db F9 17 00 90 FD 60 F9 AD 94 35 04 F7 60 19 16 00  ; .....`...5..`...
  f8ac  .db 80 AA 51 AA 8B AA B0 AA D5 9A E5 F6 A0 FF E8 FF  ; ..Q.............
  f8bc  .db E8 FF E8 FF E8 FF E8 FF E8 FF E8 FF E8 FF E8 FF  ; ................
  f8cc  .db E8 E0 B7 E0 BD E0 C3 E0 C9 E0 F5 E0 FB E1 01 E1  ; ................
  f8dc  .db 07 E2 3F E6 92 E5 0E E7 DE FF E8 FF E8 FF E8 FF  ; ..?.............
  f8ec  .db E8 7D 61 1A 27 3B FC 61 03 10 B3 60 F7 24 32 FC  ; .}a.';.a...`.$2.
  f8fc  .db 61 03 58 49 F3 60 F5 27 28 F3 60 0D 1F 01 EC 84  ; a.XI.`.'(.`.....
  f90c  .db F3 60 0D 1F 01 F6 60 19 34 04 C6 FF F7 60 19 F7  ; .`....`.4....`..
  f91c  .db 60 FB FC 60 F9 8D 0D FD 60 F9 AD 84 35 04 F7 60  ; `..`....`...5..`
  f92c  .db 19 35 36 39 85 20 27 02 8A C0 39                 ; .569. '...9

; ---- function FUN_f937
FUN_f937:
  f937  3406           PSHS  B A                         
  f939  7F6214         CLR 0x6214                        
  f93c  CC0000         LDD #0x0                          
  f93f  FD60F5         STD 0x60f5                        
  f942  FD60F7         STD 0x60f7                        
  f945  3506           PULS  A B                         
  f947  39             RTS                               

; ---- function FUN_f948
FUN_f948:
  f948  8D01           BSR 0xf94b                        
  f94a  39             RTS                               

; ---- function API_FE50
API_FE50:
  f94b  3436           PSHS  Y X B A                     
  f94d  C6A0           LDB #0xa0                         
  f94f  1700CE         LBSR 0xfa20                       
  f952  7D029A         TST 0x029a                        
  f955  271A           BEQ 0xf971                        
  f957  F60293         LDB 0x0293                        
  f95a  F76119         STB 0x6119                        
  f95d  F60292         LDB 0x0292                        
  f960  F76118         STB 0x6118                        
  f963  F60295         LDB 0x0295                        
  f966  F7611B         STB 0x611b                        
  f969  F60294         LDB 0x0294                        
  f96c  F7611A         STB 0x611a                        
  f96f  200E           BRA 0xf97f                        
LAB_f971:
  f971  C600           LDB #0x0                          
  f973  F76119         STB 0x6119                        
  f976  F76118         STB 0x6118                        
  f979  F7611A         STB 0x611a                        
  f97c  F7611A         STB 0x611a                        
LAB_f97f:
  f97f  1700B8         LBSR 0xfa3a                       
  f982  3536           PULS  A B X Y                     
  f984  39             RTS                               

; ---- function API_FE7A
API_FE7A:
  f985  3406           PSHS  B A                         
  f987  1F89           TFR A,B                           
  f989  179E47         LBSR 0x97d3                       
  f98c  6D61           TST 0x1,S                         
  f98e  2604           BNE 0xf994                        
  f990  C64E           LDB #0x4e                         
  f992  2002           BRA 0xf996                        
LAB_f994:
  f994  C659           LDB #0x59                         
LAB_f996:
  f996  179D8E         LBSR 0x9727                       
  f999  3506           PULS  A B                         
  f99b  39             RTS                               

; ---- function FUN_f99c
FUN_f99c:
  f99c  3406           PSHS  B A                         
  f99e  1F89           TFR A,B                           
  f9a0  179E30         LBSR 0x97d3                       
  f9a3  6D61           TST 0x1,S                         
  f9a5  2609           BNE 0xf9b0                        
  f9a7  179E3A         LBSR 0x97e4                        ; inline[API_FC38]: "Off"
  f9aa  4F666600       char[4] "Off"                     
LAB_f9ae:
  f9ae  2007           BRA 0xf9b7                        
LAB_f9b0:
  f9b0  179E31         LBSR 0x97e4                        ; inline[API_FC38]: "On "
  f9b3  4F6E2000       char[4] "On "                     
LAB_f9b7:
  f9b7  3506           PULS  A B                         
  f9b9  39             RTS                               

; ---- function API_FE7C
API_FE7C:
  f9ba  8D40           BSR 0xf9fc                         ; inline[API_FE5E]: $F9D3 $F9C1
  f9bc  F9D3           dw F9D3h                          
  f9be  F9C1           dw F9C1h                          
LAB_f9c0:
  f9c0  39             RTS                               
  f9c1  .db 68 61 73 20 62 65 65 6E 20 44 69 73 61 62 6C 65  ; has been Disable
  f9d1  .db 64 00                                            ; d.
  f9d3  686173206265.. ds "has been Enabled "            

; ---- function API_FE7E
API_FE7E:
  f9e5  5D             TSTB                              
  f9e6  2703           BEQ 0xf9eb                        
  f9e8  5F             CLRB                              
  f9e9  2002           BRA 0xf9ed                        
LAB_f9eb:
  f9eb  C6FF           LDB #0xff                         
LAB_f9ed:
  f9ed  39             RTS                               
PTR_ARRAY_f9ee:
  f9ee  8D0CF9F5F9F8   addr[3]                            ; inline[API_FE5E]: $F9F5 $F9F8
  f9f4  .db 39                                               ; 9

; ---- function FUN_f9f5
FUN_f9f5:
  f9f5  4F             CLRA                              
  f9f6  6E00           JMP 0x0,X                         

; ---- function FUN_f9f8
FUN_f9f8:
  f9f8  4F             CLRA                              
  f9f9  6666           ROR 0x6,S                         
  f9fb  .db 00                                               ; .

; ---- function API_FE5E
API_FE5E:
  f9fc  3436           PSHS  Y X B A                     
  f9fe  AE66           LDX 0x6,S                         
  fa00  3104           LEAY 0x4,X                        
  fa02  10AF66         STY 0x6,S                         
  fa05  5D             TSTB                              
  fa06  2604           BNE 0xfa0c                        
  fa08  EC02           LDD 0x2,X                         
  fa0a  2002           BRA 0xfa0e                        
LAB_fa0c:
  fa0c  EC84           LDD ,X                            
LAB_fa0e:
  fa0e  3606           PSHU  B A                         
  fa10  3536           PULS  A B X Y                     
  fa12  39             RTS                               

; ---- function FUN_fa13
FUN_fa13:
  fa13  3402           PSHS  A                           
  fa15  F660B9         LDB 0x60b9                        
  fa18  860A           LDA #0xa                          
  fa1a  3D             MUL                               
  fa1b  CB28           ADDB #0x28                        
  fa1d  3502           PULS  A                           
  fa1f  39             RTS                               

;; Kernel API slot $FC9C: push current bank on caller stack, select bank B

; ---- function BankPushSelect
BankPushSelect:
  fa20  3402           PSHS  A                           
  fa22  3403           PSHS  A CC                        
  fa24  A663           LDA 0x3,S                         
  fa26  A762           STA 0x2,S                         
  fa28  A664           LDA 0x4,S                         
  fa2a  A763           STA 0x3,S                         
  fa2c  B6600B         LDA 0x600b                        
  fa2f  A764           STA 0x4,S                         
  fa31  F7600B         STB 0x600b                        
  fa34  F78052         STB 0x8052                        
  fa37  3503           PULS CC A                         
  fa39  39             RTS                               

;; Kernel API slot $FC9E: pop bank pushed by BankPushSelect

; ---- function BankPop
BankPop:
  fa3a  3402           PSHS  A                           
  fa3c  A663           LDA 0x3,S                         
  fa3e  B7600B         STA 0x600b                        
  fa41  B78052         STA 0x8052                        
  fa44  A662           LDA 0x2,S                         
  fa46  A763           STA 0x3,S                         
  fa48  A661           LDA 0x1,S                         
  fa4a  A762           STA 0x2,S                         
  fa4c  A6E1           LDA ,S++                          
  fa4e  39             RTS                               

; ---- function API_FCA0
API_FCA0:
  fa4f  3403           PSHS  A CC                        
  fa51  B6600B         LDA 0x600b                        
  fa54  3402           PSHS  A                           
  fa56  B6600C         LDA 0x600c                        
  fa59  B7600B         STA 0x600b                        
  fa5c  B78052         STA 0x8052                        
  fa5f  E684           LDB ,X                            
  fa61  3502           PULS  A                           
  fa63  B7600B         STA 0x600b                        
  fa66  B78052         STA 0x8052                        
  fa69  3503           PULS CC A                         
  fa6b  39             RTS                               

; ---- function API_FCA2
API_FCA2:
  fa6c  3403           PSHS  A CC                        
  fa6e  B6600B         LDA 0x600b                        
  fa71  3402           PSHS  A                           
  fa73  B6600C         LDA 0x600c                        
  fa76  B7600B         STA 0x600b                        
  fa79  B78052         STA 0x8052                        
  fa7c  E7A4           STB ,Y                            
  fa7e  3502           PULS  A                           
  fa80  B7600B         STA 0x600b                        
  fa83  B78052         STA 0x8052                        
  fa86  3503           PULS CC A                         
  fa88  39             RTS                               

; ---- function API_FDDC
API_FDDC:
  fa89  3447           PSHS  U B A CC                    
  fa8b  327F           LEAS -0x1,S                       
  fa8d  1F23           TFR Y,U                           
  fa8f  1F02           TFR D,Y                           
  fa91  B6600B         LDA 0x600b                        
  fa94  A7E4           STA ,S                            
LAB_fa96:
  fa96  B6600C         LDA 0x600c                        
  fa99  B7600B         STA 0x600b                        
  fa9c  B78052         STA 0x8052                        
  fa9f  E680           LDB ,X+                           
  faa1  A6E4           LDA ,S                            
  faa3  B7600B         STA 0x600b                        
  faa6  B78052         STA 0x8052                        
  faa9  E7C0           STB ,U+                           
  faab  313F           LEAY -0x1,Y                       
  faad  26E7           BNE 0xfa96                        
  faaf  1F32           TFR U,Y                           
  fab1  3261           LEAS 0x1,S                        
  fab3  3547           PULS CC A B U                     
  fab5  39             RTS                               

; ---- function API_FDDE
API_FDDE:
  fab6  3447           PSHS  U B A CC                    
  fab8  327F           LEAS -0x1,S                       
  faba  1F23           TFR Y,U                           
  fabc  1F02           TFR D,Y                           
  fabe  B6600B         LDA 0x600b                        
  fac1  A7E4           STA ,S                            
LAB_fac3:
  fac3  A6E4           LDA ,S                            
  fac5  B7600B         STA 0x600b                        
  fac8  B78052         STA 0x8052                        
  facb  E680           LDB ,X+                           
  facd  B6600C         LDA 0x600c                        
  fad0  B7600B         STA 0x600b                        
  fad3  B78052         STA 0x8052                        
  fad6  E7C0           STB ,U+                           
  fad8  313F           LEAY -0x1,Y                       
  fada  26E7           BNE 0xfac3                        
  fadc  A6E4           LDA ,S                            
  fade  B7600B         STA 0x600b                        
  fae1  B78052         STA 0x8052                        
  fae4  1F32           TFR U,Y                           
  fae6  3261           LEAS 0x1,S                        
  fae8  3547           PULS CC A B U                     
  faea  39             RTS                               

; ---- function API_FE4E
API_FE4E:
  faeb  3404           PSHS  B                           
  faed  E663           LDB 0x3,S                         
  faef  17FF2E         LBSR 0xfa20                       
  faf2  E661           LDB 0x1,S                         
  faf4  ADF805         JSR [0x5,S]                       
  faf7  17FF40         LBSR 0xfa3a                       
  fafa  3401           PSHS  CC                          
  fafc  E764           STB 0x4,S                         
  fafe  E663           LDB 0x3,S                         
  fb00  E766           STB 0x6,S                         
  fb02  E662           LDB 0x2,S                         
  fb04  E765           STB 0x5,S                         
  fb06  E6E4           LDB ,S                            
  fb08  E763           STB 0x3,S                         
  fb0a  3263           LEAS 0x3,S                        
  fb0c  3585           PULS CC B PC                      

; ---- function FUN_fb0e
FUN_fb0e:
  fb0e  3436           PSHS  Y X B A                     
  fb10  335B           LEAU -0x5,U                       
  fb12  8E0000         LDX #0x0                          
  fb15  108E0000       LDY #0x0                          
LAB_fb19:
  fb19  6F42           CLR 0x2,U                         
  fb1b  6F43           CLR 0x3,U                         
LAB_fb1d:
  fb1d  AC47           CMPX 0x7,U                        
  fb1f  272E           BEQ 0xfb4f                        
  fb21  8D36           BSR 0xfb59                        
  fb23  260A           BNE 0xfb2f                        
  fb25  6C42           INC 0x2,U                         
  fb27  861F           LDA #0x1f                         
  fb29  A142           CMPA 0x2,U                        
  fb2b  26F0           BNE 0xfb1d                        
  fb2d  2020           BRA 0xfb4f                        
LAB_fb2f:
  fb2f  AFC4           STX ,U                            
LAB_fb31:
  fb31  6C43           INC 0x3,U                         
  fb33  8607           LDA #0x7                          
  fb35  A143           CMPA 0x3,U                        
  fb37  2716           BEQ 0xfb4f                        
  fb39  AC47           CMPX 0x7,U                        
  fb3b  2712           BEQ 0xfb4f                        
  fb3d  8D1A           BSR 0xfb59                        
  fb3f  26F0           BNE 0xfb31                        
  fb41  8D23           BSR 0xfb66                        
  fb43  AC47           CMPX 0x7,U                        
  fb45  270E           BEQ 0xfb55                        
  fb47  6F43           CLR 0x3,U                         
  fb49  8601           LDA #0x1                          
  fb4b  A742           STA 0x2,U                         
  fb4d  20CE           BRA 0xfb1d                        
LAB_fb4f:
  fb4f  8D15           BSR 0xfb66                        
  fb51  AC47           CMPX 0x7,U                        
  fb53  26C4           BNE 0xfb19                        
LAB_fb55:
  fb55  334D           LEAU 0xd,U                        
  fb57  35B6           PULS  A B X Y PC                  

; ---- function FUN_fb59
FUN_fb59:
  fb59  ADD809         JSR [0x9,U]                       
  fb5c  E744           STB 0x4,U                         
  fb5e  ADD80B         JSR [0xb,U]                       
  fb61  3001           LEAX 0x1,X                        
  fb63  E144           CMPB 0x4,U                        
  fb65  39             RTS                               

; ---- function FUN_fb66
FUN_fb66:
  fb66  3410           PSHS  X                           
  fb68  E642           LDB 0x2,U                         
  fb6a  58             LSLB                              
  fb6b  58             LSLB                              
  fb6c  58             LSLB                              
  fb6d  EA43           ORB 0x3,U                         
  fb6f  ADD805         JSR [0x5,U]                       
  fb72  AEC4           LDX ,U                            
  fb74  301F           LEAX -0x1,X                       
  fb76  A643           LDA 0x3,U                         
LAB_fb78:
  fb78  8100           CMPA #0x0                         
  fb7a  270D           BEQ 0xfb89                        
  fb7c  ADD80B         JSR [0xb,U]                       
  fb7f  ADD805         JSR [0x5,U]                       
  fb82  3001           LEAX 0x1,X                        
  fb84  3121           LEAY 0x1,Y                        
  fb86  4A             DECA                              
  fb87  20EF           BRA 0xfb78                        
LAB_fb89:
  fb89  3590           PULS  X PC                        

; ---- function FUN_fb8b
FUN_fb8b:
  fb8b  3436           PSHS  Y X B A                     
  fb8d  335E           LEAU -0x2,U                       
  fb8f  8E0000         LDX #0x0                          
  fb92  108E0000       LDY #0x0                          
LAB_fb96:
  fb96  ADD802         JSR [0x2,U]                       
  fb99  262C           BNE 0xfbc7                        
  fb9b  3121           LEAY 0x1,Y                        
  fb9d  8D2C           BSR 0xfbcb                        
LAB_fb9f:
  fb9f  6DC4           TST ,U                            
  fba1  270E           BEQ 0xfbb1                        
  fba3  ADD804         JSR [0x4,U]                       
  fba6  ADD806         JSR [0x6,U]                       
  fba9  261C           BNE 0xfbc7                        
  fbab  3001           LEAX 0x1,X                        
  fbad  6AC4           DEC ,U                            
  fbaf  20EE           BRA 0xfb9f                        
LAB_fbb1:
  fbb1  6D41           TST 0x1,U                         
  fbb3  27E1           BEQ 0xfb96                        
  fbb5  ADD802         JSR [0x2,U]                       
  fbb8  260D           BNE 0xfbc7                        
  fbba  3121           LEAY 0x1,Y                        
  fbbc  ADD806         JSR [0x6,U]                       
  fbbf  2606           BNE 0xfbc7                        
  fbc1  3001           LEAX 0x1,X                        
  fbc3  6A41           DEC 0x1,U                         
  fbc5  20EA           BRA 0xfbb1                        
LAB_fbc7:
  fbc7  3348           LEAU 0x8,U                        
  fbc9  35B6           PULS  A B X Y PC                  

; ---- function FUN_fbcb
FUN_fbcb:
  fbcb  3436           PSHS  Y X B A                     
  fbcd  1F98           TFR B,A                           
  fbcf  C407           ANDB #0x7                         
  fbd1  E741           STB 0x1,U                         
  fbd3  44             LSRA                              
  fbd4  44             LSRA                              
  fbd5  44             LSRA                              
  fbd6  A7C4           STA ,U                            
  fbd8  35B6           PULS  A B X Y PC                  

; ---- function FUN_fbda
FUN_fbda:
  fbda  3436           PSHS  Y X B A                     
  fbdc  F6600B         LDB 0x600b                        
  fbdf  F761A6         STB 0x61a6                        
  fbe2  178E97         LBSR 0x8a7c                        ; inline[API_FD26]: $0008 $6151
  fbe5  0008           dw 8h                             
  fbe7  6151           dw 6151h                          
LAB_fbe9:
  fbe9  35B6           PULS  A B X Y PC                  

; ---- function API_FC86
API_FC86:
  fbeb  178E8E         LBSR 0x8a7c                        ; inline[API_FD26]: $000A $6151
  fbee  000A           dw Ah                             
  fbf0  6151           dw 6151h                          
LAB_fbf2:
  fbf2  39             RTS                               

; ---- function FUN_fbf3
FUN_fbf3:
  fbf3  3416           PSHS  X B A                       
  fbf5  8E028C         LDX #0x28c                        
  fbf8  17AB0A         LBSR 0xa705                       
  fbfb  F7608A         STB 0x608a                        
  fbfe  3596           PULS  A B X PC                    
KernelApiTable:
  fc00  FFE9885D8870.. addr[256]                         
KernelApiTable2:
  fe00  EBE3EC1CEDA8.. addr[64]                          
PTR_ARRAY_fe80:
  fe80  FA13A7BAA7D2.. addr[7]                           
DAT_fe8e:
  fe8e  F9EE           undefined2 F9EEh                  
DAT_fe90:
  fe90  9CDD           undefined2 9CDDh                  
PTR_ARRAY_fe92:
  fe92  8F3B8B938BA8.. addr[8]                           
DAT_fea2:
  fea2  8FE4           undefined2 8FE4h                  
  fea4  91018DB5DD9B.. addr[22]                          
DAT_fed0:
  fed0  A2F1           undefined2 A2F1h                  

;; Kernel API slot $FCFE: inline ptr to ring buffer descriptor

; ---- function RingBufInit
RingBufInit:
  fed2  3436           PSHS  Y X B A                     
  fed4  AE66           LDX 0x6,S                         
  fed6  10AE81         LDY ,X++                          
  fed9  AF66           STX 0x6,S                         
  fedb  EDA4           STD ,Y                            
  fedd  3028           LEAX 0x8,Y                        
  fedf  AF22           STX 0x2,Y                         
  fee1  AF24           STX 0x4,Y                         
  fee3  6F27           CLR 0x7,Y                         
  fee5  86FF           LDA #0xff                         
  fee7  A726           STA 0x6,Y                         
  fee9  3536           PULS  A B X Y                     
  feeb  39             RTS                               

;; Kernel API slot $FD00: inline descriptor; B = byte

; ---- function RingBufPut
RingBufPut:
  feec  3436           PSHS  Y X B A                     
  feee  AE66           LDX 0x6,S                         
  fef0  10AE81         LDY ,X++                          
  fef3  AF66           STX 0x6,S                         
  fef5  6D27           TST 0x7,Y                         
  fef7  2623           BNE 0xff1c                        
  fef9  AE22           LDX 0x2,Y                         
  fefb  E780           STB ,X+                           
  fefd  3401           PSHS  CC                          
  feff  1A50           ORCC #0x50                        
  ff01  AF22           STX 0x2,Y                         
  ff03  1F20           TFR Y,D                           
  ff05  E3A4           ADDD ,Y                           
  ff07  10A322         CMPD 0x2,Y                        
  ff0a  2604           BNE 0xff10                        
  ff0c  3028           LEAX 0x8,Y                        
  ff0e  AF22           STX 0x2,Y                         
LAB_ff10:
  ff10  AC24           CMPX 0x4,Y                        
  ff12  2604           BNE 0xff18                        
  ff14  C6FF           LDB #0xff                         
  ff16  E727           STB 0x7,Y                         
LAB_ff18:
  ff18  3501           PULS CC                           
  ff1a  6F26           CLR 0x6,Y                         
LAB_ff1c:
  ff1c  3536           PULS  A B X Y                     
  ff1e  39             RTS                               

;; Kernel API slot $FD02: inline descriptor; B = byte

; ---- function RingBufGet
RingBufGet:
  ff1f  3432           PSHS  Y X A                       
  ff21  AE65           LDX 0x5,S                         
  ff23  10AE81         LDY ,X++                          
  ff26  AF65           STX 0x5,S                         
  ff28  6D26           TST 0x6,Y                         
  ff2a  2623           BNE 0xff4f                        
  ff2c  AE24           LDX 0x4,Y                         
  ff2e  E680           LDB ,X+                           
  ff30  3405           PSHS  B CC                        
  ff32  1A50           ORCC #0x50                        
  ff34  AF24           STX 0x4,Y                         
  ff36  1F20           TFR Y,D                           
  ff38  E3A4           ADDD ,Y                           
  ff3a  10A324         CMPD 0x4,Y                        
  ff3d  2604           BNE 0xff43                        
  ff3f  3028           LEAX 0x8,Y                        
  ff41  AF24           STX 0x4,Y                         
LAB_ff43:
  ff43  AC22           CMPX 0x2,Y                        
  ff45  2604           BNE 0xff4b                        
  ff47  C6FF           LDB #0xff                         
  ff49  E726           STB 0x6,Y                         
LAB_ff4b:
  ff4b  3505           PULS CC B                         
LAB_ff4d:
  ff4d  6F27           CLR 0x7,Y                         
LAB_ff4f:
  ff4f  3532           PULS  A X Y                       
  ff51  39             RTS                               
  ff52  .db E0 00 C0 00 C1 00 A0 03 E2 00 E3 00 00 00 10 00  ; ................
  ff62  .db 20 00 30 00 01 00 11 00 21 00 31 00 02 00 12 00  ;  .0.....!.1.....
  ff72  .db 22 00 32 00 03 00 13 00 23 00 33 00 04           ; ".2.....#.3..
DAT_ff7f:
  ff7f  00             ?? 00h                            
  ff80  .db 14 00 24 00 34                                   ; ..$.4

; ---- function FUN_ff85
FUN_ff85:
  ff85  0005           NEG <0x5                          
  ff87  0015           NEG <0x15                         
  ff89  0025           NEG <0x25                         
  ff8b  0035           NEG <0x35                         
  ff8d  0006           NEG <0x6                          
  ff8f  0016           NEG <0x16                         
  ff91  0026           NEG <0x26                         
  ff93  0036           NEG <0x36                         
  ff95  0007           NEG <0x7                          
  ff97  0017           NEG <0x17                         
  ff99  0027           NEG <0x27                         
  ff9b  0037           NEG <0x37                         
  ff9d  0008           NEG <0x8                          
  ff9f  0018           NEG <0x18                         
  ffa1  0028           NEG <0x28                         
  ffa3  0038           NEG <0x38                         
  ffa5  0009           NEG <0x9                          
  ffa7  0019           NEG <0x19                         
  ffa9  0029           NEG <0x29                         
  ffab  0039           NEG <0x39                         
  ffad  .db 00                                               ; .

; ---- function FUN_ffae
FUN_ffae:
  ffae  0A00           DEC <0x0                          
  ffb0  1A00           ORCC #0x0                         
  ffb2  2A00           BPL 0xffb4                        
LAB_ffb4:
  ffb4  3A             ABX                               
  ffb5  000B           NEG <0xb                          
  ffb7  001B           NEG <0x1b                         
  ffb9  002B           NEG <0x2b                         
  ffbb  003B           NEG <0x3b                         
  ffbd  000C           NEG <0xc                          
  ffbf  001C           NEG <0x1c                         
  ffc1  002C           NEG <0x2c                         
  ffc3  003C           NEG <0x3c                         
  ffc5  000D           NEG <0xd                          
  ffc7  001D           NEG <0x1d                         

; ---- function FUN_ffc9
FUN_ffc9:
  ffc9  002D           NEG <0x2d                         
  ffcb  003D           NEG <0x3d                         
  ffcd  000E           NEG <0xe                          
  ffcf  001E           NEG <0x1e                         
  ffd1  002E           NEG <0x2e                         
  ffd3  003E           NEG <0x3e                         
  ffd5  000F           NEG <0xf                          
  ffd7  001F           NEG <0x1f                         
  ffd9  002F           NEG <0x2f                         
  ffdb  003F           NEG <0x3f                         
  ffdd  00FF           NEG <0xff                         
  ffdf  FFFFFF         STU 0xffff                        
LAB_ffe2:
  ffe2  0000           NEG <0x0                          
  ffe4  FFFFFF         STU 0xffff                        
DAT_ffe7:
  ffe7  FF             ?? FFh                            

; ---- function API_FD80
API_FD80:
  ffe8  39             RTS                               

; ---- function API_FC00
API_FC00:
  ffe9  20FE           BRA 0xffe9                        
DAT_ffeb:
  ffeb  FF             ?? FFh                            
DAT_ffec:
  ffec  FF             ?? FFh                            
DAT_ffed:
  ffed  FF             ?? FFh                            
DAT_ffee:
  ffee  00             ?? 00h                            
DAT_ffef:
  ffef  D9             ?? D9h                            
VEC_RESERVED:
  fff0  0000           addr 0000                         
VEC_SWI3:
  fff2  67C0           addr 67c0                         
VEC_SWI2:
  fff4  6780           addr 6780                         
VEC_FIRQ:
  fff6  8848           addr 8848                         
VEC_IRQ:
  fff8  85A4           addr 85a4                         
VEC_SWI:
  fffa  6700           addr 6700                         
VEC_NMI:
  fffc  87F6           addr 87f6                         
VEC_RESET:
  fffe  8400           addr 8400                         
